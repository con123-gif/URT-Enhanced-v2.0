import Statements
import New.Data.DataExist
import New.Endgame.ShortAndEnough
import Lean

/-!
# RUN82 — the actual star consumer needs only a fixed modulus and selected scale box
27 November 2026. HUMAN SOURCE-MATCHED sufficient premise reduction, Lean
candidate PREPARED only. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 remains separate.

Read current mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
4878ea106b791c42b5f5a45810162de59701c4d9, ledger
01fa22a6b12abad5ccf580d2621f82be3bf70c13, AGENTS, handoff, expansion,
own RUN81 55afd422; recent peer A2 5bc36ce5, marked replay f8e95752,
log-free index f1abc81e, shared A2 replay cd306c11, editor signed-residue
fef13351f9bf931bac9d495c548fb31a0089714b. D1/E1 human audit retained.
No separate cold build: RUN81 native replay remains pending on shared
workspace. This is a root-context restriction, not more local optimization.

## Exact mathematical reduction
The actual New/Main.lean eventual bound does NOT use star on arbitrary
admissible data. Fix P and epsilon before x grows. Native exists_data
supplies D at every large x, with log log b=epsilon log x and
towerDeg(s)/log b <= #thick. Native IsPolar window gives u with
t<=u<=t^2, t=10^6 log x, and R_M(exp u)-X R_1(exp u)<=exp(-t),
X=towerDeg(s)/#thick. In the actual record update D'=D[logX1:=u],
all of logX, logB, s, thick and P are unchanged. The scale constraints
are exactly the original proof's record update. Therefore D' satisfies
the three displayed hypotheses of hstar in the replacement. Apply
star ONLY there, divide by the same positive m,a,#thick, and use the
unchanged final HasLogBound. The resulting eventual bound has the
original source conclusion. No assumption about star for any other
scale, epsilon, P or data is needed at this consumer.

For RH only take q=1 and the principal character in the source's last
deduction: N0=18480, a=9239, a^2=1 modulo N0 and gcd(a,N0)=1. For
each fixed hypothetical zero rho, epsilon=(min(Re rho,1)-1/2)/51.
For every prime d in that class construct exactly the source P; the
one-sided criterion chooses a suitable d depending on rho and beta.
The bound is eventual for each d individually, not uniform in d.
Do NOT fix one d for all zeros or replace eventuality by samples.
Induction of the principal character to N0 preserves the hypothetical
zero (Euler factors nonzero at Re rho>0); the native one-sided
criterion contradicts it. Apply the original principal-only reflection
to get the zeta line statement. No invocation of New.grh or New.Main.

This gives a strictly narrower DOMAIN of the sufficient star inequality:
only modulus 18480, 0<epsilon<1/100, log log b=epsilon log x,
towerDeg(s)/log b<=#thick and t<=log x1<=t^2.
We have not proved the restricted inequality; A1–A3/B1–B4/C1–C3 all
survive unless specialized supplier proofs actually remove their premises.
No claim of strict logical weakness relative to RH itself; no general
GRH result. No change to the independent D1/E1 human PNT route or signed
residue audit. The new candidate uses the native moment route for replay,
not a claim that the shorter human PNT variant is kernel-checked.

## Source ledger
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65:
eventually_primeError_le_rpow (exact body, only three changes below);
New.grh q=1 specialization; New.zeta_zeros_on_line principal-only.
New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41 exists_data.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
Data record and x,b,x1 definitions.
New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185 Parameters.
New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3:
IsPolar.exists_window_sub_mul_le, entireL_ne_zero_of_primeError_le.
Statements.lean 1cd1bce93344065936b2b392b23306254e0785ef definition only.

Original graph: star -> eventually_primeError_le_rpow -> New.grh ->
New.zeta_zeros_on_line (arrows supplier to consumer); also D1, polar
window, twist density, functional equation. Candidate: selected-window
star hypothesis -> eventual_window_run82 -> principal_right_run82 ->
zeta_line_run82. All analytic original suppliers retained; not an
elaborated full transitive graph. Context key (pin,P,d,epsilon,rho,x,D,D',u);
no cross-d or cross-record reuse. Preserve all existing graphs/axioms.

Actual JS construction from fetched pinned Main.lean: exactly three
changes (signature, insertion of hs, replace star_inequality by hs);
reversal byte-for-byte, 6/6 deleted/duplicated anchor controls rejected.
No native lean/lake executable (command -v returned empty), no native
rh_scan/prune/reduce/auto/frontier run. No repeated arithmetic benchmark.
CI compact targeted_results blob 088cd2ec0e935ee1a282f10096949bcf671cc804: A module timed out,
six original named declarations standard axioms, full_RH_replay=false.
Latest B2 shared run 46006832164 independently checked seven declarations
and separate skew/count per live receipt; six-root graph failed collector
cross-check, not A evidence. State status blob 9459c0acbb3e68b78e7f46ebb36a45a25ee7647d
retrieved, graph aggregate ERROR. No new native PASS or URT speed claim.

RESUME HERE: use shared A workspace (after RUN81 replay) to execute
lake env lean /absolute/path/to/COMPACT_RUN82_RH_ONLY_FIXED_MODULUS.lean
and inspect exact elaboration/axiom/edge guards; first fix any actual
error. Then compile RUN81 as a module and compose with the single
example in the comment at end. No new cold build or claimed RH import.
Request independent audit of preserved scale/thick fields, fixed
modulus class and exact root specialization.
HANDOFF TO kernel, acceleration, integration/editor, formal audit.
-/

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

lemma eventually_primeError_window_run82 (P : Parameters) {ε : ℝ}
    (h : 0 < ε / 6 ∧ ε < 1 / 100)
    (hstar : ∀ D : Data P, log D.logB = ε * D.logX →
      towerDeg D.s / D.logB ≤ #D.thick →
      D.logX₁ ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX) ^ 2) →
      D.m * D.remainder ≤ D.logB ^ 2 * D.budget) :
    ∀ᶠ x in atTop, primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1) := by
  filter_upwards [h.elim (exists_data P), tendsto_log_atTop.const_mul_atTop (r := 1e6) (by bound)
    ((isPolar_primeError PrimeSevenModEight.mod_eight (P.coprime_N₁_d
    0).coprime_mul_right).exists_window_sub_mul_le (isPolar_primeError PrimeSevenModEight.mod_eight
    P.d.coprime_one_left))] with x ⟨D, _, _, l, e, H'⟩ W
  subst x; simp only [log_exp, Set.mem_preimage, ← exp_mul] at *
  obtain := D.hasLogLower_of_le H', D.scale
  -- move `log x₁` to a point `u` of the window where `R_{N₀} - (#tops / #thick) R₁ ≤ x ^ (-10⁶)`
  obtain ⟨u, ⟨a, b⟩, w⟩ := W (towerDeg D.s / #D.thick) ⟨by bound, D.le_of_hasLogBound⟩
  let D' := {D with logX₁ := u, scale := by grw [b, l] <;> grind}
  have := D'.hasLogLower_of_le H'
  have hs := hstar D' (by simpa [D'] using e) (by simpa [D'] using H')
    ⟨by simpa [D'] using a, by simpa [D'] using b⟩
  calc primeError P.d P.N₀ D.x = D'.m * D'.remainder / D'.m / D'.a / #D.thick + (primeError P.d P.N₀
      D'.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D'.x₁) := by simp [remainder_eq, tops,
      card_placeClass_eq, field, HasLogBound.pos D', ne_of_gt]
    _ ≤ D'.logB ^ 2 * D'.budget / D'.m / D'.a / #D.thick + exp
      (-(1e6 * D.logX)) := by grw [hs, w]
    -- the first term is `f log⁵ b / (m #thick) ≤ φ(N₀) log⁶ b / √x`, and `log b = x ^ ε`
    _ ≤ _ := D'.le_of_hasLogBound (by grind)

/-- RH needs this fixed-modulus eventual bound, not the GRH family. -/
lemma principal_right_run82
    (hbound : ∀ (P : Parameters), P.N₀ = 18480 → ∀ ε : ℝ,
      0 < ε / 6 ∧ ε < 1 / 100 →
      ∀ᶠ x in atTop, primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1))
    (ρ : ℂ) (hρ : 1 / 2 < ρ.re) (hpole : ρ ≠ 1) :
    LFunction (1 : DirichletCharacter ℂ 1) ρ ≠ 0 := by
  intro z
  let q : ℕ := 1
  letI : NeZero q := ⟨by norm_num [q]⟩
  let χ : DirichletCharacter ℂ q := 1
  have zero : LFunction χ ρ = 0 := z
  have pole : χ ≠ 1 ∨ ρ ≠ 1 := Or.inr hpole
  set ε := (ρ.re ⊓ 1 - 2⁻¹) / 51
  have induced : entireL (χ.changeLevel (dvd_mul_left q 18480)) ρ = 0 := by
    rw [entireL]
    grind [LFunction_changeLevel, changeLevel_eq_one_iff]
  refine entireL_ne_zero_of_primeError_le (β := 8 * ε + 2⁻¹) (by grind)
    (.of_mul_eq_one (9240 * q - 1) (by grind [natCast_self (18480 * q)]) :
    IsUnit (9240 * q - 1 : ZMod (_ * q))) (fun d h ↦ ?_) ρ (by grind) _ induced
  let P := mk _ d ⟨q, rfl⟩ d.2 (by
    simp [← natCast_eq_zero_iff, h]; norm_cast; simp [↓natCast_eq_zero_iff, ← mul_assoc,
      mul_dvd_mul_iff_right])
  exact ⟨⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩,
    hbound P (by rfl) ε (by grind)⟩

/-- A conditional RH-only root, with the exact restricted star domain. -/
lemma zeta_line_run82
    (hstar : ∀ (P : Parameters), P.N₀ = 18480 → ∀ ε : ℝ,
      0 < ε / 6 ∧ ε < 1 / 100 →
      ∀ D : Data P, log D.logB = ε * D.logX →
      towerDeg D.s / D.logB ≤ #D.thick →
      D.logX₁ ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX) ^ 2) →
      D.m * D.remainder ≤ D.logB ^ 2 * D.budget) :
    RiemannZetaZerosOnLine := by
  have h := principal_right_run82 (fun P hP ε he ↦
    eventually_primeError_window_run82 P he (hstar P hP ε he))
  intro s
  obtain _ := h s, h (1 - s), @Nat.or_exists_add_one, riemannZeta_zero
  simp_all
  grind [riemannZeta_def_of_ne_zero, completedRiemannZeta_one_sub, Complex.Gammaℝ_eq_zero_iff]

set_option pp.fullNames true
run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  let guards : Array (Lean.Name × Array Lean.Name) := #[
    (``eventually_primeError_window_run82, #[``exists_data, ``IsPolar.exists_window_sub_mul_le]),
    (``principal_right_run82, #[``entireL_ne_zero_of_primeError_le]),
    (``zeta_line_run82, #[``eventually_primeError_window_run82, ``principal_right_run82])]
  for (n, required) in guards do
    let i ← Lean.getConstInfo n
    let some v := i.value? (allowOpaque := true) |
      Lean.throwError "RUN82 theorem value missing"
    let ds := v.getUsedConstants
    unless required.all (fun c => ds.contains c) do
      Lean.throwError "RUN82 required actual supplier missing"
    let ax ← Lean.collectAxioms n
    unless ax.all (fun c => allowed.contains c) do
      Lean.throwError "RUN82 unexpected axiom"
    Lean.logInfo m!"RUN82 {n} type_edges {i.type.getUsedConstants.map Lean.Name.toString}"
    Lean.logInfo m!"RUN82 {n} value_edges {ds.map Lean.Name.toString}"
    Lean.logInfo m!"RUN82 {n} axioms {ax.map Lean.Name.toString}"
#print axioms eventually_primeError_window_run82
#print axioms principal_right_run82
#print axioms zeta_line_run82

/- Actual final composition candidate, ONLY after separately replaying
COMPACT_RUN81_STAR_ACTUAL_CALLER and this file, with both imported in
a third probe (not executed here):
example : RiemannZetaZerosOnLine :=
  zeta_line_run82 (fun P _ _ _ D _ _ _ ↦ @star_inequality_run81 P D)
This still inherits ALL native A/B/C suppliers in RUN81; never interpret
as independent human proof closure or import Main to discharge the gap.
-/
