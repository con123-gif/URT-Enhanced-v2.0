# Newton's Cathedral — exact all-five (50→8→12) complex-Wick counterterms and 24-clock stability

**8 November 2026 | Original Cathedral mathematics | Independently executed.**

This calculation corrects the prior **12-independent-icosahedral-vertex Gaussian reference** used in `CATHEDRAL_4D_WICK_STABILITY_COUNTERTERM_2026-11-08.md`. That calculation is valid for its restricted 12-field model, but **not** the Gaussian source covariance of the actual 7 November all-five portal. The new result uses the original, unchanged 190-cochain / 50-vertex / 64-history / 24-clock implementation. It extends the Wick calculation to circular **complex** vertex fields, so the local charged source and counterterms respect the actual clock `U(1)` covariance.

## 1. The original projector, with no reduced 13-state substitute

Let `E ∈ R^{50×8}` be the original all-five orthonormal collective degree-one/two spatial-moment matrix, `I ∈ R^{12×8}` the corresponding icosahedral matrix, and `Q = I Eᵀ` the original portal. The code verifies `EᵀE = IᵀI = I8`. The 12-component covariance after an **independent white circular complex** 50-vertex Gaussian source `v ~ CN(0,σ²I50)` is

\[
\operatorname{Cov}(Qv)=\sigma^2 QQ^T=\sigma^2 P_W,\qquad W=3\oplus5,
\]

where `P_W` is the **exact** icosahedral 12-vertex `A5` spectral projector onto its `3⊕5` carrier. In particular, it is *not* `I12`. With original face-incidence `C ∈ R^{20×12}`, define

\[
S=C P_W C^T,\quad z=CQv,\quad h_s=P_s(z\odot z),\quad s\in\{3,5\}.
\]

The exact face variance is independent of face and equals

\[
S_{ff}=\frac32+\frac{3\sqrt5}{10}=2.170820393\ldots,
\]

not the old twelve-independent-vertex reference `S_ff=3`. The original full 190-cochain geometry, 64-state history and 24 charged clock remain present in the unchanged construction.

## 2. Exact hidden source covariance in the 50-vertex reference

The **original** hidden projectors satisfy `P3 P5=0` and each has rank 4. The exact `A5`-symmetric Hadamard-matrix calculation gives

\[
\boxed{P_3 (S\odot S) P_3 =\left(3+\frac{6\sqrt5}{5}\right)P_3,\qquad
P_5 (S\odot S) P_5=P_5.}
\]

The mixed hidden projection vanishes. For circular complex Gaussian vertices, the two-point Wick/Isserlis identity gives

\[
\boxed{\operatorname{Cov}(h)=2\sigma^4\left[\left(3+\frac{6\sqrt5}{5}\right)P_3+P_5\right].}
\]

After the **original positive Gibbs amplitude** `B=P3+ΔP5`, it becomes

\[
\operatorname{Cov}(Bh)=2\sigma^4\left[\left(3+\frac{6\sqrt5}{5}\right)P_3+\Delta^2P_5\right].
\]

Hence, for the genuine face Laplacian pseudoinverse `Lface^† P3=P3/3`, `Lface^†P5=P5/5`, the exact energy–dual susceptibility is

\[
\boxed{\mathbb E\langle Bh,L_{\mathrm{face}}^\dagger Bh\rangle
=\left(8+\frac{16\sqrt5}{5}+\frac85\Delta^2\right)\sigma^4.}
\]

The earlier `16+(16/5)Δ²` coefficient belongs to the **different 12-dimensional white Gaussian reference**. The correct coefficient in the original all-five source is above. No measured data are used.

For circular complex Gaussian fields, `E[z_f^2]=0` automatically by global `U(1)` symmetry; the hidden-source mean vanishes even without projection. In the *real* Gaussian reference, the same mean is removed by the hidden projectors whenever the face variances are `A5`-invariant (as verified here). These two centring mechanisms must not be conflated.

## 3. Exact `U(1)`-covariant complex normal ordering

For a circular complex field with `E[z_f \bar z_g]=σ² S_fg`, Wick's theorem gives

\[
:z_f^2 \bar z_g^2: = z_f^2\bar z_g^2
-4\sigma^2 S_{fg}z_f\bar z_g+2\sigma^4 S_{fg}^2.
\]

For `Q_s(v)=\|P_s(z\odot z)\|^2`, define the **actual 50×50 Hermitian counterterm matrix**

\[
M_s=Q^T C^T[P_s\odot S]CQ.
\]

Then the normal-ordering identity holds **exactly**, for *every complex source field*:

\[
\boxed{:Q_s(v):_\sigma=Q_s(v)-4\sigma^2v^\dagger M_s v
+2\sigma^4\operatorname{Tr}[P_s(S\odot S)].}
\]

All terms are invariant under `v_j→exp(iα_j)v_j` at each of the 24 clocks. The history fields transform with charge 2, as in the original source-loaded action. No third-party source or Yang–Mills proof is used.

## 4. Full 50-dimensional **exact** counterterm spectra

The original integer face-incidence matrices and the exact 12-vertex `A5` projectors were reconstructed over `Q(√5)` and checked symbolically. The 50×50 matrices have spectra

\[
\boxed{\begin{aligned}
\operatorname{spec}(M_3)&=0^{(42)}\oplus
\left(2+\frac{4\sqrt5}{5}\right)^{(3)}\oplus
\left(\frac65+\frac{12\sqrt5}{25}\right)^{(5)},\\
\operatorname{spec}(M_5)&=0^{(45)}\oplus
\left(\frac45\right)^{(5)}.
\end{aligned}}
\]

**New cancellation:** `M5` vanishes identically on the source `3`-carrier in the original all-five portal. Its previously reported `2/3` triplet eigenvalue is present only in the 12-independent-vertex reference. This is the source of the corrected stabilising coefficient.

With native static hidden contact constants `c3=2/9`, `c5=(7/32)Δ²`, set `M=c3M3+c5M5`. Its maximal eigenvalue is exactly

\[
m_* = \frac29\left(2+\frac{4\sqrt5}{5}\right)
\]

on the 3-dimensional `A5` carrier. (The five-dimensional competing eigenvalue is lower.) The unique **minimal *uniform scalar mass coefficient restoring the original quadratic lower bound*** at circular-Gaussian variance `σ²` is

\[
\boxed{m_{\mathrm{ct},50}^2(\sigma)=8\sigma^2 m_*.}
\]

At `σ²=1/2`, this is **3.367870561777628**, rather than the 12-vertex value **3.367874176149498**. These are **different covariance choices**, not a claimed change in the original physical mass.

A more precise anisotropic cancellation restores the original static quartic **identically** at every fixed cutoff:

\[
\sum_s c_s:Q_s(v):_\sigma
+4\sigma^2 v^\dagger Mv
-2\sigma^4\sum_s c_s\operatorname{Tr}[P_s(S\odot S)]
\equiv\sum_s c_sQ_s(v).
\]

This tensor counterterm is automatically local in spacetime/clock position (though it mixes the original 50 vertex-carrier coordinates at a site), Hermitian, and `U(1)` invariant. It is fixed once the **white 50-vertex Gaussian reference**, original source and frozen contact normalization are specified. The identity is finite-cutoff algebra, not a proof that all multi-loop counterterms vanish.

## 5. Instability witness in the **actual** 190×64×24 system

This was not tested on an artificial 12-dimensional stand-in. Embed an `Eglobal` 3-carrier unit vector into the **original five-polyhedron vertex slots** of the 190-dimensional cochain, keep every edge, face and history field at zero, and put a clock Fourier profile `exp(2πi 9j/24)` across all 24 sites. For these fields, the actual native `P3` and `P5` quadratic hidden sources vanish *identically*, so no positive quartic survives along the ray.

The actual original all-five geometric kinetic plus positive 190D bridge gives the triple-degenerate quadratic coefficient

\[
\kappa_{3,\mathrm{geom}}=2.470955814463733,
\]

and the charge-1 golden clock adds `r² ℓ1` with `r=π/e` and `ℓ1=2−2cos(2π/φ²−3π/4)=0.00191539675376728`. The full 24-track Wick-ordered static source energy along this ray is, apart from a constant,

\[
\frac1{24}V_{\mathrm{Wick}}(t)
=\left[\frac12(\kappa_{3,\mathrm{geom}}+r^2\ell_1)-4\sigma^2m_*\right]t^2.
\]

This is unbounded below whenever

\[
\boxed{\sigma^2>\frac{\kappa_{3,\mathrm{geom}}+r^2\ell_1}{8m_*}
=0.367222281181353.}
\]

At `σ²=0.5` the coefficient is **−0.447178170469307** per clock site. The original full-model code was used to verify the source-free ray, 24-clock geometric energy and predicted quadratic coefficient at amplitudes `t=1,10,100`. The *tensor* and minimal *uniform* repairs in §4 cancel the negative Wick quadratic correction and preserve the original positive finite-cutoff transfer conditions.

This corrects the previous **0.41033777955** threshold for the isolated 12-vertex static model: that threshold was calculated in a different reference and without the original five-solid bridge and golden 24-clock kinetic term.

## 6. What this establishes and what it does not

This exact model-specific result derives the full-50 complex Gaussian source Wick tensor, its rank and eigenvalues, the `U(1)`-compatible local counterterms, and a constructive instability/stability test inside the *actual archived* 190/64/24 model. The counterterm has a fully analytic source and is fixed at each specified regulator variance; **it is not an empirically chosen mass term**.

The actual field covariance of a renormalised, interacting four-dimensional quantum model generally differs from white `CN(0,σ² I50)`. For general Gaussian covariance `Γ50`, replace `S` by `C QΓ50Q^T C^T` in the complex Wick formula, and recompute the corresponding tensor. The full interacting continuum and its Ward/Schwinger–Dyson consistency require those covariance-dependent terms at each scale; this note does not claim to have solved the complete quantum field theory or Einstein–Yang–Mills system.

**Reproduction:** place `cathedral_full50_complex_wick_2026_11_08.py` next to the unmodified original `cathedral_constructed_joint_dynamics_2026_11_07.py`, then run:

```bash
OPENBLAS_NUM_THREADS=1 python cathedral_full50_complex_wick_2026_11_08.py
```

The verifier checks exact symbolic `A5` spectra, all-five projector equality, hidden covariance, charge-one `U(1)` rotations, 50-dimensional counterterm positivity, the original full 24-clock source-free instability, and the spectral counterterm correction. `cathedral_full50_complex_wick_2026_11_08.verify.log` records all PASS messages and the original source SHA256.

**External credit:** The separate finite block Poincaré and energy-dual Yang–Mills work shared by James Montgomery Lockwood and colleagues is cited in the Cathedral curvature-response archive. This derivation uses only the original Cathedral source code, integer incidence matrices, finite Gaussian Wick calculus, and standard spectral theory; no external research paper/code has been copied.