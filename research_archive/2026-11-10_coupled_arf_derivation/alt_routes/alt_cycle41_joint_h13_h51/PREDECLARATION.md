# Predeclaration — alt_cycle41: joint H13 + H51 vacuum

Date: 2026-11-10 (Europe/London)
Route: (41) Joint H13+H51 vacuum: is the relative orientation of the two condensates fixed by the coupled terms (shared hidden 4_5 field, Cbridge, V_hist)? If both couple to the same hidden 4_5 they must align — then the stabiliser stays A4; check carefully. Report the true joint stabiliser.

## Setup
S1. There is a single hidden 4_3 ⊕ 4_5. V_hist is a quadratic on that one copy. The even (odd) frames of both the icosahedron and the duality-lifted dodecahedron couple to the same 4_5 (respectively 4_3). There are not two independently orientable hidden vectors; a single h ∈ ℝ⁴ ⊕ ℝ⁴ enters both pairing matrices,
    Δ_32(h) = Δ_ico(h) ⊕ Δ_dodeca(h).
    “Relative orientation” therefore means: does the joint minimiser of
    Ω(h) = V_hist(h) + F_BdG^ico(Δ_ico(h)) + F_BdG^dodeca(Δ_dodeca(h))
    (and the variant with Cbridge kinetic mixing, below) sit at the H13 A4 ray, at a different dodeca-preferred ray, or at a compromise direction with a smaller stabiliser?

S2. The A5-covariant joint fermion space is the 32-vertex union of the icosahedron (12) and the dual dodecahedron (20). Tetra/cube/octa are excluded from the joint A5 problem (they are not A5-sets). Two kinetics are compared:
    - K0 = L_ico ⊕ L_dodeca (Hodge per solid);
    - KC = K0 + Cbridge|_{32}, the vertex-vertex restriction of the archived five-solid Cbridge to these 32 sites (charge-0 mixing of constants and spatial dipoles). Cbridge does not itself depend on h.

S3. Large-r proxy: maximise α(ĥ) = ||Δ_ico(ĥ)||_* + ||Δ_dodeca(ĥ)||_* over S³. The physical joint ray at y_even = 1, T = η is the minimiser of Ω along that ĥ (and a check that no sampled competing type — A4, 3+2, 2+2+1, generic — gives a lower Ω). r_* is predicted by (α_ico + α_dodeca) / (4 c_even) in the large-vev balance and is verified by a radial scan.

S4. Stabilisers of ĥ_ico (alt_cycle25), ĥ_dodeca (alt_cycle40), and ĥ_joint are computed by the same A5 action (60 rotations). Overlaps |ĥ_a · ĥ_b| (sign-identified) are recorded. Alignment means ĥ_joint lies on the A5-orbit of ĥ_ico to absolute inner-product 1 − 10^{-8}, or, more weakly, that all three rays have the same named stabiliser of order 12 (A4) and Ω is degenerate on the five-point A4 orbit.

S5. F and V ∘ F do not add an independent dodeca orientation (F sources h from the H13 portal 3 ⊕ 5; alt_cycle28 already found that V ∘ F realises the A4 cone without an extra hidden quartic). They are not re-introduced as new potentials.

## Hypotheses
H1. Both pairings couple to the same hidden 4_5, so a single h is shared. There is no extra relative-orientation modulus.
H2. If both nuclear-norm landscapes are maximised on the A4 orbit (five sign-identified directions), the joint landscape is too, Ω is equal at those five points, and the joint stabiliser is A4. Cbridge, being A5-invariant and h-independent, does not reduce A4.
H3. If instead the dodeca nuclear-norm maximiser has a different orbit type, the joint maximiser of α_ico + α_dodeca is computed and may have stabiliser A4 (ico dominates), the dodeca type, or a proper subgroup (compromise). The true joint name is the output, not an input.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
