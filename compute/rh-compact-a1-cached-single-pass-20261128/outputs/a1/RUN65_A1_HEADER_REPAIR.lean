/-
# RUN59 — repair the actual A1 replay failures, 27 November 2026

PREPARED, source-matched, not native-verified. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
87e949a9ea899dd09d297aa30f59df4d1b533fc4 / 261b9e8bf027af37e6abe6920deb544b23352d48.
Read AGENTS, SWARM, HANDOFF, EXPANSION and latest A1/A2 peer cache repair
42f6ef9e3dd165513d289c443f9a6b5c8420d427; prime RUN84 65a6c3fb02ce06bea9bdee927f4d8b4d686ce4d8.

Actual native run 46023465491 completed wrapper jobs but compute status
ERROR (state blob 07a2b14930c38095e6771ae9ed1a10a3cf1bf678).
A1 receipt a836b217995972d757d2b82163d86c78adb4fd2c:
generation 0, native transport exit 1 after 9.34 s, zero accepted leaf/
transport markers, empty axiom roster. Log ba683f34264daaa9c633314558cbee36916dba78:
line 26 IsOpen.matrix hO mismatch; lines 82-83 CommRing Nat/Module.End
Nat versus embValRing. Remaining unknown declarations cascade from
failed elaboration. A2 receipt 566a91c8625dd1f17e13f7722b9286c0bd1b3402
is independently failed (original probe 0, overlay rebuild 1); not A1.
Original build did succeed, but no original cache retained in this run.
Peer 42f6ef9e3 prepares cache retention, not a successful replacement.

Repair exact failed generated source blob bacc8d571342525149fb6eba8f062568988ce0d2.
Define OM explicitly using Set.matrix rather than overloading O.matrix;
the exact pinned Mathlib IsOpen.matrix has index arguments m,n
(Mathlib/Topology/Instances/Matrix.lean blob a0a3ed020a77d174483622f1276b69f7173b4c9a).
Use the same OM in U and membership proofs, prove identity membership
coordinatewise. It denotes precisely matrices with entries in O.
Make the scalar ring of HasType explicit: (T.p : embValRing), as in hp;
the same markOperator, integralColumns, s, bound and all premises remain.
No new mathematical assumptions. Unchanged original leaf proof body,
all downstream transport expressions, kernel insertion, exact statement
and direct-edge guards, and axiom audits, byte-for-byte after their
respective boundaries. Original leaf source ccae44b8b21d1bface80bc3c8b10370a48c8ea48;
marked consumer source 5433d457d06b8f0e209209be1407fe1971ef86f8;
LocalStatement source 9d5bd0d698b0db2850cbd306d8d400d7e99a3547.
No Main import, no assumed RH, no global dependency removal.

Actual current-run static transformation controls: four malformed source
variants rejected (missing openness anchor, missing scalar anchor,
changed membership roster, duplicate helper boundary); original caller
body and all guards compared equal. This checks exact substitution only,
not Lean elaboration or mathematical validity. Other compiler errors
may appear after these first errors are resolved. No native PASS.

RESUME HERE: run this exact file on the next shared original pinned
LocalStatement build, BEFORE any A2 overlay, using
lake env lean --tstack=400000 RUN59_A1_ELAB_REPAIR.lean
and record exit, actual markers and #print axioms, preserving original
RUN57 failure. If accepted, emit a fresh a1_transport receipt for this
source (not the failed receipt), then RUN58 strict eight-root graph and
native scan/prune. Do not launch a duplicate full build; coordinate
through integration/acceleration cache retention. A1/Star/RH OPEN.
HANDOFF TO integration, theta, acceleration, audit.
-/

import Lean
import New.Columns.LocalStatement
set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

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
  let OM : Set (Matrix n n (LocField w)) := (O : Set (LocField w)).matrix
  have hMat : IsOpen OM := by
    change IsOpen ((O : Set (LocField w)).matrix : Set (Matrix n n (LocField w)))
    exact IsOpen.matrix (m := n) (n := n) hO
  have hOne : (1 : Matrix n n (LocField w)) ∈ OM := by
    change ∀ i j, (1 : Matrix n n (LocField w)) i j ∈ O
    intro i j
    by_cases hij : i = j <;> simp [Matrix.one_apply, hij]
  have hY : Continuous Y := by dsimp [Y]; fun_prop
  have hYA : Y A.1 = 1 := by
    change (d⁻¹ * (A⁻¹ * A) * d).1 = 1
    simp
  have hA' := mem_intGL_iff_det.1 hA
  let U : Set (Matrix n n (LocField w)) :=
    (OM ∩ Y ⁻¹' OM) ∩
      ({a : LocField w | Valued.v a < 1} ⁻¹' fun X => X.det - A.1.det) ∩
      ({a : LocField w | Valued.v a < 1} ⁻¹' fun X => (Y X).det - 1)
  have hU : IsOpen U := by
    dsimp [U]
    exact ((hMat.inter (hMat.preimage hY)).inter
      ((isOpen_v_lt w 1).preimage (by fun_prop))).inter
      ((isOpen_v_lt w 1).preimage (by fun_prop))
  have hAm : A.1 ∈ OM := by
    change ∀ i j, Valued.v (A i j) ≤ 1
    exact hA'.1
  have hAU : A.1 ∈ U := by
    change ((A.1 ∈ OM ∧ Y A.1 ∈ OM) ∧
      Valued.v (A.1.det - A.1.det) < 1) ∧
      Valued.v ((Y A.1).det - 1) < 1
    simp [hAm, hYA, hOne]
  have hDense : DenseRange (fun B : Matrix n n E => B.map f) :=
    DenseRange.piMap fun _ => DenseRange.piMap fun _ => w.denseRange_algebraMap E
  obtain ⟨B, hB⟩ := hDense.exists_mem_open hU ⟨A.1, hAU⟩
  change ((B.map f ∈ OM ∧ Y (B.map f) ∈ OM) ∧
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
  | T.isEven s}) (big : HeckeSizes T.P T.o₀ N D.k D.a (D.ceilLogM p) ℓ x y z) s : HasType (T.p : embValRing)
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




set_option pp.fullNames true

private def a1Run57SameType (a b : Lean.ConstantInfo) :
    Lean.Elab.Command.CommandElabM Unit := do
  unless a.levelParams == b.levelParams do
    Lean.throwError "RUN57 universe parameter mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq a.type b.type
  unless same do
    Lean.throwError "RUN57 supplier statement differs"

private def a1Run57Audit (old fresh : Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  let oa ← Lean.collectAxioms old
  let na ← Lean.collectAxioms fresh
  unless oa.all (fun x => allowed.contains x) &&
      na.all (fun x => allowed.contains x && oa.contains x) do
    Lean.throwError "RUN57 new or unexpected axiom"
  let oi ← Lean.getConstInfo old
  let ni ← Lean.getConstInfo fresh
  let some ov := oi.value? (allowOpaque := true) |
    Lean.throwError "RUN57 original proof missing"
  let some nv := ni.value? (allowOpaque := true) |
    Lean.throwError "RUN57 new proof missing"
  Lean.logInfo m!"A1_ROLE|{old}|type|{oi.type.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"A1_ROLE|{fresh}|type|{ni.type.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"A1_ROLE|{old}|value|{ov.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"A1_ROLE|{fresh}|value|{nv.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"A1_AXIOMS|{old}|{oa.map Lean.Name.toString}"
  Lean.logInfo m!"A1_AXIOMS|{fresh}|{na.map Lean.Name.toString}"

run_cmd do
  let a ← Lean.getConstInfo ``Columns.hasType_markOperator
  let b ← Lean.getConstInfo ``Columns.hasType_markOperator_run55
  a1Run57SameType a b
  let some v := b.value? (allowOpaque := true) |
    Lean.throwError "RUN57 changed leaf proof missing"
  let deps := v.getUsedConstants
  if deps.contains ``Columns.hasType_markOperator then
    Lean.throwError "RUN57 changed leaf calls old leaf"
  unless deps.contains ``kernelRun54_local_double_integral do
    Lean.throwError "RUN57 changed leaf does not use new approximation"
  a1Run57Audit ``Columns.hasType_markOperator ``Columns.hasType_markOperator_run55
  Lean.logInfo "A1_RUN57_LEAF_CHECKED"

private def a1Run57Retarget (original fresh oldSupplier newSupplier : Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  let .thmInfo info ← Lean.getConstInfo original |
    Lean.throwError "RUN57 original not a theorem"
  a1Run57SameType (← Lean.getConstInfo oldSupplier) (← Lean.getConstInfo newSupplier)
  let oldEdges := info.value.getUsedConstants
  unless oldEdges.contains oldSupplier && !oldEdges.contains newSupplier do
    Lean.throwError "RUN57 expected original supplier absent or new already present"
  let proof := info.value.replace fun e =>
    match e with
    | .const n levels =>
      if n == oldSupplier then some (.const newSupplier levels) else none
    | _ => none
  -- Normal checked insertion, with exactly original statement/universes.
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := fresh
    levelParams := info.levelParams
    type := info.type
    value := proof
  })
  let .thmInfo checked ← Lean.getConstInfo fresh |
    Lean.throwError "RUN57 checked declaration missing"
  unless checked.type == info.type && checked.levelParams == info.levelParams do
    Lean.throwError "RUN57 original type or universes changed"
  let expected := (oldEdges.filter (· != oldSupplier)).push newSupplier
  let got := checked.value.getUsedConstants
  unless expected.all (fun x => got.contains x) && got.all (fun x => expected.contains x) do
    Lean.throwError "RUN57 unexpected direct value edge change"
  if got.contains original || got.contains oldSupplier then
    Lean.throwError "RUN57 original caller/supplier retained in direct value"
  a1Run57Audit original fresh
  Lean.logInfo m!"A1_RUN57_TRANSPORT_CHECKED|{fresh}"

run_cmd do
  a1Run57Retarget ``Data.IsMarked.hasType_markOperator
    `Data.IsMarked.hasType_markOperator_run57
    ``Columns.hasType_markOperator ``Columns.hasType_markOperator_run55
  a1Run57Retarget ``Data.IsMarked.hasType_prod_markOperator_pow
    `Data.IsMarked.hasType_prod_markOperator_pow_run57
    ``Data.IsMarked.hasType_markOperator `Data.IsMarked.hasType_markOperator_run57
  a1Run57Retarget ``Data.exists_indexDvd_Bmu_divisible
    `Data.exists_indexDvd_Bmu_divisible_run57
    ``Data.IsMarked.hasType_prod_markOperator_pow `Data.IsMarked.hasType_prod_markOperator_pow_run57

#print axioms Columns.hasType_markOperator_run55
#print axioms Data.IsMarked.hasType_markOperator_run57
#print axioms Data.IsMarked.hasType_prod_markOperator_pow_run57
#print axioms Data.exists_indexDvd_Bmu_divisible_run57
