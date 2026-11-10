# alt_cycle07 — anomaly cancellation on the four history orbits

Classification: PROVED on H1–H4.
Advances a physical ARF? No.

## Result
Geometrically diagonal U(1) charges on the four A5-orbits (12A, 12B, 20A, 20B) are tuples q ∈ ℤ⁴. For Weyl fermions the anomaly-cancellation conditions are
Tr(Q) = 12 q₁₂ₐ + 12 q₁₂ᵦ + 20 q₂₀ₐ + 20 q₂₀ᵦ = 0
and
Tr(Q³) = 12 q₁₂ₐ³ + 12 q₁₂ᵦ³ + 20 q₂₀ₐ³ + 20 q₂₀ᵦ³ = 0.

The opposite-charge family (q, −q, r, −r), which is exactly the assignment compatible with a sign involution that swaps the two 12-orbits and the two 20-orbits and reverses charge, solves both equations for every integer q, r.

Inside the computational window |qᵢ| ≤ 3 (2401 assignments) there are 49 anomaly-free points, and every one of them belongs to that opposite-charge family. There are no other solutions in the window.

The pairing count m of cycle 03, evaluated on these 49 points, never equals 1. The values that occur are m ∈ {0, 4, 15, 20, 31, 32, 35}. The minimal positive value is m = 4, attained on the six assignments (±1, ∓1, 0, 0), (±1, ∓1, ±2, ∓2) and (±1, ∓1, ∓2, ±2). Two hidden quartets then give Yukawa dimension 2m = 8, matching the H13 / single-12-orbit count of cycles 01 and 03. Examples: (1, −1, 0, 0) has m = 4; (0, 0, 1, −1) has m = 15; (1, −1, 1, −1) has m = 35.

Anomaly cancellation is therefore a real constraint — it forces opposite charges on sign-swapped orbit pairs — but it does not reduce the Yukawa space to a ray. No additional nonabelian (Yang–Mills) anomaly was imposed.

## Verification
`/workspace/arf_research/alt_cycle07_anomaly_charges/test_anomaly_charges.py` and `results.json`.
Predeclaration sha256: `3b9bae41a09c87c673915c1d0fa910042da19e9698f2e7bcf4fb430d236ef158`.

## Next obstruction
The anomaly-free charge lattice is essentially two-dimensional, and the smallest positive pairing dimension on it is still 8 real Yukawas.
