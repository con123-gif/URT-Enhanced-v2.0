import Development.AutomorphicArithmetic.AutomorphicVarieties.AutomorphicForms.TemperedLocalComponents.CohBoundFree
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.BrCardP
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TCardK
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN31 -- direct level-one base, actual cardP/cardK callers. SOURCE-MATCHED
human derivation; executable candidate, NOT kernel compiled.

In the actual callers Gamma=GL_n(F) (top). Let U=KLev(F,n,1).
The native finite_adelic_double_cosets already provides the finite
Gamma-orbit cover of G/U, so the general finite-index refinement hO
is unnecessary here. Each stabilizer is arithmetic, commensurable
with GL_n(O_F); native bddArith works over C for such groups WITHOUT
a torsion-free assumption. Its proof uses bounded complexes and
commensurability, not the BorelSerreFL predicate. Thus no need to move
to KLev(3). For M>=1 the map G/KLev(M) -> G/U has fibers of size
D=[U:KLev(M)] <= M^([F:Q] n^2), by the native index lemma. Shapiro
and the native finite orbit bound give the one budget
  cohDim(top,KLev(M),xi) <= c * M^([F:Q] n^2) * d.
The constant c depends on F,n and fixed base orbits, not M,d,xi.
BorelInjC is stated for ANY compact open U, including KLev(M);
ClozelCohC supplies the original cohomological condition, and the
fixed vector is already at level M. Apply directly; there is no
level 3M, fixed-vector transport, or extraneous factor 3^([F:Q]n^2)
in this proof. This is not a claim that the new c equals the old c.
Do not remove level 3 from unrelated torsion-sensitive consumers.
Keep the separate Weyl weight bound and max exponent from RUN30.
The two literature propositions remain genuine inputs: their exact
definitions were located in PublishedTheorems/GelfandKazhdanReal.lean;
their root suppliers have NOT been authenticated in this run.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/
AutomorphicForms/TemperedLocalComponents/CohBoundFree.lean 3eb3da1c74e98bfa35f2b86c0942f380bf4748b0
ModularityArgument/ThresholdArguments/DenseThresholdCases/BrCardP.lean a2e96d9c993a392281385cc7f723acf78e614b21
ModularityArgument/ThresholdArguments/DenseThresholdCases/TCardK.lean c6eb1d67f72c45007e3330ea65b0966f3f27cd96
PublishedTheorems/GelfandKazhdanReal.lean 5950874949bd0b4b4f22191c009aff80c520cf5c
AutomorphicForms/HasCohomology.lean ec55ca626b57c37d58f482abeeb1c7f03bcd377a
AutomorphicForms/HomologyRank/RankHomology.lean e119670e2db05abe8fa3b4be29652f6c6eed3ab5
AutomorphicForms/TemperedLocalComponents/BddArith.lean 4c7d93eff137c10949df149cb0eb0b1769197f91
AutomorphicForms/KLevTop.lean ad9db68ebe592a52e2c24bfeb99c5ee8190c181d
BuildingsResidueChars/LevelSubgroupIndexBoundOfCardOhat.lean c19e3a8ca4ed692bfaccfb995feb2d6acfb321b9
BuildingsResidueChars/CardOhatQuotientNatCast.lean 1f076aaf0fcbfee49be91ef9a4e082e4ccaf7b83
BuildingsResidueChars/AdelicCohomologyFiberCard.lean 4811c5618ae8b992c963009cf66eb8ec1c7fee11

Original source graph (RUN30 caller chain): CountI -> countQ_alt ->
countP_alt/countK_alt -> cardP/cardK -> cohBoundFree -> cohBound_of
-> gen + finite_orbit_refinement + FinDC + level index + BddArith;
cardP/cardK also call Weyl, Clozel, Borel, level 3M open/compact,
fixed-vector transport. Reduced graph: same callers via cardP_level/
cardK_level -> coh_at_level -> copied gen + FinDC + index + BddArith,
Weyl, Clozel, Borel, level M open/compact. All type/value/constructor
edges in original authenticated graph remain until replacement replay;
the diagram is a source-visible local graph, not a complete kernel DAG.
Cache key pin, F, n, Gamma=top, base=1, coefficient representation
dimension and M at use, original SigP or SigK context, P. Backtracking
fallback is native card proof. No claimed deletion elsewhere.
The two card replacement theorems retain the original full P argument
for caller bridge and compatibility; RUN30's two-field projection
can be composed after both replacements actually compile.

Continuity: latest mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc;
SWARM/HANDOFF/EXPANSION, live manuscript, AGENTS/state, continuity and
research protocol/log excerpts, RUN30. Latest peer commit list includes
95545ee1, 6821df81, 8825cbd3, 708a3eb7, 53d53663, 41d181ff, 0b0399c1,
7b758b50, 4510eb2b, 5991ed4b, c11635a0, e669681c, 59e81b98.
Inspected last two diffs: paired homology torsion and CountQ aggregation
are distinct from this level-one reduction. Upstream HEAD observed
d91ae2678eea19a0c3045ffca37f1da757c2e719; changed CohBoundFree blob
b8d7f959b8a97b75455ba81907f051c6ee5f9af8 and GelfandKazhdanReal
2a179702f272dce53c7ee4d103e2dd9b77752df1; no cross-version equivalence
claimed. Use original pin only.

Executed: exact pinned blob retrieval and 3/3 hash checks on transformed
files; 18 unique-occurrence source substitutions across both actual
card callers, plus exact reuse of gen and levelRep_eq bodies. Source
inspection of BddArith confirms no torsion-free assumption. Shell check:
lean/lake not found, GitHub DNS unavailable. Actual CI baseline status
JSONs retrieved for runs 45577239749 and 45576756833: both pass, only
for their existing engines/conditional root. This new file is PREPARED,
not compiled, not queued, no new axiom result or CI PASS. Run in pinned
built environment with engine modules on LEAN_PATH:
  lake env lean RUN31_DIRECT_LEVEL_ONE_COHOMOLOGY.lean
Scan original and reduced graphs, report actual pending nodes and axioms.
No URT advantage claimed. No RH-scale prime bound proved.

RESUME HERE: compile RUN30/RUN31 in native pinned environment; if accepted
use direct level M at both actual CountI classifier callers. Then locate
the concrete root constructor providing P.cohC/P.borelC (not just their
definitions), authenticate its statement/body and give concise literature
or native proof under exact hypotheses. Do not substitute a conjectural
literature assertion. Preserve all other CountI/II/V/Vs, TopG and
arithmetic/geometric window frontier obligations.
HANDOFF TO integration/editor, kernel, audit, dependency and Galois.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
namespace RHGalois31
open scoped Matrix
open NumberField IsDedekindDomain GlobalTheory.CuspRep CategoryTheory UpperTheory.V.Af UpperTheory.V.Af.CohB

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


theorem coh_at_level :
    ∀ (F : Type) [Field F] [NumberField F], (IsTotallyComplex F ∨ IsTotallyReal F) → ∀ (n : ℕ),
      ∃ c : ℕ, ∀ M : ℕ, 1 ≤ M → ∀ (d : ℕ) (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ),
        cohDim ⊤ (KLev F n M) ξ ≤ (c * M ^ (Module.finrank ℚ F * (n * n)) * d : ℕ) := by
  intro F _ _ hF' n
  obtain ⟨T, hT⟩ := UpperTheory.finite_adelic_double_cosets F n
  have hcover : ∃ T : Finset (GL (Fin n) (Af F)),
      ∀ g, ∃ γ ∈ (⊤ : Subgroup (GL (Fin n) F)), ∃ t ∈ T, ∃ u ∈ KLev F n 1,
        g = ratAf F n γ * t * u := by
    refine ⟨T, fun g => ?_⟩
    obtain ⟨γ, t, ht, u, hu, e⟩ := hT g
    exact ⟨γ, Subgroup.mem_top γ, t, ht, u, hu, e⟩
  obtain ⟨c, hc⟩ := gen UpperTheory.cohomology_bounded_equiv
    (UpperTheory.absolute_bound_of_partial_bound_of_orbit_bound
      (UpperTheory.cohomology_part_bound_of_sum_bound UpperTheory.cohomology_sum_bound UpperTheory.cohomology_part_split)
      (UpperTheory.orbit_bound_of_shapiro_functorial
        (UpperTheory.shapiro_functorial_of_coinduction_bijective UpperTheory.cohomology_to_coinvariants_injective UpperTheory.cohomology_to_coinvariants_surjective)))
    UpperTheory.adelic_cohomology_fiber_card (ratAf F n) ⊤ (KLev F n 1) hcover
    (fun g => arith g (KLev F n 1)) (fun g γ => mem_arith) fun g =>
      (bddArith F hF' n _
        (UpperTheory.arithmetic_subgroup_level_one F n ▸
          UpperTheory.arithmetic_subgroups_commensurable F n ⊤ inferInstance g _
            (by apply isOpen_KLev; norm_num) (by apply isCompact_KLev; norm_num)))
  refine ⟨c, fun M hM d ξ => ?_⟩
  have hle : KLev F n M ≤ KLev F n 1 := KLev_le_of_dvd (one_dvd M)
  obtain ⟨hi0, hi⟩ := UpperTheory.level_subgroup_index_bound_of_card_ohat
    UpperTheory.card_ohat_quotient_natCast F n M hM
  have key := hc _ hle hi0 _ hi d (ξ.comp (⊤ : Subgroup (GL (Fin n) F)).subtype)
  rw [← levelRep_eq] at key
  exact key

theorem coh_at_level_replay :
    ∀ (F : Type) [Field F] [NumberField F], (IsTotallyComplex F ∨ IsTotallyReal F) → ∀ (n : ℕ),
      ∃ c : ℕ, ∀ M : ℕ, 1 ≤ M → ∀ (d : ℕ) (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ),
        cohDim ⊤ (KLev F n M) ξ ≤ (c * M ^ (Module.finrank ℚ F * (n * n)) * d : ℕ) := by
  first | (rh_reduce 2 using [coh_at_level]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact coh_at_level

theorem cardP_level :
    _root_.UpperTheory.V.Af.Hypotheses' → UpperTheory.V.Br.CardP := by
  intro P K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_of_printed_results P K n
  obtain ⟨c₂, hC⟩ := coh_at_level K (Or.inl inferInstance) n
  let A₂ := Module.finrank ℚ K * (n * n)
  refine ⟨c₂ * c₁, max A₁ A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have hB := P.borelC K n (by omega) (UpperTheory.V.Af.KLev K n M) (by apply UpperTheory.V.Af.isOpen_KLev; exact hM)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact hM) Ξ S hiso fun π hπ =>
      ⟨P.cohC K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (max A₁ A₂) := Nat.pow_le_pow_right hM (le_max_right _ _)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (max A₁ A₂) := Nat.pow_le_pow_right (by omega) (le_max_left _ _)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (max A₁ A₂) * (c₁ * (H + 1) ^ (max A₁ A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (max A₁ A₂) := by rw [mul_pow]; ring

theorem cardK_level :
    _root_.UpperTheory.V.Af.Hypotheses' → UpperTheory.V.Af.CardK := by
  intro P K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_of_printed_results P K n
  obtain ⟨c₂, hC⟩ := coh_at_level K (Or.inl inferInstance) n
  let A₂ := Module.finrank ℚ K * (n * n)
  refine ⟨c₂ * c₁, max A₁ A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have hB := P.borelC K n (by omega) (UpperTheory.V.Af.KLev K n M) (by apply UpperTheory.V.Af.isOpen_KLev; exact hM)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact hM) Ξ S hiso fun π hπ =>
      ⟨P.cohC K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (max A₁ A₂) := Nat.pow_le_pow_right hM (le_max_right _ _)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (max A₁ A₂) := Nat.pow_le_pow_right (by omega) (le_max_left _ _)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (max A₁ A₂) * (c₁ * (H + 1) ^ (max A₁ A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (max A₁ A₂) := by rw [mul_pow]; ring

end RHGalois31

rh_scan UpperTheory.V.Af.cohBoundFree limit 2000
rh_scan RHGalois31.coh_at_level limit 2000
rh_scan UpperTheory.V.Br.cardP_of_prints limit 2000
rh_scan RHGalois31.cardP_level limit 2000
rh_scan RHGalois31.cardK_level limit 2000
rh_prune RHGalois31.coh_at_level as RHCohAtLevelPruned31
#print axioms RHGalois31.coh_at_level
#print axioms RHGalois31.coh_at_level_replay
#print axioms RHGalois31.cardP_level
#print axioms RHGalois31.cardK_level
