import Lib.CM.LocalHeight.EulerAdditionFormula
import Lib.CM.MainTheorem.ConjugateCurve
import New.Curve.KatzDivisibility
import Mathlib.Tactic

/-!
# RUN59 — Euler integral addition, isogeny division and conjugate theta
26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION; new native replay pending.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10:
completion first. Read AGENTS, handoff/protocol/expansion, continuity,
research state excerpts and current manuscript d3ee05d91281a2a6264906951eae3152534b8420,
prior RUN58 d67c7a79965b417e5b79ad6a14b39beca6b120b5.
Editor RUN59 and peer arithmetic/geometry results distinct; no Euler or
conjugate-theta derivation in current manuscript. No URT assumptions.

Source bodies retrieved (relative to grh-compact/src):
Lib/CM/LocalHeight/EulerAdditionFormula.lean 1bf5479d1d6e25211a8e8c09394a78d3fa546ae4
Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd
Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa
Lib/CM/MainTheorem/ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e
New/Curve/KatzDivisibility.lean 910b6f88933a9debb15df537fa834762f8da0723

## 1. Euler integral addition (actual Katz supplier)
Fix the same CM datum and p-adic embedding. Write a=iota(a1), x=xi(s),
y=phi(s), z=xi(t), w=phi(t). Each pair satisfies H(x,y)=0, where
H(X,Y)=Y^2+aXY-X^3-X, and derivatives xi'=2phi+a xi,
phi'=1+3xi^2-a phi. The two series have zero constant terms.
a is integral by RUN58, x,z lie in the integral parameter ring by
the cubic solution (implicit recursion with coefficient 1),
y,w are its two generators. In O[[y,w]], m=xz has zero constant,
so d=1-m has the inverse sum_{j>=0} m^j; no p is inverted.
The native Euler candidate, simplifying 1+m/d=1/d, is
 B=(1+m)(y+w)-a y w,
 C=(3+m)(x+z)+a^2 m,
 E=x w+z y+a m,
 N=d B+C E,
 F=N/d^3.                                                  (E)
Let D be partial_s minus partial_t; on the polynomial ring it sends
(x,y,z,w) to (2y+ax, 1+3x^2-ay, -2w-az, -1-3z^2+aw).
Direct exact identity, before norms:
 d D(N)+3 N D(m)=Q1 H(x,y)+Q2 H(z,w),                    (P)
 Q1=4a^2 x z^3+2a^2 z^2+4a w x z^2-4a w z
       +4x z^4+12x z^2+20z^3+12z,
 Q2=-4a^2 x^3 z-2a^2 x^2-4a x^2 y z+4a x y
       -4x^4 z-20x^3-12x^2 z-12x.
Thus DF=0, and F(s,0)=phi(s). In the characteristic-zero ambient
formal series field, change coordinates r=s+t, h=t. D=-partial_h.
Kernel of partial_h consists of series independent of h because
all positive integers are nonzero. Therefore F(s,t)=phi(s+t).
Since (E) belongs to the integral image O[[phi(s),phi(t)]],
this proves the actual translatedWpDeriv_add_mem_multiPhiRing,
including p=2, by calculation over char zero followed by membership,
not by asserting the derivative kernel statement in char p.
For the Katz consumer: put M_n=max_j |n! [s^n]phi(s)^j|, finite
because ord phi=1. For any integral bivariate series in phi(s),phi(t),
the coefficient of s^n t^k times n! k! has norm <= M_n M_k
(only indices <=n,<=k contribute, ultrametric triangle).
Apply to phi(s+t)^j, whose same coefficient times n!k! is
(n+k)![u^(n+k)]phi(u)^j exactly. Take max_j:
                     M_(n+k) <= M_n M_k.
This is the actual submultiplicative input to the existing RUN52
Katz degree contradiction, with its native scale unchanged.

## 2. Isogeny pullback by division of one unit series
For isogeny a:C->C' of degree N (retain area and lattice inclusion),
apply RUN57 integral section and RUN58 local height to theta' and
G'=phiThetaCube' in degrees 1 and 3, pulled back by z->az.
Obtain theta'(az)=theta(z)^N v, G'(az)=theta(z)^(3N) u
as Taylor series over the given p-adic embedding, u,v integral
in phi. At zero theta'(0)=theta(0)=1 gives v(0)=1.
Its reciprocal is integral by coefficient recursion (constant 1).
Since G'=theta'^3 phi' at the Taylor germ,
                     phi'(az)=u v^(-3).
Cancel theta^(3N) in the ambient series ring where it is a unit;
there is no division by a or by N. This proves both conjuncts
of rescale_translatedWpDeriv_mem. The coefficient of z is iota(a)
since phi' has linear coefficient 1. In the original phi parameter
its coefficient is unchanged (phi(z)=z+...), hence |iota(a)|<=1.
This supplies the isogeny integrality used in FormalHeight and
Chowla-Selberg; does not itself prove either of those entire theorems.

## 3. Conjugation of the normalized theta (no analytic period assumption)
Use sigma for an automorphism fixing K, and S for the sigma-function.
For C' with a1'=sigma(a1), formal xi',phi' Taylor series are the
coefficientwise sigma-conjugates of xi,phi: the displayed ODEs
determine coefficients recursively from constant terms zero by
division by n+1 in characteristic zero. Let
 T_C=theta_C'/sigma(theta_C) (Taylor quotient), constant 1.
By the monomial section identity, conjugate a degree-m monomial
theta^i S^(2j) G^k by its matching monomial in C', multiplying
Taylor series by T_C^m (i+2j+3k=m). Extend semilinearly using
the native finite spanning theorem. This is independent of the
spanning expression by the identity theorem for entire sections.

The same section transport has a common point evaluation witness
for all m and f. At a point z with theta_C'(z) nonzero, the affine
pair (xi',phi') maps back under sigma^-1 to a point of the
original cubic. Native Weierstrass uniformization realizes it at
some y with theta_C(y) nonzero; choose mu=theta_C'(z)/sigma(theta_C(y)).
Then theta', S'^2, G' evaluations are mu^1, mu^2, mu^3 times the
conjugate values, so every monomial and linear combination agrees.
At theta_C'(z)=0 take y=t_C, as in the actual source. The S and G
values are nonzero and G^2=S^6 there. Put
 r=S_C'(z)/sigma(S_C(t_C)), g=G_C'(z)/sigma(G_C(t_C)).
Then g^2=r^6, so mu=g/r^2 satisfies mu^2=r^2, mu^3=g.
This proves the required common point transport without choosing
a square root of mu and with correct sign even at the exceptional point.

For isogeny a:C->D of degree N, C',D' conjugate invariant data,
transport theta_D(a z) and S_D(a z)^2 to sections A1,A2 on C'.
The Taylor relations just established give, by exact cancellation
of the common quotient factors and the entire identity theorem,
 A2(z)*theta_D'(sigma(a) z)^2 =
 S_D'(sigma(a) z)^2*A1(z)^2.                              (J)
At z=0, A1=1 and A2=0. For every l in Lambda_C', multiplier
law yields A1(l) nonzero and A2(l)=0. Thus S_D'(sigma(a)l)=0,
which is precisely conjugate lattice inclusion.
At t_C', if sigma(a)t_C' is a period, then (J) implies A2(t_C')=0;
the exceptional point witness above says A2(t_C')=mu^(2N)
sigma(S_D(a t_C)^2), hence a t_C is a period.
If the conjugate isogeny has SAME degree N and a!=0, its pulled-back
theta has simple zeros; at each, the pulled-back S is nonzero,
so (J) forces A1 to vanish there. Native section division at equal
degree and same multipliers makes A1 divided by this pulled-back
theta a constant. Value at zero is 1. Therefore the actual third
conj_isogeny_mem_lattice conclusion holds:
           T_D(sigma(a)z)=T_C(z)^N.
Retain the source section span, uniformization, multiplier, section
division, and equal-degree hypotheses. No claim that arbitrary
conjugate periods have been identified.

For endomorphisms a in O_K of the original and conjugate CM data
of the SAME d, a is fixed by sigma, preserves both lattices and
has degree a*conj(a). Thus T_C(az)=T_C(z)^(a*conj(a)).
If T_C!=1 let n>=1 be the least nonzero coefficient c_n of T_C-1.
Comparing degree n and cancelling c_n gives a^n=a*conj(a).
a=2 implies n=2; a=quadGen=(1+sqrt(-d))/2 then implies
a=conj(a), impossible. Hence T_C=1 exactly. This proves
thetaQuotient_eq_one, the actual conjugate-theta supplier for
exists_taylorVia_twistedTranslate_theta. No assumption that
sigma commutes with analytic complex conjugation for arbitrary
complex numbers: only sigma fixes these elements of K.
The finite simultaneous torsion-translate and adelic cluster
construction remain to be reconstructed.

## Execution and graph
Actual local SymPy exact polynomial reduction (not Lean):
    import sympy as s
    x,z,y,w,a=s.symbols('x z y w a')
    m=x*z; d=1-m
    N=d*((1+m)*(y+w)-a*y*w)+((3+m)*(x+z)+a*a*m)*(x*w+z*y+a*m)
    D=lambda f:s.diff(f,x)*(2*y+a*x)+s.diff(f,y)*(1+3*x*x-a*y)-s.diff(f,z)*(2*w+a*z)-s.diff(f,w)*(1+3*z*z-a*w)
    P=s.expand(d*D(N)-3*N*D(d))
    g=s.groebner([y*y+a*x*y-x**3-x,w*w+a*z*w-z**3-z],y,w,x,z,a)
    q,r=g.reduce(P)
    assert r==0
    assert s.expand(N.subs({z:0,w:0})-y)==0
Observed remainder 0, explicit quotients Q1,Q2 above, boundary 0.
These exact polynomial identities establish the algebra step (P),
not finite random tests and not kernel verification.

Native Lean and lake not present (command -v checked). Latest
primitive CI jobs run 45803534769 retrieved: six native checks
in Selmer/Filling with only standard three axioms per authenticated
receipt d07359dc70c3f9f28e4858c835e5fa5424b6f539; JetExponentBound
timed out before probe, return 124. Earlier targeted replay
45799225653 reported 14 checks, no full RH replay. No new native
PASS or old-pin engines applied to compact source.
Prepared executable scalar algebra certificate and actual #print axioms
below for shared runner; no workflow changes.
Original contextual source paths:
 C depth jet -> KatzDivisibility -> EulerAdditionFormula ->
 IntegralParameter; formal height -> rescale_translatedWpDeriv_mem ->
 integral section/local height -> RUN57/58; CM soft main theorem ->
 exists_taylorVia_twistedTranslate_theta -> thetaQuotient_eq_one ->
 conj_isogeny_mem_lattice -> exists_conjugate_section.
Reduced HUMAN graph: polynomial quotient identity plus zero
boundary -> Euler -> actual M submultiplicativity; section bound
plus unit inverse -> isogeny norm; ODE recursion + common
weighted projective point + J + equal-degree division -> conjugate
theta quotient -> lowest coefficient contradiction.
No globally pruned native nodes. Cache key pin,d,p,iota,C,C',D,D',
sigma,a,N,section degree; retain all type/value/axiom dependencies
and unvisited A/B/C frontier. No root import or shortcut.

RESUME HERE: reconstruct exists_taylorVia_twistedTranslate_theta
in ConjugateCurve.lean at the common finite S, denominator n,
2n^2 lift and normalization c=1, then actual
complex_multiplication_theta and chowla_selberg consumers in
FormalHeight.lean. Retain exact finite witnesses, adele compactness,
class-group square map, Kronecker limit and area normalization.
HANDOFF TO integration/editor (merge three actual supplier blocks),
formal audit, shared compact verification. Human proof incomplete.
-/

namespace CompactCharacterBoxes59

theorem euler_cleared_identity {R : Type*} [CommRing R]
    (x y z w a : R) (hx : y^2+a*x*y-x^3-x=0)
    (hz : w^2+a*z*w-z^3-z=0) :
    let m := x*z
    let d := 1-m
    let dx := 2*y+a*x
    let dy := 1+3*x^2-a*y
    let dz := -2*w-a*z
    let dw := -(1+3*z^2-a*w)
    let dm := dx*z+x*dz
    let B := (1+m)*(y+w)-a*y*w
    let C := (3+m)*(x+z)+a^2*m
    let E := x*w+z*y+a*m
    let N := d*B+C*E
    let dB := dm*(y+w)+(1+m)*(dy+dw)-a*(dy*w+y*dw)
    let dC := dm*(x+z)+(3+m)*(dx+dz)+a^2*dm
    let dE := dx*w+x*dw+dz*y+z*dy+a*dm
    d*(-dm*B+d*dB+dC*E+C*dE)+3*N*dm=0 := by
  dsimp
  linear_combination
    (4*a^2*x*z^3+2*a^2*z^2+4*a*w*x*z^2-4*a*w*z+4*x*z^4+12*x*z^2+20*z^3+12*z)*hx +
    (-4*a^2*x^3*z-2*a^2*x^2-4*a*x^2*y*z+4*a*x*y-4*x^4*z-20*x^3-12*x^2*z-12*x)*hz

theorem weighted_point_sign {K : Type*} [Field K] (r g : K)
    (hr : r ≠ 0) (h : g^2=r^6) :
    (g/r^2)^2=r^2 ∧ (g/r^2)^3=g := by
  constructor
  · field_simp
    linear_combination h
  · field_simp
    linear_combination g*h

end CompactCharacterBoxes59

#check CMLattice.translatedWpDeriv_add_mem_multiPhiRing
#check CMLattice.katz_divisibility_limit
#check CMLattice.rescale_translatedWpDeriv_mem
#check CMLattice.norm_le_one_of_isogeny
#check exists_conjugate_section
#check conj_isogeny_mem_lattice
#check CMLattice.thetaQuotient_eq_one
#print axioms CMLattice.translatedWpDeriv_add_mem_multiPhiRing
#print axioms CMLattice.rescale_translatedWpDeriv_mem
#print axioms conj_isogeny_mem_lattice
#print axioms CMLattice.thetaQuotient_eq_one
#print axioms CompactCharacterBoxes59.euler_cleared_identity
#print axioms CompactCharacterBoxes59.weighted_point_sign
