# URT magnetic gap versus local Mertens variance — exact transfer obstruction

28 November 2026. User granted autonomy to investigate earlier URT work. Retrieved exact source research_archive/2026-11-21_urt_prime_magnetic_gap/URT_PRIME_MAGNETIC_GAP.md and integration/2026-11-28_INTERACTIVE_TWO_CUTOFF_FIRST_OCTAVE.md from newtons-cathedral. This note proves two limitations on direct transfer of the genuine magnetic-gap theorem to the local Mertens variance. Neither is a disproof of RH or of the declared magnetic model. No new zero-free region, native Lean execution, or changes to worker schedules.

## 1. Direct intertwining cannot work
The declared twisted prime shifts V_p are isometries on ell^2(N) with V_p V_q=c V_q V_p, |c|=1 and c !=1. Ordinary multiplicative shifts S_p commute. If a linear map T intertwines both, T S_p=V_p T and T S_q=V_q T, then
 V_p V_q T=T S_p S_q=T S_q S_p=V_q V_p T.
Consequently (c-1)V_q V_p T=0. Since V_q V_p is injective, T=0. The reverse direction T V_p=S_p T, T V_q=S_q T implies T V_q V_p=0; it need not imply T=0 because unilateral shifts are not surjective. In particular no nonzero map from the ordinary multiplicative shift representation into the twisted one intertwines both shifts exactly. This rules out an identity obtained by directly identifying their shift actions, not a more sophisticated arithmetic transform with a proved correction term.

## 2. The coercive magnetic energy alone cannot supply square-root cumulative cancellation

For integer X>=1 and a sequence f supported on X<n<=2X, put
 U_f(j)=sum_(X<n<=j) f(n), X<j<=2X,
 C_X f(j)=U_f(j)-X^(-1)sum_(X<k<=2X)U_f(k).
The local variance is ||C_X f||_2^2. For f(n)=mu(n) on the interval it is the Mertens variance used in the latest first-octave route, with a harmless constant M(X) removed. That route needs ||C_X f||^2=O_epsilon(X^(2+epsilon)) on the appropriate overlapping windows.

For fixed distinct prime directions p,q the exact URT form Q(f)=||(I-V_p)f||^2+||(I-V_q)f||^2 satisfies g||f||^2<=Q(f)<=8||f||^2, g=|1-c|^2/8>0. The upper bound is the triangle inequality for isometries. These comparisons concern the input coefficient norm, not the cumulative output.

Even restricting f to squarefree-supported sequences with |f(n)|=mu(n)^2 on the interval, the proposed estimate
 ||C_X f||^2 <= C_epsilon X^(1+epsilon) Q(f)
 is impossible for any fixed epsilon<1. Take f(n)=mu(n)^2. The elementary squarefree counting identity mu(n)^2=sum_(d^2|n)mu(d) gives
 sum_(n<=y) mu(n)^2 = a y+O(sqrt(y)), a=1/zeta(2)=6/pi^2,
 by summing the floor errors for d<=sqrt(y) and bounding the absolutely convergent omitted tail. Uniformly for j=X+1,...,2X, U_f(j)=a(j-X)+O(sqrt X). Centering and squaring, using sum_(k=1)^X (k-(X+1)/2)^2=X(X^2-1)/12, yields
 ||C_X f||^2 = (a^2/12)X^3+O(X^(5/2)).
But Q(f)<=8||f||^2=O(X), so the proposed bound would imply O(X^(2+epsilon)), a contradiction. Same argument works on any fixed positive-proportion subinterval used by the overlapping-window criterion. This is a counterexample to transferring the gap by a generic energy inequality even with the correct squarefree support and amplitudes; it is NOT a counterexample for the actual signed mu sequence. Sign-specific arithmetic is necessary. The exact identity of the twisted range projections and untwisted divisibility projections does not encode this sign cancellation in the norm inequality alone.

## 3. Actual arithmetic diagnostic
Executed JS Euler linear sieve through 2,097,152 (155611 primes). For each X, accumulated centered prefix variance for actual mu and for mu^2 on [X+1,2X] via the standard online variance recurrence. No matrix or spectral simulations, no interval rounding. Output:
X,squarefree_count,signed_variance/X^2,unsigned_variance/X^3
1024,621,.0372903011739254,.030677551170811033
4096,2491,.029579698792076642,.030811609325379383
16384,9958,.050573447179886,.030784933307467385
65536,39844,.039817314716614496,.03080862895487365
262144,159365,.04641930716073191,.030791968688960187
1048576,637457,.04614917037798506,.030800435326931358

The unsigned coefficient a^2/12=3/pi^4 is the proved limiting normalized variance. At largest X the unsigned variance/X^2 is 32296.597273372376 versus .04614917037798506 for signed mu. This demonstrates the importance of the signs on the tested range; it is not an asymptotic bound on signed mu. O(X) arithmetic operations with the linear sieve, no exact rational bit-complexity claim.
Executed core:
```js
const Nmax=1048576, mu=new Int8Array(2*Nmax+1),lp=new Int32Array(2*Nmax+1),ps=[];mu[1]=1;
for(let n=2;n<=2*Nmax;n++){if(!lp[n]){lp[n]=n;ps.push(n);mu[n]=-1;}for(const p of ps){let j=n*p;if(j>2*Nmax)break;lp[j]=p;if(n%p===0){mu[j]=0;break;}mu[j]=-mu[n];}}
for(const X of [1024,4096,16384,65536,262144,1048576]){let m=0,a=0,meanM=0,meanA=0,VM=0,VA=0,ns=0;for(let j=X+1;j<=2*X;j++){m+=mu[j];a+=Math.abs(mu[j]);ns++;let d=m-meanM;meanM+=d/ns;VM+=d*(m-meanM);d=a-meanA;meanA+=d/ns;VA+=d*(a-meanA);}console.log(X,a,VM/(X*X),VA/(X*X*X));}
```

## 4. Decision
Do not spend further runs trying to transfer a generic magnetic gap or a norm-preserving relabeling to the actual Mertens variance. It would require an additional theorem specifically coupling the true multiplicative signs with the cumulative operator. The finite diagnostics remain useful, but no such theorem has been obtained. The main compact reconstruction has actual source-matched signed energy and prime-error interfaces; prioritize investigating their remaining suppliers instead of multiplying independent equivalent RH reformulations. This is a research decision, not a reassignment of the existing workers or claim of closure.