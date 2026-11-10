# alt_cycle35 — spectrum and induced-α in the derived vacuum

Classification: PROVED on H1–H3. No three-singlet spectrum; 1/κ is not compared to R_α.
Advances a physical ARF? No.

## Predeclared policy
The derived vacuum is the full-Ω_matter minimiser of the primary sector of alt_cycle34 (κ_ext = 0). Masses are positive BdG eigenvalues, grouped at relative 10^{-5}. Three nondegenerate charged singlets require at least three distinct positive levels, all of multiplicity one, with no leftover multiplet of multiplicity ≥ 2. Ratios against |C_mass|, |R_mass| and their quotients, and the T1/G_strict grammar, are written only if that happens for a unique orbit.

The natural effective α from an induced Maxwell coefficient is α_eff = 1/κ_iso, compared to R_α = 3/(64 φ) + 1/(79 φ²) only when κ_iso is unique, finite, positive and Maxwell-like by the cycle-34 thresholds (generalised-eigenvalue spread < 0.05, Frobenius residual to Δ1_T < 0.10, all κ_i > 0). Also recorded under the same conditions: α_REM = 1/κ_REM. If those tests fail, 1/κ is not an electromagnetic coupling and is not compared.

## Result

### Spectrum of the derived (π-flux) vacuum
The unpaired mode is lifted: E_min = 10.000. Grouped at relative 10^{-5} the positive spectrum is

- 10 (×1) — former unpaired mode, K[π] v0 = 10 v0
- 3.144879×10^5 (×3) — r_* √(2/15)
- 3.516060×10^5 (×3) and 3.516104×10^5 (×3) — the known finite-r Laplacian split of r_* √(1/6)
- 4.717319×10^5 (×2) — r_* √(3/10)

This is 10 ⊕ 3 ⊕ 6 ⊕ 2, not three nondegenerate charged singlets (a doublet remains, and the triplets are unsplit beyond the 1.27×10^{-5} Laplacian effect already identified in alt_cycle26). Mass ratios were not written for comparison; C_mass, R_mass and T1/G_strict were not run on them.

The spinor alternative also selects π-flux (alt_cycle34). At A = 0 its condensed spectrum is the alt_cycle33 pattern 2 ⊕ 6 ⊕ 12 ⊕ 4, still not three singlets.

### Induced α versus R_α
In the primary sector, induced κ fails every usability test:

- T = 0: Π_T = −I/12, identity-like not Maxwell-like (residual 0.459); generalised eigenvalues in [−0.109, −0.016] with spread 2.33; κ_iso = −1/48 < 0; κ_REM ≈ −0.109 < 0
- T = η: mixed signs, not Maxwell-like (residual 0.882); κ_iso ≈ −4.5×10^{-7}

So 1/κ is not compared to R_α ≈ 0.033805. No algebraic rewrite of −1/12 or −1/48 was promoted after the fact.

## Verification
`/workspace/arf_research/alt_cycle35_derived_vacuum/test_derived_vacuum.py` and `results.json`.
Predeclaration sha256: `f401434d06dfc47b28d32e572dff02a4abcc038a5fbd592ffee0aa25dab4ccc2`.

## Next obstruction
The derived, parameter-free vacuum is the all-π flux phase with spectrum 10 ⊕ 3 ⊕ 6 ⊕ 2. Three charged singlets and a positive induced α both remain out of reach without a derived A4-breaking and a derived positive Maxwell or Higgs kinetic.
