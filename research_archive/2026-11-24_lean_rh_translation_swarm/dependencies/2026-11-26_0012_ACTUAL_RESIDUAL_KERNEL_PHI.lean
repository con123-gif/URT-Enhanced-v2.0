import Development.AutomorphicArithmetic.AutomorphicVarieties.TheoremsMuLinked.CharacteristicPolynomials.FiniteCocyclesColRepOfPhiCond
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000

/-!
Lane 12 RUN42, 26 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION / PREPARED Lean, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory pipeline; SWARM, HANDOFF, AGENTS, state, protocol/log and continuity openings read. Integration f304da1a shares CountI/CountV trace input, does not discharge finiteness. Kernel b0fd82e7 and acceleration 57df69df metadata checked; previous dependency 5adee016 preserved. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Branch head observed b0fd82e7 before work; unique new file only.

Result: replace global PhiCond (all open subgroups) by finiteness of open-kernel C_l characters on ONE actual residual action kernel K, for ONE integral model of the column representation. At the native local proof, the only call to hPhi is hPhi rho.ker hker. The native proof of openness stays intact, and the quotient action, saturation ker(Psi)=tC, Hausdorff/Nakayama and conjugacy/splitting remain unchanged. No need for finiteness across arbitrary open subgroups in this specific proof. The public column theorem accepts the same model (c,Q,sigma0), conjugacy and adic continuity and the residual K condition together; original statement bridge chooses native intModel then specializes global PhiCond. This is a local premise weakening, not closure.

Human argument: let V be the actual finite residual module, K=ker(G->Aut(V)), d=dim_F_l V, m=[G:K]. Cocycle z is determined by its values on m coset representatives plus its additive restriction on K. This restriction is a continuous homomorphism since K acts trivially; composing with a dual basis of V determines it. Thus if r=dim_F_l Hom_cont(K,F_l) is finite, dim_F_l Z^1_cont(G,V)<=d(m+r). This is an upper bound, not a uniform bound across hosts. No new norm inequalities. Strictness of the local premise in the abstract category: take odd l, H=product_{N} C_l, G=H semidirect C2 where C2 acts by inversion; trivial residual action on V=F_l gives K=G and Hom_cont(G,F_l)=0 (inversion gives 2f(h)=0, C2 maps trivially), while H is open with infinitely many coordinate characters. Thus local condition need not imply PhiCond. This is a mathematical negative control, not a claim that this group is the native Galois host.

Potential direct arithmetic supplier: IF one authenticates the actual G as a continuous quotient of G_{F,S} for finite S, pull K back to an open subgroup corresponding to a finite extension E/F in the maximal S-unramified extension. Pullback embeds the required Hom into Hom_cont(G_{E,S_E},F_l). After enlarging S to include l and adjoining mu_l, restriction is injective because [E(mu_l):E] divides l-1. Kummer theory identifies the latter characters with a subgroup of S-unit Kummer classes: exact sequence O_{E',S'}^*/(O_{E',S'}^*)^l -> {a mod lth powers: valuations outside S' divisible by l} -> Cl(O_{E',S'})[l] -> 0, with initial injection. Dirichlet S-unit theorem and class-group finiteness give qualitative finiteness. This human implication requires the actual quotient/ramification identification; not established here for native F.G0, and does NOT supply full-window uniform Selmer lengths. Do not claim it closes CountI/V or RH.

Original selected source graph: RegDet -> finite_cocycles_matrixRepresentation_of_phiCond -> finite_cocycles_colRep_of_phiCond -> continuousCocycles_fg_integral_of_phiCond -> private cocycles_finitely_generated -> locallyConstant_cocycles_finite_of_phi -> PhiCond G l (all open subgroups). Candidate: rhDep42_colRep -> rhDep42_integral -> rhDep42_cocycles_finitely_generated -> rhDep42_lc -> rhDep42_localPhi l (resAction I rho). Old bridge retains original PhiCond and exact model witness. Matrix and RegDet consumers not rewritten in this run; previous original graphs, axioms, other PhiAll consumers and pending nodes unchanged. Cache exact source/toolchain, group, l, coefficient DVR, matrix/conjugacy, lattice, residual action and kernel, context and typeclasses. Backtrack to original theorem if native replay fails.

Source blobs: PatchingModules/DeterminantPadicFree/LocallyConstantCocyclesFiniteOfPhi.lean fc158bd325fad86e18310fc313cabd7588fd1b74; TheoremsMuLinked/CharacteristicPolynomials/ContinuousCocyclesFgIntegralOfPhiCond.lean 52ffca2754d5dc76bc3edafdc726052b74a9f6b2; TheoremsMuLinked/CharacteristicPolynomials/FiniteCocyclesColRepOfPhiCond.lean 71f442f58847694be4236b733210879845dfa79a; WeakShimuraTheory/EigenbasisLifts/IntModel.lean 15667dd898eb7dbec977449cde973800a4db20bd.
Executed 56 connector V8 source checks: source 52ffca2754d5dc76bc3edafdc726052b74a9f6b2; source 15667dd898eb7dbec977449cde973800a4db20bd; source 71f442f58847694be4236b733210879845dfa79a; source fc158bd325fad86e18310fc313cabd7588fd1b74; rename eq_zero_of_forall_hom_zmod_eq_zero_of_module_zmod; reverse eq_zero_of_forall_hom_zmod_eq_zero_of_module_zmod; local theorem unique; local theorem reverse; local premise unique; local premise reverse; only actual kernel unique; only actual kernel reverse; native residual action located; native quotient action; actual residual action unique; actual residual action reverse; private integral premise unique; private integral premise reverse; actual residual consumer unique; actual residual consumer reverse; public integral name unique; public integral name reverse; public integral premise unique; public integral premise reverse; native column action unique; native column action reverse; rename mem_pow_smul; reverse mem_pow_smul; rename mem_smul_top_pi; reverse mem_smul_top_pi; rename lc_iff; reverse lc_iff; rename cocycles_finitely_generated; reverse cocycles_finitely_generated; column consumer name unique; column consumer name reverse; one actual integral model unique; one actual integral model reverse; choose same model unique; choose same model reverse; actual column caller unique; actual column caller reverse; rename zc_norm; reverse zc_norm; rename zc_dvd; reverse zc_dvd; rename zc_ev; reverse zc_ev; rename zc_split; reverse zc_split; intModel exact conjugacy witness; no sorry/admit tokens; exact saturation kept; Nakayama preserved; finite coset witnesses kept; same model at actual column caller. These are reversible substitutions and source checks, not Lean execution. Local lean/lake absent; git DNS failed. Actual Actions API runs 45577239749 and 45576756833 both completed success (old baseline only); latest orchestrator 45724408129 does not verify this new candidate. New file not queued or kernel checked; no new transitive axiom evidence.
RESUME HERE: native replay this file, compare original and candidate #print axioms and role-aware scans; then trace actual PhiAll supplier for V.frame.G0 and authenticate a finite-ramification quotient map on the same host, or use original fallback. Do not replace uniform arithmetic windows by qualitative finiteness.
HANDOFF TO: kernel extractor, Galois, integration, audit.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal IsLocalRing Polynomial Matrix UpperTheory.V UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.Pa UpperTheory.V.W GlobalTheory.GalOfCusp

def rhDep42_localPhi (l : ℕ) {G M : Type} [Group G] [TopologicalSpace G]
    [AddCommGroup M] (ρ : G →* AddMonoid.End M) : Prop :=
  IsOpen (ρ.ker : Set G) →
    Finite {φ : ρ.ker →* Multiplicative (ZMod l) // IsOpen (φ.ker : Set ρ.ker)}

def rhDep42_resAction {R G M : Type} [CommRing R] [Group G] [AddCommGroup M]
    [Module R M] (I : Ideal R) (ρ : G →* Module.End R M) :
    G →* AddMonoid.End (M ⧸ I • (⊤ : Submodule R M)) :=
  { toFun := fun g => ((I • (⊤ : Submodule R M)).mapQ _ (ρ g)
        (Submodule.smul_top_le_comap_smul_top _ _)).toAddMonoidHom
      map_one' := by
        refine AddMonoidHom.ext fun x => ?_
        induction x using Submodule.Quotient.induction_on with
        | H x =>
          simp
          rfl
      map_mul' := by
        intro g h
        refine AddMonoidHom.ext fun x => ?_
        induction x using Submodule.Quotient.induction_on with
        | H x =>
          simp [Module.End.mul_apply]
          rfl }

def rhDep42_colAction {l : ℕ} [Fact l.Prime] (c : Coef l)
    {G : Type} [Group G] {m : ℕ} (σ : G →* GL (Fin m) c.O) :
    G →* Module.End c.O (Fin m → c.O) :=
  (Matrix.toLinAlgEquiv' (R := c.O) (n := Fin m)).toAlgHom.toRingHom.toMonoidHom.comp (W.mat σ)

private theorem rhDep42_dual_zero {l : ℕ} [Fact l.Prime] {M : Type} [AddCommGroup M] [Module (ZMod l) M] (v : M)
    (hv : ∀ f : M →+ ZMod l, f v = 0) : v = 0 := by
  rw [← Module.forall_dual_apply_eq_zero_iff (ZMod l)]
  intro f
  exact hv (LinearMap.toAddMonoidHom f)

theorem rhDep42_lc :
    ∀ (l : ℕ) [Fact l.Prime] {G M : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [AddCommGroup M] [Finite M] (ρ : G →* AddMonoid.End M), rhDep42_localPhi l ρ → (∀ m : M, l • m = 0) → (∀ m, IsLocallyConstant fun g => ρ g m) → {z : G → M | IsLocallyConstant z ∧ ∀ g h, z (g * h) = z g + ρ g (z h)}.Finite := by
  intro l _ G M _ _ _ _ _ _ _ ρ hΦ hl hc
  haveI : NeZero l := ⟨(Fact.out : l.Prime).ne_zero⟩
  set S := {z : G → M | IsLocallyConstant z ∧ ∀ g h, z (g * h) = z g + ρ g (z h)} with hS
  have hker : IsOpen (ρ.ker : Set G) := by
    have he : (ρ.ker : Set G) = ⋂ m, {g | ρ g m = m} := by
      ext g
      simp only [SetLike.mem_coe, MonoidHom.mem_ker, Set.mem_iInter, Set.mem_setOf_eq]
      constructor
      · intro h m
        rw [h]
        rfl
      · intro h
        ext m
        exact h m
    rw [he]
    exact isOpen_iInter_of_finite fun m => (hc m).isOpen_fiber m
  haveI : Finite (G ⧸ ρ.ker) := Subgroup.quotient_finite_of_isOpen _ hker
  haveI := hΦ hker
  haveI : Finite (M →+ ZMod l) :=
    Finite.of_injective (fun f : M →+ ZMod l => (⇑f : M → ZMod l))
      (fun a b hab => AddMonoidHom.ext (congrFun hab))
  have h1 : ∀ z ∈ S, z 1 = 0 := by
    intro z hz
    have h11 : z 1 = z 1 + z 1 := by
      have := hz.2 1 1
      rw [one_mul, map_one] at this
      exact this
    exact add_left_cancel (h11.symm.trans (add_zero _).symm)
  have hH : ∀ z ∈ S, ∀ a b : G, a ∈ ρ.ker → z (a * b) = z a + z b := by
    intro z hz a b ha
    rw [hz.2, MonoidHom.mem_ker.mp ha]
    rfl
  let φ : ∀ z ∈ S, (M →+ ZMod l) →
      {φ : ρ.ker →* Multiplicative (ZMod l) // IsOpen (φ.ker : Set ρ.ker)} := fun z hz f =>
    ⟨{ toFun := fun h => Multiplicative.ofAdd (f (z h))
       map_one' := by simp [h1 z hz]
       map_mul' := fun a b => by simp [hH z hz a b a.2, ofAdd_add] },
     by
       have hlc : IsLocallyConstant (fun h : ρ.ker => Multiplicative.ofAdd (f (z h))) :=
         (hz.1.comp_continuous continuous_subtype_val).comp _
       exact hlc.isOpen_fiber 1⟩
  let F : S → ((G ⧸ ρ.ker) → M) × ((M →+ ZMod l) →
      {φ : ρ.ker →* Multiplicative (ZMod l) // IsOpen (φ.ker : Set ρ.ker)}) :=
    fun z => (fun q => z.1 (Quotient.out q), φ z.1 z.2)
  have hinj : Function.Injective F := by
    rintro ⟨z, hz⟩ ⟨z', hz'⟩ hzz
    have hq : (fun q : G ⧸ ρ.ker => z (Quotient.out q)) = fun q => z' (Quotient.out q) := congrArg Prod.fst hzz
    have hf : φ z hz = φ z' hz' := congrArg Prod.snd hzz
    have hHeq : ∀ h ∈ ρ.ker, z h = z' h := by
      intro h hh
      rw [← sub_eq_zero]
      apply @rhDep42_dual_zero l _ M _ (AddCommGroup.zmodModule hl)
      intro f
      have hx := congrArg (fun p => (p.1 ⟨h, hh⟩ : Multiplicative (ZMod l))) (congrFun hf f)
      change Multiplicative.ofAdd (f (z h)) = Multiplicative.ofAdd (f (z' h)) at hx
      rw [map_sub, sub_eq_zero]
      exact Multiplicative.ofAdd.injective hx
    apply Subtype.ext
    funext g
    show z g = z' g
    obtain ⟨h0, hh0⟩ := QuotientGroup.mk_out_eq_mul ρ.ker g
    have hg : g = Quotient.out (g : G ⧸ ρ.ker) * (h0 : G)⁻¹ := by
      rw [hh0, mul_inv_cancel_right]
    have hr := congrFun hq (g : G ⧸ ρ.ker)
    rw [hg, hz.2, hz'.2, hr, hHeq _ (inv_mem h0.2)]
  exact Set.finite_coe_iff.mp (Finite.of_injective F hinj)

private theorem rhDep42_mem_pow_smul {A M : Type} [CommRing A] [AddCommGroup M] [Module A M] (t : A) (N : ℕ) (x : M) :
    x ∈ (Ideal.span {t} ^ N • (⊤ : Submodule A M)) ↔ ∃ y, t ^ N • y = x := by
  rw [Ideal.span_singleton_pow, Submodule.ideal_span_singleton_smul, Submodule.mem_smul_pointwise_iff_exists]
  constructor
  · rintro ⟨y, -, hy⟩
    exact ⟨y, hy⟩
  · rintro ⟨y, hy⟩
    exact ⟨y, Submodule.mem_top, hy⟩

private theorem rhDep42_mem_smul_top_pi {R : Type} [CommRing R] (J : Ideal R) {r : ℕ} (x : Fin r → R) :
    x ∈ J • (⊤ : Submodule R (Fin r → R)) ↔ ∀ i, x i ∈ J := by
  constructor
  · intro hx
    refine Submodule.smul_induction_on hx ?_ ?_
    · intro r hr n _ i
      simpa using J.mul_mem_right (n i) hr
    · intro a b ha hb i
      simpa using J.add_mem (ha i) (hb i)
  · intro hx
    have hsum : x = ∑ i, x i • (Pi.single i (1 : R) : Fin r → R) := by
      ext j
      simp [Finset.sum_apply, Pi.single_apply]
    rw [hsum]
    exact Submodule.sum_mem _ fun i _ => Submodule.smul_mem_smul (hx i) Submodule.mem_top

private theorem rhDep42_lc_iff {R G : Type} [CommRing R] [TopologicalSpace G] (J : Ideal R) {r : ℕ} (f : G → Fin r → R) :
    (IsLocallyConstant fun g => (J • (⊤ : Submodule R (Fin r → R))).mkQ (f g)) ↔
      ∀ i, IsLocallyConstant fun g => Ideal.Quotient.mk J (f g i) := by
  have key : ∀ a b : Fin r → R, (J • (⊤ : Submodule R (Fin r → R))).mkQ a = (J • (⊤ : Submodule R (Fin r → R))).mkQ b ↔
      ∀ i, Ideal.Quotient.mk J (a i) = Ideal.Quotient.mk J (b i) := by
    intro a b
    simp only [Submodule.mkQ_apply, Submodule.Quotient.eq, Ideal.Quotient.eq, rhDep42_mem_smul_top_pi]
    rfl
  simp only [IsLocallyConstant.iff_eventually_eq, key]
  constructor
  · intro h i x
    exact (h x).mono fun y hy => hy i
  · intro h x
    exact Filter.eventually_all.mpr fun i => h i x

private theorem rhDep42_cocycles_finitely_generated (l : ℕ) [Fact l.Prime] {R G M : Type} [CommRing R] [IsDomain R] [IsLocalRing R]
    [IsNoetherianRing R] [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [AddCommGroup M] [Module R M] [Module.Free R M] [Module.Finite R M]
    (t : R) (I : Ideal R) (hI : I = Ideal.span {t}) (ht0 : t ≠ 0) (hIne : I ≠ ⊤) [IsPrecomplete I R]
    (hfq : Finite (R ⧸ I)) (hlI : (l : R) ∈ I)
    (ρ : G →* Module.End R M) (Z : Submodule R (G → M)) (hΦ : rhDep42_localPhi l (rhDep42_resAction I ρ))
    (hρ : ∀ (N : ℕ) m, IsLocallyConstant fun g => (I ^ N • (⊤ : Submodule R M)).mkQ (ρ g m))
    (hZ : ∀ z ∈ Z, (∀ N : ℕ, IsLocallyConstant fun g => (I ^ N • (⊤ : Submodule R M)).mkQ (z g)) ∧
      ∀ g h, z (g * h) = z g + ρ g (z h)) : Z.FG := by
  subst hI
  have htinj : ∀ x : M, t • x = 0 → x = 0 := by
    intro x hx
    let b := Module.Free.chooseBasis R M
    apply b.repr.injective
    ext i
    have h := congrArg (fun y => b.repr y i) hx
    simp only [map_smul, Finsupp.smul_apply, smul_eq_mul, map_zero, Finsupp.coe_zero, Pi.zero_apply] at h
    simpa using (mul_eq_zero.mp h).resolve_left ht0
  have hcancel : ∀ a b : M, t • a = t • b → a = b := fun a b h =>
    sub_eq_zero.mp (htinj _ (by rw [smul_sub, h, sub_self]))
  have hMh : ∀ x : M, (∀ n : ℕ, ∃ y, t ^ n • y = x) → x = 0 := by
    intro x hx
    have hle : Ideal.span {t} ≤ (⊥ : Ideal R).jacobson := by
      rw [IsLocalRing.jacobson_eq_maximalIdeal ⊥ bot_ne_top]
      exact IsLocalRing.le_maximalIdeal hIne
    have h := Ideal.iInf_pow_smul_eq_bot_of_le_jacobson (M := M) _ hle
    have hx' : x ∈ ⨅ i, Ideal.span {t} ^ i • (⊤ : Submodule R M) :=
      (Submodule.mem_iInf _).mpr fun n => (rhDep42_mem_pow_smul t n x).mpr (hx n)
    rw [h] at hx'
    simpa using hx'
  let C : Submodule R (G → M) :=
    { carrier := {z | (∀ N : ℕ, IsLocallyConstant fun g => (Ideal.span {t} ^ N • (⊤ : Submodule R M)).mkQ (z g)) ∧
        ∀ g h, z (g * h) = z g + ρ g (z h)}
      add_mem' := by
        rintro a b ⟨ha1, ha2⟩ ⟨hb1, hb2⟩
        refine ⟨fun N => ?_, fun g h => ?_⟩
        · simp only [Pi.add_apply, map_add]
          exact (ha1 N).add (hb1 N)
        · simp only [Pi.add_apply, ha2, hb2, map_add]
          abel
      zero_mem' := ⟨fun N => by
          simp only [Pi.zero_apply, map_zero]
          exact IsLocallyConstant.const 0,
        fun g h => by simp⟩
      smul_mem' := by
        rintro r a ⟨ha1, ha2⟩
        refine ⟨fun N => ?_, fun g h => ?_⟩
        · simp only [Pi.smul_apply, map_smul]
          exact (ha1 N).comp (fun q => r • q)
        · simp only [Pi.smul_apply, ha2, smul_add, map_smul] }
  have hZC : Z ≤ C := fun z hz => hZ z hz
  haveI : Finite (R ⧸ Ideal.span {t}) := hfq
  haveI hM'fin : Finite (M ⧸ Ideal.span {t} • (⊤ : Submodule R M)) := Module.finite_of_finite (R ⧸ Ideal.span {t})
  let ρ' := rhDep42_resAction (Ideal.span {t}) ρ
  have hρ' : ∀ g x, ρ' g (Submodule.Quotient.mk x) = Submodule.Quotient.mk (ρ g x) := fun g x => rfl
  have hS := rhDep42_lc l ρ' hΦ
    (by
      intro m
      induction m using Submodule.Quotient.induction_on with
      | H x =>
        rw [← Submodule.Quotient.mk_smul, Submodule.Quotient.mk_eq_zero, ← Nat.cast_smul_eq_nsmul R]
        exact Submodule.smul_mem_smul hlI Submodule.mem_top)
    (by
      intro m
      induction m using Submodule.Quotient.induction_on with
      | H x =>
        have h1 := hρ 1 x
        rw [pow_one] at h1
        exact h1)
  let Ψ : C →ₗ[R] (G → M ⧸ Ideal.span {t} • (⊤ : Submodule R M)) :=
    LinearMap.pi fun g => (Ideal.span {t} • (⊤ : Submodule R M)).mkQ ∘ₗ (LinearMap.proj g ∘ₗ C.subtype)
  have hΨ : ∀ z g, Ψ z g = Submodule.Quotient.mk (z.1 g) := fun z g => rfl
  have hrange : ∀ z, Ψ z ∈ {z : G → M ⧸ Ideal.span {t} • (⊤ : Submodule R M) | IsLocallyConstant z ∧
      ∀ g h, z (g * h) = z g + ρ' g (z h)} := by
    intro z
    obtain ⟨hz1, hz2⟩ := z.2
    refine ⟨?_, fun g h => ?_⟩
    · have h1 := hz1 1
      rw [pow_one] at h1
      exact h1
    · rw [hΨ, hΨ, hΨ, hz2, hρ', Submodule.Quotient.mk_add]
  have hker : LinearMap.ker Ψ = Ideal.span {t} • (⊤ : Submodule R C) := by
    apply le_antisymm
    · intro z hz
      have hz' : ∀ g, ∃ y, t • y = z.1 g := by
        intro g
        have h0 : Ψ z g = 0 := congrFun (LinearMap.mem_ker.mp hz) g
        rw [hΨ, Submodule.Quotient.mk_eq_zero, ← pow_one (Ideal.span {t})] at h0
        obtain ⟨y, hy⟩ := (rhDep42_mem_pow_smul t 1 _).mp h0
        exact ⟨y, by simpa using hy⟩
      choose y hy using hz'
      obtain ⟨hz1, hz2⟩ := z.2
      have hyC : y ∈ C := by
        refine ⟨fun N => ?_, fun g h => ?_⟩
        · rw [IsLocallyConstant.iff_eventually_eq]
          intro x
          filter_upwards [(IsLocallyConstant.iff_eventually_eq _).mp (hz1 (N + 1)) x] with g hg
          rw [Submodule.mkQ_apply, Submodule.mkQ_apply, Submodule.Quotient.eq] at hg ⊢
          obtain ⟨w, hw⟩ := (rhDep42_mem_pow_smul t (N + 1) _).mp hg
          refine (rhDep42_mem_pow_smul t N _).mpr ⟨w, hcancel _ _ ?_⟩
          rw [smul_sub, hy, hy, ← hw, ← mul_smul, ← pow_succ']
        · apply hcancel
          rw [hy (g * h), smul_add, ← map_smul, hy g, hy h]
          exact hz2 g h
      have hzt : z = t • (⟨y, hyC⟩ : C) := Subtype.ext (funext fun g => (hy g).symm)
      rw [hzt]
      exact Submodule.smul_mem_smul (Ideal.mem_span_singleton_self t) Submodule.mem_top
    · intro z hz
      refine Submodule.smul_induction_on hz ?_ ?_
      · intro r hr n _
        rw [LinearMap.mem_ker, map_smul]
        funext g
        rw [Pi.smul_apply, hΨ, ← Submodule.Quotient.mk_smul, Pi.zero_apply, Submodule.Quotient.mk_eq_zero]
        exact Submodule.smul_mem_smul hr Submodule.mem_top
      · intro a b ha hb
        exact add_mem ha hb
  have hfin : Finite (C ⧸ LinearMap.ker Ψ) := by
    have hsub : (LinearMap.range Ψ : Set _) ⊆ {z : G → M ⧸ Ideal.span {t} • (⊤ : Submodule R M) | IsLocallyConstant z ∧
        ∀ g h, z (g * h) = z g + ρ' g (z h)} := by
      rintro _ ⟨z, rfl⟩
      exact hrange z
    haveI : Finite (LinearMap.range Ψ) := (hS.subset hsub).to_subtype
    exact Finite.of_equiv _ Ψ.quotKerEquivRange.symm.toEquiv
  rw [hker] at hfin
  haveI : IsHausdorff (Ideal.span {t}) C := by
    refine ⟨fun x hx => ?_⟩
    apply Subtype.ext
    funext g
    show x.1 g = 0
    apply hMh
    intro n
    have h1 := hx n
    rw [SModEq.sub_mem, sub_zero] at h1
    obtain ⟨y, hy⟩ := (rhDep42_mem_pow_smul t n x).mp h1
    exact ⟨y.1 g, by rw [← hy]; rfl⟩
  haveI : Module.Finite R (C ⧸ Ideal.span {t} • (⊤ : Submodule R C)) := Module.Finite.of_finite
  have hCfin : Module.Finite R C := (UpperTheory.V.abelian₂.nakayama R (Ideal.span {t}) C).2 this
  have hCfg : C.FG := Module.Finite.iff_fg.mp hCfin
  haveI := isNoetherian_of_fg_of_noetherian C hCfg
  have hZ'fg : (Z.comap C.subtype).FG := IsNoetherian.noetherian _
  have hZeq : Submodule.map C.subtype (Z.comap C.subtype) = Z :=
    Submodule.map_comap_eq_of_le (by rwa [Submodule.range_subtype])
  rw [← hZeq]
  exact hZ'fg.map _

theorem rhDep42_integral :
    ∀ {l : ℕ} [Fact l.Prime] (c : Coef l) {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {m : ℕ} (σ : G →* GL (Fin m) c.O) (Z : Submodule c.O (G → Fin m → c.O)), rhDep42_localPhi l (rhDep42_resAction (maximalIdeal c.O) (rhDep42_colAction c σ)) → (∀ i j, AdicCont (maximalIdeal c.O) fun g => W.mat σ g i j) → (∀ z ∈ Z, (∀ i, AdicCont (maximalIdeal c.O) fun g => z g i) ∧ ∀ g h, z (g * h) = z g + W.mat σ g *ᵥ z h) → Z.FG := by
  intro l _ c G _ _ _ _ _ m σ Z hΦ hσ hZ
  obtain ⟨hc, hf, hl, -⟩ := UpperTheory.V.abelian₂.dvr_finite l c.O
  obtain ⟨t, ht⟩ := IsDiscreteValuationRing.exists_irreducible c.O
  haveI : IsPrecomplete (maximalIdeal c.O) c.O := hc.toIsPrecomplete
  let ρ := rhDep42_colAction c σ
  have hρ : ∀ g x, ρ g x = W.mat σ g *ᵥ x := fun g x => rfl
  refine rhDep42_cocycles_finitely_generated l t (maximalIdeal c.O) ht.maximalIdeal_eq ht.ne_zero (maximalIdeal.isMaximal c.O).ne_top
    hf hl ρ Z hΦ (fun N x => ?_) (fun z hz => ⟨fun N => ?_, fun g h => ?_⟩)
  · rw [rhDep42_lc_iff]
    intro i
    rw [IsLocallyConstant.iff_eventually_eq]
    intro g
    filter_upwards [Filter.eventually_all.2 fun j => (hσ i j N).eventually_eq g] with g' hg'
    simp only [hρ, Matrix.mulVec, dotProduct, map_sum, map_mul, hg']
  · rw [rhDep42_lc_iff]
    exact fun i => (hZ z hz).1 i N
  · rw [hρ]; exact (hZ z hz).2 g h

theorem rhDep42_integral_bridge :
    ∀ {l : ℕ} [Fact l.Prime] (c : Coef l) {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {m : ℕ} (σ : G →* GL (Fin m) c.O) (Z : Submodule c.O (G → Fin m → c.O)), PhiCond G l → (∀ i j, AdicCont (maximalIdeal c.O) fun g => W.mat σ g i j) → (∀ z ∈ Z, (∀ i, AdicCont (maximalIdeal c.O) fun g => z g i) ∧ ∀ g h, z (g * h) = z g + W.mat σ g *ᵥ z h) → Z.FG := by
  intro l _ c G _ _ _ _ _ m σ Z hΦ hσ hZ
  exact rhDep42_integral c σ Z (fun hker => hΦ _ hker) hσ hZ

private theorem rhDep42_zc_norm {l : ℕ} [Fact l.Prime] (c : Coef l) (x : c.O) : ‖(x : PadicAlgCl l)‖ ≤ 1 := by
  have hi : IsIntegral ℤ_[l] (x : PadicAlgCl l) := (Algebra.IsIntegral.isIntegral (R := ℤ_[l]) x).map c.O.val
  have h0 : ‖(x : PadicAlgCl l)‖ = spectralValue (minpoly ℚ_[l] (x : PadicAlgCl l)) := rfl
  rw [h0, spectralValue_le_one_iff (minpoly.monic (Algebra.IsIntegral.isIntegral _))]
  intro n
  rw [minpoly.isIntegrallyClosed_eq_field_fractions' ℚ_[l] hi, Polynomial.coeff_map]
  exact PadicInt.norm_le_one _

private theorem rhDep42_zc_dvd {l : ℕ} [Fact l.Prime] (c : Coef l) (x y : c.O)
    (h : ‖(x : PadicAlgCl l)‖ < ‖(y : PadicAlgCl l)‖) : y ∣ x := by
  rcases ValuationRing.dvd_total y x with h1 | ⟨u, rfl⟩
  · exact h1
  · exfalso
    rw [Subalgebra.coe_mul, norm_mul] at h
    exact absurd (mul_le_of_le_one_right (norm_nonneg _) (rhDep42_zc_norm c u)) (not_le.2 h)

private theorem rhDep42_zc_ev {l : ℕ} [hl : Fact l.Prime] {G : Type} [TopologicalSpace G] (c : Coef l)
    (f : G → c.O) (hf : Continuous fun g => (f g : PadicAlgCl l)) (N : ℕ) (x : G) :
    ∀ᶠ y in nhds x, (l : c.O) ^ N ∣ f y - f x := by
  have hl0 : (l : PadicAlgCl l) ^ N ≠ 0 := pow_ne_zero _ (Nat.cast_ne_zero.2 hl.out.ne_zero)
  have h1 : ∀ᶠ y in nhds x, ‖(f y : PadicAlgCl l) - f x‖ < ‖(l : PadicAlgCl l) ^ N‖ :=
    ((hf.sub continuous_const).norm.tendsto x).eventually_lt_const (by simpa using norm_pos_iff.2 hl0)
  filter_upwards [h1] with y hy
  exact rhDep42_zc_dvd c _ _ (by push_cast; exact hy)

private theorem rhDep42_zc_split {l : ℕ} [hl : Fact l.Prime] (c c' : Coef l) (hcc : c.O ≤ c'.O) {G : Type} [Group G]
    [TopologicalSpace G] {m : ℕ} (σ : G →* GL (Fin m) c.O) (z : G → Fin m → PadicAlgCl l) (hz : Continuous z)
    (hm : ∀ g i, z g i ∈ c'.O)
    (hc : ∀ g h, z (g * h) = z g + W.mat (W.pushRep (algebraMap c.O (PadicAlgCl l)) σ) g *ᵥ z h) :
    ∃ (n : ℕ) (b : Fin n → PadicAlgCl l) (w : Fin n → G → Fin m → c.O),
      (∀ k, (∀ i, AdicCont (maximalIdeal c.O) fun g => w k g i) ∧
        ∀ g h, w k (g * h) = w k g + W.mat σ g *ᵥ w k h) ∧
      ∀ g i, z g i = ∑ k, b k * (w k g i : PadicAlgCl l) := by
  obtain ⟨-, -, hlm, -⟩ := UpperTheory.V.abelian₂.dvr_finite l c.O
  letI : Algebra c.O c'.O := (Subalgebra.inclusion hcc).toRingHom.toAlgebra
  have ha : ∀ (a : c.O) (x : c'.O), ((a • x : c'.O) : PadicAlgCl l) = a * x := fun _ _ => rfl
  haveI : IsScalarTower ℤ_[l] c.O c'.O := IsScalarTower.of_algebraMap_eq fun _ => rfl
  haveI : Module.Finite c.O c'.O := Module.Finite.of_restrictScalars_finite ℤ_[l] _ _
  haveI : FaithfulSMul c.O c'.O := (faithfulSMul_iff_algebraMap_injective _ _).2 (Subalgebra.inclusion_injective hcc)
  haveI : Module.Free c.O c'.O := Module.free_of_finite_type_torsion_free'
  let b := Module.finBasis c.O c'.O
  let f : G → Fin m → c'.O := fun g i => ⟨z g i, hm g i⟩
  refine ⟨_, fun k => b k, fun k g i => b.coord k (f g i), fun k => ⟨fun i N => ?_, fun g h => ?_⟩, fun g i => ?_⟩
  · refine (IsLocallyConstant.iff_eventually_eq _).2 fun x => ?_
    filter_upwards [rhDep42_zc_ev c' (fun g => f g i) ((continuous_apply i).comp hz) N x] with y ⟨u, hu⟩
    have e : (l : c'.O) ^ N * u = ((l : c.O) ^ N) • u := by rw [Algebra.smul_def, map_pow, map_natCast]
    rw [Ideal.Quotient.eq, ← map_sub, hu, e, map_smul, smul_eq_mul]
    exact Ideal.mul_mem_right _ _ (Ideal.pow_mem_pow hlm N)
  · funext i
    have e : f (g * h) i = f g i + ∑ j, W.mat σ g i j • f h j := Subtype.ext (by
      rw [Subalgebra.coe_add, AddSubmonoidClass.coe_finset_sum]
      exact congrFun (hc g h) i)
    simp only [e, map_add, map_sum, map_smul, Pi.add_apply, Matrix.mulVec, dotProduct, smul_eq_mul]
  · have e := congrArg Subtype.val (b.sum_repr (f g i))
    rw [AddSubmonoidClass.coe_finset_sum] at e
    refine e.symm.trans (Finset.sum_congr rfl fun k _ => ?_)
    rw [ha, mul_comm]
    rfl

theorem rhDep42_colRep :
    ∀ {l : ℕ} [Fact l.Prime] {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {m : ℕ} (σ : G →* GL (Fin m) (Qbar l)), (∃ (c : Coef l) (Q : GL (Fin m) (PadicAlgCl l)) (σ₀ : G →* GL (Fin m) c.O),
      (∀ g, σ g * Q = Q * W.pushRep (algebraMap c.O (PadicAlgCl l)) σ₀ g) ∧
      (∀ i j, AdicCont (maximalIdeal c.O) fun g => W.mat σ₀ g i j) ∧
      rhDep42_localPhi l (rhDep42_resAction (maximalIdeal c.O) (rhDep42_colAction c σ₀))) → Continuous σ → Module.Finite (Qbar l) (Z1 (Loc.colRep σ)) := by
  intro l _ G _ _ _ _ _ m σ hΦ hσ
  classical
  obtain ⟨c, Q, σ₀, hQ, hσ₀, hΦ⟩ := hΦ
  have hQ' : ∀ g, W.pushRep (algebraMap c.O (PadicAlgCl l)) σ₀ g = Q⁻¹ * σ g * Q := fun g => by
    rw [mul_assoc, hQ, inv_mul_cancel_left]
  let Z : Submodule c.O (G → Fin m → c.O) :=
    { carrier := {z | (∀ i, AdicCont (maximalIdeal c.O) fun g => z g i) ∧
          ∀ g h, z (g * h) = z g + W.mat σ₀ g *ᵥ z h}
      add_mem' := fun {a b} ha hb => ⟨fun i N => by
          simp only [Pi.add_apply, map_add]; exact (ha.1 i N).add (hb.1 i N),
        fun g h => by simp only [Pi.add_apply, Matrix.mulVec_add, ha.2 g h, hb.2 g h]; abel⟩
      zero_mem' := ⟨fun i N => by
          simp only [Pi.zero_apply, map_zero]; exact IsLocallyConstant.const _, fun g h => by simp⟩
      smul_mem' := fun r a ha => ⟨fun i N => by
          simp only [Pi.smul_apply, smul_eq_mul, map_mul]
          exact (ha.1 i N).comp (fun x => Ideal.Quotient.mk _ r * x),
        fun g h => by simp only [Pi.smul_apply, Matrix.mulVec_smul, ha.2 g h, smul_add]⟩ }
  obtain ⟨s, hs⟩ := rhDep42_integral c σ₀ Z hΦ hσ₀ fun z hz => hz
  let ι : (G → Fin m → c.O) → G → Fin m → PadicAlgCl l := fun w g i => (w g i : PadicAlgCl l)
  let S : Submodule (PadicAlgCl l) (G → Fin m → PadicAlgCl l) := Submodule.span _ (ι '' s)
  have hS : ∀ w ∈ Z, ι w ∈ S := by
    intro w hw
    rw [← hs] at hw
    induction hw using Submodule.span_induction with
    | mem y hy => exact Submodule.subset_span ⟨y, hy, rfl⟩
    | zero => exact S.zero_mem
    | add y z _ _ hy hz => exact S.add_mem hy hz
    | smul a y _ hy => exact S.smul_mem (a : PadicAlgCl l) hy
  let T : (G → Fin m → PadicAlgCl l) →ₗ[PadicAlgCl l] (G → Fin m → PadicAlgCl l) :=
    (Matrix.toLin' (Q : Matrix (Fin m) (Fin m) (PadicAlgCl l))).compLeft G
  have hfg : (S.map T).FG := (Submodule.fg_span (s.finite_toSet.image ι)).map T
  refine Module.Finite.iff_fg.2 (Submodule.FG.of_le hfg fun z hz => ?_)
  let z' : G → Fin m → PadicAlgCl l := fun g => ((Q⁻¹ : GL (Fin m) (PadicAlgCl l)) : Matrix (Fin m) (Fin m) (PadicAlgCl l)) *ᵥ z g
  have hT : ∀ g, (Q : Matrix (Fin m) (Fin m) (PadicAlgCl l)) *ᵥ z' g = z g := fun g => by
    rw [Matrix.mulVec_mulVec, Units.mul_inv, Matrix.one_mulVec]
  have hz' : Continuous z' := continuous_const.matrix_mulVec hz.1
  have hc' : ∀ g h, z' (g * h) = z' g + W.mat (W.pushRep (algebraMap c.O (PadicAlgCl l)) σ₀) g *ᵥ z' h := by
    intro g h
    have e : W.mat (W.pushRep (algebraMap c.O (PadicAlgCl l)) σ₀) g =
        ((Q⁻¹ * σ g * Q : GL (Fin m) (PadicAlgCl l)) : Matrix (Fin m) (Fin m) (PadicAlgCl l)) := by
      rw [← hQ']; rfl
    rw [e, Units.val_mul, Units.val_mul, ← Matrix.mulVec_mulVec, hT, ← Matrix.mulVec_mulVec, ← Matrix.mulVec_add]
    exact congrArg (fun v => ((Q⁻¹ : GL (Fin m) (PadicAlgCl l)) : Matrix (Fin m) (Fin m) (PadicAlgCl l)) *ᵥ v) (hz.2 g h)
  have hσ₁ : Continuous (W.pushRep (algebraMap c.O (PadicAlgCl l)) σ₀) := by
    rw [show (W.pushRep (algebraMap c.O (PadicAlgCl l)) σ₀ : G → _) = fun g => Q⁻¹ * σ g * Q from funext hQ']
    exact (continuous_const.mul hσ).mul continuous_const
  obtain ⟨c', a, hcc, ha, hm⟩ := UpperTheory.V.Th.Det.cocField c _ z' hσ₁ hz' hc'
  obtain ⟨n, b, w, hw, e⟩ := rhDep42_zc_split c c' hcc σ₀ (a • z') (hz'.const_smul a) hm fun g h => by
    simp only [Pi.smul_apply, hc', smul_add, Matrix.mulVec_smul]
  refine ⟨z', ?_, funext hT⟩
  have e' : a • z' = ∑ k, b k • ι (w k) := by
    funext g i
    rw [e, Finset.sum_apply, Finset.sum_apply]
    rfl
  rw [SetLike.mem_coe, ← S.smul_mem_iff ha, e']
  exact S.sum_mem fun k _ => S.smul_mem _ (hS _ (hw k))

theorem rhDep42_colRep_bridge :
    ∀ {l : ℕ} [Fact l.Prime] {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {m : ℕ} (σ : G →* GL (Fin m) (Qbar l)), PhiCond G l → Continuous σ → Module.Finite (Qbar l) (Z1 (Loc.colRep σ)) := by
  intro l _ G _ _ _ _ _ m σ hΦ hσ
  obtain ⟨c₀, -⟩ := UpperTheory.V.X.So.coefOf l ⊥
  obtain ⟨c, Q, σ₀, -, hQ, hσ₀⟩ := UpperTheory.V.Ws.Eb.intModel c₀ σ hσ
  exact rhDep42_colRep σ ⟨c, Q, σ₀, hQ, hσ₀, fun hker => hΦ _ hker⟩ hσ


theorem rhDep42_local_replay (l : ℕ) [Fact l.Prime] {G M : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [AddCommGroup M] [Finite M] (ρ : G →* AddMonoid.End M) (h : rhDep42_localPhi l ρ) (hl : ∀ m : M, l • m = 0) (hc : ∀ m, IsLocallyConstant fun g => ρ g m) :
    {z : G → M | IsLocallyConstant z ∧ ∀ g h, z (g * h) = z g + ρ g (z h)}.Finite := by
  first
  | (rh_reduce 3 using [rhDep42_lc l ρ h hl hc]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact rhDep42_lc l ρ h hl hc

rh_scan UpperTheory.V.Th.Det.finite_cocycles_colRep_of_phiCond limit 2000
rh_scan rhDep42_colRep limit 2000
rh_scan rhDep42_integral limit 2000
rh_prune rhDep42_lc as rhDep42_lc_pruned
#print axioms UpperTheory.V.Pa.Det.locallyConstant_cocycles_finite_of_phi
#print axioms UpperTheory.V.Th.Det.finite_cocycles_colRep_of_phiCond
#print axioms rhDep42_lc
#print axioms rhDep42_integral
#print axioms rhDep42_colRep
#print axioms rhDep42_colRep_bridge
