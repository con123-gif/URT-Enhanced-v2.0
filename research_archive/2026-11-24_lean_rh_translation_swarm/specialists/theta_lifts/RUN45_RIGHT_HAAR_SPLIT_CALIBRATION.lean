import RUN44_NATIVE_SPLIT_QUOTIENT

/-!
Lane 8 RUN45 | 26 Nov 2026 | HUMAN EXACT REDUCTION / SOURCE-MATCHED /
LEAN CANDIDATE PREPARED, NOT COMPILED. RH OPEN.

Read latest mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4
including mandatory engine, AGENTS, SWARM, HANDOFF, EXPANSION,
continuity/state/runner openings, recent 20 branch commits. Prior theta
755b92513374b7971479b3801d0fc0091e82bd47 (RUN44); peer editor
c5fe320e40fb2888fa4187154ce97c20942fa873 (same-row gauge endpoint),
geometry 94cfd3a4a04830d28995947dc04a29384694fb19 (SW rank-one
coordinate fibre), integration 5744b095fadaeae78f7e4178968e64b4b4ddd001
(shared rank-three/rank-two trace) read. Preserve their premises.
Native pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Upstream HEAD
2746005d8130ee6d0c82d771ec11d69521a65093 observed, not migrated or
semantically compared.

NEW reduction of the actual RUN44 native map equality: use RIGHT
translation invariance, not a separate proof of left conjugation
invariance of the product Haar. This matters because the native
adelic_unimodular theorem already supplies inversion and right
invariance for the exact I.muA used at the counting consumer.

Keep canonical diagonal host I=ofSignature cm p q, J=signMat, P_v=1.
Let H=SU(J)(A_F), T=norm-one torus, s the single diagonal
determinant section, e(h,t)=h*s(t). The previous RUN44 product
fundamental domain requires these LEFT split coordinates.
Right translating by e(a,b) in these SAME coordinates is triangular:
    (h,t) -> (h*Ad(s(t))(a), t*b).
In particular, for fixed t this is a right translation of h, not
the automorphism Ad(s(t)) applied to the variable h.
For any measurable A in H x T write A_t={h:(h,t) in A}.
For sigma-finite right Haar mH,mT, Tonelli gives
  (mH x mT)(R_(a,b)^(-1) A)
    = integral mH(A_(t*b)) dmT(t)
    = integral mH(A_t) dmT(t)
    = (mH x mT)(A).
No unimodularity of a general H, no determinant of conjugation,
no invariant fundamental-domain choice, no bounded integrals and
no division by a fibre mass is used in this identity. Right Haar is
the essential guard. For the intended semisimple H and abelian T,
classical normalized Tamagawa measures are both left and right Haar.
The previous proof of absolute trace density is still relevant to
the numerical normalization; this argument does NOT compute it.

Therefore nu=e_*(mH x mT) is right invariant. In the actual canonical
host e is a homeomorphism (inverse (g*s(det g)^(-1),det g)), so nu
is locally finite on compacts and positive on nonempty opens:
preimages of compact sets are compact, their projections compact,
and any nonempty open preimage contains a nonempty open rectangle.
Invert nu to obtain LEFT Haar, and use native adelic_unimodular's
inversion invariance of raw I.muA. Equality of one finite positive
test value nu(B)=c*I.muA(B), where c=ofReal(prod_v w.c v), proves
     nu = c*I.muA = nativeProduct43 w v.
Indeed invert B, apply left-Haar uniqueness on nu.inv at B^-1,
and invert the resulting measure equality. It suffices to evaluate
one product rectangle B=e(BH x BT), for which nu(B)=mH(BH)mT(BT).
This replaces RUN44's full native measure-map equality by local
scalar calibration plus right Haar and topological compact/open
guards. It is not a proof of the scalar value, and not a proof
of the determinant section's native continuity. The proof works
for sigma-finite Haar without assuming finite group volume.
A candidate direct proof via left translation would require
invariance under Ad(s(b)); using right translation avoids that
extra obligation while keeping the original product domain.

Pinned source ledger:
 native src/Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
 2103e49fe83fce42d4962f85acd9d4f6a589d645 (GA, GFset, muA).
 native src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 AdelicUnitaryHaarBiInvariant.lean 8d3cfafd1ab9d5803d48c4a61ce3e3487602b741
 (adelic_unimodular, map_inv_eq); ExistsFrameOfHasSignature.lean
 13982fe910bfc0dec0938e4ed6cdb20e01ad3821 (ofSigns/ofSignature).
 Mathlib/MeasureTheory/Measure/Prod.lean
 25c0a0fb7a00de99b17f38d2dc45810e40745f06
 (prod_apply_symm, measurable_measure_prodMk_right, prod_prod).
 Mathlib/MeasureTheory/Group/Measure.lean
 b1c9cd3d3004b3afed34bcf15f8605f6252435a2
 (measure_preimage_mul_right, map_mul_right_eq_self, inv.instIsMulLeftInvariant).
 Mathlib/MeasureTheory/Integral/Lebesgue/Map.lean
 251ec24fe6e155849e0627ed86e23cee2babcece (lintegral_map).
 Mathlib/MeasureTheory/Measure/Haar/Unique.lean
 caaaa7c755bccae30075d559264506ae51a97f18 (isMulLeftInvariant_eq_smul).
25 fail-on-error pinned blob/token assertions on these seven real
source files executed in connector V8, no numerical surrogate.
Native lean/lake not on PATH. Actual CI status JSONs reread:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717 both pass/0;
baseline only. Root adapter axioms propext, Classical.choice,
Quot.sound; 324 pending scan names. No new native result, no new
axiom result, not queued by this run. No URT comparison warranted.

Original graph retained: CountTyped -> VolumeStep -> rank ratio;
RUN43 FiniteProductPair43 -> RUN44 native_covol_of_split44 (hmap).
Candidate graph:
 same split coordinates + right Haar on H,T + compact/open guards
 + one finite positive rectangle calibration
 -> split_right_invariant45 -> right_cal45 -> native_map_right45
 -> RUN44 native_covol_of_split44 -> common torus covol
 -> FiniteProductPair43 -> countingTheorem_of_finite43.
Keep all old nodes, surviving constructor/type/value edges, axiom
evidence. Cache key pin/toolchain,F,E,CM,p,q,I,w,v,e,s,H,T,
factor measures, rectangle and native gauge, actual caller.
Backtrack to RUN44 direct differential-form comparison if the
right-Haar bridge does not replay. No root obligations retired.

RESUME HERE: use ofSigns P_v=1 to implement the exact diagonal
determinant section on native finite and infinite groups, instantiate
the measurable split coordinates and test rectangle from the
regularized local product. Stage RUN36 through RUN45 in existing
pinned native runner, replay individually, record actual outputs,
then substitute at the native counting consumer. Use editor's
same-row endpoint transport rather than constructing a second
unrelated row host. Do not rewrite the scalar rank recurrence again.
Uniform same-host CountI/II/V/Vs, SW, TopG/Green/J/VWin and the
weighted prime-window inequality remain open.
HANDOFF TO kernel, geometry, audit, editor, integration, literature.
-/

open MeasureTheory NumberField Finset Formalism.MainNotions.S
open GlobalTheory.Count GlobalTheory.FlagMeas
open scoped ENNReal

noncomputable section
namespace GlobalTheory.FlagMeas.VolRatio

section Right
variable {H T G : Type} [Group H] [Group T] [Group G]
  [MeasurableSpace H] [MeasurableSpace T] [MeasurableSpace G]
  [MeasurableMul H] [MeasurableMul T] [MeasurableMul G]

theorem split_right_invariant45 (e : H × T ≃ᵐ G) (act : T → H → H)
    (mH : Measure H) (mT : Measure T) [SigmaFinite mH] [SigmaFinite mT]
    [mH.IsMulRightInvariant] [mT.IsMulRightInvariant]
    (hmul : ∀ a b h t, e (a,b) * e (h,t) = e (a * act b h,b*t)) :
    ((mH.prod mT).map e).IsMulRightInvariant := by
  constructor
  intro g
  rcases hg : e.symm g with ⟨a,b⟩
  have he : e (a,b) = g := by rw [← hg, e.apply_symm_apply]
  ext A hA
  rw [← he, Measure.map_apply (measurable_mul_const _) hA,
    Measure.map_apply e.measurable (measurable_mul_const _ hA),
    Measure.map_apply e.measurable hA,
    Measure.prod_apply_symm (e.measurable (measurable_mul_const _ hA)),
    Measure.prod_apply_symm (e.measurable hA)]
  let S := e ⁻¹' A
  have hs : MeasurableSet S := e.measurable hA
  have hslice (t : T) :
      (fun h : H => (h,t)) ⁻¹' (e ⁻¹' ((fun z : G => z * e (a,b)) ⁻¹' A)) =
      (fun h : H => h * act t a) ⁻¹' ((fun h : H => (h,t*b)) ⁻¹' S) := by
    ext h
    simp only [Set.mem_preimage, S, hmul]
  calc
    _ = ∫⁻ t, mH ((fun h : H => (h,t*b)) ⁻¹' S) ∂mT := by
      apply lintegral_congr
      intro t
      rw [hslice, measure_preimage_mul_right]
    _ = ∫⁻ t, mH ((fun h : H => (h,t)) ⁻¹' S) ∂mT := by
      rw [← lintegral_map (measurable_measure_prodMk_right hs)
        (measurable_mul_const b), map_mul_right_eq_self]
    _ = _ := rfl

end Right

section Cal
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [SecondCountableTopology G] [MeasurableSpace G] [BorelSpace G]

theorem right_cal45 (mu nu : Measure G) [mu.IsHaarMeasure]
    [nu.IsMulRightInvariant] [nu.IsFiniteMeasureOnCompacts] [nu.IsOpenPosMeasure]
    (hinv : mu.inv = mu) (B : Set G) (hB : MeasurableSet B)
    (h0 : mu B ≠ 0) (ht : mu B ≠ ⊤) (c : ENNReal)
    (hc : nu B = c * mu B) : nu = c • mu := by
  haveI : nu.inv.IsHaarMeasure :=
    { toIsFiniteMeasureOnCompacts := inferInstance
      toIsMulLeftInvariant := inferInstance
      toIsOpenPosMeasure := inferInstance }
  let D := (fun x : G => x⁻¹) ⁻¹' B
  have hd : MeasurableSet D := measurable_inv hB
  have hDD : (fun x : G => x⁻¹) ⁻¹' D = B := by ext x; simp [D]
  have hm : mu D = mu B := by
    calc
      mu D = mu.inv B := by rw [Measure.inv_def, Measure.map_apply measurable_inv hB]; rfl
      _ = mu B := by rw [hinv]
  have hn : nu.inv D = nu B := by
    rw [Measure.inv_def, Measure.map_apply measurable_inv hd, hDD]
  have h := haar_eq_one_test42 mu nu.inv D (by rw [hm]; exact h0) (by rw [hm]; exact ht) c
    (by rw [hn, hm]; exact hc)
  calc
    nu = nu.inv.inv := (Measure.inv_inv nu).symm
    _ = c • mu := by rw [h, Measure.inv_def, Measure.map_smul, ← Measure.inv_def, hinv]

end Cal

/-- Same native measure-map interface consumed by native_covol_of_split44.
The local test is deliberately retained, not assumed to be automatically
supplied by Haar uniqueness. Compact/open guards follow from the intended
topological split and genuine local Tamagawa factors. -/
theorem native_map_right45 {I : AutInst} (w : GaugeWitness36 I)
    {a : ENNReal} (v : FiniteWitness43 I a)
    {H T : Type} [Group H] [Group T] [MeasurableSpace H] [MeasurableSpace T]
    [MeasurableMul H] [MeasurableMul T]
    (e : H × T ≃ᵐ I.GA) (act : T → H → H)
    (mH : Measure H) (mT : Measure T) [SigmaFinite mH] [SigmaFinite mT]
    [mH.IsMulRightInvariant] [mT.IsMulRightInvariant]
    (hmul : ∀ a b h t, e (a,b) * e (h,t) = e (a * act b h,b*t))
    (hcomp : ((mH.prod mT).map e).IsFiniteMeasureOnCompacts)
    (hopen : ((mH.prod mT).map e).IsOpenPosMeasure)
    (B : Set I.GA) (hB : MeasurableSet B)
    (h0 : (letI : SigmaFinite v.mu := v.sf; I.muA v.mu B) ≠ 0)
    (ht : (letI : SigmaFinite v.mu := v.sf; I.muA v.mu B) ≠ ⊤)
    (hc : (mH.prod mT).map e B = nativeProduct43 w v B) :
    (mH.prod mT).map e = nativeProduct43 w v := by
  letI : SigmaFinite v.mu := v.sf
  letI : v.mu.IsHaarMeasure := v.haar
  obtain ⟨_, _, _, -⟩ := GlobalTheory.CongTop.adelic_topology I
  haveI : ∀ v, (Formalism.REAL.muG (I.ε v)).IsHaarMeasure :=
    fun v => by unfold Formalism.REAL.muG; infer_instance
  haveI : (Measure.pi fun v => Formalism.REAL.muG (I.ε v)).IsHaarMeasure :=
    Measure.pi.isHaarMeasure _
  haveI : (I.muA v.mu).IsHaarMeasure := Measure.prod.instIsHaarMeasure _ _
  haveI : ((mH.prod mT).map e).IsMulRightInvariant :=
    split_right_invariant45 e act mH mT hmul
  letI := hcomp
  letI := hopen
  have hinv : (I.muA v.mu).inv = I.muA v.mu :=
    (GlobalTheory.AdelicUnimod.adelic_unimodular I v.mu).2.2.1
  have hcal : (mH.prod mT).map e B =
      ENNReal.ofReal (∏ t, w.c t) * I.muA v.mu B := by
    rw [hc, nativeProduct43, Measure.smul_apply, smul_eq_mul]
  unfold nativeProduct43
  exact right_cal45 (I.muA v.mu) ((mH.prod mT).map e) hinv B hB h0 ht _ hcal

end GlobalTheory.FlagMeas.VolRatio

rh_scan GlobalTheory.AdelicUnimod.adelic_unimodular limit 2000
rh_scan GlobalTheory.FlagMeas.VolRatio.native_covol_of_split44 limit 2000
rh_prune GlobalTheory.FlagMeas.VolRatio.split_right_invariant45 as RHThetaRightInvariant45Pruned
rh_prune GlobalTheory.FlagMeas.VolRatio.native_map_right45 as RHThetaRightMap45Pruned
rh_scan GlobalTheory.FlagMeas.VolRatio.native_map_right45 limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_finite43 limit 2000
#print axioms GlobalTheory.FlagMeas.VolRatio.split_right_invariant45
#print axioms GlobalTheory.FlagMeas.VolRatio.right_cal45
#print axioms GlobalTheory.FlagMeas.VolRatio.native_map_right45
end
