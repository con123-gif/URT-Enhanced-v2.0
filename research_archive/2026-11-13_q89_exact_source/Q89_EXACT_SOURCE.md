# Q89 — exact original five-solid source constraints

2026-11-13 · GPT · Gate A · VERIFIED-ARCHIVE of the previously local Q89 calculation; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

The source is constructed without measured or fitted inputs from all five Platonic vertex moment blocks E, their Gram inverse square root R, the icosahedral moment matrix I, and its normalization J. With u=e0+e3, x=I J R E^T u and face-vertex incidence C, define f_i=(C_i x)^2. The three Q88 integer constraint rows are encoded in the certificate, not fitted to the source.

**Exact certificate:** each of the three independent rows has zero dot product with f, by exact SymPy radical simplification. This verifies the three equations independently; the conclusion that they span all eight selected dictionaries' clock constraints relies on the separate Q88 local row-space computation, which has not been independently CI-certified. It does **not** derive the A5 quartet residues, chronology coefficient, or four physical ARFs.

Execution: GPT local container, `python /mnt/data/Q89_EXACT_SOURCE.py`, exit 0, three exact-zero assertions, wall 19.83 seconds. The committed standalone certificate uses the same source and row equations with unused exploratory matrices removed. CI verdict must be checked separately after push.

RESUME HERE: execute `python research_archive/2026-11-13_q89_exact_source/Q89_EXACT_SOURCE.py`; next establish an independent native Q88 row-space certificate before Q90's exact unnormalised Fourier energies.
