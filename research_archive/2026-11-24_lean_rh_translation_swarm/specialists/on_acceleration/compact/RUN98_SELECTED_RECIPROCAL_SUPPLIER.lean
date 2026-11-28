import C2ExactReciprocalBudget
import EditorSelectedRecord
import Lean

/-!
RUN98 acceleration — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read SWARM/HANDOFF/EXPANSION/AGENTS and latest peers:
108e8dac (fixed-fiber equivalence), d6d56f3d (joint witness),
1aa0caed/cbba4f59 (weak selected record and binder repair),
0a954c48 (C2 path repair). Do not duplicate the strict mean or path fix.

Actual supplier junction, not a new prime estimate: replace RUN97's
measured family and envelope with the latest editor's one selected
native record, retaining the same independent rows, IndexLe and
all-conjugate upper volume. Use the exact C supplier, not a new C proof.
For d=rowDim, n>0, H=mainHeight, L=logB*budget,
E=m² t x^999, U=x1² b²+x^99+4E, S=m*remainder:
    d(H-L-E)<=n(H-S+L)+2δ+(d-n)U.
Thus the sufficient selected arithmetic cost is
    (d-n)(L+U-H)+dE+2δ <= n*(K-2L).
Adding these signed inequalities gives n*S<=n*K. No sign of H or
S, no uniform rank threshold, no new integral witness, no division by
a variable dimension until n>0 is established. The same D must satisfy
the native weak polar guard. This is a local supplier for the editor's
actual SelectedBudgetOn, not a substitute for proving existence of
that D and y or the prime count escape condition. Do not interpret the
earlier a.e. formulation as a strictly weaker within-fiber requirement.

Close the source interface explicitly: native ShortAndEnough blob
b99eea0689be372d84362c58272b705e104b6a3a lines 36–42 and lightweight
adapter ab798deac49f97177fdcf38a9f35f00252b3cedc. In this run connector JS
extracted both definition bodies by unique declaration anchors and
compared byte-for-byte after undoing only run90MainAsk renaming: 2/2
exact. Also inspected corrected selected endpoint blob
03d0e2968201611d277835e99ac5f32361ca5f30 and C supplier blob
daa6714e88afb7277734fda3dc09f4f037286e2a, checking actual names and binder.
Provide a named rfl bridge plus an independent equality-via-both-identities
control; not a claim they have already passed Lean. No extra prime estimate.
Use the selected endpoint already prepared by the editor (no duplication).

Actual CI 46108846902: wrapper job success, research status ERROR.
Receipt 242c577da80d81603acfd82b541a9c5c9118f568 reports 13 authenticated
retained module objects, restore exit 0, original extension exit 0
(8895.32 s), failure "invalid fresh Lean path", new_Lean_execution=false.
Peer 0a954c48 already registered a narrow repair and cache retention;
do not launch a duplicate cold build. Local lean/lake absent. No new
kernel execution, rh_scan/prune/reduce/auto/frontier or graph result.
All original and reduced graphs, axioms and unresolved obligations retained.
No Main import, no claimed RH theorem used.

RESUME HERE: after the existing C2 path-repair and selected-record/count
replays produce accepted receipts, compile this file as
Run98SelectedReciprocalSupplier in their authenticated combined environment;
require both equality controls, five axiom reports, supplier guards, and
constructor-inclusive original/reduced root graphs. Preserve first actual
diagnostic on failure; do not start another cold build. HANDOFF integration,
editor, audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module
open LinearMap Submodule LevelPlaces.LevelForm

namespace RHAcceleration98

theorem remainder_bridge {P} (D : Data P) :
    D.run90Remainder = D.remainder := rfl

theorem remainder_bridge_control {P} (D : Data P) :
    D.run90Remainder = D.remainder := by
  rw [Data.run90Remainder_eq, Data.remainder_eq]

/-- Actual original-data cost predicate; no measurable witness required. -/
def ExactCostAt {P} (D : Data P) (K : ℝ) : Prop :=
  ∃ (n : ℕ) (y : Fin n → D.rows) (δ : ℝ),
    0 < n ∧ LinearIndependent ℂ y ∧ D.IndexLe y δ ∧
    (∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp
      (n * (D.mainHeight - D.m * D.remainder + D.logB * D.budget))) ∧
    (((D.rowDim : ℝ) - (n : ℝ)) *
      (D.logB * D.budget +
        (D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 +
          4 * (D.m : ℝ)^2 * D.t * D.x^999) - D.mainHeight) +
      D.rowDim * ((D.m : ℝ)^2 * D.t * D.x^999) + 2*δ ≤
      (n : ℝ)*(K-2*(D.logB*D.budget)))

theorem selected_budget_of_exact_cost {P} (D : Data P) (K : ℝ)
    (h : ExactCostAt D K) : D.m * D.run90Remainder ≤ K := by
  rcases h with ⟨n,y,δ,hn,hi,hI,hV,hcost⟩
  have hlong := Data.run96_integral_forms_long_exact_reciprocal hi hI hV
  let d : ℝ := D.rowDim
  let H : ℝ := D.mainHeight
  let L : ℝ := D.logB * D.budget
  let E : ℝ := (D.m : ℝ)^2 * D.t * D.x^999
  let U : ℝ := D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ)^2 * D.t * D.x^999
  let S : ℝ := D.m * D.remainder
  have hnR : 0 < (n : ℝ) := by exact_mod_cast hn
  change d*(H-L-E) ≤ (n : ℝ)*(H-S+L)+2*δ+(d-n)*U at hlong
  change (d-n)*(L+U-H)+d*E+2*δ ≤ (n : ℝ)*(K-2*L) at hcost
  have hS : S ≤ K := by
    apply le_of_mul_le_mul_left _ hnR
    nlinarith only [hlong,hcost]
  rw [remainder_bridge]
  exact hS

/-- Constants precede x; one native selected record and its row witness. -/
def SelectedExactCostOn (P : Parameters) (eps : ℝ) (K : ℕ) (C : ℝ)
    (A : Set ℝ) : Prop :=
  ∀ᶠ x in atTop, x ∈ A → ∃ D : Data P, D.x = x ∧
    log D.logB = eps * D.logX ∧ towerDeg D.s / D.logB ≤ #D.thick ∧
    1e6 * D.logX ≤ D.logX₁ ∧ D.logX₁ ≤ (1e6 * D.logX)^2 ∧
    primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁ ≤
      exp (-(1e6 * D.logX)) ∧
    ExactCostAt D (C * (D.f : ℝ) * (D.a : ℝ) * D.logB^K)

theorem selected_of_exact_cost (P : Parameters) (eps : ℝ) (K : ℕ)
    (C : ℝ) (A : Set ℝ) (h : SelectedExactCostOn P eps K C A) :
    RHEditorSelected.SelectedBudgetOn P eps K C A := by
  unfold SelectedExactCostOn at h
  unfold RHEditorSelected.SelectedBudgetOn
  filter_upwards [h] with x hx
  intro hxA
  obtain ⟨D,hxD,hlog,hthick,hlo,hhi,hpolar,hcost⟩ := hx hxA
  exact ⟨D,hxD,hlog,hthick,hlo,hhi,hpolar,selected_budget_of_exact_cost D _ hcost⟩

theorem grid_from_selected_exact_cost (P : Parameters) {eta eps : ℝ}
    (heta : 0 < eta) (K : ℕ) (C : ℝ) (hC : 0 ≤ C)
    (hslack : ((K : ℝ)+1)*eps ≤ eta)
    (h : SelectedExactCostOn P eps K C RHPrimeWindow94.QuarticScales) :
    RHPrimeWindow88.EndpointGrid P.d P.N₀ eta :=
  RHEditorSelected.endpoint_from_selected P heta K C hC hslack
    (selected_of_exact_cost P eps K C RHPrimeWindow94.QuarticScales h)

end RHAcceleration98

#print axioms RHAcceleration98.remainder_bridge
#print axioms RHAcceleration98.remainder_bridge_control
#print axioms RHAcceleration98.selected_budget_of_exact_cost
#print axioms RHAcceleration98.selected_of_exact_cost
#print axioms RHAcceleration98.grid_from_selected_exact_cost

open Lean in
run_cmd do
  for (n, req) in #[
    (``RHAcceleration98.remainder_bridge, #[]),
    (``RHAcceleration98.remainder_bridge_control,
      #[``Data.run90Remainder_eq,``Data.remainder_eq]),
    (``RHAcceleration98.selected_budget_of_exact_cost,
      #[``Data.run96_integral_forms_long_exact_reciprocal,``RHAcceleration98.remainder_bridge]),
    (``RHAcceleration98.selected_of_exact_cost,
      #[``RHAcceleration98.selected_budget_of_exact_cost]),
    (``RHAcceleration98.grid_from_selected_exact_cost,
      #[``RHAcceleration98.selected_of_exact_cost,``RHEditorSelected.endpoint_from_selected])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN98 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN98 missing proof {n}"
    let deps := v.getUsedConstants
    unless req.all (fun a => deps.contains a) do
      throwError "RUN98 missing direct supplier {n}"
    for a in #[``Data.integral_forms_long,``Data.audit_integral_forms_long_exact] do
      if deps.contains a then throwError "RUN98 stale direct supplier {a}"
  logInfo "RUN98_SELECTED_RECIPROCAL_SUPPLIER_GUARDS_OK"
