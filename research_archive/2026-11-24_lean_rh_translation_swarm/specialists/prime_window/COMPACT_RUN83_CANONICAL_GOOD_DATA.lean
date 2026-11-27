import Statements
import New.Data.DataExist
import New.Endgame.ShortAndEnough
import Lean

/-!
# RUN83 — existential canonical-scale star supplier, no window moment selection
27 November 2026. HUMAN SOURCE-MATCHED reduction; Lean candidate PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
4878ea106b791c42b5f5a45810162de59701c4d9, 01fa22a6b12abad5ccf580d2621f82be3bf70c13.
Read AGENTS, swarm, handoff, expansion, RUN81/82, signed-residue editorial
audit fef13351f9bf931bac9d495c548fb31a0089714b, latest peer commits
93631676 (shared A1/A2 transport), e652114c (spectral-tail B4),
3b9809d9 (affordable reachable spans), e2cc892e (A2 original caller).
D1/E1 already human-audited: reuse, do not rederive their analytic foundations.

## New quantifier reduction at actual Main.eventually_primeError_le_rpow
RUN82 requires star for EVERY D in its selected window domain. Instead
it suffices, for each fixed P of modulus 18480 and fixed epsilon, that
for EVERY sufficiently large x there EXISTS ONE D with
 D.x=x, D.logX1=x^(epsilon/6), log D.logB=epsilon log x,
 towerDeg D.s / D.logB <= #D.thick, and m*remainder <= logB^2*budget.
No universal star on other admissible D, no reselection of logX1 and no
additional lower bound (10^6 log x)^2 on logX1 is required in the consumer.
D1 still supplies canonical admissible data, but does NOT supply the
existence of a GOOD witness; do not choose D1 and assume star on it.
The existential premise is a new sufficient proof target, not proved.
It is weaker than universal star on the SAME canonical scale; do not
claim it follows directly from RUN82's distinct smaller-scale domain.

Use the existing editorial signed-residue audit (section 2) for the
ordinary fixed-modulus PNT tail: R_M(y), R_1(y) =
O_P((1+sqrt(log y))*exp(-c_P sqrt(log y))) after exact constant
normalization. Fix P and epsilon before x grows. At y=exp(x^(epsilon/6))
the tail is smaller than every fixed inverse power of x, since
x^(epsilon/12)/log x tends to infinity. Consequently, uniformly for
0<=c<=exp(epsilon log x), R_M(y)-c R_1(y)<=x^(-1000000)
eventually: bound both tails by (1/2)x^(-1000001) and use
1+c<=2x for x>=1 and epsilon<1/100. This uses only the already audited
classical PNT, not RH or uniformity over growing moduli.
The explicit tail premise below isolates this audited input; its
native proof is not supplied here. In particular it does not require
the actual IsPolar.exists_window_sub_mul_le moment-selection lemma.

Exact cancellation using the SAME selected D:
  R_M(x) = (m*remainder)/(m*a*#thick)
           + R_M(x1) - (towerDeg(s)/#thick)*R_1(x1).
Thickness bounds the coefficient by logB=exp(epsilon log x).
Substitution of the good-witness star inequality and the tail
bound gives precisely the native final HasLogBound comparison.
The original final comparison and principal-only contradiction are
reused, with no independent choice of D or twist. Do not relax
eventual existence to arbitrarily large isolated x: Landau requires
an eventual bound on all x. Failed route: a cofinal subsequence
does not control the gaps. No stronger asymptotic claim about star.

Source blobs at compact pin: New/Main.lean
198ed5bf26aa294898931e0649bc2b88f1389f65 (star, eventual, grh, zeta);
New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41 (exists_data);
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834;
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e;
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
(Data.remainder_eq, final budget and scale machinery);
New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2;
New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3.
RUN82 principal bridge reused verbatim except new declaration name.
Original occurrence graph: star, exists_data, polar window -> eventual
bound -> principal contradiction -> reflection. Reduced candidate:
canonical good-data existence, fixed-P tail, remainder_eq, HasLogBound
-> eventual bound -> same principal contradiction -> reflection.
D1 remains for construction of good data; all A/B/C and E1 density,
signed residues and Landau premises retained. No claim of transitive
deletion: imports and retained helpers may themselves depend on old
nodes. Cache key pin,P,epsilon,x,D; no cross-record or cross-twist reuse.

Verification: retrieved exact pinned source, compared native final
caller, checked quantifier/cancellation human argument. No native
Lean run or numerical tests here; no rh_scan/prune/reduce/auto/frontier
execution claimed. Re-fetched old-pin CI statuses
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717 (both returncode 0, old pin);
compact targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804
(module_1_build=124, full_RH_replay=false). Shared A1/A2 transport
queued by 93631676; do not launch a second cold build. All existing
graphs and axiom evidence retained. No new kernel PASS.
RESUME HERE: after shared A1/A2 workspace is available, execute
lake env lean /absolute/path/to/COMPACT_RUN83_CANONICAL_GOOD_DATA.lean
and inspect first actual elaboration error or exact direct dependency
and axiom guards; keep tail as explicit premise until its fixed-P PNT
native supplier is replayed. Request independent audit of existential
witness quantifiers and uniform coefficient tail. HANDOFF TO integration,
editor, kernel and audit. Root remains OPEN.
-/

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

/-- One good canonical witness per sufficiently large scale, not all D. -/
lemma eventually_primeError_good_data_run83 (P : Parameters) {ε : ℝ}
    (h : 0 < ε / 6 ∧ ε < 1 / 100)
    (hgood : ∀ᶠ x in atTop, ∃ D : Data P,
      D.x = x ∧ D.logX₁ = x ^ (ε / 6) ∧
      log D.logB = ε * log x ∧ towerDeg D.s / D.logB ≤ #D.thick ∧
      D.m * D.remainder ≤ D.logB ^ 2 * D.budget)
    (htail : ∀ᶠ x in atTop, ∀ c ∈ Set.Icc (0 : ℝ) (exp (ε * log x)),
      primeError P.d P.N₀ (exp (x ^ (ε / 6))) -
      c * primeError P.d 1 (exp (x ^ (ε / 6))) ≤ exp (-(1e6 * log x))) :
    ∀ᶠ x in atTop, primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1) := by
  filter_upwards [hgood, htail] with x ⟨D, hx, l, e, H', hs⟩ W
  subst x
  simp only [log_exp] at e W
  have := D.hasLogLower_of_le H'
  have hb : D.logB = exp (ε * D.logX) := by
    rw [← e, exp_log (HasLogBound.pos D)]
  have hc : towerDeg D.s / #D.thick ∈ Set.Icc (0 : ℝ) (exp (ε * D.logX)) :=
    ⟨by bound, by rw [← hb]; exact D.le_of_hasLogBound⟩
  have w := W _ hc
  rw [← l] at w
  calc primeError P.d P.N₀ D.x = D.m * D.remainder / D.m / D.a / #D.thick +
      (primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁) := by
      simp [remainder_eq, tops, card_placeClass_eq, field, HasLogBound.pos D, ne_of_gt]
    _ ≤ D.logB ^ 2 * D.budget / D.m / D.a / #D.thick + exp (-(1e6 * D.logX)) := by
      grw [hs, w]
    _ ≤ _ := D.le_of_hasLogBound (by grind)

lemma principal_right_run83
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


lemma zeta_line_run83
    (hgood : ∀ (P : Parameters), P.N₀ = 18480 → ∀ ε : ℝ,
      0 < ε / 6 ∧ ε < 1 / 100 →
      ∀ᶠ x in atTop, ∃ D : Data P,
        D.x = x ∧ D.logX₁ = x ^ (ε / 6) ∧
        log D.logB = ε * log x ∧ towerDeg D.s / D.logB ≤ #D.thick ∧
        D.m * D.remainder ≤ D.logB ^ 2 * D.budget)
    (htail : ∀ (P : Parameters), P.N₀ = 18480 → ∀ ε : ℝ,
      0 < ε / 6 ∧ ε < 1 / 100 →
      ∀ᶠ x in atTop, ∀ c ∈ Set.Icc (0 : ℝ) (exp (ε * log x)),
        primeError P.d P.N₀ (exp (x ^ (ε / 6))) -
        c * primeError P.d 1 (exp (x ^ (ε / 6))) ≤ exp (-(1e6 * log x))) :
    RiemannZetaZerosOnLine := by
  have h := principal_right_run83 (fun P hP ε he ↦
    eventually_primeError_good_data_run83 P he (hgood P hP ε he) (htail P hP ε he))
  intro s
  obtain _ := h s, h (1 - s), @Nat.or_exists_add_one, riemannZeta_zero
  simp_all
  grind [riemannZeta_def_of_ne_zero, completedRiemannZeta_one_sub, Complex.Gammaℝ_eq_zero_iff]

set_option pp.fullNames true
run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  let guards : Array (Lean.Name × Array Lean.Name) := #[
    (``eventually_primeError_good_data_run83, #[``Data.remainder_eq]),
    (``principal_right_run83, #[``entireL_ne_zero_of_primeError_le]),
    (``zeta_line_run83, #[``eventually_primeError_good_data_run83, ``principal_right_run83])]
  for (n, required) in guards do
    let i ← Lean.getConstInfo n
    let some v := i.value? (allowOpaque := true) |
      Lean.throwError "RUN83 theorem value missing"
    let ds := v.getUsedConstants
    unless required.all (fun c => ds.contains c) do
      Lean.throwError "RUN83 required direct supplier missing"
    if ds.contains ``IsPolar.exists_window_sub_mul_le then
      Lean.throwError "RUN83 unwanted direct polar-window supplier"
    let ax ← Lean.collectAxioms n
    unless ax.all (fun c => allowed.contains c) do
      Lean.throwError "RUN83 unexpected axiom"
    Lean.logInfo m!"RUN83 {n} type_edges {i.type.getUsedConstants.map Lean.Name.toString}"
    Lean.logInfo m!"RUN83 {n} value_edges {ds.map Lean.Name.toString}"
    Lean.logInfo m!"RUN83 {n} axioms {ax.map Lean.Name.toString}"
#print axioms eventually_primeError_good_data_run83
#print axioms principal_right_run83
#print axioms zeta_line_run83
