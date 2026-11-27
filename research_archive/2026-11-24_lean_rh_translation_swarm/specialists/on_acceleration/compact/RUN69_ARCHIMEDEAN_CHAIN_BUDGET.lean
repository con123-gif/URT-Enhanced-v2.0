import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN69 — exact archimedean chain budget at Theorem A
27 November 2026. Human source-matched derivation; independent audit and
native replacement compilation pending. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact source lsernau/grh-lean at
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src; Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission, protocol, expansion, AGENTS, handoff, integration RUN72
b0fe2a3e, editor RUN71 600d03e0 and theta RUN71 aee9e04a inspected.
Previous acceleration RUN68 08696edb asked for the marked index aggregate
and archimedean caller. The former was ALREADY derived in RUN57
(RUN57_MARKED_ORBIT_BUDGET.lean); do not count it as newly solved.

Source ledger (relative to compact src):
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  Data.weylNormSq_Bmu_le; Data.IsMarked.hasType_prod_markOperator_pow.
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
  exists_chain_eq_sum, Data.IsGoodDatum (coefficient and joint invariance).
New/Rows/MemberKernels.lean be36c0175fe559376780b105052249fc0c9f1f4f
  Parameters.norm_jet_le_of_isAdmissibleComb (second conjunct).
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473
  jetSize_le_add, diagramWeight_le_by_index, card_stdClasses_le_exp,
  primeSum_eq_sum_localAsk, norm_map_star_piG_sq, heightPerRow.
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45
  Data.weylNormSq_restrictToY_le.
New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65
  le_branchExp, restrictToY.
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
  localAsk, forcedPart, gain, jetCeil, loss.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
  scale, a, b1, b2, w, dirCost, jetSize, budget.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185
  bigOmega and cyclotomic conductor.
New/Seesaw/IndexTypes.lean 10e0416c5d653fedde38fcd6bf895a2127a3e1a0
  log_N_mem_Icc.

## 1. Actual chain sum; square only after triangle inequality.

Fix the same D, trivial twist, good datum Ψ, automorphism σ and column φ
as the source theorem. Put X=x, L=log b, J=a+1, u=log(gProd/Ω),
s(d)=log(d!)+d u (native jetSize). Let n_j=n(j), n'=n(j+1).
For each stage and τ, i in range n_j, let d_{jτi} be the native
diagramWeight(rankAt X_{j+1}, κ,(τ,i)). Let
 C_j=P.c*(N1*n_j*n'+1)^2,
 E_j=2 C_j+2 f n_j n' log(2J+2)
       + sum_{τ,i}(d_{jτi}/J+s(d_{jτi})).
The datum is one translated integral vacuum with coefficient 1.
Apply the actual second conjunct of norm_jet_le_of_isAdmissibleComb
to this singleton with J (positive). The equality
 |σ(star piG)|²=gProd is norm_map_star_piG_sq. Thus each stage
multiplies the square-root Weyl norm by <=exp(E_j/2).
Do NOT multiply by a separate coefficient per stage.

Joint invariance supplies the actual exists_chain_eq_sum:
the number of terms indexed by tuples of classes is
 C=prod_{j<m} card StdClasses(columnLevel j);
each summand for a fixed x in support has square-root norm
<=exp((B+sum E_j)/2) at the chosen output. This uses exactly
the chain's original levels, trivial stabilizers, and same pure tensor.
Apply the triangle inequality in the square-root Weyl norm at this
point, and use sum_x |σ Ψ(x)|<=exp(X^60) from H.size_le and
C<=exp(m X^30) from card_stdClasses_le_exp. Squaring gives
 ||σ chain||² <= exp(B+sum E_j+2m X^30+2X^60).
This works even when the output vanishes; no log of its norm needed.

Next restrict to the SAME Y_m, at borderU h. The restriction lemma
pays X^70-(sumτ branchExp τ)log N. Since log N>=0 and
branchExp τ>=κτ(1)-2b, this is at most
 X^70-#tops*a*log N+2 f b log N.
The combined squared exponent is therefore
 B+sum E_j-#tops*a*log N+R,
 R=2m X^30+2X^60+X^70+2 f b log N.
Keep the branching matrix norm, CM conjugate and native stage
operator norm as named suppliers; this argument does not reprove
their foundational geometric estimates.

## 2. Row-factorial aggregation with the actual scale.

For each τ take reference rows r_i=κτ(1) for i=0,
w_0(τ) for 0<i<k, zero otherwise. The source
diagramWeight_le_by_index says d_i<=r_i+e_i with
e_i=h2²+(b1+b2)*1_{i=0}. Since n_j>=k, there are k-1
nonzero-index reference rows, not k; add one harmless
s(w_0) using nonnegativity. Then
 sum_i s(d_i) <= s(κτ(1))+k*s(w_0(τ))
                   +(log(2a+1)+u)*(b1+b2+n_j h2²)
provided r_i+e_i<=2a and u>=0. This is precisely
jetSize_le_add followed by sum, not a Stirling asymptotic.

Here are coarse sufficient scale guards, derived from the actual
bounds in Magnitudes, AdmissibleData and IndexTypes:
 X>=100, L>=64, log X<=L/10^12, log L<=log X/100,
 m<=2 sqrt X<=X, k,n_j,n'<=X^6, f,N1<=X^12,
 h2<=X^41, P.c<=X, b1,b2<=exp(2)*b<8b,
 w_0<=8b+h2<=9b<=a, a>=X b, log a<=L+log X+1.
For f,N1 use towerDeg<=exp(11 log X+log L/5), the
f bound with +P.c, and N1=P.N0*towerDeg, P.N0<=P.c.
The inequalities follow since P.c<=log L/10^12 and
the actual scales make all displayed polynomial slack ample.
In particular b>=exp(10^12 log X), hence X^88<=b.
For u use Ω=exp(chowlaSelbergConst)*2π/rd_E, rd_E>=1
and rd_E<=N1*d (cyclotomic conductor bound), and
|chowlaSelbergConst|<=P.c, 20L<=log gProd<=22L.
This gives 0<=u<=23L: indeed |log Ω|<=P.c+log(2π)+
log(N1*d)<=L. The usual root-discriminant conductor bound is
also used by the source's class-count/level bookkeeping;
retain its field inclusion hypothesis.
Consequently e-sum<=16b+X^88<=17b and r_i+e_i<=a+17b<=2a.
Also log(2a+1)<=2L (from log a above). Thus the row-factorial
excess per τ, stage is <=425 b L; using 442 b L is safe.
The linear sum satisfies
 sum_i d_i/J <= (a+k*a+17b)/(a+1) <= X^7.
The nonrow Gaussian/conjugate expense is <=X^51:
 2C_j <= 2X*(X^24+1)^2 <=X^50,
 2 f n_j n' log(2J+2) <= 4X^24 L <=X^26
using log(2a+4)<=2L and L<=X^.01.
Thus
 E_j <= #tops*s(a)+k*sumτ s(w_0(τ))
         +442 f b L+f X^7+X^51.
This proves the row-sum estimate retaining the original factorial
function, with no assumption of positivity of a complex coefficient.

## 3. Exact prime cancellation and payment of the single error budget.

Write S= #tops*s(a)+k*sumτ s(w_0(τ)).
By primeSum_eq_sum_localAsk, y=a or y=nominalWeight(τ)<=a,
U=ceil x1, and the factor (1-chiK(p))/2 in localAsk,
split primes contribute zero. On the identical nonsplitPrimes set,
 2 sum_p gain(p) log p
 = m*(sum_{τ in tops} primeSum(a,τ)
       + k*sumτ primeSum(nominalWeight(τ),τ)).
Substituting the actual heightPerRow and dirCost gives the EXACT
identity
 heightPerRow + 2 sum_p gain(p) log p
    = m*S - #tops*a*log N.
No prime distribution bound, triangle inequality on prime sums,
or independence between local and archimedean choices is used here.

For the residual expense use log N<=30mL (native log_N_mem_Icc).
Combining sections 1–2 gives total residual
 502 m f b L + m f X^7 + m X^51 +2m X^30+2X^60+X^70.
The last four terms plus m f X^7 are <=X^72<=a by
m<=X, f<=X^12, X>=100 and logB>=10^12 logX.
The first term <=502 f a L by mb<=a. Since f>=1 and
L>=64, the whole residual <= f a(502L+1)<=f a L^3.
This is the original budget, no change of the caller's constant.
Insertion gives exactly
 ||σ B_mu φ(h)||² <=
 exp(B+heightPerRow+2 sum_p gain(p) log p+budget).
Sections 1–3 supply the human assembly at the actual
Data.weylNormSq_Bmu_le, not just an equivalent restatement.
The stage jet bound and branching norm still require their
independent foundational human derivations/audit.

## 4. Connect the existing local aggregate; no duplicate claim.

RUN57 already supplies m*#Lambda<=f and sum_l A_l<=fa/2
by uniform Frobenius orbits (empty mark handled separately).
The individual MarkedPrimeType cost at Jp=jetCeil(p) gives
 total <=64fa logB/p+f*(Jp/X^14+X^40).
Use RUN57's scale guards 2mf<=X^14 and X^40+1<=a/p to
bound the bracket by 2a/p; then total<=3loss(p).
With RUN68's common determinant witness, this is the exact
HasType consumer on Y^m M+p^Jp M. Do not repeat or claim
a second proof of that earlier aggregate. The archimedean
estimate above is distinct; it uses trivial twist and
original columns, not those chosen by the local index.
The subsequent short_forms product formula is the actual
consumer combining local index and global size on its one family.

Dependency ledger:
MemberKernels stage -> exists_chain_eq_sum + good coefficient
bound + class count -> branching norm -> diagram row estimate
and exact prime cancellation -> weylNormSq_Bmu_le -> short_forms
-> star_inequality. Local RUN57 and RUN68 -> uniform index
-> same short_forms. Human replacement path §§1–3;
native original/reduced graphs and axiom evidence retained, no
global edge deletion. Context key: compact pin, D, trivial twist,
Ψ, φ, σ, stage j, exact row index/weight, same output h,
same N and nonsplit set. No URT premise or imported RH.
No runtime/speed or synthetic benchmark claim.

Native check: command -v lean/lake/elan returned no executables.
Actual published result retrieved from cathedral-research-state
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json:
six named native TiltingLemma and Filling.Moments checks,
three standard axioms propext, Classical.choice, Quot.sound;
module_1 (A) timed out return 124 after 2700.11s;
all_requested_checks_ok=false, full_RH_replay=false.
No new native PASS and no rh_scan/prune/reduce/auto/frontier
on the compact context. Scalar certificates and named source
probes below are prepared, not compiled. Independent audit
requested, especially scale guards and row range.
RESUME HERE: editor/integration use §§1–3 in the actual A
short_forms argument, alongside the existing local RUN57/68.
Next reconstruct the stage norm supplier MemberKernels
(norm_jet_le_of_isAdmissibleComb), specifically Gaussian
integration and Schur duality with correct σ and scale, then
the level-N Fourier index if not already supplied by peers.
HANDOFF TO integration, editor, theta, audit, kernel.
Human RH reconstruction remains incomplete.
-/

namespace AccelerationRun69

theorem prime_cancel (m T a logN S P H G : ℝ)
    (hH : H=m*(S-P)-T*a*logN) (hG : G=m*P) :
    H+G=m*S-T*a*logN := by rw [hH,hG]; ring

theorem row_cost (s d e r Q : ℝ)
    (h : s ≤ r+Q*e) (he : 0 ≤ e)
    (hQ : Q ≤ d) : s ≤ r+d*e :=
  h.trans (add_le_add_left (mul_le_mul_of_nonneg_right hQ he) r)

theorem final_budget (m f b a L E : ℝ)
    (hf : 1 ≤ f) (ha : 0 ≤ a) (hL : 64 ≤ L)
    (hmb : m*b ≤ a) (hE : E ≤ a) :
    502*m*f*b*L+E ≤ f*a*L^3 := by
  have hfl : 0 ≤ f*L := mul_nonneg (by linarith) (by linarith)
  have h1 := mul_le_mul_of_nonneg_right hmb hfl
  have h2 : a ≤ f*a := by nlinarith [mul_nonneg (sub_nonneg.mpr hf) ha]
  have hh : 502*L+1 ≤ L^3 := by
    have hL0 : 0 ≤ L := by linarith
    have hL2 : 4096 ≤ L^2 := by nlinarith [sq_nonneg (L-64)]
    have hL3 := mul_le_mul_of_nonneg_right hL2 hL0
    nlinarith
  have h3 := mul_le_mul_of_nonneg_left hh (mul_nonneg (by linarith : 0 ≤ f) ha)
  linarith [show 502*m*f*b*L = 502*(m*b)*(f*L) by ring,
    show f*a*(502*L+1) = 502*a*(f*L)+f*a by ring]

#print axioms prime_cancel
#print axioms row_cost
#print axioms final_budget
end AccelerationRun69

#check Data.weylNormSq_Bmu_le
#check Data.weylNormSq_restrictToY_le
#check Data.jetSize_le_add
#check Data.diagramWeight_le_by_index
#check Data.primeSum_eq_sum_localAsk
#check Data.IsMarked.hasType_prod_markOperator_pow
#print axioms Data.weylNormSq_Bmu_le
