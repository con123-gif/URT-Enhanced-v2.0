# Geometry RUN17 — polynomial growth off a complex hypersurface
2026-11-24. SOURCE-MATCHED readable reconstruction, exact finite arithmetic regression executed. Full RH OPEN; independent Lean replay, authenticated root linkage and URT speedup not established.

## Continuity and source provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol/continuity excerpts, CI #400 (22:50:37Z, physics only), RUN15 and RUN16, 25 recent commit titles, 14 peer commit file lists and available RESUME HERE patch lines. Latest dependency lane focuses 71 role-labelled targets, literature crystalline relation, theta holomorphic character, audit cost-window; no duplicate of this frontier found. Some peer full notes and external blueprint PDF not reopened. No physics changes.
Upstream P=40e56bab026552e089d7afcfeff08d2defb9c005, latest observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (merge #1313, 18:24:32 UTC, unchanged since RUN16). GitHub-returned blob hashes, not independently recomputed. Source base https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/
- ToricGeometry/ExistsMvPolynomialOfPolyBoundOffHypersurface.lean: P b5df170413a5d462c24189a4132bc4738bb9e632; H e256f1b88440162b61b7aa1955f99af3dd815a7b. P/H declaration start lines: norm_cons_le_lemma_4 13/70; norm_le_of_bound_cons_lemma 21/78; polynomial_of_bound_off_roots_lemma_2 36/93; polynomial_eventually_ne_zero_lemma_3 142/199; GlobalTheory.exists_mvPolynomial_of_poly_bound_off_hypersurface 155/212.
- ToricGeometry/IsConnectedAndDenseComplHypersurface.lean: P c7a30e8c1c08de636533db8f1d17463a42588382; H e22e270a13f1ad0915913f3591cd519333be76dc. mvPolynomialOnLine 11/67; eval_mvPolynomialOnLine 15/71; finite_zeros_on_line 27/83; mvPolynomial_exists_eval_ne_zero 39/95; joinedIn_setOf_eval_ne_zero 45/101; isConnected_and_dense_compl_hypersurface 61/117.
- CovolumeBounds/EntireApplyEqOfPeriodicOfSpanReal.lean: P 7df7f175abffa929ca0f3320eded3f07a046050e; H 0eb1e6171a61dc7bbd1d3f1d216100bf5732cebb. iteratedDeriv_zero_eq_zero_of_poly_bound 83/104; entire_eq_taylor_sum_of_poly_bound 108/129; entire_exists_coeff_of_poly_bound 121/142; entire_exists_polynomial_of_poly_bound 126/147.
- Actual consumer DivisorProofs/ExistsMulEqOfPolynomialGrowth.lean P 820f7247645460d3966ab47e5e15f56fe03f11da, L123 uses noetherNormalization_primitive, L156 passes isConnected_and_dense_compl_hypersurface and exists_mvPolynomial_of_poly_bound_off_hypersurface to FiniteCoverGrowth.integral_and_rational_of_polynomial_growth (ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean, P 10e7d45c32891276ae1ac9121f289e757b4084e0, L182).
Of 15 trimmed nonblank declaration blocks compared, 11 identical. Differences: main multivariate proof makes map_add argument explicit and renames Polynomial.eval_finset_sum to eval_finsetSum; eval_mvPolynomialOnLine makes map_add arguments explicit; joinedIn_setOf_eval_ne_zero supplies hf.continuousOn instead of hf; entire_exists_polynomial_of_poly_bound renames eval_finset_sum. No semantic equivalence or kernel validity inferred from these textual comparisons.

## 1. Precise theorem and one-variable entire supplier
For ALL natural d,m, nonzero q in C[X_1,...,X_d], f:C^d→C (total function, no regularity required on q=0), C real, define U={x:q(x)≠0}. Assume f complex differentiable on U and |f(x)|≤C(1+||x||)^m for EVERY x in U. Then there exists p in C[X_1,...,X_d] with f(x)=p(x) on U. Here ||x|| is the finite-product max norm. The source conclusion asserts neither equality at q=0 nor a total-degree bound on p. We do not add either as a required conclusion. C is not required positive; nonempty U implies C≥0. The source uses |C| to simplify split bounds, but the original C is preserved in removable-singularity step.

For entire F (the derivative/taylor suppliers are for a complex normed space V with the source's completeness assumptions; the final polynomial supplier specializes to C), hF differentiable everywhere, |F(z)|≤C(1+|z|)^m, obtain C≥0 at z=0. For n>m and R≥1, Cauchy gives
  ||F^(n)(0)|| ≤ n! C 2^m R^m / R^n ≤ n! C 2^m / R.
This uses 1+R≤2R and R^(m+1)≤R^n. Let R→∞, giving derivative zero. The globally convergent Taylor series therefore truncates after m. For F:C→C, p(T)=sum_{k=0}^m F^(k)(0)T^k/k! has natDegree≤m (including the zero polynomial). Keep the Cauchy estimate and entire Taylor theorem as imported Mathlib obligations; finite tests below only check their scalar inequalities.

## 2. Remove roots by induction on degree, not by assuming f entire
Private polynomial_of_bound_off_roots_lemma_2: for natural n,m, real K, polynomial r:C[T] with natDegree=n and r≠0, g:C→C differentiable where r≠0 and |g(z)|≤K(1+|z|)^m there, obtain p with natDegree≤m and g=p where r≠0.
Degree zero: nonzero constant r, so apply entire supplier. For degree n+1 choose complex root c and factor r=(T-c)r' with r'≠0, natDegree r'=n. Define g' by replacing g(c) by punctured limit limUnder, leaving every other value unchanged. For z≠c where r'(z)≠0, r(z)≠0, so differentiability and bound transfer. At c there are two cases:
- r'(c)=0: c is STILL excluded from the new domain; no assertion about g'(c) is needed. This is essential for repeated roots, and the totalized limit does not need to be characterized there.
- r'(c)≠0: use the open neighborhood S={r'≠0}∩ball(c,1). On S minus c, g is differentiable and
  |g(z)|≤K(1+|z|)^m ≤ |K|(2+|c|)^m.
  The bounded removable singularity theorem Complex.differentiableOn_update_limUnder_of_bddAbove supplies differentiability of g' at c. By continuity of g' and z↦K(1+|z|)^m, the original inequality with K passes to c on the nontrivial punctured neighborhood filter.
Now g' meets the inductive hypotheses for r'. Apply induction; where r≠0 one has z≠c and r'≠0, so g'=g and the returned p works. Dependencies: complex root existence, monic division/factor theorem, removable singularity theorem, continuity and nontrivial punctured limit.

## 3. Dimension induction and exact interpolation
Dimension 0: C^0 has exactly one point; take constant polynomial f(0). For d+1 split x=(j,y), j∈C,y∈C^d. Write q as Q(T) in C[Y][T] via finSuccEquiv, and q_j(Y)=Q(j). It is nonzero as a polynomial in T because the equivalence is injective. Bad parameters B={j:q_j=0 as a polynomial} are finite: they inject by scalar inclusion into roots of nonzero Q over the integral domain C[Y]. Choose an injective sequence v_k outside B. The split norm satisfies ||(j,y)||≤|j|+||y||, hence
  1+||(j,y)||≤(1+|j|)(1+||y||),
  |f(j,y)|≤|C|(1+|j|)^m(1+||y||)^m whenever q(j,y)≠0.
Apply dimension induction separately at each v_k to obtain a polynomial P_k(Y) equal to f(v_k,y) when q_{v_k}(y)≠0. No degree bound on P_k is used by the Lean argument.
Use exactly m+1 distinct nodes v_0,...,v_m. Put
  L_k(T)=product_{l=0,...,m; l≠k}(T-v_l)/(v_k-v_l),
  P(T,Y)=sum_{k=0}^m L_k(T) P_k(Y).
For a fixed tail y with all q_{v_k}(y)≠0, and a target x=(j,y) in U, the specialized univariate polynomial r_y(T)=q(T,y) is nonzero because r_y(j)≠0. Apply section 2 to g_y(T)=f(T,y), K=|C|(1+||y||)^m, and get phi_y(T) of degree≤m. Each node is admissible, so phi_y(v_k)=P_k(y). Lagrange uniqueness yields phi_y(T)=sum L_k(T)P_k(y), hence f(j,y)=P(j,y).
Crucial distinction: a node v_k can be globally admissible but its specialized value q(v_k,y) can vanish. Therefore this step alone only handles generic tails, not all U. Example q(T,Y)=T+Y-1, node 0, tail 1, target T=2: target admissible, sample excluded. Also m+1 nodes cannot in general be replaced by m (two nodes 0,1 do not determine T(T-1) of degree two).

## 4. Extend from generic tails without imposing continuity on the removed hypersurface
Set R(Y)=product_{k=0}^m q_{v_k}(Y)≠0 (integral domain). Since C infinite, a nonzero multivariate polynomial has a nonzero evaluation; choose b with R(b)≠0. For any x=(j,y) in U consider gamma(t)=(j,y+t(b-y)). The polynomial rho(t)=R(y+t(b-y)) is nonzero because rho(1)=R(b)≠0. Its roots are finite; after deleting 0, their complement contains a neighborhood of 0, so rho(t)≠0 eventually in the punctured filter. Also q(gamma(0))=q(x)≠0; by continuity q(gamma(t))≠0 for all sufficiently small t. On their intersection, section 3 gives f(gamma(t))=P(gamma(t)). As t→0 punctured, f is continuous AT x because x belongs to the open set U, and polynomial P is continuous. Uniqueness of limits gives f(x)=P(x). No value or continuity of f on q=0 was used. This completes the exact quantified theorem. The source line substitution uses PG.lineHom/eval_lineHom (imported from PolyGrowthStatementPf); retain those references as suppliers, not replayed.

## 5. Connectedness and density are separate supplied facts
For every d and nonzero q, the companion theorem asserts IsConnected U and Dense U. Choose b with q(b)≠0 by polynomial function extensionality. For any a, the line polynomial Q_{a,b}(t)=q(a+t(b-a)) is nonzero at 1, hence nonzero with finite roots. If a∈U, 0 and 1 avoid roots; C minus any finite set is path connected (source invokes countable complement theorem in real rank 2). Map a path from 0 to 1 along t↦a+t(b-a), yielding a path in U. With arbitrary a∈C^d, the same line avoids its finite root set eventually as t→0 punctured; its image approaches a. Thus every a is in closure U. Nonemptiness, path connectedness and density follow, including d=0. The complex scalar field matters: R minus {0} is disconnected. No assumption about nonsingular hypersurfaces is needed. This connectedness proof is NOT needed inside the interpolation theorem itself, but both are explicitly passed to the finite-cover growth consumer; keep both.
Further controls: growth at infinity alone would not suffice, since g(z)=1/z violates the bound near the removed origin and cannot equal a polynomial off it. Dropping holomorphicity permits conjugation with linear growth. Dropping growth permits exp(z). Equality on the excluded set is not asserted; assigning arbitrary values there changes neither premise.

## 6. Executed regression (V8 BigInt; finite models only)
Actual result: {"nodeSets":150,"genericSamples":227325,"genericInterpolations":69075,"exceptionalInterpolations":17325,"excludedPoints":4350,"lineApproaches":34650,"cauchyComparisons":1620,"sliceBounds":2304,"constantCase":19,"controls":5}.
The model q=(T-a)^2(T+Y-c)^3 deliberately includes global bad nodes, exceptional tails and repeated roots. f is a known polynomial with integer coefficients of total degree≤m; this tests interpolation and exact line avoidance, NOT analytic removability or existence for general f. At exceptional tails the code evaluates the already-extended polynomial P_k, not an illegal f sample. The rational approaching line verifies q and all node values are nonzero at selected t=1/N. Excluded points are counted, not passed tests. Cauchy tests check integer scalar inequalities only. Reproduce by saving the following block to a .js file and running node.

~~~js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)}, abs=x=>x<0n?-x:x, pow=(a,b)=>a**BigInt(b);
 const gcd=(a,b)=>{a=abs(a);b=abs(b);while(b)[a,b]=[b,a%b];return a};
 const rat=(n,d=1n)=>{ck(d!==0n,"zero denominator");if(d<0n){n=-n;d=-d}let g=gcd(n,d);return [n/g,d/g]};
 const add=([a,b],[c,d])=>rat(a*d+b*c,b*d), mul=([a,b],[c,d])=>rat(a*c,b*d);
 const C={nodeSets:0,genericSamples:0,genericInterpolations:0,exceptionalInterpolations:0,excludedPoints:0,lineApproaches:0,cauchyComparisons:0,sliceBounds:0,constantCase:0,controls:0};
 const lag=(nodes,j,k)=>nodes.reduce((r,v,l)=>l===k?r:mul(r,rat(j-v,nodes[k]-v)),rat(1n));
 const poly=(m,j,y,seed)=>{let s=0n;for(let i=0;i<=m;i++)for(let h=0;h<=m-i;h++)s+=BigInt((i*7+h*11+seed*3)%9-4)*pow(j,i)*pow(y,h);return s};
 for(let m=0;m<=5;m++)for(let a=-2n;a<=2n;a++)for(let c=-2n;c<=2n;c++){
  const nodes=[];for(let v=-3n;nodes.length<m+1;v++)if(v!==a)nodes.push(v);
  const q=(j,y)=>pow(j-a,2)*pow(j+y-c,3);
  ck(nodes.every(v=>v!==a)&&new Set(nodes).size===m+1,"valid nodes");C.nodeSets++;
  for(let y=-8n;y<=8n;y++)for(let j=-6n;j<=6n;j++){
   if(q(j,y)===0n){C.excludedPoints++;continue}
   const generic=nodes.every(v=>q(v,y)!==0n);
   for(let seed=0;seed<3;seed++){
    let s=rat(0n);for(let k=0;k<nodes.length;k++){
      if(generic){ck(q(nodes[k],y)!==0n,"sample off hypersurface");C.genericSamples++}
      s=add(s,mul(lag(nodes,j,k),rat(poly(m,nodes[k],y,seed))));
    }
    ck(s[1]===1n&&s[0]===poly(m,j,y,seed),"interpolation");
    if(generic)C.genericInterpolations++;else C.exceptionalInterpolations++;
   }
   if(!generic){
    for(let N=2n;N<=7n;N++){
     ck(j!==a&&N*(j+y-c)+1n!==0n&&nodes.every(v=>v!==a&&N*(v+y-c)+1n!==0n),"punctured line");
     C.lineApproaches++;
    }
   }
  }
 }
 for(let m=0;m<=8;m++)for(let n=m+1;n<=m+6;n++)for(let R=1n;R<=30n;R++){
  ck(pow(1n+R,m)<=pow(2n*R,m)&&pow(R,m)*R<=pow(R,n),"Cauchy radius bound");C.cauchyComparisons++;
 }
 for(let m=0;m<=8;m++)for(let j=0n;j<=15n;j++)for(let y=0n;y<=15n;y++){
  ck(pow(1n+(j>y?j:y),m)<=pow(1n+j,m)*pow(1n+y,m),"split max norm");C.sliceBounds++;
 }
 for(let c=-9n;c<=9n;c++){ck(poly(0,0n,0n,Number(c+9n))===poly(0,5n,-7n,Number(c+9n)),"constant");C.constantCase++}
 ck(((-2n)-(-2n))**2n===0n,"bad slice");C.controls++;
 ck((0n+1n-1n)===0n&&(2n+1n-1n)!==0n,"exceptional tail");C.controls++;
 ck((0n-0n)**2n===0n&&(0n-0n)===0n,"repeated root");C.controls++;
 ck(0n*(0n-1n)===0n&&1n*(1n-1n)===0n&&2n*(2n-1n)!==0n,"two nodes insufficient for degree two");C.controls++;
 ck(100n>10n*(1n+1n),"pole growth violates constant bound");C.controls++;
 return C
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: expand noetherNormalization_primitive in ToricGeometry/ExistsPrimitiveElementDiscriminantMultiple.lean (actual caller ExistsMulEqOfPolynomialGrowth L123), focusing on the precise monic primitive polynomial, Bezout discriminant multiple q and simultaneous denominators. Preserve the Mathlib analytic leaves of RUN17, prior RUN15–16 normality/projectivity/DVR obligations and actual finite-cover hypotheses. Request authenticated role-labelled root paths for exists_mvPolynomial_of_poly_bound_off_hypersurface, isConnected_and_dense_compl_hypersurface and their GAGA consumer; do not infer reachability from imports. HANDOFF TO geometry, editor, integration, kernel, dependencies, audit, literature. Project OPEN.
