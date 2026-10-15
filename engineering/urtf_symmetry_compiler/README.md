# URTF–Cathedral Symmetry Compiler

**Original URT algorithm + an A5-symmetry-compiled finite operator solver**  
Checkpoint: 15 October 2026

## Provenance — URT was already an O(N) algorithm

**The original Universal Recursive Tuning (URT/URTF), also called pi–e Harmonic Scaling, was formulated as an O(N) recursive analytical cascade before this compiler.** The present result is an extension/application of that algorithmic programme. Do not present the earlier one-pass cascade as a new invention of this tool.

The original URT uses the primitive scale and phase

    kappa = pi/e
    theta = 2*pi/phi^2,       phi=(1+sqrt(5))/2

and a stage recurrence / direct terminal evaluation. A retained, more explicit two-step history formula from the 2026-09-08 canonical reconstruction is

    x_{k+1} = [1 + e/(pi*sqrt(k+1))] cos(theta*k) x_k - x_{k-1}/2.

Its two fundamental solutions allow one-pass boundary closure whenever the relevant terminal coefficient is nonzero; O(N) describes its arithmetic per N-stage trajectory, not global optimization of arbitrary nonlinear systems. See the **original URT state**, [LIVE_STATE_2026-10-02](../../docs/LIVE_STATE_2026-10-02.md), and [closure ledger](../../docs/CLOSURE_LEDGER.md). The later bounded-response implementation in [cathedral_core/urt.py](../../cathedral_core/urt.py) is a *downstream* URT realization and must not be substituted for the original analytic cascade.

## What this compiler adds

A geometric 64-state Cathedral carrier has the proper-icosahedral decomposition

    H64 = 4(1 + 3 + 3' + 4 + 5).

For an invertible linear operator K commuting with all 60 proper icosahedral rotations, its five isotypic components are fourfold-multiplicity blocks. Each block's inverse follows from a **degree-three Cayley–Hamilton matrix polynomial**. The coefficients come from four traces per isotypic sector: no diagonalization or target fitting is needed for each right-hand side.

Beyond this exact class of solvers:
- An explicitly rank-r interaction is handled by a Woodbury r×r correction.
- The candidate species-loaded geometric H64 operators reduce to 12×12 resolvent corrections.
- Repeated nearest-stage 64-cell interactions admit a direct recurrence linear in the **number of stages**, after fixed-size preprocessing.
- The original pi/e and golden angle generate the optional URTF boundary forcing, **but do not by themselves prove the cubic inverse theorem**.

These are standard mathematical reduction techniques concretely compiled for the Cathedral's operator family. A universal O(N) optimizer for arbitrary physics equations is **not** claimed.

## Reproduce

Use Python 3.10+, NumPy and SciPy, from this directory:

    python -m pip install -r requirements.txt
    OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URTF_Cathedral_symmetry_compiler_LOCAL.py

Windows PowerShell: run the Python command without the Unix environment-variable prefix, or set the corresponding environment variables separately. The script regenerates the JSON results file in this directory.

The original _LOCAL suffix is retained to preserve the file identity and prior research provenance; **this copy is now committed to GitHub**. The original local-only README is preserved as [README_ORIGINAL_LOCAL.md](README_ORIGINAL_LOCAL.md).

## Files

| File | Purpose |
|---|---|
| [URTF_Cathedral_symmetry_compiler_LOCAL.py](URTF_Cathedral_symmetry_compiler_LOCAL.py) | Main direct symmetry compiler, tests, Woodbury, URTF boundary and multi-stage solver |
| [URTF_Cathedral_symmetry_compiler_results_LOCAL.json](URTF_Cathedral_symmetry_compiler_results_LOCAL.json) | Recorded reproducible numerical outputs |
| [URTF_Cathedral_Symmetry_Compiler_REPORT_LOCAL.md](URTF_Cathedral_Symmetry_Compiler_REPORT_LOCAL.md) | Mathematical theorem, construction, test outcomes and limitations |
| [cathedral_operator_audit.py](cathedral_operator_audit.py) | 13-/64-cell incidence and Dirac operator dependency |
| [cathedral_strict_64_closure.py](cathedral_strict_64_closure.py) | 3D hidden lift and candidate dressed species dependency |
| [requirements.txt](requirements.txt) | NumPy and SciPy |
| [README_ORIGINAL_LOCAL.md](README_ORIGINAL_LOCAL.md) | Preserved local-research README as originally archived |

The supporting geometry files also have original dated checkpoints in [research_archive/2026-10-15_icosahedral_125_DEC_H64](../../research_archive/2026-10-15_icosahedral_125_DEC_H64).

## Recorded verification

Re-executed the original compiler locally immediately before uploading, with all assertions passing:

| Check | Result |
|---|---:|
| 60 group rotations, projector ranks | 4, 12, 12, 16, 20 |
| Main cubic inverse residual | ~3×10^-15 |
| Independent dense equivariant test residual | 2.33×10^-15 |
| Four candidate species-loaded H64 resolvents | ~4.15–4.22×10^-15 |
| Rank-four perturbation Woodbury residual | 3.26×10^-15 |
| 500 coupled stages × 64 states = 32,000 unknowns | 1.81×10^-15 |

These residuals concern **defined test matrices**. The benchmark timing and O(stage count) statement hold for fixed cell size, bounded interaction range and finite preprocessing. Arbitrary symmetry breaking, ill-conditioning, all-to-all coupling, or physically nonlinear equations may not admit the same shortcut.

**The selected quadratic interaction matrix was a research ansatz, not yet derived from the full microscopic Cathedral transfer T_star.** No Einstein equations, Standard Model particle masses, physical G, or complete Theory of Nature is proven by these numerical tests.
