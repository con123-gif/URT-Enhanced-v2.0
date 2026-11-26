import Statements
import New.Data.DataExist
import New.Endgame.LongForms

/-!
# Compact integration — fixed-modulus scalar-to-RH bridge
26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, not elaborated.
Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3731f12ed73e738313fd7f93a30759d9086141e9; migration
24da6755f91e9dfb7fac28f80bca36b255919247. Original archives and old replay
results retained on their own pin (40e56bab026552e089d7afcfeff08d2defb9c005).
Adapted source declarations below from New/Main.lean blob 198ed5bf26aa294898931e0649bc2b88f1389f65;
upstream Apache-2.0; proof credit Levent Alpöge with Claude, compact rewrite
collaborators including Anthropic. Not a claim of independent RH authorship.

## One result: the compact star cut only at N0=18480

The actual root Main.riemannHypothesis uses New.zeta_zeros_on_line New.grh,
but zeta_zeros_on_line calls h ONLY at modulus one, character one, at s
and 1-s. The actual New.grh proof calls eventually_primeError_le_rpow only
with P.N0=18480*q, q the modulus of the input character. Consequently for
RH alone it suffices to reconstruct star_inequality for P.N0=18480.
No need for a uniform proof of star over the additional moduli.
This is a genuine specialization of the required mathematical domain,
NOT a claim of removing every auxiliary Dirichlet character in arithmetic.
In particular at M=18480 the Landau sum and the twist-density supplier
still involve all characters mod M, not only the lifted principal
character. The class for the auxiliary prime d remains 9239 mod 18480.
Indeed 9239^2=1 mod 18480 and 9239=7 mod 8. The criterion quantifies
over all primes in that class, although its zero-density proof selects
one d depending on the hypothetical zero and beta.

Let StarAt(M) mean: for every native Parameters P with P.N0=M, for
EVERY native admissible Data D of P, m*remainder <= logB^2*budget.
The theorem below gives StarAt(18480) -> Mathlib.RiemannHypothesis
without importing New.Main or Main or using their proved RH/GRH declarations.
The actual analytic argument is retained (not replaced by the old G window):
for fixed P and epsilon in (0,1/100), exists_data at every sufficiently
large x and a good second scale u in [t,t^2], t=10^6 log x, give a NEW
admissible D' with the same other fields. Apply the star premise to D',
not merely D. Exact remainder identity then gives
  R_M(x) <= phi(M) x^(6epsilon-1/2)+x^(-10^6)
          <= x^(8epsilon-1/2) eventually.
The asymptotic thresholds may depend on P and epsilon. They need not
be uniform over d; d is chosen for the zero before the tail estimate.
The source changeLevel step preserves a hypothetical zero. Choose
epsilon=(min(Re rho,1)-1/2)/51. Then beta=1/2+8epsilon is strictly
below Re rho, and the actual one-sided criterion contradicts the zero.
The functional equation with trivial-zero and pole guards finishes.
No step assumes RH. No standalone equivalent criterion introduced.

## Ready/blocked ledger and source graph (source explicit edges only)

Original: Main.riemannHypothesis -> New.zeta_zeros_on_line -> New.grh
 -> eventually_primeError_le_rpow -> star_inequality.
Reduced: rh_from_fixed_star -> zeta_from_mod_one ->
 fixed_modulus_nonvanishing(q=1) -> eventually_primeError_of_star ->
 StarAt(18480). Both routes retain DataExist, scale comparison,
 remainder_eq, isPolar_primeError, exists_window_sub_mul_le,
 entireL_ne_zero_of_primeError_le, changeLevel and the functional equation.
The graph is not a complete kernel export; no globally deleted edges claimed.

At the StarAt cut use the compact A/B/C on the same D, one y, n, delta
and one fit family. Peer audit e28fed80 prepares star_weakened with
one-sided mainHeight and no crude remainder premise; geometry 7ffc9e07
supplies source-matched frame trace and greedy rank reduction; editor
05bb424d supplies the conjugate-embedding determinant and exact completion
budget. Their stronger variants are NOT imported as established facts.
The native rounded interface is the common fallback. New editor
manuscript 2b2bf474 preserved. To plug the audit candidate into this
certificate in a shared compact workspace, instantiate StarAt(18480)
with fun P _ D => CompactAudit50.star_weakened D, AFTER its actual
native caller is compiled and checked. For the exact rank-coupled variant
retain the editor's shared n and same twist; no independent y or theta.

Three required source-matched suppliers, still not fully human reconstructed:
A short forms / local index: New/Endgame/ShortAndEnough.lean
 b99eea0689be372d84362c58272b705e104b6a3a; retain seesaw and local loss.
B enough forms / positive-type energy: same file; FillingTheorem/Moments.
C long integral forms: New/Endgame/LongForms.lean
 9eff36cf003ac398fbd24361e80e95a03d0b0e05; retain completion and both
 height estimates, and fit-family supplier. New/Selmer/FitTwistsExist.lean
 da769eba595af2f883eed9b82dbd322a521aea14 actually chooses R/F and R'/F'
 once for each embedding, then a SINGLE mFoldTwist via
 exists_mFoldTwist_selmerLengthLe, then uses the two denominatorLe_rowBudget
 consumers (ordinary and rank-one) on that same twist. The finite-prime
 budget sum and both all-lift guards remain; not discharged by our cut.
 New/Selmer/DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534,
 New/Selmer/TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754.

Analytic sources: Statements.lean 1cd1bce93344065936b2b392b23306254e0785ef;
 Main.lean a5d8389131c985a0b54ce5b0e778ee5c8126a997;
 New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41;
 New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834;
 New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2;
 New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3;
 Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11.
Source pin and context kept distinct from old rho-half-strip adapter.

## Checks and limits
Actual source bodies retrieved. Six unique reversible substitutions on
three native declarations, verified in JavaScript before committing.
No numerical prime tests or synthetic matrices. Local command -v lean/lake
returned no executable. No new kernel check, no new axiom evidence.
Old engine CI 45577239749 and 45576756833 is not compact verification.
The compact README blob 85d43d83a7fa3b496968ce9216f4a7d75e44e84a reports
external successful build, kernel replay and Comparator acceptance; this
is not a replay of this new adapter. No new unconditional proof obligations
retired by our reconstruction. Distinct essential frontier not counted
until role-complete compact export. Axioms below are commands to execute,
not observed output. No import of the claimed RH theorem.

Failed retrieval: integration/RESUME_HERE.md and upstream
New/Data/Parameters.lean not found at checked paths; latest integration
and peer commits and actual native caller bodies used instead. No
new independent runner or schedule change.
RESUME HERE: shared compact kernel lane compile this exact file against
the pinned compact toolchain; check that S P rfl elaborates on Parameters.mk
and the modified zeta functional-equation proof closes. Run role-inclusive
rh_scan, rh_prune, rh_reduce/rh_auto/frontier adapted to 4.35.0 at the
actual fixed-modulus root and record axioms and unreduced graph. Then
replay peer audit's star_weakened and substitute at StarAt(18480) once.
Human editor retain fixed-modulus cut and the auxiliary all-character
guard; math/character lane prove the same-context C budget, geometry
and theta lanes supply actual B/A respectively. Keep all original
source and unresolved leaves. HANDOFF TO: kernel, audit, editor,
math, prime-window, Galois, character, geometry, theta, dependency lanes.
-/

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace CompactIntegration

def StarAt (M : ℕ) : Prop :=
  ∀ (P : Parameters), P.N₀ = M → ∀ D : Data P,
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget

lemma eventually_primeError_of_star (P : Parameters) {ε : ℝ} (h : 0 < ε / 6 ∧ ε < 1 / 100)
    (S : ∀ D : Data P, D.m * D.remainder ≤ D.logB ^ 2 * D.budget) :
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
  calc primeError P.d P.N₀ D.x = D'.m * D'.remainder / D'.m / D'.a / #D.thick + (primeError P.d P.N₀
      D'.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D'.x₁) := by simp [remainder_eq, tops,
      card_placeClass_eq, field, HasLogBound.pos D', ne_of_gt]
    _ ≤ D'.logB ^ 2 * D'.budget / D'.m / D'.a / #D.thick + exp
      (-(1e6 * D.logX)) := by grw [S D', w]
    -- the first term is `f log⁵ b / (m #thick) ≤ φ(N₀) log⁶ b / √x`, and `log b = x ^ ε`
    _ ≤ _ := D'.le_of_hasLogBound (by grind)

lemma fixed_modulus_nonvanishing (q : ℕ) [NeZero q] (S : StarAt (18480 * q))
    (χ : DirichletCharacter ℂ q) (ρ : ℂ) (hρ : 1 / 2 < ρ.re)
    (pole : χ ≠ 1 ∨ ρ ≠ 1) : DirichletCharacter.LFunction χ ρ ≠ 0 := fun zero ↦ by
  -- `51` gives `ε < 1 / 100` and `8 ε + 1 / 2 < re ρ`
  set ε := (ρ.re ⊓ 1 - 2⁻¹) / 51
  -- pass to the modulus `N₀ = 18480 q` and the class `N₀ / 2 - 1`, whose square is `1`
  have induced : entireL (χ.changeLevel (dvd_mul_left q 18480)) ρ = 0 := by
    rw [entireL]
    grind [LFunction_changeLevel, changeLevel_eq_one_iff]
  refine entireL_ne_zero_of_primeError_le (β := 8 * ε + 2⁻¹) (by grind)
    (.of_mul_eq_one (9240 * q - 1) (by grind [natCast_self (18480 * q)]) :
    IsUnit (9240 * q - 1 : ZMod (_ * q))) (fun d h ↦ ?_) ρ (by grind) _ induced
  -- each prime `d` of the class gives parameters, and `eventually_primeError_le_rpow` is the bound
  -- that is asked for
  let P := mk _ d ⟨q, rfl⟩ d.2 (by
    simp [← natCast_eq_zero_iff, h]; norm_cast; simp [↓natCast_eq_zero_iff, ← mul_assoc,
      mul_dvd_mul_iff_right])
  exact ⟨⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩,
    eventually_primeError_of_star P (by grind) (S P rfl)⟩

lemma zeta_from_mod_one
    (h : ∀ (χ : DirichletCharacter ℂ 1) (s : ℂ), 1 / 2 < s.re →
      (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s ≠ 0) :
    RiemannZetaZerosOnLine := fun s ↦ by
  obtain _ := h 1 s, h 1 (1 - s), @Nat.or_exists_add_one, riemannZeta_zero
  simp_all
  grind [riemannZeta_def_of_ne_zero, completedRiemannZeta_one_sub, Complex.Gammaℝ_eq_zero_iff]

/-- The precise RH-only cut; does not use a GRH theorem. -/
theorem rh_from_fixed_star (S : StarAt 18480) : RiemannHypothesis :=
  zeta_from_mod_one (fixed_modulus_nonvanishing 1
    (by simpa using S))

end CompactIntegration

#print axioms CompactIntegration.eventually_primeError_of_star
#print axioms CompactIntegration.fixed_modulus_nonvanishing
#print axioms CompactIntegration.zeta_from_mod_one
#print axioms CompactIntegration.rh_from_fixed_star
#print axioms entireL_ne_zero_of_primeError_le
#print axioms Data.remainder_eq
