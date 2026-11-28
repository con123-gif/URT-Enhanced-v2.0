# Geometric witness: dual large-sieve tail bound and exact finite rational certificate
28 November 2026. Continuation of a13bb616098d23d291049a5d40185a49463136bc (exact source retrieved). This is a rigorous improvement of the full-norm tail enclosure and an actual integer-arithmetic certificate of a finite witness improvement. It is not an RH proof, an all-scale convergence theorem, a native Lean replay, or a literature-priority claim. The large sieve and Nyman-Beurling framework are classical. No worker or schedule changes.

## 1. Control the weighted tail directly by the positive divisor energy
For b_n(j)=(j mod n)/n, let r_j=1+sum_{n<=N} c_n b_n(j). Let Q(c) be its exact mean square over a common period, given in the prior note by
 Q(c) = (1+sum c_n(n-1)/(2n))^2 + (1/12) sum_{d=2}^N J_2(d)(sum_{d|n} c_n/n)^2.
Each sequence b_n has a finite discrete Fourier expansion with frequencies h/n modulo 1. Group frequencies into distinct reduced rational points a/d with d<=N, including 0. Their circular separations are >=1/N^2. If r_j=sum_alpha v_alpha exp(2pi i alpha j), exact period Parseval gives sum_alpha |v_alpha|^2=Q(c). There is no assumption of statistical independence.
Apply the dual of Montgomery-Vaughan's large sieve (The Large Sieve, Mathematika 20 (1973), theorem 1, DOI https://doi.org/10.1112/S0025579300004708; source https://personal.science.psu.edu/rcv4/personal/Publications/large_sieve.pdf, retrieved). The theorem bounds the squared operator norm of the sampling matrix by H+delta^(-1); the adjoint has the same norm. Thus, for every integer L>=0 and H>=1,
 sum_{j=L+1}^{L+H}|r_j|^2 <= (H+N^2)Q(c).
Put w_h=1/[(L+h)(L+h+1)] for h>=1. By summation by parts against the decreasing weights, using the preceding bound and nonnegative increments w_h-w_(h+1), the entire tail satisfies
  0 <= sum_{j>L} r_j^2/[j(j+1)]
     <= Q(c)[1/(L+1)+N^2/((L+1)(L+2))].
Indeed sum_h h(w_h-w_(h+1))=sum_h w_h=1/(L+1), and sum_h (w_h-w_(h+1))=w_1. The finite boundary term tends to zero since the cumulative bound is linear in H at fixed N. This directly bounds the tail by the actual signed quadratic energy, without summing absolute pairwise errors or enumerating the common period. It applies to arbitrary finite real or complex coefficients (use the modulus-square version of Q).
A more explicit asymptotic consequence: for |c_n|<=C log(N/n)/log N, the nonconstant Fourier energy is O(C^2 N/log^2 N). In fact |sum_{d|n}c_n/n| <= C/(d log N) * sum_{k<=N/d} log(N/(dk))/k <= C/(d log N) * (log(N/d)+log^2(N/d)), using the harmonic sum bound. Since J2(d)<=d^2, sum over d and use sum_{d<=N} (1+log(N/d))^4=O(N), by comparison with N integral_0^1(1+log(1/t))^4dt plus the first term. Thus if the mean is zero, or its contribution is separately controlled, the tail above L=floor(N^(3/2)) is O(C^2/log^2 N) for bounded C. This is conditional on the coefficient envelope and mean control, not a construction with total residual tending to zero. The unresolved intermediate range remains.

## 2. Actual multiscale test using the new bound
Executed local CPython/NumPy with N=2048 and L=2^20, same seven cutoffs [114,184,298,483,782,1265,2048]. Optimize the positive upper-bound quadratic form, i.e. H=G+f Qgram with f=1/(L+1)+N^2/((L+1)(L+2)), where G is the partial residual Gram matrix. Solve H w=1 and normalize to sum w=1. Ordinary floating-point only at this optimization stage.
Results for largest cutoff 2048: one-scale partial .02840077085065851 and upper .02840618986998008; two-scale partial .017363047985258857 and upper .017415137082681654; seven-scale partial .01077568701836862 and upper .01080071333620276. The preceding note's conservative upper evaluation .04769747481 for seven scales was too loose; this replaces that bound. Other tested cutoff values: 184 seven-scale upper .01233577311751193, 782 seven-scale upper .010691976409959983. No monotonicity claimed.

## 3. Independently certify the chosen rational coefficient vectors
Optimization only selects the coefficients; every following bound is exact integer or rational arithmetic. Round each selected real coefficient to an integer C_n over S=2^49. This defines the actual witnesses certified (not the unrounded irrational coefficients). Set z_n=floor(C_n/n), A=sum z_n. Let R_j=S+j*A-sum C_n floor(j/n). The true scaled residual differs from R_j by at most j*N since |z_n-C_n/n|<1. Therefore bracket each partial norm term between max(0,|R_j|-jN)^2/[S^2 j(j+1)] and (|R_j|+jN)^2/[S^2 j(j+1)]. Round outward at unit 2^-60 before summing. For the period energy, use exact J2 and the bounds
 12 S^2 Q <= 3 (|2S+sum C_n-A|+N)^2
             +sum_{d=2}^N J2(d)(|sum_{d|n} z_n|+floor(N/d))^2.
All integer intermediate sizes in the vectorized accumulation are checked below: the single-cell increment has size <=|A|+sum |C_n| and every cumulative value is bounded by S+sum |C_n|+L*N, plus an extra S for shifting. Python integers handle squares and rational comparisons.
Actual executed output:
 weights = [-1.75123529034962, 0.7145634582833187, 0.4261633941287265, -0.6222166294721766, 0.8905641867723593, -2.233460664214103, 3.575621544851495]
 single lower .028400770788351334, upper .028406189922611964, Q upper 1.1364535387697707
 seven lower .010775686910574383, upper .01080071344167995, Q upper 5.248412263655807
 EXACT_GUARDS_PASS; improvement_lower (decimal report) .6197035100853707.
Exact threshold assertions: seven full squared norm <1081/100000=.01081, single full squared norm >284/10000=.0284. Consequently the relative reduction is at least 61.9% (even the coarse thresholds give >61.9%). Decimal printouts are approximate displays of exact rational bounds, not additional proof claims.

Executed reproducible core (OPENBLAS_NUM_THREADS=2):
```python
import numpy as np, math
from fractions import Fraction
N=2048; L=2**20; S=2**49; K=2**60
mu=np.zeros(N+1,dtype=np.int64);lp=np.zeros(N+1,dtype=np.int32);ps=[];mu[1]=1
for n in range(2,N+1):
 if lp[n]==0:lp[n]=n;ps.append(n);mu[n]=-1
 for p in ps:
  j=n*p
  if j>N:break
  lp[j]=p
  if n%p==0:mu[j]=0;break
  mu[j]=-mu[n]
n=np.arange(1,N+1);g=np.gcd(n[:,None],n[None,:]);cv=(g.astype(float)**2-1)/(12*n[:,None]*n[None,:]);mean=(1-1/n)/2
scales=[114,184,298,483,782,1265,2048];j=np.arange(1,L+1,dtype=float);root=np.sqrt(1/(j*(j+1)))
C=[];R=[]
for m in scales:
 c=np.zeros(N);c[:m]=mu[1:m+1]*(1-np.log(n[:m])/np.log(m));C.append(c)
 arr=np.zeros(L+1)
 for k in np.flatnonzero(c)+1:arr[k::k]+=c[k-1]
 R.append((1+j*(c/n).sum()-np.cumsum(arr[1:]))*root)
C=np.array(C);R=np.array(R);G=R@R.T;avg=(1+C@mean)[:,None]*(1+C@mean)[None,:]+C@cv@C.T
f=Fraction(1,L+1)+Fraction(N*N,(L+1)*(L+2));H=G+float(f)*avg
w=np.linalg.solve(H,np.ones(7));w/=w.sum()
J2=[d*d for d in range(N+1)]
for p in ps:
 for d in range(p,N+1,p):J2[d]=J2[d]//(p*p)*(p*p-1)
assert all(J2[d]==sum(int(mu[k])*(d//k)**2 for k in range(1,d+1) if d%k==0) for d in range(1,N+1))
def certify(c):
 v=[0]+[int(round(float(a)*S)) for a in c]
 z=[0]+[a//i for i,a in enumerate(v[1:],1)]
 A=sum(z);B=sum(abs(a) for a in v);bound=S+B+L*N
 assert abs(A)+B<2**63 and bound+S<2**63
 arr=np.full(L+1,A,dtype=np.int64);arr[0]=0
 for i,a in enumerate(v[1:],1):
  if a:arr[i::i]-=a
 Rint=np.cumsum(arr[1:],dtype=np.int64)+S
 lo=hi=0;SS=S*S
 for j,r in enumerate(Rint,1):
  a=abs(int(r));e=j*N;den=SS*j*(j+1)
  lo+=K*max(0,a-e)**2//den
  hi+=(K*(a+e)**2+den-1)//den
 qnum=3*(abs(2*S+sum(v)-A)+N)**2
 for d in range(2,N+1):qnum+=J2[d]*(abs(sum(z[d::d]))+N//d)**2
 qhi=Fraction(qnum,12*SS)
 return Fraction(lo,K),Fraction(hi,K)+f*qhi,qhi
base=certify(C[-1]);mix=certify(w@C)
for name,res in [('single',base),('seven',mix)]: print(name,*(float(a) for a in res))
assert mix[1]<Fraction(1081,100000)
assert base[0]>Fraction(284,10000)
print('EXACT_GUARDS_PASS',float(1-mix[1]/base[0]))
```

## 4. Remaining proof problem
The new tail bound removes the prior numerical tail ambiguity for the largest tested cutoff. It does NOT show that the entire sequence of witness norms tends to zero; finite optimization, even certified, does not exclude an off-line zero. An unconditional vanishing intermediate-range estimate for actual coefficient vectors is still required. The Euler sieve and core interior are O(N) arithmetic operations, but the full certificate evaluates L terms and divisor-multiple accumulations, and the experiment uses a dense covariance matrix. Do not call the full algorithm O(N). No change to the main compact proof lanes.