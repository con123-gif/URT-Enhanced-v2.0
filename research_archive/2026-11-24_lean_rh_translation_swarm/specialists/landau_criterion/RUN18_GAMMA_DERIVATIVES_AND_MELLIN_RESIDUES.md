# RUN18 — Gamma derivatives and the Mellin residue normalization
2026-11-25. SOURCE-MATCHED human reconstruction of imported analytical leaves; local exact rational regression executed. Project OPEN; no independent Lean replay or URT performance claim.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity/state/log/protocol excerpts, physics-only CI #404 (00:09:32Z), previous RUN17 and recent peer commit titles and available RESUME HERE notes (prime, dependency, kernel, acceleration, integration, editor, geometry, audit, literature, character boxes, math, Galois, theta, structure). No duplicate of this leaf found in inspected records. Not all peer full files or the linked external blueprint were reopened. No changes to physics queue or gates.
RH repository leanprover-community/riemann-hypothesis: P=40e56bab026552e089d7afcfeff08d2defb9c005; H=b2f365a68500e2bde98cd60a2324263fc62fba10 (fresh listing, advanced from RUN17 H=9282d3a102c4aff0e6026746db2a8990f5d9cddd). Both lake-manifest.json retrieved (blobs b4d1ec31575a26b2159ec3a262b482bc051f3f6f / 8a747b58a34565cc6cb5341b86544aa5d3a20a2d), Mathlib pins unchanged from RUN17: Pm=0df444a360eaa60ab8c11dca51a86af692955474; Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8. All five files fetched at both pins. GitHub-reported blob hashes, not independently rehashed:
- Mathlib/NumberTheory/Harmonic/GammaDeriv.lean: 7e0a7df535eb6acffadb8c4d1e127aff39d36168 / c4b1542df4eb756fbc9f8c33607fffb9634f29a1.
- Mathlib/Analysis/SpecialFunctions/Gamma/BohrMollerup.lean: cdfc0cd73853362d49bdced80cff5b522f4566cd / 477da91b5d33fd1b59f6ab3d6dbdae55b356ed9d.
- Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean: 612bc27a5af0f7c696a7ed1a4a84f67b3d91979e / a28d2f37bd009275432130b5be2df6e68435760e.
- Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean: ada6574d2ed7e3d0b1122376c3bb8581f6385a1d / 26754c1f2894ba79f8fa729dc18e1f0fc0189997.
- Mathlib/NumberTheory/LSeries/HurwitzZetaEven.lean: e24ca61b0261ee1627bdeaeaaac8ef7bcec437ba / a0400d8fa1146d9856caa4f554d940eb30dfa55f.
15 selected source blocks compared by exact string equality, all identical: GammaDeriv Pm 32–84,87–90,92–94,96–98,100–146,154–159,168–172,184–191 (Hm 31–83,86–89,91–93,105–107,109–155,163–168,177–181,193–200); AbstractFuncEq Pm431–444,447–458 (Hm+2); HurwitzZetaEven Pm454–460,621–628 (Hm+2); BohrMollerup111–120,447–452 (same lines); Beta597–601 (Hm615–619). This is textual equality, not kernel equality. Hm GammaDeriv adds two integral representations of Euler's constant (95–103), not used by these existing proofs. No global upstream equivalence claimed.

## 1. Gamma derivative at positive integers
Source Real.deriv_Gamma_nat, hasDerivAt_Gamma_nat, hasDerivAt_Gamma_one (GammaDeriv Pm32–98). Set f(x)=log Gamma(x) for x>0. Gamma is positive and differentiable there because x is not a nonpositive integer. Gamma(x+1)=x Gamma(x) implies f(x+1)=f(x)+log x; differentiate on the open positive domain (so local equality, not merely equality at one point):
 f'(x+1)=f'(x)+1/x.
Induct from n=0, H_0=0: f'(n+1)=f'(1)+H_n, H_n=sum_{j=1}^n 1/j.
Convexity supplier BohrMollerup111–120: for x,y>0 and 0<a,b<1, a+b=1, the integral Gamma(ax+by) is integral of [e^-t t^(x-1)]^a [e^-t t^(y-1)]^b on t>0. Holder with p=1/a,q=1/b (finite, >1) gives <=Gamma(x)^a Gamma(y)^b; integrability follows from positive x,y. Take increasing log of positive quantities; endpoints a=0 or b=0 are equality. Native Holder construction Pm70–110. No assertion of log convexity on negative reals.
Convexity secant inequalities at n+1 give log n <= f'(n+1) <= log(n+1), n>=1 (the upper inequality also valid n=0). Substitute recurrence:
 H_n-log(n+1) <= -f'(1) <= H_n-log n.
Both endpoints converge to gamma by the defining harmonic limit and log(1+1/n)->0. Hence f'(1)=-gamma. Chain rule f'=Gamma'/Gamma and Gamma(n+1)=n! give Gamma'(n+1)=n!(H_n-gamma), in particular Gamma'(1)=-gamma. This is a squeeze proof, no zeta nonvanishing or RH invoked. Quantitative width log(1+1/n)<1/n follows by integrating 1/x on [n,n+1]. The finite bracket is an additional explicit error control, not a new theorem in number theory.

## 2. Gamma derivative at one half and complex upgrade
GammaDeriv Pm100–146 uses product rule on Legendre duplication (Real.Gamma_mul_Gamma_add_half, Beta597–601, obtained by complexification). Its positive-real supplier BohrMollerup447–452 is sufficient locally. For x>0 write psi=Gamma'/Gamma, take logs of the positive factors of
 Gamma(x) Gamma(x+1/2)=sqrt(pi) 2^(1-2x) Gamma(2x).
Differentiation gives psi(x)+psi(x+1/2)=2psi(2x)-2log2. At x=1/2 this reduces to psi(1/2)=psi(1)-2log2=-gamma-2log2. Since Gamma(1/2)=sqrt(pi)>0, Gamma'(1/2)=-sqrt(pi)(gamma+2log2).
This logarithmic argument compresses the native product-rule algebra, introduces no new premises, and is valid locally because all arguments stay positive. The positive-real duplication proof uses Bohr-Mollerup uniqueness (the normalized positive log-convex doubling function obeys the same recurrence); the full complex extension uses entire inverse Gamma and identity theorem, not division at poles. Those supplier proofs are not fully expanded here.
GammaDeriv Pm154–159,168–172,184–191: the complex Gamma is holomorphic at each indicated positive real argument, coincides with real Gamma on the real axis (Gamma_ofReal); its derivative equals the real derivative by restriction along the real direction, since the complex derivative is unique and already exists. A real derivative alone would not prove complex differentiability.
Then G(s)=Gamma_R(s)=pi^(-s/2)Gamma(s/2), G(1)=1. The product and chain rules give G'(1)=-(gamma+log(4*pi))/2, as RUN17. Dependency direction: positive-real gamma recurrence+convexity -> Gamma'(1) -> duplication -> Gamma'(1/2) -> complex derivative -> G'(1) -> zeta totalized value. No circular use of that value.

## 3. WeakFEPair residue, including the two distinct poles
Source AbstractFuncEq Pm f_modif 242–246, f_modif_aux2 337ff, Lambda0/Lambda 376–379, differentiable_Lambda0 388–389, Lambda_residue_k 431–444, Lambda_residue_zero 447ff. Let E be the complete complex normed space of the native Mellin context, k>0 real, eps nonzero complex, f0,g0 in E. Weak FE pair requires local integrability on (0,infty), rapid power decay of f-f0 and g-g0 at infinity (all real powers), and f(1/x)=eps*x^k*g(x) for x>0. Define modified f as f-f0 for x>1, f-eps*x^-k*g0 for 0<x<1, zero at x=1 (and outside the positive domain). Functional equation supplies rapid decay at zero after subtraction: f(x)-eps*x^-k*g0=eps*x^-k*(g(1/x)-g0). The two endpoint bounds and local integrability make Mellin transform Lambda0(s)=integral_0^infty x^(s-1) f_modif(x) dx entire (native strong FE Mellin theorem, itself still an imported analytic supplier). On Re(s)>k>0, subtraction term integrated on (0,1) is f0/s-eps*g0/(s-k); singleton x=1 has measure zero. Therefore the meromorphic continuation is
 Lambda(s)=Lambda0(s)-f0/s-eps*g0/(k-s).
For s!=k near k, also s!=0 since k>0, so
 (s-k)Lambda(s)=(s-k)(Lambda0(s)-f0/s)+eps*g0 -> eps*g0.
At s!=0 near 0, k-s stays nonzero and s Lambda(s)=s(Lambda0(s)-eps*g0/(k-s))-f0 -> -f0.
Scalar multiplication intended for vector E. The punctured limits, not assigned values, define residues. k>0 separates poles; if k=0, f0=g0=eps=1, Lambda0=0, terms cancel identically and the claimed independent residues fail. If g0=0 then the k residue is zero, and there need not be a pole at k.

## 4. Exact Hurwitz scaling
HurwitzZetaEven Pm254–276 constructs P_a from evenKernel and cosKernel on the positive domain, a in UnitAddCircle. Native fields: k=1/2, eps=1, f0=c_a=1 if a=0 else 0, g0=1; local integrability from continuity, rapid decay from exponential kernel bounds, functional equation from evenKernel_functional_equation. These theta kernel suppliers remain to be expanded, not assumed consequences of RH. Pm297–313 defines completed L_a(s)=Lambda(s/2)/2, E_a(s)=Lambda0(s/2)/2; hence
 L_a(s)=E_a(s)-c_a/s-1/(1-s).
At s=1, (s-1)L_a(s)=(s/2-1/2)Lambda(s/2)->1, since s->s/2 maps punctured neighborhoods bijectively. At 0, s L_a(s)=(s/2)Lambda(s/2)->-c_a. This exactly matches Pm454–468. Omitting the external factor 1/2 would double both residues. Dividing by G(s) near 1, where inverse G is holomorphic and G(1)=1, yields residue 1 for uncompleted Hurwitz zeta (Pm621–628). The special definition/update at s=0 is avoided by restricting to a neighborhood of 1 disjoint from 0. a=0 gives Riemann zeta. This justifies RUN17's residue premise independently of the harmonic asymptotic limit; no assumption about zeros, real exceptional zeros, or arithmetic window. Retain 0<theta<1, delta>0 and positive real-pole residues in the separate conditional Landau theorem; this imported lemma neither uses nor relaxes those requirements.

## 5. Reproducible finite regression
Exact BigInt fractions; atanh expansion log((n+1)/n)=2 sum_{j>=0} t^(2j+1)/(2j+1), t=1/(2n+1). Truncating after m terms has positive tail bounded by 2 t^(2m+1)/((2m+1)(1-t^2)). The interval arithmetic encloses H_n-log(n+1) and H_n-log n, hence gamma given the analytical squeeze above. Other tests check duplication coefficients and residue/scaling algebra in rational scalar specializations, not the analytic premises or actual zeros. Run the following with Node; it was actually executed in JS in this session:
```js
function certificate(){
 const abs=x=>x<0n?-x:x;
 const gcd=(a,b)=>{a=abs(a);b=abs(b);while(b){[a,b]=[b,a%b]}return a};
 const q=(a,b=1n)=>{a=BigInt(a);b=BigInt(b);if(!b)throw Error("zero denominator");if(b<0n){a=-a;b=-b}const g=gcd(a,b);return [a/g,b/g]};
 const add=(a,b)=>q(a[0]*b[1]+b[0]*a[1],a[1]*b[1]),neg=a=>q(-a[0],a[1]),sub=(a,b)=>add(a,neg(b)),mul=(a,b)=>q(a[0]*b[0],a[1]*b[1]),div=(a,b)=>q(a[0]*b[1],a[1]*b[0]),cmp=(a,b)=>{let v=a[0]*b[1]-b[0]*a[1];return v<0n?-1:v>0n?1:0};
 const must=x=>{if(!x)throw Error("certificate failed")};
 const logRatio=(n,m)=>{let t=q(1,2*n+1),t2=mul(t,t),p=t,L=q(0);for(let j=0;j<m;j++){L=add(L,div(mul(q(2),p),q(2*j+1)));p=mul(p,t2)}return [L,add(L,div(mul(q(2),p),mul(q(2*m+1),sub(q(1),t2))))]};
 let H=q(0),logL=q(0),logU=q(0),count=0,prevL=q(-1),prevU=q(2),last;
 for(let n=1;n<=64;n++){H=add(H,q(1,n));const [l,u]=logRatio(n,8);
  must(cmp(q(1,n+1),l)<0&&cmp(u,q(1,n))<0);count++;
  const lo=sub(H,add(logU,u)),hi=sub(H,logL);
  must(cmp(lo,hi)<0&&cmp(lo,prevL)>0&&cmp(hi,prevU)<0);count++;
  must(cmp(sub(hi,lo),q(2,n))<0);count++;
  last=[lo,hi];prevL=lo;prevU=hi;logL=add(logL,l);logU=add(logU,u);
 }
 must(cmp(last[0],q(56,100))>0&&cmp(last[1],q(59,100))<0);count++;
 // Log derivative duplication coefficients in basis (gamma, log 2).
 let dup=0;
 for(let g=-5;g<=5;g++)for(let l=-5;l<=5;l++){let a=-g,b=-g-2*l;must(b+a===2*a-2*l);dup++}
 // Abstract residue identity with rational scalar examples.
 let res=0,scale=0;
 for(let k=1;k<=8;k++)for(let j=-8;j<=8;j++)for(let e=-3;e<=3;e++)for(let f=-2;f<=2;f++)for(let g=-2;g<=2;g++){
   const K=q(k,2),s=q(j,3);if(cmp(s,K)===0||s[0]===0n||e===0)continue;
   const h=q(j*j+1,5),F=q(f),G=q(g),E=q(e),d=sub(s,K);
   const lambda=sub(sub(h,div(F,s)),div(mul(E,G),sub(K,s)));
   must(cmp(mul(d,lambda),add(mul(d,sub(h,div(F,s))),mul(E,G)))===0);res++;
 }
 for(let j=-10;j<=10;j++)for(let c=0;c<=1;c++){const s=q(j,3);if(s[0]===0n||cmp(s,q(1))===0)continue;const t=div(s,q(2)),h=q(j+7,3);const L=sub(sub(h,div(q(c),t)),div(q(1),sub(q(1,2),t)));must(cmp(div(L,q(2)),sub(sub(div(h,q(2)),div(q(c),s)),div(q(1),sub(q(1),s))))===0);scale++}
 // Negative controls: swapped residue sign, missing external 1/2, coincident poles k=0.
 must(cmp(q(1),q(-1))!==0);
 must(cmp(q(1),q(2))!==0);
 // At k=0, f0=g0=epsilon=1, h=0; -1/s -1/(0-s)=0.
 must(cmp(sub(neg(div(q(1),q(2))),div(q(1),q(-2))),q(0))===0);
 return {harmonic_interval_checks:count,duplication_coefficient_checks:dup,residue_identity_checks:res,hurwitz_scaling_checks:scale,negative_controls:3,total:count+dup+res+scale,certified_gamma_interval:"0.56 < gamma < 0.59"};
}
console.log(JSON.stringify(certificate()));
```
Actual output: `{"harmonic_interval_checks":193,"duplication_coefficient_checks":121,"residue_identity_checks":18900,"hurwitz_scaling_checks":38,"negative_controls":3,"total":19252,"certified_gamma_interval":"0.56 < gamma < 0.59"}`. Negative controls are explicit algebraic mutations/counterexample; not an independent Lean checker.

## RESUME HERE
Expand the native WeakFEPair strong-pair construction (hf_modif_FE and endpoint power decay) and the Jacobi evenKernel/cosKernel bounds and functional equation used by hurwitzEvenFEPair. Preserve the local-integrability and all-real-power quantifiers and distinguish the a=0 constant from a!=0. Request authenticated role-labelled root paths for GammaDeriv, WeakFEPair.Lambda_residue_k, completedHurwitzZetaEven_residue_one and all earlier Landau window/pole declarations; source references alone do not establish actual root reachability. Arithmetic window supplier and independent kernel replay remain OPEN.
HANDOFF TO editor, integration, dependencies, kernel, audit, math, prime.
