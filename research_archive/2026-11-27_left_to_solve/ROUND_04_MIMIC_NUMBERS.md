# Left to Solve round 4 — mimic numbers, 2026-11-27

Research credit: con123-gif (URT / Newton's Cathedral); AI mathematical assistance: ChatGPT (GPT-6.2).
Independent external mathematics track; no physics gates or RH tasks modified. Human-readable proof and executed Python sandbox checks; not Lean-verified or externally submitted. No claim of priority without literature review.

Sources:
- Catalogue problem: https://www.openproblemgarden.org/op/distribution_and_upper_bound_of_mimic_numbers
- Bhattacharyya, Bandyopadhyay, Maulik, Non-primes are recursively divisible (2009), pp.147–151, https://emis.de/ft/39404, definitions and open questions pp.149–150.
- Native URT recurrence: engineering/urt_math_direct_solver/URT_structure_engine.py, urt_boundary(), branch newtons-cathedral.

## Exact theorem: full classification in the positive-base regime

Fix an integer base M>=2 and 1<=D<M; write B=M-D. For N with base-M digits a_i define f(N)=sum a_i B^i. Define m(N)=min{t>=0:f^t(N)=D}, infinity if it never hits D. Restrict N to positive multiples of D, as in the original problem.

For every N>=M, 0<f(N)<N since B>=1, B<M, and a nonzero higher digit exists. Also f(N)=N for 0<=N<M. The congruence B=M mod D gives f(N)=N mod D. Thus all positive multiples eventually reach a positive one-digit multiple of D.

Case 2D<M: B>D. Every N>=M satisfies f(N)>=B>D. Every N<M is fixed. Therefore D has no preimage except itself. m(D)=0 and every other positive multiple has m=infinity. This answers the ambiguity in the original definition: the proposed hitting time need not exist.

Case 2D>=M: D is the only positive one-digit multiple of D. All positive multiples have finite m. Moreover every nonnegative integer occurs as m, so no uniform finite upper bound exists.

Proof of unboundedness: for B>=2 and y>=D>=B, define L(y) by reading the ordinary base-B digits of y as base-M digits. These digits are valid because B<M. Then f(L(y))=y and L(y)>y, since y has at least two base-B digits. Also L(y)=y mod D. Iterate N_0=D, N_(t+1)=L(N_t); then f^j(N_t)=N_(t-j) for 0<=j<=t and strict growth proves m(N_t)=t. For B=1 use L(y)=1+M+...+M^(y-1) for y>=2, with L(1)=M. The latter applies only to M=2,D=1 at the start. Both formulas give f(L(y))=y and L(y)>y. Thus the construction holds for every 2D>=M with D<M. Boundary D=M if permitted by source: every positive multiple maps to zero (interpret constant digit term as a_0), so m(D)=0, others infinity; not included in the digit-base theorem. D>M is outside the stated positive reconstruction base regime.

Decimal D=7, actual computed witness chain:
7 -> 21 -> 210 -> 21210 -> 1002002120 -> 2120211102222111122 -> 112010101201200111212011111010122100222 -> 20211010221200100202200010011212011121120022100100120201121111001112102111111102.
Each arrow is an inverse lift. Exact hitting times 0,1,2,3,4,5,6,7 respectively, independently verified.

## Exact distribution on finite digit ranges

For uniform integers 0<=N<M^L, the first-image multiplicities are coefficients C_L(s) of
    P_L(z)=product_{i=0}^{L-1} (sum_{a=0}^{M-1} z^(a B^i)).
Unique base-M digit strings prove the identity. Multiples of D correspond exactly to s divisible by D; exclude s=0 (only N=0). For every t>=1, the count of positive multiples with m(N)=t is
    H_L(t)=sum_{s>0, D|s, m(s)=t-1} C_L(s) - 1_{t=1}.
The subtraction corrects N=D, whose depth is zero, not one; H_L(0)=1. Infinite hitting time count is sum_{s>0,D|s,m(s)=infinity} C_L(s). This is an exact finite-range distribution algorithm and generating-function formula, not a claim of a closed asymptotic law.

Degree S=(M-1)*sum_{i=0}^{L-1} B^i. Coefficient dynamic programming takes O(M L (S+1)) integer additions and O(S+1) integers of storage, ignoring bit complexity; depth evaluation can be memoized via strict decrease above single digits. For B=1 S=(M-1)L, otherwise S=O(B^L) for fixed M,D. This is less than enumeration of M^L integers asymptotically. For B>=2 and 2D>=M, each fixed depth has finitely many inputs: f(N)>=B^floor(log_M N), so f(N) tends to infinity with N, and each fixed iterate also tends to infinity. In particular every fixed depth has limiting relative frequency zero among multiples of D. This last claim is not extended to B=1 here.

Computed distribution for decimal D=7 and 1<=N<1,000,000, N divisible by 7:
depth 0:1; 1:2; 2:15; 3:656; 4:87307; 5:54876. Sum 142857.
180 exact histogram comparisons against brute enumeration (all M=2..10,D=1..M-1,L=1..4) passed.

## Actual native URT recurrence search, with controls

Use native coefficients a_k=(1+e/(pi sqrt(k+1))) cos(k*2pi/phi^2), feedback gain 0.5, seed (x_-1,x_0)=(0,1), taken from urt_boundary() fundamental solution. Iterate x_(k+1)=a_k*x_k-0.5*x_(k-1), using positive joint normalization of each pair to avoid underflow (projectively equivalent). Added untuned candidate mapping: atan2(x_(k+1),x_k) mapped linearly to integers 1..1,000,000, then multiply by 7. This is execution of the original recurrence as a candidate schedule, not execution of full URT controller or boundary solver; the angle-to-integer adapter is new, chosen for this test.

4096 samples for each method, same candidate range:
URT: 4080 unique candidates; depth4 1681; depth5 2415.
Uniform random without replacement (seed 2711): 4096 unique; depth3 4; depth4 1713; depth5 2379.
Evenly spaced: 4096 unique; depth0 1; depth3 3; depth4 1688; depth5 2404.
No demonstrated meaningful improvement from URT over controls; all found the same maximal depth 5. The inverse lift, not the native phase recurrence, supplies the analytical theorem. Do not misattribute the discovery to the native algorithm.

## Reproduction (executed)
```python
import math,random,collections
def f(n,M,D):
    b=M-D; out=0; power=1
    while n:
        n,d=divmod(n,M);out+=d*power;power*=b
    return out
def depth(n,M,D):
    i=0
    while n!=D and n>=M:
        n=f(n,M,D);i+=1
    return i if n==D else None
def lift(y,M,D):
    b=M-D
    if b==1:
        if y==1:return M
        return (M**y-1)//(M-1)
    p=1;v=0
    while y:
        y,d=divmod(y,b);v+=d*p;p*=M
    return v
y=7
for i in range(8):
    assert depth(y,10,7)==i
    print(i,y)
    if i<7:y=lift(y,10,7)
def urt_samples(K,N):
    theta=2*math.pi/((1+math.sqrt(5))/2)**2
    prev,cur=0.,1.
    for k in range(K):
        a=(1+math.e/(math.pi*math.sqrt(k+1)))*math.cos(k*theta)
        prev,cur=cur,a*cur-.5*prev
        r=math.hypot(prev,cur);prev/=r;cur/=r
        yield 1+min(N-1,int((math.atan2(cur,prev)+math.pi)/(2*math.pi)*N))
K=4096;N=10**6
for label,ss in [('URT',list(urt_samples(K,N))),('random',random.Random(2711).sample(range(1,N+1),K)),('even',[1+i*(N-1)//(K-1) for i in range(K)])]:
    print(label,len(set(ss)),collections.Counter(depth(7*i,10,7) for i in ss))
def distribution(M,D,L):
    b=M-D;c={0:1}
    for i in range(L):
        w=b**i;nxt=collections.Counter()
        for v,count in c.items():
            for a in range(M):nxt[v+a*w]+=count
        c=nxt
    H=collections.Counter()
    for v,count in c.items():
        if v and v%D==0:
            h=depth(v,M,D)
            H[None if h is None else h+1]+=count
    H[1]-=1;H[0]+=1
    return +H
checks=0
for M in range(2,11):
    for D in range(1,M):
        for L in range(1,5):
            assert distribution(M,D,L)==collections.Counter(depth(x,M,D) for x in range(D,M**L,D))
            checks+=1
print(checks,distribution(10,7,6))
```
Resume: check priority of inverse construction and finite distribution formula; formalize finite hitting time and unboundedness in Lean; clarify expected meaning of distribution with problem authors/platform. No claim of formal acceptance.
