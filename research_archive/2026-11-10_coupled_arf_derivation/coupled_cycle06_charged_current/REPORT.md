# Coupled cycle 06 — A5-equivariant charged currents on the 90 edges

Classification: PROVED (obstruction). Surviving dimension = 4 ≠ 1.
Advances an ARF? No.

## Result

The 60-element rotation group of the archived icosahedron was generated from
vertex-neighbor flags (class counts 1+15+20+12+12). Independently computed
permutation characters:

| module | character | decomposition |
|---|---|---|
| ico vertices (12) | (12, 0, 0, 2, 2) | 1 ⊕ 3 ⊕ 3' ⊕ 5 |
| ico unsigned edges (30) | (30, 2, 0, 0, 0) | 1 ⊕ 3 ⊕ 3' ⊕ 2·4 ⊕ 3·5 |
| ico signed C¹ (30) | (30, −2, 0, 0, 0) | 2·3 ⊕ 2·3' ⊕ 2·4 ⊕ 2·5 |
| ico faces (20) | (20, 0, 2, 0, 0) | 1 ⊕ 3 ⊕ 3' ⊕ 2·4 ⊕ 5 |
| ico gradients | (vertices) − 1 | 3 ⊕ 3' ⊕ 5 |
| ico conserved ker(div) | signed C¹ − gradients | 3 ⊕ 3' ⊕ 2·4 ⊕ 5 (dim 19) |

Hom dimensions from two hidden quartets `4_3 ⊕ 4_5` into these modules:

- signed C¹(ico): 4
- conserved ico currents (Ward): 4
- unsigned ico edges (H13-adjacent Sym² pairings): 4
- signed adjacent Λ² pairings: 4

The archived tetrahedron, cube, octahedron *and* dodecahedron vertex sets are
each preserved by only 12 of these 60 rotations, so this copy of A5 does not
act geometrically on those four solids. The only remaining action is the
trivial one, and `Hom(4, 1) = 0`.

The dodecahedron does carry its *own* A5 (60 rotations generated from its
20×3 flags, class counts again 1+15+20+12+12). Relative to that action:

- signed C¹(dodeca) ≅ 2·3 ⊕ 2·3' ⊕ 2·4 ⊕ 2·5, Hom(`4_3 ⊕ 4_5`, C¹) = 4
- conserved dodeca currents ≅ 3 ⊕ 3' ⊕ 5 (dim 11), Hom = 0
  (the two 4's of C¹ sit entirely in the gradient subspace of the 20 vertices).

Under the “each A5-solid uses its own rotations” convention the 90-edge
count is therefore 8 (ico+dodeca) before Ward and 4 after Ward (ico only).
Under a single ico-embedded A5 acting on the 190-complex it is 4 and 4.
H13 vertex matter hops only along the 12 icosahedral vertices, so the
H13-coupled current lives on the 30 icosahedral edges either way.

**Surviving Ward + H13-hopping dimension: 4.** Geometry, A5, gauge
covariance (divergence-free) and the two hidden channels do not select a
unique spatial charged current.

Verification: `test_charged_current.py`, `results.json`.
Predeclaration hash: `93a048a51269dee8402ace3f6b3221a43971535799fac9946c2e212bbfcf275f`
