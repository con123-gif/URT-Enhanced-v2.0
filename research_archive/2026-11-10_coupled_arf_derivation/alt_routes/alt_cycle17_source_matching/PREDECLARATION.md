# Predeclaration — alt_cycle17: source-matching from Hamming-parity orbit labels

Date: 2026-11-10 (Europe/London)
Route: (17) Derive or refute source-matching (Yukawas only through t ∈ 3_odd, i.e. the statement β = 0 with α kept) from the history / Hamming-parity orbit labelling found in alt_cycle10.

## Premises taken from alt_cycle10 (reproduced, not re-fitted)
P1. The 64 histories form four A5-orbits of sizes 12, 12, 20, 20.
P2. Hamming parity of the six-bit mask is constant on each orbit: one 12-orbit is all odd weight, one 12-orbit is all even weight, and the two 20-orbits are likewise split by parity.
P3. Spatial inversion (all-flip, XOR 63) preserves each orbit.

## Hypotheses
H1. Each 12-orbit, as an A5-permutation module, decomposes as 1 ⊕ 3 ⊕ 3' ⊕ 5. Hamming parity, being constant on the orbit, is an A5-invariant orbit label.
H2. Source-matching (the 1-dimensional statement that the inversion-allowed Yukawa space collapses from span{3⊗5 → 4_3, 3'⊗5 → 4_3, 3⊗3' → 4_5, Sym²5 → 4_5} to the single ray 3⊗5 → 4_3) is implied by P1–P3.
H3. Any linear operator built from Hamming parity (equivalently: any linear combination of the four orbit projectors) acts as a scalar on each orbit and therefore as the same multiple on the 3 and the 3' inside a 12-orbit. Such an operator cannot kill Hom(3'⊗5, 4_3) while keeping Hom(3⊗5, 4_3).

H2 will be classified FALSIFIED if H1 and H3 hold, because H3 blocks the implication asserted by H2.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
