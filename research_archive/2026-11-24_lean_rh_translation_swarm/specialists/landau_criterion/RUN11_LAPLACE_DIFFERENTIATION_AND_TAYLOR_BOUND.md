# RUN11 — direct Laplace coefficient producer and uniform Taylor control

2026-11-24. RESULT: DONE for source-matched local differentiation and normalization, with an additional derived bound. Project OPEN. Human derivation; finite certificate executed in V8; no independent Lean replay.

## Continuity and source provenance

Read AGENTS, research state opening, runner log/protocol opening, continuity, CI summary (17:05:20 UTC, checkpoint 382, unrelated physical gate check), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN10. Inspected newest commit titles and handoffs across all 14 peer lanes, with the editor and math notes separately fetched (editor tail includes appended acceleration handoff). No overlapping local Laplace task found. Blueprint reference noted, not independently reopened. The acceleration lane has authenticated solution manifest membership for Deduction.landau_cauchy (869149) and Deduction.landau_pole_asym (869232); these are peer-reported IDs, not locally extracted kernel edges. This run requests additional exact typed roles.

P=40e56bab026552e089d7afcfeff08d2defb9c005; H=307cef33f046955ee79dba47e0d828d06496d75f (upstream merge #1266, 2026-11-24 17:03:26 UTC, after RUN10 H=1da818b50f1e18808db2792b9dc735bda8cb84d8). Upstream manifest H blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d unchanged; P blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f. Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8 (Mathlib4).

RH paths relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/:
- P LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872, Deduction.PoleData (all seven fields), WindowHypU, LandauZeroFreeCriterion.
- P LandauTheorems/IteratedDerivLaplace.lean blob c1c05ec801b258064f1e14fb9d7e624eb7345382, all five theorems.
- P LandauTheorems/LandauCoeff.lean blob dc8287f2dbe7c767dcb77893eaf53d07092ed1f3, Deduction.landau_coeff.
- H LandauTheorems/landauWindow.lean blob 90b899b494d60d0f222cc0cf03ee0f6a125ef175 (same blob as RUN10). Executed comparison of theorem spans between P and H, ignoring the clump packaging: iteratedDeriv_laplace_int (H L82), _meas (L89), _hasDerivAt (L121), iteratedDeriv_laplace (L157), landau_coeff (L198) exactly equal; _bound (L95) differs in one line only: P nlinarith -> H explicit mul_le_mul_of_nonneg_right (by linarith) hu.le. The statement unchanged. No inference about unrelated upstream files.
- Mathlib Mathlib/Analysis/Calculus/ParametricIntegral.lean Pm blob c7937b328d3ab054a967d37f82132612a3ce83e6, L78–182, L262–307; Hm blob f9736661d574c192b092cb8ccca858abb52dd5d2, L90–194, L543–589. Read both derivative-bound theorem bodies and both core Fréchet-DCT bodies (not a full textual equivalence assertion). In derivative-bound step the NNReal norm API changes nnnorm -> nnNorm.
- Mathlib Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean Pm blob 13927ae74e7ce60a2d053df06eacec80b3f924a0, L63–90; Hm blob ec5f214fa4f7b8aff766bd5068da0a8a20370b49, L62–89. Integrability via Gamma convergence and positive change of variables. Blob identities supplied by connector, not independently hashed. No claim that all these nodes have independently verified reachable kernel roles.

## 1. Native prerequisites and the strict half-plane

Let g:R->R be measurable and |g(u)|<=C exp(2u) for every u>=0. Let Phi be the transform in Re(s)>2. These are the first three PoleData fields. Since u=0 is included, C>=|g(0)|>=0, even though the source does not separately demand C>0. On the restricted Lebesgue measure mu=volume|_(0,infty), put

F_k(z,u)=g(u)(-u)^k exp(-zu),   L_k(z)=integral F_k(z,u) dmu(u).

For k a nonnegative integer the integrand is measurable by composition and product (real-to-complex embedding, natural power, exponential continuous); hence a.e. strongly measurable since C is separable as a normed space. In the source _bound, if Re(z)>=2+b, u>0,

|F_k(z,u)|=|g(u)|u^k exp(-Re(z)u)<=C u^k exp(-bu).

This does not itself require b>0, but integrability does. Complex phase does not enter the norm. H's explicit multiplication uses u>=0; multiplying by negative u would reverse the inequality. Source _int invokes the Gaussian theorem at p=1, exponent n>=0>-1, b>0. General proof: substitute t=b*x^p, obtaining a positive multiple of t^((n+1)/p-1)exp(-t), a convergent Gamma integral when (n+1)/p>0. For this particular natural exponent an elementary independent proof is integration by parts on [0,T], letting T->infty: the base integral is 1/b, boundary T^n exp(-bT)->0 for n>=1, and I_n=n I_(n-1)/b. Thus I_n=n!/b^(n+1). This is a human expansion at p=1, not a replacement of the imported general theorem.

Fix s with sigma=Re(s)>2 and b=(sigma-2)/2>0 (the local variable delta in the source is NOT the prime-window width delta). For |z-s|<b, Re(z)>=sigma-|z-s|>sigma-b=2+b. In particular s lies in the ball. The same b works for every u>0. The integrand at s is integrable by domination with C u^k exp(-bu); its candidate derivative F_(k+1) at s is a.e. strongly measurable. For fixed u the chain rule gives d/dz F_k=F_(k+1), with the same uniform derivative bound C u^(k+1)exp(-bu) throughout that ball. These establish exactly the seven inputs to hasDerivAt_integral_of_dominated_loc_of_deriv_le (neighborhood; local a.e. measurability; center integrability; derivative measurability; uniform a.e. derivative bound; integrable bound; pointwise derivative on neighborhood).

## 2. Expand imported differentiation theorem

Take a single open disk centered at s, contained in the neighborhoods from the hypotheses. It is convex. Integrating the directional derivative along a straight segment (or using the normed-space mean-value inequality), obtain |F_k(z,u)-F_k(s,u)| <= B(u)|z-s| for almost every u, where B(u)=C u^(k+1)exp(-bu). The a.e. exceptional set is chosen before z; cannot exchange those quantifiers without proof. Thus nearby F_k is integrable by the bound |F_k(s,u)|+b B(u), and the candidate derivative is integrable by its bound and measurability. In the Mathlib general result the derivative is a continuous linear map, L(v):h->v h, and the scalar derivative conversion is legitimate over C, not only R.

For nonzero h inside the disk, define E_h(u)=[F_k(s+h,u)-F_k(s,u)]/h - F_(k+1)(s,u). This tends to 0 pointwise as h->0, is measurable, and |E_h(u)|<=B(u)+|F_(k+1)(s,u)|<=2B(u). Dominated convergence (apply to every sequence h->0, h!=0, in the metric space C) gives integral E_h ->0. Linearity of the Bochner integral applies since each term is integrable. Therefore L_k'(s)=L_(k+1)(s). The native Mathlib Fréchet proof uses normalized linear remainders and filter DCT, with the same domination; its generic incomplete-target branch is vacuous here because C is complete. Underlying generic filter DCT and mean-value theorem are imported, not recursively kernel-audited. Pointwise differentiation alone would not justify this interchange.

## 3. Induction and factorial normalization

At k=0, L_0 equals the original transform by (-u)^0=1, including the totalized convention 0^0=1 (u=0 not in domain). For the successor, the induction hypothesis holds at EVERY z with Re(z)>2, not merely the fixed s. This is an open neighborhood, so iteratedDeriv k L_0 and L_k are equal as germs at s; their derivatives coincide. Apply the established L_k'=L_(k+1). Then Phi=L_0 as germs by PoleData.laplace; the source uses hev.iteratedDeriv_eq k. Hence

(-1)^k Phi^(k)(s)/k! = integral_0^infty g(u) u^k exp(-su)/k! du.

All factorials strictly positive, so division legal, and (-1)^k(-u)^k=u^k. No positivity assumption on g, no condition on theta or the window width delta is needed at this step. The other four PoleData fields and original 0<theta<1, window delta>0, window quantifier and exceptional-real-pole residue positivity remain required in downstream criteria. No reversed implication: coefficient formula is a consequence of the transform representation, not a proof of zero exclusion.

## 4. Supplemental quantitative result (derived, not claimed a new Lean theorem)

Using the *full* center margin sigma-2, rather than the smaller neighborhood margin b, the normalized coefficients obey

|Phi^(k)(s)/k!| <= C/(sigma-2)^(k+1).

The bound is sharp in this growth class at real sigma for g(u)=C exp(2u). For |h|<sigma-2, expand exp(-hu) in its power series; absolute term sum inside the integral is bounded by C exp(-(sigma-2-|h|)u), integrable. Tonelli on norms followed by absolute convergence/termwise integration gives the Taylor expansion of Phi(s+h) (s+h stays in Re>2). The remainder after orders 0..N satisfies

|remainder| <= (C/(sigma-2)) * (|h|/(sigma-2))^(N+1)/(1-|h|/(sigma-2)).

This bound follows by summing a geometric majorant and does not analytically continue Phi outside its original half-plane. It can be used in a human reading view to consolidate the local induction and give explicit convergence, but it is not a substitute for the larger-radius Cauchy estimates or nearest-pole proof in RUN10. At Re(s)=2, g(u)=exp(2u) gives integrand 1 when s=2,k=0; integral diverges. A Bochner integral totalized to zero when nonintegrable is not a valid convergence argument. At real s>2, g=-exp(2u) gives negative coefficients; g=exp(2u)-2exp(u) gives coefficient k=0 equal to zero at s=3. Thus no positivity of every moment follows from the three fields. Equality at a single s also cannot replace germ equality (functions z-s and 0 agree at s but have different derivatives).

## 5. Executed certificate

Extract the JS block and run Node. Exact integer grid checks validate the neighborhood inequality and BigInt sign cancellation, including k=0. Numerical independent finite Simpson quadrature in normalized t=(Re(s)-2)u tests signed real exponential mixtures at complex centers, k=0..10, against the exact closed-form expression sum w/(s-a)^(k+1) obtained by integration by parts. Normalized integral finite cutoff t=64, step 1/256; numerical error includes truncation and discretization, not a rigorous error enclosure. Bound checks compare the computed normalized coefficient to sum |weights|. Negative controls encode the explicit analytic countermodels above, not independent demonstrations of divergence or derivatives by finite tests. No tests on actual zeros, no Lean execution, no URT-specific speed claim.

~~~js
function certificate(){
 const A=(ok,msg)=>{if(!ok)throw Error(msg)};
 let margin=0,sign=0,quad=0,bounds=0,negative=0,maxErr=0;
 // Units: radius d/4, center real part 2+2d/4, offset (x+iy)/4.
 for(let d=1;d<=32;d++)for(let x=-d;x<=d;x++)for(let y=-d;y<=d;y++){
   if(x*x+y*y>=d*d)continue;
   A(2*d+x>=d,"uniform half-plane margin");margin++;
 }
 const fac=n=>{let r=1;for(let j=1;j<=n;j++)r*=j;return r};
 for(let k=0;k<=32;k++)for(let u=0n;u<=32n;u++){
   A((-1n)**BigInt(k)*(-u)**BigInt(k)===u**BigInt(k),"sign cancellation");sign++;
 }
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],add=([a,b],[c,d])=>[a+c,b+d],sc=(a,[x,y])=>[a*x,a*y];
 const pow=(a,k)=>{let r=[1,0];for(let j=0;j<k;j++)r=mul(r,a);return r};
 const inv=([x,y])=>[x/(x*x+y*y),-y/(x*x+y*y)],norm=([x,y])=>Math.hypot(x,y);
 // g(u)=sum w exp(a u), a<=2; t=(Re(s)-2)u.
 // Integrate normalized coefficient (Re(s)-2)^(k+1) times the native coefficient.
 const fixtures=[[[1,2]],[[-1,2]],[[1,2],[-2,1]],[[2,1],[-3,0],[1,-1]]];
 const N=64*256,h=64/N;
 for(let g of fixtures)for(let gap of [.5,1,2,4])for(let im of [-2,-.5,0,.5,2])for(let k=0;k<=10;k++){
   let want=[0,0], C=g.reduce((s,[w])=>s+Math.abs(w),0);
   for(let [w,a] of g)want=add(want,sc(w,pow(inv([1+(2-a)/gap,im/gap]),k+1)));
   let re=0,ii=0;
   for(let j=0;j<=N;j++){
     let t=j*h, amp=g.reduce((s,[w,a])=>s+w*Math.exp(-(1+(2-a)/gap)*t),0)*t**k/fac(k);
     let m=(j===0||j===N)?1:j%2?4:2;
     re+=m*amp*Math.cos(im*t/gap);ii-=m*amp*Math.sin(im*t/gap);
   }
   let got=[re*h/3,ii*h/3],err=norm(add(got,sc(-1,want)));
   maxErr=Math.max(maxErr,err);A(err<2e-7,"moment quadrature");quad++;
   A(norm(want)<=C+1e-12 && norm(got)<=C+2e-7,"normalized growth bound");bounds++;
 }
 // Countermodels to weakening the proof: g=e^(2u) gives integral T at s=2,k=0.
 A(100>10,"boundary integral increases without bound: analytic value T");negative++;
 // g=-e^(2u) has a negative coefficient even at real s>2.
 A(-1/(3-2)<0,"no positivity from growth alone");negative++;
 // g=e^(2u)-2e^u at s=3, k=0, coefficient exactly zero.
 A(1/(3-2)-2/(3-1)===0,"sign cancellation possible");negative++;
 // equality at the single point s does not identify derivatives: Phi(z)=z-s, L(z)=0.
 A(1!==0,"point equality does not imply derivative equality");negative++;
 return {margin,sign,quad,bounds,negative,maxErr};
}
console.log(certificate());
~~~

Actual output: {"margin":35572,"sign":1089,"quad":880,"bounds":880,"negative":4,"maxErr":3.021707798760061e-10}. The 5 identical native spans and one one-line tactic drift were independently compared using connector-retrieved source during this run. No physical queue/gate edits. No CI verdict for this new note.

RESUME HERE: reconstruct Deduction.kernelIntegral and the exact incomplete-gamma / factorial tail identities in P LandauTheorems/kernelIntegral.lean and H relocated landauWindow.lean, distinguishing whole-domain moment from truncated left/right tails. Expand actual imported integration-by-parts and endpoint convergence premises; do not redo RUN1's outer contradiction or RUN11's differentiation. Request exact tagged role witnesses for Deduction.iteratedDeriv_laplace, Deduction.iteratedDeriv_laplace_hasDerivAt, Deduction.landau_coeff (and prior poleData_abstract), preserve type vs value role; compare to existing accelerator roots, do not infer reachability merely from imports. HANDOFF TO editor, integration, audit, math, dependencies, kernel and acceleration. Project OPEN.
