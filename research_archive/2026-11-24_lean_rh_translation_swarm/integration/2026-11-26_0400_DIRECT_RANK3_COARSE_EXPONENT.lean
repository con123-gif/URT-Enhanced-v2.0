import RHIntegrationRankSliced45
import RHKernelRank3Witness21
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClozelCohomology.ClozelConjC
import Development.AutomorphicArithmetic.AutomorphicVarieties.AutomorphicForms.TemperedLocalComponents.CohBoundFree

/-!
Integration 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
Mission latest branch including mandatory engine, SWARM/HANDOFF/AGENTS/state
and runner protocol read. Working snapshot bbb56405d128bda33aeee616730efcf90f5e14fa.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Stage predecessor integration
2026-11-26_0303_SHARED_RANK_SLICED_VWIN.lean as RHIntegrationRankSliced45 and
kernel RUN21_RANK3_EXISTENTIAL_LEVEL_WITNESS.lean as RHKernelRank3Witness21
with their exact documented transitive overlays.

RESULT: avoid waiting for the stronger rank-three flag dimension e^3.
The native cohomology proof already constructs the exponent
b=[K:Q]*9=18 for the quadratic host. Its public existential hid that
witness; copy exactly its proof with the exponent exposed (cohBoundExact46).
For fixed m=(e-1,-1,-e-1), let t=e-1. Cancel the common shift of 5
in N and nu as in dependencies 086052c6; the actual native existsScalar
at n=3, H=2t gives P.d <= (6t+1)^9. Tensoring gives Xi.d <= (6e)^a,
a=9*#complex embeddings=18 for quadratic K. Both sides use the same
coefficient and level. Native Borel and Clozel named theorem bodies
(from Galois 425c27c5) give |S| <= C_K M^b Xi.d, hence
  |S| <= C_K 6^18 (M(e+2))^18
on the quadratic host. Thus the stronger flag dimension e^6 after
tensoring improves the bivariate bound but is NOT necessary for the
homogenized exponent 18, nor the existential exponent consumed by
CountK3Slice20. No new Rank3SmallPre45 premise. The actual new candidate
uses max b a directly; numerical equality to 18 here is the standard
char-zero embedding count, not a separate kernel-checked claim.
This is an upstream sufficiency result, not the uniform prime inequality.
Constants depend on K as permitted by the CountK3Slice quantifiers.
Clozel/Borel and cohomology literature dependencies survive; no claim
that they were proved from first principles or axiom-audited here.

Source paths relative to AutomorphicVarieties:
AutomorphicForms/TemperedLocalComponents/CohBoundFree.lean
  3eb3da1c74e98bfa35f2b86c0942f380bf4748b0
GaloisLibrary/WeylAlgebraQuantumDet/ExistsScalar.lean (fetched at pin)
ModularityArgument/ThresholdArguments/DenseThresholdCases/TWeylC.lean
  d716d26265f83c1266a7f10f76c3fedc914bfb66
ModularityArgument/ClozelCohomology/ClozelConjC.lean
  ee87c465349ad0e87d461ead8aa003dbebc88477
Peer rank3 witness e638a13b5d650ffc4bf167bafc83b364b0c8630b (27896ee5);
rank3 flag 086052c6 and native cohomology 425c27c5; previous integration
5744b095, shared slice c7690d1be83523d4ec31cd8ebfde42971b936cc3.
Other recent peer handoffs reviewed: audit torsion, character twisted
Selmer, prime joint class/local rank, small-prime budget, theta Haar,
geometry regular fibres, editor orthogonal gauge, literature Borel,
odd-rank boundary, acceleration orbit powers. Not merged without audit.

Original selected graph VWin -> window_sliced45 -> CountK3Slice20 ->
countK3_slice_of_native20 -> countK_alt -> general CardK / LevelKNAlt.
Peer reduced graph via Rank3SmallPre45 and Rank3LevelWitness21.
New graph window_rank3_direct46 -> window_sliced45 -> countK_rank3_direct46
-> rank3_card46 -> rank3_alg46 -> existsScalar / exists_tens, and
cohBoundExact46 / native Borel / native Clozel; Rank3LevelWitness21 and
all same-pi/Frobenius, Satake, integrality, purity, isomorphism, Sha and
geometry inputs retained. No original dependency edges or axioms removed
globally. Cache keys: source/toolchain, host K/e/M/p/w/l/Omega/iota/r/pi,
coefficient Xi, same level U, exact consumer; not declaration only.
Fallback rank3 direct bridge uses original LevelKNAlt; old original
candidate remains intact. No new mathematical hypothesis for flag bound.

Executed 38 fail-on-error source/reversible splice checks:
slice output definitional source identity; actual existsScalar bound; coh explicit witness; two existential heads; two exponent occurrences; unique , Module.finrank ℚ F * (n * n), fun M hM d ξ; reversible , Module.finrank ℚ F * (n * n), fun M hM d ξ; unique theorem rank3_alg45 (hsmall : Rank3SmallPre45); reversible theorem rank3_alg45 (hsmall : Rank3SmallPre45); unique Ξ.d ≤ e ^ (3 * Fintype.card (K →+* ℂ)); reversible Ξ.d ≤ e ^ (3 * Fintype.card (K →+* ℂ)); unique   obtain ⟨P, hP, hd, hw⟩ := hsmall e he; reversible   obtain ⟨P, hP, hd, hw⟩ := hsmall e he; unique   · rw [pow_mul]
    exact h1.trans (Nat.pow_le_pow_left hd _); reversible   · rw [pow_mul]
    exact h1.trans (Nat.pow_le_pow_lef; unique private theorem rank3_card45 (hs : Rank3SmallPre45)
    (P : UpperTheory.V.Af.Hypothe; reversible private theorem rank3_card45 (hs : Rank3SmallPre45)
   ; unique   obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) 3 ⊤ i; reversible   obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree ; unique P.borelC K 3; reversible P.borelC K 3; unique P.cohC K 3; reversible P.cohC K 3; native Borel and Clozel peer suppliers; card consumer found; two strict rank occurrences; unique theorem countK_rank3_small45; reversible theorem countK_rank3_small45; unique Rank3SmallPre45 → _root_.UpperTheory.V.Af.Hypotheses' → Rank3LevelWitness21 → CountK3; reversible Rank3SmallPre45 → _root_.UpperTheory.V.Af.Hypotheses' →; unique intro hsmall hP hW K _ _ _ hK; reversible intro hsmall hP hW K _ _ _ hK; unique rank3_card45 hsmall hP K; reversible rank3_card45 hsmall hP K; same pi and common level preserved; no placeholders; no additional smallPre premise; no claimed root import.
Executed 1024 exact BigInt regressions for the homogenized coarse bound
(e=1..64, M=1..16); proof above is algebraic, not finite inference.
Local lean/lake/elan absent. No new native verification or axiom result.
Do not treat previous conditional CI as proof of this file.
RESUME HERE: stage previous overlays and this certificate, native-check
cohBoundExact46 and rank3_alg46 first, then countK_rank3_direct46 and
window_rank3_direct46; compare actual native constructor/type/value
scans and axioms, preserve fallback on failure. Next prove the actual
Rank3LevelWitness21 via the specialized KeepLevel supplier, not a new
flag dimension proof unless it serves another real consumer. Sha and
same-host joint loss remain open. HANDOFF TO kernel, audit, Galois,
dependencies and editor. No URT speed claim.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open scoped Matrix
open NumberField IsDedekindDomain GlobalTheory.CuspRep CategoryTheory UpperTheory.V.Af UpperTheory.V.Af.CohB

@[reducible] private def act46 {G H : Type} [Group G] [Group H] (ι : H →* G) (Γ : Subgroup H) (U : Subgroup G) :
    MulAction ↥Γ (G ⧸ U) := MulAction.compHom _ (ι.comp Γ.subtype)

private theorem gen46 (hE : BddEquiv) (hA : AbsBound) (hF : FibCard) {G H : Type} [Group G] [Group H] (ι : H →* G)
    (Γ : Subgroup H) (U : Subgroup G) (hT : ∃ T : Finset G, ∀ g, ∃ γ ∈ Γ, ∃ t ∈ T, ∃ u ∈ U, g = ι γ * t * u)
    (S : G → Subgroup H) (hS : ∀ g γ, γ ∈ S g ↔ g⁻¹ * ι γ * g ∈ U) (hB : ∀ g, Bdd ↥(Γ ⊓ S g)) :
    ∃ c : ℕ, ∀ U' : Subgroup G, U' ≤ U → U'.relIndex U ≠ 0 → ∀ D : ℕ, U'.relIndex U ≤ D →
      ∀ (d : ℕ) (ξ : ↥Γ →* Matrix (Fin d) (Fin d) ℂ),
        totCoh (Rep.of (@funRep ↥Γ _ (G ⧸ U') (act46 ι Γ U') d ξ)) ≤ (c * D * d : ℕ) := by
  classical
  letI := act46 ι Γ U
  have hsm : ∀ (γ : ↥Γ) (g : G), γ • (g : G ⧸ U) = ((ι γ.1 * g : G) : G ⧸ U) := fun _ _ => rfl
  obtain ⟨T, hT'⟩ := hT
  obtain ⟨c, hc⟩ := hA ↥Γ (G ⧸ U)
    ⟨T.image (↑), fun y => by
      obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective y
      obtain ⟨γ, hγ, t, ht, u, hu, rfl⟩ := hT' g
      refine ⟨⟨γ⁻¹, Γ.inv_mem hγ⟩, Finset.mem_image.2 ⟨t, ht, ?_⟩⟩
      rw [hsm, QuotientGroup.eq]
      simpa [mul_assoc] using hu⟩
    (fun y => by
      obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective y
      have e : MulAction.stabilizer ↥Γ (g : G ⧸ U) = (Γ ⊓ S g).subgroupOf Γ := by
        ext γ
        rw [MulAction.mem_stabilizer_iff, hsm, eq_comm, QuotientGroup.eq, Subgroup.mem_subgroupOf, Subgroup.mem_inf, hS,
          mul_assoc]
        exact ⟨fun h => ⟨γ.2, h⟩, fun h => h.2⟩
      exact hE ↥(Γ ⊓ S g) _
        ⟨((MulEquiv.subgroupCongr e).trans (Subgroup.subgroupOfEquivOfLe inf_le_left)).symm⟩ (hB g))
  refine ⟨c, fun U' hle h0 D hD d ξ => ?_⟩
  letI := act46 ι Γ U'
  exact hc (G ⧸ U') (Subgroup.quotientMapOfLE hle)
    (fun γ x => by
      obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective x
      rfl) D
    (fun y => by rw [hF _ _ _ hle h0 y]; exact_mod_cast hD) d ξ

private theorem levelRep_eq46 {F : Type} [Field F] [NumberField F] {n : ℕ} (Γ : Subgroup (GL (Fin n) F))
    (U : Subgroup (GL (Fin n) (Af F))) {d : ℕ} (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ) :
    levelRep Γ U ξ = @funRep ↥Γ _ (GL (Fin n) (Af F) ⧸ U) (act46 (ratAf F n) Γ U) d (ξ.comp Γ.subtype) := by
  refine MonoidHom.ext fun γ => LinearMap.ext fun f => funext fun x => ?_
  change ξ γ *ᵥ f ((ratAf F n γ.1)⁻¹ • x) = ξ γ *ᵥ f ((ratAf F n (γ.1)⁻¹) • x)
  rw [map_inv]

private theorem cohBound_of46 (hE : BddEquiv) (hA : AbsBound) (hF : FibCard)
    (hO : FinOrbAbs) (hI : KLevIdx) (hD : FinDC) (h1 : ArithOne) (hC : ArithComm) :
    ∀ (F : Type) [Field F] [NumberField F], (IsTotallyComplex F ∨ IsTotallyReal F) → ∀ (n : ℕ) (Γ : Subgroup (GL (Fin n) F)),
      Γ.FiniteIndex → ∃ c : ℕ, ∀ M : ℕ, 1 ≤ M → ∀ (d : ℕ) (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ),
        cohDim Γ (KLev F n (3 * M)) ξ ≤ (c * M ^ (Module.finrank ℚ F * (n * n)) * d : ℕ) := by
  intro F _ _ hF' n Γ hΓ
  obtain ⟨c, hc⟩ := gen46 hE hA hF (ratAf F n) Γ (KLev F n 3)
    (hO _ _ (ratAf F n) Γ (KLev F n 3) (KLev F n 1) hΓ (hI F n 3 (by norm_num)).1 (hD F n))
    (fun g => arith g (KLev F n 3)) (fun g γ => mem_arith) fun g => (bddArith F hF' n _
      (h1 F n ▸ hC F n Γ hΓ g _ (by apply isOpen_KLev; norm_num) (by apply isCompact_KLev; norm_num)))
  refine ⟨c * 3 ^ (Module.finrank ℚ F * (n * n)), fun M hM d ξ => ?_⟩
  have hle : KLev F n (3 * M) ≤ KLev F n 3 := KLev_le_of_dvd (dvd_mul_right 3 M)
  have hle1 : KLev F n 3 ≤ KLev F n 1 := KLev_le_of_dvd (one_dvd 3)
  obtain ⟨hi0, hi⟩ := hI F n (3 * M) (by omega)
  have hr0 : (KLev F n (3 * M)).relIndex (KLev F n 3) ≠ 0 := fun h => hi0 (Subgroup.relIndex_eq_zero_of_le_right hle1 h)
  have hr : (KLev F n (3 * M)).relIndex (KLev F n 3) ≤ (3 * M) ^ (Module.finrank ℚ F * (n * n)) :=
    (Subgroup.relIndex_le_of_le_right hle1 hi0).trans hi
  have key := hc _ hle hr0 _ hr d (ξ.comp Γ.subtype)
  rw [← levelRep_eq46] at key
  have e : c * 3 ^ (Module.finrank ℚ F * (n * n)) * M ^ (Module.finrank ℚ F * (n * n)) * d =
      c * (3 * M) ^ (Module.finrank ℚ F * (n * n)) * d := by rw [mul_pow, mul_assoc c]
  rw [e]
  exact key

theorem UpperTheory.V.Af.cohBoundExact46 :
    ∀ (F : Type) [Field F] [NumberField F], (IsTotallyComplex F ∨ IsTotallyReal F) → ∀ (n : ℕ) (Γ : Subgroup (GL (Fin n) F)),
      Γ.FiniteIndex → ∃ c : ℕ, ∀ M : ℕ, 1 ≤ M → ∀ (d : ℕ) (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ),
        cohDim Γ (KLev F n (3 * M)) ξ ≤ (c * M ^ (Module.finrank ℚ F * (n * n)) * d : ℕ) :=
  cohBound_of46 UpperTheory.cohomology_bounded_equiv
    (UpperTheory.absolute_bound_of_partial_bound_of_orbit_bound (UpperTheory.cohomology_part_bound_of_sum_bound UpperTheory.cohomology_sum_bound UpperTheory.cohomology_part_split) (UpperTheory.orbit_bound_of_shapiro_functorial (UpperTheory.shapiro_functorial_of_coinduction_bijective UpperTheory.cohomology_to_coinvariants_injective UpperTheory.cohomology_to_coinvariants_surjective)))
    UpperTheory.adelic_cohomology_fiber_card UpperTheory.adelic_cohomology_finite_orbit_bound (UpperTheory.level_subgroup_index_bound_of_card_ohat UpperTheory.card_ohat_quotient_natCast) UpperTheory.finite_adelic_double_cosets UpperTheory.arithmetic_subgroup_level_one UpperTheory.arithmetic_subgroups_commensurable

open NumberField GlobalTheory.CuspRep GlobalTheory.GKCoh UpperTheory.V.Af
open UpperTheory.V.Weyl
theorem rank3_alg46
    (K : Type) [Field K] [NumberField K] [IsTotallyComplex K]
    (e : ℕ) (he : 1 ≤ e) :
    ∃ Ξ : AlgRep K 3,
      (∀ τ, AlgInfChar Ξ τ ((infOf (![ (e : ℤ) - 1, -1, -(e : ℤ) - 1 ] : Fin 3 → ℤ)).map Neg.neg)) ∧
      Ξ.d ≤ (6 * e) ^ (9 * Fintype.card (K →+* ℂ)) := by
  let t : ℕ := e - 1
  let ν : Fin 3 → ℕ := ![2 * t, t, 0]
  let m : Fin 3 → ℤ := ![(e : ℤ) - 1, -1, -(e : ℤ) - 1]
  have hanti : Antitone ν := by
    refine Fin.antitone_iff_succ_le.2 fun i => ?_
    fin_cases i <;> simp [ν] <;> omega
  have hle : ∀ k, ν k ≤ 2 * t := by
    intro k
    fin_cases k <;> simp [ν] <;> omega
  obtain ⟨P, hP, hd, hw⟩ := UpperTheory.V.Weyl.existsScalar 3 ν hanti (2 * t) hle
  have ht : t + 1 = e := by dsimp [t]; omega
  have hν : ∀ k, (ν k : ℤ) = (t : ℤ) + (k : ℕ) - 2 - m k.rev := by
    intro k
    fin_cases k <;> simp [ν, m, Fin.rev] <;> omega
  obtain ⟨Ξ, h1, h2⟩ := UpperTheory.V.WeylC.exists_tens (E := K) P hP (fun k => (ν k : ℂ)) hw t
  refine ⟨Ξ, fun τ => (UpperTheory.V.WeylC.algInfChar_iff _ _ _).2 ⟨by simp [UpperTheory.V.Af.infOf], fun u => ?_⟩, ?_⟩
  · rw [h2, UpperTheory.V.Af.infOf, Multiset.map_map, Multiset.map_map]
    congr 1
    refine (Fintype.prod_equiv Fin.revPerm _ _ fun k => ?_)
    have h3 : ((ν k : ℕ) : ℂ) = (t : ℂ) + (k : ℂ) - 2 - (m k.rev : ℂ) := by
      exact_mod_cast congrArg (Int.cast : ℤ → ℂ) (hν k)
    simp only [Function.comp_apply, Fin.revPerm_apply, h3]
    push_cast
    ring
  · calc Ξ.d ≤ P.d ^ Fintype.card (K →+* ℂ) := h1
      _ ≤ ((3 * (2 * t) + 1) ^ (3 * 3)) ^ Fintype.card (K →+* ℂ) := Nat.pow_le_pow_left hd _
      _ ≤ ((6 * e) ^ (3 * 3)) ^ Fintype.card (K →+* ℂ) := Nat.pow_le_pow_left (Nat.pow_le_pow_left (by omega) _) _
      _ = _ := by rw [← pow_mul]; norm_num

private theorem rank3_card46 (K : Type) [Field K] [NumberField K] [IsCMField K] :
    ∃ c A : ℕ, ∀ e : ℕ, 1 ≤ e → ∀ M : ℕ, 1 ≤ M →
      ∀ S : Finset (CuspSub K 3), (∀ π ∈ S, π ∈ SigK K (![ (e : ℤ) - 1, -1, -(e : ℤ) - 1 ] : Fin 3 → ℤ) M) →
      (∀ π ∈ S, ∀ π' ∈ S, π.Iso π' → π = π') →
      S.card ≤ c * (M * (e + 2)) ^ A := by
  obtain ⟨c₂, hC⟩ := UpperTheory.V.Af.cohBoundExact46 K (Or.inl inferInstance) 3 ⊤ inferInstance
  let a := 9 * Fintype.card (K →+* ℂ)
  let b := Module.finrank ℚ K * (3 * 3)
  refine ⟨c₂ * 6 ^ a, max b a, fun e he M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := rank3_alg46 K e he
  have h3 : 1 ≤ 3 * M := by omega
  have hB := UpperTheory.V.Z.Coh.borelInjC K 3 (by norm_num) (UpperTheory.V.Af.KLev K 3 (3 * M))
    (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨UpperTheory.V.Z.Coh.clozelCohC K 3 (by norm_num) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (UpperTheory.V.Af.KLev_le_of_dvd (dvd_mul_left M 3) hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ b * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ b ≤ M ^ (max b a) := Nat.pow_le_pow_right hM (le_max_left _ _)
  have h4 : e ^ a ≤ (e + 2) ^ (max b a) :=
    (Nat.pow_le_pow_left (by omega) _).trans (Nat.pow_le_pow_right (by omega) (le_max_right _ _))
  have hd' : Ξ.d ≤ 6 ^ a * e ^ a := by
    change Ξ.d ≤ (6 * e) ^ a at hd
    simpa only [mul_pow] using hd
  calc S.card ≤ c₂ * M ^ b * Ξ.d := h1
    _ ≤ c₂ * M ^ (max b a) * (6 ^ a * (e + 2) ^ (max b a)) :=
      Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd'.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * 6 ^ a * (M * (e + 2)) ^ (max b a) := by rw [mul_pow]; ring

open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.GalOfCusp GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.LocGL UpperTheory.V.Published UpperTheory.V.Af.Bc
open scoped Matrix
namespace UpperTheory.GalN.V.Win.N
private theorem strict_rank3_46 (e : ℕ) (he : 1 ≤ e) :
    StrictAnti (![ (e : ℤ) - 1, -1, -(e : ℤ) - 1 ] : Fin 3 → ℤ) := by
  refine Fin.strictAnti_iff_succ_lt.2 fun i => ?_
  fin_cases i <;> simp <;> omega

theorem countK_rank3_direct46 :
    _root_.UpperTheory.V.Af.Hypotheses' → Rank3LevelWitness21 → CountK3Slice20 := by
  intro hP hW K _ _ _ hK
  classical
  obtain ⟨c, A, hcard⟩ := rank3_card46 K
  refine ⟨c, A, fun e he M hM p w hp hw hpM hpd => ?_⟩
  let n : ℕ := 3
  let m : Fin n → ℤ := ![(e : ℤ) - 1, -1, -(e : ℤ) - 1]
  let H : ℕ := e + 1
  have hn : 2 ≤ n := by decide
  have hm : StrictAnti m := strict_rank3_46 e he
  have hwt : ∀ i, m i + m i.rev = 1 - (n : ℤ) := by
    intro i
    fin_cases i <;> simp [m, n, Fin.rev] <;> ring
  have hH : ∀ i, |m i| ≤ (H : ℤ) := by
    intro i
    rw [abs_le]
    fin_cases i <;> simp [m, n, H] <;> omega
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigK K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigK K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard e he M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.V.Af.conjK_alt hP K n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := 1 - n)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB, algSat, Multiset.card_map, ← hB.card]
      simp)
    (by exact zero_lt_one.trans (NumberField.HeightOneSpectrum.one_lt_absNorm w))
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact win_algSat (by omega) π m _ hwt hπ.1 hB)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact _root_.UpperTheory.V.Z.Int.intK_of_prints hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmKNAlt ι M m r}, ∃ π : ↥(SigK K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, hπ, hss, hF⟩ := hW K hK e he M hM l hl2 Ω ι r.1 r.2
    refine ⟨⟨π, hπ⟩, hss, fun v hv => ?_⟩
    obtain ⟨B, hB⟩ := hsat π hπ v
    rw [hsys π v B hB]
    exact hF v.1 hv B hB
  choose f hss hf using hform
  refine ⟨fun r => cl (f r), fun r r' h => ?_, fun r => ?_⟩
  · refine _root_.UpperTheory.V.Af.iso_of_frobenius_of_printed_results hP K Ω l ι n r.1 r'.1 r.2.level.cont r'.2.level.cont (hss r) (hss r') ?_
    filter_upwards [eventually_natCast_notMem (F := K) (M := M) (by omega),
      eventually_natCast_notMem (F := K) hl.out.ne_zero] with v hvM hvl
    refine ⟨sys (f r) ⟨v, hvM⟩, hf r ⟨v, hvM⟩ hvl, ?_⟩
    rw [hcl _ _ h]
    exact hf r' ⟨v, hvM⟩ hvl
  · rw [hβ]
    refine hf r ⟨w, hwM⟩ (natCast_notMem_of_not_dvd hp hw fun h => hlp ?_)
    exact ((Nat.prime_dvd_prime_iff_eq hp hl.out).1 h).symm

theorem countK_rank3_direct_fallback46
    (hP : _root_.UpperTheory.V.Af.Hypotheses')
    (hL : _root_.UpperTheory.GalN.V.LevelKNAlt) : CountK3Slice20 := by
  exact countK_rank3_direct46 hP (rank3_witness_of_level21 hL)

end UpperTheory.GalN.V.Win.N

namespace UpperTheory.V.HV.DescentVanishingReductions
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy
theorem window_rank3_direct46
    (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) (hSF : RHShaFinite40)
    (hW : _root_.UpperTheory.GalN.V.Win.N.Rank3LevelWitness21) : VWin := by
  have hSlice : _root_.UpperTheory.GalN.V.Win.N.CountK3Slice20 :=
    _root_.UpperTheory.GalN.V.Win.N.countK_rank3_direct46 hH.toClassicalTheorems hW
  first
  | (rh_reduce 2 using [window_sliced45]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact window_sliced45 hH hSha hSF hSlice
end UpperTheory.V.HV.DescentVanishingReductions

rh_scan UpperTheory.V.Af.cohBoundFree limit 2000
rh_scan UpperTheory.V.Af.cohBoundExact46 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_rank3_direct46 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_rank3_direct46 limit 2000
rh_prune UpperTheory.GalN.V.Win.N.countK_rank3_direct46 as RHCountKDirectPruned46
#print axioms UpperTheory.V.Af.cohBoundExact46
#print axioms rank3_alg46
#print axioms UpperTheory.GalN.V.Win.N.countK_rank3_direct46
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_rank3_direct46
