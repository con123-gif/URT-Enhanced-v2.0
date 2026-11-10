# alt_cycle30 — residual A4 and three singlet masses

Classification: PROVED on H1–H4. No derived splitting; C_mass and R_mass were not compared.
Advances a physical ARF? No.

## Result
The 4 of A5 branches under A4 as 1 ⊕ 3, and the cycle-25 condensate is the A4-singlet inside 4_5. The spatial 3 of A5 remains an irreducible 3 of this A4 over ℂ, so no A4-invariant operator can split it into 1 ⊕ 1' ⊕ 1''. Three nondegenerate singlets would require a derived breaking of A4 at least to ℤ3 (or to V4 or to 1). Restriction to ℤ2 would give eigenvalues (+1, −1, −1), not three nondegenerate masses.

The listed derived perturbations all preserve A4:

- Induced odd response at y_odd = 1: ||h3|| ≈ 3.03×10^{-5} (ratio to ||h5|| ~ 10^{-11}). The pairing matrix Δ_even + Δ_odd still has stabiliser A4.
- Portal V_hist(h − q(α)): the same tiny h3 and the same A4.
- ρ* = (I4 ⊕ Δ² I4)/[4(1+Δ²)] is an A5-scalar. Used as a metric on (h3, h5) it returns h3 = 0 and leaves A4 intact.

The 24-clock phase θ = 2π/φ² ≈ 137.508° (the gold angle) has no labelling-independent insertion on the icosahedral 2-complex: H¹(S²) = 0, and a constant face-flux 2-form generates H² and is not exact. A uniform assignment A_e = θ on stored orientations depends on the arbitrary vertex numbering and is not derived. The archived use of θ is the Hodge kinetic operator Λ (eigenvalues 1, 6−√5, 6+√5, 7), which is A5-invariant.

Recomputing the BdG spectrum with A5-invariant kinetics does not produce three singlets:

- graph Laplacian K: the cycle-26 pattern, a near-zero unpaired mode plus multiplets of type 3, 3+3 and 2 (ratios still 2 : √5 : 3 at large r)
- Hodge Λ: the unpaired mode is lifted to energy 1 (the holonomy-shifted singlet); the large pairing multiplets are unchanged in type, and a doublet remains
- K + C_ico: the unpaired mode is lifted to energy 4 (the 4 P1 piece of Cbridge); again a doublet remains

In every case `three_nondeg_singlets` is false. No unique derived breaking produced three distinct singlet masses, so ratios were not compared with |C_mass|, |R_mass| or their quotient, and the T1/G_strict grammar was not run on them.

## Verification
`/workspace/arf_research/alt_cycle30_A4_splitting/test_A4_splitting.py` and `results.json`.
Predeclaration sha256: `2bc28647cfcfa8e26cf9aacc74d7625d3db91f9feef6b202832c49b188fff9c5`.

## Next obstruction
Three nondegenerate charged singlets still require a derived A4-breaking (to ℤ3, V4 or 1) that the portal, ρ*, and A5-invariant kinetics do not supply. The unpaired charged fermion remains, and y_even : y_odd remains free.
