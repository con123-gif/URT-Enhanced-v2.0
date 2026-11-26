import New.Endgame.LongForms

/-!
# RUN51 — common packet spanning, transfer and comparison-form descent for C
26 November 2026. HUMAN SOURCE-MATCHED / candidate executable Lean replay.
Current mission blob 23f64d503b7d64bb13b9667156b499021038d742, latest workload
amendment: work on connected supplier chains. Compact dependency lane 13
(historical lane 12). Prior checkpoint 03751400b2c0e697455b7da79e23c0eb96535451.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Source blobs:
New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88;
New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1;
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14;
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05;
New/Trace/GoodFormTransfer.lean 464999652ab3053d94e62b0da003053ed5820d41;
New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a;
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65.
Mission, AGENTS, continuity, protocol, handoff, current manuscript and
peer commits d18891b2, 28039ee4, fcd5da81, bd1a2355, 93d92f63, ae843a52,
025426f9 reviewed (commit summaries for some, full or partial diff for
four); in particular do not duplicate the shared determinant assembly
already in manuscript section 6d/6e or the peer acceleration graph.

## Connected human proof (four intermediate mechanisms, original constants)

1. Packet spanning. Fix the actual D, lift index j and tame twist v.
Write W for principal forms on W_j, P_c for the group-algebra action of
tupleIdem(c), and P for the action of e0. By the native definition
e0 = sum of the good tuple idempotents. Orthogonality gives
P P_c = P_c (the source range_tupleIdem_le also uses the centrality of P).
Thus im P_c lies in im P = goodForms. Each group-algebra action preserves
each Hecke eigenspace E_q by principalRep_mem_eigenPart. Decompose any
good y into Hecke eigencomponents using iSup_eigenPart; each such component
is again good because the projector preserves each component. Equivalently,
write a good y as P y0 and first decompose y0 into eigencomponents, so no
assumption about distributivity of arbitrary intersections is needed.
On one eigenspace P y0 = sum_c P_c y0. For u = auxLift(v,j),
groupAlgAction_auxLift gives u(P_c y0) = P'_c u(y0); hence the lifted
summand is in im P'_c, and P_c y0 is good and in E_q. This proves
im goodLift(v,j) is spanned by the lifted good tuple/eigen packets.
The opposite inclusion holds because each packet is the lift of a good
vector. No uniqueness of decompositions, nonzero packet assumption, or
orthogonality of the target subspace N is required. Thus it suffices to
check membership in ANY linear subspace N only on these packets. The
certificate below extracts the reusable cover and applies it to BOTH
actual callers, not assuming that the target N or the twist is the same.

2. Transfer of Hecke packet support. In GoodFormTransfer L56-118 the native
trace theorem equates traces for every Hecke algebra element on the two
good spaces with rigid labels and gap hypotheses. Take the finite union
F of the two occurring Hecke systems (as in trace_heckeOnGood_eq).
The native exists_hecke_proj_eigenPart supplies pi_q acting as identity
on q and zero on the other members of F; both good spaces are stable
under this Hecke algebra. Its restriction to either good space is an
idempotent, with image the intersection goodForms ∩ E_q, by the same
eigenspace decomposition. Its trace is exactly the integer dimension
of that intersection (basis of image plus basis of kernel).
Trace equality at pi_q therefore gives equality of packet dimensions,
including zero, without a determinant or power-trace computation.
In particular the nonzero packet needed at FitTwistsExist L60 on W_j
occurs on Y0, so the finite catalogue of Y0 eigensystems suffices.
This is a human alternative derivation of the native support transfer;
the executable replay retains the original goodForms_inf_eigenPart_eq_bot
until a separate Lean proof of the trace alternative is audited.
The rigid-label and actual trace theorem are retained, not proved by
this linear algebra.

3. Common Rallis operator. In GoodFormTransfer L27, take the product of
the two finite-dimensional Hecke modules in the ACTUAL common algebra,
then map a common Hecke element p to the pair of sesquilinear kernels
(a<z,p_V y>, a'<z,p_V' y>). This is a complex linear map on the finite
dimensional image of the Hecke algebra (the algebra itself need not be
finite dimensional). For each double-coset summand the source constructs
one common averaged operator with the finite-index denominator
card(H\chosenLevel) and the native supported conjugate cosets. It acts
on both spaces; the same coefficients and coset representative must be
used. Thus each pair of summands is in this finite-dimensional linear
image. It is closed in the ambient Hausdorff topological vector space
(the source uses pointwise Pi topology). Convergence of the paired
HasSum therefore places (B,B') in the image, and taking a preimage gives
one p simultaneously. No exchange of separate limits or independent
choice of p_V and p_V' is needed. The native summand identity, Haar/coset
normalizations, support and convergence are still required. This
translates the closed-image step of exists_common_hecke_rallis and shows
why it supplies the same p to the row-volume and individual-lift Gram
operators in RowVolume L42. Equal traces imply equal characteristic
polynomials by Newton identities in characteristic zero (including
dimension from trace of identity), hence equal determinants, exactly the
native det_heckeOnGood_eq used at RowVolume L55. The actual trace formula
and rigid-label inputs remain genuine dependencies.

4. Comparison-form descent. In ComparisonForms L200-227 put
u_v=goodLift(v,j), gl_v=comparisonForm(j,v), and kappa_v as in
cosetKernelSum_eq_fNatural. Its equality gives kappa_v != 0: otherwise
fNatural is zero and eq_zero_of_integral_fNatural_tableTheta would force
every good form to vanish, contrary to the native positive row dimension
and transfer equality. The actual inner_adjoint_comparisonForm says
conj(kappa_v)<F,u_v* gl_v z> = J(F,z), where J is the SAME sum of
weighted periods on the untwisted space for all v. The fixed class
multiplicity, gProd loss, lineScale and lattice Weil scalars are in J.
Subtract the corresponding identity at 1, and use nondegeneracy in F:
u_v* gl_v = gamma_v A, gamma_v=conj(kappa_1/kappa_v),
A=u_1* gl_1. The native norm-ratio formula for kappa yields
|gamma_v/gamma_1|²=heckeValueProd(j,v)/heckeValueProd(j,1).
For surjectivity, if F is orthogonal to range A then J(F,z)=0 for
all z. Choose tables supported at one member i: only the i-th period
survives. The fixed prefactor and each Weil scalar are nonzero by the
native construction. Thus every integral in the detection criterion
eq_zero_of_integral_fNatural_tableTheta vanishes, forcing F=0.
In finite dimensions this implies range A is the whole good space.
For the tested condition take Xi in the intersection of im P', the
kernel of the split-place test Hecke polynomial and (im u_v)^perp.
The native tableTheta_adjoint_eq_zero implies every tableTheta_i of
gl_v* Xi vanishes. Substitute that table in J(F,·) at twist 1:
<F,A gl_v* Xi>=0, equivalently <gl_v A* F,Xi>=0 (conjugate if the
inner-product convention requires). This gives exactly the required
IsTested statement, for all native test places. The integrality at all
p prime to the twist conductor and all-conjugate size bound come from
comparisonForm_mem_integralForms and normSqAt_comparisonForm_le, not
from the scalar comparison. Those bounds and the period detection and
vanishing lemmas remain explicit. This completes the common adjoint
descent argument conditional on its native geometric inputs, not the
full comparison-form construction. It fits directly in the already
translated compressed Gram determinant ratio, without changing the
original Selmer or height estimates.

## Source application DAG, not kernel coverage
Main L121 star -> C integral_forms_long (L134; same y,I,V from A+B).
C -> exists_isFitFamily D -> range_goodLift_le [D,v=chosen power,j,N=span
of apt lifted rows with Selmer conditions] (FitTwistsExist L57).
C -> heightLe_volume_ratio_sq -> heightLe_liftVolume_ratio [D,theta,j]
 -> norm_det_compressedGramOp_arch_le [D,v=1 in actual call,j,N=test
cut] -> range_goodLift_le [D,1,j,N] (LiftVolumeHeight L90).
C -> volume_iota_eq_prod_liftVolume -> exists_common_hecke_rallis,
det_heckeOnGood_eq, triangle factor and nonzero chain volume.
FitTwistsExist -> goodForms_inf_eigenPart_eq_bot -> det_heckeOnGood_eq
-> trace_heckeOnGood_eq. Candidate HUMAN alternative for that local edge:
go directly from trace at the common spectral projector; actual Lean
replay retains original edge pending proof. Do not globally delete the
determinant transfer, still used in volume factorization.
LiftVolumeHeight -> exists_comparison_forms -> adjoint period identity,
detection, tableTheta vanishing, norm-ratio, local integral and size.
Both packet calls now go to packet_range_run51 -> packet_span_cover_run51
[D,v,j] and then target-specific membership. Only the latter proof may
be shared if the whole context including N matches. Cache source pin,
toolchain, D, v, j, target, theorem role. Distinct targets cannot share
certificates merely because their source names coincide.
All old obligations, original graph and axiom records retained. No
new essential root frontier discharge claimed.

## Execution record
Exact source strings fetched at pin. JS generated caller replay by
checking every substitution occurs exactly once and copying all other
native body text unchanged. Counts are source checks, not elaboration.
11 exact single-occurrence checks: lemma exists_isFitFamily = 1; D.range_goodLift_le = 1; lemma norm_det_compressedGramOp_arch_le = 1; D.range_goodLift_le = 1; lemma heightLe_liftVolume_ratio = 1; norm_det_compressedGramOp_arch_le (sep 1) = 1; lemma Data.heightLe_volume_ratio_sq = 1; heightLe_liftVolume_ratio o = 1; lemma Data.integral_forms_long = 1; exists_isFitFamily D = 1; heightLe_volume_ratio_sq o = 1.
Native Lean and Lake absent (command -v returned no path for either).
Old engine status JSON fetched and status=pass, returncode=0:
strip-root blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
proof-term prune blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
These belong to old 4.33.1 environment and do NOT verify this compact
candidate. No new native PASS, no kernel/axiom export, no URT.
Source scanning is linear in text length per fixed pattern; no timing or
memory benchmark performed. No competing job or protected changes.
Run lake env lean on this file in the shared pinned compact runner;
the candidate imports LongForms only, not New.Main or the final theorem.
-/

open Finset Fint LinearMap Module Submodule

namespace Data
variable {P} (D : Data P)

/-- The exact lifted spectral packets used by the two native C suppliers. -/
def packetImages_run51 (ϑ : D.Twist) (j : D.LiftIndex) :
    Set (D.auxPair ϑ j).FormV :=
  {z | ∃ p, ∃ y ∈ D.goodForms _ ⊓ D.eigenPart _ p,
    ∃ c ∈ D.goodTupleFamilies,
      D.auxLift ϑ j y ∈ (AuxPair.groupAlgAction _ (tupleIdem _ c)).range ∧
      z = D.auxLift ϑ j y}

/-- Target-independent packet span cover, using the native decomposition. -/
lemma packet_span_cover_run51 (ϑ : D.Twist) (j : D.LiftIndex) :
    (D.goodLift ϑ j).range ≤ span ℂ (D.packetImages_run51 ϑ j) := by
  erw [range_domRestrict, ← range_comp, range_le_iff_comap, eq_top_iff, ← iSup_eigenPart,
    iSup_le_iff]
  simp_intro p y a [e₀]
  exact sum_mem fun c k ↦ subset_span ⟨p, _, ⟨D.range_tupleIdem_le k ⟨y, rfl⟩,
    principalRep_mem_eigenPart _ _ a _⟩, c, k, ⟨_, (D.groupAlgAction_auxLift y).symm⟩, rfl⟩

/-- Original native criterion, recovered from one common packet cover. -/
lemma packet_range_run51 {ϑ} {j : D.LiftIndex} {N}
    (h : ∀ p, ∀ y ∈ D.goodForms _ ⊓ D.eigenPart _ p,
      ∀ c ∈ D.goodTupleFamilies,
        D.auxLift ϑ j y ∈ (AuxPair.groupAlgAction _ (tupleIdem _ c)).range →
        D.auxLift ϑ j y ∈ N) :
    (D.goodLift ϑ j).range ≤ N := by
  refine (D.packet_span_cover_run51 ϑ j).trans (span_le.2 ?_)
  rintro z ⟨p, y, hy, c, hc, hz, rfl⟩
  exact h p y hy c hc hz

end Data

section Fit
open Submodule Data Polynomial Multiset Finset Real
lemma exists_isFitFamily_run51 {P} (D : Data P) : ∃ θ, D.IsFitFamily θ := by
  choose R' F' using fun {ℓ} {_ : ThePrime ℓ} {ι : PadicIso ℓ} (p : {p : D.Pair × D.LiftIndex //
    p.1.IsRankOne p.2}) ↦ exists_row_for_all_twists ι (isApt_rank_one 1 p.2) 1 (fun _ ↦ {0}) 1 (by
    have := (@isFiniteTypeAt_char ℓ _ _ D.E _ _ · 1 Unit _ _ continuous_one (by simp))
    simp_rw [← C_1]
    use! continuous_one <;> simp_all [IsTraceNondeg, Matrix.trace, ← Matrix.ext_iff, IsLabelledAt,
      ↓aroots_X_sub_C, isGoodAt_iff]) (by simp) (by use ?_, ?_, ⟨p.1.2, ?_⟩ <;> simp [← cons_zero,
         countP_cons] <;> grind [Pair.IsRankOne,
    Int.units_natAbs, !(D.nat_lt_of_hasLogBound : 2 * D.h₂ ^ 2 + D.t < D.w _ _)])
  choose R F using fun {ℓ} {_ : ThePrime ℓ} {ι} (a : _ × (D.finite_eigenPart _
    (D.goodForms _)).toFinset) ↦ exists_hasRow_auxPair ι ((Set.Finite.mem_toFinset _).1 a.2.2) a.1
  choose τ H using fun κ : PrimePadicIso ↦ @exists_mFoldTwist_selmerLengthLe _ D κ.1 ⟨⟩ ⟨κ.2⟩ _ _
    (·.getRight?.map 0 |> @RowBlockIndex _ 1) _
    (Sum.rec _ _) (Sum.rec (⟨_, F · |>.1⟩) (⟨_, F' · |>.1⟩)) ⌊D.r * rowBudget D κ.1⌋₊.succ
  choose s s' using fun T (hT : ∀ l ∈ T, Nat.Prime l) ↦ show ∑ l ∈ T, rowBudget D l * log l ≤ D.B₀ ∧
      ∑ l ∈ T, 9 * crudeUnit l D * log l ≤ D.x ^ 999 by -- the budgets, summed over the primes
    clear * - hT
    have L {a} : ∑ l ∈ T, padicValNat l a * log l ≤ log⁺ a := by grw [log_of_nat_eq_posLog,
      log_nat_eq_sum_factorization, Finsupp.sum_of_support_subset _ subset_union_right,
      ← T.subset_union_left] <;> simp_all [Nat.factorization_def]
    push_cast [rowBudget, _root_.loss, lambdaLoss, crudeUnit, add_mul, @mul_assoc ℝ,
      sum_add_distrib, ← mul_sum]
    grw [L, sum_le_sum fun _ _ ↦ by grw [mul_comm, log_le_self (by simp)], sum_le_hasSum _ (by simp)
      (hasSum_coe_mul_geometric_of_norm_lt_one (by bound)), L, (exists_length_shaOdd_le
      ..).choose_spec.2.1, classNumber_le, L, L, prod_le_prod' (by simp; tauto), prod_const,
      Nat.card_Ioc, tsub_tsub_le_tsub_add, add_tsub_cancel_left]
    push_cast [↓log_of_nat_eq_posLog, sub_half, Nat.cast_natAbs, abs_discr_eq_rootDiscr_pow,
      finrank_eq_two_mul_card_infinitePlace]
    any_goals exact neg_one_lt_zero.le.trans (Nat.cast_nonneg _)
    exacts [⟨add_halves D.B₀ ▸ add_le_add D.le_of_hasLogBound D.le_of_hasLogBound,
      D.le_of_hasLogBound⟩, D.nat_le_of_hasLogBound, D.algebraMap_mem_cycloField]
  use τ, fun κ ↦ (@coprime_q_of_isAuxiliary _ _ _ ⟨⟩ _ (H κ ⟨1, .refl,
    D.nat_le_of_hasLogBound⟩).1.1).1, fun j ↦ ⟨_, s, fun κ ↦
    have := ThePrime.mk; ⟨denominatorLe_rowBudget _ _ (H ..).1 (D.packet_range_run51 fun q y a c k
      m ↦ dite (y = 0) (by simp [·]) (subset_span ⟨⟨⟨y, a.1⟩, rfl⟩,
      ⟨c, m, isApt_auxPair D _ j k, D.range_tupleIdem_le k⟩, _, D.lifts_auxLift _ a.2, _, _,
      F ⟨j, q, by simpa using mt (D.goodForms_inf_eigenPart_eq_bot (D.hasRigidLabels_spaceW j)
      (D.hasRigidLabels_spaceW ⟨_, D.nat_le_of_hasLogBound, .refl⟩) · |>.le a) ·⟩, by simp [auxPair,
      liftChar, twist_one_spec], (H ..).2.1 (.inl _)⟩)), fun p h ↦ denominatorLe_rowBudget _ _
      (H ..).1 (span_mono (forall_eq.2 ⟨by simp, ⟨_, trivialLift_mem_range_tupleProj_rank_one _ h,
      isApt_rank_one _ h, le_rfl⟩, _, LValueData.auxPair_lifts_trivialLift _, _, _, F' ⟨(p, j),
      h⟩, by simp [twist_one_spec], (H ..).2.1 (.inr _)⟩))⟩⟩, (.of_le s' fun _ ↦ H _ · |>.2.2 · · ·)
end Fit

section Height
open Module ComplexConjugate Finset Function PolyRep IsAlgClosed LinearMap Matrix NumberField
  AuxPair Real Space LevelPlaces.LevelForm

variable {T U V} [NormedAddCommGroup T] [InnerProductSpace ℂ T] [Module.Finite ℂ T]
  [NormedAddCommGroup U] [InnerProductSpace ℂ U] [Module.Finite ℂ U] [NormedAddCommGroup V]
  [InnerProductSpace ℂ V] [Module.Finite ℂ V] {gl : T →ₗ[ℂ] V} {u : U →ₗ[ℂ] V} {A} {γ : ℂ} (k : ℂ)
namespace Data
variable {P} {D : Data P} {j : D.LiftIndex} {ϑ : D.Twist} {gl : Tables j →ₗ[ℂ]
  (D.auxPair ϑ j).FormV} {L : Submodule ℂ _} {β} (sep : ∀ z : L, gl.adjoint z = 0 → z = 0)
  (tst : ∀ (z : SubmoduleElem L), (D.auxPair ϑ.toTameChar j).IsTested D.e₀ Lᗮ (gl ((adjoint gl) z)))
include sep tst in
lemma norm_det_compressedGramOp_arch_le_run51 (e : L = (D.goodLift ϑ j).range) (S : ∀ ζ σ,
  smallHookNumber j * (gl ζ).normSqAt σ ≤ exp β * ∑ a, weylNormSq (σ ∘ ζ a)) (σ : ℂ ≃+* ℂ) : ‖σ
  (compressedGramOp (smallHookNumber j) L gl).det‖ ≤ exp (finrank ℂ L * β) := by
  erw [← place_apply σ.toRingHom, End.det_eq_prod_roots_charpoly_of_splits (splits _), exp_nat_mul,
    map_multiset_prod, ← charpoly_natDegree, ← card_roots_eq_natDegree]
  refine Multiset.prod_map_le_pow_card (by simp) fun α h ↦ ((End.hasEigenvalue_iff_isRoot_charpoly
    ..).2 (Polynomial.mem_roots'.1 h).2).exists_hasEigenvector.elim fun z h ↦ ?_
  obtain ⟨w, hw, t⟩ := (frequently_isSplit_notMem_places (D.auxPair ϑ j)).exists
  let ζ := gl.adjoint z
  have := congr(‖σ (inner ℂ (gl (.toLp 2 (star ∘ σ.symm ∘ star ∘ σ ∘ ζ ·)))
    ($h.apply_eq_smul).1)‖).ge
  simp [compressedGramOp, ← adjoint_inner_right gl _ z, ← le_div_iff₀'] at this S
  grw [show σ (inner ..) = ∑ i, weylNormSq (σ <| ζ i ·) by simp [ζ, inner, coe_weylNormSq,
    dotProduct, mulVec, mul_comm (conj _)], norm_map_inner_le, normSqAt_starProjection_le _ hw t
    D.isCentralProj_e₀ (e ▸ D.packet_range_run51 fun _ _ a _ k m ↦ ⟨D.range_tupleIdem_le k m,
    heckePolyOnForms_testValue_eq_zero _ _ (D.lifts_auxLift _ a.2)⟩) (tst z), S, S] at this
  simpa [ζ, comp_def, abs_of_pos, field, ↓Complex.norm_real, le_of_lt, (sum_pos' (by simp)
    ((not_forall.1 (h.2 ∘ sep z ∘ PiLp.ext)).imp (⟨mem_univ ·,
    weylGram_posDef.re_dotProduct_pos <| by simpa [funext_iff, SmallFormValues] using! ·⟩)) : 0 <
    ∑ i, weylNormSq (σ <| ζ i ·)), exp_pos] using this

lemma heightLe_liftVolume_ratio_run51 {θ} (O : D.IsFitFamily θ) (j : D.LiftIndex) :
  HeightLe (D.rowDim * (D.k * (D.logB * D.B₀ - D.dirCost))) fun ι ↦
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
    (_ : ℕ) * (D.r * β), T 1, d _ ▸ norm_det_compressedGramOp_arch_le_run51 (sep 1)
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

section Endgame
open Finset LinearMap Real Submodule LevelPlaces.LevelForm
variable {P} {D : Data P} {n} {y : Fin n → _} {δ V} (i : LinearIndependent ℂ y) (hn :
  (1 - 4 / D.b ^ 2) * D.rowDim ≤ n) (I : D.IndexLe y δ) (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)
lemma Data.heightLe_volume_ratio_sq_run51 {θ} (o : D.IsFitFamily θ) : HeightLe (2 * D.rowDim *
  (2 * (D.logB * D.budget) - D.mainHeight)) fun ι ↦ D.𝔷 (1 : D.MFoldTwist) ^ 2 / D.𝔷 (θ ι) ^ 2 := by
  -- `vol : 𝔷 ϑ = ‖c ϑ‖ ^ D ∏ⱼ λⱼ ϑ`
  choose c const _ vol using D.volume_iota_eq_prod_liftVolume
  -- each of the `m` lifts has height `D k (log b B₀ - 𝖴)`; `m k B₀ = budget` and `m k 𝖴 = h_main`
  have lifts : HeightLe (D.rowDim * (D.logB * D.budget - D.mainHeight))
      (∏ j ∈ Icc 1 D.m, fun ι ↦ D.liftVolume 1 j / D.liftVolume (θ ι) j) := (HeightLe.prod
    fun j h ↦ by exact heightLe_liftVolume_ratio_run51 o ⟨j, mem_Icc.1 h⟩).mono
    (by simp [mainHeight]; field_simp [(HasLogBound.pos D).ne']; rfl) fun _ ↦ le_rfl
  -- the constants have height `2 m² t x ^ 999`
  have consts : HeightLe (2 * (D.logB * D.budget)) fun ι ↦ (‖c (θ ι) / c 1‖ ^ 2 :)⁻¹ :=
    (const θ o).mono (by simpa using D.le_of_hasLogBound) fun _ ↦ le_rfl
  exact ((lifts.pow 2).mul (consts.pow D.rowDim)).mono (by grind) fun ι ↦
    (congrArg (‖ι.2 ·‖) (by simp [vol, mul_pow, div_pow, ← pow_mul]; ring)).le
include i hn I hV
lemma Data.integral_forms_long_run51 : D.rowDim * (D.mainHeight - 3 * (D.logB * D.budget)) ≤
  V + 2 * δ := by
  -- one twist `θ ι` for each `ι`, with the congruence bounds; the volumes do not vanish
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := exists_isFitFamily_run51 D, D.volume_iota_eq_prod_liftVolume
  -- `(𝔷 θ / 𝔷 1)² (𝔷 1² / 𝔷 θ²) = 1`, heights add, and the height of `1` is `≥ 0`
  have formula : 0 ≤ 2 * (V + _ + _) + _ := ((((heightLe_volume_rows i hn I hV o).pow 2).mul
    (heightLe_volume_ratio_sq_run51 o)).mono le_rfl (by simp [field]; simp [(Z _).1])).nonneg
  linarith [(by gcongr; exact D.le_of_hasLogBound : D.rowDim * D.b ≤
    D.rowDim * (D.logB * D.budget))]
end Endgame

#print axioms Data.packet_span_cover_run51
#print axioms Data.packet_range_run51
#print axioms exists_isFitFamily_run51
#print axioms Data.norm_det_compressedGramOp_arch_le_run51
#print axioms Data.heightLe_liftVolume_ratio_run51
#print axioms Data.heightLe_volume_ratio_sq_run51
#print axioms Data.integral_forms_long_run51

/-!
## RESUME HERE
Replay this certificate on the shared compact runner; inspect exact proof
term and axiom output for both callers, and patch Main L134 in a separate
scratch overlay using the replacement C, not importing the claimed RH
theorem. Preserve RUN50 shared volume witness, which is orthogonal to
this candidate; combine after both are checked. Next reconstruct the
actual eq_zero_of_integral_fNatural_tableTheta detector and tableTheta_
adjoint_eq_zero geometric input; coordinate with theta and positivity
workers. Independently formalize trace-at-projector support transfer
using the exact native finite union and compare at FitTwistsExist L60.
Do not discard original support or determinant proof until kernel replay.
HANDOFF TO: integration, formal audit, kernel extractor, human editor.
-/
