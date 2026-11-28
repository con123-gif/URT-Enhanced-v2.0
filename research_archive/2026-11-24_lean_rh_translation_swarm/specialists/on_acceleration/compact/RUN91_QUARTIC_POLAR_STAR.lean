import Run88Endpoint
import New.Data.DataExist
import New.Endgame.ShortAndEnough
import Lean

/-!
RUN91 acceleration — selected-scale star on quartics, without separate
canonical PNT TailGrid. 28 November 2026. SOURCE-MATCHED / PREPARED ONLY.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.

RUN90 acceleration used canonical D1 and a separate TailGrid. Prime RUN82
uses the native polar-window selection but requires star at all large real x.
Combine these distinct routes: require star only for D with x a fourth power,
log(log b)=eta log x, thick lower bound, and
  t <= log x1 <= t^2, t=10^6 log x.
Native D1 and polar window give the SAME modified record D' as RUN82.
Changing logX1 cannot change D'.x. Hence the extra quartic premise survives
the actual update. The rest is the original remainder identity and positive
scale comparison, unchanged. Take x=k^4 only at the outer eventual filter;
choose K>max(X,1), so k^4>=k>=X. The existing chord/cover endpoint theorem
then supplies the eventual bound using eta=eps/2. Restrict P to the actual
native principal class. No PNT TailGrid as a separate premise; the native
IsPolar window replaces it, NOT an unconditional elimination of analytic
work. This is a narrower domain than RUN82, not implied by star restricted
to canonical x1 as in RUN90. For a universal star RUN82 remains simpler.
No claim that the quartic restriction makes the arithmetic supplier easier
until a supplier actually exploits it. No proof of star or RH.

Source blobs: RUN82 680760eab01bc7dcde5757a8e9ce6a261a0704b2, RUN92 class bridge d1f58ba6d8c29b70e5a07e1eb497abd830a7a29b,
RUN90 5c8eb3d09a799c4aa0476fe4d4adad84089144fd, RUN92 analytic feac9de9a2448bf595ea18873528e6066d16846f.
Native Main 198ed5bf26aa294898931e0649bc2b88f1389f65,
DataExist 634c6a1f88791a3bb770326785b70411e8289b41,
PrimeError 63eb3d79d95ad815878e623b96f237240058c8e2.
Connector JS preflight: five exact edits to RUN82, round-trip exact,
10/10 missing/duplicate anchor controls rejected; exact threshold
and native class constructor blocks reused; EndpointGrid checked against
current peer. No elaborated graph or timing claim. Old and new source graph:
RUN90: canonical star + D1 + TailGrid -> GoodGrid/EndpointGrid -> cover -> root.
RUN91: selected quartic star + D1 + native polar-window + remainder_eq ->
EndpointGrid -> same cover -> root. Preserve both; neither is native verified.

Fresh CI run 46086991349 status ERROR blob
415f145bc61cc12ae9454c6092ea46282a7584e5, actual receipt
56e5073dfb0de9b7c4fcb829007e60e4b0891be3. Analytic receipt
fc8f38820a992e32a89f4ec72f5849968f72590d: chord now reports standard
axioms alongside hinge/log correction; quartic_cover and dependent roots
have sorryAx, endpoint exit 1. Adapter log 3787f733a7fe7b417fa2742631092f6abac912ac:
remainder_eq standard axioms, pointwise and endpoint have sorryAx; no
accepted candidate module. Native analytic log e3cd51aca318ca6049735cb4438b5da8f23bc31c:
quartic cast line197 and principal grind lines386,404 remain. A1/A2 shared
status 07a2b14930c38095e6771ae9ed1a10a3cf1bf678 still ERROR.
No native engines run here; no verified full graph or global removal.
No duplicate cold build or protected file edits.

RESUME HERE: after prime lane's repaired Run88Endpoint and shared
ShortAndEnough/DataExist objects are accepted, run this file as
Run91QuarticPolarStar with normal kernel checking; require
RUN91_QUARTIC_POLAR_GUARDS_OK and strict constructor-inclusive audit of
all four roots. On failure preserve first diagnostic. All A/B/C suppliers,
D1 native witness, polar-window, cover, twist/functional equation and full
root human audit retained. HANDOFF TO prime/kernel/integration/audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace RHAcceleration91

lemma eventual_on_quartics (P : Parameters) {ε : ℝ}
    (h : 0 < ε / 6 ∧ ε < 1 / 100)
    (hstar : ∀ D : Data P, (∃ k : ℕ, D.x = (k : ℝ)^4) → log D.logB = ε * D.logX →
      towerDeg D.s / D.logB ≤ #D.thick →
      D.logX₁ ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX) ^ 2) →
      D.m * D.remainder ≤ D.logB ^ 2 * D.budget) :
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
  have hs := hstar D' (by simpa [D'] using hxgrid) (by simpa [D'] using e) (by simpa [D'] using H')
    ⟨by simpa [D'] using a, by simpa [D'] using b⟩
  calc primeError P.d P.N₀ D.x = D'.m * D'.remainder / D'.m / D'.a / #D.thick + (primeError P.d P.N₀
      D'.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D'.x₁) := by simp [remainder_eq, tops,
      card_placeClass_eq, field, HasLogBound.pos D', ne_of_gt]
    _ ≤ D'.logB ^ 2 * D'.budget / D'.m / D'.a / #D.thick + exp
      (-(1e6 * D.logX)) := by grw [hs, w]
    -- the first term is `f log⁵ b / (m #thick) ≤ φ(N₀) log⁶ b / √x`, and `log b = x ^ ε`
    _ ≤ _ := D'.le_of_hasLogBound (by grind)


theorem endpoint_from_selected_star (P : Parameters) (ε : ℝ)
    (he : 0 < ε / 6 ∧ ε < 1 / 100)
    (hs : ∀ D : Data P, (∃ k : ℕ, D.x = (k : ℝ)^4) →
      log D.logB = ε * D.logX →
      towerDeg D.s / D.logB ≤ #D.thick →
      D.logX₁ ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX)^2) →
      D.m * D.remainder ≤ D.logB^2 * D.budget) :
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
      D.m * D.remainder ≤ D.logB^2 * D.budget

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

end RHAcceleration91

#print axioms RHAcceleration91.eventual_on_quartics
#print axioms RHAcceleration91.endpoint_from_selected_star
#print axioms RHAcceleration91.principal_grid_from_selected_star
#print axioms RHAcceleration91.zeta_line_from_selected_star

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (n, req) in #[
    (``RHAcceleration91.eventual_on_quartics,
      #[``exists_data, ``IsPolar.exists_window_sub_mul_le, ``Data.remainder_eq]),
    (``RHAcceleration91.endpoint_from_selected_star,
      #[``RHAcceleration91.eventual_on_quartics]),
    (``RHAcceleration91.principal_grid_from_selected_star,
      #[``RHAcceleration91.endpoint_from_selected_star]),
    (``RHAcceleration91.zeta_line_from_selected_star,
      #[``RHAcceleration91.principal_grid_from_selected_star,
        ``RHPrimeWindow88.zeta_line_from_endpoint_grid])] do
    let ax ← Lean.collectAxioms n
    unless ax.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN91 nonstandard axiom {n}: {ax}"
    let i ← Lean.getConstInfo n
    let some v := i.value? (allowOpaque := true) | Lean.throwError "RUN91 missing proof value"
    let ds := v.getUsedConstants
    unless req.all (fun x => ds.contains x) do
      Lean.throwError m!"RUN91 missing supplier {n}"
    Lean.logInfo m!"RUN91|{n}|type={i.type.getUsedConstants.map Lean.Name.toString}|value={ds.map Lean.Name.toString}"
  Lean.logInfo "RUN91_QUARTIC_POLAR_GUARDS_OK"
