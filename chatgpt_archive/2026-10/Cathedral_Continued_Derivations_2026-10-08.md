# Newton's Cathedral: governing theory and physical tests

Cornelius Lytollis · 8 October 2026

This record develops the Cathedral's governing dynamics and tests its physical observable dictionary. Sections 1–8 retain the executed supplemental constructions. Sections 9–13 recover the positive local transfer and test the archived free wall and coherent return. The latest October correction retires response-fed terminal matrices as a causal matter derivation: species must enter the signed 64-state history before vacuum selection and hidden elimination. Sections 14 onward apply that precedence, retain the complete hidden loop and contacts, calculate a free current response, and test the selected gauge and metric poles. The target is a theory of nature: one specified dynamics must produce physical masses, currents, fields and gravitational response through its own observables.

## 1. The quartet interface is now recovered correctly

The archival \(4_3,4_5\) labels name two four-dimensional sectors, with hidden energies three and five. They do not name a fourplet and a fiveplet. The earlier plane-to-five multiplicity calculation remains valid for a separate representation map; applying its apparent angle freedom to the archival \(J_{45}\) was an error.

The exact six-axis outer map is
\[
(w_0,w_1,w_2,w_3,w_4,w_5)
\mapsto(-w_1,w_3,-w_4,-w_2,-w_5,-w_0).
\]
It anticommutes with the conference matrix and obeys \(C^6=-I_6,C^{12}=I_6\). Its signed permutation of the six-bit cube gives an exact \(U_{64}^{12}=I_{64}\).

Project the first-Walsh-triplet/quadratic-fiveplet product into the degree-three quartet:
\[
Q_{\rm mul}=8P_{A_5,4}\Pi_3[G_{+,i}F_{+,a}],
\qquad Q_{\rm mul}Q_{\rm mul}^T=\frac32P_{Q_+}.
\]
Its four nonzero singular values are \(\sqrt{3/2}\), exactly the literal September 28 fingerprint. The co-rotating outer lift \(J_{\rm cube}=U_b^TU_{64}\) squares to minus identity on degree three. Its orthogonal partner \(Q_-=J_{\rm cube}Q_+\) supplies the other quartet, and
\[
J_{\rm hist}^2=-P_{Q_+\oplus Q_-}.
\]
This actual history complex structure has the compatible S3 symmetry. A separate full-A5 complex structure is constructed through the quartet intertwiners; the two symmetries are distinguished.

Reynolds averaging gives multiplicity-one isometric \(C_{43},C_{45}:\mathbb R^4\to\operatorname{Hom}(3,3')_4\), and \(C_5:\mathbb R^5\to\operatorname{Hom}(3,3')_5\). The two charge embeddings are isometric and bridge-orthogonal. All equivariance residuals are below \(2.3\times10^{-15}\).

The original `urt_blind_dirac_gate.json` was read in full. Its source
\[
g=(bc,ca,ab)-\frac{ab+bc+ca}{3}(1,1,1)
\]
is exactly \(g_i=q_i^2-\|q\|^2/3\) when \(a+b+c=0\). It also yields
\[
\|g\|^2=\|q\|^4/6,
\qquad k_f=\|q_f\|^2/2=(13,7,27,9).
\]
Thus the four recovered species labels follow directly from the four charge words. The oriented charge pairing is rank one with its nonzero eigenvalue 112; it is distinct from the complexified two-coordinate loading, which has rank two.

## 2. Charges are now propagated before history elimination

On the recovered legacy scalar branch, define
\[
F(P)=\frac1{2\sqrt3}\left(P-\frac{12}{5}\sin P\right),
\qquad s_*=P_*-F(P_*),
\]
\[
P_{k+1}=U_{64}F(P_k)+U_{64}^{k+1}s_*+s_{f,k}.
\]
Here \(P_*\) is the independently reproduced legacy constrained scalar vacuum. The anchoring source enforces its recovered orbit; this is not an independent new vacuum-selection theorem. The later \(\alpha_{\rm URT}=\phi^{-2}\) is not replaced by the legacy branch's \(\alpha_{113}=\sqrt{4/3}\).

The actual source vectors are
\[
s_f^q=Q_+J_{e3}q_f/3,
\qquad s_f^g=Q_-J_{e5}\Delta g(q_f)/5.
\]
Two declared connections were executed: fixed-frame \(s_{f,k}=s_f^q+(-1)^ks_f^g\), and co-rotating \(s_{f,k}=U_{64}^{k+1}(s_f^q+s_f^g)\).

The component derivative proves the global contraction
\[
\|DF\|\le L=\frac{17}{10\sqrt3}<1,
\qquad L^{12}=0.799207458477.
\]
Every one of the eight species/connection period maps therefore has a unique globally attracting periodic solution. Executed return residuals are below \(3.11\times10^{-15}\), and the residual-based analytic error estimate is below \(1.55\times10^{-14}\), before a separate floating-point enclosure. The computed histories return at twelve steps and differ at every proper divisor.

Extract \(H_{f,k},\Xi_{3,f,k},\Xi_{5,f,k}\) only after evolving all 64 coordinates. Decode
\[
\mathcal A_{f,k}=\operatorname{unvec}
[C_5H_{f,k}+C_{43}\Xi_{3,f,k}
+i(-1)^kC_{45}\Xi_{5,f,k}].
\]
No endpoint charge is added again. Nonlinear hidden history is retained before elimination.

For the actual signed tangent maps \(J_k=U_{64}D_k\), the full monodromy is diagonal in cube coordinates after twelve steps, because the co-rotating derivatives commute and \(U_{64}^{12}=I\). Its computed spectral radius is about \(1.897\times10^{-5}\). The exact time-dependent 13/51 memory equation reproduces the direct history within \(2.18\times10^{-16}\).

The optional \(M^TM\) positive completion is also supplied, with \(0\preceq M^TM\preceq L^{24}I\). It is a squared-tangent-norm readout, separately named; it is not substituted for the primitive \(B_*^\dagger B_*\).

## 3. An amplitude-bearing positive ordered response

The recovered Hermitian lift is
\[
\widehat M(\mathcal A)=
\begin{pmatrix}0&\mathcal A^\dagger\\\mathcal A&0\end{pmatrix}.
\]
Form the actual twelve-step products, extract the plus-sheet blocks \(G_{f,s}\), and calculate \(K_{f,s}=G_{f,s}^\dagger G_{f,s}\). This retains radial amplitude information; consecutive inverse ratios and purely polar words do not replace it.

The passive scalar vacuum has C5 symmetry, so its cross-triplet amplitude has exact rank one: the two triplets share only the trivial C5 character. Tiny secondary singular values from numerical minimization are not regularized into physical bands. A single passive twelve-path metric is therefore rank one.

Uniformly averaging the twelve cyclic starting phases gives a genuinely full-rank passive metric. The exact axis formula is
\[
K_{0,C_{12}}=
\frac{\|H_0\|^{24}}{3\,4^{12}5^{11}}I_3.
\]
The reconstructed coefficient is \(1.8059753\times10^{-17}\); its tiny anisotropy tracks numerical vacuum error. This average is a stated exposure rule, distinct from the older one-link uniform alphabet \(K_0=(23/45)I\).

Whitening with this \(K_0\) gives positive generalized response spectra and invariant relative frames. For the unique nonlinear histories,

| Connection and complete cyclic exposure | \(J_{ud}\) | \(J_{\nu e}\) |
|---|---:|---:|
| Fixed frame | −0.0098709557443 | −0.027949982955 |
| Co-rotating | 0 | 0 |

The co-rotating averaged Grams commute. Single-phase invariants can be nonzero and vary with the origin; one matching-looking phase is not selected as a prediction.

After calculating these operators, direct identification of these averaged frames with low-energy CKM was checked against the [2026 PDG review](https://pdg.lbl.gov/2026/reviews/rpp2026-rev-ckm-matrix.pdf). Its fitted \(|J|\) is \((3.16^{+0.13}_{-0.11})\times10^{-5}\). The fixed-frame value is about 312 times larger, and the co-rotating value vanishes. This rejects that particular immediate physical identification. No source, coefficient or phase was adjusted after comparison.

## 4. The actual finite spectral measures

The untwisted incidence completion
\[
(D_f\psi)_k=\mathcal A_{f,k}\psi_k
-\mathcal A_{f,k+1}\psi_{k+1}
\]
factors through the ordinary cycle incidence. It has three exact right zero modes \(\psi_k=\mathcal A_{f,k}^{-1}v\). Its selfadjoint chiral wall has six zero modes and a positive transfer \(e^{-\eta\widehat D_f^2}\).

The exact three-coordinate compression sees 34 poles, all with positive matrix residues. Four species with both sheets and one retained site give a 24-coordinate projection of a 288-dimensional wall, seeing 133 distinct poles. Thus the dimension of a retained matrix does not determine the number of physical poles; the full energy-dependent memory is supplied.

The typed polar connection instead uses
\[
R_{f,k}=\mathcal A_{f,k+1}^{-1}\mathcal A_{f,k},
\quad U_{f,k}=\operatorname{polar}(R_{f,k}),
\quad(C_f\psi)_k=\psi_{k+1}-U_{f,k}\psi_k.
\]
If \(e^{i\vartheta_j}\) are the unitary holonomy eigenvalues on a twelve-cycle, its exact squared-energy bands are
\[
\lambda_{jm}=4\sin^2
\left(\frac{2\pi m-\vartheta_j}{24}\right).
\]
The three principal channels are the three lowest modes, giving an actual infrared sector. With endpoint normalization \(\sqrt{12}\), their invariant chiral restrictions give explicit six-by-six walls per species, hence a 24-dimensional wall across the four species. This is a spectral restriction of an actual kinetic operator, rather than a rank-24 coordinate compression with discarded memory.

The same operator and readout were then applied to the source-loaded nonlinear histories:

| History connection | Largest third low squared energy | Smallest fourth squared energy | Common separation ratio |
|---|---:|---:|---:|
| Fixed frame | 0.00112863225 | 0.23533623412 | 208.51 |
| Co-rotating | 0.02573889119 | 0.13032328364 | 5.0633 |

Both therefore have a single common spectral cutoff retaining three modes from every species. The previously ambiguous near-zero electron channel of the scalar-only test is resolved in these source-loaded candidates: its squared gaps are \(2.80729\times10^{-8}\) and \(4.67678\times10^{-5}\), respectively. The separate common-basepoint identity-current readout gives \(J_{ud}=0.000769946044\) and \(0.03813059329\); it is not the ordered-Gram readout in Section 3. Transporting the current bridge along an open path restores chart covariance within \(7\times10^{-15}\). Closing that bridge around the cycle additionally requires a holonomy intertwiner; Section 10 calculates this condition and the global current.

Amplitude-weighting through \(D_k=\mathcal A_{k+1}C_k\) retains radial data and changes its gaps. Both precisely typed completions and their positive spectral residues are calculated. A holonomy eigenvalue one gives an exact zero channel; tiny numerical phases in the earlier scalar-only input are not certified as nonzero masses. Unit singular values of the holonomy itself do not prevent its eigenphases from generating unequal kinetic bands. The distinction is between a polar endpoint's singular values and this full connection operator's spectrum.

Positive transfer also proves temporal semigroup reflection positivity by
\[
\sum_{m,n}v_m^\dagger PT^{m+n}P^\dagger v_n
=\left\|\sum_nT^nP^\dagger v_n\right\|^2\ge0.
\]
This is the stated correlator result, not an unproved Grassmann-field or continuum reflection theorem.

## 5. A genuine local gauge curvature action

Two declared source families were executed on the same 13-vertex magnetic graph Laplacian \(L(U)=d_U^\dagger d_U\):
\[
T_G=\chi(\chi I+L)^{-1},\quad
\Gamma_G=\tfrac12\log\det(\chi I+L),
\]
\[
T_E=e^{-\eta L},\quad
\Gamma_E=-\log\operatorname{Tr}T_E.
\]
Both have explicit positive factors and gauge-covariant source dependence. Their full current Hessians include the contact term and satisfy the Ward identity. They are different actions on the position carrier, separately retained from the hidden eight-state relative-entropy action.

Filling the center cone adds thirty radial triangles and twenty tetrahedra. The new complex has dimensions \((13,42,50,20)\), ranks \((12,30,20)\), and Betti numbers \((1,0,0,0)\). Boundary squares vanish exactly. The original shell-face complex is retained as a distinct truncation.

For all link phases, the exact first phase-sensitive spectral moment is
\[
\operatorname{Tr}L(U)^3-\operatorname{Tr}L(1)^3
=6\sum_{50\ {
m triangles}}(1-\cos F_t).
\]
It produces local compact-U1 actions at large Gaussian \(\chi\) or short heat time:
\[
\Gamma_G(A)-\Gamma_G(0)
=\chi^{-3}\sum_t(1-\cos F_t)+O(\chi^{-4}),
\]
\[
\Gamma_E(A)-\Gamma_E(0)
=\eta^3\sum_t(1-\cos F_t)/13+O(\eta^4).
\]
The earlier inverse-Laplacian shell term is now explained: eliminating the radial triangles gives \(\|F_{50}\|^2=f^T(I+L_2^+)f\). It is local on the complete cone.

At the frozen values, these leading approximations are not precise enough to replace the exact finite Hessians: their relative errors are approximately 0.417 and 95.9. Closed rational Gaussian susceptibility functions are supplied instead. The geometric fiveplet coefficient is \(1.0387891039539\times10^{-5}\), calculated without any target photon norm. It is not automatically the internal hypercharge singlet or physical alpha.

The uniform Hopf Chern-one background has a compact monopole defect on the filled cone. It is distinct from the zero-flux electromagnetic vacuum. Both candidate actions have stationary stable radial phases at fixed shell holonomy, but their relaxed shell Hessians have negative directions; neither selects that imposed background as an unconstrained vacuum.

### 5.1 A geometric source map, stress and field-configuration transfer

The filled cone also supplies exact metric weights. Flux-normalized Whitney/RT0 two-forms give a positive 50-by-50 magnetic Hodge matrix \(H_2\). An explicit \(\Phi_B:\mathbb R^{50}\to\mathbb R^{60}\) maps closed face flux to the twenty tetrahedral magnetic fields, weighted by \(\sqrt{V_t}\), and satisfies
\[
F^TH_2F=\|\Phi_BF\|^2,\qquad d_2F=0.
\]
The checked exact-flux residual is \(4.27\times10^{-15}\). The geometric matrix is A5-covariant and has eigenvalues 0.1892776–0.5092880. It includes face couplings and is separately distinguished from equal plaquette weights in the graph-loop limit.

Using the recovered \(c=\kappa_{\rm ent}=\eta^2/\chi\), the declared curvature action \(\Gamma_B=(c/2)F^TH_2F\) has the coframe derivative
\[
\delta\Gamma_B=c\int
\left(B_iB_j-\tfrac12|B|^2\delta_{ij}\right)E_{ij}\,dV.
\]
Six independent strain checks agree within \(9\times10^{-11}\). The tensor's physical stress sign follows the chosen metric-variation convention. This is an actual geometric stress calculation from the same action.

Whitney one-forms give a positive 42-by-42 electric \(H_1\), A5-covariant, with eigenvalues 0.1–0.6366100. Their geometric scale laws are \(H_1\propto a\), \(H_2\propto a^{-1}\).

These weights allow a complete declared compact-link field transfer on \(L^2(U(1)^{42})\):
\[
K=(2c)^{-1}\widehat E^TH_1^{-1}\widehat E,
\quad V=(c/2)F_{\rm principal}^TH_2F_{\rm principal},
\]
\[
T=P e^{-\tau V/2}e^{-\tau K}e^{-\tau V/2}P=B^\dagger B,
\quad B=e^{-\tau K/2}e^{-\tau V/2}P.
\]
Here \(P\) is the exact Haar Gauss projector, whose electric lattice is \(d_0^Tm=0\), and \(\tau=1\) is the stated dimensionless clock. Positive wrapped-Gaussian Fourier coefficients prove positivity; the symmetric factors give a contraction. A 61-mode gauge-invariant quadrature compression checks the factorization within \(4.45\times10^{-24}\). Its finite numerical compression is not a continuum or thermodynamic-limit solution; the exact rotor Hilbert space has infinitely many electric modes.

This supplies an explicit geometric curvature map, both electric and magnetic terms, stress, Gauss law and a positive field-configuration transfer. The identification of the hidden generator stiffness with the physical charge source is stated as a premise of this continuation. No target alpha is inserted. The historical source-dependent transfer has now been recovered; Section 9 proves that this supplemental Whitney transfer cannot equal it on their full Gauss carriers.

## 6. Geometry now deforms the hidden state explicitly

Unsigned vertex–face incidence recovers the actual hidden eight-dimensional face subspace with \(L_{\rm hid}=3P_3+5P_5\). A circumcentric geometric Hodge gives
\[
L_2(a)=a^{-2}L_2(1),
\quad A(a)=20\sqrt3\,\ell_0^2a^2.
\]
Under the declared fixed-temperature convention,
\[
p_5(a)=\frac1{1+e^{2\eta/a^2}},
\quad \frac{ds}{dA}=
\frac{\eta^2p_5(1-p_5)}{5\sqrt3\,\ell_0^2a^6}.
\]
Its canonical tangent yields the unfitted conditional local coefficients
\[
G_{\rm local}/\ell_0^2=9719.9940426,
\quad C_{\rm cell}=4.2669915725\times10^{-8},
\]
if that derivative is identified with the horizon density. They vary along this single-cell expansion; an independently specified macroscopic refinement law is required for a universal area density.

Anisotropic coframes split the quartets and mix hidden and visible faces. Their full Gibbs entropy includes within-quartet terms. The binary formula is exact on the original degenerate family and cannot be extended while dropping those calculated terms.

Imposing a constant area density permits an exact inverse temperature law. With \(t=a^2\), \(c=A_*/(4G)\), and \(q=H_2(p_*)+c(t-1)\), let \(x\ge0\) invert
\[
q=\log(2\cosh x)-x\tanh x.
\]
Then \(p=1/(1+e^{2x})\), \(\beta\epsilon=t x\), and the domain is bounded by \(0\le q\le\log2\). This is a necessary feedback law obtained by constraint inversion; it does not derive the imposed \(G\).

## 7. An explicit driven critical crossing

The original two-rail instrument selects the two states from critical mixedness but does not change their populations when outcomes are ignored. The recovered canonical coherent return is calculated in Section 11 and requires no new bath. The following driven bath remains a separate construction: a complete isotropic interquartet Lindblad bath with detailed-balance ratio \(\Gamma_+/\Gamma_-=\Delta^2\). Its rate \(\gamma\) is retained as a model variable rather than fitted or falsely inferred from the state.

For a golden-angle Hamiltonian drive, the stationary state and all 64 relaxation modes are solved and checked. Finite positive bath rate does not give an exactly critical stationary state in that continuous-drive family.

The actual recovered outer history swap obeys density period two. In the explicitly specified model of one swap pulse per unit period followed by the detailed-balance bath, the periodic population crosses the exact critical state at
\[
t_c=\frac{\log2-\log(1+e^{-\gamma})}{\gamma},
\]
with direct full-operator residual below \(6.3\times10^{-17}\). The pulse work is
\[
W/\epsilon=2(1-2p_*)\tanh(\gamma/2)>0.
\]
This is a concrete, completely positive driven return mechanism with a known work cost. The clock, bath and driving energy have not been identified as cosmological dynamics, so no bounce or trapped geometry is inferred from the channel alone.

## 8. What can now be reproduced

The archive contains the original reconstructed geometry and operators, the corrected quartet maps, eight source-loaded nonlinear histories, exact hidden memory, all ordered two-sheet responses, positive spectral walls and residues, complete cone incidence, both gauge response families, coframe entropy deformations and the open-system return calculation. Its runner reconstructs the derived arrays in dependency order.

| Join | Executed result | Identification retained explicitly |
|---|---|---|
| Charge → quartet → full history | Unique forced orbits and exact memory | Source connection and vacuum anchoring |
| Amplitude → positive response | Ordered products and positive generalized spectra | Cyclic exposure and physical observable |
| Polar connection → infrared sector | Three lowest channels, exact holonomy bands | Kinetic action and mass/readout map |
| Link source → curvature action | Ward identities, geometric Hodge, stress and positive field transfer | Primitive source identification and continuum matching |
| Coframe → entropy | Metric Hodge, full state and area derivative | Temperature/refinement/horizon identification |
| Outer history → critical return | Completely positive driven crossing | Bath, clock and work source |

The table describes supplemental actions, rather than missing definitions of the recovered canonical model. The following sections replace that reconstruction ambiguity with direct tests of the original definitions.

## 9. The recovered governing theory and its physical dictionary

The complete saved v61 executable and live record were recovered, along with the v54 Hamiltonian theorem, v124 closure record, September 28 physical audit and bounded October 5–6 context. This is recovery of the available sources, not a claim to have read 100 complete conversation transcripts. The v61 executable's SHA-256 is `e6bd037ffd706150dd9fe8eeeca8908a7c1a88c71a21f589b7eb05ce93128d75`, matching its integrity record. Both quick and full reproduction pass all 59 global checks. Those gates include reference comparisons and do not collectively constitute an independent experimental establishment.

The canonical finite site carrier is \(Q=(\mathbb Z/13\mathbb Z)^4\). Compact gauge links, scalars, fermions and retained heavy/mirror fields have the explicit local Hamiltonian
\[
H_{\rm local}=H_E+H_B+H_{\Phi,\rm kin}
+\sum_q\bigl(W_b+V_H\bigr)+H_F+H_Y+H_{\rm heavy}.
\]
Its electric terms are quadratic Casimirs, its magnetic terms use the shortest repaired \(A_4\) triangles, and its scalar potential includes
\[
W_b(\sigma)=-\frac A2|\sigma|^4+\frac B3|\sigma|^6.
\]
The v61 correction retains the geometric router \(L_{13}\) while using \(K_{13}^{\rm dyn}=L_{13}-13P_b\) in the scalar dynamics. It removes the earlier double counting of the breathing quadratic term. The corrected kernel has two zero modes and spectrum \(0^2,(6-\sqrt5)^3,7^5,(6+\sqrt5)^3\).

The recovered face weight is a compact-support autocorrelation hat,
\[
w_\delta(\theta)=\max(1-|\operatorname{wrap}\theta|/\delta,0),
\qquad \delta=\epsilon_*/2=0.0005609749687209334.
\]
This face width is distinct from the rail gap \(\Delta\). With the canonical product weight \(W_\delta\) and sitewise Haar Gauss projector \(P_G\),
\[
T=P_GW_\delta^{1/2}e^{-a_RH_{\rm local}}W_\delta^{1/2}P_G
=B^\dagger B,
\qquad B=e^{-a_RH_{\rm local}/2}W_\delta^{1/2}P_G.
\]
The observable dictionary follows this same transfer. Energy gaps come from its nonzero vacuum-normalized eigenvalues, \(E_n-E_0=-a_R^{-1}\log(\lambda_n/\lambda_0)\). Pole residues and current matrix elements use its normalized states and the source derivative of its action. A bare coefficient, static Schur mass or chosen boundary frame is not automatically one of those physical observables.

The earlier Whitney action shares this factorization form but has a different weight and carrier. There is now an exact exclusion of full-carrier equality. For bounded-below self-adjoint \(H\), its heat operator is injective, and
\[
\ker\bigl(PW^{1/2}e^{-aH}W^{1/2}P\bigr)=\ker(W^{1/2}P).
\]
On the full Gauss carrier the canonical hat excludes an open set of gauge configurations, giving a nonzero kernel. The Whitney potential is bounded on its compact link carrier and \(e^{-\tau V/2}>0\) everywhere; its physical transfer is injective. No unitary identification of full carriers can equate these operators. Restricting to admissible positive support is a different comparison and requires its own map. This resolves the attempted identification of our supplemental action; it does not exclude the canonical model.

## 10. The added matter action has a determined current

For the supplemental cycle action \(S_f=\sum_k\|\psi_{k+1}-U_{f,k}\psi_k\|^2\), the heat-state exposure is exactly \(1/12\) at every site, for every nonnegative heat time. This follows by straightening the unitary links and summing the twisted plane waves. It removes the earlier freedom to choose a preferred cyclic origin.

Inserting a uniform weak source into that action gives the global infrared current
\[
R_{fg}=E_f^\dagger(I_{12}\otimes I_3)E_g,
\qquad E_f^\dagger E_f=I_3.
\]
The selected infrared subspaces lose strength to excluded modes:
\[
I-R_{fg}R_{fg}^\dagger
=E_f^\dagger(I-E_gE_g^\dagger)E_f\succeq0.
\]

| Supplemental history | Current pair | Singular values | CP quartet |
|---|---|---|---:|
| Fixed frame | u, d | 0.932412, 0.844987, 0.155870 | 0.00359112203 |
| Fixed frame | e, ν | 0.779608, 0.723348, 0.272832 | 0.02049337244 |
| Co-rotating | u, d | 0.483000, 0.464350, 0.106647 | exactly 0 |
| Co-rotating | e, ν | 0.157629, 0.150665, 0.119333 | exactly 0 |

The zero quartets follow analytically from the common \(C_3\) symmetry: each infrared character occurs once, and the uniform current intertwines the characters. Every singular value in the table is below one. Rephasing, permuting or changing orthonormal bases cannot turn these matrices into the canonical unitary response currents. Polar unitarization would change the source derivative and is therefore not a legitimate repair of this observable.

A globally parallel periodic bridge requires \(H_fW_0=W_0H_g\). All four displayed pairs have zero Sylvester nullity, so their earlier open-path bridge does not close to such a nonzero bridge. This is a definite negative answer for these supplemental histories. They use the declared legacy branch and anchored forcing; they do not prove failure of the separate canonical source history. The October amplitude-to-link map \(R_k=\mathcal A_{k+1}^{-1}\mathcal A_k\) remains recovered and is not reopened as absent.

## 11. The original return is recovered without an added bath

The canonical scalar return uses \(F(x)=(1+A)x-Bx^2\), with the two rail conditions fixing \(A\) and \(B\). Its six-step rail residual is below \(7.5\times10^{-16}\), and its stable multiplier is 0.939488434674. The hidden width is derived as
\[
\varepsilon=\frac{\Delta^2}{4\eta}=2.5835035116900646\times10^{-7}.
\]
The six-time noise is coherent: two quadratures give covariance \(\varepsilon\cos(\theta_j-\theta_k)\), of rank two. It is not six independently refreshed bath draws. A 33-by-33 Gauss–Hermite moment construction has 1,089 nodes and a 6,534-by-6 Stinespring isometry; its first two moments agree with the retained archived return within \(1.2\times10^{-13}\). The Gaussian moment identity is a real-line statement. Its finite readout nodes are positive, but no complete intensity-half-line dynamics is inferred from unbounded Gaussian tails.

The exact signed outer history exchanges the hidden quartets. On their eight-dimensional sum, write
\[
L_{\rm hid}=3P_3+5P_5=4I-Z,
\qquad B_h=e^{-\eta L_{\rm hid}/2},\qquad C_h=U_8B_h.
\]
Rail exchange gives
\[
C_h^2=e^{-4\eta}U_8^2,\qquad U_8^6=-I.
\]
Thus the normalized conditional filter returns every density matrix after six steps and returns the critical hidden state after two steps. Its raw two-step success probability is \(\Delta^8\); ignoring measurement outcomes in the complete instrument fixes critical mixedness. The conditional return is not a globally attracting deterministic channel.

The physical metaplectic transport and finite internal outer history have different carriers. Requiring their equality was a typing error: faithful Weyl conjugation would force \(S_{\rm URT}^{12}=I\), while its dilation has singular values \(\kappa^{12},\kappa^{-12}\), with \(\kappa=\pi/e>1\). A compatible product completion is
\[
C_{\rm total}=M(S_{\rm URT})\otimes C_h,
\qquad C_{\rm total}^2=e^{-4\eta}M(S_{\rm URT})^2\otimes U_8^2.
\]
For arbitrary correlated states the normalized hidden marginal returns after two steps when initially critical, while the external marginal advances unitarily. Additional nonunitary external filtering can condition the hidden marginal; a factorization or weighted-marginal condition is then necessary. This theorem does not assert that the complete interacting \(H_{\rm local}\) factorizes.

## 12. Archived free-wall pole and conserved-current calculations

These calculations audit the displayed v35/v61 free wall. Under the subsequently recovered October correction, its response-fed terminal matrices are historical readouts, not the latest species-first causal definition. The current identities remain exact for this stated operator; its numerical poles are not substituted for the canonical charged H64 dynamics.

The displayed free wall reduces per species to
\[
K_{ij}=-r_i\delta_{ij}+\delta_{j,i+1},\qquad i,j=0,\ldots,11.
\]
Its static endpoint Schur mass is \(m_S=\prod_i r_i\). Its actual positive poles are the singular values of \(K\). With all top factors equal to one, the smallest pole is exactly \(2\sin(\pi/50)=0.125581039058626\ldots\). The electron pole is \(8.65973231222\times10^{-7}\). The electron/top pole ratio is 2.407908218 times the corresponding response-product ratio. No common conversion of units removes this difference.

The calculation supplies the missing energy dependence rather than an adjustable mass normalization. Partition the same Hermitian wall into endpoint \(E\) and hidden \(I\):
\[
D_{\rm eff}(z)=D_{EE}+D_{EI}R(z)D_{IE},\qquad R(z)=(zI-D_{II})^{-1},
\]
\[
Z(z)=I-\partial_zD_{\rm eff}(z)=I+D_{EI}R(z)^2D_{IE}.
\]
At a real pole away from the hidden spectrum, the reconstruction map is \(L(z)=[I;R(z)D_{IE}]\), and \(L^\dagger L=Z\). Thus a full normalized eigenstate has endpoint norm \(v^\dagger Zv=1\). For the electron at zero frequency, \(Z_L=10.93525576777\), \(Z_R=1.00009913714\); \(m_S/\sqrt{Z_LZ_R}\) matches its tiny pole to relative error \(2.9\times10^{-11}\).

Now insert conserved unit charge into every component of this same wall, \(D(a)=D+aI\). The reduced source vertex is fixed:
\[
\Gamma(z)=\partial_aD_{\rm eff}(z,a)\big|_{a=0}
=I+D_{EI}R(z)I_IR(z)D_{IE}=Z(z),
\]
\[
Z^{-1/2}\Gamma Z^{-1/2}=I.
\]
This resolves the charge readout: hidden current terms compensate the endpoint kinetic correction. An endpoint-only probe gives \(Z^{-1}\) after normalization and is a different observable. Four recovered species pass the exact identity, source/frequency finite differences and full eigenvector reconstruction; no target coupling enters.

For a specified species-changing full source \(J_{fg}\), its reduced vertex is exactly
\[
\Gamma_{fg}=L_f^\dagger J_{fg}L_g
=J_{EE}+J_{EI}R_gD_{g,IE}+D_{f,EI}R_fJ_{IE}
+D_{f,EI}R_fJ_{II}R_gD_{g,IE}.
\]
The expression shown assumes real poles. Complex-frequency bra resolvents are conjugate-adjoint, and the norm metric is \(L^\dagger L\). This gives one action-based current dictionary for the wall; it does not authorize substituting a convenient unitary matrix for its source derivative.

The same recovered free wall has now been tested with a uniform species-changing identity source on every output/left wall slice. This explicitly extends the v35 boundary probe; the wall's left block is not independently identified with the full Lorentz \(P_L\) of the gauged Wilson operator. In separately normalized left pole profiles \(\ell_f\), its exact current is
\[
(R_{fg})_{ij}=\delta_{ij}\sum_{s=1}^{11}\ell_{f,i,s}\ell_{g,j,s}
+(U_f^\dagger U_g)_{ij}\ell_{f,i,12}\ell_{g,j,12}.
\]
Only the terminal slice carries the response mixing, while the internal slices remain diagonal in family. Every off-diagonal response entry is attenuated by a product of terminal profile amplitudes. These products range from 0.08344494 to 0.12036655 for quarks and 0.10658310 to 0.13481811 for leptons. They are unequal; one global coupling rescaling cannot restore all boundary entries.

| Uniform free-wall probe | Quarks | Leptons |
|---|---:|---:|
| Maximum entry difference from the static boundary matrix | 0.204657975 | 0.662199024 |
| Projected current unitarity defect | 0.178157920 | 0.800021738 |
| Direct full-wall / Feshbach current agreement | \(1.9\times10^{-14}\) | \(6.7\times10^{-16}\) |

The positive missing-strength matrix is supplied by omitted heavy wall modes. Forty checks reproduce the full residues, analytic profiles, hidden vertex terms and covariant basis changes. A positive Dirac state contains left and right wall components with equal norms, so its raw left insertion is half the separately left-normalized current; this factor is recorded without fitting. The result excludes automatic equality of this specified bulk probe with the boundary matrix. It does not compute the full interacting Wilson/Higgs weak vertex.

These are calculations in the recovered free \(D_{\rm wall}\). The complete model also contains Wilson spinors, gauge and Higgs dynamics, mirrors and Gauss projection. Its displayed two tensor summands have additive free spectra. No identification of isolated wall poles with the full relativistic particle spectrum is made.

There is now a concrete relativistic free completion using the existing wall chirality \(\chi_{\rm wall}=\operatorname{diag}(I,-I)\), with \(\{\chi_{\rm wall},D_{\rm wall}\}=0\):
\[
H_{\rm gr}=h\otimes\chi_{\rm wall}+I\otimes D_{\rm wall},
\qquad H_{\rm gr}^2=h^2\otimes I+I\otimes D_{\rm wall}^2.
\]
When the kinetic operator has \(h(p)^2=|p|^2I\), the complete free bands are \(E=\pm\sqrt{|p|^2+m_j^2}\). This follows from anticommutation and introduces no fitted coefficient or larger carrier. Eleven checks verify the graded square, every band and its controlled change of frame. It replaces the displayed ungraded tensor placement; it is a derived supplemental correction, not an identity already proved for the historical Hamiltonian. The frozen Wilson operator itself has \(h_W(0)=-M\gamma_5\), so grading alone does not remove that kernel gap or establish the physical continuum kinetic operator. The full interacting theory must implement its spinor, gauge and mirror projection consistently with this relativistic requirement.

## 13. Quantum breathing poles from the recovered potential

Two reductions of the corrected potential are now solved. On one real neutral site, \(H=p^2/2+W_b(\sigma)\) gives an odd \(\sigma\) pole at gap 1.450772114234783 with residue 0.330944204608279, and the first connected even \(\sigma^2\) pole at gap 3.920122954822195 with residue 0.152289367011826. Independent harmonic and sine-grid calculations agree; conservative reported precision is \(10^{-9}\), without an interval-arithmetic claim. The spectral sum rules are
\[
\sum_n(E_n-E_0)|\langle0|\sigma|n\rangle|^2=\tfrac12,
\]
\[
\sum_n(E_n-E_0)|\langle0|\sigma^2|n\rangle|^2
=2\langle\sigma^2\rangle=0.667220116875981.
\]
For a uniform collective coordinate with \(M=13^4=28,561\),
\[
H_{\rm coll}=\frac{p_\sigma^2}{2M}+MW_b(\sigma).
\]
The localized-well gap is 2.899719490035068, compared with the tree curvature mass 2.900042878530526. Perturbation theory independently gives
\[
m_{\rm well}=m_{\rm tree}-\frac{41B}{6AM}+O(M^{-2})
=2.899719518474138+O(M^{-2}).
\]
The numerical difference from this first correction is \(-2.84\times10^{-8}\). In finite volume the parity-even global vacuum has an exponentially small interwell splitting; that splitting is distinct from the localized-well excitation. Both reductions omit nonuniform spatial modes and the full gauge/face transfer. Their calculated gaps are not asserted to be collider masses.


## 14. The current source and operator specification

Twenty further complete source texts were recovered and checked, including
v102, v113, v114 and v129. Latest October chat corrections retain
\(H_{64}=4\operatorname{End}(V_4)=H_{13}\oplus H_{51}\), canonical
\(\alpha_{\rm URT}=\phi^{-2}\), species loading before vacuum selection,
and \(R_{f,k}=\mathcal A_{f,k+1}^{-1}\mathcal A_{f,k}\). The exact canonical
species-loaded generator was not supplied by these texts. The older
\(\beta=1/4,\theta_H=12/5\) recurrence belongs to the legacy
\(\sqrt{4/3}\) branch; replacing only its scalar factor would define another
proposed model rather than recover the latest selection equation.

The retained primitive charge words are
\[
q_u=(1,3,-4),\quad q_d=(1,-3,2),\quad
q_e=(-3,-3,6),\quad q_\nu=(-3,3,0),
\]
and the typed amplitude is
\[
\mathcal A_{f,k}=C_5(H_k)
+C_{43}(\Xi_{3,k}+J_{43}q_f/3)
+i(-1)^kC_{45}(\Xi_{5,k}+\Delta J_{45}g(q_f)/5).
\]
This fixes where charge enters an amplitude, but not every entry of its
nonlinear 64-state generator. The coherent current specification is in
`continued_physics_work/theory/current_theory_specification.md`.

The dimensional transfer clock \(a_R\) stays explicit: the face-democracy
aspect ratio \(c_t=1\) does not set \(a_R=1\). The supplied v61 polynomial
\[
\alpha_{\rm root}^{-1}
=137+\frac{17572}{1215}\Delta-\frac9{65}\Delta^2
\]
is retained as historical response arithmetic. Supplying its associated
bare coupling and reading it back is not an independent prediction.
None of the new calculations fits a measured mass, photon coefficient or
Newton coefficient.

## 15. Hidden elimination now retains the closed loop

For a source-dependent Gaussian kernel,
\[
K=\begin{pmatrix}A&B\\C&H\end{pmatrix},\quad
R=H^{-1},\quad S=A-BRC,\qquad \det K=\det H\det S.
\]
The hidden determinant remains after endpoint charge normalization. Its
source Hessian contributes
\[
\partial_{\mu\nu}\log\det K
=\operatorname{Tr}(RH_{\mu\nu}-RH_\mu RH_\nu)
+\operatorname{Tr}(S^{-1}S_{\mu\nu}-S^{-1}S_\mu S^{-1}S_\nu).
\]
All nine mixed product derivatives in \(S_{\mu\nu}\) are retained. Endpoint
normalization also retains the determinant Jacobian:
\[
\log\det S=\log\det Z
+\log\det(Z^{-1/2}SZ^{-1/2}).
\]
Discarding \(\log\det H\) loses a loop even when the endpoint Ward identity
passes. Discarding the contact term breaks the Ward identity. Seventeen
independently differentiated checks pass; the exact Hessian split error is
\(3.9\times10^{-16}\).

For a free Fock trace the determinant kernel is \(I+e^{-aD}\), rather than
the one-particle transfer alone. The full weighted interacting Gauss transfer
requires its own derived functional integral before Gaussian reduction.
The proof and operators are in `continued_physics_work/feshbach_loop/`.

## 16. An electron-normalized current Hessian is calculated

All \(13^4=28,561\) A4 momenta, every charged species and all 26 wall states
are retained in the declared free completion
\[
h(A)=\gamma_5D_W(A)\otimes I+I\otimes D_{\rm wall},\qquad
\Omega_\beta(A)=-\operatorname{Tr}\log(1+e^{-\beta h(A)}).
\]
This conditional calculation uses no target coupling or measured mass.
It omits the dynamical gauge/Higgs fields, hat and Gauss constraint and
is therefore not the full selected-transfer photon coefficient. The natural
root Clifford frame is also an explicit completion of the recovered theorem,
not a claim of having recovered the original v54 matrix bytes.

The electron-normalized source is fixed by its line integral, \(Q_e=-1\):
\[
U_\rho(x)=e^{iQ\int_x^{x+\rho}A_\mu dx^\mu},\qquad
J_{\rho\mu}(q)=\rho_\mu\operatorname{sinc}(q\cdot\rho/2),\quad
J(q)q=2\sin(q\cdot\rho/2).
\]
The physical coframe Hessian is \(\Pi=J^THJ/\sqrt5\), using the exact
A4 cell volume. The complete current and seagull obey the Ward identity
with maximum production residual \(1.64\times10^{-11}\).

| Torus mode | \(\Pi_T/q^2\) for \(\Omega_{\eta_\Delta}\) | For \(F=\Omega/\eta_\Delta\) |
|---|---:|---:|
| \((1,0,0,0)\) | 49.13736428 | 8.19530017 |
| \((2,0,0,0)\) | 45.62224701 | 7.60903671 |
| \((3,0,0,0)\) | 39.81186228 | 6.63996058 |

The varying finite-mode values are not extrapolated or fitted: the fixed
13-torus has no nonzero \(q\to0\) sequence. The trace clock
\(\beta=\eta_\Delta\) is illustrative and does not select dimensional
\(a_R\). The analytic high-temperature finite sum gives
\(\Pi_T/q^2=27.037181398578\,\beta^4+O(\beta^6)\) at the first mode.
Eighteen production checks and a separate real-space review verify the
contact and pure-gauge invariance. Full data are in
`continued_physics_work/photon/free_fock_photon_*`.

## 17. The physical photon source is distinguished from a translated trace

Insert a central U(1) background into every dynamical link occurrence,
including matter hops, magnetic loops and the hat. Unitary link translation
commutes with the central Gauss projector and gives
\[
T[A]=R_AT[0]R_A^\dagger,
\qquad \operatorname{Tr}T[A]^n=\operatorname{Tr}T[0]^n.
\]
This unrestricted trace has zero Hessian even for curved \(A\). Integrating
over the translated mean field erases the probe. Before Higgs reduction,
the electromagnetic noncentral Cartan direction needs its own covariant
constraint dictionary; the central U(1) argument cannot silently replace it.

A transverse Legendre construction instead holds a mean field fixed. For
specified Gaussian bare and matter kernels,
\[
\Gamma_\gamma^{(2)}=K_{\rm bare}+\Pi,\qquad
C_{\rm ext}=\Pi-\Pi(K_{\rm bare}+\Pi)^{-1}\Pi.
\]
The external matter-current response differs from the inverse photon
propagator. For a differentiable full-rank Gibbs source,
\[
\partial^2[-\log Z]
=\beta\langle H''\rangle-g_{\rm BKM}(\rho',\rho').
\]
A positive state-tangent norm is the covariance contribution and retains
its source contact and sign. An exact isospectral example has metric and
contact both 1.1202401071073 while its partition Hessian is zero. The selected
transfer's moving null support must also be handled before using \(-\log T\).

The October positive metric gate therefore needs this observable dictionary
before it becomes a physical coupling claim. Fractional charges retain the
correct compact phase cover or SM quotient. Twenty-five compact-rotor,
noncommuting Gaussian and Gibbs checks pass. Full proof and data are in
`continued_physics_work/photon/source_dictionary_*`.

## 18. The actual signed history poles replace tangent-Gram poles

Directed interval arithmetic certifies the legacy113 source-loaded histories
at 80 digits for their exact binary source instantiation. The true ordered
signed Jacobians are retained. The fixed-frame electron has two negative
multipliers. Each of the eight species/source cases has 64 disjoint visible
multiplier intervals; four widely separated certified poles already exclude
an automatic three-pole reduction of this particular machine.

The retained 13-state resolvent includes all 51 hidden states through exact
frequency-dependent memory. Its 768-state periodic lift obeys
\[
G_{\rm clock}(s)=s^{11}G_M(s^{12})
\]
and has genuine oblique residues \(v\ell^T\). A tangent Gram erases the
negative-multiplier phases. The physical step \(a\) remains symbolic.

These are stability poles of the stated legacy recurrence. The certificate
encloses exact binary source vectors, not unrounded Clebsches; tiny symmetry
splittings carry that qualification. It neither identifies stability rates
with charged relativistic poles nor substitutes the legacy branch for
canonical \(\phi^{-2}\). Operators and independent review are in
`continued_physics_work/history/`.

## 19. A common coframe supplies universal stress

The ten A4 root dyadics span \(\operatorname{Sym}^2(V_4)\), with exact Gram
spectrum \(10^1,5^4,2^5\). The traceless sector has rank nine and the retained
\(4\oplus5\) decomposition. Varying only diagonal triangle weights realizes
four metric directions; five are missing, with exact residual squared
singular value \(48/7\).

A positive full loop-Hodge extension supplies all metric directions:
\[
K(E)=(I-P)+J[\det E\,\Lambda^2(g^{-1})]J^T,
\qquad J=B/\sqrt5,\quad P=JJ^T,\quad B^TB=5I_6.
\]
It retains the flat kernel. This is a derived coframe source extension,
with higher-curvature terms requiring their own specification. One coframe
deforms scalar, gauge and spinor sectors; a local Spin(4) connection gives
the frame Ward identity. Transfer variations supply stress and its contact
and Kubo–Mori response.

The literal two-vector v129 quadrupole has generic tangent rank seven while
its linear span is nine. Pulling back the frozen isotropic quartet covariance
supplies all nine directions without a new stiffness. Representation and
stress checks are in
`continued_physics_work/gravity/Common_Coframe_Stress_2026-10-08.md`.

## 20. The spin-two pole is tested as a tensor pole

The recovered v114 uniform projector has rank one, diagonal residue \(1/13\)
and scalar three-space Green function \(1/(52\pi r)\). Its exact theorem is
preserved. For the specific proposed identification
\(\Sigma=R_{\rm TF}^{(1)}[h]\), however,
\[
\mathcal R_0^\dagger\mathcal R_0
=\frac{p^4}{4}(P_2+P_{0s}),\qquad
K_{\rm ent}=\frac{\chi_{35}p^4}{4}(P_2+P_{0s}).
\]
Its TT propagator after removing gauge directions is
\[
D_{\rm ent}^{TT}=\frac4{\chi_{35}p^4}P_2,
\qquad \frac4{\chi_{35}}=0.08339070213472527.
\]
This has a double pole and transverse scalar. The Einstein kernel is instead
\(p^2(P_2-2P_{0s})\), with a simple pole and conserved-source numerator
\(J_{\mu\nu}J^{\mu\nu}-(\operatorname{tr}J)^2/2\). A constant source
normalization cannot change pole order or numerator.

The Ricci source has six Fourier directions although its pointwise traceless
carrier has nine. Exact rational projectors and the Lorentz null quotient
with two physical helicities are checked. The actual coframe-dependent
transfer must supply its own linear-curvature coefficient; no Newton
coefficient is chosen. This tests the curvature-norm kinetic reading while
preserving the broader entropy-gravity branch and Einstein interface.
Full derivation: `continued_physics_work/gravity/spin2_metric_pole_identity.md`.

## 21. The selected gauge spectrum and its physical flux correlator

An exact Gauss-invariant compact triangle retains the electric, magnetic and
hat terms:
\[
H_\triangle=-\frac{3g^2}{2}\partial_\theta^2+g^{-2}(1-\cos\theta),
\qquad T_\triangle=\sqrt{w_\delta}e^{-aH_\triangle}\sqrt{w_\delta}.
\]
At the illustrative \(a=\eta_\Delta\), with the supplied conditional bare
coefficient, its first two normalized eigenvalues are
\(2.44116096\times10^{-11}\) and \(5.01187106\times10^{-22}\).
Its first gap is 4.07551461, versus 1.69694172 for the unweighted Hamiltonian.
Fourier and quadrature refinement change the ratios by at most
\(1.7\times10^{-11}\) relatively. The independent narrow-hat proof derives
the \(\delta^2\) and \(\delta^4\) ratios. Joint clock, width and spatial scaling
are part of a continuum interpretation; this cell does not decide that limit.

The gauge-invariant bounded flux \(X=\operatorname{Arg}U_\triangle\) supplies
the positive observable source \(T_j=e^{jX/2}T e^{jX/2}\). Its correlator is
\[
C_X(n)=\sum_r R_r r_r^{|n|},\quad
C_X(\omega)=\sum_r R_r\frac{1-r_r^2}{1-2r_r\cos\omega+r_r^2},\quad
\Gamma_X^{(2)}=C_X^{-1},
\]
where \(r_r=\lambda_r/\lambda_0\) and
\(R_r=|\langle0|X|r\rangle|^2\). At this clock witness,
\(\langle X^2\rangle=5.2448795251100\times10^{-8}\),
\(C_X(0\text{ frequency})=5.2448795253661\times10^{-8}\), and
\(\Gamma_X(0)=19,066,214.8704\) in actual flux units.

Eighteen checks compare direct transfer products, spectral sums, resolvents,
source derivatives and refinement. This is an actual gauge-invariant
Legendre response, rather than an all-occurrence translation, but is not
the four-dimensional photon coefficient. Spectrum, asymptotics, proof and
correlator are in `continued_physics_work/weighted_gauge/`.

## 22. The resulting theory and the remaining physical objects

The common carrier, species-first causal ordering, positive weighted Gauss
transfer and hidden entropy structure now have explicit definitions of
charged poles, currents, photon 1PI response and common-coframe stress.
The new calculations resolve the hidden-loop omission, distinguish entropy
covariance from partition curvature, retain signed residues, and distinguish
scalar and metric poles. Each coefficient is tied to a stated operator.

The next derivation pass, recorded below, reconstructs the golden species
block and proves why its source extension is not unique under the recovered
constraints. It calculates the entire A4 Gaussian photon sector and the
retained exponential common-trace Einstein coefficient. It also derives the
volume/tadpole equation that a physical stationary-background pole must obey.
These results replace the earlier blanket statement that no Einstein
coefficient or whole-lattice photon coefficient had been calculated. Their
action scopes and the selected-transfer identifications remain explicit.

## 23. Derive the golden species block

The recovered normalized intertwiner $S:3\to3'$ obeys $S^\dagger S=SS^\dagger=I$. Define
\[
M_S=\begin{pmatrix}I&S^\dagger\\S&0\end{pmatrix}.
\]
Multiplication gives $M_S^2-M_S-I=0$, hence
\[
\operatorname{spec}M_S=\{\phi,-\phi^{-1}\},\qquad
M_S^2=\begin{pmatrix}2I&S^\dagger\\S&I\end{pmatrix},\qquad
\operatorname{spec}M_S^2=\{\phi^2,\phi^{-2}\}.
\]
Each eigenvalue has triplet multiplicity. The contraction ratio follows algebraically:
\[
\alpha_{\rm URT}=\frac{|{-\phi^{-1}}|}{\phi}=\phi^{-2}.
\]
This reconstructs the golden block and its ratio. It does not identify that six-dimensional block with every entry of the full64 nonlinear history.

Insert the recovered species amplitude before eliminating history coordinates:
\[
\mathcal A_{f,k}=C_5(H_k)+C_{43}(\Xi_{3,k}+J_{43}q_f/3)
+i(-1)^kC_{45}(\Xi_{5,k}+\Delta J_{45}g(q_f)/5).
\]
The primitive $q_f$ are the recovered up, down, electron and neutrino words; $g_i=q_i^2-\|q\|^2/3$. The real affine amplitude decoder has rank13, with real kernel dimension51. Its thirteen decoded coordinates are a fiveplet and two quartets. Its restriction to the retained $\mathscr H_{13}=2\mathbf1+\mathbf3+\mathbf3'+\mathbf5$ has rank5: the two charged quartets lie in the hidden history carrier. These are different thirteen-dimensional subspaces. The complex-linear extension of the decoder has rank9/kernel55; the real decoder’s kernel51 is not an identification of the quantum Feshbach hidden block.

Two natural source extensions of the same golden block are
\[
A_{\rm dir}(\mathcal A)=\begin{pmatrix}2I&\mathcal A^\dagger\\\mathcal A&I\end{pmatrix},
\qquad
A_{\rm sq}(\mathcal A)=\begin{pmatrix}I&\mathcal A^\dagger\\\mathcal A&0\end{pmatrix}^{\!2}.
\]
For singular values $\sigma_i\$ of $\mathcal A$, their spectra are respectively
\[
\lambda_{\rm dir}^{\pm}=\frac32\pm\sqrt{\frac14+\sigma_i^2},\qquad
\lambda_{\rm sq}^{\pm}=\left(\frac{1\pm\sqrt{1+4\sigma_i^2}}2\right)^2.
\]
They agree whenever $\mathcal A$ is unitary. Set $t=\sigma^2$. At the golden point $t=1$, both lower branches equal $\phi^{-2}$, but
\[
\frac{d\lambda_{\rm dir}^{-}}{dt}=-\frac1{\sqrt5},\qquad
\frac{d\lambda_{\rm sq}^{-}}{dt}=1-\frac1{\sqrt5}.
\]
Their responses have opposite signs. For the squared extension, affine history/source derivatives also give a compulsory mixed contact
\[
(M^2)_{,ij}=M_{,i}M_{,j}+M_{,j}M_{,i}
\]
when $M_{,ij}=0$. Ignoring it fails the executed source-Hessian checks.

The direct extension is positive definite only when every $\sigma_i^2<2$. The squared extension is nonnegative for all amplitudes and positive definite for nonsingular amplitudes; its continued lower branch is contractive only when $\sigma_i^2<2$. At the chart origin $P=0$, the primitive electron load gives $\sigma_{\max}=1.9683926376$: the direct extension has eigenvalue $-0.5309036353$, while the squared lower branch reaches $2.3436659405$. These are source-chart probes, not selected electron vacuum or mass values.

Even positivity at every amplitude does not select a unique continuation:
\[
A_{\rm alt}=A_{\rm sq}
+\alpha_{\rm URT}\operatorname{diag}
[(\mathcal A^\dagger\mathcal A-I)^2,(\mathcal A\mathcal A^\dagger-I)^2].
\]
This alternative is positive definite even at singular amplitudes, agrees with the golden block, and has the same triplet covariance and branch projector. Its first radial vertex addition vanishes at the unitary point, but its second radial contact differs by \(2\alpha_{\rm URT}I\). Thus even fixing the base operator and first vertex does not fix the response contact.

Explicit full64 positive witnesses additionally preserve the generation compression and known hidden8 rails while changing the hidden51 determinant or retained–hidden coupling. Their extra projectors are amplitude-blind and commute with the recovered finite symmetry/outer action. Thus the carrier, decoder, golden ratio and positivity alone do not select one full source action. This proves nonuniqueness under those hypotheses; it introduces no freedom into an already specified complete action. The exact nonlinear species-loaded law must supply the missing selection premise.

## 24. Derive what the recovered vacuum principles select

For raw-history second moment $C=\mathbb E[XX^\dagger]$, the recovered hard quadratic rate-distortion cost is
\[
\mathcal J(\Pi)=\mathbb E\|X-\Pi X\|^2+2\eta\operatorname{rank}\Pi
=\operatorname{Tr}C+\operatorname{Tr}\Pi(2\eta I-C).
\]
Global minimization over orthogonal projectors gives
\[
\Pi_* =\mathbf1_{(2\eta,\infty)}(C).
\]
Only an eigenvalue exactly at $2\eta$ creates a tie. The recovered threshold is $2\eta=11.9915959735$; calculating $C$ requires the primitive joint history distribution and distortion units. Selecting thirteen modes cannot be inferred from the threshold alone.

The separate exact hidden minimax gives
\[
\min_\beta\|I-\beta(3P_3+5P_5)\|=\frac14,
\qquad\beta_* =\frac14,
\qquad[I-\beta_*L_{\rm hid}]^6=I_8/4096.
\]
It determines the hidden linear relaxation, not every coefficient of the nonlinear full64 selector.

For the recovered candidate $\mathscr F=V_{\rm URT}+\tfrac12\operatorname{Tr}\log Q$, $Q=\bar\chi+\mathscr D_{\mathbb A}^2>0$, the joint vacuum and source equations are
\[
\delta\mathscr F=\delta V+\frac12\operatorname{Tr}(Q^{-1}\delta Q)=0,
\]
\[
\mathscr F_{,ij}=V_{,ij}+\frac12\operatorname{Tr}
[Q^{-1}Q_{,ij}-Q^{-1}Q_{,j}Q^{-1}Q_{,i}].
\]
These include the contact and loop terms. The primitive spiral term $-\Re(\bar\Omega w)$ supplies history drift $w\mapsto w+\Omega$, not an unconstrained stationary minimum. Its admissible history constraint must therefore precede vacuum minimization. None of these equations licenses importing the retired scalar recurrence or response-fed wall into the current branch.

## 25. Derive a photon coefficient on the entire A4 torus

On all $13^4=28{,}561$ momenta, take ten root links and both translated triangular halves for every root-plane type:
\[
F^1_{ijk}(x)=a_{ij}(x)+a_{jk}(x+r_{ij})-a_{ik}(x),
\]
\[
F^2_{ijk}(x)=a_{jk}(x)+a_{ij}(x+r_{jk})-a_{ik}(x),\qquad
S_c=\frac c2\sum_{x,i<j<k}[(F^1)^2+(F^2)^2].
\]
The links have fixed electron Wilson-phase normalization. This is a declared Gaussian local action, with its gauge zero modes and flat holonomies treated explicitly.

Its complete Fourier incidence has rank9 at every nonzero momentum, leaving exactly the lattice gauge direction. One triangular half alone has rank6 at every momentum; integrating the six extra link bands then removes its entire apparent coframe Maxwell kernel. The translated face registry therefore matters. Independent algebra proves these ranks; enumeration verifies every torus mode.

For both halves, the exact triangle area frame is $\sum b_{\triangle}b_{\triangle}^{T}=5I_6/2$, and the primitive cell volume is $\sqrt5$. Schur integration of the six noncoframe link bands preserves this leading curvature tangent. Consequently
\[
K_A(q)=Z_\gamma(q^2I-qq^T)+O(q^4),\qquad
Z_\gamma=\frac{\sqrt5}{2}c.
\]
This is an analytic derivative of the symbol, without a fitted infrared intercept. The six link bands are not the fifty-one hidden histories. Both determinants and the coframe Jacobian remain in their appropriate vacuum/stress responses.

The exact hidden8 information Hessian fixes $c$ once its curvature-to-generator embedding is declared:

| Declared source at fixed physical curvature | $c$ | $Z_\gamma$ | Formal $4\pi Z_\gamma$ |
|---|---:|---:|---:|
| Unit Hilbert–Schmidt cross-rail generator | $\eta^2/\chi_{35}=0.749465460810$ | 0.837927858580 | 10.5297120190 |
| Algebra-unital cross-rail generator | $\eta\tanh\eta=5.995723686481$ | 6.703422868638 | 84.2376961521 |

These hold the same physical curvature fixed and are different source embeddings. Rescaling a generator basis and its coordinate together changes neither physical action nor coupling. No source norm was inferred from a desired alpha value.

The canonical repaired hat has $-\log w_\delta(F)=|F|/\delta+\cdots$, so it has no quadratic Taylor Hessian at zero. Its exact selected transfer cannot be replaced by this Gaussian action without a derivation. The full interacting photon computation instead uses the Gauss-compatible bounded curvature source in
\[
T=P_GW_\delta^{1/2}e^{-aH_{\rm local}}W_\delta^{1/2}P_G.
\]
For a reflection-symmetric channel and nondegenerate vacuum, subtract the curvature means and sum over excited physical transfer states:
\[
C_F(q,\omega)=\sum_{r>0} R_r(q)\frac{1-r_r^2}{1-2r_r\cos\omega+r_r^2},
\quad r_r=\lambda_r/\lambda_0,
\quad\Gamma_A^{(2)}=D^\dagger C_F^{+}D,
\]
with the inverse restricted to the physical Bianchi/transverse image. Its full eigenvectors, hidden51 determinant, source contacts, mean-field chart and physical clock must be retained. An unrestricted all-link translation is a different observable and can have zero Hessian.

## 26. Derive the retained Einstein coefficient and exchange

The scalar-free common exponential trace has internal particle/conjugate dimension96, Dirac rank384 and unified generator index12. For
\[
S_{\rm sp}=A_0\operatorname{Tr}e^{-\eta D[g,U]^2/\Lambda_{\rm grav}^2},
\]
the heat coefficients give
\[
S_{\rm sp}=\int\sqrt g\left[
\frac{24A_0\Lambda_{\rm grav}^4}{\eta^2\pi^2}
-\frac{2A_0\Lambda_{\rm grav}^2}{\eta\pi^2}R
+\frac{A_0}{2\pi^2}F_{\mu\nu}^aF^{a\mu\nu}+\cdots\right].
\]
Gauge normalization $F^2/(4g_U^2)$ fixes $A_0=\pi^2/(2g_U^2)$, hence
\[
\frac1{16\pi G}=\frac{\Lambda_{\rm grav}^2}{\eta g_U^2},\qquad
\frac{G\Lambda_{\rm grav}^2}{g_U^2}
=\frac\eta{16\pi}=0.119282610921289.
\]
There is no independent fitted Newton amplitude. The later normalized cutoff relation is $\Lambda_{\rm grav}^2/\mu_U^2=5/\sqrt6$.

Around a stationary flat background, in the low-curvature regime, the extracted leading Einstein Hessian and inverse are
\[
K_{\rm EH}=\frac{\Lambda_{\rm grav}^2}{2\eta g_U^2}p^2(P_2-2P_{0s}),\qquad
D_{\rm EH}=\frac{2\eta g_U^2}{\Lambda_{\rm grav}^2p^2}
(P_2-\tfrac12P_{0s}).
\]
The common coframe couples each matter sector through its stress vertex $T^{\mu\nu}/2$. Conserved-source exchange has numerator $T_1:T_2-T_1T_2/2$ and gives $-Gm_1m_2/r$. Tensor factors, gauge null directions and the unique infrared zero of a concrete A4 gradient are checked. This derives the conditional universal Einstein exchange; it is not the exact inverse of the whole unexpanded trace.

## 27. Derive the vacuum condition before calling that pole physical

The same trace has volume coefficient
\[
C_0=\frac{12\Lambda_{\rm grav}^4}{\eta^2g_U^2},\qquad
C_R=\frac{\Lambda_{\rm grav}^2}{\eta g_U^2}.
\]
It therefore has a nonzero flat-space tadpole. The truncated action $\int\sqrt g(C_0-C_RR)$ would imply
\[
\Lambda_{\rm cc}=\frac{C_0}{2C_R}=\frac{6\Lambda_{\rm grav}^2}{\eta},
\qquad R=\frac{24\Lambda_{\rm grav}^2}{\eta}.
\]
Its curvature expansion parameter is $\eta R/\Lambda_{\rm grav}^2=24$, outside a small-curvature truncation. That apparent stationary solution cannot justify the flat-space pole or the derivative expansion.

There is an exact stronger result for the standalone massless exponential trace with fixed $A_0,\eta,\Lambda_{\rm grav}$. Under uniform coframe scaling $g\mapsto s^2g$, $D\mapsto s^{-1}D$, and on a compact carrier
\[
\frac{dS_{\rm sp}}{d\log s}
=\frac{2A_0\eta}{\Lambda_{\rm grav}^2s^2}
\operatorname{Tr}\left[D^2e^{-\eta D^2/(\Lambda_{\rm grav}^2s^2)}\right]>0\]
whenever there is a nonzero Dirac mode. The unsubtracted standalone trace has no unconstrained homothetic stationary vacuum. Its Einstein coefficient remains well defined, but a physical stationary-background pole requires a vacuum/volume mechanism.

The recovered full Cathedral interface already includes its cosmological/state terms, breathing potential, Higgs and heavy sectors. Their joint scale/source equation can alter this conclusion. The exact monotonicity theorem does not apply to that full interacting action without checking those terms. A fixed-volume condition, explicit vacuum subtraction or derived sector cancellation must be part of the selected model; none is added here merely to force flat space.

The recovered four-sheet calculus belongs inside the weighted Hamiltonian/transfer and does not establish $\operatorname{Tr}f(D/\Lambda)=-\log\operatorname{Tr}T[g]^n$. Proving that physical action identification and its joint vacuum equation remains necessary before transporting the conditional Einstein residue into the selected theory. The cutoff $\Lambda_{\rm grav}$ and cosmological curvature $\Lambda_{\rm cc}$ are different quantities.

## 28. Result and reproducibility

| Object | Derived result | Exact boundary |
|---|---|---|
| Canonical species construction | Golden block/ratio, typed affine loads, decoder ranks, source derivatives and full64 completion witnesses | The supplied block/entropy/symmetry data admit inequivalent source actions; a unique nonlinear selected law does not follow from them. |
| Photon | Complete whole-torus Gaussian incidence, hidden-band integration and unfitted $Z_\gamma=\sqrt5c/2$ | The literal hat and joint charged-history source are not proved equivalent to that Gaussian action. |
| Gravity | Common-trace Einstein coefficient, tensor exchange and exact volume/scale condition | A physical pole requires the full selected action and a stationary vacuum; the standalone trace cannot supply that vacuum. |

The proofs resolve concrete algebraic questions rather than naming unspecified objects “unresolved.” They also establish why the recovered constraints do not yet entail one predictive theory of nature. Choosing one source/vacuum completion and presenting its outputs as forced predictions would add an assumption. No such assumption or observational fit has been concealed.

Detailed proofs and source provenance are in `derive_three_work/species/`, `derive_three_work/photon/`, `derive_three_work/gravity/`, `derive_three_work/recovery/`, and `derive_three_work/operator_dictionary/`. Use `python3 run_three_derivations.py` from the package root to reproduce the new calculations with the bundled prerequisite arrays. The earlier selected-cell and full-current calculations remain available through the preceding runners. Bounded chat retrieval and the named full recovered sources do not constitute access to one hundred complete conversations.


The following continuation applies the later recovered fixed-volume entropy premise. It supersedes the preceding spectral normalization as the current physical gravity route, while retaining its conditional mathematics.

## 29. The entropy route gives the Einstein tensor relation

Let \(\zeta_A\) denote the physical area derivative of the ultraviolet entropy in units of \(k_B\). For a small three-dimensional geodesic ball of radius \(\ell\), direct curvature and radius expansion gives
\[
\delta A|_V=-\frac{4\pi\ell^4}{15}\,\delta G_{uu}.
\]
The radius correction is essential: keeping radius fixed gives a different coefficient. For the conformal-vacuum modular/stress identification, integration of the ball weight gives
\[
\delta\langle K\rangle
=2\pi\int_{r<\ell}\frac{\ell^2-r^2}{2\ell}\delta T_{uu}\,d^3x
=\frac{8\pi^2\ell^4}{15}\delta T_{uu}.
\]
Fixed-volume entropy stationarity therefore yields
\[
0=\zeta_A\delta A|_V+\delta\langle K\rangle
\quad\Longrightarrow\quad
\delta G_{uu}=\frac{2\pi}{\zeta_A}\delta T_{uu}.
\]
Defining the resulting gravitational coefficient by \(G_{\rm ent}=1/(4\zeta_A)\) gives the Einstein factor \(8\pi G_{\rm ent}\). Requiring the relation in every timelike direction supplies its tensor form; conservation leaves the cosmological integration constant to its own vacuum/state equation. This derivation uses no exponential-cutoff normalization.

The small-ball geometry and modular assumptions are the first-order entanglement-equilibrium framework of [Jacobson](https://arxiv.org/html/1505.04753v4). Conformal fields have the displayed ball modular Hamiltonian; a nonconformal sector requires its scalar modular correction. The Cathedral must establish that identification for the physical selected-transfer stress. Its exact hidden entropy law supplies
\[
\delta S_{\rm IR}/k_B=2\eta_\Delta\,\delta p_5,
\qquad
\zeta_A=-2\eta_\Delta\left(\frac{\partial p_5}{\partial A}\right)_V,
\]
and hence
\[
G_{\rm ent}
=-\frac{1}{8\eta_\Delta(\partial p_5/\partial A)_V}.
\]
This identifies precisely the coframe/state derivative which determines the coefficient. That distinction has an exact witness. In the same area chart \(u=A/A_0\), consider the supplied extensions
\[
K_b(u)=\eta_\Delta[3P_3+(5+2b(u-1))P_5],\qquad 0<b\le1.
\]
Every extension has the same full reference state at \(u=1\), affine degree one, and positive gap for \(u>0\). Yet
\[
\left.\frac{\partial p_5}{\partial A}\right|_{A_0}
=-\frac{2\eta_\Delta b}{A_0}p(1-p),\quad
\zeta_A=\frac{4\eta_\Delta^2b}{A_0}p(1-p),\quad
\frac{G_{\rm ent}}{A_0}=\frac1{16\eta_\Delta^2bp(1-p)}.
\]
The fixed labels \(b=1/2\) and \(b=1\) therefore give a factor-of-two difference despite identical reference data. Neither is chosen as the canonical source or fitted to \(G\). This proves that reference data and an area coordinate do not determine the physical area-to-modular source embedding; that law must be derived from the selected action.

The local fixed three-volume premise does not imply that the entire universe has fixed four-volume. A homothetic variation changing the ball volume is outside this entropy-stationarity condition. Consequently the preceding unconstrained exponential-trace theorem cannot exclude this constrained route.

## 30. Derive the actual hidden population source

At the recovered reference,
\[
K_0=\eta_\Delta(3P_3+5P_5),\qquad
\rho_0=e^{-K_0}/Z,\qquad p=p_5.
\]
For a general modular source \(V=\delta K\), Gibbs differentiation gives
\[
\delta p=-p(1-p)\left[
\frac{\operatorname{Tr}(P_5V)}4-\frac{\operatorname{Tr}(P_3V)}4
\right].
\]
A source proportional to the identity has zero population response. A purely cross-rail source also has zero first-order population response. The mean diagonal rail-gap source, including any derived coframe dependence of \(L_{\rm hid}\) or \(\eta_\Delta\), supplies the linear response required by the area law.

For \(K(x)=K_0+x\begin{pmatrix}0&I_4\\I_4&0\end{pmatrix}\), put \(r=\sqrt{\eta_\Delta^2+x^2}\). Exact diagonalization gives
\[
p_5(x)=\frac12\left(1-\frac{\eta_\Delta}{r}\tanh r\right).
\]
Its first derivative vanishes. Coherent states also require the finite relative-entropy term:
\[
S(\rho_x)-S(\rho_0)
=2\eta_\Delta[p_5(x)-p]-D(\rho_x\Vert\rho_0).
\]
Thus the response entropy cannot be replaced by \(H_2(p_5(x))\) once cross-rail coherences are present. In the dimensionless \(x\) chart,
\[
p_5''(0)=\frac{\tanh\eta_\Delta-\eta_\Delta\operatorname{sech}^2\eta_\Delta}{2\eta_\Delta^2},
\quad
D''(0)=\frac{\tanh\eta_\Delta}{\eta_\Delta},
\quad
S''(0)=-\operatorname{sech}^2\eta_\Delta.
\]
Sixteen exact-coefficient and finite-matrix checks pass in joint_vacuum_work/entropy_diamond.py. These identify the needed source channel and verify the area-response counterexample; they do not replace the full coframe-loaded Hamiltonian by an eight-state toy.

## 31. Joint vacuum selection changes the response calculation

For a fully specified action \(\mathcal F(P,s)\), the same shared species-loaded unconstrained vacuum obeys \(\mathcal F_{,P}=0\). If its field Hessian is invertible, eliminating the vacuum displacement gives
\[
\Gamma_{,ss}
=\mathcal F_{,ss}
-\mathcal F_{,sP}\mathcal F_{,PP}^{-1}\mathcal F_{,Ps}.
\]
For actual constraints \(g(P,s)=0\), use \(L=\mathcal F+\lambda^Tg\) and the bordered Hessian
\[
B=\begin{pmatrix}L_{PP}&g_P^T\\g_P&0\end{pmatrix},\qquad
\widehat{\mathcal F}_{ss}
=L_{ss}-\begin{pmatrix}L_{sP}&g_s^T\end{pmatrix}
B^{-1}\begin{pmatrix}L_{Ps}\\g_s\end{pmatrix}.
\]
This retains the multiplier contact \(\lambda^Tg_{ss}\). The vacuum displacement must therefore be included in a photon or stress response.

The action choice is different from the variables varied inside that action. A coefficient labelling two compatible action completions does not become a dynamical field merely because one solves the joint vacuum equation. The new species calculation tests this distinction on the actual decoded64 source operators, with one shared finite probe vacuum and primitive species multiplicities. The finite probe potential is explicitly conditional.

Polynomial minimality alone does not select the squared golden extension. Even at quadratic degree there is the nonnegative family
\[
G_\epsilon(A)=
\begin{pmatrix}
I+A^\dagger A&A^\dagger\\
A&(1-\epsilon)I+\epsilon AA^\dagger
\end{pmatrix},
\qquad 0\le\epsilon\le1.
\]
Every member agrees at unitary \(A\); its scalar singular-channel determinant is \(1-\epsilon+\epsilon\sigma^4\). Even affine Hermitian roots can differ:
\[
D_+(A)=\frac1{\sqrt5}\begin{pmatrix}3I&A^\dagger\\A&2I\end{pmatrix},
\qquad D_+(S)^2=M(S)^2
\]
at unitary \(S\), whereas their squares differ away from it. Fixing the underlying signed affine Hermitian block and dependence solely on \(A\), with no extra bridge or history spurions, can select a particular square within that block class. That is a stronger premise than the shared trace-log functional or lowest polynomial degree. If the recovered bridge \(S\) itself is allowed as a coefficient spurion, affine diagonal terms such as \(S^\dagger A+A^\dagger S-2I\) vanish at \(A=S\) while changing the source law; even signed zero-source agreement then does not establish uniqueness.

In the declared actual64 probe, a stable common branch has field-Hessian minimum \(0.859203\). Relaxing that one shared vacuum changes its radial source curvature from \(-0.385079\) to \(-4.695233\). An admissible decoder-blind hidden completion leaves the same common vacuum exactly unchanged while changing that response to \(-0.693514\) at its declared action label \(0.1\). These are conditional external-source action curvatures, not particle masses or photon residues. They prove that agreement on a stationary vacuum does not identify the complete determinant/source action.

## 32. The literal hat has a computable correlated response

On the closed five-vertex, ten-edge K5 local graph, Gauss reduction leaves six cycle angles. For a free electric Hamiltonian, the physical quotient heat-kernel diagonal is constant. Therefore the one-slice transfer response is exactly
\[
\frac{\operatorname{Tr}(X_iX_jT)}{\operatorname{Tr}T}
=\frac{\int X_iX_j W_\delta\,d\mu}{\int W_\delta\,d\mu}
\]
for every positive transfer step, without fitting a clock or coupling. All shared-edge triangle constraints remain in \(W_\delta\).

The exact covariance tensor has the form
\[
C_F=\delta^2t_mP_{\rm cycle},\qquad
\Gamma_F^{(2)}=\frac{1}{\delta^2t_m}P_{\rm cycle},
\]
where \(P_{\rm cycle}\) has rank6 and diagonal \(3/5\). Eight independent scrambled Sobol integrations, refined through \(2^{21}\) points each, give:

| Local selector | \(t_m\) | \(\delta^2\Gamma_F\) on its image | Independent-face comparison |
|---|---:|---:|---:|
| Ten shared faces, \(\prod w_\delta\) | \(0.18998510\pm0.00000208\) | \(5.2635706\pm0.0000576\) | 6 |
| Same faces weighted twice, \(\prod w_\delta^2\) | \(0.09829582\pm0.00000186\) | \(10.1733723\pm0.0001927\) | 10 |

Errors are replicate standard errors with refinement drift recorded; they are not rigorous intervals. The first local stiffness is about 12.27% below the independent-face result. Tree coordinates have a nontrivial metric and cannot be treated as six identical independent fluxes.

The geometric bivectors obey \(B_2^TB_2=5I_6\) and \(B_2B_2^T/5=P_{\rm cycle}\). Pulling back through the actual triangle areas \(B_2/2\) gives the local curvature Hessian \(5I_6/(4\delta^2t_m)\). A duplicate observable list has rank six; its pseudoinverse gives the same pullback without double counting.

The doubled local selector is not a two-step transfer, and coincident local faces are not the distinct translated faces of the full torus. These are actual correlated one-slice selected-transfer results in their declared free-electric sector. A massless long-cylinder photon residue still uses the interacting spectral response and physical current/field map.

## 33. The full action needs a typed constrained variation

Retain \(T=P_GW_\delta^{1/2}e^{-aH_{\rm local}}W_\delta^{1/2}P_G\) and \(Z_n=\operatorname{Tr}T^n\). For a source \(s\), the joint stationarity term is
\[
\partial_s(-\log Z_n)
=-\frac{n\,\operatorname{Tr}(T^{n-1}T_{,s})}{Z_n}.
\]
Its second derivative retains every ordered two-insertion separation and \(T_{,ss}\). The selected Hamiltonian, selector, Gauss projector, coframe measure/support and clock variations belong inside this derivative. On a constant-rank positive-support stratum, the equivalent modular formula includes its source contact and Kubo–Mori covariance. Across moving hat thresholds, the complete trace has boundary/shape contacts. In the executed scale probe, the support boundary contributes \(+8Z\), the interior contributes \(-4Z\), and the complete second derivative is \(+4Z\). Dropping that boundary reverses the sign. Replacing the selected trace by a spectral trace or dropping its contacts changes the action.

The recovered interface also contains its Einstein, rail-potential, cosmological and state terms. Their variations must be combined with this transfer response on the specified constrained manifold:
\[
\Omega_{n,i}+k_{\rm Cat}(\mathrm{EH})_{,i}
-(\mathrm{potential\ density})_{,i}
+\ell_{\rm Cat}(\mathrm{volume})_{,i}
+(\Gamma_{\rm state})_{,i}+\lambda^ag_{a,i}=0.
\]
Every term denotes its full source dependence; a source-dependent coefficient belongs inside the derivative. The cosmological symbol ambiguity is resolved by the earlier recovered v61 dictionary. In its inverse-metric Lorentz convention,
\[
k_{\rm Cat}=\frac1{16\pi G},\qquad
\ell_{\rm Cat}=B=-\frac{\Lambda_{\rm cc}}{8\pi G},
\qquad \Lambda_{\rm cc}=-8\pi G\ell_{\rm Cat}.
\]
The density has units \(L^{-4}\), while curvature has units \(L^{-2}\). The statistical stress and Lorentz stress still require their continuation/sign dictionary. A derived transfer Einstein term and an explicit interface Einstein term require a matching prescription: \(k_{\rm total}=k_{\rm local}+k_{\rm induced}\), counting each contribution once.

Reference-subtracted entropy and the absolute action have different source content. \(H[g]\mapsto H[g]+C[g]I\) leaves every normalized selected state and its relative entropy unchanged, but shifts \(-\log Z_n\) by \(naC[g]\). A volume constraint removes that variation only in its allowed directions; it does not determine an absolute vacuum pressure by itself. The actual fixed action must supply that source dependence.

## 34. Precedence-ordered closure ledger

| Component | Status | Scope |
|---|---|---|
| Finite carriers, rails, hidden reference state, entropy first law, positive-transfer factorization | Closed and frozen | Retained exact identities. |
| Fixed-volume entropy tensor derivation, golden source/selector algebra, conditional whole-A4 Gaussian and local correlated-hat responses | Closed mathematically; physical identification pending | Actual modular/stress, coframe/area, current and interacting-transfer identifications remain explicit. |
| Applying the standalone unconstrained scale obstruction to the current entropy route | Reopened and rejected on scope | The recovered fixed-volume premise excludes that variation; no full-Cathedral no-go follows. |
| Exponential-trace ratio as the normalization of current physical gravity | Retired/superseded physical route | Its conditional heat coefficients remain correct branch mathematics. Later entropy/coframe corrections control the current route. |

Detailed proofs are [joint selected-transfer variation](joint_vacuum_work/gravity/joint_selected_vacuum_report.md), [shared species vacuum](joint_vacuum_work/species/shared_species_vacuum_report.md), [correlated hats](joint_vacuum_work/photon/correlated_hat_k5_report.md), and [independent action review](joint_vacuum_work/review/total_vacuum_review.md). The exact hidden and diamond checks, original QMC replicate data and source recovery are preserved. The finite selected-transfer variation test is explicitly supplemental, with a declared coupling witness; it is not a computation of the full interacting vacuum. A complete interacting theory-of-nature claim still requires the full selected source action and its physical limits; none is replaced by a fitted coefficient in this continuation.

## 35. Recovered area law and the corrected factor eight

The September 28 relation, read together with the September 30 negative
fixed-volume entropy balance and October 2/5 retained area ratio, is

\[
e^{-\sigma_S}=H_2(p_5)/\ln2,\qquad A=C_Ae^{\sigma_S/2},
\qquad \delta_V S_{\rm UV}+\delta_V S_{\rm IR}=0.
\]

Here \(C_A\) is an unspecified constant along the declared source curve,
\(\sigma_S\) is its entropy-depth coordinate, and \(H_2\) is one binary
entropy in natural units. Eliminating \(\sigma_S\), with
\(u=A/A_\star\), gives the complete nonlinear relation

\[
H_2(p(u))=H_\star/u^2,\qquad
H'_A=-2H_2/A,\qquad H_\star=H_2(p_\star).
\]

Consequently the local entropy density is \(\zeta_A=2H_2/A\) and

\[
G_{\rm ent}=\frac1{4\zeta_A}=\frac{A}{8H_2}.
\]

**Correction:** the earlier assertion that the factor eight needs two entropy
copies is false under this recovered relation. One entropy gives the factor
eight. Likewise the earlier free-slope witnesses test weaker reference-state
premises; they do not leave the slope free after this nonlinear law is imposed.
The original calculations remain archived with this correction governing their
interpretation. Spectral-action normalization is not reinstated.

The unfitted reference values are

\[
\Delta=\frac3{20}-\frac{80\pi}{1053\phi},\quad
\eta_\star=-\ln\Delta,\quad p_\star=\frac{\Delta^2}{1+\Delta^2},
\]
\[
H_\star\simeq0.0000804963073331,\qquad
G_\star/A_\star\simeq1552.866263575.
\]

This last number is a dimensionless ratio in the declared area chart. It does
not assign a physical area unit. A source varying the state of one region is
also distinct from enlarging a region by independent boundary copies. The
latter scales area and entropy together and preserves the reference density;
the former has \(G(u)/A_\star=u^3/(8H_\star)\). A single source curve therefore
does not prove a constant universal Newton coefficient.
There is also an exact functional distinction: integrating the required UV
entropy derivative gives \(S_{\rm UV}/k_B=C-H_2\) on this curve. Substituting
the varying \(G(u)\) into the absolute quotient \(A/(4G(u))\) instead gives
\(2H_2\), whose variation fails the declared balance by \(3dH_2\).
The local tangent identification is not an absolute global area-entropy
functional with a state-dependent coefficient silently held constant.

## 36. Full modular source and a positive realization

On the small-population branch, \(H_2\) is strictly increasing. The state is
uniquely fixed for \(u\ge u_{\min}=\sqrt{H_\star/\ln2}\simeq0.01077644\):

\[
p(u)=H_2^{-1}(H_\star/u^2),\quad
q(u)=\ln\frac{1-p(u)}{p(u)},\quad
\rho(u)=\frac{1-p(u)}4P_3+\frac{p(u)}4P_5.
\]

Both rail projectors have rank four; their labels are eigenvalues, not ranks.
The normalized modular operator and its first two population sources are

\[
K_\rho=-\ln[(1-p)/4]P_3-\ln[p/4]P_5,
\]
\[
p_u=-\frac{2H}{uq},\qquad
p_{uu}=\frac{6H/u^2+p_u^2/[p(1-p)]}{q},
\]
\[
q_u=-\frac{p_u}{p(1-p)},\qquad
q_{uu}=-\frac{p_{uu}}{p(1-p)}+
\frac{p_u^2(1-2p)}{p^2(1-p)^2}.
\]

The identity part of the normalized modular operator is retained. Executed
matrix checks give \(e^{-K_\rho}=\rho\),
\(\operatorname{Tr}\rho K_{\rho,u}=0\), and
\(\operatorname{Tr}\rho K_{\rho,uu}=\operatorname{Cov}_{KM}
(K_{\rho,u},K_{\rho,u})\). Thus a normalized state family has a nonzero state
metric but zero normalized log-partition Hessian after its source contact.
The exact reference relative-entropy identity is retained. Away from the
reference point \(dH=q(u)dp\); freezing \(q=2\eta_\star\) is incorrect.

At the reference point the former arbitrary area-source label is fixed to

\[
b_{\rm required}=\frac{H_\star}{2\eta_\star^2p_\star(1-p_\star)}
\simeq0.180692996836.
\]

For the round-screen incidence of section 3, set

\[
L(u)=\frac{3P_3+5P_5}{u},\qquad
\beta(u)=\frac{u q(u)}2,\qquad B(u)=e^{-\beta(u)L(u)/2}.
\]

This is an all-order positive realization: \(B^\dagger B\), normalized by
its trace, equals the displayed \(\rho(u)\). Twelve equal commuting positive
factors \(e^{-\beta L/24}\) have product \(B\). Its contacts are
\(\beta_u=q/2+uq_u/2\) and \(\beta_{uu}=q_u+uq_{uu}/2\).
A left unitary attachment to the complete \(B\) leaves its Gram operator
unchanged. Arbitrary interleaved unitary attachments need not do so.

This constructs the clock profile required by the recovered law once the
screen and operator normalization are declared. It does not prove that an
independently recovered full selector already generates that profile. Scalar
identity costs also remain invisible to the normalized state while changing
the absolute transfer action. At \(u_{\min}\) the modular gap has a square-root
endpoint and source derivatives diverge; the differential formulas above
apply to the interior.

## 37. Actual incidence, coframe contacts and fixed-volume curvature

The calculation rebuilds the twelve icosahedral vertices, twenty faces and
thirty edges. With vertex/face incidence \(B_{vf}\) and face/edge differential
\(D_{fe}\), it verifies \(B_{vf}B_{vf}^T=5I+2A_{\rm ico}\),
\(\dim\ker B_{vf}=8\), and hidden spectrum \(3^4\oplus5^4\).
Metric face and edge Hodge matrices give

\[
L_2=H_2^{1/2}D_{fe}H_1^{-1}D_{fe}^TH_2^{1/2},\quad
G=E_0^TH_2E_0,\quad Q=H_2^{1/2}E_0G^{-1/2},\quad L_{\rm hid}=Q^TL_2Q.
\]

The moving hidden frame is differentiated. The full six-source Jacobian and
36 matrix Hessian entries are stored. Its five spatial shear singular values
are all \(4.091551778\). At the symmetric reference point their mean rail,
area and occupation gradients vanish, although the operators split quartets.
For fixed-volume affine polyhedral shear the area Hessian is exactly
\((8A_0/15)I_5\). The uncoarse-grained hidden entropy then also has a
within-quartet term; a binary occupation entropy cannot silently replace it.
Those flat cell-shape variations are not geodesic-ball curvature variations.

For an actual round geodesic ball of reference radius \(R\), sectional
curvature \(K\), and fixed spatial volume, the derived boundary expansion is

\[
u(K)=\frac{A(K)}{A_0}
=1-\frac{R^2}{5}K-\frac{3R^4}{175}K^2+O(K^3).
\]

Assigning the canonical incidence directions to that spherical screen gives
\(L_{\rm hid}^{\rm norm}=L_0/u\), preserving the two maximally mixed quartets,
and hence

\[
(L_{\rm hid}^{\rm norm})_K=\frac{R^2}{5}L_0,\qquad
(L_{\rm hid}^{\rm norm})_{KK}=\frac{4R^4}{35}L_0.
\]

An exact fixed-volume radial solve checks both jets. The raw spherical Hodge
normalization is recorded separately. Combining these jets with section 2
fixes, in the displayed normalized convention at \(R^2=\phi+2\),

\[
\beta_K=-5.12255484995,\qquad \beta_{KK}=-2.61780764456.
\]

Fixed \(\eta_\star\) surface geometry alone gives the opposite entropy–area
sign. The constructed profile supplies the required compensating source.
The incidence-to-physical-screen identification and its derivation from the
complete selected clock remain declared premises of this realization.
The separately calculated curved coordinate-polyhedron has a different
boundary coefficient and is not substituted for this ball.

## 38. All twelve signed-history phases and the shared source

For the actual signed sixty-four-state carrier, the full chronological real
source decoder has rank **18**, with kernel dimension 46. A one-phase decoder
has rank 13; premature restriction to the retained thirteen-dimensional input
has rank only 5. The full period is therefore necessary. Its classical decoder
kernel is not the quantum fifty-one-dimensional hidden complement.

A declared common probe potential \(V=\alpha_{\rm URT}\|P\|^2/2\), with all
twelve log-determinants retained, has one shared eighteen-coordinate stationary
point: gradient norm \(7.95\times10^{-16}\) and minimum Hessian eigenvalue
2.44623. The probe declares its regulator and potential; action density per
clock cell is not an assumption of uniform physical exposure.

Chronological raw links are \(R_k=\mathcal A_{k+1}^{-1}\mathcal A_k\).
Their product telescopes to identity when \(\mathcal A_{12}=\mathcal A_0\).
Polar factors do not generally telescope. On an executed common nonstationary
field, polar return distances from identity range from 0.822 to 1.143 while the
raw product is identity to roundoff. Weighted positive history returns and
phase exposures are calculated separately and need not be uniform.

The Walsh degree-five source is blind to every decoder phase, commutes with
the signed history and A5 action, and has zero overlap with the hidden-eight
quantum rail carrier. An explicit deformation at the Dirac operator preserves
\(Q=\chi+D^2\) and the generation block. Its full-period trace-log shift is
constant in every shared history coordinate within the declared decoupled
completion; it therefore preserves that completion's history-field stationarity while
altering other hidden response data. Phase exposures in the declared weighted
full64 history are checked rather than assumed unchanged. A physical support
that removes the deformed sector can remove its observable contribution.
This is a completion comparison for
typed history slots, not permission to append terms to a fully fixed action.
On a supplied mathematical primitive-source tangent the comparison changes
the first and second full64 determinant contacts by approximately 15.38534
and 4.60735, verified to 3.66e−15. History-field stationarity does not imply
identical charged-source response or an identical absolute action.

The signed cube and exterior Fock space have the same total A5 character but
different degree decompositions and outer traces: \(\operatorname{Tr}U_{64}=0\)
versus \(\operatorname{Tr}\Gamma(C)=\det(I+C)=2\). A dimension count does not
identify their histories. The former generation-depth filter remains retired.

## 39. Physical gauge carrier and source pullback

The recovered exterior-family construction is extended to explicit gauge
matrices on sixteen states, and to three generations with conjugates on
ninety-six states. The v61 certificate declares the three-plus-two split,
compact gauging and physical family dictionary as premises; these matrices
realize that conditional identification entry by entry. The commuting color,
weak and hypercharge actions live on this declared physical carrier. The shared-five frame inside H13 does
not by itself furnish commuting color and weak actions.

For electron-normalized hypercharge and the usual fundamental generator trace
normalization, the computed indices per generation are
\((k_Y,k_2,k_3)=(10/3,2,2)\). Three generations and their conjugates give
\((20,12,12)\). A declared common unweighted parent trace therefore has
relative hypercharge index \(5/3\) and \(\sin^2\theta=3/8\) at that action
scale. These are representation-theoretic trace ratios. They neither select
the common scalar action coefficient nor give a low-energy running coupling.

All sixty A5 matrices give actual End4 projectors of ranks 1,3,3,4,5. The weak 3
seed lifts to the 120-element binary icosahedral group; the color 3′ seed embeds
in SU3. An explicit orthogonal intertwiner maps its adjoint 3′+5 into the hidden
response carrier, with maximum equivariance residual 3.36e−15. Density-coordinate
BKM and modular-coordinate Kubo–Mori metrics are related by their actual Gibbs
Jacobian; choosing one without that source map would change the normalization.

The current common-history amplitudes enter an explicit covariant 48/96-state
Higgs/Yukawa insertion. All twelve gauge Ward/contact tests pass; their
log-determinant contact-minus-connected residual is at most 3.33e−16. This uses
the declared history continuation's matrices, without identifying them as
physical pole masses. Full matrices, charge assignments, anomaly sums and
charged-link contacts are included in the gauge report. Gauge algebra, hidden
geometric incidence, history and source response retain their distinct maps.

## 40. Repeated correlated photon transfer

The ten K5 face hats remain correlated through six cycle variables. With
\(F=Dx=\delta Dy\), \(W(y)=\prod_f(1-|Dy|_f)_+\), and
\(s=ag^2/2\), the exact N-slice trace is

\[
Z_N=\left(\frac\delta{2\pi}\right)^{6N}
\int\prod_t d^6y_t W(y_t)
K_s\bigl(\delta(y_t-y_{t+1})\bigr),\qquad y_N=y_0.
\]

It is not an integral of \(W^N\) at one common point. At fixed clock the
narrow-hat leading operator is rank one. The controlled scaling
\(ag^2=\tau\delta^2\) instead retains the nontrivial kernel

\[
M_\tau(y,y')=\exp[-(y-y')^TG_E^{-1}(y-y')/(2\tau)]
\quad\hbox{in }L^2(Wdy/\!\int Wdy).
\]

All temporal returns and equal-time contacts enter

\[
C(\omega)=\sum_rR_r\frac{1-r_r^2}
{1-2r_r\cos\omega+r_r^2},\qquad\Gamma=C^{-1}
\]

on the six-dimensional Bianchi image. Direct transfer products, spectral tail
bounds, an explicit source contact and a derivative of the ground log
eigenvalue independently check the same susceptibility.

| Confined clock ratio \(\tau\) | Equal-time coefficient | Static coefficient | Inverse static coefficient for \(F/\delta\) | Frequency-squared coefficient |
|---:|---:|---:|---:|---:|
| 0.25 | 0.153685 | 0.196066 | 5.10032 | 0.800284 |
| 1 | 0.178729 | 0.191964 | 5.20930 | 0.200036 |
| 16 | 0.188924 | 0.189819 | 5.26818 | 0.0125018 |

These are S5-projected finite quadrature estimates. Last-refinement static
drift is 0.30–0.67% and frequency drift 0.19–0.30%; the unsymmetrized finite
tensor retains 1.2–1.6% symmetry residuals. These diagnostics are not rigorous
error intervals. They do not replace the more accurate cached one-slice
covariance or its replicate error bars.

Analytically \(\Gamma_{F/\delta,\omega^2}=1/(5\tau)+O(\tau^{-2})\).
Physical-time normalization is essential: with \(j=aJ\) and \(\omega=a\Omega\),
\(C_{\rm phys}=aC_{\rm slice}(a\Omega)\) and
\(\Gamma_{\rm phys}=\Gamma_{\rm slice}(a\Omega)/a\).
The triangle-area pullback \(B_2^TB_2=5I\) then yields

\[
\frac{5a}{4\delta^2}\Gamma_{F/\delta,\omega^2}
=\frac1{4g^2}+O(1/(g^2\tau)).
\]

This recovers the stated electric kinetic coefficient as a function of the
Hamiltonian's coupling. It does not determine that coupling. The restriction
has no magnetic potential, charged matter or full spatial momentum and hence
does not certify the complete four-dimensional massless photon residue.

## 41. Common variation and what the construction fixes

The contact-complete joint variation and bordered constraint Hessian remain
the governing variational equations. The new sources enter them as concrete
operator jets, not as independent fitted response constants. For an actual
selected transfer, all source-dependent clocks, measures, projectors, support
boundaries, hidden determinants and constraint-multiplier contacts remain.
Constructing a positive normalized rail state does not determine the absolute
selected free energy or all matter interactions.

| Result | Established scope |
|---|---|
| Single-entropy factor eight and unique diagonal source curve | Exact consequences of the recovered nonlinear area law on its declared branch |
| Positive round-screen clock profile and matrix curvature contacts | Constructed to all orders conditional on the physical screen identification |
| Actual incidence metric Jacobian/Hessian | Executed geometric completion; spherical and polyhedral sources distinguished |
| Full-period decoder rank 18 and chronological return identities | Actual recovered signed cube and specified source maps |
| Gauge matrices, charges, trace indices and covariant matter contacts | Entrywise realization of the recovered conditional exterior-family representation; no predicted running couplings |
| Multi-slice correlated susceptibility and leading electric coefficient | Exact transfer formulas plus quantified quadrature for the free-electric local graph restriction |
| Historical spectral normalization and generation-depth filter | Superseded physical routes; archived calculations retain their declared mathematical scope |

To identify the resulting candidate as a complete physical theory, the same
selected action must produce the constructed modular clock, regional area
normalization, physical matter embeddings and interacting poles. The derived
conditional source realization is now explicit and testable; those physical
identifications are not replaced by a finite-test count.

## 42. Recovery, checks and reproducible files

Recovered source excerpts and chronology are saved in
`combined_source_work/recovery/combined_chat_recovery.json`. The available
complete files and targeted conversation recovery do not constitute a verified
reading of one hundred complete conversations. Retrieval failures are not
evidence that equations never existed.

`run_combined_sources.py` validates the executed records, source hashes and
finite matrices without repeating the numerical quadrature. Its `--recompute`
option reproduces the finite constructions; `--reintegrate-photon` explicitly
repeats the new correlated kernel calculation. Python, NumPy and SciPy suffice.

Detailed derivations are in the gravity, species, gauge, photon and review
subfolders of `combined_source_work/`, with JSON checks and NPZ operators.
The continuation package includes this report and updates the current theory
specification and governing ledger. The independent audit distinguishes exact
identities, conditional completions and numerical approximation errors.
There are 142 named checks across the entropy curve, gauge join, photon
response and two independent reviews, plus the direct metric, round-transfer
and signed-history assertions. Every saved check record passes. Their finite
scope is the one stated in each record.

Primary background sources: [Discrete Exterior Calculus](https://arxiv.org/abs/math/0508341),
[Delaunay Hodge Star](https://arxiv.org/abs/1204.0747), and
[Entanglement Equilibrium and the Einstein Equation](https://arxiv.org/abs/1505.04753).
They supply the established geometric/entropy frameworks; they do not validate
Cathedral's new incidence, clock or matter identifications.

## 43. Full-order gauge covariance: a tested defect and an exact completion

The previous A5-equivariant linear hidden8 chart is

\[
K(t)=K_0+tV_X,\qquad
K_0=\eta\,\operatorname{diag}(3I_4,5I_4),\quad
V_X=\frac1{\sqrt2}\begin{pmatrix}0&X^\dagger\\X&0\end{pmatrix}.
\]

For the singular values \(s_j\) of \(X\), its exact partition trace is

\[
Z(t)=2e^{-4\eta}\sum_{j=1}^4
\cosh\sqrt{\eta^2+t^2s_j^2/2}.
\]

Put \(M_2=\operatorname{Tr}X^\dagger X\),
\(M_4=\operatorname{Tr}(X^\dagger X)^2\), and \(h=\tanh\eta\).
For general equal rail dimension \(d\),

\[
\log[Z(t)/Z(0)]=a_2t^2+a_4t^4+O(t^6),
\quad a_2=\frac{hM_2}{4\eta d},
\]
\[
a_4=\frac{(1-h/\eta)M_4}{32\eta^2d}
-\frac{h^2M_2^2}{32\eta^2d^2}.
\]

The basepoint relative cost is \(a_2t^2+3a_4t^4+O(t^6)\).
An explicit continuous color conjugation preserves \(M_2=6.3333333333\)
but changes \(M_4\) from \(18.7479482236\) to \(24.9962075457\).
The relative-entropy quartic coefficient changes from \(0.00364677922\) to
\(0.00704096259\). Thus this particular *linear hidden8 chart* preserves the
quadratic gauge norm but fails the all-order gauge test. This does not reopen
the already constructed physical16/96 gauge representation.

There is also a precise representation constraint. With unequal reference
populations and fixed reference-preserving unitary gauge action on two complex
rails4, no injective equivariant offdiagonal source can contain both a color
adjoint and a commuting weak adjoint. Color forces compatible \(3\oplus1\)
rail representations; its multiplicity commutant has no nontrivial commuting
SU(2). Rails5 with \(3\oplus2\) suffice. The theorem concerns this fixed-unitary,
linear-source setting, not every nonlinear or reference-moving source chart.

An exact tensor completion preserves the original hidden geometry:

\[
\mathscr H_{40}=\mathscr H_8\otimes\mathbb C^5,
\quad\rho_{40,*}=\rho_{8,*}\otimes I_5/5,
\quad R(G)=\operatorname{diag}(I_4\otimes G,I_4\otimes G),
\]
\[
F_5=\operatorname{diag}(F_C-BI_3/3,F_W+BI_2/2),
\quad X_{20}=X_g\otimes I_5+I_4\otimes\sqrt5F_5.
\]

The resulting Gibbs family is covariant under the fixed group representation
at every source strength, including mixed geometry/gauge quartics and
pairwise relative entropy. On pure geometric sources it is exactly
\(\rho_8(g)\otimes I_5/5\): relative entropy and reference-subtracted entropy
transfer are unchanged, while the full entropy adds the inert constant
\(\ln5\). The factor \(\sqrt5\) matches the declared quadratic trace; it is
not a derived physical photon normalization. A faithful left module of the
full algebra \(\mathbb C\oplus\mathbb H\oplus M_3(\mathbb C)\) instead has
complex dimension6; its tensor48 source carrier is a separately typed object.
Neither tensor completion is asserted to be a recovered canonical embedding.

The report also constructs a nonlinear unitary hidden8 completion. It retains
the first source jet and an invariant basepoint cost, but its spectrum is
constant, its absolute partition response vanishes after the second contact,
and its pairwise relative entropy is not a gauge isometry. It therefore cannot
supply the physical photon kinetic term by itself.

Detailed proofs and 28 named checks:
[full_entropy_gauge_join_report.md](final_join_work/gauge/full_entropy_gauge_join_report.md).

## 44. Conserved metric equations and the entropy-area contact

Retain the recovered curve

\[
H(A)=H_*\left(\frac{A_*}{A}\right)^2,
\quad \alpha=-H_A=\frac{2H}{A},
\quad G_{\rm tangent}=\frac{A}{8H}.
\]

**Reference stationarity remains compatible with constant Newton coefficient.**
For constant \(G_*=A_*/(8H_*)\), on this declared curve realization,

\[
S_{\rm gen}=\frac{A}{4G_*}+H(A)=H_*(2u+u^{-2}),
\quad S_{{\rm gen},u}(1)=0,\quad S_{{\rm gen},uu}(1)=6H_*>0.
\]

The recovered bounded user condition is stationarity; it does not add a
maximum condition. Identifying the tangent coefficient at *every* point is
a stronger premise and yields \(G_{\rm tangent}=G_*u^3\).

If that stronger variable-density identification is imposed, put
\(F=\alpha/(2\pi)=H/(\pi A)\). The entropy-depth curve gives
\(F=F_*e^{-3(\sigma-\sigma_*)/2}\). A sufficient covariant local completion is

\[
I=\int\sqrt{-g}\left[\frac12FR-\frac12Z(\sigma)(\nabla\sigma)^2
-V(\sigma)\right]+I_m[g,\sigma].
\]

Its equations, with \(J_m=(\sqrt{-g})^{-1}\delta I_m/\delta\sigma\), are

\[
FG_{\mu\nu}=T^m_{\mu\nu}+Z\partial_\mu\sigma\partial_\nu\sigma
-\frac Z2g_{\mu\nu}(\nabla\sigma)^2-Vg_{\mu\nu}
+\nabla_\mu\nabla_\nu F-g_{\mu\nu}\Box F,
\]
\[
Z\Box\sigma+\frac12Z'(\nabla\sigma)^2-V'
+\frac12F'R+J_m=0,\qquad
\nabla^\mu T^m_{\mu\nu}=J_m\partial_\nu\sigma.
\]

The complete off-shell Ward identity is verified. Here \(F'=-3F/2\) and
\(F''=9F/4\) fix the metric source contacts. The Einstein-frame kinetic
coefficient is \(F_{\rm ref}[Z/F+27/8]\); its Jordan-unit numerator is
\(Z+27F/8\). This completion neither selects \(Z,V\) nor proves that the
entropy-depth coordinate is the canonical breathing field.

The integrated fixed-volume balance and Wald expression differ by a contact:

\[
dS_{\rm UV}=\alpha\,dA=-dH,\quad
S_{\rm Wald}=2\pi FA=2H,\quad A\,d\alpha=3\,dH.
\]

Persistent balance along this one-dimensional curve would require
\(dS_{\rm corr}=-3dH\). On independent area/scalar source space the form
\(-A\,d\alpha\) is not exact. It cannot silently be appended as a universal
entropy term. The null-horizon calculation independently fixes the quadratic
production coefficient \(2\pi[Z+27F/8]\). It is nonnegative for
\(F>0\) and \(Z+27F/8\geq0\); \(Z\geq0\) is sufficient.
That production does not cancel this linear regional contact.

For the declared diagonal rail realization
\(K=(q/2)(3P_3+5P_5)\), with no added scalar cost, the absolute trace
supplies information absent from its normalization:

\[
\Gamma=-\log Z=\frac32q-\log4-\log(1+e^{-q}),
\quad q=\log[(1-p)/p].
\]

At the retained reference on the declared source curve,
\(\Gamma_\sigma=1.62510477274\), even though the bare breathing minimum has
zero first derivative. This is the derivative of that supplied rail
realization, not the full canonical selected action. The selected absolute
action, measure, cell-density conversion and clock must be varied together;
a normalized-state calculation cannot replace them. A constant-scalar vacuum
of the declared scalar action requires \(R=4V/F\) and \(V'+3V=0\).

Detailed equations, direct numerical Ward/null checks and exact contacts:
[covariant_entropy_join_report.md](final_join_work/gravity/covariant_entropy_join_report.md).

## 45. Full-period matter poles and source endpoints

The actual twelve-phase amplitudes define
\(R_{f,k}=A_{f,k+1}^{-1}A_{f,k}\). With
\(F_k=S^\dagger A_k\), \(h_k=F_k^\dagger F_k\), and \(\xi_k=F_k\psi_k\),

\[
\sum_k\|\xi_{k+1}-\xi_k\|^2
=\sum_k(\psi_{k+1}-R_k\psi_k)^\dagger
h_{k+1}(\psi_{k+1}-R_k\psi_k).
\]

This raw radial chart has exact generalized eigenvalues
\(4\sin^2(\pi n/12)\), each with multiplicity3. Physical endpoint factors
cancel its apparent source response. Raw amplitude ratios alone therefore do
not determine species-dependent particle energies.

For explicitly supplied positive radial factors \(B_{f,k}\), the executed
full768 period construction instead uses

\[
(\mathsf S_f\xi)_{k+1}=U_{64}B_{f,k}\xi_k,
\quad L_f=(I-\mathsf S_f)^\dagger(I-\mathsf S_f)\ge0.
\]

A declared positive Fock Hamiltonian \(d\Gamma(L_f/a)\), \(a>0\), supplies a
well-defined conditional quantum realization. In the retained156/hidden612
decomposition \(L_f=\begin{pmatrix}A&B\\B^\dagger&D_h\end{pmatrix}\),

\[
K_f(e)=eI-A-B(eI-D_h)^{-1}B^\dagger,
\quad K_f'=I+B(eI-D_h)^{-2}B^\dagger,
\quad K_f''=-2B(eI-D_h)^{-3}B^\dagger.
\]

The complete hidden resolvent agrees with direct768 inversion to
\(1.03\times10^{-14}\). The common-number vertex obeys
\(\omega\Gamma^0=K_f(e+\omega)-K_f(e)\), with the entire hidden memory and
source contacts retained. Noncommuting exponential second jets and physical
readout endpoints are checked through second order.

A uniform triplet field source has positive residue matrices summing to
\(I_3\), but sees12 numerical pole groups for \(u,d,\nu\) and6 for \(e\) in
the polynomial completion. The counts use a declared visibility threshold.
A bilinear electric/current correlator has different transition poles; these
one-particle field results are not electromagnetic masses. The triangular
reference-compatible radial completion changes the field response; an isolated
degree-five hidden deformation is exactly invisible to this probe in the
executed decoupled model. Thus the observable and actual radial action matter.
If the full affine signed Dirac is already prescribed, the triangular
alternative is excluded by that stronger premise.

Detailed full matrices, spectra, source jets and 69 verified finite arrays:
[full_period_physical_report.md](final_join_work/matter/full_period_physical_report.md).

## 46. Magnetic response from the recovered Hamiltonian

In the declared pure unit-charge U1 restriction of the recovered local action,

\[
H(\zeta)=\frac{g^2}{2}\sum_\ell E_\ell^2
+\zeta b\sum_f(1-\cos F_f),\qquad b=1/g^2.
\]

The first magnetic derivative is inserted *inside* the electric evolution:

\[
\left.\partial_\zeta T\right|_0=-ab\sqrt W\int_0^1
e^{-a(1-t)H_E}\sum_f(1-\cos F_f)e^{-atH_E}\,dt\sqrt W.
\]

On the correlated six-dimensional Gauss bridge, a triangle's variance is
\(3ag^2t(1-t)\). Its exact zero-winding conditional cosine average is
\(e^{-3ag^2t(1-t)/2}\cos[\delta d_f((1-t)y+ty')]\).
For \(ag^2=\tau\delta^2\), \(\epsilon=\zeta ab\delta^2\), the leading
kernel derivative is

\[
M_1=-M_0\left[\frac56(z+z'+y^TG_E^{-1}y')+\frac52\tau\right].
\]

The bridge-variance term, source endpoints, ground-vector derivatives,
equal-time contact and temporal resolvent all remain. At \(\tau=1\),

\[
\partial_\epsilon\Gamma_\phi(0)=0.8981104241,
\qquad \partial_\epsilon\Gamma_{\phi,\omega^2}=-0.1667104965.
\]

The large-\(\tau\) derivative tends to \(-1/6\). With physical time this is
the local finite-clock actual-flux correction \(-\zeta a^2b/6\), before its
area pullback. It is not a replacement spatial Maxwell normalization. The
existing quadrature drift remains recorded; this is a first magnetic
derivative, not the interacting response at arbitrary magnetic strength.

Detailed Duhamel, source and clock equations and numerical error controls:
[magnetic_selected_response_report.md](final_join_work/photon/magnetic_selected_response_report.md).

## 47. Complete spatial gauge contact and transverse source

Differentiating the recovered shortest-loop cosine on both translated
triangle halves gives

\[
H_B''(0;q)=bM_{20}(q)^\dagger M_{20}(q),
\quad M_{20}(q)w(q)=0,\quad
w_\rho(q)=2\sin(q\cdot\rho/2).
\]

All \(13^4=28{,}561\) momenta satisfy this Ward identity, with maximum residual
\(1.16\times10^{-15}\). The original cosine's independent single-wave
variation reproduces its analytic contact to \(2.2\times10^{-16}\).
After the six massive link bands are eliminated, the declared coframe and
primitive-cell volume give the bare tensor

\[
K_B(q)=\frac{\sqrt5}{2}b(q^2I-qq^T)+O(q^4).
\]

This coefficient is differentiated from the cosine Hamiltonian, without
choosing a new Gaussian constant. Its unit-charge restriction and translated
registry remain explicit. The stabilizer selects a spatial three-plane;
static \(q_t=A_t=0\) sources supply two transverse spatial polarizations.
That geometric restriction does not itself identify the four-dimensional A4
carrier plus a transfer clock with physical3+1 spacetime.

For the full selected action, the Hamiltonian, selector, Gauss map and external
observable endpoints must be differentiated together. At moving clock one
differentiates \(aH\), not only \(H\). The bare contact and local flux inverse
covariance remain different from the full fixed-mean interacting photon1PI
tensor. The report executes 21 named checks, including magnetic/source mixed
derivatives and the full spatial Ward registry.

## 48. Exact recorded return to the critical state

Write \(x=\Delta^2\). The retained rail filter has its unique positive
complement at fixed normalization:

\[
B_+=\frac{P_3+\Delta P_5}{\sqrt{1+x}},\quad
B_-=\frac{\Delta P_3+P_5}{\sqrt{1+x}},\quad
B_+^\dagger B_++B_-^\dagger B_-=I.
\]

For \(p_n=x^n/(1+x^n)\), the recorded transitions are \(n\to n+1\) and
\(n\to n-1\), with

\[
a_n=\frac{1-p_n+xp_n}{1+x},\qquad
b_n=\frac{x(1-p_n)+p_n}{1+x}.
\]

The critical state is \(n=0\), \(\rho_c=I_8/8\). Both \(p_n\) and the
eventual hitting probability \(h_n=2p_n\) are harmonic. Starting at the
reference \(n=1\),

\[
P(\text{ever reaches critical})=1.2392055341310765\times10^{-5},
\]
\[
P(\text{critical on the first step})
=2p_*(1-p_*)=1.2391978559792981\times10^{-5}.
\]

Conditioned on eventual hit, the walk has inward probability \(1/(1+x)\)
and outward probability \(x/(1+x)\). Its exact mean and variance are

\[\mathbb E[N\mid\text{hit}]=\frac{n(1+x)}{1-x},\quad
\operatorname{Var}(N\mid\text{hit})=\frac{4nx(1+x)}{(1-x)^3}.
\]

The reference conditional mean is \(1.0000123922089061\) filter steps.
The complete ballot first-passage law is supplied. Unconditional hitting time
has infinite expectation because there is a positive probability of never
reaching critical. Deleting the outcome record leaves every diagonal rail
population fixed and damps coherence by \(2\Delta/(1+x)\); it does not reset
the state. The entropy change is accounted for by the recorded outcome
information. Repeated formulas use fixed or correspondingly transported rails.

Detailed instrument, first-passage and entropy proofs with 20 named checks:
[rail_transition_report.md](final_join_work/critical/rail_transition_report.md).

## 49. Finite critical geometry and the causal datum

Use the retained \(R^2=\phi+2\), fixed \(V_0=4\pi R^3/3\) and
\(u_c=\sqrt{H_*/\ln2}=0.010776438344805\).
For a round positive-curvature ball, set \(y=\sqrt K\,r\), \(k=KR^2\).
The exact fixed-volume and area equations are

\[
k(y)=\left[\frac32(y-\sin y\cos y)\right]^{2/3},
\quad u(y)=\frac{\sin^2y}{k(y)}.
\]

The area branch decreases strictly before the cut locus, so the critical
root is unique:

\[
y_c=2.96672739128,\quad K_c=0.776297302715,
\quad r_c=3.36715883089.
\]

It lies beyond the hemisphere and encloses 99.8872% of the complete
three-sphere. Its areal radius is \(0.197457641557\). Its metric and curvature
are finite, even though the inverse-entropy population chart has a singular
derivative there. A convex small-ball branch cannot reach this endpoint under
the retained law; the small-diamond entropy argument needs a new justification
before it can be applied to this large ball.

The same intrinsic critical slice admits exact Lorentzian FLRW comparison
metrics \(a(t)=e^{H_0t}\). With
\(j_c=\sqrt{K_c}\cot y_c=-4.98714550184\), their null expansions are

\[
\theta_\pm(t)=2[H_0\pm j_c/a(t)].
\]

| Extrinsic datum | Future null expansions at the critical slice | Class |
|---|---|---|
| \(H_0=0\) | \((-9.974291,+9.974291)\) | Untrapped |
| \(H_0=-2|j_c|\) | \((-29.922873,-9.974291)\) | Future trapped |
| \(H_0=+2|j_c|\) | \((+9.974291,+29.922873)\) | Past trapped |

Their calculated perfect-fluid Einstein sources satisfy conservation, the
ADM constraint and the null energy condition with symbolic positive Newton
coefficient. These are explicit completions, not predicted cosmologies. The
Hamiltonian constraint fixes \(H_0^2\) once density is supplied; its sign
distinguishes contraction and expansion. Intrinsic entropy and area alone
cannot fix causal trapping.

Recorded critical-to-reference selection has the conditional area ratio
\(A_*/A_c=92.7950374701\). The instantaneous critical round heat root is
\(B=I\), whereas the fixed two-outcome instrument above has nontrivial filters.
Identifying these two processes requires an actual dynamical loading law.
Neither the area ratio nor a rare recorded return proves a spacetime bounce.

Detailed finite root, explicit stresses and 36 named checks:
[critical_round_flrw_report.md](final_join_work/causal/critical_round_flrw_report.md).

## 50. Audited governing continuation and reproduction

The independent reviewer checks 30 analytic/cache identities across all six
sectors, including source types, scalar units, Schur signs, gauge quartics,
magnetic bridge normalization, hitting laws and causal expansions. Direct
assertions and finite-array checks supplement the named checks; they are not
counted as independent empirical tests. No new computation fits measured
parameters.

The current governing candidate now contains explicit conserved metric and
scalar equations, an all-order gauge-covariant source completion, a positive
full-period matter realization with full hidden frequency contacts, actual
magnetic/spatial derivatives, and an exact critical-state stochastic law.
Each physical identification is stated at its point of use. These conditional
completions do not determine the still unevaluated canonical coupled charged
poles, full interacting massless photon1PI residue and universal metric
simple-pole residue. Calling the candidate an established theory of nature
requires deriving those observables from the same canonical action and testing
its predictions; passing finite construction checks cannot establish that.

Run `python3 run_final_joins.py` to validate executed records, source hashes,
scripts and every stored operator array without repeating large quadrature.
Sector scripts reproduce their declared computations. The overview is appended
as sections43–50 of the continued report and integrated into the governing
specification and main reconstruction. The complete source archive retains
recovered excerpts and full available saved texts; it does not claim to have
read100 complete transcripts.

Independent review:
[final_join_review.md](final_join_work/review/final_join_review.md).

## 51. The actual signed chronology exchanges the rails

Let \(P_3,P_5\) be the actual rank-four projectors and \(U\) the retained signed eight-state transport. Direct calculation gives

\[
UP_3U^\dagger=P_5,\qquad UP_5U^\dagger=P_3,\qquad
U^6=-I,\qquad U^{12}=I.
\]

Thus a repeated fixed-rail filter cannot be analysed by assuming it commutes with transport. For the complete recorded instrument,

\[
B_+=\frac{P_3+\Delta P_5}{\sqrt{1+\Delta^2}},\quad
B_-=\frac{\Delta P_3+P_5}{\sqrt{1+\Delta^2}},\quad K_\pm=UB_\pm,
\]

encode a plus record as \(s_k=0\) and a minus record as \(s_k=1\). Set

\[
m=\sum_{k=1}^n [s_k\mathbin{\mathrm{xor}}((k-1)\bmod2)].
\]

The exact word and its probability on an arbitrary input are

\[
K_{\boldsymbol s}
=\frac{U^n(\Delta^mP_3+\Delta^{n-m}P_5)}
{(1+\Delta^2)^{n/2}},\qquad
p_{\boldsymbol s}=\frac{\Delta^{2m}p_3+
\Delta^{2(n-m)}p_5}{(1+\Delta^2)^n}.
\]

Here \(p_j=\operatorname{Tr}P_j\rho\). All 4096 twelve-step records were checked using exact rail support; floating point leakage is excluded from the rare-event calculation. They form thirteen classes of multiplicity \(\binom{12}{m}\).

The 924 balanced records with \(m=6\) are scalar multiples of the identity transport. They return every input, rather than prepare the critical state from every input. Their combined probability is \(5.228004073915396\times10^{-29}\). Critical preparation requires an initially isotropic incoherent rail state proportional to

\[
\Delta^{-2m}P_3+\Delta^{-2(n-m)}P_5.
\]

For the retained reference state, critical preparation requires \(m=(n+1)/2\). No even twelve-step record prepares it. The one-step minus record does prepare it with probability \(1.2391978559792968\times10^{-5}\).

The unrecorded channel has the exact form

\[
\Phi^n=\operatorname{Ad}_{U^n}
\left(\mathcal D+g^n\mathcal O\right),\qquad
g=\frac{2\Delta}{1+\Delta^2}.
\]

\(\mathcal D\) keeps rail-diagonal blocks and \(\mathcal O\) keeps cross-rail blocks. The populations exchange, while coherence decays. Its one-step fixed algebra is \(M_2\oplus\mathbb C\oplus\mathbb C\), dimension six. Its six-step and twelve-step fixed algebra is \(M_4\oplus M_4\), dimension 32. The critical state is stationary, but is not a unique attractor. The external metaplectic transport remains a distinct, nonperiodic operation.

## 52. A positive co-moving subdivision repairs the endpoint

Keep the raw absolute transfer \(T_\star=e^{-\eta L}\), with \(L=3P_3+5P_5\), and its positive amplitude \(B_\star=e^{-\eta L/2}\). Under the additional premises of a fixed endpoint, twelve equal positive subdivisions, and co-moving covariance, the root is unique:

\[
R=B_\star^{1/12}=e^{-\eta L/24},\qquad
B_k=U^kRU^{-k},\qquad C_k=UB_k.
\]

Then

\[
M_{12}=C_{11}\cdots C_0=U^{12}R^{12}=B_\star,\qquad
M_{12}^\dagger M_{12}=T_\star.
\]

The endpoint residual is \(3.82\times10^{-14}\); noncommuting first and second source jets also agree to below \(10^{-12}\). Keeping the root on fixed rails instead gives \((UR)^{12}=\Delta^2I\). Transporting twelve full, unsubdivided amplitudes gives \(B_\star^{12}\). These are different operations.

Starting from the critical state, the transported cumulative depth after \(n\) steps is \(n\eta/12\). The reference depth occurs at the endpoint. This is an explicit conditional chronology; the equal-load premise is not silently attributed to a recovered canonical history.

Normalizing each root by its own partition function changes the absolute action while preserving the final normalized state. For the supplied reference, raw \(\Gamma=16.60109340305715\), while step normalization gives \(19.010632795983216\). The difference is \(12\log Z(\eta/12)\). These identity terms and their derivatives belong in vacuum and scalar variations.

Independent time sources in \(M^\dagger M\) produce a palindromic sequence of 24 half steps. Endpoint equality does not identify that sequence with an ordinary twelve-time correlator.

## 53. The compact electromagnetic chart is fixed by the charge carrier

The parent generator is

\[
Q_5=\operatorname{diag}(-1/3,-1/3,-1/3,1,0)=Y+W_3.
\]

Its electromagnetic phase, normalized so that the electron has charge \(-1\), has pure period \(6\pi\) on the full parent, physical sixteen-state carrier and conjugate 96-state carrier. A \(2\pi\) rotation closes on the lepton restriction. On the full quark carrier it closes only after the compensating color-center action:

\[
e^{2\pi iQ}=R(z^{-1}I_3),\qquad z=e^{2\pi i/3}.
\]

The primitive \(U(1)\) generator is \(3Q\), with period \(2\pi\). The unbroken group is \((SU(3)\times U(1)_{3Q})/\mathbb Z_3\). The full electroweak/color quotient has its \(\mathbb Z_6\) kernel. All carrier phases and charge multiplicities were checked explicitly.

For the same Wilson operator,

\[
e^{iQ\alpha}=e^{i(3Q)\beta},\qquad \alpha=3\beta.
\]

Therefore the source window scales by three and the quadratic coefficient by nine when passing from the electron chart to the primitive chart. Hypercharge has the corresponding factor six in angle and 36 in coefficient. This fixes a source-coordinate ambiguity; it does not supply the common dynamical kinetic coefficient.

The actual parent, physical sixteen-state and conjugate 96-state traces are

\[
\operatorname{Tr}_5Q^2=4/3,\qquad
\operatorname{Tr}_{16}Q^2=16/3,\qquad
\operatorname{Tr}_{96}Q^2=32.
\]

If a continuum action is declared as \(C_{\mathrm{cont},n}\operatorname{Tr}_nF^2/4\), matching the same electromagnetic action requires

\[
C_{\mathrm{cont},5}=4C_{\mathrm{cont},16}
=24C_{\mathrm{cont},96},\qquad
e^2=(C_{\mathrm{cont},n}\operatorname{Tr}_nQ^2)^{-1}.
\]

The word continuum matters. For the declared four-dimensional triangle registry, \(A^\dagger A=5I_6/4\) and primitive cell volume is \(\sqrt5\). Ten local triangles give \(C_{\mathrm{cont}}=(\sqrt5/4)C_{\mathrm{loop}}\); both translated halves give \((\sqrt5/2)C_{\mathrm{loop}}\). A physical time/space split is a further source datum.

Pure gauge-orbit second variations cancel against their source contacts. A separate electron-normalized Wilson-ring witness has a nonzero flux Hessian. The compact quotient thus fixes the chart without mistaking an orbit curvature for a photon kinetic coefficient.

## 54. One reference state fixes the mixed entropy contact

In the conditional unital forty-state tensor source, let

\[
\bar K_0=\operatorname{diag}(3I_{20},5I_{20}),\qquad
K(\eta,F)=\eta(\bar K_0+V_F),\qquad
\rho_{\eta,F}=e^{-K}/\operatorname{Tr}e^{-K}.
\]

The gauge perturbation is the retained off-diagonal tensor loading, with \(X_{20}=I_4\otimes\sqrt5F_5\) and \(V_F=\mathrm{offdiag}(X_{20})/\sqrt2\). Hold one physical reference \(\rho_\star=\rho_{\eta_\star,0}\) fixed. The exact identity is

\[
D(\rho_{\eta,F}\Vert\rho_\star)
=D(\rho_{\eta,0}\Vert\rho_\star)
+D(\rho_{\eta,F}\Vert\rho_{\eta,0})
+(\eta_\star-\eta)
\operatorname{Tr}[(\rho_{\eta,F}-\rho_{\eta,0})\bar K_0].
\]

The last term is the required mixed scalar/gauge contact. Moving the gauge reference along with \(\eta\) omits it.

Write \(h=\tanh\eta\), \(s=\operatorname{sech}^2\eta\), and \(m_j=\operatorname{Tr}_5F^j\). For source amplitude \(t\),

\[
\log Z(\eta,tF)-\log Z(\eta,0)=a_2t^2+a_4t^4+O(t^6),
\]
\[
a_2=\frac{\eta h m_2}{4},\qquad
a_4=\frac{\eta^2}{32}
\left[5(1-h/\eta)m_4-h^2m_2^2\right].
\]

The moving-reference relative entropy has coefficients \(a_2,3a_4\). The fixed-reference coefficients are

\[
D_2=a_2+(\eta_\star-\eta)(2a_2/\eta-a_2'),\qquad
D_4=3a_4+(\eta_\star-\eta)(4a_4/\eta-a_4').
\]

For the actual \(Q_5\), \(m_2=4/3\), \(m_4=28/27\). At the retained reference,

\[
D=1.99857456216028\,t^2+8.56945851529208\,t^4+O(t^6).
\]

The fixed-reference entropy-depth derivative of the quadratic coefficient is \(5.36642048887385\times10^{-5}\), whereas the moving-reference derivative is \(0.180591045620974\). The difference follows from the mixed contact, not a new normalization. Independent 80-digit trace expansions verify both coefficients and their mixed derivatives.

The information cost, the raw partition action and a physical photon 1PI action remain distinct quantities. In this unital loading, the critical \(\eta=0\) source gives a maximally mixed state and vanishing source curvature. This statement is specific to that loading.

## 55. Temporal responses distinguish density, generator and source placement

For the executed sixteen-dimensional real cross-rail source chart, the bare density-tangent BKM coefficient is \(\chi=8\eta/\tanh\eta\); its inverse is the static Kubo–Mori generator response. The complex cross-rail carrier has real dimension 32 and requires its own dagger and cross-quadrature source contacts. Multiplying the generator source by \(\eta\) multiplies its response by \(\eta^2\). At the retained raw rail reference these are

\[
\chi=47.9669783034,\qquad
\chi^{-1}=0.0208476755337,\qquad
\eta^2\chi^{-1}=0.749465460810.
\]

These are source-conversion identities, rather than three competing electromagnetic couplings.

For \(N\) ordinary time slices and the normalized cross-rail source, the static generator response is

\[
C_{\mathrm{gen}}(0)=\frac{\tanh(N\eta)}{8\eta}.
\]

A seam pulse instead gives \(\coth\eta\,\tanh(N\eta)/8\). Independently varied symmetric slice tilts have that same static sum, but their Fourier response is multiplied by \(\cos^2(\omega/2)\). The latter source family has a null Nyquist mode when that mode is present; an ordinary inverse there is undefined. The time-dependent responses retain their own equal-time second contacts, so neither placement can be substituted for a generator insertion.

With a separately declared physical clock \(a\), the continuous generator \(H=\bar K_0\eta/a\) gives

\[
C_{\mathrm{phys}}(\Omega)=
\frac{\tanh(N\eta)(2\eta/a)}
{4[(2\eta/a)^2+\Omega^2]}I_{16}.
\]

Its inverse coefficient of \(\Omega^2\) is \(2a/[\eta\tanh(N\eta)]\). A piecewise-constant bin source gives \(2a\coth\eta/\tanh(N\eta)\); refining the bins recovers the continuous limit. The factor \(a\) has not been assigned an observed value.

The repaired twelve-source palindromic transfer and an ordinary twelve-slice transfer have the same summed static endpoint susceptibility. Their complete time Hessians differ: the recorded norm difference is \(0.00113209\). Both have independently verified nonuniform-source and equal-time contacts. The naive fixed-frame product \((UB_\star)^{12}\) instead has a flat endpoint state and a uniform sixteen-source Hessian of rank two. Step-normalizing the repaired fractions changes its absolute static Hessian to \(0.0112192298065\), despite preserving its normalized endpoint.

Thus the endpoint repair closes a finite chronological equation and supplies its actual time response. It does not identify the modular source response with a spacetime photon residue.

## 56. The full-period Fock realization yields bilinear current transitions

For the previously declared positive 768-state period graph, use \(H=d\Gamma(L/a)\). All four species and all six uniform interspecies number-bilinear probes are retained. Set \(x=\beta/a\), \(z=a\omega\), and

\[
J_{fg}=c_f^\dagger I_{768}c_g+\mathrm{h.c.}
\]

These probes test that realization; they are not claimed to be the recovered electromagnetic or weak vertices. No finite occupation, chemical potential or physical temperature is selected.

For a one-particle source \(h+sJ+s^2W/2\), define

\[
\Gamma=-\operatorname{Tr}\log(1+e^{-x(h+sJ+s^2W/2)}),\qquad
n_i=(1+e^{x\lambda_i})^{-1},
\]
\[
D_{ij}=\frac{n_i-n_j}{\lambda_j-\lambda_i},\qquad
D_{ii}=xn_i(1-n_i).
\]

The static action Hessian and retarded response, with \(+sJ/a\) and the \(-i\theta\) commutator convention, are

\[
\Gamma''=x\operatorname{Tr}(nW)
-x\sum_{ij}D_{ij}|J_{ij}|^2,\qquad
\chi_R(z)=\sum_{ij}
\frac{(n_i-n_j)|J_{ij}|^2}{z+\lambda_i-\lambda_j}.
\]

The Euclidean covariance continues to \(-\chi_R\). Positive-frequency spectral weight is nonnegative, KMS detailed balance is exact, and the energy-weighted sum equals the independent double-commutator trace. Degenerate projector weights are basis independent.

The 696-state common complement contributes only to the zero Matsubara response for these probes; the retained 72 generation states supply their finite-frequency transitions. At the numerical witness \(x=2\), that common static covariance is \(240.2440448923643\). This is a witness value, not a measured thermal input.

The conserved total number has zero retarded response and a nonzero static variance \(266.463232598\) at the same witness. The empty positive Fock vacuum has zero response to number-conserving bilinears. Pair-creating currents have sum-energy poles; their vertex is not inserted without a canonical source. Exact source-orbit contacts cancel, and independent eight-state CAR/Fock calculations verify signs and normalizations.

This derivation resolves the distinction between field poles and current poles in the declared period realization. Its actual charged physical vertex and filled or relativistic state must still come from the same canonical action.

## 57. The common metric action fixes separate tensor and scalar residues

For the declared common Jordan action

\[
I=\int\sqrt{-g}\left[
\frac12F(\sigma)R-\frac12Z(\sigma)(\nabla\sigma)^2-V(\sigma)
\right]+I_m[g,\sigma],
\]

use the same metric source \(h_{\mu\nu}T^{\mu\nu}/2\) in every matter sector. At a stationary reference set

\[
a_F=F_1/F_0,\qquad
\mathcal K=Z_0+\frac{3F_1^2}{2F_0}.
\]

For an exactly flat stationary vacuum, the conserved-source inverse is

\[
D_{hh}=\frac4{F_0p^2}(P_2-\tfrac12P_{0s})
+\frac{3a_F^2}{\mathcal K(p^2+m^2)}P_{0s}.
\]

For direct scalar sources \(J_A\), its saturated exchange is

\[
\mathcal A=
\frac{T_1^{\mu\nu}T_{2,\mu\nu}-T_1T_2/2}{F_0p^2}
+\frac{(J_1-a_FT_1/2)(J_2-a_FT_2/2)}
{\mathcal K(p^2+m^2)}.
\]

The tensor residue is \(4P_2/F_0\). The scalar residue of \(\delta\sigma\) is \(1/\mathcal K\). The constrained Einstein trace term is not an additional propagating ghost.

For the entropy branch, \(F_1/F_0=-3/2\), \(F_2/F_0=9/4\). A stationary constant-field Einstein background requires \(V_1+3V_0=0\), and

\[
\mathcal K=Z_0+27F_0/8,\qquad
m^2=(V_2-9V_0)/\mathcal K.
\]

For metric-only nonrelativistic sources, the local flat Yukawa strength relative to the tensor force is

\[
\epsilon=\frac{F_1^2}{2F_0\mathcal K}.
\]

The minimal Jordan completion \(Z_0=0\) gives \(\epsilon=1/3\), not a disappearance of the scalar. A varying mass adds its own scalar charge. Independent scalar fields give the matrix resolvent \((p^2\mathcal K_{IJ}+U_{IJ})^{-1}\); exact 7-by-7 and 8-by-8 inversions verify the one-field and mixed-field formulas.

On a curved stationary Einstein background, the tensor operator is \(\Delta_L-2\Lambda_0\), rather than flat \(p^2\). Flat Yukawa expressions describe only its local limit. The constant-G reference route retains its separate Einstein response when physical variations hold \(F\) fixed.

The unshifted canonical bare breathing potential has \(W_{\min}=-0.25928083813026015\). Under the optional breathing/depth dictionary, a bare-only \(V=\nu(\sigma)W_b\) at the bare minimum satisfies scalar stationarity only if \(\nu_1=-3\nu_0\). Constant density fails that equation. Keeping the actual potential zero exposes this constraint; subtracting the minimum would hide it.

If that additional stationarity condition is supplied, its optional pole is

\[
m_\star^2=
\frac{0.3889212571953903\,\nu_0+
(\nu_2-9\nu_0)W_{\min}}
{Z_b b_0^2/16+27F_\star/8}.
\]

The sector report also derives the separate constant-density bare-only AdS solution \(b_\dagger^2=4b_0^2/3\) and its positive scalar mass numerator. Neither restricted example reselects the retained full vacuum. The full trace already includes the onsite potential; adding it again would double count.

## 58. The magnetic harmonic restriction can be summed beyond first insertion

The correlated compact-cosine sector admits a controlled narrow-phase harmonic restriction. Its magnetic quadratic form is

\[
H_B=\frac b2x^\dagger D^\dagger Dx,\qquad D^\dagger D=5G_E^{-1}.
\]

Combining it with the retained electric diffusion yields the exact six-dimensional Mehler kernel for that restriction. The oscillator parameter is

\[
\omega=a\sqrt{5bg^2}.
\]

Under the canonical bare relation \(b=1/g^2\), this reduces to \(\sqrt5a\) in the declared graph units. No alpha value or new physical clock is inferred.

Writing \(z=y^TG_E^{-1}y\), \(z'=y'^TG_E^{-1}y'\), and \(c=y^TG_E^{-1}y'\), the kernel after extracting the free heat prefactor is

\[
M_{\tau,\omega}=
\left(\frac{\omega}{\sinh\omega}\right)^3
\exp\left[
-\frac{\omega[(z+z')\cosh\omega-2c]}
{2\tau\sinh\omega}\right].
\]

The free heat prefactor, Haar/chart Jacobian and selector measure remain in the actual transfer; this kernel describes imaginary-time evolution. Its small-\(\omega\) expansion includes the oscillator prefactor and reproduces the preceding first magnetic insertion, since \(\omega^2=5\tau\epsilon\) for \(\epsilon=ab\delta^2\) and \(\tau=ag^2/\delta^2\). The full correlated hat selector is retained in the finite integration.

The executed 4437-node witness at \(\tau=1,\omega=1\) gives a dimensionless seam static inverse of \(5.37580296634\), a seam frequency-squared coefficient of \(0.170212126802\), and a symmetric-slice frequency-squared coefficient of \(1.51416286839\). These scalar coefficients use the chart \(F/\delta\). The final two-resolution drift is about 0.2–0.6% over the executed witnesses; the full tensor isotropy residual is reported separately. The independent small-parameter derivatives reproduce the prior magnetic insertion within \(8\times10^{-9}\) relative error.

For the zero-winding kernel, positivity and the free-bridge fourth moment give the analytic bound

\[
0\le K_{\cos}-K_{\mathrm{harm}}
\le\frac{10\epsilon\delta^2}{24}
\left(1+\frac92\tau+\frac{27}{16}\tau^2\right)K_{\mathrm{free}}.
\]

At the witness above, its relative-to-free kernel bound is \(1.88487944\times10^{-7}\). The associated static-response bound uses the finite Nyström spectral gap; quadrature refinement is a separate error and the continuum gap is not thereby certified. The accompanying sector report retains the physical clock factors and these approximation scopes. The harmonic sum supplies a controlled magnetic restriction.

## 59. Audit and common-action matching

The finite derivations are executable, their source hashes and frozen input revisions are retained, and their operator arrays are checked for finite entries. Independent audits verify compact source scaling, chronological rail algebra, relative-entropy contacts, finite-temperature signs, temporal contact terms and metric/scalar inverse residues.

The calculations now impose concrete simultaneous matching equations: the co-moving temporal response must match the canonical transfer; the charge-normalized compact Wilson source must be the charged matter vertex; the same selected action must give its temporal/spatial photon Hessian; and its scalar/coframe vacuum and source Hessian must provide the tensor and scalar residues together. Each constructed response above supplies one explicit side of those equations.

Neither finite matrix agreement nor an inserted action completion establishes that these identifications have occurred. In particular, endpoint equality alone, charge normalization alone, or a bare potential minimum alone is insufficient. This continuation closes the stated conditional calculations and keeps their exact results available for the coupled theory derivation.

## 60. Recovering the literal Clifford and generation source

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

## 61. Deriving the exact action from the same transfer

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

## 62. Exact translated photon bands, Gauss kernel and time sources

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

## 63. Literal Wilson currents, mixed Higgs contacts and hidden elimination

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

## 64. Deriving the physical charged observable

On the primitive compact charge chart q=3Q, the global factor of the Gauss projector gives

\[
P_G\psi_qP_G=0\quad(q\ne0),\qquad
\sum_xG_x=-Q_{\rm total}.
\]

Qtotal includes all charged fields. Thus the bare charged two-point expression between projected transfer factors vanishes for 0<n<N. A charged mass calculation must specify the physical dressing, boundary or traversed charge sector. A Wilson path on a periodic graph has opposite endpoint charges; with its matter endpoints it defines a neutral pair, whose threshold is not automatically a single-fermion mass.

Exact charge-sector counting on the retained finite Q96 fermion Fock carrier gives a zero-electromagnetic-charge subspace of dimension 3,707,108,065,942,376,914,189,459,456. Other charged fields can compensate a nonzero fermion charge, so that dimension is not a necessary factor of the full Gauss space. The actual CAR witness and A4 incidence/path calculation verify the selection rule without assigning any extra dynamics.

An isolated physical pole is the correct criterion for a stable isolated relativistic particle. In a massless-photon continuum, a charged excitation may instead be an infraparticle with a spectral edge. The correct mass test then uses a justified dressed threshold or inclusive prescription and the regulator limit. A mandatory simple charged pole would be a false QED criterion.

Proof, regulator scope and primary sources: [charged observable dictionary](common_action_work/gauss/charged_observable_dictionary.md).

## 65. Actual coframe contacts and the retained Einstein interface

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

## 66. The common physical identification now has explicit equations

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

## 67. The recovered conserved four dimensional leaf

The original manifold reference and complete September v116 checkpoint give

\[
\dot b=0,\qquad I_b=\operatorname{pr}_{\mathcal B},\qquad I_b\circ F=I_b,
\]

\[
M_{b_0}=S^1_\theta\times\mathbb R^+_\chi\times S^1_\vartheta
\times\mathbb R_\tau\times\{b_0\}\cong T^2\times\mathbb R^2.
\]

Thus the source-designated base leaf has dimension four. When the independent label space has dimension one, the ambient base has dimension five. The literal labels are phase/frequency, amplitude/scale, coupling/orientation, cascade/progression and boundary parameter. The conserved boundary label is distinct from a breathing radius also named b, an internal retained projector, an A4 graph height and a complete history state advanced by a shift.

The historical affine map is

\[
F(u,x,\tau,b)=(u+\log\kappa,Ax+\Omega,\tau+1,b),\qquad
A=\begin{pmatrix}2&1\\1&1\end{pmatrix},\quad \kappa=\pi/e.
\]

Its boundary first integral remains valid. Its toral Anosov matrix belongs to the historical branch: eigenvalues \(\phi^{\pm2}\) cannot be the unit-modulus eigenvalues of the corrected October simultaneous rotations. The additional invariant \(u-\tau\log\kappa\) is an extra constraint if fixed; it does not replace the independent boundary label.

For an admitted nonlinear map, conservation of the entire label is the concrete condition \(F^b(y,b)=b\). Preservation of a single chosen leaf only requires \(F^b(y,b_0)=b_0\) on that leaf. These statements do not determine a laboratory time from a dimension count.

The [recovery proof](leaf_geometry_work/recovery/leaf_boundary_recovery_report.md) retains the original text and image bytes, the corrected current specification and the independently checked source identities. The [original image](leaf_geometry_work/recovery/URT_5D_Manifold_Reference.png) has SHA-256 `29b1062179c720734675d64e36114bd973279b59053d395b5f4c37b98b0f779f`.

## 68. A symplectic chart compatible with the corrected transport

Set \(\ell_\kappa=\log\kappa\), \(\alpha=2\pi/\phi^2\), \(u=\log\chi\), and \(e_\gamma=(\cos\gamma,\sin\gamma)\). The explicit dimensionless chart

\[
\Phi(\theta,\chi,\vartheta,\tau,b)
=(q=\chi e_\theta,\ p=\kappa^{-\tau}e_\vartheta,\ b)
\]

is a global diffeomorphism on each fixed leaf onto
\((\mathbb R^2\setminus\{0\})_q\times(\mathbb R^2\setminus\{0\})_p\).
Its inverse uses \(\chi=|q|\), the two circle angles and \(\tau=-\log|p|/\ell_\kappa\). A momentum reference radius would only change its coordinate unit. This constructed phase-space chart does not assign physical momentum or interpret \(\tau\) as laboratory time.

For \(\delta=\vartheta-\theta\), \(\rho=\chi\kappa^{-\tau}\), the pulled forms are

\[
\lambda=p\cdot dq=\rho(\cos\delta\,du+\sin\delta\,d\theta),
\qquad\omega=-d\lambda,
\]

\[
\omega=\rho\left[
\cos\delta(d\theta\wedge d\vartheta-\ell_\kappa du\wedge d\tau)
-\sin\delta(du\wedge d\vartheta+\ell_\kappa d\theta\wedge d\tau)
\right],
\]

\[
\frac{\omega\wedge\omega}{2}
=\ell_\kappa\rho^2\,d\theta\wedge du\wedge d\vartheta\wedge d\tau\ne0.
\]

Extending its canonical Poisson tensor by zero in the boundary direction gives rank four and \(\Pi\,db=0\). Every Hamiltonian flow of this compatible tensor preserves the label, including a Hamiltonian depending parametrically on b. A dissipative part retains it when its mobility likewise annihilates \(db\).

The corrected external map pulls back exactly to

\[
(\theta,\chi,\vartheta,\tau,b)
\mapsto(\theta+\alpha,\kappa\chi,\vartheta+\alpha,\tau+1,b).
\]

It conserves

\[
D=q\cdot p=\rho\cos\delta,\quad
L=q_1p_2-q_2p_1=\rho\sin\delta,\quad\{D,L\}=0,
\]

and has dimensionless Hamiltonian interpolation \(H_{\rm ext}=\ell_\kappa D+\alpha L\). Its vector field in the leaf chart is \((\alpha,\ell_\kappa,\alpha,1)\). Its metaplectic lift can be written

\[
(U\psi)(q)=\kappa^{-1}\psi(\kappa^{-1}R_\alpha^Tq),
\qquad U^\dagger(\hat q,\hat p)U=S_{\rm ext}(\hat q,\hat p),
\]

up to its sheet sign. The Weyl dilation generator \(-i\hbar(q\cdot\nabla+1)\) has spectrum of both signs; this unitary generator is kept separate from the positive heat Hamiltonian. Every invariant real quadratic is a linear combination of D and L, so an invariant positive oscillator energy is not supplied by this hyperbolic transport.

For a regular nonlinear map conserving both D and L, the local form is \(Q=e^\sigma R_\beta q\), \(P=e^{-\sigma}R_\beta p\). Symplecticity adds the exact condition

\[
dD\wedge d\sigma+dL\wedge d\beta=0.
\]

Locally on a fixed leaf, \(\sigma=h_D\), \(\beta=h_L\). Conserving D and L alone does not supply that condition. The [independent algebra proof](leaf_geometry_work/recovery/algebra/urt_external_invariant_algebra.md) also separates global spiral-quotient circle invariants from a lifted real angle expression and from the independent boundary label.

## 69. The conserved positive transfer on each leaf

Represent a continuous boundary label by

\[
\mathscr H=\int^\oplus\mathscr H_b\,d\mu(b).
\]

When the local Hamiltonian entries act on field and graph variables within each boundary sector, they form a measurable self-adjoint family \(H_b\). Let the repaired selector \(W_{\delta,b}\) and Gauss constraint \(P_{G,b}\) be fibre operators too. With the required lower bound and heat domains,

\[
B_b=e^{-aH_b/2}W_{\delta,b}^{1/2}P_{G,b},\qquad
T_b=B_b^\dagger B_b
=P_{G,b}W_{\delta,b}^{1/2}e^{-aH_b}W_{\delta,b}^{1/2}P_{G,b}\ge0.
\]

This closes conserved-sector positivity in the typed registry with the same transfer step a. It needs no extra entry coefficient. Admitted sources that remain decomposable preserve it. Equivalently, bounded factors commute with all label multiplication projections; unbounded Hamiltonians strongly commute with that algebra, including their spectral and domain conditions.

For a non-atomic \(\mu\), the singleton multiplication projector \(\mathbf1_{\{b_0\}}\) is zero. A single leaf is a fibre/superselection sector, rather than a nonzero orthogonal projection onto that singleton in the full direct integral. Choosing an exceptional fibre additionally requires a stated representative or continuity prescription. This qualification preserves the recovered leaf and makes its operator restriction precise.

Internal history projections obey separate tests. For any bounded B and orthogonal P,

\[
PB^\dagger BP=(PBP)^\dagger(PBP)+(QBP)^\dagger(QBP),\quad Q=I-P.
\]

Positive compression is automatic; equality with the compressed-factor Gram requires \(QBP=0\). Reduction of the transfer does not require an independently chosen polar unitary to reduce. For a moving frame the leakage test is \((I-P_{k+1})B_kP_k=0\). The literal internal signed \(U_{64}\) leaks out of a fixed retained \(P_{13}\), while \(P_k=U_{64}^kP_{13}U_{64}^{-k}\) is transported exactly and returns after twelve phases. Neither statement substitutes an internal carrier frame for the base boundary leaf.

The [compression proof](leaf_geometry_work/review/leaf_compression_lemma.md) and [normal-memory proof](leaf_geometry_work/review/normal_memory_source_report.md) retain the source contacts and strong-commutation requirements. Internal normal memory can remain entirely inside a conserved b-fibre.

## 70. Exact A4 slicing with crossing interactions retained

On the integral A4 lattice \(\sum_{i=0}^4n_i=0\), choose height \(h=n_4\). A unimodular adapted basis is \((e_0-e_3,e_1-e_3,e_2-e_3,e_4-e_3)\). Height slices are A3 lattices: six spatial root links and eight translated spatial triangles. Four links and twelve translated triangle types cross slices. The spatial cell volume is 2 and the normal spacing is \(\sqrt5/2\), whose product is the A4 volume \(\sqrt5\).

This height is a coordinate of the four-coordinate graph, conditional on its embedding within the fixed-b base leaf. It is not the conserved boundary label. The old staggered square/triangle reflection construction is retained in its own action; its time reconstruction is not automatically inherited by this root-height foliation.

For the induced eight-triangle spatial action,

\[
\operatorname{spec}K_{A_3}
=\{0,(4-|S_4|)\times2,(4+|S_4|)\times2,8\},\quad
S_4=1+\sum_{\mu=0}^2e^{iq_\mu}.
\]

All \(13^3=2197\) modes obey the formula. At zero momentum rank is three; at all 2196 nonzero modes rank is five. Freezing crossing links in the full action instead gives exactly

\[
K_{ss}^{\rm full}=K_{A_3}+2I_6.
\]

Its pure spatial gauge gradient acquires energy, with maximum lattice Ward norm 7.99916. The literal full-face hat weight restricted by freezing crossing links similarly includes extra link hats: a checked pure gauge has induced spatial weight 1 but frozen full weight about \(4.06\times10^{-18}\). Deleting crossing faces defines a different induced action; freezing their links is not an inherited gauge-invariant restriction.

Honest static crossing Schur elimination restores the Ward null. The crossing block itself has a gapless band \(4-|S_4|\), so a uniform fast-normal approximation cannot be inferred from the root labels. The complete one-slice Gaussian source marginal retains all \(13^4=28561\) bulk modes. With \(P_s\) extracting six spatial links and \(M_8\) their spatial curl matrix,

\[
C_{\rm slice}(q)=\frac1{13}\sum_{p_h}P_sK_{\rm full}(q,p_h)^+P_s^\dagger,
\quad C_{\rm face}=M_8C_{\rm slice}M_8^\dagger,
\]

\[
K_{\rm leaf}=M_8^\dagger C_{\rm face}^+M_8.
\]

Gauge nulls and global flat modes use the stated Gaussian quotient. At external squared frequency t, the full inverse is first evaluated as \((K_{\rm full}+tI)^{-1}\) on that physical quotient. If \(C_{\rm face}(t)=C_0-tC_2+O(t^2)\), then on the common source support

\[
\partial_tK_{\rm leaf}(0)=M_8^\dagger C_0^+C_2C_0^+M_8.
\]

The complete marginal has maximum Ward error \(5.20\times10^{-15}\). At spatial integer mode (1,0,0), its transverse static coefficient divided by \(|q|^2\) is 5.40307 and its external-clock coefficient is 5.66940; the induced action instead gives 0.986665 and 1.99035. Independent finite-frequency differences verify the marginal clock derivative to relative errors below \(1.11\times10^{-10}\). Thus integration, freezing and action deletion are quantitatively different operations.

The induced A3 action has leading magnetic coefficient 1 and external-clock electric coefficient 2 per spatial volume, giving inherited \(c_\gamma^2=1/2\). Decomposing the full four-dimensional Euclidean face action by geometric height instead gives equal electric and magnetic coefficients \(\sqrt5/2\). The latter is a geometric-time candidate; a positive time transfer along that coordinate requires its own reconstruction. The [complete slicing calculation](leaf_geometry_work/gauge/a3_height_foliation_report.md) records both constructions and the retained crossing matrices.

## 71. Exact root symbols and a single bare cone condition
The full n-vertex simplex positive roots obey \(\sum_{\rho>0}\rho\rho^T=nI_{n-1}\), with root length \(\sqrt2\). The full A4 action has n=5; the induced A3 has n=4. Restricting full A4 momentum to a spatial tangent keeps all ten roots and constant five, whereas deleting the four inclined roots gives the induced constant four.

For the Spin-covariant unit root Clifford direction \(\Gamma_\rho=\gamma\cdot\rho/\sqrt2\), the rederived Wilson symbol is

\[
D_W=-M+rs+i\gamma\cdot v,\quad
s=\sum_{\rho>0}(1-\cos(q\cdot\rho)),\quad
v=\frac1{\sqrt2}\sum_{\rho>0}\rho\sin(q\cdot\rho).
\]

With \(h=\gamma_5D_W\),

\[
h^2=\bigl[(-M+rs)^2+|v|^2\bigr]I,
\]

\[
E_f^2=M^2+(n^2/2-nMr)|q|^2
+(Mr/12-n/6)F_4(q)+r^2n^2|q|^4/4+O(q^6),
\]

where \(F_4(q)=\sum_{\rho>0}(q\cdot\rho)^4\). The Wilson parameters remain symbolic. Constant chiral rotations give equivalent unit Clifford conventions; the literal retained chirality convention chooses its representative. These rederived root conditions are not a claim to have recovered the missing original v54 entrywise assignment.

With canonical temporal terms and the declared external Hamiltonian clock, the unit scalar gradient gives \(E_s^2=m_s^2+n|q|^2+O(q^4)\). The critical fermion slope is \(n/\sqrt2\); a gapped particle instead has zero group velocity at rest and the above dispersion curvature. The exact bare coefficients in units \(\ell/a\) are

| Root action | Scalar speed | Critical fermion speed | Photon speed |
|---|---:|---:|---:|
| Full A4 | \(\sqrt5\) | \(5/\sqrt2\) | \(1/\sqrt2\) |
| Induced A3 | 2 | \(4/\sqrt2\) | \(1/\sqrt2\) |

A common length/clock conversion multiplies every speed equally. A field scaling multiplies its temporal and spatial quadratic coefficients equally. For one clock and any rank-three spatial principal restriction, under any common invertible coordinate map the normalized generalized eigenvalue shapes remain \(\{1,2n,2n,2n\}\) for scalar/photon and \(\{1,n^2,n^2,n^2\}\) for fermion/photon. The full A4 extra-clock cone has four spatial entries instead. Those raw differences therefore cannot be removed by a shared change of units or coordinates.

Under the additional **bare common-cone condition**, with temporal terms and the photon reference chart fixed, let \(z_s\) multiply the scalar spatial gradient and \(z_f\) multiply the first-order fermion Hamiltonian kinetic term. The unique positive solution within that class is

\[
z_sn=\frac12,\qquad z_f\frac n{\sqrt2}=\frac1{\sqrt2},\qquad
z_s=\frac1{2n},\quad z_f=\frac1n.
\]

It gives (1/10,1/5) on full A4 and (1/8,1/4) on induced A3. These factors are derived from root counts and that extra cone premise; they are not recovered canonical coefficients or a fit to a measured speed. At an interacting selected limit the matching equations use the actual renormalized principal source kernels, including hidden elimination and contacts. An isotropic four-dimensional Euclidean action with one direction reconstructed as time is a distinct route: its common kinetic factor multiplies temporal and spatial derivatives together. It is not a sector-specific reset of the extra-clock Hamiltonian.

The [Wilson source calculation](leaf_geometry_work/matter/common_clock_root_symbols_report.md) retains all bulk and induced-slice symbol polynomials. The [clock matching proof](leaf_geometry_work/clock/common_cone_matching_report.md) verifies the normalized cone invariants and derived relative factors.

## 72. Normal memory and physical source normalization

Conserving b leaves internal and graph normal modes available within each fibre. For an actual retained/normal block Hamiltonian

\[
H=\begin{pmatrix}A&C^\dagger\\C&D\end{pmatrix},\quad
R(z)=(zI-D)^{-1},\quad
K(z)=zI-A-C^\dagger R(z)C,
\]

the retained full inverse is \(K(z)^{-1}\). At real \(z\) outside the hidden spectrum, its full-state lift and positive pole normalization are

\[
\mathcal L(z)=\begin{pmatrix}I\\R(z)C\end{pmatrix},\qquad
K_z=I+C^\dagger R(z)^2C=\mathcal L^\dagger\mathcal L.
\]

At a real eligible pole the denominator is \(r^\dagger K_zr\). Source derivatives differentiate every endpoint, the hidden inverse and second contacts. The Gaussian determinant also retains its hidden factor, \(\det(zI-H)=\det(zI-D)\det K(z)\). Moving source frames require their connection contacts. Changing the clock gives \((aH)_i=aH_i+a_iH\), with the corresponding second derivatives.

One-step compression does not remove this memory:

\[
Pe^{-aH}P-Pe^{-aPHP}P=\frac{a^2}{2}PHQHP+O(a^3).
\]

Repeated projection gives a Zeno dynamics instead. Exact equality of the two heat restrictions for a finite self-adjoint matrix at one nonzero clock forces reduction; approximate numerical equality does not.

The actual archived thirty-six-state compact-source cycle supplies a nonzero normal self-energy of norm 1.61321412; removing it changes the retained resolvent by 0.36545696 at the declared algebraic resolvent point. Full first/second contacts, hidden determinant derivatives and all 36 eligible pole lift norms agree with the full matrices. This is an actual source elimination test, not a substitution of that historical cycle for the current hidden51 law.

For the actual A4 coframe image J and six normal link bands N, the exact squared-frequency Schur kernel is

\[
K_{\rm cf}(t)=J^\dagger K_{20}J+tJ^\dagger P_GJ
-M(H_h+tI)^{-1}M^\dagger,
\quad H_h=N^\dagger K_{20}N,\quad M=J^\dagger K_{20}N,
\]

\[
K_{\rm cf}'(0)=J^\dagger P_GJ+MH_h^{-2}M^\dagger.
\]

Here \(N^\dagger N=I\) and \(N^\dagger J=0\); the hidden block is invertible at the stated momenta. The actual Gauss null is retained. This positive frequency-squared memory coefficient contributes beyond a retained static matrix. The [source proof and executable](leaf_geometry_work/review/normal_memory_source_report.md) give the full first/second formulas and independent numerical evidence.

## 73. The joined statement and its physical scope

The literal fixed-b leaf, compatible external symplectic transport and fibrewise positive transfer are now joined explicitly. The A4 graph can be sliced without hiding crossing faces, and its one-slice Gaussian source response is calculated with every normal momentum retained. Bare shared-clock compatibility has an exact root-count condition, while full interacting compatibility remains the condition on the selected principal source kernels.

The common physical action must use the same conserved fibre, admitted species/gauge/coframe sources, target-independent vacuum and reconstructed time. Its source pullback must obey the constraint stationarity equations, second contacts, hidden determinant terms and Gauss/diffeomorphism Ward identities. Physical observables use the corresponding full lift and residue normalization, including the previously retained charged-Gauss dressing and infrared threshold scope.

The retained all-timelike fixed-volume entropy/area interface remains conditional on its physical coframe and modular-stress identifications; it yields the Einstein principal equation and \(D_{TT}=32\pi G_{\rm ent}P_2/p^2\) in that scope. Nothing in this leaf calculation inserts a separate \(FR/2\) coefficient, rescales the entropy or derives a charged spectrum by filtering generations.

The conserved-leaf component is resolved within the typed local action registry. The independent physical time/coframe embedding and complete nonlinear canonical species action are not established by these finite restrictions. The completed proofs support those exact statements; they do not constitute empirical establishment of a theory of nature.

The [independent audit](leaf_geometry_work/review/leaf_source_audit.md) checks the conserved-fibre, compression, root, source and clock distinctions. Reproduce and validate the local records with:

```sh
python3 run_physical_leaf.py
python3 run_physical_leaf.py --recompute
```

The package includes original source snapshots, scripts, strict finite JSON, finite operator arrays and their provenance. The current specification input is frozen at its preceding revision so that the new integrated specification can be checked without rewriting the mathematical input history. Continued derivations 67–73 contain these seven components; the earlier closed calculations remain intact.

## 74. Phase aware selection of one charged history

The recovered hard selection law and joint trace-log candidate are

\[
\mathcal J(\Pi)=\mathbb E\|X-\Pi X\|^2+2\eta_\Delta\operatorname{rank}\Pi,
\qquad
\Pi_* =\mathbf1_{(2\eta_\Delta,\infty)}(C),\quad C=\mathbb E[XX^\dagger],
\]

\[
\mathscr F=V_{\rm URT}+\tfrac12\operatorname{Tr}\log Q,
\qquad Q=\bar\chi+\mathscr D_{\mathbb A}^2.
\]

The corrected species amplitudes, \(\alpha_{\rm URT}=\phi^{-2}\), species-before-vacuum ordering and raw links \(\mathcal A_{f,k+1}^{-1}\mathcal A_{f,k}\) are retained. The target-independent source law enters before minimizing either functional. Raw links telescope chronologically; polar or positive-factor products need not telescope.

On the actual \(U_{64}\) and oriented retained projector P, write \(P=P_8+P_5\), \(R=UPU^\dagger=P_8+R_5\). Exact arithmetic over \(\mathbb Q(\sqrt5)\) proves

\[
U^{12}=I,\quad U^2PU^{-2}=P,\qquad P_5R_5P_5=\frac1{16}P_5.
\]

The projector orbit has period two. Its equal-phase unit-variance diagnostic average is

\[
\bar C=\tfrac12(P+R),\qquad
\operatorname{spec}\bar C=
\{0^{\times46},(3/8)^{\times5},(5/8)^{\times5},1^{\times8}\}.
\]

An invariant rank13 selection exists, but its fiveplet is the bisector, with \(\|P_{\rm inv}-P\|_F=\sqrt{15}/2\). Phase-aware spectral calculus instead gives

\[
C_{k+1}=UC_kU^\dagger\ \Longrightarrow\
\Pi_{k+1}=U\Pi_kU^\dagger.
\]

Averaging first and conditioning on phase are therefore distinct vacuum-selection operations. No raw covariance amplitude is adjusted to force rank13 in this calculation. The retained orbit span and full-period amplitude decoder both have rank18, but are different spaces: their projectors commute, intersect in ten dimensions and have Frobenius distance four. Equal ranks identify neither carrier nor its physical source.

For a gapped hard selector, the optimized distortion cost obeys

\[
j_i=\operatorname{Tr}[(I-\Pi)C_i],\qquad
j_{ij}=\operatorname{Tr}[(I-\Pi)C_{ij}]-\operatorname{Tr}(\Pi_jC_i).
\]

The moving projector contributes a real source contact. On the actual two-phase fiveplet pair, a diagnostic affine source \(C(s)=\bar C+s(P-R)\) gives

\[
\Pi'(0)=4(P-R),\qquad \Pi''(0)=-30(P_+-P_-),\qquad j''(0)=-75/2
\]

at the algebraic threshold 1/2. That threshold is a proof witness, not a replacement for the physical \(2\eta_\Delta\). The hard selector loses differentiability at a threshold crossing.

For one common random history, the primitive loaded histories \(Y_f=D_fX+j_f\) have exact joint moments

\[
\mathbb E[Y_fY_g^\dagger]=D_fCD_g^\dagger
+D_fmj_g^\dagger+j_fm^\dagger D_g^\dagger+j_fj_g^\dagger.
\]

The actual four primitive charge shifts in the retained-unit-covariance diagnostic give centered joint rank13 and uncentered joint rank14; replacing them by independent blocks gives rank56. The mixed species contacts remain in the one common vacuum equation. These diagnostic ranks do not assign masses or generations.

The [recovered action and exact selector proof](geometric_time_work/recovery/canonical_action_recovery_report.md) preserves the successful earlier conversation excerpts. Fresh targeted conversation retrieval returned unavailable; that access failure is not evidence that a full formula never existed and is not a claim to have read 100 complete transcripts.

## 75. Exact scalar transfer along the A3 slice normal

For the full ten-root scalar action, use the adapted A4 height \(h=n_4\) and

\[
S_4(q)=1+\sum_{j=0}^2e^{iq_j}=R e^{i\beta},\qquad
A(q)=24-R^2+m^2.
\]

The actual inverse is

\[
K(q,\omega)=25-|S_4+e^{i\omega}|^2+m^2
=A-2R\cos(\omega-\beta).
\]

All six spatial and four crossing roots remain. For \(m^2>0\), \(A>2R\). On the thirteen-site spatial grid, all 2197 values of R are nonzero. The massless constant mode retains its explicit infrared prescription.

The co-moving field \(\phi_h=e^{ih\beta}\psi_h\) removes the cross-height phase on an open or infinite height. Its real oscillator kernel is

\[
\mathcal T_+(y,x)=C\exp[-\lambda A(x^2+y^2)/4+\lambda Rxy],\qquad C>0.
\]

Expanding \(e^{\lambda Rxy}\) gives a sum of positive rank-one kernels, proving positivity. With

\[
\cosh E=\frac{A}{2R},\quad B=\lambda R\sinh E,
\quad C_M=\sqrt{\lambda R/(2\pi)},
\]

the Mehler kernel has oscillator eigenvalues \(e^{-E(n+1/2)}\). A different specified positive measure prefactor changes its vacuum scalar and partition contacts; it cannot be dropped from a source-dependent full trace. The exact original-field covariance is

\[
C_\infty(q,h)=\frac{e^{ih\beta}e^{-E|h|}}{2\lambda R\sinh E}.
\]

The geometric normal separation is \(d_n=\sqrt5/2\). Writing q in its inherited orthonormal spatial frame k,

\[
R=4-|k|^2/2+O(|k|^4),\quad
E^2=5|k|^2/4+O(|k|^4),\quad
(E/d_n)^2=|k|^2+O(|k|^4)
\]

at the massless pole. This is unit propagation speed in one geometric metric, without a measured speed or a separate scalar clock.

On the original thirteen-height circle, the same transformation leaves \(\psi_{h+13}=e^{-13i\beta}\psi_h\). Its partition factor is a twisted trace containing \(\mathcal R_\beta^{13}\mathcal T_+^{13}\). Its full covariance and determinant retain that seam. The exact polar square \(\mathcal T_{\rm raw}^\dagger\mathcal T_{\rm raw}=\mathcal T_+^2\) is a two-height step of distance \(2d_n\); calling it one height would change its cone. The positive open scalar transfer is not automatically the literal finite periodic density operator.

The [scalar derivation](geometric_time_work/scalar/a4_height_scalar_transfer_report.md) verifies all 28561 root denominators and covariance entries. Its polar transport has spatial support on every finite spatial site; it is not a local primitive translation.

## 76. Full gauge poles with crossing links and contacts

The complete twenty-translated-face Gaussian action has a spatial six-link block, a four-link crossing block and the exact crossing Schur kernel. Put \(u=(e^{iq_0/2},e^{iq_1/2},e^{iq_2/2},1)\), and let \(L_u v=u\wedge v\). Then

\[
C=K_{cc}=8I_4-uu^\dagger-\bar u u^T,
\quad \operatorname{spec}C=\{4-R,4+R,8,8\},
\]

\[
K_{sc}=z^{-1/2}L_u+z^{1/2}L_{\bar u},\qquad
Q(z)=K_0-zD-z^{-1}D^\dagger.
\]

At every nonzero spatial mode the hidden crossing inverse exists; its low band becomes gapless as q tends to zero. Thus its elimination retains its inverse, determinant and source terms rather than treating it as a uniformly fast block.

For the actual eight spatial-face observations, the complete covariance is

\[
C_F(z)=\frac{N_{-1}z^{-1}+N_0+N_1z}{\mathcal D(z)},\qquad
\mathcal D(z)=24-R^2-\bar S_4z-S_4z^{-1},
\]

\[
\operatorname{Tr}C_F(z)=\frac{12}{5}+\frac{2(16-R^2)}{\mathcal D(z)}.
\]

Its height poles are \(z_\pm=e^{i\beta\pm E}\), with \(\cosh E=(24-R^2)/(2R)\). The forward residue has rank two and obeys

\[
R_+^2=\lambda_F R_+,\qquad
\lambda_F=\frac{16-R^2}{2R\sinh E}>0.
\]

This is an oblique projection identity. Generic finite-lattice residues are not Hermitian positive weights for the fixed Hermitian source. Both temporal poles and the instantaneous contact are retained in the exact thirteen-period image sum.

The physical normal spacing again gives \(E/d_n=|k|+O(|k|^3)\). For the two normalized transverse magnetic coframe observations, the actual limiting residue is

\[
R_{+,\rm mag}=\frac{|k|}{\sqrt5}I_2+O(|k|^3)
\]

at unit Gaussian coefficient, divided by that coefficient in the declared action. The scalar and photon infrared cones therefore agree. Finite-cutoff pole eigenvalues alone do not establish the reflected source state.

The actual fundamental-weight normal reflection maps odd-height sites to half-integral points. Even Fourier interpolation of that reflection gives a negative full Gaussian spatial-face witness at mode (1,2,3), where scalar polar and geometric drift agree. This explicitly defeats that particular reconstruction. It does not contradict the already positive selected Hamiltonian \(B^\dagger B\), its compact nonlinear action or a different admitted time reflection.

The literal hat has \(\widehat w_\delta(n)\ge0\); multiplying it by a positive Wilson cosine weight convolves nonnegative Fourier sequences. Its square root remains a nonnegative multiplication operator, although its central convolution Fourier coefficients need not all be nonnegative. These are different operator statements. The [full gauge proof](geometric_time_work/gauge/a4_height_transfer_report.md) keeps the repaired selector and the old staggered reflection registry intact.

## 77. Geometric Wilson matter and physical endpoint residues

Each upward root decomposes as \(d_i=d_n n+t_i\), with \(\sum_i t_i=0\), \(t_i\cdot t_j=\delta_{ij}-1/4\). Its actual unit Clifford direction contains a tangential spin part,

\[
\Gamma_i=\sqrt{5/8}\,\gamma_n+\gamma\cdot t_i/\sqrt2,
\qquad\sum_i\Gamma_i=\sqrt{10}\,\gamma_n.
\]

The complete height inverse is the Laurent Dirac kernel

\[
D(k,z)=A(k)+zH_+(k)+z^{-1}H_-(k),
\quad H_+=\tfrac12\sum_i e^{ik\cdot t_i}(\Gamma_i-rI),
\quad H_-=\tfrac12\sum_i e^{-ik\cdot t_i}(-\Gamma_i-rI).
\]

Its scalar/vector form \(D=wI+i\gamma\cdot v\) gives \(D^{-1}=(wI-i\gamma\cdot v)/(w^2+v\cdot v)\), with the bilinear square at complex z. The determinant is the square of a reciprocal-conjugate quartic. All 2197 symbolic spatial polynomials retain the Wilson parameter and mass loading; no physical species mass is inserted to choose their roots.

The full root dyad gives

\[
D(q)=m_0I+i\frac5{\sqrt2}\gamma\cdot q
+\frac{5r}{2}|q|^2I+O(|q|^3).
\]

Its geometric massless principal cone is \(E^2=|k|^2\). Scalar, gauge and matter principal cones now agree in the same geometric metric. This result is for the four-dimensional Euclidean root actions, rather than the earlier four-coordinate Hamiltonian graph with an extra clock.

With \(c_D=5/\sqrt2\), \(V_4=\sqrt5\), and root length unit \(\ell\), the action fixes

\[
\psi_{\rm can}=\sqrt{\frac{c_D}{V_4\ell^3}}\psi_{\rm lattice}.
\]

The spatial Fourier endpoint factor at fixed height is \(c_D/d_n=\sqrt{10}\). At zero spatial momentum and the algebraic critical r value \(\sqrt{5/8}\), the normalized forward propagator has \(G_n=z_0^{n+1}P_+\). Its discrete endpoint factor is retained; it is not fitted away.

The scalar phase transport does not remove a matrix-valued spin hopping polar. At finite spatial momentum, the critical zero-mode r choice still has non-Hermitian reflected residues and an extra negative reflected weight. This rejects that fixed normal-spin one-height candidate, while preserving the canonical positive Hamiltonian transfer. The species, Higgs and wall operators must enter the full matrix before the inverse and its physical endpoint projection.

The actual full ten-root spin4 operator on \(3^4\) sites also has a contact-complete pure-gauge loop identity: its current bubble and seagull both equal 87.3867116020, with residual \(1.42\times10^{-14}\). The [matter proof](geometric_time_work/matter/geometric_height_matter_report.md) supplies the full polynomial, poles, source vertices and residue conversion.

## 78. A lattice preserving root normal and a two height scalar transfer

Take the actual root-normal height \(h=n_4-n_3\). Reflection is the Weyl swap \(n_3\leftrightarrow n_4\), an exact lattice involution. Purely spatial roots form A2 among indices 0,1,2; rank-three slice lattices alternate between integral and half-integral transverse cosets. The root joining 3 and 4 is temporal with height jump two; six inclined roots have jump one. These are different slice and action data from the A3 fundamental-weight height, rather than deletion of a crossing interaction.

In the actual spatial chart, put

\[
B(q)=2\sum_{i=0}^2\cos(q_2/2-q_i),\quad (q_i)=(q_0,q_1,0),
\]

\[
a(q)=m^2+20-2[\cos q_0+\cos q_1+\cos(q_0-q_1)].
\]

The full scalar symbol is

\[
K(q,\omega)=a(q)-2\cos2\omega-2B(q)\cos\omega.
\]

Its covariance has two positive spectral coefficients, with one positive and one negative one-height transfer eigenvalue. Site reflection gives their positive covariance Gram; Gaussian Wick reconstruction retains both branches. The two-height transfer squares their eigenvalues and is positive, with normal distance \(\sqrt2\). Its massless infrared speed is one. The source includes both parity cosets and both branches; no generation or temporal branch filter is inserted.

The original odd thirteen-height quotient and an explicit even26 cover have different seams. The latter gives a reflection-positive finite scalar boundary prescription. At zero spatial momentum, the original quotient's four-source site form is an invertible Vandermonde congruence of a diagonal form with signs (+,+,+,−), for every positive scalar mass and loading. Its negative direction is therefore an exact obstruction, beyond the numerical witness. The cover is an additional boundary choice, not a claim that the original finite state was already that cover. The [root-normal scalar proof](geometric_time_work/root_time/root_normal_scalar_transfer_report.md) derives the full two-slab inverse, clock and reflected source.

For the same root-normal direction, the full Wilson stencil at zero spatial momentum is

\[
D(\omega)=[m_0+r(7-\cos2\omega-6\cos\omega)]I
+i\gamma_n[\sin2\omega+3\sin\omega].
\]

At r=1, the \(\gamma_n=+1\) denominator is

\[
d_+(z)=m_0+7-\tfrac32z-\tfrac92z^{-1}-z^{-2}.
\]

For every \(m_0>0\), the rest cubic has one root in each of (−1,0), (0,1) and (1,∞). The reciprocal of the last root is a positive inside pole in the minus-spin inverse, with strictly negative Dirac-reflected source weight at every positive separation, including all even-height samples. A positive scalar two-height reconstruction therefore does not alone provide a positive CAR transfer for this r=1 action.

The free continuum limit is nevertheless derived without deleting a branch. At zero mass, the cubic factors as \((z-1)(-3z^2+11z+2)/2\). With \(m_0=(5/\sqrt2)\ell m_{\rm phys}\), \(t=N\ell/\sqrt2>0\), and the cell-derived endpoint factor five,

\[
5S_N(0)=e^{-m_{\rm phys}t}[P_++O(\ell)]
+O(e^{-ct/\ell}),\qquad c>0.
\]

The cutoff source branches vanish exponentially at fixed positive time, while their determinants and loop contacts remain in the full action. This is a free source limit, rather than an interacting continuum theorem. The [root-normal matter calculation](geometric_time_work/matter/root_normal_matter_report.md) retains the complete pole and source classification.

## 79. Exact normal holonomy and common source contacts

On the original A3 height circle, a unit-charge normal phase j gives the actual scalar kernel

\[
K_N(j)=dI-b e^{i(\theta+j)}L-b e^{-i(\theta+j)}L^\dagger,
\quad d=24-b^2+m^2,\ b=|S_4|,\ \theta=-\arg S_4.
\]

The exact complex-scalar determinant and response are

\[
\det K_N=2b^N[\cosh(NE)-\cos N(\theta+j)],\qquad
\Gamma=\log\det K_N,
\]

\[
\Gamma_{jj}=N^2\frac{\cosh(NE)\cos N(\theta+j)-1}
{[\cosh(NE)-\cos N(\theta+j)]^2}.
\]

Every one of the 2197 spatial determinants agrees with its complete thirteen-mode Fourier product. This finite scalar-loop holonomy curvature is not a stand-alone photon coupling. Current and seagull terms together preserve the exact pure-gauge and mixed gauge/holonomy zero responses.

The source-dependent polar frame \(V_{nn}=e^{-in(\theta+j)}\) moves the entire source to the periodic seam. Its connection \(\Omega=V^\dagger V_j=-i\operatorname{diag}(n)\) gives

\[
\widetilde K_j=V^\dagger K_jV+[\widetilde K,\Omega],
\]

\[
\widetilde K_{jj}=V^\dagger K_{jj}V
+2[V^\dagger K_jV,\Omega]+[[\widetilde K,\Omega],\Omega].
\]

The transformed bulk current cancels and the retained seam has derivatives iN and −N² times its forward hopping. Dropping these frame contacts would compute a different source. Physical conversion \(j=d_n Q A_n\) gives \(\Gamma_{A_nA_n}=(d_nQ)^2\Gamma_{jj}\) at fixed normal metric; varying the coframe differentiates that map too. The [height source proof](geometric_time_work/source/height_source_transport_report.md) supplies the exact matrices and independent Ward checks.

## 80. The derived common cone and the remaining action identity

The following conditional theorem is derived from the literal complete A4 Euclidean root actions: with a shared orthonormal coframe, all roots retained, and the stated massless/continuum principal limits, scalar, gauge and fermion fields have one unit geometric propagation cone. Their coefficients arise from the root tight frame and face frame; no measured speed or independent sector clock is used. Their physical sources retain their own canonical field, cell-volume and endpoint conversions.

This theorem is distinct from claiming that the existing selected Hamiltonian transfer has been reconstructed along one graph coordinate. At finite cutoff, the choice of time reflection, boundary prescription, spin transport and source observations is part of that operator identity. The explicit open scalar construction, two-height root-normal reconstruction, gauge residues and fermion tests make those conditions calculable. Finite reflection counterexamples apply to their specified action, state and source; they do not reopen positivity of the canonical \(T_b=B_b^\dagger B_b\).

The original conserved four-dimensional boundary leaf and compatible external symplectic chart remain closed. The all-timelike entropy/coframe Einstein interface, electron-normalized compact charge, species-first ordering and hidden-memory contacts are preserved. A different time prescription does not introduce an extra entropy normalization or replace a physical charged correlator by a history stability rate.

The complete same-action equality still requires the target-independent nonlinear charged history, admitted joint source map, selected common vacuum and positive physical time representation. Neither a diagnostic covariance nor the bare common cone selects those entries. The recovered state and selector laws constrain them explicitly; the unavailable conversation access cannot be treated as proof that prior derivations did not exist.

The [independent reflection audit](geometric_time_work/review/geometric_reflection_audit.md) and [source audit](geometric_time_work/review/geometric_source_audit.md) review the operator scopes and exact contacts. Validate the local records with:

```sh
python3 run_geometric_time.py
```

The source snapshots, executable proofs, strict finite records and finite arrays are included in the complete package. These seven components extend the continued derivations as 74–80. They prove the stated geometric-time and joint-source results; they do not establish the Cathedral as an empirically confirmed or complete theorem of nature.

## 81. Positive operator time with the odd period retained

For any nonzero finite \(T\ge0\), \(Z_N=\operatorname{Tr}T^N>0\).
Given source operators \(A_i\) at times \(0\le t_i\le N/2\), define

\[
X_i=T^{t_i}A_iT^{N/2-t_i}.
\]

The source/reflection form is exactly

\[
G_{ij}=\frac{\operatorname{Tr}
[T^{N-t_i-t_j}A_i^\dagger T^{t_i+t_j}A_j]}{Z_N}
=\frac{\operatorname{Tr}X_i^\dagger X_j}{Z_N}\ge0
\quad\text{as a matrix in all source and time indices}.
\]

The last inequality means \(c^\dagger Gc\ge0\) for every complex
coefficient vector. It is a Hilbert–Schmidt Gram identity, including
noncommuting and non-Hermitian sources. No inverse transfer is used.
Ordered polynomial source words obey the same identity, with reflection
reversing order and taking the actual operator adjoints.
CAR words use the ordinary Fock adjoint, including their operator order and
signs. This does not identify an unverified Grassmann, Pin or normal-Dirac
reflection dictionary with that physical adjoint.

At \(N=13\) and integer times 0 through 6, all trace powers are integers
and nonnegative, with \(13-t_i-t_j\ge1\). The original odd period is
retained; no even cover is needed for this transfer theorem. A thirteen-step
thermal circle is a stated time boundary condition, not an identification of
the internal thirteen-state fibre with inverse temperature.

On \(P_T=\mathbf1_{(0,\infty)}(T)\), functional calculus gives
\(H_T=-a^{-1}\log(T/\|T\|)\), a positive heat semigroup and a unitary
real-time group. The norm convention sets the base vacuum energy; the raw
transfer and its source contacts remain fixed. Null directions have no
finite logarithmic energy and remain outside this finite-log support.
The exact kernel of the injective-heat factorization is
\(\ker T=\ker(\sqrt W P_G)\). Without commutation, its support is not
obtained by multiplying two support projectors.

Each ground-state transfer-channel residue

\[
R_{ab}(z)=\operatorname{Tr}(\rho_0 A_a^\dagger P_z A_b)
\]

is positive semidefinite. Transfer gaps \(-a^{-1}\log(z/\|T\|)\)
are defined on positive support. Their interpretation as physical particle
masses requires the specified physical source and spatial/continuum map.
Equal-time excursions into the null sector remain contacts; a source
projection that deletes them changes the observable.

The actual hidden eight-state transfer supplies all sixteen retained off-diagonal
source channels. With \(r=\Delta^2\), its odd-period kernel is

\[
G_{(a,t),(b,s)}
=\delta_{ab}\frac{r^{t+s}+r^{13-t-s}}{8(1+r^{13})}.
\]

The two terms have positive coefficients. This retains its two-level hidden
scope and does not introduce a generation filter. On this hidden carrier,
the primitive \(\rho_\star=T_{\rm hid}/\operatorname{Tr}T_{\rm hid}\)
and its circle state
\(\rho_{13}=T_{\rm hid}^{13}/\operatorname{Tr}T_{\rm hid}^{13}\)
are kept distinct. The primitive hidden state is not assigned to an arbitrary
full physical transfer merely by normalizing that transfer once.
The [positive thermal reflection proof](physical_time_work/transfer/positive_thermal_reflection_report.md)
supplies the exact operator construction and executed arrays.

## 82. Integer time words retain the full source derivatives

For admitted source families \(T(s)\) and \(A_i(s)\), the thermal
numerator is an integer-power matrix word. Its first derivative replaces
each factor once by its first derivative. Its mixed second derivative
includes each factor's second contact and both orders of every pair of
distinct first replacements. This rule includes source endpoints, moving
frames, selector and Gauss factors when they depend on the admitted source.

Write the unnormalized numerator as W, the partition function as Z, and
\(C=W/Z\). Then

\[
C_a=\frac{W_a-CZ_a}{Z},\qquad
C_{ab}=\frac{W_{ab}-C_aZ_b-C_bZ_a-CZ_{ab}}{Z}.
\]

For \(T=B^\dagger B\), the diagonal second contact is

\[
T''=B''^\dagger B+2B'^\dagger B'+B^\dagger B''.
\]

Static Gram positivity does not equate a sourced partition Hessian with a
positive covariance. The former also contains these second contacts and
partition derivatives. In particular, a smooth rank-gain eigenvalue
\(s^2\) has a nondifferentiable square root \(|s|\); the integer word
remains smooth. Differentiating the static fractional-power factorization
across such a gain would be an invalid shortcut.
These integer source derivatives hold insertion labels fixed. Sources held
at fixed proper times also require the admitted placement and clock contacts.

The [integer thermal source proof](physical_time_work/thermal_sources/integer_thermal_source_jets_report.md)
derives and executes the complete word and endpoint rules on the existing
selected-transfer probe. That probe remains an identity witness rather than
the recovered full nonlinear species action.

## 83. Kernel and moving-support contacts are forced by positivity

Let \(P=\operatorname{supp}T(0)\), \(Q=I-P\), and let \(T^+\)
be the inverse on that support, zero on the kernel. Every twice differentiable
two-sided positive source family satisfies

\[
QT_iQ=0,\qquad
QT_{ii}Q-2QT_iP\,T^+\,PT_iQ\ge0.
\]

For constant rank the mixed relation is exact:

\[
QT_{ij}Q=QT_iP\,T^+\,PT_jQ
+QT_jP\,T^+\,PT_iQ.
\]

It follows from the positive Schur complement of the support block. Dropping
the second contact while retaining a cross-support first derivative makes
the affine truncated family indefinite. It is a failure of that truncation.
For rank gain, only the real directional Schur excess is constrained
nonnegative; the constant-rank equality is not asserted.

Along one smooth constant-rank source path, the Kato connection
\(\Omega=[P',P]\) fixes the support frame. The transformed derivatives
are

\[
\widetilde T'=T'+[T,\Omega],
\]

\[
\widetilde T''=T''+2[T',\Omega]+[[T,\Omega],\Omega]
+[T,\Omega'],\qquad\Omega'=[P'',P].
\]

The connection derivative is retained. Multi-source frame transport requires
its own mixed connection contacts. The actual rank-eight-in-twenty hidden
coframe factor verifies all thirty-six mixed kernel identities and all six
diagonal transported paths. Its five moving shear directions become
indefinite when the quadratic contact is omitted; its fixed-support breathing
direction is distinct.
The [kernel source proof](physical_time_work/source/kernel_source_contacts_report.md)
contains the derivation, exact archived matrices and rank-gain witness.

## 84. The complete Euclidean Wilson diagnostic and its limited scope

The preceding root-normal Wilson inverse used all ten A4 roots, a fixed
normal Dirac adjoint, and an isotropic Wilson coefficient. Its r=1 negative
source theorem concerns that specified action. The new general-coefficient
classification retains both temporal cosets and every spin/source branch.
For every \(m_0>0\) and \(r\ge0\), it proves that some
even-height minus-spin normal-reflected correlator is negative.
The proof includes real, complex, purely imaginary and repeated pole cases.
It closes the proposal to repair this diagnostic by changing one uniform
Wilson coefficient; it does not select a new coefficient or alter the action.

The recovered archived wall action has a different time stencil, Clifford
placement and source endpoint. Its domain-wall additive \(m_0=-M_{\rm arch}<0\)
also lies outside the positive-additive-mass domain of the new theorem.
The latest October rule also inserts species
before common vacuum selection and hidden elimination. Therefore neither the
archived wall completion nor the isotropic Euclidean diagnostic is substituted
for the corrected full selected source action. The exact classification and
its executable cases are supplied by the
[general Wilson coefficient proof](physical_time_work/fermion/general_root_wilson_report.md).

## 85. Admission to the same canonical action and the closure ledger

An asserted geometric representation must preserve the physical source
adjoint, state, time boundary, coframe/clock conversion and all admitted
source derivatives of the canonical transfer. It must intertwine their
correlators, rather than match only a bare dispersion or local lattice name.
Every genuine admitted marginal of a positive source Gram is positive.
Consequently a negative diagnostic form cannot be such a marginal with the
stated same adjoint and state.

The earlier odd13 Euclidean scalar covariance fails its specified site
reflection. The canonical odd13 operator thermal Gram proved above is
positive. This closes their inequivalence under that proposed identification;
it does not require repairing the canonical transfer or changing its period.
The fermion diagnostic requires the same source/state/time admission before
its negative reflected forms could constrain the full machine.

The [canonical applicability ledger](physical_time_work/recovery/canonical_time_applicability_report.md)
pins the actual archived coefficients and hopping operators, the recovered
conversation corrections, and the complete intertwining conditions. Sources
enter before vacuum and hidden elimination; hidden determinants, endpoint
contacts and memory remain required after reduction.

Closed here are canonical positive operator time on its support, odd-period
thermal source reflection, positive source-channel spectral residues, and the
contact-complete integer and support derivative laws. Closed prior results
remain frozen. Diagnostic no-go statements retain their specified action and
adjoint scopes. The geometric embedding of this clock in the conserved
physical leaf, selected nonlinear species/source law and interacting
continuum observables require their own same-action derivations.

These five components extend the continued work as sections81–85. The package
preserves the exact version-eight input and supplies all executable proofs.

```sh
python3 run_canonical_time.py
```