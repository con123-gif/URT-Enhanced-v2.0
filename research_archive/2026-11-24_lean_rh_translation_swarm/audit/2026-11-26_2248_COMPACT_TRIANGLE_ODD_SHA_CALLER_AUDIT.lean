import New.Selmer.TrianglePrimes
import New.Selmer.TateTwistSteps
import New.Selmer.RowBalanced

/-!
# Independent audit and reconstruction: actual triangular primes, even defect, odd length
26 Nov 2026. HUMAN SOURCE-MATCHED, PARTIAL overall; executable Lean checks below PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first);
AGENTS 8db0201d, SWARM_PROTOCOL 4b77b161, HANDOFF_QUEUE bbc46df7;
HUMAN_PROOF_COMPACT blob 0e365a21fbbb549e300384681c8b615cc9e32510.
Reviewed peer RUN63 708be3d53afd81581f032da0615631affc9aaf50 and detector
fix f58fbee1d4913217886f2d2bee7b997e783cb701 (current file blob
5a8b3e939c0b7299ffa4d0851a98805d39245253); prior balanced audit d064b084
(file blob b2269a986d40de7701b0e93a1cd12278915b2ecb).
Do not redo the already integrated normalized RowBalanced scalar cost.
Source anchors (relative to grh-compact/src):
New/Selmer/TrianglePrimes.lean b827965b6067ce391e85efd83fcc919fcd75848c
  exists_isPrimeTriangle, especially hD,h2,H,F,R,Y and final detector argument.
New/Selmer/ReciprocityLaw.lean 7b82ced3dd3ff2be7eedbfa63f92f743093223
  eq_zero_of_mem_evenClasses, IsLaw, exists_isLaw.
New/Selmer/Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c
  IsPrimeTriangle, evenClasses, four_dvd_cycChar_sub_one.
New/Selmer/TateTwistSteps.lean 941e383bd401d51e8a8c2d856320ef61c7fa17e7
  hasTriangleCost_tateTwist.
Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195
  exists_detecting_points_cocycles, exists_length_shaOdd_le.
Lib/Cyclotomic/Kolyvagin/Components.lean fbd540929083786c70247cfeace76a5ae9454547
  component.
New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18
  ribet_columns, actual two consumers.

## 1. Reconstruct the recursive triangular supplier, preserving the law existence premise

Fix E in Q(mu_N), N+t<y, h≥0, gamma as in source, and
d_a = cyc(gamma)^a-1 dividing ell^h for 0<a<t; ell≤y² or h=0.
Keep four infinite places, stable unramifiedness, and the W hypothesis:
for every nu,g there is delta with full cyc(delta)=1 and W belonging
to mostFrobeniiAt E (delta^(ell^nu) g).
Fix the native detecting set p BEFORE nu; order it, then take
J = {(a,i): 0<a<t, i in p}, lexicographically. This same J and type
map serve every nu>0. At fixed nu write R=Z/ell^nu, kappa=cyc mod ell^nu,
U=ker kappa, m=kappa(gamma) a unit. A law of degree d restricted to U
is additive, odd under conjugation c, and satisfies
 L(gamma u gamma^-1)=m^(d+1)L(u).
Only this restriction is used in the following projector.

For any j=(a,i), let I be earlier indices of the SAME degree a.
For all laws consider the simultaneous evaluation map on U into
the product of copies of R. Use the integer-lift lattice H from the
native proof (all integer lifts of such evaluation vectors), project
to earlier laws indexed by I. This image is a subgroup of Z^I;
choose its Z-basis and actual lifts represented by points y_b in U.
Its rank is ≤ |I|, even when the image contains ell^nu times the
whole lattice; it is NOT a vector space over R, and reduction of a
basis mod ell need not be independent. Invoke exists_isLaw at the
earlier same-degree Frobenii, with these y_b as the at-most-|I|
test points. Obtain the SAME new law L_j and exceptional set T_j,
with L_j(y_b)=0 and L_j(w) a unit at some w in U. This is the deep
primitive input, not established just by the rank bound.

Subtract an integer combination of the lifted basis vectors from
an integer lift of the evaluation vector of w. Since the law
evaluations are additive on U, this is represented by a point v in U
(product of powers, in any fixed order); all earlier same-degree
laws vanish on v and L_j(v)=L_j(w) stays a unit. Now apply, on
simultaneous evaluation vectors, the operator
    P_a = product_{0≤k<t,k≠a} (Ad_gamma - m^(k+1)).
Here Ad_gamma means precompose the evaluations with conjugation
of their common representative by gamma; integer lifts of m powers
may be used. Each factor is realized by gamma v gamma^-1 v^(-m^(k+1)),
so the successive vector still has a representative u in U.
On a degree d law the factor is m^(d+1)-m^(k+1).
Consequently every earlier law (any degree) vanishes on u and
    L_j(u)=L_j(w) * m^(t-1) * product_{k≠a}(m^a-m^k).
No idempotent projector, no division by eigenvalue gaps, and no
claim that L_j(u) stays a unit. This is the exact source product
induction on H, not independent choices of u for different laws.

## 2. Select one Frobenius carrying BOTH the new law and even evaluations

Set a0=gamma^-1 and g_i=(a0 i)^-1(i a0), which lies in U even
for arbitrary detector i (indeed its full cyclotomic character is 1).
Let x0=g_i c(g_i) (u/c(u)). Apply hW with x0 and this nu; write
x=delta^(ell^nu) x0. For every law L, its oddness on U yields
    L(x)=2 L(u).
For any even scalar cocycle C for action cyc^(-a) mod ell^nu,
C restricted to U is additive, so
    C(x)=2 C(g_i).
Here ell^nu kills both types of values, and evenness cancels
C(u)-C(c(u)); law oddness cancels L(g_i)+L(c(g_i)).
These are exact identities, BEFORE divisibility. Do not replace the
two factors of 2 by units: this matters at ell=2.

By local constancy for the finite previously chosen laws and
the new law, and finiteness of the scalar unramified-off-ell
cocycle set (native finite_unramified_cocycles), impose all
these evaluations and the condition kappa(x)=1 in one neighborhood.
Use the native mostFrobeniiAt filter and W hypothesis to select
one Frobenius x_j there, degree-one, off ell, at a real-subfield
prime distinct from all earlier primes and avoiding all earlier
exceptional sets and T_j. Finite avoidance and Chebotarev/Frobenius
filter properties retained. For all coefficient rings O and even
unramified cocycles, C(x_j)=2C(g_i) follows by composing with
every additive hom to Z/ell^nu: such compositions are scalar
cocycles because the action factors through Z/ell^nu. Cyclic
character separation (eq_zero_of_mem_evenClasses) then gives
the equality in O/ell^nu. This does not require a finite union
over all O. For each j the new law vanishes on every later
Frobenius by construction; later choices avoid its exceptional
set. These are indispensable cross-index conditions.

## 3. Divisibility and exact detector costs

Let lambda=cyc(gamma) in Z_ell^x. For any a≠k in [0,t),
lambda^a-lambda^k is a unit times ±(lambda^|a-k|-1),
hence divides ell^h. All powers here are positive where hh
is used; no use of d_0 as a nonzero divisor. For 0<a<t,
    (ell^h)^3 product_{k≠a}(lambda^a-lambda^k) | ell^(yh)
since t+2≤y (N≥1 and N+t<y). Also 4 divides d_a by the
actual four_dvd_cycChar_sub_one (stable unramifiedness at 2,
unit at odd ell). Thus both 4 d_a² and
4 product_{k≠a}(lambda^a-lambda^k) divide ell^(yh).
The pure separation product holds for ALL a, including a=0,
independently by its t-1 factors. Map divisibility to Z/ell^nu
and use m^(t-1)L_j(w) a unit. From section 2,
    2 L_j(x_j)=4 L_j(u) | ell^(yh) in R.
In particular never assert nonzero L_j(x_j) modulo ell^nu:
if the image of ell^(yh) is zero, the relation may be vacuous
and the annihilation cost remains valid. The native IsLaw
reciprocity for the suffix of J now gives ell^(yh) times the
tame value zero, after removing the earlier primes by the
earlier vanishing tame conditions. The earlier same-degree
Frobenius conditions kill Phi of L_j, and all suffix indices
other than j are killed by L_j. Distinct primes over the real
subfield, exceptional avoidance, positive degrees and exact
same law are retained. This yields IsPrimeTriangle.step.

The detecting set p is still independent of nu. Its size≤y^20
when ell≤y², and |J|≤(t-1)|p| for t≥1 (empty for t=0).
Thus (|J|+|p|) y h ≤ y^22 h using t≤y; if h=0 no
size estimate is needed, since both costs are zero.

## 4. Finish the actual coboundary field (exact cancellation)

Write xi=cyc^(-e), d(g)=xi(g)-1 in B=O/ell^nu, a0=gamma^-1.
For an even unramified class z whose selected same-degree
Frobenius evaluations vanish, put C=2z. Section 2 gives
C(g_i)=0 at every i in p for this degree e>0. The cocycle identity
gives the decisive formula
    D(i) := C(a0 i)-C(i a0)
          = d(a0) C(i)-d(i) C(a0)
          = -xi(a0 i) C(g_i).
The function D is itself a locally constant cocycle for xi:
d is a coboundary, C is a cocycle, scalar coefficients commute.
It vanishes on inertia off ell because C and d both do; d
vanishes there by cyclotomic unramifiedness. Hence D belongs
to the SAME detector module for every O,nu. Since D(i)=0
on p, D=0. This proves d(a0)(2z)=d(.) (2z)(a0), without
dividing by 2 or d(a0), exactly as IsPrimeTriangle.coboundary.
The required 4*d(a0)^2 divisibility was already paid in section 3
since xi(a0)=lambda^e. e=0 is excluded from the triangle type;
it needs neither this argument nor a division by zero.

## 5. Independently check RUN63 at its actual consumer

The prior peer's local loss inequality uses actual integral evaluation
relations and conjugation by a unit when full xi(g)=1, not a
surjective integral reduction map. Agree. In the even kernel of
c ↦ c^c-c on the tied submodule, A=c+c^c=2c and the coboundary
field applied to A yields 4*d(a0)c a coboundary. The hypothesis H
of hasTriangleCost_tateTwist applies to this scaled cocycle because
Z is an O-submodule. It kills it by d(a0), and section 3 gives
ell^(yh)c=0. Therefore the relative length of the tied part
modulo ell^(yh)-torsion is bounded by length of the odd image,
NOT by the length of all even classes. At e=0 the definition of
shaOdd imposes oddness only when e≠0; direct unramified
inclusion suffices. This checks the exact input at ribet_columns,
which adds the crystalline defect and the odd-length bound.

For the odd-Sha Fourier transfer independently recompute
b(u,gh)=b(u,g)b(ug,h) by cancelling g^-1*g between the
commutators. These elements have full cyc=1 and belong to
ker cyc mod N⊆G_E. For x with action cyc^(-e), the cocycle
law gives x(b)=additive on these products and x(k b k^-1)
=cyc(k)^(-e)x(b) for k in ker cyc mod N. Thus multiplying by
U_psi(u)=cyc(u)^e psi(u) makes the summand left K-invariant.
Right permutation of quotient representatives gives a cocycle
for U_psi^-1. For g in K in the local sets of component,
b(u,g) is a quotient of two conjugate local elements, both
killed by x, including the full-cyc=1 above ell condition.
At cmConj the commutator is 1. Component membership follows.
Using full character orthogonality and the section s(1)=1,
sum z_psi(i(v))=-2 phi(N)x(v). At v^c the sign reverses.
The difference of the sums is 4 phi(N)x(v), not 2 phi(N);
even components are conjugation invariant, odd components
vanish after the Stickelberger multiplier. No division by
phi(N) or 2 at the small primes. RUN63's corrected detector
uses M=N ell², not merely ell², so M-torsion has trivial
action on G_{Q(mu_M)} including ell|N. Annihilation alone
does not imply a length bound; the uniform finite evaluation
injection is necessary and retained. Agree with the peer's
uniform collection X=h_E product_{0<e<t}(4 phi(N)*4X_e²)^(y^20).
This is not an independent proof of the Stickelberger/Kolyvagin
component supplier, or of the existence of a new law.

## Dependency and verification ledger

Actual source path: C -> ribet_columns -> hasTriangleCost_tateTwist
and exists_isPrimeTriangle -> exists_isLaw, detector, Frobenius
selection, cyclic separation, local tame removal -> step and
coboundary; and exists_length_shaOdd_le -> exists_isStickelbergerBound,
nsmul_component_eq_zero, exists_detecting_points_component,
class-field detector, local index and class number. Human derivation
now supplies the triangular recursion, simultaneous evaluation,
two payments, exact coboundary field and audits odd transfer.
Remaining essential leaves: the quantitative primitive law proof
(exists_isLaw, in particular its real-subfield relations count and
primitive unit evaluation), component annihilator and detector,
crystalline annihilation/defect and row existence/comparison.
No global native graph or axiom deletion; original and reduced
graphs untouched; no new kernel closure. Context keys include pin,
E,N,t,y,h,gamma and fixed p before nu; common j,u,L_j and suffix
rather than independent per-law witnesses. Rejected reductions:
division by 2 or the spectral gaps, requiring unit value AFTER
projection, counting distinct coefficient rings as a finite set,
and bounding all even classes by odd length. No URT premise.

Executed: source retrieval and exact human algebra, local command -v
lean/lake/elan (all absent). No redundant finite simulations.
Old-pin status receipts re-read, both status=pass:
45577239749 blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Different toolchain; native reduction engines not run here.
Compact RUN28 receipt 23de197bd48f404ca2074c69676de289c4f7934e;
primitive replay run 45803534769 actual jobs wrapper success but
targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804
all_requested_checks_ok=false, full_RH_replay=false: three
IsPencil checks and three Filling checks, standard three axioms,
module_1_build returned 124. None certify the new argument.
Prepared scalar certificates and native probes below, uncompiled.
No full proof imported as shortcut.

RESUME HERE: integrate sections 1–4 at IsPrimeTriangle existence in C
rather than repeating the normalized RowBalanced length. Audit
ReciprocityLaw.exists_isLaw lines 100–196, particularly its
real-subfield count of ell-torsion and primitive unit evaluation
in the simultaneous earlier-law nullspace, then the remaining
ComponentBound primitive. Keep all original source witnesses and
open inputs. HANDOFF TO integration/editor, Galois, literature,
independent audit and shared compact native replay.
Verdict AGREE / PARTIAL: exact triangular recursion and its caller
human-derived conditional on retained primitive inputs.
-/

namespace CompactTriangleAudit2248

theorem cocycle_defect {R : Type*} [CommRing R] (u v x y : R) :
    (x + u*y) - (y + v*x) = (u-1)*y - (v-1)*x := by ring

theorem projector_factor {R : Type*} [CommRing R] (m a b : R) :
    m*a - m*b = m*(a-b) := by ring

theorem double_law_payment {R : Type*} [CommRing R] (z : R) :
    2*(2*z) = 4*z := by ring

theorem coboundary_payment {R : Type*} [CommRing R]
    (C d q z : R) (hC : C = q*(4*d^2)) (hz : (4*d^2)*z = 0) :
    C*z = 0 := by rw [hC, mul_assoc, hz, mul_zero]

#check exists_isPrimeTriangle
#check IsPrimeTriangle.coboundary
#check IsPrimeTriangle.step
#check exists_isLaw
#check eq_zero_of_mem_evenClasses
#check exists_detecting_points_cocycles
#check exists_length_shaOdd_le
#check hasTriangleCost_tateTwist
#check IsRow.eventually_isBalanced
#print axioms cocycle_defect
#print axioms projector_factor
#print axioms double_law_payment
#print axioms coboundary_payment
#print axioms exists_isPrimeTriangle
#print axioms exists_length_shaOdd_le
#print axioms hasTriangleCost_tateTwist

end CompactTriangleAudit2248
