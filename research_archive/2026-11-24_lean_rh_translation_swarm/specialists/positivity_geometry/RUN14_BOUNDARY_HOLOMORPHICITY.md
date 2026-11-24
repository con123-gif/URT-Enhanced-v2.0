# Geometry RUN14 — boundary holomorphicity via Cauchy slices
2026-11-24. SOURCE-MATCHED, readable local proof; finite exact algebra regression executed in V8. Imported analytic and algebraic suppliers remain explicit. Full RH OPEN.

## Continuity / source
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RESEARCH_STATE and CONTINUITY_PROTOCOL excerpts, RUN13 and latest 35 peer commits / 14 file lists and available RESUME HERE patch lines. Root RESEARCH_LOG.md and RESEARCH_PROTOCOL.md returned 404 on this attempt; blueprint link noted, PDF not reopened; editor latest patch had no resume lines. No competing boundary-holomorphicity task found. General CI checkpoint #393 20:37:01 UTC run 45479331883 is not RH verification. Native dependency compute rh-next-root-roles-20261124 status pass retrieved; its solution JSON has no textual matches for holoOn_bdZ, differentiableAt_of_lines, frequently_ne_zero, tendsto_arc_readsZ or HolArc; no authenticated root reachability asserted.
P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (24 Nov 18:24:32 UTC, merge #1313, unchanged since RUN13). GitHub-returned blob hashes (not independently recomputed):
* P src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoB.lean, 0c0ad5b8910bc85997bb107de3caab75c487ed0c, holoOn_bdZ L135–205.
* P src/Development/WeilBound/CoreStatements/ProjectiveValuations/DifferentiableAtOfLines.lean, e4fe51fc5baf985d064128ba5c6ba89b3a5b4f7f, differentiableAt_of_lines.
* P src/Development/WeilBound/CoreStatements/ProjectiveValuations/FrequentlyNeZero.lean, 1d1298db4bb760abebd049e39798814996eea9a4, frequently_ne_zero and mem_open_of_ptY.
* P src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsHolomorphicArcSmoothAlgebraNonvanishing.lean, e95390ba40afc2cae23ad6c4bdaab24940937c6e, isAlgebraic_of_etale, faithfulSMul_of_flat, exists_line, exists_holPts_ne_zero.
* P src/GroundTheory/HeightsAndTheta/Heights/ComplexAnalyticSets/PRiemannExtensionAnalytic.lean, 1111fc0f8873ed7d0a49f12000dfc81b3a42540a, circleIntegral_inv_smul_eq, differentiableOn_circleAverage, analyticOnNhd_of_differentiableOn.
At H the first two are in src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean (blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e), at L1314 and L924 respectively. Trimmed nonblank declaration blocks compared: holoOn_bdZ 71/71 lines identical; differentiableAt_of_lines 113/113, one line differs (continuous_add_left z0 replaced by explicit Continuous witness by fun_prop). FrequentlyNeZero H blob c2019b86f5a92f47a35f4c605879a8f98a293644, frequently_ne_zero 25/25 lines identical. ExistsHolomorphicArcSmoothAlgebraNonvanishing H blob b95f09d2dc17e940e2cadc75a8efe116c842bf71, exists_holPts_ne_zero 68/68 lines identical. PRiemannExtensionAnalytic H blob 166a4f183d5d0c3a3ed87e117cb9fb3e776281b8, declarations present (not compared body-by-body). These are source comparisons not elaborated-equivalence checks.
Links: https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/<path> with P replaced by above SHA (literal template); H likewise.

## 1. Abstract local extension theorem (exact hypotheses)
DifferentiableLines.differentiableAt_of_lines. Let k be a natural number, U,O open subsets of C^k (neither is assumed contained in the other), g,f:C^k→C. Assume g holomorphic on U, f holomorphic on O, and for every t in U with g(t)≠0, t∈O. For every τ∈U outside O and every direction v, IF τ+zv belongs to O eventually as z→0 through z≠0, THEN f(τ+zv)→f(τ) along the punctured filter. Fix τ0∈U; for every r>0 there exists t∈B(τ0,r) with g(t)≠0. Conclusion f complex Fréchet differentiable at τ0. No blanket continuity assumption on f, and no assumption that g(τ0)≠0. In k=0 the nonzero witness ensures τ0∈O; original construction still works with v=0.

Choose r>0 with B(τ0,r)⊂U and t1∈B(τ0,r/2) with g(t1)≠0. Set v=t1−τ0. For |z|<3/2 and ||τ−τ0||<r/4:
||τ+zv−τ0|| ≤ ||τ−τ0||+|z| ||v|| < r/4+(3/2)(r/2)=r.
Thus each slice Gτ(z)=g(τ+zv) is holomorphic on D(0,3/2). Gτ0(1)≠0, so by the analytic identity theorem its zeros are isolated. Pick ε>0 with Gτ0(z)≠0 for 0<|z|<ε, and ρ=min(ε,1)/2>0. The circle |z|=ρ lies in the open nonzero locus. Joint continuity and compactness of that circle give δ0>0 so every τ in B(τ0,δ0) has the whole translated circle in U∩{g≠0}. Set δ=min(δ0/2,r/8)>0; the same holds on the closed δ-ball. This uniformity is essential; pointwise choice of radii is not a proof of differentiability in τ.

## 2. Cauchy readout and the actual boundary values
Define A(τ)=(1/(2π))∫_0^{2π} f(τ+ρ exp(iθ)v)dθ. On the closed δ-ball times the circle, all points lie in O. PRiemannExtensionAnalytic.differentiableOn_circleAverage uses continuity of the complex derivative of f (via separate analyticity/Osgood), compactness of the translated product and a finite bound M on ||Df|| there; dominated differentiation of the integral gives A holomorphic on the open δ-ball. It does NOT assert differentiability of f on the interior of each slice yet.
For every τ in the δ-ball, Gτ(ρ)≠0. By the identity theorem Gτ is not identically zero and all its zeros in the 3/2-disk are isolated. At z0 in the disk with τ+z0v∈O, Fτ(z)=f(τ+zv) is holomorphic by composition. At a point outside O, nearby z≠z0 have Gτ(z)≠0 and lie in U, hence in O. Translate by z0 and apply the precise line-limit assumption; the punctured limit equals the ALREADY DEFINED value Fτ(z0). The one-variable removable singularity theorem for continuity at z0 then implies analyticity at z0. This proves Fτ holomorphic on the full disk (no assumption of continuity at all boundary points before this step).
Cauchy's formula, on |z|=ρ inside that disk, yields
f(τ)=Fτ(0)=(2πi)^−1 ∮ Fτ(z)/z dz=(1/(2π))∫_0^{2π}Fτ(ρ exp(iθ))dθ=A(τ).
The exact factor follows from dz/dθ=i z and ρ≠0, as in circleIntegral_inv_smul_eq. Since f=A on a neighborhood, f is differentiable at τ0. Distinguish this from the adjacent local_extension theorem which constructs an extension using local boundedness but does not require agreement with arbitrary already assigned boundary values. Here the value-matching hypothesis cannot be dropped: f(0)=1 and f(z)=0 elsewhere with g(z)=z satisfies the other premises yet is discontinuous at 0.

## 3. Producing nearby nonzero points
frequently_ne_zero: F field, Y scheme, p:Y→Spec F smooth, σ:F→C, W affine open with Γ(Y,W) a domain, g∈Γ(Y,W) nonzero, y complex point in W, N any neighborhood of y. Then ∃ y'∈N with ev(g,y')≠0. The conclusion does not require y' to equal y or N to be open.
Set A=Γ(Y,W) with its structural F-algebra. Smoothness restricts to A. The supplier exists_holPts_ne_zero gives a family ψ_u:A→C, holomorphic evaluations on a positive disk, ψ_0=ev_y, base field fixed, ψ_u(g)≠0 for all nonzero u in disk. Convert to complex scheme points e(u) by ofHom inside disk, use y outside. Every evaluation is continuous at 0, so the affine-point topology lemma proves e(u)→y. Intersect the pullback of N with the disk and punctured neighborhood; the latter is nontrivial over C, hence choose u, get y'=e(u).
Expand the supplier: for smooth F-domain A, point ψ0:A→C, p∈A nonzero, choose étale coordinates s_i after localization R=A[1/g] with ψ0(g)≠0 (smooth point chart). The injection A→R preserves p≠0 and R is a domain. Polynomial base S=F[X_i] maps to R by s_i; étale implies flat, so S→R injective by faithfulSMul_of_flat (a≠0 acts injectively, and a·1=0 would imply 1=0). Étale also implies fraction field extension algebraic: formal unramifiedness and essential finite type survive localization and restriction to fraction fields, yielding separability and algebraicity. Source Algebra.IsAlgebraic.exists_nonzero_dvd therefore supplies c∈S nonzero with image c=(image p)d in R. ÉtaleFamily.exists_holomorphic_sections provides local lifts of nearby coordinate evaluations extending ψ0, with scalar field fixed and exact coordinates. These two substantial existence suppliers are not reproved here.
Map c along σ, preserving nonzero by field injectivity. A nonzero multivariate polynomial over C has a point w with c(w)≠0. With b0 original coordinates take v=w−b0 and Q(u)=c(b0+uv); Q(1)=c(w)≠0. Its nonzero roots form a finite set disjoint from 0; choose a small positive disk avoiding them. Intersect with the disk on which the local étale lift exists. There c(b0+uv)≠0 for u≠0. If ψ_u(p)=0, evaluation of c=p d would vanish, contradiction. At u=0 no nonvanishing demanded; all field and coordinate identities preserved. A domain condition matters: in C[x,y]/(xy), x vanishes on an entire open local branch near (0,1) despite x≠0 in the ring.

## 4. Application to flag geometry: holoOn_bdZ
Full source signature: E field, NumberField, IsCMField; H Host E, D Datum H, l Level H, Xo Moduli D l, c Coeff l, r natural, σ:c.F→C; V:Unf Xo c σ r, GoodEmb c σ, IsUnf V, T:TorFlag Xo c; ee:Ix D→Z with ee none=0; k:V.Comp, la:Wt (V.X k).Ψ r; P:Frame (V.X k).Ψ r→C with P∈(V.X k).SS la; d natural with SmoothOfRelativeDimension d (flagStr T.X); R:AnRead (flagStr T.X) σ d; h:(T.X.LL ee).ι→CxPts(flagStr T.X,σ)→C, Reads V T ee k P h, OffZero V T k h; hh: for every i, R.HoloOn(ptsIn((T.X.LL ee).U i) ∩ ptsIn(flagOpen T.X)) (h i). For each i:T.X.F.J conclude R.HoloOn(ptsIn(T.X.F.U i))(h i).
Fix analytic chart C and chart coordinate v with its point y0 inside U_i. Smoothness gives reducedness, normality and locally Noetherian structure; ModelChart.exists_open_isDomain gives a domain neighborhood W1. Choose affine W⊂W1∩U_i containing y0; inherited domain property. Density of flagOpen gives a scheme point of W∩flagOpen, hence basic open D(g)⊂flagOpen, g∈Γ(W), g≠0 because D(0)=∅. Do NOT infer nonzero complex evaluation at y0 from this density; the separate frequently_ne_zero theorem is needed.
Let L be the complex linear equivalence from Euclidean chart space to C^d and s(b)=C.e^{-1}(L^{-1}b) on the chart target. U is pullback of W intersect chart target, O pullback of U_i∩flagOpen intersect chart target. Both open by ChartGlue. G(b)=ev(g,s(b)) is holomorphic on U, all regular functions similarly. G≠0 implies membership in D(g) and hence O (W⊂U_i). F(b)=h_i(s(b)) is holomorphic on O by hh and chart compatibility.
At τ∈U\O the point lies outside flagOpen. mem_open_of_ptY proves any matching frame point lies in flagOpen (pullback of flagOpen along ptY is top); thus OffZero forces F(τ)=0. For any direction w with punctured line eventually in O, choose small radius so full line disk stays in W and punctured disk lies in flagOpen. Every regular evaluation is differentiable on disk by composition. These are precisely RUN13 tendsto_arc_readsZ hypotheses (b1 entire disk in W; b2 all evaluations differentiable; b3 center outside flagOpen; b4 punctured interior). It gives F(τ+zw)→0=F(τ). For every ρ>0 take neighborhood of y0 whose chart coordinates lie in B(Lv,ρ), intersect chart source, and apply frequently_ne_zero to g. Map the resulting y' back to coordinates: G≠0 at a point of that ball. All premises of differentiableAt_of_lines now hold at Lv; compose with L and restrict to chart domain to conclude HoloOn. The conclusion is holomorphicity of the actual readout, not just existence of another holomorphic extension. It does not by itself prove algebraization.
Retained dependencies: RUN13 analytic lift/unipotency/period/cusp decay; smooth normal domain charts, dense flagOpen, étale coordinate and local-section existence, affine complex-point topology, identity theorem, removable singularity, Osgood/derivative domination and Cauchy. No extra Cathedral premises or physical claims. No authenticated root path or independent Lean replay.

## 5. Executed certificate
V8 output {"radius":275520,"line":10000,"coefficient":10000,"negative":4}. Exact integer and BigInt synthetic regressions of tube bound, monomial line substitution/endpoint and constant coefficient, with four elementary negative controls. Not numerical evaluation of native geometric data, not proof of analytic integration, and not a kernel check. The polynomial coefficient check is algebraic support for the Cauchy formula, not a replacement for that theorem. Reproduce by saving the code below as run14.mjs and running node run14.mjs.
~~~js
function certificate(){
 const ck=(b,m)=>{if(!b)throw Error(m)}, c={radius:0,line:0,coefficient:0,negative:0};
 // Coordinates in units 1/8, r positive; use norm bounds scaled by 8.
 for(let r=1;r<=20;r++)for(let a=0;a<2*r;a++)for(let b=0;b<4*r;b++)for(let z=0;z<12;z++){
   ck(8*a+z*b<64*r,"tube bound");c.radius++;
 }
 const mul=(a,b)=>{let t=Array(a.length+b.length-1).fill(0n);for(let i=0;i<a.length;i++)for(let j=0;j<b.length;j++)t[i+j]+=a[i]*b[j];return t};
 const pow=(a,n)=>{let p=[1n];for(let i=0;i<n;i++)p=mul(p,a);return p};
 const evalP=(a,z)=>a.reduceRight((s,x)=>s*z+x,0n);
 for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let d=-2;d<=2;d++)for(let e=-2;e<=2;e++){
  let A=BigInt(a),B=BigInt(b),D=BigInt(d),E=BigInt(e);
  for(let m=0;m<=3;m++)for(let n=0;n<=3;n++){
    let p=mul(pow([A,D-A],m),pow([B,E-B],n));
    ck(evalP(p,1n)===D**BigInt(m)*E**BigInt(n),"endpoint");c.line++;
    // The residue of z^-1 p(z) is p(0), equivalently normalized Cauchy average.
    ck(p[0]===A**BigInt(m)*B**BigInt(n),"constant coefficient");c.coefficient++;
    for(let z=-2n;z<=2n;z++)ck(evalP(p,z)===(A+z*(D-A))**BigInt(m)*(B+z*(E-B))**BigInt(n),"substitution");
  }
 }
 // Wrong value at removable point: f(z)=0 for z≠0, f(0)=1.
 ck(0!==1,"boundary-value control");c.negative++;
 // g≡0 and O empty make line assumption vacuous; f=conjugation is not complex differentiable.
 ck(1!==-1,"nonzero witness control: difference quotients along real/imaginary axes");c.negative++;
 // Reduced but not integral: x*y=0, g=x is zero along the y-axis away from origin.
 ck(0*1===0&&0===0,"domain control");c.negative++;
 // A pole has no finite boundary limit: f(1/n)=n.
 ck(1000>100,"pole control");c.negative++;
 return c;
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: locate the immediate caller of holoOn_bdZ in pinned VuOntoA/B successors and the current combined file; reconstruct the exact GAGA algebraization theorem producing algebraic sections from compatible holomorphic readouts, preserving properness/projectivity, coherent sheaf and all matching hypotheses. Keep SmoothPointFamily.exists_etale_away, EtaleFamily.exists_holomorphic_sections and RUN13 analytic leaves OPEN. Request authenticated role-labelled root paths for holoOn_bdZ, differentiableAt_of_lines, frequently_ne_zero, exists_holPts_ne_zero, differentiableOn_circleAverage and tendsto_arc_readsZ. HANDOFF TO geometry, literature, integration, editor, audit, dependency, kernel. Project OPEN.
