# Induced photon kernel on the icosahedron (parameter-free matter)

Status: CLOSED INTERNALLY (floating-point certificate, values identified as exact rationals) /
PHYSICAL IDENTIFICATION PENDING. No gate closed.

Prior work: `2026-10-24_alpha_physical_gate/NATIVE_137_COULOMB_CHIRAL_CHARGE_INDEX_THEOREM.md` (15 Tr L⁺ = 137;
chiral Δ-deformation gives 105 + 32/(1 − Δ²/15), even in Δ). No archived file computes a matter-induced kernel on this graph.

Setting. Maxwell form on the 30 icosahedral links: M = d1ᵀd1, levels 3−√5 (3), 2 (5), 3 (4), 5 (4), 3+√5 (3);
15 Tr M⁺ = 137. Matter: unit-charge hopping on the 12 vertices, H(θ) = Peierls adjacency, det H(0) = 625.
Induced action Γ = −log|det H(θ)|, Hessian Π at θ = 0.

Results (19 physical flux modes):
1. Π obeys the Ward identity and commutes with M.
2. Π = 8/5 on both 3-dimensional sectors, **6/5 on both hidden 4-dimensional sectors (4₃ and 4₅)**, 0 on the 5.
3. Stiffness per unit Maxwell form κ = Π/M: 2.0944 = (8/5)/(3−√5), 0, 2/5, 6/25, 0.3056 = (8/5)/(3+√5).
4. Π ≥ 0: flat links are stable here (unlike v61), with five exactly flat directions.
5. With bare Maxwell term at unit coupling, 15 Tr (M + Π)⁺ = 87.08. To first order in a coupling g²,
   15 Tr (M + g²Π)⁺ = 137 − 136.88 g²; the hidden 4₃⊕4₅ part of that coefficient is exactly 272/25.

Not established: any value of g. No forced rule turns these numbers into +0.036; the first-order propagator
correction is negative. The missing input is one number, the bare coupling, which this construction does not supply.
