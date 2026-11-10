# alt_cycle27 — inter-solid links from the D6 → H3 projection

Classification: PROVED (each dichotomy is computed, not assumed).
Advances a physical ARF? No.

## Result (predeclared rule C4)

The six icosahedral diameters project the 60 D6 roots ±e_i ± e_j to the 60 vectors {±u_i ± u_j}. Those projected roots come in two H3 lengths, in the ratio φ, as expected. An inter-solid vertex pair is a candidate link when w − v is parallel to a projected root (108 such pairs among the 920 cross-solid pairs).

The candidate lengths form three discrete groups:

- d1 = φ^{-2} ≈ 0.381966 (12 pairs)
- d2 = φ ≈ 1.618034 (24 pairs)
- d3 = 2 (72 pairs)

The ratios are d2/d1 = φ³ and d3/d1 = 2φ², both native to H3, but the predeclared C4 list for keeping d2 is {φ, φ^{-1}, φ², 2}. φ³ is not on that list, so C4 keeps only the 12 shortest links.

Those 12 links join only the dodecahedron to the icosahedron. The enlarged graph has four components (tetrahedron; cube; octahedron; dodecahedron+icosahedron). Of 1063 vertex pairs with a nonzero Cbridge entry, 596 remain disconnected, including 596 of the 836 cross-solid ones. Wilson gauging therefore cannot be defined on every Cbridge pair, and Hodge + full Cbridge is not gauge invariant (absolute error 4.21 for both recipes). All 36 icosahedral off-edge pairs still have 2–10 shortest paths, so the relative 0.855 current ambiguity of alt_cycle22 is unchanged. The gauged current is not unique.

## Post-hoc diagnostics (not part of C4)

Keeping d1 and d2 (36 links) still leaves three components and 404 disconnected Cbridge pairs; Ward is not restored; icosahedral off-edge path counts become 2–12 (the ambiguity gets worse).

Keeping all three observed root-parallel lengths (108 links, 198 edges in all) does make the five solids path-connected and connects every one of the 1063 nonzero Cbridge pairs. Both Wilson recipes then restore exact gauge invariance of Hodge + full Cbridge (residuals 1.1×10^{-13}) with no new continuous couplings. The current is still not unique: 547 of those pairs have multiple shortest paths (up to 30), the two recipes differ by relative 0.589, and every one of the 36 icosahedral off-edge pairs still has 2–12 shortest paths. Adding the links creates more competing shortest paths rather than removing them. The 0.855 icosahedral ambiguity is not removed.

## Verification
`/workspace/arf_research/alt_cycle27_d6_intersolid_links/test_d6_intersolid_links.py` and `results.json`.
Predeclaration sha256: `e2bbdd4c35e5debc07e721124f4f1c3b7dc9da25043063b3ccdd9584a40d693b`.

## Next obstruction
Even the most generous discrete D6 → H3 length set restores five-solid Ward only at the price of a larger path ambiguity. Uniqueness of the gauged current is not a consequence of these geometrically derived links. A further rule that would pick a unique path (without a new continuous coupling) is not supplied by the projection itself.
