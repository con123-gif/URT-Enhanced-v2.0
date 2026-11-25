import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.LocLenQuotientWeightPieceLeOne
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Lane 12 — public slice separation directly supplies reduced localization
25 Nov 2026. HUMAN SOURCE-MATCHED derivation; Lean replay PREPARED, NOT compiled.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. RH OPEN.
Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; preflight working
head d41c32766a9c3f20b7f55487904aaf40cd6e4922. Read SWARM, HANDOFF,
AGENTS, continuity/state/log/protocol, live proof and peer latest list.
Relevant peers a987e3f9, ec9819bb, 38b6cc25, d41c32766; prior lane
4510eb2b089c1ea353bcdec0dd8483e1a1d47115.
Actual earlier CI run 45577239749 and 45576756833: success, only
for those earlier engines and conditional root. Latest orchestrator
45624892117 at 95545ee is not evidence for this new certificate.
Local lean/lake absent. No new native PASS claimed.

## Exact proof block for the manuscript / prior parity reduction

Use the actual native O,K,A,grading,I,x,M2,M4 and f,g of weights -2,+2.
Let pi be an irreducible uniformizer, J=I+(f-1), C=(A/J)[1/(pi*g)].
The prior parity argument needed C reduced. This fact can be obtained
directly from the PUBLIC conclusion of slice_holds, without exposing
its private et_holds proof or duplicating any tangent-space construction.

For any nilpotent z in C write z=h/(pi*g)^r (h denotes a quotient lift).
Every O-algebra point xi:A->K annihilating I, with xi(f)=1 and
xi(g) nonzero, extends to C because xi(pi*g) is nonzero. Consequently
xi(h)=0: fields have no nonzero nilpotents. The second projection of
the exact native slice_holds gives an integer n>=0 and nonzero c in O
with c*g^n*h in J. In C, c and g are units (DVR uniformizer inverted,
and both factors of pi*g invertible), so h=0 and z=0.

Thus nil(C)=0. Only the vanishing half of slice_holds is consumed, not
its finite-point-count conclusion. No nonzero-point-existence premise:
if there are no slice points the same implication forces C=0.

Now localize by B\p with B=A_0 and p=ker(sigma) as in 4510eb2b. The
localized degree-zero and odd pieces inject into C localized by B\p
using finite Laurent coefficient summation. That ring is reduced;
the localized degree-zero algebra is finite over Frac(O) by M2, hence
local Artinian reduced, thus a field if nonzero. Exact cancellation
b*h=a*h0 then gives the prior bound of one on each weight's length.
This supplies a public interface for the earlier parity proof, not a
claim that the entire parity-localization Lean isomorphism is checked.

Original source-visible path (unchanged fallback):
up_holds -> locLen_quotientWeightPiece_le_one -> slice_holds.2,
deh_holds, nilpotent_modulo_kernel, localized_length_le_one.
Candidate reduced path: locLen -> slice_holds.2 -> public slice
nilradical zero -> graded localization injection -> field -> scalar
cancellation. Keep all original type/value/structural and axiom
evidence; no global deletion. M2, M4, finite generation and same-host
conditions remain. No claim that finite-point proof dependencies
disappear from native slice_holds's elaborated term.
Cache key includes pin, O,K,A,I,grading,x,f,g,pi and sigma/prime.
No URT or asymptotic speed claim.

Source paths under src/Development/AutomorphicArithmetic/
AutomorphicVarieties/CommutativeAlgebra/:
GradedModulesLength/SliceHolds.lean 0f4347bf89016fe7f63ce6aeaed14c849f57d135
GradedModulesLength/LocLenQuotientWeightPieceLeOne.lean 74f993dd39166d346ca21681890f0deb9f25ed30
GradedModulesLength/EtHolds.lean e78d982f3f57e2d2e1eec818d883ad2ab9d9f86a
OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15

Executed 24 exact pinned source assertions: four blob identities and
20 source anchors (11 SliceHolds, four LocLen, two EtHolds, three
OrbitVanishingLocal). No Lean execution or new kernel axiom evidence.
Prepared replay uses the actual native source imports, not a surrogate.
CI handoff: compile in the pinned RH environment with the three
existing engine modules on LEAN_PATH; record full stdout, exit code,
and #print axioms; do not claim PASS from old root-only CI.
RESUME HERE: check native_public_slice_nilradical in the pinned
environment, then connect the public reducedness to the actual graded
localization injection (finite Laurent coefficient sum) and replay
locLen_quotientWeightPiece_le_one at up_holds. Keep fallback if any
bridge fails. No new independent RH route.
HANDOFF TO: integration, kernel extractor, audit, Galois.
-/

open IsLocalRing Filter Formalism.MainNotions.V.Pf.V2.Calc UpperTheory.V.Alg UpperTheory.V.Alg.M

namespace RHDependencyPublicSlice

private theorem unit_cancel_zero {R : Type} [CommRing R] (a b : R)
    (hu : IsUnit a) (h : a * b = 0) : b = 0 := by
  obtain ⟨u, rfl⟩ := hu
  calc
    b = (↑(u⁻¹) : R) * ((↑u : R) * b) := by rw [← mul_assoc]; simp
    _ = 0 := by rw [h, mul_zero]

-- Exact native public-slice statement; the proposed implementation
-- derives reducedness using only its vanishing projection.
theorem native_public_slice_nilradical
    (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (maximalIdeal O) O] [CharZero O]
    (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K]
    (A : Type) [CommRing A] [Algebra O A]
    (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] [IsCO O (𝒜 0)]
    (x : A →ₐ[O] O) (hx : IsWRing 𝒜 x)
    (I : Ideal A) (hI : I.IsHomogeneous 𝒜) (h2 : M2 𝒜 I)
    (h4 : M4 𝒜 K I) (f : A) (hf : f ∈ 𝒜 (-2))
    (g : A) (hg : g ∈ 𝒜 2) (π : O) (hπ : Irreducible π) :
    let J := I ⊔ Ideal.span {f - 1}
    let s := algebraMap O (A ⧸ J) π * Ideal.Quotient.mk J g
    ∀ z : Localization.Away s, IsNilpotent z → z = 0 := by
  classical
  let J : Ideal A := I ⊔ Ideal.span {f - 1}
  let s : A ⧸ J := algebraMap O (A ⧸ J) π * Ideal.Quotient.mk J g
  let C := Localization.Away s
  change ∀ z : C, IsNilpotent z → z = 0
  let φ : A →ₐ[O] C := (IsScalarTower.toAlgHom O (A ⧸ J) C).comp (Ideal.Quotient.mkₐ O J)
  have hφ : ∀ a, φ a = algebraMap (A ⧸ J) C (Ideal.Quotient.mk J a) := fun _ => rfl
  have hφJ : ∀ a ∈ J, φ a = 0 := by
    intro a ha
    rw [hφ, Ideal.Quotient.eq_zero_iff_mem.mpr ha, map_zero]
  have hs_unit : IsUnit (algebraMap (A ⧸ J) C s) := IsLocalization.Away.algebraMap_isUnit s
  have hs_eq : algebraMap (A ⧸ J) C s = algebraMap O C π * φ g := by
    rw [hφ]
    simp only [s, map_mul]
    rw [← IsScalarTower.algebraMap_apply]
  have hπu : IsUnit (algebraMap O C π) := isUnit_of_mul_isUnit_left (hs_eq ▸ hs_unit)
  have hgu : IsUnit (φ g) := isUnit_of_mul_isUnit_right (hs_eq ▸ hs_unit)
  have hunits : ∀ c : O, c ≠ 0 → IsUnit (algebraMap O C c) := by
    intro c hc
    obtain ⟨n, u, rfl⟩ := IsDiscreteValuationRing.eq_unit_mul_pow_irreducible hc hπ
    rw [map_mul, map_pow]
    exact (u.isUnit.map _).mul (hπu.pow n)
  have hsep := (slice_holds O K A 𝒜 x hx I hI h2 h4 f hf g hg).2
  have hnilA : ∀ a : A, IsNilpotent (φ a) → φ a = 0 := by
    intro a ⟨k, hk⟩
    have hp : algebraMap (A ⧸ J) C (Ideal.Quotient.mk J (a ^ k)) = 0 := by
      rw [← hφ, map_pow, hk]
    obtain ⟨⟨_, n, rfl⟩, hm⟩ :=
      (IsLocalization.map_eq_zero_iff (Submonoid.powers s) C _).mp hp
    have hpoint : ∀ ξ : A →ₐ[O] K, OnS I ξ → ξ f = 1 → ξ g ≠ 0 → ξ a = 0 := by
      intro ξ hOn hξf hξg
      have hJξ : ∀ v ∈ J, ξ v = 0 := by
        have hle : J ≤ RingHom.ker ξ := by
          refine sup_le (fun v hv => hOn v hv) ?_
          rw [Ideal.span_le, Set.singleton_subset_iff]
          show ξ (f - 1) = 0
          rw [map_sub, hξf, map_one, sub_self]
        exact fun v hv => hle hv
      let ξB : (A ⧸ J) →ₐ[O] K := Ideal.Quotient.liftₐ J ξ hJξ
      have hsne : ξB s ≠ 0 := by
        simp only [s, map_mul, AlgHom.commutes]
        refine mul_ne_zero ?_ ?_
        · exact (map_ne_zero_iff _ (FaithfulSMul.algebraMap_injective O K)).mpr hπ.ne_zero
        · exact hξg
      have he := congrArg ξB hm
      rw [map_mul, map_pow, map_zero] at he
      have ha : ξB (Ideal.Quotient.mk J (a ^ k)) = 0 :=
        (mul_eq_zero.mp he).resolve_left (pow_ne_zero _ hsne)
      change ξ (a ^ k) = 0 at ha
      rw [map_pow] at ha
      exact eq_zero_of_pow_eq_zero ha
    obtain ⟨m, c, hc, hmem⟩ := hsep a hpoint
    have hz := hφJ _ hmem
    have hmul : (algebraMap O C c * (φ g) ^ m) * φ a = 0 := by
      simpa only [Algebra.smul_def, map_mul, map_pow, AlgHom.commutes, mul_assoc] using hz
    exact unit_cancel_zero _ _ ((hunits c hc).mul (hgu.pow m)) hmul
  intro z ⟨k, hk⟩
  obtain ⟨⟨b, t, ht⟩, rfl⟩ := IsLocalization.mk'_surjective (Submonoid.powers s) z
  obtain ⟨n, rfl⟩ := ht
  obtain ⟨a, rfl⟩ := Ideal.Quotient.mk_surjective b
  set z := IsLocalization.mk' C (Ideal.Quotient.mk J a) (⟨s ^ n, n, rfl⟩ : Submonoid.powers s) with hz
  have hspec : z * algebraMap (A ⧸ J) C (s ^ n) = φ a := by
    rw [hz, IsLocalization.mk'_spec]
    rfl
  have htu : IsUnit (algebraMap (A ⧸ J) C (s ^ n)) := by
    rw [map_pow]
    exact hs_unit.pow n
  have hna : IsNilpotent (φ a) := by
    refine ⟨k, ?_⟩
    rw [← hspec, mul_pow, hk, zero_mul]
  have hza : z * algebraMap (A ⧸ J) C (s ^ n) = 0 :=
    hspec.trans (hnilA _ hna)
  exact unit_cancel_zero _ _ htu (by simpa only [mul_comm] using hza)

#print axioms native_public_slice_nilradical
rh_scan UpperTheory.V.Alg.M.slice_holds limit 500
rh_scan UpperTheory.V.Alg.M.locLen_quotientWeightPiece_le_one limit 500
rh_prune native_public_slice_nilradical as NativePublicSlicePruned

end RHDependencyPublicSlice
