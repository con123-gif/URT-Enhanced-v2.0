# Submission gate and rank-two Malkoun counterexample — 28 November 2026
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2); Joseph Malkoun for the questions; TrureTuring / Omega Institute for the published cyclic and Young-subgroup witnesses, especially the seed (9-i) and block amplification. No priority claim. Human proof and exact arithmetic, not new Lean certification.

## Official gates
Read current AGENTS.md, CAMPAIGN_LEDGER.md (blob 1537e7cf3ad62ce61cc962d2c25681e8b3606a50), VERIFIED_PROOFS.json (379caca5d953a3f0a1eff550262059bdf98e0285). Manifest has 37 records. Read upstream main tools/oma.sh and lib/join.ts (6de9cd1b15df28419fcdda160e5f3abea64659dc), CONTRIBUTING_AGENTS.md. Direct join.txt and problem brief inaccessible in this environment; local curl DNS failed before HTTP. No desk request or lease made. Current public repo rules read from canonical source.
Fresh PR metadata: 7724/7815/7817 merged; 10139/13332 open. Five accepted full proofs per existing ledger; three actually merged. Zero certified original accepted discoveries.
New actual registrations merged UTC:
- 12465 A068991, 00:14:25, 8ae3b51256a84a155edf2a42e8976a1430a2c880. Foreign romechenko full PR16269 created 00:42:09, open, exact changed file proofs/oeis-a068991.lean. Withhold own duplicate; no foreign acceptance asserted.
- 12514 MO513259, 00:21:13, 2a924d1279d39808e2b10defaf310d8c3211fcac. Actual upstream statements/mo-513259.lean byte-identical to archive blob 985918a233f54071802ed53cb887bb235d737f58. All-state is:pr exact ID returned only registration. Peer verifier head 8d06a55207d547427a792611295f2287018f90dd already contains campaign/proofs/mo-513259.lean, equal to canonical full proof except the added 104-character comment describing retrigger. Do not race peer or overwrite. Old combined job140746737115 log contains target standard three axioms; not evidence of a new imported-target exit. No new submission. Need actual peer replay verdict and fresh race check.
- 12591 A396949, 00:33:54, 855bb807f61915e12b113e7a327243e30daad96b. Foreign romechenko full PR16199 created 00:38:16, open, exact changed file proofs/oeis-a396949.lean. Withhold duplicate. No foreign acceptance asserted.
Other checked statements 7223,7625,10062,10398,12717,12808,12868,12938,13431,14443,14393,13174 all open. No merge claimed from synthetic merge SHA. Current main archive head f5a408b419da26e934126ce5b710b8fe4618a0eb includes unrelated RH work, preserved.

## Prior gate and new mathematical scope
Source MO456248: https://mathoverflow.net/questions/456248/do-these-cousins-of-permanents-satisfy-the-following-inequality?noredirect=1 (main unrestricted positive constant assertion, plus explicitly stated interest in Young subgroups and rank two; no answer on retrieved page).
Source MO480580: https://mathoverflow.net/questions/480580/a-conjectured-generalization-of-marcuss-inequality (Young subgroups, lower bound by intersection size times diagonal product).
Published prior: https://the-omega-institute.github.io/trureturing-mdbook/Blueprint/D5/S3/Quantum/Matrix/MalkounSubgroupLowerBoundRefutation.html (arbitrary subgroups) and https://the-omega-institute.github.io/trureturing-mdbook/Problems/malkoun-2025-young-subgroup-conjecture-d.html (Young subgroups). Both original universal targets already refuted. The latter explicitly leaves rank-at-most-two open in its own scope, because its block-diagonal witness has rank 30. All-state exact-ID is:pr searches for both MO IDs returned zero, which is not evidence of novelty. No claim or duplicate registration. Bounded search did not recover an existing rank-two Young-subgroup extension; no exhaustive priority claim or formal certificate. Full journal text, all revisions and live briefs not independently available in this run.

## Complete rank-two extension
For m=15, use indices (j,s), j=0,...,14, s=0,1,2. In C^2 let u0=(1,0), u1=(1,1), u2=(1,i). Take W with columns W_(j,s)=u_s, and H=W*W, so H is Hermitian PSD and rank exactly 2 (u0,u1 independent). Unlike the published block-diagonal witness, all cross-block Gram entries are retained. G is the product over blocks of S_{0,1} fixing 2, K the product of S_{1,2} fixing 0. These are full Young subgroups of the partitions indicated, and their intersection is trivial (each block's two subgroups intersect trivially).
For every sigma in G and tau in K and every (j,s), sigma(j,s) and tau(j,s) have the SAME block j. Hence no entry between distinct blocks occurs in the cross sum. Replacing the block diagonal H with the rank-two repeated Gram leaves every summand unchanged. Summing over the independent choices in each block gives the product of 15 seed cross sums. The seed Gram A=[[1,1,1],[1,2,1+i],[1,1-i,2]] under V*V convention (conjugate first vector). The four terms are 4,2,2,1-i; the cross sum is 9-i. (The off-diagonal pair's sign may be reversed by conjugating all conventions, with no effect on the final real part.)
Thus Re f(H)=Re(9-i)^15=-20078071648128 < 0, whereas diagonal product is 4^15=1073741824>0. This refutes BOTH the positive-constant lower bound and the Young-subgroup intersection lower bound even for exact complex rank two, with positive diagonal. This addresses the explicit special interest in MO456248, not a new original universal target. No inference to tree-specific geometric Conjecture C, where partitions and directions are constrained.

## Distinct directions variant, exact certificate
Take q=100 and use columns (q,j), (q,q+j), (q,j+iq) in block j=0,...,14. All 45 second coordinates are distinct, and the first coordinate is the same nonzero number, so all projective directions distinct. First two columns independent, so Gram rank exactly two. The same factorization by groups holds even though each block's seed differs. Executed Gaussian integer arithmetic below verifies strictly negative real part. The repeated-vector theorem is already an exact mathematical proof, and this additional finite witness is independently checkable. Earlier tests q=16 and32 did not yield negative real part (negative controls); q=100 and1000 did. No minimal dimension claim.

```python
from itertools import permutations, product
from math import prod
add=lambda a,b:(a[0]+b[0],a[1]+b[1])
mul=lambda a,b:(a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0])
conj=lambda a:(a[0],-a[1])
def gp(xs):
    z=(1,0)
    for x in xs: z=mul(z,x)
    return z
def gs(xs):
    z=(0,0)
    for x in xs: z=add(z,x)
    return z
G=[p for p in permutations(range(3)) if p[2]==2]
K=[p for p in permutations(range(3)) if p[0]==0]
assert len(set(G)&set(K))==1
V=[[(1,0),(0,0)],[(1,0),(1,0)],[(1,0),(0,1)]]
A=[[gs(mul(conj(x),y) for x,y in zip(a,b)) for b in V] for a in V]
z=gs(gp(A[s[i]][t[i]] for i in range(3)) for s in G for t in K)
assert z==(9,-1)
assert gp([z]*15)==(-20078071648128,-224842906547072)
for m in range(1,4):
    Gm=list(product(G,repeat=m)); Km=list(product(K,repeat=m))
    assert gs(gp(A[s[j][i]][t[j][i]] for j in range(m) for i in range(3))
              for s in Gm for t in Km)==gp([z]*m)
for Q in [16,32,100,1000]:
    V=[[(Q,0),t] for j in range(15) for t in [(j,0),(Q+j,0),(j,Q)]]
    assert len({v[1] for v in V})==45
    H=[[gs(mul(conj(x),y) for x,y in zip(a,b)) for b in V] for a in V]
    assert all(H[i][j]==conj(H[j][i]) for i in range(45) for j in range(45))
    assert all(H[i][i][0]>0 and H[i][i][1]==0 for i in range(45))
    assert gp([V[0][0],V[1][1]])==(Q*Q,0) and V[0][1]==(0,0)
    zs=[gs(gp(H[3*j+s[i]][3*j+t[i]] for i in range(3))
           for s in G for t in K) for j in range(15)]
    zz=gp(zs)
    assert (zz[0]<0)==(Q>=100)
    print(Q,zz[0]<0)
```

Actual executed outputs: seed (9,-1), real power -20078071648128, diagonal 1073741824; q=16 false,32 false,100 true,1000 true. Also independently evaluated the prior MO456248 cyclic witness (seven powers each of arrays (1,4,6,2,5,3,0) and (1,6,0,2,5,3,4), Gram columns (1,2),(3,2),(1,-2),(3,2),(1,0),(1,-3),(3,-2)): 49 products sum -23944, diagonal product549250. All checked using exact integer/Gaussian-integer arithmetic, no float, no Lean claim.

RESUME HERE: inspect peer's actual MO513259 imported-target checker exit/verdict and fresh exact-ID PRs. If peer has no active ownership and no competing proof, use current official coordination and submit one proof after actual imported check. If already owned, switch to next merged registration. Rank-two extension is not a distinct accepted original target; preserve as a prior-aware mathematical refinement. No changes to schedules or RH.
