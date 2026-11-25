import RUN36_CANONICAL_GAUGE_RANK
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.LeftQuotientCovolumeEqFundamentalDomainInterStatement
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.GaugeVolumeEqOfSemilinearIsometryGenus
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.IsotropicFlagProbabilityBoundOfVolumeRatio

/-!
RUN41, 25 November 2026, lane 8. Human derivation and PREPARED Lean
certificate; NOT COMPILED. RH OPEN.
Mission read first: f8b4b837301f8cf43d673be4979f04c4e4b415a4.
SWARM, HANDOFF, EXPANSION, AGENTS and research-state opening read.
Peer geometry RUN41 1c2ef505, editor efa4abe2, integration 700e3969,
audit a35ccf3d, Landau fc0d0ec6, prime c8cb579a, dependency 5adee016,
kernel a824904c, acceleration 619e11df consulted. Prior RUN40
f1f5fe710bc926a88430dbeeba35eef534c79209 retained.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; mathlib
0df444a360eaa60ab8c11dca51a86af692955474; Lean 4.33.1.
Peer reported upstream cache-layout revision 686902ae1da717a63faf52d2dc6a50e5722942cd;
not migrated or independently compared in this run.

RESULT: The native definition of gaugeVol is an infimum over measurable
orbit covers, not a priori a chosen fundamental-domain measure. Its
exact scalar normalization is already supported by native covol_smul.
Use this identity before any absolute value, finiteness argument or
division by a quotient volume. For the native same-host adjacent
canonical models write g=prod(c_v)/mu_f(K), C=gaugeVol and R=rankFac.
With a_n the Tamagawa-to-gauge multiplier of RUN40:

    covol(Gamma, (a_n*g) mu_A, univ) = a_n C.
    a_(n-1) = a_n R.
    a_n C_n = (a_n R) C_(n-1)  ==>  C_n = R C_(n-1).

Only the common multiplier is cancelled, and it is strictly positive
and finite. Cancellation is valid even for infinite extended-real
quotient volume. No value of the common torus covolume is needed.
The paired scaled-covolume equality is the remaining premise;
RUN40 gives its human Tamagawa argument subject to actual native
measure/quotient transport. Not asserting that transport is checked.

Independent native bridge: covol_eq_inter_fund already identifies
covol univ with mu_A(fund) for a native IsFundDom, without VolumeStep.
It also gives strict positivity of mu_A(fund). Consequently finite
gaugeVol directly implies finite fundamental-domain mass because
g is nonzero and finite. This bypasses the rank-two class-number
estimate at that particular finiteness consumer if finite calibrated
gauge is provided; no claim of eliminating it at other consumers.
No new existence theorem for a fundamental domain is assumed/proved.

Original source-visible graph retained:
CountTyped -> countingTheorem_of_volumeStep -> VolumeStep,
flagMeasureBound -> hR' -> hermVolumeRatioSameKind_of_volumeRatioInduction
and leftQuotientCovolume_eq_fundamentalDomain_inter;
flagMeasureBound -> unitary_adelic_quotient_volume_pos_lt_top ->
rank induction + rank-two class bound + covol_eq_inter_fund.
Candidate: paired native scaled covol equality -> canonical rank ->
RUN36 counting bridge. Separately finite gauge ->
native covol_eq_inter_fund -> finite fundamental-domain mass.
All original obligations remain recorded; no claim of globally
retired dependencies. Cache key: source hash, same CM field,
canonical p,q,s, actual witnesses c,mu, lattice K, quotient Gamma
and calibration convention. No cross-host cache reuse. Backtrack
to original VolumeStep if any native bridge or normalization fails.

Pinned source files inspected (28 hash/anchor checks, all matched):
DefClassNum 65f9efd688be555d6654d063ea6a782ea8799810
GlobAut 2103e49fe83fce42d4962f85acd9d4f6a589d645
GaugeVolumeEqOfSemilinearIsometryGenus d8e911ba588e91954a6b50bf044fd455e8715376
LeftQuotientCovolumeEqFundamentalDomainInter 81767f05db5d4d10576659201013df459adde451
IsotropicFlagProbabilityBoundOfVolumeRatio 852f33a0e868dbfe442b023c790793ca92b9a345
UnitaryAdelicQuotientVolumePosLtTop 0bd6bbc86f490d1d03308df4de8c9d9ac022a54c
FiniteAdelicUnitaryCongruenceTopology 3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba.
Native Lean unavailable locally. Baseline CI status JSON blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved, exit 0 for
45577239749 and 45576756833, respectively. These verify earlier
engine/root work ONLY, not this certificate. No new axiom output,
no new CI run/queue claim. Commands below prepared for existing
pinned runner; no URT comparison warranted for exact cancellation.

RESUME HERE: prove paired native scaled covol equality by transporting
RUN40's calibrated local rectangles and diagonal rational subgroup
to the two actual canonical native groups, checking same torus
Tamagawa volume and multiplier ratio. Replay RUN36 and RUN41 in
existing native runner, inspect scan/prune/axiom output and propagate
only checked substitutions to flagMeasureBound then TopG/Green.
Retain unresolved global weighted prime-window inequality.
HANDOFF TO: positivity geometry, editor, literature, integration,
kernel and audit. Preserve other lanes and original graphs.
-/

open MeasureTheory NumberField Finset Formalism.MainNotions.S
open GlobalTheory.Count GlobalTheory.FlagMeas
open scoped ENNReal

noncomputable section
namespace GlobalTheory.FlagMeas.VolRatio

def gaugeScale41 (I : AutInst) (c : InfinitePlace I.F → ℝ)
    (mu : Measure I.Gf) : ENNReal :=
  ENNReal.ofReal (∏ v, c v) / mu I.Kset

theorem gauge_as_scale41 (I : AutInst) (c : InfinitePlace I.F → ℝ)
    (mu : Measure I.Gf) [SigmaFinite mu] :
    gaugeVol I c mu = gaugeScale41 I c mu *
      covol I.GFset (I.muA mu) Set.univ := by
  unfold gaugeVol gaugeScale41
  simp only [div_eq_mul_inv]
  ac_rfl

theorem gaugeScale_guards41 (I : AutInst) (c : InfinitePlace I.F → ℝ)
    (mu : Measure I.Gf) [SigmaFinite mu] [mu.IsHaarMeasure]
    (hc : IsGaugeAll I c) :
    gaugeScale41 I c mu ≠ 0 ∧ gaugeScale41 I c mu ≠ ⊤ := by
  obtain ⟨-, -, -, hKc, hKo, ⟨Ks,hKs⟩, -⟩ :=
    GlobalTheory.CongTop.adelic_topology I
  have hK0 : mu I.Kset ≠ 0 :=
    (hKo.measure_pos mu ⟨1, by rw [← hKs]; exact Ks.one_mem⟩).ne'
  have hKt : mu I.Kset ≠ ⊤ := hKc.measure_lt_top.ne
  have hc0 : ENNReal.ofReal (∏ v, c v) ≠ 0 :=
    (ENNReal.ofReal_pos.2 (Finset.prod_pos fun v _ =>
      GlobalTheory.GaugeTransport.pos_of_isGauge (hc v))).ne'
  exact ⟨(ENNReal.div_pos hc0 hKt).ne',
    ENNReal.div_ne_top ENNReal.ofReal_ne_top hK0⟩

theorem scaled_covol_eq41 (I : AutInst) (c : InfinitePlace I.F → ℝ)
    (mu : Measure I.Gf) [SigmaFinite mu] [mu.IsHaarMeasure]
    (hc : IsGaugeAll I c) (a : ENNReal) (ha0 : a ≠ 0) (hat : a ≠ ⊤) :
    covol I.GFset ((a * gaugeScale41 I c mu) • I.muA mu) Set.univ =
      a * gaugeVol I c mu := by
  obtain ⟨hg0,hgt⟩ := gaugeScale_guards41 I c mu hc
  rw [GlobalTheory.GaugeTransport.covol_smul _ _ _
    (a * gaugeScale41 I c mu) (mul_ne_zero ha0 hg0)
    (ENNReal.mul_ne_top hat hgt), gauge_as_scale41, mul_assoc]

theorem cancel_common41 (a x y R : ENNReal) (ha0 : a ≠ 0)
    (hat : a ≠ ⊤) (he : a * x = (a * R) * y) : x = y * R := by
  have hc (z : ENNReal) : (a * z) / a = z := by
    simpa using (ENNReal.mul_div_mul_left z (1 : ENNReal) ha0 hat)
  calc
    x = (a * x) / a := (hc x).symm
    _ = (a * (y * R)) / a := by rw [he]; congr 1; ac_rfl
    _ = y * R := hc _

def scaledCovol41 {I : AutInst} (w : GaugeWitness36 I)
    (a : ENNReal) : ENNReal :=
  letI : SigmaFinite w.mu := w.sf
  covol I.GFset ((a * gaugeScale41 I w.c w.mu) • I.muA w.mu) Set.univ

theorem scaledCovol41_eq {I : AutInst} (w : GaugeWitness36 I)
    (a : ENNReal) (ha0 : a ≠ 0) (hat : a ≠ ⊤) :
    scaledCovol41 w a = a * w.value := by
  letI : SigmaFinite w.mu := w.sf
  letI : w.mu.IsHaarMeasure := w.haar
  exact scaled_covol_eq41 I w.c w.mu w.good a ha0 hat

def CanonicalTamagawaPair41 : Prop :=
  ∀ (I : AutInst) (p q : ℕ), 3 ≤ p + q → ∀ s : Bool,
    (if s then 1 ≤ p else 1 ≤ q) →
    ∃ a : ENNReal, a ≠ 0 ∧ a ≠ ⊤ ∧
      ENNReal.ofReal (rankFac I.E (p+q)) ≠ 0 ∧
      scaledCovol41 (witness36 (canonical36 I p q)) a =
      scaledCovol41 (witness36 (canonical36 I
        (if s then p-1 else p) (if s then q else q-1)))
        (a * ENNReal.ofReal (rankFac I.E (p+q)))

theorem canonical_of_pair41 (h : CanonicalTamagawaPair41) :
    CanonicalRank36 := by
  intro I p q hn s hs
  obtain ⟨a,ha0,hat,hR,he⟩ := h I p q hn s hs
  rw [scaledCovol41_eq _ _ ha0 hat, scaledCovol41_eq _ _
    (mul_ne_zero ha0 hR) (ENNReal.mul_ne_top hat ENNReal.ofReal_ne_top)] at he
  exact cancel_common41 _ _ _ _ ha0 hat he

theorem fund_gauge_eq41 (I : AutInst) (c : InfinitePlace I.F → ℝ)
    (mu : Measure I.Gf) [SigmaFinite mu] [mu.IsHaarMeasure]
    (fund : Set I.GA) (hf : I.IsFundDom (I.muA mu) fund) :
    gaugeVol I c mu = gaugeScale41 I c mu * I.muA mu fund := by
  have h := GlobalTheory.T.leftQuotientCovolume_eq_fundamentalDomain_inter
    I mu fund Set.univ hf MeasurableSet.univ (fun _ _ _ _ => Set.mem_univ _)
  rw [gauge_as_scale41, h.1, Set.univ_inter]

theorem fundDom_finite_of_gauge41 (I : AutInst)
    (c : InfinitePlace I.F → ℝ) (mu : Measure I.Gf)
    [SigmaFinite mu] [mu.IsHaarMeasure] (hc : IsGaugeAll I c)
    (fund : Set I.GA) (hf : I.IsFundDom (I.muA mu) fund)
    (hfin : gaugeVol I c mu < ⊤) : 0 < I.muA mu fund ∧ I.muA mu fund < ⊤ := by
  have h := GlobalTheory.T.leftQuotientCovolume_eq_fundamentalDomain_inter
    I mu fund Set.univ hf MeasurableSet.univ (fun _ _ _ _ => Set.mem_univ _)
  refine ⟨h.2, ?_⟩
  obtain ⟨hg0,_⟩ := gaugeScale_guards41 I c mu hc
  by_contra hn
  rw [not_lt, top_le_iff] at hn
  rw [fund_gauge_eq41 I c mu fund hf, hn, ENNReal.mul_top hg0] at hfin
  exact (lt_irrefl _ hfin)

end GlobalTheory.FlagMeas.VolRatio

namespace GlobalTheory.CountFinal
open GlobalTheory.FlagMeas.VolRatio
theorem countingTheorem_of_pair41 (h : CanonicalTamagawaPair41) :
    GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  have hc := canonical_of_pair41 h
  first
  | (rh_reduce 2 using [countingTheorem_of_canonical36]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countingTheorem_of_canonical36 hc
end GlobalTheory.CountFinal

rh_scan GlobalTheory.CovolRat.covol_eq_inter_fund limit 2000
rh_scan GlobalTheory.FlagMeas.Bound.flagMeasureBound limit 2000
rh_scan GlobalTheory.FlagMeas.fundDom_volume_pos_lt_top limit 2000
rh_prune GlobalTheory.FlagMeas.VolRatio.canonical_of_pair41 as thetaPair41Pruned
rh_scan GlobalTheory.CountFinal.countingTheorem_of_pair41 limit 2000
#print axioms GlobalTheory.CovolRat.covol_eq_inter_fund
#print axioms GlobalTheory.FlagMeas.VolRatio.canonical_of_pair41
#print axioms GlobalTheory.FlagMeas.VolRatio.fundDom_finite_of_gauge41
#print axioms GlobalTheory.CountFinal.countingTheorem_of_pair41

end
