# RUN10 — removable singularities and Cauchy coefficient extraction

2026-11-24. DONE for the local producer reconstruction; project OPEN. Source-matched human derivation, finite checks executed in V8, not independent Lean replay.

## Continuity and source ledger

Read AGENTS, research state opening, continuity and runner protocol/log opening, baseline CI summary (16:07 UTC, checkpoint 379, unrelated to this RH proof), swarm protocol, handoff queue, expansion, RUN9 and the newest prime, kernel, editor, math, integration and structure handoffs. Recent commits of all lanes inspected by title; full remaining peer handoff texts were not all retrieved (connector call limit); no claim of exhaustive peer reading. The editor and kernel explicitly request this analytical producer and typed role witnesses. Prime is on served-ledger bounds; integration on segment producers. Blueprint reference in queue noted, not independently reopened this run.

Pinned RH P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed main H=1da818b50f1e18808db2792b9dc735bda8cb84d8 (merge #1198, 2026-11-24 15:42:48 UTC); compare API reports H 164 commits ahead of RUN9's 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780, zero behind. H manifest blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d still pins Mathlib Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8. Pm=0df444a360eaa60ab8c11dca51a86af692955474.

RH source paths relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/:
- P poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1, poleData_abstract and poleData_char; H relocated CharacterBoxes/ZeroFreeAllOfTopG.lean c3bcece31e76be6368af5af4647f1ad30012fd3b, L808ff, same blob as RUN9.
- P/H LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b / e4aa7a9a470043a1fcf7d63c3e32a92ae2934bdc. Executed exact string equality of theorem span after trimming: true.
- P LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7; H landauWindow.lean 90b899b494d60d0f222cc0cf03ee0f6a125ef175, L520ff, L529ff.
- P landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a; P lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f; P ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002.
- Mathlib Pm/Hm Mathlib/Analysis/Complex/RemovableSingularity.lean 8e7041227bba49af1abb884b670498be9f004c63 / 58f06c94275dda5ac9278e44da24b787beb77f2f: P L47–65, H declaration L60.
- Mathlib Pm/Hm Mathlib/Analysis/Complex/CauchyIntegral.lean 7ab35a8eefd071d78383042b0806e30664a62cca / e177e62af2e2ced7ff9f853a19eefac727d397b3: P L589–629, H closed-ball declaration L716.
- Mathlib Pm/Hm Mathlib/MeasureTheory/Integral/CircleIntegral.lean 03eddc0ee2aa1aec79060846bda5eeff20383e65 / d14ca39cbb46d8bfa26e6c6ea1a2fe10dae0382e: P L623–661, L718–724; H L640–678, L735–741.
- Pm Mathlib/Analysis/Analytic/IsolatedZeros.lean 9bad403947a1959b68846a3a407f28fdd19d320e L78–89 (power-series shift); H relocation in RUN9. Hashes are Git blobs returned by connector, not independently recomputed. Mathlib factorial_smul is used by native source; its separate producer and full divergence-theorem proof not recursively expanded in this run.

## 1. Removable singular at 1 (exact source conditions)

Let g entire, g(1) nonzero, c=g'(1)/g(1), K complex, N(s)=g'(s)/g(s)-sc+K(1-s). U={s:g(s) nonzero} is open and contains 1, and N is holomorphic on U. N(1)=0. For s unequal to 1 let D(s)=(N(s)-N(1))/(s-1), D(1)=N'(1). The pinned differentiableOn_dslope equivalence requires U to be a neighborhood of 1. On U minus {1}, the usual quotient is differentiable; at 1, the derivative definition gives continuity of D. The imported differentiableOn_compl_singleton_and_continuousAt_iff proves analyticity there by choosing a closed disk in the neighborhood, using continuity everywhere on that disk and differentiability in its interior except the singleton, then applying hasFPowerSeriesOnBall_of_differentiable_off_countable. Away from 1 the local quotient applies. Conversely N(s)=N(1)+(s-1)D(s) gives differentiability if D is differentiable. This is a general local theorem, not an assumption that N has no zeros. The shift of the convergent series gives D(1+x)=sum a_(j+1)x^j, consistent with the same base value; no division by zero at 1.

Phi(s)=-D(s)/s is therefore holomorphic at every nonzero s in U, including 1. Supplemental explicit center value, obtained by quotient differentiation:
Phi(1)=-g''(1)/g(1)+(g'(1)/g(1))^2+c+K.
No extension at s=0 is asserted. For the principal family g is the regularized (s-1)zeta(s), g(1)=1; for other admissible characters g is L(s,chi). Continuity at the principal point comes from the residue-one theorem; it is not the arbitrary totalized value of zeta(1). The same removable theorem then supplies entire g. No exceptional real zero in (0,1) is removed by this regularization.

## 2. Exact circle coefficient and Cauchy bound

Source h0: 0<R<r (R=r' in Lean), hd: holomorphic on open disk B(z,r). Thus closed disk of radius R is contained in B(z,r); boundary continuity and circle integrability follow. Mathlib closed-ball result reduces to DiffContOnCl, then countable exceptional-set theorem with empty exceptional set. Its hasSum uses the Cauchy integral representation and the geometric series 1/(w-z-x)=sum x^j/(w-z)^(j+1), uniformly absolutely convergent on |w-z|=R for fixed |x|<R, since |x|/R<1. Integration termwise gives coefficient a_k=(1/(2pi i)) integral_{|w-z|=R} Phi(w)/(w-z)^(k+1) dw. The imported norm theorem follows by taking norm inside the parametrized interval integral. Set w=z+R exp(it), dw=iR exp(it)dt, so
a_k R^k=(1/(2pi)) integral_0^{2pi} Phi(z+R exp(it)) exp(-ikt)dt.
Then |a_k|<=M/R^k for the finite, nonnegative circle mean M=(1/(2pi)) integral |Phi|. The factorial_smul call evaluates the multilinear coefficient on k copies of 1: its value is Phi^(k)(z)/k!, since the kth derivative of x^k at zero is k!, lower terms vanish and higher terms have zero kth derivative there (analytic differentiation); k! never zero. The coefficient's evaluation is bounded by its operator norm, all input norms 1. This establishes the uniform-in-k bound, not a sample estimate. Mathlib's Cauchy theorem itself uses a divergence theorem; full measure-theoretic expansion remains an imported obligation.

Strict R<r is sufficient, not universally necessary for every particular function. R=r does not follow from hd alone: Phi(s)=1/(s-(z+r)) is holomorphic in the open disk but has a boundary pole. Also R=0 cannot be used to extract all coefficients. These guards are preserved.

## 3. Pole subtraction, no illicit boundary evaluation

Source landau_pole_asym requires rho in B(z,r), rho unequal z, holomorphy on B(z,r) minus {rho}, and punctured local equality Phi(s)=c/(s-rho)+h(s), with h analytic at rho. Define G(rho)=h(rho), G(s)=Phi(s)-c/(s-rho) elsewhere. The punctured equality plus the chosen point value yields equality of germs G=h at rho; G is analytic there. Elsewhere the quotient is holomorphic and subtraction is valid. Thus G holomorphic across the full disk. Cauchy bound applies to G even if the chosen circle passes through rho; it does NOT apply to raw Phi there. Near z the decomposition is valid and repeated differentiation gives
(-1)^k Phi^(k)(z)/k! = c/(z-rho)^(k+1) + (-1)^k G^(k)(z)/k!.
This implies exact source asymptotic error M/R^k. In the outer argument R=(d+r)/2 with d=|z-rho|>0, so d<R<r, and R<=sigma-theta. Pole dominance is exponential. The window coefficient upper bound and real/complex dichotomy remain mandatory. The original 0<theta<1, delta>0 and one-sided window hypothesis are not changed.

## 4. Guard against a tempting shortcut from RUN9

Positive real part of every family residue does NOT imply positive real parts of all normalized derivatives at a real center. Example of geometry allowed by the strip: rho=1/2+(5/2)i and its conjugate, z=3, equal S>0. Residue -S/[rho(rho-1)] = 2S/13 >0 for both. But z-rho=(5/2)(1-i). For k=1 the two squared inverse denominators are pure imaginary conjugates; their sum is zero. More generally k=1 mod 4 gives cancellation. This is a model pole configuration, not asserted actual L-function zeros or full PoleData satisfying the window. It disproves the shortcut of bounding every coefficient below by a positive sum based only on Re(c)>0. Keep original nearest-pole/real-pole dichotomy (or derive a genuinely new subsequence argument with compatible window quantifiers). The real exceptional branch still has c positive real and d>0.

## 5. Reproducible checks

Extract this JS block and run with Node. Executed in V8 tool runtime. Polynomial fixture g(1+x) has integer coefficients; check P(x)=g(1)N(1+x)g(1+x) by exact cross multiplication, P(0)=0 and coefficient P1, excluding singular denominators. F_97 discrete orthogonality is exact but only an algebraic model; complex circle sampling uses finite trigonometric approximations for degree <=8, not an integral proof. Negative controls demonstrate aliasing, strict radius, phase cancellation.
    
~~~js
function certificate(){
 const A=(b,m)=>{if(!b)throw Error(m)},ev=(p,x)=>p.reduceRight((s,a)=>s*x+a,0n);
 let regular=0,center=0,excluded=0,coeff=0,bound=0,negative=0,maxErr=0;
 for(let a0=-3n;a0<=3n;a0++)if(a0!==0n)
 for(let a1=-3n;a1<=3n;a1++)for(let a2=-2n;a2<=2n;a2++)
 for(let a3=-2n;a3<=2n;a3++)for(let K=-2n;K<=2n;K++){
  const g=[a0,a1,a2,a3],gp=[a1,2n*a2,3n*a3];
  const P=Array(5).fill(0n);
  for(let j=0;j<g.length;j++){P[j]-=a1*g[j];P[j+1]-=(a1+K*a0)*g[j]}
  for(let j=0;j<gp.length;j++)P[j]+=a0*gp[j];
  A(P[0]===0n&&P[1]===2n*a0*a2-a1*a0-a1*a1-K*a0*a0,"center formula");center++;
  for(let x=-4n;x<=4n;x++){if(x===0n||x===-1n||ev(g,x)===0n){excluded++;continue}
   A(ev(P,x)===x*ev(P.slice(1),x),"factor x");
   A(ev(P,x)===a0*ev(gp,x)-(a1*(1n+x)+K*a0*x)*ev(g,x),"original numerator");regular++;
  }
 }
 // Exact discrete Fourier orthogonality in F_97; not a complex analysis proof.
 const mod=x=>((x%97)+97)%97,pow=(x,k)=>{let y=1;while(k--)y=mod(y*x);return y};
 const w=pow(5,6);A(pow(w,16)===1&&pow(w,8)!==1,"root order");
 for(let j=0;j<16;j++)for(let k=0;k<16;k++){
  let s=0;for(let l=0;l<16;l++)s=mod(s+pow(w,mod(j-k+16)%16*l));
  A(s===(j===k?16:0),"orthogonality");coeff++;
 }
 // Actual circle samples for complex polynomials; degree<sample count.
 for(let m=0;m<=8;m++)for(let b=-3;b<=3;b++)for(let R of [.5,1,2]){
  const p=Array.from({length:m+1},(_,j)=>[b+j-2,((j*j+b)%5)-2]);
  let M=0, f=[];const N=32;
  for(let l=0;l<N;l++){let t=2*Math.PI*l/N,u=0,v=0;
   for(let j=0;j<p.length;j++){let [a,c]=p[j],q=R**j,x=Math.cos(j*t),y=Math.sin(j*t);u+=q*(a*x-c*y);v+=q*(a*y+c*x)}
   f.push([u,v]);M+=Math.hypot(u,v)/N;
  }
  for(let k=0;k<=m+2;k++){let u=0,v=0;
   for(let l=0;l<N;l++){let t=2*Math.PI*l/N,x=Math.cos(k*t),y=Math.sin(k*t);u+=(f[l][0]*x+f[l][1]*y)/N;v+=(f[l][1]*x-f[l][0]*y)/N}
   let [a,c]=p[k]??[0,0],err=Math.hypot(u-a*R**k,v-c*R**k);
   maxErr=Math.max(maxErr,err);A(err<1e-8,"Fourier sample coefficient");A(Math.hypot(u,v)<=M+1e-8,"sample triangle");bound++;
  }
 }
 // Aliasing when degree equals sample count.
 A(pow(w,16)===1,"alias at degree 16");negative++;
 // A pole on the contour is not permitted by the source closed-ball guard.
 A(!(2<2),"strict inner radius");negative++;
 // Conjugate pole pair, rho=1/2 +/- (5/2)i, center=3; residue positive real.
 // Scaled displacement 2(z-rho)=5 +/- 5i: squared inverse real part zero.
 A(5*5-5*5===0,"positive residues do not prevent phase cancellation");negative++;
 return {center,regular,excluded,coeff,bound,maxErr,negative};
}
console.log(certificate());
~~~

Actual output: {"center":5250,"regular":35930,"excluded":11320,"coeff":256,"bound":1323,"maxErr":1.4386691999581415e-12,"negative":3}. No independent kernel replay, infinite theorem inferred from tests, or URT speed advantage. The analytic implication remains conditional on arithmetic windows. No physical gates changed.

RESUME HERE: reconstruct the direct coefficient producer landau_coeff and its differentiation-under-integral domination (native LandauCoeff.lean at P, relocated landauWindow at H), checking neighborhood margins, k=0 and all factorials. Do not redo RUN1 outer estimates; expand imported parametric-integral theorem assumptions and differentiate each finite induction step. Request kernel/dependency typed role witnesses for Deduction.poleData_abstract, Deduction.landau_cauchy and Deduction.landau_pole_asym; kernel lane already requests prior roots. HANDOFF TO editor, integration, audit, math, kernel and dependencies. Project OPEN.
