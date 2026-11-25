import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.LemmaKOfLitN
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.BOdd
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.GaloisCohomologyLength.ShaLenEqShaInv
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN42 lane 3 prime_window, 25 Nov 2026. SOURCE-MATCHED HUMAN /
PREPARED Lean, NOT COMPILED. RH OPEN.
Current mission (mandatory engine section), SWARM, HANDOFF, EXPANSION,
AGENTS, state/log/protocol openings and continuity consulted. Latest 25
commits surveyed, in particular 27cf99f1 (qualitative CountV consumer),
72bd1ee1 (quantitative adjacent torsion), a5f9e057 (shared Sha core),
20e156a7 (finite adjoint cocycle), 94eea89e (same-C K comparison).
Prior lane RUN41 4fd3152d retained.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Upstream observed
756a70250dcba9162b99d4ea35c186558434c17e, no migration.
Source relative to AutomorphicVarieties:
ModularityArgument/ClassCounting/NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
ModularityArgument/ClassCounting/LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
GaloisLibrary/GaloisCohomologyLength/ShaLenEqShaInv.lean 19302758658356ff85c5540681e53e79579ab975
BOdd.lean (same ClassCounting directory) 4a683e6c236327e51ab03bc84da83f6f1f0602cc.
Peer 27cf99f1ae6a9b213009f90a1e6e38e027ab9fac:
specialists/on_acceleration/RUN40_COUNTV_QUALITATIVE_SHA.lean.
Peer 2785c41492e20d3c09923fb215f35434eef4b7ca:
integration/2026-11-25_2100_SHARED_SHA_ACTUAL_VWIN.lean.

RESULT: discharge the new qualitative CountV finiteness interface
without the quantitative STors hypothesis of SNum. This is NOT an
independent proof of SFew or SSha. In the actual sNum prefix choose
the SAME L', c and E from the native layer. Let r be its number
of complex places and T1,T2 the native adjacent torsion cardinals,
X the native exponent (b+v_l(E))*gens L' + c+v_l(E).
For every permitted F,nu,zeta,gamma, native SFew and SCount give
  card(EqHom)*l^(nu*r) <= T1*T2*l^(nu*r)*l^X.
Cancel the positive common factor before logs:
  card(EqHom) <= B := T1*T2*l^X.
B depends on L',l,c,E, NOT F,nu,zeta,gamma. Finiteness is retained
explicitly from SCount; Nat.card=0 for an infinite type is not
evidence of finiteness. SSha yields shaInv(L',l,E)=s finite
and l^s<=B. The layer inequality shaInv(L,l,E)<=s implies
shaInv(L,l,E) != top. The native shaLen_eq_shaInv transfers
this to every actual D. No uniform quantitative bound on the
torsion cardinal, degree growth, discriminant growth, or bound
l^c<=2*[L':Q] is used at this consumer. LayerQual retains both
strict room conditions, TopRoot, total complexity and descent.
The degree/discriminant bounds still matter at quantitative callers.
No claim that the homological torsion is absent from SFew/SUpper;
it survives there as a finite cardinal with native proofs.

Original selected graph: CountV -> hostVanE -> lineNeg -> soCocL ->
soCoc -> soBar -> soVec -> soFin -> LemmaK -> SFinal(SNum(...STors)).
Peer candidate: soFin40 -> RHShaFinite40 <- ShaK.
New candidate: soFin40 -> RHShaFinite40 (definitional equal to
RHShaFinite42) <- shaLenFinite42_native <- EqHomUniform42(SFew,SCount),
SSha, SLayerQual42. The exact source-derived positive cancellation
block is preserved from NumThree. Native SNum and quantitative
ShaK remain at the direct tower anchor, CountVs, CountI and
joint CountII/III; no global removal or claim of VWin closure.
No need to import the claimed RH theorem. Retain original and
reduced source/role graphs, all axiom evidence and pending nodes.
Cache key: exact pin, toolchain, L,L',l,c,E,D, layer witness and
SFew/SCount/SSha proofs; no cross-context witness merging.
Backtrack to original qualitative ShaK supplier if replay fails.

Execution: 21 fail-on-error connector JS source and transformation
checks before this commit. No numerical/synthetic data used.
The direct qualitative bridge is a mathematical implication using
native premises, not an unconditional RH result. Local lean/lake
not on PATH. Actual historical CI status.json for 45577239749 and
45576756833 retrieved with returncode 0; baseline engines only.
This overlay and peer soFin40 have not been native-compiled here,
no new CI job submitted and no new axiom evidence. All native
scan/prune/auto calls below are executable replay requests.

RESUME HERE: replay this standalone module as RHShaQualitative42
in pinned warmed runner. Then replay peer RUN40 as
RHCountVQualitativeSha40 and check the actual bridge
  example : RHShaFinite40 := shaLenFinite42_native
and feed the SAME proof into soFin40, propagate through the seven
peer callers to CountV. Compare role-aware scans and axioms,
then seek the genuinely quantitative remaining count suppliers
and weighted prime lower bound; do not refine absorbed constants.
HANDOFF TO integration, acceleration, kernel, Galois, audit.
-/

set_option maxHeartbeats 800000
noncomputable section
open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.KL Formalism.GaloisCohomology

namespace UpperTheory.V.ZK

-- Exact qualitative interface of SLayer at the actual SNum prefix.
def SLayerQual42 : Prop :=
  ∀ (L : Type) [Field L] [NumberField L] (l E : ℕ) [Fact l.Prime],
    HasMuQ l L → 1 ≤ E →
    ∃ (L' : Type) (_ : Field L') (_ : NumberField L') (c : ℕ),
      IsTotallyComplex L' ∧ TopRoot l c L' ∧
      2 * E + 1 < l ^ c ∧ 2 * E + 1 < nrComplexPlaces L' ∧
      LDataCardLeFinrank.shaInv L l E ≤ LDataCardLeFinrank.shaInv L' l E

theorem layerQual42_of_layer (h : SLayer) : SLayerQual42 := by
  intro L _ _ l E _ hMu hE
  obtain ⟨L', i3, i4, c, d, hTC', hTop, hlc, hcp, hdeg, hd, hlc2, hdisc, hsha⟩ :=
    h L l E hMu hE
  exact ⟨L', i3, i4, c, hTC', hTop, hlc, hcp, hsha⟩

-- Crucial quantifier: one B chosen BEFORE F, nu, zeta, gamma.
def EqHomUniform42 : Prop :=
  ∀ (L' : Type) [Field L'] [NumberField L'], IsTotallyComplex L' →
    ∀ (l : ℕ) [Fact l.Prime] (c E : ℕ), 1 ≤ E →
      2 * E + 1 < l ^ c → 2 * E + 1 < nrComplexPlaces L' →
      ∃ B : ℕ, ∀ (F : Type) [Field F] [NumberField F] [Algebra L' F]
        (ν : ℕ) (ζ : (𝓞 F)ˣ) (γ : Gal(F/L')), Lay l c ν ζ γ →
        Finite (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ∧
        Nat.card (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ≤ B

theorem eqHomUniform42_of_few_count (hFew : SFew) (hCount : SCount) :
    EqHomUniform42 := by
  intro L' i3 i4 hTC' l hl c E hE hlc hcp
  obtain ⟨k, rfl⟩ : ∃ k, E = k + 1 := ⟨E - 1, by omega⟩
  have hl1 : 1 < l := hl.out.one_lt
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
  exact ⟨_, hB⟩

def ShaInvFinite42 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L : Type) [Field L] [NumberField L],
    IsTotallyComplex L → HasMuQ l L → ∀ E : ℕ, 1 ≤ E →
    LDataCardLeFinrank.shaInv L l (E : ℤ) ≠ ⊤

theorem shaInvFinite42_of_uniform (hU : EqHomUniform42) (hSha : SSha)
    (hLayer : SLayerQual42) : ShaInvFinite42 := by
  intro l hl L i1 i2 hTC hMu E hE
  obtain ⟨L', i3, i4, c, hTC', hTop, hlc, hcp, hsha⟩ := hLayer L l E hMu hE
  obtain ⟨B, hB⟩ := hU L' hTC' l c E hE hlc hcp
  obtain ⟨s, hs, hlsB⟩ := hSha L' hTC' l c E B hTop hE hB
  intro htop
  rw [htop, hs] at hsha
  exact ENat.coe_ne_top s (top_le_iff.mp hsha)

theorem shaInvFinite42_of_native (hFew : SFew) (hCount : SCount)
    (hSha : SSha) (hLayer : SLayer) : ShaInvFinite42 :=
  shaInvFinite42_of_uniform (eqHomUniform42_of_few_count hFew hCount)
    hSha (layerQual42_of_layer hLayer)

theorem shaInvFinite42_of_bOdd (hB : BOdd) : ShaInvFinite42 :=
  shaInvFinite42_of_native
    (LateralTheory.Fin.SFewOf.intersectionNumber_baseChange
      (sThetaOf sChain sPrism sPrismMul sZc sTrans sCoc)
      sPhi
      (sClassOf sChain sPrism sPrismMul sZc
        LateralTheory.Fin.SRel.intersectionNumber_baseChange sEta
        LateralTheory.Fin.SStein.intersectionNumber_baseChange)
      (sUpperOf sChain hB)
      LateralTheory.Fin.SDetect.intersectionNumber_baseChange)
    sCount PositivityTheory.QuaternionShaBounds.sSha
    LateralTheory.Fin.SLayer.intersectionNumber_baseChange

end UpperTheory.V.ZK

open UpperTheory.V.ZK

def RHShaFinite42 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω l),
    IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, 1 ≤ e →
    shaLen D (e : ℤ) ≠ ⊤

theorem shaLenFinite42_of_inv (h : ShaInvFinite42) : RHShaFinite42 := by
  intro l _ L Ω _ _ _ _ _ D ht hm e he
  rw [UpperTheory.V.LDataCardLeFinrank.shaLen_eq_shaInv]
  exact h l L ht hm e he

theorem shaLenFinite42_of_bOdd (hB : BOdd) : RHShaFinite42 :=
  shaLenFinite42_of_inv (shaInvFinite42_of_bOdd hB)

theorem shaLenFinite42_native : RHShaFinite42 := by
  first
  | (rh_reduce 2 using [shaLenFinite42_of_bOdd, UpperTheory.V.ZK.bOdd]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact shaLenFinite42_of_bOdd UpperTheory.V.ZK.bOdd

rh_prune UpperTheory.V.ZK.shaInvFinite42_of_native
rh_prune shaLenFinite42_of_bOdd
rh_scan UpperTheory.V.ZK.sNum limit 2000
rh_scan UpperTheory.V.ZK.shaInvFinite42_of_bOdd limit 2000
rh_scan shaLenFinite42_native limit 2000
#print axioms UpperTheory.V.ZK.eqHomUniform42_of_few_count
#print axioms UpperTheory.V.ZK.shaInvFinite42_of_uniform
#print axioms shaLenFinite42_native
