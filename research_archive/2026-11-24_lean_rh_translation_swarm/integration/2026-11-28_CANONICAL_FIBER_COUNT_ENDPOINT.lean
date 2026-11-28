import EditorAEFiberBudget
import MathCanonicalCount
import Lean

/-!
# Integration — canonical count escape on one polar-good fiber (28 Nov 2026)
SOURCE-MATCHED HUMAN IMPLICATION / PREPARED, not native-compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read latest ONE_EQUATION_MISSION, LIVE_PROOF_SPINE, LIVE_OBLIGATIONS,
SWARM, AGENTS, HANDOFF and latest peer commits 3af9809c, a739d8b0,
f45746a0, 9ccb174e, 5c8c0ef5, cfc5eaa3 and previous cc8ccd1c.
Source branch head inspected 3af9809c0a10731fb8d7518552e1a9401bafb6d5.
The compact mission supersedes the earlier old-pin assignment.

One actual missing caller: connect the editor's almost-everywhere
single-fiber budget to the canonical count-escape selector, not a
second proof of the strict polar mean or count density.

Stage EditorAEFiberBudget from
specialists/proof_editor/2026-11-28_AE_GUARDED_FIBER_BUDGET.lean
(commit a739d8b03abe03acb7ca6e5dc75919fb8fe0477e);
MathCanonicalCount from math/2026-11-28_CANONICAL_COUNT_ESCAPE_EQUATION.lean
(commit 5c8c0ef5c30ed6324d1fd9515450aea916813fcb).
Native DataExist.lean (634c6a1f88791a3bb770326785b70411e8289b41),
AdmissibleData.lean (04208a5044bb7cf6464ef142a14d939148bed834):
the update of logX1 and its scale proof changes neither x, logB,
s, thick, m, a nor f; it can change the signed remainder.
Mathlib Measure/Restrict.lean pinned ae_restrict_of_forall_mem
signature read directly: measurable set and predicate true at every
member imply the restricted a.e. predicate. No measurability of the
predicate itself required.

Let G_fiber(e) consist of primes d with one native P, P.d=d,
P.N0=18480, and fixed eps,K,C meeting the RUN98 slack and sign guards,
for which eventually on quartic x there is one native D with the
five exists_data facts and the editor's FiberBudgetAt. In particular
only the strict polar-good portion of the interval needs the bound
m*run90Remainder <= C*f*a*(log b)^K, up to a null exceptional set.
Then for every analytic e in the native range the sufficient target is
  limsup_{X -> infinity} #G_fiber(e)(X) / X^(1-2e/9) = +infinity.
Use exactly CountEscape, not an ordinary limit, infinite cardinality,
or a fixed exponent equality. Per-prime P,eps,K,C precede x; the
base D may depend on x, but precedes u. No uniform choice across primes.

Proof of the actual caller: select d from this canonical set, apply
RHEditorAE.endpoint_from_budget at eta=e/2; intrinsic P gives mod 8
and coprimality. Rewrite P.d,P.N0. Feed CountEscapeGrid to the exact
RUN82 native-density/Landau/reflection adapter. No RH theorem imported.

Old universal guarded budget implies this fiber budget: take D from
native exists_data at a sufficiently large x in the grid. For every
u in its restricted interval and every valid updated scale proof hs,
if the strict polar inequality holds, the updated record satisfies all
five old guards (strict implies weak). Hence the old estimate applies.
This holds everywhere on the interval and so almost everywhere.
The old canonical prime set is contained in the new one on primes;
prime-filtered count monotonicity supplies the implication of old
canonical requirement to the new one. No converse is claimed.
Do not infer that an arithmetic-good point must coincide with a
polar-good point absent the restricted a.e. premise. Do not remove
the rank, C2 normalization or actual arithmetic supplier obligations.

Verification in this run: 10 unique source declaration anchors
checked against current peer files, 20 missing/duplicate anchor
controls rejected. Pinned exists_data and Data record definitions and
Mathlib ae_restrict_of_forall_mem signature retrieved. Shared C2 cache
job 46108846902 / 140867652611 queried, still in_progress; no artifact
listed. No kernel replay of this file, no rh_scan/prune/reduce/auto/
frontier execution, no new graph or axiom PASS. Existing graphs and
conditional RUN94/95 receipts retained. Source-level reduced graph:
fiber-count -> editor endpoint -> CountEscapeGrid -> RUN82 selector
and signed Landau -> reflection. Old canonical-count root retained;
no transitive deletion inferred.

RESUME HERE: in the authenticated RUN94 workspace after actual
EditorAEFiberBudget and MathCanonicalCount dependency receipts,
compile this file as IntegrationCanonicalFiberCount with normal kernel,
five axiom reports and direct guards; export its constructor-inclusive
graph and compare with the old canonical count root. If a supplier
fails, repair its first actual diagnostic, no duplicate cold build.
HANDOFF integration/editor/prime/dependency/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat
open MeasureTheory

namespace RHIntegrationFiberCount

theorem fiber_of_guarded (P : Parameters) {eps : ℝ}
    (he : 0 < eps/6 ∧ eps < 1/100) (K : ℕ) (C : ℝ) (A : Set ℝ)
    (h : RHIntegration97.GuardedBudgetOn P eps K C A) :
    RHEditorAE.FiberBudgetOn P eps K C A := by
  unfold RHIntegration97.GuardedBudgetOn at h
  unfold RHEditorAE.FiberBudgetOn
  filter_upwards [exists_data P he.1 he.2, h] with x hd hg
  intro hx
  obtain ⟨D,hDx,h1,h2,h3,h4⟩ := hd
  refine ⟨D,hDx,h1,h2,h3,h4,?_⟩
  unfold RHEditorAE.FiberBudgetAt
  apply ae_restrict_of_forall_mem measurableSet_Icc
  intro u hu hpolar hs
  let E := {D with logX₁ := u, scale := hs}
  change E.m * E.run90Remainder ≤ C * (E.f : ℝ) * (E.a : ℝ) * E.logB^K
  have hlog : log E.logB = eps * E.logX := by
    simpa only [Data.b, Data.x, log_exp, ← hDx] using h3
  have ht : towerDeg E.s / E.logB ≤ #E.thick := by
    simpa only [Data.b, log_exp] using h4
  exact hg hx E hDx hlog ht hu.1 hu.2 hpolar.le

def FiberGood (ε : ℝ) (d : Primes) : Prop :=
  ∃ P : Parameters, P.d = d ∧ P.N₀ = 18480 ∧
    ∃ (eps : ℝ) (K : ℕ) (C : ℝ),
      (0 < eps / 6 ∧ eps < 1 / 100) ∧ 0 ≤ C ∧
      ((K : ℝ) + 1) * eps ≤ ε / 2 ∧
      RHEditorAE.FiberBudgetOn P eps K C RHPrimeWindow94.QuarticScales

def fiberGoodSet (ε : ℝ) : Set ℕ :=
  {n | ∀ hp : n.Prime, FiberGood ε ⟨n,hp⟩}

def CanonicalFiberCount : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 →
    RHDepCountEscape82.CountEscape (fiberGoodSet ε) (4*ε/9)

theorem fiber_good_of_budget_good {ε : ℝ} {d : Primes}
    (h : RHMathCanonicalCount.BudgetGood ε d) : FiberGood ε d := by
  obtain ⟨P,hd,hM,eps,K,C,he,hC,hslack,hb⟩ := h
  exact ⟨P,hd,hM,eps,K,C,he,hC,hslack,
    fiber_of_guarded P he K C RHPrimeWindow94.QuarticScales hb⟩

theorem canonical_fiber_of_old (h : RHMathCanonicalCount.CanonicalCountEscapeBudget) :
    CanonicalFiberCount := by
  intro ε he
  apply RHMathCanonicalCount.countEscape_mono_prime (hS := h ε he)
  intro n hn hgood
  show ∀ hp : n.Prime, FiberGood ε ⟨n,hp⟩
  intro hp
  exact fiber_good_of_budget_good (hgood hp)

theorem count_escape_grid_from_fiber (h : CanonicalFiberCount) :
    RHDepCountEscape82.CountEscapeGrid := by
  intro ε he
  refine ⟨fiberGoodSet ε, h ε he, ?_⟩
  intro d hd
  obtain ⟨P,hPd,hPM,eps,K,C,heps,hC,hslack,hbudget⟩ := hd d.2
  have heta : 0 < ε/2 := by linarith [he.1]
  have hgrid : RHPrimeWindow88.EndpointGrid P.d P.N₀ (ε/2) :=
    RHEditorAE.endpoint_from_budget P heta heps K C hC hslack hbudget
  have hguards : P.d.1 % 8 = 7 ∧ P.N₀.Coprime P.d :=
    ⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩
  simpa only [hPd,hPM] using And.intro hguards hgrid

theorem zeta_line_from_canonical_fiber (h : CanonicalFiberCount) :
    RiemannZetaZerosOnLine :=
  RHDepCountEscape82.zeta_line_from_count_escape_grid (count_escape_grid_from_fiber h)

end RHIntegrationFiberCount

#print axioms RHIntegrationFiberCount.fiber_of_guarded
#print axioms RHIntegrationFiberCount.fiber_good_of_budget_good
#print axioms RHIntegrationFiberCount.canonical_fiber_of_old
#print axioms RHIntegrationFiberCount.count_escape_grid_from_fiber
#print axioms RHIntegrationFiberCount.zeta_line_from_canonical_fiber

open Lean in
run_cmd do
  for (n, req) in #[
    (``RHIntegrationFiberCount.fiber_of_guarded,
      #[``exists_data,``ae_restrict_of_forall_mem]),
    (``RHIntegrationFiberCount.fiber_good_of_budget_good,
      #[``RHIntegrationFiberCount.fiber_of_guarded]),
    (``RHIntegrationFiberCount.canonical_fiber_of_old,
      #[``RHIntegrationFiberCount.fiber_good_of_budget_good,
        ``RHMathCanonicalCount.countEscape_mono_prime]),
    (``RHIntegrationFiberCount.count_escape_grid_from_fiber,
      #[``RHEditorAE.endpoint_from_budget]),
    (``RHIntegrationFiberCount.zeta_line_from_canonical_fiber,
      #[``RHIntegrationFiberCount.count_escape_grid_from_fiber,
        ``RHDepCountEscape82.zeta_line_from_count_escape_grid])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "INTEGRATION_FIBER_COUNT unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "INTEGRATION_FIBER_COUNT missing supplier {n}"
  logInfo "INTEGRATION_CANONICAL_FIBER_COUNT_GUARDS_OK"
