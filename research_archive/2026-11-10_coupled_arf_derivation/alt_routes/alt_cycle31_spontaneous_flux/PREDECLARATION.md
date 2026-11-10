# Predeclaration — alt_cycle31: spontaneous gauge flux in the condensed A4 phase

Date: 2026-11-10 (Europe/London)
Route: (31) Minimise Ω jointly over the 4_5 condensate and the edge gauge field A (gauge-fixed, T = η and T = 0, with a Hodge Maxwell term ||dA||² if that term is derived from the existing Hodge kinetic — state whether its coefficient is free). Find the flux pattern, its stabiliser (ℤ3, ℤ2, chiral T, …), whether it breaks time reversal / picks a handedness, and whether it is finite without new parameters.

## Arena
S1. The London instability of alt_cycle29 lives on the icosahedral pairing graph: 12 vertices and 30 edges, with the real even pairing Δ of the cycle-25/28 vacuum. The five-solid complex has 90 spatial edges, but the other 60 do not enter the 12-component magnetic Laplacian and have no derived hopping to those fermions (alt_cycle27 did not supply a unique inter-solid current). They are not promoted to extra dynamical variables. Primary A is therefore the 30 icosahedral edge phases.
S2. Frozen real Δ already uses unitary gauge for the charge-2 condensate and breaks residual continuous U(1). There is no remaining gauge identification to quotient by: the configuration space is the compact torus (ℝ/2πℤ)^{30}. “Gauge-fixed” here means that unitary gauge has already been taken; all 30 components are physical. Face fluxes Φ_f = (dA)_f are nonetheless the gauge-invariant observables used to name a pattern (they would be invariant if a gauge identification were restored).
S3. The fermion piece of Ω is the Nambu / BdG potential of alt_cycle25/29, with K[A] the magnetic Laplacian and Δ = y_even M_even(h5) at y_even = 1. Joint variation includes the even hidden field h5 (scale and direction) as well as A. Because the A-dependent piece of Ω is O(1) while the pairing/tree balance that fixes ||h5|| is O(10^6), a large shift of r_* is not expected; it is computed, not assumed.

## Maxwell term
S4. The archived Hodge kinetic on 1-cochains is Δ1 = δd + dδ. In Coulomb gauge, A^T Δ1 A = ||dA||². Cycle 23 used Δ1 as the photon kinetic when forming the ratio R_EM = λ_min(Π_T)/λ_min(Δ1_T), which is a unit identification, not a derivation of a coefficient in a single action. The local Maxwell density is κ/2 ||dA||², or its 2π-periodic counterpart κ Σ_f (1 − cos Φ_f), which has the same small-Φ quadratic. The real number κ is not fixed by the archive: κ = 0 is the alt_cycle29 action (fermions only); κ = 1 is the Hodge unit identification already used to normalise R_EM. Both discrete choices are reported. No intermediate κ is fitted.

## Hypotheses
H1. At κ = 0 the origin A = 0 is a saddle (as implied by the negative London kernel). A minimiser exists and is finite without new parameters, because the domain (ℝ/2πℤ)^{30} is compact. A distinguished candidate, not assumed to be the minimum, is the all-π connection (A_e ≡ π), which maximises the first-order lift ⟨v0|K[A]|v0⟩ of the unpaired constant mode and gives every face holonomy −1.
H2. The qualitative fate of that minimum depends on κ. At κ = 1 the Maxwell cost of order-π fluxes can overwhelm the O(1) fermion gain and restore a minimum at A = 0 (or at a small flux). Because κ is not uniquely derived, a unique physical flux vacuum is CONDITIONAL on this discrete choice.
H3. The stabiliser of the combined (Δ, A) vacuum inside A5, and whether time reversal A ↦ −A (equivalently Φ ↦ −Φ) is broken, are computed from the 60 icosahedral rotations acting on face holonomies. An A5-invariant holonomy pattern (e.g. every face −1) does not reduce the A4 coming from Δ and does not pick a handedness. A chiral pattern with Φnotgauge-equivalent to −Φ would pick a handedness and could reduce A4 to ℤ3, ℤ2 or 1.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
