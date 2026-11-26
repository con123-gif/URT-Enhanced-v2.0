import Mathlib

/-!
Prepared scalar certificate for the compact prime-error normalization.

Primary source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact. Source declarations:
* New/Endgame/ShortAndEnough.lean, blob
  b99eea0689be372d84362c58272b705e104b6a3a, `Data.remainder_eq`;
* New/Main.lean, blob 198ed5bf26aa294898931e0649bc2b88f1389f65,
  `eventually_primeError_le_rpow`;
* New/Endgame/PrimeError.lean, blob
  63eb3d79d95ad815878e623b96f237240058c8e2.

This file checks only the exact scalar adapter after the native combinatorial
identity. It neither imports nor proves the compact RH theorem. PREPARED, not
compiled here: lean/lake/elan are unavailable. The native reduction commands
must be run in the pinned compact toolchain before any KERNEL-CHECKED status.
-/

namespace CompactRemainderNormalization

/-- Solve the exact native remainder identity only after its main terms have
cancelled. `T` is the number of thick places and `U` the number of tops. -/
theorem normalized_identity
    (rem a m T U Rx Rx1 R1 : ℝ)
    (ha : 0 < a) (hm : 0 < m) (hT : 0 < T)
    (hrem : rem = a * (T * (Rx - Rx1) + U * R1)) :
    Rx = m * rem / m / a / T + (Rx1 - U / T * R1) := by
  have ha0 : a ≠ 0 := ne_of_gt ha
  have hm0 : m ≠ 0 := ne_of_gt hm
  have hT0 : T ≠ 0 := ne_of_gt hT
  rw [hrem]
  field_simp [ha0, hm0, hT0]
  ring

/-- Division-free form of the whole local caller. Exact cancellation is used
before inequalities. This retains the star, second-scale, degree and density
premises as separate inputs. -/
theorem star_window_density
    (rem a m T U f phi L Rx Rx1 R1 e : ℝ)
    (ha : 0 ≤ a) (hm : 0 ≤ m) (hT : 0 ≤ T)
    (hphi : 0 ≤ phi) (hL : 0 ≤ L)
    (hrem : rem = a * (T * (Rx - Rx1) + U * R1))
    (hstar : m * rem ≤ f * a * L ^ 5)
    (hwindow : T * Rx1 - U * R1 ≤ T * e)
    (hf : f = phi * U)
    (hdensity : U ≤ T * L) :
    m * a * T * (Rx - e) ≤ phi * a * T * L ^ 6 := by
  have hU : 0 ≤ phi * a * L ^ 5 := by positivity
  have hdegree : f * a * L ^ 5 ≤ phi * a * T * L ^ 6 := by
    calc
      f * a * L ^ 5 = (phi * a * L ^ 5) * U := by rw [hf]; ring
      _ ≤ (phi * a * L ^ 5) * (T * L) :=
        mul_le_mul_of_nonneg_left hdensity hU
      _ = phi * a * T * L ^ 6 := by ring
  calc
    m * a * T * (Rx - e)
        ≤ m * rem := by
          rw [hrem]
          have hma : 0 ≤ m * a := mul_nonneg hm ha
          calc
            m * a * T * (Rx - e) =
                (m * a) * (T * Rx - T * e) := by ring
            _ ≤ (m * a) * (T * Rx - T * Rx1 + U * R1) :=
              mul_le_mul_of_nonneg_left (by linarith) hma
            _ = m * (a * (T * (Rx - Rx1) + U * R1)) := by ring
    _ ≤ f * a * L ^ 5 := hstar
    _ ≤ phi * a * T * L ^ 6 := hdegree

/-- With positive denominators, expose the human-readable quotient bound. -/
theorem quotient_bound
    (a m T phi L Rx e : ℝ)
    (ha : 0 < a) (hm : 0 < m) (hT : 0 < T)
    (h : m * a * T * (Rx - e) ≤ phi * a * T * L ^ 6) :
    Rx ≤ phi * L ^ 6 / m + e := by
  have haT : 0 < a * T := mul_pos ha hT
  have h' : a * T * (m * (Rx - e)) ≤ a * T * (phi * L ^ 6) := by
    convert h using 1 <;> ring
  have h'' : m * (Rx - e) ≤ phi * L ^ 6 :=
    (mul_le_mul_left haT).mp h'
  have h''' : Rx - e ≤ phi * L ^ 6 / m :=
    (le_div_iff₀ hm).2 (by simpa [mul_comm] using h'')
  linarith

-- Negative control: deleting the second-scale premise cannot bound `Rx`.
example : ¬ (∀ rem a m T U f phi L Rx Rx1 R1 e : ℝ,
    rem = a * (T * (Rx - Rx1) + U * R1) →
    m * rem ≤ f * a * L ^ 5 → f = phi * U → U ≤ T * L →
    m * a * T * (Rx - e) ≤ phi * a * T * L ^ 6) := by
  push_neg
  refine ⟨0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, ?_⟩
  norm_num

#print axioms normalized_identity
#print axioms star_window_density
#print axioms quotient_bound

end CompactRemainderNormalization

/-
Native replay queue in a workspace containing the compact source and the
verified reduction engines (do not uncomment in a Mathlib-only check):

  rh_scan Data.remainder_eq limit 2000
  rh_scan eventually_primeError_le_rpow limit 4000
  rh_prune CompactRemainderNormalization.normalized_identity
    as CompactRemainderNormalization.NormalizedIdentityPruned
  -- Apply rh_reduce/rh_auto at the exact D' caller and preserve any frontier:
  -- rh_reduce 3 using [Data.remainder_eq,
  --   CompactRemainderNormalization.normalized_identity]
  -- rh_auto_frontier 3

The original and reduced graphs, all open leaves, and #print axioms output
must be recorded before advancing PREPARED -> KERNEL-CHECKED.
-/
