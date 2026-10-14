# Hidden-sector emergence: Platonic polynomial closure and A4 from nested tetrahedra
Date: 2026-10-14. Continues docs/PLATONIC_HIDDEN_FUSION_2026-10-14.md. Evidence: direct coordinate/incidence and numerical linear algebra verification. Do not conflate a mathematically derived finite mechanism with physical continuum identification.

## 1. Hidden modes are *generated*, not merely counted
For a real face-vertex incidence matrix B (F by V), define H_f=ker B^T and H_v=ker B. Let U_f=im B and U_v=im B^T. The degree-d hidden products are projections of pointwise products u_1...u_d, u_i in U, into H. The ranks of the degree-2 and degree-3 spans are:

| Polyhedron | face hidden | quadratic/cubic face rank | vertex hidden | quadratic/cubic vertex rank |
|---|---:|---:|---:|---:|
| Tetrahedron | 0 | 0/0 | 0 | 0/0 |
| Cube | 2 | 2/2 | 4 | 3/4 |
| Octahedron | 4 | 3/4 | 2 | 2/2 |
| Icosahedron | 8 | 8/8 | 0 | 0/0 |
| Dodecahedron | 0 | 0/0 | 8 | 8/8 |
| Decahedron, pentagonal bipyramid | 4 | 4/4 | 1 | 1/1 |

Thus degree <= 3 generates every nonzero incidence-hidden sector on these six solids. The tetrahedron has zero independent incidence kernel, but becomes dynamically relevant when *embedded* in a cube.

On cube vertices labelled (x,y,z) in {+1,-1}^3, im B_cube^T=span{1,x,y,z}; its hidden complement is span{xy,xz,yz,xyz}. Degree 2 makes xy,xz,yz; the third-order product xyz is the cube's alternating pair-of-tetrahedra (parity) mode.

## 2. Exact A4 root system from five cubes of a dodecahedron
The 20 dodecahedron vertices contain five inscribed cubes. For each, put +1/sqrt(8) on one inscribed tetrahedron, -1/sqrt(8) on the complementary tetrahedron, and 0 outside that cube. These five parity vectors z_i lie in R^20 and can be oriented so

z_i . z_j = 1 if i=j, -1/4 otherwise; sum_i z_i = 0.

They span a **four-dimensional regular simplex** exactly equal to the dodecahedral Laplacian-3 hidden eigenspace 4_3 (i.e. adjacency eigenvalue 0), and also lie in ker B_ico^T.

Define the twenty directed vectors alpha_ij = sqrt(4/5)(z_i-z_j), i != j. Then ||alpha_ij||^2=2, their mutual inner products are in {-2,-1,0,1,2}, and their rank-four isotropy sum is

sum_(i != j) alpha_ij alpha_ij^T = 10 P_(4_3).

In orthonormal coordinates of this 4-space, this is precisely **sum alpha tensor alpha = 10 I_4**, the project's frozen A4 root identity. This is a constructive 3D Platonic-nesting -> hidden 4D A4-root derivation, not simply a matching number 20.

The five parity vectors are a tight frame, sum_i z_i z_i^T = (5/4)P_(4_3). Their rank-one projectors average to P_(4_3)/4.

## 3. Nonlinear shell -> hidden -> shell feedback
For the icosahedron's face-vertex B (20 by 12), the linear projection onto the eight-dimensional hidden space is identically zero: P_h B=0. However, the *quadratic* map
h(x) = P_h[(Bx) pointwise^2]
has image span exactly all eight hidden modes (rank 8 when expanded over quadratic monomials). Let P_3 and P_5 denote rank-four hidden Laplacian eigenspace projectors. Write h_3=P_3 h, h_5=P_5 h.

The pointwise multiplication and A5 action commute, so h is A5-equivariant. A 72-degree vertex-axis rotation was verified numerically, with incidence covariance exact and response covariance error below 3e-14.

Under the icosahedral adjacency eigenspaces {-sqrt(5):3, +sqrt(5):3', -1:5}, the exact bilinear selection rules are:
- hidden Laplacian-3 band: 3 x 5 and 3' x 5;
- hidden Laplacian-5 band: 3 x 3' and 5 x 5.
Other shell pairs have zero bilinear projection into these hidden fours. This separates antipodal-odd and even hidden responses.

Use the *existing* rail gap Delta=3/20-80pi/(1053phi), not a new fitted coefficient. One candidate nonnegative finite feedback functional is
U_Delta(x)=(||h_3(x)||^2+Delta^2||h_5(x)||^2)/4.

Its exact real gradient is
grad U_Delta(x) = B^T[(Bx) pointwise (h_3(x)+Delta^2 h_5(x))].
Hence the associated mathematical gradient flow dx/dt=-grad U has dU/dt=-||grad U||^2 <= 0. In one numerical random-state check U decreased 13.8859717332 -> 13.8337010247 after a step 1e-4; directional-derivative residual was <2e-9. This constructs a nonlinear back-reaction; it is **not** a claimed derivation of the physical clock, microscopic T or Einstein/SM dynamics.

## 4. Exact conditional compatibility with the original URT spiral
Preserve q=(pi/e)exp(i 2pi/phi^2), independently of the positive Hermitian transfer and BKM entropy branches. On *complexified* shell amplitudes with a uniform scalar URT action x -> qx, a homogeneous degree-d hidden product obeys Q_d(qx)=q^d Q_d(x): degree 2 carries golden phase 2 theta and factor (pi/e)^2, degree 3 carries 3 theta and factor (pi/e)^3. Numerical residual of the quadratic identity was below 5e-15. This is an exact covariance property, **conditional** on that shell action; a physical URT-shell representation and positive transfer implementation still need to be derived, not inferred.

## Interpretation and continuity
This is an active positive line of mathematical development, not a no-go. Previously separate project pieces are now explicitly constructed together: five inscribed cubes -> cubic tetrahedral parity -> 4D regular simplex -> A4 twenty roots -> the 4_3 spectral hidden sector. The icosahedral shell independently generates both hidden fours quadratically and admits an exact quartic feedback functional weighted by the pre-existing Delta.

Do not identify the nested 13=4+4+5 carrier with the original centred 13=1+1+3+3'+5 merely because both are 13-dimensional. Both are A5 representations, and a symmetry-preserving *linear* map shares only the 5 band, while nonlinear products overcome that limitation.

## 5. The missing 16th response mode is a four-site A5 singlet (new verified calculation)

The two quadratic hidden maps h3(x),h5(x) give the quartic product X(x)=h3(x) tensor h5(x) in 4_3 tensor 4_5. A 1500-state numeric span has rank **16** (condition number 2.335), confirming it populates the complete response carrier rather than merely having formal dimension 16. An independent deterministic witness using equal-amplitude support subsets gives rank 15 for supports of at most three sites and rank 16 when four-site subsets are included.

Find the unique normalised 4x4 matrix S orthogonal to all three-site-supported X(x). Its singular values are (1/2,1/2,1/2,1/2). Direct 72-degree and 120-degree icosahedral rotation checks show S is an A5 intertwiner. Define the scalar c(x)=h3(x)^T S h5(x).

Expand c(x) into homogeneous degree-four monomials in x_1,...,x_12. **All** monomials supported on fewer than four distinct shell vertices have coefficient zero (numerical residual <5e-15). Of the 495 four-distinct-site monomials, precisely 120 have nonzero coefficients, 60 positive and 60 negative, with equal magnitude 2/sqrt(15) up to <5e-15 error. The coefficient changes sign under shell antipodal inversion. This is an A5 rotational singlet with *odd inversion parity* (a pseudoscalar under the full point group); it must not be silently identified with physical U(1) hypercharge.

No physical constants were adjusted to obtain the coefficient pattern. Under the conditional complexified uniform URT shell action x -> q x, the new response satisfies X(qx)=q^4 X(x), and c(qx)=q^4 c(x) for q=(pi/e) exp(i 2pi/phi^2). This provides an exact fourth-harmonic *candidate* for a microscopic history/response dictionary. The origin of a physical scalar gauge current and appropriate space-time scale are separate identifications.

**Continuity:** do not terminate this line after verifying dimension 16. The 120 allowed quartets, their parity, the exact A4 root construction, and the Delta-weighted quartic backreaction together specify an explicit finite polynomial interaction machine to continue deriving and testing.
