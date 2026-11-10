# Report — alt_cycle40: pairing/condensation on H51

Date: 10 November 2026 (Europe/London)
Classification: **PROVED**
Predeclaration sha256: `151029c0f4c22ffa3100a7138f7d6fd549816a2c32baf1d3363850dd453340c3`

## Derived versus assumed
Derived and used: the Hodge Laplacian of each solid; the residual even/odd 4×30 frames of coupled cycles 10–11; the polar duality that identifies each icosahedral edge with the dodecahedral edge joining the two corresponding face-centres (an A5-equivariant bijection of the two 30-edge modules); V_hist at the frozen constants, T = η.

Derived but not a pairing: Cbridge restricts to 4 P_1 + 4 P_3 on the dodecahedral vertices and is only a kinetic control. F : Sym²(3 ⊕ 5) → 4_3 ⊕ 4_5 sources the hidden quartets from the H13 portal and does not produce a bilinear on other-solid vertices.

Not derived and not used: any embedding of abstract H51 = 2·1 ⊕ 3·3 ⊕ 3·3' ⊕ 4·4 ⊕ 3·5 into H64 (Hom_A5(4, Sym² H51) has dimension 90; no BCS problem is built on it); any pairing on the tetrahedron, cube or octahedron (18 vertices, no native A5); off-edge pairings in Sym² of the 20-vertex module; identification of the dodecahedral Laplacian 4-eigenspaces (eigenvalues 3 and 5) with the hidden Higgs 4s; a Higgs kinetic or a y_even normalisation.

Because the edge modules are isomorphic, Hom_A5(4, adjacent dodeca currents) is two-dimensional and is spanned by the lifted even and odd frames. The duality lift is the complete adjacent pairing, not a random injection.

The only A5-covariant spatial complement of the icosahedron is the dodecahedron (20 vertices). The five solids have 50 vertices in all; 12 of them are the H13 surface.

## Condensation
Even / 4_5 at T = η, y = 1:
- χ = 0.040417, stiffness Δ² c5 = 1.3555×10^{-6}, y_c = 0.005791;
- condenses, with r_* = 9.85212×10^5 matching the large-vev balance (nuclear norm) / (4 c_even) = 9.84431×10^5 to 0.08%;
- nuclear-norm maximum 5.337632 (sampled min 4.953252);
- stabiliser D3 (order 6: one identity, two order-3, three order-2). The ray stabiliser is the same D3.
  This is not A4: the nuclear-norm maximiser of Δ_dodeca is a 3+2-type vector of the 4 (inner product √6/4 ≈ 0.612372 with an A4 vector, verified in cycle 41).

Odd / 4_3: χ = 0.040420, y_c = 2.345 > 1, does not condense at y = 1. (Its nuclear-norm maximiser has vector stabiliser C3 and ray stabiliser D3; this direction is not a vacuum.)

Controls: adding C_dd = 4 P_1 + 4 P_3 leaves the even channel condensed (y_c = 0.005806) with the same D3 stabiliser and the same r_*. At T = 0 the even channel still condenses (y_c = 0.002664, same r_* and D3).

## Conclusion
H51, in the only derived sense (duality-lifted pairing on the dodecahedron), condenses in the even / 4_5 channel with stabiliser D3. Abstract H51 is not a condensate carrier. Tetra/cube/octa do not condense through a hidden 4. No ARF target was inserted. No repository files were modified, committed, or pushed.
