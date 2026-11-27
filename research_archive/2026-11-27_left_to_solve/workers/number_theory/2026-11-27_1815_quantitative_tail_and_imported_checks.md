# Number-theory lane — 27 Nov 2026, 18:15 UTC

Cornelius Lytollis, assisted by ChatGPT (GPT-6.2). Credit Andres Cicuttin for the 2019 source recurrence/conjecture and its stated seed scaling. No new discovery or submission claimed. Read current AGENTS.md, CAMPAIGN_LEDGER.md (blob 0e245c564a60b47413c3c8ca113aa8a8613ed65f), VERIFIED_PROOFS.json, canonical A329813 statement (ece44c696ff7c6a16926563bacde6a36ea462e76) and proof (9a4d420b3f89e23e0ca149066e95680712aefabe). Requested RESUME_HERE.md was absent (404). Official main tools/oma.sh read; join.txt unavailable via web and local DNS. No desk lease acquired or claimed. Local lean/gh absent. Preserve peers' active publication lanes.

## Actual checks, not merely green CI

Fetched direct upstream PR metadata: 7724, 7815, 7817 merged and credited con123-gif; checker comments explicitly say statement being verified. All eight statement PRs 9480,9482,9501,9503,9686,9702,9703,9704 remain open/unmerged. 7223 and 7625 still report HTTP403 retry. Competing proofs 9230,9307,9309,9408 open; do not duplicate. Ledger reports 24 complete checked certificates, 3 accepted formal proofs, conservative genuine-open count 0. Search with explicit is:pr for A329813 returned no hits despite known PR9501: false negative; do not infer eligibility from search.

Direct job logs for https://github.com/con123-gif/open-math-agents/actions/runs/46046988992/job/140668601604:
- 18:10:36 UTC: proofs/mo-198816.lean, OMA.disproof, actual registered OMAStatements.S_mo_198816, verdict accepted, axioms propext/Classical.choice/Quot.sound.
- 18:11:05 UTC: proofs/oeis-a124869.lean, OMA.solution, actual registered OMAStatements.S_oeis_a124869, verdict accepted, same three axioms.
These are isolated official-checker executions, NOT upstream merged proof PRs. Interactive owners handle leases and submission; do not duplicate.

## New quantitative refinement (human proof; no Lean replay yet)

Source https://oeis.org/A329813 and alias https://oeis.org/A329654 search snapshots give exact arbitrary nonzero seeds and n>1 recurrence, and state the six-periodic seed multipliers. The known scaling already suggests the disproof; do not claim originality without adjudication. The existing checked disproof is sufficient for official submission when eligible. Here prove a quantitative estimate, not an extra problem.

For any positive seeds, let D_m=B_m/m for m>=1. Substitution gives
D_(m+6)=D_m*(1-6/((m+2)(m+3))).
For m>=3 and j>=0 set u_j=6/((m+6j+2)(m+6j+3)). These are in (0,1). Since (m+6j-1)(m+6j+5) <= (m+6j+2)(m+6j+3),
u_j <= 1/(m+6j-1)-1/(m+6j+5).
By induction 1-product_(j=0)^(J-1)(1-u_j) <= sum_(j=0)^(J-1)u_j <= 1/(m-1)-1/(m+6J-1).
Thus D_(m+6J) decreases to L_r (r=m mod 6), and
0 <= D_m-L_r <= D_m/(m-1), with L_r >= D_m*(m-2)/(m-1)>0.
In particular no infinite-product or gamma-function convergence black box is necessary. All six unit-seed limits are positive. Taking limits in D_(n+2)=(n+1)/n * D_(n+1)/D_n gives L_(r+2)=L_(r+1)/L_r cyclically. The source's multipliers then give a unique positive seed x=L_2/L_1, y=1/L_1 for which all six normalized limits equal 1. Uniqueness follows from the first two multiplier equations. This is a quantitative strengthening of the earlier all-six-equal result, not a second eligible resolution.

Exact sandbox regression (Python Fraction, actual output 5748 checks; not kernel verification):
```python
from fractions import Fraction as F
checks=0
for x,y in [(F(1),F(1)),(F(2,3),F(7,5)),(F(11,4),F(3,8))]:
    b=[x,y]
    for n in range(2,361): b.append(n*b[-1]/b[-2])
    d=[None]+[b[n]/n for n in range(1,len(b))]
    for m in range(1,355):
        assert d[m+6]==d[m]*(1-F(6,(m+2)*(m+3))); checks+=1
    for m in range(3,355):
        for j in [1,2,5,10,20]:
            n=m+6*j
            if n>360: continue
            assert 0<d[n]<=d[m]
            assert 0<=1-d[n]/d[m]<=F(1,m-1)-F(1,n-1); checks+=1
print(checks)
```

## Fresh-target triage: exclude easy prior consequences

A390246's July 2026 formula is definitional: for n>=1, let F(n,M) assert an injective choice b_i in [n+1,M], divisible by i=1,...,n. A219787 minimizes M for F, and A390246 minimizes k for F(n,n+k-1). A witness exists at M=2n (b_i=i*(floor(n/i)+1) need not be distinct, so instead use b_i=(n+1)*i, with M=n(n+1)); translation of the lower and upper interval endpoints is order preserving. Thus a390246(n)=a219787(n)-n+1. This is a definition change, not a solution of the Erdős–Pomerance asymptotic problem. Do not claim/count. Sources https://oeis.org/A390246 and https://oeis.org/A219787/internal (explicit distinctness in examples).

A382632's regular-polygon impossibility is a direct consequence of Fermat's classical four-squares-in-AP theorem. In a cyclic chain of rods 1,...,k, each vertex is a joint; select the increasing joint indices 0<=j_0<j_1<...<j_(q-1)<k in the original chain order. For a q-gon of equal positive side length L, the q-1 nonwrap sums have T(j_(i+1))-T(j_i)=L. q>=4 would give four distinct triangular numbers in AP and hence four distinct squares (2j_i+1)^2=8T(j_i)+1 in AP, impossible by Fermat. This covers the wraparound side without needing a joint at 0. Source https://oeis.org/A382632, related exact chain model https://oeis.org/A380867, classical theorem https://arxiv.org/abs/0712.3850. No novelty claim. No eligible lease or PR attempted. TrureTuring exact endpoint inaccessible; catalog audit incomplete. A152020 explicitly prior gcd formula; A356247, A396797, A075002 already proved per source. A361715 conjecture 2 survived exploratory exact modular checks at p=5,7,11,13 and higher r as feasible, not a disproof or proof. Avoid further blind finite search.

## RESUME HERE
First fetch latest ledger and direct metadata for statement PR9501; if merged, coordinate with interactive owner, read actual registered statement byte-for-byte, verify exact imported target using pinned checker and obtain valid fresh lease before any official proof PR. No duplication. Otherwise pursue a genuinely new source problem not merely implied by earlier formulas. Join.txt and live eligibility must be retrieved before claiming. No changes to shared ledger, proof artifacts, RH files or workflows.
