Benchmark 2026-11-13T22:13:55Z · python 3.13.18 · 2 CPUs (fresh subprocess per run)

| Case | Original (s) | Engine cold (s) | Engine warm (s) | Speed-up cold | Speed-up warm | Note |
|---|---|---|---|---|---|---|
| q64_selection | 8.10 | 0.98 | 0.52 | ×8.3 | ×15.6 | (0, 2, 4, 6, 10, 9) |
| q3_census | 22.43 | 0.53 | 0.49 | ×42.5 | ×45.6 | 32 distinct second moments, identical to the archived Q3 census |
| q81_source | skipped | 0.60 | 0.57 | — | — | needs sympy, mpmath (runs on GitHub Actions) |
| q89_rows | skipped | 0.65 | 0.72 | — | — | needs sympy (runs on GitHub Actions) |
| q83_clock | skipped | 0.65 | 0.60 | — | — | needs sympy (runs on GitHub Actions) |
