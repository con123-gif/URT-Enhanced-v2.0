# RUN9 — Four served-prime counting bounds (2026-11-24)

Status SOURCE-MATCHED conditional human reconstruction + executed exact regression in V8. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. No Lean replay, no claim of full RH translation or kernel reachability or URT improvement.

Preflight: AGENTS, research state/log/protocol and continuity excerpts, CI summary 15:09:27 UTC general Cathedral PASS (not RH validation); swarm protocol, queue, expansion, RUN8 and peer handoffs (character boxes, Galois, kernel, Landau, literature, acceleration, geometry, editor, theta, integration, math, structure, dependency). Blueprint referenced in queue, not reread in this run; audit lane latest explicit RESUME not located. No changes to Cathedral queue. RUN8 derived size envelopes, not the counting lemmas. This run completes that nonduplicate frontier.

## 1. Exact quantified statements

All four assertions universally quantify the stated real parameters, natural p0 where used, finite set s of naturals, and real function L1 on naturals where used, BEFORE imposing the listed hypotheses. All four are finite sums, not asymptotic estimates. Use X2 for X'', X1 for X', and M for mT.

Definitions, SecondKindBucket.lean 146–154:
- flF(p)=C f [N² log(a)/log(p)+(log(a)/log(p))²].
- cpF(p)=C Sk log(2a)/log(p).
- prF(p)=Q1 if p<p0, Q2 otherwise.
- orF(p)=C lx [La a/(pk)+ (a p^(-L1(p)) if p<p0, a/p² otherwise)].
The displayed logarithm quotients are used only when p>=2. The native definitions use Real.logb and real rpow, not integer powers for L1.

FloorBucket (156–160): C,f>=0, a>=1, every p in s >=2, |s|<=X2. N is an arbitrary real, not necessarily nonnegative. Then sum_s 2 log(p) flF(p) <= 2 C f X2 [N² log(a)+2 log(a)²].
CpBucket (162–165): C,Sk,M>=0, a>=1/2, every p in s >=2, |s|<=X2. Then sum_s 2 log(p) M cpF(p) <= 2 C Sk log(2a) M X2.
PrBucket (167–170): X1,Q1,Q2>=0, every p in s prime and p<X1. p0 arbitrary natural (including zero). Then sum_s 2 log(p) prF(p) <= 2 log(4) [p0 Q1 + X1 Q2].
OrBucket (172–178): C,lx,La,a>=0, k,K0>0, X1>=1, p0>=3, every p in s prime with p<X1, and for EVERY p in s with p<p0, K0<=p^(L1(p)-1). Then sum_s 2 log(p) orF(p) <= 2 C lx a [(La/k+1/K0)(log X1+log 4)+2(log(p0-1)+1)/(p0-1)].
No assumption removed; primality is NOT required by the first two statements; p=X1 excluded in the last two, p=p0 belongs to upper branch. Empty sets and zero coefficients allowed.

## 2. The four proofs

Floor: since log(p)>=log 2>1/2 (integrate 1/t on [1,2]), 1/log(p)<=2. Exact per-p cancellation leaves 2Cf[N² log a+(log a)²/log p]. Replace inverse log by 2, since Cf>=0 and (log a)²>=0. Sum over s, replace card by X2 because N² log a+2(log a)²>=0. Source floor_bucket_bound 483–510. This is called a floor bucket but the proof bounds a logb expression, not a separate rounding theorem.

Cp: per-p exact identity 2 log p M cpF(p)=2 C Sk M log(2a). Nonnegative since 2a>=1. Multiply by |s|<=X2. Source cp_bucket_bound 512–528.

Pr: define s_low={p in s:p<p0}. The original proof uses the inequality
sum_s log(p) prF(p) <= Q1 sum_s_low log(p)+Q2 sum_s log(p).
This deliberately adds the nonnegative Q2 part on low primes. Use ThetaFin at p0 on s_low and at X1 on s. Multiplying by 2 gives the exact result, without assuming Q1<=Q2 or p0<=X1. Source pr_bucket_bound 530–549.

Or: p>0, so the low-order premise implies K0*p<=p^L1(p). Taking reciprocals (K0,p positive), p^(-L1(p))<=1/(K0*p). Upper branch is exactly 1/p². Factor out 2 C lx a, nonnegative; DO NOT divide by it as it may be zero. Bound by
2 C lx a [(La/k) sum_s log(p)/p +(1/K0) sum_s_low log(p)/p + sum_(s\s_low) log(p)/p²].
The two log/p sums are bounded by PrimeLogSum at X1 (not p0); the tail by TailSq at p0. Source or_bucket_bound 551–600. Strict low branch and non-strict high branch partition s.

## 3. Derive the three elementary prime-sum inputs

ThetaFin (SecondKindBucket 86–88, AdmissibleSchurLemma 155–164): for any Y>=0 and finite s of primes <=Y, s subset primesLE floor(Y); positivity of logs bounds subset by full sum, equal to Chebyshev.theta(floor Y). Imported Chebyshev.theta_le_log4_mul_x yields <=log4 floor(Y)<=log4 Y. The imported Chebyshev estimate is retained, not proved in this lane.

PrimeLogSum (SecondKindBucket 82–84, AdmissibleSchurLemma 141–153): Y>=1, s finite primes <=Y, n=floor Y>=1. For each p<=n, floor(n/p)<=v_p(n!) by the first term of Legendre's formula. Distinct prime powers coprime, hence product p^floor(n/p) divides n!. Take logs to get sum floor(n/p) log p<=log(n!)<=n log n. Imported primorial_le_4_pow yields sum log p<=n log4. Since n/p<=floor(n/p)+1, sum n log(p)/p<=log(n!)+n log4<=n(log n+log4). Divide by n>0. Then restrict to s and use log n<=log Y. Source PrimeSum.lean div_le_factorization_factorial 10–20, sum_div_mul_log_le_log_factorial 22–61, log_factorial_le 63–69, sum_primesLE_log_div_le 71–116. This is an elementary factorial estimate, not the prime number theorem or RH.

TailSq (SecondKindBucket 90–93, AdmissibleSchurLemma 166–240): any natural p0>=3 and finite s of NATURALS n>=p0 (not necessarily prime). g(y)=(log y+1)/y. For real y>=3, D=log y-log(y-1)<=1/(y-1) from log t<=t-1. Thus yD<=3/2 and L=log y>=1. Exact identity g(y-1)-g(y)=(L+1-yD)/(y(y-1))>=L/[2y(y-1)]. Hence log y/y²<=2(g(y-1)-g(y)). Telescope over consecutive n=p0,...,p0+K-1; discard nonnegative g(p0+K-1) and enlarge any finite subset to such an interval (all terms nonnegative). Result <=2 g(p0-1). The source uses this factor 2. A simpler optional HUMAN-ONLY strengthening follows from monotonicity of f(t)=log t/t² on t>=2 (f'=(1-2log t)/t³<=0): sum_{n>=p0} f(n) <= integral_{p0-1}^infinity f(t)dt = g(p0-1). This factor-1 bound is not substituted for the pinned Lean conclusion; no proof-term equivalence claim.

## 4. Exact caller and remaining hypotheses

SecondKindLoss (SecondKindBucket 261–293) universally quantifies types iota,kappa,tau; finite W, Ps, J, TT; below,l, cl, TTp; Iex, at_,wz,Id,wd,d; gainW,tauW,gain,tau,lo,fl; real parameters a,th,w'',X'',X',C,f,N,Sk,Q1,Q2,lx,La,k,K0; L1 and p0. It assumes:
(i) UnitRule (24–28) with exact fibres, gains and tau on Ps and zero gains/tau off Ps; every p in Ps prime.
(ii) w''>0, 0<=th<=1/2, X''>=2, X''w''=a, a>=1, X'>=1, p0>=3, d>=4; C,f,Sk,Q1,Q2,lx,La>=0, k,K0>0.
(iii) for every t in TT, 0<=at_t<=a(1+th); for every j in J,t in TT,p in Ps,i in Iex(j,t,p), i odd and wz>=w''; for every j,t,i in Id(j,t), i>=1 and wd>=0.
(iv) for each p in Ps, served implies p<=X'', high implies X''<p; served implies SizeData2 (TTp subset TT and retained-ledger inequality, lines 45–48), nonserved implies every gain and tau zero.
(v) served implies fl<=flF, lo<=loF; each p in Ps below p0 satisfies K0<=p^(L1(p)-1). loF=cpF+indicator(p<X')(prF+orF) (258–259).
All hypotheses retained. ASK minus GaW <= floor term + cp term + pr term + order term + missing tops term + first-class term + second-class term + high term + d term, exactly as 283–293. The raw first/second terms are 4 m T a times the respective sum log p/p. Missing tops term is sum_served 4 m a log(p)/p |TT\TTp|. High term=mT*2log(2X'')(a th²+w'' th); d term=mT*2a log d/d.

In loss_bound 762–918, write S={p in Ps:cl p=served}, S'={p in S:p<X'}. The first two bounds use S and the last two use S'. IntervalCount 340–355 (empty set or min/max integer interval) gives |S|<=X''-2+1<=X''. For lo replacement, first use lo<=loF, then |TTp|<=T and loF>=0. No positivity assumption on lo itself is needed. Multiply floor by m=|J|, cp already contains M=mT, prime and order by mT. Source hServ/hS1/hcardS/hCp/hFl/hPrB/hOrB at 813–914. No need for T>=1 at this counting layer; that is used later by RUN8's size envelope. This proves the served portion of the nine-term inequality conditional on native hfl,hlo,hL; it does not establish those three premises for the host.

## 5. Source provenance and upstream drift

Repository leanprover-community/riemann-hypothesis, pinned revision above, source links prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ .
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/AdmissibleSchurLemma.lean blob 91c8966257416ce67a92357ff67f1ded82bba9c9. Namespace Formalism.LFunctionChainParameters.DeficitSplitLemmas; lines as above.
- src/Formalism/SizeWindowBrackets/SecondKindBucket.lean blob 502d2a6bf146f38b4c51ed87db9cf1ffbc9d7db8.
- src/Formalism/LogFactorialBounds/LogFactorialProofs/PrimeSum.lean blob 7088404e0bbc960487bf76f19264941245f88aac.
Latest upstream observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780 (2026-11-24 15:13:54 UTC, CI merge #1242). All three blobs changed: respectively 7a39bb9f1fb5195e32a23cd22ec2085b2db9b416, dd75da148c717f5d531d39fb3875f719efff4cb4, d9f43590bdb0736ccf9363d5bd39db1a817301. Direct source slice comparison: four theorem blocks old 483–511,512–529,530–550,551–601 equal byte-for-byte in fetched text to new 964–992,993–1010,1011–1031,1032–1082 respectively; old tail_step 168–197 equals new 641–670; four predicate blocks old 156–179 equal new 188–211. PrimeSum 71–116 vs 87–132 not identical. This is local source-text stability only, NOT dependency or kernel equivalence; pin unchanged.

## 6. Reproducible regression

Copy the following into run9.cjs and run node run9.cjs. Executed in V8 in this session. Log bounds use exact BigInt fixed-point intervals: log n=k log 2+2 atanh((n-2^k)/(n+2^k)), the ratio is in [0,1/3]; 32 positive series terms rounded outward and remainder bounded by geometric majorant. Divisions round outward. The factorial and primorial tests are exact integers; floor/cp tests also use exact rational proxy identities. Prime and order tests use actual finite prime sets, integer L1 as a sample of the real-exponent statement, not native geometry. Four negative controls check removed guards/branches, not counterexamples to Lean. No assertion of universal proof from finite tests.

```js
function regression(){
 const S=10n**30n,M=32,cache=new Map(),counts={factorial_divisibility:0,primorial_and_factorial:0,mertens:0,chebyshev:0,tail:0,floor_cp:0,prime_bucket:0,order_bucket:0,negative:0};
 const ck=(v,k)=>{if(!v)throw Error(k+" #"+counts[k]);counts[k]++};
 const ceil=(a,b)=>(a+b-1n)/b;
 // rigorous fixed-point enclosure of 2 atanh(u/v), 0<=u/v<=1/3.
 function series(u,v){let lo=0n,hi=0n;if(!u)return [0n,0n];for(let j=0;j<M;j++){let r=BigInt(2*j+1),a=2n*S*u**r,b=r*v**r;lo+=a/b;hi+=ceil(a,b)}let r=BigInt(2*M+1);hi+=ceil(2n*S*u**r*v*v,r*v**r*(v*v-u*u));return [lo,hi]}
 const L2=series(1n,3n);
 function L(n){if(cache.has(n))return cache.get(n);if(n<1)throw Error("log domain");let N=BigInt(n),b=1n,k=0n;while(2n*b<=N){b*=2n;k++}let [l,h]=series(N-b,N+b);let t=[l+k*L2[0],h+k*L2[1]];cache.set(n,t);return t}
 const primes=[];for(let n=2;n<=200;n++){if(primes.every(p=>p*p>n||n%p!==0))primes.push(n)}
 let fact=1n;
 for(let n=1;n<=160;n++){let N=BigInt(n);fact*=N;let pp=1n,prod=1n;for(const p of primes.filter(p=>p<=n)){let P=BigInt(p);pp*=P;let q=P**(N/P);ck(fact%q===0n,"factorial_divisibility");prod*=q}ck(fact%prod===0n,"primorial_and_factorial");ck(pp<=4n**N,"primorial_and_factorial");ck(fact<=N**N,"primorial_and_factorial");
 for(const ps of [primes.filter(p=>p<=n),primes.filter((p,i)=>p<=n&&i%2===0),[]]){let sum=ps.reduce((a,p)=>a+ceil(L(p)[1],BigInt(p)),0n);ck(sum<=L(n)[0]+L(4)[0],"mertens");let th=ps.reduce((a,p)=>a+L(p)[1],0n);ck(th<=N*L(4)[0],"chebyshev")}}
 for(let y=3;y<=200;y++){let Y=BigInt(y),a=L(y-1),b=L(y);let diff=(a[0]+S)/(Y-1n)-ceil(b[1]+S,Y);ck(ceil(b[1],Y*Y)<=2n*diff,"tail");
 // test stronger integral bound on an integer subset of [y,200].
 let sum=0n;for(let n=y;n<=200;n+=3)sum+=ceil(L(n)[1],BigInt(n)**2n);ck(sum<=(a[0]+S)/(Y-1n),"tail")}
 for(let p=2;p<=60;p++){ck(2n*L(p)[0]>=S,"floor_cp");for(let l=1n;l<=8n;l++)for(let d=1n;d<=6n;d++){
 // exact rational proxy log a=l/d, log p=u/v with u/v>=1/2.
 let u=BigInt(p),v=2n*u-1n;ck(l*l*v<=2n*l*l*u,"floor_cp");
 // cp identity: log p * logb(p,a) = log a after clearing denominators.
 let num=u*l*v,den=v*d*u;ck(num*d===l*den,"floor_cp")}}
 for(let X=1;X<=65;X+=4)for(let p0=0;p0<=15;p0++)for(let q1=0;q1<=3;q1++)for(let q2=0;q2<=3;q2++){
 let ps=primes.filter(p=>p<X);let left=ps.reduce((s,p)=>s+BigInt(p<p0?q1:q2)*L(p)[1],0n);
 ck(left<=L(4)[0]*BigInt(p0*q1+X*q2),"prime_bucket")}
 for(let X=3;X<=60;X+=3)for(let p0=3;p0<=14;p0++)for(let K0=2;K0<=5;K0++)for(let k=2;k<=4;k++)for(let La=1;La<=3;La++){
 let left=0n;for(const p of primes.filter(p=>p<X)){let P=BigInt(p),ell=1n;if(p<p0){while(P**(ell-1n)<BigInt(K0))ell++}else ell=2n;
 left+=ceil(BigInt(La)*L(p)[1],P*BigInt(k))+ceil(L(p)[1],P**ell)}
 let ll=L(X)[0]+L(4)[0],right=(BigInt(La)*ll)/BigInt(k)+ll/BigInt(K0)+2n*(L(p0-1)[0]+S)/BigInt(p0-1);
 ck(left<=right,"order_bucket")}
 // Failure controls for removed hypotheses.
 ck(3n*2n>2n*2n,"negative"); // cp count 3 with bound X''=2, positive common coefficient
 ck(3n>2n**0n,"negative"); // order reciprocal guard fails for p=2,L1=1,K0=3
 let lo=0n;for(let n=2;n<=100;n++)lo+=L(n)[0];ck(lo>100n*L(4)[1],"negative"); // theta fails for all integers
 ck(2n*L(2)[0]>0n,"negative"); // p=p0=2 must use Q2, not Q1=0
 return counts;
}
console.log(JSON.stringify(regression()));
```

Actual output: {"factorial_divisibility":3373,"primorial_and_factorial":480,"mertens":480,"chebyshev":480,"tail":396,"floor_cp":5723,"prime_bucket":4352,"order_bucket":8640,"negative":4}. All assertions succeeded. No Lean run. No URT speed benchmark.

## RESUME HERE
Next source-linked task: identify the actual producer of the low-prime order guard hL (K0<=p^(L1(p)-1)) and native hlo/hfl bounds in the host-to-SecondKindLoss adapter, using the pinned reverse-import map if available. Begin with the caller found in RUN7 and the definitions of native L1, lo and fl; do not infer from names. Independent audit requested: verify the four quantified statements and factors, especially p=p0, distinction S versus S', nonnegative loF rather than lo, and the optional stronger tail estimate being separate from the original source. HANDOFF TO math, geometry, editor, integration, dependency and formal audit. Project OPEN.
