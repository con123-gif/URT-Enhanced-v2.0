# Prime-window translator — run 1 — 2026-11-24

RESULT: SOURCE-MATCHED / hand-derived exact window bridge; independent finite regression checks executed locally. RH project OPEN. No Lean elaboration or kernel verification. The source theorem is conditional; do not confuse the proof of the implication with the proof of its antecedent.

## Continuity and version lock
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, research log/protocol, continuity, and the dependency, acceleration and kernel-extractor run-1 checkpoints. No prime_window lane file existed at preflight. Prior protocol already mentions a WindowHypOfRpow excerpt translation; this run extends it with exact pinned declarations, complete Gm expansion, explicit threshold, change-of-variable proof and executable regression cases. It does not duplicate the Landau pole/analytic-continuation lane. Existing physical CI verdict: PASS at 07:05 UTC for commit 9aa5afb, run 45342893347, unrelated to this result.

Upstream source repository: https://github.com/leanprover-community/riemann-hypothesis
PIN = 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest upstream observed 343b1de38bbe4c5c66f1c1c0afd7c34e8645acdf (2026-11-24 06:57:31 UTC); its CharFamily and LandauZeroFreeCriterion files have changed blobs cac521ab291c9dab261508613d4d12195cdfb799 and f4c5124f8a0188f85b60b2687864d531f9c0a3d8. Old paths for WindowHypOfRpow, WindowHypUOfWindowHyp and ZeroFreeOfRpowWindow returned HTTP 404 at latest revision. Do not assume the declarations were deleted rather than relocated. Keep revision-specific graphs separate.

All paths below relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/ at PIN. GitHub-reported blob hashes and source line spans:

| File | Blob SHA | Exact declaration / lines |
| --- | --- | --- |
| CharFamily.lean | 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 | Deduction.ramp 10–11; Gchi 15–19; G 21–22; CharFamily 24–32; Gm 36; ZeroFree 38–39; WindowHyp 41–45 |
| LandauZeroFreeCriterion.lean | 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 | gm 9; zeroSet 11–13; PoleData 15–23; WindowHypU 25–29 |
| LandauTheorems/WindowHypOfRpow.lean | dde1c159371538875c28374574ca7e452b0450d9 | windowHyp_of_rpow_eventually 9–25; windowHyp_of_rpow 27–57 |
| LandauTheorems/WindowHypUOfWindowHyp.lean | 701f0502ae106ab89e390105cd9c98e6cf881e1a | image lemma 9–19; fun lemma 21–27; windowHypU_of_windowHyp 29–56 |
| LandauTheorems/ZeroFreeOfRpowWindow.lean | 2ed00ad3aa862f3e522686557fb8f559b17fc002 | zeroFree_of_rpow_window 11–14 |
| LandauTheorems/lemmaL.lean | 6c37aebd05121b6d68e3532d8529f0ce8357386f | lemmaL 13–22 |

To reproduce source inspection, use git show PIN:src/Development/AutomorphicArithmetic/DedekindLFunctions/<file> | nl -ba, and git rev-parse PIN:<full-path>. Source read via connector, not local git checkout; SHA identities reported by connector, not independently rehashed.

## 1. The arithmetic object: exact expansion of Gm

Fix a finite index type I, positive integer modulus N_i for each i, a complex Dirichlet character chi_i mod N_i, and positive real coefficients a_i. Admissibility: for each i, either N_i=1 or chi_i is not the identity character. No common modulus or normalization sum a_i=1 is required.

For real y>=1 and complex f on natural numbers, define
  ramp(f,y) = sum_{p prime} sum_{k>=1, p^k<=y} log(p) f(p^k) (y/p^k - 1).
This is the finite Lean sum over n in range(floor_nat(y)+1), with von Mangoldt Lambda(n) and max(y/n-1,0). Only prime powers survive because Lambda(0)=Lambda(1)=0 and Lambda(p^k)=log p. All other terms vanish. A prime power precisely at y contributes zero. For n>=2 in the finite sum n<=y, the maximum equals y/n-1. The n=0 term in Lean uses totalized division and is zero because Lambda(0)=0; the displayed analytic rewriting never divides by zero. The definition is for all real y; the expansion here is stated only in the positive range relevant to the proof.

For the identity character chi=1, the source defines
  Gchi(chi,y) = ramp(chi,y) - y log y + (1+gamma_E)y.
For chi!=1,
  Gchi(chi,y) = ramp(chi,y) + y L'(1,chi)/L(1,chi).
gamma_E is the Euler–Mascheroni constant, not Cathedral granularity. The plus sign in front of L'/L is essential. The definition uses total Lean field division; this chapter does not establish L(1,chi)!=0. That is a separate analytic obligation when interpreting the ratio.

G(y) is the real part of ramp(1,y) with the same two trivial-character correction terms; Gm(F,y) = sum_i a_i Re Gchi(chi_i,y).
Equivalently let I0={i:chi_i=1}, I1=I minus I0, A0=sum_{i in I0}a_i. Then for y>=1:
  Gm(F,y) =
    sum_{p^k<=y} log(p)(y/p^k-1) sum_i a_i Re chi_i(p^k)
    - A0 y log y + A0(1+gamma_E)y
    + y sum_{i in I1} a_i Re(L'(1,chi_i)/L(1,chi_i)).
The equality follows by exchanging finite sums, real linearity of Re and real a_i. A0 need not be positive if I0 is empty. Gm is real, not necessarily nonnegative. Neither an absolute-value bound nor a lower bound for Gm is required in the window theorem. No primes are generated or controlled by URT in this identity.

## 2. The actual quantifier scopes

WindowHyp(F,theta,delta) means:
  for EVERY real eta>0 and EVERY real Y0,
    there EXISTS real Y>=Y0 and a function R:R->R such that, on I=[Y,Y^(1+delta)],
    (i) R(y)*y^(-theta-1) is Lebesgue integrable on I;
    (ii) at EVERY y in I, 0<=R(y) and Gm(F,y)<=R(y);
    (iii) integral_I R(y)*y^(-theta-1) dy <= Y^eta.

No positivity of Y, theta or delta is baked into this definition. For the theorem below, delta>0 and the constructed witness Y>=1. The pointwise conditions are not merely almost-everywhere conditions. The upper bound is one-sided; do not replace it by |Gm|. R may depend on eta and Y0, though our formula works on each chosen interval.

The hypothesis h in windowHyp_of_rpow (fixed F,theta,delta,C, with delta>0) is
  for EVERY real Y0, there EXISTS real Y>=Y0 such that
    for EVERY y in [Y,Y^(1+delta)], Gm(F,y)<=C*y^theta.
C and delta are fixed BEFORE Y0 and eta are quantified. The windows need only occur arbitrarily far out, not for every sufficiently large Y, and not just at individual y. No assumption C>=0; no restriction 0<theta<1 at this particular implication. Those restrictions enter later in lemmaL.

## 3. Full elementary proof, with explicit threshold

Source windowHyp_of_rpow_eventually uses a=eta/2>0, eventual growth of Y^a, and log Y<=Y^a/a for positive Y.
An equivalent explicit witness (derived here, not claimed to be the literal Lean witness) for K>=0 is
  Y1 = max(1,(K/a)^(1/a)) .
For K=0 use Y1=1. For y>=Y1, y^a>=K/a. For y>=1, the integral of 1/t over [1,y] is at most the integral of t^(a-1), so log y <= (y^a-1)/a <= y^a/a. Consequently
  K log y <= (K/a)y^a <= y^(2a)=y^eta.
This proves the threshold lemma for every eta>0 and K>=0, including K=0.

Now fix arbitrary eta>0 and Y0. Set K=|C| delta >=0 and take the threshold above. Apply h at max(Y0,Y1). This produces a witness Y at least both numbers, and therefore Y>=1>0. Since delta>0 and base Y>=1, B=Y^(1+delta)>=Y. For all y in I=[Y,B], y>0.

Define R(y)=|C| y^theta for all real y (using Lean's real power convention outside the interval). Within I it is nonnegative. Since C<=|C| and y^theta>=0,
  Gm(F,y)<=C y^theta<=R(y).
For every y in I,
  R(y)y^(-theta-1) = |C| y^(theta-theta-1) = |C|/y.
The cancellation is justified by y>0, including for negative theta. This last function is continuous on the compact interval I and therefore integrable. The pointwise identity gives integrability of the requested weighted function; no integrability premise for Gm is needed.

Since B>=Y>0, equality of closed-interval and ordinary interval integrals (endpoints have measure zero) gives
  integral_I R(y)y^(-theta-1)dy
  = |C| integral_Y^B dy/y
  = |C| (log B - log Y)
  = |C| ((1+delta)log Y-log Y)
  = |C| delta log Y
  <= Y^eta.
The degenerate case Y=1 gives integral zero. This discharges (i),(ii),(iii) for the chosen Y,R, with Y>=Y0. Since eta,Y0 were arbitrary, WindowHyp holds. This matches source lines 27–57, with no additional hypothesis. The crucial exact identity is independent of theta.

## 4. Logarithmic coordinate bridge (source-matched)

Define gm(F,u)=Gm(F,exp u). The target WindowHypU(g,theta,delta) is: for all eta>0 and real U0, there exist U>=U0 and Q:R->R with integrability of Q(u)exp(-theta u) on J=[U,(1+delta)U], 0<=Q(u) and g(u)<=Q(u) at every u in J, and weighted integral <=exp(eta U).

Fix eta,U0. Apply WindowHyp with Y0=exp U0, not U0, to obtain Y>=exp U0>0 and R with all three conditions. Put U=log Y, Q(u)=R(exp u). Then U>=U0 by monotonicity. Exponential is strictly increasing, injective and differentiable with derivative exp u. It maps J bijectively to I=[Y,Y^(1+delta)] since exp((1+delta)log Y)=Y^(1+delta). This image identity holds also for empty or singleton intervals; do not add U>=0 to the source theorem. (For negative U and delta>0 both intervals are empty.) In the composite with section 3, U>=0 automatically.

The integrand transforms by the absolute Jacobian:
  |exp u| R(exp u) (exp u)^(-theta-1)
  = Q(u) exp(-theta u).
The source uses integrableOn_image_iff_integrableOn_abs_deriv_smul and integral_image_eq_integral_abs_deriv_smul on measurable Icc, with derivative and injectivity conditions. Thus integrability transfers, the pointwise inequalities transfer by exp(u) in I, and
  integral_J Q(u) exp(-theta u) du
  = integral_I R(y)y^(-theta-1)dy
  <= Y^eta = exp(eta U).
This proves WindowHypU(gm(F),theta,delta), preserving every quantifier. Section 3 alone is not a zero-free proof.

## 5. Interface to the next lane

zeroFree_of_rpow_window adds 0<theta<1 and delta>0 to h. It applies lemmaL F htheta htheta1 hdelta (windowHyp_of_rpow F hdelta h).
ZeroFree F theta means for every i and complex s with theta<Re(s), L(s,chi_i)!=0. No claim about equality Re(s)=theta. In lemmaL, source 15–22, poleData F and landau_window are invoked after the log bridge, with Re(s)>=1 handled by charFamily_LFunction_ne_zero_of_one_le_re, and Re(s)<1 handled by membership of the alleged zero s in zeroSet and the bound from landau_window. These dependencies are deliberately not declared reconstructed in this chapter. The definition of ZeroFree includes the source's Lean LFunction conventions at the trivial-character pole; that boundary is the separate Landau lane's responsibility.

Logical boundary: existence of arbitrarily distant windows satisfying h is the hard upstream arithmetic premise; neither the cancellation nor this chapter proves it. No numerical finite prime data can establish it. No URT-specific acceleration result is asserted. No assumptions dropped or added in the source implications; the explicit threshold formula is an explanatory witness derived under the source hypotheses.

## 6. Executed regression certificate

Executed in local Python 3 sandbox, not Lean. Exact rational coefficient checks compare prime-power enumeration against integer-factorization-based von Mangoldt support (formal log(p) coefficient vectors; no numerical log needed). Floating point checks test the explicit threshold and the weight/Jacobian identities in selected cases. They are not universal proof substitutes.

Copy this block to a temporary Python file and run python3 <file>.

~~~python
from collections import defaultdict
from fractions import Fraction as Q
from math import isclose, log, exp

def prime_base(n):
    if n < 2: return None
    p = next((d for d in range(2, n) if n % d == 0), n)
    while n % p == 0: n //= p
    return p if n == 1 else None

def char4(n):
    return 0 if n % 2 == 0 else (1 if n % 4 == 1 else -1)

def direct(y, f):
    a = defaultdict(Q)
    for n in range(2, int(y)+1):
        p = prime_base(n)
        if p is not None: a[p] += f(n)*max(y/n-1, Q(0))
    return {p:v for p,v in a.items() if v}

def powers(y, f):
    a = defaultdict(Q)
    for p in range(2, int(y)+1):
        if any(p%d == 0 for d in range(2,p)): continue
        n = p
        while n <= y:
            a[p] += f(n)*(y/n-1)
            n *= p
    return {p:v for p,v in a.items() if v}

n_ramp=0
for k in range(2,201):
    for f in (lambda n:1, char4, lambda n: 1+2*char4(n)):
        y=Q(k,2)
        assert direct(y,f)==powers(y,f), (y,f)
        n_ramp+=1

n_bound=0
for K in (0,0.125,1,2,10):
    for eta in (0.25,0.5,1,2,4):
        a=eta/2
        L0=max(0,log(K/a)/a) if K else 0
        for L in (L0,L0+0.125,L0+1,L0+4):
            assert K*L <= exp(eta*L)*(1+1e-12)
            n_bound+=1

n_weight=0
for C in (-3,0,2):
    for theta in (-2,-0.5,0,0.5,2):
        for y in (1,1.5,2,10,100):
            R=abs(C)*y**theta
            assert isclose(R*y**(-theta-1),abs(C)/y,rel_tol=1e-12,abs_tol=1e-12)
            u=log(y)
            assert isclose(y*(R*y**(-theta-1)),R*exp(-theta*u),rel_tol=1e-12,abs_tol=1e-12)
            n_weight+=1

print(f'Exact prime-power coefficient checks: {n_ramp}')
print(f'Floating-point threshold checks: {n_bound}')
print(f'Floating-point weight/Jacobian checks: {n_weight} (two identities each)')
print('All checks passed. No Gm window existence, Lean elaboration, or RH verification tested.')
~~~

Actual stdout:
~~~
Exact prime-power coefficient checks: 597
Floating-point threshold checks: 100
Floating-point weight/Jacobian checks: 75 (two identities each)
All checks passed. No Gm window existence, Lean elaboration, or RH verification tested.
~~~

No lean/lake executable found. No new CI verdict or kernel graph. The test uses real characters for small finite coefficient vectors and does not evaluate L'/L(1), gamma_E or the full Gm function. The proof of finite-sum rearrangement itself permits complex characters. Complexity of this intentionally small test's trial-division implementation is not a claimed production O(N) method.

## 7. Independent audit request and handoff

Audit lane: independently check quantifier order, fixed C/delta, sign of correction terms and one-sided Gm bound, y>0 justification, closed vs interval integrals, theta restrictions only in lemmaL, and handling of negative U/empty intervals. Compare exact original pinned declarations and Mathlib lemmas; check kernel references when available. Do not certify the harder h or PoleData from this chapter.

Metrics: 6 original source files inspected; 4 principal bridge theorems source-matched (threshold, power-to-window, window-to-log, wrapper; wrapper only mapped), 2 auxiliary change-of-variable identities translated; 772 finite regression cases (597 exact, 175 floating-point cases), zero kernel claims, zero dropped hypotheses, no full-corpus complexity or URT benchmark. Full proof coverage denominator unknown.

RESUME HERE: Locate all direct pinned-source call sites of Deduction.zeroFree_of_rpow_window and Deduction.windowHyp_of_rpow in the AutomorphicArithmetic subtree, identify the particular upstream declaration establishing the arbitrarily distant uniform Gm window h, and reconstruct its exact quantifier flow into this bridge. Keep distinct from the Landau lane's downstream pole theorem. Do not substitute an assumed power bound for the missing witness-producing proof.
HANDOFF TO: landau-criterion, formal audit, integration, human proof editor and character-box lanes.
