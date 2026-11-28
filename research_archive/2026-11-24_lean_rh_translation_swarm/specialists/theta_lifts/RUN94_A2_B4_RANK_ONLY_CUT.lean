import New.Filling.FillingTheorem
import Lean

/-!
RUN94 — complementary rank-only cut at the actual B4 caller. 28 November 2026.
HUMAN SOURCE-MATCHED / PREPARED, not native checked.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION, current ledger and spine.
Latest peers 974dc121 (A1 single determinant), fcca937a (B3 common star),
cf80e55a (prime endpoint); distinct scopes. Reuse existing candidates.

RUN93 removed rank calculation from A2 short-span. The complementary
actual B4 caller uses ONLY the rank half, not all-conjugate shortness or
p-adic integrality. For V=D.Column, T_s=D.ramifyingOp s, v=dim V and
k=v/(D.N-1), the estimate consumed by B4 is
  dim(T_s^{-1}F) <= dim F + |s| k.
For A:V->V, dim A^{-1}F <= dim F + dim ker A:
restrict A to its inverse image of F and use rank-nullity (image in F).
For each native A_w=1-z_w, retained Data.finrank_ker_one_sub_centralGen_le
supplies dim ker A_w <= k. T_empty=1 gives equality. For w notin s,
T_{insert w s}=A_w T_s, and (A_w T_s)^{-1}F=T_s^{-1}(A_w^{-1}F).
Apply induction at A_w^{-1}F, then the one-factor bound.
This extracts the original rank branch, with independent shortness proof
and quantifiers removed. No new premise, weakened numerical condition,
or choice; no commutation beyond native product definition. The RUN82
freeness leaf remains pending and can later retarget the retained bound.

The B4 caller is copied with one supplier substitution; its row-positivity
consumer likewise. Same Poincare map, scale c : C^×, D, goodProjTranslate,
Fits.exists_translate_finrank_comap_le, mass and level/size guards.
Integration should transport ONLY the new rank-supplier edge into its
existing connected B4 proof, not reset the current B2/B3 star.

Actual pinned sources:
ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76
ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
Source checks executed in connector JS: 11 unique exact anchors,
22/22 removed/duplicated anchor controls rejected, two caller
substitutions reversed exactly; rank branch extracted from actual source.
Original source-visible edges:
 short_forms -> span_short_ramifiedColumns -> joint(.2)
 enough_forms -> ramifiedColumns_fill_rows -> joint(.1)
              -> finrank_rows_ne_zero -> ramifiedColumns_fill_rows.
 joint -> finrank_ker_one_sub_centralGen_le AND IsShort.sub_translate.
Proposed graph: RUN93 A side -> short-only -> IsShort.sub_translate;
RUN94 B side -> rank-only -> finrank_ker_one_sub_centralGen_le.
Keep original edges/evidence and all other suppliers. Source edges
are not exhaustive kernel reachability; no transitive deletion claim.
Actual shared receipts re-read: A1 retry ERROR 9838f1d1c9d36c9906c2736d5d8d4f08fe98042f
run 46075703055, earlier shared ERROR 07a2b14930c38095e6771ae9ed1a10a3cf1bf678
run 46023465491. Artifact 15236761794, RUN66 intake and RUN92 leaf
replay pending. Local container has no lean/lake or mounted cache.
No native rh_scan/prune/reduce/auto/frontier, new axiom or kernel PASS,
or URT performance claim. All A1-A3/B1-B4/C/D/E/V obligations remain.

RESUME HERE: in authorized restored original compact workspace,
execute RUN92 leaf replay first and repair its first actual failure.
Then compile RUN93 and this file, require THETA94_RANK_CUT_GUARDS_OK
and THETA93_SHORT_SPAN_GUARDS_OK, export original/reduced branch
graphs, hand off only accepted rank supplier to existing B4 integration
(fcca937a), retaining other replacements. No duplicate cold build,
workflow edit or Main import. HANDOFF TO kernel/integration/audit.
A2/B4/star/RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

section RankOnly
open Module Finset Fintype Matrix MvPolynomial NumberField Representation Space Submodule Valued
namespace Data
variable {P} (D : Data P)

lemma ramifyingOp_finrank_comap_run94 s p : finrank ℂ (Submodule.comap (D.ramifyingOp s) p) ≤
  finrank ℂ p + #s * (D.N - 1 : ℝ)⁻¹ *
  finrank ℂ D.Column := by
  induction' s using cons_induction with w s _ a generalizing p
  · rw [(by simp [ramifyingOp] : D.ramifyingOp ∅ = 1)]; simp
  · erw [card_cons, ramifyingOp, prod_cons, map_mul, map_sub, map_one, asAlgebraHom_of,
      p.comap_comp (D.ramifyingOp s)]
    grw [a _, (by simpa [↓← finrank_eq_rank, ← Nat.cast_add] using
      (1 - D.centralRep (D.centralGen w)).lift_rank_comap_le :), Nat.cast_add,
      finrank_ker_one_sub_centralGen_le]; grind

end Data
end RankOnly

section ActualConsumers
open Filling Module Submodule
variable {P} (D : Data P) (c : ℂˣ)

lemma Data.ramifiedColumns_fill_rows_run94 :
  IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (D.b ^ 2)⁻¹ := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound : D.b ^ 9 ≤ D.N - 1)
  have h := Fits.exists_translate_finrank_comap_le (ρ :=
    .comp (D.principalRep _) (.mk' _ (by tauto))) (fun _ _ _ ↦ Space.inner_formRep ..) (fun _ ↦
    (D.filling_fits.petersson_poincare · · (@reduceFamily_liftResidue ..))) (fun _ ↦
    isCentralProj_sum_tupleIdem) (fun i ↦ (bad_share_le (M := P.Mω D.s) (q := D.g i) _ (9 * D.logB)
    (card_resField_eq_levelPrime _ i) rfl (card_chosenPlaces _ i) D.nat_lt_of_hasLogBound
    D.nat_lt_of_hasLogBound D.le_of_hasLogBound le_rfl D.le_of_hasLogBound).trans
    (filling.eq_1 D ▸ D.le_of_hasLogBound)) (measureReal_pos_of_isLevel (K := D.chosenLevel))
  erw [(?_ : Representation.asAlgebraHom _ _ = (principalRep ..).asAlgebraHom D.e₀), Shape.r,
    card_rowIndex, ← Nat.card_congr (.piCurry _)] at h
  simp_rw [IsSpread, ← D.columnCoords.finrank_eq, ← (D.columnCoords.ofSubmodule' _).finrank_eq] at h
  refine fun F ↦ (h D.finrank_rows_le_mass F).imp' Sigma.uncurry fun _ h ↦
    .trans (mod_cast finrank_mono fun _ ↦ by simpa using!
    id) ((D.ramifyingOp_finrank_comap_run94 .univ _.trans (add_le_add h le_rfl)).trans ?_)
  simp [← add_mul, add_assoc, card_piPlaces, filling]; gcongr; use D.le_of_hasLogBound
  open Fint in simp_rw [asAlgebraHom_eq_sum, reindex_equiv (Equiv.piCurry _)]
  simp [e₀, goodTupleFamilies, tupleIdem, Finset.prod_univ_sum, Fintype.prod_sigma]; rfl

lemma Data.finrank_rows_ne_zero_run94 : finrank ℂ D.rows ≠ 0 := fun e ↦ (D.ramifiedColumns_fill_rows_run94 1
  ⊤).rec fun _ ↦ by erw [finrank_top, e]; norm_num [finrank_pos_iff.2 D.columnCoords.nontrivial,
  ← lt_tsub_iff_left]; use D.lt_of_hasLogBound

end ActualConsumers

#print axioms Data.ramifyingOp_finrank_comap_run94
#print axioms Data.ramifiedColumns_fill_rows_run94
#print axioms Data.finrank_rows_ne_zero_run94

run_cmd do
  let pairs := #[(``Data.ramifiedColumns_fill_rows, ``Data.ramifiedColumns_fill_rows_run94),
    (``Data.finrank_rows_ne_zero, ``Data.finrank_rows_ne_zero_run94)]
  for (old, fresh) in pairs do
    let a ← Lean.getConstInfo old
    let b ← Lean.getConstInfo fresh
    unless a.levelParams == b.levelParams do
      Lean.throwError m!"THETA94 universe mismatch {fresh}"
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq a.type b.type
    unless same do
      Lean.throwError m!"THETA94 changed original statement {fresh}"
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for n in #[``Data.ramifyingOp_finrank_comap_and_short, ``Data.ramifyingOp_finrank_comap_run94,
      ``Data.ramifiedColumns_fill_rows, ``Data.ramifiedColumns_fill_rows_run94,
      ``Data.finrank_rows_ne_zero, ``Data.finrank_rows_ne_zero_run94] do
    let ax ← Lean.collectAxioms n
    unless ax.all (fun x => allowed.contains x) do
      Lean.throwError m!"THETA94 unexpected axioms {n}: {ax}"
    let some v := (← Lean.getConstInfo n).value? (allowOpaque := true) |
      Lean.throwError m!"THETA94 missing value {n}"
    for d in v.getUsedConstants do
      Lean.logInfo m!"THETA94_VALUE_EDGE|{n}|{d}"
  let some rankv := (← Lean.getConstInfo ``Data.ramifyingOp_finrank_comap_run94).value? (allowOpaque := true) |
    Lean.throwError "THETA94 missing rank"
  let some oldv := (← Lean.getConstInfo ``Data.ramifiedColumns_fill_rows).value? (allowOpaque := true) |
    Lean.throwError "THETA94 missing old caller"
  let some newv := (← Lean.getConstInfo ``Data.ramifiedColumns_fill_rows_run94).value? (allowOpaque := true) |
    Lean.throwError "THETA94 missing new caller"
  let some nzv := (← Lean.getConstInfo ``Data.finrank_rows_ne_zero_run94).value? (allowOpaque := true) |
    Lean.throwError "THETA94 missing positivity"
  let ds := rankv.getUsedConstants
  let os := oldv.getUsedConstants
  let ns := newv.getUsedConstants
  unless ds.contains ``Data.finrank_ker_one_sub_centralGen_le &&
      !ds.contains ``IsShort.sub_translate &&
      !ds.contains ``Data.ramifyingOp_finrank_comap_and_short do
    Lean.throwError "THETA94 rank-only edge guard"
  unless os.contains ``Data.ramifyingOp_finrank_comap_and_short &&
      ns.contains ``Data.ramifyingOp_finrank_comap_run94 &&
      !ns.contains ``Data.ramifyingOp_finrank_comap_and_short &&
      !ns.contains ``Data.ramifiedColumns_fill_rows do
    Lean.throwError "THETA94 spread edge guard"
  unless nzv.getUsedConstants.contains ``Data.ramifiedColumns_fill_rows_run94 &&
      !nzv.getUsedConstants.contains ``Data.ramifiedColumns_fill_rows do
    Lean.throwError "THETA94 positivity edge guard"
  Lean.logInfo "THETA94_RANK_CUT_GUARDS_OK"
