# Number theory: exact gcd-pair correction and literal source probe (27 November 2026)

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 family). Source author Mohammed Bouras; prior prime occurrence/denominator work credited to Benoit Cloitre, Antonio Gracia Llorente and TrureTuring contributors. No exclusive priority claim.

## Source and current gate
- A356247 (https://oeis.org/A356247), paper https://arxiv.org/html/2509.09745v1 section 2, displayed gcd equality following conjecture 3. Cloitre's 20 August 2025 note https://oeis.org/A356247/a356247_1.pdf, sections 1–5, establishes the prime classification and occurrence pair (NOT the additional gcd equality). Paper and note read; PDF pages 1 and 4 visually checked.
- A363347 (https://oeis.org/A363347): distinct indices with equal non-1 values are asserted to satisfy both the sum and gcd formulas. TrureTuring's dossier https://the-omega-institute.github.io/trureturing-mdbook/Problems/bouras.html explicitly leaves the supplemental gcd identity open in its triage item 7, while its occurrence-count result is prior. Gracia Llorente DOI 10.5281/zenodo.23506866 is cited there as prior; direct DOI retrieval failed HTTP500, so its full primary text remains unread this run. OEIS live direct retrieval returned 403; search-indexed entries were readable. Full revision histories and live eligibility remain unconfirmed.
- Fresh GitHub all-state exact-ID PR searches explicitly is:pr for both A356247/A363347 and oeis-a356247/oeis-a363347 returned zero results. This is not a novelty proof. No official claim/PR made. Current join.txt inaccessible via web and container DNS; official current tools/oma.sh read successfully. No lease acquired. Do not bypass eligibility/primary-source gates.

## Complete exact mathematical correction
Let Q_k(n)=n²+(k-2)n-k and a_k(n) be the positive reduced denominator of the literal continued fraction with tail -k. For a repeated prime p at n<m, assume the established pair identity n+m+k-2=p and p divides both Q values. Put d=m-n. Then Q_k(m)-Q_k(n)=pd, and 0<d<p for positive n and k=1 or 4. Consequently gcd(p,d)=1 and
gcd(Q_k(n),Q_k(m)) = p*gcd(Q_k(n)/p,d) = p*gcd(Q_k(n),d).
This uses exact integer gcd identities, not an assumption about cancellation.

For k=1: p odd implies d=2t. Q_1(n) is odd and Q_1(n)=((p-d)^2-5)/4 = (p²-5)/4 - pt + t². Therefore the exact excess factor is gcd(t,(p²-5)/4). The originally asserted equality holds exactly when this gcd is 1.

For k=4: p odd implies d odd. Since 4Q_4(n)=(p-d)^2-20 and 4 is a unit modulo d, the excess factor is gcd(d,p²-20). The original equality holds exactly when this gcd is 1.

These two exact discriminant-based criteria improve the earlier cofactor gcd identity. They apply to every pair satisfying the stated premises; the source's prime-occurrence classifications are already prior. No new occurrence theorem or additional target count is asserted.

Witnesses (literal rational right-fold and independent source recurrence):
k=1, n=62, m=138, p=199, Q(n)=3781, Q(m)=18905, gcd=3781=19*199.
k=4, n=116, m=193, p=311, Q(n)=13684, Q(m)=37631, gcd=3421=11*311.
Both primes can be checked by trial division up to their square roots. The nontrivial factors falsify the supplementary universal equalities.

## Executed exact local verification (Python 3)
The following code was executed in the local container; no Lean result is claimed from Python.

```python
from fractions import Fraction
from math import gcd
for k in (1,4):
  seen={}; tested=fail=literal=0
  for n in range(3,1001):
    Q=n*n+(k-2)*n-k
    x,y=0,1
    for j in range(1,n-2): x,y=y,((j+2)*(y-x))%Q
    a=Q//gcd(Q,k*y+n*x)
    if n<=300:
      f=Fraction(-k)
      for i in range(n-1,1,-1): f=i-Fraction(i+1)/f
      assert a==(1/f).denominator
      literal+=1
    if a>1 and a in seen:
      m,q=seen[a]; d=n-m; p=a
      assert p==m+n+k-2 and p>d and gcd(p,d)==1
      g=gcd(q,Q)//p
      g2=gcd(d//2,(p*p-5)//4) if k==1 else gcd(d,p*p-20)
      assert g==g2
      tested+=1
      fail+=g>1
    if a>1:seen[a]=(n,Q)
  print('k',k,'literal cross-checks',literal,'repeated pairs',tested,'strict gcd failures',fail)
```

Actual stdout:
```
k 1 literal cross-checks 298 repeated pairs 110 strict gcd failures 3
k 4 literal cross-checks 298 repeated pairs 103 strict gcd failures 5
```
A separate literal rational loop confirmed the first failures ordered by the larger index are the displayed witnesses within the tested range. Finite checks are not the universal proof; the algebra above is.

## Lean probe upload
Literal rational right fold, source-faithful distinct-index hypotheses, two full negated supplementary propositions, and selected-theorem axiom prints uploaded in a unique fixture using Contents API; exact readback true:
https://github.com/con123-gif/open-math-agents/blob/37d3647a996c9e174d43f314a3af380c18dd8b62/campaign/ProbeBourasGcdPair20261127Number.lean
Blob aa52eee0219159d345a5384b81dd93379102512b. Actual unchanged campaign-verify.yml blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c was read, including push trigger, official source pin selection, and per-probe .exit artifact recording. No workflow edit. Local Lean unavailable. Available connector's commit workflow-run endpoint filters to pull-request runs and returned empty for this push; combined commit statuses also empty. Actual push run ID and exit/axiom evidence not yet accessible. Probe status UNVERIFIED, no increment to 35. No fake check or official acceptance.

## Official reconciliation
Fresh upstream PR metadata: #10139, #13332, #12465, #12514, #13431, #13174 all open/unmerged. #13332 workflow 46076886744 queued when retrieved. No new official verdict observed. Latest VERIFIED_PROOFS.json lists 35 records and complete_kernel_checked_certificates=35 (legacy complete_kernel_checked_candidates field is 34), 5 own full PRs, 4 official checker acceptances, 3 merged/credited, 0 certified genuine-open resolutions. No master ledger alteration. A385478 and MO309485 reserved, untouched.

## RESUME HERE
Obtain actual push run/artifact for 37d3647a996c9e174d43f314a3af380c18dd8b62 and check per-file .exit=0, all compiler error forms, both theorem axiom lists and exact source bytes before marking the probe checked. Then obtain the full prior Gracia Llorente text and live exact supplementary target eligibility; do not count or submit the already settled multiplicity problems.
