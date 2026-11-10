# Predeclaration — alt_cycle28: robustness of the 4_5 pairing condensate

Date: 2026-11-10 (Europe/London)
Route: (28) Redo the condensate with the full coupled quartic V_hist + V∘F + fermion free energy, both parities, at T = η and T = 0. Confirm that the vev is finite and not an artefact of the quadratic truncation (the cycle-25 value ||h5||_* ≈ 8.6×10^5 is huge relative to the other scales). Check units and normalisation against coupled cycle 13’s loop indices π_o, π_e and its claim that loops stiffen the hidden channels; reconcile the two explicitly. Confirm that the stabiliser A4 is robust.

## Predeclared setup
S1. Hidden potential V_hist(h3, h5) = c3 ||h3||² + Δ² c5 ||h5||², same golden-mode constants as alt_cycle25 / coupled cycle 03. In cycle-13 notation H3 = 2 c3, H5 = 2 Δ² c5 and V_hist = ½ H3 ||h3||² + ½ H5 ||h5||².
S2. V∘F is the quartic of coupled cycle 03: for α ∈ 3 ⊕ 5 ⊂ ℝ⁸, q(α) = F(α ⊙ α) with component tensors B3, B5, and (V∘F)(α) = V_hist(q(α)). The portal completion without a new coupling is V_portal(h, α) = V_hist(h − q(α)). Because F : Sym²(ℝ⁸) → 4_3 ⊕ 4_5 is surjective (cycle 03, rank 8), every hidden vector is F of some symmetric matrix; the composite identification h = F(S) therefore does not add a hidden quartic beyond V_hist. The rank-1 cone q(α) = F(α ⊙ α) may or may not contain the cycle-25 direction; that is computed, not assumed.
S3. Fermion free energy is the Nambu / BdG pairing measure of alt_cycle25, now with both parities: Δ = y_even M_even(h5) + y_odd M_odd(h3) on the same orthonormal frames and icosahedral edges. Primary point: (y_even, y_odd) = (1, 0) as in cycle 25, and the two-parity point (1, 1). Temperatures: T = η and T = 0.
S4. Cycle-13 loop indices are the archived numbers π_o ≈ 0.036866, π_e ≈ 0.026333, defined by π = mean_k ||Λ^{-1/2} T_k Λ^{-1/2}||_F² on the Hodge-weighted operator Λ (eigenvalues 1, 6−√5, 6+√5, 7) and the hopping-projected generators. Cycle 13 writes the Dirac one-loop quadratic as ½ (H + y² π) ρ², i.e. a positive stiffness +½ π y² added to V_hist. That π is the second variation of the cycle-16 Dirac measure −log det(Λ + y h·T), not of the BdG pairing measure.
S5. Units: hidden amplitudes are those of the orthonormal frames of coupled cycles 03/11, the same units as cycle 13’s ρ. No extra conversion factor is introduced. A mismatch of π and the pairing susceptibility χ by a computed group-theoretic factor would be reported; none is inserted by hand.
S6. Stabiliser: as in cycle 25, computed from the 60 icosahedral rotations acting by conjugation on the pairing matrix, with ray-stabiliser (±) recorded separately.

## Hypotheses
H1. The minimum of V_hist + Ω_BdG remains finite at T = η and at T = 0, in both the one-parity and two-parity sectors. There is no runaway. The large cycle-25 value is the balance r_* ≈ (nuclear norm) / (4 c_even) between the tiny tree stiffness and a pairing energy that saturates linearly, not a unit error and not an artefact of dropping a hidden quartic (V∘F does not supply one).
H2. Cycle 13’s statement that loops stiffen the hidden channels refers to the Dirac measure (positive +½ π y²). The pairing measure of cycle 25 has the opposite sign (Ω_f ≈ −χ y² r² at small r). The two must not be added: they are alternative fermion measures for the same residual frames. Numerically χ and π/2 are the same order of magnitude (~10^{-2}) once conventions are aligned. A counterfactual that adds +½ π_e on top of pairing would shrink r_* from ~10^6 to O(10^2) but is not a term in either archived measure.
H3. The Dirac combination ½ (H5 + y_e² π_e) stays positive at y_e = 1 (no Dirac condensation), while the pairing combination c_even − χ_even y_e² is negative (pairing condensation). That is the reconciliation.
H4. The stabiliser of the even condensate remains A4 when V∘F, the portal, the second parity at y_odd = 1, and T = 0 are included. An induced h3, if any, lies along the unique A4-singlet inside 4_3 (so it does not reduce the stabiliser).

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
