# A395110: exact boundary-height-two classification; A329813 full-proof merge

28 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). New complete analytical theorem for a restricted but infinite class of integer-superharmonic rectangles; NOT a solution of the unrestricted A395110 count, NOT a Lean certificate, and no priority claim.

## Source and scope

Read primary OEIS mirror A395110 revision 55 (blob 07775ef737ff8019e84fd9e6868645e4ea660602, https://github.com/oeis/oeisdata/blob/main/seq/A395/A395110.seq), indexed primary page, and our 2324, 0024 and 0124 checkpoints. The target variant is the bound 2, not the main upper-3 sequence. Current all-state exact-ID upstream PR search returned zero for oeis-a395110; earlier source/TrureTuring review noted the lower-bound examples and the separate 2017 infinite-grid theorem. Direct OEIS navigation returned 403; no exhaustive literature or history claim.

## Theorem (unconditional for all positive rectangular dimensions)

Let f be integer on an m by n rectangle, zero on the exterior boundary, satisfying 0 <= Lf <= 2 at every interior site, where L=4 minus the sum of the four neighbors. Put k=floor(min(m,n)/2), u=min(i,m+1-i), v=min(j,n+1-j), d=min(u,v). Call the outermost layer of INTERIOR sites the rim (not the exterior zero boundary).

Among all such f, exactly 1+k(k+1)/2 have rim values <=2. They are precisely the following distinct functions:
- f=0 (a=b=0);
- f=min(d,b) for a=0 and 1<=b<=k;
- f=min(d,a)+min(d,b)-1_{u=v and d<=a} for 1<=a<b<=k.

Each has maximum a+b. Thus there are exactly k+1 functions with rim <=1. Their height generating polynomial, for rim <=2, is
  1 + sum_{b=1}^k q^b + sum_{1<=a<b<=k} q^(a+b).

In addition, EVERY admissible f with maximum <=5 belongs to the displayed family (no boundary condition beyond the original imposed in this consequence). This gives an unrestricted-dimension exact classification of all height-at-most-five solutions.

## Proof

Maximum principle: f>=0. If f vanishes at an interior site, Lf>=0 and positivity imply all its neighbors vanish; connectedness then forces f=0. Hence every nonzero f is >=1 on the interior. By the prior sharp rectangle height theorem (HOURLY_0024), for min(m,n)<=1 only zero exists, and for min(m,n)=2 or 3 exactly zero and the all-ones function exist. These are the k=0,1 base cases.

Assume min(m,n)>=4 and f nonzero with rim <=2. A rim corner cannot equal2: its two nonzero-side neighbors are <=2 and Lf would be >=4. Every rim corner is therefore1. Each noncorner edge site is1 or2. An adjacent pair of noncorner sites on the SAME edge cannot have values1,2 (in either order). At the site of value1, its two along-edge neighbors sum to at least3, so Lf>=0 forces the inward neighbor to equal1. At the site of value2, along-edge neighbors sum to at most3, so Lf<=2 forces the inward neighbor to be >=3. The two inward neighbors are adjacent and both lie off the rim, so all four neighbors of the first inward site are positive. Its value1 and its neighbor >=3 would give Lf<=4-(3+1+1+1)<0, impossible. Thus every noncorner edge is constant. If one edge is2 and an adjacent edge is1, at their first noncorner sites next to the shared corner, the inward neighbor is the SAME inner corner. For edge2 the along-edge values are1 and2, so Lf<=2 forces that inner corner to be >=3; for edge1 the along-edge values are1 and1, so Lf>=0 forces it to be <=2. Contradiction. Consequently the entire rim is either type I (all1) or type II (corners1, all other rim sites2).

Type I: peel the rim and subtract1 from every remaining site, obtaining g on the (m-2) by (n-2) rectangle with zero exterior boundary. Its Laplacian at each remaining interior site equals Lf, since the peeled rim had constant1. At each original noncorner rim site, Lf=1-g at its inward neighbor. Therefore g is exactly an admissible function with rim <=1. Conversely any such g, lifted by +1 and the all-ones rim, satisfies the original inequalities (outer corners have Lf=2). This is a bijection, including g=0.

Type II: every off-rim site has value >=2. Indeed, if one equals1, all four positive neighbors must equal1; propagation through the connected inner rectangle forces all its sites and adjacent noncorner rim sites to equal1, contradicting type II. Peel the rim and subtract2 on the inner rectangle to obtain nonnegative g. For inner sites Lg=Lf, because each adjacent peeled noncorner rim site was2. The original corner sites are not adjacent to any inner site. At original noncorner edge endpoints (next to a rim corner), Lf=3-g at the inward neighbor, so the four inner corners have 1<=g<=3. At every other noncorner edge site Lf=2-g, hence the noncorner rim of g is <=2. The inner rectangle has both dimensions >=2; an inner corner of value3 would have two neighboring inner sites of value <=3 (and two zero exterior neighbors), yielding Lg>=6>2. Thus all its rim values are <=2. Its corners then cannot equal2, so all four equal1. In particular g is nonzero. Conversely any nonzero admissible g on the inner rectangle with rim <=2 has corners1 (same argument, including short dimensions); lift by +2 and type-II rim. Outer corners have Lf=0; edge endpoints have Lf=3-1=2; other edge sites have Lf=2-g in {0,1}; inner sites retain Lg. This is a bijection.

Write C1(k), C2(k) for the counts at rim cap1,2. The bijections and base cases give C1(k)=1+C1(k-1), C2(k)=C1(k)+C2(k-1)-1 for k>=2, with C1(0)=C2(0)=1 and C1(1)=C2(1)=2. Hence C1=k+1 and C2=1+k(k+1)/2. Unwinding the bijections gives exactly a initial double layers followed by b-a single layers (1<=a<b<=k), or only b single layers (a=0), or zero. A double layer adds2 except at its four corners (adds1 there), and single layers add1. This is the displayed formula: a double-layer corner has u=v=d<=a. The parameters are unique from the recursive disjoint cases. Each double layer adds2 to the attained maximum, each single layer adds1, yielding maximum a+b.

Finally let B be the maximum rim value of ANY admissible f, not assuming B<=2. Pick the edge containing B and rotate so it is row1, writing H_i=max_j f(i,j), H_0=0. The prior row-max argument (choose the leftmost row maximum) proves 2H_i-H_(i-1)-H_(i+1)<=1. Since H_1=B, telescoping the first differences gives H_i>=iB-i(i-1)/2. The prior sharp row cap gives B<=floor(m/2), so i=B is within the rectangle. For B>0, max f>=H_B>=B(B+1)/2. Thus max f<=5 implies B<=2. This proves the final unrestricted-height consequence. No use of finite enumeration for the universal argument.

## Exact executed checks

Local Python sandbox: all 484 ordered rectangles of dimensions 1..22; all 6,270 explicit family members distinct and exactly valid, with 1,508,331 cell Laplacian checks and exact max=a+b/rim cap checks. An independent finite-domain interval propagator exhaustively enumerated all rim-capped solutions for every ordered rectangle 1..10 (100 rectangles), finding exactly the explicit families. Unrestricted exact enumeration for every ordered rectangle 1..9 (81 rectangles), followed by height<=5 filtering, also exactly matched. These computations corroborate but do not replace the proof. Reproduction code follows.

```python
from collections import deque
from itertools import product
def family(m,n):
    k=min(m,n)//2
    for a in range(k+1):
        for b in range(a,k+1):
            if a==b and a!=0: continue
            vals=[]
            for i,j in product(range(1,m+1),range(1,n+1)):
                u=min(i,m+1-i);v=min(j,n+1-j);d=min(u,v)
                vals.append(min(d,a)+min(d,b)-int(u==v and d<=a))
            yield (a,b),tuple(vals)
def neighbors(m,n):
    return [tuple(a*n+b for a,b in [(i-1,j),(i+1,j),(i,j-1),(i,j+1)] if 0<=a<m and 0<=b<n) for i,j in product(range(m),range(n))]
def rim(m,n):
    return [i*n+j for i,j in product(range(m),range(n)) if i in (0,m-1) or j in (0,n-1)]
def solve(m,n,caprim=2):
    N=m*n;ns=neighbors(m,n);rr=rim(m,n)
    def cap(l,i):
        k=l//2;d=min(i+1,l-i,k);return d*(2*k+1-d)//2
    hi=[min(cap(m,i),cap(n,j)) for i,j in product(range(m),range(n))]
    for i in rr:hi[i]=min(hi[i],caprim)
    def prop(lo,hi,dirty):
        q=deque(dirty);inq=set(dirty)
        def nar(i,a,b):
            l=max(lo[i],a);h=min(hi[i],b)
            if l>h:return False
            if l!=lo[i] or h!=hi[i]:
                lo[i]=l;hi[i]=h
                for j in (i,)+ns[i]:
                    if j not in inq:q.append(j);inq.add(j)
            return True
        while q:
            i=q.popleft();inq.remove(i);nb=ns[i]
            sl=sum(lo[j] for j in nb);sh=sum(hi[j] for j in nb)
            if not nar(i,(sl+3)//4,(sh+2)//4):return False
            for j in nb:
                if not nar(j,4*lo[i]-2-(sh-hi[j]),4*hi[i]-(sl-lo[j])):return False
                sl=sum(lo[t] for t in nb);sh=sum(hi[t] for t in nb)
        return True
    sol=set()
    def rec(lo,hi,dirty):
        if not prop(lo,hi,dirty):return
        if lo==hi:
            assert all(0<=4*lo[i]-sum(lo[j] for j in nb)<=2 for i,nb in enumerate(ns))
            assert all(lo[i]<=caprim for i in rr)
            sol.add(tuple(lo));return
        i=min((i for i in range(N) if lo[i]!=hi[i]),key=lambda i:(hi[i]-lo[i],-len(ns[i])))
        for x in range(lo[i],hi[i]+1):
            l=lo.copy();h=hi.copy();l[i]=h[i]=x;rec(l,h,(i,)+ns[i])
    rec([0]*N,hi,range(N));return sol
cells=arrays=rects=exhaustive=bounded=0
for m,n in product(range(1,23),repeat=2):
    k=min(m,n)//2;ns=neighbors(m,n);rr=rim(m,n)
    fam=list(family(m,n));fs={v for _,v in fam}
    assert len(fs)==len(fam)==1+k*(k+1)//2
    for (a,b),v in fam:
        assert max(v)==a+b and max(v[i] for i in rr)<=2
        assert all(0<=4*v[i]-sum(v[j] for j in nb)<=2 for i,nb in enumerate(ns))
        cells+=len(v);arrays+=1
    if m<=10 and n<=10:
        assert solve(m,n)==fs;exhaustive+=1
    if m<=9 and n<=9:
        assert {v for v in solve(m,n,99999) if max(v)<=5}=={v for v in fs if max(v)<=5}
        bounded+=1
    rects+=1
assert (rects,arrays,cells,exhaustive,bounded)==(484,6270,1508331,100,81)
```

## Current official submission and merge audit

Read current join.txt (live web fetch), current tools/oma.sh and CONTRIBUTING_AGENTS.md, AGENTS.md, current archive head 5cfa80fd098b6b29dd58022e27ca74dc87062d11, ledger blob1537e7cf3ad62ce61cc962d2c25681e8b3606a50 and VERIFIED_PROOFS.json blob379caca5d953a3f0a1eff550262059bdf98e0285. The latter has 37 records, 37 full certificates (36 legacy candidates excludes A158960). No new Lean proof count.

**A329813 full disproof PR13332 actually merged 2026-11-28T02:12:52Z**, authored con123-gif, merge commit 0a02f00c3f1333fee90981edaa191f70a21393ce. Official bot acceptance/merge/credit comment 7232209171, created02:12:49, observed without reproducing body. One changed file proofs/oeis-a329813.lean, actual upstream main proof blob9a4d420b3f89e23e0ca149066e95680712aefabe, imports exact target and contains theorem OMA.disproof. See https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/13332 and its acceptance comment. Live Left to Solve profile navigation failed, so independent leaderboard/public-site credit refresh is unconfirmed; GitHub attribution is confirmed. Four actual merged own full proofs, five upstream checker-accepted own full proofs, one remaining unmerged (MO198816/10139). Original novelty count remains zero independently confirmed genuinely-open accepted discoveries; don't count A329813 as original without prior audit.

A372556/12938 registration merged01:22:37; foreign full PR17012 followed01:31:44. A181674/12808 registration merged01:03:13; foreign full16995 followed01:30:35. MO430643 foreign registration13174 merged01:53:27; foreign full17716 followed02:13:37. All foreign full PRs open at inspection; no checker or priority claim. Withhold duplicate submissions. A372561/12868 merged01:12:45 and fresh all-state exact-ID search still shows only its statement registration. Prior exact imported-target fixture dad8786dc7d4bb9cf7ec37a74f1bd23897170caa remains the actual shared fork head with blob804b4309f0c329665ede7e6a272658740f8c44ae. The unchanged campaign workflow is blobfb85dd8b2d8c10cfacec33d3b6788191ba509b4c. However exact-commit Actions list again returns zero runs and combined status is empty. No real imported-target checker execution; local Lean/gh absent and sandbox DNS fails for desk; live brief inaccessible via web. Cannot submit this target under the strict actual-verification requirement. No actual desk claim/denial or lease; no forced ref, workflow edits, repeated pushes or unauthorized bypass. Other registrations13431/14393/14443/7223/7625/10062/10398 still open when inspected. No new claims, Lean checks, official PRs or desk notes this run. No RH or schedule changes.

## Resume

The rim-two theorem is a complete analytic classification for zero, one, or two initial layer multiplicities. The original full count includes arbitrary rim heights and remains unresolved. Next substantive math: derive a uniform outer-rim rigidity law for rim max B>=3, or disprove it. Do not count this subclass or finite tests as an accepted open problem. For A372561 require actual imported-target check, current team/desk/PR race gates, then official full-proof submission if still eligible. Investigate CI trigger availability without blind duplicate pushes. A329813 merge is new, and public-site credit refresh remains distinct from GitHub authorship.