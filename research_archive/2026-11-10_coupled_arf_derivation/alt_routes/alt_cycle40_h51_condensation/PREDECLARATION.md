# Predeclaration — alt_cycle40: pairing/condensation on H51

Date: 2026-11-10 (Europe/London)
Route: (40) Build the derived pairing/condensation problem on H51 (its Hodge kinetic per solid, the same residual pairing frames lifted via the history/Cbridge structure only if derivable — state exactly what is derived vs assumed). Does H51 condense, into which hidden channel, with what stabiliser?

## What H51 is, and what it is not
S1. Abstract H51 = H64 ⊖ H13 = 2·1 ⊕ 3·3 ⊕ 3·3' ⊕ 4·4 ⊕ 3·5 is an A5-module complement (dim 51). There is no canonical embedding of this complement into the 64 signed histories (Theorem A / cycles 01, 02, 05, 36). Hom_A5(4, Sym² H51) has dimension 90 (coupled cycle 05). That count is recorded; a BCS problem on abstract H51 would require inventing an embedding and a kinetic, and is not constructed.

S2. Spatial “other solids”: the five Platonic solids have 50 vertices (tetra 4 + cube 8 + octa 6 + dodeca 20 + ico 12). The geometric H13 surface is the 12 icosahedral vertices. The complementary 38 vertices split as:
    - dodecahedron (20): native A5 action, dual to the icosahedron;
    - tetrahedron + cube + octahedron (18): no native A5 action (alt_cycle02).
    The only A5-covariant spatial complement on which an A5-equivariant pairing can live is the dodecahedron. Tetra/cube/octa have derived Hodge kinetics but no derived pairing, and are not assigned a hidden-4 Yukawa.

## Derived versus assumed
S3. Derived, and used:
    - Hodge / graph Laplacian of each solid (alt_cycle02);
    - the residual even and odd adjacent pairing-current frames of coupled cycles 10–11 (4×30 maps from hidden 4_5 and 4_3 to icosahedral edges);
    - the geometric polar duality of the icosahedron and dodecahedron: each icosahedral edge, being the intersection of two faces, corresponds to the dodecahedral edge that joins those two face-centres. This is an A5-equivariant bijection of the two 30-edge sets, hence an isomorphism of A5-modules. Composing the residual frames with this bijection is the lift of “the same residual pairing frames” to the dodecahedron. Because the edge modules are isomorphic, Hom_A5(4, adjacent dodeca currents) is two-dimensional and is spanned by the lifted even and odd frames; no extra adjacent Yukawa is introduced.
    - V_hist = c3 ||h3||² + Δ² c5 ||h5||² at the frozen constants, T = η (and T = 0 as control).

S4. Derived, but not a pairing:
    - Cbridge = Ctop + Cbulk (alt_cycle12) is a charge-0 kinetic coupling of constants and spatial dipoles across the five solids. Its restriction to dodecahedral vertices is 4 P_1 + 4 P_3_spatial. It does not produce a charge-2 bilinear and does not lift the frames. It is included as a kinetic control (K = L versus K = L + C_dd), not as a pairing source.
    - F : Sym²(3 ⊕ 5) → 4_3 ⊕ 4_5 sources the hidden quartets from the H13 portal; it does not produce a bilinear on other-solid vertices (coupled cycle 03). V ∘ F is not a new dodeca pairing.

S5. Not derived, and not used:
    - any embedding of abstract H51 into H64;
    - any pairing on tetra/cube/octa;
    - any off-edge (non-adjacent) pairing in Sym² of the 20-vertex module;
    - identification of the dodecahedral Laplacian 4-eigenspaces (eigenvalues 3 and 5) with the hidden Higgs 4_3, 4_5 (alt_cycle02 already flagged this as an extra step);
    - a new continuous coupling, a Higgs kinetic, or a y_even normalisation.

## Condensation protocol
S6. For each channel (even / 4_5 and odd / 4_3), at T = η and y = 1:
    - quadratic susceptibility χ from Ω_f(ε ĥ) ≈ −χ ε² along the nuclear-norm maximiser;
    - critical Yukawa y_c = √(stiffness / χ);
    - condensation iff y_c < 1 (equivalently χ > stiffness);
    - if it condenses, minimise Ω(r ĥ) over r ≥ 0 at that ĥ and record the nuclear-norm maximiser’s stabiliser inside A5 (permutations of the 20 dual vertices), named as in alt_cycle25 (A5, A4, D5, D3, C5, C2×C2, C3, C2, 1).
    The nuclear-norm maximiser is obtained by BFGS from a fixed list of starts (coordinate axes, equal-weight rays, and a declared random seed 40). Stabiliser computations use the 60 icosahedral rotations acting on the dual vertices.

## Hypotheses
H1. The only derived other-solid pairing is the duality lift of the residual even and odd frames to the dodecahedron. Abstract H51 is not available as a condensate carrier; tetra/cube/octa do not condense through a hidden 4.
H2. The even / 4_5 channel on the dodecahedron condenses at T = η, y = 1 (soft stiffness Δ² c5); the odd / 4_3 channel does not (stiffness c3).
H3. The condensed direction is a nuclear-norm maximiser of Δ_dodeca. Its stabiliser is computed, not assumed; the most symmetric nonzero points of the 4 are A4 vectors, so A4 is the expected name if the landscape is equivalent to H13’s, but a different name (D3, C3, C2×C2, C2, or 1) is reported if that is what the maximiser has.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
