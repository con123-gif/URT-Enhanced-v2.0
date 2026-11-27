# Submission lane — independent valuation audit of A124869/A124870, 27 November 2026

Status PARTIAL. Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. Source sequences Jonathan Vos Post; conjectures Colin Barker, 16 July 2019; rational-value generating function Vladeta Jovovic, 8 Oct 2007; related sequence code Robert Israel.

## Actual reconciliation
Read AGENTS.md and CAMPAIGN_LEDGER.md blob 7a3f80943ad8aec4d0333b40d32c026fcadbf92a (16:24 reconciliation), previous submission lane checkpoint 77923cdafeacf5aa52bc5699c7a9e72914a2c759, current tools/oma.sh and lib/join.ts (blob bfa7e838b66b04b4eccef978fce4268e3786a2ec). Live join.txt web failed; shell curl DNS failure, Lean/lake absent. Recovered exact existing verifier workflow blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c, unchanged. No fresh lease or submission without actual live eligibility/team information.
Direct upstream get_pr_info: full proof PR7724,7815,7817 all open merged=false; statement PR7223,7625,7865,7930,7931,7933,8568,8569,8442,8102 all open merged=false. No new comments returned for three proofs and 8568/8569/8442. No merge or credit inferred. Confirmed count 0/20, prior three official proof checker acceptances unchanged. Ledger now lists 12 complete kernel-checked candidates, subject to novelty and scope audit (including three submitted, nine waiting for statement merge); excludes known-prior A390815.
Exact imported targets cannot be checked until statement merge. Inspected actual pending single-file statement sources:
- PR8569 head 779b342b3da9c956ac2a97bf3a960fb2859ba500; statements/oeis-a124869.lean blob 23152ec63b56fcda46ecfe7ed66275ac6c7752dc.
- PR8442 head f05e5b27f798c05f4a5e3d82be25fbe776fead94; statements/oeis-a124870.lean blob bab279c0d000b5a456cdbc44f267dbf765ce3556.
Both faithfully state entire source conjecture (recurrence plus generating function), offset zero, exact reduced rational numerator/positive denominator; multiplication by denominator is equivalent to formal division since constant coefficient is 1. A124869's older rational-value GF is NOT its integer numerator GF, and is correctly distinguished.
Read existing combined probes campaign/ProbeA124869.lean blob 9672a748abf91df1d78a54a1b99fcd702a19e002 and campaign/ProbeA124870.lean blob 0afdb90ee43091a38c2f71ed2b3520b9a6ee015c on oma-campaign-20261127. Both use the block method and exact coprimality, proving OMA.solution independently of the placeholder. Actual job log receipts:
- run46031012204 job140614498460: 16:09:57.187635Z 'OMA.solution' depends on axioms [propext, Classical.choice, Quot.sound].
- run46029987618 job140611036825: 16:03:09.709771Z same allowed axiom set.
Both logs show FC 9097e2f90e66d2f6244209cb1c07f7120d17ec53. No new Lean run or official proof PR. The verifier tolerates failed probe commands, so actual axiom output, not workflow color, is evidence.

## Independent all-index proof via valuation (alternative to block method)
Let z=-1-3i, R_n=Re(z^n), I_n=Im(z^n), q_n=R_n/10^n. Then R_0=1, R_1=-1 and R_(n+2)=-2R_(n+1)-10R_n. Thus R_n=(-2)^(n-1)*(-1) mod 5 for n>=1, and 5 never divides R_n.
Write z^2=2w with w=-4+3i. For n=2k+1, R_n=2^k Re(z w^k); mod2, z=1+i and w=i in the Gaussian ring, so Re(z w^k) is odd. For n=2k with k even, Re(w^k) is odd because w^k=i^k mod2. For n=2k with k odd, expand the real part binomially: the term with exactly one real factor is (-4)k(-1)^((k-1)/2)3^(k-1), with valuation exactly 2; all other real terms have at least three real factors and are divisible by 64. Hence v2(R_(2k))=k+2. This also proves all R_n nonzero (already follows mod5).

Consequently gcd(R_n,10^n)=2^h(n), with h(2k+1)=k; h(2k)=k for k even; h(2k)=min(2k,k+2) for k odd. For n=2 the cap is necessary: v2(R_2)=3 but only 2 powers of 2 can be cancelled. Then N_n=R_n/2^h(n), D_n=10^n/2^h(n).
The exact denominator formulas are D_(4k)=2500^k, D_(4k+1)=10*2500^k, D_(4k+3)=500*2500^k, D_(4k+6)=31250*2500^k, with D_2=25. They immediately give D_(n+4)=2500 D_n for every n>=3.
For n>=3, h(n+4)=h(n)+2 and h(n+8)=h(n)+4. Since z^4=28-96i, its characteristic polynomial is T^2-56T+10000. Therefore R_(n+8)=56R_(n+4)-10000R_n; dividing by 2^h(n+8) gives N_(n+8)=14N_(n+4)-625N_n, exactly the source range n+8>10. No recurrence extrapolation across exceptional n=2.
The formal-series denominator products expand to 1-14X^4+625X^8 and 1-2500X^4. All coefficients beyond degrees 10 and 6 respectively vanish by the proved recurrences. Direct initial coefficients of products are [1,-1,-2,13,-7,-65,39,125,0,0,-625] and [1,10,25,500,0,0,-31250]. This proves both full source conjunctions with no extra hypotheses.

## Executed independent Python exact checks (not Lean)
```python
from fractions import Fraction
N=2000
r,s=1,0
A=[]; D=[]
for n in range(N+1):
    q=Fraction(r,10**n); A.append(q.numerator); D.append(q.denominator)
    k,j=divmod(n,4)
    d=25 if n==2 else (1,10,None,500)[j]
    if n!=2:
        d=31250*2500**(k-1) if j==2 else d*2500**k
    assert q.denominator==d
    assert r%5!=0
    r,s=-r+3*s,-3*r-s
P=[1,-1,-2,13,-7,-65,39,125,0,0,-625]
Q=[1,10,25,500,0,0,-31250]
for n in range(N+1):
    assert A[n]-14*(A[n-4] if n>=4 else 0)+625*(A[n-8] if n>=8 else 0)==(P[n] if n<len(P) else 0)
    assert D[n]-2500*(D[n-4] if n>=4 else 0)==(Q[n] if n<len(Q) else 0)
assert A[10]-14*A[6]+625*A[2]==-625
assert D[6]-2500*D[2]==-31250
```
Executed output: 8004 exact assertions and 2 boundary negative controls confirmed, n=0..2000. The negative controls demonstrate why weakening the starting indices is false.

## Novelty limitations
Read https://oeis.org/A124869, https://oeis.org/A124870, https://oeis.org/A124871; A124872 returned 403. Related Robert Israel 2020 code gives raw rational imaginary-part recurrence, not the reduced real numerator/denominator conjectures; raw rational recurrence is already known, and not claimed novel. All-state GitHub searches explicitly is:pr A124869 and A124870 returned only the two campaign statement PRs (A124870 crossreferences A124869). TrureTuring published research page and targeted searches retrieved; direct exact API lookups failed, so catalog clearance incomplete. No comprehensive priority claim; neither candidate enters confirmed count. Both are separate source statements but share one mathematical mechanism, and may not count as two distinct eligible problems until upstream classification is confirmed.

## RESUME HERE
Check actual merge of pending statement PRs and live desk/teams. For first genuinely eligible unowned merged statement, compare merged file to exact certificate, acquire one valid proof lease, run unmodified imported-target checker, and submit one-file proof. Recheck all three accepted proof PRs for merge/public credit. Do not duplicate submissions or bypass permission errors. No RH files or other workers modified.
