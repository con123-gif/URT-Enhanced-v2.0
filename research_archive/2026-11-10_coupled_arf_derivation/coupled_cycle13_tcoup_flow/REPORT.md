# Coupled cycle 13 — T_coupled flow and fixed points of r

Classification: **PROVED** obstruction. Surviving dimension: **2** (not a ray).
No unique stable fixed point selects r. The one-loop / EM / ARF pipeline
was not run.

## Derived dynamics
Linear T on 4_3 ⊕ 4_5 ⊕ H13 is independent of r: Yukawas are cubic
(h ψ ψ) and the Nov 7 hidden source has vanishing Jacobian at the zero
field (cycle 15). The one-loop quadratic obtained by integrating H13
fermions (alt_cycle16) is
V = ½ (H3 + y_o² π_o) ρ3² + ½ (H5 + y_e² π_e) ρ5²,
with Hodge-weighted loop indices π_o ≈ 0.036866 and π_e ≈ 0.026333.
Its unique hidden critical point is the origin, which is stable
(H3 > 0, H5 > 0). At the origin r is a flat, neutrally stable
direction.

The cycle-17 convergence law δ(t) = δ* + (δ(0)−δ*) e^{−Γ t} with
Γ = η(E2−E1) ≈ 0.045990 slaves Δ(t) to the input δ* and makes H5
time-dependent, but does not select r. Each hidden sector has a
conserved quantity H ln(y²/y0²) + π (y² − y0² + ρ0²) = 0; the
late-time ratio is therefore initial-data dependent. Eight sample
trajectories collapsed toward h = 0 at eight distinct ratios.

## Conditional and extra constructions
Forcing |h| = 1 (not implied by V_hist) places the vev on the lighter
hidden quartet 4_5 for every point of the Yukawa sphere (the mass-gap
crossing would require s = y_e² = 7.62 > 1). A vanishing h3 does not
set y_odd = 0, so this does not fix r.

Minimising the spectral radius of the bubble-chain transfer on
y_o² + y_e² = 1 is extra and gives r_* ≈ 0.002922 ≈ √(π_o/π_e) √(H5/H3).
That is not a derivation (and is a close cousin of the cycle-12
canonical-hidden matching recipe).

## Poles of R(z)
Uncoupled T0 = exp(−η H0) is independent of r. Its poles remain those
of cycle 05/16: z1 ≈ 1.015458 and z2 ≈ 1.063249, with Γ = η(E2−E1).
The bubble-chain T has eigenvalues ± y_o √(π_o/H3) and
± y_e √(π_e/H5), so R(z) = (I − z T)^{−1} has poles at
± √(H3/(y_o² π_o)) and ± √(H5/(y_e² π_e)). On a pure-odd ray the even
poles recede to infinity, and vice versa. Because no derived flow
selects r, these r-dependent poles are not promoted to a prediction.

## Integrity
Predeclaration sha256:
`d7f31bc017cb19c036de091ac3a114264796239ab38ffe615afa93a057e81074`.
Test script hashes are recorded in HASHES.txt (integration of the
sample trajectories was corrected from a short Euler step to exact
linear updates plus the late-time conserved quantity).
No ARF target was used.
