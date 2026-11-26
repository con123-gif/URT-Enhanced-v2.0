import New.Rows.ComparisonForms
import Mathlib.Tactic

/-!
# RUN60 — exact glue lattice, unique congruence witness and C comparison integral
26 November 2026. SOURCE-MATCHED HUMAN derivation; independent Lean replay
prepared, NOT compiled. Compact dependency lane (historical lane 12).
Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, including completion-first,
primitive-closure and mandatory unified engine. AGENTS, continuity, protocol,
handoff, compact manuscript (57943bee829a414ee97a63d4cf014a92239f9d16 at read)
and latest peer summaries inspected. Resume 4dcf2dd60282ae5b14dff5cf8465d71be64baf09.
Peers 5040237a (B quadric/packet), c2c5b63c (editor), 1adb27d4 (uniform
shifted vacuum), 6328abd9 (split reciprocity), c3b2fad4 (local Tate).
This is C's distinct glued product datum and adjoint period; not the
already reconstructed B packet energy, RUN51 adjoint abstract argument,
RUN52 Cartan loss or RUN59 Rallis integral.

## Native ledger
New/Rows/GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e:
 DividedLattice, reducedInverse, weilScalar, reduceAt_conj_eq_one,
 exists_reducedInverse_eq, DividedSplitting.stackOverGenScalar,
 rowFixingLevel_le_levelOf, congruenceGroup, reduceAt_liftMod_congruenceGroup,
 IsGlued, exists_congruenceGroup_inv_eq_one_sub, exists_isGlued,
 theta_pointForm, theta_productForm, theta_stdClassSum_productForm
 (actual bodies inspected). New/Rows/ComparisonForms.lean
 14ef893c54f5db837ea7e4f143b2b1a444b89b5a: splittingV, glueLattice,
 classAut_rowFixingLevel_eq_bot, comparisonForm, inner_adjoint_comparisonForm.
 New/Rows/CartanIntegrality.lean 6f1276b49ff736fb17fece1309ce6a3d2a75bb57
 uses exists_cols_eq_zero, not only indicator_eq_sum.
 New/Rows/MemberOrthogonality.lean (RUN52 blob aca8828d477a4510ab80964e1572f34ef220a2c1)
 uses reduceAt_conj_eq_one at the class-period caller.

## 1. Construct one actual integral block lattice
Suppress reindexing by the native splitting epsilon. Let A_0=O_hat,
 pi=O.genIntAdele; let R=A_0/(chosen M)^2 at the actual split level
 places, with pi also its residue. The ideal of pi in R is square-zero,
 ann(pi)=(pi), by the local uniformizer descriptions and CRT.
 Keep the native genResidue_smul_eq_iff and disjoint_places_star.
 For s (a x N) over R lift its entries to t over A_0. The row module
 of S=[t;pi I_N] contains pi A_0^N. At each chosen DVR it has full
 rank N, hence a free basis (ordinary DVR submodule/Smith theorem).
 At other places pi is a unit and the row module is full. The
 componentwise bases form an integral adelic N x N matrix D and
 there are integral matrices B,H,A with D=B S, S=H D, A D=pi I_N.
 This is the row-module part of the native Hermite witness P,Q:
 neither an inverse for D over A_0 nor a unit determinant is required.
 In R, S X=S Y iff D X=D Y, by the two factorizations.
 Let J=inclMatrix(fixedEmb) (N x r), K=inclMatrix(z) (m x r).
 Both are coordinate injections and K^T K=I_r; in the native
 epsilon_ι coordinates inc=(0,K)^T. Define B_- diagonal, pi on
 im(z) and 1 elsewhere, and B_+ diagonal, 1 on im(z), pi elsewhere.
 Thus B_+B_-=pi I_m and K^T B_-=pi K^T. Take the actual native blocks
     C=[A, J K^T; 0,B_+],
     G=[D,-D J K^T; 0,B_-].
 Block multiplication gives CG=pi I_(N+m): the upper-right block
 is -A D J K^T+J K^T B_-=-pi J K^T+pi J K^T=0.
 This is the input of exists_reducedInverse_eq, not a formal inverse
 in a residue ring. At each chosen split place set gamma=C, at its
 conjugate set gamma=(C^*)^-1, elsewhere gamma=1. Since CG=pi I
 and pi is nonzero locally, C is invertible over the local field.
 The chosen-place inverse is pi^-1 G; at conjugate places gamma^-1
 is integral (C^* at the partner), and elsewhere identity.
 Therefore gamma is a unitary finite adelic point with the exact
 support and pi gamma^-1 integral; its reducedInverse is G mod M².
 This is the native cutGL/star c^-1*c construction in coordinates.
 No lattice at the twist primes has been chosen.

## 2. Unique congruence witness, not a multiplicity estimate
 Write x=(X;Z) over R, with X N x r and Z m x r; set Z_0=K^T Z.
 The block condition G x=pi inc is equivalent to
     Z=K Z_0, pi Z_0=pi I_r, D(X-J Z_0)=0.
 Indeed the bottom row coordinates outside im(z) must vanish,
 the marked rows satisfy the second equality, and the top is
 D X-D J K^T Z. Thus Z_0=I+T with T entries in (pi).
 T^2=0, and Z_0^-1=I-T lies in Gamma={Y in GL_r(R): pi Y=pi I}.
 With Y=Z_0^-1 the equations become precisely
     Z Y=K, S X Y=S J.
 Conversely if Y in Gamma satisfies these two equations, then
 Z=K Y^-1, pi Y^-1=pi I, D(X-JY^-1)=0. Hence G x=pi inc.
 Moreover Z_0 Y=I determines Y uniquely, even over this nonfield.
 Therefore for every complex c, including zero,
  1_{Gx=pi inc} c =
    sum_{Y in Gamma} 1_{ZY=K and SXY=SJ} c.
 This proves the indicator_eq_sum field of IsGlued using the same
 G as section 1. There is no factor |Gamma| at this point.
 The group Gamma itself is I+Mat_r((pi)); multiplication is
 addition of the square-zero increments. In particular it is
 finite, and reduction at M is identity. This explains why its
 lifts lie in the principal level; the native lift is supported
 on M and hence is identity at all twist places. This is not
 the finite-level multiplicity appearing later in the integral.

## 3. Column clearing and conjugated level, same witness
 At each chosen residue field reduce S modulo pi. Its bottom rows
 vanish, so the row rank of D mod pi equals rank(s mod pi)<=a.
 Choose an invertible column change K_1 with the columns outside
 the designated image of dividedEmb in the kernel of D mod pi.
 This is possible because the designated set has size a (the
 native embedding), so its complement has dimension N-a <=
 dim ker(D mod pi). Extend an independent choice to a full basis;
 do this for every chosen field, then lift entrywise and use CRT.
 Invertibility lifts modulo the square since a determinant unit
 mod pi is a unit mod pi². Consequently pi D K_1 is zero on the
 complement, precisely IsGlued.exists_cols_eq_zero for the first
 N columns of G. This is the native clear-cols witness, not a
 claim that all of G is integral after dropping the denominator.
 It supplies RUN52's Schur/Cartan exponent with the actual marked
 columns and therefore the same p-adic loss, not a rank-N loss.

 If j_0 is integral with j_0=I mod M², at each chosen place
 gamma^-1 j_0 gamma-I=pi^-1 G(j_0-I)C is in pi Mat(A_0).
 Its inverse is also integral and congruent to I (since I+pi E
 has unit determinant in the DVR). At conjugates unitarity
 gives the conjugate-transpose of its inverse; hence integrality.
 At other places gamma=I. This proves the native
 reduceAt_conj_eq_one for the SAME gamma at the actual
 MemberOrthogonality class-period consumer. For the row-fixing
 group, preserving S applied to the prescribed columns in the
 native stacked relation includes preservation of the pi I
 bottom block, so pi times its difference from identity is zero.
 The exact ann(pi) relation implies reduction 1 at M, giving
 rowFixingLevel_le_levelOf. The native chosen-level freeness
 theorem then makes class automorphism factors equal to one.
 That last arithmetic freeness theorem is retained.

## 4. Twist-independent scalar and exact integral consumer
 The chosen gamma, G, S and Gamma above involve only the
 fixed chosen places and s, not the twist. In actual glueLattice
 ComparisonForms uses the witness for twist 1 and transports
 its structure fields by definitional equality. The scalar
 beta_L=chi_a(detOn(M,gamma))/sqrt(ideleAbs(detOn(M,gamma)))^r
 is nonzero (idele norm strictly positive and character a unit).
 The same source a, rank and chosen places occur for each
 twist, so beta_L is the SAME scalar. This does not say the
 entire Weil representation or the character at Q is twist-free.

 theta_pointForm transports the level datum by gamma; its
 support equation is G x=pi inc. Apply section 2 to that exact
 indicator, split the real Cartan polynomial into its two
 letter polynomials, and use the native block theta identity
 and the finite-level Weil action to obtain theta_productForm:
     theta(productForm)(g)=conj(beta_L *
          sum_{Y in Gamma} K_big(g Ytilde,h) K_small(g Ytilde,c)).
 The twist character remains in K_big: Ytilde is supported at M
 and its twist-place reductions are identity. The native
 rankTwist/bigChar identity gives the precise product character.
 Taking the finite row-fixing class sum, linearity of theta
 combines K_big with lineMultiplier into cosetKernelSum; the
 common lineScale is outside the sum with its conjugate.
 The source theta_stdClassSum_productForm is exactly this formula.

 At inner_adjoint_comparisonForm, pair with a good F and use
 the actual adjoint identity. Substitute fNatural_i=kappa_v
 cosetKernelSum_i BEFORE any norm. For each member i and class c,
 the summand is now a fixed scalar times the integral of
 conj(F(g) fNatural_i(g Ytilde)) K_small(g Ytilde,c).
 Change variables g'=g Ytilde using the native right Haar
 invariance of the quotient measure; F(g)=F(g') since F has
 principal level M and Ytilde reduces to I. Each integral is
 consequently identical for EVERY Y. Summing yields |Gamma|,
 not a factor from the earlier indicator. The integrability
 used by this change of variables is the actual rapid product
 lemma mul_fNatural_mem_rapidOfLevel_and_hol and
 mul_modKernel_mem_rapidOfLevel; the native R proof transports
 this integrability for every Y. Summing over the small classes
 gives tableTheta. In full, with the actual loss and beta_1=lineScale,
  conj(kappa_v) <F,goodLift_v^* comparisonForm_v(zeta)>
   = |Gamma| gProd^loss conj(beta_1)
       sum_i conj(beta_Li) int conj(F fNatural_i) tableTheta_i(zeta).
 This establishes the common period expression in RUN51 on
 the actual shared finite congruence witness. The remaining
 comparison size, lineScale, detection and primitive arithmetic
 estimates are not consequences of the indicator.

## Graph and audit
 Original source-role edges: C -> heightLe_liftVolume_ratio ->
 exists_comparison_forms -> inner_adjoint_comparisonForm ->
 theta_stdClassSum_productForm -> theta_productForm ->
 theta_pointForm + IsGlued.indicator_eq_sum + native block/Weil
 covariance. IsGlued <- exists_isGlued <- Hermite row module,
 exists_reducedInverse_eq and residue clear-cols. Separate
 CartanIntegrality consumer -> IsGlued.exists_cols_eq_zero;
 MemberOrthogonality -> reduceAt_conj_eq_one. Human graph shares
 the same block G and gamma across these three consumers; no
 original source edge deleted. Context key pin,D,j,i,s,chosen
 places,epsilon,fixedEmb,z,dividedEmb,twist,character,measure.
 Retain native level/covariance/character guards and all
 unresolved obligations and original/reduced graph archives.

 No native Lean/Lake on PATH. No execution of rh_scan/prune/
 reduce/auto/frontier or new axiom evidence. CI actual published
 RUN29 status a56e2d3afb99ed8275e81fd63c8494306e57c43f and
 targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804:
 six native declarations checked with three standard axioms;
 A build timed out (2700.11s); overall ERROR, no new PASS.
 RUN28 status 77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35 is PASS
 only for that older targeted scope. No artificial finite tests.
 Below are prepared exact algebra certificates and native checks.
 No full RH replay or independently discharged root claim.

 RESUME HERE: New/Rows/ComparisonForms.lean normSqAt_comparisonForm_le:
 expand the class-count/hook-number budget using the actual
 native HasLogBound and same lineScale; audit whether it is
 already integrated before proceeding to remaining C Hecke
 value height and primitive local-defect suppliers.
 HANDOFF TO integration, human editor, audit, kernel.
-/

namespace CompactDependencyRun60

-- The square-zero calculation is valid in a noncommutative matrix ring.
theorem square_zero_inverse {R : Type*} [Ring R] (T : R) (h : T * T = 0) :
    (1 + T) * (1 - T) = 1 ∧ (1 - T) * (1 + T) = 1 := by
  constructor
  · calc
      (1 + T) * (1 - T) = 1 - T * T := by noncomm_ring
      _ = 1 := by rw [h, sub_zero]
  · calc
      (1 - T) * (1 + T) = 1 - T * T := by noncomm_ring
      _ = 1 := by rw [h, sub_zero]

-- Exact off-diagonal cancellation, with the order of factors kept.
theorem glue_off_diagonal {R : Type*} [Ring R] (A D J B p : R)
    (hAD : A * D = p) (hJB : J * B = p * J) :
    A * (-(D * J)) + J * B = 0 := by
  rw [mul_neg, ← mul_assoc, hAD, hJB, neg_add_cancel]

-- Two row-module factorizations imply equality of the two constraints.
theorem shared_row_constraint {R : Type*} [Semigroup R]
    (S D B H X Y : R) (hD : D = B * S) (hS : S = H * D) :
    S * X = S * Y ↔ D * X = D * Y := by
  constructor
  · intro h
    rw [hD, mul_assoc, mul_assoc, h]
  · intro h
    rw [hS, mul_assoc, mul_assoc, h]

end CompactDependencyRun60

#check DividedLattice.exists_reducedInverse_eq
#check DividedLattice.reduceAt_conj_eq_one
#check DividedSplitting.exists_isGlued
#check DividedSplitting.exists_congruenceGroup_inv_eq_one_sub
#check DividedSplitting.theta_productForm
#check DividedSplitting.theta_stdClassSum_productForm
#check inner_adjoint_comparisonForm
#print axioms CompactDependencyRun60.square_zero_inverse
#print axioms CompactDependencyRun60.glue_off_diagonal
#print axioms CompactDependencyRun60.shared_row_constraint
