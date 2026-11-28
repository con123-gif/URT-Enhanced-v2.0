# Full-coefficient geometric projection: matrix-free arithmetic construction and rational comparison

28 November 2026. Continuation of d4264eabef56ed2e25820089454e9e8726d6377c (retrieved exact source). This is an actual new numerical construction and rigorous finite rational comparison using the prior large-sieve tail theorem. It removes the restriction to seven logarithmically smoothed golden-related witnesses; it is not an all-scale convergence result or RH proof. No native Lean execution, worker/schedule changes, originality claim, or claim that the original URT dynamical kernel is used.

## 1. Exact forward/adjoint arithmetic reduction

Let N>=2, L>=1, c_1=0 (b_1 is identically zero), b_n(j)=(j mod n)/n and r_j=1+sum_{n=2}^N c_n b_n(j). The prior unconditional tail theorem gives
 W(c)=sum_{j>=1} r_j^2/[j(j+1)] <= U(c)=sum_{j<=L} r_j^2/[j(j+1)] + f Q(c),
 f=1/(L+1)+N^2/((L+1)(L+2)),
 Q(c)=(1+sum c_n(1-1/n)/2)^2+sum_{d=2}^N (J2(d)/12)(sum_{d|n} c_n/n)^2.

Write U(c)=||t+B c||_2^2, where t has partial coordinates w_j=1/sqrt(j(j+1)), mean coordinate sqrt(f), other coordinates zero. For the partial rows, put A=sum c_n/n, inc_j=A-sum_{n|j}c_n; (Bc)_j=w_j sum_{k<=j}inc_k. For the mean row (Bc)_mean=sqrt(f) sum c_n(1-1/n)/2. For each divisor row d>=2, (Bc)_d=sqrt(f J2(d)/12) sum_{d|n}c_n/n.

For an arbitrary dual vector y define h_j=w_j y_j and H_k=sum_{j=k}^L h_j. Exact adjoint of the partial rows is
 (B^*y)_n = (sum_j j h_j)/n - sum_{k<=L, n|k} H_k,
 with additions sqrt(f)y_mean(1-1/n)/2 and (1/n)sum_{d|n,d>=2}sqrt(f J2(d)/12)y_d.
This follows by interchanging finite sums in floor(j/n)=sum_{k<=j,n|k}1. Both forward and adjoint use prefix/suffix scans and multiple accumulation, O(L log(2N)+N log(2N)) arithmetic operations per application and O(L+N) storage. No dense N by N Gram or L by N witness matrix is needed for the full coefficient optimization. Not strictly O(N) overall; bit complexity, iteration count and L growth are separate. This removes the fixed seven-dimensional search constraint, NOT the asymptotic arithmetic obstacle.

## 2. Actual local run

Executed /tmp/rhproj.py in the local container with CPython, NumPy, SciPy LSQR and Numba JIT, OPENBLAS_NUM_THREADS=1. Reweighted coefficients by sqrt(n) to precondition the iteration. Initialize from the best seven-scale mixture for the SAME U(c); then apply 180 LSQR iterations at each N. Iteration limit reached at all three N; no claim of finite optimality. The selected floating-point coefficients were rounded to C_n/2^49 and independently compared with rational arithmetic using the prior prefix and J2 enclosure. Exact rational inequality upper(new)<lower(old) passed on all three cases. No extrapolation.

N,L,seven_lower,seven_upper,all_lower,all_upper,minimum_relative_reduction
256,32768,0.012043125468802016,0.012129875807207362,0.00822092948002593,0.008288231119005115,0.31178736446149624
1024,131072,0.010766249821724095,0.010966509276193848,0.006538201849757135,0.006644461033056947,0.3828435023261508
2048,262144,0.01076921670056039,0.011094075217947452,0.006138553194784768,0.006262066141450511,0.41852167009280666

All upper/lower decimal displays are rounded reports of exact rational comparisons. At N=2048, the three partial-band upper evaluations and far-tail upper evaluation are:
 band: seven, unrestricted
 j<=N: .007524676196903504, .004873702856695124
 N<j<=floor(N^(3/2)): .0032090055260614227, .0012506231090500157
 floor(N^(3/2))<j<=L: .000035535150482234046, .000014227349112281087
 j>L: .00032485834450029046, .0001235128265930902
 Q upper: 5.0094471893615955, 1.9046177895741525
 The band comparisons are upper evaluations, not independently certified relative reductions between exact band energies. The total relative reduction is certified by the exact upper/lower comparison. Adjoint check relative discrepancies 2.72e-13, 1.95e-13, 9.25e-12 (floating-point test only; exact adjoint proof above).

## 3. Reproducible executed algorithm

```python
import numpy as np, math
from scipy.sparse.linalg import LinearOperator,lsqr
from numba import njit
from fractions import Fraction
@njit
def fw(c,w,t,jr):
 N=len(c)-1; L=len(w); a=np.zeros(L+1); A=0.;mean=0.
 for n in range(2,N+1):
  A+=c[n]/n;mean+=c[n]*(1-1/n)/2
  for j in range(n,L+1,n):a[j]-=c[n]
 out=np.zeros(L+N);s=0.
 for j in range(1,L+1):s+=a[j]+A;out[j-1]=w[j-1]*s
 out[L]=t*mean
 for d in range(2,N+1):
  v=0.
  for n in range(d,N+1,d):v+=c[n]/n
  out[L+d-1]=jr[d]*v
 return out
@njit
def bw(y,w,t,jr,N):
 L=len(w);sf=np.zeros(L+1);s=0.;jv=0.
 for j in range(L,0,-1):
  v=y[j-1]*w[j-1];s+=v;sf[j]=s;jv+=j*v
 out=np.zeros(N+1)
 for n in range(2,N+1):
  s=jv/n
  for j in range(n,L+1,n):s-=sf[j]
  out[n]=s+t*y[L]*(1-1/n)/2
 for d in range(2,N+1):
  v=jr[d]*y[L+d-1]
  for n in range(d,N+1,d):out[n]+=v/n
 return out

def run(N,L):
 mu=np.ones(N+1,dtype=np.int64);mu[0]=0;prime=np.ones(N+1,dtype=bool); J2=np.arange(N+1,dtype=np.int64)**2
 for p in range(2,N+1):
  if prime[p]:
   prime[2*p::p]=False;mu[p::p]*=-1;mu[p*p::p*p]=0;J2[p::p]=J2[p::p]//(p*p)*(p*p-1)
 j=np.arange(1,L+1,dtype=float);w=1/np.sqrt(j*(j+1));f=Fraction(1,L+1)+Fraction(N*N,(L+1)*(L+2));t=math.sqrt(float(f));jr=np.sqrt(float(f)*J2/12)
 target=np.zeros(L+N);target[:L]=w;target[L]=t
 pre=np.sqrt(np.arange(2,N+1,dtype=float))
 def forward(z):return fw(np.r_[0.,0.,z*pre],w,t,jr)
 def backward(y):return bw(y,w,t,jr,N)[2:]*pre
 op=LinearOperator((L+N,N-1),matvec=forward,rmatvec=backward,dtype=float)
 phi=(1+math.sqrt(5))/2;C=[];R=[]
 for m in sorted(set(int(N/phi**k) for k in range(7))):
  c=np.zeros(N+1);n=np.arange(2,m+1);c[2:m+1]=mu[n]*(1-np.log(n)/math.log(m));C.append(c);R.append(target+fw(c,w,t,jr))
 R=np.array(R);C=np.array(C);H=R@R.T;weights=np.linalg.solve(H,np.ones(len(C)));weights/=weights.sum();base=weights@C
 rng=np.random.default_rng(7);z=rng.normal(size=N-1);y=rng.normal(size=L+N);a=forward(z)@y;b=z@backward(y);print('adjoint relative error',abs(a-b)/max(1,abs(a),abs(b)))
 sol=lsqr(op,-target,atol=1e-11,btol=1e-11,iter_lim=180,x0=base[2:]/pre);c=np.r_[0.,0.,sol[0]*pre];print('N,L,iters',N,L,sol[2],flush=True)
 vals=[]
 for name,c in [('seven',base),('all',c)]:
  S=2**49;K=2**60;v=[round(float(x)*S) for x in c];z=[0]+[v[n]//n for n in range(1,N+1)];A=sum(z);B=sum(abs(x) for x in v);assert S+B+L*N<2**63 and abs(A)+B<2**63
  inc=np.full(L+1,A,dtype=np.int64);inc[0]=0
  for n in range(2,N+1):inc[n::n]-=v[n]
  ri=np.cumsum(inc[1:],dtype=np.int64)+S;lo=hi=0;parts=[0,0,0]
  for j,r in enumerate(ri,1):
   a=abs(int(r));e=j*N;den=S*S*j*(j+1);lo+=K*max(0,a-e)**2//den;u=(K*(a+e)**2+den-1)//den;hi+=u;parts[0 if j<=N else 1 if j<=int(N**1.5) else 2]+=u
  q=3*(abs(2*S+sum(v)-A)+N)**2
  for d in range(2,N+1):q+=int(J2[d])*(abs(sum(z[d::d]))+N//d)**2
  qhi=Fraction(q,12*S*S);low=Fraction(lo,K);upper=Fraction(hi,K)+f*qhi;vals.append((low,upper));print(name,'lower',float(low),'upper',float(upper),'parts',*[a/K for a in parts],'tail',float(f*qhi),'Q',float(qhi),flush=True)
 assert vals[1][1]<vals[0][0];print('exact reduction',float(1-vals[1][1]/vals[0][0]),flush=True)
for N,L in [(256,32768),(1024,131072),(2048,262144)]:run(N,L)
```

Rational comparison rationale: for the rounded v_n, A=sum floor(v_n/n), the scaled residual differs from the accumulated integer prefix by at most jN, so the squared terms are bracketed and rounded outward at 2^-60. Signed 64-bit increments bounded by |A|+B and prefix values by S+B+LN, with B=sum |v_n|. Q is enclosed using the exact Jordan totient and the divisor-sum floor errors as in the prior note. Python integer squares and Fraction comparisons are exact. This certifies the selected rational vectors, not that LSQR finds the true minimizer.

## 4. Remaining theorem
The unrestricted coefficient construction directly reduces both the intermediate band and the full-norm upper bound in these finite examples. The necessary all-scale vanishing upper bound is still unproved. Finite-dimensional least squares can approach a strictly positive limiting distance; a hypothetical off-line zero gives a positive lower bound for every geometric witness. Do not equate numerical descent, matrix-free optimization, or an exact finite comparison with proof of density. The next useful step would be an independent constructive all-scale estimate, not simply a larger numerical scan.