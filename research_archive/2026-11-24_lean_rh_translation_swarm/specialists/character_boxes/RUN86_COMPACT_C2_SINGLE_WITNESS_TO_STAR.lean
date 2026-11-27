import New.Endgame.LongForms
import C2SingleWitnessCombined
import Lean

/-!
RUN86 — attach the accepted single-global-witness budget to the actual
Theorem C and star. PREPARED, NOT kernel checked. 27 November 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
LongForms blob 9eff36cf003ac398fbd24361e80e95a03d0b0e05; RowVolume blob
925de9c592b40763516e70ddeae48b4ad1a35b88 (actual Z ϑ : z(ϑ) ≠ 0 ∧ ...).
Heights blob a18a99e1f76a6e963113cae8f906ddc99814f518.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
RUN85 blob 0f4ccdf8f74a7f868b6d1d8403235fd7a84f17ae.
Single-witness combined source blob 4be058901f7072efd82b3711281fae7b913f1712,
SHA256 364fefe544e5d0064fdc725e157133b2d5ae1b6d36471d035bc799154c4d0005.
Stage exact accepted combined source as module C2SingleWitnessCombined.
Local receipt: integration/2026-11-27_single_witness_receipt/README.md
(exit 0, eight axiom reports); full four-root graph receipt has 19 guards,
zero missing references and standard axioms. Those are prior peer results,
NOT execution of this caller.

Derivation: for the same actual θ and D, define rι=z(θι)/z(1),
a=V+2δ+db and c=d(2L-H), with L=logB*budget. RowVolume supplies both
nonzero factors for every ι, including the untwisted denominator.
The actual two HeightLe statements become HeightLe a r and
HeightLe (2*c) (r⁻¹^2) by exact field identities BEFORE norms. The
accepted one-root junction yields 0≤a+c. Thus V+2δ≥d(H-2L-b)
and b≤L gives the original Theorem C. No new sign premise on a or c,
no replacement of algebraic witnesses by independent local choices.
The original proof doubles the first height; this uses the accepted
global-square-root lemma to halve the second instead and replaces its
original product-formula proof by the accepted archimedean route.

Unlike RUN85, this isolated caller retains original exists_isFitFamily
and both original height suppliers, so it can be replayed independently
of the new value-family transport. Once both are checked, replace the
original fit-family constant with c2_exists_isFitFamily in the elaborated
RUN86 proof value, after universe and complete-type equality guards,
using the exact C2_VALUE_FAMILY_TRANSPORT method. Do NOT import Main.
No claim of global absence of original HeightLe.nonneg or exchange:
alternate suppliers may still reach them. Preserve all A/B/C and analytic
obligations; this is a local junction attachment, not new RH mathematics.

Actual executed static checks in connector JS: exact pinned original
Theorem C recovered from RUN85 by reversing its 2 edits; one unique
junction block replacement and one rename with exact round trip;
two star substitutions with exact round trip; absent-block negative
control rejected. No native Lean/lake available here. No new rh_scan,
rh_prune, rh_reduce/auto, axiom or full graph execution. Shared C1 run
46055305146 actual jobs API checked: run job still in_progress,
no current PASS for fit-family transport. Do not launch duplicate build.

RESUME HERE: stage the authenticated C2SingleWitnessCombined module and
compile RUN86 against shared original LongForms dependencies; inspect
both axiom reports, complete Theorem C type and direct guards, then
export the original/new constructor-inclusive Theorem C closures.
If failure, preserve actual compiler output and repair exact failing
line before combining with RUN85. Full RH remains OPEN.
HANDOFF TO integration/native runner/audit.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

section LongForms
open Finset LinearMap Real Submodule LevelPlaces.LevelForm

variable {P} {D : Data P} {n} {y : Fin n → _} {δ V} (i : LinearIndependent ℂ y) (hn :
  (1 - 4 / D.b ^ 2) * D.rowDim ≤ n) (I : D.IndexLe y δ) (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i hn I hV

lemma Data.run86_single_witness_integral_forms_long : D.rowDim * (D.mainHeight - 3 * (D.logB * D.budget)) ≤
  V + 2 * δ := by
  -- one twist `θ ι` for each `ι`, with the congruence bounds; the volumes do not vanish
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  -- Use the actual signed reciprocal budget; no absolute heights.
  let r : PrimePadicIso → ℂ := fun ι ↦ D.𝔷 (θ ι) / D.𝔷 (1 : D.MFoldTwist)
  have hr : ∀ ι, r ι ≠ 0 := fun ι ↦ div_ne_zero (Z (θ ι)).1 (Z 1).1
  have hp : HeightLe (V + 2 * δ + D.rowDim * D.b) r :=
    heightLe_volume_rows i hn I hV o
  have hm : HeightLe (2 * ((D.rowDim : ℝ) *
      (2 * (D.logB * D.budget) - D.mainHeight))) (r⁻¹ ^ 2) :=
    (heightLe_volume_ratio_sq o).mono (le_of_eq (by ring)) (by
      intro ι
      simp only [r, Pi.pow_apply, Pi.inv_apply, inv_div, div_pow, le_refl])
  have formula : 0 ≤ (V + 2 * δ + D.rowDim * D.b) +
      D.rowDim * (2 * (D.logB * D.budget) - D.mainHeight) :=
    c2_heightLe_single_witness_budget hp hm hr
  linarith [(by gcongr; exact D.le_of_hasLogBound : D.rowDim * D.b ≤
    D.rowDim * (D.logB * D.budget))]

end LongForms

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

lemma run86_single_witness_star_inequality {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
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
    _ ≤ d * h + (d - n) * -h + 2 * δ := (Data.run86_single_witness_integral_forms_long i big I short).trans_eq (by ring)
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

example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  run86_single_witness_star_inequality

#print axioms Data.run86_single_witness_integral_forms_long
#print axioms run86_single_witness_star_inequality

open Lean in
run_cmd do
  let old ← Lean.getConstInfo ``Data.integral_forms_long
  let candidate ← Lean.getConstInfo ``Data.run86_single_witness_integral_forms_long
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq old.type candidate.type
  unless old.levelParams == candidate.levelParams && same do
    Lean.throwError "RUN86 complete original Theorem C type changed"
  let entries : List (Name × List Name × List Name) := [
    (``Data.run86_single_witness_integral_forms_long,
      [``c2_heightLe_single_witness_budget, ``exists_isFitFamily,
        ``Data.heightLe_volume_rows, ``Data.heightLe_volume_ratio_sq,
        ``Data.volume_iota_eq_prod_liftVolume],
      [``HeightLe.nonneg, ``Data.integral_forms_long]),
    (``run86_single_witness_star_inequality,
      [``Data.run86_single_witness_integral_forms_long, ``Data.exists_family_covolumeSq_le],
      [``Data.integral_forms_long])]
  for (name, required, forbidden) in entries do
    let info ← Lean.getConstInfo name
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "RUN86 no proof body: {name}"
    for dep in required do
      unless value.getUsedConstants.contains dep do
        Lean.throwError "RUN86 expected direct dependency {dep} missing in {name}"
    for dep in forbidden do
      if value.getUsedConstants.contains dep then
        Lean.throwError "RUN86 old direct dependency {dep} in {name}"
    Lean.logInfo m!"RUN86_SINGLE_WITNESS: {name}: exact direct suppliers"
