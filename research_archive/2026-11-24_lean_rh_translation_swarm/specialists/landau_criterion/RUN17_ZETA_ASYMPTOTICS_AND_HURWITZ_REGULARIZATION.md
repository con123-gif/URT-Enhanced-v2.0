# RUN17 — zeta asymptotics, Hurwitz regularization and the two distinct constants
2026-11-24. RESULT: SOURCE-MATCHED external analytical leaf; exact finite certificate executed in JS. Not an independent Lean replay, new RH proof or URT benchmark.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, physics-only CI #401 (23:11:26Z), RUN16, 22 recent commit titles and 15 peer commit details with available RESUME HERE notes. Prime RUN17 works on tolerance admission, dependency/kernel/acceleration on role-labelled exports, integration on 34 frontier obligations, editor on fixed-character decay, geometry on polynomial growth. No duplicate of this particular asymptotic leaf found in inspected records. Not all peer full notes or linked external blueprint PDF reopened. No physical Queue/gate changes.
RH repo leanprover-community/riemann-hypothesis, original P=40e56bab026552e089d7afcfeff08d2defb9c005, current H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (fresh commit listing, unchanged). Dependency pins from RUN16: Mathlib Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8. All four actual Mathlib source files retrieved at both pins. Blob hashes returned by GitHub directory metadata, not independently rehashed:
- Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean: 6846dc699ecd29cc8a1754c1680176210969ffd1 / 30397bfe2272d8400aa42bcbb44bec085b7f23ab.
- Mathlib/NumberTheory/LSeries/HurwitzZetaEven.lean: e24ca61b0261ee1627bdeaeaaac8ef7bcec437ba / a0400d8fa1146d9856caa4f554d940eb30dfa55f.
- Mathlib/NumberTheory/Harmonic/GammaDeriv.lean: 7e0a7df535eb6acffadb8c4d1e127aff39d36168 / c4b1542df4eb756fbc9f8c33607fffb9634f29a1.
- Mathlib/NumberTheory/LSeries/RiemannZeta.lean: 3c92195fce20df7fda41cfd823b3266f83cf3070 / c6daab6af3ae8c780530f70af376bcae873b6cab.
13 declaration blocks compared: 11 textually equal, two differences: ZetaAsymp.tendsto_riemannZeta_sub_one_div_Gammaℝ uses convert instead of convert!; RiemannZeta.riemannZeta_residue_one drops the tactic wrapper "by exact". No changed mathematical statements in these blocks. Source-level dependency only, not an authenticated root path.

## 1. Real-axis limit, not evaluation at the pole
For real s>=1 and n>=1 set t_n(s)=integral from n to n+1 of (x-n)x^(-s-1) dx. Let T_N(s)=sum_{n=1}^N t_n(s), T(s)=sum_{n>=1} t_n(s). This matches term, termSum, termTSum at Pm lines 61–68. Integrability follows from x>=n>0. Positivity and the bound 0<=t_n(s)<=1/(2 n^(s+1)) follow by integrating x-n against the largest possible denominator inverse; the factor 1/2 is a convenient stronger explicit bound. At s=1 integration gives
  t_n(1)=log(n+1)-log n-1/(n+1).
Summing telescopically from n=1 to N yields T_N(1)=log(N+1)-H_{N+1}+1, with H_m=sum_{j=1}^m 1/j. Thus T(1)=1-gamma by the defining harmonic limit. Source Pm term_one 93–128, termSum_one 130–140, term_tsum_one 147–156.
For s>1 the antiderivative x^(1-s)/(1-s)+n*x^(-s)/s gives
  t_n(s)=[n^(1-s)-(n+1)^(1-s)]/(s-1) - n*[n^(-s)-(n+1)^(-s)]/s.
Discrete summation by parts:
  sum_{n=1}^N n*(a_n-a_{n+1})=sum_{n=1}^N a_n-N*a_{N+1}, a_n=n^(-s).
Hence
  T_N(s)=(1-(N+1)^(1-s))/(s-1) - (sum_{n=1}^N n^(-s)-N/(N+1)^s)/s.
The boundary term 0<=N/(N+1)^s<=(N+1)^(1-s) tends to zero exactly under s>1. Absolute convergence of the zeta series there gives T(s)=1/(s-1)-zeta(s)/s and therefore
  zeta(s)-1/(s-1)=1-s*T(s).
Source Pm term_of_lt 166–194, termSum_of_lt 196–215, termTSum_of_lt 222–252, zeta_limit_aux1 258–262.
For all s>=1, the integrands are dominated by (x-n)x^-2 and each t_n is continuous by dominated convergence; 0<=t_n(s)<=t_n(1) and sum t_n(1) finite. Uniform convergence (Weierstrass M-test) thus gives continuity of T on [1,infinity). Let s decrease to 1 in the identity to obtain gamma. Source continuousOn_term 272–294, continuousOn_termTSum 296–311, tendsto_riemannZeta_sub_one_div_nhds_right 316–339. Hm compared named blocks shifted by +1 line.

## 2. Native complex upgrade and a simpler optional derivation
Native Pm ZetaAsymp L342–373, identical Hm L343–374: f(s)=zeta(s)-1/(s-1) is holomorphic on a punctured neighborhood of 1; by the independently established residue limit (s-1)zeta(s)->1 we have (s-1)f(s)->0. Subtracting the finite totalized f(1) if required by the removable-singularity theorem does not change that limit. The removable singularity theorem for little-o of inverse distance produces a finite limit C on the complex punctured neighborhood; restriction to the right real axis then gives C=gamma by uniqueness. This DOES NOT assert f(1)=gamma with Lean's totalized value. Pm RiemannZeta L242–243 uses HurwitzZetaEven_residue_one 0; HurwitzZetaEven L621–628 derives that limit from the completed residue and continuous inverse gamma normalized to 1. Completed residue ultimately comes from WeakFEPair; not independently expanded here.
Optional independent human simplification: allow complex s with Re s>0 in t_n(s), using positive real x and exp(-(s+1)log x). Each t_n is entire in s by integration over a fixed compact interval (derivatives dominated on compact sets). On Re s>=sigma0>0, |t_n(s)|<=1/(2 n^(1+sigma0)); for N>=1 the absolute tail is <=N^(-sigma0)/(2 sigma0) by the integral test. Thus T(s) is holomorphic on Re s>0 by locally uniform convergence. The holomorphic expression 1-s*T(s) equals zeta(s)-1/(s-1) on real s>1 from section 1, hence everywhere on the connected punctured half-plane Re s>0, s!=1 by the identity theorem, using existing holomorphy of zeta away from 1. It has value gamma at 1. This replaces the removable-singularity/residue argument for this particular limit with a complex M-test and identity theorem; no added assumptions on zeta beyond the original right-half-plane series and holomorphy. Not a new result in analytic number theory; not formalized in Lean. Explicit tail bound also gives |1-s*T_N(s) - (1-s*T(s))| <= |s| N^(-sigma0)/(2 sigma0). No claim of speedup: near 1 this bound is only order 1/N.

## 3. Exact Hurwitz regularization: which finite value?
Write G(s)=Gamma_R(s)=pi^(-s/2)*Gamma(s/2), G(1)=1. Let E_a(s)=completedHurwitzZetaEven_0(a,s) entire, c_a=1 if a=0 in the unit additive circle and 0 otherwise. Mathlib completed function L_a(s)=E_a(s)-c_a/s-1/(1-s). This formula uses totalized division even at 0 and 1. Source HurwitzZetaEven Pm L297–312; differentiability E_a Pm L417–418. In a neighborhood of 1 excluding 0, H_a(s)=hurwitzZetaEven(a,s)=L_a(s)/G(s) (its special update is at zero only). Totalized division by zero is 0, so 1/(1-s)=-1/(s-1) also at s=1. Therefore throughout a neighborhood INCLUDING 1,
  H_a(s)-1/[(s-1)G(s)] = (E_a(s)-c_a/s)/G(s).
The RHS is holomorphic near 1 because G inverse is holomorphic (and G(1)=1) and s!=0 there. At 1 the LHS equals H_a(1) under Lean's convention. Hence its limit over FULL neighborhoods is H_a(1)=E_a(1)-c_a. Source Pm differentiableAt_hurwitzZetaEven_sub_one_div L630–642 and tendsto_hurwitzZetaEven_sub_one_div_nhds_one L647–650; Hm L632–644, L649–652. The gamma-weighted subtraction, not the ordinary principal part, is crucial to this full-neighborhood statement. For a=0, H_0=zeta, E_0=completedRiemannZeta_0, so the subtraction c_a/s cannot be dropped.

## 4. Gamma correction and uniqueness of limits
From Gamma(1/2)=sqrt(pi) and Gamma'(1/2)=-sqrt(pi)*(gamma+2 log 2), the product and chain rules give
  G'(1)=-(log pi)/2 -(gamma+2 log 2)/2=-(gamma+log(4 pi))/2.
Source Pm GammaDeriv.hasDerivAt_Gamma_one_half L184–191 and hasDerivAt_Gammaℝ_one L205–226, Hm latter starts 214. The real half-argument derivative is an imported supplier (via Gamma duplication and derivative at 1); not independently expanded here.
For s!=1 and G(s)!=0 near 1,
  1/(s-1)-1/[(s-1)G(s)] = [(G(s)-G(1))/(s-1)]/G(s) -> G'(1).
Source ZetaAsymp.tendsto_Gamma_term_aux Pm L386–399 (Hm +1).
Adding the complex Laurent limit from section 2 gives
  lim_{s->1,s!=1} [zeta(s)-1/((s-1)G(s))]=gamma+G'(1)=(gamma-log(4 pi))/2.
The full-neighborhood Hurwitz regularization restricts to the punctured filter (nontrivial), so uniqueness identifies the above with zeta_Lean(1). Source Pm ZetaAsymp L401–407, riemannZeta_one L418–422, Hm L402–408 and L420–424.
Three distinct objects, not interchangeable:
  (i) residue of mathematical zeta: 1;
  (ii) Laurent constant of mathematical zeta: gamma;
  (iii) assigned finite value zeta_Lean(1)=(gamma-log(4 pi))/2.
Also E_0(1)=1+(gamma-log(4 pi))/2. The proof of zeta_Lean(1)!=0 uses gamma<2/3<1<log(4 pi), as RUN16. No zero exclusion inside the critical strip follows from the assigned value. This is a prerequisite of the boundary family adapter; no use of the window criterion, no circularity. Preserve 0<theta<1, delta>0 in the original family criterion, and real-pole positivity as separate obligations from RUN9/14/15. Neither theta nor delta occurs in this imported limit.

## 5. Finite exact certificate
Run the following JS with Node. Rational arithmetic with BigInt; integer exponents, not numerical integration or actual zeta evaluations. The toy E and G functions test the regularization algebra including the totalized point and cases where G would be zero (excluded). Tests check finite summation and algebra only; analytic convergence and actual gamma identities depend on the arguments and imported sources above.
~~~js
const certificate = function(){
const ck=(v,m)=>{if(!v)throw Error(m)};
const gcd=(a,b)=>b===0n?(a<0n?-a:a):gcd(b,a%b);
const Q=(a,b=1n)=>{a=BigInt(a);b=BigInt(b);if(!b)throw Error("zero denom");if(b<0n){a=-a;b=-b}let d=gcd(a,b);return [a/d,b/d]};
const add=([a,b],[c,d])=>Q(a*d+b*c,b*d),neg=([a,b])=>[-a,b],sub=(a,b)=>add(a,neg(b)),mul=([a,b],[c,d])=>Q(a*c,b*d),eq=([a,b],[c,d])=>a===c&&b===d,le=([a,b],[c,d])=>a*d<=c*b;
let local=0,partial=0,harmonic=0,reg=0,negative=0;
for(let s=2n;s<=9n;s++){
 let T=Q(0),Z=Q(0);
 for(let n=1n;n<=100n;n++){
 const A=mul(Q(1,s-1n),sub(Q(1,n**(s-1n)),Q(1,(n+1n)**(s-1n))));
 const B=mul(Q(n,s),sub(Q(1,n**s),Q(1,(n+1n)**s)));
 const t=sub(A,B);
 ck(le(Q(1,2n*(n+1n)**(s+1n)),t)&&le(t,Q(1,2n*n**(s+1n))),"term bound");local++;
 T=add(T,t);Z=add(Z,Q(1,n**s));
 let rhs=sub(mul(Q(1,s-1n),sub(Q(1),Q(1,(n+1n)**(s-1n)))),mul(Q(1,s),sub(Z,Q(n,(n+1n)**s))));
 ck(eq(T,rhs),"telescoping");partial++;
 }
}
let H=Q(1),shifted=Q(0);
for(let n=1n;n<=500n;n++){
 H=add(H,Q(1,n+1n));shifted=add(shifted,Q(1,n+1n));
 ck(eq(sub(H,Q(1)),shifted),"harmonic indexing");harmonic++;
}
const div0=(a,b)=>b[0]===0n?Q(0):mul(a,Q(b[1],b[0]));
for(let A=-3n;A<=3n;A++)for(let B=-3n;B<=3n;B++)for(let C of [0n,1n])for(let m=-10n;m<=10n;m++){
 const h=Q(m,16),s=add(Q(1),h),g=add(Q(1),mul(Q(B),h)),E=add(Q(A),h);
 if(!g[0])continue;
 const R=sub(E,div0(Q(C),s));
 const L=add(R,div0(Q(1),h));
 const z=div0(L,g);
 ck(eq(sub(z,div0(div0(Q(1),h),g)),div0(R,g)),"regularization with total division");
 if(m!==0n){
 ck(eq(sub(sub(z,div0(Q(1),h)),div0(R,g)),div0(Q(-B),g)),"Laurent vs total shift");
 }else ck(eq(z,sub(Q(A),Q(C))),"total value");
 reg++;
}
const A=Q(3),B=Q(2),C=Q(1),totalValue=sub(A,C),laurent=sub(totalValue,B);
ck(!eq(totalValue,laurent),"gamma derivative cannot be omitted");negative++;
ck(!eq(A,totalValue),"a=0 subtraction at s=1 cannot be omitted");negative++;
const h=Q(1,2),g=add(Q(1),mul(B,h)),wrong=sub(div0(Q(1),mul(h,g)),div0(Q(1),h));
ck(!eq(wrong,Q(0)),"weighted and unweighted pole not identical");negative++;
return {local,partial,harmonic,reg,negative,total:local+partial+harmonic+reg};
};
console.log(certificate());
~~~
Actual JS execution: {"local":800,"partial":800,"harmonic":500,"reg":2030,"negative":3,"total":4130}.
Negative controls distinguish the gamma derivative correction, the a=0 subtraction and the weighted vs ordinary pole. No independent kernel validation or formalized replacement, no demonstrated URT improvement.

RESUME HERE: reconstruct the underlying real Gamma derivative at 1 and 1/2 in Mathlib/NumberTheory/Harmonic/GammaDeriv.lean (Real.hasDerivAt_Gamma_nat, Real.hasDerivAt_Gamma_one_half), preserving convexity and duplication dependencies and positive-real domain. Then trace completedHurwitzZetaEven_residue_one through WeakFEPair. Request authenticated role-labelled root paths for riemannZeta_one_ne_zero, the two zeta asymptotic limit producers, boundary family adapter and earlier Landau pole/window declarations. Do not infer root reachability from imports. Arithmetic window supplier and full kernel replay remain OPEN.
HANDOFF TO editor, integration, dependencies, kernel, audit, math, prime.
