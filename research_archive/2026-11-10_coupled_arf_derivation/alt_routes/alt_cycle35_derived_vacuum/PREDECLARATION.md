# Predeclaration — alt_cycle35: spectrum and induced-α in the derived vacuum

Date: 2026-11-10 (Europe/London)
Route: (35) In the derived vacuum of route 34, report the spectrum; if three nondegenerate singlets appear, predeclare and compare mass ARFs with look-elsewhere; also predeclare and compute the induced-κ EM coupling ratio versus R_α (an induced 1/κ is the natural effective α) with look-elsewhere.

## Spectrum policy
P1. The derived vacuum is the full-Ω_matter minimiser of the primary sector of alt_cycle34 (12-component H13, graph kinetic, even pairing, κ_ext = 0). The Hodge and spinor sectors are reported as alternatives; if they select a qualitatively different A, both spectra are recorded and neither is discarded by hand.
P2. Masses are the positive BdG eigenvalues. The unpaired mode is “lifted” when E_min > 10^{-6}. Three nondegenerate charged singlets means at least three distinct positive levels, all of multiplicity one, with no leftover multiplet of multiplicity ≥ 2 after grouping at relative 10^{-5} (the Laplacian split already identified in alt_cycle26).
P3. If P2 holds for a unique orbit, the scale-invariant ratios among the lowest three distinct positive values and the Koide-like quotient (μ1+μ2+μ3)²/(μ1²+μ2²+μ3²) are written to disk first. Only then are relative errors against
    |C_mass|, |R_mass|, |C_mass/R_mass|, |R_mass/C_mass|
    computed, and the alt_cycle08 T1/G_strict grammar is run. A numerical near-hit is not a derivation. If the uniqueness or three-singlet conditions fail, C_mass and R_mass are not compared.

## Induced-α policy (recorded before any number is compared to R_α)
P4. R_α = 3/(64 φ) + 1/(79 φ²) is the comparison target named by the user. The natural effective α from an induced Maxwell coefficient, as specified, is
    α_eff = 1 / κ
    with κ taken to be κ_iso of alt_cycle34 when that coefficient is unique, finite, positive, and Maxwell-like by the thresholds of that cycle (relative spread of generalised eigenvalues < 0.05; Frobenius residual to Δ1_T < 0.10; every |κ_i| < 10^{10}; all κ_i > 0).
    Also recorded, and compared only under the same conditions:
    - α_REM = 1 / κ_REM,   κ_REM = λ_min(Π_T) / λ_min(Δ1_T)
    - the raw coefficient κ_iso itself (the project’s earlier R_EM was this kind of ratio, not its reciprocal)
P5. If induced κ is negative, non-unique, infinite, or not Maxwell-like, 1/κ is not an electromagnetic coupling and is not compared to R_α. The reason is stated. No alternative algebraic rewriting of Π (for example minus one over twelve, or a ratio of traces against a different operator) is promoted after the fact.
P6. When a comparison of α_eff to R_α is performed, relative error |α_eff − R_α| / R_α is reported and the T1/G_strict two-atom grammar is run on {α_eff, R_α}. A match at relative 10^{-4} is a coincidence unless it is an identity.

## Hypotheses
H1. In the primary derived vacuum the flux pattern is all-π (every face holonomy −1) and the spectrum is the alt_cycle32 pattern 10 ⊕ 3 ⊕ 6 ⊕ 2, not three nondegenerate charged singlets.
H2. Primary induced κ is not a unique positive Maxwell coefficient, so α_eff is not compared to R_α.
H3. The spinor alternative, if it selects A = 0, has the alt_cycle33 spectrum 2 ⊕ 6 ⊕ 12 ⊕ 4, still not three singlets.

## Integrity
No ARF target is inserted into Ω, Π, or A. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
