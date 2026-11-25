import Formalism.LocalToGlobal.SiegelLatticeTheory.CasimirVolumeRatios.VolumeClassRepresentatives.CovolumeGaugeFrames
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Integration — one-sided mass normalization for the covolume consumer
25 Nov 2026. HUMAN SOURCE-MATCHED; executable native candidate PREPARED, NOT compiled. RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; both exact source paths under src/Formalism/LocalToGlobal/SiegelLatticeTheory/CasimirVolumeRatios/VolumeClassRepresentatives/:
ZsCovTie.lean ca453c965166209e71b82b0b1515730c31f50d9a; CovolumeGaugeFrames.lean d533d2a39ec6e26e2f86f079a60e79d71a33edfe.
Read mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc first, SWARM, AGENTS,
handoff queue, shared proof, research state/log/protocol, continuity and peer checkpoints.
Geometry 56f51000, audit d0ca7069, literature ec9819bb, math c0de628b, Galois a987e3f9,
theta 6821df81, structure 5de8466b, Landau 0b0399c1, prime 7b758b50, dependency
4510eb2b, kernel 5991ed4b, acceleration c11635a0, editor e627db49; earlier integration
e02666f2, direct rank 708a3eb7, standard model 8825cbd3, Tamagawa 95545ee1.

## Compact human proof insertion / integration handoff
At the actual covolume bound, let A be the sum of infinite-place fundamental-domain
measures, c = cdProd(fr), b = product of local gaugeU times volgU, and M = massI(D,V.rank).
The original proof gives c*A = ofReal(D.vol V) and c*ofReal(b)=1, with b>=0.
Therefore A = ofReal(D.vol V)*ofReal(b) <= ofReal(M*b) whenever D.vol V<=M.
The exact cancellation is before bounding; positivity of D.vol V implies M>=0.
The caller only consumes CovolSum (an upper bound), not equality. No constant changes.
Both native gauge and volume-ratio consumers can consequently take the one-sided
same-host bound at the actual framed V instead of VolSigIndep D and ClassItemsAt D V.rank.
The original premises imply the replacement by vol_eq_mass_of_indep. No converse asserted.
Do not conflate V with Y(0) except when the record actually identifies them.
In particular the exact mass endpoint used by sharp counts is not weakened by this result.

## Source-visible root connection and dependency overlay
TopPlug c51cb6b -> ShapeOf 236d0ead -> TopShape 3f791ca1 -> LinkAltAltBis e4a4c213
-> theoremS_transport_link_zero (LinkSPos 2d432770), with hInstR from Hyps 7e51220c.
CountT 06faf593 defines InstTie/PLevT' and instTie_of_record; hInstR supplies
VolSigIndep and ClassItemsAt there. The covolume frames consumer takes exactly
the corresponding existential frame package. This is a source-visible connection,
not authenticated elaborated root reachability of every downstream caller.
Original local graph (value edges plus typed package):
{"covolSum_of_tie":["VolTie","VolSigIndep","ClassItemsAt","vol_eq_mass_of_indep","isFund_image","gauge_normalization"],"covolume_gauge_of_frames":["covolSum_of_tie","BorelClassFinite","GaugeDens","MassRatioStd","VolUn"],"volRatio_of_tiesFr":["covolume_gauge_of_frames"]}
Reduced overlay (same context D,V,fr,P,Q,X):
{"rh_covolSum_of_volume_le":["VolTie","D.vol V <= massI D V.rank","isFund_image","gauge_normalization"],"rh_covolume_gauge_of_frames":["rh_covolSum_of_volume_le","BorelClassFinite","GaugeDens","MassRatioStd","VolUn"],"rh_volRatio_of_tiesFr":["rh_covolume_gauge_of_frames"],"rh_covolSum_original_bridge":["vol_eq_mass_of_indep","rh_covolSum_of_volume_le"]}
All other frame, rational point transport, Haar, lattice, and local normalization
premises unchanged. Source isFund_image also supplies the explicit rational-point
and measurable fundamental-domain transport relevant to the earlier Tamagawa handoff.
Original graph and all transitive axiom evidence retained, new native axiom audit pending.
Do NOT remove hInstR globally: PLevT' is a typed predicate used by h30 CountAllPointsClass;
all its actual consumers must first be replayed. No URT advantage claimed.

## Tests and failed routes
Executed 20 exact JS source/blob/transformation checks; all passed (including
absence of removed binder names and placeholder tokens in transformed code).
No local lean/lake on PATH; new certificate not compiled, no new CI result.
Retrieved CI status JSON: earlier strip-root run 45577239749 and proof-term-prune
run 45576756833 both status pass / returncode 0; those are baseline only.
General orchestrator run 45624892117 passed 13:55 UTC; not this certificate.
Rejected requiring equality in this covolume consumer: it only needs an upper bound.
Rejected deleting hInstR from the original typed predicate before downstream replay.
Earlier filename lookup returned 404; recovered actual path from previous commit.
Native scan/prune/reduction calls below are prepared for the pinned runner.

RESUME HERE: compile this file on pinned runner; inspect original/reduced axiom scans.
Trace actual h30 CountAllPointsClass producer to the volRatio_of_tiesFr caller, then
replace its InstTie predicate only with a proved compatibility bridge for every consumer.
Prove actual same-host mass bound via direct rank model or exact Tamagawa transport;
retain exact mass normalization for sharp-count route. Keep independent audit open.
HANDOFF TO geometry, kernel, editor and audit. No complete ten-page proof or RH claim.
-/

noncomputable section

open MeasureTheory NumberField Formalism.BasicNotions Formalism.BasicNotions.TH Formalism.MainNotions.S Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes Formalism.MainNotions.StandardLattice Formalism.L2.Theta
  Formalism.MainNotions.LeviCoordinates
open scoped ENNReal Pointwise

namespace Formalism.L2.S.S7.ZsCovTie

attribute [local instance] Formalism.BasicNotions.Host.cmStar

variable {D : D7} {V : HSp D} (fr : Formalism.IndefR.Eqv.UI.Frames D V)

theorem rh_covolSum_of_volume_le (X : Formalism.MainNotions.BridgeLemma.CData) (hX : X.I = Formalism.IndefR.Eqv.UI.instV fr)
    (hΛ : fr.Λ = Formalism.IndefR.Eqv.UI.Lv D V) {P Q : ℕ} (hV : V.SigOK) (hs : ∀ τ, V.sig τ = (P, Q))
    (hε : ∀ v, (Finset.univ.filter fun i => fr.ε v i = true).card = P)
    (hT : VolTie D) (hvm : D.vol V ≤ massI D V.rank)
    (hcd : cdScaleTie D) (hCG : ∀ v, Formalism.MainNotions.S.Gauge.CdGauge D V.rank (fr.ε v))
    (hVU : Formalism.MainNotions.S.Gauge.VolUn V.rank) :
    Formalism.MainNotions.FundamentalDomainUnfolding.CovolSum X (IwasawaCovolume.covolR X) := by
  have key : ∀ (ys : Finset (Formalism.IndefR.Eqv.UI.instV fr).Gf)
      (Dy : (Formalism.IndefR.Eqv.UI.instV fr).Gf → Set (Formalism.IndefR.Eqv.UI.instV fr).Ginf),
      Formalism.MainNotions.FundamentalDomainUnfolding.ClassReps (Formalism.IndefR.Eqv.UI.instV fr) ys →
      (∀ y ∈ ys, Formalism.MainNotions.FundamentalDomainUnfolding.IsFundInf (Formalism.IndefR.Eqv.UI.instV fr) y
        (Formalism.MainNotions.FundamentalDomainUnfolding.muInf (Formalism.IndefR.Eqv.UI.instV fr)) (Dy y)) →
      ∑ y ∈ ys, Formalism.MainNotions.FundamentalDomainUnfolding.muInf (Formalism.IndefR.Eqv.UI.instV fr) (Dy y) ≤
        ENNReal.ofReal ((Formalism.IndefR.Eqv.UI.instV fr).gaugeU *
          (IwasawaCovolume.volgU V.rank ^ Fintype.card (InfinitePlace D.host.F) * massI D V.rank)) := by
    intro ys Dy hys hD
    obtain ⟨g1, g2, g3⟩ := Formalism.IndefR.Eqv.gf_facts fr
    obtain ⟨k1, k2, k3, k4, k5⟩ := Formalism.IndefR.Eqv.ga_facts D V
    set ν : Measure (Formalism.IndefR.Eqv.UI.instV fr).Gf := Measure.haar with hν
    have hKc : IsCompact (Formalism.IndefR.Eqv.UI.instV fr).Kset := PI.WAU.Cpt.isCompact_Kset (Formalism.IndefR.Eqv.UI.instV fr)
    have hKo : IsOpen (Formalism.IndefR.Eqv.UI.instV fr).Kset := PI.WAU.kset_open (Formalism.IndefR.Eqv.UI.instV fr)
    have hk0 : ν (Formalism.IndefR.Eqv.UI.instV fr).Kset ≠ 0 := (hKo.measure_pos ν ⟨1, UnfoldingVolume.kone (Formalism.IndefR.Eqv.UI.instV fr)⟩).ne'
    have hkt : ν (Formalism.IndefR.Eqv.UI.instV fr).Kset ≠ ⊤ := hKc.measure_lt_top.ne
    set μf : Measure (Formalism.IndefR.Eqv.UI.instV fr).Gf := (ν (Formalism.IndefR.Eqv.UI.instV fr).Kset)⁻¹ • ν with hμfdef
    have hμf : μf.IsHaarMeasure :=
      Measure.IsHaarMeasure.smul _ (ENNReal.inv_ne_zero.mpr hkt) (ENNReal.inv_ne_top.mpr hk0)
    have hK1 : μf (Formalism.IndefR.Eqv.UI.instV fr).Kset = 1 := by
      rw [hμfdef, Measure.smul_apply, smul_eq_mul, ENNReal.inv_mul_cancel hk0 hkt]

    have hg : ∀ v, (D.s.cdScale V.rank (fr.ε v) : ℝ) * Formalism.MainNotions.S.Gauge.gaugeU (fr.ε v) *
        IwasawaCovolume.volgU V.rank = 1 := by
      intro v
      have h := hCG v
      unfold Formalism.MainNotions.S.Gauge.CdGauge at h
      rw [hVU, ← ZsCovSum.volgU_eq_Icc] at h
      exact h
    have hc0 : ∀ v, D.s.cdScale V.rank (fr.ε v) ≠ 0 := by
      intro v h0
      have h := hg v
      rw [h0] at h
      simp at h
    have hw := IwasawaCovolume.volgU_pos V.rank
    have hgpos : ∀ v, 0 < Formalism.MainNotions.S.Gauge.gaugeU (fr.ε v) := by
      intro v
      have h : ((D.s.cdScale V.rank (fr.ε v) : ℝ) * IwasawaCovolume.volgU V.rank) * Formalism.MainNotions.S.Gauge.gaugeU (fr.ε v) = 1 := by
        rw [← hg v]; ring
      exact pos_of_mul_pos_right (h ▸ one_pos) (mul_nonneg (D.s.cdScale V.rank (fr.ε v)).2 hw.le)

    have hn : P + Q = V.rank := by
      have := Formalism.BasicNotions.sig_sum V hV D.host.φ₀
      rw [hs] at this
      exact this
    choose e h1 h2 using fun v => ZsCovSum.blockEquiv (fr.ε v) (hε v) hn

    have hvol := ZsCovMeas.isVolMeas_muV fr hcd hΛ e h1 h2 hc0 μf hK1
    have hFD := UnfoldingVolume.fd_isFund (Formalism.IndefR.Eqv.UI.instV fr) μf ys hys Dy hD
    have hF := isFund_image fr hc0 μf (ZsCovSum.FD_meas (Formalism.IndefR.Eqv.UI.instV fr) ys Dy hD) hFD
    have htie : ZsCovMeas.muV fr μf (Formalism.IndefR.Eqv.UI.brg fr '' UnfoldingVolume.FD (Formalism.IndefR.Eqv.UI.instV fr) ys Dy) =
        ENNReal.ofReal (D.vol V) := ((hT V P Q hV hs).2 _ hvol).2 _ hF
    have hmu : ZsCovMeas.muV fr μf (Formalism.IndefR.Eqv.UI.brg fr '' UnfoldingVolume.FD (Formalism.IndefR.Eqv.UI.instV fr) ys Dy) =
        ZsCovMeas.cdProd fr * ∑ y ∈ ys, Formalism.MainNotions.FundamentalDomainUnfolding.muInf (Formalism.IndefR.Eqv.UI.instV fr) (Dy y) := by
      rw [ZsCovMeas.muV, Measure.smul_apply, smul_eq_mul]
      congr 1
      refine ((Formalism.IndefR.Eqv.UI.brg fr).toHomeomorph.toMeasurableEquiv.map_apply _).trans ?_
      refine (congrArg _ (Set.preimage_image_eq _ (Formalism.IndefR.Eqv.UI.brg fr).injective)).trans ?_
      rw [ZsCovSum.muA_FD (Formalism.IndefR.Eqv.UI.instV fr) μf ys hys Dy hD, hK1, one_mul]
    rw [hmu] at htie

    have hm0 : 0 ≤ massI D V.rank := le_trans (D.vol_pos V).le hvm
    have hG : (Formalism.IndefR.Eqv.UI.instV fr).gaugeU * IwasawaCovolume.volgU V.rank ^ Fintype.card (InfinitePlace D.host.F) =
        ∏ v : InfinitePlace D.host.F, (Formalism.MainNotions.S.Gauge.gaugeU (fr.ε v) * IwasawaCovolume.volgU V.rank) := by
      rw [Finset.prod_mul_distrib, Finset.prod_const, Finset.card_univ]
      rfl
    have hG0 : ∀ v : InfinitePlace D.host.F, 0 ≤ Formalism.MainNotions.S.Gauge.gaugeU (fr.ε v) * IwasawaCovolume.volgU V.rank :=
      fun v => (mul_pos (hgpos v) hw).le
    have hone : ZsCovMeas.cdProd fr * ENNReal.ofReal
        (∏ v : InfinitePlace D.host.F, (Formalism.MainNotions.S.Gauge.gaugeU (fr.ε v) * IwasawaCovolume.volgU V.rank)) = 1 := by
      rw [ENNReal.ofReal_prod_of_nonneg fun v _ => hG0 v, ZsCovMeas.cdProd, ← Finset.prod_mul_distrib]
      refine Finset.prod_eq_one fun v _ => ?_
      rw [← ENNReal.ofReal_coe_nnreal, ← ENNReal.ofReal_mul (NNReal.coe_nonneg _), ← mul_assoc, hg v,
        ENNReal.ofReal_one]
    calc ∑ y ∈ ys, Formalism.MainNotions.FundamentalDomainUnfolding.muInf (Formalism.IndefR.Eqv.UI.instV fr) (Dy y)
        = (ZsCovMeas.cdProd fr * ∑ y ∈ ys, Formalism.MainNotions.FundamentalDomainUnfolding.muInf (Formalism.IndefR.Eqv.UI.instV fr) (Dy y)) *
            ENNReal.ofReal (∏ v : InfinitePlace D.host.F,
              (Formalism.MainNotions.S.Gauge.gaugeU (fr.ε v) * IwasawaCovolume.volgU V.rank)) := by
          rw [mul_comm (ZsCovMeas.cdProd fr), mul_assoc, hone, mul_one]
      _ ≤ ENNReal.ofReal (massI D V.rank) * ENNReal.ofReal ((Formalism.IndefR.Eqv.UI.instV fr).gaugeU *
            IwasawaCovolume.volgU V.rank ^ Fintype.card (InfinitePlace D.host.F)) := by
          rw [htie, hG]
          exact mul_le_mul_right' (ENNReal.ofReal_le_ofReal hvm) _
      _ = ENNReal.ofReal ((Formalism.IndefR.Eqv.UI.instV fr).gaugeU * (IwasawaCovolume.volgU V.rank ^ Fintype.card (InfinitePlace D.host.F) *
            massI D V.rank)) := by
          rw [← ENNReal.ofReal_mul hm0]
          congr 1
          ring
  have gen : ∀ J : AutInst, J = Formalism.IndefR.Eqv.UI.instV fr → ∀ (ys : Finset J.Gf) (Dy : J.Gf → Set J.Ginf),
      Formalism.MainNotions.FundamentalDomainUnfolding.ClassReps J ys → (∀ y ∈ ys, Formalism.MainNotions.FundamentalDomainUnfolding.IsFundInf J y (Formalism.MainNotions.FundamentalDomainUnfolding.muInf J) (Dy y)) →
      ∑ y ∈ ys, Formalism.MainNotions.FundamentalDomainUnfolding.muInf J (Dy y) ≤ ENNReal.ofReal (J.gaugeU * (IwasawaCovolume.volgU J.n ^
        Fintype.card (InfinitePlace J.F) * Formalism.HermitianLatticesTheory.mass (Formalism.MainNotions.StandardLattice.stdForm J.E J.n) (Formalism.MainNotions.StandardLattice.stdLat J.E J.n))) := by
    rintro J rfl ys Dy hys hD
    exact key ys Dy hys hD
  unfold Formalism.MainNotions.FundamentalDomainUnfolding.CovolSum IwasawaCovolume.covolR
  exact gen X.I hX

theorem rh_covolSum_original_bridge (X : Formalism.MainNotions.BridgeLemma.CData) (hX : X.I = Formalism.IndefR.Eqv.UI.instV fr)
    (hΛ : fr.Λ = Formalism.IndefR.Eqv.UI.Lv D V) {P Q : ℕ} (hV : V.SigOK) (hs : ∀ τ, V.sig τ = (P, Q))
    (hε : ∀ v, (Finset.univ.filter fun i => fr.ε v i = true).card = P)
    (hT : VolTie D) (hI : Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.VolSigIndep D) (hC : Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.ClassItemsAt D V.rank)
    (hcd : cdScaleTie D) (hCG : ∀ v, Formalism.MainNotions.S.Gauge.CdGauge D V.rank (fr.ε v))
    (hVU : Formalism.MainNotions.S.Gauge.VolUn V.rank) :
    Formalism.MainNotions.FundamentalDomainUnfolding.CovolSum X (IwasawaCovolume.covolR X) := by
  have hvm := Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.vol_eq_mass_of_indep D V.rank hT hI hC V P Q hV hs rfl
  have hvle : D.vol V ≤ massI D V.rank := hvm.le
  first
  | (rh_reduce 3 using [rh_covolSum_of_volume_le]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact rh_covolSum_of_volume_le fr X hX hΛ hV hs hε hT hvle hcd hCG hVU

rh_scan covolSum_of_tie limit 2000
rh_scan rh_covolSum_of_volume_le limit 2000
rh_prune rh_covolSum_of_volume_le as RHIntegrationCovolPruned
#print axioms covolSum_of_tie
#print axioms rh_covolSum_of_volume_le
#print axioms rh_covolSum_original_bridge
end Formalism.L2.S.S7.ZsCovTie

noncomputable section

open NumberField Formalism.BasicNotions Formalism.BasicNotions.TH Formalism.MainNotions.S Formalism.MainNotions.BridgeLemma Formalism.MainNotions.StandardLattice

namespace Formalism.L2.S.S7.CovolumeGaugeFrames

attribute [local instance] Formalism.BasicNotions.Host.cmStar

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in

theorem rh_covolume_gauge_of_frames (hB : Formalism.L2.SG.LitS.BorelClassFinite)
    (hGD : ∀ (n : ℕ) (ε : Fin n → Bool), Gauge.GaugeDens ε) (hMR : Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.MassRatioStd)
    (hVU : ∀ n, Gauge.VolUn n) :
    ∀ (X : CData) (n₀ : ℕ) (A C cb : ℝ), 8 ≤ n₀ → X.HypC n₀ A C cb →
      (∃ (D : D7) (V : HSp D) (fr : Formalism.IndefR.Eqv.UI.Frames D V) (P Q : ℕ),
        X.I = Formalism.IndefR.Eqv.UI.instV fr ∧ fr.Λ = Formalism.IndefR.Eqv.UI.Lv D V ∧
        (∀ v, (Finset.univ.filter fun i => fr.ε v i = true).card = P) ∧ V.SigOK ∧ (∀ τ, V.sig τ = (P, Q)) ∧
        VolTie D ∧ D.vol V ≤ massI D V.rank ∧ cdScaleTie D) →
      Formalism.MainNotions.BridgeVolRatio.GaugeVolumeBoundVar X (ZsCovR.CasimirBaseCount : ℝ) := by
  intro X n₀ A C cb hn hX hT
  obtain ⟨D, V, fr, P, Q, hXI, hΛ, hε, hV, hs, hTie, hvm, hcd⟩ := hT
  exact Formalism.MainNotions.FundamentalDomainUnfolding.gauge_volume_bound_of_parts (Formalism.L2.S.S7.UnfoldingBorel.UnfoldVol_of_borel hB) hGD X hX.1
    (ZsCovR.covolR_nonneg X)
    (ZsCovTie.rh_covolSum_of_volume_le fr X hXI hΛ hV hs hε hTie hvm hcd
      (fun v => Formalism.MainNotions.S.Gauge.complex_gauge_normalization D hcd _ _) (hVU _))
    (ZsCovR.covolR_le hMR X hX.1 (by have := hX.1.1.1; omega))

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in

theorem rh_volRatio_of_tiesFr (hB : Formalism.L2.SG.LitS.BorelClassFinite)
    (hGD : ∀ (n : ℕ) (ε : Fin n → Bool), Gauge.GaugeDens ε) (hMR : Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.MassRatioStd)
    (hVU : ∀ n, Gauge.VolUn n) :
    ∃ Cv : ℝ, 1 ≤ Cv ∧ ∀ (X : CData) (n₀ : ℕ) (A C cb : ℝ), 8 ≤ n₀ → X.HypC n₀ A C cb → 1 ≤ X.qq →
      (∃ (D : D7) (V : HSp D) (fr : Formalism.IndefR.Eqv.UI.Frames D V) (P Q : ℕ),
        X.I = Formalism.IndefR.Eqv.UI.instV fr ∧ fr.Λ = Formalism.IndefR.Eqv.UI.Lv D V ∧
        (∀ v, (Finset.univ.filter fun i => fr.ε v i = true).card = P) ∧ V.SigOK ∧ (∀ τ, V.sig τ = (P, Q)) ∧
        VolTie D ∧ D.vol V ≤ massI D V.rank ∧ cdScaleTie D) →
      Formalism.MainNotions.BridgeDeepQ.VolRatio X Cv :=
  ⟨(ZsCovR.CasimirBaseCount : ℝ) + 2, by have : (0 : ℝ) ≤ ZsCovR.CasimirBaseCount := Nat.cast_nonneg _; linarith,
    fun X n₀ A C cb hn hX _ hT => Formalism.MainNotions.BridgeVolRatio.vol_ratio_of_gauge_volume hGD X (le_trans (by norm_num) hn) hX.1
      (rh_covolume_gauge_of_frames hB hGD hMR hVU X n₀ A C cb hn hX hT)⟩

rh_scan volRatio_of_tiesFr limit 2000
rh_scan rh_volRatio_of_tiesFr limit 2000
rh_prune rh_volRatio_of_tiesFr as RHIntegrationVolumeRatioPruned
#print axioms volRatio_of_tiesFr
#print axioms rh_covolume_gauge_of_frames
#print axioms rh_volRatio_of_tiesFr
end Formalism.L2.S.S7.CovolumeGaugeFrames
