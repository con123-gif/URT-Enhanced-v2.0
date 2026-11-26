import New.Rows.LiftVolumeHeight
import New.Exchange.TriangleLevelExponent

/-!
# Compact audit RUN52 — signed rank-one height to single-lift repayment
26 Nov 2026. HUMAN SOURCE-MATCHED, conditional on the actual native suppliers;
new scalar Lean certificate PREPARED, NOT COMPILED. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude. Compact source pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 23f64d503b7d64bb13b9667156b499021038d742: expanded-workload
and sole URT lane amendments; this is conventional formal audit lane 10.
Manuscript blob e0cf5402bda7772a8ab2556b61d9d67859b36630. Read SWARM_PROTOCOL,
AGENTS, research state, handoff and latest peer commits 2999f952 (rank-one),
c78302e2 (determinant), a144d8de (rows), d93adfe1 (pencil), 898feb42
(Sha), 3180f6da (theta), 6653e0ac (Landau), prior audit 4f4bf8eb.
No protected files or original graphs modified.

Actual source ledger (static body retrieval, not elaborated graph):
 New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84
   heightLe_inv_ratio, heightLe_inv_heckeValueProd_div
 New/Rows/Separation.lean cbd60ebb20b771dc6107f3d54df0397ee7707e4d
   eSign, heckeCount, linePair, heckeValueProd, heightLe_norm_trivialLift_sq
 New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1
   det_compressedGramOp, heightLe_liftVolume_ratio
 New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a
   exists_comparison_forms
 New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88
   liftVolume, volume_iota_eq_prod_liftVolume
 New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825
   IsFitFamily, Pair.IsRankOne
 New/Exchange/AlgebraicPartDefs.lean 7d791291bd2f9b6e9bd1a21b20254632c3a3606c
   intAlgPart
 New/Exchange/LValueRatio.lean 6572e057107f38d8ca6a1e057b4b216b730a0bf4
   Pair.ratio (positive real from nonzero L-values, not just real)
 New/Exchange/TriangleLevelExponent.lean e1b3a17423c1f003c1d5311ef484638973750ac4
   ratio_eq_intAlgPart_div, IsFitFamily.heightLe_of_eq_zpow_mul, Pair.lValueProd_eq
 New/Heights/Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518
   HeightLe, mono, mul, prod, pow
 New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
   localAsk, forcedPart
 New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
   jetSize, dirCost
 New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473
   primeSum_eq_sum_localAsk
 New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
   k_even, r_add, scale comparison
 New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05 (caller)
 New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65 (star root role).

## 1. Audit of peer rank-one witness and exact cancellation at the cutoff

Fix D, j and one fit family theta, as in heightLe_inv_ratio. Write B=B0,
X=x^999, J=sum_sigma jetSize(w0(sigma)), U=dirCost, F_l=forcedPart(l).
For every integer cutoff T>=ceil(x1), the native nominalWeight<=a
guard gives the exact finite sum identity
  J-U = sum_sigma primeSum(nominalWeight(sigma),sigma)
      = 2 sum_{l<T prime} F_l log l.
This follows by applying primeSum_eq_sum_localAsk to every sigma and
interchanging two FINITE sums. The factor 2 is essential. No infinite
sum estimate or RH input. The same cutoff works for every sigma and
the bounds of IsFitFamily. Thus the paired local budget of RUN51
(2999f952) has a uniform signed aggregate, not merely pointwise control.

At each embedding use W=Pair.trivialLift H theta_iota^j, W0=the
untwisted lift, Q=q2.ratio theta_iota^j and N=class number of the native
rank-one chosen level. All are nonzero. Q>0 as a real number follows
from the norm quotient definition of Pair.ratio and its nonvanishing
lemma, so the positivity premise of the prepared peer scalar theorem
is justified (or can be weakened to Q!=0). For the paired height family
  y_iota=(Q/||W||)^2/N^3,
the common auxiliary witness V*conj(V) has arch budget 2B, finite
exponents gamma_l+2F_l log l, with sum gamma_l<=B for EVERY finite prime
set. Therefore HeightLe(3B+J-U,y). This is a height of the family with
one auxiliary number, not the claim each individual value has this
ordinary logarithmic height. It retains the native K construction,
all embeddings, t!=0 and the same fit family. No change to the rank-one
averaging proof of the peer.

## 2. The rank-one inverse ratio, exactly as used by its caller

The two other native estimates are HeightLe(B-J,||W0||^2) and
HeightLe(X,Q^-1), the latter from the ramified rank-four member of the
same fit family. Square only the latter. Multiplication of witnesses
gives HeightLe(4B+2X-U, y * ||W0||^2 * Q^-2).
The family product is EXACTLY
  Y_iota=||W0||^2/(N^3 ||W||^2).
The desired inverse ratio is not equal to Y. From the actual intAlgPart
definition, with n=card RankOneIndex p.z,
  rho(theta_iota^j)^-1 = levelNorm(theta_iota^j)^(n-1) ||W0||^2/||W||^2
                      = N^3 levelNorm(theta_iota^j)^(n-1) Y_iota.
The common D.chosenGroupOrder and denomBound^2 cancel; levelNorm(1)=1.
The multiplying factor is integral at every embedding above l; in
particular levelNorm is an l-adic unit by fit.coprime (and N need not
be an l-adic unit). Therefore the norm of the desired family is <= the
norm of Y and HeightLe.mono applies. Since X<=B, the exact signed bound
  4B+2X-U <= 6B-U
gives the actual heightLe_inv_ratio conclusion. U is NOT replaced by
|U| or assumed positive. No N^3 is lost from the bound. Positive
comparison of complex numbers is not used under arbitrary embeddings.

## 3. The exact Hecke product multiplicity, including both signs

Native m and k are even. Set a=7(m/2), h=a+k/2, with none-point h and
sign-points e_+=m, e_-=m/2. In the none interval Ioc(a,h) exactly k/2
lower points are rank-one: the original Pair.IsRankOne guards in the
caller still apply. The remaining none points Ioc(0,a) and the two
signed intervals Ioc(0,m), Ioc(0,m/2) are the actual ramified pairs
with their respective sign arguments. Their combined size is
  a+m+m/2 = 5m.
The three character lines are indexed by Option Int.units, not just
the two sign lines. Pair.lValueProd_eq says, for each line of endpoint z,
the twisted/untwisted Hecke product equals levelNorm^z^2 times the
product of squared lower-point ratios for that line and sign.
Consequently the inverse product has conductor power -sum z^2
and all its individual inverse-ratio factors squared. This power has
norm one at each relevant l, by fit.coprime; the same witness can be
used by HeightLe.mono (even for a negative integer power). No second
choice of theta. The exact signed bound is
  2[(k/2)(6B-U)+(5m)X] = k(6B-U)+10mX.
This is the actual heightLe_inv_heckeValueProd_div budget. Dropping the
square, either sign, or the conductor power without unit proof is
not a valid equality. No positivity of 6B-U assumed in finite sums.

## 4. Same comparison A, orientation of the lift-volume ratio

Let u_theta=goodLift(theta_iota^j,j), g_theta=gl(theta_iota^j),
lambda_theta=normDet(u_theta)^2, K_theta=compressedGramOp on its range,
d=rowDim>0, h=smallHookNumber j. The comparison theorem supplies
ONE A, surjective, independent of the twist and a nonzero scalar
gamma_theta, such that u_theta* g_theta=gamma_theta A. Hence
g_theta* u_theta=conj(gamma_theta) A*. Because u_theta is injective
and A surjective, the native det identity gives
  lambda_theta det(K_theta) = h^d |gamma_theta|^(2d) normDet(A*)^2.
All terms used in a division are nonzero. The same A cancels between
theta and 1; comparison states
  |gamma_theta/gamma_1|^2 = Gamma_theta/Gamma_1.
The orientation is therefore
  lambda_1/lambda_theta =
       [det(K_theta)/det(K_1)] [Gamma_theta/Gamma_1]^(-d).
Do not invert the determinant ratio. The arch estimate at 1 is 2drB;
the local bound at theta_iota^j has dr gamma_l and sum <=drB (peer
c78302e2); witness det(K_1) gives HeightLe(3drB, det(K_theta)/det(K_1)).
Combining with step 3 produces
  d[3rB+10mX+k(6B-U)].
The native final size comparison (le_of_hasLogBound in this exact caller)
is 3rB+10mX+6kB<=k logB B. Retain this guard (also follows if r<=2k,
m<=k, X<=B, logB>=22). It gives the unmodified
  HeightLe(d k(logB B-U), lambda_1/lambda_theta).
The final lift adapter uses conductor exponent zero, i.e. exact equality.

## 5. Consumer and frontier

Sum over j=1,...,m for the SAME theta using the native row-volume
factorization; m k B=budget and m k U=mainHeight. The single-lift
contribution is thus d(logB*budget-mainHeight). The common chain
constant still has its separate native CostsSquares bound and must
be included (no assumption its cost is zero). The LongForms reciprocal
height and same-family A+B+C product formula consume this output.

Original graph/axiom ledgers preserved; static audited role graph:
 primeSum_eq_sum_localAsk + dirCost -> finite cutoff identity
 paired K/rank_one_bound + norm_trivialLift_sq + ramified height
 + intAlgPart normalization -> heightLe_inv_ratio
 linePair/heckeCount/eSign + lValueProd_eq + fit.coprime
 -> heightLe_inv_heckeValueProd_div
 determinant comparison + same A + size guard -> heightLe_liftVolume_ratio
 -> heightLe_volume_ratio_sq -> integral_forms_long -> star_inequality.
No global node deletion, no new axiom assertion. The difficult
depth_indicator_jet, exists_test_form_inner_kernelForm, comparison
separation, fit-twist arithmetic, chain volume, other A/B/C inputs
remain on the frontier until individually reconstructed. This audit
agrees with the preceding peer derivations at these interfaces, supplies
four connected exact consumer steps, and rejects incorrect orientation,
multiplicity, and cutoff normalization alternatives.

## Actual checks
Executed deterministic JS in connector sandbox, exact small integers:
 1600 even (m,k) pairs from 2..80; 2,520,000 signed budget cases;
 51,000 prime-to-conductor configurations; 7 negative controls;
 7,665,207 assertion evaluations. These test scalar arithmetic only,
 not actual automorphic data. Reproduction:
 for m,k=2,4,...,80:
   h=7*(m/2)+k/2; ranks=count(1<=z<=h, z>7*(m/2)); ram=7*(m/2)+m+m/2
   assert(2*ranks==k); assert(2*ram==10*m)
   for B=1..7, X=0..B, J=-4..4, F=0..4:
     U=J-2*F; exact=B-J+2*X+2*B+B+2*F
     assert(exact==4*B+2*X-U); assert(exact<=6*B-U)
     assert(2*(ranks*(6*B-U)+ram*X)==k*(6*B-U)+10*m*X)
 for p in [2,3,5,7], N,M=1..30,n=1..20 with p not dividing M:
   val=3*v_p(N)+(n-1)*v_p(M)
   assert(val==3*v_p(N)); assert(val>=0)
 Negative controls: for each p above assert(v_p(p)>0), compare J-2F
 to J-F at J=F=1, compare 2*(7*3+6+3) to 5*6, and compare signed
 U=-2 versus |U| in 4*3+2*1-U.
Native Lean/Lake absent (command -v returned nothing). Re-read actual
CI status files on cathedral-research-state: compact union graph run
45781154005, blob ea44d71556e0d21703e72fcd61bbaf2bee0ec563, returncode 1
RESOURCE_BLOCKED before build. Historical old-pin reduction statuses
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 report pass; they do not verify
this compact certificate. No native rh_scan/rh_prune/rh_reduce/rh_auto
on compact terms, no fresh #print axioms output, no new kernel closure.

RESUME HERE: independently audit the actual K construction in
exists_test_form_inner_kernelForm and heightLe_inv_ratio, in particular
the three xiSum normalizations, modKernel factorization and the
depth_indicator_jet witness at the common prime and conjugate embedding.
Integrate the four audited repayment steps now, without waiting for K.
HANDOFF TO: integration, editor, character boxes, shared kernel lane.
VERDICT: AGREE/PARTIAL, source-matched human derivation; native replay pending.
-/

namespace CompactAuditRun52

theorem signed_rank_one_budget (B X J U F : ℝ)
    (hX : X ≤ B) (hU : J - U = 2 * F) :
    (B-J) + 2*X + (3*B+2*F) ≤ 6*B-U := by
  linarith

theorem squared_product_budget (m k B U X a b : ℝ)
    (ha : 2*a = k) (hb : 2*b = 10*m) :
    2*(a*(6*B-U)+b*X) = k*(6*B-U)+10*m*X := by
  calc
    2*(a*(6*B-U)+b*X) = (2*a)*(6*B-U)+(2*b)*X := by ring
    _ = _ := by rw [ha, hb]

theorem lift_budget (d r B m X k U L : ℝ) (hd : 0 ≤ d)
    (hscale : 3*r*B+10*m*X+6*k*B ≤ k*L*B) :
    d*(3*r*B+10*m*X+k*(6*B-U)) ≤ d*k*(L*B-U) := by
  calc
    _ = d*((3*r*B+10*m*X+6*k*B)-k*U) := by ring
    _ ≤ d*(k*L*B-k*U) := mul_le_mul_of_nonneg_left (sub_le_sub_right hscale _) hd
    _ = _ := by ring

#check Data.primeSum_eq_sum_localAsk
#check Data.heightLe_inv_ratio
#check Data.heightLe_inv_heckeValueProd_div
#check Data.heightLe_liftVolume_ratio
#check Data.Pair.lValueProd_eq
#print axioms signed_rank_one_budget
#print axioms squared_product_budget
#print axioms lift_budget
#print axioms Data.heightLe_inv_ratio
#print axioms Data.heightLe_liftVolume_ratio

end CompactAuditRun52
