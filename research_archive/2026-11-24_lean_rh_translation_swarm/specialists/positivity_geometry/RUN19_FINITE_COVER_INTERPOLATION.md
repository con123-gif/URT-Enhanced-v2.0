# Geometry RUN19 — finite-cover interpolation and global denominator identity
2026-11-25. SOURCE-MATCHED human derivation with exact V8 BigInt regression. Local result DONE; RH OPEN. No kernel replay or authenticated root reachability claimed.

## Continuity / source provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol/continuity excerpts, CI #406 (2026-11-25 00:47:27Z, physical tests only), full RUN18 and recent 35 commit titles and available peer handoffs from literature, math, Galois, theta, character boxes, Landau, prime, kernel, acceleration, integration and editor patches. Structure/audit/dependency latest files were scripts; not all peer files or linked external blueprint reopened. No duplicate identified. No physics changes.
Source leanprover-community/riemann-hypothesis; P=40e56bab026552e089d7afcfeff08d2defb9c005; H=b2f365a68500e2bde98cd60a2324263fc62fba10 (merge #1787, 2026-11-25 00:06:45Z), advanced from RUN18. Base src/Development/AbelianVarietyTheory/Proofs/.
- ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean: P blob 10e7d45c32891276ae1ac9121f289e757b4084e0; H blob 3a3500bf3126c4e8e4b2bcd05431feddb754cb88. P L11–58 coefficient/root bounds; L59–87 coefficient descent; L88–120 implicit function; L121–181 separability/root enumeration/product bound; L182 onward main theorem.
- DivisorProofs/ExistsMulEqOfPolynomialGrowth.lean: P blob 820f7247645460d3966ab47e5e15f56fe03f11da; H blob 5979761f966261b7c3ca331f24865167674ac3c5. P L20–44 ring map; L45–99 analytic pullback; L100–112 integral-coordinate growth; L113 onward global identity.
Both revisions retrieved. Whitespace-normalized declaration comparison: 4/11 Toric declarations unchanged, 4/6 Divisor declarations unchanged. Main Toric body changed explicit map_add argument and eval_finset_sum→eval_finsetSum; main Divisor body explicit map_add argument. Root/coeff bound bodies now delegate to GlobalTheory.SimpleRoots suppliers (import NodupRootsOfDerivativeNeZero). Hashes are GitHub-returned blob IDs; not locally recomputed. No claim of elaborated equivalence.
Permalinks:
https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean#L182
https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsMulEqOfPolynomialGrowth.lean#L20

## 1. Exact theorem inputs and outputs
GlobalTheory.FiniteCoverGrowth.integral_and_rational_of_polynomial_growth takes TWO universally quantified imported hypotheses: for every d and nonzero q in R=C[X_1,...,X_d], its nonvanishing locus U is connected AND dense; for every d,m,q,f,C (d,m natural, C real), if q≠0, f is complex differentiable on U and |f(x)|≤C(1+||x||)^m on U, there is g∈R agreeing there. The former is retained although the local proof explicitly ignores it (intro _ hpoly); the latter was reconstructed in RUN17. Given d,m natural, monic p∈R[T], q∈R nonzero with C(q)∈(p,p'), phi:C^d×C→C, C real, let Z={(x,y):x∈U,p_x(y)=0}. For EVERY z∈Z assume an ambient F analytic at z and agreeing with phi eventually in the within-Z neighborhood of z; assume |phi(x,y)|≤C(1+||x||)^m for ALL z∈Z. No global analytic phi assumption, no C>0 or n>0 assumption. Conclusion is conjunction: there exists monic s∈R[T] with s_x(phi(x,y))=0 on Z, AND there exists r∈R[T] with p'_x(y)phi(x,y)=r_x(y) on Z. The theorem does not assert identity at q=0.

## 2. Local root enumeration and analytic descent
Let n=deg p (monic, nonzero), T_x finite set of roots of p_x. Monicity preserves degree. Specialize Bezout then divide by q(x) to obtain coprimality of p_x and p'_x; hence p_x has n distinct roots over C. For x0∈U and a root a, polynomial F(x,y)=p_x(y) is C^1 by finite sums/products of polynomials. Its partial derivative in y is multiplication by p'_{x0}(a)≠0, an invertible complex linear map; the implicit function theorem supplies a differentiable-at-x0 local root y_i. Choose one for each of the n roots. Continuity makes the n roots distinct near x0 (finite intersection of neighborhoods), and degree bounds ensure no further roots. Since U is open, each graph x↦(x,y_i(x)) eventually lies in Z; continuity implies it tends to (x0,y_i(x0)) in the within-Z topology. Pull the assumed analytic extension F_i back along that graph, obtaining differentiable-at-x0 psi_i, with phi(x,y_i(x))=psi_i(x) eventually. No global root labels or global choice of analytic phi are needed; sums/products are independent of permutation. Preserve imported complex implicit-function theorem, derivative uniqueness, root cardinality, within-filter transfer and polynomial differentiation.

## 3. Exact growth estimates
For a coefficient c∈R, induct on polynomial construction: constants use K=|c|,M=0; addition adds K and exponents M; multiplication by X_i increases exponent by 1 (|x_i|≤1+||x||). Cauchy's bound for monic p_x gives |y|≤1+Σ_{i<n}|p_i(x)|≤K0(1+||x||)^M0, with K0=1+Σ K_i and M0=Σ M_i. Retain imported Cauchy-bound theorem. For each fixed t∈C put K=1+|t|+|C|+K0, M=m+M0, B(x)=K(1+||x||)^M≥1. All of |phi(x,y)|, |t-phi(x,y)|, |t-y|≤B(x). A product of ≤k such factors has absolute value ≤B^k. Bounds used by Lean exactly:
 |∏_{y∈T_x}(t-phi(x,y))|≤K^n(1+||x||)^(Mn).
 |Σ_{y∈T_x} phi(x,y)∏_{u∈T_x\{y}}(t-u)|≤n K^(n+1)(1+||x||)^(M(n+1)).
The second is deliberately loose (erase card≤n, then one extra factor). Do not replace it by a tighter exponent as if Lean used it.

## 4. Two fiber polynomials and coefficient globalization
S_x(T)=∏_{y∈T_x}(T-phi(x,y)); roots y are distinct but phi values may repeat. Product indexed by y preserves multiplicity. S_x monic degree n; S_x-T^n has degree<n. For every fixed t, its evaluation is a differentiable function of x on U by the local labels/psi_i and finite products. Polynomial-growth hypothesis gives g_t∈R for the product; subtract t^n. Lemma exists_map_eq_of_eval: for any U and family H_x of degree<N, if for EVERY t there exists g_t∈R representing H_x(t) for ALL x∈U, choose t_i=i (0≤i<N) and put H=Σ_i C(g_i)L_i(T), where L_i is the ordinary complex Lagrange basis at those distinct nodes, mapped to R. Degree<N; specialization gives exactly H_x by interpolation. N=0 gives empty sum and the only degree<0 polynomial is zero. Thus S=T^n+H yields the integral relation.
R_x(T)=Σ_{y∈T_x}phi(x,y)∏_{u∈T_x\{y}}(T-u). It has degree<n+1 (source uses this bound, not n-1); for each fixed t its evaluation differentiable on U by local root enumeration, finite sum and products over erased labels. The second bound invokes the same polynomial-growth hypothesis, then globalization with N=n+1 produces a single r∈R[T], with r_x=R_x for all x∈U. At a root a, terms y≠a vanish since a lies in T_x\{y}; sole term is phi(x,a)∏_{u≠a}(a-u)=p'_x(a)phi(x,a), since p_x is monic nodal polynomial. This is the denominator-free fiber interpolation identity. n=0: p=1, Z empty, both conclusions vacuous with s=1,r=0. No division at repeated roots or on q=0.

## 5. Character extension (GlobalTheory.SerreSections.exists_ringHom_of_denominator)
For commutative rings P,A, ring maps alpha:P→A and e:P→C, q∈P with e(q)≠0, ker alpha⊆ker e, a chosen function r:A→P with alpha(q)b=alpha(r(b)) for every b, define chi(b)=e(r(b))/e(q). If alpha(s)=alpha(s'), then e(s)=e(s') by subtraction and kernel inclusion. For b=alpha(s), alpha(r(b))=alpha(qs), so chi(alpha(s))=e(s); this gives 0,1. Additivity uses alpha(r(a+b))=alpha(r(a)+r(b)); multiplicativity uses alpha(qr(ab))=alpha(r(a)r(b)), hence e(q)e(r(ab))=e(r(a))e(r(b)); divide by e(q)^2. This also proves independence of representative and uniqueness of any extension (corollaries, not separate conclusions in Lean). No domain hypothesis on P or A in this helper.

## 6. Global affine identity, including exceptional locus
Exact exists_mul_eq_of_polynomial_growth hypotheses: scheme Y over Spec C via p, SmoothOfRelativeDimension D p; analytic reading R:AnRead p (id C) D; affine open V with IsDomain A=Gamma(Y,V); phi complex-valued on C-points, R.HoloOn on points in V; natural n,m, u:Fin n→A, C real, |phi(y)|≤C(1+Σ_l|ev_y(u_l)|)^m on those points. Output a,b∈A, b≠0, ev_y(b)phi(y)=ev_y(a) for ALL points in V.
Smoothness gives finite type algebra; RUN18 normalization supplies j:R0→A, primitive a0, monic P, q, Bezout, eval kernel divisibility, common denominator witnesses. Let alpha:P0=R0[T]→A evaluate at a0, e_z:P0→C evaluate at (x,y). On Z, kernel inclusion follows from P|f and P_x(y)=0. Section 5 gives chi_z extending evaluation and respecting complex scalars. Via ofHom obtain point s(z)∈V. If V has no C-points choose numerator 0, denominator 1; otherwise use any point as default outside Z (no property of that default needed). For b∈A evaluation at s(z) is e_z(r_b)/q(x), analytic near each z∈Z. The analytic pullback helper uses basic open localization: on a chart W containing s(z), restrict a chart function to D(h)⊂W∩V and represent it as a/h^k, h nonzero at s(z); continuity of the point map follows from affine coordinate evaluations; pull back analytic F_a/F_h^k. Combine finitely many chart coordinates and compose the holomorphic chart representation of phi; retain imported point topology, chart glue and SCV analytic-from-differentiable theorem.
Every u_l is integral over R0 by finite map j, so its monic equation evaluated under chi_z allows the root bound section 3. Sum bounds to obtain 1+Σ|chi_z(u_l)|≤K(1+||x||)^M, K=1+Σ K_l, M=Σ M_l. Therefore |phi(s(z))|≤|C|K^m(1+||x||)^(Mm). Apply sections 1–4 (with RUN17 supplier), retaining only rational numerator t∈R0[T]. Choose global numerator A0=j(q)alpha(t), denominator B0=j(q)alpha(P'). B0≠0 by RUN18 Bezout and domain. For any point v in V:
- if ev_v(j(q))=0, both ev_v(A0) and ev_v(B0) vanish, so desired identity holds directly, WITHOUT extrapolation from dense locus or division by zero;
- otherwise define x_i=ev_v(j(X_i)), y=ev_v(a0); evaluation factors through e_z, so z∈Z, and chi_z=ev_v by section 5 and nonzero q. Affine point extensionality gives s(z)=v. Multiply finite-cover identity by q(x), yielding ev_v(B0)phi(v)=ev_v(A0).
Do not claim phi is already a regular function from this identity alone; RUN16 pole obstruction and regularity descent are separate. No assertion that B0 never vanishes.

## 7. Executed exact regression
V8 BigInt output: {"fibers":792,"rootIdentity":2772,"integralIdentity":2772,"globalLagrange":5544,"growth":11088,"character":35280,"controls":4}. The finite-cover model is split monic p with distinct integer roots, varying x and shift, phi=y²+x*seed (possibly repeated values), including n=0; evaluate nodal derivatives, integrality, scaled Lagrange identities, and pointwise loose growth bounds. Character model uses P=Z[T], A=Z×Z, alpha evaluation at two distinct integers a,b, q=b-a and representative (b-T)u+(T-a)v. Tests integer-valued maps as a special case of maps into C. Controls repeated roots, repeated phi values, failure of kernel inclusion and exceptional multiplier. These are finite regression checks only, not general analytic proof replay, actual geometry or kernel validation. Save following block to JS and run node.
~~~js
function certificate(){
const ck=(x,m)=>{if(!x)throw Error(m)},abs=x=>x<0n?-x:x, prod=a=>a.reduce((s,t)=>s*t,1n), sum=a=>a.reduce((s,t)=>s+t,0n);
const mul=(a,b)=>{let c=Array(a.length+b.length-1).fill(0n);a.forEach((x,i)=>b.forEach((y,j)=>c[i+j]+=x*y));return c};
const nodal=a=>a.reduce((p,y)=>mul(p,[-y,1n]),[1n]), ev=(a,t)=>a.reduceRight((s,c)=>s*t+c,0n), der=a=>a.slice(1).map((c,i)=>BigInt(i+1)*c);
const add=(a,b)=>Array.from({length:Math.max(a.length,b.length)},(_,i)=>(a[i]||0n)+(b[i]||0n));
let C={fibers:0,rootIdentity:0,integralIdentity:0,globalLagrange:0,growth:0,character:0,controls:0};
for(let n=0;n<=7;n++)for(let x=-5n;x<=5n;x++)for(let seed=-4n;seed<=4n;seed++){
 let Y=Array.from({length:n},(_,i)=>x+BigInt(i)*2n+seed), V=Y.map(y=>y*y+x*seed), p=nodal(Y), s=nodal(V), r=Y.reduce((a,y,i)=>add(a,nodal(Y.filter((_,j)=>j!==i)).map(c=>c*V[i])),[0n]);
 ck(p[n]===1n&&s[n]===1n&&r.length<=Math.max(1,n),"degree");C.fibers++;
 for(let i=0;i<n;i++){ck(ev(p,Y[i])===0n&&ev(der(p),Y[i])!==0n&&ev(r,Y[i])===ev(der(p),Y[i])*V[i],"root");C.rootIdentity++;ck(ev(s,V[i])===0n,"integral");C.integralIdentity++}
 for(let t=-3n;t<=3n;t++){
  let B=1n+abs(t)+sum(Y.map(abs))+sum(V.map(abs));ck(abs(ev(s,t))<=B**BigInt(n)&&abs(ev(r,t))<=BigInt(n)*B**BigInt(n+1),"growth");C.growth+=2;
  let nodes=Array.from({length:n+1},(_,i)=>BigInt(i)),den=nodes.map(i=>prod(nodes.filter(j=>j!==i).map(j=>i-j))),D=prod(den);
  let interp=sum(nodes.map((i,k)=>ev(r,i)*prod(nodes.filter(j=>j!==i).map(j=>t-j))*(D/den[k])));
  ck(interp===D*ev(r,t),"interpolation");C.globalLagrange++;
 }
}
for(let a=-4n;a<=4n;a++)for(let b=-4n;b<=4n;b++)if(a!==b){
 const q=b-a, r=(u,v,t)=>(b-t)*u+(t-a)*v;
 for(let u=-3n;u<=3n;u++)for(let v=-3n;v<=3n;v++)for(let w=-2n;w<=2n;w++)for(const t of [a,b]){
  const chi=(u,v)=>{let z=r(u,v,t);ck(z%q===0n,"integer exact");return z/q};
  ck(chi(u,v)===(t===a?u:v)&&chi(1n,1n)===1n&&chi(0n,0n)===0n&&chi(u+w,v-w)===chi(u,v)+chi(w,-w)&&chi(u*w,-v*w)===chi(u,v)*chi(w,-w),"character");C.character++;
 }
}
ck(ev(der(nodal([0n,0n])),0n)===0n,"repeated root");C.controls++;
ck(nodal([2n,2n]).length===3&&new Set([2n,2n]).size===1,"value multiplicity");C.controls++;
ck(ev(nodal([0n,2n]),1n)!==0n,"kernel not contained");C.controls++;
ck(2n*7n!==2n&&0n*2n*7n===0n*2n,"exceptional multiplier");C.controls++;
return C;
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: reconcile RUN15/RUN16 with the exact regularity consumer of exists_mul_eq_of_polynomial_growth; expand the first not-yet-translated native supplier of the continuous-rational-quotient regularity theorem (including affine prime/pole witness to complex points, not merely the already reconstructed normal-domain algebra). If already covered, trace projective section algebraization and the height comparison consumer. Request authenticated role-labelled root paths for GlobalTheory.FiniteCoverGrowth.integral_and_rational_of_polynomial_growth and GlobalTheory.SerreSections.exists_mul_eq_of_polynomial_growth from dependency/kernel lanes. HANDOFF TO geometry, editor, integration, audit, kernel, dependencies, literature. RH OPEN.
