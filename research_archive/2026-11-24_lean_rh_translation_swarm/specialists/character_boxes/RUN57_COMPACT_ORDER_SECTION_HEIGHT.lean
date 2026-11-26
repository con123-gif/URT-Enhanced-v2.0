import Lib.General.NumberTheory.QuadFieldSplitting
import Mathlib.Tactic

/-!
# RUN57 — short-return obstruction, integral sections, formal height
26 November 2026. Human source-matched proof, independent audit pending.
Attribution Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (including primitive
closure and mandatory engine), AGENTS, protocol, handoff, expansion,
HUMAN_PROOF_COMPACT read. Own RUN56 ec8134c5 and peer RUN57 geometry
c394200f, acceleration 03380f28, theta 1300ab28, Landau a23edb6f read;
these are distinct branches. No RH root imported or URT claim.

Native sources, relative to grh-compact/src:
New/Curve/DepthPairs.lean d53a0d9e22baa06916be8cc331c4394340483e3e
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
New/Data/Weights.lean 8749d68da003347685ca36817b32cafda51a3a6a
Lib/General/NumberTheory/QuadFieldSplitting.lean faf8fcaa6259e6d318fbe9ca59d43e63a8aaa68f
Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa
Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7
Lib/CM/Sigma/SigmaFunction.lean 08de17d5fa2f0e4c4cbc61c22d99a85ec367294e
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425.
Readable companion at SAME pin (not imported): grh/src/Lib/CM/FormalGroup/
InseparableDegree.lean 4616cdc882e977f55f757e8d1e2471a3226d3838
confirms the order comparison mechanism, but its more general torsion
value proof is not used as a compact theorem.

## 1. Actual order obstruction and the small-prime matching

Use p<=k, nonsplit p>=13, same D and g=placeOfInt(-p). The native
placeClass projection pi uses modulus 2^(S+1) (S=D.s), not 2^S.
For odd a=-p and i>0, write i=2^v j with j odd. An odd geometric
sum shows v2(a^j-1)=v2(a-1) and v2(a^j+1)=v2(a+1).
Factoring successive squares yields
  v2(a^i-1)=v2(a-1)                    if v=0,
             v2(a-1)+v2(a+1)+v-1      otherwise.
In the even case one of v2(a-1),v2(a+1) equals 1. Consequently
a^i=1 modulo 2^(S+1) implies 2^S divides (a-1)i or (a+1)i, hence
  2^S <= (p+1)i.                       (O)
This is precisely the source two_pow_le_of_pow_eq_one, proved
without a search over multiplicative orders.

Let L=log x. D.scale and c_ge give L>=1000; m_mem and m_pow give
2^S=m^22>=x^11. For 0<i<=324S, i<=10368L and p<=3x^5.
Thus (p+1)i<=41472 L x^5 < x^11 (x=exp L>=1+L,
(1+L)^6>41472L for L>=1000). Contradiction to (O).
Therefore pi(g)^i != 1 throughout this entire interval.
Here pi(g)=(-p) in the native units projection by the source
placeClass_placeOfInt and nonsplit coprimality, retained.

For thick sigma, there is at most one positive i<=324S such
that g^i sigma is thick: two returns i<j give
pi((g^i sigma)/sigma)^j=pi((g^j sigma)/sigma)^i, so D.three_term
gives pi(g)^i=1, impossible. Use this with the source Q:
choose i_sigma odd, 0<i_sigma<S if such a thick-to-thick
return exists and p!=d; put y_sigma=floor(n_sigma/p^i_sigma).
Otherwise y_sigma=0. The native chiK_cases gives the inert
condition when active; no such choice for the ramified prime.
For an active sigma and tau, if g^j tau=g^i_sigma sigma with
odd j<i_sigma, tau=g^(i_sigma-j) sigma is another thick
return, contradiction. Equal j=i_sigma implies tau=sigma.
The same argument with two active return lengths ordered
proves at most one incoming active edge per target.
A target cannot be active: it would give a second positive
return of length i_sigma+i_target<=2S. All these exponents
are within 324S. Thus sources and targets are disjoint
and the incoming mass at a target t is a single y_sigma.
At thick points W=a/x is the common nominal weight.
Since x^42<=a/x1<=W, y_sigma<=n_sigma/p^i_sigma<=2W/p<=W
<=n_t. At a source p^i_sigma*y_sigma<=n_sigma by the floor;
at other vertices the capacity is immediate. This proves
the entire combinatorial IsFrobPacking condition in the
p<=k case of Data.exists_isFrobPacking. RUN56 supplies htheta
and hL for the same valuation-budget caller, RUN54 the subsequent
pointwise summation. No need for a separately postulated
order/noncollision condition in this human derivation. The
native three_term and actual host construction are retained.

## 2. Integral section theorem: two evaluations, not a global norm loss

Fix C, p, iota as in exists_eq_theta_pow_mul_of_norm_le.
Use x=translatedWp, y=translatedWpDeriv, H(z)=naiveHeight(z),
theta and sigma as in the native source. C.sections m is
spanned by monomials theta^a sigma^(2b) G^c, c=0 or 1,
a+2b+3c=m, and sigma^2=x theta^2, G=y theta^3 off the pole.
Hence f/theta^m=R0(x)+y R1(x) for polynomials R0,R1, and
when m even f(t)=coeff_(m/2)(R0)*sigma(t)^m: at t all
monomials with a>0 vanish and c=1 with a=0 has odd degree.
The span identity is retained, not replaced with arbitrary
meromorphic functions.

Let F(X)=4X^3+a1^2 X^2+4X. All its coefficients are integral
and at least one is a unit: otherwise |4|<1, |a1^2|<1
would imply |a1^4-64|<1, contradicting norm_disc_eq_one.
Choose one X in the valuation ring of the comap of iota on
C simultaneously attaining the maximum coefficient norm
of each nonzero polynomial R0,R1,F. To prove existence,
divide each by a maximum-norm coefficient and reduce;
their product is a nonzero polynomial over the infinite
(algebraically closed) residue field. Choose a residue not
a root and lift; zero polynomials impose no condition.
Thus |F(X)|=1 and all coefficient norms of R_i are bounded
by |R_i(X)|. Here and below |.| is |iota(.)|_p.

Choose Y^2=F(X) over C. Then |Y|=1. Uniformization of the
cubic gives z with x(z)=x(-z)=X, theta(+-z)!=0 and
y(z)-y(-z)=Y (the derivative of wp changes sign by
periodicity at the half-period t). Since |X|<=1, the
identity sigma^2=x theta^2 shows H(+-z)=|theta(+-z)|.
The native height bound |G|<=H^3 gives |y(+-z)|<=1.
The hypothesis |f|<=H^m now bounds BOTH
  A_+ = R0(X)+y(z)R1(X), A_- = R0(X)+y(-z)R1(X)
by 1. Subtract BEFORE taking norms:
  R1(X)=(A_+-A_-)/Y,  R0(X)=A_+-y(z)R1(X).
Both are integral even at p=2, since the denominator is
the unit Y, not the integer 2. By simultaneous maximum
attainment every coefficient of R0,R1 is integral.

It follows that u=R0(x)+y R1(x) belongs to the same phiSeriesRing:
the Henselian cubic supplies x in this ring, and y is its
generator. Equality as functions off the pole gives equality
of Taylor series at zero. If f even, subtract its two
normalized values as functions; y(z)-y(-z) nonzero away
from the finite ramification points implies R1=0 identically
(the varying x takes infinitely many values). The even
polynomial and evaluation at t are exactly the native
extra conjunct. This supplies the actual local section
integrality used by rescale_translate_eq_theta_pow_mul in
RUN56, and by the formal-height argument next. Retained
inputs: section span, unit discriminant, height bound,
uniformization and formal coordinate ring. No new theorem
of integrality for arbitrary sections without the norm hypothesis.

## 3. The formal-height degree bound from one order identity

Use the native exists_unit_coeff_degree_le hypotheses:
same CM curve, a is an endomorphism of odd degree q=a*conj(a),
Z(0)=0,Z'(0)=1, substitution by Z integral on phiSeriesRing,
g integral, g(0)=0, Z(g)=iota(a) Z. By the actual isogeny
integrality and even-section result above, with Tate's trick
providing the height condition, we have
  theta(az)=theta(z)^q U, U integral in the formal parameter,
  sigma(az)^2=theta(z)^(2q) Q(x), Q integral polynomial,
  Q_q*sigma(t)^(2q)=sigma(at)^2.
Here U(0)=1 by theta(0)=1; all identities first refer to Taylor
series, and the last to the complex section value at t.

For completeness, the unit of Q_q follows from the native
odd-degree theta section multipliers. Write Hc for the
complex Hermitian form (not the local height above).
The section translation is F(z+l)=chi(l)^m
exp(m*(Hc(z,l)+Hc(l,l)/2))*F(z); sigma has the canonical
sign multiplier, theta has chi(l)=-sigmaSign(2t+l).
Since theta(az) is a degree-q section, comparison at 0
and period 2t gives chi(2at)=chi(2t)^q=-1, using
Hc(at,at)=q Hc(t,t). By the sign formula t+at is in
the lattice, equivalently ell=at-t is in the lattice.
From the theta normalization
theta(z)=exp(-Hc(z,t))*sigma(z+t)/sigma(t), sigma'(0)=1,
and x(z)theta(z)^2=sigma(z)^2, the limit at z=-t
(using the double pole of wp with leading coefficient 1)
gives sigma(t)^4=exp(2 Hc(t,t)).
The canonical sigma multiplier at ell then gives
sigma(at)^4=exp(4Hc(t,ell)+2Hc(ell,ell))*sigma(t)^4
            =exp(2Hc(at,at)).
In the last equality the extra phase is
exp(2(Hc(t,ell)-Hc(ell,t)))=1, since Im Hc/pi is the
integral Riemann form on lattice vectors and 2t,ell are
in the lattice. Thus Q_q^2=1. This is the actual compact
coefficient identity, using odd q to fix the SAME half-period,
not an assumed unit coefficient. The standard pole and
theta multipliers in CurveTheta/SigmaFunction remain explicit.

Now compose with Z, write X=x(Z) and V=U(Z). Cancel theta
exactly, using its nonzero constant:
  X(g) V^2 = Q(X).
All terms now integral, V(0)=1. The cubic reads
  X(1+X^2-iota(a1)y(Z))=y(Z)^2;
the parenthesis is a unit, and y(Z) has linear coefficient 1.
Consequently ord of X modulo the maximal ideal equals 2.
The reduced polynomial Q has a nonzero degree-q coefficient,
so its first nonzero index j is at most q. Over the residue
field substitution of a zero-constant series multiplies
orders (factor the leading power and a unit); multiplication
by V^2 does not change order. Thus the decisive exact identity
  2 ord(g_bar) = ord(Q_bar(X_bar)) = 2 j <= 2 q.       (H)
If g_bar=0 the LHS series is zero and RHS nonzero; impossible.
Therefore g has a coefficient of norm one at degree <=q.
This is exactly the conclusion of the native formal-height
theorem, used in FormalParameter to fix the scale varpi.
The odd-degree endomorphism, actual integral sections,
unit discriminant, Tate's trick, and the same formal
coordinate are necessary retained inputs. No new RH premise.

## Evidence and reproducibility

Executed exact integer JS in this session, not native Lean.
8064 LTE cases (all odd p=3..127 including composites,
i=1..128; 4032 odd and 4032 even); 27777 native modulus
divisibility/bound instances; three negative controls
reject applying the odd formula to every even exponent
(p=3,7,13, i=2).
Reproduce with:
  function v2(n){if(n<0n)n=-n;let v=0;while(n%2n===0n){v++;n/=2n}return v}
  for(let p=3n;p<=127n;p+=2n)for(let i=1n;i<=128n;i++){
    const v=v2((-p)**i-1n);
    if(v!==(i%2n?v2(-p-1n):v2(p*p-1n)+v2(i)-1))throw Error("LTE");
    for(let s=0;s<v;s++){
      const d=2n**BigInt(s);
      if(((-p-1n)*i)%d!==0n&&((-p+1n)*i)%d!==0n)throw Error("div");
      if(d>(p+1n)*i)throw Error("bound");
    }
  }
A separate finite graph regression enumerated all subsets of
cycles M=11,13,15, S=3; retained only sets with at most one
positive return in 1..6 per thick point. 702 accepted,
42306 rejected, 9852 capacity assertions, 142 active edges
and collision assertions (test weights thick 100+s%3,
thin 1, p=13; only odd i<S is 1). These are combinatorial
regressions, NOT native host data or evidence for RH.

Native lean/lake not installed (command -v checked). Actual
CI run 45803534769 state outputs/targeted_results.json
retrieved this run: all_requested_checks_ok=false, 3 native
TiltingLemma and 3 Filling.Moments axiom checks succeeded,
three standard axioms only; JetExponentBound build exit124.
No new native replay or PASS. Old-pin engines not imported;
source-matched static reduction only. The following Lean
certificates are PREPARED, not compiled: first calls actual
order guard at its exact modulus; other certificates verify
scalar order and cubic cancellation, not all local analytic
and formal-series dependencies.

Static contextual graph preserved:
depth_indicator_jet -> exists_hasLargeSplit_of_pairs ->
{exists_isFrobPacking -> (three_term, scale, order guard,
valuation budget), thetaProducts_normal_form ->
exists_formal_parameter -> (formal height -> integral sections,
Tate trick, unit discriminant, theta multipliers),
translate residual -> integral sections}.
New human substitutions above discharge the order guard
and its short-return use, the local section integrality
argument given its geometric inputs, and the formal-height
order argument with its actual normalization. No global
deletion from native proof graph or axiom ledger. Cache key
pin,D,p,S,projection,thick,n,C,iota,m,a,q,Z,g. All previously
unresolved inputs retained. Independent caller/axiom audit
needed before marking any global closure.

RESUME HERE: reconstruct the actual norm_translate_le_naiveHeight_pow
Tate trick and naiveHeight_spec, including uniform boundedness
on ALL z and the quartic doubling identity; then revisit
norm_disc_eq_one and its 2-isogeny cyclic monotonicity.
These are the surviving section integrality suppliers.
Audit the complex multiplier phase and section span
normalization in section 3; connect to the same C witness.
HANDOFF TO integration/editor, audit, theta, kernel batch.
Human RH reconstruction remains incomplete.
-/

namespace CompactCharacterBoxes57

theorem no_short_order (p i s : ℕ) (hp : 1 < p)
    (hi : 0 < i) (hscale : (p+1)*i < 2^s)
    (h : ((-(p : ℤ) : ℤ) : ZMod (2^(s+1)))^i = 1) : False := by
  have hp' : 1 < (-(p : ℤ)).natAbs := by simpa using hp
  have e := two_pow_le_of_pow_eq_one hp' hi h
  exact (not_lt_of_ge (by simpa using e : 2^s ≤ (p+1)*i)) hscale

theorem order_cancel (n j q : ℕ) (h : 2*n = 2*j) (hj : j ≤ q) :
    n ≤ q := by omega

theorem cubic_unit_identity (X Y A : ℂ)
    (h : Y^2+A*X*Y = X^3+X) :
    X*(1+X^2-A*Y) = Y^2 := by
  linear_combination -h

theorem paired_evaluation (R S y z U V : ℂ)
    (hU : U = R+y*S) (hV : V = R+z*S) :
    U-V = (y-z)*S := by rw [hU,hV]; ring

#print axioms no_short_order
#print axioms order_cancel
#print axioms cubic_unit_identity
#print axioms paired_evaluation
end CompactCharacterBoxes57
