import Development.AbelianVarietyTheory.Proofs.FlagMeasures.DiscreteSeriesCountingOfFiniteAndBounds
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN29 — actual irrC producer located; retain signs before counting norms.
25 Nov 2026, lane 8. Human source-matched conditional reduction.
Lean certificate PREPARED, NOT compiled. RH OPEN. No URT claim.

Read updated ONE_EQUATION_MISSION (blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc),
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity/state/runner excerpts,
live manuscript, RUN25–28, peer character_boxes RUN28, geometry RUN27–29 and
math/2026-11-25_RECURSIVE_THREE_CYLINDER_REDUCTION.md. The latter reduces the
consumer to three counts; this run finds and weakens their actual producer.
No duplicate ASK-Main count or determinant-anchor claim.
Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Upstream main observed 251c7b05dd869ceba1aa42c6001c00b4010f23f9.
DiscreteSeriesCountingOfFiniteAndBounds.lean at that head has blob
037c993de804c377eaafc0645a293bff7a37387f, different from the pin; not incorporated.

## Actual source chain (text-level, not a new elaborated dependency export)

T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
F = src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/
Fetched pinned sources, blob SHA:
T/HypothesesNonemptyOfUnramifiedExponents.lean c0ce994aa86f737b707b5617fb10bcfb35c0117e
T/LinkROfIsLinked.lean 66e5fddcb389f78669cef5787ef2c648d537bf4d
T/NonemptyHypsOfAllRows.lean 6a09205dfc3e57486ecbc27517072f3c27f09a51
T/AllRows.lean be24ab5328945e90d2b981ff43ed9f20bb8b86ac
T/CountsIrreducibilityConstants.lean 1e6d9219a64c3d573bbd3c0a442570caeb553089
T/RowCountsOfLabels.lean 46438432976ffff865f5b01eeb5342e5a130f3b4
T/RowCountsOfTies.lean d78c67aa13ee935884c5aa5e5d161ec3aabe5d2a
F/IrreducibilityRowOfConcreteAutomorphicDataStatement.lean d7d161e181f83181a19b75c85202b830866168c2
F/IrreducibilityRowOfConcreteAutomorphicData.lean c6d2a8a6010c9997597b2935fec9e74c30b2aaad
F/AllRowsAtRecord.lean 803702a697069eac71c8d65b8ffc4a8f3debc2b4
F/CountClausesClosed.lean d14c394189774d93f252883ed12ffab789052de6
F/CountConstantsOfSiegelWeil.lean b8eb126f514c8c05e344717c69161a343354a694
F/CountTypedOfVolumeStep.lean 51eec4beb9bed7964345b1fc40a14541dd643cd1
F/VolumeStepOfSiegelWeil.lean c2bd4df73ae7b59630c288118051497bdf3928d8
F/UnitaryAutomorphicCountingOfCompactDualVolumeRatStatement.lean 3fe47f6b1a2cef8ef28f8abc3b53cd2d0520ab48
F/UnitaryAutomorphicCountingOfCompactDualVolumeRat.lean 2a66d72b3180fbb9cff093ad05a9fda228b0daa6
F/UnitaryAutomorphicCountingUnbundledStatement.lean d1c3847d81d33ac44bc6358c20a66357703a5511
F/DiscreteSeriesCountingOfFiniteAndBoundsStatement.lean 7cf1e657ab3bb0053a0ab66caf80bb21ec468502
F/DiscreteSeriesCountingOfFiniteAndBounds.lean a9291349d3e9a987f33c2930c6428cc5d6e42765
F/AbsIntegralSubConstMulLeOfSplit.lean c70a423ea78eeb5630d007abf0ed9a28d6efe5b5
F/AbsSubLeExpNegSixteenthMul.lean 107ba5a3400ee905acd0f89933e176d20981ea30
F/FlagRareOfNonzeroFlagBound.lean e25276765e2ea1676523f52e3206f9f3789bec19
src/Formalism/SharpRestriction/LevelLetterCocycles/CylinderCountFamily.lean
 f336de094ed6f8dae4cb935a041821612a2c502f

In the actual every_character_of_literature_of_vWin assembly,
hypotheses_nonempty_of_unramified_exponents_alt calls allRows_of_open0_alt.
Its c30 field is row_counts_of_labels_alt hSW ... o.lab, which retains the
same linked row witness and calls row_counts_of_ties_alt. The latter constructs
h30 via count_constants_of_siegelWeil and irrC via
irreducibilityRow_of_concreteAutomorphicData hSW rowsFinDim_link.
nonempty_hyps_of_allRows_alt extracts both from hA.c30 and classSel hall,
then inserts the actual irrC and cIc into HypsAlt. They use the same family.

IrrRowConcrete.irr_row_closed synchronizes hX, hEv, hGap, with threshold
max(max x1 x2)(max y (Fm.x1+1)); preserves TuSize, X,G,iota, hAut, hR,hLab.
allRows_at_record builds actual AllRows, including nontrivial stdChar,
rowsLab_holds, countBase_of, LabelCountGoodInjective, AllJoinA,
tieCountAt_allRowsOf, pCountTie_holds. It invokes
countCylAt_of D _ (hCnt CountE.PCount) hTC ... and countAllRows_of.
The source count_constants_of_siegelWeil actually chooses cIc=c3=cb=1/16,
with n0,C0 from count_typed_of_volumeStep (volumeStep_of_siegelWeil hSW).
The latter calls unitaryAutomorphicCounting_unbundled after
CountFinal.countingTheorem_of_volumeStep. Its hFin,hFM,hPt,hNear,hFar,hRare,
hDeep feed discreteSeries_counting_of_finite_and_bounds and the actual
CountSum.countingTheorem_of_finite_of_bounds. This locates the global
geometric count, not merely the local finite-group Green mass.

## New one-sided producer
Keep the exact native RowsAut B, CountHyp B Cg n0 d p q b, same host,
signature, gap, hfinC, hflag, hpt, kernel integrability and trace identity.
The q=0 branch has exact definite count; do not use principal character
to change q or rank. For q>0 in CountSum.countingTheorem_of_finite_of_bounds:
mu=(B.I.muA B.mu_f).restrict B.fund (mu_f is source field B.μf);
M={x | tauStar B q b <= least B.I x}, K=Re kern(B.I,phe B d,x,x).
K>=0 by the native frame expansion hexp, integral K=D=B.D,
c=(product_v d_v)*Re(e(1))>=0, Ds=c*mu(univ)=mainTerm B d>=0.
Put n=B.I.n, f=B.I.f, r=exp(-n*f*log(n)/4), s=exp(-n^2*f).
From the SAME source moderate near/far estimates,
I=integral_M (K-c) satisfies |I| <= (r+s)*Ds.
Let J=integral_(M^c) K and H=c*mu(M^c). Both nonnegative.
The exact split inside abs_integral_sub_const_mul_le_of_split is
    D-Ds = I + J - H.
Source takes the absolute value and bounds both J<=sD and H<=rDs.
Instead:
* Full cylinder only: J>=0, H<=rDs from hrare imply
      D >= (1-2r-s)*Ds.
  No quantitative hdeep bound for this evaluation.
* Each bad cylinder only: H>=0, J<=sD from hdeep imply
      (1-s)*D <= (1+r+s)*Ds.
  No quantitative hrare bound for this evaluation.
These keep signs before norms. Source threshold n>=exp(15), f>=1
implies n>=16, log n>=15, r<=exp(-60)<=1/8, s<=exp(-256)<=1/8
(using exp(t)>=1+t). Hence full D>=Ds/2, bad D<=2Ds.
No division by a possibly zero bad main term. For definite q=0 these
also follow from the original equality.

## Same-host transfer into actual LinkIRR consumer
Use the exact selected full cylinder and two bad label sets of the peer
three-cylinder note, not independently chosen hosts. CylinderCountFamily
contains hdimU, hdimK, hDS: eT_one yields each bad main term=dS*p_k,
p_k=locShare, and full main term=dS>0. Here Dall=N, Dgood=m;
the actual label preimage cardinality (not image cardinality) gives b_k,
N-m<=b0+b1. Keep the original hTC/PCount, row-tie and measure normalization
while replacing only the direction of count required. Then
    N>=dS/2, b_k<=2*dS*p_k
    ==> N-m <= 4*(p0+p1)*N <= 4*(W0+W1)*N.
With the native eventual bound W0+W1<=2*x^(3 Cs+3)*exp(-x^(eta/6)),
eta>0 fixed, the extra constant 4 is absorbed eventually by exp(-x^(eta/7)):
x^(eta/6)-x^(eta/7)-(3Cs+3)log x-log 8 tends to +infinity.
Thus the same LinkIRR eventual conclusion needs only these one-sided
producer estimates. No quantitative deep bound for full count; no
quantitative rare bound for the two bad counts. Common hflag, positivity,
finite dimension and moderate near/far estimates retained for all.
The signed split is elementary and independently derivable; no claim of
a new published counting theorem or closure of the native suppliers.

Original graph (source-level): same hSW and all ties -> h30 AND irrC ->
allRows_at_record -> CountCylAt -> CountAllRows -> ConcNP.delp_of_allRows.
Original local producer hFin,hFM,hPt,hNear,hFar,hRare,hDeep ->
absolute split -> exp(-nf log n/16) two-sided count.
Proposed replacement for irrC branch only: same selected record ->
full signed lower with hRare + bad signed upper with hDeep ->
three counts -> LinkIRR. h30 remains separately required by its consumers;
do NOT delete full CountTheorem, hRare, hDeep or cIc globally.
All constructor, type and value edges/axiom evidence from prior audit
preserved; no new native edge/axiom export yet. Neither branch is closed
independently; quantitative near/far/rare/deep suppliers and their actual
geometric prerequisites still need proof. No native caller rewrite yet.
Context key=(source pin,B, d, p,q,b,Cg,n0, actual D7,X,G,iota,k,S,
same eT/ReT, fixed family eps, threshold); reuse measures/coefficients
only when those match. Backtrack to original full count on failed replay.

## Executed exact regression (Python 3 stdlib, fractions)
from fractions import Fraction as F
lo=hi=combined=0
for ds in map(F,[0,1,2,8,17]):
 for r in [F(0),F(1,32),F(1,16),F(1,8)]:
  for s in [F(0),F(1,32),F(1,16),F(1,8)]:
   for i in [-(r+s)*ds,F(0),(r+s)*ds]:
    for h in [F(0),r*ds,2*ds]:
     for j in [F(0),s*ds,ds,2*ds]:
      d=ds+i+j-h
      if d<0: continue
      if h<=r*ds:
       assert d>=(1-2*r-s)*ds>=ds/2;lo+=1
      if j<=s*d:
       assert (1-s)*d<=(1+r+s)*ds and d<=2*ds;hi+=1
for ds in map(F,[1,2,8,17]):
 for p in [F(0),F(1,16),F(1,4),F(1,2),F(1)]:
  for q in [F(0),F(1,16),F(1,4),F(1,2),F(1)]:
   for n in [ds/2,ds,2*ds]:
    for b0 in [F(0),2*ds*p]:
     for b1 in [F(0),2*ds*q]:
      d=min(n,b0+b1)
      assert d/n<=4*(p+q);combined+=1
assert F(0)<F(1,2) # Ds=1,I=J=0,H=1, D=0; lower without rare bound fails
assert F(3)>F(2) # Ds=1,I=H=0,J=2,D=3; upper without deep bound fails
print(dict(lower=lo,upper=hi,combined=combined,negative_controls=2))
Actual output: {'lower': 2112, 'upper': 1260, 'combined': 1200, 'negative_controls': 2}.
Abstract scalar regression only, not native geometric counts.

Retrieved actual CI status files for 45577239749 and 45576756833: pass, returncode 0,
only engine and conditional half-strip adapter. No new Lean execution: local
command -v lean and lake both returned nothing. Candidate below is unverified,
including tactic replay, not a PASS. No imported claimed RH theorem.
Independent audit requested; prior published claims not newly certified.

RESUME HERE: kernel lane compile this scalar replay in pinned environment,
then specialize integral split directly to native K, M, c and trace before
calling absolute split. Keep h30's separate producer intact. For next
mathematical run inspect hNear/hFar aggregate estimates and whether bad
cylinders admit a shared bound in the actual record, without deleting
any unverified hflag or changing host/rank. Preserve RUN28 pending native
series bridge. HANDOFF TO math, kernel, audit, integration/editor.
Canonical G(x) <= x^(1/2+9 eps) remains unproved on arbitrary distant windows.
-/

namespace RHTheta29

theorem signed_lower (D Ds I J H r s : ℝ)
    (he : D - Ds = I + J - H)
    (hi : -(r+s)*Ds ≤ I) (hj : 0 ≤ J) (hh : H ≤ r*Ds) :
    (1-2*r-s)*Ds ≤ D := by
  linarith

theorem signed_upper (D Ds I J H r s : ℝ)
    (he : D - Ds = I + J - H)
    (hi : I ≤ (r+s)*Ds) (hh : 0 ≤ H) (hj : J ≤ s*D) :
    (1-s)*D ≤ (1+r+s)*Ds := by
  linarith

theorem full_half (D Ds r s : ℝ) (hDs : 0 ≤ Ds)
    (hr : r ≤ 1/8) (hs : s ≤ 1/8)
    (hl : (1-2*r-s)*Ds ≤ D) : Ds/2 ≤ D := by
  have hc : (1/2 : ℝ) ≤ 1-2*r-s := by linarith
  have hp := mul_le_mul_of_nonneg_right hc hDs
  linarith

theorem bad_double (D Ds r s : ℝ) (hD : 0 ≤ D) (hDs : 0 ≤ Ds)
    (hr : r ≤ 1/8) (hs : s ≤ 1/8)
    (hu : (1-s)*D ≤ (1+r+s)*Ds) : D ≤ 2*Ds := by
  have h1 : (7/8 : ℝ) ≤ 1-s := by linarith
  have h2 : 1+r+s ≤ (5/4 : ℝ) := by linarith
  have h3 := mul_le_mul_of_nonneg_right h1 hD
  have h4 := mul_le_mul_of_nonneg_right h2 hDs
  linarith

theorem three_count (N m Ds p q b0 b1 : ℝ)
    (hp : 0 ≤ p) (hq : 0 ≤ q)
    (hn : Ds/2 ≤ N) (h0 : b0 ≤ 2*Ds*p) (h1 : b1 ≤ 2*Ds*q)
    (hb : N-m ≤ b0+b1) : N-m ≤ 4*(p+q)*N := by
  have h := mul_le_mul_of_nonneg_right hn (show 0 ≤ 4*(p+q) by positivity)
  linarith

theorem replay_lower (D Ds I J H r s : ℝ)
    (he : D - Ds = I + J - H)
    (hi : -(r+s)*Ds ≤ I) (hj : 0 ≤ J) (hh : H ≤ r*Ds) :
    (1-2*r-s)*Ds ≤ D := by
  first | (rh_reduce 2 using [signed_lower]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact signed_lower D Ds I J H r s he hi hj hh

end RHTheta29

rh_scan GlobalTheory.CountSum.countingTheorem_of_finite_of_bounds limit 2000
rh_scan RHTheta29.three_count limit 2000
rh_prune GlobalTheory.abs_integral_sub_const_mul_le_of_split as RHTheta29OriginalSplitPruned
rh_prune RHTheta29.signed_lower as RHTheta29LowerPruned
rh_prune RHTheta29.signed_upper as RHTheta29UpperPruned
#print axioms GlobalTheory.CountSum.countingTheorem_of_finite_of_bounds
#print axioms RHTheta29.signed_lower
#print axioms RHTheta29.signed_upper
#print axioms RHTheta29.full_half
#print axioms RHTheta29.bad_double
#print axioms RHTheta29.three_count
#print axioms RHTheta29.replay_lower
