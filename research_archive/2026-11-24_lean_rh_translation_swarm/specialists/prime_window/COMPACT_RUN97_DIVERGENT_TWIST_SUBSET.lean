import Run88Endpoint
import Lean

/-!
# Prime RUN97 — divergent subfamily of twists suffices
28 November 2026. HUMAN DERIVATION / PREPARED; not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION; latest peer exact-completion
575f1cad, signed envelope 8cab66c3, polar mean 55e967d5; these concern
within-record costs, not the following twist-family restriction.
Prior RUN96 guarded domain remains PREPARED; do not claim its replay.
Search of prior harmonic / twist density / twist subset / reciprocal
prime commit titles and exact peer work found native density exposition,
not this restricted divergent-subfamily caller.

NEW mathematical sufficient criterion. For every fixed epsilon in the
endpoint range, choose a set S_e of auxiliary primes in class 9239
mod 18480 with
                  sum_{p in S_e} log(p)/p = infinity.
For each p in S_e establish the existing eventual quartic endpoint
with eta=epsilon/2; thresholds may depend on p and epsilon. In terms of
RUN96, it suffices to establish its guarded star at eta=epsilon/2 on
those P with d in S_e. No estimate for primes outside S_e is necessary.
S_e may depend on epsilon but is fixed before x tends to infinity.
Neither divergence nor the arithmetic star can be inferred merely
from finding arbitrarily large good primes.

Proof: Suppose rho is a right-half-plane zero; choose epsilon as in
checked RUN88, beta=1/2+8epsilon<Re rho. Choose eta>0 small enough
that 1/2+9eta<beta. Native zero_density_quadTwist bounds the number
of bad primes <=X (d % 8=7, coprime M) having a zero at
Re s>=1/2+9eta, |Im s|<=|Im rho|, for each fixed character, by
O(X^(1-eta/2)). There are finitely many characters mod M, so the
union of bad primes has the same power-saving count. For dyadic
2^j<=p<2^(j+1) its log-weighted reciprocal sum is bounded by
O((j+1) 2^(-j eta/2)), summable. Hence not all primes of S_e can
be bad, because its log-weighted reciprocal series diverges.
Pick a fixed d in S_e avoiding all these zeros. At rho the twist
orders vanish, so the native signed residue / Landau argument
applies unchanged to the bound for this d. The verified reciprocal
chord and quartic cover transfer endpoint to the eventual bound.
The functional equation gives the left side as in RUN88.
This uses neither RH nor the claimed upstream Main theorem.

Nonimplication control: an infinite or unbounded set of primes is
not sufficient for this density argument. Choose primes p_j>=2^(j^2)
strictly increasing; log(p)/p decreases for p>e, so their weighted
sum is finite. Even a power-saving exceptional family may be infinite.
Do not replace the divergence hypothesis by unboundedness.
The all-class domain implies the analytic subset hypothesis by choosing
the full class and the standard divergent prime progression series
(the exact source proof uses not_summable_residueClass_prime_div).
We do not claim the subset criterion is proved, or that the converse
holds. Arithmetic A/B/C remains entirely open.

Sources: ZeroFreeTwist.lean blob 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11,
last two declarations zero_density_quadTwist and
exists_entireL_quadTwist_ne_zero; OneSidedCriterion.lean blob
93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3, first lemma
entireL_ne_zero_of_primeError_le; RUN88 endpoint root accepted.
The proof below replaces native nonsummability of a whole progression
with nonsummability of its chosen subfamily, leaving the density sum
and signed residue proof intact. LSeriesSummable(logMul mask) at 1
is exactly convergence of sum log(p)/p for the nonnegative mask
(terms at n=0,1 vanish). The pointwise count inclusion is the only
new analytic selection check.

Executed: retrieved two pinned source blobs and two unique source
anchors; read prior peer commits and actual RUN95 receipt
b58fac802d12d1f3313fe5dc65ab06520577b841, compile/graph exit 0,
arithmetic_premise_proved=false, full_RH_replay=false.
This candidate is not in that receipt. No new kernel execution
or native scan/prune/reduce/auto/frontier; no graph deletion claim.
Retain RUN94/95/96 and previous source graphs.

RESUME HERE: compile THIS module as Run97TwistSubset in the retained
RUN95 compact workspace using the already authenticated Run88Endpoint
object, without rebuilding A/B/C; repair the first actual diagnostic
in the restricted count inclusion or LSeriesSummable instantiation.
Require normal kernel and direct supplier/axiom checks, compare strict
constructor-inclusive roots to RUN88, and retain all old evidence.
Then feed the exact divergent subfamily arithmetic criterion to
integration and prime lanes; do not duplicate native signed costs.
HANDOFF TO integration / editor / audit / kernel. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open ArithmeticFunction DirichletCharacter Complex Moebius Finset Real ZMod vonMangoldt LSeries
  Filter jacobiSym legendreSym MeasureTheory Nat NumberTheorySymbols Set Topology

namespace RHPrimeWindow97

noncomputable def primeMask (S : Set ℕ) (n : ℕ) : ℂ := by
  classical
  exact if n.Prime ∧ n ∈ S then 1 else 0

theorem exists_twist_on_divergent_set {M : ℕ} [NeZero M] (S : Set ℕ)
    {β : ℝ} (y : ℝ) (hβ : 1 / 2 < β)
    (hdiv : ¬ LSeriesSummable (logMul (primeMask S)) 1)
    (H : ∀ d : Primes, d.1 ∈ S → d.1 % 8 = 7 ∧ M.Coprime d) :
    ∃ d : Primes, d.1 ∈ S ∧ ∀ ξ s,
      β ≤ re s → |im s| ≤ y → entireL (@quadTwist M ξ d _) s ≠ 0 := by
  classical
  obtain ⟨η, hη, h⟩ := exists_pos_mul_lt (lt_min one_pos (sub_pos.2 hβ)) 9
  by_contra! hbad
  apply hdiv
  refine LSeriesSummable_logMul_of_lt_re (s := 1)
    ((LSeriesSummable_of_sum_norm_bigO (s := 1 - η / 2 / 2)
      (f := primeMask S)
      (.trans (.of_norm_le fun x ↦ ?_) (.fun_sum (s := ⊤) fun ξ _ ↦
        @zero_density_quadTwist M _ ξ _ hη y))
      (by grind) (by simpa)).abscissaOfAbsConv_le.trans_lt (mod_cast by simpa))
  simp [primeMask, apply_ite norm, ← cast_sum]
  grw [← card_biUnion_le, card_le_card]
  simp_all [Primes, subset_iff]; grind

theorem entireL_ne_zero_on_divergent_set {M : ℕ} [NeZero M] (S : Set ℕ)
    {β : ℝ} (hβ : 1 / 2 < β)
    (hdiv : ¬ LSeriesSummable (logMul (primeMask S)) 1)
    (h : ∀ d : Primes, d.1 ∈ S → (d.1 % 8 = 7 ∧ M.Coprime d) ∧
      ∀ᶠ x in atTop, primeError d M x ≤ x ^ (β - 1))
    (ρ : ℂ) (hρ : β < ρ.re) (χ : DirichletCharacter ℂ M) :
    entireL χ ρ ≠ 0 := by
  let ⟨d, e, hZ⟩ := exists_twist_on_divergent_set S |ρ.im| hβ hdiv
    (fun d hd => (h d hd).1)
  use by_cases (entireL_ne_zero χ) (flip ?_ (((h d e).1.elim isPolar_primeError).landau (by bound)
    (le_total · 1 |>.rec ?_ ?_) (.mono (tendsto_exp_atTop (h d e).2) (by simp [exp_mul, mul_comm]))
    hρ)) <;> simp +contextual (maxDischargeDepth := 3) [le_of_lt, div_re,
    (tendsto_sub_mul_logDeriv_entireL _).1.2, *, normSq, entireL_ne_zero, (hβ.trans hρ).trans',
    ← cast_sum, tendsto_sub_mul_logDeriv_entireL, ne_of_apply_ne re, ne_of_gt]; bound

def SubsetGrid : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 → ∃ S : Set ℕ,
    (¬ LSeriesSummable (logMul (primeMask S)) 1) ∧
    ∀ d : Primes, d.1 ∈ S →
      (d.1 % 8 = 7 ∧ (18480 : ℕ).Coprime d) ∧
      RHPrimeWindow88.EndpointGrid d 18480 (ε/2)

theorem principal_right_from_subset_grid (hg : SubsetGrid)
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
  obtain ⟨S,hdiv,hS⟩ := hg ε he
  refine entireL_ne_zero_on_divergent_set S (β := 8 * ε + 2⁻¹) (by grind)
    hdiv (fun d hd ↦ ?_) ρ (by grind) _ induced
  obtain ⟨guards,grid⟩ := hS d hd
  exact ⟨guards, RHPrimeWindow88.eventual_from_endpoint_grid d 18480 ε he grid⟩

theorem zeta_line_from_subset_grid (hg : SubsetGrid) :
    RiemannZetaZerosOnLine := by
  have h := principal_right_from_subset_grid hg
  intro s
  obtain _ := h s, h (1 - s), @Nat.or_exists_add_one, riemannZeta_zero
  simp_all
  grind [riemannZeta_def_of_ne_zero, completedRiemannZeta_one_sub, Complex.Gammaℝ_eq_zero_iff]

end RHPrimeWindow97

#print axioms RHPrimeWindow97.exists_twist_on_divergent_set
#print axioms RHPrimeWindow97.entireL_ne_zero_on_divergent_set
#print axioms RHPrimeWindow97.principal_right_from_subset_grid
#print axioms RHPrimeWindow97.zeta_line_from_subset_grid

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHPrimeWindow97.exists_twist_on_divergent_set, #[``zero_density_quadTwist]),
      (``RHPrimeWindow97.entireL_ne_zero_on_divergent_set, #[``RHPrimeWindow97.exists_twist_on_divergent_set, ``isPolar_primeError]),
      (``RHPrimeWindow97.principal_right_from_subset_grid, #[``RHPrimeWindow97.entireL_ne_zero_on_divergent_set, ``RHPrimeWindow88.eventual_from_endpoint_grid]),
      (``RHPrimeWindow97.zeta_line_from_subset_grid, #[``RHPrimeWindow97.principal_right_from_subset_grid])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN97 nonstandard axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN97 missing value"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN97 missing supplier: {n}"
  logInfo "RUN97_TWIST_SUBSET_GUARDS_OK"
