# Golden O(N) recursion: exact signed smaller-scale transfer and unconditional square-root tail

28 November 2026. Follow-up to c8c85fdcf884dec3e5b7941424f7fe3dc84ffe95 (exact source retrieved) and 47811129d634a258768f176f65de63fb6a2f5edd. An attempt to prove an induction rather than enlarge the finite certificate. The exact recursion and the tail estimate below are unconditional; the retained signed sum has not been controlled. No RH proof, no claim of novelty for the underlying divisor or alternating Dirichlet identities, no native Lean replay, no changes to workers/schedules.

## Exact smaller-scale recursion

For x>0 let m(x)=sum_{n<=x}mu(n)/n, F(x)=x*m(x), D(x)=F(phi*x)-F(x), with m(x)=F(x)=0 for x<1. This extension agrees with the prior D on x>=1. The actual Mobius divisor identity gives
  sum_{k>=1} F(x/k)=x*sum_{j<=x}(1/j)*sum_{n|j}mu(n)=x*1_{x>=1}.
The sum is finite. Thus for x>=1, sum_{k>=1}D(x/k)=(phi-1)x. For x>=2 subtract twice this identity at x/2, obtaining
  sum_{k>=1}(-1)^(k-1)D(x/k)=0.
Equivalently
  D(x)=sum_{j>=1}[D(x/(2j))-D(x/(2j+1))].
All arguments on the right are at most x/2. This exact relation uses the actual Mobius values and cancels the linear main term identically. It is not the previously tested jump balance and requires no asymptotic hypothesis.

## Unconditional control of the discarded terms

For t>=1 the finite identity sum_{n<=t}mu(n)floor(t/n)=1 implies |m(t)|<=1+1/t<=2; for t<1 m=0. Hence |q(t)|=|phi*m(phi*t)-m(t)|<=2(phi+1). Between the integer and scaled-integer events D(t)=t*q(t) has derivative q(t), and at each event its jump has magnitude <=1. There are at most floor(Y)+floor(phi*Y) events in (0,Y]. Consequently the total variation of D on [0,Y], with D(0)=0, is <=3(phi+1)Y. This is a deterministic bound; it does not assume RH.
For integer J>=1 the intervals [x/(2j+1),x/(2j)] for j>J are disjoint and contained in [0,x/(2J+2)]. Therefore
 |sum_{j>J}[D(x/(2j))-D(x/(2j+1))]| <= 3(phi+1)x/(2J+2).
Take J=floor(sqrt(x)). With a(x)=D(x)/sqrt(x) we have
 a(x)=sum_{j=1}^J[a(x/(2j))/sqrt(2j)-a(x/(2j+1))/sqrt(2j+1)]+R(x),
 |R(x)|<=3(phi+1)/2.
The tail is at the required square-root scale in D without using signed cancellation. Only O(sqrt(x)) retained pairs remain, with precomputed O(1) arithmetic prefix queries. The original O(N) linear sieve and shared-prefix scan still apply; evaluating the truncated recursion separately at all integers would not itself be O(N).

## Actual numerical test

Executed JavaScript Euler linear sieve through N=3393268 (243083 primes), compensated double precision prefix sums, then 16 dyadic inputs x=2^6 through 2^21. J=floor(sqrt(x)). Values shown are normalized by sqrt(x), not certified intervals.
x,J,a(x),retained signed sum,tail,retained sum of absolute pair differences
64,8,-0.1056291953,0.1325486804,-0.2381778757,0.6310038447
4096,64,0.06049299904,0.02976140215,0.03073159689,1.837820322
65536,256,-0.1210773408,-0.1167773727,-0.00429996809,2.371734544
1048576,1024,-0.07091979606,-0.05637416659,-0.01454562947,3.275548358
2097152,1448,-0.01458114163,-0.03042337903,0.01584223740,3.530898244
Maximum observed absolute normalized tail across all 16 inputs =0.23817787570906584. This test computes the tail by subtraction of the retained sum from the independently precomputed actual amplitude, not by assuming that it vanishes. No certification of floating-point errors or extrapolation claimed. The tail estimate above is mathematical and independent of the test.

Reproducible core:
```js
const Xmax=2**21,phi=(1+Math.sqrt(5))/2,N=Math.ceil(phi*Xmax)+4;
const mu=new Int8Array(N+1),lp=new Int32Array(N+1),pr=[];mu[1]=1;
for(let i=2;i<=N;i++){if(!lp[i]){lp[i]=i;pr.push(i);mu[i]=-1;}for(const p of pr){let j=i*p;if(j>N)break;lp[j]=p;if(i%p===0){mu[j]=0;break;}mu[j]=-mu[i];}}
const pref=new Float64Array(N+1);let s=0,err=0;
for(let i=1;i<=N;i++){const y=mu[i]/i-err,t=s+y;err=(t-s)-y;s=t;pref[i]=s;}
const D=x=>x*(phi*pref[Math.floor(phi*x)]-pref[Math.floor(x)]);
for(let k=6;k<=21;k++){let x=2**k,J=Math.floor(Math.sqrt(x)),total=0,abs=0;for(let j=1;j<=J;j++){let v=D(x/(2*j))-D(x/(2*j+1));total+=v;abs+=Math.abs(v);}console.log(x,J,D(x)/Math.sqrt(x),total/Math.sqrt(x),(D(x)-total)/Math.sqrt(x),abs/Math.sqrt(x));}
```

## Induction obstacle (do not claim closure)

Absolute coefficient mass sum_{k=2}^{2J+1}k^(-1/2) grows like sqrt(J); even the first pair has absolute mass 1/sqrt(2)+1/sqrt(3)>1. Thus the normalized recursion is NOT a contraction by a triangle-inequality supremum estimate. A sufficient new theorem would control the signed retained sum by (1+o(1)) times the previous-scale running supremum plus O(1), uniformly as x increases, with all arguments <=x/2. Such an estimate would imply subpower growth by dyadic iteration. It has not been derived. The numerical retained sum is small because of signed cancellation, but the exact recursion already forces it to approximate the actual amplitude; this is not independent evidence of an all-scale invariant.

The rigorous advance is the exact smaller-scale recurrence with a uniformly bounded normalized tail, not a solution to the signed cancellation. The remaining obstacle is still of RH strength. A finite test or an O(N) computation does not establish closeness to a proof. The main compact reconstruction's LIVE_OBLIGATIONS.md was also read; it continues to report open root suppliers. Do not divert workers or assert root closure.