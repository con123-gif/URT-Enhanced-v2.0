# A372561 independent carry audit and submission race gate — 28 November 2026

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Source conjectures: Antti Karttunen, OEIS A372561. Classical Jacobsthal identity, binary carry arithmetic and existing campaign certificate acknowledged. No priority claim.

## Fresh official state
Main CAMPAIGN_LEDGER blob 1537e7cf3ad62ce61cc962d2c25681e8b3606a50 and VERIFIED_PROOFS blob 379caca5d953a3f0a1eff550262059bdf98e0285 read. Canonical count 37 whole certificates; 5 upstream full-proof checker acceptances, 3 merged full proofs, 0 certified original accepted resolutions. Full PRs 10139 and 13332 still open/unmerged on fresh direct PR metadata. Read current public /join page (literal /join.txt inaccessible in this runtime) and upstream main tools/oma.sh. Direct shell DNS unavailable and no local Lean. No lease acquired or inferred.

Three additional own statement registrations actually merged since the previous lane report:
* A181674 #12808 at 01:03:13Z, merge e966875862d38312e5151c0a5646e75731a29adb; preceding foreign full #16995.
* A372561 #12868 at 01:12:45Z, merge 70d26ba6d7d6480f1c4073e411fc484d02afc781.
* A372556 #12938 at 01:22:37Z, merge 7fcbb33677e7c1d3ff37bcd7144556f854f0cc7d; preceding foreign full #17012.
MO487180 #12717 also merged at 00:52:51Z, merge 42f4eff64f647ade5de3dc7254aba6ea0a638260, foreign full #16447. MO513259 #12514 merged at 00:21:13Z, foreign full #16854. Foreign #16269 A068991 and #16199 A396949 also contain full exact-target proof/disproof submissions. Their code endpoints and target scope read; no independent foreign kernel acceptance asserted. Do not duplicate them.

A372561 main registered statement is byte-identical to archived source (Git blob 804c4fae0501a67e1182b334649e2fb8ada54d01). Fresh all-state search with is:pr returned registration #12868 only. However, another campaign worker has ALREADY queued the exact imported proof fixture at fork commit dad8786dc7d4bb9cf7ec37a74f1bd23897170caa (01:24:27Z). Fixture campaign/proofs/oeis-a372561.lean exactly equals archived proof, blob 804b4309f0c329665ede7e6a272658740f8c44ae. No duplicate fixture, claim, PR or shared ref modification. This run has not independently observed an imported checker verdict for that commit; connector's PR-triggered workflow lookup returned no runs and does not establish whether the push-triggered checker ran. Earlier standalone kernel pass is documented in A372561_VERIFICATION_RECEIPT.json, run 46061923315/job 140717982673. No new Lean pass claimed.

## Independent exact mathematical audit
For J_i=(2^i-(-1)^i)/3, with indices i>=2, a representation of N with e even-index and o odd-index coins is equivalent to a sum of e+o powers 2^i, of those parities, of total P=3N+e-o. Necessarily P is a nonnegative multiple of 4. All J_i are odd, so e+o has parity N.

Write p=P/4 in binary. At position j let c be the incoming carry and x the multiplicity of index j+2; x consumes even or odd residual count according to j parity. The required equation is c+x=b_j+2c', where b_j is bit j of p and c' is a nonnegative integer. Start with carry zero and the prescribed counts. At the bit length of p, accept exactly if carry and both residual counts vanish. Every accepted path gives a representation by summing the digit equations with weights 2^j; every valid representation gives such a path by ordinary carries. No term with a position at or above the bit length can occur, since its positive value exceeds p. For p=0 the zero-count case is handled by the same terminal rule. Searching r in increasing order of the correct parity and e=0,...,r is therefore an exact minimum-cost algorithm whenever a representation within the search limit exists. This is independent of the archive's base-4 weight lower-bound method.

Actual sandbox Python execution: 12,001 comparisons with conventional minimum-coin dynamic programming (N=0..12000); all 41 noninitial reduced-Collatz orbit cores checked for E=1..32; 1,283 source-reachable cases E>=v all agree; 12 out-of-domain E>=2 also agree. Of the 17 out-of-domain E=1 cases, exactly one disagrees: orbit index 29, y=911, preceding valuation v=3, expected antidiagonal cost 9 but lift(1,911)=3645 has cost 7. Explicit seven-coin witness 1+5+11+43+171+683+2731=3645; independent conventional minimum-coin DP confirms 7. This is not a counterexample to the source: E=1 is unreachable on that antidiagonal. It demonstrates why the valuation restriction cannot be dropped. All 128 fixed-point-tail checks pass; symbolic tail identity lift(E,1)=J_(2E+2) proves the tail cost is 1 for every E>=1. Finite checks do not replace the existing symbolic uniform-lift proof.

Reproduction (Python 3, executed):
```python
from functools import lru_cache
from collections import Counter

def can(P,e,o):
    if P<0 or P%4: return False
    p=P//4
    @lru_cache(None)
    def f(j,c,a,b):
        if j==p.bit_length(): return c==a==b==0
        bit=(p>>j)&1
        for x in range((b if j%2 else a)+1):
            z=c+x-bit
            if z<0 or z%2: continue
            if f(j+1,z//2,a-(x if j%2==0 else 0),b-(x if j%2 else 0)): return True
        return False
    return f(0,0,e,o)

def cost(n,limit=20):
    for r in range(n%2,limit+1,2):
        for e in range(r+1):
            if can(3*n+2*e-r,e,r-e): return r
    return None

N=12000
js=[1,3]
while js[-1]<=N: js.append(js[-1]+2*js[-2])
dp=[0]+[N+1]*N
for n in range(1,N+1): dp[n]=1+min(dp[n-j] for j in js if j<=n)
for n in range(N+1): assert cost(n)==dp[n], (n,cost(n),dp[n])
orbit=[27]; vals=[]
while orbit[-1]!=1:
    a=3*orbit[-1]+1; v=(a&-a).bit_length()-1; vals.append(v); orbit.append(a>>v)
expected=[5,5,5,5,3,5,5,3,5,5,5,7,5,5,5,7,5,7,7,5,5,7,9,7,7,7,9,7,9,3,5,3,5,5,5,5,3,5,3,1,1]
assert len(orbit)==42 and len(expected)==41
assert expected[11]==7 and expected[28]==9
counts=Counter(); e1dif=[]
for s,(y,v,T) in enumerate(zip(orbit[1:],vals,expected),1):
    for E in range(1,33):
        n=((3*y+1)*4**E-1)//3
        actual=cost(n,11)
        if E>=v:
            assert actual==T,(s,y,v,E,T,actual)
            counts['required']+=1
        elif E==1:
            counts['outside E1']+=1
            if actual!=T:e1dif.append((s,y,v,T,actual))
        else:
            counts['outside E>=2']+=1
            assert actual==T
for E in range(1,129): assert cost((4**(E+1)-1)//3,1)==1
print('small independent DP checks',N+1,'orbit',orbit,'valuations',vals,'lift checks',dict(counts),'out-of-domain E=1 differences',e1dif,'tail checks',128)
assert dp[3645]==7
assert sum([1,5,11,43,171,683,2731])==3645
```

## RESUME HERE
A372561 current peer fixture must finish actual unmodified checker, inspect target axioms/exit, refresh official PR race and coordinate publication with owning worker. Do not replace its fixture or duplicate its submission. Watch 10139/13332 for actual merge and public credit. This independent mathematical audit adds zero distinct accepted problems. Campaign ledger untouched to preserve concurrent edits.
