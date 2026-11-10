# Predeclaration — alt_cycle03: KMS / reflection positivity / Osterwalder-Schrader polarity

Date: 2026-11-10 (Europe/London)
Route: (3) Use KMS, reflection positivity and OS positivity on the native 24-clock to try to fix the hidden-sector polarity Δ^2 versus 1/Δ^2 that enters the fermion self-energy.

## Frozen inputs
A3 = 18 I_24 + (π/e)^2 L2, A5 = 16 I_24 + (π/e)^2 L2, with L2 the archived charge-2 clock Laplacian (unitarily equivalent to the cycle Laplacian when the clock angle is constant).
ρ* weights: occupation p5/p3 = Δ^2 with Δ = 3/20 − δ* and δ* = 80π/(1053 φ).
Schur-reduced quadratic form (archived):
  V = (1/4)(|h3|^2 + w |h5|^2) − (1/2)(h3^† A3^{-1} h3 + w h5^† A5^{-1} h5),
  with the two candidate weights w = Δ^2 (ρ*) and w = 1/Δ^2 (reversed).
Reflection θ on the clock: (θf)_n = f_{(-n) mod 24}. Half-clock OS form on sites {0,...,11}.

## Hypotheses
H1. L2 ≽ 0 with a 1-dimensional kernel, so λ_min(A3) = 18 and λ_min(A5) = 16 exactly (constant-angle gauge).
H2. Both polarities w = Δ^2 and w = 1/Δ^2 yield a positive-definite Schur Hessian on (h3,h5), because each block satisfies A ≻ 2I independently of w > 0. Reflection positivity / OS positivity of the free clock Gaussians likewise holds for both weights.
H3. Therefore RP/OS positivity does not select a polarity.
H4. Reading the clock constants 16 < 18 as a Hamiltonian gap, a positive-temperature KMS state would occupy the lighter sector (5) more, which is the opposite of ρ* (w = Δ^2 ≪ 1) and in the same direction as the Schur-bound covariance polarity (cov5/cov3 = (64/63)/Δ^2). Obtaining the exact numerical value 1/Δ^2 from 16 vs 18 still requires extra identifications of β and of the energy unit, which are not derived.
H5. The two clock correlation lengths are properties of A3 and A5 alone and do not involve Δ, so they cannot fix the polarity either.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
