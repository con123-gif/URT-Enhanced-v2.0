# Newton's Cathedral — bottom-up Platonic hierarchy with hidden-sector bridge

Date: 2026-11-11. Status: verified finite combinatorics/representation theory; proposed physical interaction hierarchy unproven. Companion: `cathedral_platonic_hidden_hierarchy_exact.py` (SymPy + NetworkX, all assertions pass).

## 1. Entire Cathedral retained

For each Platonic graph/polyhedron P, let B_P be the unsigned face-vertex incidence matrix (F_P × V_P). Set H_L(P) = ker B_P^T (face-hidden), H_R(P) = ker B_P (vertex-hidden). Direct exact ranks from planar graph faces:

| Solid | V | E | F | rank(B) | dim H_L | dim H_R |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| tetrahedron | 4 | 6 | 4 | 4 | 0 | 0 |
| cube | 8 | 12 | 6 | 4 | 2 | 4 |
| octahedron | 6 | 12 | 8 | 4 | 4 | 2 |
| dodecahedron | 20 | 30 | 12 | 12 | 0 | 8 |
| icosahedron | 12 | 30 | 20 | 12 | 8 | 0 |
| TOTAL | 50 | 90 | 50 | 36 | 14 | 14 |

Full Hodge-carrier dimension is V+E+F=190. The **unsigned incidence nullspaces are not** the Hodge–Dirac zero modes (previous Cathedral Hodge theorem gives ker D dimension 10).

Duality transposes incidence: cube ↔ octahedron; dodecahedron ↔ icosahedron; tetrahedron self-dual. Thus the octahedral 4D face-hidden subspace is the cube's 4D vertex-hidden subspace, and the dodecahedral 8D vertex-hidden subspace is the icosahedral 8D face-hidden subspace.

## 2. Shared tetrahedral symmetry

The octahedral rotational group S4 (order 24) and icosahedral rotational group A5 (order 60) contain a common A4 (order 12), after selecting a relative geometric orientation. There are five A4 subgroups of A5, stabilizers of five tetrahedra in the dodecahedral compound. This is established polyhedral group theory; it is *not* a physical force law.

A5's standard 4D representation restricted to A4 decomposes into the invariant line plus standard spatial triplet: 4|_{A4} = 1 ⊕ 3. The existing Cathedral hidden module H_ico=4_3^-⊕4_5^+ therefore restricts to (1^-⊕3^-)⊕(1^+⊕3^+), with inversion parity indicated.

Cube vertices (x,y,z) ∈ {±1}³ have the Walsh basis: 1, x, y, z, xy, yz, zx, xyz. Under A4 × C2(inversion),

- even modes: 1^+ = span(1); 3^+ = span(xy,yz,zx)
- odd modes: 3^- = span(x,y,z); 1^- = span(xyz).

Therefore **as real A4×C2 representations**:

R^{8}_{cube} ≅ H_{ico, hidden}.

The cube's face-vertex incidence has row-space span(1,x,y,z) = 1^+⊕3^- and kernel span(xy,yz,zx,xyz)=3^+⊕1^-. Every such component appears with multiplicity one in the icosahedral hidden 8D representation. Consequently a parity-preserving A4-equivariant isometric bridge exists; after choosing an A4 alignment it is unique up to signs on the four inequivalent irreducible blocks, *not* a uniquely determined physical interaction.

## 3. Exact six-channel spectral match

The cube's graph Laplacian acts on Walsh monomials of degree k with eigenvalue 2k, giving 0(1), 2(3), 4(3), 6(1). Hence the parity-marked cubic triplets have eigenvalues 2 (odd), 4 (even). The pre-existing icosahedral hidden sectors have eigenvalues 3 (odd), 5 (even).

On the six triplet modes:

L_hidden = L_cube + I   (after any A4×C2 equivariant isometry of the corresponding triplet modes).

For the cube singlets the same shift gives 7 (odd) and 1 (even), instead of hidden 3 (odd) and 5 (even): both mismatch by magnitude 4. Thus the spectral match singles out rank six. The exact cube triplet projector is

P_cube,trip = I_8 − (L_cube−2I)(L_cube−4I)/8
            = I_8 − P_{constant} − P_{xyz}.

This is a mathematical spectral identity *under an additive +1 offset*. Physics has not selected that offset; treating the match as an interaction term requires dynamics.

## 4. Five tetrahedral bridges recover the Cathedral master state

Realize the A5 four-dimensional representation in W={x∈R⁵:Σx_i=0}, with orthogonal projector Q=I₅−11ᵀ/5. Its five A4 stabilizer-fixed unit vectors are

u_i = (√5/2) (e_i−1/5 1), i=1,…,5,

and satisfy u_i·u_j = −1/4 (i≠j). The rank-one projectors P_i=u_i u_iᵀ are exactly the Reynolds averages over the five order-12 A4 stabilizers, restricted to W. Their exact frame identity is

Σ_{i=1}^5 P_i = (5/4) I_W.

Apply this independently to the two icosahedral hidden 4D sectors, weighting the eigenvalue-5 sector with pre-existing Δ²=e^{-2η_Δ}, where η_Δ=−ln Δ. The normalized five-bridge average becomes

ρ_bridge = [Σ_{i=1}^5 (P_{i,3} ⊕ Δ² P_{i,5})] / [5(1+Δ²)]
         = (I_4 ⊕ Δ² I_4)/[4(1+Δ²)]
         = ρ_*.

**This exactly reconstructs the previously frozen master density operator** using five tetrahedral channels and the existing gap parameter. It does *not* independently derive Δ, and it does *not* distinguish a preferred tetrahedron or choose a unique history. The average is isotropic within each irreducible 4D sector.

## 5. Proposed dynamics (clearly unresolved)

A candidate hierarchy is tetrahedral compatibility → cubic/octahedral dual incidence kernels → A4-equivariant 8D hidden identification → dodecahedral/icosahedral hidden bilinear output → physical force coupling → 24 ordered interactions. Prior local construction C(u,v)=B_icoᵀ(u⊙v) has exact rank 6 and transfer-strength ratio φ^6. Combining these *mathematically compatible* maps into a unique global 190D positive transfer with dynamical forces is not yet derived.

The numerical coincidence 24=|S4| does not equate the user's cyclic 24-track Z/24Z ordering with the non-cyclic group S4. A physical ordered 24-step operator requires a geometrically defined ordering and force-dependent maps. Fully symmetric averages do not select one history: a unique survivor would require a simple leading dynamical eigenvalue, Lyapunov exponent, or appropriate irreversible conditioning mechanism.

## 6. Checks and limits

The companion script verifies all five incidence ranks, cube/octahedral duality, parity basis and cubic Laplacian spectrum, the exact cubic rank-six polynomial projector, the existence and order of all five A4 stabilizers in A5, the regular-simplex frame identity, and exact reconstruction of ρ_*. All tests pass.

This does not prove a macroscopic quantum Solar System crystal, orbit quantization, or that physical forces use this interaction network. No repository change has been made.
