# Constructive geometric witnesses: golden-scale extrapolation and an exact interior cancellation

28 November 2026. New approach after the recursive alias obstruction. This uses the classical Nyman–Beurling approximation space (not a new equivalence; see Báez-Duarte, https://doi.org/10.1155/S0161171202013248 and https://www.bdim.eu/item?fmt=pdf&id=RLIN_2003_9_14_1_5_0). The proposed golden-related mixtures are exploratory constructions, not a claim of literature priority or that phi is uniquely useful. Actual numerical experiment performed in the local container. No worker/schedule changes or Lean verification.

## 1. Positive witness space and obstruction

Write t=1/x, x in (0,1], and b_n(x)={1/(n*x)}-{1/x}/n. On j<=t<j+1, j>=1 integer, b_n(x)={j/n}. For real coefficients c_n of finite support define r(x)=1+sum c_n b_n(x), A=sum c_n/n. Then r is constant on each such interval, with
 r_j=1+j*A-sum_n c_n floor(j/n);
 ||r||_2^2=sum_{j>=1} r_j^2/[j(j+1)].
A sequence with norm tending to zero would suffice for RH: for 0<Re s<1, integrate x^(s-1)b_n(x) over (0,1) to obtain -(n^(-s)-1/n)zeta(s)/s, by the standard fractional-part Mellin identity (the b_n difference vanishes for x>1). At a hypothetical zero rho with beta=Re rho>1/2 this implies integral r(x)x^(rho-1) dx=1/rho. Cauchy-Schwarz yields ||r||_2^2 >=(2 beta-1)/|rho|^2 for every witness. This is why finite error reduction is useful but cannot prove RH.

## 2. Construct the witnesses in linear time on the interior

For N>=2 set c_n(N)=mu(n)*(1-log n/log N) for n<=N, zero otherwise, and A_N=sum c_n(N)/n. These are classical logarithmically smoothed coefficients. For j<=N, using (mu*1)(k)=delta_(k,1) and ((mu log)*1)(k)=-Lambda(k),
 r_j(N)=j*A_N-psi(j)/log N.
The Euler linear sieve supplies mu and prime powers, hence psi and A_N in O(N) arithmetic operations (fixed precision). This is an exact formula for the interior, not a uniform error estimate.

Let M=floor(N/phi)>1. Use r_mix=(1-lambda)r(N)+lambda r(M); coefficients remain in the same witness space because the mixing weights sum to 1. For a finite range j<=L, the weighted least-squares minimizer is lambda=-<r(N),r(M)-r(N)>_L/||r(M)-r(N)||_L^2 if denominator nonzero. This scalar projection never increases the truncated squared norm relative to lambda=0. It is extrapolation, not necessarily a convex combination. For j<=M the exact interior formula persists, with A_mix=(1-lambda)A_N+lambda A_M and B_mix=(1-lambda)/log N+lambda/log M. Choosing lambda=-[1/log N]/[1/log M-1/log N] cancels B_mix identically. This produces a plateau coefficient c_n=mu(n) for n<=M and r_j=j*A_mix there.
With three cutoffs N,M,K=floor(M/phi), solve sum w_i=1, sum w_i/log N_i=0, sum w_i A_(N_i)=0 when the 3x3 determinant is nonzero. Then r_j=0 identically for 1<=j<=K, with no hypothesis on RH. This is an exact algebraic construction conditional only on the finite matrix being nonsingular. It transfers error to the tail; it need not improve the total norm. Do not mistake vanishing on the interior for RH. The finite matrices were numerically nonsingular in tested cases; no all-N nonsingularity theorem claimed.

## 3. Whole norm tail control and actual experiment

For all j, 0<=b_n<1, so |r_j|<=B=max(|1+sum_(c<0)c|,|1+sum_(c>0)c|). Consequently 0<=||r||^2-sum_(j<=L)r_j^2/[j(j+1)]<=B^2/(L+1). This bound is rigorous as a formula; the following evaluations used ordinary double precision, NOT interval-certified arithmetic. A full truncated sum uses divisor multiple accumulation O(L log N), not O(N); the core j<=N is O(N), and mixing is linear in the number of evaluated cells. Do not misstate complexity of the whole-tail experiment.

Executed Python/NumPy, L=2^21=2097152, cutoffs 16,64,256,1024, golden partners 9,39,158,632. Results, approximate lower and upper bounds on squared full norm using the elementary tail formula:
N,M,raw lower,raw upper,mixed lower,mixed upper,lambda
16,9,.1845222268,.1845254372,.0284101545,.0284181931,-3.684097343
64,39,.0864677497,.0864816627,.0268362904,.0269242138,-5.745923037
256,158,.0509836052,.0510868985,.0215579379,.0225844425,-6.976177399
1024,632,.0338960533,.0348862903,.0182288232,.0290179578,-6.941185375
At N=1024 the mixed approximate partial norm is 46.2% lower than the raw partial norm; the conservative tail enclosure still indicates an improvement, without claiming certified floating arithmetic. At N=64,256,1024 the three-cutoff exact-core construction had partial squared norms .03393716,.04021405,.02493805, and conservative upper evaluations .03398380,.04099563,.04835091. Thus perfect interior cancellation can perform worse than the two-cutoff optimized mixture. This is a useful negative control on overconstraining the geometry. No monotonicity or vanishing limit established.

Reproducible executed two-scale core:
```python
import numpy as np, math
Nmax=1024; L=2**21
mu=np.zeros(Nmax+1,dtype=np.int64); lp=np.zeros(Nmax+1,dtype=np.int64); primes=[];mu[1]=1
for n in range(2,Nmax+1):
 if lp[n]==0:lp[n]=n;primes.append(n);mu[n]=-1
 for p in primes:
  if n*p>Nmax:break
  lp[n*p]=p
  if n%p==0:mu[n*p]=0;break
  mu[n*p]=-mu[n]
j=np.arange(1,L+1,dtype=float); weight=1/(j*(j+1))
phi=(1+math.sqrt(5))/2
def witness(N):
 n=np.arange(1,N+1); c=mu[1:N+1]*(1-np.log(n)/math.log(N)); A=np.sum(c/n)
 arr=np.zeros(L+1)
 for k,v in enumerate(c,1):
  if v:arr[k::k]+=v
 r=1+j*A-np.cumsum(arr[1:])
 return r,c,A
def norm_bounds(r,c):
 lo=np.dot(weight,r*r)
 B=max(abs(1+c[c<0].sum()),abs(1+c[c>0].sum()))
 return lo,lo+B*B/(L+1)
for N in [16,64,256,1024]:
 M=int(N/phi);r,c,A=witness(N);s,d,B=witness(M);delta=s-r
 lam=-np.dot(weight*r,delta)/np.dot(weight*delta,delta)
 cc=(1-lam)*c;cc[:M]+=lam*d
 print(N,M,lam,norm_bounds(r,c),norm_bounds(r+lam*delta,cc))
```

## 4. Missing mathematical proof mechanism

A proof would require a constructive uniform upper bound tending to zero for the full squared residual of some witness sequence, including the far tail. Neither finite projection, exact interior cancellation nor the O(N) core proves it. The two-scale construction can be continued as multi-scale positive least-squares projection, but improvement at each finite stage does not guarantee zero limiting distance. The known Nyman-Beurling literature is the baseline; do not assert that these witnesses solve the open approximation problem. This is a genuinely different constructive experiment, not an independent proof or a claim that any RH root is now closed.