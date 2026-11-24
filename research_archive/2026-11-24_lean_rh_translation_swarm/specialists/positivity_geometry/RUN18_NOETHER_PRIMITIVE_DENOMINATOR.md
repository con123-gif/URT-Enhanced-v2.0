# Geometry RUN18 — Noether normalization and simultaneous discriminant denominator
2026-11-24. SOURCE-MATCHED human reconstruction; exact finite regression executed in V8 BigInt. RH OPEN. Neither kernel replay, root reachability nor URT speedup established.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, initial state/log/protocol/continuity excerpts, CI #403 (23:49:53Z, physics only), RUN17 full handoff, 30 recent commit titles, recent literature, character-box, Galois and integration RESUME HERE notes. Other peer full notes and external blueprint not reopened; no duplicate apparent in inspected material. No changes to physics.
Source repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; H=67c00ce1025a73f81a39533ac42deb47f15c4a15 (merge #1410, 2026-11-24 23:45:51Z; advanced since RUN17 H=9282d3a102c4aff0e6026746db2a8990f5d9cddd).
Base src/Development/AbelianVarietyTheory/Proofs/.
- ToricGeometry/ExistsPrimitiveElementDiscriminantMultiple.lean: P bf8c8d866c3dfba43b74d7168b6a47d61fbb8212; H ba1c37719e90799c06be78219afeee9cc34ea537. Directly inspected both versions. Four core declaration bodies (exists_map_eq_C_mul, exists_primitive_element_discriminant_multiple, exists_primitive, noetherNormalization_primitive) visibly retained; exists_C_mem_span adds explicit map_add argument; exists_common_denominator wrapper replaced by alias. H clumps Imports into same file, whose common-denominator supplier also adds explicit map_add argument. This is textual inspection, not proof of elaborated equivalence. Hashes are GitHub-returned blob IDs, not locally recomputed.
- ToricGeometry/Imports.lean P f06cc950366c35ad776abc59144512fd776fd70e: actual GlobalTheory.CommonDenominatorForFinset.exists_common_denominator supplier.
- DivisorProofs/ExistsMulEqOfPolynomialGrowth.lean P 820f7247645460d3966ab47e5e15f56fe03f11da, L123 actual consumer; L130–145 constructs fiber characters and nonzero denominator; L155–168 calls finite-cover analytic growth.
- ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean P 10e7d45c32891276ae1ac9121f289e757b4084e0, L182–222 uses monicity, Bezout and nonzero q to obtain separable fibers and local analytic roots. Latest H caller bodies not compared in this run.
Source permalink https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/ToricGeometry/ExistsPrimitiveElementDiscriminantMultiple.lean

## 1. Exact conclusion (noetherNormalization_primitive)
For every Type A with CommRing, IsDomain, Algebra C A and Algebra.FiniteType C A, there exist natural d, C-algebra hom j:R=C[X_1,...,X_d]→A, a∈A, p∈R[T], q∈R such that:
(i) ringKrullDim A=d; (ii) j injective; (iii) j.toRingHom.Finite; (iv) p monic; (v) p irreducible; (vi) for ALL r∈R[T], eval₂(j,a,r)=0 iff p divides r; (vii) q≠0; (viii) C(q)∈(p,p'); (ix) for ALL b∈A there exists r∈R[T] such that j(q)b=eval₂(j,a,r).
Here C(q) means the constant polynomial in T, not the field of complex numbers. There is one common q BEFORE the universal b, not a separate denominator for each b. The statement does not assert q is exactly the discriminant or its minimal multiple.

## 2. Clearing coefficients and the separability ideal
GlobalTheory.NoetherPrimitive.exists_map_eq_C_mul: R commutative domain, K field with R-algebra and IsFractionRing R K. Given f∈K[T], choose nonzero denominators of its finitely many coefficients, multiply them to obtain s∈R nonzero. Then g=sf∈R[T], under the injective coefficient map. Source uses integerNormalization_spec; retain its imported localization proof.
exists_C_mem_span retains those hypotheses and assumes p∈R[T] separable AFTER mapping to K[T]. By definition of separable, u p+v p'=1 in K[T]. Choose s,t≠0 with U=su,V=tv in R[T]. Multiply Bezout by st:
  (tU)p+(sV)p'=st.
Injectivity of coefficient map and compatibility with derivative descend equality to R[T]. Thus q2=st≠0 and C(q2)∈(p,p'). No choice of a resultant, square root or monic p is necessary in this lemma.

## 3. One denominator for an entire finite module
GlobalTheory.CommonDenominatorForFinset.exists_common_denominator: R commutative domain, A commutative R-algebra finite as R-module (A need not be a domain here), a∈A, assume for EVERY b there exist s_b≠0 in R and r_b∈R[T] with s_b b=r_b(a). Let S finite spanning set for A. Put q1=product of s_b over b∈S, which is nonzero (empty product 1 allowed). For each generator b, q1/s_b denotes the product of the remaining factors, an element of R, not a division operation in A. Then q1 b=((q1/s_b)r_b)(a).
The set N={b∈A : exists r, q1 b=r(a)} is an R-submodule: 0 uses polynomial 0, addition uses r+r', scalar multiplication c uses C(c)r. It contains S and hence span S=A. Thus the SAME q1 works for every b. This is exactly the imported supplier's proof; the pinned NoetherPrimitive wrapper delegates to it. Finiteness cannot be dropped in general: for Z⊂Q and a=0 every individual rational clears, but any fixed nonzero s fails on b=1/(2s).

## 4. Primitive field element and simultaneous q
Precise general hypotheses of exists_primitive_element_discriminant_multiple:
R commutative integrally closed domain; A commutative domain, R-algebra with faithful scalar multiplication and finite R-module; K field, char zero, R-algebra and fraction field of R; L field with A-algebra and fraction field of A, K-algebra, R-algebra and compatible scalar towers R→K→L and R→A→L.
The source infers L is localization of A at images of R nonzero elements; K→L is module-finite by localization. Preserve these imported facts. Intuition for localization: A⊗_R K is a finite-dimensional domain over K and therefore a field, so equals Frac A. Char zero makes L/K separable; primitive element theorem gives α∈L with L=K(α)=K[α]. Localization writes α=a/t with a∈A, nonzero t∈R; thus also L=K[a]. Finite module implies a integral over R.
For each b∈A, choose f∈K[T] with b=f(α). Substitute α=a/t to get g(T)=f(T/t), so b=g(a). Section 2 clears its coefficients with s≠0, giving polynomial G∈R[T] and sb=G(a); injection A→L descends identity. Section 3 produces uniform q1.
Let p=minpoly_R(a). Integral closedness and integrality identify its coefficient extension with minpoly_K(a) in L. Char zero implies separable, so section 2 gives q2. Take q=q2 q1. Because R is a domain, q≠0; because (p,p') is an ideal, C(q)∈(p,p'); for every b with q1 b=r(a), q b=(C(q2)r)(a). This is the exact product in Lean. Do not identify the primitive field generator with an integral ring generator: for A=Z[sqrt2], a=2sqrt2, Q(a)=Q(sqrt2) but sqrt2 not in Z[a].
The exists_primitive wrapper specializes K,L to FractionRing R, FractionRing A using FractionRing.liftAlgebra; char zero R supplies char zero K.

## 5. Noether normalization assembly, and why q matters downstream
Apply exists_finite_inj_algHom_of_fg C A to get d,j injective, finite. Interpret j as R-algebra structure on A; finiteness supplies Module.Finite, injectivity FaithfulSMul. Polynomial ring over C is integrally closed domain of char zero. Section 4 gives a,q. Integrality supplies p monic and irreducible, and minpoly.isIntegrallyClosed_dvd_iff supplies exact evaluation kernel p | r. Dimension equality follows from integral injective extension plus Krull dimension of d-variable polynomial ring over field. Preserve imported suppliers: Noether normalization existence, polynomial ring integral closedness, minpoly divisibility and dimension theorems (ReciprocityTheory.CA.ringKrullDim_eq_of_isIntegral_of_injective, MvPolynomial.ringKrullDim_of_isNoetherianRing, ringKrullDim_eq_zero_of_field). No proof bodies of these imports replayed here.
Consequence, explicitly labelled mathematical corollary: A[1/j(q)] ≅ R[1/q][T]/(p); map surjective by uniform denominator, injective by localized kernel p and injection of A into its localization. For complex x with q(x)≠0, specialized p_x remains monic with same degree; evaluating Bezout gives q(x)=U_x p_x+V_x p'_x. Hence p_x and derivative share no root; any y with p_x(y)=0 satisfies p'_x(y)≠0. In particular p_x has exactly deg p distinct complex roots. The caller defines Z={(x,y):q(x)≠0,p_x(y)=0}. A character A→C at such a pair necessarily sends b to r_b(x,y)/q(x); independence of witness follows by subtracting two r_b and using p | difference. The precise Lean character-construction helper exists_ringHom_of_denominator remains a separate supplier to expand.
The caller's chosen nonzero denominator is B=j(q) p'(a), NOT q alone. Since j(q)≠0, enough to show p'(a)≠0. Evaluating C(q)=U p+V p' at a yields j(q)=V(a)p'(a), so nonzero. This reproduces L140–145 and connects to RUN17 analytic finite cover. There is no claim that every point has q≠0; excluded points must be handled by the caller's separate argument.

## 6. Executed certificate
V8 BigInt result: {"bezoutCoefficients":1296,"generatorWitnesses":1008,"commonDenominatorCoordinates":21168,"combinedCoordinates":21168,"evaluationKernelChecks":6048,"finiteFieldSimpleRoots":949,"controls":4}.
Model R=Z, A=Z[theta], theta^n=D for prime D (Eisenstein; degree 1 allowed), a=k theta; p=T^n-k^n D. For generators theta^i denominators k^i; q1 product; Bezout T p' - n p=n k^n D=q2. Tests use exact integral coordinates and polynomial reduction, plus finite-field specialization for nonvanishing q. These are algebraic finite models, NOT tests of complex geometry, general Noether normalization, Mathlib or kernel validity. Counts are individual assertions, not independent theorem proofs. Save following block to JS and run node.
~~~js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)}, pw=(x,n)=>x**BigInt(n);
 let C={bezoutCoefficients:0,generatorWitnesses:0,commonDenominatorCoordinates:0,combinedCoordinates:0,evaluationKernelChecks:0,finiteFieldSimpleRoots:0,controls:0};
 for(let n=1;n<=6;n++)for(const D of [2,3,5,7,11,13])for(let k=1n;k<=8n;k++){
  const d=BigInt(D), h=pw(k,n)*d,q1=pw(k,n*(n-1)/2),q2=BigInt(n)*h,q=q1*q2;
  for(let i=0;i<=n;i++){let p=i===n?1n:i===0?-h:0n;let tp=i===n?BigInt(n):0n;ck(tp-BigInt(n)*p===(i===0?q2:0n),"Bezout");C.bezoutCoefficients++}
  for(let i=0;i<n;i++){let s=pw(k,i);ck(q1%s===0n&&(q1/s)*s===q1,"generator");C.generatorWitnesses++}
  for(let seed=-10;seed<=10;seed++){
   let b=Array.from({length:n},(_,i)=>BigInt(((seed*17+i*11)%19)-9));
   for(let i=0;i<n;i++){let s=pw(k,i),r=b[i]*(q1/s);ck(r*s===q1*b[i],"common");C.commonDenominatorCoordinates++;ck(q2*r*s===q*b[i],"combined");C.combinedCoordinates++}
   let f=Array.from({length:2*n+1},(_,i)=>BigInt((seed*13+i*5)%17));
   if(seed%3===0){let g=f.slice(0,n+1);f=Array(2*n+1).fill(0n);for(let i=0;i<g.length;i++){f[i+n]+=g[i];f[i]-=h*g[i]}}
   let rem=f.slice();for(let i=rem.length-1;i>=n;i--){rem[i-n]+=h*rem[i];rem[i]=0n}
   let ev=Array(n).fill(0n);for(let i=0;i<f.length;i++)ev[i%n]+=f[i]*pw(k,i)*pw(d,Math.floor(i/n));
   ck(ev.every((x,i)=>x===rem[i]*pw(k,i))&&ev.every(x=>x===0n)===rem.every(x=>x===0n),"kernel");C.evaluationKernelChecks++;
  }
  for(const l of [3n,5n,7n,11n,13n,17n])if(q%l!==0n)for(let x=0n;x<l;x++)if((pw(x,n)-h)%l===0n){ck((BigInt(n)*pw(x,n-1))%l!==0n,"simple root");C.finiteFieldSimpleRoots++}
 }
 // p=T²-2: q1=1 clears all generators, but p and p' share root 0 mod 2.
 ck((-2n)%2n===0n&&0n%2n===0n&&1n%2n!==0n,"q1 alone insufficient");C.controls++;
 // Z[theta], a=2theta: theta cannot be an integer polynomial in a.
 ck(1n%2n!==0n,"primitive field generator not integral ring generator");C.controls++;
 // F_3(X)[T], T^3-X is inseparable: all derivative coefficients vanish mod 3.
 ck(3n%3n===0n,"inseparability control");C.controls++;
 // Z subset Q, a=0: for any nonzero integer s, b=1/(2s) defeats uniform clearing.
 for(let s=1n;s<=25n;s++)ck(s%(2n*s)!==0n,"nonfinite denominator");C.controls++;
 return C
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: expand exists_ringHom_of_denominator (actual caller ExistsMulEqOfPolynomialGrowth L132–135) and the finite-cover root interpolation identity in IntegralAndRationalOfPolynomialGrowth L182 onward, particularly p'_x(y) phi(x,y)=r_x(y), all local analyticity and growth premises, and treatment of q=0. Trace native source suppliers for Noether normalization and minpoly divisibility as separate open leaves; request authenticated role-labelled root paths for noetherNormalization_primitive and the GAGA consumer. HANDOFF TO geometry, editor, integration, kernel, dependencies, audit, literature. Project OPEN.
