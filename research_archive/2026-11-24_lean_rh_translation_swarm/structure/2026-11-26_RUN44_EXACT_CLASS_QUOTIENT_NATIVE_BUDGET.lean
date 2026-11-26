import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.LemmaKOfLitN
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.BOdd
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 13 RUN44 — 26 Nov 2026. SOURCE-MATCHED HUMAN PROOF / PREPARED LEAN, NOT COMPILED.

Result: identify the actual canonical arithmetic obstruction as the truncated
twisted class-group quotient, rather than its ambient cardinal upper bound.
Let I be the free divisor group, d the principal divisor map, gI the
native inverse-permutation action, a=(1+l^c)^E, n=ord(gamma), and
Q=I/(im d+im(gI-a)). Native Ct.eqHomLe constructs an injection into
Hom(Q,Z/l^nu). It is in fact surjective: for a character h set
phi(P)=h([P]); principal divisors and (gI-a)P vanish in Q, so phi
satisfies BOTH native EqHom conditions. The two maps are inverse because
divisors are finitely supported sums of prime generators. No finiteness
is needed for this equivalence. If Q is finite, its cyclic invariant
factors d_i give |EqHom|=prod gcd(d_i,l^nu)=|Q/l^nu Q| exactly.
This is an exact finite abelian group theorem, not a new estimate.
In Q, [gI x]=a[x]; iterating gI^n=1 yields (a^n-1)Q=0. For the
native Lay, Ct.lte gives v_l(a^n-1)=nu+v_l(E); thus if l does not divide E,
the l-primary Q is already killed by l^nu. Otherwise truncation can
be essential: Q=Z/l^(nu+1), E divisible by l, yields l^nu rather
than l^(nu+1). This example is an abstract negative control, not an
assertion about any number-field class group. The uniform bound cannot
follow from annihilation alone: Q=(Z/l^nu)^r obeys it with arbitrary r.
No independent proof of the required uniform cardinal estimate claimed.

Actual source supplier recovery: the pinned LemmaKOfLitN.lean gives
all concrete suppliers of lemmaK_of_steps. Expand exactly its SFew input:
  Fin.SFewOf.intersectionNumber_baseChange
    (sThetaOf sChain sPrism sPrismMul sZc sTrans sCoc)
    sPhi
    (sClassOf sChain sPrism sPrismMul sZc
      Fin.SRel.intersectionNumber_baseChange sEta Fin.SStein.intersectionNumber_baseChange)
    (sUpperOf sChain hB)
    Fin.SDetect.intersectionNumber_baseChange.
Together with native sCount and LayEx_holds, this is an actual source
proof term for RUN43's CanonicalBudget, not another unproved interface.
BOdd is itself supplied by bOdd_zk -> bStarOdd -> sBStarOdd_of with
sChain,sSep',sBridge,sStab,sSurj_of(...),sWtOdd_of(...). These are
source calls only; their transitive axioms and mathematical proofs have
NOT been independently audited. The source claims the bound; our
reconstruction has NOT certified it. Use named native suppliers,
never Main or claimed RH. No new root closure, no claim that all
unresolved arithmetic disappeared. No new numerical constants.

Original selected graph: VWin -> lemmaK -> lemmaK_of_steps -> sNum
-> SFew,SCount,SSha,SLayer,STors; SFew -> SFewOfCut -> STheta,SPhi,
SClass,SUpper,SDetect; SUpper -> BOdd; SCount -> Ct.eqHomLe -> ClQ.
Candidate: CanonicalBudget44 <- exact native SFew + sCount + LayEx_holds;
for direct quotient route EqHom ≃ Hom(ClQ,Z/l^nu) and cyclic annihilator.
Original inequality, all original type/value/constructor roles, RUN43
cofinal injection, SLayer, STors, SFinal and unresolved upstream
dependencies retained. Cache by pin/toolchain,L,F,gamma,a,l,nu,D,
actual quotient/context and role. Backtrack to original if replay fails.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Paths under src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClassCounting/:
LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
BOdd.lean 4a683e6c236327e51ab03bc84da83f6f1f0602cc
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
SelmerOrderCounts/EqHomLe.lean b91ada18f3e40f6d7eaee3443e50aa464797c898
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98
HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab
RingEquivalences/OrderOfOneAddPrimePowZmodPrimePow.lean 1461d8636ef74a1ad316dd7a1b81102065d7ac69
Additional inspected source: EtaleCohomology/CyclotomicDiscriminants/
FinSFewOf.lean 4e084643259aca0182891bb055cc8ebd2f375b1a;
SFewOfCut.lean 1c294cd3b56d004fc313c2e2febb40cf637e0b52;
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/
TorsionIntegers/Bridge.lean 7ff84d3d02c1f4cfb386505d590e2eb4e0c96f8c;
FinalOdd.lean a2c342444c2bf90d11b59deb8f2d3d98aa47e6fa.
RUN43 prior blob 770d9cb34294fc59cbd463b4af5bd707428f78bb. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4,
SWARM, HANDOFF, AGENTS, research state/log/protocol/continuity heads read.
Latest peers indexed 6aaed9d5,7e262184,054230d9,2355b4d2,74ad2c13,
3463c301,11e35a8b,fac11f41,f7a7aace,cbb7d21f; 054230d9,cbb7d21f,
f7a7aace,6e70b2a0,0748936f source diffs consulted. No URT used.

Executed 13 fail-on-error source/transform checks:
prior exact interfaces recovered; native lemmaK exact concrete application; native consumer exact expansion; native BOdd supplier; native sCount proof; native forward dual map; native quotient; native inverse gamma orientation; actual canonical layer supplier; exact native injection proof extraction; weakened exact equivalence signature; no finiteness use in native forward construction; exact prior canonical cancellation retained.
No synthetic class-group tests; abstract counterexamples above are exact.
Local lean/lake/elan absent. Published baseline status JSON blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 read (45577239749,
45576756833); old PASS only. New file not compiled or queued. Native
scan/prune/search commands prepared; no new axiom evidence.
RESUME HERE: replay the new quotient equivalence and canonical supplier
in warmed pinned Lean; audit bStarOdd's actual suppliers and their
transitive axiom ledger. If the direct source route passes, integrate
with RUN43 sNum_cofinal43 without importing claimed RH; if it fails,
retain original route and pursue precise failure. Do not count mere
source availability as verified mathematics.
HANDOFF TO kernel, audit, integration, arithmetic.
-/

open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.ZK UpperTheory.V.ZK.Ct

private theorem actP_actP_inv' {L F : Type} [Field L] [Field F] [Algebra L F] (γ : Gal(F/L))
    (Q : HeightOneSpectrum (𝓞 F)) : actP γ (actP γ⁻¹ Q) = Q := by
  ext x
  change ((RingOfIntegers.mapRingEquiv γ⁻¹.toRingEquiv).symm
    ((RingOfIntegers.mapRingEquiv γ.toRingEquiv).symm x)) ∈ Q.asIdeal ↔ x ∈ Q.asIdeal
  have : ((RingOfIntegers.mapRingEquiv γ⁻¹.toRingEquiv).symm
      ((RingOfIntegers.mapRingEquiv γ.toRingEquiv).symm x)) = x := by
    apply RingOfIntegers.ext
    simp [RingOfIntegers.mapRingEquiv]
    rw [AlgEquiv.aut_inv, AlgEquiv.symm_symm, AlgEquiv.apply_symm_apply]
  rw [this]


theorem UpperTheory.V.ZK.Ct.eqHomDual44 :
    ∀ (L F : Type) [Field L] [NumberField L] [Field F] [NumberField F] [Algebra L F] (γ : F ≃ₐ[L] F) (a l ν : ℕ) (D : Dat (Additive Fˣ) (HeightOneSpectrum (𝓞 F) →₀ ℤ)), l.Prime → IsDat γ a D → Nonempty (EqHom γ a (l ^ ν) ≃ (D.ClQ →+ ZMod (l ^ ν))) := by
  classical
  intro L F _ _ _ _ _ γ a l ν D hl hD
  haveI : NeZero (l ^ ν) := ⟨pow_ne_zero _ hl.ne_zero⟩
  have hinv : ∀ Q, actP γ⁻¹ (actP γ Q) = Q := fun Q => by
    simpa using actP_actP_inv' γ⁻¹ Q
  have hsingle : ∀ (P : HeightOneSpectrum (𝓞 F)) (n : ℤ),
      D.gI (Finsupp.single P n) = Finsupp.single (actP γ⁻¹ P) n := by
    intro P n
    ext Q
    rw [hD.gI_eq, Finsupp.single_apply, Finsupp.single_apply]
    have hiff : (P = actP γ Q) ↔ (actP γ⁻¹ P = Q) :=
      ⟨fun h => h ▸ hinv Q, fun h => h ▸ (actP_actP_inv' γ P).symm⟩
    split_ifs with h1 h2 h2
    · rfl
    · exact absurd (hiff.1 h1) h2
    · exact absurd (hiff.2 h2) h1
    · rfl
  let ψ0 : (HeightOneSpectrum (𝓞 F) → ZMod (l ^ ν)) → ((HeightOneSpectrum (𝓞 F) →₀ ℤ) →+ ZMod (l ^ ν)) :=
    fun φ => Finsupp.liftAddHom fun P => (AddMonoidHom.mulRight (φ P)).comp (Int.castAddHom (ZMod (l ^ ν)))
  have hψs : ∀ φ P (n : ℤ), ψ0 φ (Finsupp.single P n) = (n : ZMod (l ^ ν)) * φ P := by
    intro φ P n
    simp [ψ0]
  have hle : ∀ φ ∈ EqHom γ a (l ^ ν),
      LinearMap.range D.d ⊔ LinearMap.range D.delI ≤ LinearMap.ker (ψ0 φ).toIntLinearMap := by
    intro φ hφ
    apply sup_le
    · rintro _ ⟨y, rfl⟩
      rw [LinearMap.mem_ker, AddMonoidHom.coe_toIntLinearMap]
      have h1 := hφ.1 (Additive.toMul y)
      rw [← h1]
      simp only [ψ0, Finsupp.liftAddHom_apply, Finsupp.sum]
      rw [finsum_eq_sum_of_support_subset]
      · apply Finset.sum_congr rfl
        intro P _
        simp [← hD.d_eq]
      · intro P hP
        rw [Function.mem_support] at hP
        rw [Finset.mem_coe, Finsupp.mem_support_iff]
        intro h0
        apply hP
        rw [← hD.d_eq]
        simp [h0]
    · have key : ∀ 𝔡, ψ0 φ (D.gI 𝔡) = (a : ZMod (l ^ ν)) * ψ0 φ 𝔡 := by
        intro 𝔡
        induction 𝔡 using Finsupp.induction_linear with
        | zero => simp
        | add f g hf hg => rw [map_add, map_add, map_add, hf, hg, mul_add]
        | single P n =>
          rw [hsingle, hψs, hψs, hφ.2 P]
          ring
      rintro _ ⟨𝔡, rfl⟩
      rw [LinearMap.mem_ker, AddMonoidHom.coe_toIntLinearMap]
      simp only [Dat.delI, LinearMap.sub_apply, map_sub, key, hD.a_eq]
      simp
  let f : EqHom γ a (l ^ ν) → (D.ClQ →+ ZMod (l ^ ν)) := fun φ =>
    ((LinearMap.range D.d ⊔ LinearMap.range D.delI).liftQ (ψ0 φ.1).toIntLinearMap (hle φ.1 φ.2)).toAddMonoidHom
  have hf : Function.Injective f := by
    intro φ₁ φ₂ h
    apply Subtype.ext
    funext P
    have := DFunLike.congr_fun h (Submodule.Quotient.mk (Finsupp.single P 1))
    simpa [f, hψs] using this

  have hs : Function.Surjective f := by
    intro h
    let p : (HeightOneSpectrum (𝓞 F) →₀ ℤ) →ₗ[ℤ] D.ClQ :=
      (LinearMap.range D.d ⊔ LinearMap.range D.delI).mkQ
    let φ : HeightOneSpectrum (𝓞 F) → ZMod (l ^ ν) := fun P =>
      h (p (Finsupp.single P 1))
    have hψ : ∀ d, ψ0 φ d = h (p d) := by
      intro d
      induction d using Finsupp.induction_linear with
      | zero => simp
      | add x y hx hy => rw [map_add, map_add, map_add, hx, hy]
      | single P n =>
        rw [hψs]
        have he : Finsupp.single P n = n • Finsupp.single P (1 : ℤ) := by
          ext Q
          by_cases hPQ : Q = P
          · subst Q; simp
          · simp [Finsupp.single_apply, hPQ, Ne.symm hPQ]
        rw [he, map_smul, map_zsmul, zsmul_eq_mul]
        rfl
    have hzero : ∀ d ∈ LinearMap.range D.d ⊔ LinearMap.range D.delI, h (p d) = 0 := by
      intro d hd
      have hp : p d = 0 := by
        change Submodule.Quotient.mk d = 0
        rw [Submodule.Quotient.mk_eq_zero]
        exact hd
      rw [hp, map_zero]
    have hm : φ ∈ EqHom γ a (l ^ ν) := by
      constructor
      · intro α
        have h0 : ψ0 φ (D.d (Additive.ofMul α)) = 0 :=
          (hψ _).trans (hzero _ (Submodule.mem_sup_left ⟨_, rfl⟩))
        have hsum : ψ0 φ (D.d (Additive.ofMul α)) =
            ∑ᶠ P, (ordP P α : ZMod (l ^ ν)) * φ P := by
          simp only [ψ0, Finsupp.liftAddHom_apply, Finsupp.sum]
          rw [finsum_eq_sum_of_support_subset]
          · apply Finset.sum_congr rfl
            intro P _
            simp [← hD.d_eq]
          · intro P hP
            rw [Function.mem_support] at hP
            rw [Finset.mem_coe, Finsupp.mem_support_iff]
            intro h0
            apply hP
            rw [← hD.d_eq]
            simp [h0]
        exact hsum.symm.trans h0
      · intro P
        have h0 : ψ0 φ (D.delI (Finsupp.single P 1)) = 0 :=
          (hψ _).trans (hzero _ (Submodule.mem_sup_right ⟨_, rfl⟩))
        simp only [Dat.delI, LinearMap.sub_apply, map_sub] at h0
        rw [hsingle, hψs, LinearMap.smul_apply, Module.End.one_apply,
          map_zsmul, hψs, hD.a_eq] at h0
        simpa [zsmul_eq_mul] using sub_eq_zero.mp h0
    refine ⟨⟨φ, hm⟩, ?_⟩
    ext x
    obtain ⟨d, rfl⟩ := Submodule.Quotient.mk_surjective _ x
    exact hψ d
  exact ⟨Equiv.ofBijective f ⟨hf, hs⟩⟩


namespace UpperTheory.V.ZK.Ct

-- The entire twisted divisor quotient, not merely its characters, is
-- annihilated by the cyclic polynomial evaluated at the twist.
theorem clq_annihilator44 {Y I : Type} [AddCommGroup Y] [AddCommGroup I]
    (D : Dat Y I) (x : D.ClQ) : ((D.a : ℤ) ^ D.n - 1) • x = 0 := by
  let p : I →ₗ[ℤ] D.ClQ := (LinearMap.range D.d ⊔ LinearMap.range D.delI).mkQ
  have hrel (y : I) : p (D.gI y) = (D.a : ℤ) • p y := by
    have hz : p (D.delI y) = 0 := by
      change Submodule.Quotient.mk (D.delI y) = 0
      rw [Submodule.Quotient.mk_eq_zero]
      exact Submodule.mem_sup_right ⟨y, rfl⟩
    simp only [Dat.delI, LinearMap.sub_apply, LinearMap.smul_apply,
      Module.End.one_apply, map_sub, map_smul] at hz
    exact sub_eq_zero.mp hz
  have hp (j : ℕ) (y : I) : p ((D.gI ^ j) y) = (D.a : ℤ) ^ j • p y := by
    induction j with
    | zero => simp
    | succ j ih =>
      rw [pow_succ', Module.End.mul_apply, hrel, ih, pow_succ', mul_smul]
  obtain ⟨y, rfl⟩ := Submodule.Quotient.mk_surjective
    (LinearMap.range D.d ⊔ LinearMap.range D.delI) x
  have h := hp D.n y
  rw [D.gI_pow, Module.End.one_apply] at h
  change ((D.a : ℤ) ^ D.n - 1) • p y = 0
  rw [sub_smul, one_smul, ← h, sub_self]

end UpperTheory.V.ZK.Ct


noncomputable section
open NumberField NumberField.InfinitePlace IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Base
open UpperTheory.V.ZK
namespace PositivityTheory.QuaternionShaBounds
def CofinalBound44 (L Ω : Type) [Field L] [NumberField L] [Field Ω]
    [Algebra L Ω] [IsAlgClosure L Ω] (l c E B : ℕ) [Fact l.Prime] : Prop :=
  ∀ N : ℕ, ∃ ν : ℕ, N ≤ ν ∧
    ∃ (γ : Kum.Fn L Ω l ν ≃ₐ[L] Kum.Fn L Ω l ν) (g : G L Ω),
      IsLift γ.toRingEquiv g.toRingEquiv ∧
      ((Kum.cycR L Ω l ν g : (ZMod (l ^ ν))ˣ) : ZMod (l ^ ν)) = 1 + (l : ZMod (l ^ ν)) ^ c ∧
      Finite (ZK.EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ∧
      Nat.card (ZK.EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ≤ B

end PositivityTheory.QuaternionShaBounds

namespace RHStructure44
open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK
def CanonicalBudget44 : Prop :=
  ∀ (L' : Type) [Field L'] [NumberField L'], IsTotallyComplex L' →
    ∀ (l c k : ℕ) [Fact l.Prime], TopRoot l c L' →
      2 * k + 3 < l ^ c → 2 * k + 3 < nrComplexPlaces L' →
      PositivityTheory.QuaternionShaBounds.CofinalBound44 L' (AlgebraicClosure L') l c (k + 1)
        (tc L' (4 * k + 10) (2 * k + 3) * tc L' (4 * k + 10) (2 * k + 2) *
          l ^ ((2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) + (k + 1).factorization l) * gens L' +
            c + (k + 1).factorization l))

theorem canonical_of_few_count44
    (hLayEx : PositivityTheory.QuaternionShaBounds.LayEx)
    (hFew : SFew) (hCount : SCount) : CanonicalBudget44 := by
  intro L' _ _ hTC' l c k _ hTop hlc hcp
  have hB : ∀ (F : Type) [Field F] [NumberField F] [Algebra L' F] (ν : ℕ) (ζ : (𝓞 F)ˣ)
      (γ : Gal(F/L')), Lay l c ν ζ γ →
      Finite ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) ∧
        Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) ≤
          tc L' (4 * k + 10) (2 * k + 3) * tc L' (4 * k + 10) (2 * k + 2) *
            l ^ ((2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) + (k + 1).factorization l) * gens L' +
              c + (k + 1).factorization l) := by
    intro F i5 i6 i7 ν ζ γ hLay
    have hfew := hFew L' F hTC' l c ν k ζ γ hLay (by omega) (by omega)
    have hcnt := hCount L' F hTC' l c ν (k + 1) _ _ ζ γ hLay (by omega) hfew
    refine ⟨hcnt.1, ?_⟩
    have hP : 0 < (l ^ ν) ^ InfinitePlace.nrComplexPlaces L' := pow_pos (pow_pos (by omega) _) _
    have h2 := hcnt.2
    apply le_of_mul_le_mul_left _ hP
    calc _ = Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) *
          (l ^ ν) ^ InfinitePlace.nrComplexPlaces L' := mul_comm _ _
      _ ≤ _ := h2
      _ = _ := by ring
  intro N
  let ν := max c N
  obtain ⟨ζ, γ, hLay, g, hlift, hcyc⟩ :=
    hLayEx L' (AlgebraicClosure L') l c ν hTop (le_max_left _ _)
  obtain ⟨hfin, hcard⟩ := hB (Kum.Fn L' (AlgebraicClosure L') l ν) ν ζ γ hLay
  exact ⟨ν, le_max_right _ _, γ, g, hlift, hcyc, hfin, hcard⟩


theorem actual_few44 (hB : BOdd) : SFew :=
  LateralTheory.Fin.SFewOf.intersectionNumber_baseChange
    (sThetaOf sChain sPrism sPrismMul sZc sTrans sCoc) sPhi
    (sClassOf sChain sPrism sPrismMul sZc LateralTheory.Fin.SRel.intersectionNumber_baseChange sEta
      LateralTheory.Fin.SStein.intersectionNumber_baseChange)
    (sUpperOf sChain hB) LateralTheory.Fin.SDetect.intersectionNumber_baseChange

theorem canonical_of_native44 (hB : BOdd) : CanonicalBudget44 := by
  have hFew := actual_few44 hB
  have hCount : SCount := sCount
  have hLay := PositivityTheory.QuaternionShaBounds.LayEx_holds
  first
  | (rh_reduce 2 using [canonical_of_few_count44]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact canonical_of_few_count44 hLay hFew hCount

-- Source supplier, not independent certification of bOdd or upstream axioms.
theorem canonical_source44 : CanonicalBudget44 :=
  canonical_of_native44 UpperTheory.V.ZK.bOdd

end RHStructure44
end

rh_prune UpperTheory.V.ZK.Ct.eqHomLe as RHEqHomLeNative44Pruned
rh_scan UpperTheory.V.ZK.Ct.eqHomLe limit 2000
rh_scan UpperTheory.V.ZK.Ct.eqHomDual44 limit 2000
rh_scan RHStructure44.canonical_source44 limit 2000
#print axioms UpperTheory.V.ZK.Ct.eqHomDual44
#print axioms UpperTheory.V.ZK.Ct.clq_annihilator44
#print axioms RHStructure44.canonical_of_native44
#print axioms RHStructure44.canonical_source44
#print axioms UpperTheory.V.ZK.bOdd
