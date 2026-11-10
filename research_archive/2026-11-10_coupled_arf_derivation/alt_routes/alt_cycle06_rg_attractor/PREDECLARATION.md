# Predeclaration — alt_cycle06: RG / recursion fixed points and δ*

Date: 2026-11-10 (Europe/London)
Route: (6) Ask whether δ* is an attractor of the primitive URT recursion r = π/e, golden rotation 2π/φ^2, with rate from the spectral gap.

## Frozen inputs
r = π/e ≈ 1.155, θ = 2π/φ^2. δ* = 80π/(1053 φ), Δ = 3/20 − δ*, η = −ln Δ.
Linear spiral map T(z) = r e^{iθ} z on C.
Circle rotation ψ ↦ ψ + θ (mod 2π).
The descriptive relaxation δ(t) = δ* + (δ(0)−δ*) e^{−k β t} is a target statement, not an input used to build T.
Cycle 17 already found that the linear transfer T0 does not have δ* as an attractor and that its first gap is not equal to Δ. This cycle tests the primitive recursion itself and a short, predeclared list of normalisations, without fitting.

## Predeclared trial normalisations (not fitted; reported only as checks)
N1. Un-normalised spiral T(z) = r e^{iθ} z.
N2. Projective radial map ρ ↦ (r ρ)/(1 + r ρ) on [0, ∞).
N3. Spherical radial map ρ ↦ (r ρ)/sqrt(1+(r ρ)^2).
N4. Circle rotation alone.
No other map will be searched to hit δ*. Matching δ* after introducing a free parameter would be a fit and will be rejected.

## Hypotheses
H1. N1 has the unique fixed point 0, which is a repeller because r > 1. There is no finite attractor, so δ* is not an attractor of the primitive recursion.
H2. N4 is an irrational rotation (1/φ^2 is irrational), hence uniquely ergodic on the circle with no attractive fixed point.
H3. The fixed points of N2 and N3 (which are extra, not derived, normalisations) are not equal to δ*, nor to Δ, nor to 3/20.
H4. Linearisation around a hypothetical fixed point of a positive transfer would give a rate equal to the spectral gap (a general fact). This does not by itself identify k and β separately, nor produce δ*.
H5. Therefore the relaxation formula is a description, not a derivation of δ*, and no ARF is obtained.

## Integrity
δ* is used only as a comparison value at the end. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
