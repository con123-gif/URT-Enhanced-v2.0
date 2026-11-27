import New.Rows.Carrier
import Mathlib.Tactic
set_option pp.fullNames true
set_option debug.skipKernelTC false
section C2Base

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
    (flipSpace U) 1 (by simp [flipSpace, ← ext_iff]) (rankTwist 𝔠.ν⁻¹ n)
  let r := 𝔠.readsAt
  use c 𝔠 * 𝔠.χ t ^ card b * d, by simp [*, TameLocalChar.norm_eq_one, isIntegralUnit_iff_isUnit.2],
    fun a ha g ↦ ?_
  let Ψ := stdColDatum 𝔠.χ a
  have P := isPartner_stdRowDatum_stdColDatum σ (χ := 𝔠.χ) ha
  have hΨ := stdColDatum_mem_schwartzBruhat 𝔠.χ ha
  rw [mul_assoc, ← integral_const_mul, ← funext fun l ↦ H _ _ l _ l.neg (by simp)]
  have flipDatum (Ψ : Matrix n b (LocProd 𝔠.S) → ℂ)
      (hΨ : Ψ ∈ schwartzBruhat HasLeftInv)
      (P : IsPartner SemilocalField.O σ 𝔠.χ (stdRowDatum σ 𝔠.χ a) Ψ) :
      localDatum W (flipSpace U) (f.realMap y) (Ψ ·ᵀ) r.star =
        𝔠.χ t ^ card b • f.map (localDatum U W y Ψ r) := by
    rw [map_integrated, map_name _ _ _ r.1 r.star.1 (hΨ := r.isSchwartzBruhat hΨ),
      ← map_smul, Space.smul_name]
    congr!; dsimp; rw [← P.right_mul _ ⟨.scalar _ t, rfl⟩, mul_comm]; congr
    all_goals (try unfold f flipCoords starCoordEquiv); simp [vecToMat, funext_iff,
      mul_left_comm, star_idem, starRingEnd_apply, Set.conjClosure, ← ext_iff, field, t]
  have : localDatum W (flipSpace U) (f.realMap y) (Ψ ·ᵀ) r.star =
      𝔠.χ t ^ card b • f.map (localDatum U W y Ψ r) := flipDatum _ hΨ P
  have kg := congr((rankTwist 𝔠.ν⁻¹ n).1 g.det * $(K 𝔠 a ha) g)
  clear K
  convert kg using 1 <;> clear kg <;>
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
  have row_forward :
      stdRowDatum (emptySum Empty (Fin (2 * k))) 𝔠.χ
        (0 : Matrix Empty (Fin (2 * k)) (LocProd 𝔠.S)) =
      stdColDatum 𝔠.χ (1 : Matrix (Fin (2 * k)) (Fin (2 * k)) (LocProd 𝔠.S)) := rfl
  have row_reverse :
      stdRowDatum (sumEmpty (Fin (2 * k)) Empty) 𝔠.χ
        (1 : Matrix (Fin (2 * k)) (Fin (2 * k)) (LocProd 𝔠.S)) =
      (fun (_ : Matrix Empty (Fin (2 * k)) (LocProd 𝔠.S)) =>
        stdColDatum 𝔠.χ
          (1 : Matrix (Fin (2 * k)) (Fin (2 * k)) (LocProd 𝔠.S))
          (1 : Matrix (Fin (2 * k)) (Fin (2 * k)) (LocProd 𝔠.S))) := rfl
  simp only [row_forward, row_reverse] at K this
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

end C2Base
section C2Propagation

/-!
# RUN79 — propagate the actual equal-rank replacement to both Carrier consumers
27 November 2026. C2 / character boxes. SOURCE-MATCHED / PREPARED,
not native checked. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine
30924a758e7dc18f58e424b5e54c7d21f4b060e2, live obligations
7a20a39bd945378ed2daab0953e9b65571d0a196. AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol, continuity,
current registry, latest orchestrator and peer commits through cd700332 read.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 / Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin
40e56bab026552e089d7afcfeff08d2defb9c005 remains separate.

Original source (relative to grh-compact/src):
 New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d
 New/Exchange/ExchangeTheorem.lean 608b4f61af27d780e24f799937a836ecd3c1d50a
 New/Rows/Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40
 New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88
 New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1
 New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a

Reuse RUN78 (70b2bd10, blob 6bb8f53e746aa4d5c876c7eff3433e6daf126795)
and integration/replay_c2_built_workspace.py (blob a50abb1af4fa8f0f67a7030f8111e75fe065fd08).
The shared runner already adapts info.value? (allowOpaque := true) and full
axiom names (peer 06486f1e); do not edit the original pinned candidate.
Current C2 manifest 8f6ffb7b5ff829258d15d9fc8ff99ad1870d6fbc is preflight
only. Actual current B2 run 46006832164 in_progress; the verified seven
B2 declarations are not C2 receipts. No parallel heavy build scheduled.

## New result: propagate, rather than rederive
The complete four original-statement declarations below are the actual
source bodies with only the declaration names and explicit supplier names
changed. Each of the 9 replacements was unique; reverse substitutions
restored all four exact source blocks byte-for-byte (apart from trailing
newline). No original hypotheses, quantifier, finite modulus guard,
character lift, measure normalization, or arbitrary-partner consumer is
removed. No new scalar simulation. This is a caller propagation candidate,
not a new proof of the common theta suppliers.

Original local graph:
 stdClassSum_carrierXi_eq_carrierForm -> stdClassSum_det_modKernel_eq,
 explicit_matching; determinant caller -> explicit_matching;
 explicit_matching -> exchange_theorem -> exists_equalRankThetaRatio_value
 and exchange_of_partners; equal-rank itself -> exchange_of_partners twice.
Reduced local graph:
 run79 carrier -> run79 determinant and run79 explicit -> run79 exchange
 -> run78_equalRankThetaRatio_value -> RHCharacterBoxes77.exchange_of_standard_pairs.
 The general exchange_of_partners edge at run79_exchange_theorem is
 deliberately retained. The original fallback remains in RUN78. Original
 source graph and all unresolved axioms retained, no global pruning claim.
The caller guards below require the new edges and reject direct use of the
superseded old declarations (including own original target). They do not
establish transitive absence of the general exchange, which remains used.
All four statements are checked for definitional equality when replayed.

Separate RUN76 no-flip standard_prefix and peer integration RUN79 fab4aba0
determinant-only route are alternatives, not multiplied reductions.
That narrower direct route's rank-zero vacuum and finite cutoff are already
audited in RUN76; reuse, do not reopen. Here we propagate RUN78 through the
GENERAL Carrier interface, preserving all arbitrary partners at the outer
caller. This also carries to the carrierXi consumer, not merely rank two.

C2 downstream frontier (source inspection, not new proof):
 ComparisonForms.exists_comparison_forms uses a common nonzero gamma,
 surjective A and u*gl=gamma A. LiftVolumeHeight requires testedness,
 integral forms away from twist, the archimedean bound, both compressed
 Gram determinant inequalities and the inverse Hecke-value height. RowVolume
 requires the triangle and common Hecke/Rallis supplier. The two signed
 height budgets are not supplied by this file. No new root retirement.
Context cache key: compact pin + exact theorem type + caller + all finite
modulus/tame premises + same rapid and normalization data. No URT claimed.

Verification executed in this run: authenticated the three upstream/peer
blobs above and performed exact reversible source substitutions, checked
all source anchors and absence of proof placeholders in the four copied
bodies. Local lean/lake absent. Native rh_scan/rh_prune/rh_reduce/rh_auto/
rh_auto_frontier not executed. Kernel/type/axiom/dependency status remains
PREPARED, not PASS. Preserve old-pin and compact receipts separately.

RESUME HERE: use the existing shared C2 workspace after B2. First run the
existing C2 replay with --build only if needed. On a successful original
RUN78 candidate receipt, emit its ADAPTED C2Caller.lean as C2Caller.olean
using lake env lean with the same project options, full names, -R <out>
and -o <out>/C2Caller.olean. With LEAN_PATH extended by <out>, build
+New.Rows.Carrier:olean if missing and check this file. Require exit 0,
four exact-type/edge guards and the four standard axiom reports, then
scan the new and original root frontiers with compact-compatible tools.
Do not report this candidate integrated until actual logs confirm it.
HANDOFF TO: integration, native runner, editor and formal audit.
-/

set_option pp.fullNames true

section
open RingHom Fintype Modulus IsLinearMap
variable {E} [Field E] [CMType E] [WeilData E] {n a b} [Fintype n] [Fintype a] [Fintype b] {s t t'}
  (W : Space E n s) (V : Space E a t) (V' : Space E b t')

lemma run79_exchange_theorem σ (hs : negCount s = negCount t + negCount t') {e} (he : card a =
  card b + 2 * e) (hn : 2 * negCount s + 2 ≤ card n) {μ : _ → ℤ} (hμ : ∀ v,
  card n ≤ 2 * μ v + 2 * negCount s) {v} (hv : IsRapidDatum v) : ∃ C x, IsRapidDatum x ∧ ∀ 𝔪 ν χ,
  IsTameFor 𝔪 ν μ χ → let γ := rankTwist ν⁻¹ n; ∃ c ≠ 0, ‖c‖ ^ 2 = C * lValueProd 𝔪.places ν e
    ∧ ∀ Φ Ψ, IsPartner ⊤ σ χ Φ Ψ → ∀ g, thetaIntegral W V γ 1 (modDatum W V 𝔪 Φ x) g =
    c * ∫ h, pairTheta V' W γ γ (modDatum _ W 𝔪 Ψ v) (h, g) ∂V'.quotMeasure := by
  have ⟨_, r₀, C₀, _⟩ := run78_equalRankThetaRatio_value W μ (card n / 2 - negCount s) ?_ ?_
  have ⟨C, x, r, H⟩ := exchange_of_partners V' μ (removePlanes _ W) V σ r₀ hv ?_ ?_
  use C₀ / C, x, r, fun 𝔪 ν χ ⟨h, ψ, a₁, a₂, a₃⟩ ↦ ?_
  have o := 𝔪.places.toFinite.coe_toFinset
  let 𝔠 := SplitTameChar.mk ν ψ a₁ _ (by simpa using! h) (by simpa using! 𝔪.not_le_star) (o ▸ a₂) ?_
  obtain ⟨⟨c, hc, H⟩, l, _, m, _, ρ, _, k, k'⟩ := H 𝔠, lValueProdInt_pos 𝔠 e, o ▸ 𝔠.readsAt
  simp +arith [*, ← card_congr σ, Int.add_mul_ediv_left] at hc
  simp [lValueProdInt, lValueProd.eq_1 _ _ 0] at *
  use c, by grind [norm_zero], by grind, fun Φ Ψ P ↦ ?_
  let π := ((evalPlaces 𝔠.S).restrict _ _ evalPlaces_mem_O).liftOfRightInverse
    (⟨_, by simpa [← k', *] using m <| ρ ·⟩) (Subtype.ext <| k ·) ⟨𝔪.reduction, fun x hx ↦
    (𝔪.reduction_congr (y := 0) (congr($hx.1 ⟨·, o.ge ·⟩))).trans (map_zero _)⟩
  have e i u : modulusResidue _ (o.le i.2) (π u) = residueAt i u :=
    (modulusResidue_reduction ..).trans congr(⟦⟨$(k u) i, _⟩⟧)
  have d {n n' : Type} [Fintype n] [Fintype n'] Φ : 𝔪.liftFn (Φ ∘ @vecToMat n n' _) =
    (liftIntegralFn π Φ <| vecToMat <| evalPlaces
    _ ∘ ·) := by ext; erw [liftFn_apply, mk'_apply]; congr! <;> simp [vecToMat, m, ← k']; rfl
  simpa [modDatum, 𝔠, *] using! H _ _ (by simpa [Function.comp_def, *] using (d Ψ ▸
    isSchwartzBruhat_liftFn .. :).locally_constant.comp_continuous (f := (ρ ∘ matToVec ·)) (by
    fun_prop [matToVec])) (P.lift_of_reduction π ⟨fun u h ↦ isUnit_iff_residueAt_ne_zero.2
    (e · u ▸ (h.map _).ne_zero)⟩ (𝔪.reduction_surjective.forall.2 fun _ ↦
    ⟨_, liftOfRightInverse_comp_apply ..⟩) (by
    simp_intro .. [← finprod_comp_equiv (Set.equivOfEq o),
    a₃, charOfTamePart, ← e, 𝔠.localChar_apply_of_isUnit, finprod_eq_prod_of_fintype]; rfl))
  repeat grind [card_sum, card_congr σ, card_unit]

end

section
seal Finset.univ Finset.sum Finset.prod
open Subgroup Fintype IsLevel MatMul Matrix MeasureTheory Space WeilData Ideal.Quotient

variable {E n b : Type} [Field E] [CMType E] [WeilData E] [Fintype n] [Fintype b] {𝔪}

lemma run79_explicit_matching {E} [Field E] [CMType E] [WeilData E] {n m a b p l} [Fintype n] [Fintype m]
  [Fintype a] [Fintype b] [Fintype p] [Fintype l] {s} (W : Space E n s) (f : p ⊕ l ≃ b) (V' : Space
  E _ (blockSigns f)) σ e (j : m ⊕ l ≃ n) (hj : s = blockSigns j) {d} (hd : card a = card b + 2 * d)
  (hn : 2 * card l + 2 ≤ card n) ι [∀ τ, Fintype (ι τ)] : ∃ C, ∀ {𝔪 α γ χ}, IsTameFor 𝔪 α γ χ →
  (∀ τ, γ τ = card l - card (ι τ)) → ∃ c, ‖c‖ ^ 2 = C / lValueProd 𝔪.places
  (α⁻¹ * upsilonU1 ^ (card b + d)) d ∧ ∀ η {Φ Ψ}, IsPartner ⊤ σ χ⁻¹ Φ Ψ → ∀ β g, c * stdClassSum
  (Kf E a) (modKernelI W α β 𝔪 Φ (renameRowsCols id (j ∘ .inl) (stackedDetProd e η)) g ·) = ∫ x,
  modKernel V' W (α / β) α 𝔪 Ψ (matchedPoly (ι := ι) f j η) x g ∂V'.quotMeasure := by
  subst_vars
  choose Q₀ κ hκ using real_matching f j e (ι := ι) rfl; have := card_congr σ ▸ card_sum
  apply (run79_exchange_theorem W _ V' σ _ hd _ _ (weightedNorm_polyVector_ne_top · Q₀)).elim
  rintro C ⟨x, -, H⟩; constructor
  intro 𝔪 α _ χ hα@⟨o, _, _, _⟩ hγ; cases funext hγ
  choose c _ q hc using H 𝔪 _ _ (hα.inv.mul (hasWeight_upsilonU1_pow _))
  use κ x / c, by rw [norm_div, div_pow, q, div_div], fun η Φ Ψ hP β g ↦ ?_
  obtain ⟨⟨L, hL⟩, hv⟩ := (pairThetaKer W (stdSpace E a) α 1).swap.exists_clm_lift
    (isAutomorphic_const _ 1).mem_rapidFunctions, realPairWeil_stackedDetProd j e rfl η 1
  simp [rankTwist, Space.lift, ↓mul_inv,
    (by omega : card n / 2 = card b + d), -Prod.forall] at hc hL hv
  change ∀ f g, thetaIntegral .. = _ at hL; specialize hκ x
    ((L · ∘L .flip (integrated _) _) ∘ (g * ⟨·, 1⟩)) (c • ⟨⟨(∫ x, modKernelBilin V' W α α 𝔪 x g
    Ψ · ∂V'.quotMeasure), by simp [integral_add, map_add, (isRapid_modKernel V' W α α
    o (hP.2 · · |>.elim (by grind [invFirstRows_mul_firstCols σ ·])) _ g).integrable
    (by fun_prop [modKernel])]⟩, by simp⟩) (by simp [← hL, ← pairWeil_integrated _ _ α 1,
    thetaIntegral_pairWeil, mul_assoc]) (fun x Q h ↦ (hL .. ▸ hc _ _ hP _).trans
    (by simp [modKernel, modDatum, ← h, ← pairWeil_integrated_right α α, ← pairTheta_mul])) η
  erw [← hL, thetaIntegral, integral_quotMeasure_eq_classSum (f :=
    modKernelI W α 1 𝔪 Φ _ g) (pairThetaKer ..).swap.theta_rat_mul
    (fun _ ↦ integral_eq_const (.of_forall fun x ↦ ?_)) (Kf ..) ?_] at hκ
  rw [division_def α, ← one_mul β, ← mul_one α]
  simpa [↓modKernel_twist, ← mul_classSum, field] using hκ
  intro k m _; rw [modKernelI, modKernel_mul_Kf_right (k := ⟨k, m⟩), hα.apply_det]; congr with
  simpa [χ.inv_apply, Ring.inverse_inverse] using hP.left_mul (inv_mem (by simp [mem_intGL]))
  rw [modKernelI, modKernel, modDatum, ← hv x, ← pairWeil_integrated_right α, ← pairTheta_mul]
  repeat simp [negCount] <;> lia

attribute [local simp] carrierForm Modulus.disjoint_places_star Modulus.liftFn_one Space.lift
  name_boxIndicator carrierXi modDatum letterMinor stackedDetProd pairedDetProd matchedPoly
  pairTheta pairWeil

variable (E) {m : ℕ} [NeZero m]

lemma run79_stdClassSum_det_modKernel_eq (he : Even m) (c : _ → ℕ) : ∃ C, ∀ {𝔪 α χ},
  IsTameFor 𝔪 α (-c ·) χ → ∃ γ, ‖γ‖ ^ 2 = C / lValueProd
  𝔪.places (α⁻¹ * upsilonU1 ^ (m / 2)) (m / 2) ∧ ∀ g, γ * stdClassSum (Kf E (Fin m))
  (modKernelI (stdSpace ..) α α 𝔪 (χ ·.det) (∏ τ, letterMinor τ id id ^ c τ) g) = 1 := by
  choose C H using run79_explicit_matching (stdSpace E (Fin m)) (.sumEmpty Empty Empty) (stdSpace ..)
    (.emptySum ..) (.emptySum ..)
    (.sumEmpty ..) rfl (d := m / 2) (by simp; grind) (by simp; grind [NeZero]) (Fin <| c ·)
  refine' ⟨_, (H · (by simp) |>.imp' (· / ∫ _, 1 ∂quotMeasure (stdSpace E Empty)) fun γ ↦ .imp (by
    simpa [div_pow, ·] using div_right_comm ..) fun H g ↦ _)⟩
  field [measureReal_univ_ne_zero]
  convert! H 0 (partner_block _ _ 1) .. <;> simp [modKernel, vacElem_apply_eq_prod_lineTheta,
    @Subsingleton.eq_one (G ..), stackedDet,
    ← det_reindex_self (.emptySum ..), det_apply, ← Pi.one_def, funext_iff, prod_empty]

lemma run79_stdClassSum_carrierXi_eq_carrierForm (he : Even m) : ∃ C, ∀ {𝔪 c χ}, IsTameFor 𝔪 c 0 χ →
  ∃ γ, ‖γ‖ ^ 2 = C / (lValueProd 𝔪.places (c⁻¹ * upsilonU1 ^ m) m * lValueProd 𝔪.places
  (c * upsilonU1 ^ (m / 2)) (m / 2)) ∧ ∀ x, γ * stdClassSum (Kf ..) (fun h ↦ carrierXi m c h *
  modKernelI (signedSpace ..) (upsilonU1 ^ m) c 𝔪 (χ ·.det) 1 x h) = carrierForm E m x := by
  let J := stdSpace E (Fin m)
  obtain ⟨⟨n, _⟩, ⟨C₁, H₁⟩, C₂, H₂⟩ := exists_modKernel_neg_left J J,
    run79_stdClassSum_det_modKernel_eq E he 0, run79_explicit_matching (J.sum (signedSpace
    E (1 ⊕ᵥ -1))) (.emptySum Empty _) J.neg 1 (.trans (.emptySum ..) (.sumComm ..)) (.sumAssoc _
    (Fin (2 * m)) _) (by aesop) (d := m) (by simp +arith) (by simp; grind [NeZero]) fun _ ↦ Empty
  use C₁ * C₂; introv h
  obtain ⟨_, ⟨γ₁, _, H₁⟩, γ₂, _, H₂⟩ :=
    (χ.isOfFinOrder 𝔪.normNegOne.isUnit.isOfFinOrder).norm_eq_one,
    H₁ h.inv, H₂ (h.mul (hasWeight_upsilonU1_pow m)) (by simp)
  use γ₂ * star γ₁ * n / χ 𝔪.normNegOne ^ m, by simp_all [pow_add, ↓mul_inv, field], fun x ↦ ?_
  have := explicit_matching_of_sum _ _ ((h.mul (hasWeight_upsilonU1_pow m)).mul .one) (P := ∏ τ,
    letterMinor τ Sum.inr id ^ (2 * m)) (by
    have := star_inj.2 <| H₁ <| G.neg.symm ·
    simp [J, map_classSum, *, Units.smul_def, ← χ.star_apply'] at this
    simpa [← smul_eq_mul, ← Pi.smul_def, ← modKernelBilin_apply, ← smul_assoc]) (unitModulus _)
    le_top 1 (by intros; simpa [det_apply, two_mul, ← tsub_tsub] using! H₂ 0 ‹_› 1 (.sum (_, x)))
  simpa [by simpa using (modKernel_sum_left J (stdSpace ..) c 1 _ · · 1 (χ ·.det) 1 1 · x),
    modKernel, mul_left_comm _ _⁻¹, mul_assoc, ← mul_classSum, field]

end

#print axioms run79_exchange_theorem
#print axioms run79_explicit_matching
#print axioms run79_stdClassSum_det_modKernel_eq
#print axioms run79_stdClassSum_carrierXi_eq_carrierForm

run_cmd do
  let entries : List (Lean.Name × Lean.Name × List Lean.Name × List Lean.Name) :=
    [(``run79_exchange_theorem, ``exchange_theorem,
       [``run78_equalRankThetaRatio_value, ``exchange_of_partners],
       [``exists_equalRankThetaRatio_value]),
     (``run79_explicit_matching, ``explicit_matching,
       [``run79_exchange_theorem], [``exchange_theorem]),
     (``run79_stdClassSum_det_modKernel_eq, ``stdClassSum_det_modKernel_eq,
       [``run79_explicit_matching], [``explicit_matching]),
     (``run79_stdClassSum_carrierXi_eq_carrierForm,
       ``stdClassSum_carrierXi_eq_carrierForm,
       [``run79_stdClassSum_det_modKernel_eq, ``run79_explicit_matching],
       [``stdClassSum_det_modKernel_eq, ``explicit_matching])]
  for (candidate, original, required, forbidden) in entries do
    let info ← Lean.getConstInfo candidate
    let old ← Lean.getConstInfo original
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq old.type info.type
    unless same do
      Lean.throwError "C2 propagation type mismatch: {candidate}"
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "C2 propagation lacks proof value: {candidate}"
    let deps := value.getUsedConstants
    for name in required do
      unless deps.contains name do
        Lean.throwError "C2 propagation missing dependency {name} in {candidate}"
    for name in original :: forbidden do
      if deps.contains name then
        Lean.throwError "C2 propagation retained forbidden dependency {name} in {candidate}"
    Lean.logInfo m!"C2_PROPAGATED_CALLER: {candidate}: exact type and direct edges"

end C2Propagation
#print axioms exchange_of_partners
#print axioms exists_equalRankThetaRatio_value
#print axioms stdExchange_of_periods
#print axioms exchange_theorem
#print axioms explicit_matching
#print axioms stdClassSum_det_modKernel_eq
#print axioms stdClassSum_carrierXi_eq_carrierForm
