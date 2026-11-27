import New.Endgame.OneSidedCriterion

/-!
# D1/E1 editorial reconciliation and signed-residue caller audit

27 November 2026. REVIEW: agree on the human D1 construction and E1 analytic
implication under the retained conventional analytic theorems and the star
inequality; not a native replacement replay. RH reconstruction OPEN.
Source: Alpöge, Sernau, Anthropic collaborators and Claude,
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 4aed2e68e6bd724826bc1e669c07a48e0b95eddd; spine
42a627f92d333109537ceeb3b920a931f0518685; ledger
17d915cc436b188878df50e1384d77a5a1d4cdcc; detailed archive sections 6a–c
619ae01be98c32e053eef1c8bcd44ccddd0664e7.
Read AGENTS, swarm protocol, queue, expansion, latest D1 audit and B2 caller
audit. The next B2 packing step is already assigned to the geometry/URT/Landau
cluster; this editor run takes the independent E1 audit requested by the ledger.
Latest peers 39478bf0 (D1), f1ef185f (formal height), 9d383221 (exchange),
31f5d332 (C1) and f8c4e65a (B2), inspected commit metadata and D1 body.

Actual source blobs read:
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3
New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2
Lib/Analytic/Landau/PolarLandau.lean 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9
Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11
The exact native graph remains unchanged; original source route:
New.grh -> eventually_primeError_le_rpow -> exists_data, star_inequality,
IsPolar.exists_window_sub_mul_le; New.grh -> entireL_ne_zero_of_primeError_le
-> isPolar_primeError, IsPolar.landau, exists_entireL_quadTwist_ne_zero.
Candidate human route replaces only the second-scale moment selection by
fixed-modulus PNT, uses D1 with growing-modulus Siegel–Walfisz and preserves
the polar identity, zero-density and the functional equation. No kernel
edges retired and no imported claimed RH theorem.

D1: independent audit commit 39478bf0aa75c9b7c7cc56149643555393ec90e5,
audit/2026-11-27_COMPACT_D1_DATA_EXISTENCE_AUDIT.lean (blob
e8d7f168826afe3a07d86ecf40b7270bcb483edb) checks all native fields and five
supplementary conclusions under uniform SW and native arithmetic facts.
Mark human D1 audited; full witness/caller native replay remains open.
Do not mistake that ordinary auxiliary prime existence for star.

E1 audit, exact quantifier and normalization checks:

(1) Fix a hypothetical zeta zero rho with 1/2 < sigma=Re rho < 1. Choose
0<epsilon<1/100 and beta=1/2+8epsilon<sigma. M=18480 and a=9239:
a=7 mod 8, gcd(a,M)=1 since M=2(a+1), and a^2=1 mod M since a+1=9240
is even. Choose the prime d in this class once, depending on beta and
abs(Im rho), BEFORE x grows. This is the q=1 specialization of New.grh.
For every such prime d, P is fixed; the classical fixed-modulus PNT
applies to M*d and d separately. The weight at prime powers dividing d
is not dropped: it contributes O_d(log y); M-dividing terms are excluded
when M>1. CRT on reduced classes gives A_M(y)=y/phi(M)+E_M(y) with
E_M(y)=O_P(y exp(-c_P sqrt(log y))). The same c>0 can be chosen for M,1.

(2) The exact ramp is integral_1^y A_M(v)/v^2 dv. Euler products,
including the unique principal regularization term, give
F(s)=s/[phi(M)(s-1)]+logDerivMean(d,M,s) for Re s>1.
Partial summation gives the same singular term plus
s integral_1^infty E_M(v)v^(-s-1)dv. Subtract BEFORE taking s down to 1.
The integrable PNT majorant identifies the constant as Re logDerivMean(1),
so R_M(y)=-integral_y^infty E_M(v)v^-2 dv. No arbitrary additive offset.
This verifies the exact normalization in PrimeError. At D.x1 with
log x1=x^(epsilon/6), the error is smaller than every fixed inverse
power of x; this follows because x^(epsilon/12)/log x tends to infinity.
For the same D, f=#tops*phi(M), #tops/#thick<=x^epsilon, m>=sqrt x.
Divide star by m*a*#thick (all positive) to get
R_M(x)<=phi(M)x^(6epsilon-1/2)+o(x^-1). Hence eventually
R_M(x)<=x^(8epsilon-1/2). This uses the original D, not a reselected
second scale, and fixes epsilon and d before the threshold.

(3) Absolute convergence for Re s>2 justifies integrating the ramp.
The integral from n to infinity of (1/n-1/x)x^-s dx is
n^-s/[s(s-1)]. After cancellation of the log and constant terms,
Phi(s)=(logDerivMean(s)/s-K)/(s-1), K=Re logDerivMean(1).
Conjugate pairing (real quadratic character) makes logDerivMean real
at 1 by continuation. Therefore 1 is removable, not a residual pole.
At z with Re z>0, z!=1, put
A(z)=sum_xi ord_z entireL(xi),
B_d(z)=sum_xi ord_z entireL(xi*chi_d).
Both are nonnegative integers, no negative zero orders. The exact
signed residue is
        r(z)=(A(z)-B_d(z))/(phi(M)*z*(1-z)).
This matches isPolar_primeError; note the minus sign and the factor
1-z rather than z-1. The standard zero-free line supplies no poles
for Re z>=1.

(4) The archive density proof matches ZeroFreeTwist:
primitive conductor h*d (coprime factors), imprimitive Euler factors
nonzero for Re z>0, parity fixed for d=7 mod 8. The two theta coefficient
sequences are psi(n) and mu(n)*psi(n), POINTWISE products.
Reciprocity includes the principal factor at 2. Square-sector double
sum uses k=1 or 2 and k*n=a*b^2, m=a*u^2; the majorant is a product of
three convergent zeta sums at 1+2eta. The nonsquare-sector PV bound
gives t^(-3-2eta) times a convergent double sum, and t>=1/T absorbs
t^-2<=T^2. Cauchy–Schwarz and integration give O(T^(2+eta)).
The theta transform t -> 1/(q*t) preserves the absolute integral
with dt/sqrt(t), since the prefactor is 1/(sqrt(q)*t).
The mollified analytic function has bounds O(T^(4eta)) at sigma=1/2
and O(1/T) at sigma=2; three-lines gives O(T^(-2eta)) at
sigma>=1/2+9eta. The Mellin gamma factor is nonzero and bounded
below on the fixed compact rectangle. Hence at most
O(X^(1-eta/2)) primes are bad for each fixed xi, taking T=sqrt(hX).
Pick eta with 0<9eta<min(1,beta-1/2); finite union over xi mod M and
ordinary fixed-modulus PNT in class a yield one d good at all real
z>=beta and at rho. No GRH premise, no growing M, no reliance on
Dirichlet infinitude alone to beat the exceptional count.

(5) Exact weakened sufficient caller, keeping the same d:
For real beta<u<1 it suffices that A(u)>=B_d(u); and at rho it
suffices that A(rho)!=B_d(rho). Complete twisted nonvanishing on the
whole half-strip is stronger than needed at this caller. The actual
density theorem supplies the stronger conditions B_d(u)=B_d(rho)=0;
A(rho)>0 because the induced principal L-function is zeta times
Euler factors nonzero for Re rho>0, and rho!=1. Thus r(u)>=0 for all
real u>beta, including u>=1 where r=0; and r(rho)!=0.

Independent human Landau audit: take E(v)=R_M(exp v), bounded by
O(exp v) on v>=0, and choose K0>=1 large enough on the finite initial
interval so that W(v)=K0 exp(beta v)-E(v)exp(v)>=0 everywhere.
Its Laplace transform Psi(s)=K0/(s-beta)-Phi(s) initially agrees
for Re s>2. Let alpha be its real abscissa of convergence (possibly
minus infinity). If alpha>beta, Psi has at most a simple pole there
with real residue -r(alpha)<=0. It cannot have strictly negative
residue, because its real values to the right are nonnegative.
If the residue is zero it is analytic at alpha. Choose a disk of
radius delta>0 about alpha on which this continuation is holomorphic,
c=alpha+delta/4, and h=delta/2. Taylor at c converges at c-h<alpha,
since the disk centered at c of radius 3delta/4 is inside the
original disk. The Taylor terms after substituting c-h are exactly
the nonnegative moments integral W(v)exp(-cv)(hv)^j/j! dv
(differentiation dominated using a real point between alpha and c).
Monotone convergence then gives finite integral at c-h, contradicting
the abscissa. Hence alpha<=beta; Psi is holomorphic in Re s>beta,
and its meromorphic continuation agrees there. In particular r(rho)=0,
contradicting the nonzero residue. Reflection gives RH conditional on
star and the audited D1/analytic suppliers. This proves the same
implication as the native caller without the auxiliary moment machinery.

Failed-route guard (exact analytic counterexample, not a numerical test):
one cannot drop the real-residue premise and keep only the target
nonreal residue. For beta<a<1 and t>0, set
E(v)=exp((a-1)*v)(-2+cos(t*v)).
E(v)<=0<=exp((beta-1)*v) for v>=0, but
Phi(s)=-2/(s-a)+1/(2(s-a-it))+1/(2(s-a+it)).
Its nonreal poles are right of beta and its negative real residue
is -2. The real-sign condition is therefore essential. Likewise a
one-sided bound at only a cofinal sequence of scales is not the
eventual bound used by Landau; no replacement by sampled windows made.

Verification: human source comparison and exact analytic counterexample.
No local lean/lake executable; native engines not run in this environment.
Old-pin CI receipts re-fetched: 45577239749 blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and 45576756833 blob
7da354941e402b6f8b364ed03d8c5c82d27b7717; old-pin results only.
Compact targeted_results blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six original named declarations checked (standard three axioms),
JetExponentBound module build exit 124, full_RH_replay=false.
No new native PASS, root retirement or proof coverage percentage.
Prepared source-typed adapter below reuses native polar theorem and Landau
rather than importing New.grh. It isolates the exact weaker signed numerator
premise and leaves the density and eventual star-derived bound explicit.
No synthetic scalar test, no proof of RH. Preserve original/reduced graphs.

RESUME HERE: at B4 connect the checked original
Filling.Fits.exists_translate_finrank_comap_le to
Data.ramifiedColumns_fill_rows using the actual ramifyingOp range and
positive row dimension, retaining B1–B3 quantitative inputs; do not
repeat D1/E1 reconstruction absent a specific discrepancy.
HANDOFF TO integration/audit/shared native runner: replay D1 field and
full witness, and this E1 signed-residue adapter under the compact pin.
-/

open Complex Filter Nat Real DirichletCharacter

namespace RHProofEditorSignedResidue

noncomputable def orderDifference (M d : ℕ) [NeZero M] [Fact d.Prime] (z : ℂ) : ℂ :=
  ∑ ξ : DirichletCharacter ℂ M,
    (analyticOrderNatAt (@entireL M _ ξ) z -
      analyticOrderNatAt (entireL (quadTwist ξ d)) z : ℂ)

noncomputable def residue (M d : ℕ) [NeZero M] [Fact d.Prime] (z : ℂ) : ℂ :=
  orderDifference M d z / (Nat.totient M : ℂ) / (z * (1 - z))

/-- Actual polar caller, with the real sign and target nonzero numerator
rather than all-character twisted nonvanishing as its retained inputs. -/
lemma signed_residue_contradiction {M d : ℕ} [NeZero M] [Fact d.Prime]
    (hd : d % 8 = 7) (hc : M.Coprime d) {β : ℝ} (hβ : 0 < β)
    (hreal : ∀ u : ℝ, β < u → 0 ≤ (residue M d (u : ℂ)).re)
    (hw : ∀ᶠ v in atTop, primeError d M (Real.exp v) ≤ Real.exp ((β - 1) * v))
    {ρ : ℂ} (hρ : β < ρ.re) (hφ : (Nat.totient M : ℂ) ≠ 0)
    (h0 : ρ ≠ 0) (h1 : 1 - ρ ≠ 0)
    (horder : orderDifference M d ρ ≠ 0) : False := by
  have hp : IsPolar (primeError d M ·.exp) (residue M d) := by
    simpa [residue, orderDifference] using (isPolar_primeError (M := M) (d := d) hd hc)
  have hz : residue M d ρ = 0 := hp.landau hβ hreal hw hρ
  exact (div_ne_zero (div_ne_zero horder hφ) (mul_ne_zero h0 h1)) hz

#print axioms signed_residue_contradiction

end RHProofEditorSignedResidue
