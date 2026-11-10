# Newton's Cathedral — exact native geometric-current calculation, source to 24-clock

**9 November 2026.** New source-first mathematical results. Uses *unaltered* 7 November nonlinear five-Platonic/64-history/24-clock source and *unaltered* 29 October full coupled 64-state vertex/face operator, with face order aligned by icosahedron graph isomorphism. No experimental observations, historical ARF coefficients, free gauge couplings or fitted normalisation appear in the calculations. **This proves exact formulas for one geometrically specified external source probe; it does not prove a unique physical four-ARF observable dictionary.**

## 1. Original microscopic data, not a replacement model

The parent cellular complex includes **all five Platonic solids**, with vertices/edges/faces `(50,90,50)` and 190 cochains. The native 7 November source constructs all 64 signed-six-axis icosahedral histories, maps them through the existing 50-vertex portal to the icosahedral face incidence and forms the nonlinear hidden response

\[
h_3=P_3[(Cv)\odot(Cv)],\qquad h_5=P_5[(Cv)\odot(Cv)].
\]

The original full coupled-history operator `K64` is 64×64 on `12_A ⊕ 12_B ⊕ 20_A ⊕ 20_B`, including vertex–face hybridisation. The two hidden face projectors have rank 4 each, with face Laplacian energies 3 and 5. The signed-history ensemble calculated from the native *unchanged* source gives the exact scalar strengths

\[
S_3=36+\frac{72\sqrt5}{5},\qquad S_5=7,
\]

and, by icosahedral symmetry (also directly checked on the 64 source vectors),

\[
\frac1{64}\sum_s h_3(s)h_3(s)^T=\frac{S_3}{4}P_3,\quad
\frac1{64}\sum_s h_5(s)h_5(s)^T=\frac{S_5}{4}P_5,\quad
\frac1{64}\sum_s h_3(s)h_5(s)^T=0.
\]

In both native and coupled objects the source is `h=h3+Delta h5` with the existing
`Delta=3/20 - 80*pi/(1053 phi)`; `r=pi/e`, `theta=2*pi/phi²`.

## 2. Source probe from signed antipodal geometry

For each of the six natural antipodal icosahedral vertex pairs `(p,pbar)`, define the **geometrically specified** diagonal face sign operator

\[
Q_p=\operatorname{diag}(B_{pf}-B_{\bar p f}),
\]

which has five `+1`, five `−1`, ten zero entries. This choice is a **specified external phase probe**: it is canonical under the icosahedral action, but is not asserted to be the uniquely selected physical electromagnetic current.

Probe the already-present unit link between the two face sheets with
`-exp(i a Q_p)` while retaining the original vertex–face coupling. The source is transported covariantly, `f(a)=U(a)J_+h`, with

\[
U(a)=I_{24}\oplus\mathrm{diag}(e^{iaQ_p/2},e^{-iaQ_p/2}),
\]

where `I24` acts on the vertex blocks, and `J_+ h=(0,0,h,h)/sqrt(2)`. The external variable `a` is a differentiation coordinate, **not a fitted coupling**. A uniform `Q=I` is pure gauge on the hidden carrier, and its complete Ward response vanishes; the nonuniform signed incidence has genuine face-loop dependence.

## 3. Gauge-covariant derivative and exact 7-pole coupling

Write `K(a)` for the source-probed 64-history operator. Set `A=U'(0)`, `J=K'(0)`, `W=K''(0)`. After transporting the source to a fixed chart, the exact first and second derivatives of `U(a)† K(a) U(a)` are

\[
\boxed{G=J+[K,A]},\qquad
\boxed{S=W+2[J,A]+[[K,A],A]}.\tag{1}
\]

The original energy-seven spectral projector `P7` has rank nine; its hidden-antisymmetric part is `J_- P5`. The exact source identity is

\[
\boxed{P_7 G J_+(h_3+\Delta h_5)=iJ_-P_5 Q_p h_3}.\tag{2}
\]

This is **an induced coupling**, not an added term in the Hamiltonian. It vanishes when `Q=I` and arises from nonuniform face geometry. Original 64×64 matrix tests verify (2) for all 64 source histories and all six axes.

The original graph-incidence spectral projectors satisfy, **exactly for every antipodal axis**,

\[
\operatorname{Tr}(P_3 Q P_5 Q)=\frac23,\quad
\operatorname{Tr}(P_3 Q P_2 Q)=\frac43,\tag{3}
\]

where `P2` is the rank-five face-Laplacian energy-two projector. Source covariance then fixes the positive energy-seven transition strength

\[
\boxed{w_7=\frac{S_3}{4}\frac23=\frac{S_3}{6}=6+\frac{12\sqrt5}{5}\simeq 11.366563146}.\tag{4}
\]

The hidden energy-five transition is likewise `w5=7 Delta²/6`.

## 4. Complete spectral measure: exactly eight active channels

The same source also enters the existing fiveplet vertex–antisymmetric-face block

\[
K_{(5)}=\begin{pmatrix}6&1/\sqrt5\\1/\sqrt5&4\end{pmatrix},\qquad
\lambda_\pm=5\pm\sqrt{6/5}.
\]

Its source strength is `S3/10`, its first spectral moment is `4 S3/10`, so the uniquely determined two positive weights are

\[
w_{\pm}=\frac{S_3}{20}\left(1\mp\sqrt{5/6}\right)
\]

for energies `5±sqrt(6/5)` (the **lower** pole takes the **plus** sign in parentheses). The complete `h3`-origin current self-energy reduces **exactly** to

\[
\boxed{\Sigma_3(z)=S_3\left[
\frac1{6(7-z)}+\frac{6-z}{10((5-z)^2-6/5)}\right]}.\tag{5}
\]

The `h5` source excites the other hidden quartet at 5 and the **four** chiral triplet-hybridised modes of the original coupled K64. Symbolic elimination gives one rational expression:

\[
\boxed{\Sigma_5(z)=
-\frac{7(69z^4-1431z^3+10543z^2-32289z+34596)}
{6(z-5)(45z^4-900z^3+6270z^2-17580z+16501)}}.\tag{6}
\]

The quartic denominator is identically the pre-existing **29 October K64 characteristic-polynomial factor** of the 3⊕3′ hybridisation; this has been proved by exact SymPy polynomial arithmetic, not inferred from numerical poles. Therefore the full current-current response to this probe is

\[
\boxed{\Sigma_{J}(z)=\Sigma_3(z)+\Delta^2\Sigma_5(z)}.\tag{7}
\]

Every nonzero source spectral weight from (7) agrees with independent direct diagonalisation of the original coupled 64×64 K matrix. The complete original operator has 16 distinct energy bands, but **only eight** carry this particular source current (the remaining eight weights vanish). The full six-axis spectral distribution is identical up to ~`1e−14`.

## 5. Complete Ward response: include the source and seagull contacts

A positive current-current spectral measure is **not** itself the physical gauge response. The correct second source derivative of the covariantly transported resolvent is

\[
\boxed{\chi_m(z)=
2\operatorname{Tr}(C R_m G R_m G R_m)-
\operatorname{Tr}(C R_m S R_m)},\qquad
R_m=(K+r^2\ell_m-z)^{-1},\tag{8}
\]

where `C=Jplus[(S3/4)P3+(Delta² S5/4)P5]Jplus†` is **the exact normalized 64-history source covariance** and

\[
\ell_m=2-2\cos\left(2\theta-\frac{2\pi m}{24}\right).
\]

This is the *five-contact* calculation (source first/second derivatives, current–source mixed terms, current-current and gauge seagull) compressed into a single exact trace identity. The source supports only energies 3 and 5. The second contact traces follow from exact face double commutators:

\[
\operatorname{Tr}P_3[Q,[Q,L_D]]=0,\quad
\operatorname{Tr}P_5[Q,[Q,L_D]]=\frac83,
\]

so the actual second-contact expectations are **fully fixed**:

\[
\boxed{\tau_3=0,\quad\tau_5=-\frac{7\Delta^2}{6}}.\tag{9}
\]

Write `w_j` and `E_j` for the **eight exact** weights and energies of (7), with three from source 3 and five from source 5; put `t=r² ell_m-z`. The fully contact-inclusive scalar response is

\[
\boxed{
\chi_m(z)=
2\sum_{j\in\mathcal J_3}\frac{w_j}{(3+t)^2(E_j+t)}
+2\sum_{j\in\mathcal J_5}\frac{w_j}{(5+t)^2(E_j+t)}
+\frac{7\Delta^2}{6(5+t)^2}.}\tag{10}
\]

This is strictly positive when the denominators are positive. **It is a complete exact formula for this specified probe**, not an experimentally identified electromagnetic coupling. Numerical verification: all 72 clock/spectral test points agree with the **original** full 64×64 five-contact Hessian to maximum `2.45e−15`.

## 6. Eliminate the complete 24 golden clock analytically

Set `r=pi/e`, `theta=2 pi/phi²`, `T_n,U_n` the Chebyshev polynomials of first/second kind. The exact root-of-unity partial-fraction formula is

\[
\boxed{\mathcal G_{24}(a)
=\frac1{24}\sum_{m=0}^{23}\frac1{a+r^2\ell_m}
=\frac{U_{23}(1+a/(2r^2))}
{2r^2[T_{24}(1+a/(2r^2))-\cos(48\theta)]}}.\tag{11}
\]

Proof: the product polynomial for the 24 shifted cosine roots is proportional to `T24(s)−cos(48theta)`. Logarithmic differentiation yields (11). This was verified at **70-digit precision** for `a=0,3,5,7,13,18`, with relative residual of order `1e−70`.

Define

\[
\mathcal I_{21}(a,b)
=-\partial_a\left(\frac{\mathcal G_{24}(a)-\mathcal G_{24}(b)}{b-a}\right),\qquad
\mathcal I_{21}(a,a)=\frac12\mathcal G_{24}''(a).
\]

Then without numerical clock summation, **all 24 modes** of the Ward-complete susceptibility close as

\[
\boxed{
\chi_{24}(0)=
2\sum_{j\in\mathcal J_3}w_j\mathcal I_{21}(3,E_j)
+2\sum_{j\in\mathcal J_5}w_j\mathcal I_{21}(5,E_j)
+\frac{7\Delta^2}{6}[-\mathcal G_{24}'(5)]
=0.24964729252947482420393064434172984\ldots .}\tag{12}
\]

The source's *uncontacted* current-current 24-trace is instead

\[
\boxed{\Sigma_{J,24}(0)=\sum_j w_j\mathcal G_{24}(E_j)
=2.34396108307181602929209\ldots}.\tag{13}
\]

These two very different numbers are computed from the **same native K64, nonlinearity, frozen Delta and golden clock**. The discrepancy is exactly why one cannot infer a physical ARF simply by reading a current spectral pole. (12) matches the independent fully source-differentiated 24×64 numerical result to ~`1e−15`.

## 7. Rigorous scope of the historical four-ARF problem

The historic four quantities in the v101 Library ledger are

\[
\Delta\delta=-\delta_\star^3/63-\gamma/40,\quad
R_\alpha=3/(64\phi)+1/(79\phi^2),
\]
\[
C_{\rm mass}=-5\delta_\star^3/16+7\pi\phi/8,\quad
R_{\rm mass}=3\delta_\star^2/35-4\pi^3/51.
\]

Neither (7) nor (12) was *constructed to equal* any of these. There is an exact obstruction to identifying the **entire current** (7) with the old two-pole rail self-energy: its fiveplet poles `E±=5±sqrt(6/5)` have strictly positive weights. In the Ward-complete (8), their simple-pole coefficients are **strictly positive**:

\[
\boxed{a_\pm=\frac{2w_\pm}{(3-E_\pm)^2}>0,}\qquad
 a_-\simeq15.943961598166,\quad a_+\simeq0.0620150768124.
\]

Because the contact `Tr(C R S R)` has poles only at the source energies 3 and 5, it cannot cancel these additional poles. This **only** rules out the naive identification of this full natural geometric-current response with a function having exclusively poles 7 and 5; it is not a no-go theorem for all possible *physically selected* Cathedral currents or for the whole theory.

A parameter-free **full four-ARF derivation is not yet achieved**: it needs the physical current/rail/mass/orientation **observable map** and associated source insertions to follow uniquely from the already-selected master transfer. The rank identities and spectral coincidences are insufficient to select them. Existing v70/v71 notes show an exact two-dimensional invariant current plane; a valid derivation must determine the physical line using the microscopic transfer, not choose it to match `R_alpha`. Likewise the mass current must be a sourced/gauge-covariant observable, not a rank chosen after seeing the mass formula. No extra normalization has been introduced to close these gaps.

## 8. Reproducibility and provenance

- Original native five-Platonic nonlinear source: `cathedral_constructed_joint_dynamics_2026_11_07.py` (SHA256 `5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd`), originally retrieved from the user's Library.
- Original full coupled 64D operator: `cathedral_64_chiral_hybridization_2026_10_29.py`, likewise from the Library.
- Face labeling is aligned through an exact **icosahedron graph isomorphism** before combining these independent original files.
- Supporting verifiers: `arf_inter_sheet_current_pole_derivation_2026_11_09.py`, `arf_full_source_intertwiner_2026_11_09.py`, `arf_original_nonuniform_face_flux_response_2026_11_09.py`, `arf_wilson_pole_selection_2026_11_09.py`, `arf_exact_face_current_rational_trace_2026_11_09.py`, `arf_full_spectral_current_measure_2026_11_09.py`, `arf_complete_native_geometric_current_spectral_theorem_2026_11_09.py`, `arf_24clock_ward_chebyshev_closure_2026_11_09.py`, `arf_exact_eight_pole_rational_resolvent_2026_11_09.py`, `arf_ward_fiveplet_extra_poles_theorem_2026_11_09.py`, `arf_exact_full24_ward_response_closed_form_2026_11_09.py`.
- Numerical and exact symbolic results are in companion JSON files and the run log.
- No repository changes, no third-party Yang–Mills sources, no observed particle-physics input, and **no insertion of the historical four ARF coefficients into any source response derivation**.
