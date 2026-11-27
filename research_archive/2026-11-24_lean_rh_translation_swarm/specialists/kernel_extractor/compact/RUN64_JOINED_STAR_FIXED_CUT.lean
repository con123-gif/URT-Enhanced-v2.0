import JointABRun63
import C2FusedToStar
import FixedModulusStarToRH
import Lean

/-!
RUN64 — actual star junction and fixed-modulus cut, 27 November 2026.
PREPARED / SOURCE-MATCHED ONLY; no native PASS. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact source pin
72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs: 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Native New/Main.lean blob 198ed5bf26aa294898931e0649bc2b88f1389f65.
specialists/kernel_extractor/compact/RUN63_JOINT_AB_TRANSPORT.mjs blob 5d10d2c18931bb26a575140c62182e832474d6c8
specialists/character_boxes/RUN87_COMPACT_C2_FUSED_TO_STAR.lean blob 535c2f6a161a3eb569ddc0250707d55059fd706e
specialists/character_boxes/RUN86_COMPACT_C2_SINGLE_WITNESS_TO_STAR.lean blob e81bcf8064bf50effbbccf7f87b565e068bf2304
specialists/theta_lifts/RUN87_A2_COMMON_POINCARE_TAIL.lean blob ba1101caf13444d28a19de3682c83e1c38a92255
integration/compact/RUN50_FixedModulusStarToRH.lean blob 89da046093cd30305e55ea7e217cf4437821e595

RUN63 connects A/B; character-box RUN87 connects two C branches, but its
star body explicitly retains original Data.exists_family_covolumeSq_le.
The original star also calls Data.finrank_rows_ne_zero directly for d>0;
replacing only the A/B family leaves this old rank route at the root.
This certificate retargets BOTH constants simultaneously in the already
fused C star expression, with exact universe and complete-type equality
guards. Preserve the same P,D,y,n,delta,V, scales, all conjugates, all
twist data and nonzero dimension. The two inequalities use the SAME
family. No fresh choice of y or theta, no new mathematical premise.
H cancels exactly as in the original proof. The star statement remains
universal in D, so the analytic adapter can apply to its modified D'.
The final cut is only StarAt 18480; auxiliary characters remain.

Actual static checks this run: recovered the entire original star lemma
from RUN86 by reversing its two edits (exact trimmed equality); checked
eight source/consumer anchors and 8/8 missing-anchor controls. No native
Lean execution, no new axiom or graph result. RUN61 retry status and
retry_summary returned 404, not a successful receipt; C1 run 46055305146
job 140698522135 still in_progress at inspection. No duplicate job.
The scheduler's recent runs include cancellations; no inference that a
specific pending job has executed. No Main or New.Main imports.
Retain all A/B/C/D/E/V obligations, earlier failures and graphs. Native
rh_scan/prune/reduce/auto/frontier still pending for this joint root.
Direct-edge absence is not a proof of transitive absence.

Stage accepted JointABRun63, C2FusedToStar, and the exact RUN50 analytic
adapter as FixedModulusStarToRH; then compile this module in one shared
authenticated compact workspace. No root theorem imported as shortcut.
RESUME HERE: obtain RUN61 A1 receipt and repair first failing line if
needed; once A/B, C and analytic modules pass, execute this exact junction
and constructor-inclusive export from kernelRun64_fixed_star and
kernelRun64_rh_candidate. Retain old/new graph and #print axioms, apply
existing reduction engine on reachable frontier; never infer closure
from this prepared source. HANDOFF TO integration, theta, character boxes,
acceleration, audit. Star/RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true

open Lean in
run_cmd do
  let sourceName := ``run87_fused_star_inequality
  let freshName := `kernelRun64_joined_star
  let pairs : Array (Name × Name) := #[
    (``Data.exists_family_covolumeSq_le, ``Data.exists_family_covolumeSq_le_run63),
    (``Data.finrank_rows_ne_zero, ``Data.finrank_rows_ne_zero_run87)]
  let .thmInfo source ← Lean.getConstInfo sourceName |
    Lean.throwError "RUN64 source is not a theorem"
  let oldEdges := source.value.getUsedConstants
  unless oldEdges.contains ``Data.run87_fused_integral_forms_long do
    Lean.throwError "RUN64 fused C supplier missing"
  for (a,b) in pairs do
    let ai ← Lean.getConstInfo a
    let bi ← Lean.getConstInfo b
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      Lean.throwError "RUN64 supplier statement/universe mismatch"
    unless oldEdges.contains a && !oldEdges.contains b do
      Lean.throwError "RUN64 unexpected supplier edge"
  let value := source.value.replace fun e =>
    match e with
    | .const n levels =>
      match pairs.find? (fun p => p.1 == n) with
      | some p => some (.const p.2 levels)
      | none => none
    | _ => none
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := freshName, levelParams := source.levelParams,
    type := source.type, value := value })
  let .thmInfo checked ← Lean.getConstInfo freshName |
    Lean.throwError "RUN64 checked declaration missing"
  unless checked.type == source.type && checked.levelParams == source.levelParams do
    Lean.throwError "RUN64 statement changed"
  let expected := (oldEdges.filter (fun n => !pairs.any (fun p => p.1 == n))) ++ pairs.map Prod.snd
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    Lean.throwError "RUN64 unexpected value edge change"
  unless got.contains ``Data.run87_fused_integral_forms_long && !got.contains sourceName do
    Lean.throwError "RUN64 C edge lost or old star aliased"
  let allowed : Array Name := #[``propext, ``Classical.choice, ``Quot.sound]
  let axioms ← Lean.collectAxioms freshName
  unless axioms.all (fun a => allowed.contains a) do
    Lean.throwError "RUN64 unexpected axiom"
  Lean.logInfo "RUN64_JOINED_STAR_CHECKED"

theorem kernelRun64_fixed_star : CompactIntegration.StarAt 18480 :=
  fun _ _ D => kernelRun64_joined_star (D := D)

-- This candidate is NOT a closure receipt. It must be kernel checked
-- with the staged dependencies and audited to the complete frontier.
theorem kernelRun64_rh_candidate : RiemannHypothesis :=
  CompactIntegration.rh_from_fixed_star kernelRun64_fixed_star

#print axioms kernelRun64_joined_star
#print axioms kernelRun64_fixed_star
#print axioms kernelRun64_rh_candidate
