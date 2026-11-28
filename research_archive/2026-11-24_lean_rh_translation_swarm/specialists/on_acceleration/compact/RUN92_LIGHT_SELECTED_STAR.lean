import Run88Endpoint
import Run90Adapter
import New.Data.DataExist
import Lean

/-!
RUN92 acceleration, 28 November 2026 — lightweight selected-star junction.
PREPARED / SOURCE-MATCHED, not native replayed. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION and latest peer results inspected.

ACTUAL NEW CI EVIDENCE: run 46092027436, 28 Nov 01:36:42 UTC,
state branch compute/rh-compact-prime-endpoint-direct-cancel-20261128/.
Status b1e8050c84861979964fcbafc07c313892772acc; full run91_receipt
0b2bcdbd7e7988f607b8d4dbbc1c0a27ef2fb58b; analytic/endpoint_receipt
ffc02c8cddf713be4b9f7ca19536c6355395c5e4. All requested checks true;
seven analytic roots + three adapter roots + two principal bridge roots
compiled and report exactly the standard three axioms; omitted-grid
negative control rejected at its expected line. Analytic endpoint
14.74 s, adapter 7.33 s, bridge 3.82 s; adapter dependency build 1050.76 s.
The earlier failed run 46086991349 remains archived. Actual new receipt
explicitly says original_definition_native_bridge_checked=false,
arithmetic_premise_proved=false, pnt_tail_proved_here=false,
full_RH_replay=false. No full transitive graph audit yet.

RUN91 acceleration blob 4596ba91d57eb816f36d39dc188d425ef4699219 imported ShortAndEnough
solely for the original remainder interface and used a broad grind at the
last logarithmic scale comparison. The now accepted RUN93 adapter blob
cafaa2442d0889d26f4ccaefd4a2888dfe422c81 contains the independently checked renamed
remainder identity and explicit scale calculation. Reuse both on the
same selected record D' instead of building ShortAndEnough and its
arithmetic suppliers before checking the conditional analytic endpoint.
This removes a direct import, not a proven transitive deletion. D1
DataExist (634c6a1f88791a3bb770326785b70411e8289b41) still needs replay
in the retained environment. No duplicate endpoint compile is required.

Precise mathematics: let t=10^6 log x, c=towerDeg(s)/#thick. Native
polar selection returns u in [t,t²] with R_N(exp u)-c R_1(exp u)<=exp(-t).
Update logX1 only in the SAME D from exists_data; preserve x=k^4,
log log b=ε log x, thick count, and all original scale constraints.
Use renamed remainder identity and star on D':
 R_N(x) <= logB² budget/(m a #thick) + exp(-t)
        <= x^(8ε-1/2).
The last inequality uses the checked explicit log-target witness and
comparison from RUN93; only D becomes D', eta becomes epsilon.
The native polar selection replaces the separate TailGrid requirement;
no new proof of star, D1, or the original-remainder definition bridge.
Fixed prime class 9239 modulo 18480 and epsilon/2 unchanged.

Exact source controls executed in connector JS: 7 unique anchors,
14/14 missing/duplicate anchor mutations rejected, exact reversible
symbol rename, and original two definition bodies byte-identical after
renaming (ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a).
These are text controls, not kernel evidence. The former source graph:
RUN91 + ShortAndEnough + D1 -> selected star -> grid -> RH.
New: RUN92 + accepted Run90Adapter and Run88Endpoint + D1 ->
light selected star -> grid -> RH. Original heavy supplier bridge
remains a separate obligation. All original/reduced evidence retained.
No new native engine or graph execution, no global deletion or timing claim.

RESUME HERE: in the shared retained compact workspace, compile this
file as Run92LightSelectedStar reusing the accepted Run88Endpoint and
Run90Adapter objects with recorded SHA256; build DataExist only if not
already present. Require RUN92_QUARTIC_POLAR_GUARDS_OK, all five axiom
reports and normal-kernel exit 0, then strict constructor-inclusive
graph audit. After the current IntegrationMinimalSignedStar module
(1cda73bdccdb67a5f47ad023e918e00ce81c1792) passes, the separate actual
bridge must compile in one environment:
  example {P} (D : Data P) : D.run90MainAsk = D.mainAsk := rfl
  example {P} (D : Data P) : D.run90Remainder = D.remainder := rfl
  theorem candidate_zeta_line : RiemannZetaZerosOnLine :=
    RHAcceleration92.zeta_line_from_universal_light_star
      (fun P D => by
        change D.m * D.remainder ≤ D.logB^2 * D.budget
        exact integration_minimal_signed_star)
No import of New.Main, Main, or a claimed RH theorem. Audit both
recursive graphs including retained primitive suppliers, before any
claim of full reconstruction. HANDOFF TO prime/kernel/integration.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace RHAcceleration92

lemma eventual_on_quartics (P : Parameters) {ε : ℝ}
    (h : 0 < ε / 6 ∧ ε < 1 / 100)
    (hstar : ∀ D : Data P, (∃ k : ℕ, D.x = (k : ℝ)^4) → log D.logB = ε * D.logX →
      towerDeg D.s / D.logB ≤ #D.thick →
      D.logX₁ ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX) ^ 2) →
      D.m * D.run90Remainder ≤ D.logB ^ 2 * D.budget) :
    ∀ᶠ x in atTop, (∃ k : ℕ, x = (k : ℝ)^4) →
      primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1) := by
  filter_upwards [h.elim (exists_data P), tendsto_log_atTop.const_mul_atTop (r := 1e6) (by bound)
    ((isPolar_primeError PrimeSevenModEight.mod_eight (P.coprime_N₁_d
    0).coprime_mul_right).exists_window_sub_mul_le (isPolar_primeError PrimeSevenModEight.mod_eight
    P.d.coprime_one_left))] with x ⟨D, _, _, l, e, H'⟩ W
  intro hxgrid
  subst x; simp only [log_exp, Set.mem_preimage, ← exp_mul] at *
  obtain := D.hasLogLower_of_le H', D.scale
  -- move `log x₁` to a point `u` of the window where `R_{N₀} - (#tops / #thick) R₁ ≤ x ^ (-10⁶)`
  obtain ⟨u, ⟨a, b⟩, w⟩ := W (towerDeg D.s / #D.thick) ⟨by bound, D.le_of_hasLogBound⟩
  let D' := {D with logX₁ := u, scale := by grw [b, l] <;> grind}
  have := D'.hasLogLower_of_le H'
  have e' : log D'.logB = ε * D'.logX := by simpa [D'] using e
  letI : D'.HasLogLower (D'.x ^ (8 * ε + 2⁻¹ - 1))
      ((8 * ε + 2⁻¹ - 1) * D'.logX) := ⟨by
    change exp ((8 * ε + 2⁻¹ - 1) * D'.logX) ≤
      (exp D'.logX) ^ (8 * ε + 2⁻¹ - 1)
    rw [Real.rpow_def_of_pos (Real.exp_pos _), Real.log_exp, mul_comm]⟩
  have htarget : (8 * ε + 2⁻¹ - 1) * D'.logX =
      8 * log D'.logB - D'.logX / 2 := by rw [e']; ring
  have hc64 : 64 ≤ P.c := (Data.c_ge (P := P)).1
  have hs := hstar D' (by simpa [D'] using hxgrid) (by simpa [D'] using e) (by simpa [D'] using H')
    ⟨by simpa [D'] using a, by simpa [D'] using b⟩
  calc primeError P.d P.N₀ D.x = D'.m * D'.run90Remainder / D'.m / D'.a / #D.thick + (primeError P.d P.N₀
      D'.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D'.x₁) := by simp [run90Remainder_eq, tops,
      card_placeClass_eq, field, HasLogBound.pos D', ne_of_gt]
    _ ≤ D'.logB ^ 2 * D'.budget / D'.m / D'.a / #D.thick + exp
      (-(1e6 * D.logX)) := by grw [hs, w]
    -- the first term is `f log⁵ b / (m #thick) ≤ φ(N₀) log⁶ b / √x`, and `log b = x ^ ε`
    _ ≤ _ := D'.le_of_hasLogBound (by
      rw [htarget]
      norm_num
      simp only [max_def]
      split_ifs <;> linarith [D'.scale.1, D'.scale.2.1, hc64])


theorem endpoint_from_selected_star (P : Parameters) (ε : ℝ)
    (he : 0 < ε / 6 ∧ ε < 1 / 100)
    (hs : ∀ D : Data P, (∃ k : ℕ, D.x = (k : ℝ)^4) →
      log D.logB = ε * D.logX →
      towerDeg D.s / D.logB ≤ #D.thick →
      D.logX₁ ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX)^2) →
      D.m * D.run90Remainder ≤ D.logB^2 * D.budget) :
    RHPrimeWindow88.EndpointGrid P.d P.N₀ ε := by
  obtain ⟨X,hX⟩ := Filter.eventually_atTop.1 (eventual_on_quartics P he hs)
  obtain ⟨K,hK⟩ := exists_nat_gt (max X 1)
  refine ⟨K, ?_⟩
  intro k hk
  have hk' : (K : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk
  have h1 : (1 : ℝ) ≤ (k : ℝ) :=
    (le_max_right X 1).trans (hK.le.trans hk')
  have hpow : (k : ℝ) ≤ (k : ℝ)^4 := le_self_pow₀ h1 (by decide)
  have hXk : X ≤ (k : ℝ)^4 :=
    (le_max_left X 1).trans (hK.le.trans (hk'.trans hpow))
  exact hX _ hXk ⟨k,rfl⟩

def ClassSelectedStar : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) →
    ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 →
    ∀ D : Data P, (∃ k : ℕ, D.x = (k : ℝ)^4) →
      log D.logB = ε * D.logX →
      towerDeg D.s / D.logB ≤ #D.thick →
      D.logX₁ ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX)^2) →
      D.m * D.run90Remainder ≤ D.logB^2 * D.budget

theorem principal_grid_from_selected_star (hs : ClassSelectedStar) :
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
  have he' : 0 < (ε/2)/6 ∧ ε/2 < 1/100 := by
    constructor <;> linarith [he.1,he.2]
  exact endpoint_from_selected_star P (ε/2) he' (hs P (by rfl) hc (ε/2) he')

theorem zeta_line_from_selected_star (hs : ClassSelectedStar) :
    RiemannZetaZerosOnLine :=
  RHPrimeWindow88.zeta_line_from_endpoint_grid (principal_grid_from_selected_star hs)


/-- Universal lightweight star is sufficient; original-definition bridge is a separate replay. -/
theorem zeta_line_from_universal_light_star
    (hs : ∀ (P : Parameters) (D : Data P),
      D.m * D.run90Remainder ≤ D.logB^2 * D.budget) :
    RiemannZetaZerosOnLine :=
  zeta_line_from_selected_star (fun P _ _ ε _ D _ _ _ _ => hs P D)

end RHAcceleration92

#print axioms RHAcceleration92.eventual_on_quartics
#print axioms RHAcceleration92.endpoint_from_selected_star
#print axioms RHAcceleration92.principal_grid_from_selected_star
#print axioms RHAcceleration92.zeta_line_from_selected_star
#print axioms RHAcceleration92.zeta_line_from_universal_light_star

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (n, req) in #[
    (``RHAcceleration92.eventual_on_quartics,
      #[``exists_data, ``IsPolar.exists_window_sub_mul_le, ``Data.run90Remainder_eq]),
    (``RHAcceleration92.endpoint_from_selected_star,
      #[``RHAcceleration92.eventual_on_quartics]),
    (``RHAcceleration92.principal_grid_from_selected_star,
      #[``RHAcceleration92.endpoint_from_selected_star]),
    (``RHAcceleration92.zeta_line_from_selected_star,
      #[``RHAcceleration92.principal_grid_from_selected_star,
        ``RHPrimeWindow88.zeta_line_from_endpoint_grid]),
    (``RHAcceleration92.zeta_line_from_universal_light_star,
      #[``RHAcceleration92.zeta_line_from_selected_star])] do
    let ax ← Lean.collectAxioms n
    unless ax.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN92 nonstandard axiom {n}: {ax}"
    let i ← Lean.getConstInfo n
    let some v := i.value? (allowOpaque := true) | Lean.throwError "RUN92 missing proof value"
    let ds := v.getUsedConstants
    unless req.all (fun x => ds.contains x) do
      Lean.throwError m!"RUN92 missing supplier {n}"
    Lean.logInfo m!"RUN92|{n}|type={i.type.getUsedConstants.map Lean.Name.toString}|value={ds.map Lean.Name.toString}"
  Lean.logInfo "RUN92_QUARTIC_POLAR_GUARDS_OK"
