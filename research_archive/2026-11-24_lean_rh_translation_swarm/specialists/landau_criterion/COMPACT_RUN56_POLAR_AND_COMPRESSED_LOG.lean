import New.DiscreteSeries.RestrictionLemma

/-!
# Compact RUN56 — polar correction and dimension-free compressed logarithm
26 November 2026. HUMAN SOURCE-MATCHED derivation, independent audit pending.
Lean scalar candidates below NOT COMPILED.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
57e7f36aa8032da2dd16f54a539e23d992a7cf96, RUN55
46f9b4c99813f7681cb54ad27031eb5e02a76256.
Read AGENTS, continuity, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION,
latest integration WIP a2eff659f493fee4a703d454d9a2450befde6fb4.
Peer efbbc42e (amplification/weighted vanishing), c03ab6dc (additive
detector), 2e27597e (root lemma), c561038c (marked inverse),
c423f7ff (tame tensor and payment) concern other suppliers.
No URT, no RH-root import, no protected or peer file edits.

Source anchors relative to grh-compact/src:
 New/DiscreteSeries/TwoFactorSetup.lean fe2191cfa7eadc8683787a881a5f2fa16a9a0667:
 norm_sq_add_re_trace_le 59–68, dsCoeff_mul_eq_of_zero_weight_block 88–100,
 IsTwoFactor.exists_near_one 119–148.
 New/DiscreteSeries/MinorExpansion.lean 772d0fa5ac3e3b6bfbd4cf90c181e3e1ad359acb:
 exists_det_compress_eq_exp_logOneAdd, exists_principalMinor_eq_exp.
 New/DiscreteSeries/GaussianShape.lean 37f359a0100b2ed6b67b4256af5e976bbbb19259:
 sum_norm_lie_coordProj_sq 18–25, norm_weightMinors_sq_le_exp 27–41,
 dsCoeff_gaussian_shape 48–99.
 New/DiscreteSeries/RestrictionLemma.lean 3d34e61d993473d314a9af56d55f0444a874aab6:
 IsTwoFactor.laplace_method 134–191.
 RUN55 uses exactly these suppliers before the common Bessel peak.

## 1. Weighted row identity and same-witness polar correction
Use the actual IsTwoFactor hypotheses H, B>=1, 0<r<=1/100 and
g,g' = j(s); X=g-I, X'=g'-I. All norms below are Frobenius unless
marked op. Let J be the sign diagonal of g. From g J g*=J
(obtained also from g* J g=J), diagonal entries give
    2 Re X_ii = -sum_j J_ii J_jj |X_ij|^2.                 (1)
For real weights v,w with a v_i^2<=w_i and w_i<=C whenever
the signs at i,j differ, multiply (1) by w_i and add the weighted
squared row norm. Same-sign coefficients a v_i^2-w_i are <=0;
opposite-sign coefficients a v_i^2+w_i are <=2C. This proves the
actual norm_sq_add_re_trace_le, including negative a if applicable.
In particular
    ||X||^2+2 Re tr X=2||g-blockDiag(g)||^2.                (2)

Let E be the inclusion of the left zero-weight, positive-sign X
block (the source inclMatrix(e o inl)), P=EE*, R=I-P.
Write c=||R X||, u=||g-blockDiag(g)|| and u' for the right group.
Using v=1_R, w=-Lambda, a=B, C=3B on g gives
 B c^2-2 Re tr Lambda X <=6B u^2.
For the second factor take a=0,w=Lambda',C=3B, yielding
 2 Re tr Lambda' X'<=6B (u')^2.
The trace-phase equality and Re phi=0 cancel these two weighted
traces EXACTLY. Hence c^2<=6(u^2+(u')^2)<=6r^2.            (3)

Replace the long Cayley algebra in exists_near_one by an ordinary
polar factor on the SAME positive-sign block. Write
 g = [A F; C D] with A=E*gE and C=R g E in block notation.
The positive block of g*Jg=J is A*A=I-C*J_R C.
Set K=C*J_R C, Hermitian, with ||K||op<=||C||^2<=c^2<1.
Thus A invertible. Its polar factorization is A=U H0,
H0=(I-K)^(1/2)>0. Put V=U* in the actual H.exists_diagonal:
it produces ONE s0 for which j(s0) is V on the prescribed left
and right zero-weight blocks and identity off them, precisely
the original pair of inclusions, not independent corrections.
Let t=s0 s. On the left, the upper-left block is now H0;
all rows outside the block are unchanged.

In an orthonormal eigenbasis e_i of K, lambda_i real,
 sqrt(1-lambda_i)-1 >= -|lambda_i|,
 sum_i |lambda_i| = sum_i |<C e_i,J_R C e_i>| <= ||C||^2.
Consequently Re tr(H0-I)>=-||C||^2>=-c^2.
The outside diagonal trace is >=-c^2/2 by summing (1) over
outside rows. Therefore Re tr(j1(t)-I)>=-3c^2/2.
Apply (2) at t. The first off-diagonal-sign norm is unchanged
because the compact correction is unitary and commutes with J.
The second is unchanged for the same reason (native sign_weight_right
and exists_diagonal). The common trace H.trace_eq t gives EXACTLY
the same lower bound for the second real trace. Thus for i=1,2
    ||j_i(t)-I||^2 <= 2r^2+3c^2 <=20r^2 <=100r^2.          (4)
This is stronger than the original 10r bound, but use 10r in
RUN55, with no change of its constants or guards.
The native dsCoeff_mul_eq_of_zero_weight_block preserves each
coefficient under this very compact correction; its first output
also says diag Lambda(j1(s0)-I)=0 and likewise on the right.
Hence phi(s0)=0 by H.phase_eq, phi(t)=phi(s) by additivity.
The entire complex laplaceIntegrand is unchanged. This supplies
the actual near-one conclusion for the same t in both factors.
The polar proof uses only ordinary finite-dimensional spectral
theory; no new hypothesis or independent choice of the two factors.
Retain the native zero-weight coefficient invariance (its elementary
principal-minor proof at lines 88–100) and inclusion identities.

## 2. Compressed logarithm: exact quadratic cancellation
This is a direct human proof of exists_det_compress_eq_exp_logOneAdd
with precisely its original hypotheses. Orthogonal projections P,Q;
X arbitrary complex matrix, ||X||<=delta<=1/2, A=[P,X],
||A-Y||<=delta*c, ||Y||<=c, ||D||<=c for D=Q-P, and
tr([P,Q]Y)=0. Necessarily delta,c>=0. R=I-P.
Use op<=Frobenius, ||A||<= (1+delta)c. No normality of X,Y assumed.

Put B=PXR, C=RXP, M=PXP. For k>=2 the exact telescoping identity is
 P X^k P - M^k = sum_(i=0)^(k-2) M^i B R X^(k-1-i) P.
Also R X^m P = sum_(j=0)^(m-1) (RXR)^j C P X^(m-1-j) P.
The second formula follows by splitting I=P+R after the first X;
the first is the same recurrence on the P block. Both are valid
including m=1 and zero-rank projections. Thus
 ||R X^m P||<=m delta^(m-1)||C||
and, using trace Cauchy-Schwarz on B and the other off-diagonal factor,
 |tr(P X^k)-tr((PX)^k)| <= k(k-1)/2 delta^(k-2)||B||||C||.
Here tr((PX)^k)=tr(M^k), by block triangularity.

The absolutely convergent logarithm series in finite dimension
(and det exp = exp trace) gives
 det(I+PX)=exp(tr log(I+PX)).
At k=2 the difference of logarithmic traces is EXACTLY
 -1/4 tr(A^2) (since A=[0 B;-C 0] and tr A^2=-2tr BC).
For all k>=3 sum the bound divided by k:
 1/2 sum_(k>=3)(k-1)delta^(k-2)
 =delta(2-delta)/(2(1-delta)^2) <=3delta.
As ||B||||C||<=||A||^2/2, obtain
 |tr log(I+PX)-tr(P log(I+X))+tr(A^2)/4|
 <=(3/2)delta (1+delta)^2 c^2.                            (5)
All signs fixed before taking norms. No unweighted dimension
factor arises. Series also covers delta=0 directly.

## 3. Shift from P to Q without first-order loss
In the P,R decomposition D=Q-P obeys
 PDP=-PD^2P, RDR=RD^2R; hence the sum of the trace norms of the
two diagonal blocks is tr D^2=||D||^2. For L=log(I+X),
 ||L||op<=delta/(1-delta)<=2delta. The diagonal part of tr(DL)
has absolute value <=2delta c^2.
For the off-diagonal part D_off,
 tr(D_off X)=-tr([P,Q]A)=-tr([P,Q](A-Y))
by the actual orthogonality assumption. This has magnitude <=delta c^2.
The log tail commutator satisfies
 ||[P,L-X]|| <= sum_(k>=2)delta^(k-1)||A||
             <=2delta(1+delta)c,
by the Leibniz identity for [P,X^k]. Since off-diagonal trace
equals minus the trace product of the two commutators, its
contribution is at most 2delta(1+delta)c^2.
Finally cyclic trace gives
 |tr(A^2-Y^2)|/4 <=delta(2+delta)c^2/4.
Combining with (5), define exactly
 r0=tr log(I+PX)-tr(Q L)+tr(Y^2)/4.
Then det(I+PX)=exp(tr(Q L)-tr(Y^2)/4+r0) and
 |r0| <= delta*c^2 * [1.5(1+delta)^2+2+1+2(1+delta)
                         +(2+delta)/4] <=100 delta c^2.    (6)
Indeed the bracket is <=10 on [0,1/2]. The source bound 100 is
retained, as is the exact logOneAdd (the convergent power series,
equivalently the native resolvent integral). This is the native
compression lemma under ALL its original hypotheses, by a shorter
series argument. Its three uses at exists_principalMinor_eq_exp
for R,R and Q,P can now invoke (6), but the specific lower-mask,
accretivity and conjugated-minor identities at that caller still
need their own derivation; do not claim that theorem complete.

## 4. Actual Gaussian weight-minor decay: exact layer aggregation
For integer w_i, a=sum |w_i|, P_t projection on {i:w_i>=t},
-a<t<=a. The (i,j) entry of [P_t,X] is
 (1_(t<=w_i)-1_(t<=w_j))X_ij.
The number of separating thresholds is EXACTLY |w_i-w_j|.
Summation proves both source sum_norm_lie_coordProj_sq identities:
 sum_t ||[P_t,X]||^2 = sum_ij |w_i-w_j||X_ij|^2,
 sum_t tr(P_t X) = sum_i (w_i+a)X_ii.
The second follows since the number of thresholds t<=w_i is w_i+a.

For the actual k in maxCompactU, k is ordinary unitary. On im P_t
put A_t=P_t k P_t, C_t=(I-P_t)kP_t. Then A_t*A_t=I-C_t*C_t.
Eigenvalues of C_t*C_t belong to [0,1]. If any equals 1 the
minor vanishes and the desired upper bound holds. Otherwise
 |det A_t|^2=prod_j(1-lambda_j)<=exp(-sum_j lambda_j)
 =exp(-||C_t||^2).
Unitarity on both sides gives ||P_t k (I-P_t)||^2=||C_t||^2
(by subtracting the traces of A_t*A_t and A_t A_t* from rank P_t).
Thus ||[P_t,k]||^2=2||C_t||^2. The native weightMinors_eq_det_zpow_mul_prod
formula is the product of these principal minors times det(k)^(-a),
which has absolute value 1 (same conclusion if the convention uses
the inverse determinant exponent as stated in the source).
Multiply the bounds and apply the exact threshold identity:
  |weightMinors(w,k)|^2 <= exp(-gapWeightedNormSq(w,k)/2).
This proves the actual compact Gaussian tail bound without
individual eigenvalue approximations or loss depending on rank.
It supplies the precise exponential majorant at lines 94–99
of dsCoeff_gaussian_shape. That full theorem still needs the
specific conjugated principal-minor error and the normalizing
compact integral lower bound; no assertion of their closure here.

## Dependency and execution ledger
Original source-level graph (retain RUN55 complete ledger):
 B -> filling -> exists_besselSystem -> exists_isBesselFunction
 -> laplace_method -> {exists_near_one, dsCoeff_gaussian_shape,
 phase_logOneAdd, decay, covering, integral_decay}.
 exists_near_one -> {norm_sq_add_re_trace_le, exists_diagonal,
 phase_eq, trace_eq, dsCoeff_mul_eq_of_zero_weight_block,
 native Cayley correction}.
 dsCoeff_gaussian_shape -> {exists_principalMinor_eq_exp,
 norm_weightMinors_sq_le_exp, sum_norm_lie_coordProj_sq,
 normalizing compact integral lower bound}.
 exists_principalMinor_eq_exp -> {exists_det_compress_eq_exp_logOneAdd,
 lowerMask shifts, accretivity, triangular minors, exact conjugation}.
Candidate human replacement graph:
 signed row identity + same-block polar + common trace
 -> exists_near_one (retains zero-weight coefficient invariance);
 block log series + Q-P diagonal square identity + orthogonality
 -> exists_det_compress_eq_exp_logOneAdd;
 threshold aggregation + unitary compression
 -> norm_weightMinors_sq_le_exp and both threshold identities.
All three are source-matched human proofs, not new kernel terms.
No global dependency deletion, no claimed elaborated graph,
and no new axiom evidence. Preserve original archive and graphs.

Actual local Python/SymPy execution this run:
 8 symbolic compression checks (k=2..8 exact 2x2 noncommuting
 matrix recurrence and quadratic trace identity), 3087 exact threshold
 counts (all 3-tuples of weights in -3..3, all nine index pairs),
 102 exact rational scalar checks (delta=i/100,i=0..50, two bounds).
Zero violations. These are regression checks, not the full-domain
proof or native verification. Reproduce using:
 X=Matrix([[x,y],[z,w]]); P=diag(1,0); R=eye(2)-P
 for k in range(2,9):
   assert expand_entries(P*X**k*P-(P*X*P)**k
      -sum(((P*X*P)**i*P*X*R*X**(k-1-i)*P
            for i in range(k-1)),zeros(2)))==zeros(2)
 A=P*X-X*P
 assert expand(trace((P*X)**2)-trace(P*X**2)-trace(A*A)/2)==0
 for weights in product(range(-3,4),repeat=3):
   a=sum(map(abs,weights))
   for i,j in product(range(3),repeat=2):
     assert sum((int(t<=weights[i])-int(t<=weights[j]))**2
        for t in range(-a+1,a+1))==abs(weights[i]-weights[j])
 for i in range(51):
   d=Fraction(i,100)
   assert d*(2-d)/(2*(1-d)**2)<=3*d
   assert Fraction(3,2)*(1+d)**2+1+2+2*(1+d)+Fraction(1,4)*(2+d)<=100
Here expand_entries means entrywise sympy.expand, and the executed
script used all(expand(v)==0 for v in matrix_difference).

Local command -v lean/lake returned empty, so native rh_scan/prune/
reduce/auto/auto_frontier unavailable. Actual state records re-read:
original 45577239749 pass (b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc),
45576756833 pass (7da354941e402b6f8b364ed03d8c5c82d27b7717).
These use original pin, not compact. Latest integration WIP records
targeted 45799225653 success, not independent new replay here.
No new native PASS; scalar candidates below and source interface
checks are prepared for shared bounded replay.

RESUME HERE: integrate polar proof (1)-(4) before RUN55 near-cone
argument. Use (5)-(6) at the three exact compression calls of
exists_principalMinor_eq_exp, and section 4 at GaussianShape.
Next finish lowerMask shifts, exact complementary-minor identities
and the explicit 200000*||X||*(||[P,X]||^2+||[P,k]||^2) error,
then the actual Gaussian integral normalization. The unresolved
Schur, local band, geometric witnesses and A/C inputs remain.
HANDOFF TO: integration/editor, positivity geometry, audit, kernel.
-/

namespace CompactRun56

theorem near_budget (r2 c2 n2 t : ℝ)
    (hc : c2 ≤ 6*r2) (ht : -3*c2 ≤ 2*t)
    (hn : n2 + 2*t ≤ 2*r2) : n2 ≤ 20*r2 := by
  linarith

theorem compression_budget (d : ℝ) (h0 : 0 ≤ d) (h1 : d ≤ 1/2) :
    (3/2 : ℝ)*(1+d)^2+2+1+2*(1+d)+(2+d)/4 ≤ 100 := by
  have hh : (1+d)^2 ≤ (3/2 : ℝ)^2 := by
    nlinarith [mul_nonneg (show 0 ≤ 1/2-d by linarith)
      (show 0 ≤ 5/2+d by linarith)]
  linarith

theorem compression_tail_scalar (d : ℝ) (h0 : 0 ≤ d) (h1 : d ≤ 1/2) :
    d*(2-d) ≤ 6*d*(1-d)^2 := by
  have h : 0 ≤ (1/2-d)*(4-3*d) := mul_nonneg (by linarith) (by linarith)
  have hh : 0 ≤ d*(2*(1/2-d)*(4-3*d)) :=
    mul_nonneg h0 (mul_nonneg (by norm_num) h)
  nlinarith only [hh]

#print axioms near_budget
#print axioms compression_budget
#print axioms compression_tail_scalar
#check norm_sq_add_re_trace_le
#check IsTwoFactor.exists_near_one
#check exists_det_compress_eq_exp_logOneAdd
#check exists_principalMinor_eq_exp
#check sum_norm_lie_coordProj_sq
#check norm_weightMinors_sq_le_exp
#check dsCoeff_gaussian_shape
#check IsTwoFactor.laplace_method
end CompactRun56
