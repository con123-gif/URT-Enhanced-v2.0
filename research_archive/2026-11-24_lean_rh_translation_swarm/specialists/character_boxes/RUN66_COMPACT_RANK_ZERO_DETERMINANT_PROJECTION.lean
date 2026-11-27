import Mathlib

/-!
# RUN66 — Rank-two equal-rank period via a one-dimensional compact projection
27 November 2026. PARTIAL / human source-matched replacement, pending independent
audit and native replay. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Mission latest blob 9f4a2272265e847b3a46422b02d4b37e976bee10 and manuscript
1a5e180894e9f437ed9454097c99896366afc188, AGENTS, protocol, handoff and expansion
read. Recent peer commits through f3101086 inspected; the parabolic zero-term
scalar (d6e8bbcc) and normalized RowBalanced (f937bf17 and manuscript) are distinct.
This closes the rank-zero archimedean specialization of the determinant period
caller without reconstructing the general real_matching polarisation theorem.
It does NOT discharge the exchange theorem itself.

## 1. Exact caller and matching parameters

New/Rows/Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40,
stdClassSum_det_modKernel_eq (rank 2) -> explicit_matching.
Actual downstream consumer: RUN65's critical z=1 Data.Pair.exists_isIntegralMeasure
-> exists_isFamily -> TwistForRows.exists_mFoldTwist_selmerLengthLe -> fit family.
Take W=V=stdSpace E (Fin 2), V'=stdSpace E Empty, all positive; a=n=2,
b=l=p=0, d=1, m=2 (here m denotes rank), sigma Empty + Fin 2 ~= Fin 2.
The required weight of alpha at infinity is -c_tau, c_tau natural.
Let nu=alpha^(-1)*upsilonU1. Its weight is mu_tau=c_tau+1,
and rankTwist(nu^(-1),Fin 2)=alpha exactly.
Thus hs=0, he: 2=0+2, hn: 2<=2, hmu: 2<=2(c_tau+1).
Use New/Exchange/ExchangeTheorem.lean 608b4f61af27d780e24f799937a836ecd3c1d50a
exchange_theorem directly at these parameters with the rank-zero polynomial
vector 1 as target. It provides a single rapid Fock vector x and real C_E,
independent of alpha and modulus; for each actual tame datum a nonzero
b_alpha with norm(b_alpha)^2=C_E L_alpha, L_alpha=lValueProd(...,nu,1).
Keep all exchange hypotheses and the native tame inverse/power conversion.
This is an existing upstream theorem to reconstruct, not an assumed RH result.

At rank zero partner_block (New/Exchange/BlockPartners.lean) with sigma as
above and function 1 gives Phi(X)=chi(det X), Psi=1 on the unique empty
matrix (character parameter chi^(-1)). The finite left-inverse guard for
Phi is exactly its invertible determinant support; no support loss.
The target hom space has dimension zero. Its vacuum is 1 by empty product,
the theta sum has one rational vector, and its adelic oscillator action is
trivial. The remaining pair character is alpha(det g). The target integral
therefore equals V0*alpha(det g), where V0=integral 1 over the rank-zero
quotient, real strictly positive by the native measureReal_univ_ne_zero.
Do not set V0=1 without a normalization theorem. This is the zero-rank
specialization of the native conversion at the end of
stdClassSum_det_modKernel_eq, and keeps its volume.

## 2. One-dimensional archimedean fixed-polynomial space

Write X_tau for a 2x2 matrix of complex indeterminates at each infinite
place, D(X)=prod_tau det(X_tau)^c_tau. Let K=prod_tau U(2), acting in the
SECOND factor of the definite pair W,V. Use the actual realPairWeil weights
(-c,0) (Lib/Weil/DualPair/PairReal.lean b45749d2e304ca38912dba6379ab5284468e8f77,
realPairWeil_polyVector). The polynomial action at (1,u) is
  P(X) -> [prod_tau det(u_tau)^(-c_tau)] P((u_tau^T X_tau)_tau).
The transpose follows from X_ab -> sum_i u_ia X_ib; all other sign blocks
are empty. In particular D is fixed. Conversely, any fixed polynomial P
satisfies P((A_tau X_tau))=prod det(A_tau)^c_tau P(X) for unitary A_tau
(transpose of a unitary is unitary).

Here is a direct elementary extension to GL_2(C), separately at each tau.
For a Hermitian H the difference
  P(..., exp(zH) X_tau, ...)-exp(z c_tau tr H) P(X)
is entire in z and vanishes on the imaginary axis. The identity theorem
gives zero at z=1. Polar decomposition writes any invertible A as a unitary
times a positive Hermitian matrix exp H. The same covariance thus holds
for any A in GL_2, and for all infinite places simultaneously by composition.
Evaluating at X_tau=I gives
  P((A_tau))=P((I)_tau) prod det(A_tau)^c_tau.
Invertible tuples are dense, so this identity holds as a polynomial also
at singular tuples. Hence fixed polynomials are EXACTLY C*D, including
c_tau=0 and the constant polynomial case. No division by det(X_tau) on
singular matrices, no arbitrary highest-weight uniqueness assumption.

## 3. Common scalar for every invariant continuous functional

Let v_P=polyVector P. For each modulus, tame alpha, Phi and fixed g, the
actual functional L(v)=thetaIntegral W V alpha 1 (modDatum W V Phi v) g
is continuous complex-linear by exists_clm_lift in
Lib/Weil/DualPair/Lift.lean composed with integrated (as in Carrier).
It is K-invariant: right translate the integration variable in U(V) by
the real point u, using right-invariance of the quotient measure and
pairWeil_integrated_right. This statement is about the integral before
replacing it with a class sum. No invariance of x itself is required.

For any P, average its polynomial action from section 2 over probability
Haar measure of compact K. The finite-dimensional space of polynomials of
total degree at most deg P is stable. Thus averaging is a coefficientwise
finite integral and produces a fixed polynomial A(P)=a(P)D. By invariance,
  L(v_P)=L(v_{A(P)})=a(P)L(v_D).
The scalar a(P) depends only on P, c and K, not on the chosen functional.
For any two invariant continuous functionals L and L0, this gives
  L0(v_D)L(v_P)=L(v_D)L0(v_P).
Both sides are continuous linear functions of the Fock vector. Extend from
denseRange_polyVector to every vector (in particular the same rapid x
returned by exchange_theorem). No claim that arbitrary rapid vectors are
polynomials or that polynomial convergence preserves all weighted norms.

For fixed c, if there is no admissible tame datum the required universal
statement is vacuous. Otherwise choose ONE such datum and g=1, and let
L0 be its actual determinant-partner functional. Section 1 gives
L0(x)=b_alpha*V0 !=0. If L0(v_D)=0 then L0 vanishes on all polynomial
vectors, hence on all Fock space, contradicting this. Define
  kappa=L0(x)/L0(v_D) !=0.
The cross identity now gives for EVERY actual L
  L(x)=kappa L(v_D).
Although a reference datum was used to compute kappa, its value is common
to every modulus and character: any other nonzero L0 gives the same ratio.
This deals with the quantifier order exists C, forall alpha, exists gamma.
The norm of kappa need not be evaluated or optimized. In particular do
not choose a new kappa at each g or alpha. This replaces the general
real_matching / fockPairing_polarisation argument at the zero-rank caller
only. The general nonzero complement consumer in Separation remains.

## 4. Class sum conversion, twist and exact period normalization

For v_D, section 2 gives real right invariance. The finite right Kf
invariance is the native calculation in explicit_matching:
modKernel_mul_Kf_right and hAlpha.apply_det; the Phi character
chi(det X) transforms by the inverse of the tame multiplier on units.
The character vanishes at nonunits, and multiplication by a unit
preserves its zero set. Left rational invariance is theta covariance.
Use exactly integral_quotMeasure_eq_classSum and modKernelI at Kf E (Fin 2).
Thus the period for alpha,1 is the actual weighted class sum S_alpha,1(g),
not an unweighted representative sum. From exchange and section 3:
  kappa S_alpha,1(g) = b_alpha V0 alpha(det g).
By modKernel_twist (Lib/Weil/DualPair/TwoLineTerms.lean), replacing the
second character 1 by alpha multiplies the ENTIRE sum by alpha(det g)^(-1).
The determinant character is never zero. Therefore exactly
  kappa S_alpha,alpha(g) = b_alpha V0.
Set gamma_alpha=kappa/(b_alpha V0). It is nonzero and gamma_alpha S=1
for every g. Also
  norm(gamma_alpha)^2 =
  [norm(kappa)^2/(C_E V0^2)] / L_alpha.
Here C_E !=0 because b_alpha !=0 and L_alpha is finite and positive
(the native exchange theorem uses lValueProdInt_pos; no RH assumption).
This supplies the exact C and gamma law in Carrier.stdClassSum_det_modKernel_eq
at rank 2, without an independent Rallis scalar or an extra group volume.
The same gamma works for all g. Feeding into RUN65 gives
  F(theta)=F(1)*levelNorm(theta)*ratio(theta)^2.
RUN64 then uses the same sign-specific repayment. Neither statement
alone gives the common balanced-row estimate or the uniform prime bound.

## Dependency and audit ledger

Original source-visible local graph:
  stdClassSum_det_modKernel_eq -> explicit_matching
  -> real_matching (general polarisation, stacked and paired determinants),
     exchange_theorem, lift continuity, partner_block, realPairWeil,
     class integral, rank-zero evaluation and twist.
Replacement human graph:
  same exchange_theorem and rank-zero partner -> nonzero reference functional;
  realPairWeil polynomial action -> fixed line (identity theorem, polar
  decomposition) -> compact average + polynomial density -> common scalar;
  same class sum conversion, rank-zero vacuum and twist -> exact period law.
Locally avoids the general polarisation theorem for this caller; no global
elaborated dependency removal or axiom claim. Preserve Separation's use of
explicit_matching, all original and reduced graph artifacts, and the
upstream equalRankThetaRatio/exchange_of_partners, local finite matching,
absolute unfolding, Rallis/Siegel-Weil foundations, L-value and
integrability hypotheses. Context key (compact pin,E,rank=2,zero complement,
c,alpha,tame modulus,partner,g,common x,kappa); keep the positive-rank
complement and z>1 branches distinct. No import of the claimed RH theorem.

Local command -v lean/lake/elan returned no executables. No rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier run on compact pin.
Re-read actual primitive CI receipt 088cd2ec0e935ee1a282f10096949bcf671cc804,
run 45803534769: 6 native checks (TiltingLemma, Filling.Moments), each with
propext, Classical.choice, Quot.sound, but module_1_build timeout 124,
all_requested_checks_ok=false, full_RH_replay=false. This is not validation
of this note. Prepared scalar bridge below is independently executable
with Mathlib; not run or claimed as kernel-verified. No numerical trials
substitute for the analytic fixed-line proof.

RESUME HERE: independently audit the fixed-line functional identity
at Carrier rank 2, then descend the actual exchange_theorem supplier
EqualRankValue.exists_equalRankThetaRatio_value and exchange_of_partners,
retaining the two complementary-rank exchange constants. Coordinate with
geometry/literature on the absolute unfolding and period matching; if
already handled, take the actual near-invariant-to-local-safety supplier
for RowBalanced, not its already derived scalar budget.
HANDOFF TO integration/editor, geometry, literature, kernel and audit:
merge this local alternative after checking the exact Fock action, Haar
invariance, partner and class normalization; retain full exchange theorem
as OPEN human input. Full human RH proof remains incomplete.
-/

namespace CompactCharacterBoxes66

theorem common_scalar_from_cross (d0 x0 d x : ℂ)
    (hd0 : d0 ≠ 0) (h : d0 * x = d * x0) :
    x = (x0 / d0) * d := by
  apply (mul_left_cancel₀ hd0)
  calc
    d0 * x = d * x0 := h
    _ = d0 * ((x0 / d0) * d) := by field_simp <;> ring

theorem rank_zero_period_normalisation (k b v a S : ℂ)
    (hb : b ≠ 0) (hv : v ≠ 0) (ha : a ≠ 0)
    (h : k * S = b * v * a) :
    (k / (b * v)) * (S / a) = 1 := by
  field_simp <;> linear_combination h

theorem rank_zero_norm_constant (K B V C L : ℝ)
    (hC : C ≠ 0) (hL : L ≠ 0) (hV : V ≠ 0)
    (hB : B = C * L) :
    K / (B * V^2) = (K / (C * V^2)) / L := by
  rw [hB]
  field_simp <;> ring

#print axioms common_scalar_from_cross
#print axioms rank_zero_period_normalisation
#print axioms rank_zero_norm_constant

end CompactCharacterBoxes66
