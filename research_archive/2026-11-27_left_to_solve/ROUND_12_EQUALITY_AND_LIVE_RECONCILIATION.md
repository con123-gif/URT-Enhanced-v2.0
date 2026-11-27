# Round 12 — exact equality in prime-factor subtraction; live campaign reconciliation

27 November 2026, 14:28 UTC. Research credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. No new accepted proof or novelty claim. No URT-specific speedup demonstrated. This strengthens the same A399155 problem, not a separate campaign target.

## Full mathematical result: characterize equality

For n>=2 let F(n) be the step count when repeatedly subtracting the smallest prime divisor, and G(n) the step count for the greatest. Stop at 0. Every subtraction is a prime divisor >=2 and never leaves 1, so all paths terminate.

Let p be the smallest prime divisor of n and q_1,...,q_G be the successive greatest prime divisors. The first least-factor subtraction leaves an even number, and every subsequent least-factor subtraction is exactly 2. Therefore

    2F(n)=n-p+2.

Telescoping along the greatest-factor path gives n=sum_i q_i. Thus the exact gap is

    2(F(n)-G(n)) = sum_i(q_i-2) - (p-2)
                 = (q_1-p)+sum_{i>=2}(q_i-2).

All terms on the right are nonnegative. Equality is therefore equivalent to q_1=p and every subsequent q_i=2. The first condition means n is a prime power p^a. If a=1, both procedures end immediately, hence equality. If a>=2 and p is odd, the next input p^a-p is positive and divisible by p, so q_2>=p>2 and equality fails. If p=2, a=2 gives n=4 and equality; if a>=3, then n-2=2(2^(a-1)-1) has an odd prime divisor, so again equality fails. Consequently

    F(n)=G(n) if and only if n is prime or n=4.

The same telescoping argument proves the least-factor policy is the unique maximizing sequence of prime choices, for all n>=2: equality in the upper bound forces the first choice p and then only 2. This is an exact proof for all n, not a heuristic or finite observation. It is a stronger result than the nonnegative-gap statement and useful when interpreting the sequence's zero set; it is not a second problem. Priority beyond the original source is not established.

### Independently executed exact certificate
Python standard library, smallest/greatest prime factor sieve followed by dynamic programming. All 199999 integers 2..200000 passed the two exact identities and equality criterion.

```python
N=200000
p=list(range(N+1)); q=[0]*(N+1)
for i in range(2,N+1):
    if p[i]==i:
        for j in range(i,N+1,i):
            if p[j]==j:p[j]=i
            q[j]=i
F=[0]*(N+1); G=F.copy(); debt=F.copy()
for n in range(2,N+1):
    F[n]=1+F[n-p[n]]; G[n]=1+G[n-q[n]]
    debt[n]=q[n]-2+debt[n-q[n]]
    assert 2*F[n]==n-p[n]+2
    assert 2*(F[n]-G[n])==debt[n]-(p[n]-2)
    assert (F[n]==G[n])==(p[n]==n or n==4)
```

No Lean execution of this extension; do not widen the already-submitted statement without approval.

## Campaign live reconciliation
- Official read-only workflow succeeded: https://github.com/con123-gif/open-math-agents/actions/runs/46016125981 . It retrieved the current join.txt, live catalogue (1818 entries in known category, including solved ones), exact mimic-number agent brief, and public solved feed. No entries for con123-gif were found in that feed by recursive exact handle matching.
- PR7223 (MO290383) and PR7275 (A399155) were both open, unmerged, no comments, as directly retrieved during this run. Earlier pinned Lean proof results remain recorded in CAMPAIGN_LEDGER.md; no new Lean check in this run. Both PRs are statement-only. Wait for merge before proof lease, avoid colliding with the interactive lane.
- PR6725 closed and rejected, superseded; not a pending proof.
- PR6800 merged at 13:46:52 UTC, author rleshner; official mimic proof statement is now available. The live brief at 14:27 UTC had zero active agents and upstream had no proof file or matching proof PR in the search. The approved target is all of HistogramLaw, positive divisibility, the two termination regimes, fixed-height finiteness, and infinite positive-height classes when B=1. The full informal proof plan is published in the isolated fork workflow .github/workflows/round12-mimic-note.yml (branch oma-hourly-round12-readonly), commit 49aa11216031b8c4416c06dcbddceb62163dedc5. That workflow checks the live assignment/role/notes and, only if no conflict, posts the plan and releases the lease. Workflow outcome not confirmed at this checkpoint.
- PR7177 (reduction A401895) is open, unmerged. Its author explicitly credits @con123-gif for endpoints and modulus 11; do not count it as our independently accepted proof. It uses the residue classes modulo 297 previously derived. Wait for reduction acceptance, then check step availability and team notes.
- Counts confirmed: 0/20 accepted distinct problem proofs, 0 new proof PRs this run, 2 pending statement PRs. Current run does not alter RH or physics workers.

RESUME HERE: confirm mimic note workflow result and release; build digit recursion and invariant lemmas for exact approved mimic theorem, then polynomial block counting. Reconcile PR7223/7275 and submit exact preverified proofs if and when their statements merge, in coordination with interactive workers. Check PR7177 for verified reduction step opportunities. Avoid all duplicate claims. Continue seeking eligible quick complete targets.

### Confirmed workflow outcome
The isolated mimic-note workflow [46016258667](https://github.com/con123-gif/open-math-agents/actions/runs/46016258667) retrieved join.txt and the exact current brief but the one permitted claim request returned HTTP 409. No lease was obtained and no note posted. The conflict body was not captured; do not infer already_solved from 409 alone. No retry or bypass. The complete plan remains in the archive and fork. Latest PR checks again show 7223 and 7275 open, unmerged; no new submissions by con123-gif.
