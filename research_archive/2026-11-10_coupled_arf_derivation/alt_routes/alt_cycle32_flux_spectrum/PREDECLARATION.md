# Predeclaration — alt_cycle32: spectrum and fluxes of the spontaneous-A vacuum

Date: 2026-11-10 (Europe/London)
Route: (32) In the vacuum of route 31: does the fermion spectrum split into three nondegenerate charged singlets? Does the unpaired constant mode get lifted? Predeclare ratios, then compare to C_mass and R_mass with look-elsewhere. Does the per-face flux come out as a recognisable value (2π/φ², γ, δ*)? Predeclare.

## Spectrum policy
P1. Masses are the positive BdG eigenvalues at each distinct (up to A5 and time reversal) minimiser of alt_cycle31, for the primary action of that cycle (κ = 0) and, separately, for the Hodge identification κ = 1. If the two discrete κ choices produce qualitatively different vacua, both spectra are recorded and neither is discarded by hand.
P2. If a vacuum’s direction or flux pattern is continuously degenerate, or if two discrete κ choices remain and give different ratio sets, there is no single parameter-free spectrum. Diagnostic spectra may be recorded, but C_mass and R_mass are not compared.
P3. If a unique orbit of vacua exists for a stated κ and the positive spectrum has at least three distinct values, the scale-invariant ratios among the lowest three distinct positive values, and the Koide-like quotient (μ1+μ2+μ3)²/(μ1²+μ2²+μ3²), are written to disk first. Only then are relative errors against
    |C_mass|, |R_mass|, |C_mass/R_mass|, |R_mass/C_mass|
    computed, and the alt_cycle08 T1/G_strict grammar is run. A numerical near-hit is not a derivation.
P4. The unpaired mode is “lifted” when the smallest positive BdG energy is greater than 10^{-6} in Laplacian units.

## Predeclared flux comparison list
Recorded first: the 20 face holonomies e^{iΦ_f} and the principal fluxes Φ_f ∈ (−π, π]. Distinct |Φ| values (and the raw (dA)_f if they differ from the principal branch) are then compared to this closed list, and only this list:

- user-named: 2π/φ², γ = 1/81, δ* = 80π/(1053 φ)
- other frozen named constants already used in the project: η = −ln Δ, Δ = 3/20 − δ*, θ = 2π/φ² (identical to the first entry), r = π/e
- standard compact-U(1) flux quanta: 0, π/5, 2π/5, π/3, 2π/3, π/2, π, 2π
  (π is the half-flux quantum; 2π/5 and π/5 are the spherical excess of an icosahedral face, 4π/20 = π/5, and its double; 2π/3 is the triangular face angle scale)

No other real number is promoted to a “recognised” flux after the fact. Relative error |Φ − t|/max(|t|, 10^{-12}) and absolute error are reported for every list entry. A match at relative 10^{-4} (or absolute 10^{-4} when the target is 0) is a numerical coincidence unless it is an identity.

## Hypotheses
H1. If the κ = 0 minimiser is the all-π connection (every face holonomy −1), the unpaired constant mode is lifted (to energy 10 in the large-vev limit, since K[A=π] v0 = 10 v0) and the A4 multiplets of alt_cycle26 are not split into three singlets, because that flux pattern is A5-invariant.
H2. Three nondegenerate charged singlets occur only if the combined (Δ, A) stabiliser is small enough to split the 3 of A4 (ℤ3, V4 or 1), without a leftover continuous modulus.
H3. Comparison with C_mass and R_mass is performed only under P2–P3. The predeclared flux list is compared in every case.

## Integrity
No ARF target is inserted into Ω or into A. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
