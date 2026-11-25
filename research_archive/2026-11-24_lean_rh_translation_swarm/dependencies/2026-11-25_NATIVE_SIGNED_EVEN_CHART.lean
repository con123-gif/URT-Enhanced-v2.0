import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.SameDegreeZeroOfRestriction
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.TspHolds
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Lane 12: replace two signed graded-point constructions by one even-chart argument

25 Nov 2026. Human source-matched mathematical reduction; Lean caller
certificate PREPARED, NOT compiled. RH OPEN. This is not a new RH criterion.
Source pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005.
Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc.
Observed working head dd7cd00bda4c86c327de409381f1fd7122777aaf.
Read mission, SWARM, HANDOFF_QUEUE, AGENTS, continuity, research state/log
and protocol, latest peer integration dd7cd00b, arithmetic 91754a9c,
kernel transport 70732176, own previous 7175da1150aacdff151fca28ca2d4f1b46e13124.
The latter already established the human Euler defect reduction, so not repeated.
Live manuscript observed blob 75026c85481848e3c615fcec6e25bec2cfae1dbb.

## Precise native context / original graph (source-visible, not kernel edges)
All paths below relative to
src/Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/GradedModulesLength/.
ToDegInjective.lean 97af3567f20f3414761d99a42b84e7950a0fac37
OzTwoMulEqPow.lean fad05c483a0ad066e8c50758df1ddb22cd0a5108
ExistsSecNotMem.lean b4fe132070a616d722398662e7b90e9c64dcf877
SameDegreeZeroOfRestriction.lean 326bb452ed1237b526c11c29afbbedd151fc84d9
ZmOfHom.lean e6e812b55c2dea4661f670dc3c52a5b979e780fe
ExistsNotInP.lean 588718a99c276d6bc6dc09d141ce22127cb2c15f
FixHolds.lean 9cec8806725dcac675a39d2573222113fd04951f
XProjZero.lean 64e1be8873eddd3d8e2b41b82118a99cee71b84d
PrimeMaximalOrKernel.lean 7617f1cae2dcb40f4e5a2a152b83e354bb566d36
TspHolds.lean e759039bb840d3615025ce38f00eed29f91255ee
NsPoint.lean 638924391b7f1cf9d12cac60ccaf1ad58206113b
EventuallyMQGrFiniteAnnihilator.lean 141ac8b847f836a9d22373ca0ef352c0726b3ffe
KillHolds.lean a4b88894bd91fc387002555b9f956f3e4b313764
FtHolds.lean b089614b9ad7f74b8b6fe7582796f4351fcf60aa
../OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15

Original graph from previous upper-length handoff:
eventually_mQ_gr_finite_annihilator -> power_ideal_kills_graded_pieces,
localized_length_zero, finite_quotient_of_kernel_pow;
power_ideal_kills_graded_pieces uses zi_holds/zii_holds via callbacks;
zii_holds -> zi_holds, emb_holds, zm_holds, zp_holds, fix_holds,
ct_holds, M3; zm_holds -> zm_abs, zm_iota, oz_two_mul_eq_pow,
zi_holds, ns_holds, ft_holds; zp_holds -> graded idJ, inP_neg,
oz_two_mul_eq_pow, ns_holds, ft_holds.
Upper support also uses tsp_holds -> ft_holds, ns_holds.
Retain all original graphs, axioms and other consumers. No global deletion.

## Human proof block A: a single signed even chart

Keep native O, K, A=direct sum A_j, B=A_0, IsWRing, Q, R=mR Q,
prime P in R, irrelevant ideal not contained in P, secs(ts Q) in P,
all degree-zero Z_i in P, and idD mapped into P. Set
p=P intersect B, L=Frac(R/P), I=Q.ideal. Let sigma:B->K be the
actual point with kernel p. No change of host or sigma.
Let E=direct sum A_(2j), the even subring. For s in {-1,+1} define

  phi_s(a) = class(a T_i^n) in L   if a in A_(2 s n), n>=0,
             0                    if a in A_(-2 s m), m>0.

Here i=0 if s=-1 and i=1 if s=+1, precisely the first two Rees
coordinates, and n=0 means the given map B->R/P->L. Extend by
finite homogeneous sums. Existence of a T_i^n in R is exactly
native oz_two_mul_eq_pow and lat_single powers; same-sign
multiplication is the exact monomial identity in ToDegInjective.

Mixed-sign cancellation, before any estimate: for a in A_(-2s m),
b in A_(2s n), m>0. If n<m their product is mapped to zero by degree.
If n>=m, expand a,b as sums of products of m,n weight -2s,+2s
elements, respectively, using oz_two_mul_eq_pow. Pair the first
m factors into elements of idD subset B. Each summand of
(ab) T_i^(n-m) therefore contains a degree-zero factor in P,
so is zero in R/P. Consequently phi_s is a unital ring homomorphism.
No division, norm, choice of compatible square roots or assumed
multiplicativity of degree-zero projection is needed.

A is integral over E: each odd homogeneous element u satisfies the
monic polynomial X^2-u^2 over E; homogeneous elements generate A.
By lying over for the prime ker(phi_s), the induced algebraic
extension of residue fields embeds in an algebraic closure Omega of
L over Frac(E/ker(phi_s)). Thus phi_s extends to A->Omega.
(One may use the elementary nonzero base-changed integral algebra
and a maximal ideal instead.) Every opposite-sign odd element
vanishes because its square does. For the surviving sign the
native irrelevant condition gives f in A_(2s) with f T_i not in P;
hence the extension is nonzero at f. This uses the actual first
two Rees coordinates, not an arbitrary abstract two-sided orbit.

All generators of Q.ideal vanish: opposite-sign ones already do;
on the surviving sign, native sections kill G or E' and squares
of F or E. For the last negative F use precisely zi_holds.2
(which transfers its squared section from coordinate 2 to 0).
All Z_i vanish by hypothesis. Since Omega is a field, a vanishing
square implies vanishing of its root.

Now let J_s be the ideal of A generated by Q.ideal, all homogeneous
elements of the opposite sign, and the image of ker(sigma).
The constructed Omega point kills J_s but is nonzero on f and
on every b in B with sigma(b) nonzero (its restriction to B has
kernel exactly p). Therefore b f^n is NOT in J_s for every such b
and every n>=0. Apply the actual native ns_holds with the SAME
sigma, J_s, f, and ft_holds. This returns a K-valued point, with
the actual restriction sigma, on Q.ideal, zero on the opposite
sign and nonzero on the surviving sign. Repeat using s=-1,+1.
The auxiliary Omega points are only certificates of disjointness:
they are NOT substituted for the required K-valued points. This
distinction preserves the fixed coefficient-field quantifier.

This replaces the two asymmetric saturation constructions zmJ/idJ
by one uniform proof, using standard integral lying-over and
extension of field embeddings (to be checked by the literature/audit
lanes). The already-existing native lifts remain the executable
fallback. No numerical tests used as mathematical evidence.

At the actual zii_holds consumer, emb_holds gives p maximal or
a sigma as above. In the latter case fix_holds gives the fixed
point xi over the SAME sigma. If xi is x, ct_holds (using the two
native cotangent spans) contradicts the negative surviving point.
Otherwise M3 excludes one of the two signed points over xi; we
have both. Thus p must be maximal. M3 is retained, as are both
cotangent spans and M2. The proof below factors this exact
caller into a paired-lift interface. It replays the interface
from the original native suppliers as a fallback, NOT a kernel
implementation of the new even-chart construction.

## Human proof block B: shorten tsp_holds by a split fibre

For any homogeneous I in a commutative graded A, the degree-zero
projection A->B is B-linear and takes I into I intersect B. Thus
B/(I intersect B) -> A/I is a split injection of B-modules. For
sigma:B->K killing I intersect B, tensor with K via sigma; the
split injection remains split and exhibits K inside (A/I) tensor_B K.
No flatness or surjectivity of sigma is required. This fibre is a
nonzero finite-type K-algebra by ft_holds. Weak Nullstellensatz
gives a K-point, since K is algebraically closed. The composite
A->(A/I) tensor_B K->K kills I and restricts to sigma. This is the
native tsp_holds statement; no signed condition needed. This shorter
human argument is independent of the signed-lift construction.

## Overlay and limitations
Reduced source-matched graph: zii_holds -> zi_holds, emb_holds,
paired even chart (both signs), fix_holds, ct_holds, M3.
paired even chart -> oz_two_mul_eq_pow, native sections,
prime cancellation/idD, integral lying over, ns_holds, ft_holds.
tsp_holds -> degree-zero split fibre, ft_holds, weak Nullstellensatz.
Keep original graph and any still-used ns_holds, zm_holds, zp_holds
edges, especially outside this specialized caller. Cache key: source
pin, exact A/B/O/K, Q, P, sigma, sign, Rees coordinate. No cross-host
reuse of a point. The M4 tangent condition, support finiteness,
valuation aggregate and uniform CountI cohomological premises are
unaffected. No RH root or claimed proof imported.

Verification: executed 49 source assertions (9 exact blob identities
plus 40 exact declaration/call anchors) at the source pin. Local
Lean/Lake not installed; no new CI or axiom verdict. Existing native
engines at prior accepted CI baseline are not evidence for this file.
The following executable caller certificate requires those three
engine modules on the pinned Lean search path. Native scan/prune
are bounded and must be inspected; new human chart/fibre arguments
still need independent native formalization. Do not label this PASS.

RESUME HERE: independently formalize the even-subring map and the
lying-over field-extension step against the exact Rees construction,
or retain the original signed-lift suppliers if that bridge fails.
Then audit the residual M3/ct_holds and M4 premises at the actual
cohomological producer, not a generic unrelated graded algebra.
HANDOFF TO: integration, Galois, kernel and formal-audit lanes.
-/

open IsLocalRing Filter Formalism.MainNotions.V.Pf.V2.Calc UpperTheory.V.Alg UpperTheory.V.Alg.M

namespace RHDependencySignedChart

theorem support_from_paired_lifts
    (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (maximalIdeal O) O] [CharZero O]
    (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K]
    (A : Type) [CommRing A] [Algebra O A]
    (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] [IsCO O (𝒜 0)]
    (x : A →ₐ[O] O) (hW : IsWRing 𝒜 x)
    (r s r' s' m : ℕ) (Q : Eqns 𝒜 x r s r' s' m)
    (hF : SpansCot x 𝒜 (-1) Q.F) (hG : SpansCot x 𝒜 (-2) Q.G)
    (h2 : M2 𝒜 Q.ideal) (h3 : M3 𝒜 K x Q.ideal)
    (p : Ideal (mR Q)) (hp : p.IsPrime)
    (hirr : ¬ Irr (mGr Q) ≤ p) (hsec : secs (ts Q) ≤ p)
    (hZ : ∀ i, algebraMap (𝒜 0) (mR Q) ⟨Q.Z i, (Q.hZ i).1⟩ ∈ p)
    (hD : (idD 𝒜).map (algebraMap (𝒜 0) (mR Q)) ≤ p)
    (pair : ∀ σ : 𝒜 0 →ₐ[O] K,
      RingHom.ker σ = p.comap (algebraMap (𝒜 0) (mR Q)) →
      (∃ ξm : A →ₐ[O] K, OnS Q.ideal ξm ∧ PosZero 𝒜 ξm ∧
        ¬ NegZero 𝒜 ξm ∧ res0 𝒜 ξm = σ) ∧
      (∃ ξp : A →ₐ[O] K, OnS Q.ideal ξp ∧ NegZero 𝒜 ξp ∧
        ¬ PosZero 𝒜 ξp ∧ res0 𝒜 ξp = σ)) :
    (maximalIdeal (𝒜 0)).map (algebraMap (𝒜 0) (mR Q)) ≤ p := by
  have hi := (zi_holds O A 𝒜 x hW r s r' s' m Q p hp hirr hsec hZ).1
  have hP : (p.comap (algebraMap (𝒜 0) (mR Q))).IsPrime := Ideal.comap_isPrime _ _
  rcases emb_holds O K A 𝒜 x Q.ideal h2 _ hP (fun b hb => hi b hb) with h | ⟨-, σ, hσ⟩
  · rw [Ideal.map_le_iff_le_comap, h]
  exfalso
  obtain ⟨⟨ξm, hmS, hmP, hmN, hm0⟩, ⟨ξp, hpS, hpN, hpP, hp0⟩⟩ := pair σ hσ
  obtain ⟨ξ, hS, hN, hPz, h0⟩ := fix_holds O K A 𝒜 x hW r s r' s' m Q σ
    (by rw [hσ]; exact Ideal.map_le_iff_le_comap.1 hD)
    (fun b hb => by
      have : b ∈ RingHom.ker σ := by rw [hσ]; exact hi b hb
      exact this)
  have sm : Same0 𝒜 ξm ξ := fun b hb => DFunLike.congr_fun (hm0.trans h0.symm) ⟨b,hb⟩
  have sp : Same0 𝒜 ξp ξ := fun b hb => DFunLike.congr_fun (hp0.trans h0.symm) ⟨b,hb⟩
  by_cases hx : ξ = (Algebra.ofId O K).comp x
  · have hneg := ct_holds O K A 𝒜 x hW r s r' s' m Q hF hG ξm hmS hmP (hx ▸ sm)
    exact hmN hneg
  · rcases h3 ξ hS hN hPz hx with h | h
    · exact h ⟨ξp, hpS, hpN, hpP, sp⟩
    · exact h ⟨ξm, hmS, hmP, hmN, sm⟩

-- Actual native fallback for the paired-lift interface; not the new chart proof.
theorem native_paired_lifts
    (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (maximalIdeal O) O] [CharZero O]
    (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K]
    (A : Type) [CommRing A] [Algebra O A]
    (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] [IsCO O (𝒜 0)]
    (x : A →ₐ[O] O) (hW : IsWRing 𝒜 x)
    (r s r' s' m : ℕ) (Q : Eqns 𝒜 x r s r' s' m)
    (p : Ideal (mR Q)) (hp : p.IsPrime)
    (hirr : ¬ Irr (mGr Q) ≤ p) (hsec : secs (ts Q) ≤ p)
    (hZ : ∀ i, algebraMap (𝒜 0) (mR Q) ⟨Q.Z i, (Q.hZ i).1⟩ ∈ p)
    (hD : (idD 𝒜).map (algebraMap (𝒜 0) (mR Q)) ≤ p)
    (σ : 𝒜 0 →ₐ[O] K)
    (hσ : RingHom.ker σ = p.comap (algebraMap (𝒜 0) (mR Q))) :
    (∃ ξm : A →ₐ[O] K, OnS Q.ideal ξm ∧ PosZero 𝒜 ξm ∧
      ¬ NegZero 𝒜 ξm ∧ res0 𝒜 ξm = σ) ∧
    (∃ ξp : A →ₐ[O] K, OnS Q.ideal ξp ∧ NegZero 𝒜 ξp ∧
      ¬ PosZero 𝒜 ξp ∧ res0 𝒜 ξp = σ) := by
  have hm := zm_holds O K A 𝒜 x hW r s r' s' m Q p hp hirr hsec hZ hD σ hσ
  have hp' := zp_holds O K A 𝒜 x hW r s r' s' m Q p hp hirr hsec hZ hD σ hσ
  constructor
  · rh_auto 2
  · rh_reduce 2 using []

#print axioms support_from_paired_lifts
#print axioms native_paired_lifts
rh_scan UpperTheory.V.Alg.M.zii_holds limit 300
rh_scan UpperTheory.V.Alg.M.tsp_holds limit 300
rh_prune native_paired_lifts as NativePairedLiftsPruned

end RHDependencySignedChart
