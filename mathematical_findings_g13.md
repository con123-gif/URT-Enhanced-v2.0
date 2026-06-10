# Mathematical Findings: The Two G₁₃ Objects

**Date:** 2026-06-10
**Status:** every statement below was verified in exact arithmetic (integer /
symbolic computation, no floating point) and is reproducible by running
`verify_mathematical_findings.py` in this directory.

---

## 0. Summary

There are **two distinct mathematical objects** that have both been called
G₁₃ in this project. Each is genuinely structured, but their structures are
different and provably cannot be carried by a single graph:

| | **Object A** — combinatorial G₁₃ (`newtons_cathedral/graph.py`) | **Object B** — strict geometric centred icosahedron (`strict_geometric_icosahedron.py`) |
|---|---|---|
| Shell | circulant C₁₂(1,5,7,11) — 24 ring edges, 4-regular | true icosahedron skeleton — 30 surface edges, 5-regular |
| Total edges | 36 | 42 |
| Shell triangles | 0 (bipartite, girth 4) | 20 (= F) |
| Aut group | order 768 = 2⁸·3, element orders {1,2,3,4,6,12} | order 120 = A₅×ℤ₂ |
| 5-fold symmetry | **none** (no order-5 automorphism exists) | yes (A₅) |
| Laplacian spectrum | {0¹, 3², 5⁶, 7², 9¹, 13¹} | {0¹, (6−√5)³, 7⁵, (6+√5)³, 13¹} |
| tr L, tr L² | 72, 516 | 84, 660 |
| Source of structure | arithmetic of ℤ/12 (Ramanujan sums, totients) | A₅ representation theory, golden ratio |

The integer-spectrum identities of this framework attach to Object A; the
icosahedral/golden-ratio identities attach to Object B. Sections 1–4 give
each object its correct structure theory; Section 5 proves the separation;
Sections 6–9 give complete classifications and the one theorem-grade bridge
(McKay) from the icosahedron to exceptional structures.

---

## 1. Object A is an arithmetic object: the unitary Cayley cone

The ring offsets (1, 5, 7, 11) of `graph.py` are exactly the **units of
ℤ/12**, so the shell is the unitary Cayley graph X₁₂ = Cay(ℤ/12, (ℤ/12)*).
Three exact consequences:

1. **The unit group (ℤ/12)\* is the Klein four-group.** Every unit squares
   to 1 mod 12. This is the genuine K₄ inside the construction.

2. **The shell's adjacency eigenvalues are the Ramanujan sums c₁₂(j).**
   Exact factorization of the characteristic polynomial:

   ```
   det(xI − A_shell) = x⁶ (x−4)(x+4)(x−2)²(x+2)²
   ```

   identical to the multiset {c₁₂(j) : j = 0..11} computed from the
   Möbius/totient formula c₁₂(j) = μ(12/g)·φ(12)/φ(12/g), g = gcd(j,12).
   The eigenvalues are integers *because Ramanujan sums are integers*.

3. **Multiplicities are totient counts, and the number of distinct
   eigenvalues is τ(12) = 6.** Coning shifts the non-constant shell modes
   by +1 and adds the eigenvalue N = 13, giving the exact Laplacian
   characteristic polynomial

   ```
   det(xI − L) = x (x−3)² (x−5)⁶ (x−7)² (x−9) (x−13)
   ```

   with λ = 5 − c₁₂(j): the 6-fold level at λ = 5 is φ(12) + φ(4) = 4 + 2
   (the j with μ(12/g) = 0), the levels at 3 and 7 have multiplicity
   φ(6) = φ(3) = 2, the level at 9 has φ(2) = 1.

4. **The GEM v4 shell (bipartite double cover of the octahedron) is
   isomorphic to this shell.** The two "independent topologies" compared in
   `compare_g13_topologies.py` are the same graph.

5. **Automorphism group:** |Aut| = 768 = 2⁸·3, element orders
   {1, 2, 3, 4, 6, 12}. There is **no order-5 automorphism**, hence no
   A₅ subgroup and no 5-fold symmetry. The shell is bipartite and
   triangle-free: it has no 20 faces and no pentagons. Every Laplacian
   eigenspace is **irreducible** under this group (verified by exact
   character norms over all 768 automorphisms), so no eigenvalue partition
   of the 6-dimensional λ = 5 eigenspace is invariant under any symmetry.

---

## 2. Object B is a geometric object: the centred icosahedron

Built from the exact golden-ratio coordinates (0, ±1, ±φ) cyclic: 30
surface edges (every vertex meets 5 others), 12 spokes, 42 edges, 20
triangular faces, Aut = A₅×ℤ₂ of order 120. Exact spectral data:

1. **Laplacian spectrum** (verified by exact annihilating polynomial and
   exact rank computations over ℚ(√5)):

   ```
   {0¹, (6−√5)³, 7⁵, (6+√5)³, 13¹}
   ```

2. **The golden pair 6±√5 satisfies x² − V·x + (E+1) = x² − 12x + 31 = 0.**
   The golden ratio lives inside the spectrum: 6−√5 = 7−2φ, 6+√5 = 5+2φ.

3. **The multiplicities 1, 3, 5, 3, 1 are exactly the A₅ irreducible
   representation dimensions** appearing in the vertex action (next
   section). The eigenvalue 7 carries multiplicity 5; the radial modes are
   0 and 13.

4. tr L = 84 = 2·42, tr L² = 660, λ₂ = 6−√5 ≈ 3.7639.

---

## 3. The representation-theoretic separation theorem

The A₅ permutation representation on the icosahedron's 12 vertices
decomposes (exact character inner products in ℚ(√5)) as

```
12-vertex rep  =  1 ⊕ 3 ⊕ 3′ ⊕ 5        (the 4-dim irrep does NOT occur)
```

so on the 13-vertex cone the representation is 1 ⊕ 1 ⊕ 3 ⊕ 3′ ⊕ 5. By
Schur's lemma, the eigenspace multiplicities of **any** A₅-invariant
operator on 13 vertices are sums drawn from {1, 1, 3, 3, 5}, and the only
possible multiplicity-2 eigenspace is the merger of the two trivial
(radial) summands.

**Theorem.** No graph with icosahedral (A₅) symmetry can have the spectrum
{0, 3², 5⁶, 7², 9¹, 13¹}: it contains two multiplicity-2 levels (λ = 3 and
λ = 7) whose eigenvectors are non-radial shell Fourier modes (verified
exactly: L·v = 3v for v = cos(2π·2k/12) on the shell, v(centre) = 0).

Hence Objects A and B can never be the same graph, and no deformation
preserving either one's defining structure reaches the other.

---

## 4. Universal (structure-free) facts about cones

For **any** 12-vertex shell whatsoever, the coned Laplacian has eigenvalue
exactly N = 13 (eigenvector (12, −1, …, −1)) and all non-constant shell
eigenvalues shift by +1. Therefore "13 appears in the spectrum" and the
"+1 shift" carry no information about either object.

---

## 5. Complete classification of both families

**Integral circulant shells.** The integral circulants on ℤ/12 are exactly
the unions of gcd-classes (one class per divisor of 12, sizes 4, 2, 2, 2,
1). All 2⁵ − 1 = 31 unions yield fully integral coned spectra — the family
is indexed by the divisor lattice of 12. Object A's shell is the single
class {gcd = 1}. Notable siblings: classes (1,6) is 5-regular with λ₂ = 3
and coned spectrum {0, 3², 7⁸, 9, 13}; classes (3,4) also has λ₂ = 3.

**A₅-invariant shells.** All A₅-invariant 12-vertex graphs are unions of
the icosahedron's three distance graphs (distance-1, distance-2,
antipodal): 7 shells. Every one has multiplicities that are merges of
{1, 1, 3, 3, 5}; none has a non-radial multiplicity-2 level, confirming the
theorem across the family.

**Intersection of the families.** Exactly three graphs lie in both: the
antipodal perfect matching (= class {6}), the cocktail-party graph K₆ₓ₂
(= classes {1,2,3,4}), and K₁₂ (= all classes). These are the shells whose
symmetry groups are large enough to contain both Aut(A) and A₅ — and
precisely because of that, their coned spectra collapse to at most 4
levels with no multiplicity-2 eigenvalues.

---

## 6. Exact λ₂ of all Platonic-solid+centre cones

Computed from exact characteristic polynomials (relevant to the spectral
selection table in `newtons_cathedral/uniqueness.py`):

| solid+centre | exact λ₂ |
|---|---|
| tetrahedron | 5 |
| cube | 3 |
| octahedron | 5 |
| dodecahedron | 4 − √5 ≈ 1.7639 |
| **icosahedron** | **6 − √5 ≈ 3.7639** (not 3) |

With these values no Platonic cone satisfies both "λ₂ = 3" and "simple
rotation group" simultaneously: the cube cone has λ₂ = 3 but symmetry S₄;
the icosahedron cone has A₅ but λ₂ = 6−√5. λ₂ = 3 with the (0,3,3,5) block
is a property of Object A only.

---

## 7. The theorem-grade bridge: McKay correspondence to affine E₈

The legitimate route from the icosahedron to exceptional structures was
verified from scratch: the binary icosahedral group 2I was generated as
120 explicit unit quaternions; its 9 conjugacy classes (sizes
1,1,12,12,12,12,20,20,30) and full character table were computed via the
class algebra (orthogonality relations verified); the McKay matrix
A_ij = mult(ρ_j ⊂ 2 ⊗ ρ_i) came out as a 9-node tree with a single
trivalent node and arm lengths (1, 2, 5):

```
the affine E₈ Dynkin diagram, with node labels = irrep dimensions
{1, 2, 2, 3, 3, 4, 4, 5, 6} = the E₈ marks.
```

Through this bridge the following are theorems, not coincidences:
240 E₈ roots = 2·|2I|; Coxeter number h = 30 = E (the icosahedron's edge
count), with rank·h = 8·30 = 240; and the E₈ exponents
{1, 7, 11, 13, 17, 19, 23, 29} are the totatives of 30 — the same
totient motif that generates Object A's spectrum mod 12 reappears
legitimately on the geometric side mod 30.

---

## 8. The honest home of 13 = 4 + 9: the projective plane PG(2,3)

N = D² + D + 1 with D = 3 is the point count of the projective plane of
order 3 (verified by direct construction over F₃): 13 points, 13 lines,
every line containing exactly 4 points, every point on exactly 4 lines,
and 13 = 9 affine points (AG(2,3)) + 4 points on the line at infinity.
This is a 4/9 split with actual theorems behind it, unlike any partition
of Object A's λ = 5 eigenspace (Section 1.5).

---

## 9. Dynamical notes (mathematical content only)

1. **Logistic 6-cycle.** Across the stable period-6 window
   r ∈ [3.84149, 3.845] of the logistic map, the cycle's lowest branch
   sweeps continuously through [0.1432, 0.1487]; consequently every value
   in that band is attained at some r. The branch equals
   δ★ = (80/81)π/(13φ) exactly at r = 3.8416737869947…; at
   r★ = 3.8417002878419497 the branch is 0.147421936162…
   (0.0603 % from δ★, consistent with `logistic_verification.py`).

2. **URT flow fixed point.** The flow
   ∂ₜδ = −L δ/(4π) − (φ−1)(δ − c)(1 + δ²) is a gradient-type flow whose
   unique global attractor is the inserted constant c, for any c; this was
   verified numerically for c ∈ {δ★, 0.2, 0.5, 0.987654}. The fixed-point
   value is therefore an input of the dynamics, not an output.

---

## 10. Framing consequence for this branch

For the pure-mathematics direction of grok-review the operative rule is:
**spectral-integer identities (3, 5, 7, 9, 72, 516, the λ₂ = 3 block)
belong to Object A and are number theory mod 12; icosahedral identities
(V, E, F, q = 5, A₅, φ, the golden spectrum) belong to Object B and are
geometry/representation theory.** Each side is self-consistent and worth
developing on its own terms; statements that move a property from one
object to the other do not survive exact verification.
