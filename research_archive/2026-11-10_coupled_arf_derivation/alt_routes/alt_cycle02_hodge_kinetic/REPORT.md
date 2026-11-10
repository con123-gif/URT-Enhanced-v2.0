# alt_cycle02 — Hodge / incidence kinetic on the 190-cochain complex

Classification: PROVED on H1–H5.
Advances a physical ARF? No.

## Result
The five Platonic solids were rebuilt from their Euclidean vertex sets (50 vertices, 90 edges; 20 triangular faces of the icosahedron recovered as 3-cliques). Each graph Laplacian has Betti number b₀ = 1.

The true icosahedral Laplacian (12 vertices, 30 edges) is A5-invariant with distinct eigenvalues 0 (the singlet), 5−√5 (a 3), 6 (the 5) and 5+√5 (the other 3). Polynomials in Δ therefore span the whole 4-dimensional algebra End_A5(ℂ¹²). The lowest-order Hodge action S = ||dφ||² nevertheless selects one specific ray in that algebra.

On geometric H13 (centre plus the 12 vertices, with 12 spokes and the 30 surface edges) the same action selects a unique ray in the 7-dimensional Hermitian algebra End_A5ᴴ(H13): the singlet 2×2 has eigenvalues 0 and 13 with a fixed mixing, and the remaining eigenvalues are 6−√5, 6+√5 and 7, all distinct. The overall scale remains free, so one kinetic parameter survives.

A 0-derivative mass term m²||φ||² immediately destroys uniqueness of the ratios (a 2-parameter family). Higher-derivative kinetics p(Δ) restore the whole 7-cone.

There is no A5-forced incidence coupling of the icosahedron or dodecahedron to the tetrahedron, cube or octahedron, because those three solids have no native A5 action. The dodecahedral Laplacian does split the two copies of 4 in the 20-vertex module, with eigenvalues 3 and 5; identifying those eigenspaces with the hidden 4₃ and 4₅ is an extra step.

The archived centred graph G₁₃ (Z₁₂ Cayley surface with generators {1,5,7,11} plus a hub; 36 edges; documented spectrum 0(1), 3(2), 5(6), 7(2), 9(1), 13(1)) is not A5-equivariant. A5-invariant graphs on 12 icosahedral vertices are regular of degree in {0,1,5,6,10,11}, and a multiplicity pattern with leftover 2 ≠ 3 cannot come from the isotypes {1,1,3,3,5}.

## Verification
`/workspace/arf_research/alt_cycle02_hodge_kinetic/test_hodge_kinetic.py` and `results.json`.
Predeclaration sha256: `e9d69e34e5e6ffa00e40b5aa0860e3ef30c37b904b1c8861fb3d84f6e35b52da`.
Icosahedral eigenvalues match 0, 5−√5, 6, 5+√5 to 10⁻¹⁰. Dodecahedral eigenvalues match 0, 3−√5, 2, 3, 5, 3+√5 to 10⁻⁹. G₁₃ spectrum matches the archived multiplicities exactly.

## Next obstruction
Pure Hodge kinetic on geometric H13 does cut the 7-cone down to a ray, but it does not touch the Yukawa space, and the remaining kinetic scale is still free.
