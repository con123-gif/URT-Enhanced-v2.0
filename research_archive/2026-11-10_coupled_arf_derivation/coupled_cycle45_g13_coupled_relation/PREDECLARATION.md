# Coupled cycle 45 predeclaration — G_{13} versus proved coupled-line operators

Date: 2026-11-10 (Europe/London)

Alt cycles 55–57 identified the stipulated R_mass list
(5,5,5,5,5,7,7,9,13) with the archived G_{13} graph Laplacian
spectrum after deleting its four smallest eigenvalues, and
falsified a fixed-point-shift reading of Δ_δ on that same
Laplacian. They also recorded that G_{13} is not A5-equivariant
(alt cycle 02). This cycle asks only the coupled-operator
relation: is that archived graph a sub-block, a quotient, or a
restriction of any *proved coupled-line* operator? Internal
structure of G_{13} (Cayley generators, flow coefficients, the
R_mass prefactors 3/35 and 4/51, the 1/α writings) is left to
the alt line and is not recomputed here.

No historical ARF is inserted. The `newtons-cathedral` tip remains
read-only at `6bad7b3`. Predeclaration is hashed before the
comparison is run.

## Operators on the coupled-line side (frozen list)

Only operators already constructed and used as kinetics or
Hessians on the coupled line (or the alt Hodge kinetic that the
coupled line has already adopted) are compared:

1. Geometric H13 Hodge / cone Laplacian L_{H13} (centre plus 12
   icosahedral vertices, 12 spokes and 30 surface edges). Spectrum
   {0, (6−√5)^{⊕3}, 7^{⊕5}, (6+√5)^{⊕3}, 13}, as in alt cycle 02
   and coupled cycle 10. Dimension 13.
2. The icosahedral graph Laplacian K0 on the 12 vertices
   (spectrum {0, (5−√5)^{⊕3}, 6^{⊕5}, (5+√5)^{⊕3}}). Dimension 12.
3. The joint unbridged Laplacian K0^{ico} ⊕ K0^{dodeca} on 32
   sites (alt cycles 41–42; dodecahedral spectrum
   {0, (3−√5)^{⊕3}, 2^{⊕5}, 3^{⊕4}, 5^{⊕4}, (3+√5)^{⊕3}}).
4. The subcritical BdG operator at r = 0, A = 0, which is block
   diagonal in (K0, −K0) (or just K0 if only the positive branch
   is kept). Dimension 24 or 12. Condensed-phase BdG blocks are
   recorded only to the extent that their spectra were already
   computed on the coupled line; no new pairing matrix is built.
5. The 0-form Hodge / graph Laplacian of the five-solid vertex
   set (50 vertices, typically five connected components), and
   the hypercube (H64) graph Laplacian (eigenvalues 2k with
   multiplicity C(6, k)). These enter only as ambient operators
   for the sub-block / spectrum-containment tests below.

The archived G_{13} Laplacian L_{G13} is rebuilt from the
documented recipe (one hub plus the Z_{12} Cayley surface with
generators {1,5,7,11}) and checked against
`newtons_cathedral/graph.py` (spectrum and matrix). That rebuild
is a comparison input, not a new coupled-line kinetic.

## Relations that will be tested (frozen)

All tests are up to permutation of the 13 (or 12) labels, with
the hub of a cone held at vertex 0 unless a test explicitly
allows a different distinguished vertex.

R1. *Equality / similarity.* L_{G13} = Pᵀ L_{H13} P for a
    permutation matrix P, or, equivalently (since both are
    symmetric), the two matrices are similar. Because similar
    symmetric matrices have the same spectrum, distinct spectra
    immediately falsify R1.

R2. *Reducing subspace / direct-summand (sub-block).* There is
    an isometric intertwiner Q (Qᵀ Q = I) such that
    L_big Q = Q L_{G13}. A necessary condition, used first, is
    that the spectrum of L_{G13} is a sub-multiset of the
    spectrum of L_big. This is applied to each operator in the
    frozen list. If the necessary condition fails, R2 fails for
    that operator. If it holds, an intertwiner is searched for.

R3. *Spanning subgraph / edge restriction.* After a surface
    relabelling, is the 24-edge Cayley surface a subset of the
    30 icosahedral edges? Equivalently: is L_{G13} obtained from
    L_{H13} by deleting a 1-factor (six edges) of the surface?
    Test: enumerate the perfect matchings of the icosahedral
    graph and ask whether the complementary 4-regular graph is
    isomorphic to Cay(ℤ_{12}, {1,5,7,11}). Isomorphism of these
    12-vertex 4-regular graphs is decided by a Hamiltonian-cycle
    search for a circulant labelling with steps {1,5}.

R4. *Principal-submatrix restriction.* For each operator of
    dimension > 13 that has a vertex of degree ≥ 12 (so that a
    G_{13}-type hub is even possible), every such vertex is
    taken as a candidate hub and the induced 13-vertex subgraph
    on {hub} ∪ N(hub) is compared with G_{13}. Geometric H13 is
    already dimension 13, so this reduces to R1. K0 has maximum
    degree 5 and cannot contain a degree-12 hub. The joint
    32-site operator is disconnected of degrees 5 and 3. The
    five-solid 0-form operator, if disconnected, is the same.
    If no proved operator has a degree-12 vertex other than the
    hub of geometric H13, R4 reduces to R1 and is reported as
    such.

R5. *Hub Schur complement.* The Schur complement of the hub in
    L_{H13}, and of the hub in L_{G13}, are 12×12 operators on
    the surface. They are recorded and compared. Equality would
    be a named relation; inequality is not repaired by a later
    change of convention.

R6. *Equitable-partition quotient.* A quotient of L_big onto 13
    cells equal to L_{G13}. Equal-sized cells require 13 to
    divide dim L_big: this already fails for K0 (12), H13 (13
    cells would be singletons, i.e. R1), the joint 32-site
    operator (32 is not a multiple of 13), the five-solid 50
    (50 is not a multiple of 13), and H64 (64 is not a multiple
    of 13). Unequal-cell partitions are not searched: there is
    no derived 13-cell partition of those vertex sets, and
    enumerating them would be a new stipulated map. The only
    derived 13-cell object on the coupled line is geometric H13
    itself (R1).

No other identification (a “best fitting” subspace, a least-squares
intertwiner, a partial spectral overlap, or a look-elsewhere match
of a few shared eigenvalues such as {0, 7, 13}) will be promoted
to a relation after seeing numbers.

## Hypotheses

H1. L_{G13} and L_{H13} have distinct spectra, so R1 fails:
    G_{13} is not the geometric H13 Hodge kinetic in another
    labelling.
H2. The G_{13} spectrum is not a sub-multiset of the spectra of
    K0, L_{H13}, the joint 32-site Laplacian, subcritical BdG,
    the five-solid 0-form Laplacian, or the H64 hypercube, so
    G_{13} is not a reducing sub-block of any of those (R2).
H3. R3 (Cayley as a spanning subgraph of the icosahedron) is
    computed, not assumed.
H4. R4–R6 either reduce to H1 or fail for the dimension / degree
    / divisibility reasons recorded above, unless a derived
    degree-12 vertex other than the H13 hub is found (it is not
    expected).

If all of R1–R6 fail, the classification is PROVED: there is no
sub-block, quotient, or restriction relation between the archived
G_{13} graph and the named coupled-line operators. If some Ri
holds, that relation is stated exactly and is not extended to a
derivation of R_mass or of Δ_δ (those identifications belong to
the alt line).

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
comparison. No ARF target is used. This cycle does not declare
any ARF solved.
