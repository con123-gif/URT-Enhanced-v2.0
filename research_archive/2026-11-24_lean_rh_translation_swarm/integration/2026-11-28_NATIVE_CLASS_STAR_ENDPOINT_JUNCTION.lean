import Run94StarGrid
import EditorNativeRemainderJunction
import Lean

/-!
# Integration — actual RUN95 endpoint accepted; native arithmetic interface
28 November 2026. Native endpoint REPLAYED; this new junction PREPARED,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION, research state/protocol/continuity,
recent peer commits through 3197ff9b (weighted mean alternative),
c1f43d70 (C2 cache provenance), 5aafbc0a (C1), c9603590 (A2),
65eab77a (frame volume), a51d37f0 (B3 callers), 176ea09a (A1).

## Actual new receipt, not the workflow label
Run 46102281476, completed 2026-11-28 04:04:01 UTC, source d3fcfc01.
State path compute/rh-compact-prime-star-grid-20261128/outputs/.
Status blob e26d76e3373fd74a31da5350487f898a8843c7da; receipt
b58fac802d12d1f3313fe5dc65ab06520577b841, compile log
db27056333f7cddc8cbc67c70e7576b76252f99a, union summary
ad18ca8fe3c536769026cad59674d291e5d961a4, root audits
60599ff03c3e58c57cfe54ed628f4fcb00156dfa. Retrieved all separately.
RUN94 source bb5b6bb13884b9d161481e38da357d5fee9a10c8,
object SHA256 b08e8b708fedfb4de3e25dfd09c72323ecaeac8911ca313b2e3e4ec99d8f620c.
Compiler exit 0 (13.75s), four standard-axiom reports, guard marker.
Graph exit 0 (98.47s), 124661 nodes / 4046494 edges / zero missing,
15 reachability guards true; five roots all standard three axioms.
Graph SHA256 5a8e26c835593df5f0d7e56f8413cce092b306cc5362e23d837119324a48db4c.
Connector JS recomputed each of the five per-root node counts from the
saved mask histogram, matched the independently retrieved summary
and root audit objects, checked all 15 guards and compiler marker.
Old root 124145 nodes; new conditional root 124640 nodes. This is a
reduction of independent assumptions, NOT a reduction in node count.
Old GoodGrid/TailGrid/ClassGridInputs absent from new root, present
in old root. Native star, New.grh and riemannHypothesis absent.
Data.run90Remainder_eq, exists_data and the polar window retained.
Full graph bytes not rerun here; prior independent graph artifacts preserved.
Receipt explicitly original_definition_native_bridge_checked=false,
arithmetic_premise_proved=false, full_RH_replay=false.

## New junction: give the arithmetic lanes the exact NATIVE interface
The checked endpoint takes ClassStarGrid in terms of run90Remainder.
The existing common star candidate uses Data.remainder. The existing
editor junction e8375454 supplies their equality, but its illustrative
terminal caller used the older universal-light-star alternative.
Reuse its lemma instead of copying it or rerunning a cold build.
Define the actual restricted native premise below and pass it to the
newly checked RUN94 endpoint without strengthening it to universal star.
This is a strictly narrower domain than the original all-data goal,
not a claim that the estimate holds. Same P, D, x, m, remainder, logB
and budget; no choice of new data, no uniformity in P assumed.
For each P with N0=18480 and d=9239 mod 18480, for all sufficiently
large quartic x, ALL admissible D at x must satisfy
  m*remainder <= logB^2*budget.
The eventual threshold may depend on P. The verified polar selection
changes the second scale within a fixed D fiber; it then applies
the star to D' on the same x. Do not reduce universal D to a single
arbitrary D at x. The separate weighted-mean alternative is still
unproved; no substitution of an averaged condition into RUN94.

Source audit executed: compared both native definition bodies
(New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a,
lines 36-42) with checked Run90Adapter cafaa2442d0889d26f4ccaefd4a2888dfe422c81,
after exact identifier rename; both matched. Two mutated bodies
(D.a+1 and D.primeSum D.m) differed as required. This is only source
evidence for the equality already prepared by the editor, not kernel
definitional equality. Native statement Statements.lean blob
1cd1bce93344065936b2b392b23306254e0785ef; native original star statement
New/Main.lean blob 198ed5bf26aa294898931e0649bc2b88f1389f65 line 121.
Do not import Main or its proof. No actual new Lean/scan/prune/reduce/auto
execution locally: lean/lake absent, git remote DNS unavailable.
A1 retry status remains error (9838f1d1c9d36c9906c2736d5d8d4f08fe98042a);
C2 archive limit unresolved per RUN93; B3 five-caller status 404.
Do not let endpoint receipt conceal these missing mathematical/replay
obligations. No RH claim or URT speed claim.

RESUME HERE: compile EditorNativeRemainderJunction in the retained
RUN95 compact endpoint workspace, building only missing original
ShortAndEnough imports with native Lake; then compile THIS file as
IntegrationNativeClassStarEndpoint. Require both modules' normal
kernel exit 0, all exact-type and direct guards, standard axioms,
and export the original conditional RUN94 root and the new native
conditional root with the existing strict 4.35 graph exporter.
Verify the new root reaches the editor equality and RUN94 endpoint,
retains native star as a premise, and never reaches Main's star or RH.
This can be done without importing the pending A/B/C replacement.
On success the remaining arithmetic lane can supply exactly the
NativeClassStarGrid premise (or the stronger existing common star).
On failure preserve first actual diagnostic. Do not replay accepted
RUN94 unnecessarily or mix unauthenticated binary caches.
HANDOFF TO integration / editor / prime / kernel / audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace RHIntegration95

/-- The checked endpoint's exact domain, stated with the original remainder. -/
def NativeClassStarGrid : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) →
      ∀ᶠ x in atTop, x ∈ RHPrimeWindow94.QuarticScales →
        ∀ D : Data P, D.x = x →
          D.m * D.remainder ≤ D.logB ^ 2 * D.budget

theorem native_class_star_to_checked_grid
    (hin : NativeClassStarGrid) : RHPrimeWindow94.ClassStarGrid := by
  intro P hN hd
  unfold RHPrimeWindow94.StarGrid
  have h := hin P hN hd
  filter_upwards [h] with x hx
  intro hmem D hDx
  rw [D.editor_remainder_same]
  exact hx hmem D hDx

theorem zeta_line_from_native_class_star
    (hin : NativeClassStarGrid) : RiemannZetaZerosOnLine :=
  RHPrimeWindow94.zeta_line_from_star (native_class_star_to_checked_grid hin)

/-- Optional bridge from the existing all-data arithmetic target; no
proof of that target is imported here. -/
theorem native_class_star_of_all_data
    (h : ∀ (P : Parameters) (D : Data P),
      D.m * D.remainder ≤ D.logB ^ 2 * D.budget) :
    NativeClassStarGrid := by
  intro P _ _
  exact Filter.Eventually.of_forall (fun _ _ D _ => h P D)

end RHIntegration95

open Lean in
run_cmd do
  let allowed : Array Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (n, req) in #[
    (``RHIntegration95.native_class_star_to_checked_grid,
       #[``Data.editor_remainder_same]),
    (``RHIntegration95.zeta_line_from_native_class_star,
       #[``RHPrimeWindow94.zeta_line_from_star,
         ``RHIntegration95.native_class_star_to_checked_grid]),
    (``RHIntegration95.native_class_star_of_all_data, #[])] do
    let info ← getConstInfo n
    let some v := info.value? (allowOpaque := true) |
      throwError "INTEGRATION95 missing value"
    unless req.all (fun p => v.getUsedConstants.contains p) do
      throwError "INTEGRATION95 missing supplier: {n}"
    let axs ← collectAxioms n
    unless axs.all (fun p => allowed.contains p) do
      throwError "INTEGRATION95 nonstandard axiom: {n}"
  logInfo "INTEGRATION95_NATIVE_CLASS_STAR_GUARDS_OK"

#print axioms RHIntegration95.native_class_star_to_checked_grid
#print axioms RHIntegration95.zeta_line_from_native_class_star
#print axioms RHIntegration95.native_class_star_of_all_data
