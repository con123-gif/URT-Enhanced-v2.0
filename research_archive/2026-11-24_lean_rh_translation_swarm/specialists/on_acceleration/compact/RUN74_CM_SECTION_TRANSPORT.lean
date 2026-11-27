import Lib.CM.MainTheorem.ConjugateCurve
import Mathlib.Tactic

/-!
# RUN74 — simultaneous section transport, isogeny and CM closure
2026-11-27. HUMAN SOURCE-MATCHED derivation; scalar Lean certificates
prepared, not compiled. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207 (Lean 4.35.0).
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 including
mandatory engine; AGENTS, protocol, handoff and expansion read.
Peers 847ff2e5 (exchange), 52a17e4e (cutoff), 88e0a9bc (Rallis),
ff5c7bc2 (saturation) inspected; distinct from this A supplier.
Resume own RUN73 8835e36b, RUN72 2a198f50. Source ledger (compact paths):
* Lib/CM/LocalHeight/IsogenyIntegrality.lean
  1b7411b4a950de12649c1f2cd171de834f8363fa:
  taylorAtZero_monomialSection, exists_conjugate_section.
* Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
  exists_weierstrassP_eq_of_cubic, exists_lattice_of_g₂_g₃,
  phiThetaCube_spec, phiThetaCube_sq_add, a₁_sq, g₂_eq, g₃_eq.
* Lib/CM/Sigma/PadicSeriesDefs.lean 5eebedb97cff53ded1241d70add1b515300368ca:
  monomialSection_eq, monomialSection_mem, section_division,
  sections_le_span_monomialSection, eq_of_taylorAtZero_eq.
* Lib/CM/LocalHeight/IntegralParameter.lean
  9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
  derivative_taylorVia_translatedWp, derivative_taylorVia_translatedWpDeriv.
* Lib/CM/MainTheorem/ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52:
  conj_isogeny_mem_lattice, exists_galConjugate, thetaQuotient_eq_one,
  exists_taylorVia_twistedTranslate_theta.

## 1. Formal conjugation before norms or analytic evaluation
Write tau for the field automorphism, s for the sigma function,
T for Taylor series at zero. For C and D with a_D=tau(a_C),
write X=translatedWp, Y=translatedWpDeriv, a=a1. The native
differential identities are X'=2Y+aX, Y'=1+3X^2-aY, X(0)=Y(0)=0.
For Taylor coefficients x_n,y_n:
 (n+1)x_(n+1)=2y_n+a x_n,
 (n+1)y_(n+1)=1_(n=0)+3 sum_(i=0)^n x_i x_(n-i)-a y_n.
Induction over n proves uniqueness, since n+1 is invertible in C.
Applying tau coefficientwise commutes with all finite sums,
products and division by n+1; hence T X_D=tau(T X_C),
T Y_D=tau(T Y_C). No continuity of tau is used.
Put Q=T theta_D/(tau T theta_C); the denominator is a unit
with constant coefficient one. For M=theta^j (s^2)^b G^c,
m=j+2b+3c, the off-zero coordinate identity gives locally
T M=(T theta)^m (T X)^b (T Y)^c, so
 T M_D=Q^m tau(T M_C).
This establishes the actual monomial Taylor supplier.

## 2. A single point and scalar work for every degree
Given z on D, put (H_D,S_D,G_D)=(theta_D(z),s_D(z)^2,G_D(z)),
where G=phiThetaCube. The global homogeneous equation is
 G^2+a S H G=S^3+S H^4.
If H_D != 0 set x=tau^-1(S_D/H_D^2), y=tau^-1(G_D/H_D^3).
Then y^2+a_C*x*y=x^3+x. With e=wp_C(t_C), define
 u=x+e, v=2y+a_C*x.
Using a_C^2=12e, g2=12e^2-4, g3=4e^3-g2*e,
 v^2-(4u^3-g2*u-g3)=4(y^2+a_C*x*y-x^3-x)=0.
The retained actual cubic uniformisation theorem yields w outside
Lambda_C with wp(w)=u and wp'(w)=v. Let y0=w-t_C.
Its translated coordinates are exactly x,y; theta_C(y0)!=0.
Choose mu=H_D/tau(theta_C(y0)) !=0. Both remaining coordinates
then agree by multiplication of the affine ratios:
 S_D=mu^2 tau(s_C(y0)^2), G_D=mu^3 tau(G_C(y0)).

If H_D=0, choose y0=t_C (the source explicitly requires this).
Since z+t_D is a period and t_D is not, z is not a period;
s_D(z)!=0. Likewise s_C(t_C)!=0 and theta_C(t_C)=0 since 2t_C
is a period. The homogeneous equation gives G_D^2=S_D^3,
G_C(t_C)^2=S_C(t_C)^3, so both G coordinates are nonzero.
With r=S_D/tau(S_C), q=G_D/tau(G_C), we have q^2=r^3 and r,q!=0.
The SAME weighted scalar is uniquely mu=q/r:
 mu^2=r, mu^3=q.
This agrees with the native expression G ratio / (s ratio)^2.
It avoids any root choice or phase ambiguity at the theta-zero point.
Thus in both cases the three homogeneous coordinates agree with
weights (1,2,3). All choices precede m and f. This is essential
for the common torsion witness of RUN73.

## 3. Spanning and transfer (no universal dimension theorem needed
beyond the degree-one base, or use the residue theorem there)
Every monomial with nonnegative j,b,c belongs to sections m, by
the native automorphy and entire extension. At the theta-zero
point -t, S and G are nonzero by the same equation. For m>=2
choose c=m mod 2, b=(m-3c)/2, j=0. The monomial M of weight m
is nonzero at -t. For any section f of weight m subtract
(f(-t)/M(-t))*M. The difference vanishes at all zeros of theta:
they are -t+Lambda and automorphy propagates the zero.
Theta has simple zeros, so division by theta extends to an entire
section of weight m-1 by cancellation of the automorphy factors.
Induct starting with m=0 (periodic entire is constant) and m=1
(native degree-one dimension and theta(0)=1); multiplying by theta
raises j by one. Alternatively m=1 follows because the elliptic
quotient f/theta has at most one simple pole mod Lambda and its
residue must vanish by the residue theorem on a shifted fundamental
parallelogram. This proves the actual spanning statement with c<=1.
No m<2 arithmetic is assumed in the choice of b.

Expand f in this finite monomial family and define g by replacing
each coefficient by tau(coefficient) and each monomial by its D
version. g is a degree-m section. Section 1 and the weight-m
coordinate equality of section 2 give simultaneously
 T g=Q^m tau(T f),  g(z)=mu^m tau(f(y0)).
Independence of expansion follows by entire Taylor injectivity
(also enough for uniqueness; no arbitrary basis choice affects g).
This proves exists_conjugate_section under the cited analytic
foundations, including the condition theta_D(z)=0 => y0=t_C.
The scalar is a single witness for the whole graded section algebra.

## 4. General conjugate isogeny, needed even after RUN73
Take an isogeny a:C->E of degree N, with conjugates D,F of
the corresponding a1 invariants. Let A,B be the transported
sections of degrees N,2N of theta_E(a*z), s_E(a*z)^2.
The transported Taylor series do not depend on the point used
to choose them, by uniqueness just proved. The exact identity
 B(z)*theta_F(tau(a)*z)^2=s_F(tau(a)*z)^2*A(z)^2
follows from section 1 and cancellation of the common formal
factors Q_D(z)^(2N) Q_F(tau(a)*z)^2, then Taylor injectivity.
More precisely both sides have this common factor times the
same conjugated product, using rescale on Taylor series.
At zero A(0)=1, B(0)=0 because both Q have constant 1.
For every l in Lambda_D, automorphy yields A(l)!=0 and B(l)=0.
The identity forces s_F(tau(a)*l)=0, i.e. tau(a)*l in Lambda_F.
At t_D, if tau(a)*t_D is a period of F, theta_F there is nonzero,
so B(t_D)=0. The evaluation witness at t_D from section 2 has
y0=t_C; hence tau(s_E(a*t_C)^2)=0 and a*t_C is a period of E.
This proves the first TWO assertions of conj_isogeny_mem_lattice
without supposing the conjugate map already has degree N.

For the third assertion keep its explicit hypotheses a!=0 and
the conjugate isogeny of degree N. At each zero of theta_F(tau(a)z),
s_F(tau(a)z)!=0, so A vanishes. Both sections have weight N
and the denominator has simple zeros. Their ratio extends
to an entire periodic function, therefore constant, and both
values at zero are one. Equality of Taylor series, with the
common unit tau(T(theta_E(a*z))) cancelled, now yields
 Q_F(tau(a)*z)=Q_D(z)^N.
This supplies the general isogeny law retained by RUN73, rather
than claiming its other consumer disappeared.

## 5. Construct conjugate CM curve without presuming CM
Given C with prime d=7 mod 8 and tau fixing K=Q(sqrt(-d)),
apply retained lattice existence to tau(g2),tau(g3);
the discriminant is nonzero by injectivity of tau. Its cubic
contains (tau(wp_C(t_C)),0). Uniformisation gives t_D outside
Lambda_D with those coordinates. The native wp' zero
characterisation gives 2t_D in Lambda_D. The defining a1 and
g2 identities transport coefficientwise, so D is first a
legitimate CMLattice 0, which requires no CM condition.
For each a in O_K nonzero, multiplication by a is an isogeny
on C (retained lattice index/area lemma). Apply section 4,
first assertion with tau(a)=a, to D. Thus O_K preserves
Lambda_D (a=0 immediate). For a=omega and conjugate omega
the second assertion gives a*t_D in Lambda_D => a*t_C in
Lambda_C, contradicting the original CM datum's exclusions.
Consequently D satisfies all CMLattice d fields and a1(D)=tau(a1(C)).
No circular assumption of CM on the conjugate curve.
This supplies exists_galConjugate, then RUN73 self-isogeny
normalisation and finite torsion conjugacy, RUN72 frame generator,
RUN71 vacuum estimate and A's archimedean/local jet callers.
The finite Weil frame local-height normalization, Chowla-Selberg,
vacuumRoot norm, marked Hecke quantitative suppliers, other
A leaves and B/C remain explicitly open; RH remains open.

## Execution and audit
Local command -v lean/lake/elan found none. Actual receipt
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
on cathedral-research-state blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six earlier named native checks with propext, Classical.choice,
Quot.sound, module_1_build timeout 124 (2700.11s), all_requested_checks_ok
false, full_RH_replay=false. Native unified engines not run on this pin.
The following exact SymPy script was executed locally, after correcting
two initial assertion expressions that compared structurally different
but algebraically identical forms. Output: 3 exact rational identities;
13 formal cubic coefficients; 2 initial coefficients; wrong-sign
control: 4*A/3. Finite algebra checks are not proof of formal uniqueness.
Reproduce with Python/SymPy:
    import sympy as s
    a,x,y,t=s.symbols('a x y t'); g2=12*t*t-4; g3=4*t**3-g2*t
    D=(2*y+a*x)**2-(4*(x+t)**3-g2*(x+t)-g3)-4*(y*y+a*x*y-x**3-x)
    assert s.expand(D-x*x*(a*a-12*t))==0
    A=s.symbols('A'); r,q=s.symbols('r q',nonzero=True)
    assert s.cancel((q/r)**2-r-(q*q-r**3)/r**2)==0
    assert s.cancel((q/r)**3-q-q*(q*q-r**3)/r**3)==0
    def rec(sign):
      X=[s.Integer(0)]; Y=[s.Integer(0)]
      for n in range(12):
        X.append(s.expand((2*Y[n]+A*X[n])/(n+1)))
        Y.append(s.expand((int(n==0)+3*sum(X[i]*X[n-i] for i in range(n+1))+sign*A*Y[n])/(n+1)))
      return X,Y
    def coeff(X,Y,n):
      return s.expand(sum(Y[i]*Y[n-i]+A*X[i]*Y[n-i] for i in range(n+1))-sum(X[i]*X[j]*X[n-i-j] for i in range(n+1) for j in range(n-i+1))-X[n])
    X,Y=rec(-1)
    for n in range(13): assert coeff(X,Y,n)==0
    assert X[2]==1 and Y[1]==1
    bad=coeff(*rec(1),3); assert bad!=0
    print('3 exact rational identities; 13 formal cubic coefficients; 2 initial coefficients; wrong-sign control:',bad)

Original/reduced global graphs and axiom ledger preserved, no edge
retired globally. Local replacement graph: formal recurrence + weighted
coordinate transfer + monomial span -> section transport -> general
isogeny -> conjugate curve -> RUN73 torsion -> RUN72 generator.
Retain uniformisation, lattice existence, wp' zero characterisation,
simple zeros, exact automorphy, degree-one base and Taylor identity
as foundational inputs. Context key includes source pin, both curves,
tau, a1 equality, point and mu; general isogeny also a,N and all four
curves. No URT or speed claim; no proof of weighted prime bound.

RESUME HERE: use this section-transport closure at RUN72's actual
same-frame local-height integrality caller; derive the common
finite representative local gauge bound including the Chowla-Selberg
vacuumRoot scalar (or identify exact residual input). Independently
audit all-degree transport and the CMLattice 0 construction, then
replay actual theorem probes and scalar checks using shared runner.
HANDOFF TO integration/editor, independent audit, theta and kernel
lanes. Do not reopen RUN73 torsion normalization unless a defect found.
-/

namespace RHAccelerationRun74
theorem affine_cubic (a x y e : ℂ)
    (ha : a^2 = 12*e) (h : y^2+a*x*y=x^3+x) :
    (2*y+a*x)^2 = 4*(x+e)^3-(12*e^2-4)*(x+e)-
      (4*e^3-(12*e^2-4)*e) := by
  linear_combination 4*h + x^2*ha

theorem infinity_scale (r q : ℂ) (hr : r ≠ 0) (hq : q ≠ 0)
    (h : q^2 = r^3) :
    q/r ≠ 0 ∧ (q/r)^2 = r ∧ (q/r)^3 = q := by
  refine ⟨div_ne_zero hq hr, ?_, ?_⟩
  · field_simp [hr]
    linear_combination h
  · field_simp [hr]
    linear_combination q*h

theorem weighted_monomial (h s g u v w mu : ℂ) (j b c m : ℕ)
    (hm : j+2*b+3*c=m) (hh : h=mu*u) (hs : s=mu^2*v)
    (hg : g=mu^3*w) :
    h^j*s^b*g^c=mu^m*(u^j*v^b*w^c) := by
  rw [hh,hs,hg,← hm]
  simp only [mul_pow, pow_mul, pow_add]
  ring

#check CMLattice.sections_le_span_monomialSection
#check CMLattice.monomialSection_mem
#check exists_conjugate_section
#check taylorAtZero_monomialSection
#check CMLattice.conj_isogeny_mem_lattice
#check CMLattice.exists_galConjugate
#print axioms affine_cubic
#print axioms infinity_scale
#print axioms weighted_monomial
end RHAccelerationRun74
