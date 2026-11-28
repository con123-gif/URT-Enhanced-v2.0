# Multiscale geometric witnesses — exact gcd tail energy and controlled projection

28 November 2026. Continuation of b9a8d604d12fece26519e359cfad4d202b85b979 (exact source retrieved). Classical Nyman–Beurling setting. New work here is an elementary periodic-tail calculation and numerical multiscale construction; no priority claim, RH proof, or changes to workers/schedules. The tail formula is rigorous; actual numerical evaluations are double precision, not interval-certified.

## 1. Exact positive tail geometry

Write b_n(j)=(j mod n)/n, r_j=1+sum_{n<=N}c_n b_n(j), and W=sum_{j>=1}r_j^2/[j(j+1)]. In the prior note this is exactly the geometric witness squared norm. Let angle brackets denote the average over any common period (no need to construct that huge period). Then
 mean_n=(n-1)/(2n),
 cov(b_n,b_m)=(gcd(n,m)^2-1)/(12nm).
Proof: for g=gcd(n,m), condition a uniform residue j modulo lcm(n,m) on j mod g=a. The pair of quotients of the residues modulo n and m ranges independently and uniformly over 0,...,n/g-1 and 0,...,m/g-1 by the Chinese remainder theorem. Conditional means are (n-g)/(2n)+a/n and (m-g)/(2m)+a/m. The conditional covariance is zero. The covariance of these means is Var(a)/(nm)=(g^2-1)/(12nm).

Using the Jordan totient J_2(d), defined by J_2(d)=d^2 prod_{p|d}(1-p^(-2)), the divisor identity sum_{d|g} J_2(d)=g^2 gives the exact positive formula
 Q(c)=<r_j^2> = (1+sum c_n(n-1)/(2n))^2 + (1/12)sum_{d=2}^N J_2(d) (sum_{d|n}c_n/n)^2.
This eliminates the full common period and displays the mean tail as a sum of squares on the divisor lattice. Direct multiples accumulation of all inner sums is O(N log N), not O(N); alternatively a prime-by-prime divisibility zeta transform needs O(N log log N) arithmetic operations via sum_{p<=N} floor(N/p), with the ordering chosen to include prime powers. No strict O(N) claim for this transform. The dense covariance matrix was used for the small experiment.

## 2. Rigorous finite-tail enclosure

If a sequence f_j is periodic of integer period P and lies in [0,1], centered partial sums starting at any index are bounded in absolute value by P, since complete periods vanish. Summation by parts against the positive decreasing weight 1/[j(j+1)] gives
 |sum_{j>L}(f_j-<f>) /[j(j+1)]| <= min(P/((L+1)(L+2)),1/(L+1)).
Apply to b_n with period n and b_n b_m with period lcm(n,m), and expand r_j^2. With e(P)=min(P/((L+1)(L+2)),1/(L+1)),
 |W - sum_{j<=L}r_j^2/[j(j+1)] - Q(c)/(L+1)|
 <= 2 sum_n |c_n|e(n) + sum_{n,m}|c_nc_m| e(lcm(n,m)).
This bound is deterministic, valid for arbitrary real coefficients, no conjectural cancellation. In particular the error is at most [2B+B^2]/((L+1)(L+2)), B=sum n|c_n|, by lcm<=nm. Hence for each fixed coefficient vector we can evaluate the whole squared norm to arbitrary accuracy without enumerating the full period. This does NOT provide an asymptotically vanishing witness norm. For growing N the coefficient growth and intermediate tail must still be controlled.

## 3. Actual numerical multiscale experiment

Executed CPython NumPy, OPENBLAS_NUM_THREADS=2, N=2048, L=2^20. Euler sieve mu and smoothed witnesses c_n(M)=mu(n)(1-log(n)/log(M)) for n<=M, on golden-related cutoffs floor(2048/phi^k)>=2. Let H be the Gram of the finite weighted residual vectors plus Q cross-Gram/(L+1). For each chosen group of k witnesses, solve H w=1 then normalize sum w=1. This minimizes the estimated full squared norm on the affine span provided H is positive definite (in these numerical solves no singularity reported). Negative weights allowed. Tail bound evaluated for the resulting coefficient vector; not a certified optimizer of the exact full norm.

Selected output (partial, conservative upper evaluation), ordinary double precision:
largest cutoff | one scale | two scales | seven scales
184 | .05702515818,.05702617836 | .02481827055,.02483572334 | .01233517302,.01233907919
782 | .03609955474,.03625063170 | .01739071981,.02184281183 | .01068811511,.01208334967
2048 | .02840077085,.03334774950 | .01736291480,.13386923191 | .01077563808,.04769747481
Seven-scale cutoff groups respectively [10,16,26,43,70,114,184], [43,70,114,184,298,483,782], [114,184,298,483,782,1265,2048]. At 782 seven-scale upper evaluation is less than the single-scale partial norm by about 66.5%; at 2048 the available conservative upper bound does not establish improvement despite smaller partial residual. Not monotone, and not a claim of certified roundoff. Actual experiment script:
```python
import numpy as np, math
N=2048; L=2**20; phi=(1+math.sqrt(5))/2
mu=np.zeros(N+1,np.int32); lp=np.zeros(N+1,np.int32); ps=[];mu[1]=1
for n in range(2,N+1):
 if not lp[n]:lp[n]=n;ps.append(n);mu[n]=-1
 for p in ps:
  j=n*p
  if j>N:break
  lp[j]=p
  if n%p==0:mu[j]=0;break
  mu[j]=-mu[n]
n=np.arange(1,N+1);g=np.gcd(n[:,None],n[None,:])
cv=(g.astype(float)**2-1)/(12*n[:,None]*n[None,:]);mean=(1-1/n)/2
scales=sorted({int(N/phi**k) for k in range(30) if int(N/phi**k)>=2})
J=np.arange(1,L+1,dtype=float);root=np.sqrt(1/(J*(J+1)))
C=[];R=[]
for m in scales:
 c=np.zeros(N);c[:m]=mu[1:m+1]*(1-np.log(n[:m])/np.log(m));C.append(c)
 arr=np.zeros(L+1)
 for k in np.flatnonzero(c)+1:arr[k::k]+=c[k-1]
 R.append((1+J*(c/n).sum()-np.cumsum(arr[1:]))*root)
C=np.array(C);R=np.array(R);G=R@R.T
avg=(1+C@mean)[:,None]*(1+C@mean)[None,:]+C@cv@C.T
period=n[:,None]*n[None,:]/g
err=np.minimum(period/((L+1)*(L+2)),1/(L+1))
e1=np.minimum(n/((L+1)*(L+2)),1/(L+1))
for m in (256,1024,2048):
 ids=np.flatnonzero(np.array(scales)<=m);ids=ids[-min(7,len(ids)):]
 for k in [1,2,len(ids)]:
  idx=ids[-k:];H=(G+avg/(L+1))[np.ix_(idx,idx)]
  w=np.linalg.solve(H,np.ones(k));w/=w.sum()
  c=w@C[idx];partial=w@G[np.ix_(idx,idx)]@w
  tailmean=w@avg[np.ix_(idx,idx)]@w/(L+1)
  e=2*np.abs(c)@e1+np.abs(c)@err@np.abs(c)
  print(np.array(scales)[idx],partial,partial+tailmean+e)
```

## 4. Mathematical remaining target

The exact gcd quadratic form controls the average over the tail period; the explicit error controls the difference from weighted tail. Neither controls the entire intermediate interval at increasing cutoff. A constructive proof would need coefficients c^(N) and L_N with the partial residual ->0, Q(c^(N))/(L_N+1)->0 and the explicit error ->0, or another uniform full-norm proof. Choosing L_N huge for each N controls the latter two terms but makes the first term effectively the original norm problem. Do not treat this decomposition or finite numerical decreases as establishing convergence. The O(N) sieve/interior reduction is retained; the full experimental computation is not O(N). No independent proof of RH obtained.