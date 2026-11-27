import New.Endgame.LongForms
import C2ValueFamilyTransport
import Lean

/-!
RUN85 — preferred direct determinant-line family -> actual Theorem C -> star.
27 November 2026. PREPARED, not native checked. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Source 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
LongForms blob 9eff36cf003ac398fbd24361e80e95a03d0b0e05; Main blob 198ed5bf26aa294898931e0649bc2b88f1389f65 (read only, not imported).
Peer integration/C2_VALUE_FAMILY_TRANSPORT.lean blob 7e912b212aa0a365106cca2e7a0c30a17eb65ff6,
module name C2ValueFamilyTransport confirmed in run_c2_value_family_from_built.py.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87c621d0d18103ec2eb9be14bf774b8bff2a747d, 2c9e5148a947ff4b28482afd18c4d7c810af97d5.
Read canonical direct determinant receipt and C2 caller work.

The four-stage preferred direct determinant-family transport ends at
c2_exists_isFitFamily. Its exact actual consumer is Data.integral_forms_long;
the latter uses the chosen fit family ONCE and passes the SAME witness to
both signed height estimates. Reuse that family, not a new choice for each
estimate or embedding. For d=rowDim, L=logB*budget, H=mainHeight,
the retained inequalities have budgets V+2delta+db and 2d(2L-H).
The same nonzero z(theta)/z(1) cancels against its inverse square:
  0 <= 2(V+2delta+db)+2d(2L-H),
  hence V+2delta >= d(H-2L-b) >= d(H-3L) using b<=L, d>=0.
This is the existing native cancellation, not new arithmetic.
The A/B family and both original height suppliers remain unchanged.
Star cancels H after the rank deficit and index estimates. No additional
hypotheses, no change in quantifier order, no use of New.grh or Main.

This closes a PREPARED caller attachment missing from the four-stage
preferred peer file. It is distinct from RUN83, which changes the
reciprocal-height supplier through the earlier C2Combined/Carrier path but
retains exists_isFitFamily. Keeping original height here isolates the
direct determinant-family branch for an independent audit; merge with
RUN83 only after its separate native receipt. Do not infer global absence
of general exchange: the original height and crude-row branches can still
reach it. No claimed mathematical root discharge.

Executed connector JS static checks: pinned both upstream blobs and peer
blob; extracted actual 2 declarations; 4 unique reversible substitutions
(2 names, 2 supplier calls), both exact round trips; intentionally absent
supplier rejected. No local lean/lake executable. No native scan/prune,
reduce/auto, axiom or graph execution. Shared run 46055305146 checked via
actual jobs API: C1 replay job in_progress, no accepted result for the new
family chain at this observation. Do not start a duplicate cold build.
Use the accepted family module only after its actual kernel receipt.
Original graph and all unresolved suppliers remain in evidence.

RESUME HERE: after run 46055305146 finishes, authenticate its original
LongForms cache (build only any missing closure) and C2ValueFamilyTransport
object; compile this file as C2FitToStar, inspect both axiom reports and
the original/changed direct edges; export the old/new Theorem C closure
and star closure separately without importing Main into this module.
If run failed preserve its actual logs first. No root RH closure.
HANDOFF TO integration/native runner/audit.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

section LongForms
open Finset LinearMap Real Submodule LevelPlaces.LevelForm

variable {P} {D : Data P} {n} {y : Fin n → _} {δ V} (i : LinearIndependent ℂ y) (hn :
  (1 - 4 / D.b ^ 2) * D.rowDim ≤ n) (I : D.IndexLe y δ) (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i hn I hV

lemma Data.run85_direct_integral_forms_long : D.rowDim * (D.mainHeight - 3 * (D.logB * D.budget)) ≤
  V + 2 * δ := by
  -- one twist `θ ι` for each `ι`, with the congruence bounds; the volumes do not vanish
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := c2_exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  -- `(𝔷 θ / 𝔷 1)² (𝔷 1² / 𝔷 θ²) = 1`, heights add, and the height of `1` is `≥ 0`
  have formula : 0 ≤ 2 * (V + _ + _) + _ := ((((heightLe_volume_rows i hn I hV o).pow 2).mul
    (heightLe_volume_ratio_sq o)).mono le_rfl (by simp [field]; simp [(Z _).1])).nonneg
  linarith [(by gcongr; exact D.le_of_hasLogBound : D.rowDim * D.b ≤
    D.rowDim * (D.logB * D.budget))]

end LongForms

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

lemma run85_direct_star_inequality {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
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
    _ ≤ d * h + (d - n) * -h + 2 * δ := (Data.run85_direct_integral_forms_long i big I short).trans_eq (by ring)
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
  run85_direct_star_inequality

#print axioms Data.run85_direct_integral_forms_long
#print axioms run85_direct_star_inequality

open Lean in
run_cmd do
  let old ← Lean.getConstInfo ``Data.integral_forms_long
  let candidate ← Lean.getConstInfo ``Data.run85_direct_integral_forms_long
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq old.type candidate.type
  unless same do
    Lean.throwError "RUN85 complete original Theorem C type changed"
  let entries : List (Name × List Name × List Name) := [
    (``Data.run85_direct_integral_forms_long,
      [``c2_exists_isFitFamily, ``Data.heightLe_volume_rows, ``Data.heightLe_volume_ratio_sq],
      [``exists_isFitFamily, ``Data.integral_forms_long]),
    (``run85_direct_star_inequality,
      [``Data.run85_direct_integral_forms_long, ``Data.exists_family_covolumeSq_le],
      [``Data.integral_forms_long])]
  for (name, required, forbidden) in entries do
    let info ← Lean.getConstInfo name
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "RUN85 no proof body: {name}"
    let deps := value.getUsedConstants
    for dep in required do
      unless deps.contains dep do
        Lean.throwError "RUN85 expected direct dependency {dep} missing in {name}"
    for dep in forbidden do
      if deps.contains dep then
        Lean.throwError "RUN85 old direct dependency {dep} in {name}"
    Lean.logInfo m!"RUN85_FIT_TO_STAR: {name}: exact direct suppliers"

