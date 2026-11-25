/-!
RUN35 lane 6 — canonical host cohomological transport, 25 Nov 2026.
SOURCE-MATCHED HUMAN / PREPARED Lean; no new kernel check.
Mission cd0a176134d46b5b624896e56843a24915c14477; living proof
464e82f81f646d4af85e1f5f70d379026df46261. Read AGENTS, SWARM, HANDOFF,
EXPANSION, continuity and recent peers (Galois 18c72c4c, fixed layer
bb0948b0, K-theory 620547cb, kernel 3f25eb66, theta 97a3d534).
Native source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Upstream latest
91b273530883b723ef4422436e0dc3557749325a, not substituted.

SOURCE LEDGER (paths relative to upstream root):
src/Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/EquivOfRange.lean 6447f7b5d77085e947483df5dd30129c309fd65a
src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/GaloisCohomologyLength/ShaLenEqShaInv.lean 19302758658356ff85c5540681e53e79579ab975
src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7
src/Development/AutomorphicArithmetic/ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc
src/Development/AutomorphicArithmetic/AutomorphicVarieties/CMFieldExponentialBounds/ConductorBoundsOfIsChiField.lean 02c9bfa54fab4dee3e3b114b254a961123f06bfe
src/Development/AutomorphicArithmetic/AutomorphicVarieties/StmtFields.lean 857965059bf92dee66f67769d93377548b55a764
src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/GaloisCohomologyLength/ShaAbsRes.lean c3c40d14b7561a9f073d8cbafc4438d2c875ea68

CORRECTION to RUN34: the precise transport needed is ALREADY supplied
in the pinned native ShaLenEqShaInv.lean:
  shaLen_congr f D D' e
  vvle_congr f t B : VVle E t B ↔ VVle E' t B.
Its proof uses inflation to the absolute local kernel, algebraic
closure isomorphism, transport of Galois/cyclotomic action and places,
and injection in both directions on ShaAbs. This keeps infinite
length guards as well as all finite-prime weighted sums. Neither
K-theory nor a new comparison theorem is needed for this transfer.
Do not infer axiom closure from the presence of this theorem body.

Human proof of canonical reduction: fix (ψ,e,q,d), and two actual
IsChiField witnesses. For an automorphism of Qbar, restrict to each
cyclotomic field and let a,b be the respective primitive-root
exponents. For any common divisor m of their conductors, the two
primitive mth roots differ by a power, hence a=b mod m (because a
primitive mth root has order m). Apply this with m=2^(e+2), ψ.N, q,d.
The same four components of the native fixing predicate agree, by
modular congruence and periodicity of character and Jacobi symbols.
Thus both images in Qbar have identical fixing subgroups; infinite
Galois correspondence gives identical fields, hence a Q-isomorphism.
Combining with native vvle_congr gives, for any admitted E0,
   (forall admitted E, VVle E t B) iff VVle E0 t B.
This includes the exact t=floor(x^401), B=sqrt(exp(x^eps)) budget
and the wide t=floor(x^400), B=exp(x^eps)*(x^eps)^2 budget.
A single existential witness with the bound suffices, but the
converse requires field existence (otherwise universal statement
could be vacuous). The actual H.E remains unchanged; at supplyOfAdmOf
line with hW.bound H.E hCF use iso transport, then the same VVle.mono.
Same q,d across window; E0 may depend on the page e(x), never pick
different q,d or change the window. This does NOT prove the uniform
quantitative bound.

Source-visible original graph: VWinAt -> winPairs -> supplyOfAdmOf ->
isChiField, VAt on H.E, VVle.mono -> supplyChi -> TopG -> ramp.
Candidate graph: one-field budget -> chiField_iso35 + native vvle_congr
-> old VAt (or VAtWide with same budget) -> unchanged consumer.
Native vvle_congr -> vvle_iff_shaInv, shaInv_congr ->
length_ShaAbs_le -> galTransport, placeTransport, shaAbsRes;
shaLen_eq_shaInv -> shaLen_eq_abs -> map_Sha, injective_infl.
Original fallback and all kernel roles/axiom evidence retained.
Context key (pin, toolchain, ψ,e,q,d,E0,E,x,t,B,closure embeddings,
field instances). No global edge deletion or root premise closed.
No URT comparison, no numerical evidence asserted.

Actual work: 37 source hash, literal anchor and extraction checks
executed against pinned GitHub source; reused SIX helper bodies
verbatim from EquivOfRange (namespace changed). Lean and Lake absent
on local PATH. Prior native engine CI statuses 45577239749,
45576756833 retrieved (status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717), only baseline passed.
New scans, prune and search PREPARED, not executed or queued. Need
compile with pinned imports/engine oleans; inspect complete proof
dependencies and axioms, plus actual consumer substitution.

RESUME HERE: batch replay this file with shared engine imports,
especially chiField_iso35 and native vvle_congr's axiom ledger;
then use one admitted field's bound in the actual principal VWin
producer and direct400 overlay. No need to rederive cross-field
cohomological transport. Focus on uniform same-host quantitative
Sha length supplier, with all primes and growing twists intact.
HANDOFF TO Galois, integration, kernel, audit, editor. RH OPEN.
-/
import Mathlib
import Development.AutomorphicArithmetic.CharacterBoxes.ExistsPageN
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.EquivOfRange
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.GaloisCohomologyLength.ShaLenEqShaInv
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open NumberField Formalism.HC UpperTheory.Top UpperTheory.V.LDataCardLeFinrank
noncomputable section
namespace RHCharacter35

private theorem act_root {K : Type} [Field K] {N : ℕ} [NeZero N] {ζ x : K} (hζ : IsPrimitiveRoot ζ N)
    (σ : K →+* K) {a : ℕ} (hσ : σ ζ = ζ ^ a) (hx : x ^ N = 1) : σ x = x ^ a := by
  obtain ⟨i, -, rfl⟩ := hζ.eq_pow_of_pow_eq_one hx
  rw [map_pow, hσ, pow_right_comm]

private theorem exists_pow {N : ℕ} [NeZero N] {ζ : CyclotomicField N ℚ} (hζ : IsPrimitiveRoot ζ N)
    (τ : CyclotomicField N ℚ ≃ₐ[ℚ] CyclotomicField N ℚ) : ∃ a : ℕ, τ ζ = ζ ^ a := by
  obtain ⟨i, -, h⟩ := hζ.eq_pow_of_pow_eq_one (ξ := τ ζ) (by rw [← map_pow, hζ.pow_eq_one, map_one])
  exact ⟨i, h.symm⟩

private theorem mem_fix {E K : Type} [Field E] [Field K] [Algebra ℚ E] [Algebra ℚ K] (j : E →ₐ[ℚ] K)
    (τ : K ≃ₐ[ℚ] K) : τ ∈ j.fieldRange.fixingSubgroup ↔ ∀ x : E, τ (j x) = j x := by
  rw [IntermediateField.mem_fixingSubgroup_iff]
  exact ⟨fun h x => h _ ⟨x, rfl⟩, fun h _ ⟨x, hx⟩ => hx ▸ h x⟩

private theorem exists_res {K L : Type} [Field K] [Field L] [Algebra ℚ K] [Algebra ℚ L] [Normal ℚ K]
    (f : K →ₐ[ℚ] L) (σ : L ≃ₐ[ℚ] L) : ∃ τ : K ≃ₐ[ℚ] K, ∀ x : K, σ (f x) = f (τ x) := by
  letI : Algebra K L := f.toRingHom.toAlgebra
  haveI : IsScalarTower ℚ K L := IsScalarTower.of_algebraMap_eq fun r => (f.commutes r).symm
  exact ⟨σ.restrictNormal K, fun x => (σ.restrictNormal_commutes K x).symm⟩

private theorem equiv_of_range {F L L' Ω : Type} [Field F] [Field L] [Field L'] [Field Ω] [Algebra F L]
    [Algebra F L'] [Algebra F Ω] (g : L →ₐ[F] Ω) (g' : L' →ₐ[F] Ω) (e : g.fieldRange = g'.fieldRange) :
    Nonempty (L ≃+* L') :=
  ⟨((g.equivFieldRange.trans (IntermediateField.equivOfEq e)).trans g'.equivFieldRange.symm).toRingEquiv⟩

private theorem equiv_of_fix {L L' Ω : Type} [Field L] [Field L'] [Field Ω] [Algebra ℚ L] [Algebra ℚ L']
    [Algebra ℚ Ω] [IsGalois ℚ Ω] (g : L →ₐ[ℚ] Ω) (g' : L' →ₐ[ℚ] Ω)
    (h : ∀ σ : Ω ≃ₐ[ℚ] Ω, (∀ x, σ (g x) = g x) ↔ ∀ x, σ (g' x) = g' x) : Nonempty (L ≃+* L') := by
  have e : g.fieldRange = g'.fieldRange := by
    rw [← InfiniteGalois.fixedField_fixingSubgroup g.fieldRange,
      ← InfiniteGalois.fixedField_fixingSubgroup g'.fieldRange]
    congr 1
    ext σ
    rw [mem_fix, mem_fix, h]
  exact equiv_of_range g g' e

private theorem exponent_mod {N N' m : ℕ} [NeZero N] [NeZero N']
    {ζ : CyclotomicField N ℚ} {ζ' : CyclotomicField N' ℚ}
    (hζ : IsPrimitiveRoot ζ N) (hζ' : IsPrimitiveRoot ζ' N')
    (f : CyclotomicField N ℚ →ₐ[ℚ] AlgebraicClosure ℚ)
    (f' : CyclotomicField N' ℚ →ₐ[ℚ] AlgebraicClosure ℚ)
    (σ : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ)
    (τ : CyclotomicField N ℚ ≃ₐ[ℚ] CyclotomicField N ℚ)
    (τ' : CyclotomicField N' ℚ ≃ₐ[ℚ] CyclotomicField N' ℚ)
    (hσ : ∀ x, σ (f x) = f (τ x))
    (hσ' : ∀ x, σ (f' x) = f' (τ' x))
    {a b : ℕ} (ha : τ ζ = ζ ^ a) (hb : τ' ζ' = ζ' ^ b)
    (hm : m ∣ N) (hm' : m ∣ N') : a ≡ b [MOD m] := by
  have hmpos : 0 < m := Nat.pos_of_dvd_of_pos hm (NeZero.pos N)
  letI : NeZero m := ⟨hmpos.ne'⟩
  obtain ⟨k, hk⟩ := hm
  obtain ⟨k', hk'⟩ := hm'
  have hω : IsPrimitiveRoot (f (ζ ^ k)) m :=
    (hζ.pow (NeZero.pos N) (by rw [hk, mul_comm])).map_of_injective f.injective
  have hω' : IsPrimitiveRoot (f' (ζ' ^ k')) m :=
    (hζ'.pow (NeZero.pos N') (by rw [hk', mul_comm])).map_of_injective f'.injective
  have h1 : σ (f (ζ ^ k)) = f (ζ ^ k) ^ a := by
    rw [hσ, map_pow τ, ha, pow_right_comm, map_pow f]
  have h2 : σ (f' (ζ' ^ k')) = f' (ζ' ^ k') ^ b := by
    rw [hσ', map_pow τ', hb, pow_right_comm, map_pow f']
  have h3 : σ (f (ζ ^ k)) = f (ζ ^ k) ^ b :=
    act_root hω' (σ : AlgebraicClosure ℚ →+* AlgebraicClosure ℚ) h2 hω.pow_eq_one
  have h := ((hω.isOfFinOrder hmpos.ne').pow_eq_pow_iff_modEq).1 (h1.symm.trans h3)
  rwa [← hω.eq_orderOf] at h

private def kernelPred (ψ : PChar) (e q d a : ℕ) : Prop :=
  (a ≡ 1 [MOD 2 ^ (e + 2)] ∨ a + 1 ≡ 0 [MOD 2 ^ (e + 2)]) ∧
  ψ.val a = 1 ∧ jacobiSym (a : ℤ) q = 1 ∧ jacobiSym (a : ℤ) d = 1

private theorem jacobi_congr {a b m : ℕ} (h : a ≡ b [MOD m]) :
    jacobiSym (a : ℤ) m = jacobiSym (b : ℤ) m := by
  have hh : (a : ℤ) % (m : ℤ) = (b : ℤ) % (m : ℤ) := by
    unfold Nat.ModEq at h
    exact_mod_cast congrArg (Nat.cast (R := ℤ)) h
  rw [jacobiSym.mod_left, hh, ← jacobiSym.mod_left]

private theorem kernel_congr (ψ : PChar) (e q d a b : ℕ)
    (h2 : a ≡ b [MOD 2 ^ (e + 2)]) (hψ : a ≡ b [MOD ψ.N])
    (hq : a ≡ b [MOD q]) (hd : a ≡ b [MOD d]) :
    kernelPred ψ e q d a ↔ kernelPred ψ e q d b := by
  have h2add : a + 1 ≡ b + 1 [MOD 2 ^ (e + 2)] :=
    h2.add (Nat.ModEq.refl 1)
  have h2' : (a ≡ 1 [MOD 2 ^ (e + 2)] ∨ a + 1 ≡ 0 [MOD 2 ^ (e + 2)]) ↔
      (b ≡ 1 [MOD 2 ^ (e + 2)] ∨ b + 1 ≡ 0 [MOD 2 ^ (e + 2)]) :=
    ⟨fun h => h.elim (fun h => Or.inl (h2.symm.trans h))
        (fun h => Or.inr (h2add.symm.trans h)),
      fun h => h.elim (fun h => Or.inl (h2.trans h))
        (fun h => Or.inr (h2add.trans h))⟩
  have hval : ψ.val a = ψ.val b := by
    change ψ.χ (a : ZMod ψ.N) = ψ.χ (b : ZMod ψ.N)
    rw [(ZMod.natCast_eq_natCast_iff _ _ _).2 hψ]
  unfold kernelPred
  rw [h2', hval, jacobi_congr hq, jacobi_congr hd]

theorem chiField_iso35 (ψ : PChar) (e q d : ℕ)
    (E E' : Type) [Field E] [NumberField E] [Field E'] [NumberField E']
    (hE : IsChiField ψ e q d E) (hE' : IsChiField ψ e q d E') :
    Nonempty (E ≃+* E') := by
  obtain ⟨N, hN, i, ζ, h2, hψ, hq, hd, hζ, H0⟩ := hE
  obtain ⟨N', hN', j, ζ', h2', hψ', hq', hd', hζ', H⟩ := hE'
  haveI : IsCyclotomicExtension {N} ℚ (CyclotomicField N ℚ) := CyclotomicField.isCyclotomicExtension _ ℚ
  haveI : IsCyclotomicExtension {N'} ℚ (CyclotomicField N' ℚ) := CyclotomicField.isCyclotomicExtension _ ℚ
  haveI : IsAbelianGalois ℚ (CyclotomicField N ℚ) := IsCyclotomicExtension.isAbelianGalois {N} ℚ _
  haveI : IsAbelianGalois ℚ (CyclotomicField N' ℚ) := IsCyclotomicExtension.isAbelianGalois {N'} ℚ _
  haveI : IsGalois ℚ (AlgebraicClosure ℚ) := by
    first
    | exact @IsAlgClosure.isGalois ℚ (AlgebraicClosure ℚ) _ _ (AlgebraicClosure.instAlgebra ℚ) _ _
    | convert @IsAlgClosure.isGalois ℚ (AlgebraicClosure ℚ) _ _ (AlgebraicClosure.instAlgebra ℚ) _ _
  let f : CyclotomicField N ℚ →ₐ[ℚ] AlgebraicClosure ℚ := IsAlgClosed.lift
  let f' : CyclotomicField N' ℚ →ₐ[ℚ] AlgebraicClosure ℚ := IsAlgClosed.lift
  refine equiv_of_fix (f.comp i) (f'.comp j) fun σ => ?_
  obtain ⟨τ, hσ⟩ := exists_res f σ
  obtain ⟨τ', hσ'⟩ := exists_res f' σ
  obtain ⟨a, ha⟩ := exists_pow hζ τ
  obtain ⟨b, hb⟩ := exists_pow hζ' τ'
  have h4 := kernel_congr ψ e q d a b
    (exponent_mod hζ hζ' f f' σ τ τ' hσ hσ' ha hb h2 h2')
    (exponent_mod hζ hζ' f f' σ τ τ' hσ hσ' ha hb hψ hψ')
    (exponent_mod hζ hζ' f f' σ τ τ' hσ hσ' ha hb hq hq')
    (exponent_mod hζ hζ' f f' σ τ τ' hσ hσ' ha hb hd hd')
  have e1 : (∀ x, σ ((f.comp i) x) = (f.comp i) x) ↔ ∀ x, τ (i x) = i x := by
    refine forall_congr' fun x => ?_
    show σ (f (i x)) = f (i x) ↔ _
    rw [hσ]
    exact f.injective.eq_iff
  have e2 : (∀ x, σ ((f'.comp j) x) = (f'.comp j) x) ↔ ∀ x, τ' (j x) = j x := by
    refine forall_congr' fun x => ?_
    show σ (f' (j x)) = f' (j x) ↔ _
    rw [hσ']
    exact f'.injective.eq_iff
  rw [e1, e2, H0 τ a ha, H τ' b hb]
  exact h4

-- New bridge uses the actual native cross-field transport, not a hypothesis.
theorem chi_vvle_iff35 (ψ : PChar) (e q d t : ℕ) (B : ℝ)
    (E E' : Type) [Field E] [NumberField E] [Field E'] [NumberField E']
    (hE : IsChiField ψ e q d E) (hE' : IsChiField ψ e q d E') :
    VVle E t B ↔ VVle E' t B := by
  obtain ⟨f⟩ := chiField_iso35 ψ e q d E E' hE hE'
  exact vvle_congr f t B

theorem all_chi_vvle_iff35 (ψ : PChar) (e q d t : ℕ) (B : ℝ)
    (E0 : Type) [Field E0] [NumberField E0] (hE0 : IsChiField ψ e q d E0) :
    (∀ (E : Type) [Field E] [NumberField E], IsChiField ψ e q d E → VVle E t B) ↔
    VVle E0 t B := by
  constructor
  · intro h
    exact h E0 hE0
  · intro h E _ _ hE
    exact (chi_vvle_iff35 ψ e q d t B E0 E hE0 hE).mp h

theorem vAt_of_one35 (ψ : PChar) (eps Ct : ℝ) (q d e : ℕ) (x : ℝ)
    (E0 : Type) [Field E0] [NumberField E0] (hE0 : IsChiField ψ e q d E0)
    (h0 : VVle E0 ⌊x ^ Ct⌋₊ (Real.sqrt (Real.exp (x ^ eps)))) :
    VAt ψ eps Ct q d e x := by
  exact (all_chi_vvle_iff35 ψ e q d _ _ E0 hE0).mpr h0

-- Consumer bridge at actual selected host: same arithmetic bound and cutoff.
theorem selected_host35 (ψ : PChar) (e q d t t' : ℕ) (B B' : ℝ)
    (E0 E : Type) [Field E0] [NumberField E0] [Field E] [NumberField E]
    (hE0 : IsChiField ψ e q d E0) (hE : IsChiField ψ e q d E)
    (h0 : VVle E0 t B) (ht : t' ≤ t) (hB : B ≤ B') : VVle E t' B' := by
  have hv : VVle E t B := (chi_vvle_iff35 ψ e q d t B E0 E hE0 hE).mp h0
  first
  | (rh_reduce 2 using [VVle.mono]; done)
  | (rh_auto 2; done)
  | (rh_auto_frontier 2; done)
  | exact hv.mono ht hB

end RHCharacter35

rh_scan UpperTheory.V.LDataCardLeFinrank.vvle_congr limit 2000
rh_scan RHCharacter35.chiField_iso35 limit 2000
rh_scan RHCharacter35.selected_host35 limit 2000
rh_prune RHCharacter35.selected_host35 as RHCharacter35HostPruned
#print axioms UpperTheory.V.LDataCardLeFinrank.vvle_congr
#print axioms RHCharacter35.chiField_iso35
#print axioms RHCharacter35.vAt_of_one35
#print axioms RHCharacter35.selected_host35
