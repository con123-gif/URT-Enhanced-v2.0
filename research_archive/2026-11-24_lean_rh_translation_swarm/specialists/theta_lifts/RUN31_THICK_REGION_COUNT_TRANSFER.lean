import Development.AbelianVarietyTheory.Proofs.FlagMeasures.DiscreteSeriesCountingOfFiniteAndBounds
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.NearTermsModeratePointsOneTypeBound
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.FlagRareOfNonzeroFlagBound
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
25 Nov 2026, lane 8 RUN31. Human source-matched conditional reduction.
Native scalar certificate PREPARED, NOT compiled. RH OPEN.

Read latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity/state,
live manuscript 7beedb2752d934a81d4c92b5a19c1c48362e0dc9, RUN29–30,
latest branch commits including 708a3eb7 (same-rank mass),
e02666f2 (endpoint count), 188850b1 (geometry), e627db49 (editor),
a543f365 (audit). Their reductions concern other suppliers.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest upstream observed d91ae2678eea19a0c3045ffca37f1da757c2e719;
NearTermsModeratePointsOneTypeBound at that revision has blob
1874cda42e5a6134bccf61eff3820bb2ad2a712d, different from pin; no mixing.

Source ledger, F=src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/:
F/NearTermsModeratePointsOneTypeBound.lean 48a481baec0116e94337ff5d9e42f2ce90ed2e12
F/NearTermsModeratePointsOneTypeBoundStatement.lean eed052dc3f2006553fb8175d14b784a90f8d5fb2
F/FlagRareOfNonzeroFlagBound.lean e25276765e2ea1676523f52e3206f9f3789bec19
F/NearAbsMeasurableAndSplit.lean 0d56155ee6a310d5f2cff48ea23c4577d8c9b595
F/DiscreteSeriesCountingOfFiniteAndBounds.lean a9291349d3e9a987f33c2930c6428cc5d6e42765
F/FarTermsModerateRegionOfFlagBound.lean 51d80e2ef1a05d49e8e7bbcd6de941d1e62de856
F/AbsIntegralSubConstMulLeOfSplit.lean c70a423ea78eeb5630d007abf0ed9a28d6efe5b5
F/ModerateLogFactorAbsorbed.lean 461ded98044f718637e6fc7e36fc9ba111ddfa19
src/Development/AbelianVarietyTheory/BlockTheory/SiegelWeilLocal/
 NearNonzeroTerms.lean a5d901b138c178d54f4e201de57fe073159bb379
 FarTermSum.lean 864ffc03774937e4cb02b52fae0d2f3f91da93bb
src/Formalism/SharpRestriction/LevelLetterCocycles/CylinderCountFamily.lean
 f336de094ed6f8dae4cb935a041821612a2c502f

## Compact human proof block for integration: use thick region for the denominator

Use the SAME selected full and two exceptional cylinders of RUN29–30,
actual TieCountAt and CylinderCountFamily.badAt_le; keep preimage counts,
all admissibility, finite dimension, trace, common host and row ties,
and the independent h30 supplier. q=0 retains native exact count.
For q>0, let mu=(I.muA mu_f)|fund, V=mu(univ)>0,
M={x:tauStar<=least I x}, T={x:1/2<=least I x}.
Native countHyp_numerics gives tauStar<1/2, so T⊆M.
All sets measurable by continuity of least, as in CountSum.
Write D=mainTerm_U=c_U V>0, N=integral K_U,
B=b0+b1, P=p0+p1>=0 with c0+c1=P c_U.
Every diagonal K_j is nonnegative by the frame expansion.
r=exp(-nf log(n)/4), s=exp(-n²f); eventually 0<=r,s<=1/8.
The key newly located fact is the FIRST projection of
GlobalTheory.NearType.near_terms_one_type:
  forall x, 1/2<=least I x -> nearAbs_U(x)=0.
Its proof uses NearUnip to place every near nonzero rational term in
nearSet and NearLower.nearSet_eq to force gamma=1; the identity is
excluded in nearNe. It does NOT require the per-type integration,
composition count or logarithmic absorption portion of the theorem.
Keep NearUnip, Pointwise/CountHyp and native geometric hypotheses;
this is proof-body inspection, not a native pruning result.

Let t=mu(T)/V. Instead of a full moderate near-integral bound and
exponentially small full deep volume, use just t>=3/4 and near vanishing
on T. From the actual near/far split and nonnegative K_U,
  N >= integral_T K_U >= c_U mu(T) - integral_T farAbs_U
    >= (t-s)D >= 5D/8.
The far integral here means the real conversion of the ENNReal norm
majorant; use finiteness from native farModerate and restrict monotonicity.
This needs NO full-cylinder near integral, no full-cylinder deep bound.
It needs only the full far bound on T (native integrated M bound suffices).
A coarse thick mass t>=3/4 follows at the native threshold from
FlagRareProof.flagRare_of_nonzeroFlagBound: its actual statement
bounds probability {least<1/2} by r<=1/8, not merely {least<tauStar}.
Thus this is an original-to-replacement bridge using the actual supplier,
not an independent proof of thick mass or a global deletion of FlagRare.

For the two exceptional kernels use only the upper side:
  (1-s)B <= P*c_U*mu(M) + (r+s)*P*D <= (1+r+s)*P*D.
Indeed identity contributes P*c_U on common M; the sum of their near
integrals is <=rPD, far integrals <=sPD, and deep integrals <=sB.
No rare bound for bad kernels, no comparison of supports, no assumption
that the signed finite test is a projector. Combine BEFORE dividing:
  N-m <= B <= [(1+r+s)/((1-s)(t-s))] P N <= (16/7) P N.
At t=3/4,r=s=1/8 the last scalar factor is sharp for these budgets.
This recovers RUN30's same consumer constant WITHOUT independently
proving its signed discrepancy E_M<=PN or the full near-integral bound.
The native W0+W1 exponential absorption remains valid (RUN29).
Full near vanishing is pointwise; bad near integration remains substantive.

Old graph: actual h30 AND irrC -> CountCylAt/CountAllRows ->
CountFinal -> CountSum -> hFin,hFlag,hPt,hNear,hFar,hRare,hDeep.
RUN30 branch: full and two bad near/far, full rare -> signed moderate
budget -> two bad deep -> LinkIRR.
New branch: same three records and trace; full thick near-zero +
coarse thick mass + full thick far; two bad aggregate near/far/deep ->
one relative bound -> LinkIRR. Original graph/obligations retained:
h30 and any other full CountTheorem consumers unaffected. No global
proof-term deletion claimed. Type/value/constructor edges and pending
nodes from authenticated exports retained, this is a local source graph.
Context key=(pin, same D7,A,I,sigma,w,d,mu_f,fund,R,g,b,p,q,
actual three e/Re/g0, fixed eta, uniform threshold). Backtrack to
RUN30 or native symmetric count on caller replay failure.

Executed Python 3 exact Fraction regression (scalar algebra, not
automorphic data):
from fractions import Fraction as F
from itertools import product
cnt=0
for D,P,r,s,t in product(map(F,[0,1,4,16]),[F(0),F(1,8),F(1,2),F(1),F(2)],[F(0),F(1,16),F(1,8)],[F(0),F(1,16),F(1,8)],[F(3,4),F(7,8),F(1)]):
 for m in [t,(t+1)/2,F(1)]:
  for extra in map(F,[0,1,4]):
   N=(t-s)*D+extra
   for a in [F(0),F(1,2),F(1)]:
    B=a*(m+r+s)*P*D/(1-s)
    assert B<=F(16,7)*P*N
    cnt+=1
D=P=F(1);r=s=F(1,8);t=F(3,4);N=(t-s)*D;B=(1+r+s)*P*D/(1-s)
assert B==F(16,7)*P*N
# Scalar controls: t=1/8,r=s=0,D=P=1,N=1/8,B=1;
# or drop bad deep, D=P=N=1,B=3; or drop full far,
# D=P=1,N=0,B=1.
assert F(1)>F(16,7)*F(1,8)
assert F(3)>F(16,7)*F(1)
assert F(1)>F(16,7)*F(0)
print(dict(exact_checks=cnt,sharp_endpoints=1,negative_controls=3))
Actual {'exact_checks':14580,'sharp_endpoints':1,'negative_controls':3}.

Local command -v lean/lake found no paths. Re-read actual published CI
status.json 45577239749 blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717,
both pass returncode 0; strip root axioms propext, Classical.choice,
Quot.sound; prune scan 2000 visited, 324 pending. Those do not verify
this file. No new native PASS, no URT or complexity improvement claim.

RESUME HERE: extract actual aggregate NearModerate supplier for ONLY
two bad tests, using common archimedean nearSet bound and common
flag measures; sum coefficient masses before integration. Prove the
required aggregate near budget with actual kapBd and type sums, not
an arbitrary signed estimate. Kernel lane replay scalar transfer,
then full thick integral and actual LinkIRR bridge, including
original-to-reduced hypotheses and axioms.
HANDOFF TO integration/editor, geometry, kernel, audit. PARTIAL.
-/

namespace RHTheta31

theorem thick_lower (N D t s : ℝ) (hD : 0 ≤ D)
    (ht : 3/4 ≤ t) (hs : s ≤ 1/8)
    (hN : (t-s)*D ≤ N) : (5/8)*D ≤ N := by
  exact (mul_le_mul_of_nonneg_right (show (5/8 : ℝ) ≤ t-s by linarith) hD).trans hN

theorem thick_transfer (N m B P D t r s : ℝ)
    (hD : 0 ≤ D) (hP : 0 ≤ P) (hB : 0 ≤ B)
    (ht : 3/4 ≤ t) (hr : r ≤ 1/8) (hs : s ≤ 1/8)
    (hN : (t-s)*D ≤ N)
    (hbad : (1-s)*B ≤ (1+r+s)*(P*D))
    (hm : N-m ≤ B) : N-m ≤ (16/7)*P*N := by
  have h1 := thick_lower N D t s hD ht hs hN
  have h2 := mul_le_mul_of_nonneg_right
    (show (7/8 : ℝ) ≤ 1-s by linarith) hB
  have h3 := mul_le_mul_of_nonneg_right
    (show 1+r+s ≤ (5/4 : ℝ) by linarith) (mul_nonneg hP hD)
  have h4 := mul_le_mul_of_nonneg_left h1 hP
  have h5 : (7/8)*B ≤ (5/4)*(P*D) := h2.trans (hbad.trans h3)
  have h6 : (5/8)*(P*D) ≤ P*N := by
    calc (5/8)*(P*D) = P*((5/8)*D) := by ring
      _ ≤ P*N := h4
  linarith [h5,h6,hm]

theorem thick_transfer_replay (N m B P D t r s : ℝ)
    (hD : 0 ≤ D) (hP : 0 ≤ P) (hB : 0 ≤ B)
    (ht : 3/4 ≤ t) (hr : r ≤ 1/8) (hs : s ≤ 1/8)
    (hN : (t-s)*D ≤ N)
    (hbad : (1-s)*B ≤ (1+r+s)*(P*D))
    (hm : N-m ≤ B) : N-m ≤ (16/7)*P*N := by
  first | (rh_reduce 3 using [thick_transfer]; done)
        | (rh_auto_frontier 3; done)
        | (rh_auto 3; done)
        | exact thick_transfer N m B P D t r s hD hP hB ht hr hs hN hbad hm

end RHTheta31

rh_scan GlobalTheory.NearType.near_terms_one_type limit 2000
rh_scan GlobalTheory.FlagRareProof.flagRare_of_nonzeroFlagBound limit 2000
rh_scan GlobalTheory.CountSum.countingTheorem_of_finite_of_bounds limit 2000
rh_scan RHTheta31.thick_transfer limit 2000
rh_prune GlobalTheory.NearType.near_terms_one_type as RHTheta31NativeNearPruned
rh_prune RHTheta31.thick_transfer as RHTheta31TransferPruned
#print axioms GlobalTheory.NearType.near_terms_one_type
#print axioms GlobalTheory.FlagRareProof.flagRare_of_nonzeroFlagBound
#print axioms RHTheta31.thick_lower
#print axioms RHTheta31.thick_transfer
#print axioms RHTheta31.thick_transfer_replay
