# Coupled cycle 47 — A5-invariant Hodge inner products and the residual spread

Classification: **PROVED** (H1, H2, H3 as computed, H4). Neither
resolution clause (A) nor (B) holds. No member of the predeclared
family is unique Maxwell. The cycle-44 spread is not resolved by a
unique derived inner product. K_γ is not identified. α_eff was not
compared. Advances a physical ARF? No.

The `newtons-cathedral` tip remains read-only at `6bad7b3`. No
historical ARF was used to select a weighting. No spread-minimising
search of the product cone was performed.

## Orbit census (the family)

A5 acts through the 60 rotations of the original icosahedron.
Lumped A5-invariant Hodge metrics are one positive weight per
orbit of vertices, edges and faces.

| n | V, E, F | N0, N1, N2 (orbit sizes) | cone dim (after scale) |
|---|---------|---------------------------|------------------------|
| 1 | 12, 30, 20 | 1 [12], 1 [30], 1 [20] | 3 (2) |
| 2 | 42, 120, 80 | 2 [12,30], 2 [60,60], 2 [60,20] | 6 (5) |
| 3 | 92, 270, 180 | 3 [12,60,20], 5 [60,30,60,60,60], 3 [60,60,60] | 11 (10) |

At n = 1 there is a single orbit of each degree, as in H1. At
n ≥ 2 the cone has several independent ratios, so combinatorics
alone do not fix a unique lumped weighting (H2; clause (A) fails).
All eight named geometric conventions (spherical/Euclidean ×
DEC/length/inverse-length, and both circumcentric duals) are
well-defined at n = 1, 2 and 3; they are inequivalent. Clause (B)
fails: there is no single named geometric Hodge star forced by
the derived 12-point set.

## Spread (H3)

The uniqueness threshold is spread < 0.05, as in cycles 43–44.
Number of unique-Maxwell hits, over every named point (coupled
and gauge-only) and every predeclared axis scan: **zero**.

At n = 1, gauge-only spreads are all 0.305737, identical to the
combinatorial kernel, as predicted (a global rescaling of *1 and
*2 only rescales the Maxwell Gram on the single edge orbit).
Coupled hops of that single orbit are a free kinetic scale versus
frozen T = η; the coupled spreads then lie in [0.293904, 0.347815]
and are not unique. That scale was not chosen to minimise spread.

At n = 2 and n = 3, combinatorial spreads remain 0.263370 and
0.266068 (cycle 44). Named geometric coupled spreads at n = 3
lie in [0.381, 0.715], all above the threshold; gauge-only
spreads are either the combinatorial value or larger. The
smallest spread observed anywhere in the predeclared set is
G_euc_inv, coupled, at n = 2: 0.089201 (still ≥ 0.05), and at
n = 3 that same convention is 0.380871. Axis scans that change
one edge or face orbit away from G_comb typically *increase*
the spread (often to O(1)). Vertex-weight scans do not change
the spread (the coexact Maxwell Gram and the hops are independent
of *0).

## H4. No resolution, no K_γ

Clause (A) fails at n ≥ 2. Clause (B) fails because several
geometric conventions are well-defined and none of them, nor
G_comb, is unique Maxwell at n = 3. A proper subset with a
smaller (but still non-unique) spread was not selected as
“the” weighting. No identification with K_γ, and no comparison
with R_α or 1/137.036, was performed.

Why, exactly: A5 invariance on the refined 2-complex fixes
weights only up to a 10-parameter cone at n = 3. Every
predeclared ray in that cone, including every named Hodge star
of the derived Euclidean 12-point set, leaves a generalised
Maxwell spread of at least 9% (and typically 26% or more). The
~26% residual is not an artefact of the combinatorial inner
product alone, and it is not removed by any unique derived
weighting.

## Integrity

Predeclaration sha256:
`58aeb6e81a4734f30901577a6d675d308efe445924f308de2db95f42c418438a`.
No ARF target was used to select a weighting or a residue.
