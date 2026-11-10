# Verification package: Newton's Cathedral original-source ARF current closure

This package does **not** claim that all four historical ARFs have been derived as physical observables. It computes a mathematically closed, physically *candidate* geometric-current response using original November 7 five-Platonic source and original October 29 coupled 64D operator, with a canonical six-axis external phase probe. No historical ARF numbers or experimental masses/couplings enter any of the computations.

## File map

- `CATHEDRAL_ARF_SOURCE_CURRENT_CLOSED_THEOREMS_2026-11-09.md` — complete derivation, assumptions, exact eight-pole source response, Ward contacts, Chebyshev 24-clock and physical identification boundary.
- `cathedral_constructed_joint_dynamics_2026_11_07.py` — **unchanged** original 190+64+24 full-source archive, SHA256 `5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd`.
- `cathedral_64_chiral_hybridization_2026_10_29.py` — **unchanged** original coupled 64D archive, SHA256 `467ae9db54abdbc1661424a069a193e4ee39b705a4de9c187d2de3ca5fe0f737`.
- `arf_full_source_intertwiner_2026_11_09.py` — original face-order matching and partial intertwiner for both 64D histories.
- `arf_original_nonuniform_face_flux_response_2026_11_09.py` — all six antipodal sources, original 64 signed histories, 24 clock modes, five contact Ward derivative, independently checked with finite differences.
- `arf_exact_face_current_rational_trace_2026_11_09.py` — exact SymPy projector trace coefficients `2/3`, `4/3`.
- `arf_complete_native_geometric_current_spectral_theorem_2026_11_09.py` — eight spectral weights from original graph and source.
- `arf_exact_eight_pole_rational_resolvent_2026_11_09.py` — exact rational form, original chiral quartic denominator.
- `arf_24clock_ward_chebyshev_closure_2026_11_09.py` — original source covariance and exact 24-mode clock resolver.
- `arf_exact_full24_ward_response_closed_form_2026_11_09.py` — **fast independent cross-check** of the exact contact-inclusive 24-clock Ward formula against independently saved full-matrix source outputs.
- `arf_ward_fiveplet_extra_poles_theorem_2026_11_09.py` — explicit strictly positive extra poles that preclude direct two-pole identification with the historical ARF for this chosen probe.
- Original JSON results; verification log with all independent full-matrix tests passing and a final cached-source Chebyshev run passing separately.

Dependencies: Python 3, numpy, sympy, scipy, networkx, mpmath.

Run a short verification in this directory:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python arf_exact_face_current_rational_trace_2026_11_09.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python arf_exact_eight_pole_rational_resolvent_2026_11_09.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python arf_ward_fiveplet_extra_poles_theorem_2026_11_09.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python arf_exact_full24_ward_response_closed_form_2026_11_09.py
```

The source-generating verifier (`arf_original_nonuniform_face_flux_response_2026_11_09.py`) is slower because it checks 24 modes × 3 spectral arguments × 6 icosahedral axes with the full K64 and covariant source contacts. It also overwrites its corresponding JSON results with identically computed data.

This package was built in the working container only; neither the user's GitHub nor their persistent Library was altered.
