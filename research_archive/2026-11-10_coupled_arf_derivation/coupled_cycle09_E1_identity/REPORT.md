# Coupled cycle 09 — is 3/20 − E1 equal to δ★?

Classification: FALSIFIED.
Advances an ARF? No.

## Closed form

The lowest level of `H0` is the geometric kernel tensored with the
charge-1 golden clock mode `m = 9`. With `r = π/e` and `θ = 2π/φ²`,

    E1 = (π/e)² (2 − 2 cos(θ − 3π/4))
       = 4 (π/e)² sin²(π/φ² − 3π/8).

Since `1/φ² = 2 − φ = (3 − √5)/2`,

    E1 = 4 (π/e)² sin²( π(9 − 4√5)/8 ).

The three writings (cosine, sine in φ, sine in radicals) agree to the
working precision. Independently, `δ★ = 80π/(1053 φ)` and
`Δ = 3/20 − δ★`, and the rewrite

    (3/20 − E1) − δ★  =  Δ − E1

is an identity. Thus “3/20 − E1 ≈ δ★” is exactly the same statement as
“E1 ≈ Δ”, displayed over the larger scale δ★ ≈ 0.1475 instead of
Δ ≈ 0.002489.

## High precision (mpmath, 80 and 120 decimal places)

- `E1 = 0.002558406375281020019223655813160050402273`
- `Δ   = 0.002489189840420392984093779300080079192048`
- `δ★  = 0.147510810159579607015906220699919920808`
- `3/20 − E1 = 0.1474415936247189799807763441868399495977`
- `Δ − E1 = −6.921653486062703512987651307997121022524 × 10^{-5}`
- relative `|3/20 − E1 − δ★| / δ★ = 0.00046923025360478635877` (0.04692 %)
- relative `|E1 − Δ| / Δ = 0.027806852549638090041` (2.781 %)

The absolute difference is stable when the working precision is raised
from 80 to 120 decimals, and is about 70 orders of magnitude above that
working epsilon. The equality is not an identity: the closed forms
`(π/e)² sin²(π(9−4√5)/8)` and `80π/(1053 φ)` are distinct.

(The earlier float64 value `E1 = 0.00255840637527577` agrees with the
high-precision figure through 14 significant digits; the extra digits
above replace it.)

Verification: `test_E1_identity.py`, `results.json`.
Predeclaration hash: `1d6d4cc42bb68be348c7316ecc688b07f9ab1da6e72136cd6591a8fb498e8709`
