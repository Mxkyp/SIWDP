#!/usr/bin/env bash
# Convert a Markdown file to PDF: Markdown -> HTML (python-markdown via uvx) -> PDF (headless Chromium).
# Usage: ./build_pdf.sh [input.md] [output.pdf]
#   defaults: sprawozdanie.md -> sprawozdanie.pdf
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

IN="${1:-sprawozdanie.md}"
OUT="${2:-${IN%.md}.pdf}"
[[ -f "$IN" ]] || { echo "error: '$IN' not found" >&2; exit 1; }

OUT_ABS="$(readlink -f "$(dirname "$OUT")")/$(basename "$OUT")"
BASE_DIR="$(readlink -f "$(dirname "$IN")")"
TITLE="$(grep -m1 '^# ' "$IN" | sed 's/^# //' || true)"
TITLE="${TITLE:-$(basename "${IN%.md}")}"

# Pick a Chromium: native binary first, then Flatpak.
if command -v chromium-browser >/dev/null; then CHROME=(chromium-browser)
elif command -v chromium >/dev/null; then CHROME=(chromium)
elif command -v google-chrome >/dev/null; then CHROME=(google-chrome)
elif flatpak info org.chromium.Chromium >/dev/null 2>&1; then CHROME=(flatpak run org.chromium.Chromium)
elif flatpak info io.github.ungoogled_software.ungoogled_chromium >/dev/null 2>&1; then
  CHROME=(flatpak run io.github.ungoogled_software.ungoogled_chromium)
else
  echo "error: no Chromium found" >&2; exit 1
fi
command -v uvx >/dev/null || { echo "error: uvx not found (install uv)" >&2; exit 1; }

# Temporary HTML lives next to the input: the Flatpak sandbox can't read /tmp.
TMP_HTML="$BASE_DIR/.$(basename "${IN%.md}")_build.html"
trap 'rm -f "$TMP_HTML"' EXIT

{
cat <<EOF
<!doctype html><html lang="pl"><head><meta charset="utf-8">
<base href="file://$BASE_DIR/">
<title>$TITLE</title>
<style>
@page{size:A4;margin:18mm 16mm}
body{font-family:"DejaVu Sans",Arial,sans-serif;font-size:11pt;line-height:1.45;color:#111}
h1{font-size:22pt;border-bottom:2px solid #333;padding-bottom:4px}
h2{font-size:15pt;margin-top:1.4em;break-after:avoid}
img{max-width:100%;display:block;margin:8px auto;break-inside:avoid}
table{border-collapse:collapse;margin:8px 0}
td,th{border:1px solid #999;padding:4px 8px}
a{color:#1a4fa0;text-decoration:none}
code{background:#f2f2f2;padding:1px 3px;border-radius:3px}
</style></head><body>
EOF
uvx -q --from markdown markdown_py -x tables -x toc -x fenced_code -x md_in_html -o html "$IN"
echo '</body></html>'
} > "$TMP_HTML"

# Warn about images referenced in the Markdown that don't exist.
grep -oP '!\[[^]]*\]\(\K[^)]+' "$IN" | while read -r img; do
  [[ -f "$BASE_DIR/$img" ]] || echo "warning: missing image '$img'" >&2
done

"${CHROME[@]}" --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$OUT_ABS" "file://$TMP_HTML" 2>/dev/null || true

[[ -s "$OUT_ABS" && "$OUT_ABS" -nt "$TMP_HTML" ]] || { echo "error: PDF was not generated" >&2; exit 1; }
echo "PDF written: $OUT_ABS"
