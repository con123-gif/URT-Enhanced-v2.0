import Run88Endpoint
import Lean

/-!
# Dependency RUN86 — repair the actual RUN99 count-selector compiler failure
28 November 2026. PREPARED from actual diagnostics; NOT native recompiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, continuity, state/protocol, current peer commits
0404c5d2, 77c78c4f, 8f441c84 and 3fedf4a6 read. No duplicate endpoint
reformulation; mathematical weighted prime lower bound remains open.

ACTUAL NATIVE EVIDENCE: shared compute run 46129085575,
cathedral-research-state/compute/rh-compact-prime-count-budget-20261128/
status.json blob 294e96059d7723a0ca2162d790ff0d7aeb5dea6b;
outputs/run99_count_budget_receipt.json blob 9ad4f72573d9e6e27a98e4371eecd8d9719fac17;
outputs/DepCountEscape82.log blob fdad789a55c6f91d705110f1255d566be6abd34f.
Original RUN82 blob edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9, preserved.
Run94StarGrid passed (exit 0, 8.53s, four standard-axiom reports and
guard marker; object SHA256 b08e8b708fedfb4de3e25dfd09c72323ecaeac8911ca313b2e3e4ec99d8f620c).
DepCountEscape82 exit 1 (7.78s); IntegrationGuardedFinitePower exit 1
(8.74s); both have sorryAx. The combined graph and omitted-budget
negative control did NOT run. These are actual failed compiler stages,
not failed arithmetic theorems. Preserve separate receipts; do not
advertise RUN99 as PASS or rerun accepted RUN94 unnecessarily.

Repair all nine reported error entries, including the final axiom guard
which is a consequence of earlier elaboration failures:
- Lines 73,78,104,109: qualify Finset.Ioc (not Set.Ioc).
- Line 112: restore the expected Fact binder type via the qualified filter.
- Line 116: qualify Finset.card_le_card and Finset.card_biUnion_le.
- Line 117: .of_norm_le expects bare RHS, NOT its norm. Use norm_natCast
  for the left side only. Native cardinal union bound gives
  #good <= sum_ξ #badξ, and casting proves the exact target.
- Lines 146,151: use DirichletCharacter.LFunction, not ZMod.LFunction.
- Line 183: retain strict axiom guard, do not suppress sorryAx.

Mathematics: identical finite union contradiction, for fixed M, eta,
beta and y. No new estimates or removed mathematical premises.
ZeroFreeTwist.lean blob 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11 and
OneSidedCriterion.lean blob 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3
retrieved at compact pin. CountEscape, CountEscapeGrid, signed Landau
and reflection definitions/bodies and complete guard roster unchanged.
Source substitutions executed: 9 exact occurrences, 14 missing/duplicate
anchor negative controls, five protected segments compared bytewise.
No local lean/lake on PATH; no native rh_scan/prune/reduce/auto/frontier
or new graph run. All original and reduced graphs and all obligations
retained. This file is a sibling so the failed RUN99 remains reproducible
under its immutable source pins. Do not import both versions in one environment.

RESUME HERE: prime/shared compute owner should select THIS file as
DepCountEscape82 in the next pinned shared replay, update only the new
runner's source spec, and compile against Run88Endpoint. Preserve the
original RUN99 runner and receipts. Resolve the first remaining actual
diagnostic if any; require exit 0, all four standard-axiom reports and
direct guard, then run old/new constructor-inclusive graph once the
independent IntegrationGuardedFinitePower repair also passes. The
RUN83–85 and peer callers can use the same repaired module name only
after acceptance. No new cold build or competing queue entry from
this lane. HANDOFF prime / integration / kernel / audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open ArithmeticFunction DirichletCharacter Complex Moebius Finset Real ZMod vonMangoldt LSeries
  Filter jacobiSym legendreSym MeasureTheory Nat NumberTheorySymbols Set Topology Asymptotics

namespace RHDepCountEscape82

noncomputable def goodPrimes (S : Set ℕ) (x : ℕ) : Finset ℕ := by
  classical
  exact (Finset.Ioc 0 x).filter fun d => d.Prime ∧ d ∈ S

noncomputable def badPrimes {M : ℕ} [NeZero M] (ξ : DirichletCharacter ℂ M)
    (η y : ℝ) (x : ℕ) : Finset ℕ := by
  classical
  exact (Finset.Ioc 0 x).filter fun d => ∃ _ : Fact d.Prime,
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
    have hd' : d ∈ Finset.Ioc 0 x ∧ d.Prime ∧ d ∈ S := by simpa only [goodPrimes, Finset.mem_filter] using hd
    let q : Primes := ⟨d, hd'.2.1⟩
    obtain ⟨ξ, s, hs, hy, hz⟩ := hbad q hd'.2.2
    have hg := H q hd'.2.2
    refine Finset.mem_biUnion.mpr ⟨ξ, Finset.mem_univ _, ?_⟩
    change d ∈ (Finset.Ioc 0 x).filter (fun d => ∃ _ : Fact d.Prime,
      d % 8 = 7 ∧ M.Coprime d ∧ ∃ s, 1 / 2 + 9 * η ≤ re s ∧
        |im s| ≤ y ∧ entireL (quadTwist ξ d) s = 0)
    exact Finset.mem_filter.mpr ⟨hd'.1, ⟨⟨hd'.2.1⟩, hg.1, hg.2,
      s, hcut.trans hs, hy, hz⟩⟩
  have hc : (goodPrimes S x).card ≤
      ∑ ξ : DirichletCharacter ℂ M, (badPrimes ξ η y x).card :=
    (Finset.card_le_card hsub).trans Finset.card_biUnion_le
  change ‖((goodPrimes S x).card : ℝ)‖ ≤
    ∑ ξ : DirichletCharacter ℂ M, ((badPrimes ξ η y x).card : ℝ)
  rw [Real.norm_natCast]
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
    DirichletCharacter.LFunction (1 : DirichletCharacter ℂ 1) ρ ≠ 0 := by
  intro z
  let q : ℕ := 1
  letI : NeZero q := ⟨by norm_num [q]⟩
  let χ : DirichletCharacter ℂ q := 1
  have zero : DirichletCharacter.LFunction χ ρ = 0 := z
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
