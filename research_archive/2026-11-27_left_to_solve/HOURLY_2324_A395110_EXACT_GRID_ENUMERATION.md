# A395110: exhaustive finite-grid count and central curvature encoding

2026-11-27. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2).
**Partial research, not a solution of the infinite conjecture.** No Lean certificate, lease, official PR, or priority claim.

Source: Giedrius Alkauskas, https://oeis.org/A395110 (current source read). Count integer arrays f with zero boundary and 0 <= 4f - sum(neighbors) <= 2. The OEIS main sequence instead uses upper bound 3; we did not conflate them. Source conjectures 2^floor(n/2) solutions, and already reports that many symmetric examples. Read FRESH_SCOUTS_AFTER_A372561.md and its cited prior triage: earlier n<=3 finite checks and MILP explorations did not constitute exhaustive certificates. Fresh exact-ID upstream PR search returned zero; that is not novelty or live eligibility clearance. Cited Levine/Pegden/Smart 2017 work concerns a different infinite-grid setting; no claim of exhaustive literature coverage.

## Exact finite enumeration, with completeness argument

Let L be the n-by-n square-grid Dirichlet matrix (dimension n^2), diagonal 4, off-diagonal -1 for adjacent interior vertices. The discrete maximum principle gives f>=0. L is invertible: a harmonic function with zero boundary cannot have a strictly positive maximum or strictly negative minimum (propagate equality to the boundary). Thus u=2 L^{-1}1 is a rational upper bound for every admissible f, by the same maximum principle applied to u-f. Enumerate integer domains [0,floor(u_i)]. For each site, if its neighbor domain sums are Slo, Shi, narrow its own domain to [ceil(Slo/4), floor((Shi+2)/4)]. For a neighbor j, narrow its domain to [4 lo_i-2-sum(other upper bounds), 4 hi_i-sum(other lower bounds)]. These are logical consequences of the original inequalities; they cannot delete any feasible integer vector. Empty intervals reject a branch. Otherwise branch over every integer value of one unfixed variable, partitioning the remaining feasible set disjointly. Finite domains imply termination. Every singleton leaf is independently checked against the literal inequalities. No assumed symmetry or guessed empirical bound enters enumeration.

For a second independent implementation, use U(i,j)=min(i(n+1-i),j(n+1-j)) instead of solving a linear system. It vanishes on the boundary and satisfies LU>=2: choose the minimizing one-dimensional quadratic at the center; every neighbor of U is at most that quadratic, whose Dirichlet Laplacian there is at least 2. The comparison principle gives f<=U. Propagate using generic signed linear inequalities with full sweeps and a different tie-breaking variable selection. The two implementations produced identical complete sorted solution lists through n=12.

## Executed results (Python/SymPy, exact integer/rational arithmetic, local sandbox)

n: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17
counts: 1,2,2,4,4,8,8,16,16,32,32,64,64,128,128,256,256
primary search nodes: 1,3,3,7,7,15,17,40,52,183,279,579,909,3386,4214,4722,4683.
Independent search nodes through 12: 1,3,3,7,9,19,25,50,68,169,269,617.
All 17 counts agree with 2^floor(n/2), including all asymmetric candidates in the search space.
All solutions were checked for the following additional properties, with no failures:

1. D4 symmetry.
2. Each directional second difference 2f(i,j)-f(i-1,j)-f(i+1,j), and its horizontal counterpart, lies in {0,1}.
3. In the upper-left folded k x k square, k=floor(n/2), the mixed forward difference f(i,j)-f(i-1,j)-f(i,j-1)+f(i-1,j-1) lies in {0,1}.
4. The k-bit vector of vertical directional second differences along column k is different for every solution; hence every binary word of length k occurs exactly once for each tested n (including the empty word for n=1). The first k diagonal values likewise distinguish every solution.

These are finite certificates, not a proof of the same properties for all n. In particular the central word gives a concrete prospective bijection, replacing the original count problem with a structural challenge. The source already gives a lower-bound construction; proving that every admissible grid is uniquely determined by a binary central curvature word would give the matching upper bound. The finite data do not establish injectivity or binary curvature in general.

Solution list SHA256 (JSON compact sorted flattened tuples):
n=12: 9432585657953551b2009b639177d7286a7e7a0ed048f68b97e886ed438e7209
n=17: fdb74bf5fb407b0fdca44856e2fc393f8b360150ac5202a53213f5dadebaf4db

## Reproduction: primary exact enumerator

```python
from collections import deque
from itertools import product
import sympy as s
def solve(n):
    N=n*n
    neighbors=[tuple(a*n+b for a,b in [(i-1,j),(i+1,j),(i,j-1),(i,j+1)] if 0<=a<n and 0<=b<n) for i,j in product(range(n),repeat=2)]
    L=s.eye(N)*4
    for i,ns in enumerate(neighbors):
        for j in ns:L[i,j]=-1
    v=L.inv()*s.ones(N,1)*2
    hi=[int(x) for x in v]
    def propagate(lo,hi,dirty):
        q=deque(dirty); inq=set(dirty)
        def narrow(i,a,b):
            l=max(lo[i],a);h=min(hi[i],b)
            if l>h:return False
            if l!=lo[i] or h!=hi[i]:
                lo[i]=l;hi[i]=h
                for j in (i,)+neighbors[i]:
                    if j not in inq:q.append(j);inq.add(j)
            return True
        while q:
            i=q.popleft();inq.remove(i);ns=neighbors[i]
            sl=sum(lo[j] for j in ns);sh=sum(hi[j] for j in ns)
            if not narrow(i,(sl+3)//4,(sh+2)//4):return False
            for j in ns:
                if not narrow(j,4*lo[i]-2-(sh-hi[j]),4*hi[i]-(sl-lo[j])):return False
                sl=sum(lo[k] for k in ns);sh=sum(hi[k] for k in ns)
        return True
    nodes=0;sol=[]
    def rec(lo,hi,dirty):
        nonlocal nodes
        nodes+=1
        if not propagate(lo,hi,dirty):return
        if lo==hi:
            assert all(0<=4*lo[i]-sum(lo[j] for j in ns)<=2 for i,ns in enumerate(neighbors))
            sol.append(tuple(lo));return
        i=min((i for i in range(N) if lo[i]!=hi[i]),key=lambda i:(hi[i]-lo[i],-len(neighbors[i])))
        for a in range(lo[i],hi[i]+1):
            l=lo.copy();h=hi.copy();l[i]=h[i]=a;rec(l,h,(i,)+neighbors[i])
    rec([0]*N,hi,list(range(N)))
    return sorted(sol),nodes
```

## Independent enumerator and property checks

```python
from itertools import product
import hashlib,json
def enumerate_grid(n):
    coords=list(product(range(1,n+1), repeat=2)); index={p:i for i,p in enumerate(coords)}
    N=len(coords)
    ns=[tuple(index[q] for q in ((x-1,y),(x+1,y),(x,y-1),(x,y+1)) if q in index) for x,y in coords]
    hi=[min(x*(n+1-x), y*(n+1-y)) for x,y in coords]
    inequalities=[]
    for i,nb in enumerate(ns):
        a=[(i,4)]+[(j,-1) for j in nb]
        inequalities.append((a,2)); inequalities.append(([(j,-c) for j,c in a],0))
    def propagate(lo,hi):
        changed=True
        while changed:
            changed=False
            for a,b in inequalities:
                m=sum(c*(lo[j] if c>0 else hi[j]) for j,c in a)
                if m>b:return False
                for j,c in a:
                    rem=b-(m-c*(lo[j] if c>0 else hi[j]))
                    if c>0:
                        new=min(hi[j],rem//c)
                        if new<lo[j]:return False
                        if new<hi[j]:hi[j]=new;changed=True
                    else:
                        new=max(lo[j],-((-rem)//c))
                        if new>hi[j]:return False
                        if new>lo[j]:lo[j]=new;changed=True
        return True
    solutions=[];nodes=0
    def visit(lo,hi):
        nonlocal nodes
        nodes+=1
        if not propagate(lo,hi):return
        if lo==hi:
            assert all(0<=4*lo[i]-sum(lo[j] for j in nb)<=2 for i,nb in enumerate(ns))
            solutions.append(tuple(lo));return
        i=min((i for i in range(N) if lo[i]!=hi[i]),key=lambda i:(hi[i]-lo[i],i))
        for v in range(lo[i],hi[i]+1):
            a=lo.copy();b=hi.copy();a[i]=b[i]=v;visit(a,b)
    visit([0]*N,hi)
    return sorted(solutions),nodes

def properties(n,ss):
    k=n//2
    center=set();diag=set()
    for a in ss:
        def f(i,j):return a[(i-1)*n+j-1] if 1<=i<=n and 1<=j<=n else 0
        assert all(f(i,j)==f(j,i)==f(n+1-i,j)==f(i,n+1-j) for i,j in product(range(1,n+1),repeat=2))
        assert all(0<=2*f(i,j)-f(i-1,j)-f(i+1,j)<=1 and 0<=2*f(i,j)-f(i,j-1)-f(i,j+1)<=1 for i,j in product(range(1,n+1),repeat=2))
        assert all(0<=f(i,j)-f(i-1,j)-f(i,j-1)+f(i-1,j-1)<=1 for i,j in product(range(1,k+1),repeat=2))
        center.add(tuple(2*f(i,k)-f(i-1,k)-f(i+1,k) for i in range(1,k+1)))
        diag.add(tuple(f(i,i) for i in range(1,k+1)))
    assert len(center)==len(diag)==len(ss)==2**k
    return {'n':n,'count':len(ss),'sha256':hashlib.sha256(json.dumps(ss,separators=(',',':')).encode()).hexdigest(),'distinct_center_curvature_words':len(center),'distinct_diagonals':len(diag)}

for n in range(1,18):
    ss,nodes=solve(n)
    p=properties(n,ss);p['nodes_primary']=nodes
    if n<=12:
        sec,n2=enumerate_grid(n);assert sec==ss;p['nodes_independent']=n2
    print(json.dumps(p),flush=True)
```

## Campaign reconciliation and resume

Read AGENTS.md, current CAMPAIGN_LEDGER.md (blob 391f7c0f650638f67731707bb59f358e397c72c0), VERIFIED_PROOFS.json, A401895_CURRENT_BRIEF.txt and anti-period/reflection notes. Read current upstream lib/join.ts, CONTRIBUTING_AGENTS.md, and tools/oma.sh (blob 8cb4e4103a3614cde7f5f52174a5b5716437c804); direct site join.txt and catalogue inaccessible to web, shell DNS also unavailable. No actual desk denial/lease was obtained. No verifier branch or peer work touched. Lean/lake not installed in local sandbox.

Fresh GitHub metadata: own full PRs 7724/7815/7817 remain merged; 10139 and 13332 open/unmerged. All eight latest registrations 12465/12514/12591/12717/12808/12868/12938/13431 still open, as is foreign MO430643 registration 13174. Older registrations 7223/7625/10062/10398 also open. No new full-checker verdict independently confirmed in this run. Prior indexed 35 full certificates, 4 upstream checker acceptances and 3 merged formal results retained, not original-discovery counts. Zero newly claimed/Lean-checked/submitted/accepted by this run. Genuine-open confirmed accepted total remains 0/20. No duplicate submission.

Next concrete mathematical task: prove the unconditional binary-directional-curvature lemma and central-column uniqueness, or find a counterexample to either; do not substitute more finite-range enumeration for the missing general proof. Recheck live registration status and exact imported targets for existing certificates before publication. This checkpoint is additive, preserving concurrent master ledgers and other lanes.
