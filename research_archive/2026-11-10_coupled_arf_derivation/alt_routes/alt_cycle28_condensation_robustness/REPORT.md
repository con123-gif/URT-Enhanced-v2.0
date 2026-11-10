# alt_cycle28 — robustness of the 4_5 pairing condensate

Classification: PROVED on H1–H4.
Advances a physical ARF? No.

## Result
The pairing minimum remains finite at T = η and at T = 0, for (y_even, y_odd) = (1, 0) and (1, 1). In every case r_* = 8.61261×10^5 and Ω_* ≈ −9.928×10^5, matching the large-vev balance r_* ≈ (nuclear norm)/(4 c_even) = 8.55835×10^5 to 0.6%. There is no runaway.

V∘F(α) = V_hist(F(α ⊙ α)) is quartic in the visible 3 ⊕ 5 and quadratic in the hidden amplitude once h = F(S). Coupled cycle 03 already showed that F : Sym²(ℝ⁸) → 4_3 ⊕ 4_5 is surjective, so this does not add a hidden quartic beyond V_hist. The cycle-25 A4 direction does lie on the rank-1 cone: a real α with ||α|| ≈ 1.516 realises the unit ĥ5, and ||α|| ≈ 1890 realises the large vev, with ||q3|| ≈ 0. The portal V_hist(h − q(α)) can therefore slave a visible field to the hidden condensate, but the hidden potential remains V_hist.

The huge number is not a unit error. Hidden amplitudes use the orthonormal frames of coupled cycles 03/11, the same units as cycle 13’s ρ. In those units the tree stiffness c_even = Δ² c5 = 1.356×10^{-6} is genuinely tiny, and an O(1) pairing energy per mode balances it at r ~ 10^6.

## Reconciliation with cycle 13
Cycle 13 writes the Dirac one-loop quadratic as ½ (H + y² π) ρ², with archived indices π_o = 0.036866 and π_e = 0.026333. That π is ||Λ^{-1/2} T Λ^{-1/2}||_F² for the cycle-16 measure −log det(Λ + y h·T) on the Hodge-weighted operator Λ (no kernel). It *stiffens*: at y_e = 1 the Dirac coefficient of ρ5² is ½(H5 + π_e) = +0.013168 > 0, so the origin stays stable and there is no Dirac condensation.

The pairing susceptibility of alt_cycle25 is χ_even = 0.038416 at T = η (χ_odd = 0.03923). The pairing coefficient of r² at y_e = 1 is c_even − χ_even = −0.038414 < 0, so the even channel condenses. χ and π_e/2 = 0.013167 are the same order of magnitude (ratio 2.92) and opposite in sign. They are alternative fermion measures for the same residual frames, not two terms of one potential, and must not be added. A counterfactual that adds +½ π_e on top of pairing would shrink r_* to 88.1; that mixing is not justified by either archived measure.

An induced odd field at the even vacuum with y_odd = 1 is tiny (||h3|| ≈ 6.70×10^{-6}, ||h3||/||h5|| ≈ 7.8×10^{-12}). The stabiliser of the even pairing matrix, and of the physical sum, remains A4.

## Verification
`/workspace/arf_research/alt_cycle28_condensation_robustness/test_condensation_robustness.py` and `results.json`.
Predeclaration sha256: `4a6b86143276595bc0ce26e85fcb2d2f31facf0d88a6f52f45a5dbdf30baa01e`.

## Next obstruction
A4 is robust and the vev is finite. The residual ratio y_even : y_odd is still free. Whether the charge-2 condensate Higgses the geometric U(1), and whether a subleading effect splits the A4 triplets, are routes 29 and 30.
