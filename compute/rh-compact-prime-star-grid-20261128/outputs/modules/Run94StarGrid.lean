import Run91PrincipalBridge
import New.Data.DataExist
import Lean

/-!
# RUN94 — accepted native endpoint; discharge the independent TailGrid interface by the native window
28 November 2026. VERIFIED scope below; NEW candidate below is source-matched, NOT yet compiled.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679; Lean 4.35.0. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger fetched at blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS/SWARM/HANDOFF/EXPANSION read. No live ledger or physics edit.

## Native receipt accepted, not a full RH proof
Actual run 46092027436, 28 Nov 01:36:42 UTC, source cf80e55a6ea783e7d309dbe255efccbb72fe4528,
status.json blob b1e8050c84861979964fcbafc07c313892772acc (returncode 0, 1345.2 s);
outputs/run91_receipt.json blob 0b2bcdbd7e7988f607b8d4dbbc1c0a27ef2fb58b;
outputs/analytic/endpoint_receipt.json blob ffc02c8cddf713be4b9f7ca19536c6355395c5e4;
principal_bridge.log blob 222bc072af078001a65ae720c8138f43ee9364d9, analytic/endpoint.log
762f4407839d7c29b7c2a7786dc58fd8ef649cd4, adapter.log cd0b3226dc1d7766c40a33b3a5ddd994a2c692ba.
All at cathedral-research-state: compute/rh-compact-prime-endpoint-direct-cancel-20261128/.
Verified all THREE compiled modules, 7 analytic + 3 adapter + 2 bridge roots, 4 original probes.
All report only propext, Classical.choice, Quot.sound; all requested direct guards passed;
omitted-grid negative control rejected at expected line 488. The runner rehashed compiler
archive, verified pinned source and Mathlib. Olean SHA256:
Run88Endpoint cfb59e9ec61bec0158ed1bd62c9f9bd43c6d8692eda418a685bfdd51606e86fa;
Run90Adapter bf4908300ab47303a49144cf81ff86bbda031a4e7b7774c30e220b94e60e6ed6;
Run91PrincipalBridge b116de9d8cba6a28dbe0f9fc4947e1a950697403e2cf95b8c0f4318ea4fb7ccc.
Original definition comparison and constructor-inclusive graph are still outstanding;
receipt explicitly arithmetic_premise_proved=false, pnt_tail_proved_here=false, full_RH_replay=false.
RUN92 failed evidence stays intact. Do not infer global pruning from successful local guards.

## Actual remaining interface, alternative to the fixed-scale GoodGrid + TailGrid route
Source New/Main.lean lines 149–167, blob 198ed5bf26aa294898931e0649bc2b88f1389f65, native
eventually_primeError_le_rpow; DataExist.lean blob 634c6a1f88791a3bb770326785b70411e8289b41
exists_data; OneSidedCriterion.lean blob 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3
IsPolar.exists_window_sub_mul_le; AdmissibleData.lean blob 04208a5044bb7cf6464ef142a14d939148bed834.
Use the *existing* native polar window rather than an additional pointwise PNT premise.
Fix P and epsilon first. Let S be any subset of the positive real scales (the argument
also works for arbitrary S). Suppose eventually, for every x in S, EVERY admissible D
at x satisfies the renamed star. For x in S large, exists_data supplies D with
u0=log x1 >= t^2 where t=10^6 log x, and log log b=epsilon log x, T/log b<=#thick.
Positivity and that inequality give c=T/#thick<=log b<=exp(t) from the same data.
The polar window gives u in [t,t^2] with R_M(exp u)-c R_1(exp u)<=exp(-t).
Replace only logX1 by u: u>=t and u<=u0 preserve all three affected scale guards
(logX1 lower, upper relative to logB, and log logX1 upper). All other fields are unchanged,
especially x and c. The star assumption applies AFTER changing scale, to the SAME D'.
The exact remainder identity and budget comparison are precisely those of the accepted
adapter and original caller. Thus the bound holds on S; for S={k^4}, the verified
quartic interpolation and principal/functional-equation modules apply.
No external PNT tail assumption, no fixed second-scale equation in this route.
This trades the old existential GoodGrid premise for an eventual UNIVERSAL star
on grid data (not a logical weakening of GoodGrid alone; do not equate them).
It is a restriction of the actual native all-data star to sufficiently large fourth-power
scales and relevant principal auxiliary class. It does NOT establish that star.
The preexisting human polar route is reused, not claimed as a new analytic theorem.

Source graph old accepted: GoodGrid + TailGrid -> endpoint_from_good_grid ->
principal grid -> reflection. Candidate: eventual grid-restricted star + native exists_data
+ polar window -> endpoint -> existing principal/functional equation.
The original Main.lean theorem, all original/reduced graphs, and failed routes preserved.
Exact original Data.remainder vs run90Remainder bridge remains separately pending.
Executed here: retrieved actual receipts and source; six unique matched edits in native
pointwise body and five in accepted principal bridge, all other proof lines reused.
No local Lean execution or new rh_scan/prune/auto/frontier result. No native replay
claimed for this file. No original Main import. All source premises and signs retained.
Independent audit requested for new wrapper (especially D' record update and exact caller).

RESUME HERE: replay this single module in authenticated compact workspace with accepted
Run91PrincipalBridge.olean and its two dependencies, build only New.Data.DataExist:olean
if absent. Check four root axioms, direct guards, and full constructor-inclusive graph;
verify no path to New.grh or native star theorem. Compare original definitions via rfl
in separate heavy-source bridge, never import the claimed RH theorem. Preserve first actual
error or complete receipt. HANDOFF TO kernel/integration/editor. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module
namespace RHPrimeWindow94

theorem eventually_primeError_on_set (P : Parameters) {ε : ℝ}
    (h : 0 < ε / 6 ∧ ε < 1 / 100) (S : Set ℝ)
    (hstar : ∀ᶠ x in atTop, x ∈ S → ∀ D : Data P, D.x = x →
      D.m * D.run90Remainder ≤ D.logB ^ 2 * D.budget) :
    ∀ᶠ x in atTop, x ∈ S → primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1) := by
  filter_upwards [h.elim (exists_data P), tendsto_log_atTop.const_mul_atTop (r := 1e6) (by bound)
    ((isPolar_primeError PrimeSevenModEight.mod_eight (P.coprime_N₁_d
    0).coprime_mul_right).exists_window_sub_mul_le (isPolar_primeError PrimeSevenModEight.mod_eight
    P.d.coprime_one_left)), hstar] with x ⟨D, _, _, l, e, H'⟩ W hs
  intro hxS
  subst x; simp only [log_exp, Set.mem_preimage, ← exp_mul] at *
  obtain := D.hasLogLower_of_le H', D.scale
  -- move `log x₁` to a point `u` of the window where `R_{N₀} - (#tops / #thick) R₁ ≤ x ^ (-10⁶)`
  obtain ⟨u, ⟨a, b⟩, w⟩ := W (towerDeg D.s / #D.thick) ⟨by bound, D.le_of_hasLogBound⟩
  let D' := {D with logX₁ := u, scale := by grw [b, l] <;> grind}
  have := D'.hasLogLower_of_le H'
  have starD' : D'.m * D'.run90Remainder ≤ D'.logB ^ 2 * D'.budget := hs hxS D' rfl
  calc primeError P.d P.N₀ D.x = D'.m * D'.run90Remainder / D'.m / D'.a / #D.thick + (primeError P.d P.N₀
      D'.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D'.x₁) := by simp [run90Remainder_eq, tops,
      card_placeClass_eq, field, HasLogBound.pos D', ne_of_gt]
    _ ≤ D'.logB ^ 2 * D'.budget / D'.m / D'.a / #D.thick + exp
      (-(1e6 * D.logX)) := by grw [starD', w]
    -- the first term is `f log⁵ b / (m #thick) ≤ φ(N₀) log⁶ b / √x`, and `log b = x ^ ε`
    _ ≤ _ := D'.le_of_hasLogBound (by grind)


def QuarticScales : Set ℝ := Set.range (fun k : ℕ => (k : ℝ)^4)

def StarGrid (P : Parameters) : Prop :=
  ∀ᶠ x in atTop, x ∈ QuarticScales → ∀ D : Data P, D.x = x →
    D.m * D.run90Remainder ≤ D.logB ^ 2 * D.budget

theorem endpoint_from_star_grid (P : Parameters) {ε : ℝ}
    (he : 0 < ε / 6 ∧ ε < 1 / 100) (hs : StarGrid P) :
    RHPrimeWindow88.EndpointGrid P.d P.N₀ ε := by
  obtain ⟨X,hX⟩ := Filter.eventually_atTop.1
    (eventually_primeError_on_set P he QuarticScales hs)
  obtain ⟨K,hK⟩ := exists_nat_gt (max X 1)
  refine ⟨K, ?_⟩
  intro k hk
  have hKk : (K : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk
  have hk1 : (1 : ℝ) ≤ (k : ℝ) := (le_max_right X 1).trans (hK.le.trans hKk)
  have hk4 : (k : ℝ) ≤ (k : ℝ)^4 := by
    have hk0 : (0 : ℝ) ≤ (k : ℝ) := by positivity
    have h2 : (k : ℝ) ≤ (k : ℝ)^2 := by
      nlinarith [mul_nonneg hk0 (sub_nonneg.mpr hk1)]
    have h2one : (1 : ℝ) ≤ (k : ℝ)^2 := hk1.trans h2
    have h4 : (k : ℝ)^2 ≤ (k : ℝ)^4 := by
      nlinarith [mul_nonneg (sq_nonneg (k : ℝ)) (sub_nonneg.mpr h2one)]
    exact h2.trans h4
  exact hX _ ((le_max_left X 1).trans (hK.le.trans (hKk.trans hk4))) ⟨k,rfl⟩

/-- No independent TailGrid. This is the actual unresolved star, restricted to the
native auxiliary class and eventual fourth-power scales; independent of epsilon. -/
def ClassStarGrid : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) → StarGrid P

theorem principal_grid_from_star (hin : ClassStarGrid) :
    RHPrimeWindow88.PrincipalGrid := by
  intro d hd
  let q : ℕ := 1
  have h : d = (9240 * q - 1 : ZMod (18480 * q)) := by
    change (d : ZMod 18480) = (9240 - 1 : ZMod 18480)
    have hcast : ((9240 - 1 : ℕ) : ZMod 18480) = (9240 : ZMod 18480) - 1 := by
      rw [Nat.cast_sub (by norm_num : (1 : ℕ) ≤ 9240)] <;> norm_num
    exact hd.trans hcast
  let P := mk _ d ⟨q, rfl⟩ d.2 (by
    simp [← natCast_eq_zero_iff, h]; norm_cast; simp [↓natCast_eq_zero_iff, ← mul_assoc,
      mul_dvd_mul_iff_right])
  refine ⟨⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩, ?_⟩
  intro ε he
  have hc : (P.d : ZMod 18480) = (9239 : ZMod 18480) := by
    change d = (9239 : ZMod 18480)
    exact hd
  have hg := hin P (by rfl) hc
  have he' : 0 < (ε/2) / 6 ∧ ε/2 < 1 / 100 := by
    constructor <;> linarith [he.1,he.2]
  exact endpoint_from_star_grid P he' hg

theorem zeta_line_from_star (hin : ClassStarGrid) :
    RiemannZetaZerosOnLine :=
  RHPrimeWindow88.zeta_line_from_endpoint_grid (principal_grid_from_star hin)


end RHPrimeWindow94

#print axioms RHPrimeWindow94.eventually_primeError_on_set
#print axioms RHPrimeWindow94.endpoint_from_star_grid
#print axioms RHPrimeWindow94.principal_grid_from_star
#print axioms RHPrimeWindow94.zeta_line_from_star

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (n, required) in #[
      (``RHPrimeWindow94.eventually_primeError_on_set,
        #[``exists_data, ``IsPolar.exists_window_sub_mul_le, ``Data.run90Remainder_eq]),
      (``RHPrimeWindow94.endpoint_from_star_grid,
        #[``RHPrimeWindow94.eventually_primeError_on_set]),
      (``RHPrimeWindow94.principal_grid_from_star,
        #[``RHPrimeWindow94.endpoint_from_star_grid]),
      (``RHPrimeWindow94.zeta_line_from_star,
        #[``RHPrimeWindow94.principal_grid_from_star, ``RHPrimeWindow88.zeta_line_from_endpoint_grid])] do
    let axioms ← Lean.collectAxioms n
    unless axioms.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN94 unexpected axiom {n}: {axioms}"
    let info ← Lean.getConstInfo n
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError m!"RUN94 missing theorem value {n}"
    let deps := value.getUsedConstants
    for supplier in required do
      unless deps.contains supplier do
        Lean.throwError m!"RUN94 missing edge {n} -> {supplier}"
  Lean.logInfo "RUN94_STAR_GRID_GUARDS_OK"
