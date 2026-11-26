import New.Rows.LiftVolumeHeight
import Mathlib.Tactic

/-!
# RUN61 — archimedean comparison budget and conjugate determinant at actual C caller
26 November 2026. HUMAN SOURCE-MATCHED; prepared scalar certificates below,
NOT compiled. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first and
mandatory unified engine); prior own RUN60 29eb0e94. Read AGENTS, continuity,
SWARM_PROTOCOL, HANDOFF_QUEUE, manuscript and peer commit summaries through
57550c80. Manuscript contains the line-size input and compressed determinant
assembly but not the following explicit comparison size / conjugate projection
argument. This is distinct from the B absolute amplitude in a122a57d,
170965ea, 3e861230 and C frame/row results in 2bd8f96d, b7b304a3.

## Native source and exact consumers
New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a:
 normSqAt_comparisonForm_le, comparisonForm_mem_integralForms,
 exists_comparison_forms (actual bodies).
New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1:
 norm_det_compressedGramOp_arch_le, heightLe_liftVolume_ratio.
New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825:
 innerAt_heckePolyOnForms, innerAt_groupAlgAction,
 normSqAt_starProjection_le, B₀.
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473:
 card_stdClasses_le_exp_mul_log.
New/Core/ClassCountBound.lean (source fetched at exact pin; blob not recorded): card_classes_le, retaining native short-basis and integral
 counting inputs; not a new derivation of adelic reduction.
Lib/Adelic/Hecke/ClassSumBounds.lean c6139c29f46898cb1444d94e1960844722647d66;
Lib/GLn/Dual/ClassSum.lean 5aef22dff3a95f8e53040667188aa6fb891098d2;
Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f;
Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33;
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e;
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834;
New/Data/ChosenPlaceLevels.lean d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3;
New/Rows/LineCoordinates.lean fe2cbde49a8d88f37308a8c28f742efb73a7d6a0;
New/Rows/LineArithmetic.lean f6235933aecfcf1a1c82be94b4ad3edbe5057794;
New/Rows/CartanIntegrality.lean 6f1276b49ff736fb17fece1309ce6a3d2a75bb57;
New/Exchange/GridModuli.lean fcd137da01a82d43834ba2ac248a6049a5d569e8.

## 1. Hook bound and class-sum estimates (actual weights)
Let H=smallHookNumber, L=sum_{tau,h<smallrank} h kminus(tau,h).
The defining highest polynomial P is a product of leading minors, is
homogeneous of degree L and evaluates to 1 on the identity. Each determinant
of size h has coefficient l1 norm at most h!, so ||P||_1 <= prod(h!)^k <= L!
by the multinomial integer. For Fischer pairing
 H=sum_alpha alpha! |P_alpha|² <= L! ||P||_1² <= (L!)³ <= L^(3L).
L=0 gives H=1; otherwise H>0 by the nonzero evaluation. This is the native
hookNumber_le, with no hook-length formula or new external theorem.
For a weighted class sum the weights 1/|Aut(c)| are in (0,1]. Triangle
inequality gives its Weyl norm <= number of classes times the uniform
pointwise bound; the same positive weights bound the sum of squared norms.
For a delta form the orbit-stabilizer expansion is a sum of at most
|Aut(c)| terms of equal conjugate norm: the weight representation Gram
transport is exact and the finite order character still has modulus 1
after sigma. Thus its squared norm is <= |Aut(c)|² times the squared norm
of its defining vector, as in weylNormSq_deltaForm_le. The native
card_classAut_dvd_chosenGroupOrder supplies |Aut(c)| <= J, not a new
freeness claim. The mixed Cartan identity multiplies the two Weyl squared
norms exactly, using the Kronecker Gram identity and complementary
Schur column conditions; map_cartanProduct holds over the integer
coefficient matrices, so it also holds after every sigma.

## 2. Actual gl at twist 1: explicit original budget, no new constants in conclusion
Write B=log b, g=gProd, J=chosenGroupOrder, ell=DividedSplitting.loss,
T=card(MemberIndex x SmallClasses), C_o=outer class count at auxPair level,
C_i=max rowFixingLevel class count over the actual members. Empty table
case gives gl=0; otherwise all counts used in logs are positive.
Let Q_sigma(zeta)=sum_a weylNormSq(sigma o zeta_a), S=exp(r B₀) Q_sigma.
The SAME beta=lineScale as RUN60 obeys
 ||sigma(conj(beta*y_i(h)))||² <= exp(r B₀), by lineMultiplier_integral_and_small.
Each productForm is the delta form of the Cartan product of this vector and
zeta_a, with finite-order level character. The preceding norm identities
bound its squared norm by J² S (the individual Q_a <= Q_sigma).
Triangle over inner classes, then over T table entries; square only after
these sums, and multiply by g^(2ell) from the original gl definition.
The outer positive class sum proves
 H ||gl_1 zeta||²_sigma <= K exp(r B₀) Q_sigma,
 K=H C_o T² C_i² J² g^(2ell).
We now give coarse explicit estimates for log K sufficient for the native
2rB₀ bound; they use the original data, not asymptotic replacement of it.

Data.scale gives B>=10^12 log x, 100 log B<=log x and
log B>=10^12 P.c with P.c>=64. In particular x is larger than every
small numerical cutoff below, B<=x^.01, b>=x^100, B²>=10740.
From the native magnitude instances: m<=x, m²<=4x, r,t<=x^6,
f<=x^12 (since log f<=11 log x+log B/5+P.c), h<=x^41,
2 n_m<=x^6, log g<=22 B; all relevant ranks <=2 n_m by the native
rank bounds. The bound on 2n_m follows also directly from n_m=k+m(t+1),
k<=r<=3x^5, t=5r, m<=2 sqrt x.
For b1,b2 use their upper log bounds: b1<=e² b and b2<=e² b since
log x1>=log x. Also h+mh<=2x^42<=b. The native card_detIndex then bounds
sum_h kplus(tau,h)<=20b (indeed 2e²+1<20). The source proof bounds every
kminus(tau,h)<=h. Thus with |CarrierIndex|=3m and smallrank<=x^6,
 ell <= 60 m f b + f x^53 <= 61 m f b.
The last term is smallrank²*h*f, not a bound by the full highest weight.
This distinction is essential: using b for every kminus would overspend.

All the other log costs are polynomial in x:
 * L <= f x^12 h <= x^65; log H<=3 L log L <= x^67.
 * Each C_o,C_i, FlatClasses, SmallClasses count <=
   exp(x^29(1+2 log g)) <= exp(x^31). Their levels contain the
   principal level piGBar² by the same inclusion guards as the native
   proof, and therefore principal level (g²), by piGBar*star(piGBar)=g.
   This invokes card_stdClasses_le_exp_mul_log, retaining its native
   class-number/relative-index suppliers.
 * q=card(O_E/(piGBar²)) <= g^(4f), because the ideal contains g²
   and the integral ring has Z-rank 2f. Thus log q<=88 f B.
   The table indices are exactly matrix(3m,bigrank) over this ring,
   FlatClasses, row-index functions (tau,Fin reducedHalfGap,Fin 2m)
   -> FlatIndex of size 6m+1, and SmallClasses.
   Consequently log T <= 3m*bigrank*log q + 2 x^31
      + 2m*f*reducedHalfGap*log(6m+1) <= x^60,
   using reducedHalfGap<=h<=x^41 (the last term is <= x^57).
 * J<=prod_w q_w^((rt)^2)=g^(f(rt)^2) from counting all matrices,
   hence log J <=22 f B (rt)^2 <= x^38.
These deliberately loose individual upper bounds follow from the enormous
explicit lower bounds on log x in Data.scale. In particular
 log H + log C_o + 2 log T + 2 log C_i + 2 log J <= x^80 <= b.
Combine BEFORE adding the line bound:
 log K <= b + 2*61 m f b *22 B <= 2685 m f b B.
But r B₀ = (r/k) f a B³/m >= f m b B³/4
since a>=xb, r>=k>0 and m²<=4x.
As B²>=10740, log K<=r B₀. Therefore
       H ||gl_1 zeta||²_sigma <= exp(2r B₀) Q_sigma.
This is the actual normSqAt_comparisonForm_le output with the original
constant 2; all coarse intermediate inequalities have slack within the
native Data.scale, not additional assumptions on x. The scalar proof
below checks only the last arithmetic implication when replayed.

## 3. Why the projection remains contractive under every sigma
Use the actual central projector E, Hecke polynomial operator H_w
(here H_w differs from hook H) and L=range(goodLift).
At each sigma the adjoint of H_w is the conjugate-place polynomial
with coefficient sigma^-1(conj(sigma X)); the two commute by the
native split-place Hecke commutation. Thus H_w is normal for this
positive conjugate pairing; ker H_w=ker H_w^dagger (norm equality).
E is self-adjoint for every sigma. L<=im E intersect ker H_w by
the actual goodLift eigensystem. Tested y is orthogonal in the identity
pairing to L^perp intersect im E intersect ker H_w. Finite-dimensional
orthogonal-complement identities give y=z+x with z in L and
x in ker E + im H_w (using identity-pairing normality).
Every summand of x is orthogonal to L for every sigma:
 E by self-adjointness; H_w by the conjugate adjoint and normality.
The original starProjection y is therefore z, and
 ||y||²_sigma=||z||²_sigma+||x||²_sigma >= ||z||²_sigma.
This is precisely AuxPair.normSqAt_starProjection_le; not a claim that
arbitrary orthogonal projections stay contractive under Aut(C).
Retain actual split-off-level, centrality, commutation and tested guards.

## 4. Conjugate determinant bound without assuming sigma commutes with star
At the actual C caller, M=H pr_L gl gl*|_L, sep says gl* is injective
on L, and gl(gl*z) is tested. Take an eigenpair Mz=lambda z, z nonzero.
Set zeta=gl*z, Q=sum_a weylNormSq(sigma o zeta_a)>0.
Set eta=star o sigma^-1 o star o sigma applied entrywise to zeta.
For the native rational real symmetric table Gram matrix,
 sigma(inner(eta,zeta))=Q and Q_sigma(eta)=Q.
This uses the conjugation twist explicitly, rather than assuming that
sigma preserves the original Hermitian form. In the native adjoint
convention, inner(gl eta,z)=inner(eta,zeta).
Pair Mz=lambda z against gl eta, apply sigma, take absolute values,
then conjugate-metric Cauchy-Schwarz:
 |sigma(lambda)| Q
 <= H ||gl eta||_sigma ||pr_L gl zeta||_sigma
 <= H ||gl eta||_sigma ||gl zeta||_sigma
 <= exp(beta) Q,
where beta=2r B₀ at twist 1 and the second inequality uses section 3
on the actual tested gl zeta (not on gl eta).
Divide by Q>0. Algebraic determinant product of all eigenvalues with
multiplicity (no diagonalizability needed) gives
 |sigma(det M)| <= exp(dim L * beta).
This supplies the archimedean factor of heightLe_liftVolume_ratio in
the same witness as the p-adic determinant, not a new twist choice.
The local Auerbach/tested denominator bound and Hecke ratio height are
still required, as are upstream comparison detection and primitive
arithmetic. No new root discharge or whole proof claim.

## Dependency and verification ledger
Original: C -> heightLe_liftVolume_ratio -> exists_comparison_forms ->
normSqAt_comparisonForm_le -> hookNumber_le, card_stdClasses_le_exp_mul_log,
lineMultiplier_integral_and_small, Cartan norm, delta norm, class counts.
Separate arch determinant -> normSqAt_starProjection_le, tested, sep,
comparison norm, conjugate pairing and eigenvalue product. Reduced human
graph shares same gl, beta, table, L and tested projection across those
consumers; no source edge removed. Context key (pin,D,j,twist=1,sigma,
same table Gram, same gl and lineScale, actual level and chosen places).
No new native proof-term edges or axiom claims. Prior graphs preserved.
Lean/Lake absent on PATH; git network DNS unavailable in local container.
GitHub CI run 45803534769 job wrapper shows completed success; prior
published targeted ledger records six native theorem checks and A timeout,
not a full successful batch. No new certificates executed, no rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier run. Old pin engines are
not automatically applicable to this toolchain. No finite diagnostic
substituted for proof. Prepared Lean scalar statements and native checks
below, independent replay needed; no PASS reported.

RESUME HERE: inspect New/Rows/LiftVolumeHeight.lean
norm_det_compressedGramOp_padic_le at the actual Auerbach coordinate
witness, including Y inner pairing and exact integral Fock dual basis;
cross-check with latest C arithmetic peer before expanding
New/Rows/HeckeValueHeight.lean heightLe_inv_ratio.
HANDOFF TO integration, editor, audit and kernel; preserve all open leaves.
-/

namespace CompactDependencyRun61

theorem log_budget (M B c : ℝ) (hM : 0 ≤ M) (hB : 0 ≤ B)
    (hB2 : 10740 ≤ B ^ 2) (hc : c ≤ 2685 * M * B) :
    c ≤ M * B ^ 3 / 4 := by
  have h := mul_nonneg (mul_nonneg hM hB) (sub_nonneg.mpr hB2)
  nlinarith [h]

theorem log_budget_to_exp (K R : ℝ) (hK : 0 < K)
    (h : Real.log K ≤ R) : K * Real.exp R ≤ Real.exp (2 * R) := by
  have h' : K ≤ Real.exp R := by
    rw [← Real.exp_log hK]
    exact Real.exp_le_exp.mpr h
  calc
    K * Real.exp R ≤ Real.exp R * Real.exp R :=
      mul_le_mul_of_nonneg_right h' (Real.exp_pos _).le
    _ = Real.exp (2 * R) := by rw [two_mul, Real.exp_add]

theorem positive_cancel (Q A C : ℝ) (hQ : 0 < Q)
    (h : A * Q ≤ C * Q) : A ≤ C :=
  (mul_le_mul_right hQ).mp h

end CompactDependencyRun61

#check normSqAt_comparisonForm_le
#check AuxPair.normSqAt_starProjection_le
#check Data.norm_det_compressedGramOp_arch_le
#check Data.heightLe_liftVolume_ratio
#print axioms CompactDependencyRun61.log_budget
#print axioms CompactDependencyRun61.log_budget_to_exp
#print axioms CompactDependencyRun61.positive_cancel
