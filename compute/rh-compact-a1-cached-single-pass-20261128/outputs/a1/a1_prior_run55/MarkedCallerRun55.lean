import New.Columns.MarkedPrimeType

seal Finset.univ Finset.sum Finset.prod
open Ideal IsSplitLevel QuadField Matrix NumberField Parameters Real Ideal.Quotient Data Finset Space
open GeneralLinearGroup Function TwistingData Gf ComplexConjugate WithZero Fintype
seal liftKernel Kernel.lift SmoothForm

/-- Local open-matrix approximation: no adelic unitary approximation is used.
    A rational matrix and its relative d-conjugate are both locally integral. -/
private lemma kernelRun54_local_double_integral {E : Type*} [Field E] [NumberField E]
    {n : Type*} [Fintype n] (w : FinPlace E) (A d : GL n (LocField w))
    (hA : A ∈ Kw n w) :
    ∃ g : GL n E,
      g.map (algebraMap E (LocField w)) ∈ Kw n w ∧
      d⁻¹ * (A⁻¹ * g.map (algebraMap E (LocField w))) * d ∈ Kw n w := by
  classical
  let f : E →+* LocField w := algebraMap E _
  let O : Subring (LocField w) := (LocInt w).1
  let Y : Matrix n n (LocField w) → Matrix n n (LocField w) :=
    fun X => (d⁻¹).1 * ((A⁻¹).1 * X) * d.1
  have hO : IsOpen (O : Set (LocField w)) := Valued.isOpen_integer _
  have hMat : IsOpen (O.matrix : Set (Matrix n n (LocField w))) := hO.matrix
  have hY : Continuous Y := by dsimp [Y]; fun_prop
  have hYA : Y A.1 = 1 := by
    change (d⁻¹ * (A⁻¹ * A) * d).1 = 1
    simp
  have hA' := mem_intGL_iff_det.1 hA
  let U : Set (Matrix n n (LocField w)) :=
    ((O.matrix : Set (Matrix n n (LocField w))) ∩ Y ⁻¹' O.matrix) ∩
      ({a : LocField w | Valued.v a < 1} ⁻¹' fun X => X.det - A.1.det) ∩
      ({a : LocField w | Valued.v a < 1} ⁻¹' fun X => (Y X).det - 1)
  have hU : IsOpen U := by
    dsimp [U]
    exact ((hMat.inter (hMat.preimage hY)).inter
      ((isOpen_v_lt w 1).preimage (by fun_prop))).inter
      ((isOpen_v_lt w 1).preimage (by fun_prop))
  have hAm : A.1 ∈ O.matrix := by
    change ∀ i j, Valued.v (A i j) ≤ 1
    exact hA'.1
  have hAU : A.1 ∈ U := by
    change ((A.1 ∈ O.matrix ∧ Y A.1 ∈ O.matrix) ∧
      Valued.v (A.1.det - A.1.det) < 1) ∧
      Valued.v ((Y A.1).det - 1) < 1
    simp [hAm, hYA]
  have hDense : DenseRange (fun B : Matrix n n E => B.map f) :=
    DenseRange.piMap fun _ => DenseRange.piMap fun _ => w.denseRange_algebraMap E
  obtain ⟨B, hB⟩ := hDense.exists_mem_open hU ⟨A.1, hAU⟩
  change ((B.map f ∈ O.matrix ∧ Y (B.map f) ∈ O.matrix) ∧
    Valued.v ((B.map f).det - A.1.det) < 1) ∧
    Valued.v ((Y (B.map f)).det - 1) < 1 at hB
  have hXdet : Valued.v (B.map f).det = 1 :=
    (Valued.v.map_eq_of_sub_lt _ (hB.1.2.trans_le hA'.2.ge)).trans hA'.2
  have hYdet : Valued.v (Y (B.map f)).det = 1 := by
    simpa using Valued.v.map_eq_of_sub_lt _ (by simpa using hB.2)
  have hBdet : B.det ≠ 0 := by
    intro e
    simp [← RingHom.map_det, e] at hXdet
  let g : GL n E := GeneralLinearGroup.mkOfDetNeZero B hBdet
  refine ⟨g, mem_intGL_iff_det.2 ⟨?_, hXdet⟩,
    mem_intGL_iff_det.2 ⟨?_, hYdet⟩⟩
  · exact hB.1.1.1
  · exact hB.1.1.2

attribute [local simp] mul_assoc QuotientGroup.eq atPlace_atSplit_of_ne mul_sum mul_mem_cancel_right

attribute [-simp] MonoidHom.coe_range

/-- Let l lie in a marked set Λ, T be twisting data on the tops inducing l or l̄, and `HeckeSizes`
hold. Then Y = `Data.IsMarked.markOperator` keeps the integral columns 𝒜, and [𝒜 : Y𝒜 + p^s𝒜] ∣ p^c,
c ≤ (z + xs + y)·dim.

A Frobenius-twisted Hecke operator has small elementary divisors. -/
lemma Columns.hasType_markOperator_run55 {P p} {D : Data P} [Fact p.Prime] [PadicPlace p] {Λ l N W ℓ x y z
  Q} [NeZero N] (L : D.IsMarked Λ) (a : l ∈ Λ) (hW : W = (l.valuation D.E).valuationSubring)
  (T : TwistingData N W embValRing) (hp : ¬IsUnit (T.p : embValRing)) (e : T.p = p) (t : _ ≃ Subtype
  Q) (hS : ∀ σ, Q σ ↔ σ ∈ D.tops ∧ (inducedPlace σ = l ∨ inducedPlace σ = star l)) (hc : ∀ s x,
  T.ι s x = ite (T.isEven s) (Φ (t s).1) ((Φ (t s)).comp conj) x) (hA : markExponent l = D.a * #{s
  | T.isEven s}) (big : HeckeSizes T.P T.o₀ N D.k D.a (D.ceilLogM p) ℓ x y z) s : HasType ↑T.p
  D.integralColumns s (L.markOperator ⟨l, a⟩) ((z + x * s + y) * Module.finrank ℂ D.Column) := by
  have q : D.X 0 ≃ Fin D.k := equivFinOfCardEq (by simp [↓card_X, n])
  let P := parahoric W (twoBlock D.k (D.ceilLogM p))
  let ϖ : D.Eˣ := .mk0 p NeZero.out
  let d := diagGL (if q · < D.ceilLogM p then ϖ else 1)
  let jw := (GeneralLinearGroup.map W.subtype).comp (reindexGL q.symm).toMonoidHom
  let j v := GeneralLinearGroup.map (n := D.X 0) (algebraMap D.E (@LocField D.E _ _ v))
  have hM {v x} : j v x ∈ Kw .. ↔ x ∈ intGL _ (v.valuation D.E).valuationSubring.1 := by
    simp [mem_intGL, ← v_algebraMap_eq_valuation, -coe_units_inv]; rfl
  obtain ⟨rfl, _, ⟨ρ, hρ, hρ'⟩, hl, hv, hpl, hl', ⟨⟩⟩ := hW, T.finite_residueField,
    exists_reps_integralAbove (K := D.columnLevel 0) p, L.star_ne a,
    L.maxCompactAt_le_columnLevel a, L.p_mem a, L.valuation_p a, id big
  have hP {β} : j l (d⁻¹ * jw β * d) ∈ Kw .. ↔ β ∈ P := by
    have H β : (∀ i j, l.valuation _ ((d⁻¹ * jw β * d) i j) ≤ 1) ↔ β ∈ P := q.forall₂_congr q (by
      intros; dsimp [twoBlock]
      split_ifs <;> simp [*, d, jw, ← map_inv, field, ϖ, ↓OrderDual.toDual_lt_toDual,
        -WithZero.inv_exp, ← WithZero.exp_add, ← lt_mul_exp_iff_le, ↓Valuation.mem_maximalIdeal_iff]
          <;> first
        | use (β _ _).2.trans_lt (by trivial)
        | use (mul_le_one' (β _ _).2 (by trivial)).trans_lt (by trivial))
    erw [hM, mem_intGL, conj_inv, H, H β⁻¹]; simp
  choose ψ hψ using fun {τ b} (h : ite (τ ∈ D.tops) D.a 0 = b) ↦ schur_one_row_eq_symPowMatrix (k :=
    D.κ τ) (a := b) q.symm (by simp [↓card_X, n]; omega) (by grind only [card_X, κ, n])
  have hj v γ : ((stdSpace ..).embFin γ).atPlace v =
    j v γ := congr(.map (_root_.evalAt v) $(stdSpace_embFin γ))
  have hw' {x} : _ ↔ x ∈ jw.range := hM.trans (reindex_equiv (reindexGL _)).2.1
  have hD : j l d ∈ basicDoubleCoset _ l (D.ceilLogM p) := by convert (diagGL_mem_basicDoubleCoset
    (ϖ := ϖ.map _) ((v_algebraMap_eq_valuation _).trans hl') (q.finsetCongr.symm
    (Iio ⟨D.ceilLogM p, by omega⟩))).1 <;> simp [Units.ext_iff, j, d, Fin.lt_def, apply_ite,
      Equiv.finsetCongr]
  obtain ⟨_, r1, hKw⟩ := ofFinite (_ ⧸ P), (hρ' · ·), fun k : D.columnLevel 0 ↦
    mem_Kf_iff.1 (IsLevel.le k.2)
  let δ x β := ((ρ x).atPlace l)⁻¹ * (j l (jw β) * j l d)
  choose o γ u G using fun b : _ × _ ⧸ P ↦
    exists_eq_map_mul_rep_mul _ _ hρ (ρ b.1 * atSplit hl (δ b.1 b.2.out))
  have H b := eq_mul_inv_of_mul_eq (eq_mul_inv_of_mul_eq (G b).symm)
  choose g hg using fun b ↦ (@hw' ((jw b.2.out * d)⁻¹ * γ b)).1 (by simp [← hj, δ, *])
  have hγ b := eq_mul_of_inv_mul_eq (hg b).symm
  let ε : D.Column ≃ₗ[ℂ] _ := freeLevelEquiv _ _ 1 D.classAut_columnLevel_eq_bot hρ
  let f := ε.symm.1.restrictScalars _ ∘ₗ ((Algebra.linearMap embValRing ℂ).compLeft _).compLeft _
  let c := embValRing.subtype
  have hε F y : (f F).1.1 _ = c ∘ F y := congrFun (ε.4 _) y
  choose m hm using fun b (τ : Subtype (¬Q ·)) ↦ (if h : ↑τ ∈ D.tops then ((@hM (placeOfEmb
    (weightEmbedding ιₚ τ)) (γ b)).1 (by simp [← hj, r1 _ _ (natCast_mem_placeOfEmb _), by simpa [*,
    inducedPlace] using τ.2, H, hKw, placeOfEmb_comp_star, star_involutive.eq_iff])).elim (⟨.map
    (.restrict ((Φ τ).comp conj) _ _ fun _ ↦ (isEquiv_placeOfEmb _).le_one_iff_le_one.2) ·, · ▸
    rfl⟩) else ⟨1, Matrix.ext (by simp [by simpa using hψ (ite_eq_right h) 0])⟩ : ∃ m : GL _ _,
    schur (fun () ↦ D.κ τ) (fun _ ↦ (γ b).1.1.map (Φ τ ∘ conj)) = schur _ fun _ ↦ m.1.map c)
  convert T.hasType_twisted_hecke hp big f o g⁻¹ ((weylRep _ 0).toHomUnits ∘ m) (.trans
    (.piEquivPiSubtypeProd Q _) (.prodCongr (t.piCongr fun s ↦ (ψ (ite_eq_left ((hS _).1 (t
    s).2).1)).symm.trans (.piUnique _)).symm (.refl _))) ?_ (fun F ↦ eq_of_eq_on_class_reps hρ ?_) _
  refine le_antisymm (fun φ H ↦ ⟨fun c ↦ (⟨_, (weylGauge_le_one_iff _ (r1 c)).1
    (by simpa using H.2 _) ·⟩), ε.3 φ⟩) fun | _, ⟨F, rfl⟩ => ⟨by simp, fun g ↦ ?_⟩
  choose c γ k _ using exists_eq_map_mul_rep_mul _ _ hρ g
  simp [levelSpace_smoothFormRep_apply (f F).2, weylGauge_mul, -mul_assoc, ↓weylGauge_embFin,
    weylGauge_le_one_iff, mem_localLevel, *]; use (F c · |>.2)
  simp [finrank_levelSpace_smoothFormRep D.classAut_columnLevel_eq_bot]
  simp_intro b b' h
  use (eq_and_eq_one_of_doubleCoset_rep hρ ((map_eq_one_iff _ Fact.out).1 <|
    (D.classAut_columnLevel_eq_bot _).le ⟨⟨·, rfl⟩, ·⟩) (γ b * (γ b')⁻¹) ((mul_mem_cancel_right
    ((u b')⁻¹ * u b).2).1 (hv ((and_congr_left mem_Kf_iff_of_supportedOn).2 ⟨by
    simp [← mul_assoc, *, -H, -hg, -hM]
    simpa [mul_mem_cancel_left, hw', r1, hpl, (Units.ext (diagonal_transpose _) : invTransposeGL d =
      d⁻¹)] using! hM.2 ((invTransposeGL_mem_intGL _).2 (hM.1 (hP.2 h.2))), by simp +contextual [H,
    h]⟩)))).elim fun e f ↦ Prod.ext e (Quotient.out_equiv_out.1 (QuotientGroup.leftRel_apply.2 (hP.1
    (hw'.2 ⟨g b * (g b')⁻¹, by simp [hg, mul_inv_eq_one.1 f]⟩))))
  ext x; dsimp [IsMarked.markOperator]; erw [(heckeFun_eq_sum_pullback (J :=
    P) _ ((mem_sphericalAt_iff hl).1 (levelSpace_anti hv (f
    F).2)) univ (δ x) (fun z h ↦ ?_) (by simp [δ, ← hP]) _).2] <;> simp [δ, *, -hM, -map_mul]
  congr with b; erw [G (x, b)]
  simp [levelSpace_smoothFormRep_apply (f F).2, stdSpace_weightRep_apply, weylRep, lastEntry,
    mulVec, dotProduct, ← mul_assoc, hε]
  congr! 2; rw [pow_mul', ← prod_const, prod_filter, ← prod_pow, schur_apply_eq_prod .refl,
    schur_apply_eq_prod .refl, ← prod_subtype_mul_prod_subtype Q, ← t.prod_comp, ← mul_rotate',
    diagonal_pow_depth, map_prod]
  simp_rw [letterRep_apply, ← kroneckerPi_mul, ← map_mul, ← prod_mul_distrib, kroneckerPi, of_apply,
    map_prod]
  refine congr((∏ τ, $((hm ..).trans (schur_map .refl ..)) _ _) * ∏ s, $((hψ ..).trans
    (congrFun₂ ((congrArg _ ?_).trans (symPowMatrix_map c _)) ..))); clear * - hc hγ e
  have := NeZero.ne p
  cases _ : T.isEven s <;> ext <;> (try apply congr(p * Φ _ ($(@id ((γ _).1⁻¹.1 =
    _) (U.inv_val_eq_conjTranspose _)) _ _)).symm.trans) <;> simp [*, letterMatrix, deepIndicator,
    mul_apply, diagonal, ← map_inv, jw, d, reindex_equiv q,
    -sum_sum_type] <;> congr with <;> split_ifs <;> simp [*, ϖ, c, field] <;> omega
  choose k₁ hk₁ k₂ hk₂ hz using by simpa [basicDoubleCoset_eq hD, DoubleCoset.mem_doubleCoset] using h
  let A := (ρ x).atPlace l * k₁
  have hA : A ∈ Kw .. := mul_mem (r1 x l hpl) hk₁
  obtain ⟨g, hgK, hgC⟩ := kernelRun54_local_double_integral l A (j l d) hA
  obtain ⟨β, hβ⟩ := hw'.1 hgK
  use β
  have Hc := (Kw (D.X 0) l).mul_mem ((Kw (D.X 0) l).inv_mem hgC) hk₂
  simpa [δ, A, hβ, hz, ← mul_assoc] using Hc


/-! Part of: Scaled Hecke operators repair divisibility at inert primes pairing tops (see
New.Columns.LocalStatement).

This file: Scaled Hecke operator at a marked prime has image of small index on columns. -/

namespace Data

open Finset ZMod Nat Columns Parameters RingHom Module Real IsLocalization AtPrime

/-- For Λ marked at p, l in Λ and any s, the operator p^{A_l}T_{l,𝔯} (`Data.IsMarked.markOperator`)
keeps the integral columns and is onto modulo p^s up to an index of exponent at most (128A_l log
b/(mp) + s/x^14 + x^40)·dim(columns) (`HasType`). -/
theorem IsMarked.hasType_markOperator_run55 {P p} {D : Data P} [h₀ : Fact p.Prime] [PadicPlace p] {Λ}
    (hΛ : D.IsMarked Λ) s {l} (hl : l ∈ Λ) :
  HasType ↑p D.integralColumns s (hΛ.markOperator ⟨l, hl⟩) ((128 * D.markExponent l *
  (D.logB / (D.m * p)) + 1 / D.x ^ 14 * s + D.x ^ 40) * finrank ℂ D.Column) := by
  obtain ⟨hL, -, hd, hx⟩ := hΛ.2 ⟨l, hl⟩; set d := D.o₀ p; let c := D.placeOfInt (-p) ^ d
  obtain ⟨hs, ⟨τ, _, e⟩, ⟨z, hz⟩, hm, h', _, _, _, _, hN, hu : ¬IsUnit (p : embValRing), hW, r0⟩ :=
    (hΛ.2 ⟨l, hl⟩).m_dvd_orderOf, hΛ.3 l hl, (Complex.isSquare p).exists_sq, hΛ.p_mem hl,
    hΛ.star_ne hl, P.thirteen_le_of_chiK_ne_one h₀.1 (by lia), NeZero.of_pos (orderOf_pos c),
    D.hasLogUpper_of_le hx, D.hasLogUpper_of_le (orderOf_le_card_univ
    (x := c)), (by grind [o₀, orderOf_map_dvd, orderOf_pow_of_dvd, Nat.mul_div_cancel'] : orderOf
    (D.placeOfInt (-p)) = d * orderOf c), (Valuation.mem_maximalIdeal_iff ..).2 (by simpa using!
    norm_p_lt_one), l.valuationSubringAtPrime_eq_valuationSubring (K := D.E), hd.pos.trans_le hx
  let t (s : ZMod (orderOf c)) := c ^ s.val * τ; have ht s : t (s + 1) =
    D.placeOfInt (-p ^ d) * t s := by simp [t, ← hd.neg_pow, ← placeOfInt_pow, c, _root_.pow_succ',
    val_add, val_one_eq_one_mod, mul_assoc]
  have hi : t.Injective := fun _ _ ↦ by simp [t, pow_inj_mod, ← natCast_eq_natCast_iff']
  have hS σ : σ ∈ Set.range t ↔ σ ∈ D.tops ∧ (inducedPlace σ = l ∨ inducedPlace σ = star l) := by
    simp [t, natCast_zmod_surjective.exists, ← e, inducedPlace_eq_or_star_iff, hL]; simp [c,
      ← pow_mul]
    grind [o₀, tops, =_ orderOf_dvd_iff_pow_eq_one, dvd_def]
  have := CharP.quotient _ p hu; let v s := inducedPlace (t s) == l; have w s :=
    ((hS _).1 ⟨s, rfl⟩).2
  let g s : l.valuationSubringAtPrime D.E →+* embValRing := .restrict (ite (v s) (Φ (t s)) (comp (Φ
    (t s)) (starRingEnd _))) _ _ fun x h ↦ (isEquiv_placeOfEmb (ιₚ.comp _)).le_one_iff_le_one.2
    <| by cases w s <;> simp_all [v, ← comp_assoc, placeOfEmb_comp_star, inducedPlace]
  let ψ s := comp (Ideal.Quotient.mk (.span {↑p})) (g s)
  let T : TwistingData .. :=
    ⟨p, d, g, v, ⟨z, by simpa [hz, pow_le_one_iff] using (p : embValRing).2⟩, h₀.1, by
    grind [le_pow], Subtype.ext hz.symm, fun s x ↦ Ideal.mk_span_eq_iff_dvd_sub.1
    (RingHom.congr_fun (ringHom_ext l.1.primeCompl (ext (star_involutive.surjective.forall.2 fun a ↦
    .trans (congrArg (Quot.mk _) (Subtype.ext (show (_ : D.E →+* ℂ) (star a) = (_ : D.E →+* ℂ)
    (galOfPlaceInt _ a) by cases w s <;> simp [v, *, ← phi_mul, @starRingEnd_apply D.E, mul_comm (t
    s), inducedPlace_neg_pow_mul_of_odd]))) ((frob_ext (by grind [chiK_eq_one_of_dvd, Fact])
    (comp (ψ s) (algebraMap ..)) d (.inr ⟨rfl, rfl⟩)).2 ⟨rfl, by simp [*]⟩ a))) : ψ _ =
    comp (iterateFrobenius ..) (ψ _)) x), by grind [star_star, inducedPlace_neg_pow_mul_of_odd],
    (card_congr (equivQuotMaximalIdeal ..).1).symm.trans ((q_eq_inert hm
    hL).trans (by rw [lcm_eq_left (D.m_even.two_dvd.trans hs), hN, pow_mul]))⟩
  have A : markExponent l =
    D.a * #{s | T.isEven s} := by rw [markExponent, ← card_image_of_injective _ hi]; congr; grind
  have e := card_add_card_compl {s | T.isEven s}
  rw [@card_equiv _ _ _ᶜ {s | T.isEven s} (.addRight 1) (by simp [T.isEven_succ]), ZMod.card] at e
  apply Columns.hasType_markOperator_run55 hΛ hl hW T hu rfl (.ofInjective t hi) hS (by tauto) A (⟨r0,
    D.nat_le_of_hasLogBound, D.le_of_hasLogBound, D.le_of_hasLogBound, e, ?_, D.le_of_hasLogBound,
    D.le_of_hasLogBound, ?_, mul_le_mul (mod_cast by nlinarith) ?_ ?_ ?_⟩ : HeckeSizes (p ^ d) ..)
  grw [← (by lia : 3 * 3 ≤ p), mul_pow, mul_pow, ← pow_add, e, ← pow_mul, le_self_add.trans_eq e]
  rify; grw [← exp_one_lt_three.le, exp_one_pow, ← hN, ← le_of_dvd (orderOf_pos _) hs,
    ← (D.le_of_hasLogBound : D.logB * 2 ≤ D.m)]; use D.lt_of_hasLogBound
  grw [p.cast_pow, hΛ.4.1,
    @le_exp_of_log_le ((_ ^ d) ^ _) (D.logB / 2) (by simpa using D.le_of_hasLogBound)]
  use D.le_of_hasLogBound
  grw (transparency := default) [← le_pow hd.pos, ← (lt_two_mul_self r0).nat_succ_le, pow_succ,
    ← p.cast_pow, ← le_pow_clog h₀.1.one_lt]
  field_simp; use D.le_of_hasLogBound; all_goals bound [D.le_m, h₀.1.pos]

end Data

set_option pp.fullNames true
run_cmd do
  let pairs : Array (Lean.Name × Lean.Name × Lean.Name) := #[
    (``Columns.hasType_markOperator, ``Columns.hasType_markOperator_run55,
      ``kernelRun54_local_double_integral),
    (``Data.IsMarked.hasType_markOperator, ``Data.IsMarked.hasType_markOperator_run55,
      ``Columns.hasType_markOperator_run55)]
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (orig, repl, supplier) in pairs do
    let oi ← Lean.getConstInfo orig
    let ni ← Lean.getConstInfo repl
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq oi.type ni.type
    unless same do
      Lean.throwError "RUN55 original declaration type differs"
    let some nv := ni.value? (allowOpaque := true) |
      Lean.throwError "RUN55 replacement value unavailable"
    let nd := nv.getUsedConstants
    if nd.contains orig then
      Lean.throwError "RUN55 replacement calls its original target"
    unless nd.contains supplier do
      Lean.throwError "RUN55 replacement does not use new supplier"
    let oa ← Lean.collectAxioms orig
    let na ← Lean.collectAxioms repl
    unless na.all (fun x => allowed.contains x && oa.contains x) do
      Lean.throwError "RUN55 replacement has unexpected/new axiom"
    Lean.logInfo m!"RUN55 {orig} original_type_edges {oi.type.getUsedConstants.map Lean.Name.toString}"
    Lean.logInfo m!"RUN55 {repl} replacement_type_edges {ni.type.getUsedConstants.map Lean.Name.toString}"
    match oi.value? (allowOpaque := true) with
    | some ov => Lean.logInfo m!"RUN55 {orig} original_value_edges {ov.getUsedConstants.map Lean.Name.toString}"
    | none => Lean.throwError "RUN55 original proof value unavailable; keep frontier open"
    Lean.logInfo m!"RUN55 {repl} replacement_value_edges {nd.map Lean.Name.toString}"
    Lean.logInfo m!"RUN55 {orig} original_axioms {oa.map Lean.Name.toString}"
    Lean.logInfo m!"RUN55 {repl} replacement_axioms {na.map Lean.Name.toString}"
    Lean.logInfo m!"RUN55 checked original type, supplier, direct proof edges and exact axioms: {repl}"
#print axioms Columns.hasType_markOperator_run55
#print axioms Data.IsMarked.hasType_markOperator_run55
