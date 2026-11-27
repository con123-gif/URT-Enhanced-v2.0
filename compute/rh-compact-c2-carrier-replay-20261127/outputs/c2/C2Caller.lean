import New.Exchange.EqualRankValue
import Mathlib.Tactic

/-!
# RUN78 — actual equal-rank original-statement caller replay candidate
27 November 2026, C2 character boxes. PREPARED, not elaborated.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7; live spine
f62d03bdcd987268e70657298702a238335fb3e6; obligations
b24ae883acc131f657241e944d523013ac5432a9. AGENTS, protocol, continuity,
handoff, 15-lane expansion and recent peer commits through 968df09c inspected.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 remains separate.

Source: New/Exchange/EqualRankValue.lean blob a620150b7c616d614013822be11dbdf74a694f0d.
RUN77 helper reproduced verbatim from 52f562456f4789f04c947793ea746ffa791353a1,
blob c9039e0a3337a25a23993516663734cfbd8480f7, solely to make a single-file shared-runner input.
New work: complete original-statement caller with BOTH choose substitutions
implemented, not just a proposed edit or proof by original theorem.
The zero-reference branch is retained byte-for-byte (except theorem name);
so are the final norm, Fubini, lValueProdInt cancellations and all premises.

Exact finite interface: forward z=0 of type Matrix Empty n F (integrality
vacuous). For canonical emptySum, fromRows 0 X followed by reindex is X:
stdRowDatum e χ 0 X = stdColDatum χ 1 X. Reverse z=1 of type Matrix n n F:
the remaining row matrix has Empty row set, so fromRows 1 X reindexed
by sumEmpty is 1. Thus the row function is the constant stdColDatum χ 1 1,
whereas the column function is the determinant datum. This is precisely
why the two original arbitrary-partner calls were specialized to those
particular functions. Preserve the flip in the reverse direction and all
measure normalizations; do not simply substitute a rank-zero volume of 1.
Source finite definition: Lib/Weil/GaussSum/ShearInvariance.lean
1fe3a70f51455d1bfd976a4ad11661810ba91c7a.
StdExchange: New/Exchange/LowRankIdentity.lean
efd396aa9b0681ecba5a2364546a295094866a2c.

Actual downstream relevance: Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40
stdClassSum_det_modKernel_eq -> explicit_matching -> exchange_theorem uses
the equal-rank nonzero reference; RUN79 direct determinant route still needs it.
RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88
volume_iota_eq_prod_liftVolume and LiftVolumeHeight.lean
87938141d4103b485fd5a7125721798f65f973f1 heightLe_liftVolume_ratio remain
separate suppliers; a nonzero reference is not the signed height inequality.
No new theorem removing those suppliers is claimed.

Original local graph: equalRank -> exchange_of_partners twice, each using
top/descent, flip, arbitrary partner extension. Replacement: same
equalRank statement -> standard helper twice -> same top/descent and flip
plus native standard finite witnesses. Nonzero-reference fallback and
remaining source dependencies are retained. No global dependency removed.
The guards below check complete original declaration type and direct
proof dependencies, not full constructor-inclusive transitive reachability.
Cache context: compact pin, same field, weight μ, rank/signs, fixed reference,
standard pair and orientation; never reuse for arbitrary partners.

Local lean/lake absent; no native rh_scan, rh_prune, rh_reduce, rh_auto,
rh_auto_frontier executed. Static edit checks: each original choose and
specialization anchor occurs exactly once, original fallback retained.
Actual prior CI compact receipt 088cd2ec0e935ee1a282f10096949bcf671cc804
has six named checks and one timeout (not this theorem); shared B2 receipt
d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d has eight helper checks, six
original probes, negative control, no caller replacement. The B2 repair
status was not published at read time. Orchestrator 45996766476 is not
a C2 check. No PASS claimed for this file. Preserve all original errors,
graphs and axiom evidence.

RESUME HERE: shared native runner build New.Exchange.EqualRankValue on
compact pin, then lake env lean --tstack=400000 RUN78_COMPACT_EQUAL_RANK_CALLER.lean
in the compact workspace. Require both new axiom reports, successful guard
and full compiler exit 0. In particular inspect simp of the two standard
row identities, repair only if needed, then run native scans with compatible
toolchain and attach to the actual Carrier consumer. Do not create a parallel
heavy build while the shared runner is handling B2. Handoff to integration,
editor, native runner and audit; no root obligation closed. RH remains OPEN.
-/

open Matrix MeasureTheory Fintype Std Weil ExistsContDiffBumpBase

namespace RHCharacterBoxes77

/-- Only the standard pairs consumed by the double equal-rank exchange.
    Direct specialization of the source proof before extension. -/
lemma exchange_of_standard_pairs {E} [Field E] [CMType E] [WeilData E]
    {n m r p b} [Fintype n] [Fintype m] [Fintype r] [Fintype p] [Fintype b]
    {s s' t u} {W : Space E n s} {X : Space E m s'} (U : Space E b u)
    μ [Nonempty p] (A : (hypSum Unit X).Splitting W p) [IsBaseAdapted A]
    (V : Space E r t) (σ : b ⊕ r ≃ n) {z y}
    (r₁ : IsRapidDatum z) (hy : IsRapidDatum y)
    (hs : 1 + negCount s' = card p + negCount t + negCount u := by simp)
    (hn : 2 ∣ card n := by simp) :
    ∃ C v, IsRapidDatum v ∧ ∀ 𝔠 : SplitTameChar E μ,
      let γ := rankTwist 𝔠.ν⁻¹ n
      ∃ c, C * ‖c‖ ^ 2 = lValueProdInt 𝔠 (card r - card n / 2) *
        equalRankThetaRatio (hypSum Unit X) 𝔠 z ∧
        ∀ a, IsIntMatrix SemilocalField.O a → ∀ g,
          thetaIntegral W V γ 1
            (localDatum W V v (stdRowDatum σ 𝔠.χ a) 𝔠.readsAt) g =
          c * ∫ h, pairTheta U W γ γ
            (localDatum U W y (stdColDatum 𝔠.χ a) 𝔠.readsAt) (h, g) ∂U.quotMeasure := by
  let f := flipCoords (E := E) (s := s) star_normNegOne_mul_self (t := u) rfl
  have : IsRapidDatum (f.realMap y) := by
    simpa [IsRapidDatum, weightedNorm, enorm, fun x ↦ (eq_of_forall_ge_iff (by
      simp [f, flipCoords, starCoordEquiv, ↓pi_nnnorm_le_iff, nnnorm]; tauto) :
      ‖f.realEquiv x‖₊ = ‖x‖₊), ← (Heisenberg.IsVacuum.measurePreserving_equiv
      (realHeis 1) (realHeis 1) f.vac_realEquiv).lintegral_comp_emb
      f.realEquiv.measurableEmbedding] using! hy
  obtain ⟨_, w, a, e, -⟩ := exists_rapid_with_realSlice A.symm _ _ (u_smooth _) this
    (u_compact_support _) u_nonneg 0 ((u_support _).ge (by simp))
  obtain ⟨⟨x, u, rfl, H⟩, _, k⟩ := exists_stdExchange_top (removePlanes ..)
    (removePlanes _ X) (flipSpace U) (.symm (.sumAssoc ..)) (by grind [A.card_eq]) μ a r₁, id hn
  choose rv _ C c _ K using e ▸ slice_zero_comp _ _ (removePlanes ..).symm A u ▸
    (exists_stdExchange_removing_planes _ _ _ μ 0 0 V σ _
      (by simp; grind [negCount_neg_add]) hn).choose_spec.1 _ _ H
  refine ⟨C, _, rv, fun 𝔠 ↦ ?_⟩
  let t := normNegOne.map ((evalPlaces 𝔠.S).restrict _ _ evalPlaces_mem_O).1
  obtain ⟨d, hd, H⟩ := exists_pairTheta_flip star_normNegOne_mul_self rfl U W
    (flipSpace U) 1 (by simp [flipSpace, ← ext_iff]) _
  let r := 𝔠.readsAt
  use c 𝔠 * 𝔠.χ t ^ card b * d, by simp [*, TameLocalChar.norm_eq_one, isIntegralUnit_iff_isUnit.2],
    fun a ha g ↦ ?_
  let Ψ := stdColDatum 𝔠.χ a
  have P := isPartner_stdRowDatum_stdColDatum σ ha
  have hΨ := stdColDatum_mem_schwartzBruhat 𝔠.χ ha
  rw [mul_assoc, ← integral_const_mul, ← funext fun l ↦ H _ _ l _ l.neg (by simp)]
  have : localDatum W (flipSpace U) (f.realMap y) (Ψ ·ᵀ) r.star =
      𝔠.χ t ^ card b • f.map (localDatum U W y Ψ r) := by
    rw [map_integrated, map_name _ _ _ r.1 r.star.1 (hΨ := r.isSchwartzBruhat hΨ),
      ← map_smul, Space.smul_name]
    congr!; dsimp; rw [← P.right_mul _ ⟨.scalar _ t, rfl⟩, mul_comm]; congr
    all_goals (try unfold f flipCoords starCoordEquiv); simp [vecToMat, funext_iff,
      mul_left_comm, star_idem, starRingEnd_apply, Set.conjClosure, ← ext_iff, field, t]
  convert congr((rankTwist 𝔠.ν⁻¹ n).1 g.det * $(K 𝔠 a ha) g) using 1 <;>
    simp [thetaIntegral, isForm_neg_iff_and_integral_neg U (flipSpace U), pairTheta,
      pairWeil, rankTwist, ↓this, *, ← integral_const_mul, Ψ, r]
  repeat congr with <;> field

end RHCharacterBoxes77


open Space Equiv Subsingleton ENNReal MixedModel Heisenberg Sum OrthogonalSum IsIntMatrix Finset
variable {E n} [Field E] [CMType E] [WeilData E] [Fintype n] {s} (W : Space E n s) (μ : _ → ℤ)

private lemma run78_name_vacElem_of_isEmpty [IsEmpty n] (𝔠 : SplitTameChar E μ) Φ : W.name 𝔠.S Φ W.vacElem =
  Φ 0 • W.vacElem := by
  nth_rw 1 [(funext (by simp [eq_zero ·]) : Φ = Φ 0 • boxIndicator _ 𝔠.S)]
  simp [name_boxIndicator 𝔠.readsAt.1]

attribute [local simp] run78_name_vacElem_of_isEmpty localDatum stdColDatum pairTheta pairWeil_apply
  funext_iff vacElem_apply_eq_prod_lineTheta measureReal_univ_ne_zero
  IsIntMatrix.one lValueProdInt_pos invOnUnits thetaIntegral dvd_add

attribute [-simp] measure_univ_of_isAddLeftInvariant probReal_univ


/-- Let W have rank n = 2k + 2q, q negative signs, and weights μ ≥ k. Some rapid v and C ≠ 0 give
|λ(v)|² = CΠ(n/2+1) on ℍ ⊕ W for all tame characters of weight μ (`equalRankThetaRatio`,
`lValueProdInt`). -/
lemma run78_equalRankThetaRatio_value k (hk : card n = 2 * k + 2 * negCount s) (hm : ∀ v, k ≤
  μ v) : ∃ v, IsRapidDatum v ∧
  ∃ C ≠ 0, ∀ 𝔠 : SplitTameChar E μ, equalRankThetaRatio (hypSum Unit W) 𝔠 v = C := by
  let J := stdSpace E (Fin (2 * k))
  obtain ⟨X, A, _⟩ := exists_isBaseAdapted (Fin _) J s (by simpa) (by simp)
  let Y := hypSum Unit X
  let P := removePlanes Unit X
  let Q := P.comp A
  let Z := stdSpace E Empty
  obtain ⟨o, h₀ | ⟨_, v₁, r₁, h⟩⟩ := (J.isAutomorphic_const 1).mem_rapidFunctions,
    em' (∃ 𝔠 v, IsRapidDatum v ∧ equalRankThetaRatio Y 𝔠 v ≠ 0)
  simp [equalRankThetaRatio, ne_of_gt, -thetaIntegral] at h₀
  refine (exists_stdExchange_removing_planes J.neg _ ((removePlanes _ Y).symm.comp Q) μ k
    (μ · - k |>.toNat) Z (sumEmpty ..) (sumAssoc ..).symm ?_ ?_).rec fun f ⟨K, a⟩ ↦
    (a ?_ ?_ ?_ ⟨isRapidDatum_vacVector, 1, 0, ?_⟩).rec fun v ⟨⟨r, _⟩, a⟩ ↦ (a ▸ K _ 0 <|
    stdExchange_of_periods _ (removePlanes _ Y) P _ 0 ?q zero_le_one ?_ r ?_ (fun 𝔠 _ ↦ ⟨1, by
    simp_intro .. [realSlice]; exact And.elim (fun i R ↦ .trans (by
      congr with
      rw [IsVacuum.map_eq_integral]
      convert! (θ _ ∘L (pairWeil ..) _ ∘L (integrated _).flip _).integral_comp_comm i
      rw [map_smul, map_smul]
      convert! congrArg _ (thetaOnRealData_boxProd_eq_mul ..)
      erw [← heisOp_tmul, tmul_vacElem]) ((thetaLarge_eq_apply_one_of_even_rank P _ ?q R _).trans
      (h₀ _ _ R))) (isRapidDatum_integral (by fun_prop) fun _ ↦ (eq_top_mono
      (lintegral_weightedNorm_smul_le fun y ↦ by grw [weightedNorm_smul, weightedNorm_realHeisOp_le,
      ← ofReal_norm, (thetaOnRealData ..).le_opNorm, Heisenberg.Rep.norm_map,
      (enorm_le_iff_norm_le.2 (pi_norm_comp_le y _) : ‖Prod.snd _‖ₑ ≤ _), mul_comm, mul_rotate])).mt
      (by simp [mul_eq_top, isRapidDatum_vacVector _, realPairWeil, weightedNorm_smul,
      isRapidDatum_slice _ _ r _, (eq_top_mono (weightedNorm_realWeil_le ..)).mt]))⟩) ?_).2.2.rec
    fun _ K ↦ ⟨_, isRapidDatum_vacVector, 1, ?_,
    fun 𝔠 ↦ by simpa [↓isIntegralUnit_iff_v_eq_one, univ_eq_empty, @eq_one (G ..),
    (id rfl : stdRowDatum (sumEmpty ..) _ 1 _ = stdColDatum _ 1 1)] using
    (K 𝔠).choose_spec.2 _ .one⟩ <;> simp +arith [IsRapidDatum, weightedNorm, detVectorFn, *]
  choose B y r b hb K using RHCharacterBoxes77.exchange_of_standard_pairs Z μ Q J (emptySum ..) r₁ isRapidDatum_vacVector
  choose C x _ c hc H using RHCharacterBoxes77.exchange_of_standard_pairs J μ Q Z (sumEmpty ..) r₁ r
  refine have F 𝔠 : equalRankThetaRatio Y 𝔠 v₁ ^ 2 =
      B * C * ‖integrated _ x (J.hom Z).vacElem 0‖ ^ 2 := ?_
    ⟨_, r₁, _, h, fun 𝔠 ↦ by rw [← sq_eq_sq₀, F, ← F 𝔠, equalRankThetaRatio,
      (thetaLarge_move _ _ _ Y _ _ (exists_eq_move
      ..).choose_spec.choose_spec.2.1 𝔠).choose_spec, thetaLarge_eq_apply_one_of_even_rank P] <;>
      simp [Y, *, equalRankThetaRatio, div_nonneg, _root_.le_of_lt, -thetaIntegral]⟩
  have T α φ := (pairThetaKer _ _ α α).integral_lift_eq_integral_descent (φ := φ) o o
  specialize K 𝔠 0 (by exact nofun)
  have := congr(‖∫ g, $(H 𝔠 1 IsIntMatrix.one g) ∂J.quotMeasure‖)
  -- The original two finite functions are definitionally standard rows:
  -- forward empty rows, reverse empty remaining columns. Normalize only these data.
  simp only [stdRowDatum] at K this
  simp [↓isIntegralUnit_iff_v_eq_one, ↓IsIntMatrix.one, IsIntMatrix, lift, field, univ_eq_empty,
    @eq_one (G ..), mul_right_comm _ _⁻¹] at T K this
  simp [*, field] at *
  rw [this]; clear * - hc hb; grind [lValueProdInt, lValueProdInt_pos]


#check @run78_equalRankThetaRatio_value
#print axioms RHCharacterBoxes77.exchange_of_standard_pairs
#print axioms run78_equalRankThetaRatio_value

run_cmd do
  let info ← Lean.getConstInfo ``run78_equalRankThetaRatio_value
  let original ← Lean.getConstInfo ``exists_equalRankThetaRatio_value
  let sameType ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq original.type info.type
  unless sameType do
    Lean.throwError "C2 equal-rank replacement type mismatch"
  let some value := info.value? (allowOpaque := true) |
    Lean.throwError "C2 equal-rank replacement has no inspectable proof"
  let deps := value.getUsedConstants
  if deps.contains ``exists_equalRankThetaRatio_value ||
      deps.contains ``exchange_of_partners then
    Lean.throwError "C2 replacement uses original target or general exchange directly"
  unless deps.contains ``RHCharacterBoxes77.exchange_of_standard_pairs do
    Lean.throwError "C2 replacement does not consume the standard-pair helper"
  Lean.logInfo "C2_EQUAL_RANK_CALLER: exact type; standard helper consumed; original target and general exchange absent directly"
