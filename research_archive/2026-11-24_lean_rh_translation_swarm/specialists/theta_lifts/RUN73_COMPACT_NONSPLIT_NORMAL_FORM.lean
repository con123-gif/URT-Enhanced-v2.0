import Mathlib.Tactic

/-!
# RUN73 — non-split logarithmic normal-form coefficients and actual A consumer
27 Nov 2026. Human derivation of the coefficient estimate, unit coefficient
and Frobenius coupling argument, with named upstream premises retained.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first);
manuscript 963e42122931b8e534c39765bb2a7422b2c557d7. Consulted AGENTS,
swarm protocol, handoff, expansion and peer integration 9fbb841b,
prime 9474467c (near-lines and stage cut, distinct), RUN72 7023ef7b.
No RH theorem import; scalar certificate below uses only Mathlib.

## 1. Actual quantitative lemma: a uniform elementary valuation proof
New/Curve/FormalParameter.lean blob 61130bd5600a2b1f1679cfe0a18123d2c458d425,
norm_coeff_le_of_deriv (lines 70ff).
Use v(p)=1, v(0)=infinity. Retain p>=13, e in {1,2}, q=p^e, Q=q-1,
P=varpi^Q, v(P)=e/2, varpi nonzero, n(0)=0, n' and Z' integral,
Z_{j+1}=0 for Q not dividing j, Z_q=-1/P, m=O(X^3), m'=nZ'.
The projected and rescaled mu has coefficient
  mu_k = p P^I m_k,  k=p+1+QI, I>=0.
Indeed nonzero coefficients must be in this congruence class; the only
possible smaller nonnegative congruent degree >? is degree 2 when
e=1, which is zero by m=O(X^3). (For e=2, p+1<Q.)
At k>2, multiply by k BEFORE applying a norm:
  k mu_k = p P^I sum_{J>=0, r=k-1-QJ>=1} n_r (QJ+1) Z_{QJ+1}.
The r=0 term vanishes. Write a=v_p(k), c=v_p(r).
n' integral gives v(n_r)>=-c. Z' integral gives v((QJ+1)Z_{QJ+1})>=0;
at J=1 the EXACT coefficient -q/P has valuation e/2. Hence each
summand after division by k has valuation at least
  1 + e I/2 - a - c + (e/2) 1_{J=1}.                  (V)

Prove V>=0 for I=0,1 and V>=e/2 for I>=2, uniformly in J.
For I<=4, positivity of r gives -1<=I-J<=4 (if e=2 the
lower endpoint is excluded). Reducing mod p, k=1-I mod p and
r=J-I mod p. Thus a=0 except I=1, when k=p+q and a=1;
c=0 except J=I, when r=p and c=1. In particular the only double
denominator in I<=4 is I=J=1; the extra e/2 at J=1 pays it:
V=e-1>=0. For I=0 V=0; for I=2,3,4, V>=eI/2.
For I>=5, both k and r are positive and <=q(I+1).
If a>e, p^(a-e)<=I+1, while p^h=(1+(p-1))^h>=1+12h
for h>=0 by Bernoulli. Consequently a<=e+I/12, and likewise
c<=e+I/12. This also holds when a or c<=e. Therefore
  2a+2c <= 4e+I/3 <= 2+e(I-1)     (I>=5, e=1 or 2).
The last inequality is immediate for e=1 (I>=9/2) and e=2
(I>=24/5). Substituting into V proves the claimed tail estimate,
even ignoring the extra J=1 payment. Ultrametric summation proves
  mu = b1 X^(p+1) + b2 X^(p+q) + P R,
b1,b2,R integral. No estimates of the unprojected series were needed.
This directly supplies norm_coeff_le_of_deriv in the actual native
normal-form proof; it is not a replacement for the formal-height input.

## 2. Actual inert unit coefficient: the exact surviving factor
FormalParameter.exists_formal_parameter (same blob, 120ff).
Retain construction of the generator T in O[[phi]] and its inverse Z,
with Z=X mod X^(Q+1) and f(Z) integral for every f in O[[phi]].
At inert p, e=2 so Q+1=p^2>p+1. It follows that the coefficient
of degree p of every f in this ring is integral, and hence the
coefficient of degree p-1 of f' has norm <=1/p<1.
Apply the exact caller of
Lib/CM/FormalGroup/FormalHeight.lean
640cabefca81dde25d092fd6ac057c3bcdd3516e,
CMLattice.one_le_norm_coeff_translatedWp_nonsplit (135ff):
1<=|[X^(p-1)]xi|, where xi=taylorVia iota translatedWp.
Keep its proof (elliptic differential recurrence and isogeny
integrality) on the frontier, rather than assume an arbitrary height
theorem gives this coefficient assertion.
For L from RUN72, L''=L2+xi. Since p>=13,
  p(p+1) L_{p+1} = xi_{p-1}.
Composition with Z leaves degree p+1 unchanged, including the
quadratic term, because Z-X starts in degree p^2. The projected
rescaling at degree p+1 has coefficient p L_{p+1}; thus
  b1 = xi_{p-1}/(p+1).
As p+1 is a p-unit, the height lower bound gives |b1|>=1;
section 1 gives |b1|<=1. Hence b1 is a unit EXACTLY, not merely
nonzero. Inert u0=0 since 2 is not in the congruence class p+1
mod Q. For ramified e=1, p=d, do not assert either inert conclusion:
degree 2 is in that congruence class and must be retained. The
native discriminant estimate controls it separately. Also retain
the native generator/inverse normalization and translation unit
construction, including exists_unit_coeff_degree_le; not proved here.

## 3. Frobenius coupling: exact finite cancellation and exponential integrality
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda,
sum_pow_eq_zero_of_null, coeff_sum_frob_ne_zero_iff,
exists_frame_rows_frob and thetaProducts_normal_form (19–end).
Use the actual integral coordinate frame with scalar beta and
p-unit M, and the exact frame Frobenius identity (57ff); retain its
Galois/residue transport premise, not just a heuristic pairing.
In the truncated quotient of the integral series ring by coefficients
of degree <=B in the ideal {v>=e/2}, the quotient has characteristic p.
The source works coefficientwise at each requested monomial, so
truncation at total degree B is also sufficient for this argument.
For t_i with zero constant term, t_i-t_i^q=L_i gives EXACTLY
  t_i=sum_{h>=0} L_i^(q^h)
in that quotient: iterate until q^h>B. If all sums
sum_i L_i^(p^j) L_i vanish for the permitted j (odd when e=2,
all when e=1), every cross term in sum_i t_i^(p+1) vanishes:
its exponents of Frobenius are eh+1 and ek. Factoring out the
smaller Frobenius power leaves the coupling at their absolute
difference, odd for e=2. The same argument for t_i^(p+q)
uses eh+1 and e(k+1). For ramified e=1 the quadratic term
sum_i L_i^2 also vanishes (j=0). When j>log_p B the
coupling is zero by positive degree, not an extra hypothesis.
The frame identity identifies the surviving coefficient factors
with beta^(p^j+1) M and partner place -p^j, so the prescribed
null-cone constraints imply exactly these sums vanish. Thus the
aggregate exponent series Psi after the native substitutions has
every relevant coefficient of valuation >=e/2. The source
|kappa|=p^(e/2-1/(p-1)) gives v(kappa Psi)>=1/(p-1).
For every term of exp(kappa Psi), Legendre's factorial bound
v_p(n!)<=n/(p-1) proves integrality, without assuming convergence
of an analytic exponential at the boundary: each formal coefficient
is a finite sum because Psi has zero constant term. Multiplication
by the integral V preserves the result. This is the actual
IsIntegralOnNullCone supplier, conditional on the retained
one-variable normal form and frame identity.

At inert p and r=1, in the residue field S-S^(p^2)=X gives S'=1.
Differentiate the exact normal form before estimating:
  psi' = u1 S^p mod the maximal ideal.
The u2 term vanishes because p+p^2 is divisible by p, and the
error term vanishes because its factor P has positive valuation.
After the native linear substitutions L_i=sum_y z_{y,i} X_y,
  partial_x Psi = u1 sum_{h>=0} sum_i z_{x,i} L_i^(p^(2h+1)).
Each coefficient is u1 times the frame sum; since u1,beta,M are
units, the coefficient is nonzero precisely at X_y^(p^j) with
j odd and partner -p^j y=x (same column). Distinct (j,y) give
distinct monomials, so no cancellation between different pairs.
This proves the residue support assertion, including its reverse
direction; r<=1 alone would not guarantee the reverse direction.

## 4. Actual marked consumer, not another equivalent RH criterion
New/Curve/JetDivisibility.lean 5f6e6f63dc7bfc35aedc136ae8330510d3493f06,
norm_schurJet_le (65ff), and
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547,
Data.IsGoodDatum.mem_raises.
The normal form supplies the exact IsIntegralOnNullCone premise
of norm_schurJet_le at each stage, with B=boxes kappa N, theta=P,
rho=nonsplitWeight, omega=log_p|P|=-e/2. The actual bound is
  |schurJet| <= p^(m - ((1/(p-1)-rho)B + omega C - E)),
where m is total charge, C=sum couplingCount and
E=card(Phi)*N^3*(log_p B+1). No change in sign of omega.
Keep the native FitsRanks, marked charge guard hg, determinant
bound from exists_null_coupling_frames, coefficient-evaluation
lemma, and factorial dimension estimate. The consumer in mem_raises
uses exactly this theorem with ev=evenPlaces Lambda and the native
charge indicator, plus period-factor unit bound from
norm_jetSeries_le, not an arbitrary Schur jet. Retain its final
tableau charge counting and marked Hecke transfer as distinct edges.
This supplies the normal-form side of that consumer; it does not
close the entire marked-prime bound or Theorem A.

Original source-visible graph: Main -> New.grh -> star_inequality
-> Data.short_forms -> LocalStatement.mem_raises ->
norm_jetSeries_le / norm_schurJet_le / thetaProducts_normal_form ->
exists_frame_rows_frob / exists_formal_parameter ->
norm_coeff_le_of_deriv / formal-height lemmas / RUN72 log-theta.
Reduced human subgraph: exact derivative convolution -> valuation
(V) -> two-exception estimate; height lower bound + coefficient
identity -> inert unit; frame orthogonality + finite Frobenius
iteration -> null cone and exact residue support -> existing
norm_schurJet_le interface. All other original edges retained;
no global deletion or new axiom audit. Context cache key: compact pin,
p,d,e,iota,C,T,Z,L,frame,degree B, marked Lambda and stage weight.

Actual execution: local command -v lean/lake/elan returned no paths.
Python/SymPy finite regression over primes 13<=p<80, e in {1,2},
0<=I<=200, 0<=J<=I+1, r>0: 693651 actual index tuples, no counterexample
to doubled V bound. Reproduce using v(n)=loop division by p on positive
integer n and assert
2+e*I-2*v(k)-2*v(r)+e*(J==1)>=e*(I>=2).
This is only a regression, not the proof. The analytic estimate above
covers unbounded I. CI artifact
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json,
state branch blob 088cd2ec0e935ee1a282f10096949bcf671cc804 actually read:
six native B/C checks with the three standard axioms; A module
return 124 at 2700.11s, all_requested_checks_ok=false, full_RH_replay=false.
No native rh_scan/prune/reduce/auto/frontier run or new PASS; the
arithmetic certificates below are prepared, not compiled. No URT.

RESUME HERE: discharge the exact generator height normalization in
FormalParameter.exists_formal_parameter, especially FormalHeight
exists_unit_coeff_degree_le and the differential recurrence supplier;
then attach the actual determinant/frame charge bridge in
JetDivisibility.exists_null_coupling_frames and LocalStatement.mem_raises.
Reuse RUN73 coefficient and null-cone proof, not another finite test.
HANDOFF TO integration/editor/audit/native runner/prime-window.
Human RH reconstruction remains incomplete.
-/

namespace ThetaRun73

-- Doubled valuations, so no rational exponent arithmetic is needed.
-- Coarse bounds follow from p^h >= 1+12h, as derived above.
theorem tail_budget (e I a c : ℤ) (he : e = 1 ∨ e = 2)
    (hI : 5 ≤ I) (ha : 12 * a ≤ 12 * e + I)
    (hc : 12 * c ≤ 12 * e + I) :
    e ≤ 2 + e * I - 2 * a - 2 * c := by
  rcases he with rfl | rfl <;> omega

theorem small_budget (e I J a c : ℤ) (he : e = 1 ∨ e = 2)
    (hI0 : 0 ≤ I) (hI : I ≤ 4)
    (ha : a ≤ if I = 1 then 1 else 0)
    (hc : c ≤ if J = I then 1 else 0) :
    (if 2 ≤ I then e else 0) ≤
      2 + e * I - 2 * a - 2 * c + (if J = 1 then e else 0) := by
  rcases he with rfl | rfl <;> split_ifs at * <;> omega

theorem unit_coefficient_identity (p b x : ℂ) (hp : p ≠ 0)
    (h : p * (p + 1) * b = x) :
    (p + 1) * (p * b) = x := by
  calc
    _ = p * (p + 1) * b := by ring
    _ = x := h

#print axioms ThetaRun73.tail_budget
#print axioms ThetaRun73.small_budget
#print axioms ThetaRun73.unit_coefficient_identity
end ThetaRun73
