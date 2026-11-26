import Lib.CM.FormalGroup.FormalHeight
import New.Curve.ThetaProducts

/-!
RUN41 — Hasse and odd-isogeny-height suppliers at the actual Theorem A parameter caller.
26 November 2026. Human source-matched derivation; native probes PREPARED, not run.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
0ef71fd3afc82ac3e5c0fc0e23d5533a9e495dc9. Read AGENTS, swarm, handoff,
expansion, continuity and latest commits. Integration 3d8ec587 explicitly
leaves these two suppliers open. RUN40 baf9dee1 and acceleration d096310c
derive the two-exception valuation budget, not the following height proof.

Source ledger (all retrieved at pin):
* Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
  one_le_norm_coeff_translatedWp_nonsplit, exists_unit_coeff_degree_le.
* Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
  curve equations, good reduction, integral parameter ring, derivative stability.
* Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa:
  exists_eq_theta_pow_mul_of_norm_le (85–117), rescale_translatedWpDeriv_mem (149–159).
* Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626:
  exists_log_theta (144–178), including derivative integrality.
* Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
  sigma_two_mul, deriv_derivWeierstrassP, multiplier_eq_neg_sigmaSign,
  theta_zero, theta_eq_zero_iff, comp_mul_mem_sections.
* Lib/CM/Sigma/SigmaFunction.lean 08de17d5fa2f0e4c4cbc61c22d99a85ec367294e:
  sigmaSign, sigma_mem_thetaSpace, deriv_sigma_zero.
* New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425:
  exists_formal_parameter lines 170–192, exactly U and cg.
* New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda:
  thetaProducts_normal_form.

1. Hasse supplier by a two-step recurrence. Put O=integers of C_p, m_O its
maximal ideal, A=iota(a1), x=taylorVia iota translatedWp, y=parameter.
Native equations: y²+Axy=x³+x, x'=2y+Ax, y'=1+3x²-Ay.
Thus x'=0 at 0, x starts z² with coefficient 1, and
 (x')²=4x³+A²x²+4x, x''=6x²+A²x+2.
The latter follows directly by differentiating x'=2y+Ax and inserting y',
so no division by x' is needed. Let H(f)=[z^(p-1)]f. Assume the EXACT
native premise H(f') in m_O for every f in O[[y]], not that every original
z-series is integral. x, x', all x^n x' lie in that parameter ring, and
A is integral. For all n>=0 the exact identity
 (x^n x')'=(4n+6)x^(n+2)+(n+1)A²x^(n+1)+(4n+2)x^n
follows by the product rule (n=0 separately). If p=2, apply premise to
-y: H((-y)')=A (y_1=1,x_1=0), hence A in m_O, contradicting the native
unit discriminant A^4-64. Thus p odd. Set M=(p-1)/2. H(1)=0.
If H(x) were in m_O, induction on n=0,...,M-2 would put H(x^M) in m_O:
4n+6 is even, positive and <2p, hence not divisible by odd p.
For M=1 the induction is empty. But H(x^M)=1 by its exact leading term,
a contradiction. Therefore |H(x)|>=1. This uses no bound on higher
z-coefficients, no finite-prime extrapolation, and no separate Hasse theorem.

2. Same Hasse premise forces nonsplit. In exists_log_theta use the integral
derivative f=(a*conj(a) L-L(az))' with a=iota(sqrt(-d)), where conjugate
means image of the complex conjugate before embedding, so conj(a)=-a.
Since L''=L2+x and p-1>0,
 H(f')=a²(-1-a^(p-1)) H(x).
If chiK(d,p)=1, a is a p-adic unit and its residue lies in F_p^*, as a
root of the split polynomial X²+d; in particular a^(p-1)=1 in the
residue field. The parenthesis is then -2, a unit for odd p. Hence
|H(f')|=|H(x)|>=1, contradicting the premise. This proves both conclusions
of one_le_norm_coeff_translatedWp_nonsplit at their full native scope.

3. Odd-isogeny height: get the unit coefficient by an exact residue order
contradiction. Let a be the native self-isogeny with odd q=a*conj(a)>0,
Z tangent to identity with Z(0)=0, all f(Z) integral for f in the
parameter ring, g integral with g(0)=0 and Z(g)=iota(a) Z.
Write X(z)=xi(Z(z)) over O; its order after reduction is exactly two.
From the theta pullback theorem theta(az)=theta(z)^q v(z),
v in the parameter ring. Pull back the degree-two monomial
sigma(z)^2=theta(z)^2 xi(z). The source height/integrality principle at
degree 2q gives an integral polynomial Q with
 sigma(az)^2=theta(z)^(2q) Q(xi(z)) off the theta zero set
and the exact special value sigma(at)^2=Q_q sigma(t)^(2q).
Here t is the fixed native nonzero 2-torsion point; Q_q denotes coefficient
q, not an arbitrarily chosen leading coefficient.

The special value is a unit with no p-exception: theta(az) is a section
of odd degree q. Its automorphy at 2t, evaluated at -t, gives
theta(at)=-theta(-at)=-theta(at), since multiplier(2t)=-1 and the
exponential at the half-lattice midpoint is 1. Hence at=t+l for
l in Lambda. With H the Hermitian form and the normalized sigma, its
automorphy is sigma(z+l)=sigmaSign(l) exp(pi H(z+l/2,l)) sigma(z)
(up to the convention of which Hermitian slot is linear; both give the
same fourth-power value). Differentiate the native duplication identity
sigma(2z)=-wp'(z)sigma(z)^4 at t. Since wp'(t)=0, wp''(t)=2,
sigma'(2t)=-sigma(t)^4. Sigma automorphy differentiated at 0 gives
sigma'(2t)=-exp(2pi H(t,t)), as sigma'(0)=1 and t is not in Lambda.
Consequently sigma(t)^4=exp(2pi H(t,t)).
The same automorphy at t+l gives
 sigma(at)^4/sigma(t)^4 = exp(2pi (H(at,at)-H(t,t))).
Indeed 2t and l are lattice elements, so 2 Im H(t,l) is integral and
the phase exp(4pi i Im H(t,l)) is 1. Since H(at,at)=q H(t,t), this
proves Q_q²=1 exactly, matching the native l assertion. No complex
norm preservation under iota is used; map the algebraic equality.

Now cancel theta(z)^(2q), which has constant coefficient 1, before
substituting Z. The result over O is
       Q_iota(X)=v(Z)^2 X(g).
All series here are integral by the SAME hZ. Reduction commutes with
the substitutions (inner series have zero constant coefficient).
Since Q_q is a unit, reduced Q is nonzero and has least nonzero degree
j<=q. As reduced X has order 2, reduced Q(X) has order exactly 2j<=2q.
If all g coefficients up through q were nonunits, reduced g would be
zero or have order >=q+1. Then reduced X(g) is zero or has order
>=2(q+1). Multiplication by reduced v(Z)^2 cannot lower order; if v
reduces to zero the right side vanishes. Either alternative contradicts
nonzero Q(X) of order <=2q. Hence some coefficient of g in degree <=q
is a unit. This replaces the source valuation-ring divisibility
bookkeeping by one residue-field order comparison. It retains the
odd-isogeny, pullback, integral polynomial and height hypotheses.

4. Actual U/cg consumer in FormalParameter, not a new sufficient RH
criterion. Let q=m+1=p^e, Z=z+c z^q+..., Z'=integral; T inverse.
For integral g=T(iota(a)Z), coefficients 2,...,q-1 vanish,
g_1=iota(a), g_q=c(iota(a)-iota(a)^q). For nonsplit, a is p or
sqrt(-d), |iota(a)|=p^(-e/2)<1, q odd. Previous lemma forces g_q unit.
Ultrametric equality |iota(a)-iota(a)^q|=|iota(a)| gives
|c|=p^(e/2). For split q=p, if |pc|<1, for every f in O[[y]] write
F=f(Z) integral. f_1=F_1, f_p=F_p-c F_1 because Z tangent and
no intermediate coefficients. Thus |p f_p|<1 for every f, exactly the
Hasse premise; contradiction with split. Derivative integrality gives
|pc|<=1, hence equality, also at p=2. These are the two actual branches
of cg; together they supply the chosen root varpi^(q-1)=-1/c and its
exact norm, which RUN40/acceleration used in the two-exception budget.
Do not confuse the general split normalization with the p>=13 nonsplit
theta-product output; the latter uses the extra native Hasse inequality
for the inert coefficient as in integration 3d8ec587.

Static source-visible chain: original root -> star -> short_forms ->
marked local jet/Hecke -> thetaProducts_normal_form ->
exists_formal_parameter -> the two FormalHeight lemmas above. Reduced
human chain replaces only these two local proof bodies by steps 1–3;
all native edges, types, axioms and remaining obligations are retained.
Cache context includes pin, C, p, iota, chosen a and q, Z and g, and
the actual hZ witness. No global root dependency removed. Open inputs
include exact integral polynomial/height principle and isogeny
pullback, parameter ring and good reduction, and log-theta existence
proof. No RH import, no URT premise, no claim of global minimality.

Native validation: command -v lean/lake/elan found none in local
container. Actual shared compact primitive receipt on state branch
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804 reread: six native checks
in other modules, standard three axioms, A module build timeout
124 (2700.11 s), all_requested_checks_ok=false, full_RH_replay=false.
Prior old-pin rh_scan/prune/reduce/auto/frontier evidence is not compact
verification. No new native run; probes below are prepared only.
No synthetic tests. Independent audit requested, particularly special
value phase and exact integral polynomial witness. Do not count as
independently audited until peer checks actual source.

RESUME HERE: derive the exact good-reduction discriminant and local
height/isogeny pullback suppliers at IntegralParameter.lean and
IsogenyIntegrality.lean, or audit their already-completed peer proof
against this exact odd-height consumer. Then feed the same normalized
parameter to the marked Hecke local caller. Shared compact runner:
batch these native probes when feasible; preserve graph and axiom
evidence and actual timeout. HANDOFF TO integration, editor, audit,
theta, acceleration, shared native runner.
-/

#check CMLattice.one_le_norm_coeff_translatedWp_nonsplit
#print axioms CMLattice.one_le_norm_coeff_translatedWp_nonsplit
#check CMLattice.exists_unit_coeff_degree_le
#print axioms CMLattice.exists_unit_coeff_degree_le
#check CMLattice.exists_formal_parameter
#print axioms CMLattice.exists_formal_parameter
#check CMLattice.exists_eq_theta_pow_mul_of_norm_le
#print axioms CMLattice.exists_eq_theta_pow_mul_of_norm_le
#check CMLattice.rescale_translatedWpDeriv_mem
#print axioms CMLattice.rescale_translatedWpDeriv_mem

-- Scalar substeps, separate from the native declarations. Prepared only.
example (q j k : ℕ) (hj : j ≤ q) (hk : q + 1 ≤ k) :
    2 * j < 2 * k := by omega

example (A x y : ℚ) (h : y^2 + A*x*y = x^3 + x) :
    (2*y+A*x)^2 = 4*x^3+A^2*x^2+4*x := by
  linear_combination 4*h

example (a c : ℚ) (q : ℕ) :
    a*c - c*a^q = c*(a-a^q) := by ring
