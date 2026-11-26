import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.landauWindow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN46, 26 November 2026, lane 3. HUMAN SOURCE-MATCHED negative control
and exact cancellation; PREPARED Lean scalar bridge, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine;
AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/log/protocol consulted.
Latest peers 054230d9 (catalogue max exponent), 2355b4d2 (rank-three),
74ad2c13 (common Frobenius), 3463c301 (rank-two), 11e35a8b (signed budget).
No uncompiled peer overlay. Prior RUN45 blob f8004fe64822caa0cfb987ebbf15a849954df02d,
commit 31ac8a222444fc2e660ad5f2d8f9d4c72b969a16 preserved.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed
upstream de330e73d828ea08f621cb28395d48480806d00f, not adopted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Source relative to src/Development/AutomorphicArithmetic/DedekindLFunctions:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 (G);
LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a
(landau_window_contra, landau_window_key, landau_window);
LandauTheorems/landauWindowIneq.lean cda93b0185260d72395d2ef2c90314e0fa7128ef
(landau_window_ineq); LandauTheorems/landauTails.lean
0e55797bac5320acf02d9acc832ca53df716e436 (landau_tails).
ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002.
No direct import of claimed RH. Search hyperbola/Mellin Mobius/pole
found no exact duplicate; no general novelty claim.

## Result: separate RH-scale bounds on RUN45 small-divisor contribution
are IMPOSSIBLE even on arbitrarily distant multiplicative windows.
The joint cancellation is not just a numerical observation.

Use RUN45 definitions (all real x>=1). S(x)=small polynomial sum minus
main term, L(x)=large-divisor signed K sum, G=S+L+O(sqrt x).
Set D=sqrt x, A_j(D)=sum_(d<=D) mu(d)(log d)^j/d, a=1+gamma_1.
Floors are implicit in finite sums; no integer restriction on D.
F(D)=S(D^2)/D^2 =
 (2 log^2 D-2 log D+a)A_0+(1-2 log D)A_1+A_2/2-2 log D+1+gamma.
For Re(s)>0 let H(s)=1/zeta(1+s). Absolute convergence gives
 Mellin(A_j)(s)=(-1)^j H^(j)(s)/s
with Mellin(f)=int_1^infty f(D) D^(-s-1)dD.
Multiplication by log D is -d/ds (dominated differentiation on compact
right half-plane subregions). Algebra before norms yields exactly:
 M(s)=Mellin(F)(s)=
 H''/(2s)+(1/s-2/s^2)H'+(a/s-2/s^2+4/s^3)H
 -2/s^2+(1+gamma)/s.
H=s-gamma*s^2+O(s^3) makes s=0 removable, by exact cancellation
of s^-2 and s^-1 terms. On real s>-1 there are no other poles:
zeta(t) !=0 for real t>0, t!=1 by Euler product and alternating eta.
For ANY nontrivial zeta zero rho of multiplicity m, let s0=rho-1
and H(s)=b(s-s0)^(-m)+lower principal terms, b!=0.
M has EXACT pole order m+2 at s0, since its leading coefficient is
 b*m*(m+1)/(2*s0) !=0; all other terms have lower order.
Thus the Mellin transform of S in x, Phi_S(w)=2*M(2w-2),
has a pole of order m+2 at w0=(1+rho)/2.
Hardy's unconditional theorem supplies a rho with Re(rho)=1/2,
hence a pole at Re(w0)=3/4. Reference DLMF 25.10,
https://dlmf.nist.gov/25.10 (critical-line sign changes).
No RH assumption, no simple-zero assumption, no finite-to-infinite inference.

### The exact cancellation with the other half
Direct integration of native G ramp, for Re(w)>1:
 Phi_G(w)=-zeta'(w)/(zeta(w)*w*(w-1))
           -1/(w-1)^2+(1+gamma)/(w-1).
Interchange absolute sum and integral (Lambda(n)<=log n) and integrate
(x/n-1) on [n,infty): n^(-w)/(w*(w-1)). At w=1 its
two Laurent terms cancel; at any nontrivial zero it has at most a
simple pole. RUN45 proves G-S-L=O(sqrt x) without RH, so its Mellin
transform is holomorphic on Re(w)>1/2. By analytic continuation,
Phi_L and Phi_S cancel ALL principal parts of order >=2 in that
half-plane, including the order m+2 pole at w0. Even if w0 itself is
another zeta zero, Phi_G has at most a simple pole there.
This is exact forced joint cancellation, not a proof of the remaining
simple-pole exclusion (the actual RH obstruction).

### Strong negative control at the actual native window quantifiers
For either sign tau in {+1,-1}, ANY 1/2<theta<3/4, C>=0, delta>0,
there cannot be arbitrarily large Y with
 tau*S(x)<=C*x^theta for all x in [Y,Y^(1+delta)].
Proof (human adaptation of native Landau, not a direct application of
PoleData: its pole field assumes simple poles, which is FALSE here).
Set g(u)=tau*S(exp u), u>=0. It is measurable and
|g(u)|<=C0 exp(2u): A_j(D)=O(1+log^(j+1) D) by absolute sums,
hence S(x)=O(x(1+log^3 x)). Extend g by zero for negative u.
Its Laplace transform on Re(w)>2 is tau*Phi_S(w).
The assumed windows give R(u)=C exp(theta u), U=log Y,
V=(1+delta)U; integral R exp(-theta u)=C delta U<=exp(eta U)
for arbitrary eta>0 and sufficiently large U. Apply the actual native
landau_tails and landau_window_ineq (neither requires simple poles).
Differentiating the Laplace transform under the integral yields for
some fixed sigma>2 and C1, for every eta>0 and U0 there are U>=U0,
integer k>=U, such that for every real t,
 |a_k(sigma+it)|+Re a_k(sigma)
 <= C1 exp(eta U)/(sigma-theta)^k,
 a_k(z)=(-1)^k Phi^(k)(z)/k!, Phi=tau*Phi_S.
This is the same inequality as landau_window_key, but derived
from its pole-independent inputs rather than its PoleData argument.

All poles in Re(w)>1/2 are discrete, nonreal, Re(w)<=1, and one has
Re(w)=3/4>theta. Choose a vertical center z=sigma+it whose unique
nearest pole p has d=|z-p|<min(sigma-theta,D0), where D0 is distance
from real sigma to the poles in Re(w)>1/2 (infinity if none).
If D0>=sigma-theta, align with a pole of real part 3/4.
If D0<sigma-theta, align with a pole attaining D0: its horizontal
distance is strictly smaller because its imaginary part is nonzero.
A sufficiently small perturbation of t preserves strict inequalities
and avoids the finitely many pairwise distance ties in a bounded
candidate ball (equal imaginary part and equal distance would force
equal real part since all poles are left of sigma). Discreteness and
compactness hold inside Re(w)>1/2. Choose e>d below the next pole
distance, D0, and sigma-theta. The disks of radius e stay in
Re(w)>1/2. At sigma, Cauchy gives |a_k(sigma)|<=M1/e^k.
At z, subtract the full finite principal part at p and use Cauchy
on radius e. For order r=m+2 (or any positive r), the leading
principal coefficient contributes
 b_r*binom(k+r-1,r-1)/(z-p)^(k+r);
lower pole terms have polynomial degree <=r-2 in k times d^-k,
analytic remainder O(e^-k). Reverse triangle inequality gives
 |a_k(z)|>=c/d^k for all sufficiently large k, c>0.
Hence c/d^k <= M1/e^k+C1 exp(eta U)/(sigma-theta)^k.
Choose U0 beyond the coefficient threshold and invoke exactly native
landau_window_contra with E=sigma-theta. Contradiction.
This argument excludes BOTH one-sided independent S bounds on the
native long windows. It does NOT exclude the joint bound S+L (indeed
the artificial high-order poles cancel), nor the use of correlated
one-sided estimates with nontrivial cancellation. It provides no
bound on actual off-critical-line zeros. No new global RH criterion
proposed. Stop trying to separately bound S and L at RH scale.

## Executed checks
Local CPython/SymPy: exact rational-function expansion identity,
Laurent at zero constant a+b for H=s-gamma*s^2+b*s^3,
20 exact pole-order/leading-coefficient identities m=1..20. Exit 0.
Local real-prime regression: sieve N=4,000,000, 283146 primes,
283539 prime powers, 1999 square-cutoff samples D=2..2000.
S/sqrt x range [-283.0633610800622,303.87773090284844];
G/sqrt x range [-0.019405815498367677,0.9115182459546087].
At x=4,000,000 S=289879.29570184124, G=8.085666121914983.
Finite floating-point sample, not proof of the obstruction.
Reproduction Python (executed; unused imports omitted):
import sympy as Q
s,a,g=Q.symbols('s a g'); H=Q.Function('H')(s)
E=2*Q.diff(H/s,s,2)+2*Q.diff(H/s,s)+a*H/s-H.diff(s)/s-2*Q.diff(H.diff(s)/s,s)+H.diff(s,2)/(2*s)-2/s**2+(1+g)/s
R=H.diff(s,2)/(2*s)+(1/s-2/s**2)*H.diff(s)+(a/s-2/s**2+4/s**3)*H-2/s**2+(1+g)/s
assert Q.simplify(E-R)==0
b=Q.symbols('b');print(Q.series(R.subs(H,s-g*s**2+b*s**3).doit(),s,0,1))
B,z=Q.symbols('B z',nonzero=True)
for m in range(1,21):
 f=R.subs(H,B/(s-z)**m).doit()
 assert Q.simplify(Q.limit((s-z)**(m+2)*f,s,z)-B*m*(m+1)/(2*z))==0
import numpy as np, math, mpmath as mp
N=4000000; D=math.isqrt(N); p=np.ones(N+1,dtype=bool);p[:2]=0
for q in range(2,D+1):
 if p[q]:p[q*q::q]=0
pr=np.flatnonzero(p);mu=np.ones(D+1,dtype=np.int8);mu[0]=0;lam=np.zeros(N+1)
for q0 in pr:
 q=int(q0);j=q
 while j<=N:lam[j]=math.log(q);j*=q
 if q<=D:
  mu[q::q]*=-1
  if q*q<=D:mu[q*q::q*q]=0
n=np.arange(D+1,dtype=float);ln=np.log(np.maximum(n,1))
A=[np.cumsum(mu*ln**j/np.maximum(n,1)) for j in range(3)]
w=np.cumsum(lam/np.maximum(np.arange(N+1),1));l=np.cumsum(lam)
g=float(mp.euler);a=1+float(mp.stieltjes(1));d=np.arange(2,D+1);x=d.astype(float)**2;L=np.log(d)
S=x*((2*L**2-2*L+a)*A[0][d]+(1-2*L)*A[1][d]+.5*A[2][d]-2*L+1+g)
G=x*w[d*d]-l[d*d]-x*np.log(x)+(1+g)*x
print(len(pr),np.count_nonzero(lam),len(d),np.min(S/d),np.max(S/d),np.min(G/d),np.max(G/d),S[-1],G[-1])
End reproduction.

## Dependency ledger
Original root route unchanged: Gm(singleton) -> windowHyp_of_rpow ->
lemmaL -> zeroFree_of_rpow_window -> RH half-strip. RUN45 candidate
producer S+L and error preserved; separate S-bound branch is rejected
by the proved human obstruction. New negative-control route:
S -> exact Mellin identity -> Hardy pole -> native landau_tails +
landau_window_ineq -> higher-pole Cauchy asymptotics ->
landau_window_contra. This is not a new proof of original RH leaf.
Source-visible edges only; no original or reduced kernel graph edited.
Context key includes source/toolchain, actual native G, cutoff sqrt x,
gamma_1 sign, theta, delta, tau, pole multiplicity, same window.
No URT advantage established. Backtrack to canonical G and same-host
native producer; do not spend runs on separate S estimates.
Lean/lake not installed in local container (command -v both empty).
Actual GitHub Actions jobs retrieved for 45577239749 and 45576756833:
pick, run (named reduction job), record each success. These are
historical baseline only, NOT new proof replay. No new axiom evidence.
Following Lean certificate is only algebra + native scalar contradiction
bridge; full Mellin, Hardy and Cauchy suppliers still need formalization.
RESUME HERE: independently audit the higher-pole window proof and exact
cancellation with Phi_G, replay the scalar certificate using existing
pinned runner, then return to actual same-host uniform arithmetic
supplier rather than another hyperbola re-expression. The remaining
joint discrepancy is OPEN. HANDOFF TO math, Landau, formal audit,
kernel extractor and integration. No closure of CountI/II/V/Vs etc.
-/

namespace RHPrimeWindow46

theorem mellin_collect (s a g h0 h1 h2 : ℂ) (hs : s ≠ 0) :
    2 * (h2/s - 2*h1/s^2 + 2*h0/s^3) +
      2*(h1/s-h0/s^2) + a*h0/s - h1/s -
      2*(h2/s-h1/s^2) + h2/(2*s) - 2/s^2 + (1+g)/s =
    h2/(2*s) + (1/s-2/s^2)*h1 +
      (a/s-2/s^2+4/s^3)*h0 - 2/s^2 + (1+g)/s := by
  field_simp [hs] <;> ring

theorem higher_pole_window_contra
    {c d e E M C : ℝ} (hc : 0 < c) (hd : 0 < d)
    (hde : d < e) (heE : e ≤ E) (k0 : ℕ) (A B : ℕ → ℝ)
    (hlo : ∀ k ≥ k0, c/d^k ≤ A k)
    (hhi : ∀ k ≥ k0, B k ≤ M/e^k)
    (hw : ∀ η : ℝ, 0 < η → ∀ U₀ : ℝ, ∃ U : ℝ, U₀ ≤ U ∧
      ∃ k : ℕ, U ≤ k ∧ A k ≤ B k + C * Real.exp (η*U)/E^k) : False := by
  apply Deduction.landau_window_contra (M := M) (C := C) hc hd hde heE
  intro η hη U₀
  obtain ⟨U,hU,k,hk,hb⟩ := hw η hη (max U₀ (k0:ℝ))
  have hk0r : (k0:ℝ) ≤ (k:ℝ) := (le_max_right _ _).trans (hU.trans hk)
  have hk0 : k0 ≤ k := by exact_mod_cast hk0r
  refine ⟨U,(le_max_left _ _).trans hU,k,hk,?_⟩
  linarith [hlo k hk0,hhi k hk0]

end RHPrimeWindow46

rh_prune RHPrimeWindow46.mellin_collect
rh_prune RHPrimeWindow46.higher_pole_window_contra
rh_scan Deduction.landau_window_ineq limit 2000
rh_scan Deduction.landau_window_contra limit 2000
rh_scan RHPrimeWindow46.higher_pole_window_contra limit 2000
#print axioms RHPrimeWindow46.mellin_collect
#print axioms RHPrimeWindow46.higher_pole_window_contra
