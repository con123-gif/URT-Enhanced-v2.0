# Original URT + Cathedral Symmetry Compiler Applied to Mathematics

**Date:** 15 October 2026. **Scope:** executable mathematical stress tests, locally only. **No GitHub changes.**

## Principal result: explicit O(N) solution for all-to-all harmonic optimization

Original URT supplies the scale and phase `κ=π/e`, `θ=2π/φ²`; the Cathedral's `Δ=3/20−80π/(1053φ)` and `η=−ln Δ` supply one *chosen* non-fitted weight family `γ_h=ηΔ^(h−1)`. None of the selected weights has been derived as a universal physical interaction.

For N unknown real variables `x_j`, N-stage input `b_j`, and fixed number `m` of harmonics, define the strictly convex mathematical objective

\[
E(x)=\frac12\sum_{j=0}^{N-1}(x_j-b_j)^2
+\frac1{2N}\sum_{h=1}^{m}\gamma_h
\left|\sum_{j=0}^{N-1}x_j\exp(ihj\theta)\right|^2.
\]

Because `cos[(i−j)θ]=cos(iθ)cos(jθ)+sin(iθ)sin(jθ)`, its Hessian factors as

\[
K_{ij}=\delta_{ij}+\frac1N\sum_{h=1}^m\gamma_h\cos[h(i-j)\theta]
=I+UU^T,
\quad U_{j,2h-1}=\sqrt{\gamma_h/N}\cos(hj\theta),\quad
U_{j,2h}=\sqrt{\gamma_h/N}\sin(hj\theta).
\]

**Exact minimizer** (Woodbury):

\[
\boxed{x_\star=b-U(I_{2m}+U^TU)^{-1}U^Tb.}
\]

No `N × N` matrix must ever be stored. For fixed `m`, building `U`, computing `U^TU`, and applying the inverse costs **O(N m² + m³)** arithmetic and **O(Nm)** storage, so **O(N)** as N grows at fixed m. The derivation is a standard trigonometric low-rank identity plus Woodbury, *not* a new theorem unique to the golden angle. The original URT phase provides a fixed incremental non-resonant stage schedule; its `π/e` factor may shape the forcing envelope.

### Executed numerical results

| Sites N | Number of harmonics m | Reduced inverse | Relative equation residual |
|---:|---:|---:|---:|
| 13 | 1 | 2×2 | 2.23e−16 |
| 64 | 1 | 2×2 | 2.19e−16 |
| 512 | 1 | 2×2 | 1.12e−16 |
| 4,096 | 1 | 2×2 | 3.28e−17 |
| 16,384 | 1 | 2×2 | 3.53e−17 |
| 13 | 3 | 6×6 | 3.90e−16 |
| 64 | 3 | 6×6 | 1.49e−16 |
| 512 | 3 | 6×6 | 1.04e−16 |
| 4,096 | 3 | 6×6 | 1.57e−16 |
| 16,384 | 3 | 6×6 | 2.28e−16 |

These are **actual residuals**, computed matrix-free as `||x+U(Uᵀx)−b||/||b||`. A separate standalone, reusable `URT_HARMONIC_DIRECT_SOLVER.py` also passes 13 through 16,384 cases, with residuals at approximately 1e−16. Source: `URT_HARMONIC_ALL_TO_ALL_TEST.py` and `URT_HARMONIC_ALL_TO_ALL_RESULTS.json`.

For the chosen input, `b_j = κ^(j−N+1)cos(jθ)+Δ sin(2jθ)`, normalized to unit length, three-harmonic energy falls **from 0.32282010 to 0.08031337** at N=64, a 75.1% reduction. This is minimization of the *specified convex energy*, not a universal physical performance improvement.

### Exact angle/conditioning result

The 2-column feature Gram has eigenvalues

\[
\mu_\pm=\frac N2\pm\frac12\left|\sum_{j=0}^{N-1}e^{2ij\theta}\right|,
\qquad
\left|\sum e^{2ij\theta}\right|=\left|\frac{\sin(N\theta)}{\sin\theta}\right|.
\]

Therefore its condition number is `(N+|sin(Nθ)/sinθ|)/(N−|sin(Nθ)/sinθ|)`, which approaches 1 for this fixed θ because `sin θ≠0`. Actual values: **1.05013** at N=13, **1.01556** at N=64, and **1.000148** at N=4,096. The golden angle is useful for sequential sampling but does **not** maximize uniform spacing when N is known: for N=64 its largest circular phase gap is 0.133745 rad versus 0.098175 rad for an evenly spaced layout (36.2% larger).

## A second useful result: nonlinear optimization becomes a scalar equation

For any positive-definite A5-equivariant `64×64` operator `K`, consider

\[
F(x)=\tfrac12x^\dagger K x+\tfrac g4\|x\|^4-\mathrm{Re}(b^\dagger x),\quad g>0.
\]

This is a *new test objective*, with `g=η` chosen for the experiment, not the physically derived Cathedral action. Stationarity gives

\[
(K+\tau I)x=b,\qquad \tau=g\|x\|^2.
\]

Thus **one scalar equation** determines the full nonlinear optimum:

\[
\boxed{g\|(K+\tau I)^{-1}b\|^2-\tau=0.}
\]

For `K` positive definite it has a unique nonnegative root because the first term decreases with τ while −τ decreases strictly. The symmetry compiler permits small-block resolvent action for each trial τ. In the tested 64-variable objective, the root was **τ=0.650850890245**, found after **7 scalar Brent steps**; the full 64D stationarity residual was **1.27e−15**. The nonlinear optimum differed by **26.86%** from the quadratic minimizer. This is not zero-iteration universal nonlinear optimization; it is reduction of a *particular* nonlinear class to one dimension.

For a local pointwise quartic `F(x)=xᵀH x/2+g∑x_i^4/4-bᵀx`, a generic nonuniform solution produces a symmetry-breaking Hessian. The 12D test required **20 BFGS iterations** to reach a gradient norm of approximately **6.8e−10**. A generic 64D full-rank symmetry-breaking Hessian made the uncorrected cubic solver fail (relative residual **7.44**); a dense solve gave **1.55e−16**. Hence the shortcut requires identified structure or a special low-rank update.

## Older URT + new compiler, verified together

- The **original URT two-step recurrence** yields terminal closure in one O(N) forward construction on the tested 13, 64 and 125 stages, with terminal residuals 5.2e−18, 1.24e−24 and 3.17e−33, respectively. However, target sensitivity grows to ~1.54e18 by 125 stages; tiny residual from the constructed zero target does *not* imply stable solution to arbitrary targets.
- The **new A5 cubic compiler** solves the 64D linear operator to residual ~7.76e−15 with URT forcing, and ~4.45e−15 with independent generic forcing. Therefore **URT does not cause the symmetry inverse to work**. It organizes forcing and boundary conditions; the fast algebra comes from invariant subspaces and Cayley–Hamilton.
- The **nearest-stage direct chain** solves 832, 4096, and 8000 unknowns with residual ~1.8e−15. Complexity O(stages) holds only for fixed cell size and bounded stage coupling width, with fixed preprocessing.
- In a fixed, small 64D dense 128-RHS benchmark, optimized LU was **faster** than the current unoptimized Python cubic implementation (sample ~0.00056 vs ~0.0116 s for 128 RHS after factorization). The cubic algorithm's advantage is algebraic structure/reuse and potentially sparse or symbolic implementations; not guaranteed wall-clock dominance over tuned BLAS.
- In a normalized linear quadratic problem, URT-phase forcing has energy-gain score `b†K⁻¹b=0.401743` versus `0.476485` for one generic normalized source, with mathematical bounds `[0.142943,0.813679]`. Phase scheduling alone is not a theorem of globally optimal forcing.

## What is genuinely found

1. **Proven direct O(N) optimization** for a family of globally coupled separable fixed-harmonic quadratic objectives, including URT phase forcing and Cathedral-defined weights, with explicit limits on the interaction class.
2. **Low-dimensional exact symmetry compiler** for A5-equivariant finite linear systems and structured defects.
3. **Scalar reduction of a nonlinear radial quartic** objective using spectral data, with a unique root and residual at floating-point accuracy.
4. **Explicit boundary of validity**: arbitrary nonlinear systems, dense nonseparable interactions, unrestricted symmetry breaking, physical force laws or measurements are not solved by this tool.

## Reproduce locally

With Python 3.10+, NumPy and SciPy:

```bash
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_HARMONIC_DIRECT_SOLVER.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_HARMONIC_ALL_TO_ALL_TEST.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_MATHEMATICS_STRESS_TEST.py
```

The archive includes the original tested symmetry compiler and its two geometric dependencies. No GitHub changes are made in this round.