import RUN35_RANK_ONLY_VOLUME_CALLER
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.ExistsFrameOfHasSignature
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.HermitianVolumeDependsOnlyOnFieldSignatureStatement

/-!
RUN36, lane 8, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT compiled.
RH OPEN. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Mission latest blob e536e5e30aa458a90343b65c87cbe105f2485abb (external graph
accelerator plus unified same-host directive). Read SWARM, HANDOFF,
EXPANSION, AGENTS, continuity and live proof in part; peer 0810c534 joint
loss, 04a29a86 Companion signature route and 29c54b4f analytic endpoint
read. Latest commit list inspected, not exhaustive. No external graph
ingestion duplicated. Prior RUN35 97a3d5345fb36275732f941766fff92132169f20
blob bcaeec5cd5c3e4bdb628f52d736d2afead6f1326.

Actual native construction: AutInhab.ofSignature I.cm P Q is NOT a
hypothetical host. Its explicit diagonal sign matrix and coordinate integral
lattice are Hermitian, nonsingular, full and self-dual (intLat_dual);
ofFrames uses identity archimedean frames and constructs the native
congruence topology. ofSignature_spec gives all-place signature (P,Q).
Its E and star instance are definitionally the original ones, so SameField
uses RingEquiv.refl. This settles the existence part of RankOnlyStep35 at
human/source level, even for any signature over I.cm.

The existing native VolumeInvariant is stronger than just isometry of a
matrix: its proof constructs the rational semilinear isometry, self-dual
finite adelic lattice point and gauge-volume transport. In particular,
apply it with I=I' to remove all dependence of gaugeVol on the choice of
finite Haar measure and gauge on ONE host. It also identifies any host
of signature (P,Q) with the explicit diagonal one over I.cm.
Thus select one legitimate gauge/Haar witness w for every diagonal host.
Let C_I(P,Q) = gaugeVol(diag(I.cm,P,Q),w).
The ONLY additional scalar identity needed for RankOnlyStep35 is
    C_I(P,Q) = C_I(P-1,Q)*rankFac(I.E,P+Q)   (P>=1),
or its Q decrement, for P+Q>=3.
The reverse implication also holds using rankOnlyStep35 and VolumeInvariant.
No division by a mass, no assumption of finite/positive gaugeVol, no
extra normalization factor. This eliminates construction of the rank
witness and the independent all-measure quantification from the missing
premise: use one canonical numerical value per field+signature, not an
arbitrary new Haar normalization. The scalar recurrence remains OPEN.
No claim of cross-signature volume equality: native VolumeInvariant
compares SAME signature only. In particular even an abstract scalar
system C(P,Q)=1 with rankFac=2 obeys same-signature invariance and fails
the recurrence. This is a logical counterexample to dropping the
recurrence, not a native volume computation.

Original source-visible graph:
countingTheorem_of_volumeStep -> VolumeStep -> lower rank host + all
Haar/gauge pairs + orthogonal witnesses; native VolRatio.step and
volumeRatio_of_volumeStep -> VolumeInvariant.
Candidate:
countingTheorem_of_rankOnly35 -> RankOnlyStep35 -> CanonicalRank36
 + AutInhab.ofSignature_spec + VolumeInvariant + existing measure existence.
Both original and prior RUN35 fallback retained; no elaborated graph
deletion or new axiom evidence. Context key includes source and toolchain
pins, I.cm, E and star, P,Q, decrement, fixed witness choice and actual
consumer. Do not identify different fields or signatures by rank alone.
For arithmetic, row, entropy and local gain keep all prior premises.

Pinned source ledger, all under src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/:
ExistsFrameOfHasSignature.lean 13982fe910bfc0dec0938e4ed6cdb20e01ad3821
HermitianVolumeDependsOnlyOnFieldSignature.lean aa84c8b2948c99ef4eeeb99119faa848be8d3097
HermVolumeRatioSameKindOfVolumeRatioInduction.lean cac12fba955e10e2eb7ccc24b94bfe053987a9e7
RiemannianHaarGaugeExistsPosUniqueStatement.lean 4d6d1caa50c5acd1a81f5e49d29ec0766ac8b766
HermitianVolumeDependsOnlyOnFieldSignatureStatement.lean 081bd280e868fd86f698ebb98b15a37af5939b5f
Definitions/SemilocalFrames/DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810 (gaugeVol).
Statements/CuspFrameWeights/SameKindIsometric.lean c7c7a598be6489574fb7e2ccaad87cb68d1f92dd.
24 fail-on-error source hash/anchor checks executed in connector V8, not Lean.
Local command -v lean and lake returned no path. CI status.json actually
fetched for 45577239749 and 45576756833, returncode 0; earlier engines and
conditional half-strip only, not this file. No new CI run, no queue claim.
No new root-level obligation closed or URT advantage claimed.

RESUME HERE: supply canonical rank scalar by actual rank-one mass formula
for the diagonal definite pair, plus an independently justified native
transport across signatures (not same-signature VolumeInvariant alone).
Coordinate with geometry's Kottwitz / Companion route and derive exact
AutInst gaugeVol vs native D.vol normalization; keep its host and lattice
fixed. Batch RUN34–36 in existing pinned host-module runner, inspect
actual compiler, original bridge, constructor-inclusive scans and axioms.
Backtrack to native VolumeStep if replay fails.
HANDOFF TO geometry, literature, kernel extractor, integration, audit.
-/

open MeasureTheory NumberField Matrix Finset Formalism.MainNotions.S GlobalTheory.Count GlobalTheory.FlagMeas
noncomputable section
namespace GlobalTheory.FlagMeas.VolRatio

def canonical36 (I : AutInst) (p q : ℕ) : AutInst :=
  GlobalTheory.AutInhab.ofSignature I.cm p q

theorem canonical_same36 (I : AutInst) (p q : ℕ) :
    SameField I (canonical36 I p q) :=
  ⟨RingEquiv.refl _, fun _ => rfl⟩

theorem canonical_sig36 (I : AutInst) (p q : ℕ) :
    HasSig (canonical36 I p q) p q :=
  (GlobalTheory.AutInhab.ofSignature_spec I.cm p q).2

structure GaugeWitness36 (I : AutInst) where
  c : InfinitePlace I.F → ℝ
  mu : Measure I.Gf
  sf : SigmaFinite mu
  haar : mu.IsHaarMeasure
  good : IsGaugeAll I c

def GaugeWitness36.value {I : AutInst} (w : GaugeWitness36 I) : ENNReal :=
  @gaugeVol I w.c w.mu w.sf

def witness36 (I : AutInst) : GaugeWitness36 I := Classical.choice (by
  obtain ⟨mu, hH, hS⟩ := GlobalTheory.CongTop.exists_haar_sigmaFinite I
  choose c hc using fun v : InfinitePlace I.F =>
    GlobalTheory.T.riemannianHaarGauge_exists_pos_unique I.n (I.ε v)
  exact ⟨⟨c, mu, hS, hH, fun v => (hc v).2.1⟩⟩)

def C36 (I : AutInst) (p q : ℕ) : ENNReal :=
  (witness36 (canonical36 I p q)).value

theorem gauge_eq_value36 (hInv : VolumeInvariant) (I J : AutInst)
    (p q : ℕ) (hIJ : SameField I J) (hi : HasSig I p q)
    (hj : HasSig J p q) (c : InfinitePlace I.F → ℝ)
    (mu : Measure I.Gf) [SigmaFinite mu] [mu.IsHaarMeasure]
    (hc : IsGaugeAll I c) (w : GaugeWitness36 J) :
    gaugeVol I c mu = w.value := by
  letI : SigmaFinite w.mu := w.sf
  letI : w.mu.IsHaarMeasure := w.haar
  exact hInv I J p q hIJ hi hj c mu w.c w.mu hc w.good

theorem gauge_eq_canonical36 (hInv : VolumeInvariant) (I : AutInst)
    (p q : ℕ) (hi : HasSig I p q) (c : InfinitePlace I.F → ℝ)
    (mu : Measure I.Gf) [SigmaFinite mu] [mu.IsHaarMeasure]
    (hc : IsGaugeAll I c) :
    gaugeVol I c mu = C36 I p q :=
  gauge_eq_value36 hInv I (canonical36 I p q) p q
    (canonical_same36 I p q) hi (canonical_sig36 I p q) c mu hc _

def CanonicalRank36 : Prop :=
  ∀ (I : AutInst) (p q : ℕ), 3 ≤ p + q → ∀ s : Bool,
    (if s then 1 ≤ p else 1 ≤ q) →
      C36 I p q =
        C36 I (if s then p - 1 else p) (if s then q else q - 1) *
          ENNReal.ofReal (rankFac I.E (p + q))

theorem rankOnly_of_canonical36 (hInv : VolumeInvariant)
    (hC : CanonicalRank36) : RankOnlyStep35 := by
  intro I p q hi hn s hs
  let a := if s then p - 1 else p
  let b := if s then q else q - 1
  refine ⟨canonical36 I a b, canonical_same36 I a b, canonical_sig36 I a b, ?_⟩
  intro c mu _ _ c' mu' _ _ hc hc'
  have h1 := gauge_eq_canonical36 hInv I p q hi c mu hc
  have h2 : gaugeVol (canonical36 I a b) c' mu' = C36 I a b := by
    exact gauge_eq_value36 hInv _ _ a b
      ⟨RingEquiv.refl _, fun _ => rfl⟩ (canonical_sig36 I a b)
      (canonical_sig36 I a b) c' mu' hc' _
  rw [h1, h2]
  exact hC I p q hn s hs

theorem canonical_of_rankOnly36 (hInv : VolumeInvariant)
    (hR : RankOnlyStep35) : CanonicalRank36 := by
  intro I p q hn s hs
  let a := if s then p - 1 else p
  let b := if s then q else q - 1
  let A := canonical36 I p q
  let B := canonical36 I a b
  obtain ⟨J, hAJ, hj, hstep⟩ := hR A p q (canonical_sig36 I p q) hn s hs
  let wA := witness36 A
  let wJ := witness36 J
  let wB := witness36 B
  letI : SigmaFinite wA.mu := wA.sf
  letI : wA.mu.IsHaarMeasure := wA.haar
  letI : SigmaFinite wJ.mu := wJ.sf
  letI : wJ.mu.IsHaarMeasure := wJ.haar
  have hJB : SameField J B :=
    sameField_trans (sameField_symm hAJ)
      (sameField_trans (sameField_symm (canonical_same36 I p q))
        (canonical_same36 I a b))
  have h1 := hstep wA.c wA.mu wJ.c wJ.mu wA.good wJ.good
  have h2 := gauge_eq_value36 hInv J B a b hJB hj
    (canonical_sig36 I a b) wJ.c wJ.mu wJ.good wB
  change wA.value = wB.value * ENNReal.ofReal (rankFac I.E (p + q))
  change wA.value = gaugeVol J wJ.c wJ.mu * ENNReal.ofReal (rankFac I.E (p + q)) at h1
  exact h1.trans (congrArg (fun v => v * ENNReal.ofReal (rankFac I.E (p + q))) h2)

theorem canonical_rank_equiv36 (hInv : VolumeInvariant) :
    CanonicalRank36 ↔ RankOnlyStep35 :=
  ⟨rankOnly_of_canonical36 hInv, canonical_of_rankOnly36 hInv⟩

theorem canonical_original_bridge36 (h : VolumeStep) : CanonicalRank36 := by
  first
  | (rh_reduce 2 using [canonical_of_rankOnly36, rankOnlyStep35_of_volumeStep]; done)
  | (rh_auto_frontier 2; done)
  | exact canonical_of_rankOnly36 GlobalTheory.T.hermitian_volume_depends_only_on_field_signature
      (rankOnlyStep35_of_volumeStep h)

end GlobalTheory.FlagMeas.VolRatio

namespace GlobalTheory.CountFinal
theorem countingTheorem_of_canonical36
    (h : GlobalTheory.FlagMeas.VolRatio.CanonicalRank36) :
    GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  have hI := GlobalTheory.T.hermitian_volume_depends_only_on_field_signature
  have hR := GlobalTheory.FlagMeas.VolRatio.rankOnly_of_canonical36 hI h
  first
  | (rh_auto 2; done)
  | exact countingTheorem_of_rankOnly35 hR hI
end GlobalTheory.CountFinal

rh_scan GlobalTheory.VolInvariant.volumeInvariant limit 2000
rh_scan GlobalTheory.FlagMeas.VolRatio.rankOnly_of_canonical36 limit 2000
rh_prune GlobalTheory.FlagMeas.VolRatio.rankOnly_of_canonical36 as RHTheta36RankPruned
rh_scan GlobalTheory.CountFinal.countingTheorem_of_canonical36 limit 2000
rh_scan GlobalTheory.FlagMeas.VolRatio.canonical_original_bridge36 limit 2000
#print axioms GlobalTheory.FlagMeas.VolRatio.canonical_same36
#print axioms GlobalTheory.FlagMeas.VolRatio.canonical_sig36
#print axioms GlobalTheory.FlagMeas.VolRatio.witness36
#print axioms GlobalTheory.FlagMeas.VolRatio.gauge_eq_canonical36
#print axioms GlobalTheory.FlagMeas.VolRatio.rankOnly_of_canonical36
#print axioms GlobalTheory.FlagMeas.VolRatio.canonical_of_rankOnly36
#print axioms GlobalTheory.FlagMeas.VolRatio.canonical_original_bridge36
#print axioms GlobalTheory.CountFinal.countingTheorem_of_canonical36
