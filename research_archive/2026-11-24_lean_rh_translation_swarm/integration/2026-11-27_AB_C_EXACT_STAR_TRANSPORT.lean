import New.Filling.FillingTheorem
import New.Endgame.LongForms
import B3ExactSharpInterface
import C2FusedToStar
import Lean

/-!
# Integration: join actual B3/B4 and C2 callers at star
27 November 2026. SOURCE-MATCHED ROUTING / executable certificate PREPARED,
NOT native checked. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Source blobs: FillingTheorem 801448ae9b895babd0d69dc4f7967d86eb006e76; ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a;
LongForms 9eff36cf003ac398fbd24361e80e95a03d0b0e05; editor exact sharp 7906ca4e381e73efe8f6fe6adc48539060e6a222 (d3174ca053f2d03bece8b2f585c293f4ef565b61);
RUN87 fused C2 535c2f6a161a3eb569ddc0250707d55059fd706e (535c2f6a source blob); RUN88 baseline/graph control 56ee1baae.
Latest editor explicitly backtracks to the exact sharp supplier. The relaxed
energy and Poisson norm-decay candidates are retained as alternatives, not
silently combined with this path or claimed to close an arithmetic premise.

Contribution: connect the existing exact replacement of Fits to the actual
ramified column map, row positivity, enough_forms, common family and the
already prepared fused C2 star. These are five actual proof-term transports,
not five new mathematical estimates. Retain the original theorem TYPES,
universe parameters and all other proof constants. In particular the
nonzero row dimension proof depends on spread, and enough_forms consumes
BOTH spread and nonzero rows. Replacing only one is incomplete. The final
star separately calls row positivity as well as the common family. Replace
both there too. Preserve D, c, the same Poincare map, exact projected map,
q and the same independent family y, I, hV and fit family; no reselection
or weakening of the original premises. No old or new Main theorem import.

Proposed direct edge deltas (old -> new; other edges unchanged):
Data.ramifiedColumns_fill_rows: Fits.exists_translate_finrank_comap_le
  -> Filling.Fits.exists_translate_finrank_comap_le_editor_exact.
Data.finrank_rows_ne_zero: ramifiedColumns_fill_rows -> new spread.
Data.enough_forms: BOTH old spread and row nonzero -> new ones.
Data.exists_family_covolumeSq_le: enough_forms -> new enough_forms;
  retain Data.short_forms and the source's actual basis/height premises.
run87_fused_star_inequality: BOTH old family and old row nonzero -> new.
  retain Data.run87_fused_integral_forms_long.
The last stage has the EXACT universal star type, including modified D'
at the analytic cut. No independent new theorem of RH. A/B/C and D1/E1
primitive obligations remain as in LIVE_OBLIGATIONS. No global absence
claim: old dependencies may be reachable through unchanged suppliers
(e.g. short_forms), instance synthesis, type and constructor edges.
The executable guards below reject a missing direct edge rather than
pretending a source spelling establishes elaborated dependence.

Executed connector JS: 8 source anchor/dependency checks, 5
deleted-anchor negative controls rejected, exact pinned blobs retrieved.
These are source checks only, not tests of the kernel. Local command
-v lean / lake found neither; no new rh_scan/prune/reduce/auto/frontier.
Actual C1 shared run 46055305146 status ERROR, blob
fe5d4503f1bc8eb7752f9b86a6fdf35f452c872c; separate C2 consumer graph and
fit-family success are recorded in RUN88 (82 guards). Do not import
failed C1 split. Shared B3 direct-chart status path returned 404;
no native B3 replay receipt. No new axioms or graph results claimed.

RESUME HERE: in the shared cached compact workspace stage the exact editor
file as B3ExactSharpInterface and compile it; after accepted RUN86/87
as C2FusedToStar, compile this module as ABCExactStarTransport (build
only missing original LongForms/FillingTheorem dependencies). Require
five INTEGRATION_ABC_TRANSPORT markers, standard axiom reports, then
extend RUN88's original/new graph roster with these five pairs and the
required direct/reachable suppliers. Use actual kernel diagnostics and
constructor-inclusive graph before changing the live ledger. If an
expected edge is not direct, inspect the real graph and transport its
immediate caller rather than deleting the guard. No duplicate cold build.
HANDOFF TO integration / editor / kernel / B3. RH remains OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true

open Lean in
private def abcTransport (old fresh : Name) (pairs : Array (Name × Name))
    : Elab.Command.CommandElabM Unit := do
  let .thmInfo original ← getConstInfo old | throwError "ABC expected theorem {old}"
  let oldEdges := original.value.getUsedConstants
  for (a, b) in pairs do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      throwError "ABC supplier type or universe mismatch: {a} -> {b}"
    unless oldEdges.contains a && !oldEdges.contains b do
      throwError "ABC missing direct old supplier or already replaced: {old}, {a}"
  let value := original.value.replace fun x =>
    match x with
    | .const n us =>
      match pairs.find? (fun p => p.1 == n) with
      | some p => some (.const p.2 us)
      | none => none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := original.levelParams,
    type := original.type, value := value })
  let .thmInfo checked ← getConstInfo fresh | throwError "ABC missing checked theorem"
  unless checked.type == original.type && checked.levelParams == original.levelParams do
    throwError "ABC changed original statement"
  let expected := (oldEdges.filter (fun n => !pairs.any (fun p => p.1 == n))) ++ pairs.map Prod.snd
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "ABC direct edge set changed unexpectedly: {fresh}"
  unless !got.contains old && pairs.all (fun p => !got.contains p.1 && got.contains p.2) do
    throwError "ABC stale direct supplier: {fresh}"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "ABC nonstandard axiom: {fresh}"
  logInfo m!"INTEGRATION_ABC_TRANSPORT|{fresh}"

open Lean in
run_cmd do
  abcTransport ``Data.ramifiedColumns_fill_rows `Data.integration_abc_spread
    #[(``Filling.Fits.exists_translate_finrank_comap_le,
      ``Filling.Fits.exists_translate_finrank_comap_le_editor_exact)]
  abcTransport ``Data.finrank_rows_ne_zero `Data.integration_abc_rows_ne_zero
    #[(``Data.ramifiedColumns_fill_rows, `Data.integration_abc_spread)]
  abcTransport ``Data.enough_forms `Data.integration_abc_enough
    #[(``Data.ramifiedColumns_fill_rows, `Data.integration_abc_spread),
      (``Data.finrank_rows_ne_zero, `Data.integration_abc_rows_ne_zero)]
  abcTransport ``Data.exists_family_covolumeSq_le `Data.integration_abc_family
    #[(``Data.enough_forms, `Data.integration_abc_enough)]
  abcTransport ``run87_fused_star_inequality `integration_abc_star
    #[(``Data.exists_family_covolumeSq_le, `Data.integration_abc_family),
      (``Data.finrank_rows_ne_zero, `Data.integration_abc_rows_ne_zero)]

open Real Data Parameters in
example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  integration_abc_star

#print axioms Data.integration_abc_spread
#print axioms Data.integration_abc_rows_ne_zero
#print axioms Data.integration_abc_enough
#print axioms Data.integration_abc_family
#print axioms integration_abc_star
