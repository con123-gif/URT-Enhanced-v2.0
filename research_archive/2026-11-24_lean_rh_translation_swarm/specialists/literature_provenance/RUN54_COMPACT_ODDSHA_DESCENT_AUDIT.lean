import Lib.Cyclotomic.OddSha.OddShaBound
import New.Selmer.FitTwistsExist

/-!
RUN54, 26 Nov 2026. Independent source-matched human audit of RUN50–53,
including the exact nonunit cancellation and descending Kolyvagin argument.
Native audit PREPARED; no new native verification of these human arguments.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Upstream latest observed at same pin. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb,
manuscript 65e891f727a8e97c821570e0d86b22b9daadbb4e. Reviewed recent
peer 6880d1d11d4e9cdd3dc408b021eb092a1c98da9c (crystalline graph dual),
12323721132ce760c366dc4c0aa6abb91ecac036 (B separation),
c7a92f2d335720b35cd9ef789f231a004dba5540 (Galois row guards),
b0ec37d0b4aab414340ea3fb8026bd923df7998d (character matching),
fb6ac5c3a494526fd839f0ae6336c762552f4cdc (triangle interface).
Do not duplicate those primitive audits or redesign the determinant.

SOURCE LEDGER (actual body edges):
Lib/Cyclotomic/Voronoi/StickelbergerInteger.lean 8745d5ed91856758a39027c95fbc0b97087005be
  IsStickelbergerBound, exists_isStickelbergerBound.
Lib/Cyclotomic/Kolyvagin/Components.lean fbd540929083786c70247cfeace76a5ae9454547
  component uses INVERSE character, vanishes at c and specified local groups.
Lib/Cyclotomic/Kolyvagin/ComponentBound.lean 61d0f229eda03e81c8d89372f05f7444ca45b09b
  lines 196–232 subgroup lemma, finite_vanishingCocycles;
  321–336 exists_frob_notMem; 337–361 sum_floorDiff_dvd;
  367–382 nsmul_component_eq_zero; 387–453 exists_detecting_points_component.
Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195
  lines 19–69 detector, 79–135 uniform length.
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14
  lines 40–50 uses the common integer under the finite prime sum.
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05
  consumes the same fit family. No claimed native graph deletion.
RUN50 cb24b90f715d8cc3f0e6c73a58ae48dd8efefe76;
RUN51 1a8c4166623f7b3ae55fe1606e013abe0415ddfd;
RUN52 aa9f09ebbb9745fb7946eb3117451d2e19da0f15;
RUN53 d56257261b0af061e9267afcea01d81be60fc804.
All original evidence preserved. This audit is complementary to the
peer descending derivation referenced by RUN51, and exposes its exact
finite-level quantifiers and use of the SAME auxiliary family.

1. NONUNIT REMOVAL WITHOUT DIVISION BY l.
Fix N>=1, e>=1, prime l, n>=1, O the actual p-adic integer ring,
psi(-1)=-(-1)^e, c=1 mod N prime to l, and the integer X from RUN50.
Write f=N*l^n, F_n=sum_(0<=a<f) floor(c*a/f)*a^e*psi(a).
The native Stickelberger property supplies a SINGLE w for ALL n:
(c^(e+1)-1)X=2w F_n mod l^n. Use it also at n-1 (including n-1=0,
where the congruence mod 1 is automatic). Split the sum by l|a;
psi kills nonunits at N. Exactly
U_n=sum_(a in (Z/f)^*) floor(c*a/f)*a^e*psi(a)
    =F_n-l^e psi(l) F_(n-1).
Since e>=1, multiplication of the lower-level congruence by l^e
raises its precision to l^n. Subtract BEFORE taking any norm:
(1-l^e psi(l))(c^(e+1)-1)X=2w U_n mod l^n.
Reindex a -> -a; weights change sign in O/l^n, including at l=2.
Thus S_n=sum_units floorDiff c(a/f)*a^e*psi(a)=2U_n in O/l^n.
The factor 1-l^e psi(l) is a unit because l is nilpotent in the
quotient. Therefore S_n divides (c^(e+1)-1)X. This is exactly the
native sum_floorDiff_dvd. No division by 2 or l, no assumed
invertibility of psi(l), no assumption l is prime to N. At n=0 the
quotient is zero and the assertion is automatic.

2. SUBGROUP DETECTION AND ANNIHILATOR.
If z is a locally constant character cocycle with z(gamma)=0 and
(chi(gamma)-1)z !=0, its zero subgroup cannot contain G_Q(mu_f)
for ANY f. Otherwise it factors through the abelian cyclotomic
quotient and comparing z(gamma*g) and z(g*gamma) gives a contradiction.
The zero subgroup is open by local constancy and closed as a subgroup.
For two such proper restrictions to G_Q(mu_f), their union is proper:
if neither contains the other, the product of an element from each
exclusive difference is in neither; if nested, use the larger.
Chebotarev applied to the nonempty open complement, allowing a
choice of place over the prime to obtain the actual conjugate,
gives a split prime and Frobenius outside BOTH subgroups. Retain
the finite-prime exclusions. This is exists_frob_notMem, not
a density assumption or a uniform least-prime estimate.

For x in component with 4X^2 x !=0 take z=2X^2 x and gamma=c_m
(complex conjugation). Its inverse-character value is -1 and
z(c_m)=0; the subgroup argument works even at l=2 since the
assumed nonzero is exactly -2z. Choose a from the first
Stickelberger conjunct, then p split at N*l^nu detecting z.
The Jacobi construction RUN53 supplies y for artin_law_component;
p is split, y lies in Q(mu_(N*l^nu)), its valuations there are
floorDiff a, and at other finite places it is a unit. The fact
y lies in the field also follows from equivariance: the kernel of
the cyclotomic character mod N*l^nu fixes the SAME J(x).
RUN51 Artin law gives S_n*2(a^e-1)x(phi)=0. Section 1 and
(a^e-1)(a^(e+1)-1)|X give 2X^2 x(phi)=0, contrary to detection.
Thus 4X^2 kills every component, with the native small-prime factor
retained. No extra conjecture.

3. EXACT LARGE-PRIME DESCENT (not inferred from a finite test).
Assume l>N+e+3, X!=0, nu arbitrary, m=v_l(X)+1.
Choose a=1 mod N whose reduction is a generator of F_l^* by CRT.
The inertia element gamma of exists_inertia_cycPowDirichlet_eq has
chi_+(gamma)=a^(e+1), chi_+=cyc_l^(e+1)psi.
Both a^e-1 and a^(e+1)-1 are units at l, since 0<e<e+1<l-1;
phi(N*l) and 2 are units too. The exact finite module for derivatives
is O/l^m (NOT O/l^nu and not an arbitrary quotient depth).
Let Z be the finite set of nonzero component cocycles in O/l^nu
killed by l. Let Y_T consist of chi_+-cocycles in O/l^m vanishing on
inertiaOff(N,l,T); write Y=Y_empty. These finite BASE sets Z,Y
are provided by finite_vanishingCocycles (finite coefficients and
finite ramification; no bound on their cardinalities needed).
One human finiteness argument: pass to the finite cyclotomic field
where the character acts trivially, restrict to the unramified-off-S
abelian pro-l quotient with finitely many generators by local units
and finite class group, and adjoin finitely many coset representatives.
Each locally constant map into the finite coefficient module is then
determined by a finite list of values. This does not require Leopoldt.
For a split prime r (r=1 mod N*l), say v(r,x) when x vanishes on
all decomposition groups over r. On Z it is equivalent to x(phi_r)=0
for one selected Frobenius, because inertia is killed, the action on
l-torsion at these decomposition groups is trivial, and conjugation
transports zeros.

Define J(T) to mean all r in T split mod N*l and
Y_T[l] subset Y. Suppose there is NO detecting family of m points
for the component in O/l^nu. For every T with J(T), |T|<=m, use the
selected Frobenii (pad to m points) to obtain a nonzero component
cocycle killing them. Multiply by the highest power of l leaving it
nonzero to get x_T in Z. It satisfies v(r,x_T) for every r in T.
For any split q with not v(q,x_T), q is new and J(T union {q})
follows from RUN51 mod-l reciprocity: every l-killed y in Y_(T+q)
kills inertia at q (the old T decomposition groups killed by x_T),
then J(T) removes T. This uses the actual same x_T, not an
arbitrary detector independent of the reciprocity hypothesis.

For each pair (y,x) in finite Y x Z with G_Q(mu_(a*N*l^m))
not contained in ker(y), use section 2 to choose a split q
detecting both y and x and q=1 mod a*N*l^m. For x the subgroup
criterion always holds because l is odd and x(c_m)=0.
Let Q be the finite set of these selected primes, fixed BEFORE
choosing p. From J(empty) select x_empty as above and choose p
split mod N*l^m*prod(Q) detecting x_empty. Then J({p}) holds.
In particular p is not in Q. Apply RUN52 to this one finite set Q,
p, gamma, c=a and depth m. Obtain all kappa_S, S subset Q,
at once: kappa_S in Y_({p} union S), kappa_S(gamma)=0, and exact
Frobenius-to-inertia transition for each q in Q-S.

Descending induction i=m,...,0 proves
  |S|<=i and J({p} union S) => l^i kappa_S in Y.       (I)
Base i=m: coefficients are killed by l^m. For i<m put T={p} union S,
w=l^(i+1) kappa_S. By induction w in Y. If w!=0, w(gamma)=0
and chi_+(gamma)-1 is a unit, so the subgroup criterion applies
to w. Also |T|<=i+1<=m. The previously fixed Q contains a prime q
chosen for the pair (w,x_T), with w(phi_q)!=0 and not v(q,x_T).
Thus q notin T and J(T union {q}). The transition at the same
Frobenius gives l^(i+1) kappa_(S+q)(tau)=w(phi_q)!=0.
But |S+q|<=i+1, so induction puts that cocycle in Y, forcing its
value on inertia at q to be zero. Contradiction. Therefore w=0.
Now l^i kappa_S belongs to Y_T[l]; J(T) puts it in Y, proving (I).
At i=0,S=empty, J({p}) gives kappa_empty in Y, so it kills
inertia at p. RUN52 bottom identity, with chi_+(gamma)-1 a unit,
gives S_m=0 in O/l^m.

Apply section 1 with the l-primary projection l^v_l(X) of X in
place of X in the FINAL divisibility conclusion only: from
S_m | (a^(e+1)-1)X, and both a^(e+1)-1 and X/l^v_l(X) units,
obtain X's l-primary projection zero in O/l^m. Equivalently
l^m divides l^v_l(X) in O, impossible by the DVR valuation.
This contradicts failure of detection. The native theorem therefore
has precisely v_l(X)+1 points, independent of nu and coefficient
ramification in NUMBER (the chosen points may depend on them).
No substitution of X's projection into IsStickelbergerBound itself.
No numerical evidence for the existence of this family is needed.

4. ALL-PRIME COMMON BUDGET AND ACTUAL CONSUMER.
For E CM in Q(mu_N), t natural, y=N+t+3 and 0<e<t,
RUN51 Fourier identity gives A_e=16 phi(N) X_e^2 annihilating
shaOdd, with every l and every O/l^nu preserved.
At l<=y^2, RUN52 uniform ray-class detector has at most
M^2+4M<=y^10+4y^5<=y^20 points, M=N*l^2.
At l>y^2, section 3 applies; transport all phi(N) representatives
and phi(N) characters as in RUN51: at most
phi(N)^2*(v_l(X_e)+1)<=y^2*(y^6+1)<=y^20 points.
This includes the case v_l(X)=0 (one point per component).
Inject into the direct sum of the A_e-annihilators of O/l^nu,
whose length is <=v_O(A_e) each. For e=0 the unramified
class-field argument gives length<=v_O(h_E). The single integer
  H=h_E * product_(0<e<t) (16 phi(N) X_e^2)^(y^20)
has length(shaOdd)<=v_O(H) for all native primes, e<t, nu and O
with HasEnoughRootsOfUnity O exponent((Z/N)^*).
It satisfies H<=2^(4y^27)*h_E by RUN50. Empty product for t<=1.
The real prime sum in FitTwistsExist uses the *same* H:
for every finite set T of primes sum_(l in T) v_l(H) log l
<=log H by integer factorization, not a separately chosen H_l.
This establishes the arithmetic budget interface of C at the human
level conditional on the explicitly reconstructed RUN50–53 inputs
and accepted classical CFT/Kummer/Chebotarev/local facts.
The row and local crystalline/reciprocity/balanced primitive
suppliers remain independent obligations. No new unconditional RH
or native theorem claim. Old graph: all source body edges above.
Reduced human graph: one uniform Stickelberger integer -> unit
restriction -> Artin annihilation + finite derivative descent ->
Fourier + small-prime/weight-zero -> common length -> fit-family
budget. No kernel graph equivalence claim.

PROVENANCE: Rubin, Kolyvagin's System of Gauss Sums (1991), pp309–324,
DOI 10.1007/978-1-4612-0457-2_14, publisher abstract rechecked:
class group structure, NOT by itself the native finite-level twisted
cocycle theorem. All component/odd-Sha statements above have actual
proof bodies, not literature axioms. Standard Chebotarev, Kummer,
CFT are explicit mathematical foundations, not RH. Earlier RUN50–53
bibliography retained; no claim of independently checking every
transitive axiom or every cited page.

EXECUTION: exact JS regressions executed for section 1 partition and
odd congruence (1158 cases) and all three scalar budget inequalities
(997 values y=4..1000). Principal character, N=1..16,
l=2,3,5,7,11; n=1,2; e=1,3,5; c=1+kN, k=1..3, gcd(c,l)=1.
Compute F_n,F_(n-1),U_n,S_n as above using integer arithmetic and
assert F_n-l^e psi(l) F_(n-1)=U_n, S_n-2U_n divisible by l^n.
These only check the algebra, not the descent or CFT. No surrogate
representation matrices. Actual CI evidence independently read:
45799225653 targeted_results.json 23de197bd48f404ca2074c69676de289c4f7934e
all requested checks true, none of these odd-Sha declarations.
45803534769 RUN29 targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804:
TiltingLemma and Filling.Moments three named declarations each
have only propext, Classical.choice, Quot.sound; module_1_build
returncode 124 after 2700.11s; all_requested_checks_ok=false.
State status.json a56e2d3afb99ed8275e81fd63c8494306e57c43f says error.
GitHub job wrapper itself says success, but that does NOT mean
the requested native checks all succeeded. No new native PASS.
Existing compact shared runner requested; old rh_prune/rh_scan
engines not reusable evidence across source/toolchain pins.
Following commands prepare exact native audit, not proof replay
of human text.

RESUME HERE: send combined RUN50–54 to editor as one common
odd-Sha length supplier, with no repeated budget assembly. Independently
check the primitive crystalline graph-to-dual audit 6880d1d1 at its
actual local-defect consumer, focusing on the first unmatched
standard theorem (not rederiving graph algebra). Preserve unresolved
primitives and independent CI evidence, no protected edits.
HANDOFF TO integration/editor, C mathematics, formal audit, existing
shared native runner.
-/

#check sum_floorDiff_dvd
#check not_cycloGalGroup_le_zeroSubgroup
#check finite_vanishingCocycles
#check exists_frob_notMem
#check nsmul_component_eq_zero
#check exists_detecting_points_component
#check exists_length_shaOdd_le
#check exists_isFitFamily
#print axioms sum_floorDiff_dvd
#print axioms nsmul_component_eq_zero
#print axioms exists_detecting_points_component
#print axioms exists_length_shaOdd_le
#print axioms exists_isFitFamily
