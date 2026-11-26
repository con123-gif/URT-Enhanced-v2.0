import New.GaloisRep.LabelUniqueness
import New.Trace.LabelRigidity
import New.Selmer.LabelledColumns
import New.Selmer.DenominatorBound

/-!
# RUN54 — primitive labels, Frobenius separation, and local row guards
26 November 2026. HUMAN SOURCE-MATCHED; scalar Lean checks prepared,
not elaborated. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
22ba49126cafef59be3421168796221d85f35c55; RUN53 retained.
Read current mission, protocol, handoff, expansion, AGENTS, unified
witness and recent peer results. Peer c7cde9ac already derives packet
support by traces, not repeated here. Peer d064b084 and fce4be62 cover
balanced-row and cyclotomic-triangle work; no change to these callers.

## 1. Primitive tame orbit separation (the missing RUN51 input)
Lib/LocalGL/Green/LabelIdempotents.lean 15901cb83be961651cb7d38dee539d839dd9d91a,
frobenius_conj_pow_injOn; New/Trace/BadShare.lean
c11125394c77115db75179ba513fbcfce13e5d39, IsPrimitiveLabel.scaleRoots
and IsPrimitiveLabel.isPrimitiveRoot_prod_roots.
The actual rank is r=3^(e+1) and q≡1 (mod 9); for rank one
the separation is vacuous. Let N=q^r-1, ξ a primitive N-th root,
and ℓ any prime, including 3 or the residue characteristic.
The map z↦z^q has period dividing r on ξ^(ℓ^a), since
(ξ^(ℓ^a))^(q^r)=ξ^(ℓ^a). If its period is a proper divisor of r,
it divides r/3, so N divides ℓ^a(q^(r/3)-1). Put A=q^(r/3).
Cancel A-1>0 in this integer divisibility to obtain
    A²+A+1 | ℓ^a.
But A=9s+1 with s≥1, and
    A²+A+1 = 3(27s²+9s+1).
The second factor is >1 and is 1 modulo 3. Therefore the left side
has at least two distinct prime divisors, impossible for a divisor
of ℓ^a. This proves exact period r for every a≥0. In particular
two distinct q-orbit conjugates remain distinct after every ℓ-power.
This argument proves the actual arithmetic hypothesis of the
integral spectral projector argument in RUN51, not just generic
irreducibility in characteristic zero.

Scaling by a base-field scalar u of order dividing M does not
change primitivity provided M² | q-1 and M>0. In the cyclic
group of order N write u=ξ^(kN/M). For every prime p|N,
p|N/M: if p|M use M²|N, otherwise use p∤M. Thus
gcd(1+kN/M,N)=1, so uξ is still primitive. Scaling preserves
degree and monic irreducibility by the invertible substitution.
Finally the product of the r conjugates is
    ξ^(1+q+...+q^(r-1)) = ξ^(N/(q-1)),
which has exact order q-1. These are the two native
BadShare lemmas used by LabelledColumns.isRow and LabelUniqueness.
No primitive label assumption removed; it is supplied at each of
the two chosen g-primes by IsApt.exists_primitive.

## 2. Rigidity: one Hecke packet admits at most one primitive label
New/GaloisRep/LabelUniqueness.lean 9173b7937bc23bfa19692352698fe07996127cda,
Data.occurringLabels_subsingleton.
New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825,
occurringLabels and dvd_card_resField_sub_one.
New/Trace/LabelRigidity.lean 029e19bd0d69fc081a6edb9feb2702260134e0d1.
Fix the same packet p and chosen place x; put M=P.Mω D.s.
Actual source gives 9 | q-1, M² | q-1, and M+1<q.
Suppose two distinct primitive degree-r labels c,c' occur.
The injective lift L and the nonzero idempotent vectors yield
nonzero eigenforms of the SAME spherical Hecke polynomial F,
using Data.isEigenform_of_hasHeckePolyAt and the given parahoric
intertwining. Use the same attached representation R of F
(the source chooses R once and applies B and B' to that R),
at ℓ=2 and the SAME tame element σ at x. The source size guard
makes this chosen q different from 2, hence determinant compatibility
applies. Do not choose separate σ or independent Galois embeddings.

The two tame local-global label polynomials for R(σ) have roots
from the respective scaled primitive labels plus roots of
unity of order dividing M, with the prescribed multiplicities.
Scaling uses ψ, whose M-th power is 1, and is invertible.
The two scaled monic irreducible labels are still distinct and
thus have disjoint root sets. Their faithful character images are
disjoint as well. If λ is any eigenvalue of R(σ), each polynomial
kills R(σ), so λ lies in both root sets of the FULL polynomials.
It must then be an M-th root of unity: if it were not, it
would have to belong to both disjoint primitive parts. Hence
    det(R(σ))^M = product over eigenvalues λ of λ^M = 1.
No diagonalizability of R(σ) is needed for this argument.

On the other hand, Attached.isLabelledAt supplies the *actual*
determinant of R(σ) as the product of the roots of its first
full label polynomial, with multiplicities. Its primitive
factor contributes the faithful character image of a generator of
the cyclic group of order q-1 (by section 1), and the extra factors
have M-th powers 1. Therefore det(R(σ))^M≠1 since 0<M<q-1.
This contradiction proves subsingleton. In particular it is
essential to retain the local determinant equality, not merely
annihilation by two polynomials; otherwise the contradiction
does not follow. This proves the algebraic mechanism after the
native parahoric/attachment compatibility. That compatibility
is retained, not inferred from the abstract finite-field argument.

The actual two instantiations are:
- W_j: auxLift_injective at twist one, chosenGLRep intertwining,
  one determinant-character block, ψ from the native ω powers.
- Y_0: iotaAtLevel_injective, principalRep intertwining,
  distinct determinant characters from ω powers; injectivity
  is the source omega_zpow_ne_one on their differences.
Both use the original M-torsion guards. These supply HasRigidLabels
at the native trace transfer. The common spectral projector trace
argument of peer c7cde9ac then supplies the finite same-packet
catalogue in FitTwistsExist. The trace formula and the actual
lift/intertwining statements are still genuine suppliers.

## 3. Exact local inertia determinant budget and conjugate twist
New/Selmer/LabelledColumns.lean 3f0ed49bf089805f3269d5161130526dfcf1a038,
exists_inertia_eigenvalues, IsLabelledColumn.isRow,
normalisedRep_quadratic_on_inertia;
New/Selmer/LevelPlacesChosen.lean d0bc51f21f85ddd396d3c6b33d045206a4a30565;
New/Selmer/AptTuples.lean 49699d4679d83a7bc7714afc53b7e2757ae4adf3.
At v above g_i away from ℓ, actual label roots for the untwisted
row on the chosen tame generator are not 1, and each is killed
by X^(g_i^d-1)-1 for some 1≤d≤D.r. The same polynomial kills
the inverse conjugate element at the conjugate place by the
native local conjugation clauses. All inertia elements, not just
the generator, are killed by the uniform exponent
N_v=g_i^(r!)-1. That exponent gives the finite inertia clause,
where the native valuation of the rational level prime is 1;
the source additionally checks the required exponent valuation
guard using its chosen-place construction. Retain that exact
guard, rather than inferring ℓ∤(g_i^(r!)-1) from ℓ≠g_i.

For an eigenvalue λ≠1 with λ^J=1, J=g_i^d-1>0,
the factorization of X^J-1 in characteristic zero gives
    J = product_{ζ^J=1, ζ≠1}(1-ζ).
All factors have ℓ-adic norm ≤1 because roots of unity are units.
Hence |1-λ|_ℓ≥|J|_ℓ, so v_ℓ(λ-1)≤v_ℓ(J).
The native chosenGroupOrder divisibility for d≤D.r D.t
bounds this by crudeUnit. Sum with multiplicities and use the
exact determinant product before the inequality:
    v_ℓ(det(R(σ)-I))=Σ_λ v_ℓ(λ-1)≤r crudeUnit_ℓ.
The same bound holds for inverse-conjugate σ, by the actual
conjugation compatibility. This supplies the determinant clause
of IsRow.inertia_above_g and hence the two external inertia
costs in the balanced-row estimate. It is not a bound at ℓ itself.
For the independent scalar-order clause of IsRow the native
large-order argument in isRow is still retained; the separation
in section 1 alone does not prove that clause.

For a column at a new auxiliary split place w (w∤ℓ), the
native HasParahoricType has two determinant-character blocks
1 and ψ_w^(-1); Attached.isLabelledAt after normalization gives
the annihilating polynomial (X-1)(X-a), a=ϑ.invAvatar(s),
on inertia. Multiplicities of the two characters do not require
a polynomial of larger degree: the local-global compatibility
used by normalisedRep_quadratic_on_inertia supplies exactly
this two-factor polynomial, not merely a characteristic
polynomial with these roots. At the conjugate place use the
inverse-conjugate element and the anticyclotomic identity
a(s^(-c))=a(s). The normalized cyclotomic factor is 1 on
inertia away from ℓ. Thus the actual equation is
    (u(s)-a(s)I)(u(s)-I)=0
throughout inertia above Q∪Qbar, as needed by the Ribet branch.
No semisimplicity assumption on a general torsion lattice.
The native local-global annihilation supplier itself remains
a dependency (not a consequence of the eigenvalue list).

## 4. Exact native cyclotomic string divisor (DenominatorBound caller)
New/Selmer/DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534,
exists_cycChar_pow_sub_one_dvd.
For EVERY integer 0<a<D.t the same γ must work. If ℓ>h₂²,
choose the generator of F_ℓ^× via inertia in the cyclotomic
extension of Q. The native conductor size guard and inclusion
E⊆Q(μ_cond) ensure that this inertia element fixes E, since
the conductor is prime to ℓ. The residue cyclotomic value has
order ℓ-1>D.t-1 by the original Data size inequalities. Thus
each cyc(γ)^a-1 is a unit of Z_ℓ; h=0 works simultaneously.
For ℓ≤h₂², use one chosen place over g_i≠ℓ, with its Frobenius γ
and cyclotomic value g_i (native convention). The integers
g_i^a-1 divide chosenGroupOrder by
g_pow_sub_one_dvd_chosenGroupOrder, because 1≤a≤D.r D.t.
Consequently each difference divides ℓ^h in Z_ℓ with
h=v_ℓ(chosenGroupOrder). This supplies the native existential
γ and uniform exponent h, with h=0 or ℓ≤h₂², before the
prime-triangle selection in denominatorLe_rowBudget.
It is not a new assumption of a common generator for all primes:
γ and h depend on ℓ. The triangle selection itself is separate
and the latest peer fce4be62 addresses that guard.

## Verification and dependency ledger
Source bodies and their blob identifiers retrieved at compact pin
above; RUN51 and peer c7cde9ac checked for overlap. Current original
source-role path retained:
C -> exists_isFitFamily -> exists_hasRow_auxPair ->
exists_row_for_all_twists -> IsLabelledColumn.isRow ->
frobenius_conj_pow_injOn / primitive scaling / local inertia bounds.
C -> exists_isFitFamily -> goodForms_inf_eigenPart_eq_bot ->
trace_heckeOnGood_eq -> HasRigidLabels -> occurringLabels_subsingleton
-> Attached.isLabelledAt (annihilation AND determinant).
C -> denominatorLe_rowBudget -> exists_cycChar_pow_sub_one_dvd;
and -> ribet_columns -> local quadratic relation.
Human replacement view: same orbit-period and primitive-norm
hypotheses, now derived by sections 1–2 from exact finite-field
arithmetic. No dependency deletion from original kernel graph.
Remaining native local-global (including base-change induction),
lift comparison and trace formula, primitive scalar-inertia
order guard, and crystalline exponent suppliers remain explicit.
No final RH theorem imported or used, no URT premise.
Local command -v lean and lake returned no paths.
Actual CI 45803534769: state
compute/rh-compact-primitives-replay-20261126/status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f reports error; partial
targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804
records 3 native TiltingLemma and 3 Filling.Moments declarations
with propext, Classical.choice, Quot.sound; A build timeout 2700.11s.
Not a PASS for this file. No new native execution or axiom
closure claimed. Prior graphs and CI evidence unchanged.
The following candidate certificate tests the finite-field
arithmetic identity and determinant power product; axioms probes
target the actual native declarations. No competing replay.

RESUME HERE: integrate section 1 with RUN51 integral span and
section 2 with peer packet transfer. Audit actual tame generator
order and exponent valuation guard (do not assume g^r!-1 is
prime to ℓ); inspect local-global base-change induction and
remaining crystalline exponent cases at their exact caller.
HANDOFF TO C mathematics, integration/editor, audit, kernel.
-/

namespace CompactGaloisRun54

/-- The exact factor that prevents shortening a 3-power Frobenius orbit. -/
theorem orbit_ratio_factor (s : ℕ) :
    (9*s+1)^2 + (9*s+1)+1 = 3*(27*s^2+9*s+1) := by ring

theorem orbit_ratio_not_nine_dvd (s : ℕ) :
    ¬ 9 ∣ ((9*s+1)^2 + (9*s+1)+1) := by
  rw [orbit_ratio_factor]
  intro h
  obtain ⟨k, hk⟩ := h
  omega

/-- Exact determinant power cancellation, before any norm or bound. -/
theorem list_prod_pow_one {G : Type*} [CommMonoid G]
    (M : ℕ) (l : List G) (h : ∀ x ∈ l, x^M = 1) :
    l.prod^M = 1 := by
  induction l with
  | nil => simp
  | cons a l ih =>
    rw [List.prod_cons, mul_pow, h a (by simp),
      ih (fun x hx => h x (by simp [hx])), one_mul]

#print axioms orbit_ratio_factor
#print axioms orbit_ratio_not_nine_dvd
#print axioms list_prod_pow_one
end CompactGaloisRun54

#print axioms frobenius_conj_pow_injOn
#print axioms IsPrimitiveLabel.scaleRoots
#print axioms IsPrimitiveLabel.isPrimitiveRoot_prod_roots
#print axioms Data.occurringLabels_subsingleton
#print axioms Data.hasRigidLabels_spaceW
#print axioms Data.hasRigidLabels_spaceY_zero
#print axioms IsLabelledColumn.isRow
#print axioms normalisedRep_quadratic_on_inertia
#print axioms exists_cycChar_pow_sub_one_dvd
