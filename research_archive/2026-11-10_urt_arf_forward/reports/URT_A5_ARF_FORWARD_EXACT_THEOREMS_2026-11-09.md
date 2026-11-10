# Newton's Cathedral — URT-first six-bit history, A5 coupling, four-pole transfer, and 24-clock Ward calculation

**Date:** 9 November 2026  
**Provenance:** calculations from the archived, unchanged 7 November 2026 full five-Platonic/64-history/24-clock executable; the original v61 complex URT map; exact graph and group reconstruction. No historical ARF coefficients or measured physical constants supplied to these computations. No GitHub modification.

## Status distinction

**Exact under the displayed definitions:** URT binary coding on its invariant circle; Haar-typical six-bit distribution; icosahedral pair orbit; pair-flip graph and spectrum; its commutation with chronology; exact original-source Walsh support and all scalar lags in Q(sqrt5); symmetry-restored transition operator and its quartet minimal polynomials; source-traced four-pole resolvents once A5 averaging is selected; the original 24-clock covariant difference; the 24-winding selection rule.

**Conditional, not independently selected by primitive URT:** identify successive binary symbols with the six *named* icosahedral axis signs; select the minimum nontrivial parity-preserving *equal-conductance* pair-flip rule; average chronological dynamics over 60 spatial rotations to remove the preferred axis order; use the 24-track cyclic fibre as a physical temporal clock; choose the complementary cost `18I-K` rather than the original positive Gaussian kinetic energy `K`; choose a Wilson-covariant cyclic AR(1) source ensemble.

**Not proved:** the historical four ARFs as unique physical rail, electromagnetic and fermion-mass response coefficients from one canonical matter+gauge transfer; their identification with nature.

## 1. URT recursion and literal 64-history coding

On the original URT complex-map invariant circle `r*=9/13`, the map is exactly conjugate to doubling on the circle:

\[
\theta_{t+1}=2\theta_t+\omega\pmod {2\pi},\quad
\omega=2\pi/\phi^2,\qquad x_t=(\theta_t+\omega)/(2\pi),\quad x_{t+1}=2x_t\pmod1.
\]

Lebesgue measure is the invariant absolutely continuous measure; its binary digits yield `64` equiprobable six-bit words. The chronological conditional-expectation matrix `Q` has exactly two entries `1/2` per row, at `2h mod64` and `(2h+1) mod64`. Binary counting proves **exactly**

\[
Q^6=\mathbf1\mathbf1^T/64.
\]

This gives finite memory for mean-zero sources and an O(number of histories) sparse update. It is not the separate 2025 piecewise scalar URT prototype whose local derivative bound is not globally valid across its discontinuity.

## 2. The complete original six-bit kinetic operator as the unique minimal parity-preserving A5 graph

Six icosahedral antipodal axes have 15 unordered pairs, constituting one orbit of all 60 proper rotations. Under the **stated locality/parity premise** (change two signs; equal unweighted graph links), symmetry fixes the pair-flip adjacency and Laplacian

\[
K=15I_{64}-\sum_{1\le i<j\le6}X_iX_j.
\]

This is identical, entry for entry, to the original archived `Hbits`. Walsh characters of degree `d` have energy `18-(6-2d)^2/2`, giving

\[
\operatorname{spec}K=\{0^{(2)},10^{(12)},16^{(30)},18^{(20)}\}.
\]

The actual URT chronological transition satisfies **`QK=KQ`**: on Walsh characters `Q` either lowers the bit positions while preserving degree or annihilates the character. This is an exact compatibility of the original history kinetic operator and the primitive recursion. Choosing **unit** conductance is still an explicit graph convention; O(N) complexity does not set an absolute physical rate by itself.

## 3. Exact first-principles source coefficients in Q(sqrt5)

The unchanged all-five harmonic embedding is `v50=Eglobal a`; because `Eglobal^T Eglobal=I8` and the original source input is `Plinear=Iico Eglobal^T`, the icosahedral source input is exactly `Iico a`. This is a verified subspace identity **within the 190-dimensional five-solid complex**, not a replacement of the whole theory by the centered 13-state cell.

The 20 face sums and hidden projectors `P3,P5` were reconstructed exactly from integer vertex–face incidence and rational face spectral projectors. All 64 signed-history source values were calculated in the exact algebraic field `Q(sqrt5)`. The resulting source is in Walsh degree 3 for the hidden `4_3` and degrees 2 and 4 for the hidden `4_5`. Thus the lag-five covariance vanishes, and the chronological source correlations are **exactly**

\[
\begin{aligned}
C_3(0)&=36+72\sqrt5/5,&C_3(1)&=18/5+36\sqrt5/25,\\
C_3(2)&=27/25+9\sqrt5/25,&C_3(3)&=36/25+18\sqrt5/25,\\
C_3(k)&=0&&(k\ge4),
\end{aligned}
\]

\[
(C_5(0),C_5(1),C_5(2),C_5(3),C_5(4))
=(7,7/40,-61/120,-1/24,-1/6),\quad C_5(k)=0\ (k\ge5).
\]

This is an actual exact-number-field calculation, not recognition of close decimals.

## 4. Conditional isotropy restoration yields a *new* four-pole URT feedback theorem

The chronological `Q` selects an ordered sequence of axes and is not invariant under the 60 icosahedral rotations. If the physical history kernel is required to be the **rotational average** of this specific URT kernel, there is an exact, unfitted Haar-group average

\[
\bar Q=\frac1{60}\sum_{g\in A_5}U_g^{-1}Q U_g.
\]

`Qbar` is stochastic, doubly stochastic, contractive in the Haar inner product, and commutes with `K`. It differs from `Q`: its correlations last indefinitely, with nontrivial spectral radius `1/6`. This averaging is a **selection postulate**, not a consequence of computation being O(N).

Construct the exact rational `A5` four-irrep projector `P4=(4/60)sum_g chi4(g) U_g`, using integer conjugacy character `[4,0,1,-1]` for element orders 1,2,3,5. The original source was proved to lie in this projector, including its even and odd Walsh sectors, using exact `Q(sqrt5)` arithmetic. Integer-matrix multiplication gives **exact zero** for

\[
(\bar Q-3I/20)(\bar Q-I/20) P_{4,\mathrm{odd}}=0,
\]

\[
(\bar Q-I/15)(\bar Q+I/20) P_{4,\mathrm{even}}=0.
\]

A5-equivariance preserves the exact lag-one scalar source covariance under the rotational average. The two roots and the exact lag-zero and lag-one values therefore fix the residues:

\[
\boxed{\mathcal R_3(z)=
(18+36\sqrt5/5)\left[(1-3z/20)^{-1}+(1-z/20)^{-1}\right]},
\]

\[
\boxed{\mathcal R_5(z)=
\frac{9/2}{1-z/15}+\frac{5/2}{1+z/20}}.
\]

These are **source-derived no-fit feedback functions of the conditional isotropized URT model**, not the historical four ARFs. At `z=1` the strengths are `(360/323)(36+72sqrt5/5)` and `605/84` respectively. The four poles were certified by integer matrices; the source residues and Walsh restrictions were certified with exact `Q(sqrt5)` arithmetic.

## 5. Native 24 temporal clock: distinct cyclic fibre, exactly recovered

A nontrivial deterministic 24-cycle cannot be a factor of the mixing doubling map: `D^24` is ergodic, while a 24-cycle factor would supply a nonconstant invariant observable under `D^24`. The finite six-bit shift likewise has `Q^6=J/64` and no nonconstant 24th-root eigenfunctions. In fact the previously proposed equal-phase-bin compressed kernel `B Q B^T` fails to commute with the physical cyclic shift (commutator norm `2.5676636236`). **A 24-clock must be retained as an extra fibre**, not silently equated with 24 phase bins.

On that existing cyclic fibre, the URT golden phase gives the canonical charged difference

\[
D_q=S-e^{-iq\omega}I,\quad L_{24}^{(q)}=D_q^\dagger D_q,
\]

which is identical entry for entry to the original November action for both geometry charge `q=1` and the *quadratic source* charge `q=2`. Combining with `K` and the original radial amplitude `r=pi/e` reconstructs the **unchanged** original Gaussian `1536 x 1536` kernel

\[
\mathcal K=I_{24}\otimes K+(\pi/e)^2 L_{24}^{(2)}\otimes I_{64},
\quad\lambda_{\min}=0.010228725137857565\ldots>0.
\]

On the selected hidden image the complementary energy `18I-K` has eigenvalues `0,2`. For the existing frozen rail gap `Delta`, its KMS amplitude obeys exactly

\[
\exp[-\eta_\Delta(18I-K)/2]U_h
=U_h(P_3+\Delta P_5),\quad \eta_\Delta=-\ln\Delta.
\]

**This is not the same as selecting `18I-K` from the bare positive Gaussian `K` action.** The KMS cost orientation remains a real physical selection question.

## 6. The source carried through the native 24-clock, then Ward-corrected

For an explicitly stated **uniform 24-bit periodic symbolic ensemble**, the exact lag correlations above can be Fourier-transformed, inserted into the native `18+r² L24^(2)` and `16+r² L24^(2)` Schur inverses, and averaged without enumerating `2^24` words. The resulting source history energy is

\[
V_{24}^{\text{periodic source}}=369.235261220978901786748\ldots,
\]

with a phase derivative `-1.033126439468528375516...` **if the real source is held fixed as the links change**. The latter is **not** a valid local-gauge-covariant electromagnetic current.

A separate **Wilson-covariant cyclic source completion**, using the *same four exact URT/A5 poles* with no fitted weights, has a positive covariance built as a sum of

\[
(1-\lambda^2)\left[(I-\lambda U_2[\theta])^\dagger
(I-\lambda U_2[\theta])\right]^{-1}
\]

where `U2[theta]` is the charged cyclic Wilson shift. Its trace energy satisfies the exact lattice Ward conjugation identity (checked against all 24 sites), with

\[
V_{24}^{\mathrm{Wilson}}=368.748778202225914264134\ldots,
\]

\[
\boxed{J_{\mathrm{Wilson}}(\omega)=-2.3593941934162064811\times10^{-16}+\cdots.}
\]

The 24 Fourier-mode root filter kills all phase harmonics below the first `cos(48 theta)` winding. The leading winding alone reproduces the current above, with a second-winding correction of order `8.03 x 10^-36`. This verifies that the previously order-one fixed-gauge source derivative is not a physical electromagnetic ARF. The Wilson-source covariance remains an **explicit conditional completion**.

## 7. The four historical ARFs — unchanged scientific boundary

The archived four scalar candidates are

\[
\Delta\delta=-\delta_*^3/63-\gamma/40,\qquad
R_\alpha=3/(64\phi)+1/(79\phi^2),
\]
\[
C_{\mathrm{mass}}=-5\delta_*^3/16+(7/8)\pi\phi,\qquad
R_{\mathrm{mass}}=(3/35)\delta_*^2-(4/51)\pi^3.
\]

These numbers were **not inputs to any source calculation above**. The v101 formulas contain geometrically recoverable ranks, but the present calculations do not prove that they are the derivatives of the correct physical rail/charged-matter/gauge/fermion-pole observables. In particular the historical `79` is not a physical hypercharge line in the generation-bilinear module; the full charged family lives in a different representation, and the old November source action has no spatial charged-matter gauge coupling. The no-free-parameter forward history/source calculation now has four provable **different** poles and a fully Ward-corrected clock response; one must not relabel them as physical ARFs.

## Reproducibility

Run the scripts in the companion archive with Python, NumPy, SciPy, SymPy, NetworkX and mpmath. The source `cathedral_constructed_joint_dynamics_2026_11_07.py` remains unchanged. The strongest certificates are:

- `URT_EXACT_SOURCE_WALSH_CORRELATIONS_2026-11-09.py` — exact `Q(sqrt5)` source and exact all lag coefficients;
- `URT_A5_SOURCE_POLE_INTEGER_CERTIFICATE_2026-11-09.py` — exact integer A5 quartet projector/minimal polynomials;
- `URT_A5_EXACT_SOURCE_ISOTYPIC_CERTIFICATE_2026-11-09.py` — original nonlinear source lies in the exact quartet projector;
- `URT_A5_AVERAGE_SOURCE_RESOLVENT_2026-11-09.py` — derived resolvents and source response;
- `URT_NATIVE_HISTORY_CLOCK_KERNEL_THEOREM_2026-11-09.py` — original 1536D kernel and hidden KMS complement;
- `URT_NATIVE_24_PERIODIC_SOURCE_SCHUR_2026-11-09.py` — direct 24-periodic source Gaussian action and Monte Carlo check;
- `URT_A5_GAUGE_COVARIANT_CLOCK_SOURCE_2026-11-09.py` and `URT_GAUGE_CURRENT_24_WINDING_THEOREM_2026-11-09.py` — Ward response and independently derived 24-winding phase current.

**No GitHub or persistent project files have been altered.**
