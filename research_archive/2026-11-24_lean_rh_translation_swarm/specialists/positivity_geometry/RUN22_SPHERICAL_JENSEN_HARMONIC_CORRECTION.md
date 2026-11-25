# Geometry RUN22 — spherical Jensen inequality and logarithmic integrability
2026-11-25. RESULT: DONE for local SOURCE-MATCHED single-block inequality and linear logarithmic mean; PARTIAL for multiblock integrability and global height. No claim about RH closure, kernel replay, or URT speed.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research-state/log/protocol/continuity excerpts, CI #415 (03:40:36 UTC; physics only), RUN21 full note, latest 50 branch commit titles and 14 peer commit patches with available RESUME extracts. No duplicate of this task found. Not every peer note or external PDF reopened. No changes to physics queue. RUN21's a.e. nonvanishing is distinct from the actual integrability argument below.

## 1. Source provenance
Repository leanprover-community/riemann-hypothesis; P=40e56bab026552e089d7afcfeff08d2defb9c005, H=fcb6eac7534875d32d68030967e2deae6d686151 (merge #1853, 2026-11-25 02:41:16 UTC; unchanged from RUN21 on latest inspected default-branch listing). All paths below relative to src/ReciprocityTheory/SemistableReduction/. GitHub-returned blob IDs, not independently rehashed. P declarations read in full.
- [SJCoreA.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/SJCoreA.lean) d3856963228dfcaeb4754277abf159368d5a2ea0; H 1c6ae50b53264a200b6c1129b0eb23caadcc2148. All 11 declaration blocks unchanged modulo whitespace, shifted +9 lines. P radJ/radK L9–12, integrableOn_radJ L13–18, radJ_eq/pos/add_two L19–34, integrableOn_radK L35–61, tendsto_radK_boundary L62–84, radK_add_two L85–144, radRatio_add_two/odd L145–161.
- [SJCoreB.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/SJCoreB.lean) 0a556bb28ce1649f0d69f6a470450d341c61207a; H 4aa81da39d675015ddd7e22972c2f5a002dbed36. All 16 blocks equal after whitespace normalization, shifted +9. P density/polar integrals L10–67, conjugation and null kernel L68–100, complex Gaussian integrability L101–162.
- [SJCoreC.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/SJCoreC.lean) cf8f3f8c28101cbe2344352776dd48f1c86fa315; gauss_pair P L9–118 moved to H SJCoreD L27–136, same except simp no longer mentions Set.restrict_apply.
- [SJCoreD.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/SJCoreD.lean) 3da1d791cd703993044afb1fb4f43d5acda53f6a; H a562e1a909ca03503baf2062c02ab590cbf900d4. sphereProb_eq P L9–13/H L154–158, log_norm_sum_smul_sphere_mul_exp_eq P L14–29/H L159–174 equal; polar_mean P L30–132/H L175–277 final field_simp <;> ring becomes field_simp.
- [SJCore.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/SJCore.lean) 021dd0802232b95d14b7479a3c4ee3f232eb99be; gaussLogC_div L9–43 and sjCore_holds L44–55.
- [MeasurePreservingSphereMap.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/MeasurePreservingSphereMap.lean) 1541b0a6ac0881fe17f0e68d4404b2ab53d67029; H caf48ed6095b0bb640aa756bfa174113d147dd88. Of 13 blocks, 12 unchanged after whitespace normalization; measurePreserving_sphereMap P L46–52/H L52–60 adds explicit AEMeasurable witness for Measure.map_smul. P rotCL/rotIso/rotS L53–110, sphereProb_inner_eq_zero L111–136.
- [LogNormEvalZeroLeCircleAverage.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/LogNormEvalZeroLeCircleAverage.lean) 4d5dbbbd7190ec4967fa21193c46399a3a117d26; log_norm_eval_zero_le_circleAverage L9–31, lineRestrict and eval_smul_of_isHomogeneous L33–49.
- [SjHolds.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/SjHolds.lean) ef4bbcc3df181829fc19778e0018c400f660f6f7; sj_holds L10–210.
- [HeightLowerBound.lean P](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/ReciprocityTheory/SemistableReduction/HeightLowerBound.lean) d1cf6b9555a57f2d6318a1e68117e1203980e15e; heightLowerBound_of_sj_of_sphereLogIntegrable L7–30. P LogNormCoeffSubLeBlockSphereLogMean.lean 805547a6ed14ff4a5cff3cbddbc6cc98153f529f, H 2cece49866d0d0c069a23f86960ed17908179185; 2 of 4 blocks equal, 2 differ. P RestBlockSubstIsMultiHomogeneous.lean 812738f004e09ec25a232124ee4d06e90f9c79c1, H 98b38e131f1ef66d9f507faa36dfc3ba2a6cebef; blockSphere_logMean_bound P L201 / H L213 explicitly assumes both hSJ and hInt.
- H old paths SJCore, SJCoreC, LogNormEvalZeroLeCircleAverage, SjHolds and HeightLowerBound returned 404; SJCoreC relocation confirmed above, other four new paths not located in this session. No claim all upstream declarations unchanged. Source-based derivation below uses P. Default-branch code search for SphereLogIntegrableStatement returned no hits; not evidence of absence.

## 2. Exact linear logarithmic mean
Let n be a natural number, c a nonzero vector in complex Euclidean n-space, and ell_c(z)=sum_i c_i z_i. The proposition SphereLinLogStatement requires both absolute integrability of log|ell_c| on the probability unit sphere and the exact mean
  E log|ell_c(Z)| = log||c|| - H_(n-1)/2.
Nonzero c implies n>=1; no extra hypothesis needed in its statement. H_0=0. The conjugation convention matters: ell_c(x)=<conj(c),x>, using the inner product conjugate-linear in the first argument.

For r>0 write J_k=integral r^k exp(-r²) dr and K_k=integral r^k log(r) exp(-r²) dr, both over (0,infinity). J_k finite and positive for all natural k via Gamma((k+1)/2)/2. K_k absolutely integrable for k>=1 by |log r|<=r+r^(-1), so r^k|log r| exp(-r²) <= (r^(k+1)+r^(k-1))exp(-r²). Retain this condition; the source does not use k=0 for K. Integration by parts with u=r^(k+1)log r and v=-exp(-r²)/2 gives
  J_(k+2)=(k+1)J_k/2,
  K_(k+2)=((k+1)K_k+J_k)/2.
The boundary product tends to zero at 0 (r log r tends to zero) and infinity (exponential dominates polynomial, log r<=r for r>=1); both derivative products integrable by the preceding estimates. Thus, since J_k>0,
  K_(k+2)/J_(k+2) = K_k/J_k + 1/(k+1),
  K_(2m+1)/J_(2m+1) = K_1/J_1 + H_m/2.
This is the exact harmonic correction, not an asymptotic approximation.

For the Gaussian part choose an orthonormal basis beginning with conj(c)/||c||. In coordinates y, ell_c has norm ||c|| |y_0| and ||x||²=sum |y_i|². Haar pushforward may differ by a positive scalar s; use that SAME scalar for both integrals rather than assuming it equals 1. Let G(a)=integral_C log(a|z|)exp(-|z|²) dz, G0=integral_C exp(-|z|²) dz. For a>0, absolute integrability follows from
  r |log(ar)| <= |log a|r + 2r^(3/2)+2r^(1/2)
and the Gaussian power integrals. Product integration gives Gaussian mass s G0^n and logarithmic integral s G(||c||)G0^(n-1). Their ratio is G(||c||)/G0=log||c||+K_1/J_1 by 2-real-dimensional radial integration; G0>0.

Now use polar integration in real dimension 2n, k=2n-1, raw sphere measure nu of finite positive total mass A. The set ell_c(Z)=0 is nu-null: its radial cone lies in the proper real linear kernel of ell_c, a Haar-null subspace; nonzero c proves properness by evaluation at conj(c). Thus radial logarithm splits a.e. as log r + log|ell_c(Z)|. Gaussian absolute integrability and product Fubini show K_k + J_k log|ell_c(Z)| integrable on nu. Subtract the integrable constant and divide by positive J_k, obtaining actual logarithmic integrability on the sphere BEFORE computing its mean. The Gaussian mass is A J_k; the logarithmic integral is A K_k+J_k integral log|ell_c| dnu. Normalize nu/A, then subtract the radial mean K_k/J_k from the Gaussian ratio. Inserting the odd recurrence proves the asserted equality with H_(n-1)/2. This reconstructs sjCore_holds, including its original Mathlib Gamma, Haar, polar, orthonormal basis, integrability and Fubini obligations. No kernel replay.

## 3. Single-block homogeneous Jensen theorem
Exact SJStatement: for n,a natural, f in C[X_0,...,X_(n-1)] homogeneous of degree a, u a unit vector and f(u) nonzero,
  log|f(u)| - a H_(n-1)/2 <= E log|f(Z)|,
and log|f(Z)| is integrable. sj_holds assumes SphereLinLogStatement, just reconstructed above. The unit condition forces a nonempty sphere and n>0; no added dimension premise. a=0 is allowed.

For unit z let s=<u,z>, w=z-su, so <u,w>=0. The rotation R_theta z=su+exp(i theta)w preserves norm and is an invertible real isometry (indeed complex linear). It preserves sphere probability, because its linear extension preserves volume and commutes with radial cones. It is jointly continuous in theta,z. The set s=0 has sphere measure zero as in the previous kernel argument. For s≠0 the actual line polynomial q(T)=f(su+Tw) has q(0)=s^a f(u)≠0 by homogeneity. Jensen's circle-average identity on the closed unit disk has nonnegative divisor multiplicities (polynomial analytic on a neighborhood) and contributions log(1/|root|)>=0 for roots inside the disk, zero for boundary roots, no contribution outside. Thus log|q(0)|<=circle average log|q|; circle log is integrable by the cited meromorphic logarithm supplier. No assumption that the boundary circle has no roots. The source uses the Mathlib meromorphic divisor identity, not an independently replayed kernel proof. With T=2*pi,
  integral_(0,T] log|f(R_theta z)| dtheta >= T(log|f(u)|+a log|s|).
Do NOT integrate the potentially nonintegrable signed function globally yet.

Let L(z)=log|f(z)| (Lean Real.log 0=0), choose M bounding |f(z)| on the compact sphere, then L<=M by log t<=t including the Lean zero convention. Define D=M-L>=0 and h(z)=M-log|f(u)|-a log|s|. The preceding circle inequality and D>=0 give h>=0 a.e. and integral D(R_theta z) dtheta <= T h(z). The function h is integrable by the established linear mean (c=conj(u), norm 1). Apply Tonelli to the measurable NONNEGATIVE D, using invariance in theta: T integral D <= T integral h < infinity in extended nonnegative reals. Cancel T>0 finite, obtain D integrable, hence L=M-D integrable. Only now use signed integral subtraction. The inequality integral D<=integral h becomes
  E L >= log|f(u)|+a E log|s| = log|f(u)| - a H_(n-1)/2.
This is the essential noncircular integrability mechanism at P SjHolds L114–210. Imported obligations: compactness, continuity/measurability, analytic and meromorphic divisor/circle integrability, volume invariance and proper subspace nullity, ENNReal Tonelli and cancellation. All retained. Neither merely a.e. nonvanishing nor a finite polynomial grid proves this theorem by itself.

## 4. Actual downstream height boundary
Located heightLowerBound_of_sj_of_sphereLogIntegrable, an actual theorem explicitly taking hSJ:SJStatement and hInt:SphereLogIntegrableStatement. It is not a proof of hInt. If both hold, for nonzero multihomogeneous number-field f with n>0, select any nonzero support coefficient c. The finite-place Gauss norm dominates |c|_w, so sum_w log Gauss_w >= -log|Norm_K/Q c|; finite support of the multiplicative valuations is explicitly supplied. At each embedding sigma the coefficient comparison gives sphere mean >= log|sigma(c)| - sum_b a_b(log n+1/2). Injective embeddings preserve support and multihomogeneity. Summing over all embeddings cancels the finite-place norm via product-of-embeddings equality; divide by [K:Q]>0. This yields the stated height lower bound conditional on the exact hSJ and hInt suppliers. The block-sphere induction and the actual hInt supplier are still unexpanded. No authenticated Main-root value path for these geometry declarations has been recovered, so their use in the final RH argument remains unconfirmed.

## 5. Executed reproducible finite regression
V8 execution returned {"radialRatio":50,"betaMoment":49,"rotationNorm":7500,"rotationCenter":7500,"jensenProducts":13824,"controls":4}, total 28,927. Node-compatible JS below. The radial recurrence is tested after subtracting its arbitrary initial offset (K_1/J_1); independent exact beta moment uses integral_0^1 x^j(-log x)dx=1/(j+1)^2 and binomial expansion of (1-x)^(n-2). This independently tests H_(n-1), not analytic measure identities. Rotation tests use exact Gaussian integer arithmetic with denominators cleared; Jensen checks only root-product inequality for roots on a finite grid. Controls check unit norm and phase guards, center nonzero and half factor. No numerical quadrature or Lean kernel run; finite checks are regression evidence only.

~~~js
function certificate(){
const C={radialRatio:0,betaMoment:0,rotationNorm:0,rotationCenter:0,jensenProducts:0,controls:0};
const ck=(x,m)=>{if(!x)throw Error(m)},abs=x=>x<0n?-x:x,gcd=(a,b)=>b?gcd(b,a%b):abs(a),Q=(a,b=1n)=>{if(!b)throw Error("zero denominator");let g=gcd(a,b);return [a/g*(b<0n?-1n:1n),abs(b/g)]},add=(a,b)=>Q(a[0]*b[1]+b[0]*a[1],a[1]*b[1]),mul=(a,b)=>Q(a[0]*b[0],a[1]*b[1]),div=(a,b)=>Q(a[0]*b[1],a[1]*b[0]),eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
let J=Q(1n,2n),K=Q(0n),H=Q(0n);
for(let n=1n;n<=50n;n++){
 ck(eq(div(K,J),mul(H,Q(1n,2n))),"relative radial ratio");C.radialRatio++;
 if(n>1n){let sum=Q(0n),bin=1n;for(let j=0n;j<=n-2n;j++){sum=add(sum,Q((j%2n?-1n:1n)*bin,(j+1n)**2n));bin=bin*(n-2n-j)/(j+1n)}ck(eq(mul(Q(n-1n),sum),H),"beta log moment");C.betaMoment++}
 K=mul(Q(1n,2n),add(mul(Q(2n*n),K),J));J=mul(Q(n),J);H=add(H,Q(1n,n))
}
const ca=(a,b)=>[a[0]+b[0],a[1]+b[1]],cs=(a,b)=>[a[0]-b[0],a[1]-b[1]],cm=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]],con=a=>[a[0],-a[1]],sc=(a,n)=>[a[0]*n,a[1]*n],norm=a=>a[0]**2n+a[1]**2n,ce=(a,b)=>a[0]===b[0]&&a[1]===b[1],inn=(u,x)=>ca(cm(con(u[0]),x[0]),cm(con(u[1]),x[1]));
const G=[];for(let x=-2n;x<=2n;x++)for(let y=-2n;y<=2n;y++)G.push([x,y]);
const units=[[1n,0n],[-1n,0n],[0n,1n],[0n,-1n]],us=[[[1n,0n],[0n,0n]],[[3n,0n],[0n,4n]],[[1n,1n],[1n,-1n]]];
for(const u of us){let D=norm(u[0])+norm(u[1]);for(const x0 of G)for(const x1 of G){let x=[x0,x1],s=inn(u,x),p=u.map(v=>cm(v,s)),w=x.map((v,i)=>cs(sc(v,D),p[i]));ck(ce(inn(u,w),[0n,0n]),"orthogonal complement");for(const t of units){let r=p.map((v,i)=>ca(v,cm(t,w[i])));ck(norm(r[0])+norm(r[1])===D*D*(norm(x0)+norm(x1)),"rotation norm");C.rotationNorm++;ck(ce(inn(u,r),sc(s,D)),"center fixed");C.rotationCenter++}}}
for(const r of G)for(const s of G)for(const t of G){let ns=[norm(r),norm(s),norm(t)];if(ns.some(v=>v===0n))continue;let center=ns.reduce((a,b)=>a*b,1n),jensen=ns.reduce((a,b)=>a*(b>1n?b:1n),1n);ck(jensen>=center,"root-factor Jensen inequality");C.jensenProducts++}
ck(!ce(inn([[2n,0n],[0n,0n]],[[1n,0n],[0n,0n]]),[0n,0n]),"nonunit control setup");
let v=[[2n,0n],[0n,0n]],x=[[1n,0n],[0n,0n]],s=inn(v,x),p=v.map(a=>cm(a,s)),r=p.map((a,i)=>cs(sc(a,2n),x[i]));ck(norm(r[0])+norm(r[1])!==norm(x[0])+norm(x[1]),"unit hypothesis");C.controls++;
ck(norm([2n,0n])!==1n,"phase norm hypothesis");C.controls++;
ck(norm([0n,0n])===0n,"Jensen center zero excluded");C.controls++;
ck(!eq(Q(1n,2n),Q(1n)),"n=2 correction half not one");C.controls++;
return C}
const c=certificate();console.log(JSON.stringify({c,total:Object.values(c).reduce((a,b)=>a+b,0)}));
~~~

RESUME HERE: trace the actual SphereLogIntegrableStatement supplier (not statement definition or a conditional consumer), then reconstruct blockSphere_logMean_bound P RestBlockSubstIsMultiHomogeneous L201–293, retaining n>0, nonzero slices, Fubini and all hInt premises; subsequently expand the coefficient torus witness and heightLowerBound proof. Locate H relocations for SJCore/sj_holds/heightLowerBound using scoped source index, and request authenticated Main role-labelled paths for sjCore_holds, sj_holds, heightLowerBound_of_sj_of_sphereLogIntegrable and actual hInt supplier. HANDOFF TO geometry, dependencies, kernel, integration, literature, editor, audit. Full RH OPEN.
