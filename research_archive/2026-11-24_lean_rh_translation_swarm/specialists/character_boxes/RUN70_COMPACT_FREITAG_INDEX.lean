import New.Exchange.StandardCoefficients
import Mathlib.Tactic

/-!
# RUN70 — Freitag denominator descent and integral unitary normalization
27 Nov 2026. Human source-matched derivation; new native replay outstanding.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 read first;
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, latest manuscript,
continuity, research state, protocol, log and current CI summary inspected.
Previous RUN69 commit 2203bfae. Peer head at preflight 784d021e, with
2952c52c (orbital/Bessel), a5c02498 (Howe), 9fbb841b (cup/Bessel),
d14639a0 (editor), a17effa4 (character average/Tate). No overlap with
this integral Fourier coefficient supplier in their latest commit titles.
Completion-first compact mission supersedes old window detour.

## 1. Actual consumer and hypotheses

New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c:
stdExchange_of_periods calls IsEquivariantLift.apply_stdColDatum_eq_zero
(New/Exchange/StandardCoefficients.lean 85616f797460e30c5134a146bd5220fadc28855c,
lines 18–78). It supplies StdExchange, the exchange chain used by
exchange_of_partners and exchange_theorem (608b4f61af27d780e24f799937a836ecd3c1d50a).
The goal is annihilation of every integral standard column datum by
the difference operator, not just vanishing of a single Fourier value.

Lib/SiegelWeil/SingularForms/SingularForms.lean
c20825fdaddc310c665e54348390cd17ec47fd06, freitag:
D has p-plane frame; extra adapted line A and adapted B satisfy
D.kAdelic = A.iAdelic B.kAdelic. f automorphic and level-invariant
under Kf intersect supportedOn S. det T != 0. Extra radical invariance
hl holds for every appropriate A at the nonempty U disjoint from
S and its conjugate; base vanishing holds at all X acting on the
D frame by gamma on S union Sbar and 1 elsewhere when
B_gamma = delta^-1 gamma* T gamma is primitive on S union Sbar.
Here delta=invDifferentIdele, star denotes conjugate transpose,
and B_gamma is the source siegelBracket, not the unscaled Gram.
Keep all these assumptions. The theorem proves the coefficient zero
on supportedOn S. The actual caller derives skew-hermiticity of T
from duality before using this theorem and does not assume T positive.
The following supplies the exact shear, strict index step and inverse
row mechanism of this theorem; the final caller's radical-invariance
bridge and represented-class matching are retained separately.

## 2. Fourier uniqueness and exact rational shear

Let C_T be the coefficient of f along D at T. Consider its Fourier
coefficients on the larger central group of A.comp B. Translation
by the smaller center shows that its coefficient at R is zero unless
R22=T: otherwise multiply by a rational-adelic character whose
value differs from 1 (duality). If R22=T, the iterated coefficient
equals the R coefficient of f by centreCoeff_centreCoeff (Fubini
and the exact quotient measures; both groups are compact modulo
rational points). For R=[[a,b],[c,T]], put y=-T^-1 c and x=y*.
Over the rational field,
  [[1,x],[0,1]] R [[1,0],[y,1]]
    = [[a+b y, b+xT],[0,T]],
because c+Ty=0. The lower-left block is exactly zero, with no
bound and no symmetry assumption on a,b,c. The source
centreCoeff_rat_mul and actsOnFrame_shearElt transport the coefficient
to a bordered coefficient at the rational shear x. Thus if every
bordered coefficient at every shear x vanishes, all Fourier
coefficients of C_T on the larger compact center quotient vanish.
Continuity and character completeness imply C_T=0 there, in particular
at the original point. This is centreCoeff_eq_zero_of_shearElt.
Only invertibility of T, not invertibility of R, was used. Retain
the exact dual-family and quotient-measure inputs of AdaptedHom.lean
74a1d79ff98c6af2705f957b0f62e3f1b5299fba; no density assertion for
the full group follows merely from the block identity.

## 3. The strictly decreasing integer in freitag

Write S0=S union Sbar. R_S is the ring of adeles integral on S0.
For an invertible adelic matrix Q, define D(Q)=the denominator index
of idem(S0)*det(Q^-1) on the finite adeles. Source definition
Lib/General/LinearAlgebra/AdelicRingDefs.lean
868168201f51f7fce6ea57bf492629294dbac8f8, denomIndex:
[Ohat : {a in Ohat: ba in Ohat}], for b the indicated finite adele.
If Q integral on S0, its exact value is
  D(Q)=prod_{v in S0} (#k_v)^ord_v(det Q).
This follows because the annihilator ideal at v is precisely
pi_v^ord(det Q) O_v; outside S0 b=0 and imposes no condition.
Indices multiply and all but finitely many factors equal 1.
The index is a positive integer. No archimedean factor is present.

The Iwasawa frame in freitag is block upper triangular
[[t,*,],[0,gamma0]] (first block one-dimensional).
For any competing frame action [[tau,0],[z,gamma]], comparison
by the integral compact element produces an integral matrix r
on S0 with
  r22=gamma0^-1 gamma, r21=gamma0^-1 z.
Indeed take the inverse of the upper triangular frame action
times the competing action and inspect its bottom blocks.
The source obtains integrality via the mutually dual integral
adapted frames and the inverse compact element. Retain this
integral-frame property, not an assertion that every adelic
change of basis is integral.

If gamma^-1 z is nonintegral at any place of S0, then r22^-1 r21
is nonintegral; since r21 is integral, r22 cannot have integral
inverse everywhere on S0. An integral square invertible matrix
over a DVR has integral inverse iff its determinant is a unit
(adjugate identity). Consequently there is a place with
ord(det r22)>0. Put Q0=B_gamma0 and Q=B_gamma. Exact congruence
gives Q=r22* Q0 r22. If Q0 is nonintegral, the strong-induction
premise (Q0 integral -> D(Q0)<N) is vacuous. Otherwise
  D(Q)=D(Q0) prod_{v in S0} (#k_v)^ord_v(det(r22* r22))
       =D(Q0) (prod_{v in S0} (#k_v)^ord_v(det r22))^2
       >D(Q0).
The last equality uses S0 conjugation-stable, conjugate residue
fields have equal cardinalities and conjugation permutes places.
This is the denominator-ideal strict containment argument of
freitag's local supp lemma, expressed in valuations. It is not
an induction on an unbounded real norm or merely det(Q).
Given the current integral bracket and induction budget N with
D(Q)<N, the previous case applies at the smaller integer D(Q)
and gives zero. Contrapositively every surviving bordered
coefficient has gamma^-1 z integral on S0. This includes both
choices of the added line A and A.symm, with the exact same
D frame. The determinant of Q is an adelic unit (T and gamma
invertible); local unit means valuation zero, a separate condition.

## 4. From survival to integrality of every inverse row

In the native proof, radical invariance first reduces a nonzero
bordered coefficient to the zero border at a Levi point u, after
removing the radical and the integral compact element.
If the surviving value is nonzero, invariance under integral
central translations and the primitive additive character force
each entry of B_gamma integral on S0: choose a single matrix unit
at each entry and use the annihilator of the integral lattice.
This is the native local I. For clarity, the support result in
section 3 now applies with this integral B_gamma, at all the
comparison points in the induction.

For each i choose d=e_i^T B_gamma^-1 (a one-row matrix).
Its product d B_gamma=e_i^T is integral, even though d is not
yet known integral. Right-translate f by closurePart S of
A.shearElt B d, and subtract from f to form F. The difference
is automorphic. On the opposite line A.symm, this shear is a
central element with upper-right block d. At an opposite shear
point the competing frame is
  [[t^-*,0],[z,gamma]], z=-x* t^-*.
For a bordered index R=[[sigma1,sigma2],[0,T]], the lower-left
block of its bracket after that frame action is
  delta^-1 gamma* T z = B_gamma gamma^-1 z.
The central-translation coefficient law therefore multiplies the
coefficient by the phase (or its inverse, according to translation
direction)
  psi0(tr(d B_gamma gamma^-1 z) on S0).
If the original coefficient is nonzero, section 3 forces
gamma^-1 z integral; d B_gamma=e_i^T is integral, so this phase
equals 1. If the original coefficient is zero, the translated
one is zero by the same character law. Hence all opposite
bordered coefficients of F vanish at all opposite shears.
The exact phase sign is immaterial because the argument proves
it is 1, not merely of modulus one. By section 2 the D
coefficient of F vanishes at every X in the source relation O(X,u):
same closurePart S as u, and identity on the D frame off S0.

The native dens step then transfers this to the zero border of
F at the original Levi point (and its O-comparison points).
Indeed the compact-center coefficient is the iterated coefficient
of the D coefficient. Rational center translates and center
translates supported on U form the dense additive set supplied
by denseRange_rat_matrix_add he 1. Rational translates preserve
the D coefficient by automorphy; the U translates preserve O
because U is disjoint from S0 and center elements fix the D frame.
The integrand is consequently zero on the dense set and zero
everywhere by continuity. Retain that additive approximation
theorem and the exact automorphy/center laws; do not replace
them by strong approximation for an arbitrary noncompact group.

The surviving zero-border value is therefore unchanged by the
right shear. On A.comp B its frame action at u times this
shear is [[t,0],[-gamma d*,gamma]]. Apply section 3 to this
nonzero value: gamma^-1(-gamma d*)=-d* is integral on S0.
Since S0 is conjugation-stable, d is integral. Vary i over all
rows; B_gamma^-1 integral on S0. Together with section 4's
initial integrality this is exactly IsPrimitiveMatrix R_S B_gamma.
The base vanishing assumption contradicts survival. This
explains the final inverse-row argument of freitag, using the
native compact-center, radical-invariance, Iwasawa, and
additive-density inputs, not assuming an arbitrary singular
automorphic form is holomorphic. Its source uses strong
induction and O explicitly to justify applying the same
argument at opposite shear points. A separate independent
audit of these O-transport instantiations is requested.

## 5. Shorter integral orthonormal normalization at actual base caller

StandardCoefficients lines 55–65 patch the local bracket and its
inverse via complementary idempotents. Let e be the indicator
of the complement of S0, so e*=e, e^2=e. On S0 use a hermitian
matrix N integral at the selected places S. Conjugation
transposes its entries and transports integrality to Sbar.
On the complement use the integral matrix M. Thus e M+(1-e)N
is integral at EVERY place. Apply to both the bracket and inverse,
retaining the native equality identifying the patch with
siegelBracket T q; do not infer a global inverse from entrywise
integrality alone. In particular for inverse pairs the identity
  (e M+(1-e)N)(e M^-1+(1-e)N^-1)=1
holds by the two orthogonal idempotents. This is exact, not
a gluing of unrelated local choices.

The actual next supplier is exists_orthonormal_Ô in
Lib/Adelic/Witt/SpaceOperations.lean
42d0ff55145da26c116891f9822c3a3dfddec57a, requiring StablyUnram E
and IsUnimodular Ohat b. Its proof calls the full profinite
exists_fixed_orthonormal_frame in UnitaryHilbert90.lean
9fa163a06af9ba804ef45c21328abcb60f063a3b. Here is a shorter
human derivation for this exact trivial-tau caller, retaining
the source norm-surjectivity theorem.

Let R=Ohat E, Y the invertible hermitian integral matrix. The
source provides u in R with u-u* a unit (StablyUnram).
Let A=R[t]/(charpoly Y). It is finite free as an R-module
since the polynomial is monic, hence profinite by
IsProfiniteRing.of_addEquiv_pi and isProfiniteRing_intAdeles
from TameDescent.lean 1d3a4bd21d7ab38291eb887f05107e7a65e632d1.
The involution on coefficients fixes t and descends: the
charpoly of a hermitian matrix is fixed by coefficient
conjugation, since transpose preserves determinant.
The image of u-u* remains a unit. The class t is a unit,
since the constant term of charpoly is a unit (det Y);
the characteristic polynomial equation explicitly expresses
t inverse as an integral polynomial in t. Apply
IsTameAtLevel.of_skew with sigma=star, exponent 2, level t-1,
which is star-fixed. The target t^-1 is star-fixed, a unit,
and t^-1-1=-(t-1)t^-1. By the actual IsTameAtLevel.exists_norm
(for profinite rings), there is v in A^× with
  v* v=t^-1, v-1 in (t-1)A.
Evaluate polynomials at Y (Cayley–Hamilton). This is a ring
homomorphism into the matrix ring: coefficients central and
polynomials in one matrix commute. It preserves star because
Y*=Y. Let k=v(Y). Then k and its inverse are integral,
both k,k* commute with Y, and
  k* Y k=Y k*k=Y Y^-1=1.
Also k=1+W(Y-1) by the retained congruence. In particular the
source's exact base caller has the necessary one k in GL_b(Ohat),
without the general twisted-root theorem or any division by 2.
This is a premise-preserving human specialization, not a new
kernel proof or proof of norm-surjectivity itself. Other consumers
of the full twisted-root lemma with nontrivial tau are unaffected.

## 6. Actual caller: remaining represented-class and partner guards

After the integral normalization, StandardCoefficients rescales
T=j beta and q=scaleIdele q0, obtaining the exact finite
orthonormal Gram for beta. It branches on RepresentedBy t'
(beta.map toAdele). In the represented branch V'.exists_eq_move
supplies the rational congruence and adelic unitary frame
transport; centreCoeff_rat_mul then puts the coefficient in
the first disjunct of h0. In the nonrepresented branch h0's
second disjunct uses invertibility. Do not conflate local
unimodularity with real signature or prove the represented
branch without the actual rational isometry/adelic move
theorem. Lines 35–54 additionally derive skew symmetry and
the all-A extra radical invariance from centreCoeff_shear and
shear_invariant. That model-law bridge remains to reconstruct.
The outer partner_mem_of_unimodular_vanishing (New/Exchange/
StableSpaces.lean 38b5bd48274f38b35b66ebb7d6e48ac565636b86)
uses a primitive residue additive character and matrix Gauss
sum to generate all partner data; not discharged by the
Freitag induction alone. Preserve the original h0 with both
branches and all quantifiers. No RH-scale prime inequality
is proved in this checkpoint.

## Evidence

Source-visible path: exchange_theorem -> exchange_of_partners
 -> stdExchange_of_periods -> apply_stdColDatum_eq_zero
 -> freitag -> centreCoeff_eq_zero_of_shearElt / strong index
 induction / inverse-row support. Other branch:
 apply_stdColDatum_eq_zero -> exists_orthonormal_Ô
 -> exists_fixed_orthonormal_frame -> exists_twisted_root.
Human alternate for the latter local branch:
 Cayley–Hamilton + tame norm-surjectivity + monic profinite
 quotient -> k*Yk=1. No global deletion from native graph.
Original/reduced graphs and prior axiom ledgers left unchanged.
Context cache key: compact pin, S,S0,U, actual D,A,B,T,f,
level and all-A invariance, invertible T, primitive base,
StablyUnram E, Y hermitian and invertible. No original-pin
engine evidence attributed to compact pin.

Executed locally: command -v lean/lake/elan returned no paths;
SymPy symbolic 2x2 determinant expansion
det(r.T*B*r)-det(r)^2*det(B) returned exact 0 (real transpose
special case only; not the general proof or native replay).
State artifact compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
fetched: 6 named Selmer/Filling checks had the standard three
axioms, one module timed out at 2700.11s (return 124),
all_requested_checks_ok=false, full_RH_replay=false.
No new rh_scan/prune/reduce/auto/frontier execution or new
kernel verdict; the probes below are prepared for shared
targeted CI in compact namespace. No protected file changed.

RESUME HERE: complete the exact all-A radical-invariance bridge
at StandardCoefficients lines 35–54 (centreCoeff_shear,
shear_invariant); trace V'.exists_eq_move at lines 70–77 with
precise local/global isometry hypotheses; then the residue
matrix Gauss-sum and compact averaging in
partner_mem_of_unimodular_vanishing. Audit the O-comparison
instantiations of section 4 and the tame norm specialization.
HANDOFF TO integration/editor, geometry, kernel, literature,
and audit. Human RH reconstruction incomplete.
-/

namespace CompactCharacterBoxes70

theorem shear_cancel {R : Type*} [Ring R] (a b c t x y : R)
    (h : c + t*y = 0) :
    a + b*y + x*c + x*t*y = a + b*y := by
  calc
    a + b*y + x*c + x*t*y = a + b*y + x*(c+t*y) := by noncomm_ring
    _ = a + b*y := by rw [h, mul_zero, add_zero]

theorem norm_normalization {R : Type*} [Monoid R]
    (kstar Y k Yi : R) (hc : kstar*Y = Y*kstar)
    (hn : kstar*k = Yi) (hi : Y*Yi = 1) :
    kstar*Y*k = 1 := by
  rw [hc, mul_assoc, hn, hi]

theorem phase_row {R : Type*} [Monoid R]
    (d B e z : R) (h : d*B = e) : d*(B*z) = e*z := by
  rw [← mul_assoc, h]

#check freitag
#check Space.Splitting.centreCoeff_eq_zero_of_shearElt
#check exists_orthonormal_Ô
#check IsEquivariantLift.apply_stdColDatum_eq_zero
#print axioms freitag
#print axioms exists_orthonormal_Ô
#print axioms IsEquivariantLift.apply_stdColDatum_eq_zero
#print axioms shear_cancel
#print axioms norm_normalization
#print axioms phase_row

end CompactCharacterBoxes70
