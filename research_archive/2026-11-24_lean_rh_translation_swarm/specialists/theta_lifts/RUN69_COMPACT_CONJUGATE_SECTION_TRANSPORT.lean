import Lib.CM.MainTheorem.ConjugateCurve
import Mathlib.Tactic

/-!
# RUN69 — homogeneous CM point matching and conjugate isogeny transport
27 November 2026. Human source-matched reconstruction, independent audit
and compact native replay pending. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read latest ONE_EQUATION_MISSION.md (completion-first amendment), AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE, lane expansion, current manuscript and peer
commits through 7fbfc4ba. RUN68 3a912a78 left conjugate_section open.
Kernel RUN42 67dc9549 and prime RUN68 7fbfc4ba supply good reduction and
section basis respectively; do not repeat those calculations. Integration
b1451de3 explicitly requests the cubic matching and theta-zero multiplier.

Sources:
Lib/CM/LocalHeight/IsogenyIntegrality.lean
1b7411b4a950de12649c1f2cd171de834f8363fa lines 23–55:
thetaQuotient, taylorAtZero_monomialSection, exists_conjugate_section.
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7
lines 32–39, 81–121, 274–278, 296–297, 310–356, 383–390.
Lib/CM/Sigma/PadicSeriesDefs.lean 5eebedb97cff53ded1241d70add1b515300368ca
lines 16–83, 87–118 (monomials, division, Taylor laws).
Lib/CM/MainTheorem/ConjugateCurve.lean
6a5c1242ed3d2ef283cbafb57a7676e4a3062c52 lines 19–36, 46–68, 77–109
(conj_isogeny_mem_lattice, thetaQuotient_eq_one, exists_galConjugate,
exists_taylorVia_twistedTranslate_theta).

## 1. Coefficientwise transport of the affine coordinates
Let C,C' be native CM data (not yet requiring the same CM field);
sigma is a field automorphism of C with A'=sigma(A), A=a1(C).
Write T=theta, S=sigma-function, G=phiThetaCube, x=translatedWp,
y=translatedWpDeriv. Do not confuse S with the field automorphism.
At the origin T=1, x=y=0; x,y analytic there because t is not in
the lattice. The actual differential equations are
   x'=2y+A x,   y'=1+3 x²-A y.
Write x_n,y_n for Taylor coefficients. Then
   (n+1)x_(n+1)=2y_n+A x_n,
   (n+1)y_(n+1)=1_{n=0}+3 sum_(i=0)^n x_i x_(n-i)-A y_n.
Initial coefficients are zero. Induct simultaneously on n;
sigma fixes rational numbers and n+1 is never zero. Thus the
primed series are exactly the coefficientwise sigma images.
No analytic continuity of the field automorphism is assumed.

Put Q=T'_series/(sigma T_series); both denominators have constant 1.
For a native monomial M_(a,b,c)=T^a (S²)^b G^c of degree
m=a+2b+3c, the affine identity M=T^m x^b y^c holds near zero.
The just-derived coefficient recurrence gives
   Taylor(M'_(a,b,c)) = Q^m sigma(Taylor(M_(a,b,c))).
This is the source taylorAtZero_monomialSection. It does not
require Q=1; that later result uses isogeny transport, so using
it here would be circular.

## 2. One matched point and multiplier, including infinity
Fix arbitrary z on C'. Seek w on C and mu !=0, independently
of section and degree, such that
   (T'(z), S'(z)^2, G'(z))
     = (mu sigma(T(w)), mu² sigma(S(w)^2), mu³ sigma(G(w))).

Case T'(z)!=0: set u=sigma^-1(x'(z)), v=sigma^-1(y'(z)).
They satisfy v²+A u v=u³+u. Put e=A²/12=wp_C(t).
Expanding the cubic yields
   (2v+A u)^2 = 4(u+e)^3 - g2(C)(u+e) - g3(C)
with g2=12 e²-4, g3=4e³-g2 e. The pinned Weierstrass
surjectivity lemma supplies r not in Lambda_C with wp(r)=u+e,
wp'(r)=2v+A u. For completeness, the usual compact-torus proof:
the nonconstant meromorphic wp gives a holomorphic map from
the compact connected torus onto the Riemann sphere (image
open by open mapping, closed by compactness). For finite wp
value choose r away from its poles; the squared derivative
is fixed by the cubic. Replace r by -r if necessary, using
even wp and odd wp', to get the prescribed derivative,
including zero. This retains the standard elliptic function
properties and does not need a dimension-two theta-space
argument for this caller.
Take w=r-t; then x(w)=u,y(w)=v and T(w)!=0.
Choose mu=T'(z)/sigma(T(w)), nonzero. The identities
S²=x T² and G=y T³ prove the other two coordinates exactly.

Case T'(z)=0: z+t' lies in Lambda_C', so z is not a period
(t' not a period). Choose w=t (the EXACT native representative,
not merely its class). Then T(w)=0 by 2t in Lambda, while
S(w),S'(z) are nonzero. The homogeneous cubic at both zeros
gives G(w)^2=S(w)^6 and G'(z)^2=S'(z)^6. Therefore
r=S'(z)/sigma(S(w)) and k=G'(z)/sigma(G(w)) are nonzero with
k²=r^6. Choose mu=k/r², exactly the scalar in the source.
Then mu²=r² and mu³=k; there is no arbitrary square/cube-root
choice, phase mismatch, or division by theta at infinity.
The triple identity follows, with w=t as required. This
uses neither the good-reduction theorem nor an analytic
action of sigma. The same elementary identity occurs in
kernel RUN42's local-height calculation, but here its
consumer is homogeneous conjugation.

## 3. Transport every section with that SAME multiplier
Use prime RUN68's source-matched monomial span (retain its
section division and theta-space degree-one inputs).
Write any f in sections(C,m) as a finite sum sum_j c_j M_j
with each degree exactly m and third exponent <=1. Set
g=sum_j sigma(c_j) M'_j. By linearity it belongs to
sections(C',m). Section 1 and section 2 respectively give
   Taylor(g)=Q^m sigma(Taylor(f)),
   g(z)=mu^m sigma(f(w)).
The chosen w and mu depend only on z and the conjugate
curves, not on m,f or the monomial representation. The
conjugation at the Taylor level is coefficientwise, and
the pointwise identity does not apply sigma to an analytic
limit. This discharges the source-visible homogeneous
section transport supplier of RUN68, conditional on the
named monomial span/elliptic-function foundations.

## 4. Actual isogeny caller: cross-multiply before division
Let a:C->D be a native degree N isogeny, and C',D'
conjugate curves with their corresponding a1 invariants.
Retain the actual CM hypothesis on the source field and
comp_mul_mem_sections for C,D. For T_D(a z), S_D(a z)^2,
degrees N,2N, apply section 3 at C'.t. Write their images
F,H; they are sections of C' of degrees N,2N. Their Taylor
series are respectively Q_C^N times the conjugated series
of T_D(a z), and Q_C^(2N) times that of S_D(a z)^2.
At zero their values are F(0)=1, H(0)=0, since Q_C(0)=1.
At t' the matched point is t and one common nonzero mu gives
H(t')=mu^(2N) sigma(S_D(a t)^2).

Set b=sigma(a), V(z)=T_D'(b z), W(z)=S_D'(b z)^2.
The degree-one and degree-two monomial series identities
on D,D' give Taylor(V)=rescale(b,Q_D)*sigma(Taylor(T_D(a dot)))
and Taylor(W)=rescale(b,Q_D)^2*sigma(Taylor(S_D(a dot)^2)).
Consequently H V² and W F² have identical Taylor series:
every Q_C, Q_D factor and coefficientwise-rescaled series
occurs exactly once at the correct power. Both functions
are entire; uniqueness of Taylor series gives
                         H(z) V(z)^2 = W(z) F(z)^2.
This is precisely J in ConjugateCurve lines 27–30. No division
by V or F and no assertion of isogeny for b are needed yet.

For l in Lambda_C', section automorphy gives H(l)=0 and
F(l)!=0 (from values at zero and nonzero multipliers).
The cross identity forces W(l)=0, i.e. b l in Lambda_D'.
This proves the first lattice inclusion before using it.
If b t' is in Lambda_D', W(t')=0 and V(t')!=0 because
a theta zero is in the nonperiod coset. The cross identity
then forces H(t')=0. Its matched-point value and mu!=0
imply S_D(a t)=0, i.e. a t in Lambda_D (unprimed).
This is the source's second implication. No implication in the opposite direction claimed.

For the final clause retain the source's additional
hypotheses: prime-seven-mod-eight for the conjugate field,
a!=0, and b is an actual degree N isogeny C'->D'.
Now V is a degree N section of C'. At every zero of V,
W!=0 (sigma-function and theta zeros are disjoint); J
forces F=0. The native simple-zero section division makes
F=c V for a constant c. At zero both are 1, so c=1.
Taylor equality and cancellation of the common conjugated
series with constant 1 yields
                rescale(b,Q_D) = Q_C^N.
This is the third actual conclusion. The extra isogeny-degree
hypothesis is used only for division; do not remove it from
this clause or infer it from the first inclusion alone.

## 5. Conjugate-curve existence bridge, without thetaQuotient circularity
The discriminant of C is nonzero. Apply the pinned
exists_lattice_of_g2_g3 to sigma(g2),sigma(g3) (nonzero
discriminant preserved by the field automorphism). Apply
Weierstrass surjectivity to (sigma(e),0) to get t' outside
the new lattice with derivative zero, hence 2t' a period.
A'=sigma(A), g2'=12 sigma(e)^2-4 and A'^2=12 sigma(e)
give the native normalized datum before CM structure
(the d'=0 provisional datum in the source).
For every a in O_K, the original C admits multiplication by a
as an isogeny (a=0 may also be handled directly), with
sigma(a)=a since sigma fixes K. Section 4's FIRST clause
therefore proves a Lambda_C' subset Lambda_C'. Its SECOND
clause applied to a=omega and bar(omega) proves neither
a t' can be a period, by contradiction with the original
datum's defining two nonmembership conditions. Thus the
provisional datum upgrades to the required CM datum at d.
No use of Q=1 was required to construct it.
This supplies exists_galConjugate, leaving the standard
existence of a lattice with prescribed nonsingular invariants
and the native isogeny pullback/canonical multiplier as
upstream mathematical inputs.

At RUN67's thetaQuotient_eq_one and RUN68's simultaneous
torsion and common period arguments, use the foregoing
actual isogeny statements, not a separate appeal to a
conjectural CM reciprocity. In particular the lattice
inclusion transports both directions for the fractional
ideal comparison, and the point/section statement supplies
the finite-set torsion argument. Good-reduction and
monomial span peers are retained; do not confuse these
results with a new all-prime integrality theorem.

## Dependency and verification ledger
Source-visible graph: compact Main -> New.grh -> star_inequality ->
Data.short_forms -> A theta chain -> exists_isJetConjugate_generator ->
{CM torsion transport, common period} -> exists_conjugate_section,
conj_isogeny_mem_lattice, exists_galConjugate.
Human substitution: simultaneous ODE coefficients + elliptic
uniformization + homogeneous matching + monomial span -> common
section transport -> exact cross product -> lattice transport and
conditional quotient transport. Retain standard Weierstrass
surjectivity inputs, prescribed-invariant lattice existence,
section division, pullback/canonical multiplier and all other A/B/C
frontier nodes. No global native graph/axiom deletion; original and
reduced graph files unchanged. Context key: compact pin, C,C',D,D',
sigma, fixed z, common mu,w, actual isogeny a,N and separate guards
for each clause. No claimed RH theorem imported, no URT.
Local command -v lean/lake/elan returned none. Actual shared CI
status and targeted_results.json reread: run 45803534769,
six named B/C checks with only propext, Classical.choice, Quot.sound;
A build timeout 124 at 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. No compact rh_scan/prune/reduce/auto/frontier
run or new native PASS. Below are executable prepared scalar
certificates and native declaration/axiom probes, NOT compiled.
No synthetic tests. Independent audit requested.

RESUME HERE: trace the actual CMLattice.comp_mul_mem_sections
canonical multiplier and isogeny pullback, and the normalized
prescribed-invariant lattice existence in CurveTheta (check peers
first). Then integrate with A local jet/marked Hecke consumer;
do not redo section transport or peer good-reduction arithmetic.
HANDOFF TO integration, editor, audit, literature, native runner.
Human RH reconstruction incomplete.
-/

namespace ThetaRun69

theorem cubic_recenter (A e u v : ℂ) (he : A^2 = 12*e)
    (hc : v^2 + A*u*v = u^3+u) :
    (2*v+A*u)^2 =
      4*(u+e)^3-(12*e^2-4)*(u+e)-(4*e^3-(12*e^2-4)*e) := by
  linear_combination 4*hc + u^2*he

theorem homogeneous_multiplier (r k : ℂ) (hr : r ≠ 0)
    (h : k^2 = r^6) :
    k/r^2 ≠ 0 ∧ (k/r^2)^2 = r^2 ∧ (k/r^2)^3 = k := by
  have hk : k ≠ 0 := by
    intro hz
    apply pow_ne_zero 6 hr
    simpa [hz] using h.symm
  refine ⟨div_ne_zero hk (pow_ne_zero _ hr), ?_, ?_⟩
  · field_simp [hr] <;> linear_combination h
  · field_simp [hr] <;> linear_combination k*h

theorem cross_zero (H V W F : ℂ) (h : H*V^2 = W*F^2)
    (hH : H = 0) (hF : F ≠ 0) : W = 0 := by
  have hz : W*F^2 = 0 := by simpa [hH] using h.symm
  exact (mul_eq_zero.mp hz).resolve_right (pow_ne_zero _ hF)

theorem cross_division_zero (H V W F : ℂ) (h : H*V^2 = W*F^2)
    (hV : V = 0) (hW : W ≠ 0) : F = 0 := by
  have hz : W*F^2 = 0 := by simpa [hV] using h.symm
  by_contra hf
  exact (mul_ne_zero hW (pow_ne_zero _ hf)) hz

#print axioms cubic_recenter
#print axioms homogeneous_multiplier
#print axioms cross_zero
#print axioms cross_division_zero
end ThetaRun69

#check taylorAtZero_monomialSection
#print axioms taylorAtZero_monomialSection
#check exists_conjugate_section
#print axioms exists_conjugate_section
#check conj_isogeny_mem_lattice
#print axioms conj_isogeny_mem_lattice
#check CMLattice.exists_galConjugate
#print axioms CMLattice.exists_galConjugate
