import Run88Endpoint
import Lean

/-!
# Dependency RUN82 — exact count-escape selector at the analytic root
28 November 2026. PREPARED, NOT compiled. Credit Alpöge, Sernau, Anthropic
collaborators and Claude; reuse math lane 3198fbc2 and prime RUN97.
Read head 3b039f5943b15bd6a33ab789a51e2fb469afa09f, mission/spine/ledger blobs
3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,
579ecc1cafdb28eae7d1c97565700c571dfa7484; AGENTS, SWARM, HANDOFF,
EXPANSION and continuity/state/protocol. Peer integration cc8ccd1c,
audit 6b589f86 and count escape 3198fbc2 read; no second count derivation.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Native ZeroFreeTwist.lean blob 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11;
OneSidedCriterion.lean blob 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3.
RUN97 blob 1d53d2a8e084584627c3382f7e157cb71c7e05a0 (prepared, not a native receipt).
Mathlib Asymptotics/Defs.lean isBigO_iff and IsBigO.bound checked at pin.

RESULT: the math-lane count escape (CE) is precisely the negation
of the native Big-O assertion on the nonnegative prime cardinality.
On natural x>=1, the power is positive, so a Big-O witness C can be
enlarged to max(1,C). Conversely, failure of CE supplies an eventual
bound. Using the natural cutoff instead of real X changes only a fixed
factor for 0<eta<1: floor X>=X/2 for X>=2. This avoids the separate
LSeriesSummable/logMul adapter in the original RUN97 selector.
For a fixed eta>0 with 1/2+9eta<=beta, suppose all primes in S fail
twist avoidance at beta and fixed y. The good endpoint prime count is
bounded by the union of the native exceptional finite-character sets,
then by their cardinality sum. The native .fun_sum combines Big-O
bounds with fixed M, eta, y. Hence it is Big-O, contradicting CE.
No new estimates for prime counts, no uniformity in y or d, and no
change to the existing signed residue or quartic endpoint caller.
Eta=4epsilon/9 gives 1/2+9eta=1/2+4epsilon<=1/2+8epsilon.

Original graph: divergent log mass -> LSeriesSummable -> density
selection -> signed Landau -> endpoint -> reflection.
Candidate: count not Big-O -> finite union/count -> same native density
-> same downstream consumers. Original source and graphs retained;
do not infer global removal of L-series dependencies: they may enter
through density or other suppliers. This candidate does not import
RUN97 or Main. All arithmetic endpoint premises remain unproved.
RUN95 shared replay is only an earlier conditional certificate.

Executed in connector: authenticated exact pinned source fetch;
8 unique RUN97 tail substitutions and 16 missing/duplicate
anchor negative controls, unchanged signed residue and reflection body.
No local Lean/lake; no native rh_scan/prune/reduce/auto/frontier run.
Native compile/axiom and complete transitive graph evidence pending.
No new shared compute registration while other endpoint jobs active.

RESUME HERE: compile this file as DepCountEscape82 in the retained
Run88Endpoint workspace; repair first actual diagnostic at finite
union/membership, cast or Big-O instantiation. Require original
downstream type and supplier guards below, standard axioms, then
strict constructor-inclusive 4.35 graph on both selection variants.
Record missing/extra paths rather than assume global pruning.
HANDOFF TO prime/math/integration/kernel/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open ArithmeticFunction DirichletCharacter Complex Moebius Finset Real ZMod vonMangoldt LSeries
  Filter jacobiSym legendreSym MeasureTheory Nat NumberTheorySymbols Set Topology Asymptotics

namespace RHDepCountEscape82

noncomputable def goodPrimes (S : Set ℕ) (x : ℕ) : Finset ℕ := by
  classical
  exact (Ioc 0 x).filter fun d => d.Prime ∧ d ∈ S

noncomputable def badPrimes {M : ℕ} [NeZero M] (ξ : DirichletCharacter ℂ M)
    (η y : ℝ) (x : ℕ) : Finset ℕ := by
  classical
  exact (Ioc 0 x).filter fun d => ∃ _ : Fact d.Prime,
    d % 8 = 7 ∧ M.Coprime d ∧ ∃ s, 1 / 2 + 9 * η ≤ re s ∧
      |im s| ≤ y ∧ entireL (quadTwist ξ d) s = 0

noncomputable def CountEscape (S : Set ℕ) (η : ℝ) : Prop :=
  ¬ ((fun x : ℕ => ((goodPrimes S x).card : ℝ)) =O[atTop]
    fun x : ℕ => (x : ℝ) ^ (1 - η / 2))

theorem exists_twist_on_count_escape {M : ℕ} [NeZero M] (S : Set ℕ)
    {η β : ℝ} (y : ℝ) (hη : 0 < η) (hcut : 1 / 2 + 9 * η ≤ β)
    (hescape : CountEscape S η)
    (H : ∀ d : Primes, d.1 ∈ S → d.1 % 8 = 7 ∧ M.Coprime d) :
    ∃ d : Primes, d.1 ∈ S ∧ ∀ ξ s,
      β ≤ re s → |im s| ≤ y → entireL (@quadTwist M ξ d _) s ≠ 0 := by
  classical
  by_contra! hbad
  apply hescape
  have hsum : (fun x : ℕ => ∑ ξ : DirichletCharacter ℂ M,
      ((badPrimes ξ η y x).card : ℝ)) =O[atTop]
      fun x : ℕ => (x : ℝ) ^ (1 - η / 2) :=
    .fun_sum (s := ⊤) fun ξ _ => by
      simpa only [badPrimes] using @zero_density_quadTwist M _ ξ _ hη y
  refine .trans (.of_norm_le fun x => ?_) hsum
  have hsub : goodPrimes S x ⊆
      Finset.univ.biUnion (fun ξ : DirichletCharacter ℂ M => badPrimes ξ η y x) := by
    intro d hd
    have hd' : d ∈ Ioc 0 x ∧ d.Prime ∧ d ∈ S := by simpa [goodPrimes] using hd
    let q : Primes := ⟨d, hd'.2.1⟩
    obtain ⟨ξ, s, hs, hy, hz⟩ := hbad q hd'.2.2
    have hg := H q hd'.2.2
    refine Finset.mem_biUnion.mpr ⟨ξ, Finset.mem_univ _, ?_⟩
    change d ∈ (Ioc 0 x).filter (fun d => ∃ _ : Fact d.Prime,
      d % 8 = 7 ∧ M.Coprime d ∧ ∃ s, 1 / 2 + 9 * η ≤ re s ∧
        |im s| ≤ y ∧ entireL (quadTwist ξ d) s = 0)
    exact Finset.mem_filter.mpr ⟨hd'.1, ⟨⟨hd'.2.1⟩, hg.1, hg.2,
      s, hcut.trans hs, hy, hz⟩⟩
  have hc : (goodPrimes S x).card ≤
      ∑ ξ : DirichletCharacter ℂ M, (badPrimes ξ η y x).card :=
    (card_le_card hsub).trans card_biUnion_le
  change ‖((goodPrimes S x).card : ℝ)‖ ≤
    ‖∑ ξ : DirichletCharacter ℂ M, ((badPrimes ξ η y x).card : ℝ)‖
  rw [Real.norm_of_nonneg (by positivity), Real.norm_of_nonneg (by positivity)]
  exact_mod_cast hc

theorem entireL_ne_zero_on_count_escape {M : ℕ} [NeZero M] (S : Set ℕ)
    {η β : ℝ} (hη : 0 < η) (hβ : 1 / 2 < β)
    (hcut : 1 / 2 + 9 * η ≤ β) (hescape : CountEscape S η)
    (h : ∀ d : Primes, d.1 ∈ S → (d.1 % 8 = 7 ∧ M.Coprime d) ∧
      ∀ᶠ x in atTop, primeError d M x ≤ x ^ (β - 1))
    (ρ : ℂ) (hρ : β < ρ.re) (χ : DirichletCharacter ℂ M) :
    entireL χ ρ ≠ 0 := by
  let ⟨d, e, hZ⟩ := exists_twist_on_count_escape S |ρ.im| hη hcut hescape
    (fun d hd => (h d hd).1)
  use by_cases (entireL_ne_zero χ) (flip ?_ (((h d e).1.elim isPolar_primeError).landau (by bound)
    (le_total · 1 |>.rec ?_ ?_) (.mono (tendsto_exp_atTop (h d e).2) (by simp [exp_mul, mul_comm]))
    hρ)) <;> simp +contextual (maxDischargeDepth := 3) [le_of_lt, div_re,
    (tendsto_sub_mul_logDeriv_entireL _).1.2, *, normSq, entireL_ne_zero, (hβ.trans hρ).trans',
    ← cast_sum, tendsto_sub_mul_logDeriv_entireL, ne_of_apply_ne re, ne_of_gt]; bound

def CountEscapeGrid : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 → ∃ S : Set ℕ,
    CountEscape S (4 * ε / 9) ∧
    ∀ d : Primes, d.1 ∈ S →
      (d.1 % 8 = 7 ∧ (18480 : ℕ).Coprime d) ∧
      RHPrimeWindow88.EndpointGrid d 18480 (ε/2)

theorem principal_right_from_count_escape_grid (hg : CountEscapeGrid)
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
  have he : 0 < ε / 6 ∧ ε < 1 / 100 := by grind
  obtain ⟨S,hescape,hS⟩ := hg ε he
  have hε : 0 < ε := by linarith [he.1]
  refine entireL_ne_zero_on_count_escape S (η := 4 * ε / 9)
    (β := 8 * ε + 2⁻¹) (by positivity) (by linarith)
    (by linarith) hescape (fun d hd ↦ ?_) ρ (by grind) _ induced
  obtain ⟨guards,grid⟩ := hS d hd
  exact ⟨guards, RHPrimeWindow88.eventual_from_endpoint_grid d 18480 ε he grid⟩

theorem zeta_line_from_count_escape_grid (hg : CountEscapeGrid) :
    RiemannZetaZerosOnLine := by
  have h := principal_right_from_count_escape_grid hg
  intro s
  obtain _ := h s, h (1 - s), @Nat.or_exists_add_one, riemannZeta_zero
  simp_all
  grind [riemannZeta_def_of_ne_zero, completedRiemannZeta_one_sub, Complex.Gammaℝ_eq_zero_iff]


end RHDepCountEscape82

#print axioms RHDepCountEscape82.exists_twist_on_count_escape
#print axioms RHDepCountEscape82.entireL_ne_zero_on_count_escape
#print axioms RHDepCountEscape82.principal_right_from_count_escape_grid
#print axioms RHDepCountEscape82.zeta_line_from_count_escape_grid

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHDepCountEscape82.exists_twist_on_count_escape, #[``zero_density_quadTwist]),
      (``RHDepCountEscape82.entireL_ne_zero_on_count_escape,
        #[``RHDepCountEscape82.exists_twist_on_count_escape, ``isPolar_primeError]),
      (``RHDepCountEscape82.principal_right_from_count_escape_grid,
        #[``RHDepCountEscape82.entireL_ne_zero_on_count_escape, ``RHPrimeWindow88.eventual_from_endpoint_grid]),
      (``RHDepCountEscape82.zeta_line_from_count_escape_grid,
        #[``RHDepCountEscape82.principal_right_from_count_escape_grid])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN82 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN82 missing value"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN82 missing supplier: {n}"
  logInfo "RUN82_COUNT_ESCAPE_DIRECT_GUARDS_OK"
