# Predeclaration — alt_cycle39: Gaussian fluctuations of 4_5 and 4_3

Date: 2026-11-10 (Europe/London)
Route: (39) Beyond mean field: Gaussian fluctuations of the 4_5 hidden field around the A4 condensate (and the 4_3 modes). Do one-loop fluctuation corrections split the 3 and 6 multiplets, or select between degenerate condensate directions (order by disorder)? Any spectrum with three nondegenerate charged singlets: predeclare ratios, compare to C_mass/R_mass with look-elsewhere.

## Setup
S1. The mean-field vacuum is h5 = r_* ĥ, h3 = 0, with ĥ the A4 nuclear-norm maximiser and r_* = 8.61261×10^5 of alt_cycles 25–28. The effective potential on the real hidden space 4_3 ⊕ 4_5 is
    Ω(h) = c3 ||h3||² + c_even ||h5||² + F_BdG(Δ_even(h5) + Δ_odd(h3)),
    at T = η (primary) and T = 0 (control). No kinetic term for h is introduced (that is the coupled line’s Higgs/phase-stiffness work and is not duplicated here). Fluctuations are therefore static: the covariance is the inverse Hessian D = (∇²Ω)^{-1} at the vacuum.

S2. The Hessian is 8×8. Its A4 content is recorded (the 4 of A5 branches as 1 ⊕ 3 under the residual A4; both 4_5 and 4_3 have such a branching). If ∇²Ω is A4-invariant, as required by an A5-invariant action evaluated at an A4 vacuum, then every one-loop graph built from D and the Yukawa vertices is A4-invariant.

S3. Order by disorder: A5/A4 = 5 discrete A4-singlet directions in the 4, the A5-orbit of ĥ. The one-loop vacuum energy (1/2) Tr log ∇²Ω is evaluated at each of the five points. Selection would require unequal values. Because the five points are A5 images of one another, equality is required by symmetry; it is checked numerically rather than assumed, as a sanity test of the Hessian.

S4. Fermion-spectrum correction, static second-order (degenerate perturbation in each mean-field multiplet):
    W_{ij} = Σ_{ab} D_{ab} Σ_m ⟨i|V_a|m⟩⟨m|V_b|j⟩ / (E_i − E_m),
    with V_a the Nambu vertex of hidden direction a and i, j running over a multiplet grouped at relative 10^{-5}. A split is reported when the eigenvalues of W differ by more than relative 10^{-5} of the parent mass after this grouping. If W is proportional to the identity on each irrep, the multiplet does not split.

S5. Three nondegenerate charged singlets, if they appear, are handled as in alt_cycle35: ratios among the lowest three distinct positive values and the Koide-like quotient are written first, then compared to |C_mass|, |R_mass| and their quotients, with T1/G_strict look-elsewhere. If they do not appear, those ARFs are not compared.

## Hypotheses
H1. ∇²Ω at the vacuum is A4-invariant and positive definite (a local minimum). Its spectrum has the A4 content 1 ⊕ 3 on 4_5 and 1 ⊕ 3 on 4_3, with no extra degeneracy mixing even and odd.
H2. The five A5-related A4 directions have equal one-loop measures (1/2) Tr log ∇²Ω to numerical tolerance. Fluctuations do not select among them.
H3. Because the self-energy is A4-invariant, the fermion 3 and the 6 (two 3s of A4, already split at relative 1.27×10^{-5} by the Laplacian) do not split into nondegenerate singlets. C_mass and R_mass are not compared.

## Integrity
No ARF target is inserted into Ω or W. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
