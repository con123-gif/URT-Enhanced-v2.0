import Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.SoHostVanE
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.SelmerTransport.DvrFacts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN41 character boxes, 25 Nov 2026 — SOURCE-MATCHED human derivation and PREPARED Lean, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine), AGENTS 8db0201d, SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, continuity 61459cfd, state/log/protocol/CI consulted. Prior RUN40 dbbc49e3 blob a72a9bb35f47cc07be431232a8c9385acdc73e66; audit 3e19ae4d. Peers 7f95819c, 3b2b21cf, 20450987, fc0d0ec6, c8cb579a, 5adee016, a824904c, 619e11df, 700e3969, a35ccf3d, 1c2ef505, 2ff2915c inspected. Integration RUN42 qualitative Sha route independent, not composed or assumed checked.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Latest observed upstream README commit 9211277d096b7abc3f9c30184bdb2e32d98dcffb; no switch.
Native source blobs relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
LevelCohomology/SoDefs.lean b3bbfe232c241fbf3f147b255dcf5b49b2d7d229
LevelCohomology/SoCobLim.lean a81309da5930263d568d2b9d86f9471ce06b5383
LevelCohomology/SoDecNe.lean 0c7f77ff142f96b2cde9aa70814e94c96255ab1b
LevelCohomology/SoCocL.lean dcf4e5309372b443b989f37055d34a1071aa9140
LevelCohomology/SoLineNeg.lean bc274f45064e9d602be9f6b0079fc8f03ec8b1dd
CharacterLevelBounds/DecCyc.lean 6ef3631dafc29edd7d1fdfb83da5d500847e2889
GaloisLibrary/SelmerTransport/DvrFacts.lean e847b713c9c9c53e361b18d43a80ef07af34ebda

NEW: remove extension-of-place transport and exact absolute tame relation. Fix ORIGINAL v,A, theta=(Chr.Psi l e psi)^(-1), and t in ker psi intersect inertia. Choose arithmetic Frobenius sigma via exists_isFrob hA; m=psi.ker.index>0 by quotient finiteness, F=sigma^m, q=(normV v)^m>1. psi(F)=1 by pow_index_mem; cycZ_of_isFrob gives theta(F) q^e=1. Cyclotomic character unramified away from l implies theta(t)=1. Tame Frobenius conjugacy gives w=(t^q F)^(-1) F t in wild inertia W at ORIGINAL place. No auxiliary extension/residue field or exact tame relation in absolute group. theta(w)=1 follows algebraically from F t=t^q F w. For residue characteristic p != l, dvrFacts shows p unit in c.O. Wild inertia pro-p gives w^(p^a) -> 1: in each finite p-group quotient sufficiently large p-power is identity. Native adic continuity then gives for each uniformizer depth r some a with z(w^(p^a))=0 mod uniformizer^r. As theta(w)=1, z(w^(p^a))=p^a z(w); p is unit so uniformizer^r divides z(w). FiniteMultiplicity, as in native So.cobLim, forces z(w)=0. Consequently
  (theta(F)-q) z(t)=0, theta(F) q^e=1, q^(e+1)>1,
hence z(t)=0. F,q,w fixed before depth r. No uniform choice of a needed. No independent character condition on W, local cardinality estimates or full Dec coboundary. The finite-depth transport is proved below from actual Coc and Alg.AdicCont, conditional on the tame witness. Remaining native obligations: construct F,q,p,w using source cyclotomic/index lemmas; prove cyclotomic triviality on inertia, tame quotient relation and pro-p convergence in native absolute valuation topology. Search for tameInertia, wildInertia and tame inertia Frobenius returned no hits; not evidence of absence. Standard local-field mathematics (audit 3e19ae4d) supplies these in usual theory; no native transport established here.

Original graph unchanged: CountV -> hostVanE -> lineNeg -> soCocL -> locTors -> locKill, decNe, cobLim, plus above-l and global branches. RUN40 candidate replaces away-l by AwayInertiaZero40 -> away40_of_zero -> soCocL40. This candidate supplies text-identical proposition AwayInertiaZero41 via transport41 -> wildZero41 -> finite multiplicity + exact cancellation. No global removal; keep original and RUN40 fallback, all other branches and axioms. Cache key includes source/toolchain and actual k/Omega/l/c/psi/e/z/v/A/t,F,q,w. No merging different local contexts. Bridge to RUN40 definitional equality still needs replay.
Executed connector JS: 12600 exact integer unit cancellation regressions, 20 nonunit negative controls. Reproduce: l in [2,3,5,7,11], p in [2,3,5,7,11,13], p!=l, r=1..4, m=0..5, x=-10..10, assert ((p^m*x mod l^r)==0) iff (x mod l^r==0); controls l^r*1 mod l^r==0 but 1 mod l^r!=0. These are algebra regressions only, not local Galois simulations or RH evidence. CI statuses b1c96f58/7da35494 and job lists reread: returncode 0 for 45577239749 and 45576756833; conditional root axioms propext/Classical.choice/Quot.sound. Local lean/lake absent. No new CI or kernel/axiom validation claimed. Native commands prepared, not executed.
RESUME HERE: identify/implement native tame quotient and pro-p convergence; construct same-place witness from exists_isFrob, cycZ_of_isFrob and pow_index_mem, compile this and RUN40, substitute at actual CountV; preserve both branches and axiom outputs. HANDOFF TO audit/local Galois/kernel/integration.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X
open Filter Topology
namespace RHCharacterTame41

theorem cocZero {O Γ : Type} [CommRing O] [Group Γ]
    (θ : Γ →* Oˣ) (z : Γ → O) (hz : Coc θ z) : z 1 = 0 := by
  have h := hz 1 1
  simp only [one_mul, map_one, Units.val_one] at h
  linear_combination -h

theorem cocPow {O Γ : Type} [CommRing O] [Group Γ]
    (θ : Γ →* Oˣ) (z : Γ → O) (hz : Coc θ z)
    (w : Γ) (hw : θ w = 1) (n : ℕ) : z (w^n) = (n : O)*z w := by
  induction n with
  | zero => simp [cocZero θ z hz]
  | succ n ih =>
    rw [pow_succ, hz, ih, map_pow, hw, one_pow, Units.val_one]
    push_cast
    ring

theorem unitDvd {O : Type} [CommRing O] (u : Oˣ) (a x : O) (m : ℕ)
    (h : a ∣ (u : O)^m * x) : a ∣ x := by
  obtain ⟨b,hb⟩ := h
  have hU : ((↑(u⁻¹) : O)^m) * (u : O)^m = 1 := by
    rw [← mul_pow]
    simp
  refine ⟨((↑(u⁻¹) : O)^m)*b, ?_⟩
  calc x = ((↑(u⁻¹) : O)^m) * ((u : O)^m*x) := by rw [← mul_assoc,hU,one_mul]
    _ = _ := by rw [hb]; ring

theorem wildZero41 {O Γ : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Group Γ] [TopologicalSpace Γ] (θ : Γ →* Oˣ) (z : Γ → O)
    (hz : Coc θ z) (hc : Alg.AdicCont (maximalIdeal O) z)
    (w : Γ) (hw : θ w = 1) (p : ℕ) (u : Oˣ) (hu : (u : O) = (p : O))
    (htend : Tendsto (fun m : ℕ => w^(p^m)) atTop (𝓝 1)) : z w = 0 := by
  by_contra hnz
  obtain ⟨ϖ,hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
  obtain ⟨n,hn⟩ := FiniteMultiplicity.of_not_isUnit hϖ.not_isUnit hnz
  apply hn
  have hloc := (IsLocallyConstant.iff_eventually_eq _).1 (hc (n+1))
  have hev := htend.eventually (hloc 1)
  obtain ⟨m,hm⟩ := hev.exists
  rw [Ideal.Quotient.eq, cocZero θ z hz, sub_zero,
    (IsDiscreteValuationRing.irreducible_iff_uniformizer ϖ).1 hϖ,
    Ideal.span_singleton_pow, Ideal.mem_span_singleton,
    cocPow θ z hz w hw, Nat.cast_pow, ← hu] at hm
  exact unitDvd u _ _ m hm

theorem errorCancel41 {O Γ : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Group Γ] [TopologicalSpace Γ] (θ : Γ →* Oˣ) (z : Γ → O)
    (hz : Coc θ z) (hc : Alg.AdicCont (maximalIdeal O) z)
    (F t w : Γ) (p q : ℕ) (u : Oˣ) (hu : (u : O) = (p : O))
    (ht : θ t = 1) (hne : (θ F : O) ≠ (q : O))
    (hrel : F*t = t^q*F*w)
    (htend : Tendsto (fun m : ℕ => w^(p^m)) atTop (𝓝 1)) : z t = 0 := by
  have h := congrArg θ hrel
  simp only [map_mul,map_pow,ht,one_pow,one_mul,mul_one] at h
  have hw : θ w = 1 := mul_left_cancel (show θ F * θ w = θ F * 1 by simpa using h.symm)
  have hzw := wildZero41 θ z hz hc w hw p u hu htend
  have he := congrArg z hrel
  rw [hz F t, hz (t^q*F) w, hzw, mul_zero, add_zero, hz (t^q) F,
    cocPow θ z hz t ht, map_pow, ht, one_pow, Units.val_one] at he
  have hk : ((θ F : O) - (q : O))*z t = 0 := by linear_combination he
  exact (mul_eq_zero.mp hk).resolve_left (sub_ne_zero.mpr hne)

theorem negWeightNe41 {O : Type} [CommRing O] [CharZero O] (a : O) (q e : ℕ)
    (hq : 1 < q) (ha : a*(q : O)^e = 1) : a ≠ (q : O) := by
  intro h
  have hp : (q : O)^(e+1) = 1 := calc
    _ = (q : O)*(q : O)^e := by rw [pow_succ,mul_comm]
    _ = a*(q : O)^e := congrArg (fun x : O => x*(q : O)^e) h.symm
    _ = 1 := ha
  have hnat : q^(e+1) = 1 := by exact_mod_cast hp
  exact (Nat.one_lt_pow (Nat.succ_ne_zero e) hq).ne' hnat

def AwayInertiaZero41 : Prop :=
  ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → ∀ z : G k Ω → c.O, Coc (Chr.Psi l e ψ)⁻¹ z → Alg.AdicCont (maximalIdeal c.O) z → ∀ (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω), IsPlaceOver A v → ((l : ℕ) : 𝓞 k) ∉ v.asIdeal → ∀ g ∈ ψ.ker ⊓ Ine (F := k) A, z g = 0

def AwayTameTransport41 : Prop :=
  ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → ∀ z : G k Ω → c.O, Coc (Chr.Psi l e ψ)⁻¹ z → Alg.AdicCont (maximalIdeal c.O) z → ∀ (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω), IsPlaceOver A v → ((l : ℕ) : 𝓞 k) ∉ v.asIdeal → ∀ g ∈ ψ.ker ⊓ Ine (F := k) A, ∃ (F w : G k Ω) (p q : ℕ),
    ¬ l ∣ p ∧ 1 < q ∧ ((Chr.Psi l e ψ)⁻¹ g) = 1 ∧
    (((Chr.Psi l e ψ)⁻¹ F : c.Oˣ) : c.O)*(q : c.O)^e = 1 ∧
    F*g = g^q*F*w ∧ Tendsto (fun m : ℕ => w^(p^m)) atTop (𝓝 1)

theorem zero_of_transport41 (hT : AwayTameTransport41) : AwayInertiaZero41 := by
  intro k Ω _ _ _ _ _ l hl c ψ ho e he z hz hc v A hv hvl g hg
  obtain ⟨F,w,p,q,hpl,hq,ht,hF,hrel,htend⟩ :=
    hT k Ω l c ψ ho e he z hz hc v A hv hvl g hg
  obtain ⟨hinj,_,_,_,_,_,_,_,hu⟩ := dvrFacts l c.O
  haveI : CharZero c.O := charZero_of_injective_algebraMap hinj
  obtain ⟨u,hu'⟩ := hu p hpl
  exact errorCancel41 _ z hz hc F g w p q u hu' ht
    (negWeightNe41 _ q e hq hF) hrel htend

example (hT : AwayTameTransport41) : AwayInertiaZero41 := by
  first
  | (rh_reduce 2 using [zero_of_transport41]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact zero_of_transport41 hT

end RHCharacterTame41

rh_scan UpperTheory.V.X.So.soCocL limit 2000
rh_scan UpperTheory.V.X.So.hostVanE limit 2000
rh_scan RHCharacterTame41.zero_of_transport41 limit 2000
rh_prune RHCharacterTame41.errorCancel41 as RHCharacterTame41.ErrorPruned
#print axioms UpperTheory.V.X.So.soCocL
#print axioms RHCharacterTame41.wildZero41
#print axioms RHCharacterTame41.errorCancel41
#print axioms RHCharacterTame41.negWeightNe41
#print axioms RHCharacterTame41.zero_of_transport41
