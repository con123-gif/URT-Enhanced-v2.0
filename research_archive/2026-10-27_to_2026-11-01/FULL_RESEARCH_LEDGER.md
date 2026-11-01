# Newton's Cathedral / URT — research ledger, 27 October to 1 November 2026

Original mathematical work and research directions preserved without replacing earlier files. The five-calendar-day working window spans roughly 27 Oct afternoon through 1 Nov afternoon UK time. Where a result predates that window, it is included as necessary mathematical context, not represented as newly discovered. The word "theorem" here means a proposition within a specified finite model, *not* a verified law of nature.

## A. Non-reduction rule and frozen inputs

The Cathedral is **not** just its 13-state icosahedral projection. Its full architecture includes all five Platonic solids and their duals, the 190-dimensional Hodge chain space, A5 / D6-to-H3 geometry, centred H13 and complementary H51 in the 64-history carrier, the 24-track cyclic ordering, hidden 4_3 and 4_5 sectors, six-axis hypercube and hexagonal processes, Golay/Leech candidates, and positive transfer B†B with BKM/KMS response. Do not use a local 13-cell calculation as proof of a global closure.

Fixed working seeds:
\[
D=3,\quad |A_5|=60,\quad (V_I,E_I,F_I)=(12,30,20),\quad
N_{\rm visible}=13,\quad\gamma=\frac1{81},\quad
\phi=\frac{1+\sqrt5}{2}.
\]
\[
\delta_\star=\frac{80\pi}{1053\phi},\quad
\delta_{\rm class}=\frac3{20},\quad
\Delta=\delta_{\rm class}-\delta_\star
\simeq0.002489189840420,\quad
\eta_\Delta=-\ln\Delta\simeq5.9957979867.
\]
\[
\rho_\star=\frac{I_4\oplus\Delta^2I_4}{4(1+\Delta^2)},\qquad
p_5=\frac{\Delta^2}{1+\Delta^2},\qquad
\chi_{35}=\frac{8\eta_\Delta(1+\Delta^2)}{1-\Delta^2}
\simeq47.96697830.
\]
The \(\Delta\), \(\phi\) and other inputs above define the finite model. Their *physical selection from an unconstrained process* remains a separate problem. Reported fine-structure candidate:
\[
\alpha^{-1}_{\rm candidate}(0)=137+\frac{17572}{1215}\Delta
-\frac9{65}\Delta^2\simeq137.035999178.
\]
The coefficient \(17572/1215\) is **not derived** from a proven first-principles physical operator. Numerical proximity to measurement does not establish a zero-fit prediction.

## B. Proven finite algebra and dynamics

### B1. Full five-Platonic Hodge complex (27–30 October)

For each Platonic surface cellulation \(P\), define
\(C_2(P)\xrightarrow{\partial_2}C_1(P)\xrightarrow{\partial_1}C_0(P)\),
with \(\partial_1\partial_2=0\). Define
\(D_P=\partial_1+\partial_1^\dagger+\partial_2+\partial_2^\dagger\)
on \(C_0\oplus C_1\oplus C_2\), where incidence maps are placed in the appropriate blocks. Then
\[
D_P^2=\Delta_0\oplus\Delta_1\oplus\Delta_2,\qquad
\operatorname{Tr}D_P^2=8E,\qquad
\operatorname{Tr}D_P^4=2\bigl(\operatorname{Tr}\Delta_0^2+\operatorname{Tr}\Delta_2^2\bigr).
\]
Each solid is a sphere, so \(\dim\ker D_P=2\). For regular vertex degree \(d\) and face perimeter \(k\):
\[
\operatorname{Tr}D_P^4=2\bigl[Vd(d+1)+Fk(k+1)\bigr].
\]
The table is exact:

| Solid | V | E | F | chain dim | Tr D² | Tr D⁴ |
|---|---:|---:|---:|---:|---:|---:|
| Tetrahedron | 4 | 6 | 4 | 14 | 48 | 192 |
| Cube | 8 | 12 | 6 | 26 | 96 | 432 |
| Octahedron | 6 | 12 | 8 | 26 | 96 | 432 |
| Dodecahedron | 20 | 30 | 12 | 62 | 240 | 1200 |
| Icosahedron | 12 | 30 | 20 | 62 | 240 | 1200 |
| **Total** | **50** | **90** | **50** | **190** | **720** | **3456** |

Thus \(\operatorname{Tr}e^{-tD^2}=190-720t+1728t^2+O(t^3)\). Total nullity is 10 before couplings. These statements are about finite cell complexes.

### B2. Icosadodecahedral incidence / hidden representations (28–29 October)

For the incidence \(B\) between icosahedral vertices and faces (conventions must match), the investigated identities are
\(BB^\top=5I+2A_I\) and \(B^\top B=A_D(A_D+2I)\),
giving rank 12 and an 8-dimensional hidden kernel, decomposed as \(4_3\oplus4_5\). On the hidden space:
\[
L_{\rm hid}=3P_3+5P_5,\qquad
e^{-\eta_\Delta L_{\rm hid}}=\Delta^3(P_3+\Delta^2P_5).
\]
Normalizing the trace gives the frozen Gibbs state \(\rho_\star\).
The KMS presentation uses \(\beta=2\eta_\Delta\) with the two-level Hamiltonian \(H_5=P_5\). This is an exact finite Gibbs construction, not an experimentally measured thermodynamic temperature.

### B3. H64 exact hidden-history memory (31 October)

In the six-axis 64-history construction,
\[
\mathcal H_{64}=\mathcal H_{13}\oplus\mathcal H_{51},\qquad
\operatorname{spec}(H_8)=\{0^{(2)},10^{(12)},16^{(30)},18^{(20)}\}.
\]
For block \(H_\lambda=\begin{pmatrix}A&C\\ C^\top&D\end{pmatrix}\) and Euclidean evolution with hidden initial amplitude zero,
\[
\dot u(t)=-Au(t)+\int_0^t Ce^{-(t-s)D}C^\top u(s)\,ds.
\]
For general hidden initial data add \(-Ce^{-tD}w(0)\). In the repository's fixed geometric coupling:
\[
\operatorname{spec}(CC^\top/\lambda^2)
=\{12^{(2)},8^{(6)},(19/5)^{(5)}\}.
\]
With \(d_-=10+\lambda(6-2\sqrt5)\) and
\(d_+=18+\lambda(6+2\sqrt5)\), for \(\lambda>0\) and \(t\ge0\):
\[
\frac{19}{5}\lambda^2 e^{-td_+} I_{13}
\preceq Ce^{-tD}C^\top
\preceq12\lambda^2 e^{-td_-} I_{13}.
\]
These results have already been committed in the H64 proof documents/scripts linked from README. They do not determine the *physical* choice of \(\lambda Q\), a continuum limit, or a non-Abelian Yang–Mills gap.

### B4. Transfer and 24 tracks (27–31 October)

For any positive contraction \(T_\star\) with spectrum in \((0,1]\), the spectral functional calculus yields
\(T_t=T_\star^t=\exp(-tH_\star)\),
\(H_\star=-\log T_\star\succeq0\). Claims of *uniqueness* require specifying the continuity and semigroup assumptions; the functional calculus formula alone is not a physical time law.

The URT complex seed used in the history calculations is
\(q=(\pi/e)\exp(i2\pi/\phi^2)\); the natural 24-sector angular step is \(2\pi/24=15^\circ\).
The recursion \(x_{n+1}=(1-x_n)/(2-x_n)\), \(x_0=0\), gives
\(x_{24}=46368/121393\), tending to \(\phi^{-2}\).
A 24-cycle operator with gap \(2-2\cos(\pi/12)\simeq0.0681483474\) is a valid finite cyclic spectral construction; deriving it uniquely from the full source-loaded Cathedral action remains open.
The previously investigated 64-history golden-angle interference and 24-ordering selection should be treated as computed candidate dynamics, not a deduction of the electromagnetic coupling.

### B5. Five-solid interacting positive slice (28 October)

Previously checked model:
\[
V_{\rm eff}=\tfrac29\|h_3\|^2+\tfrac7{32}\Delta^2\|h_5\|^2,\qquad
V(t)=3t^2+\left(\frac4{45}+\frac7{240}\Delta^2\right)t^4.
\]
A restricted positive transfer/discretized finite-volume kernel yielded numerical logarithmic gap near 2.0809418 under its stated discretization. This is **not** a volume-independent gauge-theory mass gap or a Standard Model derivation. Source: the already committed interacting-field and slice-transfer files linked in README.

### B6. Hypercube, 360 states and rhombic-triacontahedral extensions (31 October)

Additional results reported in the five-day work: four-cube chain ranks \((15,17,7,1)\) and eigenvalues \(\{0^{(15)},4^{(6)},6^{(8)},8^{(3)}\}\) for its chosen operator; 64 binary histories grouped in 12/20/20/12 shells; a 13+51 invariant split; exact finite Seidel rank-3 projectors; a 360-ordering construction; a 32-vertex two-shell rhombic triacontahedral projection with reported Hodge dimension 122, traces 480 and 2400, and a radial gap \(3-\sqrt5\). These are preserved as **reported model-specific computations**, not re-proved by this archive's seven-test script. Refer to their original working notebooks/logs for precise operator definitions before promoting them to new theorems. Scaling candidate:
\(\mathcal D_a=\nabla^2+\frac{a^2}{40}(\nabla^2)^2+O(a^4)\)
requires explicitly stated refinement hypotheses.

## C. N-throat common-state extension (30 October)

For \(N\ge2\) use the all-ones vector \(\mathbf1_N\):
\[
P_c=\frac{\mathbf1_N\mathbf1_N^\top}{N},
\qquad P_r=I_N-P_c,\qquad
T_{\Delta,N}=P_c+\Delta^2P_r,\quad
-\log T_{\Delta,N}=2\eta_\Delta P_r.
\]
Projectors are complementary and the eigenvalues of \(T_{\Delta,N}\) are \(1\) (once), \(\Delta^2\) (\(N-1\) times). The proposed full coupled spectral family was summarized by
\(\operatorname{Tr}K_N=100N+104\) and
\(\operatorname{Tr}K_N^2=560N+706\);
at \(N=2\), 304 and 1826. This moment formula depends on the specified coupled operator; it does not follow from the two projectors alone.

With \(L_{\rm hid}=3P_3+5P_5\) (each rank 4), set
\(K_{\rm hid}^{(N)}=L_{\rm hid}\otimes I_N+2I_8\otimes P_r\).
Then
\[
\operatorname{spec}K_{\rm hid}^{(N)}
=\{3^{(4)},5^{(4N)},7^{(4(N-1))}\},
\]
\[
e^{-\eta_\Delta K_{\rm hid}^{(N)}}
=e^{-\eta_\Delta L_{\rm hid}}\otimes(P_c+\Delta^2P_r),\qquad
Z_N=4\Delta^3(1+\Delta^2)[1+(N-1)\Delta^2].
\]
The *normalized* state factorizes:
\[
\rho_\star^{(N)}
=\rho_\star\otimes\frac{P_c+\Delta^2P_r}{1+(N-1)\Delta^2}.
\]
Total common/relative probabilities:
\[
p_c=\frac1{1+(N-1)\Delta^2},\quad
p_r=\frac{(N-1)\Delta^2}{1+(N-1)\Delta^2}.
\]
Formal crossover at real
\[
N_\star=1+\Delta^{-2}\approx1.614\times10^5.
\]
At the crossover \(p_c=p_r=1/2\) and **binary partition entropy** \(H_2(p_r)=\ln2\).

**Important correction:** the entropy of the full normalized \(N\)-dimensional throat density matrix is
\[
S_{\rm throat}=H_2(p_r)+p_r\ln(N-1).
\]
Thus at crossover it equals \(\ln2+\frac12\ln(N_\star-1)\), **not simply \(\ln2\)**. The total product-state entropy also adds \(S(\rho_\star)\). Since \(N_\star\) is generally nonintegral, crossover is an exact formal interpolation; physical throat counts are integers.

A proposed 5D horizon extension distinguishes \(r_H\ll L_5\) (5D area \(2\pi^2r_H^3\), \(r_H\propto\sqrt{M}\) under 5D Einstein gravity) from \(r_H\gg L_5\) (4D long-distance behavior). Candidate \(L_5/\ell_P\) scales include \(\Delta^{-1}\) and \(\Delta^{-2}\). These are **conditional**, not derived compactification radii or established primordial-black-hole predictions. The claimed resonance with generation carrier \(3\oplus3'\), hidden tower 3/5/7 and preferential neutrino emission also remains a candidate interaction-selection mechanism requiring a dynamical calculation.

## D. New dual-Platonic so(5,C) / Berry theorem (1 November)

This is an internally constructed response to a user-supplied diagram; **no outside text, image or manuscript is copied**.

### D1. Exact local symmetry

Icosahedral vertex graph Laplacian has a five-dimensional \(A_5\)-irreducible eigenspace at eigenvalue 6. The dodecahedral vertex graph Laplacian has an equivalent five-dimensional irrep at eigenvalue 2. Thus the direct sum of these *two chosen eigenspaces* is
\(\mathcal E=V_5^{(I)}\oplus V_5^{(D)}\simeq V_5\otimes\mathbb C^2\).
For an orthogonal 5-space,
\[
\mathfrak{so}(5,\mathbb C)\simeq\Lambda^2(V_5^\mathbb C)
\simeq \mathbf3\oplus\mathbf3'\oplus\mathbf4
\quad \text{as }A_5\text{ modules}.
\]
Character proof: \(\chi_{V_5}=(5,1,-1,0,0)\) on conjugacy-class orders 1,2,3,5a,5b, and
\(\chi_{\Lambda^2V}(g)=[\chi_V(g)^2-\chi_V(g^2)]/2
=(10,-2,1,0,0)\), the sum of the characters of 3, 3' and 4.

By Schur's lemma the \(A_5\) commutant on \(\mathcal E\) is \(M_2(\mathbb C)\), so all invariant Hermitian endomorphisms have the form \(I_5\otimes(aI_2+\mathbf h\cdot\boldsymbol\sigma)\) after an intertwining identification.

### D2. Exact positive transfer family

For \(\mathbf n\in S^2\):
\[
P_\pm(\mathbf n)=\tfrac12(I_2\pm\mathbf n\cdot\boldsymbol\sigma),\qquad
T(\mathbf n)=I_5\otimes[P_+(\mathbf n)+\Delta^2P_-(\mathbf n)].
\]
It is positive definite, \(T=B^\dagger B\) for \(B=T^{1/2}\), and
\[
-\log T=2\eta_\Delta I_5\otimes P_-(\mathbf n).
\]
Crucial qualification: this family is **chosen compatibly** with \(A_5\) and the frozen gap. It has **not** been shown to follow uniquely from the original full Cathedral transfer \(B_\star\).

### D3. Berry curvature and topological charge

On the positive-eigenvalue rank-five bundle over \(\mathbf n=(\sin\theta\cos\varphi,\sin\theta\sin\varphi,\cos\theta)\), convention
\(\Omega=-i\operatorname{Tr}P\,dP\wedge dP\) gives
\[
\Omega_+=\frac52\sin\theta\,d\theta\wedge d\varphi,\qquad
c_1=\frac1{2\pi}\int_{S^2}\Omega_+=5.
\]
This is an exact Chern number **for this parameterized spectral family**. It does not prove electric charge five, a dark sector, or spacetime topology. The sign reverses for opposite Berry conventions / opposite eigenbundle.

For equatorial spinors \(u_k=(1,e^{2\pi ik/24})^\top/\sqrt2\), the 24-link cyclic product is
\[
\prod_{k=0}^{23}\langle u_k,u_{k+1}\rangle
=-\cos^{24}(\pi/24),\quad u_{24}=u_0.
\]
Therefore its normalized Berry phase is \(-1\), and the determinant holonomy of five copies is \((-1)^5=-1\). The **equatorial path is chosen**, not proved to be selected by the full Cathedral dynamics. This is a 24-step *construction*, not a universal prediction of arbitrary 24-track evolutions.

### D4. What the diagram does *not* establish

Complexifying Lorentz-signature algebras can place de Sitter and anti-de Sitter real forms into a common complex setting. Complexification by itself does not establish a physical dS-to-AdS transition, torsion-sign selection, non-orientable wormhole, electron vortex, particle-free dark matter, emergent Einstein dynamics or chirality. No external diagram text or other person's source code is reproduced here.

## E. Other research threads and explicit open gates (27 Oct–1 Nov)

- **URT process / phi / pi / e:** explore natural expansion, angular packing, transfer selection and golden-angle histories, rather than imposing experimental parameters. The recursion and symplectic/golden-angle tests are mathematical processes, not a first-principles alpha derivation.
- **Fine structure:** the frozen candidate polynomial is a model formula; unexplained coefficient and physical scale matching remain open.
- **Fermions and flavours:** \(H_{64}=H_{13}\oplus H_{51}\), generation carrier \(3\oplus3'\), hidden coherent shells and charge words were investigated; published Standard Model Yukawa matrices, Koide selection and physical mixing have not been uniquely derived.
- **Gauge / Yang–Mills:** separate an exact positive finite transfer or finite Gaussian spectral gap from the continuum Yang–Mills existence/mass-gap problem. A derivation of gauge group, locality, reflection positivity, volume-independent physical spectral gap and interacting continuum limit is still required. No James/Forest Gauge research included.
- **Gravity:** investigated collective-force thesis (“gravity is the aggregate effect of other forces”), BKM stress and scalar curvature action with \(\lambda_{\rm rad}=13\), \(\chi_{35}\), and 5D throat proposal. The Newton constant, massless spin-2 coupling, equivalence principle and Einstein field equations are **not** derived from the finite operators.
- **Spacetime:** proposed transition from finite Euclidean operators to Lorentzian Clifford and \(3+1\) field dynamics, but physical time, causal nets and universal continuum coupling are not yet fixed.
- **Neutrinos:** candidate normal ordering, geometric mixing and near-zero lightest mass require independent experimental tests; reported model numbers are not evidence of confirmation.
- **Hypotheses vs proof:** claims of “universe falls out”, complete zero-parameter closure, discovered gravity, or solved Yang–Mills must remain conditional until the actual physical bridge is rigorously established.

### Required next theorem — do not substitute with a fitted ansatz

From the *complete* URT-history / all-five-Platonic / D6-H3 / hypercube-hexagonal / 24-fold / H64 source operator, derive a canonical parameter trajectory \(\mathbf n(x,t)\), a unique local continuum limit with correct positivity and causality, and a physically normalized action. Prove the observable gauge/matter/gravity laws and recover mass scales without inserting experiment-derived constants. Disprove candidates that fail; retain exact finite results independently.

## F. Provenance and preservation policy

- Dated record synthesizes original Cathedral work from the working conversations and existing repository material. It is not a verbatim chat transcript or reprint of any external paper.
- Existing linked repository files were present when this ledger was authored. The archive changes no prior path.
- All computations in the accompanying seven-test script were executed locally and passed on 1 November 2026 with Python/numpy.
- The new so(5,C) / Berry construction is algebraic, and its physical identification is explicitly unresolved.
- Do **not** import, add, reproduce or represent James's Yang–Mills/Forest Gauge research as Cathedral research. No external author's material is included in these newly added files.
