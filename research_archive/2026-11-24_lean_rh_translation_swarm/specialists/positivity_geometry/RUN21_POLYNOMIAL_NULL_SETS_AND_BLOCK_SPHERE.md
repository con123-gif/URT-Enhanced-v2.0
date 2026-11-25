# Geometry RUN21 — polynomial zero sets, polar transfer and arithmetic height support
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction; finite exact regression executed in V8. Full RH OPEN. Completes RUN20's specific supplier and follows its native sphere-height branch, not a new physical claim.

Continuity: read AGENTS.md, SWARM_PROTOCOL.md, HANDOFF_QUEUE.md, EXPANSION_15_LANES.md, research state/log/protocol/continuity excerpts, CI summary #412 (02:41:39 UTC, physical checks only), RUN20 full note, latest 25 RH commit titles, 14 peers' latest commit handoff excerpts (editor had no explicit RESUME), and integration geometry Row0 note. No duplicate found in inspected notes. Linked external blueprint not reopened. No edits to physical queue.

## 1. Exact provenance
Source leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; H=fcb6eac7534875d32d68030967e2deae6d686151, merge #1853 at 2026-11-25 02:41:16 UTC. H advanced since RUN20. GitHub-returned blob IDs (not independently recomputed):
- [AeBlockSphereEvalNeZero.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/AeBlockSphereEvalNeZero.lean) blob 271ad9f62932087d499dc4dec71a4b416693afe2; H 3e03412480a8746661591855cf13797944bffcee. All 8 top-level declaration blocks compared, 6 equal after whitespace normalization. Changed ae_eval_ne_zero_of_ne_zero_fin uses explicit AddMonoidAlgebra.coeff instead of Polynomial.coeff and removes trailing rfl; ae_toSphere changes measurable_pi_lambda to Measurable.of_eval. Imports/exposure changed. No semantic equivalence or kernel replay claimed.
- P lines / H lines: ae_eval_ne_zero_of_ne_zero_fin 7–54 / 19–66; ae_eval_ne_zero_linear 55–82 / 67–94; eval_blockScale_eq_prod_pow_mul 83–97 / 95–109; blockCoordEquiv 98–101 / 110–113; blockCoordEquiv_apply 102–104 / 114–116; ae_toSphere 105–209 / 117–221; blockSphereMeasure_eq 210–218 / 222–230; ae_blockSphere_eval_ne_zero 219–224 / 231–236.
- [SphereLogIntegrableStatement.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/SphereLogIntegrableStatement.lean), blob 887def7b427e78c9afb4dea4f6b074721bed1fd1, H eb75df21cf29d2aeeae172a559b76b8566cf02f7. Defines sphereProb, blockSphereProb, IsMultiHomogeneous, blockSphereMean, h0, and statement predicates (not proofs).
- [Geometry consumer P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/ExistsNeZeroIsStandardSmoothOfRelativeDimension.lean#L150), blob 8272e270db53df9168851be7f7b8da698651807d, H 42e61eb3acd06bce7f3ff9609358a5a1344f148a. volume_coords_image_zeroSet invokes the first theorem at P L156 / H L430, source excerpt unchanged. Main-root reachability remains unauthenticated for these local declarations.

## 2. Polynomial nonvanishing almost everywhere (the actual induction)
For every natural m, every nonzero f in C[X_0,...,X_{m-1}], Lebesgue/Haar volume on C^m satisfies vol({x:f(x)=0})=0. No degree, homogeneity, smoothness or irreducibility hypothesis. m=0 is a singleton coordinate space and f is a nonzero constant, so the zero set is empty (not a claim that the singleton space has zero mass).
For m+1, the ring equivalence finSuccEquiv writes f as P(Y)=sum_k p_k(S)Y^k over C[S_1,...,S_m]. Since it is injective, P is nonzero. Choose a single k with p_k nonzero (not necessarily leading). The induction hypothesis says p_k(s)≠0 for almost every s. At each such s the coefficient of Y^k of Q_s=Polynomial.map(eval s)P equals p_k(s); hence Q_s is nonzero. Its complex roots are a finite set (including the degree-zero case), of zero volume because complex Haar volume has no atoms. The equality f(Fin.cons y s)=Q_s(y) is the explicit evaluation bridge.
The coordinate splitting e: C^(m+1) ≃ C×C^m is measurable and volume preserving. The event E={(y,s): f(e^{-1}(y,s))≠0} is measurable since evaluation is continuous and the coordinate inverse measurable. Product volume, ae_prod_iff_ae_ae and ae_ae_comm permit the order s then y; retain sigma-finiteness of these Lebesgue measures. The two preceding almost-everywhere statements imply E has full measure in the sense of null complement, even for infinite total mass. Pull back using the quasi-measure-preserving property of e and e^{-1}e=id. This supplies the exact RUN20 geometry lemma without an unproved assertion that a polynomial hypersurface has measure zero.
Imported obligations: empty-variable constant identity, polynomial coefficient extensionality, splitting algebra and evaluation equivalence, volume-preserving finite product decomposition, measurable evaluation, product ae/Fubini commutation, finite root set and nonatomic complex volume. These are named Mathlib suppliers, not newly kernel-checked.

## 3. Haar-coordinate transport
ae_eval_ne_zero_linear assumes V finite-dimensional normed complex vector space, measurable/Borel structure, additive Haar μ, finite index set I and complex linear equivalence L:V≃C^I. Rename variables by a bijection I≃Fin(card I), obtaining nonzero g (rename is injective) and L' with g(L'x)=f(Lx). The pushed measure μ.map L' is absolutely continuous with respect to volume by Haar uniqueness/absolute continuity; L' is continuous and measurable by finite dimension. The preceding null event is thus also null for μ.map L'. Pull it back using ae_map_iff and the evaluation identity. No determinant/Jacobian numerical factor is required, but invertibility and absolute continuity cannot be omitted.

## 4. Exact block homogeneity and polar transfer
For B,n natural, F nonzero in C[X_{bj}], a:Fin B→N, IsMultiHomogeneous a F means every support monomial exponent s has sum_j s(b,j)=a_b for EACH block. Expanding evaluation gives
F((r_b x_bj)_{bj}) = (product_b r_b^{a_b}) F(x).
Indeed the factor for a support monomial is product_b product_j r_b^{s(b,j)}=product_b r_b^{a_b}, independent of s; factor outside the sum. This identity allows zero r_b with the usual power-zero convention; cancellation needs nonzero factors. The map blockCoordEquiv identifies B copies of E=EuclideanSpace C (Fin n) linearly with C^{B×n}.
Write ν=volume_E.toSphere, ρ=volumeIoiPow(finrank_R E−1) (natural subtraction), Z={z on B unit spheres:F(blockPoint z)=0}, and S={x in E^B:F(blockCoordEquiv x)=0}. Both are measurable by continuity. Section 3 implies product volume(S)=0. On nonzero blocks use polar coordinates x_b=r_b z_b, r_b=||x_b||>0, and the source measure-preserving polar homeomorphism (restricted domain) and finite product regrouping equivalence. If z lies in Z, then x lies in S by the exact scale identity. Hence the preimage of Z×all radii lies inside the preimage of S under the inclusion G of nonzero blocks. The measure of that latter preimage is zero: pushforward of the blockwise restricted/comap volume is product of volume restricted to E\{0}, equal to the restriction of product volume, which is bounded above by product volume. Thus
0 = (product ν)(Z) · (product ρ)(all radii).
The radial mass cannot be zero: putting d=finrank_R E−1 (natural subtraction), the interval 0<r<1 has mass 1/(d+1)>0 by volumeIoiPow_apply_Iio. The finite product of nonzero extended nonnegative masses is nonzero, even if infinite; B=0 gives empty product 1. The ENNReal zero-product implication forces (product ν)(Z)=0. No division by an infinite radial volume. The proof uses sigma-finiteness of ρ and finite measure ν, all polar/product maps, measurable restrictions and monotonicity exactly as in Lean.
Finally sphereProb is conditional ν on the full sphere, and blockSphereProb=((ν univ)^(-1))^B • product ν (blockSphereMeasure_eq). Absolute continuity of scaled measures transfers the null set. No n>0 premise in these theorems: n=0,B>0 gives empty sphere space/zero measure, B=0 gives singleton empty product. The source explicitly uses IsZeroOrProbabilityMeasure rather than asserting probability for every n. Do not add n>0 here; later arithmetic height statements do require it.

## 5. Relevance and limits
The arithmetic height h0 is the number-field-degree-normalized sum of finite-place log Gauss norms and complex embedding block-sphere log means. This nonvanishing result supplies a.e. legitimacy of log-product identities but is NOT log-integrability: a nonzero measurable function may have nonintegrable log (e.g. exp(−1/x) on 0<x<1). SphereLogIntegrableStatement and HeightLowerBoundStatement remain explicit obligations. The declared latter bound is −sum_b a_b(log n+1/2) ≤ h0(f) for n>0, nonzero multihomogeneous number-field polynomial; it is a statement predicate here, not a theorem established by this run. Also no claim that local geometry source calls are on the authenticated Main value dependency chain.

## 6. Reproducible regression
Exact finite regression executed in V8: {"nonzeroConstants":8,"coefficientSlices":6543,"evaluationIdentities":58887,"nonzeroSlices":5871,"rootBounds":6351,"exceptionalBounds":727,"blockScaling":10000,"nonzeroScaleEquivalence":6400,"radialPositivity":33,"controls":5}. Save JS below and run with node (uses findLastIndex). The finite Gaussian-integer grid exercises the actual coefficient extraction, exceptional specialization bound, root count, evaluation commutation, blockwise factorization including zero exponents, and nonzero-scale equivalence. Radial positivity checks the integer denominator only; not an integration test. Five controls test nonhomogeneous radial propagation, zero radius cancellation, atomic measure, zero polynomial and exceptional specialization. No finite grid certifies a Lebesgue-null theorem or Lean kernel.
~~~js
function certificate(){
 const C={nonzeroConstants:0,coefficientSlices:0,evaluationIdentities:0,nonzeroSlices:0,rootBounds:0,exceptionalBounds:0,blockScaling:0,nonzeroScaleEquivalence:0,radialPositivity:0,controls:0};
 const ck=(b,m)=>{if(!b)throw Error(m)}, Z=[0n,0n],O=[1n,0n],add=(a,b)=>[a[0]+b[0],a[1]+b[1]],mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]],eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],pow=(a,n)=>{let r=O;for(let i=0;i<n;i++)r=mul(r,a);return r},sum=a=>a.reduce(add,Z),evalP=(a,z)=>a.reduceRight((r,c)=>add(mul(r,z),c),Z);
 const G=[];for(let a=-1n;a<=1n;a++)for(let b=-1n;b<=1n;b++)G.push([a,b]);
 for(const c of G)if(!eq(c,Z)){ck(!eq(evalP([c],Z),Z),"zero-variable constant");C.nonzeroConstants++}
 for(let code=1;code<729;code++){
   let t=code,co=[];for(let i=0;i<6;i++){co.push([BigInt(t%3)-1n,0n]);t=Math.floor(t/3)}
   if(co.every(c=>eq(c,Z)))continue;
   let rows=[co.slice(0,3),co.slice(3,6)],k=rows.findIndex(row=>row.some(c=>!eq(c,Z)));
   let d=rows[k].findLastIndex(c=>!eq(c,Z)),bad=0;
   for(const s of G){
     const q=rows.map(row=>evalP(row,s)),good=!eq(q[k],Z);
     if(!good)bad++;
     if(good){ck(q.some(c=>!eq(c,Z)),"coefficient survives");C.nonzeroSlices++}
     C.coefficientSlices++;
     let roots=0;
     for(const y of G){
       let direct=sum(co.map((c,i)=>mul(c,mul(pow(y,Math.floor(i/3)),pow(s,i%3)))));
       ck(eq(evalP(q,y),direct),"specialized evaluation");C.evaluationIdentities++;
       if(eq(direct,Z))roots++;
     }
     if(q.some(c=>!eq(c,Z))){ck(roots<=q.findLastIndex(c=>!eq(c,Z)),"finite-root bound");C.rootBounds++}
   }
   ck(bad<=d,"exceptional coefficient roots");C.exceptionalBounds++;
 }
 const pts=[[O,Z],[Z,O],[O,[0n,1n]],[[0n,1n],O],[Z,Z]],sc=[Z,O,[-1n,0n],[0n,1n],[2n,0n]];
 for(let a=0;a<=3;a++)for(let b=0;b<=3;b++)for(const x of pts)for(const y of pts)for(const r of sc)for(const s of sc){
   const F=(u,v)=>add(mul(pow(u[0],a),pow(v[1],b)),mul([1n,1n],mul(pow(u[1],a),pow(v[0],b))));
   let p=F(x,y),q=F(x.map(z=>mul(r,z)),y.map(z=>mul(s,z))),factor=mul(pow(r,a),pow(s,b));
   ck(eq(q,mul(factor,p)),"multihomogeneous scale");C.blockScaling++;
   if(!eq(r,Z)&&!eq(s,Z)){ck(eq(q,Z)===eq(p,Z),"zero equivalence");C.nonzeroScaleEquivalence++}
 }
 for(let n=0;n<=32;n++){let d=Math.max(0,2*n-1);ck(d+1>0,"radial interval mass 1/(d+1)>0");C.radialPositivity++}
 ck(eq(evalP([[-1n,0n],O],O),Z)&&!eq(evalP([[-1n,0n],O],[2n,0n]),Z),"nonhomogeneous radial control");C.controls++;
 ck(eq(mul(Z,O),Z)&&!eq(O,Z),"zero radius cannot cancel");C.controls++;
 ck(eq(evalP([Z,O],Z),Z),"atomic measure at root");C.controls++;
 ck([Z,Z].every(c=>eq(c,Z)),"zero polynomial exclusion");C.controls++;
 ck(eq(evalP([Z,O],Z),Z)&&eq(evalP([Z,Z],O),Z),"bad specialization control");C.controls++;
 return C;
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: locate the actual proved supplier of SphereLogIntegrableStatement and then HeightLowerBoundStatement (not their definitions) in the pinned ReciprocityTheory/SemistableReduction modules, reconstruct the single-block Jensen/log integrability step with all premises and exact harmonic correction; if root-linked height consumer becomes available prioritize it. Request authenticated Main-root role paths for ae_eval_ne_zero_of_ne_zero_fin and ae_blockSphere_eval_ne_zero and the RUN20 density consumer. HANDOFF TO geometry, literature, dependencies, kernel, integration, editor, audit. No kernel replay, full RH translation or demonstrated URT speedup.
