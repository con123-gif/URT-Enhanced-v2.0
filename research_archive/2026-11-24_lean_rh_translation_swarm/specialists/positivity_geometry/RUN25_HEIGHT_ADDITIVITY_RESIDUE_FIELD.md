# Geometry RUN25 — exact height cancellation and short residue-field proof
2026-11-25. RESULT: DONE locally for source-matched height additivity and scalar invariance; human derivation of pinned quotient predicate. PARTIAL for authenticated Main value-role reachability. No independent Lean replay.
Preflight: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE (including simplicity pivot), EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI #424 (06:33:58Z, pre-existing, not RH validation), RUN24 05db6019, recent 19 peer commit/RESUME listings, Landau and acceleration RUN24. Full historical archive and external blueprint not reopened. No duplicate task found in inspected notes. No physics changes.
## Scope and source provenance
P=40e56bab026552e089d7afcfeff08d2defb9c005, H=a18a350c3e5aad997766cff2670b292313e46574 (latest recent-commit result, unchanged from RUN24). All paths relative to https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/ . Blob IDs from connector, not independently rehashed.
- GaussAbsMulOfMonomialOrder.lean P 8d363364df0cd0599930da7764d2bb841412ec1b / H fd728981b37f83236d3002dd998d7641171d9d32. P/H start lines: coeff_le_gauss_abs 12/18, gauss_abs_le_of_coeff_le 22/28, gauss_abs_attained_at_coeff 30/36, gauss_abs_pos_of_ne_zero 38/44, finite_place_sum_le 44/50 (changed tactic), finite_place_sum_lt 48/54, finite_place_add_eq_of_lt 58/64, gauss_abs_mul_of_monomial_order 69/75 (changed map_add syntax), gauss_abs_mul 143/149. Others equal under whitespace normalization.
- LagrangeIdealLiftsFact.lean P 1586f674027b1674a770363f6219443d927d073f / H b0c97dad00cf4d03e397074c533e04ae7172efc0. gauss_abs_log_support_finite 8/17, isMultiHomogeneous_map_ring 29/38 (changed alternative tactic list), sphere_mean_mul_multihomogeneous 41/45, gauss_height_mul_multihomogeneous 52/56, gauss_height_const_eq_zero 77/81, gauss_height_add_of_sphere 133/137. Others equal.
- AeBlockSphereEvalNeZero.lean P 271ad9f62932087d499dc4dec71a4b416693afe2 / H 3e03412480a8746661591855cf13797944bffcee: ae_blockSphere_eval_ne_zero 219/231 equal.
- SphereLogIntegrableStatement.lean P 887def7b427e78c9afb4dea4f6b074721bed1fd1 / H eb75df21cf29d2aeeae172a559b76b8566cf02f7: h0 39/49 and HeightAdditiveStatement 67/73 equal; heightQuotient P79, HeightQuotientStatement P83 absent in this H file, global removal not established.
- TorusL2CauchyInequality.lean P b2bc60453af78f33f80a1372a91cd356a830b794 / H affdbf1acabdd7d7e65e3b20716c49cc4a5cebc6: gauss_height_additivity 21/1724 equal.
Total 16 equal, 3 changed, 2 absent among 21 named blocks, source text not elaborated equality. H is a comparison only; do not mix hypotheses.
Acceleration RUN24 receipt authenticates manifest candidate IDs 4398915 (Closed.gauss_height_additivity), 4403566 (Closed.sphere_height_lower_bound), 4403544 (heightLowerBound_of_sj_of_sphereLogIntegrable). Typed role paths remain outstanding. Per simplicity pivot, finish this small local cancellation lemma, then pause further expansion of the branch until role evidence or direct relevance to actual third-place Green/TopG route is established. Height additivity alone gives no prime cancellation.
## 1. Finite-place multiplication: exact source argument
K number field, w normalized finite place, f,g nonzero multivariate polynomials. G(f)=max over support of w(f_s)>0. By the ultrametric triangle inequality every coefficient of fg has norm at most G(f)G(g); the finite-sum non-strict inequality is source-imported through Bl.general_b_fact_left_extra.goal1 and follows by finite induction from the ultrametric inequality (including empty sum, M>=0).
Choose the greatest exponent s0 among coefficients attaining G(f), and t0 similarly for g, in the supplied additive injective monomial order m (finite supports give maxima). Consider coefficient u=s0+t0. Every other pair s+t=u has s>s0 or t>t0: equality in one implies equality in the other by cancellation, and if s<s0 then t>t0 by order compatibility with addition. Hence every competing summand has norm strictly less than G(f)G(g); zero coefficients are included. The finite sum of these has strictly smaller norm (positive bound; empty sum also works). For w(y)<w(x), w(x+y)=w(x): apply triangle inequality to x+y and to x=(x+y)-y. Thus the distinguished summand survives without cancellation and w((fg)_u)=G(f)G(g). Together with upper bound this proves equality. For finite variable set source uses a lexicographic monomial order obtained from Fintype.equivFin, so no extra order assumption in gauss_abs_mul.
## 2. Short independent algebraic compression (not a new Lean theorem)
Choose coefficients a,b attaining the positive maxima. Normalize F=f/a, G=g/b. All coefficients lie in valuation ring O_w={x:w(x)<=1}; each polynomial has at least one coefficient 1. Its reduction modulo maximal ideal m_w={x:w(x)<1} is therefore nonzero. The residue field polynomial ring is a domain, so reduction of FG is nonzero; its coefficients all have norm <=1 and some coefficient has norm exactly 1. Consequently G(fg)=w(a)w(b). This replaces the monomial-order/strict-sum argument with residue field domain property, using standard valuation ring and reduction facts. The source proof is preserved above; the alternative imports these extra standard algebraic facts, is not Lean formalized or claimed faster. It also works without discrete valuations. This is a genuine local simplification, not an RH argument.
## 3. Height cancellation
Take B,n natural, degrees a,a' : Fin B -> N, f,g nonzero multihomogeneous on Fin B x Fin n, K number field (HeightAdditiveStatement uses K : Type), n>0 for the combined conclusion. Let d=[K:Q]>0. Define S(f)=finite sum_w log G_w(f), A(f)=sum over ALL complex embeddings of blockSphereMean(map sigma f); h0=(S+A)/d. As RUN24, only finitely many places have any nonzero support coefficient of norm !=1. Outside their union G=1; hence log support finite, including negative logs inside. Multiplicativity gives S(fg)=S(f)+S(g), since finite sums can be expanded on the union of the two finite supports.
For complex F,G nonzero multihomogeneous, source explicitly takes hInt: SphereLogIntegrableStatement. RUN21 a.e. nonvanishing supplies intersection of two full-measure sets. There norm(FG)=norm(F)norm(G)>0 and log of product is sum. Integrability of both log functions (RUN23 supplier) permits integral_add, and a.e. equality permits integral_congr_ae. Do not apply log_mul at zeros: Lean Real.log 0=0. Injectivity of each embedding preserves nonzero and support degrees; mapping commutes with multiplication. Sum over embeddings and divide by d to obtain h0(fg)=h0(f)+h0(g). The source auxiliary multiplication theorem has no n>0 premise; preserve this distinction (n=0 may have zero measure). The combined HeightAdditiveStatement includes n>0.
For c!=0, G_w(C c)=w(c) by singleton support. With n>0 the normalized sphere measure is probability (nonzero toSphere measure), and finite product including B=0 is probability. Thus blockSphereMean(map sigma C c)=log|sigma(c)|. Finite-place product formula and all-embedding norm formula cancel exactly, giving h0(C c)=0. Constant is multihomogeneous of all degrees 0; multiply by f to get h0(C c*f)=h0(f). No sign assumption on h0. Closed.gauss_height_additivity supplies the statement from sphereLogIntegrable; imported normalization, measure theory, product formula and field facts not independently kernel replayed.
## 4. Quotient independence, derived at P (not an identified source supplier)
Pinned HeightQuotientStatement requires n>0, f,g,f',g' nonzero, each multihomogeneous with separately quantified degree arrays a,b,a',b', and fg'=f'g. Then h0(f)+h0(g')=h0(f')+h0(g) by additivity, so h0(f)-h0(g)=h0(f')-h0(g'). No same-degree condition was added. The source definition and predicate were read, not a named proof supplier. This human deduction uses exactly its hypotheses. Quotient height is additive under products and invariant under simultaneous nonzero factors, but this is not positivity of an arbitrary divisor or an intersection theorem. In particular the lower bound for polynomial heights does not imply a lower bound for the difference without an upper bound on the denominator. Even on rational constants no prime cancellation follows. Do not use this as proof of TopG.
## 5. Actual executed regression
V8 exact BigInt integer polynomials (degree <=2 in one variable), p=2,3,5. Counts {"gauss":46128,"dominant":46128,"residue":46128,"quotient":372,"scalar":3720,"negative":3}, total 142479. Dominant case counts include all competing terms checked; quotient and scalar tests are finite-place components only. Negative controls: archimedean maximum coefficient not multiplicative, pointwise Lean log convention at zero, zero polynomial has no finite valuation. Finite tests neither establish general number-field analytic integrability nor prove RH. Extract JS below and run in Node with findLastIndex support.
~~~js
const run=function(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const v=(x,p)=>{if(!x)return Infinity;let k=0;while(x%p===0n){k++;x/=p}return k};
 const mod=(x,p)=>((x%p)+p)%p;
 const norm=(f,p)=>Math.min(...f.map(x=>v(x,p)));
 const mul=(f,g)=>{const r=Array(f.length+g.length-1).fill(0n);for(let i=0;i<f.length;i++)for(let j=0;j<g.length;j++)r[i+j]+=f[i]*g[j];return r};
 const trim=f=>{let r=f.slice();while(r.length&&!r[r.length-1])r.pop();return r};
 const eq=(f,g)=>JSON.stringify(trim(f).map(String))===JSON.stringify(trim(g).map(String));
 const reduce=(f,p)=>{const k=norm(f,p);return f.map(x=>mod(x/p**BigInt(k),p))};
 const counts={gauss:0,dominant:0,residue:0,quotient:0,scalar:0,negative:0};
 const polys=[];for(let a=-2n;a<=2n;a++)for(let b=-2n;b<=2n;b++)for(let c=-2n;c<=2n;c++)if(a||b||c)polys.push([a,b,c]);
 for(const p of [2n,3n,5n]){
  for(const f of polys)for(const g of polys){
   const h=mul(f,g),k=norm(f,p),l=norm(g,p);
   ck(norm(h,p)===k+l,"Gauss valuation");counts.gauss++;
   const i=f.findLastIndex(x=>v(x,p)===k),j=g.findLastIndex(x=>v(x,p)===l);
   ck(v(h[i+j],p)===k+l,"dominant coefficient");
   for(let a=0;a<f.length;a++){const b=i+j-a;if(b>=0&&b<g.length&&(a!==i||b!==j))ck(v(f[a]*g[b],p)>k+l,"strict competing term")}
   counts.dominant++;
   ck(eq(reduce(h,p),mul(reduce(f,p),reduce(g,p)).map(x=>mod(x,p))),"residue product");counts.residue++;
  }
  for(let t=0;t<polys.length;t++){const f=polys[t],g=polys[(t*7+1)%polys.length],r=polys[(t*13+3)%polys.length],F=mul(f,r),G=mul(g,r);
   ck(eq(mul(f,G),mul(F,g)),"cross product");
   ck(norm(f,p)-norm(g,p)===norm(F,p)-norm(G,p),"quotient finite component");counts.quotient++;
   for(let c=-5n;c<=5n;c++)if(c){ck(norm(f.map(x=>c*x),p)===norm(f,p)+v(c,p),"scalar finite component");counts.scalar++}
  }
 }
 ck(Math.max(...mul([1n,1n],[1n,1n]).map(Number))!==1,"archimedean max coefficient not multiplicative");counts.negative++;
 const leanLog=x=>x===0?0:Math.log(x);ck(leanLog(0*2)!==leanLog(0)+leanLog(2),"zero log convention");counts.negative++;
 ck(norm([0n],2n)===Infinity,"zero polynomial invalidates finite valuation");counts.negative++;
 return counts;
};
const counts=run();console.log(JSON.stringify({counts,total:Object.values(counts).reduce((a,b)=>a+b,0)}));
~~~
RESUME HERE: ask shared dependency/kernel/acceleration lane for authenticated Main role path to 4398915 (also 4403566/4403544); if absent, pause this local branch rather than extend unauthenticated manuscript. Follow simplicity pivot: coordinate with Landau RUN24 and literature RUN24 to isolate actual TopG geometric sign/cancellation supplier that is not already assigned; specifically inspect source shape_closed_link_n_of_green's closed_linkIRR_of_join_count input and its geometric inequalities, without duplicating topDesWin transport. Preserve quotient predicate relocation uncertainty. HANDOFF TO geometry, dependency, acceleration, kernel, Landau, literature, editor, audit, integration. Full RH OPEN.
