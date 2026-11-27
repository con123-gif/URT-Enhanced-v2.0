import New.Rows.LiftVolumeHeight
import C2Combined

/-!
RUN82 — propagate the verified C2 Carrier branch to the actual signed
one-lift height caller. 27 November 2026. PREPARED, not native replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7; spine
87e949a9ea899dd09d297aa30f59df4d1b533fc4; obligations
261b9e8bf027af37e6abe6920deb544b23352d48.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Source blobs:
New/Rows/Separation.lean cbd60ebb20b771dc6107f3d54df0397ee7707e4d
New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a
New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1.
Historical pin 40e56bab026552e089d7afcfeff08d2defb9c005 separate.

Read actual integration/2026-11-27_c2_third_native_receipt/c2_replacement_results.json:
six declarations compiled together exit 0, 126.63 s, standard axioms;
five type/edge guards and seven original probes accepted. Exact checked
C2Combined source aba46120ca4118decd864f817b51bcca2bc31c19, object
SHA256 9ee60a0ff16a5f1fd6756906e050081de2b0f7afba39334b0534e436b4f46df3.
Peer integration/2026-11-27_B2_C2_GRAPH_AUDIT.md: ten-root independent
constructor-inclusive graph, 119274 declarations, 3862637 edges, zero
missing. General outer exchange remains. Earlier failed attempts preserved.

The original coset -> rapid -> detector and inner pairing -> comparison
-> signed height chain still calls the old Carrier. Connect both
coset suppliers, both rapid consumers, and both comparison detector
calls, not just the obvious direct height edge. No original premise,
same Data, j, theta family, class representative, Haar measure,
integral/tested hypothesis, denominator or Hecke value factor is changed.
The exact witness identity lambda1/lambda_theta =
det(K_theta)/det(K_1) * (Gamma_theta/Gamma_1)^(-rowDim)
is the EXISTING manuscript identity, not a fresh mathematical proof.
This candidate makes the verified exchange branch feed that actual caller
without repeating the existing determinant estimate derivations.
Retain all other paths (including original explicit_matching_of_sum,
stdClassSum_carrierXi_eq_lineMultiplier, natural-form approximation,
Hecke height and denominator). Do not claim old carrier globally absent
until complete transitive check; alternate paths may remain.

RUN81 restricted single-class separation and peer RUN52 are compatible
alternative local reductions, neither has a native receipt here.
Keep the original all-table detector in this batch to isolate exchange
propagation; combine singleton variant only after native replay.
No new scalar tests, no URT advantage, no global proof-size claim.
Static execution: actual three source blobs fetched, six declaration
blocks extracted, 16 exact unique replacements (including six names),
all six inverse edits restore original blocks byte-for-byte excluding
trailing whitespace. Original source statements retained literally
apart from new names; six native exact-type guards below PREPARED.
No new Lean execution, rh_scan/prune/reduce/auto or graph export here.
Cache key: compact source pin + exact statement + same D,j,theta
family + exact C2Combined object and all primitive inputs.

RESUME HERE: shared runner compile this file with authenticated
C2Combined and compact LiftVolumeHeight dependencies, check all six
type/direct-edge guards and #print axioms, then export the constructor-
inclusive original/replacement height graph to locate any alternate
old Carrier paths. No duplicate cold build; coordinate integration.
HANDOFF TO integration / native runner / audit. Root RH remains OPEN.
-/

noncomputable section

section Coset
seal Finset.univ Finset.sum Finset.prod
open NumberField Multiset Data Int Fintype Real WeilData Data.Pair Additive Function Matrix Sum
variable {P} {D : Data P}
attribute [local simp] Data.regroupEquiv Data.negIndex Data.detRows

lemma Data.run82_cosetKernelSum_eq_fNatural {P} {D : Data P} {a} [Fintype a] j : ∃ C, ∃ c : D.Twist → ℂ,
  ∀ ϑ, ‖c ϑ‖ ^ 2 = C / heckeValueProd j ϑ ∧ ∀ (u : Matrix _ a (D.untwistedModulus 2).ResRing) i g
  (w : Matrix a _ (D.untwistedModulus 2).ResRing), u * w = i.1 → fNatural j i g = c ϑ *
  cosetKernelSum (D.auxPair ϑ j) (bigChar ϑ j) w (.trans .inl .inl) (lineMultiplier ϑ j i) g := by
  have' hs : _ = blockSigns (.ofBijective (regroupEquiv j ∘ Sum.map (D.basisVec ∘ Fin.val (n :=
    D.posRank j)) inr ⊕ᵥ inr ∘ inl ∘ negIndex j) _) := _
  have e ϑ : bigChar ϑ j * WeilData.upsilonU1 ^ D.m = twistedChi ϑ j * carrierChar j := ?_
  have' := (run79_explicit_matching _ (.refl _) · 1 (posEquiv j) _ hs _ _ (DetIndex j))
  choose _ _ _ hK using this
  choose _ _ _ hM using run79_stdClassSum_carrierXi_eq_carrierForm D.E D.m_even
  repeat constructor
  refine fun ϑ ↦ let hν := (isTameFor_twistedChi j ϑ).mul (carrierChar_hasWeight ..); .symm ⟨fun u i
      g w H ↦ .symm (.trans ?_ (explicit_matching_of_sum _ _ hν (hM (isTameFor_twistedChi j _))
      (D.untwistedModulus 2) levelModulus_ideal_le _ fun _ _ h _ ↦ (hK _ hν
      (by simp [← card_detIndex_add_bigCharExp j]) (detRows j i.2) h (bigChar ϑ j) _ :).trans (by
    congr! <;> simp [← e, matchedPoly, pairedDetProd, letterMinor, ← mul_assoc, linePoly,
      prod_sigma, AlgHom.map_det, Matrix.map, ← Finset.prod_mul_distrib]
    congr! 4; omega; rw [← Fin.prod_const]; congr!
    repeat ext; simp [entrywise, inclMatrix, posRowIndex] <;> split <;> rfl))), ?_⟩
  simp_rw [@classSum_comm (Gf _ (BigIndex j)), ← mul_classSum]
  refine congrArg _ (.trans ?_ congr(stdClassSum _ fun _ ↦ _ * $(stdClassSum_rowStabilizer_eq hν (by
    rw [hs]; simpa [-regroupEquiv] using! realPairWeil_stackedDetProd _ _
      (funext (by simp [← card_detIndex_add_bigCharExp j])) (detRows j i.2) 1) (forgetTwist _) w
    (.trans .inl .inl) (F := fun y ↦ ∑ k : GL _ _, traceChar i.1 (y.map (forgetTwist _) * k.1))
    fun A a ↦ by simp [traceChar, Matrix.mul_assoc, trace_mul_comm (A.1.map _), ← H, a.2])))
  simp_rw [mul_classSum, @classSum_comm (Gf _ D.CarrierIndex), ← e,
    cosetKernelSum]; congr with h; clear * -
  change modKernelBilin (D.spaceW j) _ _ _ _ _ _ (columnDatum _ (forgetTwist _) _ _) (letterPoly _
    _ 1 (untwistedAuxPair j).colsPlus _) = _
  rw [pi_eq_sum_univ' (lineMultiplier ϑ j i h)]; symm
  simp [lineMultiplier, modKernelI, mul_classSum, ← classSum_sum, mul_left_comm (modKernel ..),
    mul_assoc, -mul_ite, ← Finset.mul_sum, mul_comm (modKernel (.sum ..) ..),
    ← modKernel_sum_left, -regroupEquiv]; congr!
  erw [← modKernel_reindex (regroupEquiv ..).symm ?_ (.refl _) rfl,
    ← map_sum ((modKernelBilin ..) _), modKernelBilin_apply]; congr! -closePost 1; rfl
  ext1; simp [GeneralLinearGroup.ext_iff, Space.reindex, Space.sum]
  rfl; grind [pow_sub_mul_pow, card_neg_signsW, auxPair]
  congr! 2; simp [lPlusDatum, ← ite_and]; congr
  simp [entrywise, inclMatrix, forall_and, -sum_sum_type]; tauto
  simpa [Prod.map_comp_map, ← comp_assoc, -regroupEquiv] using!
    stdClassSum_carrierXi_eq_lineMultiplier j _ inl (inr ∘ inr)
  apply G.ext_mat; simp [entrywise, Prod.ext_iff, funext_iff, U.sum]; iterate 3 aesop
  simp [← Complex.ofReal_pow, mul_pow, div_pow, heckeValueProd, places_modulus_eq_union, *,
    linePair, eSign, ← division_def,
    div_right_comm _ (_ * _), div_mul_div_comm]; with_reducible congr
  any_goals clear * -; apply_fun ofMul; simp [bigChar, liftChar, twistedChi, carrierChar, μ₀];
            match_scalars <;> grind [heckeCount]
  all_goals simp [↓card_rowIndex, ↓bijective_iff_injective_and_card, Injective, signsW, funext_iff,
    ↓Equiv.eq_comp_symm, apply_dite (padSigns j), basisVec]; grind [Equiv.injective, heckeCount]
end Coset

section Detection
open NumberField Multiset Data Int Fintype Real WeilData Data.Pair Additive Function Matrix Sum
namespace Data
variable {P : _} {D : Data P} {j : D.LiftIndex} (F : D.goodForms (D.spaceW j))

lemma run82_mul_fNatural_mem_rapidOfLevel_and_hol i : F * fNatural j i ∈ rapidOfLevel (D.spaceW j)
  (D.piGBar ^ 2) ∧ IsAdelicHol (orderW j) (conjHolWeight j - kernelWeight j) (fNatural j i) := by
  choose _ _ _ e using run82_cosetKernelSum_eq_fNatural (a := D.CarrierIndex) j
  simpa only [Pi.sub_def, conjHolWeight_eq_add_kernelWeight, add_sub_cancel_right, funext
    (e 1 1 i · _ i.1.one_mul), cosetKernelSum, classSum, finsum_eq_sum_of_fintype, Rat.smul_def,
    Finset.mul_sum, ← mul_assoc] using have G := D.fitsParams_auxPair ..; ⟨mul_sum_mem_rapidOfLevel
      fun _ ↦ mul_modKernel_mem_rapidOfLevel D.ideal_untwistedModulus_eq_span
    (goodForms_mem_rapidOfLevel F) _ _ _ ((auxPair ..).tame_eq_one · <|
      places_levelModulus.ge.mt ·), (.sum _ fun _ ↦ isAdelicHol_pairTheta
    (mem_holomorphicData_of_highestVector (e' := 0) (_ ∘ₗ _) (by simp [Injective, Fin.val_inj]) (by
      intros; erw [realPairWeil_fockLetters, star_mulVec]; simp [letterPoly, weylRep,
        ← mulVec_transpose, comp_def, conjTranspose_transpose])
      (letterPoly_highestVector_holomorphic isPosFirstOrder_orderW (paramW_lt_of_orderW_lt 1)
      (G.paramsCorrespond 1).2.1 (G.ord_eq 1) _ G.colsPlus_eq_zero).2) ·)⟩
end Data

open ComplexConjugate AuxPair Parameters
lemma Data.run82_eq_zero_of_integral_fNatural_tableTheta {P} {D : Data P} {j : D.LiftIndex} (F :
  D.goodForms (D.spaceW j)) (h : ∀ i ζ, ∫ g, conj (F.1.1 g * fNatural j i g) * tableTheta j ζ
  g ∂(D.spaceW j).quotMeasure = 0) : F = 0 := by
  obtain ⟨o, N, G, _, _, _, ε, C, M⟩ := @isPosFirstOrder_orderW _ D j, rank_bounds_card_bigIndex j,
    D.fitsParams_auxPair _ j, exists_fNatural_approx j
  have H : IsAdelicHol (orderW j) (conjHolWeight j) (star <| F.1.1 ·) := by
    obtain ⟨⟨_, e'⟩, _, J, k, _⟩ := (_ ∘ₗ _).surjective_of_injective
      ((LinearMap.self_comp_adjoint_injective_iff _).2 (D.auxLift_injective .one)) F.1,
      G.exists_isJointHarmonic
    erw [← e', (exists_theta_to_principalForms ..).choose_spec j.2]
    simpa [θ, AuxPair.conjKernel, classSum, Rat.smul_def] using! (.sum _ fun _ ↦
      isAdelicHol_pairTheta (mem_holomorphicData_of_highestVector (_ ∘ₗ _) (J · |>.gap.1)
      (realPairWeil_harmonicPoly _) (congr(polyVector _
      $k).substr (prod_mem_holomorphicData o paramW_lt_of_orderW_lt (J · |>.2) rfl).2)) ·)
  choose w6 w3 w2 w5 w4 using conjHolWeight_kernelWeight_bounds j
  choose lG hG using run82_mul_fNatural_mem_rapidOfLevel_and_hol F
  repeat apply Subtype.ext
  refine star_eq_zero.1 (by_contra (exists_near_max _ _ o (by grind only [HasHolGap, nStar_bounds])
    w6 D.le_of_hasLogBound D.le_of_hasLogBound (by simp [star_sqrtNegDInE]) (by simpa [NeZero.pos]
    using D.le_of_hasLogBound) (star_mem_rapidOfLevel (goodForms_mem_rapidOfLevel F (.mul_right ⟨_,
    D.piGBar_mul_star.symm⟩ (sqrtNegDInE ..)))) H · |> fun ⟨g, g0, g2, hl⟩ ↦
    ε.not_ge (isolation (by bound) D.le_of_hasLogBound D.le_of_hasLogBound o w2
    w3 w4 w5 w6 F.1.1.2.continuous.star H g0 g2 C fun I z a ↦ ⟨_, .sum _ (hG · _), (M _ (hl _
    a)).choose_spec, ((reproducing_formula_modKernel o D.ideal_untwistedModulus_eq_span
    nonempty_modulus_places _ (hasWeight_upsilonU1_pow _) (hasWeight_upsilonU1_zpow _) w2 I
    (by simp [N]; omega) .inl (letterPoly_highestVector_holomorphic o (paramW_lt_of_orderW_lt 1)
    (G.paramsCorrespond 1).2.1 (G.ord_eq 1) _ G.colsMinus_eq_zero) (fun _ ↦ fockLetters (D.signsW j)
    (untwistedAuxPair j).ord (-1) ∘ nablaBasis ℂ _ (untwistedAuxPair j).colsMinus)
    (by intros; erw [realPairWeil_fockLetters]; clear * -; aesop (add safe sum_mem,
    simp [toPoly, linearCombination_apply])) z).choose_spec _ (star_star F.1.1.1 ▸
    mul_sum_mem_rapidOfLevel lG :)).trans (Fintype.sum_eq_zero _ fun c ↦ ?_)⟩)))
  simp [mul_assoc, Finset.sum_mul]
  refine .inr ((integral_mul_sum_const_mul fun i ↦ (mul_assoc ..).subst
    (mul_modKernel_mem_rapidOfLevel D.ideal_untwistedModulus_eq_span (lG i) ..)).trans
    (Fintype.sum_eq_zero _ fun i ↦ mul_eq_zero_of_right _ ?_))
  let ⟨v, e'⟩ := range_toPoly.ge (prod_tableauPoly_mem_nabla : nablaBasis ℂ _ _ c.2 ∈ _)
  simpa [tableTheta, ← integral_conj, ← modKernelBilin_apply, apply_ite, letterPoly, e', mul_assoc,
    nablaBasis] using! congr(conj $(h i (Pi.single c.1 (star v))))
end Detection

section Comparison
open Finset Real ComplexConjugate Data WeilData Submodule Function.Embedding MeasureTheory LinearMap
  Fintype LevelPlaces AuxPair
variable {P} {D : Data P} (j : D.LiftIndex)
seal Subgroup.one levelSpace weylGauge
variable (ϑ : D.Twist)
attribute [local simp] apply_eq_evalForm map_classSum levelOf_le_Kf classSum
attribute [-simp] star_smul sum_ite_irrel ite_smul Sum.elim_inl isUnit_map_iff

lemma run82_inner_adjoint_comparisonForm {κ} (e : ∀ i g, D.fNatural j i g =
  κ * cosetKernelSum _ (bigChar ϑ j) ((splittingV j ϑ).stackOverGenScalar i.1)
  (.trans inl inl) (lineMultiplier ϑ j i) g) F ζ : conj κ * inner ℂ F ((D.goodLift ϑ j).adjoint
  (comparisonForm j ϑ ζ)) = Nat.card (splittingV j 1).congruenceGroup * D.gProd ^
  (splittingV j 1).loss * conj (lineScale j).1 * ∑ i, conj (glueLattice j 1 i).1.weilScalar *
  ∫ g, conj (F.1.1 g * D.fNatural j i g) * tableTheta j (ζ ⟨i, ·⟩) g ∂(D.spaceW j).quotMeasure := by
  obtain _ := rank_bounds_card_bigIndex j, D.card_V, D.m_eq_two_mul_varrho_add_two
  let V := splittingV j 1
  have k b h Q := star_mul' (_ * D.fNatural j b) _ ▸ star_mem_rapidOfLevel
    (mul_modKernel_mem_rapidOfLevel (T := stdSpace _ D.SmallIndex) (a := (untwistedAuxPair j).a)
    D.ideal_untwistedModulus_eq_span (hb := hasWeight_upsilonU1_zpow (D.m / 2 - j))
    (run82_mul_fNatural_mem_rapidOfLevel_and_hol F b).1 (Pi.single (inclMatrix _ inl) 1) Q (1, h))
  have i Y := Space.mem_levelSpace_formRep_iff.1 F.1.2 _ (mem_levelOf.2 ⟨(liftMod _).2,
    funext (V.reduceAt_liftMod_congruenceGroup Y)⟩)
  have R (x : (_ × _) × V.congruenceGroup) := (k x.1.1 x.1.2.out
    (letterPoly (D.signsW j) (untwistedAuxPair j).ord (-1) _ (star (ζ x.1)))).1.elim fun A r ↦
    (Space.integral_comp_mul_right (liftMod x.2.1) A.2 A.1).imp_right (·.2 (r.integrable A.1))
  erw [adjoint_inner_right, inner_auxLift, ← integral_const_mul]
  refine (congrArg _ (funext fun g ↦ ?_)).trans ((integral_finsetSum univ fun x _ ↦
    (R x).2.const_mul
    (D.gProd ^ V.loss * conj ((glueLattice j 1 x.1.1).1.weilScalar * lineScale j))).trans ?_)
  erw [comparisonForm_apply, map_smul, map_sum, Pi.smul_apply, Finset.sum_apply,
    funext fun _ ↦ DividedSplitting.theta_stdClassSum_productForm _ (glueLattice j ϑ _).2 ..]
  simp [*, mul_assoc, mul_sum, ← sum_prod_type', mul_left_comm (conj (F.1.1 _)),
    mul_left_comm _ (conj κ)]
  rfl
  simp [bigChar, bigCharExp, rankTwist, mul_assoc, ← zpow_natCast, ← zpow_add, *]; congr; omega
  simp [↓R, ↓integral_const_mul, @sum_prod_type _ _ V.congruenceGroup,
    @sum_prod_type _ _ D.SmallClasses, ← mul_sum, mul_assoc, mul_left_comm _ (conj (lineScale j).1)]
  left; congr!
  simpa [tableTheta, mul_assoc] using! (integral_mul_sum_const_mul (c := 1) fun _ ↦ k ..).symm

lemma run82_exists_comparison_forms : ∃ (γ : _ → ℂ) (A : Tables j →ₗ[ℂ] D.goodForms _) (gl : ∀ _, _
    →ₗ[ℂ] _), (∀ ϑ, γ ϑ ≠ 0 ∧ ‖γ ϑ / γ 1‖ ^ 2 = Data.heckeValueProd j ϑ / Data.heckeValueProd j 1) ∧
  (∀ ϑ : D.Twist, (D.goodLift ϑ j).adjoint ∘ₗ gl ϑ = γ ϑ • A) ∧ Function.Surjective A ∧ (∀ (ϑ :
  D.Twist) y, AuxPair.IsTested _ D.e₀ (D.goodLift ϑ j).rangeᗮ (gl ϑ (A.adjoint y))) ∧
  (∀ ϑ ζ l [Fact l.Prime] (φ : PadicPlace l), l.Coprime ϑ.levelNorm → (∀ a, weylGauge (ι :=
  ⟨φ.ιₚ.comp conj⟩) _ 0 a.2.out (star (ζ a)) ≤ 1) → gl ϑ ζ ∈ LevelForm.integralForms φ) ∧ ∀ ζ σ,
  smallHookNumber j * (gl 1 ζ).normSqAt σ ≤ exp (2 * (D.r * D.B₀)) * ∑ a, weylNormSq (σ ∘ ζ a) := by
  choose _ κ hn e using run82_cosetKernelSum_eq_fNatural (a := D.CarrierIndex ⊕ BigIndex j) j
  replace e ϑ i g := e ϑ (.fromCols 1 0) i g ((splittingV j ϑ).stackOverGenScalar i.1)
    (by erw [Matrix.fromCols_mul_fromRows, Matrix.zero_mul]; simp)
  have hκ ϑ : κ ϑ ≠ 0 := fun h ↦
    D.finrank_rows_ne_zero ((D.finrank_rows_eq_finrank_goodForms j).trans
    (finrank_zero_iff_forall_zero.2 (run82_eq_zero_of_integral_fNatural_tableTheta · (by simp [e ϑ, h]))))
  have U ϑ := run82_inner_adjoint_comparisonForm j ϑ (e ϑ)
  refine ⟨(conj <| κ 1 / κ ·), (D.goodLift _ j).adjoint ∘ₗ comparisonForm j 1, _, fun ϑ ↦ ?_,
    fun ϑ ↦ ext fun ζ ↦
    ext_inner_left ℂ fun F ↦ by simpa [inner_smul_right, hκ, field, mul_comm] using (U ϑ ..).trans
                                  (U 1 ..).symm, range_eq_top.1 (orthogonal_eq_bot_iff.1
    (bot_unique fun F m ↦ run82_eq_zero_of_integral_fNatural_tableTheta F fun i ζ ↦ ?_)),
    fun ϑ F _ _ _ Ξ m ↦ ?_, comparisonForm_mem_integralForms j, normSqAt_comparisonForm_le j⟩
  · simp; clear * - hn hκ
    grind [Complex.ofReal_eq_zero, norm_eq_zero]
  · have := (U ..).symm.trans (mul_eq_zero_of_right _
      (inner_eq_zero_symm.1 (m _ ⟨.toLp 2 fun b ↦ ite (b.1 = i) ζ 0 b.2, rfl⟩)))
    rw [Fintype.sum_eq_single i (by simp +contextual [tableTheta, ← modKernelBilin_apply])] at this
    simpa [(lineScale j).2.1, DividedLattice.weilScalar, NeZero.ne]
  · rw [← adjoint_inner_left, adjoint_inner_right, inner_eq_zero_symm]
    simpa [hκ, tableTheta_adjoint_eq_zero _ _ m] using U 1 F ((comparisonForm j ϑ).adjoint Ξ)
end Comparison

section Height
open Module ComplexConjugate Finset Function PolyRep IsAlgClosed LinearMap Matrix NumberField
  AuxPair Real Space LevelPlaces.LevelForm
namespace Data
variable {P} {D : Data P}
lemma run82_heightLe_liftVolume_ratio {θ} (O : D.IsFitFamily θ) (j : D.LiftIndex) :
  HeightLe (D.rowDim * (D.k * (D.logB * D.B₀ - D.dirCost))) fun ι ↦
  D.liftVolume 1 j / D.liftVolume (θ ι) j := (O.denominator_le j).elim fun β ⟨g, g'⟩ ↦ by
  rw [D.finrank_rows_eq_finrank_goodForms j, liftVolume, show TameChar.pow _ j =
    .one by rw [TameChar.pow]; congr <;> apply one_pow]
  obtain ⟨γ, A, gl, H, ad, sur, tst, int, S⟩ := run82_exists_comparison_forms j
  have d ϑ := finrank_range_of_inj (f := D.goodLift ϑ j) (by simp [auxLift_injective])
  replace tst ϑ y :=
    (A.adjoint.map_smul ..).trans congr($(adjoint_comp_eq_conj_smul (ad ϑ)) y).symm ▸ tst ϑ _
  let u (ϑ : D.Twist) := (compressedGramOp (smallHookNumber j) (D.goodLift ϑ j).range (gl ϑ)).det
  have V ϑ : _ * u ϑ = _ := adjoint_comp_eq_conj_smul (ad ϑ) ▸ d ϑ ▸ det_compressedGramOp _
  have T ϑ := right_ne_zero_of_mul ((V ϑ).trans_ne (by simp [H,
    normDet_eq_zero_iff_ker_ne_bot, ← orthogonal_range, range_eq_top.2 sur]))
  have sep ϑ z (h : (gl ϑ).adjoint z.1 = 0) :=
    ker_eq_bot'.1 (equivOfDetNeZero _ (T ϑ)).ker z (by simp [compressedGramOp, h])
  refine O.heightLe_of_eq_zpow_mul (.mul (y := fun ι ↦ u ((θ ι).powTwist j) / u 1) ⟨_, _,
    (_ : ℕ) * (D.r * β), T 1, d _ ▸ norm_det_compressedGramOp_arch_le (sep 1)
    (fun | ⟨_, y, rfl⟩ => tst 1 y) rfl S, fun ι ↦ ?_, .of_forall
    fun _ ↦ by simp [← mul_sum]; grw [g]; simp⟩ ((heightLe_inv_heckeValueProd_div O j).pow _))
    (by rw [← mul_add, ← mul_add]; gcongr; simpa [mul_sub, add_sub] using D.le_of_hasLogBound) fun ι
    n ↦ ⟨0, by
    have := div_ne_zero_iff.1 n; simp [← (H _).2, field, div_pow, V 1, *]
    erw [V ((θ ι).powTwist j)]; simp; ring⟩
  exact mul_div_cancel₀ _ (T 1) ▸ d _ ▸ norm_det_compressedGramOp_padic_le (sep _)
    (fun | ⟨_, y, rfl⟩ => tst _ y) ι (int _ · _ · (O.1 ι)) (g' ι).1
end Data
end Height

#print axioms Data.run82_cosetKernelSum_eq_fNatural
#print axioms Data.run82_mul_fNatural_mem_rapidOfLevel_and_hol
#print axioms Data.run82_eq_zero_of_integral_fNatural_tableTheta
#print axioms run82_inner_adjoint_comparisonForm
#print axioms run82_exists_comparison_forms
#print axioms Data.run82_heightLe_liftVolume_ratio

run_cmd do
  let entries : List (Lean.Name × Lean.Name × List Lean.Name × List Lean.Name) :=
    [(``Data.run82_cosetKernelSum_eq_fNatural, ``Data.cosetKernelSum_eq_fNatural,
       [``run79_explicit_matching, ``run79_stdClassSum_carrierXi_eq_carrierForm],
       [``explicit_matching, ``stdClassSum_carrierXi_eq_carrierForm]),
     (``Data.run82_mul_fNatural_mem_rapidOfLevel_and_hol, ``Data.mul_fNatural_mem_rapidOfLevel_and_hol,
       [``Data.run82_cosetKernelSum_eq_fNatural], [``Data.cosetKernelSum_eq_fNatural]),
     (``Data.run82_eq_zero_of_integral_fNatural_tableTheta, ``Data.eq_zero_of_integral_fNatural_tableTheta,
       [``Data.run82_mul_fNatural_mem_rapidOfLevel_and_hol], [``Data.mul_fNatural_mem_rapidOfLevel_and_hol]),
     (``run82_inner_adjoint_comparisonForm, ``inner_adjoint_comparisonForm,
       [``Data.run82_mul_fNatural_mem_rapidOfLevel_and_hol], [``Data.mul_fNatural_mem_rapidOfLevel_and_hol]),
     (``run82_exists_comparison_forms, ``exists_comparison_forms,
       [``Data.run82_cosetKernelSum_eq_fNatural, ``run82_inner_adjoint_comparisonForm,
        ``Data.run82_eq_zero_of_integral_fNatural_tableTheta],
       [``Data.cosetKernelSum_eq_fNatural, ``inner_adjoint_comparisonForm,
        ``Data.eq_zero_of_integral_fNatural_tableTheta]),
     (``Data.run82_heightLe_liftVolume_ratio, ``Data.heightLe_liftVolume_ratio,
       [``run82_exists_comparison_forms], [``exists_comparison_forms])]
  for (candidate, original, required, forbidden) in entries do
    let info ← Lean.getConstInfo candidate
    let old ← Lean.getConstInfo original
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq old.type info.type
    unless same do
      Lean.throwError "RUN82 type mismatch: {candidate}"
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "RUN82 lacks proof value: {candidate}"
    let deps := value.getUsedConstants
    for name in required do
      unless deps.contains name do
        Lean.throwError "RUN82 missing dependency {name} in {candidate}"
    for name in original :: forbidden do
      if deps.contains name then
        Lean.throwError "RUN82 retained forbidden dependency {name} in {candidate}"
    Lean.logInfo m!"C2_HEIGHT_CALLER: {candidate}: exact type and direct edges"
