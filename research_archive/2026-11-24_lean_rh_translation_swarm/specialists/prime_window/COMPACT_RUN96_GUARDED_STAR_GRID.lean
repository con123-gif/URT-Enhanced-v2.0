import Run94StarGrid
import Lean

/-!
RUN96, 28 Nov 2026. HUMAN DERIVATION / PREPARED; new module NOT compiled.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Read current mission/spine/ledger, AGENTS, SWARM, HANDOFF, EXPANSION,
and latest peer integration 8aa381a7, editor mean 3197ff9b, acceleration
d6e7591b and fiber 0f24af4e. No duplicate native definition bridge:
integration already prepared it. No new mean or fiber claim.

Actual RUN95 receipt: https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-compact-prime-star-grid-20261128/outputs/run95_star_grid_receipt.json
CI 46102281476 (28 Nov), source d3fcfc01. Four new native roots exit 0,
all standard axioms; five-root strict graph exit 0: 124661 nodes,
4046494 edges, zero missing, all 15 guards true. The old separate
GoodGrid/TailGrid assumptions are absent from the new root, as are
native star_inequality, New.grh and riemannHypothesis; exists_data,
polar window and exact remainder identity remain. Graph SHA256
5a8e26c835593df5f0d7e56f8413cce092b306cc5362e23d837119324a48db4c.
New root 124640 nodes vs old 124145: no graph size reduction claim.
Receipt flags original-definition native bridge=false, arithmetic=false,
full RH=false. Retrieved compiler log and union summary separately.

NEW: GuardedStarOn is sufficient on any selected scale set. For fixed
P and ε, the threshold may depend on both. Require star only on
adjusted records with log log b = ε log x, towerDeg(s)/log b <= #thick,
u=log x1 in [10^6 log x,(10^6 log x)^2], and the polar difference
R_N0(exp u)-towerDeg(s)/#thick R_1(exp u)<=exp(-10^6 log x).
Unlike the already prepared selected-fiber and weighted-mean routes,
this is a universal implication on a smaller, explicitly guarded
domain and uses the accepted native existential polar window as-is.
The last guard may be ignored by arithmetic suppliers; it is not a
new assumption on the analytic functions. It permits reasoning only
on the actual selected scales, without assuming uniform all-u control.
Do not claim comparability with the existential fiber or mean premises.
The old StarGrid implies the new guarded premise, directly by weakening.
No converse is asserted. The mathematical estimate remains OPEN.

Exact native caller New/Main.lean 149–167 (198ed5bf26aa294898931e0649bc2b88f1389f65),
DataExist.lean 43–45 (634c6a1f88791a3bb770326785b70411e8289b41),
AdmissibleData.lean 22–45, 51–58 (04208a5044bb7cf6464ef142a14d939148bed834).
The accepted proof obtains e,H' from exists_data and a,b,w from the polar
window. D' changes only logX₁ and scale; e,H' persist definitionally;
a,b,w are the three new guards. Therefore the SAME D' satisfies the
guarded premise, with no interchange of quantifiers or scale choices.
The exact remainder identity, cancellation, budget, quartic passage
and ε/2 slack are the accepted RUN94 arguments, unchanged. This is
not an RH proof. No new axiom assumption or claimed theorem imported.

Executed: 13 exact unique source substitutions, 26 removed/duplicated
anchor controls rejected; native receipt, source and peer reads. This is
source checking, not kernel checking. No new native rh_reduce/auto/prune
or graph run. Preserve RUN94/95 and all failed evidence. The native
definition bridge is separately owned by integration. No new cold
compute registration; coordinate with pending endpoint junction.

RESUME HERE: compile this file as Run96GuardedStarGrid against the
accepted Run94StarGrid workspace during the integration replay, checking
all five axioms and direct guards; compare constructor-inclusive
old/new roots (require guarded premise present and native star/RH
absent). Preserve first actual diagnostic, do not infer PASS from
source substitutions. Then report exact guarded native premise to
arithmetic lanes using the separately accepted remainder bridge.
HANDOFF TO integration/kernel/editor/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module
namespace RHPrimeWindow96

/-- The five actual adjusted-record guards. The polar sign guard is optional for
arithmetic suppliers, but is already available at the actual caller. -/
def GuardedStarOn (P : Parameters) (ε : ℝ) (S : Set ℝ) : Prop :=
  ∀ᶠ x in atTop, x ∈ S → ∀ D : Data P, D.x = x →
    log D.logB = ε * D.logX → towerDeg D.s / D.logB ≤ #D.thick →
    1e6 * D.logX ≤ D.logX₁ → D.logX₁ ≤ (1e6 * D.logX)^2 →
    primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁ ≤
      exp (-(1e6 * D.logX)) →
    D.m * D.run90Remainder ≤ D.logB ^ 2 * D.budget

theorem eventually_primeError_on_set (P : Parameters) {ε : ℝ}
    (h : 0 < ε / 6 ∧ ε < 1 / 100) (S : Set ℝ)
    (hstar : GuardedStarOn P ε S) :
    ∀ᶠ x in atTop, x ∈ S → primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1) := by
  unfold GuardedStarOn at hstar
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
  have starD' : D'.m * D'.run90Remainder ≤ D'.logB ^ 2 * D'.budget := hs hxS D' rfl e H' a b w
  calc primeError P.d P.N₀ D.x = D'.m * D'.run90Remainder / D'.m / D'.a / #D.thick + (primeError P.d P.N₀
      D'.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D'.x₁) := by simp [run90Remainder_eq, tops,
      card_placeClass_eq, field, HasLogBound.pos D', ne_of_gt]
    _ ≤ D'.logB ^ 2 * D'.budget / D'.m / D'.a / #D.thick + exp
      (-(1e6 * D.logX)) := by grw [starD', w]
    -- the first term is `f log⁵ b / (m #thick) ≤ φ(N₀) log⁶ b / √x`, and `log b = x ^ ε`
    _ ≤ _ := D'.le_of_hasLogBound (by grind)


abbrev QuarticScales := RHPrimeWindow94.QuarticScales

def StarGrid (P : Parameters) (ε : ℝ) : Prop := GuardedStarOn P ε QuarticScales

theorem guarded_of_old (P : Parameters) (ε : ℝ) (h : RHPrimeWindow94.StarGrid P) :
    StarGrid P ε := by
  unfold StarGrid GuardedStarOn
  unfold RHPrimeWindow94.StarGrid at h
  filter_upwards [h] with x hx
  intro hS D hD _ _ _ _ _
  exact hx hS D hD

theorem endpoint_from_star_grid (P : Parameters) {ε : ℝ}
    (he : 0 < ε / 6 ∧ ε < 1 / 100) (hs : StarGrid P ε) :
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

/-- Thresholds may depend on P and ε; no uniformity over either is needed. -/
def ClassStarGrid : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) →
    ∀ ε : ℝ, (0 < ε / 6 ∧ ε < 1 / 100) → StarGrid P ε

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
  have he' : 0 < (ε/2) / 6 ∧ ε/2 < 1 / 100 := by
    constructor <;> linarith [he.1,he.2]
  exact endpoint_from_star_grid P he' (hin P (by rfl) hc (ε/2) he')

theorem zeta_line_from_star (hin : ClassStarGrid) :
    RiemannZetaZerosOnLine :=
  RHPrimeWindow88.zeta_line_from_endpoint_grid (principal_grid_from_star hin)


end RHPrimeWindow96

#print axioms RHPrimeWindow96.guarded_of_old
#print axioms RHPrimeWindow96.eventually_primeError_on_set
#print axioms RHPrimeWindow96.endpoint_from_star_grid
#print axioms RHPrimeWindow96.principal_grid_from_star
#print axioms RHPrimeWindow96.zeta_line_from_star

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (n, required) in #[
      (``RHPrimeWindow96.guarded_of_old, #[]),
      (``RHPrimeWindow96.eventually_primeError_on_set,
        #[``exists_data, ``IsPolar.exists_window_sub_mul_le, ``Data.run90Remainder_eq]),
      (``RHPrimeWindow96.endpoint_from_star_grid,
        #[``RHPrimeWindow96.eventually_primeError_on_set]),
      (``RHPrimeWindow96.principal_grid_from_star,
        #[``RHPrimeWindow96.endpoint_from_star_grid]),
      (``RHPrimeWindow96.zeta_line_from_star,
        #[``RHPrimeWindow96.principal_grid_from_star, ``RHPrimeWindow88.zeta_line_from_endpoint_grid])] do
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
  Lean.logInfo "RUN96_GUARDED_STAR_GRID_GUARDS_OK"
