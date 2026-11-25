# Unconditional square-root Type I remainder on the actual RH prime shell
25 November 2026. New direct analytic-route estimate, not RH closure. User requests substantive breakthrough. Continues 163e043b (classwise large sieve failure), 8bfe5c6 (short-gap), 0414c62 (within-cell), b0afce1d (shell resolvent). No previous Vaughan decomposition found in RH archive search (not an exhaustive proof of novelty). This is standard convolution and bounded-variation mathematics applied to our actual shell; no new mathematical literature claim.

## 1. Exact arithmetic identity
Fix X>=16, x in [X,2X]. U=V=floor(X^(1/4)), fixed across the window. Let
 w_x(n)=(2-x/n) 1_{x/2<n<=x}, c=1-log 2,
 D(x)=c*x-sum_{p prime} log p*w_x(p).
For arithmetic Dirichlet convolution use 1 for the constant-one function, delta for convolution identity, mu for Mobius, Lambda for von Mangoldt. log=Lambda*1 and mu*1=delta. Split mu=mu_<=U+mu_>U, Lambda=Lambda_<=V+Lambda_>V. Direct substitution proves
 Lambda=mu_<=U*log + Lambda_<=V - mu_<=U*Lambda_<=V*1 + (mu_>U*1)*Lambda_>V.
This is the Vaughan identity, not an analytic assumption. In the actual shell x/2>=X/2>V, the second term vanishes. Define alpha(n)=sum_{d|n,d>U}mu(d). It is zero for n<=U and equals -sum_{d|n,d<=U}mu(d) for n>U (use n>1). Consequently
 W_Lambda(x)=I1(x)-I2(x)+B(x),
 I1=sum_{d<=U}mu(d) sum_m log m*w_x(dm),
 I2=sum_{d<=U,e<=V}mu(d)Lambda(e) sum_m w_x(dem),
 B=sum_{m>V,n>U}Lambda(m)alpha(n)w_x(mn).
All sums finite; no prime independence assumed.

## 2. Prove the entire small-divisor fluctuation unconditionally at square-root scale
For any real D>0, let f(t)=(2-x/(Dt))1_{x/(2D)<t<=x/D}, zero elsewhere. On support it increases from zero to one then jumps down to zero; total variation at most 2. A sum over positive integer t minus the integral over t>=0 is bounded in absolute value by total variation (compare each integer endpoint with its adjacent unit interval and sum variations). By t=(x/D)s,
 |sum_{m>=1}w_x(Dm)-c*x/D|<=2.
If D<=U and x/(2D)>=1, f(t)log t also increases on support, and total variation <=2 log(x/D). With
 kappa=integral_{1/2}^1(2-1/s)log s ds=-1+log 2+(log 2)^2/2,
 |sum_m log m*w_x(Dm)-(x/D)(c log(x/D)+kappa)|<=2 log(x/D).
Define the three scalar coefficients, constant across this dyadic window:
 M=sum_{d<=U}mu(d)/d, L=sum_{d<=U}mu(d)log(d)/d,
 P=sum_{e<=V}Lambda(e)/e.
Then
 I1-I2 = x*[c*(M*(log x-P)-L)+kappa*M]+E_I(x),
 |E_I(x)|<=2U log x+2U psi(V).
The proof uses abs(mu)<=1, Lambda>=0, elementary psi(t)<=4 log(2)t. Therefore for U=V=floor(X^(1/4)), the error is O(sqrt X) uniformly on [X,2X] (X^(1/4)log(2X)=O(sqrt X)). No RH, GRH, PNT or mean-square result used. The scalar main is computable from finite small-divisor coefficients, not asserted equal to c*x.

Prime-power correction W_Lambda-W_prime is nonnegative and <=12 sqrt(x) by the elementary Chebyshev prime-power bound in 05530e1b (theta(v)<=4 log(2)v, k>=2 sum, see that derivation). Consequently define
 R_II(x)=c*x-x*[c*(M*(log x-P)-L)+kappa*M]-B(x).
Exact conclusion: |D(x)-R_II(x)| <= 2U log x+2U psi(V)+12 sqrt(x)=O(sqrt X).
In particular the entire Type I fluctuation AND prime-power error meet RH scale unconditionally. Pointwise one-sided upper bound R_II<=C_eps x^(1/2+eps) on arbitrary distant power windows would suffice for the existing Landau reduction. For general power windows choose U,V=floor(x^(1/4)) pointwise, or cover by dyadic blocks, retaining the same absolute remainder constant, not a varying uncontrolled coefficient.

## 3. Mean-square consequence and genuine remaining obstruction
||D-R_II||_{L2[X,2X]}=O(X). Thus the sufficient bound int_X^{2X}D^2=O_eps(X^(2+2eps)) is equivalent, with changed constants, to int_X^{2X}R_II^2=O_eps(X^(2+2eps)). The ENTIRE small-divisor fluctuating contribution is eliminated before squaring; no need to estimate any of its pair terms or cross-correlations by large sieve. This is distinct from separating primes into residue classes (163e043b), where the classwise recombination destroys the gain.
Remaining signed B involves only m,n>floor(X^(1/4)) and mn in (x/2,x]; coefficients Lambda(m) and exact short-divisor discrepancy alpha(n). Both variables lie in a multiplicatively balanced range up to 2X/(U+1). The term must be compared against the displayed explicit centering scalar. Do NOT take absolute values of B or discard the centering, which is generally order X. Neither ordinary Hilbert large sieve nor positivity proves this signed Type II estimate. We have not established it. A new proof of the needed signed dispersion would be a genuine arithmetic breakthrough. This is not a new proof of RH and no claim of removing actual TopG/cohomology dependencies. The direct prime path is an alternative to the pinned native geometry, not a verified replacement of Main.

## 4. Actual executed finite regression
CPython 3: sieve 131072, 12251 genuine primes, 14848 exact coefficientwise Vaughan identities in formal independent log-prime basis, and 25 numerical shell cases at X=256,1024,4096,16384,65536 with x=X,X+1,3X/2,2X-1,2X. Verified alpha via direct Mobius divisor sum and truncated complement across each range; compared direct Lambda shell with I1-I2+B; checked rigorous small-divisor bound, prime-power bound and R_II remainder. Largest observed |I1-I2-main|=8.5707059 (not an asymptotic estimate). All assertions passed. Code below reproduces core test; finite floating logarithm tests do not certify the asymptotic result, which follows from the analytical proof above.

```python
import math
from collections import defaultdict
N=131072
spf=list(range(N+1)); mu=[1]*(N+1); mu[0]=0
for p in range(2,math.isqrt(N)+1):
    if spf[p]==p:
        for n in range(p*p,N+1,p):
            if spf[n]==n: spf[n]=p
prime=[i for i in range(2,N+1) if spf[i]==i]
lam=[0.0]*(N+1); lbase=[0]*(N+1)
for p in prime:
    n=p
    while n<=N: lam[n]=math.log(p); lbase[n]=p; n*=p
for n in range(2,N+1):
    p=spf[n]; q=n//p
    mu[n]=0 if q%p==0 else -mu[q]
psi=[0.0]*(N+1)
for n in range(1,N+1): psi[n]=psi[n-1]+lam[n]
checks=0
for X in (256,1024,4096,16384,65536):
    U=V=math.isqrt(math.isqrt(X)); limit=2*X
    a=[0]*(limit+1)
    for d in range(U+1,limit+1):
        if mu[d]:
            for n in range(d,limit+1,d): a[n]+=mu[d]
    for n in range(1,limit+1):
        assert a[n]==(0 if n<=U else -sum(mu[d] for d in range(1,U+1) if n%d==0))
    c=1-math.log(2); k=-1+math.log(2)+math.log(2)**2/2
    M=math.fsum(mu[d]/d for d in range(1,U+1)); L=math.fsum(mu[d]*math.log(d)/d for d in range(1,U+1)); P=math.fsum(lam[e]/e for e in range(1,V+1))
    for n in range(1,min(limit,4096)+1):
        coeff=defaultdict(int)
        for d in range(1,min(U,n)+1):
            if n%d: continue
            m=n//d
            while m>1:
                p=spf[m]; coeff[p]+=mu[d]; m//=p
        if n<=V and lbase[n]: coeff[lbase[n]]+=1
        for d in range(1,min(U,n)+1):
            if n%d: continue
            for e in range(1,min(V,n//d)+1):
                if n%(d*e)==0 and lbase[e]: coeff[lbase[e]]-=mu[d]
        for m in range(V+1,n+1):
            if n%m==0 and lbase[m]: coeff[lbase[m]]+=a[n//m]
        assert {p:v for p,v in coeff.items() if v}==({lbase[n]:1} if lbase[n] else {})
        checks+=1
    def row(x,d,logweight=False):
        return math.fsum((2-x/(d*n))*(math.log(n) if logweight else 1) for n in range(x//(2*d)+1,x//d+1))
    for x in (X,X+1,3*X//2,2*X-1,2*X):
        I1=math.fsum(mu[d]*row(x,d,True) for d in range(1,U+1))
        I2=math.fsum(mu[d]*lam[e]*row(x,d*e) for d in range(1,U+1) for e in range(1,V+1) if lam[e])
        II=math.fsum(lam[m]*math.fsum(a[n]*(2-x/(m*n)) for n in range(max(U+1,x//(2*m)+1),x//m+1)) for m in range(V+1,x//(U+1)+1) if lam[m])
        w=math.fsum(lam[n]*(2-x/n) for n in range(x//2+1,x+1))
        wp=math.fsum(math.log(p)*(2-x/p) for p in prime if x//2<p<=x)
        model=x*(c*(M*(math.log(x)-P)-L)+k*M)
        assert abs(w-(I1-I2+II))<1e-7
        assert abs(I1-I2-model)<=2*U*math.log(x)+2*U*psi[V]+1e-7
        assert 0<=w-wp+1e-8<=12*math.sqrt(x)
        assert abs((c*x-wp)-(c*x-model-II))<=2*U*math.log(x)+2*U*psi[V]+12*math.sqrt(x)+1e-7
print('COEFFICIENT_CHECKS',checks,'SHELL_CASES',25,'PRIMES',len(prime))
```
No Lean replay. Original RH pinned root conditional half-strip verified previously; not evidence for this new lemma. No new external quantitative premises. No measured end-to-end acceleration. RESUME HERE: attack centered Type II by signed dispersion using alpha(n)=-sum_{d<=U,d|n}mu(d) and exact arithmetic centering; measure the lost exponent, do not use classwise absolute bounds again. HANDOFF TO prime-window, Landau, mathematics, kernel, audit, integration. RH OPEN.
