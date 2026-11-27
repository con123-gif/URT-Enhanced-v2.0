import Mathlib

/-!
# Spectral radius after a rank-one perturbation of a stochastic matrix

Source: vansy, MathOverflow question 198816, March 2, 2015.
https://mathoverflow.net/questions/198816
Original question text: CC BY-SA 3.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.

"Diagonally dominant" is read in its usual row sense, with non-strict
dominance. Irreducibility uses Mathlib's nonnegative-matrix definition.
The spectral radius of a real matrix is taken over its complexification,
so nonreal eigenvalues are included. The entrywise perturbation below is
exactly P - (P * 1) * w^T, where 1 is the all-ones column vector.
-/

namespace OMA.S_mo_198816

open scoped BigOperators

def perturbation {n : ℕ} (P : Matrix (Fin n) (Fin n) ℝ) (w : Fin n → ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  fun i j => P i j - (∑ k, P i k) * w j

theorem main : ∀ n : ℕ, 0 < n → ∀ P : Matrix (Fin n) (Fin n) ℝ,
    P.IsIrreducible → (∀ j, ∑ i, P i j = 1) →
    (∀ i, ∑ j ∈ Finset.univ.erase i, |P i j| ≤ |P i i|) →
    ∀ w : Fin n → ℝ, (∀ i, 0 < w i) → (∑ i, w i = 1) →
      spectralRadius ℂ ((perturbation P w).map Complex.ofReal) < 1 := by
  sorry

end OMA.S_mo_198816


-- Source: vansy, MathOverflow198816, CC BY-SA3.0.
-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-- The scouting and combinatorics research lanes collaborated on this witness.

noncomputable section
open scoped BigOperators Matrix


namespace OMA.MO198816Witness

/-- Strictly positive perturbation of the lazy chain into a sink. -/
def P : Matrix (Fin 13) (Fin 13) ℝ := fun i j =>
  1 / 260000 + (if i = j then 1 / 2 else 0) +
    (if i.val = min (j.val + 1) 12 then 9999 / 20000 else 0)

/-- Positive rational probability vector, independently checked exactly. -/
def w : Fin 13 → ℝ := ![
  23752387458829635016670293383515686994166025996706977065830582668468726920864042040672519778262181/25958100355800129122330649876780178349305953872937189605380188819188196705754803895571031537000000,
  1/1000000,
  1/1000000,
  21445345340119620985292838611501406978148979874637295137358686462551901741481433801726398644603/6489525088950032280582662469195044587326488468234297401345047204797049176438700973892757884250000,
  1/1000000,
  1/1000000,
  1/1000000,
  1/1000000,
  1/1000000,
  1/1000000,
  1/1000000,
  1/1000000,
  2119671934606457620427961832319717925443838897192933987104117602981070295957778571652650453844037/25958100355800129122330649876780178349305953872937189605380188819188196705754803895571031537000000]

/-- Rational complex eigenvalue outside the unit disk. -/
def lam : ℂ := ⟨3151 / 3200, 7 / 40⟩

/-- The scalar 1/lam-1, written without a division of complex numbers. -/
def c : ℂ := ⟨-159201 / 10242401, -1792000 / 10242401⟩

/-- Exact rational complex eigenvector. -/
def v : Fin 13 → ℂ := ![
  ⟨50081173895804/696278676040025, 21517326924352/139255735208005⟩,
  ⟨12320804120410700169584/47333041804167800500625, 4036122717515863120384/9466608360833560100125⟩,
  ⟨1678868655510391499446756960064/3217701365173372182227500015625, 394070938491543039376372151296/643540273034674436445500003125⟩,
  ⟨179723094442571371041701899878197807744/218739419247019970282130006749687890625, 30445453344405094030186904274808588288/43747883849403994056426001349937578125⟩,
  ⟨16696085221687169503948446766847257159055690624/14869911188897898755278454912093951546884765625, 400535910771135879738920397850794107766106112/594796447555915950211138196483758061875390625⟩,
  ⟨1405315342324689404250483444166929089849546629336056704/1010856934369058879831298246885519628506015039306640625, 111924052918885844437347485933253730040545474284685312/202171386873811775966259649377103925701203007861328125⟩,
  ⟨109589878950602940456610200296142416901114972599464417238873984/68718079669831981877403650605733796483829615022441412353515625, 4895365609418784621630603550097643747807726340076323088287744/13743615933966396375480730121146759296765923004488282470703125⟩,
  ⟨8018049334936627155291937829110374021387063268403277956727174248430464/4671456773907169873825447103269048628315649324965942772827301025390625, 101507999709904776429008687248020339292388296409977024530199467821056/934291354781433974765089420653809725663129864993188554565460205078125⟩,
  ⟨554409579067307018150601654204560389914751692257643179266160720329101150134144/317565748276628755701900739716407507479113549002417913845369244388580322265625, -9991555466821146035810416861552243520616721161874226924730916920285229463552/63513149655325751140380147943281501495822709800483582769073848877716064453125⟩,
  ⟨36376597786578476766136832650499429260479179741106705023521639224095857820282779313024/21588127506988929728334104833439875268617826039023094843656047367766800022125244140625, -353791045331466323130245009254607769779075155781570149820824025026666017828175845376/863525100279557189133364193337595010744713041560923793746241894710672000885009765625⟩,
  ⟨2269445119406623191410433489271006175768111692373923002420865535484766300481292494747682015104/1467561447628295117655395654929863556757521529578440963049109191461971259674074649810791015625, -181975674038585744348612010816810863680295959711162219250719478284721346940795169358126921728/293512289525659023531079130985972711351504305915688192609821838292394251934814929962158203125⟩,
  ⟨134744793626454407983414328508207022134968398777731505260368798004986601912476030678898400729567808384/99764863898807692805591738007023497834965232518780656129102519063314592781925086546003818511962890625, -15288257940416384667880279107385081159968883700809276166972012435254928811885491522546652370705872896/19952972779761538561118347601404699566993046503756131225820503812662918556385017309200763702392578125⟩,
  ⟨-102732648840246787212702133584896323152968447121525629481697807218129492534225946047584015955785433484/99764863898807692805591738007023497834965232518780656129102519063314592781925086546003818511962890625, -77861203114579628883153978955339043903398124492927075510239722091466376198921772258905322651471843904/19952972779761538561118347601404699566993046503756131225820503812662918556385017309200763702392578125⟩]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma Ppos : ∀ i j, 0 < P i j := by
  intro i j
  dsimp [P]
  split_ifs <;> norm_num

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma Pcolsum : ∀ j, ∑ i, P i j = 1 := by
  intro j
  fin_cases j <;> norm_num [P, Fin.sum_univ_succ]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma ProwDD : ∀ i, (∑ j ∈ Finset.univ.erase i, |P i j|) ≤ |P i i| := by
  intro i
  have habs : ∀ a b, |P a b| = P a b := fun a b => abs_of_pos (Ppos a b)
  simp_rw [habs]
  rw [Finset.sum_erase_eq_sub (Finset.mem_univ i)]
  fin_cases i <;> norm_num [P, Fin.sum_univ_succ]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma PcolDD : ∀ j, (∑ i ∈ Finset.univ.erase j, |P i j|) ≤ |P j j| := by
  intro j
  have habs : ∀ a b, |P a b| = P a b := fun a b => abs_of_pos (Ppos a b)
  simp_rw [habs]
  rw [Finset.sum_erase_eq_sub (Finset.mem_univ j), Pcolsum]
  fin_cases j <;> norm_num [P]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma wpos : ∀ i, 0 < w i := by
  intro i
  fin_cases i <;> norm_num [w]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma wsum : ∑ i, w i = 1 := by
  norm_num [w, Fin.sum_univ_succ]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma vne : v ≠ 0 := by
  intro hv
  have h := congrArg Complex.im (congrFun hv (0 : Fin 13))
  norm_num [v] at h

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma lam_normSq : Complex.normSq lam = 10242401 / 10240000 := by
  norm_num [lam, Complex.normSq_apply]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma one_lt_norm_lam : 1 < ‖lam‖ := by
  have h : 1 < Complex.normSq lam := by rw [lam_normSq]; norm_num
  rw [Complex.normSq_eq_norm_sq] at h
  have hnonneg := norm_nonneg lam
  nlinarith

/-- Exact weighted mean of the eigenvector. -/
set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma w_dot_v : ∑ j, (w j : ℂ) * v j = c := by
  apply Complex.ext <;>
    norm_num [w, v, c, Fin.sum_univ_succ, Complex.mul_re, Complex.mul_im]

/-- Finite rational matrix/vector identity; no numerical approximation. -/
set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma P_mul_v : ∀ i,
    (∑ j, (P i j : ℂ) * v j) = lam * v i + ((∑ k, P i k : ℝ) : ℂ) * c := by
  intro i
  fin_cases i <;> apply Complex.ext <;>
    norm_num [P, v, lam, c, Fin.sum_univ_succ, Complex.mul_re, Complex.mul_im]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma eig :
    ((P - fun i j => (∑ k, P i k) * w j).map Complex.ofReal) *ᵥ v = lam • v := by
  funext i
  change (∑ j, ((P i j - (∑ k, P i k) * w j : ℝ) : ℂ) * v j) = lam * v i
  calc
    (∑ j, ((P i j - (∑ k, P i k) * w j : ℝ) : ℂ) * v j) =
        (∑ j, (P i j : ℂ) * v j) -
          ((∑ k, P i k : ℝ) : ℂ) * (∑ j, (w j : ℂ) * v j) := by
      simp [Complex.ofReal_sub, Complex.ofReal_mul, sub_mul,
        Finset.sum_sub_distrib, Finset.mul_sum, mul_assoc]
    _ = lam * v i := by
      rw [w_dot_v, P_mul_v]
      ring

end OMA.MO198816Witness

-- This body is appended after the concrete witness definitions in the one-file disproof.
open scoped BigOperators Matrix

namespace OMA.MO198816Witness

lemma irreducible : P.IsIrreducible := by
  apply (Matrix.isIrreducible_iff_exists_pow_pos
    (fun i j => le_of_lt (Ppos i j))).2
  intro i j
  exact ⟨1, by norm_num, by simpa using Ppos i j⟩

lemma lam_mem_spectrum :
    lam ∈ spectrum ℂ ((OMA.S_mo_198816.perturbation P w).map Complex.ofReal) := by
  let M := (OMA.S_mo_198816.perturbation P w).map Complex.ofReal
  have heig : M *ᵥ v = lam • v := by
    simpa [M, OMA.S_mo_198816.perturbation] using eig
  have hevec : M.toLin'.HasEigenvector lam v := by
    apply Module.End.hasEigenvector_iff.mpr
    refine ⟨Module.End.mem_eigenspace_iff.mpr ?_, vne⟩
    simpa only [Matrix.toLin'_apply] using heig
  have hmem := (Module.End.hasEigenvalue_of_hasEigenvector hevec).mem_spectrum
  simpa only [Matrix.spectrum_toLin'] using hmem

lemma lam_norm_gt_one : 1 < ‖lam‖ := by
  have hsq : 1 < Complex.normSq lam := by
    norm_num [lam, Complex.normSq_apply]
  rw [Complex.normSq_eq_norm_sq] at hsq
  nlinarith [norm_nonneg lam]

end OMA.MO198816Witness

theorem OMA.disproof : ¬ (type_of% @OMA.S_mo_198816.main) := by
  intro h
  have hradius := h 13 (by norm_num) OMA.MO198816Witness.P
    OMA.MO198816Witness.irreducible OMA.MO198816Witness.Pcolsum
    OMA.MO198816Witness.ProwDD OMA.MO198816Witness.w
    OMA.MO198816Witness.wpos OMA.MO198816Witness.wsum
  have hnn : (1 : ℝ≥0) < ‖OMA.MO198816Witness.lam‖₊ := by
    exact_mod_cast OMA.MO198816Witness.lam_norm_gt_one
  have hnorm : (1 : ℝ≥0∞) <
      (‖OMA.MO198816Witness.lam‖₊ : ℝ≥0∞) := by
    exact_mod_cast hnn
  have hbound : (‖OMA.MO198816Witness.lam‖₊ : ℝ≥0∞) ≤
      spectralRadius ℂ ((OMA.S_mo_198816.perturbation
        OMA.MO198816Witness.P OMA.MO198816Witness.w).map Complex.ofReal) :=
    le_iSup₂ OMA.MO198816Witness.lam OMA.MO198816Witness.lam_mem_spectrum
  exact (not_lt_of_ge (le_trans (le_of_lt hnorm) hbound)) hradius
#print axioms OMA.disproof
