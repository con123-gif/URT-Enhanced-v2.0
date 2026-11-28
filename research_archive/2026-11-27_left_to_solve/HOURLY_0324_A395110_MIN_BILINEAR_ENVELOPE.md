# A395110: explicit min-bilinear envelope for every binary central curvature word

28 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). **Complete analytical construction theorem, not an upper-bound proof for the full A395110 conjecture, not Lean checked, not an accepted new open resolution.** Giedrius Alkauskas's OEIS entry already reports the square lower bound; no priority claim for this new-to-our-archive formula or the count.

## Exact theorem

On an m-by-n integer rectangle with zero exterior boundary, write k=floor(min(m,n)/2), u=min(i,m+1-i,k), v=min(j,n+1-j,k). For every binary word b_1,...,b_k put

H(t)=sum_{a=1}^k b_a min(t,a),   0<=t<=k.

Then the following explicit formula defines an admissible integer function for the upper-Laplacian-two variant of A395110:

    f(i,j)=min_{0<=t<=min(u,v)} [ H(t)+(u-t)(v-t) ].

Every directional second difference separately belongs to {0,1}, so 0<=Lf<=2. The central column/row is precisely H of the other coordinate. The outside interior rim on any side is min(B,v) or min(B,u), where B=sum b_a. The maximum is H(k)=sum a b_a. Hence there are at least 2^k distinct solutions, of which exactly binomial(k,B) in this explicit family have rim maximum B. Their height generating polynomial is product_{a=1}^k(1+q^a). The formula includes all previously classified rim<=2 solutions. Unlike enumeration, it constructs a solution in arbitrary dimensions from any binary word without solving a grid-wide constraint problem.

## Proof

For k=0 the formula is identically zero. Otherwise set s_t=H(t)-H(t-1)=sum_{a>=t} b_a. The sequence s_t is nonincreasing with drops in {0,1}, s_{k+1}=0, and s_t<=k-t+1. Define c_t=s_t+2t-1 for 1<=t<=k; consecutive c's increase by either 1 or 2. Write F_t(u,v)=H(t)+(u-t)(v-t). Its forward t-difference is F_t-F_{t-1}=c_t-u-v. Thus the largest minimizer is t=min(u,v,q(u+v)), where q(S)=#{1<=t<=k:c_t<=S}. The minimum formula is symmetric and vanishes when either argument is zero.

For a fixed v between 1 and k, let G(u)=min_{0<=t<=v} F_t(u,v), allowing all those t even when t>u. Put q_v(S)=min(v,q(S)). The largest minimizing index for G is q_v(u+v); as u increases by 1 this index increases by at most 1. If it increases, the new c_t equals u+v+1, so the old and new lines tie at u+1. Consequently

    G(u+1)-G(u)=v-q_v(u+v).

These increments are nonnegative and drop by at most one per step. Now let R be the largest 0<=u<=v for which q_v(u+v)>=u (u=0 always works). For u>=1 this is equivalent to s_u+u-1<=v, a prefix condition because s_u decreases by at most one each step. For 0<=u<=R the constrained formula f(u,v) is H(u); for u>=R it is G(u). Indeed for u>R with u<=v, q_v(u+v)<u, and for u>v the constraint is already t<=v. At R both formulas agree: if R=v this is immediate, while if R<v then c_{R+1}>R+v+1 and q_v(R+v)=R.

The H increments are s_u, nonnegative and with drops 0 or 1. At a nontrivial junction 1<=R<v, the defining prefix condition and its failure at R+1 imply s_R<=v-R+1 and s_{R+1}>=v-R+1. Monotonicity makes both equal v-R+1. The first G increment is v-R=s_R-1. If R=v, then s_R<=1 and the subsequent G increments are zero. If R=0 there is no junction to check. Thus for fixed v all increments in u are nonnegative and drop by at most one.

The last increment f(k,v)-f(k-1,v) is at most one: if the H part reaches k, it equals s_k<=1; otherwise it is the G increment v-q_v(k-1+v), which is <=1 because for v>=2 the bound s_{v-1}<=k-v+2 gives c_{v-1}<=k+v-1. For v=1 the conclusion is automatic. For v=0 the function is identically zero. Reflection and insertion of the central plateau by u=min(i,m+1-i,k) preserve the directional second-difference bound: before the plateau it is the drop of successive increments, at its edges it is the last increment (0 or 1), and inside it is zero. There are at least two equal central positions whenever k>0. Symmetry proves the same for v. The boundary convention is zero and agrees with u=0 or v=0.

Finally c_v<=k+v implies q_v(k+v)=v and f(k,v)=H(v). Thus every bit can be recovered from the central profile via b_t=s_t-s_{t+1}; distinct words give distinct arrays. Monotonicity gives maximum H(k). At u=1 the minimum contains exactly t=0 and t=1 for v>=1, giving f(1,v)=min(v,H(1))=min(v,B). This proves all claimed construction and family-count identities. When B<=2, the previous complete rim-two classification (HOURLY_0224_A395110_BOUNDARY_TWO_CLASSIFICATION_AND_A329813_MERGE.md) counts exactly the same family, so in that subclass the formula is exhaustive. The full upper-bound and automatic symmetry/directional curvature remain unproved.

## Executed local Python checks

Actual results: 324 ordered rectangles with dimensions 1..18, 8579 distinct constructed arrays, 1805815 cells (two independent directional inequalities per cell). For all 100 ordered rectangles with dimensions 1..10 the full explicit family equals the complete exact finite-domain enumeration with no symmetry restriction. The enumerator is the one in the previous HOURLY_0224 note, called as solve(m,n,99999) (rather than its default rim cap of 2). The exact test script below uses that solve and neighbors (or the following equivalent independent interval-propagation enumerator). These checks support the construction, not an unrestricted upper bound.

```python
from itertools import product
from collections import deque

def neighbors(m,n):
    return [tuple(a*n+b for a,b in [(i-1,j),(i+1,j),(i,j-1),(i,j+1)]
                  if 0<=a<m and 0<=b<n)
            for i,j in product(range(m),range(n))]

def solve(m,n):
    N=m*n; ns=neighbors(m,n)
    def cap(l,i):
        k=l//2;d=min(i+1,l-i,k);return d*(2*k+1-d)//2
    hi=[min(cap(m,i),cap(n,j)) for i,j in product(range(m),range(n))]
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
            sol.add(tuple(lo));return
        i=min((i for i in range(N) if lo[i]!=hi[i]),key=lambda i:(hi[i]-lo[i],-len(ns[i])))
        for x in range(lo[i],hi[i]+1):
            l=lo.copy();h=hi.copy();l[i]=h[i]=x;rec(l,h,(i,)+ns[i])
    rec([0]*N,hi,range(N));return sol

def env(m,n,bits):
    k=min(m,n)//2
    assert len(bits)==k
    H=[0]+[sum(min(t,a)*bits[a-1] for a in range(1,k+1)) for t in range(1,k+1)]
    F=[[min(H[t]+(u-t)*(v-t) for t in range(min(u,v)+1)) for v in range(k+1)] for u in range(k+1)]
    assert all(F[k][v]==H[v] for v in range(k+1))
    assert all(F[1][v]==min(sum(bits),v) for v in range(k+1)) if k else True
    return tuple(F[min(i+1,m-i,k)][min(j+1,n-j,k)] for i in range(m) for j in range(n))

rects=arrays=cells=comp=0
for m,n in product(range(1,19),repeat=2):
    k=min(m,n)//2;fam=set()
    for bits in product((0,1),repeat=k):
        a=env(m,n,bits);assert a not in fam;fam.add(a)
        def val(i,j):return a[i*n+j] if 0<=i<m and 0<=j<n else 0
        for i,j in product(range(m),range(n)):
            c=val(i,j)
            assert 0<=2*c-val(i-1,j)-val(i+1,j)<=1
            assert 0<=2*c-val(i,j-1)-val(i,j+1)<=1
            cells+=1
        arrays+=1
    assert len(fam)==2**k
    if m<=10 and n<=10:
        assert fam==solve(m,n);comp+=1
    rects+=1
assert (rects,arrays,cells,comp)==(324,8579,1805815,100)
```

## Submission gate and exact next step

Read current join.txt, current tools/oma.sh, repository AGENTS.md, latest ledger blob 2add1e4339932afa79bd58cea1a7d927925c4c8a, verified-proof index d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b, source OEIS official mirror A395110 revision55, and latest relevant checkpoints. Latest observed repository head c96035906ca4d06387e6cf7b64cf6d6a986ce9a0 (concurrent RH work untouched). Source direct OEIS 403; no comprehensive novelty audit. Current PR metadata confirms 13332 merged 02:12:52 UTC, 10139 remains open; the ledger's counts remain 37 complete archived certificates, 5 upstream checker acceptances, 4 merged formal proofs, 0 independently certified original accepted discoveries. Registrations 13431/14393/14443/7223/7625/10062/10398 remain open. A372561 registration12868 merged 01:12:45 UTC; all-state exact-ID search returns only that registration. The prior fixture commit dad8786dc7d4bb9cf7ec37a74f1bd23897170caa still has no visible PR-triggered workflow runs or combined status; the connector's workflow enumeration explicitly filters to PR triggers and cannot exclude push-triggered execution. Browser Actions branch view failed; local Lean and gh absent and DNS fails. Current desk brief inaccessible. No actual fresh imported-target execution or eligible lease verified, so no claim or official submission; no false assertion of an outage response or absence of any run. No new Lean checks, new official PRs or notes. Do not duplicate existing claims or change workflows. Next action for A372561 is obtain actual checker log of the existing fixture or a legitimately authorized executed imported-target check; then fresh race/team gate and submission. Next A395110 mathematical action: prove or refute that every admissible integer array equals its min-bilinear envelope for a binary central profile; focus on a comparison theorem rather than extending finite range. The formula provides exact barriers for all possible profiles.
