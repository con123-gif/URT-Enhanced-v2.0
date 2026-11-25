# Fractal discrepancy recursion and actual prime test
2026-11-25. Conditional shell reduction, numerical exploratory result; no RH proof or URT advantage claimed. Follows single discrepancy commit 057d61df7aaeecb3d64fec6fe11a3f94c05a8a39. User noted earlier URT fractal work.

For r>1 let a_n=Lambda(n)-1, K_x(n)=1-{x/n}, M_j=floor(x/r^j), and B_j=sum_{M_(j+1)<n<=M_j} a_n K_x(n). Define R_j=(sum_{n<=M_j} a_n K_x(n))/sqrt(x/r^j), b_j=B_j/sqrt(x/r^j). Then EXACTLY R_j=b_j+r^(-1/2)R_(j+1), terminating at M_j=0. For r=phi^2 the coefficient is exactly 1/phi; for r=phi it is 1/sqrt(phi). No prime law assumed, and the same algebra holds for arbitrary sequences. This is not a closed recurrence: the b_j are independent arithmetic inputs, not bounded automatically.

If b_j>=-C_eps*x^eps for every nonempty shell uniformly at each x in arbitrarily distant fixed-width multiplicative windows, then R_0>=-C_eps*x^eps/(1-r^(-1/2)); by prior centered discrepancy reduction and singleton Landau criterion, such a bound for every small eps>0 implies RH. Absolute bounds are stronger than necessary. No proof of this premise. r=phi is not mathematically distinguished by the recursion alone.

## Actual finite calculation
Executed CPython with NumPy sieve through 2,000,000, 121 logarithmically spaced integer x from 1000 through 2,000,000. Shell boundaries computed with floating powers; prime weights and prefix sums floating. Compared fixed r=pi/e, phi, 2, phi^2, e; no fitting. For each nonempty block calculate |B_j|/sqrt(number of integers in shell). Also measure sum of absolute shell contributions divided by sqrt(x). Results:
r | shell count | maximum |B_j|/sqrt(length) | max sum |B_j|/sqrt(x)
pi/e | 8111 | 2.791508 | 3.706406
phi | 2699 | 2.363065 | 1.782453
2 | 1929 | 2.534467 | 1.593854
phi^2 | 1407 | 2.543721 | 1.593902
e | 1357 | 2.012395 | 1.553131

Full signed discrepancy divided by sqrt(x): sampled range [-0.25810575,0.25831286]. Direct vector sum vs grouped evaluation at x=1000,10000,100000,2000000 absolute differences 1.50e-12,1.27e-11,1.68e-9,1.21e-7 respectively. Shell sum vs grouped total max discrepancy 2.62e-12 across all scale tests. Not a uniform numerical certificate, not a proof of asymptotic cancellation, no phi-specific advantage; e best among this finite sample by both absolute metrics, but comparing different partitions with different shell counts cannot establish superiority. No golden-angle phase inserted. Next derive b_j bound from arithmetic, especially j=0 (largest shell). If possible prove a direct transfer between scales rather than just accounting.

Reproduction (executed):
```python
import numpy as np, math
N=2_000_000
p=np.ones(N+1,dtype=bool);p[:2]=False
for i in range(2,math.isqrt(N)+1):
 if p[i]:p[i*i::i]=False
lam=np.zeros(N+1)
for prime in np.flatnonzero(p):
 j=int(prime);l=math.log(j)
 while j<=N:
  lam[j]=l;j*=int(prime)
a=lam[1:]-1
A=np.r_[0.,np.cumsum(a)]; B=np.r_[0.,np.cumsum(a/np.arange(1,N+1))]
def sub(x,lo,hi):
 if lo>hi:return 0.
 s=0.
 while lo<=hi:
  q=x//lo;end=min(hi,x//q)
  s+=(1+q)*(A[end]-A[lo-1])-x*(B[end]-B[lo-1]);lo=end+1
 return s
xs=np.unique(np.geomspace(1000,N,121).astype(int))
for x in [1000,10000,100000,2000000]:
 n=np.arange(1,x+1);d=np.sum(a[:x]*(1-(x%n)/n));s=sub(x,1,x);print('direct',x,s,d,abs(s-d))
phi=(1+5**.5)/2
S=np.array([sub(int(x),1,int(x)) for x in xs]);print('total normalized min max',np.min(S/np.sqrt(xs)),np.max(S/np.sqrt(xs)))
for r in [math.pi/math.e,phi,2,phi**2,math.e]:
 maxnorm=0.; maxsum=0.; error=0.; counts=0
 for x,full in zip(xs,S):
  x=int(x); hi=x; blocks=[]; j=0
  while hi:
   lo=int(x/r**(j+1)); j+=1
   if lo==hi:continue
   val=sub(x,lo+1,hi);blocks.append(val);maxnorm=max(maxnorm,abs(val)/math.sqrt(hi-lo));counts+=1;hi=lo
  error=max(error,abs(sum(blocks)-full));maxsum=max(maxsum,sum(map(abs,blocks))/math.sqrt(x))
 print(r,counts,maxnorm,maxsum,error)
```
