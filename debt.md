# Fix list – Rachmistrz GT exercises

Review of the screenshots (`zad*.png`) against `Zbior_zadan_Rachmistrz_GT.pdf`, done 2026-11-03.

The bookkeeping data is almost entirely correct: the final KPiR summary (`zad29.png`) matches the expected totals for every month (see the reference table at the end). Most items below are screenshot problems, not accounting problems.

Status legend: `[ ]` to do, `[x]` done.

---

## 1. Data errors (fix in the program)

- [ ] **Ex. 6 – Tax office has your name in the street field**
  - Where: *Instytucja* → `US` (Urząd Skarbowy Wrocław-Fabryczna), tab *Podstawowe*, field **Ulica** = `Mikołaj Pawłoś` (see `zad6a.png`).
  - Effect: field **6. Urząd Skarbowy** in every VAT-7 is shown in red as "Urząd Skarbowy Wrocław-Fabryczna, Mikołaj P…" (`zad6f.png`, `zad17a.png`, `zad21.png`).
  - Fix: clear **Ulica**. Optionally click *Uzupełnij dane adresowe US* (fill in tax office address). Then recalculate (*przelicz*) / regenerate:
    - VAT-7 for July 2020 (ex. 6)
    - VAT-7 and JPK_VAT for August 2020 (ex. 17)
    - the August 2020 correction VAT-7 and JPK_VAT (ex. 21)
  - Retake: `zad6a`, `zad6f`, `zad17a`, `zad21`.

---

## 2. Outdated screenshots (data was fixed later, the screenshot still shows the mistake)

- [ ] **Ex. 2 – Server repair in the wrong KPiR column** (`zad2a.png`, `zad2b.png`)
  - Screenshot: **Zakup towarów handlowych (10) = 475,61**.
  - Correct: **Pozostałe wydatki (13) = 475,61**, column 10 = 0,00.
  - Evidence it's fixed: July in the KPiR summary has col. 10 = 0 and col. 13 = 1 049,05 (= 475,61 + 573,44).
  - Also check the VAT tab: *Rodzaj* = `zaopatrzeniowe` (supplies). For a service, `kosztowe` (cost) fits better, the same as ex. 12.
  - Check the supplier NIP: the screenshot shows `89456553563` (11 digits). The invoice shows `8945653563`.
  - Retake: `zad2.png`, `zad2a.png`, `zad2b.png`.

- [ ] **Ex. 7 – Wrong document number** (`zad7.png`)
  - Screenshot: **FS 754/07/2020** (copied from ex. 2).
  - Correct: **FS 15/08/2020** (Jaskółka sp. z o.o., 145 000,00 net / 33 350,00 VAT / 178 350,00 gross).
  - Evidence it's fixed: the August bank statement (`zad16a.png`) shows "FS 15/08/2020(178350.00)".
  - Retake: `zad7.png`.

- [ ] **Ex. 8 – Wrong acquisition year** (`zad8.png`)
  - Screenshot: **Data nabycia = 01-08-2026**.
  - Correct: **01-08-2020**.
  - Evidence it's fixed: the asset card in `zad28.png` shows 01-08-2020.
  - Optional: the **Symbol GUS** field contains `Mikołaj Pawłoś`. It's not required by the task, so clear it.
  - Retake: `zad8.png`.

---

## 3. Screenshots in the wrong place

- [ ] **`zad17b.png` is not ex. 17.** It's an early, wrong version of ex. 18: the whole **3 572,00 in column 10**, transport not split out. The correct version is `zad18b.png` (3 460,00 in col. 10 + 112,00 in col. 11). → **Delete `zad17b.png`.**
- [ ] **`zad28b.png`** is the *Podsumowanie KPiR* dialog (01-07-2020 – 31-10-2020, *miesięcznie*). It belongs to **ex. 30**, not ex. 28. → Rename it to e.g. `zad30a.png`.
- [ ] **`zad29.png` and `zad30.png` are the same file** (same MD5). The image is the *monthly* KPiR summary, which fits **ex. 30**. → Ex. 29 needs its own screenshot (see section 4).

---

## 4. Missing or incomplete evidence (work may be done, but it isn't shown)

<!--
- [x] **Ex. 1 – Identification data.** The summary screen doesn't show:
  - VAT method: **miesięczna** (monthly)
  - bank account: *rachunek bieżący* (current account), **PL 80 8191 1042 7470 4772 1659 7489**, Bank Spółdzielczy w Cycowie Oddział w Jastkowie, starting balance **30 000,00 PLN**
  - program version: *próbna* (trial)
  - the boss's ID: `AW` in the task (`MP` used, since your own name replaced Adam Węgierski, which is fine)
  - Add a screenshot of the *Podmiot / Dane VAT* step and the bank account (*Rachunek bankowy*) card.
  -->

<!--
- [ ] **Ex. 5 – Bank statement 07/2020.** Not wrong, but it differs from the source document:
  - The statement in the PDF has **3 separate debits** on 15-07-2020: 2 116,10 (Dudek, net pay), 145,00 (Urząd Skarbowy, PIT advance), 1 112,34 (ZUS).
  - Entered as **one line of 3 373,44** to Dudek Stefan Sebastian. The closing balance is still correct (**70 629,06**).
  - Optional: split it into 3 lines to match the document.
  -->

- [ ] **Ex. 6 – VAT-7 July.** Only the header is shown. Add a screenshot of the calculated amounts (section C).

<!--
- [ ] **Ex. 14 – Fiscal report RF 1/08/2020.** Entered in the *Faktury VAT (sprzedaż)* register.
  - Check whether the course expects a retail/fiscal register (*sprzedaż detaliczna / kasa fiskalna*), and that the JPK_VAT tab marks it as **RO**.
  - Amounts are correct: 23% 47 000,00 / 10 810,00; 8% 2 900,00 / 232,00; KPiR col. 7 = 49 900,00.

- [ ] **Ex. 16 – Bank statement 08/2020.** Add a screenshot of the KPiR entry for the **bank fee of 58,00** in col. 13. It is booked: August col. 13 = 600,75 = 40,70 + 336,00 + 166,05 + 58,00. The wages are one line of 4 668,96 instead of two (2 748,34 + 1 920,62). That's fine; split them if you want to match the document.
-->
- [ ] **Ex. 17 – VAT-7 and JPK_VAT for August 2020.**
  - `zad17a` shows only the VAT-7 header (no amounts).
  - **No JPK_VAT screenshot at all.** Generate and screenshot JPK_VAT for 08/2020.

- [ ] **Ex. 20 – Correction KFS 1/08/2020.**
  - The task stresses "Pamiętaj o prawidłowym numerze w KPiR!" (remember the correct KPiR number). Add a screenshot of the **KPiR list for August** showing the correction's Lp (sequence number) in date order (dated 27-08-2020, in August, before the 31-08 entries).
  - `zad20a`: **Data zak. dostawy = 27-08-2020**, but the correction document says **10-08-2020** (the original sale's delivery date). Change it to 10-08-2020.
  - Amounts are correct: −138,20 / −31,79 / −169,99; KPiR col. 7 = −138,20.

- [ ] **Ex. 21 – Correction VAT-7 and JPK_VAT for August.**
  - `zad21` shows only the header with *Cel złożenia = 2 – korekta zeznania* (purpose: correction). Add the amounts section.
  - **No JPK_VAT correction screenshot.** Generate and screenshot it.

- [ ] **Ex. 22 – FS 3/09/2020.** Opis (description) = "Sprzedaż tapetowania", without the `~ Mikołaj Pawłoś` suffix used everywhere else. Add it for consistency (cosmetic).

- [ ] **Ex. 23 – Depreciation for September.**
  - Not shown: approving the depreciation plan with the **wzorzec planu 1/12** (1/12 plan template).
  - Add a screenshot of the plan approval and of the KPiR entry (col. 13 = 2 416,67).

- [ ] **Ex. 28 – Fixed asset report on 31-10-2020.**
  - `zad28.png` shows the asset card, not a **report**. Generate the fixed assets report (*Raport o środkach trwałych* / *Zestawienia*) for 31-10-2020 and screenshot it.
  - **Write the answer as text:** accumulated depreciation = **5 033,34 zł** (2 416,67 for IX + 2 616,67 for X).

- [ ] **Ex. 29 – "Bilans z księgi" (balance from the book) 01-07-2020 – 31-10-2020.**
  - Needs its own screenshot (currently a duplicate of ex. 30).
  - **Write the answer as text:** income for the period = **86 860,66 zł** (revenue 109 375,80 − costs 22 515,14).

- [ ] **Ex. 30 – KPiR summary by month.** Use the current `zad29.png` image plus the dialog from `zad28b.png`.

---

## 5. After fixing

- [ ] Regenerate `sprawozdanie.md` so it picks up renamed, deleted, and new screenshots.
- [ ] Add answer text under ex. 28 and 29 in `sprawozdanie.md`.
- [ ] Fill in the name / student ID / group / date on the title page.

---

## Reference: expected KPiR totals (verified against `zad29.png`)

| Month | Col. 7 sales | Col. 10 goods | Col. 11 side costs | Col. 12 wages | Col. 13 other | Breakdown |
|---|---|---|---|---|---|---|
| VII | 36 250,00 | 0,00 | 0,00 | 2 800,00 | 1 049,05 | 13: 475,61 (ex. 2) + 573,44 (ex. 3) |
| VIII | 52 525,80 | 0,00 | 0,00 | 6 100,00 | 600,75 | 7: 2 764,00 + 49 900,00 − 138,20 · 13: 40,70 + 336,00 + 166,05 + 58,00 |
| IX | 15 640,00 | 3 460,00 | 112,00 | 0,00 | 2 416,67 | 7: 9 590 + 800 + 5 250 · 13: depreciation |
| X | 4 960,00 | 3 360,00 | 0,00 | 0,00 | 2 616,67 | 13: depreciation after upgrade (157 000 × 20% / 12) |
| **Σ** | **109 375,80** | **6 820,00** | **112,00** | **8 900,00** | **6 683,14** | income **86 860,66** |

Exercises confirmed correct as shown: 3, 4, 9, 10, 11, 12, 13, 15, 18, 19, 22 (amounts), 24, 25, 26, 27.
