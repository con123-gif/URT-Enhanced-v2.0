# Newton's Cathedral — perturbation-stable native nonlocal Wick gap

**Date:** 8 November 2026.  **Scope:** the original all-five-Platonic, 190-geometric/64-history/24-clock finite action of 7 November, with its *Gaussian reference recomputed after a geometric perturbation*. This is not a transplantation of James Montgomery Lockwood's constrained forest-gauge operator. The motivation and attribution are specified below.

## 1. External motivating inequality and correct attribution

The image supplied by the user attributes the constrained-block estimate `A ≥ 537/5000 I` to **James Montgomery Lockwood**. With the **additional assumption** of a self-adjoint perturbation `||E||≤1/100` on that *same forest-gauge constrained subspace*, the standard min–max/operator-norm argument gives

\[
A+E\succeq\left(\frac{537}{5000}-\frac1{100}\right)I
=\frac{487}{5000}I.
\]

This is correct as a **conditional stability implication**. The image does not independently establish the original `537/5000` bound for the stated forest-gauge fields, nor an actual bound on an application-specific perturbation. The standard Weyl/min–max perturbation argument is not claimed to be invented by Lockwood. **Source attribution:** Deep Bhattacharjee, Ushashi Bhattacharya, **James Montgomery Lockwood**, Tristan Romanov, *One Cube Estimate Implies the Yang–Mills Mass Gap*, Hexagon preprint 2610.00341v7 (2026), https://hexagonmath.org/2610.00341v7. No external code or proof passages are incorporated into the Cathedral repository.

## 2. Original Cathedral operator and true perturbation question

Use the unmodified original November source with `D_190` the all-five Hodge–Dirac and `Cbridge=Ctop+Cbulk≥0` the original bridge. Let

\[
H=D_{190}^2+C_{\rm bridge},\quad
\mu=3-\sqrt5=0.763932022500208\ldots,
\quad P=I-\Pi_{\ker H},
\]

where `dim ker H=2`, `HP≥μP`, and the original 50→8→12 source embedding is orthogonal to the kernel of `H`. Work on 24 copies of the **full 190-dimensional geometry**, with original golden link phase `θ=2π/φ²`, `r=π/e`, and

\[
A_0=I_{24}\otimes H+r^2L^{(1)}_{24}(\theta)\otimes I_{190}.
\]

Let `P` also denote its 24-fold extension, with `R=I-P`. The golden Wilson-clock energy on the geometric zero modes is

\[
c_\theta=r^2\min\operatorname{spec}L^{(1)}_{24}(\theta)
=0.00255840637528\ldots>0.
\]

The original 64-history Schur-eliminated quartic uses fixed positive kernels

\[
W_3=\tfrac14I-\tfrac12(18I+r^2L^{(2)}_{24})^{-1},\quad
W_5=\Delta^2\left[\tfrac14I-\tfrac12(16I+r^2L^{(2)}_{24})^{-1}\right].
\]

The circular-complex free Gaussian geometry covariance at fixed Gibbs parameter `η=-lnΔ` is `Γ(A_0)=(2/η) A_0^{-1}`, compressed through the unchanged face-incidence source. Wick's theorem and the Schur product give a positive semidefinite 24-clock Wick tensor `\mathcal M(A_0)` (on the full original geometric field), linear and **order-preserving** in the positive face covariance. The original calculation verified the operator inequality

\[
0\preceq 8\mathcal M(A_0)\preceq \beta P,\qquad
\beta=0.4606159590788976\ldots<\mu.
\]

The point of the present test is to let the Gaussian covariance and Wick subtraction *respond* to a perturbation of the bare geometry rather than freezing the unperturbed mass subtraction.

## 3. Theorem — simultaneous perturbation of geometry and its Gibbs/Wick reference

Let `E=E*`, `||E||≤ε<μ`, and assume **sector preservation**: `E=PEP`. (It can mix all five solids, all eight portal components and all 24 clock positions within this sector; it need not commute with the original geometry.) Keep the original history kernels and source maps fixed. Set `A_E=A_0+E` and recompute the Gaussian covariance and Wick subtraction from `A_E`.

Then

\[
\boxed{0\preceq8\mathcal M(A_E)
\preceq\frac{\beta}{1-\epsilon/\mu}\,P.}
\]

Consequently the entire recomputed Wick-corrected Hessian obeys

\[
\boxed{A_E-8\mathcal M(A_E)\succeq
c_\theta R+\left[c_\theta+\mu-\epsilon-
\frac{\beta}{1-\epsilon/\mu}\right]P.}
\]

**Proof.** By `HP≥μP`, we have `A_0≥μP`; hence `−εP≤E≤εP` implies

\[
(1-\alpha)A_0\preceq A_E\preceq(1+\alpha)A_0,
\qquad\alpha=\epsilon/\mu<1.
\]

Inversion reverses positive-operator order, so `0<A_E^{-1}≤(1−α)^{-1}A_0^{-1}`. Compression through the unchanged face source preserves this order. The full Wick map `Γ↦\mathcal M(Γ)` is a positive linear **order-preserving** map because its kernel is the Hadamard/Schur product of the positive fixed history kernel with the conjugate positive face covariance, followed by a linear compression. Therefore `8\mathcal M(A_E)≤(1−α)^{-1}8\mathcal M(A_0)≤β(1−α)^{-1}P`. On the positive geometric sector, `H≥μP` and `E≥−εP`; the clock energy contributes at least `c_θ`. On the two-dimensional geometric nullspace, `E=0` and `\mathcal M=0` (source orthogonality), so the original golden clock alone contributes `c_θ`. This establishes the stated direct-sum operator lower bound. QED.

The robust positive-sector margin is

\[
\delta_\epsilon=\mu-\epsilon-\frac{\beta}{1-\epsilon/\mu}.
\]

It remains positive whenever

\[
\boxed{\epsilon<\mu\left(1-\sqrt{\beta/\mu}\right)
=0.17073788799194\ldots.}
\]

For the `1/100` perturbation in Lockwood's image, this gives

| Quantity | Number |
|---|---:|
| `ε` | `0.010000000000` |
| Covariance inflation upper factor `1/(1−ε/μ)` | `1.013263795278` |
| Recomputed full nonlocal Wick norm upper bound `β/(1−ε/μ)` | `0.466725474862` |
| Perturbed bare geometry positive-sector gap `μ−ε` | `0.753932022500` |
| **Certified surviving positive-sector margin `δ_ε`** | **`0.287206547638`** |
| Unit source dual response upper bound `1/δ_ε` | `3.481814771366` |
| Protected full 190×24 lowest clock sector | `0.002558406375` |

This is a finite theorem for a specified **free-Gaussian-reference Wick subtraction** and its unchanged nonlinear-source/history kernels; it does not infer a general interacting Gibbs covariance or a physical lattice Yang–Mills gap.

## 4. Necessary qualification — arbitrary 0.01 perturbations can close the full gap

The smallest eigenvalue of the *full* unperturbed 190×24 Wick-corrected Hessian is **not** the co-closed `μ`; it is the much smaller golden-clock energy `c_θ≈0.0025584` on the original geometry's two null directions. If an arbitrary self-adjoint rank-one perturbation acts there, choose `E=−0.01 |u\rangle\langle u|` with `u` a unit geometric-null / lowest-clock eigenstate. The Wick source vanishes on `u` and the new eigenvalue is exactly

\[
c_\theta-0.01=-0.00744159362472\ldots<0.
\]

So a bare norm bound `||E||≤0.01` **without the subspace-preservation hypothesis is insufficient** to guarantee a positive full Cathedral operator. This is why Lockwood's forest-gauge/block-average constraints, and the Cathedral's co-closed/null-mode projections, are essential rather than cosmetic.

## 5. Independent original-model execution

`cathedral_perturbation_stable_nonlocal_wick_2026_11_08.py` imports the actual `cathedral_constructed_joint_dynamics_2026_11_07.py` (`SHA256 5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd`), retaining all five solids, the original 190 cochains, native 64-history source, 24 clock modes, nonlocal charge-2 history Schur kernel and the original 50→8→12 source. It diagonalises the 190 geometry and recomputes **all 24 frequency blocks** of the Gaussian face covariance and nonlocal Wick counterterm under two actual negative-semidefinite norm-`0.01` perturbations inside the positive geometric sector (one pure triplet and one full eight-carrier mixing).

Both perturbed systems retain the protected minimum `0.002558406375...`, satisfy the covariance inflation bound, and have positive full Wick-corrected spectra. The script also explicitly exhibits the unrestricted null-sector perturbation counterexample. All assertions passed on 8 November 2026; the accompanying `verify.log` records values and SHA256.

**Citation distinction:** Lockwood's supplied perturbation-stable forest-gauge inequality motivates this exercise. The abstract min–max perturbation, inverse monotonicity and positive Schur map arguments are standard operator methods. The nonlocal Wick recomputation and source-projected numerical certificate use the *independently constructed Cathedral operator*, and none of the external Yang–Mills source material is copied.