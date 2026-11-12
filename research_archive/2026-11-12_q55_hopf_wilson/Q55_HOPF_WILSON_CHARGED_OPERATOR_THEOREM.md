# Q55 — Native Hopf 2I charge-sector Wilson operator, both Ward orders, and exact hidden resolution

12 November 2026. Status: **THEOREM, CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for the explicitly defined 2I/600-cell Hopf charge-sector Wilson kinetic. Independent reconstruction executed locally, and the archived source import is registered to run in CI. This is not a physical Dirac dispersion relation, photon pole, or completed v61 matter join.

## Precedence and preserved architecture

Prior Hopf work in `research_archive/Cathedral_Master_Index.md` (August 2026) fixes the Hopf circle/2I cover, the c1=1 elementary magnetic shell, and its 19 cycle holonomies. The newer 12 Nov construction `research_archive/2026-11-12_hopf_charged_carrier/` establishes four **charged** hidden images at n=±2,±4 and their face projectors G_n; Q55 completes an actual Hermitian kinetic and its Ward identities instead of falling back to the older November 7 H64×24 positive Euclidean action. The other Platonic complexes, D6→H3, H13⊕H51, 24-clock and Golay/Leech remain separate layers; no claim they are all implemented by the 120×120 Hopf Laplacian.

## Construction from the original 120 binary icosians, no free link weights

Let `G=2I` be the 120 unit quaternions, `z` the archived order-10 Hopf fibre generator, and `C_phi={g in G: Re(g)=phi/2}` the 12-neighbour conjugacy class. The 600-cell Cayley adjacency is the central Hermitian operator

`A_600 = sum_{g in C_phi} R(g)`, `L_600=12I_120-A_600`.

For `n in {±2,±4}`, choose one representative from each of the 12 right cosets G/<z>. The normalized charge-n lift `B_n: C^12 -> C^120` has

`(B_n)_{q_i z^k,i}=exp(-2pi i n k/10)/sqrt(10)`.

A change of coset representative is a diagonal U(1) frame transformation. Define the **native charged Wilson kinetic**

`L_n=B_n† L_600 B_n` (12×12), and two-sheet `W_{n,-n}=diag(L_n,L_{-n})` (24×24).

`L_n` is Hermitian and positive. Its diagonal is `10+4sin²(pi n/10)`. On the thirty edges of the icosahedron its offdiagonal entries are `-w_n U_ij` with |U_ij|=1 and **no adjustable weight**: `w_2=phi`, `w_4=phi^-1` (and w_-n=w_n); all other offdiagonals vanish. Thus it is a genuine covariant nearest-neighbour magnetic Wilson *Laplacian*. It is **not** a derived Dirac first-order operator or a mass-changing offdiagonal sheet coupling. The latter would require another charged converter; none was introduced.

The exact spectra are:

- `spec(L_±2)={10−2sqrt(5) [3], 12 [5], 15 [4]}`;
- `spec(L_±4)={12 [5], 10+2sqrt(5) [3], 15 [4]}`.

The `15 [4]` component is the unique 2I four-dimensional irrep in each charged section. It follows from the central class-sum eigenvalue `A|4 = (12/4)chi_4(phi/2) = −3`, whence L|4=15.

## Theorem 1 — exact Hopf magnetic flux and both Ward orders

The true icosahedral twenty triangular faces have all the same outward-oriented Wilson loop (the orientation choice sets the overall sign):

`prod_{edges of each face} U_ij = exp(−i n pi/10)`.

Therefore each principal face phase is `−n*pi/10`, and the sum of the twenty face phases divided by 2pi is **−n**. In the selected orientation, the Chern integers are `{−2,+2,−4,+4}` for charges `{+2,−2,+4,−4}`. They follow from the native 600-cell links and agree with charge scaling of the previously known c1=1 Hopf shell. No arbitrary flux was inserted.

Let `e=(i,j)` be an oriented base edge (i<j) and let the independent real gauge link variable be `a_e`. Define `L_n(a)_ij=L_n(0)_ij exp(i n a_e)` and `L_n(a)_ji=conj(...)`, with diagonal unchanged. Under local `alpha`, `a_ij -> a_ij + alpha_i−alpha_j`, and `psi_i -> exp(i n alpha_i) psi_i`, the 12×12 operator transforms as `L_n(a+dalpha)=D_n(alpha)L_n(a)D_n(alpha)†`. The 24×24 two-sheet direct sum transforms under `diag(D_n,D_{−n})`.

Writing `Q_i=n|i><i|`, the exact first and second **kinematic Wilson Ward identities** on each sheet are

`sum_e (delta_i,head(e)−delta_i,tail(e)) (partial L_n/partial a_e) = i[Q_i,L_n]`,

`sum_e s_i(e)s_j(e) (partial² L_n/partial a_e²) = −[Q_i,[Q_j,L_n]]`.

The contact derivatives `partial²L_n/partial a_e²` are **nonzero**; they are the seagull terms. These identities were checked for all 12 site directions and all 144 site-pairs and directly against finite nonconstant gauge transformations. They do **not** assert the Ward identities of an unbuilt Hopf↔H64↔v61 interacting matter operator.

## Theorem 2 — exact hidden quartet kinetic and FOUR-sector completeness

Use the **existing** normalized lift `F: C^20 faces -> C^120`, `F(q,f(q))=1/sqrt(6)` and the archived two hidden face projectors `P3,P5` (rank 4 each); let `P_h=P3+P5`. Set

`T_n = B_n† F P_h` (12×20), `G_n=T_n†T_n` (20×20), `K_n=T_n† L_n T_n`.

The unique charge-n 4 irrep has eigenvalue 15, and the hidden images lie entirely in it. Thus **exactly**

`L_n T_n=15 T_n`, `K_n=15G_n`, `rank(T_n)=4` for every `n=±2,±4`.

The earlier Hopf projector result supplies

`G_+2+G_-2=2a2 P3+2b2 P5`, with `a2=(5+sqrt5)/20`, `b2=(3−sqrt5)/12`,

`G_+4+G_-4=2a4 P3+2b4 P5`, with `a4=(5−sqrt5)/20`, `b4=(3+sqrt5)/12`.

Since a2+a4=b2+b4=1/2, **without fitting any constant**,

`SUM_{n=±2,±4} G_n = P_h`,

`SUM_{n=±2,±4} K_n = 15 P_h`.

Equivalently, `T=(T_2,T_-2,T_4,T_-4)^T: im P_h -> C^48` is an exact **isometric embedding** (`T†T=I_8` on hidden space), and its pulled-back Hopf Wilson kinetic is `15 I_8`. This is a complete four-channel 2I carrier for the hidden quartets, not the four empirical ARFs. The ±2 pair alone is not complete; it has the nondegenerate hidden 3/5 energies `(3/2)(5+sqrt5)=10.8541019662` and `(5/2)(3−sqrt5)=1.90983005625` when both chiralities are summed. Including ±4 completes both quartets symmetrically and restores the scalar 15.

## Verification, significance and remaining physical work

The independent 120-icosian reconstruction ran locally with numpy, generated exactly the original 12-coset charged lift, all 30 magnetic edges, all 20 oriented triangular face fluxes, both gauge Ward orders with nonzero seagull operators, and the hidden 4+4 projectors. Local errors: `||sum G−P_h||_F=6.98e−15`, `||sum K−15P_h||_F=1.97e−13`; zero failed assertions. The companion certificate imports the pre-existing archived `hopf_charged_carrier.py` by default for independent execution in GitHub CI; the local all-icosian reconstruction was run by `--reconstruction` and exited 0. The representation-theoretic identities (integer characters and resolution of the charge projectors) provide exact proofs; floating-point residuals are consistency checks, not their sole basis.

**What is newly accomplished:** an explicit self-adjoint **charged** Wilson geometry for the Hopf quartet, with its nontrivial topological flux, both operator Ward identities, and a complete 8->48 unit-norm charged lift with exact induced kinetic. This is not a revival of the outdated source-free Cathedral candidate and does not claim a full physical mass, photon pole, H64 matter-current join or Lorentz proper time.

**RESUME HERE:** Compose this charge-resolved `T` with the native all-five/H64 hidden partial isometry `U_h` using a verified icosahedral face-frame identification, then test full source-dependent Ward seagulls and Schur relaxation on the resulting charged interaction. Do not replace the Hopf charged carrier with the old v61/no-Hopf route. The critical missing new calculation is the exact **joint sourced interaction** and physical pole, not another standalone positive Gaussian clock.