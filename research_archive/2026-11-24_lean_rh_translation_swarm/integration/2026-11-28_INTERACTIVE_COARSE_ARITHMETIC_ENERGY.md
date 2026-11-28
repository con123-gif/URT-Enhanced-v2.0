# Coarse arithmetic energy: unconditional vanishing of within-block oscillations

28 November 2026. Continuation of fee130f68c0515d4d5c3a2d2cd231f905c3342f2 and c76cecf61d1fb3f0d544f3264010871c0be4f789, both retrieved in this turn. The exact centered logarithmic family has zero residual below K=floor(sqrt N), uniformly bounded coefficients, and vanishing energy above L=floor(N^(3/2)). This note proves a further unconditional localization: fluctuations within suitable square-root-size arithmetic blocks have vanishing total energy. The remaining block averages are not bounded here. No proof of RH, claim of new zero-free region, literature-priority claim, native Lean replay or changes to workers/schedules.

## 1. Arithmetic increments and an unconditional estimate

Use r_j=1+j A-sum_(2<=n<=N) C_n floor(j/n), r_0=0, A=-1. The exact centered family from c76cecf has |C_n|<=C(1+log(N/n))/Z, Z=log((N+1)/floor(sqrt N)), hence |C_n|<=C0 uniformly. For j>=2 its exact increments satisfy
 d_j=r_j-r_(j-1)=A-sum_(n|j,2<=n<=N) C_n.
Therefore |d_j|<=1+C0 tau(j), where tau is the divisor-count function. For X>=2,
 sum_(X<=j<2X) |d_j|^2 <= C1 X (1+log(2X))^3.
Proof: tau(j)^2<=d_4(j), the number of ordered factorizations into four positive integer factors. For a prime power p^a this is (a+1)^2<=binomial(a+3,3), equivalent after division by a+1 to a(a-1)>=0. Multiply over prime factors. Summing d_4 up to Y by summing the first three factors and bounding the number of choices of the fourth by Y/(abc) gives <=Y(1+log Y)^3. This argument uses no signed Mobius estimate.

## 2. Remove fine fluctuations rigorously

Let w_j=1/[j(j+1)]. Partition [K,L] into relative dyadic bands [X,min(2X-1,L)] with X=K*2^h. Within each band partition into consecutive blocks B of at most H_X=max(1,floor(sqrt(X)/(1+log X)^3)) cells. Define W_B=sum_(j in B) w_j and the weighted mean R_B=sum_(j in B) w_j r_j /W_B.

For each block the exact orthogonal identity is
 sum_(j in B) w_j |r_j|^2 = W_B |R_B|^2 + sum_(j in B) w_j |r_j-R_B|^2.
The mean minimizes the latter squared deviation among constants. If B=[a,b], compare to r_a and use |r_j-r_a|^2<=H_X sum_(i=a+1)^b |d_i|^2. Since w_j<=X^-2,
 sum_(j in B) w_j |r_j-R_B|^2 <= H_X^2 X^-2 sum_(i=a+1)^b |d_i|^2.
Sum over disjoint blocks in one band and apply Section 1. If H_X=1 the variance is zero, otherwise the bound is <=C2/(1+log X)^3. Summation over all bands gives <=C3/(1+log K)^2, by comparison with the convergent integral of (1+log K+u log 2)^-3. Together with the previously proved far-tail bound this yields the unconditional identity with nonnegative error:
  E_N = sum_B W_B |R_B|^2 + O(1/log^2 N).
Here the coefficients are the exact centered family, not the rounded numerical certificates. The number of blocks is O(sqrt(L)*(1+log L)^3)=O(N^(3/4) log^3 N)=o(N): for large X, H_X is at least half the displayed square-root/log-cubed quantity, and summing the dyadic block counts is bounded by the last term times a geometric series. This is a count of summaries, NOT a proof that all summaries can be evaluated in O(N) operations.

A coarser H_X=max(1,floor(sqrt X)) yields O(log^4 N) total within-block energy by the same argument. That is also subpower, sufficient as an error term for the spectral amplification route in fee130f6. In this case only O(N^(3/4)) block averages are retained. The missing theorem is a subpower upper bound for sum_B W_B |R_B|^2, not for the within-block fluctuations. This removes rapid oscillations from consideration at a rigorously controlled cost but leaves low-frequency arithmetic accumulation. It is not an independent proof of the missing bound.

For reference, an exact finite formula for the weighted means follows by summation by parts. For B=[a,b],
 W_B R_B = r_a/a - r_b/(b+1) + sum_(j=a+1)^b d_j/j
 = r_a/a - r_b/(b+1) + A sum_(j=a+1)^b 1/j
   -sum_(n=2)^N (C_n/n) sum_(floor(a/n)<k<=floor(b/n)) 1/k.
No bound on the signed last term is inferred from this formula. The original O(N) construction of the coefficients is unchanged; evaluating every residual by the prime-wise divisor transform has its previous O(L log log L) cost.

## 3. Actual coarse-block diagnostic

Executed JavaScript in this turn: N=262144, K=512, L_test=4N=1048576, 82025 primes, Euler sieve, compensated m prefix, exact-family formulas evaluated in ordinary double precision, two-block mean centering, prime-wise divisor zeta transform. Partitioned [K,L_test] into the COARSER H_X=floor(sqrt X) blocks. Directly accumulated weighted means and within-block squared deviations; no numerical extrapolation or interval certification.

Number of retained blocks: 2425.
Partial total energy: .006508335429016133.
Block-mean contribution: .006088632634896882.
Within-block contribution: .00041970279411925157.
The three decimal numbers agree to floating-point precision. About 93.55% of the observed energy is in the block means. The experiment is restricted to 4N; it does not evaluate the complete middle band up to N^(3/2). The analytic bounds above cover that band, independently of this diagnostic.

Reproducible executed core:
```js
const N=262144,L=4*N,K=Math.floor(Math.sqrt(N)),Z=Math.log((N+1)/K);
const mu=new Int8Array(L+1),lp=new Int32Array(L+1),ps=[];mu[1]=1;
for(let i=2;i<=L;i++){if(!lp[i]){lp[i]=i;ps.push(i);mu[i]=-1}for(const p of ps){const j=i*p;if(j>L)break;lp[j]=p;if(i%p===0){mu[j]=0;break;}mu[j]=-mu[i]}}
let m=0,e=0,A=0,C=0;const c=new Float64Array(N+1);
for(let n=1;n<=N;n++){let y=mu[n]/n-e,t=m+y;e=(t-m)-y;m=t;if(n===1)continue;let w=n>=K?Math.log1p(1/n)/Z:0;c[n]=mu[n]*Math.log((N+1)/Math.max(K,n))/Z-n*m*w;A+=c[n]/n;C+=c[n]}
let a=0,b=0;for(let n=N/2+1;n<=3*N/4;n++)a+=1/n;for(let n=3*N/4+1;n<=N;n++)b+=1/n;
let u=-2*(1+(C-A)/2)/(N/4-N/4*a/b),v=-u*a/b;A=0;
for(let n=2;n<=N;n++){if(n>N/2)c[n]+=n<=3*N/4?u:v;A+=c[n]/n}
const arr=new Float64Array(L+1);arr.set(c);for(const p of ps)for(let j=p;j<=L;j+=p)arr[j]+=arr[j/p];
let s=0;for(let j=1;j<=L;j++){s+=A-arr[j];arr[j]=1+s;}
let rows=[];
for(let X=K;X<=L;X*=2){let H=Math.max(1,Math.floor(Math.sqrt(X))),end=Math.min(2*X-1,L),energy=0,meanEnergy=0,within=0,blocks=0;for(let a=X;a<=end;a+=H){let b=Math.min(a+H-1,end),w=0,y=0,q=0;for(let j=a;j<=b;j++){let v=arr[j],wj=1/(j*(j+1));w+=wj;y+=v*wj;q+=v*v*wj;}let m=y/w;energy+=q;meanEnergy+=y*y/w;for(let j=a;j<=b;j++){let d=arr[j]-m;within+=d*d/(j*(j+1));}blocks++;}rows.push({X,H,blocks,energy,meanEnergy,within});}
console.log(rows);
```

## 4. Proof status and limitation

The unconditional error bound is a modest arithmetic estimate; the remaining block means still contain the hard signed cancellation. No independent all-scale bound on those means, no completion of RH, and no evidence of a distance-to-proof percentage. The sublinear count is not an O(N) full evaluation algorithm. The correct next mathematical question would be whether the signed block means themselves obey an unconditional subpower estimate, not simply whether further coarse-graining reduces a numerical residual.