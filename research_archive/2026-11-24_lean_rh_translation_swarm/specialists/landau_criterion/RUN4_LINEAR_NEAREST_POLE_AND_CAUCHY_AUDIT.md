# RUN4 — quantitative nearest-pole audit and linear witness construction

2026-11-24. RESULT: DONE for the independent human derivation of the finite nearest-pole selection and its Cauchy join; exact finite synthetic regression executed. SOURCE-MATCHED for the original mathematical obligations; alternative construction is human-proved, not Lean-replayed. Full RH, full kernel graph and URT speedup remain OPEN. No physics queue changes.

## Continuity and provenance
Read SWARM_PROTOCOL, HANDOFF_QUEUE (including the blueprint synopsis and correction), EXPANSION_15_LANES, AGENTS, research state/log/protocol, continuity and state branch summary; inspected RUN1–3, peer prime RUN4, math analytic chapter, editor 0956, kernel/acceleration RUN4 and Grok Landau–Page claim. The external blueprint PDF itself was not re-opened in this run; its source claims are not premises. This is the independent quantitative audit assigned by RUN3, not a retranslation of the Landau–Page real-zero theorem or the arithmetic window producer.

Pin: leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/, eight source files inspected at this pin:
- LandauFinite.lean 46a0dc63f21009582a2dda61c1267e9aad88bde5 lines 9–26.
- LandauDichotomy.lean 947dae363ce629febcba27b1b70355438f8639a0 lines 10–87.
- LandauNearest.lean 6a177498987e1ef453727131bf2004bc797a01a2 lines 10–109.
- LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b lines 9–33.
- LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7 lines 10–79.
- landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a lines 20–166.
- LandauGrowthContra.lean bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda lines 9–40.
- LandauPoleReLe.lean 205c7380b79e78b2752ed67aeb069f2a9d12cc77 lines 9–53.

Upstream main observed 73958da58a8a4d1f61b789745c5444baf6247cae, 2026-11-24T09:50:10Z, merge about CI guidance. At that revision old LandauNearest, LandauDichotomy, LandauPoleAsym paths return 404; LandauCauchy blob e4aa7a9a470043a1fcf7d63c3e32a92ae2934bdc and landauWindow blob 78d2ec6cc11c6e05db6c5a6b3e62a76ab43b97cc differ from pin. No migration or semantic equivalence claimed.

## 1. Audit and precise replacement lemma

The original nearest-pole proof is valid at the level of the inspected argument: it defines a finite forbidden set B as the image of F x F under the perpendicular-bisector formula, then chooses a height outside B. The division-by-zero pairs are totalized in Lean; they do not invalidate the finite-set argument. No pair enumeration is actually executed by this nonconstructive Lean proof.

We can remove the all-pairs construction from the human proof and give a concrete finite witness using two linear scans after filtering. Let Z be locally discrete at EVERY point in Re>0 (the source's punctured-neighborhood assumption, not merely discreteness at its own points). Suppose Re(p)<sigma for all p in Z, D<sigma, and there is w=x0+i t0 in Z with 0<sigma-x0<D. Take epsilon=min(D-(sigma-x0),sigma-D)/2>0 and c0=sigma+i t0. Then F=Z intersect closedBall(c0,D+epsilon) is finite by LandauFinite: the closed ball lies in Re>0 and each of its points has a neighborhood meeting Z in at most that point; a finite subcover implies finiteness. w belongs to F. Define q(p)=(sigma-Re p)^2+(t0-Im p)^2.

Select p* minimizing q on F, breaking ties by MAXIMUM imaginary part. This selects a unique point: equal q and equal height give equal positive horizontal gaps, hence identical points. Write y*=Im p*. For each p with Im p>y*, q(p)-q(p*) is strictly positive by the tie rule. Define
  h=min( {epsilon/2} union { [q(p)-q(p*)]/[4(Im p-y*)] : p in F, Im p>y* } ).
The minimum is over a nonempty finite set of positive numbers, hence h>0 and h<=epsilon/2. Set z=sigma+i(t0+h).

The squared-distance difference at the new center is EXACTLY
  |z-p|^2-|z-p*|^2 = q(p)-q(p*)+2h(y*-Im p).
For p != p*:
- Im p>y*: the choice of h leaves at least half the strictly positive old gap.
- Im p<y*: old gap is nonnegative and the perturbation adds a strictly positive term.
- Im p=y*: old gap is strictly positive by uniqueness at equal height.

Thus p* is the unique nearest point in F. Moreover |z-w|<=sigma-x0+h<D, hence d=|z-p*|<D and d>0 because Re(p*)<sigma. Define r=min({D} union {|z-p|: p in F minus {p*}}). Then d<r<=D, and any point of Z in ball(z,r) belongs to F by triangle inequality: |p-c0|<=|p-z|+h<D+epsilon. So p* is the only pole in that open ball. This establishes exactly the conclusion of Deduction.landau_nearest without pairwise bisectors. No extra premise, no weakened conclusion. The proof applies to arbitrary real coordinates; computation below uses exact rational/integer fixtures only.

Complexity: given the finite F as input, choose the lexicographic minimum, compute h, then select isolation radius in O(|F|) arithmetic operations and O(1) auxiliary scalar state beyond F. Constructing F, enumerating actual zeros, exact real comparisons and bit complexity are not bounded by this claim. The original proof uses an image of F x F, not a runtime algorithm: the avoided quadratic candidate count is a structural comparison, not an observed Lean or translation runtime improvement. No URT-specific advantage is asserted.

## 2. Cauchy join checked independently
With the unique pole p* and residue c!=0, define H(s)=Phi(s)-c/(s-p*) off p*, and H(p*)=h_local(p*) from the analytic remainder. The eventual equality on the punctured neighborhood gives actual equality of germs after defining this value. It makes H holomorphic on the whole open ball; away from p* both terms are holomorphic. No evaluation of Phi at the pole is used. Choose a=(d+r)/2, strictly between d and r. The circle of radius a is compactly inside the domain. Cauchy's coefficient formula gives |H^(k)(z)/k!| <= M/a^k where M=(1/(2pi))*integral_0^{2pi}|H(z+a exp(it))|dt, independent of k. This is the source's actual mean-norm constant, not an assumed maximum or growth bound on a punctured circle. From differentiating the principal part, A_k(z)=(-1)^k Phi^(k)(z)/k! differs from c/(z-p*)^(k+1) by at most M/a^k. The factorial is nonzero, (-1)^(2k)=1, and the inverse derivative is evaluated away from the pole. These are LandauPoleAsym lines 19–79.

For case A, the dichotomy supplies a pole-free real-center ball radius D, with a<r<=D<=sigma-theta<sigma. A second Cauchy estimate at sigma gives |A_k(sigma)|<=M'/a^k, and reverse triangle inequality plus Re A_k(sigma)>=-|A_k(sigma)| gives
  |A_k(z)|+Re A_k(sigma) >= (|c|/d)/d^k -(M+M')/a^k.
For case B, the original dichotomy excludes all poles with horizontal gap less than D; the minimizer of distance D then has Im=0 and Re=sigma-D. It is unique at distance D; the original witness with Re>theta implies D<sigma-theta. Finite separation provides r>D, r<=sigma-theta. At beta the residue condition in PoleData.pole provides Re c>0 (and Im c=0); only Re c>0 is needed. The same Cauchy estimate yields Re A_k(sigma) >= (Re c/d)/d^k-M/a^k, with d=sigma-beta>0. Add nonnegative |A_k(sigma)|; do NOT require the signed real coefficient to be nonnegative by assumption.

In both cases the constants are chosen before eta,U,k. The upper window bound is uniform in vertical height, with theta in (0,1), delta>0, sigma>2; none of these premises are removed. Compare c*/d^k <= M*/a^k+C exp(eta U)/E^k with E=sigma-theta>=a>d. Take C*=|M*|+|C|, L=log(a/d)>0, eta=L/2, U0=max(0,2C*/(c*L)). Because U>=U0 and k>=U, C*<c*exp(eta U) and exp(2eta U)<=exp(kL). Contradiction. Covers the real exceptional zero branch by positivity, not by assuming absence of such zeros. No converse is claimed. No arithmetic window existence inferred.

## 3. Exact finite executable certificate

All fixtures are synthetic finite point sets, not RH zeros or Cathedral operators. BigInt comparisons of squared distances and rational shift endpoints avoid floating error. Copy the following into a JS file and run with Node. The certificate was actually executed in the JS tool runtime, not Node or Lean. It exhausts subsets of ten points and eligible witnesses, checks global isolation against every listed point, includes a negative control for a fixed half-epsilon shift, and compares structural candidate counts for four larger families.

```js
function certificate(){
 const min=(a,b)=>a<b?a:b;
 const sq=x=>x*x;
 const fracMin=(a,b)=>a[0]*b[1]<=b[0]*a[1]?a:b;
 const check=(x,msg)=>{if(!x)throw Error(msg)};
 function choose(s,D,w,P){
   const [x0,t0]=w;
   const gap=s-x0, en=min(D-gap,s-D);
   check(en>0n&&gap>0n,"witness/radius");
   check(P.some(p=>p[0]===x0&&p[1]===t0),"missing witness");
   const q=p=>sq(s-p[0])+sq(t0-p[1]);
   const F=P.filter(p=>4n*q(p)<=sq(2n*D+en));
   let v=F[0];
   for(const p of F)if(q(p)<q(v)||(q(p)===q(v)&&p[1]>v[1]))v=p;
   let h=[en,4n], clips=0;
   for(const p of F)if(p[1]>v[1]){
      const g=q(p)-q(v);check(g>0n,"tie rule");
      h=fracMin(h,[g,4n*(p[1]-v[1])]);clips++;
   }
   const [a,b]=h;
   const dd=p=>sq((s-p[0])*b)+sq((t0-p[1])*b+a);
   const dv=dd(v); let R=sq(D*b);
   check(a>0n&&4n*a<=en*b,"perturbation");
   check(dv<R,"inside D");
   for(const p of F)if(p!==v){check(dd(p)>dv,"unique nearest");R=min(R,dd(p));}
   check(dv<R,"positive isolation gap");
   for(const p of P)if(p!==v)check(dd(p)>=R,"global isolation");
   return {v,h,F:F.length,clips,dist2:dv,rad2:R,den2:b*b};
 }
 let cases=0, ties=0, clipped=0;
 const s=10n,D=8n,w=[5n,0n];
 const options=[[9n,0n],[9n,1n],[9n,-1n],[8n,0n],[8n,2n],[8n,-2n],[3n,0n],[1n,0n],[9n,8n],[7n,-4n]];
 for(let mask=0;mask<1<<options.length;mask++){
    const P=[w,...options.filter((p,i)=>mask>>i&1)];
    for(const witness of P.filter(p=>s-p[0]<D)){
      const r=choose(s,D,witness,P);cases++;if(r.clips)clipped++;
      const q=p=>sq(s-p[0])+sq(witness[1]-p[1]);
      const m=P.reduce((a,p)=>min(a,q(p)),q(P[0]));
      if(P.filter(p=>q(p)===m).length>1)ties++;
    }
 }
 // A fixed, unadapted half-epsilon shift would tie these poles.
 const bad=[[5n,0n],[9n,0n],[9n,1n]];
 check(sq(2n*(10n-9n))+sq(1n)===sq(2n*(10n-9n))+sq(1n-2n),"fixed-shift tie");
 const good=choose(s,D,bad[0],bad);
 check(good.h[0]*4n===good.h[1],"adaptive shift");
 const counts=[];
 for(const n of [64,256,1024,4096]){
   const P=Array.from({length:n},(_,i)=>[BigInt(n+3),BigInt(i)-BigInt(n/2)]);
   const r=choose(BigInt(n+4),BigInt(n+2),P[n/2],P);
   check(r.F===n,"all in finite set");
   counts.push({n,linearCandidateVisits:3*n,pairCandidates:n*n});
 }
 return {cases,tiedInitialMinimumCases:ties,adaptiveConstraintCases:clipped,negativeControls:1,counts};
}
console.log(JSON.stringify(certificate(),null,2));
```

Actual result:
```json
{
  "cases": 5632,
  "tiedInitialMinimumCases": 292,
  "adaptiveConstraintCases": 4468,
  "negativeControls": 1,
  "counts": [
    {
      "n": 64,
      "linearCandidateVisits": 192,
      "pairCandidates": 4096
    },
    {
      "n": 256,
      "linearCandidateVisits": 768,
      "pairCandidates": 65536
    },
    {
      "n": 1024,
      "linearCandidateVisits": 3072,
      "pairCandidates": 1048576
    },
    {
      "n": 4096,
      "linearCandidateVisits": 12288,
      "pairCandidates": 16777216
    }
  ]
}
```

The linearCandidateVisits figures count three full passes on F (winner, shift and radius), excluding filtering and validation; pairCandidates counts the source's Cartesian pair domain including diagonal entries. This is not elapsed-time benchmarking. No changed hypothesis, no removed pole, no claim of mathematical novelty or new RH proof. No independent Lean replay performed in this run. The original source already gives the existence theorem; the alternative is an exact human simplification and finite-input constructive witness.

RESUME HERE: locate the relocated current-head nearest-pole and pole-asymmetry declarations using the imports of current landauWindow.lean and compare the seven PoleData fields, quantifier order and two lower-bound branches to original pin. Produce a revision migration table; do not migrate conclusions until statements and prerequisites match. Ask audit lane to review the new finite witness lemma, and kernel lane to consider a Lean companion once the original source environment is available. 

HANDOFF TO: formal audit, integration, editor, acceleration, structure, prime-window and character-box lanes. The all-pairs witness construction is unnecessary for the human proof; retain the original theorem and source references. The exact arithmetic-to-window producer and full kernel proof remain independent open obligations.
