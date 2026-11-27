import New.Filling.FillingTheorem
import New.Endgame.ShortAndEnough
import active_b2_fused
import Lean

/-!
# Lane 15: connect BOTH energy branches to the accepted B2 fusion
27 November 2026. SOURCE-MATCHED / PREPARED; not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0 / Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Pinned source:
New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05 (downstream caller only).

Prior editor exact sharp interface d3174ca053f2d03bece8b2f585c293f4ef565b61
retargets only the positive-type branch. Actual source has a SECOND
path to the SAME crude theorem: energy_compl_besselS_le ->
sum_norm_amplitudeSum_le -> Fits (the latter used TWICE). A positive-type
only substitution cannot remove the old crude supplier from Fits.
The complement bound is energy(amplitudeSum besselS^c, given level fibre)
<= b^-12*besselEnergy. Retain StablyUnram, all native admissibility,
cutoff, central projector and nonzero guards, including i=0,1.
The sharp fixing-set bound remains (1-b^-4)(1+9b^-4)mainEnergy*b^(-6k|A|).
The induction and rank result are unchanged: eta=19/(2b^4) before
the original ramification correction eta=b^-2. No new scalar premise,
no assumed RH, no change to same D, scalar c, maps or data definitions.

Reuse the already audited B2 full-link supplier from
integration/2026-11-27_b2_fused_native_receipt/active_b2_fused.lean
blob 46f4fe6655495d3d6a49ff2199f827fef30e7020, checked olean SHA256
e521f160ce09aa26f22976e1aed07f7c8d0648c2ddd3391500746029e899166f.
Peer actual compilation exit 0 (757.04s), five exact types, eight-root
constructor-inclusive audit, standard axioms. See B2_FUSED_NATIVE_PASS
and B2_C2_GRAPH_AUDIT, latter blob 6c63177244e1be65cceabd9ca6bb9bb38c2bba87.
The prior extracted coherent proof remains human evidence; here reuse
the original checked values for both energy statements to avoid the
simp-context change and long re-elaboration entirely. No claim that
the coherent primitive has been independently reproved.

Old source-visible graph (arrow = consumes):
 enough_forms -> finrank_rows_ne_zero, ramifiedColumns_fill_rows
 finrank_rows_ne_zero -> ramifiedColumns_fill_rows
 ramifiedColumns_fill_rows -> Fits.exists_translate_finrank_comap_le
 Fits -> sum_le_of_positive_type, sum_norm_amplitudeSum_le (twice)
 sum_le_of_positive_type -> energy_fixingSet_le
 sum_norm_amplitudeSum_le -> energy_compl_besselS_le
 both energy declarations -> energy_le_of_linkEnergy_le
New candidate: same graph with every displayed caller renamed _b2_joined
and the shared endpoint replaced by b2_fused_energy_le_of_linkEnergy_le.
This is a source subgraph, NOT a complete kernel graph; additional
dependencies and indirect paths must be audited, never discarded.

Actual connector JS checks: four pinned blobs plus fused blob matched;
10 source-visible caller edges checked, Fits complement consumer
appears twice, the downstream Data.exists_family_covolumeSq_le caller
uses enough_forms; 3 partial-substitution negative controls retain
the old endpoint in this explicit source subgraph. Both substitutions
remove it in this model only. Not a kernel result or quantitative test.
Local Lean/lake absent. Shared direct-chart run 46080383664 ERROR
(whnf timeout); RUN89 repair status 404 (no receipt). No new native
rh_prune/scan/reduce/auto/frontier or PASS, no URT benchmark. B1-B4,
A/C/D/E and all prior graph/axiom evidence preserved. No retired root.

RESUME HERE: in the existing authenticated B2 native cache with the
accepted active_b2_fused.olean and its prerequisite modules on LEAN_PATH,
build only missing New.Filling.FillingTheorem and New.Endgame.ShortAndEnough
oleans; compile this ONE file with normal kernel, require 8 B2_JOINED
markers, 9 standard-axiom reports, then audit both complete original/new
Data.enough_forms roots and both Fits roots using existing constructor-
inclusive graph exporter. Require new fused count/label/skew reachable,
both old energy paths absent, and retain all remaining original suppliers.
If an old target is indirect, inspect the precise witness path rather than
claiming removal. Do not run a separate cold build or replay accepted B2.
HANDOFF TO integration / kernel / B3 / B4. RH remains OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true
set_option maxHeartbeats 0
open Lean

private def editorB2Join
    (old fresh : Name) (required : Array Name)
    (prior : Array (Name × Name)) : Elab.Command.CommandElabM Unit := do
  let .thmInfo orig ← getConstInfo old | throwError "B2_JOINED expected original theorem"
  let before := orig.value.getUsedConstants
  for dep in required do
    unless before.contains dep do
      throwError "B2_JOINED expected direct source edge missing: {old} -> {dep}"
    unless prior.any (fun p => p.1 == dep) do
      throwError "B2_JOINED required substitution missing: {dep}"
  -- Refuse unrecorded additional prior direct edges rather than silently
  -- alter the documented graph. A failure gives the next precise audit.
  for (a, b) in prior do
    if before.contains a then
      unless required.contains a do
        throwError "B2_JOINED undocumented prior direct edge: {old} -> {a}"
      let x ← getConstInfo a
      let y ← getConstInfo b
      let same ← Elab.Command.liftTermElabM do
        Meta.isDefEq x.type y.type
      unless x.levelParams == y.levelParams && same do
        throwError "B2_JOINED changed supplier type/universes: {a}"
  let val := orig.value.replace fun e =>
    match e with
    | .const n ls =>
      match prior.find? (fun p => p.1 == n) with
      | some (_, b) => some (.const b ls)
      | none => none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := orig.levelParams,
    type := orig.type, value := val })
  let .thmInfo out ← getConstInfo fresh | throwError "B2_JOINED missing checked value"
  unless out.type == orig.type && out.levelParams == orig.levelParams do
    throwError "B2_JOINED original statement changed: {old}"
  let expected := before.map fun n =>
    match prior.find? (fun p => p.1 == n) with
    | some (_, b) => b
    | none => n
  let actual := out.value.getUsedConstants
  unless expected.all (fun n => actual.contains n) &&
         actual.all (fun n => expected.contains n) do
    throwError "B2_JOINED direct value graph mismatch: {old}"
  for (a, b) in prior do
    if required.contains a then
      unless actual.contains b && !actual.contains a do
        throwError "B2_JOINED stale or missing direct supplier: {a}"
  unless !actual.contains old do
    throwError "B2_JOINED original theorem used as shortcut: {old}"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "B2_JOINED nonstandard axiom: {fresh}"
  logInfo m!"B2_JOINED|{fresh}"

run_cmd do
  let mut prior : Array (Name × Name) := #[
    (``Filling.energy_le_of_linkEnergy_le, ``Filling.b2_fused_energy_le_of_linkEnergy_le)]
  let tasks : Array (Name × Name × Array Name) := #[
    (``Filling.energy_fixingSet_le, `Filling.energy_fixingSet_le_b2_joined, #[``Filling.energy_le_of_linkEnergy_le]),
    (``Filling.energy_compl_besselS_le, `Filling.energy_compl_besselS_le_b2_joined, #[``Filling.energy_le_of_linkEnergy_le]),
    (``Filling.sum_le_of_positive_type, `Filling.sum_le_of_positive_type_b2_joined, #[``Filling.energy_fixingSet_le]),
    (``Filling.sum_norm_amplitudeSum_le, `Filling.sum_norm_amplitudeSum_le_b2_joined, #[``Filling.energy_compl_besselS_le]),
    (``Filling.Fits.exists_translate_finrank_comap_le, `Filling.Fits.exists_translate_finrank_comap_le_b2_joined, #[``Filling.sum_le_of_positive_type, ``Filling.sum_norm_amplitudeSum_le]),
    (``Data.ramifiedColumns_fill_rows, `Data.ramifiedColumns_fill_rows_b2_joined, #[``Filling.Fits.exists_translate_finrank_comap_le]),
    (``Data.finrank_rows_ne_zero, `Data.finrank_rows_ne_zero_b2_joined, #[``Data.ramifiedColumns_fill_rows]),
    (``Data.enough_forms, `Data.enough_forms_b2_joined, #[``Data.finrank_rows_ne_zero, ``Data.ramifiedColumns_fill_rows])]
  for (a, b, ds) in tasks do
    editorB2Join a b ds prior
    prior := prior.push (a, b)

#print axioms Filling.b2_fused_energy_le_of_linkEnergy_le
#print axioms Filling.energy_fixingSet_le_b2_joined
#print axioms Filling.energy_compl_besselS_le_b2_joined
#print axioms Filling.sum_le_of_positive_type_b2_joined
#print axioms Filling.sum_norm_amplitudeSum_le_b2_joined
#print axioms Filling.Fits.exists_translate_finrank_comap_le_b2_joined
#print axioms Data.ramifiedColumns_fill_rows_b2_joined
#print axioms Data.finrank_rows_ne_zero_b2_joined
#print axioms Data.enough_forms_b2_joined
