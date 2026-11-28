# O(N) exact prefix projection and the intermediate-band obstruction

Continuation of fe2e582a3152ff15c51b0bc5ca2911ed736b9989 (exact source retrieved). Responds to the user's request to use O(N), not another Gram solve. Proves an exact formula for the optimum of the first N cells, evaluated by a linear sieve and scan; also constructs a simpler nearly prefix-optimal finite witness in linear time and evaluates its next band. This is NOT an RH proof, full-norm minimizer, or new zero-free region. No worker changes, native Lean replay, interval-certified numerical values, or claim of literature priority. O(N) refers to arithmetic operation counts, not exact rational bit complexity.

## 1. The entire prefix optimization is one scalar constraint

Write r_j=1+j A-sum_(2<=n<=N)c_n floor(j/n), j>=1, r_0=0, A=sum c_n/n. Set d_j=r_j-r_(j-1) and m(y)=sum_(n<=y)mu(n)/n.
For 2<=n<=N the exact increment identity and divisor inversion give
 c_n=mu(n)-sum_(k|n)mu(k)d_(n/k).
Also A=d_1-1. Summing c_n/n over 2<=n<=N and interchanging finite sums gives the single constraint
 sum_(j=1)^N d_j m(N/j)/j=m(N).
Conversely for any real prefix r_1,...,r_N satisfying this constraint, the displayed inversion gives coefficients c_n with sum c_n/n=d_1-1; reversing the convolution shows that they reproduce exactly that prefix. Thus the attainable prefixes are precisely the affine hyperplane
 sum_(j=1)^N l_j r_j=m(N),
 where v_j=m(N/j)/j for 1<=j<=N, v_(N+1)=0, l_j=v_j-v_(j+1).
No zeta hypothesis is used.

Minimize the actual prefix squared norm sum r_j^2/[j(j+1)] on this hyperplane. Define B_N=sum_(j=1)^N j(j+1)l_j^2. Since l_N=1/N, B_N>=(N+1)/N>0. Weighted Cauchy-Schwarz, with equality at the specified vector, yields
  exact minimum prefix energy = m(N)^2/B_N,
  optimal prefix r_j=m(N) j(j+1)l_j/B_N.
An Euler linear sieve for mu, a single cumulative m pass, and one descending scan of the l_j evaluate the exact formula and construct the optimum prefix in O(N) arithmetic operations. Reconstructing all coefficients from an arbitrary prefix still entails a divisor transform (e.g. O(N log log N) prime passes), and the entire infinite norm has not been optimized. No strict O(N) claim for that general coefficient recovery.

## 2. An explicit O(N) witness and exact next-band formula

For N>=2 choose c_n=mu(n) for 2<=n<N and c_N=mu(N)-N m(N). Then A=-1 exactly. By sum_(n<=j)mu(n)floor(j/n)=1,
 r_j=0 for 1<=j<N,
 r_N=N m(N),
 r_j=N m(N)+M(j)-M(N) for N<j<2N,
 r_(2N)=2N m(N)+M(2N)-M(N),
 where M(j)=sum_(n<=j)mu(n). In general
 r_j=N m(N)floor(j/N)+sum_(N<n<=j)mu(n)floor(j/n).
The core energy is exactly N m(N)^2/(N+1). By the classical unconditional prime number theorem consequence m(N)->0, this core energy tends to zero; so does the exact optimal prefix energy. Neither statement uses RH, and neither proves density in the full norm. The large-sieve tail estimates from earlier notes cannot be applied as though they controlled the band N<j<=2N from the small core value alone.
The same linear sieve up to 2N and a single M prefix pass evaluate the next-band energy of this explicit witness in O(N) arithmetic operations. In particular no optimization matrix or explicit divisor-pair computation is required.

## 3. Actual JavaScript evaluation (double precision)

Euler sieve through 1048576, 82025 primes. Compensated m prefix, descending evaluation of B_N, and cross-check of explicit witness by divisor multiple accumulation (the cross-check itself is not linear). Results:
N, optimal prefix energy, explicit prefix energy, explicit energy N<j<=2N
256, .0000136855810490, .0000206219403787, .0153162542427029
1024, .00000147243966114, .00000223276503838, .0184407635182296
2048, .0000120339240378, .0000182615276530, .0267262687759174
8192, .00000543410133283, .00000826173271829, .0207737907822426
32768, .000000558429581228, .000000848636636159, .0214704175174807
131072, .00000000618127363616, .00000000939377289296, .0128612289876651
524288, .0000000334519736120, .0000000508419239783, .0202269900429302
Max observed pre-cutoff residual discrepancy at largest N was 1.933e-8 from accumulated floating roundoff; exact formula proves that the mathematical witness is zero there. Independent O(N) evaluation at N=524288 using the explicit band formula gave m=-.00022548175307155304, core=5.0841923994946597e-8, band=.020226990043399135. These are numerical approximations, not interval enclosures. The band is not the entire tail and cannot be extrapolated.

Reproducible linear core:
```js
const N=524288,mu=new Int8Array(2*N+1),lp=new Int32Array(2*N+1),pr=[];mu[1]=1;
for(let i=2;i<=2*N;i++){if(!lp[i]){lp[i]=i;pr.push(i);mu[i]=-1;}for(const p of pr){const j=i*p;if(j>2*N)break;lp[j]=p;if(i%p===0){mu[j]=0;break;}mu[j]=-mu[i];}}
const pref=new Float64Array(2*N+1);let m=0,err=0;
for(let i=1;i<=2*N;i++){let y=mu[i]/i-err,t=m+y;err=(t-m)-y;m=t;pref[i]=m;}
let B=0,v=0;for(let j=N;j>=1;j--){let u=pref[Math.floor(N/j)]/j,l=u-v;B+=j*(j+1)*l*l;v=u;}
let band=0,M=0;for(let j=N+1;j<=2*N;j++){M+=mu[j];let r=N*pref[N]*(j===2*N?2:1)+M;band+=r*r/(j*(j+1));}
console.log(pref[N]**2/B,N*pref[N]**2/(N+1),band);
```

## 4. What the result resolves and does not resolve

The first N cells are now exactly solved as a scalar constrained problem, and their vanishing optimum is unconditional. The next-band identity isolates precisely the Mertens increments and endpoint correction which the naive prefix-perfect witness fails to control numerically. It does not prove a nonvanishing asymptotic lower bound even for this particular witness; nor does it preclude other coefficient choices controlling both core and tail. A full-norm vanishing estimate is still required. This is a useful O(N) diagnostic and exact finite projection, not a substitute for the unresolved RH theorem. No independent proof found.