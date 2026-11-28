import IntegrationGuardedFinitePower
import DepCountEscape82
import Lean

/-!
# Prime RUN98 — single count-escape finite-budget arithmetic premise
28 November 2026. HUMAN SOURCE-MATCHED / PREPARED; NOT compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION; head e7fba27b.
Peer math 3198fbc2, dependency 416ee719 and integration cc8ccd1c supply
count escape and finite log powers respectively; acceleration e7fba27b
is about mean/exact C2, not this junction. No rederivation of either.

Stage exact modules:
 IntegrationGuardedFinitePower =
 integration/2026-11-28_GUARDED_FINITE_POWER_ENDPOINT.lean
 blob ff20a7853578c8e3672914710cadf25d98766140
 DepCountEscape82 =
 dependencies/compact/RUN82_COUNT_ESCAPE_NATIVE_SELECTOR.lean
 blob edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9
Both PREPARED, not verified. Reuse their own dependency stages.

RESULT: combine the two peer criteria at their actual endpoint. For every
analytic epsilon in the accepted range, exhibit a set S of primes whose
count is NOT O(X^(1-2 epsilon/9)). For each d in S it suffices to choose
ONE native P with P.d=d and P.N0=18480 (rather than prove the estimate for
every P), and choose eps,K,C with 0<eps<1/100, C>=0, (K+1)eps<=epsilon/2.
On that P require only the existing GuardedBudgetOn at quartic scales:
                 m*run90Remainder <= C*f*a*(log b)^K.
All five guards of integration's definition survive. P,eps,K,C and the
threshold may depend on d and analytic epsilon, but are fixed before x
grows. S is fixed before selecting a twist. Native P supplies mod 8 and
coprimality; no separate congruence-class 9239 restriction is necessary
IF such P exists. Do not claim existence of P for arbitrary primes.
No need to make choices measurable or uniform, since the endpoint proof
fixes one d and one P. No lower bound on the signed remainder is added.

Proof: choose d in S in the count-escape endpoint interface. Apply the
peer endpoint_from_budget with eta=epsilon/2 and the chosen P and
constants. Rewrite P.d=d and P.N0=18480. The intrinsic native guards are
the exact terms already used by integration's canonical P caller.
Feed the resulting CountEscapeGrid to the dependency peer root.
This is a new actual caller bridge, not another proof of either supplier.
The arithmetic CountEscapeBudget is UNPROVED; no equivalence claimed.
Failure to obtain enough primes cannot be repaired by merely unbounded S;
nor may eps,K,C be chosen after x. The native Data.remainder definition
bridge is still separately required for arithmetic suppliers.

Evidence: retrieved latest RUN95 native receipt blob
b58fac802d12d1f3313fe5dc65ab06520577b841 (conditional graph PASS,
arithmetic=false, full RH=false). 4 unique actual source anchors checked,
8 removed/duplicated anchor controls rejected. Local command -v lean/lake
returned no path. Current orchestrator pending/cancelled; shared queue
46114460776 pending at inspection. No native execution of this module
or peers claimed; no native rh_scan/prune/reduce/auto/frontier run.
Retain previous RUN95/96/97 and all original/reduced graphs. New graph
is only a source-level path: CountEscapeBudget -> peer finite-power
endpoint + CountEscapeGrid -> peer count selector -> signed residue ->
reflection. Require strict constructor-inclusive audit, not just direct
guards below; do not infer global dependency removal.

RESUME HERE: stage the two exact peer modules in the retained RUN94
analytic workspace, then compile this file as Run98CountEscapeBudget
and check both axiom reports and direct guards. Record first actual
compiler failure if any, export old and new conditional roots with the
4.35 strict collector, require no Main/star/RH shortcut, and keep the
unproved CountEscapeBudget in the frontier. Coordinate existing queue;
do not start redundant cold A/B/C builds.
HANDOFF TO integration / dependency / math / audit / kernel. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat

namespace RHPrimeWindow98

/-- One chosen native P and one finite log-power budget per good twist.
All quantifiers over scale and adjusted records are inside GuardedBudgetOn. -/
def CountEscapeBudget : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 → ∃ S : Set ℕ,
    RHDepCountEscape82.CountEscape S (4 * ε / 9) ∧
    ∀ d : Primes, d.1 ∈ S → ∃ P : Parameters,
      P.d = d ∧ P.N₀ = 18480 ∧
      ∃ (eps : ℝ) (K : ℕ) (C : ℝ),
        (0 < eps / 6 ∧ eps < 1 / 100) ∧ 0 ≤ C ∧
        ((K : ℝ) + 1) * eps ≤ ε / 2 ∧
        RHIntegration97.GuardedBudgetOn P eps K C RHPrimeWindow94.QuarticScales

theorem count_escape_grid_from_budget (h : CountEscapeBudget) :
    RHDepCountEscape82.CountEscapeGrid := by
  intro ε he
  obtain ⟨S, hcount, hS⟩ := h ε he
  refine ⟨S, hcount, ?_⟩
  intro d hd
  obtain ⟨P, hPd, hPM, eps, K, C, heps, hC, hslack, hbudget⟩ := hS d hd
  have heta : 0 < ε / 2 := by linarith [he.1]
  have hgrid : RHPrimeWindow88.EndpointGrid P.d P.N₀ (ε / 2) :=
    RHIntegration97.endpoint_from_budget P heta heps K C hC hslack hbudget
  have hguards : P.d.1 % 8 = 7 ∧ P.N₀.Coprime P.d :=
    ⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩
  simpa only [hPd, hPM] using And.intro hguards hgrid

theorem zeta_line_from_count_escape_budget (h : CountEscapeBudget) :
    RiemannZetaZerosOnLine :=
  RHDepCountEscape82.zeta_line_from_count_escape_grid (count_escape_grid_from_budget h)

end RHPrimeWindow98

#print axioms RHPrimeWindow98.count_escape_grid_from_budget
#print axioms RHPrimeWindow98.zeta_line_from_count_escape_budget

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHPrimeWindow98.count_escape_grid_from_budget,
        #[``RHIntegration97.endpoint_from_budget]),
      (``RHPrimeWindow98.zeta_line_from_count_escape_budget,
        #[``RHPrimeWindow98.count_escape_grid_from_budget,
          ``RHDepCountEscape82.zeta_line_from_count_escape_grid])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN98 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN98 missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN98 missing direct supplier {n}"
  logInfo "RUN98_COUNT_ESCAPE_BUDGET_GUARDS_OK"
