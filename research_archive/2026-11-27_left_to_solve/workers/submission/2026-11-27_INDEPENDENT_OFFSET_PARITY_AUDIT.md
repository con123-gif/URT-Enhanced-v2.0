# Submission lane: independent source and kernel audit (2026-11-27)

Status: PARTIAL / no new official submission. Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. Credit the original conjectures to R. J. Mathar; A060791 related formulas to their listed authors including Peter Bala.

## Live reconciliation
Read AGENTS.md, CAMPAIGN_LEDGER.md (blob 1e7ebc2b3f9d589c95caa2227c4e9a5fe690ade4), current upstream tools/oma.sh and lib/join.ts, the actual generator of /join.txt. Direct live join.txt failed both web and shell (DNS); no desk mutation/lease, no bypass of team/STOP rules. Recovered isolated fork workflow .github/workflows/campaign-verify.yml (blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c); it intentionally tolerates failed probe commands, hence green workflow alone is insufficient. No workflow modification.

Direct upstream PR metadata: 7724,7815,7817 open, merged=false; 7223,7625,7865,7930,7931,7933 likewise open/unmerged. No duplicate submission or claim. Official check-proof job logs independently read:
- A180195 PR7724: run46021728128 job140582771733, 15:10:30Z: accepted - kernel accepted; axioms within propext, Classical.choice, Quot.sound.
- A002538 PR7815: run46022873588 job140586706057, 15:18:27Z: same actual verdict.
- A158960 PR7817: run46022888332 job140586756527, 15:25:48Z: same actual verdict.
No verified public merges/credit from these; 0/20 confirmed. Do not infer a merge from the synthetic merge_commit_sha of an open PR. Official solved feed unavailable directly.

Fork run46023392462 job140588472228: actual log shows OMA.solution axioms [propext, Classical.choice, Quot.sound] for A052204, A175784, A193282; A390815 failed in this earlier run, but subsequent run46025483748 job140595672705 shows its repaired proof axioms in that same allowed set. FC pin 9097e2f90e66d2f6244209cb1c07f7120d17ec53 observed in logs. These are probes, not merged-target proof submissions. A052204 and A193282 statement-check verdicts accepted for compilation only. No newly executed Lean in this lane.

## Independent challenge: A175784, offset and prior source
PR7931 statement patch at head e0f1cc9d0243708ebdd85a3d51e8859e8b31da15 and fork campaign/ProbeA175784.lean blob 1f2a69b33ca7d9fca2b8a0e91e424d82099765bb inspected. Source https://oeis.org/A175784 offset 1, Mathar Dec 7 2010, includes three assertions. All three are present in PR. For m=n+2, q=4m/(2m+5). Since 2m+5 is odd, gcd(4m,2m+5)=gcd(m,5). Hence a(n)=4m/gcd(m,5). The shift by 5 changes a by 4 if n=3 mod5, 20 otherwise. This proves second difference zero for n>=11. Let f(n)=a(n) for n>=1 and 0 otherwise. The exact boundary coefficients of (1-X^5)^2 sum f(n)X^n are [0,12,16,4,24,28,8,4,0,-4,-8], all higher coefficients zero. The distinction a(0)=8 versus f(0)=0 is necessary: at n=10 the untruncated second difference is 0 whereas the GF coefficient is -8. No offset weakening detected.

Novelty caution: https://oeis.org/A060791 already publishes b(m)=m/gcd(m,5), the order-10 recurrence signature, and Peter Bala's Feb 20 2019 generating function B=X/(1-X)^2-4X^5/(1-X^5)^2. Independently verified the exact identity F=4(B-X-2X^2)/X^2, so both remaining A175784 claims are consequences of the source identity and existing published B formula. This does not establish a prior explicit proof of the exact A175784 statement; do not claim novelty or count separate results for its three parts. Related A096431 read; it concerns a different denominator identity. All-state upstream searches is:pr A175784, A193282, A052204 returned only own statement PRs 7931,7933,7930 respectively. TrureTuring research highlights and targeted searches read, no matching result found in returned material, not a comprehensive catalog clearance.

## Independent challenge: A193282
Source https://oeis.org/A193282 (Mathar Oct 3 2014) and PR7933 head f91537af0ef4e02a02b7dcc01026c58f48d22c2e match exact five-term recurrence for n>=4. For A(n)=(n!/floor(n/2)!)^2, n>=1, adjacent quotient is 4 if n even, n^2 if odd. Divide the recurrence by A(n-4)>0. In even n, vector of five ratios is (16(n-3)^2(n-1)^2,4(n-3)^2(n-1)^2,4(n-3)^2,(n-3)^2,1); in odd n it is (16n^2(n-2)^2,16(n-2)^2,4(n-2)^2,4,1). Dot either with (1,8,-4(n-2)(n+2),16(-2n^2+6n-3),-64(n-3)^2) and expand: zero identically. The n=4 boundary valid. Source related A081125 already publishes the factorial ratio, a different recurrence and gamma form; A356636 gives related binomial array, not the exact five-term recurrence. No priority claim.

## Reproducible independent local Python/SymPy tests, executed
```python
from fractions import Fraction
from math import gcd,factorial
import sympy as s
n=s.symbols('n'); C=[1,8,-4*(n-2)*(n+2),16*(-2*n*n+6*n-3),-64*(n-3)**2]
for p in (0,1):
    T=[s.prod((n-j)**2 if (p-j)%2 else 4 for j in range(i,4)) for i in range(5)]
    assert s.expand(sum(c*t for c,t in zip(C,T)))==0
A=lambda i:(Fraction(2*i-1,2*i+9)+1).numerator
f=lambda i:A(i) if i>=1 else 0
coeff=[0,12,16,4,24,28,8,4,0,-4,-8]
for i in range(10001):
    assert A(i)==4*((i+2)//gcd(i+2,5))
    assert f(i)-2*f(i-5)+f(i-10)==(coeff[i] if i<len(coeff) else 0)
assert A(0)==8 and f(0)==0
assert A(10)-2*A(5)+A(0)==0
assert f(10)-2*f(5)+f(0)==-8
for i in range(4,501):
    V=[(factorial(i-j)//factorial((i-j)//2))**2 for j in range(5)]
    assert sum(int(c.subs(n,i) if hasattr(c,'subs') else c)*v for c,v in zip(C,V))==0
x=s.symbols('x'); B=x/(1-x)**2-4*x**5/(1-x**5)**2
P=sum(c*x**j for j,c in enumerate(coeff))
assert s.cancel(4*(B-x-2*x*x)/x**2*(1-x**5)**2-P)==0
```
Actual output: both parity polynomials expand to zero; 20,002 exact A175784 coefficient/numerator checks plus boundary assertions; 497 exact A193282 checks; published GF shift exact. No test substituted for the all-index proof or official checker.

## RESUME HERE
Re-read upstream PR7223,7625,7865,7930,7931,7933 and official desk/team status; on first actual statement merge that is not already owned, acquire one live proof lease and run unmodified exact imported-target checker before one-file PR. Preserve known-result/novelty caveats and source author credit. No RH files or other workers changed.
