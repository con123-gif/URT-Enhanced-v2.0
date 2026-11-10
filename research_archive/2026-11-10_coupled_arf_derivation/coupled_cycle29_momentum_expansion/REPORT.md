# Coupled cycle 29 — momentum expansion of the π-flux kernel

Classification: **PROVED**. The canonical Frobenius projection of
the large-vev π-flux kernel is m² I with m² → 1/12 (T = 0) and
m² → tanh(10/(2η))/12 (T = η). The Maxwell coefficient κ is
consistent with 0, is not unique-and-positive, and was not compared
to R_α. Advances a physical ARF? No.

## Projection
Π_T = m² I + κ Δ1_T + β Δ1_T² + R, R ⊥ span{I, Δ1_T, Δ1_T²},
with coefficients the unique Frobenius least-squares minimisers.
No ARF target entered the projection.

At the physical large-vev slice r_* = 8.612606863776222×10^5:

T = 0:
    m² = 0.083328888  (1/12 to relative 5.3×10^{-5})
    κ  = 4.41×10^{-7},   β = −9.54×10^{-8}
    ρ_3 = 3.14×10^{-5},  w_κ = 1.88×10^{-5},  w_m = 0.999998

T = η:
    m² = 0.056875423  (tanh(10/(2η))/12 = 0.056881153)
    κ  = 4.80×10^{-7},   β = −7.98×10^{-8}
    ρ_3 = 4.16×10^{-5},  w_κ = 3.00×10^{-5},  w_m = 0.999991

(U3) fails at both temperatures (the Δ1_T piece is not substantial),
so κ is not a unique positive Maxwell coefficient.

## Intermediate amplitudes
At r = 100, T = 0 one has m² = 0.06010 (still 28 % below 1/12) and
κ = 1.18×10^{-3} with w_κ = 0.068 < 0.10; the two-parameter κ_2
even has the opposite sign (−2.11×10^{-4}), so the Maxwell piece is
not stable. At r = 20 the kernel is not positive definite and the
three-projection residual is 0.99. The predeclared 5 % ye-independence
test of (m², κ) against r = 100 therefore fails, as in cycle 25:
r = 100 is not yet asymptotic. At r_* the decomposition has already
saturated at the unpaired-mode identity, which is independent of
further increases in y_even.

## α_eff versus R_α
Not compared. Look-elsewhere was not run. No rewriting of m² = 1/12
or of κ_iso = 1/48 was promoted as an α.

## Integrity
Predeclaration sha256:
`67aee2a300fc0dc2c8563d71af1cae223fc62a65c1dbe579bf1e5f88b843b941`.
No ARF target was used.
