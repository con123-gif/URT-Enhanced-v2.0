import Development.AbelianVarietyTheory.Proofs.FlagMeasures.DiscreteSeriesCountingOfFiniteAndBounds
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.UnitaryAutomorphicCountingUnbundled
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.FarTermsModerateRegionOfFlagBound
import Formalism.SharpRestriction.LevelLetterCocycles.CylinderCountFamily
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
25 Nov 2026, lane 8, RUN30. SOURCE-MATCHED human conditional reduction.
Native certificate PREPARED, NOT compiled. RH OPEN.

Read latest ONE_EQUATION_MISSION (blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
including unified engine and newest ten-page/pyramid directives), AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity/state/protocol excerpts,
live manuscript 75026c85481848e3c615fcec6e25bec2cfae1dbb, RUN29,
math/2026-11-25_RECURSIVE_THREE_CYLINDER_REDUCTION.md, peer geometry
9e7a5f494 and kernel 70732176. Working head observed 90ea42934f0404ac9a88787ac5b657b6d010bdee.
No separate manuscript; integration/editor can use the short comparison below.

Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest upstream observed 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a;
DiscreteSeriesCountingOfFiniteAndBounds has latest blob
037c993de804c377eaafc0645a293bff7a37387f, different from pin; no mixing.

Source ledger (fetched at pin):
F=src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/
F/DiscreteSeriesCountingOfFiniteAndBounds.lean a9291349d3e9a987f33c2930c6428cc5d6e42765
F/AbsIntegralSubConstMulLeOfSplit.lean c70a423ea78eeb5630d007abf0ed9a28d6efe5b5
F/NearAbsMeasurableAndSplit.lean 0d56155ee6a310d5f2cff48ea23c4577d8c9b595
F/FarTermsModerateRegionOfFlagBound.lean 51d80e2ef1a05d49e8e7bbcd6de941d1e62de856
F/UnitaryAutomorphicCountingOfCompactDualVolumeRat.lean 2a66d72b3180fbb9cff093ad05a9fda228b0daa6
F/UnitaryAutomorphicCountingUnbundled.lean 42c085dc9e89d5dbf8e19979b2b5ab30b8217820
F/CountTypedOfVolumeStep.lean 51eec4beb9bed7964345b1fc40a14541dd643cd1
F/IrreducibilityRowOfConcreteAutomorphicData.lean c6d2a8a6010c9997597b2935fec9e74c30b2aaad
F/RowsAutIdemElementary.lean c77643933c790153bd0aeae535dfd1e4f6bb3eb9
src/Development/AbelianVarietyTheory/Definitions/SemilocalFrames/LayerProd.lean
  2a92b374b78661403dde107fa5a46ad5c4f92108
src/Formalism/SharpRestriction/LevelLetterCocycles/CylinderCountFamily.lean
  f336de094ed6f8dae4cb935a041821612a2c502f
src/Development/AbelianVarietyTheory/BlockTheory/SiegelWeilLocal/
  NearNonzeroTerms.lean a5d901b138c178d54f4e201de57fe073159bb379
  FarTermSum.lean 864ffc03774937e4cb02b52fae0d2f3f91da93bb
  DeepSetBound.lean 7adccc386aad5d09df52cd05f30f4c1d5212c9af
  LatticeCountingTheorem.lean 718012eb7a44f2c0449a5877b7381063f7f27216

## Actual reduction: compare the bad kernels with the full kernel BEFORE norms

Use RUN29's actual selected record, same three cylinders in native
CylinderCountFamily.badAt_le (and the actual ConcNP/LinkIRR branch traced
in RUN29; this is a source-level local replacement, not a native caller rewrite).
Write N=Dall, m=Dgood, b_k=bad row preimage counts,
p_k=locShare of its finite bad label set, P=p0+p1>=0,
and Ds>0 for the full main term. N-m<=B=b0+b1.
Do NOT replace preimage cardinalities with label-image cardinalities.

In TieCountAt the unbundled count calls use the same I, b, lam, g, H, sigma,
w, Hs, sigmas, tens, mu_f, fund, R and common h. Only e, Re and g0
can change. count_unbundled constructs RowsAut from precisely these
arguments. The signature p,q is fixed by I (f>=1 gives a place),
and LayerProd.tauStar uses I.n,I.f,I.rd,g,b,q, NOT g0 or e.
Thus the three actual records have the same measure mu=muA|fund,
same moderate domain M and same archimedean ph. No assumption that the
near/far SUPPORTS are identical: IsNear depends explicitly on phe.
The q=0 definite case retains the native exact count; handle q>0 below.
All original admissibility, finite-dimensionality, summability,
integrability, trace, positivity and row-tie premises are retained.

Let K_U,K_0,K_1 be the real diagonal kernels, with integrals N,b0,b1
and pointwise nonnegativity from kernelB' frame expansion. Let
c_U=(prod d_v)*Re e_U(1), c_k=p_k*c_U by eT_one and common ph.
Let E_M=integral_M(K_0+K_1-P*K_U).
The identity term cancels exactly, even if the measures of the
moderate/deep regions are not known:
 E_M = integral_M Re sum_{gamma in GFset, gamma != 1}
    ph(x^-1 gamma x at infinity) *
      (e_0+e_1-P e_U)(x^-1 gamma x at finite places).
Justification: kern and phe definitions, absolute convergence of each
of the three series (native automorphicKernel_convergence_properties);
linearity of the finite linear combination of convergent sums and real
parts; identity coefficient real and equal to c_0+c_1-P*c_U=0.
No claim that the signed finite function is an admissible idempotent
or a positive definite kernel. Apply positivity only to original K_j.

Put J=integral_(M^c)(K_0+K_1), J_U=integral_(M^c)K_U>=0.
The exact signed trace identity is
 B-P*N = E_M+J-P*J_U.
The native DeepBound for just the two bad cylinders implies J<=s*B,
s=exp(-n^2*f)<=1/8 at the native threshold.
Consequently
 (1-s)*B <= P*N+E_M.
Thus the SINGLE signed moderate budget E_M<=P*N implies
 N-m <= B <= (16/7)*P*N <= 3*P*N.
This deletes the need for a separate full-cylinder rare-volume estimate
and full main-term lower bound IF the signed moderate budget can be
proved directly. More generally E_M<=x^a P*N with fixed a>=0 suffices
using the same exponential absorption as RUN29. No division by P or
by a bad main term, so zero shares are covered.

For exact preservation of existing premises: set r=exp(-nf log(n)/4),
s=exp(-n^2 f), I_U=integral_M(K_U-c_U), I_B=integral_M(K_0+K_1-P*c_U).
Original near/far bounds give |I_U|<=(r+s)Ds and
|I_B|<=(r+s)P*Ds. Since E_M=I_B-P*I_U, we have
E_M<=2(r+s)P*Ds. Original rare bound ONLY for full gives
N>= (1-2r-s)Ds >= Ds/2 as RUN29. For r,s<=1/8 this implies
E_M<=P*N. This establishes the original-to-replacement bridge, not
an independent proof of the signed budget without rare volume.
Also farModerate_of_farBound proves a stronger pointwise estimate:
farSum_j(x)<=s*c_j on M. Hence the absolute contribution of all three
signed FAR pieces is <= 2*s*P*c_U*mu(M), not 2*s*P*Ds. The identity
is excluded separately in each piece; near and far may depend on e_j.
If seeking cancellation across pieces, use a common distance-only
partition and include zero terms explicitly; never infer support inclusion
from the eT_one identity. RowsAut_idem_elementary only gives
|e_j(y)|<=Re e_j(1), not pointwise order between different e_j.
This isolates the real remaining near-field estimate without relying on
independent relative precision for all labels. No new near estimate obtained.

Original graph: TopShape -> LinkIrr -> irrC/cIc -> CountAllRows ->
three actual count calls -> full symmetric counting theorem -> hNear,hFar,
hRare,hDeep (with common finite/flag/pointwise/summability/trace machinery).
Replacement local graph: same record and row-count ties ->
identity cancellation + signed moderate budget + two bad deep bounds ->
relative bad count -> LinkIRR. h30 remains separately required.
Old and new graph records preserved. Not a kernel-exported graph; prior
native axiom evidence retained. No global removal of hRare or hDeep or
proof that other uses of CountAllRows are dispensable.
Context cache key=(pin, actual D7/A, I, sigma,w,d,mu_f,fund,R,g,b,p,q,
three actual e/Re and g0, fixed family eta and threshold). Backtrack to
RUN29/native full count if any actual caller/context replay fails.

## Executed scalar regression, local Python 3 (exact Fraction)
from fractions import Fraction as F
from itertools import product
cnt=old=0
for P,N,s,E,J,Jf in product([F(0),F(1,8),F(1,2),F(1),F(2)],[F(1),F(2),F(8)],[F(0),F(1,16),F(1,8)],map(F,[-1,0,1,2,4,8]),map(F,[0,1,2,4]),map(F,[0,1,2,4])):
 B=P*N+E+J-P*Jf
 if B>=0 and E<=P*N and J<=s*B:
  assert (1-s)*B<=2*P*N and B<=F(16,7)*P*N
  cnt+=1
for P,Ds,r,s in product([F(0),F(1,8),F(1,2),F(1),F(2)],map(F,[1,2,8]),[F(0),F(1,16),F(1,8)],[F(0),F(1,16),F(1,8)]):
 for I,J,H,Ib in product([-(r+s)*Ds,F(0),(r+s)*Ds],[F(0),s*Ds,Ds],[F(0),r*Ds],[-(r+s)*P*Ds,F(0),(r+s)*P*Ds]):
  N=Ds+I+J-H; E=Ib-P*I
  assert N>=Ds/2 and E<=P*N
  old+=1
# Without deep bound: P=1/8,N=8,E=0,J=8,Jf=0,B=9.
assert F(9)>F(16,7)*F(1,8)*8
# Without signed moderate bound: same P,N, E=8,J=Jf=0,B=9.
assert F(9)>F(16,7)*F(1,8)*8
# Different moderate domain volumes: identity-only kernels 1 and 1/8.
assert F(1,8)*2-F(1,8)*1!=0
print({'signed_checks':cnt,'old_to_new_checks':old,'negative_controls':3})
Actual: {'signed_checks': 513, 'old_to_new_checks': 7290, 'negative_controls': 3}.
These are scalar algebra regressions, NOT native automorphic computations.
Local command -v lean/lake returned no paths. GitHub API confirmed prior
CI runs 45577239749 (head 51e477a19fa61c46b1cbe998ef6bf6fa8a397b6f)
and 45576756833 (head 0619653b93630fb9f01b5849647326041ec611cc)
completed success; neither tests this file. No new native PASS.
Independent mathematical audit and native caller replay requested.
No URT experiment or speed claim; no claimed RH theorem imported.

RESUME HERE: reconstruct the actual NearMod.nearModerate supplier and
derive a direct signed near budget on the common domain, exploiting the
far pointwise bound above. Need E_M<=P*N (or polynomial slack) without
using full rare estimate if possible. Check e-adm supports carefully;
no assumed projector domination. Kernel lane compile scalar certificate,
then implement common-host integral and actual LinkIRR bridge.
Preserve original h30 and other uses. HANDOFF TO math, kernel, audit,
integration/editor. Canonical G(x) <= x^(1/2+9 eps) still OPEN.
-/

namespace RHTheta30

theorem signed_compare (N B P E J JU s : ℝ)
    (hP : 0 ≤ P) (hJU : 0 ≤ JU)
    (he : B-P*N = E+J-P*JU) (hj : J ≤ s*B) :
    (1-s)*B ≤ P*N+E := by
  have hp : 0 ≤ P*JU := mul_nonneg hP hJU
  linarith

theorem signed_deficit (N m B P E J JU s : ℝ)
    (hP : 0 ≤ P) (hB : 0 ≤ B) (hJU : 0 ≤ JU)
    (hs : s ≤ 1/8) (he : B-P*N = E+J-P*JU)
    (hj : J ≤ s*B) (hE : E ≤ P*N) (hm : N-m ≤ B) :
    N-m ≤ (16/7)*P*N := by
  have h1 := signed_compare N B P E J JU s hP hJU he hj
  have h2 := mul_le_mul_of_nonneg_right (show (7/8 : ℝ) ≤ 1-s by linarith) hB
  linarith

theorem original_to_signed (N Ds P I Ib J H E r s : ℝ)
    (hDs : 0 ≤ Ds) (hP : 0 ≤ P)
    (hr : r ≤ 1/8) (hs : s ≤ 1/8)
    (hN : N = Ds+I+J-H) (hE : E = Ib-P*I)
    (hi : -(r+s)*Ds ≤ I) (hib : Ib ≤ (r+s)*P*Ds)
    (hj : 0 ≤ J) (hh : H ≤ r*Ds) :
    E ≤ P*N := by
  have hcoef : (1/2 : ℝ) ≤ 1-2*r-s := by linarith
  have h1 := mul_le_mul_of_nonneg_right hcoef hDs
  have h2 : Ds/2 ≤ N := by linarith
  have h3 := mul_le_mul_of_nonneg_left hi hP
  have h4 : E ≤ 2*(r+s)*P*Ds := by linarith [show P*(-(r+s)*Ds) = -(r+s)*P*Ds by ring]
  have h5 := mul_le_mul_of_nonneg_right
    (show 2*(r+s) ≤ (1/2 : ℝ) by linarith) (mul_nonneg hP hDs)
  have h6 := mul_le_mul_of_nonneg_left h2 hP
  calc E ≤ 2*(r+s)*P*Ds := h4
    _ ≤ P*N := by nlinarith only [h5,h6]

theorem replay_compare (N B P E J JU s : ℝ)
    (hP : 0 ≤ P) (hJU : 0 ≤ JU)
    (he : B-P*N = E+J-P*JU) (hj : J ≤ s*B) :
    (1-s)*B ≤ P*N+E := by
  first | (rh_reduce 2 using [signed_compare]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact signed_compare N B P E J JU s hP hJU he hj

end RHTheta30

rh_scan GlobalTheory.CountSum.countingTheorem_of_finite_of_bounds limit 2000
rh_scan GlobalTheory.Deep.farModerate_of_farBound limit 2000
rh_scan Formalism.MainNotions.N.CylinderCountFamily.badAt_le limit 2000
rh_scan RHTheta30.signed_deficit limit 2000
rh_prune GlobalTheory.abs_integral_sub_const_mul_le_of_split as RHTheta30OriginalSplitPruned
rh_prune RHTheta30.signed_compare as RHTheta30ComparePruned
rh_prune RHTheta30.original_to_signed as RHTheta30OriginalBridgePruned
#print axioms GlobalTheory.CountSum.countingTheorem_of_finite_of_bounds
#print axioms GlobalTheory.Deep.farModerate_of_farBound
#print axioms RHTheta30.signed_compare
#print axioms RHTheta30.signed_deficit
#print axioms RHTheta30.original_to_signed
#print axioms RHTheta30.replay_compare
