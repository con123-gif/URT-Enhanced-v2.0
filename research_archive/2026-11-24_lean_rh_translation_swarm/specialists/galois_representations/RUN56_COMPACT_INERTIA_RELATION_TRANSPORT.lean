import New.Selmer.RibetElement
import New.Selmer.TwistForRows
import New.Selmer.BaseLevelOfLabel

/-!
RUN56 — integral class transport and exact inertia root cancellation.
2026-11-26. Lane 5, Galois representations. Source-matched human reconstruction;
Lean probe prepared, NOT executed. No new kernel-closed obligation.

Compact source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb.
Prior lane RUN55 02cf386921d1729039dc11fc489cd5539edce554.
Reuse, without redoing, lead c423f7ffc801dd991c5a0c01e60be57401b04b4e
(tensor polynomial and local payment) and audit 129d788fbbd30b331faaf99d14e4429e622c101b
(tame Kisin descent, common correction). Balanced-row audit d064b084 retained.
HUMAN_PROOF_COMPACT.md read at blob 57e7f36aa8032da2dd16f54a539e23d992a7cf96.

Actual source anchors (under grh-compact/src):
* New/Selmer/RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444
  inClass_of_isLatticeIn; relLength_obeyingCocycles_le
* Lib/PadicHodge/Crystalline/GoodCriterion.lean 8d7b68b9cde0290ade42ef5a6d12aaa8091db6d7
  IsFiniteTypeAt.aeval_eq_zero_of_roots
* Lib/PadicHodge/Crystalline/RegularityFrobenius.lean 2cf7f7ee07b73f475818198db19ee7f65aec7a06
  IsPotCrys.eventually_linearFrob_eq_one; IsKilledBy.of_jointly_injective
* Lib/PadicHodge/Crystalline/PairingDefs.lean f977b856d5aa41125d21f6629a5f144d2da094d4
  InClass.of_jointly_injective, InClass.dual
* New/Selmer/LabelledColumns.lean 3f0ed49bf089805f3269d5161130526dfcf1a038
  normalisedRep_quadratic_on_inertia
* New/Selmer/BaseLevelOfLabel.lean 3b0eff13f173100f929210c4004753e9f091d8df
  exists_baseLevel, actual call to normalisedRep_quadratic_on_inertia
* New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d
  exists_mFoldTwist_selmerLengthLe, final relation inclusion
* New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df
  crysRels, ZfAt, coeffEmb
* New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18
  sum_blockLoss_le (actual calls at lines 94, 95, 99, 108), ribet_columns
* New/Selmer/DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534
  caller of ribet_columns (line 130)
* New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14
  actual common twist call (line 35).

1. Exact finite-order root cancellation, before valuation estimates.

Let A be an operator over a characteristic-zero field (or after passing
to its algebraic closure), with A^N=1 for N>=1 and P(A)=0. Its minimal
polynomial m_A divides gcd(P,X^N-1). Since X^N-1 has no repeated roots,
m_A is squarefree. If Q vanishes at all roots of P, m_A divides Q,
so Q(A)=0. Thus repeated roots need not be carried into the local
annihilating polynomial. The same argument works after scalar
extension and descends along an injective scalar map. Evaluation of
polynomial coefficients must commute with A. No assertion that an
arbitrary positive-degree Weil operator is finite order.

At a place away from ell use the open inertia kernel of IsFiniteTypeAt:
positive powers of s in inertia recur in the kernel, giving exact
finite order of R(s). At a place above ell use the different operator
A=linearFrob R s 0. The native eventual identity on nearOne and
linearFrob_pow at degree zero give a positive power with A^N=1.
The proof needs an actual identity in a neighbourhood, not mere
convergence of powers. This is the same finite-order argument in
GoodCriterion and RowBalanced, with the appropriate operator.

Negative control: J=I+E12 over Q_ell. (J-I)^2=0, but J-I != 0.
For every k, J^(ell^k)=I+ell^k E12 tends to I without becoming I.
So the root-only criterion with P=(X-1)^2 and Q=X-1 fails without
the exact finite-order premise. Do not weaken it to convergence.

2. Common local class of actual integral lattices.

Fix w|ell, the given labelled column family R_x, and an integral
lattice u_x in each R_x. The IsLatticeIn conjugacy matrix P_x defines
the injective map F_x=P_x composed with coefficient inclusion.
The matrix identity F_x u_x(g)=R_x(g) F_x is exact. Base extension
is an isomorphism, with transported basis; hence the Hodge-Tate jump
multiset at every coeffEmb O g is the original J_x(g), not just
an upper bound. Surjectivity of coeffEmb and the chosen right inverse
identify the jump sets without selecting a different embedding.

At each w fix the SAME class predicate K(s,Q): w above g and for
every column R' in the family there exists P_{R',s} killing inertia
such that Q vanishes at all roots of P_{R',s}. To prove the Q condition
for u_x specialize this universal premise to R_x (membership is
essential), apply step 1 to its degree-zero operator, then transport
the zero operator through the equivariant injective map using
IsKilledBy.of_jointly_injective. Admissibility descends through the
same map; retain the native local crystalline/potentially crystalline
hypotheses and the correct F for the chosen place. This recovers
inClass_of_isLatticeIn with its original quantifiers, not a separate
Q or class for each lattice.

In sum_blockLoss_le use the given block decomposition of the selected
column u_pi and the actual block inclusions. Equivariance and injection
are immediate from block diagonality and the supplied reindexing.
InClass.of_jointly_injective then places each block in the common
class, which is what the cup-orthogonal defect comparison requires.
The row block's local identification with T0 and rank-one cyclotomic
jumps are separate retained hypotheses. No change to 4*r*f*loss.

3. Auxiliary quadratic inertia with both conjugate places.

At w in the auxiliary set Q, disjoint from the bad places, the native
parahoric type has the two determinant characters 1 and psi_w^{-1}.
The apt-tuple equality and triviality of omega off the chosen places
identify the second with the tame twist character. Attached.isLabelledAt,
the faithful tame exponent and isLabelledAt_avatar identify the
allowed roots on inertia as {1,a(s)}, a=theta.invAvatar. The native
normalising chiOneInv is trivial there (chiOneInv_spec at exponent 0).
Step 1 removes all multiplicities, yielding the annihilator
(u(s)-a(s) I)(u(s)-I)=0, even if the two roots coincide.
At the conjugate place use the actual local_clauses_of_conjPlace
with s mapped to conjGal(s^{-1}); the anticyclotomic avatar has
a(conjGal(s^{-1}))=a(s), from avatar_conjGal_mul. Thus the polynomial
has the SAME roots, not inverse roots at that argument. Off ell the
cyclotomic character on inertia is trivial. Preserve the labelled
attachment and local clauses; this is not an independent proof of
automorphic Galois attachment. The resulting statement is exactly
the second component of exists_baseLevel, used by ribet_columns
through DenominatorBound. No distinct-root hypothesis is introduced.

4. Transport of crystalline relations over the coefficient extension.

Fix the same O subset O', base-extended u, and the chosen auxiliary
twist psi' with trivial restriction to each decomposition group
above ell (IsAuxTwist.eq_one_of_mem_decompGroup in TwistForRows).
O' is finite torsion-free, hence finite free over the DVR O.
For any O-linear functional l:O'->O, componentwise application to
an O'-valued crystalline cocycle z gives an old crystalline cocycle:
the restriction of the twist is 1, so l intertwines the actions;
the crystalline mapping property is crysCocycles.map.
For any old finite-support relation f in relationsOn ZfAt, therefore

  l(sum_g f(g) z(g)) = sum_g f(g) l(z(g)) = 0.

Coordinate functionals for an O-basis of O' separate points.
Consequently sum_g f(g) z(g)=0, componentwise. Hence each mapped
old relation is an actual new relation, with the SAME finite support.
Only this one inclusion is needed: imposing all new relations gives
a submodule of the module imposing mapped old relations, so length
monotonicity transfers the existing SelmerLengthLe estimate.
Do not reverse the inclusion, assume equality of crystalline modules,
or presume surjectivity of reduction on crystalline cocycles.
The gamma point relation and inertia equations are separately preserved
by the actual base change. This justifies the last step of
exists_mFoldTwist_selmerLengthLe for all selected rows and powers.

Original source-role edges (not an elaborated kernel graph):
  FitTwistsExist -> exists_mFoldTwist_selmerLengthLe
    -> IsAuxTwist + crysCocycles.map + mapRel + dual separation
  DenominatorBound -> exists_baseLevel -> normalisedRep_quadratic_on_inertia
    -> label attachment + local conjugate clauses + finite inertia
  DenominatorBound -> ribet_columns -> sum_blockLoss_le
    -> inClass_of_isLatticeIn + InClass.of_jointly_injective
    -> degree-zero finite order + jump_baseChange + admissibility
    -> relLength_obeyingCocycles_le + block_defect_le_at_place.
Reduced human graph: shared finite-order root cancellation feeds the
two inertia routes; one dual-separation equation feeds the extension
of relations. No native nodes/axioms deleted; all other hypotheses
and original edges retained. No claim of globally minimal graph.
Context/cache key: compact pin, fixed ell,w,O,O', family and embedding,
degree zero, exact inertia finite order, common K, auxiliary twist
locally trivial, same lattice/relations. Reject reuse outside key.

Checks actually executed: authenticated source blobs above and
caller snippets; exact 30 integer 2x2 matrix power checks for the
negative control (ell=2,3,5,7,11; k=1..6, binary exponentiation).
These are controls, not proof of RH. No local lean/lake found.
Actual status receipts on cathedral-research-state:
old conditional-strip PASS b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
old prune PASS 7da354941e402b6f8b364ed03d8c5c82d27b7717;
compact targeted PASS 77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35;
compact primitives ERROR a56e2d3afb99ed8275e81fd63c8494306e57c43f;
compact union graph RESOURCE_BLOCKED ea44d71556e0d21703e72fcd61bbaf2bee0ec563.
No receipt covers this file. Old engine toolchain is not the compact
toolchain; do not pretend rh_scan/rh_prune/rh_reduce/rh_auto/frontier
were executed on compact bodies. Native scan, replay, bridge and
axiom ledger still owed to shared runner. No URT comparison.

RESUME HERE: independently audit the exact finite-order and dual-map
transport at the native callers; then trace the still-unexpanded
tame label attachment and level-integrality suppliers in BaseLevelOfLabel
and their determinant consumers. Use the actual shared compact runner
for #print axioms and caller checks, preserve all prior graph/axiom
evidence. Human reconstruction remains incomplete; external formal
certification is separate. Do not import the final RH theorem.
-/

open scoped BigOperators

namespace GaloisRun56

-- Prepared standalone algebraic fragment of the actual final
-- TwistForRows relation transport; native replay required.
theorem finite_relation_transport {R M I : Type*} [CommRing R]
    [AddCommGroup M] [Module R M] [Fintype I]
    (a : I → R) (x : I → M)
    (sep : ∀ y : M, (∀ l : M →ₗ[R] R, l y = 0) → y = 0)
    (h : ∀ l : M →ₗ[R] R, ∑ i, a i * l (x i) = 0) :
    ∑ i, a i • x i = 0 := by
  apply sep
  intro l
  simpa [map_sum, map_smul, smul_eq_mul] using h l

end GaloisRun56

#check IsFiniteTypeAt.aeval_eq_zero_of_roots
#check IsPotCrys.eventually_linearFrob_eq_one
#check inClass_of_isLatticeIn
#check normalisedRep_quadratic_on_inertia
#check exists_baseLevel
#check exists_mFoldTwist_selmerLengthLe
#check sum_blockLoss_le
#check ribet_columns
#print axioms GaloisRun56.finite_relation_transport
#print axioms inClass_of_isLatticeIn
#print axioms normalisedRep_quadratic_on_inertia
#print axioms exists_mFoldTwist_selmerLengthLe
#print axioms sum_blockLoss_le
