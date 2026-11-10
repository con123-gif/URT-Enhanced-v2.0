# Newton’s Cathedral: source-first ARF continuation, 2026-11-09

The included 7 November original Cathedral code is UNMODIFIED.
Original source SHA256: 5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd

Requirements: Python 3, numpy, scipy, sympy, networkx, mpmath.

In this directory, run:

```bash
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python cathedral_64_history_nonlinear_source_exact_2026_11_09.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python native_arf_radial_expansion.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python native_arf_oriented_clock_response.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python test_cathedral_constructed_joint_2026_11_07.py
```

No historical ARF target values, physical masses or electromagnetic measurements are used in the calculations. The outcomes are internal to the original source-defined operator. The report explicitly states which physical identifications remain unresolved. The original sources are not altered; nothing was committed to GitHub or uploaded to the user's Library.
