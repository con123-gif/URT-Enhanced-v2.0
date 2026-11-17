# Newton's Cathedral — Golden Spiral -> Closure Frustration -> URT/rails: direct calculation

**Date:** 2026-11-17. **Status:** Executed numerical linear-algebra tests, exact SymPy identities and finite-complex proofs. No measured physical parameters fitted. Local calculation only: no GitHub write.

## Question, and what has actually been demonstrated

Test the proposal that the golden spiral is primitive and its inevitable nonclosure **is** the frustration and signed asymmetry; URT coupling and the rails then emerge from it. The results distinguish: (i) mathematically forced golden winding obstruction; (ii) positive transfer / hidden quartet emergence for a specified native-size magnetic complex; (iii) a viable but not unique representation of the historical rails; and (iv) genuinely missing implications, especially the historical URT radial factor and physical matter–antimatter conversion.

The primitive golden angle used in URT is `alpha=phi^-2`, `phi=(1+sqrt(5))/2`. A golden angular step is `omega=2*pi*alpha`. **Golden angular phase alone does not prescribe a spiral's radial pitch.**

## Theorem 1 — Exact octahedron/24-track golden closure obstruction

Since `phi^2=phi+1`,

\[
8\alpha-3=9-4\sqrt5=\varphi^{-6},\qquad
13\alpha-5=-\varphi^{-7},\qquad
21\alpha-8=\varphi^{-8}.
\]

Therefore
\[
24\alpha=9+3\varphi^{-6},\quad
\epsilon_{24}=2\pi(24\alpha-9)=6\pi\varphi^{-6}=1.0504497488714\ \mathrm{rad}.
\]

The local octahedral eight-face mismatch is
\[
\delta_{8}=2\pi(\alpha-3/8)=\frac{\pi}{4\varphi^6}=0.0437687395363084\ \mathrm{rad},
\]

also equal to the residual per 24-track step when that clock is taken as three octahedral circuits. Original Q101 24-track affinity has an exact algebraic rewrite
\[
\epsilon_{\mathrm{Q101}}=\frac{\pi}{3\varphi^{12}}=\frac\pi3(8\alpha-3)^2=0.00325219767480369.
\]

**What follows:** the golden power `phi^-12` is the squared 8-face angular closure mismatch. **What does not follow:** the physical kinetic normalization `pi/3` is not fixed by the integer identity or the choice of the 24-step clock itself.

## Theorem 2 — All five Platonic surfaces are necessarily frustrated by common golden curvature

For each of the Platonic surface cellulations, let `B_P` be its oriented face–edge incidence matrix. Because the surface is a sphere, `sum_faces B_P = 0`, while `rank B_P = F_P-1`. Assign unitary link phases and desire a face holonomy `exp(2*pi*i*alpha)` on every oriented face. As the product of all actual face holonomies is one, exact desired closure would require `F_P*alpha` integral. Irrationality of `alpha` rules that out for every nonempty Platonic surface.

Minimize the fully specified **compact angular least squares**
\[
\mathcal F_P[A]=\sum_{f\in P}\operatorname{Arg}\big(H_f(A)e^{-2\pi i\alpha}\big)^2,
\qquad H_f(A)=\prod_{e\in\partial f}e^{i\sigma_{fe}A_e}.
\]

The oriented-face product identity forces total wrapped residual to be `2*pi*(m-F*alpha)` for integer `m`. Cauchy–Schwarz gives the sharp result
\[
\boxed{\min_A\mathcal F_P = \frac{(2\pi)^2}{F_P}\operatorname{dist}(F_P\alpha,\mathbb Z)^2.}
\]

Constructive attainability: set every face holonomy to `exp(2*pi*i*m/F_P)` for `m=round(F_P*alpha)`; choose one face lift offset `-2*pi*m` so its total real oriented flux vanishes; solve the rank-`F-1` real face-incidence equation to reconstruct edge phases. This was constructed and tested numerically for all five solids.

| Surface | V | E | F | `m` | signed residual per face, rad | sharp `min F_P` | magnetic Gram gap |
|---|---:|---:|---:|---:|---:|---:|---:|
| Tetrahedron | 4 | 6 | 4 | 2 | -0.741629423861 | 2.200056809346 | 2.000000000000 |
| Cube | 8 | 12 | 6 | 2 | +0.305568127335 | 0.560231282660 | 1.000000000000 |
| Octahedron | 6 | 12 | 8 | 3 | +0.043768739536 | 0.015325620485 | 2.585786437627 |
| Dodecahedron | 20 | 30 | 12 | 5 | -0.218030648263 | 0.570448362983 | 0.811098940683 |
| Icosahedron | 12 | 30 | 20 | 8 | -0.113310893143 | 0.256787170098 | 2.763932022500 |
| **Total** | **50** | **90** | **50** | **20** | — | **3.602849245572** | **all strictly positive** |

The all-five 190-cell cochain **sizes** `(50,90,50)` are retained. The precise all-five invariant for this chosen action is
\[
\boxed{\mathcal F_{\min}=4\pi^2\Big(\frac{4923}{40}-55\sqrt5\Big)=3.602849245572>0.}
\]

Signed mean mismatch is
\[
\overline\delta=\frac1{50}\sum_PF_P\,2\pi(\alpha-m_P/F_P)=2\pi(\alpha-2/5)=\frac\pi5(11-5\sqrt5)=-0.113310893143\ \mathrm{rad}.
\]

Reversing the spiral orientation reverses this signed measure but leaves the squared frustration action invariant. Therefore a **chiral frustration observable exists**, but the two mirror orientations still have equal energy; this action alone cannot give an ensemble matter excess.

**Independent nonuniqueness test:** If the golden angle is treated as a freely varying variable and only the five finite-surface closure costs are minimized in this winding chamber, the minimum is at `alpha_0=(2+2+3+5+8)/(4+6+8+12+20)=2/5`, **not** `phi^-2≈0.381966`. Fibonacci self-similarity or another primitive dynamical principle is required to select the golden irrational from all candidate turns. The golden angle was used as the primitive input in this particular finite theorem.

## Theorem 3 — Golden flux creates positive, nonflat incidence operators and an A5 quartet

Construct covariant incidence `D_A:C^V->C^E` with `(D_A psi)_e=psi_v-exp(i A_e)psi_u`, and the canonical positive Gram `L_A=D_A^dagger D_A`. Because the face holonomy is not unity, `D_A psi=0` would force `psi=0` everywhere on the connected graph. Thus `L_A>0`; this needs **no chosen mass gap** or empirical fit. All five positive gaps appear in the table.

For the icosahedron at nearest face winding `m=8`, the complete numeric eigenspectrum agrees with the exact algebraic candidate to below `3e-11`:
\[
\operatorname{spec}(L_A)=
\{(5-\sqrt5)^{[4]},\ ((7+\sqrt5)/2)^{[5]},\ ((15+\sqrt5)/2)^{[3]}\}.
\]

The fourfold minimum is not just an accidental count under the tested geometric symmetry: enumerating all 120 icosahedral graph automorphisms, selecting 60 proper rotations, and solving their unitary gauge lifts of `L_A` gives the lowest-band absolute character values

- identity (1 element): `|Tr|=4`
- order-two (15 elements): `|Tr|=0`
- order-three (20 elements): `|Tr|=1`
- order-five (24 elements): `|Tr|=1`.

These are the values of the irreducible icosahedral quartet (absolute characters). The conjugate spiral orientation gives a second quartet, **providing a geometric `4+4` carrier** without inserting a fourfold spectral degeneracy. Identifying these vertex-magnetic quartets with the *original face-Hodge* hidden `4_3+4_5` still requires an explicit gauge-equivariant intertwiner; equal dimensions and character tests are not sufficient.

The canonical graph Laplacian on two mirror channels is `K_2=[[1,-1],[-1,1]]`, with spectrum `(0,2)`. On the two quartet copies, `H_8=3 I_8+K_2 tensor I_4` has spectrum `3[4],5[4]`, matching the eigenvalues and dimensions of the native hidden Hodge restriction. Let `X=K_2 tensor I_4-I_8`, and let `W=sqrt(15)*([[0,1],[-1,0]] tensor I_4)`, where 15 is half the number of icosahedral edges (antipodal edge pairs). Then `X^2=I`, `W^2=-15I`, `{X,W}=0` — algebraically isomorphic to the original hidden operator identities. **The choice of coupling as the unweighted two-channel graph and the scale sqrt(15) are declared geometric modeling choices, not a derived dynamics of the actual original hidden face states.**

## Explicit structural construction reproducing the original two rails

Here is a **fully executable algebraic construction** using only finite geometric dimensions and the golden complement. It reproduces the frozen rail exactly, but the *choice of trace observable* is not forced by the spiral closure theorem.

- `D=3`, icosahedral faces `F_ico=20`, hence `delta_class=D/F_ico=3/20`.
- `N=12+1=13`, the original centred icosahedral contacts.
- Use a ternary carrier on the tetrahedron's four vertices, `H_tet=(C^3)^{tensor4}`, dimension `3^4=81`. Its uniform normalized vector `u` gives a rank-80 orthogonal projector `Q=I-|u><u|`. Thus `Tr(Q)/81=80/81`, no fitted real coefficient.
- Golden complement identity `1-alpha=1/phi`; define the **candidate** single-contact angular response `R=(pi*(1-alpha)/N)*Q` and normalize its trace.

Then
\[
\boxed{\delta_*^{\rm candidate}=\frac{\mathrm{Tr}(R)}{81}=\frac{80}{81}\frac\pi{13\varphi}=\frac{80\pi}{1053\varphi}=0.1475108101595796.}
\]

The gap and entropy scale reproduce frozen values:
\[
\Delta=3/20-\delta_*=0.00248918984042040>0,
\quad \eta=-\ln\Delta=5.99579798674130.
\]

For the two four-dimensional orientation channels coupled by the two-node Laplacian, the Gibbs state at `beta=eta` is exactly
\[
\rho=\frac{P_{\rm common}+\Delta^2 P_{\rm relative}}{4(1+\Delta^2)},
\quad p_{\rm rel}=\frac{\Delta^2}{1+\Delta^2}=6.19602767060\times10^{-6}.
\]

Its BKM stiffness under the original hidden definition is `8*eta*(1+Delta^2)/(1-Delta^2)=47.9669783034`.

**Crucial uniqueness audit:** A tetrahedral fourfold ternary carrier is a particular chosen representation, not mathematically demanded by the five face-holonomy constraints. Choosing, for example, a fifth ternary factor and the same singlet-excluded trace rule gives `0.148740066910909` instead. Likewise, multiplying the golden complementary half-angle by 1/13 is a plausible centred-contact normalization but is not forced by the compact-flux minimizer. **Therefore the frozen rail has been reproduced constructively, not uniquely derived from the spiral alone.**

## URT radial factor and physical interpretation: hard falsification checks

The existing frozen complex URT step is `q=(pi/e)*exp(2*pi*i/phi^2)`.

A standard golden logarithmic spiral satisfies `r(theta+pi/2)=phi*r(theta)`. In one golden angular step `2*pi/phi^2`, its radial multiplier is `phi^(4/phi^2)=2.08595387687843`; `pi/e=1.15572734979092`. These do **not** agree. Thus the existing URT modulus `pi/e` does not follow from the standard golden spiral pitch; a physical transfer normalization or a different generative rule is needed. The phase part follows by definition of golden-angle evolution.

The original Q96 charged transport also commutes with physical baryon number (tested in the predecessor 1032-link audit). Frustration's signed orientation cannot be identified with a net baryon abundance solely on the basis of the equal-energy mirror bands found here. To establish a physical matter excess requires an explicit map to charge/current operators and nonequilibrium dynamics or anomalous baryon-number conversion that pass conservation-law checks.

## Executable files

1. `cathedral_spiral_five_solid_rails_test_2026_11_17.py` — exact 8/13/21/24 phi identities, all five native graph face-incidence complexes, sharp flux action with attaining edge-phase witnesses, positive magnetic Gram eigenvalues, spectrum checks, rail candidate and an explicit counterexample to uniqueness.
2. `cathedral_spiral_hidden_quartet_A5_test_2026_11_17.py` — enumerate all 120 icosahedral automorphisms, select 60 orientation-preserving rotations, solve gauge lifts, measure quartet character by rotation order.
3. `cathedral_spiral_hidden_rails_kms_bridge_2026_11_17.py` — explicit 81-dimensional tetra projector and original rail trace, two-quartet `K_2` Hamiltonian, original `W` algebra and exact normalized hidden Gibbs state.

**Summary:** Constructive forced golden closure frustration over the full `(50,90,50)` Platonic complex, exact octahedron↔24 link, rigorously positive geometric Gram transfers, fourfold icosahedral chiral bands, and an explicit rail/hidden-KMS realization. Uniqueness of the rail action, standard-spiral-to-`pi/e` radial transfer, and actual matter/baryon physics remain open; a full theory of nature is not claimed.