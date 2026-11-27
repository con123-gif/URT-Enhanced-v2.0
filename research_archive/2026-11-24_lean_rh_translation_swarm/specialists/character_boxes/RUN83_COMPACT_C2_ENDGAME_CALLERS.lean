import New.Endgame.LongForms
import C2HeightCaller

/-!
RUN83 — C2 endgame consumer attachment; PREPARED, not kernel checked.
27 November 2026. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Source New/Endgame/LongForms.lean blob 9eff36cf003ac398fbd24361e80e95a03d0b0e05;
New/Main.lean blob 198ed5bf26aa294898931e0649bc2b88f1389f65 (read only, NOT imported).
Mission/spine/obligations blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
24b10d71aff1d6d8075e7629a1710c1b0cc7a969,
c40f1debc6872fb9e1f080a90c39d94e0b1caffe.

Prior receipt integration/2026-11-27_c2_third_native_receipt/
c2_replacement_results.json reports actual exit 0 for the six C2Combined
declarations, standard axioms, five type/edge guards, 126.63 seconds.
C2Combined object SHA256:
9ee60a0ff16a5f1fd6756906e050081de2b0f7afba39334b0534e436b4f46df3.
RUN82_COMPACT_HEIGHT_CALLER_PROPAGATION.lean blob
5911495ccf793363b06747699e712ac3d959b531 is still PREPARED, no receipt
found in the live ledger or registered C2 queue. Compile that exact
source as module C2HeightCaller first, with its authenticated imports.
No duplicate cold build. Peer 39fd901b367a667d606eb0838001c8b02f894c7b
continues the separate restricted determinant attachment, with failures
preserved. Do not conflate it with the accepted general C2Combined route.

This delta propagates RUN82's single-lift theorem through the actual
m-lift product, Theorem C and star inequality. Each declaration has the
original source statement and proof apart from its name and ONE supplier
reference. No new premises; no import New.Main or the claimed RH theorem.
Same D, theta (one fit family), j, y, delta, V, denominator, embeddings,
nonzero chain volume and signed budgets. In particular HeightLe is signed:
do not use nonneg on individual ratios. Only the exact product
 (z(theta)/z(1))^2 * (z(1)^2/z(theta)^2) = 1
is certified nonnegative by the product formula. The native proof already
uses this cancellation; not claimed as novel. The full rank/scale guards
and A/B existence supplier remain unchanged. No proof of E1, no RH closure.
The alternate positive height branch (crude_rows and one_determinant),
volume_iota_eq_prod_liftVolume, fit-family existence, and all A/B inputs
remain original suppliers, not established here.

Static execution in connector JS: 3 actual declaration blocks extracted
from exact source blobs; 6 unique substitutions (3 names, 3 caller
references), all 3 inverse edits restore source blocks exactly after
trailing whitespace trim. Native Lean/lake absent in this environment;
no new kernel, axiom or graph result; no rh_scan/prune/reduce/auto result.
Two complete original-type and three direct body-dependency guards below
are prepared, not executed. Star original type is reproduced literally
and a typed alias probe included, avoiding importing New.Main just to
compare it. Require a separate original-vs-replacement graph from
independently compiled source if feasible; do not assume old targets
absent transitively from the alternate branches.

RESUME HERE: shared runner compile authenticated RUN82 as C2HeightCaller
then this file; inspect all nine declaration axioms, all six RUN82 and
three RUN83 guards, export constructor-inclusive old/new height and
Theorem C graphs (star comparison separately without importing Main
into the replacement environment); preserve failures and alternate old
Carrier paths. No further scalar re-expression until this replay.
HANDOFF TO integration / native runner / independent audit.
-/

section LongForms
open Finset LinearMap Real Submodule LevelPlaces.LevelForm

variable {P} {D : Data P} {n} {y : Fin n → _} {δ V} (i : LinearIndependent ℂ y) (hn :
  (1 - 4 / D.b ^ 2) * D.rowDim ≤ n) (I : D.IndexLe y δ) (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

lemma Data.run83_heightLe_volume_ratio_sq {θ} (o : D.IsFitFamily θ) : HeightLe (2 * D.rowDim *
  (2 * (D.logB * D.budget) - D.mainHeight)) fun ι ↦ D.𝔷 (1 : D.MFoldTwist) ^ 2 / D.𝔷 (θ ι) ^ 2 := by
  -- `vol : 𝔷 ϑ = ‖c ϑ‖ ^ D ∏ⱼ λⱼ ϑ`
  choose c const _ vol using D.volume_iota_eq_prod_liftVolume
  -- each of the `m` lifts has height `D k (log b B₀ - 𝖴)`; `m k B₀ = budget` and `m k 𝖴 = h_main`
  have lifts : HeightLe (D.rowDim * (D.logB * D.budget - D.mainHeight))
      (∏ j ∈ Icc 1 D.m, fun ι ↦ D.liftVolume 1 j / D.liftVolume (θ ι) j) := (HeightLe.prod
    fun j h ↦ by exact Data.run82_heightLe_liftVolume_ratio o ⟨j, mem_Icc.1 h⟩).mono
    (by simp [mainHeight]; field_simp [(HasLogBound.pos D).ne']; rfl) fun _ ↦ le_rfl
  -- the constants have height `2 m² t x ^ 999`
  have consts : HeightLe (2 * (D.logB * D.budget)) fun ι ↦ (‖c (θ ι) / c 1‖ ^ 2 :)⁻¹ :=
    (const θ o).mono (by simpa using D.le_of_hasLogBound) fun _ ↦ le_rfl
  exact ((lifts.pow 2).mul (consts.pow D.rowDim)).mono (by grind) fun ι ↦
    (congrArg (‖ι.2 ·‖) (by simp [vol, mul_pow, div_pow, ← pow_mul]; ring)).le

include i hn I hV

lemma Data.run83_integral_forms_long : D.rowDim * (D.mainHeight - 3 * (D.logB * D.budget)) ≤
  V + 2 * δ := by
  -- one twist `θ ι` for each `ι`, with the congruence bounds; the volumes do not vanish
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  -- `(𝔷 θ / 𝔷 1)² (𝔷 1² / 𝔷 θ²) = 1`, heights add, and the height of `1` is `≥ 0`
  have formula : 0 ≤ 2 * (V + _ + _) + _ := ((((heightLe_volume_rows i hn I hV o).pow 2).mul
    (Data.run83_heightLe_volume_ratio_sq o)).mono le_rfl (by simp [field]; simp [(Z _).1])).nonneg
  linarith [(by gcongr; exact D.le_of_hasLogBound : D.rowDim * D.b ≤
    D.rowDim * (D.logB * D.budget))]

end LongForms

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

lemma run83_star_inequality {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
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
    _ ≤ d * h + (d - n) * -h + 2 * δ := (Data.run83_integral_forms_long i big I short).trans_eq (by ring)
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
  run83_star_inequality

#print axioms Data.run83_heightLe_volume_ratio_sq
#print axioms Data.run83_integral_forms_long
#print axioms run83_star_inequality

open Lean in
run_cmd do
  let entries := [
    (``Data.run83_heightLe_volume_ratio_sq, some ``Data.heightLe_volume_ratio_sq,
     [``Data.run82_heightLe_liftVolume_ratio], [``Data.heightLe_liftVolume_ratio]),
    (``Data.run83_integral_forms_long, some ``Data.integral_forms_long,
     [``Data.run83_heightLe_volume_ratio_sq], [``Data.heightLe_volume_ratio_sq]),
    (``run83_star_inequality, none,
     [``Data.run83_integral_forms_long], [``Data.integral_forms_long])]
  for (candidate, original, required, forbidden) in entries do
    let info ← Lean.getConstInfo candidate
    if let some name := original then
      let old ← Lean.getConstInfo name
      let same ← Lean.Elab.Command.liftTermElabM do
        Lean.Meta.isDefEq old.type info.type
      unless same do
        Lean.throwError "RUN83 type mismatch: {candidate}"
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "RUN83 lacks proof value: {candidate}"
    let deps := value.getUsedConstants
    for name in required do
      unless deps.contains name do
        Lean.throwError "RUN83 missing dependency {name} in {candidate}"
    for name in forbidden ++ original.toList do
      if deps.contains name then
        Lean.throwError "RUN83 retained forbidden dependency {name} in {candidate}"
    Lean.logInfo m!"C2_ENDGAME_CALLER: {candidate}: direct edges and requested type check"
