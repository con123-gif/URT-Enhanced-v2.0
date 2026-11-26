import Development.AutomorphicArithmetic.AutomorphicVarieties.WeilGroupCharacters.WeilCharactersModular.PhiAll
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000

/-!
Lane 12 RUN43, 26 Nov 2026. SOURCE-MATCHED / human classical proof; PREPARED Lean, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine included), SWARM, HANDOFF, AGENTS, state and recent peer commits read. Root-reachable source path from prior RUN42 72787a07 preserved. Latest peer head observed 86de3c73860ad48d27c6db08318357d240c0e45a: finite trace-orbit cover; edb25260 distinguishes finite length from trace, ce4476bd shared discriminant. No merging uncompiled candidates. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Some continuity root paths returned 404; no claim of full archive review.

RESULT: authenticate the missing actual arithmetic host. ContinuousResP defines V.frame.Γ = GS Ω V.S', where V.S' is finite and includes all places above l; Global defines GS = absolute Galois group / closed normal closure of all inertia outside V.S'. V.frame.G0 is the open eta kernel (native phiAll uses exactly that subgroup). Hence any open residual K in G0 pulls back to an open subgroup of the absolute Galois group, containing the closed normal closure of the outside inertia. No guess about the host or substitution of a different field is required.

Human classical proof of the previously missing qualitative finiteness:
Let F=Lp L and S=V.S', let q:G_F→Γ be the quotient and H the image of K in Γ. The preimage U=q^-1(H) is open and contains N_S; let E=Ω^U, a finite number-field extension of F unramified outside S. Then q|U is onto H, so pullback injects Hom_cont(K,F_l) into Hom_cont(G_E,F_l). More precisely, any such pulled-back character kills N_S, hence factors through an extension unramified at every finite place of E outside S_E: for each such place its inertia in G_E is contained in the inertia in G_F at the place below (and N_S). This also holds for a nonnormal H; no normality assumption on K in Γ is needed. Enlarge S_E to include places over l if necessary and put E'=E(mu_l). Restriction is injective because G_E/G_E' has order dividing l-1, coprime to l (also l=2 is trivial). Choose a primitive l-th root and identify additive F_l with mu_l over E'. Kummer theory maps the restricted characters injectively into A={a in E'^*/E'^*l : v(a) divisible by l outside T}, T the finite primes over S and l. Necessity follows from local valuation: an unramified extension preserves the integer value group, so v(a)/l must be integral. No converse local criterion needed. Exact sequence 0→O_{E',T}^*/(O_{E',T}^*)^l→A→Cl(O_{E',T})[l]→0: use the fractional ideal outside T with exponents v(a)/l, and principal-ideal equality to check kernel and surjectivity. Thus
dim_F_l Hom_cont(K,F_l) <= r_1(E')+r_2(E')-1+|T|+1+dim_F_l Cl(O_{E',T})[l] < infinity.
Here +1 is the cyclic roots-of-unity contribution (mu_l contained); unit rank by Dirichlet, class group finite. This is a qualitative classical proof for the actual host, conditional only on standard Galois/inertia and Kummer/class-group theorems; not a new native proof of those theorems. It does NOT bound the RHS uniformly across l, E', host or windows, does not prove quantitative CountI/V, and does not establish RH. Example obstruction to uniform inference: even finite vector spaces F_l^m have arbitrarily large dimension m. No norm used before exact cancellation.

Native certificate below narrows the actual PhiGS supplier from all finite module H1 to one permutation module for the image of K in Γ; reuses exact section cocycle and identity evaluation on fixed coset (coboundary cancels), then the actual phiSub transport. The permutation cohomology route remains conditional in Lean. host_original keeps original GlobalFiniteness fallback. Native independent compilation of direct Kummer route NOT supplied; no axiom retirement. To integrate RUN42 choose the SAME residual action K, not an arbitrary subgroup with an unrelated representation.

Original selected source graph: TCoreOf → RegDet → finite_cocycles_matrixRepresentation_of_phiCond → column → integral → locallyConstant_cocycles_finite_of_phi; TCoreOf → PhiAll.G0 → phiAll → phiGS → GlobalFiniteness(H1 projection), phiSub; phiAll also supplies local PhiDec and global Γ. Candidate: same residual K → RHDep43.host → RHDep43.singlePhi (one H1 of permR for K.map) + RHDep43.transfer; classical route alternative K→E'→T-unit/class-group bound. Original graph/axioms/unresolved obligations and other consumers retained. Cache by pin/toolchain, exact L Ω s V S' eta, residual action K and actual map, prime, coeff/lattice, H1 module and context; backtrack original if replay fails. No imported claimed RH theorem.

Pinned source ledger:
src/Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/ChebotarevFamilies/PhiGS.lean f97b3c3023e651ae20fc6bfbd7ecb351ab8a57eb
src/Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/DeterminantPadicFree/PhiSub.lean bb1086b3c5b788e209f2962d2137fa3a86663c7e
src/Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/ContinuousResP.lean 924c083d348beb2446a41e0ec51848db9bc36604
src/Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/WeilCharactersModular/PhiAll.lean 9d977ed28d4caf418393b0834a420ec48670ec02
src/ReciprocityTheory/GaloisValuations/Global.lean cb4c9727d3c18cfdf185fa0958a4f11d21a5a43f
src/ReciprocityTheory/Hypotheses/GalCoh.lean a4e5044d290790dfc54db004228d49cd9fdb77e5
src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TCoreOf.lean 118ed364d436cd0e7153e12f6430487eba9fcd39
Executed 31 fail-on-error source/roundtrip checks in connector JS: pinned gs; pinned sub; pinned host; pinned all; pinned global; pinned gf; pinned core; source host Γ := GS Ω V.S'; source host fin : S'.Finite; source host sub : s.S ⊆ S'; source host η_open : IsOpen (η.ker : Set (GS Ω S')); source global abbrev GS := G F Ω ⧸ NS Ω S; source global Subgroup.normalClosure; source global ⋃ v ∈ Sᶜ; source global theorem unramOutside_iff; source all Pa.phiGS hP.gf l L Ω s V; source all Pa.Det.phiSub l V.frame.η.ker V.frame.η_open h; source gs (hGF (Lp L) Ω l 1 M S ρ one_pos habove hρ).2.1; source gf Finite (H0 rhoS) ∧ Finite (H1 rhoS) ∧ Finite (H2 rhoS); source core (hΦ l L Ω s V).2.1; single subgroup premise unique; single subgroup premise reverse; single H1 call unique; single H1 call reverse; expose exact perm unique; expose exact perm reverse; restrict subgroup transport unique; restrict subgroup transport reverse; unchanged quotient cancellation; unchanged cocycle transport; no holes in candidate.
Native Lean/lake absent; git DNS failed. Actual CI status JSON read for 45577239749 and 45576756833: PASS for baseline only. New file not compiled/queued; no new axiom ledger. The original and candidate scan commands below are prepared, not executed.
RESUME HERE: compile RUN42 and RUN43 in existing pinned runner; specialize host at the actual RUN42 residual K and audit native roles and axioms. For human proof record standard Kummer and S-unit/class-group references once. Then stop spending runs on qualitative finiteness and trace the quantitative CountI/V same-host trace and full-window length supplier; the finite class-group bound above gives no uniform scale. Preserve original GlobalFiniteness at other consumers.
HANDOFF TO kernel extractor, literature, Galois, integration, audit.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal IsLocalRing Filter UpperTheory.V.Alg UpperTheory.V.W UpperTheory.V.Pa
namespace RHDep43
def permR (R : Type) [CommRing R] {Γ : Type} [Group Γ] (H : Subgroup Γ) :
    Representation R Γ (Γ ⧸ H → R) where
  toFun g := LinearMap.funLeft R R fun x => g⁻¹ • x
  map_one' := by ext f x; simp
  map_mul' g h := by ext f x; simp [mul_smul]

private theorem permR_apply (R : Type) [CommRing R] {Γ : Type} [Group Γ] (H : Subgroup Γ) (g : Γ) (f : Γ ⧸ H → R)
    (x : Γ ⧸ H) : permR R H g f x = f (g⁻¹ • x) := rfl

private theorem sec_mem {Γ : Type} [Group Γ] (H : Subgroup Γ) (g : Γ) (x : Γ ⧸ H) :
    (x.out)⁻¹ * g * (g⁻¹ • x).out ∈ H := by
  have e : ((g⁻¹ * x.out : Γ) : Γ ⧸ H) = ((g⁻¹ • x).out : Γ ⧸ H) := by
    rw [QuotientGroup.out_eq']
    conv_rhs => rw [← QuotientGroup.out_eq' x]
    rfl
  have hm := QuotientGroup.eq.mp e
  simpa [mul_inv_rev, mul_assoc] using hm

private theorem core_lemma {Γ : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] (H K : Subgroup Γ)
    [Finite (Γ ⧸ H)] (hK : IsOpen (K : Set Γ)) (hKH : K ≤ H) :
    ∃ U : Set Γ, IsOpen U ∧ (1 : Γ) ∈ U ∧ ∀ k ∈ U, ∀ y : Γ ⧸ H, (y.out)⁻¹ * k * y.out ∈ K ∧ k • y = y := by
  refine ⟨⋂ y : Γ ⧸ H, (fun k => (y.out)⁻¹ * k * y.out) ⁻¹' (K : Set Γ), ?_, ?_, ?_⟩
  · exact isOpen_iInter_of_finite fun y =>
      hK.preimage ((continuous_const.mul continuous_id).mul continuous_const)
  · simp
  · intro k hk y
    have hy : (y.out)⁻¹ * k * y.out ∈ K := Set.mem_iInter.mp hk y
    refine ⟨hy, ?_⟩
    rw [← QuotientGroup.out_eq' y, MulAction.Quotient.smul_mk, QuotientGroup.eq]
    have hi := H.inv_mem (hKH hy)
    simpa [mul_assoc] using hi

private theorem mult_map_mul_right_eq_of_chi_eq_one {Γ : Type} [Group Γ] (H : Subgroup Γ) (g g' : Γ) (x : Γ ⧸ H)
    (h : (g⁻¹ * g') • (g⁻¹ • x) = g⁻¹ • x) : g'⁻¹ • x = g⁻¹ • x := by
  calc g'⁻¹ • x = (g⁻¹ * g')⁻¹ • (g⁻¹ • x) := by
        rw [← mul_smul]
        congr 1
        group
    _ = g⁻¹ • x := by rw [inv_smul_eq_iff, h]

theorem singlePhi {Γ : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ] (n : ℕ)
    [NeZero n] (H : Subgroup Γ) (hH : IsOpen (H : Set Γ))
    (h : ContAction (permR (ZMod n) H) → Finite (H1 (permR (ZMod n) H))) :
    Finite {φ : H →* Multiplicative (ZMod n) // IsOpen (φ.ker : Set H)} := by
  haveI : Finite (Γ ⧸ H) := Subgroup.quotient_finite_of_isOpen H hH
  obtain ⟨U₀, hU₀o, hU₀1, hU₀⟩ := core_lemma H H hH le_rfl
  have hρ : ContAction (permR (ZMod n) H) := by
    show Continuous fun p : Γ × (Γ ⧸ H → ZMod n) => permR (ZMod n) H p.1 p.2
    apply IsLocallyConstant.continuous
    rw [IsLocallyConstant.iff_eventually_eq]
    rintro ⟨g, m⟩
    have hmem : {p : Γ × (Γ ⧸ H → ZMod n) | g⁻¹ * p.1 ∈ U₀ ∧ p.2 = m} ∈ nhds (g, m) := by
      apply IsOpen.mem_nhds
      · exact (hU₀o.preimage (continuous_const.mul continuous_fst)).inter
          ((isOpen_discrete {m}).preimage continuous_snd)
      · simp [hU₀1]
    filter_upwards [hmem] with p hp
    obtain ⟨hk, hp2⟩ := hp
    show permR (ZMod n) H p.1 p.2 = permR (ZMod n) H g m
    rw [hp2]
    funext y
    rw [permR_apply, permR_apply, mult_map_mul_right_eq_of_chi_eq_one H g p.1 y (hU₀ _ hk (g⁻¹ • y)).2]
  have hcoc : ∀ φ : H →* Multiplicative (ZMod n), IsOpen (φ.ker : Set H) →
      (fun (g : Γ) (x : Γ ⧸ H) => Multiplicative.toAdd (φ ⟨(x.out)⁻¹ * g * (g⁻¹ • x).out, sec_mem H g x⟩))
        ∈ Z1 (permR (ZMod n) H) := by
    intro φ hφ
    show Continuous _ ∧ _
    constructor
    · have hKo : IsOpen ((φ.ker.map H.subtype : Subgroup Γ) : Set Γ) := by
        rw [Subgroup.coe_map]
        exact hH.isOpenMap_subtype_val _ hφ
      obtain ⟨U, hUo, hU1, hU⟩ := core_lemma H (φ.ker.map H.subtype) hKo (Subgroup.map_subtype_le _)
      apply IsLocallyConstant.continuous
      rw [IsLocallyConstant.iff_eventually_eq]
      intro g
      have hmem : {g' : Γ | g⁻¹ * g' ∈ U} ∈ nhds g :=
        (hUo.preimage (continuous_const.mul continuous_id)).mem_nhds (by simp [hU1])
      filter_upwards [hmem] with g' hk
      funext x
      obtain ⟨hK, hfix⟩ := hU _ hk (g⁻¹ • x)
      obtain ⟨b, hb, hbv⟩ := Subgroup.mem_map.mp hK
      have e1 := mult_map_mul_right_eq_of_chi_eq_one H g g' x hfix
      have e2 : (⟨(x.out)⁻¹ * g' * (g'⁻¹ • x).out, sec_mem H g' x⟩ : H) =
          ⟨(x.out)⁻¹ * g * (g⁻¹ • x).out, sec_mem H g x⟩ * b := by
        apply Subtype.ext
        show (x.out)⁻¹ * g' * (g'⁻¹ • x).out = (x.out)⁻¹ * g * (g⁻¹ • x).out * (b : Γ)
        rw [show (b : Γ) = _ from hbv, e1]
        group
      show Multiplicative.toAdd (φ _) = Multiplicative.toAdd (φ _)
      rw [e2, map_mul, (MonoidHom.mem_ker).mp hb, mul_one]
    · intro g h
      funext x
      simp only [Pi.add_apply, permR_apply]
      rw [← toAdd_mul, ← map_mul]
      refine congrArg (fun y : H => Multiplicative.toAdd (φ y)) (Subtype.ext ?_)
      show (x.out)⁻¹ * (g * h) * ((g * h)⁻¹ • x).out =
        (x.out)⁻¹ * g * (g⁻¹ • x).out * (((g⁻¹ • x).out)⁻¹ * h * (h⁻¹ • (g⁻¹ • x)).out)
      rw [mul_inv_rev, mul_smul]
      group
  haveI := h hρ
  refine Finite.of_injective (fun χ : {φ : H →* Multiplicative (ZMod n) // IsOpen (φ.ker : Set H)} =>
    (Submodule.Quotient.mk ⟨_, hcoc χ.1 χ.2⟩ : H1 (permR (ZMod n) H))) ?_
  rintro ⟨φ, hφ⟩ ⟨ψ, hψ⟩ hEq
  obtain ⟨m, hm⟩ := LinearMap.mem_range.mp (Submodule.mem_comap.mp ((Submodule.Quotient.eq _).mp hEq))
  apply Subtype.ext
  ext h0
  obtain ⟨x0, hx0⟩ : ∃ x0 : Γ ⧸ H, x0 = ((1 : Γ) : Γ ⧸ H) := ⟨_, rfl⟩
  have ha : x0.out ∈ H := by
    have e : ((x0.out : Γ) : Γ ⧸ H) = ((1 : Γ) : Γ ⧸ H) := by rw [QuotientGroup.out_eq', hx0]
    simpa using H.inv_mem (QuotientGroup.eq.mp e)
  obtain ⟨g, hg⟩ : ∃ g : Γ, g = x0.out * h0 * (x0.out)⁻¹ := ⟨_, rfl⟩
  have hgH : g ∈ H := hg ▸ H.mul_mem (H.mul_mem ha h0.2) (H.inv_mem ha)
  have hgx0 : g⁻¹ • x0 = x0 := by
    rw [hx0, MulAction.Quotient.smul_mk, QuotientGroup.eq]
    simpa using hgH
  have hel : ∀ (y : Γ ⧸ H) (hy : y = g⁻¹ • x0) (pr : (x0.out)⁻¹ * g * y.out ∈ H),
      (⟨(x0.out)⁻¹ * g * y.out, pr⟩ : H) = h0 := by
    intro y hy pr
    apply Subtype.ext
    show (x0.out)⁻¹ * g * y.out = (h0 : Γ)
    rw [hy, hgx0, hg]
    group
  have hx : m (g⁻¹ • x0) - m x0 =
      Multiplicative.toAdd (φ ⟨(x0.out)⁻¹ * g * (g⁻¹ • x0).out, sec_mem H g x0⟩) -
        Multiplicative.toAdd (ψ ⟨(x0.out)⁻¹ * g * (g⁻¹ • x0).out, sec_mem H g x0⟩) :=
    congrFun (congrFun hm g) x0
  rw [hel _ rfl, hgx0, sub_self] at hx
  have hx' : (0 : ZMod n) = Multiplicative.toAdd (φ h0) - Multiplicative.toAdd (ψ h0) := hx
  have h2 : Multiplicative.toAdd (φ h0) = Multiplicative.toAdd (ψ h0) :=
    (sub_eq_zero (G := ZMod n)).mp hx'.symm
  exact Multiplicative.toAdd.injective h2


theorem transfer (l : ℕ) {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H : Subgroup G) (K : Subgroup H)
    (h : Finite {φ : K.map H.subtype →* Multiplicative (ZMod l) // IsOpen (φ.ker : Set (K.map H.subtype))}) :
    Finite {φ : K →* Multiplicative (ZMod l) // IsOpen (φ.ker : Set K)} := by
  haveI := h
  let e := Subgroup.equivMapOfInjective K H.subtype H.subtype_injective
  have he : ∀ y : K.map H.subtype, (((e.symm y : K) : H) : G) = (y : G) := fun y =>
    congrArg Subtype.val (e.apply_symm_apply y)
  have hc : Continuous fun y : K.map H.subtype => (e.symm y : K) := by
    apply continuous_induced_rng.2
    apply continuous_induced_rng.2
    exact continuous_subtype_val.congr fun y => (he y).symm
  refine Finite.of_injective
    (β := {ψ : K.map H.subtype →* Multiplicative (ZMod l) // IsOpen (ψ.ker : Set (K.map H.subtype))})
    (fun φ => ⟨φ.1.comp e.symm.toMonoidHom, by
      show IsOpen ((fun y => (e.symm y : K)) ⁻¹' (φ.1.ker : Set K))
      exact φ.2.preimage hc⟩) ?_
  intro φ ψ h
  apply Subtype.ext
  ext k
  have h' := congrArg (fun χ : {ψ : K.map H.subtype →* Multiplicative (ZMod l) //
    IsOpen (ψ.ker : Set (K.map H.subtype))} => χ.1 (e k)) h
  simpa using h'


theorem host (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [IsCMField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (s : HidaSetting l L Ω) (V : s.Lev)
    (K : Subgroup V.frame.η.ker) (hK : IsOpen (K : Set V.frame.η.ker))
    (h : ContAction (permR (ZMod l) (K.map V.frame.η.ker.subtype)) →
      Finite (H1 (permR (ZMod l) (K.map V.frame.η.ker.subtype)))) :
    Finite {φ : K →* Multiplicative (ZMod l) // IsOpen (φ.ker : Set K)} := by
  haveI : NeZero l := ⟨(Fact.out : l.Prime).ne_zero⟩
  have hK' : IsOpen ((K.map V.frame.η.ker.subtype : Subgroup V.frame.Γ) : Set V.frame.Γ) := by
    rw [Subgroup.coe_map]
    exact V.frame.η_open.isOpenMap_subtype_val _ hK
  exact transfer l V.frame.η.ker K (singlePhi l _ hK' h)

-- Compatibility bridge retains the exact original global premise; not a proof of it.
theorem host_original (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [IsCMField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (s : HidaSetting l L Ω) (V : s.Lev)
    (K : Subgroup V.frame.η.ker) (hK : IsOpen (K : Set V.frame.η.ker))
    (hGF : GlobalFiniteness) :
    Finite {φ : K →* Multiplicative (ZMod l) // IsOpen (φ.ker : Set K)} := by
  exact (Pa.Det.phiSub l V.frame.η.ker V.frame.η_open (Pa.phiGS hGF l L Ω s V)) K hK

theorem host_replay (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [IsCMField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (s : HidaSetting l L Ω) (V : s.Lev)
    (K : Subgroup V.frame.η.ker) (hK : IsOpen (K : Set V.frame.η.ker))
    (h : ContAction (permR (ZMod l) (K.map V.frame.η.ker.subtype)) →
      Finite (H1 (permR (ZMod l) (K.map V.frame.η.ker.subtype)))) :
    Finite {φ : K →* Multiplicative (ZMod l) // IsOpen (φ.ker : Set K)} := by
  first
  | (rh_reduce 3 using [host l L Ω s V K hK h]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact host l L Ω s V K hK h

end RHDep43

rh_scan UpperTheory.V.W.phiAll limit 2000
rh_scan UpperTheory.V.Pa.phiGS limit 2000
rh_scan RHDep43.host limit 2000
rh_scan RHDep43.host_original limit 2000
rh_prune RHDep43.transfer as RHDep43_transfer_pruned
#print axioms UpperTheory.V.W.phiAll
#print axioms UpperTheory.V.Pa.phiGS
#print axioms RHDep43.singlePhi
#print axioms RHDep43.transfer
#print axioms RHDep43.host
#print axioms RHDep43.host_original
