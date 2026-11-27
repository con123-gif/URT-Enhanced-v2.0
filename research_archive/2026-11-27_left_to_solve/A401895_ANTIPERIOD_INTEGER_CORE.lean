import Mathlib

/-!
Arithmetic core of a partial A401895 anti-period obstruction.
This file does not prove the original conjecture or the decimal-reversal bridge.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6 family).
Candidate only: no kernel verification is asserted before an actual pin run.
-/

namespace A401895AntiPeriod

lemma height_bound (B : ℤ) (hB : 100 ≤ B) :
    20 * (B + 1) ^ 2 < B ^ 3 := by
  have hx : 0 ≤ (B - 100) * B ^ 2 :=
    mul_nonneg (by omega) (sq_nonneg B)
  have hy := sq_nonneg (B - 1)
  nlinarith only [hx, hy, hB]

theorem no_affine_closure (B K q T : ℤ)
    (hB : 100 ≤ B) (hEven : Even B) (hK : 0 < K) (hKB : K < B)
    (hq : 0 ≤ q) (hqB : q < B) (hT : B ^ 3 ≤ T) :
    (20 * (B + 1) ^ 2 - 3 * K * (10 * q + B + 11)) * T ≠
      20 * (B + 1) ^ 2 - 30 * K * (B - q) := by
  intro hrel
  let E := 20 * (B + 1) ^ 2 - 3 * K * (10 * q + B + 11)
  let F := 20 * (B + 1) ^ 2 - 30 * K * (B - q)
  change E * T = F at hrel
  have hBpos : 0 < B := by omega
  have hProdPos : 0 < K * (B - q) := mul_pos hK (sub_pos.mpr hqB)
  have hKBprod : K * B < B * B := mul_lt_mul_of_pos_right hKB hBpos
  have hKq : 0 ≤ K * q := mul_nonneg hK.le hq
  have hProdLt : K * (B - q) < B ^ 2 := by
    nlinarith only [hKBprod, hKq]
  have hFU : F < 20 * (B + 1) ^ 2 := by
    dsimp only [F]
    nlinarith only [hProdPos]
  have hFL : -10 * B ^ 2 < F := by
    dsimp only [F]
    nlinarith only [hProdLt, hB]
  have hTH : 20 * (B + 1) ^ 2 < T := (height_bound B hB).trans_le hT
  have hTpos : 0 < T := by
    nlinarith only [hTH, sq_nonneg (B + 1)]
  have hTten : 10 * B ^ 2 < T := by
    nlinarith only [hTH, hB, sq_nonneg B]
  have hFT : F < T := hFU.trans hTH
  have hFmT : -T < F := by linarith only [hFL, hTten]
  have hE : E = 0 := by
    by_contra hn
    have he : E ≤ -1 ∨ 1 ≤ E := by omega
    rcases he with he | he
    · have hm := mul_le_mul_of_nonneg_right he hTpos.le
      nlinarith only [hm, hrel, hFmT]
    · have hm := mul_le_mul_of_nonneg_right he hTpos.le
      nlinarith only [hm, hrel, hFT]
  have hF : F = 0 := by simpa only [hE, zero_mul] using hrel.symm
  have hProd : (3 * K) * (20 * q - 9 * B + 11) = 0 := by
    dsimp only [E] at hE
    dsimp only [F] at hF
    nlinarith only [hE, hF]
  have hLin : 20 * q - 9 * B + 11 = 0 :=
    (mul_eq_zero.mp hProd).resolve_left (ne_of_gt (mul_pos (by norm_num) hK))
  obtain ⟨b, hb⟩ := hEven
  omega

theorem no_small_base_closure (K q T : ℤ) (hK : K = 7 ∨ K = 8)
    (hq : q = K - 1) (hT : 1000 ≤ T) :
    (20 * (10 + 1) ^ 2 - 3 * K * (10 * q + 10 + 11)) * T ≠
      20 * (10 + 1) ^ 2 - 30 * K * (10 - q) := by
  subst q
  rcases hK with rfl | rfl <;> norm_num <;> omega

end A401895AntiPeriod
