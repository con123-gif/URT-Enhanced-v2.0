# Newton's Cathedral / URT: deriving the common physical source action

8 October 2026. This continuation recovers literal source matrices and calculates their gauge, matter, charged-observable and coframe responses. It preserves the corrected October species-first construction and the closed conditional Einstein interface. It introduces no measured mass, measured coupling, fitted generation filter or adjustable entropy normalization.

The calculations now determine the exact source contacts, all translated A4 photon bands, the complete local Wilson Ward identity, the charged Gauss selection rule, and actual coframe stress-transition poles. These results identify what each response measures. They do not certify that the full October canonical selected action has already been recovered or that its continuum is Nature.

## 1. Recovering the literal Clifford and generation source

Three original archives were restored and checked against their original byte lengths and SHA-256 ledger. Forty-six source members were recovered unchanged. The original `derive_a4_clifford_dirac.py` supplies the actual exterior-CAR Clifford matrices; its separately recovered original Clebsch dependency supplies the generation source. Their normalization is derived from their entries:

\[
\{C_a,C_b\}=2\delta_{ab}I_{16},\qquad
\operatorname{Tr}(C_{o,a}^\dagger C_{o,b})=8\delta_{ab},\qquad
\operatorname{Tr}(T_a^\dagger T_b)=\delta_{ab}.
\]

For the literal original source

\[
M(G)=\sum_{a,b=1}^4G_{ab}C_{o,a}\otimes T_b,
\qquad G=z_\ell P_\ell+z_cP_c,
\]

orthogonal projectors of ranks one and three give

\[
\operatorname{Tr}(M(G)^\dagger M(G))
=8\sum_{a,b}|G_{ab}|^2
=8(|z_\ell|^2+3|z_c|^2).
\]

The lepton, colour and joint quadrature traces are 8, 24 and 32, with zero cross trace. This factor eight follows from the literal CAR trace; it is not an extra entropy normalization. The source is a recovered August E/F construction. Its original manifest retains the failed/underidentified nonlinear flavour labels and its target-scored scans. Those probes do not supersede the corrected October source.

The v54 original executable identity is independently corroborated by two manifests: `urt_v54_explicit_local_hamiltonian.py`, SHA-256 `ddd9a09831d43a4185a15e1330e095618e372fc287d91d5a60e0c7ff5d17d843`. Its theorem and Hamiltonian entry structure are recovered; its original executable body and the complete October nonlinear source are not claimed recovered. Failed archive transfers are not evidence that either source is absent.

Details and original-source provenance: [source recovery](common_action_work/recovery/source_recovery_report.md).

## 2. Deriving the exact action from the same transfer

Keep the literal positive selected transfer and its actual source family:

\[
T(s)=P_GW_\delta(s)^{1/2}e^{-a(s)H(s)}W_\delta(s)^{1/2}P_G
=B(s)^\dagger B(s).
\]

On an identified positive support, define

\[
E(s)=-n\log T(s),\quad Z_n=\operatorname{Tr}e^{-E},\quad
\rho_n=e^{-E}/Z_n,\quad\Gamma_n=-\log Z_n.
\]

The state associated with the cylinder trace is \(\rho_n\); using \(T/\operatorname{Tr}T\) for an n-step trace would change its weights. Duhamel differentiation, without a commutativity assumption, gives

\[
\Gamma_i=\langle E_i\rangle,\qquad
\Gamma_{ij}=\langle E_{ij}\rangle-C_{ij},
\qquad C_{ij}=\operatorname{Cov}_{\rm BKM}(E_i,E_j).
\]

For fixed-reference information cost \(D_n(s)=D(\rho_n(s)\Vert\rho_n(0))\),

\[
(D_n)_{ij}(0)=C_{ij},\qquad
(D_n)_{ijk}(0)=\sum_{\rm sym}C(E_{ij},E_k)-2\kappa(E_i,E_j,E_k),
\]

\[
\Gamma_{ijk}=\langle E_{ijk}\rangle
-\sum_{\rm sym}C(E_{ij},E_k)+\kappa(E_i,E_j,E_k).
\]

Here the symmetric sum has the three pair/remaining-index terms, and κ is the ordered quantum third cumulant. Therefore matching the positive information cost to this positive raw trace action requires

\[
\langle E_{ij}\rangle=2C_{ij},\qquad
\langle E_{ijk}\rangle
=2\sum_{\rm sym}C(E_{ij},E_k)-3\kappa(E_i,E_j,E_k).
\]

These are source equations, not a constant factor to choose afterwards. In the exact affine modular class \(E(t)=E_0+tA\),

\[
D_n(t)=\Gamma_n(t)-\Gamma_n(0)-t\Gamma_n'(t),\qquad
D_n^{(k)}(0)=-(k-1)\Gamma_n^{(k)}(0),\quad k\ge2.
\]

In particular the quadratic identification with −Γ does not extend to the quartic action: \(D_n^{(4)}=-3\Gamma_n^{(4)}\). The physical observable Legendre action is a further object; for specified linear observable sources its Hessian is the inverse connected covariance on the observable image. A nonlinear background trace action includes its own source contacts.

The literal B fixes those contacts. A full normalized transfer, physical clock and fixed observable dictionary determine all normalized transfer spectral gaps and correlators: a global scalar factor does not change them. A background-dependent scalar in a conditional matter fiber is generally an operator once that background is a dynamical gauge/coframe field, so changing it changes the full state. Normalization therefore does not license an arbitrary physical stiffness adjustment.

Moving rank-eight support also needs care: ambient fixed-reference relative entropy is infinite when the new support extends outside the old one. A finite transported-support covariance remains valid in its stated reduced chart. It cannot silently be called the ambient fixed-reference information cost.

Proofs and independent noncommuting checks: [source/action lemma](common_action_work/review/source_action_lemma.md) and [observable/clock dictionary](common_action_work/review/source_response_dictionary.md).

## 3. Exact translated photon bands, Gauss kernel and time sources

The recovered electric and translated magnetic terms give the unit-charge quadratic Hamiltonian

\[
H^{(2)}=\frac{g^2}{2}E^\dagger E
+\frac{b}{2}A^\dagger K_{20}(q)A,\qquad
K_{20}=d_1(q)^\dagger d_1(q),\quad b=1/g^2
\]

in that unit-charge chart. Electroweak trace/source conversion must precede identifying g with physical e. All twenty translated triangles per A4 cell are retained.

Put \(\alpha=(q_0,q_1,q_2,q_3,0)\), \(u_i=e^{i\alpha_i/2}\), \(S=\sum_i e^{i\alpha_i}\). On \(\Lambda^2\mathbb C^5\), exterior multiplication \(L_u:v\mapsto u\wedge v\) gives the exact identity

\[
K_{20}=10I-L_uL_u^\dagger-L_{\bar u}L_{\bar u}^\dagger,
\]

\[
\operatorname{spec}K_{20}
=\{0,\ (5-|S|)^{\times3},\ (5+|S|)^{\times3},\ 10^{\times3}\}.
\]

At nonzero momentum the two exterior rank-four images intersect in the gauge line; their principal-angle decomposition yields the two triplets and their three-dimensional complement. Direct diagonalization checks every one of the 13^4 momentum symbols, with maximum spectral error \(2.31\times10^{-14}\). At zero momentum the additional constant coframe modes are retained rather than divided out as nonzero eigenvalues.

The exact Gauss vector is \(g_e(q)=2\sin(q\cdot r_e/2)\), and

\[
d_1g=0,\quad d_0^\dagger d_0=25-|S|^2,\quad
H_{\rm Coulomb}=\frac{g^2}{2}\rho^\dagger(25-|S|^2)^+\rho.
\]

The zero mode requires the appropriate charge constraint. On the nonzero-momentum quotient,

\[
G_A(\Omega,q)=\sum_j\frac{g^2U_jU_j^\dagger}
{\Omega^2+bg^2\kappa_j},\qquad
G_A^{-1}=\frac{\Omega^2}{g^2}P_G+bK_{20}.
\]

With all face observations retained, the face covariance obeys

\[
d_1^\dagger[d_1G_Ad_1^\dagger]^+d_1=G_A^{-1}
\]

on that quotient. Compressed faces instead reconstruct a constrained minimum. The exact finite-q sinc coframe map obeys \(J(q)q_{\rm geom}=g(q)\); its hidden-band Schur temporal term uses \(J^\dagger P_GJ\), including the Gauss projection. The executed static and temporal coframe kernels have the same exact longitudinal null.

For b=1/g² the oscillator frequencies are \(\sqrt{\kappa_j}\): g cancels from their band positions. In the declared root/cell chart the small-q spatial and temporal coefficients are \(\sqrt5/(2g^2)\) and \(\sqrt5/g^2\), giving speed²=1/2. Clock/length conversion may calibrate speed; it cannot determine the common coupling from these band positions.

For one band, sampled seam covariance is

\[
C_{\rm seam}(\nu)=\frac{g^2\sinh(a\omega)}
{2\omega[\cosh(a\omega)-\cos\nu]}.
\]

Physical source j=aJ gives \(C_{\rm phys}(\Omega)=aC_{\rm seam}(a\Omega)\), whose inverse Ω² coefficient is \(a\omega/[g^2\sinh(a\omega)]\). A symmetric slice multiplies the covariance by \(\cos^2(\nu/2)\); a generator insertion instead keeps its Duhamel same-slice contacts and binning. These different placements are explicitly calculated, rather than equated through their uniform endpoint.

The literal selector is also retained in a conditional Fourier-pair restriction: all 20×13^4 hats are evaluated, with other Fourier modes frozen at zero. It changes the normalized selected gap and static response from the unselected oscillator. Deterministic radial/angular refinement and a selector tail bound are saved. This restriction is not the full-mode marginal; it supplies no photon mass or physical coupling prediction by itself.

Full calculation, selector convergence and operators: [translated photon response](common_action_work/photon/translated_photon_response_report.md).

## 4. Literal Wilson currents, mixed Higgs contacts and hidden elimination

The extant v61 reflected Wilson restriction supplies a literal Hermitian 192-dimensional kernel \(h=\gamma_5(D_W-M)\). Its filled negative sea has 96 negative and 96 positive states and a gap from zero of 0.825593314 in its own dimensionless chart. This is a declared historical restriction, not an invented replacement for the periodic v54 root assignment or the complete selected October matter source.

For every one of its 528 link angles, differentiate the actual supplied forward/backward hopping terms:

\[
j_\ell=\partial_{\theta_\ell}h,\qquad
w_{\ell m}=\partial_{\theta_\ell}\partial_{\theta_m}h.
\]

The sea Hessian is

\[
\Pi_{\ell m}=\operatorname{Tr}(P_-w_{\ell m})
-2\operatorname{Re}\sum_{r<0,s>0}
\frac{(j_\ell)_{rs}(j_m)_{sr}}{e_s-e_r}.
\]

For the exact site/link incidence C, \(\Pi C=0\) to \(5.10\times10^{-15}\). Its rank is 481=528−47. The paramagnetic term alone violates the same identity by 1.59843. This derives the contact needed for the Ward identity from the microscopic links.

This sea Hessian has 72 negative and 409 positive transverse eigenvalues. It is not the full selected gauge inverse: the gauge action, selector and other fields are not removed from that action. The corresponding current spectral weights are positive and obey the double-commutator sum rule. Their particle-hole energies range from 1.65119 to 4.68422 divided by the specified clock a. These are current-transition energies, distinct from one-field mass poles.

The actual physical charge Q=T3+Y has \(\operatorname{Tr}_{96}Q^2=32\) and is noncentral in the weak algebra. For the retained covariant Yukawa formula, a neutral Higgs commutes with Q. A charged Higgs requires its own transformation; the mixed Higgs/gauge vertex is nonzero. The charged-Higgs gauge orbit has contact +2.12026 and paramagnetic response −2.12026, cancelling in the total trace Hessian. Dropping either term gives a false gauge response.

Hidden elimination is differentiated before reading its retained current. For K in retained/hidden blocks, R=Khh^-1 and Keff=Kee−Keh R Khe,

\[
R_i=-RK_{hh,i}R,\qquad
R_{ij}=RK_{hh,i}RK_{hh,j}R+RK_{hh,j}RK_{hh,i}R-RK_{hh,ij}R.
\]

The retained first and second vertices then contain every derivative of both off-diagonal blocks and R. The exact determinant split \(\log\det K=\log\det K_{hh}+\log\det K_{\rm eff}\) requires the hidden current and second contacts as well. The executed geometric-site restriction checks the retained inverse, its effective current/contact and both determinant derivative splits against independent source differences. Its site restriction is expressly different from the theory's hidden51 elimination.

The archived compendium has a Yukawa bookkeeping ambiguity: it includes HY inside one HF definition and again in its total Hamiltonian. This continuation writes \(H_F^{\rm kin}+H_Y\) with one explicit Yukawa density for these source calculations; it does not claim to resolve the missing v54 executable's bookkeeping by fiat.

Full entries, joint restriction and verified source contacts: [microscopic matter currents](common_action_work/matter/microscopic_source_currents_report.md).

## 5. Deriving the physical charged observable

On the primitive compact charge chart q=3Q, the global factor of the Gauss projector gives

\[
P_G\psi_qP_G=0\quad(q\ne0),\qquad
\sum_xG_x=-Q_{\rm total}.
\]

Qtotal includes all charged fields. Thus the bare charged two-point expression between projected transfer factors vanishes for 0<n<N. A charged mass calculation must specify the physical dressing, boundary or traversed charge sector. A Wilson path on a periodic graph has opposite endpoint charges; with its matter endpoints it defines a neutral pair, whose threshold is not automatically a single-fermion mass.

Exact charge-sector counting on the retained finite Q96 fermion Fock carrier gives a zero-electromagnetic-charge subspace of dimension 3,707,108,065,942,376,914,189,459,456. Other charged fields can compensate a nonzero fermion charge, so that dimension is not a necessary factor of the full Gauss space. The actual CAR witness and A4 incidence/path calculation verify the selection rule without assigning any extra dynamics.

An isolated physical pole is the correct criterion for a stable isolated relativistic particle. In a massless-photon continuum, a charged excitation may instead be an infraparticle with a spectral edge. The correct mass test then uses a justified dressed threshold or inclusive prescription and the regulator limit. A mandatory simple charged pole would be a false QED criterion.

Proof, regulator scope and primary sources: [charged observable dictionary](common_action_work/gauss/charged_observable_dictionary.md).

## 6. Actual coframe contacts and the retained Einstein interface

Differentiate the selected transfer itself, including projector, selector, clock, support and measure sources. For any finite differentiable trace,

\[
Z_i=n\operatorname{Tr}(T^{n-1}T_i),\qquad
Z_{ij}=n\operatorname{Tr}(T^{n-1}T_{ij})
+n\sum_{r=0}^{n-2}\operatorname{Tr}(T^rT_jT^{n-2-r}T_i).
\]

The action Hessian is −Zij/Z+ZiZj/Z². This is valid even when heat and selector do not commute. Its source contacts must be kept before tensor projection.

The inherited moving face20/hidden8 transfer has the same trace Hessian as its transported eight-dimensional representation. Its five static shear eigenvalues are

\[
-113.4431103618=34.3492598788-147.7923702407.
\]

The first term is the metric source contact; the second is the positive transported-support Kubo–Mori covariance. This is a finite shape response, not a demonstrated instability of the complete stationary coframe action.

The bare radial harmonic sector is also evaluated on all 13^4 A4 sites, retaining \(m_b^2=W_{bb}(b_0)=8.41024869731562\). Its coframe vertices and seagulls follow from the inherited common root-weight extension. Its zero-momentum tracefree Hessian has eigenvalues 0.856854098811 (fivefold) and 0.898864307195 (fourfold). The logarithmic metric source γ=log g=2h divides this coframe Hessian by four. A linear g−I chart also requires its background-pressure second contact; fixed-volume variations retain their constraint contact.

Direct temporal stress covariance gives positive two-radial-particle residues at energies \(\omega_q+\omega_{q+k}\), with the thermal scattering term and coincident static limit included. The lowest TT-active pair energy at the first admitted momentum is 6.18201106617 in the declared chart. Its static covariance agrees with minus the loop Hessian divided by β to \(1.94\times10^{-16}\). These external stress transitions are not an isolated massless graviton pole.

The recovered all-diamond relation has stronger, different premises: identified physical area, modular stress and fixed volume for every timelike local frame. Under those premises it gives the local Einstein principal equation. With the canonical conserved stress vertex and linearized physical coframe, its tensor response remains

\[
D_{TT}(p)=\frac{32\pi G_{\rm ent}}{p^2}P^{(2)}.
\]

That closed conditional interface is retained. It does not follow by relabelling the finite shape Hessian or the radial stress covariance. Equality requires their actual physical source and action identification. No FR/2 term was inserted into the selected transfer to manufacture it.

Full moving-support, lattice stress and causal-diamond derivations: [selected coframe response](common_action_work/gravity/selected_coframe_hessian_report.md).

## 7. The common physical identification now has explicit equations

The calculated sectors use a four-coordinate A4 Hamiltonian graph and an additional transfer clock. They therefore have three small-q transverse oscillator branches. Physical 3+1 spacetime requires the recovered ambient-to-leaf and clock dictionary; setting one momentum component to zero or selecting two probes does not derive that dictionary. The four-dimensional Euclidean off-shell TT tensor rank is likewise not already a Lorentzian graviton helicity count. These are exact distinctions between carriers, not a rejection of the retained URT ambient/leaf construction.

For a specified common physical source map s=s(Aphys,ephys,Species), the same canonical transfer must satisfy simultaneously:

\[
\delta[\Gamma_{\rm selected}+\lambda_\alpha C_\alpha]=0,
\qquad C_\alpha=0,
\]

\[
K^{\rm phys}_{AB}
=s_A^is_B^j\Gamma_{ij}+s_{AB}^i\Gamma_i
+\sum_\alpha\lambda_\alpha(C_\alpha)_{AB},
\]

evaluated at constrained stationarity and restricted to admitted constraint
tangents. Measure and support contacts are already retained inside the
derivatives of the declared selected trace; they are not added a second
time. This is followed by the specified physical observable projection
and, where appropriate, Legendre transform. Gauss and diffeomorphism Ward
identities, physical time continuation, and the correct charged-sector
observables then test the actual interacting spectrum. Different source
families cannot be joined merely because their separate quadratic
matrices are positive or numerically similar.

Charge normalization is already fixed. With \(S_{\rm cont}=C_R\operatorname{Tr}_R(F^2)/4\), the common electromagnetic inverse coupling is \(1/e^2=C_R\operatorname{Tr}_R(Q^2)\), with indices 4/3, 16/3 and 32 on the retained carriers. These trace conversions fix relative conventions. The full selected gauge/coframe action must supply C_R; neither a photon band whose g cancels nor a conditional entropy norm supplies it independently.

The full known normalized transfer plus physical clock and observables would determine normalized spectral predictions. The currently recovered hidden reference, source entries in their historical scopes, and October architectural corrections do not by themselves specify that full operator family. This continuation closes the source identities and computes the named actual restrictions. It does not fill the missing nonlinear canonical entries with measured anchors or call a conditional completion a completed theory of Nature.

Executable records, frozen version-5 input, source hashes, independent audit and operators are included in `common_action_work/`. Run `python3 run_common_action.py` to validate the complete saved computation. Sector scripts reproduce their actual calculations; the original Clebsch-source recovery additionally requires its declared NetworkX dependency.