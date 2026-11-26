import New.Selmer.TwistTheorem

/-!
# RUN28 compact kernel lane — reconstruct the three polynomial/tie suppliers (26 Nov 2026)
Status: HUMAN SOURCE-MATCHED; local algebra certificate PREPARED, NOT compiled.
Attribution: Levent Alpöge, Luke Sernau, Claude and collaborators, per upstream.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 23f64d503b7d64bb13b9667156b499021038d742. Latest manuscript integration
160380feb7c1bedc08ed46b66578c9b6fa05208c, editor b67157a1, math d93adfe1,
Galois a144d8de, audit bf254a7be. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE
and EXPANSION_15_LANES. Manuscript §6h corrects the earlier false factorization
and supplies uniform pencil cap; do not redo those. It explicitly leaves the
sharp fitting polynomial and tie-loss supplier as named inputs.

## Exact native graph (source roles, NOT elaborated graph)
Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c:
  exists_corepresenting_coords -> LinePointPowers.exists_sharp_fitting_poly.
LinePointPowers.lean 654567bac00341a29102ee3b83266bda10ab22a9:
  exists_sharp_fitting_poly -> TwistTheorem.exists_anticyclotomic_twist (G,F).
  dvd_one_add_mul_pow_sub_one -> TiltingLemma.IsPencil.length_le_of_drop_ties
  and the second root selection in TwistTheorem.
TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470:
  IsPencil.char_tame_gen -> IsPencil.pointChar_idOrConjInv ->
  IsPencil.length_le_of_drop_ties -> TwistTheorem.exists_anticyclotomic_twist
  (first selection at helper, second at nonhelper primes).
TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754:
  exists_isPencil -> exists_anticyclotomic_twist -> downstream common row twist
  -> denominatorLe_rowBudget -> exists_isFitFamily -> C in LongForms.
No change to the original or reduced graph, no root theorem import. This adds
human derivations at existing nodes; not evidence for deletion of any native edge.

## 1. Sharp Fitting polynomial, with base change (LinePointPowers)
Fix the same prime power m=ell^M, representation rho modulo m, finite place
set S, local relations L, finite index set sigma and locally constant
characters h_j into Z/q, with all native continuity guards. Let P=O[X_j].
Apply exists_corepresenting_coords to the polynomial-valued twist and
polynomial-mapped relations. A common open subgroup W acts trivially on
every specialization modulo m: use the intersection of the given congruence
kernel of rho and all character kernels. The coordinate supplier gives one
finite coordinate set of size r and a P-submodule R <= P^r containing m P^r,
with evaluation bijecting Selmer cocycles to vectors in (O'/(m))^r annihilated
by every specialized relation. Neither the coordinate set nor R depends on
the later ring or tuple. This is the exact universal role of K in the native proof.

At the fixed base point y0 over the characteristic-zero DVR O, let R0 be the
image span of R under evaluation. Since m != 0 and m O^r <= R0, R0 is a
full-rank free O-lattice. Choose an O-basis of R0 and polynomial relation
lifts u_1,...,u_r in R (constant coefficients lift all O-linear combinations).
Take the rows of U to be these lifts and F=det U, with empty determinant 1
if r=0. Smith normal form at y0 gives invariant factors d_1,...,d_r. Each
d_i divides m, because the lattice contains m O^r. Thus the annihilator
of R0 in (O/(m))^r has length sum_i v(d_i)=v(det U(y0)).
This is actual equality, so in particular the required first inequality
v(F(y0)) <= length Selmer(y0). No arbitrary choice of a single input row.

For ANY DVR O', ring map e:O->O' and tuple y in O', specialized U consists
of valid relations, so Selmer(y) injects into the kernel of U_e(y) modulo m.
If det is nonzero and e(m) is nonzero, Smith normal form gives length at most
sum_i min(v'(d_i'),v'(e(m))) <= v'(det U_e(y)).
If e(m)=0, a nonzero determinant is injective on the free O'-module, so the
kernel is zero. If determinant is zero the bound by infinity is automatic.
Hence length Selmer(y) <= v'(eval2 e y F), with no assumption of equality
away from y0 and no new choice of F after base change.
This proves the mathematical determinant argument of exists_sharp_fitting_poly
from its native coordinate supplier and standard DVR diagonalization. It
matches exists_matrix_addVal_det_le_length and length_ker_le_addVal_det;
their native declarations and axioms remain in the graph.

Actual consumer: TwistTheorem chooses G with the old nonhelper tie relations
at the base point 1, and F with the untied relations at the later line point.
These are two different matrices, not a claim that the same determinant
works for both systems. Their universal quantifiers allow the SAME final
root tuple in every row and coefficient ring. The helper and nonhelper
valuation bounds in manuscript §6h then apply exactly as stated.

## 2. Polynomial line points satisfy the required congruence
For u^(ell^k)=1, let y=1+t(u-1) in any commutative ring.
Modulo ell, Frobenius gives (u-1)^(ell^k)=u^(ell^k)-1=0, so
(y-1)^(ell^k)=0 and y^(ell^k)=1 modulo ell.
If z=1 modulo ell^j for j>=1, expand z^ell=(1+ell^j a)^ell:
the first nonconstant term and all intermediate terms are divisible by
ell^(j+1); the last is too since j ell >= j+1. Iterating N-k times yields
y^(ell^N)=1 modulo ell^(N-k+1), hence modulo ell^M when k+M<=N.
This includes k=0 and M=0; no field or valuation assumption is required.
The native first output is ell | (y-1)^(ell^k), and its second is
ell^M | y^(ell^N)-1. The tie-loss lemma retains its stronger k+2M<=N,
needed for the native tame-affine commutation, not just the character definition.
The same line points at the helper and nonhelper primes feed both determinant
and root-of-unity steps.

## 3. Exact local tie-defect cancellation and aggregate length
Keep all hypotheses of IsPencil.length_le_of_drop_ties, including rho
unramified modulo ell^M off S0, I subset J, u=1 if the helper P0 is in I,
hF matching the representative w at both conjugate sides modulo ell^M,
and the residue-power guard k+2M<=N. Write B=O'/(ell^M), fix one dropped
prime v in I and one conjugate side. Let a=c(gamma_v), b=c(phi_v);
G and F are the twisted inertia and Frobenius actions on B^n.
The native tame_affineAction theorem gives commuting affine actions.
Evaluating at zero gives exactly
  (F-1)a=(G-1)b.
Do NOT assume Frobenius and inertia commute as Galois elements.

Off S0 the untwisted inertia acts trivially. By pointChar_idOrConjInv
the twisted inertia multiplier is y_v, and the nonhelper Frobenius multiplier
is u. With t the actual slope in O' (mapped to B):
* Nonhelper with t=0: y_v=1, so G-1=0=t(F-1).
* Nonhelper with t!=0: the native pencil hypothesis applies if the original
  slope is nonzero (if it was zero, its image is zero). Thus rho(phi_v)=1
  modulo ell^M, F=u, and G-1=t(u-1)=t(F-1).
* Helper in I: u=1, so G=1. Its slope need not vanish as a general IsPencil
  field! If it is nonzero, the pencil Frobenius condition implies rho(phi)=1
  and therefore F=1 because all point coordinates equal 1. If slope zero,
  t(F-1)=0 anyway. Thus the same identity holds. This uses h0, not an
  unstated requirement on helper slope.
Consequently the defect d=a-t b satisfies
  (F-1)d = (G-1)b-t(F-1)b = 0.
By hF and the point-character law F=u*rho(w) modulo ell^M (at the helper
all point coordinates are 1). The defect lies in ker(u*rho(w)-1 mod ell^M).
The aggregate defect map on the untied Selmer module has kernel exactly
the tied module, since the tieRelations are precisely these two-side
linear conditions. Its image injects into the direct sum of all such
matrix kernels. Additivity of finite lengths (or relative length in the
general extended-natural statement) and Smith normal form bound the loss by
  length(untied) <= length(tied)+sum_(v in I, side) v'(det(u*rho(w)-1)).
For det zero the extended bound is automatic. No norm or independent
prime choice precedes the cancellation. This reconstructs the mathematical
content of the native lemma from the tame-affine commutation input.
The latter's local field proof, the uniform coordinate supplier's
Galois finiteness argument, and the unseen-class reciprocity/isotropic
cardinality theorem remain explicit dependencies, not silently discharged.

Actual callers: in the first root selection I={P0}, u=1 and w=z on the
two conjugate sides via the neighbourhood W, producing the two original
determinant losses already included in B_i. In the second, I=J.erase P0,
w is the actual Frobenius on its side, and the auxiliary characteristic
polynomial evaluations pay each determinant loss at most delta in normalized
valuation. The bound is 2|J|delta, not 2n_i|J|delta: a determinant already
contains the n_i eigenvalue contributions. The value-family budget remains
8|J|delta; the two root selections add 2delta. Thus the common eta budget
from §6h is preserved with no new premise.

## Verification and handoff
Actual retrieved source blobs above, plus manuscript and latest peer commits,
reviewed. No execution of Lean: local command -v lean/lake/elan returned
nothing; CPU cgroup quota 4, memory.max 4294967296 bytes. Compact native
CI run 45781154005 reports outer success but compute/rh-compact-union-graph-20261126/
status.json explicitly says RESOURCE_BLOCKED before compilation. Do not
relabel that success as native PASS. Shared native runner only; no competing
jobs, no protected workflow edits. This file contains an executable abstract
local defect equality certificate; no synthetic arithmetic or prime test.
Axiom queries below are prepared, not obtained. Original old-pin evidence and
pending compact graph retained. No claim of new unconditional RH proof.

RESUME HERE: integration/editor can incorporate §§1–3 into manuscript §6h,
retaining the named local tame-affine and coordinate finiteness inputs.
Galois/math: reconstruct card_le_torsion_of_isotropic and the actual
length_le_of_unseen_class reciprocity supplier with common zH coset.
Kernel: replay this local algebra plus all queued compact peer certificates
once an adequately provisioned pinned runner is available; record actual
per-root axioms and graph, not workflow wrapper status.
HANDOFF TO: integration, editor, math, Galois, audit and kernel.
-/

namespace CompactKernelRun28

/-- The exact additive cancellation at the native tie-defect consumer.
The hypotheses are the affine commutation identity and scalar-action
identity after the source's modulo-ell^M and pencil guards. -/
theorem tie_defect_fixed {R V : Type*} [CommRing R] [AddCommGroup V]
    [Module R V] (F G : V →ₗ[R] V) (a b : V) (t : R)
    (hcomm : F a - a = G b - b)
    (hscalar : G b - b = t • (F b - b)) :
    F (a - t • b) = a - t • b := by
  apply sub_eq_zero.mp
  calc
    F (a - t • b) - (a - t • b) =
        (F a - a) - t • (F b - b) := by
          rw [map_sub, map_smul, smul_sub]
          abel
    _ = 0 := by rw [hcomm, hscalar, sub_self]

end CompactKernelRun28

#check exists_corepresenting_coords
#check exists_sharp_fitting_poly
#check dvd_one_add_mul_pow_sub_one
#check IsPencil.length_le_of_drop_ties
#check exists_anticyclotomic_twist
#print axioms CompactKernelRun28.tie_defect_fixed
#print axioms exists_sharp_fitting_poly
#print axioms dvd_one_add_mul_pow_sub_one
#print axioms IsPencil.length_le_of_drop_ties
#print axioms exists_anticyclotomic_twist
