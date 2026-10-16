# URT Mathematics & Structure-Compiled Computing

**15 October 2026 — Working Python code, mathematical certificates and recorded stress tests.**  
**Original algorithm:** Universal Recursive Tuning (URT/URTF), with the established recursive O(N) scale–phase/boundary cascade and constants \(\kappa=\pi/e\), \(\theta=2\pi/\phi^2\).  
**This addition:** an application of URT plus a reusable **structure compiler** for several rigorously specified mathematical/physical operator classes, not a replacement for the original algorithm.

## What has been uploaded

| File | Role |
|---|---|
| [URT_HARMONIC_DIRECT_SOLVER.py](URT_HARMONIC_DIRECT_SOLVER.py) | Original tested fixed-harmonic solver |
| [URT_MATH_APPLICATIONS_2026-10-15.md](URT_MATH_APPLICATIONS_2026-10-15.md) | Complete mathematics report, including positive and negative controls |
| [URT_MATHEMATICS_STRESS_RESULTS.json](URT_MATHEMATICS_STRESS_RESULTS.json) | Archived 2026-10-15 stress-test output |
| [URT_structure_engine.py](URT_structure_engine.py) | New cross-domain structure-aware solver and dispatcher |
| [test_URT_structure_engine.py](test_URT_structure_engine.py) | Ten executable independent checks |
| [URT_structure_engine_benchmark.py](URT_structure_engine_benchmark.py) | Regenerate cross-domain performance and residual checks |
| [URT_structure_engine_benchmark_results.json](URT_structure_engine_benchmark_results.json) | Initial benchmark before addition of the local-plus-global stress case |

The previous [A5 symmetry compiler](../urtf_symmetry_compiler/README.md) handles proper-icosahedral representation blocks, Cayley–Hamilton cubic inversion, Woodbury defects and multi-stage Cathedral cells. Its provenance remains separate. Original URT and the finite Cathedral have not been retired.

## The central mathematical strategy

**Compile structure before solving equations.** An input problem supplies its structure (phase separability, low rank, block-locality, invariant symmetry, or a specified nonlinear radial form). The solver returns a solution **and a residual/complexity certificate**. No algorithm infers exact structure from arbitrary code with no evidence.

Supported classes:

1. **Dense-looking fixed-harmonic interactions.** For arbitrary phases \(\theta_i\), \(\cos[h(\theta_i-\theta_j)]\) splits into cosine/sine outer products. A finite number \(m\) of harmonics gives rank at most \(2m\). Woodbury solves diagonal-plus-rank-\(r\) problems using a \(r\times r\) matrix and O(N r²+r³) work.
2. **Local chains / 1D discretized PDEs.** Block-tridiagonal Gaussian elimination gives O(stages × blockwidth³), so O(N) for fixed block width. Includes a tested finite-difference screened Poisson/diffusion operator.
3. **Local physics PLUS global resonances — the new combined result.** If \(K=B+UCU^\dagger\), with invertible block-tridiagonal \(B\) and fixed-rank \(U\), solve \(B^{-1}U\) through block elimination and then apply an \(r\times r\) Woodbury correction. It handles simultaneous nearest-neighbour and all-to-all harmonic interactions in O(N) for fixed block size/rank. Tested on 4,096 variables with ~1.0e−16 relative residual; compared with an independent dense solve at 160 variables.
4. **Harmonic oscillator networks.** The complex frequency-domain operator \(\mathrm{diag}(k-m\omega^2+i\omega c)+UU^\top\) uses the same low-rank inverse. This is a linear model with specified material coefficients, not a derivation of physical coupling constants.
5. **Special radially quartic nonlinear energies.** For \(K\succ0\), \(g>0\), the stationarity condition \((K+\tau I)x=b\), \(\tau=g\|x\|^2\), reduces to a unique one-dimensional scalar root. The scalar step is iterative; the dimensional reduction is direct.
6. **Original URTF boundary cascade.** The two-step \(\pi,e,\phi\) recurrence has a one-pass fundamental-solution construction for a terminal condition. Check endpoint sensitivity: target-condition instability can be severe at large stage counts.
7. **Unstructured matrices.** A dense numerical fallback is used and clearly labelled; no O(N) speedup is claimed.

## Reproduce

With Python 3.10+, NumPy and SciPy, inside this folder:

    python -m pip install numpy scipy
    OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python -m unittest -v test_URT_structure_engine.py
    OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_structure_engine_benchmark.py
    OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_HARMONIC_DIRECT_SOLVER.py

The tests were run locally on 2026-10-15: **10/10 passed**. Each finite system is validated against the stated model, with small models compared to independent dense algebra.

### Minimal example: physics with local and all-to-all couplings

    import numpy as np
    from URT_structure_engine import BlockTridiagonal, LocalPlusGlobalResonance, urt_features

    N=4096
    local=BlockTridiagonal(
        np.tile(np.array([[[3.0]]]),(N,1,1)),
        np.tile(np.array([[[-1.0]]]),(N-1,1,1)),
    )
    U=urt_features(N,harmonics=3,weights=[.7,.2,.02])
    engine=LocalPlusGlobalResonance(local,U)
    force=np.cos(np.arange(N)*(2*np.pi/((1+np.sqrt(5))/2)**2))
    response,certificate=engine.solve(force)
    print(certificate.relative_residual,certificate.operation_class)

These three resonance weights are **explicit test choices**, not uniquely derived universal physics constants.

## Selected numerical checkpoints

| Case | N | Smallest system / recurrence | Measured relative residual |
|---|---:|---|---:|
| Three-harmonic global interaction | 32,768 | 6×6 | 2.28×10⁻¹⁷ |
| Nearest-neighbour screened Poisson | 24,000 | scalar tridiagonal recurrence | 3.05×10⁻¹⁶ |
| Local + three URT global resonances | 4,096 | 6×6 correction to local inverse | 1.03×10⁻¹⁶ |
| Linear resonant oscillator network | 2,048 | 4×4 | 9.56×10⁻¹⁷ |
| Positive radial quartic optimization | 256 | one scalar root | 1.51×10⁻¹³ |
| Arbitrary dense fallback | 128 | dense 128×128 | 4.77×10⁻¹⁶ |

These are finite examples with artificial test coefficients; no Einstein equation, particle-mass spectrum, or general N-body physical law is derived by the result. Timings in benchmark JSON are local and not hardware-independent speedup claims. The 125-stage URTF endpoint condition can have backward-target sensitivity ~1.54×10¹⁸, illustrating why a small residual does not guarantee robustness.

## How to approach *all* mathematics, physics and computation

An extensible **problem dispatcher** can support an increasing number of domains, but it cannot promise a fast exact solution to every problem. The proposed development route:

1. **Accept mathematical models in typed form:** linear systems, differential equations, Hamiltonians, constrained optimizations, circuits, symbolic recurrences and numerical kernels. Keep units, boundaries and physical assumptions explicit.
2. **Detect candidate compressible structure:** finite group symmetries, conservation laws, Fourier/spectral modes, rank/separability, sparse or low-treewidth interaction graphs, local-vs-global couplings and symplectic forms. This *detection itself* has a cost; expensive dense SVD does not magically produce an O(N) end-to-end method.
3. **Produce an explicit decomposition certificate:** \(K=S^{-1}\operatorname{diag}(K_r)S+UV^\dagger\), or a specified sparse factorization, with an independently checkable reconstruction residual or exact symbolic equality.
4. **Dispatch** to the appropriate kernel (group blocks, Woodbury, FFT, block recurrences, verified reduced nonlinearity) while using URT's original phase/scale and boundary recursion where these are **actually part of the problem**.
5. **Verify** equations, residuals, sensitivity, conservation and stability, and compare with optimized existing algorithms. Reject the shortcut or fall back when the advertised structure is absent.
6. **Prove domain-specific convergence and scaling** and benchmark both the structure-detection cost and the solve. Extend to distributed/compiled GPU implementations only when the mathematical win is established.

At a deeper level, unrestricted problems include NP-hard optimization, unstructured dense linear algebra, quantum-many-body growth and nonlinear dynamics; no fixed O(N) method is established for all of these. A general **interface and hierarchy of conditional exact reductions** is realistic and potentially very valuable.

The most promising immediate physics target is **local operators plus finite-rank global interactions**: simplified wave, diffusion, plasma, coupled-resonator and information-transfer models can use this combined solver without building a dense global matrix.

**Status:** original URT's algorithmic role preserved; new structure-enabled mathematics proven for the explicitly represented operator classes; broader generalization remains a research/engineering programme.


## 16 October independent performance audit — compiled SciPy beats this Python implementation

The original URT O(N) algorithm is preserved, and all 10 operator tests passed. However, the **Python implementation is not a faster numerical solver than optimized SciPy** for the existing local-plus-global benchmark. Both compute the same Schur/Woodbury reduction in O(N). The difference is the compiled tridiagonal kernel versus interpreted Python block elimination.

Independent reproducible script: [compare_scipy_banded.py](compare_scipy_banded.py). With OPENBLAS_NUM_THREADS=1 and the same positive tridiagonal matrix, six URT harmonic columns and right-hand side, one run observed:

| Variables | Python engine time (s) | SciPy banded + Woodbury (s) | Slower by |
|---:|---:|---:|---:|
| 4,096 | 0.1252 | 0.0008 | 148× |
| 16,384 | 0.5151 | 0.0025 | 210× |
| 65,536 | 1.9747 | 0.0067 | 295× |

The two methods agree to ~1e−16 relative solution error. This is a **single-machine comparison**, not a universal speed ratio. An independently reported audit found the Python version 72–116× slower over a different range. The engineering claim is **mathematical O(N) structure and testable solver selection, not accelerated SciPy runtime or a new asymptotic algorithm**.

**Correction to the tool roadmap:** prefer compiled SciPy banded/structured factorizations when available; reserve custom URT recursion for the original phase–boundary history task and for cases where its admissibility or control law adds information beyond a generic forcing vector. Any new performance claim needs an equal-accuracy matched baseline, including preprocessing, memory and numerical stability.
