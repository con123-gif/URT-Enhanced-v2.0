# Two-cutoff cancellation: RH sufficient test on first octaves alone

28 November 2026. Continuation of 8c49f2c8a27785ea85ff576cbc4e9b6603e0d72d and c76cecf61d1fb3f0d544f3264010871c0be4f789 (both exact notes retrieved this turn). This is an exact local cancellation identity and a sufficient RH criterion restricted to sparse overlapping scale windows. It substantially reduces the range needed for a diagnostic, but does not prove the signed estimate. No native Lean replay, literature-priority claim, new zero-free region or worker/schedule changes.

## 1. Exact first-octave arithmetic

For integer K>=5, take the exact centered logarithmic witness from c76cecf at N=K^2. Write Z_K=log((K^2+1)/K), M(j)=sum_(n<=j)mu(n), m(j)=sum_(n<=j)mu(n)/n, H(k)=k m(k)-M(k). For K<=j<2K the two-block correction cannot affect r_(K^2)(j), since its denominators are above floor(N/2) and the correction has zero sum divided by denominators. The averaged-cutoff formula has only the quotient l=1. Hence
 T_K(j):=Z_K r_(K^2)(j)=log((j+1)/K) M(j)+sum_(k=K)^j H(k) log(1+1/k).
For K<J<2K and J<=j<2K, subtract the formula at J (using its own normalization Z_J):
 T_K(j)-T_J(j)=log(J/K) M(j)+sum_(k=K)^(J-1) H(k) log(1+1/k).
The final term is independent of j. Thus taking differences in j cancels it exactly. No asymptotic error or RH assumption occurs in this identity.

## 2. Sparse overlapping windows suffice

Let K_i=floor((4/3)^i), J_i=floor(9 K_i/8), and I_i=[ceil(5 K_i/4), floor(7 K_i/4)] intersected with the integers, for all sufficiently large i. I_i is contained in both first octaves. Consecutive I_i overlap in a positive proportion of K_i (asymptotically length K_i/12), and cover all sufficiently large integers. Let
 F(K)=sum_(K<=j<2K) |r_(K^2)(j)|^2/[j(j+1)].
The following estimate, only on two first octaves per scale, would suffice for RH:
 F(K_i)+F(J_i)=O_epsilon(K_i^epsilon) for every epsilon>0.
Proof: on I_i, j(j+1)=O(K_i^2) and Z_K,Z_J=O(log K_i). By the exact two-cutoff identity, using the constant offset from Section 1 and log(J_i/K_i) bounded below by a positive constant, the unweighted variance about the actual mean b_i of M on I_i satisfies
 sum_(j in I_i) |M(j)-b_i|^2 <= C K_i^2 log^2(K_i) [F(K_i)+F(J_i)].
The mean minimizes squared deviation among constants. On the overlap of I_i and I_(i+1), Cauchy-Schwarz (or (a+b)^2<=2a^2+2b^2) yields
 |b_(i+1)-b_i| <= C_epsilon K_i^(1/2+epsilon/2) log K_i.
Sum over the geometrically increasing K_i, including the fixed first mean. Then |b_i|<=C'_epsilon K_i^(1/2+epsilon/2) log K_i. Combining this with the variance bound gives sum_(j in I_i) |M(j)|^2=O_epsilon(K_i^(2+epsilon) log^2 K_i). Cover all dyadic intervals [X,2X] by O(1) such windows at comparable scales, absorb the logarithm by choosing epsilon smaller, and obtain
 integral_X^(2X) |M(x)|^2 dx=O_epsilon(X^(2+epsilon)) for every epsilon>0.
Here M(x)=M(floor x), so endpoint differences are harmless. Cauchy-Schwarz on dyadic intervals shows absolute, locally uniform convergence of s integral_1^infinity M(x)x^(-s-1)dx for Re s>1/2. In Re s>1 this is exactly 1/zeta(s) by absolute summation. Multiplying by (s-1)zeta(s) and applying the identity theorem shows that (s-1)zeta(s) times the continued integral equals s-1 throughout Re s>1/2. No zero with real part>1/2 is possible, and the functional equation gives RH. This implication does not assume RH or a prior nonvanishing claim. The hypothesis on F is NOT proved.

More sharply, the same variance argument can use the subpower estimate directly for the local Mertens variances on I_i; the absolute means are then reconstructed by overlapping windows. This is why cancellation of the constant offset is useful. It does not establish that the variance estimate is easier in theorem strength than the classical Mertens mean-square problem.

## 3. Actual linear-time first-octave test

The first-octave formulas can be evaluated with a sieve only through 2J=O(K) and cumulative sums. There is no need to construct the entire length-N witness, where N=K^2, let alone evaluate N^(3/2) residual cells. The cost per pair of windows is O(K) arithmetic operations and memory. Not a full-norm algorithm and not an exact bit complexity claim.

Executed JavaScript Euler sieve through 1179648, 91465 primes, exact integer M and compensated double-precision m and H-sum prefixes. Tested seven power-of-four/doubling scales (not an exhaustive scan of the geometric sequence in the theorem). Decimal results:
K,J,F(K),F(J),variance on I divided by K^2,maximum absolute two-cutoff identity discrepancy
256,288,.00008026668045220117,.00010878036037952506,.01355358981346899,6.106226635438361e-16
1024,1152,.000051482062287112066,.000050975220587944916,.025623592949285377,2.220446049250313e-15
4096,4608,.000032160383729683896,.000045595943877127404,.01513245217447576,4.0245584642661925e-15
16384,18432,.000040010513955212175,.00002670402626684701,.019026509766342688,1.0852430065710905e-14
65536,73728,.0000278756187094677,.00002663252055266928,.01750005215694931,2.0670964939739633e-14
262144,294912,.000016986422312090252,.000011270227341170043,.025345783040437508,4.4575454438700035e-14
524288,589824,.000019253377886133836,.000020601937572676114,.02054818145943525,6.222800053024002e-14

The last formal coefficient cutoff K^2=274877906944 was NOT constructed or scanned. Only the first octaves were computed using the exact identity. No interval certification, monotonicity claim, asymptotic extrapolation or inference of proximity to proof.

Executed core:
```js
const maxK=524288,L=2*Math.floor(9*maxK/8),mu=new Int8Array(L+1),lp=new Int32Array(L+1),pr=[];mu[1]=1;
for(let n=2;n<=L;n++){if(!lp[n]){lp[n]=n;pr.push(n);mu[n]=-1;}for(const p of pr){const j=n*p;if(j>L)break;lp[j]=p;if(n%p===0){mu[j]=0;break;}mu[j]=-mu[n];}}
let m=0,err=0;const M=new Int32Array(L+1),H=new Float64Array(L+1);
for(let n=1;n<=L;n++){M[n]=M[n-1]+mu[n];const y=mu[n]/n-err,t=m+y;err=(t-m)-y;m=t;H[n]=n*m-M[n];}
function scan(K){let s=0,e=0,energy=0,Z=Math.log(K+1/K);const r=new Float64Array(K);for(let j=K;j<2*K;j++){let y=H[j]*Math.log1p(1/j)-e,t=s+y;e=(t-s)-y;s=t;let v=M[j]*Math.log((j+1)/K)+s;r[j-K]=v;energy+=v*v/(Z*Z*j*(j+1));}return {energy,r};}
for(const K of [256,1024,4096,16384,65536,262144,524288]){const J=Math.floor(9*K/8),a=scan(K),b=scan(J);let off=0;for(let k=K;k<J;k++)off+=H[k]*Math.log1p(1/k);let err=0,mean=0,sq=0,n=0;for(let j=Math.ceil(5*K/4);j<=Math.floor(7*K/4);j++){const diff=a.r[j-K]-b.r[j-J];err=Math.max(err,Math.abs(diff-M[j]*Math.log(J/K)-off));n++;const d=M[j]-mean;mean+=d/n;sq+=d*(M[j]-mean);}console.log(K,J,a.energy,b.energy,sq/(K*K),err);}
```

## 4. Remaining obstacle

The exact cancellation and local sufficiency theorem allow a different diagnostic that does not need the exterior bands of the previous full-norm route. But they also identify the surviving difficulty as the classical RH-strength signed Mertens fluctuation estimate. No independent bound at the requisite exponent was derived; the finite test does not supply it. Do not claim RH or count this reduction as closure of a compact proof obligation.