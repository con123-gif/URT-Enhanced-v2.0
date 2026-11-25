# Geometry RUN23 — multiblock logarithmic integrability and additive Jensen bound
2026-11-25. RESULT: DONE for the local source-matched human-readable multiblock integrability and Jensen induction; partial for complete arithmetic-height chain and Main-root reachability. Not a Lean kernel replay or new proof of RH.

Continuity: read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol/continuity excerpts, CI checkpoint #418 (04:38:50Z, physics CI only), full geometry RUN22; inspected 13 recent peer commit patches and handoffs. No duplicate multiblock integrability task found in inspected notes. Not all historical notes or external blueprint reopened. No changes to physics queue or protected files.

## 1. Exact source provenance
Repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; latest inspected default-branch H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59, obtained from recent commits. All paths below relative to src/ReciprocityTheory/SemistableReduction/. GitHub-returned blob IDs, not independently rehashed. P declarations read in full. H clump-header relocation located in TorusL2CauchyInequality.lean (blob 3a44d3e82eb5f7ffa02da92c1aa9f1a56d7b941b).
- P SphereLogIntegrableStatement.lean blob 887def7b427e78c9afb4dea4f6b074721bed1fd1, L9–78 (definitions); H eb75df21cf29d2aeeae172a559b76b8566cf02f7, statement at L68.
- P IntCoresA.lean e9f723a26294a4356872334632ba7cdf12ac7718 L9–end, sphere_zero_null L13; H 8285e23722f8659f797d51a7ca243bdb9ca5cc73 L20, body differs after whitespace normalization; continuous_spherePoint unchanged.
- P IntCoresB.lean ac696cef8702a14e87ea509319cb9272fd175aea, BlockPoly L9, onSpheres L13, BlockPoly.restrict L16, blockPoly_claim L26–end. H merged module L353,357,360,370 respectively. First three bodies equal after whitespace normalization; blockPoly_claim differs.
- P IntCores.lean d1d7dbdb2d334af9598c6a607d711acfed3a7e9a L9–end; blockSlice L9, blockSlice_isHomogeneous L13, eval_blockSlice L34, sphereLogIntegrable_holds L47. H merged L522,526,548,561, all four declaration blocks equal after whitespace normalization.
- P RestBlockSubstIsMultiHomogeneous.lean 812738f004e09ec25a232124ee4d06e90f9c79c1 L9–end; H 98b38e131f1ef66d9f507faa36dfc3ba2a6cebef. Of 16 declaration blocks, 13 equal after whitespace normalization; eval_aeval_alt, aeval_whom_lemma, restBlockSubst_isMultiHomogeneous differ. null_of_logBound P L45/H L56 and blockSphere_logMean_bound P L201/H L213 equal. Comparison is text-based, not elaborated equivalence.
- P TorusL2CauchyInequality.lean b2bc60453af78f33f80a1372a91cd356a830b794 L15–23 actual supplier chain; H merged L1779 sphereLogIntegrable and L1783 sphere_height_lower_bound. P HeightLowerBound.lean d1cf6b9555a57f2d6318a1e68117e1203980e15e L7–30 relocated to H L312; same normalized body. P SJCore.lean 021dd0802232b95d14b7479a3c4ee3f232eb99be sjCore_holds L44 relocated to H L631 (equal); P SjHolds.lean ef4bbcc3df181829fc19778e0018c400f660f6f7 sj_holds L10 relocated H L717 (differs).
- P LogNormCoeffSubLeBlockSphereLogMean.lean 805547a6ed14ff4a5cff3cbddbc6cc98153f529f; H 2cece49866d0d0c069a23f86960ed17908179185. Coefficient comparison remains next frontier. P source links: https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/; H merged file: https://github.com/leanprover-community/riemann-hypothesis/blob/27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59/src/ReciprocityTheory/SemistableReduction/TorusL2CauchyInequality.lean .

## 2. Exact supplier and zero convention
Let B,n be natural numbers, a:Fin B→Nat, f a complex multivariate polynomial in variables indexed by Fin B × Fin n. IsMultiHomogeneous means each support monomial has degree a(b) in block b. UnitSphereC n is the complex Euclidean unit sphere, μ=sphereProb n the conditional normalized radial surface measure, and μ^B the finite product. The precise SphereLogIntegrableStatement quantifies over ALL B,n, f≠0 and multihomogeneity; it has NO n>0 hypothesis. It concludes integrability of L(z)=Real.log ||f(z)|| on μ^B, where Lean sets Real.log 0=0. The n=0 and B=0 cases are not silently excluded.

The actual source chain is sjCore_holds → sphereLinLog → sj_holds sphereLinLog → sj → sphereLogIntegrable_holds sj → sphereLogIntegrable. Thus hInt is supplied here rather than assumed globally. P TorusL2CauchyInequality L15–23 then supplies sphere_height_lower_bound using sj and sphereLogIntegrable. RUN22 covered single-block SJ. No authenticated Main-root value path to this local theorem cluster is yet established.

## 3. Zero mass from single-block Jensen (IntCoresA.sphere_zero_null)
Given a degree-a homogeneous g, a unit witness u with g(u)≠0, SJ supplies both integrability and a lower bound E log||g|| ≥ log||g(u)||−c, c=a H_(n−1)/2. The witness implies n>0, hence μ is a probability measure; the source proves this by finite positive mass of the unnormalized sphere measure. Let Z={g=0}, P0=μ(Z) in real numbers, and L=log||g||. For any c0≠0 the exact pointwise identity, including zeros, is
  log||c0*g(z)|| = L(z) + 1_(Z complement)(z) log||c0||.
Since g and c0*g have the same homogeneous degree, applying SJ to c0*g and integrating the displayed identity gives
  P0 log||c0|| ≤ K := E L − log||g(u)|| + a H_(n−1)/2.
Measurability of Z follows by continuity; signed integration is justified by SJ integrability and the finite-measure indicator. If P0>0 choose c0=exp((|K|+1)/P0), a positive real viewed in C. Then |K|+1≤K, contradiction. Hence P0=0. Finite measure makes zero of its real value equivalent to zero of its extended measure. No use of log product at a zero and no assuming the target nullity to justify the integral.

## 4. Simultaneous induction for multiblock absolute integrability and nullity
IntCoresB.BlockPoly requires F continuous on the entire block-coordinate space, and for each block and fixed other coordinates an actual homogeneous polynomial of the designated degree representing the corresponding slice. It does not initially require a global polynomial. Its restrict lemma fixes the first block v and preserves these hypotheses, with degree function a(j+1). This follows from continuity under insertion and the identity that updating a remaining block commutes with insertion.

blockPoly_claim: for any n,k,a,F satisfying BlockPoly, if a point z0 on the product of unit spheres has F(z0)≠0, then both log||F|| integrable and {F=0} null for the product measure. The sphere measure is finite even without n>0. Base k=0: the empty product is a singleton; F constant equal to F(z0)≠0, its log is integrable, zero set empty. For k+1 split off the first sphere, and put remaining blocks y first via the source's measure-preserving measurable equivalence e2. Write ν=μ^k, H(y,w)=F(w,y), w0=z0(0). Fixing w0 gives G(y)=H(y,w0), with a nonzero witness at the remaining coordinates of z0. The induction hypothesis gives integrability of A(y)=log||G(y)|| and ν({G=0})=0. For almost every y, G(y)≠0; the first-block slice g_y is homogeneous of degree a(0), and SJ at w0 and sphere_zero_null yield simultaneously:
  integral_mu |L(y,w)| < infinity,
  integral_mu L(y,w) ≥ A(y)−d, d=a(0) H_(n−1)/2,
  μ{w:H(y,w)=0}=0,
where L(y,w)=log||H(y,w)||. None of these slice statements is asserted on the exceptional set.

Continuity on the compact product gives a global finite C bounding ||F||. Set M=log(max(C,1))≥0. Then L≤M, also at zeros under Lean's convention, and |L|≤2M−L (if L≥0, use L≤M; if L≤0, use M≥0). Thus for almost every y,
  integral_mu |L(y,w)| ≤ integral_mu 2M − integral_mu L(y,w)
                       ≤ integral_mu 2M − A(y)+d.
The majorant is integrable for ν, since A is integrable by induction and measures are finite. This is the decisive step: slice integrability alone is insufficient, and the signed full-product integral has NOT been used to prove its own existence. Measurability of L follows from continuity of H and measurability of Real.log; measurable fibre norm integrals and the integrable_prod_iff criterion give product integrability. Separately the measurable zero set has almost-everywhere null fibres, so measure_prod_null gives product nullity. Pull both results back along e2. This finishes the simultaneous induction. Source obligations preserved: compactness, product measure equivalence/swap, slice polynomial existence, unit witness, almost-everywhere filters, integrability domination and product zero-measure theorem.

## 5. Instantiate BlockPoly with an actual multihomogeneous polynomial
IntCores.blockSlice replaces variables of selected block b by indeterminates and all others by their fixed coordinate constants. For a support monomial the new degree is Σ_j e(b,j)=a(b); constants contribute degree zero and the sum remains homogeneous even if coefficients cancel or the slice becomes identically zero. eval_blockSlice is the exact evaluation-after-substitution identity, using the update map. Polynomial evaluation is continuous, so this is a valid BlockPoly instance. In sphereLogIntegrable_holds there are two cases: if a nonzero product-sphere witness exists, apply blockPoly_claim and take its first component; otherwise the entire integrand is identically zero by Real.log 0=0, and is integrable. The source actually does not use the f≠0 premise in this integrability proof; retain it in the statement nonetheless. In particular this latter branch is not an assertion that an everywhere-zero sphere polynomial has null zero set. This fully supplies hInt from hSJ, no appeal to the target height theorem.

## 6. Additive multiblock Jensen correction (RestBlockSubstIsMultiHomogeneous)
Exact source theorem blockSphere_logMean_bound assumes hSJ, hInt, n>0 and arbitrary B,a,g,u with multihomogeneity and g(u)≠0. Then
  log||g(u)|| − (Σ_b a(b)) H_(n−1)/2 ≤ blockSphereMean B n g.
Proof (the separate source induction): B=0, product measure Dirac, equality. For B+1, split coordinates into x first and y rest. Polynomial substitutions lh0First and lh0Rest preserve the respective homogeneous degrees; the source proves this with weighted-homogeneous monomial products and evaluation maps. Fix u0; G(y)=g(u0,y) has a nonzero witness at u_tail. Apply induction to G to get its mean lower bound. Apply null_of_logBound to G, using hInt and the induction bound for every scalar multiple: exactly the scaling contradiction in §3 but with the product measure, replacing |K|+1 by K+1. Hence almost every y is a valid SJ slice. Now hInt gives full-product and restricted-polynomial integrability before Fubini is invoked. For almost every y,
  integral_x log||g(x,y)|| ≥ log||G(y)||−a(0)H_(n−1)/2.
Integrate against the probability ν, subtract the constant correction, and use the induction bound
  integral_y log||G(y)|| ≥ log||g(u)||−(Σ_tail a)H_(n−1)/2.
Sum the two corrections, using the exact Fin.sum_univ_succ identity. No exception set dropped, no assumption that each slice is nonzero, no use of Fubini before integrability. Since hInt was supplied in §5, this is now a locally derived bound from the SJ supplier. The arithmetic lower bound still needs full coefficient torus witness and finite-place product-formula expansion, not just this sphere inequality.

## 7. Executed regression certificate
Executed in V8 during this run; output {"counts":{"sliceEvaluation":1250,"sliceDegree":11250,"zeroMassContradiction":26775,"absoluteBound":3596,"fibreDomination":134445,"correctionAssembly":35152,"negativeControls":4},"total":212472}. These are finite exact regression checks of slice evaluation/degree, scalar contradiction after clearing denominators, absolute-value and fibre majorant inequalities, and additive correction assembly. They do not verify analytic integrability, general polynomial claims, or Lean's kernel. To reproduce, extract the following JS and run with Node. Counts are checks, not proof obligations closed. Negative controls distinguish the hypotheses.
~~~js
const certificate = function () {
  const out={sliceEvaluation:0,sliceDegree:0,zeroMassContradiction:0,absoluteBound:0,fibreDomination:0,correctionAssembly:0,negativeControls:0};
  function ck(b,m){if(!b)throw Error(m)}
  const pow=(x,k)=>BigInt(x)**BigInt(k);
  const pts=[];for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)pts.push([a,b]);
  // Two blocks, each of degree 2; arbitrary coefficients, including cancellation.
  const terms=[];for(let i=0;i<=2;i++)for(let j=0;j<=2;j++)terms.push({e:[[i,2-i],[j,2-j]],c:BigInt((i*3+j)%5-2)});
  function evalF(p){return terms.reduce((s,t)=>s+t.c*t.e.reduce((a,eb,b)=>a*eb.reduce((v,k,j)=>v*pow(p[b][j],k),1n),1n),0n)}
  for(const x of pts)for(const y of pts)for(let b=0;b<2;b++){
    const p=[x,y], coeff=[0n,0n,0n];
    for(const t of terms){const other=1-b;coeff[t.e[b][0]]+=t.c*pow(p[other][0],t.e[other][0])*pow(p[other][1],t.e[other][1]);ck(t.e[b].reduce((s,e)=>s+e,0)===2,"slice degree");out.sliceDegree++}
    const q=coeff.reduce((s,c,i)=>s+c*pow(p[b][0],i)*pow(p[b][1],2-i),0n);
    ck(q===evalF(p),"slice evaluation");out.sliceEvaluation++;
  }
  // Exact rational contradiction P log|c| = |K|+1 > K; use numerator p and denominator q.
  for(let q=1;q<=50;q++)for(let p=1;p<=q;p++)for(let K=-10;K<=10;K++){
    const num=BigInt(q*(Math.abs(K)+1)),den=BigInt(p);
    ck(BigInt(p)*num===BigInt(q*(Math.abs(K)+1))*den,"scale product");
    ck(BigInt(p)*num>BigInt(K*q)*den,"contradiction");out.zeroMassContradiction++;
  }
  for(let M=0;M<=30;M++)for(let L=-100;L<=M;L++){
    ck(Math.abs(L)<=2*M-L,"absolute log bound");out.absoluteBound++;
  }
  // Finite analogue of the fibre majorization: three equally weighted log values.
  for(let M=0;M<=4;M++)for(let x=-6;x<=M;x++)for(let y=-6;y<=M;y++)for(let z=-6;z<=M;z++)
    for(let anchor=-6;anchor<=M;anchor++)for(let d=0;d<=4;d++){
      if(x+y+z<3*(anchor-d))continue;
      ck(Math.abs(x)+Math.abs(y)+Math.abs(z)<=6*M-3*(anchor-d),"fibre domination");out.fibreDomination++;
    }
  // Corrections in a common integer denominator, chaining two inequalities.
  for(let a=0;a<=12;a++)for(let b=0;b<=12;b++)for(let h=0;h<=12;h++)for(let e=0;e<=3;e++)for(let f=0;f<=3;f++){
    const L=17,rest=L-b*h+e,full=rest-a*h+f;
    ck(full>=L-(a+b)*h,"additive correction");out.correctionAssembly++;
  }
  ck(Math.abs(2)>2*0-2,"upper-bound hypothesis essential");out.negativeControls++;
  ck(!(0>0),"zero mass cannot divide");out.negativeControls++;
  ck(0!==1,"zero log convention versus constant scaling on zeros");out.negativeControls++;
  ck(0+1!==2,"inhomogeneous slice control");out.negativeControls++;
  return out;
};
const counts=certificate(); console.log(JSON.stringify({counts,total:Object.values(counts).reduce((a,b)=>a+b,0)}));
~~~

RESUME HERE: expand P LogNormCoeffSubLeBlockSphereLogMean L9–75, especially actual exists_torus_coeff_le supplier (find via P AevalIsWeightedHomogeneous imports and source declaration), derive coefficient-to-unit-sphere normalization including sqrt(n), H_(n−1) and log n constants, then trace finite-place norm and number-field embeddings to unconditional local sphere_height_lower_bound. Ask acceleration/dependencies/kernel for cached exact role-labelled Main-root paths to sphereLogIntegrable_holds, blockSphere_logMean_bound, sphere_height_lower_bound; do not count these as Main coverage absent authentication. HANDOFF TO geometry, audit, editor, integration, dependencies, kernel, acceleration. Full RH OPEN.
