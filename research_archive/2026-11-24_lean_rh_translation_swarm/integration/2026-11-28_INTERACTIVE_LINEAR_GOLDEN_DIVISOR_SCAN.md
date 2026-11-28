# O(N) golden-dilation energy scan — exact reduction, numerical test
28 November 2026. Follow-up to 9b48aa226562be65ddce76d4a4042cb009b63c20. The user's O(N) idea is implemented here as a shared-prefix/one-pass arithmetic reduction. This is not the original dynamical URT kernel and no URT-specific speed advantage is claimed. No RH proof or new zero-free region. No schedules changed.

For x>=1 define m(x)=sum_{n<=x} mu(n)/n and S(x)=sum_{n<=x}mu(n){x/n}. The exact divisor identity gives S(x)=x m(x)-1. Consequently D(x)=S(phi*x)-S(x)=x[phi*m(phi*x)-m(x)]. Between consecutive breakpoints from the sorted sets of integers and integer multiples of 1/phi the coefficient c=phi*m(phi*x)-m(x) is constant, hence the exact contribution to integral D^2 on [a,b] is c^2(b^3-a^3)/3. This eliminates every explicit pairwise divisor interaction from the numerical energy. An Euler linear sieve supplies mu(1),...,mu(N) in O(N) arithmetic operations, followed by one prefix pass. Merge the two already sorted breakpoint streams in O(N) operations, or use at most 3 subintervals per unit cell since phi<2. Space O(N). This counts fixed-precision arithmetic operations, not arbitrary-precision bit complexity. It does not prove a uniform bound on the resulting energy.

## Actual execution
Python/NumPy in local container, long-double prefix sums and interval contributions, N=848318, Xmax=262144. Sieve assigned 780825 composite entries once and found 67492 primes. Sieve plus prefix elapsed 0.346 seconds on this run; final energy scan 0.1376 seconds. 100 random direct divisor-sum comparisons with x in (2,300) (seed 221) gave maximum absolute discrepancy 1.1249031220406103e-14. No exact numerical certification claimed.

X,subintervals,energy/X^2
64,168,0.0875255925
256,670,0.0897804845
1024,2681,0.0785151731
4096,10723,0.0699919398
16384,42894,0.0751926336
65536,171575,0.0621132935
262144,686302,0.0595976974

Reproducible core:
```python
import numpy as np, math
Xmax=2**18
phi=(1+math.sqrt(5))/2
N=math.ceil(2*phi*Xmax)+2
m=[0]*(N+1); l=[0]*(N+1); m[1]=1; primes=[]
for i in range(2,N+1):
    if l[i]==0: l[i]=i; primes.append(i); m[i]=-1
    for q in primes:
        j=i*q
        if j>N: break
        l[j]=q
        if i%q==0: m[j]=0; break
        m[j]=-m[i]
prefix=np.zeros(N+1,dtype=np.longdouble)
prefix[1:]=np.cumsum(np.asarray(m[1:],dtype=np.longdouble)/np.arange(1,N+1,dtype=np.longdouble),dtype=np.longdouble)
p=(1+np.sqrt(np.longdouble(5)))/2
def energy(X):
    j=np.arange(X,2*X,dtype=np.int64)
    left=j.astype(np.longdouble); right=left+1
    k=np.floor(p*left).astype(np.int64)
    total=np.longdouble(0)
    for offset in range(3):
        a=np.maximum(left,(k+offset)/p); b=np.minimum(right,(k+offset+1)/p)
        good=b>a
        a=a[good]; b=b[good]
        coef=p*prefix[(k+offset)[good]]-prefix[j[good]]
        total+=np.sum(coef**2*(b-a)*(a*a+a*b+b*b)/3,dtype=np.longdouble)
    return total
for X in [2**i for i in (6,8,10,12,14,16,18)]:
    print(X,float(energy(X)/X**2))
```
RESUME: a proof that energy=O_epsilon(X^(2+epsilon)) for all X is still missing; the finite data cannot establish it. The scan is useful to find structure and test candidate bounds without quadratic recomputation. No native Lean verification.