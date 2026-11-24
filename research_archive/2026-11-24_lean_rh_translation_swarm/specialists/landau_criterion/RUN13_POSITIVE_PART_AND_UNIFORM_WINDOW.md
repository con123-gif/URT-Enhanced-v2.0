# RUN13 — positive-part window inequality and uniform coefficient bound

2026-11-24. RESULT: DONE for the local source-matched window-inequality and coefficient assembly; full RH reconstruction OPEN. No independent Lean replay, no new arithmetic window supplier, no URT speed claim.

## Continuity / source provenance

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES; research-state/log/protocol/continuity excerpts, CI summary checkpoint 389 (19:19:41 UTC, general physical checks only), own RUN12; inspected 30 recent commit titles and 9 peer commit file lists, retrieved available RESUME HERE diff lines for prime, acceleration, integration and math. Some dependency/kernel/structure/audit scripts had no handoff lines in the returned patches; editor manuscript not reread in full. External blueprint noted, not reopened. No duplicate of this exact RUN13 task found. No physical gate or baseline Queue changed.

P=40e56bab026552e089d7afcfeff08d2defb9c005. H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, latest upstream commit returned (2026-11-24 18:24:32 UTC, PR #1313 batch 8). Previous H=307cef33f046955ee79dba47e0d828d06496d75f. The H landauWindow blob is unchanged from RUN12. Paths relative to leanprover-community/riemann-hypothesis/src/Development/AutomorphicArithmetic/DedekindLFunctions/:
- P LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872: PoleData, WindowHypU.
- P LandauTheorems/LandauKernelMax.lean blob b230a9e40c3710eac205f32ceb8a44f2d003b647: Deduction.landau_kernel_max.
- P LandauTheorems/landauWindowIneq.lean blob cda93b0185260d72395d2ef2c90314e0fa7128ef: Deduction.landau_window_ineq_int, landau_window_ineq.
- P LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a: Deduction.landau_window_key.
- H LandauTheorems/landauWindow.lean blob 90b899b494d60d0f222cc0cf03ee0f6a125ef175: L865 kernel_max, L895–897 window_ineq_int, L899–end of member window_ineq, L1023–1056 window_key. Programmatically extracted theorem spans up to next theorem/end Deduction: kernel_max and window_ineq text identical; window_key body identical, header changes theta<1 to theta<2. Integrability proof in H now one line invoking landau_tails_integrable rather than P's exponential majorant. Hashes are GitHub connector blob identifiers. Edges below are source references, not authenticated elaborated type/value edges.

## 1. Pointwise kernel and integrability

For natural k, a>0 and u>=0, set K_k(a,u)=u^k exp(-au)/k!. Since the exponential series at au>=0 contains only nonnegative terms, (au)^k/k!<=exp(au). Multiply by exp(-au) and divide by a^k>0. Then K_k(a,u)<=a^(-k), exactly landau_kernel_max. This also covers k=0 and u=0 with 0^0=1 in the natural-power convention.

For sigma>2, a=(sigma-2)/2>0. The function h(u)=K_k(sigma-2,u) satisfies 0<=h(u)=K_k(a,u) exp(-au)<=a^(-k) exp(-au) on (0,infinity). The majorant is measurable and integrable, with integral a^(-k-1). Hence h integrable by domination, reproducing P landau_window_ineq_int. H uses RUN12's exact whole-domain integrability directly. Neither theorem holds as a convergence statement at sigma=2 for arbitrary k.

Optional sharper estimate (human derivation, not native theorem): for k>=1 the logarithmic derivative of t^k exp(-t) is k/t-1 for t>0. The function vanishes at t=0 and at infinity and maximizes at t=k. Therefore
  K_k(a,u) <= q_k / a^k,   q_k=k^k exp(-k)/k!, 0<q_k<1.
Strict inequality q_k<1 also follows from the other positive exponential-series terms at k>0. Set q_0=1. This refinement does not require Stirling's formula and leaves k=0 unchanged. It can improve the window term below but does not create an arithmetic window or remove a pole premise.

## 2. Native window inequality (all hypotheses)

Let real measurable g satisfy |g(u)|<=C0 exp(2u) for every u>=0. Evaluation at 0 implies C0>=0. Let sigma>2, theta<sigma (theta need not be positive for this LOCAL lemma), U>0, V real, k natural and gamma real. W=[U,V] is measurable and is a subset of D=(0,infinity); if V<U it is empty. R satisfies integrability of R(u)exp(-theta u) on W and, pointwise on W, R>=0 and g<=R. Do not require g>=0 or R>=0 outside W.

Put w=K_k(sigma,u), h=K_k(sigma-2,u),
  A_gamma=integral_D g(u) w(u) exp(-i gamma u) du,
  A_0=integral_D g(u) w(u) du (real).
The factorial is nonzero. Since |g|w<=C0 h and h integrable, |g|w, gw and the complex integrand are integrable (measurability, norm domination); taking the real part of the real-axis complex integral indeed gives A_0. The triangle inequality for the Bochner integral gives |A_gamma|<=integral_D |g|w, because the oscillatory factor has modulus 1.

**Core identity**: |g|+g=2 max(g,0). Consequently
  |A_gamma|+A_0 <= 2 integral_D max(g,0) w.
Split at the measurable W (endpoints do not matter). On W, g_+<=R (BOTH R>=0 and g<=R are needed), and
  w = K_k(sigma-theta,u) exp(-theta u)
    <= (sigma-theta)^(-k) exp(-theta u).
Off W, g_+ w <= |g|w <= C0 h. Both upper majorants are integrable on their respective domains by the stated assumptions. Integral monotonicity, then subtract A_0, yields exactly the native statement:
  |A_gamma| <= 2/(sigma-theta)^k integral_W R exp(-theta u)
                  - A_0 + 2 C0 integral_(D\\W) h.
Equivalently keep +A_0 on the left. This is the complete mathematical reason for the factor 2C0 and the signed real term. No estimate of |A_0| is substituted. The factor 2 is necessary in the pointwise positive-part identity (take g>0 and R=g); this does not assert global sharpness of the full theorem. Negative g is allowed and contributes zero to g_+. The stronger kernel estimate replaces ONLY 2/(sigma-theta)^k by 2q_k/(sigma-theta)^k in the displayed bound; no other part changes.

## 3. Uniform window coefficient assembly: native landau_window_key

P requires 0<theta<1, H 0<theta<2, both delta>0. PoleData contains seven obligations: meas, growth, laplace, pos, diff, iso, pole. The key uses meas/growth/laplace (landau_coeff) only, but the other four are needed later. In particular the pole field includes nonzero residue, real positive residue with zero imaginary part at a real pole, and analytic local remainder; no exceptional real zero is discarded.

WindowHypU: for EVERY eta>0 and EVERY real U0 there exist real U>=U0 and R such that on W=[U,(1+delta)U] R exp(-theta u) is integrable, R>=0, g<=R and integral_W R exp(-theta u)<=exp(eta U). This is an input, not an output.

By landau_tails (RUN12), choose sigma>2 and C_tail fixed from delta, before eta and U0, so for every U>=1 some natural k>=U has integral_(D\\W) h <= C_tail/sigma^k. Choose C0 from the growth field, nonnegative as above. Set C_key=2+2 C0 |C_tail|. Now fix arbitrary eta>0 and U0; use WindowHypU at max(U0,1), then choose k from landau_tails at that U. These same U,R,k work for EVERY gamma, not separately for different gamma. Because 0<theta<2<sigma (or P's stronger theta<1), 0<sigma-theta<=sigma; eta U>=0. Thus
  C_tail/sigma^k <= |C_tail| exp(eta U)/(sigma-theta)^k.
Even if C_tail were negative the first inequality to |C_tail|/sigma^k is valid; no sign on C_tail presumed. Multiply by 2C0>=0. Apply section 2 and the window cap, obtaining
  |A_gamma|+A_0 <= C_key exp(eta U)/(sigma-theta)^k.
By landau_coeff (RUN11), A_gamma=(-1)^k Phi^(k)(sigma+i gamma)/k!, and A_0 is the real part of the analogous real-axis coefficient. Their Laplace integral representations are legal at both points since real part sigma>2. This gives the exact source conclusion with existential sigma,C_key first, then universal eta,U0, existential U,k and universal gamma last. The local lemma in section 2 only needs theta<sigma, but this tail comparison specifically needs theta>=0. The H theorem allowing arbitrary theta later must use its separate reweighting argument (RUN5); do not silently generalize this calculation. Delta>0 and 0<theta<1 remain required in the pinned outer chain.

Supplemental: by RUN12 the tail can instead be bounded by C' exp(-cU)/sigma^k with c>0. The same native choices of k give
  |A_gamma|+A_0 <= [2 q_k exp(eta U)+2 C0 C' exp(-cU)]/(sigma-theta)^k.
This is a mathematical refinement conditional on the same WindowHypU and tail construction, not independent proof of zero exclusion. The original bound already suffices for the downstream exponential contradiction.

## 4. Certificate

Execute the following standalone JS (Node or compatible JS). It checks the exact finite algebraic inequality for arbitrary unit rational complex phases (a finite stronger analogue of the triangle step, NOT the continuum integral or actual L-function), scalar positive-part identity and cap, and numerical log-kernel maximization. Negative controls are pointwise and denominator-order counterexamples, not counterexamples to the native theorem. No native Lean kernel executed.

~~~js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 const phases=[[5,0],[3,4],[0,5],[-3,4],[-5,0],[0,-5]];
 let scalar=0,phase=0,kernel=0,negative=0;
 for(let g=-10;g<=10;g++)for(let w=0;w<=10;w++)for(let R=Math.max(g,0);R<=12;R++){
  ck((Math.abs(g)+g)*w===2*Math.max(g,0)*w,"positive part");
  ck((Math.abs(g)+g)*w<=2*R*w,"window cap");scalar+=2;
 }
 // Integer-scaled unit complex phases; no rounding in the finite triangle estimate.
 for(let x=-3;x<=3;x++)for(let y=-3;y<=3;y++)for(let a=1;a<=3;a++)for(let b=1;b<=3;b++)
 for(let mask=0;mask<4;mask++)for(const [r,i] of phases)for(const [s,j] of phases){
  const X=x*a,Y=y*b, real=r*X+s*Y,imag=i*X+j*Y;
  const window=(mask&1?Math.max(X,0):0)+(mask&2?Math.max(Y,0):0);
  const tail=(mask&1?0:Math.abs(X))+(mask&2?0:Math.abs(Y));
  const bound=2*(window+tail)-X-Y;
  ck(bound>=0 && real*real+imag*imag<=25*bound*bound,"finite window inequality");phase++;
 }
 // For k>0 compare the exact maximum formula with sample normalized kernel values in log scale.
 let lf=0;
 for(let k=1;k<=100;k++){
  lf+=Math.log(k);
  const logq=k*Math.log(k)-k-lf;
  ck(logq<0,"strict improvement");kernel++;
  for(const t of [.01,.1,.25,.5,1,2,3,5,10,20,50,100,200,k]){
   const logK=k*Math.log(t)-t-lf;
   ck(logK<=logq+1e-10,"maximum at k");kernel++;
  }
 }
 // Negative controls: removing factor 2 or the positivity condition is invalid at the pointwise step.
 ck(Math.abs(1)+1>1,"factor two window/tail");negative++;
 ck(Math.abs(-1)-1>2*(-1),"negative R");negative++;
 // For theta<0, sigma-theta>sigma: tail comparison used in window_key reverses.
 ck(1/3>1/4,"negative theta tail comparison");negative++;
 // k=0 kernel exact maximum at u=0; not a strict improvement.
 ck(Math.exp(0)===1,"k=0"); 
 return {scalar,phase,kernel,negative};
}
console.log(certificate());
~~~

Actual V8 execution: {"scalar":4796,"phase":63504,"kernel":1500,"negative":3}. All assertions completed. The first two counters are exact integer checks (bounded magnitudes far below 2^53); kernel checks use floating log values with tolerance 1e-10. These supplement, not replace, the derivation. No CI claim for this embedded check.

RESUME HERE: translate Deduction.landau_window_contra and the full two-branch final contradiction in P landauWindow.lean and H landauWindow.lean L1003–1021, L1057 onward; explicitly derive the distances d<e<=sigma-theta, bounds in each complex/real pole branch, sign of real residue, and choose eta/log growth rate preserving quantifier order. Compare RUN4 rather than duplicate nearest-pole construction. Request authenticated role-labelled type/value witnesses for landau_kernel_max, landau_window_ineq_int, landau_window_ineq, landau_window_key; do not promote source edges into kernel edges. HANDOFF TO editor, integration, audit, math, dependencies, kernel, acceleration. Project OPEN.
