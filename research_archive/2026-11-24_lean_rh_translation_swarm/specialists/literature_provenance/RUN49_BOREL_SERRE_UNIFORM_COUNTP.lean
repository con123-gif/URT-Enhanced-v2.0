import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.AutomorphicForms.TemperedLocalComponents.CohBoundFree
import Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.AdelicRepBoundedOfDegreeBounded
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN49 lane 9, 26 Nov 2026. HUMAN DERIVATION / SOURCE-MATCHED PREPARED, NOT ELABORATED.
Latest mission blob 3c16485083ac46320b2510ec5152b33ef87ea6a9, mandatory engine,
whole-route invariant update and sprint. Read SWARM/HANDOFF/EXPANSION/AGENTS,
RUN44-48 and integration invariant crosswalk; peers 34f08ad5 (forward slopes),
a8ff15b6 (uniform Sha inputs), 03b9179d (shared replay). Pinned RH 40e56bab026552e089d7afcfeff08d2defb9c005;
observed upstream d54def9a0e1d252a64147169c447a9cd712d9b6d, not adopted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: standard Borel-Serre finite-free resolution replaces the base arithmetic
stabilizer bounded-cohomology construction in the ACTUAL cohBoundFree -> CardP
-> CountPAlt route. This supplies the required uniform-in-level, uniform-in-
coefficient upper bound, not another catalogue prefactor. For each FIXED
number field F, rank n and base level KLev(3), choose the same finite family of
double-coset representatives as native gen. For stabilizer Gamma_g, take a
finite free C[Gamma_g] resolution of the trivial module, ranks r_q independent
of M, weight, prime or coefficient A. Then
 sum_q dim H^q(Gamma_g,A) <= (sum_q r_q) dim A.
Indeed Hom(C[Gamma_g]^r_q,A) = A^r_q by basis evaluation and cohomology is a
subquotient. This works for arbitrary cardinal dimension, not just finite A.
Finite degree and finite ranks supply Bdd. Base constants chosen before M,d,xi.
Same orbit/fibre transport and same KLev(3M) and relative index estimate as
native; combine with the existing CardP lower-bound and Weyl suppliers. No
independent choice of prime, catalogue, coefficient or arithmetic host.
The candidate retains the original exponent and all CountPAlt quantifiers,
p/ell exclusions, conjugation, integrality and level hypotheses.

Literature: Borel–Serre, Corners and arithmetic groups, Comment. Math. Helv.
48 (1973), 436–491, DOI 10.1007/BF02566134. Original paper bibliographic
record checked, NOT primary theorem page authenticated. Modern explicit
reductive-group formulation: https://link.springer.com/article/10.1007/s00029-023-00900-8
(section 4, before Definition 4.7), torsion-free arithmetic group acts freely,
properly and cocompactly on Borel–Serre space; compact quotient is manifold
with corners, homotopy type BΓ. Apply to Res_(F/Q) GL_n, using quotient by
real split central factor; compact smooth manifold with corners admits finite
CW structure, lifted cellular chains give finite free ZΓ resolution; tensor C
preserves exactness. This is ordinary Borel–Serre, NOT reductive compactification
with collapsed stabilizers. No assumption of RH.
Torsion guard: Gamma_g <= GL_n(F) intersect g KLev(3) g^-1, preserves lattice
L = F^n intersect g Ohat^n and acts as identity on L/3L (local congruences
and lattice-localization equality). L is Z-free of rank n[F:Q], hence embeds
Gamma_g into principal level-3 congruence subgroup of GL_(n[F:Q])(Z),
torsion-free by Minkowski. A direct proof: for nonidentity prime-order u
write u=I+3^k A with k>=1 and A nonzero mod 3. For prime r≠3 the first
binomial term has valuation k and others >=2k; for r=3 first term has k+1
and others >=k+2, contradiction. A nontrivial finite-order element has
a nontrivial prime-order power. No rank/field/prime dependence of guard.
The exact adelic lattice identification remains to be checked natively.
Alternatively finite-index torsion-free subgroup and restriction-transfer
over C give the same Bdd conclusion, without a torsion-free base claim.

Native BorelSerreFL, TorsFree and RankCohFree are DEFINED PROPOSITIONS,
not established axioms or proved suppliers merely by name. This certificate
leaves all three as explicit parameters; human arguments above, categorical
identifications/Lean proofs outstanding. BddOfFL adapter uses native
adelic_rep_bounded_of_degree_bounded. The rank proof can be implemented with
the native rankCohHom_of_rankHomology and free-module Hom evaluation.
No new axiom, no import Main, no proof of independent Clozel/level/etc. premises.
Original graph: countP_alt -> cardP_of_prints -> cohBoundFree -> gen ->
bddArith -> bddArith_cx/bddArith_fix, building and permutation resolution.
Reduced candidate: countP_bs49 -> cardP_bs49 -> cohBoundFree_bs49 -> same
gen -> BorelSerreFL, TorsFree, RankCohFree, bddOfFL49; all other edges,
original graph, context-sensitive and axiom evidence preserved. Original
bddArith fallback retained; do not delete global nodes or claim kernel savings.
Context key pin,F,n,Gamma,g,KLev3,base stabilizer,resolution,coefficient,actual
CardP/CountP caller. Do not cache across different base stabilizers.
Exact native blobs:
CohBoundFree 3eb3da1c74e98bfa35f2b86c0942f380bf4748b0; BrCardP a2e96d9c993a392281385cc7f723acf78e614b21;
FrobeniusTraceCountBoundOfCmEigensystemCount 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40;
AdelicRepBoundedOfDegreeBounded e0c97e8751bdb5eb6a8be6498ec60a8ba41ec6af;
RankHomology e119670e2db05abe8fa3b4be29652f6c6eed3ab5;
GelfandKazhdanReal 5950874949bd0b4b4f22191c009aff80c520cf5c;
BddArith 4c7d93eff137c10949df149cb0eb0b1769197f91.
Executed 24 source pin, unique reversible splice and guard assertions.
No Lean/lake/elan installed locally; no new numerical regression needed.
Actual shared CI status blob 22989ce418dbfe8731db225af351ca57592ead73,
run 45773743341 returncode 1, 133.27s, Unicode import GaloisCohomology₂
parser error before candidate elaboration. Historical baseline PASS not
evidence for this certificate. Kernel lane owns repair/replay, no duplicate build.
RESUME HERE: authenticate primary Borel–Serre finite CW statement; implement
RankCohFree via free Hom equivalence and TorsFree via lattice-localization
(or finite-index transfer), replay same-base supplier and actual CountP
certificate in shared runner. Verify all axioms and root-reachable pending
edges; compare with existing native BddArith and keep fallback. Do not
restate uniform count as solved before checking other CountP premises.
HANDOFF TO kernel, Galois, audit, integration. RH OPEN.
-/

noncomputable section
open NumberField IsDedekindDomain GlobalTheory.CuspRep CategoryTheory UpperTheory.V.Af UpperTheory.V.Af.CohB
open scoped Matrix

theorem bddOfFL49 (hRank : RankCohFree) : BddOfFL := by
  intro Γ _ hFL
  obtain ⟨r, hr, P, hP⟩ := hFL
  obtain ⟨D, hD⟩ := Filter.eventually_atTop.1 hr
  apply UpperTheory.adelic_rep_bounded_of_degree_bounded Γ
  · intro q
    exact ⟨r q, hRank Γ P q (r q) (hP q)⟩
  · refine ⟨D, fun q hq A => ?_⟩
    have h := hRank Γ P q (r q) (hP q) A
    rw [hD q hq, Nat.cast_zero, zero_mul] at h
    exact le_antisymm h (zero_le _)

@[reducible] private def act {G H : Type} [Group G] [Group H] (ι : H →* G) (Γ : Subgroup H) (U : Subgroup G) :
    MulAction ↥Γ (G ⧸ U) := MulAction.compHom _ (ι.comp Γ.subtype)

private theorem gen (hE : BddEquiv) (hA : AbsBound) (hF : FibCard) {G H : Type} [Group G] [Group H] (ι : H →* G)
    (Γ : Subgroup H) (U : Subgroup G) (hT : ∃ T : Finset G, ∀ g, ∃ γ ∈ Γ, ∃ t ∈ T, ∃ u ∈ U, g = ι γ * t * u)
    (S : G → Subgroup H) (hS : ∀ g γ, γ ∈ S g ↔ g⁻¹ * ι γ * g ∈ U) (hB : ∀ g, Bdd ↥(Γ ⊓ S g)) :
    ∃ c : ℕ, ∀ U' : Subgroup G, U' ≤ U → U'.relIndex U ≠ 0 → ∀ D : ℕ, U'.relIndex U ≤ D →
      ∀ (d : ℕ) (ξ : ↥Γ →* Matrix (Fin d) (Fin d) ℂ),
        totCoh (Rep.of (@funRep ↥Γ _ (G ⧸ U') (act ι Γ U') d ξ)) ≤ (c * D * d : ℕ) := by
  classical
  letI := act ι Γ U
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
  letI := act ι Γ U'
  exact hc (G ⧸ U') (Subgroup.quotientMapOfLE hle)
    (fun γ x => by
      obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective x
      rfl) D
    (fun y => by rw [hF _ _ _ hle h0 y]; exact_mod_cast hD) d ξ

private theorem levelRep_eq {F : Type} [Field F] [NumberField F] {n : ℕ} (Γ : Subgroup (GL (Fin n) F))
    (U : Subgroup (GL (Fin n) (Af F))) {d : ℕ} (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ) :
    levelRep Γ U ξ = @funRep ↥Γ _ (GL (Fin n) (Af F) ⧸ U) (act (ratAf F n) Γ U) d (ξ.comp Γ.subtype) := by
  refine MonoidHom.ext fun γ => LinearMap.ext fun f => funext fun x => ?_
  change ξ γ *ᵥ f ((ratAf F n γ.1)⁻¹ • x) = ξ γ *ᵥ f ((ratAf F n (γ.1)⁻¹) • x)
  rw [map_inv]

private theorem cohBound_of_bs49 (hBS : UpperTheory.V.Published.BorelSerreFL) (hT : TorsFree) (hFL : BddOfFL) (hE : BddEquiv) (hA : AbsBound) (hF : FibCard)
    (hO : FinOrbAbs) (hI : KLevIdx) (hD : FinDC) (h1 : ArithOne) (hC : ArithComm) :
    ∀ (F : Type) [Field F] [NumberField F], (IsTotallyComplex F ∨ IsTotallyReal F) → ∀ (n : ℕ) (Γ : Subgroup (GL (Fin n) F)),
      Γ.FiniteIndex → ∃ c A : ℕ, ∀ M : ℕ, 1 ≤ M → ∀ (d : ℕ) (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ),
        cohDim Γ (KLev F n (3 * M)) ξ ≤ (c * M ^ A * d : ℕ) := by
  intro F _ _ hF' n Γ hΓ
  obtain ⟨c, hc⟩ := gen hE hA hF (ratAf F n) Γ (KLev F n 3)
    (hO _ _ (ratAf F n) Γ (KLev F n 3) (KLev F n 1) hΓ (hI F n 3 (by norm_num)).1 (hD F n))
    (fun g => arith g (KLev F n 3)) (fun g γ => mem_arith) fun g => (hFL _ (hBS F n (Γ ⊓ arith g (KLev F n 3))
      (h1 F n ▸ hC F n Γ hΓ g _ (by apply isOpen_KLev; norm_num) (by apply isCompact_KLev; norm_num))
      (fun γ hγ ht => hT F n g γ hγ.2 ht)))
  refine ⟨c * 3 ^ (Module.finrank ℚ F * (n * n)), Module.finrank ℚ F * (n * n), fun M hM d ξ => ?_⟩
  have hle : KLev F n (3 * M) ≤ KLev F n 3 := KLev_le_of_dvd (dvd_mul_right 3 M)
  have hle1 : KLev F n 3 ≤ KLev F n 1 := KLev_le_of_dvd (one_dvd 3)
  obtain ⟨hi0, hi⟩ := hI F n (3 * M) (by omega)
  have hr0 : (KLev F n (3 * M)).relIndex (KLev F n 3) ≠ 0 := fun h => hi0 (Subgroup.relIndex_eq_zero_of_le_right hle1 h)
  have hr : (KLev F n (3 * M)).relIndex (KLev F n 3) ≤ (3 * M) ^ (Module.finrank ℚ F * (n * n)) :=
    (Subgroup.relIndex_le_of_le_right hle1 hi0).trans hi
  have key := hc _ hle hr0 _ hr d (ξ.comp Γ.subtype)
  rw [← levelRep_eq] at key
  have e : c * 3 ^ (Module.finrank ℚ F * (n * n)) * M ^ (Module.finrank ℚ F * (n * n)) * d =
      c * (3 * M) ^ (Module.finrank ℚ F * (n * n)) * d := by rw [mul_pow, mul_assoc c]
  rw [e]
  exact key

theorem UpperTheory.V.Af.cohBoundFree_bs49 (hBS : UpperTheory.V.Published.BorelSerreFL) (hT : TorsFree) (hRank : RankCohFree) :
    ∀ (F : Type) [Field F] [NumberField F], (IsTotallyComplex F ∨ IsTotallyReal F) → ∀ (n : ℕ) (Γ : Subgroup (GL (Fin n) F)),
      Γ.FiniteIndex → ∃ c A : ℕ, ∀ M : ℕ, 1 ≤ M → ∀ (d : ℕ) (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ),
        cohDim Γ (KLev F n (3 * M)) ξ ≤ (c * M ^ A * d : ℕ) :=
  cohBound_of_bs49 hBS hT (bddOfFL49 hRank) UpperTheory.cohomology_bounded_equiv
    (UpperTheory.absolute_bound_of_partial_bound_of_orbit_bound (UpperTheory.cohomology_part_bound_of_sum_bound UpperTheory.cohomology_sum_bound UpperTheory.cohomology_part_split) (UpperTheory.orbit_bound_of_shapiro_functorial (UpperTheory.shapiro_functorial_of_coinduction_bijective UpperTheory.cohomology_to_coinvariants_injective UpperTheory.cohomology_to_coinvariants_surjective)))
    UpperTheory.adelic_cohomology_fiber_card UpperTheory.adelic_cohomology_finite_orbit_bound (UpperTheory.level_subgroup_index_bound_of_card_ohat UpperTheory.card_ohat_quotient_natCast) UpperTheory.finite_adelic_double_cosets UpperTheory.arithmetic_subgroup_level_one UpperTheory.arithmetic_subgroups_commensurable

section
private theorem klev_three (K : Type) [Field K] [NumberField K] (n M : ℕ) :
    UpperTheory.V.Af.KLev K n (3 * M) ≤ UpperTheory.V.Af.KLev K n M := by
  refine Subgroup.map_mono fun k hk => ?_
  have hle : Ideal.span {((3 * M : ℕ) : ↥(UpperTheory.V.Af.Ohat K))} ≤ Ideal.span {(M : ↥(UpperTheory.V.Af.Ohat K))} :=
    Ideal.span_singleton_le_span_singleton.2 (Nat.cast_dvd_cast (Dvd.intro_left 3 rfl))
  have e := congrArg (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.factor hle)) (MonoidHom.mem_ker.1 hk)
  rw [map_one] at e
  exact e
theorem UpperTheory.V.Br.cardP_bs49 (hBS : UpperTheory.V.Published.BorelSerreFL) (hT : TorsFree) (hRank : RankCohFree) :
    _root_.UpperTheory.V.Af.Hypotheses' → UpperTheory.V.Br.CardP := by
  intro P K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_of_printed_results P K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree_bs49 hBS hT hRank K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := P.borelC K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨P.cohC K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring
end


section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
namespace UpperTheory.GalN.V.Win.N
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N GlobalTheory.CuspRep GlobalTheory.GalOfCusp UpperTheory.V.Af
theorem countP_bs49 (hBS : UpperTheory.V.Published.BorelSerreFL) (hT : UpperTheory.V.Af.CohB.TorsFree) (hRank : UpperTheory.V.Af.CohB.RankCohFree) :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.Win.N.CountPAlt := by
  intro hP hL K _ _ _ hK n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Br.cardP_bs49 hBS hT hRank hP K n hn
  refine ⟨c, A, fun m wt hm hwt H hH M hM p w hp hw hpM hpd => ?_⟩
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigP K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigP K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard m hm H hH M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.GalN.V.conjP_alt hP K hK n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := wt)
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
      exact _root_.UpperTheory.V.Z.Int.intP'_alt hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmPNAlt ι M m r}, ∃ π : ↥(SigP K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, h1, h2, h3⟩ := r.2.aut
    obtain ⟨hπ, hF⟩ := hL K hK n hn m hm M hM l hl2 Ω ι r.1 π r.2.level r.2.safe r.2.unl h1 h2 h3
    refine ⟨⟨π, hπ⟩, h3.1, fun v hv => ?_⟩
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

theorem countP_bs49_replay (hBS : UpperTheory.V.Published.BorelSerreFL)
    (hT : UpperTheory.V.Af.CohB.TorsFree) (hRank : UpperTheory.V.Af.CohB.RankCohFree)
    (hP : UpperTheory.V.Af.Hypotheses') (hL : UpperTheory.GalN.V.LevelPNAlt) : CountPAlt := by
  first
  | (rh_reduce 2 using [countP_bs49]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countP_bs49 hBS hT hRank hP hL
end UpperTheory.GalN.V.Win.N
end
end

rh_scan UpperTheory.V.Af.cohBoundFree limit 2000
rh_scan UpperTheory.V.Af.cohBoundFree_bs49 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_bs49 limit 2000
rh_prune UpperTheory.GalN.V.Win.N.countP_bs49
#print axioms bddOfFL49
#print axioms UpperTheory.V.Af.cohBoundFree
#print axioms UpperTheory.V.Af.cohBoundFree_bs49
#print axioms UpperTheory.V.Br.cardP_bs49
#print axioms UpperTheory.GalN.V.Win.N.countP_alt
#print axioms UpperTheory.GalN.V.Win.N.countP_bs49
