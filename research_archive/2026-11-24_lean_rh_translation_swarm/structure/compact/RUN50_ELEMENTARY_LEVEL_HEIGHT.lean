import New.Endgame.LongForms

/-!
# Structure compact RUN50 — elementary factorial transport at Theorem A
26 November 2026. HUMAN SOURCE-MATCHED / PREPARED, not compiled.
Primary compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src.
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission migration 24da6755f91e9dfb7fac28f80bca36b255919247.
Credit Levent Alpöge, Luke Sernau, Claude and Anthropic collaborators.
Original 40e56bab026552e089d7afcfeff08d2defb9c005 RUN49 remains archived;
do not carry its old arithmetic overlays into this compact proof.

Read current mission including mandatory unified pipeline, SWARM_PROTOCOL,
HANDOFF_QUEUE, AGENTS, research state/log/protocol and continuity excerpts,
recent peer results 03751400 (C shared factorization), 05bb424d (C rank
completion), 5fb8da26f (B centered moment), e28fed80 (star one-sided H),
de382b26 (shared compact graph), 284991cd (fixed-modulus endpoint).
None of these is the A-level factorial supplier addressed here.

Actual source:
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
Mathlib/Analysis/SpecialFunctions/Log/Basic.lean at Mathlib pin (actual
source inspected: Real.log_le_sub_one_of_pos, log_div, log_mul).
Source roles, not elaborated edges:
root -> New.grh -> eventually_primeError_le_rpow -> star_inequality
 -> Data.exists_family_covolumeSq_le -> Data.short_forms
 -> Data.heightPerRow_le -> log_stirlingSeq'_antitone, log_stirlingSeq_formula.
Original proof uses log(a!) <= a log a - a + 1 + log(a)/2.

Replace this local use of Stirling's sequence by the elementary inequality
  log(a!) <= a log a - a + 1 + log a, a>=1.
Proof: F(n)=(n+1)log n-n+1. F(1)=log(1!)=0. For n>=1, use log t<=t-1
at t=n/(n+1), giving (n+1)log((n+1)/n)>=1. Consequently
  F(n+1)-F(n)-log(n+1)=(n+1)log((n+1)/n)-1>=0.
Induction gives the bound for every integer a>=1. No asymptotic limit,
Stirling sequence, pi constant, or new arithmetic assumption is required.
The n=0 case is excluded by the induction domain and native a>=1.

At the actual heightPerRow calculation let w=mean log nominalWeight and
G=log(g rootDisc/(2*pi)). The elementary bound changes only the error
term to 1+log a. The EXACT cancellation of m a (w+G) against a log N
is unchanged. Before scale comparison the surplus is
  #tops * [m(1+log a)+a(G+(15/2)log b)].
The same native budget fa(log b)^3 dominates this expression: the
previous scale proof used the identical monomials with a constant 1/2
on log a; removing that constant leaves the same scale exponents.
The last HasLogBound elaboration is explicitly pending. No claim of
machine-checked scale comparison. The proof does not eliminate the
level window, mean weight, local gains, or any automorphic inputs.

Candidate graph:
Data.exists_family_covolumeSq_le_elementary50
 -> Data.short_forms_elementary50 + Data.enough_forms
Data.short_forms_elementary50 -> Data.heightPerRow_le_elementary50
 -> elementary_log_factorial_upper -> Real.log_le_sub_one_of_pos.
All original A and A+B binders and conclusions preserved; the same
q,B,S,t,y,index and all conjugate bounds remain. C and all later
analytic steps are unchanged. This is a local explicit source-edge
substitution, not a claim the original Stirling dependencies vanish
from all root paths. Preserve original kernel graph and axiom evidence.

Tests actually executed in connector V8: retrieved pinned source, located
unique replacement anchors, checked three exact half-log uses, checked
reversibility of all three transformed declarations against original
source. Mathlib logarithm lemma signatures inspected. No numerical
simulation or URT benchmark: exact telescoping is the simpler method.
Local lean/lake absent. Actual compact graph CI run 45781154005 at
de382b26 returned RESOURCE_BLOCKED (returncode 1, wall 0.04s,
26 Nov 08:12:49 UTC), before build. Old shared job 45773743341 failed
Unicode import parser; historical 45577239749 and 45576756833 statuses
reconfirmed pass only on old toolchain. Neither checks this candidate.
New rh_scan/rh_prune/rh_reduce/rh_auto/frontier not run. No new kernel
closures, no actual speedup claimed. Do not duplicate the shared build.
No new axioms asserted; print axioms below for later replay.
No import of Main or New.Main. No call to the published RH theorem.

RESUME HERE: on a capable compact runner, lake env lean this file;
first verify elementary induction, then scale comparison and A, A+B
caller. If final scale tactic fails, explicitly bound the revised surplus
using the native Magnitudes instances, or keep the original native
Stirling path as fallback. Inspect actual role/axiom graph at A+B and
reverse reachability before declaring any global edge removed.
HANDOFF TO: shared kernel, integration, formal audit, human editor.
-/

open Finset Module Parameters Real Stirling Submodule LevelPlaces.LevelForm

lemma elementary_log_factorial_upper (n : ℕ) (hn : 1 ≤ n) :
    log (n.factorial : ℝ) ≤ (n : ℝ) * log n - n + (1 + log n) := by
  induction n with
  | zero => omega
  | succ n ih =>
    by_cases hz : n = 0
    · subst n
      norm_num
    have hn' : 1 ≤ n := by omega
    have hp : (0 : ℝ) < n := by exact_mod_cast Nat.pos_of_ne_zero hz
    have hs : (0 : ℝ) < (n : ℝ) + 1 := by positivity
    have hlog := Real.log_le_sub_one_of_pos (div_pos hp hs)
    rw [Real.log_div hp.ne' hs.ne'] at hlog
    have hm := mul_le_mul_of_nonneg_left hlog hs.le
    have hfrac : ((n : ℝ) + 1) * ((n : ℝ) / ((n : ℝ) + 1) - 1) = -1 := by
      field_simp [hs.ne'] <;> ring
    rw [hfrac] at hm
    have hind := ih hn'
    simp only [Nat.factorial_succ, Nat.cast_mul, Nat.cast_succ]
    rw [Real.log_mul (by positivity) (by positivity)]
    nlinarith only [hind, hm]

variable {P} (D : Data P)

lemma Data.heightPerRow_le_elementary50 : D.heightPerRow ≤ D.mainHeight - D.m * D.remainder + D.budget := by
  set w := (∑ τ, (D.nominalWeight τ).log) / D.f
  set G := (D.gProd * D.rootDisc / (2 * π)).log with hG
  have stirling : log D.a.factorial ≤ D.a * log D.a - D.a + (1 + log D.a) :=
    elementary_log_factorial_upper D.a (D.nat_le_of_hasLogBound : 1 ≤ D.a)
  have excess : D.jetSize D.a - D.mainAsk ≤ D.a * (w + G) + (1 + log D.a) := by
    simp [jetSize, mainAsk, hG, bigOmega, log_div, log_mul, (HasLogBound.pos D).ne']
    bound
  -- the left side is `logLevelTarget`
  have level : D.m * (w + G) - (G + 15 / 2 * D.logB) ≤
    log D.N := by grind [D.log_N_mem_window.1, logLevelTarget]
  calc D.heightPerRow = D.mainHeight - D.m * D.remainder + #_ *
      (D.m * (D.jetSize D.a - D.mainAsk) - D.a * log D.N) := by
        simp [heightPerRow, mainHeight, remainder]
        ring
    _ ≤ D.mainHeight - D.m * D.remainder + #D.tops * (D.m * (_ + (1 + log D.a)) -
        D.a * (_ - (G + _))) := by bound
    -- `m a (w + G)` cancels
    _ = _ + #D.tops * (D.m * (1 + log D.a) + D.a * (G + 15 / 2 * D.logB)) := by ring
    _ ≤ _ := add_le_add_right D.le_of_hasLogBound _

lemma Data.short_forms_elementary50 : ∃ q > (0 : ℚ), ∃ B, B = (q : ℂ) • D.projectedPoincare ∧ (∃ S ⊆
  D.integralRamified, span ℂ S = ⊤ ∧ ∀ φ ∈ S, ∀ s σ, (D.Θ 1 (B s φ)).normSqAt σ ≤ exp (D.mainHeight
  - D.m * D.remainder + D.logB * D.budget)) ∧ ∀ (t : Finset D.G) n (y : Fin n → _), (∀ i, y i ∈
  Set.image2 (B ·) t D.integralRamified) → D.IndexLe y (#t * finrank ℂ D.Column * D.budget) := by
  -- `q` divides out the gains, less the allowed losses
  obtain ⟨q, q0, e, v⟩ := exists_rat_log_eq_and_padic_norm_eq (D.nonsplitPrimes ∪ {D.N})
    (fun l ↦ ⌊D.allowedLoss l - ite (l ∈ D.nonsplitPrimes)
    (D.gain l) 0⌋) (by grind [N_prime]) (by grind [allowedLoss, Int.floor_zero])
  choose Ψ G S using D.seesaw.choose_spec
  refine ⟨q, q0, _, rfl, ⟨_, fun φ k l _ _ ↦ ⟨φ.1.2, k.1 l⟩, D.span_short_ramifiedColumns,
    fun φ k s σ ↦ (map_smul (D.projectedPoincare s) .. ▸ normSqAt_goodProjTranslate_le
    (S .. ▸ weylNormSq_Bmu_le (B := 2 * log q + D.budget)
    (G 1) (by simpa [two_mul, exp_add, exp_log, q0, sq] using k.2 σ ·) ·)).trans (by
    grw [e, heightPerRow_le_elementary50, Int.floor_le]
    simp [sub_mul, -mem_filter, -union_singleton]
    grw [sum_allowedLoss_mul_log_le]; ring; simpa using D.le_of_hasLogBound)⟩, fun t n y h ↦
    ⟨fun l ↦ #t * finrank ℂ D.Column * (_ * log l),
    fun U ↦ by grw [← mul_sum, sum_allowedLoss_mul_log_le], fun l _ ι ϑ c ↦
    (exists_indexDvd_Bmu_divisible (Int.ceil_lt_add_one _)).elim fun n a ↦ a.2.elim fun _ b ↦
    (IndexDvd.sup (N' := (integralForms ι).comap ((D.Θ ϑ).restrictScalars embValRing)) (f :=
    ((q : ℂ) • D.projectedPoincare · |>.restrictScalars embValRing)) (fun s ↦ b.1.comap
    (D.ramifiedColumns.subtype.restrictScalars _) le_rfl fun φ _ h ↦ congr($((D.Θ ϑ).map_smul ..) ∈
    integralForms ι).mpr (goodProjTranslate_mem_integralForms ι (fun g ↦ by
    erw [weylGauge_smul, congr($(S ..).1 g)]
    simpa [v, weylGauge_smul, ← Int.floor_neg] using (b.2 _ _ (G ϑ) c _ h φ.2).2 g) s)) t _ y
    fun k ↦ subset_span (.inl (Set.image2_subset_left (by exact fun _ ↦ (· l)) (h k)))).imp
    fun u ⟨k, h⟩ ↦ ⟨?_, h⟩⟩⟩
  · apply (Valuation.valuationSubring.integers _).le_of_dvd at k
    simp [norm_p_eq_inv, ← NNReal.coe_le_coe] at k
    grw [← k, ← le_log_iff_exp_le] <;> simp [NeZero.pos]
    linarith [mul_le_mul_of_nonneg_right a.1 (mul_nonneg (#t).cast_nonneg (log_natCast_nonneg l))]

lemma Data.exists_family_covolumeSq_le_elementary50 (D : Data P) : ∃ n, ∃ y : Fin n → _, LinearIndependent ℂ y ∧
    (1 - 4 / D.b ^ 2) * D.rowDim ≤ n ∧
  (∃ δ ≤ 5 * D.rowDim * log (1 + D.b ^ 2) * D.budget, D.IndexLe y δ) ∧ ∀ σ,
  covolumeSq (D.Θ 1 ∘ y) σ ≤ exp (n * (D.mainHeight - D.m * D.remainder + D.logB * D.budget)) := by
  obtain ⟨⟨q, q0, B, hB, ⟨S, hS, sp, size⟩, index⟩, -, -, t, ht, big⟩ :=
    D.short_forms_elementary50, D.enough_forms
  -- the family: a basis among the translates
  let Y := Set.image2 (B ·) t S
  obtain ⟨y, hy, -, i⟩ := exists_fun_fin_finrank_span_eq ℂ Y
  rw [(by simp [Y, ← Set.iUnion_image_left, span_iUnion₂, sp]
          simp [hB, range_smul, q0.ne'] : iSup _ = span ℂ Y)] at big
  -- index and length
  exact ⟨_, y, i, big, ⟨_, mul_le_mul_of_nonneg_right ht (HasLogBound.pos D).le, index t _ y
    (Set.image2_subset_left hS <| hy ·)⟩, fun σ ↦ covolumeSq_le
    (have ⟨s, _, φ, h, e⟩ := hy ·; by simpa [e] using size φ h s σ)⟩

#print axioms elementary_log_factorial_upper
#print axioms Data.heightPerRow_le_elementary50
#print axioms Data.short_forms_elementary50
#print axioms Data.exists_family_covolumeSq_le_elementary50
