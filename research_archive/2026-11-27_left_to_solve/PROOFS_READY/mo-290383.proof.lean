import OMAStatements.S_mo_290383

-- Source question: https://mathoverflow.net/questions/290383
-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Counterexample: the two by two identity matrix.

theorem OMA.disproof : ¬ (type_of% @OMA.S_mo_290383.main) := by
  intro h
  obtain ⟨P, Q, hP, hQ, hPr, hQr, hEq⟩ :=
    h 2 1 (1 : Matrix (Fin 2) (Fin 2) ℚ)
      (by intro i j; fin_cases i <;> fin_cases j <;> norm_num)
      (by simp)
  have hdetP : P.det = 0 := by
    by_contra hne
    have hr := Matrix.rank_of_det_ne_zero hne
    norm_num at hr
    omega
  have hdetQ : Q.det = 0 := by
    by_contra hne
    have hr := Matrix.rank_of_det_ne_zero hne
    norm_num at hr
    omega
  have h00 : P 0 0 = 1 + Q 0 0 := by
    have he := congrFun (congrFun hEq 0) 0
    simp at he
    linarith
  have h01 : P 0 1 = Q 0 1 := by
    have he := congrFun (congrFun hEq 0) 1
    simp at he
    linarith
  have h10 : P 1 0 = Q 1 0 := by
    have he := congrFun (congrFun hEq 1) 0
    simp at he
    linarith
  have h11 : P 1 1 = 1 + Q 1 1 := by
    have he := congrFun (congrFun hEq 1) 1
    simp at he
    linarith
  have hp : P 0 0 * P 1 1 - P 0 1 * P 1 0 = 0 := by
    simpa [Matrix.det_fin_two] using hdetP
  have hq : Q 0 0 * Q 1 1 - Q 0 1 * Q 1 0 = 0 := by
    simpa [Matrix.det_fin_two] using hdetQ
  rw [h00, h01, h10, h11] at hp
  have hq00 := hQ 0 0
  have hq11 := hQ 1 1
  nlinarith
