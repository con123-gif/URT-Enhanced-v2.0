import RHCharacterTame41
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.SelmerTransport.Places
import Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.SoDecNe

/-!
RUN42, 26 Nov 2026 — SOURCE-MATCHED derivation; PREPARED Lean, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4; pinned initial mission 4a45e612; AGENTS 8db0201d, protocol 4b77b161, handoff bbc46df7, expansion c8152d07, continuity 61459cfd, state/log/protocol/CI consulted. Latest peers 49cea008, 72787a07, f304da1a, 4ec1ff21 (handoffs read); others  ea6dac73, cdd5e8d1, ad6e9dab, 65a89b19, 3fae1b857, b0fd82e7, 57df69df, c9fdbd77, 706da3bb (titles checked). None addresses this existing native places supplier. Upstream latest observed 388ec4364376d78ea8d33c0f9e79a91e8b319f3a (CI change); retain pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Source path prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
GaloisLibrary/SelmerTransport/Places.lean f820992a67840914d259c93cee63a4fc5c5baa26
LevelCohomology/SoDecNe.lean 0c7f77ff142f96b2cde9aa70814e94c96255ab1b
LevelCohomology/CobDown.lean b879489f7a7b2dbbb325d8e219cbec88dfdcadbc
LevelCohomology/SoLineNeg.lean bc274f45064e9d602be9f6b0079fc8f03ec8b1dd
CharacterLevelBounds/ShaFamMono.lean f1b517fa7cddda3e25b5a7ba89c1e57096bbf59e
GaloisLibrary/KummerTheory/DecGen.lean 9eadeed2ac40e2071061482913bdd458edaeb5ac
RUN41 778190b49835c8c6da4fa62594da21a226dbfc9c blob 52bec7b12341cf7d6706e1ac164e8262d354de86.

NEW: the missing cyclotomic triviality on inertia is ALREADY a native theorem: UpperTheory.V.Base.places, fourth projection. Given place A over v away from l, the third projection shows A.valuation(l) is not <1, and fourth gives Ine A <= ker(cycZ). Thus t in ker psi intersect Ine A implies theta(t)=1 for theta=(Chr.Psi l e psi)^-1. This uses an actual theorem body (root-of-unity separation argument), not a new premise. It is already imported by the original SoCocL. The finite-character/Frobenius witness is also supplied by native lemmas: choose sigma by exists_isFrob hA, m=psi.ker.index>0 from open kernel, F=sigma^m, q=(normV v)^m>1. pow_index_mem gives psi(F)=1 and cycZ_of_isFrob gives cycZ(F)=q. Hence theta(F) q^e=1. No assumption on tame inertia is used in either identity. Native decGen has private frob_pow for independent confirmation, but it is not needed here. No auxiliary extension.
Exact remaining transport premise TameRelation42: for each original v,A, arithmetic sigma, positive m and t in inertia (away from l), find p,w with l not dividing p, sigma^m*t = t^((normV v)^m)*sigma^m*w and w^(p^a)->1. The classical tame-quotient theorem with wild pro-p kernel supplies this abstractly, but native valuation/topology transport has NOT been located/proved. This formulation for all sigma,m,t is sufficient, not logically weaker than RUN41 in every quantifier; we only claim to discharge two explicit witness conditions constructively, and isolate the remaining geometric local supplier. No uniform arithmetic estimate established.
Original graph retained: CountV -> hostVanE -> lineNeg -> soCocL -> locTors -> locKill, decNe, cobLim; soCocL -> places, cobPlace, soCoc (and global/above-l branches). Candidate (not substituted): RUN40 away inertia adapter -> RUN41.zero_of_transport41 -> RUN42.transport_of_relation42 -> native places + exists_isFrob + cycZ_of_isFrob + finite quotient + TameRelation42. Preserve all original fallback nodes, roles, unresolved axioms; do not infer global deletion. Context key includes source/toolchain, k/Omega/l/c/psi/e/v/A, sigma/m/t, and actual cocycle for later bridge. All actual lineNeg instances use k=Q; general lemma retained for compatibility.
Executed 27 connector assertions (6 exact pinned blob hashes + 18 literal source matches + 3 prior-certificate source matches). No numerical simulation needed. Baseline CI status JSON blobs b1c96f58/7da35494 and job lists reread: 45577239749 and 45576756833 both returncode 0, conditional root axioms propext/Classical.choice/Quot.sound. No new Lean or axioms replay: local lean/lake absent; baseline CI does not cover this file. To replay in warmed pinned upstream root: copy RUN41 to RHCharacterTame41.lean, this file to RHCharacterNative42.lean; compile the three existing reduction engine modules and RUN41 to oleans in LEAN_PATH, then lake env lean RHCharacterNative42.lean. Preserve actual errors and axioms. No proof of RH claimed.
RESUME HERE: prove TameRelation42 at the original absolute valuation place, preferably via finite ramification quotients and Krull neighbourhoods; use the already supplied cyclotomic/Frobenius lemmas, not another independent local assumption. Compile RUN41+42 and RUN40 actual caller bridge; if necessary repair from actual compiler diagnostics. HANDOFF TO local Galois, kernel, audit, integration.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X
open Filter Topology
namespace RHCharacterNative42

theorem norm_gt_one {k : Type} [Field k] [NumberField k]
    (v : HeightOneSpectrum (𝓞 k)) : 1 < normV v := by
  have h : normV v = Ideal.absNorm v.asIdeal := by
    rw [Ideal.absNorm_apply, Submodule.cardQuot_apply]; rfl
  rw [h]
  have h0 : Ideal.absNorm v.asIdeal ≠ 0 := fun h0 => v.ne_bot (Ideal.absNorm_eq_zero_iff.1 h0)
  have h1 : Ideal.absNorm v.asIdeal ≠ 1 := fun h1 => v.isPrime.ne_top (Ideal.absNorm_eq_one_iff.1 h1)
  omega

theorem inertia_theta {k Ω : Type} [Field k] [NumberField k] [Field Ω]
    [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime]
    (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ) (e : ℕ)
    (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω)
    (hA : IsPlaceOver A v) (hv : ((l : ℕ) : 𝓞 k) ∉ v.asIdeal)
    (t : G k Ω) (ht : t ∈ ψ.ker ⊓ Ine (F := k) A) :
    (Chr.Psi l e ψ)⁻¹ t = 1 := by
  have hnot : ¬ A.valuation (l : Ω) < 1 := by
    intro h
    exact hv (((places k Ω l A).2.2.1 v hA).mp h)
  have hcy : cycZ k Ω l t = 1 :=
    (places k Ω l A).2.2.2 hnot ht.2
  have hψ : ψ t = 1 := ht.1
  have hchi : chiO k Ω l c.O t = 1 := by
    apply Units.ext
    change algebraMap ℤ_[l] c.O (cycZ k Ω l t : ℤ_[l]) = (1 : c.O)
    rw [hcy, Units.val_one, map_one]
  simp [Chr.Psi, MonoidHom.mul_apply, MonoidHom.zpow_apply, hchi, hψ]

theorem frob_theta {k Ω : Type} [Field k] [NumberField k] [Field Ω]
    [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime]
    (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ) (e : ℕ)
    (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω)
    (hA : IsPlaceOver A v) (hv : ((l : ℕ) : 𝓞 k) ∉ v.asIdeal)
    (σ : G k Ω) (hσ : IsFrob A (normV v) σ)
    (m : ℕ) (hψ : ψ (σ^m) = 1) :
    (((Chr.Psi l e ψ)⁻¹ (σ^m) : c.Oˣ) : c.O) *
      (((normV v)^m : ℕ) : c.O)^e = 1 := by
  have hcy : (cycZ k Ω l (σ^m) : ℤ_[l]) = (((normV v)^m : ℕ) : ℤ_[l]) := by
    rw [map_pow, Units.val_pow_eq_pow_val, cycZ_of_isFrob hv hA hσ, Nat.cast_pow]
  have hchi : (chiO k Ω l c.O (σ^m) : c.O) = (((normV v)^m : ℕ) : c.O) := by
    change algebraMap ℤ_[l] c.O (cycZ k Ω l (σ^m) : ℤ_[l]) = _
    rw [hcy, map_natCast]
  have h : (((Chr.Psi l e ψ)⁻¹ (σ^m) : c.Oˣ) : c.O) *
      (ψ (σ^m) : c.O) * (chiO k Ω l c.O (σ^m) : c.O)^e = 1 := by
    rw [← Units.val_pow_eq_pow_val, ← Units.val_mul, ← Units.val_mul, Units.val_eq_one]
    show (chiO k Ω l c.O (σ^m) ^ (e : ℤ) * ψ (σ^m))⁻¹ *
      ψ (σ^m) * chiO k Ω l c.O (σ^m)^e = 1
    rw [zpow_natCast, mul_assoc, mul_comm (ψ (σ^m)), inv_mul_cancel]
  rwa [hψ, Units.val_one, mul_one, hchi] at h

def TameRelation42 : Prop :=
  ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω]
    [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime]
    (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω),
    IsPlaceOver A v → ((l : ℕ) : 𝓞 k) ∉ v.asIdeal →
    ∀ (σ : G k Ω), IsFrob A (normV v) σ →
    ∀ (m : ℕ), 0 < m → ∀ t ∈ Ine (F := k) A,
      ∃ (p : ℕ) (w : G k Ω), ¬ l ∣ p ∧
        σ^m*t = t^((normV v)^m)*σ^m*w ∧
        Tendsto (fun a : ℕ => w^(p^a)) atTop (𝓝 1)

theorem transport_of_relation42 (hT : TameRelation42) :
    RHCharacterTame41.AwayTameTransport41 := by
  intro k Ω _ _ _ _ _ l hl c ψ ho e he z hz hc v A hv hvl t ht
  haveI : IsGalois k Ω := {}
  haveI : Finite (G k Ω ⧸ ψ.ker) := Subgroup.quotient_finite_of_isOpen _ ho
  have hm : ψ.ker.index ≠ 0 := Subgroup.index_ne_zero_of_finite
  obtain ⟨σ,hσ⟩ := exists_isFrob hv
  obtain ⟨p,w,hp,hr,hlim⟩ :=
    hT k Ω l v A hv hvl σ hσ ψ.ker.index (Nat.pos_of_ne_zero hm) t ht.2
  have hpψ : ψ (σ^ψ.ker.index) = 1 := ψ.ker.pow_index_mem σ
  refine ⟨σ^ψ.ker.index,w,p,(normV v)^ψ.ker.index,hp,
    Nat.one_lt_pow hm (norm_gt_one v), inertia_theta l c ψ e v A hv hvl t ht,
    frob_theta l c ψ e v A hv hvl σ hσ ψ.ker.index hpψ,hr,hlim⟩

theorem inertia_zero42 (hT : TameRelation42) : RHCharacterTame41.AwayInertiaZero41 :=
  RHCharacterTame41.zero_of_transport41 (transport_of_relation42 hT)

example (hT : TameRelation42) : RHCharacterTame41.AwayInertiaZero41 := by
  first
  | (rh_reduce 3 using [inertia_zero42,transport_of_relation42,RHCharacterTame41.zero_of_transport41]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact inertia_zero42 hT

end RHCharacterNative42

rh_scan UpperTheory.V.Base.places limit 2000
rh_scan UpperTheory.V.X.So.soCocL limit 2000
rh_scan RHCharacterNative42.inertia_zero42 limit 2000
rh_prune RHCharacterNative42.transport_of_relation42 as RHCharacterNative42.TransportPruned
#print axioms UpperTheory.V.Base.places
#print axioms RHCharacterNative42.inertia_theta
#print axioms RHCharacterNative42.frob_theta
#print axioms RHCharacterNative42.transport_of_relation42
#print axioms RHCharacterNative42.inertia_zero42
