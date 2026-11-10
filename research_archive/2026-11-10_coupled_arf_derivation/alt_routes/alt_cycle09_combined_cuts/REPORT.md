# alt_cycle09 — residual Yukawa dimension after all proven cuts

Classification: PROVED on H1–H4.
Advances a physical ARF? No.

## Result
Imposing Hodge kinetic, inversion, anomaly-free charges, Ward identities and positivity at once leaves a 4-real-parameter Yukawa space plus one overall kinetic scale. That is not a ray.

On geometric H13, inversion keeps exactly four Weyl channels: 3⊗5 and 3'⊗5 (odd, to 4_3) and 3⊗3' and Sym²(5) (even, to 4_5). Ward identities vanish identically once q_vertex = 1. Positivity of Σ = Y Cov Y† holds for every (α, β, γ, δ). Hodge fixes only the fermion kinetic ray, leaving its scale free.

H13 with q_vertex = 1 is not anomaly-free by itself: Tr Q = q_c + 12 and Tr Q³ = q_c³ + 12 have no common integer solution (q_c = −12 gives Tr Q³ = −1716). Anomaly cancellation needs the companion histories. The minimal anomaly-free assignments that still allow the H13 pairing are (1, −1, 0, 0) and (1, −1, ±2, ∓2), each with charge-filtered pairing count m = 4, matching the same four channels. After inversion each copy of the irrep 4 has a definite parity and maps to exactly one hidden quartet, so the residual dimension is m, not 2m. The larger assignment (1, −1, 1, −1) has m = 35, still not a ray.

Combined residual: 4 Yukawa parameters + 1 kinetic scale.

## Verification
`/workspace/arf_research/alt_cycle09_combined_cuts/test_combined_cuts.py` and `results.json`.
Predeclaration sha256: `55998793b16af7fdf0ae60d8d745a3ce30feb873bb5afe89ce7d1b50ba9bf9b6`.

## Next obstruction
A further principle is still needed to cut 4 (plus a scale) down to a single ray.
