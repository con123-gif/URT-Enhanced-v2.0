import New.Curve.FormalParameter
import New.Curve.ThetaProducts
import Mathlib.Tactic

/-!
# RUN40 — complete single-curve formal-parameter supplier and all-prime jet integrality

26 November 2026. Human source-matched derivation with primitive inputs
retained; independent audit and native compilation pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
0e365a21fbbb549e300384681c8b615cc9e32510. Latest peer HEAD 8c8ccef6;
integration f775ec50, theta 917cdb64, predecessor e1c6215b.
Do not repeat RUN64's tight-frame null-cone and derivative-support
proof. Supply its single-curve input at nonsplit p and the distinct
all-prime integral jet input in ConjugatesOfJets.

Source ledger (paths relative to grh-compact/src):
* New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425:
  CMLattice.jet_theta_prod_integral, exists_norm_eq_inv_pow_bounds,
  norm_coeff_le_of_deriv, coeff_subst_tangent, CMLattice.exists_formal_parameter.
* Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
  CMLattice.exists_unit_coeff_degree_le,
  CMLattice.one_le_norm_coeff_translatedWp_nonsplit.
* Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626:
  CMLattice.exists_log_theta, mem_normPairClosure_of_pow_eq.
* Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa:
  rescale_translate_eq_theta_pow_mul, congruencePart_eq_sum.
* New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda.
* New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0:
  norm_jet_jetSeries_le_one, mem_raises_of_standardData.
* New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547.

## 1. Exact coefficient budget: only two exceptional degrees

Use v(p)=1, v(0)=+infinity; let p>=13, e=1 or 2,
q=p^e, Q=q-1, P=varpi^Q, v(P)=e/2.
Assume precisely the hypotheses of norm_coeff_le_of_deriv:
n' and Z' integral, n(0)=0, Z supported in positive degrees
1 mod Q (its constant is irrelevant here), Z_q=-1/P,
m'=n Z', m has no degrees <=2. Define mu=p varpi^(-p-1)
times the rescaled (p+1)-congruence part of m.
Every potentially nonzero coefficient is at k=p+1+QI, I>=0:
for e=1 the earlier nonnegative representative is 2, killed
by m0; for e=2 p+1<Q. At this k the exact convolution is
  k mu_k = p P^I sum_{J>=0, l>=1, l+QJ=k-1}
                      n_l (QJ+1) Z_(QJ+1).
Put a=v_p(k), c=v_p(l). Each summand after dividing by k
has valuation at least
  1 + e I/2 - a - c + (e/2)*1_{J=1}.               (V)
Indeed n' integral gives v(n_l)>=-c; Z' integral gives
nonnegative valuation in every slot; for J=1 its coefficient
q Z_q=-q/P has exact valuation e/2.
This special factor must be retained BEFORE applying a norm.

For I>=1 both k,l<=p^e(I+1), so if a>e, p^(a-e)<=I+1.
Since p r<=p^r for integer r>=1, a<=e+(I+1)/p;
same for c. If I<=p-2 both a,c<=e as integers.
Also k mod p = 1-I, l mod p = J-I.
- I=0: a=0, l<=p, c<=1, so (V)>=0.
- I=1: k=p+p^e, a=1 for both e, and J<=2.
  If c>0, J=1 by the congruence, l=p, c=1. The extra
  e/2 makes (V)=e-1>=0. Otherwise (V)>=e/2.
- I=2,3: a=0 and c<=e, so (V)>=e/2.
- 4<=I<=p-2: a+c<=2e, and 1+e(I-1)/2>=2e.
- I>=p-1>=12: a+c<=2e+2(I+1)/p
  <=1+e(I-1)/2, since for e=1 the difference is at least
  (9I-43)/26>=0 and increasing e increases it.
Thus (V)>=e/2 for EVERY I>=2.
Finite convolution and the ultrametric inequality yield
  mu = b1 X^(p+1)+b2 X^(p+q)+P R,   b1,b2,R integral.
The two exception degrees are I=0,1, not arbitrary residues.
No integrality of n or m themselves has been assumed.

## 2. Actual formal coordinate and the rescaled inverse (nonsplit p)

Use native phiSeriesRing generator and exists_log_theta. Let
T be its normalized generator projected onto degrees 1 mod Q
by averaging over a primitive Qth root zeta. Since Q is prime
to p, 1/Q is integral. The native norm-pair closure supplies
rescaling by zeta^i preserving the ring. Therefore T belongs
to the ring, constant zero and linear coefficient one.
The native generator/inverse property gives Z=T^(-1) for
formal composition and every ring element f satisfies f(Z)
integral. In particular T'(Z) integral with constant one
by derivative stability; differentiating T(Z)=X gives
Z'=1/T'(Z) integral. From T(zeta X)=zeta T(X), uniqueness
of inverse implies Z(zeta X)=zeta Z(X); both are supported
in degrees 1 mod Q. Thus Z=X+O(X^q), T_q=-Z_q.

At a nonsplit prime choose the actual CM endomorphism a
(p if inert; sqrt(-d) if ramified). Its norm square a*bar(a)=q
is odd and v(iota a)=e/2. The integral series g=T((iota a)Z)
satisfies Z(g)=(iota a)Z; its only possible nonzero coefficients
up to q are g1=iota a and gq=((iota a)-(iota a)^q) Z_q.
The native exists_unit_coeff_degree_le supplies some unit
coefficient up to q, not a chosen one. g1 is nonunit, so
gq is a unit. Since v(iota a)>0, the exact expression gives
v(Z_q)=-e/2. Choose varpi with P=varpi^Q=-1/Z_q using
algebraic closedness. In particular v(varpi)=e/(2Q)
and v(P)=e/2, the native nonsplitWeight.

The scaled inverse A=varpi^(-1) Z(varpi X) has coefficient
1 at X and -1 at X^q. At k=1+QJ, J>=2, use
v(P^J Z_k)>=eJ/2-v_p(k) from integral Z'.
For J=2,3, k mod p=1-J nonzero. For 4<=J<=p-2,
v_p(k)<=e (k<=p^e J); for J>=p-1 the same size bound
gives v_p(k)<=e+J/p<=e(J-1)/2.
So all remaining coefficients are divisible by P. Thus
A=X-X^q+P E0 integral. Its inverse S is integral with
constant zero and linear coefficient one: recursively solve
A(S)=X, coefficient of each new unknown is one. Also
A(S)=X gives S-S^q=X-P E0(S), as in native parameter.
The actual rescale T(varpi X)=varpi S is exact.
This proof covers the nonsplit branch only, the branch needed
by thetaProducts_normal_form; the native split case of the
larger theorem is retained for any other consumers.

## 3. Logarithmic normal form, unit term and common torsion scale

Write theta=exp(-L), L(0)=L'(0)=0 and L''=L2+xi from
exists_log_theta (xi=translatedWp), with sqrt(-d)L2 integral
under iota. Let L1=L-L2 X^2/2. Put m=L1(Z), n=L1'(Z).
Then m'=n Z', n'=xi(Z) Z' integral, n(0)=0,
m has no degrees <=2 since xi(0)=0. Section 1 applies.
Let kappa0=varpi^(p+1)/p. Since Z and its inverse commute
with rotation by zeta, projection onto the (p+1)-congruence
part commutes with substitution by Z, by its scaled version,
and by S. Consequently
  psi=kappa0^(-1) rescale_varpi(proj_(p+1) L)
     = u0 X^2 + b1 S^(p+1) + b2 S^(p+q) + P R(S).
The quadratic term is absent at inert p; at ramified p,
u0=p P^(-1) L2/2 has valuation >=1-1/2-1/2=0
because p is odd. All other terms are integral by Sections 1–2.

For inert p, q=p^2>p+1. For any f in the native ring,
f(Z) integral and Z=X+O(X^q) imply
|[X^(p-1)] f'|=|p [X^p] f(Z)|<=1/p<1.
Apply the actual FormalHeight lower bound to get
|xi_(p-1)|>=1. Since m agrees with L1 through degree p+1,
|b1|=|p L_(p+1)|=|xi_(p-1)/(p+1)|>=1. Section 1 gives
the reverse inequality, so b1 is a unit. No unit assertion
for b1 in the ramified branch. Also psi(0)=0.

For the actual n prime to p and y with n y in Lambda,
let h=n Q. The torsion identity
  theta_y(h X)=exp(-h^2 L(X)) U_y(X)
has U_y in phiSeriesRing, by rescale_translate_eq_theta_pow_mul
with delta=h. In the ring, for each zeta^i the norm-pair
closure gives exp(zeta^(i(p+1)) L(X)-L(zeta^i X)).
Rescale this by zeta^(-i), multiply over i, and raise
to h^2/Q=n^2 Q (integer). The exact resulting exponent
is h^2(proj_(p+1)L-L). Multiply with U_y. Hence
  theta_y(h X)=exp(-h^2 proj_(p+1)L(X)) W_y(X)
where W_y lies in phiSeriesRing. Each W_y(Z) integral and
A,S integral imply W_y(varpi X) integral (substitute
varpi S(X) into the integral W_y(Z)).
Set N=h^(-1), kappa=-h^2 kappa0 and V_y=W_y(varpi X).
The exact formula is
  theta_y(varpi X)=(exp(kappa psi) V_y)(N X).
The SAME N,kappa serves every torsion point y with n y in
Lambda. Their norms are |N|=1 and
|kappa|=p^(e/2-1/(p-1))=p^((1-chiK)/2-1/(p-1)).
Here e=2 inert, e=1 ramified. This is the actual nonsplit
supplier of both normal-form projections in peer RUN64.

## 4. Distinct all-prime jet integrality: no factorial loss

For any prime (not just nonsplit), fix the nonzero quadratic
integer delta and the native c_ix, y_i with delta y_i in Lambda.
Pull back each one-variable series by the zero-constant linear
form ell_i= sum_x (c_ix/iota(bar delta)) X_x.
Use the O_Cp-algebra S generated by all pullbacks of the native
phiSeriesRing, L' and theta=exp(-L).
Each generator has integral constant coefficient. The ring
is stable under d times the one-variable derivative:
phiSeriesRing is derivative-stable, d L''=d xi+d L2 belongs
to it (sqrt(-d)L2 integral and sqrt(-d) integral);
d theta'=-d L' theta belongs to the generated algebra.
Under pullback the multivariate chain rule gives
partial_x f(ell_i)=(c_ix/(iota(bar delta)*d)) (d f')(ell_i).
The scalar is integral by the exact premise k of
jet_theta_prod_integral. Hence S is stable under each partial
derivative, by the Leibniz rule on the generated algebra.
Products, sums and integral constants preserve integral
constant coefficient. The torsion translate identity with
delta gives theta_(y_i)(sum_x c_ix X_x)=theta(ell_i)^Norm(delta)
times the pullback of a ring element, so the full theta
product belongs to S. Apply the polynomial differential
operator monomial by monomial; each repeated derivative
lies in S and evaluation at zero is integral. Multiply
by the given integral polynomial coefficients and sum.
This proves jet_theta_prod_integral from the native
log-theta and torsion identities. No division by multiindex
factorials occurs, and no Frobenius coupling hypothesis is
required in this separate all-prime consumer.
At norm_jet_jetSeries_le_one the source uses delta'=m delta
with m prime to p, the native norm_periodFactor_mul_conj_le_one
and norm_jetSeries_le to transfer the bound to standardData.
mem_raises_of_standardData then uses the homogeneous Schur
jet scaling of degree boxes; the transfer and membership
proofs are retained, not silently replaced by this lemma.

## 5. Dependency and verification boundary

Original static edges: formal generator, log-theta, norm-pair
closure, CM endomorphism height, torsion translate and
coefficient estimates -> exists_formal_parameter (nonsplit)
-> thetaProducts_normal_form (RUN64) -> LocalStatement.mem_raises
-> gaugeLe_markOperator_pow -> gaugeLe_Bmu_of_isMarked
-> exists_indexDvd_Bmu_divisible -> Data.short_forms -> star_inequality.
Separate original edges: phiSeriesRing, log-theta, torsion
translate -> jet_theta_prod_integral -> norm_jet_jetSeries_le_one
-> mem_raises_of_standardData -> actual local gauge assembly.
Reduced human graph replaces the coefficient and nonsplit
parameter supplier by Sections 1–3, and the all-prime
integrality supplier by Section 4. All incoming primitive
and outgoing caller edges retained. No kernel reachability
or global axiom deletion asserted. CM formal-height exact
bridge, log-theta construction, standardData membership and
Schur extraction still require human integration/audit.
No RH theorem imported as a premise; no URT hypothesis.

Actual CI receipt retrieved:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named declarations passed with three standard axioms;
module_1_build exit 124 at 2700.11 seconds,
all_requested_checks_ok=false, full_RH_replay=false.
Local command -v lean and lake returned no executable.
The following probes and scalar algebra certificates are
PREPARED, NOT RUN; do not mark them PASS. The old-pin native
rh_scan/rh_prune/rh_reduce/auto tools cannot be treated as
compiled for the new pin. Preserve earlier graphs/axiom data.

RESUME HERE: independent audit of Sections 1–3 at actual
FormalParameter source, particularly chart derivative stability
and CM height bridge; integrate with acceleration RUN64
at LocalStatement.mem_raises. Next audit the native
norm_jetSeries_le standard-data membership and scale transfer
for both marked and general integral consumers. No scalar
endgame redesign. HANDOFF TO theta, acceleration, integration,
formal audit, literature and compact verification runner.
-/

namespace KernelRun40

-- Scalar part of the exceptional coefficient budget, separate from
-- the actual series hypotheses supplied in the human proof above.
theorem tail_budget (e i a c : ℝ)
    (h : a + c ≤ 1 + e * (i - 1) / 2) :
    e / 2 ≤ 1 + e * i / 2 - a - c := by linarith

theorem exceptional_budget (e : ℝ) (he : 1 ≤ e) :
    0 ≤ 1 + e / 2 - 1 - 1 + e / 2 := by linarith

theorem large_index_budget (e i : ℝ) (he : 1 ≤ e)
    (hi : 12 ≤ i) :
    2 * e + 2 * (i + 1) / 13 ≤ 1 + e * (i - 1) / 2 := by
  have h := mul_nonneg (sub_nonneg.mpr he) (show 0 ≤ i - 5 by linarith)
  nlinarith

end KernelRun40

#check @norm_coeff_le_of_deriv
#print axioms norm_coeff_le_of_deriv
#check @CMLattice.exists_formal_parameter
#print axioms CMLattice.exists_formal_parameter
#check @CMLattice.jet_theta_prod_integral
#print axioms CMLattice.jet_theta_prod_integral
#print axioms CMLattice.exists_unit_coeff_degree_le
#print axioms CMLattice.one_le_norm_coeff_translatedWp_nonsplit
#print axioms Parameters.thetaProducts_normal_form
#print axioms KernelRun40.tail_budget
#print axioms KernelRun40.exceptional_budget
#print axioms KernelRun40.large_index_budget
