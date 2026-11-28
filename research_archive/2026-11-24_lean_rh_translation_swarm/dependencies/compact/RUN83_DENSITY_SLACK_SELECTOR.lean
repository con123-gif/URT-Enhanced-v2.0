import DepCountEscape82
import Lean

/-!
# Dependency RUN83 — split the two zero-density exponents at the actual count caller

28 November 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Branch head cb6f9b4bf1c3cc2c67f1b65d6d19a6943163476a inspected.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,
579ecc1cafdb28eae7d1c97565700c571dfa7484; AGENTS, SWARM, HANDOFF,
EXPANSION, continuity, state/protocol and latest summary read.
Latest peer integration 716292e8 (canonical fiber), audit 9ccb174e
(cofinal/full-upper-count equivalence), prime cfc5eaa3 and math 5c8c0ef5.
Do not redo their cofinal or canonical monotonicity proofs.

Native ZeroFreeTwist blob 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11;
OneSidedCriterion 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3; PolarLandau 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9;
RUN82 edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9 (PREPARED). Stage that file as DepCountEscape82
in the authenticated RUN94/95 compact endpoint environment.

## Actual new supplier and exact mathematics

Native zero_density_quadTwist uses one positive eta in TWO independent
premises: the three-lines threshold and the tail mean bound. Keep eta
for the former, but apply sum_thetaTailIntegral_le with independent
alpha>0. This is not a new mean-value estimate.

For fixed modulus N, character xi, height y, positive eta, alpha,
choose the primitive conductor M and T=sqrt(M X). Every bad prime
d<=X retains the original mod-8/coprimality and zero rectangle
Re(s)>=1/2+9eta, |Im(s)|<=y. Once T is sufficiently large, nonvanishing
of the Gaussian Mellin transform on the fixed compact rectangle
forces its two theta-tail integrals to sum to >T^(2eta), by the SAME
three-lines bound and the SAME original eta. On the other hand their
sum over all candidate primes is <=2 C_alpha T^(2+alpha), by the
native all-integer mean bound for each of the two coefficient sequences.
Therefore
    #bad(X) <= 2 C_alpha (M X)^(1-eta+alpha/2).
No change to zero location, primitive twist proof, character parity,
coefficients, Gaussian lower bound or prime-filter predicate. The
constant and threshold depend on the fixed parameters as before.
No assertion at alpha=0; take 0<alpha<2eta for a saving.

The supplied exact-source replacement uses only the independent
positive alpha in the mean-bound call and its resulting exponent in
the Big-O target and constant. The finite-character sum then allows
CountEscape S (2eta-alpha), instead of CountEscape S eta, at the
SAME zero-free threshold and endpoint premise. With alpha=eta/2,
the saving is 3eta/4 vs eta/2. At fixed epsilon, using eta=8epsilon/9
and alpha=4epsilon/9 is permitted by the original non-strict cut
beta=1/2+8epsilon; it gives exponent 1-2epsilon/3 instead of
1-2epsilon/9 in RUN82. This is a fixed-tolerance quantitative
improvement, not a proof of the needed prime-count inequality.
For the nested all-tolerance canonical budget, the audit's
full-upper-count equivalence implies this exponent improvement
does NOT by itself remove a global mathematical obligation. Do
not advertise it as a new RH route or a closed arithmetic gap.

## Failed weakening and retained dependencies

Do NOT raise the density cutoff past beta simply to use the
hypothetical zero's larger real part. PolarLandau.IsPolar.landau
requires nonnegative residues at EVERY real x>beta, not merely
nonvanishing at the target rho. A real twisted zero between beta
and the raised cutoff can contribute a negative residue. The
original signed residue proof tail is retained byte-for-byte.
Original dependency graph and RUN95 receipt retained. New source
graph: independent tail alpha + native three-lines eta -> improved
density -> finite union/count -> SAME signed Landau caller.
No global deletion or native replay claimed.

Executed connector checks: 14 source substitution cardinality
checks, 28 missing/duplicate anchor controls, exact native signed
tail match and real-residue guard inspection. Local Lean/lake absent,
local GitHub DNS unavailable. Shared run 46108846902 job 140867652611
in progress, no artifacts; run 46114460776 returned no jobs/artifacts.
No native rh_scan/prune/reduce/auto/frontier execution or axiom PASS.
Do not start a duplicate cold build or change protected workflows.

RESUME HERE: after actual DepCountEscape82 receipt, compile this exact
file as DepDensitySlack83 in the SAME retained compact workspace;
repair first actual diagnostic (especially the exponent equality in
the native final ring_nf), then require all three standard-axiom
and direct supplier guards and strict constructor-inclusive graph
comparison. Preserve both density bounds and all arithmetic premises.
HANDOFF TO prime/math/integration/kernel/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open ArithmeticFunction DirichletCharacter Complex Moebius Finset Real ZMod vonMangoldt LSeries
  Filter jacobiSym legendreSym MeasureTheory Nat NumberTheorySymbols Set Topology Asymptotics
open RHDepCountEscape82

namespace RHDepDensitySlack83

section Density
variable {N : ℕ} [NeZero N] (ξ : DirichletCharacter ℂ N) {η α : ℝ}

lemma zero_density_quadTwist_slack (hη : 0 < η) (hα : 0 < α) (y : ℝ) : (fun x : ℕ ↦ (#{d ∈ Ioc 0 x |
    ∃ _ : Fact d.Prime, d % 8 = 7 ∧ N.Coprime d ∧ ∃ s, 1 / 2 + 9 * η ≤ re s ∧ |im s| ≤ y ∧
    entireL (quadTwist ξ d) s = 0} : ℝ)) =O[atTop] fun x ↦ (x : ℝ) ^ (1 - η + α / 2) := by
  obtain ⟨M, f, ψ, _, e, rfl⟩ := exists_isPrimitive_changeLevel_eq ξ
  obtain ⟨j, hp⟩ : ∃ j : Fin 2, ψ (-1) = -(-1) ^ j.1 := by simpa using! ψ.even_or_odd.symm
  obtain ⟨⟨K, hK⟩, ⟨C, hC⟩, c, c0, hc⟩ := three_lines_bound_of_LFunction_eq_zero j,
    sum_thetaTailIntegral_le j hα, @exists_pos_le_norm_gaussianMellin j
    (.Icc 2⁻¹ 1 ×ℂ .Icc (-y) y) (isCompact_Icc.reProdIm isCompact_Icc) (by grind [mem_reProdIm])
  refine .of_bound (2 * C * M ^ (1 - η + α / 2)) ((((tendsto_rpow_atTop hη).eventually_gt_atTop
    (K / c ^ 2)).natCast_atTop.and (Ioi_mem_atTop 0)).mono fun x ⟨hx, x0⟩ ↦ ?_)
  obtain ⟨T, T0, hT⟩ : ∃ T > 0, T ^ 2 = (M * x : ℝ) := ⟨√_, by simpa, sq_sqrt (by simp)⟩
  have hX : x ≤ T ^ 2 := by simp [succ_le_iff, *]
  rw [Real.norm_natCast, ← mul_le_mul_iff_left₀ (rpow_pos_of_pos T0 (2 * η)), ← nsmul_eq_mul,
    ← sum_const, sum_filter]
  refine .trans (sum_le_sum fun d hd ↦ ?_) ((sum_add_distrib.trans_le (add_le_add (hC T T0 x hX
    (ψ ·) (by simp)) (hC T T0 x hX _ (norm_mul_moebius_le_one ψ)))).trans_eq (by simp (disch :=
    bound) [mul_assoc, abs_of_nonneg, ← mul_rpow, ← hT, ← rpow_natCast_mul, ← rpow_add]; ring_nf))
  split <;> [obtain ⟨_, h8, co, s, s₀, s₁, z⟩ := ‹_›; positivity]
  contrapose! hx
  obtain ⟨h, r⟩ := co.of_dvd_left f, le_of_not_ge (entireL_ne_zero _ · z)
  have h1 ξ := quadTwist_ne_one ξ d (by omega) h
  simp [entireL, h1, show quadTwist (ψ.changeLevel f) d = (quadTwist ψ d).changeLevel (by gcongr) by
    simp [quadTwist, ← changeLevel_trans], LFunction_changeLevel,
    prod_euler_factor_ne_zero _ (by bound : s.re ≠ 0)] at z
  grw [hX, ← rpow_natCast_mul, le_div_comm₀, hc s ⟨⟨by bound, r⟩, abs_le.1 s₁⟩, hK hη _ (h1 ψ) (by
    simpa (disch := omega) [hp, legendreSym.at_neg_one, ↓χ₄_nat_three_mod_four] using
    quadTwist_apply ψ d (-1)) T0 (by simp [hT, mem_Ioc.1 hd])] <;> try bound
  -- reciprocity and `(2/d) = 1` give `(n/d) = (-d/n)`
  · have E {n : ℕ} (h : n ≠ 0) : quadTwist ψ d n = ψ n * J(-d | n) := by
      let ⟨k, m, hm, e⟩ := exists_eq_two_pow_mul_odd h
      simpa [hm.pos.ne', mul_left, pow_left, at_two, qrSign, mul_right', pow_right, mod_left (-d) 2,
        *, Int.odd_iff.1, jacobiSym.neg, to_jacobiSym, quadratic_reciprocity' hm, ← natCast_mod,
        odd_iff, (by omega : d % 2 = 1 ∧ d % 4 = 3)] using quadTwist_apply ψ d n
    simpa [thetaTailIntegral, gaussianTheta, E, mul_right_comm] using hx.le
  -- the twist of a primitive character by the Legendre symbol of a new prime is primitive
  clear * - e h h1
  have H B := (conductor_mul_dvd_lcm_conductor (quadTwist ψ d) B⁻¹).trans (Nat.lcm_dvd_mul ..)
  obtain := H (quadTwist 1 d), H (ψ.changeLevel ⟨d, rfl⟩), h1 1,
    (@quadTwist 1 1 d _).conductor_dvd_level, (quadTwist ψ d).conductor_dvd_level.antisymm
  simp_all [quadTwist, dvd_prime Fact.out, mul_comm, h.dvd_mul_left, eq_one_iff_conductor_eq_one,
    h.symm.dvd_mul_left, conductor_inv, h.mul_dvd_of_dvd_of_dvd, conductor_changeLevel, IsPrimitive]

end Density

theorem exists_twist_on_count_escape_slack {M : ℕ} [NeZero M] (S : Set ℕ)
    {η α β : ℝ} (y : ℝ) (hη : 0 < η) (hα : 0 < α) (hcut : 1 / 2 + 9 * η ≤ β)
    (hescape : CountEscape S (2 * η - α))
    (H : ∀ d : Primes, d.1 ∈ S → d.1 % 8 = 7 ∧ M.Coprime d) :
    ∃ d : Primes, d.1 ∈ S ∧ ∀ ξ s,
      β ≤ re s → |im s| ≤ y → entireL (@quadTwist M ξ d _) s ≠ 0 := by
  classical
  by_contra! hbad
  unfold CountEscape at hescape
  apply hescape
  rw [show 1 - (2 * η - α) / 2 = 1 - η + α / 2 by ring]
  have hsum : (fun x : ℕ => ∑ ξ : DirichletCharacter ℂ M,
      ((badPrimes ξ η y x).card : ℝ)) =O[atTop]
      fun x : ℕ => (x : ℝ) ^ (1 - η + α / 2) :=
    .fun_sum (s := ⊤) fun ξ _ => by
      simpa only [badPrimes] using zero_density_quadTwist_slack (ξ := ξ) hη hα y
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

theorem entireL_ne_zero_on_count_escape_slack {M : ℕ} [NeZero M] (S : Set ℕ)
    {η α β : ℝ} (hη : 0 < η) (hα : 0 < α) (hβ : 1 / 2 < β)
    (hcut : 1 / 2 + 9 * η ≤ β) (hescape : CountEscape S (2 * η - α))
    (h : ∀ d : Primes, d.1 ∈ S → (d.1 % 8 = 7 ∧ M.Coprime d) ∧
      ∀ᶠ x in atTop, primeError d M x ≤ x ^ (β - 1))
    (ρ : ℂ) (hρ : β < ρ.re) (χ : DirichletCharacter ℂ M) :
    entireL χ ρ ≠ 0 := by
  let ⟨d, e, hZ⟩ := exists_twist_on_count_escape_slack S |ρ.im| hη hα hcut hescape
    (fun d hd => (h d hd).1)
  use by_cases (entireL_ne_zero χ) (flip ?_ (((h d e).1.elim isPolar_primeError).landau (by bound)
    (le_total · 1 |>.rec ?_ ?_) (.mono (tendsto_exp_atTop (h d e).2) (by simp [exp_mul, mul_comm]))
    hρ)) <;> simp +contextual (maxDischargeDepth := 3) [le_of_lt, div_re,
    (tendsto_sub_mul_logDeriv_entireL _).1.2, *, normSq, entireL_ne_zero, (hβ.trans hρ).trans',
    ← cast_sum, tendsto_sub_mul_logDeriv_entireL, ne_of_apply_ne re, ne_of_gt]; bound

end RHDepDensitySlack83

#print axioms RHDepDensitySlack83.zero_density_quadTwist_slack
#print axioms RHDepDensitySlack83.exists_twist_on_count_escape_slack
#print axioms RHDepDensitySlack83.entireL_ne_zero_on_count_escape_slack

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHDepDensitySlack83.zero_density_quadTwist_slack,
        #[``three_lines_bound_of_LFunction_eq_zero, ``sum_thetaTailIntegral_le]),
      (``RHDepDensitySlack83.exists_twist_on_count_escape_slack,
        #[``RHDepDensitySlack83.zero_density_quadTwist_slack]),
      (``RHDepDensitySlack83.entireL_ne_zero_on_count_escape_slack,
        #[``RHDepDensitySlack83.exists_twist_on_count_escape_slack, ``isPolar_primeError])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN83 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN83 missing value"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN83 missing direct supplier: {n}"
  logInfo "RUN83_DENSITY_SLACK_DIRECT_GUARDS_OK"
