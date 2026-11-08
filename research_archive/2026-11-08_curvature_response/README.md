# Five-Platonic curvature, 24-track transport and energy–dual response
**Date:** 2026-11-08 · **Scope:** independent finite-dimensional Cathedral calculations; exact source models and numerical regressions. This directory does not contain source material, code or proofs by James Montgomery Lockwood or his collaborators.
## Original Cathedral papers
- `cathedral_platonic_gap_note.tex` — sharp co-closed curvature gap `3 - sqrt(5)` on the five-solid direct sum.
- `cathedral_24track_hodge_gap_note.tex` — arbitrary orthogonal 24-track holonomy stability and conditional hidden-sector estimates, with explicit Lockwood acknowledgment.
- `cathedral_response_duality_research_note.md` — spectral response sharpness, source-overlap criterion and Schur-complement coupling threshold, with explicit citation.
- `cathedral_lockwood_reference.bib` — authors and bibliographic citation.
- `cathedral_hodge_gap.py`, `cathedral_24track_covariant_gap_verify.py`, `cathedral_response_duality_verify.py` — standalone reproducible calculations. Rerun on 2026-11-08; all three exit 0 with PASS checks.
## Build and run
Requires Python 3, numpy, scipy, sympy, and networkx.
```bash
python research_archive/2026-11-08_curvature_response/cathedral_hodge_gap.py
python research_archive/2026-11-08_curvature_response/cathedral_24track_covariant_gap_verify.py
python research_archive/2026-11-08_curvature_response/cathedral_response_duality_verify.py
cd research_archive/2026-11-08_curvature_response
pdflatex -interaction=nonstopmode cathedral_24track_hodge_gap_note.tex
pdflatex -interaction=nonstopmode cathedral_24track_hodge_gap_note.tex
pdflatex -interaction=nonstopmode cathedral_platonic_gap_note.tex
pdflatex -interaction=nonstopmode cathedral_platonic_gap_note.tex
```
The compiled PDF originals are separately preserved in the ChatGPT file library; the `.tex` sources in Git allow rebuilding the PDFs. **Do not mistake compilation for verification of a continuum Yang–Mills theorem.**
## Attribution / boundary
The motivating forest-gauge bound `537/5000` was provided as work attributed to **James Montgomery Lockwood** and collaborators **Deep Bhattacharjee, Ushashi Bhattacharya and Tristan Romanov**. Reference: *One Cube Estimate Implies the Yang–Mills Mass Gap*, Hexagon preprint 2610.00341v7 (2026), https://hexagonmath.org/2610.00341v7. The exact supplied constant has not been independently certified against the original forest-gauge constraints in these notes. The energy–dual identity is standard spectral Cauchy–Schwarz mathematics highlighted in the supplied research. The results in this directory concern different, explicitly specified finite Hodge operators and are not coauthored or endorsed by the cited researchers.
