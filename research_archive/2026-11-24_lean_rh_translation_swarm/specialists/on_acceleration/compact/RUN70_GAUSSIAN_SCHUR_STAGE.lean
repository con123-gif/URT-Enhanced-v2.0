import New.Rows.MemberKernels
import Mathlib.Tactic

/-!
# RUN70 — Gaussian/Schur stage bound at the actual A caller
27 November 2026. Human source-matched derivation, conditional on the
explicit CM conjugate witness and Schur/Gram foundations below. No new
kernel check or global proof claim. Credit Alpöge, Sernau, Anthropic
collaborators and Claude.
Pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207;
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10
(including mandatory engine and completion-first sprint), AGENTS, protocol,
handoff, expansion, current manuscript, editor RUN72 d14639a0, theta RUN72
7023ef7b, integration RUN73 9fbb841b and prior RUN69 a9b37b94 checked
at least at checkpoint/metadata level. Editor's branching result is distinct;
do not repeat it. This note supplies the stage bound left open in RUN69.

Source ledger (relative to compact src):
New/Rows/MemberKernels.lean be36c0175fe559376780b105052249fc0c9f1f4f
  Parameters.exists_algEquiv_norm_eq, norm_jet_le_of_isAdmissibleComb.
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
  Parameters.exists_semilinear_isJetConjugate.
New/Seesaw/AdmissibleComb.lean 6519d031bf78b2243efbb71d09f47e500c1bf32c
  IsAdmissibleComb, IsAdmissibleCoeffs, single.
Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1f08
  Space.IsJetConjugate.
Lib/Weil/Construction/DataProduct.lean 6f4d0c2b91bf3fb0f9fc20e81c606d3d2ebe8bab
  Space.jet_jetSeries_eq_theta.
Lib/Weil/Fock/RealData.lean ad05f8711f7d34146680238349f0eaafebc0be1d
  Space.theta_integrated.
Lib/Weil/Fock/FockTensor.lean 120f531824514a1f9b1352cb7110312cffd5642b
  polyVector_apply.
Lib/General/LinearAlgebra/HaarUnique.lean 5eacfd5a30e8994cd2be39c8a11f3a9a6414c684
  realMeasure = pi^(-D) volume.
Lib/General/LinearAlgebra/HuaIntegral.lean d62ceebe4b3b49aae6bc6eb3d247280abbbd8a37
  realVac, HasGaussianIntegral, pow_le_exp_log_factorial_add.
Lib/Adelic/CuspForms/DeltaForms.lean b3c533af615370f34f2303823732b8935c6bfbef
  weylNormSq_schur_le.
Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33
  sqrt_weylNormSq_le_of_dual.
Lib/Weil/CompactLift/BranchingPeriod.lean 9ed09fe6527b822004076503163d1a9cb8859d91
  dotProduct_schurJet_mulVec, eval_schurCoeffPoly.

## 1. Conjugate before integrating; keep the actual scaling and all σ.
Let D=card(P.Φ s × n' × n), C=P.c*(P.N₁ s * card(n' × n)+1)^2,
Ω=P.bigOmega s>0, u=log(|σc|²/Ω), J=L (the native natural L).
For each translated integral vacuum in the admissible combination, apply
the actual CM conjugate theorem on Hom(I_n,I_n') with empty R:
it supplies υ-semilinear T, t with |t|²=1/Ω and permuted variables,
and |T(ρ(finVec x)ω(1,g)v_int)(y)|<=e^C.
Here υ is chosen over P.K: σ either fixes the imaginary quadratic
P.K or restricts to its conjugation; in the latter case postcompose
with complex conjugation. Thus |υ z|=|σ z| for every complex z.
In particular the coefficient sum is still <=B and the polynomial
hypothesis stated with σ is unchanged when read with υ.

Using map_jet, IsJetConjugate, and polynomial renaming, move υ
through the ALGEBRAIC Taylor jet first. Then the resulting jet equals
the theta integral of a Fock polynomial times the conjugate datum.
Do not commute a discontinuous complex-field automorphism with
a real integral. The character and Heisenberg phase factors have
absolute value one by the retained HasWeight and finite-order laws.
The actual argument of the original Q in the pointwise hypothesis
can be written z_i=c υ^{-1}(t conj(y_{π(i)})), with π the source
place permutation lifted to the other indices (equivalently choose
the corresponding inverse rename convention). The source expression
is c • υ.symm ∘ (t • star y) ∘ (placePerm ..).prodCongr 1.
Hence sum_i |σ z_i|²=|σc|²/Ω sum_i |y_i|².
For c≠0 this is e^u sum |y_i|². For c=0 the left side is zero and
the inequality with e^u still holds (Lean log 0=0). No nonzero
condition on the scale is added to the native statement.

## 2. Exact Gaussian cancellation gives the first conjunct.
Write S=sum_i|y_i|², R=S/(2J+2)≥0. The native polynomial hypothesis
on the ball of squared radius e^u(2J+2)R yields
  |υ(Q(z))| <= A exp(w+J S/(2J+2)).
The Fock vector contributes exp(-S/2), not exp(-S).
Using the pointwise CM bound in §1, the integrand is dominated by
  A exp(C+w) exp(-S/(2J+2)),
because -S/2+J S/(2J+2)=-S/(2J+2).
For normalized realMeasure = π^(-D) dvol on ℂ^D the product Gaussian
integral is exactly
  ∫ exp(-S/(2J+2)) drealMeasure = (2J+2)^D.
This follows from ∫_ℂ exp(-a|z|²) dvol=π/a for a>0 and Tonelli,
also D=0. Domination supplies integrability; the native rapid-data
theta integration formula gives the same integral, with no altered
Haar mass. Thus each translated vacuum contributes at most
A exp(C+D log(2J+2)+w). Semilinearity, linearity of the finite
jet, and sum |υ(r_x)|<=B give precisely A M J w.
This proves the first conjunct (conditional on §1's CM witness,
character/Heisenberg laws, and theta integration formula).
There is no extra π, factorial or exponent from the coefficient
sum, and no need to optimize the already sufficient Gaussian budget.

## 3. Schur spectral estimate and exact duality.
For z=(z_τ), let ρ_{τ,i} be the eigenvalues of z_τ* z_τ in
descending order, nonnegative, counted with multiplicity, including
zeros. Then sum_i ρ_{τ,i}=tr(z_τ* z_τ)=sum_{a,b}|z_τ(a,b)|².
For a semistandard tableau column of height h the diagonal Schur
weight is a product of h distinct eigenvalues (column injectivity),
so it is at most the product of the largest h. Multiplying over
the κτ(h) columns yields exactly
  product_{τ,i} ρ_{τ,i}^{d_{τ,i}},
d_{τ,i}=sum_{i<h<card n'} κτ(h).
FitsRanks supplies the truncation to i<card n; 0^0=1.
With the retained positive Gram matrix G and native compatibility
S(z)^* G' S(z)=G S(z^*z) and Gram/unitary equivariance, diagonalize
z^*z. In the diagonal chart the difference between that scalar
bound and the Schur diagonal matrix is nonnegative and commutes
with G. Their product is positive semidefinite (commuting
Hermitian positive matrices), giving precisely
  ||S(z) ξ||_G'² <= (product ρ^d) ||ξ||_G².
This is the human derivation of DeltaForms.weylNormSq_schur_le,
not an assumption that the tableau basis is orthonormal.
The Schur/Gram compatibility and basis identities remain retained
foundations. No divide by a singular value or determinant.

For any v, set v'=σ∘v, N=||v'||_G'. If N>0 the row
r=v'^*G'/N has |r w'|<=||w'||_G' by Cauchy-Schwarz and
r v'=N. By surjectivity of σ entrywise lift r to c0 with
σ∘c0=r. For N=0 the bound holds whenever C0>=0 (the native
dual-test hypothesis at c0=0 implies that). This proves the actual
ClassReps.sqrt_weylNormSq_le_of_dual with no assumption that
σ preserves Hermitian conjugation.

## 4. The factorial envelope supplies the second conjunct.
Use J>0 (the native positive natural L). Fix a dual row c0
satisfying the hypothesis in §3 and define the actual polynomial
Q=schurCoeffPoly(c0,ξ). By the two BranchingPeriod identities,
c0·(schurJet κ F ξ)=jet(Q,F) and Q(z)=c0·S(z)ξ.
All Schur polynomials are defined over integers, so after σ
the evaluation is (σ c0)·S(σ z)(σ ξ); this is an algebraic
identity, not complex conjugation commuting with σ.
Apply §3 to σ z, yielding
  |σ Q(z)| <= A (product ρ_{τ,i}^{d_{τ,i}})^(1/2),
A=||σ ξ||_G≥0 and sum ρ<=sum|σ z_i|².
Set v=u+1/J. The exponential series gives, for d natural and
ρ≥0,
  ρ^d <= d! exp(d v + ρ exp(-v)).
Multiplying and taking square roots bounds the product by
exp(w+sum ρ/(2 exp(v))), where
  w=1/2 sum_{τ,i}(log(d!)+d u+d/J).
On the ball from the first conjunct,
  sum ρ/(2 exp(v)) <= (J+1) exp(-1/J) R <= J R
for R≥0, since exp(1/J)>=1+1/J.
The ball condition itself forces R≥0 as e^u(2J+2)>0.
Thus Q satisfies the exact first-conjunct hypothesis. Apply §2
and then duality §3 to get
  ||σ(schurJet κ F ξ)||_G' <= M J w ||σ ξ||_G.
This is precisely the actual second conjunct of
Parameters.norm_jet_le_of_isAdmissibleComb, with the native
row index, factorial and u intact.

## 5. Consumer and frontier.
At Data.weylNormSq_Bmu_le (RUN69 §1), take the singleton
translated integral vacuum, B=1 and J=a+1; apply the second
conjunct with each actual stage's IsLiftWeight, c=star piG,
and σ. The native norm_map_star_piG_sq gives u=log(gProd/Ω).
Squaring recovers exactly the E_j used in RUN69, with 2C,
2D log(2J+2), and the single row sum. Chain aggregation and
prime-height cancellation there now follow from §§1–4 with
the named primitive premises. No new bound on primes was used.
The shared A frontier still includes the CM generator/
semilinear uniform bound (ConjugatesOfJets.exists_semilinear_isJetConjugate,
especially its norm_dataInner and separated lattice sum),
Schur Gram/basis compatibility where not already proved,
and the level-N Fourier-power supplier. Do not count the CM
uniform bound as derived here or infer A closed.

Original native path retained: CM conjugate + jet algebra +
theta integration + Gaussian -> first conjunct; Schur spectral
+ duality + factorial -> second conjunct -> RUN69 stage -> A
short_forms -> star_inequality. Reduced human path uses same
witness, explicit algebra, spectral sorting and one Gaussian
moment; no native dependency edge deletion. Context key:
compact pin, s, n/n', ea/eb, actual weights and κ, σ, c, J,
coefficient witness, same F and Gram norms. No URT or RH premise.

Native evidence: lean/lake/elan absent locally. Retrieved published
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
on cathedral-research-state: six named TiltingLemma/Moments checks
successful, only propext, Classical.choice, Quot.sound reported;
module_1_build return 124 after 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. No new native PASS or compact rh_prune/scan/
reduce/auto/frontier run. Original/reduced exports and axiom
evidence left intact. The scalar proofs below are prepared,
not compiled; do not count them as caller verification.

RESUME HERE: use §§2–4 at the actual stage in RUN69; next
discharge the explicit CM conjugate uniform supplier by source
ConjugatesOfJets.exists_semilinear_isJetConjugate's final
norm_dataInner/tsum_le_of_separated argument, or coordinate
with theta if already completed, then level-N Fourier-power.
HANDOFF TO integration, editor, theta, kernel, audit.
Human RH reconstruction incomplete.
-/

namespace AccelerationRun70

theorem gaussian_exponent (J S : ℝ) (hJ : 0 ≤ J) :
    -S/2 + J*S/(2*J+2) = -S/(2*J+2) := by
  have h : 2*J+2 ≠ 0 := by linarith
  field_simp
  <;> ring

theorem factorial_radius (J R : ℝ) (hJ : 0 < J) (hR : 0 ≤ R) :
    (J+1)*R ≤ J*Real.exp (1/J)*R := by
  have h := Real.add_one_le_exp (1/J)
  have hh := mul_le_mul_of_nonneg_left h hJ.le
  have hcancel : J*(1/J+1)=J+1 := by field_simp
  rw [hcancel] at hh
  exact mul_le_mul_of_nonneg_right hh hR

theorem ball_R_nonneg (r R S : ℝ) (hr : 0 < r) (hS : 0 ≤ S)
    (h : S ≤ r*R) : 0 ≤ R := by
  by_contra hn
  have hneg : R < 0 := lt_of_not_ge hn
  have hprod := mul_neg_of_pos_of_neg hr hneg
  linarith

#print axioms gaussian_exponent
#print axioms factorial_radius
#print axioms ball_R_nonneg
end AccelerationRun70

#check Parameters.norm_jet_le_of_isAdmissibleComb
#check Parameters.exists_semilinear_isJetConjugate
#check Space.theta_integrated
#check weylNormSq_schur_le
#check sqrt_weylNormSq_le_of_dual
#check pow_le_exp_log_factorial_add
#print axioms Parameters.norm_jet_le_of_isAdmissibleComb
