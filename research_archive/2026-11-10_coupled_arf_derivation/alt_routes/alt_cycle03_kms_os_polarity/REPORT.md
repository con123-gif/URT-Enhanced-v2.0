# alt_cycle03 — KMS / reflection positivity / OS polarity

Classification: H1 FALSIFIED in part; H2 PROVED (with a qualification); H3 PROVED; H4 CONDITIONAL; H5 PROVED.
Advances a physical ARF? No.

## Result
The archived charge-2 clock Laplacian at constant gold angle θ = 2π/φ² is unitarily a phased cycle: spectrum 2 − 2 cos(2θ + 2πk/24) ⊆ [0, 4]. It is positive semidefinite, but the charge-2 Wilson loop is not 1, so there is no kernel. Numerically λ_min(L₂) ≈ 0.007658. Consequently
λ_min(A₃) = 18 + (π/e)² λ_min(L₂) > 18, λ_min(A₅) = 16 + (π/e)² λ_min(L₂) > 16,
while λ_min(A₃) − λ_min(A₅) = 2 exactly. The hypothesis that the kernel exists and that the minima are exactly 18 and 16 is therefore false for the archived constant-angle clock. The weaker bound A ≽ {18,16}I still holds, and is strict.

The Schur Hessian blocks ½I − A⁻¹ are positive definite for both sectors (λ_min(A) > 2). The relative weight w multiplies a whole block and cannot change its sign, so both polarities w = Δ² and w = 1/Δ² are allowed. Cycle 07’s numerical bounds 2/9 and 7/32 remain valid lower bounds.

Naive Osterwalder–Schrader positivity for the geometric reflection n ↦ −n holds for the unphased cycle (minimum OS eigenvalue ~ 0 to 10⁻²²) and fails for the archived gold-angle clock (OS minima ≈ −2.04×10⁻⁴ for A₃ and similarly for A₅). The failure is a physical-flux effect and is shared by both hidden sectors, so it cannot select a polarity.

A positive-temperature KMS reading of the clock constants 16 < 18 says sector 5 is lighter, the opposite of the ρ* occupation Δ² ≪ 1 and in the same direction as the Schur-bound covariance polarity (cov₅/cov₃) = (64/63)/Δ². Recovering the exact value 1/Δ² still requires the extra identifications β = η and an energy unit in which E₅ − E₃ = −2.

The first spectral gaps of A₃ and A₅ are equal (both (π/e)² times the first positive mode of L₂) and do not involve Δ.

## Verification
`/workspace/arf_research/alt_cycle03_kms_os_polarity/test_kms_os_polarity.py` and `results.json`.
Predeclaration sha256: `d0b9f7bfe0a9abe4feb6977e63180d66f0987c9dc77641b5c7d65e9f9be65c03`.

## Next obstruction
RP/OS and Hessian positivity do not choose a polarity. A KMS argument points at the reversed ensemble, but only after identifications that have not been derived.
