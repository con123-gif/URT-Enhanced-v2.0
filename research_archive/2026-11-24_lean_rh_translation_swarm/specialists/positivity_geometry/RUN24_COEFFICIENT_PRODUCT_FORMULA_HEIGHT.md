# Geometry RUN24 — coefficient-to-sphere normalization and arithmetic height lower bound
2026-11-25. RESULT: DONE for the local source-matched coefficient, finite-place and height lower-bound chain. PARTIAL for authenticated Main-root reachability and full RH reconstruction. Not independent Lean replay.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, physics CI checkpoint #422 (05:55:54Z), preceding geometry RUN23 (commit 7eeea33eccdc3fb6d86e639da05acef6b54d98f3), and 15 recent peer commit file/RESUME HERE listings. No duplicate coefficient-to-height task identified in those listings. The full historical archive and external blueprint were not reopened this run. No physics queue changes.

## Source provenance
Repo leanprover-community/riemann-hypothesis; P=40e56bab026552e089d7afcfeff08d2defb9c005; H=a18a350c3e5aad997766cff2670b292313e46574, latest returned by recent-commit query (merge PR #2164, batch 14). All paths below relative to src/ReciprocityTheory/SemistableReduction/. Blob IDs from GitHub, not independently rehashed.
- AevalIsWeightedHomogeneous.lean P 5f215af64f8393f056bec769b9eeb05d53c811a3, H dc0425e4c5e898ff8c46c11f576a8b2a1d8e6f5a. eval_mul_of_isMultiHomogeneous P29–40/H36–47 equal; sum_primitiveRoot_pow_mul_inv_pow_eq_ite P41–62/H48–69 equal; exists_torus_coeff_le P63–126/H70–133 differs (including AddMonoidAlgebra.coeff notation).
- LogNormCoeffSubLeBlockSphereLogMean.lean P 805547a6ed14ff4a5cff3cbddbc6cc98153f529f, H 2cece49866d0d0c069a23f86960ed17908179185. harmonic_pred_le_one_add_log P9–19/H20–30 equal; log_norm_coeff_sub_le_blockSphereLogMean P20–72/H31–83 differs; neg_log_norm_coeff_le_finitePlaces P73–118/H84–129 differs; sum_log_norm_embedding_eq P119–130/H130–141 equal.
- SphereLogIntegrableStatement.lean P 887def7b427e78c9afb4dea4f6b074721bed1fd1, H eb75df21cf29d2aeeae172a559b76b8566cf02f7. gaussAbs P35–38/H45–48, h0 P39–42/H49–52, HeightLowerBoundStatement P73–78/H79–84 equal.
- HeightLowerBound.lean P d1cf6b9555a57f2d6318a1e68117e1203980e15e, heightLowerBound_of_sj_of_sphereLogIntegrable P7–31; old path absent at H, declaration relocated to TorusL2CauchyInequality.lean H255–279, equal.
- TorusL2CauchyInequality.lean P b2bc60453af78f33f80a1372a91cd356a830b794, H affdbf1acabdd7d7e65e3b20716c49cc4a5cebc6. sphere_height_lower_bound P23–24/H1726–1727 equal.
Comparison by whitespace-normalized declaration blocks, 9 equal/3 changed, not elaborated equality. Source links: https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/ and https://github.com/leanprover-community/riemann-hypothesis/tree/a18a350c3e5aad997766cff2670b292313e46574/src/ReciprocityTheory/SemistableReduction/ .

## 1. Finite torus witness, no analytic integral needed
For any finite index set I, complex multivariate polynomial g and exponent s, there is z with |z_i|=1 for every i and |c_s|≤|g(z)|. If s is outside the support, c_s=0 and z_i=1 works. Otherwise N=totalDegree(g)+1≥1, and every exponent coordinate d_i of every support monomial (including s) is less than N. Pick a primitive Nth root ζ. For 0≤a,b<N,
  Σ_{k=0}^{N−1}(ζ^a ζ^(−b))^k = N if a=b, and 0 otherwise.
Equal exponents give a constant sum; distinct exponents give a nontrivial Nth root of unity and the geometric-series identity. This includes N=1. Define z(k)_i=ζ^(k_i) and C(k)=Π_i ζ^(−k_i s_i) for k∈{0,…,N−1}^I. Expand the finite sum, reorder, and factor over coordinates:
  Σ_k g(z(k)) C(k)
    = Σ_{d∈supp(g)} c_d Π_i Σ_{j=0}^{N−1} ζ^{j(d_i−s_i)}
    = N^{|I|} c_s.
Since |C(k)|=1, the triangle inequality gives |c_s|≤N^{−|I|}Σ_k|g(z(k))|≤max_k|g(z(k))|. Nonempty finite grid (including empty I) and positive N justify all divisions. This is the same contradiction argument as the source, expressed via the maximum. Degree bound prevents aliasing. The proof does not require finding the maximizing point efficiently or asserting that torus evaluation has O(N) cost.

## 2. Exact sphere correction
Let B,n∈N, n>0, a:Fin B→N, g multihomogeneous of block degrees a_b and c_s≠0. Retain hSJ and hInt as parameters of log_norm_coeff_sub_le_blockSphereLogMean, supplied locally in RUN22–23. Define A=Σ_b a_b. From §1 select z with |g(z)|≥|c_s|>0. Set r=√n>0 and u_(b,j)=z_(b,j)/r. Then Σ_j |u_(b,j)|²=n/r²=1, so u is in the product of unit spheres. Every monomial has total degree A; hence g(z)=r^A g(u), and g(u)≠0. Taking logs is legitimate at both points:
  log|g(u)|=log|g(z)|−(A/2)log n ≥ log|c_s|−(A/2)log n.
RUN23 multiblock Jensen yields
  blockSphereMean(g) ≥ log|g(u)|−(A/2)H_(n−1)
                      ≥ log|c_s|−(A/2)(log n+H_(n−1)).
This intermediate sharper inequality follows directly from the cited premises; it is a human inference, not a separately verified Lean declaration. P harmonic_pred_le_one_add_log uses monotonicity H_(n−1)≤H_n≤1+log n. The latter also follows from comparing each 1/k (k≥2) with integral of 1/x from k−1 to k. As A≥0, this gives the exact source bound
  log|c_s|−Σ_b a_b(log n+1/2) ≤ blockSphereMean(g).
All zero, degree and dimensional conditions retained; B=0 allowed. The n=1 sharper correction is exactly zero.

## 3. Finite places: support and normalization matter
K is a number field, d=[K:Q]>0, f≠0, s∈supp(f), c=f.coeff(s)≠0. For each normalized finite place w, G_w=gaussAbs w f=max_{t∈supp(f)}w(f.coeff t)≥w(c)>0. Use precisely Mathlib's normalization, not unweighted p-adic absolute values on arbitrary K. The finite set T=union over t∈supp(f) of {w:w(f.coeff t)≠1} exists because each nonzero coefficient has finite multiplicative support. Outside T all support coefficient values are 1, so G_w=1 (support nonempty). Thus both log sums are ordinary finite sums over T. NumberField.FinitePlace.prod_eq_inv_abs_norm gives Π_{w∈T}w(c)=|Norm_{K/Q}(c)|^(−1). Taking log and summing monotonicity gives
  −log|Norm(c)| = Σ_{w∈T} log w(c) ≤ Σ_{w∈T} log G_w.
No assumption that each log G_w≥0: G_w may be below 1. No omission of negative finite-place terms. All factors positive; no log-zero issue.

## 4. Archimedean cancellation and complete local lower bound
For every ring embedding σ:K→C, injectivity preserves polynomial support, each block degree, and c≠0. Thus §2 applies to map σ f. The product over ALL complex embeddings, including both conjugate embeddings at a complex place, equals the rational algebraic norm (Algebra.norm_eq_prod_embeddings, RingHom.equivRatAlgHom). Taking complex norms and logs yields Σ_σ log|σ(c)|=log|Norm(c)|. There are d embeddings (NumberField.Embeddings.card). Sum §2 over them:
  Σ_σ blockSphereMean(map σ f) ≥ log|Norm(c)|−d Σ_b a_b(log n+1/2).
Adding §3 cancels log|Norm(c)| exactly. Divide by d>0, using the actual definition
  h0(f)=(Σ^finite_w log G_w+Σ_σ blockSphereMean(map σ f))/d.
Therefore
  h0(f) ≥ −Σ_b a_b(log n+1/2).
The stronger intermediate human bound h0(f)≥−A(log n+H_(n−1))/2 follows by using the sharper §2 bound in the same argument, without changing the source theorem or any downstream premise. Example n=1: f is a single monomial times c; its archimedean mean is log|σ(c)|, its finite contributions sum to the opposite norm log, so h0(f)=0. The source's looser bound still holds.
The actual closed namespace supplier is sphere_height_lower_bound := heightLowerBound_of_sj_of_sphereLogIntegrable sj sphereLogIntegrable, with sj and sphereLogIntegrable supplied by the preceding reconstructed local chain. This completes a local theorem translation under the original NumberField, n>0, f≠0, multihomogeneity hypotheses, not the global arithmetic-intersection argument. Imported primitive-root existence, polynomial support, finite-place product formula, norm/embedding cardinality, and SJ analytic facts remain explicitly cited dependencies, not independently kernel replayed.

## 5. Executed exact regression certificate
Executed in V8 during this run: counts {"rootOrthogonality":208,"coefficientExtraction":118,"normalization":2430,"finitePlaceProducts":83448,"finitePlaceComparison":83448,"harmonicComparison":100,"negativeControls":3}; total 169755 counted cases. The prime-order cyclotomic tests use integer coefficient reduction, not floating roots; finite-place tests are over Q only, not general number fields. Finite tests do not prove complex analytic integrability or a universal theorem; the source-matched human argument above supplies the logical reasoning. Extract the JS below and run in Node. Counts are regression cases, not proof obligations or coverage.
~~~js
const certificate=function () {
 const counts={rootOrthogonality:0,coefficientExtraction:0,normalization:0,finitePlaceProducts:0,finitePlaceComparison:0,harmonicComparison:0,negativeControls:0};
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const gcd=(a,b)=>{a=a<0n?-a:a;b=b<0n?-b:b;while(b)[a,b]=[b,a%b];return a};
 const rat=(a,b=1n)=>{if(b<0n){a=-a;b=-b}const g=gcd(a,b);return [a/g,b/g]};
 const mul=(x,y)=>rat(x[0]*y[0],x[1]*y[1]);const eq=(x,y)=>x[0]*y[1]===y[0]*x[1];const le=(x,y)=>x[0]*y[1]<=y[0]*x[1];const add=(x,y)=>rat(x[0]*y[1]+y[0]*x[1],x[1]*y[1]);
 const mod=(x,n)=>((x%n)+n)%n;
 function orth(N,a,b){const t=Array(N).fill(0);for(let k=0;k<N;k++)t[mod(k*(a-b),N)]++;return t.slice(0,-1).map(x=>x-t[N-1])}
 for(const N of [2,3,5,7,11]){
   for(let a=0;a<N;a++)for(let b=0;b<N;b++){const t=orth(N,a,b);ck(t.every((v,i)=>v===(a===b&&i===0?N:0)),"orthogonality");counts.rootOrthogonality++}
   const terms=[];for(let a=0;a<N;a++)for(let b=0;b<N-a;b++)terms.push([a,b,((a*7+b*11)%9)-4]);
   for(let s=0;s<N;s++)for(let t=0;t<N-s;t++){
     const bins=Array(N).fill(0);
     for(let k=0;k<N;k++)for(let l=0;l<N;l++)for(const [a,b,c] of terms)bins[mod(k*(a-s)+l*(b-t),N)]+=c;
     const c=terms.find(([a,b])=>a===s&&b===t)[2];
     ck(bins.slice(0,-1).every((v,i)=>v-bins[N-1]===(i===0?N*N*c:0)),"Fourier coefficient");counts.coefficientExtraction++;
   }
 }
 for(let n=1;n<=30;n++)for(let a=0;a<=8;a++)for(let b=0;b<=8;b++){
   let sum=rat(0n);for(let i=0;i<n;i++)sum=add(sum,rat(1n,BigInt(n)));
   ck(eq(sum,rat(1n)),"unit norm");
   const nn=BigInt(n),p=BigInt(a+b);ck(eq(mul(rat(nn**p),rat(1n,nn**p)),rat(1n)),"homogeneous scaling");counts.normalization++;
 }
 const abs=a=>a<0n?-a:a;
 function val(a,p){a=abs(a);if(a===0n)throw Error("zero valuation");let k=0;while(a%p===0n){a/=p;k++}return k}
 function pp(p,k){return k>=0?rat(p**BigInt(k)):rat(1n,p**BigInt(-k))}
 for(let d=1n;d<=12n;d++)for(let a=-9n;a<=9n;a++)for(let b=-9n;b<=9n;b++)for(let c=-3n;c<=3n;c++){
   const cs=[a,b,c].filter(x=>x!==0n);if(!cs.length)continue;
   const g=cs.reduce((u,v)=>gcd(u,v),0n);let G=rat(1n),C=cs.map(()=>rat(1n));
   for(const p of [2n,3n,5n,7n,11n]){
     const v=cs.map(x=>val(x,p)-val(d,p));G=mul(G,pp(p,-Math.min(...v)));
     C=C.map((x,i)=>mul(x,pp(p,-v[i])));
   }
   ck(eq(G,rat(d,g)),"Gauss product");
   for(let i=0;i<cs.length;i++){ck(eq(C[i],rat(d,abs(cs[i]))),"product formula");counts.finitePlaceProducts++;ck(le(C[i],G),"Gauss dominates coefficient");ck(le(rat(1n),mul(G,rat(abs(cs[i]),d))),"combined norm lower bound");counts.finitePlaceComparison++}
 }
 let H=rat(0n),L=rat(0n);for(let n=1;n<=100;n++){if(n>1){H=add(H,rat(1n,BigInt(n-1)));L=add(L,rat(1n,BigInt(n)))}ck(le(H,add(rat(1n),L)),"harmonic lower integral comparison");counts.harmonicComparison++}
 ck(orth(3,0,3)[0]===3,"aliasing without degree bound");counts.negativeControls++;
 ck(!eq(rat(2n),rat(1n)),"unnormalized torus squared norm n=2");counts.negativeControls++;
 ck(le(rat(1n),rat(1n,2n))===false,"omitting finite contribution for c=1/2");counts.negativeControls++;
 return counts;
};
const counts=certificate();console.log(JSON.stringify({counts,total:Object.values(counts).reduce((a,b)=>a+b,0)}));
~~~

RESUME HERE: read pinned LagrangeIdealLiftsFact.lean (actual imported path from TorusL2CauchyInequality.lean) and reconstruct gauss_height_add_of_sphere including exact Gauss norm multiplicativity, almost-everywhere log products and scalar invariance; then heightQuotient independence and its downstream use in intersection comparisons. Ask dependencies/kernel/acceleration for cached role-labelled Main paths to sphere_height_lower_bound, heightLowerBound_of_sj_of_sphereLogIntegrable and gauss_height_additivity, not a duplicate raw archive scan. Do not mark root coverage without receipt. Audit the sharper harmonic correction as an optional human strengthening, not a Lean claim. HANDOFF TO geometry, dependencies, kernel, acceleration, integration, editor, audit. Full RH OPEN.
