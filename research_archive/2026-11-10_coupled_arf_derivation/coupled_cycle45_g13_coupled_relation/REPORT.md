# Coupled cycle 45 — G_{13} versus proved coupled-line operators

Classification: **PROVED**. The archived G_{13} graph is not a
sub-block, quotient, or restriction of any of the named
coupled-line operators (geometric H13 Hodge, K0, the joint 32-site
Laplacian, subcritical BdG, the five-solid 0-form Laplacian, or
the H64 hypercube). Advances a physical ARF? No. Internal
structure of G_{13}, the R_mass prefactors, and the 1/α writings
were not recomputed (alt line).

The `newtons-cathedral` tip remains read-only at `6bad7b3`. The
rebuilt Laplacian agrees with `newtons_cathedral/graph.py` in
matrix and spectrum, and matches the documented list
{0, 3^{⊕2}, 5^{⊕6}, 7^{⊕2}, 9, 13}.

## R1. Equality / similarity

Geometric H13 has spectrum {0, (6−√5)^{⊕3}, 7^{⊕5}, (6+√5)^{⊕3},
13}. That is not the G_{13} spectrum (shared values: only 0, 7
and 13, and even 7 has different multiplicity). The two 13×13
Laplacians are not similar and are not equal in the raw
hub-first labelling. G_{13} is not the Hodge kinetic of alt
cycle 02 / coupled cycle 10 in another labelling.

## R2. Reducing sub-block

A necessary condition for L_big Q = Q L_{G13} is that the G_{13}
spectrum be a sub-multiset of spec(L_big). This fails for every
operator on the frozen list:

- H13: 3, 5, 9 are missing;
- K0 and both subcritical BdG writings: 3, 5, 7, 9, 13 are
  missing (K0 is 12-dimensional in any case);
- joint 32-site K0^{ico}⊕K0^{dodeca} and the five-solid 0-form
  Laplacian (dim 50): 7, 9, 13 are missing;
- H64 hypercube (eigenvalues 2k): every odd value is missing.

No intertwiner was searched for once the necessary condition
failed. G_{13} is not a reducing sub-block of these operators.

## R3. Spanning subgraph

G_{13} has 24 surface edges; geometric H13 has 30. There are 125
perfect matchings of the icosahedral graph. Deleting any one of
them never yields a 4-regular graph isomorphic to
Cay(ℤ_{12}, {1,5,7,11}). The Cayley surface is not a spanning
subgraph of the icosahedron, and G_{13} is not obtained from
geometric H13 by deleting a 1-factor.

## R4–R6. Principal restriction, Schur, quotient

The only derived degree-12 vertex among the named operators is
the hub of geometric H13 (K0, the joint 32-site graph and the
five solids have maximum degree 5; H64 has degree 6). Principal
13-vertex restriction therefore reduces to R1 and fails.

The Schur complements of the two hubs are not equal. H13 gives
{0, (6−√5)^{⊕3}, 7^{⊕5}, (6+√5)^{⊕3}}; G_{13} gives
{0, 3^{⊕2}, 5^{⊕6}, 7^{⊕2}, 9}.

Equal-sized 13-cell quotients require 13 to divide the ambient
dimension. That fails for K0 (12), the joint 32, the five-solid
50, H64 (64) and both BdG writings (24 or 12). For geometric
H13 a 13-cell partition is the set of singletons, i.e. R1.
Unequal-cell partitions were not enumerated: there is no derived
13-cell partition of those vertex sets.

## Conclusion

All six named relations fail. The archived G_{13} graph is a
different 13-vertex cone (already known not to be A5-equivariant,
alt cycle 02) and is not a sub-block, quotient or restriction of
the proved coupled-line kinetics. This does not by itself
confirm or retract the alt line’s identification of the R_mass
eigenvalue list with a complement of the G_{13} spectrum; it
only says that list does not arise as a block of the A5-equivariant
operators used on the coupled line.

## Integrity

Predeclaration sha256:
`b1325ab5cf30356321646bd54f854050a916c4b5751a7d15fd736c576f5111cf`.
No ARF target was used. No ARF is declared solved.
