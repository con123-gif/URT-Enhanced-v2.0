import New.Curve.FormalParameter
import New.Curve.ThetaProducts
import Mathlib.Tactic

/-!
# RUN65 — actual nonsplit formal parameter and the two exceptional coefficients
26 November 2026. Human source-matched derivation; no fresh kernel replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, manuscript
f5aa7040a4ee1aeb5180345430256911a0df0ef8. Prior RUN64 8c8ccef6.
Editor a6dfbea2 and theta 131aaf2d inspected; their CM cluster/Fock
orthogonality is distinct from this single-curve local parameter.

Source ledger (all paths relative to grh-compact/src):
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425,
  exists_norm_eq_inv_pow_bounds, norm_coeff_le_of_deriv,
  coeff_subst_tangent, CMLattice.exists_formal_parameter.
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e,
  CMLattice.exists_unit_coeff_degree_le,
  CMLattice.one_le_norm_coeff_translatedWp_nonsplit.
Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626,
  CMLattice.exists_log_theta, mem_normPairClosure_of_pow_eq.
Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa,
  CMLattice.rescale_translate_eq_theta_pow_mul.
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda,
  Parameters.thetaProducts_normal_form; actual caller obtains p>=13
  from P.thirteen_le_of_chiK_ne_one.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547,
  Data.IsGoodDatum.mem_raises and the local divisibility chain.

## 1. Exact two-exception derivative estimate (all hypotheses of the scalar lemma)

Write q=p^e, Q=q-1, e in {1,2}, p>=13 prime, P=varpi^Q,
|P|=p^(-e/2). The native assumptions are m'=n Z', n(0)=0,
m_j=0 for j<=2, n' and Z' integral, Z_{j+1}=0 if Q does not
divide j, and Z_q=-1/P. Put
  mu = (p/varpi^(p+1)) rescale_varpi(congruencePart_Q,p+1(m)).
All nonzero candidate coefficients have D=p+1+QI, I>=0:
for e=1 the only smaller nonnegative degree in the residue class is
2, killed by m_2=0; for e=2 there is no smaller degree.
Differentiating before bounding gives
  D mu_D = p P^I sum_{J>=0, i=p+Q(I-J)>=1} n_i (1+QJ) Z_{1+QJ}.
This is a finite sum, with J<=I+1; J=I+1 occurs only for e=1.
Integrality of n' gives |n_i|<=p^v_p(i). Integrality of Z'
gives |(1+QJ)Z_{1+QJ}|<=1; at J=1 use the exact exceptional
coefficient instead: |q Z_q|=p^(-e/2). Therefore each summand
after dividing by D has norm at most p^E, where
  E = -1-e I/2+v_p(D)+v_p(i) -(e/2) 1_{J=1}.
No term count enters because of the ultrametric inequality.

For I=0, v_p(D)=0; i=p at J=0 (valuation 1), or i=1
at J=1 in the ramified case. Thus E<=0.
For I=1, D=p+q has valuation 1; J=0 has v_p(i)=0,
J=1 has i=p, J=2 if present has i=1. At J=1 E=1-e<=0;
all other E<=-e/2. So both designated coefficients are integral.

For 2<=I<=11, D=1-I mod p is nonzero, and i=J-I mod p
is nonzero unless J=I (since -I<=J-I<=1). At J=I, i=p.
Consequently v_p(D)+v_p(i)<=1 and E<=-e I/2<=-e/2.
For I>=12 use 0<D,i<p^e(I+2). If v_p(D)>e, set k=v_p(D)-e;
p^k<I+2 and p^k>=p*k for k>=1 by induction, so
v_p(D)<=e+(I+1)/13. The same holds for i, including valuations
<=e automatically. Hence
  v_p(D)+v_p(i)<=2e+2(I+1)/13<=1+e(I-1)/2.
The last linear inequality holds already at I=12 for either e
and its right slope exceeds the left slope. Thus E<=-e/2.
All other coefficients are zero. This proves the entire native
norm_coeff_le_of_deriv conclusion by coefficientwise division by P.
It bypasses the broader modular-valuation helper without deleting
any hypothesis or claiming a native dependency prune.

## 2. Actual choice and rescaling of the formal parameter

For this caller p nonsplit, p>=13; choose a=p if inert and
a=sqrt(-d) if p=d. Then q=p^e=a conj(a), |iota(a)|=p^(-e/2),
e=2 inert, e=1 ramified. The split/small-prime portion of the
general native exists_formal_parameter is not needed here and is
not claimed replaced globally.

Take the normalized generator phi of C.phiSeriesRing, linear
coefficient one, constant zero, and a primitive Qth root zeta
in C_p. Its norm is one, Q prime to p. By the actual
norm-pair-closure lemma, (zeta^i,zeta^(i(p+1))) belongs to
the closure for every integer i. The log-theta dilation property
therefore puts phi(zeta^i X) in the same integral parameter ring.
The exact projector
  T(X)=(1/Q) sum_{i=0}^{Q-1} zeta^(-i) phi(zeta^i X)
is in that ring, tangent to identity, with degrees 1 mod Q.
Use the native generator/inverse property (retain as foundation):
Z=T^(-1) under composition, f(Z) integral for every f in the ring.
The inverse is equivariant Z(zeta X)=zeta Z(X), so only degrees
1 mod Q occur. Also Z'=(T'(Z))^(-1) is integral since T' lies
in the ring, T'(0)=1, and the integral series with constant one
are invertible. Thus Z=X+c X^q+O(X^(q+1)).
The integral series g=T(iota(a) Z) has Z(g)=iota(a) Z.
Its degrees through q-1 are zero except the linear term iota(a).
The actual odd-degree isogeny height theorem
CMLattice.exists_unit_coeff_degree_le with degree q gives a unit
coefficient at degree <=q. All earlier coefficients are nonunits,
so |g_q|=1. Inversion yields T_q=-c and
  g_q=c (iota(a)-iota(a)^q).
Since |iota(a)|<1, |c|=|iota(a)|^(-1). In particular c!=0.
Choose varpi in C_p with varpi^Q=-1/c. Then |P|=p^(-e/2),
|varpi|=p^(-e/(2Q))=p^(-nonsplitWeight(d,p)).
Set pi=P. This produces exactly the required norm scale, not
an arbitrary root of an integral coefficient.

Let A(X)=varpi^(-1) Z(varpi X). It starts X-X^q.
For J>=2, derivative integrality implies
  |A_{1+QJ}|<=|P|^J p^v_p(1+QJ).
When 2<=J<=11, 1+QJ is nonzero mod p, so v=0.
For J>=12, 1+QJ<p^e(J+2), so by the preceding bound
v<=e+(J+1)/13<=e(J-1)/2. Thus every coefficient of A-X+X^q
is divisible by P in the valuation ring. In particular A is
integral, constant zero and linear coefficient one.
Its composition inverse S is integral (recursive coefficient
solution uses only multiplication and addition, with unit
linear coefficient one). Exactly S=varpi^(-1) T(varpi X).
Write A=X-X^q-P E0 with E0 integral. A(S)=X gives
  S-S^q=X+P E0(S).
This supplies S,E,pi,varpi and T at the actual nonsplit caller,
with norm p^(-e/2)=p^((chiK-1)/2).

## 3. Logarithm normal form and the nonvanishing coefficient

Use the exact CMLattice.exists_log_theta witnesses:
theta=exp(-L), L(0)=L'(0)=0, L''=L2+W,
W=taylorVia translatedWp in the integral parameter ring,
and |iota(sqrt(-d))*L2|<=1. Let L1=L-L_2 X^2,
where L_2 denotes coefficient 2 of L (L2/2). Then L1''=W.
Set M=L1(Z), n=L1'(Z). We have M'=n Z', n'=W(Z)Z'
integral, n(0)=0 and M coefficients through degree two zero.
These are exactly the hypotheses of Section 1 with m=M.
Define kappa0=varpi^(p+1)/p and
  psi=kappa0^(-1) (congruencePart_Q,p+1 L)(varpi X).
The equivariance of Z and T makes the congruence projector
commute with composition by either (check each monomial
or the root-of-unity average). Since Z(varpi S)=varpi X,
Section 1 evaluated at S gives
  psi=u0 X^2+u1 S^(p+1)+u2 S^(p+q)+P R
for integral R (composition of the integral remainder with S).
The quadratic term is absent inertly (Q>p+1), u0=0.
Ramified, Q=p-1, it is retained and its norm is
  |u0|=|p varpi^(1-p) L2/2|
       <= p^(-1/2) p^(1/2)=1,
since p odd and |iota(sqrt(-d))|=p^(-1/2).
All terms have zero constant (psi(0)=0).

For inert p, q=p^2, so p+1<q and Z=X modulo X^q.
Every f in the native integral parameter ring has f(Z) integral,
and its degree-p coefficient equals f_p. Thus |p f_p|<1.
Apply the actual native Hasse-invariant lemma
one_le_norm_coeff_translatedWp_nonsplit: |W_{p-1}|>=1.
At p+1 the coefficient from Section 1 is
  u1=p L_{p+1}=W_{p-1}/(p+1).
Here p+1 is a unit, and the inequality of Section 1 says
|u1|<=1. Hence |u1|=1, precisely the nonzero support guard
in the second projection of thetaProducts_normal_form.
Do not infer this in the ramified case.

## 4. One common scaling for all prime-to-p torsion translates

Fix n prime to p and delta=nQ, a nonzero rational integer
unit p-adically. For any y with ny in Lambda the retained
isogeny integrality theorem gives
 theta_y(delta X)=exp(-delta^2 L(X)) U_y(X), U_y in C.phiSeriesRing.
The zeta norm-pair theorem and exists_log_theta give integral
parameter-ring elements H_i(X)=
 exp(zeta^(i(p+1))L(X)-L(zeta^i X)).
By integral dilation H_{-i}(zeta^i X) lies in that ring.
Their product is exactly
  exp(sum_i zeta^(-i(p+1))L(zeta^i X)-Q L(X))
   =exp(Q (Lpart(X)-L(X))),
where Lpart=congruencePart_Q,p+1 L.
Raise to delta^2/Q=n^2 Q, an integer. Multiplying by U_y
gives F_y in the integral parameter ring with
 theta_y(delta X)=exp(-delta^2 Lpart(X)) F_y(X).
There is no division by a nonunit nor a p-adic convergence
assumption: the exponentials are formal series of order >=2.
For every F in the parameter ring,
 F(varpi X)=(F(Z))(varpi S(X)) is integral since F(Z) is
integral, varpi integral and S integral.
Now set N=delta^(-1), kappa=-delta^2 kappa0,
V_y=F_y(varpi X) over the valuation ring. Exactly
 theta_y(varpi X)=[exp(kappa psi(X)) V_y(X)] evaluated at NX.
The same N and kappa work for all y of denominator n;
|N|=1 and
 |kappa|=p |varpi|^(p+1)
        =p^((1-chiK(d,p))/2-1/(p-1)).
This is the actual nonsplit portion of exists_formal_parameter,
not merely an individual theta integrality statement.

## 5. Root-consumer integration, graph and audit

Section 1 proves the full scalar derivative bound, Sections 2–4
supply the exact first and second parameter projections needed by
Parameters.thetaProducts_normal_form at p>=13 nonsplit, including
unit inert u1, common N,kappa, and degree-uniform integrality.
Insert these into RUN64's quotient and factorial argument;
the actual IsGoodDatum.mem_raises consumes the first projection
at r<=1 and the corresponding two norm scales, retaining all
same-data, level, coprimality, Schur and frame hypotheses.
The second projection is only inert r=1 and remains available
for the other jet consumers. Do not globally replace the native
formal parameter theorem in split/small-prime contexts.

Original source-visible edges:
  generator/inverse & norm-pair & log-theta & isogeny integrality
  & height/Hasse -> exists_formal_parameter (via coeff_subst_tangent,
  norm_coeff_le_of_deriv via exists_norm_eq_inv_pow_bounds)
  -> thetaProducts_normal_form -> mem_raises ->
  gaugeLe_markOperator_pow -> gaugeLe_Bmu_of_isMarked ->
  exists_indexDvd_Bmu_divisible -> Data.short_forms -> star_inequality.
Reduced human graph: replace the nonsplit p>=13 parameter branch
with Sections 1–4; no kernel dependency deletion claimed.
Retain all fundamental generator/inverse, local-height integrality,
norm-pair closure, odd-degree isogeny height, Hasse-invariant,
log-theta, Frobenius embedding and good-data/Schur inputs.
Retain full old graphs, role and axiom evidence. In particular no
import of Main or the claimed RH theorem. No new URT assumptions.
No local Lean/Lake executable found. The actual compact CI result
reread at compute/rh-compact-primitives-replay-20261126/outputs/
targeted_results.json (088cd2ec0e935ee1a282f10096949bcf671cc804):
module_1_build timed out 2700.11s, six B/C named checks only,
each propext, Classical.choice, Quot.sound; all_requested_checks_ok
false, full_RH_replay false. No new native PASS. Prepared scalar
certificates and interface probes below; run in shared compact
environment, not the old pin. No additional finite simulation or
compilation benchmark claimed. Independent audit remains outstanding.

RESUME HERE: prove the actual Hasse invariant and odd-degree height
inputs in Lib/CM/FormalGroup/FormalHeight.lean or match their exact
standard theorem hypotheses. For the latter use the native
monomial section polynomial with leading unit at q, reduction
divisibility and contradiction of order >q. For the former retain
the normalized translatedWp curve differential identity and exact
Legendre sign. Then audit the generator/inverse and local-height
integrality foundations, and integrate RUN64/65 at mem_raises with
theta lane's good-data proof. Do not redo the two-exception estimate.
HANDOFF TO integration, theta, audit, literature, kernel extractor.
-/

namespace AccelerationRun65

theorem high_index_budget (I e a b : ℝ)
    (hI : 12 ≤ I) (he : e = 1 ∨ e = 2)
    (ha : a ≤ e + (I+1)/13) (hb : b ≤ e + (I+1)/13) :
    a+b ≤ 1+e*(I-1)/2 := by
  rcases he with rfl | rfl <;> linarith

theorem high_index_inverse_budget (J e a : ℝ)
    (hJ : 12 ≤ J) (he : e = 1 ∨ e = 2)
    (ha : a ≤ e+(J+1)/13) :
    a ≤ e*(J-1)/2 := by
  rcases he with rfl | rfl <;> linarith

theorem termwise_exponent_from_budget (t e a b penalty : ℝ)
    (hb : a+b ≤ 1+t-e/2) (hp : 0 ≤ penalty) :
    -1-t+a+b-penalty ≤ -e/2 := by linarith

theorem exceptional_exponent (e : ℝ) (he : 1 ≤ e) :
    -1-e/2+1+1-e/2 ≤ 0 := by linarith

#print axioms high_index_budget
#print axioms high_index_inverse_budget
#print axioms termwise_exponent_from_budget
#print axioms exceptional_exponent
end AccelerationRun65

#check norm_coeff_le_of_deriv
#check CMLattice.exists_formal_parameter
#check CMLattice.exists_unit_coeff_degree_le
#check CMLattice.one_le_norm_coeff_translatedWp_nonsplit
#check CMLattice.exists_log_theta
#check CMLattice.rescale_translate_eq_theta_pow_mul
#check Parameters.thetaProducts_normal_form
#print axioms norm_coeff_le_of_deriv
#print axioms CMLattice.exists_formal_parameter
