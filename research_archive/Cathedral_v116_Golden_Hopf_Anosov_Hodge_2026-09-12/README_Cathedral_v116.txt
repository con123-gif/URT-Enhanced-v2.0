# Newton's Cathedral / URT v116 checkpoint

This folder is a self-contained checkpoint for the 2026-09-12
Golden–Hopf–Anosov / Hodge-polarization closure.

Start with:

1. `Newton_Cathedral_v116_Golden_Hopf_Anosov_Hodge_Closure.md`
2. `Cathedral_v116_Hodge_Polarization_results.json`
3. `cathedral_v116_hodge_polarization_verify.py`

The CSV files contain the explicit 30×30 matrices K and J.

The checkpoint intentionally retains v115 as the numerical baseline and
records an important correction: the explicit 30×30 complex structure is
the polar normalization of the oriented-face circulation operator K, not
the raw primal-to-dual DEC Hodge star.