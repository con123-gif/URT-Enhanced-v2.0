import New.Endgame.LongForms
import New.Heights.Heights
import Mathlib.Tactic
import Lib.General.LinearAlgebra.CommonEigenvectors
import C2ValueFamilyTransport
import Lean

/-!
RUN100 character boxes — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
RUN98 96facecd17078919cde0f0af70cc5d3d3aca8400, RUN99 221481b93bf8a5807227db6d9e20ab0d2243f8d4, RUN91 1bd5f9339e7a588439173ccb8be396f208cfb120.
Native FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825 defines
Data.B₀ := D.budget / (D.m * D.k). Magnitudes.lean
306fe7e22378322422d11b1f8415fcdac75ffd6e supplies r_add, hundred_mul_m_le_k,
k_pos, HasLogBound. AdmissibleData 04208a5044bb7cf6464ef142a14d939148bed834
defines budget, scale, x and b. Main 198ed5bf26aa294898931e0649bc2b88f1389f65 read, NOT imported.
Peer fixed-pair 5bde193f, selected-cost 265ffc21, C1 80fed923,
A2 393ed5ff inspected; no duplicate caller or cold build.

Cancel m*k*B0=B before estimating. With Q=logB, B=budget,
T=10m²x^999, E=m²t x^999, J=RUN98 chain budget,
    J=(3r/k+6)B+T.
Native r+1=k+m and 100m<=k imply r<=2k, and m,k,B>0.
Thus (3r/k+6)B<=12B. Independently T<=B, E<=B, b<=B, 15<Q:
with A=logX, ell=log Q, lower exponent B is Q+12A+3ell;
upper exponent T is 1000A+14, E is 1005A+12, b is Q.
Use Q>=10^12 A, A>=100ell, ell>=10^12 c, c>=64. Hence
    J+E+b<=15B<QB.
This proves RUN99's existing aggregate guard by cancellation and
four simple monomial comparisons rather than nested B0 exponent synthesis.
No new constant at the star. Same native D and fit family, exact C
statement bridge, no extra rank/sign assumptions, no new A/B/C1/C3 proof.
Standalone replay excludes pending rank-free AuditExactCompletion,
RUN96, RUN98, RUN99 and RUN91 modules. Copies only two archimedean bodies,
two exact lift declarations/definitions, and near-rank caller with fresh
names. Original star control byte-identical to source except name.
Preserve all earlier graphs and unresolved rank-free obligations.

Executed JS: 679380 exact cross-multiplied integer budget tests,
0 failures; 4/4 negative controls (each independently
drops one rank/cost guard); exact native original star round-trip.
These are scalar/source checks, not Lean. Local lean/lake absent;
git DNS failed. Fresh state RUN94 status 331a41d47b9ce746f010214e0614fee5716845c0
confirms ERROR; RUN97 C2 repair status 404 and jobs empty.
No new native rh_scan/prune/reduce/auto/frontier, graph, or axiom result.
Accepted C2ValueFamilyTransport receipt 413058eacfda8683f5fb28c68148fd45d1bf1770
remains prerequisite. No claimed RH theorem imported.

RESUME HERE: in the existing authenticated C2 workspace with LongForms
and C2ValueFamilyTransport, compile as C2NearRankNormalized; inspect
first actual diagnostic, then original statement and axiom guards.
Audit original/reduced constructor-inclusive C, ratio and star roots,
run rh_scan/rh_prune on actual declarations; retain indirect suppliers.
Do not launch a duplicate cold build. HANDOFF integration/kernel/audit.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Filter Finset Real

lemma run100_isAlgebraic_of_arch {x : ℂ} {c : ℝ}
    (h : ∀ σ : ℂ ≃+* ℂ, ‖σ x‖ ≤ c) : IsAlgebraic ℚ x := by
  obtain ⟨_, _, ⟨k⟩⟩ := (Polynomial.basisMonomials ℚ).1.injective.countable,
    ((Algebraic.countable ℚ ℂ).dense_compl ℂ).exists_mem_open
    (continuous_norm.1 _ isOpen_Ioi) (NormedField.exists_lt_norm ℂ c)
  simp [isAlgebraic_iff_not_injective] at *
  intro t
  obtain ⟨σ, hσ⟩ := exists_ringEquiv_extend (L := ℂ) rfl _ _ t k
  grind [by simpa using hσ .X]

open Filter Finset IntermediateField Module Real AdjoinSimple

lemma run100_heightLe_nonneg_arch {c : ℝ} (h : HeightLe c 1) : 0 ≤ c := by
  choose H _ _ d _ f _ g using by simpa [HeightLe] using h
  have := @NumberField.mk _ _ _ (adjoin.finiteDimensional
    (run100_isAlgebraic_of_arch d).isIntegral)
  have k {F c} [NormedField F] [CharZero F] [IsAlgClosed F] (e : _ = _)
      (h : ∀ ι : _ ≃+* F, ‖ι H‖ ≤ exp c) :=
      show ‖algebraMap ℚ F (Algebra.norm ℚ (gen ℚ H))‖.log / finrank ℚ ℚ⟮H⟯ ≤ c by
    grw [Algebra.norm_eq_prod_embeddings, norm_prod, prod_le_prod₀ _ fun σ _ ↦
      (exists_ringEquiv_extend e ℚ⟮H⟯.val σ.1).choose_spec ⟨H, _⟩ ▸ h _] <;>
      simp_all [finrank_pos.ne', prod_pos, Subtype.ext_iff]
  grw [← g _ le_self_add, ← k rfl d, ← sum_le_sum fun l h ↦ @Padic.eq_padicNorm l .. ▸
    @PadicAlgCl.norm_extends .. ▸ k (@mk_complex_eq_mk_padicAlgCl ..)
    (f ⟨⟨l, (mem_filter.1 h).2⟩, ·⟩)]
  simp [← sum_div, field]
  rw [log_product_formula (Nat.le_add_left ..), zero_div]


open Module ComplexConjugate Finset Function PolyRep IsAlgClosed LinearMap Matrix NumberField
  AuxPair Real Space LevelPlaces.LevelForm Submodule

namespace Data
variable {P} {D : Data P}

noncomputable def run100PerLiftBudget (D : Data P) : ℝ :=
  2 * (D.r * D.B₀) + D.r * D.B₀ + 10 * D.m * D.x ^ 999 + 6 * D.k * D.B₀

noncomputable def run100ChainBudget (D : Data P) : ℝ :=
  D.m * D.run100PerLiftBudget

lemma run100_heightLe_liftVolume_ratio_exact {θ} (O : D.IsFitFamily θ) (j : D.LiftIndex) :
  HeightLe (D.rowDim * (D.run100PerLiftBudget - D.k * D.dirCost)) fun ι ↦
  D.liftVolume 1 j / D.liftVolume (θ ι) j := (O.denominator_le j).elim fun β ⟨g, g'⟩ ↦ by
  rw [D.finrank_rows_eq_finrank_goodForms j, liftVolume, show TameChar.pow _ j =
    .one by rw [TameChar.pow]; congr <;> apply one_pow]
  obtain ⟨γ, A, gl, H, ad, sur, tst, int, S⟩ := exists_comparison_forms j
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
    (by rw [← mul_add, ← mul_add]; unfold run100PerLiftBudget; apply le_of_eq; ring) fun ι
    n ↦ ⟨0, by
    have := div_ne_zero_iff.1 n; simp [← (H _).2, field, div_pow, V 1, *]
    erw [V ((θ ι).powTwist j)]; simp; ring⟩
  exact mul_div_cancel₀ _ (T 1) ▸ d _ ▸ norm_det_compressedGramOp_padic_le (sep _)
    (fun | ⟨_, y, rfl⟩ => tst _ y) ι (int _ · _ · (O.1 ι)) (g' ι).1


lemma run100_heightLe_volume_ratio_sq_exact {θ} (o : D.IsFitFamily θ) :
    HeightLe (2 * D.rowDim *
      (D.run100ChainBudget - D.mainHeight + (D.m : ℝ)^2 * D.t * D.x^999))
      (fun ι ↦ D.𝔷 (1 : D.MFoldTwist)^2 / D.𝔷 (θ ι)^2) := by
  choose c const _ vol using D.volume_iota_eq_prod_liftVolume
  have lifts : HeightLe (D.rowDim * (D.run100ChainBudget - D.mainHeight))
      (∏ j ∈ Icc 1 D.m, fun ι ↦ D.liftVolume 1 j / D.liftVolume (θ ι) j) :=
    (HeightLe.prod fun j h ↦ by exact run100_heightLe_liftVolume_ratio_exact o ⟨j, mem_Icc.1 h⟩).mono
      (by apply le_of_eq; simp [run100ChainBudget, mainHeight, Nat.card_Icc] <;> ring)
      (fun _ ↦ le_rfl)
  have consts : HeightLe (2 * (D.m : ℝ)^2 * D.t * D.x^999)
      (fun ι ↦ (‖c (θ ι) / c 1‖ ^ 2 :)⁻¹) :=
    by simpa only [Nat.cast_mul, pow_two, mul_assoc, mul_left_comm, mul_comm] using const θ o
  exact ((lifts.pow 2).mul (consts.pow D.rowDim)).mono (by apply le_of_eq; ring) fun ι ↦
    (congrArg (‖ι.2 ·‖) (by simp [vol, mul_pow, div_pow, ← pow_mul]; ring)).le


lemma run100_chainBudget_normalized (D : Data P) :
    D.run100ChainBudget =
      (3 * ((D.r : ℝ) / D.k) + 6) * D.budget +
        10 * (D.m : ℝ)^2 * D.x^999 := by
  have hm : (0 : ℝ) < D.m := HasLogBound.pos D
  have hk : (0 : ℝ) < D.k := by exact_mod_cast D.k_pos
  simp only [run100ChainBudget, run100PerLiftBudget, Data.B₀]
  field_simp [hm.ne', hk.ne'] <;> ring

lemma run100_combined_budget_lt (D : Data P) :
    D.run100ChainBudget + (D.m : ℝ)^2 * D.t * D.x^999 + D.b <
      D.logB * D.budget := by
  have hk : (0 : ℝ) < D.k := by exact_mod_cast D.k_pos
  have hB : 0 < D.budget := HasLogBound.pos D
  have hrkN : D.r ≤ 2 * D.k := by
    have h1 := D.r_add
    have h2 := D.hundred_mul_m_le_k
    omega
  have hrk : (D.r : ℝ) ≤ 2 * D.k := by exact_mod_cast hrkN
  have hratio : (D.r : ℝ) / D.k ≤ 2 := (div_le_iff₀ hk).2 (by simpa [mul_comm] using hrk)
  have hmul : (3 * ((D.r : ℝ) / D.k) + 6) * D.budget ≤ 12 * D.budget :=
    mul_le_mul_of_nonneg_right (by linarith only [hratio]) hB.le
  have hT : 10 * (D.m : ℝ)^2 * D.x^999 ≤ D.budget := D.le_of_hasLogBound
  have hE : (D.m : ℝ)^2 * D.t * D.x^999 ≤ D.budget := D.le_of_hasLogBound
  have hb : D.b ≤ D.budget := D.le_of_hasLogBound
  have hQ : (15 : ℝ) < D.logB := D.lt_of_hasLogBound
  rw [run100_chainBudget_normalized]
  calc
    _ ≤ 15 * D.budget := by linarith only [hmul,hT,hE,hb]
    _ < _ := mul_lt_mul_of_pos_right hQ hB

variable {n} {y : Fin n → _} {δ V}
  (i : LinearIndependent ℂ y)
  (hn : (1 - 4 / D.b ^ 2) * D.rowDim ≤ n)
  (I : D.IndexLe y δ)
  (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i hn I hV in
lemma run100_integral_forms_long_near_rank :
    D.rowDim * (D.mainHeight - D.logB * D.budget) ≤ V + 2 * δ := by
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := c2_exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  have formula : 0 ≤ 2 * (V + 2 * δ + D.rowDim * D.b) +
      2 * D.rowDim * (D.run100ChainBudget - D.mainHeight +
        (D.m : ℝ)^2 * D.t * D.x^999) :=
    run100_heightLe_nonneg_arch ((((Data.heightLe_volume_rows i hn I hV o).pow 2).mul
      (Data.run100_heightLe_volume_ratio_sq_exact o)).mono le_rfl
      (by simp [field]; simp [(Z _).1]))
  have hbudget := (run100_combined_budget_lt D).le
  calc
    _ ≤ D.rowDim * (D.mainHeight - D.run100ChainBudget -
          (D.m : ℝ)^2 * D.t * D.x^999 - D.b) :=
      mul_le_mul_of_nonneg_left (by linarith only [hbudget]) (by positivity)
    _ ≤ _ := by linarith only [formula]

include i hn I hV in
lemma run100_integral_forms_long_original :
    D.rowDim * (D.mainHeight - 3 * (D.logB * D.budget)) ≤ V + 2 * δ := by
  have hL : 0 < D.logB * D.budget := HasLogBound.pos D
  calc
    _ ≤ D.rowDim * (D.mainHeight - D.logB * D.budget) :=
      mul_le_mul_of_nonneg_left (by linarith only [hL]) (by positivity)
    _ ≤ _ := run100_integral_forms_long_near_rank i hn I hV


end Data

/-- Source-matched New.Main star consumer, without importing New.Main. -/
lemma run100_star_sharp_error {P} {D : Data P} :
    D.m * D.remainder ≤ 2 * (D.logB * D.budget) + 4 * D.x ^ 99 +
      10 * log (1 + D.b ^ 2) * D.budget :=
  D.exists_family_covolumeSq_le.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  set h := D.mainHeight - D.m * D.remainder + L with def_h
  have crude : -h ≤ D.b ^ 2 * D.x ^ 99 := by
    grw [def_h, ← abs_mainHeight_add_remainder_le, ← neg_le_abs, ← le_abs_self,
      ← (HasLogBound.pos D : 0 < L)]
    simp
  have both : d * (D.mainHeight - L) ≤ d * (D.mainHeight - D.m * D.remainder + L + 4 *
    D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ d * h + (d - n) * -h + 2 * δ :=
      (Data.run100_integral_forms_long_near_rank i big I short).trans_eq (by ring)
    _ ≤ d * h + 4 / D.b ^ 2 * d * (D.b ^ 2 * D.x ^ 99) + 2 *
      (5 * d * log (1 + D.b ^ 2) * D.budget) := by
      grw [crude, index, show d - n ≤ 4 / D.b ^ 2 * d by linarith]
      exact sub_nonneg.2 (mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank : (n : ℝ) ≤
        D.rowDim)
    _ = _ := by rw [def_h]; field [exp_ne_zero]
  linarith [le_of_mul_le_mul_left both d0]

lemma run100_star_inequality {P} {D : Data P} :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  run100_star_sharp_error.trans D.le_of_hasLogBound

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

lemma run100_original_star_control {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  D.exists_family_covolumeSq_le.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  -- `d` is the dimension, `L = f a log⁴ b` the unit of error, `exp h` the bound per form
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  set h := D.mainHeight - D.m * D.remainder + L with def_h
  have crude : -h ≤ D.b ^ 2 * D.x ^ 99 := by
    grw [def_h, ← abs_mainHeight_add_remainder_le, ← neg_le_abs, ← le_abs_self,
      ← (HasLogBound.pos D : 0 < L)]
    simp
  have both : d * (D.mainHeight - 3 * L) ≤ d * (D.mainHeight - D.m * D.remainder + L + 4 *
    D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ d * h + (d - n) * -h + 2 * δ := (integral_forms_long i big I short).trans_eq (by ring)
                    -- the missing dimensions are a share `4 / b²`, and the index is small
    _ ≤ d * h + 4 / D.b ^ 2 * d * (D.b ^ 2 * D.x ^ 99) + 2 *
      (5 * d * log (1 + D.b ^ 2) * D.budget) := by
      grw [crude, index, show d - n ≤ 4 / D.b ^ 2 * d by linarith]
      exact sub_nonneg.2 (mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank : (n : ℝ) ≤
        D.rowDim)
    _ = _ := by rw [def_h]; field [exp_ne_zero]
  -- divide by `d`; `h_main` cancels
  calc D.m * D.remainder ≤ 4 * L + 4 * D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget := by
        linarith [le_of_mul_le_mul_left both d0]
    _ ≤ _ := D.le_of_hasLogBound

open Lean in
run_cmd do
  for (a,b) in #[
    (``Data.integral_forms_long, ``Data.run100_integral_forms_long_original),
    (``run100_original_star_control, ``run100_star_inequality)] do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless same && ai.levelParams == bi.levelParams do
      throwError "RUN100 statement changed: {a} -> {b}"
  for (n,required) in #[
    (``Data.run100_combined_budget_lt,
      #[``Data.run100_chainBudget_normalized,``Data.le_of_hasLogBound,``Data.lt_of_hasLogBound]),
    (``Data.run100_integral_forms_long_near_rank,
      #[``Data.run100_combined_budget_lt,``Data.heightLe_volume_rows,
        ``Data.run100_heightLe_volume_ratio_sq_exact,``c2_exists_isFitFamily,
        ``run100_heightLe_nonneg_arch]),
    (``Data.run100_integral_forms_long_original,
      #[``Data.run100_integral_forms_long_near_rank]),
    (``run100_star_sharp_error,
      #[``Data.exists_family_covolumeSq_le,``Data.run100_integral_forms_long_near_rank]),
    (``run100_star_inequality, #[``run100_star_sharp_error])] do
    let .thmInfo info ← getConstInfo n | throwError "RUN100 missing {n}"
    let deps := info.value.getUsedConstants
    unless required.all (fun a => deps.contains a) do
      throwError "RUN100 supplier missing {n}"
    for a in #[``Data.integral_forms_long,``Data.heightLe_volume_ratio_sq,``HeightLe.nonneg] do
      if deps.contains a then throwError "RUN100 stale direct supplier {a} at {n}"
  for n in #[``Data.integral_forms_long,``Data.run100_integral_forms_long_original,
      ``Data.run100_heightLe_liftVolume_ratio_exact,``Data.run100_heightLe_volume_ratio_sq_exact,
      ``Data.run100_chainBudget_normalized,``Data.run100_combined_budget_lt,
      ``Data.run100_integral_forms_long_near_rank,``run100_original_star_control,
      ``run100_star_inequality,``run100_heightLe_nonneg_arch] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN100 nonstandard axiom {n}: {axs}"
  logInfo "RUN100_NORMALIZED_NEAR_RANK_GUARDS_OK"
#print axioms Data.integral_forms_long
#print axioms Data.run100_integral_forms_long_original
#print axioms Data.run100_heightLe_liftVolume_ratio_exact
#print axioms Data.run100_heightLe_volume_ratio_sq_exact
#print axioms Data.run100_chainBudget_normalized
#print axioms Data.run100_combined_budget_lt
#print axioms Data.run100_integral_forms_long_near_rank
#print axioms run100_original_star_control
#print axioms run100_star_inequality
#print axioms run100_heightLe_nonneg_arch
