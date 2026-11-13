Same-machine benchmark on GitHub Actions: check `engine.benchmark`, orchestrator run 43519849068 (commit b728041,
job 132218720408), 2026-11-13T22:49:37Z · python 3.11.18 · 4 CPUs. Each run is a fresh subprocess, imports
included. Table copied verbatim from the job log:

| Case | Original (s) | Engine cold (s) | Engine warm (s) | Speed-up cold | Speed-up warm | Note |
|---|---|---|---|---|---|---|
| q64_selection | 14.98 | 1.59 | 0.69 | ×9.4 | ×21.8 | (0, 2, 4, 6, 10, 9) |
| q3_census | 51.62 | 0.64 | 0.63 | ×80.5 | ×81.4 | 32 distinct second moments, identical to the archived Q3 census |
| q81_source | 8.65 | 1.00 | 0.96 | ×8.7 | ×9.0 | 0.032194544822365221694503455948311626 |
| q89_rows | 11.77 | 1.05 | 1.01 | ×11.2 | ×11.6 | three exact zeros |
| q83_clock | 0.85 | 0.82 | 0.83 | ×1.0 | ×1.0 | T H3 = -H3, T H5 = H5 on the eight dictionaries |

Same run, stage wall times after the registry split:

- research: 8 m 52 s. The previous run 43518116104 took 29 m 00 s against the 30-minute job limit.
- research_heavy: 8 m 50 s.
- engine: 2 m 15 s.
