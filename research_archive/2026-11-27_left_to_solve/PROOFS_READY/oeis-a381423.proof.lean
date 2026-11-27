import OMAStatements.S_oeis_a381423

/-
 Portions through selector_spec are adapted from the public TrureTuring
 HermiteSignedMode module, commit1b672a9b9ddf56469cac348e77e27f078420eb6f.
 Those known coefficient/selector results are prior mathematics and are not
 claimed as a new resolution. The triangular cutoff and full fine-block,
 spacing, signed uniqueness and growth extension below is the present work.
 Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
 Original code license is Apache2.0; its full text is preserved below.
-/

/-
                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   APPENDIX: How to apply the Apache License to your work.

      To apply the Apache License to your work, attach the following
      boilerplate notice, with the fields enclosed by brackets "[]"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright 2026 The Omega Institute

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.


-/

namespace A381423Certificate

open OMA.S_oeis_a381423 Finset

private def fourth (j : ℕ) : ℕ := (j + 1) * (j + 2) * (j + 3) * (j + 4)
private def divisor (r : ℕ) : ℕ := 16 * (2 * r) * (2 * r - 1)
private def rises (n r : ℕ) : Prop := 4 * r ≤ n ∧ divisor r ≤ fourth (n - 4 * r)
private instance (n r : ℕ) : Decidable (rises n r) := inferInstanceAs (Decidable (_ ∧ _))
private def candidates (n : ℕ) := (range (n + 1)).filter (rises n)
private theorem zero_candidate (n : ℕ) : 0 ∈ candidates n := by
  simp [candidates, rises, divisor, fourth]
private def mode (n : ℕ) : ℕ := (candidates n).max' ⟨0, zero_candidate n⟩
private theorem mode_rises (n : ℕ) : rises n (mode n) :=
  (mem_filter.mp (max'_mem _ _)).2
private theorem le_mode {n r : ℕ} (h : rises n r) : r ≤ mode n := by
  apply le_max'
  exact mem_filter.mpr ⟨mem_range.mpr (by have := h.1; omega), h⟩

private theorem fourth_mono : Monotone fourth := by
  intro selector b h
  unfold fourth
  gcongr
private theorem divisor_mono : Monotone divisor := by
  intro selector b h
  unfold divisor
  gcongr
private theorem rises_lower {n r s : ℕ} (h : rises n r) (hs : s ≤ r) : rises n s := by
  refine ⟨by have := h.1; omega, ?_⟩
  exact (divisor_mono hs).trans (h.2.trans (fourth_mono (by omega)))
private theorem rises_next {n r : ℕ} (h : rises n r) : rises (n + 1) r :=
  ⟨by have := h.1; omega, h.2.trans (fourth_mono (by omega))⟩
private theorem rises_previous {n r : ℕ} (h : rises (n + 1) (r + 1)) : rises n r := by
  refine ⟨by have := h.1; omega, ?_⟩
  exact (divisor_mono (by omega : r ≤ r + 1)).trans
    (h.2.trans (fourth_mono (by omega)))
private theorem mode_step (n : ℕ) : mode n ≤ mode (n + 1) ∧ mode (n + 1) ≤ mode n + 1 := by
  refine ⟨le_mode (rises_next (mode_rises n)), ?_⟩
  cases h : mode (n + 1) with
  | zero => omega
  | succ r =>
    have hr := mode_rises (n + 1)
    rw [h] at hr
    have := le_mode (rises_previous hr)
    omega

private def weight (n r : ℕ) : ℚ :=
  2 ^ (n - 4 * r) / ((2 * r).factorial * (n - 4 * r).factorial)

private theorem weight_pos (n r : ℕ) : 0 < weight n r := by
  unfold weight
  positivity

private theorem adjacent (n r : ℕ) (h : 4 * (r + 1) ≤ n) :
    weight n (r + 1) * divisor (r + 1) = weight n r * fourth (n - 4 * (r + 1)) := by
  let j := n - 4 * (r + 1)
  have hj : n - 4 * r = j + 4 := by dsimp [j]; omega
  have hr : 2 * (r + 1) = 2 * r + 2 := by omega
  have hr' : 2 * r + 2 - 1 = 2 * r + 1 := by omega
  simp only [weight, divisor, fourth, hj, hr, hr']
  change (2 : ℚ)^j / (↑((2 * r + 2).factorial) * ↑(j.factorial)) *
      ↑(16 * (2 * r + 2) * (2 * r + 1)) =
    2^(j + 4) / (↑((2 * r).factorial) * ↑((j + 4).factorial)) *
      ↑((j + 1) * (j + 2) * (j + 3) * (j + 4))
  simp only [Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat, pow_add]
  have hrf : (↑((2 * r).factorial) : ℚ) ≠ 0 := by positivity
  have hjf : (↑(j.factorial) : ℚ) ≠ 0 := by positivity
  field_simp
  <;> ring

private theorem adjacent_le (n r : ℕ) (h : 4 * (r + 1) ≤ n) :
    weight n r ≤ weight n (r + 1) ↔ rises n (r + 1) := by
  have hd : (0 : ℚ) < divisor (r + 1) := by
    unfold divisor
    have : 0 < 2 * (r + 1) - 1 := by omega
    positivity
  have hw := weight_pos n r
  have he := adjacent n r h
  constructor
  · intro hh
    refine ⟨h, ?_⟩
    have hh' := mul_le_mul_of_nonneg_right hh hd.le
    rw [he] at hh'
    exact_mod_cast (by nlinarith : (divisor (r + 1) : ℚ) ≤ fourth (n - 4 * (r + 1)))
  · intro hh
    have hh' : (divisor (r + 1) : ℚ) ≤ fourth (n - 4 * (r + 1)) := by exact_mod_cast hh.2
    have hm := mul_le_mul_of_nonneg_left hh' hw.le
    nlinarith [he]

private theorem weight_le_mode (n r : ℕ) (hr : 4 * r ≤ n) : weight n r ≤ weight n (mode n) := by
  by_cases h : r ≤ mode n
  · have aux : ∀ k, k ≤ mode n → ∀ i, i ≤ k → weight n i ≤ weight n k := by
      intro k
      induction k with
      | zero =>
        intro hk i hi
        have : i = 0 := by omega
        subst i
        rfl
      | succ k ih =>
        intro hk i hi
        by_cases hik : i ≤ k
        · exact (ih (by omega) i hik).trans
            ((adjacent_le n k (by have := (mode_rises n).1; omega)).mpr
              (rises_lower (mode_rises n) hk))
        · have : i = k + 1 := by omega
          subst i
          rfl
    exact aux _ le_rfl r h
  · have aux : ∀ k, 4 * k ≤ n → mode n ≤ k → weight n k ≤ weight n (mode n) := by
      intro k
      induction k with
      | zero =>
        intro hk hm
        have : mode n = 0 := by omega
        rw [this]
      | succ k ih =>
        intro hk hm
        by_cases hkm : mode n ≤ k
        · have hnot : ¬ rises n (k + 1) := fun hh => by have := le_mode hh; omega
          have hlt : weight n (k + 1) < weight n k :=
            lt_of_not_ge (fun hh => hnot ((adjacent_le n k hk).mp hh))
          exact hlt.le.trans (ih (by omega) hkm)
        · have : mode n = k + 1 := by omega
          rw [this]
    exact aux r hr (by omega)

private theorem weight_lt_mode (n r : ℕ) (hr : 4 * r ≤ n) (hm : mode n < r) :
    weight n r < weight n (mode n) := by
  cases r with
  | zero => omega
  | succ r =>
    have hnot : ¬ rises n (r + 1) := fun hh => by have := le_mode hh; omega
    have hlt : weight n (r + 1) < weight n r :=
      lt_of_not_ge (fun hh => hnot ((adjacent_le n r hr).mp hh))
    exact hlt.trans_le (weight_le_mode n r (by omega))

private theorem positive_coefficient (n r : ℕ) (hr : 4 * r ≤ n) :
    signedCoeff n (n - 4 * r) = n.factorial * weight n r := by
  have hs : n - (n - 4 * r) = 4 * r := by omega
  have he : 4 * r/2 = 2 * r := by omega
  simp [signedCoeff, hs, he, show (4 * r)%2 = 0 by omega, show (n - 4 * r ≤ n) by omega, weight,
    show (-1 : ℚ)^(2 * r) = 1 by rw [pow_mul]; norm_num]
  <;> ring

private theorem coefficient_cases (n j : ℕ) : signedCoeff n j ≤ 0 ∨
    ∃ r, 4 * r ≤ n ∧ j = n - 4 * r ∧ signedCoeff n j = n.factorial * weight n r := by
  by_cases h : j ≤ n ∧ (n - j)%2 = 0
  · by_cases h4 : (n - j)%4 = 0
    · right
      let r := (n - j)/4
      have hr : n - j = 4 * r := by dsimp [r]; omega
      have hj : j = n - 4 * r := by omega
      exact ⟨r, by omega, hj, hj ▸ positive_coefficient n r (by omega)⟩
    · left
      have he : (n - j)/2 = 2 * ((n - j)/4) + 1 := by omega
      have hp : (-1 : ℚ)^((n - j)/2) = -1 := by
        rw [he, pow_add, pow_mul]
        norm_num
      rw [signedCoeff, if_pos h, hp]
      have : (0 : ℚ) < n.factorial := by positivity
      have : (0 : ℚ) < 2^j := by positivity
      have : (0 : ℚ) < ((n - j)/2).factorial * j.factorial := by positivity
      exact (div_neg_of_neg_of_pos (by nlinarith) this).le
  · left
    simp [signedCoeff, h]

/-- The smallest exponent maximizing the signed coefficient. -/
noncomputable def selector (n : ℕ) : ℕ := n - 4 * mode n

theorem polynomial_coeff (n j : ℕ) (hj : j ≤ n) :
    (physicistsHermite n).coeff j = signedCoeff n j := by
  classical
  simp only [physicistsHermite, Polynomial.finsetSum_coeff, Polynomial.coeff_monomial]
  by_cases h : j ≤ n ∧ (n - j)%2 = 0
  · rw [signedCoeff, if_pos h]
    have he : n - 2 * ((n - j)/2) = j := by omega
    rw [sum_eq_single ((n - j)/2)]
    · simp [he]
    · intro b hb hne
      have hn : 2 * b ≤ n := by have := mem_range.mp hb; omega
      have hh : n - 2 * b ≠ j := by omega
      simp [hh, Ne.symm hh]
    · intro hh
      exact (hh (mem_range.mpr (by omega))).elim
  · rw [signedCoeff, if_neg h]
    apply sum_eq_zero
    intro b hb
    have hn : 2 * b ≤ n := by have := mem_range.mp hb; omega
    have hh : n - 2 * b ≠ j := by
      intro he
      apply h
      constructor <;> omega
    simp [hh, Ne.symm hh]

private theorem selector_spec (n : ℕ) : IsSmallestMax n (selector n) := by
  have hm := (mode_rises n).1
  have ha : selector n ≤ n := Nat.sub_le _ _
  have hcoeff := positive_coefficient n (mode n) hm
  have hp : (0 : ℚ) < n.factorial * weight n (mode n) := by
    have := weight_pos n (mode n)
    positivity
  refine ⟨ha, ?_, ?_⟩
  · intro k hk
    rw [polynomial_coeff n k hk, polynomial_coeff n (selector n) ha]
    change signedCoeff n k ≤ signedCoeff n (n - 4 * mode n)
    rw [hcoeff]
    rcases coefficient_cases n k with h | ⟨r, hr, hj, hc⟩
    · exact h.trans hp.le
    · rw [hc]
      exact mul_le_mul_of_nonneg_left (weight_le_mode n r hr) (by positivity)
  · intro k hk he
    rw [polynomial_coeff n k hk, polynomial_coeff n (selector n) ha] at he
    change signedCoeff n k = signedCoeff n (n - 4 * mode n) at he
    rw [hcoeff] at he
    rcases coefficient_cases n k with h | ⟨r, hr, hj, hc⟩
    · linarith
    · have hle : r ≤ mode n := by
        by_contra hh
        have ht := weight_lt_mode n r hr (by omega)
        have hnf : (0 : ℚ) < n.factorial := by positivity
        rw [hc] at he
        nlinarith
      dsimp [selector]
      omega



theorem two_choose (j : ℕ) : 2 * j.choose 2 = j * (j - 1) := by
  rw [Nat.choose_two_right]
  exact Nat.mul_div_cancel' (Nat.even_mul_pred_self j).two_dvd

theorem cutoff_iff (n j : ℕ) : j ≤ cutoff n ↔ j.choose 2 ≤ n + 2 := by
  cases j with
  | zero => simp
  | succ j =>
    have ht := two_choose (j + 1)
    have hp : j + 1 - 1 = j := by omega
    rw [hp] at ht
    constructor
    · intro h
      have hs : 2 * j + 1 ≤ Nat.sqrt (8 * n + 17) := by
        unfold cutoff at h
        omega
      have hsq := Nat.le_sqrt.mp hs
      nlinarith
    · intro h
      have hsq : (2 * j + 1) * (2 * j + 1) ≤ 8 * n + 17 := by nlinarith
      have hs := Nat.le_sqrt.mpr hsq
      unfold cutoff
      omega

theorem fourth_decision (j r : ℕ) :
    (j + 4 * r + 2 < (j + 4).choose 2 → divisor r < fourth j) ∧
    ((j + 4).choose 2 ≤ j + 4 * r + 2 → fourth j < divisor r) := by
  have hc := two_choose (j + 4)
  have hj : j + 4 - 1 = j + 3 := by omega
  rw [hj] at hc
  by_cases hr : r = 0
  · subst r
    have ht : j + 2 < (j + 4).choose 2 := by nlinarith
    constructor
    · intro h
      simp only [divisor, Nat.mul_zero, Nat.zero_mul]
      unfold fourth
      positivity
    · intro h
      omega
  have hr1 : 1 ≤ 2 * r := by omega
  let A : ℤ := (j : ℤ)^2 + 5 * j + 5
  let B : ℤ := 8 * r - 2
  have hj0 : (0 : ℤ) ≤ j := by positivity
  have hrz : (1 : ℤ) ≤ r := by exact_mod_cast (show 1 ≤ r by omega)
  have ha : 5 ≤ A := by
    dsimp [A]
    nlinarith [sq_nonneg (j : ℤ)]
  have hb : 6 ≤ B := by dsimp [B]; omega
  have hcz : (2 : ℤ) * ((j + 4).choose 2 : ℤ) =
      ((j : ℤ) + 4) * ((j : ℤ) + 3) := by exact_mod_cast hc
  have hid : (fourth j : ℤ) - (divisor r : ℤ) = A^2 + 3 - B^2 := by
    simp only [fourth, divisor, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat,
      Nat.cast_sub hr1, Nat.cast_one]
    dsimp [A, B]
    ring
  constructor
  · intro h
    have hz : (j : ℤ) + 4 * r + 2 < ((j + 4).choose 2 : ℤ) := by exact_mod_cast h
    have hab : 1 ≤ A - B := by dsimp [A, B]; nlinarith
    have hm : 0 ≤ (A - B - 1) * (A + B) :=
      mul_nonneg (by omega) (by omega)
    have hh : (divisor r : ℤ) < (fourth j : ℤ) := by nlinarith
    exact_mod_cast hh
  · intro h
    have hz : ((j + 4).choose 2 : ℤ) ≤ (j : ℤ) + 4 * r + 2 := by exact_mod_cast h
    have hba : 1 ≤ B - A := by dsimp [A, B]; nlinarith
    have hm : 0 ≤ (B - A - 1) * (A + B) :=
      mul_nonneg (by omega) (by omega)
    have hh : (fourth j : ℤ) < (divisor r : ℤ) := by nlinarith
    exact_mod_cast hh

theorem rises_triangle {n r : ℕ} (hr : 4 * r ≤ n) :
    rises n r ↔ n + 2 < (n - 4 * r + 4).choose 2 := by
  let j := n - 4 * r
  have hn : n = j + 4 * r := by dsimp [j]; omega
  have hd := fourth_decision j r
  change rises n r ↔ n + 2 < (j + 4).choose 2
  constructor
  · intro h
    by_contra hnot
    have hh : (j + 4).choose 2 ≤ j + 4 * r + 2 := by omega
    have hbad := hd.2 hh
    have hgood : divisor r ≤ fourth j := h.2
    omega
  · intro h
    refine ⟨hr, ?_⟩
    have hh : j + 4 * r + 2 < (j + 4).choose 2 := by omega
    exact (hd.1 hh).le


theorem cutoff_residue (n : ℕ) : n % 4 ≤ cutoff n := by
  have h2 : 2 ≤ cutoff n := (cutoff_iff n 2).mpr (by norm_num)
  by_cases hn : n = 0
  · simp [hn]
  · have h3 : 3 ≤ cutoff n := (cutoff_iff n 3).mpr (by norm_num; omega)
    omega

theorem selector_window (n : ℕ) :
    selector n ≤ cutoff n ∧ cutoff n < selector n + 4 ∧
      selector n % 4 = n % 4 := by
  have hm := (mode_rises n).1
  have hs : selector n ≤ n := (selector_spec n).1
  have hn : n = selector n + 4 * mode n := by dsimp [selector]; omega
  have hu : cutoff n < selector n + 4 := by
    have ht := (rises_triangle hm).mp (mode_rises n)
    change n + 2 < (selector n + 4).choose 2 at ht
    have hnot : ¬ selector n + 4 ≤ cutoff n := by
      intro h
      have hh := (cutoff_iff n (selector n + 4)).mp h
      omega
    omega
  have hl : selector n ≤ cutoff n := by
    by_cases hj : 4 ≤ selector n
    · have hnext : 4 * (mode n + 1) ≤ n := by omega
      have hnot : ¬ rises n (mode n + 1) := by
        intro h
        have hh := le_mode h
        omega
      have he : n - 4 * (mode n + 1) + 4 = selector n := by
        dsimp [selector]
        omega
      apply (cutoff_iff n (selector n)).mpr
      by_contra hbad
      apply hnot
      apply (rises_triangle hnext).mpr
      rw [he]
      omega
    · by_cases hn3 : 3 ≤ n
      · have h3 : 3 ≤ cutoff n := (cutoff_iff n 3).mpr (by norm_num; omega)
        omega
      · have h2 : 2 ≤ cutoff n := (cutoff_iff n 2).mpr (by norm_num)
        omega
  exact ⟨hl, hu, by omega⟩

theorem selector_formula (n : ℕ) : selector n = modeFormula n := by
  have hw := selector_window n
  have hr := cutoff_residue n
  unfold modeFormula
  omega

theorem source_a_spec (n : ℕ) : IsSmallestMax n (a n) := by
  exact Nat.sInf_mem (s := {j : ℕ | IsSmallestMax n j}) ⟨selector n, selector_spec n⟩

theorem source_a_eq_selector (n : ℕ) : a n = selector n := by
  have ha := source_a_spec n
  have hs := selector_spec n
  have h1 := hs.2.1 (a n) ha.1
  have h2 := ha.2.1 (selector n) hs.1
  have he : (physicistsHermite n).coeff (a n) =
      (physicistsHermite n).coeff (selector n) := le_antisymm h1 h2
  exact le_antisymm (ha.2.2 (selector n) hs.1 he.symm) (hs.2.2 (a n) ha.1 he)

theorem source_formula (n : ℕ) : a n = modeFormula n := by
  rw [source_a_eq_selector, selector_formula]

private theorem adjacent_strict (n r : ℕ) (h : rises n (r + 1)) :
    weight n r < weight n (r + 1) := by
  let j := n - 4 * (r + 1)
  have hn : n = j + 4 * (r + 1) := by dsimp [j]; have := h.1; omega
  have ht := (rises_triangle h.1).mp h
  change n + 2 < (j + 4).choose 2 at ht
  have htri : j + 4 * (r + 1) + 2 < (j + 4).choose 2 := by omega
  have hstrict : divisor (r + 1) < fourth j :=
    (fourth_decision j (r + 1)).1 htri
  have hd : (0 : ℚ) < divisor (r + 1) := by
    unfold divisor
    have : 0 < 2 * (r + 1) - 1 := by omega
    positivity
  have hcast : (divisor (r + 1) : ℚ) < fourth j := by exact_mod_cast hstrict
  have hh := mul_lt_mul_of_pos_left hcast (weight_pos n r)
  have he := adjacent n r h.1
  dsimp [j] at hh
  have hm : weight n r * (divisor (r + 1) : ℚ) <
      weight n (r + 1) * (divisor (r + 1) : ℚ) := by nlinarith
  by_contra hbad
  have hle : weight n (r + 1) ≤ weight n r := le_of_not_gt hbad
  exact (not_lt_of_ge (mul_le_mul_of_nonneg_right hle hd.le)) hm

private theorem weight_strict_of_ne (n r : ℕ) (hr : 4 * r ≤ n) (hne : r ≠ mode n) :
    weight n r < weight n (mode n) := by
  rcases lt_or_gt_of_ne hne with h | h
  · have hh := rises_lower (mode_rises n) (show r + 1 ≤ mode n by omega)
    exact (adjacent_strict n r hh).trans_le (weight_le_mode n (r + 1) hh.1)
  · exact weight_lt_mode n r hr h

theorem selector_unique (n : ℕ) : IsUniqueMax n (selector n) := by
  have hm := (mode_rises n).1
  have ha := (selector_spec n).1
  have hc := positive_coefficient n (mode n) hm
  have hp : (0 : ℚ) < n.factorial * weight n (mode n) := by
    have := weight_pos n (mode n)
    positivity
  refine ⟨ha, ?_⟩
  intro k hk hne
  rw [polynomial_coeff n k hk, polynomial_coeff n (selector n) ha]
  change signedCoeff n k < signedCoeff n (n - 4 * mode n)
  rw [hc]
  rcases coefficient_cases n k with h | ⟨r, hr, hj, hcoeff⟩
  · exact h.trans_lt hp
  · have hrne : r ≠ mode n := by
      intro he
      apply hne
      simpa [he, selector] using hj
    rw [hcoeff]
    exact mul_lt_mul_of_pos_left (weight_strict_of_ne n r hr hrne) (by positivity)

theorem source_unique (n : ℕ) : IsUniqueMax n (a n) := by
  rw [source_a_eq_selector]
  exact selector_unique n

theorem source_difference (n : ℕ) :
    (a (n + 1) : ℤ) - (a n : ℤ) = 1 ∨ (a (n + 1) : ℤ) - (a n : ℤ) = -3 := by
  rw [source_a_eq_selector (n + 1), source_a_eq_selector n]
  have hs := mode_step n
  have hm := (mode_rises n).1
  have hn := (mode_rises (n + 1)).1
  have hc : mode (n + 1) = mode n ∨ mode (n + 1) = mode n + 1 := by omega
  dsimp [selector]
  rcases hc with h | h
  · left; omega
  · right; omega


theorem choose_two_succ (q : ℕ) : (q + 1).choose 2 = q.choose 2 + q := by
  rw [Nat.choose_succ_succ]
  simp [add_comm]

theorem choose_two_ge_six {q : ℕ} (hq : 4 ≤ q) : 6 ≤ q.choose 2 := by
  have ht := two_choose q
  have hp : 12 ≤ q * (q - 1) := by
    have hh := Nat.mul_le_mul hq (show 3 ≤ q - 1 by omega)
    norm_num at hh
    exact hh
  omega

theorem start_eq {q : ℕ} (hq : 4 ≤ q) :
    q.choose 2 = intervalStart q + 2 := by
  have ht := choose_two_ge_six hq
  unfold intervalStart
  omega

theorem start_succ {q : ℕ} (hq : 4 ≤ q) :
    intervalStart (q + 1) = intervalStart q + q := by
  have h0 := start_eq hq
  have h1 := start_eq (show 4 ≤ q + 1 by omega)
  have hc := choose_two_succ q
  omega

theorem cutoff_interval (n q : ℕ) (hq : 4 ≤ q) :
    cutoff n = q ↔ intervalStart q ≤ n ∧ n < intervalStart q + q := by
  have h0 := start_eq hq
  have hc := choose_two_succ q
  constructor
  · intro h
    have hl := (cutoff_iff n q).mp (by omega)
    have hu : n + 2 < (q + 1).choose 2 := by
      by_contra hbad
      have hh := (cutoff_iff n (q + 1)).mpr (by omega)
      omega
    omega
  · rintro ⟨hl, hu⟩
    have hle := (cutoff_iff n q).mpr (by omega)
    have hlt : cutoff n < q + 1 := by
      by_contra hbad
      have hh := (cutoff_iff n (q + 1)).mp (by omega)
      omega
    omega

theorem offset_spec (q : ℕ) : intervalOffset q < 4 ∧
    (intervalStart q + intervalOffset q) % 4 = q % 4 := by
  unfold intervalOffset
  omega

theorem offset_bound (q : ℕ) (hq : 4 ≤ q) : intervalOffset q ≤ q - 2 := by
  by_cases h : q = 4
  · subst q
    decide
  · have hh := (offset_spec q).1
    omega

theorem flat_drop (n q : ℕ) (h0 : cutoff n = q) (h1 : cutoff (n + 1) = q) :
    isDrop n ↔ n % 4 = q % 4 := by
  have hr0 := cutoff_residue n
  have hr1 := cutoff_residue (n + 1)
  simp only [isDrop, source_formula, modeFormula, h0, h1]
  rw [h0] at hr0
  rw [h1] at hr1
  omega

theorem rise_no_drop (n q : ℕ) (h0 : cutoff n = q)
    (h1 : cutoff (n + 1) = q + 1) : ¬ isDrop n := by
  have hr0 := cutoff_residue n
  have hr1 := cutoff_residue (n + 1)
  simp only [isDrop, source_formula, modeFormula, h0, h1]
  rw [h0] at hr0
  rw [h1] at hr1
  omega

theorem slab_drop (n q : ℕ) (hq : 4 ≤ q)
    (hn : intervalStart q ≤ n ∧ n < intervalStart q + q) :
    isDrop n ↔ n + 1 < intervalStart q + q ∧ n % 4 = q % 4 := by
  have h0 := (cutoff_interval n q hq).mpr hn
  by_cases hf : n + 1 < intervalStart q + q
  · have h1 := (cutoff_interval (n + 1) q hq).mpr (by omega)
    rw [flat_drop n q h0 h1]
    simp [hf]
  · have hs := start_succ hq
    have h1 := (cutoff_interval (n + 1) (q + 1) (by omega)).mpr (by omega)
    have hnot := rise_no_drop n q h0 h1
    constructor
    · intro h
      exact (hnot h).elim
    · intro h
      exact (hf h.1).elim

theorem initial_source (n : ℕ) (hn : n ≤ 4) : a n = n := by
  rw [source_a_eq_selector]
  have hw := selector_window n
  have hs := (selector_spec n).1
  have hl : n ≤ cutoff n := (cutoff_iff n n).mpr (by
    interval_cases n <;> norm_num [Nat.choose_two_right])
  omega

theorem no_drop_small (n : ℕ) (hn : n < 4) : ¬ isDrop n := by
  have h0 := initial_source n (by omega)
  have h1 := initial_source (n + 1) (by omega)
  unfold isDrop
  rw [h0, h1]
  omega

theorem drop_characterization (n : ℕ) : isDrop n ↔ ∃ q : ℕ, 4 ≤ q ∧
    ∃ r : ℕ, r ≤ fourCount q ∧ n = fiveEnd q + 4 * r := by
  constructor
  · intro hd
    have hn4 : 4 ≤ n := by
      by_contra hbad
      exact no_drop_small n (by omega) hd
    let q := cutoff n
    have hq : 4 ≤ q := (cutoff_iff n 4).mpr (by
      norm_num [Nat.choose_two_right]
      omega)
    have hn := (cutoff_interval n q hq).mp rfl
    have hstep := (slab_drop n q hq hn).mp hd
    have ho := offset_spec q
    have hob := offset_bound q hq
    have he : fiveEnd q ≤ n := by unfold fiveEnd; omega
    let r := (n - fiveEnd q) / 4
    have hr : n = fiveEnd q + 4 * r := by
      dsimp [r]
      unfold fiveEnd at *
      omega
    refine ⟨q, hq, r, ?_, hr⟩
    unfold fourCount
    unfold fiveEnd at hr
    omega
  · rintro ⟨q, hq, r, hr, rfl⟩
    have ho := offset_spec q
    have hob := offset_bound q hq
    have hn : intervalStart q ≤ fiveEnd q + 4 * r ∧
        fiveEnd q + 4 * r < intervalStart q + q := by
      unfold fourCount at hr
      unfold fiveEnd
      omega
    apply (slab_drop (fiveEnd q + 4 * r) q hq hn).mpr
    unfold fourCount at hr
    unfold fiveEnd
    omega

theorem five_end_succ (q : ℕ) (hq : 4 ≤ q) :
    fiveEnd (q + 1) = fiveEnd q + 4 * fourCount q + 5 := by
  have hn := start_succ hq
  have h0 := offset_spec q
  have h1 := offset_spec (q + 1)
  have hb := offset_bound q hq
  unfold fiveEnd fourCount
  omega

theorem start_shift_eight (q : ℕ) (hq : 4 ≤ q) :
    intervalStart (q + 8) = intervalStart q + 8 * q + 28 := by
  have h0 := two_choose q
  have h1 := two_choose (q + 8)
  have hs0 := start_eq hq
  have hs1 := start_eq (show 4 ≤ q + 8 by omega)
  have hp : q + 8 - 1 = q + 7 := by omega
  rw [hp] at h1
  have hpred : q - 1 + 1 = q := by omega
  have hm := congrArg (fun k : ℕ => q * k) hpred
  nlinarith

theorem offset_shift_eight (q : ℕ) (hq : 4 ≤ q) :
    intervalOffset (q + 8) = intervalOffset q := by
  have hn := start_shift_eight q hq
  unfold intervalOffset
  rw [hn]
  omega

theorem five_end_shift_eight (q : ℕ) (hq : 4 ≤ q) :
    fiveEnd (q + 8) = fiveEnd q + 8 * q + 28 := by
  unfold fiveEnd
  rw [start_shift_eight q hq, offset_shift_eight q hq]
  omega

theorem four_count_shift_eight (q : ℕ) (hq : 4 ≤ q) :
    fourCount (q + 8) = fourCount q + 2 := by
  have hb := offset_bound q hq
  unfold fourCount
  rw [offset_shift_eight q hq]
  omega

theorem source_growth (n : ℕ) : Nat.sqrt (2 * n) ≤ a n + 3 ∧
    a n ≤ Nat.sqrt (2 * n) + 2 := by
  let s := Nat.sqrt (2 * n)
  have hs : s * s ≤ 2 * n := Nat.sqrt_le (2 * n)
  have hs1 : 2 * n < (s + 1) * (s + 1) := Nat.lt_succ_sqrt (2 * n)
  have ht := two_choose s
  have hp := Nat.mul_le_mul_left s (Nat.sub_le s 1)
  have hlow : s ≤ cutoff n := (cutoff_iff n s).mpr (by nlinarith)
  have hqt := (cutoff_iff n (cutoff n)).mp le_rfl
  have hqd := two_choose (cutoff n)
  have hupp : cutoff n ≤ s + 2 := by
    by_contra hbad
    have hm : (s + 3) * (s + 2) ≤ cutoff n * (cutoff n - 1) :=
      Nat.mul_le_mul (by omega) (by omega)
    nlinarith
  rw [source_formula]
  have hr := cutoff_residue n
  unfold modeFormula
  change s ≤ cutoff n - (cutoff n - n % 4) % 4 + 3 ∧
    cutoff n - (cutoff n - n % 4) % 4 ≤ s + 2
  omega


theorem fullMain : type_of% @OMA.S_oeis_a381423.main := by
  refine ⟨?_, source_difference, drop_characterization, ?_, source_growth⟩
  · intro n
    exact ⟨source_unique n, source_formula n⟩
  · intro q hq
    exact ⟨five_end_succ q hq, five_end_shift_eight q hq, four_count_shift_eight q hq⟩

end A381423Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a381423.main := by
  exact A381423Certificate.fullMain
