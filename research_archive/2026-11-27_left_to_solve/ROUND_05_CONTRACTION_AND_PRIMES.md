# Left to Solve round 5 — contraction law, prime splitting, and controlled negative results

2026-11-27. Research credit: con123-gif (URT/Newton's Cathedral); AI assistance: ChatGPT (GPT-6.2). Separate external mathematics track. No Lean verification or external submission; novelty not established. No RH or physical-gate changes.

## 1. Uniform mimic-number depth law

Source: https://www.openproblemgarden.org/op/distribution_and_upper_bound_of_mimic_numbers ; continuation of ROUND_04_MIMIC_NUMBERS.md.

Fix integers M,D with 2<=B=M-D<=D<M and let f read the base-M digits of N using weights B^i. For positive multiples N of D, round 4 establishes finite hitting time m(N) of D. Set beta=ln(B)/ln(M) in (0,1). If N has highest nonzero digit at index k, M^k<=N<M^(k+1) and B^k<=f(N)<=(M-1) B^(k+1)/(B-1). Consequently
    N^beta/B <= f(N) <= ((M-1)B/(B-1)) N^beta.
This holds for every positive N. Write y_t=ln(f^t(N)); then y_(t+1)=beta*y_t+e_t, where |e_t|<=C=max(ln B,ln((M-1)B/(B-1))). Summing the geometric progression gives |y_t-beta^t ln N|<=C/(1-beta) for every t. At t=m(N), y_t=ln D, giving a lower bound m(N)>=ln ln N/ln(1/beta)-O_(M,D)(1). Conversely at t=ceil(ln ln N/ln(1/beta)) for N>=3, the iterate is at most exp(1+C/(1-beta)), a fixed finite constant. Because every positive multiple strictly decreases unless it is D, at most that constant number of extra iterations are needed. Therefore
    m(N)=ln ln N / ln(ln M/ln B)+O_(M,D)(1).
Uniform over all positive multiples N>=3. For M=10,D=7 the coefficient is 1.3513794424552645, correcting an earlier rounded chat value. For fixed M,D and uniform positive multiples N<=X, almost all N are >=sqrt(X); the difference between ln ln N and ln ln X is then at most ln 2. Thus depths are within a bounded interval around the stated centre with probability tending to one. This is not a limiting distribution of the centred depth, nor a result for B=1.
Executed sandbox exhaustive checks for positive multiples 2D<=N<=1,000,000, verifying strict decrease and calculating min/max of m(N)-ln ln N/ln(1/beta):
(10,7): 142856, [-0.5045502669013286,1.8104059531020957]
(10,5): 199999, [-1.3287404264145581,2.180932156210633]
(10,8): 124999, [-0.6098056674272683,1.436554712005571]
(5,3): 333332, [0.3076928732029116,2.9047941874118823].
Total 801186 trajectories. Finite tests illustrate, not establish, the asymptotic proof.

## 2. Special primes: exact algebraic characterization and density

Source: https://www.openproblemgarden.org/op/special_primes . Standard Kummer/Chebotarev method, also used in Artin primitive root theory. See https://people.csail.mit.edu/kuat/courses/decimal-expansions.pdf (not a priority claim).
Fix prime p. For q prime, q not dividing 2p, the conditions q=1 mod p and 2^((q-1)/p)=1 mod q are equivalent to q splitting completely in K=Q(zeta_p,2^(1/p)). Indeed q=1 mod p gives all p-th roots of unity in F_q, and by cyclicity of F_q^* the exponent test says that 2 is a p-th power. Thus x^p-2 splits fully. The splitting field is unramified at q and Frobenius is trivial iff all roots are fixed. For F=Q(zeta_p), 2 is unramified if p odd, so at any prime above 2 its valuation is 1. The polynomial x^p-2 is Eisenstein over that local valuation and irreducible over F. For p=2 F=Q, same argument. Hence [K:Q]=p(p-1), and Chebotarev gives natural density 1/(p(p-1)) among primes. Infinitely many such q exist. In the p=2 case, the complete congruence description is q=1 or 7 mod 8 by the supplementary quadratic reciprocity law.
More generally let m be the product of distinct fixed primes. Requiring every corresponding exponent test simultaneously is equivalent to q=1 mod m and 2^((q-1)/m)=1 mod q, since in a cyclic group the intersection of the p-th power subgroups is the m-th power subgroup. The field Q(zeta_m,2^(1/m)) has degree m*phi(m): squarefree m has odd cyclotomic conductor when even (Q(zeta_2r)=Q(zeta_r) for odd r), so 2 is unramified in Q(zeta_m) and x^m-2 is again Eisenstein locally. Joint density 1/(m*phi(m)). This is an exact statistical and field-theoretic classification, not an elementary closed list of all primes, and is standard theory.
Executed SymPy enumeration of primes q<=100000: p=2:4783; 3:1559; 5:450; 7:225; 11:75; 13:59.

## 3. Native URT recurrence: Newman signed partitions (negative control)

Source: https://www.openproblemgarden.org/op/dividing_up_the_unrestricted_partitions . Author reports signs valid through about degree 110. We did not match it.
Let a_(k,j) in {-1,1}, a_(k,0)=1, and P[k,n] be coefficient n of product through factor k. At degree n, only new signs a_(k,n/k) for divisors k of n can affect the coefficient; their contributions are individually 1 times the sign. Let v be the coefficient with those signs temporarily zero. Then possible next coefficients are v-d,v-d+2,...,v+d where d=number of divisors of n. A valid extension exists exactly when |v|<=d+1. This is a local criterion only; greedy extensions can block later. Recurrence for partial coefficient before fresh signs: v_k=v_(k-1)+sum_{1<=j<=floor((n-1)/k)} a_(k,j)*P[k-1,n-j*k]. After choosing fresh signs, P[k,n]=v_k+sum of fresh signs for divisor indices <=k. All higher factor rows equal the final coefficient for this n.
Executed 500 restarts each, maximum target degree 200. Native coefficients from urt_boundary(): a_t=(1+e/(pi sqrt(t+1)))*cos(t*2pi/phi^2), feedback 0.5, initial (0,1), pair normalization by positive norm each step. New mapping to [0,1] via atan2, start offset 17*seed recurrence steps. At each degree choose allowable target 0 if even parity, otherwise +/-1, random/URT preference when both possible. Rank divisors by independent uniform random permutation (random.Random(seed)) or successive native phase values (URT) and choose first required number positive. Exact coefficient checks verified new best witnesses by independent convolution. URT mean depth 10.608, best 18; random mean 10.736, best 22. No advantage or solution. Important: adaptation tests original recurrence, not a full unmodified universal solver for sign constraints.
Reproduction:
```python
import math,random
def trial(mode,seed,N=200):
    rng=random.Random(seed)
    a=[[1]+[0]*(N//k) for k in range(1,N+1)]
    P=[[1]+[0]*N for _ in range(N+1)]
    theta=2*math.pi/((1+math.sqrt(5))/2)**2
    prev,cur,t=0.,1.,0
    def nextval():
        nonlocal prev,cur,t
        z=(1+math.e/(math.pi*math.sqrt(t+1)))*math.cos(t*theta);t+=1
        prev,cur=cur,z*cur-.5*prev
        r=math.hypot(prev,cur);prev/=r;cur/=r
        return (math.atan2(cur,prev)+math.pi)/(2*math.pi)
    if mode=='urt':
        for _ in range(seed*17):nextval()
    for n in range(1,N+1):
        v=0;div=[]
        for k in range(1,n+1):
            v+=sum(a[k-1][j]*P[k-1][n-j*k] for j in range(1,(n-1)//k+1))
            P[k][n]=v
            if n%k==0:div.append(k)
        d=len(div)
        if abs(v)>d+1:return n-1,a
        target=0 if (v+d)%2==0 else (1 if v>=0 else -1)
        if (v+d)%2 and abs(v)<d and (nextval() if mode=='urt' else rng.random())<.5:target=-target
        plus=(d+target-v)//2
        if not 0<=plus<=d:return n-1,a
        order=sorted(div,key=lambda _:nextval()) if mode=='urt' else rng.sample(div,d)
        S=set(order[:plus]);c=0
        for k in range(1,n+1):
            if n%k==0:
                sign=1 if k in S else -1;a[k-1][n//k]=sign;c+=sign
            P[k][n]+=c
        for k in range(n+1,N+1):P[k][n]=target
        assert P[n][n]==target
    return N,a
def verify(a,n):
    p=[1]+[0]*n
    for k in range(1,n+1):
        out=[0]*(n+1)
        for j in range(n//k+1):
            assert abs(a[k-1][j])==1
            for i in range(n-j*k+1):out[i+j*k]+=a[k-1][j]*p[i]
        p=out
    assert all(abs(x)<=1 for x in p)
for mode in ('urt','random'):
    vals=[];best=0
    for seed in range(500):
        n,a=trial(mode,seed);vals.append(n)
        if n>best:best=n;verify(a,n)
    print(mode,sum(vals)/len(vals),best)
```

## 4. Other targets and negative checks
For the conjecture that 3 is a primitive root modulo prime P=16q^4+1 with prime q>3, tested all prime q<1,000,000 via SymPy isprime and modular exponentiation. 7,669 qualifying P; none failed the tests pow(3,(P-1)//q,P)!=1 and pow(3,(P-1)//2,P)!=1. For P beyond 64-bit SymPy primality test is probabilistic, so this is a screening experiment rather than certified primality enumeration. The quadratic test follows generally: P=5 mod 12 so (3/P)=-1. The q-order test remains unresolved; no proof claimed.
Frobenius subgroup conjecture solved by Iiyori/Yamaki (1991); Lucas residue conjecture and transversal achievement game also have previous solutions according to original pages. No rediscovery credited as new.

Resume: prioritize independent verification and Lean formalization of mimic depth law; investigate centered distribution and B=1 separately. Do not label negative URT controls as successes. No new unrestricted conjecture independently validated in this round.
