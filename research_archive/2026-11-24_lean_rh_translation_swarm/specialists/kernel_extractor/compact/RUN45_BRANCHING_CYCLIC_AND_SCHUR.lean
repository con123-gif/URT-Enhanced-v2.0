import Lib.GLn.Branching.Branching
import Mathlib.Tactic

/-!
# RUN45 — finish the cyclic, density and coefficient suppliers for branching
2026-11-27. HUMAN SOURCE-MATCHED / alternate elementary argument; prepared
Lean probes only, not native replay. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Pin lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Latest mission blob
9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first); prior RUN44
9f17e4416d, integration RUN72 b0fe2a3e, editor RUN71 600d03e0.
Branching.lean on upstream main returned the same blob as the pin; no
claim that every upstream file is unchanged.

Source anchors (grh-compact/src):
* Lib/GLn/Branching/Branching.lean 669d2de08c3fa16386120153629ca6cde94e5dde:
  ext_schur_weylEval, scalar_of_commute_schur, exists_cyclic_lower_triangular,
  exists_int_branching_of_weylKernel, exists_branching_matrix (230–276).
* Lib/GLn/Branching/BranchingVector.lean aafa94d0795e07118c3133817e4afa4ec795c93b:
  zariski_dense_unitary, Cartan and hook suppliers.
* Lib/GLn/SchurModule/SchurMatrix.lean 8c91b4b7888c99e604df5fa2dd38a130b4fea7bb:
  linearIndependent_nablaBasis_mul_detPow, coord_mem_of_coeff_mem,
  schur_diagonal.
* Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f:
  map_nablaBasis_eq_mul_weylEval, sum_tableauWeight_le.
* Lib/GLn/SchurModule/Gram.lean 8fe5056636a40d11e2d287f94fbd8ae2cfc03c57:
  weylGram_mul_schur, fockPairing_toPoly_nablaBasis, toPoly_injective.
* Lib/General/LinearAlgebra/SubmersionZero.lean
  2fc9dfa942f88c16144aebeacb0590ff928eff8b: eq_zero_of_submersion,
  used by native density and cyclic argument, not required by alternatives below.

## 1. Integral coordinate membership, including torsion
For any commutative R and additive subgroup A, set M=R/A as an abelian
group, NOT a quotient ring. Let b_j be the integer standard minor
polynomials multiplied by the fixed determinant powers. Native standard
basis theorem gives independence over EVERY commutative coefficient ring.
Suppose f=sum_j x_j b_j and each monomial coefficient is in A. Form the
commutative square-zero extension S=Z⊕M, with
(a,m)(b,n)=(ab,an+bm). Send x_j to (0,[x_j]). Each polynomial coefficient
of sum_j (0,[x_j]) b_j over S vanishes, since b_j has integer coefficients
and the corresponding coefficient of f lies in A. By independence over
S, all (0,[x_j])=0. Thus x_j∈A. This is the exact native
coord_mem_of_coeff_mem (its TrivSqZeroExt realization), not ordinary
linear independence over Q. It applies to A=image of the integer
polynomial map L in RUN44, and requires no saturation or torsion-free
assumption. This completes the retained coordinate-recovery step;
standard basis and determinant regularity remain explicit foundations.

## 2. Explicit cyclic lower-triangular orbit, no analytic submersion
Use the native order E=newRowOrder ι top, added row last, and
u=[I 0; ones 1]. The evaluation v0 at permArray E is fixed up to scalar
by upper triangular matrices in that order, from the leading-minor
identity (or the native rowSubst_weylKernel_permArray and toPoly
injectivity). The cyclic candidate is v=S(u)v0.

For a generic invertible matrix X, use ordinary Gaussian elimination
without row pivoting: X=L R, L unit lower triangular, R upper triangular.
This holds on the open set with nonzero leading principal minors.
Write L=[L0 0; l 1], R=[R0 r;0 c]. On the further open set l_i≠0 for all
ordinary rows, D=diag(l_i). Direct multiplication gives

 X = diag(L0 D^{-1},1) u [D R0  D r; 0 c].

The first ordinary block is invertible lower triangular; the last
factor is upper triangular. The open set is nonempty since X=u has
L=u, R=I, l_i=1, and all leading principal minors 1. It contains a
complex open neighbourhood of u (Gaussian elimination entries are
rational with nonzero denominators there). Rank zero ordinary block
gives empty D and the trivial one-by-one assertion. For products over
the finite set of places use this factorization independently at each
place, on the product open set.

If a row functional annihilates S(diag(g,1))v for all lower triangular
g as in the native lemma, it annihilates S(X)v0 throughout that open
set, because the upper triangular last factor acts on v0 by a scalar.
The expression is a polynomial in entries of X, so it is identically
zero, by the elementary polynomial identity principle (successive
one-variable identities on a product of open disks). Native
ext_schur_weylEval then implies the row functional is zero.
This gives the same cyclic witness and quantifiers as
exists_cyclic_lower_triangular. No assumption that all matrices admit
the factorization, and no nonvanishing restriction on the original
annihilation test is introduced. In fact invertible lower g suffice
for this argument. This removes the analytic inverse-function step
from this local human derivation only.

## 3. Unitary Zariski density by rational Cayley chart
For each place choose a real basis of Hermitian matrices (diagonal
units, Eij+Eji, i(Eij-Eji)). It is also a complex basis of all matrices.
For real parameters H is Hermitian and
U=(I+iH)(I-iH)^{-1} is unitary: the denominators are invertible by
real spectrum, and the two factors commute. If a polynomial P
vanishes on all unitary tuples, substitute these rational matrices
and clear the denominators with a product of determinant powers
at least its degree. The resulting polynomial in the real parameters
vanishes for all real values, hence is identically zero over C by
successive one-variable polynomial identities. For complex parameters
with invertible denominator this gives P(U)=0. The chart covers
the open set det(U+I)≠0, since H=(U-I)(U+I)^{-1}/i and
I-iH=2(U+I)^{-1}. It follows that P is identically zero. This matches
the native zariski_dense_unitary, for any finite product and rank,
without the exponential or submersion machinery. No assertion about
density in the ordinary topology.

## 4. Scalar commutant and actual branching consumer
Suppose T commutes with S(g) on the product of unitaries. Section 3
extends each polynomial commutator entry to all matrices. Let v0 be
the evaluation vector at the ordinary permutation array. For diagonal
g with a single entry 2, S(g)v0=2^lambda_a v0 and
S(g)Tv0=2^lambda_a Tv0. In the standard basis S(g) is diagonal with
eigenvalues 2^(tableau row weight). Therefore nonzero coordinates of
Tv0 require the exact extremal row weights at every place. Native
map_nablaBasis_eq_mul_weylEval, applied to the linear form having
these basis coordinates, gives Tv0=c v0. (Equivalently, prefix row
weight saturation forces every column to use the first h rows.)
Commuting with the general matrix orbit gives T S(g)v0=c S(g)v0;
ext_schur_weylEval implies T=cI. No appeal to an unproved irreducibility
of this representation is needed.

At exists_branching_matrix lines 242–276 take precisely the integer B
from RUN44, G and G0 the positive Gram matrices, C=G^{-1}B*G0
(B real integral, so B*=B^T). The intertwining relation with its
determinant factor yields C intertwining the reverse unitary action
with the inverse phase. Thus BC commutes with the target unitary
action and is scalar, by the preceding proof. Since C is Gram adjoint,
BC is positive and scalar lambda=||C ev_identity||_G^2
(the target evaluation has norm 1). Hence ||B||^2=lambda. RUN43/44
supply the quantitative bound via the branch-vector polynomial with
the SAME B and hook H. The same cyclic vector from section 2, plus
the target evaluation orbit and Gram transpose identity, supplies
injectivity of T -> x^T T v on polynomial intertwiners as in RUN44;
section 3 extends unitary intertwiners after cancelling determinant
twists on invertible g. B is nonzero by the branch polynomial and
H>0, so the unique scalar comparison is valid. This completes the
local human supplier expansion of branching existence, norm and
multiplicity-one under the native standard basis and Gram foundations.
It is not an unconditional proof of short_forms or star_inequality.

## Evidence and handoff
Actual local command -v lean/lake/elan returned no executable.
Exact symbolic block identity checked by SymPy for n=1,2,3,4:
construct L0 unit lower symbolic, R0 upper symbolic, l independent
nonzero symbols, r vector and c scalar; verify entrywise
expand(diag(L0*diag(l)^(-1),1)*u*b-L*R)=0 where b as in section 2.
All four checks succeeded. The general proof is the displayed
block multiplication, not the finite checks.
CI artifact reread: cathedral-research-state
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804; six named B/C checks
reported only propext, Classical.choice, Quot.sound, module_1_build
(A) return 124 after 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. No new native PASS or axiom result. Old-pin
rh_scan/prune/reduce/auto/frontier not run on compact source.
The probes below are prepared for the shared compact runner, not
a registration or assertion of a queued job.

Original graph: star -> short_forms -> branching restriction ->
exists_branching_matrix -> cyclic_lower_triangular / scalar_of_commute_schur /
exists_int_branching_of_weylKernel -> coord_mem_of_coeff_mem; cyclic and
density -> eq_zero_of_submersion. Human reduced local graph substitutes
Gaussian elimination + polynomial identity, Cayley + polynomial identity,
square-zero module extension + universal standard basis. Native graph
and axiom ledger unchanged, other consumers of submersion unchanged.
Keep original graph, all pending native nodes and all standard-basis,
Gram, polynomial covariance and local marked-gauge suppliers. Context
cache keys compact pin, finite places, rank and actual E, gamma/kappa',
same B, same determinant twist, coefficient ring/additive subgroup.
No imported RH or URT premise.

RESUME HERE: audit standard basis universal independence and the
Gram/Fischer normalization if needed for exact callers; otherwise
take the actual marked local Hecke stage and Fourier level-N index
as requested in integration RUN72. Do not repeat branching reductions.
Run compact native probes when module cache is available and inspect
actual axiom output. HANDOFF TO integration/editor, independent audit,
theta, shared native runner. Central compact inequality and full human
proof still conditional.
-/

open PolyRep

namespace KernelRun45
-- Scalar entry certificate for the bottom-left block of the LU identity.
theorem cancel_diag_entry {K : Type*} [Field K] (l a : K)
    (hl : l ≠ 0) : (a / l) * l = a := by
  field_simp

end KernelRun45

#check exists_cyclic_lower_triangular
#check zariski_dense_unitary
#check scalar_of_commute_schur
#check ext_schur_weylEval
#check coord_mem_of_coeff_mem
#check linearIndependent_nablaBasis_mul_detPow
#check exists_branching_matrix
#print axioms exists_cyclic_lower_triangular
#print axioms zariski_dense_unitary
#print axioms scalar_of_commute_schur
#print axioms coord_mem_of_coeff_mem
#print axioms exists_branching_matrix
#print axioms KernelRun45.cancel_diag_entry
