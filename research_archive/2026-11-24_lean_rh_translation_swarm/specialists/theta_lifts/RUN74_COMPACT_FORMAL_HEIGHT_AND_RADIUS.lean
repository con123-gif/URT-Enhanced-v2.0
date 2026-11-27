import Mathlib.Tactic

/-!
# RUN74 — exact formal height, inverse radius and torsion translate normalization
27 Nov 2026. Human source-matched derivation, conditional on the explicitly
retained CM section/integrality foundations; scalar certificates prepared,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, including
completion-first and mandatory reduction; AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION, RESEARCH_STATE, manuscript ea51739eda55a41749858377bc5635f7e9c49d41.
RUN73 784d021e. Recent peers 6526a8e7, 22990488, b66c0b19,
43ff3e37, cbfdcc8a, 327ee638, 55d81106, 21ccc35d checked.
No URT, no RH theorem import.

Source ledger (grh-compact/src):
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e,
one_le_norm_coeff_translatedWp_nonsplit 135–161;
exists_unit_coeff_degree_le 172–204.
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425,
exists_formal_parameter 132–end, especially 150–211.
Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
taylorVia_curve_eq, derivative identities, norm_disc_eq_one,
naiveHeight_spec, isSeriesGenerator_translatedWpDeriv.
Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa:
exists_eq_theta_pow_mul_of_norm_le, rescale_translate_eq_theta_pow_mul,
rescale_translatedWpDeriv_mem, norm_le_one_of_isogeny.
Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626:
exists_log_theta, normPairClosure.
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
theta and sigma normalizations, multiplier, theta zero and parity.
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda,
JetDivisibility.lean 5f6e6f63dc7bfc35aedc136ae8330510d3493f06,
LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547.

## 1. Actual differential recurrence and splitting guard

Write O for the valuation ring of C_p, k its residue field, A=iota(a1),
x=taylorVia iota translatedWp, phi=taylorVia iota translatedWpDeriv.
Retain the native good-reduction unit discriminant |A^4-64|=1,
the generator ring B=O[[phi]], x in B, B stable under d/dz, and the
actual curve identities. In particular x(0)=x'(0)=0, phi(0)=0,
phi'(0)=1, x'=2phi+Ax. Thus x starts z^2 with coefficient 1.
The curve relation phi^2+A x phi=x^3+x gives EXACTLY
  (x')^2=4x+A^2 x^2+4x^3,
  x''=2+A^2 x+6x^2.
Hence for every n>=0,
  (x^n x')'=(4n+2)x^n+(n+1)A^2 x^(n+1)+(4n+6)x^(n+2).
No division by x in the n=0 case; for n>=1 use the product rule.

Suppose every f in B has |[z^(p-1)] f'|<1, as in the actual caller.
If p=2 apply this to phi: phi'=1+3x^2-A phi has linear
coefficient -A. Thus |A|<1, contradicting |A^4-64|=1 at p=2.
For odd p put m=(p-1)/2 and suppose |[z^(p-1)]x|<1.
The corresponding coefficient of 1 vanishes. Induct from n=0,1:
x^n x' belongs to B, its derivative coefficient has norm <1
and both previous terms in the recurrence have norm <1.
For n<=m-2 the integer 4n+6 is positive, even, and <2p,
so is not divisible by the odd prime p. Therefore the coefficient
of x^(n+2) has norm <1. But x^m starts z^(p-1) with coefficient 1.
Contradiction. For p=3 the base case already contradicts it.
This proves |[z^(p-1)]x|>=1.

Now use RUN72's log theta L''=L2+x and let y=iota(sqrt(-d)).
The dilation difference F=dL-L(yz) has F' in B by exists_log_theta.
Since y^2=-d, at degree p-1>0,
  [z^(p-1)]F'' = -y^2(1+y^(p-1))[z^(p-1)]x.
If chi_K(p)=1, p is odd and unramified, and the residue of y is
a nonzero root of T^2+d in F_p. Therefore y^2 and 1+y^(p-1)
are units (the latter reduces to 2). The RHS has norm >=1,
contradicting the derivative hypothesis on F'. This supplies
both conclusions of one_le_norm_coeff_translatedWp_nonsplit,
with the retained good reduction, derivative ring and log theta
identities, not a generic appeal to formal height.

## 2. Unit coefficient by the exact section and residue-order comparison

Use the actual hypotheses of exists_unit_coeff_degree_le:
Z(0)=0,Z'(0)=1, f(Z) integral for all f in B, g integral with
g(0)=0, Z(g)=iota(a)Z, a a self-isogeny of odd degree q.
Set X0=x(Z), so its integral reduction has order exactly 2.
By the native isogeny theta pullback, theta(az)=theta(z)^q v0(z)
with v0 in B. The even degree-2q section sigma(az)^2 satisfies
the naive-height bound by Tate's trick. The native even-section
integrality lemma gives an integral polynomial Q such that
  sigma(az)^2 = theta(z)^(2q) Q(x(z)),
and the exact homogeneous evaluation
  sigma(at)^2 = Q_q sigma(t)^(2q).
Here the first equality is a Taylor identity after applying iota;
the homogeneous evaluation is before applying iota.
To prove |iota(Q_q)|=1 it suffices to compare naive heights, rather
than derive the stronger Q_q^2=1 used in the source.
Indeed s(z)=theta(az) is an even section of degree q, with s(0)=1.
The multiplier of 2t is -1 (CurveTheta.multiplier_eq_neg_sigmaSign,
since 2t is a period and 2t belongs to the lattice).
The translation law at -t has exponential factor 1, so
s(t)=(-1)^q s(-t)=-s(t), giving theta(at)=0.
Also at z=0 and period 2t the translation law gives
  theta(2at)=theta(2t)^q
exactly, since both degree-q sections have value 1 at zero.
Both 2t and 2at are periods, so sigma vanishes there.
The native height h(z)=max(|iota sigma(z)|,|iota theta(z)|)
satisfies h(2z)=h(z)^4 and is positive. Consequently
  |iota sigma(at)|^4=h(2at)=h(2t)^q=|iota sigma(t)|^(4q).
The claimed unit coefficient follows from the homogeneous evaluation
and sigma(t) nonzero. This uses only the actual odd degree and
section laws; no additional arithmetic theorem.

Use sigma^2=x theta^2 to cancel theta(z)^(2q) as a formal unit,
then substitute Z:
  Q_iota(X0)= X0(g) v0(Z)^2.
All three series and Q_iota are integral. Reduce to k[[z]].
If all g coefficients through q are nonunits, then ord(bar g)>=q+1
(including infinity if zero). The RHS has order >=2(q+1).
But bar Q has some nonzero coefficient in degree <=q, since bar Q_q
is nonzero, and ord(bar X0)=2. Different powers have strictly
different leading orders; hence ord(bar Q(bar X0))<=2q.
Contradiction. This proves the native unit-coefficient conclusion
without a divisibility-by-X^j case split and without any no-cancellation
assumption on equal-order terms.

## 3. Exact first unit degree and inverse radius, all three prime types

Actual choices in FormalParameter 141–176: a=p except at p=d,
where a=sqrt(-d); write alpha=iota(a), q=p^e, m=q-1, and
v(alpha)=s/2, with (e,s)=(1,2) split, (1,1) ramified, (2,2) inert.
Use v(p)=1. The native root-of-unity projection
  T(z)=m^-1 sum_{i=0}^{m-1} zeta^-i phi(zeta^i z)
belongs to B by the normPairClosure dilation law, since m and zeta
are units. Constant coefficient 0 and linear coefficient 1 make T
a generator by IsSeriesGenerator.of_mem. Its inverse Z has
Z'(0)=1 and Z(zeta z)=zeta Z(z), hence only degrees 1 mod m.
In particular Z(z)=z+c z^q+O(z^(q+1)), T(z)=z-c z^q+O(z^(q+1)).
The integral endomorphism g=T(alpha Z) obeys
  g(z)=alpha z + alpha(1-alpha^(q-1)) c z^q+O(z^(q+1)).
This is an exact coefficient identity, not a p-adic norm estimate.
Since |alpha|<1, the parenthetical factor is a unit. If ramified or
inert, q is the odd isogeny degree. Section 2 forces g_q to be
a unit, because every earlier coefficient is zero or alpha.

In the split case q=p (the isogeny degree is p^2, NOT q).
If |g_p|<1 then |p c|<1. For every f in B, f(Z) is integral
and coefficient identity [z^p]f(Z)=f_p+c f_1 holds, with f_1
integral. Thus |p f_p|<1 for every f in B. Section 1 forces
non-split, a contradiction, including p=2. Hence |g_q|=1 here too.
It follows that |c|=|alpha|^-1 and c nonzero. Take varpi with
varpi^m=-1/c (exists over the algebraically closed coefficient field).
Put pi=varpi^m. Then v(pi)=s/2 and v(varpi)=s/(2m), exactly the
native nonsplitWeight, with 1/p<=|pi|<1 in all three cases.
No independent scaling parameter remains.

## 4. The whole inverse series, not only its leading term

The actual derivative-ring identity implies Z' integral:
T' belongs to B, so T'(Z) is integral with constant coefficient 1;
differentiate T(Z)=z and invert that integral unit.
Put F(z)=varpi^-1 Z(varpi z).
We have F=z-z^q+pi E0 with E0 integral (sign of E0 may be
reversed to match the native E). To verify all coefficients:
at degree 1+jm with j>=2, integrality of Z' gives
  v(pi^(j-1) Z_(1+jm)) >= (j-1)s/2 - v_p(1+jm).
The RHS is nonnegative. Indeed p divides 1+j(q-1) only if
j=1 mod p. For j>=2 that requires j>=p+1. If v=v_p(1+jm)>=e,
then p^(v-e)<j; Bernoulli gives v<=e+(j-1)/(p-1).
The same upper bound is immediate if v<e.
For split odd p it is <=j-1; for ramified p=d>=7 it is <=(j-1)/2.
For inert odd p and j>=5 it is <=j-1; the only remaining j=4,
p=3 case gives v<=3.5, hence v<=3. For split p=2, the divisible
case has j>=3 and 1+jm=j+1<=2^(j-1) by induction.
This proves the coefficient bound for every degree, with no
truncation or numerical approximation.

F is integral and tangent to the identity; its integral inverse S
is obtained recursively by coefficient comparison (new coefficient
has coefficient 1). Thus rescale_varpi(T)=varpi S and
  S-S^q = z - pi E0(S).
For every f in B, f(varpi z) is integral because f is an integral
series in T and T(varpi z)=varpi S. Also for any u in B,
u(varpi z)=u(Z)(varpi S(z)). This is the exact substitution
bridge at FormalParameter 193–211, including the error series.

## 5. Same torsion translate and unit, at the actual normal-form consumer

Retain L from RUN72, theta=exp(-L), and p>=13 non-split. Let
P_L=congruencePart_m(p+1,L), kappa0=varpi^(p+1)/p and
psi=kappa0^-1 P_L(varpi z).
RUN73 bounds the two exceptional coefficients and the pi remainder
after substitution by Z. Root-filter commutes with Z (equivariance),
so the result in the original scaled variable is
  psi=u0 z^2 + u1 S^(p+1) + u2 S^(p+q) + pi R(S)
with integral coefficients and series. At ramified p=d, u0 is
p*pi^-1 L2/2, integral because v(L2)>=-1/2 by RUN72.
At inert p, degree 2 is excluded and the section 1 lower bound,
together with RUN73, proves u1 is a unit. No new coefficient loss.

For any n prime to p, set delta=n*m, N=delta^-1 (a p-unit).
The native isogeny integrality with delta*y in the lattice gives
  (U_y theta)(delta z)=exp(-delta^2 L(z)) u(z), u in B.
For each root of unity zeta^i the native log theta lemma gives
  A_i(z)=exp(zeta^(i(p+1)) L(z)-L(zeta^i z)) in B.
Rescale by zeta^-i using the SAME dilation-stable ring and multiply:
  prod_i A_i(zeta^-i z)=exp(m(P_L(z)-L(z))).
Raise to the INTEGER power n^2*m (delta^2/m); do not assume
integrality under fractional exponentiation. Multiplying by u
shows V0=u exp(delta^2(P_L-L)) belongs to B. Consequently
  (U_y theta)(varpi z)
   = [exp(-delta^2 kappa0 psi) V0(varpi z)] evaluated at Nz.
By section 4 V0(varpi z) is integral. This is the native
exists_formal_parameter torsion-translate conclusion with
kappa=-delta^2 kappa0, uniform N,kappa for all y with ny in Lambda.
Its norm is exactly p^((1-chiK)/2-1/(p-1)) by section 3.
Insert into RUN73 thetaProducts_normal_form and the null-cone
argument for norm_schurJet_le. Retain the actual frame Frobenius
identity and determinant/null-frame budget, the charge exemptions,
FitsRanks, tableau counting and marked Hecke consumer. This does
not close them or the whole A theorem.

Original source-visible chain (compact, no globally deleted edge):
Main -> New.grh -> star_inequality -> Data.short_forms ->
LocalStatement.mem_raises -> norm_schurJet_le / norm_jetSeries_le ->
thetaProducts_normal_form -> exists_formal_parameter ->
FormalHeight two lemmas, inverse normalization, log theta and
isogeny section/height supplier.
Reduced human subgraph: curve differential identities -> recurrence ->
non-split guard; homogeneous evaluation + height doubling ->
Q_q unit -> residue order -> unit g_q; exact first coefficient ->
radius -> derivative tail -> integral inverse -> integer-power
root filter -> RUN73 null-cone. Preserve the previously recorded
original/reduced graphs and all other edges. No elaborated edge
claim or global axiom retirement. Context cache key: compact pin,
C,p,d,iota,actual a,q,m,T,Z,phi,section degree, n and torsion set.

Verification: local command -v lean/lake/elan gave no paths.
SymPy expanded the recurrence polynomial residual to EXACT 0
(using n,w,x,A symbolic and w=x^(n-1)); this checks algebra only.
Actual CI state artifact
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json,
cathedral-research-state blob 088cd2ec0e935ee1a282f10096949bcf671cc804
reread: six named B/C checks with standard three axioms; A module
return 124 after 2700.11s; all_requested_checks_ok=false;
full_RH_replay=false. No native rh_prune/scan/reduce/auto/frontier
execution on compact pin; no fresh native PASS. Scalar certificates
below prepared, not compiled. Prior old-pin engine results unchanged.

RESUME HERE: actual JetDivisibility.exists_null_coupling_frames:
derive determinant budget of the assigned directed Frobenius
constraints, including height-one exceptions, then attach to
norm_schurJet_le and marked LocalStatement.mem_raises.
Use RUN73 and RUN74 as human supplier arguments, with their retained
foundations, not another equivalent RH criterion. Audit the
homogeneous evaluation and substitution bridge independently.
HANDOFF TO integration/editor/audit/acceleration/native runner.
Human RH reconstruction remains incomplete.
-/

namespace ThetaRun74
theorem recurrence_polynomial (n w x A : ℂ) :
    n*w*(4*x+A^2*x^2+4*x^3)+w*x*(2+A^2*x+6*x^2) =
      (4*n+2)*w*x+(n+1)*A^2*w*x^2+(4*n+6)*w*x^3 := by
  ring

theorem first_unit_factor (a c aq : ℂ) (g : ℂ)
    (h : g = a*c-a*aq*c) : g = a*(1-aq)*c := by
  rw [h]
  ring

theorem order_contradiction (q ordQ ordR : ℕ)
    (hq : ordQ ≤ 2*q) (hr : 2*(q+1) ≤ ordR) : ordQ ≠ ordR := by
  omega

#print axioms ThetaRun74.recurrence_polynomial
#print axioms ThetaRun74.first_unit_factor
#print axioms ThetaRun74.order_contradiction
end ThetaRun74
