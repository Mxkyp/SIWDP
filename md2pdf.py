#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = [
#     "markdown>=3.5",
#     "weasyprint>=62",
# ]
# ///
"""Convert a Markdown file (default: sprawozdanie.md) to PDF.

Usage:
    uv run md2pdf.py [input.md] [-o output.pdf]

Relative image paths are resolved against the Markdown file's directory.
Inline HTML (e.g. <div style="page-break-after: always;"></div>) is honoured.
"""

import argparse
import sys
from pathlib import Path

import markdown
from weasyprint import HTML

CSS = """
@page {
    size: A4;
    margin: 2cm 1.8cm;
    @bottom-center {
        content: counter(page) " / " counter(pages);
        font-size: 9pt;
        color: #666;
    }
}
body {
    font-family: "DejaVu Sans", "Liberation Sans", Arial, sans-serif;
    font-size: 11pt;
    line-height: 1.45;
    color: #222;
}
h1 { font-size: 22pt; margin: 0 0 0.6em; }
h2 {
    font-size: 15pt;
    margin: 1.4em 0 0.5em;
    padding-bottom: 0.2em;
    border-bottom: 1px solid #ccc;
    page-break-after: avoid;
}
h3 { font-size: 13pt; page-break-after: avoid; }
img {
    display: block;
    max-width: 100%;
    max-height: 24cm;
    margin: 0.5em auto;
    page-break-inside: avoid;
}
table { border-collapse: collapse; margin: 0.8em 0; }
th, td { border: 1px solid #bbb; padding: 4px 10px; text-align: left; }
th:empty { display: none; }
code { font-family: "DejaVu Sans Mono", monospace; font-size: 0.92em; }
pre { background: #f5f5f5; padding: 0.6em; overflow-wrap: anywhere; white-space: pre-wrap; }
a { color: #1a4fa0; text-decoration: none; }
"""


def convert(src: Path, dst: Path) -> None:
    text = src.read_text(encoding="utf-8")
    body = markdown.markdown(
        text,
        extensions=["extra", "toc", "sane_lists"],
        extension_configs={"toc": {"slugify": _slugify}},
    )
    title = src.stem
    html = (
        f'<!doctype html><html lang="pl"><head><meta charset="utf-8">'
        f"<title>{title}</title><style>{CSS}</style></head>"
        f"<body>{body}</body></html>"
    )
    HTML(string=html, base_url=str(src.parent.resolve())).write_pdf(dst)


def _slugify(value: str, separator: str) -> str:
    # GitHub-style anchors ("Zadanie 1" -> "zadanie-1"), keeping Polish letters.
    import re

    value = value.strip().lower()
    value = re.sub(r"[^\w\s-]", "", value, flags=re.UNICODE)
    return re.sub(r"\s+", separator, value)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("input", nargs="?", default="sprawozdanie.md", type=Path)
    parser.add_argument("-o", "--output", type=Path)
    args = parser.parse_args()

    src: Path = args.input
    if not src.is_file():
        print(f"error: {src} not found", file=sys.stderr)
        return 1
    dst: Path = args.output or src.with_suffix(".pdf")

    convert(src, dst)
    print(f"Wrote {dst}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
