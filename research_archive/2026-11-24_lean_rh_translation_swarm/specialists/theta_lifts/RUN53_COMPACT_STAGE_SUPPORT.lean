import Mathlib

/-!
# RUN53 — exact stage support and finite cut at the actual Theorem A caller
26 Nov 2026. Human source-matched reconstruction; standalone scalar Lean
certificate prepared, NOT compiled. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Current mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (primitive closure),
manuscript 60b7d344cd2791eee12edc687692568ebebd989e,
unified witness 7ad9c7c64f53c621ad20422226ad9d0b756ee28e.
Previous theta RUN52 f33fddae. Peers reviewed 5b79a6d9 (jet gain/loss),
2a8439aa (isolation/tower), c885dc85 (replay audit), 6bdfdba6
(integrated ledger); these do not supply the stage support below.

Source ledger, relative to grh-compact/src:
New/Seesaw/EdgePair.lean 02588c1ebc8eed128efaa107d9a9e1b5863d4d02
  zeroTermFin_support
New/Seesaw/LinesStep.lean 017ac7b96f33f4a41462aaef726ed1d26dec6767
  Grading.IsAdaptedAt.ideleLogVal_add_rev_nonpos, Grading.HasNearLines.step
New/Seesaw/EqualLinesOrbit.lean b5ace630b79ecf9eeaca084da26fc55abe4c1e6d
  flagOrder, IsAdaptedBasis.inv, HasNearLines, exists_mem_besselFin
Lib/Weil/Periods/DegreeAndUnipotent.lean c5b913c258a02c5429bc8962604e04420dbb66e2
  gradedGram, gradeOf, hasDegreeGe_two_of_odd
Lib/Weil/Periods/FiniteBesselGroup.lean 14c0b4ab31b22a94941f6c4e52d77b17887cba6b
  stringMap, J_inv_eq_gradedGram, IsGeneric
Lib/Weil/Periods/UnfoldingStep.lean 3967758138b6287044bbfd2657f67cfb5077c5a2
  exists_splitting_constTerm, unfoldStep
New/Seesaw/UnfoldingStages.lean 5e6b4189ad78c708ce8f30888678b4467672b850
  unfoldStage_even, hasNearLines_of_unfoldStage_ne_zero
New/Seesaw/GradingsOfY.lean 9a0ce95531f7ef503b23167e9d90ef3d417f1bf8
  upsilonY, levelY, thetaKernelY_omega_upsilonY
New/Seesaw/StandardLatticeLevel.lean 0a7087b2ee0c5a549fb6e990f9c9e40a65018b06
  hasNearLines_zero, inclXFin_mem_Kf
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
  exists_eq_sub_centralGen, scalarFin_centralGen_mem (source search excerpts)
New/Seesaw/SeesawTheorem.lean 0e6f5541f15ddb75c30751d22163bfdbd4194d91
  exists_stage_cut, exists_isAdmissibleComb_unfolding, seesaw
New/Seesaw/IntegralAsCosetSum.lean 32fb5c67023696c8e6be524aa445e0c7804529d7
  exists_cut_coverMultiplicity_dvd, coverMultiplicity_smul

## 1. Finite zero-term support: the primitive matrix supplies an integral vector
Keep the native hypotheses of zeroTermFin_support: finite splitting
isotropic frame K, M M'^*=1, f fixed by translations M O^n,
and Z=zeroTermFin(rho(y)f) nonzero. The matrix C=M'^* K has a left
inverse: K has a left inverse in the splitting and M'^* is invertible
with inverse M. Use the valuation-pair primitive matrix theorem at C:
choose an invertible t with B=Ct integral primitive, and integral L
with LB=1. For each integral z, MBz=Ktz. The zero term is fixed by
translations in the isotropic K directions, by
zeroTermFin_finHeisOp_finFrameVector with w=0. Commute this translation
past rho(y), using the native Heisenberg commutator. The resulting phase
times Z equals Z, so the phase is one, since Z != 0. Duality of the
standard lattice for the native finite character (mem_stdLattice_iff_psi0)
gives u=t^* K^* y integral. Put l=L^* u, which is integral.
Then B^*l=(LB)^*u=u, so cancelling the invertible t^* gives exactly
K^*(y-M'l)=0. No estimate or separate choice of l for each index.
This keeps the primitive matrix theorem and the native duality and
Heisenberg/zero-term laws as mathematical suppliers, not new axioms.

## 2. Singleton adapted-frame entry (all indices, including X blocks)
Set s'=s-1, and take the SAME predecessor x in HasNearLines.step,
and successor x'. Let B,B' be the adapted frames with diagonal
gamma,gamma', and Xf=V.xFin*x, Xf'=V'.xFin*x'. The native finite Hom
action on matrices is z -> x' z x^-1, and finCoord_homAtPoint
(Lib/Weil/Periods/BesselIntegral) reads alpha^-1 xFin'^-1 T xFin.
In zeroTermFin_support the native M=b*g, M'=bar(b)^-1*g
satisfy MM'^*=1 because g is unitary. Multiply the support equation
by the inverse Hom Gram and the splitting frame as in LinesStep;
exists_splitting_constTerm gives the diagonal projector on strictly
negative map degree. In rational coordinates, with L0=vecToMat l,
W=Xf' L0 Xf^-1, this is
       W_ba = (bar b / alpha) T_ba  if grade'(b)<grade(a).
Here b in the scalar factor is the stabilizer idele, not a row index.
Indeed the rational-coordinate expression of y-M'l is
alpha^-1 T - bar(b)^-1 Xf' L0 Xf^-1; projecting negative degree
and multiplying by bar b gives precisely this entry agreement.

Since Xf^* J Xf=1, Xf^-1 J^-1=Xf^*. Thus
       B'^-1 W J^-1 B^-*=(B'^-1 Xf') L0 (B^-1 Xf)^*
is integral by the actual adapted-frame hypotheses. Evaluate entry
(i,j) with target string i and source j=s-1-i (i.rev.succ).
A potentially nonzero summand after reversing the source Gram index
a is indexed by source a and target d. Triangularity of the inverses
gives flag'(i)<=flag'(d), flag(j)<=flag(rev(a)).
For a string index this forces a<=i; for a in X, flag(rev(a))=2s
forces 4(s-1-i)+1<=2s, hence 0>=s-1-2i.
For a string d it forces d>=i; for d in X', 4i+1<=2s'
implies 0<=s'-1-2i. Consequently in ALL four cases
      grade'(d) <= s'-1-2i < s-1-2i <= grade(a).
Replace W by (bar b/alpha)T BEFORE taking norms.
T kills X and X' and its only string entries have d=a.
Since a<=i<=d, precisely (a,d)=(i,i) survives. Its inverse-Gram
coefficient is 1 except at 2i+1=s, where it is -1/N and cancels
the -N in stringMap. The diagonal factors are gamma'_i^-1
and conjugate(gamma_j)^-1. If e=1 when Odd(s') iff i<=i.rev,
and 0 otherwise, the exact integral entry is
       c^e * bar(b/gamma_j)/(alpha*gamma'_i) in O.
This is H in LinesStep, with no bound on off-diagonal entries.

## 3. Propagate the exact valuation interval, not just a norm
Write log=-ord, A=log a(w), Ab=log a(bar w), C=A+Ab, D=A-Ab.
Let t_s(i,w;m)=m D plus 0 for odd s, -A for the first half of
even s, Ab for its second half. The source m=m'+1 if s is even
and m=m' if s odd. The integral entry of section 2 gives
 log gamma'_i(w)>= e C+log b(bar w)-log alpha(w)-log gamma_j(bar w).
Native hb at bar w says log b(bar w)-log alpha(w)>=-A-1_(bar w in Q).
By the preceding stage bound the lower deviation is >=
 -k*1_(w or bar w in Q)-1_(bar w in Q), since exactly
       -A - t_s(j,bar w;m) + e C = t_s'(i,w;m').
Check the two parities and two halves: odd s has old correction
0, e=0 then 1; even s has old correction at bar w equal A
on the first target half (including middle), -Ab on the other;
e=1 then 0. In each case the displayed equality follows.
The target satisfies t_s'(i,w)+t_s'(i.rev,bar w)=0.
The native reverse-valuation bound hg therefore supplies the upper
deviation by reflecting this lower bound. Thus |deviation|<=k+1
on Q union bar Q, exactly zero elsewhere. No extra loss at
places dividing N; this is the exact HasNearLines.step conclusion.

## 4. The reverse inequality: the exceptional central case and ramification
For an adapted frame at the successor, the integral Gram identity
gram_string_entry with j=i.rev gives log gamma_i(w)+log gamma_rev(bar w)
<=0 except possibly when the string length is odd, i=i.rev, and w
lies over N. There the Gram entry is -N and the bound is <=1
(split squarefree). Conjugation lets us take w in P. If positive it
equals 1, by integrality of the idele logarithms.

Reconstruct the native auxiliary lattice in
ideleLogVal_add_rev_nonpos: d is diagonal, 1 on X, with
gamma_a=beta_a for a<=i, gamma_a=bar(beta_rev(a))^-1 otherwise.
At w choose the local unitary translate whose rational frame
equals d(w); this is possible at a split pair by atSplit, with
the conjugate component determined by the unitary condition.
At bar w the Gram identity makes the frame J^-1 d(w)^-* (up to
the invertible standard unitary frame coordinates). For a<i its
string diagonal has log beta_a(bar w), by the chosen reverse
diagonal; at a=i it has log 1-log beta_i(w)=log beta_i(bar w).
At w the first-half diagonals are unchanged, and all other places
are unchanged. Thus the adapted first-half valuations coincide
with the original, by the native adapted-basis comparison lemmas
(and the integral frame at bar w; diagonal Gram times reverse
permutes columns). Apply integral Witt in exists_mem_besselFin:
there are n in besselFin and k0 in Kf with n*x=x_new*k0.
The new diagonal lattice has standard X block at w; every member
of maxCompactAt X w preserves it, and unitarity supplies the
conjugate component. Conjugating by k0 preserves the standard
compact. Hence for this n the forbidden containment
(n*x)^-1 inclXFin(maxCompactAt X w) (n*x) <= maxCompactAt V w
holds. This proves the reduction to the no-fixed-central condition;
retain integral Witt and split local unitary existence explicitly.

At the actual Data.hasNearLines_of_unfoldStage_ne_zero caller,
the successor stage index is even in the exceptional odd-string case.
Assume that containment. Decompose n^-1 (as a Bessel element) into
u*inclX(a). On the odd string strict degree raising implies degree>=2,
so genericity transfers the stage value to the inclX orbit at n*g
up to a nonzero character. By exists_eq_sub_centralGen,
the SAME ramified column is psi - algFormRep(z_w) psi.
Use unfoldStage_even with the fixed real coordinates and this finite
point; its linear functional is uniform in columns and the final
finite variable. Pair-chain equivariance for simultaneous central
scalars transports translation of psi by z_w to a right translation
at the endpoint (the unramified rank-twist determinant characters
are 1 at the split N place). The assumed containment, applied to
scalarFin_centralGen_mem, puts the conjugated scalar in Kf and in
levelY: N places are neither chosen nor tame Q places, and the
element is supported there. The coset is unchanged. evaluatedDatum_out
ensures the finite datum depends on precisely this coset.
Consequently the two matrix coefficients for psi and z_w psi agree,
and their difference is zero. Genericity then makes the original
stage value zero, contradiction. Keep the native paired-stage
identity, unramified rank-twist character, level disjointness and
equivariance hypotheses; this is not a claim of central invariance
for arbitrary columns or arbitrary stages.

For the support induction the nonzero unfolding integral yields one
predecessor where BOTH factors are nonzero (otherwise integral zero).
Use the same predecessor for the previous support and for step.
Base case uses filling_fits.exists_besselFin_mul_mem_of_ne_zero
and hasNearLines_zero. For the step, b is exactly the generator of
D.modulus(ϑ,1) (native notation D.𝔪 ϑ 1). Its ideal factorization
supplies hb using chosenIdele/ideleA and the additional primes Q.
For hf, expand the actual named vacuum upsilonY: the mod datum
is a finite sum of vacuum translates with denominators in this
modulus; translating by its generator times an integral vector
fixes each vacuum, and the commutator phase is one by standard
lattice duality. The native isAdmissibleComb_name gives precisely
this denominator bound. No replacement of the previous theorem
by an unspecified support hypothesis.

## 5. Actual finite-cut consumer and multiplicity (no new denominator)
For stage k>0 choose A=Kf and J=levelY(ϑ,k), and B=localLevel away
from the rational primes of n=ϑ.levelNorm. A contains the column
level through inclXFin by spansLattice and inclXFin_mem_Kf.
For each place of Q union bar Q, choose the adapted valuation
difference Phi(x)=log beta(x)-log beta(1) on every string. By sections
2--4, a support point has each difference in [-k,k], and outside
the two sets the difference is zero. Choose one global representative
of each attained Phi, restrict it to the split components Q (and
their conjugates) with componentOn. Multiply these finitely many
representatives by Kf. This compact set D is integral away from n.
At Q its representative has exactly the same adapted first-half
valuations; outside, the identity does. Adapted valuation comparison
and integral Witt give a Bessel translate of every support point
in D. The source uses invFun on the whole finite box, allowing
unattained labels; this does not harm compactness or local support.

For any x in D, conjugation by x at a place of Q sends a sufficiently
deep principal congruence group into the local compact. J is
principal at each Q; these are pro-p groups where p divides n,
so there is a uniform exponent p^h sending every member of J at
that place into this deep congruence group. Concretely the quotient
by a deeper congruence group is a finite p-group, by the successive
additive matrix quotients. Taking n^h with h large works simultaneously
at finitely many Q places; the conjugate places follow by unitarity.
Outside Q union bar Q, x is already integral, so no exponent needed.
Thus (xux^-1)^(n^h) is in A for ALL u in J.
For k=0 instead take A=chosenLevel, compact D=A, J<=A, and
use the initial Poincare support; exponent zero suffices.

For completeness reconstruct the abstract cut in IntegralAsCosetSum.
Let S=besselFin and H=S intersect A. The image of compact D in the
discrete quotient by open J is finite. Select one coset xJ in
each S-orbit meeting D, and let T be its H-saturation; finite by
compact A. T is H-stable and contained in B/J. Every nonzero
stage point is S-equivalent to one of these representatives.
For the representative xJ, its S-stabilizer is K=S intersect xJx^-1.
The set of distinct cosets counted in coverMultiplicity is exactly
the orbit of K on S/H: if r^-1*xJ lies in T, it must be in
H*xJ (no other selected S-orbit). This is equivalent to r in K H.
Hence multiplicity=[K:K intersect H], finite since K compact,
H open. For each b in K, b^(n^h) lies in H by the conjugation
bound. In the finite quotient K/core_K(K intersect H), the same
exponent kills every element: apply the power property to all
K-conjugates. By Cauchy's theorem every prime dividing its order
divides n, so its order divides some n^j, including n=1 (trivial
quotient). The multiplicity divides that order, so divides n^j.
This uses no assumption H is normal. Multiplicity is S-invariant
by left translation. This gives all four exists_stage_cut clauses,
with denominators only supported on n, at the same twist and stage.
The period-as-coset-sum measure formula and the original unramified
cardinality bound in exists_isAdmissibleComb_unfolding are retained,
as are the deeper local Schur/Fourier marked elementary divisors.

## Evidence, reproducibility, and remaining frontier
Original local source graph retained:
Main <- New.grh <- star_inequality <- exists_family_covolumeSq_le
<- Data.short_forms <- Data.seesaw <- exists_isAdmissibleComb_unfolding
<- exists_stage_cut <- hasNearLines_of_unfoldStage_ne_zero
<- HasNearLines.step <- zeroTermFin_support.
Additional branches: ideleLogVal_add_rev_nonpos, exists_mem_besselFin,
unfoldStage_even, exists_cut_coverMultiplicity_dvd. Reduced human
graph replaces the singleton summation by grade sandwich and the
valuation transport by the signed equality; all standard/deep
suppliers above remain explicit. Context key: (compact pin, D,P,
actual twist, k, same predecessor, adapted frames, place and paired
place, ramified column). No native graph deletion, no new axiom,
no RH claim; the reduced witness is the SAME family for (U),(W),(S).
The source-matched arguments above need independent audit,
especially the precise local frame at the conjugate place and
the paired-stage equivariance. The finite cut is not native replayed.
RUN55 peer covers numerical jet gain and collision budget; do not
rederive it. Next focus on the actual marked Schur/Fourier supplier.

Local Python exact tests executed, no Lean or Lake in container:
62,322 admissible flag-pair implications (s=2..34, X marker included),
1,683 rational coefficient comparisons (N,c samples), 109,956 exact
target transport/reversal cases (A,Ab=-3..3, m'=0..3).
Reproducer (no numerical approximation):
  from fractions import Fraction
  from itertools import product
  nflag=ncoef=nnear=0
  for s in range(2,35):
   t=s-1
   flag=lambda n,j: 2*n if j is None else 4*j+1
   grade=lambda n,j: 0 if j is None else n-1-2*j
   rev=lambda n,j: None if j is None else n-1-j
   for i in range(t):
    j0=s-1-i
    for a,d in product([None,*range(s)],[None,*range(t)]):
     if flag(t,i)<=flag(t,d) and flag(s,j0)<=flag(s,rev(s,a)):
      assert grade(t,d)<grade(s,a)
      if a is not None and a==d: assert a==i
      nflag+=1
    for N,c in [(2,Fraction(3,2)),(3,Fraction(-5,2)),(7,Fraction(1,3))]:
     tc=(1 if bool(s%2)==(2*i+1<s) else c)*(-N if 2*i+1==s else 1)
     ji=Fraction(-1,N) if 2*i+1==s else 1
     assert tc*ji==(c if bool(t%2)==(i<=t-1-i) else 1)
     ncoef+=1
    for A,Ab,m in product(range(-3,4),range(-3,4),range(4)):
     def target(n,j,m,A,Ab):
      return m*(A-Ab)+(0 if n%2 else (-A if 2*j<n else Ab))
     e=bool(t%2)==(i<=t-1-i)
     assert -A-target(s,j0,m+(s%2==0),Ab,A)+e*(A+Ab)==target(t,i,m,A,Ab)
     assert target(t,i,m,A,Ab)+target(t,t-1-i,m,Ab,A)==0
     nnear+=1
  assert (nflag,ncoef,nnear)==(62322,1683,109956)
These are source-index/algebra regressions, not proofs of the
adelic support, or a kernel replay. Actual RUN28 result JSON
23de197bd48f404ca2074c69676de289c4f7934e at run 45799225653
retrieved: ten native declarations and four scalar certificates
with only three standard axioms. Does not include these theorems.
RUN29 compute/rh-compact-primitives-replay-20261126/status.json
not found in state branch at this check; no PASS asserted.
No fresh native rh_scan/rh_prune/rh_reduce/rh_auto or axiom evidence;
old engines are version-specific. Do not import claimed RH.
Scalar declarations below prepared, uncompiled.

RESUME HERE: independent audit of the precise conjugate adapted
frame and paired-stage central equivariance; then integrate this
support/cut chain at exists_isAdmissibleComb_unfolding. Continue
with New/Columns/MarkedPrimeType local Schur/Fourier elementary
divisor proof against LocalStatement; compare RUN55 before writing.
HANDOFF TO integration/editor, audit, kernel, prime-window:
sections 1--5 supply the explicit stage-support/cut argument,
not a new global endgame or a proof of every remaining A premise.
-/

namespace RHTheta53

lemma grade_sandwich (s i a d : ℤ) (ha : a ≤ i) (hd : i ≤ d) :
    s - 2 - 2*d < s - 1 - 2*a := by omega

lemma left_definite_grade (s i : ℤ) (h : 4*(s-1-i)+1 ≤ 2*s) :
    s-1-2*i ≤ 0 := by omega

lemma right_definite_grade (s i : ℤ) (h : 4*i+1 ≤ 2*(s-1)) :
    0 ≤ s-2-2*i := by omega

lemma sole_string_index (a i d : ℤ) (ha : a ≤ i) (hd : i ≤ d)
    (h : a = d) : a = i := by omega

lemma central_exception (v : ℤ) (h : v ≤ 1) (hpos : 0 < v) :
    v = 1 := by omega

lemma odd_first (A Ab m : ℤ) :
    -A - m*(Ab-A) = m*(A-Ab)-A := by ring

lemma odd_second (A Ab m : ℤ) :
    -A - m*(Ab-A) + (A+Ab) = m*(A-Ab)+Ab := by ring

lemma even_first (A Ab m : ℤ) :
    -A - ((m+1)*(Ab-A)+A) + (A+Ab) = m*(A-Ab) := by ring

lemma even_second (A Ab m : ℤ) :
    -A - ((m+1)*(Ab-A)-Ab) = m*(A-Ab) := by ring

/-- Reflection of the one-sided lower bound supplies the upper bound. -/
lemma reflect_near (v vr t tr e : ℤ)
    (h : v + vr ≤ 0) (ht : t + tr = 0)
    (hl : t-e ≤ v) (hr : tr-e ≤ vr) :
    |v-t| ≤ e := by
  rw [abs_le]
  constructor <;> omega

end RHTheta53

#print axioms RHTheta53.grade_sandwich
#print axioms RHTheta53.left_definite_grade
#print axioms RHTheta53.right_definite_grade
#print axioms RHTheta53.sole_string_index
#print axioms RHTheta53.central_exception
#print axioms RHTheta53.odd_first
#print axioms RHTheta53.odd_second
#print axioms RHTheta53.even_first
#print axioms RHTheta53.even_second
#print axioms RHTheta53.reflect_near
