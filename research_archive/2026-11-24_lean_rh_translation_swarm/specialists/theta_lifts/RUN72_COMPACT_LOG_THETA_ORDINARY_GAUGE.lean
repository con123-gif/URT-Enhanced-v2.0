import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN72 — log-theta closure and actual ordinary-prime gauge consumer
27 Nov 2026. Human source-matched derivation, conditional on named foundations;
independent audit and native compilation pending.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 completion-first;
manuscript 3b552f2f5c30d874e72f574a479c90037482f96d reviewed.
RUN71 aee9e04a; recent peers prime 72e67b83 projection/loss audit,
dependency 47581d42 Howe Casimir, Landau a2e4e787 off-Bessel checked
for nonoverlap. AGENTS, swarm protocol, handoff, expansion consulted.

## 1. Actual logarithm supplier: construct it, not an integral logarithm assumption
Lib/CM/KroneckerLimit/LogTheta.lean blob 99b01af94328fe9bcfd29a14db9933e72ac5c626,
CMLattice.exists_log_theta lines 144ff. Write F=Cp, O its valuation ring,
T=taylorVia iota theta, X0=taylorVia iota translatedWp,
phi=taylorVia iota translatedWpDeriv, R=O[[phi]] inside F[[z]].
Retain theta(0)=1, theta'(0)=0, sigma(0)=0, sigma'(0)=1, and the actual
theta_add_mul_theta_sub identity (Lib/CM/Sigma/CurveTheta.lean).
Differentiate its w-variable twice at zero:
  2 theta''(z)theta(z)-2 theta'(z)^2
    = 2 theta(z)^2 (theta''(0)-translatedWp(z)).
As formal series T is a unit; division by 2 and T^2 is in the
characteristic-zero FIELD series ring, not O. Thus
  -(T'/T)' = -iota(theta''(0)) + X0.
Choose L with L(0)=0 and L'=-T'/T by formal antiderivative,
coefficient n of L for n>=1 being coefficient n-1 of -T'/T divided by n.
Then L'(0)=0. The derivative of exp(L)T is zero, and its constant
coefficient is 1. In characteristic zero this forces exp(L)T=1, hence
T=exp(-L), and L''=L2+X0 with L2=-iota(theta''(0)).
This proves existence without supposing L or its antiderivative integral.

## 2. Exact dilation cancellation, closure and quadratic constant
Keep the native integral parameter facts: phi(0)=0, phi'(0)=1,
X0 in R, and R stable under d/dz (IntegralParameter.lean).
Writing phi^{-1} for compositional inverse, membership in R is exactly
coefficientwise integrality of f(phi^{-1}(z)). Therefore R is closed
for coefficientwise p-adic convergence. A series in R of constant 1
has its multiplicative inverse in R, by the coefficient recurrence.
Use the already retained self-isogeny supplier
rescale_translatedWpDeriv_mem (IsogenyIntegrality.lean
1b7411b4a950de12649c1f2cd171de834f8363fa, 149–159).
For a quadratic integer a, let A=iota(a), N=iota(a*bar a);
its actual lattice isogeny has integer degree a*bar a. For a=0
the assertions are immediate: phi(0)=0, T(0)=1.
For nonzero a, that supplier gives phi(Az) in R and
T(Az)=T(z)^N V for V in R, V(0)=1. In this formula N as an
exponent is the nonnegative integer degree; as a scalar it is its image.
Consequently E=exp(N L)T(Az)=V in R. Its logarithmic derivative
is E'/E = (N L-L(Az))' in R. There is no division by a
nonunit in O, nor any requirement to make exp(N L) alone integral.
For every pair (A,N) in normPairClosure, phi(Az) and E lie in R:
each coefficient is a polynomial in A,N (exp has zero-constant
argument, so only finitely many summands contribute per coefficient).
Their preimages under fixed phi^{-1} are likewise coefficientwise
continuous. Closedness gives the assertion at all limit pairs.
Then E(0)=1 gives E^{-1} in R, and the same E'/E argument supplies
the third clause. This proves the actual closure, not just pointwise
integrality for integer degrees.

Let omega=(1+sqrt(-d))/2, omega+bar omega=1,
omega-bar omega=sqrt(-d). Apply the third clause to omega and bar omega.
Both dilation defects F_A=(N L-L(Az))' belong to R, so their derivatives
and the difference belong to R. At z=0, X0(0)=0 and
F_A'(0)=(N-A^2)L2. Subtract BEFORE norms:
  F_barA'(0)-F_A'(0)=(A^2-barA^2)L2
    = iota(sqrt(-d))*L2.
Here barA denotes iota(bar omega), NOT p-adic complex conjugation.
Constant coefficient integrality proves |iota(sqrt(-d))*L2|<=1.
This is exactly the L2 estimate, not an assumption that L2 is integral.
Since iota(sqrt(-d)) is integral (quadratic integer), and
iota(sqrt(-d))^2=-d, also d L2 in O. Thus d L'' in R.
No coprimality restriction on p has been used.

## 3. Limit-pair Frobenius supplier (for the non-split normal form)
LogTheta.lean exists_map_eq_and_map_star_eq_pow and
mem_normPairClosure_of_pow_eq, lines 103–132.
Retain native primeNorm q=p or p^2 according to splitting, residue
field of Cp of characteristic p, and quadratic integer ring with
discriminant -d. For z in F_q in the residue field, choose a in O_K
whose residue is z and whose conjugate residue is z^p. In the inert
case O_K/p=F_{p^2}, conjugation is its nontrivial Frobenius (quadratic
separability); in the split case O_K/p=F_p x F_p and take (z,z);
in the ramified case O_K/P=F_p and conjugation acts trivially.
These descriptions follow by reduction of the monic minimal polynomial
of omega and CRT (at p=2, d=7 mod 8 makes it split); alternatively
retain the source residue classification as named foundation.
If |zeta|=1 and zeta^q=zeta, use z equal to its residue. Both iota(a)
and iota(bar a) are units and have residues zeta and zeta^p.
For a unit u with |u-1|<1, valuation of u^p-1 is at least
min(1+v(u-1),p*v(u-1)), v(p)=1, by the binomial expansion.
Repeated p powers increase this lower bound without limit
(the increase at each step is at least min(1,(p-1)*initial valuation)>0).
It follows that iota(a)^(q^k) -> zeta and
iota(bar a)^(q^k) -> zeta^p, since both target units are fixed by q power.
Their products converge to zeta^(p+1). The sequence a^(q^k)
is in O_K, giving the exact pair in normPairClosure.
This supplies the root-of-unity dilation premise of
exists_formal_parameter, not that theorem's later quantitative
coefficient or unit-coefficient estimates.

## 4. Actual jet and gauge caller: ordinary primes, including p=2
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425,
jet_theta_prod_integral 27–55. With s_i=(iota(conj delta))^-1 linearSeries(c_i),
form O-algebra S generated by the substitutions of R, L', T.
Their constants are integral (L'(0)=0,T(0)=1).
For f in R, d f' in R; for f=L', d L'' in R by section 2;
for f=T, d T'=-d L' T belongs to the algebra. The partial
derivative of f(s_i) is (c_ix/(iota(conj delta)*d)) (d f')(s_i).
The scalar is integral by the exact native guard. Derivative stability
extends by sum and product rules. Evaluation at zero is a ring map,
so every iterated derivative and integral polynomial jet of S is
integral. RUN71 rescale_translate_eq_theta_pow_mul puts the actual
translated theta products in S with the SAME nonzero delta; no factorial
division and no assumption p!=d. This closes the earlier log-theta
premise of the human jet derivation, relative to the named foundations.

New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0,
norm_jetSeries_le 55ff, norm_jet_jetSeries_le_one 89ff:
retain the native tight-frame expansion of standardData and thetaProducts
membership (including m coprime to p and periodFactor bound). Each
summand of the actual scaled jet with c=conj(delta)*d is bounded by one
by the preceding theorem applied with m*delta, nonzero because m is
prime to p. Its scalar derivative guard holds because m is a p-unit
and norm_periodFactor_mul_conj_le_one controls the frame coefficients.
The coefficients of the expansion are integral by the native integral
vacuum normalization and unit M=p*(d*N1)^6+1. Finite sum of integral
elements is integral by ultrametricity. This is the correct consumer
of the frame (not an arbitrary expansion over C). The original
frame and period-factor proof obligations are retained if not independently
audited; this note does not declare them closed.

For homogeneous Schur jet degree b=boxes kappa (card n'), the exact
homogeneity rescales the above unit estimate by
  (|iota(c)| / |iota(conj delta*d)|)^b.
All denominators are nonzero, including d. At
mem_raises_of_standardData 137ff, the native Schur polynomials have
integral coefficients, and mem_raises_of_jet_bound at identity
diagonal transports the entrywise bound to the Weyl gauge by
ultrametric matrix multiplication. Preserve the integral-level
reduction and standardData stability under the integral pair-Weil action
as the named hypotheses of that bridge.

ACTUAL A consumer: New/Columns/LocalStatement.lean
9d5bd0d698b0db2850cbd306d8d400d7e99a3547,
Data.IsGoodDatum.gaugeLe_one line 246.
For p!=D.N and p!=P.d, take the native translated datum with
delta=D.piG, c=star D.piG, using
H.translateDatum_mem_standardData hQ hN a _ (.inl rfl).
Then the factor is exactly one: |iota(star piG*d)|=
|iota(star piG)| because |d|_p=1. No assumption that piG is a
p-unit; cancel its nonzero norm BEFORE estimating. Every stage
therefore has factor 1; the native H.gaugeLe_chain propagates this
on the same integral column hv.2, and GaugeLe.restrictToY at hN
gives GaugeLe 1 1 (Bmu vartheta Psi v), as stated in the source.
This is the ordinary-prime branch of the A local supplier; it does
NOT discharge p=d, p=N or the marked non-split gain and index
bounds (which need the other normal-form and Hecke steps).

## Ledger and verification
Source-visible chain Main -> New.grh -> star_inequality -> Data.short_forms
-> A local index/divisibility -> gaugeLe_one -> gaugeLe_chain and
mem_raises_of_standardData -> norm_jet_jetSeries_le_one -> jet_theta_prod_integral
-> exists_log_theta -> rescale_translatedWpDeriv_mem and integral parameter.
Separate normal-form branch exists_formal_parameter -> mem_normPairClosure_of_pow_eq.
Local reduced path: addition identity + field antiderivative -> L;
unit self-isogeny factorization + coefficient closure -> dilation;
two conjugate evaluations -> d L'' integral -> stable jet algebra ->
standard jet bound -> exact ordinary-stage unit cancellation.
Keep original/reduced graphs and all pending edges; no global pruning
claimed. Cache key compact pin, C,d,p,iota,delta, frame parameters,
Q, actual standard datum and stage weight. No import of claimed RH
as a proof shortcut. No URT or numerical simulation.
Local command -v lean/lake/elan gave no paths. CI artifact
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804 on cathedral-research-state
actually reread: six B/C native checks with standard three axioms;
A module returncode 124 after 2700.11s, full_RH_replay=false,
all_requested_checks_ok=false. Below algebraic certificates are prepared,
not executed; native engine runs unavailable. No new PASS, no new axiom
audit, no claim of closure.

RESUME HERE: follow LocalStatement.mem_raises actual marked-prime
consumer through thetaProducts_normal_form and norm_schurJet_le,
especially the non-split normal-form unit coefficient and the
degree p+1,p+q estimates from FormalParameter.exists_formal_parameter.
Coordinate with prime RUN71 projection/loss audit; do not redo
ordinary-prime cancellation or the prior level/mixed-model algebra.
HANDOFF TO integration/editor/audit/native runner/prime-window.
Human RH reconstruction incomplete.
-/

namespace ThetaRun72

theorem addition_second (t t1 t2 c x : ℂ)
    (h : 2*t2*t-2*t1^2 = 2*t^2*(c-x)) :
    t2*t-t1^2 = t^2*(c-x) := by
  linear_combination h / 2

theorem conjugate_dilation_constant (a b n l : ℂ) (h : a+b=1) :
    (n-b^2)*l-(n-a^2)*l=(a-b)*l := by
  calc
    _ = (a-b)*(a+b)*l := by ring
    _ = _ := by rw [h]; ring

theorem discriminant_scaling (s d l : ℂ) (h : s^2 = -d) :
    d*l = -(s*(s*l)) := by
  linear_combination -l*h

theorem ordinary_stage_ratio (a d : ℝ) (ha : 0 < a) (hd : d=1) (b : ℕ) :
    (a/(a*d))^b=1 := by
  simp [hd, ne_of_gt ha]

#print axioms ThetaRun72.addition_second
#print axioms ThetaRun72.conjugate_dilation_constant
#print axioms ThetaRun72.discriminant_scaling
#print axioms ThetaRun72.ordinary_stage_ratio
end ThetaRun72
