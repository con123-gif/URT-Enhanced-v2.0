# Predeclaration — alt_cycle27: inter-solid links from the D6 → H3 projection

Date: 2026-11-10 (Europe/London)
Route: (27) Derive links between the five disjoint solid graphs from the D6 root-lattice projection to H3. Test whether those links restore full five-solid Ward for Cbridge and make the gauged current unique (removing the relative 0.855 path ambiguity of alt_cycle22).

## Predeclared construction
C1. Five-solid vertex coordinates and Cbridge are those of alt_cycle12 / alt_cycle22 (common R³ embedding, Tr Cbridge = 160).
C2. The six icosahedral diameters are the six opposite-vertex pairs of the icosahedron. Unit vectors u_1, …, u_6 are one chosen representative from each pair; replacing any u_i by −u_i only permutes the projected root set.
C3. D6 roots ±e_i ± e_j (i < j) project along the diameters to the 60 vectors R_proj = {±u_i ± u_j : i < j} ⊂ R³. This is the standard D6 → H3 projection (two H3 root lengths in the golden ratio).
C4. An inter-solid candidate pair is a pair of vertices from different solids whose displacement w − v is parallel to some vector in R_proj (numerical tolerance 10^{-7} on the sine of the angle). Let d_1 < d_2 < ⋯ be the distinct Euclidean lengths of those candidates. The derived link set keeps every candidate of length d_1. It also keeps length d_2 if and only if d_2 / d_1 equals φ, φ^{-1}, φ² or 2 to relative 10^{-6} (the discrete golden / doubling scales native to H3 and D6); otherwise only d_1 is kept. No continuous coupling is introduced.
C5. Gauge fields live on the original 90 spatial edges plus the new inter-solid links. For every pair with a nonzero Cbridge entry, U_{ij} is the Wilson line of C5 along paths in this enlarged graph. Two recipes as in alt_cycle22: (A) average of all shortest paths; (B) lexicographically first shortest path. q = 1.

## Hypotheses
H1. The rule C4 produces a nonempty, finite set of inter-solid links and makes the five solids path-connected (or it does not: the outcome is computed, not assumed).
H2. If the enlarged graph connects every pair of vertices that carry a nonzero Cbridge entry, the same Wilson construction as alt_cycle22 restores exact gauge invariance of Hodge + full Cbridge, without new continuous couplings.
H3. The current is unique if and only if every such Cbridge pair has a unique shortest path (so recipes A and B agree). Cross-solid connectivity alone does not imply uniqueness, because many shortest paths may remain.
H4. Adding these links does not automatically remove the 0.855 icosahedral off-edge ambiguity of alt_cycle22, unless those 36 pairs each acquire a unique shortest path in the enlarged graph.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
