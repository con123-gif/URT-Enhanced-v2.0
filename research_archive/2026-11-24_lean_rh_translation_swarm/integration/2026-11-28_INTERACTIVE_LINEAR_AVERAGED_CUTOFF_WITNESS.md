# O(N) averaged-cutoff witnesses and exact exterior rigidity

Continuation of 2d26ce7a6af6e325e6adb04e40cf58be2f0124c7 (exact source retrieved). New construction averages the previous explicit prefix-perfect witnesses across cutoffs. Proves an exact linear-time evaluation of any fixed relative band and an obstruction to extending the exact prefix too far. Actual JavaScript numerical test below. No proof of RH, vanishing full norm, interval certification, literature priority, native Lean replay, or changes to workers/schedules.

## 1. Exact averaged-cutoff construction

Write M(j)=sum_{n<=j}mu(n), m(j)=sum_{n<=j}mu(n)/n, H(k)=k m(k)-M(k). Let r^(k) be the previous witness with coefficients c_n=mu(n) for 2<=n<k, c_k=mu(k)-k m(k), and no higher coefficients; A=-1. Its exact residual is
 r^(k)_j=k m(k)floor(j/k)+sum_{k<n<=j}mu(n)floor(j/n)
          =sum_{l<=floor(j/k)} [M(floor(j/l))+H(k)].
The second equality follows by interchanging the divisor sum, including any empty endpoint at floor(j/l)=k. In particular r^(k)_j=0 for j<k.

Choose K>=2, N>=K, real weights w_k on K<=k<=N, sum w_k=1. The averaged witness r_j=sum w_k r^(k)_j is admissible with length N. Its coefficients are explicitly
 c_n=mu(n)sum_{k>=max(n,K)}w_k - n m(n) w_n,
 where w_n=0 off [K,N], for 2<=n<=N. It retains A=-1 exactly and has r_j=0 for j<K. Define two prefixes W(i)=sum_{K<=k<=min(i,N)}w_k and V(i)=sum_{K<=k<=min(i,N)} w_k H(k), both zero below K. Then
 r_j=sum_{l<=floor(j/K)} [W(floor(j/l)) M(floor(j/l))+V(floor(j/l))].
For fixed relative endpoints K>=aN, j<=bN with fixed a>0,b>=1, there are at most floor(b/a) terms per cell. Euler sieve plus M,m,W,V and residual scans take O(N) arithmetic operations and O(N) storage. This computes the actual residual of the explicit length-N coefficient vector on the whole specified band; it is not a full infinite norm evaluation. No claim of exact rational bit complexity.

## 2. Exact exterior rigidity when preserving too much of the prefix

More generally let an arbitrary finite length-N witness have r_j=0 for 1<=j<K, K>=2. The first cell forces A=-1; the increment equation forces c_n=mu(n) for 2<=n<K by divisor inversion. For N<j<2K, every proper divisor of j is <=j/2<K, and c_j=0 because j>N. The exact increment equation therefore gives
 r_j-r_(j-1)=-1-sum_{d|j,2<=d<j}mu(d)=mu(j).
Thus r_j=r_N+M(j)-M(N) on N<=j<2K whenever the interval is nonempty. In particular, if K>N/2, no choice of the remaining coefficients can suppress the variation of the Mertens function in this exterior interval: it can only change a constant offset. Its energy is at least the weighted variance of M(j)-M(N) on the interval, obtained by minimizing over a free offset. That variance has no proved asymptotic lower bound here. This is a restriction on the exact-prefix construction, not a claim that all geometric witnesses fail, or that RH is false. Choosing K<=N/2 removes this particular nonempty rigid interval. Even then no theorem proves the exterior energy vanishes.

## 3. Actual numerical test

Executed JavaScript Euler sieve through 2097152 (155611 primes) with compensated m prefix and exact integer M prefix, then used the formula in Section 1. Uniform weights on every integer cutoff K..N were used (including endpoints); K=N gives the original hard cutoff. The results are double precision, not interval enclosures. For each N the partial norm includes ALL cells up through 4N (the cells below K are exactly zero). No energy beyond 4N was evaluated or bounded, so the results are not full norm comparisons.
N, K/N, core j<=N, band N<j<=2N, band 2N<j<=4N, total through 4N
2048,1,.000018261527652949183,.026726268775917165,.00775989821981121,.03450442852338132
2048,.25,.006622394508548451,.010357492196409744,.0031508768757949513,.020130763580753146
8192,1,.00000826173271827784,.020773790782243853,.007618349149666,.02840040166462813
8192,.25,.004665671117851732,.012966102078662358,.0029481683965946327,.020579941593108723
32768,1,.0000008486366361493922,.021470417517532914,.006880958068182551,.02835222422235161
32768,.25,.008236076591977486,.008734756580920112,.002017945219977907,.018988778392875504
131072,1,.000000009393772895284564,.012861228987818319,.010768269199915331,.023629507581506545
131072,.25,.006545174861668537,.008042536280575732,.0045270269411831245,.019114738083427393
524288,1,.000000050841923994946597,.020226990043399135,.011785228034783124,.03201226892010625
524288,.75,.0012952495647318364,.017381815282039234,.011919052796702473,.030596117643473544
524288,.5,.004234589657599822,.011220249887898702,.007493272972369623,.022948112517868147
524288,.25,.0073672071778389005,.006637849367855631,.004368643805601552,.018373700351296082

Wider uniform smoothing improves the partial norm in these five quarter-cutoff comparisons but costs interior error. Not monotone in N and not an all-scale result. At N=524288, the quarter-cutoff partial total is about 42.6% lower than the hard cutoff total through 4N. Other tested fractions .75,.5 sometimes worsen the partial energy. The simple averaging construction is not asserted superior to earlier small-N optimized full-norm witnesses.

Executed core:
```js
const Nmax=524288,Lmax=4*Nmax,mu=new Int8Array(Lmax+1),lp=new Int32Array(Lmax+1),ps=[];mu[1]=1;
for(let i=2;i<=Lmax;i++){if(!lp[i]){lp[i]=i;ps.push(i);mu[i]=-1}for(const p of ps){const j=i*p;if(j>Lmax)break;lp[j]=p;if(i%p===0){mu[j]=0;break}mu[j]=-mu[i]}}
const M=new Int32Array(Lmax+1),m=new Float64Array(Lmax+1);let s=0,e=0;
for(let i=1;i<=Lmax;i++){M[i]=M[i-1]+mu[i];let y=mu[i]/i-e,t=s+y;e=(t-s)-y;s=t;m[i]=s;}
for(const N of [2048,8192,32768,131072,524288]){
for(const fraction of [1,.75,.5,.25]){
const K=Math.ceil(N*fraction),W=new Float64Array(N+1),H=new Float64Array(N+1);let w=0,h=0;
for(let k=K;k<=N;k++){const a=1/(N-K+1);w+=a;h+=a*(k*m[k]-M[k]);W[k]=w;H[k]=h;}
let core=0,band=0,far=0;
for(let j=K;j<=4*N;j++){let r=0;for(let l=1;l<=Math.floor(j/K);l++){const q=Math.floor(j/l),i=Math.min(N,q);r+=W[i]*M[q]+H[i];}const z=r*r/(j*(j+1));if(j<=N)core+=z;else if(j<=2*N)band+=z;else far+=z;}
console.log({N,K,core,band,far,partial:core+band+far});
}}
```

## 4. Status
The O(N) method provides exact construction/evaluation formulas and a useful analytical rigidity constraint. It does not supply the missing signed cancellation or a vanishing upper bound on the full infinite norm. The positive results are limited to finite-band numerical improvements and the exact algebraic statements. No independent RH proof obtained.