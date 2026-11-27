import New.Lift.LongGap

/-!
RUN70 — source-matched human reconstruction, 27 November 2026.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
current manuscript 963e42122931b8e534c39765bb2a7422b2c557d7.
Read latest Galois RUN70 c1a9b107 (initial power and chart;
do not duplicate), peers 01809db9, 784d021e, f355e707,
9474467c, 59c0332f, 14196cf5 and prior literature RUN69.
No RH or URT premise. No new external theorem substitution.

Native source paths below relative to grh-compact/src:
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141
105–120 exists_extend_form; 132–151 strictness;
153–163 initial point; 165–195 reaches; 197–206 costs.
New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046
41–48 improvedExponent; 54–75 exists_reaches_depth_succ;
120–132 coordinate preservation.
New/Lift/ExponentLattices.lean 0549f09387b53f33790c7af7fc923fa71ca347dd
88–97, 166–176, 197–242, 256–259.
Lib/PadicHodge/WachKisin/FrameTheorem.lean
57d6daa6060f9f00eb27be6525460ba942a73f08
exists_functional_extend, frame_theorem.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487
120–148 exact lift and derivative (retain latter for Galois).

1. Invariant functional extension with the SAME integral bound.
Let Y be the kernel lattice, C the trivial quotient of the actual
crystalline extension E=Y⊕C with g(y,c)=(gy+alpha(c)(g),c).
Take an invariant functional mu of Y and a B_dR^+-submodule W
with mu(1⊗Y) contained in W. Extend mu on lattice generators to
a B_cris-linear map Lambda into B_dR by base change; invariance
on generators implies equivariance on B_cris⊗Y by semilinearity.
For each c, the native crystalline cocycle supplies v_c in
B_cris⊗Y with g v_c-v_c=alpha(c)(g) on the chart subgroup.
Therefore g Lambda(v_c)-Lambda(v_c)=mu(alpha(c)(g)) is in W.
Use the ACTUAL retained BdR.exists_sub_mem_of_smul_sub_mem
for this subgroup and W, yielding a fixed scalar a_c in the
local field such that Lambda(v_c)-a_c is in W.
Choose v_c,a_c only on a Z_p basis of C (C finite free by
native GalLattice); extend the corrected values linearly to
b:C→B_dR. No claim the original choices are linear.
Then g b(c)-b(c)=mu(alpha(c)(g)), and b(C)⊂W.
On the extension put nu(y,c)=mu(y)+b(c), extending to the
native functional by exists_functional_extend on C.
The precise invariance cancellation is
  nu(g(y,c))=g mu(y)+mu(alpha(c)(g))+b(c)
            =g mu(y)+g b(c)=g nu(y,c).
Both summands on integral lattice generators lie in W,
hence on their A_inf span as A_inf acts through B_dR^+.
Restriction of nu to Y is exactly mu, not merely a congruence.
The native local-field approximation and B_cris coboundary
are retained suppliers; no use of generic exactness of an
integral Breuil–Kisin functor, which would not imply this
filtered extension. Source related-literature names are not
used as unproved wrappers.

2. Strictness at all actual exponents, LongGap 132–151.
Write j:Y→E, pi:E→C. If w is in withExponents(i,o) for E
and pi(w)=0, exactness of tensoring the split underlying
Z_p sequence gives w=j(y), uniquely, with y=wittFst(w).
This is split on the underlying modules, NOT a Galois
splitting. The letter projector commutes with j; injectivity
gives P_i(y)=y. To check the integral saturated ambient
condition, clear the finite product of Frobenius-E
denominators that occurs in w∈kisinLocAinf. In kisinAinf
the remaining tau-saturation condition transfers by wittFst
on the underlying A_inf lattice. Every invariant functional
test on the kernel is obtained by extending a form using
section 1 with W=top; its evaluation on j(y) equals its
evaluation on y. The same applies after inverse Frobenius.
Consequently y satisfies the kisinAinf tests, and undoing
the same finite denominator gives y∈kisinLocAinf of Y.
For the sharper type-u condition at a, take an invariant
mu of that type and use mu composed with the corresponding
letter projector on Y. Its values on integral lattice
generators are in W=t^(-u)B_dR^+. Section 1 extends this
form with the SAME W on all of E. It is therefore a type-u
test at that letter after composition with its projector.
On the inverse-Frobenius translate of y, that projection is
the identity (letter shifted by a); equivariance of j
identifies evaluation with the native test on w. Thus
  valueAt(a,mu,y)=valueAt(a,nu,w)∈t^(o(a,u)) B_dR^+.
No lost power of p, no loss of one Hodge level. The case
u=0 and negative exponent o are covered by the same W.
For y∈kisinLocAinf the coordinate retraction preserves
j, as shown next. If w∈kisinLoc, then R_E(w)=w so
j(R_Y(y))=w=j(y). Injectivity gives y=R_Y(y)∈kisinLoc.
This supplies the exact strictness statement with both
the integral and local clauses, conditional on retained
frame tests and functional extension inputs above.

3. Coordinate retraction and exact naturality.
On A_inf·N (N=kisinLoc), any expression x=Σ a_j x_j with
x_j∈N has R(x)=Σ coord_0(a_j)x_j. The frame relation
clause for S-linear coefficient maps proves that any
relation Σ a_j x_j=0 implies the corresponding relation
with coord_0. Thus R is independent of the expression,
S-linear, and the identity on N since coord_0(1)=1.
For an equivariant lattice map F, native preservation of
N and A_inf·N makes the exact computation
  F R(x)=Σ coord_0(a_j) F(x_j)=R'(F x).
This proves naturality, not just on the generating lattice.
The additional valuation preservation needed for R is
the actual sum_map_mem_of_valueField condition of the
chart coefficient map, retained: if valueAt(a,mu,x)-v
lies in Fil^n and v is in valueField(a), apply it to the
coefficient expression above with the extra term -v
having coefficient 1. Hence R(x) has the same congruence.
Setting v=0 and using naturality with mulZeta proves
preservation of withExponents(i,o). This is the precise
coordinate lemma used by the actual B operator; no arbitrary
S-linear retraction is asserted to preserve filtration.

4. The common depth walk uses composition, not a fresh
point or operator per letter. Let D_i(o)=deepElements,
K_i(o)=locKisinPart(kerWithExponents). K⊂D because
projection zero and equivariant exponent module stable
under differences. If A reaches at e, then A x-p^e x∈K
for x∈D; in particular A preserves D and every submodule
P containing K for x∈P∩D. For B reaching at f,
  BAx-p^(e+f)x =
    [B(Ax)-p^f Ax] + p^f [Ax-p^e x] ∈K.
This proves the composition budget without multiplying
rank, number of Galois generators or number of letters.
Use actual single-step family t_j,upsilon of
exists_reaches_depth_succ(a,n), uniform over x and mu, and
  B(x)=p^cost(a,n)x+
      Σ R_E(upsilon*(t_j x-x)/(zTau)).
For x deep, each divided difference keeps its exponents
by smul_sub_mem_zTauUnit_smul_of_deep and has zero quotient
because pi(x) is the invariant constant at i. R preserves
both properties (section 3). Thus B reaches at this cost,
uniformly for all i,o,x.
Induct on the finite set I of required steps (a,n), taking
one with maximal n. To reach target d, replace d(a,u)=n+1
by n at the chosen a, leaving all other coordinates.
Every required step from starting c to the intermediate
profile is in I minus the chosen step: if that chosen
step were still needed and target were >n+1, then n+1
would also have been required at that coordinate,
contradicting maximality. If the initial depth is already
above a target, no step is required. The induction provides
A to the intermediate profile; B preserves it. For each
coordinate actually lowered, the Galois differences at
level n imply the associated value of Ax is congruent to
a local-field constant modulo Fil^n, by the same retained
BdR local approximation. The native one-step theorem
makes the value of the unretracted B-expression constant
modulo Fil^(n+1). Section 3 preserves this congruence under
R. Subtracting its g-translate removes the fixed constant,
so the Galois differences of BAx lie in Fil^(n+1).
This establishes the actual depth condition d. Base I=empty
uses identity and monotonicity, with no required strict
increase. The cost is exactly Σ_{(a,n)∈I} cost(a,n);
retain the native single-step theorem (including n=0),
its uniformity, and the local congruence hypotheses.

5. Actual point consumer, LongGap 197–206.
Starting x over p^e c with absolute exponent o1 and
depth o, let total cost t and e'=e+t+s, s≥0. Apply the
same operator A to p^s x. For absolute exponent o1,
the input is also deep for o1 by stable differences.
The reach error therefore lies in the o1 exponent module
and in ker(pi), so output has absolute o1 and quotient
p^t pi(p^s x)=p^e' constantAt(c). The walk raises the
depth to o'. Apply mem_withExponents_of_deep to combine:
if a scalar value initially in Fil^l and congruent to a
fixed field element modulo Fil^h, then it lies in
Fil^min(h,0) if l≤0; if l>0 it lies in Fil^h.
Indeed nonzero local-field scalars have filtration
valuation zero (the embedding is into B_dR, not its
uniformizer ideal). When l>0 and h>0 both conditions force
the local-field scalar to be zero; h≤0 is immediate.
This proves improvedExponent(o1,o'), exactly the caller,
with no extra p cost. All point constraints, same c,
letter, depth and exponent, are preserved. This bridges
the common depth walk to RUN69's four safe conditions;
the proof of actual profile/cut existence and all
four individual pair safety inequalities remains distinct.

Original source-visible graph retained:
OnePlaceDefect -> scaledCupBounds_of_cut_windows /
_of_killsCokernel -> pointsOver_nonempty_of_costs ->
exists_reaches_deep -> exists_reaches_depth_succ /
coordRetract_mem_withExponents / BdR approximation.
scaledCupBounds_of_points_at_cuts -> isSafe_of_exponents ->
exists_inclKer_eq_of_projTriv_eq_zero -> exists_extend_form.
Human reduction: filtered extension + exact coordinate
naturality + one common endomorphism composition + exact
point projection. No global graph edges declared retired.
Context cache key: compact pin, SAME chart, lattice and
letter, same c, absolute/depth profiles, I, t_j, upsilon,
p and exact cost. Original/reduced DAG and axiom records
preserved. Related 2026/2024 literature in LongGap header
not promoted to axioms or exact substitutes.

Execution: local command -v lean/lake/elan empty. Executed
SymPy expansion q*(p*x+a)+b-p*q*x-(q*a+b)==0, exact zero
(scalar composition only, not a kernel certificate).
Actual state branch artifact reread:
compute/rh-compact-primitives-replay-20261126/outputs/
targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804.
Six previous native TiltingLemma/Moments checks list only
propext, Classical.choice, Quot.sound; module_1 build
timed out 124 at 2700.11s; all_requested_checks_ok=false,
full_RH_replay=false. No new native PASS, no compact
rh_scan/prune/reduce/auto/frontier run. Old-pin successes
do not verify this pin. Prepared scalar certificate and
actual native probes below; not compiled.

RESUME HERE: independently audit this strictness and depth
bridge, then derive actual LongGap.isSafe_of_exponents
244–263, with its third-side Tate exponents and precise
positive filtration implication. Check Galois RUN70 before
touching CokernelKillers derivative, which that lane owns.
Retain exact one-step construction and chart coefficient
valuation supplier; no closure claim for them. HANDOFF TO
integration/editor, Galois, audit and compact native runner.
Human RH reconstruction remains incomplete.
-/

namespace RHLiteratureRun70

theorem exact_reach_composition {M : Type*} [AddCommGroup M]
    (A B : M →+ M) (x : M) (p e f : ℕ) :
    B (A x) - (p^(e+f)) • x =
      (B (A x) - p^f • A x) + p^f • (A x - p^e • x) := by
  rw [pow_add, nsmul_sub, smul_smul, Nat.mul_comm (p^f)]
  abel

#print axioms exact_reach_composition
#check Lift.KummerChart.PairingSide.exists_extend_form
#check Lift.KummerChart.PairingSide.exists_inclKer_eq_of_projTriv_eq_zero
#check Lift.KummerChart.JumpLattice.Hom.map_coordRetract
#check Lift.KummerChart.JumpLattice.coordRetract_mem_withExponents
#check Lift.KummerChart.PairingSide.exists_reaches_deep
#check Lift.KummerChart.PairingSide.pointsOver_nonempty_of_costs
#print axioms Lift.KummerChart.PairingSide.exists_extend_form
#print axioms Lift.KummerChart.PairingSide.exists_inclKer_eq_of_projTriv_eq_zero
#print axioms Lift.KummerChart.PairingSide.exists_reaches_deep
#print axioms Lift.KummerChart.PairingSide.pointsOver_nonempty_of_costs

end RHLiteratureRun70
