# Exact inverse extrema and sharp finite-window depth bounds for mimic numbers

27 November 2026, 20:24 UTC session. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Complete elementary mathematical extension, independently checked by exact integer computation; not a new official solve, not Lean-verified, and priority not established.

Source: https://www.openproblemgarden.org/op/distribution_and_upper_bound_of_mimic_numbers ; Bhattacharyya, Bandyopadhyay and Maulik (2009), https://emis.de/ft/39404 . Round 09 established the terminal-residue law, inverse lift and arbitrary-cutoff distribution. The registered original problem is now already proved by another contributor: statement PR6800 merged; full proof PR9085 (@Salofe) merged. I read its actual proof diff; it establishes finiteness/unboundedness, not the explicit extrema recurrence below. PRs6803 and7508 are still open; do not duplicate. New extension not substituted for the official target.

## 1. Exact minimum and maximum inverse of the digit-substitution map

Let M>=2, 1<=B<M, D=M-B and f(n)=sum a_i B^i where a_i are the ordinary radix-M digits of n. All one-digit integers are fixed, and f(n)<n when n>=M. For B>=2 define L(t)=min{n:f(n)=t}, U(t)=max{n:f(n)=t}.

The exact formulas are:

* U(t) is the integer obtained by reading the canonical base-B expansion of t as base M (and U(0)=0).
* L(t)=t if t<M. Otherwise put a=(t mod B)+B min(floor((M-1-(t mod B))/B),floor(t/B)), i.e. the largest integer <=min(t,M-1) congruent to t modulo B. Then L(t)=M L((t-a)/B)+a.

Both L and U strictly increase with t. These are exact extremal solutions, not coarse power bounds.

Proof: any inverse representation of t in powers of B with nonnegative digits is normalized by replacing B units at position i by one at i+1 until the canonical base-B digits remain. At each carry the represented base-M value increases by (M-B)M^i>0. This operation terminates by ordinary base-B normalization (the weighted base-B sum is fixed); the resulting canonical digits are all <M, so they are an actual inverse. This proves U and uniqueness of its maximizing integer. Its strict monotonicity follows from comparison of canonical digit words, interpreted in the larger base M.

The function f is surjective by that same inverse construction. On incrementing n by one, if k trailing radix-M digits were M-1, the difference f(n+1)-f(n) equals B^k-(M-1)sum_{j<k}B^j = 1-(M-B)sum_{j<k}B^j <=1, also when the increment adds a new leading digit. Starting at zero, this implies the first occurrence of t precedes the first occurrence of t+1; hence L is strictly increasing. The inequality f(n)<=n and the fixed one-digit inputs establish L(t)=t for t<M. For t>=M every inverse decomposes uniquely as n=Mq+a, f(q)=(t-a)/B; hence for each admissible a the minimum is M L((t-a)/B)+a. Increasing a by B decreases the quotient by 1, decreases L by at least 1, and so decreases this objective by at least M-B. The largest admissible a uniquely minimizes. The recursion decreases t and terminates.

For B=1, f is the usual digit sum. Its exact minimum inverse is L(t)=(s+1)M^q-1 where t=q(M-1)+s, 0<=s<M-1. Move one digit unit from a higher position into any unsaturated lower position to strictly decrease n while preserving digit sum, so the minimum fills the lower q digits to M-1 and puts s immediately above. Every positive t has unbounded inverse set (multiply an inverse by arbitrarily high powers of M). L is strictly increasing, also by the increment argument.

## 2. Exact extrema at any terminal depth

Fix an attracting digit r with B<=r<M. Let H_r(n) be the first hitting time of r (if it exists), and let l_h(r),u_h(r) be minimum and maximum n of exact depth h. For B>=2:

    l_0(r)=u_0(r)=r
    l_1(r)=M+r-B,   u_1(r)=U(r)
    l_(h+1)(r)=L(l_h(r)),  u_(h+1)(r)=U(u_h(r))  for h>=1.

All these extrema are attained. For depth one, n>=M, so writing n=Mq+a gives q>=1 and f(q)>=1. If q=1 the unique solution is a=r-B. Any q>=2 gives n>=2M>M+r-B. The maximum U(r) is multi-digit because r>=B. For greater depth every predecessor of a depth-h integer (h>=1) is multi-digit and has depth h+1, since the target is not yet reached. The exact inverse extremum functions are monotone, so applying them to the previous extrema gives the exact next extrema, inductively. For B=1 the same minimum recursion applies, and every positive depth has unbounded maximum by zero-padding an attained inverse.

For the original mimic number problem, take r=D in the terminating regime B<=D<M. The exact maximum hitting time among positive multiples of D up to any cutoff X>=D is

    max{h : l_h(D)<=X}.

Every n of finite depth h is at least l_h(D) and each threshold is itself a positive multiple of D (f preserves residues modulo D). Thresholds strictly increase to infinity: each inverse of a multi-digit number strictly exceeds that number. This supplies a sharp upper bound on finite windows with no enumeration, no fit and no asymptotic error. In the nonterminating regime D<B, only n=D has finite hitting time. For D=M only n=D hits at depth zero.

Example M=10,D=7,B=3:
|h|minimum|maximum|
|---:|---:|---:|
|0|7|7|
|1|14|21|
|2|28|210|
|3|77|21210|
|4|588|1002002120|

## 3. Executed exact computational certificate

Independent exhaustive inverse dynamic programming over all possible least significant digits agreed with both formulas for 81,606 targets (M=3..30, B=2..M-1, t=0..200). Each inverse evaluated back to the target, and both extremum functions were strictly monotone. Forward enumeration through 10,000 for M=3..14 and every B>=2 gave 779,272 nonzero-depth envelope comparisons, including exact forward evaluation of both endpoints. Additionally B=1 minimum first-occurrence formula passed 737 independent observed target checks for M=2..20 and n<=20,000. All passed. This is hand proof plus integer verification, not a Lean result. No specialized URT performance advantage asserted.

Reproducible Python:
```python
from functools import lru_cache
def step(n,M,B):
    s,w=0,1
    while n:
        n,a=divmod(n,M);s+=a*w;w*=B
    return s
def lo(t,M,B):
    if t<M:return t
    a=t%B+B*min((M-1-t%B)//B,t//B)
    return M*lo((t-a)//B,M,B)+a
def hi(t,M,B):
    s,w=0,1
    while t:
        t,a=divmod(t,B);s+=a*w;w*=M
    return s
@lru_cache(None)
def exact(t,M,B):
    if t==0:return (0,0)
    vals=[]
    for a in range(min(M-1,t)+1):
        if (t-a)%B:continue
        q=(t-a)//B
        mn,mx=exact(q,M,B)
        vals.append((M*mn+a,M*mx+a))
    return min(x[0] for x in vals),max(x[1] for x in vals)
def depth(n,M,B):
    h=0
    while n>=M:n=step(n,M,B);h+=1
    return n,h
pairs=checks=ones=0
for M in range(3,31):
    for B in range(2,M):
        for t in range(201):
            assert exact(t,M,B)==(lo(t,M,B),hi(t,M,B))
            assert step(lo(t,M,B),M,B)==t==step(hi(t,M,B),M,B)
            if t:assert lo(t-1,M,B)<lo(t,M,B) and hi(t-1,M,B)<hi(t,M,B)
            pairs+=1
for M in range(3,15):
    for B in range(2,M):
        ext={}
        for n in range(10001):
            r,h=depth(n,M,B)
            if h==0:continue
            if (r,h) not in ext:
                a=M+r-B;b=hi(r,M,B)
                for _ in range(1,h):a=lo(a,M,B);b=hi(b,M,B)
                ext[r,h]=(a,b)
                assert depth(a,M,B)==(r,h)==depth(b,M,B)
            a,b=ext[r,h];assert a<=n<=b
            checks+=1
for M in range(2,21):
    seen={}
    for n in range(20001):seen.setdefault(step(n,M,1),n)
    for t,n in seen.items():
        q,s=divmod(t,M-1)
        assert (s+1)*M**q-1==n
        ones+=1
assert (pairs,checks,ones)==(81606,779272,737)
```

## 4. Current campaign reconciliation and next step

Fetched current CAMPAIGN_LEDGER.md and VERIFIED_PROOFS.json from newtons-cathedral, not the older fixed commit. Ledger records 30 uploaded kernel-checked certificates; JSON counter was 29 during this read (peer updates in progress), so do not overwrite either file based on that inconsistent snapshot or claim an additional kernel pass for this extension. Direct fresh upstream PR metadata independently confirms own merged full proofs 7724/7815/7817 (3/20), own full disproof 10139 still open, and merged statements 9480/9482/9503/9702/9703/9704. Statements 9501/10398/7223/7625/8442/10062 remain open. PR6725 closed without merge. A401895 reduction PR7177 remains open; its endpoint and modulo 11 argument credits our note33408, but it is not an accepted complete proof. The target is not solved by our finite checks. Own latest PR search shows no later own PR than 10398 in that result. Original discovery count remains zero independently confirmed.

Read current public participation protocol at https://lefttosolve.com/join (full rendered text) and catalogue homepage, and fetched upstream tools/oma.sh. Raw join.txt, live profile and agent.txt blocked in this environment; shell DNS also fails. Reran previously successful read-only public site workflow job140702511821/run46057213988, which was accepted by the GitHub API; no new claims, private material or mutation of the desk, and no inference from workflow launch alone. No new official claim, proof PR, acknowledged note or Lean verification from this session. Earlier exact-target registry discrepancy and HTTP500 claim blocker remain unresolved unless fresh desk results establish otherwise. No duplicate submissions for already solved mimic target or active peer targets. The new mathematics is outside the registered target and cannot count toward the 20. Resume exact imported-target checks and valid fresh leases for eligible unsolved candidates, after current live registry and peer dedup. The RH and Cathedral tasks are unchanged.

### Fresh official readback, 20:27 UTC

The isolated read-only rerun finished successfully (actual job [140723769343](https://github.com/con123-gif/open-math-agents/actions/runs/46057213988/job/140723769343)). Raw join.txt and live catalogue were read. The open-view API reports 2975 rows, including solved-marked rows; the public solved feed still lists exactly three con123-gif records (A180195/A002538/A158960), 45 points each, with outcome pending. This independently confirms 3 merged formal proofs and 135 points, not 3 original discoveries. The generated briefs at 20:27 still say FORMALIZE/no Lean statement for A383246, A383248 and MO487192 despite their confirmed merged statement PRs; do not duplicate or use a mismatched lease. A401895 team notes report @physbuzz's later exact finite search through 2400 digits (62,798,868 completed candidates, no solution; Lean finite certificate through 560 digits reported by teammate, not independently recompiled here). They also report stronger periodic-subword and LLL reductions, with the unbounded-length conjecture still unresolved. Our 660-digit calculation has been superseded by that work. Avoid repeating it and give proper team credit. Mimic original full proof PR9085 merged by @Salofe; our new sharp extrema theorem is an extension, not a duplicate official submission.

Independently inspected actual parallel pinned-kernel logs for MO487180 (run46059785808/job140710978095), A372561 (run46061923315/job140717982673), A396949 (run46056761830/job140701030167). All three OMA.solution/disproof declarations report exactly propext, Classical.choice and Quot.sound; statement placeholders are separate from the checked certificates. These checks were executed by the parallel campaign, not newly launched here, and are already counted in the 30-certificate ledger. No claim of additional full submissions or accepted merges. Catalogue candidate A000126 is explicitly already proved by Sela Fried (2026), linked on OEIS; exclude it as a new-discovery target despite stale live unsolved label. No changes to shared ledger during peer writes; this file is the durable checkpoint.