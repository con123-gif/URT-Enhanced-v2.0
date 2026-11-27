import New.Lift.LongGap

/-!
RUN72 — exact filtered coefficient induction, projection lift and depth
improvement at the long-gap caller. 27 November 2026.
Human source-matched proof, conditional on the explicit native suppliers
below; prepared scalar certificates, not compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10
(completion-first compact branch), manuscript 29820c25acc91450aa8ec712774b57b3d0051c41,
protocol, handoff, expansion, AGENTS and continuity.
Latest commits observed 08451434, 6c46fb6e, 968a30c3, 577605fc, afa6e648,
2e613067, 47dd3858, 2a198f50, 72775cce, 392d881d, 2057d58e, 30a40eef,
5512bf37, 30859704. Actual Galois RUN72 diff inspected: scalar monomial
and E-power descent, not duplicated. RUN56 (19f8696a) already gave the
long-gap proof outline and retained filtration improvement as a supplier.
Here supply the missing improvement proof, precise induction and
quantitative frame-to-coefficient interface. This is refinement/independent
audit of that outline, not a second claimed closure.

Sources relative to grh-compact/src:
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141
  412–425 shiftedStd and constantsModE;
  430–448 coeff_mem_constantsModE;
  453–458 letterProj_mem_constantsModE;
  463–496 pointsOver_nonempty_of_long_gap.
New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046
  33–46 improvedExponent, mem_withExponents_of_deep;
  148–171 mem_withExponents_stdExponent_iff.
New/Lift/ExponentLattices.lean 0549f09387b53f33790c7af7fc923fa71ca347dd
  92–108 locLetterPart and localized E-unit; 155–161 shift lemma;
  166–172 equivariance and difference.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487
  57–68 constantAt, liftIdeal, KillsCokernel;
  106–127 Frobenius transport and localized integral lift.
Lib/PadicHodge/WachKisin/FrameTheorem.lean 57d6daa6060f9f00eb27be6525460ba942a73f08
  52–61 quantitative frame statement and actual proof 62 onward.
New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395
  215–235 actual long-gap consumer; then Frobenius transport, depth costs,
  HasDeepPoint and RUN71/RUN69 cup endpoint.

1. Close the filtration improvement bridge used in RUN56.
For a fixed letter i, index a, tested allowed jump v and applicable
invariant form of type u (v<=u), put x=mu(phi^(-a)X),
m=lo(a,v), n=hi(a,v). Do not collapse to a single highest-weight form.
The native valueAt_smul_sub rewrites depth as
  g x - x in Fil^n B_dR for every g in Gamma'.
Use exactly BdR.exists_sub_mem_of_smul_sub_mem for this group and
Fil^n, giving c in the algebraic fixed field with x-c in Fil^n.
This approximation is an explicitly retained supplier (not inferred
from invariance of a residue class or from arbitrary complete-field
descent). Every algebraic c lies in Fil^0, and its intersection with
Fil^1 is zero: the coefficient-field embedding of QpBar is a field,
so a nonzero element and its inverse both belong to B_dR^+ and are
units. This is the native qpBar_mem_hodgeFil_iff.
If m>0 and n>0, c=x-(x-c) lies in Fil^min(m,n) subset Fil^1, so c=0
and x lies in Fil^n. If m>0 and n<=0, c in Fil^0 subset Fil^n, again
x lies in Fil^n. If m<=0, x lies in Fil^min(n,0) by adding c.
Thus the new exponent at EVERY tested jump is
  min(n, if m>0 then n else 0).
The underlying kisinLocAinf and letterPart membership is unchanged.
This supplies the complete pointwise filtration argument for
mem_withExponents_of_deep under the actual fixed-field approximation,
without a positivity inference from just one functional. It works
for negative n and the zero boundary. No new literature premise.

2. Exact coefficient lemma, with simultaneous induction on arbitrary
profiles and all coefficient vectors (not on a fixed relation).
Write S for the chart ring, E its Eisenstein element, Lambda=W(Fq).
Fix l>0 and A>=0; C_A is constantsModE(l,A,i).
Let F(o) denote withExponents(i,shiftedStd(l,o)).
At a=0 the standard exponent is 0; at a>0 it is stdExponent(l).
C_A is a Zp-module and stable under multiplication by Lambda:
the native Galois monoid fixes Lambda, so the difference of wX
is w(gX-X), and locLetterPart is an S-module. We do NOT assert
C_A is stable under arbitrary S coefficients.
Choose the actual chart splitting r=w(r)+E t(r) for every r in S.
No additivity of either chosen splitting map is needed.
Let D= sum r_j X_j - f(E)c in F(o), X_j,c in C_A, o(u)<=A.
Since f=f_0+X divX(f), write the exact identity
  D=D_0+E D_tail,
  D_0=sum w(r_j) X_j-f_0 c,
  D_tail=sum t(r_j) X_j-divX(f)(E)c.
Both D_0 in C_A and D_tail in locLetterPart by the above two
separate stability statements. Thus E D_tail in F(1), by the
localized E-unit shift lemma. Subtraction gives D_0 in F(min(1,o)).
At a=0 apply section 1 with lo=min(1,o(u)), hi=A. The result is
A if o(u)>0, else 0 (A>=0). At a>0 both lo and hi equal the
standard exponent s; the improvement gives s whether s>0 or s<=0.
Hence D_0 in F(threshold_A(o,0)) with threshold_A(o,n)=A if
o(u)>n and 0 otherwise. It dominates o by o<=A, including o<=0.
Consequently D-D_0 in F(o). Divide by the E-unit in W(Cflat)
(which preserves kisinLoc and the letter), shifting ONLY the a=0
profile to o-1. This yields D_tail in F(o-1).
For n+1 apply the induction hypothesis to t(r_j), divX(f), o-1.
The profile still satisfies o-1<=A; the new threshold is
o-1>n iff o>n+1. Polynomial coefficient (divX f)_n=f_(n+1)
and the chosen iterate t^n(t(r))=t^(n+1)(r) identify the
extracted relation exactly. For every n the resulting D_n is in
C_A and F(threshold_A(o,n)). No powers of p are charged at any
coefficient step. This fills the full signed-profile induction,
not just the Nth coefficient of a polynomial with coefficients
assumed integral in an unspecified completion.

3. Actual quantitative frame interface and projection.
At level l the native frame clause supplies finite S-span
membership of p^(4delta) x in vectors y in valueFieldPoints
(frobKisinAinf l) whose EVERY invariant form value is fixed
modulo Fil^A, provided 3e<=p^l and eA<=p^l delta.
The letter projection of each y lies in C_A: use
letterProj_mem_of_valueFieldPoints for locLetterPart; all its
Galois differences already have standard profile. At a=0,
precomposing a form by letterProj remains an invariant form,
so the supplied depth A applies. At a>0 nothing is raised.
This proves the claimed letterProj_mem_constantsModE bridge with
l>0 essential. Projection to the trivial lattice is compatible:
compose its forms with projTriv and use Hom.wittMap_mem_frobKisinAinf,
so the same projected vectors satisfy the trivial-lattice contract.
The constant c_i=constantAt(i,c) is in locLetterPart and is fixed
by the chart Galois monoid, hence in C_A for any A.
Retain the native radius_lemma and full frame theorem hypotheses;
ordinary Kisin finite-height existence alone gives no p^(4delta)
quantitative span assertion.

4. Close exact lift at the actual long-gap consumer.
Keep l>0, unramified, old cut annihilator p^kappa at i.stepBack(l),
current annihilator E^s at i, upper jump g>=0 at each a<l,
N=s+g sum_{a<l}p^a<A, 3e<=p^l, eA<=p^l delta.
The native pointsOver_nonempty_of_killsCokernel gives y over c_i.
As in RUN56, f(X)=X^s prod_{a<l}((X-p)^(p^a)+p)^g is monic
degree N, f(E)y has profile g-u at a<l and -u elsewhere.
Indeed E_a=(E-p)^(p^a)+p in the unramified chart; exact E shifts
restore the initial s and add g at each intermediate index.
By u<=g there, the vector has the standard profile (weaker).
It is in kisinLoc, hence satisfies valueFieldPoints required
by the frame clause (same underlying vector and value fields).
Write p^(4delta) f(E)y=sum_j r_j X_j using the actual quantitative
frame clause, after letter projection. All X_j in C_A by section 3.
Use section 2 at order N with c=0 and o(u)=min(A,g-u).
It gives B=sum w(t^N(r_j))X_j in C_A with threshold profile.
At E that profile dominates min(A,-u-N): if the latter is positive,
g-u>N and A>N, so threshold is A; otherwise threshold is >=0.
At all other indices both are the standard level-l profile.

Apply the SAME coefficient splitting and order N after the
projection pi=projTriv.wittMap, now with f scaled by p^(4delta),
c_i and o(u)=A. The relation before extraction is IDENTICALLY
zero since pi(y)=c_i. All input vectors have the trivial-lattice
C_A contract by section 3. Monicity of f and N<A therefore give
  D=pi(B)-p^(4delta)c_i in F_triv(A).
In particular E^(-A)D lies in the level-l trivial locLetterPart,
by the exact shift and localization (not by assuming S[1/E]
coefficients are integral). The old cut hK, transported by
phi_pow_mem_liftIdeal_iff l, gives p^kappa in liftIdeal(0,l,i).
Use exists_lift_of_mem_liftIdeal on this very E^(-A)D to get V
in the extension's level-l locLetterPart with
  pi(V)=p^kappa E^(-A)D.
The modulus is ZERO, so there is no t-error term.
Set X=p^kappa B-E^A V.
Then EXACTLY, before taking any valuations,
  pi(X)=p^kappa pi(B)-p^kappa D=p^(kappa+4delta)c_i.
E^A V has profile shiftedStd(l,A) and is in kisinLoc. Its
Galois difference has that same profile by
smul_sub_mem_withExponents (do not assume E is Galois fixed).
Thus X has the desired absolute profile shiftedStd(l,min(A,-u-N))
and depth shiftedStd(l,A) since B belongs to C_A.
No additional exponent, no rank factor, no independent choice
of coefficient extraction on the two sides. This supplies the
actual pointsOver contract, not just a statement about projection.
The source SparseThickLetters.223–225 then transports this
point by the actual t-index Frobenius and pays the existing
depth walk. RUN56 cut guards, RUN70 walk and RUN71/RUN69 safety
remain the separate downstream proofs; their upstream suppliers
must not be silently treated as closed.

5. Original / reduced local dependency ledger.
Original source-visible graph: crystalline_defect_le ->
scaledCupBounds_sparse_thick/two_sizes -> scaledCupBounds_of_cut_windows
-> pointsOver_nonempty_of_long_gap -> frame_theorem.1.2.1,
coeff_mem_constantsModE, letterProj_mem_constantsModE,
exists_lift_of_mem_liftIdeal, mem_withExponents_of_deep,
frobEUnit_zpow_mem_withExponents.
Reduced human route: exact fixed-field filtration argument ->
one simultaneous threshold induction -> SAME projected coefficient ->
one zero-modulus lift and exact projection cancellation.
Keep all shared native nodes, original/reduced graphs and axiom
ledgers intact. Cache key: compact pin, chart, l,A,delta,i,
actual allowed jumps, lattice, chosen splitting w,t, actual
coefficient relation and old-cut ideal context.
Remaining essential suppliers: quantitative radius_lemma/frame
span, fixed-field approximation at all signed filtration levels,
integral E-unit and coordinate/period frame suppliers, general
signed a>0 depth steps, local/global Selmer inputs. No imported
claimed RH conclusion or new published theorem/axiom substitution.
Do not mark the strong chart-specific frame theorem proved merely
because its file labels the general Kisin-lattice topic known.

Execution: local command -v lean/lake/elan returned no paths.
Python/SymPy exact independent controls actually run:
projection cancellation residual 0; 54 monic-degree controls
(p=2,3,5; l=1,2; g,s=0,1,2); 18942 signed integer threshold
controls (1<=A<=11, 0<=N<A, 0<=g<=6, -20<=u<=20), no failures.
Finite controls are not proof of the full p-adic lemma.
Reproduce:
 from sympy import symbols,expand,Poly
 P,B,C,Q,X=symbols('P B C Q X')
 assert expand(P*B-P*(B-Q*C)-P*Q*C)==0
 for p in (2,3,5):
  for l in (1,2):
   for g in range(3):
    for s in range(3):
     f=X**s
     for j in range(l): f*=((X-p)**(p**j)+p)**g
     ff=Poly(f,X)
     assert ff.degree()==s+g*sum(p**j for j in range(l)) and ff.LC()==1
 for A in range(1,12):
  for N in range(A):
   for g in range(7):
    for u in range(-20,21):
     assert min(A,-u-N)<=(A if min(A,g-u)>N else 0)
Actual compact replay state receipt retrieved:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804; six prior named checks,
three standard axioms only, module_1_build timeout 124 at 2700.11s;
all_requested_checks_ok=false, full_RH_replay=false.
No new Lean/native PASS. Old-pin engine receipts do not verify
compact source. The following scalar certificates and source probes
are prepared for shared runner; no fresh job dispatched.

RESUME HERE: prove the quantitative frame clause at
FrameTheorem.lean 147 onward, starting with the actual radius_lemma
supplier and its p^(4delta) matrix-span bound, not generic Kisin
existence. Audit the exact fixed-field approximation used at
HodgeExpansion.43–46, including signed filtration indices.
Coordinate with Galois RUN72 on frame bicommutant/adic-basis and
general depth step; avoid repeating its scalar E-power argument.
HANDOFF TO integration/editor, Galois, audit and compact native runner.
Human RH reconstruction remains incomplete.
-/

namespace RHLiteratureRun72

theorem threshold_dominates_long_gap (A N g u : ℤ)
    (hN : N < A) (hg : 0 ≤ g) (hA : 0 ≤ A) :
    min A (-u - N) ≤ (if min A (g-u) ≤ N then 0 else A) := by
  by_cases h : min A (g-u) ≤ N
  · rw [if_pos h]
    have hgu : g-u ≤ N := by
      by_contra! hn
      exact (not_lt_of_ge h) (lt_min hN hn)
    exact (min_le_right _ _).trans (by omega)
  · rw [if_neg h]
    exact min_le_left _ _

theorem projection_cancellation {R : Type*} [CommRing R]
    (P B Q C : R) :
    P*B-P*(B-Q*C)=P*Q*C := by ring

#print axioms threshold_dominates_long_gap
#print axioms projection_cancellation
#check Lift.KummerChart.JumpLattice.mem_withExponents_of_deep
#check Lift.KummerChart.JumpLattice.coeff_mem_constantsModE
#check Lift.KummerChart.JumpLattice.letterProj_mem_constantsModE
#check Lift.KummerChart.PairingSide.pointsOver_nonempty_of_long_gap
#check Lift.KummerChart.PairingSide.exists_lift_of_mem_liftIdeal
#print axioms Lift.KummerChart.JumpLattice.coeff_mem_constantsModE
#print axioms Lift.KummerChart.PairingSide.pointsOver_nonempty_of_long_gap

end RHLiteratureRun72
