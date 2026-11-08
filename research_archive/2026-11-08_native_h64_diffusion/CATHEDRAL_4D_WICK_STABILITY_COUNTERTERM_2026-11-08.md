# Newton's Cathedral — Exact Wick counterterms, a finite-cutoff instability, and a geometry-fixed stability repair

**Date:** 8 November 2026. **Source:** the original Cathedral five-Platonic / six-bit 64-history, eight-hidden-quartet source action as archived on 28 October and 7 November. **Verification:** `cathedral_4d_wick_stability_counterterm_2026_11_08.py`, which imports the unmodified original full joint model and uses exact rational/surd arithmetic. This is a new finite-cutoff renormalisation calculation for the *specified* static hidden quartic; it does not import external Yang–Mills research code.

## 1. From exact hidden quartic to its normal-ordered form

Retain the original `20×12` icosahedral face–vertex incidence `C`, the hidden projectors `P3,P5` (rank four each), and `z=Cx` for a **real** vertex field `x∈R¹²`. Define

\[
Q_s(x)=\|P_s(z\odot z)\|^2=(z\odot z)^T P_s(z\odot z),\quad s\in\{3,5\}.
\]

Choose the explicit Gaussian reference `x~N(0,σ²I12)` and let `S=CC^T`, so `E[z_fz_g]=σ² S_fg`. Wick's theorem for four real Gaussian factors reads

\[
:z_f^2z_g^2:=z_f^2z_g^2-\sigma^2S_{ff}z_g^2
-\sigma^2S_{gg}z_f^2-4\sigma^2S_{fg}z_fz_g
+\sigma^4(S_{ff}S_{gg}+2S_{fg}^2).
\]

For the actual icosahedron every face has `S_ff=3`; because `P3 1=P5 1=0`, all terms involving the common diagonal variance cancel on summation. Define the exactly determined real `12×12` source counterterm matrices

\[
\boxed{M_s=C^T\big[P_s\odot(CC^T)\big]C.}
\]

Then the **complete** fourth-order Wick identity is

\[
\boxed{:Q_s(x):_{\sigma}
=Q_s(x)-4\sigma^2 x^TM_sx
+2\sigma^4\operatorname{Tr}\!ig[P_s((CC^T)\odot(CC^T))\big].}
\]

The exact trace factors from the prior incidence theorem are `24` for `s=3` and `8` for `s=5`. Thus the constant terms are `48σ⁴` and `16σ⁴`. This is normal ordering of the **entire quartic** in the underlying vertex Gaussian field, distinct from the automatic centring of the individual hidden quadratic source `h_s=P_s z²`.

## 2. The counterterm spectra are forced by the original A5 geometry

Use exact `SymPy` arithmetic over `Q(sqrt(5))`: build the genuine integer incidence `C` and `Lface`, compute

`Ph=I−C(C^TC)^−1 C^T`, `P3=Ph(5I−Lface)/2`, `P5=Ph(Lface−3I)/2`.

The two independently calculated counterterm matrices have the **complete exact spectra**:

\[
\operatorname{spec}(M_3)=
\left\{0^{(1)},
\left(2-\tfrac{4\sqrt5}{5}\right)^{(3)},
\left(2+\tfrac{4\sqrt5}{5}\right)^{(3)},
\left(\tfrac{12}{5}\right)^{(5)}\right\};
\]

\[
\operatorname{spec}(M_5)=
\left\{0^{(1)},\left(\tfrac23\right)^{(6)},
\left(\tfrac45\right)^{(5)}\right\}.
\]

They commute and preserve the original `1⊕3⊕3′⊕5` vertex decomposition. Both are positive semidefinite. These are genuine **mass-counterterm channel coefficients determined by finite geometry**; no experiment or fitted running coefficient appears.

## 3. A rigorously demonstrated failure of naive Wick ordering

Keep the original static, native-H64-eliminated source potential

\[
V_{\mathrm{eff}}(x)=\frac12x^TL_{\rm ico}x
 +c_3Q_3(x)+c_5Q_5(x),
\quad c_3=\frac29,\quad c_5=\frac7{32}\Delta^2.
\]

Take an `A5` triplet unit vector `v` in the lowest nonzero icosahedral vertex Laplacian eigenspace,

\[
L_{\rm ico}v=(5-\sqrt5)v.
\]

The original source selection rule gives **exactly** `P3[(Cv)²]=P5[(Cv)²]=0`. Thus `Q3(tv)=Q5(tv)=0` for every amplitude `t`. But the just-derived counterterm matrices have

\[
v^TM_3v=2+\frac{4\sqrt5}{5},\qquad v^TM_5v=\frac23.
\]

If one substitutes the Wick quartics `:Q_s:_σ` while leaving the original quadratic term fixed, the energy along this genuine source-free triplet is

\[
V_{\rm Wick}(tv)=
\left[\frac{5-\sqrt5}{2}-4\sigma^2m_*\right]t^2
 +\mathrm{constant},
\]

where

\[
\boxed{m_*:=\frac29\left(2+\frac{4\sqrt5}{5}\right)
+\frac7{48}\Delta^2.}
\]

Therefore the Wick-ordered action is unbounded below along this ray as soon as

\[
\boxed{\sigma^2>\sigma^2_{\rm crit}
=\frac{5-\sqrt5}{8m_*}
=0.4103377795515251\ldots.}
\]

For the explicit finite-cutoff reference `σ²=1/2`, the coefficient of `t²` is `−0.301971076824644`; this was computed directly on an exact triplet eigenvector of the original `12×12` vertex Laplacian. This is a **counterexample to the shortcut** “Wick-order the positive quartic without adjusting its quadratic terms.” The old positive action itself has not failed: the instability is introduced by the proposed bare-parameter-free Wick replacement.

## 4. A unique *minimal uniform scalar* stability repair at every finite cutoff

The combined Wick-induced quadratic subtraction is

\[
-4\sigma^2 x^T Mx,\qquad
M=c_3M_3+c_5M_5\succeq0.
\]

The exact largest eigenvalue is the previously derived `m_*`, occurring on the lowest triplet, so the smallest scalar `m_ct²` such that the **entire induced quadratic correction** plus `+m_ct²|x|²/2` is nonnegative for all `x` is uniquely

\[
\boxed{m_{\rm ct}^2(\sigma)=8\sigma^2\lambda_{\max}(M)
=8\sigma^2\left[\frac29\left(2+\frac{4\sqrt5}{5}\right)
+\frac7{48}\Delta^2\right].}
\]

**Proof:** by the variational characterization of the top eigenvalue,

\[
\frac12m_{\rm ct}^2\|x\|^2-4\sigma^2x^TMx
=4\sigma^2x^T[m_*I-M]x\ge0,
\]

and equality is attained in the top eigenspace; any smaller **uniform scalar mass coefficient** gives a negative direction. At `σ²=.5`, `m_ct²=3.367874176149498`. This is the smallest scalar correction that fully offsets the Wick quadratic subtraction while preserving the original positive quadratic lower bound—not necessarily the smallest coefficient that would merely prevent negative energy after allowing the original finite bare mass to help.

This is a **derived finite-cutoff stability prescription**, not a physical mass prediction or a claim that a cutoff-independent interacting quantum theory has already been constructed. The mass counterterm depends on Gaussian variance, which itself runs with the regulator. The full momentum-dependent native-H64 Schur contact and gauge-current constraints must be retained in a true continuum construction.

## 5. A precisely quantified 4D ultraviolet fluctuation obstruction

For the previously constructed free Gaussian four-dimensional sector with temporal kinetic coefficient `r²`, spatial coefficient `D=r²/5`, and an *isotropic equal-mass vertex reference*, a rotationally symmetric cutoff in rescaled momentum gives the standard bubble at external momentum zero:

\[
\boxed{B_\Lambda(0;m^2)=
\frac{\log(1+\Lambda^2/m^2)-\Lambda^2/(\Lambda^2+m^2)}
{16\pi^2rD^{3/2}}.}
\]

It has asymptotic logarithmic growth 

\[
B_\Lambda(0;m^2)\sim\frac{\log\Lambda}{8\pi^2rD^{3/2}}
\quad(\Lambda\to\infty).
\]

The hidden quadratic-source two-point function carries the positive coefficients `(12P3+4P5)` (or `(12P3+4Δ²P5)` after modular weighting) multiplying the bubble. Thus `P_h` removes the equal-face tadpole **but does not cancel this positive logarithmic composite fluctuation**. This is a concrete ultraviolet issue localized to the actual hidden source, not an unsupported general warning about quantum field theory.

The test evaluated the exact cutoff formula at `Λ=100,1000,10000` and checked the analytic logarithmic coefficient. The ultraviolet calculation is for the specified free equal-mass reference, not a simulation of every interacting Cathedral particle source or an exact renormalization-group solution.

## 6. Reproduction, scope and credit

With NumPy, SciPy and SymPy, run the independently authored script in the same directory as the original 7 November joint-model source:

```bash
OPENBLAS_NUM_THREADS=1 python cathedral_4d_wick_stability_counterterm_2026_11_08.py
```

The script checks exact rational/surd characteristic spectra of `M3,M5`, equality of the two projector trace invariants, commutation of counterterms, pure-triplet hidden-source absence, the sharp instability threshold, 100 randomized stability-corrected quadratic samples, and 4D logarithmic bubble asymptotics. The accompanying execution log records SHA256 of the source inputs. No measured masses or couplings enter any check.

The separate Yang–Mills/energy-dual work shared from **James Montgomery Lockwood** and coauthors remains attributed in the dedicated curvature-response references: Deep Bhattacharjee, Ushashi Bhattacharya, James Montgomery Lockwood and Tristan Romanov, *One Cube Estimate Implies the Yang–Mills Mass Gap*, Hexagon preprint 2610.00341v7 (2026), https://hexagonmath.org/2610.00341v7. No external manuscript or code is included here.