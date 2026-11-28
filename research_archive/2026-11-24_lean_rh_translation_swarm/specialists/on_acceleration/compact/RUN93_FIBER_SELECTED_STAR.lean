import Run88Endpoint
import Run90Adapter
import New.Data.DataExist
import Lean

/-!
RUN93 acceleration — one admissible-data fiber per large quartic scale.
28 November 2026. SOURCE-MATCHED / PREPARED, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS/SWARM/HANDOFF/EXPANSION read. Peers prime 557eeda77e,
integration 77afc7926f, theta 174e50d3, kernel bb260a3d, B3 5cfa80fd.

Actual reduction, distinct from prime RUN94 eventual ALL-data grid:
for each sufficiently large x=k^4 (and fixed P,epsilon), choose ONE D
satisfying the five native exists_data conditions. Require star only on
the one-dimensional family obtained by changing logX1 in this D over
[t,t^2], t=10^6 log x, retaining all other fields, including s,m,r,thick,
g,piG, and the native scale proof. No universal bound on independently
chosen data at that x is required. The D may depend on x and epsilon,
but must be chosen BEFORE the polar selection of u; do not interchange
forall u and exists D. Existence of an unrestricted data record
exists_data alone does not establish existence of a good fiber.

Proof: with D fixed, c=towerDeg(s)/#thick is fixed. Polar theorem picks
u in the indicated window where R_N(exp u)-c R_1(exp u)<=exp(-t).
The existing native caller builds D' by replacing only logX1 and scale.
FiberStar D applies to this exact D', since proof irrelevance identifies
its scale witness with any proof of the same five inequalities. Apply
the same exact remainder identity and explicit scale estimate as RUN92.
No new estimate, no arbitrary independent choices of witnesses. In
symbols, star(D')/ (m*a*#thick) + polar_error <= x^(8epsilon-1/2).
The old universal star implies the fiber premise by the native
exists_data theorem; this implication is separately supplied below.
This is a logical weakening of the all-data demand, not an assertion
that the existential fiber is easier or has been proved. It is not
equivalent by logic alone to the all-data premise. The core requires
no proof of D1 once FiberWitness is supplied; D1 remains in the
universal-to-fiber comparison. Retain all arithmetic suppliers.

Exact source: RUN92 blob 6a7c27145fe7844b7eeeb4d34a3a3a16caf2c185;
DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41 (five conjuncts);
AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834 (Data.scale);
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65 (not imported);
OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3.
7 exact unique source edits executed; 14/14 deleted/duplicated
anchor controls rejected. Local shell has no lean/lake and Git DNS
failed. No new native engine execution; no PASS for this candidate.

New actual independent B3 receipt retrieved from state branch:
compute/rh-compact-b3-shell-replay-20261128/outputs/run91_shell_receipt.json
ced03da74831bbc7ae37622698002e8dcedb03cd, CI run 46092592569.
Both shell replacements checked (3.77 s), four-root graph 32.27 s,
73765 union nodes, 2088097 edges, zero missing, 14/14 guards,
old floor/self/position absent from replacement roots, majorant,
gauge, Parseval, inverse-weight retained. Old/new root nodes 73014/73019
and 44954/44959; no node reduction claim. Both have standard axioms.
Use authenticated RHRun90Shells.olean SHA256
ff60aeb9ba8de9a11f291e8f0384182c2b56330ed52e901ede6e8c4035bcfa7b.
This is local B3 scope, not full RH. Original graphs and prior failures
remain in archive; no new full dependency or timing claim.

RESUME HERE: in retained compact workspace compile this file as
Run93FiberStar with accepted Run88Endpoint and Run90Adapter objects,
building DataExist only if absent. Require all six guard/axiom records,
normal kernel exit 0 and strict constructor-inclusive graph for original
RUN92 (if accepted) and this variant; explicitly compare the core's
absence of exists_data with the universal-to-fiber comparison's presence.
No duplicate cold builds. Preserve exact failed diagnostics.
After IntegrationMinimalSignedStar acceptance, use the original rfl
remainder bridge in RUN92 and the new universal comparison below.
HANDOFF TO prime/kernel/integration/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace RHAcceleration93

/-- Only one fixed data record, with its permitted secondary scale changed. -/
def FiberStar {P : Parameters} (D : Data P) : Prop :=
  ∀ u : ℝ, u ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX)^2) →
    ∀ hs : 1e12 * P.c ≤ log D.logB ∧ 100 * log D.logB ≤ D.logX ∧
      1e6 * D.logX ≤ u ∧ 1e6 * u ≤ D.logB ∧ 6 * log u ≤ log D.logB,
    let E := { D with logX₁ := u, scale := hs }
    E.m * E.run90Remainder ≤ E.logB^2 * E.budget

/-- The five exact D1 witness facts plus the star on that SAME data fiber. -/
def FiberWitness (P : Parameters) (ε : ℝ) : Prop :=
  ∀ᶠ x in atTop, (∃ k : ℕ, x = (k : ℝ)^4) → ∃ D : Data P,
    D.x = x ∧ log D.x₁ = x ^ (ε / 6) ∧
    (1e6 * log x)^2 ≤ log D.x₁ ∧ log (log D.b) = ε * log x ∧
    towerDeg D.s / log D.b ≤ #D.thick ∧ FiberStar D

/-- The former all-data star plus D1 implies the new witness, not conversely by logic alone. -/
theorem fiber_witness_from_universal (P : Parameters) (ε : ℝ)
    (he : 0 < ε / 6 ∧ ε < 1 / 100)
    (hs : ∀ D : Data P, D.m * D.run90Remainder ≤ D.logB^2 * D.budget) :
    FiberWitness P ε := by
  filter_upwards [he.elim (exists_data P)] with x hx
  intro _
  obtain ⟨D, h1, h2, h3, h4, h5⟩ := hx
  refine ⟨D, h1, h2, h3, h4, h5, ?_⟩
  intro u _ hu
  exact hs { D with logX₁ := u, scale := hu }

lemma eventual_on_quartics (P : Parameters) {ε : ℝ}
    (h : 0 < ε / 6 ∧ ε < 1 / 100)
    (hstar : FiberWitness P ε) :
    ∀ᶠ x in atTop, (∃ k : ℕ, x = (k : ℝ)^4) →
      primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1) := by
  filter_upwards [hstar, tendsto_log_atTop.const_mul_atTop (r := 1e6) (by bound)
    ((isPolar_primeError PrimeSevenModEight.mod_eight (P.coprime_N₁_d
    0).coprime_mul_right).exists_window_sub_mul_le (isPolar_primeError PrimeSevenModEight.mod_eight
    P.d.coprime_one_left))] with x hw W
  intro hxgrid
  obtain ⟨D, hx, _, l, e, H', hf⟩ := hw hxgrid
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
  have hs : D'.m * D'.run90Remainder ≤ D'.logB ^ 2 * D'.budget := by
    exact hf u ⟨a, b⟩ D'.scale
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
    (hs : FiberWitness P ε) :
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

def ClassFiberStar : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) →
    ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 →
    FiberWitness P ε

theorem principal_grid_from_selected_star (hs : ClassFiberStar) :
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

theorem zeta_line_from_selected_star (hs : ClassFiberStar) :
    RiemannZetaZerosOnLine :=
  RHPrimeWindow88.zeta_line_from_endpoint_grid (principal_grid_from_selected_star hs)


/-- Universal lightweight star is sufficient; original-definition bridge is a separate replay. -/
theorem zeta_line_from_universal_light_star
    (hs : ∀ (P : Parameters) (D : Data P),
      D.m * D.run90Remainder ≤ D.logB^2 * D.budget) :
    RiemannZetaZerosOnLine :=
  zeta_line_from_selected_star (fun P _ _ ε he => fiber_witness_from_universal P ε he (hs P))

end RHAcceleration93

#print axioms RHAcceleration93.fiber_witness_from_universal
#print axioms RHAcceleration93.eventual_on_quartics
#print axioms RHAcceleration93.endpoint_from_selected_star
#print axioms RHAcceleration93.principal_grid_from_selected_star
#print axioms RHAcceleration93.zeta_line_from_selected_star
#print axioms RHAcceleration93.zeta_line_from_universal_light_star

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (n, req) in #[
    (``RHAcceleration93.fiber_witness_from_universal, #[``exists_data]),
    (``RHAcceleration93.eventual_on_quartics,
      #[``IsPolar.exists_window_sub_mul_le, ``Data.run90Remainder_eq]),
    (``RHAcceleration93.endpoint_from_selected_star, #[``RHAcceleration93.eventual_on_quartics]),
    (``RHAcceleration93.principal_grid_from_selected_star, #[``RHAcceleration93.endpoint_from_selected_star]),
    (``RHAcceleration93.zeta_line_from_selected_star,
      #[``RHAcceleration93.principal_grid_from_selected_star,
        ``RHPrimeWindow88.zeta_line_from_endpoint_grid]),
    (``RHAcceleration93.zeta_line_from_universal_light_star,
      #[``RHAcceleration93.zeta_line_from_selected_star,
        ``RHAcceleration93.fiber_witness_from_universal])] do
    let ax ← Lean.collectAxioms n
    unless ax.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN93 nonstandard axiom {n}: {ax}"
    let i ← Lean.getConstInfo n
    let some v := i.value? (allowOpaque := true) | Lean.throwError "RUN93 missing proof value"
    let ds := v.getUsedConstants
    unless req.all (fun x => ds.contains x) do
      Lean.throwError m!"RUN93 missing supplier {n}"
    if n == ``RHAcceleration93.eventual_on_quartics && ds.contains ``exists_data then
      Lean.throwError "RUN93 unexpected direct D1 dependency in fiber core"
    Lean.logInfo m!"RUN93_FIBER|{n}|axioms={ax}|type={i.type.getUsedConstants.map Lean.Name.toString}|value={ds.map Lean.Name.toString}"
  Lean.logInfo "RUN93_FIBER_GUARDS_OK"
