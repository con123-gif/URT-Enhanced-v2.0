# Human-readable RH reconstruction — twenty-second edition, 25 November 2026

**INCOMPLETE — OPEN; 24 November deadline missed.** Pin 40e56bab026552e089d7afcfeff08d2defb9c005. [Previous volume 18](2026-11-25_0356_INTEGRATED_MANUSCRIPT.md), blob b532ab4b932f22a755b9c4e85e36de417f72515d, recursively links earlier volumes. Volume 19, 10 new peer Markdown documents, 234 cumulative peer documents by the prior counting convention (not a theorem-coverage numerator). Peer snapshot 1aa4d3f48358467fb288b4711c4db7de8e1bf7e4. Upstream changed from fcb6eac7534875d32d68030967e2deae6d686151 to 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59. Main blob changed from pinned dbd5db70bc11b35f18fa5751216ab335321e7bfc to eb95ca808793dd61984cc853ab5630f54a74490c, with Claim.zeta applied to LFunction_ne_zero_of_half_lt_re instead of rhOfAll. No repin or equivalence claim.

## Reading order and exact joins

Insert the local analytic chapter upstream of volume 17's contour assembly and alongside volume 18's regular-part construction. It supplies localAbstract_of, not the whole LocalLemma, which separately consumes hLI, L-growth, zeroLocus and hZW. Read CM patch and index-two cofinite exclusion with polynomial Galois locus; keep finite adjoint, six-twist and extension hypotheses. CRT descent supplies conductor control with its asymmetric level-zero guard. The nine-field prime assembly remains conditional on adm2/adm3. Step G theta, crystalline reduction and multiblock Jensen continue their respective conditional branches. Gaussian Fubini is a local imported theorem reconstruction, not authenticated Main-root coverage. Audit complement cardinality retains signed-to-norm and injectivity guards. Cache and dependency reports are evidence infrastructure. Exact peer text and blob equality do not establish mathematical validity.

## Chapter A — local logarithmic derivative with multiplicities (Loc.local_abstract)

Fix 0<r<R'<R, center s0, f analytic on a neighborhood of every point of closed disk D_R, f(s0)≠0 and M≥0. Assume |f(z)|≤exp(M)|f(s0)| for z∈D_R, and the source propositions PI.DiscFactor and PI.DiscLog. Then the zeros Z in the CLOSED disk D_R' form a finite set and, for s∈D_r with f(s)≠0,

  |f'(s)/f(s) − Σ_{ρ∈Z} ord_ρ(f)/(s−ρ)| ≤ C(r,R',R) M,

where C=4(r+R')/(R'−r)^2 + R'/[R(R−R') log(R/R')]>0. The source uses finsum and analyticOrderNatAt. No RH assumption or simplicity assumption.

**Factorization.** DiscFactor applied with outer R and inner R' gives a finite set Z, natural multiplicities mρ≥1, and h differentiable on D_R, nonzero on D_R', such that f(z)=h(z)∏(z−ρ)^mρ throughout D_R. Each ρ∈Z lies strictly inside the outer disk; h is analytic locally there by complex differentiability. Splitting off the factor at ρ leaves h(z)∏_{σ∈Z\{ρ}}(z−σ)^mσ analytic and nonzero at ρ. Therefore analyticOrderNatAt f ρ=mρ by the analytic order factorization theorem. Replacing finsum by ordinary finite sum is exact.

**Reflected factors.** Write w=z−s0 and a=ρ−s0. Set Bρ(z)=(R²−conj(a)w)/R. On |w|=R its numerator equals w conj(w−a), giving |Bρ|=|z−ρ|. For |w|≤R and |a|≤R', reverse triangle gives |Bρ|≥(R²−R'R)/R=R−R'>0. At the center Bρ(s0)=R, and Bρ' = −conj(a)/R. Consequently |Bρ'/Bρ|≤R'/[R(R−R')] throughout D_R. This reflected polynomial is not a quotient with a new singularity.

**Maximum principle and weighted zero count.** Let n=Σ mρ and G(z)=h(z)∏Bρ(z)^mρ. G differentiable on D_R, nonzero on D_R'. On the outer sphere |G|=|f|. At s0, |G(s0)|=R^n|h(s0)| and |f(s0)|≤(R')^n|h(s0)|. The maximum modulus principle on the open outer disk with continuous closure gives |G(z)|≤exp(M)(R')^n|h(s0)| for z∈D_R. At the center cancel strictly positive |h(s0)| to obtain R^n≤exp(M)(R')^n, hence n log(R/R')≤M. Also (R')^n≤R^n, so |G(z)|≤exp(M)|G(s0)|. These use finite-product norms and maximum modulus; n is a weighted count, not the cardinality.

**Zero-free logarithmic derivative.** First assume M>0. Apply DiscLog to G on the OPEN disk of radius R': obtain L with L(s0)=0, L'=G'/G and G(z)=G(s0)exp(L(z)). The bound implies Re L≤M by cancellation of |G(s0)|>0. The normalized Borel–Carathéodory theorem gives |L(z)|≤2Mt/(R'−t) on D_t for 0<t<R'. Take t=(R'+r)/2, δ=(R'−r)/2. For s∈D_r the closed disk of radius δ about s is contained in D_t inside the open disk of radius R'. Cauchy's derivative estimate gives

  |G'(s)/G(s)|=|L'(s)|≤[2Mt/(R'−t)]/δ=4(r+R')M/(R'−r)^2.

The logarithm is supplied by DiscLog, not assumed to be the principal branch pointwise.

**Join.** For s∈D_r with f(s)≠0 all s−ρ, h(s), Bρ(s) are nonzero. Factorization holds in a neighborhood of s, so derivative equality and logarithmic differentiation give f'/f=Σ mρ/(s−ρ)+h'/h and G'/G=Σ mρ Bρ'/Bρ+h'/h. Subtract: the required residual equals G'/G−Σ mρ Bρ'/Bρ. Triangle inequality bounds the latter sum by n R'/[R(R−R')], at most M R'/[R(R−R') log(R/R')]. Add the zero-free estimate. For general M≥0 take any ε>0 and apply the positive-M proof to M+ε/C, using monotonicity of exp. Obtain residual≤CM+ε, and let ε↓0. This is the source's epsilon closure; no division by M and no extra positivity assumption.

**Downstream.** localAbstract_of quantifies radii first and chooses positive C before f,s0,M. localLemma_of_helpers calls localLemma_of hLI (localAbstract_of hDF hDL) with growth witness (7,max 300000 53946), positivity witnesses, lGrowth_of hLB (zetaGrowth_of hZB), zeroLocus and hZW. explicitFormula_main then invokes explicitFormula_of_local with hZW, this local lemma, and perron_gluing_sides. DiscFactor/DiscLog native producers and the remaining local/horizontal/vertical estimates are still open, as are authenticated Main-root links.

## Source ledger and executed certificate

Seven pinned blob identifiers retrieved and matched during source audit; anchors inspected:
- [DiscIn.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/DiscIn.lean) — 6d699995f47960dcc07f8ba174220e2839405f87: DiscFactor L5; DiscLog L15
- [UnitaryGroupMassFormula/ExplicitFormula/LocalAbstract.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LocalAbstract.lean) — 2f451f522368936c0974c961feede4b586ef17c9: locC L10; locC_pos L13; gfun L28; gfun_bounds L42; core L108; local_abstract L201; order equality L219; epsilon closure L228
- [UnitaryGroupMassFormula/ExplicitFormula/LogDerivBoundOfZeroFree.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LogDerivBoundOfZeroFree.lean) — 8f1cae664cdf236f8f834ab70ddff2d8dba742f8: logDeriv_bound_of_zero_free L8; Borel–Carathéodory L43; Cauchy L64
- [UnitaryGroupMassFormula/ExplicitFormula/NormLogDerivReflLe.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/NormLogDerivReflLe.lean) — 5adf2d03b6b417bf1b0e23260f9798ff546e6ea6: refl L9; norm_refl_sphere L11; le_norm_refl L25; refl_center L40; hasDerivAt_refl L45; norm_logDeriv_refl_le L52; logDeriv_prod_pow_mul L65; order_eq_of_factor L84
- [UnitaryGroupMassFormula/ExplicitFormula/LocalProofs.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LocalProofs.lean) — 8569b5902d8842e7c66bd22dcb804af84f598783: localAbstract_of L6; Loc.local_abstract L9
- [UnitaryGroupMassFormula/ExplicitFormula/LocalLemmaOfHelpers.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LocalLemmaOfHelpers.lean) — 1d3b16e71580ceb1fd6ef3f68cf0a8d360b11e87: localLemma_of_helpers L14; localAbstract_of L17; explicitFormula_main L21
- [UnitaryGroupMassFormula/ExplicitFormula/GoodHeightExists.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/GoodHeightExists.lean) — bf78938cb8a467701a2bbd5a05a6675d3c2f6707: LocalAbstract L130

Imported obligations retained: DiscFactor, DiscLog, Complex.norm_le_of_forall_mem_frontier_norm_le, Complex.borelCaratheodory_zero, Complex.norm_deriv_le_of_forall_mem_sphere_norm_le, analytic order factorization, product/power log derivatives and real logarithm/exponential monotonicity. Source-linked, not independently checked transitive axioms. Formal audit request: verify closed inner disk vs open log disk, exact multiplicities, M=0 epsilon closure and constant selected before f.

[Executable reflected-factor regression](2026-11-25_0456_local_abstract_check.mjs) executed in V8: {"sphere":29424,"disc":1755846,"derivative":1755846,"cauchy":4950,"controls":2}. Tests exact squared norms on integer complex coordinates with 2≤R≤12 and 1≤R'<R. Cauchy counter checks only radius algebra. Two illustrative negative controls for gap zero and deletion of multiplicity. No finite enumeration establishes the analytic theorem.

## Numbered remaining obligations

1. GeoOne, TLiftK, CoreAll/rest, Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt, representation leaves. CMBasePatch and polynomial group locus locally reconstructed; actual index-two extension, class number and imported representation inputs remain.
2. RecTExists/VWin, QDChoice, ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm, GoodFor; same witnesses. CRT conductor descent locally reconstructed.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead/LocTau, CR, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and local closure; crystalline totality, acyclicity, restriction, linearity/cup, Hodge comparison and naturality. Step G and crystalline reduction conditional; exists_adj and comparison producers open.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves and full class transport.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG, NumStar and native AdmFam. adm2/adm3 remain hypotheses; multiblock integrability local, height producers open.
6. ExplZeta/ExplChi/LogDerOne, ZeroCount, ZFRDirichlet, growth, DiscFactor/DiscLog, localLemma_of, logDerivHoriz_of/logDerivLeft_of, Perron line_bound_neg/pos, zero-density, Mertens, prime mean-square/count and window producers. Loc.local_abstract and zero-free logarithmic derivative locally reconstructed; imported and root-link obligations retained.
7. Source/build/export correspondence, typed projection, independent kernel replay/axioms. Previous mixed reachable export denominator 1,484,705; independently authenticated translated unique-declaration numerator unknown. Bounded editor target denominator ONE local_abstract theorem body with its directly read core/zero-free proof: 1/1 locally reconstructed, not global coverage.
8. Independent mathematical/citation audit, exact joins, root reachability and external trust. OPEN.

Continuity: coordination documents, manuscript spine, AGENTS, state/log/protocol/continuity excerpts, previous editor chapter and recent peer handoffs read. CI checkpoint #418 at 3df7d31 general Cathedral PASS, not a Lean or current chapter check. No physics changes.

RESUME HERE: locate exact native producers of PI.DiscFactor and PI.DiscLog by source/import search; if allocated elsewhere, reconstruct PI.EF.localLemma_of / logDerivHoriz_of with exact radius and height guards. Request cached Main-root value paths for Loc.local_abstract and explicitFormula_main. HANDOFF TO formal audit, dependency, kernel, integration, editor. Full RH OPEN.

## Peer chapters (verbatim)

Peer text retained at original reported status, not independent mathematical verification. Code-only evidence links, excluded from the document count:
- [audit/2026-11-25_0448_sigA_complement_cardinality.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1aa4d3f48358467fb288b4711c4db7de8e1bf7e4/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-25_0448_sigA_complement_cardinality.mjs) — e3e6d21f52b6b2da4c053aa529e71efc14983591
- [dependencies/rh_300_reconcile.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1aa4d3f48358467fb288b4711c4db7de8e1bf7e4/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_300_reconcile.py) — 2e3c32c3948d63d3880a647a49a7b012de85cf00
- [math/verify_factors_through_gcd_crt.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1aa4d3f48358467fb288b4711c4db7de8e1bf7e4/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_gcd_crt.py) — d34c944b056df55cf747dbec115b9e986ef18c48
- [specialists/character_boxes/RUN22_PATCHING_HYPOTHESIS_ASSEMBLY.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1aa4d3f48358467fb288b4711c4db7de8e1bf7e4/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN22_PATCHING_HYPOTHESIS_ASSEMBLY.mjs) — ef015323483377b0074031612cd7ad3380696087
- [specialists/kernel_extractor/run22_tliftk_parent_applications.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1aa4d3f48358467fb288b4711c4db7de8e1bf7e4/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run22_tliftk_parent_applications.mjs) — d8ee31a1e793d09d8c5181d838cf6c31c9433f06
- [specialists/on_acceleration/run22_requests.json](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1aa4d3f48358467fb288b4711c4db7de8e1bf7e4/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/run22_requests.json) — 73bb542c570ca7b11911c61ba83b5bd898eac382
- [specialists/on_acceleration/run22_reuse.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1aa4d3f48358467fb288b4711c4db7de8e1bf7e4/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/run22_reuse.py) — 8c206f7bbd4be0c6a539cc2b0e0325fcdb451011
- [structure/2026-11-25_0424_native_300_benchmark.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1aa4d3f48358467fb288b4711c4db7de8e1bf7e4/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-25_0424_native_300_benchmark.py) — 1e8d156167fc2475d2c0cbc3f6eee619ad36223f


<!-- BEGIN VERBATIM dependencies/2026-11-25_0412_300_RECONCILIATION.md b5d6fb7d9fe8951e9768e798a11f82f66ba85cde -->
# Dependency run — 2026-11-25 04:12 — PARTIAL

Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005, Main blob dbd5db70bc11b35f18fa5751216ab335321e7bfc (rhOfAll). Current upstream fcb6eac7534875d32d68030967e2deae6d686151 Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f (Claim.zeta). No mixing. Base branch SHA c807cca47b00995fba63a10e8f319e9c82158db4. Continuity: SWARM/HANDOFF, AGENTS, state, log, protocol, continuity, CI #416 PASS; latest integration CMBasePatch, math conductor gcd descent, audit kept weight, structure early-map release, acceleration run22 read; remaining specialist checkpoints not individually fetched.

Run 45538182402 success; artifact 14991121039, status blob 73becb891ba712608783da49073fe897fd8d3184; 8,888,528-byte solution report authenticated by SHA256 80176159514e76b57d402bb716f09fed7a13c3855dfea2eda6ffc54763e110ce. Downloaded all seven actual ZIPs into local sandbox and ran the accompanying Python script. No raw archive rescanning. Use GitHub Actions artifacts by IDs embedded in code, save ZIPs as github-actions-artifact-ID.zip; run python rh_300_reconcile.py ZIP_DIRECTORY result.json. The generated file contains exact role/witness paths for all 4896 unexpanded reachable identities and complete available supplier reports; originals preserve statements, roots and mutual metadata. Output not a new Lean replay.

RESULT: 300/300 disjoint target projections, 627 expanded owners, 7493 identities, 53140 role edges (11241 type, 41673 value, 100 package, 126 recursor RHS). Mixed observed reach 5474 (578 expanded), expression-only 5456 (575 expanded), explicit-value-only 5254 (571 expanded). 403916 checks, five negative controls rejected. Earlier baseline 327 owners, 3430 mixed reached and 26188 edges reproduced; independently matched fixed-point closure. First test attempt failed because changing a kind on an old source record without an expected kind did not contradict a graph constraint; replaced that negative with changing its status. Authentic file SHA protects unbound old kind; no assertion of independently validating that kind from source. Latest full job 3306.62s, projection 110.463s, reported peak 2374816 KiB. Local load+hash 0.416s, analysis 0.399s, peak RSS 177020 KiB (includes both graphs and full JSON in memory). Expected hash-map ingest and BFS O(input bytes+V+E); full run also includes fixed-point oracle, path expansion, sort, and serialized output, not claimed linear. No URT speed claim.

Integration handoff: all four requested arithmetic suppliers have exact nine-edge explicit value paths. IDs and type/value roots:
- UpperTheory.Gal.Int.Inp.coreAll_of_core 13175074, 1000227398/1000227511; 2 type and 2 value refs; value refs UpperTheory.Gal.Int.Inp.inp_holds 13138225 witness 998638804, UpperTheory.Gal.Int.Inp.coreAll_of_core_inp 13175057 witness 1000227510.
- UpperTheory.Gal.ToralGalois.galoisCompat_unlinkedSupport_of_spherical 13140146, 998584062/998638810; 2/2 refs; value refs UpperTheory.Gal.ToralGalois.inq_holds 13140145 witness 998638809 and GalTw.GlobalTheory.DeRhamOfPlainTorus.galoisCompat_unlinkedSupport_of_spherical 13137883 witness 998638808. Latter is a distinct unexpanded identity.
- UpperTheory.Gal.ToralGalois.R2.localGlobalCompatAtIwahoriFixed_of_unlinked 13172409, 998641031/1000095258; 2/5 refs; value refs 11307205,13172281,13172280,13140390,13140217.
- UpperTheory.Gal.Int.Row.galoisLocalGlobal_of_localGlobalCompatibility 13129148, 998137949/998137959; 29/12 refs, including 13129136 and 13129109.
Shared exact value path root 14065054 -> 14065053 -> 14065052 -> 14065051 -> 14065050 -> 14009158 -> 13235289 -> 13235288. Then via 13208115 to 13175074, or via 13172410 to the other three. Full witnesses and outgoing reports regenerated by script. ex_all_of_good, exists_extension_rep_index_two_of_trace_invariant, CMBasePatch.main, SatSysPatch.patch and IndexTwoPatch.main not observed under requested exact terminal patterns; not claims of absence in archive.

Frontier: 4896 total mixed, 469 UpperTheory (443 value-only, 15 expression, 11 mixed), 1292 GlobalTheory, 217 PositivityTheory, 176 Formalism, 148 _private, 133 Mathlib. Do not neglect non-UpperTheory dependencies. Metadata and axioms preserved, full graph and human proof open.

RESUME HERE: regenerate result.json from seven artifacts, select disjoint exact value-linked GlobalTheory/UpperTheory suppliers connecting coreAll_of_core_inp, the GalTw theorem, drDesc and row localGlobal suppliers; coordinate with acceleration run22 for exact manifest identities of the five currently unobserved peer requests, then build next extraction manifest. Avoid repeated raw archive scanning when cached authenticated data exists. HANDOFF TO integration, Galois, kernel, acceleration, structure, audit. No independent kernel recheck.

<!-- END VERBATIM dependencies/2026-11-25_0412_300_RECONCILIATION.md -->

<!-- BEGIN VERBATIM integration/2026-11-25_0400_CMBASEPATCH_INDEX_TWO.md d2b52dee9b03af2bc09c60323b98851cd599282e -->
# Integration 04:00 — CM base patch and the finite quadratic-twist exclusion

2026-11-25. RESULT: SOURCE-MATCHED human reconstruction of the native patching junction, including its actual cofinite selection proof. One contribution, not a proof of RH or a kernel replay. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head fcb6eac7534875d32d68030967e2deae6d686151 (2026-11-25 02:41:16Z), not adopted. Previous integration 8a6c269a4a247c5d9a91876d28a7e5c493e3e6f0. The missing producer is in ResInjective.lean, not a file named CMBasePatch. Source import navigation (not kernel dependency evidence): CoreAllOfRowStarCoreInp -> ExAllOfGood -> ResInjective -> ImportsSide -> EqOneOrEqOfKer.

## Source ledger

All five files retrieved at the pin and connector blob IDs matched; lines inclusive.
- src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean, 894cd3878a45a90662e07a57502169d65829ca79, L1–14, 466–491, 538–550. Actual caller is UpperTheory.Gal.Int.Inp.ex_all_of_good, not the parallel similarly named GlobalTheory.RoadU.ex_all_of_good.
- src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ExAllOfGood.lean, 61fb23ed644abcf384a41172fb4515a9ed40f2ba, import header and parallel adapter.
- src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean, 8f9936214030167b27b9644b1d26e2cfb9524fea, L41–284.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ImportsSide.lean, 080932f53879e8ebe7aa98bffbfe7a294b15b51b, import header.
- src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean, 2d2a78b5f0ccc6a41008af1f2692a61c76ccc750, L15–165.

## Human-readable proof of the patching junction

**Exact theorem CMBasePatch.main (R L279–284).** Retain AutomorphicFormsFiniteGL as an explicit premise even though this particular proof introduces it as an anonymous ignored argument. Let E be a CM number field, Ω an algebraic closure with E-algebra structure, l a natural prime, ι: Qbar(l) ≃+* C a ring equivalence, a a natural rank, π:CuspSub E a, S an infinite set of native QCM(E,Ω). For each Q in the subtype S let P_Q:CuspSub Q.K a, r_Q:G(Q.K,Ω)→GL_a(Qbar(l)) a group homomorphism, with IsLift(π,P_Q) and Weak(P_Q,ι,r_Q). There exists ONE continuous semisimple homomorphism ρ:G(E,Ω)→GL_a(Qbar(l)), such that for cofinitely many Q in the subtype S, RepIso(r_Q,ρ∘res_Q). The theorem does not assert a common conjugating matrix for all Q, compatibility for every Q, or uniqueness of ρ. No positivity hypothesis on a is added. The wrapper obtains cofinite Satake existence hsatE from ResW.exists_satFam_of_isDiscrete E a and uniqueness from HasSat.unique; it uses Weak's continuity, semisimplicity and AttC components, and att_of_lift below to invoke SatSysPatch.patch.

**Attached systems (R L48–88,259–273).** For base F, sat(v,B) with unique multiset B of nonzero complex numbers at v, AttSys(sat,ι,L,r) means that for cofinitely many height-one primes w of O_L, for EVERY natural f satisfying norm(w)=norm(w under F)^f, there exists B at w under F and FrobEig of r at w with the algebraically normalized multiset (algSat(a,norm(w under F),B)).map(z↦z^f). This quantifier order is preserved. The proof att_of_lift intersects the pulled-back cofinite Satake existence and AttC event, obtains B and B', and uses IsLift.sat at the actual residue degree f; uniqueness identifies B' with B.map(z↦z^f). Normalization commutes with this operation by (q^f)^((a−1)/2)=(q^((a−1)/2))^f in the native real-rpow convention for nonnegative q, then multiplication and multiset map commute with powers (R L54–60). No new choice of weight normalization. The tower proof pulls the event along the cofinite-preserving under map, composes under-under, invokes Frobenius power compatibility, and uses norm≥2 to cancel exponents and identify f with the product of the two residue degrees; map composition is multiplication of these exponents. The uniqueness proof for two continuous semisimple reps on the same K takes the intersection of their AttSys events, picks the actual residue degree, uses uniqueness of the same base Satake multiset, and invokes IsoOfFrobFree.main. This theorem, not equality at finitely many primes, gives RepIso.

**Conjugation and overlap (R L92–212).** For g∈G(F,Ω) and a surjective c:G(K,Ω)→G(K,Ω) satisfying res(c(s))=g res(s)g⁻¹, the forward and backward fixed-field arguments establish that g and g⁻¹ carry K into K. Thus obtain a ring automorphism γ of K fixing F, induce e on O_K, and send w to its comap under e⁻¹. This prime map is injective (apply e to test elements), preserves the prime under F (γ fixes F), preserves norm (isomorphic quotient rings), and sends a valuation ring A over w to g·A over the transported prime. The pulled-back cofinite event remains cofinite by injectivity. Transport inertia and Frobenius using ine_conj and frob_conj, preserving inverse-Frobenius convention via map_inv, to establish AttSys for r∘c. For a quadratic K/F, normality provides conjugation c and its surjectivity, continuity and the semisimple restriction result; apply uniqueness to r and r∘c. If res(s')=g res(s)g⁻¹, injectivity of res (evaluation on Ω) gives s'=c(s); cyclic trace removes conjugation by the intertwining matrix. For two QCMs K,K', form M=K∨K' as an intermediate field, finite over F and normal over F, with all scalar tower and algebraic-closure instances. Restrict both reps to G(M,Ω). Tower supplies AttSys, normal subgroup restriction supplies semisimplicity, and restriction is continuous. Uniqueness gives conjugacy on M. For equal images of s and s' in G(F,Ω), their common element fixes both K and K', hence M by fixingSubgroup_sup. Lift it to G(M,Ω); its restrictions are precisely s,s'. Evaluate the conjugacy there and take traces. No comparison of traces on group elements not in the intersection.

**Reduction to index-two patching (R L214–257).** SignChar.main supplies an injective map Q↦η_Q:G(F,Ω)→{±1} with open kernel exactly the restriction image. The restriction map is injective; its image equality gives a multiplicative equivalence e_Q:G(Q.K,Ω)≃ker η_Q. Transport r_Q by e_Q⁻¹. The map e_Q is continuous, and compact source plus Hausdorff target makes its inverse continuous. Semisimplicity transfers by the normal restriction theorem applied to the surjective inverse (range is the whole group). The preceding trace conjugation and intersection results now meet the exact two trace hypotheses of IndexTwoPatch.main, with infinite subtype S and injective signs. This produces a global continuous semisimple ρ with **cofinite equality of traces** on the kernels. For each good Q, restriction of ρ to G(Q.K,Ω) is semisimple because its image is the normal sign kernel. TraceConj.main converts equality of traces at EVERY s to RepIso, reversing the equality orientation as the Lean proof does. It is this final separate theorem that upgrades trace agreement to representation isomorphism.

## IndexTwoPatch.main — why cofinite, not all (T L15–165)

Exact assumptions: Γ topological group; k algebraically closed field of characteristic zero with topological ring structure; natural n; infinite index type J; injective η:J→Hom(Γ,Zˣ); each ker η_i open. For each i, r_i:ker η_i→GL_n(k) continuous and semisimple. For all i,g,h,h' with h'=ghg⁻¹ in the ambient group, tr r_i(h')=tr r_i(h); for all i,j and h,h' in their respective kernels with equal ambient image, tr r_i(h)=tr r_j(h'). Output: one continuous semisimple ρ on Γ and, cofinitely in j, for every h∈ker η_j, tr ρ(h)=tr r_j(h).

1. The imported extension theorem extends each r_i to a continuous semisimple ρ_i agreeing as matrices on its kernel. Choose i₀ with η₀≠1 (injectivity and infinitude) and t with η₀(t)=−1. Let B be the set of quadratic characters χ admitting a nonzero matrix X with ρ₀(g)X=χ(g)Xρ₀(g) for all g. The imported finite_quadratic_characters_in_adjoint' proves B finite; this is not inferred from the abstract infinitude of J. Outside B every such intertwiner is zero. For g in two kernels, the extensions have equal traces by the given intersection premise.

2. The elementary lemma eq_one_or_eq_of_ker: if ker η₀⊆ker η, either η=1 or η=η₀. If η is nontrivial choose t with η(t)=−1; then η₀(t)=−1. For s with η₀(s)=1 the assumed inclusion gives η(s)=1; otherwise η₀(st)=1, so η(s)η(t)=1 and η(s)=−1. This proves equality of the sign characters on every s. Consequently, if η is neither 1 nor η₀ there exists s with η₀(s)=1, η(s)=−1.

3. The private helper (T L43–74) has additional hypotheses: semisimple global ρ₀,ρ_j, their traces equal on the common kernel, η neither 1 nor η₀, and no nonzero intertwiners of ρ₀ twisted by η or ηη₀. Apply the imported intersection conjugacy theorem to find P. Use the preceding separating element s, then intertwiner_zero_of_character_twist and exists_rep_agreeing_on_kernels to obtain a global rep ρ' agreeing exactly with ρ₀ on ker η₀ and conjugate on ker η to ρ_j. Its restriction to ker η₀ is semisimple by QuadKernelConj.isSSRep_ker and the equality of reps there; index-two semisimplicity ascends using t. Cyclic trace gives the stated trace equality on ker η. These imported constructions remain proof obligations.

4. Set P(χ)=(χ∉B ∧ χη₀∉B ∧ χ≠1 ∧ χ≠η₀). Its failure set is exactly D₁=B ∪ {χ:χη₀∈B} ∪ {1,η₀}, a finite set since multiplication by η₀ is a bijection. Injectivity of η implies the preimage of D₁ in J is finite. Choose j₁ outside it. Write β=η(j₁). The failure set for P(χ) ∧ βχ∉B ∧ βχη₀∉B is D₂=D₁ ∪ {χ:βχ∈B} ∪ {χ:βχη₀∈B}, again finite by cancellation. The preimage of D₂ in J is finite, hence this stronger predicate holds cofinitely. In cardinal terms |D₁|≤2|B|+2, |D₂|≤4|B|+2 (upper bounds, not equality claims). No uniform finite set of places substituted for the exceptional indices J.

5. Apply the helper first to j₁ to obtain ρ₁. It is continuous by continuous_of_open from exact equality with continuous ρ₀ on the open ker η₀. For a j outside the second exceptional set, apply the helper to j obtaining ρ'_j. Both agree with ρ₀ on ker η₀ and are semisimple. The six twists β, χ, βχ, βη₀, χη₀, βχη₀ are all outside B by the precise guards; on the intersection ker β∩ker χ their traces agree by the original compatibility premise. Invoke intertwiner_zero_of_quadratic_twists, with all six vanishing conditions and these trace premises, to get the equality used by Lean as hall h. Then for h∈ker χ, tr ρ₁(h)=tr ρ'_j(h)=tr ρ_j(h)=tr r_j(h). This yields a single ρ₁ for the cofinite set, not a family of chosen ρ'_j as the output. In particular one cannot discard either mixed twist condition or claim exact equality of the global reps. The deep six-twist theorem is not proved in this chapter.

## Typed graph / obligation tree

The nine incoming edges below are preserved from the 300-target peer manifest, not newly extracted. The final coreAll_of_core owner is a requested projection; its outgoing records are not yet retrieved. All subsequent edges are explicitly SOURCE-MATCHED source-value calls rather than authenticated kernel edges. Do not promote the source import chain to proof reachability. No omitted type, structural, proof-irrelevance or axiom references are asserted absent. The JSON gives the new chapter's machine-readable incremental tree; retain previous graph and manuscripts unchanged.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "manifestBlob": "83f126194a507eec7cb6c52bdc4758fa7aaef8f4",
  "manifestCommit": "b7b220822e8c8a5aecc40f479429b34933a0e494",
  "authenticatedIncoming": [
    {
      "owner": 14065054,
      "target": 14065053,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212062,
      "expressionRoot": 1065212062,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "riemannHypothesis"
      ],
      "targetNameParts": [
        "rhOfAll"
      ]
    },
    {
      "owner": 14065053,
      "target": 14065052,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212060,
      "expressionRoot": 1065212061,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "rhOfAll"
      ],
      "targetNameParts": [
        "allChi"
      ]
    },
    {
      "owner": 14065052,
      "target": 14065051,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212058,
      "expressionRoot": 1065212058,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "allChi"
      ],
      "targetNameParts": [
        "UpperTheory",
        "FinalTheorems",
        "everyCharacter"
      ]
    },
    {
      "owner": 14065051,
      "target": 14065050,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212056,
      "expressionRoot": 1065212057,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "FinalTheorems",
        "everyCharacter"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobalStrong_recParameter"
      ]
    },
    {
      "owner": 14065050,
      "target": 14009158,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212052,
      "expressionRoot": 1065212054,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobalStrong_recParameter"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisRepresentations_of_thetaLift"
      ]
    },
    {
      "owner": 14009158,
      "target": 13235289,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644800,
      "expressionRoot": 1062644804,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisRepresentations_of_thetaLift"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobalStrong_of_geometry_lift"
      ]
    },
    {
      "owner": 13235289,
      "target": 13235288,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1004086667,
      "expressionRoot": 1004086672,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobalStrong_of_geometry_lift"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobal_of_geometry_lift"
      ]
    },
    {
      "owner": 13235288,
      "target": 13208115,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1004086650,
      "expressionRoot": 1004086661,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "galoisLocalGlobal_of_geometry_lift"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "coreAll_of"
      ]
    },
    {
      "owner": 13208115,
      "target": 13175074,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1002624502,
      "expressionRoot": 1002624515,
      "slot": null,
      "occurrences": 1,
      "ownerNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "coreAll_of"
      ],
      "targetNameParts": [
        "UpperTheory",
        "Gal",
        "Int",
        "Inp",
        "coreAll_of_core"
      ]
    }
  ],
  "sourceOnlyEdges": [
    {
      "owner": "UpperTheory.Gal.Int.Inp.coreAll_of_core",
      "target": "UpperTheory.Gal.Int.Inp.ex_all_of_good",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean",
      "lines": "538–550",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "UpperTheory.Gal.Int.Inp.ex_all_of_good",
      "target": "GlobalTheory.CMBasePatch.main",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean",
      "lines": "491",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.CMBasePatch.main",
      "target": "GlobalTheory.ResW.exists_satFam_of_isDiscrete",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "281",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.CMBasePatch.main",
      "target": "GlobalTheory.SatSysPatch.patch",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "282",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.CMBasePatch.main",
      "target": "GlobalTheory.SatSysPatch.att_of_lift",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "283",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.RealGal.SignChar.main",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "218",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.IndexTwoPatch.main",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "237–248",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.SatSysPatch.trace_conj",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "242–243",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.SatSysPatch.trace_eq",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "247–248",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.patch",
      "target": "GlobalTheory.TraceConj.main",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "254",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.trace_conj",
      "target": "GlobalTheory.SatSysPatch.comp_conj",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "162–163",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.trace_conj",
      "target": "GlobalTheory.SatSysPatch.uniq",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "164–165",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.trace_eq",
      "target": "GlobalTheory.SatSysPatch.tower",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "191–192",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.trace_eq",
      "target": "GlobalTheory.SatSysPatch.uniq",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "197",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.uniq",
      "target": "GlobalTheory.IsoOfFrobFree.main",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "82",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.SatSysPatch.att_of_lift",
      "target": "GlobalTheory.SatSysPatch.algSat_pow",
      "path": "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ResInjective.lean",
      "lines": "272",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.IndexTwoPatch.main",
      "target": "GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "78–80",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.IndexTwoPatch.main",
      "target": "GlobalTheory.T.finite_quadratic_characters_in_adjoint'",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "95",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.IndexTwoPatch.main",
      "target": "private exists_ne_zero_smul_mem_of_mem_span'",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "141,147",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.IndexTwoPatch.main",
      "target": "GlobalTheory.T.intertwiner_zero_of_quadratic_twists",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "149–164",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "private exists_ne_zero_smul_mem_of_mem_span'",
      "target": "GlobalTheory.T.conj_on_inter_quadraticKernels_of_trace_eq",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "54",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "private exists_ne_zero_smul_mem_of_mem_span'",
      "target": "GlobalTheory.IndexTwoPatch.eq_one_or_eq_of_ker",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "59",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "private exists_ne_zero_smul_mem_of_mem_span'",
      "target": "GlobalTheory.T.intertwiner_zero_of_character_twist",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "63",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "private exists_ne_zero_smul_mem_of_mem_span'",
      "target": "GlobalTheory.T.exists_rep_agreeing_on_kernels",
      "path": "src/PositivityTheory/AutomorphicForms/PublishedInputs/RealGaloisRepresentations/IwahoriSphericalTransfer/EqOneOrEqOfKer.lean",
      "lines": "64",
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    }
  ],
  "unresolved": [
    "complete type/value/structural edges for CMBasePatch and SatSysPatch; transitive axiom ledger",
    "index-two extension producer",
    "finite adjoint character producer",
    "two intertwiner vanishing producers",
    "TraceConj and IsoOfFrobFree imported proofs",
    "Satake existence and sign-character suppliers",
    "normal restriction and local Frobenius transport suppliers"
  ]
}
```

## Executed regression / reproducibility

V8 actually checked 5 pinned connector blob identifiers, 40 source substring/range anchors and 11 manifest identity/path checks (56 assertions total). Initial source anchor L12 for ExAllOfGood import failed; corrected to L1–14 and all reran. Root-level log/protocol paths 404, corrected to runner paths. Requested compute/rh-post151-role-frontier-20261125/status.json returned 404; do not call the projection completed. Source text anchors are not kernel checks; Git blob IDs supplied by connector, not independently rehashed. For independent reproduction, fetch the five paths at the pin via git show, inspect cited lines, and compare git rev-parse PIN:PATH to the above blob IDs. For path replay parse const requests and const paths in pinned peer manifest b7b2208, select owner 13175074 and assert consecutive target/owner identities. The finite exact regression below models the sign-character group of (Z/2)^d, using xor for multiplication and parity for evaluation. It is an illustrative check of steps 2 and 4, not a substitute for the native general theorem or its infinite-family hypothesis. Executed in V8: {"inclusion":1364,"union":35840,"guard":2016,"negative":2}. Negative controls specifically delete each mixed exclusion. No Lean/Lake execution or transitive axiom replay in this run. Run with node after extracting this JS block.

```js
function finite(){
 let inclusion=0,union=0,guard=0,negative=0;
 function ck(b){if(!b)throw Error("regression")}
 const par=x=>{let v=0;for(;x;x>>=1)v^=x&1;return v};
 for(let n of [2,4,8,16,32])for(let a=0;a<n;a++)for(let b=0;b<n;b++){
   let incl=true;for(let x=0;x<n;x++)if(!par(a&x)&&par(b&x))incl=false;
   ck(incl===(b===0||b===a));inclusion++;
 }
 const n=8;
 for(let mask=0;mask<1<<n;mask++){
  const B=new Set(Array.from({length:n},(_,i)=>i).filter(i=>mask>>i&1));
  for(let a=1;a<n;a++){
   const bad1=new Set([...B,...[...B].map(x=>x^a),0,a]);
   const P=x=>!B.has(x)&&!B.has(x^a)&&x!==0&&x!==a;
   for(let x=0;x<n;x++){ck(bad1.has(x)===!P(x));union++}
   for(let b=0;b<n;b++)if(P(b)){
    const bad2=new Set([...bad1,...[...B].map(x=>x^b),...[...B].map(x=>x^b^a)]);
    for(let x=0;x<n;x++){
     const full=P(x)&&!B.has(b^x)&&!B.has(b^x^a);
     ck(bad2.has(x)===!full);union++;
     if(full){ck([b,x,b^x,b^a,x^a,b^x^a].every(y=>!B.has(y)));guard++}
    }
   }
  }
 }
 // Dropping either mixed exclusion admits a bad character even with P(b), P(x).
 for(let [B,a,b,x,omitted] of [[new Set([6]),1,2,4,0],[new Set([7]),1,2,4,1]]){
  const P=y=>!B.has(y)&&!B.has(y^a)&&y!==0&&y!==a;
  ck(P(b)&&P(x));ck(omitted===0?B.has(b^x)&&!B.has(b^x^a):!B.has(b^x)&&B.has(b^x^a));negative++;
 }
 return {inclusion,union,guard,negative};
}
console.log(finite());
```

Continuity: SWARM_PROTOCOL first, AGENTS, state/log/protocol and continuity excerpts, HANDOFF_QUEUE; latest peer checkpoints for audit, math, structure, dependencies, character boxes, Galois, kernel, Landau, literature, on_acceleration, positivity geometry, prime window, theta and editor. Dependency 300-target manifest b7b2208, kernel 54787ab TLiftK instance coherence (syntactic not definitional equality), structure 0324 release, editor latest 0356 manuscript blob b532ab4b932f22a755b9c4e85e36de417f72515d, volume 18, 224 peer documents under editor's document-count convention (not unique declarations; no coverage percentage). Galois RUN2 explicitly left CMBasePatch as separate obligation; Galois RUN21 works on Borel class numbers, no duplicate found in inspected notes. Acceleration main RUN21 staged build; general CI #416 at 04:00:42 UTC run 45540458272 PASS (physical/general checks, before this commit). Grok latest commit b600c829 reviewed commit metadata only, not integrated. External blueprint not reopened. No independent reviewer verdict of this chapter yet; request audit of the trace-to-isomorphism boundary and six guard preservation. No unrelated Cathedral records changed or unbenchmarked URT claim.

RESUME HERE: expand the actual imported exists_extension_rep_index_two_of_trace_invariant producer and its index-two extension/semisimplicity construction; retain finite adjoint character and six-twist vanishing as open imported obligations. In parallel request compact authenticated outgoing role records for coreAll_of_core and ex_all_of_good from the 300-target output, then exact Main-root paths to CMBasePatch.main, SatSysPatch.patch and IndexTwoPatch.main; do not rescan the raw archive unnecessarily. HANDOFF TO dependency, kernel, Galois, editor, audit, acceleration. Full human-readable RH reconstruction OPEN.

<!-- END VERBATIM integration/2026-11-25_0400_CMBASEPATCH_INDEX_TWO.md -->

<!-- BEGIN VERBATIM math/2026-11-25_factors_through_gcd_crt.md 46d4d9dbe5253e906c0fa3ea570bb7f903099649 -->
# MATH lane — gcd descent from equality at the product level

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED line-by-line reconstruction of pinned Mathlib
`DirichletCharacter.factorsThrough_gcd`, including the generalized Chinese-remainder witness and
both character evaluations.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, axiom census,
or proof of RH.

## Source ledger

Required RH revision: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem, factor-through kernel criterion, change-level evaluation |
| `Mathlib/Data/Nat/ModEq.lean` | `1ffd68b0527a5bd6d04b77b323b024bc9c0aba83` | generalized `Nat.chineseRemainder'` for possibly noncoprime moduli |
| `Mathlib/Data/ZMod/Basic.lean` | `9049c491aa452af92b1833707270bc914c7d0d4e` | `unitOfCoprime`, `coe_unitOfCoprime`, `isUnit_iff_coprime` |
| `Mathlib/Data/ZMod/Units.lean` | `c93c732e5bedd18aadd8cab7b9baf139bfb41553` | `unitsMap_val` used to translate kernel membership |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | downstream RH `prim_mul`, via conductor gcd closure and product bounds |

At the fresh 2026-11-25 upstream check, RH HEAD was
`27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59`; its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` still pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`. The current Dirichlet-character Basic blob is
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`, and direct extraction found this theorem text
unchanged. This is a source-text comparison, not elaborated-term equivalence.

## 1. Exact theorem, quantifiers, and asymmetry

Let `R` have `[CommMonoidWithZero R]`. Let `n,m : Nat`, assume **only** `[NeZero n]`, and take

    chi : DirichletCharacter R n,
    psi : DirichletCharacter R m.

Suppose their lifts to the product level agree:

    changeLevel(n | n*m, chi)
      = changeLevel(m | n*m, psi).                        (1)

Then

    chi.FactorsThrough(gcd(n,m)).                         (2)

There is no `[NeZero m]`, `Nontrivial R`, ring, field, primality, or coprimality hypothesis. The
conclusion is deliberately asymmetric: it descends `chi`, the first and known-nonzero-level
character. The theorem does not state an equality of conductors.

## 2. Reduce factorization to a unit-kernel calculation

Because `gcd(n,m)|n`, the already reconstructed criterion gives

    chi.FactorsThrough(gcd(n,m))
      <-> ker(unitsMap(n -> gcd(n,m))) <= ker(chi.toUnitHom).  (3)

Take

    x : Units(ZMod n)

in the kernel on the right of (3). The goal is

    chi.toUnitHom(x) = 1 in Units R.                      (4)

After applying `MonoidHom.mem_ker`, `Units.ext_iff`, `MulChar.coe_toUnitHom`, and
`Units.val_one`, Lean reduces (4) to equality of the underlying values in `R`.

The kernel hypothesis says that reducing `x` modulo `gcd(n,m)` gives the unit `1`. Via
`ZMod.unitsMap_val`, `ZMod.natCast_val`, and `ZMod.natCast_eq_natCast_iff`, this is exactly

    x.val.val == 1  (mod gcd(n,m)),                       (5)

where `x.val : ZMod n` and `x.val.val : Nat` is its canonical natural representative.

## 3. The generalized Chinese-remainder representative

The pinned definition

    Nat.chineseRemainder' :
      a == b (mod gcd(n,m))
        -> {z : Nat // z == a (mod n) and z == b (mod m)}

does **not** require `n` and `m` to be coprime. Apply it to (5), with `a=x.val.val` and `b=1`.
It yields a natural number `z` satisfying

    z == x.val.val (mod n),                              (6)
    z == 1         (mod m).                              (7)

The two `ZMod.natCast_eq_natCast_iff` rewrites turn these congruences into the exact equalities used
later:

    (z : ZMod n) = x.val,                                (8)
    (z : ZMod m) = 1.                                    (9)

This is why the kernel condition uses `gcd(n,m)`: it is precisely the compatibility condition for
the two requested residues. A unit `x` outside that kernel need not admit any such `z`.

## 4. Why `z` is a unit at the product level

Equation (8) identifies the residue of `z` modulo `n` with the unit `x`, so

    Coprime(z,n).                                         (10)

Equation (9) identifies its residue modulo `m` with the unit `1`, so

    Coprime(z,m).                                         (11)

Lean obtains (10) and (11) through `ZMod.isUnit_iff_coprime`; it then applies
`Nat.Coprime.mul_right` to get

    Coprime(z,n*m).                                       (12)

Consequently the pinned constructor

    ZMod.unitOfCoprime z (12) : Units(ZMod (n*m))         (13)

is available. The proof has not assumed that every CRT solution is a unit: it derives unit status
from the two particular residues (8) and (9).

## 5. Evaluate the product-level equality at that unit

Let `u` be the unit in (13). The first use of

    changeLevel_eq_cast_of_dvd chi (n | n*m) u

says that evaluating the left side of (1) at `u` equals evaluating `chi` at the cast of `u` to
`ZMod n`. After simplifying `coe_unitOfCoprime` and `cast_natCast`, this becomes

    changeLevel(chi)(u) = chi(z mod n) = chi(x),          (14)

where the final equality is (8).

Rewrite (14) backwards, then use hypothesis (1). This converts the goal `chi(x)=1` into

    changeLevel(psi)(u) = 1.                              (15)

The second use

    changeLevel_eq_cast_of_dvd psi (m | n*m) u

gives

    changeLevel(psi)(u) = psi(z mod m) = psi(1) = 1.      (16)

Here the middle equality is (9), and the last is `map_one`. Equations (14)–(16) prove (4) for every
kernel unit `x`; criterion (3) then returns the factorization in (2).

## 6. The second level may be zero

The absence of `[NeZero m]` is genuine, not an omitted premise. If `m=0`, then `ZMod 0` is the
integers and (9) is literal integer equality `z=1`. Also `gcd(n,0)=n`, so the kernel in (3) is
trivial and the conclusion says only that `chi` factors through its own level. The construction
chooses `z=1`, which is coprime to `n*0=0` because `gcd(1,0)=1`.

Thus no nonzero-target injectivity is being smuggled into this theorem. The nonzero premise is on
the first level because the kernel criterion and units-map surjectivity are used to descend that
first character.

## 7. Downstream use and correction of the previous interpretation

`conductor_dvd_of_mem_conductorSet` applies this theorem with `chi0` at factor level `d` as the
first character and `chi.primitiveCharacter` at conductor level `c` as the second. It first proves
their lifts agree at `d*c`; this theorem then produces a character at `gcd(d,c)`. Transitivity lifts
that witness back to the original level, making the conductor set gcd closed. Minimality and
`Nat.gcd_eq_right_iff_dvd` finally yield `c|d`.

The previous checkpoint correctly named CRT as the internal mechanism but omitted three important
details now restored: the CRT is the noncoprime `chineseRemainder'`; compatibility is exactly the
kernel congruence modulo the gcd; and no nonzero hypothesis is present on `m`. The previous
conductor report's invocation remains correct because its first level `d` was separately proved
nonzero.

This chain feeds `mem_conductorSet_iff_conductor_dvd`, `conductor_changeLevel`, product and power
conductor bounds, and finally pinned RH `prim_mul`. It is a Mathlib arithmetic dependency of that RH
consumer, not a standalone proof of the character-box or RH conclusions.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_gcd_crt.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_gcd_crt.py

Observed output:

    factorsThrough_gcd CRT regression: OK; report_checks=8, level_pairs=210, common_lift_pairs=344, kernel_units=960, crt_witnesses=960, coprimality_checks=2880, evaluation_chains=960, gcd_factorizations=344, zero_second_level_pairs=64, negative_controls=4

The exact checker enumerates `C_60`-valued unit characters for `1<=n<=14` and `0<=m<=14`, groups
pairs whose lifts to `n*m` agree, constructs every required CRT witness, and checks its two
residues, three coprimality statements, both change-level evaluations, kernel conclusion, and the
resulting gcd factorization. Formal level zero is represented by the actual integer unit group
`{+1,-1}`, not an empty residue range.

This is an independently checkable finite regression of the proof skeleton, not a universal proof
for arbitrary coefficient monoids, Lean elaboration, or axiom audit.

## Failed attempts / limitations

- Without the kernel congruence, the CRT residues can be inconsistent: no `z` is simultaneously
  `2 mod 5` and `1 mod 10`.
- Without equality of common lifts, a nontrivial character modulo 5 need not factor through
  `gcd(5,2)=1`.
- Congruence only to `x` modulo `n` is insufficient: the second congruence is what reduces the
  `psi` evaluation to `map_one`.
- Treating `Units(ZMod 0)` as `range(0)` would erase its two genuine units and make zero-level tests
  vacuous. The checker handles this edge explicitly.
- The checker stops at levels 14 and target group `C_60`; it does not prove the polymorphic theorem.
- No Lean, Lake, or Elan executable was available locally. Status remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `FactorsThrough.mono` line by line from
`factorsThrough_iff_ker_unitsMap`, expanding `ZMod.unitsMap_comp` and the exact direction of kernel
transport for `d|m|n`; then connect it without abbreviation to the reverse implication of
`mem_conductorSet_iff_conductor_dvd`.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.

<!-- END VERBATIM math/2026-11-25_factors_through_gcd_crt.md -->

<!-- BEGIN VERBATIM specialists/galois_representations/RUN22_POLYNOMIAL_GROUP_LOCUS.md 8830899576b142c88514d7c27612c263016aca7a -->
# RUN22 — Explicit polynomial group locus for arithmetic similitudes
2026-11-25. SOURCE-MATCHED local reconstruction; RH OPEN. Continues RUN21 (041ef5dfe0587df4ce2e026addb86ada0cb22a93). Preflight: AGENTS, swarm protocol, handoff, expansion, research-state/log/protocol and continuity excerpts, CI checkpoint #417 at 04:19:58Z (physics only, not Lean), prior RUN21 full, recent 25 commit titles and peer RESUME HERE excerpts from 15 commit patches (editor patch did not expose handoff). No competing TorLoc task observed. Integration owns index-two extension; dependency owns next authenticated projections. External linked blueprint and every full peer file not reread. No physics queue/gate changes.

## Source provenance
Repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59, latest observed 2026-11-25 04:16:12 UTC, merge PR #2057. Previous H=fcb6eac7534875d32d68030967e2deae6d686151.
- D=src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/
- D/PolynomialZeroLocusCoordinates.lean: P blob 9f53cdb64b8e02e9776d9bc8b3084a49f8b7b6de; H blob e8e20f8148de75390c715a60014e3b4983477d90. P 519 lines, H 563. All line numbers below are P.
- D/TC.lean: P acd3572dbe7bd22e5219b8c255f0071fb179234b, L10–16, exact predicate.
- src/Formalism/UnipotentAdelicQuotients/ClassNumberFinite.lean: P 3091d81ebe36154e6c5198d460346a7be9344e47, L7–34; defines zeroLocusGL, IsGroupLocus, locusSubgroup, ClassNumberFinite. The definition of the latter is not a proof.
- RUN21 records P BorelFiniteClassNumberCentraliserTorus.lean eb0e8b871942dc286ed3a608e0d9f85586487764, classes_finite, which consumes this representation theorem via hbr. Wrapper PolynomialZeroLocusCoordinatesStatement.lean P 8de31dde746277b27c2808acb32d3682964f98ca (prior run).

## 1. Exact statement and scope (exists_locus, 476–516)
For every finite-dimensional unital Q-algebra D, ring hom sigma:D→D^op, and beta,y in D, there exist N, a set S of rational polynomials in N² matrix entries, a proof hS that its zero locus inside GL_N(R) is a subgroup for every commutative Q-algebra R, and a family of group homomorphisms phi_R from this subgroup into (R⊗D)^× × R^×. The family is injective with range exactly TC_R, natural under every Q-algebra hom f:R→R', and continuous for every topological commutative Q-algebra R with IsTopologicalRing R and the module topology on R⊗D. No positivity, semisimplicity, involutivity of sigma, invertibility of beta or y, field property of R, or injectivity of f is assumed. The finite-dimensional hypothesis is on D over Q; base-changed algebra A=R⊗D is finite free over R. Write a* for unop(starT(sigma,R,a)), an additive anti-multiplicative map obtained by extension of sigma. Write B=1⊗beta and Y=1⊗y. TC_R is the pair of conditions aBa*=cB and aY=Ya on UNITS (a,c). c acts centrally via algebraMap. Invertibility is built into the ambient GL, not an extra polynomial equation.

## 2. Faithful coordinates (Defs 18–76)
Set d=dim_Q D, N=d+1, and use the base-changed rational basis e_i of A. Let L(a) be the matrix of left multiplication by a; L(ab)=L(a)L(b), and L(1)=I. Embed the product ring A×R via
    b(a,c)=diag(L(a),c)
(reindexed from Fin d ⊕ Fin 1 to Fin(d+1)). The source blk proves one, multiplication, zero and addition using block identities. For any matrix X, define a(X) by the coordinates X_11 [1]_e, and c(X)=X_22 (the 1×1 bottom-right entry). Equivalently a(X)=sum_i(sum_j X_ij [1]_j)e_i. The basis need not begin with the identity. Since L(a)[1]=[a], a(b(a,c))=a and c(b(a,c))=c. Thus blk is injective. This also shows why simply reading the first matrix column is not justified for the arbitrary finBasis used in Lean.

## 3. Natural polynomial equations (Nat 88–134; Cond 146–204; Main 309–329)
Let F_f=f⊗id. On pure tensors r⊗m, the coordinates transform by applying f to the coordinates (r times rational basis coefficients). Zero and addition extend the identity to all tensors. Consequently L(F_f(a))=f(L(a)) entrywise, and the two coordinates a(X),c(X) commute with base change. The proof for a(X) uses F_f(1)=1 and finite sums. The extended star commutes with F_f by tensor induction; hence the form error aBa*−cB and commutator aY−Ya commute with base change.

Take the universal N×N matrix U=(X_ij) over Q[X_ij]. Set S to the range of cond on U, with exactly three indexed families:
1. all N² entries of X−b(a(X),c(X));
2. all d basis coordinates of a(X)Ba(X)*−c(X)B;
3. all d basis coordinates of a(X)Y−Ya(X).
Evaluation of each universal polynomial at any matrix over any R equals the corresponding concrete condition by cond_map and aeval_cond, not by an argument only for field-valued points. The matrix vanishes iff every entry vanishes, and a vector vanishes iff all its basis coordinates do. Thus cond_zero_iff is an equivalence, and mem_zeroLocus_iff transports it to the locus. Additional explanatory bound (derived from these definitions, not an explicitly stated Lean conclusion): S is finite with at most (d+1)^2+2d distinct polynomials, all of degree at most 2. The coordinate maps are linear with rational coefficients; multiplication by fixed B,Y and star are linear; the quadratic term is aBa*. The range can contain duplicates or zero polynomials. No claim of minimal generators or dimension of the locus.

## 4. Unit extraction is not automatic in a general algebra (Units 216–253; Main 333–358)
Given b(a,c)Z=I, undo reindexing and take the upper-left block M and lower-right scalar z of Z. Then L(a)M=I and cz=1. Because R is commutative and matrices are finite square, a one-sided matrix inverse is two-sided (determinant/adjugate argument, including the zero-ring convention, or the source mul_eq_one_comm). Define a' by [a']=M[1]. Then [aa']=L(a)M[1]=[1], so aa'=1. To obtain the second inverse relation, L(a)L(a')=I; direct finiteness of matrices gives L(a')L(a)=I; injectivity of the regular representation gives a'a=1. The source explicitly constructs both inverse identities e1 and e2 in the unit. The scalar c is a unit by commutativity. This does not assert one-sided inverses are two-sided in arbitrary infinite-dimensional noncommutative rings.
Now a matrix g in the polynomial locus in GL has g=b(a(g),c(g)); multiply by its known inverse to apply unit extraction. The form and commutation errors give TC. Conversely if (a,c) is a TC pair of units, b(a,c) is a unit and all three condition families vanish by coordinate recovery. This is mem_locus_iff, an exact two-way characterization.

## 5. Subgroup (Units 257–298; Main 360–394)
Identity satisfies TC. For TC pairs (a,c),(a',c'), anti-multiplicativity and central scalars give
    (aa')B(aa')* = a(a'Ba'^*)a* = c' aBa* = (cc')B.
Products of commuting-with-Y elements commute with Y. Inversion: a^{-1}(aBa*) (a^{-1})* = B because a* (a^{-1})*=1. Substitute aBa*=cB, move central c, multiply by c^{-1}, giving a^{-1}B(a^{-1})*=c^{-1}B. Commutation with Y is preserved by inverse of the unit. No cancellation of B and no assumption star squared is identity.
These prove tc_one, tc_mul, tc_inv, then isGroupLocus via mem_locus_iff. Restrict b on units to the TC subgroup, yielding psi_R. Injectivity follows from blk_injective plus unit/subtype extensionality; surjectivity follows from the characterization. Hence psi_R is a group isomorphism onto the locus, and phi_R is its inverse followed by the TC subgroup inclusion (396–417). In particular b(phi_R(g))=g and the two components of phi are exactly a(g),c(g) as units. This supplies both injection and the exact range equivalence, not merely containment.

## 6. Naturality and topology (Final 428–472; exists_locus 503–516)
If g' is the entrywise image of g under f as matrix units, the coordinate equalities from Section 3 and unit extensionality identify phi_R'(g') with the componentwise images of phi_R(g). No surjectivity or injectivity of f is used.
The module topology ensures continuous addition and scalar multiplication. a(X) is a finite linear combination of entry projections times fixed basis vectors; c(X) is one entry projection. Both continuous. To prove continuity into the unit group, the source checks BOTH forward and inverse coordinates, since the topology on units is induced by value and inverse value. Apply the coordinates to the continuous matrix value of g and to the continuous matrix inverse of g, and use phi(g^{-1})=phi(g)^{-1}. This proves continuous_phi on both unit components and then on the product. It does not infer continuity of an arbitrary inverse map from bijectivity. Finally choose the module topology explicitly and assemble the existential tuple with N=d+1, S, hS, phi.

## 7. Connection and outstanding obligations
This discharges the hbr representation premise of RUN21 classes_finite at human/source level. That theorem still needs ClassNumberFinite and GLIntegral existence and the adelic gluing suppliers. Source-level consumer route recorded in RUN20–21: exists_locus → ccf_holds/classes_finite → cover_KHT → finite_doubleCoset → forms_fin/specOfF → spectral nonvanishing → PlanEx → Pack/GeoOne → local-global compatibility → EveryCharacter → RH. This is not newly authenticated root reachability. Dependency RUN22 (3df7d31187ce2844914f72a056cd96146c231111) reports other exact local-global targets, but not these specific supplier paths in inspected excerpts. Request cached role-labeled edges to TorLoc.exists_locus and ClassNumberFinite_holds before calling this an essential root-value route. Imported tensor basis, left multiplication injectivity, direct finiteness, module topology and starT lemmas are retained, not re-proved from Lean foundations here. Earlier Frobenius fixed-field and relocated proof gaps remain.

## 8. Executed source regression and upstream comparison
Executed connector + V8 comparison: both complete source snapshots, 47 named top-level abbrev/def/theorem blocks compared (40 text-identical, 7 differing; no statement prefix changes among the 7; exists_locus exact). 28 pinned source anchors checked. Changed blocks: blk and repr_map and starT_tmap add explicit map_add argument; blk_map shortens simp set; coordA_map whitespace; isUnit_of_blk_mul shortens scalar simplifier; continuous_coordA uses continuous_finsetSum spelling. Upstream import header changes markedly, including replacement of Mathlib omnibus import and module/public section syntax. No global equivalence or kernel replay inferred. The checks inspect source, not certify arithmetic or Lean proof validity.

Reproduce from local upstream git checkout using Python 3 (checkout replay supplied, not executed here; equivalent comparison/anchors executed in V8):
~~~python
import re, subprocess, sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59"
path="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PolynomialZeroLocusCoordinates.lean"
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
def read(ref,sha):
    assert git("rev-parse",ref+":"+path).strip()==sha
    return git("show",ref+":"+path)
p=read(P,"9f53cdb64b8e02e9776d9bc8b3084a49f8b7b6de")
h=read(H,"e8e20f8148de75390c715a60014e3b4983477d90")
def extract(s):
    ms=list(re.finditer(r"^(?:abbrev|def|theorem) (\w+)\b",s,re.M))
    return {m[1]:re.split(r"^(?:end |namespace |section |variable )",
      s[m.start():ms[i+1].start() if i+1<len(ms) else len(s)],maxsplit=1,flags=re.M)[0].strip()
      for i,m in enumerate(ms)}
x,y=extract(p),extract(h)
assert len(x)==len(y)==47 and x.keys()==y.keys()
changed=[n for n in x if x[n]!=y[n]]
assert changed==["blk","repr_map","blk_map","coordA_map","starT_tmap","isUnit_of_blk_mul","continuous_coordA"]
for n in changed:
    sep=" where" if n=="blk" else ":= by"
    assert x[n].split(sep)[0]==y[n].split(sep)[0]
assert x["exists_locus"]==y["exists_locus"]
anchors=["Matrix.fromBlocks (lreg D R z.1) 0 0","Algebra.leftMulMatrix_mulVec_repr (basR D R) z.1 1","exact Prod.ext h1.symm h2.symm","induction x using TensorProduct.induction_on","rw [repr_map, repr_coordA, repr_coordA, map_sum]","(starT σ R a).unop - algebraMap","def commE","X ij.1 ij.2 - blk","forall_coord_eq_zero_iff","have hBL : B * lreg D R a = 1","have e1 : a * a' = 1","have e2 : a' * a = 1","exact mul_eq_one_comm.1 this","isUnit_iff_exists_inv.2","MulOpposite.unop_mul","exact hz2.units_inv_left","Set.range (cond σ β y _ (Xu D))","rw [cond_map]","rw [mem_zeroLocus_iff, cond_zero_iff]","obtain ⟨ua, uc⟩ := isUnit_of_blk_mul","exact ⟨rfl, sub_eq_zero.2 h1, sub_eq_zero.2 h2⟩","def tcSub","theorem psi_bijective","have h'' := blk_injective D R h'","MulEquiv.ofBijective","Units.continuous_coe_inv.comp continuous_subtype_val","Units.continuous_iff.2","letI : TopologicalSpace (R ⊗[ℚ] D) := moduleTopology"]
for a in anchors: assert a in p,a
print("47 named blocks: 40 exact, 7 changed, 28 anchors; final statement/proof unchanged")
~~~

RESULT: DONE local SOURCE-MATCHED representation of TC by polynomial group locus, including explicit degree/count bound (human consequence), unit extraction, naturality and topology. PARTIAL root authentication and imported arithmetic suppliers. No independent Lean kernel validation, complete RH translation or URT speed claim.
RESUME HERE: expand P src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/ClassNumberFiniteHolds.lean (a0e3a4d423be75495b519125cf2e58c0ba5998ba, L11–28), identify the integral-level class-number theorem and the precise reduction from compact-open subgroups, then trace that native supplier. Request cached exact role-linked Main path to TorLoc.exists_locus/classes_finite and previous ccf_holds/specOfF instead of rescanning huge exports. Keep prior pending obligations recorded in RUN21. HANDOFF TO Galois, dependency, kernel, integration, acceleration, literature, editor, audit. Full RH OPEN.

<!-- END VERBATIM specialists/galois_representations/RUN22_POLYNOMIAL_GROUP_LOCUS.md -->

<!-- BEGIN VERBATIM specialists/landau_criterion/RUN22_GAUSSIAN_FUBINI_POLAR_FOUNDATION.md e68e1d249dd86d68d9a61cde376207727afdb3d2 -->
# RUN22 — Gaussian foundation: Fubini, polar Jacobian, radial primitive, principal sign
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction; Main-root role authentication and independent Lean replay OPEN.

## Provenance and continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RUN21 (55c3575ce4cdb3ae48d1cf5e21ac5a7f9c72078f), state/log/protocol/continuity excerpts and CI #416 (45540458272, unrelated physical gates only). Inspected recent peer commit patches with visible RESUME notes, dependency reconciliation and editor manuscript tail. Theta owns Crux0/pos_int; geometry owns spherical Jensen. No duplicate scalar Gaussian task found in inspected records. Not all peer files or linked PDF reread. No physical gate changes.
RH baseline P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (2026-11-25 04:16:12Z, merge #2057 batch 13), advanced from fcb6eac7534875d32d68030967e2deae6d686151. Manifest blobs P b4d1ec31575a26b2159ec3a262b482bc051f3f6f, H 8a747b58a34565cc6cb5341b86544aa5d3a20a2d. Mathlib pins M=0df444a360eaa60ab8c11dca51a86af692955474, N=31ce06eaadf4a200c0e1407c5f10953cf606b8f8, N unchanged. Both actual Mathlib refs successfully fetched.
Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean: M blob 13927ae74e7ce60a2d053df06eacec80b3f924a0, N blob ec5f214fa4f7b8aff766bd5068da0a8a20370b49. Compared 10 contiguous blocks (M 139–158,159–177,180–209,211–222,224–235,237–273,276–287,290–302,307–319,322–325; N shifted -1). Six identical, four tactic-only changes (convert! -> convert, final congr syntax). No changed statements in these blocks.
Mathlib/Analysis/SpecialFunctions/PolarCoord.lean: M blob 053dcbf1bcd84f42dcc8273dd4afb0d87a6755e6, N blob 5648ba62e13ad26f2ccad83452a5e7a937fb7f2b. Both source L35–154 inspected by selected-line retrieval; not byte-identical, same source/target, determinant and change-of-variable statements. Source links: https://github.com/leanprover-community/mathlib4/blob/31ce06eaadf4a200c0e1407c5f10953cf606b8f8/Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean and https://github.com/leanprover-community/mathlib4/blob/31ce06eaadf4a200c0e1407c5f10953cf606b8f8/Mathlib/Analysis/SpecialFunctions/PolarCoord.lean. No whole-library equivalence asserted.

## 1. Absolute integrability before Fubini
Let b=A+iB, A>0, f_b(x)=exp(-b x²), J(b)=integral_R f_b(x) dx. N L62–157: source proves real Gaussian and x-weighted Gaussian integrability using Gamma integral convergence (u=x^p, p>0, s>-1, (s+1)/p>0), scaling by A^(-1/p), reflection on negative half-line. For s=0,1,p=2 an elementary direct bound also works: on |x|>=1, exp(-Ax²)<=exp(-A|x|), and |x|exp(-Ax²)<=|x|exp(-A|x|); both integrable, and on [-1,1] continuous. Since |f_b|=exp(-Ax²), f_b and x f_b are absolutely integrable. If A<=0, |f_b|>=1, so not Bochner integrable. No Fresnel interpretation at A=0. Fubini follows because integral_R² |f_b(x)f_b(y)|=(integral_R |f_b|)^2<infinity by Tonelli. Crucial: J² is a product without conjugation; |J|² would be different.

## 2. Radial primitive (N L158–176, integral_mul_cexp_neg_mul_sq)
b!=0 since A>0. F(r)=-exp(-br²)/(2b); differentiation along the real axis yields F'(r)=r exp(-br²). On [0,T] FTC gives integral_0^T r exp(-br²)dr=(1-exp(-bT²))/(2b). Endpoint error has exact modulus exp(-AT²)/(2|b|), tends to zero. Absolute convergence from section 1 and continuity at zero justify the improper limit, hence integral_(0,infinity) r exp(-br²)dr=1/(2b).

## 3. Polar coordinates (PolarCoord N L35–154; GaussianIntegral N L179–208, integral_gaussian_sq_complex)
Source S={(x,y):x>0 or y!=0}; omitted nonpositive x-axis including origin is Lebesgue-null, because it lies in the kernel of the nonzero linear functional (x,y)->y (or Tonelli on rectangles). Target T=(0,infinity)×(-pi,pi), inverse P(r,t)=(r cos t,r sin t). Smooth on T and bijective to S, with unique principal argument. Its derivative matrix has rows (cos t,-r sin t),(sin t,r cos t); det=r(cos²t+sin²t)=r>0. Thus abs(det)=r; change of variables yields integral_R² g=integral_T r g(P(r,t))drdt. No angular multiplicity; interval length 2pi, endpoints null. Uses the standard Jacobian theorem, native reference integral_target_eq_integral_abs_det_fderiv_smul; its general proof not expanded here.
For g=f_b(x)f_b(y)=exp(-b(x²+y²)), Fubini and polar substitution give J(b)^2=integral_R² g=integral_0^infinity integral_-pi^pi r exp(-br²)dtdr=2pi/(2b)=pi/b. Polar integrand is absolutely integrable since norm factors into angular length and radial r exp(-Ar²). Product Lebesgue measures, no change of sign due to complex coefficients.

## 4. Principal square root (N L210–272)
For real A>0, J(A)>0 by positivity on [-1,1], hence square equality yields J(A)=sqrt(pi/A). For A<=0, native real integral_gaussian uses totalized Bochner integral zero and totalized real sqrt of nonpositive quotient zero (at b=0 division is totalized too); do not present this as a convergent classical integral.
For any b in right half-plane choose d=A/2. In neighborhood Re(c)>d, |f_c(x)|<=exp(-dx²), so dominated convergence makes J continuous. K(b)=exp((1/2)Log(pi/b)) is continuous since Re(pi/b)=pi A/|b|²>0 and pi/b!=0; K²=pi/b. Thus J/K takes only ±1; continuous on convex connected domain, constant, equals +1 at b=1, so J=K throughout. Square identity alone insufficient; without connectedness or positive basepoint a negative branch survives.
Evenness and absolute integrability give integral_0^infty f_b=J/2 (N L275–286). Gamma(1/2) follows by u=x², x>0, u^(-1/2)du=2dx, so Gamma(1/2)=2 integral_0^infty exp(-x²)dx=sqrt(pi); real to complex via Gamma_ofReal (N L306–324). No circular use of Gamma(1/2) to obtain J; initial Gamma convergence does not require its special value.

## 5. Additional quantitative truncation
For R>0 let J_R=integral_-R^R f_b, D_R=integral_(disk radius R) exp(-b(x²+y²))dxdy=pi/b*(1-exp(-bR²)). Disk contained in square [-R,R]^2, therefore |J_R²-D_R|<=integral_(square minus disk) exp(-A(x²+y²))<= (pi/A)exp(-AR²). Also |J²-D_R|=(pi/|b|)exp(-AR²). Hence |J_R²-pi/b|<=pi(1/A+1/|b|)exp(-AR²), without square-root branch assumption. In 1D, |J-J_R|<=exp(-AR²)/(AR), by x/R>=1 for x>=R. Standard Gaussian analysis, not new mathematics or URT acceleration. No uniformity as A approaches zero.

## 6. Dependency and RH status
Direction: Gamma convergence (or direct integrability) -> radial FTC + Fubini + polar Jacobian -> squared integral -> connected principal sign -> RUN21 shifted contour -> RUN20 Fourier/Poisson -> RUN19 theta/Mellin -> RUN17–18 zeta residue/Gamma -> RUN16 boundary nonvanishing -> conditional Landau criterion RUN12–15. Local mathematical import chain, not authenticated Main-root kernel reachability. None constructs arithmetic window or establishes RH. Preserve 0<theta<1, delta>0, positive exceptional real-pole residues, principal character correction and conjugate zero branch. P zeroFree_of_rpow_window remains conditional on for-all Y0, exists Y>=Y0, for-all y in [Y,Y^(1+delta)] bound. Current H relocation not checked here; do not repin.

## 7. Executed certificate
V8 JS, Node compatible. BigInt rational unit-circle determinant and norm, positive reciprocal numerator and convex segment; Simpson radial, principal Gaussian and disk/square inequality. Floating quadrature not rigorously enclosed; analytical error bounds concern tails, not discretization. Finite tests cannot certify Fubini or connectedness. Numerical control at A=0 tests nondecay behavior; analytical exclusion by modulus 1. First combined submission had a JS syntax error before execution; corrected parenthesis, then executed successfully. Actual output: {"jacobian":6000,"radial_norm":6000,"halfplane":17220,"radial":125,"gaussian":25,"disk":100,"controls":4,"maxRadial":2.339386069187042e-12,"maxGaussian":2.9508222687980746e-15,"maxDisk":0.9804793504210618}.
```js
function certificate(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 let jac=0,norm=0,halfplane=0,radial=0,gaussian=0,disk=0,controls=0,maxRadial=0,maxGaussian=0,maxDisk=0;
 for(let u=-12n;u<=12n;u++)for(let v=1n;v<=12n;v++)for(let r=1n;r<=20n;r++){
   const c=v*v-u*u,s=2n*u*v,d=v*v+u*u;
   ck(c*c+s*s===d*d && c*(r*c)+s*(r*s)===r*d*d,"polar Jacobian");jac++;
   ck((r*c)**2n+(r*s)**2n===r*r*d*d,"radial norm");norm++;
 }
 for(let A=1n;A<=20n;A++)for(let B=-20n;B<=20n;B++)for(let t=0n;t<=20n;t++){
   ck(A*A+B*B>0n&&A>0n,"reciprocal");ck((20n-t)+t*A>0n,"convex path");halfplane++;
 }
 const add=([a,b],[c,d])=>[a+c,b+d],sub=([a,b],[c,d])=>[a-c,b-d],mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],sc=(z,k)=>[z[0]*k,z[1]*k],abs=z=>Math.hypot(...z),exp=([a,b])=>[Math.exp(a)*Math.cos(b),Math.exp(a)*Math.sin(b)],div=(a,b)=>sc(mul(a,[b[0],-b[1]]),1/(b[0]**2+b[1]**2)),sqrt=z=>sc([Math.cos(Math.atan2(z[1],z[0])/2),Math.sin(Math.atan2(z[1],z[0])/2)],Math.sqrt(abs(z))),err=(a,b)=>abs(sub(a,b))/Math.max(1,abs(a),abs(b));
 function simpson(f,l,r,N=8192){let z=add(f(l),f(r));for(let j=1;j<N;j++)z=add(z,sc(f(l+(r-l)*j/N),j%2?4:2));return sc(z,(r-l)/(3*N));}
 for(const A of [.25,.5,1,2,4])for(const B of [-3,-1,0,1,3]){
   const b=[A,B],J=div([1,0],sc(b,2)),K=div([Math.PI,0],b),R=9/Math.sqrt(A);
   const f=x=>exp(sc(b,-x*x)),g=x=>sc(f(x),x);
   for(const T of [.25,1,2,4,R]){
     const expected=mul(J,sub([1,0],f(T))),actual=simpson(g,0,T);
     const e=err(actual,expected);ck(e<2e-9,"radial integral");maxRadial=Math.max(maxRadial,e);radial++;
   }
   const z=simpson(f,-R,R),e=err(z,sqrt(K));ck(e<2e-9,"principal Gaussian");ck(err(mul(z,z),K)<4e-9,"Gaussian square");maxGaussian=Math.max(maxGaussian,e);gaussian++;
   for(const T of [.4,1,2,4]){
     const jt=simpson(f,-T,T),diskValue=mul(K,sub([1,0],f(T))),squareValue=mul(jt,jt);
     const bound=Math.PI/A*Math.exp(-A*T*T);
     const residual=abs(sub(squareValue,diskValue));ck(residual<=bound+2e-9,"disk vs square bound");maxDisk=Math.max(maxDisk,residual);disk++;
   }
 }
 ck(abs(sub([Math.sqrt(Math.PI),0],[-Math.sqrt(Math.PI),0]))>3,"square ambiguity");controls++;
 ck(abs(sub([Math.PI,0],[Math.PI/2,0]))>1,"half angle");controls++;
 ck(abs(sub([1,0],exp([0,-2])))>1,"zero real part fails decay");controls++;
 ck(Math.exp(4)>1,"negative real part grows");controls++;
 return {jacobian:jac,radial_norm:norm,halfplane,radial,gaussian,disk,controls,maxRadial,maxGaussian,maxDisk};
}
console.log(JSON.stringify(certificate()));
```

## RESUME HERE
Scalar Gaussian local expansion complete through explicit change of variables; do not descend into unrelated foundational lemmas without root path. Ask dependency/kernel/acceleration lanes to resolve exact pinned declarations zeroFree_of_rpow_window, Landau criterion and integral_gaussian_complex in authenticated Main-root value/expression projections (identities, edges and witnesses); use cached artifact, no fresh full scan. Independently locate current H path to zeroFree_of_rpow_window by exact source index and compare pinned P statement/body, then work on authenticated arithmetic-window supplier or explicitly conditional source bridge rather than more generic analysis. Request editor integrate RUN21–22 with Gamma(1/2) noncircularity and totalization warning. HANDOFF TO dependency, kernel, acceleration, editor, theta, integration, prime, audit. Full RH OPEN.

<!-- END VERBATIM specialists/landau_criterion/RUN22_GAUSSIAN_FUBINI_POLAR_FOUNDATION.md -->

<!-- BEGIN VERBATIM specialists/literature_provenance/RUN22_CRYSTALLINE_REDUCTION_TAG_ACYCLICITY.md 7ce3c6d6e5de143eb68480b200c15f5ce9b7c566 -->
# RUN22 — Crystalline reduction: tagged categories, acyclicity and comparison
2026-11-25. SOURCE-MATCHED local human proof; full RH OPEN. Continues RUN21 4e3c4bf16426b98cf19a9c93ec04b5096cad7f06, without revisiting Cathedral physics.

Preflight: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log excerpts, research and continuity protocols, latest CI summary (45545297982 at 3df7d31, unrelated Cathedral PASS), RUN21 full source ledger and handoff. Read recent peer handoffs from math, Galois, theta, Landau, prime, dependencies, acceleration, integration, character boxes, structure, kernel, geometry and audit; editor RUN22 commit and path inspected, full editor note and blueprint not reread. No duplicate of this crystalline reduction task identified. No authenticated Main-root path for this supplier retrieved: do not count these declarations as confirmed RH essential nodes.

## Source ledger (all paths relative to src/Development/)
Repository leanprover-community/riemann-hypothesis; pin 40e56bab026552e089d7afcfeff08d2defb9c005. B = WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/.
- R = B/CrystallineDeRham.lean, efc95dd74b086a96d3de1f13d40c04d4d4796931.
- T = B/TagIso.lean, 8774201f72ff039500e42c2f034b30d82ae7d1f7.
- A = B/AcycOfCoprod.lean, 6dd3e0d2c9681c3e31b7794c84b4e6e79854a341.
- F = B/CompF.lean, 5ca821664575e0d175f7de49095efbb7ec7bc571.
- L = B/IsNilpotentOfIsNilDP.lean, 09934d09743cb9868157e06156c78e7e6fbf5fc8.
- D = B/IsDPMorphismId.lean, 0b205314bb9cd8cdc4b67f0797ac0a949960a647.
- P = AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsCrystalPairing.lean, 53aee5b7a7aaa544c0e22ff51f0a7d449b0a036f.

Actual GitHub blob receipts matched all seven recorded SHA values. Upstream observed 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59; R at that revision is a 1247-line clump, blob 16ae3e6fef93fe4c8dc5c4907ec31fc77a81d47c. Of 70 nonblank pinned lines between exists_lev and the closing namespace, 66 occur verbatim somewhere in the clump (line membership, not ordered or kernel equivalence). Missing original lines R44,47 (Tag.hom_ext references) and R98–99 (crystallineDeRham wrapper). Red.pull1/2 remain at H1218 and H1229. No claim that wrapper is deleted globally; its new producer/use site needs locating.

## 1. Exact proposition and elementary reduction diagram
P L31–37 defines Published.CrystallineDeRham as a proposition, not an axiom or proof. Quantify over commutative rings R,R₀, ideal I, divided powers κ with IsNilDP κ; surjective π:R→R₀ with ker π=I; schemes X,X₀, s:X→Spec R, s₀:X₀→Spec R₀ and i:X₀→X; s smooth, separated and quasi-compact; the square (i,s₀,s,Spec π) a pullback; and every m:IsMor (dp0 R) s κ (s₀≫Spec π) (id_R) i. Conclusion: m.pull1 and m.pull2 bijective. D L22–29 packages nilpotence, surjectivity, kernel equality and pullback in Red, and L36–39 constructs the canonical morphism. IsMor is proof data over fixed underlying maps, not a new arbitrary map on cohomology. R L98–99 has an actual proof term constructing both conclusions; it ignores the quasi-compactness and final m binders syntactically. Preserve them in the published proposition. No new axiom inferred.

A chart U in F L20–24 is an affine open with flat coordinate algebra over R and a formally étale map R[x₁,…,x_d]→Γ(U,O). Smoothness gives the chart cover (L160ff), separatedness gives intersections (L208–219): the intersection of two affine opens is affine by the affine diagonal; the restriction is étale, hence flat and formally étale, so composing preserves the chart property. The reduced chart opens are i⁻¹(U); preimages preserve unions and intersections, so R65–72 derives cover and intersection closure without needing i to be an open immersion.

For j=1,2, write A_j=H^j(Thick(dp0 R,s),O), B_j=H^j(Tag(dp0 R,s,U),O), C_j=H^j(NTκ,O), E_j=H^j(Tag(κ,s₀≫Specπ,i⁻¹U),O), Z_j=H^j(Thick(κ,s₀≫Specπ),O). The native maps are a:A_j→B_j by tag restriction; b:B_j→C_j by inclusion restriction; c:C_j→E_j by cG; d:Z_j→E_j by reduced tag restriction; p:A_j→Z_j by h.mor.pullj. For each j:
    d p = c b a.
The equality is checked in R74–95 on arbitrary cohomology classes by H1.mk_surjective or H2.mk_surjective and definitional equality of the representative maps. Each of a,b,c,d is bijective by the actual source suppliers below, hence p=d⁻¹ c b a is bijective. It would be incorrect to cancel d without bijectivity. The statement is about cohomological classes, not individual cochains.

## 2. Tags, small objects and the two restriction maps (F29–60; T36–65,152–235)
Tag(γ,s,U) objects are (T,k, image of T.x contained in U_k); arrows are thick-object arrows plus U_k⊆U_l. An arrow is determined by its thick arrow, since the order constraint is propositional. IsSmall is the full subcategory of thick objects admitting such a chart. toSmall forgets the tag, and the whole forgetful functor factors through inclusion of IsSmall.
Fix a small target T, choose a tag k₀ containing its image, and consider a comma object a=(S,k,c:S→T). The arrow implies T's image is contained in U_k. Let self(k)=(T,k,id_T) for each admissible k, and choose m(k) with U_m=U_k∩U_k₀. A comma arrow to self(l) is unique if it exists: its thick component is forced to be the structural map to T, and inclusion of opens supplies the tag condition.
Construct S₁(a)=self(k), S₂(a)=self(m(k)). Monotonicity of intersection yields functoriality; the unique arrows to self objects make the following three families natural:
    Id → S₁ ← S₂ → const(self(k₀)).
Thus the comma category is nonempty, any compatible objectwise constant-coefficient family takes the same value at all objects, and identity and constant restriction on H¹,H² agree. T uses its explicit natural-transformation pullback lemmas and the one-point category (H¹ vanishes by initiality, H² by an explicit constant primitive). This proves acyc_toSmall. Important: acyclicity here is the exact A14–16 predicate (nonempty, constant 0-cochain property and H¹/H² vanish for EVERY commutative R-algebra of constant coefficients), not merely connectedness or a general all-degrees contractibility claim.
For a,d in §1, T190ff composes qa1 with SmallDescent.pull1_bijective. Degree two T199ff uses Desc.pull2_bijective: constructs its localization premise from SmallDescent.exists_isLoc (unit, surjectivity, kernel and universal property), uses smallness inheritance under a thick morphism, and constructs a finite cover via SmallDescent.exists_cover and its Fin indexing. Then qa2 applies. The deeper localization and cover descent proofs are imported, not established merely by this composition.

## 3. NT comma acyclicity (R20–60; F16–18; L223–354)
InNκ(S) asserts existence of divided powers on S.J + I B_S extending both S's PD structure and κ through algebraMap. NT is the full subcategory of tags with this condition, not the entire category. Fix T in the tag category. Since T's PD ideal is weighted nilpotent with cutoff N, n=N+1≥1 has filtration ideal fil_n=0 (exists_lev uses the generators of the ideal span). Use the tag k=T.k. Let D_T be the comma category of NT over T. The standard chart object bas(k) is InN because its chart algebra is flat and flatExt supplies extension of κ; the zero PD ideal is compatible. A lift a₀:bas(k)→T.T exists because the reduction maps are surjective with nilpotent kernels and the chart coordinate map is formally étale (L255–297). Choose lifted polynomial coordinates and lift uniquely relative to those coordinates, not uniquely without them. This gives distinguished comma object d=(bas(k),k,a₀).
For each a∈D_T let c_a:S_a→T.T be its thick arrow. Its tag is contained in T's chart. L313–354 supplies P_a with arrows i_a:S_a→P_a, j_a:bas(k)→P_a, InNκ(P_a), and fil_n(P_a)=0, and the universal property ONLY for level-n targets V:
    for every φ:S_a→V and b:bas(k)→V there exists a unique ψ:P_a→V with ψ i_a=φ, ψ j_a=b.
Construction: choose chart lift j_S to S; use exists_adj S hS d n hn to adjoin d nilpotent coordinates y_k with universal property. Lift chart into P with coordinates i(j_S(x_k))+y_k, since y_k reduces to zero. Given φ,b into V, prescribe y_k↦ b(x_k)−φ(j_S(x_k)). These differences lie in V.J since the reductions agree (π_eq). The universal property of exists_adj gives ψ; agreement on coordinates plus formal unramifiedness gives ψj=b (lift_ext). The same argument forces any competitor to have the prescribed y values, proving uniqueness. This is conditional on exists_adj, whose actual construction is the next frontier, not an unrestricted categorical coproduct.
Apply that property to V=T.T to obtain q_a:P_a→T.T with q_ai_a=c_a and q_aj_a=a₀. Give P_a the tag T.k, producing Q(a) in D_T. Its chart constraint is carried by i_a; the original tag inclusion makes i_a an arrow a→Q(a). For any comma arrow φ:a→Q(b), apply universal property with V=P_b (level n) to obtain ψ extending φ and j_b. Both q_bψ and q_a extend c_a and a₀, hence equal by uniqueness with target T.T (also level n). So ψ is an arrow Q(a)→Q(b) over T. Its uniqueness as a comma arrow follows from faithfulness of forgetting tags and the comma equation. These are exactly the hypotheses of A65 acyc_of_coprod; they do not require coproducts for arbitrary targets.
A65–79 constructs Q on an arrow f:a→b by uniquely extending i_b f and j_b; identity and composition follow by the same uniqueness. Thus Id→Q←const(d). A29–63 transports restriction through this zigzag with identity coefficient maps. For H¹ the constant restriction evaluates a cocycle at id_d, which is zero (Z1.id). For H² it evaluates at (id_d,id_d) to a constant z; the constant 1-cochain z has differential z−z+z=z. Every class is a boundary. Compatible functions are constant via the zigzag, and d witnesses nonemptiness. This proves acyc_NT. No assumption of arbitrary-degree vanishing.
Now b in §1 is bijective by qa1/qa2 for all comma targets T. A138–275 contains actual proof bodies; their general descent identities are recorded separately below.

## 4. The middle comparison c and its inverse (D41–78,83–176,180–242)
Surjectivity of i: weighted nilpotence implies each element of I nilpotent (repeat degree-one divided powers N times); thus every prime of R contains I, and surjectivity of π identifies Spec R₀ with the primes containing I. Surjectivity is preserved by pullback. Consequently inclusion of opens may be detected on i⁻¹(U); this is what permits G on tagged arrows.
For S∈NT, enlarge J_S to J_S+I B_S and take quotient of B_S by that sum, preserving B_S itself. The maps from old quotient and R₀ exist by quotient universality. Their agreement over R gives a point in X₀ by the pullback property. Chosen compatible PD structure is nilpotent by nil_sup (both original structures nilpotent; required). This is D's Red.up. Its arrows extend through the quotient because both ideals map into the target ideal; PD compatibility follows from isDPMorphism_sup. Unit arrow on B_S is identity. Conversely, a thick object over X₀ already contains the base PD image; forgetting κ preserves its ring and places it in NT. These constructions give D's G,H, with same coefficient rings and identity coefficient maps cG,cH. The unit Id→H⋙G and counit G⋙H→Id induce identities on coefficient rings. Coefficient-map natural-transformation invariance then gives inverse compositions on H¹ and H² (D226–242). No claim that these are inverse on raw objects, or that arbitrary natural transformations imply equality without coefficient compatibility.
Combining §§1–4 discharges both Red.pull1 and Red.pull2 under their native local premises.

## 5. General qa1/qa2 proof-body reading (A138–275; no transitive kernel claim)
For an arrow c:GS→T write c_* for the coefficient map. Each comma category satisfies Acyc; in its constant coefficients, differences of compatible expressions descend to unique constant values because it is nonempty and connected. Degree one injectivity: if a restricted cocycle f is δg, the expression f(c)+c_*g(S) is invariant under precomposing by comma arrows; denote the constant m(T). For φ:T→T', the cocycle equation yields f(φ)=m(T')−φ_*m(T). Degree one surjectivity: for cocycle f on C', choose v_T with v_T(S',c)−v_T(S,cGψ)=−c_*f(ψ), using H¹=0; define m(φ)=v_T'(S,φc)−φ_*v_T(S,c), invariant under comma arrows. Its cocycle identity telescopes; at identity c of GS, its restriction differs from f by δ of v evaluated at identity.
Degree two injectivity: if restricted z=δf, choose v_T with
    v_T(S',c)−v_T(S,cGψ)=z(Gψ,c)−c_*f(ψ).
Use z's cocycle identity to show m(φ)=z(c,φ)−φ_*v_T(S,c)+v_T'(S,φc) independent of c; then δm=z by the same cocycle identity, as the v terms cancel.
Degree two surjectivity: let y be a cocycle on C'. H² comma acyclicity gives w_T on comma arrows satisfying δw_T(φ,ψ;c)=c_*y(φ,ψ). H¹ acyclicity gives x_φ on objects with δx_φ(ψ;c)=φ_*w_T(ψ;c)−w_T'(ψ;φc). Define m(φ,φ')=φ'_*x_φ(S,c)+x_φ'(S,φc)−x_(φ'φ)(S,c), which is invariant by these identities. The cocycle condition for m telescopes on a chosen comma object; restriction differs from y by δ of the cochain ψ↦x_(Gψ)(S,id_GS)−w_(GS')(ψ,id_GS'). These are the signs in A263–275. No use of H³=0. The actual natural-transformation cohomology invariance theorem and small descent localization internals remain imported dependencies, not proved here.

## 6. External assumption ledger delta
| Source | Status / obligation |
|---|---|
| P L31–37, F16–42, A14–16, D22–29 | Proposition/structure definitions, not external postulates or citation evidence. Preserve their full scopes. |
| R20–60,65–99 | Explicit proof bodies, including published proposition producer; smooth/separated/PD-nilpotent/surjective/kernel/pullback premises retained. |
| T152–235, A29–79,138–275 | Explicit conditional comparison and acyclicity arguments; imported CoefMap naturality invariance, SmallDescent and Desc results remain dependencies. |
| L223–354 | Explicit conditional lifting and level-limited coproduct proofs; flatExt, exists_adj, formal smoothness/unramifiedness and nil_ker supply actual obligations. |
| D41–242 | Explicit reduction and inverse construction; compatible PD ideal sums/nil_sup and categorical pullback/quotient results required. |
| PositivityTheory.DualRT.abelianDeRham | Prior RUN21 identified caller uses AbelianDeRham.rigid_of_free_of_crystallineDeRham hF crystallineDeRham; rigid producer not yet located in this run (checked ExistsCrystalPairing and AbelianDeRhamPoincareDualityOfCubeDual, no declaration found). |
| OpenLiteratureStatements | No new direct declaration inspected in this run; no global negative axiom/sorry claim. |
No external citation claim used as proof. No additional premises introduced to native implications. This is local source reading, not authentication of Main reachability, transitive dependency closure or independent Lean replay.

## 7. Reproducible native-source check
Actual execution in JS tool sandbox: 75 literal anchors across seven pinned files; seven GitHub blob receipts exactly matched; 66/70 exact nonblank line membership comparison with latest observed clump (above). No numerical surrogate or synthetic cohomology operator used. Run this Python snippet against a git clone with both source commits available. It checks actual git object hashes and the same anchor groups; failure exits nonzero. The executable below is a local replay recipe; the equivalent source checks were executed through GitHub retrieval and JS, not by running Python or Lean.
```python
import subprocess as sp, sys
repo = sys.argv[1]
pin = "40e56bab026552e089d7afcfeff08d2defb9c005"
head = "27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59"
base = "src/Development/"
B = base + "WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/"
spec = [
(B+"CrystallineDeRham.lean","efc95dd74b086a96d3de1f13d40c04d4d4796931",["theorem exists_lev","⟨N + 1","theorem acyc_NT","exists_lift T.k T.T T.le","exists_coprod T.k","(hun a T.T hT (c a) a₀).exists","refine acyc_of_coprod","hun a (P b) (hl b)","(hun a T.T hT (c a) a₀).unique","exact hψ' (u χ)","theorem red_cover","theorem red_inf","theorem Red.pull1","theorem Red.pull2","h.cG_pull1","h.cG_pull2","Function.Bijective.of_comp_iff' d _","H1.mk_surjective","H2.mk_surjective","theorem crystallineDeRham"]),
(B+"TagIso.lean","8774201f72ff039500e42c2f034b30d82ae7d1f7",["theorem acyc_toSmall","let θ1 : 𝟭 _ ⟶ S1","let θ2 : S2 ⟶ S1","let θ3 : S2 ⟶","theorem tag_pull1","SmallDescent.pull1_bijective","private theorem pull2_restrict_isSmall_bijective_of_cover","apply Desc.pull2_bijective","SmallDescent.exists_isLoc","SmallDescent.exists_cover","theorem tag_pull2"]),
(B+"AcycOfCoprod.lean","6dd3e0d2c9681c3e31b7794c84b4e6e79854a341",["def Acyc","theorem cm_zigzag","theorem acyc_of_zigzag","Z1.id f d","sub_add_cancel","theorem acyc_of_coprod","(φ ≫ i b)","Zigzag.of_inv η","theorem qa1","theorem qa2"]),
(B+"CompF.lean","5ca821664575e0d175f7de49095efbb7ec7bc571",["def InN","def IsChart","Module.Flat R","structure Tag","structure Tag.Hom","theorem Tag.hom_ext","def Tag.forget"]),
(B+"IsNilpotentOfIsNilDP.lean","09934d09743cb9868157e06156c78e7e6fbf5fc8",["theorem fe_lift","theorem fe_uniq","theorem chart_cover","theorem chart_inf","theorem bas_inN","theorem exists_lift_of_coord","theorem exists_lift","theorem lift_ext","theorem exists_coprod","exists_adj S hS d n hn","let zV","apply lift_ext"]),
(B+"IsDPMorphismId.lean","0b205314bb9cd8cdc4b67f0797ac0a949960a647",["structure Red","theorem surjective","def Red.G","def Red.H","def Red.cG","def Red.cH","def Red.η","def Red.ε","theorem Red.cG_pull1","theorem Red.cG_pull2","Function.bijective_iff_has_inverse"]),
(base+"AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsCrystalPairing.lean","53aee5b7a7aaa544c0e22ff51f0a7d449b0a036f",["def CrystallineDeRham : Prop","QuasiCompact s","∀ m : IsMor","Function.Bijective m.pull1 ∧ Function.Bijective m.pull2"])]
def git(*a): return sp.check_output(["git","-C",repo,*a]).decode("utf-8")
count=0
for path,sha,anchors in spec:
    assert git("rev-parse",pin+":"+path).strip()==sha
    s=git("show",pin+":"+path)
    for a in anchors:
        assert a in s,(path,a)
        count+=1
assert count==75
p=spec[0][0]
assert git("rev-parse",head+":"+p).strip()=="16ae3e6fef93fe4c8dc5c4907ec31fc77a81d47c"
l=git("show",pin+":"+p).split("\n")
start=next(i for i,s in enumerate(l) if s.startswith("theorem exists_lev"))
end=next(i for i,s in enumerate(l) if s.startswith("end Fubini"))
selected=[s for s in l[start:end] if s.strip()]
current=set(git("show",head+":"+p).split("\n"))
assert (len(selected),sum(s in current for s in selected))==(70,66)
print({"blobs":len(spec),"anchors":count,"upstream_exact_line_membership":[66,70]})
```
RESULT: DONE local source-matched degree 1/2 reduction comparison, acyclicity assembly and external ledger delta; PARTIAL imported descent, level coproduct construction, root reachability and upstream wrapper migration. Native source anchors executed, not Lean kernel verification. No URT performance claim.
RESUME HERE: expand the actual exists_adj source B/ExistsAdj.lean, especially its level-n PD extension and universal property supplying L313–354, retaining InN, nilpotence and coordinate hypotheses; obtain authenticated cached Main-root role paths for crystallineDeRham and rigid_of_free_of_crystallineDeRham before assigning their coverage to RH. Trace rigid producer through exact imports rather than guessing. HANDOFF TO literature, dependencies, kernel, integration, acceleration, geometry, editor, audit.

<!-- END VERBATIM specialists/literature_provenance/RUN22_CRYSTALLINE_REDUCTION_TAG_ACYCLICITY.md -->

<!-- BEGIN VERBATIM specialists/on_acceleration/RUN22_RESUME.md 7fb4caa1e02b3bc7147afd962bb506774c5487ff -->
# RUN22 — authenticated cache-session and shared specialist lookup
2026-11-25. RESULT: DONE for native synthetic cache-session and batch resolution certificate; PARTIAL for full RH database replay and cross-worker transport. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, [Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean) reread; latest upstream observed fcb6eac7534875d32d68030967e2deae6d686151 dated 02:41:16Z, not adopted or asserted equivalent. Run21 c0de9f1c517e5725d1694a6581493ec4e20b6069. Read protocol, handoff, expansion, AGENTS, research state/log/protocol/continuity excerpts and all 14 latest peer commit metadata/visible RESUME notes (editor latest manuscript metadata only); CI #416 45540458272 PASS, physical/general checks only. External blueprint not reread. Native container has no GitHub DNS, no prior DB or manifest mounted; connector supports text but not binary artifact downloads. No new full-manifest execution or speedup claimed.

## Native result
Run `python run22_reuse.py --selftest 100000`. Native Python stdout: fixture 100000 rows, 14757888 bytes; 1590 request occurrences, 106 distinct keys, 40000 ambiguous candidate rows (two typed terminal queries). 70 full output comparisons against independent full table scan oracle, 5 negative controls rejected (bad digest, bad receipt, bool-as-ID, WAL sidecar, flipped DB byte). No supplied fixture rows lost; signed refs and raw-row digests preserved. Median of 7 repetitions per schedule, milliseconds:
| method | reopened + SHA | warm | SHA alone |
|---|---:|---:|---:|
| independent indexed |17.31352|6.65913|9.61380|
| single union full-table scan |132.80320|124.14235|10.65353|
| shared indexed |12.04299|1.61070|9.73510|
| golden |12.10574|1.70923|9.73778|
| periodic |12.50512|1.73904|9.81020|
Peak process RSS 142012 KiB including fixture and materialized oracle/ambiguity outputs. Warm shared vs independent 4.13x; reopened including authentication 1.44x. Reopened connection is not storage-cold. No golden-specific advantage. For this synthetic workload one SHA verification dominates warm shared cost, so authenticate once per trusted immutable session and batch across lanes; do not skip whole-file authentication across separate processes. Full RH SHA amortization not measured. Fixture repeats a 106-query batch 15 times deliberately; workload overlap determines gain. Not a claim about arbitrary proof search or mathematical translation speed.

## Real request plan (not executed against DB)
From [dependency peer pinned commit b7b220822e8c8a5aecc40f479429b34933a0e494](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b7b220822e8c8a5aecc40f479429b34933a0e494/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_post151_role_frontier.mjs), parsed const requests directly using V8: 300 distinct integer declaration IDs. This is a catalog from authenticated incoming-role paths, not outgoing proof expression results. coreAll_of_core ID 13175074 is in it; most new targets are not directly named in this limited list. No negative reachability conclusion. run22_requests.json includes all 300 IDs, 31 additional query occurrences from peer notes; partial names use terminal queries returning every candidate, not guessed namespace. Exact-name requests use explicitly tagged string segments; no flattening numeric or dotted components. Index assignments (zero based, half-open ranges): integration 300–301 (ex_all_of_good, exists_extension_rep_index_two_of_trace_invariant); prime 302–304 (AdmFam, AdmF, FamilyClosedForm); galois 305–309 (classes_finite, ccf_holds, specAlg, specOfF, finite_doubleCoset); theta 310–312 (stepA_Z, singToDiff, locTau); windows 313–314 (supported_group_and_prime_idempotents, published_hypotheses_from_patching_alt); literature 315–317 (existsUnique_isConn_of_lift, existsUnique_gaussManin, isBC_of_lift); geometry 318–320 (sjCore_holds, sj_holds, heightLowerBound_of_sj_of_sphereLogIntegrable); audit 321–324 (core_gm, sigA_le, ChainCoreH, ReadsKept). Last six: three explicit exact names, then TLiftK 13125905, published-hypotheses owner 13096310 and holLeadB 8996470. Module-prefix requests CMBasePatch, SatSysPatch, IndexTwoPatch, ReadL/MjHTie/IdxDefs need separately authenticated exact names; not inferred from prefixes. No new outgoing paths extracted; dependency/kernel lanes own that work.

## Reuse contract
Trusted prior Run21 full DB digests are compiled into code, alongside schema, source pin, manifest hash, count, and layout. Hash the entire file and verify receipt before opening a read-only immutable session; reject sidecars, check file stat before and after. This is designed for a cooperative cache with immutable storage, not a malicious same-UID or parent-directory writer. A new SQLite byte layout needs a new trusted receipt after full manifest verification, not a locally self-signed digest. Output provisional until process exits successfully; caller stages file before publishing. Shared request grouping is expected O(request bytes + Q), B-tree lookups O(U log N + returned rows and serialized occurrences), possible result ordering cost; golden/periodic add O(U log U). Full file authentication O(database bytes), no universal linear bound. Streaming batch emits candidate rows without retaining all results; groups require O(Q), oracle materializes output. Does not change import/static graph or elaborated proof-term edges. No premises removed.

Reproduce after retrieving the Run21 verified DB: `python run22_reuse.py --db append.sqlite --requests run22_requests.json > results.stage.jsonl` then only rename on success. Check every ID's unique status against the peer's exact names and kinds, inspect all terminal candidates, retain missing/ambiguous status. Do not interpret a missing manifest result as absence from all Lean sources.

RESUME HERE: acquire authenticated Run21 compact DB or rebuild from artifact 14931267327; execute the real request plan and independently compare all candidate rows to a single authenticated manifest scan, measure full SHA cost and matched cold/warm per worker versus shared union, then give exact identity/root records to integration and dependency/kernel lanes. No large Git blobs or new compute registry edits. HANDOFF TO integration, dependencies, kernel, theta, Galois, prime, character boxes, literature, geometry, audit. Full RH translation OPEN.

<!-- END VERBATIM specialists/on_acceleration/RUN22_RESUME.md -->

<!-- BEGIN VERBATIM specialists/positivity_geometry/RUN23_MULTIBLOCK_LOG_INTEGRABILITY.md 16dd1ddce843e6597d08510bb019fdc9744caf8c -->
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

<!-- END VERBATIM specialists/positivity_geometry/RUN23_MULTIBLOCK_LOG_INTEGRABILITY.md -->

<!-- BEGIN VERBATIM specialists/prime_window/RUN22_EXCEPTIONAL_PRIME_DEFICIT.md 8339aa2dc5e21003847bd85cacb647dcc2b30f28 -->
# RUN22 — exceptional-prime losses, exact fibre identity and PointsLemma assembly

2026-11-25. RESULT: SOURCE-MATCHED independent reconstruction of the pinned adm2/BTT/adm3 consumer; exact finite regression executed. The two weighted estimates remain hypotheses, not unconditional arithmetic results. The local dependency chain is authenticated by source text, not by a Main-root elaborated path. No kernel replay or URT speed claim.

## Provenance and continuity
P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (2026-11-25 04:16:12 UTC; merge PR 2057), previous observed fcb6eac7534875d32d68030967e2deae6d686151. All paths below relative to src/Formalism/SharpRestriction/GrowthBounds/ at P unless otherwise stated.
- SmallOrderPrimes.lean a35ad58d20f072b48cbb03f619f1bf0f1501e66f L32–45 WReq/PointsLemma, L85–103 primesResidueBelow/BTT/adm2/adm3, L107–114 ArchimedeanSignatureMatching, L241–277 admitted/family definitions.
- IsResidueClassZero.lean 9fbb7879d0519f9a136e190551422881ef5d2f0b L37 hG, L97–102 hP/class definitions, L141–184 Inst/stepP/reps/topsOn/Nv/topsPos/Good, L279–293 Cand/goodReps/Sig/VV, L348–351 ioP, L362–365 TTP.
- LogarithmicSums/DfcHigh.lean 3ae0d61345dc80d56ce8093ed9e3fb9637f6ae91 L14–34 dropI/WReq_iff/candidate membership/lp_nonneg, L38–90 Dfc/io_le, L92–173 not_singular_of_central/TTP_subset/sdiff_le, L175–178 dfc_le statement.
- LogarithmicSums/SecondConstantNonneg.lean 9a81c995f590ec0a1a7aa4c92729b804f38514dc L12–33 PrimeSumNumericFacts, L73–96 Sets/E1, L98–142 low_le.
- LogarithmicSums/PrimeSums.lean 71ac80d66bb05a93246e321f4258d81d7830b22f L11–68 sum_ite_mem_le, mem_prB, card_prB_le, sum_log_prB, sum_logdiv_prB.
- LogarithmicSums/LatticeChainSuccOfPartial.lean c48148c0af73a80a8647630b9bfc484594b3d641 L12–27 exponent lemmas, L29–116 sum_low, L118–173 sum_high, L175–187 inWin_of_box, L189–258 latticeChain_succ_of_partial.
- LogarithmicSums/RemainingCountingStatement.lean b9435d525f79b2af1a971259b99c155f7b90ce63 L31–40 FamilyFifthBound/RestT, L47–80 stmtEF_of/stmtF_of_stmtEF.
- src/Formalism/LocalRingCardinality/DataParams₂.lean 50914500995df91e2646d91a6c5c99a7e603a51b L9–17, L27–45 scale ranges and definitions.

Preflight: SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RUN21, correct research state/log/protocol/continuity locations and latest general CI #416 run 45540458272 (before this commit; not RH evidence), 30 latest branch commit subjects and peer handoff excerpts from all 14 other lanes (editor commit metadata only, not its full manuscript). Acceleration RUN22 explicitly has prime requests 302–304 for AdmFam/AdmF/FamilyClosedForm; dependencies 0412 reports 300 projections, but no prime root path reported in that summary. Do not duplicate extraction; request exact results. No duplicate of the following local translation observed in inspected notes. Not every peer artifact or the linked external blueprint reread. No physics changes.

## 1. What adm2 and adm3 actually assume
Fix native D,L,X,K, scale x>1, 0<e<1/52. Write U=L.sc.X', V=L.sc.X'' D.R.n, T=D.host.TT, N=|T|, q=x^(e/4), o(p)=addOrderOf(hP D p), w(p)=log(p)/p. Here class-zero means inertClass, not signal. Native X'_le_X'' yields U<=V (LatticeChain L196, n_pos D). Directly V=x*n*U by a/w'' with positive n.
Let
 A3={p prime, inert, p<V, o(p)<q};
 A4={p prime, InBand D K L.sc p, p< U via the band definition};
 PS={p prime, inert, p<U, q<=o(p)}.
All are finite, represented by natural ceiling range filters. Strict p<V in A3 must not be changed to <=V; at p>=U the omission is zero, so no endpoint gap. Order equality belongs to PS, not A3.
For t in T let r_p(t)=X.bs(stepP D p)t. Write B_p=#{t in T : not Good X p (r_p(t))}. Good is the specified IsGoodOrbit on topsPos with exact native orbit parameters, not an arbitrary prime property.
 BTT=sum_{p in PS} w(p) B_p.
 adm2: n*delta1/2<=N<=2*n*delta1 AND BTT<=N*x^(-2+e).
 adm3: sum_{p in A3}w(p)<=x^(-hG+e)=x^(-2-7e).
These are distinct weighted sparsity assumptions on the bad orbit mass and small-order primes. Neither follows merely from finite cardinality or from the adm5/Archimedean estimates. The local consumer LatticeChain L197 uses only the second conjunct of adm2. This is not permission to erase the first conjunct globally.

## 2. Exact fibre identity (strengthening of local inclusion)
By definition reps=image of r_p on the full finite HH D. Thus every r_p(t) is in reps, even without using bs_orb or bs_step. By definition goodReps={r in reps:Good X p r}. For every t in T:
 r_p(t) in goodReps iff Good X p r_p(t).
Taking complements within T proves exact finite-set equality
 T minus {t in T:r_p(t) in goodReps} = {t in T:not Good X p r_p(t)}.
Consequently B_p=sum_{r in reps, not Good X p r} Nv X p r, because fibres topsOn partition T. LatticeChain L214–222 proves the weaker inclusion and card bound hbad. A bad orbit with many tops is weighted by its number of tops, not counted once.

## 3. Construct all nine fields of Sets
Use A3,A4,PS,B_p above. hA3: p<U<=V implies p<V. hA4: from prime and band membership and p<U; hPS: Cand includes all PS membership conditions; hPSsub: PS subset prB U; hbad: §2; hbad0: B_p>=0. s3=adm3; s4=last conjunct of ArchimedeanSignatureMatching; s2=second conjunct of adm2. This is the actual construction at LatticeChain L201–226, including the strict bounds. No new choice of constants or primes.

## 4. Pointwise omission estimate sdiff_le
Fix a,b and assume Sig>=0 on Cand. Let z_p=|T minus TTP|, d_p=1 if Sig>x^(-e), else 0; write W_p=1_Cand*w(p)*(2*d_p+4*Sig). Since w>=0, all RHS terms below are nonnegative. For prime inert p:
 w(p)*z_p <= N*1_A3*w(p)+N*1_A4*w(p)+1_PS*w(p)*B_p+N*W_p.
Proof by the source's cases (DfcHigh L138–173):
- If p>=U, TTP=T by definition, z_p=0. (Signal is excluded by distinct class constructors.)
- If p<U and o(p)<q, p belongs to A3; z_p<=N.
- If p<U, o(p)>=q and p>=p0 and InBand, p belongs to A4; z_p<=N.
- Otherwise p<U and o(p)>=q with the band exclusion, hence Cand and PS. If Sig<=x^(-e), VV=goodReps and z_p=B_p by §2. Otherwise d_p=1; 2+4*Sig>=1, so the fourth term dominates w(p)*N.
Equality at the Sig threshold is the served case, not dropped. A3 and A4 need not be disjoint; this is a nonnegative majorant, not a partition of prime sets.
Summing over any finite S of inert primes and using the three Sets bounds and WReq gives the independent corollary:
 sum_{p in S} w(p) z_p <= N*(x^(-2-7e)+x^-1+x^(-2+e)+x^-9).
This corollary is conditional, and does not establish adm2/adm3 themselves.

## 5. How the exceptional estimates enter the exact deficit budget
Keep ALL source hypotheses of latticeChain_succ_of_partial: K.Nonneg, P:ParameterChoice' D L, C>=0, bo>=0, GainBoundAll X K C bo, Sig>=0 for every a,b and candidate p, adm2, adm3, ArchimedeanSignatureMatching, PrimeSumNumericFacts D L K C bo. For every a,b in their specified boxes with WReq, inWin_of_box supplies InWin and GainBoundAll specializes to GainBoundAt.
Dfc=sum_{j,s in T}askG - (sum_j gainP - tauP - ioP). The local dfc_le (statement L175–178) bounds Dfc by 3*m*a*z_p/p + m*N*lo + m*fl + ioP; uses p prime inert, p<=V, InWin, GainBoundAt and lo>=0. Keep the native lo_bounds/fl_bounds and io_le suppliers; no claim of independent reconstruction of their full internal proofs in this run. Multiplying by log p>=0 and taking max with zero is safe because the majorant in low_le is nonnegative, by all the sign premises. This is low_le's eight-term E1 with the omission inequality and the extra io allowance (3+1=4 coefficient for W_p).

Let M=m*N*a/x>=0. For arbitrary finite S of inert primes split into p<=V and p>V (inclusive boundary in low branch). For low branch the eight sums b1–b8 are dominated, respectively, by:
  V+2; log(4)*p0; log(4)*U; log(U)*(1+log(U)); 1/(120*x); 1/x; N/(120*x); 1/(120*x).
Explanation:
- Finite subset monotonicity of nonnegative terms (PrimeSums L11–16). #prB(y)<=ceil(y)<=y+1; p<=V implies p<V+1.
- The two log sums use the imported Mathlib Chebyshev.theta_le_log4_mul_x (not a new proof of Chebyshev here); native prB(y) subset of primes <=floor(y).
- For y>=1, log p<=log y and sum_{p<y}1/p <=sum_{k=1}^{floor y}1/k <=1+integral_1^{floor y}dt/t <=1+log y, by monotonicity of 1/t on each [k-1,k], k>=2. This gives the fourth bound, including y=1.
- A3 exponent -2-7e<=-2; x>=120 gives x^-2<=1/(120x). A4 bound is the original x^-1. PS uses N.n7, which is exactly x^(-2+e)<=1/(120x), equivalent for x>1 to x^(1-e)>=120, eventually uniform at fixed e<1. WReq exponent -9<=-2 likewise.
Now multiply by the nonnegative E1 coefficients, using every numerical field N.n1,n1',n2,n3,n4,n5,n7 and N.one_le_card_tops in the low branch:
 q1=M/20 (both n1/n1' and N>=1);
 q2=M/40; q3=3M/2; q4=M/40;
 q5=M/40; q6=3M; q7=M/40; q8=M/30.
Their exact sum is (281/60)M <=(47/10)M. Source sum_low uses the latter bound. For high branch retain N.n9 and dfc_high; sum_high uses the integer interval (floor V,ceil(V*(1+thS))] and its cardinal <=V*thS+2. Points outside the strict upper support contribute zero; log p<=log(2V) on support under native thS bounds. This gives M/40. Hence the displayed q bounds in the pinned argument actually yield (113/24)M<=5M, slightly sharper than the original 5M target (the native proof first rounds low to 47/10). This improvement is merely constant bookkeeping, not a change to any required hypothesis.
Second PointsLemma conjunct: io_le and sum_ite_mem_le with nonnegative W_p and WReq give sum_{p in S}log(p)*ioP<=m*N*a*x^-9 for every finite prime S. All weight vectors are quantified BEFORE S, but WReq is assumed for each chosen pair; no existence of a,b inferred.
Native exact downstream: latticeChain_succ_of_partial concludes PointsLemma; FamilyFifthBound is a predicate requiring eventual GainBoundAll -> PointsLemma; stmtEF_of consumes it alongside FamilyAskBounds, RemainingCountingStatement, FamilyFourthBound, RestW, RestT to produce FamilyClosedForm. The local theorem is not itself a proof of FamilyFifthBound without its uniform suppliers. No authenticated root path from Main.riemannHypothesis to these declarations or actual family constructor obtained.

## 6. Upstream changes
H SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7 (same as RUN21 head's file): L233–239 drops adm2/adm3 and PointsLemma/WeightVectorExists/WeightedPrimeSumBound from its local admitted/Conclusion₂ predicates. H pinned paths for LatticeChainSuccOfPartial.lean and RemainingCountingStatement.lean return 404, and H LogarithmicSums directory has seven files instead of the 21 in P. This is positive evidence of restructuring/removal at these paths, not proof of elimination everywhere or equality of whole proof obligations. Keep P obligations and source hashes, do not silently substitute H. Exact source role paths requested via acceleration request indices 302–304; no claim of root reachability or absence.

## 7. Exact finite regression (executed V8; copy to Node)
The finite tests abstract Good, orbit map, candidate/prime flags and nonnegative log weights. These are structural regressions, NOT native D7 or an arithmetic/Lean proof. The derivation above supplies the general argument.
```js
const counts={fibres:0,pointwise:0,weighted:0,thresholds:0,budget:0,negative:0};
const ck=(v,k)=>{if(!v)throw Error(k);counts[k]++};
for(let a=0;a<3;a++)for(let b=0;b<3;b++)for(let c=0;c<3;c++){
 const bs=[a,b,c],reps=new Set(bs);
 for(let T=0;T<8;T++)for(let G=0;G<8;G++){
  const tops=[0,1,2].filter(t=>T>>t&1), good=r=>!!(G>>r&1);
  const goodReps=new Set([...reps].filter(good));
  const bad=tops.filter(t=>!good(bs[t])).length;
  ck(bad===tops.filter(t=>!goodReps.has(bs[t])).length,"fibres");
  ck(bad===[...reps].filter(r=>!good(r)).reduce((s,r)=>s+tops.filter(t=>bs[t]===r).length,0),"fibres");
 }
}
for(const X of [3,5,7,11])for(const XX of [X,X+4,X+12])for(const p0 of [2,5,9])for(const p of [2,3,5,7,11,13])for(const ord of [0,1,2,3,4])for(const cut of [1,2,3])for(const inBand of [false,true])for(const sig of [0n,1n,2n,3n,4n,8n])for(const N of [0n,1n,3n])for(let bad=0n;bad<=N;bad++){
 if(inBand&&!(p0<=p&&p<X))continue;
 const A3=p<XX&&ord<cut,A4=inBand,PS=p<X&&ord>=cut,Cand=PS&&!inBand,drop=Cand&&sig>2n;
 const missed=p>=X?0n:Cand&&!drop?bad:N;
 const rhs=(A3?N:0n)+(A4?N:0n)+(PS?bad:0n)+(Cand?((drop?2n:0n)+sig)*N:0n);
 ck(missed<=rhs,"pointwise");
}
for(let mask=0;mask<32;mask++)for(let s=0;s<32;s++)for(const N of [0n,1n,3n,10n]){
 const w=[30n,20n,12n,8n,6n],bad=w.map((_,i)=>BigInt(i)%(N+1n));
 const S=w.reduce((a,v,i)=>a+((mask>>i&1)&&(s>>i&1)?v*bad[i]:0n),0n);
 const F=w.reduce((a,v,i)=>a+((mask>>i&1)?v*bad[i]:0n),0n);
 ck(S<=F&&F<=N*w.reduce((a,v,i)=>a+((mask>>i&1)?v:0n),0n),"weighted");
}
for(const d of [53n,60n,104n,200n])for(const m of [1n,2n,3n])if(52n*m<d)for(const b of [2n,3n,5n]){
 const x=b**d,xe=b**m;
 ck(120n<=x&&120n*xe<=x,"thresholds");
 ck(120n<=x*xe**7n,"thresholds");
 ck(120n<=x**8n,"thresholds");
}
const q=[6n,3n,180n,3n,3n,360n,3n,4n],total=q.reduce((a,b)=>a+b,0n);
ck(total===562n&&total<=564n,"budget");
ck(total+3n===565n&&total+3n<=600n,"budget");
ck(3n>1n,"negative");ck(1n>0n,"negative");ck(1n>0n,"negative");ck(!(5<5)&&5<=5,"negative");
console.log(counts);
// Actual adversarial omission witnesses (separate executed check):
function missedAndTerms(p,X,XX,p0,ord,cut,band,sig,N,bad){
 const A3=p<XX&&ord<cut,A4=band,PS=p<X&&ord>=cut,Cand=PS&&!(p0<=p&&band),drop=Cand&&sig>2n;
 return [p>=X?0n:Cand&&!drop?bad:N,[A3?N:0n,A4?N:0n,PS?bad:0n,Cand?((drop?2n:0n)+sig)*N:0n]];
}
const cases=[[2,5,10,4,1,2,false,0n,3n,0n,0],[2,5,10,4,2,2,false,0n,3n,2n,2],[3,5,10,2,2,2,true,0n,3n,0n,1],[2,5,10,4,2,2,false,3n,3n,0n,3]];
for(const c of cases){let [m,t]=missedAndTerms(...c.slice(0,10));let j=c[10];if(m<=t.reduce((a,v,i)=>a+(i===j?0n:v),0n))throw Error("omission control failed")}
const tops=[0,1,2],bs=[0,0,0],good=new Set();
if(!(tops.filter(t=>!good.has(bs[t])).length>new Set(bs.filter(r=>!good.has(r))).size))throw Error("orbit multiplicity");
let [m]=missedAndTerms(5,5,8,2,1,2,false,0n,3n,0n);if(m!==0n)throw Error("boundary");
console.log({negative_omission:cases.length,negative_orbit_multiplicity:1,boundary:1});
```
Actual execution: {"fibres":3456,"pointwise":160650,"weighted":4096,"thresholds":54,"budget":2,"negative":4}. The four elementary negative assertions alone are not substantive; independent omission witnesses returned {"negative_omission":4,"negative_orbit_multiplicity":1,"boundary":1}. Total 168258 positive regression assertions plus 10 controls. Integer stand-in weights and abstract classification only; no Lean or CI run of this artifact.

## RESUME HERE
Request independent audit of the exact fibre identity, case guards, E1 budget and source-removal distinction. Ask acceleration/dependency/kernel for real results of request 302–304 and exact P Main-root roles for AdmFam/AdmF/FamilyClosedForm and latticeChain_succ_of_partial; avoid duplicate raw scans. Next reconstruct dfc_le and its imported askG cap plus low/high numerical error suppliers, or switch to the authenticated reachable prime-window branch if this legacy path is not on the root; do not assume nonreachability from a missing projection. Preserve adm2/adm3 as unproved arithmetic inputs at P, irrespective of upstream changes. HANDOFF TO audit, dependencies, kernel, acceleration, integration, editor, prime_window. Full RH reconstruction OPEN.

<!-- END VERBATIM specialists/prime_window/RUN22_EXCEPTIONAL_PRIME_DEFICIT.md -->

<!-- BEGIN VERBATIM specialists/theta_lifts/RUN22_COMPACT_POSITIVITY_DUAL_MINOR.md 868bce3d8075d8cfb963a4b8dd89f28c48fdcb0c -->
# RUN22 — Compact positivity and dual-minor differentiation (Step G)
2026-11-25. RESULT: DONE local SOURCE-MATCHED reconstruction of LVs.pos_int and LVs.dpDual, with explicit final contradiction of the conditional vacuum_nonvanishing_of_facts proof. Full RH root linkage and imported obligations OPEN. Source leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005; observed H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (merge PR #2057, batch 13). Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/protocol/log/continuity excerpts, CI #417 (04:19:58 UTC, physical checks only), RUN21, 30 recent commit IDs, 16 recent peer commit patches/handoff excerpts. No competing Step G task observed. Blueprint not reopened; some peer notes only inspected through patches. Kernel RUN22 TLiftK parent application job status and output both returned 404 at the time of reading; absence is not nonreachability. No physical queue edits.

Paths below relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/. A=AnalyticDeterminants/, C=CayleyCosetSums/. All citations to P unless explicitly H. These are exact source-level calls, not an elaborated DAG.

## 1. Actual positivity supplier, with every hypothesis
A/ScalarSectionCompactBlockInvariant.lean:227–249, PositivityTheory.Rg.Sw.LVs.pos_int:
For n,j natural (no j≤n or strict inequality needed here), Kg a group with topology, IsTopologicalGroup, CompactSpace, measurable space and BorelSpace, Haar measure μ (IsHaarMeasure), continuous monoid homomorphism ι:Kg→*M2(n), and hK: ∀g, InK(g) iff ∃k,ι(k)=g, define
    W(k)=u2(ι(k))^{-1}u1(ι(k)),
    A={i∈Fin n : i<j}, B=Fin n\\A,
    f(k)=|det W(k)[A,A]|² |det W(k)[B,B]|².
Then ∫_Kg f dμ>0. Empty determinant is 1, including n=0, j=0 and j≥n. No normalized Haar measure assumption.

The underlying group nonsingularity is proved in A/SecondCayleyBlockMulConjTransposeEq:17–106. With lower blocks C,D of g, g†Jg=J and J²=−I imply g invertible and gJg†=J, hence CD†=DC†. For u1=iC+D, u2=−iC+D the mixed terms cancel and u2 u2†=CC†+DD†. This is the lower principal submatrix of positive definite gg†, so positive definite and has nonzero determinant. Thus det u2≠0. hK gives InG(ι(k)) for every k; the inverse is continuous via adjugate/determinant (A/ScalarSectionCompactBlockInvariant:60–80). Principal submatrix restriction and determinant are continuous (:82–83). Norm, square and product give continuous f≥0. Its topological support is closed in compact Kg, hence compact. The monoid homomorphism sends 1 to I; wM_one (:222–225) gives W(1)=I; restricting I to any subset gives identity (including empty subset), so f(1)=1. The exact last call is Continuous.integral_pos_of_hasCompactSupport_nonneg_nonzero (with x:=1). In ordinary mathematics continuity gives an open neighborhood of 1 with f>1/2; nonempty open sets have strictly positive Haar measure, so ∫f>0. Finiteness follows from compactness, continuity and Haar local finiteness. No assumption that every minor is nonzero, and no division by either minor. Mathlib's imported integral positivity theorem remains an external dependency, not independently kernel checked here.

## 2. Exact dual derivative supplier, conditional on Cayley and UAct
A/SingToDiffAlt:58–63 defines DpDual, supplied by A/DpDual:377–457 as dpDual (hC:Cayley) (hU:UAct). Quantifiers: all n,j∈N with j≤n; all p,q∈Z; all x∈M2(n) with InG x. The differential detD is the signed permutation sum of order-cardinality complex Fréchet derivatives at zero (A/SingToDiffAlt:37–40). Write W=wM(x), α=p−n, β=q−n, and Q=emb_B(S), R=emb_A(T). The conclusion is
    detD_T detD_S fV(p,q,x mX(I,Q,R,I))
    = (∏_{i=0}^{j−1}(α+i))(∏_{i=0}^{n−j−1}(β+i))
      fV(p,q,x) minor_A(W^{-1}) minor_B(W).
Notice reversed order of Q,R relative to DjSec; swapping these changes the minors. Empty products retained.

Proof: complementary supports imply QR=RQ=0 (:119–140). This allows the inverse of the block unipotent [I Q; R I] to be [I −Q; −R I]; conjugate by Cm to get the mX inverse. The native inverse-first-block identity (:334–356) is ub1(x mX)=u1(x)†+Q u2(x)†, obtained by multiplying the block rows [I,iI] and the explicit inverse of x from InG. At Q=R=0 it gives ub1(x)=u1(x)†. Since u1 u1†=u2 u2† and both blocks nonsingular (actual det_u_ne :204–246), W u1†=u2†. UAct gives
    u1(x mX)=u1(x)(I+W^{-1}R),
    u2(x mX)=u2(x)(I+WQ),
    ub1(x mX)=(I+QW)ub1(x).
Consequently the native fV formula (A/SingToDiffAlt:25) and Sylvester determinant identity give
    fV(p,q,x mX)=fV(p,q,x) det(I+W^{-1}R)^α det(I+WQ)^β.
IMPORTANT: the source key (:394–417) assumes det(I+WQ)≠0 for combining integer powers q and −n; do not remove that guard or assert global factorization across zeros. For each fixed T, det(I+WQ) is continuous in S and equals 1 at zero, so the equality holds eventually near S=0. detD_congr (:19–21) makes this sufficient for the inner derivative. No outer nonzero determinant condition is required for arbitrary T in this inner step, and for the final T derivative the relevant determinant equals 1 at zero. All integer powers are smooth near the evaluation point (:46–53).

For any subset s with coordinate injection E_s and projection E_s^t, emb_s(U)=E_s U E_s^t. Two applications of det(I+AB)=det(I+BA) give det(I+M emb_s(U))=det(I+M[s,s]U), including empty s (:97–117). Apply hC (Cayley, A/SingToDiffAlt:42–45) first to W[B,B] with exponent β and then W^{-1}[A,A] with exponent α. Smoothness permits constant factors to pass through detD (:23–32). The cardinalities of A,B are j,n−j (:364–375), giving the displayed formula. Actual source uses hC and hU; do not count their suppliers as independently reconstructed in this run.

## 3. Assemble Step G and remove a superfluous factorial product in the reading view
C/VacuumNonvanishingOfFacts:19 assumes FdProps, DjFd, KSplit, SphU, FzHol and concludes Crux0 via contradiction. Its strict m<n gives j=n−m≥1. Step E3 (:222–227) yields a zero integral of hF times the nested detD of fV. Step G (:240–272) invokes dpDual cayley uAct at p=m,q=0, plus wM_mem_unitary, minorOn_inv_of_unitary, scalar_section_mul_conjugate_section (A/ScalarSectionCompactBlockInvariant:159–183). On InK, both Cayley blocks are unitary, so W is unitary; W^{-1}=W† implies minor_s(W^{-1})=conj(minor_s(W)), not reciprocal of minor_s(W). The compact scalar identity f0(m,0,k) fV(m,0,k)=1 cancels the section weights, using ub1=u1† and unit modulus determinants. Thus integrand equals C_nm f(k), where
    C_nm=∏_{i=0}^{n−m−1}(m−n+i) ∏_{i=0}^{m−1}(−n+i)
        =(−1)^{n−m}(n−m)! · (−1)^m n!/(n−m)!
        =(−1)^n n! ≠0.
This elementary simplification of the actual source coefficient is exact, not a new RH theorem. It preserves m=0. Step G divides only by this nonzero coefficient. It gives ∫f=0 after converting the real integral to complex (:273–275), contradicting pos_int. This completes the last local implication E3→G→contradiction; Steps B–F and the five explicit suppliers are not all reconstructed. Note the contrast with RUN19's *different* coefficient p'(0)=(−1)^{m+1}(n−m−1)!m!; they must not be conflated.

The consumer C/Crux:11 invokes eRed (vacuum_nonvanishing_of_facts fdProps djFd kSplit sphU fzHol). A/TwoSided:16 also calls dpDual cayley uAct in lv_of. These are source call sites; no claim that either is an authenticated Main-root value edge. Standard mathematical ingredients here are Haar positivity, determinant compression and Cayley differentiation; specific published provenance not established, no new axiom or placeholder supplied, no transitive sorry audit.

## 4. Provenance and actual checks
Connector read verified 12/12 GitHub blob IDs and 59/59 literal line anchors, zero mismatches. H retains pos_int at A/ScalarSectionCompactBlockInvariant:277 and dpDual at A/DpDual:433, with C/Crux:940,1173,1194,1211 holding the consolidated consumer; old C/VacuumNonvanishingOfFacts path 404. H A/TwoSided:60 retains the call. Relocation only, no semantic equivalence or repinning claimed. Blob manifest:
```
P A/ScalarSectionCompactBlockInvariant b5c95f21c339895f02322e171ee375ca2373f560
P A/SingToDiffAlt ce0e07c6678297a655e2b9e03de36c3a62e69010
P A/SecondCayleyBlockMulConjTransposeEq 7936215a94b090419b82ae697c992322743e743f
P A/DpDual 300d80f3189620659a55babf6a0d2e34752b6e30
P C/VacuumNonvanishingOfFacts 59b9d0e0060f8ea3e9387803aef00f5bae6d5eef
P C/Crux 1971ec2b5015abe0a1137f83eb23e5bdae2d0817
P A/TwoSided eb9419ee5c118769aad7b050ca180f9ca69dd47a
H A/ScalarSectionCompactBlockInvariant 456dbb3bf00d052686cba4cedc95db8b7aff3216
H A/DpDual ab75e764af720e1d46c08ca3a32fbcc3a8d45fae
H C/Crux 7ee5755446d0b5dc5e24987162d591acdc8415f0
H A/SecondCayleyBlockMulConjTransposeEq 362e00dc7c351ff1ae8a693dc2b960d9f0d431f0
H A/TwoSided 809dc4a4f2a7c1e6b386e3c0cde0dc459f0df14e
```
Reproduce source blobs in upstream clone with git rev-parse REV:FULL_PATH. Independently executed below Python exact algebra check in local container (exit 0). These are bounded regressions of determinant compression, the Step G coefficient and real rational subset of unitary minor identity, not the analytic proof or Lean replay.
```python
from itertools import product, permutations
from fractions import Fraction as F
from math import prod, factorial
def det(M):
    n=len(M)
    return sum((-1)**sum(p[i]>p[j] for i in range(n) for j in range(i+1,n))*prod(M[i][p[i]] for i in range(n)) for p in permutations(range(n)))
def minor(M,s): return [[M[i][j] for j in s] for i in s]
def trans(M): return list(map(list,zip(*M)))
compression=0
for vals in product((-1,0,1),repeat=4):
    M=[vals[:2],vals[2:]]
    for j in range(3):
        for s in (range(j),range(j,2)):
            s=list(s)
            for flat in product((-1,0,1),repeat=len(s)**2):
                T=[flat[i*len(s):(i+1)*len(s)] for i in range(len(s))]
                full=[[int(a==b)+sum(M[a][k]*T[i][s.index(b)] for i,k in enumerate(s)) if b in s else int(a==b) for b in range(2)] for a in range(2)]
                reduced=[[int(a==b)+sum(M[s[a]][s[k]]*T[k][b] for k in range(len(s))) for b in range(len(s))] for a in range(len(s))]
                assert det(full)==det(reduced)
                compression+=1
weights=0
for n in range(1,65):
    for m in range(n):
        j=n-m
        c=prod(m-n+i for i in range(j))*prod(-n+i for i in range(m))
        assert c==(-1)**n*factorial(n)!=0
        weights+=1
W=[[F(3,5),F(4,5),0],[-F(4,5),F(3,5),0],[0,0,1]]
unitary=0
for p in permutations(range(3)):
    for signs in product((-1,1),repeat=3):
        U=[[signs[a]*W[p[a]][b] for b in range(3)] for a in range(3)]
        V=trans(U)
        assert all(sum(U[a][k]*V[k][b] for k in range(3))==int(a==b) for a in range(3) for b in range(3))
        for j in range(4):
            a=range(j); b=range(j,3)
            lhs=det(minor(U,a))*det(minor(V,b))*det(minor(V,a))*det(minor(U,b))
            rhs=det(minor(U,a))**2*det(minor(U,b))**2
            assert lhs==rhs and rhs>=0
            unitary+=1
print(f'compression={compression}; coefficient={weights}; rational orthogonal minor products={unitary}')
```
Actual stdout: compression=13770; coefficient=2080; rational orthogonal minor products=192. No failed cases. No additional assumptions imposed on the source theorems. No Lean kernel run, CI validation of this artifact, full proof completion or URT speedup claimed.

## RESUME HERE
Expand C/StepD:46–80 stepC, especially actual djFd supplier (spectral derivative through nested determinant differential) and sphU supplier; then stepD:16–44 holomorphic vanishing on GSet via holZero. Keep topComp, Step E–F, FdProps, KSplit, FzHol, Cayley, UAct, Gaussian base/GI.integP and CR.crLem_of/KSing.lamSing_of outstanding. Request cached authenticated outgoing/incoming role path for pos_int and dpDual relative to vacuum_nonvanishing_of_facts, holLeadB manifest 8996470, and inspect kernel RUN22 TLiftK parent output when available. Do not duplicate raw scans. HANDOFF TO theta, dependencies, kernel, acceleration, integration, editor, audit. Full RH OPEN.

<!-- END VERBATIM specialists/theta_lifts/RUN22_COMPACT_POSITIVITY_DUAL_MINOR.md -->
