import OMAStatements.S_mo_319325

-- Source: Ludwig, MathOverflow319325, CC BY-SA4.0.
-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-- Alternating positive shapes have a common singular limit before normalization.

noncomputable section
open Filter Topology
open scoped BigOperators Matrix MatrixOrder

namespace OMA.MO319325Witness

def A : Matrix (Fin 2) (Fin 2) ℝ := !![-1, 0; 0, -2]
def S : Matrix (Fin 2) (Fin 2) ℝ := !![2, 1; 1, 2]
def Q : Matrix (Fin 2) (Fin 2) ℝ := !![5, 4; 4, 5]
def D : Matrix (Fin 2) (Fin 2) ℝ := !![2, 0; 0, 4]
def T : Matrix (Fin 2) (Fin 2) ℝ := !![10, 12; 12, 20]
def U : Matrix (Fin 2) (Fin 2) ℝ := !![2/3, -1/3; -1/3, 2/3]
def N : Matrix (Fin 2) (Fin 2) ℝ := !![4/3, 0; 0, 14/3]
def t (k : ℕ) : ℝ := (1 / 10 : ℝ) ^ k
def P (k : ℕ) : Matrix (Fin 2) (Fin 2) ℝ :=
  if k % 2 = 0 then (t k)^2 • 1 else (t k)^2 • Q
def X (k : ℕ) : Matrix (Fin 2) (Fin 2) ℝ :=
  if k % 2 = 0 then (t k)^2 • D else (t k)^2 • T

set_option maxHeartbeats 1000000 in
lemma posDef_two (a b c : ℝ) (ha : 0 < a) (hd : 0 < a*c-b^2) :
    ( !![a,b; b,c] : Matrix (Fin 2) (Fin 2) ℝ).PosDef := by
  apply Matrix.PosDef.of_dotProduct_mulVec_pos
  · unfold Matrix.IsHermitian
    ext i j
    fin_cases i <;> fin_cases j <;> simp
  · intro v hv
    have hne : v 0 ≠ 0 ∨ v 1 ≠ 0 := by
      by_contra hn
      push_neg at hn
      apply hv
      ext i
      fin_cases i <;> simp_all
    simp only [Matrix.mulVec, dotProduct, Fin.sum_univ_two, Pi.star_apply, Matrix.of_apply,
      star_trivial, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.cons_val_fin_one]
    by_cases hy : v 1 = 0
    · have hx : v 0 ≠ 0 := hne.resolve_right (not_not.mpr hy)
      have hp := mul_pos ha (sq_pos_of_ne_zero hx)
      simpa [hy, pow_two, mul_assoc, mul_comm, mul_left_comm] using hp
    · have hp := mul_pos hd (sq_pos_of_ne_zero hy)
      have hs := sq_nonneg (a * v 0 + b * v 1)
      have hid : a * (v 0 * (a*v 0+b*v 1) + v 1 * (b*v 0+c*v 1)) =
          (a*v 0+b*v 1)^2 + (a*c-b^2)*(v 1)^2 := by ring
      have hq : 0 < a * (v 0 * (a*v 0+b*v 1) + v 1 * (b*v 0+c*v 1)) := by
        rw [hid]
        linarith
      exact (mul_pos_iff_of_pos_left ha).mp hq

lemma S_pos : S.PosDef := posDef_two 2 1 2 (by norm_num) (by norm_num)
lemma Q_pos : Q.PosDef := posDef_two 5 4 5 (by norm_num) (by norm_num)
lemma D_pos : D.PosDef := posDef_two 2 0 4 (by norm_num) (by norm_num)
lemma T_pos : T.PosDef := posDef_two 10 12 20 (by norm_num) (by norm_num)

lemma S_square : S * S = Q := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [S,Q,Matrix.mul_apply,Fin.sum_univ_two]

lemma S_U : S * U = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [S,U,Matrix.mul_apply,Fin.sum_univ_two]

lemma U_T_U : U * T * U = N := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [U,T,N,Matrix.mul_apply,Fin.sum_univ_two]

lemma t_pos (k : ℕ) : 0 < t k := by unfold t; positivity

lemma P_pos (k : ℕ) : (P k).PosDef := by
  unfold P
  split_ifs
  · exact Matrix.PosDef.one.smul (pow_pos (t_pos k) 2)
  · exact Q_pos.smul (pow_pos (t_pos k) 2)

lemma X_pos (k : ℕ) : (X k).PosDef := by
  unfold X
  split_ifs
  · exact D_pos.smul (pow_pos (t_pos k) 2)
  · exact T_pos.smul (pow_pos (t_pos k) 2)

lemma stable : OMA.S_mo_319325.hurwitz A := by
  have heq : A.map Complex.ofReal = Matrix.diagonal (![-1,-2] : Fin 2 → ℂ) := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [A,Matrix.diagonal_apply]
  intro z hz
  rw [heq, spectrum_diagonal] at hz
  obtain ⟨i,rfl⟩ := hz
  fin_cases i <;> norm_num

lemma lyapunov (k : ℕ) : A * P k + P k * A.transpose = -(X k) := by
  unfold P X
  split_ifs
  all_goals
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [A,Q,D,T,Matrix.mul_apply,Matrix.vecMul,dotProduct,Matrix.transpose_apply,
        Fin.sum_univ_two,Matrix.smul_apply,smul_eq_mul]
    all_goals ring

lemma normalized_scale (s : ℝ) (hs : 0 < s)
    (H K V : Matrix (Fin 2) (Fin 2) ℝ) (hH : H.PosSemidef) (hHV : H*V=1) :
    OMA.S_mo_319325.normalized (s^2 • (H*H)) (s^2 • K) = V*K*V := by
  have hr : CFC.sqrt (s^2 • (H*H)) = s • H := by
    have hm : (s • H) * (s • H) = s^2 • (H*H) := by
      simp [Matrix.smul_mul,Matrix.mul_smul,smul_smul,pow_two]
    rw [← hm]
    exact CFC.sqrt_mul_self (s • H) (hH.smul hs.le).nonneg
  have hi : (s • H)⁻¹ = s⁻¹ • V := by
    apply Matrix.inv_eq_right_inv
    simp [Matrix.smul_mul,Matrix.mul_smul,smul_smul,hHV,hs.ne']
  unfold OMA.S_mo_319325.normalized
  rw [hr,hi]
  simp only [Matrix.smul_mul,Matrix.mul_smul,smul_smul]
  have hc : s⁻¹ * (s^2 * s⁻¹) = 1 := by field_simp [hs.ne']
  rw [hc,one_smul]

lemma normalized_sequence (k : ℕ) :
    OMA.S_mo_319325.normalized (P k) (X k) = if k % 2 = 0 then D else N := by
  unfold P X
  split_ifs
  · simpa using normalized_scale (t k) (t_pos k) 1 D 1 Matrix.PosSemidef.one (by simp)
  · rw [← S_square]
    simpa [U_T_U] using normalized_scale (t k) (t_pos k) S T U S_pos.posSemidef S_U

lemma t_limit : Tendsto t atTop (𝓝 0) := by
  exact tendsto_pow_atTop_nhds_zero_of_abs_lt_one (r := (1/10 : ℝ)) (by norm_num)

lemma scale_limit (M : Matrix (Fin 2) (Fin 2) ℝ) :
    Tendsto (fun k => (t k)^2 • M) atTop (𝓝 0) := by
  simpa using (t_limit.pow 2).smul (tendsto_const_nhds (x := M))

lemma P_limit : Tendsto P atTop (𝓝 0) := by
  exact (scale_limit 1).if' (scale_limit Q)

lemma X_limit : Tendsto X atTop (𝓝 0) := by
  exact (scale_limit D).if' (scale_limit T)

lemma no_limit : ¬ ∃ L : Matrix (Fin 2) (Fin 2) ℝ,
    Tendsto (fun k => OMA.S_mo_319325.normalized (P k) (X k)) atTop (𝓝 L) := by
  rintro ⟨L,hL⟩
  have hc : Continuous (fun M : Matrix (Fin 2) (Fin 2) ℝ => M 0 0) :=
    (continuous_apply 0).comp (continuous_apply 0)
  have he := (hc.tendsto L).comp hL
  have heven : Tendsto (fun k : ℕ => 2*k) atTop atTop := by
    apply tendsto_atTop.2
    intro b
    exact eventually_atTop.2 ⟨b,by intro k hk; omega⟩
  have hodd : Tendsto (fun k : ℕ => 2*k+1) atTop atTop := by
    apply tendsto_atTop.2
    intro b
    exact eventually_atTop.2 ⟨b,by intro k hk; omega⟩
  have h2 : Tendsto (fun _ : ℕ => (2:ℝ)) atTop (𝓝 (L 0 0)) := by
    simpa [Function.comp_def,normalized_sequence,Nat.mul_mod,D] using he.comp heven
  have h4 : Tendsto (fun _ : ℕ => (4/3:ℝ)) atTop (𝓝 (L 0 0)) := by
    simpa [Function.comp_def,normalized_sequence,Nat.mul_mod,Nat.add_mod,N] using he.comp hodd
  have hL2 : L 0 0 = 2 := tendsto_nhds_unique h2 tendsto_const_nhds
  have hL4 : L 0 0 = 4/3 := tendsto_nhds_unique h4 tendsto_const_nhds
  linarith

end OMA.MO319325Witness

theorem OMA.disproof : ¬ (type_of% @OMA.S_mo_319325.main) := by
  intro h
  exact OMA.MO319325Witness.no_limit
    (h 2 (by norm_num) OMA.MO319325Witness.A OMA.MO319325Witness.stable
      OMA.MO319325Witness.X OMA.MO319325Witness.P OMA.MO319325Witness.X_pos
      OMA.MO319325Witness.P_pos OMA.MO319325Witness.lyapunov 0 0
      Matrix.PosSemidef.zero Matrix.PosSemidef.zero (by simp)
      OMA.MO319325Witness.X_limit OMA.MO319325Witness.P_limit)
