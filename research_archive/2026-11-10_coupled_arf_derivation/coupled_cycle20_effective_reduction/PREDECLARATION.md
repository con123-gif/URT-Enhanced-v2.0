# Coupled cycle 20 predeclaration — effective reduction of the condensed phase

Cycle 18 proved that the coupled pairing theory uses the Nambu / BdG
measure and that 4_5 condenses at any O(1) y_even (y_c,even(η) = 0.006011
on H13 Hodge). Cycle 19 proved that the even vev is finite and that the
condensed phase does not select a unique r = y_even / y_odd (dimension 2).
This cycle asks what, if anything, the residual 2-plane still controls
once one is inside the condensed phase
    y_even > y_c,even,    y_odd < y_c,odd
(so h5 = v_* ≠ 0 along the nuclear-norm maximiser, and h3 remains at
the origin by the inversion tadpole of cycle 19).

No new couplings are introduced. The action is that of cycle 18:
    S = V_hist(h) + Σ_a ψ̄_a K ψ_a + ½ ε_ab [ψ_a^T Δ(h) ψ_b + h.c.],
    Δ(h) = y_o Σ_k (h3)_k F_odd^{(k)} + y_e Σ_k (h5)_k F_even^{(k)},
    V_hist = c3 ||h3||² + Δ_geom² c5 ||h5||².
Primary kinetic: geometric H13 Hodge (cycle 18). Control: the 12-vertex
icosahedral Laplacian of alt25/26, on which the large-vev pairing
singular values are known to be 0, √(2/15), √(1/6), √(3/10) with
multiplicities 1, 3, 6, 2 (ratios 0 : 2 : √5 : 3).

## Structural facts used, not assumed as the answer
yo appears in the action only as the coefficient of h3 in Δ. On the
cycle-19 vacuum h3 = 0, every functional of (K, Δ, h5) is therefore
independent of yo. The only yo-dependent observables are those that
displace h3 (odd curvature / susceptibility, distance to odd
criticality, odd n-point functions). This will be confirmed by
evaluating those quantities, not by treating it as the classification.

## Will compute, in this order (no ARF used)

1. On-shell even vacuum at several (y_e, y_o) inside the condensed
   phase (predeclared grid:
   y_e ∈ {0.1, 1.0, 2.0}, y_o ∈ {0.0, 1.0, 2.0},
   all with y_e > y_c,even ≈ 0.006 and y_o < y_c,odd ≈ 2.405).
   Record r_* = ||h5||, Ω_*, Ω_*/r_*^2, r_*/y_e, Ω_*/y_e²,
   ||grad_{h3} Ω||, and the positive BdG spectrum grouped by degeneracy.
   Primary T = η; T = 0 at the reference point (y_e, y_o) = (1, 0)
   as a control (cycle 19 found the two temperatures agree).

2. Hidden Hessian at the reference vacuum (y_e, y_o) = (1, 0) and at
   (1, 1): even radial curvature ∂²Ω/∂r²; 4×4 odd block ∂²Ω/∂h3∂h3;
   mixed block ∂²Ω/∂h3∂h5. The odd curvature is predicted to have the
   form 2 c_odd I + y_o² κ_vac, with κ_vac the second variation of Ω_f
   with respect to a unit odd pairing added on top of the even
   condensate (κ_vac itself independent of y_o). Report κ_vac.

3. Large-vev pairing singular values of the unit even matrix M(ĥ)
   (K-independent): record σ and the ratios among the positive levels.
   Expected, from the A4 nuclear-norm maximiser (alt26, not used as
   input to the optimiser): 0 (×1), √(2/15) (×3), √(1/6) (×6),
   √(3/10) (×2), i.e. 0 : 2 : √5 : 3.

4. Leading Laplacian corrections. For the unit even pairing, compute
   the positive BdG spectrum at several pairing scales
   g ∈ {10², 10³, 10⁴, 10⁵, g_*} where g_* = y_e r_* at y_e = 1,
   on both kinetics. Fit each multiplet centroid to
       E(g) = g σ + α + β/g
   (first-order degenerate perturbation of K inside a singular-value
   subspace gives a g-independent split α; nondegenerate first-order
   shifts vanish by the Nambu structure, leaving O(K²/g)). Record the
   3 ⊕ 3 split of the would-be 6 and its large-g limit. On H13, also
   list any additional levels that do not scale with g (centre / spoke
   modes) and say whether ratios that mix them with pairing levels
   depend on y_e.

5. Classification, predeclared:
   - “The residual 2-plane is physically irrelevant for *all*
     observable ratios” will be marked PROVED only if every recorded
     ratio (including those that mix pairing-scale, Laplacian-scale
     and hidden-tree-scale quantities, and the odd/even curvature
     ratio) is independent of both y_e and y_o inside the condensed
     phase.
   - Otherwise that global claim is FALSIFIED, and the cycle will
     state precisely which ratios *are* parameter-free (expected:
     ratios among pairing-dominated BdG levels → 0 : 2 : √5 : 3 in
     the large-vev limit; Ω_*/r_*^2 → −c_even; r_*/y_e → N/(4 c_even);
     Ω_*/y_e² → −N²/(16 c_even); even radial curvature → 2 c_even)
     together with the leading Laplacian corrections, and which
     observables still depend on y_o or on the overall y_e scale.
   The claim is CONDITIONAL if the scans are consistent with the
   list above but a listed ratio is unresolved at the working
   tolerance (relative 10^{-3} for on-shell scans, 10^{-6} for
   singular-value identities).

No comparison with C_mass, R_mass, R_α or Δδ is performed.
