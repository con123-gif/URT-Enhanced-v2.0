import New.Rows.ComparisonForms

/-!
# RUN52 — finite-coordinate period detection and comparison form geometry
26 November 2026. HUMAN SOURCE-MATCHED; candidate native replay NOT COMPILED.
Compact dependency lane 13 (historical lane 12). Mission blob
23f64d503b7d64bb13b9667156b499021038d742. Parent checkpoint c7cde9ac0792c4158ce6a3f76edffe1ddc006192.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Latest manuscript blob 69030b2d01e9f0e786a004a21b6f0043ef84bc64.
Peer commits reviewed: 160380fe (pencil correction), bf254a7b (signed height),
4c55b565 (targeted verification), and latest branch commit summaries.
No duplicate work on signed heights or sieve.

## Source ledger
New/Rows/Separation.lean cbd60ebb20b771dc6107f3d54df0397ee7707e4d
  tableTheta, eq_zero_of_integral_fNatural_tableTheta.
New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a
  inner_adjoint_comparisonForm, tableTheta_adjoint_eq_zero,
  exists_comparison_forms, integrality and archimedean norm bounds.
New/Rows/NaturalFormNear.lean 2393479c4efe2c146f1251298992c00021cba4c8
  carrierForm_ne_zero, exists_fNatural_approx.
Lib/DiscreteSeries/Holomorphic/NearMaximum.lean dbbca26cdd462dedf352f136a493f43596ba68f1
  exists_near_max.
Lib/Weil/Fock/ReproducingFormula.lean b80ae30bd3a91d5d2c107aa662a612f0fba8bb6b
  reproducing_formula_modKernel.
New/Rows/MemberOrthogonality.lean aca8828d477a4510ab80964e1572f34ef220a2c1
  descentsVanish_hypSum, stdClassSum_period_eq_zero,
  DividedSplitting.stdClassSum_inner_productForm_eq_zero.
Lib/Shimura/ComplexTheta/PeriodVanishing.lean 0cdc82478a980a49506166275445304b76fdb530
  period_eq_zero.
New/Rows/CartanIntegrality.lean 6f1276b49ff736fb17fece1309ce6a3d2a75bb57
  norm_schur_inv_cols_le_weylGauge, weylGauge_cartanProduct_le.

## Connected human derivation (four blocks; original scale constants retained)

1. Reproducing functional and finite-coordinate testing. On the vector space
X of rapidly decreasing level-N functions, let L_(c,k) be integration
against the actual theta kernel at class c and polynomial Q_(c,k).
Let K_x(psi) be integration of psi(xh) against holMinorsPi. Native stable
range 2 dim W < dim V0, sharp local datum, level and highest vector
hypotheses imply ker L subset ker K_x: zero finite coefficients imply
zero entire lift by rational/level invariance and the compact-group
span of the polynomial orbit, and hence zero real convolution.
The last implication is the native realConv_eq_zero_of_lift_eq_zero.
Therefore K_x factors through im L in a finite dimensional coordinate
space, extends linearly to that space, and is a finite linear combination
of L_(c,k). This proves the exact linear-duality step of
reproducing_formula_modKernel, without a positive definite Gram matrix
or a second choice of lift. Neither stable range nor sharpness is
removed. The polynomial span is over the actual classes and Weyl
basis, not an arbitrary finite sampling of the adelic group.

For good F put J_i(zeta)=integral conj(F fNatural_i) tableTheta(zeta).
At each class c choose v_k with toPoly(v_k)=nablaBasis_k (the native
range_toPoly and prod_tableauPoly_mem_nabla supply this witness).
Then L_(c,k)(F fNatural_i)=conj(J_i(single(c,conj v_k))).
The conjugation and the actual class representative matter. Thus the
native detector needs only J_i(single(c,conj v))=0, rather than all
tables zeta. No linearity of a general integration of nonintegrable
functions is being assumed: the integrability of the actual products
is supplied by mul_fNatural_mem_rapidOfLevel_and_hol and
mul_modKernel_mem_rapidOfLevel. On finite combinations the vanishing
is exact, before taking any norm. The native proof uses this singleton
condition precisely once, at its last line. The original condition
implies the new one by specialization. This is a local proof-interface
reduction, not a claim that the original all-table statement is
mathematically inequivalent.

2. Detector contradiction. If F is nonzero, the holomorphicity of
conj F follows by representing F as an adjoint lift: the native
auxLift_injective gives surjectivity of its adjoint in finite
dimension, and the joint harmonic highest vectors give holomorphic
weight conjHolWeight. Rapid decay yields a near-maximal point g0 with
0<|F(g0)| and |F(g)|<=2|F(g0)|. At every point at least this large,
exists_near_max supplies the first-minimum bound for the actual
level and weight. With nu=nStar D, exists_fNatural_approx supplies
one bounded K0 and epsilon satisfying
  4 epsilon (5b)^(7nu) + epsilon < |K0(1)|.
For each allowed g separately, its native coefficients c_i(g) give
  |sum_i c_i(g) fNatural_i(gy) - K0(y)|
      <= maxOpNorm(y)^(6nu) epsilon.
Do not assume these coefficients are independent of g. At any
allowed center the linear reproducing identity of block 1 applied
to the rapidly decreasing finite sum of F times fNatural_i gives
zero convolution for every admissible test minor I. Indeed all
singleton periods vanish and the finite sums commute with integration.
Now the native isolation lemma (called with w2,w3,w4,w5,w6, o, g0,g2,
C and the approximation/reproducing witnesses) gives
  |K0(1)| <= 4 epsilon (5b)^(7nu)+epsilon,
contradiction. This reconstructs the detector assembly, not a proof
of isolation, the carrier approximation or the stable-range analytic
theorems themselves. Their exact parameter and weight bounds remain
essential. For near-maximum the source uses a short lattice vector,
isotropy forced by the integral form, a rank-one unipotent path and
the cusp Schwarz estimate; the factor 2 and quantitative first
minimum cannot be deleted on a compactness argument.

3. Geometric orthogonality for the SAME comparison map. Let Xi be in
the intersection of the good projector image, the split-place test
Hecke kernel, and the orthogonal complement of goodLift. The native
reflectionSum_mul_e0 kills Xi because its product with e0 is zero.
The theta descent of Xi is zero: the source identifies the projection
of the theta descent with the adjoint goodLift; the inner product
with every goodLift vector vanishes, and centrality/intertwining
moves the projector across the pairing. Do not assert that arbitrary
orthogonality to a restricted lift implies full descent vanishing
without this identity. The actual test Hecke polynomial kills Xi,
and the twist-place character is nontrivial by psi_ne_one. These are
the three hypotheses of descentsVanish_hypSum, which adds planes to
the descent under the strict 2r+2N+3<n rank guard. The proof applies
the native descentsVanish_of_reflectionSum then descentsVanish_add_planes
to each conjugated matrix coefficient. No independent test place
or fresh choice of Xi is introduced.

For the class-period step, use the native equivariant Cartan map
C=cartanProduct(y) composed with conjugation, and expand on a basis
of small-form values. The member-orthogonality source forms the
finite sum of the product theta kernel and the conjugated coefficient
of Xi, using one glued lattice. Off the chosen places the data remain
vacuum, by projection of the tensor product. The product theta
identity turns the lift to the hyperbolic block into a sum of
descents of those coefficients, all zero by the preceding step.
Apply period_eq_zero on the complementary block (with rational and
level invariance), unfold its quotient integral as the level class
sum, and cancel the nonzero theta-kernel multiplier chosen in the
source. This yields stdClassSum_inner_productForm_eq_zero. The local
Witt/gluing invariance and period_eq_zero analytic proof remain
separate genuine dependencies. Taking the adjoint inner product
against a table supported at one member i with entries the conjugate
kernel vectors at g expresses tableTheta_i(gl*Xi) as precisely the
sum of those zero class periods, hence zero for every i,g. This is
the source argument in tableTheta_adjoint_eq_zero, with the actual
principal level and class automorphism triviality retained.

4. Integrality and final comparison assembly. In CartanIntegrality,
lift the residue change-of-basis K to a compact integral matrix.
The gauge is unchanged by this level translation. Multiplying only
the exceptional columns S of the glued inverse by M clears its
denominator; the Schur functor of the diagonal correction has
operator norm bounded by |M|_p^{-sum_tau |S| sum_{h<l}kappa(tau,h)}.
This uses the tableau weight bound, not an entrywise bound on every
column. For the Cartan product of the two blocks, use the conjugate
embedding in the second factor; multiply the two norm bounds to
obtain |M|_p^{-loss} times the product of their gauges. With M=gProd,
the factor gProd^loss in comparisonForm cancels the loss exactly,
before the nonarchimedean triangle inequality on the class sum.
The lineScale bound and the input table gauge <=1 at the conjugate
embedding establish the actual local integrality at primes coprime
to the twist level. The source archimedean estimate at twist 1
uses square-root norm triangle inequalities, class-count and hook
bounds, and lineScale; its original exp(2r B0) remains unchanged.

Now apply the singleton detector to prove kappa_v != 0 from nonzero
good dimension and the same detector to the orthogonal complement
of A=u_1*gl_1: take the table supported at member i AND class c
with value conj v. The common period identity leaves only J_i at
that singleton, since the other members are zero. Its prefactor and
Weil scalar are nonzero, so J_i vanishes. The detector gives F=0,
hence A is surjective. RUN51's scalar adjoint descent, all local
integrality/size claims and testedness use the same gl, A, kappa.
The native caller replay below changes only these two detector calls.
No new premise, no loss of twist uniformity, no global deletion of
the old detector until independent replay.

## Original and candidate source role graph (not elaborated kernel graph)
Main.star -> C integral_forms_long -> heightLe_volume_ratio_sq ->
heightLe_liftVolume_ratio -> exists_comparison_forms.
Original detector (two calls, nonzero and surjection) -> Separation
proof -> near maximum, carrier approximation, isolation, reproducing
formula, Weyl basis lift, holomorphicity, rapid decay.
Candidate same edges except detector binder all tables -> singleton
tests; original-statement bridge included below.
Comparison -> tableTheta_adjoint_eq_zero -> member class sum ->
period_eq_zero + descentsVanish_hypSum -> reflection and added planes.
Comparison -> comparisonForm_mem_integralForms -> glued Cartan loss;
archimedean norm supplier unchanged. Same actual caller signature.
Context key (pin, D, j, F, i, c, v, role), and for vanishing additionally
twist, Xi, w, local guard; no cross-context cache alias. Original
graphs and prior axiom ledgers untouched. No new essential root
frontier obligation independently discharged.

## Execution
Source fetched at exact compact pin. Source transformation checked each
of 7 required exact substrings occurs once; changed only those
strings. This is a static source check, not Lean elaboration. Local
command -v lean and lake returned no path. Prior engine status JSON
fetched: pass/0 strip-root b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
prune 7da354941e402b6f8b364ed03d8c5c82d27b7717 (old toolchain only).
Compact targeted queue run 45799225653 observed in_progress; status
file not yet published (404). It checks other modules, NOT this
candidate. No new kernel/axiom evidence, no benchmark, no URT.
Shared runner only; do not launch competing jobs. Keep open frontier.
-/

noncomputable section
open NumberField Multiset Data Int Fintype Real WeilData Data.Pair Additive Function Matrix Sum
open ComplexConjugate AuxPair Parameters
open Finset MeasureTheory Submodule LinearMap LevelPlaces Function.Embedding
lemma Data.eq_zero_of_singleton_period_run52 {P} {D : Data P} {j : D.LiftIndex} (F :
  D.goodForms (D.spaceW j)) (h : ∀ i (c : D.SmallClasses) v, ∫ g, conj (F.1.1 g * fNatural j i g) * tableTheta j
  (Pi.single c (star v)) g ∂(D.spaceW j).quotMeasure = 0) : F = 0 := by
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
  choose lG hG using mul_fNatural_mem_rapidOfLevel_and_hol F
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
    nablaBasis] using! congr(conj $(h i c.1 v))


lemma Data.singleton_period_bridge_run52 {P} {D : Data P} {j : D.LiftIndex}
    (F : D.goodForms (D.spaceW j))
    (h : ∀ i ζ, ∫ g, conj (F.1.1 g * fNatural j i g) * tableTheta j ζ
      g ∂(D.spaceW j).quotMeasure = 0) : F = 0 :=
  Data.eq_zero_of_singleton_period_run52 F (fun i c v ↦ h i (Pi.single c (star v)))

section Comparison
variable {P} {D : Data P} (j : D.LiftIndex)
lemma exists_comparison_forms_run52 : ∃ (γ : _ → ℂ) (A : Tables j →ₗ[ℂ] D.goodForms _) (gl : ∀ _, _
    →ₗ[ℂ] _), (∀ ϑ, γ ϑ ≠ 0 ∧ ‖γ ϑ / γ 1‖ ^ 2 = Data.heckeValueProd j ϑ / Data.heckeValueProd j 1) ∧
  (∀ ϑ : D.Twist, (D.goodLift ϑ j).adjoint ∘ₗ gl ϑ = γ ϑ • A) ∧ Function.Surjective A ∧ (∀ (ϑ :
  D.Twist) y, AuxPair.IsTested _ D.e₀ (D.goodLift ϑ j).rangeᗮ (gl ϑ (A.adjoint y))) ∧
  (∀ ϑ ζ l [Fact l.Prime] (φ : PadicPlace l), l.Coprime ϑ.levelNorm → (∀ a, weylGauge (ι :=
  ⟨φ.ιₚ.comp conj⟩) _ 0 a.2.out (star (ζ a)) ≤ 1) → gl ϑ ζ ∈ LevelForm.integralForms φ) ∧ ∀ ζ σ,
  smallHookNumber j * (gl 1 ζ).normSqAt σ ≤ exp (2 * (D.r * D.B₀)) * ∑ a, weylNormSq (σ ∘ ζ a) := by
  choose _ κ hn e using cosetKernelSum_eq_fNatural (a := D.CarrierIndex ⊕ BigIndex j) j
  replace e ϑ i g := e ϑ (.fromCols 1 0) i g ((splittingV j ϑ).stackOverGenScalar i.1)
    (by erw [Matrix.fromCols_mul_fromRows, Matrix.zero_mul]; simp)
  have hκ ϑ : κ ϑ ≠ 0 := fun h ↦
    D.finrank_rows_ne_zero ((D.finrank_rows_eq_finrank_goodForms j).trans
    (finrank_zero_iff_forall_zero.2 (eq_zero_of_singleton_period_run52 · (by simp [e ϑ, h]))))
  have U ϑ := inner_adjoint_comparisonForm j ϑ (e ϑ)
  refine ⟨(conj <| κ 1 / κ ·), (D.goodLift _ j).adjoint ∘ₗ comparisonForm j 1, _, fun ϑ ↦ ?_,
    fun ϑ ↦ ext fun ζ ↦
    ext_inner_left ℂ fun F ↦ by simpa [inner_smul_right, hκ, field, mul_comm] using (U ϑ ..).trans
                                  (U 1 ..).symm, range_eq_top.1 (orthogonal_eq_bot_iff.1
    (bot_unique fun F m ↦ eq_zero_of_singleton_period_run52 F fun i c v ↦ ?_)),
    fun ϑ F _ _ _ Ξ m ↦ ?_, comparisonForm_mem_integralForms j, normSqAt_comparisonForm_le j⟩
  · simp; clear * - hn hκ
    grind [Complex.ofReal_eq_zero, norm_eq_zero]
  · have := (U ..).symm.trans (mul_eq_zero_of_right _
      (inner_eq_zero_symm.1 (m _ ⟨.toLp 2 fun b ↦ ite (b.1 = i) (Pi.single c (star v)) 0 b.2, rfl⟩)))
    rw [Fintype.sum_eq_single i (by simp +contextual [tableTheta, ← modKernelBilin_apply])] at this
    simpa [(lineScale j).2.1, DividedLattice.weilScalar, NeZero.ne]
  · rw [← adjoint_inner_left, adjoint_inner_right, inner_eq_zero_symm]
    simpa [hκ, tableTheta_adjoint_eq_zero _ _ m] using U 1 F ((comparisonForm j ϑ).adjoint Ξ)

end Comparison

#print axioms Data.eq_zero_of_singleton_period_run52
#print axioms Data.singleton_period_bridge_run52
#print axioms exists_comparison_forms_run52

/-!
RESUME HERE: Replay the three declarations in the shared compact
environment (import ComparisonForms, not Main); after native validation
substitute exists_comparison_forms_run52 in LiftVolumeHeight and combine
with RUN51 only after auditing both. Next reconstruct the actual
isolation and descentsVanish_add_planes suppliers, not another scalar
reparametrization. Track their precise analytic/rank/level premises.
HANDOFF TO: integration, human editor, theta, formal audit, kernel extractor.
-/
