# Newton’s Cathedral / URT: current theory specification

9 October 2026. This specifies the recovered candidate dynamics and its physical observables. October corrections control the canonical history and source dictionary; older exact carrier and Hamiltonian identities remain usable within their stated scope. A symbol marked **required** identifies an input the theory must specify through recovery or derivation, rather than an adjustable entry.

## 1. Carriers, constants and order of construction

The finite signed six-axis history acts on the six-bit carrier, with
\[
\mathscr H_{64}=4\operatorname{End}(V_4)
=\mathscr H_{13}\oplus\mathscr H_{51},\qquad
\mathscr H_{13}=2\mathbf1\oplus\mathbf3\oplus\mathbf3'\oplus\mathbf5.
\]
The oriented degree-two fiveplet fixes the retained thirteen-dimensional subspace. The recovered outer lift satisfies \(U_{64}^{12}=I\). Above the URT base
\[
M_{\rm URT}=S^1_\theta\times\mathbb R^+_\chi\times S^1_\vartheta\times\mathbb R_\tau\times\mathcal B,
\]
the external symplectic transport is
\[
S_{\rm ext}=\operatorname{diag}(\kappa R_\vartheta,\kappa^{-1}R_\vartheta),
\quad \kappa=\pi/e,\quad\vartheta=2\pi/\phi^2,
\quad\phi=(1+\sqrt5)/2.
\]
Its metaplectic lift acts on the external Hilbert space. It has a different carrier from \(U_{64}\).

The recovered boundary first integral is \(I_b=\operatorname{pr}_{\mathcal B}\),
\(I_b\circ F=I_b\), or \(\dot b=0\). The conserved base leaf is
\(M_{b_0}=S^1_\theta\times\mathbb R^+_\chi\times S^1_\vartheta\times\mathbb R_\tau\times\{b_0\}\),
of dimension four. The boundary label is distinct from a radial breathing
coordinate, an A4 height and a moving complete history state. In a continuous
label representation it is a direct-integral fibre/superselection sector,
not a singleton projector on a non-atomic ambient measure. Local entries,
selector and Gauss operators that act fibrewise give the exact positive
transfer \(T_b=P_{G,b}W_{\delta,b}^{1/2}e^{-aH_b}W_{\delta,b}^{1/2}P_{G,b}\).
The chart/time embedding is stated separately below.


The **current canonical internal selector coefficient** is
\[
\alpha_{\rm URT}=\phi^{-2}.
\]
It is distinct from \(\kappa\), the golden phase increment, the old scalar \(\sqrt{4/3}\) coefficient, and the electromagnetic fine-structure constant. In units \(\hbar=c=1\), the physical transfer step \(a>0\) retains units of inverse energy. A dimensionless hidden modular parameter does not fix \(a\).

The dependency order is
\[
\text{signed full history + species + gauge/coframe sources}
\longrightarrow\text{selected vacuum}
\longrightarrow H_{\rm local}
\longrightarrow T_{\rm phys}
\longrightarrow\text{physical correlators}.
\]
Species are inserted before selecting the vacuum and before eliminating the fifty-one hidden history coordinates.

## 2. Canonical charged history and its typed requirements

For the four species, the recovered primitive charge words are
\[
q_u=(1,3,-4),\quad q_d=(1,-3,2),\quad
q_e=(-3,-3,6),\quad q_\nu=(-3,3,0),
\]
in \(Q_2=\{q\in\mathbb R^3:\sum_iq_i=0\}\). Their quadratic source is
\[
g_i(q)=q_i^2-\|q\|^2/3,
\qquad\|g(q)\|^2=\|q\|^4/6.
\]
The oriented form \(h_{fg}=q_f\cdot q_g+i\,n\cdot(q_f\times q_g)\), \(n=(1,1,1)/\sqrt3\), retains the species orientation.

The literal October 6 typed amplitude is
\[
\mathcal A_{f,k}
=C_5(H_k)+C_{43}(\Xi_{3,k}+J_{43}q_f/3)
+i(-1)^k C_{45}(\Xi_{5,k}+\Delta J_{45}g(q_f)/5).
\]
Here \(J_{43},J_{45}:Q_2\to\mathbb R^4\) are the typed charge embeddings; \(C_{43},C_{45}\) read two **quartets** into \(\operatorname{Hom}(3,3')_4\), and \(C_5\) reads the fiveplet. The charged amplitude enters the canonical generator before vacuum selection. The older edge chart \(J_e=JR(\arg U_e)\) records its gauge-transport architecture. No extra response-fed endpoint charge is prescribed.

Write the current canonical law by its required types:
\[
\mathsf F_{\rm can}:\mathscr H_{64}\times\mathcal S_{\rm species}
\times\mathcal U_{\rm gauge}\times\mathcal E_{\rm coframe}
\longrightarrow\mathscr H_{64},\qquad
P_{f,k+1}=\mathsf F_{\rm can}(P_{f,k};q_f,g_f,U,E),
\]
with \(\alpha_{\rm URT}=\phi^{-2}\). The label \(f\) identifies a species channel under one common selection rule; independent species vacua are not postulated. **Required:** the exact nonlinear formula, remaining fixed coefficients, placement/order of signed returns, complete species/joint-source embedding \(\iota_{\rm species}:\mathcal S_{\rm species}\to\mathscr H_{64}\), and target-independent vacuum rule. The old anchored scalar recurrence and sixty-state Ruelle branch do not specify these entries.

For decoded nonsingular amplitudes the corrected link is
\[
R_{f,k}=\mathcal A_{f,k+1}^{-1}\mathcal A_{f,k},
\qquad U_{f,k}=\operatorname{polar}(R_{f,k}).
\]
The chiral amplitude lift \(\widehat M(\mathcal A)=\begin{pmatrix}0&\mathcal A^\dagger\\\mathcal A&0\end{pmatrix}\) is typed. A polar link alone does not determine the radial kinetic/wall action. **Required:** its canonical embedding into the local matter action, including current insertions.

### Derived golden block and source-extension test

The normalized recovered intertwiner $S:3\to3'$ gives
\[
M_S=\begin{pmatrix}I&S^\dagger\\S&0\end{pmatrix},\quad
M_S^2-M_S-I=0,\quad
\operatorname{spec}M_S^2=\{\phi^2,\phi^{-2}\}.
\]
Thus the stable/unstable magnitude ratio is $\phi^{-2}$, with triplet
multiplicities. For a general amplitude $\mathcal A$, direct substitution
into $M_S^2$ and squaring $M(\mathcal A)$ are different source actions.
At $t=\sigma^2=1$, their lower eigenvalues agree, but their slopes are

\[
-1/\sqrt5\quad\hbox{and}\quad1-1/\sqrt5.
\]
The one-phase affine real decoder has rank13 (fiveplet plus two quartets);
restricting it prematurely to retained \(\mathscr H_{13}\) leaves rank5.
Its real kernel51 must not be identified with the complex quantum hidden51
block: the complex-linear decoder has rank9/kernel55. Explicit positive
full64 completions preserve the recovered generation and hidden8 data yet
change hidden determinants and mixed couplings. These are nonuniqueness
witnesses under the stated finite constraints, not additions to a fixed
complete action. Required source selection therefore cannot be omitted.

For the recovered hard quadratic selector, with raw-history second moment
\(C=\mathbb E[XX^\dagger]\), the global rule is
\(\Pi_*=\mathbf1_{(2\eta_\Delta,\infty)}(C)\), with threshold ties.
The recovered trace-log candidate has the contact-complete joint equation

\[
\delta V+\tfrac12\operatorname{Tr}(Q^{-1}\delta Q)=0,\qquad
Q=\bar\chi+\mathscr D_{\mathbb A}^2.
\]
The raw history/source operator and admissible spiral constraint still
determine which vacuum this selects; a threshold alone does not prove rank13.

## 3. One Hamiltonian and one positive physical transfer

The recovered finite local Hamiltonian provides the entry structure
\[
\begin{aligned}
H_{\rm local}={}&H_E+H_B+H_{\Phi,\rm kin}
-\frac{13}{2}\sum_q|\sigma_q|^2
+\sum_q[W_b(|\sigma_q|^2)+V_H(\Phi_q)]\\
&+H_F+H_Y+H_{\rm heavy},
\end{aligned}
\]
with Gauss constraint, compact gauge links, scalar momenta and root kinetic terms, the Wilson/domain-wall fermion entries, Yukawa terms and the fixed heavy representations. The displayed breathing subtraction uses the geometric \(L_{13}\) in \(H_{\Phi,\rm kin}\); equivalently use \(L_{13}-13P_b\) there and omit the subtraction. It removes double counting of the promoted singlet. Its current physical species/wall entries must come from the selected canonical history; the older response-fed terminal matrix is an archived completion, not a substitute for that derivation.

For the specified self-adjoint bounded-below \(H_{\rm local}\), Gauss projector \(P_G\), and nonnegative repaired-face selector \(W_\delta\),
\[
T_{\rm phys}=P_GW_\delta^{1/2}e^{-aH_{\rm local}}
W_\delta^{1/2}P_G=B^\dagger B,\qquad
B=e^{-aH_{\rm local}/2}W_\delta^{1/2}P_G.
\]
The physical space is \(P_G\mathscr H\). On the positive admissible support define \(K_T=-\log T_{\rm phys}\), \(H_T=K_T/a\), and, for a specified finite-volume trace,
\[
\rho_n=T_{\rm phys}^n/\operatorname{Tr}T_{\rm phys}^n,
\qquad\Gamma=-\log\operatorname{Tr}T_{\rm phys}^n.
\]
Source derivatives include the dependence of \(H_{\rm local}\), \(W_\delta\), \(P_G\), and support. The face width \(\delta=\epsilon_*/2\) is distinct from the entropy rail amplitude \(\Delta\). For fixed outer factors the Hamiltonian insertion obeys the exact Duhamel formula
\[
T_i=-aP_GW_\delta^{1/2}\int_0^1
e^{-a(1-s)H}H_i e^{-asH}\,ds\,W_\delta^{1/2}P_G.
\]
Thus physical sources are derivatives of this same transfer. Their connected response includes both contact terms and Kubo–Mori covariance.

## 4. Particles, poles, residues and charged currents

Partition an actually specified full operator into retained and hidden sectors:
\[
\mathscr D_f=\begin{pmatrix}A_f&B_f\\C_f&D_f\end{pmatrix},\qquad
K_f(z)=zI_{13}-A_f-B_f(zI_{51}-D_f)^{-1}C_f.
\]
Its retained resolvent is \(K_f(z)^{-1}\). At a simple pole \(z_*\), with \(K_f(z_*)r=0\), \(l^\dagger K_f(z_*)=0\),
\[
\operatorname{Res}_{z_*}K_f^{-1}
=\frac{rl^\dagger}{l^\dagger K_f'(z_*)r}.
\]
The frequency-dependent hidden memory and this derivative normalization are retained. Their algebra applies to a history stability operator as well as a physical kernel; identifying the latter requires the action and source dictionary.

Define the **physical charged two-point function** from the selected transfer with its canonical charged interpolating fields, Gauss-compatible dressing/boundary prescription, and source/current weights at both ends:
\[
\mathcal G^{(J)}_f(p)=\mathcal J_f^\dagger
\langle\Psi_f(p)\overline\Psi_f(-p)\rangle_{T,\rm phys,c}
\mathcal J_f.
\]
Particle masses are singularities/poles of this physical function, with nonzero physical residue; a stable isolated relativistic particle has its pole at \(p^2=m_f^2\) after the specified Lorentz continuation. Transfer gaps satisfy \(a(E_n-E_0)=-\log(\lambda_n/\lambda_0)\). Static Schur values and signed-history Floquet stability rates do not alone supply the particle mass dictionary.

For a Hermitian physical operator at a real pole, the full-state lift is \(L_f=[I;(z-D_f)^{-1}C_f]\). A source \(J_{fg}\) reduces to
\[
\Gamma_{fg}=L_f^\dagger J_{fg}L_g,
\qquad L_f^\dagger L_f=K_f'(z)
\]
in the Hermitian block convention. The current must include endpoint, mixed and hidden insertions. Mass-normalized weak transition residues supply physical flavour observables; their CKM/PMNS interpretation requires the selected three-generation infrared representation. No endpoint polar unitarization or supplied response matrix replaces the actual source derivative. Hidden determinants and their source contacts remain in loop responses after Feshbach elimination.

## 5. Four forces as source responses of the same object

The transfer carrier decomposes as
\[
\operatorname{End}(V_4)=4_{\rm geom}\oplus1_Y\oplus3_W\oplus(3'\oplus5)_C.
\]
The KO-6 algebra \(\mathbb C\oplus\mathbb H\oplus M_3(\mathbb C)\) and unimodularity supply the recovered \((SU(3)\times SU(2)\times U(1))/\mathbb Z_6\) gauge organization. Colour has the actual bracket \(\mathfrak{su}(3)=\mathfrak{so}(3')\oplus i\operatorname{Sym}^2_0(3')\); weak transport has its actual \(\mathfrak{su}(2)\) action. Their physical fermion/spin representations and normalized sources belong to the same action registry. The normalized-trace ratio \(g_Y^2:g_2^2:g_3^2=3/5:1:1\) is an archived bare trace statement; it does not independently fix a common physical residue.

| Force | Canonical source and physical observable |
|---|---|
| Electromagnetism | After Higgs reduction, \(Q=T_3+Y\), with electron \(Q_e=-1\) fixing the local Wilson phase \(\exp(iQ\int A)\). The transverse photon 1PI kernel and charged-current residues determine the physical coupling. |
| Weak | \(SU(2)\) links and their chiral fermion source derivatives. Gauge-boson and Higgs poles set the broken-phase spectrum; pole-normalized charged weak vertices determine flavour transitions. |
| Strong | \(SU(3)\) links on the \(3'\oplus5\) carrier and its fixed matter representations. The physical action/vertices and colour-singlet correlators determine running response and hadronic poles. Finite Lie closure does not itself prove confinement. |
| Gravity | The common coframe \(E\), \(g=E^TE\), varies scalar, gauge, fermion and heavy entries together. The source \(\Sigma=[3x_3x_3^T+5x_5x_5^T]_0\in\operatorname{Sym}^2_0(V_4)=4\oplus5\) is the recovered nine-component curvature/Ricci carrier. Physical stress is obtained by differentiating the same transfer; its conserved tensor correlator must produce the required long-range spin-two exchange. |

### Photon effective-action dictionary

A fixed-mean, locally gauge-fixed/transverse Legendre effective action defines \(\Gamma_\gamma\). In the electron-normalized field chart,
\[
\frac{P_\gamma\Gamma_\gamma^{(2)}(q)P_\gamma}{q^2}
\longrightarrow Z_\gamma P_\gamma,\qquad
\alpha_{\rm EM}^{-1}=4\pi Z_\gamma.
\]
For specified transverse Gaussian kernels,
\[
\Gamma_\gamma^{(2)}=K_{\rm bare}+\Pi,\quad
G_\gamma=(K_{\rm bare}+\Pi)^{-1},\quad
C_{\rm ext}=\Pi-\Pi(K_{\rm bare}+\Pi)^{-1}\Pi.
\]
These respectively describe the photon 1PI kernel, photon propagator, and screened matter-only external probe. Translating every central compact link occurrence, including \(H,W,P\) as applicable, gives an unrestricted variable-change trace and can have zero Hessian. That trace is not the fixed-mean photon effective action; the central-factor argument also does not automatically apply to unbroken noncentral \(T_3+Y\).

The October curvature-chart gate
\[
P_\gamma\mathcal J^\dagger g_{\rm BKM}\mathcal JP_\gamma
=\frac{\alpha_{\rm root}^{-1}}{4\pi}P_\gamma
\]
requires the actual density/curvature map \(\mathcal J\), action interpretation, contacts, photon projector, continuum measure and clock. A BKM norm alone is not the contact-complete 1PI Hessian. Its norm must be derived from that source, rather than solved backwards from the candidate \(\alpha_{\rm root}\).

### Derived whole-A4 Gaussian sector

For the specified twenty translated triangular faces on all \(13^4\)
momenta, the complete incidence has rank9 at nonzero momentum. Integrating
the six noncoframe link bands gives analytically

\[
Z_\gamma=\frac{\sqrt5}{2}c.
\]
Using the exact unit-HS hidden generator source gives
\(c=\eta_\Delta^2/\chi_{35}\) and \(Z_\gamma=0.837927858580\);
the algebra-unital source at the same fixed curvature gives
\(c=\eta_\Delta\tanh\eta_\Delta\) and \(Z_\gamma=6.703422868638\).
These are conditional unfitted actions with different source embeddings.
One triangular half alone has rank6 everywhere and its coframe Schur
kernel vanishes after the same six bands are integrated. The actual
translated face registry is therefore part of the specification.

The literal \(-\log w_\delta\) has a cusp, rather than a quadratic Taylor
Hessian. The Gaussian sector is not yet identified with the selected
interacting transfer. Its physical fixed-mean response is computed instead
from the full bounded-curvature covariance and its restricted Legendre
inverse, with the actual source, hidden51 determinant and physical clock.

### Common coframe and gravity dictionary

The new **supplementary source family**, conditional on the recovered A4 stencil, gives a concrete compatible deformation. With ten roots \(r_e\), \(v=\det E\), its scalar weights satisfy
\[
\sum_e w_e(E)r_er_e^T=5v g^{-1}.
\]
For the ten triangle bivectors collected in \(B_2\), \(B_2^TB_2=5I_6\), the positive full face-Hodge lift is
\[
\mathcal M(E)=v\Lambda^2(g^{-1}),\qquad
K_{\rm face}(E)=I_{10}+\tfrac15B_2[\mathcal M(E)-I_6]B_2^T.
\]
It retains the flat Wilson quadratic action and supplies all nine metric directions. The inverse coframe enters gamma directions and spin transports; common volume/dual-cell factors enter the remaining densities and momenta. This source family is constructed and tested. Its unused face directions and higher-curvature completion are not yet uniquely selected by the canonical law.

The common semiclassical interface contains \((16\pi G)^{-1}\int\sqrt g(R-2\Lambda)\). Its physical coefficient must follow from the same stress response/continuum map. A local horizon dictionary can relate entropy variation to null focusing only after identifying the physical stress flux, horizon state and area map; no independent area coefficient or Newton constant is inserted to close it.

### Current fixed-volume entropy and constrained source equation


The September 30 fixed-\(V\) differential entropy condition and October 2
withdrawal of spectral normalization govern the current physical route.
The spatial-ball interpretation follows the causal-diamond framework; the
bounded chat excerpts themselves write fixed volume without defining it
as a global four-volume. No global four-volume constraint is inferred.
For an identified conformal-vacuum modular stress on a small spacelike ball,

\[
\delta A|_V=-\frac{4\pi\ell^4}{15}\delta G_{uu},\qquad
\delta K=\frac{8\pi^2\ell^4}{15}\delta T_{uu}.
\]

Writing the derived area-entropy density as
\(\zeta_A=-2\eta_\Delta(\partial p_5/\partial A)_V\), stationarity gives

\[
\delta G_{uu}=8\pi G_{\rm ent}\delta T_{uu},\qquad
G_{\rm ent}=\frac1{4\zeta_A}
=-\frac1{8\eta_\Delta(\partial p_5/\partial A)_V}.
\]

The coefficient is a coframe/state derivative. The stronger recovered
nonlinear area law fixes that derivative on its declared physical source branch;
the reference population by itself does not fix it. A fixed identity or cross-rail modular source has
zero first-order population response; the diagonal mean rail-gap source
is needed for a nonzero area tangent. Coherences require the exact
relative-entropy correction, rather than binary population entropy alone.
Physical modular/stress, coframe/area and nonconformal identifications
remain explicit hypotheses. All-timelike local equations and conservation
give the tensor form and leave a cosmological integration constant.

For the actual selected transfer, \(\Omega_n=-\log\operatorname{Tr}T^n\),
each admitted common-source equation includes its transfer variation,
Einstein, potential, cosmological-density and state terms and any actual
constraint multipliers. All clock, measure, projector and support contacts
remain. The earlier v61 dictionary resolves the later overloaded
cosmological symbol: \(\ell_{\rm Cat}=B=-\Lambda_{\rm cc}/(8\pi G)\).
The statistical/Lorentz stress sign and induced/local Einstein matching
still require their declared physical dictionary.

For constraints \(g(P,s)=0\), use \(L=\mathcal F+\lambda^Tg\) and

\[
B=\begin{pmatrix}L_{PP}&g_P^T\\g_P&0\end{pmatrix},\qquad
\widehat{\mathcal F}_{ss}
=L_{ss}-\begin{pmatrix}L_{sP}&g_s^T\end{pmatrix}
B^{-1}\begin{pmatrix}L_{Ps}\\g_s\end{pmatrix}.
\]

The multiplier source contact is included. A joint field equation varies
the fields of a fixed action; it does not optimize unspecified action
completions. Actual64 shared-vacuum counterexamples and same-degree
positive completions establish this distinction.

The literal ten-face correlated K5 hat response is also now computed:
\(C_F=\delta^2tP_{\rm cycle}\), with rank6 and
\(t=0.1899851024\pm0.0000020774\) for one hat per face.
Its cycle Legendre stiffness is
\((5.2635706\pm0.0000576)P_{\rm cycle}/\delta^2\);
errors are scrambled-Sobol replicate standard errors. This is an exact
free-electric one-slice reduction with numerical integration of its
remaining correlated measure, not the full long-cylinder photon residue.
The geometric area pullback is \(5I_6/(4\delta^2t)\).

See Cathedral_Joint_Vacuum_2026-10-08.md and joint_vacuum_work/ in the
package for proofs, constrained variation tests, original replicate data
and source chronology.

### Combined nonlinear area law and round-screen realization


The September 28 entropy-depth relation, together with the retained negative
fixed-volume balance, gives

\[
H_2(p(u))=H_\star/u^2,\quad u=A/A_\star,\quad
\zeta_A=2H_2/A,\quad G_{\rm ent}=A/(8H_2).
\]

One binary entropy suffices for the factor eight. The earlier two-copy
assertion is corrected. Its reference ratio is G_star/A_star=1552.866263575,
without an assigned physical area unit. On the small-population branch the
inverse entropy fixes the full normalized rail state and all its contacts.
The entropy-depth coordinate is not identified with the onsite breathing
amplitude solely by their shared notation. The modular gap is q=log[(1-p)/p],
so dH=q dp away from the reference point. The normalized modular identity
contact cancels its Kubo–Mori metric in the normalized partition Hessian.

The actual metric hidden compression is differentiated with its moving
eight-dimensional frame. Its five spatial shear sources have nonzero
operator Jacobians despite vanishing reference scalar gradients. Binary
occupation and full quartet-splitting entropy are distinguished. A separate
round geodesic-ball completion holds physical spatial volume fixed and gives

\[
u(K)=1-R^2K/5-3R^4K^2/175+O(K^3),\quad
L_{\rm hid}^{\rm norm}(K)=L_0/u(K).
\]

Conditional on the incidence-to-screen identification, the exact required
clock is beta(u)=u q(u)/2. Its positive root exp[-beta L/2] reconstructs the
normalized state, including twelve equal commuting factors. At the reference
R²=phi+2 its normalized curvature contacts are beta_K=-5.12255484995 and
beta_KK=-2.61780764456. These are derived requirements and an explicit
realization of the recovered law, rather than a fitted Newton coefficient or
proof that the complete selected-transfer clock already has this loading.

The full twelve-phase signed-history real decoder has rank 18/kernel 46,
while premature retained 13 input has rank 5. The classical decoder kernel is
not the hidden 51 quantum sector. Raw chronological links telescope under
periodic endpoints; their polar and weighted-positive returns are separately
calculated and generally nontrivial. One declared common period-vacuum probe
has a positive eighteen-coordinate Hessian. The probe is not promoted to the
complete selected action. The actual signed cube's outer trace 0 differs from
the exterior-Fock outer trace 2 despite equal total A5 characters.

Explicit gauge matrices are calculated on the recovered exterior
family and its three-generation/conjugate 96 carrier, conditional on v61's
declared 3+2 split, compact gauging and physical family identification. Color, weak and
hypercharge commute there; the shared-five H13 frame is not itself that
product representation. Electron-normalized indices are (20,12,12) on 96,
so a common unweighted trace gives a 5/3 relative hypercharge index and 3/8
mixing ratio at the declared action scale. The common scalar coefficient,
selected matter embedding and running couplings are not fixed by this ratio.
Actual A5 End4 projectors and an orthogonal color-adjoint intertwiner give
the source pullback. The common-history decoded matrices enter covariant
48/96-state Higgs/Yukawa and link-current insertions with their source contacts.
These are explicit conditional joins, not recovered physical pole masses.

The literal correlated ten-hat free-electric sector now has an exact
multi-slice integral and a computed long-cylinder ground-state response.
For ag²=tau delta², all shared-edge correlations, equal-time contacts and
temporal returns are kept in a six-dimensional heat-kernel integral. At tau=1
the projected static coefficient is approximately 0.191964 and its inverse
5.20930 for F/delta; recorded refinement drift limits those estimates.
The leading frequency coefficient is 1/(5tau). Physical-time conversion
Gamma_phys(Omega)=Gamma_slice(aOmega)/a, followed by the triangle-area
pullback, gives the local electric kinetic coefficient 1/(4g²). It inherits
the Hamiltonian coupling and does not establish a full spatial photon pole.

For the regional entropy curve, G(u)/A_star=u³/(8H_star); a single state
trajectory does not prove a constant universal Newton coefficient. The
physical screen map, absolute selected action, clock prescription and
interacting observables remain explicit identities to test in that same
action. See Cathedral_Combined_Source_2026-10-08.md and combined_source_work/.

### Higher-order physical joins and exact critical dynamics

Reference constant-G stationarity is preserved: with G_star=A_star/(8H_star),
S_gen/H_star=2u+u^-2 is stationary at u=1. The recovered condition is
stationarity, not an additional maximum condition. A tangent coefficient
identified along every point of the full curve would instead vary as u³.

For that stronger variable-density interpretation, F=H/(pi A) gives
F'=−3F/2 and F''=9F/4. The sufficient local scalar/coframe action
integral sqrt(-g)[FR/2−Z(sigma)(grad sigma)²/2−V(sigma)]+I_m has equations
\[
FG_{\mu\nu}=T^m_{\mu\nu}+Z\partial_\mu\sigma\partial_\nu\sigma
-\tfrac12Zg_{\mu\nu}(\nabla\sigma)^2-Vg_{\mu\nu}
+\nabla_\mu\nabla_\nu F-g_{\mu\nu}\Box F,
\]
\[
Z\Box\sigma+\tfrac12Z'(\nabla\sigma)^2-V'+\tfrac12F'R+J_m=0,
\qquad \nabla^\mu T^m_{\mu\nu}=J_m\partial_\nu\sigma.
\]
Its Ward identity and null production coefficient are verified. The
Einstein-frame kinetic coefficient is F_ref[Z/F+27/8]. Integrated regional
entropy is constant−H, whereas Wald entropy is 2H: their missing contact is
A d(alpha)=3dH. Compensation −A d(alpha) is not exact on independent
area/scalar source space. Z,V and the entropy-depth/breathing identity are
not thereby selected. The supplied absolute rail trace without a scalar
offset has Gamma_sigma=1.62510477274 at the reference. This is not the full
canonical selected-action derivative; normalized entropy does not supply its
identity contacts or its scalar convention.

The previous linear A5 hidden8 gauge chart fails a quartic continuous-color
test despite its quadratic norm invariance. The physical16/96 group itself
remains closed. A conditional exact tensor source on hidden8 tensor parent5
is gauge covariant at all orders, preserves pure-geometry relative entropy
and reference-subtracted entropy, and adds inert ln5 to full entropy. Its
quadratic trace normalization is not a physical photon residue. A faithful
full finite-algebra left module has dimension6, a distinct source carrier.

Raw amplitude links with their radial metric are a flat coordinate chart
with cyclic generalized spectrum. The explicitly declared full768 positive
period graph and Fock Hamiltonian L/a instead give real one-particle field
energies and positive residues. Exact156/612 elimination retains hidden
frequency memory and the common-number Ward vertex K'(e). A uniform triplet
field sees more than three poles; bilinear current-transition poles are
different. These constructed field energies are not claimed to be canonical
charged masses. Reference-compatible radial choices change this observable;
an isolated degree-five deformation is invisible in the decoupled realization.

The recovered pure-U1 cosine supplies an exact first Duhamel magnetic
insertion inside the correlated electric evolution. At tau=1 its flux
Legendre derivatives are 0.8981104241 (static) and −0.1667104965 (frequency²).
All source endpoints, equal-time contacts, ground derivatives and physical
clock factors are kept. The complete translated20 A4 cosine Hessian has
bare transverse coefficient (sqrt(5)/2)b and passes its Ward identity at
all13^4 momenta. It is not the full interacting photon1PI residue; its static
two-spatial-polarization restriction does not prove a physical3+1 split.

The complete recorded rail instrument has B_plus=(P3+Delta P5)/sqrt(1+x)
and B_minus=(Delta P3+P5)/sqrt(1+x), x=Delta². From p_n=x^n/(1+x^n), eventual
critical hitting probability is 2p_n. At the reference it is
1.2392055341310765e-5; conditional mean is 1.0000123922089061 filter steps.
The unrecorded channel fixes every diagonal population. Repeated transition
formulas require fixed or transported rails. No deterministic reset follows.

The full fixed-volume round critical root is unique: K_c=.776297302715,
r_c=3.36715883089. It lies beyond the hemisphere and encloses99.8872% of the
three-sphere; a convex small-diamond branch cannot reach it. Exact expanding,
contracting and static FLRW completions share that intrinsic critical state
but have different trapping classes. Extrinsic curvature and stress complete
the causal datum. Recorded critical-to-reference selection has conditional
area ratio92.7950374701; the instantaneous critical round heat root B=I is
a different operation from the fixed nontrivial instrument.

See Cathedral_Physical_Joins_2026-10-08.md, sections43–50 of the continued
report, final_join_work/, and run_final_joins.py. The same canonical action
must still supply its coupled charged poles, full massless photon1PI residue
and universal metric simple-pole residue before these completions become
physical predictions. No measured anchors, generation cutoff or new physical
rate enters these calculations.

### Coupled chronological and source responses

The actual internal signed U8 exchanges P3 and P5, with U8^6=−I and U8^12=I.
Recorded word exponents alternate: m=sum_k[s_k xor((k−1) mod2)].
All4096 twelve-step words form13 binomial classes. The924 balanced words
return any input but do not prepare the critical state from every input.
From the retained reference, critical preparation requires m=(n+1)/2;
no even12 record prepares it. The preceding eventual-hit calculation is
for fixed or explicitly transported rails, not this fixed-frame signed
instrument. The unrecorded actual channel exchanges populations and
damps cross-rail coherence; its12-step fixed algebra has dimension32.

A conditional co-moving equal positive subdivision R=exp(−eta L/24),
B_k=U8^k R U8^(−k), C_k=U8 B_k gives M12=Bstar and M12†M12=Tstar.
The equal-load, endpoint and co-moving premises specify this repair;
they are not recovered canonical source entries. Nonuniform sources
give a mirrored24-half-step transfer, whose time Hessian differs from
an ordinary12-slice transfer despite its equal uniform endpoint sum.
Per-root scalar normalization changes the absolute action and contacts.

The electron-normalized Q chart has pure period6pi on quarks, with a
2pi rotation closed by a compensating color center. Primitive3Q has
period2pi; source angle rescales3 and coefficient9. Actual Q² indices
are4/3,16/3,32 on parent5,physical16,conjugate96. For Scont=Ccont,n
Tr_nF²/4, matching requires Ccont,5=4Ccont,16=24Ccont,96. The declared
ten/translated20-face continuum map is Ccont/Cloop=sqrt5/4 or sqrt5/2.
Charge and registry fix these conversions, not the common kinetic scale.

The conditional unital40 source K=eta(Kbar0+VF) with one fixed reference
obeys D(rho_etaF||rho*)=D(rho_eta0||rho*)+D(rho_etaF||rho_eta0)
+(eta*−eta)Tr[(rho_etaF−rho_eta0)Kbar0]. The extra mixed contact changes
the entropy-depth gauge derivative: fixed-reference5.36642048887e−5
versus moving-reference.180591045621, in the declared source chart.
The quadratic and quartic reference Q coefficients are1.99857456216
and8.56945851529. Information cost is not rawGamma or physicalphoton1PI.

The real16 cross-rail modular source has static generator KM=.0208476755337,
bare density metric47.9669783034 and eta²KM=.749465460810. Different
source placements have different temporal contacts. With an explicitly
declared symbolic physical clock a, continuous generator response is
Cphys(Omega)=tanh(Neta)(2eta/a)/[4((2eta/a)²+Omega²)] I16.
Its inverseOmega² coefficient is2a/[eta tanh(Neta)]. The endpoint
palindrome and ordinary temporal source agree only on uniform summation.

For the conditional full768 positive-period Fock realization, exact
bilinear current transitions obey the Lehmann response, KMS law and
double-commutator sum rule with their source second contacts. The
696 common complement contributes a thermal static zero-mode term;
finite-frequency uniform interspecies response belongs to the72 retained
states. Conserved total number has zero retarded and nonzero static
response. These current poles are not the one-particle field poles,
nor are the uniform probes identified with canonical charged vertices.

The sufficient common action FR/2−Z(grad sigma)²/2−V has a conserved
Einstein spin2 pole and an additional scalar when F varies. With
K=Z0+3F1²/(2F0), source amplitude is
(T1:T2−T1T2/2)/(F0p²)+(J1−F1T1/(2F0))(J2−F1T2/(2F0))
/[K(p²+m²)]. Entropy derivatives give K=Z0+27F0/8,
V1+3V0=0 and m²=(V2−9V0)/K. Minimal Z0=0 has local relative
Yukawa strength1/3. Curved backgrounds use DeltaL−2Lambda0, not
the flat global propagator. Constant-G reference variations remain
a separately retained route. Independent breathing and entropy depth
have a mixed scalar matrix resolvent; their identity is not assumed.

The canonical bare Wmin=−.25928083813026015 is unshifted. The optional
V=nu(sigma)Wb at b0 requires nu1=−3nu0 for scalar/coframe stationarity;
constant density does not supply it. Optional bare-only scalar poles
keep nu,Zb symbolic and do not replace the retained full vacuum.

The magnetic narrow-phase harmonic restriction has an exact correlated
Mehler transfer, whose small-parameter expansion retains the bridge
contact and prior first insertion. It remains a controlled restriction
of the compact cosine, not the complete interacting photon solution.

See Cathedral_Coupled_Responses_2026-10-08.md, continued sections51–59,
response_join_work/ and run_coupled_responses.py for exact sources,
reproduction, independent checks and explicit action-identification scope.

### Actual common-transfer source derivations

The original CAR/generation source is recovered literally, with
Tr(Co,a†Co,b)=8delta_ab and Tr(Ta†Tb)=delta_ab. Its original
M(G)=sum_ab G_ab Co,a tensor Tb therefore has
Tr(M†M)=8(|z_l|²+3|z_c|²). This is an August E/F source in its
original historical scope, not the missing corrected October F_can.
The v54 original hash agrees across manifests; failed archive transfers
do not prove its executable or the October source absent.

For the same full positive transfer, E=−n log T and rho_n=e^−E/Z_n,
the fixed-reference information Hessian is Cij=Cov_BKM(Ei,Ej),
while Gamma_ij=<Eij>−Cij. Exact positive equality requires
<Eij>=2Cij, with third contact <Eijk>=2sum_sym C(Eij,Ek)−3kappa.
Affine modular sources instead obey D^(k)=−(k−1)Gamma^(k).
Full normalized T plus clock and observables fixes normalized gaps
and correlators. A background-dependent conditional scalar generally
changes the full dynamical state; it is not a full-state normalization
freedom. Literal B fixes its contacts and normalization.

The actual translated20 A4 cosine tangent has exact spectrum
0;(5−|S|)x3;(5+|S|)x3;10x3, S=sum_5 exp(i alpha_i).
All28561 momentum matrices agree to2.31e−14. Gauss laplacian is
25−|S|². Unit-charge b=1/g² cancels g from oscillator band positions;
the chart electric/spatial coefficients are sqrt5/g² and sqrt5/(2g²).
Exact sinc coframe loading Jq=g and the temporal Gauss projector
preserve its longitudinal Ward identity. All-face Legendre pullback
recovers the entire Gaussian link inverse on its physical quotient.
Literal all20x13^4 hats are also computed on a Fourier-pair restriction,
with other modes fixed zero, retained refinement and cosine/tail bounds.
That restriction is not the full selected interacting marginal.

The literal v61 reflected192 Wilson restriction has full528-link sea
Hessian rank481, with Ward incidence residual5.10e−15; its
paramagnetic term alone violates Ward. Actual particle-hole currents,
noncentral Q=T3+Y, charged-Higgs mixed contact and hidden-site Schur
current/seagull/determinant splits are calculated. This structural
restriction is not the missing periodic v54 assignment, the hidden51
canonical matter response or a full selected photon inverse. The
archived HY/HF double-entry notation is recorded, not hidden.

Periodic Gauss sums require total charge of all charged fields zero.
PG psi_q PG=0 for q!=0; bare charged fields between projected transfer
factors do not provide a charged mass. A specified dressing, boundary
or traversed charge sector is required. FiniteQ96 neutral-fermion
counts are not factors of the full charged-field Gauss space. Charged
massless-photon limits may require infraparticle spectral thresholds,
not a mandatory isolated simple charged pole. Stable isolated
particles retain the earlier physical positive-residue pole criterion.

Actual moving20/hidden8 coframe jets keep their support contacts;
five shear eigenvalues−113.44311036=34.34925988−147.79237024.
The finite covariance uses transported support; ambient fixed-reference
relative entropy is infinite when the rank8 support leaves the old one.
The full13^4 bare radial harmonic stress has contact-complete static
shape Hessians and positive radial-pair residues, lowest TT-active
energy6.18201106617 in its chart. Log-metric versus linear-metric
conversion keeps the background-pressure contact. These external
stress kernels are not relabelled dynamical graviton inverses.
The closed all-timelike fixed-volume entropy interface is preserved:
with its physical area/modular stress/coframe identifications it yields
the Einstein principal equation and D_TT=32piG_ent P2/p².

These Hamiltonian restrictions use four graph coordinates plus a
transfer clock. The ambient-to-physical3+1 leaf/time identification
is not derived by deleting one q component or selecting two probes.
The full common physical source map must obey the selected-action
constraint stationarity equations, its coordinate second contacts,
Gauss/diffeomorphism Ward identities and physical spectrum conditions
simultaneously. Finite source checks do not certify Nature.
See Cathedral_Common_Action_2026-10-08.md, continued60–66,
common_action_work/ and run_common_action.py.

### Conserved boundary leaf and common physical clock

The literal fixed-b four-dimensional leaf is retained. The corrected external
symplectic map has a compatible global chart q=chi e_theta,
p=kappa^(-tau)e_vartheta, with a nondegenerate pulled symplectic form and
rank-four Poisson tensor annihilating db. It conserves D=q.p and
L=q1p2−q2p1. H_ext=(log kappa)D+alpha L generates its unit-parameter
dilation/rotation and cascade update; it is an indefinite unitary generator,
not the positive heat Hamiltonian or a derived laboratory clock.
The historical Anosov phase map and global spiral quotient remain distinct.

For an external conserved boundary label, measurable fibrewise H_b,
W_delta,b and P_G,b give T_b=B_b†B_b>=0 at the same clock a, under their
self-adjointness, lower-bound and heat-domain assumptions. This closes
conserved-sector positivity in the typed local action registry with no
added coefficient. Formal unbounded commutators alone are insufficient:
the Hamiltonian strongly commutes with the label multiplication algebra.
Single exceptional continuous labels require a specified fibre representative.
Internal P13/P51 memory can remain within this conserved b-fibre.
The literal U64 transports its co-moving Pk=U64^kP13U64^(-k) exactly;
fixed-frame leakage is not loss of the external boundary conservation.

An integral A4 height has A3 slices, six spatial/four crossing links and
eight spatial/twelve crossing translated faces. Its spatial cell volume2
and normal spacing sqrt5/2 multiply to sqrt5. This height is not b.
The induced A3 face spectrum is
0;(4−|S4|)x2;(4+|S4|)x2;8, on all2197 momenta.
Freezing crossing links in the full action gives Kss=K_A3+2I6 and
changes a leaf pure-gauge weight. Deleting crossing faces instead defines
a separate induced action. Honest crossing Schur and the full one-slice
Gaussian source marginal retain the Ward null; the latter averages all
13 normal momenta before taking the observed-covariance inverse.
Crossing bands include a gapless band, so they are not uniformly fast.
Its external-frequency contact is independently checked. The original
staggered square/triangle reflection construction is retained in its scope.

Unit inherited external-clock root tangents have speeds
(scalar sqrt(n),critical fermion n/sqrt2,photon1/sqrt2) times ell/a,
n5 for full A4 and n4 for induced A3. Full A4 tangent momenta retain
all ten roots; deleting inclined roots is a different action. Wilson
parameters remain symbolic, with E²=M²+(n²/2−nMr)q² plus retained
quartic source terms. Gapped curvature is not a rest-frame group speed.
One common unit/coordinate change cannot alter normalized cone ratios.
Under the additional bare common-cone premise with temporal canonical
terms and photon chart fixed, unique positive spatial weights are
z_s=1/(2n),z_f=1/n. These are derived conditions, not recovered canonical
coefficients or measured fits. Actual selected infrared principal kernels
must implement their own contact-complete matching. Geometric Euclidean
height time instead has equal electric/magnetic face coefficients sqrt5/2;
its positive time reconstruction is a distinct action/clock construction.

Exact retained dynamics uses K(z)=z−A−C†(z−D)^(-1)C and its full
lift normalization K_z=I+C†(z−D)^(-2)C. One-step heat compression differs
from exp(−aPHP) by a²PHQHP/2 at leading order; repeated projection is
a Zeno dynamics. Actual archived compact-source currents and A4 coframe
normal links verify all endpoint contacts, hidden determinants and the
positive frequency-memory correction J†P_GJ+M H_h^(-2)M†. These are
source elimination identities within their declared carriers, not a
replacement of the nonlinear current hidden51/species law.

The fixed-b component is resolved within the typed registry. Physical
coframe/time and complete nonlinear source identification remain the
simultaneous same-action stationarity, Ward, source-contact and physical
spectrum conditions. Retained all-diamond entropy/Einstein and charge
interfaces are preserved. See Cathedral_Physical_Leaf_2026-10-09.md,
continued67–73, leaf_geometry_work/ and run_physical_leaf.py.

### Geometric time reconstruction and joint history selection

The complete A4 Euclidean root actions have one unit geometric continuum
principal cone for scalar, gauge and fermion fields with a shared coframe.
No relative speed, physical mass or source normalization is fitted.
This is a conditional theorem about their stated bare principal limits;
the selected Hamiltonian transfer and interacting continuum remain separate.

For the A3 height, S4=R exp(i beta), A=24−R²+m² and the complete scalar
symbol is A−2R cos(omega−beta). Exact Mehler expansion proves the open
polar-frame Gaussian transfer positive, with cosh E=A/(2R), spacing
sqrt5/2 and unit infrared speed. The spatial polar phase is nonlocal and
leaves exp(−13i beta) in the original seam. The raw transfer is rotation
times positive heat; its polar square advances twice the height distance.
The finite determinant retains cos(13 beta) and the twisted trace.

The full gauge crossing Schur has the same height poles with rank-two
oblique face residues and instantaneous contacts retained. Unit-loading
magnetic coframe residue is |k|/sqrt5 times the two-polarization identity.
Fundamental-weight normal reflection is not a lattice involution. Its
finite reflected witnesses test that specified state; they do not reopen
canonical B†B positivity. Hat Fourier coefficients are nonnegative;
sqrtHat Fourier coefficients need not be, although sqrtW multiplication
remains positive. The prior staggered construction retains its scope.

Full Wilson height inversion retains the reciprocal-conjugate quartic,
matrix poles and source endpoints. c_D=5/sqrt2 fixes
psi_can=sqrt(c_D/(sqrt5 ell³)) psi_lattice and the height Fourier endpoint
factor sqrt10. Scalar polar transport cannot remove the matrix spin polar.
The full-root current and seagull cancel for a pure-gauge source.
Species, Higgs and wall matrices enter before inversion and projection.

Root-normal h=n4−n3 admits the exact Weyl reflection exchanging3and4.
Its rank-three slice lattices alternate between two transverse cosets;
three roots are spatial A2, six jump one height and one jumps two.
Two positive scalar source residues, including a negative one-height pole,
give site reflection positivity and a positive Gaussian two-height transfer.
Its distance is sqrt2 and infrared speed is one; both branches remain.
The original odd13 zero-spatial site form has one negative direction for
every m²>0 and lambda>0 by invertible Vandermonde congruence. A distinct
even26 cover is site positive, under an additional boundary prescription.

For root-normal literal r1 spin4 Wilson matter,
dplus=m0+7−3z/2−9/(2z)−1/z². For every m0>0 the cubic has roots in
(−1,0),(0,1),(1,infinity). The reciprocal high pole has a negative
minus-spin Dirac-reflected source at every positive height, including
every even separation. Scalar T² positivity does not repair this CAR
source. In the free scaling m0=(5/sqrt2)ell mphys, t=Nell/sqrt2>0,
5S_N(0)=exp(−mphys t)[Pplus+O(ell)]+O(exp(−ct/ell)), c>0.
Cutoff branches vanish without filtering in that free source limit;
their determinants and loop contacts remain required in the full action.
No interacting limit or exclusion of wall/mirror completions is claimed.

Exact normal-source detK_N=2R^N[cosh(NE)−cos N(theta+j)] retains current
and seagull derivatives. Source-dependent polar transport places the
source at the seam with connection, mixed and double-commutator contacts.
The physical conversion j=delta Q A gives Gamma_AA=(delta Q)²Gamma_jj
at fixed normal metric. Deleting contacts changes the admitted source.

The recovered hard rate-distortion law selects the positive spectral part
of C−tI, t=2eta. Actual P13's conjugated orbit has period2 despite U64's
period12. Its mean spectrum is0x46,3/8x5,5/8x5,1x8, with a derived
invariant rank13 bisector. Its rank18 orbit envelope differs from the
rank18 charged decoder envelope; their intersection has dimension10.
Phase-covariant selectors, spectral jets, common joint-species covariance
and mixed source contacts are retained. No diagnostic scale is selected
or fitted to force a desired rank.

Continued74–80 preserve the conserved boundary leaf, common-action
contacts and all-timelike entropy/Einstein interface. Full same-action
closure requires target-independent nonlinear charged history, joint
physical source map, selected vacuum and positive physical time.
Unavailable conversation access is not evidence that earlier work did
not exist. See Cathedral_Geometric_Time_2026-10-09.md,
geometric_time_work/ and run_geometric_time.py for the exact proofs.

### Canonical positive time and source admission

Canonical T_phys=B†B already defines positive operator time and physical
Hilbert source reflection on its positive support. For any specified finite
time circle N, the source kernel
Gij=Tr[T^(N−ti−tj) Ai† T^(ti+tj) Aj]/TrT^N
is the Hilbert–Schmidt Gram of Xi=T^ti Ai T^(N/2−ti),0<=ti<=N/2.
This holds with exact selector/Gauss zeros and noncommuting operator words.
In particular the original odd13 transfer circle is positive; its site
source form needs no replacement by an even cover. An internal thirteen-state
fibre does not set a physical thermal period. The hidden primitive rho_star
and rho13=T_hid^13/TrT_hid^13 are distinct; neither is assigned to the
arbitrary full physical transfer without its stated state prescription.

On supportT, H_T=−log(T/mu0)/a with fixed mu0=||T(0)|| defines the
heat semigroup and unitary real time. RawT=mu0 exp(−aH_T) and raw partition
normalization are retained. A source-dependent vacuum shift requires its
source contacts and cannot silently replace the full action. Null states
have no finite logarithmic energy. For injective heat,
ker T=ker(sqrtW_delta PG), without assuming PG/W commutation. Physical
charged observables still require dressing/boundary/charge-sector maps.
Equal-time support-to-kernel excursions remain endpoint contacts.
Ground-state source-channel spectral residue matrices are positive.
This establishes operator time; its coframe/leaf and continuum map is
separate from an arbitrary graph-height inverse or Pin adjoint.

At integer times, thermal numerators and TrT^N are matrix polynomials.
Their source jets include every endpoint/factor first derivative, same factor
second contact and both ordered distinct first insertions. For C=W/Z,
C_i=(W_i−C Z_i)/Z and
C_ij=(W_ij−C_i Z_j−C_j Z_i−C Z_ij)/Z.
Insertion labels are fixed; fixed proper-time sources also require their
admitted placement and clock contacts. The ordinary Fock adjoint for CAR
words does not establish a Grassmann or normal-Dirac reflection dictionary.
These jets remain smooth through a smooth transfer rank gain, although the
fractional halfword Xi need not be differentiable there. T=B†B forces
T_ii=B_ii†B+2B_i†B_i+B†B_ii. No current covariance alone replaces the
source Hessian. Actual declared T28 and operator endpoint jets verify these
integer word and normalization rules, without becoming the full action.

For two-sided positive source families, P=supportT,Q=1−P,Tplus=support
inverse give QTiQ=0 and QTiiQ−2QTiP Tplus PTiQ>=0. For constant rank,
QTijQ=QTiP Tplus PTjQ+QTjP Tplus PTiQ exactly. Rank gain has only
directional positive Schur excess; no complete source-index block positivity
is inferred. Kato support transport along one path uses Omega=[Pprime,P],
Omegaprime=[Psecond,P]. Its first and second transformed T derivatives
include the single, mixed, double and connection-derivative commutators.
All 36 actual hidden coframe mixed contacts and 6 transported paths agree. Omitting
second contacts makes moving-support affine truncations indefinite.

The complete ten-root Euclidean Wilson rest inverse with uniform r>=0,
m0>0 and fixed normal Dirac source adjoint has a negative even-height
minus-spin moment at some positive separation for every r. Exact real,
complex, pure imaginary and repeated pole cases cover the family. This closes
the uniform coefficient repair of that diagnostic; it does not contradict
canonical B†B. Actual archived v61 wall entries have a different temporal
Clifford and hopping placement and fixed rational r, with a specified wall endpoint.
Its domain-wall m0=−M_arch<0 also differs from the theorem's m0>0 domain.
They are preserved historical entries, not the corrected October selected
species-first source action. No coefficient is tuned and no branch is deleted.

Admission of a Euclidean representation requires the actual source adjoint,
state, boundary, time and coframe conversion and every admitted source derivative
to intertwine the canonical transfer correlators. Any admitted marginal of a
positive source Gram is positive. Thus the earlier negative odd13 Euclidean
scalar reflection cannot be the same canonical thermal representation under
that proposed adjoint and state. The canonical positive time component is closed;
the interacting geometric leaf source/time identification remains a separate
construction. Retain hidden determinants, endpoint contacts and memory after
reduction. These results preserve earlier closed components and entropy
normalizations. See Cathedral_Canonical_Time_2026-10-09.md,
continued81–85, physical_time_work/ and run_canonical_time.py.

### Archived exponential coefficient: conditional branch mathematics

The following coefficients are retained only as mathematics of the specified exponential branch. Later entropy/coframe corrections supersede their use as the current physical normalization of gravity. The unconstrained homothety result below does not apply to the current fixed-volume entropy variation.


The scalar-free exponential common-trace action, on the internal96/Dirac384
carrier with unified generator index12, gives after gauge normalization

\[
S_{\rm sp}=\int\sqrt g\left[
\frac{12\Lambda_{\rm grav}^4}{\eta_\Delta^2g_U^2}
-\frac{\Lambda_{\rm grav}^2}{\eta_\Delta g_U^2}R
+\frac{F^2}{4g_U^2}+\cdots\right],\quad
\frac{G\Lambda_{\rm grav}^2}{g_U^2}=\frac{\eta_\Delta}{16\pi}.
\]
Around a stationary flat background in the low-curvature regime, the leading
Einstein inverse is

\[
D_{\rm EH}=\frac{2\eta_\Delta g_U^2}{\Lambda_{\rm grav}^2p^2}
(P_2-\tfrac12P_{0s}).
\]
Common-coframe stress vertices give the universal Einstein numerator and
\(-Gm_1m_2/r\). This derives the retained branch coefficient and conditional
exchange without a new Newton amplitude.

The same action has a nonzero volume tadpole. Its a0+a2 stationary curvature
would obey \(\eta_\Delta R/\Lambda_{\rm grav}^2=24\), beyond that truncation.
Exactly, the standalone fixed-cutoff massless exponential trace increases
strictly under uniform coframe dilation when any nonzero Dirac mode is
present. It has no unconstrained homothetic stationary vacuum. The full
recovered Cathedral interface, breathing/Higgs/heavy and state terms must
therefore enter the joint vacuum equation; their cancellation or volume
constraint is not supplied by the extracted Einstein coefficient.

This conditional trace is not proved equal to \(-\log\operatorname{Tr}T[g]^n\).
The selected transfer still contains \(W_\delta\), Gauss projection and all
interacting fields. Its action/clock/coframe identification and stationary
vacuum must be derived before the conditional residue becomes the physical
metric pole. The cutoff and cosmological curvature scales are distinct.
## 6. URT selection, entropy and force stiffness

The recovered rails define
\[
d_{\rm cl}=3/20,\quad d_\star=\frac{80\pi}{1053\phi},\quad
\Delta=d_{\rm cl}-d_\star,\quad\eta_\Delta=-\log\Delta.
\]
On the two rank-four hidden quartets,
\[
K_{\rm hid}=3P_3+5P_5,\qquad
\rho_\star=\frac{P_3+\Delta^2P_5}{4(1+\Delta^2)},\qquad
p_\star=\frac{\Delta^2}{1+\Delta^2}.
\]
The selected-state BKM density-tangent stiffness is
\[
\chi_{35}=8\eta_\Delta\frac{1+\Delta^2}{1-\Delta^2}.
\]
It is shared through the correctly typed source pullbacks. In the recovered generator chart, the Gibbs conversion instead gives \(\kappa_{\rm ent}=\eta_\Delta^2/\chi_{35}\). The reciprocal metrics refer to different coordinates and must not be identified without that map.

For \(\rho(p)=((1-p)I_4\oplus pI_4)/4\),
\[
H_2(p)-H_2(p_\star)
=2\eta_\Delta(p-p_\star)-D(\rho(p)\|\rho_\star).
\]
The entropy first law is the tangent of this exact identity. Critical mixedness \(\rho_c=I_8/8\) requires its finite relative-entropy correction. For a full-rank differentiable Gibbs source,
\[
\Omega''=\beta\langle H''\rangle
-\beta^2\operatorname{Cov}_{\rm KM}(H',H')
=\beta\langle H''\rangle-g_{\rm BKM}(\rho',\rho').
\]
Thus entropy geometry constrains force response through the source map and contacts of the same action; it does not separately assign four coupling constants.

The recovered coherent return uses \(C_h=U_8e^{-\eta_\Delta K_{\rm hid}/2}\), with \(C_h^2=e^{-4\eta_\Delta}U_8^2\). Its conditional two-step return of critical hidden mixedness has success probability \(\Delta^8\). Conditional return, ignored-outcome evolution and deterministic attraction have distinct meanings. No bath rate or cosmological bounce is added to this canonical statement.

## 7. Inputs that make this specification uniquely computable

The following are typed recovery/derivation requirements, not fit parameters:

1. The exact canonical \(\phi^{-2}\) species-loaded64-state generator, its primitive charge embedding, signed ordering, selected-vacuum rule, and map into the local matter/wall/Yukawa entries.
2. The complete source registry and physical charged-field/current maps, including Gauss-compatible dressing, source contacts, hidden determinants, photon fixed-mean prescription and common coframe dependence of all transfer factors.
3. The dimensional clock/cutoff conversion and cell-to-continuum measure; the relation of the fixed modular \(\eta_\Delta\) to physical time must be specified rather than assumed.
4. The selected physical support, volume/boundary conditions, Lorentz continuation and interacting continuum/refinement map needed for particle, gauge and stress poles.
5. The selected-transfer photon and spin-two residues, its stationary joint vacuum equation including volume contacts, and the entropy-to-horizon/area dictionary if used. The supplementary coframe lift is a valid source family to compare against the canonical one, not an independently fitted normalization.

This is a coherent candidate theory specification. Its finite carrier identities, positive-transfer construction and source bookkeeping are explicit. The golden source/completion proofs, full-period rank18 decoder, explicit physical gauge matrices, nonlinear entropy–area curve and positive round-screen realization, metric hidden contacts, correlated long-cylinder electric response, fixed-volume entropy tensor relation and contact-complete constrained equations are derived with their declared scopes. The archived exponential coefficients remain conditional branch mathematics. Unique computability and empirical closure require the listed canonical inputs and physical limits.

## Source anchors

- Exact carrier, old charge architecture and Hamiltonian: [v102](../recovery/Newton_Cathedral_v102_SixBit_History_A5_Decomposition.md), [v113](../recovery/Newton_Cathedral_v113_URT_Selected_History_Vacuum_SelfEnergy.md), [v115](../recovery/Newton_Cathedral_v115_URT_Solution_Closure.md), [v129](../recovery/Newton_Cathedral_v129_Universe_Fallout_Symbiotic_Theorem.md), and the [recovery provenance ledger](../recovery/latest_operator_recovery_2026-10-08.md). Latest October history corrections are root’s dated chat recovery, explicitly distinguished there from independently fetched source text.
- Actual source-response distinctions: [photon dictionary](../photon/source_dictionary_report.md), [hidden loop/contact dictionary](../feshbach_loop/feshbach_loop_report.md), and [signed-history pole scope](../history/signed_history_poles_report.md).
- Supplementary common-metric source: [coframe and stress calculation](../gravity/Common_Coframe_Stress_2026-10-08.md). Entropy and coherent-return identities are retained in `Cathedral_Rederivation_2026-10-08.md`, `entropy_work/entropy_gravity_join.md`, and `canonical_return_work/Canonical_Return_Reconciliation_2026-10-08.md` in the continuation package.

- New derivations and independent source/geometry review: `Cathedral_Three_Derivations_2026-10-08.md` and `derive_three_work/` in the continuation package.