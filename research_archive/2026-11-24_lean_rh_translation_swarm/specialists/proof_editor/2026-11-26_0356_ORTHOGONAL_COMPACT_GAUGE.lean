import Formalism.LocalToGlobal.SiegelLatticeTheory.FlagStabilizerTensors.RootLatticeThresholds.DstarVolPf
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.ExistsLimitOfChart
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.LeftQuotientCovolumeEqFundamentalDomainInter
import Development.AbelianVarietyTheory.Definitions.SemilocalFrames.IsGaugeAll
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN46, 26 Nov 2026. HUMAN SOURCE-MATCHED / exact archimedean
calibration; native consumer certificate PREPARED, NOT COMPILED.
RH OPEN. No imported RH theorem.

Read mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine, AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/runner
openings and living proof; prior editor c5fe320e40fb2888fa4187154ce97c20942fa873.
Latest theta d7f428d44df5174a0fb589c0ca3dc935dbea59eb (right Haar split)
and integration 5744b095fadaeae78f7e4178968e64b4b4ddd001 (rank slices);
audit e3f9d949 (torsion), literature 3bdeddd5, Galois 425c27c5,
math 59085d33, and remaining recent peer commit summaries consulted.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream latest commit observed 2d7383073083bbe017d948ce95c554dc57167075
(26 Nov, module-system merge); no migration or semantic equivalence claim.

NEW EDITOR BLOCK: prove the outstanding RUN45 S*B=C calibration
using a single orthogonal-complexification argument instead of
pair-by-pair tangent determinants. Work at the actual X.B.I frame.
Write J=diag(+-1), V={X:X*J+JX=0}, with the ambient Frobenius
Euclidean structure Re tr(X*Y). The map X -> JX is an isometry
onto the skew-Hermitian matrices, since J*=J=J^-1. In particular
for X,Y in V, tr(X*Y) is REAL: let A=JX and B=JY; then
tr(X*Y)=tr(A*B)=-tr(AB), and conjugating the latter gives
-tr(BA)=-tr(AB). Consequently V is real-orthogonal to iV.
The map V x V -> M_n(C), (X,Y) -> X+iY, is a real Euclidean
isometry. It is onto by the native cplx_bijective/reImMap_surjective
(or directly split a matrix into its +/- eigenspaces of the real
involution Z -> -J Z* J). This is stronger than determinant matching.

Hence Euclidean Lebesgue on V satisfies native IsOmegaLeb:
the product pushes to standard complex coordinate Lebesgue.
The native isOmegaLeb_unique gives equality with its chosen lam.
No signature-dependent factor, no choice of nonorthogonal basis,
no group isomorphism X -> JX is claimed. Matrix reindex by a
permutation is also a Euclidean isometry. This deals equally with
the UpqT and UJ Lie algebras at the actual native frame.

Let B_n=volU(n), positive. Normalize the smooth left-invariant
Haar density nu on U(p,q) by its value at identity equal to the
induced Euclidean volume on V. In exponential coordinates it is
a smooth positive density with value 1 at 0. For any shrinking
norm-ball its average density tends to 1, by continuity, and
exp is a diffeomorphism locally (native exp chart). Thus the
OmegaDensity of nu is 1 for the source's entry-sum ballU, not
only for the Frobenius ball. Conversely a Haar measure with
OmegaDensity c has this density multiplied by c (Haar uniqueness
or comparison in that same chart). This justifies shape-independence
rather than identifying the two different balls.

The total compact Haar mass of nu on U(n) is B_n: the first-column
quotient U(n)/U(n-1) has horizontal metric t^2+2||z||^2 versus
round t^2+||z||^2, so its volume multiplier is
2^(n-1) * 2*pi^n/(n-1)!; multiply with B_0=1. This matches
DefClassNum.volU and native volU_succ_eq_mul (7ab7981637d6ed6f39e65cea95e69571c851300c),
as proved in prior editor 1756. The compact probability measure
therefore has OmegaDensity 1/B_n. By CDHaar.trick, its value is
exactly the same for the native indefinite CDHaar.cd measure.

Now use the ACTUAL cdScaleTie D, not a new Haar witness.
ZsCovInf.measAt with conjugating element 1 transports that
measure via the permutation reindex phi to
s_v * muG(I.eps v), with s_v=D.s.cdScale I.n (I.eps v).
The native rank and signature transport in DstarVolPf.cdScale_epsV
identifies s_v with the constant s used by DstarVolV on
X.B.I=InstExistsPf.instOf D (equivalently use X.eps_eq and the
rank cast). Frobenius norm is unchanged by that permutation.

Let E_r={g: sqrt(hs(uMat g-1))<=r}. Native sqrt_hs identifies
the Frobenius norm exactly, and exp X=1+X+o(||X||) at 0.
For any kappa>1, for all sufficiently small r>0 the chart images
of balls of radii r/kappa and kappa*r sandwich E_r. This uses
the local inverse chart to exclude other components near 1.
The source exists_limit_of_chart proves precisely these inclusions.
The induced Euclidean unit ball has volume b_n, and scaling by
r multiplies its volume by r^(n^2) (native finrank_lieJ).
Squeeze and let kappa decrease to 1. The result, including the
normalization VALUE rather than just existence of a limit, is
    lim_{r->0+} s * muG(I.eps v)(E_r)/r^(n^2) = b_n/B_n.
In this equation the finite Haar values are read as reals; for
sufficiently small balls the measure is finite in the compact
chart. Therefore s*B_n satisfies native IsGauge. Its source
exists_unique_isGauge makes c_v=s*B_n for EVERY actual gauge
witness c_v. Multiplying before any norms/logarithms proves
    C = S * volU(I.n)^(#InfinitePlace I.F).
This is the precise local/global calibration from prior RUN45.
Since I.F is totally real in the native CM host, its number
of infinite places is [I.F:Q]=I.f=D.R.f (native RowDictPf.f_eq).
At the actual row rank, B=volU(I.n)^D.R.f. Retain these exact
rank/place identities in any further substitution; the Lean
adapter uses the actual cardinality, not a guessed field degree.

Combine the above with the previous same-fundamental-domain
identity and native DstarVolV:
    gaugeVol.toReal = volU(I.n)^(#InfinitePlace I.F) * volY0 D.
Thus the archimedean part of the signed normalization budget
is exactly zero in the human derivation. No separate uncertainty
factor S*B/C remains. The remaining required supplier is the
gauge endpoint mass G=B*M or its signed interval. This is NOT
a proof of that finite/global mass identity, nor an independent
Lean verification of the shape-independence argument. The adapter
explicitly keeps the calibrated local limit as a premise to be
formalized; it does not disguise it as native-proved.

Source ledger (src/; 39 blob/token assertions on 11 actual files
executed in connector V8, all matched):
Formalism/LocalRingCardinality/DataCD.lean 449d5479b4d8ec9baeaebd3459f95232094ae222
Formalism/LocalRingCardinality/DataTies.lean 66a258029b411af7aac5cc1a01aea2334152d97a
Development/AbelianVarietyTheory/Proofs/FoundationProofs/
 NonemptyCompactDualHaar.lean 6e208a716c68a908695eaabb59867bf2c01836af
 ReImMapSurjective.lean 470e26e8ee118e65cf962eb52b9729e7bcd8792e
Development/AbelianVarietyTheory/Proofs/HeightProofs/
 HaarUpqEqOfOmegaDensity.lean 7ba8c7d73a7e88a79c2d5587b7f39b5b6c9de7aa
Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 ExistsLimitOfChart.lean 292c8fd5816eac7503c45c9b2a422b4c0bac2587
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
 LayerProd.lean 2a92b374b78661403dde107fa5a46ad5c4f92108
 DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/
 RootLatticeThresholds/RowDictPf.lean 36ba24d4b9003ec478394baf7f659dbe9fb5d2fb
 RootLatticeThresholds/DstarVolPf.lean ae7cc5313e20392b9db6cbc8e518be5af1f5be21
Formalism/LocalToGlobal/SiegelLatticeTheory/CasimirVolumeRatios/
 VolumeClassRepresentatives/ZsCovInf.lean 3e658a8152531d8166be1bbe275c5a8b03e5868e

Original graph retained:
DstarVol -> DstarVolV -> covol_gen -> VolMeasOf -> cdScaleTie;
gaugeVol -> IsGaugeAll/exists_unique_isGauge -> exists_limit_of_chart;
signed family budget -> two normalization defects.
Candidate graph:
same row + reindex + orthogonal complexification + compact probability
-> calibrated local limit -> exists_unique_isGauge -> gauge_product46
-> gauge_row46 -> single gauge mass defect -> signed global sources.
Cache by pin/toolchain, actual D, X, I equality, finite Haar/fund,
c, cd, signature reindex and rank/place identities, exact caller.
Do not merge distinct hosts or independently chosen measures.
Retain original/type/value/constructor/axiom evidence and all pending
nodes. Backtrack to prior endpoint_defect if chart replay fails.

Local command -v lean/lake found neither. Actual baseline status.json
records reread on cathedral-research-state:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc, and
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717 returncode 0.
First includes reduced_strip_root conditional adapter; second 2000
visited, 324 pending, three classical axioms. These are baseline
only. No new Lean replay or axiom output, no new CI dispatch, no
root-level obligation retired. No URT comparison warranted.

RESUME HERE: kernel lane stage RUN45 and this file using existing
pinned engines; formalize the Euclidean complexification and calibrated
limit by adapting exists_limit_of_chart with the chosen IsOmegaLeb
rather than an arbitrary addHaar, and verify gauge_row46. Theta lane
use this SAME actual gauge endpoint for the local product test of
d7f428d4 (no second host or second real density convention).
Then obtain the remaining gauge mass comparison via determinant
split and definite class-representative formula, and propagate it
to RUN44 signed global source adapter. Integration: insert the short
calibration block into the living proof after independent audit.
All remaining same-host arithmetic/CountI/II/V/Vs, TopG/Green,
J/VWinAt(1,401), and prime-window obligations remain open.
HANDOFF TO theta, geometry, kernel, audit, integration.
-/

noncomputable section
open MeasureTheory NumberField Matrix Filter Topology
open Formalism.BasicNotions Formalism.MainNotions.S
open Formalism.MainNotions.StandardLattice Formalism.L2.SG.HidaSetting
open GlobalTheory.Count GlobalTheory.FlagMeas
open scoped ENNReal

namespace RHEditorGauge46

theorem sign_mul_skew {n : ℕ} (eps : Fin n → Bool)
    (X : Matrix (Fin n) (Fin n) ℂ) :
    Xᴴ * Formalism.REAL.Jm eps + Formalism.REAL.Jm eps * X = 0 ↔
    (Formalism.REAL.Jm eps * X)ᴴ + Formalism.REAL.Jm eps * X = 0 := by
  rw [Matrix.conjTranspose_mul, Formalism.REAL.Jm_conjTranspose]

def CalibratedLimit {n : ℕ} (eps : Fin n → Bool) (s B : ℝ) : Prop :=
  Tendsto
    (fun r : ℝ => s * (Formalism.REAL.muG eps
      {g | Real.sqrt (Formalism.REAL.hs (uMat g - 1)) ≤ r}).toReal / r ^ (n ^ 2))
    (nhdsWithin 0 (Set.Ioi 0))
    (nhds ((volume (Metric.ball (0 : EuclideanSpace ℝ (Fin (n ^ 2))) 1)).toReal / B))

theorem gauge_of_calibrated_limit {n : ℕ} (eps : Fin n → Bool)
    (s B c : ℝ) (hB : 0 < B) (hc : IsGauge eps c)
    (hlim : CalibratedLimit eps s B) : c = s * B := by
  unfold CalibratedLimit at hlim
  have h := hlim.const_mul B
  have hcancel : B *
      ((volume (Metric.ball (0 : EuclideanSpace ℝ (Fin (n ^ 2))) 1)).toReal / B) =
      (volume (Metric.ball (0 : EuclideanSpace ℝ (Fin (n ^ 2))) 1)).toReal := by
    field_simp
  rw [hcancel] at h
  have hs : IsGauge eps (s * B) := by
    unfold IsGauge
    convert h using 1 <;> try rfl
    ext r
    ring
  obtain ⟨a, _, _, ha⟩ := GlobalTheory.GaugeConst.exists_unique_isGauge n eps
  exact (ha c hc).trans (ha (s * B) hs).symm

theorem gauge_product46 (I : AutInst) (c : InfinitePlace I.F → ℝ) (s B : ℝ)
    (hB : 0 < B) (hc : IsGaugeAll I c)
    (hlim : ∀ v, CalibratedLimit (I.ε v) s B) :
    (∏ v, c v) = (∏ _v : InfinitePlace I.F, s) *
      B ^ Fintype.card (InfinitePlace I.F) := by
  classical
  have he : ∀ v, c v = s * B :=
    fun v => gauge_of_calibrated_limit (I.ε v) s B (c v) hB (hc v) (hlim v)
  simp_rw [he]
  rw [Finset.prod_mul_distrib, Finset.prod_const, Finset.card_univ]

theorem gauge_row46 {D : D7} (X : HidaSetting D)
    (hI : X.B.I = Formalism.L2.SG.InstExistsPf.instOf D)
    (hVol : VolTie D) (hcd : cdScaleTie D)
    (c : InfinitePlace X.B.I.F → ℝ) (hc : IsGaugeAll X.B.I c)
    (hB : 0 < volU X.B.I.n)
    (hlim : ∀ v, CalibratedLimit (X.B.I.ε v)
      (D.s.cdScale (2 * D.R.rS + D.R.k + 1) (epsSH D.R) : ℝ)
      (volU X.B.I.n)) :
    (gaugeVol X.B.I c X.B.μf).toReal =
      volY0 D * volU X.B.I.n ^ Fintype.card (InfinitePlace X.B.I.F) := by
  classical
  have hV : Formalism.L2.SG.Pf.RowDictPf.DstarVolV X := by
    first
    | (rh_reduce 2 using [Formalism.L2.SG.Pf.DstarVolPf.dstarVolV_of]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact Formalism.L2.SG.Pf.DstarVolPf.dstarVolV_of X hI hVol hcd
  have hp := gauge_product46 X.B.I c
    (D.s.cdScale (2 * D.R.rS + D.R.k + 1) (epsSH D.R) : ℝ)
    (volU X.B.I.n) hB hc hlim
  have hpos : 0 ≤ ∏ v, c v := by
    rw [hp]
    positivity
  have hcov := (GlobalTheory.CovolRat.covol_eq_inter_fund X.B.I X.B.μf X.B.fund
    Set.univ X.B.fund_spec MeasurableSet.univ (by intros; trivial)).1
  rw [Set.univ_inter] at hcov
  unfold Formalism.L2.SG.Pf.RowDictPf.DstarVolV at hV
  unfold gaugeVol
  rw [hcov, ENNReal.toReal_div, ENNReal.toReal_mul, ENNReal.toReal_ofReal hpos,
    hp, ← hV]
  unfold AutInst.vol
  ring

end RHEditorGauge46

rh_scan GlobalTheory.CompactDualUnique.isOmegaLeb_unique limit 2000
rh_scan GlobalTheory.GaugeConst.exists_unique_isGauge limit 2000
rh_scan Formalism.L2.SG.Pf.DstarVolPf.dstarVolV_of limit 2000
rh_scan RHEditorGauge46.gauge_row46 limit 2000
rh_prune RHEditorGauge46.gauge_row46 as RHEditorGauge46Pruned
#print axioms RHEditorGauge46.sign_mul_skew
#print axioms RHEditorGauge46.gauge_of_calibrated_limit
#print axioms RHEditorGauge46.gauge_row46
