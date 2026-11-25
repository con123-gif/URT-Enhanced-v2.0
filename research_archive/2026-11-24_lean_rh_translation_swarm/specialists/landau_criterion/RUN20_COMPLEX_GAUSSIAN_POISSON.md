# RUN20 — Complex Gaussian Poisson summation and branch-safe convergence
2026-11-25. DONE for this local source-linked human derivation; not independent Lean replay, not full RH.
 
## Provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN19, continuity/state/log/protocol excerpts and latest physical CI checkpoint 410 (02:03:57Z, not RH evidence). Inspected recent commits and available RESUME notes of all other lanes; editor commit inspected but its full manuscript not reread, external blueprint not reopened. No overlap detected with this Gaussian task. RH pinned P=40e56bab026552e089d7afcfeff08d2defb9c005; new upstream H=c40250a50104b7e02e7d74f658d00fa7b1f4827c (2026-11-25T02:09:34Z, merge #1801); advanced from 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061. H lake-manifest mathlib revision remains N=31ce06eaadf4a200c0e1407c5f10953cf606b8f8; original M=0df444a360eaa60ab8c11dca51a86af692955474. No global upstream equivalence claimed.
Mathlib source files retrieved at both M and N (GitHub directory blob IDs, not locally rehashed):
- Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean: 4e994579ccd3c2399cc7c14ebeb3f73c978b6119 / a39545292b16084731c5ea591eea2d10dc0be70b. M38–83 and M87–128 correspond to N35–80 and N84–125. Removed explicit FourierTransform import and noncomputable section, minor tactic changes convert! -> convert and simp; displayed mathematical statements unchanged in the inspected blocks.
- Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean: e66f719517bc84d4a2ff3deafd3b47868b700bd4 / 294a34af1ed797d766970f31593ed462836fb132. fourier_gaussian_pi' M207–224 / N207–224; inspected text identical.
- Mathlib/Analysis/Fourier/PoissonSummation.lean: 0f6216336f57dcd63ad6cf3b077319ed68fe6119 / 32c6c71821894c56658ebab0f4ffb1a997fad84d. Real.tsum_eq_tsum_fourier_of_rpow_decay M206–211 / N201–206; inspected text identical.
These are source-linked prerequisites of RUN19, not authenticated role-labelled Main-root reachability.

## 1. Native theorem and exact Fourier convention
Complex.tsum_exp_neg_quadratic: for every complex a with Re(a)>0 and every complex b,
 sum_(n in Z) exp(-pi a n²+2pi b n) = a^(-1/2) sum_(n in Z) exp(-pi/a (n+i b)²).
Here a^(-1/2)=1/exp(Log(a)/2), principal Log. Let f(x)=exp(-pi a x²+2pi b x) on real x. Fourier convention is Ff(t)=integral_R f(x) exp(-2pi i x t) dx. The actual supplier fourier_gaussian_pi' applies integral_cexp_quadratic with coefficient -pi a (negative real part) and linear coefficient 2pi(b-it). This yields
 Ff(t)=a^(-1/2) exp(pi(b-it)²/a)=a^(-1/2) exp(-pi(t+i b)²/a).
Indeed b-it=-i(t+i b), so the square has minus sign. Since Re(a)>0, a is nonzero, Arg(a) lies strictly between -pi/2 and pi/2, and Log(1/a)=-Log(a). Hence (1/a)^(1/2)=1/a^(1/2) without branch ambiguity; positive real scaling does not change Arg. Native proof explicitly excludes Arg(a)=pi. Arbitrary alternative root changes sign, not an equivalent normalization. The complex quadratic integral itself is still imported; its full native derivation remains to expand.

## 2. Quantified decay and both summabilities
For A=Re(a)>0, B=Re(b), |f(x)|=exp(-pi A x²+2pi Bx). Completing the real square with half the Gaussian retained gives
 2|B||x| <= (A/2)x²+2B²/A,
 |f(x)| <= exp(2pi B²/A) exp(-pi A x²/2).
This proves little-o of every real power of |x| at both ends, because Gaussian exponent dominates logarithms. In native M38–67 this is done by first dominating exp(-x) at +infinity then reflecting x -> -x and b -> -b. No assumption that b is real.
Re(1/a)=A/|a|²>0. Expand Fourier exponent:
 -pi/a (x+i b)² = -pi/a x² -2pi i b/a x +pi b²/a.
Apply the same real-envelope argument with positive quadratic rate pi Re(1/a), an arbitrary real linear coefficient, and constant real part Re(pi b²/a). Multiplying by the constant |a^(-1/2)| preserves all decay. In particular f and Ff are O(|x|^-2), integrable on R, and absolutely summable on the integer lattice. No use of complex phase cancellation for convergence.
More generally if q>0 and |term(x)|=exp(-q x²+l x+c), then for |x|>=2|l|/q it is bounded by exp(c-q x²/2). For integer truncation |n|<=N with N+1>=2|l|/q, each omitted side starts at N+1 and successive squared increments >=1. Hence total omitted modulus <= 2 exp(c-q(N+1)²/2)/(1-exp(-q/2)). This explicit bound supports the regression check; it is not an interval-arithmetic certificate.

## 3. Poisson step and why b_decay>1 matters
Native applies Real.tsum_eq_tsum_fourier_of_rpow_decay with continuous f, decay exponent 2>1, both big-O hypotheses, and x=0. Here decay exponent is unrelated to the complex linear coefficient b. In human terms, periodize P(x)=sum_n f(x+n). On x in [0,1] the tail is uniformly bounded by a convergent constant multiple of sum |n|^-2 (finitely many terms omitted from the bound). P is continuous and periodic. Its kth Fourier coefficient, by uniform absolute convergence and substitution y=x+n, equals integral_R f(y)exp(-2pi i k y)dy=Ff(k); integer periodicity removes exp(2pi i k n). The absolutely summable Fourier samples form a uniformly convergent continuous Fourier series with these same coefficients. Uniqueness of Fourier coefficients for continuous periodic functions (e.g. Fejer convergence) identifies it with P. At x=0 each Fourier phase is 1, so sum f(n)=sum Ff(n). Factor the constant outside the absolutely convergent sum. Native generic theorem uses the summable restriction lemma and Real.tsum_eq_tsum_fourier; Fourier uniqueness is cited here, not re-elaborated. A general O(1/|n|) upper bound would not guarantee absolute summability, so the strict >1 condition is necessary for this route.
Set b=0 for Complex.tsum_exp_neg_mul_int_sq. Restrict to positive real a for Real.tsum_exp_neg_mul_int_sq; the principal power equals the positive real power. For Re(a)=0 or negative, even b=0 may give nondecaying or growing summands. No extension to such a asserted. At x=0 replacing +i b with -i b inside the bilateral sum leaves it unchanged by n -> -n; the actual Fourier transform sign must instead be checked at nonzero t. This prevents a falsely discriminating negative control.

## 4. Dependency and scope
Quadratic integral -> Gaussian Fourier transform + rapid decay -> general Poisson -> theta reciprocity (RUN19) -> weak/strong Mellin -> Hurwitz residue and boundary nonvanishing -> conditional Landau zero-free implication. No RH premise is used in this local analytic argument. Retain 0<theta<1, delta>0, exceptional real-pole positivity and original arithmetic window in the downstream criterion. No assertion about exceptional real zeros inside the strip, full RH, URT performance or independently validated Lean kernel. Native theorem references above are source matches, not a kernel dependency extraction.

## 5. Actual certificate
Executed JavaScript in the current tool environment. Extract fenced code and run with Node; integer Young checks test the alternative inequality 2|Bn|<=A n²+B²/A (same square identity with rescaling); complex double-precision samples test the actual series identity with analytical truncation estimates and scaled rounding tolerance. Neither finite checks nor floating tolerances prove the universal identity. Negative controls cover wrong square-root branch, Fourier sign at nonzero frequency, and missing strict positivity. 
```js
function certificate(){
 const add=([a,b],[c,d])=>[a+c,b+d], mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c], scale=([a,b],k)=>[a*k,b*k], abs=z=>Math.hypot(...z);
 const inv=([a,b])=>[a/(a*a+b*b),-b/(a*a+b*b)], exp=([a,b])=>[Math.exp(a)*Math.cos(b),Math.exp(a)*Math.sin(b)], sq=z=>mul(z,z);
 const sqrt=z=>{const r=abs(z);return [Math.sqrt((r+z[0])/2),Math.sign(z[1])*Math.sqrt((r-z[0])/2)]};
 const ck=(b,m)=>{if(!b)throw Error(m)};
 let exact=0,tests=0,neg=0,maxRelative=0,maxTail=0;
 for(let A=1;A<=12;A++)for(let B=-12;B<=12;B++)for(let n=-24;n<=24;n++){
  // 2 A |n| >= 0 and (A |n|-|B|)^2 >= 0 imply 2|B n| <= A n^2+B^2/A.
  let a=BigInt(A),b=BigInt(B),x=BigInt(n),t=b*x;t=t<0n?-t:t;
  ck(2n*a*t<=a*a*x*x+b*b,"Young bound");exact++;
 }
 function sums(a,b){
  const ai=inv(a),ib=mul([0,1],b),fac=inv(sqrt(a)),pi=Math.PI;
  const q1=pi*a[0],l1=2*pi*b[0],c1=0;
  const q2=pi*ai[0],l2=scale(mul(ai,ib),-2*pi)[0],c2=scale(mul(ai,sq(ib)),-pi)[0];
  function sum(q,l,c,term){
   const N=Math.ceil(Math.max(1,2*Math.abs(l)/q,Math.sqrt(90/q)))+2;
   let s=[0,0],norm=0;for(let n=-N;n<=N;n++){let z=term(n);s=add(s,z);norm+=abs(z);}
   const tail=2*Math.exp(c-q*(N+1)**2/2)/(-Math.expm1(-q/2));
   return {s,norm,tail};
  }
  let L=sum(q1,l1,c1,n=>exp(add(scale(a,-pi*n*n),scale(b,2*pi*n))));
  let R=sum(q2,l2,c2,n=>exp(scale(mul(ai,sq(add([n,0],ib))),-pi)));
  let r=mul(fac,R.s),res=abs(add(L.s,scale(r,-1))),norm=Math.max(1,L.norm+abs(fac)*R.norm);
  let tail=L.tail+abs(fac)*R.tail;
  return {res,norm,tail,L:L.s,R:r};
 }
 for(const ar of [.2,.5,1,2,4])for(const ai of [-2,-.5,0,.5,2])for(const br of [-.3,0,.3])for(const bi of [-.4,0,.4]){
  let x=sums([ar,ai],[br,bi]);ck(x.res<=x.tail+4e-13*x.norm,"complex Poisson");tests++;maxRelative=Math.max(maxRelative,x.res/x.norm);maxTail=Math.max(maxTail,x.tail/x.norm);
 }
 let v=sums([1,.7],[.2,.3]);ck(abs(add(v.L,v.R))>1e-2,"wrong sqrt branch");neg++;
 // a=1,b=i/4: a wrong sign in shift at x=0 is invisible by n->-n.
 // At nonzero Fourier frequency it is detectable; use a=1, b=i/4, t=1.
 ck(Math.abs(Math.exp(-Math.PI*.75**2)-Math.exp(-Math.PI*1.25**2))>.1,"wrong Fourier sign");neg++;
 ck(Math.exp(-Math.PI*(-1)*3**2)>1,"negative real part divergence");neg++;
 ck(abs(exp([0,-Math.PI*9]))===1,"zero real part term does not tend to zero");neg++;
 return {exact_young_checks:exact,complex_poisson_cases:tests,negative_controls:neg,max_scaled_residual:maxRelative,max_scaled_analytic_tail:maxTail};
}
console.log(JSON.stringify(certificate()));
```
Output: `{"exact_young_checks":14700,"complex_poisson_cases":225,"negative_controls":4,"max_scaled_residual":9.213443351805942e-16,"max_scaled_analytic_tail":1.162926982221157e-26}`.
 
## RESUME HERE
Expand actual integral_cexp_quadratic in Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean at M and N; preserve real/complex shifts, contour boundary estimates or holomorphic continuation used by the native proof, and principal complex powers. If source-linked root role coverage is still unavailable, keep these imported leaves separately labelled from authenticated dependencies; request exact root paths for Landau, zeroFree_of_rpow_window and Mathlib leaves. Arithmetic window supplier and independent kernel replay remain OPEN.
HANDOFF TO editor, integration, dependencies, kernel, audit, prime, math.
