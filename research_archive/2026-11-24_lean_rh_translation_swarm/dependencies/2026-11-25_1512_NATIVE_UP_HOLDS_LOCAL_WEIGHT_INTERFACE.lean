import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.ToDegInjective
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.HerbrandFinLen
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.EventuallyMQGrFiniteAnnihilator
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.LocalizedLengthLeOfSurjective
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.LocLenAPieceIdeal2LeTwoPow
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.LocLenQuotientWeightPieceLeOne
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.TspHolds
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.ValuationNonnegApplyDegreeZeroOfOnS
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.HomHolds
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.SignHolds
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.GrEqRange
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.FgHolds
import Formalism.SharpRestriction.ValuationFrobeniusEpsilon.LeastPrimeTwists.QuotientShiftIrreducible.NoetherianQuotientCalc.RuleFin

import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open IsLocalRing Filter Formalism.MainNotions.V.Pf.V2.Calc UpperTheory.V.Alg UpperTheory.V.Alg.M


/-!
# Lane 12 — move multiplicity-one to the actual caller; only represented local weights are needed
25 Nov 2026. Human SOURCE-MATCHED derivation and actual-source Lean
replacement PREPARED, NOT compiled. RH OPEN. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; preflight latest
listed commit 7e4677d91b8e524210c5aebf2e0d23bf5368a9b6.
Read mission, SWARM, HANDOFF, AGENTS, continuity, research state/log/protocol
and live proof (long files in part); inspected recent peer commit titles,
and Galois 46c378ee/integration fdb0ad7a actual diffs. Prior lane 3003c0aa
(public slice separation) and 4510eb2b (parity localization).
Local lean/lake not on PATH. Actual CI status JSON for earlier engines
45577239749 and 45576756833 says pass/returncode 0; latest orchestrator
45638750039 concerns a910af4, not this certificate.

## One mathematical reduction for integration
In the actual source up_holds, M4 is consumed exactly once, to supply
the multiplicity-one hypothesis of locLen_aPiece_ideal2_le_two_pow.
All other uses of h2, h3, hW, hD and same-host support remain unchanged.
The local input needed is only
    for xi in T and integer w, length_(B_p) R_w <= 1,
where B=A_0, p=ker(res0 xi), R=(A/Q.ideal) localized at B minus p,
and T is the SAME native Covers witness. No assertion about arbitrary
sigma is used here. Replace M4 by that local budget, leaving every
other premise and the exact upper Euler/valuation conclusion intact.
This is a logically weaker sufficient interface (M4 with the retained
premises implies it); strictness is not asserted. It is not itself a
proof of the new premise. M4 remains in any other consumer.

The previous two lane proofs now connect as follows. Choose f,g of
degrees -2,+2 with tau=fg and sigma(tau) nonzero, using the original
idD condition. For S=B minus p, homogeneous localization gives R.
In R, f,g are units, and all nonzero O scalars are units. Write
D=R/(f-1), a localization of the exact public slice from 3003c0aa.
Here is an alternative DIRECT native bridge to injectivity, avoiding
the need to implement a full Laurent quotient isomorphism in Lean:
if h homogeneous maps to zero in D, clear denominators to obtain
    c*g^n*s*h in I+(f-1)
for some c in O nonzero, n>=0, s in S (the slice localization uses
pi*g, so c can be a power of the uniformizer). The product is
homogeneous. Apply native deh_holds to find m with
    f^m*c*g^n*s*h in I.
Multiply by f^n*g^m. Then
    c*tau^(m+n)*s*h in I.
The coefficient belongs to S, proving h=0 in R. Thus each weight
injects into D. This argument retains deh_holds as a checked-source
fallback, rather than require a new grading-localization implementation.
Public slice separation makes D reduced; M2 makes R_0 a finite
Frac(O)-algebra localized at p, hence local Artinian; reducedness
makes it a field if R nonzero. If R=0 the bounds are trivial.
As in 4510eb2b, f is an invertible degree -2 shift, so only weights
0 and 1 need to be examined. In weight 1 choose nonzero h0 if it
exists. b=f*h0^2 is nonzero in R_0 by the injection into reduced D;
for any h in R_1, a=f*h*h0 is in R_0 and b*h=a*h0. Divide by b.
Hence dimension at most one; transfer to every weight using f.
This proves the local budget under the original hypotheses in
ordinary mathematics. The localization/length bridge still requires
native implementation and audit; the certificate below tests the
actual caller substitution independently of that implementation.

## Original and reduced local graph (source visible, not full kernel)
Original: up_holds -> locLen_aPiece_ideal2_le_two_pow,
locLen_quotientWeightPiece_le_one (M4), th_holds, hom_holds,
sign_holds, finite annihilator, tsp_holds, localized length transfer.
Reduced: up_holds_of_local_weight_budget -> same suppliers except
locLen_quotientWeightPiece_le_one, replaced by hweight at xi in T.
Bridge up_holds_via_local_budget -> reduced caller, original
locLen_quotientWeightPiece_le_one and original sign/hom interfaces.
No global deletion of M4, type/value/structural or axiom edges.
Retain original graph and fallback; candidate cache key includes
pin,O,K,A,grading,x,Q,T,xi,p and actual localized weight. No URT
or asymptotic proof-search speed claim.

## Provenance and tests
Pinned blobs (paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/):
GradedModulesLength/TwoSigned.lean c2460a5a728ec42562e60d678237aa4f8051ec53
GradedModulesLength/LocLenQuotientWeightPieceLeOne.lean 74f993dd39166d346ca21681890f0deb9f25ed30
GradedModulesLength/LocLenAPieceIdeal2LeTwoPow.lean f685f7633ab8f10eb5d922d98668241790c770ff
GradedModulesLength/ToDegInjective.lean 97af3567f20f3414761d99a42b84e7950a0fac37
GradedModulesLength/DehHolds.lean ba585c249b5fbf661ffea7dd0c19b07f59a4fd4c
GradedModulesLength/SliceHolds.lean 0f4347bf89016fe7f63ce6aeaed14c849f57d135
OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15
Executed 41 assertions in connector JS: blob and exact body anchors,
five unique substitutions, absence of both old local identifiers,
five unique reverse substitutions and byte-exact reconstruction of
the original theorem text (excluding trailing whitespace). This is
source-level validation, NOT Lean elaboration. No numerical surrogate.
The new theorem body is the actual native source with those five
edits, and the bridge restates the original exact theorem signature.
Compile in pinned Lean 4.33.1/Mathlib 0df444a360eaa60ab8c11dca51a86af692955474
with three existing engine modules on LEAN_PATH. Record exit code,
rh_scan roles, rh_prune output, original and reduced axioms.
Do not report PASS for this file until actual CI/native output.

RESUME HERE: replay up_holds_of_local_weight_budget and
up_holds_via_local_budget at the native caller; formalize the
homogeneous denominator-clearing injection above (use deh_holds
before building a full grading quotient). Then audit where M4 is
produced and whether only the represented two-weight budget can be
established directly. Preserve the open uniform arithmetic/geometry
and prime-window obligations.
HANDOFF TO integration, kernel extractor, audit, Galois.
-/

theorem RHDependencyLocalWeight.up_holds_of_local_weight_budget :
    ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [CharZero O]
      (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K] (v : K → ℝ), IsNVal O K v →
    ∀ (A : Type) [CommRing A] [Algebra O A] (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] [IsCO O (𝒜 0)] (x : A →ₐ[O] O), IsWRing 𝒜 x →
    ∀ (r s r' s' m : ℕ) (Q : Eqns 𝒜 x r s r' s' m),
    SpansCot x 𝒜 (-1) Q.F → SpansCot x 𝒜 (-2) Q.G → M2 𝒜 Q.ideal → M3 𝒜 K x Q.ideal →
    ∀ a : 𝒜 0, M5 𝒜 K x Q.ideal a → ∀ T : Finset (A →ₐ[O] K), Covers 𝒜 Q.ideal T →
    (∀ ξ ∈ T, ∀ w, locLen (res0 𝒜 ξ) (aPiece 𝒜 Q.ideal w) ≤ 1) →
    ∀ J : Ideal (mR Q), (GMod.self (mGr Q)).IsHomSub J → secs (ts Q) ≤ J → (∀ i, algebraMap (𝒜 0) (mR Q) ⟨Q.Z i, (Q.hZ i).1⟩ ∈ J) →
      ∀ᶠ d in atTop, (chi [(0, algebraMap (𝒜 0) (mR Q) a)] (mQ Q J) d : ℝ) ≤ 2 ^ (r + 1 + r') * ∑ ξ ∈ T, v (ξ a) := by
  intro O _ _ _ _ _ K _ _ _ _ v hv A _ _ 𝒜 _ _ x hW r s r' s' m Q hF hG h2 h3 a h5 T hT hweight J hJ hsec hZ
  classical
  have hfg := fg_holds O A 𝒜 x hW
  have hN : ∀ i, (mN 𝒜 (Q.F (Fin.last r)) i).FG := by
    intro i
    fin_cases i
    · exact hfg _
    · exact hfg _
    · exact (Submodule.fg_span_singleton _).sup (((hfg _).mul (hfg _)).mul (hfg _))
  let X : HidaSetting 3 := { B := 𝒜 0, R := mR Q, 𝒜 := mGr Q, std := std_holds (𝒜 0) A 3 _ hN }
  have hself : (GMod.self (mGr Q)).IsGr (mGr Q) :=
    ⟨fun {d e} {p} {q : mR Q} (hp : p ∈ mGr Q d) (hq : q ∈ mGr Q e) => (SetLike.mul_mem_graded hp hq : p * q ∈ mGr Q (d + e)),
      rees_internal _, Module.Finite.self (mR Q)⟩
  have hGr : (mQ Q J).IsGr (mGr Q) := ((ruleGr 3 X _ hself).1 J hJ).2
  have hfin : ∀ d, Module.Finite (𝒜 0) ((mQ Q J).gr d) := (ruleFin 3 X _ hGr).1
  obtain ⟨hI, -, -⟩ := hom_holds O A 𝒜 x hW r s r' s' m Q
  have hD : ∀ ξ : A →ₐ[O] K, TwoSigned 𝒜 ξ ↔ ¬ idD 𝒜 ≤ RingHom.ker (res0 𝒜 ξ) := by
    intro ξ
    obtain ⟨hn, hp⟩ := sign_holds O A 𝒜 x hW K ξ
    rw [TwoSigned, hn, hp]
    constructor
    · rintro ⟨⟨f, hf, hf0⟩, g, hg, hg0⟩ hle
      have hm : f * g ∈ 𝒜 0 := by
        have := SetLike.GradedMul.mul_mem hf hg
        simpa using this
      have h1 : (⟨f * g, hm⟩ : 𝒜 0) ∈ idD 𝒜 := Ideal.subset_span ⟨f, hf, g, hg, rfl⟩
      have h2 : ξ (f * g) = 0 := hle h1
      rw [map_mul] at h2
      exact mul_ne_zero hf0 hg0 h2
    · intro h
      by_contra hc
      refine h (Ideal.span_le.2 ?_)
      rintro b ⟨f, hf, g, hg, hb⟩
      show ξ (b : A) = 0
      rw [hb, map_mul]
      by_contra hne
      exact hc ⟨⟨f, hf, left_ne_zero_of_mul hne⟩, g, hg, right_ne_zero_of_mul hne⟩
  have hpos : ∀ ξ ∈ T, ξ a ≠ 0 ∧ 0 ≤ v (ξ a) := fun ξ hξ =>
    ⟨h5.2.2 ξ (hT.1 ξ hξ).1 (hT.1 ξ hξ).2,
      valuation_nonneg_apply_degreeZero_of_onS O K v hv A 𝒜 x Q.ideal h2 ξ (hT.1 ξ hξ).1 a a.2 (h5.2.2 ξ (hT.1 ξ hξ).1 (hT.1 ξ hξ).2)⟩
  have hsum : ∑ σ ∈ T.image (res0 𝒜), v (σ a) ≤ ∑ ξ ∈ T, v (ξ a) :=
    Finset.sum_image_le_of_nonneg (f := fun σ : 𝒜 0 →ₐ[O] K => v (σ a)) (g := res0 𝒜) (s := T) fun σ hσ => by
      obtain ⟨ξ, hξ, rfl⟩ := Finset.mem_image.1 hσ
      exact (hpos ξ hξ).2
  filter_upwards [eventually_mQ_gr_finite_annihilator O K A 𝒜 x hW r s r' s' m Q hF hG h2 h3 J hJ hsec hZ, eventually_ge_atTop 1] with d hd hd1
  haveI := hfin d
  have key := th_holds O K v hv (𝒜 0) ((mQ Q J).gr d) hd.1 a (T.image (res0 𝒜)) (2 ^ (r + 1 + r')) ?_ ?_
  · rw [chi_single0 _ hGr.internal]
    refine key.trans ?_
    push_cast
    exact mul_le_mul_of_nonneg_left hsum (by positivity)
  · intro σ hσ
    obtain ⟨ξ, hξ, rfl⟩ := Finset.mem_image.1 hσ
    refine ⟨(hpos ξ hξ).1, (hpos ξ hξ).2, ?_⟩
    have hσ' := (hD ξ).1 (hT.1 ξ hξ).2
    refine (locLen_mQ_gr_le_locLen_aPiece O K A 𝒜 x hW r s r' s' m Q J hsec hZ _ hσ' d hd1).trans ?_
    push_cast
    exact locLen_aPiece_ideal2_le_two_pow O K A 𝒜 x hW r s r' s' m Q _ (hweight ξ hξ) _
  · intro σ hσ
    refine hd.2 σ ?_
    by_contra hc
    rw [not_or] at hc
    obtain ⟨ξ, hξ, rfl⟩ := tsp_holds O K A 𝒜 x hW _ hI σ fun b hb => by
      by_contra hne
      exact hc.2 ⟨b, hb, hne⟩
    obtain ⟨ξ', hξ', t, rfl⟩ := hT.2 ξ hξ ((hD ξ).2 hc.1)
    refine hσ (Finset.mem_image.2 ⟨ξ', hξ', AlgHom.ext fun b => ?_⟩)
    show ξ' (b : A) = act 𝒜 (tz t) ξ' (b : A)
    rw [act_of_mem 𝒜 _ _ b.2]
    simp

theorem RHDependencyLocalWeight.up_holds_via_local_budget :
    ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [CharZero O]
      (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K] (v : K → ℝ), IsNVal O K v →
    ∀ (A : Type) [CommRing A] [Algebra O A] (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] [IsCO O (𝒜 0)] (x : A →ₐ[O] O), IsWRing 𝒜 x →
    ∀ (r s r' s' m : ℕ) (Q : Eqns 𝒜 x r s r' s' m),
    SpansCot x 𝒜 (-1) Q.F → SpansCot x 𝒜 (-2) Q.G → M2 𝒜 Q.ideal → M3 𝒜 K x Q.ideal → M4 𝒜 K Q.ideal →
    ∀ a : 𝒜 0, M5 𝒜 K x Q.ideal a → ∀ T : Finset (A →ₐ[O] K), Covers 𝒜 Q.ideal T →
    ∀ J : Ideal (mR Q), (GMod.self (mGr Q)).IsHomSub J → secs (ts Q) ≤ J → (∀ i, algebraMap (𝒜 0) (mR Q) ⟨Q.Z i, (Q.hZ i).1⟩ ∈ J) →
      ∀ᶠ d in atTop, (chi [(0, algebraMap (𝒜 0) (mR Q) a)] (mQ Q J) d : ℝ) ≤ 2 ^ (r + 1 + r') * ∑ ξ ∈ T, v (ξ a) := by
  intro O _ _ _ _ _ K _ _ _ _ v hv A _ _ 𝒜 _ _ x hW r s r' s' m Q hF hG h2 h3 h4 a h5 T hT J hJ hsec hZ
  obtain ⟨hI, -, -⟩ := hom_holds O A 𝒜 x hW r s r' s' m Q
  have hweight : ∀ ξ ∈ T, ∀ w, locLen (res0 𝒜 ξ) (aPiece 𝒜 Q.ideal w) ≤ 1 := by
    intro ξ hξ
    have hσ : ¬ idD 𝒜 ≤ RingHom.ker (res0 𝒜 ξ) := by
      obtain ⟨hn, hp⟩ := sign_holds O A 𝒜 x hW K ξ
      have htwo := (hT.1 ξ hξ).2
      rw [TwoSigned, hn, hp] at htwo
      obtain ⟨⟨f, hf, hf0⟩, g, hg, hg0⟩ := htwo
      intro hle
      have hm : f * g ∈ 𝒜 0 := by
        have := SetLike.GradedMul.mul_mem hf hg
        simpa using this
      have h1 : (⟨f * g, hm⟩ : 𝒜 0) ∈ idD 𝒜 := Ideal.subset_span ⟨f, hf, g, hg, rfl⟩
      have h0 : ξ (f * g) = 0 := hle h1
      rw [map_mul] at h0
      exact mul_ne_zero hf0 hg0 h0
    intro w
    first
    | (rh_reduce 2 using [UpperTheory.V.Alg.M.locLen_quotientWeightPiece_le_one]; done)
    | (rh_auto_frontier 2; done)
    | exact locLen_quotientWeightPiece_le_one O K A 𝒜 x hW _ hI h2 h4 _ hσ w
  exact RHDependencyLocalWeight.up_holds_of_local_weight_budget O K v hv A 𝒜 x hW r s r' s' m Q hF hG h2 h3 a h5 T hT hweight J hJ hsec hZ

#print axioms UpperTheory.V.Alg.M.up_holds
#print axioms RHDependencyLocalWeight.up_holds_of_local_weight_budget
#print axioms RHDependencyLocalWeight.up_holds_via_local_budget
rh_scan UpperTheory.V.Alg.M.up_holds limit 2000
rh_scan RHDependencyLocalWeight.up_holds_of_local_weight_budget limit 2000
rh_scan RHDependencyLocalWeight.up_holds_via_local_budget limit 2000
rh_prune RHDependencyLocalWeight.up_holds_of_local_weight_budget as RHNativeUpHoldsLocalPruned
