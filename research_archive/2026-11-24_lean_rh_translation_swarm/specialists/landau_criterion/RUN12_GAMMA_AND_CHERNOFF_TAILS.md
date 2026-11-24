# RUN12 — Gamma normalization, two-tail Chernoff estimate and strict quantitative margin

2026-11-24. RESULT: DONE for the local source-matched kernel/tail chapter. Supplemental strict decay is a human-derived consequence, not a Lean declaration or a demonstrated URT speed improvement. Full project OPEN; no independent Lean replay.

## Continuity and provenance
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research-state/log/protocol/continuity excerpts, CI summary checkpoint 385 (18:02:52 UTC, physical checks only), RUN11. Reviewed 35 recent commit titles; prime RUN12 handoff, acceleration RUN12, integration and kernel handoffs were retrieved; editor/dependency commit paths examined but not all peer notes reread (tool-call limit). No duplicate of this exact task located. External blueprint noted, not reopened. No physics queue or gate changed.

P=40e56bab026552e089d7afcfeff08d2defb9c005; H=307cef33f046955ee79dba47e0d828d06496d75f (latest upstream returned by recent-commit lookup; unchanged since RUN11). Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8.

Paths relative to leanprover-community/riemann-hypothesis, src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/:
- P kernelIntegral.lean blob d785c54e03a55b0ef6c0fcb64bc4f8158e803642, Deduction.kernel_integral (not camelCase theorem name).
- P landauTails.lean blob 0e55797bac5320acf02d9acc832ca53df716e436, Deduction.landau_tails_integrable, landau_tails_chernoff, landau_tails_pow, landau_tails.
- H landauWindow.lean blob 90b899b494d60d0f222cc0cf03ee0f6a125ef175, L673–685, 704–706, 708–751, 753–769, 771–846. The kernel_integral and landau_tails_pow bodies match by visual comparison. H replaces the integrability proof by RUN11's iteratedDeriv_laplace_int and division by a constant; the P proof instead uses totalized integral_undef and the strict positivity of the evaluated integral to contradict nonintegrability. Chernoff proof changes set inclusion expression and arithmetic tactics; the final tail proof expands several arithmetic steps. Statements unchanged.
- Mathlib Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean Pm blob 8aea69baf716966861315823d437f041abc7b9a4; Hm blob 0b46b9a61a100b5c64f6ca6cf3b79c509e5de48b. Both read; spans 165–220 and 395–429 compared byte-for-byte after splitting lines, identical. Wider spans 300–334 and 450–481 differ; no claim of identical full theorem bodies. Relevant declarations: Complex.partialGamma_add_one L187, GammaIntegral_add_one L217, Gamma_eq_integral L320, Gamma_nat_eq_factorial L325, integral_cpow_mul_exp_neg_mul_Ioi L372, Real.Gamma_eq_integral L405, Gamma_nat_eq_factorial L422, integral_rpow_mul_exp_neg_mul_Ioi L465. Hashes are connector-reported Git blob identifiers, not local SHA calculations. Source reference edges, not independent reachable kernel roles.

## 1. Exact whole-domain integral and endpoints

For natural k and a>0 put K_k(a,u)=u^k exp(-au)/k! on u>0. Substitute t=au (positive scaling), so integral K_k(a,u) du = a^(-k-1) Gamma(k+1)/k! = a^(-k-1). Mathlib's complex scaling uses the positive-real cpow multiplication identity and positive Haar change of variables, then Gamma_eq_integral at real part k+1>0; Real theorem takes real parts. In the imported recurrence, for Re(z)>0 and X>=0, partialGamma(z+1,X)=z partialGamma(z,X)-X^z exp(-X). The integrand derivative uses x>0, the slit-plane power derivative, continuity at x=0 since Re(z)>0, and interval integrability of both terms from Gamma convergence. At infinity the boundary norm is X^Re(z) exp(-X)->0. The source uses the resulting Gamma recurrence, Gamma(1)=1, and induction with nonzero positive integer z. The real restriction follows by taking real parts. At natural k the direct proof integrates by parts on [0,T]; for k>=1 both the lower boundary and T^k exp(-aT) at infinity vanish. For k=0 integrate directly, not by dropping the lower endpoint. Thus the unnormalized moment is k!/a^(k+1); factorial is nonzero. A zero or negative a is not admissible: at a=0 even k=0 diverges. A totalized integral value does not supply convergence.

For t>=0, the supplemental (not native source theorem) exact truncated right tail is
  integral_t^infty K_k(a,u) du = a^(-k-1) exp(-at) sum_{j=0}^k (at)^j/j!.
Indeed if P_k(x)=sum_{j=0}^k x^j/j!, (exp(-x)P_k(x))'=-exp(-x)x^k/k!, and the boundary at infinity is zero. The left tail from 0 to t is a^(-k-1)[1-exp(-at)P_k(at)], or the positive series a^(-k-1) exp(-at) sum_{j=k+1}^infty (at)^j/j!. These formulas require t>=0; t=0 gives right total and left zero. For 0<=U<=V the complement of [U,V] splits into the left and right tails up to null endpoints. The native Chernoff lemma below does NOT assume U<=V, so use the union-bound proof there instead of this exact disjoint decomposition.

## 2. Native Chernoff inequality (all real endpoints)

Let 0<=l<s. On u>0 outside [U,V], either u<U or u>V, so at least one of exp(l(U-u)), exp(l(u-V)) is >=1. Multiply their sum by the nonnegative K_k(s,u), yielding
  K_k(s,u) <= exp(-l V) K_k(s-l,u)+exp(l U) K_k(s+l,u).
All three rates are strictly positive. Integrability on the full positive half-line and on the measurable subset follows from section 1 (or RUN11). Integrate the inequality on the complement, then enlarge the integration domain for the nonnegative RHS. Evaluate its whole-domain kernels. This proves exactly
  integral_{u>0 outside [U,V]} K_k(s,u) du
  <= exp(-l V)/(s-l)^(k+1)+exp(l U)/(s+l)^(k+1).
No disjointness premise, no strict l>0, no positivity of g needed. The distinction between s and the later sigma is essential: s=sigma-2, not sigma.

The next native lemma landau_tails_pow uses 1+t<=exp(t) with t=(sigma-a)/a and sigma,a>0. If x+k t<=c then
  exp(x)/a^(k+1) = exp(x)(sigma/a)^k/(a sigma^k)
     <= exp(c)/(a sigma^k).
For k=0 this remains valid; no division by k.

## 3. Native parameter choice and quantifier order

Fix delta>0 BEFORE all U; put l=2+6/delta, M=l(1+delta), sigma=M(2+l), A=(1+delta/2)sigma, a=sigma-2-l, b=sigma-2+l. Then l>2, M>l, sigma>2, a>0, b>sigma. Identities:
  l delta=6+2 delta;
  A=M(M-1);
  a=(2+l)(M-1), (sigma-a)/a=1/(M-1);
  (1+delta/2)(l-2)=l+1.
Also l b <= (l+1)sigma, since sigma >= l(l-2); sigma=M(l+2)>l(l+2). Choose V=(1+delta)U and k=ceil(AU) for EVERY real U>=1. AU<=k<=AU+1, k>=U. For the right tail exponent:
  -l V + k(sigma-a)/a = -M U + k/(M-1) <= 1/(M-1)<=1.
For the left tail:
  l U + k(sigma-b)/b = l U - k(l-2)/b
    <= l U -(l+1)sigma U/b <= 0.
Therefore with C=e/a+1/b fixed BEFORE all U,
  integral_{u>0 outside [U,(1+delta)U]} K_k(sigma-2,u) du <= C/sigma^k.
This proves the source's exact existential-universal-existential order: for each positive delta, exists sigma>2, exists C, for all U>=1, exists natural k>=U. Neither theta nor a zero location enters this local lemma. It cannot produce the arithmetic windows; it only controls the two tails after a window is supplied. Downstream original 0<theta<1, delta>0, all PoleData fields and exceptional real pole sign remain unmodified.

## 4. Supplemental strict exponential improvement

Retain the exact same native parameters and k, but use log r < r-1 for r>0, r!=1 instead of the relaxed exponential bound. Define L=log(sigma/a)>0 and R=log(sigma/b)<0. Then L<1/(M-1), R<-(l-2)/b, hence
  c_R=M-A L>0,
  c_L=-l-A R>0
(the second follows from A(l-2)/b=(l+1)sigma/b>=l). The normalized Chernoff bound is
  sigma^k tail <= exp(-M U+k L)/a + exp(l U+k R)/b
     <= exp(L) exp(-c_R U)/a + exp(-c_L U)/b
     <= C' exp(-c U),
where c=min(c_R,c_L)>0, C'=sigma/a^2+1/b, using k<=AU+1 for L>0 and k>=AU for R<0. Both constants depend only on delta. Moreover L<1/(M-1)<1, so C'<=C. This is strictly stronger than the original C/sigma^k bound, with the same choices and hypotheses. This is optional explanatory enrichment, not evidence of a missing assumption or a proof of RH. It does not replace the nearest-pole asymptotic or the window positivity term. No new hypotheses or fitted constants.

## 5. Reproducible finite certificate

Run the JS below in Node. BigInt rational checks use delta=p/q with p,q=1..25 and U=(j+3)/4, j=1..12; exact parameter identities, positivity and exponent inequalities. Polynomial derivative identity tested with integer factorial-scaled coefficients. Numerical log-space two-tail sums for 48 cases use finite upper Poisson sum with a term cutoff (not a rigorous interval enclosure). Compare the exact-formula numerical tails against the Chernoff sum, original normalized bound, and strict refinement. The three guard assertions are elementary checks accompanying the analytic countermodels, not independent demonstrations of divergence. No actual zeta zeros or Lean kernel tested.

~~~js
function certificate(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const Q=(n,d=1n)=>{if(d<0n){n=-n;d=-d}ck(d!==0n,"denominator");return [n,d]};
 const add=([n,d],[m,e])=>Q(n*e+m*d,d*e),neg=([n,d])=>[-n,d],sub=(a,b)=>add(a,neg(b)),mul=([n,d],[m,e])=>Q(n*m,d*e),div=([n,d],[m,e])=>Q(n*e,d*m),cmp=([n,d],[m,e])=>n*e-m*d;
 const I=n=>Q(BigInt(n)),eq=(a,b)=>cmp(a,b)===0n,le=(a,b)=>cmp(a,b)<=0n;
 let exact=0,poly=0,numerical=0,strict=0,negative=0,maxLogExcess=-Infinity;
 for(let p=1;p<=25;p++)for(let q=1;q<=25;q++){
  const d=Q(BigInt(p),BigInt(q)),l=add(I(2),div(I(6),d)),M=mul(l,add(I(1),d)),s=mul(M,add(I(2),l)),a=sub(sub(s,I(2)),l),b=add(sub(s,I(2)),l),A=mul(add(I(1),div(d,I(2))),s);
  ck(eq(mul(l,d),add(I(6),mul(I(2),d)))&&eq(A,mul(M,sub(M,I(1))))&&eq(a,mul(add(I(2),l),sub(M,I(1))))&&eq(mul(add(I(1),div(d,I(2))),sub(l,I(2))),add(l,I(1))),"identities");exact+=4;
  ck(cmp(l,I(2))>0n&&cmp(M,l)>0n&&cmp(a,I(0))>0n&&cmp(b,s)>0n&&cmp(s,I(2))>0n,"positivity");exact+=5;
  ck(le(mul(l,b),mul(add(l,I(1)),s)),"left exponent guard");exact++;
  for(let j=1;j<=12;j++){
   const U=Q(BigInt(j+3),4n),z=mul(A,U), k=Q((z[0]+z[1]-1n)/z[1]);
   ck(le(U,k)&&le(z,k)&&le(k,add(z,I(1))),"ceil bounds");exact+=3;
   ck(le(add(neg(mul(M,U)),div(k,sub(M,I(1)))),I(1)),"right exponent");exact++;
   ck(le(sub(mul(l,U),div(mul(k,sub(l,I(2))),b)),I(0)),"left exponent");exact++;
  }
 }
 // Derivative of e^-x P_k(x): multiply polynomial by k! to use integer coefficients.
 let fac=1n;for(let k=0;k<=60;k++){
   if(k>0)fac*=BigInt(k);
   let f=1n,co=[];for(let j=0;j<=k;j++){if(j>0)f*=BigInt(j);co.push(fac/f)}
   for(let j=0;j<=k;j++){let v=(j<k?BigInt(j+1)*co[j+1]:0n)-co[j];ck(v===(j===k?-1n:0n),"derivative polynomial");poly++}
 }
 const logadd=(a,b)=>{if(a===-Infinity)return b;if(b===-Infinity)return a;let m=Math.max(a,b);return m+Math.log1p(Math.exp(Math.min(a,b)-m))};
 // Poisson lower and upper positive sums; compute logs to avoid cancellation/overflow.
 function logTails(k,x,y){
  let tr=-y,sr=tr;for(let j=1;j<=k;j++){tr+=Math.log(y)-Math.log(j);sr=logadd(sr,tr)}
  let tl=-x;for(let j=1;j<=k+1;j++)tl+=Math.log(x)-Math.log(j);
  let sl=tl,j=k+1;for(;j<k+100000;){j++;tl+=Math.log(x)-Math.log(j);sl=logadd(sl,tl);if(j>x&&tl-sl<-45&&x/(j+1)<.99)break}
  ck(j<k+100000,"tail termination");return logadd(sl,sr);
 }
 for(const d of [.5,.75,1,1.5,2,3,5,8])for(const U of [1,1.25,2,3,5,10]){
   const l=2+6/d,M=l*(1+d),s=M*(2+l),a=s-2-l,b=s-2+l,A=(1+d/2)*s,k=Math.ceil(A*U),V=(1+d)*U;
   const L=Math.log1p((s-a)/a), R=Math.log1p((s-b)/b);
   const cr=M-A*L,cl=-l-A*R;
   ck(cr>0&&cl>0,"strict rates");strict+=2;
   const orig=logadd(1-Math.log(a),-Math.log(b)),chern=logadd(-l*V+k*L-Math.log(a),l*U+k*R-Math.log(b));
   const refined=logadd(L-Math.log(a),-Math.log(b))-Math.min(cr,cl)*U;
   const actual=k*Math.log1p(2/(s-2))-Math.log(s-2)+logTails(k,(s-2)*U,(s-2)*V);
   for(const [v,w] of [[actual,chern],[chern,orig],[chern,refined],[refined,orig]]){maxLogExcess=Math.max(maxLogExcess,v-w);ck(v<=w+1e-8,"tail bound");numerical++}
 }
 // analytic countermodels encoded: δ=0 collapses window, s=l invalid tilt, a=0 no damping, k=0 constant polynomial.
 ck(0===0 && !(2<2),"zero delta cannot define l=2+6/delta");negative++;
 ck(!(3<3),"strict tilt");negative++;
 ck(!(0>0),"rate zero");negative++;
 return {exact,poly,numerical,strict,negative,maxLogExcess};
}
console.log(certificate());
~~~

Actual V8 output: {"exact":43750,"poly":1891,"numerical":192,"strict":96,"negative":3,"maxLogExcess":-0.1294229700442946}. Tests are finite regression evidence for the algebra and numerical implementation, not validation of all real parameters. The analytic derivation is above. No independent Lean replay, no RH completeness claim, no URT benchmark. CI for this note not claimed.

RESUME HERE: reconstruct Deduction.landau_kernel_max, Deduction.landau_window_ineq_int and Deduction.landau_window_ineq from P LandauKernelMax.lean and landauWindowIneq.lean plus H landauWindow.lean L865–1001; check the sign of R, the positive-part window integral and factor 2C0, and the exact source statement (do not reuse a paraphrase). Request authenticated type/value role witnesses for Deduction.kernel_integral, Deduction.landau_tails_integrable, Deduction.landau_tails_chernoff, Deduction.landau_tails_pow, Deduction.landau_tails; prior acceleration membership is not a direct proof edge. HANDOFF TO editor, integration, audit, math, dependencies, kernel, acceleration. Project OPEN.
