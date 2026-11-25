import Development.AutomorphicArithmetic.MeanSquareBounds.PrimeSetTwoBounds
import Development.AutomorphicArithmetic.CharacterBoxes.PairGood
import Development.AutomorphicArithmetic.MeanSquareBounds.PairExists
import Development.AutomorphicArithmetic.MeanSquareBounds.Kappa4Loglog
import Development.AutomorphicArithmetic.MeanSquareBounds.IndDrop

import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open Finset Formalism.HermitianLattices.ZeroFreeRegionGL2 Formalism.HermitianLattices.Ext.LogarithmicIntegralBounds

/-!
RUN31 — lane 13 STRUCTURE, 25 November 2026. SOURCE-MATCHED human
reduction; native candidate PREPARED, NOT COMPILED. RH OPEN.

EDITOR BLOCK (one paragraph): For the actual pairEx call fix
tau=eps/2, X=Y^K, z=Y^(eps/5), z'=z(log Y)^2 and N0=8M
(M=1 for RH), with eps,K and N0 fixed before increasing Y.
Apply native stage1 and stage2 with eta=1/2, taking their common
eventual threshold and C=max(C1,C2). Each stage says its finite
prime set P is nonempty and every bad subset B has |B|<=|P|/2.
If every member were bad, set B=P: 0<|P|<=|P|/2, contradiction.
Select a good q from stage1 first, then use stage2 for THAT q
and select a good d. No filtered good-set construction, cardinal
partition or explicit positive-share lemma is needed. For
Y>=exp(2), z'>=2z; rows_of_mem gives all original congruences,
bounds and ordering. Eventually z>=2N0 and log q>z/2, so
q>=1+log q>N0. Increasing C only enlarges the log derivative
bound, since log Y>=0. Thus these SAME q,d satisfy the original
GoodQ/GoodD for every y in the same [Y,Y^K]. The native pairEx
proof then supplies PairGood verbatim (including coprimality,
primitive induction, all three nontrivial twist combinations,
kappa4 log derivative and the full complex zero boxes).
The full original PairEx interface is retained in pairEx_direct13.
For RH the previously prepared joint/cofinal wrapper permits
restricting to M=1; no new sparse-window intersection assumed.

This removes pair_share and its private share_of_bad/boxAll_mono
selection machinery from this caller. The generic X<=Y^K and
z' range are no longer parameters of the intermediate pair
existence theorem: actual caller uses X=Y^K and the lower z'
endpoint exactly. The stage2 call still needs its upper range
guard, trivially valid since K>=1, and all native analytic
requirements remain. The original pair_exists and pair_share
are retained as fallback and for any other consumers. This is
a local exact compression, not a new proof of stage1/stage2.
If P is empty or eta=1 the contradiction fails (e.g. empty
prime set or P={3} all bad). Both guards are essential.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; native paths under
src/Development/AutomorphicArithmetic/MeanSquareBounds:
pairEx.lean 0020840fcf9b97e9e6e834c591e8516b9875e003
PairExists.lean 7e63fdeda04264253733059bf951a4c1635cebaa
PairShare.lean 712579c16be75074705a2c5c00f69e2f5d835cf9
Stage1Succ.lean 79f79fe71e41f403a4d22e5b86540410748ac7c3
CharOf.lean 3eeed8077330efa249cde313d99d89a7c09d8ba6
RowsOfMem.lean f9d738eb0e0dce29b14633183dcafe3e0db5cb0d
PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8
CharacterBoxes/PairGood.lean 68d04b506355e999c0f6020ee066c4967c1e6939
ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc
Actual caller: supplyOfAdmOf -> winPairs -> QH.pairEx, as in
prior RUN30 and lane11 joint window. Source-visible original graph:
pairEx -> pair_exists -> pair_share -> stage1, stage2, share_of_bad;
pair_exists also uses rows_of_mem; pairEx uses kappa4, ind_drop,
pairEx_box and primitive reading. Overlay:
pairEx_direct13 -> pair_exists_canonical13 -> stage1, stage2,
select_of_half13, boxAll_raise13, rows_of_mem; all other pairEx
dependencies unchanged. Do not delete nodes from global elaborated
graph; types, values, axioms and pending nodes remain. Context cache:
pin, eps,K,N0,C1,C2,Y,q,z',X,d; no cross-host reuse. Backtrack to
original theorem if native candidate fails. No URT ranking needed.

Preflight: latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
(including mandatory engines and ten-page cap), SWARM, HANDOFF,
AGENTS, research state/log/protocol and continuity; live manuscript
7beedb2752d934a81d4c92b5a19c1c48362e0dc9. Latest peer commits
5991ed4b (joint window), 4510eb2b (parity), 0b0399c1 (curvature),
7b758b50 (normalized energy bad_share), a543f365 (far range) and
prior structure 90ea4293 (cofinal PairGood) inspected. This does
not duplicate the upstream bad_share energy inequality.
Latest upstream head observed 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a;
no revision mixing. Connector executed 41 exact source SHA, anchor
and guarded transformation assertions; all passed. No numerical
proxy for actual stage bounds. No Lean/Lake on local PATH.
Actual CI statuses read this run: 45577239749 pass, status blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc; 45576756833 pass,
status blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Only older engine/conditional half-strip results verified,
with axioms propext, Classical.choice, Quot.sound and 324 pending
in bounded root scan. New declaration not kernel checked or queued;
no new axiom evidence. Source copy below renames private helpers
and changes only pair_exists call and its now unnecessary bounds.
Post-write static inspection caught an import-order error (imports
must precede open); corrected in a follow-up repair commit, not a
second mathematical result. Still no native compile claim.

RESUME HERE: compile this actual pairEx replacement with pinned
toolchain and engine imports, inspect scan/prune/axiom output,
then substitute pairEx_direct13 into supplyOfAdmOf/WinPairs
or joint-window overlay. Reduce stage1/stage2 through their
common stage supplier; preserve meanSqK, count_bad and box_of_S.
Do not treat finite prime selection as proof of prime estimates.
HANDOFF TO: integration/editor, kernel, character boxes, audit.
-/

namespace QH

private theorem select_of_half13 {P : Finset ℕ} (hne : P.Nonempty) (p : ℕ → Prop)
    (hb : ∀ B ⊆ P, (∀ q ∈ B, ¬ p q) → (B.card : ℝ) ≤ (1 / 2 : ℝ) * P.card) :
    ∃ q ∈ P, p q := by
  classical
  by_cases h : ∃ q ∈ P, p q
  · exact h
  · exfalso
    have hn : ∀ q ∈ P, ¬ p q := fun q hq hp => h ⟨q, hq, hp⟩
    have hc := hb P (fun _ hq => hq) hn
    have hp : (0 : ℝ) < (P.card : ℝ) := by exact_mod_cast hne.card_pos
    linarith

private theorem boxAll_raise13 {Q C C' τ Y X : ℝ} {f : ℕ → ℂ} {M : ℕ}
    (hC : C ≤ C') (hY : 1 ≤ Y) (h : BoxAll Q C τ Y X f M) :
    BoxAll Q C' τ Y X f M := by
  intro N _ ψ hψ
  obtain ⟨h1, h2, h3⟩ := h N ψ hψ
  exact ⟨h1, le_trans h2 (mul_le_mul_of_nonneg_right hC (Real.log_nonneg hY)), h3⟩

theorem pair_exists_canonical13 :
    ∃ C : ℝ, 0 < C ∧ ∀ (ε K : ℝ) (N₀ : ℕ), 0 < ε → ε < 1 / 52 →
      1 ≤ K → 0 < N₀ → ∃ Y₀ : ℝ, ∀ Y ≥ Y₀,
      ∃ q d : ℕ, Rows (Y ^ (ε / 5)) (Y ^ (ε / 5) * Real.log Y ^ 2) q d ∧
        N₀ < q ∧ GoodQ N₀ C (ε / 2) Y (Y ^ K) (Y ^ (ε / 5)) q ∧
        GoodD N₀ C (ε / 2) Y (Y ^ K) (Y ^ (ε / 5))
          (Y ^ (ε / 5) * Real.log Y ^ 2) q d := by
  obtain ⟨C1, hC1, h1⟩ := stage1
  obtain ⟨C2, hC2, h2⟩ := stage2
  refine ⟨max C1 C2, lt_max_of_lt_left hC1, fun ε K N₀ hε hε52 hK hN => ?_⟩
  obtain ⟨Y1, H1⟩ := h1 ε (ε / 2) K (1 / 2) N₀ hε hε52 (by linarith) hK (by norm_num) hN
  obtain ⟨Y2, H2⟩ := h2 ε (ε / 2) K (1 / 2) N₀ hε hε52 (by linarith) hK (by norm_num) hN
  have hev : ∀ᶠ Y : ℝ in Filter.atTop, (2 * N₀ : ℝ) ≤ Y ^ (ε / 5) :=
    (tendsto_rpow_atTop (by positivity : 0 < ε / 5)).eventually_ge_atTop _
  obtain ⟨Y3, H3⟩ := Filter.eventually_atTop.1 hev
  refine ⟨max (max Y1 Y2) (max Y3 (Real.exp 2)), fun Y hY => ?_⟩
  have ha : Y1 ≤ Y := (le_max_left _ _).trans ((le_max_left _ _).trans hY)
  have hb : Y2 ≤ Y := (le_max_right _ _).trans ((le_max_left _ _).trans hY)
  have hc : Y3 ≤ Y := (le_max_left _ _).trans ((le_max_right _ _).trans hY)
  have he : Real.exp 2 ≤ Y := (le_max_right _ _).trans ((le_max_right _ _).trans hY)
  have hy : 0 < Y := (Real.exp_pos 2).trans_le he
  have hy1 : 1 ≤ Y := (Real.one_le_exp (by norm_num : (0 : ℝ) ≤ 2)).trans he
  have hl : 2 ≤ Real.log Y := (Real.le_log_iff_exp_le hy).2 he
  have hz : 0 < Y ^ (ε / 5) := Real.rpow_pos_of_pos hy _
  have hzz : 2 * Y ^ (ε / 5) ≤ Y ^ (ε / 5) * Real.log Y ^ 2 := by
    have hsq : 2 ≤ Real.log Y ^ 2 := by nlinarith
    nlinarith
  have hprod : 0 ≤ Y ^ (ε / 5) * Real.log Y ^ 2 := mul_nonneg hz.le (sq_nonneg _)
  have hK2 : 1 ≤ K ^ 2 := by nlinarith
  obtain ⟨hne1, hbad1⟩ := H1 Y ha
  obtain ⟨q, hq, hgq⟩ := select_of_half13 hne1 _ hbad1
  obtain ⟨hne2, hbad2⟩ := H2 Y hb (Y ^ (ε / 5) * Real.log Y ^ 2) le_rfl
    (le_mul_of_one_le_left hprod hK2) q hq
  obtain ⟨d, hd, hgd⟩ := select_of_half13 hne2 _ hbad2
  have hR := rows_of_mem _ _ q d hz hzz hq hd
  refine ⟨q, d, hR, ?_, ?_, ?_⟩
  · have hq0 : (0 : ℝ) < q := by exact_mod_cast hR.q_prime.pos
    have hqlo := hR.q_gt
    have hlogq := Real.log_le_sub_one_of_pos hq0
    have hthreshold := H3 Y hc
    have hnq : (N₀ : ℝ) < q := by linarith
    exact_mod_cast hnq
  · intro ξ
    exact boxAll_raise13 (le_max_left _ _) hy1 (hgq ξ)
  · intro ξ a ha'
    exact boxAll_raise13 (le_max_right _ _) hy1 (hgd ξ a ha')

theorem select_replay13 {P : Finset ℕ} (hne : P.Nonempty) (p : ℕ → Prop)
    (hb : ∀ B ⊆ P, (∀ q ∈ B, ¬ p q) → (B.card : ℝ) ≤ (1 / 2 : ℝ) * P.card) :
    ∃ q ∈ P, p q := by
  first
  | (rh_reduce 2 using [select_of_half13]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact select_of_half13 hne p hb

private theorem pairEx_lift13 {N L : ℕ} [NeZero L] (h : N ∣ L) (ξ : DirichletCharacter ℂ N) (n : ℕ) (hn : n.Coprime L) :
    DirichletCharacter.changeLevel h ξ (n : ZMod L) = ξ (n : ZMod N) := by
  have ha : IsCoprime (n : ℤ) (L : ℤ) := Nat.isCoprime_iff_coprime.mpr hn
  have key := DirichletCharacter.changeLevel_eq_cast_of_dvd' ξ h ha
  simpa using key

private theorem pairEx_box13 (M : ℕ) (hM : 0 < M) (C τ Y X z z' : ℝ) (q d : ℕ) (hR : Rows z z' q d) (hq : 8 * M < q)
    (hQ : GoodQ (8 * M) C τ Y X z q) (hD : GoodD (8 * M) C τ Y X z z' q d)
    (f : ℕ → ℂ) (ξ : DirichletCharacter ℂ (8 * M)) (hf : ∀ n : ℕ, n.Coprime (8 * M) → ξ (n : ZMod (8 * M)) = f n)
    (i j : Fin 2) (hij : i ≠ 0 ∨ j ≠ 0) (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N)
    (hI : Formalism.HC.An.Induces χ (UpperTheory.Top.tw f q d i j) (2 * M * q * d)) :
    Box (8 * M * Real.exp z * Real.exp z' ^ (j : ℕ)) C τ Y X χ := by
  have hq2 : q ≠ 2 := by
    intro h2
    have hm := hR.q_mod
    rw [h2] at hm
    norm_num at hm
  have hqN : ¬ q ∣ 8 * M := by
    intro hd
    have hle := Nat.le_of_dvd (by omega) hd
    omega
  have h8 : ∀ n : ℕ, n.Coprime (2 * M * q * d) → n.Coprime (8 * M) := by
    intro n hn
    have h2 : n.Coprime 2 := Nat.Coprime.coprime_dvd_right ⟨M * q * d, by ring⟩ hn
    have hM' : n.Coprime M := Nat.Coprime.coprime_dvd_right ⟨2 * q * d, by ring⟩ hn
    have h8' : n.Coprime 8 := by simpa using Nat.Coprime.pow_right 3 h2
    exact Nat.Coprime.mul_right h8' hM'
  have hlev : 2 * M * q * d ≠ 0 :=
    (Nat.mul_pos (Nat.mul_pos (Nat.mul_pos (by norm_num) hM) hR.q_prime.pos) hR.d_prime.pos).ne'
  obtain ⟨hprim, hval⟩ := hI
  fin_cases j
  · fin_cases i
    · simp at hij
    · have hInd : Ind χ (fun n ↦ ξ n * J q n) (2 * M * q * d) := by
        refine ⟨hprim, fun n hn => ?_⟩
        rw [hval n hn]
        simp [UpperTheory.Top.tw, J, hf n (h8 n hn)]
      have hInd' := ind_drop (8 * M) q (2 * M * q * d) ξ N χ (by omega) hR.q_prime hq2 hqN hlev hInd
      have hB := hQ ξ N χ hInd'
      refine (congrArg (fun Q => Box Q C τ Y X χ) ?_).mpr hB
      simp
  · have hInd : Ind χ (fun n ↦ ξ n * J q n ^ (i : ℕ) * J d n) (8 * M * q * d) := by
      refine ⟨hprim, fun n hn => ?_⟩
      have hn' : n.Coprime (2 * M * q * d) := Nat.Coprime.coprime_dvd_right ⟨4, by ring⟩ hn
      rw [hval n hn']
      simp [UpperTheory.Top.tw, J, hf n (h8 n hn')]
    have hB := hD ξ (i : ℕ) (Nat.lt_succ_iff.mp i.isLt) N χ hInd
    refine (congrArg (fun Q => Box Q C τ Y X χ) ?_).mpr hB
    simp [Real.exp_add, mul_assoc]

private theorem pairEx_g13 {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (h : χ ≠ 1) (y : ℝ) :
    Formalism.HC.An.gChi χ y = Gchi χ y := by
  unfold Formalism.HC.An.gChi
  rw [if_neg h]
  unfold Formalism.HC.An.sumLamChi Gchi
  congr 1
  apply Finset.sum_congr rfl
  intro n hn
  rw [Finset.mem_Icc] at hn
  have hn1 : (1 : ℝ) ≤ n := by exact_mod_cast hn.1
  have hfl : 0 < ⌊y⌋₊ := lt_of_lt_of_le Nat.zero_lt_one (le_trans hn.1 hn.2)
  have hy1 : 1 ≤ y := Nat.floor_pos.mp hfl
  have hny : (n : ℝ) ≤ y := le_trans (by exact_mod_cast hn.2) (Nat.floor_le (by linarith))
  have hnn : 0 ≤ y / n - 1 := by
    rw [sub_nonneg, le_div_iff₀ (by linarith)]
    linarith
  rw [max_eq_left hnn]

private theorem log_exp_product_bounds13 (M : ℕ) (hM : 0 < M) (ε Y : ℝ) (hε : 0 < ε)
    (hY : Real.exp (1 + Real.log (8 * M)) ≤ Y) (j : ℕ) (hj : j ≤ 1) :
    Y ^ (ε / 6) ≤ Real.log (8 * M * Real.exp (Y ^ (ε / 5)) * Real.exp (Y ^ (ε / 5) * Real.log Y ^ 2) ^ j) ∧
    Real.log (8 * M * Real.exp (Y ^ (ε / 5)) * Real.exp (Y ^ (ε / 5) * Real.log Y ^ 2) ^ j)
      ≤ 3 * Y ^ (ε / 5) * Real.log Y ^ 2 := by
  have hM1 : (1 : ℝ) ≤ M := by exact_mod_cast hM
  have hM8 : (1 : ℝ) ≤ 8 * M := by linarith
  have hlog8 : 0 ≤ Real.log (8 * M) := Real.log_nonneg hM8
  have hY1 : 1 ≤ Y := le_trans (Real.one_le_exp (by linarith)) hY
  have hYpos : 0 < Y := by linarith
  have hL : 1 + Real.log (8 * M) ≤ Real.log Y := (Real.le_log_iff_exp_le hYpos).mpr hY
  have hw1 : 1 ≤ Y ^ (ε / 5) := Real.one_le_rpow hY1 (by linarith)
  have h65 : Y ^ (ε / 6) ≤ Y ^ (ε / 5) := Real.rpow_le_rpow_of_exponent_le hY1 (by linarith)
  set w := Y ^ (ε / 5) with hw
  set L := Real.log Y with hLdef
  have hL1 : 1 ≤ L := by linarith
  have hL2 : L ≤ L ^ 2 := by nlinarith
  have hwL : L ^ 2 ≤ w * L ^ 2 := by nlinarith
  have hlogQ : Real.log (8 * M * Real.exp w * Real.exp (w * L ^ 2) ^ j)
      = Real.log (8 * M) + w + j * (w * L ^ 2) := by
    rw [← Real.exp_nat_mul, mul_assoc, ← Real.exp_add,
      Real.log_mul (ne_of_gt (by linarith)) (Real.exp_pos _).ne', Real.log_exp]
    ring
  have hj' : (j : ℝ) ≤ 1 := by exact_mod_cast hj
  have hj0 : (0 : ℝ) ≤ j := Nat.cast_nonneg j
  have hz0 : 0 ≤ w * L ^ 2 := by positivity
  rw [hlogQ]
  constructor
  · nlinarith
  · have a1 : w ≤ w * L ^ 2 := by nlinarith
    have a2 : (j : ℝ) * (w * L ^ 2) ≤ w * L ^ 2 := by nlinarith
    linarith

theorem pairEx_direct13 :
    UpperTheory.Top.PairEx := by
  intro M hM eps A heps heps' hA
  obtain ⟨C, hC, hpair⟩ := pair_exists_canonical13
  obtain ⟨Y₀, hY₀⟩ := hpair eps A (8 * M) heps heps' hA (by omega)
  obtain ⟨Y₁, hY₁⟩ := kappa4 eps 3 heps heps' (by norm_num)
  refine ⟨max (max Y₀ Y₁) (Real.exp (1 + Real.log (8 * M))), fun Y hY => ?_⟩
  have hYa : Y₀ ≤ Y := le_trans (le_trans (le_max_left _ _) (le_max_left _ _)) hY
  have hYb : Y₁ ≤ Y := le_trans (le_trans (le_max_right _ _) (le_max_left _ _)) hY
  have hYc : Real.exp (1 + Real.log (8 * M)) ≤ Y := le_trans (le_max_right _ _) hY
  have hM1 : (1 : ℝ) ≤ M := by exact_mod_cast hM
  have hlog8 : 0 ≤ Real.log (8 * M) := Real.log_nonneg (by linarith)
  have hY1 : 1 ≤ Y := le_trans (Real.one_le_exp (by linarith)) hYc
  obtain ⟨q, d, hR, hq, hQ, hD⟩ := hY₀ Y hYa
  have hq2 : q ≠ 2 := by
    intro h2
    have hm := hR.q_mod
    rw [h2] at hm
    norm_num at hm
  haveI : NeZero (8 * M) := ⟨by omega⟩
  have hM8 : M ∣ 8 * M := Dvd.intro_left 8 rfl
  refine ⟨q, d, ?_, ?_, ?_, ?_⟩
  · refine ⟨hR.q_prime, hR.q_mod, hR.q_gt, hR.q_le, hR.d_prime, hR.d_mod, hR.d_gt, hR.d_le, ?_, ?_⟩
    · exact Nat.dvd_of_mod_eq_zero (hR.d_class q hR.q_prime hq2 (Or.inr rfl))
    · intro p hp hp2 hpl
      exact Nat.dvd_of_mod_eq_zero (hR.d_class p hp hp2 (Or.inl hpl))
  · have hqM : ¬ q ∣ M := fun h => by
      have := Nat.le_of_dvd hM h
      omega
    have hdM : ¬ d ∣ M := fun h => by
      have := Nat.le_of_dvd hM h
      have := hR.q_lt_d
      omega
    exact Nat.Coprime.mul_right ((Nat.Prime.coprime_iff_not_dvd hR.q_prime).mpr hqM).symm
      ((Nat.Prime.coprime_iff_not_dvd hR.d_prime).mpr hdM).symm
  · intro ξ i j hij N _ χ hI y hy1 hy2
    have hB := pairEx_box13 M hM C (eps / 2) Y (Y ^ A) (Y ^ (eps / 5)) (Y ^ (eps / 5) * Real.log Y ^ 2) q d
      hR hq hQ hD (fun a ↦ ξ a) (DirichletCharacter.changeLevel hM8 ξ)
      (fun n hn => pairEx_lift13 hM8 ξ n hn) i j hij N χ hI
    obtain ⟨hgood, _, hG⟩ := hB
    have hne : χ ≠ 1 := hgood.1
    constructor
    · rw [pairEx_g13 χ hne]
      exact hG y ⟨hy1, hy2⟩
    · obtain ⟨hk1, hk2⟩ := log_exp_product_bounds13 M hM eps Y heps hYc (j : ℕ) (Nat.lt_succ_iff.mp j.isLt)
      have hk := hY₁ Y hYb _ N χ hk1 hk2 hgood
      have hlog : Real.log Y ≤ Real.log y := Real.log_le_log (by linarith) hy1
      exact le_trans hk (by linarith)
  · intro ρ hρ hρN i j hij N _ χ hI
    have hB := pairEx_box13 M hM C (eps / 2) Y (Y ^ A) (Y ^ (eps / 5)) (Y ^ (eps / 5) * Real.log Y ^ 2) q d
      hR hq hQ hD ρ.val (DirichletCharacter.changeLevel hρN ρ.χ)
      (fun n hn => pairEx_lift13 hρN ρ.χ n hn) i j hij N χ hI
    exact hB.1.2.2

end QH

rh_scan QH.pair_exists limit 2000
rh_scan QH.pair_exists_canonical13 limit 2000
rh_scan QH.pairEx_direct13 limit 2000
rh_prune QH.pair_exists_canonical13 as RH13CanonicalPairExistsPruned
rh_prune QH.pairEx_direct13 as RH13PairExDirectPruned
#print axioms QH.pair_exists_canonical13
#print axioms QH.pairEx_direct13
#print axioms QH.pairEx
