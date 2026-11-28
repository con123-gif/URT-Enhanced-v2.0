import Run90Adapter
import New.Endgame.ShortAndEnough
import Lean

/-!
# Editor: independent native remainder junction, before the common star
28 November 2026. SOURCE-MATCHED / PREPARED (new module not compiled).
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION, continuity and current peer commits read.

The new endpoint receipt 46092027436 (actual state-branch
compute/rh-compact-prime-endpoint-direct-cancel-20261128/outputs/run91_receipt.json,
blob 0b2bcdbd7e7988f607b8d4dbbc1c0a27ef2fb58b) reports
all_requested_checks_ok=true, analytic_checked=true, adapter_checked=true,
bridge_checked=true, compiler_archive_rehashed_here=true, but
original_definition_native_bridge_checked=false,
arithmetic_premise_proved=false, pnt_tail_proved_here=false, full_RH_replay=false.
Do not conflate its "bridge_checked" (principal endpoint) with the
still-missing native original-definition bridge. Prime RUN94 557eeda77
and acceleration RUN92 a8580b491 independently prepare native-window
wrappers; integration 77afc792 already joins the one-sided star with
both B2 paths, finite shell and squared C. Do not duplicate those.
The acceleration note proposes the two rfl probes at final assembly;
instead isolate them here as a standalone check before all pending
A/B/C and polar wrappers. This uses only the existing Run90Adapter
and the original ShortAndEnough, not any candidate star or New.Main.

Exact source: ShortAndEnough.lean blob b99eea0689be372d84362c58272b705e104b6a3a,
lines 36–42 and 86–112; accepted COMPACT_RUN93_ADAPTER_REPAIR.lean
blob cafaa2442d0889d26f4ccaefd4a2888dfe422c81 lines 105ff. Retrieved both sources, matched the
COMPLETE two definition bodies and the ENTIRE remainder_eq declaration
including proof by a reversible rename of run90MainAsk/run90Remainder.
Actual connector JS: 3/3 exact block matches; 6/6
mutations replacing the coefficient D.a with D.a+1 or D.m detected.
Source verification only, not elaborated definitional equality.
Both sections have the same implicit P and explicit D : Data P.
No change to P, D, prime class, nominal weights, mean, summation
domain, or second scale. Equality is pointwise for ALL D, hence also
the actual D' obtained by changing logX1 in the polar selection.

Human audit of caller: fix P and epsilon first; t=10^6 log x and
c=towerDeg(s)/#thick. The native window gives u in [t,t²] with
R_N(exp u)-c R_1(exp u)<=exp(-t). Keep the same D except for logX1=u
and its scale proof. Apply star to D', not D. The remainder identity
then gives R_N(x)<=logB² budget/(m a #thick)+exp(-t).
All denominators are positive by the admissible scale laws. The
native scale bound is x^(8epsilon-1/2). In the accepted analytic
endpoint PrincipalGrid requires epsilon/2 at the quartics, not
epsilon: the interpolation uses the reserved exponent slack.
The source-equal bridge below is independent of both choices.
It imposes no TailGrid or additional condition on the original star.
The actual wrapper and native definition comparisons remain pending.

Other fresh receipt independently read: B3 shell run 46092592569,
compute/rh-compact-b3-shell-replay-20261128/outputs/run91_shell_receipt.json,
blob ced03da74831bbc7ae37622698002e8dcedb03cd. Both shell replacements
compiled with standard axioms; strict four-root graph accepted.
73765 declarations, 2088097 edges, zero missing, all 14 guards.
Both old shell graphs and new graphs retained. This is local scope,
not the five quantitative caller replacements or B4 root closure.
Live spine/ledger should record those two accepted receipts, retaining
C1 and common star as open, and the E1 original definition/graph audit
as its own task. No new native engine run in this environment (lean/lake
not installed); no new native PASS or root retirement claimed.

RESUME HERE: stage THIS file as EditorNativeRemainderJunction after
the already authenticated Run90Adapter.olean and original
New.Endgame.ShortAndEnough.olean are available. Compile with ordinary
kernel checking; require EDITOR_NATIVE_REMAINDER_OK, both rfl checks,
the exact original theorem type comparison and four standard axiom
reports. Do not build or import any pending A/B/C candidate just for
this check. Export the original and transported remainder_eq roots
and both star interfaces; inspect retained native definitions and
all premise/type edges. On success the pending lightweight wrapper
can consume editor_original_to_light_star directly; no need to repeat
the rfl probes at final assembly. Preserve original graph and report
the first actual failure rather than assuming elaboration succeeds.
HANDOFF TO prime/integration/kernel/audit. Root obligations OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

lemma Data.editor_mainAsk_same {P} (D : Data P) :
    D.run90MainAsk = D.mainAsk := by rfl

lemma Data.editor_remainder_same {P} (D : Data P) :
    D.run90Remainder = D.remainder := by rfl

lemma Data.editor_remainder_eq_from_light {P} (D : Data P) :
    D.remainder = D.a * (#D.thick *
      (primeError P.d P.N₀ D.x - primeError P.d P.N₀ D.x₁) +
      #D.tops * primeError P.d 1 D.x₁) := by
  simpa only [Data.editor_remainder_same] using D.run90Remainder_eq

theorem editor_original_to_light_star
    (h : ∀ (P : Parameters) (D : Data P),
      D.m * D.remainder ≤ D.logB ^ 2 * D.budget) :
    ∀ (P : Parameters) (D : Data P),
      D.m * D.run90Remainder ≤ D.logB ^ 2 * D.budget := by
  intro P D
  rw [D.editor_remainder_same]
  exact h P D

open Lean in
run_cmd do
  let old ← getConstInfo ``Data.remainder_eq
  let new ← getConstInfo ``Data.editor_remainder_eq_from_light
  let same ← Elab.Command.liftTermElabM do Meta.isDefEq old.type new.type
  unless same && old.levelParams == new.levelParams do
    throwError "EDITOR_NATIVE_REMAINDER changed original statement"
  let .thmInfo info ← getConstInfo ``Data.editor_remainder_eq_from_light |
    throwError "missing transported remainder proof"
  let deps := info.value.getUsedConstants
  unless deps.contains ``Data.run90Remainder_eq && !deps.contains ``Data.remainder_eq do
    throwError "EDITOR_NATIVE_REMAINDER stale or missing supplier"
  for n in #[``Data.editor_mainAsk_same, ``Data.editor_remainder_same,
      ``Data.editor_remainder_eq_from_light, ``editor_original_to_light_star] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext, ``Classical.choice, ``Quot.sound].contains a) do
      throwError "EDITOR_NATIVE_REMAINDER nonstandard axiom: {n}"
  logInfo "EDITOR_NATIVE_REMAINDER_OK"

#print axioms Data.editor_mainAsk_same
#print axioms Data.editor_remainder_same
#print axioms Data.editor_remainder_eq_from_light
#print axioms editor_original_to_light_star

/- Separate terminal consumer only AFTER acceptance of all three modules:
import EditorNativeRemainderJunction
import Run92LightSelectedStar
import IntegrationMinimalSignedStar
theorem candidate_zeta_line : RiemannZetaZerosOnLine :=
  RHAcceleration92.zeta_line_from_universal_light_star
    (editor_original_to_light_star (fun P D => @integration_minimal_signed_star P D))
This is a conditional assembly instruction, not a compiled theorem here.
-/
