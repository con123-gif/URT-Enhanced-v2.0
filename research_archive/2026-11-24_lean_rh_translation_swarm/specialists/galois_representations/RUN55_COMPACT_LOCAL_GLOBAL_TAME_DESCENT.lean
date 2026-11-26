import Lib.GaloisRep.LocalGlobal.LabelCompatibility
import Lib.PadicHodge.Characters.UnramifiedPeriods
import New.Selmer.OnePlaceDefect
import New.Selmer.RowBalanced
import Mathlib.Tactic

/-!
# RUN55 Galois — local-global descent and tame crystalline supplier
26 November 2026. Human source-matched derivation, not new kernel closure.
Compact upstream lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; latest peer head
1cc71623d383e9f381cd15b3d2056b071fb7dc92. Credit compact proof authors.
Read protocol, handoff, expansion, AGENTS, current manuscript and RUN54.
Editor 837dd3d8 already supplies three numerical crystalline cases; do not
duplicate them. Integration 15ea3969 supplies scalar inertia order and common
row. This run expands the actual earlier local-global and tame suppliers.

Source ledger (exact blob):
Lib/GaloisRep/LocalGlobal/LabelCompatibility.lean ebab5c28368e0178e180ee25fa13934dfa01bcdd
Lib/GaloisRep/LocalGlobal/EigencharCompatibility.lean 5be55e2a5e8f9bafbd98eab6712c035fd80daeff
Lib/GaloisRep/LocalGlobal/TameExponent.lean e3612dcf47941d04881a5b210a93e25bb6b3b336
Lib/GaloisRep/BaseChange/BaseChangeLabel.lean 78bbc1938a8dc5da432771b54344df844042cf82
Lib/GaloisRep/BaseChange/BaseChangeEigenchar.lean d3cb6101c5601516255ac76bf1ea76bf4978f8e2
Lib/GaloisRep/Main/AttachedDeterminant.lean 4ba6deb12eca0441dda20691b523471465a9a777
Lib/PadicHodge/Characters/UnramifiedPeriods.lean b833d98bbcbcee7cd86a525d0f4cca16a978cca1
New/Selmer/RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc
New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395
New/Selmer/CrystallineRank.lean 601a4af17cf5f164a2a3b947442192661c680650
New/Selmer/OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a
New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18

1. Exact degree-zero transfer, including noncommuting operators.
Actual Attached.local_global_of_eigencharacter first uses positive Weil
degree k, then passes to k=0 via eval₂_eq_zero_of_pos_pow. Here is a human
derivation retaining its FULL noncommutative hypothesis. K is a field, A a
possibly noncommutative K-algebra (work in the centralizer of K). Let
q(X)=prod_i(X-a_i), a_i nonzero, q(T)=0. Suppose
 prod_i(S T^k-alpha_i a_i^k)=0 for every positive k.
Products use fixed order; do not assume S,T commute, diagonalize them, or
match eigenvalues one by one. Let B=K[X]/(q), t=X mod q. Since q(0) is a
unit, t is a unit. In the finite-dimensional commutative K-algebra
 D=tensor_i(B x K), set y=tensor_i(t,a_i). It too is a unit. Define a
K-linear map F:D->A by the multilinear map
 (b_i,c_i)_i -> prod_i(S b_i(T)-alpha_i c_i).
Evaluation b_i(T) is well-defined because q(T)=0. Thus F(y^k)=0 for k>=1.
Multiplication by y on D is invertible. Its characteristic polynomial has
nonzero constant coefficient, so Cayley-Hamilton applied to 1 expresses
1 as a K-linear combination of y,y²,...,y^dim D. Apply F: F(1)=0, i.e.
 prod_i(S-alpha_i)=0.
The n=0 case is vacuous unless A is the zero ring, and follows directly
from the assumed empty product =0. No bound on nilpotent Jordan blocks
and no norm estimate needed. This proves the native algebra lemma, and
even shows finitely many positive-degree instances suffice (no efficiency
claim). At the caller choose the SAME degree-one inverse Frobenius phi
and local uniformizer pi. For inertia s and local Artin preimage x, the
positive-degree elements s phi^{-k} correspond to x pi^k; a_i are the
normalized character values on pi, alpha_i those on x. The lemma applies
both to the actual representation operators and to linear Frobenius on
the crystalline period space (the latter uses the native Weil-pair
multiplication and central coefficient identities). Thus no assumption
that the original inertia operator is semisimple. This is precisely why
a two-factor annihilator, not only an eigenvalue list, reaches Ribet.

2. Base change descent on the correct open subgroup.
Native IsWeakBaseChange.exists_attached_descent: for the prime-degree
step cut out by symmetrise chi, put N=ker(symmetrise chi) intersect ker chi.
N is open. At the Frobenii in N where both systems have their unramified
Hecke polynomials, the places split completely in the step field AND
chi is trivial. The weak matching then gives equality of polynomials,
not merely equality after taking powers. Use the native mostFrobenii
push/filter and continuity to identify traces of r|N and r'|N. Their
trace-nondegenerate/semisimple hypotheses are needed for the native
trace-to-conjugacy theorem. It supplies one invertible intertwiner on N.
Hence on N the determinant identity and every polynomial annihilator
descend by conjugation, while finite inertia and potentially crystalline
type and jumps descend along the open local restriction with the native
period comparison and CM-type embedding guards. Do NOT conclude r and
r' conjugate on all G_E; the polynomial and determinant clauses require
the particular element s in N. This is the actual restriction in both
local-global inductions.

3. Prime-step label and eigencharacter induction.
For Attached.isLabelledAt start with degree factorial f=d!, and the
tame-exponent witness at a split place of residue size q. The root
factors of c lie in the degree f residue extension by the minimal
polynomial/Frobenius argument (RUN54). For f=1 the label splits into
linear factors over k_w; parahoric-to-sorted-Iwahori gives a vector in
the SAME eigensystem with these character factors and the specified
determinant-character blocks. Local Artin on a unit identifies
T(x_chi)^a with chi(residue unit). The degree-zero result of section 1
gives annihilation. The determinant avatar gives the product of roots
away from ell, independently of annihilation. For a prime divisor p of
f, the source chooses an inert unramified local extension of degree p
with the local idele character trivial on the units needed for descent.
The Shintani local matching transports the inflated finite-group
character to an actual weak-base-change eigenform with the mapped
label, not just an arbitrary representation with the same dimensions.
At the new place q'=q^p and f'=f/p, so (q')^f'=q^f. The same tame witness
z with z^(q^f-1)=pi and residue character/exponent a therefore gives
the SAME killing polynomial, including multiplicities, after the residue
embedding. The inertia element fixes the step field and belongs to N
by the chosen local character conditions. Apply the induction and section
2 to descend all three clauses. No change to the fixed global r. The
finite type and Hodge jumps are preserved by the base-change weights.
The degree-zero sorted-Iwahori supplier itself uses a separate strong
induction for positive degree: D is the inverse image of the cyclic
subgroup generated by the tuple of normalized characters at x. The
principal-unit triviality and residue exponent q-1 give finite index.
If D is the whole group, the valuation forces degree k=1 and the
spherical Hecke polynomial is the elementary-symmetric polynomial of
the normalized character values (native sorted vector/spherical
projector). Otherwise choose an order-p character of the finite quotient,
nontrivial on a class and trivial on D, and the native step above its
local kernel. Local norm transports the tuple and the Artin preimage;
the new index strictly decreases because that nontrivial quotient
class is excluded. The local-unit correction is in the common character
kernel by the tame symbol. Descend through N as in section 2. These are
the two actual induction parameters, not induction on rank.
Retain the weak-base-change matching theorem, spherical attachment at all
ranks, determinant avatar and trace-density/period comparisons as
explicit source dependencies. No independent proof of those deep inputs
is asserted.

4. Tame polynomial to local crystalline annihilator.
The actual RowBalanced.isTameType_of_roots is stronger than an eigenvalue
list: a common polynomial class K contains EVERY polynomial vanishing
on the supplied common root multiset M. |M|<=N, each y has
y^(p^a-1)=1 for some 1<=a<=r. These y are Teichmuller roots in the
unramified degree-a extension, so their monic minimal polynomials over
Q_p have integral coefficients and degree <=a<=r. The product over M
is monic over Z_p of degree <=Nr; also X^lcm_{1<=a<=r}(p^a-1)-1
vanishes on M. These supply BOTH fields of Lift.IsTameType, including
the second polynomial for the actual row/tate column family, not just
one root per matrix with no uniformity. In the native tame_types_exponent
caller construct a tame chart with e=lcm_{1<=a<=r}(p^a-1). Since each
factor <p^r and there are r factors, e<=p^(r²). The source additionally
requires p not dividing r! (follows from the displayed prime size
guard); the chart is constructed with residue degree r!. The bound on
the tame polynomial degree N leads to kappa=r²(N+1)². On a cocycle
extension by a trivial lattice, multiply the killing polynomial by
X-1: (beta-1) maps into the old submodule, on which q(beta)=0. The
native z-divisibility identity then uses the actual sum of tame
generator translates. In the lift-ideal induction, at each exponent
whose residue is not a root of q(X)(X-1), its value at the chart
Teichmuller root is a unit and one descends at no additional p-cost.
At a root one pays at most r² in the normalized exponent; the total
number of exceptional exponents is at most deg q+1 by injectivity of
the primitive-root powers. This proves the numerical cost mechanism
r²(deg q+1) for killsCokernel_of_isKilledBy; the lift-ideal divisibility
and extension frame identities used to descend are separate retained
native inputs. Apply to both sides and their Tate-dual tensor, whose
polynomial degree is bounded by N² by the native tensor supplier; the
chosen kappa covers all three. The actual tame_types_exponent yields
E=3kappa+150(eta+W+1) provided the full displayed gap and size guard
b+6(W+eta)+kappa+2<p holds. This guard must be checked at the actual
OnePlaceDefect branch (p=D.g n, hj surjective), not for arbitrary p.
The rank lemma then gives normLength defect <= index*2 rank(L)*E:
over Z_p the crystalline cocycle rank is rank plus number of negative
jumps across the local embeddings, bounded by (1+index)rank <=
2 index rank; scaling by p^E puts the free module inside orthogonal
submodule. Quotient is a quotient of Z_f/p^E Z_f, with length bounded
by the normalized free rank times E. Retain the actual normalization
and rank conversion via finrank Z_p O, not H¹ rank in place of Z¹.
This plugs into the same sum_blockLoss_le as RUN51; the exact final
native Data size and tame loss payment, chart lift-ideal descent and
tensor polynomial construction remain explicit next checks.

Original source-role graph (unchanged kernel graph):
C -> exists_isFitFamily -> exists_row_for_all_twists ->
IsLabelledColumn.isRow -> Attached.isLabelledAt -> local_global_of_eigencharacter
 -> eval₂_eq_zero_of_pos_pow / exists_baseChange_isIwahoriEigen /
exists_baseChange_hasLabel -> exists_attached_descent.
C -> denominatorLe_rowBudget -> ribet_columns -> sum_blockLoss_le ->
block_defect_le_at_place -> tame_types_exponent -> killsCokernel_of_isKilledBy
and normLength_defect_le. Also isTameType_of_roots at sum_blockLoss_le.
Reduced human view uses sections 1–4 with the SAME source obligations;
none deleted globally. Context key (pin, E,w,A,ell,r,degree,character,
common polynomial, chart, row and lattice). Original/reduced graphs and
axiom receipts preserved, no claimed full kernel DAG. Native Lean/lake
not present locally (command -v both returned no path).
Read actual state status a56e2d3afb99ed8275e81fd63c8494306e57c43f
for CI 45803534769: error, partial probes only. Latest branch
orchestrator 45829950124 was in progress; no new candidate CI PASS.
Certificate below is prepared for shared compact replay; no native
engine execution, no claimed independent proof of C or of RH.
No old-pin engine outputs are treated as compact validation; no URT.
No new finite regression claimed (the argument is exact linear algebra).
RESUME HERE: prove actual tame-chart lift-ideal descent at the zero/nonzero
root branches of killsCokernel_of_isKilledBy, check exact Data size and
loss payment in OnePlaceDefect, and audit the tensor killing polynomial
with multiplicities. Use editor 837dd3d8 for already derived numerical
crystalline cases and integration 15ea3969 for scalar order. Handoff to C
math, integration/editor, audit, shared kernel; request bounded replay
of the exact declarations below through the existing runner.
-/

namespace GaloisRun55

/-- Scalar cancellation at the last step of the finite recurrence argument. -/
theorem recurrence_constant_cancel {K V : Type*} [Field K] [AddCommGroup V]
    [Module K V] (c : K) (hc : c ≠ 0) (x : V) (h : c • x = 0) :
    x = 0 := by
  rcases smul_eq_zero.mp h with hzero | hx
  · exact (hc hzero).elim
  · exact hx

theorem rank_multiplier (d r : ℕ) (hd : 1 ≤ d) :
    r + d * r ≤ 2 * d * r := by
  have h : r ≤ d * r := by simpa using Nat.mul_le_mul_right r hd
  omega

#print axioms recurrence_constant_cancel
#print axioms rank_multiplier
end GaloisRun55

#check eval₂_eq_zero_of_pos_pow
#check IsWeakBaseChange.exists_attached_descent
#check Attached.local_global_of_eigencharacter
#check Attached.isLabelledAt
#check isTameType_of_roots
#check Lift.tame_types_exponent
#check Lift.TameChart.killsCokernel_of_isKilledBy
#check normLength_defect_le
#check block_defect_le_at_place
#print axioms eval₂_eq_zero_of_pos_pow
#print axioms IsWeakBaseChange.exists_attached_descent
#print axioms Attached.local_global_of_eigencharacter
#print axioms Attached.isLabelledAt
#print axioms isTameType_of_roots
#print axioms Lift.tame_types_exponent
#print axioms Lift.TameChart.killsCokernel_of_isKilledBy
#print axioms normLength_defect_le
#print axioms block_defect_le_at_place
