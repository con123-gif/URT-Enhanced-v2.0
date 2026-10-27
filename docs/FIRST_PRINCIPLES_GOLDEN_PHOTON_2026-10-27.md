# Cathedral: exact golden-geometry/chirality-to-photon calculation — 27 Oct 2026

## What is being derived, not fitted
Start with the actual regular icosahedron/dodecahedron face network, its Laplacian L, the two hidden A5 quartets (eigenvalues 3 and 5), the preexisting signed-chirality operator W, the frozen rails Delta, and the primitive URT golden phase theta=2pi/phi^2.

The goal is to test whether these geometrically required objects FORCE the actual electromagnetic response and the historical fine-structure scalar 137+(17572/1215)Delta-(9/65)Delta^2. **Do not insert that scalar into a photon generator.**

## 1. The exact 137 relaxation index contains both visible and hidden physics

Dodecahedral spectrum:
  0(1), (3-sqrt5)(3), 2(5), 3(4), 5(4), (3+sqrt5)(3).

Its integrated heat return is Tr L^+=137/15. Decompose it:
  15 * [3/(3-sqrt5)+5/2+3/(3+sqrt5)] = 105   [visible, 12-dimensional carrier excluding zero]
  15 * [4/3+4/5] = 32                     [hidden 4+4 carrier]
  TOTAL = 137.

The golden modes are essential to that exact 105: the conjugate pair contributes exactly 9/2. This is a genuine *whole-carrier* arithmetic index, but it is not by itself the normalized 4D photon inverse coupling.

## 2. Let the existing chirality W dynamically mix the hidden sectors

From the geometric triple-product sign, W is real antisymmetric, W²=-15(P3+P5), L W + W L=8 W, with rank W=8. Numerically independently confirmed on ideal icosahedral faces with residual ~1.1e-13.

Test the canonically scaled Hermitian deformation
   H(x)=L+i x W/sqrt15.
On the eight-dimensional 4+4 carrier its four identical 2x2 blocks are
   [3, i x; -i x, 5].
Every block has det(15-x²), trace 8. The other visible modes are unaffected. Therefore EXACTLY
   15 Tr H(x)^+ = 105+480/(15-x²)
               = 137+(32/15)x² + (32/225)x⁴+....
At x=Delta=3/20-80pi/(1053phi) one obtains
   I(Delta)=137.00001321827972...
An alternative scaling H=L+i Delta W gives I=137.00019827534248...
The archived scalar 137.035999178195 is *not produced* by either. The spectral index is even in the chirality amplitude. No measured alpha was used.

## 3. Why the chiral golden angle cannot simply be a conventional edge phase

Let the 20 face centers be dual dodecahedron vertices and P be the signed (60x30) path-incidence matrix mapping a vector potential on 30 dual edges into its unique two-edge path phase for every one of the 60 nonzero W hops. Define the 60-entry oriented sign pattern w=(W_ab) for a<b.
The calculation gives **exact integer** P^T w=0. The 30x60 map has rank 30 and ||w||²=60.

Geometric proof: W is invariant under proper A5 rotations. P^T w is therefore an A5-invariant oriented edge one-form on the dual dodecahedron. Every edge admits a proper icosahedral half-turn swapping its endpoints, reversing oriented edge sign, so the invariant one-form is zero.

This means the signed 60-hop chirality cannot itself be represented by a local U(1) field on the underlying 30-edge geometry. Its role belongs to the higher/path-history interaction. This is not a no-go for electromagnetic coupling through a *gauge-covariant* dressed 2-hop operator, only for identifying the intrinsic chirality sign pattern directly with a local photon vector potential.

## 4. Golden angle is an evolution step, not an equilibrium magnetic field

A separate previously derived Ih-invariant primitive harmonic circulation b exists on each of the two 32-history parity graphs (from 64 signed states), with gcd closed-loop periods 1 and ||b||²=30. Their pair-flip Laplacian has spectrum 0(1),10(6),16(15),18(10).

For the **hypothesis** that the URT golden step is a STATIC Wilson holonomy a=theta=2pi/phi², evaluate:
   L(a)_{uv}=15delta_uv-adj_uv exp(i a b_uv),
   Gamma(a)=-log Tr exp(-eta L(a)), eta=-ln Delta.

At zero flux: Gamma''(0)=11.24212122513994 (previous 64-history calculation).
At the golden angle theta=2.399963229728653:
   Gamma'(theta)=+17.62660351783588,
   Gamma''(theta)=-4.20636136565821.
Independent finite difference verifies derivative and Hessian (h=2e-4 gives ~17.62660333 and -4.20636859).

Thus a static golden-flux vacuum is **not even stationary** for this defined transfer. URT's golden twist should not be relabelled a frozen equilibrium photon flux. The primitive rotation is *motion*; any physical gauge response must arise from how the entire selected history reacts to that motion.

## 5. Key theorem on phases in two sectors vs closed loops

An isolated Hermitian two-sector exchange
 H(theta)=[[3 I4, x exp(i theta) I4],
           [x exp(-i theta) I4, 5 I4]]
is related to H(0) by unitary conjugation diag(exp(i theta/2)I4,exp(-i theta/2)I4). Therefore every scalar spectral observable Tr f(H) is independent of theta. **Golden-angle information cannot reside in an isolated relative phase between just two sectors**. It must appear in nontrivial gauge-invariant closed-loop holonomies of three or more distinct paths, with the physical source before hidden-sector projection.

The full 64-history two-bit-flip graph has exactly 640 elementary triangles per 32-history parity component (1280 total). Those are intrinsic three-path loops, not added geometry. Their actual coherent history weights and charge-induced holonomies must be calculated from the source-first H64 transfer, including hidden51, rather than invented.

## Physical status
We derived: an exact whole visible+hidden 105+32 spectral decomposition of 137; exact W-induced all-sector Green response and its Delta² scaling; exact impossibility of representing chirality sign pattern as a dual-edge local one-form; and a concrete 64-history test showing frozen golden flux is not a stationary action configuration.

We have NOT derived an independently normalized photon Coulomb pole, nor the archival linear-in-Delta alpha formula. The source must supply a parity-sensitive/chiral **closed-history-loop interference mechanism** and fixed electroweak trace normalization. Any computed alpha must follow from that *same* action, not be selected against the measured value.

Executable checks (in originating conversation):
- `/mnt/data/cathedral_phi_photon_parity.py`
- `/mnt/data/phi_flux_history64.py`
Both run without measured alpha inputs. 
