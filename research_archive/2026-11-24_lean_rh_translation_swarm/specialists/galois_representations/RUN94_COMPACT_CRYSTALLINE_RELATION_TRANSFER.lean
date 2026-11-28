import New.Selmer.TwistForRows
import Mathlib.Tactic

/-!
RUN94 — C1: exact crystalline relation transport at the common m-fold twist caller.
28 November 2026. SOURCE-MATCHED human derivation; native certificate PREPARED,
not replayed. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read latest mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF and EXPANSION read; latest peers 3a590261 (B2),
7999323a (B3), 7654aa1f (prime), 8aa381a7 (integration), c1f43d70
(C2 cache identity). RUN92/93 remain preferred arithmetic and replay
candidates, not repeated here. RUN63,65–67,73,80–82 inspected.
The character-box RUN93 records that artifact 15234434421 is over
the connector size cap; do not substitute a different compiled roster.

Exact native source paths (relative to grh-compact/src):
 New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d
   exists_mFoldTwist_selmerLengthLe, final length_mono subgoal.
 New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c
   SelmerLengthLe, crudeUnit.
 New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df
   ZfAt, crysRels, obeying_crysRels.
 Lib/General/Algebra/FittingDuality.lean 50c522f409cc0214163df1d26b77aede4aa8100a
   relEval, relationsOn, obeying, mapRel.
 Lib/PadicHodge/Crystalline/Jumps.lean 487fb8b09cb5c25aa582ddab7352f90dd6c2e0d1
   crysCocycles.map.
 New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14
   exists_isFitFamily, actual consumer.
 New/Selmer/TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754
   exists_anticyclotomic_twist, retained tied Selmer supplier.

1. Exact same witness and quantifiers.
Fix the native D, finite row family R_i, prime ell, embedding iota, and
M. Retain all IsRow inputs, the single chosen off-ell place w, the
simultaneous balanced lattices u_i over O, gamma_i, scalar y_i,
cost beta_i, the native common Q, psi and every power 1<=n<=D.m.
Do not choose a new twist for an individual row, power, or coefficient
extension. The common anticyclotomic construction gives the native
eventual length bound s7 for the original relation sets transported
to each sufficiently large O'. The actual conclusion SelmerLengthLe
instead uses the full crystalline relations of the twisted lattice
rho over O' and requires zero at gamma_i. The only task here is to
justify the inequality between those two submodules over SAME O'.

2. One exact finite-coordinate identity proves the relation inclusion.
For any such O', let e:O->O' be the native inclusion. As in the source,
O' is finite and torsion-free over O; O is a DVR. Hence O' is finite
free over O. Choose an integral O-basis b_j with coordinate maps
lambda_j:O'->O. These are O-linear, hence Z_ell-linear. They jointly
separate O'; no trace division, unramified extension assumption, or
invertible extension degree is required. Extend lambda_j componentwise
to O'^r -> O^r.

At EVERY chosen decomposition group G_v with v|ell, the SAME twist
is trivial by the IsFromU1 local clause s2.eq_one_of_mem_decompGroup.
In particular rho(g)=e(u_i(g)) there, not merely congruent to it.
It follows from O-linearity that
    lambda_j(rho(g)x)=u_i(g)lambda_j(x).
If z belongs to Z_f(rho|G_v), the retained crysCocycles.map applied
to lambda_j gives lambda_j o z in Z_f(u_i|G_v). Fix ANY native
f in relationsOn(ZfAt v u_i). By definition f is a finitely supported
matrix-valued relation, not a polynomial in g. Its transported
evaluation is
    E_f(z) = sum_(g in supp f) e(f(g)) z(g) in O'^r.
For each basis coordinate j, exactly (before any norm)
    lambda_j(E_f(z))
      = sum_g f(g) lambda_j(z(g)) = 0.
The first equality uses the finite support and O-linearity on every
matrix entry; the second uses the ORIGINAL relation on the mapped
crystalline cocycle. Joint separation gives E_f(z)=0. Hence
    mapRel(e)(relationsOn Z_f(u_i|G_v))
        subset relationsOn Z_f(rho|G_v).
Pushing these relations along the subgroup inclusion G_v->G preserves
the equality of evaluations; taking the union over v gives the
actual global relation-set inclusion. This is precisely the middle
branch of the native last rintro/exacts in TwistForRows. The native
proof uses ALL dual linear maps and forall_dual_apply_eq_zero_iff;
one finite integral basis is sufficient. It is not asserted that
the complete new relation module is the scalar extension of the old one.

3. Correct direction of the length bound at the actual caller.
The transported old crystalline relation set is a subset of the
new full relation set, so obeying(full new) is a SUBMODULE of
obeying(transported old), not the reverse. The other two source
branches retain the identical cocycle/unramified equations on the
same unionWithConj set and the identical gamma-zero relation
(single gamma 1). Thus the full SelmerLengthLe module embeds by
identity in the already bounded module over O', in the SAME
quotient O'/ell^M. Module.length is monotone, and so is O'.normLength.
This proves exactly the final step s7.trans' (normLength_mono
(length_mono ...)). No change to the normalized bound
(10 D.f rank + 1) crudeUnit, no multiplication by ramification degree.
No claim about lifting arbitrary mod-ell cocycles to integral ones;
relations are compared on integral Z_f BEFORE quotienting, and
the submodule implication then holds for every quotient coefficient.

The scalar y-1 unit, gamma cyclotomic kernel, and all powers having
nontrivial local character are kept. For the latter, the native N
proof uses finite total tame valuation; if a power were unramified
at one selected Q place, the local Artin relation would give
psi^n(sigma)=1, contradicting finiteness of that summand. This retains
the exact finite sum bound and original local Artin hypothesis.
No new prime-window estimate or odd-Sha result claimed. This is a
source-matched human proof of a specific C1 final transfer, not
a proof of the primitive crystalline functoriality, balanced/tied
Selmer supplier, or native replacement. The accepted C2 module
still uses its original corresponding transfer; no global deletion.

Verification actually executed: connector JS checked the pinned
TwistForRows blob and five source anchors (length_mono, local triviality,
crysCocycles.map, dual separation, exact theorem); all six true.
Finite-coordinate regression over the two-coordinate F5-vector space
(625 input vectors, fixed 2x2 matrix): 2500 scalar coordinate checks.
Negative control: u(g)=1, psi(g)=-1, x=1 mod 5 gives projected
twisted action 4 rather than 1; local twist triviality cannot be dropped.
These are regression checks only, not native local field calculations.
No new Lean, rh_scan/prune/reduce/auto/frontier, graph, or axiom
execution. Original/reduced graph evidence retained. No queue edit.

RESUME HERE: on the authenticated shared compact host, replay the
existing RUN93 C1 finite-budget driver against the exact artifact
15234434421. If accepted, replace only the finite-coordinate proof
of the final length_mono subgoal of exists_mFoldTwist_selmerLengthLe,
using the native coefficient basis and the helper below; compare
original/candidate complete theorem types, all axioms and actual
fit-family caller reachability. Do not duplicate the already
accepted C2 value family or substitute an unauthenticated cache.
HANDOFF TO integration/kernel/audit and character boxes. RH OPEN.
-/

namespace RHGaloisRun94

/-- The finite-coordinate identity underlying the actual relation transport.
No freeness is needed for this identity; separation is the next step. -/
theorem coordinate_relation_eval {A V : Type*} [CommRing A]
    [AddCommGroup V] [Module A V] {I : Type*}
    (T : Finset I) (c : I → A) (x : I → V) (q : V →ₗ[A] A) :
    q (∑ i ∈ T, c i • x i) = ∑ i ∈ T, c i * q (x i) := by
  classical
  simp [map_sum, smul_eq_mul]

/-- If a separating family of coordinates kills the relation value,
the value itself is zero. The actual finite free O'-basis supplies hsep. -/
theorem relation_zero_of_coordinates {A V J : Type*} [CommRing A]
    [AddCommGroup V] [Module A V] (q : J → V →ₗ[A] A)
    (hsep : ∀ x : V, (∀ j, q j x = 0) → x = 0) (v : V)
    (hv : ∀ j, q j v = 0) : v = 0 :=
  hsep v hv

#check exists_mFoldTwist_selmerLengthLe
#check exists_anticyclotomic_twist
#check crysCocycles.map
#check crysRels
#check relationsOn
#check mapRel
#print axioms coordinate_relation_eval
#print axioms relation_zero_of_coordinates
#print axioms exists_mFoldTwist_selmerLengthLe

end RHGaloisRun94
