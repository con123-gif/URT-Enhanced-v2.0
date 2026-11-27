# Submission lane — A342326 complete exact family, prior-background exclusion

27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 family; no serving configuration inferred). Credit Robert G. Root (A342326), Ilya Gutkovskiy (A307597), Vladimir Shevelev, Ant King, David W. Wilson and classical Jacobi two-square counting; also the original OEIS contributors. No discovery priority or formal acceptance claim.

## Current submission gates
Read AGENTS.md blob 8db0201da965541e0487d6dd1271e010bdaa0972, ledger blob 4b8ceb19b86fefb63ad330dfba11b5e3aa295f3c, VERIFIED_PROOFS.json blob dde905973f568ec60314286b066d98c439cfb032, and current repository head 5b8a42a0313df3b2bd1e8bc5a1d6d5764deb351f. Manifest contains 37 distinct records but its scalar complete_kernel_checked_candidates is stale at 36; ledger says 37. Flag for root metadata repair, no competing canonical edit. Actual counts remain 5 submitted full PRs, 5 upstream kernel acceptances, 3 merged, 0 certified original accepted discoveries. Read official README.md blob bc4587a4fd5119e5c22b42b5a1e2b241cae52e7f and current upstream tools/oma.sh (194 lines). join.txt could not be fetched via web or local curl (DNS failure); live desk eligibility not established for new target. No claim attempted and no lease used. Local Lean and lake not installed.

Direct PR metadata confirms 10139 and 13332 still open, merged=false. Independent full job-log read:
- https://github.com/GuillaumeBAUD-coder/open-math-agents/actions/runs/46047885906/job/140671608373 — actual accepted verdict at 19:10:39.3670774Z; standard three axioms.
- https://github.com/GuillaumeBAUD-coder/open-math-agents/actions/runs/46076886744/job/140766605596 — actual accepted verdict at 23:11:08.1876756Z; standard three axioms.
Both have zero observed Lean compiler-error lines. Acceptance is not merge or public credit. Direct metadata for 7223,7625,10062,10398,12465,12514,12591,12717,12808,12868,12938,13431,13174,14443,14393: all open and unmerged. Comments 7223 and 7625 reconfirm earlier compilation acceptance and subsequent explicit merger integration failures; no legitimate proof repair indicated. The other listed PRs had no comments returned. All-state exact canonical-ID is:pr searches (state=all) returned only the above registrations for their 15 targets; no new separate full PR observed. No authorization to bypass actual merge gate. No duplicate or shared branch edit. Earlier root reservations and foreign full-PR exclusions unchanged.

Independently read newest whole-proof logs 140781984295 (MO309485) and 140783468333 (A385478), each includes full OMA.solution or OMA.disproof standard-three-axiom output, no compiler error lines. Did not redownload artifacts or establish per-probe .exit independently here; root's receipts supply that evidence, no added verified count. No raw PR body or sensitive assignment content logged.

## New mathematical audit: OEIS A342326
Read entire official OEIS GitHub mirror seq/A342/A342326.seq, revision 67, blob 55ad04e2a00497c8bc657eaaad7471c79da1fb69. Exact original conjecture: every positive index has a positive minimum, and each exact-count family is infinite. The independent mod-25 question in the same source is already refuted by Ehrenstein (n=47 and 95); not an open target. All-state is:pr A342326 search returned no hits; TrureTuring repo search and published catalog search returned no matching dossier. History/b-file and live site brief not retrieved. No eligibility/novelty inferred.

Let T_j=j(j+1)/2. Define R(M)=# {(i,j): 1<=i<j, T_i+T_j=M}. We prove the complete infinite-family conjecture, indeed including n=0, by the explicit formula
    R((3^(2t)*5^(2n)-1)/4)=n, for all n>=0 and t>=1.

Proof: Set Q=4M+1. Each pair of triangular indices i<j gives a=j+i+1, b=j-i. Then a>b>0, a-b=2i+1>=3, and a^2+b^2=Q. Conversely such a,b with opposite parity (automatic since Q odd) recover i=(a-b-1)/2>=1 and j=(a+b-1)/2>i. Thus this is a bijection, with no ordering, zero or equal-summand loophole.

For M=(3^(2t)*5^(2n)-1)/4, Q is odd and a square. Any integer representation a^2+b^2=Q has both a and b divisible by 3: the only residues of a square mod3 are 0,1 and a sum divisible by3 forces both zero. Therefore any a>b>0 has a-b>=3. All such pairs are admissible. Jacobi's classical two-square formula gives r_2(Q)=4(d_1(Q)-d_3(Q)), counting ordered signed integer pairs. The divisors of Q are exactly 3^u5^v, 0<=u<=2t, 0<=v<=2n. Their mod4 character is (-1)^u, hence d_1-d_3=(2n+1) sum_{u=0}^{2t}(-1)^u=2n+1. Exactly four axis representations occur because Q is a positive square; equal nonzero absolute coordinates cannot occur since Q is odd. Every other orbit under signs and swapping has eight elements. Consequently R(M)=(4(2n+1)-4)/8=n. Increasing t gives strictly increasing positive integers, so every exact-count family is infinite and every positive-n minimum exists and is positive (R(0)=0).

More general exact formula, for every M>=0:
    R(M)=(D(4M+1)-[4M+1 square])/2 - [M>0 and 8M+1 square],
    D(Q)=sum_{d|Q} chi_4(d).
Indeed the axis orbit removes the equal-triangular case, and the only remaining inadmissible orbit has a-b=1 iff M=T_j for some j>0. The M=0 correction must not subtract twice.

## Prior-background gate — do not claim a new open solve
The older public formulas in A052343 (official mirror blob c996719869147b04265ca3b226173ece5c494e66, Shevelev 2009, King 2010) and A002654 (blob 66dbbb27beca8618cae291270380bf826d6af4e8, Wilson 2001) directly give the entire representation count used here. A307597 (09145c01c3b373963ef90f4ed776e5df5d0490b6) defines the exact greedy inverse. A052344, A260647, A051533, A262749, A265140/134/136/138 were checked in their official mirror entries as well. Sources: https://oeis.org/A342326 ; https://oeis.org/A052343 ; https://oeis.org/A002654 ; https://oeis.org/A307597 . The family above is an elementary consequence of longstanding published formulas. Do not add to genuine-open count or invest in a duplicate formalization. This does not assert someone previously printed this precise family; it is a conservative prior-background exclusion, not a priority accusation.

## Executed exact independent test
Local Python 3 executed the following; 100001 general formula cases and 28 family cases succeeded (200030 assertions total). Finite verification supplements the complete argument, not a substitute for it. No Lean check claimed.

```python
from math import isqrt
def tri(k): return k*(k+1)//2
def reps(m):
    return sum(1 for j in range(1,(isqrt(4*m+1)-1)//2+1)
               if (lambda z:(r:=isqrt(z))**2==z and r>2*j+1)(8*(m-tri(j))+1))
N=100000
T=[tri(i) for i in range(1,(isqrt(8*N+1)-1)//2+1)]
count=[0]*(N+1)
for i,a in enumerate(T):
    for b in T[i+1:]:
        if a+b>N: break
        count[a+b]+=1
D=[0]*(4*N+2)
for d in range(1,4*N+2,2):
    e=1 if d%4==1 else -1
    for k in range(d,4*N+2,d): D[k]+=e
for m in range(N+1):
    q=4*m+1;z=8*m+1
    assert (D[q]-(isqrt(q)**2==q))%2==0
    assert (D[q]-(isqrt(q)**2==q))//2-(m>0 and isqrt(z)**2==z)==count[m]
for n in range(7):
    for t in range(1,5):
        m=(3**(2*t)*5**(2*n)-1)//4
        assert reps(m)==n
```

Also reread prior Corneth A389000 residue note e3189ba7: Wu n=5 mod9 formula already proved by TrureTuring, not a new target. Tested two bounded candidate searches for the four missing Corneth residues: 5 million seeded signed-polynomial coefficient proposals (seed 2211726, coefficient range -50..50, slope l<=5, length bounds from digit-sum exclusion) and rational affine witnesses (a*10^L+b)/c with c in {3,7,9,11,13,21,27,33,37,41,73,81,91,101,111}, gcd(c,10)=1, ord_{c^2}(10)<=200, 1<=a<5c, -5c<=b<=5c. Neither returned a new valid scalable witness under the chosen constraints. This does not prove impossibility; do not count or restart an endless finite scan.

## RESUME HERE
Check actual 10139/13332 merge metadata and the 15 pending registered-target PRs first. If any unreserved registration actually merges, recheck exact bytes, all-state competing full-PR search, actual imported checker, and official supported coordination; complete authorized full submission in that run. Otherwise select a different genuinely unresolved source target after prior gates; do not re-formalize A342326 for novelty. Preserve all schedules and other workers. Verdict: PARTIAL — complete human math and prior exclusion, zero new official or original count.
