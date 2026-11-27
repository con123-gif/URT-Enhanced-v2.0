# Number-theory lane checkpoint — 2026-11-27

Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Source conjecture: Claude H. R. Dequatre, OEIS A369096 (13 Jan 2024). Classical inputs credited to Euler, Chebyshev, Landau, and the modern semiprime-count expansion of Crisan and Erban.

## Exact scope and prior gate
For n >= 2, omega(n) counts distinct prime factors. The source condition is omega(n) divides T(n)+T(n+1)=(n+1)^2. Let A(N) count such n <= N. All primes are eligible. The conjecture is pi(N)/A(N) -> 0. Indexed primary OEIS record https://oeis.org/A369096 read; direct page/history access returned 403, so full revision audit remains incomplete. Related A369093/A369097 have different arithmetic, A090777/A356410 checked, A001221 direct access blocked. Exact-ID GitHub all-state search with is:pr yielded no results; TrureTuring full catalog https://www.trureturing.org/conjectures.html has no exact A369096 hit (Dequatre appears for a different sequence). No novelty inference from search silence. Classical Landau semiprime asymptotics already imply the assertion: for N>=4 the distinct odd semiprime count is total semiprimes minus pi(N/2) minus pi(sqrt N) plus 1 (overlap 4). It is asymptotic to N log log N/log N; every such number qualifies. See Crisan and Erban, On the counting function of semiprimes, Integers 21 (2021), https://arxiv.org/abs/2006.16491. Treat as classical consequence, no originality claim; live eligibility and prior/source review remain outstanding. Root has coordinated this research target; no independent official claim.

## Complete elementary analytic argument (human proof)
For any fixed B>=2 let S={p prime: 3<=p<=B}. For p in S, take primes q with B<q<=floor(N/p). Each pq is odd with exactly two distinct prime factors, hence 2 divides (pq+1)^2; every pq is eligible. Unique prime factorization makes the map (p,q)->pq injective because exactly one factor is <=B. Thus A(N)>=sum_{p in S} max(0,pi(floor(N/p))-pi(B)).
The classical Chebyshev bounds pi(n)>=n/(4 log n) for n>=100 and eventually pi(n)<=4n/log n give, for each fixed positive integer p and sufficiently large N, pi(N)<=32 p pi(floor(N/p)). Indeed N<=2p floor(N/p) and log(floor(N/p))<=log N. Since pi(N)->infinity, eventually pi(N)>=64p pi(B). Therefore pi(floor(N/p))-pi(B)>=pi(N)/(64p). Intersect finitely many eventual ranges:
 A(N) >= (pi(N)/64) sum_{p in S} 1/p.
For any epsilon>0 Euler's divergence of the prime reciprocal sum gives B with sum>64/epsilon; then pi(N)/A(N)<epsilon eventually. This proves the precise relative-density assertion without PNT or Landau. Denominators are positive eventually since all primes qualify. No finite experiment substitutes for the limiting proof.

Independent exact challenge executed in Python: 411418 checks on disjoint product counts and eligibility across B=2,3,5,10,31,100 and N=0,1,2,15,100,1000,10000,100000,1000000; independent prime sieve agreed. No assertion failures. At N=10^6 the corresponding product counts are 0,28663,46643,59889,99142,125911. Reproduce:
```python
from math import isqrt
from bisect import bisect_right
N=10**6
omega=bytearray(N+1)
for p in range(2,N+1):
    if not omega[p]:
        for n in range(p,N+1,p): omega[n]+=1
P=[p for p in range(2,N+1) if omega[p]==1 and all(p%d for d in range(2,isqrt(p)+1))]
s=bytearray(b'\1')*(N+1);s[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
    if s[p]: s[p*p::p]=b'\0'*((N-p*p)//p+1)
assert P==[p for p in range(N+1) if s[p]]
checks=0
for B in [2,3,5,10,31,100]:
    for X in [0,1,2,15,100,1000,10000,100000,1000000]:
        A={p*q for p in P if 2<p<=B for q in P[bisect_right(P,B):bisect_right(P,X//p)]}
        count=sum(max(0,bisect_right(P,X//p)-bisect_right(P,B)) for p in P if 2<p<=B)
        assert len(A)==count
        assert all(n<=X and omega[n]==2 and (n+1)**2%omega[n]==0 for n in A)
        checks+=len(A)+1
print(checks)
```

## Actual pinned verification
Existing workflow on authorized fork con123-gif/open-math-agents, branch oma-campaign-20261127; FC 9097e2f90e66d2f6244209cb1c07f7120d17ec53, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. No RH runtime, no workflow changes or ref overwrite.
- First dilation probe run 46075012495/job 140760589248 actually failed (invalidField comp_tendsto, unsolved goal, sorryAx). Green wrapper not a pass.
- Repaired typed Tendsto pullback using ht.eventually hreal: campaign/ProbeA369096PrimeDilationSecondNumber2213.lean at ba8f518507c1283cc4939ac90483f06d7037469f, blob dcbb7c4bc449eac8ec92e4a695abf0f1aac35e2c. https://github.com/con123-gif/open-math-agents/actions/runs/46075395310/job/140761822271 . Artifact 15234940367 directly downloaded: .exit=0, log only unused-tactic warning; lower and dilation theorem axioms exactly propext, Classical.choice, Quot.sound. ZIP SHA256 21dd5f65e2ac48dae9431ea2abb352d602d0fe73e6dea479c9958b5fdef995cd. Helper only.
- Full candidate campaign/ProbeA369096FullNumber2213First.lean at 6bb17a21961b3a1919d0bf918cd91f03116e43cb, blob e2a7368dfff4f0cfb4724ab18ba77cbfe427568e; exact readback. Actual run https://github.com/con123-gif/open-math-agents/actions/runs/46075570986/job/140762372557 FAILED (lines 165,208,223,175,273; final theorem sorryAx). Artifact 15234459631. Repair hints: normalize one_div consistently in both reciprocal-sum hypotheses; change hab to a.1*a.2=b.1*b.2 before rw; correct outer indentation of simpa using hcount; open scoped Topology for nhds. Root independently queued full fixture 016a2f12abfdfaf0b9a8920e827c4a69477756f4, run 46075640402; not yet verified. Reuse whichever actual whole proof passes, do not duplicate publication. No additional full checked count.

## Newly merged A124870 registration / publication handoff
Actual upstream PR https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8442 merged 2026-11-27T22:01:17Z. Actual upstream statements/oeis-a124870.lean byte-identical to archive, blob bab279c0d000b5a456cdbc44f267dbf765ce3556. Fresh all-state exact-ID is:pr searches returned only 8442, no preceding proof observed. Queued unchanged archived proof blob 2d992bd569071098cc401ec1d86f351ea0e36dec in campaign/proofs/oeis-a124870.lean commit d0cdc5b73868cefdadeec5eb57f92c88783dc09f (byte-identical readback). Exact imported-target official checker run https://github.com/con123-gif/open-math-agents/actions/runs/46075641225 in progress at last inspection. No lease or official full proof PR created; root serialized publication after exact verdict and fresh gate.
Direct current PR reads confirm 7724,7815,7817 merged; MO198816 full PR10139 open; 7223,7625,9501,10062,10398,12465,12514,12591,12717,12808,12868,12938 still open. Campaign ledger 33 complete archived certificates, VERIFIED_PROOFS.json has 33 records despite stale scalar 32; 4 actual official checker acceptances, 3 merged/publicly credited, 0 accepted original discoveries certified. No increase asserted.

## Current official rules and resume
Read AGENTS, ledger, VERIFIED_PROOFS, latest lane checkpoints and root notes at current head. Direct join.txt blocked; current rendered https://lefttosolve.com/join and current upstream tools/oma.sh read, including 503 clause and STOP410. Site API unreachable locally; no live assignment/heartbeat claimed, no token stored, no claim attempted. Preserve all schedules and RH files.
RESUME HERE: inspect actual per-probe exit/axiom artifacts for root full A369096 and exact imported A124870 run; if A369096 fails, use diagnostics above to repair only after coordinating fixture slot. If imported A124870 accepts, root coordinates fresh claim and one-file official full proof PR after updated duplicate/eligibility gate. Keep classical-consequence A369096 out of original-discovery count.

## Final in-run verification update (22:19 UTC)
A124870 exact imported-target run **accepted**: https://github.com/con123-gif/open-math-agents/actions/runs/46075641225/job/140762613882 . Actual official checker JSON: file proofs/oeis-a124870.lean, ok=true, kind=open, polarity=proof, theorem=OMA.solution, imports=OMAStatements.S_oeis_a124870, decl=OMA.S_oeis_a124870.main, errors=[], verdict=accepted, reason=kernel accepted; axioms within propext, Classical.choice, Quot.sound. Log confirms exactly those axioms. Artifact 15235060491. This is an imported-target pre-submission check, not a new upstream PR acceptance, merge or discovery. Rechecked exact all-state is:pr A124870; only statement 8442. Root should take next serialized publication slot for this exact checked proof; no lease claimed locally.
Root's A369096 full attempt https://github.com/con123-gif/open-math-agents/actions/runs/46075640402/job/140762611952 also actually FAILED despite green wrapper (omega on sigma projections line190; DecidablePred member at217; linarith one_div normalization at308; selected OMA.solution sorryAx). Repair suggestions: change q <= B at the goal explicitly or simplify sigma projections before omega; supply decidability instance at declaration elaboration rather than only classical inside tactic; simp only [one_div] at hsmall hsum and goal before linarith. Peer verifier branch advanced to 3bc875e92bd1b318d4cdd8e0a8e1cf1ec16c00e5 for MO430643; no further writes to its shared verifier pending fresh handoff. Counts unchanged. RESUME HERE: root publish A124870 after fresh claim/duplicate/eligibility checks, and repair A369096 full certificate once shared slot is confirmed.
