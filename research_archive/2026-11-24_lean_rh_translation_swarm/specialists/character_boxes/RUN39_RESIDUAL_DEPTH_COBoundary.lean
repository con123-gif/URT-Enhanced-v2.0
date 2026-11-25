import Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.SoCocL
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN39 character boxes, 25 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION / PREPARED LEAN; RH OPEN.

Mandatory mission read at f8b4b837301f8cf43d673be4979f04c4e4b415a4;
SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d075, AGENTS 8db0201d.
Prior RUN38 2c98bf976fb20958d79da8c28f8ee8cddd595c77.
Peer integration 2785c414 (same Sha witness), 33888226 (CountVs),
30a2c2d9 (tower), 46e9230b (CountI), 989910ad (CountQ audit) inspected.
Continuity filenames CONTINUITY.md and RESEARCH_STATE.md not found at
attempted paths; preserve existing ledger and do not assert a complete audit.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Source paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
LevelCohomology/SoHostVanE.lean 4d97dce5963b96608015bfdc5de00f94eae9c5bd
LevelCohomology/SoLineNeg.lean bc274f45064e9d602be9f6b0079fc8f03ec8b1dd
LevelCohomology/SoCocL.lean dcf4e5309372b443b989f37055d34a1071aa9140
LevelCohomology/SoLocTors.lean 03febd0586428cd935da832be4c378cc7628ad64
LevelCohomology/SoCobLim.lean a81309da5930263d568d2b9d86f9471ce06b5383
LevelCohomology/SoDefs.lean b3bbfe232c241fbf3f147b255dcf5b49b2d7d229
LevelCohomology/SoLocKill.lean eca735f3751fb36df39d9a733b7b3abfd4c47110
LevelCohomology/SoDecNe.lean 0c7f77ff142f96b2cde9aa70814e94c96255ab1b

Actual root-reachable source route: vwin_of_hypotheses_H_E_alt ->
count_v_of_printed_bound_k_reduced_unitary_lift -> So.hostVanE ->
So.lineNeg -> So.soCocL -> So.locTors -> So.cobLim.
Original So.locTors also requires So.locKill and So.decNe. So.soCocL
also uses So.cobPlace and So.soCoc (global, keep LemmaK and all premises).
Reduced local graph: soCocL39 -> locTors39 -> cobLim_card39 ->
cobLim_depth39; card adapter retains lev_kill39, cont_lev39 and locKill.
New weakest supplied interface for this argument is residual depth for
the SELECTED cocycle, not uniform cardinality of all H1. No global pruning.
Original statements copied verbatim apart from theorem names and selected
call sites; original graph, root, unresolved obligations all retained.

Human proof: in a DVR O, p nonzero nonunit, theta(g0) != 1.
Fix a0 != 0. For every k>=0 suppose there exist b>=0,m such that
p^(k+b) divides a0*p^b*z(g) - (theta(g)-1)*m for ALL g.
Set D(g)=(theta(g0)-1)*z(g)-(theta(g)-1)*z(g0).
Subtract the two congruences with coefficients theta(g0)-1, theta(g)-1.
The m terms cancel exactly, so p^(k+b) divides p^b*a0*D(g).
Cancel p^b in the domain. Thus p^k divides a0*D(g) for every k.
Finite multiplicity of a nonunit in a nonzero element gives a0*D(g)=0;
cancel a0. Hence D(g)=0, and CobOn has witness a=theta(g0)-1,m=z(g0).
No topology or cocycle law needed once the congruences are supplied.
In the native proof use a0=B!, b=0 and lev_kill at p^k.
This is genuine premise weakening: class-specific annihilator losses
may grow with depth, provided residual depth is unbounded; no uniform
bound on cardinality of unrelated classes is imposed by the new lemma.
The old cardinal bound still proves this interface, not conversely asserted.
In actual CountV, a weaker local supplier is NOT YET proved independently;
the global ShaK/LemmaK, principal host, uniform windows and sign twists
are retained. No RH proof.

Executed exact integer regression: 142884 determinant identities over
p=2,3,5,7; k,b=0..6; a0=-3,1,6; x=-3,1,4; y=-2,0,5;
m=-5,0,3; z=-4,0,2; w=-1,0,3. Checked divisibility implication
whenever both residual congruences hold. 80 depth-zero negative
controls: a0=1, x=1,y=0,z=0,w=1,m=0, modulus p^b, D=1.
These are algebra regression checks, NOT cohomology calculations.
Source blob and call-site assertions executed. Local lean/lake absent.
CI status JSON blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched; returncode 0,
runs 45577239749 and 45576756833 job steps successful.
Those are baseline engine/conditional root results only (propext,
Classical.choice, Quot.sound for the conditional root). No new
Lean compilation, pruning, scan or axiom audit executed. Requests below
are executable preparations, not claims of new CI success.
RESUME HERE: native replay this file, compare original and replacement
scans, and derive the residual-depth supplier directly for the selected
negative-weight cocycle at So.locTors; next inspect soVec global supplier
without erasing LemmaK. HANDOFF TO CountV / cohomology / integration.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X

private theorem cont_lev39 {O : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] {Γ : Type} [TopologicalSpace Γ]
    (a : O) (ha : a ≠ 0) (z : Γ → O) (hz : Alg.AdicCont (maximalIdeal O) z) :
    Continuous fun g => Lev.mk a (z g) := by
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
  obtain ⟨n, u, hu⟩ := IsDiscreteValuationRing.eq_unit_mul_pow_irreducible ha hϖ
  have hle : ∀ x, x ∈ maximalIdeal O ^ n → a ∣ x := by
    intro x hx
    rw [(IsDiscreteValuationRing.irreducible_iff_uniformizer ϖ).1 hϖ, Ideal.span_singleton_pow,
      Ideal.mem_span_singleton] at hx
    rw [hu, Units.mul_left_dvd]
    exact hx
  have hlc := (IsLocallyConstant.iff_eventually_eq _).1 (hz n)
  refine ((IsLocallyConstant.iff_eventually_eq _).2 fun x => ?_).continuous
  filter_upwards [hlc x] with y hy
  rw [Ideal.Quotient.eq] at hy
  rw [← sub_eq_zero, ← map_sub, Lev.mk_eq_zero]
  exact hle _ hy

private theorem lev_kill39 {O : Type} [CommRing O] {Γ : Type} [Group Γ] [TopologicalSpace Γ] (θ : Γ →* Oˣ) (a : O) (B : ℕ)
    (hf : Finite (H1 (scalRep (Lev a) θ))) (hB : Nat.card (H1 (scalRep (Lev a) θ)) ≤ B) (z : Γ → O) (hz : Coc θ z)
    (hc : Continuous fun g => Lev.mk a (z g)) :
    ∃ m : O, ∀ g, a ∣ (B.factorial : O) * z g - ((θ g : O) * m - m) := by
  set ρ := scalRep (Lev a) θ with hρ
  have hρg : ∀ g (x : Lev a), ρ g x = (θ g : O) • x := fun _ _ => rfl
  have hmem : (fun g => Lev.mk a (z g)) ∈ Z1 ρ := by
    rw [mem_Z1_iff_cocycle]
    refine ⟨hc, fun g h => ?_⟩
    rw [hz, hρg, map_add, ← smul_eq_mul, map_smul]
  let ζ : Z1 ρ := ⟨_, hmem⟩
  let q : H1 ρ := Submodule.Quotient.mk ζ
  have hpos : 0 < Nat.card (H1 ρ) := Nat.card_pos
  have hq : B.factorial • q = 0 := by
    obtain ⟨k, hk⟩ := Nat.dvd_factorial hpos hB
    rw [hk, mul_comm, mul_nsmul, card_nsmul_eq_zero']
  have hq2 : (Submodule.Quotient.mk (B.factorial • ζ) : H1 ρ) = 0 := by
    rw [Submodule.Quotient.mk_smul]
    exact hq
  rw [Submodule.Quotient.mk_eq_zero, Submodule.mem_comap] at hq2
  obtain ⟨mb, hmb⟩ := (mem_coboundaries1 ρ _).1 hq2
  obtain ⟨m, rfl⟩ := Lev.mk_surjective a mb
  refine ⟨m, fun g => ?_⟩
  rw [← Lev.mk_eq_zero]
  have := hmb g
  simp only [Submodule.subtype_apply, Submodule.coe_smul_of_tower, Pi.smul_apply] at this
  rw [map_sub, map_sub, ← nsmul_eq_mul, map_nsmul, this, hρg, ← smul_eq_mul, map_smul, sub_self]


theorem UpperTheory.V.X.So.cobLim_depth39 {O Γ : Type} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [Group Γ] (θ : Γ →* Oˣ) (p a0 : O)
    (hp0 : p ≠ 0) (hpu : ¬ IsUnit p) (ha0 : a0 ≠ 0)
    (z : Γ → O) (hθ : ∃ g, θ g ≠ 1)
    (hlev : ∀ k : ℕ, ∃ (b : ℕ) (m : O), ∀ g,
      p ^ (k+b) ∣ (a0*p^b)*z g - ((θ g : O)*m-m)) : CobOn θ z ⊤ := by
  obtain ⟨g0, hg0⟩ := hθ
  have hkey : ∀ g, ((θ g0 : O)-1)*z g = ((θ g : O)-1)*z g0 := by
    intro g
    by_contra hne
    let D : O := ((θ g0 : O)-1)*z g - ((θ g : O)-1)*z g0
    have hd : a0 * D ≠ 0 := mul_ne_zero ha0 (sub_ne_zero.2 hne)
    obtain ⟨n, hn⟩ := FiniteMultiplicity.of_not_isUnit hpu hd
    obtain ⟨b,m,hm⟩ := hlev (n+1)
    have he : p^b*(a0*D) =
        ((θ g0 : O)-1)*((a0*p^b)*z g-((θ g : O)*m-m)) -
        ((θ g : O)-1)*((a0*p^b)*z g0-((θ g0 : O)*m-m)) := by
      dsimp [D]
      ring
    have hdiv : p^((n+1)+b) ∣ p^b*(a0*D) := by
      rw [he]
      exact dvd_sub (dvd_mul_of_dvd_right (hm g) _) (dvd_mul_of_dvd_right (hm g0) _)
    obtain ⟨d,hd'⟩ := hdiv
    apply hn
    refine ⟨d, mul_left_cancel₀ (pow_ne_zero b hp0) ?_⟩
    calc
      p^b*(a0*D) = p^((n+1)+b)*d := hd'
      _ = p^b*(p^(n+1)*d) := by
        rw [show (n+1)+b=b+(n+1) by omega, pow_add, mul_assoc]
  refine ⟨(θ g0 : O)-1, sub_ne_zero.2 (fun h => hg0 (Units.val_eq_one.1 h)), z g0, ?_⟩
  intro g _
  rw [hkey g]
  ring

theorem UpperTheory.V.X.So.cobLim_card39 :
    ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CharZero O] (Γ : Type) [Group Γ] [TopologicalSpace Γ] (θ : Γ →* Oˣ) (p : O) (B : ℕ), p ≠ 0 → p ∈ maximalIdeal O → (∃ g, θ g ≠ 1) → (∀ r : ℕ, Finite (H1 (scalRep (Lev (p ^ r)) θ)) ∧ Nat.card (H1 (scalRep (Lev (p ^ r)) θ)) ≤ B) → ∀ z : Γ → O, Coc θ z → Alg.AdicCont (maximalIdeal O) z → CobOn θ z ⊤ := by
  intro O _ _ _ _ Γ _ _ θ p B hp0 hpm hθ hfin z hz hcont
  apply UpperTheory.V.X.So.cobLim_depth39 θ p (B.factorial : O) hp0
    ((IsLocalRing.mem_maximalIdeal p).1 hpm)
    (Nat.cast_ne_zero.2 (Nat.factorial_ne_zero B)) z hθ
  intro k
  obtain ⟨m,hm⟩ := lev_kill39 θ (p^k) B (hfin k).1 (hfin k).2 z hz
    (cont_lev39 (p^k) (pow_ne_zero k hp0) z hcont)
  exact ⟨0,m,by simpa using hm⟩

theorem UpperTheory.V.X.So.locTors39 : LocalFiniteness → LocalTateDuality → LocalEulerChar → ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Algebra ℤ_[l] O] [Module.Finite ℤ_[l] O] (ψ : G k Ω →* Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ n : ℤ, n ≠ 0 → n ≠ 1 → ∀ (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω), IsPlaceOver A v → ((l : ℕ) : 𝓞 k) ∉ v.asIdeal → ∀ z : G k Ω → O, Coc (ψ * chiO k Ω l O ^ n) z → Alg.AdicCont (maximalIdeal O) z → CobOn (ψ * chiO k Ω l O ^ n) z (Dec (F := k) A) := by
  intro lf lt le k Ω _ _ _ _ _ l hl O _ _ _ _ _ ψ ho n h0 h1 v A hA hv z hz hc
  haveI : CharZero O := charZero_of_injective_algebraMap (dvrFacts l O).1
  have hl0 : (l : O) ≠ 0 := Nat.cast_ne_zero.2 hl.out.ne_zero
  have hlm : (l : O) ∈ maximalIdeal O := by
    haveI := (dvrFacts l O).2.2.1
    rw [← map_natCast (algebraMap ℤ_[l] O)]
    exact map_nonunit _ _ PadicInt.p_nonunit
  obtain ⟨B, hB⟩ := So.locKill lf lt le k Ω l O ψ ho n h0 h1 v A hA hv
  obtain ⟨g, hg, hne⟩ := So.decNe k Ω l O ψ ho n h0 v A hA
  obtain ⟨a, ha, m, hm⟩ := So.cobLim_card39 O (Dec (F := k) A) ((ψ * chiO k Ω l O ^ n).comp (Dec (F := k) A).subtype) l B hl0 hlm
    ⟨⟨g, hg⟩, hne⟩ (fun r => hB _ _ _ (isLev_lev (pow_ne_zero r hl0) _)) (fun g => z g) (fun g h => hz g h)
    fun N => (hc N).comp_continuous continuous_subtype_val
  exact ⟨a, ha, m, fun g hg => hm ⟨g, hg⟩ trivial⟩

theorem UpperTheory.V.X.So.soCocL39 : ∀ CK : ℝ, LemmaK CK → GlobalTheory.Published.PoitouTateDuality → LocalFinitenessK → LocalTateDualityK → LocalFiniteness → LocalTateDuality → LocalEulerChar → ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → ∀ z : G k Ω → c.O, Coc (Chr.Psi l e ψ)⁻¹ z → Alg.AdicCont (maximalIdeal c.O) z → (∀ v : HeightOneSpectrum (𝓞 k), ((l : ℕ) : 𝓞 k) ∈ v.asIdeal → ∃ A : ValuationSubring Ω, IsPlaceOver A v ∧ CobOn (Chr.Psi l e ψ)⁻¹ z (Dec (F := k) A)) → CobOn (Chr.Psi l e ψ)⁻¹ z ⊤ := by
  intro CK hK pt fK tK lf lt le k Ω _ _ _ _ _ l hl c ψ ho e he z hz hc hl
  have key : ∀ (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω), IsPlaceOver A v →
      CobOn (Chr.Psi l e ψ)⁻¹ z (Dec (F := k) A) := fun v A hA => by
    by_cases hv : ((l : ℕ) : 𝓞 k) ∈ v.asIdeal
    · obtain ⟨A', hA', h⟩ := hl v hv
      exact So.cobPlace k Ω c.O _ z hz v A' A hA' hA h
    · rw [Chr.Psi_inv] at hz ⊢
      have ho' : IsOpen ((ψ⁻¹).ker : Set (G k Ω)) := by
        have : (ψ⁻¹).ker = ψ.ker := by
          ext g
          simp [MonoidHom.mem_ker]
        rwa [this]
      exact So.locTors39 lf lt le k Ω l c.O ψ⁻¹ ho' _ (by omega) (by omega) v A hA hv z hz hc
  refine So.soCoc CK hK pt fK tK k Ω l c ψ ho e he z hz hc (fun A => ?_) fun A hA => ?_
  · by_cases h : A = ⊤
    · rw [((places k Ω l A).2.1 h).1]
      refine cobOn_of_eq_zero _ fun g hg => ?_
      rw [Subgroup.mem_bot.1 hg]
      simpa using hz 1 1
    · obtain ⟨v, hv⟩ := (places k Ω l A).1 h
      exact (key v A hv).mono (Ine_le_Dec A)
  · obtain ⟨v, hv⟩ := (places k Ω l A).1 fun h => ((places k Ω l A).2.1 h).2 hA
    exact key v A hv


example {O Γ : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Group Γ] (θ : Γ →* Oˣ) (p a0 : O) (hp0 : p ≠ 0)
    (hpu : ¬ IsUnit p) (ha0 : a0 ≠ 0) (z : Γ → O) (hθ : ∃ g, θ g ≠ 1)
    (hlev : ∀ k : ℕ, ∃ (b : ℕ) (m : O), ∀ g,
      p ^ (k+b) ∣ (a0*p^b)*z g - ((θ g : O)*m-m)) : CobOn θ z ⊤ := by
  first
  | (rh_reduce 3 using [UpperTheory.V.X.So.cobLim_depth39]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact UpperTheory.V.X.So.cobLim_depth39 θ p a0 hp0 hpu ha0 z hθ hlev

rh_scan UpperTheory.V.X.So.cobLim limit 2000
rh_scan UpperTheory.V.X.So.cobLim_depth39 limit 2000
rh_scan UpperTheory.V.X.So.soCocL39 limit 2000
rh_prune UpperTheory.V.X.So.cobLim_depth39 as RH39DepthPruned
#print axioms UpperTheory.V.X.So.cobLim
#print axioms UpperTheory.V.X.So.cobLim_depth39
#print axioms UpperTheory.V.X.So.cobLim_card39
#print axioms UpperTheory.V.X.So.locTors39
#print axioms UpperTheory.V.X.So.soCocL39
