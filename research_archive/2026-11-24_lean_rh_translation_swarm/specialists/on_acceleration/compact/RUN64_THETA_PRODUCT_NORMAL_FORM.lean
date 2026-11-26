import New.Curve.ThetaProducts
import Mathlib.Tactic

/-!
# RUN64 — tight-frame Frobenius normal form at the actual marked jet caller

26 November 2026. Human source-matched derivation, conditional on the
single-curve formal parameter and exact Frobenius embedding theorem;
independent audit and new native compilation outstanding.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Latest manuscript retrieved blob 0e365a21fbbb549e300384681c8b615cc9e32510.
Peer integration f775ec50, editor add4eea2, theta 917cdb64, URT c5a8c340,
predecessor f2750806. Do not redo the numerical exponent inequalities.

Source ledger:
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda:
sum_pow_eq_zero_of_null, coeff_sum_frob_ne_zero_iff,
Parameters.exists_frame_rows_frob, Parameters.thetaProducts_normal_form.
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425:
IsIntegralOnNullCone, CMLattice.exists_formal_parameter.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
Data.IsGoodDatum.mem_raises (uses first normal-form projection),
then exists_move_markOperator, gaugeLe_markOperator_pow,
gaugeLe_Bmu_of_isMarked, exists_indexDvd_Bmu_divisible.

## 1. Tight-frame supplier over arbitrary quotient rings

Fix actual tight frame w_i of length M and scalar beta integral in O_Cp.
At nonsplit p, p does not divide N=N1(s) (chiK_eq_one_of_dvd);
N is a unit in O_Cp. Integral x_i=N w_i exist by the finite-image
bound in the native WeilData. Write f_v for the integral map given by
iota_p Phi_v on the ring of integers, alpha=beta/N.
Then z_vi=alpha f_v(star x_i) is integral and is exactly
beta iota_p(conj Phi_v(w_i)).
Take ANY characteristic-p quotient g killing elements of norm <=|pi|,
where |pi|=p^((chiK-1)/2). For live j (odd or p=d), the retained
native frob_ext applied to g f_v says
 (g f_v(star x_i))^(p^j)=g f_v(gal_{-p^j} x_i).
In the ramified case g kills sqrt(-d) since its norm is p^(-1/2);
this is the second guard of that Frobenius theorem. No field or
reducedness assumption on the quotient.
Multiply by g f_v'(star x_i), sum and apply the tight frame identity
before taking a norm. The sum before g is N^2 M if v'=-p^j v,
zero otherwise. Since alpha^(p^j+1) N^2=beta^(p^j+1) after
reduction (N^p=N in characteristic p), obtain exactly
 sum_i g(z_vi)^(p^j) g(z_v'i)
   = 1_{v'=-p^j v} g(beta)^(p^j+1) M.
This is exists_frame_rows_frob with no pairwise independence premise.

## 2. Finite Artin-Schreier cancellation, including nilpotents

Let Q be a commutative ring of characteristic p and t_i-L_i=t_i^(p^e).
Suppose t_i^(p^n)=0 for n>=B0. Iterating the identity in Q gives
 t_i = sum_{a=0}^{A-1} L_i^(p^(ea)) + t_i^(p^(eA)).
Choose eA>=B0, so the remainder is zero. This is a finite equality,
not a convergence assertion. If all sums sum_i L_i^(p^j) L_i
are zero for live j, then for any a,b>=0 with |a-b| live,
 sum_i L_i^(p^a) L_i^(p^b)
 = (sum_i L_i^(p^|a-b|) L_i)^(p^min(a,b))=0.
Expand t_i^p t_i and t_i^p t_i^(p^e) using the finite equality.
Their mixed exponents have indices (1+ea, eb) and (1+ea,e+eb).
For e=2 their differences are always odd; for e=1 the ramified
hypothesis makes every j live (including zero). Hence both sums over i
vanish. This is exactly sum_pow_eq_zero_of_null. In the ramified
case it also gives sum_i L_i^2=0 directly from the j=0 guard.

## 3. Actual quotient argument and factorial control

Retain the single-curve theorem exists_formal_parameter with its
S-S^(p^e)=X+pi E and common n-torsion normal form
 Theta_y(varpi X)=exp(kappa psi(NX)) V_y(NX).
Here |N|=1, |kappa|=|pi|^(-1) p^(-1/(p-1)),
psi=u0 X^2+u1 S^(p+1)+u2 S^(p+p^e)+pi R,
u0=0 for e=2, psi(0)=0. Same N,kappa for all y of denominator n.
For the actual theta product set beta=N b; its norm <=1.
Substitute L_ic=sum_v z_vi X_vc into S,psi,V_y, and sum the
psi terms, multiply the V_y terms. This gives a single exponential
exp(kappa Psi) times integral V; Psi(0)=0. Do not assert the
exponential itself integral on arbitrary arguments.

Now take the actual substitution Z from IsIntegralOnNullCone and a
target multidegree d of total degree m<=B. Form the quotient of the
integral series ring by the ideal of series whose coefficients at
all multidegrees <=d (componentwise) have norm <=|pi|.
It is an ideal by the convolution formula and the downward-closed
box of multiindices. It kills pi and p (|p|<=|pi|), hence has
characteristic p unless zero, in which case the claim is immediate.
All substituted variables have constant term zero. In this quotient
t_ic=S(L_ic(Z)) satisfies t_ic-t_ic^(p^e)=L_ic(Z).
Powers t_ic^(p^n) vanish when p^n>m, even in the nonreduced ring.
By Section 1 the sum over i,c of L_ic(Z)^(p^j) L_ic(Z) is
g(beta)^(p^j+1) M times the native partner coupling
sum_{v,c} Z_vc^(p^j) Z_{-p^j v,c}.
It vanishes for j<=log_p B live by the null-cone hypothesis,
and for j>log_p B because p^j>m. Thus Section 2 applies with
the actual full live set, not just finitely many tested couplings.
The u0 term vanishes by the j=0 identity when ramified, and is
zero in the inert case; both S terms vanish by Section 2.
Therefore Psi(Z) maps to zero: EVERY coefficient at multiindex
a<=d has norm <=|pi|. This simultaneous coefficient statement
is important for the subsequent convolution.

For degree d of exp(kappa Psi(Z)) each product of k coefficients
of Psi(Z) contributing at d has each individual index <=d.
Its norm after division by k! is at most
 |kappa|^k |pi|^k p^(v_p(k!))
 = p^(v_p(k!)-k/(p-1)) <=1.
Use Legendre v_p(k!)<=k/(p-1); k=0 term is 1. Because
Psi(Z)(0)=0, only finitely many k contribute at d. Multiplying by
integral V(Z) preserves the estimate, applying the argument to
every a<=d as needed. This proves the first projection of the
native thetaProducts_normal_form from its retained upstream inputs.

## 4. Exact inert derivative support (second projection)

For inert p and r=1 reduce over the residue field (not the
degree-box quotient). Since pi reduces to zero, differentiate
S_i-S_i^(p^2)=L_i to get partial_x S_i=partial_x L_i.
The derivative of S_i^(p+p^2) is zero; u0=0, and u1 reduces to a
nonzero unit. Thus for x=(v,c),
 partial_x Psi_bar = u1_bar sum_i z_vi_bar S_ic_bar^p.
At a fixed coefficient, Artin-Schreier iteration gives
 S_ic_bar = sum_{a>=0} sum_y z_yi_bar^(p^(2a)) X_yc^(p^(2a)).
The equality is coefficientwise finite since degrees grow.
Taking p-th powers, summing, using Section 1 yields precisely
 partial_x Psi_bar =
 u1_bar M sum_{a>=0,y: -p^(2a+1)y=v}
       beta_bar^(p^(2a+1)+1) X_yc^(p^(2a+1)).
For r=1 beta is a unit, M is prime to p, and u1 is a unit.
Distinct pairs (a,y) give distinct monomials because p>1.
Thus NO cancellation of the displayed nonzero terms is possible;
all other coefficients vanish. This is the exact coefficient support
iff in the second projection, including the same column c.
It proves more than support inclusion, without any density argument.

## 5. Actual caller and remaining premise ledger

LocalStatement.mem_raises takes both formal-parameter norm scales
and the first normal-form projection, at delta=1 and r<=1
from norm_star_piG_le_one and norm_iota_periodFactor_eq_one.
It uses norm_jetSeries_le to pass to the weighted Schur jet; the
null-cone statement here is for every B and every allowed Z,
not merely the chosen frame. Retain the original jet/charge bounds,
level and twist-coprimality guards, same good datum and same marked
set. Combining with RUN62/63 supplies the numerical valuation
estimate conditional on these native frame/Schur inputs.
Do not identify the second projection with the first or assume
that inert derivative support holds at p=d.

Original source edges: FormalParameter.exists_formal_parameter,
frob_ext, frame integrity -> exists_frame_rows_frob and
sum_pow_eq_zero_of_null, coeff_sum_frob_ne_zero_iff ->
thetaProducts_normal_form -> mem_raises -> gaugeLe_markOperator_pow
-> gaugeLe_Bmu_of_isMarked -> exists_indexDvd_Bmu_divisible ->
Data.short_forms -> star_inequality.
Reduced HUMAN graph replaces the four intermediate normal-form
lemmas by sections 1–4; all incoming assumptions and outgoing
consumers survive. No kernel dependency deletion claimed. Preserve
previous graph and axiom files. In particular single-curve
exists_formal_parameter and its norm_coeff_le_of_deriv, exact
frob_ext embedding bridge, theta-product membership of actual
datum, and Schur extraction remain for integration/audit.
No new URT premise, no finite tests masquerading as proof.

Local lean/lake executables absent. Actual CI state retrieved:
compute/rh-compact-primitives-replay-20261126/status.json blob
a56e2d3afb99ed8275e81fd63c8494306e57c43f, error, returncode 1,
run 45803534769. No new native PASS. Below prepared scalar
certificate and native interface probes; execute in compact
environment with the shared cache, not the older long-proof pin.

RESUME HERE: reconstruct FormalParameter.norm_coeff_le_of_deriv
and the single-curve formal parameter rescaling, especially
the two exceptional degrees and the unit coefficient p+1.
Audit Section 1 Frobenius restriction and Section 3 degree-box
quotient against the native basis ideal. Then join at actual
mem_raises with the existing Schur/frame peer construction.
HANDOFF TO integration, theta, audit and kernel extractor.
-/

namespace AccelerationRun64

theorem exponential_valuation_budget (k q v : ℝ)
    (hq : 0 ≤ q) (hv : v ≤ k*q) :
    k*(-q) + v ≤ 0 := by linarith

theorem finite_sum_pair_cancel {R J A B : Type} [CommRing R]
    [Fintype J] [Fintype A] [Fintype B]
    (u : J → A → R) (v : J → B → R)
    (h : ∀ a b, ∑ i, u i a * v i b = 0) :
    ∑ i, (∑ a, u i a) * (∑ b, v i b) = 0 := by
  classical
  calc
    _ = ∑ i, ∑ a, ∑ b, u i a * v i b := by
      simp only [Finset.sum_mul, Finset.mul_sum]
    _ = ∑ a, ∑ i, ∑ b, u i a * v i b := Finset.sum_comm
    _ = ∑ a, ∑ b, ∑ i, u i a * v i b := by
      apply Finset.sum_congr rfl
      intro a _
      exact Finset.sum_comm
    _ = 0 := by simp [h]

#print axioms exponential_valuation_budget
#print axioms finite_sum_pair_cancel
end AccelerationRun64

#check sum_pow_eq_zero_of_null
#check coeff_sum_frob_ne_zero_iff
#check Parameters.exists_frame_rows_frob
#check Parameters.thetaProducts_normal_form
#print axioms Parameters.thetaProducts_normal_form
