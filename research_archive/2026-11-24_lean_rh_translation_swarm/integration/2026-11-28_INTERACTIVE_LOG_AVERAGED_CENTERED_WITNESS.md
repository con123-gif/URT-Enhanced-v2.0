# Expanding logarithmic cutoff averaging with unconditional vanishing far tail

Continuation of 7d5dd9861184b185d2d3add1e295de3c992dd91b (exact source retrieved), 0446e2b9c7d687e3d1e674f5a8d26512fc90cfbc (averaged cutoff identity), and d4264eabef56ed2e25820089454e9e8726d6377c (dual large-sieve tail bound). This is an explicit construction and an unconditional estimate for an entire infinite tail, not a full-norm vanishing theorem or RH proof. Actual JavaScript experiment below. No interval certification, Lean execution, worker/schedule changes, or literature-priority claim.

## 1. Expanding logarithmic average

For integer N sufficiently large set K=floor(sqrt N), Z=log((N+1)/K). Average the prior hard witnesses with weights w_k=log(1+1/k)/Z, K<=k<=N. These are positive and sum to 1 by telescoping. With m(n)=sum_{j<=n}mu(j)/j, the coefficients for 2<=n<=N are exactly
 c_n=mu(n)*log((N+1)/max(n,K))/Z - n*m(n)*w_n,
 where w_n=0 below K. The prior hard-witness identity gives A=sum c_n/n=-1 and r_j=1+j A-sum c_n floor(j/n)=0 for j<K.
The divisor identity gives |m(n)|<=1+1/n<=2. Since n log(1+1/n)<=1, for all n we have
 |c_n|<= [log(N/n)+3]/Z.
Here replacing max(n,K) by n can only increase the logarithm, and log(1+1/N)<=1. In particular sum |c_n|=O(N/Z), since sum_{n<=N} log(N/n)=O(N). All constants are absolute.

## 2. Exactly cancel the periodic mean without changing the early cells

The periodic mean of r_j is R=1+(sum c_n-A)/2=O(N/Z). Put I={floor(N/2)+1,...,floor(3N/4)}, J={floor(3N/4)+1,...,N}, counts n_I,n_J and harmonic sums h_I,h_J. Add a constant u to the coefficients on I and a constant v on J, with
 u=-2R/(n_I-n_J h_I/h_J), v=-u h_I/h_J.
For large N the denominator is bounded away from zero in magnitude on the scale N: n_I/N,n_J/N->1/4 and h_I/h_J->log(3/2)/log(4/3)>1. The two exact equations n_I u+n_J v=-2R and h_I u+h_J v=0 make the new residual mean identically zero and preserve A=-1. Both corrections are O(1/Z), so the corrected coefficients C_n retain the envelope |C_n|<=C(1+log(N/n))/Z for an absolute C. They also retain every residual value below floor(N/2)+1, since the altered denominators are larger than those indices and the weighted coefficient sum has not changed. In particular r_j=0 for j<K.
The Euler sieve, m prefix, coefficient calculation and two-block correction each require O(N) arithmetic operations and O(N) storage. Logarithms are counted as scalar operations in this statement. No exact bit-complexity claim.

## 3. Unconditional far-tail theorem

The earlier exact gcd energy formula, using J_2(d)<=d^2 and zero mean, is
 Q=(1/12)sum_{d=2}^N J_2(d)(sum_{k<=N/d} C_(dk)/(dk))^2.
By the envelope, the inner sum has absolute value <= C/(d Z) sum_{k<=N/d} [1+log(N/(dk))]/k <= C'/(d Z) (1+log(N/d))^2. Integral comparison for the decreasing function (1+log(N/t))^4 gives sum_{d<=N}(1+log(N/d))^4=O(N). Therefore Q=O(N/Z^2)=O(N/log^2 N). No cancellation assumption or RH is used here.

Apply the exact previous dual large-sieve tail bound:
 sum_{j>L} r_j^2/[j(j+1)] <= Q[1/(L+1)+N^2/((L+1)(L+2))].
With L=floor(N^(3/2)), the entire infinite tail is O(1/log^2 N), hence tends to zero unconditionally. More generally L=floor(N^(3/2)/(log N)^a) for any fixed 0<=a<1 also suffices, with bound O((log N)^(2a-2)). This proof does not cover the intervening band K<=j<=L, and no vanishing theorem for that band has been established. Exact cancellation of the periodic mean is a design choice that ensures the tail estimate without conjectural Möbius bounds; it may change intermediate energy.

## 4. Actual numerical test

Executed JavaScript linear sieve through 1048576 (82025 primes) and compensated m prefix. For each N compare logarithmically averaged coefficients before and after the two-block centering. Evaluate residuals up to 4N by the finite divisor zeta transform (prime by prime, increasing multiples so prime powers propagate), and evaluate Q using the reverse multiple transform (decreasing index within each prime). These transforms take O(N log log N) arithmetic operations for fixed evaluation range 4N; the full evaluation is NOT strictly O(N), unlike coefficient construction. The tail-above-N^(3/2) numerical estimates below use the proved bound but are double precision, not interval-certified. No terms between 4N and N^(3/2) are evaluated here, so do not add these numbers to claim an upper bound on the entire norm.

N,K,uncentered partial through 4N,centered partial through 4N,centered Q,centered tail bound above N^(3/2)
1024,32,.010522960628454142,.010522937196635907,2.501348867017037,.002518832660829508
4096,64,.009087587482183699,.009089065512840954,7.182118594839793,.0017808243597913242
16384,128,.008117570655080446,.008118871458394206,21.472058258491863,.001320787226419383
65536,256,.007270571488035252,.007270717030676205,66.32562140171876,.001016001800307204
262144,512,.0065083440374387545,.006508335429009743,210.536966493691,.0008047033950708102
At the last cutoff centered bands are .005572602510771035 for j<=N, .0007389112126585417 for N<j<=2N, and .00019682170558016576 for 2N<j<=4N. Observed centered mean -6.17e-14 and A=-1.000000000000012 are rounding artefacts; their exact values are 0 and -1 by construction. This is not a certified numerical comparison or monotonicity theorem.

Executed core:
```js
const Nmax=262144,Lmax=4*Nmax,mu=new Int8Array(Lmax+1),lp=new Int32Array(Lmax+1),ps=[];mu[1]=1;
for(let i=2;i<=Lmax;i++){if(!lp[i]){lp[i]=i;ps.push(i);mu[i]=-1;}for(const p of ps){const j=i*p;if(j>Lmax)break;lp[j]=p;if(i%p===0){mu[j]=0;break;}mu[j]=-mu[i];}}
const m=new Float64Array(Nmax+1);let s=0,e=0;for(let n=1;n<=Nmax;n++){let y=mu[n]/n-e,t=s+y;e=(t-s)-y;s=t;m[n]=s;}
for(const N of [1024,4096,16384,65536,262144]){
 const K=Math.floor(Math.sqrt(N)),Z=Math.log((N+1)/K),c=new Float64Array(N+1);
 let sum=0,A=0;for(let n=2;n<=N;n++){const W=Math.log((N+1)/Math.max(K,n))/Z,w=n>=K?Math.log1p(1/n)/Z:0;c[n]=mu[n]*W-n*m[n]*w;sum+=c[n];A+=c[n]/n;}
 const mean=1+(sum-A)/2,cut=Math.floor(3*N/4),lo=Math.floor(N/2)+1,hi=cut+1;
 let a=0,b=0;for(let n=lo;n<=cut;n++)a+=1/n;for(let n=hi;n<=N;n++)b+=1/n;
 const u=-2*mean/(cut-lo+1-(N-hi+1)*a/b),v=-u*a/b;
 for(const centered of [false,true]){
  const coeff=c.slice();if(centered){for(let n=lo;n<=cut;n++)coeff[n]+=u;for(let n=hi;n<=N;n++)coeff[n]+=v;}
  let AA=0,CC=0;for(let n=2;n<=N;n++){AA+=coeff[n]/n;CC+=coeff[n];}
  const L=4*N,arr=new Float64Array(L+1);arr.set(coeff);
  for(const p of ps){if(p>L)break;for(let j=p;j<=L;j+=p)arr[j]+=arr[j/p];}
  let acc=0,core=0,band=0,far=0;for(let j=1;j<=L;j++){acc+=arr[j];const r=1+j*AA-acc,z=r*r/(j*(j+1));if(j<=N)core+=z;else if(j<=2*N)band+=z;else far+=z;}
  let Q=(1+(CC-AA)/2)**2;const J=new Float64Array(N+1);for(let d=1;d<=N;d++)J[d]=d*d;
  for(const p of ps){if(p>N)break;for(let d=p;d<=N;d+=p)J[d]=J[d]/(p*p)*(p*p-1);}
  const z=new Float64Array(N+1);for(let n=2;n<=N;n++)z[n]=coeff[n]/n;
  for(const p of ps){if(p>N)break;for(let j=Math.floor(N/p);j>=1;j--)z[j]+=z[p*j];}
  for(let d=2;d<=N;d++)Q+=J[d]*z[d]*z[d]/12;
  const cutoff=Math.floor(N**1.5);console.log({N,K,centered,core,band,far,partial:core+band+far,Q,tail:Q*(1/(cutoff+1)+N*N/((cutoff+1)*(cutoff+2)))});
 }
}
```

## 5. Outstanding theorem
The new family is not subject to the earlier fixed-width theorem. It has an exactly zero early prefix and a provably vanishing entire far tail, with no zero-location hypothesis. The middle band K<=j<=N^(3/2) must still be shown to vanish in the actual weighted squared norm. The finite tests through 4N are encouraging for this particular construction, not a proof of that band or a measure of distance to RH. Do not claim full-norm convergence or an independent proof.