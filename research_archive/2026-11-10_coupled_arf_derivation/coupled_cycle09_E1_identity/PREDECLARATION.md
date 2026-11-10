# Coupled cycle 09 predeclaration — is 3/20 − E1 equal to δ★?

Derive E1 in closed form from the original operators and decide whether
3/20 − E1 = δ★ is an identity or a numerical near-hit.

Fixed derivation, before high-precision evaluation:

- E1 is the lowest eigenvalue of H0, already identified as
  r² · min_m (2 − 2 cos(θ − 2π m/24)) with r = π/e, θ = 2π/φ², m = 9.
- 2π · 9/24 = 3π/4, so
  E1 = (π/e)² · (2 − 2 cos(2π/φ² − 3π/4))
     = 4 (π/e)² sin²(π/φ² − 3π/8).
- 1/φ² = 2 − φ = (3 − √5)/2, hence
  E1 = 4 (π/e)² sin²( π(9 − 4√5)/8 ).
- δ★ = 80π / (1053 φ), Δ = 3/20 − δ★.
- Algebraic identity: (3/20 − E1) − δ★ = Δ − E1,
  so “3/20 − E1 ≈ δ★” is exactly the same statement as “E1 ≈ Δ”,
  rewritten with a larger denominator (δ★ rather than Δ).

High-precision evaluation (mpmath, ≥ 80 decimal places) of
E1, Δ, δ★, 3/20 − E1 and both relative discrepancies. If the difference
is stable under increasing precision and many orders above the working
epsilon, the equality is FALSIFIED. If it collapses to zero, PROVED.
No digit of δ★ is inserted into E1.
