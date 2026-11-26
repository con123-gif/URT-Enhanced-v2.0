import New.Curve.ConjugateGenerator
import Mathlib.Tactic

/-!
# RUN60 — simultaneous torsion transport, common finite adele, Chowla–Selberg period
26 Nov 2026. Human source-matched derivations; independent audit and new native replay pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first); manuscript
453bda2e354d1b1f315ad29be24843cec846bee0; RUN59 afcf28ec6aeeeccf79261608b29e28b61f6bed4c.
Read mission, protocol, handoff, expansion, AGENTS, continuity/state excerpts and editor's
current OPEN list: finite simultaneous torsion/CM assembly is explicitly outstanding.

Pinned source (grh-compact/src):
Lib/CM/MainTheorem/ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52, 60–110.
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e, 38–131.
Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa.
Lib/CM/Sigma/PadicSeriesDefs.lean 5eebedb97cff53ded1241d70add1b515300368ca.
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7.
Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626.
Lib/CM/Genus/QuadraticZeta.lean 51f575a20ca3dc4831d287d2f14f597586b96fff.
New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1.
New/Curve/PeriodDefs.lean 7dcfa329642087071f8bc9f1976e004eb7fb20ef.
Companion grh/src/Lib/CM/ChowlaSelberg.lean at same pin consulted for notation,
not used as a proof substitute.

## 1. One torsion witness for the entire finite set
Fix d prime 7 mod 8, K=Q(sqrt(-d)), O=O_K, sigma fixing K,
Lambda_C=Omega0 O, D.a1=sigma(C.a1). Retain the common section
transport and thetaQuotient=1 from RUN59. Conjugate in the reverse
direction using sigma^-1. Let S be a finite subset of K. Choose one
positive integer n with n*x in O for every x in S. Put u=Omega0/(2n^2).
At u the common weighted evaluation theorem gives y in C (a complex
point on the D uniformization), mu nonzero, such that every degree m
D section f has its unique C transport g with Taylor coefficients
sigma^-1 f and g(u)=mu^m sigma^-1(f(y)).
Uniqueness is the entire identity theorem, not a choice of separate points.

For every a in O, a≠0, pull back by the isogeny z->az; its degree is
a*bar a on both lattices. Taylor transport commutes with this pullback
because sigma fixes a. Hence for any such pair of degree m sections,
    g(a u)=mu^(m N(a)) sigma^-1(f(a y)).             (Z)
For a=0 the equality of zero evaluations follows directly from the
Taylor identity (interpret exponent zero as 1). Apply to the matching
sigma-function squared sections at a=2n^2. Since sigma_C(Omega0)=0
(the sigma-function here, not the automorphism), sigma_D(2n^2 y)=0.
Thus v=2n^2 y belongs to Lambda_D. It is chosen BEFORE x.

For a fixed x in S define f_D(z)=U^D_(x v) theta_D(n z),
f_C(z)=U^C_(x Omega0) theta_C(n z), where the notation means evaluation
of the translated section at n z. Both are sections of degree n^2:
n x v and n x Omega0 are periods because n x belongs to O.
Transport f_D to g on C. To prove f_C divides g, any zero z of f_C
satisfies n z+x Omega0+t_C in Lambda_C. Since 2t_C is a period,
2n z+2x Omega0 is in Lambda_C, so z=(a-2n x)u for some a in O
(in fact a can be taken n times the resulting integral label).
Then theta_C(n a u)=theta_C(n z+x Omega0)=0.
Apply (Z) to the common transported theta sections with scalar n a:
theta_D(n a y)=0. But n(a-2n x)y+x v=n a y exactly.
Hence f_D((a-2n x)y)=0, and (Z) for f_D,g yields g(z)=0.
The case a-2nx=0 uses equality of constant coefficients. All zeros
of f_C are simple (n nonzero, exponential never zero, theta simple).
Equal degree and equal multiplier imply g=c f_C for a constant c.
This uses the native section_division, including its degree-zero
constant-section conclusion, not a norm comparison.

Normalize c without a root ambiguity. At z=-nx u the argument n z
is -x Omega0/2 and n(-nx)y=-xv/2. For any lattice E the exact twisted
translate identity is (U_(2h) theta_E)(-h)=theta_E(h), from exponential
cancellation; theta_E is even. If theta_E(h)=0, the multiplier at 2h
gives (U_(2h) theta_E)(0)=-1 (2h is a period and the half-period sign
is negative). Apply (Z) with a=-nx to f_D,g and to theta_D(n·),
theta_C(n·), both of degree n^2. The identical mu power cancels
before division: g(-nxu)=theta_C(x Omega0/2), so c=1 when this
value is nonzero. If zero, the same theta comparison makes
theta_D(xv/2)=0. Both translates then have value -1 at zero.
Equality of constant coefficients gives g(0)=-1=f_C(0), again c=1.
Thus sigma(Taylor U_(x Omega0)theta_C)=Taylor U_(x v)theta_D
for EVERY x in S, with the SAME v. This reconstructs
exists_taylorVia_twistedTranslate_theta; no independent choice per x,
no appeal to an unidentified Artin element.

## 2. The common adele and exact area normalization
Class group squaring is bijective in the actual prime discriminant
case (native classGroup_sq_bijective; ordinary genus-theory special
case). For clarity the native elementary proof: if I^2=(alpha)
and N I=n, alpha*bar alpha=n^2. Choose the sign so bar alpha+n≠0.
J=(bar alpha+n)I then J^2=(N J) by direct expansion. Write N J=s^2 r,
r squarefree; unique factorization of ideals gives J=(s)B and B^2=(r).
Every prime dividing r must ramify (else some prime ideal exponent is
odd), so r is 1 or d. Since (sqrt(-d))^2=(d), B and J are principal;
hence I principal. Finite class group and trivial 2-torsion imply
bijectivity. Retain the ordinary ideal-factorization and ramification
theorems (only d ramifies).

Write Lambda_D=kappa c^2 for one nonzero integral ideal c and kappa≠0,
using this square-map on the class of the lattice ideal. Let e=N c>0,
Omega=kappa e. Since area(O)=sqrt(d)/2 and N(c^2)=e^2,
    A_D=|Omega|^2 sqrt(d)/2,   Omega e=kappa e^2 in Lambda_D.
For each finite S the v_S in step 1 has v_S=kappa b_S with b_S in c^2.
Put a_S=b_S/e in K. Then v_S=Omega a_S and all images a_S in finite
adeles lie in the SAME compact set e^-1 * O_hat (since c^2 integral).
The net over finite subsets ordered by inclusion has a cluster point
beta in that compact set: closed tail closures have the finite
intersection property because the indexing set is directed.
No assumption of convergence, of unit ideles, or of Artin reciprocity.
This is the exact existential quantifier in complex_multiplication_theta.
For a finite family of required torsion labels T, and any neighborhood
of beta, choose S containing T with a_S in that neighborhood by the
cluster property. In the native generator consumer the finite-part
Weil action on the chosen vector W' is locally constant; for fixed
finite adele gamma, choose the neighborhood by continuity of
a -> finiteImage(gamma) * incl(a) followed by this action.
Take T to contain every label
    -Tr_{E/K}(gamma_i * bar(zeta^j))/N.
The same S supplies all scalar theta Taylor identities and the same
action as beta. Thus one beta per sigma works for all subsequent
finite label sets, including the consumer's simultaneous coordinates,
not one unrelated multiplier per coordinate. The subsequent product
substitution/finite frame identities remain native prerequisites.

## 3. One global p-adic unit, simultaneously all conjugate areas
Let h=class number>0. Choose ideal a_c per class. For each c the
fractional ideal r_c=a_(c^2)/a_c has class c. Choose CM data D_c and
u_c≠0 with Lambda_Dc=u_c r_c Lambda_C, as in the actual native
exists_latticeModule_eq_scaledIdeal_mul. Since squaring permutes
classes, product_c r_c=O exactly, not merely principal.
For any p and embedding iota, every z in u_c r_c is an isogeny
multiplier C->D_c (zero harmless) and hence |iota z|<=1 by RUN59.
Every z in u_c^-1 r_c^-1 likewise maps D_c->C. Products and finite
sums of products retain integrality by the ultrametric inequality.
Their product modules are (product u_c)O and (product u_c)^-1 O.
Evaluating at 1 in O gives |iota(product u_c)|=1. No separate u_c
is assumed a unit. Let disc_c=a1(D_c)^4-64≠0, a unit at every p
by RUN58 and disc_eq. Choose one complex w satisfying
    w^(12h)=product_c (u_c^12 disc_c).
Then w≠0 and |iota w|=1 for every p,iota, by taking the positive
12h-th root of the norm equation. The same w is used for every sigma.

For any sigma fixing K, transport both directions of each isogeny
inclusion from RUN59. This gives equality
    Lambda_Dc^sigma=sigma(u_c) r_c Lambda_C^sigma
(the reverse inclusion follows by multiplying the inverse ideal).
Thus A_c=A_C^sigma |sigma u_c|^2 N(r_c), and the D_c^sigma run
through every ideal class relative to any fixed representative of
Lambda_C^sigma. Logarithms of N(r_c) sum to zero, exactly.
Using sigma disc_c=disc(D_c^sigma), take logs:
    log A_C^sigma+2 log|sigma w|
     = (1/h) sum_c [log A_c+(1/6)log|disc(D_c^sigma)|].   (CS1)

To evaluate the mean, set k=2/sqrt(d). The exact native kronecker_limit
has F_c(1)=pi k and right derivative
 F'_c(1)=pi k [2 gamma-log(A_c/(k pi^2))-(1/6)log|disc(D_c^sigma)|],
where for 1<s<2 F_c(s)=(s-1) sum_{l≠0 in Lambda_c}
 (|l|^2/(k A_c))^-s. This is the classical first Kronecker limit
formula in the source's area/discriminant normalization; it is a
retained standard analytic theorem, not derived from RH.
For Lambda_c=z_c b_c, k A_c=|z_c|^2 N b_c. Nonzero y in b_c
corresponds to integral ideal I=(y)/b_c in the inverse class,
with N I=|N y|/N b_c; every ideal in that class has exactly two
preimages (units ±1, since d>=7). Therefore for s>1 near 1,
 sum_c F_c(s)=2(s-1) zeta_K(s)=2(s-1) zeta(s)L(s,chi_K).
The nonzero-ideal series is absolutely convergent there.
At 1 compare values: h pi k=2 L(1)>0. Compare right derivatives:
 pi k sum_c [2 gamma-log(A_c/(k pi^2))-(1/6)log|disc_c^sigma|]
  =2[gamma L(1)+L'(1)].
Here (s-1)zeta(s) has value 1 and derivative gamma; the L-function
is analytic at 1. Take real parts and divide by h pi k.
Consequently (CS1) equals log(k pi^2)+gamma-Re(L'/L)(1).
Exponentiating yields the actual chowla_selberg conclusion
    A_C^sigma |sigma w|^2 = (2 pi^2/sqrt(d)) exp(ell),
 ell=gamma-Re(L'/L)(1,chi_K).
No gamma-product period identity or classwise equidistribution
assumption is needed. Retain the first limit formula, quadratic
Euler factorization and ordinary lattice ideal identification.

## 4. Actual period consumer in ConjugateGenerator
Use the SAME w above in periodFactor=s0/w, the native areaScale
satisfying areaScale^2=2pi/sqrt(d), and Omega_sigma from step 2.
The source norm_gal_vacuumRoot gives |sigma s0|^2=rd_E/sqrt(d).
The actual generator defines t=sigma(s0/w)*areaScale/Omega_sigma.
Before bounding anything, substitute
  |Omega_sigma|^2 |sigma w|^2
    =2 A_C^sigma |sigma w|^2/sqrt(d)
    =4pi^2 exp(ell)/d.
It follows exactly that
    |t|^2 = rd_E/(2pi exp(ell)) = bigOmega^-1.         (P)
This is the t-norm supplier of exists_isJetConjugate_generator,
and w's p-adic unit norm is the exact periodFactor supplier in
TightFrameExists. In the endgame ell also occurs in mainAsk and
re_logDerivMean_one; no new adjustable constant is introduced.
The separate frame/vacuumRoot proof, finite Weil action,
local constancy and finite product substitution are retained.

## Evidence and reduction boundary
No Lean, lake or elan locally (command -v checked). No numerical
diagnostics claimed; the main contribution is the source-matched
human proof. Prepared executable scalar period cancellation and
native axiom probes below, not compiled. Actual CI jobs 45799225653
and 45803534769 retrieved; latter's authenticated receipt re-read:
six native checks with propext, Classical.choice, Quot.sound,
JetExponentBound timed out (124), overall task_passed=false despite
successful runner workflow. Neither CI covers this new certificate.
No old-pin engines applied to incompatible compact source. No root import
as a shortcut. Original contextual graph:
 exists_isJetConjugate_generator -> complex_multiplication_theta ->
 exists_taylorVia_twistedTranslate_theta -> common section transport,
 thetaQuotient_eq_one; generator/periodFactor -> chowla_selberg ->
 norm_le_one_of_isogeny, norm_disc_eq_one, classGroup_sq_bijective,
 hasSum_ideal_classes, kronecker_limit, conjugate lattice inclusions.
 Reduced human graph:
 common scaled evaluation -> common v, normalized c=1 -> compact net
 -> simultaneous finite label transport; product ideal telescoping
 -> global unit -> mean Kronecker area -> exact t-norm.
 Keep original native proof-term graph, axiom evidence and all
 unvisited or unaudited branches; no global native pruning. Context key
 pin,d,C,D,sigma,S,n,Omega0,ideal representatives,p,iota,E,s.
 Native prerequisites and consumer checks listed above are preserved.

RESUME HERE: actual exists_isJetConjugate_generator lines 29–88:
audit the same W,W' finite frame construction, nonzero c from the
common frame resolution, p-adic bound for c*vac and uniform
archimedean bound from the finite a1 root-set compact theta family.
Then trace TightFrameExists to the actual local/archimedean caller.
Do not redo period normalization or replace the finite-place action
with a generic CM reciprocity assertion.
HANDOFF TO integration/editor (insert finite CM and exact CS period),
formal audit, theta and shared compact native verification.
Human RH reconstruction incomplete.
-/

namespace CompactCharacterBoxes60

-- The exact final scalar cancellation, without norms or approximation.
theorem period_square_cancel (v s u o q r p e : ℝ)
    (hq : q ≠ 0) (hu : u ≠ 0) (ho : o ≠ 0)
    (hp : p ≠ 0) (he : e ≠ 0)
    (hv : v*q=r) (hs : s*q=2*p)
    (hw : u*o*q^2=4*p^2*e) :
    v*s/(u*o)=r/(2*p*e) := by
  calc
    v*s/(u*o) = (v*q)*(s*q)/(u*o*q^2) := by
      field_simp [hu,ho,hq] <;> ring
    _ = r/(2*p*e) := by
      rw [hv,hs,hw]
      field_simp [hp,he] <;> ring

end CompactCharacterBoxes60

#check CMLattice.exists_taylorVia_twistedTranslate_theta
#check CMLattice.complex_multiplication_theta
#check CMLattice.chowla_selberg
#check Parameters.exists_isJetConjugate_generator
#print axioms CMLattice.exists_taylorVia_twistedTranslate_theta
#print axioms CMLattice.complex_multiplication_theta
#print axioms CMLattice.chowla_selberg
#print axioms Parameters.exists_isJetConjugate_generator
#print axioms CompactCharacterBoxes60.period_square_cancel
