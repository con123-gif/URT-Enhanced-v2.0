# Linear golden energy scan: exact jump balance and unconditional squarefree injection

Follow-up to c396683c9fccf54acd0291b369641608411bdca0 (retrieved exact source, blob 341a6c1d7b48a037acba0514f4a5b780a20d6d6e), and the golden fractional-divisor criterion 9b48aa226562be65ddce76d4a4042cb009b63c20. This note analyzes the actual arithmetic sequence with an O(N) sieve and merged event scan. It establishes an exact deterministic energy identity and its diagonal term, NOT the signed bound needed for RH. No workers or schedules changed. No native Lean replay, interval-certified arithmetic, or claim of literature novelty.

## 1. Exact energy law

Let m(x)=sum_{n<=x} mu(n)/n, q(x)=phi*m(phi*x)-m(x), D(x)=x*q(x), and E(x)=D(x)^2/x=x*q(x)^2. Take right-continuous values. For x>=1 the exact divisor identity identifies D(x) with S(phi*x)-S(x), where S(x)=sum_{n<=x}mu(n){x/n}. Between events q is constant, so E'=q^2. At t=n the jump of D is epsilon_t=-mu(n); at t=n/phi the jump is epsilon_t=mu(n). The two event streams are disjoint by irrationality of phi. Equivalently Delta q=epsilon_t/t. At a jump,
 E(t)-E(t-)=2 epsilon_t q(t-)+epsilon_t^2/t.
For 1<=X<=Y the exact law is
 E(Y)-E(X)=A(X,Y)+J(X,Y)+C(X,Y),
 A=integral_X^Y q(x)^2 dx,
 J=sum_{X<t<=Y}epsilon_t^2/t,
 C=2 sum_{X<t<=Y}epsilon_t q(t-).
The cross term uses the pre-jump state. No independence assumption or averaging is involved. The signed term is NOT estimated by this identity; it is a re-expression of the energy increment, with the nonnegative drift and jump-square terms separated.

## 2. Unconditional diagonal limit

mu(n)^2=sum_{d^2|n}mu(d). Summing to x and using floor(y)=y+O(1) gives
 sum_{n<=x}mu(n)^2=x/zeta(2)+O(sqrt(x)).
Indeed the floor errors are O(sqrt x) and the tail of the absolutely convergent series sum mu(d)/d^2 is O(1/sqrt x). Partial summation then gives, uniformly for X>=1 and X<=Y<=2X,
 sum_{X<n<=Y}mu(n)^2/n=(6/pi^2)log(Y/X)+O(X^-1/2).
Thus
 J(X,Y)=(1+phi)*(6/pi^2)*log(Y/X)+O_phi(X^-1/2).
For Y=2X the limiting injection is 1.1031949027532257. In particular the accumulated injection from 1 to x is (1+phi)*(6/pi^2)*log x+O(1), unconditionally. The drift and signed cross term remain. Irrationality is used to keep events separate; the calculation works with other positive irrational dilation factors, and does not establish that phi is necessary.

## 3. Actual linear scan

Executed CPython NumPy/Numba on 13,573,056 integer entries (N=ceil(2*phi*2^22)+3); evaluated all 17 dyadic intervals X=2^6,...,2^22. The exact jump law was evaluated in double precision, not exact arithmetic. Measured normalized mean-square energy range about 0.04596 to 0.08979; not monotonically decreasing. Peak E over these blocks ranged up to about 0.710713. Signed C negative on each complete tested interval. Numerical residual for E(2X)-E(X)-A-J-C at most 5e-14 in absolute value. Selected actual output:

X, integral D^2/X^2, E(X), E(2X), A, J, C
64,0.08752559247,0.0111575269,0.01138725337,0.03760465366,1.110933451,-1.148308378
4096,0.06999193982,0.003659402933,0.1591910154,0.03188918933,1.102816587,-0.979174164
262144,0.05959769738,0.03981805877,0.00100427845,0.03133771207,1.103229466,-1.173380959
1048576,0.08045418588,0.005029617473,0.0002126096914,0.03833720171,1.103193703,-1.146347913
4194304,0.07604546409,0.01175280414,0.002194844111,0.04017939531,1.103191451,-1.152928806

The example X=4096 rejects monotone energy and rejects C<=-J as a universal proposed dyadic rule (numerically, with a large gap). The negative signed correlation observed in other intervals is NOT independent evidence for the infinite bound; the exact identity forces C to be close to -A-J whenever the endpoints remain close.

Reproducible core (same operations as actual run):
```python
import numpy as np, math
from numba import njit
@njit
def mob_sieve(N):
    mu=np.zeros(N+1,np.int8); lp=np.zeros(N+1,np.int32)
    primes=np.empty(N//2+1,np.int32); count=0; mu[1]=1
    for i in range(2,N+1):
        if lp[i]==0:
            lp[i]=i; primes[count]=i; count+=1; mu[i]=-1
        for j in range(count):
            p=primes[j]
            if i*p>N: break
            lp[i*p]=p
            if i%p==0: mu[i*p]=0; break
            mu[i*p]=-mu[i]
    return mu
@njit
def balance(X,phi,mu,prefix):
    n=X; l=int(phi*X); x=float(X); q=phi*prefix[l]-prefix[n]
    start=x*q*q; peak=start; drift=0.; diag=0.; cross=0.; area=0.; events=0
    while x<2*X:
        a=float(n+1); b=(l+1)/phi
        y=min(a,b,2.*X)
        drift+=q*q*(y-x)
        area+=q*q*(y-x)*(y*y+y*x+x*x)/3
        x=y; peak=max(peak,x*q*q)
        if x==a: n+=1; j=-mu[n]
        elif x==b: l+=1; j=mu[l]
        else: break
        diag+=j*j/x; cross+=2*q*j
        q=phi*prefix[l]-prefix[n]
        events+=1; peak=max(peak,x*q*q)
    end=x*q*q
    return area/(X*X),start,end,drift,diag,cross,end-start-drift-diag-cross,events,peak
phi=(1+math.sqrt(5))/2
N=math.ceil(2*phi*2**22)+3
mu=mob_sieve(N)
prefix=np.zeros(N+1); prefix[1:]=np.cumsum(mu[1:]/np.arange(1,N+1))
for i in range(6,23):
    print(2**i,balance(2**i,phi,mu,prefix))
```
Euler sieve O(N) fixed-precision arithmetic operations; prefix O(N); merged event pass O(N) total over disjoint dyadic blocks; O(N) storage. Not a bit-complexity claim or a validation of a URT-specific dynamic.

## 4. Sharp sufficient feedback estimate and limitation

A sufficient theorem would be A(X,Y)+C(X,Y)<=C0 for all dyadic X and all X<=Y<=2X, with an absolute C0 (or for each epsilon>0 an appropriate O_epsilon(X^epsilon) bound). The established uniform bound for J then implies E(Y)<=E(X)+O(1) and iteration yields E(x)=O(log(2x)). Therefore integral_X^(2X) D(x)^2 dx=O(X^2 log X), sufficient for RH via the previously derived dilation/Mellin argument. Merely checking complete block endpoints is insufficient for this inference; require all prefixes or an independently established averaged bound. No such theorem has been proved. A+C is itself E(Y)-E(X)-J, so obtaining this estimate merely by rearranging the identity would be circular. The analytic challenge is an independent upper bound on the signed pre-jump correlation that absorbs drift, not an additional finite scan. The calculation isolates a genuine arithmetic target and proves the injection constant; it does not establish signed stability, improve a known zero-free region, or close RH.

RESUME: seek an independent bound for the signed correlation using the actual multiplicative mu(n), preserving the exact pre-jump sign and both clocks. Do not count the energy balance identity or finite sign tests as a proof of that bound.