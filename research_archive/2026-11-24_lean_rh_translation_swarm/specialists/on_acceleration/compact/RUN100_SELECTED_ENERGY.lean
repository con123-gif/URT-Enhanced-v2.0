import Run99SmallCrudeRows
import IntegrationGlobalEnergySpread
import EditorSelectedRecord
import Lean

/-!
RUN100 acceleration — 28 November 2026. SOURCE-MATCHED CONDITIONAL /
PREPARED, not compiled. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS/SWARM/HANDOFF/EXPANSION and relevant current peer commits read.

The actual RUN99 smaller crude-row completion (blob
a88a3ac6c0bbcee65a5691ed64231fce161c4c37) has a weak-spread consumer;
integration d8fe4185 (blob 1baec7311082f60ca41629694068b30cc5760f59)
has the corresponding global-energy producer. Join these existing
declarations at the SAME D, then transport to the editor's selected
count endpoint (03d0e2968201611d277835e99ac5f32361ca5f30).
No new determinant proof, no new analytic proof, no Main import.
Do not repeat the near-rank C route of b91710261 or the C1 path
repair e4f993ab5. Retain all alternative routes.

Let eta=(4 b x^200)^(-1) and
    a0 = 5 b^(-4) + f/(N-1).
The exact B4 budget is a0 + zeta/2 <= eta. The previous integration
specialization used zeta=eta; it leaves eta/2-a0 of budget unused.
Take the full available excess zeta=2(eta-a0).
The already-prepared native scale comparison a0<=eta/2 proves
zeta>=eta>0. In fact 0<=a0 implies zeta<=2eta. No replacement of the
first moment, projector, ramifyingOp correction or C witnesses.
The exact remaining global-energy supplier on a selected record is
    sum_s energy(amplitudeSum univ,{s})
        <= [1+2(eta-a0)] mainEnergy.
This tolerance is at least the previous eta, conditional on the
same scale comparison. No claim that the energy estimate itself
is established; the new junction is strictly about its consumer.

With that supplier, the B4 adjustable theorem gives weakEta spread
for every nonzero scalar c, the RUN99 star gives m*remainder <=
logB^2*budget, and the native budget is exactly f*a*logB^3 (source
AdmissibleData blob 04208a5044bb7cf6464ef142a14d939148bed834).
Use ring only for this final power multiplication. Preserve the
same D, its polar guard, #thick lower bound, quartic scales and
count-escape premise. Set K=5,C=1 in the existing selected-count
criterion, with 6*eps<=epsilon/2. No measurable selection, no
independently optimized data, no removal of count-escape assumption.
The final conditional RH root must still depend on the complete
arithmetic suppliers and independently audited analytic endpoint.

Actual evidence retrieved this run:
- A2 chosen-level leaf run 46125697285, receipt 492e6c7c2590f849ba59eae6f11517b646d72f44:
  leaf and graph exit 0, old local neatness absent from the new
  roots, prune executed, caller replacements NOT checked. Use
  existing accepted object; theta RUN102 already handles callers.
- B3 run 46120566249, caller receipt a40e5ea34dec3ddf16ca751db3ef642a5d64703e:
  actual caller compile exit 0 (4.58s), requested checks true,
  full_RH_replay=false. Keep later timeout separate. Do not rerun
  accepted B3 objects; integration already handles their transport.
- C1 path-repair state status returned 404; no acceptance inferred.
  Lean and lake absent on local PATH. No new native execution,
  rh_scan/prune/reduce/auto/frontier, or graph/axiom PASS claimed.
- Four source blobs authenticated, twelve actual interface anchors
  checked. The source-only checks do not verify elaboration.

RESUME HERE: after the already requested authenticated C2 and
adjustable-B4 replays, compile this as Run100SelectedEnergy in their
combined compact environment with EditorSelectedRecord. Check the
exact budget identity and all five direct-supplier/axiom guards;
then run the shared strict constructor-inclusive graph exporter on
the actual conditional zeta-line root alongside its old roots, with
context-sensitive shared traversal, retaining all pending and old
paths. If a prior module has not compiled, resolve its first actual
diagnostic rather than launching a duplicate cold build. No further
endpoint reformulation: prioritize the actual selected global-energy
supplier and count escape. HANDOFF integration / Landau / kernel /
audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat Filling

namespace RHAcceleration100

noncomputable def excess {P} (D : Data P) : ℝ :=
  2 * (RHAcceleration99.weakEta D -
    (5 * (D.b ^ 4)⁻¹ + D.f * (D.N - 1 : ℝ)⁻¹))

def EnergyAt {P} (D : Data P) : Prop :=
  ∑ s : D.filling.GRes, energy (D.filling.amplitudeSum .univ)
    ({s} : Set D.filling.GRes) ≤
      (1 + excess D) * D.filling.mainEnergy

theorem reserve_nonneg {P} (D : Data P) : RHAcceleration99.weakEta D ≤ excess D := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound :
    D.b ^ 9 ≤ D.N - 1)
  have hsmall : 5 * (D.b ^ 4)⁻¹ + D.f * (D.N - 1 : ℝ)⁻¹ ≤
      RHAcceleration99.weakEta D / 2 := by
    unfold RHAcceleration99.weakEta RHAcceleration99.slackScale
    exact D.le_of_hasLogBound
  unfold excess
  linarith only [hsmall]

theorem star_of_energy {P} (D : Data P) (hEnergy : EnergyAt D) :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget := by
  have hη : 0 < RHAcceleration99.weakEta D := by
    unfold RHAcceleration99.weakEta RHAcceleration99.slackScale
    positivity
  have hζ : 0 ≤ excess D := hη.le.trans (reserve_nonneg D)
  have hbudget : 5 * (D.b ^ 4)⁻¹ + excess D / 2 +
      D.f * (D.N - 1 : ℝ)⁻¹ = RHAcceleration99.weakEta D := by
    unfold excess
    ring
  apply RHAcceleration99.star_of_weak_spread D
  intro c
  exact D.integration_ramified_spread_of_global_energy c hζ hEnergy hbudget.le

def SelectedEnergyOn (P : Parameters) (eps : ℝ) (A : Set ℝ) : Prop :=
  ∀ᶠ x in atTop, x ∈ A → ∃ D : Data P, D.x = x ∧
    log D.logB = eps * D.logX ∧ towerDeg D.s / D.logB ≤ #D.thick ∧
    1e6 * D.logX ≤ D.logX₁ ∧ D.logX₁ ≤ (1e6 * D.logX)^2 ∧
    primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁ ≤
      exp (-(1e6 * D.logX)) ∧ EnergyAt D

theorem selected_of_energy (P : Parameters) (eps : ℝ) (A : Set ℝ)
    (h : SelectedEnergyOn P eps A) : RHEditorSelected.SelectedBudgetOn P eps 5 1 A := by
  unfold SelectedEnergyOn at h
  unfold RHEditorSelected.SelectedBudgetOn
  filter_upwards [h] with x hx
  intro hxA
  obtain ⟨D,hDx,he,hthick,hlo,hhi,hpolar,hEnergy⟩ := hx hxA
  refine ⟨D,hDx,he,hthick,hlo,hhi,hpolar,?_⟩
  change D.m * D.remainder ≤ 1 * (D.f : ℝ) * (D.a : ℝ) * D.logB^5
  calc
    _ ≤ D.logB^2 * D.budget := star_of_energy D hEnergy
    _ = _ := by unfold Data.budget; ring

def SelectedEnergyCount : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 → ∃ S : Set ℕ,
    RHDepCountEscape82.CountEscape S (4 * ε / 9) ∧
    ∀ d : Primes, d.1 ∈ S → ∃ P : Parameters,
      P.d = d ∧ P.N₀ = 18480 ∧
      ∃ eps : ℝ, (0 < eps / 6 ∧ eps < 1 / 100) ∧
        6 * eps ≤ ε / 2 ∧
        SelectedEnergyOn P eps RHPrimeWindow94.QuarticScales

theorem selected_count_of_energy (h : SelectedEnergyCount) :
    RHEditorSelected.SelectedCountBudget := by
  intro ε he
  obtain ⟨S,hcount,hS⟩ := h ε he
  refine ⟨S,hcount,?_⟩
  intro d hd
  obtain ⟨P,hPd,hPM,eps,heps,hslack,hEnergy⟩ := hS d hd
  refine ⟨P,hPd,hPM,eps,5,1,heps,by norm_num,?_,
    selected_of_energy P eps RHPrimeWindow94.QuarticScales hEnergy⟩
  norm_num <;> linarith only [hslack]

theorem zeta_line_from_selected_energy (h : SelectedEnergyCount) :
    RiemannZetaZerosOnLine :=
  RHEditorSelected.zeta_line_from_selected_count (selected_count_of_energy h)

end RHAcceleration100

#print axioms RHAcceleration100.reserve_nonneg
#print axioms RHAcceleration100.star_of_energy
#print axioms RHAcceleration100.selected_of_energy
#print axioms RHAcceleration100.selected_count_of_energy
#print axioms RHAcceleration100.zeta_line_from_selected_energy

open Lean in
run_cmd do
  for (root, req) in #[
    (``RHAcceleration100.reserve_nonneg, #[]),
    (``RHAcceleration100.star_of_energy,
      #[``RHAcceleration100.reserve_nonneg,``RHAcceleration99.star_of_weak_spread,
        ``Data.integration_ramified_spread_of_global_energy]),
    (``RHAcceleration100.selected_of_energy, #[``RHAcceleration100.star_of_energy]),
    (``RHAcceleration100.selected_count_of_energy, #[``RHAcceleration100.selected_of_energy]),
    (``RHAcceleration100.zeta_line_from_selected_energy,
      #[``RHAcceleration100.selected_count_of_energy,
        ``RHEditorSelected.zeta_line_from_selected_count])] do
    let i ← getConstInfo root
    let some v := i.value? (allowOpaque := true) | throwError "RUN100 missing proof {root}"
    unless req.all (fun n => v.getUsedConstants.contains n) do
      throwError "RUN100 missing direct supplier {root}"
    let axs ← collectAxioms root
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN100 unexpected axiom {root}: {axs}"
  logInfo "RUN100_SELECTED_ENERGY_GUARDS_OK"
