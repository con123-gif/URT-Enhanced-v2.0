import Statements
import New.Data.DataExist
import New.Endgame.LongForms
import New.Heights.Heights
import Mathlib.Tactic
import Lib.General.LinearAlgebra.CommonEigenvectors
import C2ValueFamilyTransport
import Lean

/-!
RUN91 — 28 November 2026. PREPARED / SOURCE-MATCHED, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484. AGENTS, protocol, handoff,
expansion, continuity and relevant peers read. Latest integration finite
shell fcca937a and Galois finite budget daec59c9 use other pending callers;
do not claim either accepted.

New result: isolate the preferred squared C-to-star replay from the old
RUN86/RUN87 square-root caller build. In RUN90 the C statement has an
exact native term transport, but the module imported the entire combined
junction including root-extraction lemmas. The current RUN89 driver also
compiles RUN86/RUN87 before reaching its original star control, so any
failure of a superseded caller blocks the preferred path. Here copy ONLY
the two accepted archimedean proof bodies from C2_SINGLE_WITNESS_COMBINED
(blob 4be058901f7072efd82b3711281fae7b913f1712), retain exact RUN90 term transport
(blob 219d15c8bc056809aa275052e0d084dae4b2ad86), and reconstruct BOTH original and
squared star from the pinned source New/Main.lean (blob
198ed5bf26aa294898931e0649bc2b88f1389f65) without importing New.Main. No old caller
module, root extraction helper, or failed C1 budget module is imported.
Compile this instead of RUN86/87/88 for the preferred path; replay old
variants separately when comparing their full graphs. No duplicate cold
build and no modification of previous artifacts.

Exact premises: original HeightLe c 1; all complex automorphisms,
nonzero witness and all local norms. Same D, same admissible P, same
independent y, rank n, index, fit family and signed heights as native C.
Use U²W for nonzero global witnesses U,W and r²·r⁻²=1 before norms;
0<=2(a+c) and b<=L imply V+2delta>=d(H-3L). The actual original star
body has just the declaration rename and C supplier change. Preserve
all original A/B family, positivity, scale and rank-deficit suppliers.
Result: m*remainder <= logB²*budget, for every native D, not just an
initial datum before the analytic second-scale selection. No additional
mathematical premise; no new proof of C1/C3 or analytic implication.

Executed connector checks: extracted the two unchanged proof bodies;
two original/star source round-trips exact, three negative controls
(already edited name, already edited caller, duplicated original) rejected.
The three absent helper names in the RUN90 guard are now literal Name
quotations, not elaborated constants, so they need not be declared.
Source checks only. Local command -v lean/lake empty, GitHub DNS fails.
Actual accepted C2 family receipt re-read:
413058eacfda8683f5fb28c68148fd45d1bf1770, run 46055305146,
193451 union nodes, 12 roots, 82 guards, zero missing.
Artifact 15234434421 listed unexpired, 900881325 bytes outer archive.
The archived archimedean proof pair has prior local receipt and
complete audit (integration/2026-11-27_COMMON_WITNESS_KERNEL_JUNCTION.md,
a47f99d3cf3556d05410297fa28754c44b321503); this separately compiled
module has NOT been replayed. C1 budget split failed in the same shared
run. No new native engine/graph/axiom execution here, no root discharge.
The source control is a separate elaboration, not the original upstream
New.Main object. Do not infer global removal from imports/direct guards.

RESUME HERE: in the authenticated retained compact workspace for RUN89,
restore original objects and C2ValueFamilyTransport exactly as in its
preflight, extend only missing LongForms/DataExist/Statements, then
stage THIS file as C2SquaredStarMinimal and compile with ordinary kernel
checking. Require actual exit 0, RUN91_SQUARED_STAR marker and six standard
axiom reports; export strict constructor-inclusive original/revised C
and star graph, plus archimedean pair if useful. Watch the old C, fit,
HeightLe.nonneg, root helpers and retained original row-height, rank,
family and denominator suppliers; record actual membership instead of
assuming exclusions. This bypasses pending old caller modules but does
not replace the retained RUN89 comparison history. If accepted, use
the exact C statement at integration's finite-shell common star
(fcca937a); separately validate Galois late/finite budget before changing
fit supplier. No Main import and no full RH claim.
HANDOFF TO integration/kernel/audit. All root obligations remain OPEN.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Filter Finset Real

lemma c2_isAlgebraic_of_arch {x : ℂ} {c : ℝ}
    (h : ∀ σ : ℂ ≃+* ℂ, ‖σ x‖ ≤ c) : IsAlgebraic ℚ x := by
  obtain ⟨_, _, ⟨k⟩⟩ := (Polynomial.basisMonomials ℚ).1.injective.countable,
    ((Algebraic.countable ℚ ℂ).dense_compl ℂ).exists_mem_open
    (continuous_norm.1 _ isOpen_Ioi) (NormedField.exists_lt_norm ℂ c)
  simp [isAlgebraic_iff_not_injective] at *
  intro t
  obtain ⟨σ, hσ⟩ := exists_ringEquiv_extend (L := ℂ) rfl _ _ t k
  grind [by simpa using hσ .X]

open Filter Finset IntermediateField Module Real AdjoinSimple

lemma c2_heightLe_nonneg_arch {c : ℝ} (h : HeightLe c 1) : 0 ≤ c := by
  choose H _ _ d _ f _ g using by simpa [HeightLe] using h
  have := @NumberField.mk _ _ _ (adjoin.finiteDimensional
    (c2_isAlgebraic_of_arch d).isIntegral)
  have k {F c} [NormedField F] [CharZero F] [IsAlgClosed F] (e : _ = _)
      (h : ∀ ι : _ ≃+* F, ‖ι H‖ ≤ exp c) :=
      show ‖algebraMap ℚ F (Algebra.norm ℚ (gen ℚ H))‖.log / finrank ℚ ℚ⟮H⟯ ≤ c by
    grw [Algebra.norm_eq_prod_embeddings, norm_prod, prod_le_prod₀ _ fun σ _ ↦
      (exists_ringEquiv_extend e ℚ⟮H⟯.val σ.1).choose_spec ⟨H, _⟩ ▸ h _] <;>
      simp_all [finrank_pos.ne', prod_pos, Subtype.ext_iff]
  grw [← g _ le_self_add, ← k rfl d, ← sum_le_sum fun l h ↦ @Padic.eq_padicNorm l .. ▸
    @PadicAlgCl.norm_extends .. ▸ k (@mk_complex_eq_mk_padicAlgCl ..)
    (f ⟨⟨l, (mem_filter.1 h).2⟩, ·⟩)]
  simp [← sum_div, field]
  rw [log_product_formula (Nat.le_add_left ..), zero_div]

open Lean in
run_cmd do
  let oldName := ``Data.integral_forms_long
  let newName := `Data.run90_squared_witness_integral_forms_long
  let pairs : List (Name × Name) :=
    [(``exists_isFitFamily, ``c2_exists_isFitFamily),
     (``HeightLe.nonneg, ``c2_heightLe_nonneg_arch)]
  let old ← Lean.getConstInfo oldName
  let some value := old.value? (allowOpaque := true) |
    Lean.throwError "RUN90 missing native C proof body"
  for (a,b) in pairs do
    let orig ← Lean.getConstInfo a
    let repl ← Lean.getConstInfo b
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq orig.type repl.type
    unless orig.levelParams == repl.levelParams && same do
      Lean.throwError "RUN90 complete supplier statement changed: {a}"
    unless value.getUsedConstants.contains a do
      Lean.throwError "RUN90 missing original direct supplier: {a}"
  let revised := value.replace fun e ↦
    match e with
    | .const n us =>
      match pairs.find? (fun p ↦ p.1 == n) with
      | some p => some (.const p.2 us)
      | none => none
    | _ => none
  let deps := revised.getUsedConstants
  for (a,b) in pairs do
    unless deps.contains b do
      Lean.throwError "RUN90 replacement supplier missing: {b}"
    if deps.contains a then
      Lean.throwError "RUN90 old direct supplier retained: {a}"
  for required in [``HeightLe.pow, ``HeightLe.mul, ``HeightLe.mono,
      ``Data.heightLe_volume_rows, ``Data.heightLe_volume_ratio_sq,
      ``Data.volume_iota_eq_prod_liftVolume] do
    unless deps.contains required do
      Lean.throwError "RUN90 required direct supplier missing: {required}"
  for forbidden in [oldName, `c2_heightLe_of_sq,
      `c2_norm_map_le_exp_half, `c2_heightLe_single_witness_budget] do
    if deps.contains forbidden then
      Lean.throwError "RUN90 unwanted direct supplier: {forbidden}"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := newName
    levelParams := old.levelParams
    type := old.type
    value := revised
  })
  Lean.logInfo "RUN90_SQUARED_WITNESS: exact native C statement; signed squared cancellation; direct fit and archimedean suppliers"

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

lemma run91_original_star_control {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  D.exists_family_covolumeSq_le.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  -- `d` is the dimension, `L = f a log⁴ b` the unit of error, `exp h` the bound per form
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  set h := D.mainHeight - D.m * D.remainder + L with def_h
  have crude : -h ≤ D.b ^ 2 * D.x ^ 99 := by
    grw [def_h, ← abs_mainHeight_add_remainder_le, ← neg_le_abs, ← le_abs_self,
      ← (HasLogBound.pos D : 0 < L)]
    simp
  have both : d * (D.mainHeight - 3 * L) ≤ d * (D.mainHeight - D.m * D.remainder + L + 4 *
    D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ d * h + (d - n) * -h + 2 * δ := (integral_forms_long i big I short).trans_eq (by ring)
                    -- the missing dimensions are a share `4 / b²`, and the index is small
    _ ≤ d * h + 4 / D.b ^ 2 * d * (D.b ^ 2 * D.x ^ 99) + 2 *
      (5 * d * log (1 + D.b ^ 2) * D.budget) := by
      grw [crude, index, show d - n ≤ 4 / D.b ^ 2 * d by linarith]
      exact sub_nonneg.2 (mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank : (n : ℝ) ≤
        D.rowDim)
    _ = _ := by rw [def_h]; field [exp_ne_zero]
  -- divide by `d`; `h_main` cancels
  calc D.m * D.remainder ≤ 4 * L + 4 * D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget := by
        linarith [le_of_mul_le_mul_left both d0]
    _ ≤ _ := D.le_of_hasLogBound

lemma run91_squared_star_inequality {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  D.exists_family_covolumeSq_le.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  -- `d` is the dimension, `L = f a log⁴ b` the unit of error, `exp h` the bound per form
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  set h := D.mainHeight - D.m * D.remainder + L with def_h
  have crude : -h ≤ D.b ^ 2 * D.x ^ 99 := by
    grw [def_h, ← abs_mainHeight_add_remainder_le, ← neg_le_abs, ← le_abs_self,
      ← (HasLogBound.pos D : 0 < L)]
    simp
  have both : d * (D.mainHeight - 3 * L) ≤ d * (D.mainHeight - D.m * D.remainder + L + 4 *
    D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ d * h + (d - n) * -h + 2 * δ := (Data.run90_squared_witness_integral_forms_long i big I short).trans_eq (by ring)
                    -- the missing dimensions are a share `4 / b²`, and the index is small
    _ ≤ d * h + 4 / D.b ^ 2 * d * (D.b ^ 2 * D.x ^ 99) + 2 *
      (5 * d * log (1 + D.b ^ 2) * D.budget) := by
      grw [crude, index, show d - n ≤ 4 / D.b ^ 2 * d by linarith]
      exact sub_nonneg.2 (mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank : (n : ℝ) ≤
        D.rowDim)
    _ = _ := by rw [def_h]; field [exp_ne_zero]
  -- divide by `d`; `h_main` cancels
  calc D.m * D.remainder ≤ 4 * L + 4 * D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget := by
        linarith [le_of_mul_le_mul_left both d0]
    _ ≤ _ := D.le_of_hasLogBound

open Lean in
run_cmd do
  let roots := #[``c2_isAlgebraic_of_arch, ``c2_heightLe_nonneg_arch,
    ``Data.integral_forms_long, ``Data.run90_squared_witness_integral_forms_long,
    ``run91_original_star_control, ``run91_squared_star_inequality]
  for n in roots do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext, ``Classical.choice, ``Quot.sound].contains a) do
      throwError "RUN91 nonstandard axiom: {n}"
  for (a,b) in #[(``HeightLe.nonneg, ``c2_heightLe_nonneg_arch),
      (``Data.integral_forms_long, ``Data.run90_squared_witness_integral_forms_long),
      (``run91_original_star_control, ``run91_squared_star_inequality)] do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless same && ai.levelParams == bi.levelParams do
      throwError "RUN91 statement changed: {a} -> {b}"
  let .thmInfo old ← getConstInfo ``run91_original_star_control |
    throwError "RUN91 missing baseline proof"
  let .thmInfo new ← getConstInfo ``run91_squared_star_inequality |
    throwError "RUN91 missing candidate proof"
  let deps := new.value.getUsedConstants
  let oldDeps := old.value.getUsedConstants
  unless oldDeps.contains ``Data.integral_forms_long &&
      deps.contains ``Data.run90_squared_witness_integral_forms_long &&
      !deps.contains ``Data.integral_forms_long &&
      !deps.contains ``run91_original_star_control do
    throwError "RUN91 actual C caller missing or stale"
  for name in #[``Data.exists_family_covolumeSq_le, ``Data.finrank_rows_ne_zero] do
    unless deps.contains name && oldDeps.contains name do
      throwError "RUN91 original A/B supplier lost: {name}"
  let .thmInfo h ← getConstInfo ``c2_heightLe_nonneg_arch |
    throwError "RUN91 missing archimedean product formula"
  let hd := h.value.getUsedConstants
  unless hd.contains ``c2_isAlgebraic_of_arch && hd.contains ``log_product_formula &&
      !hd.contains ``HeightLe.nonneg && !hd.contains `isAlgebraic_of_padic do
    throwError "RUN91 wrong archimedean product formula suppliers"
  logInfo "RUN91_SQUARED_STAR: exact C and star statements, actual A/B/C callers, standard axioms"

#print axioms c2_isAlgebraic_of_arch
#print axioms c2_heightLe_nonneg_arch
#print axioms Data.integral_forms_long
#print axioms Data.run90_squared_witness_integral_forms_long
#print axioms run91_original_star_control
#print axioms run91_squared_star_inequality
