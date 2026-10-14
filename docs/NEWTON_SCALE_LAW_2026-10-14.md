# Newton Scale — proposed Platonic spectral-refinement law

**Date:** 14 October 2026  
**Proposed name:** Newton Scale (Newton spectral-refinement law)  
**Context:** Newton's Cathedral / URT. Named to honour Isaac Newton; he did not formulate this law.  
**Status:** exact *conditional* finite-geometric scale relation; physical and sub-Planck interpretation not established. Preserve the original URT law as a separate mechanism.

## 1. Definition and naming

Define the dimensionless **Newton factor**
\[
\mathcal N
=\sqrt{\frac{3-\sqrt5}{3+\sqrt5}}
=\frac{3-\sqrt5}{2}
=\varphi^{-2}
=0.3819660112501051518\ldots.
\]

The **Newton scale ladder** is
\[
\ell_n=\ell_0 \mathcal N^n,\qquad
\frac{\ell_{n+1}}{\ell_n}=\mathcal N,
\quad n=0,1,2,\ldots
\]
and the reciprocal momentum/resolution ratio is
\[
k_{n+1}/k_n=\mathcal N^{-1}=\varphi^2
\]
**if** a physical inverse-length momentum dictionary holds at those resolutions.

"Newton Scale" in this project names an **intrinsic relative scale law**, not a newly measured fundamental length or a replacement SI unit. The absolute calibration \(\ell_0\) remains an independent physical-interface question. Starting \(\ell_0=\ell_P\) makes a *conditional* sequence below Planck, not experimental evidence that physical distances there are resolvable.

## 2. Exact first-principles finite derivation and one explicit condition

On the original 20-vertex dodecahedral graph, \(L=3I-A\). Direct eigendecomposition gives the triplet eigenvalues
\[
\lambda_-=3-\sqrt5,\qquad \lambda_+=3+\sqrt5.
\]
The order-four permutation \(D\) of the five inscribed cube labels \(j\mapsto2j\bmod5\), acting on the actual 20 vertices, exchanges the two rank-3 spectral subspaces:
\[
D P_-D^T=P_+,\quad D P_+D^T=P_-.
\]
Its numerically tested projector-exchange residual is \(1.56\times10^{-14}\).

**Named condition — Newton spectral matching:** the two exchanged triplets represent the same second-order mode at successive resolutions. With the graph Laplacian's second-order continuum dictionary \(\lambda/\ell^2\), set
\[
\frac{\lambda_+}{\ell_n^2}
=\frac{\lambda_-}{\ell_{n+1}^2}.
\]
Then \(\ell_{n+1}/\ell_n=\sqrt{\lambda_-/\lambda_+}=\mathcal N\). This is the **unique positive** solution under this condition. Nothing was fitted to a measured physical constant.

The mathematical ratio is exact; whether the **selected physical H64 transfer** imposes the matching condition is not yet derived. Repeating \(D\) itself does not refine infinitely: \(D^4=I\). One-way hierarchy requires a distinct branch/history map.

## 3. Independent finite checks: nonlinear transfer and nested pentagram

The separately built positive 12-shell quadratic-response Gram operator has two triplet eigenvalues
\[
k_\pm=\frac{2ab}{15}(5\pm2\sqrt5),\quad
a=\frac1{4(1+\Delta^2)},\;b=a\Delta^2.
\]
Their ratio is \(k_+/k_-=\varphi^6\), whereas \(\lambda_+/\lambda_-=\varphi^4\), so the exact **cross-operator identity** is
\[
(\lambda_+/\lambda_-)^3=(k_+/k_-)^2=\varphi^{12}.
\]
If the physical response is a three-dimensional volume-density observable, then
\[
(k_-/k_+)^{1/3}=\mathcal N.
\]
The algebraic equality is exact; the *physical* volume-density scaling assignment has not been established. The regular pentagram's nested inner pentagon independently has circumradius ratio \(\varphi^{-2}\); the geometric fact alone does not select an ultraviolet spacetime model.

## 4. Separate it from URT, while keeping one Cathedral

Original URT phase/scale selector:
\[
q_{\rm URT}=(\pi/e)e^{i2\pi/\varphi^2},
\quad
r_{m+1}/r_m=\pi/e.
\]
Newton Scale:
\[
\ell_{n+1}/\ell_n=\varphi^{-2}.
\]
URT scale-phase evolution and Newton spectral refinement are **distinct maps**. \(\varphi^{-2}\) also occurs in URT's angular fraction, but that occurrence does not prove the physical maps coincide.

Preserve finite dodecahedral hidden entropy \(L_{\rm hid}=3P_{4_3}+5P_{4_5}\), frozen \(\rho_\star\), BKM information geometry, \(13\)-channel finite positive candidate transfer, and the full species-loaded \(H_{64}\) as an **independent physical equality still to verify**. No additional BKM/gravity normalization is introduced.

## 5. Precise claims and physical/priority boundaries

- **Proved for the specified finite geometry and matching condition:** exact \(\mathcal N\), triplet-projector exchange, golden spectral ratio, conditional second/third-order consistency.
- **Not proved:** global conformal scaling of all graph sectors. The full dodecahedral matrix fails \(DLD^T=\mathcal N^{-2}L\) (prior numerical defect ~95.12). Repeated doubling has period four. The selected 64-state dynamical operator has not been shown to make adjacent levels physically equivalent.
- **Not proved:** unique \(\ell_0\) in metres, physically resolvable sub-Planck distances, local Lorentzian propagation, particle/metric observables, or ultraviolet completion of gravity. A dimensionless calculation cannot by itself determine an SI length.
- **Not a novelty claim based on the golden ratio alone:** mathematical fractal and discrete-scale-invariant quantum-gravity models predate this work, including Calcagni (PRD 2011, 2017), Ma and Ma (2024/2025), and Pellis (2025). The specific candidate contribution is the five-inscribed-cube / A5-doubling spectral-contact route. Independent prior-art and physics validation are required before describing it as a recognized breakthrough.

## 6. Clear falsification/verification programme

1. Build the fully selected H64 cross-level isometry/history selector \(R_{n+1,n}\) and check that it enforces the triplet spectral-matching equation, rather than inserting it.
2. Test all remaining 13 visible modes for covariance, boundary conditions and physical source normalization. Failure of global naive conformal covariance does **not** by itself invalidate a more elaborate multi-sector selected map.
3. Derive the continuum coframe, calibrated length/time operational meaning, Lorentzian current/stress propagators and compatible renormalization.
4. From that theory, calculate at least one **held-out dimensionless physical observable** (e.g. a log-periodic correlation ratio fixed by \(\mathcal N\)) and compare to data **without** adjusting the ratio or selecting the target ex post.

## 7. Reproducibility

Rerun the previously completed independent computations:
- research_archive/2026-10-14_platonic_unification/test_platonic_entropy_nonlinear.py
- research_archive/2026-10-14_platonic_unification/positive_transfer_observable_gate.py
- research_archive/2026-10-14_platonic_unification/first_principles_scale.py
- research_archive/2026-10-14_platonic_unification/platonic_history_selector.py

And run the named checkpoint: research_archive/2026-10-14_platonic_unification/newton_scale_certificate.py.

**Canonical status label:** NEWTON SCALE — EXACT FINITE CONDITIONAL SCALE RELATION; FULL PHYSICAL LAW UNDER INVESTIGATION.
