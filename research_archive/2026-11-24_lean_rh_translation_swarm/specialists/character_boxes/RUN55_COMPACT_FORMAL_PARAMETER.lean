import Mathlib

/-!
# RUN55 — formal-parameter normalization and two-exception coefficient estimate
26 Nov 2026. Human source-matched derivation; scalar certificate PREPARED,
not compiled. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
499c62386aed401e362cff682bccd142d5b2c5ba; contract
7ad9c7c64f53c621ad20422226ad9d0b756ee28e. Read own RUN54 b0ec37d0
and latest peer commit list (Galois 02cf3869, theta 1cc71623,
integration b5cd3751, editor 837dd3d8); distinct from their work.
Read AGENTS, protocol, handoff, expansion and continuity excerpts.

Sources (actual theorem bodies):
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425:
 exists_norm_eq_inv_pow_bounds, norm_coeff_le_of_deriv,
 coeff_subst_tangent, CMLattice.exists_formal_parameter.
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
 CMLattice.one_le_norm_coeff_translatedWp_nonsplit,
 CMLattice.exists_unit_coeff_degree_le.
Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626:
 CMLattice.exists_log_theta.
New/Curve/DepthPairs.lean d53a0d9e22baa06916be8cc331c4394340483e3e:
 exists_hasLargeSplit_of_pairs, actual consumer of normal form.
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda
 (RUN54 ledger, not fetched again here).

## 1. Fix one parameter, determine its scale exactly before estimating
Only non-split p>=13 is needed for this caller. Put e=1 if ramified,
e=2 if inert; q=p^e, Q=q-1. Use the source a=sqrt(-d) if p=d,
a=p otherwise, so |a|^2=p^-e. Work over C_p with valuation v(p)=1
and integral ring O. The native generator averaging over Q-th roots
of unity gives T(X)=X+terms in degrees 1 mod Q, in phiSeriesRing,
and its substitution inverse Z with Z(0)=0, Z'(0)=1; all f(Z) for
f in phiSeriesRing are integral. Equivariance passes to Z by
uniqueness of inverse. Thus Z-X has order at least q. The rescaling
endomorphism g=T(a Z) is integral, and Z(g)=a Z. At degrees 2..q-1
g has zero coefficients, and its linear coefficient a has norm <1.
By the native formal-height degree bound there must be a unit
coefficient at some degree <=q, hence exactly q. Writing z=[X^q]Z,
inverse composition gives [X^q]T=-z. Therefore
   [X^q]g=(a-a^q)z,    |a-a^q|=|a|,    |z|=|a|^-1.
This fixes the same varpi chosen by varpi^Q=-1/z:
   v(varpi)=e/(2Q), v(P)=e/2 where P=varpi^Q.
The degree theorem is not a free assumption about all formal
series. In its native proof an integral theta-section polynomial
R of degree q has top coefficient a unit (source Q.coeff q squared
equals 1); the integral translated Wp in Z coordinates, x, has
order 2 with unit quadratic coefficient. Modulo the maximal ideal
the section identity implies x(g) divides R(x). If all coefficients
of g through q vanish in the residue field, the left side has
order >=2(q+1), but R(x) has order <=2q, contradiction. This
explains the exact degree theorem; its integral section identity
and construction of R are retained source inputs, not reproved here.

## 2. A single elementary valuation lemma proves the inverse tail
Z' integral by the native inverse derivative lemma. Thus
v(z_(1+QI)) >= -v_p(1+QI). For I>=2,
   2 v_p(1+QI) <= e(I-1).
Indeed 2<=I<p implies 1+QI = 1-I mod p is nonzero.
For I>=p let A=floor(log_p(I+1)). Both 1+QI and p+1+QI
are <=p^e(I+1), hence their valuations <=e+A.
For every integer A>=1, p^A>=p A (induction), so
A<= (I+1)/p <=(I+1)/13, also for A=0.
For e=1 or 2 and I>=13,
   2e+2(I+1)/13 <= 1+e(I-1)/2.
In particular e+A <= e(I-1)/2 (since e(I-1)/2>=1).
Consequently the rescaled inverse Z0=varpi^-1 Z(varpi X)
is X-X^q+P E0, E0 integral with zero constant and linear terms.
The sign of E0 is immaterial; use the native E=-E0. Its inverse
S is integral by recursive coefficient inversion (linear coefficient
one); hence S-S^q=X+P E(S). The same T satisfies
T(varpi X)=varpi S. This proves the tail and the actual normalized
formal group identity, without independently choosing local scales.

## 3. Two exceptions in the logarithm: exact coefficient proof
Use exactly the hypotheses of norm_coeff_le_of_deriv, m'=n Z',
n(0)=0, n' and Z' integral, m vanishes through degree 2,
Z supported in 1 mod Q and z_q=-P^-1. Write
mu=p varpi^(-p-1) rescale(varpi, congruencePart_Q,p+1(m)).
Any possibly nonzero degree >2 is k=p+1+QI, I>=0:
for e=2 the preceding congruent degree is negative, and for e=1
it is 2 (vanishes). Coefficient comparison before norms gives
   k m_k = sum_(J>=0, j=k-1-QJ>=1) n_j (Z')_(QJ).
Since v(n_j)>=-v_p(j), and v((Z')_(QJ))>=0 except that
J=1 has the exact value v(q z_q)=e/2, every scaled summand has
valuation at least
   1+ e I/2 - v_p(k) - v_p(j) + (e/2) 1_(J=1).   (*)
No number-of-summands factor by ultrametricity.
Here J<=I+1 since p+Q(I-J)>=1; J=I+1 only possible
for e=1, and then j=1.

For I=0, k=p+1 is a unit; j=p for J=0, and j=1
for the possible J=1, so (*)>=0. For I=1, k=p+p^e
has valuation 1 for p>=13, and j is a unit unless J=1
(j=p). Thus (*)>=0 in every case; at J=1 it equals e-1.
For 2<=I<p, k is a unit (k=1-I mod p), and j a unit
except J=I, when j=p. Therefore (*)>=eI/2>=e/2.
For I>=p, both k and j<=p^e(I+1) and section 2 gives
 v_p(k)+v_p(j)<=2e+2A<=1+e(I-1)/2.
Again (*)>=e/2. This yields precisely
 mu=u1 X^(p+1)+u2 X^(p+q)+P R, u1,u2,R integral.
Unlike a bound using only integrality of Z', the J=1 correction
is necessary for the ramified exceptional coefficient. All
estimates are uniform in the actual integral series.

## 4. The inert coefficient is a unit, not just integral
Write L''=L2+x, x=translatedWp, from exists_log_theta and
L1=L-L_2coeff X^2. In native coordinates m=L1(Z), n=L1'(Z);
n'=x(Z) Z' integral, so section 3 applies. As q=p^2>p+1,
coefficients through degree p+1 of m and L1 coincide.
For any f in phiSeriesRing, f(Z) is integral, so [X^p]f
is integral, hence |[X^(p-1)]f'|<=p^-1<1.
The native Hasse coefficient result gives |[X^(p-1)]x|>=1.
For its needed first conjunct there is also a direct argument:
x starts X^2 with coefficient 1 by the curve equation. If
|[X^(p-1)]x|<1, use the source differential identity
 (x^n x')' -(n+1)a1^2 x^(n+1) -(4n+2)x^n
      =(4n+6)x^(n+2).
Induct from x^0 and x^1. For 0<=n<=(p-5)/2, 4n+6
is a p-unit (it is even and between 6 and 2p-4); the derivative
term has coefficient norm <1 by closure under multiplication
and differentiation in phiSeriesRing and the preceding hypothesis
on f'. The other terms have norm <1 by induction and integrality
of a1. Hence all powers through x^((p-1)/2) would have
coefficient at p-1 of norm <1, contradicting its coefficient 1.
This proves the required first conjunct (not the split-prime
classification, which is not used in this argument).
Since [X^(p-1)]x=p(p+1)[X^(p+1)]L, section 3's integral
u1=p[X^(p+1)]m has norm >=1 and <=1: exactly 1.
For ramified e=1 the congruence class also includes degree 2;
its coefficient u0=kappa^-1 varpi^2 L2/2 is integral since
v(L2)>=-1/2 and v(kappa)=(p+1)/(2Q)-1.
For inert e=2 that class excludes degree 2, hence u0=0.
Here kappa=varpi^(p+1)/p; v(kappa)=e(p+1)/(2Q)-1, i.e.
|kappa|=p^((1-chi)/2-1/(p-1)) exactly.
Finally equivariance of Z and S under Q-th roots of unity means
congruence projection commutes with substitution, so the normalized
logarithm in original coordinates is the polynomial in S from
section 3 plus the P-integral tail. The torsion translate identity
in exists_formal_parameter uses N=(n Q)^-1, kappa' = -(n Q)^2
kappa, units preserving the same magnitude for p coprime to n.
Its integral residual series follows from the source translate
and root-of-unity averaging identities; full reconstruction of
that identity is retained, not claimed here. This delivers the
actual u1-unit and valuation suppliers for RUN54 derivative support.

## Evidence and handoff
Executed exact integer JS test, p=13,17,19,23,29,31,37,41,43,47,
53,59,61,67,71,73,79,83,89,97, e=1,2, I=0..500, J=0..I+1
with j=p+Q(I-J)>0. Valuation by repeated exact integer division;
all integers here <2^53. Tested 19,960 inverse-tail inequalities,
5,039,900 log-tail inequalities, 160 exceptional inequalities.
20 negative controls at e=1,I=J=1 fail if the special J=1 term
is omitted. Reproduce with:
  Q=p**e-1; k=p+1+Q*I; j=k-1-Q*J
  assert 2*vp(1+Q*I,p)<=e*(I-1) for I>=2
  assert 2+e*I-2*vp(k,p)-2*vp(j,p)+(e if J==1 else 0)
         >= (e if I>=2 else 0).
Finite regression checks are not proofs of the p-adic theorem.
Local command -v lean/lake empty. Actual previous CI 45803534769
retrieved completed/success at workflow level only; RUN54 records
partial probe failures and this run did not replay those modules.
No new native PASS, no axiom ledger for this file. No native
rh_scan/prune/reduce/auto/frontier (old pin and unavailable local
Lean); source-level premise reduction only. Original and reduced
graphs preserved, no global deletion. Static contextual edge
depth_indicator_jet -> exists_hasLargeSplit_of_pairs ->
thetaProducts_normal_form -> exists_formal_parameter ->
{formal height degree, normalized inverse, log coefficient bound,
Hasse coefficient, translate identity}; cache key C,p,iota,e,T,Z,
same varpi and residue parameter, not theorem name.

RESUME HERE: reconstruct actual torsion-translate residual integrality
from rescale_translate_eq_theta_pow_mul and normPairClosure root
averaging, plus the remaining exact DepthPairs order/htheta/hL size
guards. Keep integral section construction, formal-height degree
supplier and other A/B/C primitives explicit until audited.
HANDOFF TO integration/editor, formal audit, theta and kernel batch.
-/

namespace CompactCharacterBoxes55

theorem large_index_e1 (I A : ℝ) (hI : 13 ≤ I)
    (hA : A ≤ (I+1)/13) :
    2+2*A ≤ 1+(I-1)/2 := by linarith

theorem large_index_e2 (I A : ℝ) (hI : 13 ≤ I)
    (hA : A ≤ (I+1)/13) :
    4+2*A ≤ 1+(I-1) := by linarith

theorem coefficient_tail (e I vk vj bonus : ℝ)
    (h : vk+vj ≤ 1+e*(I-1)/2) (hb : 0 ≤ bonus) :
    e/2 ≤ 1+e*I/2-vk-vj+bonus := by
  linarith only [h, hb]

theorem exceptional_ramified :
    (1:ℚ)+1/2-1-1+1/2 = 0 ∧ (1:ℚ)+1/2-1-1 < 0 := by norm_num

#print axioms large_index_e1
#print axioms large_index_e2
#print axioms coefficient_tail
#print axioms exceptional_ramified
end CompactCharacterBoxes55
