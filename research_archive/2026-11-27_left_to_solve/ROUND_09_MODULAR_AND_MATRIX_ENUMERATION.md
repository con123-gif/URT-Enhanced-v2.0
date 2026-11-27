# Round 09 — complete modular inverse law and arbitrary-size binary matrix enumeration

Date: 2026-11-27. Research credit: Cornelius Lytollis (@con123-gif, URT/Newton's Cathedral research); AI mathematical assistance: ChatGPT (GPT-6.2). External mathematics track; no physical claims or RH task changes. Original URT phase controller not executed: the techniques are modular elimination and graph component decomposition. These are human-readable mathematical proofs and actual sandbox Python checks; not Lean-verified, not submitted, and novelty not established.

## 1. Full inverse and frequency law for power residues

Catalogue target: https://lefttosolve.com/p/oeis-a396111 ; exact formal statement: https://github.com/GuillaumeBAUD-coder/open-math-agents/blob/main/statements/oeis-a396111.lean . Existing submissions #6376 and #5934 cover r=4, so do not duplicate them. The following generalization is derived independently here.

For positive integer r and nonnegative integer n define a_r(n)=n^r mod (2n+1). For k>=1 put N=2^r k-(-1)^r. This is a positive odd integer with N>k (including r=1). Because 2n=-1 mod (2n+1) and 2 is invertible modulo the odd number 2n+1, we have
  a_r(n)=k iff d=2n+1>k and d divides N.
Indeed, if the remainder is k then 2^r k=(-1)^r modulo d. Conversely this congruence implies n^r=k modulo d, and 0<=k<d makes k the unique standard remainder. Every divisor d of N is odd, so all solutions are exactly n=(d-1)/2 for d|N, d>k. For k=0, the same modular argument forces d|1, so the unique solution is n=0. For positive k, d=N is always a valid solution and is the largest possible d, so max preimage = (N-1)/2. This proves surjectivity and finite fibers for every positive exponent r, not just r=4.

For k>=2, set c=N/d. Then d>k iff c<N/k=2^r-(-1)^r/k. Since c is odd, this is equivalent to 1<=c<2^r. Thus fiber size is the finite sum of indicators
  F_r(k)=sum over odd 1<=c<2^r of 1_{c | (2^r k-(-1)^r)}  (k>=2).
For k=1 use the original exact divisor condition d>1; for even r the complementary divisor c=2^r-1 has to be excluded, and for odd r the formula above already applies. For fixed r, F_r is periodic for k>=2 with period L_r=lcm of all positive odd c<2^r (not asserted minimal). Each congruence has one residue modulo c, since gcd(2^r,c)=1. Therefore the average number of preimages over a full period equals sum over odd 1<=c<2^r of 1/c. In particular, all but the finite exceptional initial values have an explicitly periodic distribution of multiplicities.

For r=4, the period 45045 yields counts by fiber size 1 through 8 respectively: 17280, 16128, 7080, 2864, 1350, 312, 30, 1. Mean multiplicity 91072/45045. Each listed count is over the 45045 integers k=2,...,45046, not an estimate. The maximum multiplicity 8 is attained precisely when 16k-1 is divisible by 45045, within k>=2. The case k=0 has one preimage. No priority claim for the generalization.

## 2. Binary matrices of arbitrary dimensions with row and column sums at most two

Catalogue target: https://lefttosolve.com/p/oeis-a401159 ; formal statement: https://github.com/GuillaumeBAUD-coder/open-math-agents/blob/main/statements/oeis-a401159.lean . Existing PRs #6067 and #6077 cover two and three columns, so do not duplicate them. We derive an exact formula for every n,m>=0.

Let T(n,m) be the number of labelled n by m binary matrices with each row and column sum at most 2. Regard a one entry as an edge between its row and column vertices in a simple labelled bipartite graph. Such a graph decomposes uniquely into isolated vertices, paths and even cycles; this follows by following edges in any connected component of maximum degree 2. Define C(i,j) as the number of connected graphs of this kind on fixed labelled vertex sets with sizes i,j, with C(0,0)=0.

* C(1,0)=C(0,1)=1 (isolated vertex).
* C(k,k)=k!^2 for the paths, plus k!^2/(2k) for cycles when k>=2; k>=1. For paths choose orientation from the left endpoint and independently permute each side. For cycles choose a starting left vertex and orientation; each graph represented by 2k pairs of ordered left/right lists.
* C(k+1,k)=C(k,k+1)=(k+1)!k!/2 for k>=1. Orient a path beginning on the side with one extra vertex; each path counted twice, once in each orientation.
* All other C(i,j)=0.

The bivariate exponential generating function of connected components is therefore
  C(x,y) = x+y + xy/(1-xy) + (x+y)xy/(2(1-xy)) + (-log(1-xy)-xy)/2.
By the labelled exponential formula (equivalently expand exp C and distribute vertex labels among unordered connected components), the generating function of all admissible matrices is exactly
  sum_{n,m>=0} T(n,m) x^n y^m/(n!m!)
  = (1-xy)^(-1/2) exp( ((x+y)(2-xy)+xy(1+xy))/(2(1-xy)) ).
This is an identity of formal power series over Q, not a convergence assumption.

An exact integer recursion without symbolic power series follows by choosing the connected component containing a distinguished row vertex, for n>=1:
  T(n,m)=sum_{i=1}^n sum_{j=0}^m binom(n-1,i-1) binom(m,j) C(i,j) T(n-i,m-j), with T(0,m)=1.
The binomial coefficients select labels, C counts the connected component, and T counts the remainder. Each graph appears exactly once.

Independent second algorithm: track the numbers a,b of rows currently of occupancy zero and one, starting at (n,0). When adding a column choose x<=a of the zero rows and y<=b of the one rows with x+y<=2. Transition to (a-x,b+x-y) with multiplicity binom(a,x)binom(b,y). Sum states after m columns. This is exact due to row-label symmetry and uses O(n^2) states and O(m n^2) arithmetic operations for fixed degree bound 2, ignoring growing integer bit complexity. This is not a claim of native URT speedup.

For 2 columns every column independently chooses 0,1,2 rows, so T(n,2)=S^2, S=1+n+binom(n,2). For 3 columns the only forbidden row has ones in all 3: inclusion-exclusion removes n*n^3 choices, adds binom(n,2) choices (two specified rows occupy all columns), and no triple is possible. Hence T(n,3)=S^3-n^4+binom(n,2). Expanding eight times the right side gives exactly the polynomial in the formal statement: 8+8n+22n^2+13n^3+n^4+3n^5+n^6. This closes both original identities algebraically and extends them to every column count.

Examples: T(4,4)=7343; T(10,10)=2297230134084416; T(20,20)=25178380773035605621574455258496856094111.

## 3. Actual execution and reproduction

Python 3 sandbox execution: 4000 full inverse-fiber comparisons for r=1..8 and k=1..500, plus 8 k=0 cases. Each comparison independently enumerated n up to the proven maximum for k<=500. All passed. Computed entire fourth-power multiplicity period, verified exact mean. Matrix component recurrence versus independently derived column-state DP: all 441 pairs n,m=0..20 passed. Independent exhaustive enumeration for n,m=0..4: all 25 comparisons passed. Two/three-column formulas: 42 checks n=0..20, all passed.

```python
from math import lcm, factorial, comb
from fractions import Fraction
from itertools import product
from collections import Counter
from functools import lru_cache

checks=0
for r in range(1,9):
    A=2**r; sign=(-1)**r; K=500
    seen=Counter(); expected=Counter()
    for n in range((A*K-sign-1)//2+1):
        k=pow(n,r,2*n+1)
        if k<=K: seen[k]+=1
    for k in range(1,K+1):
        N=A*k-sign
        roots=[(N//c-1)//2 for c in range(1,A,2) if N%c==0 and N//c>k]
        assert len(roots)==len(set(roots))
        assert all(pow(n,r,2*n+1)==k for n in roots)
        expected[k]=len(roots)
        assert roots and max(roots)==(N-1)//2
        checks+=1
    expected[0]=1
    assert seen==expected
print('modular inverse checks',checks,'plus eight zero cases')
period=lcm(*range(1,16,2))
hist=Counter(sum((16*k-1)%c==0 for c in range(1,16,2)) for k in range(2,period+2))
print('period:',period,'histogram:',sorted(hist.items()),'mean',Fraction(sum(j*c for j,c in hist.items()),period))
assert Fraction(sum(j*c for j,c in hist.items()),period)==sum(Fraction(1,c) for c in range(1,16,2))
def comp(i,j):
    if (i,j) in ((1,0),(0,1)):return 1
    if min(i,j)==0:return 0
    if i==j:
        return factorial(i)*factorial(j)+(factorial(i)*factorial(j)//(2*i) if i>=2 else 0)
    if abs(i-j)==1:return factorial(i)*factorial(j)//2
    return 0
@lru_cache(None)
def T(n,m):
    if n==0:return 1
    return sum(comb(n-1,i-1)*comb(m,j)*comp(i,j)*T(n-i,m-j) for i in range(1,n+1) for j in range(m+1) if comp(i,j))
def dp(n,m):
    state={(n,0):1}
    for _ in range(m):
        nxt=Counter()
        for (a,b),v in state.items():
            for x in range(min(a,2)+1):
                for y in range(min(b,2-x)+1):
                    nxt[a-x,b+x-y]+=v*comb(a,x)*comb(b,y)
        state=nxt
    return sum(state.values())
for n in range(21):
    for m in range(21):assert T(n,m)==dp(n,m)
for n in range(21):
    S=1+n+comb(n,2)
    assert T(n,2)==S*S and T(n,3)==S**3-n**4+comb(n,2)
for n in range(5):
    for m in range(5):
        brute=sum(all(sum(w[i*m+j] for j in range(m))<=2 for i in range(n)) and all(sum(w[i*m+j] for i in range(n))<=2 for j in range(m)) for w in product((0,1),repeat=n*m))
        assert T(n,m)==brute
print('matrix component vs column DP:',21**2,'cases; brute force:',25,'cases; closed form:',42,'checks')
print('T(4,4), T(10,10), T(20,20):',T(4,4),T(10,10),T(20,20))
```

## Submission status
PR #6725 Retkes formalization checked at start of session: open, unmerged, no comments. Other catalogue proofs identified above already have third-party submissions. New generalizations should not be sent as duplicate solutions or misrepresented as exact original catalogue targets. No new site claim or PR made in round 9; direct sandbox cannot resolve site DNS and has no Lean or gh binary. Existing fork and automation remain available. Next: seek a nonduplicated exact target or a separately approved generalization, independently assess priority, then formalize and submit with the official lease workflow. 
