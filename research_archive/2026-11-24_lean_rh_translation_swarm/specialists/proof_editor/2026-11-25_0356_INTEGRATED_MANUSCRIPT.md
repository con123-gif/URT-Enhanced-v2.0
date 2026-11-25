# Human-readable RH reconstruction — twenty-first edition, 25 November 2026

**INCOMPLETE — project OPEN, 24 November deadline missed.** Pin 40e56bab026552e089d7afcfeff08d2defb9c005. [Previous volume 17](2026-11-25_0256_INTEGRATED_MANUSCRIPT.md), blob 92499c98fe83abbed5056564580bf8655695437f, links volumes 1–16. This is volume 18, with 9 new pinned peer Markdown documents, bringing the previous document-count convention from 215 to 224. Code links and editor chapters are not counted as new peer chapters. Peer snapshot 82a32e4e0880efa82417f8e81de34212c08a8785. Latest upstream observed fcb6eac7534875d32d68030967e2deae6d686151 (unchanged from previous edition). No repin or semantic equivalence claim.

## Reading order and exact joins

Insert the following chapters before volume 17's contour assembly. Chapter A supplies PerronSumBound 500 to PK.perronTrunc_of. Chapter B supplies regularPart and zeroLocus to shiftBound_of/glueContour. They preserve the strict zero window and full integer endpoint. Read integration's rest/Row0 reconciliation after CoreAll quadratic patching; the character-box RUN21 root window assembly is linked in the code appendix, not a substitute for upstream hypotheses. Borel class transfer and crystalline connection base change supply local steps. Theta's singular determinant derivative and spherical Jensen remain distinct from full theta/height closure. Arbitrary K is independent of GK in the prime chapter. Gaussian and conductor are imported leaves pending exact Main-root linkage. The 300-target role projection is a request manifest, not evidence all its targets have been resolved.

## Chapter A — uniform summation of the Perron error

Fix independent reals u,T≥2, m=floor(u)≥2, L=log u≥1/2, c=1+1/L in (1,3]. Write b_T(y)=2 if T|log y|≤1, otherwise 1/(T|log y|). The source uses the full step 1_{y≥1}, not half-weight at equality. Put p_n=Λ(n)(u/n)^c b_T(u/n); p_0=0 under Lean total arithmetic. PerronSumBound 500 asserts summability over natural n and sum ≤500[(u/T)L²+L] for every u,T≥2, with no T≤u assumption here.

**Far majorant.** For n>0 and n≤u/2 or n≥2u, |log(u/n)|≥log 2≥1/2. For any d>0 with d≤|log y|, b_T(y)≤2/(Td): in the bounded branch Td≤1; in the reciprocal branch the denominator is positive and at least Td. Hence b_T(u/n)≤4/T. Also u^c=e u exactly, Λ(n)≤log n, and p_n≤4e(u/T)log(n)n^{-c} (pTerm_le_far). For ε>0, compare decreasing x^{-1-ε} to its integral from 1 to K+1, giving Σ_{i=0}^{K−1}(i+2)^{-1-ε}≤1/ε for every natural K. Since log x≤x^ε/ε for x>0, Σ_{n<K} logTerm(1+2ε,n)≤1/ε², treating n=0,1 as zero. Take ε=1/(2L) to obtain Σ logTerm(c,n)≤4L². Retain imported sum_le_integral, integral_rpow, log_le_rpow_div and von Mangoldt bound. No RH premise.

**Near majorant.** For 0<x<2u and 0<g≤|u−x|, integrating 1/t between x and u gives |log(u/x)|≥|u−x|/(2u)≥g/(2u). Native kb_le_div instead uses the two equivalent one_sub_inv_le_log inequalities. Therefore b_T(u/x)≤4u/(Tg). Define B(n)=4u/[T(m−n)] for n<m; B(n)=2 for m≤n≤m+1; B(n)=4u/[T(n−m−1)] for n>m+1. Since m≤u<m+1, the positive outside denominators g satisfy g≤|u−n|; at the two central terms use b_T≤2, including integer u. Thus b_T(u/n)≤B(n) for 0<n<2u. In the near region u/2<n<2u, Λ(n)≤log(2u)≤2L and (u/n)^c≤2³=8, giving p_n≤16 L B(n).

This region lies in n<2m+2. Reflection of the left block and translation of the right give the exact identity
  Σ_{0≤n<2m+2} B(n)=4+2(4u/T)H_m,
where H_m=Σ_{j=1}^m 1/j. The two central terms contribute 2+2, not zero even at integer u. H_m≤1+log m≤1+L≤3L. All B terms nonnegative, so each partial sum of the truncated envelope is ≤4+24(u/T)L. The n=0 term occurs in the envelope only; p_0=0.

**Combine.** The sum of the two majorants bounds every p_n, including n=0 and far boundary equalities. For every K,
  Σ_{n<K}p_n ≤4e(u/T)·4L²+16L[4+24(u/T)L]
  ≤432(u/T)L²+64L
  ≤500[(u/T)L²+L].
Here e<3. Nonnegative bounded partial sums imply summability and the same bound at infinity. This is the native sum_pTerm_le and perronSumBound. C=432 is also sufficient by the displayed algebra; we retain 500 for the exact native join, with no sharpness claim. PK.kernel_le_kb bounds the error for any coefficients |a_n|≤Λ(n) by p_n, with a_0=0. The previous chapter's dominated-convergence interchange uses separately the von Mangoldt Dirichlet series at c>1. Assemble L30 invokes PK.perronTrunc_of PK.perron_kernel_single_term perronSumBound within PK.perronL_of at C=500. The single-term contour estimates remain upstream.

## Chapter B — native pole subtraction and regularPart

**General analytic subtraction.** Suppose f analytic in a neighborhood of every point of K, Z a finite set of zeros (all zeros in K belong to Z), and every point of K has finite analytic order. At ρ∈K the analytic-order factorization gives f(s)=(s−ρ)^m g(s) locally, with m=analyticOrderNatAt(f,ρ), g analytic and g(ρ)≠0. On a punctured neighborhood both factors nonzero, so f'/f=m/(s−ρ)+g'/g, and the latter quotient analytic near ρ. Define H(z) at z∈Z∩K to be the analytic quotient at z minus the other principal parts. Elsewhere define H=f'/f−Σ_{ρ∈Z}mρ/(s−ρ). For z∈Z∩K choose a neighborhood avoiding Z\{z}; H there agrees both at z and off z with g'/g−Σ_{ρ≠z}mρ/(s−ρ), hence is analytic. At z∈K\Z, f(z)≠0 and all denominators nonzero locally, so H analytic there too. This proves exists_regular_part, with the original finite-order and zero-set hypotheses even if Z contains points outside K. For entire f nonzero at some point, the identity theorem gives finite zeros on compact K (otherwise a limit point forces f≡0), and finite order at every point (otherwise locally zero, then identically zero). The imported analytic-order and identity theorems remain proof dependencies.

**Zero classification.** Inversion preserves character conductor because factoring through each divisor is invariant under inversion; hence χ inverse primitive when χ primitive. On Re s≥1, except principal s=1, the classical LFunction_ne_zero_of_one_le_re implies nonvanishing of completed L by the gamma-factor quotient. On Re s≤0, except principal s=0, apply the functional equation for χ inverse at 1−s and this right-hand nonvanishing result. This is not the target Re s>1/2 assertion. In the primitive principal case N=1; ζ(0)=−1/2. Away from s=1 and on the exact source guard Re s≥−3/2, the possible remaining zeros are therefore the critical strip 0<Re s<1, s=0 for even nonprincipal χ, or s=−1 for odd χ. Indeed reciprocal gamma zeros occur at −2j in the even case and −1−2j in the odd case, j≥0, and the lower real-part guard forces j=0. This is precisely ZeroLocus, not a classification on all of C.

For even nonprincipal χ, Γ_R(z)^{-1}=z g(z) with g(z)=π^{z/2}/[2Γ(z/2+1)], by the gamma recurrence at nonzero z and the totalized reciprocal gamma equality at zero. g entire with g(0)=1/2≠0. The completed L is entire and nonzero at 0 in this case; hence L(z)=completedL(z) z g(z) has a zero at 0 of analytic order exactly one. This is mult_zero_of_even; imported functional equation, gamma and right-boundary nonvanishing remain obligations. No simplicity of nontrivial zeros.

**Apply to Lent.** Define F=Lent χ as L if χ nonprincipal, and the analytic extension of (s−1)L(s) if principal. F entire, F(2)≠0, F(1)≠0; away from 1 its zeros and orders agree with L, as s−1 has order zero there. For s≠1 and L(s)≠0, logDeriv L(s)=logDeriv F(s)−d/(s−1), d=1 for principal, otherwise 0. Fix x1>1, T'>0, NoOrdinate χ T' (no critical-strip zero has |Im ρ|=T'). On K=[−1/2,x1]×[−T',T'] let Z consist of ZerosBelow χ T' (strict 0<Re ρ<1, |Im ρ|<T') and {0} only for even nonprincipal χ. Finite by compact-zero finiteness; the union disjoint because critical-strip real parts are positive. Every element is a zero of F. Conversely a zero of F in K is not 1, and zeroLocus gives either a critical-strip zero (NoOrdinate replaces ≤T' with <T'), even zero at 0, or −1 outside K. Finite orders follow from F(2)≠0. Apply the general analytic subtraction to F on K and split the finite sum. For every s∈K with L(s)≠0 and s≠1,
  logDeriv L(s)=H(s)+Σ_{ρ∈ZerosBelow χ T'}mult(χ,ρ)/(s−ρ)+e0/s−d/(s−1).
Here e0=1 exactly when χ even nonprincipal, otherwise zero; H analytic near each point of K, hence differentiable on K. This is native regularPart. The principal term has sign minus, and the zero term multiplicity is exactly one. These feed the previous contour identity without changing its signs or zero window. The native zerosFinite proof is also reconstructed independently of the earlier finite-window cover. Imported classical facts not independently replayed; root reachability not established by this local reconstruction.

## Source ledger and reproducible regression

- [GoodHeightExists.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/GoodHeightExists.lean) — bf78938cb8a467701a2bbd5a05a6675d3c2f6707: kb L57, PerronSumBound L90, ZeroLocus L115, RegularPart L126.
- [PerronSum.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/PerronSum.lean) — c63a54cc35aa09618975ed79f1eda4dfd2ab5fef: sum_rpow_le L10, sum_logTerm_le L43, kb_le_of_le L86.
- [PerronSumBound.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/PerronSumBound.lean) — 95924c5442c2564f850c7df92f1f9face5bb546a: nearB L10, sum_nearB L35, kb_le_div L74, pTerm_le_far L159, pTerm_le_near L183, sum_pTerm_le L240, perronSumBound L295.
- [PerronTruncOf.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/PerronTruncOf.lean) — 317a0f5d1e96615a72b6fe7769e84d4df44fe8d0: kernel_le_kb L14, perronTrunc_of L32.
- [Assemble.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/Assemble.lean) — df4bdcbcf581025792f60b8d849ef46ae0af16ff: explicitFormula_of_local L19, perronSumBound call L30, regularPart call L32.
- [LStructA.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LStructA.lean) — 1b01d73fca21edc9c79402fb364294199f4847bf: logDeriv_local L9, exists_regular_part L36, finite_zeros_of_compact L95, order_ne_top_of_entire L111.
- [LStructB.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LStructB.lean) — 4d99f998748bf91c5c75712a821276156d4b72ba: completed_ne_zero_left L51, zeroLocus L65, order_Gammaℝ_inv_zero L141, mult_zero_of_even L150.
- [LStructC.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LStructC.lean) — d1115525390d7cd7c207b62b1cd35174d95dd844: Lent L21, logDeriv_Lent L89, zerosFinite L109, regularPart L122, exists_regular_part call L168.

Executed connector checks in separate source audit: 8 pinned source blob identifiers and 32 exact declaration/call anchors matched. Executed V8 exact integer-scaled regression: {"harmonic":1404,"near":56160,"budget":15100,"controls":2}. Harmonic identity and near distance use rational quarter-grid u,T; budget tests compare exact integer envelopes. Controls detect deletion of a central term and show 431 is not implied by these particular envelope inequalities alone. Not an analytic numerical test, kernel replay or proof by finite enumeration. Reproduce:
```js
function certificate(){
 const c={harmonic:0,near:0,budget:0,controls:0};const ck=(x,k)=>{if(!x)throw Error(k);c[k]++};
 const abs=x=>x<0n?-x:x;
 for(let m=2n;m<=40n;m++){
  let D=1n;for(let j=1n;j<=m;j++)D*=j;
  for(let U=4n*m;U<4n*m+4n;U++)for(let V=8n;V<=40n;V+=4n){
   let total=0n,H=0n;for(let j=1n;j<=m;j++)H+=D/j;
   for(let n=0n;n<2n*m+2n;n++)total+=n<m?4n*U*(D/(m-n)):n<=m+1n?2n*V*D:4n*U*(D/(n-m-1n));
   ck(total===4n*V*D+8n*U*H,"harmonic");
   for(let n=1n;n<2n*m+2n;n++)if(4n*n<2n*U&&n!==m&&n!==m+1n){
    let g=n<m?m-n:n-m-1n;ck(g>0n&&4n*g<=abs(U-4n*n),"near");
   }
  }
 }
 for(let X=0n;X<=150n;X++)for(let Y=1n;Y<=100n;Y++)ck(432n*X+64n*Y<=500n*(X+Y)&&432n*X+64n*Y<=432n*(X+Y),"budget");
 // u=T=2, m=2: B=[2,4,2,2,4,2], total 16; dropping central term gives 14.
 ck(2+4+2+2+4+2===16 && 2+4+2+4+2!==16,"controls");
 ck(432n*1000n+64n>431n*1001n,"controls");
 return c;
}
console.log(certificate())
```

## Numbered remaining obligations

1. GeoOne, TLiftK, CoreAll/rest, Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and representation leaves. New rest/Row0 and Borel chapters local; CMBasePatch and role projections remain.
2. RecTExists/VWin and native host design: QDChoice, ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm and native GoodFor. Common witnesses retained.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead/LocTau and CR, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and local closure. Crystalline totality, acyclicity, restriction, linearity/cup, Hodge comparison and naturality. Determinant derivative and connection chapters are local only.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves and full class transport.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG, NumStar and native AdmFam. Arbitrary K independent; sphere log integrability and height producers outstanding.
6. Analytic producers ExplZeta/ExplChi/LogDerOne, ZeroCount, ZFRDirichlet, growth/DiscFactor/DiscLog, Loc.local_abstract, logDerivHoriz_of and logDerivLeft_of, Perron line_bound_neg/pos, zero-density, Mertens, prime mean-square/count and window producers. PerronSumBound and regularPart/zeroLocus now locally reconstructed; imported and root-link obligations retained.
7. Source/build/export correspondence, typed projection, independent kernel replay/axioms. Mixed exported reachable denominator 1,484,705 from prior traversal; unique independently translated and authenticated numerator unknown. For the bounded editor task, denominator is two native producer bodies (PerronSumBound, regularPart): locally reconstructed 2/2, not full proof coverage.
8. Independent proof/citation audit, exact joins, root reachability and external trust boundaries. Project OPEN.

Continuity: read RH coordination documents, manuscript spine, AGENTS, state/log/protocol/continuity excerpts, prior volume and new peer handoffs, latest physical CI #415 (unrelated to RH). External blueprint not reopened. Peer documents reproduced verbatim and their source ledgers are peer-reported, not independently fully re-fetched. Code-linked evidence retains exact snapshot paths. No claim of full proof, kernel validation or URT acceleration.

RESUME HERE: reconstruct Loc.local_abstract from DiscFactor and DiscLog, preserving exact disc radii and zero multiplicities, then logDerivHoriz_of and logDerivLeft_of. Audit bot: check regularPart zero-locus guard −3/2 and exceptional zeros, principal correction sign, integer-u Perron endpoint, and alternate 432 witness. Dependency/kernel: request authenticated Main role paths for perronSumBound, regularPart, local_abstract. HANDOFF TO integration, dependencies, audit, editor, math and analytic lanes.

## Peer manifest (immutable snapshot)
- [integration/2026-11-25_0300_COREALL_REST_ROLE_ROW0.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-25_0300_COREALL_REST_ROLE_ROW0.md) — e353aa82eec3b48947cf8555e1aed2a90283f814 — included verbatim
- [math/2026-11-25_conductor_dvd_from_factorization.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-25_conductor_dvd_from_factorization.md) — c6bd112840fbec7c8f9c950d71ddc5e874001f70 — included verbatim
- [specialists/galois_representations/RUN21_BOREL_CLASS_NUMBER_TRANSFER.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN21_BOREL_CLASS_NUMBER_TRANSFER.md) — 99dae1c7d844eec4a6c5a153d7e2e6e7af56a2b4 — included verbatim
- [specialists/landau_criterion/RUN21_COMPLEX_QUADRATIC_GAUSSIAN.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN21_COMPLEX_QUADRATIC_GAUSSIAN.md) — f86a4e9d4e9523ad45e6e53756d44a1b4a5743af — included verbatim
- [specialists/literature_provenance/RUN21_CRYSTALLINE_CONNECTION_AND_BASE_CHANGE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN21_CRYSTALLINE_CONNECTION_AND_BASE_CHANGE.md) — ceda68dd6011c095d6514fc2380daba2c048f66c — included verbatim
- [specialists/on_acceleration/RUN21_RESUME.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN21_RESUME.md) — 21adb5deec191402205b93ebd38d53440f667ea5 — included verbatim
- [specialists/positivity_geometry/RUN22_SPHERICAL_JENSEN_HARMONIC_CORRECTION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN22_SPHERICAL_JENSEN_HARMONIC_CORRECTION.md) — 5e91d4a7084e9d5c2006e532e9a6c917eb23b328 — included verbatim
- [specialists/prime_window/RUN21_ARBITRARY_K_ARCHIMEDEAN_ADMISSION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN21_ARBITRARY_K_ARCHIMEDEAN_ADMISSION.md) — d6278f41eabd89f2f43803d9d1e7d154c7e1db80 — included verbatim
- [specialists/theta_lifts/RUN21_SINGULAR_TEST_DETERMINANT_DIFFERENTIATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN21_SINGULAR_TEST_DETERMINANT_DIFFERENTIATION.md) — 045deced92e42d35a920a844b9b1e8f49db091d4 — included verbatim
- [audit/2026-11-25_0348_kept_weight_transport.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-25_0348_kept_weight_transport.mjs) — linked supporting code
- [dependencies/rh_post151_role_frontier.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_post151_role_frontier.mjs) — linked supporting code
- [math/verify_conductor_dvd_from_factorization.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_dvd_from_factorization.py) — linked supporting code
- [specialists/character_boxes/RUN21_MAIN_ROOT_WINDOW_ASSEMBLY.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN21_MAIN_ROOT_WINDOW_ASSEMBLY.mjs) — linked supporting code
- [specialists/kernel_extractor/run21_tliftk_instance_coherence.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run21_tliftk_instance_coherence.mjs) — linked supporting code
- [specialists/on_acceleration/staged_run21.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/staged_run21.py) — linked supporting code
- [structure/2026-11-25_0324_early_signature_map_release.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/82a32e4e0880efa82417f8e81de34212c08a8785/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-25_0324_early_signature_map_release.mjs) — linked supporting code

## Peer source appendix
<!-- BEGIN VERBATIM integration/2026-11-25_0300_COREALL_REST_ROLE_ROW0.md -->
# Integration 03:00 — authenticated CoreAll/rest edge reconciliation and Row0 assembly
2026-11-25. RESULT: SOURCE-MATCHED local reconstruction and exact peer-projection integration; full RH OPEN. One contribution: attach complete role records for the two previously incoming-only owners to the existing root path and reconstruct the associated rest/Row0 proof without adding hypotheses. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; observed new upstream fcb6eac7534875d32d68030967e2deae6d686151, not adopted or certified equivalent. Prior integration e5e626d8d7d0795647cc25dfac97d1ef37d2a39f; dependency handoff 276bc2393cd88389333f5316a8908173fd1dca90, blob 06c946a5b4910e58cc7996eec13ca631bc65dae5; previous manuscript volume XVI (187 primary +18 supporting documents, not unique translated declarations), blob 8dec30184d1e4ec262da419408ce29715038ca20. General CI checkpoint #412 at 02:41:39 UTC, run 45532409278, not RH verification.

Preflight: SWARM_PROTOCOL first, AGENTS, research state/log/protocol, continuity, handoff; latest 14 other lane checkpoints (geometry a2e89b76, audit dfb49934, boxes c5fd8e8e, literature b8d56b09, math e2ce836f, Galois 14342760, theta 8871bf4d, structure 9d77c3e9, Landau f60a99d0, dependencies 276bc239, prime 23002341, kernel c50fdeaf, acceleration 9cd16155, editor 8d26a6b1). No duplicate of this role integration. Kernel RUN20 distinguishes distinct expression records from ordered occurrence paths; the counts below are records only, never unfolded occurrence counts. Audit dfb49934 independently warns against premature real projection; no independent review of this chapter yet. Failed attempts: root-level research protocol/log paths and generic RESUME_HERE.md paths returned 404; corrected via actual runner paths and commit file lists. Default-branch CMBasePatch search returned no hits; its deeper supplier remains outstanding, not inferred. External blueprint not reopened. No unrelated physical files changed.

## Mathematical proof (conditional on named native suppliers)
In Development.lean, let C=coreAll_of(seed,cong,up). The actual term applies Inp.coreAll_of_core to Core.toCoreK(up,congPhi_holds,descOffT,limFinOdd_of(seed,cong)). The recovered value evidence includes **all five** named suppliers (previous source-only list omitted congPhi_holds and descOffT). No substitution of similarly named declarations. Define H1=galoisCompat_unlinkedSupport_of_spherical(C); H2=localGlobalCompatAtIwahoriFixed_of_unlinked(H1). Then rest(C) is galoisLocalGlobal_of_localGlobalCompatibility(C,H1,H2). H1 is reused, not a second independent theorem. The exported distinct-reference record count of one does not determine its number of syntactic applications.

H1 (toral file): Inq is supplied by inp_holds and charLiftPrime_holds. For a local component with PlainTor(algNorm σ), the away-l clause comes from away_eq_of_plainTor using toralGal_of_holds(Inq,C.unr); the above-l clause uses deRham_of_plainTor(Inq,C.dR), then toralAbove_of_holds(Inq,C.crys,C.phi). The latter applies for a chosen local Artin witness a; its potentially semistable and monodromy-zero outputs are selected at a0, while the characteristic polynomial identity for any reciprocity map and Weil element g uses the corresponding witness a and transitivity with the inverse of rc_unlinked_chars' equality. No assertion for arbitrary non-toral components. The de Rham subproof obtains a spherical base-change lift, transfers Weak via weak_comp_res, invokes C.dR at the lifted place, descends the de Rham property and jumps via compatible local bridges; the embedding φ extends the finite coefficient field embedding, and lift.inf plus composition equality transports the integer multiset J without changing it.

H2 (R2g): retain the common context E,Ω CM/algebraic closure, prime l, ι, rank n≥1, π,χ, InScope .all, r with Weak, place w, σ local component, nonzero KOne-fixed subspace, A,h,rc with IsRecT and mono0. Split the additional guard PlainTor(algNorm σ) OR (IsQg w AND Apart(algNorm σ)). In the plain-torus branch apply H1 directly, restricting the all-Weil-element equality to inertia. Otherwise mixedOf and ToTor produce a lifted toral component over X.K, with compatible place u, weak representation resTo X.K r, and matched inertia elements t' for each t. Apply H1 over X.K. Away from l, pull nonmembership of l in the prime ideal to u using h,h', and descend via wdOf_restricts and restricts_lpDim_mono0_charPol. In symbols, for each inertia t the chain is P_base(t)=P_lift(t')=P_rec'(t')=P_rec(t), where the first equality requires agreement of inertia actions and the last is supplied by hine, not by equality of fields. Above l, transport membership instead, use DRDesc with a separately chosen lift for every A',hA', obtain the induced local bridge, descend IsPstAt by isPstAt_of_resTo, and use wdAt_resTo with the same restriction identity. No interchange of quantifiers over A' and lifts; no unguarded compatibility. ToTor_holds has its own native suppliers suppBC_outright, unrField_holds, allLift_holds, ineNorm, infLifts(infStep stableOf), recChars(suppIne), recTExists; these remain obligations.

Row assembler: localGlobalAtPlaceClass_of_localGlobal restricts H2 to any class Q, by using Or.inr ⟨q,g⟩ where q=IsQg and g=Apart; it does not prove either condition. The final assembler takes Q identically True (not IsQpBig, which is used by a separate theorem). Given π,χ satisfying regularity and polarization, construct InScope .all=(hr,hp,trivial), select a single r from C.Ex and weights wt,HT from exists_weights. Weak gives continuity and semisimplicity. Weight integrality follows from regularity: each shifted complex infinitesimal weight is the cast of −n for its integer n; choose the multiset lift and use injectivity of Int.cast to transport the polarization identity. Keep the original shifted weight convention (rank−1)/2−z and the conjugation identity HT(τ∘conj)=map(wt−·,HT(τ)).

Away from l: away proves Cmp(Q E w a,wdOf,rc(algNorm σ)): dimensions agree by lpDim_wdOf and IsRecT dimension; toral mono0 equality follows from H1 after generic_algNorm and plainTor_of_tor; for IsQp, tame, squarefree, mono0 and Q, guard_tame supplies fixed and Apart, so H2 supplies monodromy zero and inertia charpoly equality. For g of Weil degree zero, exists_eq_zpow_mul expresses g as frob^deg(g) times an inertia element; frob^0=1, so the inertia equality implies equality at g. This does NOT extend to nonzero degree. Likewise evaluate characteristic polynomials at identity and take natural degree to get lpDim equality. Above l: in the spherical case crys obtains Satake B and invokes C.crys and C.dR, then transports Hodge jumps using w1. In the guarded nonspherical case above splits Tor versus non-Tor: the Tor case uses H1's de Rham/Pst and charpoly equality plus eq_of_mono0_charPol; the non-Tor case extracts the guarded Q/IsQp/tame/squarefree branch, applies guard_tame and H2, and concludes Away by dim_of_ine, vacuous Tor implication, and charPol_of_ine. The final tuple is precisely galoisLocalGlobal_of_placeClassCompatibility and the wrapper specializes Q=True. The final Row0 remains conditional on the native deep suppliers; no external axiom removed.

## Typed graph and reproducible source ledger
The following is complete for the two projected owner records, copied without normalization from the peer handoff (not a new raw archive scan). Source-only obligations in the tree are not authenticated outgoing edges beyond these owners. The old incoming path is checked against the preceding integration chapter. No full-corpus coverage inferred. Source files are fetched from the pin; returned Git blob identifiers compared (not locally recomputed hashes).
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "archiveDigest": "5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e",
  "root": 14065054,
  "dependencyCommit": "276bc2393cd88389333f5316a8908173fd1dca90",
  "dependencyBlob": "06c946a5b4910e58cc7996eec13ca631bc65dae5",
  "owners": [
    {
      "request": {
        "name": "UpperTheory.Gal.Int.coreAll_of",
        "id": 13208115,
        "kind": "thm",
        "origin": "authenticated_root_path_frontier",
        "incoming": {
          "owner": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
          "ownerId": 13235288,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1004086650
        },
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
          },
          {
            "owner": 13235288,
            "target": 13208115,
            "role": "value",
            "kind": "explicit_const",
            "witness": 1004086650,
            "expressionRoot": 1004086661,
            "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
            "targetName": "UpperTheory.Gal.Int.coreAll_of"
          }
        ]
      },
      "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
      "id": 13208115,
      "kind": "thm",
      "encodedRootsAndStructuralEdges": [
        1002624502,
        1002624516
      ],
      "type": {
        "expressionRoot": 1002624501,
        "expressionsRead": 7,
        "childEdges": 6,
        "referenceOccurrences": 4,
        "peakPending": 4,
        "references": [
          {
            "kind": "explicit_const",
            "target": 13126693,
            "nameParts": [
              "GlobalTheory",
              "RoadU",
              "CoreAll"
            ],
            "targetKind": "def",
            "witnessExpression": 998130079,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13125905,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK"
            ],
            "targetKind": "def",
            "witnessExpression": 1000528341,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13172632,
            "nameParts": [
              "GlobalTheory",
              "CongL",
              "CongFinOdd"
            ],
            "targetKind": "def",
            "witnessExpression": 1002624487,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13172568,
            "nameParts": [
              "GlobalTheory",
              "CongL",
              "SeedFinOdd"
            ],
            "targetKind": "def",
            "witnessExpression": 1002624486,
            "distinctExpressionRecords": 1
          }
        ]
      },
      "value": {
        "expressionRoot": 1002624515,
        "expressionsRead": 21,
        "childEdges": 20,
        "referenceOccurrences": 8,
        "peakPending": 7,
        "references": [
          {
            "kind": "explicit_const",
            "target": 13208114,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "Lim",
              "limFinOdd_of"
            ],
            "targetKind": "thm",
            "witnessExpression": 1002624508,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 12421136,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "Desc",
              "descOffT"
            ],
            "targetKind": "thm",
            "witnessExpression": 957388881,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13205113,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "ClosedPhiFromClosedTrace",
              "congPhi_holds"
            ],
            "targetKind": "thm",
            "witnessExpression": 1002624505,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13190268,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "Int",
              "Core",
              "toCoreK"
            ],
            "targetKind": "thm",
            "witnessExpression": 1002624503,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13175074,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "Int",
              "Inp",
              "coreAll_of_core"
            ],
            "targetKind": "thm",
            "witnessExpression": 1002624502,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13125905,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK"
            ],
            "targetKind": "def",
            "witnessExpression": 1000528341,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13172632,
            "nameParts": [
              "GlobalTheory",
              "CongL",
              "CongFinOdd"
            ],
            "targetKind": "def",
            "witnessExpression": 1002624487,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13172568,
            "nameParts": [
              "GlobalTheory",
              "CongL",
              "SeedFinOdd"
            ],
            "targetKind": "def",
            "witnessExpression": 1002624486,
            "distinctExpressionRecords": 1
          }
        ]
      },
      "structural": [],
      "mutualBlock": [
        {
          "id": 13208115,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "coreAll_of"
          ],
          "exported": true
        }
      ]
    },
    {
      "request": {
        "name": "UpperTheory.Gal.Int.rest",
        "id": 13172410,
        "kind": "thm",
        "origin": "authenticated_root_path_frontier",
        "incoming": {
          "owner": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
          "ownerId": 13235288,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1004086649
        },
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
          },
          {
            "owner": 13235288,
            "target": 13172410,
            "role": "value",
            "kind": "explicit_const",
            "witness": 1004086649,
            "expressionRoot": 1004086661,
            "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
            "targetName": "UpperTheory.Gal.Int.rest"
          }
        ]
      },
      "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
      "id": 13172410,
      "kind": "thm",
      "encodedRootsAndStructuralEdges": [
        1000095280,
        1000095289
      ],
      "type": {
        "expressionRoot": 1000095279,
        "expressionsRead": 86,
        "childEdges": 118,
        "referenceOccurrences": 17,
        "peakPending": 12,
        "references": [
          {
            "kind": "explicit_const",
            "target": 13125903,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "Int",
              "recT"
            ],
            "targetKind": "def",
            "witnessExpression": 1000095259,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 385914,
            "nameParts": [
              "NumberField",
              "instCommRingRingOfIntegers"
            ],
            "targetKind": "def",
            "witnessExpression": 8609075,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 385909,
            "nameParts": [
              "NumberField",
              "RingOfIntegers"
            ],
            "targetKind": "def",
            "witnessExpression": 8609071,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 385674,
            "nameParts": [
              "IsDedekindDomain",
              "HeightOneSpectrum"
            ],
            "targetKind": "inductive",
            "witnessExpression": 8609070,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 385664,
            "nameParts": [
              "ValuationSubring"
            ],
            "targetKind": "inductive",
            "witnessExpression": 8609067,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 385652,
            "nameParts": [
              "UpperTheory",
              "GalStar",
              "RecNotion",
              "_proof_1"
            ],
            "targetKind": "thm",
            "witnessExpression": 8609060,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 4099,
            "nameParts": [
              "Field",
              "toCommRing"
            ],
            "targetKind": "def",
            "witnessExpression": 1244768,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 341243,
            "nameParts": [
              "IsAlgClosure"
            ],
            "targetKind": "inductive",
            "witnessExpression": 8609052,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 4101,
            "nameParts": [
              "Field",
              "toSemifield"
            ],
            "targetKind": "def",
            "witnessExpression": 315578,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 4098,
            "nameParts": [
              "Semifield",
              "toDivisionSemiring"
            ],
            "targetKind": "def",
            "witnessExpression": 315576,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 4074,
            "nameParts": [
              "DivisionSemiring",
              "toSemiring"
            ],
            "targetKind": "def",
            "witnessExpression": 315574,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 4083,
            "nameParts": [
              "Semifield",
              "toCommSemiring"
            ],
            "targetKind": "def",
            "witnessExpression": 1246540,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 85935,
            "nameParts": [
              "Algebra"
            ],
            "targetKind": "inductive",
            "witnessExpression": 5945860,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 3820,
            "nameParts": [
              "Field"
            ],
            "targetKind": "inductive",
            "witnessExpression": 216818,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 341190,
            "nameParts": [
              "NumberField"
            ],
            "targetKind": "inductive",
            "witnessExpression": 8609044,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13126182,
            "nameParts": [
              "UpperTheory",
              "GalStar",
              "Row0"
            ],
            "targetKind": "def",
            "witnessExpression": 997988582,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13126693,
            "nameParts": [
              "GlobalTheory",
              "RoadU",
              "CoreAll"
            ],
            "targetKind": "def",
            "witnessExpression": 998130079,
            "distinctExpressionRecords": 1
          }
        ]
      },
      "value": {
        "expressionRoot": 1000095288,
        "expressionsRead": 11,
        "childEdges": 12,
        "referenceOccurrences": 4,
        "peakPending": 5,
        "references": [
          {
            "kind": "explicit_const",
            "target": 13140146,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "ToralGalois",
              "galoisCompat_unlinkedSupport_of_spherical"
            ],
            "targetKind": "thm",
            "witnessExpression": 1000095282,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13172409,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "ToralGalois",
              "R2",
              "localGlobalCompatAtIwahoriFixed_of_unlinked"
            ],
            "targetKind": "thm",
            "witnessExpression": 1000095285,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13129148,
            "nameParts": [
              "UpperTheory",
              "Gal",
              "Int",
              "Row",
              "galoisLocalGlobal_of_localGlobalCompatibility"
            ],
            "targetKind": "thm",
            "witnessExpression": 1000095280,
            "distinctExpressionRecords": 1
          },
          {
            "kind": "explicit_const",
            "target": 13126693,
            "nameParts": [
              "GlobalTheory",
              "RoadU",
              "CoreAll"
            ],
            "targetKind": "def",
            "witnessExpression": 998130079,
            "distinctExpressionRecords": 1
          }
        ]
      },
      "structural": [],
      "mutualBlock": [
        {
          "id": 13172410,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "rest"
          ],
          "exported": true
        }
      ]
    }
  ],
  "typedObligations": {
    "status": "SOURCE-MATCHED, not kernel replay",
    "root": 14065054,
    "conclusion": "Row0 recT",
    "premises": [
      "CoreAll; source-constructed from SeedFinOdd, CongFinOdd, TLiftK with named suppliers"
    ],
    "children": [
      {
        "type": "plain-torus",
        "conclusion": "R1",
        "requires": [
          "Inq: Inp and charLiftPrime_holds",
          "CoreAll.unr",
          "CoreAll.dR",
          "CoreAll.crys",
          "CoreAll.phi",
          "away_eq_of_plainTor",
          "toralGal_of_holds",
          "deRham_of_plainTor",
          "toralAbove_of_holds",
          "rc_unlinked_chars"
        ]
      },
      {
        "type": "Iwahori-fixed",
        "conclusion": "LocalGlobalCompatAtIwahoriFixedPlaces",
        "requires": [
          "R1",
          "mixedOf",
          "toTor_holds",
          "drDesc",
          "recTExists"
        ],
        "guards": [
          "fixed != bottom",
          "PlainTor or (IsQg and Apart)",
          "mono0",
          "IsRecT",
          "all native field/representation/local bridge premises"
        ]
      },
      {
        "type": "Row0 assembly",
        "requires": [
          "CoreAll.Ex",
          "R1",
          "LocalGlobalCompatAtIwahoriFixedPlaces",
          "exists_weights",
          "away",
          "crys",
          "above"
        ],
        "branches": [
          "away-l: dimension; toral equality under mono0; guarded degree-zero characteristic polynomial equality",
          "above-l spherical: crystalline, de Rham, jumps",
          "above-l guarded: de Rham, potentially semistable, jumps, Away"
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
        "theorem coreAll_of",
        "Core.toCoreK up",
        "congPhi_holds",
        "descOffT",
        "limFinOdd_of seed cong",
        "theorem rest",
        "galoisLocalGlobal_of_localGlobalCompatibility h",
        "localGlobalCompatAtIwahoriFixed_of_unlinked"
      ]
    },
    {
      "key": "row",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean",
      "blob": "eebd76fca5538c7a0156cf330cedd4b663b0d70a",
      "anchors": [
        "theorem localGlobalAtPlaceClass_of_localGlobal",
        "(Or.inr ⟨q, g⟩)",
        "theorem charPol_of_ine",
        "rw [hg, zpow_zero, one_mul] at e",
        "theorem dim_of_ine",
        "WD.charPol_natDegree",
        "def Cmp",
        "theorem away",
        "theorem above",
        "by_cases ht : Tor",
        "g.resolve_right ht",
        "theorem exists_weights",
        "Multiset.map_injective",
        "theorem crys",
        "theorem galoisLocalGlobal_of_placeClassCompatibility",
        "C.1 E Ω l ι a ha π χ hI",
        "k.2.2 trivial",
        "g.imp (fun q => ⟨trivial, q⟩) id",
        "theorem galoisLocalGlobal_of_localGlobalCompatibility"
      ]
    },
    {
      "key": "r1",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/GaloisCompatUnlinkedSupportOfSpherical.lean",
      "blob": "e01a86b5f2ec5fee9e16c3e0556d98bbea26bcbf",
      "anchors": [
        "theorem inq_holds",
        "inp_holds, UpperTheory.Gal.GamX.charLiftPrime_holds",
        "galoisCompat_unlinkedSupport_of_spherical inq_holds"
      ]
    },
    {
      "key": "r2",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedOfUnlinked.lean",
      "blob": "90390f831b31ac30e7672dc7d1a499464910ef27",
      "anchors": [
        "theorem toTor_holds",
        "infLifts (infStep",
        "recChars",
        "r2g mixedOf toTor_holds drDesc UpperTheory.Zero.LLC.recTExists"
      ]
    },
    {
      "key": "guard",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedPlaces.lean",
      "blob": "f6b0fadd7bad69ef19b48cae73c42ea6441310df",
      "anchors": [
        "def Apart",
        "fixed σ.ρ (KOne",
        "PlainTor (algNorm σ) ∨ (IsQg w ∧ Apart (algNorm σ))",
        "(rc (algNorm σ)).mono0",
        "Nonempty (LocTied l P AI)",
        "GlobalTheory.Pst.Induces Bw"
      ]
    },
    {
      "key": "r2g",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/R2g.lean",
      "blob": "bead0ea008e28652db66a8c6388279194c435c17",
      "anchors": [
        "MixedOf → ToTor → DRDesc",
        "rcases hcase with hpt | ⟨hQ, hap⟩",
        "hTor E Ω",
        "hR1 X.K Ω",
        "hmono.mp hm'",
        "obtain ⟨t', hz, hc⟩ := hine t",
        "hDR E Ω",
        "exists_bridge",
        "isPstAt_of_resTo",
        "wdAt_resTo"
      ]
    },
    {
      "key": "tor",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/GaloisCompatUnlinkedSupportOfSpherical.lean",
      "blob": "63df8ebae0b20371ab4450898f1c8d1dfbd3a789",
      "anchors": [
        "theorem deRham_of_plainTor",
        "exists_sph_lift_of_toral",
        "weak_comp_res",
        "deRham_descends",
        "jumps_descend",
        "hC.2 .unr",
        "hC.2 .dR",
        "hC.2 .crys",
        "hC.2 .phi",
        "rc_unlinked_chars"
      ]
    }
  ],
  "tests": {
    "positiveValidationAssertions": 125,
    "negativeControls": 6,
    "guardCases": 32,
    "sourceFiles": 7,
    "sourceAnchors": 60,
    "typeRecords": 21,
    "valueRecords": 12,
    "structuralRecords": 0,
    "uniqueTargets": 28
  }
}
```

## Executed validation
V8: {"positiveValidationAssertions":125,"negativeControls":6,"guardCases":32,"sourceFiles":7,"sourceAnchors":60,"typeRecords":21,"valueRecords":12,"structuralRecords":0,"uniqueTargets":28}. Six negative controls: delete value record, delete type record, change incoming role, mutate encoded expression root, mutate multiplicity, insert spurious structural edge. These checks are structural/source-anchor/Boolean regression, not independent Lean replay. Reproduction: fetch dependency commit and previous integration file; parse integrationHandoff and preceding JSON; use the source ledger above. Verify with this exact function (ck/eq are throwing assertions, spec and old as above):
```js
(rr,ss)=>{ck(rr.length===2,"two reports");for(let i=0;i<ss.length;i++){ck(ss[i].sha===spec[i][2],"blob");for(const a of spec[i][3])ck(ss[i].content.includes(a),"anchor "+a)}
for(const [i,r] of rr.entries()){const id=[13208115,13172410][i],incoming=old.authenticatedIncoming.references.find(x=>x.target===id);ck(r.id===id&&r.kind==="thm"&&r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK","id/status");eq(r.request.path.slice(0,-1),old.authenticatedIncoming.path,"prefix");let last=r.request.path.at(-1);ck(last.owner===old.authenticatedIncoming.owner&&last.target===id&&last.expressionRoot===old.authenticatedIncoming.expressionRoot&&last.role==="value"&&last.kind===incoming.kind&&last.witness===incoming.witnessExpression,"incoming");eq(r.encodedRootsAndStructuralEdges,[r.type.expressionRoot+1,r.value.expressionRoot+1],"encoded");eq(r.structural,[],"structural");for(const role of ["type","value"]){let t=r[role];let keys=new Set();for(const x of t.references){let k=JSON.stringify([x.kind,x.target]);ck(!keys.has(k)&&x.kind==="explicit_const"&&x.nameParts.length>0&&Number.isSafeInteger(x.witnessExpression)&&x.distinctExpressionRecords>0,"reference");keys.add(k)}ck(t.references.reduce((a,x)=>a+x.distinctExpressionRecords,0)===t.referenceOccurrences,"multiplicity");}eq([r.type.expressionRoot,r.value.expressionRoot,r.type.referenceOccurrences,r.value.referenceOccurrences],[[1002624501,1002624515,4,8],[1000095279,1000095288,17,4]][i],"root census");}
for(const [i,names] of [[0,["UpperTheory.Gal.Lim.limFinOdd_of","UpperTheory.Gal.Desc.descOffT","UpperTheory.Gal.ClosedPhiFromClosedTrace.congPhi_holds","UpperTheory.Gal.Int.Core.toCoreK","UpperTheory.Gal.Int.Inp.coreAll_of_core"]],[1,["UpperTheory.Gal.ToralGalois.galoisCompat_unlinkedSupport_of_spherical","UpperTheory.Gal.ToralGalois.R2.localGlobalCompatAtIwahoriFixed_of_unlinked","UpperTheory.Gal.Int.Row.galoisLocalGlobal_of_localGlobalCompatibility"]]])for(const name of names)ck(rr[i].value.references.some(x=>x.nameParts.join(".")===name),"supplier "+name)
}
```
Guard regression exhausts all 32 assignments of plain, IsQg, Apart, fixed, mono0, comparing fixed&&mono0&&(plain||(q&&apart)) with its distributed disjunction. No URT advantage or new axiom status claimed. Full project index remains distributed across editor volumes and dependency reports; this is an additive cross-reference rather than a complete independently verified project index.

RESUME HERE: resolve exact CMBasePatch.main declaration by following the pinned CoreAllOfRowStarCoreInp import chain (ExAllOfGood and its imports), not default-branch search. Verify its cofinite RepIso output and source-bound proof, check peer overlap and request authenticated outgoing role records for coreAll_of_core and the three rest value suppliers. HANDOFF TO dependency, Galois, kernel, editor, audit. Full human-readable proof OPEN.

<!-- END VERBATIM integration/2026-11-25_0300_COREALL_REST_ROLE_ROW0.md -->

<!-- BEGIN VERBATIM math/2026-11-25_conductor_dvd_from_factorization.md -->
# MATH lane — factorization level is a multiple of the conductor

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED line-by-line reconstruction of pinned Mathlib
`conductor_dvd_of_mem_conductorSet`, including its gcd descent and nonzero common-level
injectivity step.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, axiom census,
or proof of RH.

## Source ledger

Required RH revision: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem; conductor set; `factorsThrough_gcd`; `changeLevel_injective` |
| `Mathlib/Data/ZMod/Units.lean` | `c93c732e5bedd18aadd8cab7b9baf139bfb41553` | surjectivity behind nonzero-level `changeLevel_injective` |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | downstream RH consumer `prim_mul` through conductor lemmas |

A fresh upstream check on 2026-11-25 found RH HEAD
`fcb6eac7534875d32d68030967e2deae6d686151`. Its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` still pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; current Dirichlet-character Basic blob
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`. Direct extraction and diff found the complete theorem
text below unchanged. This is textual comparison, not equality of elaborated proof terms.

## 1. Exact statement and all hypotheses

Fix a type `R` with `[CommMonoidWithZero R]`, naturals `n,d`, and

    chi : DirichletCharacter R n.

Assume `[NeZero n]` and

    hd : d in chi.conductorSet.

By definition, `hd` says that there are a proof `d|n`, a character
`chi0 : DirichletCharacter R d`, and an equality

    chi = changeLevel(d|n, chi0).                         (1)

The theorem concludes

    chi.conductor | d.                                   (2)

There is no ring, field, `Nontrivial R`, primality, coprimality, positivity, or preselected
primitive-character premise. Write `c = chi.conductor` below.

## 2. Line 1: membership forces the factor level to be nonzero

The proof first installs `[NeZero d]`. If `d=0`, then membership gives `0|n`; because `n!=0`, this
is impossible. Lean packages the contradiction through

    zero_ne_mem_conductorSet chi : 0 notin chi.conductorSet.

This step is not cosmetic. Both `factorsThrough_gcd` and the later injectivity argument need a
nonzero ambient source or target level. It also prevents the degenerate formal level zero from
entering the conductor-set minimum.

## 3. Reduce divisibility to gcd closure of the conductor set

The proof declares it sufficient to establish

    gcd(d,c) in chi.conductorSet.                         (3)

Suppose (3). Because `c` is the natural-number infimum of `chi.conductorSet`, `Nat.sInf_le` gives

    c <= gcd(d,c).                                       (4)

Universally `gcd(d,c) <= c`. Lean uses the strict form needed by its contraposition: if `c` did not
divide `d`, then

    gcd(d,c) != c                                        (5)

by the **right-oriented** equivalence

    Nat.gcd_eq_right_iff_dvd : gcd(d,c)=c <-> c|d.       (6)

The bound `gcd(d,c)<=c`, together with (5), gives `gcd(d,c)<c`, contradicting (4). The call
`Nat.gcd_le_right d (...)` requires `c>0`; this is supplied by `conductor_ne_zero chi`, itself a
consequence of `[NeZero n]` and `c|n`. Thus the conclusion is exactly `c|d`, not `d|c`.

This explains why the theorem is stronger than the bare least-element statement `c<=d`.
Inequality alone does not imply divisibility; gcd closure is the missing arithmetic structure.

## 4. Unpack the given factorization

Lean next destructs `hd` into the three pieces already displayed in (1):

    hd  : d|n,
    chi0 : DirichletCharacter R d,
    hchi0 : chi = changeLevel(hd,chi0).                   (7)

The conductor factorization supplies independently

    c|n,
    primitiveCharacter : DirichletCharacter R c,
    changeLevel(c|n,primitiveCharacter) = chi.            (8)

To invoke `factorsThrough_gcd chi0 primitiveCharacter`, the source requires equality of those two
characters after lifting to the product level `d*c`:

    changeLevel(d|d*c,chi0)
      = changeLevel(c|d*c,primitiveCharacter).            (9)

Notice the theorem is called with the **d-level** character as its first argument. Its conclusion
is therefore initially that `chi0` factors through `gcd(d,c)`, not directly that `chi` does.

## 5. Why equality at `d*c` holds

Equation (9) is the difficult step. The two known equalities (7) and (8) live at level `n`, while
`d*c` need not divide `n` and `n` need not divide `d*c`. The source does not identify these levels
or silently cancel them.

Instead it uses the further common multiple

    M = d*c*n.                                            (10)

Since `d!=0`, `c!=0`, and `n!=0`, Lean constructs `[NeZero M]`. It then applies

`changeLevel_injective` to the divisibility `d*c | M`. Therefore it is enough to prove equality
after both sides of (9) are lifted from `d*c` to `M`.

For the left side, `changeLevel_trans` rewrites the path

    d -> d*c -> M

as the path

    d -> n -> M.

At level `n`, (7) replaces the lift of `chi0` by `chi`. For the right side, transitivity rewrites

    c -> d*c -> M

as

    c -> n -> M,

and (8), namely `changeLevel_primitiveCharacter`, again replaces the intermediate lift by `chi`.
Both final characters are thus the same lift of `chi` from `n` to `M`.

The Lean `rw` block also normalizes the multiplication associations and the proposition-valued
divisibility witnesses. The mathematics is equality of the two composites just described; it does
not introduce a numerical identification between `n` and `d*c`.

Injectivity at a nonzero multiple is backed by surjectivity of

    Units(ZMod M) -> Units(ZMod (d*c)).

Consequently equality after the lift to `M` reflects equality at `d*c`, establishing (9).

## 6. `factorsThrough_gcd` and the return to the original character

The exact supplier has the contract

    factorsThrough_gcd (alpha at level a) (beta at level b)
      (their lifts to a*b agree)
      : alpha.FactorsThrough(gcd(a,b)),                   (11)

under `[NeZero a]`. Internally it uses the kernel criterion and a Chinese-remainder representative;
that internal CRT proof is not re-proved in this contribution.

Applying (11) to `chi0`, `primitiveCharacter`, and (9) produces

    chi1 : DirichletCharacter R gcd(d,c),
    chi0 = changeLevel(gcd(d,c)|d,chi1).                  (12)

Compose (12) with (7). `changeLevel_trans` gives

    chi = changeLevel(gcd(d,c)|n,chi1).                   (13)

The divisor in (13) is the explicit composite

    gcd(d,c)|d|n.

Thus (13) is precisely membership (3). Section 3 now yields `c|d`, completing the theorem.

## 7. Comparison with the prior interpretation and downstream link

The previous MATH conductor report correctly identified a gcd closure argument but compressed two
points that are now corrected:

1. `factorsThrough_gcd` first descends `chi0` at level `d`; only transitivity returns that witness to
   `chi` at level `n`.
2. The source proves (9) by lifting to the specifically nonzero level `d*c*n` and then invoking
   injectivity. It does not infer equality at `d*c` directly from the two factorizations at `n`.

The immediate next theorem is

    mem_conductorSet_iff_conductor_dvd (hd:d|n) :
      d in chi.conductorSet <-> c|d.

Its forward direction is this theorem. Its reverse direction uses `factorsThrough_conductor` and
`FactorsThrough.mono`. `conductor_changeLevel`, the power and product conductor bounds, and pinned
RH `prim_mul` then consume this divisibility characterization. Formal level is never substituted
for conductor.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_dvd_from_factorization.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_dvd_from_factorization.py

Observed output:

    conductor divisibility regression: OK; report_checks=8, characters=90, factor_levels=159, gcd_descents=159, product_equalities=159, common_level_equalities=159, injectivity_checks=159, divisibility_checks=159, negative_controls=4

The exact checker enumerates all `C_60`-valued characters of `Units(ZMod n)` for `1<=n<=18`.
For every character and every divisor level through which it actually factors, it recovers the
conductor as the least fibre-constant divisor, constructs the lower characters, checks descent to
`gcd(d,c)`, equality at `d*c`, equality after the further lift to `d*c*n`, unit-map surjectivity for
the injectivity step, the minimality squeeze, and the final orientation `c|d`.

This is an independently checkable finite regression of the proof skeleton. It is not a universal
proof for arbitrary coefficient monoids, a Lean elaboration, or an axiom audit.

## Failed attempts / limitations

- Replacing gcd closure by the inequality `c<=d` fails: `3<=4` but `3` does not divide `4`.
- An abstract factor-level set `{3,4}` has least element `3` and contains `4`, but is not gcd closed;
  therefore least membership alone cannot prove divisibility.
- Dropping the nonzero common target invalidates injectivity. At formal level zero, the exponent-1
  and exponent-3 characters modulo 5 agree on the only integer units `+/-1` while remaining distinct.
- Membership at `d=0` is impossible when `n!=0`; ignoring this makes the later nonzero instances
  unavailable.
- The checker uses positive levels at most 18 and `C_60` values. It does not prove the polymorphic
  theorem.
- No Lean, Lake, or Elan executable was available locally. The result remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `factorsThrough_gcd` line by line, expanding the exact
`Nat.chineseRemainder'` representative, the two coprimality proofs that make a unit at level `n*m`,
and the two `changeLevel_eq_cast_of_dvd` evaluations. Preserve its asymmetric conclusion: it proves
factorization of the first character through `gcd(n,m)`.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.

<!-- END VERBATIM math/2026-11-25_conductor_dvd_from_factorization.md -->

<!-- BEGIN VERBATIM specialists/galois_representations/RUN21_BOREL_CLASS_NUMBER_TRANSFER.md -->
# RUN21 — Borel class-number transfer to simultaneous local similitudes
2026-11-25. SOURCE-MATCHED local reconstruction; full proof OPEN. Continuation of RUN20 (14342760cb4c8928b875856f1076761df8a2ef5e). Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research state/log/protocol/continuity excerpts, CI #414 (03:20:09Z, physics only), RUN20, recent 25 branch titles and peer commit patches with available RESUME HERE extracts. Integration owns CoreAll/rest. No duplicate of this task observed. Not every peer file or linked external blueprint reread. No physical gates or queue changes.

## Provenance
leanprover-community/riemann-hypothesis P=40e56bab026552e089d7afcfeff08d2defb9c005, observed upstream H=fcb6eac7534875d32d68030967e2deae6d686151 (2026-11-25 02:41:16 UTC; previous observed c40250a50104b7e02e7d74f658d00fa7b1f4827c). No global equivalence asserted.
D=src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/; A=src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/.
- P D/BorelFiniteClassNumberCentraliserTorus.lean eb0e8b871942dc286ed3a608e0d9f85586487764; H same path 386b699f5c74639e776a4349179578d1c191d7d9. Eight helpers at P17–83/H120–186; classes_finite P90–235/H193–346. H former Statement wrapper path returns 404; P wrapper 4e885888b095fc213c539329d11fd46675ac939f targets this theorem.
- P src/Formalism/UnipotentAdelicQuotients/ClassNumberFinite.lean 3091d81ebe36154e6c5198d460346a7be9344e47 L7–34 (definitions, NOT proofs).
- P D/TC.lean acd3572dbe7bd22e5219b8c255f0071fb179234b L10–16.
- P D/FiniteDoubleCosetAwayP.lean 26fb680c011b5ed9876fcb4736b44078d928a290, adele_split near L56.
- P A/IsClosedZeroLocusGL.lean 872ebed26ce26122d9369d735f3f1c5d51270b54 L9–41; H inlined in Borel file H68–110.
- P D/FiniteDoubleCosetDefiniteHermitianFormLevel.lean 70e22df080db715cc6051bb145acd84d761d21c9 L18–31; H Statement path 891c6c097d69c881dfc0d8fac96306ad030bbaef L94–107.
- P D/PolynomialZeroLocusCoordinatesStatement.lean 8de31dde746277b27c2808acb32d3682964f98ca points to native D/PolynomialZeroLocusCoordinates.lean 9f53cdb64b8e02e9776d9bc8b3084a49f8b7b6de, exists_locus L476–516.
- P A/ClassNumberFiniteHolds.lean a0e3a4d423be75495b519125cf2e58c0ba5998ba, classNumberFinite_holds L11–28; inspected supplier imports and final finite product, not all underlying proofs.

## 1. Exact hypotheses
Fix finite-dimensional unital Q-algebra D (not assumed commutative), ring hom sigma:D→D^op (anti-multiplicative after unop; do not assume involutivity), beta,y in D, prime p. For every commutative Q-algebra R let TC_R consist of pairs (a,c) in (R⊗D)^× × R^× satisfying a(1⊗beta)star_R(a)=c(1⊗beta) and [a,1⊗y]=0. No positivity or invertibility assumption on beta or y is imposed here. Multipliers are units.
hbr is a universally quantified representation theorem: for each D,sigma,beta,y choose N, a set S of rational multivariate polynomials on N×N matrices and hS asserting the zero locus within GL_N(R) contains 1 and is closed under multiplication and inverse for EVERY commutative Q-algebra R. Write G(R) for that subgroup. One family of homomorphisms phi_R:G(R)→(R⊗D)^××R^× must be injective, have range exactly TC_R, be natural for EVERY Q-algebra hom f:R→R', and be continuous for every topological commutative Q-algebra R with IsTopologicalRing R, using module topology on R⊗D. These are separate premises. The construction below uses the range, naturality and continuity parts explicitly; retain injectivity too. S need not be finite.
hB is ClassNumberFinite: for every number field F, polynomial group locus G, and every compact OPEN subgroup J of G(A_f(F)), there is a finite T such that each g is gamma s u, gamma rational locus point, s∈T, u∈J. This is an imported arithmetic theorem, not a consequence merely of topological compactness.
Let A=finite adeles of Q, A1=AfP p, A2=Q_p; X=(A1⊗D)^××A1^× times (A2⊗D)^××A2^×, with module topologies. U≤X need not be open or compact in X: only assume some open O containing 1 with O∩(TC_A1×TC_A2)⊆U. Conclusion: finite S0⊂X, chosen before z, such that each z∈TC_A1×TC_A2 is dg(D,p)(gamma) s u, gamma∈D^××Q^× satisfying rational similitude and commutation equations, s∈S0, u∈U. Rational multiplier may be negative.

## 2. Functoriality and gluing
For f:R→R', polynomial evaluation commutes with applying f to each matrix entry: check constants, addition and multiplication by a variable (MvPolynomial.induction_on). Thus the entrywise map on invertible matrices takes zero-locus points to zero-locus points, giving the monoid hom locMap. Composition follows entrywise; continuity is continuous matrix map then continuous units map then restriction to subgroup. The latter uses topology on units including inverse coordinates, not merely the topology on arbitrary matrices.
The imported adele_split gives continuous algebra maps pi1:A→A1, pi2:A→A2 whose pair is bijective. Define Phi(g)=(phi_A1(locMap(pi1)g),phi_A2(locMap(pi2)g)). It is a continuous homomorphism and every image point satisfies both TC equations by the range hypothesis.
Surjectivity ON THE TC PRODUCT (not the full ambient X): given z satisfying both TC equations, choose g1,g2 from the two ranges. Let s be a right inverse of the paired projection. Lift the entries of g1,g2 to a matrix M over A using s; lift the entries of g1^-1,g2^-1 to M'. The two projections of MM' and M'M equal identity. Joint injectivity of the projections, applied entrywise, gives BOTH MM'=I and M'M=I. Thus M defines a unit G in GL_N(A), not just an arbitrary matrix. For each polynomial P∈S, its evaluation at M projects to zero twice by evaluation naturality and local locus membership. Joint injectivity again implies evaluation is zero. Hence G∈G(A). Its two projected matrices are exactly g1,g2 (subtype and unit extensionality), so Phi(G)=z. This is hsurj. No inverse continuity of the paired projection is used.

## 3. The compact-open reduction (essential, not optional)
Set U'=Phi^-1(U) as a subgroup of G(A). The set Phi^-1(O) is an open identity neighborhood and is contained in U' because every Phi(g) satisfies TC in both factors. A subgroup containing an identity neighborhood is open, and an open subgroup is closed (complement a union of open cosets). This proves U' open and closed even though U may be neither in X.
Choose a compact open subgroup K≤G(A) using LocusOpenCompact.exists_isOpen_isCompact. Its own native proof: evaluation is continuous by the same polynomial induction; the locus is an arbitrary intersection of closed polynomial zero sets in GL over a Hausdorff topological ring. The finite adele ring is Hausdorff via its restricted-product construction. Restrict the imported GLIntegral compact open subgroup of the full GL to this closed locus. The closed embedding of the locus gives compact preimage, and continuity gives open preimage. GLIntegral existence remains an imported supplier.
J=U'∩K is open as intersection of opens and compact as closed subset of K. Now hB applies to J. Applying hB directly to U or U' would omit the compactness premise. Obtain finite T0 independent of the eventual z, with g=locMap(Q→A)(gamma_L) s u for rational locus point gamma_L, s∈T0 and u∈J.

## 4. Rational descent and exact cover
Let w=phi_Q(gamma_L)∈(Q⊗D)^××Q^×. It satisfies TC_Q. The canonical algebra equivalence lid:Q⊗D→D, q⊗d↦qd, transports star_Q to sigma (unop), by tensor induction and preservation of rational scalar multiplication; it transports the form and commutation equations by multiplication and map of commute. Put gamma=(lid^×(w.1),w.2). Then gamma is rational and satisfies exactly the required similitude and commutation equations (tc_rat).
For any Q-algebra B, (Q→B)⊗id_D on Q⊗D equals includeRight∘lid. Verify pure tensors then additive induction (map_ofId_eq). The composite Q→A→Ai is the canonical Q-algebra map. By locMap_comp and the naturality of phi, each of the two components of Phi(locMap(Q→A)(gamma_L)) equals the corresponding component of dg(D,p)(gamma). For the unit component use map_ofId_eq and unit extensionality; for scalar units use the canonical map. Therefore this equality holds in all four coordinates, not only the underlying matrices.
Take S0=T0.image(Phi); |S0|≤|T0| (explanatory bound). For z choose g from surjectivity, factor it by hB, apply Phi multiplicatively: z=dg(gamma) Phi(s) Phi(u), with Phi(s)∈S0 and Phi(u)∈U since u∈J⊆U'. This proves classes_finite. No sign choice is made here; RUN20 separately performs the positive-multiplier correction for definite forms.

## 5. Consumer and upstream changes
P ccf_holds invokes the wrapper of classes_finite with wrappers for TorLoc.exists_locus and classNumberFinite_holds. H directly calls the native classes_finite and exists_locus. This supplies CCF used in cover_KHT→finite_doubleCoset→forms_fin→specOfF→specData→specTopG→PlanEx→Pack→GeoOne→local-global compatibility→EveryCharacter→RH, a source-level consumer chain reconstructed in earlier runs, not a newly authenticated full root path.
Of nine P/H declaration comparisons, six exact and three different. lid_starT and map_ofId_eq change map_add to map_add (f := _) in the add branch. classes_finite replaces the call to adele_split with its explicit construction: compose the continuous finite-adele equivalence over rationals/integer rings with AfP.restr and the p-adic projection; use continuous restrictions and bijectivity of the pair. This is exactly the same construction seen in the P adele_split source (line wrapping differs). The nine statement prefixes are unchanged (replay below). Upstream import organization changed substantially; no global equivalence or kernel replay inferred.

## 6. Reproducibility
Executed connector + V8: full two native source snapshots, nine declaration comparisons (6 identical / 3 differing), 21 exact P anchors; supporting definition and supplier files fetched as listed. No local Lean executable used. Checkout replay below also checks statement prefixes and git object IDs; this Python replay has not independently been run in a checkout. It is a source regression check, not proof validation.

~~~python
import re, subprocess, sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="fcb6eac7534875d32d68030967e2deae6d686151"
path="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/BorelFiniteClassNumberCentraliserTorus.lean"
def git(*a):
    return subprocess.check_output(["git","-C",repo,*a]).decode()
def read(ref,sha):
    assert git("rev-parse",ref+":"+path).strip()==sha
    return git("show",ref+":"+path)
p=read(P,"eb0e8b871942dc286ed3a608e0d9f85586487764")
h=read(H,"386b699f5c74639e776a4349179578d1c191d7d9")
names=["aeval_map_entries","mem_locus_map","locMap","locMap_comp","continuous_locMap","lid_starT","map_ofId_eq","tc_rat","classes_finite"]
def decl(s,n):
    a=s.splitlines()
    i=next(i for i,l in enumerate(a) if re.match(r"^(theorem|def) "+n+r"\s",l))
    j=next((j for j in range(i+1,len(a)) if re.match(r"^(theorem |def |end |namespace |section )",a[j])),len(a))
    return "\n".join(a[i:j]).strip()
changed=[]
for n in names:
    x,y=decl(p,n),decl(h,n)
    assert x.split(":= by",1)[0].strip()==y.split(":= by",1)[0].strip()
    if x!=y: changed.append(n)
assert changed==["lid_starT","map_ofId_eq","classes_finite"]
anchors=["induction P using MvPolynomial.induction_on","rw [aeval_map_entries, h, map_zero]","Continuous.units_map","induction x using TensorProduct.induction_on","Function.surjInv hbij.2","have hinjM","let M' : Matrix","have hMM'","have hM'M","have hG","U.comap Φ","Subgroup.isOpen_of_mem_nhds","U'.isClosed_of_isOpen hU'o","U' ⊓ K","hKc.inter_left hU'c","T₀.image Φ","tc_rat σ β y w hw","hnat ℚ (AfP p)","hnat ℚ ℚ_[p]","Subgroup.mem_inf.1 hu","rw [hg, map_mul, map_mul, hΦγ]"]
for a in anchors: assert a in p,a
print("2 pinned blobs, 9 declarations, 6 identical, 3 changed, 21 anchors")
~~~

RESULT: DONE local source-matched Borel transfer and closed-locus compact-open reduction. PARTIAL underlying arithmetic inputs: classNumberFinite_holds, GLIntegral compact-open, actual polynomial group-locus construction, local centralizer theorem, earlier frob_laws and relocated proof gaps. No synthetic arithmetic matrices, no independent Lean kernel validation, no URT speed claim. No full proof percentage.
RESUME HERE: expand TorLoc.exists_locus in pinned D/PolynomialZeroLocusCoordinates.lean L476–516, specifically blk and coordA/coordC, cond_zero_iff, isUnit_of_blk_mul, tc_inv and psi_bijective, preserving arbitrary commutative Q-algebras and both inverse conditions. Then classNumberFinite_holds and its integral-level supplier; ask dependency/kernel lanes for role-labelled Main path to classes_finite and ccf_holds plus previous specAlg/specOfF/finite_doubleCoset targets, not a fresh full-corpus scan. HANDOFF TO Galois, integration, dependency, kernel, literature, editor, audit. Project OPEN.

<!-- END VERBATIM specialists/galois_representations/RUN21_BOREL_CLASS_NUMBER_TRANSFER.md -->

<!-- BEGIN VERBATIM specialists/landau_criterion/RUN21_COMPLEX_QUADRATIC_GAUSSIAN.md -->
# RUN21 — Complex quadratic Gaussian integral and oriented contour
2026-11-25. RESULT: DONE local source-linked human reconstruction and finite regressions; Main-root authentication and independent Lean replay OPEN.

## Provenance and continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN20 (f60a99d02413e8ac451de3d03562384f964dc384), state/log/protocol/continuity excerpts and CI #413 (45534517299, physical checks only). Inspected 14 recent peer commit patches and visible RESUME notes, editor manuscript tail and 300-target dependency frontier; no duplicate of this scalar contour lemma located. Not all full peer files or linked PDF reread. No physics queue changes.
RH baseline P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed H=fcb6eac7534875d32d68030967e2deae6d686151 (merge PR #1853 batch 12), advanced from c40250a50104b7e02e7d74f658d00fa7b1f4827c. Manifest blobs b4d1ec31575a26b2159ec3a262b482bc051f3f6f and 8a747b58a34565cc6cb5341b86544aa5d3a20a2d fetched; Mathlib pins M=0df444a360eaa60ab8c11dca51a86af692955474 and N=31ce06eaadf4a200c0e1407c5f10953cf606b8f8; N unchanged from RUN20.
Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean: M blob e66f719517bc84d4a2ff3deafd3b47868b700bd4 (retrieved by prior RUN20 blob ID; direct M ref returned 404, historical binding relies on earlier checkpoint); N blob 294a34af1ed797d766970f31593ed462836fb132 fetched at N. Ten declaration blocks compared M/N49–199: nine identical, one tactic-only difference in verticalIntegral_norm_le L69–105 (congr -> enter [1]). No changed statement in these blocks.
N Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean blob ec5f214fa4f7b8aff766bd5068da0a8a20370b49, L223–272 integral_gaussian_complex continuity/sign; not yet compared to M.
P src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean blob 2ed00ad3aa862f3e522686557fb8f559b17fc002 re-fetched; same path at H returned 404, relocation unresolved. No upstream whole-proof equivalence asserted; keep P baseline.

## 1. Statement and branch
FourierTransform L173–186 integral_cexp_quadratic: for complex b with Re(b)<0 and arbitrary complex c,d,
 integral_R exp(b x²+c x+d) dx = (pi/(-b))^(1/2) exp(d-c²/(4b)).
The complex power is principal, not an arbitrary solution of the squared identity. Re(-b)>0 implies Re(pi/(-b))>0 and nonzero. RUN20 Fourier transform substitutes b=-pi a_F, c=2pi(b_F-it), d=0. Distinguish a=-b=A+iB, A>0, in the contour proof.

## 2. Shifted Gaussian integrability (L54–68,122–131)
For real x,h, Re(-a(x+ih)^2)=-A x²+2Bxh+Ah²=-A(x-Bh/A)^2+h²(B²/A+A).
The integrand norm equals the exponential of this real expression. The translated real Gaussian is integrable since A>0; multiplication by its finite constant preserves integrability. Includes h=0 and h<0. Finite intervals integrable by continuity. Division by A needs A!=0; integrability needs A>0.

## 3. Vertical side estimate (L49–50,69–120)
For f(z)=exp(-az²), T>=0, arbitrary real h define V(T)=i integral_0^h [f(T+iy)-f(T-iy)]dy.
On the unoriented interval |y|<=|h|, each edge norm <= exp(-AT²+2|B||h|T+Ah²). Triangle inequality and interval length |h| yield
 |V(T)| <= 2|h| exp(-AT²+2|B||h|T+Ah²).
For T>=4|B||h|/A the linear term <= AT²/2, giving the simpler explicit envelope
 |V(T)| <= 2|h| exp(Ah²) exp(-AT²/2) -> 0.
No uniformity in unbounded h or A down to zero asserted. |h| essential for negative h. Threshold is an alternative bound, not a changed theorem.

## 4. Oriented rectangle (L133–171)
I1=integral_-T^T f(x+ih)dx, I2=integral_-T^T f(x)dx, I4=integral_0^h f(T+iy)dy, I5=integral_0^h f(-T+iy)dy.
Entire f has zero contour integral along -T -> T -> T+ih -> -T+ih -> -T. h<0 reverses orientation but zero remains:
 I2-I1+iI4-iI5=0.
Evenness gives f(-T+iy)=f(T-iy), so I1=I2+V, not I2-V. h=0 or T=0 degenerate identities follow directly. No poles. Absolute integrability gives convergence of I1 and I2 to full real integrals; V->0 by section 3. Uniqueness of limits:
 integral_R f(x+ih)dx=integral_R f(x)dx=(pi/a)^(1/2).
The last equality is the imported integral_gaussian_complex, not inferred from the contour identity.

## 5. Complete square (L173–199)
b!=0 follows from Re(b)<0. With w=c/(2b)=u+ih, u,h real,
 bx²+cx+d=b(x+w)²+d-c²/(4b).
Multiplicativity separates the constant exp factor. Lebesgue translation invariance removes u by t=x+u; section 4 removes ih with a=-b. This proves the formula with no real restriction on c,d,w. Native integrable_cexp_quadratic' uses contradiction: if nonintegrable the totalized Bochner integral equals zero, but formula is nonzero (pi/(-b) nonzero, cpow and exp nonzero). Human direct integrability also follows from |exp(bx²+cx+d)|=exp(-A(x-Re(c)/(2A))²+Re(d)+Re(c)^2/(4A)). Positive-a version L195–198 substitutes b=-a. At Re(b)=0, b=i,c=d=0 has modulus one, not absolutely integrable (conditional Fresnel conventions differ); b=1 grows.

## 6. Principal sign and dependency direction
GaussianIntegral N L223–272 establishes continuity of J(a)=integral_R exp(-a x²)dx on right half-plane by local Gaussian domination. It compares J²=pi/a with K²=pi/a, K=(pi/a)^(1/2), and uses connectedness, nonvanishing K and positive normalization at a=1. Indeed continuous J/K takes only -1,1, hence is constant and equals 1 at a=1. Polar/Fubini square identity and radial integral remain next detailed native supplier, not an RH premise.
Direction: real Gaussian/radial integrals + dominated convergence + connected sign -> complex Gaussian -> contour displacement -> quadratic integral -> Fourier transform -> Poisson -> theta/Mellin (RUN19–20) -> Hurwitz residue/boundary prerequisites -> conditional Landau criterion. These are local source-linked imports, NOT authenticated Main-root kernel reachability. Preserve 0<theta<1, delta>0, positivity of exceptional real-pole residues and P zeroFree_of_rpow_window quantifiers: for every real Y0 exists Y>=Y0 such that bound holds for every y in [Y,Y^(1+delta)]. Do not claim arithmetic window constructed or interior zero exclusion without premises. No URT improvement or full RH proof.

## 7. Executed certificate
Extract JS and run with Node. BigInt exact checks cover cleared complex square, real exponent identity, edge envelope, threshold. Double-precision Simpson quadrature checks finite oriented rectangle for both signs h and quadratic integral against principal closed form. For direct sampling, after centering real envelope, R=12/sqrt(A), omitted modulus <= exp(Re(d)+Re(c)^2/(4A))*exp(-AR²)/(AR), by bounding the two Gaussian tails with integral of x/R exp(-Ax²). Quadrature rounding/discretization is not rigorously enclosed. Initial 2048-panel rectangle run failed 2e-10 tolerance; diagnostic max 1.918789976431429e-9, refined to 8192 panels without changing tolerance. Finite tests supplement the general derivation. Controls distinguish wrong sign and orientation and illustrate strict half-plane necessity.
```js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 const add=([a,b],[c,d])=>[a+c,b+d], sub=([a,b],[c,d])=>[a-c,b-d], mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c], sq=z=>mul(z,z), eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],sc=(z,k)=>[z[0]*k,z[1]*k];
 let polynomial=0,edge=0,threshold=0,contours=0,quadratics=0,controls=0,maxContour=0,maxQuad=0;
 for(let a=-4n;a<=-1n;a++)for(let b=-4n;b<=4n;b++)for(let c=-3n;c<=3n;c++)for(let d=-3n;d<=3n;d++)for(let x=-5n;x<=5n;x++){
  const B=[a,b],C=[c,d],D=[2n,-1n],xx=[x,0n];
  ck(eq(mul(sc(B,4n),add(add(mul(B,sq(xx)),mul(C,xx)),D)),sub(add(sq(add(sc(mul(B,xx),2n),C)),sc(mul(B,D),4n)),sq(C))),"complex square");polynomial++;
 }
 for(let A=1n;A<=5n;A++)for(let B=-5n;B<=5n;B++)for(let T=0n;T<=10n;T++)for(let h=-5n;h<=5n;h++)for(let y=-5n;y<=5n;y++){
  const abs=x=>x<0n?-x:x;if(abs(y)>abs(h))continue;
  const actual=-A*T*T+2n*B*T*y+A*y*y;
  ck(mul([-A,-B],sq([T,y]))[0]===actual,"edge exponent");
  ck(A*actual===-((A*T-B*y)**2n)+y*y*(B*B+A*A),"real square");
  const bound=-A*T*T+2n*abs(B)*abs(h)*T+A*h*h;
  ck(actual<=bound,"edge envelope");edge++;
  if(A*T>=4n*abs(B)*abs(h)){ck(2n*bound<=-A*T*T+2n*A*h*h,"large T envelope");threshold++;}
 }
 const abs=z=>Math.hypot(...z), exp=([a,b])=>[Math.exp(a)*Math.cos(b),Math.exp(a)*Math.sin(b)], div=(a,b)=>sc(mul(a,[b[0],-b[1]]),1/(b[0]**2+b[1]**2)), sqrt=z=>sc([Math.cos(Math.atan2(z[1],z[0])/2),Math.sin(Math.atan2(z[1],z[0])/2)],Math.sqrt(abs(z)));
 function integrate(f,l,r,N=8192){let acc=add(f(l),f(r));for(let j=1;j<N;j++)acc=add(acc,sc(f(l+(r-l)*j/N),j%2?4:2));return sc(acc,(r-l)/(3*N));}
 for(const A of [.5,1,2])for(const B of [-1.5,-.5,0,.5,1.5])for(const h of [-1,-.25,0,.25,1])for(const T of [.7,1.5,3]){
  const f=z=>exp(mul([-A,-B],sq(z))),I1=integrate(x=>f([x,h]),-T,T),I2=integrate(x=>f([x,0]),-T,T);
  const V=integrate(y=>mul([0,1],sub(f([T,y]),f([T,-y]))),0,h);
  const err=abs(sub(I1,add(I2,V)))/Math.max(1,abs(I1)+abs(I2)+abs(V));
  ck(err<2e-10,"oriented rectangle");maxContour=Math.max(maxContour,err);
  ck(abs(V)<=2*Math.abs(h)*Math.exp(-A*T*T+2*Math.abs(B)*Math.abs(h)*T+A*h*h)+1e-10,"edge bound");contours++;
 }
 for(const A of [.5,1,2])for(const B of [-1,0,1])for(const cr of [-1,0,1])for(const ci of [-.7,0,.7]){
  const b=[-A,B],c=[cr,ci],d=[.2,-.3],m=cr/(2*A),R=12/Math.sqrt(A);
  const I=integrate(x=>exp(add(add(sc(b,x*x),sc(c,x)),d)),m-R,m+R,4096);
  const expected=mul(sqrt(div([Math.PI,0],sc(b,-1))),exp(sub(d,div(sq(c),sc(b,4)))));
  const err=abs(sub(I,expected))/Math.max(1,abs(I)+abs(expected));
  ck(err<1e-11,"quadratic integral");maxQuad=Math.max(maxQuad,err);quadratics++;
 }
 ck(Math.abs(Math.sqrt(Math.PI)-(-Math.sqrt(Math.PI)))>3,"wrong root");controls++;
 const f=z=>exp(sc(sq(z),-1)),v=integrate(y=>mul([0,1],sub(f([1,y]),f([1,-y]))),0,1);
 ck(abs(v)>.1,"wrong orientation detectable");controls++;
 ck(Math.abs(abs(exp([0,4]))-1)<1e-15,"pure imaginary lacks absolute integrability");controls++;
 ck(Math.exp(4)>1,"positive coefficient grows");controls++;
 return {exact_complex_square_cases:polynomial,exact_edge_cases:edge,exact_threshold_cases:threshold,oriented_rectangle_cases:contours,quadratic_integral_cases:quadratics,negative_controls:controls,max_scaled_rectangle_residual:maxContour,max_scaled_quadratic_residual:maxQuad};
}
console.log(JSON.stringify(certificate()));
```
Actual execution output: `{"exact_complex_square_cases":19404,"exact_edge_cases":42955,"exact_threshold_cases":11295,"oriented_rectangle_cases":225,"quadratic_integral_cases":81,"negative_controls":4,"max_scaled_rectangle_residual":7.494667064492352e-12,"max_scaled_quadratic_residual":1.9428867267853114e-15}`.

## RESUME HERE
Expand actual integral_gaussian_sq_complex and integral_mul_cexp_neg_mul_sq suppliers in GaussianIntegral.lean at N, recover M by authentic blob/ref if available; preserve Fubini absolute integrability, polar Jacobian, null excluded ray, radial endpoint and connected sign. Coordinate with theta/editor on Gaussian base and request authenticated Main-root role paths for Landau, zeroFree_of_rpow_window and imported leaves. If root path unavailable, keep local translation separately labelled. Arithmetic window supplier and independent kernel replay OPEN.
HANDOFF TO Landau, theta, editor, integration, dependencies, kernel, audit, prime.

<!-- END VERBATIM specialists/landau_criterion/RUN21_COMPLEX_QUADRATIC_GAUSSIAN.md -->

<!-- BEGIN VERBATIM specialists/literature_provenance/RUN21_CRYSTALLINE_CONNECTION_AND_BASE_CHANGE.md -->
# RUN21 — Crystalline connection: tensor splitting, base change and Gauss–Manin
2026-11-25. SOURCE-MATCHED local reconstruction; full RH OPEN. Continues RUN20 (b8d56b09344a4fe972a4bdbf16bae9f0a4895cab). No Cathedral physics changes.

Preflight: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state excerpts, log head, research/continuity protocols, CI summary (45538182382 at b7b2208, unrelated Cathedral PASS), RUN20 full content, RUN14/15 relevant lines. Recent commit listing and handoff excerpts from math, audit, character boxes, kernel, integration, geometry, dependencies and editor; theta/Galois/prime/Landau/structure/acceleration recent commit titles inspected, not all detailed notes recovered. No overlapping task in inspected records. Blueprint not re-read in full; source direct.

## Source ledger
Repository leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. Paths below relative to src/Development/.
- AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean (E), blob 6d297c66f38f4c8ec5e21ec7ffe2fc53a9960a49.
- AbelianVarietyTheory/Definitions/Divisors/IsKSValueOneOfRetraction.lean (K), blob 4cb728f371c0bd82fdbe21c0339552a02519c1a4.
- AbelianVarietyTheory/PublishedTheorems/Divisors₂/CrysToDRBijective.lean (C), blob 9b005affbcf5e67a6578a405aefe484b57ad940b.
- WeilBound/CoreStatements/AutomorphicKernels/DualAbelianScheme/AbelianDeRhamDuality/AbelianDeRhamDuality.lean (D), blob bf38bb3decc713a4cbbabd8fb847247fcdf3df8c.
- WeilBound/CoreStatements/AbelianDeRhamStructure/AbelianDeRhamPages/AbelianDeRhamStructureOfPage.lean (P), blob 3deb4a5569bcfdcf9b8a77e3e053ba4ab232af6f.
- WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/CrystallineDeRham.lean (R), blob efc95dd74b086a96d3de1f13d40c04d4d4796931.
Blob IDs returned by GitHub, not independently recomputed here. Exact reproduction: git show PIN:src/Development/PATH | git hash-object --stdin. Upstream observed fcb6eac7534875d32d68030967e2deae6d686151. Same E path blob b2fb2ea7c10836b0ac385e6f875938eb99fb469b (unchanged from prior run); 36/142 pinned lines 242–383 match an ordered subsequence of the current file, and 27/29 lines 400–428. E no longer contains secMor, inlMor, prMor, inrPull, IsConn, existsUnique_isConn, existsUnique_isConn_of_lift, existsUnique_gaussManin declarations; migration destinations NOT located. Do not infer deletion from the entire corpus or semantic equivalence. Current K blob b41a14a661784adab1974f29e278094a155cb2fd still defines IsBC at L317. Pinned evidence governs.

## 1. Precise hypotheses and maps (E L18,72–74,204–208,242–307; K L29–34,66–73,132–142,262–276)
R commutative, ideal I with divided powers κ, M central R-bimodule as in RUN20 (additive commutative group, R and Rᵐᵒᵖ module actions, IsCentralScalar). T commutative base with Algebra T R, Module T M and IsScalarTower T R M. D:T-relative derivation R→M. Assume hD:IsDPDer κ D, i.e. D(γ_(n+1)(a))=γ_n(a)D(a) for every natural n and a∈I. No freeness/flatness assumed. Set E=R⊕M square-zero extension, J=pr⁻¹I, Γ as in RUN20. The section s(a)=(a,D(a)) is a ring map by Leibniz. It is a PD map: ideal inclusion follows from first coordinate; Γ_n(s(a)) and s(γ_n(a)) have equal first coordinates; second coordinate equality is D(1)=0 at n=0, and hD at n>0. The constant inclusion i(a)=(a,0) and projection pr are PD maps too.

Let S be a scheme, t:S→Spec R, A a group object over S. P=prim κ t A denotes the primitive submodule of crystalline H¹: pullback under product of two points equals the sum of pullbacks (all test objects/points, K L29–34). Q=prim Γ (t∘Spec(pr)) A. A GrpMor is a proposition with four fields: PD compatibility, base triangle, morphism over the base, multiplicativity on all points (K L66–73). E L264–278 secMor, inlMor, prMor use the identity group morphism and the base triangle from pr∘s=id or pr∘i=id. Their induced pullbacks s*,i*:P→Q are semilinear for s,i, and pr*:Q→P is semilinear for pr. The identity relations pr*s*=id and pr*i*=id follow from functorial pullback K L138–142, not from assuming cohomology is free.

L=liftSemi(i*): E⊗_R P→Q, L(x⊗c)=x i*(c). H:(inlMor M κ t A).IsBC means precisely bijectivity of L (K L276), with H.1 injectivity and H.2 surjectivity. This is an extra local premise, not built into the definition of primitive cohomology. Define j=(inrHom).rTensor P:M⊗P→E⊗P, d=(sndHom).rTensor P in the reverse direction, and J=L∘j (inrPull). Since snd∘inr=id, d∘j=id on tensors without flatness. J(m⊗c)=(0,m)i*(c); J additive, J(0)=0; xJ(w)=J(pr(x)w), by tensor induction (E L290–307).

IsConn hD c ω (E L285–286) is s*(c)=i*(c)+J(ω).

## 2. Existence and uniqueness (E L356–383)
For arbitrary z∈E⊗P, decompose its E factor into (a,0)+(0,m). On simple tensors, then finite sums, this yields
    L(z)=i*(pr*L(z))+J(d z).
Reason: pr*L((a,m)⊗c)=a c and d((a,m)⊗c)=m⊗c. This is the source's auxiliary d identity, distinct from the notation d for the tensor component projection.

For c∈P, let y=s*(c)−i*(c). Since pr*y=0, H.2 supplies z with L(z)=y; the displayed decomposition gives y=J(d z). Thus ω=d z exists. For uniqueness cancel i*(c) from two proposed solutions, use H.1 to get j(ω)=j(ω'), then apply the left inverse d. This reproduces the actual proof order (first proves j injective, then uniqueness via H.1, existence via H.2, pr*s*=id and tensor decomposition). No assumption that tensoring preserves arbitrary monomorphisms. No integrability/curvature theorem asserted.

## 3. Connection laws (E L309–354)
Additivity is immediate by adding the two equations defining IsConn. For r∈R, semilinearity gives
s*(rc)=(r,D r)(i*(c)+J(ω))=i*(rc)+J(D r⊗c+rω)
using square-zero multiplication and the scalar rule for J. This supplies IsConn.smul, including the derivation term. With uniqueness, the resulting assignment c↦ω is additive and obeys Leibniz.

For base change R→R' by σ and a GrpMor m from the original data to the primed data (including PD map, scheme arrows b,φ and group multiplication compatibility), require a T'-relative derivation D' and hD' for κ', plus σ-semilinear u:M→M' with D'σ=uD pointwise. RUN20 supplies extMap σ u:E→E' as PD morphism. The same geometric arrows b,φ induce k on extensions (E L322–325). Three actual source identities are k i*=i'*m*, k s*=s'*m*, and k J=J' (u⊗m*). First two follow by composition equality of ring maps and geometric maps using K.pull_pull; third by simple tensors and additivity. Applying k to IsConn gives the primed IsConn for m*c and TensorProduct.map u m* ω. No base-change bijectivity needed for this implication; it is needed if identifying a unique primed connection. Keep the compatibility e, PD morphism and semilinearity.

For a GrpMor from a group B over base T with PD ideal J₀ and δ to A over R via algebraMap T R (E L344–349), s and i agree on images of T since D is a T-derivation. Hence s*m*c=i*m*c and ω=0 is a solution. Multiplying by r yields ω=D r⊗m*c by the preceding Leibniz law. This is a conditional pullback statement, not a theorem that every c is constant.

## 4. Supply IsBC by a genuine lift (E L395–441; C L40–67)
Assume H:Published.AbelianDeRham (five conjuncts), hA:IsAbelianScheme A over Spec R and hg:SmoothOfRelativeDimension g A.hom. Let π:R→R₀ surjective, ker π=I, κ weighted-nilpotent (RUN20), A₀ group pullback of A along Spec π with arrow i. Given R-algebra R', a second surjective π':R'→R₀' with ker π'=I', nil DP κ', GrpMor m from A₀ data to A₀' data along algebraMap R R' with geometric arrows b,φ, require hφ:IsGrpPullback A₀' A₀ b φ. These are all explicit premises of isBC_of_lift, not consequences of any arbitrary GrpMor.

Form A' as group pullback of A along Spec(R→R') (FlagTan.exists_isGrpPullback). The composite pullback hφ.comp h, base triangle m.base, and universal property give i':A₀'→A' with i'ψ=φi (diagrammatic notation); cancel the pullback hψ to obtain h':A₀' is pullback along Spec π'. A' inherits abelian scheme and relative smooth dimension g. Define U=primDR A, U'=primDR A', V=prim κ A₀, V'=prim κ' A₀'. Four maps in the source commutative square:
    b0: U→V, liftMor κ h.pull (bijective by H.Rigid);
    b1: U'→V', liftMor κ' h'.pull (bijective by H.Rigid);
    b2: R'⊗U→U', liftSemi(bcMor hψ.pull) (bijective by H.BaseChange.1);
    mbar: R'⊗V→V', liftSemi m.pull (wanted bijective).
The fourth known bijection b3=R'⊗b0 follows by tensoring the linear *equivalence* associated to b0, not by assuming R' flat. On x⊗c, pullback composition with equality i'ψ=φi proves mbar b3=b1 b2; additivity extends to all tensors. As RHS and b3 are bijective, mbar is bijective. This supplies H.1 and H.2 of section 2 simultaneously.

The source's H.2.2.2.1 is the Rigid predicate, H.2.2.1 is BaseChange; .1 of its result is IsBC, not the primitive span equality. C L40–54 gives their exact quantifiers. Free/Hodge/Duality are retained in the declared H although this proof uses only the two projections. In existsUnique_isConn_of_lift choose R'=E, π'=π∘pr, A₀'=A₀ and b,φ identity. π' surjective since pr has section i, kernel is pr⁻¹I, κ' weighted nilpotent by RUN20, identity is group pullback. Base structure map equality follows from contravariance of Spec. Thus apply isBC_of_lift to inlMor and then section 2. In existsUnique_gaussManin (E L443–451) take π=id_R, I=0, κ=dp0, A₀=A with reflexive group pullback and Spec(id)=id. Zero DP ideal nilpotent, D is PD-compatible (E L210–211); conclude ∃! ω for every c∈primDR A. This is a Gauss–Manin connection along the specified derivation, not a statement about curvature or the entire RH theorem.

## 5. External assumption ledger delta
| Source | Classification and retained obligation |
|---|---|
| E L207–208,280–286; K L276 | definitions IsDPDer, inrPull, IsConn, IsBC, not theorem proof or axiom |
| E L242–278,290–354,356–383 | explicit conditional proof bodies; hD, geometric group/morphism assumptions and H:IsBC retained where used |
| E L400–451 | explicit conditional theorem bodies, not postulate wrappers; H:AbelianDeRham remains a supplied proposition |
| C L40–67 | BaseChange, Rigid, and five-conjunct AbelianDeRham are predicates, not independent proof terms |
| D L20–23 | actual global theorem body PositivityTheory.DualRT.abelianDeRham, constructs all five fields; BaseChange from hS.2.2, Rigid from rigid_of_free_of_crystallineDeRham hF and FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham |
| P L8–10 | explicit conditional wrapper abelianDeRhamStructure_of_page, uses SmoothLift.crystallineSmoothLift_of_relations and abelianHodgeDeRham_of_page P; P supplied by D from MainStatements.Hodge.Free.abelianDeRhamPage |
| R L98ff | actual source theorem crystallineDeRham, with native Red.pull1/2 at L74–95; deeper tag acyclicity not reconstructed here |
| K L90–142,262–276, imported category/ring/tensor theorems, FlagTan.exists_isGrpPullback, PolPull.isAbelianScheme_of_isGrpPullback | visible source references/imported results; no independent kernel audit of transitive assumptions |
No citation claim or explicit axiom declaration encountered in the inspected target bodies. This does not prove absence of axioms/sorry in their dependencies. RUN15 has authenticated export evidence for the separate literature adapter to global AbelianDeRham; this run has no authenticated Main-root path to the connection declarations and no proof that all local leaves are required by RH. No new mathematical premise introduced.

## 6. Reproducible regression
Executed in JS sandbox: 25 literal source anchors in E, LCS counts above. Finite algebra model (not actual crystalline group realization): R=F_p[t]/t², p=2,3, ideal (t) with γ_n=0 for n≥2, M=P=R, D=t∂/∂t, L canonical split, α_A(c)=(c,D(c)+Ac) for all A∈R. Enumerate all c and all candidate ω; verify DP section and Leibniz, additive law, eval at t=0 compatibility (noninjective ring map, D'=0), constant special case A=0. Two abstract diagram negative controls: injectivity absent → nonunique, surjectivity absent → no solution. The latter uses a larger module with R-action via first coordinate on extra component; these controls show why the abstract splitting proof cannot drop its assumptions, not geometric counterexamples. Output p=2 counts derivation16, PD section10, existence/uniqueness16, addition64, Leibniz64, pull16, constant2; p=3 counts 81,15,81,729,729,81,3 respectively; 1907 positive assertions, 2 controls. No native Lean execution.

Extract and run this JS block with Node:
```js
const certificate=()=>{
 const check=(b,m)=>{if(!b)throw Error(m)};
 const models=[];
 for(const p of [2,3]){
  const n=p*p,range=Array.from({length:n},(_,i)=>i),f=x=>x%p,t=x=>Math.floor(x/p),enc=(a,b)=>(a%p)+p*(b%p),add=(a,b)=>enc(f(a)+f(b),t(a)+t(b)),mul=(a,b)=>enc(f(a)*f(b),f(a)*t(b)+t(a)*f(b)),D=a=>enc(0,t(a));
  const counts={derivation:0,pdSection:0,existenceUniqueness:0,addition:0,leibniz:0,pull:0,constant:0};
  const eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
  const addE=(a,b)=>[add(a[0],b[0]),add(a[1],b[1])];
  const gamma=(k,a)=>f(a)!==0?0:k===0?1:k===1?a:0;
  const sec=a=>[a,D(a)];
  const gammaE=(k,a)=>[gamma(k,a[0]),k===0?0:mul(gamma(k-1,a[0]),a[1])];
  for(const a of range)for(const b of range){
    check(D(mul(a,b))===add(mul(a,D(b)),mul(b,D(a))),"derivation");counts.derivation++;
  }
  for(const a of range.filter(a=>f(a)===0))for(let k=0;k<=4;k++){
    check(eq(sec(gamma(k,a)),gammaE(k,sec(a))),"PD section");counts.pdSection++;
  }
  for(const A of range){
    const w=c=>add(D(c),mul(A,c)),s=c=>[c,w(c)],i=c=>[c,0],j=x=>[0,x];
    for(const c of range){
      let solutions=range.filter(x=>eq(s(c),addE(i(c),j(x))));
      check(solutions.length===1&&solutions[0]===w(c),"exist unique");counts.existenceUniqueness++;
      check(f(w(c))===f(A)*f(c)%p,"base change eval");counts.pull++;
      if(A===0&&t(c)===0){check(w(c)===0,"constant");counts.constant++}
      for(const r of range){
        check(w(add(c,r))===add(w(c),w(r)),"add");counts.addition++;
        check(w(mul(r,c))===add(mul(D(r),c),mul(r,w(c))),"Leibniz");counts.leibniz++;
      }
    }
  }
  models.push({p,ringSize:n,counts});
 }
 const candidates=[0,1];
 check(candidates.filter(w=>0===(0*w)).length===2,"noninjective control");
 check(candidates.filter(w=>[1,w,0].join()===[1,0,1].join()).length===0,"nonsurjective control");
 return {models,negativeControls:2};
};console.log(JSON.stringify(certificate()));
```
Source anchors executed: theorem IsDPDer.isDPMorphism; theorem secMor; theorem inlMor; theorem prMor; def inrPull; def IsConn; theorem smul_inrPull; theorem IsConn.add; theorem IsConn.smul; theorem IsConn.pull; theorem isConn_const; theorem isConn_smul_const; theorem existsUnique_isConn ; Function.LeftInverse.injective; H.1 (add_left_cancel; H.2 ((secMor; inl_fst_add_inr_snd_eq; theorem isBC_of_lift; H.2.2.2.1 R A; H.2.2.2.1 R' A'; H.2.2.1 R A; Function.Bijective.of_comp_iff; theorem existsUnique_isConn_of_lift; theorem existsUnique_gaussManin; isDPNilpotent_extend M hκ. Check against git show PIN:src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean. LCS is lexical comparison, not proof equivalence.

RESULT: DONE local source-matched existence/uniqueness, laws and conditional geometric base-change assembly; PARTIAL transitive assumption and upstream migration audit.
RESUME HERE: reconstruct R L74–95 Red.pull1 and Red.pull2 from their actual tag restriction and acyc_NT suppliers, retaining nilpotence, smoothness, separatedness and pullback inputs, then trace rigid_of_free_of_crystallineDeRham exact source. Request authenticated Main-root role-labelled paths for CrysConn.existsUnique_isConn_of_lift, existsUnique_gaussManin, isBC_of_lift before attributing them to RH's reachable core. HANDOFF TO literature, dependencies, kernel, integration, editor, geometry, audit. RH OPEN; no independent Lean replay or URT performance claim.

<!-- END VERBATIM specialists/literature_provenance/RUN21_CRYSTALLINE_CONNECTION_AND_BASE_CHANGE.md -->

<!-- BEGIN VERBATIM specialists/on_acceleration/RUN21_RESUME.md -->
# RUN21 — matched full-manifest staged build and verified publication

2026-11-25. RESULT: DONE for native matched compact construction/verification, atomic publication controls and amortization; PARTIAL for cross-worker persistent artifact and full RH translation. Source [pinned Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean), blob dbd5db70bc11b35f18fa5751216ab335321e7bfc re-fetched. Latest upstream observed fcb6eac7534875d32d68030967e2deae6d686151; no equivalence asserted and no repinning. Run20 9cd16155b26ed311273eba8b33a9b9524d8cb0ac. Read protocol, handoff queue, expansion, AGENTS, research state/log/protocol/continuity excerpts, CI #413 (45534517299, physics checks only). Inspected 14 latest peer commits and visible RESUME HERE notes; editor excerpt had none. External blueprint not reread (no mathematical derivation in this run). Integration 8a6c269a has reconciled coreAll/rest; dependency 276bc239 owns further outgoing role extraction; structure 9d77c3e9 owns direct CSR; kernel c50fdeaf owns TLiftK term paths. No duplicate work or physical gate changes.

## Native full-data execution

Downloaded [artifact 14931267327 / run 45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798); ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97; extracted reachable_declarations.jsonl.zst SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf. Base compact_run20.py native Git blob hash 80bd60e3884d62ecccd1c439e6a3ab9b78ff6932 matches repository. New staged_run21.py adds exclusive advisory flock across each stage and atomic no-overwrite link + fsync publication. Completed one successful full build and roundtrip per layout, separate native processes with same 64 MiB SQLite cache, disk temp store, FULL synchronous. An earlier clustered attempt was killed by execution limit after append publication; it was quarantined and rebuilt rather than assumed valid. One successful trial each, warm OS cache not controlled; do not extrapolate to other hardware.

| phase | append order | ID clustered conventional |
|---|---:|---:|
| load seconds | 18.158175 | 19.634636 |
| indexes/commit/close seconds | 2.898666 | 3.190079 |
| integrity seconds | 2.745053 | 2.959505 |
| all-row verify seconds | 17.413761 | 18.359788 |
| publish phase total seconds | 20.164082 | 21.326132 |
| total successful stage seconds | 41.220923 | 44.150847 |
| bytes | 390791168 | 564961280 |
| load peak KiB | 231776 | 231924 |
| publish peak KiB | 168720 | 168844 |
| GNU time FS output blocks load | 966832 | 1312632 |

Append occupies 30.83% less disk, 6.64% less build+verification time (single trial). GNU time FS output blocks are OS-reported counters, not measured device traffic. Input reads warm/cached, not storage-cold. Both integrity checks and all 1,484,705 projected rows per layout passed (2,969,410 row comparisons); all 3,035,045 signed hard-root entries per layout preserved. Mutual-block metadata retained only in original authenticated evidence store and raw-row digests, not individually in compact index. This is not an elaborated constant-edge census, nor source import extraction. No premises removed.

## Matched lookup and amortization

One conventional authenticated streaming projection scan for same 12 IDs: 15.446155 s. 21 trials for each schedule/layout/state (252 comparisons), all matched full truth records; 24 exact-name checks and four missing/ambiguous terminal checks. Peak process KiB 99984, includes scan. Lookup medians in ms:

| layout | schedule | reopened | warm |
|---|---|---:|---:|
| append | shared | .200000 | .062153 |
| append | golden | .202763 | .066049 |
| append | periodic | .206108 | .064977 |
| clustered | shared | .195312 | .058367 |
| clustered | golden | .195954 | .062153 |
| clustered | periodic | .186009 | .061042 |

Conventional shared warm fastest within both layouts; no URT-specific improvement. Reopened means new connection, not flushed OS cache. Append total build/verification cost recovered after about three repeated equivalent batches on this machine (41.22/15.446); clustered also three (44.15/15.446). Excludes artifact transport; workloads known in advance may prefer a single union scan. B-tree insertion, indexing and schedule sorting are not strictly linear; underlying streaming pass O(expanded bytes + signed refs + maxID/8), fixed schema, lookup O(Q log N + output). No arbitrary proof-search complexity claim.

Four executable negative controls: lock contention, refuse existing interrupted stage, malformed stage cannot publish, existing destination cannot be overwritten. All passed. Cooperative lock is per canonical destination; not a defense against arbitrary external modification. Failure after link before stage unlink may leave a verified public file and a redundant stage link. Published DB is immutable by convention; subsequent use requires trusted filesystem or reauthentication.

Append DB SHA256 6967b534c57a38bdec7deced48f8b2756c0bfade7f1454c5f1f0fe6c38e3403d equals Run20 byte-for-byte (reproducibility on this SQLite environment); clustered SHA256 9dbb0b3ba02e2aecce024c5ca8d123e30c6525c425f22c652f42d052045a96bf. No DB uploaded or assumed persistent; remote source artifact + code provide reproducible rebuild. No authorized shared cache upload interface exercised. Native benchmark executed before adding controls-only branch and removing unused import; final controls executed successfully.

## Reproduce (fresh output directory, Linux, Python, zstd)

    set -eu
    python staged_run21.py controls manifest.zst
    for mode in append clustered; do
      /usr/bin/time -v python staged_run21.py load manifest.zst "$mode.sqlite" "$mode"
      /usr/bin/time -v python staged_run21.py publish manifest.zst "$mode.sqlite" "$mode"
    done
    /usr/bin/time -v python staged_run21.py bench manifest.zst append.sqlite clustered.sqlite

If interrupted, preserve stage and journal together under an isolated name after ensuring no writer is active; do not publish unless integrity and all-row verification pass. No independent kernel replay, source equivalence check across upstream revisions, or completed human proof.

RESUME HERE: implement receipt-keyed immutable reuse with explicit whole-file digest verification and batch name resolution for newly requested specialist declarations; benchmark verification amortization and compare a single union scan versus multiple workers' repeated requests. Do not upload huge Git blobs or duplicate dependency/CSR lanes. HANDOFF TO integration, dependency, kernel, Galois, theta, geometry, character boxes, structure, audit. Project OPEN.

<!-- END VERBATIM specialists/on_acceleration/RUN21_RESUME.md -->

<!-- BEGIN VERBATIM specialists/positivity_geometry/RUN22_SPHERICAL_JENSEN_HARMONIC_CORRECTION.md -->
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

<!-- END VERBATIM specialists/positivity_geometry/RUN22_SPHERICAL_JENSEN_HARMONIC_CORRECTION.md -->

<!-- BEGIN VERBATIM specialists/prime_window/RUN21_ARBITRARY_K_ARCHIMEDEAN_ADMISSION.md -->
# RUN21 — arbitrary-K Archimedean admission and sharp residual count

2026-11-25. RESULT: SOURCE-MATCHED independent human derivation, finite exact regression executed. This extends RUN19–20 from the native family field GK to the independently quantified K of AdmF/FamilyClosedForm. It neither constructs FamP nor proves unconditional admission or root reachability. No Lean replay or URT acceleration claimed.

P = 40e56bab026552e089d7afcfeff08d2defb9c005. H = fcb6eac7534875d32d68030967e2deae6d686151, newly observed upstream head (RUN20 head c40250a50104b7e02e7d74f658d00fa7b1f4827c; distance not computed).
Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN17–20, research state/log/protocol/continuity excerpts and CI summary #414 (45536634994, physics only). Read 35 recent commit subjects and seven peer commit diffs/handoff excerpts including dependency, kernel, acceleration, integration, editor, audit, geometry. No duplicate identified in those records; not exhaustive; linked blueprint PDF and remaining full peer notes not reopened. Native GitHub code search DFamP/FamP/adm3/AdmFam returned zero results, not an absence proof. No authenticated constructor found. Proceed with a precise missing general-K bound identified explicitly in RUN19 §4; no physics or other lane edits.

## 1. Source anchors
All paths below relative to src/Formalism/ at P.
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f L107–119 ArchimedeanSignatureMatching, adm5; L232–244 TypePrimeSizeConds, AConsts, admitted; L256–277 AdmF, ConclusionOnFamily, KudlaFamilyStatement, FamilyClosedForm.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b L14–33 Consts.Nonneg; L37–45 hG, KG, rG, N1, Gp; L56–66 Nstar, La, rho, rhoB, CbLarge; L79–85 InBand0, InBand.
- SharpRestriction/ElevenLe.lean blob 75f2ab1404c69a5d1330671d96d8f6cd35e74e52 L11 szTh, L24–25 SizeN, L31–33 SizeK, L134–138 SizesAt.
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b L27–45 L,b,a,X',b',w'',X'',A,p0,delta1.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean blob c36e22ceab2885a6ab812f6187bfd1a86472a6ec L239–248 orbit numerical definitions.
- SharpRestriction/ParConsts.lean blob c3a5cddc3af0b027ad62b50a79cdb008712613a6 L31–55 FamP, sizes and GK_nonneg; L79 rho_le only for GK, L99 DFamP.
- SharpRestriction/FamCore.lean blob 44cd54c38881086724fdf7f10f32b7d8e80e35b3 L74–85 L_x,L_eps, nonvacuity; L138–142 exists_pt.
- RUN17 single tolerance, RUN18 type size, RUN19 prime-power band estimate and RUN20 exact N1 slope are independent human proofs reused, not kernel-checked theorem invocations.

## 2. Uniform upper bound for rhoB for every fixed nonnegative K
Fix 0<e<1/52, Fm:FamP e, arbitrary K:G.Consts with K.Nonneg, fixed before x and i. For x>Fm.x1, write s=(Fm.L x i).sc and k=(Fm.D x i).R.k, n=(Fm.D x i).R.n. L_x and L_eps identify s.x=x, s.eps=e. Let q=e/100>0. Native SizeN and SizeK imply
  n <= x^(2+8e+q), k >= x^(9/2+10e-q)>0.
Since Nstar=2 n x^(-e/8), it is nonnegative. All factors of La and the two radii are nonnegative.

RUN20 gives N1/log x -> C(e) with N1 independent of fibre. In particular choose a fixed D=C(e)+1 and T_N so that 1<=N1<=D log x for x>=T_N. For the native a=x exp(x^e), log a=log x+x^e<=2x^e eventually. For any h>0 and x>=1,
  log x=integral_1^x dt/t <= integral_1^x t^(h-1) dt=(x^h-1)/h <= x^h/h.
Choose h=e/2 to obtain log x<=x^e once x^(e/2)>=2/e. Choose h=q/4 to obtain
  La=K.La N1^2 log a <= 2 K.La D^2 (4/q)^2 x^(e+q/2).
If K.La=0 this is identically zero. Otherwise choose x^(q/2)>=2 K.La D^2(4/q)^2. In either case 0<=La<=x^(e+q) uniformly, with the threshold depending on fixed e,K only (and family threshold), not i, primes or places. This argument does not use ParametersFill or the GK-specific rho_le field.

Put R=K.rho K.CN>=0. The two terms of rhoB satisfy, using log x<=x for x>=1,
  4 Nstar x^e La/k
     <= 8 x^(2+8e+q-e/8+e+e+q-9/2-10e+q)
      = 8 x^(-5/2-19e/200) <= 8 x^(-5/2),
  R log x La/k
     <= R x^(1+e+q-9/2-10e+q)
      = R x^(-7/2-449e/50) <= R x^(-7/2).
Hence
  0<=rhoB<= x^(-2) [8/sqrt(x)+R/x^(3/2)] <= x^(-2)
when x>=max(256,(2R)^(2/3),1), in addition to the earlier uniform thresholds. Both terms are then at most half of x^(-2). The exponent margins are strict; the argument requires no choice of K after seeing x. It does not assert the bound at every small x.

## 3. Full arbitrary-K eventual equivalence
Define Ev(Q) := exists T>1, forall x>=T, forall i:Fm.Ix x, Q at that instance. As in RUN19, for x>=400 the band-sum estimate for 0<=r<=x^(-2) is <=20 x^(-2+2e/3)<=x^(-1). The exact difference of radii is
  rhoB-rho = (K.rho La/k)(K.CN log x-N1).
Since log a>0 and N1>=1, La vanishes iff K.La=0. Consequently under K.Nonneg, at large x the full ArchimedeanSignatureMatching is equivalent to
  K.rho=0 OR K.La=0 OR N1<=K.CN log x.
Necessity follows from the ordering conjunct; sufficiency follows from the newly proved rhoB bound, ordering and the two original band bounds. All original strict and inclusive prime/power cutoffs preserved.

Apply RUN20's strict N1/log x>C(e) and limit C(e), where
  h=2+8e, r=ceil(8(h+2)/e)+1, B=6r+1,
  C(e)=6 exp(1) B (h+3) 10^B.
For the fixed K, split its zero factors before choosing thresholds. If K.rho>0 and K.La>0, Ev of the ordering holds iff K.CN>C(e). Sufficiency follows from convergence and positive margin. Necessity uses FamCore.exists_pt above any proposed T (not nonempty every fibre). Thus
  Ev(ArchimedeanSignatureMatching)
    iff K.rho=0 OR K.La=0 OR K.CN>C(e).
The general-K claim is strictly wider in scope than RUN20, which used GK-specific rho_le. K.CN=C(e) is insufficient if both multiplying factors are positive.

## 4. Admission reduction with exact pinned residuals
Fix X,Y and C31,Ce,Cm as in RUN17–18; for AdmF keep exists C31>0, Ce>=0, Cm>=0 outside the eventual threshold. Let R9 be the conjunction of the nine pinned residual predicates
  adm1(C31), adm2, adm3, adm6, adm7, adm8(Cm), adm9(Ce), unitBoundAtTwistedPlaces, admG1.
Combining RUN18 (Ev TypePrimeSizeConds iff K.La>0 and adm5 supplied at all positive tolerances), and §3:
  (forall delta>0, Ev(admitted with A.delta=delta))
     iff K.La>0 AND (K.rho=0 OR K.CN>C(e)) AND Ev(R9).
Forward: specialize delta=1, project R9, TypePrimeSizeConds and ArchimedeanSignatureMatching, then apply their necessary conditions. Reverse: for each positive delta choose the maximum of the R9 threshold, the uniform adm5(delta), TypePrimeSizeConds and ArchimedeanSignatureMatching thresholds and Fm.x1+1; reinsert all 12 pinned conjuncts. Thus no premise disappears without derivation. The threshold is chosen after delta but before every x,i,p. When K=GK, RUN20 derives GK.La>0 from Fm.fills and SizeLa; for independent K it is not automatic. No inference of GK.CN>C(e) from the mere fact of FamP existence.

The H version already noted in RUN17/19 removes adm2 and adm3 from admitted, and removes three conclusions from Conclusion₂. Its corresponding residual conjunction has seven rather than nine predicates if the same human derivations are applied. This is a source-signature comparison, not a proof of whole-version equivalence; keep R9 for P and do not silently repin. The nine unresolved predicates are not claimed independent in a logical sense or root-reachable.

## 5. Upstream evidence
Exact string matches tested P -> H:
- ElevenLe H blob a4a8c76eb7c3cc38989a0afebe51075070941a63: L24–25 -> L28–29, L31–33 -> L35–37, L134–138 -> L138–142.
- IsResidueClassZero H blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6: L56–66 -> L94–104, L79–85 -> L117–123.
- SmallOrderPrimes H blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7: L107–119 -> L102–114, L256–260 -> L241–245; H admitted L233–236 and Conclusion₂ L238–239 differ from P.
- DataParams₂ H blob 3c27f632cf4de6f41fc4e4cf077510613afe8f9a: L27–45 -> L33–51.
- UnramifiedQuadraticSetting H blob 1c9ff6676bad3634a65d75f248b53bb82c03d1ee: L239–248 -> L247–256.
H ParConsts blob 9c325c376642368457542fa7a47cb8488b799b16 L43, L78 and FamCore blob 9b67d02e58d04ab1e14a73ed572b83e63cd49193 L59–60, L113–117 inspected; no full upstream dependency equivalence claim.

## 6. Executed regression (standalone Node/V8)
Use x=b^(200d), e=m/d, so all powers in the envelope have integer exponents in b. Test exact worst-case envelope arithmetic, normalized by x², plus the sign equivalence. log x is replaced by the upper bound x; La is replaced by its upper envelope; these are not evaluations of the native D7, nor tests of the actual asymptotic threshold or geometric predicates. The universal argument is §2–4, not the finite grid.
```js
const counts={exponents:0,first:0,second:0,radius:0,ordering:0,negative:0};
const ck=(v,k)=>{if(!v)throw Error(k);counts[k]++};
for(const d of [53n,60n,100n,200n])for(const m of [1n,2n,3n]){
 if(52n*m>=d)continue;
 const E=200n*d, nExp=400n*d+1602n*m, kExp=900n*d+1998n*m, delExp=25n*m, aExp=202n*m;
 const f=nExp-delExp+200n*m+aExp-kExp;
 const s=E+aExp-kExp;
 ck(f===-500n*d-19n*m,"exponents");
 ck(s===-700n*d-1796n*m,"exponents");
 for(const b of [2n,3n,5n]){
 const x=b**E, n=b**nExp, k=b**kExp, deltaDen=b**delExp, L=b**aExp;
 // Normalize by x^2, and take worst-case upper n, lower k, upper La.
 const fNum=8n*n*b**(200n*m)*L*x*x, fDen=deltaDen*k;
 ck(fNum*b**(100n*d)<=8n*fDen,"first");
 for(const r of [0n,1n,7n,100n])for(const c of [0n,1n,11n,1000n]){
 // log x is replaced by its upper envelope x; native data are not simulated.
 const sNum=r*c*x*L*x*x,sDen=k;
 ck(sNum*b**(300n*d)<=r*c*sDen,"second");
 if(x>=256n && 2n*r*c<=b**(300n*d)){
 ck(2n*fNum<=fDen && 2n*sNum<=sDen,"radius");
 ck(fNum*sDen+sNum*fDen<=fDen*sDen,"radius");
 }
 }
 }
}
for(let a=0n;a<=8n;a++)for(let r=0n;r<=8n;r++)for(let N=1n;N<=12n;N++)for(let B=0n;B<=15n;B++){
 const common=17n*a;
 ck((common+r*a*N<=common+r*a*B)===(a===0n||r===0n||N<=B),"ordering");
}
ck(17n+4n>17n,"negative"); // CN=0, positive factors: ordering fails
ck(17n<=17n,"negative"); // zero rho: ordering holds even if CN=0
ck(8n*2n>1n,"negative"); // at x=1 envelope need not force x^-2
console.log(JSON.stringify(counts));
```
Actual execution: {"exponents":12,"first":18,"second":288,"radius":576,"ordering":15552,"negative":3}. No Lean or CI replay of this artifact.

## RESUME HERE
Request independent audit of the arbitrary-K exponent margins, threshold and residual R9 equivalence (especially preserving K≠GK and original P admission). Native constructor search via the default-branch lexical index remains unproductive; next translate pinned adm2/BTT and adm3 as explicit weighted exceptional-prime inequalities, locating their actual consuming theorem and checking role-labelled root paths before spending time on unlinked geometry. Ask dependency/kernel lanes for authenticated incoming edges to Pf.AdmFam, AdmF and FamilyClosedForm, and editor/integration to retain the P/H difference and mark the general-K lemma conditional. HANDOFF TO audit, dependencies, kernel, integration, editor, prime_window. Project OPEN.

<!-- END VERBATIM specialists/prime_window/RUN21_ARBITRARY_K_ARCHIMEDEAN_ADMISSION.md -->

<!-- BEGIN VERBATIM specialists/theta_lifts/RUN21_SINGULAR_TEST_DETERMINANT_DIFFERENTIATION.md -->
# RUN21 — Singular Fourier tests detect determinant derivatives
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction of CrxMa.stepA_Z and LVs.singToDiff; global root path and imported analytic suppliers remain PARTIAL/OPEN. P=40e56bab026552e089d7afcfeff08d2defb9c005; observed latest H=fcb6eac7534875d32d68030967e2deae6d686151 (merge PR #1853). Source leanprover-community/riemann-hypothesis. Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN19–20, research state/log/protocol/continuity excerpts, CI #414 (physics only), recent 25 swarm commit subjects, recent peer handoffs/notes in all 14 other lanes (dependency and audit/structure code tails where notes unavailable). Editor reproduces RUN20, not duplicate of RUN21. Landau RUN21 owns separate Gaussian supplier. External blueprint not reopened; no physical queue changes.

All paths below relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/; A=AnalyticDeterminants/, C=CayleyCosetSums/. Local source references, not an elaborated DAG.

## 1. Exact statement and application
C/ContinuousMatrixLowerRightBlock:103–130, PositivityTheory.Rg.Sw.HSt.CrxMa.stepA_Z. Given natural n,m (no m<n required in this lemma), FdProps, FzHol, compact topological group Kg with measurable/Borel structure, Haar measure μ, continuous group homomorphism ι:Kg→M2(n) with image exactly InK (iff), assume for EVERY complex n×n P, singular test ψ, a,b,x∈InG,
    ∂z tOp(μ,ι,ρ_P,ψ,a,b,fz(m,0,z),x)|₀=0.
For every complex Y and a,b∈InG the conclusion is
    detD [H↦∫_Kg Fd(m,ι(k)(a nU(H)b))ρ_Y(k)dμ]=0.
Here Fd(m,g)=∂z fz(m,0,z,g)|₀. FdProps (C/FdProps:26–32) asserts complex smoothness on DomZ and interchange of this spectral derivative with tOp for continuous weights and continuous compactly supported tests, admissible group elements and the same compact-group hypotheses. FzHol (C/CruxSt:32–34) asserts DomZ open, contains GSet, and joint analyticity on C×DomZ for every n,m,e. DomZ imposes Dom and slit-plane condition on det u1 det ub1. Keep both packaged premises; this is not a proof of their suppliers.

Set Ω={g:∀k,ι(k)g∈DomZ}. Compactness and continuity give Ω open (isOpen_setK, C/ContinuousMatrixLowerRightBlock:32–38); group closure gives GSet⊂Ω. Weight ρ_Y is continuous by nonzero det u2 on InG, inverse=adjugate/determinant, continuity of the Cayley blocks, vacuum at zero, trace and conjugation (:46–57). The compact parameter integral Φ_Y(g)=∫Fd(m,ι(k)g)ρ_Y(k)dμ is complex C∞ on Ω using holInt and continuousOn_iteratedFDeriv_translate (:59–67). The preimage under H↦a nU(H)b is open and contains 0 since nU(0)=I. Thus G(H)=Φ_Y(a nU(H)b) is complex C∞ on a ball of some radius r>0.

For each singular test ψ choose P=Y and x=I in hneg; FdProps converts it to tOp with Fd instead of fz derivative. Fubini gives ∫G(herm t)ψ(t)dt=0. In detail the joint integrand Fd(m,ι(k)a nU(herm t)b)ψ(t)ρ_Y(k) is continuous because every group argument is in GSet⊂DomZ, and supported on Kg×tsupport ψ, compact. Hence product integrable, and integral_integral_swap applies (fubini_gen :69–101). Multiplication order retained. No interchange without this support argument and no normalized Haar assumption. Apply singToDiff to G. C/VacuumNonvanishingOfFacts:44–45 calls exactly CrxMa.stepA_Z; :47–54 uses it through topComp in Step B. This is conditional on the actual input hneg, obtained by negating Crux0 in the consumer, not a claim that all vacuum derivatives vanish unconditionally.

## 2. Full local supplier: determinant as a Fourier multiplier
A/SingToDiffAlt:37–40 defines detD G=Σσ sign(σ) D^nG(0)[E_{i,σ(i)} for i=1..n], the complex iterated Fréchet derivative evaluated on matrix units, not det(G) or a derivative of det(G). :79–81 defines SingToDiff: for every n (including 0), G:M_n(C)→C, r>0, complex C∞ on B(0,r), if ∫G(herm x)ψ(x)dx=0 for EVERY IsSingTest ψ, then detD G=0. No global smoothness of G required.

On V=R^(n×n) write h(x)=herm x with entries (x_ij+x_ji)/2+i(x_ij−x_ji)/2. Define v1_rc=(E_rc+E_cr)/2 and v2_rc=(E_cr−E_rc)/2 as real matrices. A/SingToDiffA:41–70 gives
    h(v1_rc)+i h(v2_rc)=E_rc,
    ∂^c_rc = D_v1_rc + i D_v2_rc.
This is why real Hermitian coordinates suffice for COMPLEX differentiable G. A/SingToDiffC:19–58 proves chain rule and its iterated version dList_ofFn (using local eventual equality before differentiating, not a global identity). With F=G∘h on U=h^{-1}(B(0,r)), define L F=Σσ signσ dList(lσ)F, where lσ lists (i,σ(i)) in the native Fintype.equivFin order. Then LF is continuous on U and LF(0)=detD G. The diagonal r=c and empty list cases are included.

For φ globally real C∞ with compact support inside U, form the test
    ψ=Σσ signσ dList(reverse(lσ))φ.
A/SingToDiffB:27–55 proves support containment under every derivative, so ψ is continuous and compactly supported in tsupport φ. A/SingToDiffB:56–117 proves bilinear (not sesquilinear) integration by parts, with integrability from compact support inside the open smooth region:
    ∫ F dList(l)φ = (−1)^len(l) ∫ dList(reverse(l))F φ.
Reversal retained even though smooth constant-coefficient derivatives commute; no conjugation of i in this bilinear formula.

For any Hermitian β with det β=0, set eβ(x)=exp(2πi tr(β h(x))). The complex directional symbol is ∂^c_rc eβ=(2πi)β_cr eβ. Iteration multiplies these factors; the signed permutation sum equals (2πi)^n det β by determinant expansion (A/SingToDiff:19–69). Applying integration by parts to eβ and the reversed lists yields
    ∫ ψ eβ = (−2πi)^n det β ∫ φ eβ =0.
This is exactly fourier_test (:71–108), which actually proves the identity's zero conclusion even without Hermiticity; only the Hermitian singular subset is required by IsSingTest (IsSingTest:33–35). No Fourier inversion, distribution support converse, or convergence at infinity is presumed. Thus ψ is an admissible singular test, constructed rather than assumed.

## 3. Recover the pointwise derivative by positive localized averaging
A/SingToDiff:113–229 chooses any small normalized real smooth bump φ supported in U around zero. The hypothesis applied to ψ and integration by parts give
    0=∫ Fψ=(−1)^n∫ (LF)φ.
The sign is nonzero, hence ∫(LF)φ=0. If LF(0)≠0, continuity provides a small ball where |LF(x)−LF(0)|<|LF(0)|/2. Choose outer radius ε=min(ε0/2,ε1/2)>0, inner radius ε/2, where ε0 bounds the ball inside U and ε1 bounds the continuity neighborhood. The source uses ContDiffBump.normed volume, φ≥0 and ∫φ=1. Then
    LF(0)=∫(LF(0)−LF(x))φ(x)dx,
    |LF(0)|≤(|LF(0)|/2)∫φ=|LF(0)|/2,
a contradiction. Hence LF(0)=detD G=0. The native proof needs only small normalized bumps and the source's continuity and support estimates, not convergence of an unbounded family of derivatives. This supplies the actual local theorem, not merely a Fourier heuristic. Conventional ingredients: complex chain rule, Leibniz determinant, compact-support integration by parts, normalized bump localization. No independent attribution to a particular published theorem established. Mathlib integration by parts and bump theorems and holInt/FdProps/FzHol suppliers remain open for deeper reconstruction; absence of an explicit sorry here is not a transitive axiom audit.

## 4. Upstream and reproducibility
H moves C/ContinuousMatrixLowerRightBlock into C/Crux:733 (consumer :966), and A/SingToDiffB,C into A/SingToDiff:169,226,375. A/SingToDiffA:95 retains herm_v. Old B,C and ContinuousMatrixLowerRightBlock paths absent at H. These are relocation observations, not proof equivalence or repinning. Executed connector source checks: 12/12 GitHub directory blob identifiers and 75/75 literal line anchors matched. Executed exact JS integer regressions: all 19,683 3×3 matrices with entries −1,0,1, including 7,875 singular matrices, matched determinant via cofactor expansion versus transposed permutation-symbol expansion; 8,772 individual matrix-entry checks of h(v1)+i h(v2)=E_rc across n=1..8 matched (dyadic arithmetic exact). These are checks of algebraic ingredients only, not analytic proof tests, Lean replay, or URT benchmark. Below local-clone Python certificate reproduces representative anchors and all exact algebra counts (Python version not executed in this session).
```python
import subprocess,itertools
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="fcb6eac7534875d32d68030967e2deae6d686151"
b="src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/"
A="AnalyticDeterminants/"; C="CayleyCosetSums/"
rows=[
(P,C+"ContinuousMatrixLowerRightBlock","3b4e8c6f013d0e6da16b1bf2438d47dfcb893d76",123,"singToDiff n"),
(P,C+"FdProps","1bbff855867c08b480b03ff6e62cfcaac88f0479",26,"def FdProps"),
(P,C+"CruxSt","73b4302b0eb23bd4e524572c8b09adfcc6903279",34,"AnalyticOnNhd"),
(P,C+"VacuumNonvanishingOfFacts","59b9d0e0060f8ea3e9387803aef00f5bae6d5eef",45,"CrxMa.stepA_Z"),
(P,A+"SingToDiffAlt","ce0e07c6678297a655e2b9e03de36c3a62e69010",37,"def detD"),
(P,A+"SingToDiffA","733ab8a6307dc19595dda8c27cabcafb24a01358",47,"theorem herm_v"),
(P,A+"SingToDiffB","d0f98d5bd57606939aab1b95b4f96cb5ee8f14b6",100,"theorem ibp_dList"),
(P,A+"SingToDiffC","5d74fec212169a3505f744d8966f402869e20f5a",29,"theorem dList_ofFn"),
(P,A+"SingToDiff","8cfa433d73eb646e37ea8569dcfbf6c8d1ff596c",113,"theorem singToDiff"),
(H,C+"Crux","7ee5755446d0b5dc5e24987162d591acdc8415f0",733,"theorem stepA_Z"),
(H,A+"SingToDiff","26a76725a4df8555827a6e47341323c8e6e16ecf",375,"theorem singToDiff"),
(H,A+"SingToDiffA","b92e87cee3425a4ca6c9b6957c28d92455a4161e",95,"theorem herm_v"),
]
for rev,f,sha,line,needle in rows:
    raw=subprocess.check_output(["git","show",rev+":"+b+f+".lean"])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha
    assert needle in raw.decode().splitlines()[line-1]
count=singular=0
for x,y,z,p,q,r,s,t,u in itertools.product((-1,0,1),repeat=9):
    d=x*(q*u-r*t)-y*(p*u-r*s)+z*(p*t-q*s)
    symbol=x*q*u+p*t*z+s*y*r-s*q*z-p*y*u-x*t*r
    assert d==symbol
    count+=1; singular+=int(d==0)
herm=0
for n in range(1,9):
    for r,c,i,j in itertools.product(range(n),repeat=4):
        # store 2*v1 and 2*v2, so the final identity is scaled by four
        def v1(i,j): return int((i,j)==(r,c))+int((i,j)==(c,r))
        def v2(i,j): return int((i,j)==(c,r))-int((i,j)==(r,c))
        assert v1(i,j)+v1(j,i)-v2(i,j)+v2(j,i)==4*int((i,j)==(r,c))
        assert v1(i,j)-v1(j,i)+v2(i,j)+v2(j,i)==0
        herm+=1
assert (count,singular,herm)==(19683,7875,8772)
print(len(rows),"blobs, representative anchors;",count,singular,herm)
```

## RESUME HERE
Expand the actual pos_int supplier in Crux0 Step G (strict positivity of compact integral of squared complementary minors), then dpDual; retain topComp, stepC/D, FdProps, FzHol, Gaussian base/GI.integP and CR.crLem_of/KSing.lamSing_of as outstanding. Request authenticated incoming and outgoing role paths for PositivityTheory.Rg.Sw.HSt.CrxMa.stepA_Z and PositivityTheory.Rg.Sw.LVs.singToDiff, relative to holLeadB (manifest 8996470), without repeating raw export. HANDOFF TO theta, dependency, kernel, integration, editor, audit. Full RH reconstruction OPEN. No independent Lean kernel validation or URT acceleration claim.

<!-- END VERBATIM specialists/theta_lifts/RUN21_SINGULAR_TEST_DETERMINANT_DIFFERENTIATION.md -->
