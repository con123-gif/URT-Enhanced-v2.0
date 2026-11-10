# Coupled cycle 13 predeclaration — T_coupled flow and fixed points of r

Treat r = y_even / y_odd and the hidden amplitudes as dynamical under
the coupled gradient / KMS flow of the joint system, and ask whether a
unique stable fixed point selects r. Also report the pole structure of
the collective response R(z) = (I − z T_coupled)^{−1}.

Constructions, fixed before computing (not searched):

C1. Linear carrier on ℋ = 4_3 ⊕ 4_5 ⊕ H13. The quadratic form is
    block-diagonal with the cycle-03 hidden Hessian (2 c3 on 4_3 and
    2 Δ² c5 on 4_5) and the Hodge Laplacian on H13. Yukawas are cubic
    (h ψ ψ) and the Nov 7 hidden source is quadratic, so the Jacobian
    at the zero field vanishes (cycle 15). This T is independent of r.

C2. One-loop quadratic after integrating H13 fermions (alt_cycle16):
    V(ρ3, ρ5, y_o, y_e) = ½ (H3 + y_o² π_o) ρ3² + ½ (H5 + y_e² π_e) ρ5²
    where ρ3 = ||h3||, ρ5 = ||h5||, H3 = 2 c3, H5 = 2 Δ² c5, and
    π_o, π_e are the Hodge-weighted fermion-loop indices of the
    cycle-11 hopping frames, π = mean_α ||Λ^{-1/2} T^α Λ^{-1/2}||_F².
    Unconstrained gradient flow of V is the derived flow.

C3. The same V restricted to the hidden sphere ρ3² + ρ5² = 1
    (conditional: a forced nonzero hidden vev, not implied by V_hist,
    whose unique critical point is the origin).

C4. Bubble-chain transfer on the A5-reduced collective coordinates
    (h3, h5, B_odd, B_even):
        h3' = (y_o / H3) B_odd,   B_odd' = π_o y_o h3,
        h5' = (y_e / H5) B_even,  B_even' = π_e y_e h5.
    Eigenvalues ± y_o √(π_o / H3) and ± y_e √(π_e / H5).
    R(z) = (I − z T)^{−1} has poles at
        z = ± √(H3 / (y_o² π_o)) and z = ± √(H5 / (y_e² π_e)).
    The uncoupled T0 = exp(−η H0) poles of cycle 05/16 are reported
    as the r-independent reference.

C5. Convergence law of cycle 17, not fitted:
        δ(t) = δ* + (δ(0) − δ*) exp(−Γ t),   Γ = η(E2 − E1),
        Δ(t) = 3/20 − δ(t),   H5(t) = 2 Δ(t)² c5.
    η = −ln Δ_*, β = η, k = E2 − E1. This slaves Δ to the frozen
    input δ* and will be coupled to the gradient of V.

C6. Extra, not derived: gradient of the spectral radius of the C4
    transfer on the Yukawa sphere y_o² + y_e² = 1. Its minimizer,
    if unique, is recorded and compared to the cycle-12 matching
    recipes; it is not promoted to a derivation.

The KMS semigroup uses the same η as T0. No ARF target is inserted.
If a unique stable fixed point of a derived flow (C2 or C5) selects r,
that ray will be handed to a subsequent predeclared one-loop / EM / ARF
cycle, conditional on the cycle-08 Hessian average. Classification
PROVED / CONDITIONAL / FALSIFIED / OPEN.
