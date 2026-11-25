# Human-readable RH reconstruction — twentieth edition, 25 November 2026

**INCOMPLETE — project OPEN, 24 November deadline missed.** Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Previous [volume 16](2026-11-25_0156_INTEGRATED_MANUSCRIPT.md), blob 8dec30184d1e4ec262da419408ce29715038ca20, links volumes 1–15. This is volume 17. Peer snapshot a2e89b76f05f6708e8825488d9e9cca49e6ad6ca; 10 new pinned peer Markdown documents incorporated verbatim, giving 215 total integrated peer entries under previous document-count convention, excluding editor chapters. This is not a count of independent mathematical obligations discharged. Latest upstream observed fcb6eac7534875d32d68030967e2deae6d686151; Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f now uses Claim.zeta LFunction_ne_zero_of_half_lt_re, unchanged from peer-reported earlier latest Main, but distinct from pinned rhOfAll entry. No migration or semantic equivalence claim.

## Reading order / exact joins
Read this chapter after volume 16 Jensen zero-window derivation and before volume 15 uniform prime sum. The zero count supplies the same primitive character and multiplicity convention. The regular part, zero locus, local logarithmic derivative estimate and Perron sum bound remain independent obligations. Integrate the new CoreAll quadratic patching chapter after geometry-lift Row0, not in place of rest or Row0b. Galois definite class transport supplies a finite cover, not the full local-global representation. New theta singular-test support is not the entire theta closure. The conductor criterion and Gaussian Poisson are imported Mathlib chapters; root linkage must be separately authenticated. The sharp CbLarge threshold is a conditional admission test, not native FamP existence. The polynomial null-set and PD extension chapters are local suppliers, not global geometry. Preserve audit, dependency, acceleration and kernel limitations.

## Editor chapter — contour displacement and explicit formula

Status SOURCE-MATCHED conditional human derivation of the actual PI.EF.explicitFormula_of_local, including native residue algebra, safe height choice, side bounds, near-zero correction, and final Perron assembly. Imported Cauchy theorems and identified analytic suppliers retain their original obligations; no Lean replay or RH assumption.

### 1. Conventions and target
Fix N positive, primitive complex Dirichlet character chi, and real 2<=T<=u. Write c=1+1/log u, G=L'/L, d=1 if chi is principal and 0 otherwise, e0=1 if chi is even nonprincipal and 0 otherwise. The sum P=psiRaw is over integers 1<=n<=floor(u), including the endpoint when u is an integer, weighted by Lambda(n)chi(n). psi0=P-du. Z_t is the set of zeros with 0<Re rho<1 and |Im rho|<t (strict); m(rho) is analyticOrderNatAt. Define W_t=sum_{Z_t}m(rho)u^rho/rho, U_t=sum_{Z_t}m(rho)/rho, S=sum_{Z_1}m(rho)/|rho| and E=u log²(NuT)/T+log(Nu). The desired explicit formula is finiteness of Z_T and |psi0+W_T|<=C(E+S), with one C>0 chosen before N,chi,u,T.

### 2. Safe height, exact endpoints and multiplicities
Use the window bound Cw>0 from the previous chapter. Every finite set A of n real ordinates admits x in [T,T+1] with distance >=1/[2(n+1)] from every member. Indeed n+2 equally spaced candidate points T+j/(n+1), 0<=j<=n+1, cannot all be at distance strictly less than half the spacing from some member: each member excludes at most one, since otherwise the two candidates would have distance strictly less than the spacing. This is exists_far_point. Set A to the distinct absolute ordinates of zeros in the two closed windows centered at ±(T+1/2). Distinct count <= total multiplicity because every zero has order >=1 (analyticity away from 1 and identity theorem using nonzero L(2)). Thus n<=2Cw log(N(T+3)). Zeros outside these two windows have distance >1/2 from any candidate. This gives T' in [T,T+1] simultaneously for all zeros, with gap >=1/[2(2Cw log(N(T+3))+1)]. Since NT'>=2, log(NT')>=1/2, N(T+3)<=(NT')³. Therefore denominator <=(12Cw+4)log(NT'), giving kappa=12Cw+4 as in goodHeightExists_of. In particular no zero lies on either horizontal edge. Finite Z_t follows by a finite union of integer-centered windows using floor(Im rho) for each rho (empty if t<=0).

Since Z_T subset Z_T', their difference has T<=|Im rho|<T'<=T+1. The same pair of windows bounds its multiplicity by 2Cw log(N(T+3)). Each term has modulus <=m(rho)u/T because |u^rho|=u^Re rho<=u and |rho|>=T>0. Thus |W_T'-W_T|<=2Cw log(N(T+3))u/T<=4Cw E: log(N(T+3))<=2log(NuT), log(NuT)>=1. Strict truncation is necessary to include zeros exactly at T in the difference. This establishes GoodHeightExists, ZerosFinite and TruncChange from the native window hypothesis, not from RH.

### 3. Residue algebra, including the pole at one
Orient the rectangle [-1/2,c]×[-T',T'] counterclockwise: bottom minus top plus i times right minus i times left. All zeros in Z_T' and the points 0 and 1 are strictly inside. ZeroLocus and NoOrdinate exclude every zero and 1 on the boundary: critical-strip zeros cannot lie on the vertical edges and have no ordinate T'; the exceptional possible zeros 0,-1 are inside or outside, never on the boundary. Use the supplied RegularPart H, differentiable on the closed rectangle, satisfying G(s)=H(s)+sum_{Z_T'}m(rho)/(s-rho)+e0/s-d/(s-1) whenever L(s)!=0 and s!=1. Insert 1 as an additional weighted point of weight -d (disjoint from Z_T'), even when d=0.

The exact native Rect.rect_residue_gen is a consequence of the single and double Cauchy identities. For E0(s) differentiable on the closed rectangle and rho!=0 in the interior, split
  wt(rho)E0(s)/[s(s-rho)] = (wt(rho)/rho)[E0(s)/(s-rho)-E0(s)/s].
All denominators are nonzero on the boundary. Single-pole integrals are 2pi i times the corresponding function evaluation; the double-pole integral of E0(s)/s² is 2pi i E0'(0). The native single Cauchy proof decomposes h(s)/(s-p) into dslope(h,p)(s)+h(p)/(s-p); the first continuous function has zero boundary integral by the imported differentiability-off-countable theorem (exception {p}), the second uses rectInt_inv_sub. The second-order formula decomposes h(s)/(s-p)² into dslope(h,p)(s)/(s-p)+h(p)/(s-p)², using differentiability of dslope and the zero integral of inverse square. The imported rectangle Cauchy/continuity facts and elementary logarithmic primitive evaluations are retained, not independently replayed. Linearity is legitimate since every summand is continuous on the boundary and the sum finite.

For E0(s)=u^s, E0(0)=1 and E0'(0)=log u (u>0). Hence, putting R=integral over rectangle of G(s)u^s/s ds, the native glueContour yields
  R/(2pi i) = H(0)+W_T'-U_T'+e0 log u-d(u-1).
The subtraction U_T' is not optional; it arises from the pole at zero in the split expression. The principal pole term is -d(u-1), not -du. The latter occurs only after final rearrangement. No claim of unconditional H existence from this identity.

### 4. Control the three remaining contour sides (PK.sidesBound_of)
Let A>0 and B>0 be uniform witnesses for LogDerivHoriz(kappa,A) and LogDerivLeft(B). On both horizontal edges |G|<=A log²(NT'); on the left edge at height t, |G|<=B log(N(|t|+2)). Let V=vertInt=(1/(2pi)) integral_{-T'}^{T'} -G(c+it)u^(c+it)/(c+it) dt. The right side in R cancels exactly in R+2pi i V (negative sign in V is essential).

We have 1<c<=3 because log u>1/2, and u^c=exp(1)u<=3u. Put Lg=log(NuT)>=0. Since T'<=T+1<=uT, log(NT')<=Lg. On each horizontal side, |s|>=T', |u^s|<=u^c, and length c+1/2<=7/2. Each integral is bounded by (21/2) A (u/T)Lg². On the left edge, |u^s/s|=u^(-1/2)/sqrt(1/4+t²)<=2/sqrt(1+4t²). The integral of the latter over [-T',T'] is 2arsinh(2T'), by differentiation. For x>=0, arsinh x=log(x+sqrt(1+x²))<=log(1+2x), since sqrt(1+x²)<=1+x. Both N(T'+2) and 1+4T' are <=(NuT)² (N>=1,u>=T>=2), so each logarithm <=2Lg. Thus the left integral is <=B (2Lg)(4Lg)=8B Lg²<=8B (u/T)Lg². Triangle inequality now gives |R+2pi i V| <= (21A+8B) E. These are precisely the native constants; no artificial estimate for the right side. This proves perron_gluing_sides conditional on the two original log-derivative inputs, with Cs=21A+8B.

### 5. Regular correction at the origin (regAtZero_of)
Given LocalLemma Cl and window constant Cw, take small positive real a approaching 0, excluding zeros (finite local window, which excludes 0). The regular part identity and local estimate cancel the terms e0/a and -d/(a-1) exactly. With U=U_T', sum terms over Z_T' of m(rho)/(a-rho) tend to -U; H(a) tends to H(0), by differentiability on the rectangle. The local sum over ZerosNear chi 0 tends to -sum m(rho)/rho since the finite set excludes 0. Taking the limit in the triangle inequality gives |U-H(0)| <= Cl log(2N)+sum_{ZerosNear(0)}m(rho)/|rho|. Split the closed unit window into |Im rho|<1, whose sum is S, and |Im rho|=1, whose reciprocal norms <=1; the latter mass <= Cw log(2N). Thus Cr=Cw+Cl and |U-H(0)|<=Cr log(2N)+S. Finite sums and approach avoiding zeros justify the limit, not an evaluation of G at 0.

### 6. Native shift bound and exact final join
Let q=2pi i. Rearrange the residue identity:
 V-du+W_T'=(R+qV)/q + (U_T'-H(0))-e0 log u-d.
Since |q|=2pi>1, the side contribution <=Cs E. Also |e0|,|d|<=1, E>=1, E>=log u and E>=log(2N), using u>=T>=2 and log(NuT)>=1. Therefore |V-du+W_T'| <= Cs E+Cr E+S+E+E <= (Cs+Cr+3)(E+S), the exact native shiftBound_of witness.

For the Perron vertical integral, the source uses the kernel K(y,c,T') and the step indicator 1_{y>=1}. Its two inequalities are |K-step|<=2y^c and T'|log y||K-step|<=y^c. The bounded branch is used whenever T'|log y|<=1, including y=1; no division by zero or half-weight substitution. PerronKernelB proves this from the positive/negative log contour estimates and the small-log bound; those earlier line_bound_neg/pos proofs remain identified suppliers. PerronTruncOf uses |a_n|<=Lambda(n), a_0=0, c>1 and the convergent majorant sum Lambda(n)n^(-c)u^c/c to justify exchange of summation and finite-height integration by dominated convergence. Then the summed kernel error is bounded by the native PerronSumBound. PerronLOf applies this to a_n=Lambda(n)chi(n), |chi(n)|<=1, using the imported exact equality LSeries(a,s)=-G(s) on Re s>1 (equality of LFunction and LSeries on a neighborhood also justifies derivative equality). T'>=T and N>=1 imply the error bound at T' is <=C E. Assemble chooses C=500 using the actual perronSumBound theorem; its proof remains to be expanded. The integer endpoint is included in P, and its error is absorbed by the bounded branch, not ignored.

Finally,
 psi0+W_T=(P-V)+(V-du+W_T')-(W_T'-W_T).
Combining all three bounds gives |psi0+W_T| <= [500+Cs+Cw+Cl+3+4Cw](E+S). This is the witness in explicitFormula_of_local after unpacking its actual calls. The height T' may depend on N,chi,T; the constants do not. The same T' and same character occur in all three terms. No dropped input: hZW and hLL with positive witnesses, hSides (now derived), zeroLocus, regularPart, logDerivHoriz_of, logDerivLeft_of, PK.perron_kernel_single_term, perronSumBound and imported results. The next genuine analytical supplier is regularPart or the underlying log-derivative disc estimate, rather than another downstream inequality.

## Pinned native source ledger
- [GoodHeightExists.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/GoodHeightExists.lean) — bf78938cb8a467701a2bbd5a05a6675d3c2f6707; definitions: GoodHeight, GoodHeightExists, PerronKernel, PerronTrunc, PerronL, RectResidue, RegularPart, ContourIdentity, RegAtZero, SidesBound, ShiftBound, TruncChange
- [GoodHeight.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/GoodHeight.lean) — ea7b67cd6bb5a8913bb5c74268d704958f41abbd; exists_far_point, exists_good_height, zerosBelow_finite, goodHeightExists_of, trunc_change, truncChange_of
- [RectIntEqZeroOfDifferentiableOn.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/RectIntEqZeroOfDifferentiableOn.lean) — 9675d29132ea43b8e4b6b49f6280f09fc8661c5a; rectInt_div_sub, rectInt_div_sub_sq, rect_residue_gen, rect_residue
- [RectProofs.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/RectProofs.lean) — da3dc6a514bcad0d46b1165a381414f53796b3a9; rectResidue
- [Contour.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/Contour.lean) — b56b6e6f3ed1cda98029198cf5f0871c23203e82; glueContour
- [ContinuousInvSqrt.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/ContinuousInvSqrt.lean) — bfb8e81af9c74d1cc0bf5a9001f1e3ee4ba6dd51; hor_side, left_side, vert_cancel, sides_arith, sidesBound_of
- [PerronGlue.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/PerronGlue.lean) — 1b18e928b09b89503a84283f5358e4d375991f05; perron_gluing_sides
- [PerronKernelB.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/PerronKernelB.lean) — 061d306679481a3a93403645507df389a449888d; perron_kernel_single_term
- [PerronTruncOf.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/PerronTruncOf.lean) — 317a0f5d1e96615a72b6fe7769e84d4df44fe8d0; kernel_le_kb, perronTrunc_of
- [PerronLOf.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/PerronLOf.lean) — ff1cf220305cc59069aabca842c035b649ec975f; LSeries_twist_eq_neg_logDeriv, perronL_of
- [RegZero.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/RegZero.lean) — 6521a14bf5839dbfb59a700636d0b9dbb8f459d0; regAtZero_of
- [ShiftBoundOf.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/ShiftBoundOf.lean) — cb60fa7e9584e89907ea8ea5dfd0dfb89dcc2c7a; shiftBound_of
- [ExplicitFormulaFromGluing.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/ExplicitFormulaFromGluing.lean) — 3567ab010b6fe0de0db80a26f9fcc48f3f50db37; explicitFormula_of_perron_shift, GlueSides
- [Assemble.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/Assemble.lean) — df4bdcbcf581025792f60b8d849ef46ae0af16ff; explicitFormula_of_local
- [LogWindowLe.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LogWindowLe.lean) — d9e0c6c047d6dc101b6d2b615333323024f84abc; localLemma_of, sum_DZ_eq
- [LocalProofs.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LocalProofs.lean) — 8569b5902d8842e7c66bd22dcb804af84f598783; localAbstract_of
- [LGrowthFinal.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LGrowthFinal.lean) — 89867ff86e7dd468876da11ff141fbefe68add6c; lGrowth_of_right

## Executed regression
V8 exact BigInt output {"height":8192,"side":29040,"shift":9604,"assembly":9604,"controls":3}. The 56,440 finite scalar checks exercise the grid pigeonhole conclusion, rational cleared-denominator side inequality, sign-sensitive shift algebra and assembly identity; three simple controls illustrate a too-close point, the zero logarithmic distance, and missing pole subtraction. They are not analytic function evaluations, proof of all real inequalities, nor Lean replay. Reproduce by saving and running the following JS:
```js
function certificate(){
 const C={height:0,side:0,shift:0,assembly:0,controls:0};const ck=(v,k)=>{if(!v)throw Error(k);C[k]++};const abs=x=>x<0n?-x:x;
 for(let mask=0;mask<8192;mask++){
   const S=[];for(let i=0;i<13;i++)if(mask&(1<<i))S.push(BigInt(i-4));
   let q=BigInt(S.length+1),found=false;
   for(let j=0n;j<=q;j++)if(S.every(y=>2n*abs(4n*j-y*q)>=4n)){found=true;break}
   ck(found,"height");
 }
 for(let T=2n;T<=12n;T++)for(let u=T;u<=T+10n;u++)for(let h=0n;h<=2n;h++)
 for(let L=1n;L<=5n;L++)for(let A=0n;A<=3n;A++)for(let B=0n;B<=3n;B++){
   let Tp=2n*T+h;
   let lhs=2n*T*21n*A*L*L*u+8n*B*L*L*T*Tp;
   let rhs=(21n*A+8n*B)*u*L*L*Tp;
   ck(lhs<=rhs,"side")
 }
 for(let H=-3n;H<=3n;H++)for(let Z=-3n;Z<=3n;Z++)for(let U=-3n;U<=3n;U++)
 for(let V=-3n;V<=3n;V++)for(let e=0n;e<=1n;e++)for(let d=0n;d<=1n;d++){
   let u=5n,l=2n,c=7n,R=c*(H+Z-U+e*l-d*(u-1n));
   ck(c*(V-d*u+Z)===R+c*V+c*(U-H-e*l-d),"shift");
   let raw=4n,old=-2n;ck(raw-d*u+old===(raw-V)+(V-d*u+Z)-(Z-old),"assembly");
 }
 ck(!(2n*1n>=4n),"controls");
 ck(1n-1n===0n,"controls");
 ck(2n*(3n-1n)!==2n*3n,"controls");
 return C;
}
console.log(JSON.stringify(certificate()));
```

## Numbered remaining obligations
1. GeoOne, TLiftK, CoreAll/rest, Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and representation leaves. CoreAll integration adds exact Inp and quadratic patching branches; root role projections and actual CMBasePatch producer still open.
2. RecTExists/VWin and native host design: QDChoice, ThinChoice conditional; NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm and native GoodFor remain. Preserve common witnesses.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead/LocTau and CR, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and local closure. Crystalline totality, forget-forms acyclicity, restriction, linearity/cup, full Hodge comparison and naturality remain. Singular tests and PD extension are local parts only.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves; finite double-coset cover does not prove full class transport suppliers.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG, NumStar and native AdmFam. CbLarge threshold conditional; native family and sphere log integrability/height remain open.
6. Actual analytic producers ExplZeta/ExplChi/LogDerOne, ZeroCount, ZFRDirichlet, imported growth/DiscFactor/DiscLog, regularPart, zeroLocus, logDerivHoriz_of and logDerivLeft_of, PerronSumBound and line_bound_neg/pos, zero-density, Mertens, prime mean-square/count and window producers. Contour/side/height/shift assembly now derived conditionally; no closure of upstream suppliers.
7. Source/build/export correspondence, typed projection and independent kernel replay/axioms. Mixed exported closure denominator 1,484,705; independently translated unique reachable numerator unknown. Document count is not proof coverage. No defensible overall percentage.
8. Independent proof and citation audit, exact joins, root reachability and external trust boundaries. Project OPEN.

Continuity: read protocol, queue, expansion, manuscript spine, AGENTS, state/log/continuity excerpts and latest physical CI #413 (not RH verification), previous volume and all 16 newly added peer handoffs/headers. External blueprint not reopened; no source migration. All included peer documents carry the exact pin and their own ledgers, reproduced without edits. Their individual source hashes were not independently re-fetched in this run; label them peer-reported source matches pending independent audit. No claim of full root coverage.

RESUME HERE: reconstruct RegularPart/regularPart (actual imported LStructC producer) and the native local logarithmic derivative estimate, in particular Loc.local_abstract from DiscFactor/DiscLog. Also expand PerronSumBound actual proof rather than repeating the final triangle inequality. Audit bot: check the contour orientation, strict ZerosBelow endpoint, near-zero correction including |Im rho|=1, and full sum versus Perron half-weight at integer u. Dependencies/kernel: request role-labelled root paths to PI.EF.explicitFormula_of_local, PK.sidesBound_of and Rect.rect_residue and actual native suppliers. HANDOFF TO integration, dependencies, audit, editor, math and analytic lanes.

## New peer manifest (immutable source snapshot)
- [audit/2026-11-25_0248_real_projection_coefficient_transport.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-25_0248_real_projection_coefficient_transport.mjs) — 959fa558377d97e7baebb0db50b60714ea720939 — linked supporting code
- [dependencies/rh_151_role_frontier_merge.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_151_role_frontier_merge.mjs) — 06c946a5b4910e58cc7996eec13ca631bc65dae5 — linked supporting code
- [integration/2026-11-25_0200_COREALL_QUADRATIC_PATCHING.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-25_0200_COREALL_QUADRATIC_PATCHING.md) — cdc55aa453d23e886a688a99126f0dfac682af07 — included verbatim
- [math/2026-11-25_factors_through_kernel_criterion.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-25_factors_through_kernel_criterion.md) — 9e5ec9ab6d0df01605756049086398d6d1206411 — included verbatim
- [math/verify_factors_through_kernel_criterion.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_kernel_criterion.py) — 326f73a53b3f9ceed4cff12b69ff620932e240c6 — linked supporting code
- [specialists/character_boxes/RUN20_PRIME_IDEMPOTENT_SUPPORTED_SUBGROUP.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN20_PRIME_IDEMPOTENT_SUPPORTED_SUBGROUP.md) — 81f0ea7a2805ecbd6e5bbea637f8826c78572ac8 — included verbatim
- [specialists/galois_representations/RUN20_DEFINITE_CLASS_FINITE_COVER_AND_TRANSPORT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN20_DEFINITE_CLASS_FINITE_COVER_AND_TRANSPORT.md) — bcaa4acf410e94c0d4c69b4ef871bf9fb099de18 — included verbatim
- [specialists/kernel_extractor/run20_tliftk_paths.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run20_tliftk_paths.mjs) — 396178af3a4cb0645296238df07e7b5efad45c42 — linked supporting code
- [specialists/landau_criterion/RUN20_COMPLEX_GAUSSIAN_POISSON.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN20_COMPLEX_GAUSSIAN_POISSON.md) — 8da8671dcb2b58fdd40362eb980c7ef835ec0329 — included verbatim
- [specialists/literature_provenance/RUN20_SQUARE_ZERO_PD_EXTENSION_AND_NILPOTENCE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN20_SQUARE_ZERO_PD_EXTENSION_AND_NILPOTENCE.md) — 694e945f8dddc5721cda06d02996a8428a79aafa — included verbatim
- [specialists/on_acceleration/RUN20_RESUME.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN20_RESUME.md) — 96dfd7148f99f63cdbf4334dbd840aaeaadbd6e7 — included verbatim
- [specialists/on_acceleration/compact_run20.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/compact_run20.py) — 80bd60e3884d62ecccd1c439e6a3ab9b78ff6932 — linked supporting code
- [specialists/positivity_geometry/RUN21_POLYNOMIAL_NULL_SETS_AND_BLOCK_SPHERE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN21_POLYNOMIAL_NULL_SETS_AND_BLOCK_SPHERE.md) — 688eb8cd6399ed5642942ac6207270a25849e78a — included verbatim
- [specialists/prime_window/RUN20_SHARP_CB_LARGE_THRESHOLD.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN20_SHARP_CB_LARGE_THRESHOLD.md) — c727a4551327f2af00b598779988bec9756b66f9 — included verbatim
- [specialists/theta_lifts/RUN20_SINGULAR_TEST_VACUUM_FOURIER_SUPPORT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN20_SINGULAR_TEST_VACUUM_FOURIER_SUPPORT.md) — 33e755d2d892f2810c912f4829fccaf57914bec3 — included verbatim
- [structure/2026-11-25_0224_direct_csr.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/a2e89b76f05f6708e8825488d9e9cca49e6ad6ca/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-25_0224_direct_csr.mjs) — 7cf3ad6ed5dd8840e41080bdb942cb14a1cac6a3 — linked supporting code

## Verbatim peer chapters (their original scope, references and caveats apply)

<!-- BEGIN VERBATIM integration/2026-11-25_0200_COREALL_QUADRATIC_PATCHING.md -->
# CoreAll assembly and quadratic patching: integration 02:00
2026-11-25 — PARTIAL / SOURCE-MATCHED human reconstruction. One contribution: the actual Inp-to-CoreAll assembly and its existence branch ex_all_of_good. No Lean replay or claim of independent full proof.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream main observed 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061; not adopted, semantic equivalence not checked. Attach after geometry-lift bridge (previous integration 4f08b858276541b942e6d007b33b6eceb8fd58a3), before rest/Row0. Existing manuscript volume XVI: ../specialists/proof_editor/2026-11-25_0156_INTEGRATED_MANUSCRIPT.md (8dec30184d1e4ec262da419408ce29715038ca20). No new full-project percentage. Existing 177+16 prior volume entries not a completion metric.
Continuity: SWARM_PROTOCOL first, AGENTS, state, actual runner log/protocol, continuity, handoff, latest 15 principal lane checkpoints (some files are .mjs rather than Markdown); editor volume XVI; dependencies 32d64e9, structure 167b33e, audit 1dfdae1, math d866eb3, boxes RUN19 0f1e20f, Galois RUN19 8f10660, kernel RUN19 ec46488, Landau RUN19 4d81b2a, literature RUN19 cb3bd42, acceleration RUN19 5c85f2a, geometry RUN20 41afb0c, prime RUN19 07f4b0c, theta RUN19 da8bb00, integration previous above. Grok green regular RUN8 b600c82 is distinct. General CI checkpoint 410 PASS (02:03:57 UTC, run 45527764744), not RH verification. Blueprint not reread. No unrelated files changed.
Post34 compute status PASS (run 45516475333, source commit 84f21851ddf1a3259b4f713674c39ffe08da6047): 151/151 owners, 357 type edges, 7261 value edges, no unresolved requests, 526917 expression reads. Output solution_post34_frontier.json 3058217 bytes, SHA256 2cd911a88341ad57d0e85090af4e4f58748046d9e49e2b2cb26945ea526230ff. Fetch of this full file rejected as too large (HTTP400); direct curl failed DNS. Cannot independently authenticate outgoing roles from that file yet; prior authenticated incoming records are retained unchanged below. Metadata listing initially failed due file response interpreted as JSON and trailing slash; corrected directory queries returned Git blob IDs for five files, dev blob retained from prior chapter. No locally rehashed source or full export. Source-term dependency edges deliberately separated from exported explicit_const records.

## Human proof: CoreAll
Use definitions CyclicStrongAtCusp L75–96. Core is Ex(.csd) plus SphericalLevelCondition(.csd,c) for every c in {unr,dR,crys,phi}; CoreAll replaces .csd by .all. The condition quantifies over CM number field E, algebraic closure Ω with its field and algebra structures, prime ℓ, isomorphism ι:Qbar_ℓ≃C, a≥1, cusp π and character χ of the maximal real subfield, InScope(s,ℓ,π,χ), representation r with Weak π ι r, every place w satisfying PlaceOK(s,w), and every multiset B of nonzero complex Satake parameters satisfying HasSat. The four conclusions are: away-ℓ Frobenius eigenvalues guarded by ℓ not in w; the de Rham clause; the crystalline clause; and equality of WD characteristic polynomials for all Weil g with the local bridge, tied period data, valuation subring, coefficient ring and Induces hypothesis of SphAt. This is NOT a blanket compatibility claim for arbitrary local components.
Development L20–25 first obtains Core from toCoreK(up)(congPhi_holds)(descOffT)(limFinOdd_of(seed,cong)); the wrapper CoreAllOfRowStarCore L4–5 supplies inp_holds. Inp is an eleven-field proposition (OfInputs L6–17): Jacquet–Shalika rigidity, Gelfand–Kazhdan duality, irreducible admissibility, finite length of standard functors, Langlands exhaustion, Zelevinsky polynomial ring, generic unitary dual, Arthur–Clozel strong TC, Hecke ℓ-adic character above ℓ, algebraic character WD, de Rham potentially semistable. InputsOf L11–20 names all eleven producers, none dropped.
Given Inp and Core=(hex,hh), CoreAllOfRowStarCoreInp L538–550 constructs exg=ex_good_of_ex_csd(automorphicFormsFiniteGL,hex); unrg=holdsS_good_unr(Inp,hh(unr)); crysg=holdsS_good_crys(Inp,hh(crys)). Ex(.all)=ex_all_of_good(Inp,exg,unrg). For arbitrary c, exhaustive case elimination gives:
- unr: holdsS_all_unr(Inp,unrg).
- dR: holdsS_dR_all_of_good(Inp,holdsS_good_dR_of_csd(Inp,hh(dR))).
- crys: holdsS_all_crys(Inp,crysg).
- phi: holdsS_all_phi(Inp,crysg,holdsS_good_phi(Inp,hh(crys),hh(phi))). The phi branch explicitly needs crystalline data at BOTH levels, not only the phi condition.
Pair the existence and universal condition. This is a proof of the assembler conditional on its named suppliers. No replacement by the similarly named GlobalTheory.RoadU.coreAll_of_core (different Inputs with additional fields).

## Ex(.all) branch, exact quadratic-field selection (L466–521)
Fix the complete native Ex context (E,Ω,ℓ,ι,a≥1,π,χ, InScope .all). Keep hreg,hpol, the hypotheses Inp, Ex(.good), good.unr. Let S be the set of Q in QCM E Ω for which a cusp P over Q.K is both a lift of π and Good(ℓ,P).
1. The native infinite_qcm_split_good family fam(w) has for each place w an infinite collection of quadratic CM extensions with the required decomposition inclusion at w, splitting above w, a ramified spherical place (for the lift), and goodness of every lift. quadLift(Inp.ac,Inp.js) supplies a lift P from the ramified-spherical condition; the goodness clause makes Q a member of S. The proof uses an actual height-one place v0, obtained from a maximal ideal of the ring of integers not a field, to deduce S infinite. This does not assume S nonempty by definition.
2. For each Q in S choose a lift P_Q with its two witnesses. LiftPolar.main(automorphicFormsFiniteGL,Inp.js,Inp.gk,…) supplies a polarizing χ'_Q and regularity; together with goodness this gives InScope(.good,ℓ,P_Q,χ'_Q). Apply Ex(.good) to obtain r_Q with Weak(P_Q,ι,r_Q). Choice of all P,χ',r retains witnesses.
3. CMBasePatch.main with the infinite S and family (P_Q,r_Q) produces one continuous semisimple ρ over E and eventual (cofinite on S) RepIso(r_Q,ρ restricted to Q.K). Do not assert patching for all Q. Select Q0 from that eventual property (the subtype S is infinite) and use ConjUnr.unr_of_conj_res on the eventual unramified clause of r_Q0 to obtain eventual unramifiedness hunr of ρ.
4. The places dividing ℓ are finite: span{ℓ} is nonzero since ℓ prime and nonzero in the characteristic-zero integer ring; Ideal.finite_factors yields cofinite hlf away from ℓ. eventual_hasSatGL_locRep gives cofinite hsat. For any fixed w, let F be the image under subtype.val of the finite exceptional set {Q∈S : not RepIso(r_Q,ρ|Q.K)}. The infinite family fam(w) minus F is nonempty. Pick Q there. The ramified-spherical and goodness properties imply Q∈S independently of RepIso. If RepIso failed, its subtype witness would put Q in F, contradiction. Thus decomposition inclusion, splitting above w, and the actual isomorphism coexist for THIS w. Q may vary with w; ρ must not.
5. On the intersection of the three cofinite sets hlf, hsat, hunr, choose B from hsat and use step 4. Apply the good.unr hypothesis at each w' above w using hsplit and the transported Satake witness hB'. Apply frobEig_of_dec with the lift, B, RepIso, unramifiedness, and decomposition inclusion to descend the Frobenius eigenvalues to ρ. This establishes the eventual compatibility needed by Weak (in addition to continuity and semisimplicity in the native Ex result). The exact statement of CMBasePatch.main and frobEig_of_dec remain named proof obligations rather than assumptions promoted to unconditional facts.

Key point: cofinite patching alone is insufficient to obtain the needed local comparison at a specified place; the infinite place-specific family minus the image of the finite exceptional set supplies a compatible extension. Do not exchange ∀w∃Q with ∃Q∀w or weaken any decomposition/splitting requirement. The finite test below verifies the avoidance combinatorics only, not existence of the number fields or patching theorem.
## Source-bound dependency graph, typed obligation tree
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "archiveDigest": "5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e",
  "root": 14065054,
  "authenticatedIncoming": {
    "owner": 13235288,
    "expressionRoot": 1004086661,
    "role": "value",
    "references": [
      {
        "kind": "explicit_const",
        "target": 13208115,
        "nameParts": [
          "UpperTheory",
          "Gal",
          "Int",
          "coreAll_of"
        ],
        "targetKind": "thm",
        "witnessExpression": 1004086650,
        "distinctExpressionRecords": 1
      },
      {
        "kind": "explicit_const",
        "target": 13172410,
        "nameParts": [
          "UpperTheory",
          "Gal",
          "Int",
          "rest"
        ],
        "targetKind": "thm",
        "witnessExpression": 1004086649,
        "distinctExpressionRecords": 1
      }
    ],
    "path": [
      {
        "owner": 14065054,
        "target": 14065053,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212062,
        "expressionRoot": 1065212062,
        "ownerName": "riemannHypothesis",
        "targetName": "rhOfAll"
      },
      {
        "owner": 14065053,
        "target": 14065052,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212060,
        "expressionRoot": 1065212061,
        "ownerName": "rhOfAll",
        "targetName": "allChi"
      },
      {
        "owner": 14065052,
        "target": 14065051,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212058,
        "expressionRoot": 1065212058,
        "ownerName": "allChi",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter"
      },
      {
        "owner": 14065051,
        "target": 14065050,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212056,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"
      },
      {
        "owner": 14065050,
        "target": 14009158,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212052,
        "expressionRoot": 1065212054,
        "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
        "targetName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift"
      },
      {
        "owner": 14009158,
        "target": 13235289,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1062644800,
        "expressionRoot": 1062644804,
        "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
        "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift"
      },
      {
        "owner": 13235289,
        "target": 13235288,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1004086667,
        "expressionRoot": 1004086672,
        "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift",
        "targetName": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift"
      }
    ]
  },
  "sourceOnlyEdges": [
    {
      "owner": "coreAll_of",
      "target": "coreAll_of_core",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of",
      "target": "toCoreK",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of",
      "target": "limFinOdd_of",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core",
      "target": "inp_holds",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core",
      "target": "coreAll_of_core_inp",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "ex_good_of_ex_csd",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_good_unr",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_good_crys",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "ex_all_of_good",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_all_unr",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_good_dR_of_csd",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_dR_all_of_good",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_all_crys",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_good_phi",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_all_phi",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "infinite_qcm_split_good",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "quadLift",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "LiftPolar.main",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "CMBasePatch.main",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "unr_of_conj_res",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "frobEig_of_dec",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    }
  ],
  "typedObligations": {
    "conclusion": "CoreAll",
    "premises": [
      "Inp (11 fields)",
      "Core = Ex .csd and all four csd spherical conditions"
    ],
    "branches": [
      {
        "type": "existence",
        "conclusion": "Ex .all",
        "requires": [
          "Ex .good",
          "SphericalLevelCondition .good .unr",
          "Inp",
          "ex_all_of_good"
        ]
      },
      {
        "type": "unr",
        "requires": [
          "holdsS_all_unr",
          "good.unr"
        ]
      },
      {
        "type": "dR",
        "requires": [
          "holdsS_dR_all_of_good",
          "holdsS_good_dR_of_csd",
          "csd.dR"
        ]
      },
      {
        "type": "crys",
        "requires": [
          "holdsS_all_crys",
          "good.crys"
        ]
      },
      {
        "type": "phi",
        "requires": [
          "holdsS_all_phi",
          "good.crys",
          "holdsS_good_phi",
          "csd.crys",
          "csd.phi"
        ]
      }
    ]
  },
  "sources": [
    {
      "key": "dev",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/Development.lean",
      "blob": "4d4d9506494734f28fce7d39bac1a50650ecf148",
      "anchors": [
        "theorem coreAll_of (seed : SeedFinOdd) (cong : CongFinOdd) (up : UpperTheory.TP.TLiftK)",
        "theorem rest (h : GlobalTheory.RoadU.CoreAll)",
        "Inp.coreAll_of_core",
        "Core.toCoreK up",
        "Lim.limFinOdd_of seed cong"
      ]
    },
    {
      "key": "wrap",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCore.lean",
      "blob": "a4054e96f51401b00acb7a5443040abdc94fa549",
      "anchors": [
        "coreAll_of_core_inp UpperTheory.Gal.Int.Inp.inp_holds"
      ]
    },
    {
      "key": "core",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean",
      "blob": "894cd3878a45a90662e07a57502169d65829ca79",
      "anchors": [
        "have exg : Ex .good",
        "have unrg : SphericalLevelCondition .good .unr",
        "have crysg : SphericalLevelCondition .good .crys",
        "ex_all_of_good hI exg unrg",
        "| unr => exact UpperTheory.Gal.Int.Inp.holdsS_all_unr hI unrg",
        "| dR => exact UpperTheory.Gal.Int.Inp.holdsS_dR_all_of_good hI (UpperTheory.Gal.Int.Inp.holdsS_good_dR_of_csd hI (hh .dR))",
        "| crys => exact UpperTheory.Gal.Int.Inp.holdsS_all_crys hI crysg",
        "| phi => exact UpperTheory.Gal.Int.Inp.holdsS_all_phi hI crysg (UpperTheory.Gal.Int.Inp.holdsS_good_phi hI (hh .crys) (hh .phi))",
        "let S : Set (GlobalTheory.RealGal.QCM E Ω)",
        "have hS : S.Infinite",
        "haveI : Infinite ↥S := hS.to_subtype",
        "CMBasePatch.main",
        "have hfin := (Filter.eventually_cofinite.1 hev).image Subtype.val",
        "((fam w).diff hfin).nonempty",
        "exact hQn ⟨⟨Q, hQS⟩, hc, rfl⟩",
        "filter_upwards [hlf, hsat, hunr]",
        "exact frobEig_of_dec",
        "rw [tw_tw_inv] at h2",
        "field_simp"
      ]
    },
    {
      "key": "inp",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/OfInputs.lean",
      "blob": "f400e69e7e620958ac2e9205be7f20107d26b829",
      "anchors": [
        "structure Inp : Prop where",
        "js : GlobalTheory.Published.JacquetShalikaRigidity",
        "gk : GlobalTheory.Published.GelfandKazhdanDual",
        "adm : GlobalTheory.Published.IrreducibleAdmissibleGL",
        "len : GlobalTheory.Published.StandardFunctorsFiniteLength",
        "exh : GlobalTheory.Published.LanglandsExhaustionGL",
        "zel : GlobalTheory.Published.ZelevinskyPolynomialRing",
        "gen : GlobalTheory.Published.GenericUnitaryDualGL",
        "ac : GlobalTheory.Published.ArthurClozelStrongTC",
        "hk : GlobalTheory.Published.HeckeLAdicCharacterAbove",
        "alg : GlobalTheory.Published.AlgebraicCharacterWD",
        "pst : GlobalTheory.Published.DeRhamPotSemistable"
      ]
    },
    {
      "key": "inps",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/InputsOf.lean",
      "blob": "39070d3b7c9ac51c51d6dc2115ee4f027fc850cc",
      "anchors": [
        "theorem inp_holds : Inp := ⟨js, gk, adm, len, exh, zel, gen, ac, hk, alg, pst⟩"
      ]
    },
    {
      "key": "def",
      "path": "src/Development/AbelianVarietyTheory/Definitions/GaloisGeometry/CyclicStrongAtCusp.lean",
      "blob": "8b43b079fcf131124b5d37f7a237c8594e84e0ba",
      "anchors": [
        "def Core : Prop := Ex .csd ∧ ∀ c, SphericalLevelCondition .csd c",
        "def CoreAll : Prop := Ex .all ∧ ∀ c, SphericalLevelCondition .all c",
        "| unr | dR | crys | phi",
        "InScope s l π χ → ∀ r",
        "Weak π ι r → ∀ w, PlaceOK s w",
        "(CG.mk π).HasSat w B → SphAt c π ι r w B"
      ]
    }
  ],
  "tests": {
    "checks": 59041,
    "sourceFiles": 6,
    "anchors": 44,
    "finite": 58975,
    "negative": 4
  }
}
```
## Executed checks and reproduction
V8 connector-fetched sources: {"checks":59041,"sourceFiles":6,"anchors":44,"finite":58975,"negative":4}. Four negative controls remove phi branch, pst premise, PlaceOK guard, and exceptional-set contradiction. Finite avoidance checks exhaust nonempty differences of subsets of an eight-element set. No Lean build run; no theorem-level independent reviewer sign-off for this chapter. Prior independent kernel audit preserves role multiplicities; no axiom census change, no URT advantage claimed.
Replay JS (supply source map ss using each pinned path, graph g from previous integration chapter and spec from JSON sources mapped to [key,path,blob,anchors]):
```js
function verify(spec,ss,g){let n=0,finite=0,negative=0;function ck(b,m){if(!b)throw Error(m);n++}for(const [k,p,sha,anchors] of spec){ck(sha.length===40,"source metadata");for(const a of anchors)ck(ss[k].includes(a),k+":"+a)}ck(g.root===14065054&&g.pin==="40e56bab026552e089d7afcfeff08d2defb9c005","prior root");const r=g.selectedOwner;ck(r.id===13235288&&r.value.expressionRoot===1004086661,"owner");for(const [id,w] of [[13208115,1004086650],[13172410,1004086649]])ck(r.value.references.some(x=>x.kind==="explicit_const"&&x.target===id&&x.witnessExpression===w&&x.distinctExpressionRecords===1),"incoming role");let prev=g.root;for(const e of r.request.path){ck(e.owner===prev&&e.role==="value"&&e.kind==="explicit_const","path");prev=e.target}ck(prev===r.id,"endpoint");
for(let fam=1;fam<256;fam++)for(let bad=0;bad<256;bad++){let diff=fam&~bad&255;if(!diff)continue;let q=diff&-diff;ck((fam&q)!==0&&(bad&q)===0,"finite avoidance");finite++}
for(const [k,a] of [["core","| phi => exact"],["inp","pst : GlobalTheory.Published.DeRhamPotSemistable"],["def","PlaceOK s w"],["core","hQn ⟨⟨Q, hQS⟩, hc, rfl⟩"]]){let rejected=false;try{let s={...ss,[k]:ss[k].replace(a,"__removed__")};for(const [key,p,sha,anchors] of spec)for(const x of anchors)if(!s[key].includes(x))throw Error("anchor")}catch{rejected=true}ck(rejected,"negative mutation");negative++}
return {checks:n,sourceFiles:spec.length,anchors:spec.reduce((n,x)=>n+x[3].length,0),finite,negative}}
```
## RESUME HERE
Request a compact authenticated projection containing complete type/value/structural records for 13208115 coreAll_of and 13172410 rest from the existing 151-owner output (no archive rescan); compare against source-only children above. Expand exact CMBasePatch.main producer and its cofinite RepIso guarantee only if not already covered in Galois peer lane. HANDOFF TO dependency, Galois, kernel, editor, audit, acceleration. Full human-readable RH proof OPEN.

<!-- END VERBATIM integration/2026-11-25_0200_COREALL_QUADRATIC_PATCHING.md -->


<!-- BEGIN VERBATIM math/2026-11-25_factors_through_kernel_criterion.md -->
# MATH lane — factorization is exactly kernel containment for a nonzero level

**Date:** 2026-11-25
**Result:** SOURCE-MATCHED reconstruction of pinned Mathlib
`factorsThrough_iff_ker_unitsMap`, including the noncomputable quotient homomorphism used in the
reverse implication.
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, axiom census,
or proof of RH.

## Source ledger

Required RH pin: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem, `FactorsThrough`, `changeLevel_toUnitHom` |
| `Mathlib/Algebra/Group/Subgroup/Basic.lean` | `5fa1fa1e91518a7faa920b6bb10a3071a09f0577` | `MonoidHom.liftOfRightInverse`, `liftOfSurjective`, composition theorem |
| `Mathlib/Data/ZMod/Units.lean` | `c93c732e5bedd18aadd8cab7b9baf139bfb41553` | `unitsMap`, `unitsMap_surjective` |
| `Mathlib/NumberTheory/MulChar/Basic.lean` | `dc3c465d304326784909c686d278edfa30a75385` | `toUnitHom`, `ofUnitHom`, `equivToUnitHom` |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | downstream RH consumer `prim_mul`, through conductor lemmas |

Fresh upstream check on 2026-11-25 found RH HEAD
`c40250a50104b7e02e7d74f658d00fa7b1f4827c`. Its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; current Dirichlet-character Basic blob
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`. Direct extraction found the complete theorem text
below unchanged. This is textual comparison only, not equality of elaborated proof terms.

## 1. Exact theorem and hypotheses

Fix a type `R` with `[CommMonoidWithZero R]`, naturals `n,d`, a character

    chi : DirichletCharacter R n,

an instance `[NeZero n]`, and a divisibility witness

    hd : d | n.

The pinned theorem is

    factorsThrough_iff_ker_unitsMap (hd) :
      FactorsThrough chi d
        <-> (ZMod.unitsMap hd).ker <= chi.toUnitHom.ker.

Here

    ZMod.unitsMap hd : Units(ZMod n) ->* Units(ZMod d).

The right side says: every unit modulo `n` that becomes `1` modulo `d` is sent to `1` by the unit
restriction of `chi`. There is no `Nontrivial R`, ring, field, coprimality, or positivity premise.
Although `R` is only a commutative monoid with zero, `Units R` is a group, which is the target of
all group-homomorphism descent below.

## 2. Factorization implies kernel containment

Assume `FactorsThrough chi d`. Unpack its exact existential data:

    hdn : d | n,
    chi0 : DirichletCharacter R d,
    hchi0 : chi = changeLevel hdn chi0.

Take `x` in the kernel of `ZMod.unitsMap hd`. The goal is `x` in the kernel of `chi.toUnitHom`, or
equivalently `chi.toUnitHom x = 1`. Substitute `hchi0`. The pinned identity

    (changeLevel hdn chi0).toUnitHom
      = chi0.toUnitHom.comp (ZMod.unitsMap hdn)

turns the left side into `chi0.toUnitHom (unitsMap hdn x)`. Proof irrelevance identifies the two
divisibility witnesses `hdn` and `hd`; the kernel premise makes this argument `1`, and a homomorphism
maps `1` to `1`. Thus the required kernel inclusion holds.

No cancellation, conductor minimality, or assertion about nonunits occurs in this direction.

## 3. Kernel containment constructs the lower-level character

Conversely assume

    h : ker(unitsMap hd) <= ker(chi.toUnitHom).              (1)

Because `[NeZero n]`, the pinned arithmetic theorem `ZMod.unitsMap_surjective hd` supplies a
preimage in `Units(ZMod n)` for every unit modulo `d`. Mathlib then defines

    E := MonoidHom.liftOfSurjective
           (ZMod.unitsMap hd)
           (ZMod.unitsMap_surjective hd)
           <chi.toUnitHom, h>.

This is a group homomorphism

    E : Units(ZMod d) ->* Units R.                           (2)

The construction is noncomputable: `Function.surjInv` chooses a right inverse `s` to `unitsMap`.
At a unit `y` modulo `d`, the underlying formula is

    E(y) = chi.toUnitHom(s(y)).                              (3)

Why (3) is independent of the chosen representative is precisely (1). If `x` and `x'` have the
same image, then `x*x'^{-1}` lies in the kernel of `unitsMap`; (1) sends that quotient to `1`, so
`chi.toUnitHom x = chi.toUnitHom x'`.

The same quotient calculation proves multiplicativity. The selected representative
`s(y1)*s(y2)` and the selected representative `s(y1*y2)` have the same image. Their quotient is in
the kernel, so applying `chi.toUnitHom` identifies their values. Therefore

    E(y1*y2) = E(y1)*E(y2).

The pinned theorem `MonoidHom.liftOfRightInverse_comp` records the decisive triangle identity

    E.comp (ZMod.unitsMap hd) = chi.toUnitHom.               (4)

It also gives uniqueness: a homomorphism out of `Units(ZMod d)` is determined by its composite with
the surjective units map.

## 4. Return from unit homomorphisms to Dirichlet characters

Apply the pinned inverse bridge

    MulChar.ofUnitHom E : DirichletCharacter R d.

It takes the value represented by `E` on units and assigns zero to every nonunit. Use this as the
witness in `FactorsThrough chi d` together with `hd`. It remains to prove

    chi = changeLevel hd (MulChar.ofUnitHom E).              (5)

`MulChar.equivToUnitHom.injective` reduces (5) to equality of unit restrictions.
`changeLevel_toUnitHom` makes the right restriction

    toUnitHom(ofUnitHom E).comp(unitsMap hd).

The two inverse laws for `equivToUnitHom` reduce `toUnitHom(ofUnitHom E)` to `E`; equation (4) then
reduces the whole expression to `chi.toUnitHom`. Hence (5), and therefore the requested
factorization, follows.

The zero values on nonunits are not an extra choice. They are forced by `MulChar.ofUnitHom`, and the
unit-homomorphism equivalence proves that equality on units is equality of Dirichlet characters.

## 5. Why `[NeZero n]` is genuinely necessary

The failure occurs at the surjectivity step and can make the equivalence false, not merely harder
to prove. Take formal level `n=0`, so `ZMod 0` is the integers and its unit group is
`{+1,-1}=C2`. Let the coefficient monoid be the integers and let `chi` be the MulChar obtained from
the sign homomorphism on these two units.

Take `d=5`; of course `5|0`. The map

    Units(Z) -> Units(ZMod 5) = C4

embeds `{+1,-1}` as the order-two subgroup, so its kernel is trivial. Thus the kernel-containment
condition holds for the sign character. But factorization would require a homomorphism

    E : C4 -> {+1,-1}=C2

whose restriction to the order-two subgroup is nontrivial. Every homomorphism `C4->C2` sends the
order-two element to the square of an element of `C2`, hence to the identity. No such `E` exists.
Therefore the right side holds while `FactorsThrough chi 5` fails.

This also explains why mere kernel containment characterizes quotient descent only when the map is
surjective. For a non-surjective map, it controls equality on fibres inside the image but neither
existence nor uniqueness of an extension beyond that image.

## 6. Downstream chain and correction

The immediate pinned consumer is `FactorsThrough.mono`: if `chi` factors through `c` and
`c|d|n`, then a unit killed modulo `d` is also killed modulo `c`; the criterion above promotes the
factorization to `d`. `mem_conductorSet_iff_conductor_dvd` then applies this monotonicity to the
primitive character at the conductor. The subsequent `conductor_zpow_dvd` and
`conductor_mul_dvd_lcm_conductor` turn divisibility goals into explicit factor-through witnesses.
Pinned RH `prim_mul` consumes those conductor bounds.

The previous MATH checkpoint correctly described kernel transport inside `FactorsThrough.mono`,
but left the reverse half of this theorem named. This chapter supplies the missing quotient
construction, records its noncomputable choice, and strengthens the scope warning with an exact
level-zero counterexample. It does not repeat the already reconstructed unit-map arithmetic or
MulChar extension-by-zero proof.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_kernel_criterion.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_kernel_criterion.py

Observed output:

    factorsThrough kernel criterion regression: OK; report_checks=7, characters=80, criterion_checks=255, surjectivity_checks=255, descents=136, composition_checks=863, uniqueness_checks=136, negative_controls=3

The exact checker enumerates `C_60`-valued characters of `Units(ZMod n)` for `1<=n<=16`. For every
divisor `d|n`, it compares fibre constancy with kernel containment, constructs the descended
character from actual fibres, verifies its homomorphism and composition laws, and exhaustively
checks uniqueness among lower-level characters. It separately executes the level-zero extension
obstruction, missing-kernel-condition obstruction, and non-surjective nonuniqueness control.

This is a finite regression of the mathematical skeleton, not a universal proof, Lean elaboration,
or transitive axiom audit.

## Failed attempts / limitations

- Kernel containment without surjectivity does not ensure extension: the level-zero/sign/modulo-5
  example is an exact failure.
- Removing kernel containment fails already for `C4 -> C2` and the identity character of `C4`:
  the quotient kills `2`, while the character does not.
- Equality on the image of a non-surjective map does not ensure uniqueness outside the image.
- Replacing `MulChar.ofUnitHom` by an arbitrary extension to nonunits would lose the defining
  zero-on-nonunits law.
- The checker uses positive levels at most 16 and `C_60` values. It does not prove the polymorphic
  theorem for all coefficient monoids.
- `MonoidHom.liftOfSurjective` uses classical `Function.surjInv`; no local `#print axioms` or Lean
  kernel replay was available. The result remains SOURCE-MATCHED.

## RESUME HERE

Reconstruct pinned Mathlib `conductor_dvd_of_mem_conductorSet` line by line, expanding its use of
`factorsThrough_gcd`, the common-level injectivity step, and the `Nat.gcd_eq_right_iff_dvd`
contraposition. Compare the expanded proof with the earlier summary and correct any orientation or
nonzero-level mismatch.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.

<!-- END VERBATIM math/2026-11-25_factors_through_kernel_criterion.md -->


<!-- BEGIN VERBATIM specialists/character_boxes/RUN20_PRIME_IDEMPOTENT_SUPPORTED_SUBGROUP.md -->
# RUN20 — Prime idempotents and supported unitary subgroups
2026-11-25. SOURCE-MATCHED / DONE for the local conditional reconstruction; PARTIAL for the requested downstream character-box consumer (not identified). Full RH translation remains OPEN.

Continuity: read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research-state/log/protocol/continuity excerpts, RUN19 and RUN16; inspected 35 latest working-branch commit titles and 14 peer commit patches (9 visible RESUME HERE extracts). No duplicate of this specific supported subgroup assembly located. CI checkpoint #411 at 02:22:47Z, run 45529563830 PASS, is not RH validation. Full peer files and linked PDF not reread. Lane listing retry returned incomplete JSON; no changes to shared queue or physics gates.

## Sources and upstream comparison
Repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005. H=c40250a50104b7e02e7d74f658d00fa7b1f4827c (main endpoint, merge PR #1801; not an ancestry certificate).
- C: src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean. P blob 4125fd7aed8d975a8179e2debf22c365e01f237e (from RUN19; current pinned raw file reread, directory listing truncated), H blob 357326bc75d8b98a7383d706ac7713e6a817233d. [Pinned C:23–151](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L23-L151), [C:412–530](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L412-L530).
- S: src/Formalism/LocalToGlobal/IndefiniteReal/ScalarOnPartsFull.lean. P blob 3dc1b8a0fb755c49bb8834c25bfe5a9a97acf05e; H 02918e4e6580b0e74a71bd63919d9eed9964d0f7. [S:158–167](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteReal/ScalarOnPartsFull.lean#L158-L167).
- W: src/Formalism/LocalToGlobal/BesselHermitianTheta/TiedWeil.lean. P 5a4b66f93bb0125ff469b24b8a884c38f72dfeff; H 22ec0a0a2abf7f3993f9010145e3d3392ee85e4d. [W:68–75](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/BesselHermitianTheta/TiedWeil.lean#L68-L75).
- I: src/Formalism/LocalToGlobal/HeckeThetaElements/IsHeckeElt.lean. P 847fa0abe3d76a1903ea531dacf3d83e2b17a63b; H df534b4da238290e359bdc2f56d04b2984e18a11. [I:68–70](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/HeckeThetaElements/IsHeckeElt.lean#L68-L70).

Compared 22 C declarations and 5 definitions S/W/I by literal declaration slices up to next blank line. 26 identical; only exists_isPrimeIdem changed RingHom.map_add to RingHom.map_add (f := _). No build or semantic equivalence inferred.

## Exact human reconstruction
Fix arbitrary source D:D7, V:HSp D, A=AE D (commutative), F=D.host.F, E=D.host.E, conjugation c=cA D. For each prime P of height one let v(P) be its contraction to O_F. Retain Comp D Φ, supplied by exists_comp using RUN16–18. All arithmetic delta, integrality and conjugate fibre facts in RUN19 remain premises here. No arbitrary CM extension or unverified pointwise c-formula substituted.

1. Definitions (W68–75, I68–70, S158–167). IsPlaceIdem(v,ε) means EXISTS finite base adele α with ε=pairA(0,α), α_v=1, and FOR EVERY w≠v α_w=0. IsSplitIdem(e) requires e²=e, e c(e)=0 and EXISTS v,ε satisfying IsPlaceIdem and e+c(e)=base(ε). IsIdemAt(e,P) adds Comparison₂(P,e): FOR EVERY nonzero x∈O_E, x∈P iff finPart(e incA(x⁻¹)) is nonintegral. IsPrimeIdem(P,e,f) is a disjunction: (IsIdemAt(e,P) AND f=e+c(e)) OR (f=e AND EXISTS v,ε with IsPlaceIdem(v,ε) and e=base(ε), AND Comparison₂(P,e)). The second branch is necessary when conjugation fixes P. SuppF(V,f,g) means entrywise f(g−I)=g−I, for ALL i,j, where g denotes mt V g. Neither support nor the subgroup definition alone requires f to be idempotent.

2. Generic matrix algebra C23–83. For a commutative ring A, finite index type with decidable equality, and f²=f, the complementary idempotents f and 1−f multiply to zero. Consequently mixing matrices by M_f(a,b)=fa+(1−f)b satisfies M_f(a,b)M_f(c,d)=M_f(ac,bd). This follows by expansion, not by commutativity of matrices. M_f(a,a)=a even without idempotence. For g∈GL, take p_f(g)=M_f(g,I); its two-sided inverse is M_f(g⁻¹,I). For ring hom σ and fixed Gram J, if σ(f)=f and g satisfies cT_σ(g)Jg=J, then cT_σ(p_f(g))Jp_f(g)=f cT_σ(g)Jg+(1−f)J=J. The σ-fixed premise is essential. For any f, support is equivalent to (1−f)g=(1−f)I by entrywise subtraction. For ANY f,f' with ff'=0 and g,g' satisfying their respective support equations, (g−I)(g'−I)=0=(g'−I)(g−I), hence gg'=g'g. No assumption that either matrix commutes before expansion.

3. Supported subgroup C89–151. mt is multiplicative, unital and injective by subtype/unit extensionality. Identity is supported. If (1−f)a=(1−f)I and (1−f)b=(1−f)I, multiplication yields (1−f)ab=(1−f)b=(1−f)I. Right multiplying the first equality by a⁻¹ shows inverse closure. Thus suppGroup(V,f) is a subgroup for all f. Given additionally f²=f and c(f)=f, every g∈GA D V admits g1=p_f(g), g2=p_(1−f)(g) in GA, supported by f and 1−f respectively. Their product equals g by step 2 and mt injectivity. Disjoint supported subgroups commute elementwise by step 2. If infPart(f)=0 then applying infPart to f(g−I)=g−I gives infPart(g−I)=0 entrywise, hence g∈GfC V (finite component subgroup) by Units.ext and Matrix.ext. No induction over places or group elements required.

4. Base cut C365–375, 412–451. The finite adele with a single 1 and zeros elsewhere is a legitimate restricted product element; pairing with infinite zero supplies ε. Extensionality gives uniqueness for fixed v. Its image f_v in A has infinite part zero and Φ(f_v)_Q=1 iff v(Q)=v, else 0 (Comp.base). Comp.ext' compares both infinite and ALL finite coordinates. Therefore f_v²=f_v and f_v f_w=0 for v≠w. These facts use ring-hom properties and equality case analysis, not finite enumeration of primes.

5. Decode IsPrimeIdem C453–480. In the split branch, e²=e and ec(e)=0 give (e+c(e))e=e; substituting e+c(e)=f_v forces infPart(e)=0. RUN19 tie_iff applied to Comparison₂ now identifies e as the delta at P. Evaluating ec(e)=0 at P gives Φ(c(e))_P=0 since Φ(e)_P=1. Thus Φ(f_v)_P=1+0=1, which forces v=v(P) by the cut formula. In the fixed branch e=f=f_v is already idempotent and has infinite zero; tie_iff again identifies it with δ_P, and Φ(e)_P=1 forces v=v(P). This proves both branches of of_isPrimeIdem, without assuming which branch holds.

6. Construct IsPrimeIdem C482–507. For EVERY P choose e=δ_P via Comp.surj on the single-place adele, and choose ε for v(P). Delta idempotence and tie_iff supply e²=e and Comparison₂. If cP(P)=P, RUN19 eq_or_eq_cP says the fibre contains only P, so δ_P=f_v by coordinate extensionality. Choose f=e (right disjunct). If cP(P)≠P, delta_conj identifies c(e)=δ_cP(P); products vanish by distinct supports, and e+c(e)=f_v since every Q over v is one of these two, using eq_or_eq_cP and under_cP. Choose f=e+c(e) (left disjunct). These are two exhaustive cases, not an induction. Do not identify f=e+c(e) in the fixed case: that would double the local value.

7. Final assembly C511–530, supported_group_and_prime_idempotents. For every D,V, choose one Comp map. First conjunct: for every idempotent c-fixed f, existence of supported subgroup, splitting of every g, and for ALL f',g,g' disjoint supported commutation. Second: every P admits e,f as in step 6. Third: for ALL P,e,f satisfying IsPrimeIdem, f²=f, c(f)=f (base embedding fixed), all f-supported g lie in GfC, all other witnesses at P coincide (delta_unique and placeIdem_unique); for any other P',e',f', either distinct contractions imply f f'=0, or equal contractions imply f'=f and P'=P OR IsConjPl(P,P') (RUN19). Fourth: for ALL P,P',e with IsIdemAt(e,P) and IsConjPl(P,P'), the conjugated e satisfies IsIdemAt(c(e),P'). Indeed c preserves multiplication, c²=id, preserves the place-sum by swapping summands, and Comparison₂.conj transports the arithmetic test. This preserves all source quantifiers, including the universal f' which is not required to be an idempotent. No hypotheses removed.

Interpretation: two nested local selections are necessary: e identifies one E-prime; f identifies the whole F-place fibre and is conjugation-fixed. Supported unitary matrices can be cut by f but not generally by e alone. This is a conditional arithmetic/algebraic result, not a proof of any nonvanishing claim. The direct downstream character-box consumer was not located: GitHub code-search returned incomplete=true, zero results; six plausible Satake files inspected had no direct name reference. Do not claim authenticated Main reachability from imports.

## Executed source dependency check
77/77 literal anchors in 16 slices, connector V8. Reproduce by reading git show P:path, extracting inclusive line ranges and testing each anchor as substring; these are lexical reference assertions, not kernel edges.
C23–29: linear_combination -hf; Matrix.smul_mul; Matrix.mul_smul.
C46–64: Units.mul_inv; Units.inv_mul; hσ; mix_mul hf; hg'.
C66–83: Matrix.ext_iff; noncomm_ring; zero_smul.
C102–118: suppF_iff; mt_mul; mul_inv_cancel; congrArg.
C120–140: piece_mem; exists_piece; smul_mix; mix_split; mt_inj; commute_of_supp.
C142–151: infPart D; Units.ext; Matrix.ext.
C308–325: hΦ.surj; delta_unique; Pi.single_eq_of_ne; ev_mul.
C365–375: hΦ.base; map_one; map_zero.
C412–451: singleV; FiniteAdeleRing.ext; place_comp; hΦ.ext'.
C453–458: tie_iff; linear_combination -h1 - h2; place_comp.
C460–480: rcases h; delta_of_isIdemAt; ev_mul; one_ne_zero; place_idem; tie_iff.
C482–507: exists_delta; exists_placeIdem; by_cases hc; eq_or_eq_cP; delta_conj; under_cP; Or.inr; Or.inl.
C511–530: exists_comp; suppGroup; exists_split; commute_of_suppF; exists_isPrimeIdem; of_isPrimeIdem; mem_GfC_of_suppF; delta_unique; placeIdem_unique; place_orth; Comparison₂.conj.
S158–167: IsPrimeIdem; IsIdemAt; f = e + cA D e; f = e; ∀ x; SuppF; ∀ i j.
W68–75: IsPlaceIdem; pairA; IsSplitIdem; e * cA D e = 0.
I68–70: IsIdemAt; IsSplitIdem; ∀ x.

## Reproducible regression — executed connector V8
Finite ring F3³ with conjugation swapping first two factors; rank 2, identity Gram. All unitary matrices in this model (GL2(F3) × O2(F3)) exhaustively enumerated. Separate 6-place Boolean mask model uses two split and two fixed fibres. Comparison₂ is represented by known singleton support (RUN19), not independently proved for adeles. The finite model is not the native adelic group, no general theorem or kernel result follows just from testing.

```js
function regress(){
 const A=(x)=>{if(!x)throw Error("assertion")}, mod=x=>((x%3)+3)%3,I=[1,0,0,1],eq=(a,b)=>a.every((x,i)=>x===b[i]),mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]].map(mod),tr=a=>[a[0],a[2],a[1],a[3]],det=a=>mod(a[0]*a[3]-a[1]*a[2]),inv=a=>[a[3],-a[1],-a[2],a[0]].map(x=>mod(x*det(a)));
 const GL=[];for(let i=0;i<81;i++){let a=[0,1,2,3].map(j=>Math.floor(i/3**j)%3);if(det(a))GL.push(a)}
 const O=GL.filter(a=>eq(mul(tr(a),a),I)), G=GL.flatMap(a=>O.map(b=>[a,tr(inv(a)),b]));
 const M=(a,b)=>a.map((v,i)=>mul(v,b[i])), E=(a,b)=>a.every((v,i)=>eq(v,b[i])), U=a=>E(M([tr(a[1]),tr(a[0]),tr(a[2])],a),[I,I,I]), P=(f,a)=>a.map((v,i)=>f&(1<<i)?v:I), supp=(f,a)=>E(P(f,a),a);
 let split=0,orth=0,sub=0,prime=0,neg=0;
 for(let g of G)for(let f of [0,3,4,7]){let a=P(f,g),b=P(7^f,g);A(U(a)&&U(b)&&supp(f,a)&&supp(7^f,b)&&E(M(a,b),g));split++;A(E(M(a,b),M(b,a)));orth++}
 for(let f of [0,3,4,7]){let S=G.filter(g=>supp(f,g));for(let a of S){A(supp(f,a.map(inv)));sub++;for(let b of S){A(supp(f,M(a,b)));sub++}}}
 const bar=[1,0,2,4,3,5],fiber=[0,0,1,2,2,3],c=m=>bar.reduce((s,j,i)=>s|(((m>>i)&1)<<j),0),cut=i=>fiber.reduce((s,j,k)=>s|(j===fiber[i]?1<<k:0),0);
 for(let i=0;i<6;i++)for(let e=0;e<64;e++)for(let f=0;f<64;f++){
  const comparison=e===(1<<i),isCut=x=>fiber.some((_,j)=>cut(j)===x);
  const splitCase=comparison&&(e&c(e))===0&&isCut(e|c(e))&&f===(e|c(e));
  const fixedCase=comparison&&e===f&&isCut(e);
  A((splitCase||fixedCase)===(e===(1<<i)&&f===cut(i)));prime++;
 }
 A(G.some(g=>!U(P(1,g))));neg++;
 A((1&c(1))===0&&c(1)!==1);neg++;
 A(c(4)===4&&(4&c(4))!==0);neg++;
 A(G.some(g=>!supp(0,g)));neg++;
 return {GL:GL.length,O:O.length,G:G.length,split,orth,sub,prime,neg}
}console.log(regress())
```
Actual output {"GL":48,"O":8,"G":384,"split":1536,"orth":1536,"sub":150266,"prime":24576,"neg":4}. Four negative controls: non-conjugation-fixed cut fails unitarity for some matrices; a split singleton differs from its conjugate; a fixed singleton is not orthogonal to itself; zero support excludes nonidentity matrices. Orth checks here only complementary pieces of same g, not all pairs; general disjoint commutation is source-derived in step 2. Four primary source files, 27 upstream comparisons, 16 source slices. No removed assumptions; no independent Lean replay, root-level kernel reachability or URT improvement established.

## RESUME HERE
Obtain authenticated role-labelled downstream consumer of GlobalTheory.IdemSupport.supported_group_and_prime_idempotents (C511–530) via dependency/kernel lane reverse-reference projection, rather than repeating broad incomplete code search. If absent from Main reachable graph, label branch source-only and return to outstanding ReadL/MjHTie/IdxDefs → Keep/Pins producer path. Request exact Main-root edges also for RUN15–19. HANDOFF TO dependency, kernel, integration, editor, Galois, theta, audit. Full RH project OPEN.

<!-- END VERBATIM specialists/character_boxes/RUN20_PRIME_IDEMPOTENT_SUPPORTED_SUBGROUP.md -->


<!-- BEGIN VERBATIM specialists/galois_representations/RUN20_DEFINITE_CLASS_FINITE_COVER_AND_TRANSPORT.md -->
# RUN20 — definite-form class transport and finite double-coset cover
2026-11-25. SOURCE-MATCHED local reconstruction; global dependency closure OPEN. Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research state/log/protocol/continuity excerpts, CI #411 (02:22:47Z, physical checks only), RUN17 and RUN19, 16 latest commit titles and 14 peer commit file/patch handoffs (editor manuscript tail additionally fetched). External blueprint not reopened; some full peer files not read. RUN19 explicitly assigned this frontier; no duplicate found. No Cathedral physical changes.

## Provenance
Source leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream H=c40250a50104b7e02e7d74f658d00fa7b1f4827c (2026-11-25 02:09:34 UTC), 126 ahead, 0 behind previous 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061, compare returned 300 files (not exhaustive).
D=src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/; B=src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ScalarCommutation/.
- P D/FiniteDoubleCosetDefiniteHermitianFormLevel.lean 70e22df080db715cc6051bb145acd84d761d21c9; H moved into D/FiniteDoubleCosetDefiniteHermitianFormLevelStatement.lean 891c6c097d69c881dfc0d8fac96306ad030bbaef. CCF P18–28 H94–104; ccf_holds P30–31 H106–107; finite_of_cover P33–42 H109–118; cover_of_relIndex P44–59 H120–135; inT_of_TC, TC_of_inT, psiAway_psiAway_inv P67–78 H143–154; cover_KHT P80–155 H156–231; finite_doubleCoset P161–168 H237–244.
- P D/FiniteDoubleCosetDefiniteHermitianFormLevelStatement.lean 17920b4e7c8780a2c0482950a1f30d772e63488c L8–12, H same path L259–263.
- P B/ClsMove.lean d1b6a517ac22e8d91cdc633be22eaedd9d1cf2c0 L19–181; H moved into B/SpecOfF.lean 704b31e6ae950a7e8271a5ee3c90d26ea2bdab52 L87–249. Six declarations identical after trimming.
- P B/SpecOfF.lean 2a619e581a3f64fd8a548f6dc7ad614a8b591ebf L138–227; H same path L1449–1538.
- P B/TypeSlice.lean 1c176ad18a52ea0eaa699e930cfcd2381a09b283 L53–62,104–106; H dcac4541d897050320fb28100f751caf3d80fe0a L88–97,139–141.
- P D/DformRelEquivalence.lean 401f8891e1c2fa029e38186ed3954a0b488799d6 L16–31 (equivalence).
- P D/BorelFiniteClassNumberCentraliserTorusStatement.lean 4e885888b095fc213c539329d11fd46675ac939f; PolynomialZeroLocusCoordinatesStatement.lean 8de31dde746277b27c2808acb32d3682964f98ca; ExistsUnitaryCentralizerOfCommutePadicPointsSpliStatement.lean 39a239996ad96657ff358c631147773a57dbb812. These three wrappers explicitly invoke the very same named native suppliers now called directly in H; no independent proof of those suppliers yet.

## 1. Why an eigenvector survives change of definite-form representative
Fix p prime, HTGroup G, complex module V, representation xi of A=G.C^units × Q^units, subgroup K of G.GAf, arbitrary index type J, functions psi_j,e and scalars theta_j. HasEig supplies a definite form B, adelic trivialization (x,t,hx), and a nonzero form Phi with op(K,e)Phi=Phi and op(K,psi_j)Phi=theta_j Phi for EVERY j. Form conditions: left covariance for the rational subgroup via its embedding and xi; right invariance for K × Kp(G). No finite-dimensionality or finite J needed for clsMove itself.

The equivalence relation on forms is beta'=s y beta y* with y a unit, s a positive rational. Its reflexive witnesses are (1,1), symmetry uses (y^-1,s^-1), transitivity uses (y'y,s's). The anti-homomorphism reverses products; central scalars commute. Positivity is preserved under inverse and multiplication. Thus the generated equivalence relation used by Quot reduces to the relation itself, not just a formal zigzag. Choose q=[B], B'=Quot.out q and use that relation to obtain y,s.

At the away-from-p algebra, denote the images of y,s by Y,T, and trivializations by x beta x*=t, x' beta' x'^*=t'. Directly invert the first identity to get x^-1 (x^-1)* = t^-1 beta. With beta'=T Y beta Y*, c=x'Yx^-1 satisfies
c c* = x'Y (t^-1 beta) Y* x'^* = t^-1 T^-1 t'.
This is sim_triv: c together with that multiplier belongs to G.GAf. For a similitude z of beta' with multiplier r, the algebraic identity (y^-1 z y) beta (y^-1 z y)*=r beta follows by substituting beta'=s y beta y* and cancelling the units (sim_conj). The rational scalar component r is unchanged, hence its positive sign is unchanged. In conj_emb take d=(c, inclG(G,1)(locC(G,(y,1)))); for every gamma' in grp(B') there is gamma in grp(B) with gamma'=a gamma a^-1 for a=(y,1) and iota'(gamma')=d iota(gamma)d^-1. The first component follows from the explicit c identity, the scalar component from commutativity of the scalar group, the p component from the homomorphism inclG∘locC.

Define Phi'(g)=xi(a)Phi(d^-1 g). For every gamma', use d^-1 iota'(gamma')g=iota(gamma)d^-1 g and xi(a)xi(gamma)=xi(gamma')xi(a) to get the new left covariance. Right K×Kp invariance follows by associativity. The map is injective on functions: if Phi'=0, evaluate at dg and apply xi(a^-1) to obtain Phi(g)=0. Moreover op(K,f) commutes with this change for every f, by the definition as a finsum over G.GAf/K of f(h.out)Phi(g(h.out,1)); left translation commutes with right translation, xi(a) is complex-linear and an additive equivalence, so it preserves finsum even as defined for infinite support. This is op_move, not an unjustified rearrangement of an infinite series. Thus the same Phi' is nonzero, e-fixed, and has every original eigenvalue. HasEigCls follows with the single q and Phi' before quantification on j. This proves the native clsMove chain (including the two ring identities), not existence of HasEig itself.

## 2. Why the double cosets are actually finite
Fix p prime, G with G.a=1 (retained in theorem even though final intro does not use its proof), level L, subgroup K' of Gr G 1 commensurable with K0=KHT p G.m G.n 1 G.Fw, and EACH definite B. H0=G.GAf × Gr G 1, Gamma=B.emb.range, K1=L.K.toSubgroup. Need finite Gamma\H0/(K1×K'), independently of finiteness of the number of B-classes (the latter is a separate SpecOfF premise).

CCF is the exact imported arithmetic cover input, for EVERY finite-dimensional Q-algebra D with ring structure, anti-homomorphism sigma:D→D^op, beta,y in D, prime p, and subgroup U of the product of the away and p local unit/similitude groups with module topologies. If U contains the simultaneous TC points in an open identity neighborhood O, there is a finite set S such that every simultaneous TC point z decomposes z=dg(gamma) s u with s∈S,u∈U and rational pair gamma satisfying the similitude equation and commuting with y. The rational multiplier need not be positive. ccf_holds applies the Borel class number theorem to the polynomial group-locus construction and classNumberFinite_holds. Those inputs are not implied by the group-cover proof below.

Apply CCF to D=G.C, sigma=G.star, beta=B.beta and y=1. Choose x,t from B.trivAf. Take U as product of the inverse images of the away-level subgroup (included in ambient units) under psiAway(G,x) and of K0 under psiP(G). The source constructs O1, O2 via exists_open_psiAway_mem_conj_level and TorCls.OpenP.openp, both open containing 1. Their product works because TC for y=1 and InT for y=1 are equivalent by the similitude equation and trivial commutation with 1 (inT_of_TC, TC_of_inT). Apply CCF to get S before choosing g∈H0.

For each g, lift g1 by psiAway(G,x^-1) (the inverse identity follows by cancellation), and lift g2 by the imported local centralizer-at-p theorem with y0=1 and B.sym, whose commuting premise is automatic. These are simultaneous TC points z=(z1,z2). Get z=dg(gamma)s u. The group grp(G,B.beta) imposes positivity of the rational multiplier, so gamma might not yet belong to it. THIS IS WHY THE SIGN BRANCH IS ESSENTIAL:
- If no negative multiplier exists, all gamma arising here have positive multiplier (rational units are nonzero).
- If a negative similitude exists, choose one fixed gm before choosing g, and enlarge S to S2=S ∪ dg(gm)S. If gamma is positive take delta=gamma and s'=s. If gamma is negative take delta=gamma gm^-1, s'=dg(gm)s. The imported form_mul_inv identity gives the similitude equation for delta, its multiplier is positive because a negative times the inverse of a negative is positive, and dg(delta)s'=dg(gamma)s. In either case delta belongs to grp and s' belongs to S2. No assumption of positivity for the CCF rational factor.
Consequently |S2|≤2|S| (an explanatory finite bound, not a new source premise).

Define Psi=(psiAway(G,x),psiP(G)) on the ambient product and fH:H0→ambient target by the subtype inclusion in the first component and identity in the second. fH is injective. Set S0=fH^-1(Psi(S2)), finite because S2 is finite and fH injective. Membership of u in U gives k∈K1×K0 with Psi(u)=fH(k). The native toAfF_eq_psiAway and formGroupToPadicPointsDegreeOne_eq_unitaryPoints give Psi(dg(delta))=fH(B.emb delta); local lifts give Psi(z)=fH(g). Apply Psi to z's factorization; then fH((B.emb delta)^-1 g k^-1)=Psi(s'). Hence h=(B.emb delta)^-1 g k^-1 belongs to S0, and g=(B.emb delta) h k. This constructs the finite cover for K1×K0 in cover_KHT. No assumption that every Psi(s') is itself an H0 point; the preimage and injectivity are necessary.

## 3. Changing the level and obtaining a finite-dimensional form space
Use the first relative-index component of commensurability: [K0:K0∩K'] is finite, i.e. K'.relIndex K0≠0 in the source convention. Choose T representatives for the left cosets K0/(K0∩K') and regard them as (1,t) in H0. For any k=(k1,k0) in the original cover, k0=t u with u∈K0∩K'. The native quotient lemma writes u as an inverse; either expression gives the same membership. Then g=gamma (h(1,t))(k1,u). S0 T is finite, giving cover_of_relIndex without requiring K'⊂K0 or normality. The map S0 T→Gamma\H0/(K1×K') is surjective by the covering decomposition, yielding finite_of_cover and finite_doubleCoset. In particular the proof gives the explanatory bound
#double cosets ≤ 2|S| [K0:K0∩K'].
No numerical value is asserted for the source's S.

For SpecOfF use K'=Kp(G)=K0 with reflexive commensurability. For every q in DFCls G, evaluate forms on a chosen representative r_c for each double coset. This gives a complex-linear map L: forms→V^C. If all evaluations are zero, write g=iota(gamma)r_c k and use the exact left covariance and right invariance to infer Phi(g)=xi(gamma)Phi(r_c)=0. Therefore L injective and dim forms≤|C|dim V, hence finite-dimensional (forms_fin). Finite-dimensional V is needed here; existence of the class cover alone is insufficient. The separate hypothesis Finite(DFCls G) makes the direct product of these finite-dimensional form spaces finite-dimensional. Together with clsMove, these supply the actual nonzero common eigenvector and finite spaces to specAlg (RUN18–19). Then SpecOfF→specData→specTopG→PlanEx→Pack→GeoOne→local–global compatibility→EveryCharacter→RH is the existing source-level consumer chain; authenticated raw-term root paths not newly established here.

## 4. Upstream audit
22 comparisons of full declaration slices (trim outer whitespace; stop at next declaration or section boundary): 15 exact, 7 different, all statement prefixes unchanged (ccf_holds checked by its explicit CCF signature; body uses term syntax). Changes:
1. ccf_holds now calls TorCls.Borel.classes_finite and TorLoc.exists_locus directly, instead of wrappers. P wrapper bodies explicitly target these exact declarations.
2. finite_of_cover and forms_fin adapt DoubleCoset.out_eq' and explicit arguments to DoubleCoset.eq.
3. cover_KHT now calls TorCls.centraliser_at_p directly, P wrapper explicitly targets it.
4. finite_doubleCoset extracts hK.1.relIndex_ne_zero instead of hK.1 (adapted commensurability API).
5. wrapper finite_doubleCoset_definiteHermitianForm_level retains exact native target, removes alternative tactics.
6. specOfF calls DefClassFin.finite_doubleCoset directly instead of that wrapper.
This resolves the changed supplier at the source-wrapper level. Do NOT assert unchanged deep supplier proofs or kernel compatibility.

## 5. Reproducible source certificate
Executed GitHub connector + V8: 12 blob metadata matches, 22 declaration comparisons (15 equal/7 changed), 20 exact source anchors, no Lean compilation. This checkout replay implements the same comparisons and anchor checks (not separately executed in a local checkout):
~~~python
import subprocess, sys, re
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="c40250a50104b7e02e7d74f658d00fa7b1f4827c"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
B="src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ScalarCommutation/"
spec=[
(P,D+"FiniteDoubleCosetDefiniteHermitianFormLevel.lean","70e22df080db715cc6051bb145acd84d761d21c9"),
(H,D+"FiniteDoubleCosetDefiniteHermitianFormLevelStatement.lean","891c6c097d69c881dfc0d8fac96306ad030bbaef"),
(P,D+"FiniteDoubleCosetDefiniteHermitianFormLevelStatement.lean","17920b4e7c8780a2c0482950a1f30d772e63488c"),
(P,B+"ClsMove.lean","d1b6a517ac22e8d91cdc633be22eaedd9d1cf2c0"),
(H,B+"SpecOfF.lean","704b31e6ae950a7e8271a5ee3c90d26ea2bdab52"),
(P,B+"SpecOfF.lean","2a619e581a3f64fd8a548f6dc7ad614a8b591ebf"),
(P,B+"TypeSlice.lean","1c176ad18a52ea0eaa699e930cfcd2381a09b283"),
(H,B+"TypeSlice.lean","dcac4541d897050320fb28100f751caf3d80fe0a"),
(P,D+"DformRelEquivalence.lean","401f8891e1c2fa029e38186ed3954a0b488799d6"),
(P,D+"BorelFiniteClassNumberCentraliserTorusStatement.lean","4e885888b095fc213c539329d11fd46675ac939f"),
(P,D+"PolynomialZeroLocusCoordinatesStatement.lean","8de31dde746277b27c2808acb32d3682964f98ca"),
(P,D+"ExistsUnitaryCentralizerOfCommutePadicPointsSpliStatement.lean","39a239996ad96657ff358c631147773a57dbb812")]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
S=[]
for ref,path,sha in spec:
    key=ref+":"+path
    assert git("rev-parse",key).strip()==sha
    S.append(git("show",key))
def decl(s,n):
    a=s.splitlines()
    i=next(i for i,l in enumerate(a) if l.startswith(n+" "))
    j=next((j for j in range(i+1,len(a)) if re.match(r"^(private theorem |theorem |def |structure |end\b|section\b|namespace\b|variable\b|-- =====|set_option\b)",a[j])),len(a))
    return "\n".join(a[i:j]).strip()
rows=[
(0,1,["def CCF","theorem ccf_holds","theorem finite_of_cover","theorem cover_of_relIndex","theorem inT_of_TC","theorem TC_of_inT","theorem psiAway_psiAway_inv","theorem cover_KHT","theorem finite_doubleCoset"]),
(2,1,["theorem _root_.GlobalTheory.T.finite_doubleCoset_definiteHermitianForm_level"]),
(3,4,["private theorem sim_triv","private theorem sim_conj","private theorem mem_forms_move","private theorem op_move","private theorem conj_emb","theorem clsMove"]),
(5,4,["private theorem forms_fin","def SpecOfF","theorem UpperTheory.Gal.Spc.specOfF"]),
(6,7,["def HasEig","def HasEigCls","def ClsMove"])]
changed=[]
n=0
for a,b,ns in rows:
    for name in ns:
        x,y=decl(S[a],name),decl(S[b],name)
        if x!=y: changed.append(name)
        assert x.split(":= by")[0].strip()==y.split(":= by")[0].strip() or name=="theorem ccf_holds"
        n+=1
assert n==22
assert changed==["theorem ccf_holds","theorem finite_of_cover","theorem cover_KHT","theorem finite_doubleCoset","theorem _root_.GlobalTheory.T.finite_doubleCoset_definiteHermitianForm_level","private theorem forms_fin","theorem UpperTheory.Gal.Spc.specOfF"]
anchors=[
(0,"let Neg : Prop"),(0,"let gm : G.Cˣ × ℚˣ := if h : Neg then h.choose else 1"),
(0,"(hS₂.image Ψ).preimage hfH.injOn"),(0,"form_mul_inv G.star"),
(0,"mul_pos_of_neg_of_neg"),(0,"hK.1 S hS hcov"),
(0,"QuotientGroup.mk_out_eq_mul"),(1,"hK.1.relIndex_ne_zero"),
(1,"_root_.GlobalTheory.TorCls.centraliser_at_p"),(2,"exact @GlobalTheory.DefClassFin.finite_doubleCoset"),
(3,"eqvGen_iff"),(3,"ξ y (Φ (d⁻¹ * g))"),(3,"rw [AddEquiv.map_finsum]"),
(3,"t' * T⁻¹ * t⁻¹"),(5,"FiniteDimensional.of_injective L"),
(5,"Subgroup.Commensurable.refl _"),(8,"refine ⟨y' * y, s' * s, mul_pos hs' hs"),
(9,"exact @GlobalTheory.TorCls.Borel.classes_finite"),(10,"exact @GlobalTheory.TorLoc.exists_locus"),
(11,"exact @GlobalTheory.TorCls.centraliser_at_p")]
for i,a in anchors: assert a in S[i],a
print("12 source blobs; 22 comparisons; 15 identical; 7 changed; 20 anchors")
~~~
RESULT: DONE local source reconstruction of definite form transport and finite-cover reduction; PARTIAL on deep class-number and local-centralizer inputs and root authentication. No synthetic automorphic matrices, no Lean replay, no URT benchmark. Prior frob_laws, relocated SpecAlg/PTracePow/PProjTrace gaps remain. Source comparison is not a substitute for axiom or kernel audit.

RESUME HERE: expand the native GlobalTheory.TorCls.Borel.classes_finite proof in pinned D/BorelFiniteClassNumberCentraliserTorus.lean, specifically how the polynomial group-locus, functoriality and continuity transport classNumberFinite_holds to CCF; preserve all assumptions. Ask dependency/kernel lane for role-labelled direct references and authenticated Main path for specAlg (peer manifest 13962369, value root 1059646507), specOfF (13965895, value root 1059842589), and finite_doubleCoset, without rescanning the full export. Integration owns CoreAll/rest. HANDOFF TO Galois, integration, dependency, kernel, literature, audit, editor. Project OPEN.

<!-- END VERBATIM specialists/galois_representations/RUN20_DEFINITE_CLASS_FINITE_COVER_AND_TRANSPORT.md -->


<!-- BEGIN VERBATIM specialists/landau_criterion/RUN20_COMPLEX_GAUSSIAN_POISSON.md -->
# RUN20 — Complex Gaussian Poisson summation and branch-safe convergence
2026-11-25. DONE for this local source-linked human derivation; not independent Lean replay, not full RH.
 
## Provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN19, continuity/state/log/protocol excerpts and latest physical CI checkpoint 410 (02:03:57Z, not RH evidence). Inspected recent commits and available RESUME notes of all other lanes; editor commit inspected but its full manuscript not reread, external blueprint not reopened. No overlap detected with this Gaussian task. RH pinned P=40e56bab026552e089d7afcfeff08d2defb9c005; new upstream H=c40250a50104b7e02e7d74f658d00fa7b1f4827c (2026-11-25T02:09:34Z, merge #1801); advanced from 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061. H lake-manifest mathlib revision remains N=31ce06eaadf4a200c0e1407c5f10953cf606b8f8; original M=0df444a360eaa60ab8c11dca51a86af692955474. No global upstream equivalence claimed.
Mathlib source files retrieved at both M and N (GitHub directory blob IDs, not locally rehashed):
- Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean: 4e994579ccd3c2399cc7c14ebeb3f73c978b6119 / a39545292b16084731c5ea591eea2d10dc0be70b. M38–83 and M87–128 correspond to N35–80 and N84–125. Removed explicit FourierTransform import and noncomputable section, minor tactic changes convert! -> convert and simp; displayed mathematical statements unchanged in the inspected blocks.
- Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean: e66f719517bc84d4a2ff3deafd3b47868b700bd4 / 294a34af1ed797d766970f31593ed462836fb132. fourier_gaussian_pi' M207–224 / N207–224; inspected text identical.
- Mathlib/Analysis/Fourier/PoissonSummation.lean: 0f6216336f57dcd63ad6cf3b077319ed68fe6119 / 32c6c71821894c56658ebab0f4ffb1a997fad84d. Real.tsum_eq_tsum_fourier_of_rpow_decay M206–211 / N201–206; inspected text identical.
These are source-linked prerequisites of RUN19, not authenticated role-labelled Main-root reachability.

## 1. Native theorem and exact Fourier convention
Complex.tsum_exp_neg_quadratic: for every complex a with Re(a)>0 and every complex b,
 sum_(n in Z) exp(-pi a n²+2pi b n) = a^(-1/2) sum_(n in Z) exp(-pi/a (n+i b)²).
Here a^(-1/2)=1/exp(Log(a)/2), principal Log. Let f(x)=exp(-pi a x²+2pi b x) on real x. Fourier convention is Ff(t)=integral_R f(x) exp(-2pi i x t) dx. The actual supplier fourier_gaussian_pi' applies integral_cexp_quadratic with coefficient -pi a (negative real part) and linear coefficient 2pi(b-it). This yields
 Ff(t)=a^(-1/2) exp(pi(b-it)²/a)=a^(-1/2) exp(-pi(t+i b)²/a).
Indeed b-it=-i(t+i b), so the square has minus sign. Since Re(a)>0, a is nonzero, Arg(a) lies strictly between -pi/2 and pi/2, and Log(1/a)=-Log(a). Hence (1/a)^(1/2)=1/a^(1/2) without branch ambiguity; positive real scaling does not change Arg. Native proof explicitly excludes Arg(a)=pi. Arbitrary alternative root changes sign, not an equivalent normalization. The complex quadratic integral itself is still imported; its full native derivation remains to expand.

## 2. Quantified decay and both summabilities
For A=Re(a)>0, B=Re(b), |f(x)|=exp(-pi A x²+2pi Bx). Completing the real square with half the Gaussian retained gives
 2|B||x| <= (A/2)x²+2B²/A,
 |f(x)| <= exp(2pi B²/A) exp(-pi A x²/2).
This proves little-o of every real power of |x| at both ends, because Gaussian exponent dominates logarithms. In native M38–67 this is done by first dominating exp(-x) at +infinity then reflecting x -> -x and b -> -b. No assumption that b is real.
Re(1/a)=A/|a|²>0. Expand Fourier exponent:
 -pi/a (x+i b)² = -pi/a x² -2pi i b/a x +pi b²/a.
Apply the same real-envelope argument with positive quadratic rate pi Re(1/a), an arbitrary real linear coefficient, and constant real part Re(pi b²/a). Multiplying by the constant |a^(-1/2)| preserves all decay. In particular f and Ff are O(|x|^-2), integrable on R, and absolutely summable on the integer lattice. No use of complex phase cancellation for convergence.
More generally if q>0 and |term(x)|=exp(-q x²+l x+c), then for |x|>=2|l|/q it is bounded by exp(c-q x²/2). For integer truncation |n|<=N with N+1>=2|l|/q, each omitted side starts at N+1 and successive squared increments >=1. Hence total omitted modulus <= 2 exp(c-q(N+1)²/2)/(1-exp(-q/2)). This explicit bound supports the regression check; it is not an interval-arithmetic certificate.

## 3. Poisson step and why b_decay>1 matters
Native applies Real.tsum_eq_tsum_fourier_of_rpow_decay with continuous f, decay exponent 2>1, both big-O hypotheses, and x=0. Here decay exponent is unrelated to the complex linear coefficient b. In human terms, periodize P(x)=sum_n f(x+n). On x in [0,1] the tail is uniformly bounded by a convergent constant multiple of sum |n|^-2 (finitely many terms omitted from the bound). P is continuous and periodic. Its kth Fourier coefficient, by uniform absolute convergence and substitution y=x+n, equals integral_R f(y)exp(-2pi i k y)dy=Ff(k); integer periodicity removes exp(2pi i k n). The absolutely summable Fourier samples form a uniformly convergent continuous Fourier series with these same coefficients. Uniqueness of Fourier coefficients for continuous periodic functions (e.g. Fejer convergence) identifies it with P. At x=0 each Fourier phase is 1, so sum f(n)=sum Ff(n). Factor the constant outside the absolutely convergent sum. Native generic theorem uses the summable restriction lemma and Real.tsum_eq_tsum_fourier; Fourier uniqueness is cited here, not re-elaborated. A general O(1/|n|) upper bound would not guarantee absolute summability, so the strict >1 condition is necessary for this route.
Set b=0 for Complex.tsum_exp_neg_mul_int_sq. Restrict to positive real a for Real.tsum_exp_neg_mul_int_sq; the principal power equals the positive real power. For Re(a)=0 or negative, even b=0 may give nondecaying or growing summands. No extension to such a asserted. At x=0 replacing +i b with -i b inside the bilateral sum leaves it unchanged by n -> -n; the actual Fourier transform sign must instead be checked at nonzero t. This prevents a falsely discriminating negative control.

## 4. Dependency and scope
Quadratic integral -> Gaussian Fourier transform + rapid decay -> general Poisson -> theta reciprocity (RUN19) -> weak/strong Mellin -> Hurwitz residue and boundary nonvanishing -> conditional Landau zero-free implication. No RH premise is used in this local analytic argument. Retain 0<theta<1, delta>0, exceptional real-pole positivity and original arithmetic window in the downstream criterion. No assertion about exceptional real zeros inside the strip, full RH, URT performance or independently validated Lean kernel. Native theorem references above are source matches, not a kernel dependency extraction.

## 5. Actual certificate
Executed JavaScript in the current tool environment. Extract fenced code and run with Node; integer Young checks test the alternative inequality 2|Bn|<=A n²+B²/A (same square identity with rescaling); complex double-precision samples test the actual series identity with analytical truncation estimates and scaled rounding tolerance. Neither finite checks nor floating tolerances prove the universal identity. Negative controls cover wrong square-root branch, Fourier sign at nonzero frequency, and missing strict positivity. 
```js
function certificate(){
 const add=([a,b],[c,d])=>[a+c,b+d], mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c], scale=([a,b],k)=>[a*k,b*k], abs=z=>Math.hypot(...z);
 const inv=([a,b])=>[a/(a*a+b*b),-b/(a*a+b*b)], exp=([a,b])=>[Math.exp(a)*Math.cos(b),Math.exp(a)*Math.sin(b)], sq=z=>mul(z,z);
 const sqrt=z=>{const r=abs(z);return [Math.sqrt((r+z[0])/2),Math.sign(z[1])*Math.sqrt((r-z[0])/2)]};
 const ck=(b,m)=>{if(!b)throw Error(m)};
 let exact=0,tests=0,neg=0,maxRelative=0,maxTail=0;
 for(let A=1;A<=12;A++)for(let B=-12;B<=12;B++)for(let n=-24;n<=24;n++){
  // 2 A |n| >= 0 and (A |n|-|B|)^2 >= 0 imply 2|B n| <= A n^2+B^2/A.
  let a=BigInt(A),b=BigInt(B),x=BigInt(n),t=b*x;t=t<0n?-t:t;
  ck(2n*a*t<=a*a*x*x+b*b,"Young bound");exact++;
 }
 function sums(a,b){
  const ai=inv(a),ib=mul([0,1],b),fac=inv(sqrt(a)),pi=Math.PI;
  const q1=pi*a[0],l1=2*pi*b[0],c1=0;
  const q2=pi*ai[0],l2=scale(mul(ai,ib),-2*pi)[0],c2=scale(mul(ai,sq(ib)),-pi)[0];
  function sum(q,l,c,term){
   const N=Math.ceil(Math.max(1,2*Math.abs(l)/q,Math.sqrt(90/q)))+2;
   let s=[0,0],norm=0;for(let n=-N;n<=N;n++){let z=term(n);s=add(s,z);norm+=abs(z);}
   const tail=2*Math.exp(c-q*(N+1)**2/2)/(-Math.expm1(-q/2));
   return {s,norm,tail};
  }
  let L=sum(q1,l1,c1,n=>exp(add(scale(a,-pi*n*n),scale(b,2*pi*n))));
  let R=sum(q2,l2,c2,n=>exp(scale(mul(ai,sq(add([n,0],ib))),-pi)));
  let r=mul(fac,R.s),res=abs(add(L.s,scale(r,-1))),norm=Math.max(1,L.norm+abs(fac)*R.norm);
  let tail=L.tail+abs(fac)*R.tail;
  return {res,norm,tail,L:L.s,R:r};
 }
 for(const ar of [.2,.5,1,2,4])for(const ai of [-2,-.5,0,.5,2])for(const br of [-.3,0,.3])for(const bi of [-.4,0,.4]){
  let x=sums([ar,ai],[br,bi]);ck(x.res<=x.tail+4e-13*x.norm,"complex Poisson");tests++;maxRelative=Math.max(maxRelative,x.res/x.norm);maxTail=Math.max(maxTail,x.tail/x.norm);
 }
 let v=sums([1,.7],[.2,.3]);ck(abs(add(v.L,v.R))>1e-2,"wrong sqrt branch");neg++;
 // a=1,b=i/4: a wrong sign in shift at x=0 is invisible by n->-n.
 // At nonzero Fourier frequency it is detectable; use a=1, b=i/4, t=1.
 ck(Math.abs(Math.exp(-Math.PI*.75**2)-Math.exp(-Math.PI*1.25**2))>.1,"wrong Fourier sign");neg++;
 ck(Math.exp(-Math.PI*(-1)*3**2)>1,"negative real part divergence");neg++;
 ck(abs(exp([0,-Math.PI*9]))===1,"zero real part term does not tend to zero");neg++;
 return {exact_young_checks:exact,complex_poisson_cases:tests,negative_controls:neg,max_scaled_residual:maxRelative,max_scaled_analytic_tail:maxTail};
}
console.log(JSON.stringify(certificate()));
```
Output: `{"exact_young_checks":14700,"complex_poisson_cases":225,"negative_controls":4,"max_scaled_residual":9.213443351805942e-16,"max_scaled_analytic_tail":1.162926982221157e-26}`.
 
## RESUME HERE
Expand actual integral_cexp_quadratic in Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean at M and N; preserve real/complex shifts, contour boundary estimates or holomorphic continuation used by the native proof, and principal complex powers. If source-linked root role coverage is still unavailable, keep these imported leaves separately labelled from authenticated dependencies; request exact root paths for Landau, zeroFree_of_rpow_window and Mathlib leaves. Arithmetic window supplier and independent kernel replay remain OPEN.
HANDOFF TO editor, integration, dependencies, kernel, audit, prime, math.

<!-- END VERBATIM specialists/landau_criterion/RUN20_COMPLEX_GAUSSIAN_POISSON.md -->


<!-- BEGIN VERBATIM specialists/literature_provenance/RUN20_SQUARE_ZERO_PD_EXTENSION_AND_NILPOTENCE.md -->
# RUN20 — Square-zero divided-power extension, sharp weight bound and functoriality
2026-11-25. SOURCE-MATCHED local reconstruction; not a complete RH proof. Continuation of RUN19 (598fc9c49d81b36810c3d3570dddc994966961cb), whose RESUME HERE specifically assigns these obligations. No physical Queue or gate changes.

Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity protocol, research log head, research state tail, protocol head, CI summary (run 45529563830 at 8d26a6b, not this run's verdict), recent commit list and math/structure/dependencies/kernel/integration/editor/audit handoffs (commit e2ce836,9d77c3e,276bc239,c50fdeaf,e5e626d,8d26a6b,1dfdae13). Recent Galois/theta/prime/Landau/geometry messages cover other subjects; not all detailed lane notes recovered. No duplicate task found in inspected notes.

## Native source
Repository leanprover-community/riemann-hypothesis pinned 40e56bab026552e089d7afcfeff08d2defb9c005. All line numbers below refer to:
src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean
GitHub returned pinned blob 6d297c66f38f4c8ec5e21ec7ffe2fc53a9960a49, matching RUN19. Upstream observed c40250a50104b7e02e7d74f658d00fa7b1f4827c (2026-11-25 02:09:34 UTC, merge PR1801); same path blob b2fb2ea7c10836b0ac385e6f875938eb99fb469b (unchanged since RUN19 observed head). Executed 27 substring anchor assertions, one pinned blob identity assertion, line LCS on pinned L20–202 against upstream entire file: 178/183. Upstream extDP begins L118, nilpotence L178, extMap compatibility L226. LCS is lexical, not proof equivalence. Blob identities returned by connector, not independently recomputed. Reproduce via git show PIN:PATH | git hash-object --stdin. No full upstream diff audit.

## Precise premises and proof
Let R be a commutative ring, I an ideal, κ divided powers on I, M an additive commutative group with R and opposite-R module actions satisfying IsCentralScalar (L18,72–74). The square-zero extension E=R⊕M has multiplication (a,u)(b,v)=(ab,av+bu); second summand square zero. Let J=pr^{-1}(I), pr first coordinate. Write γ_n(a)=κ.dpow n a (zero off I, including n=0), P_0(a)=0, P_{n+1}(a)=γ_n(a). Then Γ_n(a,u)=(γ_n(a),P_n(a)u) is the definition extDP (L79–80). No projectivity, flatness, characteristic-zero, invertible factorial or nilpotence assumption is needed for this construction.

Four predecessor identities, all for ideal elements:
- L28–37: Σ_{i+j=n}γ_i(a)P_j(b)=P_n(a+b) and swapped variant. For n=0 both vanish; for n>0 remove j=0 and reindex j−1, then use DP addition. Swapping the antidiagonal gives the other identity.
- L39–44: a P_n(a)=n γ_n(a). n=0 trivial, else use γ_1γ_{n−1}=nγ_n. No cancellation of n.
- L46–56: γ_m P_n+γ_n P_m=binom(m+n,m)P_{m+n}. If either index is zero, use γ_0=1. Otherwise multiply divided powers and apply Pascal to binom(m+n−1,m)+binom(m+n−1,n).
- L58–68: P_m(γ_n(a))P_n(a)=B(m,n)P_{mn}(a), with n≠0, where B counts unordered partitions of mn labelled objects into m blocks of size n (uniformBell). m=0 trivial; for m≥1 the left is γ_{m−1}(γ_n(a))γ_{n−1}(a) = B(m−1,n) binom(mn−1,n−1)γ_{mn−1}(a). Marking the unique block containing a distinguished object proves B(m,n)=binom(mn−1,n−1)B(m−1,n): choose the other n−1 elements then partition the remaining (m−1)n. All coefficients are integers; no division in R. n>0 is essential for this marking argument and for γ_n(a)∈I, not an extra restriction.

The eight fields of DividedPowers, exactly in source order (L81–127):
1. dpow_null: if (a,u)∉J then a∉I; both γ_n and P_n vanish, including n=0.
2. dpow_zero: if a∈I then Γ_0=(1,0).
3. dpow_one: Γ_1=(a,u) since γ_1(a)=a and γ_0(a)=1.
4. dpow_mem: n≠0 and a∈I imply γ_n(a)∈I; second coordinate unrestricted.
5. dpow_add: Γ_n(x+y)=Σ_{i+j=n}Γ_i(x)Γ_j(y). First coordinate is base DP add. Second coordinate is Σ γ_i(a)P_j(b)v + Σ γ_j(b)P_i(a)u=P_n(a+b)(u+v) by both predecessor convolution identities.
6. dpow_mul: for arbitrary y=(b,v)∈E and x=(a,u)∈J, Γ_n(yx)=y^nΓ_n(x). n=0 trivial. For n≥1, first coordinates agree by base scaling. Second coordinate on left equals b^{n−1}γ_{n−1}(a)(bu+av); right equals b^nγ_{n−1}(a)u+n b^{n−1}γ_n(a)v since y^n=(b^n,n b^{n−1}v). Equality follows from aP_n=nγ_n. Central scalar action is used; no division.
7. mul_dpow: Γ_m(x)Γ_n(x)=binom(m+n,m)Γ_{m+n}(x); first coordinate base DP product; second follows from predecessor Pascal identity above.
8. dpow_comp: for n≠0 and x∈J, Γ_m(Γ_n(x))=B(m,n)Γ_{mn}(x); first coordinate base DP composition; second follows from predecessor uniformBell identity above. Inner membership follows from field 4.

L131–135 fst_extDP/snd_extDP are explicit component projections, not extra hypotheses.

## Weight-loss-one nilpotence (L139–178)
Assume IsNilDP κ: there exists N∈ℕ such that every finite list (n_i,a_i) with a_i∈I and Σn_i≥N has ∏γ_{n_i}(a_i)=0. This is a divided-power weighted product hypothesis, not just ordinary nilpotence of each a_i. For x_i=(a_i,u_i)∈J and total weight W≥N+1, the first coordinate of ∏Γ_{n_i}(x_i) is the base product, hence zero. Its second coordinate is
Σ_i [P_{n_i}(a_i) ∏_{j≠i}γ_{n_j}(a_j)]u_i.
This follows by finite-list induction using square-zero multiplication (terms with ≥2 module factors vanish). Terms with n_i=0 vanish; each remaining coefficient is a product of base divided powers of total weight W−1≥N, hence zero. Thus extDP has weighted bound N+1. Native proof uses auxiliary first-coordinate product f, projected membership m, and strengthened induction s with an additional scalar-product list l₀; their respective premises are L141–145,146–149,150–152. In cons case, the contribution from the tail is killed by applying induction with the head's unmodified weight added to l₀; the head module contribution is killed using base hN with the head weight reduced by one (L160–174). This proves the same expanded sum including empty lists and arbitrary zero weights. Final L175–178 uses empty l₀. No assumption of equality of *minimal* bounds; N+1 is an upper bound.

Sharpness control: for p=2,3, R=F_p[t]/(t^p), I=(t), M=R, γ_n(a)=a^n/n! for n<p and zero for n≥p on I (outside I zero). These are valid PDs: at total weight <p factorial identities have units; at ≥p relevant positive-weight products vanish; composition also has matching zero or ordinary integer coefficient. Base bound p holds and is minimal because t^{p−1}≠0. But Γ_p(t,1)=(0,t^{p−1}/(p−1)!)≠0. Hence the original bound N cannot be preserved in general. This is a regression and an exact counterexample to a stronger universal bound, not a counterexample to the native theorem.

## Functoriality (L180–202)
Given commutative R', ideal I', divided powers κ', central bimodule M', ring map σ:R→R' satisfying IsDPMorphism κ κ' σ, and σ-semilinear u:M→M', F(a,v)=(σ(a),u(v)) is a ring homomorphism (unit, zero, add, product follow coordinatewise using semilinearity). It maps J into J' because σ(I)⊆I'. For a∈I, FΓ_n(a,v)=(σγ_n(a),u(P_n(a)v))=(γ'_n(σa),P'_n(σa)u(v))=Γ'_n(F(a,v)); n=0 uses P_0=0, n>0 uses original DP morphism at n−1. This proves both fields of IsDPMorphism_extMap, not just compatibility on individual DP values. Projection pr is a PD morphism by first-coordinate formula and map/comap inclusion (L201–202); inclusion a↦(a,0) is a PD morphism (L255–258). The latter source boundary located and algebraically reconstructed. No assumption that σ or u is injective or surjective.

## External assumption ledger delta
- dpPred, extDP, extMap, pr: explicit definitions, not axioms or citations. extDP has eight explicit field bodies. dpPred_dpow and three preceding identities, fst/snd_extDP, isDPNilpotent_extend, isDPMorphism_extMap, isDPMorphism_pr, isDPMorphism_inl: explicit theorem bodies, not wrappers of postulates. No new premises introduced.
- Base κ, κ', their DP laws, IsCentralScalar, module structures, h:IsNilDP κ (only nilpotence result), h:IsDPMorphism κ κ' σ and semilinear u (only map result): actual local inputs, not established for arbitrary target geometric object by these proofs.
- Imported Mathlib DP axiomatic *structure fields* of supplied κ, Nat.uniformBell_succ_left, Nat.choose_succ_succ', Nat.choose_symm_add, TrivSqZeroExt.snd_pow and component identities, List.prod operations, Ideal.map_le_iff_le_comap: imported results or definitions, not independently traced to kernel proof in this run. No independent citation authentication. Proof that base inputs hold in geometric consumers remains separate.
- Direct source edge extDP→isDPDer_of_map via extDP.dpow_mul at L235 (RUN19); isDPNilpotent_extend→existsUnique_isConn_of_lift L440; isDPMorphism_extMap→IsConn.pull L323. These are visible source references, not authenticated elaborated edges. No verified Main-root path to these leaves, transitive axiom audit, Lean replay or URT speed claim.

## Executed certificate
JS finite model test, actually executed in tool sandbox. Two exhaustive finite sets: p=2 E size 16, J size 8; p=3 E size 729, J size 243. Check all eight fields for indices 0..p+1 (composition inner index positive); all ideal pairs for add, all ring factors for scaling, all ideal elements for product and composition. Functor tested on evaluation at t=0, σ:R→F_p, u same on module, hence noninjective; encode target as constant-coordinate subring. Projection and inclusion also tested. Integer Bell arithmetic uses BigInt factorial only in integer coefficient computation, not division in R. Nil reachability computes sets of products at each total positive weight; zero-weight factors are 1. All positive weights >p+1 give zero by a single factor if its weight exceeds p, or by prefix reaching at least p+1 and the general formula; finite checker only explicitly explores weights ≤p+1. 
Executed output:
p=2 counts null32,zero8,one8,mem24,add256,scale512,product128,composition96,functor32,projection32,inclusion8; nil transition enumerations168; reachable cardinalities [1,8,2,1]; sharp control1.
p=3 counts null2430,zero243,one243,mem972,add295245,scale885735,product6075,composition4860,functor1215,projection1215,inclusion45; nil transitions191970; reachable cardinalities [1,243,27,3,1]; sharp control1.
180 integer combinatorial checks. One nil-bound assertion per model. No universal proof by finite regression, no native kernel execution. Reproduce with Node by extracting the following JS block:
```js
function certificate(){
const ck=(x,m)=>{if(!x)throw Error(m)};
const fact=n=>{let v=1n;for(let i=2;i<=n;i++)v*=BigInt(i);return v};
const choose=(n,k)=>k<0||k>n?0n:fact(n)/fact(k)/fact(n-k);
const bell=(m,n)=>n===0?(m===0?1n:0n):fact(m*n)/(fact(n)**BigInt(m)*fact(m));
let combinatorics=0;
for(let m=1;m<=6;m++)for(let n=1;n<=6;n++){ck(bell(m,n)===choose(m*n-1,n-1)*bell(m-1,n),"Bell recurrence");combinatorics++}
for(let m=1;m<=12;m++)for(let n=1;n<=12;n++){ck(choose(m+n-1,m)+choose(m+n-1,n)===choose(m+n,m),"Pascal");combinatorics++}
function run(p){
const q=p**p, w=Array.from({length:p},(_,i)=>p**i),v=Array.from({length:q},(_,x)=>w.map(z=>Math.floor(x/z)%p));
const encode=z=>z.reduce((s,a,i)=>s+(a%p)*w[i],0);
const A=Array.from({length:q},(_,a)=>Array.from({length:q},(_,b)=>encode(v[a].map((x,i)=>x+v[b][i]))));
const M=Array.from({length:q},(_,a)=>Array.from({length:q},(_,b)=>{let z=Array(p).fill(0);for(let i=0;i<p;i++)for(let j=0;i+j<p;j++)z[i+j]+=v[a][i]*v[b][j];return encode(z)}));
const power=(a,n)=>{let z=1;for(let k=0;k<n;k++)z=M[z][a];return z};
const sc=(a,k)=>M[a][Number(k%BigInt(p))];
const gamma=(n,a)=>a%p?0:n>=p?0:sc(power(a,n),n===2?2n:1n);
const pred=(n,a)=>n===0?0:gamma(n-1,a);
const E=q*q, fst=x=>x%q,snd=x=>Math.floor(x/q),pair=(a,b)=>a+q*b;
const add=(x,y)=>pair(A[fst(x)][fst(y)],A[snd(x)][snd(y)]);
const mul=(x,y)=>pair(M[fst(x)][fst(y)],A[M[fst(x)][snd(y)]][M[fst(y)][snd(x)]]);
const epow=(x,n)=>{let z=1;for(let i=0;i<n;i++)z=mul(z,x);return z};
const esc=(x,k)=>pair(sc(fst(x),k),sc(snd(x),k));
const D=Array.from({length:p+2},(_,n)=>Array.from({length:E},(_,x)=>pair(gamma(n,fst(x)),M[pred(n,fst(x))][snd(x)])));
const J=Array.from({length:E},(_,x)=>x).filter(x=>fst(x)%p===0);
const C={null:0,zero:0,one:0,mem:0,add:0,scale:0,product:0,composition:0,functor:0,projection:0,inclusion:0,nil:0,sharp:0};
for(let x=0;x<E;x++)if(fst(x)%p)for(let n=0;n<=p+1;n++){ck(D[n][x]===0,"null");C.null++}
for(const x of J){
ck(D[0][x]===1,"zero");C.zero++;ck(D[1][x]===x,"one");C.one++;
for(let n=0;n<=p+1;n++){
if(n){ck(fst(D[n][x])%p===0,"mem");C.mem++}
for(const y of J){let z=0;for(let i=0;i<=n;i++)z=add(z,mul(D[i][x],D[n-i][y]));ck(z===D[n][add(x,y)],"add");C.add++}
for(let r=0;r<E;r++){ck(D[n][mul(r,x)]===mul(epow(r,n),D[n][x]),"scale");C.scale++}
for(let m=0;m<=p+1;m++){
let k=m+n;ck(mul(D[m][x],D[n][x])===esc(k<=p+1?D[k][x]:0,choose(k,m)),"product");C.product++;
if(n){k=m*n;ck(D[m][D[n][x]]===esc(k<=p+1?D[k][x]:0,bell(m,n)),"composition");C.composition++}
}
let mapped=pair(fst(D[n][x])%p,snd(D[n][x])%p);
let expected=n===0?1:n===1?q*(snd(x)%p):0;
ck(mapped===expected,"functor sigma=constant,u=constant to Fp");C.functor++;
ck(fst(D[n][x])===gamma(n,fst(x)),"projection");C.projection++;
if(snd(x)===0){ck(D[n][x]===gamma(n,fst(x)),"inclusion");C.inclusion++}
}}
const reachable=Array.from({length:p+2},()=>new Set());reachable[0].add(1);
for(let k=1;k<=p+1;k++)for(let n=1;n<=k;n++)for(const z of reachable[k-n])for(const x of J){reachable[k].add(mul(z,D[n][x]));C.nil++}
ck(reachable[p+1].size===1&&reachable[p+1].has(0),"nil bound");ck(D[p][pair(p,1)]!==0,"sharp one weight");C.sharp++;
return {p,E,J:J.length,reachable:reachable.map(s=>s.size),C};
}
return {combinatorics,models:[run(2),run(3)]};
}
console.log(JSON.stringify(certificate()));
```

RESULT: DONE local source-matched eight-field construction, predecessor identities, nilpotence and functoriality. PARTIAL transitive assumption audit. RESUME HERE: reconstruct IsDPDer.isDPMorphism L242–251, secMor/inlMor/prMor L264–278 and existsUnique_isConn L356–383 from pinned same file, retaining base-change IsBC and both tensor component maps; trace the actual proof suppliers for H.1/H.2 separately from assumptions. Then reconcile isBC_of_lift L400–428 and existsUnique_isConn_of_lift L430–441. Request authenticated role-labelled Main-root paths for these declarations and extDP from dependency/kernel lanes. HANDOFF TO literature, dependencies, kernel, integration, editor, geometry, audit. RH reconstruction OPEN, no independent Lean validation or URT improvement.

<!-- END VERBATIM specialists/literature_provenance/RUN20_SQUARE_ZERO_PD_EXTENSION_AND_NILPOTENCE.md -->


<!-- BEGIN VERBATIM specialists/on_acceleration/RUN20_RESUME.md -->
# RUN20 — compact full-manifest projection and all-row roundtrip (2026-11-25)

RESULT: PASS for exact full-projection roundtrip and native lookup; PARTIAL for construction timing, durable shared artifact and overall proof. Source [pinned Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean), blob dbd5db70bc11b35f18fa5751216ab335321e7bfc re-fetched: riemannHypothesis := rhOfAll. Source pin and export identity are distinct. Run19 prior checkpoint e5380ad558455902a9602b33ebbd4c34742ed1af. Latest peer notes read via commit diffs across 14 lanes (integration e5e626d, dependencies 32d64e9, structure 167b33e, kernel e14abc2, theta bdb5bc7, Galois 108f870, geometry 25f653e, others); editor patch lacked RESUME HERE. Read protocol, queue, expansion, AGENTS and research state excerpts; root-level log/protocol paths returned 404; correct archive paths and blueprint not reread. No upstream main freshness comparison performed here; no repinning or source-equivalence inference.

## Real data and certificate

Downloaded artifact [14931267327 / run 45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798), ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97, extracted job/outputs/reachable_declarations.jsonl.zst, SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf. Native append-order SQLite projection: 1,484,705 rows; 3,035,045 signed hard-root entries and 1,460,414 metadata entries counted. Source row order is not sorted by declaration ID. Store ordinal, exact tagged name, terminal, kind, all signed refs and SHA256 of the complete raw row. Keep the original authenticated manifest as the evidence store; mutualBlock contents and raw row bytes are not independently stored in this compact projection. It is NOT a replacement for Run19 raw-row store or complete graph.

Native build process reached a committed temporary database but exceeded tool execution limit before publication; no complete build timing or build peak RSS available. Recovered database had exact receipt, 1,484,705 rows and quick_check ok. Reopened native full streaming roundtrip compared every projected field and complete-source-row digest for all rows in 18.951585 s (isolated process peak 168324 KiB); full integrity_check with 256 MiB cache passed in 2.631857 s, then atomic rename + directory fsync. Final database 390,791,168 bytes versus Run19 raw database 1,067,364,352 bytes (63.4% smaller, different payload). This is not a matched build-speed improvement; clustered compact baseline implemented but unrun. Final local DB SHA256 6967b534c57a38bdec7deced48f8b2756c0bfade7f1454c5f1f0fe6c38e3403d after rollback controls; not uploaded and not assumed persistent across sessions. Code blob 80bd60e3884d62ecccd1c439e6a3ab9b78ff6932 matched native executed file, code commit 5aaea4f071b7111afae9be6c936fddbfae7445c8.

## Same twelve exact declaration requests

Conventional single streaming scan (includes source authentication, projecting and hashing every row) 16.616130 s. Cached lookup excludes build and full reauthentication cost; reopened connection is NOT cold storage. 11 trials per schedule per state, 66 exact comparisons; 12 exact name checks, missing-name and ambiguous terminal controls passed. Benchmark process peak 100120 KiB includes scan. Warm timing excludes connection opening and previous equality check. No repeated baseline trials; no URT-specific performance claim.

| schedule | reopened median ms | warm median ms |
|---|---:|---:|
| shared | 0.243242 | 0.067131 |
| golden | 0.198084 | 0.071046 |
| periodic | 0.182921 | 0.068812 |

Negative controls executed against temporary uncommitted modifications of first row: refs='[]', digest=zeroblob(32); both rejected at row 1; transactions rolled back. No supplied projected hard-root entry omitted. The census/range checks do not prove that all inner expression dependencies have been extracted or that every reference is correct in Lean. Metadata remains available in pinned manifest, not interpreted as a hard edge. Source lexical reference, import graph, declaration root reference and actual elaborated expression-constant edge remain different evidence classes. No premises removed.

## Exact manifest root handoff

Expression roots below are zero-based; manifest positive refs are 1-based. For these thm/def rows with two positive refs, subtract one from the type and value root. Names exact, but source binding and incoming path not newly authenticated by this lookup.

| declaration | id | type root | value root |
|---|---:|---:|---:|
| UpperTheory.TP.TLiftK | 13125905 | 3 | 997984088 |
| UpperTheory.Gal.Int.coreAll_of | 13208115 | 1002624501 | 1002624515 |
| UpperTheory.Gal.Int.rest | 13172410 | 1000095279 | 1000095288 |
| UpperTheory.Gal.Spc.specAlg | 13962369 | 1059634995 | 1059646507 |
| PositivityTheory.Rg.Sw.HSt.holLeadB | 8996470 | 720757039 | 722118273 |
| PositivityTheory.Rg.Sw.HSt.locTau | 8996093 | 721752893 | 722068160 |

Integration explicitly requests role-separated outgoing evidence for coreAll_of and rest from existing 151-owner projection. These roots identify their expressions, not the outgoing edges. Dependency lane owns 151-owner validation, kernel owns raw-term replay and TLiftK occurrence paths, structure owns CSR/compression; do not duplicate them.

## Replay / complexity

```sh
set -eu
python compact_run20.py build manifest.zst append.sqlite append
python compact_run20.py verify manifest.zst append.sqlite append
python compact_run20.py bench manifest.zst append.sqlite append
# Matched construction comparison, not yet executed:
python compact_run20.py build manifest.zst clustered.sqlite clustered
python compact_run20.py bench manifest.zst clustered.sqlite clustered
```

If killed before publication, do not use a temporary DB until exact receipt, count, full streaming verification and integrity_check pass; then publish atomically. The script uses no assertions for primary checks; ValueError or SQLite failure exits nonzero. Negative controls reproduced by opening a transaction on a verified DB, changing first row refs or digest, calling verify and requiring ValueError, then rollback. Authentication checks input bytes, and full roundtrip checks the cached projection; normal receipt-only lookup does not independently detect arbitrary post-build corruption. Concurrent publishers still require external single-writer coordination (existence check alone is not a lock). Stream pass cost O(expanded source bytes + signed refs + maxID/8) under fixed row schema, plus SQLite index sorts/B-tree cost (not strictly linear); append-order verification sequential row traversal, query O(Q log N + output) plus optional O(Q log Q) ordering. RSS includes process and subprocess effects as reported by native process HWM; not system-wide aggregate memory. No independently measured physical I/O or true cold storage. No kernel replay, no full human proof, no new mathematical closure.

RESUME HERE: split build and verified publication into independently timed stages with exclusive publisher lock; execute matched clustered vs append compact builds with identical cache and verification, record phase timing, isolated RSS and amortization, and seek authorized durable artifact reuse without giant Git blob. Deliver coreAll_of/rest roots to integration and dependencies; leave their outgoing projection validation to that lane. HANDOFF TO integration, dependencies, kernel, Galois, theta, structure, audit. Project OPEN.

<!-- END VERBATIM specialists/on_acceleration/RUN20_RESUME.md -->


<!-- BEGIN VERBATIM specialists/positivity_geometry/RUN21_POLYNOMIAL_NULL_SETS_AND_BLOCK_SPHERE.md -->
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

<!-- END VERBATIM specialists/positivity_geometry/RUN21_POLYNOMIAL_NULL_SETS_AND_BLOCK_SPHERE.md -->


<!-- BEGIN VERBATIM specialists/prime_window/RUN20_SHARP_CB_LARGE_THRESHOLD.md -->
# RUN20 — Fixed family positivity and sharp CbLarge threshold

2026-11-25. RESULT: SOURCE-MATCHED / independent human derivation; residual admission condition now has an exact necessary and sufficient fixed-constant threshold. Conditional on the existence of a native FamP. No claim that the source constructs such a FamP, that these declarations are root-reachable, or that Lean replay or URT acceleration was achieved.

P = 40e56bab026552e089d7afcfeff08d2defb9c005. H = c40250a50104b7e02e7d74f658d00fa7b1f4827c (observed upstream head, merge PR #1801; differs from RUN19's 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061; commit distance not computed).

Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN19, research state/log/protocol/continuity excerpts and physical CI summary checkpoint 410 (45527764744, 02:03:57 UTC, not RH validation). Reviewed latest 40 working branch commit subjects and available peer handoffs from integration, acceleration, geometry, literature, math, dependency, kernel, audit and structure; no duplicate detected. Some peer full files and linked blueprint PDF not reopened; no claim of exhaustive duplicate search. Native code search for CbLarge and place existence returned no hits; absence not established. No changes to other lanes or physics.

## Source anchors (all P; paths under src/Formalism/)
- SharpRestriction/ParConsts.lean c3a5cddc3af0b027ad62b50a79cdb008712613a6 L31–55 FamP, sizes, GK, GK_nonneg; L62 fills, L79 rho_le.
- SharpRestriction/FamCore.lean 44cd54c38881086724fdf7f10f32b7d8e80e35b3 L74–85 Win_unb, Ix_win, L_x, L_eps; L138–142 FamCore.exists_pt.
- SharpRestriction/ElevenLe.lean 75f2ab1404c69a5d1330671d96d8f6cd35e74e52 L68 SizeLa; L134–138 SizesAt.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean 9fbb7879d0519f9a136e190551422881ef5d2f0b L14–33 Consts and Nonneg; L37–45 hG, KG, rG, N1, Gp; L58–66 La, rho, rhoB, CbLarge; L401–410 ParametersFill.
- LocalRingCardinality/RhoDetPrimeEqMuTildeMulChiPow.lean 6ab57a7f313a9f8c351005051933a60a22a0da08 L76–87 D7 and what₂, L106 nfLL, L134 plEq.
- LocalRingCardinality/DataParams₂.lean 50914500995df91e2646d91a6c5c99a7e603a51b L9–17 Scale, L27–45 L, b, a, delta1.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean c36e22ceab2885a6ab812f6187bfd1a86472a6ec L239–248 goodU, goodEll, orbitSmallMultiplicity, goodG', orbitWindowCount.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean 47c8e4430e4150f61202b8afa77ca2b6369c8043 L34–40 rE, cGE, cNE, L94–134 first_count_le_log (existing sufficient but nonsharp bound).
- RUN19_ARCHIMEDEAN_BAND_SUMS.md sections 3–4: eventual ArchimedeanSignatureMatching iff GK.rho=0 OR GK.La=0 OR eventual CbLarge, assuming FamP.

## 1. GK.La is positive already at FamP level, without admission

Fix eps and Fm:FamP eps. By FamCore.exists_pt with y=x1+1 choose x>x1 and i:Ix x. This is not a claim that every fibre is nonempty. Set D=D x i, L=L x i, s=L.sc, K=Fm.GK. Native D.nfLL makes F=D.what₂.LL a number field; D.plEq identifies the abstract places with HeightOneSpectrum of its ring of integers O_F.

Independent standard algebra proof of a place: the ideal (2) in O_F is nonzero and proper. If 2 were a unit then 1/2 would be an algebraic integer, which is impossible: substituting 1/2 into a monic polynomial of degree d>=1 over Z and multiplying by 2^d gives 1 plus a sum of even integers equal to zero. Since O_F is a domain of characteristic zero, (2) is nonzero. Choose a maximal ideal containing (2); it is a nonzero prime ideal, hence a height-one prime in the Dedekind domain O_F. Apply the inverse of D.plEq to obtain a genuine w. This does not require w in L.supp, a specified residual prime, a nonempty jet index type, or an additional assumption of admission. The exact Mathlib proof-term implementation of the maximal ideal and height-one construction is not yet checked.

Fm.fills x hx i w gives ParametersFill; its final conjunct is La K s=L.LaG. Fm.sizes x hx i gives SizesAt, whose ninth conjunct is SizeLa: x^eps<=L.LaG (using L_x and L_eps). Since x>1, x^eps>0. Thus
  0 < La K s = K.La * (N1 s)^2 * log(s.a).
In particular K.La cannot equal zero. K.Nonneg supplies 0<=K.La, so K.La>0. Alternatively the other two factors are positive because N1=ceil(max(...))+1>=1 and s.a=x exp(x^eps)>1. GK is fixed before x and i, so a single instance suffices. Consequently RUN17–19's positivity premise is derivable from FamP, not an independent admission premise. This does NOT prove FamP exists unconditionally.

## 2. Exact asymptotic slope of N1

Fix 0<eps<1/52 (eps fixed before any x threshold), denote Euler's number by E=exp(1), and use fresh letters to avoid conflation with native Scale.A=26. Set
  h=2+8 eps, r=ceil(8(h+2)/eps)+1, B=6r+1,
  A=(h+3)10^B, C=6 E B A,
  t=log x>0, u=x^(eps/8)>1.
Then delta1=1/u, and the pinned definitions give exactly
  M=ceil(A t), U=ceil(u), Gp=(M+5) B U,
  F=6 E B (M+5) U/u, G=(h+3)t/log 2,
  N1=ceil(max(F,G))+1.
All ceilings are natural ceilings on positive reals. From M>=A t and U>=u, and the added 5,
  F>C t.
Moreover C/(h+3)=6 E B 10^B>2>1/log 2 (log 2=integral_1^2 ds/s>1/2). Thus F>G for every x>1. It follows that the max is redundant on the original scale, and
  N1=ceil(F)+1 > C t.
For an upper bound, M<=A t+1 and U<=u+1 yield
  N1<=C t+6 E B(A t/u+6+6/u)+2.
For t>=1 (and u>=1) divide by t:
  0<N1/t-C<=C/u+(72 E B+2)/t.
Since eps>0 and t,u tend to infinity, this establishes the exact asymptotic slope and strict one-sided approach
  lim_(x->infinity) N1/log x = C, with N1/log x > C for all x>1.
This is not a numerical approximation. It explicitly retains the +5 and +1 offsets. Source first_count_le_log supplies a coarser upper constant; the above is an independent sharpening.

## 3. Sharp eventual threshold; no free choice of an already fixed GK.CN

Let c=K.CN. For any fixed c>C, put m=c-C>0. Choose x large enough to have
  log x>=max(1, 2(72 E B+2)/m), and x^(eps/8)>=max(1,2C/m).
One sufficient threshold is max(exp(max(1,2(72 E B+2)/m)), max(1,2C/m)^(8/eps)). Then both error terms in section 2 are <=m/2; hence N1<=c log x. Threshold depends only on eps and fixed c, not on i, w or p. Conversely if c<=C, strict lower bound makes CbLarge false at every x>1. In the family eventual statement, nonvacuity is guaranteed by FamCore.exists_pt beyond any proposed threshold. Hence
  Eventual(CbLarge GK) iff GK.CN>C(eps).
Equality at the limit is NOT sufficient because of strict positive ceiling/offset error. This sharp criterion is stronger than RUN19's necessary lower bound (h+3)/log 2 and avoids pretending that GK.CN>=cNE was forced by the source.

Combine with RUN19's band theorem and FamP.rho_le, and section 1:
  Eventual(ArchimedeanSignatureMatching) iff GK.rho=0 OR GK.CN>C(eps).
In particular this conjunct of admission is now reducible to an explicit condition on two fixed fields of FamP, not an unspecified eventual analytic premise. This does not authenticate a native constructor imposing that condition. No change to other admission conjuncts.

## 4. Upstream comparison
Exact text matches across P and H: orbit definitions P L239–248 -> H L247–256 (blob 1c9ff6676bad3634a65d75f248b53bb82c03d1ee); ParametersFill P L401–410 -> H L427–436 and hG through Gp P L37–45 -> H L75–83 (blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6); FamCore.exists_pt P L138–142 -> H L113–117 (blob 9b67d02e58d04ab1e14a73ed572b83e63cd49193); SizesAt P L134–138 -> H L138–142 (blob a4a8c76eb7c3cc38989a0afebe51075070941a63). H also displays same SizeLa L72, FamP sizes L43, GK_nonneg L54, fills L61, rho_le L78 (ParConsts blob 9c325c376642368457542fa7a47cb8488b799b16); D7.nfLL L102 and plEq L130 (blob c2025b4fc6e75beaab5b5b2596f9c9b773de0759). Not a full upstream equivalence claim.

## 5. Executed regression
The following standalone Node/V8 check tests the exact rational ceiling algebra, first branch dominance, strict boundary, upper envelope, ratio estimate and sufficient threshold. Inputs t,u,E,log2 are independent rational proxies in the appropriate ranges (not actual native epsilon and x or actual transcendental constants); the proof above, not this regression, handles the real/native definitions. A and B are deliberately small proxies. The two final negative assertions are basic sign witnesses, not tests of the actual D7 geometry. No Lean replay or CI validation of this new artifact.
```js
const q=(n,d=1n)=>[BigInt(n),BigInt(d)];
const add=(a,b)=>[a[0]*b[1]+b[0]*a[1],a[1]*b[1]], mul=(a,b)=>[a[0]*b[0],a[1]*b[1]], div=(a,b)=>[a[0]*b[1],a[1]*b[0]];
const le=(a,b)=>a[0]*b[1]<=b[0]*a[1],lt=(a,b)=>a[0]*b[1]<b[0]*a[1];
const ceil=a=>q((a[0]+a[1]-1n)/a[1]);
const counts={firstDominates:0,strictSlope:0,upper:0,ratio:0,threshold:0,boundary:0,negative:0};
function ck(b,k){if(!b)throw Error(k);counts[k]++}
for(const A0 of [5,13,100,1000])for(const B0 of [1,7,13])for(let i=4;i<=40;i+=3)for(let j=3;j<=60;j+=4)for(const E of [q(5,2),q(11,4)])for(const log2 of [q(2,3),q(3,4)]){
 const A=q(A0),B=q(B0),t=q(i,4),u=q(j,3),H=q(5),D=mul(q(6),mul(E,B)),C=mul(D,A);
 const F=div(mul(D,mul(add(ceil(mul(A,t)),q(5)),ceil(u))),u),G=div(mul(H,t),log2);
 const N=add(ceil(le(G,F)?F:G),q(1)), base=mul(C,t);
 const err=add(mul(D,add(div(mul(A,t),u),add(q(6),div(q(6),u)))),q(2));
 const ratioErr=add(div(C,u),div(add(mul(q(12),D),q(2)),t));
 ck(lt(G,F),"firstDominates");ck(lt(base,N),"strictSlope");
 ck(le(N,add(base,err)),"upper");ck(le(div(N,t),add(C,ratioErr)),"ratio");
 ck(!le(N,base),"boundary");
 for(const m of [q(1),q(100),q(10000)]){
   if(le(div(mul(q(2),C),m),u)&&le(div(mul(q(2),add(mul(q(12),D),q(2))),m),t))
    ck(le(N,mul(add(C,m),t)),"threshold");
 }
}
ck(lt(q(0),q(1))&&!lt(q(0),q(0)),"negative");
ck(!le(q(2),q(1)),"negative");
console.log(JSON.stringify(counts));
```
Actual execution: {"firstDominates":9360,"strictSlope":9360,"upper":9360,"ratio":9360,"threshold":8424,"boundary":9360,"negative":2}.

## RESUME HERE
Request independent audit of the nonzero prime ideal/height-one place argument, the strict threshold and family quantifier scopes. Locate the actual native FamP/DFamP constructor or trace the first not-yet-reconstructed residual admission predicate in SmallOrderPrimes.lean if no such constructor is authenticated; do not choose GK.CN after x or assert that the fixed coefficient satisfies the new inequality without source evidence. Request role-labelled root paths for FamP, ArchimedeanSignatureMatching and CbLarge from dependency/kernel lanes. HANDOFF TO audit, dependency, kernel, integration, editor, prime_window. Full RH project OPEN.

<!-- END VERBATIM specialists/prime_window/RUN20_SHARP_CB_LARGE_THRESHOLD.md -->


<!-- BEGIN VERBATIM specialists/theta_lifts/RUN20_SINGULAR_TEST_VACUUM_FOURIER_SUPPORT.md -->
# RUN20 — Singular tests annihilate the lower-rank vacuum
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction; global linkage and imported analytic suppliers PARTIAL/OPEN. Baseline P=40e56bab026552e089d7afcfeff08d2defb9c005 in leanprover-community/riemann-hypothesis. Observed latest commit H=c40250a50104b7e02e7d74f658d00fa7b1f4827c. Prior theta RUN19 bdb5bc7664e9bb15ff64b30452b385dd56b163e1 assigned this exact task; no duplicate found in recent peer commits. Read AGENTS, swarm protocol, handoff queue, expansion, research state/log/protocol and continuity excerpts, CI summary 45529563830 (physics checks only). Inspected recent peer commit diffs and available RESUME HERE notes for integration, dependency, structure, math, audit, acceleration, kernel, prime, Landau, Galois, windows, literature, geometry and editor; not all full peer files or external blueprint reread. No changes to physics queue. Kernel run20 c50fdeaf supplies TLiftK witness work, not a confirmed root path for this local theorem.
 
All paths below relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/; C= CayleyCosetSums/, M=MollifiedIntegrability/. Native namespace PositivityTheory.Rg.Sw.HSt.L3 for the local producers; HSt.lt3 consumes them. This is a source reference chain, not an elaborated kernel DAG.

## 1. The exact statement and test condition
IsSingTest:13–35 defines J=[[0,I],[-I,0]], G={g:g†Jg=J}, K={g∈G:g†g=I}, Herm(s)_{ij}=(s_ij+s_ji)/2+i(s_ij−s_ji)/2 on real n×n coordinates, nU(S)=[[I,S],[0,I]], u1(g)=i C_g+D_g. All determinants are complex; integration uses the native volume on the real coordinate space. A test ψ is continuous, compactly supported, and for EVERY Hermitian β with det β=0,
    ∫ ψ(s) exp(2π i tr(β Herm(s))) ds = 0.
This is vanishing on singular frequencies, not support of ψ in the singular set, nor pointwise Fourier vanishing everywhere. No differentiability of ψ is required. From LocTauAlt:18 and SecondCoordMulInner:16, fz(m,e,0,g)=det(g)^e det(u1(g))^(−m).
C/EventuallyUnit:64–66: for natural m,n with m<n, integer e (including negative), arbitrary y,b∈G, and every such ψ,
    ∫ fz(m,e,0,y nU(Herm(s)) b) ψ(s) ds = 0.
No extra nonsingular-block hypothesis in this final statement. n≥1 follows; m=0 is allowed.

## 2. The central Fourier mechanism (C/TraceTransposeMul:18–30; C/InnerGen:13–151)
For X∈C^(m×n), the all-true Gram matrix G_X= X†X by the actual definition (TraceTransposeMul:19). rank(G_X)≤rank(X)≤m<n, so det G_X=0. This strict inequality is needed for this universal rank statement: at m=n choose X=I. That control does not assert failure of every possible conclusion outside the hypotheses.

For invertible R∈C^(n×n), Hermitian H0, define B_s=R^(-1)(H0+Herm(s))(R^(-1))†. B_s is Hermitian; I−i B_s is invertible (M/GaussM:85, since the Hermitian eigenvalues are real, or use the native quadratic-form contradiction). Factor
    RR†−i(H0+Herm(s))=R(I−i B_s)R†.
The original imported Gaussian base theorem (InnerGen:60–68, exact parameters ε≡true, c=t=1, P=1) gives
    secN(B_s)=(π^n/det(I−i B_s))^m
            =∫ evX(1,X) gs(1,X) exp(i tr(B_s G_X)) dX.
Here evX and gs are native polynomial evaluation and Gaussian weight, not fitted replacements. Thus the target integrand ψ(s) det(RR†−i(H0+Herm(s)))^(−m) equals ψ(s) secN(B_s) times the constant
    [det R det R† π^n]^(−m).
The denominators are all nonzero by invertibility of R, Hermiticity of B_s, and π≠0. No restriction m>0 needed.

Set A_X=(R^(-1))† G_X R^(-1). Hermitian congruence preserves Hermiticity and singularity. By cyclicity and transpose invariance of trace,
    tr(B_s G_X)=tr(H0 A_X)+tr(Herm(s)^T A_X^T)
              =tr(H0 A_X)+tr(A_X Herm(s)).
The original source uses Q=A_X^T and inner_gen:13–34 with β=Q^T/(2π)=A_X/(2π). Transposition preserves Hermiticity and determinant zero; scaling by the nonzero real number 1/(2π) preserves them. Therefore
    ∫ ψ(s) exp(i tr(B_s G_X)) ds
    =exp(i tr(H0 A_X)) ∫ ψ(s) exp(2π i tr(β Herm(s))) ds=0.
This is a Gaussian mixture of Fourier modes of rank at most m, not a numerical cancellation. The original Fubini obligation is essential: |exp(i tr(B_s G_X))|=1 because trace of product of two Hermitian matrices is real (M/GaussM:28–42). The joint continuous integrand is dominated in absolute value by |ψ(s)| |evX(1,X) gs(1,X)|. The first factor is integrable by continuous compact support, the second by M/ContinuousGramX:12 integP (supplier GI.integP). InnerGen:94–111 supplies product integrability and :145–151 swaps integrals. Hence core2 yields
    ∫ ψ(s) det(RR†−i(H0+Herm(s)))^(−m) ds=0.
Gaussian base and GI.integP bodies not expanded here; they remain genuine imported obligations, not assumed new axioms.

## 3. Translate the group integral to the Gaussian kernel (C/Imports:35–93; C/SecondCoordMulInner:25–88; C/VanishInv:13–25)
First assume the lower-left block C of y is invertible. Let D be its lower-right block, U=u1(b), V=v1(b)=i A_b+B_b, P0=VU^(-1). From b†Jb=J, U†V−V†U=2iI. This implies U invertible: if Uv=0 then the quadratic form of the left side is zero, whereas the right is 2i||v||². The analogous argument works for all group elements.
Also yJy†=J follows using y^(-1)=−Jy†J, and its lower-right block gives CD†=DC†, hence C^(-1)D Hermitian. Multiplying U†V−V†U by (U^(-1))† and U^(-1) gives
    P0−P0†=2i (U^(-1))† U^(-1).
Choose R=(U^(-1))†, H0=(P0+P0†)/2+C^(-1)D, κ=det C i^n det U. R invertible, H0 Hermitian, κ≠0. The block multiplication identities give
    u1(y nU(S)b)=C V+(CS+D)U
               = C i[RR†−i(H0+S)] U.
Taking determinants gives factor's exact identity for every complex matrix S. As det nU(S)=1, the full integrand for S=Herm(s) is the kernel from section 2 times constant
    (det y det b)^e κ^(−m).
Thus vanish_inv follows, including e negative. No division by the integral itself.

## 4. Remove the invertible lower-left block premise (C/DetFirstCayleyBlockNeGroup:14–68; C/EventuallyUnit:14–110)
Use the lower shear nbar(t)=[[I,0],[tI,I]], t real. It belongs to G; its right action changes C to C+tD. The polynomial p(z)=det(C+zD) cannot be identically zero because at z=−i,
    p(−i)=(-i)^n det(iC+D)≠0.
The last nonvanishing uses the group relation U†V−V†U=2iI as above (native proof uses the negative of that identity). A nonzero polynomial has finitely many real roots, so for every sufficiently small nonzero t, C+tD is invertible. This is a punctured-neighborhood assertion, not an assertion about t=0.

Let F(t)=∫ fz(m,e,0,y nbar(t)nU(Herm(s))b)ψ(s) ds. All group products lie in G, both det(g) and det u1(g) are nonzero, and ψ is continuous. On the fixed compact topological support of ψ the integrand is jointly continuous, so continuous_parametric_integral_of_continuous gives continuity of F (EventuallyUnit:87–99). The full integral equals the integral on this support (95–97). From vanish_inv, F(t)=0 on the punctured neighborhood. Continuity and uniqueness of the limit give F(0)=0; nbar(0)=I. This proves vanish_all without the generic-block assumption, including cases y=I where C=0. The proof does not assume the original group itself is compact.

## 5. Exact consumer and remaining linkage
C/MultiplicityOneTestOperatorsAlt:33–37 (SingularTestsKillVacuum) additionally quantifies over a compact topological group Kg with measurable/Borel structures, Haar measure μ, continuous homomorphism ι:Kg→M2 n whose image is exactly InK, continuous ρ:Kg→C, ψ as above and a,b,x∈G. All premises retained even if some are unused in the final zero step. For each k, xι(k)a∈G; apply vanish_all with y=xι(k)a. Then the inner integral in tOp (LocTauAlt:29–31) is identically zero, so its ρ-weighted Haar integral is zero. This is exactly HSt.lt3 (C/SingularTestsKillVacuum:11–22), supplied to locTau := asmLT lt1 lt2 lt3 crux. RUN19 showed how this supplies c(0)=0, while Crux supplies c'(0)≠0. This is NOT a claim of annihilation of all sections or all Fourier modes. The argument has conventional Gaussian, Hermitian linear algebra, Fourier and continuity ingredients; no independent bibliographic attribution or new published result status established for these particular local theorems. No explicit sorry in the examined bodies is not a transitive axiom audit. The root linkage to every_character_of_literature_of_vWin still needs authenticated role-labelled kernel paths.

## 6. Source changes and actual checks
H consolidates the local chain in C/LocTau.lean (blob unchanged from previous H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061). H declaration lines: det_first_cayley_block_ne_group 676, factor 721, det_gram_eq_zero 801, inner_gen 839, core2 863, vanish_inv 1000, eventually_unit 1035, vanish_all 1079, lt3 1146, locTau 1172. Old EventuallyUnit path returns 404 at H; this is relocation not proof deletion. H has refactored helper usage (e.g. L1118 HolB.inG_mul). No assertion of complete semantic equivalence or repinning.
Executed connector JS source checks against P and H: 14/14 GitHub blob identifiers matched, 90/96 initial exact line anchors matched; all 6 mismatches were indexing errors confined to C/Imports, corrected and independently refetched (6/6). Thus final 96/96 anchor checks across initial and corrected checks. These are source checks, not Lean kernel replay. The following independently runnable subset reproduces all blob checks and representative anchors from a local upstream clone containing both revisions. Python version not executed here; no numerical analytic integration or URT performance measured.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="c40250a50104b7e02e7d74f658d00fa7b1f4827c"
b="src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/"
C="CayleyCosetSums/"
M="MollifiedIntegrability/"
rows=[
(P,"IsSingTest","af75ada6fed52177eab6c5bd3a2258dcce4e0253",35,"β.det = 0"),
(P,C+"TraceTransposeMul","9e129ea98882af52e5f238a4063f5233363e657f",18,"theorem det_gram_eq_zero"),
(P,C+"InnerGen","98604ff1bb0b3fa1a7c931f0031104a6e2f78527",148,"integral_integral_swap"),
(P,C+"Imports","14df8fc98bcf307b0b16a96a57f878403f15063c",67,"refine ⟨(U⁻¹)ᴴ"),
(P,C+"SecondCoordMulInner","cd3af656f93724f39e4a14232ced38fea3933e36",72,"theorem v_rel"),
(P,C+"VanishInv","4b0760dfd873607b259c4e42c9b72ae5e30e52e3",25,"core2 hmn"),
(P,C+"DetFirstCayleyBlockNeGroup","5515771ef76f44555954c26829ef628956fcc547",35,"theorem det_first_cayley_block_ne_group"),
(P,C+"EventuallyUnit","621544f98c39cbc5821667b090d78d8ef6acaf16",103,"vanish_inv"),
(P,C+"SingularTestsKillVacuum","b06d4dc436e74ee31390b189c3c965312fb51593",21,"L3.vanish_all"),
(P,C+"MultiplicityOneTestOperatorsAlt","20397fb5abbb0c9c8cb7bae6bd5a7a5a8c4c72f7",33,"def SingularTestsKillVacuum"),
(P,C+"LocTauAlt","c68017f4832d14fb672e9e27fdd3a9eab3e7436a",31,"∫ k"),
(P,M+"GaussM","3b4d1dfe6c9fc26983b00a4cbf5f009ab076d9b5",36,"theorem norm_phase"),
(P,M+"ContinuousGramX","af44b2ce9918243f39d49cd701032e70df63cec7",12,"theorem integP"),
(H,C+"LocTau","918a2e1a9b30cf9c2f00b7a2d3deb09e7f11e860",1172,"asmLT lt1 lt2 lt3 crux"),
]
for rev,name,sha,line,needle in rows:
    raw=subprocess.check_output(["git","show",rev+":"+b+name+".lean"])
    actual=subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()
    assert actual==sha,(name,actual,sha)
    assert needle in raw.decode().splitlines()[line-1],(name,line)
print(len(rows),"source blobs and representative anchors matched")
```

## RESUME HERE
Expand CrxMa.stepA_Z in the RUN19 Crux0 contradiction: identify the exact singular test to determinant-derivative implication and all analytic/smoothness premises. Then pos_int and dpDual; keep Gaussian base / GI.integP deep obligations and prior CR.crLem_of, KSing.lamSing_of in the queue. Request authenticated role-labelled paths for HSt.lt3, HSt.L3.vanish_all, core2, factor, eventually_unit and HSt.locTau (prior manifest 8996470). HANDOFF TO theta, dependency, kernel, integration, audit, editor, literature. Full RH reconstruction OPEN; no Lean-kernel or URT improvement claim.

<!-- END VERBATIM specialists/theta_lifts/RUN20_SINGULAR_TEST_VACUUM_FOURIER_SUPPORT.md -->
