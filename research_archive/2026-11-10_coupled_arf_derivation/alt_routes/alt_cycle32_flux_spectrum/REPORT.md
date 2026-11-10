# alt_cycle32 — spectrum and fluxes of the spontaneous-A vacuum

Classification: PROVED on H1–H3. No three-singlet spectrum; C_mass and R_mass were not compared.
Advances a physical ARF? No.

## Predeclared policy
Masses are the positive BdG eigenvalues at the cycle-31 minimisers, for κ = 0 and separately for κ = 1. The unpaired mode is “lifted” when E_min > 10^{-6}. Scale-invariant ratios among the lowest three distinct positive values, and the Koide-like quotient, are to be written first only if a unique orbit exists for a stated κ and the positive spectrum has at least three distinct values; C_mass and R_mass are then compared, with the T1/G_strict grammar. If the two κ choices remain and give different vacua, or if there are not three nondegenerate charged singlets, no comparison is performed.

The closed flux-comparison list, recorded before any numerical Φ was inspected, is: 2π/φ², γ = 1/81, δ* = 80π/(1053 φ), η, Δ, θ = 2π/φ², r = π/e, and the standard U(1) quanta 0, π/5, 2π/5, π/3, 2π/3, π/2, π, 2π. A match at relative (or, for target 0, absolute) 10^{-4} is a coincidence unless it is an identity.

## Result

### κ = 0 vacuum (all-π)
Every face holonomy is −1 and every principal flux is π (the κ = 0 T = 0 and T = η minimisers agree with the exact all-π connection to 10^{-7} in Φ). The unpaired constant mode is lifted: E_min = 10.000.

The large pairing levels are the same A4 multiplets as alt_cycle26, unsplit by the flux (the all-π connection is A5-invariant). Grouped as in cycle 26:

- 10 (×1) — the former unpaired mode, now K[π] v0 = 10 v0
- 3.144879×10^5 (×3) — r_* √(2/15)
- 3.51606×10^5 (×3) and 3.51610×10^5 (×3) — the known finite-r Laplacian split (relative 1.27×10^{-5}) of one pairing level r_* √(1/6)
- 4.717319×10^5 (×2) — r_* √(3/10)

Within each would-be triplet a further 5×10^{-8} scatter is already present at A = 0 and is not an A=π splitting. The leftover doublet remains, so the spectrum is not three nondegenerate charged singlets.

### κ = 1
The T = 0 noncompact run returns to A = 0 among the seeds of cycle 31: E_min = 0 (unpaired not lifted) and the same pairing multiplets. The two discrete κ choices therefore produce qualitatively different vacua. Gradient / small-flux configurations that lift the unpaired mode at essentially zero holonomy (cycle 31) change K, not Δ, so at large r they shift pairing levels only by O(||K||/r) ~ 10^{-5} and cannot split the A4 multiplets into structural singlets.

### Flux comparison
For the κ = 0 pattern the single distinct |Φ| is π, which matches the predeclared standard quantum π at relative error 0 (an identity: every face holonomy is −1). It does not match the user-named values:

- |π − 2π/φ²| / (2π/φ²) = 0.309 (2π/φ² ≈ 2.400)
- |π − γ| / γ = 253 (γ = 1/81)
- |π − δ*| / δ* = 20.3 (δ* ≈ 0.148)

nor η, Δ, or r = π/e. For the κ = 1 / A = 0 pattern the unique |Φ| is 0, which matches the predeclared quantum 0.

### ARF comparison
No unique parameter-free three-singlet spectrum exists (κ remains ambiguous, and neither vacuum consists of three nondegenerate charged singlets). Ratios were not written for comparison; C_mass, R_mass and the T1/G_strict grammar were not run on them.

## Verification
`/workspace/arf_research/alt_cycle32_flux_spectrum/test_flux_spectrum.py` and `results.json`.
Predeclaration sha256: `5a953fcfa10fe4b61f5697125390893847acb3e4c788241fac6393d8df6b98fc`.

## Next obstruction
The lifted unpaired mode at κ = 0 is a singlet of energy 10 sitting under unsplit A4 multiplets 3 ⊕ 6 ⊕ 2. Three nondegenerate charged singlets still require a derived A4-breaking that neither the all-π flux nor a large-r change of K supplies.
