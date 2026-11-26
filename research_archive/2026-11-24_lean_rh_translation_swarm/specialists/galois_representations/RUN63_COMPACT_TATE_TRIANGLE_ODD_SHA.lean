import New.Selmer.TateTwistSteps
import Lib.Cyclotomic.OddSha.OddShaBound

/-!
RUN63 — Tate triangle and the uniform odd-Sha arithmetic budget, actual C consumer.
26 Nov 2026. HUMAN SOURCE-MATCHED DERIVATION, pending independent audit.
Native probes and scalar certificate PREPARED, not executed. Credit Alpöge,
Sernau, Anthropic collaborators and Claude. Mission blob
9f4a2272265e847b3a46422b02d4b37e976bee10, latest completion-first priority.
Read AGENTS, swarm protocol, handoff, expansion, compact manuscript and RUN62;
recent peer commits 059f9ed6 (period chart), 34b19e8c (period contraction),
917cdb64 (theta), b11d25a0 (prime), e1e5b353 (B) checked by latest branch
commit list. No duplicate period-frame or final row-budget algebra.

Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Actual source bodies:
New/Selmer/TateTwistSteps.lean 941e383bd401d51e8a8c2d856320ef61c7fa17e7 (13–60)
New/Selmer/Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c (134–199)
New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df (localChart, ZfAt, crysRels)
Lib/PadicHodge/BlochKato/BlochKato.lean 473db3c6fdc1933e64363113b083af69340b648b (115–119)
Lib/ClassField/Places/SelmerDefs.lean ce10f7c03f6155db4ccd49bc228eb03bc23e2347 (85–97)
New/Selmer/TrianglePrimes.lean b827965b6067ce391e85efd83fcc919fcd75848c
Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195
Lib/Cyclotomic/Kolyvagin/ComponentBound.lean 61d0f229eda03e81c8d89372f05f7444ca45b09b (367,387)
Lib/Cyclotomic/Kolyvagin/Components.lean fbd540929083786c70247cfeace76a5ae9454547
Lib/ClassField/Global/Avatars.lean dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa
New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18 (134–147,204–209)
New/Selmer/RibetFirstOrder.lean a05cb18d1ee62520f104d41361099db4b23cbe1f (HasTriangleCost).

1. Exact local loss, no reduction-surjectivity premise.
Let B=O/(ell^nu), xi=cyc^{-e}, c∈Z as in TateTwistSteps. Write c^c
for c∘conjGal, L=shaLocalSet(ell,E,e), R=obeying(crysRels(xi),B).
For e=0, L consists of inertia above ell; for e>0, of elements in
decomposition groups above ell with FULL ell-adic cyc=1, not just
mod ell^nu. Let V_L be functions zero on L.
We prove Z∩R⊆V_L. Each chosen chart at v above ell has integral
crystalline module ZfAt v. For s in its decomposition group with
xi(s)=1, and in inertia if e=0, BlochKato's
crysCocycles.apply_eq_zero_of_cyclotomicGp gives z(s)=0 for every
integral crystalline z. Here tateTwist_smul is exactly the
required action, localChart identifies inertia with IsWeilPair
of degree zero in the e=0 case. Thus the single evaluation
relation [s] is in relationsOn(ZfAt v); no assertion that c|G_v
lifts to an integral crystalline cocycle is necessary. Its
image under mapDomain is a member of crysRels. Therefore c(s)=0.
For an arbitrary place A above v, choose x carrying A to
the chosen place. Write s=x g x^{-1}, with g∈L over A. The
cocycle equation, using xi(g)=1 in both cases, gives
    c(x g x^{-1})=xi(x)c(g)+(1-xi(g))c(x)=xi(x)c(g).
As xi(x) is a unit, c(g)=0. This proves the inclusion and
the exact quotient inequality
    relLength(Z,V_L) <= relLength(Z,R).
Identity induces the surjection from Z/(Z∩R) onto Z/(Z∩V_L)
(equivalently the native relLength_le_of_inj 1, with its
kernel-direction convention). This retains the local
crystalline annihilation theorem as a distinct prerequisite.

2. Triangle step from symmetrization before valuations.
C=ell^h and I={j:ty(j)=e}. On each chosen tame generator and
conjugate, xi=1 exactly; at each chosen Frobenius and conjugate,
xi=1 in B, by IsNewPlaces.cycInv_withConjInv. Consequently
    c(g^{-1})=-c(g) for these elements;
    c(g)-c((g^c)^{-1})=(c+c^c)(g).
For e>0, L is stable under conjGal, the ramification set is
conjugation-stable, and xi∘conjGal=xi, so A=c+c^c belongs to
evenClasses(O,range w,nu,e). For j∈I the type is strictly positive.
The earlier tau equalities and the earlier phi equalities for
i∈I in HasTriangleCost are precisely A(tau_i)=0 and the required
A(phi_i)=0. Apply tri.step to A:
    C A(tau_j)=0.
This is the required equality of C times the two tau values.
For e=0 I is empty; no step needs to be proved. No division
by 2 even at ell=2.

3. Remaining length via odd classes, without bounding even classes.
Let S⊆Z∩V_L be the exact submodule in HasTriangleCost, vanishing
on every tau pair, and equal on phi pairs for j∈I. By
IsNewPlaces.mem_selmerModule_of_tame_eq_zero, S is unramified
outside ell. (The representation is cyclotomic, hence trivial
on the requisite inertia.) For e=0 S⊆shaOdd by its definition:
the odd condition is imposed only for nonzero e.

For e>0, the O-linear map D:c↦c^c-c has image in shaOdd:
it is odd under the involution, unramified outside ell and
zero on L. For the last two claims c^c has the same conditions
as c, since the place sets and L are stable and the character
is conjugation invariant. If c∈ker D then c^c=c, so A=c+c^c=2c.
The phi ties give A(phi_j)=0 for all j of type e. The actual
tri.coboundary, with d(g)=xi(g)-1 and a=gamma, gives
    d(a)*4c(g)=d(g)*4c(a),       4 d(a)^2 | C.
The function c0=4 d(a)c is in Z and is the coboundary of
4c(a). The precise H supplied by RUN62 applies to c0, not
to c before multiplication, giving
    4 d(a)^2 c=0, hence Cc=0.
Thus ker(D|S)⊆S∩torsionBy(C), and
    relLength(S,torsionBy C) ≤ length(S/ker D)
       = length(im D) ≤ length(shaOdd).
For e=0 use direct inclusion of S, with the same inequality.
Add section 1 and use hb. This proves the entire native
hasTriangleCost_tateTwist with its SAME b, C, L, for all S,
including ell=2 and e=0. No assertion that the even classes
themselves have bounded length. The original triangle-prime
existence and crystalline annihilation remain necessary.

4. Uniform odd-Sha budget: exact Fourier transfer, not division.
Now E⊂Q(mu_N), y=N+t+3, e<t. O contains roots of unity of the
exponent of (Z/N)^×. Set G=Gal(Omega/Q), K=ker cyc mod N,
i:G_E→G, and kappa=complex conjugation cmConj. Since E is
abelian and K⊆i(G_E), for every u,g∈G the element
    b(u,g) = i^{-1}(u kappa g kappa g^{-1} u^{-1})
is well-defined and has full cyc=1. The inverse is unique
in i(G_E). Let s(t) be the native section of G/K normalized
at t=1. For each Dirichlet character psi put
    Upsi(u)=cyc(u)^e psi(u),
    Tpsi(u,g)=Upsi(u) x(b(u,g)),
    zpsi(g)=sum_t Tpsi(s(t),g)
for x∈shaOdd, e>0. The commutator expansion gives exactly
    b(u,gh)=b(u,g)b(ug,h).
Both factors have cyc=1, so x is additive on their product.
It follows that Tpsi(u,gh)=Tpsi(u,g)+Upsi(g)^(-1)Tpsi(ug,h).
For k∈K, x(b(ku,g))=cyc(k)^(-e)x(b(u,g)), so
Tpsi(ku,g)=Tpsi(u,g). Hence right multiplication of section
indices permutes the sum and zpsi is a cocycle for Upsi^(-1).
Continuity follows from the continuous closed Galois embedding
and locally constant finite-quotient character and cocycle.
It vanishes at kappa since b(u,kappa)=1. For g∈K in inertia
away from ell, or in a decomposition group above ell with
full cyc=1, both u g u^-1 and u kappa g kappa u^-1 lift to
elements of the corresponding conjugate local sets of G_E;
x vanishes on each. Their product with one inverse is the
commutator, so zpsi(g)=0. This checks the precise component
membership, including its local conditions.

If all odd components (Upsi(kappa)=-1) vanish, then every
zpsi(kappa g kappa)-zpsi(g)=0: for even components use
zpsi(kappa)=0 and the cocycle law. Sum this identity over psi.
At g=i(v), exact character orthogonality, without dividing by
phi(N), gives sum_psi zpsi(i(v))=phi(N)x(b(1,i(v)))
=phi(N)(x(v^c)-x(v))=-2 phi(N)x(v). The sum at i(v^c)
has opposite sign. Therefore
    (4 phi(N)) x=0.
The same argument applied to A_e x, A_e=4 X_e², with
X_e the native Stickelberger integer, gives
    Y_e x=0, Y_e=4 phi(N) A_e
by nsmul_component_eq_zero for every odd psi. This is the
actual hZ/hPhi bridge in OddShaBound, including the bad primes
dividing 2 phi(N). No semisimplicity at such primes is assumed.

5. Turn annihilation into a LENGTH bound, uniformly in nu and ell.
For a module killed by Y and detected by m evaluations in
B=O/ell^nu, the evaluation embeds it into (B[Y])^m.
Over a DVR length B[Y]=min(v_O(Y),v_O(ell^nu))≤v_O(Y).
Thus length≤m v_O(Y). This avoids the invalid inference that
annihilation alone bounds a module's length.

For ell≤y² use the native detector construction, independent
of e and nu. Set M=N ell², F=Q(mu_M). Use coset representatives
for G_E/G_F and the generators of the finite abelian quotient
of G_F detecting M-killed homomorphisms unramified off ell
(Avatars.exists_detecting_points_hom). The latter is the Artin
image quotient by principal ideles, units off ell and Mth powers;
its order divides h_F times the local power index. Its cyclic
factors have orders ≥2. To see these points detect all nu,
induct on the ell-power killing x. If ell^k x=0 and all
evaluations vanish, apply induction to Mx (ell divides M);
then Mx=0. On G_F the action on M-torsion is trivial, because
G_F fixes mu_M, so cyc mod ell^(2+v_ell(N)) is trivial
there; the prime-to-ell factor of M is a unit. (Using only
ell² would not suffice when ell divides N.) Restriction of x is therefore a homomorphism killed
by M, unramified off ell, and detected by the chosen generators.
It vanishes on G_F, and the coset representatives complete
the argument. This recovers the actual detector at every nu.

For completeness its size bound follows from the native
local power index ≤ M^(2|S|+[F:Q]), |S|≤[F:Q]≤M, and
h_F≤(2^[F:Q] |disc F|)^([F:Q]+1), |disc F|≤M^M.
Using M≤2^M gives log2(h_F I)≤2M³+5M², so at most
2M³+5M²+M total generators including coset reps.
Since M≤y^5 and y≥3, this is ≤ y^20
(2+5/y^5+1/y^10≤y^5). This is a sufficient bound with
the exact original y^20 budget, not a new quantitative premise.

For ell>y², use exists_detecting_points_component, applicable
since ell>N+e+3. Evaluate x at all b(s(t),gamma_psi_i)
for all t, psi, and i≤v_ell(X_e) (there are v_ell(X_e)+1).
Vanishing implies all odd zpsi vanish at their detectors,
hence vanish identically. Then 4 phi(N) x=0, and ell>y²
makes 4 phi(N) a unit, so x=0. There are at most
phi(N)^2 (v_ell(X_e)+1)≤y²(y^6+1)≤y^20 evaluations,
using the source 1≤X_e≤2^(N+e+3)^6. Thus for every ell
and every nu, length shaOdd(e)≤y^20 v_O(Y_e).

For e=0 the action is trivial and the local condition kills
inertia at ell, so all these cocycles are unramified
homomorphisms. Class field theory identifies their domain
quotient with the class group of E. Its finite cyclic
decomposition bounds length by v_O(h_E), using each cyclic
order to bound the image as above.

Choose the SAME all-prime integer
    X = h_E product_{0<e<t} Y_e^(y^20).
It is nonzero and length shaOdd(e)≤v_O(X) for all ell,nu,e<t.
Since log2 Y_e≤4+log2(phi(N))+2 y^6≤4 y^6 for y≥3,
and t-1≤y, X≤h_E 2^(4 y^27). This proves the uniform
length collection in the actual exists_length_shaOdd_le,
retaining Stickelberger existence/annihilation and the
Kolyvagin detector as deep inputs rather than inferring them
from the main conjecture or citing an unverified literature
equivalence. The finite-idele/class-field and discriminant
bounds are also retained named premises.

Actual consumer at RibetElement 204–209: use O' with the
primitive root supplied by 145–147, e<V.rankDiff≤D.t,
and the original nu. The projection H into block obeying
cocycles gives the crystalline defect bound by monotonicity.
Add v_O(X) from section 5 to that defect, apply section 3,
and pass precisely HasTriangleCost to the actual
ribet_first_order. The same triangle detector s is used
for the other condition after tame removal; no replacement
of this s by the detector used in the odd-length proof.
RUN62 Fitting and RUN60 rowBudget then apply without change.

Dependency ledger (source-matched, not elaborated): C ->
ribet_columns -> ribet_first_order -> HasTriangleCost ->
hasTriangleCost_tateTwist -> crysCocycles.apply_eq_zero_of_cyclotomicGp,
IsPrimeTriangle.step/coboundary, IsNewPlaces tame removal;
ribet_columns -> exists_length_shaOdd_le ->
exists_isStickelbergerBound, nsmul_component_eq_zero,
exists_detecting_points_component, exists_detecting_points_hom,
local power index and class number. These remain explicit;
the original and reduced graph/axiom artifacts unchanged.
No new native obligation retired or replacement kernel-certified.

Execution: command -v lean/lake/elan returned no paths.
Old engine receipts re-read: 45577239749 status pass
(blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc), 45576756833
status pass (7da354941e402b6f8b364ed03d8c5c82d27b7717).
Different original toolchain; no rh_prune/rh_scan/rh_reduce/
rh_auto/rh_auto_frontier executed on this compact proof.
Compact run 45803534769 detailed status error (a56e2d3a),
targeted_results.json 088cd2ec: six named original theorem
checks, standard three axioms, A build timeout 124, overall
all_requested_checks_ok=false; workflow wrapper success is
not a full replay. No fresh native PASS. The probes below
are prepared for shared replay; no synthetic finite tests.

RESUME HERE: integrate sections 1–5 directly into the C
arithmetic chain. Independent audit check the component
cocycle formula and bad-prime nondivision; then reconstruct
the remaining actual IsPrimeTriangle existence step in
TrianglePrimes (ordered recursion and the two exponent
payments) together with the primitive reciprocal law
supplier. The deep odd component bounds in ComponentBound
367–end remain to be derived or matched to exact published
theorems with a cocycle-level bridge. Preserve those leaves
and the local Bloch–Kato annihilation theorem.
HANDOFF TO integration, human editor, literature, formal
audit and compact replay. No URT, no import of final RH.
-/

namespace RHGaloisRun63

theorem cocycle_conjugation_scalar {R : Type*} [CommRing R]
    (u v x y : R) :
    x + u*y - v*x = u*y + (1-v)*x := by ring

theorem triangle_payment {R : Type*} [CommRing R] (C q d z : R)
    (hc : C = q * (4*d^2)) (h : (4*d^2)*z = 0) :
    C*z = 0 := by
  rw [hc, mul_assoc, h, mul_zero]

#print axioms cocycle_conjugation_scalar
#print axioms triangle_payment
#check add_conjGal_mem_evenClasses
#check hasTriangleCost_tateTwist
#check IsNewPlaces.cycInv_withConjInv
#check IsNewPlaces.mem_selmerModule_of_tame_eq_zero
#check crysCocycles.apply_eq_zero_of_cyclotomicGp
#check exists_detecting_points_cocycles
#check exists_length_shaOdd_le
#print axioms hasTriangleCost_tateTwist
#print axioms exists_length_shaOdd_le

end RHGaloisRun63
