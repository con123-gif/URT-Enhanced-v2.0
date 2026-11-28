import C1LateBudgetC2Fusion
import IntegrationBothEnergyStar
import Lean

/-!
RUN90 — 28 November 2026. SOURCE-MATCHED / PREPARED, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, continuity, swarm, handoff and expansion read; latest peers
through 9fd9c67c (integration 1d6a303d, kernel eb147fce, Landau 64a6a918).
Lane directory RUN83–89 checked. Do not redo scalar algebra or cold build.

New exact caller connection: the existing RUN89 late arithmetic budget
and determinant-to-twist fusion has not yet been propagated through the
C2 common signed-witness junction and the latest integration star that
uses BOTH B2 energy branches and the common A map. Replace only the
fit-family supplier in Data.run87_fused_integral_forms_long, then replace
only that C supplier in integration_both_energy_star. This is the shortest
two-edge transport; no new intermediate star, alternate row choices,
or duplicate A/B/C derivation.

Native sources (grh-compact/src):
 New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14:
   exists_isFitFamily, finite prime budgets, same twist and powers.
 New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05:
   Data.integral_forms_long obtains one fit family before its signed
   heights; heightLe_volume_rows and heightLe_volume_ratio_sq.
 New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65:
   star, not imported here.
Peer blobs:
 RUN89 f740d8573ec78961509f55ea27b59615b7923a50;
 C2FusedToStar 535c2f6a161a3eb569ddc0250707d55059fd706e;
 IntegrationBothEnergyStar 26a1965f8ef58960b7045fcc32ab65f795a9d22b.
The latter retains Data.run87_fused_integral_forms_long by an explicit
direct-edge guard. Do not use the original star or an older A/B variant.

Human implication: for the same D and independent y, same rank n,
index delta and covolume V, select one theta from RUN89, then use the
existing signed heights on the same nonzero ratio z(theta)/z(1).
Writing L=logB*budget, H=mainHeight, d=rowDim,
the one-witness C junction gives 0 <= V+2delta+db+d(2L-H).
Since b<=L, d>=0, this implies d(H-3L)<=V+2delta.
The newest A/B supplies its existing bound with h=H-mR+L on
those SAME rows. Substitution cancels H and yields the unchanged
mR<=logB^2*budget. All original scale, height, row, period-ring,
crystalline, odd-Sha and nonvanishing premises remain. There is no
independent estimate for the missing arithmetic or analytic suppliers
in this transport. In particular RUN89 still uses the original
arithmetic budget derivation (not the unreplayed RUN85–87 replacement).

Actual fresh receipts:
 C1 native results blob 82bc12db6320e5123336df88d75515cffff5ed89:
 original build exit 0 (9557.24s), original caller probe exit 0;
 fit_budget_run84 axiom report standard three only, but its containing
 split file exited 1 and both fit-family candidates contain sorryAx.
 packed scalar RUN83 exit 0, negative zero-k rejected.
 all_requested_checks_ok=false, caller_replacements_checked=false,
 packed_valuation_identity_replayed=false. Do not import failed RUN84.
 C2 receipt 413058eacfda8683f5fb28c68148fd45d1bf1770:
 all seven phases exit 0, all_requested_checks_ok=true,
 including C2ValueFamilyTransport and consumer_graph.
 Workflow 46055305146 job 140698522135 completed; artifact 15234434421
 listed unexpired, outer ZIP size 900881325 bytes. That job success
 is NOT evidence of a successful C1 replacement. Cache inner digest
 per RUN89 63bbe26668b47f81149ef5f5e06033168489076b68eb22509fa40bcc518a9603.
 No artifact bytes restored locally this run; local lean/lake/elan absent,
 scratch 30 GB. No native rh_scan/prune/reduce/auto/frontier execution.
 Use shared cache, not a duplicate source build.

Actual connector-JS checks on the three peer blobs: 12 source anchors
present, 12/12 removed-anchor controls rejected, including the fit
budget/twist suppliers, all three preserved C height/volume suppliers,
and both A/B suppliers of the newest star. These are text provenance
checks, NOT an elaborated graph or kernel receipt.

The code below checks exact type/universe equality, proof-only edges,
and equality of the COMPLETE direct constant sets after substitution,
then uses normal addDecl and standard-axiom whitelist. Explicit guards
preserve both A/B suppliers and the C single-witness suppliers. The
new graph is not accepted until independent constructor-inclusive
transitive audits of both original and replacement roots, including
any remaining old supplier paths. No proof term is obtained from Main
or a claimed RH theorem. No original graph/evidence erased.

RESUME HERE: in the shared authenticated compact cache for artifact
15234434421, stage RUN89 as C1LateBudgetC2Fusion and replay it first;
require all three standard axiom reports and C1_C2_RUN89_DIRECT_GUARDS_OK.
Then, when the existing IntegrationBothEnergyStar dependency is also
accepted, compile THIS module with the same pinned LEAN_PATH. Require
both RUN90_C1_STAR markers and standard axiom reports, then audit both
old/new roots with the strict constructor-inclusive union exporter.
If the first native prerequisite fails, preserve its diagnostic and
repair that exact failure before further transport. No new cold job.
HANDOFF TO integration/editor, character boxes, kernel/audit.
C1/C2/star/RH remain OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true

open Lean in
private def run90Transport (old fresh a b : Name) : Elab.Command.CommandElabM Unit := do
  let .thmInfo orig ← getConstInfo old | throwError "RUN90 expected original theorem"
  let ai ← getConstInfo a
  let bi ← getConstInfo b
  let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
  unless ai.levelParams == bi.levelParams && same do
    throwError m!"RUN90 supplier complete statement or universes changed: {a}"
  let before := orig.value.getUsedConstants
  unless before.contains a && !before.contains b && !orig.type.getUsedConstants.contains a do
    throwError m!"RUN90 missing distinct proof-only edge: {old} -> {a}"
  let value := orig.value.replace fun e =>
    match e with
    | .const n us => if n == a then some (.const b us) else none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := orig.levelParams, type := orig.type, value := value })
  let .thmInfo checked ← getConstInfo fresh | throwError "RUN90 missing checked theorem"
  unless checked.type == orig.type && checked.levelParams == orig.levelParams do
    throwError "RUN90 original complete statement changed"
  let expected := before.map fun n => if n == a then b else n
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "RUN90 unintended direct graph delta"
  unless got.contains b && !got.contains a && !got.contains old do
    throwError "RUN90 stale direct edge or original alias"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError m!"RUN90 nonstandard axiom in {fresh}"
  logInfo m!"RUN90_C1_STAR|{fresh}"

open Lean in
run_cmd do
  run90Transport ``Data.run87_fused_integral_forms_long
    `Data.run90_c1_integral_forms_long
    ``c2_exists_isFitFamily ``exists_isFitFamily_fused_run89
  run90Transport ``integration_both_energy_star
    `run90_c1_both_energy_star
    ``Data.run87_fused_integral_forms_long `Data.run90_c1_integral_forms_long

open Lean in
run_cmd do
  let orig ← getConstInfo ``Data.integral_forms_long
  let fresh ← getConstInfo ``Data.run90_c1_integral_forms_long
  let same ← Elab.Command.liftTermElabM do Meta.isDefEq orig.type fresh.type
  unless orig.levelParams == fresh.levelParams && same do
    throwError "RUN90 original C statement changed"
  for (n, required, forbidden) in #[
    (``Data.run90_c1_integral_forms_long,
      #[``exists_isFitFamily_fused_run89, ``c2_heightLe_single_witness_budget,
        ``Data.heightLe_volume_rows, ``Data.heightLe_volume_ratio_sq,
        ``Data.volume_iota_eq_prod_liftVolume],
      #[``exists_isFitFamily, ``c2_exists_isFitFamily, ``Data.integral_forms_long]),
    (``run90_c1_both_energy_star,
      #[``Data.run90_c1_integral_forms_long, ``Data.integration_both_family,
        ``Data.integration_both_rows],
      #[``Data.run87_fused_integral_forms_long, ``Data.integral_forms_long]),
    (``exists_isFitFamily_fused_run89,
      #[``fit_budget_run89, ``c2_exists_mFoldTwist_selmerLengthLe],
      #[``exists_isFitFamily, ``exists_mFoldTwist_selmerLengthLe])] do
    let info ← getConstInfo n
    let some v := info.value? (allowOpaque := true) | throwError "RUN90 missing proof body"
    let deps := v.getUsedConstants
    unless required.all (fun x => deps.contains x) &&
        forbidden.all (fun x => !deps.contains x) do
      throwError m!"RUN90 required/forbidden direct supplier guard failed: {n}"

open Real Data Parameters in
example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  run90_c1_both_energy_star

#print axioms Data.run90_c1_integral_forms_long
#print axioms run90_c1_both_energy_star
