# alt_cycle29 — charge-2 pairing, geometric U(1), and the photon

Classification: H1 and H2 PROVED; H3 FALSIFIED; H4 PROVED (no R_α comparison). Overall CONDITIONAL.
Advances a physical ARF? No.

## Result
The pairing bilinear ψ_i Δ_{ij} ψ_j picks up e^{i(λ_i+λ_j)} under the Hodge gauge transformation of alt_cycle22, while hopping picks up e^{i(λ_j−λ_i)} and is cancelled by A → A + dλ. Δ is therefore charge 2. A frozen real Δ breaks local U(1) completely and breaks global U(1) to ℤ2 (α ∈ {0, π}). The frozen vacuum is a superconducting phase in that symmetry sense.

The cycle-26 BdG zero mode is the unpaired constant fermion: K v0 = 0 and ||Δ v0|| ≈ 1.0×10^{-10} (the residual frames are divergenceless pairing currents). It is electrically charged and is not the U(1) Goldstone. The Goldstone is the overall phase of Δ: replacing Δ by e^{iθ} Δ leaves the BdG spectrum invariant (max difference 4.7×10^{-10}). That phase is a bosonic mode and would be eaten by A if a charge-2 Higgs kinetic term were present.

## Meissner / photon (H3 falsified)
The archived action has no tree-level |D_A Δ|². The only A-dependence is the magnetic Laplacian inside the Nambu potential. The fermion-induced London kernel Π = ∂²Ω_BdG/∂A ∂A, computed on the 19-dimensional graph-cycle space at a numerically safe pairing scale r = 20, is not positive definite:

- T = η: eigenvalues in [−0.00155, +0.00665] (4 negative, 15 positive)
- T = 0: eigenvalues in [−0.0953, −0.0708] (all negative)

Finite-A scans at r = 10, 100 and at the cycle-25 vacuum r_* ≈ 8.61×10^5 confirm that Ω(A) typically decreases when a unit exact or transverse A is turned on. At T = 0 and large r the curvature is ≈ −1/12 in both directions, consistent with the unpaired mode contributing −½ λ_min(K[A]) once pairing has projected it out of Δ. One exception (r = 10, T = η, one transverse direction) is locally positive and does not make the kernel positive definite.

So this truncation does not Higgs the photon: there is no demonstrated Meissner mass. The cycle-23 infrared problem (a massless Hodge photon coupled to a massless charged fermion) remains. R_EM as that massless-photon residue is unchanged in kind; it is not compared with R_α.

## Verification
`/workspace/arf_research/alt_cycle29_charge2_higgs/test_charge2_higgs.py` and `results.json`.
Predeclaration sha256: `6179cdd27ac0b876eb13df54c70028463828f9385207d49effe44501f789fca7`.

## Next obstruction
A tree-level charge-2 kinetic term for Δ, or another derived Higgs coupling to A, is not supplied by the archived system. The unpaired charged fermion survives and keeps the EM response infrared-sensitive.
