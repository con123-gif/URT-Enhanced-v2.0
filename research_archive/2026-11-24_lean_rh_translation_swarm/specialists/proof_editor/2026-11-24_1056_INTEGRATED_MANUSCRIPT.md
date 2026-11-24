# Human-readable RH reconstruction — fourth edition, 24 November 2026, 10:56 UTC

**INCOMPLETE.** Original pin `40e56bab026552e089d7afcfeff08d2defb9c005`. Current upstream main observed `cb4dc6e23a6187db392c96664295415c55b6b01e`. Main.lean at this newer revision (blob 67c65badc15f80a1db65df1c84dc7a4928fc410f) now invokes `Claim.zeta LFunction_ne_zero_of_half_lt_re`, with the latter supplied by `UpperTheory.FinalTheorems.everyCharacter`; the pinned Main (dbd5db70bc11b35f18fa5751216ab335321e7bfc) instead invokes `rhOfAll`. Do not mix their dependency chains or assert revision equivalence.

## New mathematical proof — block 21, a single common host-prime window

SOURCE-MATCHED conditional human derivation of GlobalTheory.EX.szRow_typePrimes and its GlobalTheory.T.sizes_exists_Y_bounds_host_g_mem_Icc_Y_two_mul_Y wrapper; resolves the editor's previous RESUME HERE. This is the actual last numerical block of explicitConstants_parameterConditions_large, not a proof of native host existence.

Fix 0<eps<1/52, C:FC satisfying Std C. For every cD>=0, ch>=0, and sufficiently large x, fix the SAME D:D7, L:SizeData₂ D with scale epsilon eps and Val C cD ch L. Write u=log x>0, s=x^eps, b=exp(s), k=D.R.k, M=D.R.N D.R.m, Q=condE D=H.QS*H.q*H.d as a positive integer, H=D.host. Std fixes C.P.CYL=9 and C.P.Cpde>=1. RankVal gives k>=1, and rank_basic_bounds eventually gives k<=r<=x^5 and M<=x^402. HostVal contains PairWin(scl,Y0) and PairRow(Y0,eps,H) for a separate auxiliary Y0; it also contains directly, for every i,
 (kb)^8 <= H.g(i) <= 2(kb)^8.
Do not confuse Y0 with the desired common window Y.

The hostBounds theorem gives log Q<=2*x^(eps/5)*u². In fact its relevant input is exactly the last PairRow conjunct log Q<=2*Y0^(eps/5)*(log Y0)^2; since 1<Y0<=x and eps>0, monotonicity of positive real powers, logarithm and square gives the stated upper bound. Q>=1 implies log Q>=0. Retain all other HostVal and RankVal fields because the source theorem consumes them.

Choose x large enough to meet the two native rank/host thresholds and two elementary growth inequalities
 1608*u <= s,
 2*abs(C.P.CY)*x^(eps/5)*u² <= s.
For an explicit alternative to the source's little-o thresholds put a=4eps/5>0. Require u>=max(3216/eps²,12*abs(C.P.CY)/a³,1). Then exp(eps*u)>=eps²*u²/2>=1608*u, and exp(a*u)>=a³*u³/6>=2*abs(C.P.CY)*u². These follow from nonnegative terms of the exponential series. Multiplying the latter by x^(eps/5)>0 gives the second inequality. This is a valid sufficient alternative witness, not the original exact Lean threshold.

First, M^4<=x^1608=exp(1608u)<=b, since M>=0. Second, Q^CY=exp(CY log Q)<=exp(abs(CY)*log Q)<=exp(2abs(CY)*x^(eps/5)*u²)<=b; negative CY is allowed by this inequality, even though Std imposes additional constraints. Thus M^4 Q^CY<=b²<=(kb)². Set Y=(kb)^8>0. The exact real-power identity Y^(1/4)=(kb)^2 holds by positivity of kb. Therefore:
 (kb)^8 <= Y,
 M^4 Q^CY <= Y^(1/4).
Third, log Y=8(log k+s)<=8(5u+s)<=9s=C.P.CYL*s, because 40u<=1608u<=s. Finally the same chosen Y satisfies Y<=H.g(i)<=2Y for every i by the HostVal projection already present. The proof neither chooses new primes nor constructs the host. Empty index sets are vacuous; no division by a potentially zero M is used. This gives exactly the four conjunctions of szRow_typePrimes, with c1=c2=0 and common threshold chosen as the maximum, as in the source. In the enclosing 21-block theorem the resulting witness is assigned to g_Y; HostArith still separately supplies g_norm, g_mod, pde_split, level_split.

### Immutable upstream source ledger
All following paths relative to `src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/` at original pin unless otherwise specified. Files read directly this run.
- SzRowTypePrimesStatement.lean — afeaf10017903ed51d492b9d42c6d2c3014d1efe: exact wrapper.
- SzRowTypePrimes.lean — f45398e4d2867fa8897c262033c16192de42074f: exact main proof, witness, four thresholds.
- HostBoundsTwoMulRpowLogSqLe.lean — 510fc1b8bad0ce27e6d2665c1f00e389d7d9d266: hostBounds.
- ExplicitRanksBasicBoundsLargeScaleStatement.lean — 06f43bd62169da68ca742524f7b57dcb6ca87454.
- ExplicitRanksBasicBoundsLargeScale.lean — 12f00bc43910359ad90686646fb70f239deed09e.
- ConstMulRpowMulLogPowLeRpow.lean — d0643a4d33f16b2dd47227ed36fe73a8543d1b13.
- ExplicitConstantsParameterConditionsLarge.lean — 8bb3bd4a9a5343eaeaef138a1dccf57016010f0a.
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean — 688162690ac7cbfe620037fcee8e451e7116f45b: Std, PairWin, PairRow, HostVal, RankVal, SzRow.
- src/Formalism/SharpRestriction/InertJacobiLevels/AsmIface.lean — 1c01d77eca74ee32a49d3ec089b799c87c0d2c25.
- SzRowAndImp.lean — ca633b5e23f18e773bffbad6293cda846711bea7.

### Reproducible exact tests executed this run
V8 BigInt: {"threshold":120,"budget":1845,"product":5824,"negative":3}. These are exact regressions of the cleared-denominator Taylor sufficient bounds (eps=1/n), the additive log budget, and the positive product budget, NOT numerical simulations of native primes or a Lean replay. Replay:
~~~js
const count={threshold:0,budget:0,product:0,negative:0};
const ck=p=>{if(!p)throw Error("regression")},ceil=(a,b)=>(a+b-1n)/b;
for(const n of [53n,60n,100n,257n,1000n])for(const C of [-40n,-1n,0n,1n,3n,40n]){
 const a=C<0n?-C:C,u0=3216n*n*n,u1=ceil(1500n*a*n**3n,64n),u=u0>u1?u0:u1;
 for(const d of [0n,1n,10n,100000n]){const v=u+d;ck(v*v>=3216n*v*n*n);ck(64n*v**3n>=1500n*a*n**3n*v*v);count.threshold++;}
}
for(let u=1n;u<=15n;u++)for(const L of [1608n*u,1608n*u+1n,2000n*u])for(let logK=0n;logK<=5n*u;logK++){ck(8n*(L+logK)<=9n*L);count.budget++;}
for(let q=1n;q<=12n;q++)for(let k=1n;k<=8n;k++)for(let n4=0n;n4<=q;n4++)for(let c=1n;c<=q;c++){const Y=(k*q)**8n;ck(n4*c<=q*q&&(n4*c)**4n<=Y);count.product++;}
ck(8n*(1n+5n)>9n);count.negative++;ck(2n*2n>1n);count.negative++;ck(3n**4n>2n**4n);count.negative++;console.log(count);
~~~
The negative controls illustrate failure of the conclusion without log-budget, product-budget, or host-window restrictions. No full RH percentage, kernel verification, or URT speedup follows.

## Updated coherent reading order and joins

1. Local arithmetic -> native Galois rows -> RecTExists/VWin. The rank-one Weil–Deligne chapter explains normalization and removal of correction character; the tame local parameter uniqueness chapter explains cyclic orbit trace/determinant; the host supply chapter aligns the 401-to-400 cutoff with actual rank. Their upstream ExField, GoodMap, PairEx, native arithmetic existence and local/global producers remain obligations.
2. VWin -> admissible host -> same-row geometry. Keep the same host across predicates; prior manuscript's 26 row fields and nine predicates remain. The divisor-row theta factorisation chapter derives a conditional projection through the orthogonal kernel; it does not by itself prove span equality or the native rank producer. The height-recursion chapter tracks the finite/archimedean correction with the original signs and the conditional Chow-height equality. Noetherian descent preserves the morphism and admissibility guard, but not a substitute for the square-zero base producer.
3. Seven theta/literature inputs -> HypsAlt -> definite row. Base-scalar orthogonality gives proportionality with a nonzero base witness; the doubling-integral coefficient-transfer producer remains. Do not conflate `everyE2` with `HypsAlt`.
4. Same host -> explicit size and interpolation bounds. Prior local signature-gap and rbS derivations are retained; the new block 21 supplies Y without changing D,L. ParameterChoice' still uses the 21 producer blocks plus HostArith, not merely the 24 SizesAt fields.
5. Arithmetic prime sum -> geometric error -> character projection. The new Fourier chapter proves conditional complex ASK−MAIN=De using the primitive-character coefficients and orthogonality. Real-part conversion and the exact call into the geometric balance remain to be traced. The geometric Data.key_identity is distinct. With all original size and window hypotheses the conditional bound Gx<=x^(1/2+(C+3)eps) follows as in the previous manuscript.
6. Smoothed character sums -> analytic nonvanishing -> reflection. The new nearest-pole chapter provides a linear finite witness selection and Cauchy join, conditional on original analytic premises. The formal audit also warns that the regularized quotient at s=1 requires the dslope identity, not punctured division. Grok's RUN9 reports a compiled pinned 30-module ExceptionalPair subtree and standard axioms there; its logs are peer evidence, not independent execution by this editor and not a whole-RH kernel replay. The pinned final reflection remains conditional on EveryCharacter. Do not import a new-head proof into this chain.

## Remaining obligations (eight groups; not eight individual lemmas)
1. Native GeoOne, TLiftK, CoreAll, Row0b, ExField, local/global compatibility and Green construction/count leaves.
2. RecTExists and VWin/host existence, PairEx prime congruences, ShortNorm, exceptional-pair downstream prime-progression relative-error input and mass-ratio producers.
3. Seven theta/literature inputs, 15 covolume inputs, square-zero base lifting, exact class-field trust/provenance. CoefLine doubling measure identity.
4. StageU large-exponent, definite-row, period/count/volume producers; Green and lowest-K-type closure.
5. Nine design closures, native lattice/height/thick density and Val, HostArith, FamP existence; remaining parameter producers; rational level-zero span and arithmetic-to-geometric Fourier join. Block 21 is locally expanded, not these producers.
6. Analytic derivative/tail and remaining independent audits; regularized point, pole conventions, finite Euler factors, exact caller to analytic window.
7. Authenticated full reachable elaborated graph, exact dependency denominator and axiom/trust ledger. The editor has not independently replayed the full kernel proof.
8. Independent audit of every local and global join, and exact cross-revision correspondence if requested. No mathematical completeness claim.

Peer documents below remain at their original status. In particular source matching, a compiled companion, and compiled native upstream subtrees are distinct evidence classes. Prior 44 inline appendices are preserved verbatim as an archive section. New source-matched peer chapters are inline if selected; all remaining editorial candidates are linked by pinned Git blobs, not silently discarded. These counts measure manuscript assembly, not the percentage of RH proved.


## New peer chapter map
45. grok_swarm/native_family_existence/09_exceptional_pair_build_and_positivity/CHAPTER_EXCEPTIONAL_PAIR_BUILD_AND_POSITIVITY.md — 1e7c0f9c13e1c8135eb64321a8f24800eb23f76e
46. integration/2026-11-24_1000_PARUNIQ_CYCLIC_PROOF.mjs — 7644e7529c4e876cdf3ff26516f9e726419d915e
47. math/2026-11-24_supply_of_admissible_character_hosts.md — 7bf1852fbf0f2849d478961dcf21884e2282ac23
48. specialists/character_boxes/RUN4_DIVISOR_ROW_THETA_FACTORIZATION.md — 73d1efedaa6df04b4e5d170e3440dda29e7c606c
49. specialists/galois_representations/RUN4_RANK_ONE_WD_NORMALIZATION.md — 47a35f7ac5dfd0f4064c83bf3920cd745801a31f
50. specialists/landau_criterion/RUN4_LINEAR_NEAREST_POLE_AND_CAUCHY_AUDIT.md — 749073ec88279e0dbd484e0b0c3880f8f56e9bfb
51. specialists/literature_provenance/RUN4_NOETHERIAN_DESCENT_AND_FILTRATION_REFLECTION.md — 099943b3d8405a5bef4ea0701c2e4fddf2e047d1
52. specialists/positivity_geometry/RUN4_CHOW_HEIGHT_RECURSION_FINITE_ARCHIMEDEAN.md — 3d7c1202e9c9747096223d2cb2a2bb8fd7baac31
53. specialists/prime_window/RUN4_ARITHMETIC_FOURIER_BALANCE.md — 7e917163215cfc1bf8eade7d02d7b9e58041d7f9
54. specialists/theta_lifts/RUN4_BASE_SCALAR_ORTHOGONALITY.md — e798b42a2ce2ce13d97c9513b96ba80a143c6509

## Additional source-linked editorial supplements (not independently audited here)
- [grok_swarm/covolume_premises/RUN1_COVOLUME_FIFTEEN_PREMISES.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/covolume_premises/RUN1_COVOLUME_FIFTEEN_PREMISES.md) — blob 88c8fae66b16002717e5c7db5f6ec8f2311bb322
- [grok_swarm/covolume_premises/RUN2_RESK_RESOLUTION_FAITHFULNESS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/covolume_premises/RUN2_RESK_RESOLUTION_FAITHFULNESS.md) — blob 4f439a5ba2a202b2347f0b878701ba4408b99c51
- [grok_swarm/final_statement_audit/RUN7_FINAL_STATEMENT_AUDIT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/final_statement_audit/RUN7_FINAL_STATEMENT_AUDIT.md) — blob 1d899ad5b9bbdd05412898a87ab49b7afee238b8
- [grok_swarm/final_statement_audit/RUN8_METAPROGRAM_AUDIT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/final_statement_audit/RUN8_METAPROGRAM_AUDIT.md) — blob 84e772b2d5a8515a01c8097a94fdec96c791850d
- [grok_swarm/galois_rows/RUN1_NATIVE_GALOIS_ROW_CONSTRUCTION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/galois_rows/RUN1_NATIVE_GALOIS_ROW_CONSTRUCTION.md) — blob c4f31a402125b6a9509db7cc743453988eb7f9f4
- [grok_swarm/galois_rows/RUN2_ERRATA.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/galois_rows/RUN2_ERRATA.md) — blob 341591e1fb7a7c381e7cd5366fbe6d7d91accc50
- [grok_swarm/galois_rows/RUN2_SOLVABLE_SPHERICAL_LIFT_AND_TOTOR.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/galois_rows/RUN2_SOLVABLE_SPHERICAL_LIFT_AND_TOTOR.md) — blob 49593488f8ccd7dd8b2fc271afaed3ac6f4e54ca
- [grok_swarm/galois_rows/RUN4_CHEVALLEY_S_UNITS_AND_PRESCRIBED_HECKE_CHARACTERS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/galois_rows/RUN4_CHEVALLEY_S_UNITS_AND_PRESCRIBED_HECKE_CHARACTERS.md) — blob f115eead33a7297fdefec7ec2edd82631cedc91d
- [grok_swarm/galois_rows/RUN4_TRUST_TABLE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/galois_rows/RUN4_TRUST_TABLE.md) — blob 881bb12d2bf6739d7367250d1315b486b253adea
- [grok_swarm/galois_rows/RUN5_ROW0B_CONSUMERS_SOUNDNESS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/galois_rows/RUN5_ROW0B_CONSUMERS_SOUNDNESS.md) — blob 5ed41b4d52bf74c3676dbbda8c3d1c84316f3d77
- [grok_swarm/galois_rows/RUN6_GAL_FIELD_TRACE_AND_HODGE_FIELDS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/galois_rows/RUN6_GAL_FIELD_TRACE_AND_HODGE_FIELDS.md) — blob 3f622320f1fab559c6286c2ec2762f99313b5809
- [grok_swarm/green_regular_character/2026-11-24_GREEN_REGULAR_CHARACTER_CHAPTER.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/2026-11-24_GREEN_REGULAR_CHARACTER_CHAPTER.md) — blob 54403ac3119ae6f45f172a638b7602aecf7ad9e0
- [grok_swarm/green_regular_character/LEAVES_I_PN_INJECT_AND_POLYCOUNT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/LEAVES_I_PN_INJECT_AND_POLYCOUNT.md) — blob e59dd442e29735c6b9081b71731dc4f260b1d869
- [grok_swarm/green_regular_character/RUN3_IPGL_PARAB_GGNORM.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN3_IPGL_PARAB_GGNORM.md) — blob 632768bf01a944069855d3f5787bc1d5a252b06f
- [grok_swarm/green_regular_character/RUN4_GREEN_DEPENDENCY_TREE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN4_GREEN_DEPENDENCY_TREE.md) — blob af62721eca9cbe701591f792fdca1dd9184ed706
- [grok_swarm/green_regular_character/RUN4_SUMWHGG_TORUS_MASS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN4_SUMWHGG_TORUS_MASS.md) — blob 2e31b6f2738fe46c1a482df7bba2395dc404e06e
- [grok_swarm/green_regular_character/RUN5_GREEN_DEPENDENCY_TREE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN5_GREEN_DEPENDENCY_TREE.md) — blob a1a73a5c8a07631465d06f247d6cab0eefc67b20
- [grok_swarm/green_regular_character/RUN5_LEAVES_NOTPRIMARY_CANCEL_MUREC_MIR.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN5_LEAVES_NOTPRIMARY_CANCEL_MUREC_MIR.md) — blob 26bd142733bc59a5bd80d93fa7e1aa32f8a14f95
- [grok_swarm/green_regular_character/RUN6_CYCLIC_MASSEQ_LOGCONV_DERCLASS_MIR.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN6_CYCLIC_MASSEQ_LOGCONV_DERCLASS_MIR.md) — blob 106f17b83f7e1c30909260e33634868aa22ec9c0
- [grok_swarm/green_regular_character/RUN6_GREEN_DEPENDENCY_TREE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN6_GREEN_DEPENDENCY_TREE.md) — blob fe1c2cbd3ed13e84cf55ba46d3e4bd6638f32d10
- [grok_swarm/green_regular_character/RUN7_GREEN_DEPENDENCY_TREE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN7_GREEN_DEPENDENCY_TREE.md) — blob 66695914c602f4e2ffafa2dc1dcf868532ebdc39
- [grok_swarm/green_regular_character/RUN7_UPSTREAM_OPTIONS_REBUILD_PINNED_GREEN_FIVE_LEAVES.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN7_UPSTREAM_OPTIONS_REBUILD_PINNED_GREEN_FIVE_LEAVES.md) — blob dfe853e74ae8cf75273cf2519eed7a3117d29016
- [grok_swarm/green_regular_character/RUN8_BZ_MIRTAIL_PHIPLUS_CONJ_PSISUM_PARMASS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN8_BZ_MIRTAIL_PHIPLUS_CONJ_PSISUM_PARMASS.md) — blob 84a4ea09a0ad6e750da47f58574c0f862b1e8aa3
- [grok_swarm/green_regular_character/RUN8_GREEN_DEPENDENCY_TREE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/green_regular_character/RUN8_GREEN_DEPENDENCY_TREE.md) — blob 006f42656038980df81c1fec43afde3abd5f4cf2
- [grok_swarm/native_family_existence/04_published_bundle_and_exceptional_pair/CHAPTER_PUBLISHED_BUNDLE_AND_EXCEPTIONAL_PAIR.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/native_family_existence/04_published_bundle_and_exceptional_pair/CHAPTER_PUBLISHED_BUNDLE_AND_EXCEPTIONAL_PAIR.md) — blob 8461d3786ab2dea91a6fe7de041149a374cdbcf2
- [grok_swarm/native_family_existence/05_landau_page_and_zero_gap/CHAPTER_LANDAU_PAGE_AND_ZERO_GAP.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/native_family_existence/05_landau_page_and_zero_gap/CHAPTER_LANDAU_PAGE_AND_ZERO_GAP.md) — blob 2ffbcdf66ed596db0ad433611ccece9d7caf8f66
- [grok_swarm/native_family_existence/06_zero_free_regions/CHAPTER_ZERO_FREE_REGIONS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/native_family_existence/06_zero_free_regions/CHAPTER_ZERO_FREE_REGIONS.md) — blob e578f5b88884d585741d41f9f9c9d962921a0cf5
- [grok_swarm/native_family_existence/07_local_zero_sum_and_analytic_bounds/CHAPTER_LOCAL_ZERO_SUM_AND_ANALYTIC_BOUNDS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/native_family_existence/07_local_zero_sum_and_analytic_bounds/CHAPTER_LOCAL_ZERO_SUM_AND_ANALYTIC_BOUNDS.md) — blob 9f31e37d4ac6deb0e31bde9db545dce052d42f3a
- [grok_swarm/native_family_existence/08_executed_companions_and_analytic_base/CHAPTER_EXECUTED_COMPANIONS_AND_ANALYTIC_BASE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/grok_swarm/native_family_existence/08_executed_companions_and_analytic_base/CHAPTER_EXECUTED_COMPANIONS_AND_ANALYTIC_BASE.md) — blob ebbecf3a6f3c324df099712efd5849829314360a
- [math/2026-11-24_joint_scale_separation.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_joint_scale_separation.md) — blob 9e8ef1bd4efa7b151a695fd9cf671e4ebe44bcb9
- [math/2026-11-24_radius_change_fibre_induction.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_radius_change_fibre_induction.md) — blob d8e38fc62601594bcedd1e4733e6af5f3cf480c2
- [math/2026-11-24_topg_vwin_zero_free_bridge.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_topg_vwin_zero_free_bridge.md) — blob 61297a5f42ed52752b9358d80be9ca5a67599650
- [math/EXACT_CANCELLATION_NORMAL_FORM_2026-11-24.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/b600c829924f8de6c161b522ec6c7db4960de9be/research_archive/2026-11-24_lean_rh_translation_swarm/math/EXACT_CANCELLATION_NORMAL_FORM_2026-11-24.md) — blob 5f31339ad1bff73d610b350fd39baf81aa24f14d

Coverage: 54 inline editorial documents; 33 further linked candidates from this inventory; 87 candidates in the current selection rule. Distinct linked and inline entries are tracked by path, not inferred kernel dependencies. Earlier document count is historical and preserved. Working tree snapshot b600c829924f8de6c161b522ec6c7db4960de9be. Prior manuscript blob f2969bec241f39ae9398f25b54652bef3798bb26. No source file edits or physical gate changes.

RESUME HERE: expand szRow_exact's dependent 12-field proof, beginning with the parity numerator e_mu and etaF identity; inspect source against original pin, coordinate Fourier/geometry producers with their dedicated lanes. Request audit of the common Y witness and the two elementary growth bounds. Retain the source-revision split.
HANDOFF TO: integration, formal audit, character boxes, positivity geometry, theta, all lanes.

---
# Prior integrated manuscript (retained verbatim)

# Human-readable RH reconstruction — integrated manuscript, third edition
2026-11-24 09:56 UTC. **INCOMPLETE.** Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005; upstream main observed 73958da58a8a4d1f61b789745c5444baf6247cae at 09:50:10 UTC. Main at pin blob dbd5db70bc11b35f18fa5751216ab335321e7bfc. No equivalence to changed upstream head established. Previous manuscript blob 710d9fcbde65609fa06a4dc2f2617c524e763608; prior derivation and all 28 appendices retained. Neither a complete proof reconstruction nor independent upstream Lean kernel execution.

## Reading route and exact joins
1. Arithmetic row: appendices 1,13 and new Galois and local finite-field/Green chapters. Guarded Row0b, local parameter, Frobenius, prescribed-completion and Satake arguments now have substantive conditional reconstructions. Native producers remain. Apply Grok RUN2_ERRATA before Galois RUN2 claims.
2. RecTExists and VWin: the three native-family chapters trace recAtG, two passes and lay_of_core; SmallPrimeOne and SiegelMassRatioCM have native source traces, not independent verification of all underlying producers.
3. Seven theta/literature inputs and HypsAlt: appendices 2–4,14–16, new theta and divided-power chapters, retained stronger-extension derivation. Integer nonvanishing/gamma guard and divided-power factorization/gluing preserve original inputs.
4. Same-host design: appendices 5–6,17–25, new positivity and character-box chapters, and new local derivation below. Explicit right inverses yield surjectivity, then rank equality in appendix 18. Chow-height/self-intersection equality has a source-matched chapter. Neither alone supplies a native host. SizesAt (24 fields) differs from ParameterChoice' (21 producer blocks plus HostArith).
5. Prime signal: appendices 7–9,26,28 and new primitive inertia/Frobenius chapter. Primitive-value source is no longer merely named; exact ASK−MAIN=De Fourier expansion remains open.
6. Analytic conclusion: appendices 10–12,27 and new line-one nonvanishing chapter. Real quadratic exception at one and logarithmic derivatives are now source-matched; nearest-pole and tail audit remains.
7. Conditional Green companion compilation and abstract core-Lean skeletons, where reported by peers, concern explicit premises of those companions. They are not replay of the upstream proof. No upgrade of peer validation status.

## New mathematical derivation: signature gaps, rbS, and explicit parameter join
Source-matched conditional proof, no URT premise. Prior manuscript identified this as a separate obligation. Sources (all exact pinned blobs):
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitConstantsParameterConditionsLarge.lean — 8bb3bd4a9a5343eaeaef138a1dccf57016010f0a
- same directory SzRowSigGaps.lean — 77e779b490a8aae9d1e0055121c1648de9affb12
- RbSNumeric.lean — 4dcba7b5d4c5face86aa372431097449c685e28f
- SzRowAndImp.lean — ca633b5e23f18e773bffbad6293cda846711bea7
- LogAddRpowMulLogPowLeRpow.lean — c6103a4594f1e453d6e0b621f212dcbf1247fa66
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean — 688162690ac7cbfe620037fcee8e451e7116f45b
- src/Formalism/SharpRestriction/InertJacobiLevels/AsmIface.lean — 1c01d77eca74ee32a49d3ec089b799c87c0d2c25

### 1. Quantifiers
SzRow P: for every 0<eps<1/52 and C satisfying Std, exists c1, for every cD>=c1 exists c2, for every ch>=c2 exists x0, for every D:D7,L:SizeData₂ D with L.sc.eps=eps, x>=x0, Val C cD ch L implies P(C,D,L). SzRow.and takes max of first thresholds, then max of second thresholds at SAME cD, then max of x thresholds at SAME cD,ch. All predicates refer to SAME D,L. No witness is constructed merely by combining universal consequences. SzRow.imp retains those choices.

### 2. Signature separation
From RankVal, x>=2 and eps<1/52, obtain 0<n<=x^4 (n<=2x^(9/4)), m<=x² (m<=2sqrt(x delta1)<=2x), k<=x^6 (k<=2x^(9/2+10eps)<=2x^5). From t_win, Val.Ct_eq and Std.Ct=401, t<=x^401. Assume Cgap<=x, ranks nonnegative. Exact gapS:
G=Cgap*k*m^4+(k+m(t+1))*m^10.
Then G<=x^15+x^26+2x^423<=4x^423<x^430. Bound holds even for negative Cgap, since k*m^4>=0.
Set b=exp(x^eps), X'=exp(x^(eps/3)), b'=x*b/X', w''=b/(n X'). Eventually 434log x+x^(eps/3)<=x^eps. Explicit sufficient alternative to Lean little-o threshold: u=log x>=max(3log 2/(2eps),1736/eps²). Then exp(eps u)>=2exp(eps u/3), exp(eps u)/2>=eps²u²/4>=434u. Hence b/X'>=x^434. Since 0<n<=x^4, all b,b',w''>=x^430.
Choose cD,ch>=430, as in Lean. Del=ceil(x^cD), h0=2ceil(x^ch) are >=x^430. HCVal supplies v_i=(k-2-i)*4Del and b_j=b1+j*h0. At top places b1=bT+floor(b'/x)>=b' (bT>=b', floor nonnegative); thick places b1>=ceil(b); thin places b1=ceil(w''). Therefore b1>=x^430 for each embedding.
Three signature gaps: v_i-v_(i+1)=4Del for i+1<k-1; v_(k-2)+b_0=b1 for k>=2,m>0; b_(j+1)-b_j=h0 for j+1<m. Each >=x^430>G. This handles cross gap, not just neighboring gaps. Nonexistent indices vacuous. Proves conditional szRow_sig_gaps with HCVal and Std retained.

### 3. Error budget
For rbS_numeric retain x>=8, 0<E<=x, P>=0, 0<=k<=2x^5, r<=2k, m>=2, de>=1/E, 0<=Del<=2P, 0<=lg<=x, b>0, X>=x^16, b>=x^22 P. Then de>=1/x>0 and X>0. For r<0 product nonpositive. Otherwise kE/(m de)<=2x^7 and xb/X<=b/(8x^14). Furthermore k(4Del)8x^14<=128x^19 P<=x^22 P<=b, so k(4Del)<=b/(8x^14). Since r<=4x^5,
r*(xb/X+4kDel)*lg*(kE/(m de))
<=4x^5*(2b/(8x^14))*x*2x^7
=2b/x<=de*m*b.
No division by unknown sign; k=0 or P=0 allowed. For szRow_rbS substitute E=x^eps,P=x^cD,X=X',lg=log x,de=L.de2. Rewrite L.Sc_eq,V.Del_eq,lA,Scale.b',Scale.a. cD>=0 ensures ceil(P)<=P+1<=2P. de>=x^(-eps) follows from typeDensity_eq_card_div and HostVal T2 density; r<=2k,m>=2 from Ranks; k<=2x^5 from RankVal. For log x=u>=max(288/eps²,2(22+cD)/eps²), exp(au)>=a²u²/2 proves x^(eps/3)>=16log x and x^eps>=(22+cD)log x, yielding two eventual scale requirements. Take max with log 8. Alternative to two asymptotic witnesses in source. Conditional result r*(b'+Sc)*log x*lA<=de2*m*b.

### 4. Record assembly
Std.parConsts_pos shows positivity of all 23 constants. cLL positivity from reciprocal >=1, not new assumption; fixed CnW=10 and Ct=401 retained. explicitConstants_parameterConditions_large joins exact 21 blocks under shared quantifiers:
1. sizes_host_degree_and_log_q_and_conductor_bounds
2. explicitChoice_rankK_lower_upper_bounds
3. szRow_rank_lower_bounds
4. szRow_logf
5. sizes_etaSz_le_b_div_and_log_etaSz_le_and_t_le
6. sizes_m_mul_Sc_add_etaSz_le_w_mul_L_and_bounds
7. sizes_card_TT_le_Nstar_and_rhoP_le_and_bT_le
8. szRow_cloud_le
9. szRow_windowLength
10. szRow_exact
11. szRow_lowsFar
12. explicitChoice_rowWeight_ratio_and_lastCloud_le_twice_first
13. szRow_thinSize_ge
14. sizes_del_ge_cloudUnit_and_count_bounds
15. sizes_node_bounds_le_h0
16. sizes_t_add_cube_le_h0_and_f_mul_N_pow_le_h0
17. szRow_sig_gaps
18. szRow_rbS
19. sizes_b_add_Sc_add_etaSz_add_div_lt_lStar
20. szRow_card_words_le
21. sizes_exists_Y_bounds_host_g_mem_Icc_Y_two_mul_Y.
Record copies 23 C.P constants unchanged and positivity proofs. Predicate fields retain exact names as in pinned record literal; in particular e_mu is fun j => (h_e_parity j).num, not scalar, and logDerivative_le_power uses h_dlogL1_le. Last four fields g_norm,g_mod,pde_split,level_split are projections of HostArith: existence of integral pi in K with pi*conj(pi)=g_i, congruence g_i≡1 mod QS*q*d, complete splitting of both pde,pde', and class splitK for every level prime. These are not consequences of numerical size. Both parConsts P=C.PK and P.CnW=C.P.CnW are rfl. Thus theorem constructs one P:ParameterChoice' D L conditionally, without altering host. Not SizesAt record. Two newly expanded leaves are blocks 17 and 18; others retain original proof obligations.

### 5. Reproducible arithmetic regressions
Executed in V8 BigInt this run: 2916 rbS checks with de=d/E and all denominators cleared, 324 gap bound checks, 390 signature-gap checks, and one negative control deleting X>=x^16. All passed. Exact reproduction:
~~~javascript
const ck=(p)=>{if(!p)throw Error("failed")};let rb=0,gap=0,sig=0;
for(const x of [8n,9n,16n])for(const E of [1n,2n,x])for(const P of [0n,1n,3n])for(const k of [0n,1n,2n*x**5n])for(const r of [-1n,0n,2n*k])for(const m of [2n,3n,9n])for(const d of [1n,2n])for(const X of [x**16n,2n*x**16n]){
 const b=x**22n*P+1n,D=2n*P;
 ck(r*(x*b+4n*k*D*X)*x*k*E**3n<=d*d*m*m*b*X);rb++;
}
for(const x of [2n,3n,5n,8n])for(const C of [-1n,0n,x])for(const k of [0n,1n,x**6n])for(const m of [0n,1n,x**2n])for(const t of [0n,1n,x**401n]){ck(C*k*m**4n+(k+m*(t+1n))*m**10n<x**430n);gap++}
for(const x of [2n,3n])for(const k of [2n,3n,5n,9n])for(const m of [1n,2n,5n])for(const z of [0n,1n,2n]){
 const y=x**430n,D=y+z,h=2n*(y+z),v=i=>(k-2n-i)*4n*D,b=j=>y+z+j*h;
 for(let i=0n;i+1n<k-1n;i++){ck(v(i)-v(i+1n)>=y);sig++}
 ck(v(k-2n)+b(0n)>=y);sig++;
 for(let j=0n;j+1n<m;j++){ck(b(j+1n)-b(j)>=y);sig++}
}
const x=8n,E=8n,k=2n*x**5n,r=2n*k,m=2n,X=1n,b=x**22n,D=2n;
ck(r*(x*b+4n*k*D*X)*x*k*E**3n>m*m*b*X);console.log({rb,gap,sig,negativeControls:1});
~~~
Finite arithmetic regressions support symbolic inequalities; no native geometry calculation or independent Lean elaboration. Source files read directly from immutable pin. No blanket proof percentage.

## Numbered remaining obligations
1. Native GeoOne, TLiftK, CoreAll, Row0b and local/global compatibility producers; Green construction/count leaves.
2. RecTExists and native VWin/host existence, including remaining exceptional prime/mass ratio proof dependencies.
3. Seven literature/theta inputs, 15 covolume inputs, Noetherian square-zero lifting and class-field provenance.
4. StageU substantive large-exponent, definite-row, period/count/volume producers. Same-row composition is not these proofs.
5. Nine design closures, lattice/height/thick density, Val, HostArith and FamP existence; remaining parameter blocks and exact Fourier signal producer.
6. Analytic derivative/tail, nearest-pole and residue branches, Euler-product leaf and independent analytic audit. Line-one reconstruction now included.
7. Full reachable elaborated dependency graph and axiom/trust ledger; global denominator unknown.
8. Independent audit of every join and producer; no global proof validation or claim of completed translation.

Coverage: 44/44 selected inline editorial documents integrated, including 16 new documents; not mathematical proof coverage. Exclusions: []. Earlier chapters retain original statuses and hashes.
Other peer chapters retained as linked supplements rather than duplicated inline (source files inventoried; no independent validation of their content):
- [TopG/VWin bridge](../../math/2026-11-24_topg_vwin_zero_free_bridge.md)
- [Joint scale separation](../../math/2026-11-24_joint_scale_separation.md)
- [Native Galois row](../../grok_swarm/galois_rows/RUN1_NATIVE_GALOIS_ROW_CONSTRUCTION.md)
- [Solvable spherical lift](../../grok_swarm/galois_rows/RUN2_SOLVABLE_SPHERICAL_LIFT_AND_TOTOR.md)
- [Mandatory Galois correction](../../grok_swarm/galois_rows/RUN2_ERRATA.md)
- [Green regular character chapter](../../grok_swarm/green_regular_character/2026-11-24_GREEN_REGULAR_CHARACTER_CHAPTER.md)
New appendix map:
29. specialists/galois_representations/RUN3_ROW0B_GUARD_AND_INPUTS.md (5dc7623e927f41024b9315e0e46fdcf218af1836)
30. specialists/theta_lifts/RUN3_INTEGER_NONVANISHING_AND_GAMMA_GUARD.md (4ab7b015e9dd196fcd1ff0609530f3a3cc9ad125)
31. specialists/literature_provenance/RUN3_DIVIDED_POWER_FACTORIZATION_AND_GLUE.md (f5b8abca724cad7b9fa466be73cb59c4ba641fd6)
32. specialists/positivity_geometry/RUN3_CHOW_HEIGHT_SELF_INTERSECTION_EQUALITY.md (13bdd3f2b8bbaf70a7df459dcf9d20aafc567687)
33. specialists/character_boxes/RUN3_LEVEL_PROJECTION_RIGHT_INVERSE.md (ef024ae38f6716b03da16b8ddedc92cb6b6f1ce0)
34. specialists/prime_window/RUN3_PRIMITIVE_INERTIA_FROBENIUS.md (029340272045762c0163e4ec2aedee4b0a14ba07)
35. specialists/landau_criterion/RUN3_LINE_ONE_NONVANISHING_AND_LOG_DERIVATIVE.md (c6b989ac4e75f700767150a3124816c3ce1813d2)
36. math/2026-11-24_guarded_cusp_map_algebra.md (080046e0e9f4a74ed19d4d440443b9508fcd0c96)
37. math/2026-11-24_depth_zero_frobenius_parameter_proof.md (ee837459e3ad710655196c3a2e260669e17ea1c5)
38. math/2026-11-24_finite_character_induced_parameter_proof.md (d51d022a29519bb83b23b1aab85ea9c603d4bd69)
39. math/2026-11-24_green_exhaustion_and_pin_bounds.md (34caa94378031c7cdd0e0e0421383fc1e90a96e6)
40. grok_swarm/native_family_existence/CHAPTER_NATIVE_FAMILY_EXISTENCE.md (858edda335fc99a496c1a7298bb1bd9473db7281)
41. grok_swarm/native_family_existence/02_recAtG/CHAPTER_RECATG_TWO_PASSES.md (0e0ebf9692cf9f30298fc23cf19b856183cda248)
42. grok_swarm/native_family_existence/03_trust_boundary_lay_of_core/CHAPTER_TRUST_BOUNDARY_AND_LAY_OF_CORE.md (15120927344b01a5223e8aca00e545c436f01941)
43. grok_swarm/green_regular_character/RUN2_GENERIC_COUNT_MACKEY_ROOTSUM.md (770bd6a5fa5c2e683cc23a8bc51e7d4438c37b39)
44. grok_swarm/galois_rows/RUN3_CM_PRESCRIBED_COMPLETION_AND_SPHERICAL_SATAKE.md (8b5d21ab29aa337fb0535415bb990d16addf7c85)

RESUME HERE: expand exact 21st parameter block sizes_exists_Y_bounds_host_g_mem_Icc_Y_two_mul_Y, or szRow_exact's dependent fields if claimed. Coordinate native host and Fourier work with relevant lanes. Request formal audit of signature indices, density substitution, parameter record joins. All physics files untouched.


## Retained second-edition local derivation
## New derivation: stronger-extension transport and synchronized row hypotheses

### A. Why the direction of the map matters
Fix hL:RecTExists, real cDep, retwisting predicate A:AtP, and all thirteen indices K,B,f,T,w,Z,Wt,p0,t,nch,n,xd,c. Keep S:SExt and Gamma:GeoP fixed. Write N for extensionWithList hL cDep. At each index N is extensionWithLaw witness together with lifted ListPin. Let O be lifted OriginData, which requires witnesses P,x,l with (ListSt cDep x and SatU P), Wt=P.Wt, and Kept l.c.ch nch. The extensionWithOrigin is N×O. The actual stronger extension N' is (N×O)×PLift(A K B f T). For each fixed index the projection ((n,o),a)↦n is a witness of Nonempty(N) from a witness of N'. This proves the required implication, not its reverse. One cannot construct an N' witness out of an arbitrary N witness. This is the concrete x.1.1 from StageU.

Write p=parametersOfExtension N S Gamma, p'=parametersOfExtension N' S Gamma. Pinned builtE_of_nExt_alt unpacks BuiltE witness b and proof hb, replaces b.nx.2 by Classical.choice of the projected nonempty witness, retains b.nx.1 and hb. Same replacement defines witnessOfExtensionImplication. A weighted point q retains B,f,T,w,Z,O and changes only witness. nonempty_bWit_wptOfNExt reconstructs typed bundle witness, including 22 spectral record fields, five k fields, coordinate/entry/standard/rd fields and remaining h fields; not a claim that all dependent record types are syntactically equal. A linked bundle retains b' and equality e identifying underlying dependent sigma data. This gives linkage implication hLk from p' to p. positionOf_mono gives hB for IsBuiltE, and hG for IsGoodE by carrying second condition unchanged. All three arrows go from stronger to weaker witness systems.

### B. Universal row statements transport the other way
For fixed family predicate H(A,sigma) on original RawSel BundleCondition domain, row_mono_id applies Row.map with identity on bundles, slot implication and linkage implication. Any row satisfying stronger membership is also admissible under weaker conditions, so old universal row assertion implies new one. No existential host is created. Lg1 KP Q Q' r is existence of slot R with LargeBaseCondition KP Q R and r(sAnd Q' R). Given hQ:Q1⇒Q and hQ':Q'1⇒Q', keep SAME R. Large-base implication Q⇒R gives Q1⇒R, and Q'1∧R⇒Q'∧R transports row predicate. This is exactly eventually_coreProperty_mono_fewerCores, with original eventual witnesses retained. Therefore any H yields map LinkedAt(p,Row H)⇒LinkedAt(p',Row H). Apply to twelve fields hPA,hLamP,hDivG,hDcPtG,selJ,tie,lab,good,geo,mi,kap,df to obtain OpenParameterStatements(p)⇒OpenParameterStatements(p'). Both maps have required domains/codomains; same H retained. At StageU norm row uses H(A,sigma)=S0.NL(Cp.D3 3 A), second argument unused by H. Not identification of entire parameter spaces.

### C. One nine-input row, not nine unrelated selections
Exact theorem allRows_of_open0_alt consumes global Artin reciprocity, convergent Siegel–Weil, discrete series cover, Harish-Chandra modules, cusp rapid decay, Casselman–Wallach, discrete series classification, surjectivity onto X, lambda lower bound, recursive parameter and fixed extension/SExt/geometry/predicate, open statements o, linked covolume hl3, linked functional hfun, linked norm hN. Let P1 through P9 denote respectively o.hPA, o.hDivG, o.good, o.geo, hl3, hfun, o.mi, o.kap, o.df at common family/raw selection (A,sigma). RowL.and combines two Lg1 witnesses by intersecting slots R,R' (sAnd), strengthening old rows via appropriate projection, then conjoining on same row selection. LargeBaseCondition.and uses eventual conjunction theorem: min of positive admissible epsilon cutoffs, then supremum of scale contexts K,K', then successive maxima of cD,ch and x thresholds, in that order with original dependencies. No exchange of existential and universal quantifiers. Iterate exact association
((P1∧P2)∧(P3∧P4)) ∧ ((P5∧P6)∧((P7∧P8)∧P9)).
At common row nine projections are 111,112,121,122,211,212,2211,2212,222 (1=left,2=right). Feed in this order to row_rRows_stage0_alt with p1..p5 and h3,h4. This gives rRows conditional on substantive theorem; does not prove latter merely by naming it. Separately nRest=hN directly, zL is not arbitrary open orbit assumption: it is eventually_coreProperty_mono o.hPA with R1.ZLAt.zL_of_hPA. Exact next edge for character-box lane, which has already proved rank equality conditional on zL.

### D. Complete local 26-field assembly
Direct input projections hPA,hLamP,hDivG,hDcPtG,selJ,nRest; six-entry period/level theorem supplies aPt0,aPtTw,aPer0,aPerTw,tie,aP10 in that order. Local Siegel–Weil selection supplies sLp,sO,hTF. Remaining eleven fields: hn4 (classCountBound_paramsLambda_constructedPoints), jOn (row_jOn_of_row_hPA_alt), hInstR (row_hInstR_of_hU using volumeRatio), aC2 (divisionSecondComplement_constructedPoints), aAtG (row_aAtG_at_built_alt), hRB (row_hRB_univ_alt with p1..p4), hTw (row_hTw_of_tie_alt), hServ (hServ_of_linkR with global Artin reciprocity and projected linkage), zL (above), c30 (row_counts_of_labels_alt from Siegel–Weil and labels), rRows (nine-input conjunction). For hServ, linkR_of_isLinked' uses q,b'.R,w.recPin and congrArg of projection from bundle sigma triple to boundary reciprocity sigma triple. No new premise. Exact interface derivation and elementary proof of transport/conjunction; underlying producers separately named. Appendix 16 already covered high-level StageU adapter; this adds explicit product projection, both directions of variance, retained slot, nested witness choices and nine exact projection paths.

### Pinned source ledger
Paths in T=src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/:
- T/OpenAndLinkedOfStrongerExtension.lean 5c6dea88990d2600cb4d48985f8969de9fea3d5b
- T/RowsOfStrongerNExt.lean e6174831d314a32e7711ea06318f0d4f6c942dff
- T/SettingsFormsExistList.lean 1ee96bfabac3a0f3b07a85b44349096cdb2070ca
- T/ExtensionWithOrigin.lean c3e3ea15ad99559370481ce5d4f40e2110971329
- T/ExtensionWithAtProperty.lean 1d0475d839a81af3c77b3fdeb8d7fc994205496c
- T/AllRows.lean be24ab5328945e90d2b981ff43ed9f20bb8b86ac
- T/LinkROfIsLinked.lean 66e5fddcb389f78669cef5787ef2c648d537bf4d
- T/HypothesesNonemptyOfUnramifiedExponents.lean c0ce994aa86f737b707b5617fb10bcfb35c0117e
- src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/CoreSlotConstructionMonoFewerCoresBothPasses.lean c61f195379686db768d35642c5017c88e9f60c52
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/EventuallyAllScaleContextsAndOfBoth.lean 9cf715e78a3b56d5730b0a8795f9599561bc00ed

### Executed checks and reproducibility
Actual connector source fetches, blob identity checks and literal matches: ten pinned blobs, 53 anchors, all 26 field names matched in constructor body. V8 checks: 4608 Boolean projection tests on 512 assignments; 1296 finite subset monotonicity cases with 671 counterexamples when the subset hypothesis is reversed or omitted; 490 threshold fixtures. These test logical bookkeeping, not dependent Lean types. The symbolic argument is general; no local Lean execution.
Replay: git show PIN:path and git rev-parse PIN:path for ten original paths; verify blobs and named bodies. For each mask 0..511, set nine Boolean entries from its bits, form nested tuple in exact association above, check each projection. For each of 16 masks O,N,G, check N subset O and O subset G implies N subset G; count counterexamples when N is not a subset of O. For x,y in [-3,3] and z in [-3,6] test z>=max(x,y) implies z>=x and z>=y. Peer appendix execution reports attributed, not independently rerun here.

## Current coverage and numbered remaining obligations
Selected typed interface graph (integration/2026-11-24_0800_TYPED_ROOT_OBLIGATION_GRAPH.json, blob 1823f58b56baf53d1db6a5ce7b781cd24707a1f5) contains 16 nodes and 38 explicit selected ports, 15 with non-null producer IDs. Not all kernel dependencies, nor a fraction of translated theorems. Source import census 175187 modules, 753261 local import edges; full root-reachable elaborated denominator missing. This edition embeds 28/28 selected manuscript chapters, plus two linked supplemental notes, not a full-proof completion percentage. Previous manuscript and historical handoffs retained as evidence, superseded by ledger below.

1. Actual GeoOne, TLiftK, CoreAll, Row0b weakening and native arithmetic producers (two-lift descent expanded, appendix 13).
2. RecTExists, VWin and Val/FamP existence with common host, native ranks and remaining marked-pattern/host assumptions. Conditional 24-field size assembly mapped, not existence.
3. External literature: seven input producers, fifteen covolume premises, deformation square-zero descent, theta LInt2 nonvanishing and base scalar polZero_of; precise references.
4. StageU: local transport and row conjunction expanded. Still prove large exponent bundles, GalC.final_alt_alt, substantive row_rRows_stage0_alt, classSel and other row producers. Character-box lane should trace ZLAt.zL_of_hPA.
5. Geometry: actual SelfIntersectionBound and height/covolume producers, small-section lower estimates, lattice and thick density, same-family nine conditions, zeroFreeAll_of_topG. Separate VolGe from downstream height bound.
6. Exact prime signal primitive_value_primitive, conductor/inertia/Frobenius, analytic Re(s)=1 Mathlib nonvanishing and remaining derivative/tail/nearest-pole checks; positivity and exceptions.
7. Root-reachable elaborated graph/trust audit and exact denominator; compare independently verified export against original source.
8. Independent formal and human audit of joins, exact row maps/quantifiers and imported statements. Specifically audit variance arrows, rRows conjunction and dependent record transport.

RESUME HERE: expand actual ZLAt.zL_of_hPA in ThirdPlaceSeries/LPrjSurjAt.lean (or follow imports if elsewhere), coordinating with character-box lane; if already translated, instead expand exact row_rRows_stage0_alt in actual imports of LinkROfIsLinked.lean. Prove a substantive leaf then integrate newer peer chapters. HANDOFF TO: formal audit, character boxes, theta, geometry, integration and Galois.

## Evidence appendices
The first edition follows unchanged as historical evidence. Its earlier obligation ledger is superseded by the second-edition ledger.


# Human-readable RH reconstruction — integrated working manuscript

2026-11-24. INCOMPLETE. Source-matched conditional arguments, not independent kernel validation. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Do not mix current main revisions. This manuscript includes complete peer chapter texts as evidence appendices; the reading spine below identifies the exact joins. Duplicate explanations are retained in appendices for audit. No URT premise.

## Reading spine
1. Galois row from geometry and theta lift: appendix 1. The same row supplies both Row fields of the literature record, plus independent VWin; RecTExists is separate.
2. Literature and theta inputs: appendices 2–4. Seven inputs, not the older everyE₂ route. Align CF0 and CF1 by maximum, then apply the new StageU derivation below.
3. Arithmetic volume and design: appendices 5–6. The volume inequality is conditional on ArithHilbertSamuel, ArCalc and NefNumerics; it does not itself imply RH. The nine closed predicates must hold on the same family chosen after K. TopPlug uses HypsAlt and DefiniteSideCondition, not the parallel Hyps route.
4. Arithmetic bound: appendices 7–8. Normalize error by Q=nT*m*b>0. The resulting exponent is 1/2+(C+3)eps. For fixed s to the right of 1/2 choose eps sufficiently small before choosing a family. Arbitrarily late full windows suffice.
5. Analytic nonvanishing: appendices 9–11. Positive family weights prevent cancellation of residues. The one-sided window majorant controls high derivatives; a pole to the right of theta gives exponential growth contradicting that bound. Retain the analytic tail and pole-isolation obligations.
6. Primitive to imprimitive and zeta reflection: appendices 6 and 12. Finite Euler factors do not vanish in Re(s)>0; exclude the principal pole at 1. Modulus one gives zeta, and functional equation excludes nontrivial left-half zeros.

## New StageU bridge (source-matched composition)
Source src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean, blob c0ce994aa86f737b707b5617fb10bcfb35c0117e, declaration hypotheses_nonempty_of_unramified_exponents_alt. Inputs: P:UnitaryGroupThirdPlaceHypotheses, RowRat, hL:RecTExists, real cDep, A:GroupRetwisting.AtP, EvLgG A, linked prime-two-three slot norms at parametersOfDependence hL cDep, and linked FunctionalCondition and CovolumeBoundThirdPlaceSeries at the SAME extended parameters E=parametersOfExtension(extensionWithAtProperty hL (extensionWithOrigin hL cDep) A) SExt.none (geoCl anyGeometry). Conclusion Nonempty(HypsAlt S0.NL DefiniteSideCondition).

Proof of composition. Large unramified exponent bundles produce hP,hMem,hEx. The geometric Galois third-layer theorem applied to P.litN and P.toHypothesesX produces prN and serN. Surjectivity and low weights give hOL. The open parameter theorem gives hO. GalC.final_alt_alt uses P.nLink, prN, P.toHypothesesX, serN, depthZeroSupport', localFiniteness, localTateDuality, localEulerChar, hL,cDep and the original linked norm hypothesis to produce hNrow. The stronger-extension theorem supplies a pair of transport maps: its second component sends hO to hO', and its first component transports hNrow with predicate S0.NL(Cp.D3 3 A) to linked slot norms at E. The transport witness is x↦⟨x.1.1⟩, not a free identification of two parameter spaces. Apply allRows_of_open0_alt to global Artin reciprocity, convergent Siegel-Weil, discrete series cover, Harish-Chandra modules, cusp rapid decay, Casselman-Wallach, discrete series classification, both hOL projections, hL, the extended parameters, S0.NL, hO', hL3,hF,hN'. This yields hAll. Finally nonempty_hyps_of_allRows_alt uses hP, litThin, wuDecayOfGap, rowsFinDim_link, rowsPos_typeP, rowNGP and rowMainEqP from Siegel-Weil, volumeRatio from Siegel-Weil, genusMassAt_two, KPx, S0.NL, DefiniteSideCondition, the constant membership witness fun _ => hMem, hEx and hAll. This constructs the desired nonempty record. No theorem producer is discharged by its name; this closes only the composition junction.

Executed static check: 12/12 source substrings and exact connector blob ID matched. Reproduce by git show 40e56bab026552e089d7afcfeff08d2defb9c005:src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean and inspect the named calls. No Lean execution.


## Evidence appendices
The first edition follows unchanged as historical evidence. Its earlier obligation ledger is superseded by the second-edition ledger.


# Human-readable RH reconstruction — integrated working manuscript

2026-11-24. INCOMPLETE. Source-matched conditional arguments, not independent kernel validation. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Do not mix current main revisions. This manuscript includes complete peer chapter texts as evidence appendices; the reading spine below identifies the exact joins. Duplicate explanations are retained in appendices for audit. No URT premise.

## Reading spine
1. Galois row from geometry and theta lift: appendix 1. The same row supplies both Row fields of the literature record, plus independent VWin; RecTExists is separate.
2. Literature and theta inputs: appendices 2–4. Seven inputs, not the older everyE₂ route. Align CF0 and CF1 by maximum, then apply the new StageU derivation below.
3. Arithmetic volume and design: appendices 5–6. The volume inequality is conditional on ArithHilbertSamuel, ArCalc and NefNumerics; it does not itself imply RH. The nine closed predicates must hold on the same family chosen after K. TopPlug uses HypsAlt and DefiniteSideCondition, not the parallel Hyps route.
4. Arithmetic bound: appendices 7–8. Normalize error by Q=nT*m*b>0. The resulting exponent is 1/2+(C+3)eps. For fixed s to the right of 1/2 choose eps sufficiently small before choosing a family. Arbitrarily late full windows suffice.
5. Analytic nonvanishing: appendices 9–11. Positive family weights prevent cancellation of residues. The one-sided window majorant controls high derivatives; a pole to the right of theta gives exponential growth contradicting that bound. Retain the analytic tail and pole-isolation obligations.
6. Primitive to imprimitive and zeta reflection: appendices 6 and 12. Finite Euler factors do not vanish in Re(s)>0; exclude the principal pole at 1. Modulus one gives zeta, and functional equation excludes nontrivial left-half zeros.

## New StageU bridge (source-matched composition)
Source src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean, blob c0ce994aa86f737b707b5617fb10bcfb35c0117e, declaration hypotheses_nonempty_of_unramified_exponents_alt. Inputs: P:UnitaryGroupThirdPlaceHypotheses, RowRat, hL:RecTExists, real cDep, A:GroupRetwisting.AtP, EvLgG A, linked prime-two-three slot norms at parametersOfDependence hL cDep, and linked FunctionalCondition and CovolumeBoundThirdPlaceSeries at the SAME extended parameters E=parametersOfExtension(extensionWithAtProperty hL (extensionWithOrigin hL cDep) A) SExt.none (geoCl anyGeometry). Conclusion Nonempty(HypsAlt S0.NL DefiniteSideCondition).

Proof of composition. Large unramified exponent bundles produce hP,hMem,hEx. The geometric Galois third-layer theorem applied to P.litN and P.toHypothesesX produces prN and serN. Surjectivity and low weights give hOL. The open parameter theorem gives hO. GalC.final_alt_alt uses P.nLink, prN, P.toHypothesesX, serN, depthZeroSupport', localFiniteness, localTateDuality, localEulerChar, hL,cDep and the original linked norm hypothesis to produce hNrow. The stronger-extension theorem supplies a pair of transport maps: its second component sends hO to hO', and its first component transports hNrow with predicate S0.NL(Cp.D3 3 A) to linked slot norms at E. The transport witness is x↦⟨x.1.1⟩, not a free identification of two parameter spaces. Apply allRows_of_open0_alt to global Artin reciprocity, convergent Siegel-Weil, discrete series cover, Harish-Chandra modules, cusp rapid decay, Casselman-Wallach, discrete series classification, both hOL projections, hL, the extended parameters, S0.NL, hO', hL3,hF,hN'. This yields hAll. Finally nonempty_hyps_of_allRows_alt uses hP, litThin, wuDecayOfGap, rowsFinDim_link, rowsPos_typeP, rowNGP and rowMainEqP from Siegel-Weil, volumeRatio from Siegel-Weil, genusMassAt_two, KPx, S0.NL, DefiniteSideCondition, the constant membership witness fun _ => hMem, hEx and hAll. This constructs the desired nonempty record. No theorem producer is discharged by its name; this closes only the composition junction.

Executed static check: 12/12 source substrings and exact connector blob ID matched. Reproduce by git show 40e56bab026552e089d7afcfeff08d2defb9c005:src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean and inspect the named calls. No Lean execution.

## Numbered remaining obligations
1. Native GeoOne, TLiftK, CoreAll and Row0b conversion, all arithmetic producers.
2. RecTExists and native VWin/host existence.
3. Exact literature theorem provenance and seven-input producer proofs, including 15 covolume premises.
4. StageU producer proofs (large exponent bundles, final_alt_alt, stronger extension, allRows, nonempty_hyps), now exact composition mapped.
5. Nine design closure producers, rank, lattice, thick density and host estimates; exact same witness throughout.
6. Full analytic tail and derivative, nearest-pole and residue proofs and external lemma audit.
7. Full reachable elaborated dependency export and trust ledger; denominator unknown. No global coverage percentage. Local coverage: 12/12 selected peer chapters included, not 12/12 proof obligations solved.
8. Independent mathematical and kernel audit of all joins and producer proofs. No final closure.

RESUME HERE: expand the exact stronger-extension transport theorem and allRows_of_open0_alt, checking the two maps' domains and codomains; integrate the next source-matched peer chapters into a new dated manuscript. HANDOFF TO: theta, geometry, integration, formal audit.

## Evidence appendices


---

## Appendix 1: specialists/galois_representations/RUN1_ROW_BRIDGE.md
Working-repo blob 0ad31b240da3079f8803c4360b7725840f681a35.

# Galois arithmetic run 1 — source-matched bridge
2026-11-24. PARTIAL, not kernel-checked. Source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Main now 6c6821263d6b80f4ec3d7479b0159340c1b2f65e; original RowSrc path returns 404 there. Do not mix versions. Read swarm protocol, expansion, queue, AGENTS, continuity, research log/protocol/state and peer theta/integration/kernel/acceleration checkpoints. Physical CI PASS 45345201880 is unrelated to RH.

## Exact source inventory
Paths relative to src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/:
- A IntegralStructures/RowSrc.lean f769999ac5e49241993e5efbf81e4d2cded18acd
- B ThetaParseval/ThetaKernels/TLiftK.lean e9101ee7d8551561a1d6ca3b18fdcfe84dbfc713
- C IntegralStructures/GaloisRepresentationsOfThetaLift.lean 869a5e68fcff90c1ee29a6dae75594ed8a59ada9
- D IntegralStructures/Development.lean 4d4d9506494734f28fce7d39bac1a50650ecf148
- E IntegralStructures/GeometricFlagBases/WeightOneGeometricRealization.lean 4af6c909184001b272f7bfc504eac4606dcda763
- F ThetaParseval/HalfIndexLattices/TLiftK.lean 4b36fc43e988270944cef2fc1b5e9ee1493fc275
- G ThetaParseval/ThetaKernels/TPGHolds.lean c621b46b313d554ed00af05fb0ab8eb4c5050c60
- H IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean eebd76fca5538c7a0156cf330cedd4b663b0d70a
- I IntegralStructures/CrystallineDescent/ToCoreK.lean e4235a62a4bce78539c94be995d8f5a0ff59fac3

## Human-readable proof of the composition (not proofs of all producers)
A:galoisLocalGlobalStrong_recParameter is C:galoisRepresentations_of_thetaLift applied to B:tLiftK. B uses G:tLift_holds_k. C combines E:geoOne_holds and the lift via D:galoisLocalGlobalStrong_of_geometry_lift. E unfolds HolomorphicLefschetzFormula and invokes lefschetz_fixedPoint_finite_etale_correspondence; geometric_realization_of_weight_one then yields GeoOne. This is a separate geometric input, not a consequence of the theta lift alone.

F:TLiftK quantifiers: for every CM number field E with base B satisfying W.GoodK, every n>=1 and Hermitian space X of rank n with J=1 and X.IsHerm(cj E,B,n,0), there exists a natural threshold d0. For every d>=d0, every skew-Hermitian W with J=delta times identity and W.IsSkew(cj E,B,d,0), every pair of Hecke characters chiX,chiW with ResEtaPow on the specified units-map range at n,d, and archimedean exponents mX,mW satisfying HasExp, every complex submodule U of functions on UA E n and family lam of dominant weights, assume IsAutRepU U, HasWeightAt at every embedding B.emb w, and d+mW(w)<=2 lam(w).w(k) for every w,k. Then there exists a complex submodule U' of functions on UA E d with IsLift B chiX chiW mX mW lam U U'. The threshold precedes the choices of W, characters and U. IsLift remains an unexpanded predicate, not merely existence of a nonzero vector. G produces the lift using tLift_of_tools_k, tools_holds_k and hgtEx_of_k(stab2Cpt_k). The tools record contains 14 fields: swFull, boxSec, dbl, stab2, cpt, basic, polSch, unfold0, pairEx, split, vacFix, acts, lie1, lie2. Their producers include anisotropic Siegel-Weil, Eisenstein continuation, compactness, finite volume, unimodularity, tower pair/model/Weil existence, real Lie lift. These are substantive dependencies.

D:recT is exactly fun h rc => IsRecT h rc. Given GeoOne and TLiftK, seedFinOdd_of_geoOne and congFinOdd_of_ex(wtLacEx_holds) give seed and congruence. limFinOdd_of seed cong, congPhi_holds and descOffT together with TLiftK yield Core via I:toCoreK (it applies toCore to twoUpOK_of_k hT). coreAll_of_core upgrades Core to CoreAll. D:rest uses CoreAll, galoisCompat_unlinkedSupport_of_spherical(CoreAll) and localGlobalCompatAtIwahoriFixed_of_unlinked of that same compatibility to produce Row0 recT. Finally Row0.row0b recT gives Row0b recT. Do not infer Row0b is stronger from its name: its definition and conversion still need auditing.

H explains the actual local-global construction. Given CoreAll C, R1 H1 and LocalGlobalCompatAtIwahoriFixedPlaces H2, specialize H2 to the always-true place class Q. For every CM E, algebraic closure Omega, prime l, ring equivalence Qbar l to C, positive rank a, cusp representation pi, character chi and scope hypotheses hr,hp, form InScope .all l pi chi=(hr,hp,trivial). C.1 supplies a representation r and Weak evidence. exists_weights supplies integer wt and multisets HT for each embedding tau; mapped to C these equal the infinitesimal character shifted by (a-1)/2 and negated. Under complex conjugation HT maps by x -> wt-x. This uses polarized weight and integrality of the infinitesimal character; neither is automatic.

Away from l, H:away compares wdOf with rc(algNorm sigma): equal dimensions, equality when Tor and mono0, and conditional monodromy-zero plus characteristic polynomial equality for degree-zero Weil elements when Q, IsQp, TmW, Sqf and mono0 hold. The Tor branch uses H1 and plainTor_of_tor. The tame branch uses guard_tame to get nontrivial KOne fixed vectors and Apart, then H2; charPol_of_ine rewrites a degree-zero Weil element as an inertia element using exists_eq_zpow_mul. At places above l, H:above requires Nonempty LocTied, LocBridge with Pst.Induces, IsRecT, local component, mono0, and either the Q/IsQp/TmW/Sqf conjunction or Tor. It returns de Rham clause, potentially semistable evidence, and Away comparison. Tor case uses H1 and eq_of_mono0_charPol; non-Tor case uses H2, dim_of_ine and charPol_of_ine. H:crys separately obtains Satake data from spherical local component and applies C.2 to crystalline and de Rham clauses. These branches fill Row0, retaining HT identities and local conditions. No claim for arbitrary ramified representations outside these hypotheses.

Downstream junction: MainConclusion.lean ee340012ab19713a8acfecf8adc6a331cbc2f1a4 supplies the same Row0b h twice in OpenLiteratureStatements with recTExists, plus independent vwin_of_row h. VwinOfRow.lean 4cba179acd45ac08d3cad21f51c9b9d62715a9a4 constructs VWin from OpenImageCondition.mk h, baseChangeN and h. Then every_character_of_literature_of_vWin yields EveryCharacter. The theta specialist already mapped that adapter; this lane supplies its arithmetic input. No assumption dropped.

## Executed static checks
Nine grouped assertions in V8 against actual connector-returned pinned source files A-I: A call to C/B; B call to G; C geometry/lift application; D five core/row references; E two Lefschetz/geometry references; F threshold, Hecke, restriction, exponent, existential U'; G tools/height/Lie references; H five local-global/weight/branch references; I twoUpOK conversion. All 9 succeeded. Replay: git checkout the pin; git hash-object each file and compare inventory; grep -F each named call in the corresponding declaration. Connector blob identities recorded, not independently hashed. No Lean execution, no elaborated edges, no independent proof of imported producers, no URT speed result. Source-matched composition only.

RESUME HERE: locate exact Row0 and Row0b definitions via H's imports and audit Row0.row0b, then unpack CoreAll/Core and twoUpOK_of_k to determine which crystalline descent and congruence assumptions are discharged by TLiftK. Preserve all quantifiers and both local branches.
HANDOFF TO: integration, theta, character-box and audit lanes. The two independent arithmetic inputs GeoOne and TLiftK and their CoreAll/Row0 conversion are now mapped. No physical research files changed.



---

## Appendix 2: specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md
Working-repo blob cfbb71f3c6ed91a29acbca54a16961d501cfc3d1.

# Literature provenance audit — RUN 1, 2026-11-24

**REVIEW / SOURCE-MATCHED; OPEN full translation.** Separate from physics. No kernel verification executed in this session, no URT speed claim, no new axiom, no gate change.

Pinned upstream leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005; adapter [source](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean) blob a13ba1f8c38d4dbf2ddd809fbf9610a007936c24. Current main observed d27f71347abceb76cd37dc8a5fccbe556ec2be90; same path blob f4f6eb32f04c91b5cde32f11631828eb4016fa7f. Use original pin for all numbered entries.

Preflight: read swarm protocol, handoff, expansion, AGENTS, continuity, research state, proper runner log/protocol, CI summary and peer checkpoint extracts (dependencies, integration, character boxes, Galois, theta, kernel, acceleration, prime, Landau, math, structure). No prior literature lane file in branch tree. Prior physical CI PASS run 45347447866 at 07:43:18 UTC; not an RH certificate. No baseline Queue or protected files changed.

## 1. Distinguish named literature from axioms

The package `UpperTheory.LiteratureTheorems.OpenLiteratureStatements` is a proposition-valued structure (adapter L215–218), not an axiom declaration. It has three fields: `caraianiLocalGlobalDual : UpperTheory.One.M.Row`, `localLanglandsExists : UpperTheory.Zero.LLC.RecTExists`, `galoisRepOfPolarizedPairLit : UpperTheory.One.M.Row`. In particular, the first and third fields have the SAME Row type; they are not, merely by their names, the full propositions `GlobalTheory.Published.CaraianiLocalGlobalDual` or `PositivityTheory.Lit1.GRPP.GaloisRepOfPolarizedPairLit`. The record is inhabited in the actual call chain; not a hypothesis of the final RH statement.

`src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean` blob ee340012ab19713a8acfecf8adc6a331cbc2f1a4 L7–11: `everyCharacter_of_row` assumes a particular `Row0b` witness h, constructs O as the three values h, recTExists, h, and separately supplies `vwin_of_row h`. `everyCharacter` supplies h via `UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter`. No independent second Row assumption. Preserve both field projections and the separate VWin obligation. This is not a proof that the Row or RecTExists constructions are simple; their obligations must be expanded, not deleted.

Four direct literal field readers in the adapter:

| L | Theorem suffix | Field | Source role |

|---:|---|---|---|

| 283 | local_langlands_recT_exists_of_literature | localLanglandsExists | returns the field itself |

| 285 | pair_u_of_literature | galoisRepOfPolarizedPairLit | applies field_of_starFull_alt with additional local Langlands, converse and exhaustion premises |

| 459 | carU_local_global_of_literature | caraianiLocalGlobalDual | applies ofDual_star_alt with rigidity/multiplicity/boundedness inputs |

| 609 | literature_automorphy | caraianiLocalGlobalDual | constructs a record with named additional obligations; not just projection |

All four occur in the explicit qualified-name closure of the local final adapter. Original L313–314 `local_langlands_gl_recT_exists_of_literature` calls `llOf_alt` with 12 explicit inputs (including the local Langlands existence projection); those other obligations cannot be removed solely because an input has the same conclusion type. At observed current head the corresponding name is an alias of the projection wrapper, not the original 12-input body. This is a concrete upstream source simplification, NOT a demonstrated equivalence of all old and new reachable proof terms. Do not silently mix revisions.

## 2. Auditable producer / assumption ledger (selected actual imports)

All paths below relative to `src/Development/` at pinned revision. Classify the declaration syntax and source dependency, not a theorem's historical authorship. Source names are not bibliographic evidence.

| Path / blob | Classification and exact relevant obligations |

|---|---|

| AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/RecTExists.lean / 268786576f96cb5a2cea5fab2da4cf4f291c1116 | L21–66 `theorem recTExists : RecTExists := by`: constructs Artin datum a via artEx, cuspidal map r via cuspEx, extension rc via exists_isLExt; fills dim, one, langlands, cusp, nu, absCentral, twist, central, dual, inj, depth, type fields. No declaration-level extra premise. Retain all twelve fields and dependency proofs. Not an externally postulated axiom at this source boundary. |

| AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean / f769999ac5e49241993e5efbf81e4d2cded18acd | L6 theorem `galoisLocalGlobalStrong_recParameter : Row0b recT` applies galoisRepresentations_of_thetaLift to tLiftK. No extra source hypothesis at this declaration. Both producers still require expansion; Galois lane owns them. |

| AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/CaraianiLocalGlobalDual.lean / b3ff07fbd208eea125eccc13f29f31ed3744f018 | L18 `def ... : Prop`: defines a universally quantified assertion for CM number field, algebraic closure, prime l, comparison embedding, rank a≥2, cuspidal representation, conjugate-duality and cohomological premises; asks for a continuous semisimple Galois representation, away-l WD matching and local potentially semistable/WD matching under the specified local bridges. A proposition definition, not an inhabitation proof or axiom. Not identical by name to O's Row field. Citation equivalence to a published theorem not established here. |

| WeilBound/CoreStatements/PublishedTheorems/PolarizedGaloisRepresentations/GaloisRepOfPolarizedPairLit.lean / 38f7e1a7956f0e6ac5fbd94900e965bf25c438c6 | L5 `def ... : Prop := GlobalTheory.Published.PolarizedGaloisRepPublished`: definitional alias, no evidence of truth by itself. |

| AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/PolarizedGaloisRepPublished.lean / 4791e8bac2cacc067368c1ef336387541d7acb7c | L16–70 structures Above and Props plus L64–71 proposition definition: CM field/closure, l prime, a≥1, regular algebraic polarized cuspidal pair; existential r, wt, HT; retain continuity, semisimplicity, polarization, away-l matching, purity, weight and conjugate-weight conditions, above-l de Rham/jumps/Iwahori/spherical conditions. Definition and record types, not supplied axiom. Exact published-source attribution OPEN. |

| AbelianVarietyTheory/PublishedTheorems/Divisors₂/GrothendieckDeformation.lean / 88188d49a09a09565265ef1e83f9a91335cafec4 | L12–15 proposition definition with commutative R, ideal I, nilpotent divided powers, surjection to R₀ with kernel I. L21–27 and L31–36 derive GrothendieckMessing and at_dualNumber respectively **from H : GrothendieckDeformation**. These are conditional theorem bodies, not proof of H. Adapter L405 instead calls grothendieckDeformation_of_lifting on the abelian de Rham and lifting producers. Follow that separate producer. |

| WeilBound/CoreStatements/PublishedTheorems/ClozelPurity/Bridge.lean / acdc20a9470643d48c08b07e2e204a630cc0d2b9 | L6–7 theorem clozelPurity applies clozelPurity_of_bounded to CompanionTheory.CuspFinGL.cuspFormsBoundedGL. Explicit theorem application, not literature axiom. |

| WeilBound/CoreStatements/TemperedRepresentationTheory/ClozelPurity/ClozelPurityOfBounded.lean / 0f9d3ef28325a8b392146d12b4a4423fa55e09cb | L10–12 theorem clozelPurity_of_bounded is a conditional implication CuspFormsBoundedGL → ClozelPurity, supplying infChar witnesses and using CompanionTheory.ClozelPurity.purity. Need its proof and the bound's producer before condensing this branch. |

Important: the selected files above are not a census of every imported PublishedTheorems module. Their citation claims and semantic equivalence to traditional literature must be checked against exact mathematical definitions, hypotheses and theorem statements before attributing them to the named authors. Do not assume a name is a proof or an external axiom.

## 3. Complete lexical adapter ledger

Executed in the connector JavaScript runtime on the actual fetched original source. 815 split lines, 195 explicitly named theorem declarations; 311 deduplicated directed edges between them, 17 direct local neighbours of the final adapter, all 195 reachable by explicit qualified-name scanning, 152 bodies with no literal O token, 43 with O token (including forwarders and records), four direct field readers, three distinct literal field names, zero unmatched qualified LiteratureTheorems references. Distinguish 311 unique source edges from use multiplicity (e.g. two projections of the same conjunction). These counts are for this single file, not the full proof. `no O token` means syntactically unused in the explicit body, not an elaborated dependency/semantic independence proof. No explicit `axiom`, `constant`, `sorry`, or `admit` token detected by prior line scan within this adapter; not a transitive axiom audit.

Rows below identify the full set of declarations and their local source dependencies. Every row has status SOURCE-MATCHED only; all external/implicit edges and publication attributions OPEN until audited. O = parameter mentioned in explicit source body; Fields = literal O.field accesses. Source ranges identify original declarations; blank columns mean no match, not absence of elaborated dependency.

| Lines | Declaration suffix (UpperTheory.LiteratureTheorems) | O | Fields | Local qualified dependency suffixes |

|---|---|---|---|---|

| 219–220 | logDerivOne | no | — | — |

| 221–222 | ellipticMainTheoremCM' | no | — | — |

| 223–224 | heckeTateFunctionalEquation' | no | — | — |

| 225–226 | hilbertClassFieldJ' | no | — | — |

| 227–228 | partial_zeta_functional_equation_of_literature | no | — | — |

| 229–230 | deligne_ribet_of_literature | no | — | — |

| 231–232 | siegel_klingen_deligne_ribet_of_literature | yes | — | deligne_ribet_of_literature |

| 233–234 | join_out_of_literature | yes | — | ellipticMainTheoremCM', hilbertClassFieldJ', siegel_klingen_deligne_ribet_of_literature, partial_zeta_functional_equation_of_literature, heckeTateFunctionalEquation' |

| 235–236 | ht_card_of_literature | no | — | — |

| 237–238 | ab_mul_n_st_of_literature | no | — | — |

| 239–240 | abelian_de_rham_of_literature | no | — | — |

| 241–242 | de_rham_pot_semistable_of_literature | no | — | — |

| 243–244 | global_artin_reciprocity_of_literature | no | — | — |

| 245–246 | hecke_l_adic_character_de_rham_of_literature | no | — | — |

| 247–248 | algebraic_character_wd_of_literature | yes | — | global_artin_reciprocity_of_literature, hecke_l_adic_character_de_rham_of_literature, de_rham_pot_semistable_of_literature |

| 249–250 | ar_calc_of_literature | no | — | — |

| 251–252 | ar_degree_of_literature | no | — | — |

| 253–254 | principalisation_of_literature | no | — | — |

| 255–256 | arith_hilbert_samuel_of_literature | yes | — | principalisation_of_literature |

| 257–258 | automorphic_forms_finite_gl_of_literature | no | — | — |

| 259–260 | base_change_isobaric | no | — | — |

| 261–262 | base_change_definite_unitary_group_of_literature | yes | — | base_change_isobaric |

| 263–264 | bernstein_unitary_product_irreducible_of_literature | no | — | — |

| 265–266 | bernstein_zelevinsky_finiteness_of_literature | no | — | — |

| 267–268 | bhatt_scholze_integral_of_literature | no | — | — |

| 269–270 | bhatt_scholze_crystalline_lattices_of_literature | yes | — | bhatt_scholze_integral_of_literature |

| 271–272 | bloch_kato_local_of_literature | no | — | — |

| 273–274 | borel_casselman_of_literature | no | — | — |

| 275–276 | brauer_degree_zero_of_literature | no | — | — |

| 277–278 | cm_curve_good_outside_prime_st_of_literature | no | — | — |

| 279–280 | ess_square_integrable_segments_of_literature | no | — | — |

| 281–282 | local_converse_gl_of_literature | no | — | — |

| 283–284 | local_langlands_recT_exists_of_literature | yes | localLanglandsExists | — |

| 285–286 | pair_u_of_literature | yes | galoisRepOfPolarizedPairLit | local_langlands_recT_exists_of_literature, local_converse_gl_of_literature |

| 287–288 | cusp_forms_bounded_gl_of_literature | no | — | — |

| 289–290 | jacquet_shalika_rigidity_of_literature | no | — | — |

| 291–292 | gelfand_kazhdan_dual_of_literature | yes | — | jacquet_shalika_rigidity_of_literature, cusp_forms_bounded_gl_of_literature |

| 293–294 | generic_unlinked_gl_of_literature | no | — | — |

| 295–296 | chevalley_units_of_literature | no | — | — |

| 297–298 | geometric_restriction_of_literature | no | — | — |

| 299–300 | grothendieck_ring_polynomial_of_literature | no | — | — |

| 301–302 | segment_representation_of_literature | no | — | — |

| 303–304 | zelevinsky_polynomial_ring_of_literature | yes | — | segment_representation_of_literature, grothendieck_ring_polynomial_of_literature |

| 305–306 | depth_zero_induction_of_literature | yes | — | geometric_restriction_of_literature, bernstein_zelevinsky_finiteness_of_literature, zelevinsky_polynomial_ring_of_literature |

| 307–308 | langlands_exhaustion_gl_of_literature | no | — | — |

| 309–310 | langlands_multisegments_of_literature | no | — | — |

| 311–312 | standard_cosocle_gl_of_literature | no | — | — |

| 313–314 | local_langlands_gl_recT_exists_of_literature | yes | — | local_langlands_recT_exists_of_literature, local_converse_gl_of_literature, depth_zero_induction_of_literature, brauer_degree_zero_of_literature, chevalley_units_of_literature, global_artin_reciprocity_of_literature, langlands_exhaustion_gl_of_literature, langlands_multisegments_of_literature, standard_cosocle_gl_of_literature, zelevinsky_polynomial_ring_of_literature, geometric_restriction_of_literature, bernstein_zelevinsky_finiteness_of_literature |

| 315–316 | irreducible_admissible_gl_of_literature | no | — | — |

| 317–318 | standard_functors_finite_length_of_literature | no | — | — |

| 319–320 | tempered_product_of_square_integrable_of_literature | yes | — | geometric_restriction_of_literature, bernstein_zelevinsky_finiteness_of_literature, irreducible_admissible_gl_of_literature, standard_functors_finite_length_of_literature, langlands_exhaustion_gl_of_literature, standard_cosocle_gl_of_literature, langlands_multisegments_of_literature, ess_square_integrable_segments_of_literature |

| 321–322 | casselman_wallach_of_literature | no | — | — |

| 323–324 | chebotarev_degree_one_of_literature | no | — | — |

| 325–326 | chow_form_exists_of_literature | no | — | — |

| 327–328 | clozel_cohomological_of_literature | no | — | — |

| 329–330 | clozel_purity_of_literature | no | — | — |

| 331–332 | complex_multiplication_j_st_of_literature | no | — | — |

| 333–334 | cusp_bounded_of_literature | no | — | — |

| 335–336 | cusp_decay_bound_of_literature | no | — | — |

| 337–338 | cusp_decay_sobolev_of_literature | no | — | — |

| 339–340 | cusp_rapid_decay_of_literature | no | — | — |

| 341–342 | cusp_trace_class_of_literature | no | — | — |

| 343–344 | cuspidal_mirabolic_of_literature | no | — | — |

| 345–346 | cuspidal_spectrum_gl_of_literature | no | — | — |

| 347–348 | cycle_heights_of_literature | no | — | — |

| 349–350 | depth_zero_jacquet_injective_of_literature | no | — | — |

| 351–352 | depth_zero_support_of_literature | no | — | — |

| 353–354 | discrete_series_classification_of_literature | no | — | — |

| 355–356 | discrete_series_cover_of_literature | no | — | — |

| 357–358 | discrete_series_cover_exists_of_literature | no | — | — |

| 359–360 | discrete_series_exists_of_literature | no | — | — |

| 361–362 | discrete_series_hermitian_unique_of_literature | no | — | — |

| 363–364 | discrete_series_lowest_k_type_of_literature | no | — | — |

| 365–366 | discrete_series_upq_exists_of_literature | no | — | — |

| 367–368 | dixmier_malliavin_factorisation_of_literature | no | — | — |

| 369–370 | siegel_eisenstein_continuation_of_literature | no | — | — |

| 371–372 | doubling_method | yes | — | cusp_rapid_decay_of_literature, siegel_eisenstein_continuation_of_literature |

| 373–374 | flath_tensor_product_of_literature | no | — | — |

| 375–376 | unitary_irreducible_admissible_of_literature | no | — | — |

| 377–378 | flath_factorisation_of_literature | yes | — | flath_tensor_product_of_literature, unitary_irreducible_admissible_of_literature |

| 379–380 | fontaine_bcris_of_literature | no | — | — |

| 381–382 | formal_algebraisation_of_literature | no | — | — |

| 383–384 | formal_degree_compact_dual_of_literature | no | — | — |

| 385–386 | gk_globalisation_of_literature | no | — | — |

| 387–388 | gl_howe_duality_of_literature | no | — | — |

| 389–390 | cusp_u_of_literature | yes | — | gelfand_kazhdan_dual_of_literature, pair_u_of_literature |

| 391–392 | generic_unitary_dual_gl_of_literature | no | — | — |

| 393–394 | geometric_restriction_filtration_of_literature | no | — | — |

| 395–396 | good_chern_weil_of_literature | no | — | — |

| 397–398 | green_cuspidal_of_literature | no | — | — |

| 399–400 | green_regular_characters_of_literature | no | — | — |

| 401–402 | green_series_st_of_literature | no | — | — |

| 403–404 | abelian_lifting_of_literature | no | — | — |

| 405–406 | grothendieck_deformation_of_literature | yes | — | abelian_de_rham_of_literature, abelian_lifting_of_literature |

| 407–408 | grothendieck_messing_of_literature | yes | — | grothendieck_deformation_of_literature |

| 409–410 | principal_polarisation_one_section_of_literature | no | — | — |

| 411–412 | harish_chandra_analyticity_of_literature | no | — | — |

| 413–414 | harish_chandra_finite_of_literature | no | — | — |

| 415–416 | harish_chandra_modules_of_literature | no | — | — |

| 417–418 | hasse_norm_st_of_literature | no | — | — |

| 419–420 | hecke_l_adic_character_of_literature | no | — | — |

| 421–422 | hecke_l_adic_character_crystalline_of_literature | yes | — | hecke_l_adic_character_de_rham_of_literature, de_rham_pot_semistable_of_literature, algebraic_character_wd_of_literature, local_langlands_gl_recT_exists_of_literature |

| 423–424 | hecke_l_adic_character_above_of_literature | yes | — | hecke_l_adic_character_de_rham_of_literature, hecke_l_adic_character_crystalline_of_literature, de_rham_pot_semistable_of_literature |

| 425–426 | hecke_l_adic_parameter_above_of_literature | yes | — | algebraic_character_wd_of_literature |

| 427–428 | hecke_l_entire_and_nonzero_at_one_of_literature | no | — | — |

| 429–430 | hecke_l_partial_continuation_of_literature | no | — | — |

| 431–432 | hermitian_hasse_principle_of_literature | no | — | — |

| 433–434 | hermitian_local_global_of_literature | no | — | — |

| 435–436 | holomorphic_discrete_series_of_literature | no | — | — |

| 437–438 | howe_duality_real_of_literature | no | — | — |

| 439–440 | ideal_invariants_one_orbit_st_of_literature | no | — | — |

| 441–442 | induced_simple_lowest_alcove_of_literature | no | — | — |

| 443–444 | jacquet_shalika_of_literature | no | — | — |

| 445–446 | k_finite_vectors_unitary_of_literature | no | — | — |

| 447–448 | kawamata_viehweg_of_literature | no | — | — |

| 449–450 | kudla_splitting_split_unitary_of_literature | no | — | — |

| 451–452 | l2_extension_log_canonical_of_literature | no | — | — |

| 453–454 | landherr_st_of_literature | no | — | — |

| 455–456 | linnik_of_literature | no | — | — |

| 457–458 | cuspidal_multiplicity_one_of_literature | no | — | — |

| 459–460 | carU_local_global_of_literature | yes | caraianiLocalGlobalDual | jacquet_shalika_rigidity_of_literature, cuspidal_multiplicity_one_of_literature |

| 461–462 | carU_above_l_of_literature | yes | — | automorphic_forms_finite_gl_of_literature, local_langlands_gl_recT_exists_of_literature, carU_local_global_of_literature |

| 463–464 | metaplectic_representation_of_literature | no | — | — |

| 465–466 | moy_prasad_jacquet_iso_of_literature | no | — | — |

| 467–468 | nadel_vanishing_and_non_klt_divisor_of_literature | no | — | — |

| 469–470 | nef_numerics_of_literature | no | — | — |

| 471–472 | point_separation_pair_of_literature | no | — | — |

| 473–474 | poitou_tate_normalised_of_literature | no | — | — |

| 475–476 | prismatic_dieudonne_hodge_of_literature | no | — | — |

| 477–478 | quadratic_class_field_theory_of_literature | no | — | — |

| 479–480 | radford_shuffle_polynomial_of_literature | no | — | — |

| 481–482 | siegel_weil_unitary_convergent_of_literature | no | — | — |

| 483–484 | weil_theta_convergence_of_literature | no | — | — |

| 485–486 | rallis_inner_product_convergent_of_literature | yes | — | doubling_method, siegel_weil_unitary_convergent_of_literature, weil_theta_convergence_of_literature |

| 487–488 | ray_character_artin_of_literature | yes | — | global_artin_reciprocity_of_literature |

| 489–490 | ray_class_field_st_of_literature | no | — | — |

| 491–492 | real_metaplectic_representation_of_literature | no | — | — |

| 493–494 | regular_algebraic_purity_of_literature | yes | — | clozel_purity_of_literature, clozel_cohomological_of_literature |

| 495–496 | schur_orthogonality_square_integrable_of_literature | no | — | — |

| 497–498 | semi_abelian_hom_extension_of_literature | no | — | — |

| 499–500 | semi_abelian_lie_seminegative_of_literature | no | — | — |

| 501–502 | semistable_reduction_st_of_literature | no | — | — |

| 503–504 | serre_holomorphic_sections_of_literature | no | — | — |

| 505–506 | siegel_eisenstein_simple_pole | no | — | — |

| 507–508 | siegel_set_unitary_of_literature | no | — | — |

| 509–510 | siegel_toroidal_integral_of_literature | no | — | — |

| 511–512 | siegel_weil_unitary_schrodinger_of_literature | no | — | — |

| 513–514 | square_integrable_segment_of_literature | yes | — | ess_square_integrable_segments_of_literature |

| 515–516 | stone_von_neumann_of_literature | no | — | — |

| 517–518 | strong_approx_su_of_literature | no | — | — |

| 519–520 | theta_rational_invariance_of_literature | no | — | — |

| 521–522 | toroidal_compactification_of_literature | no | — | — |

| 523–524 | toroidal_for_fan_ks_of_literature | no | — | — |

| 525–526 | totally_disjoint_product_irreducible_of_literature | no | — | — |

| 527–528 | unlinked_product_irreducible_of_literature | yes | — | totally_disjoint_product_irreducible_of_literature |

| 529–530 | unramified_doubling_gl_of_literature | no | — | — |

| 531–532 | vol_ge_of_literature | yes | — | arith_hilbert_samuel_of_literature, ar_calc_of_literature, nef_numerics_of_literature |

| 533–534 | vol_nef_of_literature | yes | — | arith_hilbert_samuel_of_literature |

| 535–536 | weber_ray_field_st_of_literature | no | — | — |

| 537–538 | weil_representation_exists_of_literature | no | — | — |

| 539–540 | weil_representation_unitary_pair_of_literature | no | — | — |

| 541–542 | weil_siegel_formula_unitary_of_literature | no | — | — |

| 543–544 | weyl_branching_of_literature | no | — | — |

| 545–546 | dual_abelian_scheme_of_literature | no | — | — |

| 547–548 | zarhin_statement | yes | — | dual_abelian_scheme_of_literature |

| 549–550 | fargues_exact_of_literature | no | — | — |

| 551–552 | nef_rr_of_literature | no | — | — |

| 553–554 | poincare_lelong_inv_of_literature | no | — | — |

| 555–556 | principalisation_char_zero_of_literature | no | — | — |

| 557–558 | resolution_char_zero_of_literature | no | — | — |

| 559–560 | cheb_of_literature | no | — | — |

| 561–562 | eis_bl_of_literature | no | — | — |

| 563–564 | siegel_weil_std_of_literature | no | — | — |

| 565–566 | theta_integrals_agree_and_local_matching_of_literature | yes | — | eis_bl_of_literature, siegel_weil_std_of_literature |

| 567–568 | global_euler_char_of_literature | no | — | — |

| 569–570 | global_finiteness_of_literature | no | — | — |

| 571–572 | localEulerChar_alt_alt | no | — | — |

| 573–574 | local_finiteness_of_literature | no | — | — |

| 575–576 | local_tate_duality_of_literature | no | — | — |

| 577–578 | greenberg_wiles_of_literature | yes | — | poitou_tate_normalised_of_literature, global_euler_char_of_literature, local_tate_duality_of_literature, localEulerChar_alt_alt, local_finiteness_of_literature |

| 579–580 | unramified_orthogonality_of_literature | no | — | — |

| 581–582 | siegelWeilU_unitary_convergent_of_literature | no | — | — |

| 583–584 | local_euler_char_k_of_literature | no | — | — |

| 585–586 | local_finiteness_k_of_literature | no | — | — |

| 587–588 | local_tate_duality_k_of_literature | no | — | — |

| 589–608 | literature_local | yes | — | bernstein_zelevinsky_finiteness_of_literature, bernstein_unitary_product_irreducible_of_literature, geometric_restriction_of_literature, zelevinsky_polynomial_ring_of_literature, totally_disjoint_product_irreducible_of_literature, moy_prasad_jacquet_iso_of_literature, tempered_product_of_square_integrable_of_literature, ess_square_integrable_segments_of_literature, square_integrable_segment_of_literature, generic_unlinked_gl_of_literature, langlands_multisegments_of_literature, langlands_exhaustion_gl_of_literature, standard_cosocle_gl_of_literature, local_langlands_recT_exists_of_literature, local_converse_gl_of_literature, depth_zero_induction_of_literature, brauer_degree_zero_of_literature, chevalley_units_of_literature, green_regular_characters_of_literature |

| 609–625 | literature_automorphy | yes | caraianiLocalGlobalDual | cusp_rapid_decay_of_literature, harish_chandra_finite_of_literature, automorphic_forms_finite_gl_of_literature, jacquet_shalika_of_literature, cuspidal_spectrum_gl_of_literature, base_change_isobaric, gelfand_kazhdan_dual_of_literature, pair_u_of_literature, clozel_purity_of_literature, clozel_cohomological_of_literature, global_artin_reciprocity_of_literature, ray_class_field_st_of_literature, hecke_l_adic_character_above_of_literature, algebraic_character_wd_of_literature, de_rham_pot_semistable_of_literature |

| 626–638 | literature_cohomology | yes | — | poitou_tate_normalised_of_literature, local_finiteness_of_literature, local_tate_duality_of_literature, localEulerChar_alt_alt, global_finiteness_of_literature, global_euler_char_of_literature, unramified_orthogonality_of_literature, greenberg_wiles_of_literature, local_finiteness_k_of_literature, local_tate_duality_k_of_literature, local_euler_char_k_of_literature, bloch_kato_local_of_literature |

| 639–644 | literature_nonexistence | yes | — | literature_local, literature_automorphy, literature_cohomology, join_out_of_literature, heckeTateFunctionalEquation' |

| 645–657 | published_results_analytic | yes | — | weil_representation_unitary_pair_of_literature, discrete_series_exists_of_literature, harish_chandra_analyticity_of_literature, discrete_series_classification_of_literature, cusp_trace_class_of_literature, dixmier_malliavin_factorisation_of_literature, flath_factorisation_of_literature, weil_siegel_formula_unitary_of_literature, doubling_method, unramified_doubling_gl_of_literature, hecke_l_partial_continuation_of_literature, ht_card_of_literature |

| 658–665 | published_results_local | yes | — | fontaine_bcris_of_literature, global_artin_reciprocity_of_literature, bloch_kato_local_of_literature, local_tate_duality_k_of_literature, local_euler_char_k_of_literature, local_finiteness_k_of_literature, bhatt_scholze_integral_of_literature |

| 666–726 | published_results_eigen | yes | — | clozel_cohomological_of_literature, green_cuspidal_of_literature, hecke_l_adic_character_of_literature, chebotarev_degree_one_of_literature, cusp_u_of_literature, base_change_definite_unitary_group_of_literature, bhatt_scholze_crystalline_lattices_of_literature, hecke_l_adic_character_above_of_literature, cusp_rapid_decay_of_literature, weil_siegel_formula_unitary_of_literature, siegel_weil_unitary_convergent_of_literature, doubling_method, unramified_doubling_gl_of_literature, bernstein_zelevinsky_finiteness_of_literature, formal_degree_compact_dual_of_literature, bernstein_unitary_product_irreducible_of_literature, geometric_restriction_filtration_of_literature, unlinked_product_irreducible_of_literature, depth_zero_jacquet_injective_of_literature, jacquet_shalika_of_literature, automorphic_forms_finite_gl_of_literature, carU_above_l_of_literature, regular_algebraic_purity_of_literature, global_artin_reciprocity_of_literature, hecke_l_adic_parameter_above_of_literature, de_rham_pot_semistable_of_literature, harish_chandra_finite_of_literature, green_regular_characters_of_literature, zelevinsky_polynomial_ring_of_literature, ray_class_field_st_of_literature, ray_character_artin_of_literature, generic_unitary_dual_gl_of_literature, standard_cosocle_gl_of_literature, cheb_of_literature, discrete_series_cover_of_literature, harish_chandra_modules_of_literature, casselman_wallach_of_literature, weil_representation_unitary_pair_of_literature, discrete_series_exists_of_literature, discrete_series_classification_of_literature, strong_approx_su_of_literature, siegelWeilU_unitary_convergent_of_literature, harish_chandra_analyticity_of_literature, cusp_trace_class_of_literature, dixmier_malliavin_factorisation_of_literature, flath_factorisation_of_literature, cm_curve_good_outside_prime_st_of_literature, weber_ray_field_st_of_literature, discrete_series_cover_exists_of_literature, siegel_weil_unitary_schrodinger_of_literature, siegel_eisenstein_continuation_of_literature, siegel_eisenstein_simple_pole, schur_orthogonality_square_integrable_of_literature, literature_nonexistence, published_results_analytic, published_results_local, depth_zero_support_of_literature, local_finiteness_of_literature, local_tate_duality_of_literature, localEulerChar_alt_alt |

| 727–780 | published_results_first | yes | — | green_series_st_of_literature, linnik_of_literature, complex_multiplication_j_st_of_literature, cuspidal_mirabolic_of_literature, weyl_branching_of_literature, bernstein_unitary_product_irreducible_of_literature, zelevinsky_polynomial_ring_of_literature, bernstein_zelevinsky_finiteness_of_literature, cusp_trace_class_of_literature, flath_factorisation_of_literature, weil_siegel_formula_unitary_of_literature, rallis_inner_product_convergent_of_literature, doubling_method, unramified_doubling_gl_of_literature, hermitian_local_global_of_literature, quadratic_class_field_theory_of_literature, borel_casselman_of_literature, radford_shuffle_polynomial_of_literature, dixmier_malliavin_factorisation_of_literature, schur_orthogonality_square_integrable_of_literature, hecke_l_partial_continuation_of_literature, logDerivOne, k_finite_vectors_unitary_of_literature, discrete_series_lowest_k_type_of_literature, holomorphic_discrete_series_of_literature, gk_globalisation_of_literature, cusp_bounded_of_literature, strong_approx_su_of_literature, hecke_l_entire_and_nonzero_at_one_of_literature, real_metaplectic_representation_of_literature, cusp_decay_bound_of_literature, gl_howe_duality_of_literature, kudla_splitting_split_unitary_of_literature, metaplectic_representation_of_literature, harish_chandra_modules_of_literature, discrete_series_cover_of_literature, ideal_invariants_one_orbit_st_of_literature, hermitian_hasse_principle_of_literature, stone_von_neumann_of_literature, discrete_series_upq_exists_of_literature, formal_degree_compact_dual_of_literature, theta_rational_invariance_of_literature, discrete_series_hermitian_unique_of_literature, discrete_series_exists_of_literature, harish_chandra_finite_of_literature, cusp_rapid_decay_of_literature, weil_representation_unitary_pair_of_literature, discrete_series_cover_exists_of_literature, cusp_decay_sobolev_of_literature, casselman_wallach_of_literature, howe_duality_real_of_literature, siegel_set_unitary_of_literature, weil_representation_exists_of_literature |

| 781–809 | published_results_arithmetic | yes | — | toroidal_compactification_of_literature, vol_ge_of_literature, vol_nef_of_literature, ar_calc_of_literature, abelian_de_rham_of_literature, ray_class_field_st_of_literature, semistable_reduction_st_of_literature, strong_approx_su_of_literature, green_series_st_of_literature, good_chern_weil_of_literature, landherr_st_of_literature, hasse_norm_st_of_literature, semi_abelian_hom_extension_of_literature, induced_simple_lowest_alcove_of_literature, principal_polarisation_one_section_of_literature, ab_mul_n_st_of_literature, grothendieck_messing_of_literature, prismatic_dieudonne_hodge_of_literature, kawamata_viehweg_of_literature, nef_numerics_of_literature, l2_extension_log_canonical_of_literature, arith_hilbert_samuel_of_literature, chow_form_exists_of_literature, cycle_heights_of_literature, serre_holomorphic_sections_of_literature, nadel_vanishing_and_non_klt_divisor_of_literature, principalisation_of_literature, formal_algebraisation_of_literature |

| 810–813 | every_character_of_literature_of_vWin | yes | — | published_results_eigen, published_results_first, theta_integrals_agree_and_local_matching_of_literature, resolution_char_zero_of_literature, principalisation_char_zero_of_literature, poincare_lelong_inv_of_literature, fargues_exact_of_literature, zarhin_statement, nef_rr_of_literature, siegel_toroidal_integral_of_literature, toroidal_for_fan_ks_of_literature, semi_abelian_lie_seminegative_of_literature, point_separation_pair_of_literature, ar_degree_of_literature, published_results_arithmetic, grothendieck_deformation_of_literature, local_langlands_gl_recT_exists_of_literature |

## 4. Independent verification boundary

Read Andrew Sutherland's 2026-11-24 03:30 UTC report and the underlying audit log at https://math.mit.edu/~drew/grh/ and https://math.mit.edu/~drew/grh/audit.log; Lean FRO/Mathlib joint statement 2026-11-21 https://leanprover-community.github.io/blog/posts/riemann-hypothesis/. The published submission's five headline theorems were reported to use only propext, Classical.choice and Quot.sound; audit.log identifies 15 axiom constants in its entire environment, all Init, including the unused sorryAx. The theorem axiom closure is not the whole environment list. Independent kernels and statement comparison are reported successful. The public report does not substitute for our source-linked explanation or our own export/commit correspondence check. Do not label all named literature lemmas as separately kernel-audited from this report; no local Lean executable/kernel run or downloaded export in this lane.

## 5. Reproduction and actual checks

Below is the exact census/check logic executed here, with a standalone Node driver for replay. It is an intentionally source-format-specific scanner, not a Lean parser: it recognizes explicit fully qualified names and literal O.field tokens; comments, macros, local notation, implicit references and alias evolution require a kernel export or more general parser. The standalone driver is supplied for reproducibility; not separately executed in this session. Checkout the pinned commit and run with the adapter path. It verifies the raw Git blob SHA before scanning.

```js

import {readFileSync} from 'node:fs';

import {createHash} from 'node:crypto';

function census(s){
 const lines=s.split("\n"), starts=[];
 for(let i=0;i<lines.length;i++){const m=lines[i].match(/^theorem UpperTheory\.LiteratureTheorems\.([^\s(]+)/u);if(m)starts.push({name:m[1],i});}
 const names=new Set(starts.map(x=>x.name));
 const rows=starts.map(({name,i})=>{
  let j=i+1;while(j<lines.length&&!/^(?:theorem |def |structure |alias |namespace |end\b|section\b|open |set_option |noncomputable|private |@\[)/u.test(lines[j]))j++;
  const m=lines[i].match(/^(.*?)(?: :=\s*| where\s*)$/u);if(!m)throw Error("unrecognized declaration "+lines[i]);
  const body=lines.slice(i+1,j).join("\n");
  const refs=[...new Set([...body.matchAll(/(?:_root_\.)?UpperTheory\.LiteratureTheorems\.([\p{L}\p{N}_']+)/gu)].map(x=>x[1]))];
  return {name,line:i+1,end:j,refs:refs.filter(x=>names.has(x)),unmatched:refs.filter(x=>!names.has(x)),fields:[...new Set([...body.matchAll(/\bO\.([\p{L}\p{N}_']+)/gu)].map(x=>x[1]))],bodyO:/\bO\b/u.test(body)};
 });
 const map=new Map(rows.map(r=>[r.name,r])),reachable=new Set(),todo=["every_character_of_literature_of_vWin"];
 while(todo.length){const n=todo.pop();if(reachable.has(n))continue;const row=map.get(n);if(!row)throw Error("missing "+n);reachable.add(n);todo.push(...row.refs);}
 const summary={wrappers:rows.length,edges:rows.reduce((n,x)=>n+x.refs.length,0),without_explicit_O:rows.filter(x=>!x.bodyO).length,with_explicit_O:rows.filter(x=>x.bodyO).length,explicit_field_read:rows.filter(x=>x.fields.length).map(x=>({name:x.name,line:x.line,fields:x.fields,reachable:reachable.has(x.name)})),root_reachable_local_wrappers:reachable.size,root_local_edges:rows.filter(x=>reachable.has(x.name)).reduce((n,x)=>n+x.refs.length,0),root_direct:map.get("every_character_of_literature_of_vWin").refs,unmatched:rows.flatMap(x=>x.unmatched)};
 return {rows,summary};
}

function check(x){
 const q=x.summary;
 if(q.wrappers!==195||q.edges!==311||q.without_explicit_O!==152||q.with_explicit_O!==43||q.root_reachable_local_wrappers!==195||q.root_local_edges!==311||q.explicit_field_read.length!==4||q.unmatched.length!==0||q.root_direct.length!==17)throw Error("unexpected census");
 const expected=["caraianiLocalGlobalDual","galoisRepOfPolarizedPairLit","localLanglandsExists"];
 if(JSON.stringify([...new Set(q.explicit_field_read.flatMap(r=>r.fields))].sort())!==JSON.stringify(expected))throw Error("unexpected literal field set");
 if(q.explicit_field_read.some(r=>!r.reachable))throw Error("missing field-reader reachability");
}

const raw=readFileSync(process.argv[2]);

const sha=createHash('sha1').update(Buffer.from('blob '+raw.length+'\0')).update(raw).digest('hex');

if(sha!=='a13ba1f8c38d4dbf2ddd809fbf9610a007936c24') throw Error('unexpected Git blob '+sha);

const result=census(raw.toString('utf8')); check(result); console.log(JSON.stringify(result.summary,null,2));

```

Executed assertions: exact original blob returned by GitHub, 195/311/152/43 counts, 195 root closure, 17 root direct dependencies, four direct field-reader rows, exact three-field set, zero unmatched local qualified references; current blob and alias change checked. All passed in connector runtime. No compile/test of generated Lean proof; no new physical CI claim. No assumption removed. Runtime complexity of this scoped lexical census is linear in scanned source plus local name/edge storage, subject to string regex/hash costs. Not measured as a proof speedup.

## RESUME HERE

Fetch the actual pinned producer for `GlobalTheory.Published.grothendieckDeformation_of_lifting` by following the adapter's imports (start at the CanonicalOfAbelianDeRham and abelian lifting dependencies); extract its exact two input types, construct a source-linked proof tree down to their producers, and compare the formal target with the historical Grothendieck–Messing theorem under the exact nilpotent divided-power hypotheses. Use this ledger's canonical names rather than translating all 195 interfaces again; coordinate with positivity and audit. Continue until citation and kernel reachability boundaries are closed; do not infer missing proof from a publication's title.

HANDOFF TO: integration, formal audit, positivity geometry, kernel extractor, human proof editor. Record this file as 195 local source declarations/311 edges, no kernel graph expansion claimed; field witnesses and selected PublishedTheorems type/proof distinctions available for reuse.


---

## Appendix 3: math/2026-11-24_every_character_adapter_derivation.md
Working-repo blob 4839d4327ffba33469443bc50fac59778155aa33.

# MATH lane: the exact seven-input `EveryCharacter` adapter

## RESULT

At upstream revision `40e56bab026552e089d7afcfeff08d2defb9c005`, the theorem
`UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin` is now traced through the
exact adapter that it invokes.  The decisive source declaration is
`UpperTheory.Lit.every_character_of_theta_integrals_local_matching`, not `everyE₂`.

This is a **source-matched mathematical derivation**, not a new Lean proof and not a claim that the
upstream project has been re-elaborated here.  All theorem names, argument order, and intermediate
types below were read at the pinned revision.  The companion verifier checks the pinned Git blob
identities when run against a checkout of that revision and checks this checkpoint's required
provenance fields locally.

## Source ledger

| ID | Pinned source path | Git blob | Declaration(s) used |
|---|---|---|---|
| `EC-S1` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean` | `a13ba1f8c38d4dbf2ddd809fbf9610a007936c24` | lines 565, 666, 727, 810: theta pair, `published_results_eigen`, `published_results_first`, literature wrapper |
| `EC-S2` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/SiegelEisensteinSecondTermHypotheses.lean` | `42abe20ee235820aaa924dbabce5e1d2c2540380` | lines 44, 69: hypothesis-bundle constructor and seven-input adapter |
| `EC-S3` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/At23OfAll.lean` | `e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d` | lines 19, 21, 24: two/three-prime family bound and linked packaging |
| `EC-S4` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean` | `c51cb6b5bd4bf2944ace89e00a2990da16bd519a` | lines 12, 16: `ZeroFreeAll` and `EveryCharacter` discharge |
| `EC-S5` | `src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean` | `6ac769568b67f85f33565ba3e1eef7b91f53c55f` | line 13: exact definition of `UpperTheory.EveryCharacter` |
| `EC-S6` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean` | `0e1bad41f4b165c0d9b1693f419530309e1da5ba` | line 16: fifteen-premise construction of `CovolumeBoundOfX` |
| `EC-S7` | `src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean` | `ee340012ab19713a8acfecf8adc6a331cbc2f1a4` | final row-to-character and character-to-RH links |

## Correction to the existing interpretation

The earlier MATH/integration checkpoint treated `FockModels/EveryCharacterE.lean` as if the final
wrapper called `everyE₂` and `hypsE₂`.  That file is imported, and its proof has a parallel shape,
but it is **not the declaration called by the final literature wrapper**.

The actual call graph is:

1. `every_character_of_literature_of_vWin` (`EC-S1`);
2. `every_character_of_theta_integrals_local_matching` (`EC-S2`);
3. `nonempty_hyps_definite_side_of_closed_bound` (`EC-S2`), producing
   `Nonempty (GlobalTheory.Fc.HypsAlt S0.NL GlobalTheory.Fc.DefiniteSideCondition)`;
4. `every_character_of_green_v_win` (`EC-S4`);
5. `zero_free_all_of_green_v_win` followed by `UpperTheory.Top.imprimitive` (`EC-S4`);
6. the proposition `UpperTheory.EveryCharacter` (`EC-S5`).

Thus the final route uses `HypsAlt`, `DefiniteSideCondition`,
`BoundAtTwoThreeFamilyFonAlt`, and `every_character_of_green_v_win`.  Replacing these by the older
`Hyps`, `DRS`, `BoundAtTwoAndThreeForFamily`, and `plugAll` names loses the exact dependency path.

## The exact seven inputs

At `EC-S2:69`, with all quantification explicit, the theorem is:

\[
\begin{aligned}
&P : \mathrm{UnitaryGroupThirdPlaceHypotheses},\\
&F : \mathrm{ThetaLocalInputs},\\
&h_A : \mathrm{ThetaIntegralsAgree},\\
&h_M : \mathrm{LocalMatching},\\
&h_X : \mathrm{CovolumeBoundOfX},\\
&h_L : \mathrm{RecTExists},\\
&h_V : \mathrm{VWin}
\end{aligned}
\quad\Longrightarrow\quad
\mathrm{UpperTheory.EveryCharacter}.
\]

No argument is implicit in the wrapper call and none may be dropped:

1. `P` supplies the global unitary/Galois/analytic package, including
   `P.greenRegularCharacters`, `P.nLink`, `P.litN`, and the fields used to construct the row and
   interpolation data.
2. `F` supplies theta/local inputs used in functional separation, test-vector assembly, theta
   evaluation, and the grid construction.
3. `hA` is equality of the relevant theta integrals.
4. `hM` is the local matching assertion.  It is a separate premise even though the literature
   theorem constructs `hA ∧ hM` in one theorem.
5. `hX` is the covolume bound required by the linked-bundle `L3` step.
6. `hL` is existence of the local-Langlands recursive parameter package.
7. `hV` supplies the zero-free window for every character input to the character-box argument.

The conclusion means exactly (`EC-S5:13`):

\[
\forall N:\mathbb N,\ [\mathrm{NeZero}\ N],\ \forall \chi:\mathrm{DirichletCharacter}(\mathbb C,N),
\ \forall s:\mathbb C,
\quad \tfrac12<\Re(s)\to(\chi\ne1\lor s\ne1)\to L(\chi,s)\ne0.
\]

The exceptional disjunction is preserved: the theorem does not assert nonvanishing at the pole of
the trivial character.

## Derivation of the missing hypothesis bundle

The hard step is `nonempty_hyps_definite_side_of_closed_bound` (`EC-S2:44`).  Its first six
premises are `P,F,hA,hM,hX,hL`; it additionally requires

\[
\forall c_{\mathrm{dep}}\in\mathbb R,
\ \mathrm{RL.LinkedAt}\bigl(\mathrm{parametersOfDependence}(h_L,c_{\mathrm{dep}})\bigr)
\left(
 (Q,L)\mapsto\mathrm{R1.SlotNormCondition}(Q,L)
 \left(\mathcal C\mapsto\mathrm{Closed}(\mathcal C,
 (Fm\mapsto\mathrm{BoundAtTwoThreeFamilyFonAlt}(Fm)))\right)
\right).
\tag{1}
\]

The adapter discharges (1), without a new premise, by

```
fun cDep =>
  UpperTheory.N.boundAtTwoThree_linked_of_recT
    P.nLink
    (GlobalTheory.Mem.Top.Bl.parametersOfDependence hL cDep)
```

The two steps behind that lambda are explicit in `EC-S3`:

- `at23_family_alt P.nLink Fm` derives `BoundAtTwoThreeFamilyFonAlt Fm` for every family `Fm`
  from the local hypotheses at the primes two and three;
- `boundAtTwoThree_n_linked` packages this familywise statement as `RL.LinkedAt p (...)` by a row
  selected from a property closed for all families.  Instantiating `p` with
  `parametersOfDependence hL cDep` gives (1) for each real `cDep`.

This is the precise prime-window bridge.  It is not a numerical estimate inserted later and it is
not derivable from `VWin`; it is carried by `P.nLink` and universally quantified over the dependence
parameter.

Inside `nonempty_hyps_definite_side_of_closed_bound`, let `C := P.litN`.  The proof constructs:

1. `hS : FunctionalsSeparate` from `F`, the unramified Howe input, and
   `P.siegelWeilUnitaryConvergent`.
2. `hRat : S0.RowRat` from test-vector assembly using `F.siegelSetUnitary`,
   `F.howeDualityReal`, `P.greenCuspidal`, `C.join`, `C.fe`, `hA`, `hM`, and `hS`.
3. `hFit : ConstantFunctionFits` from the alternate Fourier-coefficient fit and the surjectivity/
   low-weight consequence of `P`.
4. A threshold `CF1` with
   `hCF1 : ∀ C ≥ CF1, EvLgG (GridA C)`, obtained from theta evaluation.  Here both `hA` and `hM`
   enter again, together with twisted Weil convergence, local-factor matching, and equality of
   twisted square theta integrals.
5. A threshold `CF0` with the row-function conclusion `hCF0` for all `C ≥ CF0`, obtained from
   `P.discreteSeriesCover`, `P.harishChandraModules`, `P.cuspRapidDecay`,
   `P.casselmanWallach`, `P.rayClassFieldSt`, and `hFit`.

The thresholds are synchronized by the actual choice

\[
C_*:=\max(CF0,CF1).
\]

This choice is logically necessary: `CF1 ≤ C_*` supplies
`hEv : EvLgG (GridA C_*)`, while `CF0 ≤ C_*` allows the row-function theorem to be evaluated at the
same grid.  The proof then constructs:

- `hOpen1`, the open-parameter assertion at
  `parametersOfDependence hL C_*`;
- `hMono`, the stronger-extension open/linked comparison, and `hOpenA := hMono.2 hOpen1`;
- `hFun`, the row function at `C_*`, using `hCF0` and `hOpenA`;
- `hL3`, the linked-bundles `L3` assertion, using the covolume premise `hX`, the same extension, and
  `hOpenA`;
- `hN C_*`, the instance of the universally linked two/three-prime bound (1).

These are exactly the final inputs to
`hypotheses_nonempty_of_unramified_exponents_alt`, which returns

\[
\mathrm{Nonempty}\bigl(
\mathrm{GlobalTheory.Fc.HypsAlt}(S0.NL,
\mathrm{GlobalTheory.Fc.DefiniteSideCondition})
\bigr).
\tag{2}
\]

This explains the difficult step rather than hiding it behind the name “theta correspondence”:
the proof aligns two independently obtained large-parameter thresholds, transports openness to a
linked extension, combines row-function and covolume/L3 data at that single parameter, and adds the
closed two/three-prime bound before constructing the hypothesis bundle.

## From the bundle to `EveryCharacter`

The adapter converts `P.greenRegularCharacters` to
`hG : GlobalTheory.GLq.Green` using `green_of_regular`, and feeds `hG`, `hV`, and (2) to
`every_character_of_green_v_win` (`EC-S4:16`).

The latter first proves `ZeroFreeAll` (`EC-S4:12`).  Given a witness of `HypsAlt`, it calls
`zeroFreeAll_of_topG` at the fixed exponent `la = 3/2`; the required inequality is discharged by
arithmetic.  The shape premise is produced from the witness by
`forall_goal_of_shape_of_hyps` and `shape_closed_link_n_of_green hG`.  For every character object
`ψ`, the remaining window obligation is supplied by `supplyChi ψ (hV ψ)`.

Finally, `UpperTheory.Top.imprimitive` transports the primitive/character-box zero-free statement
to arbitrary Dirichlet characters, yielding the quantified proposition above.  A one-line
summary such as “the window proves RH” would omit the essential uses of the `HypsAlt` witness and
the imprimitive-character transfer.

## How the literature wrapper supplies the seven inputs

At `EC-S1:810`, for
`O : OpenLiteratureStatements` and `hV : VWin`, the wrapper calls the adapter with:

| Adapter input | Exact producer in `EC-S1` | What must remain visible |
|---|---|---|
| `P` | `published_results_eigen O` | the full `UnitaryGroupThirdPlaceHypotheses` record; in particular `greenRegularCharacters` and `nLink` |
| `F` | `published_results_first O` | the full `ThetaLocalInputs` record |
| `hA` | `(theta_integrals_agree_and_local_matching_of_literature O).1` | first projection of one shared conjunction |
| `hM` | `(theta_integrals_agree_and_local_matching_of_literature O).2` | second projection of the same conjunction |
| `hX` | `topCovolSlim2_use_alt_alt` applied to fifteen displayed premises | produces `CovolumeBoundOfX`; it is not an axiom-free scalar estimate |
| `hL` | `local_langlands_gl_recT_exists_of_literature O` | constructed from twelve named local/global representation-theoretic inputs |
| `hV` | the wrapper's second argument | not derived from `O` in this theorem |

The shared theta pair itself is

```
theoremK_head2
  (eis_bl_of_literature O)
  (siegel_weil_std_of_literature O)
```

so the two projections must not be described as independent hypotheses.

The fifteen covolume premises (`EC-S6`) are, in order: resolution in characteristic zero,
principalisation in characteristic zero, inverse Poincaré–Lelong, Hilbert–Samuel use, Moriwaki
bigness, Fargues exactness, Zarhin's statement, nef Riemann–Roch, Siegel toroidal integrality,
toroidal fan `KS`, seminegativity of the semi-abelian Lie bundle, point separation, arithmetic
degree, `PublishedHodgeBundleTheorems`, and Grothendieck deformation.  The theorem constructs
intermediate `HypothesesX` and `HypothesesH`, then calls `topCovolG_alt_alt` with a deep-slim bound.
This dependency must not be collapsed to “volume positivity”.

## Downstream link

`EC-S7` gives the exact final composition:

1. `everyCharacter_of_row h` forms
   `O := ⟨h, recTExists, h⟩` and supplies `vwin_of_row h` to the literature wrapper;
2. `everyCharacter` instantiates `h` with
   `galoisLocalGlobalStrong_recParameter`;
3. `riemannHypothesis` applies `riemannHypothesis_of_everyCharacter`.

This checkpoint therefore establishes the source-accurate adapter chain, not the mathematical truth
of any premise record.  In particular, the fields of `OpenLiteratureStatements`, the covolume
inputs, the Galois row, and `VWin` remain visible dependencies.

## Executed tests

- `python3 verify_every_character_adapter.py --self-test`
- `python3 verify_every_character_adapter.py --report 2026-11-24_every_character_adapter_derivation.md`
- `python3 -m py_compile verify_every_character_adapter.py`

The source-checking mode is:

```
python3 verify_every_character_adapter.py --source-root /path/to/riemann-hypothesis
```

It requires the upstream checkout at the pinned revision and verifies all seven Git blob IDs plus
the exact adapter/wrapper tokens.  That mode was not run here because this lane had GitHub source
access but no local checkout of the upstream Lean repository.

## Failed attempts and limitations

- GitHub code search returned no indexed hit for the adapter identifier.  Scanning the 33 direct
  imports of `EveryCharacterE.lean` also returned no hit.  The declaration was found by scanning
  the 201 direct imports of the final literature wrapper; it is in
  `SiegelEisensteinSecondTermHypotheses.lean`.
- No Lean executable or upstream checkout was available in this workspace, so no `lake build` or
  kernel elaboration was performed.  “Source-matched” must not be upgraded to “independently
  elaborated”.
- This contribution does not audit the internal proof of `hypotheses_nonempty_of_unramified_exponents_alt`,
  `zeroFreeAll_of_topG`, `imprimitive`, or the fifteen-premise covolume theorem.
- No URT comparison or advantage is claimed.

## RESUME HERE

Trace `hypotheses_nonempty_of_unramified_exponents_alt` backwards from its exact source declaration.
Preserve the types of `hEv`, `hN C_*`, `hFun`, and `hL3`, and determine which fields of `HypsAlt`
each one fills.  The next independent check should also locate and unpack
`zeroFreeAll_of_topG` far enough to show precisely how the `la = 3/2` shape and `VWin` character
windows imply `ZeroFreeAll`, without re-summarizing the already audited wrapper.



---

## Appendix 4: specialists/theta_lifts/RUN1_THETA_TO_CHARACTER_BRIDGE.md
Working-repo blob a1b2447105e93bccdb53afa6ae802f342df41c61.

# Theta lifts — first source-matched reconstruction of the character bridge

Date 2026-11-24. RESULT: PARTIAL — source-matched human proof of the *composition* of the seven-input adapter; independently executable static source checks (13/13). No independent Lean elaboration, no proof of all input theorems, no RH closure or URT speed claim.

## Provenance and continuity

Original source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. All references below are to that immutable revision. Current main observed at 6c6821263d6b80f4ec3d7479b0159340c1b2f65e. The two principal files changed blob IDs; the seven-input adapter declaration+body is unchanged in the text comparison; the top literature adapter is changed. Keep revisions separate; do not assume semantic equivalence. Read the swarm protocol, handoff queue, expansion, AGENTS, continuity and research log/state/protocol, peer integration, mathematical, dependency, kernel, acceleration, prime-window and Landau checkpoints. No prior theta-lifts lane artifact in the preflight tree. The most recent physical CI verdict at preflight was PASS for 0f7a23b (run 45345201880); not a check of this RH proof.

Paths A–J are relative to src/Development/; T = AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/.

| ID | path | Git blob SHA |
|---|---|---|
| A | T/EveryCharacterOfLiteratureOfVWin.lean | a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 |
| B | T/SiegelEisensteinSecondTermHypotheses.lean | 42abe20ee235820aaa924dbabce5e1d2c2540380 |
| C | T/TopPlug.lean | c51cb6b5bd4bf2944ace89e00a2990da16bd519a |
| D | WeilBound/ThetaLifts/Reductions/FiniteClosure/TheoremKOfMod.lean | 61ff0c7c5ee7e5df0681112d6727ab143c3b6996 |
| E | AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean | 4d0d94fd3fd9368e5428c05402979d6dd5123b4d |
| F | T/At23OfAll.lean | e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d |
| G | WeilBound/ThetaLifts/SphericalLattices/SphericalClosure/CloseSph.lean | 9a15ec479fb007975f15b6df7fe5fe46615e4f8f |
| H | T/HypothesesNonemptyOfUnramifiedExponents.lean | c0ce994aa86f737b707b5617fb10bcfb35c0117e |
| I | T/TopCovolSlim2Use.lean | 0e1bad41f4b165c0d9b1693f419530309e1da5ba |
| J | T/Prm1.lean | e7e454678d47eaa76c342abbafb4c4bcdf9f372d |

MainConclusion.lean (ee340012ab19713a8acfecf8adc6a331cbc2f1a4) invokes A. Earlier FockModels/EveryCharacterE.lean (01e60174b728fc6b473a308c5bf5dbffbe017afe) provides a similarly named older everyE₂ with different types; it is NOT the explicitly invoked adapter. Use B, not that older theorem. This prevents a real translation error.

## 1. The exact seven-input bridge (A:810–814; B:69–73)

Given O : UpperTheory.LiteratureTheorems.OpenLiteratureStatements and hV : UpperTheory.Top.VWin, obtain:

1. P = published_results_eigen O : GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses.
2. F = published_results_first O : GlobalTheory.FunPr.ThetaLocalInputs.
3. hA : GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.ThetaIntegralsAgree.
4. hM : GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.LocalMatching.
5. hX : GlobalTheory.CovTop.CovolumeBoundOfX, supplied by the exact 15-argument topCovolSlim2_use_alt_alt (I), not the earlier CovolX variant.
6. hL : UpperTheory.Zero.LLC.RecTExists, supplied by local_langlands_gl_recT_exists_of_literature O.
7. hV : UpperTheory.Top.VWin, retained separately from the above.

Both hA and hM are projections of **the same conjunction**, theta_integrals_agree_and_local_matching_of_literature O. Bind it once in the human reading view; retain both edges. No additional axiom or premise removed. A:215 defines O with three fields: caraianiLocalGlobalDual : One.M.Row, localLanglandsExists : Zero.LLC.RecTExists, galoisRepOfPolarizedPairLit : One.M.Row. MainConclusion constructs it as ⟨h, recTExists, h⟩, and supplies vwin_of_row h independently; do not call O empty or externally established. Source inspection alone does not establish kernel-level trust status.

The exact B proof, in human mathematical terms: for each real cDep, F:boundAtTwoThree_linked_of_recT applied to P.nLink and parametersOfDependence hL cDep supplies a linked family bound. With P,F,hA,hM,hX,hL and this universally quantified family of linked bounds, B:nonempty_hyps_definite_side_of_closed_bound constructs an inhabitant of HypsAlt S0.NL DefiniteSideCondition (under Nonempty). Green regular characters in P supply Green via GreenBridge.green_of_regular. Then C:every_character_of_green_v_win applies the independently supplied hV and the inhabitance to obtain EveryCharacter.

## 2. What the theta claims actually mean (E:388–394, 433–447, 458–471, 491–513, 559–595)

Fix arbitrary types F,E with Field and NumberField instances and an Algebra F E, an F-algebra endomorphism σ of E, a base B, natural ranks a,a', a geometric triple G, characters X, and Weil models om,om'. Restrict to IsTriple: B.IsGood σ, G.IsGood B, X.IsGood B a a', and two IsWeil properties using opposite characters X.β with X.β/X.α and X.α with X.α/X.β. In particular G.IsGood has a'<a, even a+a', each archimedean weight difference greater than a+a', 2(p+q)+1 < (a-a')/2 and < a', the specified Hermitian/skew forms and two good models (E:360–371). Natural subtraction/division here is Lean Nat arithmetic. Other IsGood and model conditions remain as defined in E; this is not an assertion for arbitrary representations.

LocalMatching: for *every* such triple there exist real maps R and finite maps Rf with IsMatched. IsMatched retains IsTriple plus IsRealMaps and IsFinMaps. Real maps give common quotient, intertwining equality under Lie derivative and compact-group actions, nontriviality and irreducibility. Finite maps are onto on Schwartz-Bruhat spaces, kill augmentation subspaces, preserve matching under finite local actions, have nontrivial irreducible targets, equal nonzero spherical-vacuum images outside X.T, and zeta conditions at specified places. Neither existence nor irreducibility follows solely from calling these objects theta lifts.

ThetaIntegralsAgree contains THREE conjuncts, not only a proportionality:

(i) For each triple, Decay holds and for each matched pair (R,Rf), OneConst and Coinv hold. Decay requires convergence for all Schwartz inputs in the first model; for each special input Φ' in the second model and every N∈ℕ, some real C and natural k bound |theta(om',Φ',g,h)| qht(g)^N ≤ C ht(h)^k for all g,h, together with convergence and moderate growth of the integrated function. OneConst asserts existence of a special Φ' with nonzero integral function, exactly one scalar c satisfying IsConst, and every such scalar is nonzero. IsConst means I_A(Φ)(h)=c I_B(Φ')(h) for every matched pair of vectors and every h. Coinv gives exact kernels on Schwartz-Bruhat inputs at good places, special-input surjectivity, linear functional descent through Rf.p', and invariance of the special global input space under om'. In particular this is not just equality of traces or norms.

(ii) There exist integer units e₁,e₂,s such that for *all* F,E,σ with the stated instances, StepBeta holds. Given the specified rank reduction a' = b+2 → b, unchanged V,p and q decreasing by one, the two adapted planes and real maps, there exists C≠0 independent of subsequent matched choices. For all choices of X, both sets of Weil models/maps, and constants c,c₁ satisfying IsConst in their respective models, there is u with u·(C·stepFac)=1 and c·charL(X.ν,X.S₀, k+1)=u·c₁, k = Nat.div (a-(b+2)) 2 (coerced as in E). stepFac uses unit ideal values, character values and local epsilons at integer exponent -k. The exact nonzero and adapted-plane conditions remain necessary.

(iii) A separately existential triple of integer units e₁,e₂,s works universally for StepAlpha. Here a=b+2→b, V' fixed, q=0 on both, p decreases by one, with the different adapted-plane conditions in E. There exists C≠0; for all matched pairs and constants, c=C·stepFac·charL(X.ν,X.S₀,k)·c₁, k=Nat.div (b+2-a') 2, stepFac exponent 1-k.

Elementary consequence of (i)+(ii)+(iii), **conditional on all the stated data**: for Beta, u≠0 since u·(C·stepFac)=1, and c₁≠0 by OneConst, hence the RHS is nonzero, so charL at k+1 is nonzero. For Alpha, c≠0 forces each factor in its product nonzero, hence charL at k is nonzero. This is not a half-plane zero-free theorem for arbitrary Dirichlet characters: the source's admissible character construction, adaptation, and arithmetic projection remain necessary. No claim that charL is directly the final Dirichlet L-function without source justification.

## 3. Producer of the paired theta properties

A:561–566 calls PositivityTheory.ThKR.theoremK_head2 with two precise named propositions, GlobalTheory.ThK.Dbl.EisBL (from PositivityTheory.RgEis.Hd.eisBL) and GlobalTheory.ThK.Dbl.SiegelWeilStd (from PositivityTheory.SiegelWeilFormula.Fin.siegelWeilStd). The bodies of those two producer theorems remain to be traced. A wrapper ending in a named theorem is not evidence that the mathematical result is a published theorem or that its proof is sound.

D:theoremK_head2 specializes theoremK_head2_of_mod at PositivityTheory.Sph.modSt2. The latter passes 14 inputs to Tr.closeSph (G): kCoinv, soCoinv, ramifiedMultiplicityOne, finRam, finSplit, sphTri_of applied to sphSplit_geo and vacInert howeInert, finInert_of with sphFun_of_modSt hM and locRepEx, lieSecond2 localLift_holds RL.derEx, archLie' localLift_holds, kReal' localLift_holds, siegel_of_core siegelCore_holds, h11, h12, weilEx. These are explicit source applications, not elaborated expression edges. G includes substantive derived obligations e.g. tower constructions, constant term vanishing, Weil convergence, spherical and archimedean matching, and anisotropic Siegel-Weil plus Eisenstein continuation. Its full remaining body is next frontier, not compressed away. The named external literature analogues are classical themes; do not classify a particular source proposition as established literature until exact statement/hypotheses and provenance have been audited.

## 4. Actual adapter construction in B:44–68

The proof of Nonempty HypsAlt is not an invocation of theta correspondence alone. Keep the following ordered, source-matched intermediate facts.

- Set C=P.litN (literal nonexistence/literature package, use its join and fe fields). Separate functionals via functionalsSeparate_of_howeUnram_of_siegelWeil(F, howeUnram_holds, P.siegelWeilUnitaryConvergent).
- Obtain RowRat using rowRatW_of_rowTest(test_vector_assembly_holds(F.siegelSetUnitary,F.howeDualityReal,P.greenCuspidal,F,C.join,C.fe,hA,hM,hS)).
- Obtain ConstantFunctionFits using fourier_coefficient_fit_of_join_alt(F,C.join,C.fe,hA,hM,hS, second component of ontoX_and_lamLow_of_unitaryGroupHypotheses' P).
- From evaluation_grid_of_join obtain CF1 and hCF1. Inputs include both theta properties, functionals separation, F and its real Howe duality, C.join and C.fe, twisted_weil_representation_convergence, twisted_local_factors_match, twisted_square_theta_integrals_eq. This witnesses evaluation condition EvLgG(GridA(c)) at every c≥CF1.
- From rowFun_at_gridA_alt with P.discreteSeriesCover, P.harishChandraModules, P.cuspRapidDecay, P.casselmanWallach, P.rayClassFieldSt and hFit obtain CF0,hCF0, furnishing functional linked condition above CF0 once the open condition is supplied.
- Choose d=max(CF0,CF1). Both bounds hold at d; this is the actual synchronization step, not an assumed intersection of arbitrary infinite sets. Obtain hEv from hCF1(d), hOpen1 from open0_of_unitary_group_hypotheses P hL d.
- Use open_and_linked_of_stronger_extension_alt on hL, extensionWithList hL d, extensionWithAtProperty hL (extensionWithOrigin hL d) (GridA d), SExt.none and geoCl anyGeometry with the explicit inclusion witness x↦⟨x.1.1⟩. Take its second component to transfer hOpen1 to hOpenA. hCF0(d) now yields hFun using extensionWithOrigin, SExt.none, geoCl anyGeometry, inclusion x↦⟨x.1⟩ and hOpenA.
- linked_bundles_l3_of_open_alt, with the same five P fields used for CF0, hX, hL, extensionWithAtProperty on GridA d, SExt.none, geoCl anyGeometry, inclusion x↦⟨x.1.1.1⟩ and hOpenA, yields hL3.
- H:hypotheses_nonempty_of_unramified_exponents_alt consumes P,hRat,hL,d,GridA d,hEv,hN(d),hFun,hL3, producing the promised Nonempty HypsAlt S0.NL DefiniteSideCondition. H obtains actual large unramified exponent bundles, Galois local bounds and all-row conditions; its full dependencies are not eliminated. The universally quantified hN in B is essential to choose d *after* both thresholds are obtained. F supplies hN via local bounds at two and three, closed_of_all, then Row.of_sel and LinkedAt.of_row; J specifies parametersOfDependence from extensionWithList, SExt.none, geoCl anyGeometry.

Explicit output path C:zero_free_all_of_green_v_win eliminates Nonempty only into the proposition ZeroFreeAll, uses zeroFreeAll_of_topG at la=3/2>1, forall_goal_of_shape_of_hyps with shape_closed_link_n_of_green and the inhabitant, and supplies each ψ by supplyChi ψ (hV ψ). C:every_character_of_green_v_win then invokes imprimitive. Hence the theta bridge and prime-window character lane meet at exactly C, not an unsupported jump from scalar nonvanishing to RH. Preserve the exceptional trivial-character pole and all primitive/nonprimitive quantifiers in the downstream chapter.

## 5. Reproducible static checks

Actually executed 13 assertions in the tool V8 JavaScript runtime against six retrieved pinned files A–F. All succeeded: blob identities, two projections, exact adapter rather than everyE₂, seven formal premise names, universal cDep and linked-bound producer, both max inequalities, five theta bridge call sites, Eisenstein/Siegel-Weil pair producer, all five named conjunct components in ThetaIntegralsAgree, unique nonzero scalar, la=3/2 and imprimitive, closeSph and modSt2 call, linked-family closed_of_all construction.

Replay on local pinned checkout (Python 3, no Lean required):
```python
from pathlib import Path
import hashlib
root=Path("src/Development")
T="AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
paths=[T+"EveryCharacterOfLiteratureOfVWin.lean",T+"SiegelEisensteinSecondTermHypotheses.lean",T+"TopPlug.lean","WeilBound/ThetaLifts/Reductions/FiniteClosure/TheoremKOfMod.lean","AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean",T+"At23OfAll.lean"]
shas="a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 42abe20ee235820aaa924dbabce5e1d2c2540380 c51cb6b5bd4bf2944ace89e00a2990da16bd519a 61ff0c7c5ee7e5df0681112d6727ab143c3b6996 4d0d94fd3fd9368e5428c05402979d6dd5123b4d e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d".split()
bs=[(root/p).read_bytes() for p in paths]
assert [hashlib.sha1(b"blob "+str(len(b)).encode()+b"\\0"+b).hexdigest() for b in bs]==shas
a,b,c,d,e,f=map(lambda x:x.decode(),bs)
target=a.split("theorem UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",1)[1]
adapter=b.split("theorem every_character_of_theta_integrals_local_matching",1)[1]
bridge=b.split("theorem nonempty_hyps_definite_side_of_closed_bound",1)[1].split("theorem every_character_of_theta_integrals_local_matching",1)[0]
pair=a.split("theorem UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature",1)[1].split("theorem ",1)[0]
one=e.split("def OneConst",1)[1].split("def Coinv",1)[0]
agree=e.split("def ThetaIntegralsAgree",1)[1].split("example",1)[0]
assert all("theta_integrals_agree_and_local_matching_of_literature O)"+s in target for s in [".1",".2"])
assert "every_character_of_theta_integrals_local_matching" in target and "everyE₂" not in target
assert all("("+n+" :" in adapter for n in ["P","F","hA","hM","hX","hL","hV"])
assert "∀ cDep : ℝ" in bridge and "fun cDep =>" in adapter and "boundAtTwoThree_linked_of_recT" in adapter
assert all(s in bridge for s in ["le_max_left","le_max_right","hN (max CF0 CF1)"])
assert all(s in bridge for s in ["test_vector_assembly_holds","fourier_coefficient_fit_of_join_alt","evaluation_grid_of_join","twisted_local_factors_match","twisted_square_theta_integrals_eq"])
assert all(s in pair for s in ["theoremK_head2","eis_bl_of_literature","siegel_weil_std_of_literature"])
assert all(s in agree for s in ["StepBeta","StepAlpha","Decay","OneConst","Coinv"])
assert "∃! c" in one and "c ≠ 0" in one
assert "la := 3 / 2" in c and "UpperTheory.Top.imprimitive" in c
assert "Tr.closeSph" in d and "PositivityTheory.Sph.modSt2" in d
assert "closed_of_all" in f and "at23_family_alt hP Fm" in f
print("13 static source assertions passed")
```
The Python replay is supplied, not executed in this run; V8 checks used connector-returned blob IDs rather than independently recalculating Git SHA1. A source text check does not prove theorem truth. No changed premises introduced; implicit typeclass and kernel edges await kernel export. Current-head blobs A=f4f6eb32f04c91b5cde32f11631828eb4016fa7f and B=24cacd4b9f4ae5ef83703e26ee2d26b51ffafdf8. No current-head mathematical validity claim.

RESUME HERE: retrieve full G:closeSph and its final AgreeOfLeaves call; map the actual terminal inputs into Decay, OneConst, Coinv, StepBeta, StepAlpha and LocalMatching, especially the nonzero theta scalar producer and exact character X.ν → Dirichlet character map. Fetch the definitions and producers of EisBL and SiegelWeilStd, marking external provenance separately. Do not rerun the already mapped seven-input composition. Handoff to integration, formal audit, character-box, literature-provenance and human editor lanes: A→B→C is ready as a source-matched conditional chapter. No Cathedral physics files changed.



---

## Appendix 5: specialists/positivity_geometry/RUN1_SELF_INTERSECTION_VOLUME.md
Working-repo blob 6e165bba55a9ad1274ace9d3ed93e3dfe24592eb.

# Positivity geometry run 1 — from self-intersection to arithmetic volume
2026-11-24. RESULT: PARTIAL full project; SOURCE-MATCHED human reconstruction of VolGe and its self-intersection limit and limsup argument. Exact finite regression checks executed. Not an independent Lean kernel check or proof of all geometric producer theorems.

## Continuity and source anchor
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol, continuity, latest state branch CI summary (PASS 45347447866 at 1dec3c8; physical CI is not RH validation). Read peer theta, Galois, character-box, literature, Landau, prime-window, integration, math, kernel and acceleration handoffs. This is the first geometry lane file. Distinct from literature's interface ledger, theta's seven-input bridge, and Galois's row adapter. No Cathedral physics files changed.

All statements below refer to leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream head observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 at 07:32:48 UTC; the corresponding A and D blobs are now f4f6eb32f04c91b5cde32f11631828eb4016fa7f and 0d30ec46d5560d675a435b49f911903d3d5357c0. No equivalence claimed across revisions.

Paths relative to src/Development/; T=AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/; P=AbelianVarietyTheory/Proofs/DivisorProofs/.
- A T/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24
- B T/TopCovolSlim2Use.lean 0e1bad41f4b165c0d9b1693f419530309e1da5ba
- C AbelianVarietyTheory/PublishedTheorems/Divisors₂/VolGe.lean 3838e9a22a7fa93d98a7406239103be54c7414cc
- D P/VolGeOfHilbertSamuel.lean fd45423c859443963c1afdea940b351115c8c13d
- E P/TendstoSelfIntersectionPowTensorDivPow.lean 9842d7f2fc3da0d7f27c87825d305a54923b9e04
- F P/SmallSectionCountContinuousFromAboveStatement.lean 576ce7a9e4043f9dd3ac9b952163fc1e8c85a065
- G P/LogCardSmallSectionsGeOfShiftNefStatement.lean cdc8a3a38fc1606b45c761fece070970642afcdb
- H P/ExistsMetricShiftIsNefPowTensAmpleStatement.lean 1bdfc7617f52ef8967c54904fa2dd2b113ae9e5d
- I P/LeArithVolumeOfFrequentlySmallSectionsLower.lean 9d7885dc87a2f80aa5b90a45e5c35bb8096edded
- J P/TendstoSelfIntersectionPowTensorDivPowStatement.lean 71c212cf16d692d3835c7c08aabfbf0be9419267
- K P/LeArithVolumeOfFrequentlySmallSectionsLowerStatement.lean e13abab6f3c1a7ebe0111cdb32beccd78e229365
- L T/TopCovolG.lean 62742fab059140fb67f88b2c1e18abd6078992b3
- M T/HeightLowerBoundGeneral.lean b6012f8c9b260e1596140ce99671df2b7692f72c

## 1. Why this is on the actual source path
A:531–532 calls D:volGe_of_hilbertSamuel with arith_hilbert_samuel_of_literature O, ar_calc_of_literature O and nef_numerics_of_literature O. A:783 supplies this as p2 of published_results_arithmetic. A:812 passes the record into B:topCovolSlim2_use_alt_alt, which passes it to L:topCovolG_alt_alt. L uses that record in height, gram, degree, and covering producers; M:height_lower_bound_general_alt uses height_of_meanAll_bound with short-section, geometric, integral-frame and weight-budget producers. This is a source-level record-flow path, not a proof that projection p2 survives kernel proof irrelevance or is indispensable. The exact consuming projection is a further task. No inferred direct link from this isolated inequality to RH.

## 2. Exact theorem and retained assumptions
C:13 defines VolGe: for every commutative ring k, integral scheme X of universe 0, map p:X→Spec k and D∈N satisfying IsArithVar p D, every Hermitian line bundle L over p and every real a, assume NefFib L, L.SemiPos D and L.IsSelfInter a. Then (a:EReal) ≤ arVol L D.
D proves this conditional on three proposition-valued inputs: ArithHilbertSamuel, ArCalc, NefNumerics. Keep the distinction between fibre-nef and globally nef, and between the real a and extended-real volume. Neither a>0 nor D>0 is assumed. Positivity of a is needed only if one wants to conclude positive volume.

## 3. Human reconstruction of the intersection polynomial (E, J)
Let r=D+1, and use the real-linear functional Phi on polynomials in two variables supplied by ArCalc.arExists for the pair L,A. The ArCalc isometry and uniqueness rules imply
  Phi(X0^r)=a.
For every n∈N the bundle combination with integer coefficients (n,1) is isometric to L^n tensor A, using the isometry class laws. Thus
  alpha(n)=Phi((n X0+X1)^r)
is a self-intersection of that bundle. In particular, for n≥1,
  alpha(n)/n^r = Phi((X0+X1/n)^r)
    = sum_{j=0}^r binomial(r,j) Phi(X0^(r-j) X1^j) n^(-j).
Each term is a fixed coefficient times a power of 1/n. Hence the right-hand side tends to Phi(X0^r)=a. The source proves continuity of a polynomial in t, evaluates at t=1/n, and uses eventual n≥1; no division by n=0 in the human proof. All coefficients can have either sign. This proof is not asserting positivity of mixed intersections or invoking an unproved Hodge index inequality.

## 4. Human reconstruction of D's three-error budget
Fix any epsilon>0, let e=epsilon/3 and F=r!≥1. The good-pair theorem constructs P with P.L=L, P.A ample and nef, b and rational-function witnesses s,t with P.Good D b s t. D obtains the self-intersection alpha from E and the representation facts for P.L and P.A. These inputs remain obligations, not consequences of the numerical budget.

First choose n≥1, sufficiently large that
  alpha(n)/n^r > a-e,
and such that for all sufficiently large m the following F (continuity-from-above) estimate holds:
  P.lc(nm,m,1) ≤ P.lc(nm,0,1)+e(nm)^r.                   (1)
F supplies the nested eventual quantifiers: eventually n, eventually m. Choose n only once, after intersecting the two eventual n conditions. D derives P.Rep n 1 (L^n tensor A) via the power/tensor representations. H yields a real t0 such that the constant metric shift of L^n tensor A is nef, using ArCalc, NefNumerics, semipositivity and fibre-nef of L, and ample plus nef of A. This is not the assertion that the unshifted L is nef.

Now G, using ArithHilbertSamuel, ArCalc, P.Good, the representation, self-intersection alpha(n), and nef shift t0, gives for all sufficiently large m
  (alpha(n)/F-e)m^r ≤ P.lc(nm,m,1).                       (2)
For arbitrary N0 choose one m≥max(N0,1) satisfying (1) and (2). Set x=n^r≥1, y=m^r>0, N=nm≥N0. Then
  P.lc(nm,0,1) ≥ alpha(n)y/F-ey-exy
                 ≥ (a-e)xy/F-ey-exy
                 = a xy/F - e xy/F - ey - exy
                 ≥ (a/F-3e)xy.
The final step uses F≥1 and x≥1: e xy/F≤e xy and e y≤e xy. It does not require a or alpha(n) nonnegative. D:70–85 proves exactly these inequalities (e1–e4) and combines them with the two eventual estimates.

D then identifies P.lc(nm,0,1) with log of the finite small-section count for L^N: its twisted-power encard equality and ball finiteness ensure the natural cardinalities agree. Thus for every epsilon>0 and arbitrarily large N,
  smallSec(L^N) is finite, and
  log #smallSec(L^N) ≥ (a/F-epsilon) N^r.
No uniform threshold in epsilon is needed and not all large N are claimed to work. The n,m selection order is essential. The geometric count lemma and ball finiteness are still separate leaves.

## 5. Limsup closure (I, K)
Use arbitrary delta>0 and the preceding result with epsilon=delta/F. Discard finitely many N=0 terms. The small-section set contains the zero section, so each finite count at a selected N is positive. Multiplying the bound by F/N^r gives a-delta ≤ F log(#smallSec(L^N))/N^r on arbitrarily large N. The exact extended-real limsup inequality follows from Filter.le_limsup_of_frequently_le, including the possibility of infinite arVol. I handles finite ncard to extended-real log with the finite/positive conditions, then uses order density on EReal to let delta→0. Result: a≤arVol L D. This is the desired VolGe inequality, conditional on all of section 2's inputs and the cited geometric leaves.

In short: self-intersection is the highest-degree coefficient of a geometric polynomial; the counting estimates transfer that leading coefficient to a lower bound for arithmetic volume. The factorial F is a normalization from the source, not a fitted constant. The result supplies a mathematical route from intersection data to section growth rather than directly claiming nonvanishing of an L-function.

## 6. Executed checks and reproduction
Actual connector V8 run re-fetched A–I at the original pin, checked all nine returned blob IDs against inventory, and passed 31 literal source assertions (not kernel edges): A lines 532,783,812; B 16,21; C 13; D 40,49,70,74,77,79,82,85; E 18,29,38,40,47,56; F/G/H line 12; I 21,22,25,37. J–M inspected; no assertion count assigned to them. Replay checkout pin and git hash-object each path; inspect listed lines and full theorem bodies.

Exact integer arithmetic tests executed in the same runtime: 11,340 budget cases (D=0..5, n=1..6, m=1..7, a=-4..4, epsilon=1..5). Use 3alpha=(3a-epsilon)x+1 so strict premise holds even for negative a. Multiply all inequalities by 3F. Independent integer polynomial multiplication vs binomial formula: 900 cases (r=1..9, n=1..20, coefficient families c_j=s(j+1)-2, s=-2..2). No failures. Minimum scaled budget slack=1. Reproduce with this standalone Python standard-library script (equivalent arithmetic to executed BigInt loops):
```python
from math import factorial, comb
from itertools import product
budget = poly = 0
min_slack = None
for D,n,m,a,eps in product(range(6),range(1,7),range(1,8),range(-4,5),range(1,6)):
    r=D+1; F=factorial(r); x=n**r; y=m**r
    alpha3=(3*a-eps)*x+1
    lb=alpha3*y-eps*F*y-eps*F*x*y
    target=(3*a-3*F*eps)*x*y
    slack=lb-target
    assert slack==y+eps*((2*F-1)*x*y-F*y) and slack>=0
    min_slack=slack if min_slack is None else min(min_slack,slack)
    budget+=1
for r,n,s in product(range(1,10),range(1,21),range(-2,3)):
    c=lambda j:s*(j+1)-2
    p=[1]
    for _ in range(r):
        z=[0]*(len(p)+1)
        for j,v in enumerate(p):
            z[j]+=n*v
            z[j+1]+=v
        p=z
    assert sum(v*c(j) for j,v in enumerate(p))==sum(comb(r,j)*n**(r-j)*c(j) for j in range(r+1))
    poly+=1
assert (budget,poly,min_slack)==(11340,900,1)
print(budget,poly,min_slack)
```
These synthetic arithmetic regression cases check the generic algebra, not the geometry or native Lean environment. Mathematical proof for arbitrary parameters is the exact inequality and polynomial argument above. No Lean compilation or local kernel extraction, no changes to assumptions, no URT acceleration tested, no full-proof completion percentage. CI for this note not executed. Source hypotheses of all imported geometric producer lemmas remain open for translation.

RESUME HERE: follow M:height_of_meanAll_bound via HodgeBundleWeights/HeightLowerBoundGeneral and ThirdPlaceSeries/HeightOfSteps. Locate an actual consuming use of PublishedHodgeBundleTheorems.p2 in this chain (if absent, record the exact alternative consumer or unused field). In parallel with that source inspection, the next geometric leaf for VolGe is F's lc_add_A_le in SmallSectionCountContinuousFromAbove.lean: reconstruct its two-level eventual quantifiers and prove its small-section comparison with the exact b,s,t and metric assumptions. Do not redo the polynomial or three-error budget.
HANDOFF TO: proof editor, integration, audit, character boxes and literature lanes. The VolGe chapter is ready for independent source audit; record flow is not yet kernel reachability.



---

## Appendix 6: specialists/character_boxes/RUN1_CONNECTED_WINDOW_WITNESS.md
Working-repo blob 691114be7974fd950c248b7f9b2defc44161e3be.

# Character boxes run 1 — actual window witness and nine-link closure
2026-11-24. SOURCE-MATCHED / PARTIAL. Original source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Executed 83 literal source assertions across 20 pinned files in V8; all passed. No independent Lean elaboration, no kernel dependency certification or URT speed claim. Current upstream observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 (07:32:48 UTC); MainConclusion, EveryCharacter and theta TopPlug/TopShape blobs changed; old ShapeWin and SupplyChi paths return 404 there. Keep revisions separate.
Preflight read swarm protocol, handoff, expansion, AGENTS, state/log/protocol, continuity and peer dependency/kernel/acceleration/integration/math/theta/Landau/Galois/prime/structure notes. No prior character_boxes artifact. Physical CI PASS 45345201880 for 0f7a23b is unrelated. The peers mapped the analytic and seven-input theta bridges; this note supplies the intervening family witness.

## Actual path vs parallel wrappers
Main.lean: riemannHypothesis = rhOfAll; Supplements/Kernels/MainTheorems: rhOfAll = Formalism.VW.rh_of_every allChi; allChi = UpperTheory.FinalTheorems.everyCharacter. CharacterBoxes/MainConclusion: h = galoisLocalGlobalStrong_recParameter, passed as (h,recTExists,h) with vwin_of_row h to every_character_of_literature_of_vWin. The theta adapter SiegelEisensteinSecondTermHypotheses:69–73 invokes every_character_of_green_v_win. ThirdPlaceSeries/TopPlug:12–18 invokes zero_free_all_of_green_v_win then imprimitive. Crucial distinction: the actual TopPlug invokes shape_closed_link_n_of_green (ThirdPlaceSeries/TopShape) via forall_goal_of_shape_of_hyps, with HypsAlt N DefiniteSideCondition. The older EveryCharacter.plugWin instead invokes CharacterBoxes/ShapeWin.shapeWin with Hyps N DRS. Do not conflate them. Similarly MainConclusion's own RH theorem calls UpperTheory.riemannHypothesis_of_everyCharacter, but the original Main root calls Formalism.VW.rh_of_every. Imports are not kernel dependencies.

## Nine-condition design witness
Let A be the admissible family class, G:FReq, la>1, HostExW la G.req and assume every member of G.cls la satisfies HypV. Supply:22–23 defines G.cls la F as F.core.Windows la AND for all x>F.x1 and i in F.Ix(x), G.At(F.L(x,i)). TopG concludes FamilyClassConnected(G.cls la), not that every family is connected. Actual theta TopShape:35–55 constructs a design in the intersection A and G.cls la. hsub restricts existing closed Tu-size/class-number conditions via Closed.sub but does not delete the intersection condition from the chosen family. All TopShapeAlt binders and HypsAlt fields remain obligations; the two True placeholders are discharged by trivial.

The nine Closed conditions on Des(class,C0) in DesWin:11–22 and their actual producers in theta TopShape:35–55 (Cabs=2,C0=3,eD=2,eL=0; literal source constants):
| Condition | Producer | Use |
|---|---|---|
| LinkN | nRest record hypothesis | divinN_of_hypV |
| LinkEta | closed_linkEta_of_duty | division link |
| LinkIRR | closed_linkIRR_of_join_count, Green | final chain |
| SmallLevelRankEq | link_alt_alt_alt, zL surjectivity | divinN_of_hypV |
| TuSize → DGamSize → LinkDIVt | closed_linkDIVt_of_closed_bridge_kernel | eta and DIVinN |
| ChosenE → NuFullF and J.MuRank | link_gl.1 | linkMu_of_linkDIV |
| LinkG | closed_linkG_of_duty | final chain |
| TuSize → LinkS | link_alt_alt_bis | final chain |
| TuSize → DGamSize → LinkGLOBAL | link_gl.2 | final ChainTied |

DesWin:23–31: intersect all nine closed predicates to obtain epsilon1>0 and hA. Independently hEx supplies epsilon3>0. For each 0<eps<min(epsilon1,epsilon3), select K and hK from hA **before** selecting Fm, CH and their class/size/chosen witnesses from hEx at that same K. Apply hK to that very family and CH. It yields predicates in order N,DIV,Eta,IRR,Z,Rk,G,S,GL. HypV from class membership plus LinkN and SmallLevelRankEq give DIVinN through divinN_of_hypV. Apply aD hT hDG aE to get hD; use hD, the components of aR hCh, muTu_of_tuSize and muDGam_of_fact to construct LinkMu. The tuple (LinkG,LinkS,LinkIRR,hD,LinkMu) feeds aGL hT hDG hCh. Return the same family with the intended class membership and ChainTied. This is dependent witness selection, not mathematical induction.
Exact FamilyClassConnected (DivinNOfHypV:13–15): exists eD,eL,epsilon1>0, for every 0<eps<epsilon1 exists Fm:G.cls la and K,cHH,eK,CL,x0 such that for every x>=x0 in Fm.Win, ChainTied Fm eD eL K cHH eK CL x. No single family for every eps; constants precede all x. Preserve K-before-Fm selection in the proof.

## Character supply and rescaling
SupplyChi:8–16: for every primitive psi, VWinAt psi 401 → HostExW (3/2) (GChi psi).req. supplyOfAdm uses admissibleClassesTwistedChar; the latter gives rank/frame witness under 0<eps<1/52 and frame order in [x^(2+8eps),2*x^(2+8eps)], after substitution of s.eps=eps. Extra premises of the stronger adapter are unused here, not removed from its statement. HostOfField uses shortNorm and smallOne. ShortNorms/supplyOfAdmOf:24–56 uses fieldChi, winPairs and fixed J, C0>=max(1,J,level order,8*conductor), host constants, common threshold encompassing rank bound, A^J with A^(eps/5)=5+4*conductor, and page bound c*2^e0. For each permitted scale, fieldChi provides frame/host/kernel/twist data, admissibility gives R, host theorem gives H,q0. At lines 117–135 prime divisors of H.QS divide 2*conductor, boundedTw gives EAtH components and isChiField plus WinDatum.bound and rank bound gives VVle at R.t. GChi is the conjunction of EAtH(Level.cyc psi) with parameter 4 and VVle H.E t sqrt(b).
WinPairs:16–81 scale adjustment: k=c^(1/(2+8eps))>=1. Choose M>=1,y,Y1,k^3,k^400; X>=X0,M^J. V-window starts W>=X^(1/J)>=M and ends W^2<=X. Z=kW>=y, Z^(3/2)<=W^2 since W>=k^3. For x in [Z,Z^(3/2)], x'=x/k lies in [W,W^2]. Dyadic page has x'^(2+8eps)<=2^e<=2*x'^(2+8eps); multiply by c for the target at x. Since x'>=W>=k^400, x^400=k^400*x'^400<=x'^401. Since x'<=x and eps>0, allowed exponential bound grows. WinDatum.bound follows by monotonicity. Thus 401 is the rescaling buffer, not a fitted zero-free exponent. PairEx and VWinAt producers remain substantive upstream obligations.

## Zero-free transfer
ZeroFreeAllOfTopG:12–34: take G=GChi psi, la=3/2. G.cls gives EFamC with constant 4, threshold Fm.x1+1, using Fm.L_x and L_eps; and HypV at same threshold. TopG selects connected family; retain window membership. SupplyChi gives HostExW. Independent comparison theorem level_gm_le_on_family_scales and formB plus zeroFreeOn_of_tiedWin_cyc give ZeroFreeAll for predicate True. Prior analytic chapter explains choosing eps so exponent 1/2+(eD+eL+7)eps lies below Re(s); this note does not independently derive geometric size bounds.
Imprimitive:5–35: N>0, any chi, Re(s)>1/2, chi!=1 OR s!=1. Apply primitive nonvanishing to PChar.of chi. If chi nontrivial and primitive character trivial, changeLevel_primitiveCharacter/changeLevel_one contradict chi!=1. If s!=1, pole exception automatically satisfied. Change-level formula gives primitive L times finite Euler factors 1-chi_prim(p)p^(-s); their subtracted terms have norm <=p^(-Re(s))<1, so none vanish. No induction over modulus needed. EveryCharacter quantifies all N>0, chi, s with these exact hypotheses. Root RH specializes to modulus one and uses functional equation via rh_of_right. Alternate RH proof also handles zeros of Gamma_R in Lean's totalized division. Neither wrapper proves the upstream arithmetic premise.

## Pinned source inventory and replay
Paths C=src/Development/AutomorphicArithmetic/CharacterBoxes/; T=src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/. Connector-returned blob identities; independently replay with git hash-object and git show PIN:path. Check each named call inside the specified declarations, not just imports.
| File | Blob |
|---|---|
| src/Main.lean | dbd5db70bc11b35f18fa5751216ab335321e7bfc |
| src/Supplements/Kernels/MainTheorems.lean | 6a542d7ce969a791fd12ce575f587e6bc29044bf |
| C/MainConclusion.lean | ee340012ab19713a8acfecf8adc6a331cbc2f1a4 |
| T/SiegelEisensteinSecondTermHypotheses.lean | 42abe20ee235820aaa924dbabce5e1d2c2540380 |
| T/TopPlug.lean | c51cb6b5bd4bf2944ace89e00a2990da16bd519a |
| T/TopShape.lean | 3f791ca182db235c4a8ff582d3f038019320d5cd |
| T/ShapeOf.lean | 236d0eadd60b292bd0a832114f8c4a6253131250 |
| C/ShapeWin.lean | 884e55f808de32034259a8bb2d74043e2e933430 |
| C/EveryCharacter.lean | 6ac769568b67f85f33565ba3e1eef7b91f53c55f |
| C/DesWin.lean | 94820ef32775f43f41c61da2b892a121d0549b86 |
| C/DivinNOfHypV.lean | 5321920359316653b7627951429a6d7555c311b0 |
| C/Supply.lean | b104f034fc9c13758e280d1b7d33ac1ea370663a |
| C/SupplyChi.lean | 339885b77069601fb716a60739369805241e8222 |
| C/HostOfField.lean | d98214b25bf84966a5b4e858a35f21ac9193b49f |
| src/Development/AutomorphicArithmetic/ShortNorms/supplyOfAdmOf.lean | 04ca5068e90544580c7684a316ec79c49d3572fc |
| C/WinPairs.lean | 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b |
| C/ZeroFreeAllOfTopG.lean | 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1 |
| C/Imprimitive.lean | 97cbdce9fcc91c4f0dcc25fef62daf4c95724afa |
| src/Formalism/GammaFactorNonvanishing/CritLine.lean | 95fa4da5c50119db164aa93944d106f22fdb576d |
| C/RiemannHypothesisOfEveryCharacter.lean | c6dfef5bfa62aa0ef1cd1481833e1cd2475cbbbc |

Small replay (subset of executed assertions; local git required; replay not itself executed):
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
c="src/Development/AutomorphicArithmetic/CharacterBoxes/"
t="src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
checks=[
(t+"TopPlug.lean","c51cb6b5bd4bf2944ace89e00a2990da16bd519a",["shape_closed_link_n_of_green hG","supplyChi ψ (hV ψ)","UpperTheory.Top.imprimitive"]),
(c+"EveryCharacter.lean","6ac769568b67f85f33565ba3e1eef7b91f53c55f",["shapeWin hG","(χ ≠ 1 ∨ s ≠ 1)"]),
(t+"TopShape.lean","3f791ca182db235c4a8ff582d3f038019320d5cd",["closed_linkDIVt_of_closed_bridge_kernel","link_alt_alt_alt","topDesWin","closed_linkIRR_of_join_count","link_alt_alt_bis"]),
(c+"DesWin.lean","94820ef32775f43f41c61da2b892a121d0549b86",["min ε1 ε3","obtain ⟨K, hK⟩ := hA","obtain ⟨Fm, CH, hc, -, hL, hCh, hT, hDG⟩ := hEx","divinN_of_hypV","J.linkMu_of_linkDIV"]),
(c+"WinPairs.lean","4670fec488d1eb59a3cc52dffc8d0eab16e16b0b",["k ^ (3 : ℝ) ≤ M","k ^ (400 : ℝ) ≤ M","hv.mono"]),
(c+"ZeroFreeAllOfTopG.lean","54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1",["⟨4, Fm.x1 + 1","zeroFreeOn_of_tiedWin_cyc","level_gm_le_on_family_scales"]),
(c+"Imprimitive.lean","97cbdce9fcc91c4f0dcc25fef62daf4c95724afa",["LFunction_changeLevel","Finset.prod_ne_zero_iff","Complex.norm_natCast_cpow_of_pos"])]
for path,sha,strings in checks:
    raw=subprocess.check_output(["git","show",pin+":"+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha
    for s in strings: assert s in raw.decode(),(path,s)
print("Pinned source subset checks succeeded")
```
The actual V8 checks covered 83 strings in 20 files; no failures. Literal presence corroborates manually inspected bodies but cannot resolve elaborated dependencies or validate theorem truth. Zero changed assumptions, nine conditions retained, full proof coverage unknown. No CI verdict for this new note.

RESUME HERE: retrieve exact producer link_alt_alt_alt (theta ThirdPlaceSeries/Link.lean or its imports) and reconstruct SmallLevelRankEq from zL surjectivity; then map TopShapeAlt/HypsAlt record producers with positivity/theta lanes. Do not substitute older ShapeWin or redo this nine-link witness. HANDOFF TO: integration, editor, audit, positivity, Galois, theta, prime-window, math lanes.



---

## Appendix 7: math/2026-11-24_normalized_size_budget.md
Working-repo blob 84979bf13fc1351eb6ae1d0226aebd09d9fcc7d7.

# Normalized size-budget proof — exact square-root exponent
Status: SOURCE-MATCHED derivation; independent BigInt regression on constructed boundary cases, not real host existence or kernel verification.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.

Sources (paths relative to src/Formalism/SizeWindowBrackets/):
GrowthBoundGivesRiemannHypothesis.lean (a3ece4b4aea97a95ba2977fa9e8d437e72677774): SizeWindows, GrowthSizeBound.
SChain.lean (a4bc8cecac40a1f5fd307661e151639aaf6a6efa): RestSize, SizeWindowsSplit.
ErrorFormsWeakWindowsFalse.lean (1d1d179d111b5aa668893327264648558f30fdb6): errorBracketSizeWindows.
ChainSlopeWindows/LipschitzWeightAndMinimum.lean (4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b): proposition_size_bound.

## 1. Exact premises
x>=3, eps>0, C>=0, n>0, b>0, 0<=aE<=2xb, nT>=n*x^(-eps/8)/2, x^(-eps)<=nT2/n<=1,
x^(1/2-eps)<=m<=x^(1/2+eps/2),
xm<=k<=n^2*x^(1/2-eps),
26<=x^(3eps/8). Counts n,nT,nT2,m natural. All denominators below positive by these hypotheses.
Err<=x^(C eps)*B, where
B=nT*aE*(1+m^2/k)+m*(2*n*m*b*x^eps+nT2*k*b*x^eps/(n^2*x^(-eps))).
The subgroup argument supplies Q*delta/2*(Gx-4X)<=Err+2Q/x, where Q=nT*m*b, delta=nT2/n, X=x^(1/2+eps).

## 2. Human simplification: normalize before expanding
Divide the four terms of B by Q. In order:
1. aE/(mb)<=2x/m<=2x^(1/2+eps).
2. aE*m/(kb)<=2xm/k<=2.
3. 2nm*x^eps/nT<=4m*x^(9eps/8)<=4x^(1/2+13eps/8).
4. nT2*k*x^(2eps)/(n^2*nT)<=2k*x^(17eps/8)/n^2<=2x^(1/2+9eps/8).
All four are bounded by their constants times Y=x^(1/2+13eps/8)>=1, giving B/Q<=10Y. These reproduce the source's SZ.T1--T4 with a single common normalization.
With P=x^(C eps)>=1, the input inequality yields delta*(Gx-4X)<=20PY+4/x<=22PY (x>=3, PY>=1).
If Gx-4X<=0 the next upper bound is immediate. Otherwise use delta>=x^(-eps)>0 to get Gx-4X<=22PY*x^eps. Hence
Gx <= 4X+22x^(1/2+(C+21/8)eps)
   <=26x^(1/2+(C+21/8)eps)
   <=x^(1/2+(C+3)eps).
This retains the source constants and hypotheses, while exposing the actual mechanism: the inverse row count x/m, the direct row count m, and the scaled k/n^2 are all controlled at square-root order. The 13/8 loss comes from the third term, 1 from thick-set density, and 3/8 from absorption of 26. No novel RH proof or URT advantage asserted.

## 3. Executed independent regression (JS BigInt in tool isolate)
120 exact boundary-combination cases passed. For q in {2,3,8,53,100}, set eps=1/q, x=26^(8q), n=2x, nT=n/52, b=3, aE=2xb. Choose m at either endpoint, nT2 at either endpoint, k at either endpoint, C in {0,2,3}. All powers used have integral exponents in base 26. Evaluate the four terms and total as rational numerators with common denominator k*n^2; compare by integer cross multiplication. Also take Err=x^(C eps)*B and the maximum Gx permitted by the input inequality, verifying final bound exactly. These are constructed size-budget fixtures only, not native geometric data. Reproduction:
```js
let count=0;
for(const q of [2,3,8,53,100]){
 const p=i=>26n**BigInt(i), x=p(8*q), n=2n*x,nT=n/52n,b=3n,a=2n*x*b;
 const lo=p(4*q-8),hi=p(4*q+4),Y=p(4*q+13),X=p(4*q+8);
 for(const m of [lo,hi])for(const nT2 of [n/p(8),n])for(const k of [x*m,n*n*lo])for(const C of [0,2,3]){
  if(k<x*m)continue;
  const Q=nT*m*b,P=p(8*C),den=k*n*n;
  const ts=[nT*a*den,nT*a*m*m*n*n,m*2n*n*m*b*p(8)*den,m*nT2*k*b*p(16)*k];
  const cap=[2n,2n,4n,2n];
  if(ts.some((v,i)=>v>cap[i]*Y*Q*den))throw Error("term");
  const errNum=P*ts.reduce((a,b)=>a+b,0n);
  if(errNum>10n*P*Y*Q*den)throw Error("sum");
  const Gden=Q*nT2*den*x,Gnum=4n*X*Gden+2n*n*(errNum*x+2n*Q*den);
  if(Gnum>p(4*q+8*(C+3))*Gden)throw Error("final");
  count++;
 }
}
if(count!==120)throw Error("count");
```

## 4. Origin of the geometric size conditions — next frontier, not solved here
Formalism/SharpRestriction/GlobalSchurBounds/TieGlobal.lean (00acf811793877fe42d18c0d69f2d5833f75bf94) explicitly includes RestSize and ErrWindows in ChainTied; TiePts identifies m with the native rank R.m. These are not yet independently derived geometric conditions in this reconstruction.
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LinkGl.lean (31359d438c3bb3c5050f9cab94dba28c5b64c72a) obtains LinkGLOBAL through famGLmin_of_realPlaceSecondLayer and link8, with constants 2,3,2,0. This is the exact upstream call to investigate next, using imports Formalism/SharpRestriction/GlobalSchurBounds/TuSizeOfRealPlaceSecondLayer.lean and LogXLowerFamilyOfTheorems.lean.
RESUME HERE: locate link8 producer and native ranks/scales construction (FamCore imports DFam); show how m, k and group sizes satisfy the exact window conditions for every sufficiently small eps. Do not substitute the model fixture in PChain for actual geometry. Continue separately toward theta-integral adapter. No whole-export processing or local Lean check this session.
HANDOFF TO: positivity geometry, character boxes, human proof editor.



---

## Appendix 8: math/2026-11-24_window_exponent_and_character_projection.md
Working-repo blob 469eabc7fe6507abe6d4c79bc8d1616275917a61.

# Arithmetic-window exponent and subgroup projection
Status: SOURCE-MATCHED conditional derivation. Original source revision 40e56bab026552e089d7afcfeff08d2defb9c005. Follows analytic_zero_exclusion_chapter. No newly executed Lean kernel check.

## 1. Exact quantifier bridge
Source: src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean (a6ac464a67f99a546566ee3a3e0fd1db1f4c2550), Window.lean (099d96fec932b03a505ea79a81c45bcc3fbf0ea3).
Fix a primitive character psi and level Lambda containing it. Fix la>1. HasWindows(S,la) means for every real y there is Y>=y with the entire interval [Y,Y^la] contained in S. We only use Y>=1. ChebyshevInequalityAtWindowScale supplies fixed eD,eL and eps1>0 such that for every 0<eps<eps1 there exists a family Fm with EFamC Lambda (core Fm), HasWindows(Fm.Win,la), and constants K,cHH,eK,CL,x0 independent of x for which ChainTied holds at every x>=x0 in the window set. ChebyshevInequalityOnWindows supplies x1 (allowed to depend on the fixed family and eps) with Lambda.Gm(x)<=x^(1/2+(eD+eL+7)eps) for x>=x1 in Fm.Win.
For any s with sigma=Re(s)>1/2, let q=min(sigma-1/2,1/2)>0, theta=1/2+q/2, A=eD+eL+7. Choose eps=min(eps1/2,(q/2)/(|A|+1)). Then 0<eps<eps1 and A eps<=q/2, so theta<sigma and 0<theta<1. For any desired lower window start Y0, select Y>=max(Y0,x1,1) using HasWindows. For every x in [Y,Y^la], Lambda.Gm(x)<=x^(1/2+A eps)<=x^theta since x>=1. FormBAt(la) now implies ZeroFreeAbove(theta) and hence L(psi,s)!=0. This is level_of_tiedWin, without reversing any quantifier or claiming the same family works for every eps.
zeroFreeOn_of_tiedWin_cyc chooses Lambda=Level.cyc psi containing psi and repeats the argument for each psi satisfying Q. In the source call in ZeroFreeAllOfTopG.lean, Q=True. FormB is supplied by PrimitiveCosets/Imports.lean (prior chapter); its window exponent delta=la-1 and constant C=1. No epsilon limit of L-functions is involved: epsilon is selected after s is fixed.

## 2. Geometry-to-bounds interface
Sources under src/Development/AutomorphicArithmetic/: CharacterBoxes/DivinNOfHypV.lean (5321920359316653b7627951429a6d7555c311b0), CharacterBoxes/DesWin.lean (94820ef32775f43f41c61da2b892a121d0549b86), PrimitiveCosets/WindowInequalityOfArtinInputs.lean (c349e34925ac26b8bc76bd36e9b91562f86d6b8d), PrimitiveCosets/CoreAtH.lean (0ba3621036f19146e7e67fa9c0e8a1c38661a097).
FamilyClassConnected is the fixed-eD/eL, variable-eps quantifier structure. topDesWin intersects the nine closed conditions' epsilon threshold with the design-existence threshold; obtains a transported condition K; obtains a design Fm and CH satisfying K, size conditions and family membership; obtains LinkN, LinkDIVt, LinkEta, LinkIRR, SmallLevelRankEq, rank, LinkG, LinkS and LinkGLOBAL simultaneously. Uses HypV, LinkN and SmallLevelRankEq via divinN_of_hypV to get DIVinN, then LinkDIVt, mu rank and size lemmas feed LinkGLOBAL to yield ChainTied. Exact closure/transport of each named condition still requires proof reconstruction. Source shapeWin calls topDesWin with Cabs=2,C0=3,eD=2,eL=0 at that construction; existential result hides those constants, and the general downstream argument does not require knowing them.
windowInequality_of_artinInputs takes a Tied-to-FamCoreConstantBounds implication. It combines the EFamC threshold xE, ChainTied threshold x0, core_gm threshold x1 using max(x1,max(x0,xE)). At every qualifying x, select the same host index i provided by FamCoreConstantBounds and apply EFamC at i and CoreAtH at i; core_gm supplies the bound. This is a legitimate pointwise existence selection, not uniform i across x. CoreAtH includes character/log-derivative compatibility, data x and eps, bounded eDiv/eLoss/cHH, coverage of subgroup A0 by tr, IdentU, SizeData2, ErrWindows, BNBoundsU, SizesA, ThinScales, CostWindows, RestSize and T2 subset A0. These are substantial obligations, not optional scaffolding.

## 3. Exact finite-group simplification at the arithmetic core
Sources: DedekindLFunctions/LandauTheorems/ChCore.lean (878f5077bc382426c7da988e5a375b85deeaa7de), ChTop.lean (ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5), PrimitiveCosets/CoreGm.lean (3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d).
For finite abelian H and subgroup A0, let PsiA(A0) be additive characters of E0 x H trivial on {0} x A0. For s in A0, the source's sum_A identity is
 sum_{u in A0} psi(-e1(s+u-t)) = |A0| psi(e1(t)) if psi in PsiA(A0), else 0,
where e1(t)=((1,0),t) and E0=Z/2 x Z/2. Proof: expand additive character on the sum e1(t)+(0,-s)+(0,-u). If restricted character is trivial every term is 1; otherwise its finite character sum is zero by translation invariance. Thus subgroup averaging projects onto the annihilator, with no arbitrary mode deletion. This is ordinary exact character orthogonality, not evidence of URT-specific speedup.
sum_Th uses this to collapse an average of thick-channel sums to a sum only over PsiA. th_le bounds the difference of the thick approximation and true De by 2 fPl(H)[3(x+1)(eta+1)+(x+1)b theta_thin]; CostWindows reduces this to 2b/x. CharacterBalanceMoves.core sums over A0 and divides by its positive cardinality, yielding
 |TT| m b (delta2(T2)/2) Y <= Err + 2 |TT| m b/x,
under its exact hY lower bound on the character sum and hTop upper bound on every gapA at u0 in A0. The thick and thin weights and size constraints are essential.
one_char controls retained and omitted characters with derivative and phase-discrepancy bounds; sum_vv identifies GmA-SigA. ChCore.ch_core chooses Y=GmA-SigA-4 x^(1/2+eps); after applying the preceding inequality and proposition_size_bound, it obtains
 GmA <= x^(1/2+(C+3)eps)+SigA.
ChTop.ch_top identifies gapA = Dd.ASK-Dd.Main and derives gapA<=x^(CErr(Cc)eps)*errorBracketSizeWindows from each_unit_bound_statement and errX5at_le and BNBoundsU. All named conditions remain obligations.
CoreGm.core_gm uses C=eD+eL+3 (source initially max(eD+eL,0)+3, proves nonnegativity before simplifying). The main term becomes x^(1/2+(eD+eL+6)eps) via gmA_eq. The omitted-channel error estimate from sigA_le plus x^eps>=1+4*Lambda.o absorbs the remaining term and gives exponent 1/2+(eD+eL+7)eps. No inference of a square-root bound from finite group averaging alone.

## 4. Integration / exact next work
The exponent loss +7 has three source-level stages: +3 from CErr, +3 from ch_core, +1 from the final absorption. The source does not obtain 1/2 by numerically fitting a constant; the square-root base is built into the rank/size conditions used in ch_core and earlier geometric arguments. Need reconstruct why those conditions hold. Do not claim full RH proof complete.
RESUME HERE: fetch proposition_size_bound and size_windows_split from SplitInertia import tree; reconstruct the exact size-budget inequality and its origin in RestSize, especially m<=x^(1/2+eps/2), and trace the nine closed conditions in shapeWin to their producers. In parallel, integration must recover the exact theta-integrals-to-every-character adapter; this chapter follows verified analytic branch only.
Tests: original source fetched at pinned revision; expressions and quantifiers manually checked. No local Lean execution or whole-export benchmark.
HANDOFF TO: Character Boxes, Positivity Geometry, Human Proof Editor, integration.



---

## Appendix 9: specialists/prime_window/RUN1_WINDOW_RECONSTRUCTION.md
Working-repo blob dfad9f489e4cc5673fd18ca5ed9486cad655339f.

# Prime-window translator — run 1 — 2026-11-24

RESULT: SOURCE-MATCHED / hand-derived exact window bridge; independent finite regression checks executed locally. RH project OPEN. No Lean elaboration or kernel verification. The source theorem is conditional; do not confuse the proof of the implication with the proof of its antecedent.

## Continuity and version lock
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, research log/protocol, continuity, and the dependency, acceleration and kernel-extractor run-1 checkpoints. No prime_window lane file existed at preflight. Prior protocol already mentions a WindowHypOfRpow excerpt translation; this run extends it with exact pinned declarations, complete Gm expansion, explicit threshold, change-of-variable proof and executable regression cases. It does not duplicate the Landau pole/analytic-continuation lane. Existing physical CI verdict: PASS at 07:05 UTC for commit 9aa5afb, run 45342893347, unrelated to this result.

Upstream source repository: https://github.com/leanprover-community/riemann-hypothesis
PIN = 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest upstream observed 343b1de38bbe4c5c66f1c1c0afd7c34e8645acdf (2026-11-24 06:57:31 UTC); its CharFamily and LandauZeroFreeCriterion files have changed blobs cac521ab291c9dab261508613d4d12195cdfb799 and f4c5124f8a0188f85b60b2687864d531f9c0a3d8. Old paths for WindowHypOfRpow, WindowHypUOfWindowHyp and ZeroFreeOfRpowWindow returned HTTP 404 at latest revision. Do not assume the declarations were deleted rather than relocated. Keep revision-specific graphs separate.

All paths below relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/ at PIN. GitHub-reported blob hashes and source line spans:

| File | Blob SHA | Exact declaration / lines |
| --- | --- | --- |
| CharFamily.lean | 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 | Deduction.ramp 10–11; Gchi 15–19; G 21–22; CharFamily 24–32; Gm 36; ZeroFree 38–39; WindowHyp 41–45 |
| LandauZeroFreeCriterion.lean | 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 | gm 9; zeroSet 11–13; PoleData 15–23; WindowHypU 25–29 |
| LandauTheorems/WindowHypOfRpow.lean | dde1c159371538875c28374574ca7e452b0450d9 | windowHyp_of_rpow_eventually 9–25; windowHyp_of_rpow 27–57 |
| LandauTheorems/WindowHypUOfWindowHyp.lean | 701f0502ae106ab89e390105cd9c98e6cf881e1a | image lemma 9–19; fun lemma 21–27; windowHypU_of_windowHyp 29–56 |
| LandauTheorems/ZeroFreeOfRpowWindow.lean | 2ed00ad3aa862f3e522686557fb8f559b17fc002 | zeroFree_of_rpow_window 11–14 |
| LandauTheorems/lemmaL.lean | 6c37aebd05121b6d68e3532d8529f0ce8357386f | lemmaL 13–22 |

To reproduce source inspection, use git show PIN:src/Development/AutomorphicArithmetic/DedekindLFunctions/<file> | nl -ba, and git rev-parse PIN:<full-path>. Source read via connector, not local git checkout; SHA identities reported by connector, not independently rehashed.

## 1. The arithmetic object: exact expansion of Gm

Fix a finite index type I, positive integer modulus N_i for each i, a complex Dirichlet character chi_i mod N_i, and positive real coefficients a_i. Admissibility: for each i, either N_i=1 or chi_i is not the identity character. No common modulus or normalization sum a_i=1 is required.

For real y>=1 and complex f on natural numbers, define
  ramp(f,y) = sum_{p prime} sum_{k>=1, p^k<=y} log(p) f(p^k) (y/p^k - 1).
This is the finite Lean sum over n in range(floor_nat(y)+1), with von Mangoldt Lambda(n) and max(y/n-1,0). Only prime powers survive because Lambda(0)=Lambda(1)=0 and Lambda(p^k)=log p. All other terms vanish. A prime power precisely at y contributes zero. For n>=2 in the finite sum n<=y, the maximum equals y/n-1. The n=0 term in Lean uses totalized division and is zero because Lambda(0)=0; the displayed analytic rewriting never divides by zero. The definition is for all real y; the expansion here is stated only in the positive range relevant to the proof.

For the identity character chi=1, the source defines
  Gchi(chi,y) = ramp(chi,y) - y log y + (1+gamma_E)y.
For chi!=1,
  Gchi(chi,y) = ramp(chi,y) + y L'(1,chi)/L(1,chi).
gamma_E is the Euler–Mascheroni constant, not Cathedral granularity. The plus sign in front of L'/L is essential. The definition uses total Lean field division; this chapter does not establish L(1,chi)!=0. That is a separate analytic obligation when interpreting the ratio.

G(y) is the real part of ramp(1,y) with the same two trivial-character correction terms; Gm(F,y) = sum_i a_i Re Gchi(chi_i,y).
Equivalently let I0={i:chi_i=1}, I1=I minus I0, A0=sum_{i in I0}a_i. Then for y>=1:
  Gm(F,y) =
    sum_{p^k<=y} log(p)(y/p^k-1) sum_i a_i Re chi_i(p^k)
    - A0 y log y + A0(1+gamma_E)y
    + y sum_{i in I1} a_i Re(L'(1,chi_i)/L(1,chi_i)).
The equality follows by exchanging finite sums, real linearity of Re and real a_i. A0 need not be positive if I0 is empty. Gm is real, not necessarily nonnegative. Neither an absolute-value bound nor a lower bound for Gm is required in the window theorem. No primes are generated or controlled by URT in this identity.

## 2. The actual quantifier scopes

WindowHyp(F,theta,delta) means:
  for EVERY real eta>0 and EVERY real Y0,
    there EXISTS real Y>=Y0 and a function R:R->R such that, on I=[Y,Y^(1+delta)],
    (i) R(y)*y^(-theta-1) is Lebesgue integrable on I;
    (ii) at EVERY y in I, 0<=R(y) and Gm(F,y)<=R(y);
    (iii) integral_I R(y)*y^(-theta-1) dy <= Y^eta.

No positivity of Y, theta or delta is baked into this definition. For the theorem below, delta>0 and the constructed witness Y>=1. The pointwise conditions are not merely almost-everywhere conditions. The upper bound is one-sided; do not replace it by |Gm|. R may depend on eta and Y0, though our formula works on each chosen interval.

The hypothesis h in windowHyp_of_rpow (fixed F,theta,delta,C, with delta>0) is
  for EVERY real Y0, there EXISTS real Y>=Y0 such that
    for EVERY y in [Y,Y^(1+delta)], Gm(F,y)<=C*y^theta.
C and delta are fixed BEFORE Y0 and eta are quantified. The windows need only occur arbitrarily far out, not for every sufficiently large Y, and not just at individual y. No assumption C>=0; no restriction 0<theta<1 at this particular implication. Those restrictions enter later in lemmaL.

## 3. Full elementary proof, with explicit threshold

Source windowHyp_of_rpow_eventually uses a=eta/2>0, eventual growth of Y^a, and log Y<=Y^a/a for positive Y.
An equivalent explicit witness (derived here, not claimed to be the literal Lean witness) for K>=0 is
  Y1 = max(1,(K/a)^(1/a)) .
For K=0 use Y1=1. For y>=Y1, y^a>=K/a. For y>=1, the integral of 1/t over [1,y] is at most the integral of t^(a-1), so log y <= (y^a-1)/a <= y^a/a. Consequently
  K log y <= (K/a)y^a <= y^(2a)=y^eta.
This proves the threshold lemma for every eta>0 and K>=0, including K=0.

Now fix arbitrary eta>0 and Y0. Set K=|C| delta >=0 and take the threshold above. Apply h at max(Y0,Y1). This produces a witness Y at least both numbers, and therefore Y>=1>0. Since delta>0 and base Y>=1, B=Y^(1+delta)>=Y. For all y in I=[Y,B], y>0.

Define R(y)=|C| y^theta for all real y (using Lean's real power convention outside the interval). Within I it is nonnegative. Since C<=|C| and y^theta>=0,
  Gm(F,y)<=C y^theta<=R(y).
For every y in I,
  R(y)y^(-theta-1) = |C| y^(theta-theta-1) = |C|/y.
The cancellation is justified by y>0, including for negative theta. This last function is continuous on the compact interval I and therefore integrable. The pointwise identity gives integrability of the requested weighted function; no integrability premise for Gm is needed.

Since B>=Y>0, equality of closed-interval and ordinary interval integrals (endpoints have measure zero) gives
  integral_I R(y)y^(-theta-1)dy
  = |C| integral_Y^B dy/y
  = |C| (log B - log Y)
  = |C| ((1+delta)log Y-log Y)
  = |C| delta log Y
  <= Y^eta.
The degenerate case Y=1 gives integral zero. This discharges (i),(ii),(iii) for the chosen Y,R, with Y>=Y0. Since eta,Y0 were arbitrary, WindowHyp holds. This matches source lines 27–57, with no additional hypothesis. The crucial exact identity is independent of theta.

## 4. Logarithmic coordinate bridge (source-matched)

Define gm(F,u)=Gm(F,exp u). The target WindowHypU(g,theta,delta) is: for all eta>0 and real U0, there exist U>=U0 and Q:R->R with integrability of Q(u)exp(-theta u) on J=[U,(1+delta)U], 0<=Q(u) and g(u)<=Q(u) at every u in J, and weighted integral <=exp(eta U).

Fix eta,U0. Apply WindowHyp with Y0=exp U0, not U0, to obtain Y>=exp U0>0 and R with all three conditions. Put U=log Y, Q(u)=R(exp u). Then U>=U0 by monotonicity. Exponential is strictly increasing, injective and differentiable with derivative exp u. It maps J bijectively to I=[Y,Y^(1+delta)] since exp((1+delta)log Y)=Y^(1+delta). This image identity holds also for empty or singleton intervals; do not add U>=0 to the source theorem. (For negative U and delta>0 both intervals are empty.) In the composite with section 3, U>=0 automatically.

The integrand transforms by the absolute Jacobian:
  |exp u| R(exp u) (exp u)^(-theta-1)
  = Q(u) exp(-theta u).
The source uses integrableOn_image_iff_integrableOn_abs_deriv_smul and integral_image_eq_integral_abs_deriv_smul on measurable Icc, with derivative and injectivity conditions. Thus integrability transfers, the pointwise inequalities transfer by exp(u) in I, and
  integral_J Q(u) exp(-theta u) du
  = integral_I R(y)y^(-theta-1)dy
  <= Y^eta = exp(eta U).
This proves WindowHypU(gm(F),theta,delta), preserving every quantifier. Section 3 alone is not a zero-free proof.

## 5. Interface to the next lane

zeroFree_of_rpow_window adds 0<theta<1 and delta>0 to h. It applies lemmaL F htheta htheta1 hdelta (windowHyp_of_rpow F hdelta h).
ZeroFree F theta means for every i and complex s with theta<Re(s), L(s,chi_i)!=0. No claim about equality Re(s)=theta. In lemmaL, source 15–22, poleData F and landau_window are invoked after the log bridge, with Re(s)>=1 handled by charFamily_LFunction_ne_zero_of_one_le_re, and Re(s)<1 handled by membership of the alleged zero s in zeroSet and the bound from landau_window. These dependencies are deliberately not declared reconstructed in this chapter. The definition of ZeroFree includes the source's Lean LFunction conventions at the trivial-character pole; that boundary is the separate Landau lane's responsibility.

Logical boundary: existence of arbitrarily distant windows satisfying h is the hard upstream arithmetic premise; neither the cancellation nor this chapter proves it. No numerical finite prime data can establish it. No URT-specific acceleration result is asserted. No assumptions dropped or added in the source implications; the explicit threshold formula is an explanatory witness derived under the source hypotheses.

## 6. Executed regression certificate

Executed in local Python 3 sandbox, not Lean. Exact rational coefficient checks compare prime-power enumeration against integer-factorization-based von Mangoldt support (formal log(p) coefficient vectors; no numerical log needed). Floating point checks test the explicit threshold and the weight/Jacobian identities in selected cases. They are not universal proof substitutes.

Copy this block to a temporary Python file and run python3 <file>.

~~~python
from collections import defaultdict
from fractions import Fraction as Q
from math import isclose, log, exp

def prime_base(n):
    if n < 2: return None
    p = next((d for d in range(2, n) if n % d == 0), n)
    while n % p == 0: n //= p
    return p if n == 1 else None

def char4(n):
    return 0 if n % 2 == 0 else (1 if n % 4 == 1 else -1)

def direct(y, f):
    a = defaultdict(Q)
    for n in range(2, int(y)+1):
        p = prime_base(n)
        if p is not None: a[p] += f(n)*max(y/n-1, Q(0))
    return {p:v for p,v in a.items() if v}

def powers(y, f):
    a = defaultdict(Q)
    for p in range(2, int(y)+1):
        if any(p%d == 0 for d in range(2,p)): continue
        n = p
        while n <= y:
            a[p] += f(n)*(y/n-1)
            n *= p
    return {p:v for p,v in a.items() if v}

n_ramp=0
for k in range(2,201):
    for f in (lambda n:1, char4, lambda n: 1+2*char4(n)):
        y=Q(k,2)
        assert direct(y,f)==powers(y,f), (y,f)
        n_ramp+=1

n_bound=0
for K in (0,0.125,1,2,10):
    for eta in (0.25,0.5,1,2,4):
        a=eta/2
        L0=max(0,log(K/a)/a) if K else 0
        for L in (L0,L0+0.125,L0+1,L0+4):
            assert K*L <= exp(eta*L)*(1+1e-12)
            n_bound+=1

n_weight=0
for C in (-3,0,2):
    for theta in (-2,-0.5,0,0.5,2):
        for y in (1,1.5,2,10,100):
            R=abs(C)*y**theta
            assert isclose(R*y**(-theta-1),abs(C)/y,rel_tol=1e-12,abs_tol=1e-12)
            u=log(y)
            assert isclose(y*(R*y**(-theta-1)),R*exp(-theta*u),rel_tol=1e-12,abs_tol=1e-12)
            n_weight+=1

print(f'Exact prime-power coefficient checks: {n_ramp}')
print(f'Floating-point threshold checks: {n_bound}')
print(f'Floating-point weight/Jacobian checks: {n_weight} (two identities each)')
print('All checks passed. No Gm window existence, Lean elaboration, or RH verification tested.')
~~~

Actual stdout:
~~~
Exact prime-power coefficient checks: 597
Floating-point threshold checks: 100
Floating-point weight/Jacobian checks: 75 (two identities each)
All checks passed. No Gm window existence, Lean elaboration, or RH verification tested.
~~~

No lean/lake executable found. No new CI verdict or kernel graph. The test uses real characters for small finite coefficient vectors and does not evaluate L'/L(1), gamma_E or the full Gm function. The proof of finite-sum rearrangement itself permits complex characters. Complexity of this intentionally small test's trial-division implementation is not a claimed production O(N) method.

## 7. Independent audit request and handoff

Audit lane: independently check quantifier order, fixed C/delta, sign of correction terms and one-sided Gm bound, y>0 justification, closed vs interval integrals, theta restrictions only in lemmaL, and handling of negative U/empty intervals. Compare exact original pinned declarations and Mathlib lemmas; check kernel references when available. Do not certify the harder h or PoleData from this chapter.

Metrics: 6 original source files inspected; 4 principal bridge theorems source-matched (threshold, power-to-window, window-to-log, wrapper; wrapper only mapped), 2 auxiliary change-of-variable identities translated; 772 finite regression cases (597 exact, 175 floating-point cases), zero kernel claims, zero dropped hypotheses, no full-corpus complexity or URT benchmark. Full proof coverage denominator unknown.

RESUME HERE: Locate all direct pinned-source call sites of Deduction.zeroFree_of_rpow_window and Deduction.windowHyp_of_rpow in the AutomorphicArithmetic subtree, identify the particular upstream declaration establishing the arbitrarily distant uniform Gm window h, and reconstruct its exact quantifier flow into this bridge. Keep distinct from the Landau lane's downstream pole theorem. Do not substitute an assumed power bound for the missing witness-producing proof.
HANDOFF TO: landau-criterion, formal audit, integration, human proof editor and character-box lanes.



---

## Appendix 10: specialists/landau_criterion/RUN1_LANDAU_CRITERION_RECONSTRUCTION.md
Working-repo blob c607ebbf593efa5490a599af7bdb1a63f60f539a.

# Landau criterion: complete conditional analytical argument (first reconstruction)

Date 2026-11-24. Status SOURCE-MATCHED / independently auditable human derivation; finite regression executed, not independently Lean-elaborated. This is a conditional downstream proof chapter, not a proof of the upstream arithmetic window or the entire RH. No Cathedral physics input.

## Provenance and preflight
Upstream leanprover-community/riemann-hypothesis, immutable commit 40e56bab026552e089d7afcfeff08d2defb9c005. The paths below are relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/. All named files were retrieved by exact pin. Source Git blob IDs:
- CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
- LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872
- LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002
- LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f
- LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
- LandauTheorems/WindowHypUOfWindowHyp.lean 701f0502ae106ab89e390105cd9c98e6cf881e1a
- LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109
- LandauTheorems/poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1
- LandauTheorems/LogDerivLocal.lean 56dd45f8630096e041bdad64152e07862e0d4c27
- LandauTheorems/mellinGchiOfNeOne.lean 675a25d278977948c8327f0e1e2e31fb3a990a7d
- LandauTheorems/mellinGchiModOne.lean 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc (initial 6500 characters inspected; final statement included, final proof body not fully inspected)
- LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a
- LandauTheorems/LandauDichotomy.lean 947dae363ce629febcba27b1b70355438f8639a0
- LandauTheorems/LandauNearest.lean 6a177498987e1ef453727131bf2004bc797a01a2
- LandauTheorems/LandauFinite.lean 46a0dc63f21009582a2dda61c1267e9aad88bde5
- LandauTheorems/LandauCoeff.lean dc8287f2dbe7c767dcb77893eaf53d07092ed1f3
- LandauTheorems/IteratedDerivLaplace.lean c1c05ec801b258064f1e14fb9d7e624eb7345382
- LandauTheorems/landauWindowIneq.lean cda93b0185260d72395d2ef2c90314e0fa7128ef
- LandauTheorems/landauTails.lean 0e55797bac5320acf02d9acc832ca53df716e436
- LandauTheorems/kernelIntegral.lean d785c54e03a55b0ef6c0fcb64bc4f8158e803642
- LandauTheorems/LandauKernelMax.lean b230a9e40c3710eac205f32ceb8a44f2d003b647
- LandauTheorems/LandauGrowthContra.lean bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda
- LandauTheorems/LandauPoleReLe.lean 205c7380b79e78b2752ed67aeb069f2a9d12cc77
- LandauTheorems/LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7
- LandauTheorems/LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b

Read protocol, handoff, expansion, AGENTS, continuity, state/log/protocol and latest state-branch CI summary (physical CI PASS at 9aa5afb, not evidence for this chapter). Peer prime-window RUN1 already establishes the elementary power/log window bridge; no duplication of its finite prime tests. Read integration reflection/export, dependencies inventory, kernel and acceleration RESUME notes. No own lane file existed at preflight. Upstream main observed 6c6821263d6b80f4ec3d7479b0159340c1b2f65e at 07:18:26 UTC. Its CharFamily, LandauZeroFreeCriterion, landauWindow blobs differ (cac521ab291c9dab261508613d4d12195cdfb799, f4c5124f8a0188f85b60b2687864d531f9c0a3d8, 78d2ec6cc11c6e05db6c5a6b3e62a76ab43b97cc); the old paths ZeroFreeOfRpowWindow, lemmaL, poleData return 404 at that head. Semantic equivalence of revisions NOT established. All conclusions below exclusively about original pin.

## 1. Statement and exact logical direction
For a finite family F of Dirichlet characters chi_i with moduli N_i>0, each either modulus one or nonprincipal, and strictly positive real weights a_i, define Gm(F,y)=sum_i a_i Re Gchi_i(y) (CharFamily.lean). For fixed real theta, delta, C with 0<theta<1 and delta>0, suppose
  forall real Y0 exists real Y>=Y0 forall y in [Y,Y^(1+delta)]: Gm(F,y)<=C*y^theta.
Then forall i and complex s, theta<Re(s) implies L(chi_i,s)!=0 (Lean convention). No assumption C>=0; no absolute-value upper bound required. No conclusion on Re(s)=theta. The ordinary meromorphic zeta pole at s=1 is not a zero; Lean's totalized value at 1 is nonzero, not the value of a holomorphic extension of zeta itself.

zeroFree_of_rpow_window = lemmaL applied to windowHyp_of_rpow. Prime lane has reconstructed the latter: enlarge Y>=1 as necessary, choose R(y)=|C| y^theta, weighted integral exactly |C| delta log Y <=Y^eta for each eta>0. WindowHyp requires an integrable weighted nonnegative majorant, not nonnegativity of Gm. Under y=e^u, U=log Y, obtain WindowHypU(g,theta,delta) for g(u)=Gm(F,e^u): for every eta>0 and real U0 there are U>=U0 and R(u)>=max(0,g(u)) on [U,(1+delta)U] with R(u)e^(-theta u) integrable there and integral <=e^(eta U). U can be chosen >=1 by asking for larger U0. Do not reverse the implications or assume windows are eventually contiguous.

## 2. Constructing PoleData (poleData.lean)
For an entire function f with f(1)!=0, let b=f'(1)/f(1), kappa a complex constant, and N(s)=f'(s)/f(s)-s b+kappa(1-s). Define P(s)=-N(s)/[s(s-1)] away from 1 (at 1 extend using divided difference of N). Since N(1)=0, the apparent singularity at 1 is removable, and P is holomorphic away from 0 and the zeros of f. The identity theorem (f(1)!=0) implies isolated zeros. At a zero rho!=0 with order m>=1, factor f(s)=(s-rho)^m h(s), h(rho)!=0. Then f'/f=m/(s-rho)+h'/h. Since rho!=1, multiply by -1/[s(s-1)] and separate its value at rho from its analytic divided difference. The result is
  P(s)=m*(-1/[rho(rho-1)])/(s-rho)+analytic remainder.
At a nonzero non-root take m=0. Source logDeriv_local preserves analytic order and all the local eventual-equality conditions. This residue formula includes multiplicities; a multiple L-zero becomes a simple logarithmic-derivative pole.

Nonprincipal chi: f=L(chi,.), kappa=0, entire and f(1)!=0 by imported Mathlib results. For modulus-one chi take f(s)=(s-1)zeta(s) for s!=1, and f(1)=1 by the residue at 1. Its derivative at 1 is Euler's constant gamma_E, and kappa=1. Source uses riemannZeta_one_ne_zero to identify zeros even at the totalized point. Thus
  P_nonprincipal(s)=-(L'/L(s)-s L'/L(1))/(s(s-1)),
  P_modone(s)=-(zeta'/zeta(s)+1/(s-1)+1-(1+gamma_E)s)/(s(s-1)).
These identities away from 1 are exactly the Mellin transforms of Gchi at Re(s)>1. For the explanatory calculation, each ramp (y/n-1)_+ has Mellin integral n^(-s)/(s(s-1)), n>=1. Interchange prime-weighted sum/integral by absolute integrability, using the twisted von Mangoldt series = -L'/L. Correction y times b gives b/(s-1). For modulus one, -y log y+(1+gamma_E)y gives -1/(s-1)^2+(1+gamma_E)/(s-1), hence the displayed formula. The source uses MellinRamp, LSeriesSummable_twist_vonMangoldt and Gchi correction integrability. The full final proof body of mellin_Gchi_modOne and its transitive Mathlib prerequisites remain an audit frontier, not silently certified.

For the actual family use P_i for chi_i and P'_i for inverse chi_i (prime here denotes inverse-character label, not derivative). Conjugation Gchi_inv=conj Gchi makes real part half the sum. Define Phi(s)=sum_i (a_i/2)(P_i(s)+P'_i(s)). Change variables y=e^u, dy/y=du, so for Re(s)>2:
  Phi(s)=integral_0^infinity g(u)e^(-su)du.
Measurability and |g(u)|<=C0 e^(2u) follow from measurable_Gchi, Gchi_growth and finite positive weighted sum (these imported estimates still need separate leaf audit). The bound makes the integral absolutely convergent on Re(s)>2. Z= {rho : Re(rho)>0 and some chi_i has L(chi_i,rho)=0 or L(chi_i,conj rho)=0}. Conjugate zero iff inverse-character zero (poleData_inv_zero). At any rho in Z, at least one multiplicity among the original and inverse characters is positive; the entire finite family contributes
  S=sum_i (a_i/2)(m_i+m'_i)>0,
  residue c=-S/[rho(rho-1)].
Crucial: weights are positive and all factors share the same complex phase at this particular rho; no cancellation, even at a nonreal zero. By the source's one_le_re nonvanishing theorem, rho!=1; when rho is real, 0<rho<1, so c=S/[rho(1-rho)] is strictly positive real. This covers real exceptional zeros rather than assuming their absence. The family transform is holomorphic off Z in Re(s)>0, and Z is locally discrete there, including at points not in Z. These are all seven PoleData fields: meas, growth, laplace, pos, diff, iso, pole. Finite family can be empty (Z empty, conclusion vacuous); positivity at an alleged zero uses an existing index witness.

## 3. The signed window estimate: no absolute prime bound
Write A_k(z)=(-1)^k Phi^(k)(z)/k!, k>=0. By dominated differentiation (for a small disc around Re(z)>2, dominate by C0 u^k exp(-b u), b>0), A_k(z)=integral g(u)u^k e^(-zu)/k! du. This is landau_coeff and iteratedDeriv_laplace, where the signs cancel exactly.

Fix sigma>2 and let w(u)=u^k e^(-sigma u)/k!>=0 for u>=0. Triangle inequality gives |A_k(sigma+i t)|<=integral |g|w, while Re A_k(sigma)=integral gw. Thus
  |A_k(sigma+i t)|+Re A_k(sigma) <= integral (|g|+g)w.
The left second term is SIGNED, not absolute. On the chosen window, |g|+g=2 max(g,0)<=2R, regardless of arbitrarily negative g. The elementary exponential-series estimate u^k e^(-a u)/k!<=a^(-k) for a>0 gives w<= (sigma-theta)^(-k)e^(-theta u). Outside the window use |g|+g<=2C0 e^(2u). Therefore (landau_window_ineq)
  |A_k(sigma+i t)|+Re A_k(sigma)
   <= 2 (sigma-theta)^(-k) integral_window R e^(-theta u)
      +2C0 integral_outside u^k exp(-(sigma-2)u)/k!.
This is the key to exploiting a one-sided bound.

## 4. One derivative order suppresses both tails
Let l=2+6/delta, M=l(1+delta), sigma=M(2+l)>2; fix these before choosing eta or U. For U>=1 take k=ceil((1+delta/2)*sigma*U)>=U, V=(1+delta)U. Gamma integral integral_0^infty u^k e^(-a u)/k! du=a^(-k-1). Chernoff splitting, s=sigma-2>l, bounds outside [U,V] by
  e^(-l V)/(s-l)^(k+1) + e^(l U)/(s+l)^(k+1).
With a=s-l and b=s+l, use log(sigma/a)<= (sigma-a)/a and likewise b. Exact algebra and the ceiling bounds yield
  -l V+k(sigma-a)/a <= 1,
  l U+k(sigma-b)/b <= 0.
Indeed (sigma-a)/a=1/(M-1) and (1+delta/2)sigma=M(M-1); also (1+delta/2)(l-2)=l+1 and l(sigma-2+l)<=(l+1)sigma. Hence the tail integral <= C_tail/sigma^k, C_tail=e/a+1/b. No large-k limit approximation; source landau_tails constructs these constants explicitly. The certificate tests exact rational exponent inequalities.

Combine Sections 3–4: for E=sigma-theta>0, C_key=2+2 C0 |C_tail|, for every eta>0,U0 there are U>=max(U0,1) and k>=U such that for ALL real t,
  |A_k(sigma+i t)|+Re A_k(sigma) <= C_key e^(eta U)/E^k.
Here sigma,C_key fixed and U,k do not depend on t (landau_window_key). Critical quantifier uniformity: choose t from pole geometry before or after using this bound; no averaging over t, no assumption of positive g.

## 5. A pole to the right of theta forces a faster-growing derivative
Abstract PoleData implies every pole Re(rho)<=2: integral bound |Phi(s)|<=C0/(sigma0-2) for Re(s)>=sigma0>2; a nonzero residue in that region contradicts boundedness because (s-rho)Phi(s)->c!=0. So all poles strictly left of fixed sigma.

Assume rho0 in Z with Re(rho0)>theta. Write E=sigma-theta<sigma. Compact discs lying in Re>0 meet only finitely many poles: local punctured isolation at every point yields finite subcover of the compact disc. The source uses landau_finite and landau_dichotomy.

Dichotomy: if no pole in closed disc of radius E around real sigma, take D=E. Otherwise minimize the distance to real sigma over that finite nonempty set, take D this minimum. In either case open disc radius D is pole-free. If there is a pole rho1 with horizontal gap sigma-Re(rho1)<D, this is Case A. If not, the minimum-distance pole must be real beta=sigma-D, because distance>=horizontal gap>=D and equality forces Im=0. It is unique at distance D; since rho0 has horizontal gap<E, D<E. Choose a radius r with D<r<=E and no other pole in open disc using finiteness. This is Case B. The empty-closed-disc branch always falls in A. No global rightmost zero assumed, and no supremum attained assumed.

Case A: choose vertical center z=sigma+i t near sigma+i Im(rho1) by a perturbation less than epsilon=min(D-(sigma-Re(rho1)),sigma-D)/2>0. The enlarged closed disc of radius D+epsilon lies in Re>0 and contains finitely many poles. Avoid the finite set of vertical bisector heights of pairs (equal height distinct poles cannot tie since Re<sigma). For unequal heights the forbidden t is
  ((sigma-Re a)^2+(Im a)^2-(sigma-Re b)^2-(Im b)^2)/(2(Im a-Im b)).
Thus the closest pole rho to z is unique and has d=|z-rho|<D; choose d<r<=D so open disc radius r contains only rho. Poles outside enlarged disc cannot enter this disc by triangle inequality. This is landau_nearest.

Subtract c/(s-rho), and extend remainder at rho using its local analytic expansion; it is holomorphic throughout disc radius r. On circle of radius e=(d+r)/2, Cauchy coefficient estimate gives
  |A_k(z)-c/(z-rho)^(k+1)| <= M1/e^k.
The real center disc of radius D is pole-free; same e<D gives |A_k(sigma)|<=M2/e^k. Cauchy constants are finite circle norms/averages, independent of k. By reverse triangle inequality and Re A_k(sigma)>=-|A_k(sigma)|,
  |A_k(z)|+Re A_k(sigma) >= (|c|/d)/d^k -(M1+M2)/e^k.
We have 0<d<e<=E. This handles complex poles without assuming their residues positive real.

Case B: real beta>theta, closest isolated pole, d=sigma-beta>0, and d<r<=E. Again Cauchy after subtracting the pole, e=(d+r)/2, gives
  Re A_k(sigma) >= (Re c/d)/d^k - M1/e^k
with Re c>0. Add the nonnegative |A_k(sigma)| on the left and apply key estimate with t=0. A real negative residue would not provide this lower bound: the positive residue field is indispensable to this branch. This is why strictly positive family weights matter and why exceptional real zeros are accounted for.

## 6. Exponential contradiction and final implication
Both cases imply constants c_*>0, 0<d<e<=E, M_*,C_key such that for every eta>0,U0 there are U>=U0 and natural k>=U with
  c_*/d^k <= M_*/e^k + C_key e^(eta U)/E^k.
Take U>=0, majorize right by C_* e^(eta U)/e^k where C_*=|M_*|+|C_key|. Put L=log(e/d)>0, eta=L/2, U0=2C_*/(c_* L). Then e^(eta U)>=1+eta U>=1+C_*/c_*, so C_*<c_*e^(eta U); and k>=U implies e^(2eta U)<=e^(kL)=(e/d)^k. Hence C_*e^(eta U)/e^k < c_*/d^k, contradiction. This exactly follows landau_growth_contra and landau_window_contra. No sign of M_* or C needed in abstract growth lemma; their absolute values suffice. Thus every rho in Z satisfies Re(rho)<=theta.

Finally lemmaL: suppose L(chi_i,s)=0 and Re(s)>theta. Source splits Re(s)>=1, excluded by charFamily_LFunction_ne_zero_of_one_le_re (modulus one uses zeta nonzero; nonprincipal uses Dirichlet nonzero), and Re(s)<1, where Re(s)>theta>0 implies s in Z via the original-character disjunct. landau_window gives Re(s)<=theta, contradiction. Strict threshold and both branches preserved. Combining the peer's power/log bridge proves the conditional zeroFree_of_rpow_window. The arithmetic proof of the initial window hypothesis is separate and must not be inferred from this criterion.

## 7. Executed finite regression certificate
Local Python 3 standard library. Copy block to a Python file and execute; not a proof of universal inequalities or Lean verification.
~~~python
from fractions import Fraction as Q
from itertools import product
from math import ceil, exp, log
def run():
    counts = dict(tails=0, residue=0, signed_bound=0, geometry=0, growth=0)
    for delta,U in product(map(Q,['1/100','1/8','1/2','1','3','10']),map(Q,['1','3/2','4','10','100'])):
        l=2+6/delta; M=l*(1+delta); sigma=M*(2+l)
        k=ceil((1+delta/2)*sigma*U); a=sigma-2-l; b=sigma-2+l
        assert sigma>2 and a>0 and b>0 and k>=U
        assert -l*(1+delta)*U+k*(sigma-a)/a<=1
        assert l*U+k*(sigma-b)/b<=0
        counts['tails']+=1
    for rho,m,n,a,b in product(map(Q,['1/100','1/4','1/2','99/100']),range(3),range(3),map(Q,['1/3','2']),map(Q,['1/7','3'])):
        S=a*m/2+b*n/2
        assert (S>0)==(m+n>0)
        if S: assert -S/(rho*(rho-1))>0
        counts['residue']+=1
    for g,R,w in product(range(-5,6),range(6),map(Q,['0','1/7','3'])):
        if g<=R:
            assert (abs(g)+g)*w<=2*R*w
            counts['signed_bound']+=1
    sigma=Q(3); points=[(x,y) for x in map(Q,['1/4','1/2','3/4','1','2']) for y in range(-2,3)]
    def dsq(p,t): return (sigma-p[0])**2+(t-p[1])**2
    for p,q in product(points,repeat=2):
        if p==q: continue
        if p[1]==q[1]: assert dsq(p,0)!=dsq(q,0)
        else:
            t=((sigma-p[0])**2+p[1]**2-(sigma-q[0])**2-q[1]**2)/(2*(p[1]-q[1]))
            assert dsq(p,t)==dsq(q,t) and dsq(p,t+1)!=dsq(q,t+1)
        counts['geometry']+=1
    for c,d,e,C in product([0.1,1,3],[0.25,1,2],[3,4,10],[0.0,0.5,10]):
        L=log(e/d); eta=L/2; U0=2*C/(c*L)
        for U in [U0,U0+1,U0+10]:
            for k in [ceil(U),ceil(U)+1,ceil(U)+10]:
                assert C==0 or log(C)+eta*U < log(c)+k*L
                counts['growth']+=1
    print(counts)
    print('All finite tests passed; not a Lean/kernel verification.')
if __name__=='__main__': run()
~~~
Actual stdout:
{'tails': 30, 'residue': 144, 'signed_bound': 153, 'geometry': 600, 'growth': 729}
All finite tests passed; not a Lean/kernel verification.
927 exact rational/integer cases and 729 floating-point log-space cases = 1656 finite tests. No Lean or Lake executable found. No new CI run verified. No full-corpus proof coverage percentage or URT speed claim. 25 pinned modules read, one partly. Seven abstract fields preserved; two geometrical branches reconstructed; one main conditional analytical criterion reconstructed at source level; no extra premises or removed hypotheses. Arithmetic window remains OPEN in this lane's chapter.

RESUME HERE: finish the final body of mellin_Gchi_modOne.lean and retrieve GchiGrowth.lean, measurableGchi.lean, GchiConj.lean, LFunctionConj.lean and MellinRamp.lean at original pin. Reconstruct the exact growth/measurability/conjugation and Mellin leaf obligations, including the real exceptional-zero and modulus-one pole convention; compare current upstream renamed/moved files only as a separate revision audit. Then send complete pole construction for independent audit. Do not repeat prime-window witness producer research assigned to prime lane.

HANDOFF TO: integration, human proof editor, audit, prime-window and character-box lanes. The signed coefficient bound, tail choice, noncancelling residues, pole geometry dichotomy, and growth contradiction are ready for independent source-level review.


---

## Appendix 11: math/2026-11-24_analytic_zero_exclusion_chapter.md
Working-repo blob 2c296ac9e55158223fb239104a8a318f0e95f923.

# Human proof chapter: from arithmetic windows to exclusion of zeros

Status: SOURCE-MATCHED mathematical reconstruction, not a new kernel verification. Upstream commit 40e56bab026552e089d7afcfeff08d2defb9c005. This chapter supplies the actual analytic subargument, not just theorem names. It does not establish the upstream arithmetic window estimates independently.

## 1. Prime-power signal, precise assumptions
Source: Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean (blob 81c8dfd66d910d083d5bc88c664c7917fdbdfe96).
For a Dirichlet character chi, let
 A_chi(y) = sum_{n <= floor(y)} Lambda(n) chi(n) max(y/n - 1,0),
with von Mangoldt Lambda. For a trivial character define G_chi(y)=A_chi(y)-y log y+(1+gamma_E)y. Otherwise G_chi(y)=A_chi(y)+y L'(chi,1)/L(chi,1).
A character family F has finite index set, positive moduli N_i, characters chi_i, real weights a_i>0, and admissibility N_i=1 or chi_i != 1. Define G_m(y)=sum_i a_i Re G_chi_i(y).
For fixed 0<theta<1 and delta>0, suppose for every real Y0 there is Y>=Y0 such that G_m(y)<=C y^theta for every y in [Y,Y^(1+delta)], with C fixed real. The estimate is ONE-SIDED, not an absolute bound. Arbitrarily late full multiplicative windows suffice; no eventual all-y bound assumed.

## 2. Reduce to logarithmic windows
Sources: WindowHypOfRpow.lean (dde1c159371538875c28374574ca7e452b0450d9), WindowHypUOfWindowHyp.lean (701f0502ae106ab89e390105cd9c98e6cf881e1a), under Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/.
For every eta>0 choose Y sufficiently large so Y>=1 and |C| delta log Y<=Y^eta. This is possible since log Y=o(Y^eta); the source proves it via log Y <= Y^(eta/2)/(eta/2) and Y^(eta/2)>=|C|delta/(eta/2). The original window hypothesis permits Y above the maximum of this threshold and any prescribed starting point.
Set R(y)=|C| y^theta, which is nonnegative and dominates G_m on the selected window. Its weighted integral is exactly |C| delta log Y, hence <=Y^eta. With u=log y, U=log Y, let g(u)=G_m(exp u) and B(u)=R(exp u). Then the interval becomes [U,(1+delta)U] and the weighted integral becomes integral B(u) exp(-theta u) du <=exp(eta U). For every eta>0 and every real U0 there is such U>=U0 and an integrable nonnegative majorant B>=g on that interval. This is precisely WindowHypU.

## 3. Zeros create noncancelling poles
Sources: DedekindLFunctions/LandauZeroFreeCriterion.lean (54fd0de979e0dad6ac7709ad8ecbec8a29e21872), LandauTheorems/poleData.lean (1f7fdc4409d2f1185700764c51d5c17a907d76e1).
There exists Phi with Phi(s)=integral_0^infty g(u) exp(-s u) du for Re(s)>2; g is measurable and |g(u)|<=C0 exp(2u) for u>=0. In Re(s)>0 its exceptional set Z comprises zeros of any family L-function and their complex conjugates. Phi is differentiable outside Z and Z is locally isolated in the right half-plane.
At rho in Z, Phi(s)=c/(s-rho)+h(s) near rho, with h analytic and c != 0. The residue is
 c = -S/[rho(rho-1)], S=sum_i a_i(m_i+m_i')/2 >0,
where m_i,m_i' are nonnegative multiplicities of zeros of L(chi_i,s), L(chi_i^{-1},s). A zero of at least one contributes positively. The common factor prevents cancellation between family members. A real rho satisfies 0<rho<1 because no member vanishes for Re>=1, so c=S/[rho(1-rho)]>0 is real. These signs matter in the one-sided argument. The source regularises the modulus-one zeta factor using (s-1)zeta(s) at s=1; other members are nontrivial by admissibility.

## 4. The analytic contradiction
Source: LandauTheorems/landauWindow.lean (7915058f10b33a52652290cd887cbccdc00e676a).
Set D_k(z)=(-1)^k Phi^(k)(z)/k!. landau_window_key proves the following using the Laplace expression, a majorant on the window, and tails outside it:
 there exist sigma>2 and C1 such that for every eta>0 and every U0 there exist U>=U0 and integer k>=U, for every real t,
 |D_k(sigma+it)|+Re D_k(sigma) <= C1 exp(eta U)/(sigma-theta)^k.
No replacement by an absolute bound on g or by a bound for all derivative orders is allowed.
Assume a pole rho0 in Z with Re rho0>theta. The source's landau_dichotomy and landau_nearest choose one of two configurations:
 A. A unique nearest pole rho to z=sigma+it, distance d>0, isolated in a disk of radius r>d, with room for an analytic disk centered at sigma; choose e=(d+r)/2 with d<e<=sigma-theta. Pole asymptotics give D_k(z)=c/(z-rho)^(k+1)+O(e^-k); Cauchy bounds give D_k(sigma)=O(e^-k). Combining the reverse triangle inequality with Re D_k(sigma)>=-|D_k(sigma)| yields A0 d^-k<=M e^-k+C1 exp(eta U)/(sigma-theta)^k, A0=|c|/d>0.
 B. A uniquely isolated real nearest pole beta>theta centered at sigma, d=sigma-beta>0, and e=(d+r)/2, d<e<=sigma-theta. Here the residue c is real positive; Re D_k(sigma)>=c/d^(k+1)-M/e^k, and the absolute-value term is nonnegative. The same inequality holds with A0=c/d>0.
In both cases, put E=sigma-theta>=e and A=|M|+|C1|. Taking U>=0 and k>=U, the inequality implies
 A0 (e/d)^k <= A exp(eta U) <= A exp(eta k).
Choose eta=(1/2)log(e/d)>0. Then A0 exp(eta k)<=A, impossible for k>=U with arbitrarily large U. If A=0 the inequality is already impossible. Thus no pole in Z has Re>theta.
This last algebraic compression is an elementary consequence of the exact source hypotheses (source counterpart landau_window_contra/landau_growth_contra), not a new RH argument or an additional URT assumption. The Cauchy, pole isolation, and window-tail lemmas are retained obligations for the full proof.

## 5. Connect back to the genuine proof chain
Deduction.lemmaL (LandauTheorems/lemmaL.lean, 6c37aebd05121b6d68e3532d8529f0ce8357386f) obtains PoleData from the family and applies landau_window to its zero set. Re>=1 is handled separately by charFamily_LFunction_ne_zero_of_one_le_re; for theta<Re<1 membership in Z gives contradiction.
Deduction.zeroFree_of_rpow_window (LandauTheorems/ZeroFreeOfRpowWindow.lean, 2ed00ad3aa862f3e522686557fb8f559b17fc002) combines sections 2-5.
The actual bridge is UpperTheory.Comparison₂.formB (Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean, 2dc9b4e690951c66ffe443e279fcada259bcce13): level_family supplies F, the signal equality and the zero-free equivalence. It instantiates delta=la-1 and C=1, where la>1 is the window exponent. This is an explicit proof-term reference, not inferred from filenames.
UpperTheory.Top.zeroFreeAll_of_topG (CharacterBoxes/ZeroFreeAllOfTopG.lean, 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1) passes level_gm_le_on_family_scales and formB to zeroFreeOn_of_tiedWin_cyc. The latter still needs its own reconstruction. plugWin uses la=3/2 (so delta=1/2), shapeWin and supplyChi; supplyChi requires VWinAt psi 401 (CharacterBoxes/SupplyChi.lean, 339885b77069601fb716a60739369805241e8222). Do NOT assume these arithmetic inputs have now been proved by the analytic chapter.
Finally UpperTheory.Top.imprimitive (CharacterBoxes/Imprimitive.lean, 97cbdce9fcc91c4f0dcc25fef62daf4c95724afa) extends primitive nonvanishing to arbitrary chi. Its L-function is the primitive L-function times finitely many Euler factors 1-chi_prim(p)p^-s. For Re s>1/2, |chi_prim(p)|<=1 and p^-Re(s)<1, so no factor vanishes. The excluded principal-character-at-one condition is transferred using changeLevel_primitiveCharacter and changeLevel_one. This establishes EveryCharacter once ZeroFreeAll is available. The reflection chapter then gives RH.

## Execution and limitations
Fetched original source at pinned revision and inspected declarations, signs, exception cases and quantifier scopes. This is source-matched prose, not executed Lean. Independent formal verification is reported at https://math.mit.edu/~drew/grh/; our own translation audit remains open. Current sandbox has about 30 GB free vs 61.57 GB raw export, 5.8 GiB RAM, no Lean installed, and MIT hostname lookup fails. Compressed export 7,699,933,588 bytes; checksum verified against publication text, not against downloaded bytes. No full-corpus graph run, no URT speedup claim. Do not attempt to download/unpack the full file in the same constrained session.
RESUME HERE: reconstruct zeroFreeOn_of_tiedWin_cyc and the source of level_gm_le_on_family_scales, then tie its arbitrarily large window guarantee to the upper arithmetic/geometry hypotheses. Separately unpack the seven-input every_character_of_theta_integrals_local_matching adapter. Preserve exact one-sided bounds and residue positivity.
HANDOFF TO: math, character boxes, positivity and integration lanes.



---

## Appendix 12: integration/2026-11-24_0718_reflection_and_export_handoff.md
Working-repo blob 6b3c337c9a2fe1acc41d8246a79a6ca8e565ee66.

# Reflection and nonvanishing junction — manual continuation

Status: SOURCE-MATCHED, not locally elaborated. Original upstream revision 40e56bab026552e089d7afcfeff08d2defb9c005.

## Exact source-matched reconstruction
- src/Main.lean (blob dbd5db70bc11b35f18fa5751216ab335321e7bfc): riemannHypothesis uses rhOfAll.
- src/Supplements/Kernels/MainTheorems.lean (6a542d7ce969a791fd12ce575f587e6bc29044bf): rhOfAll uses Formalism.VW.rh_of_every allChi; allChi uses UpperTheory.FinalTheorems.everyCharacter.
- src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean (6ac769568b67f85f33565ba3e1eef7b91f53c55f): all positive moduli N, all characters chi and all complex s with Re(s)>1/2, except chi=1 AND s=1, have nonzero L(chi,s).
- src/Formalism/GammaFactorNonvanishing/CritLine.lean (95fa4da5c50119db164aa93944d106f22fdb576d): specialize to the modulus-one character, identify its L-function with zeta. For primitive chi and 0<Re(s)<1, a left-half zero would give a zero of the completed L-function (gamma factor nonzero); the functional equation transfers it to inverse chi at 1-s, violating EveryCharacter. A right-half zero violates EveryCharacter directly. Inverse character remains primitive; s and 1-s are nonzero; neither relevant point is the excluded pole.
- src/Formalism/GammaFactorNonvanishing/RhOfRight.lean (3604637147a33e72248faddd775ea750e7846ead): for any nontrivial zeta zero s unequal to 1, rule out s=0 using zeta(0)=-1/2. Right-half nonvanishing excludes Re(s)>1/2. If Re(s)<1/2 put t=1-s; Re(t)>1/2, t!=1, t is not a nonpositive integer. The functional equation zeta(1-t)=2(2pi)^(-t) Gamma(t) cos(pi*t/2) zeta(t) then contradicts zeta(s)=0: all factors nonzero, including cosine since cosine zero forces s=-2k for integer k, with k<0 impossible by Re(s)<1/2, k=0 excluded, k>0 trivial zero excluded. Thus Re(s)=1/2.

## Upstream junction
MainConclusion.lean (ee340012ab19713a8acfecf8adc6a331cbc2f1a4): the row theorem supplies the tuple of literature inputs (h, recTExists, h) and the window vwin_of_row h. VwinOfRow.lean (4cba179acd45ac08d3cad21f51c9b9d62715a9a4) constructs the window from OpenImageCondition.mk h and baseChangeN h. RowSrc.lean (f769999ac5e49241993e5efbf81e4d2cded18acd) gets the row from galoisRepresentations_of_thetaLift tLiftK.
EveryCharacterOfLiteratureOfVWin.lean (a13ba1f8c38d4dbf2ddd809fbf9610a007936c24; source fetch counted 815 split lines, 208 import statements): final theorem calls every_character_of_theta_integrals_local_matching with seven explicit arguments: published_results_eigen O, published_results_first O, both projections of theta_integrals_agree_and_local_matching_of_literature O, topCovolSlim2_use_alt_alt (15 explicit inputs), local_langlands_gl_recT_exists_of_literature O, hV. Preserve both projections even when sharing their producer. This is a source-level interface map, not the complete kernel dependency graph.

## Avoid duplicate full compilation
Public independent verification report https://math.mit.edu/~drew/grh/ updated 2026-11-24 03:30 UTC reports 175187 compiled modules; full export 61570595788 bytes, SHA256 prefix 5ea74b91 suffix 244e; con-leche accepted 1468418 declarations; standard axiom set propext, Classical.choice, Quot.sound. Lean community confirmation https://leanprover-community.github.io/blog/posts/riemann-hypothesis/. Distinguish external proof verification from our translation verification. Existing verified export or precompiled environment is preferred to rebuilding all modules for dependency extraction. Public repo README https://github.com/leanprover-community/riemann-hypothesis describes cache and original commit. Exact export availability and checksum must be checked, not assumed.

## Tests and limitations
Actual connector fetches of the listed original files succeeded; source-level count executed. Local shell has neither Lean nor Lake and no GitHub DNS; no local kernel check, no full export transfer or URT full-corpus benchmark performed. Prior reported exporter commit could not be identified by commit search. Do not treat that report as current verified persistence.

RESUME HERE (dependencies): locate the verified export or pinned precompiled original cache; obtain exact exporter artifact from prior lane; test its compilation or implement streaming export parser on actual format and extract root-reachable declarations in O(V+E) after expression-DAG reference indexing. Do not assume import counts are kernel-edge counts.
HANDOFF TO (math): unpack every_character_of_theta_integrals_local_matching with all seven exact input types, and the prime-window argument; preserve both shared theta projections and arithmetic obligations. No physics assumptions or new axioms.




---

## Appendix 13: specialists/galois_representations/RUN2_CORE_DESCENT.md
Working-repo blob 4ba5ad2eb922622d3a29449dee456280d5e19539.

# Run 2 — two lifts and CoreAll descent
2026-11-24. SOURCE-MATCHED PARTIAL. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; observed main b37b32c236352418f6edf1ed85dd2e4b14420686; no cross-version equivalence claimed. Read coordination and peer checkpoints; physical CI 45352595797 PASS unrelated to this result.

## Source inventory
Under src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/:
- ThetaParseval/TwoUpOKOfSteps.lean 2541114bdfb87393944243f95ca756280bd57e5d
- IntegralStructures/CrystallineDescent/LimOddOfLimFinOdd.lean e4aaa0fc9f7a97c792916cf6346e3fd624fa3268
- IntegralStructures/CrystallineDescent/ToCoreK.lean e4235a62a4bce78539c94be995d8f5a0ff59fac3
- IntegralStructures/CrystallineInputs/CoreAllOfRowStarCore.lean a4054e96f51401b00acb7a5443040abdc94fa549
- IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean 894cd3878a45a90662e07a57502169d65829ca79
- IntegralStructures/Development.lean 4d4d9506494734f28fce7d39bac1a50650ecf148
Under src/Development/AbelianVarietyTheory/:
- Definitions/GaloisGeometry/CyclicStrongAtCusp.lean 8b43b079fcf131124b5d37f7a237c8594e84e0ba
- Proofs/SatakeParameters/CoreAllOfCore.lean 772df3c313452d83df2afe50d8373a098cc1ea92 (parallel adapter, not asserted to be the actual call).

## Human argument
twoUpOK_of_steps requires TLiftK, ChrPairs, UpOf, BaseNG. BaseNG supplies Bs, delta, ideal and geometric data hG,hX,hW. TLiftK supplies threshold d0 and hd. Set t=2(d0+n)+1. Finite range of original weights on infinite places of the maximal real subfield times Fin n gives lower bound b. ChrPairs is applied with weight bound 2b-(n+t), at w0 and its original hypothesis hw0, and supplies kappa,m,chiX,chiW,mX,mW,psi,p and compatibility fields. For each j, unpack eight fields of hj j; apply hd in dimension n+t using the first six fields, original U and weights, and the inequality from a7 and b. UpOf uses a8 to obtain IsUp U lam kappa m U' lam' (psi j) (p j). Choose j=0,1, retain hne,hu,hu' and hκ, and parity he.add_odd. This proves the adapter, not the producers ChrPairs, UpOf or BaseNG. twoUpOK_of_k supplies Chr.chrPairs_holds, upOf, baseNG.

toCoreK applies toCore to that result. Remaining independent inputs are ClosedPhi, DescOffT, LimFinOdd. limOdd_of_limFinOdd specializes using ha.pos and ha; limU_of_limOdd uses ClosedPhi. rowCsd_of combines joinUp_holds, JacquetShalikaRigidity, gk_holds, quadLift strongTC_holds and rigidity, and joinGL_holds hD (joinAll_holds hT (joinU_holds hL)). joinUp_holds uses stepDown_holds, csdLift_holds, ramUnr_holds, oneUs_holds and existence of quadratic CM extension split at place. stepDown_holds uses isoOne, patchOne with oneTower/oneConj, and all four sphDown clauses. joinEnd_holds followed by core_of_rowStarCore gives Core. None of these imported premises is eliminated.

## Core to CoreAll, exact scope
Core = Ex .csd AND for every c:Sph, SphericalLevelCondition .csd c. CoreAll replaces .csd with .all in both fields. SphericalLevelCondition quantifies over CM number field E, algebraic closure Ω, prime l, ring equivalence Qbar l to C, rank a>=1, cusp representation π and Hecke character χ of maximal real subfield, InScope s l π χ, every weakly attached r, every w satisfying PlaceOK s w, every multiset B of nonzero complex Satake parameters with HasSat. Conclusion SphAt c: unr gives Frobenius eigenvalues away from l; dR and crys give respective ClauseAt; phi compares characteristic polynomials of wdAt and satWD for every Weil element, for all local prime, tied Ainf, place-over, ring and bridge data satisfying Induces. satWD uses inverse Satake eigenvalues and twist (1-a)/2. Do not replace spherical conditions with arbitrary ramified compatibility.

Actual adapter coreAll_of_core_inp takes Inp and Core. Ex .good from ex_good_of_ex_csd; unrg and crysg from corresponding csd clauses. Ex .all from ex_all_of_good hI exg unrg. Four branches: unr from unrg; dR from good dR obtained from csd dR; crys from crysg; phi from crysg and good phi (which requires both csd crys and csd phi). CoreAllOfRowStarCore supplies inp_holds. The underlying proofs use twists and inverse twists for csd→good, quadratic CM base change split at w and transport/descent for good→all. Ex .all uses infinite family of quadratic CM lifts, CMBasePatch, cofinite agreement and Frobenius descent. These are separate proof obligations; do not equate existence with compatibility of every weakly attached representation.

## Executed check
V8 finite integer regression: for n=1..100 and d0=0..100, t=2(d0+n)+1 is positive odd and n+t>d0, 10100 cases succeeded. General identity n+t-d0=d0+3n+1 proves inequality for natural d0 and positive n. Replay Python: for n in range(1,101): for d in range(101): assert (2*(d+n)+1)%2==1 and n+2*(d+n)+1>d (use nested lines). Source blob IDs supplied by connector, not independently hashed. No Lean execution, no kernel proof validation, no URT speed claim. Row0.row0b definition still not located; recursive tree response did not expose expected names, so do not infer its weakening conditions.

RESUME HERE: follow actual imports of InertCharpoly/CharPolOfInert.lean and locate Row0, Row0b, Row0.row0b; reconstruct exact place/rank guard weakening and compare with galois_realisation_of_rank_two. Then unpack Inp and inp_holds in InputsOf.lean. 
HANDOFF TO: integration, audit, theta, character-box, proof editor. No physical files changed.



---

## Appendix 14: specialists/literature_provenance/RUN2_GROTHENDIECK_DEFORMATION_PROVENANCE.md
Working-repo blob b19cf077fa51c11dff11b4b82d094b28e9131b29.

# Literature provenance — RUN 2: Grothendieck deformation, 2026-11-24

**RESULT: DONE for the scoped source adapter and historical statement comparison; PARTIAL for the deeper producers and formal semantic identification.** No independent Lean execution. No URT speedup claimed. No new axioms or changed assumptions.

Pinned upstream: `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`. Current main observed `1b19a23c664c605c6ef4b724c72b97645114881b`; adapter blob `f4f6eb32f04c91b5cde32f11631828eb4016fa7f`, unchanged from RUN1's observed adapter blob, although upstream head advanced. Four relevant wrappers have identical displayed bodies at current head (lines 1112, 1275, 1277, 1279); use only pinned revision below. Read protocols, continuity, runner log/state and latest lane handoffs; physical CI PASS 45355061872 (08:41:49 UTC) is unrelated to RH validity. No physics work or queue changes.

## 1. Exact local proof and quantifiers

Let R and R₀ be commutative rings, I an ideal of R, κ divided powers on I satisfying IsNilDP κ, and π:R→R₀ a surjective ring map with ker π=I. Write T for this entire tuple including all its premises. The pinned `GrothendieckDeformation` is ∀T, At(κ,π). The target `At` is literally the conjunction Canonical ∧ LiftObj ∧ LiftHom (right-associated). The prime-specific `GrothendieckMessing` additionally quantifies over a prime p and requires p nilpotent in R. Therefore GrothendieckDeformation implies GrothendieckMessing simply by specialization; there is no reverse implication provided here.

The entire local proof of `grothendieckDeformation_of_lifting` takes **two** typed inputs P:AbelianDeRham and L:AbelianLifting. At T, use `canonical_of_abelianDeRham P hκ hπ hI` to obtain Canonical, and L(T) for both LiftObj and LiftHom. Pair these proofs. This is an ordinary conjunction introduction, not a new deformation theorem from nothing. The two witnesses are supplied by separate internal producers, not by postulating the literature record O:

- adapter L239–240: P = PositivityTheory.DualRT.abelianDeRham;
- L403–404: L = GlobalTheory.abelianScheme_hom_lifting_nilpotent_dividedPowers;
- L405–406: form the two-input deformation theorem;
- L407–408: specialize to prime-nilpotent GrothendieckMessing.

The two wrappers for P and L have no explicit O use in their bodies. This permits sharing their reconstruction across consumers, not removing the underlying geometric arguments.

## 2. Preserve the three geometric obligations

At a fixed T:
1. Canonical: for each g and specified pullback h of an abelian scheme A/R of smooth relative dimension g to A₀/R₀, (liftMor κ h).pull is bijective and Fil A is admissible. Admissibility of F ⊆ HdR A means existence of a complementary submodule and, for every y∈HdR A₀, y∈Fil A₀ iff there is x∈F with (redMor h).Corr x y.
2. LiftObj: **given a reference lift A'** of A₀ with the same pullback/abelian/smooth-dimension requirements, and admissible F⊆HdR A', construct A/R with group structure, specified special-fiber pullback, abelian/smooth dimension g, and liftFil κ h = F.comap(crysToDR κ h'). This is not an unconditional existence assertion for every A₀ absent a reference lift. Separate square-zero unobstructedness is available deeper in the source.
3. LiftHom: for two such lifts A and B (possibly different dimensions), and group homomorphism f₀:A₀→B₀, assume every d in liftFil of A is sent by push κ (spMap π) f₀ to liftFil of B. There exists a unique f:A→B with IsMonHom f and i ≫ f.left = f₀.left ≫ j. Preserve the actual equation, typeclass and universal filtration condition. Do not infer unconditional lifting of all maps.

### Human argument for Canonical (source-matched)

The AbelianDeRham package consists of Free, Hodge, BaseChange, Rigid and Duality. Canonical uses the first four, not the last explicitly. Fix h, A, g as above, M=primDR A and U=PrimitiveSubmodule A. Hodge supplies M=U⊕N. Free.prim supplies projectivity of M. BaseChange identifies the special-fiber primitive submodule with the R₀-span of pull(U). Rigid gives the bijectivity clause immediately.

Fil A is the dual annihilator of U. The annihilator of N complements it: intersection zero because a functional vanishing on U and N vanishes on their sum; decomposition follows by composing any functional with the two projections of M. For a special-fiber functional y vanishing on the primitive submodule, compose y with redMor.pull to get an R-linear map ℓ:M→R₀ (R-module structure via π). Projectivity lifts ℓ through π to an R-linear x:M→R. Compose x with projection onto N to kill U. Since ℓ already kills U, the modified functional still reduces to ℓ, hence corresponds to y. Conversely, if a functional vanishing on U corresponds to y, then y vanishes on pull(U), and therefore on its R₀-span by linearity. This proves exactly the admissibility equivalence, along with the direct-summand clause. No analytic or prime-specific hypotheses inserted. The typed definitions of Corr, primDR and HdR are retained by references; their full equivalence with conventional crystalline cohomology is not independently rederived here.

## 3. Producers, not external axioms

P is supplied by the explicit theorem PositivityTheory.DualRT.abelianDeRham. Its first three fields come from a page-level AbelianDeRhamStructure plus conversion to Free; Rigid comes from rigid_of_free_of_crystallineDeRham and a crystallineDeRham witness; Duality comes from duality_of_surjAll using the same structural page, and surjAll_of_hodge with crystallineSmoothLift_of_relations and the Hodge package. Those named producers remain separate source obligations. Do not claim P's entire transitive closure has been reconstructed.

L is supplied by the explicit theorem GlobalTheory.abelianScheme_hom_lifting_nilpotent_dividedPowers. It uses Hodge, dual abelian scheme, Poincare duality (derived from those first two) and unobstructedness. The four-input adapter internally adds the cube theorem, giving five inputs to SqLift.abelianLifting_of_known_theorems: AbelianHodgeDeRham, CubeTheorem, DualAbelianScheme, PoincareDeRhamDuality, AbelianUnobstructed. From them construct another AbelianDeRham package (do not conflate its proof term with P) and AbelianSchemeLifts, then apply abelianLifting_of_schemeLifts with unobstructedness. This constructs SqLifting via a reduction from the Noetherian square-zero case with the two square-zero object/hom lifting theorems.

The final nilpotent induction is explicit in AbelianLiftingOfDeRhamUnobstructed.lean: prove LiftObj∧LiftHom for every exponent n+1. At n=0 the divided-power ideal is zero by degree-one evaluation; its divided powers agree with square-zero powers. Apply the square-zero witness. At successor, exists_isStep_nilExp produces a square-zero first quotient with residual divided-power exponent lowered by one. Apply square-zero lifting to the first leg and the induction hypothesis to the residual leg. Combine using liftAbelianScheme_along_squareZero_factorization and liftHom_of_isStep. For arbitrary IsNilDP obtain N and NilExp κ N from isPDNilpotent_iff, use monotonicity N≤N+1, and apply the induction. Preserve the factorization hypotheses st and the separate object and hom gluing arguments. This is a genuine source-level proof tree, but the square-zero lemmas and exact exponent-definition comparison are still unexpanded.

## 4. Historical provenance — important distinction confirmed in primary source

A. Grothendieck, *Groupes de Barsotti-Tate et cristaux de Dieudonné*, Séminaire de mathématiques supérieures 45, Montréal, 1974, Chapter V §4, printed pp. 114–116. Primary scan: https://webusers.imj-prg.fr/~leila.schneps/grothendieckcircle/barsottitate.pdf (PDF page 110, zero-based 109, printed 115; PDF page 111, zero-based 110, printed 116; duplicate printed 116 on zero-based 111). Inspected actual page images for printed 115 and 116. Bibliographic record: https://catalogue.bnf.fr/ark:/12148/cb374179201.

The primary theorem concerns abelian schemes over a general locally divided-power-nilpotent thickening, and identifies their category with the category of a special-fiber abelian scheme equipped with a locally split extension of its Hodge submodule in the crystal. Page 115 identifies the crystal at a lift with first de Rham cohomology and describes its Hodge exact sequence. Page 116 states the equivalence of categories. It does not require a fixed prime. Thus the broad scope of GrothendieckDeformation is historically appropriate; the narrower prime-nilpotent GrothendieckMessing statement is a specialization, not an adequate citation by itself for the stronger source declaration. For the usual p-divisible-group version see Chai–Oort, *Moduli of abelian varieties and p-divisible groups*, arXiv:math/0701479, Theorem 2.4, https://arxiv.org/abs/math/0701479 (secondary corroboration, not the basis of the general claim).

Correspondence: canonical crystal identification and Hodge reduction correspond to Canonical; essential surjectivity of the equivalence corresponds to LiftObj; full faithfulness corresponds to LiftHom. The formal source uses the dual module and the annihilator filtration, so preservation under a push map corresponds to the contravariant cohomological pullback preserving the original Hodge submodule (requires the actual finite-projective comparison). The reference-lift hypothesis makes LiftObj locally narrower than an arbitrary existence claim. Exact semantic equivalence is **not** certified by historical citation: still verify the actual IsNilDP definition and crystal comparison, local vs global direct-summand descent, and the defined category/morphism maps. This is not an external axiom added to Lean.

## 5. Reproducible source certificate

Fetched 19 pinned modules and checked their expected Git blob identifiers, then tested 54 exact literal source anchors. All passed in connector runtime. This is a source identity/anchor check, not kernel validation. Below is a machine-readable ledger and standalone Python replay. Run with the pinned upstream Git checkout; it reads only Git objects at the fixed revision. Zero added assumptions. No claim of complete reachability, full proof translation or measured acceleration.

```json
[
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
    "sha": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
    "checks": [
      [
        240,
        "PositivityTheory.DualRT.abelianDeRham"
      ],
      [
        404,
        "GlobalTheory.abelianScheme_hom_lifting_nilpotent_dividedPowers"
      ],
      [
        406,
        "GlobalTheory.Published.grothendieckDeformation_of_lifting"
      ],
      [
        408,
        "GlobalTheory.Published.GrothendieckDeformation.grothendieckMessing"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckDeformationOfLifting.lean",
    "sha": "0c354048cc2fd757ae786f765d8921f85b48d466",
    "checks": [
      [
        9,
        "(P : AbelianDeRham) (L : AbelianLifting)"
      ],
      [
        12,
        "⟨GrothendieckMessing.canonical_of_abelianDeRham P hκ hπ hI, L R I κ hκ R₀ π hπ hI⟩"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/GrothendieckDeformation.lean",
    "sha": "88188d49a09a09565265ef1e83f9a91335cafec4",
    "checks": [
      [
        12,
        "def GrothendieckDeformation : Prop"
      ],
      [
        26,
        "exact H R I κ hκ R₀ π hπ hker"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/CanonicalOfAbelianDeRham.lean",
    "sha": "049bc86fde20550ab8ead714c36d9df45b6775e8",
    "checks": [
      [
        26,
        "def IsAdmissible"
      ],
      [
        33,
        "def Canonical"
      ],
      [
        38,
        "def LiftObj"
      ],
      [
        47,
        "def LiftHom"
      ],
      [
        55,
        "def At : Prop := Canonical κ π ∧ LiftObj κ π ∧ LiftHom κ π"
      ],
      [
        60,
        "IsNilpotent (p : R)"
      ],
      [
        137,
        "theorem canonical_of_abelianDeRham"
      ],
      [
        163,
        "Module.projective_lifting_property"
      ],
      [
        140,
        "obtain ⟨PF, PH, PB, PR, -⟩ := P"
      ],
      [
        174,
        "Submodule.span_le"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/CrysToDRBijective.lean",
    "sha": "9b005affbcf5e67a6578a405aefe484b57ad940b",
    "checks": [
      [
        24,
        "def Free : Prop"
      ],
      [
        33,
        "def Hodge : Prop"
      ],
      [
        40,
        "def BaseChange : Prop"
      ],
      [
        47,
        "def Rigid : Prop"
      ],
      [
        55,
        "def Duality : Prop"
      ],
      [
        65,
        "def AbelianDeRham : Prop"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/AbelianLifting.lean",
    "sha": "a2b7f1fff22f60cf4eea45df66073896a5310e54",
    "checks": [
      [
        15,
        "def AbelianLifting : Prop"
      ],
      [
        18,
        "GrothendieckMessing.LiftObj κ π ∧ GrothendieckMessing.LiftHom κ π"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/DualAbelianScheme/AbelianDeRhamDuality/AbelianDeRhamDuality.lean",
    "sha": "bf38bb3decc713a4cbbabd8fb847247fcdf3df8c",
    "checks": [
      [
        20,
        "theorem abelianDeRham : AbelianDeRham"
      ],
      [
        23,
        "rigid_of_free_of_crystallineDeRham"
      ],
      [
        16,
        "theorem duality"
      ],
      [
        13,
        "theorem surjAll"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeHomLiftingNilpotentDividedPowers.lean",
    "sha": "0852a9d2ec0f40e0ab6bdb6d955c3bb5bd195ba2",
    "checks": [
      [
        20,
        "GlobalTheory.LiftFour.abelianLifting_of_four"
      ],
      [
        22,
        "GlobalTheory.UnobTop.abelianUnobstructed"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianLiftingOfFour.lean",
    "sha": "2e09b565613e3592cafbba9dc055eb886e6ec45e",
    "checks": [
      [
        15,
        "theorem abelianLifting_of_four"
      ],
      [
        19,
        "GlobalTheory.T.theoremOfCubeAbelianScheme_over_arbitrary_base"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeHomLiftingNilDPOfFiveStatementsStatement.lean",
    "sha": "4f8511895f3a30189d45fe0bde6dbfaa27d3e3d6",
    "checks": [
      [
        13,
        "GlobalTheory.SqLift.abelianLifting_of_known_theorems"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeHomLiftingNilDPOfFiveStatements.lean",
    "sha": "71cd7dba25200cd8ae2f6f226f2f20fe1f6a78af",
    "checks": [
      [
        14,
        "theorem GlobalTheory.SqLift.abelianLifting_of_known_theorems"
      ],
      [
        19,
        "GlobalTheory.SqLift.abelianLifting_of_schemeLifts"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianLiftingOfDeRhamUnobstructed.lean",
    "sha": "271c5c0d12c40d2230c3df521256f39e9ebfc0f4",
    "checks": [
      [
        49,
        "theorem abelianLifting_of_sqLifting"
      ],
      [
        56,
        "induction n with"
      ],
      [
        63,
        "exists_isStep_nilExp"
      ],
      [
        66,
        "liftAbelianScheme_along_squareZero_factorization"
      ],
      [
        67,
        "liftHom_of_isStep"
      ],
      [
        69,
        "(isPDNilpotent_iff κ).1 hκ"
      ],
      [
        72,
        "theorem abelianLifting_of_schemeLifts"
      ],
      [
        75,
        "squareZeroLifting_of_noetherian_case"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PoincareDeRhamDualityOfHodgeDeRhamDual.lean",
    "sha": "db49f7a6e700efd8584fb4a845ef53445cef36f0",
    "checks": [
      [
        16,
        "theorem poincareDeRhamDuality_of_hodge"
      ],
      [
        20,
        "isPerfect_of_isDual"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeDeRhamLocallyFreeHodgeDegeneratesStatement.lean",
    "sha": "19262443cccd767549ce8fbbdc29fb6d482dc1db",
    "checks": [
      [
        12,
        "GlobalTheory.AbCoh.abelianHodgeDeRham"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/DualAbelianSchemeExistsBidualityStatement.lean",
    "sha": "73f5ff151e7b7e1c5c0224f741ec842599ac02fb",
    "checks": [
      [
        11,
        "GlobalTheory.dualAbelianScheme"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeUnobstructedSquareZeroAffine.lean",
    "sha": "4940da4c4a50b11b76c3188a43e1a2ab4ed9c852",
    "checks": [
      [
        17,
        "abelianScheme_unobstructed_of_cohomology_structure"
      ],
      [
        18,
        "globalFunctionsConstantAfterBaseChange_of_abelianScheme"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/TheoremOfCubeAbelianSchemeOverArbitraryBaseStatement.lean",
    "sha": "615a03074a3b71ed3a410d3bf3497058f5b45d93",
    "checks": [
      [
        6,
        "GlobalTheory.CubeTop.cubeTheorem"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeSquareZeroLiftsOfDeRhamCohomologyStatement.lean",
    "sha": "06514f41dd0359b37fdce155a7a4b0f379ea4e5d",
    "checks": [
      [
        12,
        "GlobalTheory.LiftSys.abelianSchemeLifts_of_abelianHodgeDeRham"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeDeRhamStructureOfCubeDualPoincareStatement.lean",
    "sha": "70bdfbdddd502be8a10008586b781ee1ff7d5e6b",
    "checks": [
      [
        13,
        "GlobalTheory.abelianDeRham_of_hodge_cube_dual_poincare"
      ]
    ]
  }
]
```

```python
# Save the JSON block above as ledger.json. Run from upstream checkout.
import json, subprocess
pin = "40e56bab026552e089d7afcfeff08d2defb9c005"
rows = json.load(open("ledger.json", encoding="utf-8"))
count = 0
for r in rows:
    obj = pin + ":" + r["path"]
    assert subprocess.check_output(["git","rev-parse",obj], text=True).strip() == r["sha"], obj
    lines = subprocess.check_output(["git","show",obj]).decode("utf-8").split("\n")
    for i, literal in r["checks"]:
        assert literal in lines[i-1], (obj, i, literal)
        count += 1
print("PASS",len(rows),"pinned blobs;",count,"source anchors")
```

## RESUME HERE
Follow the pinned `ExistsIsStepNilExp.lean` imports to the actual `NilExp`, `IsNilDP` and `isPDNilpotent_iff` definitions, reconstruct the square-zero factorization with precise divided-power descent and nilpotence bound, and compare with the historical locally nilpotent site hypothesis. Do not retranslate the conjunction adapter or the above dual-annihilator argument. Then handle theta lane's pending EisBL/SiegelWeilStd citation claims separately.

HANDOFF TO: integration, proof editor, formal audit, geometry and theta lanes. The deformation branch now has an exact two-input source bridge, all three output clauses, the Canonical linear-algebra proof, a source-linked five-input lifting producer and verified primary historical statement scope. The deeper square-zero and crystalline producers remain OPEN.



---

## Appendix 15: specialists/theta_lifts/RUN2_NONZERO_SCALAR_INDUCTION.md
Working-repo blob 43bd45597f27f67a8241d912306351e6fd32066f.

# Theta lifts run 2 — the nonzero scalar induction and doubling-integral base

2026-11-24. RESULT: SOURCE-MATCHED conditional human proof of the signature induction, its closure into OneConst/ThetaIntegralsAgree/LocalMatching, and the analytic nonzero-bottom contradiction. No independent Lean kernel validation, no completion claim, no URT speed claim. The induction is not a proof of RH in isolation.

## Continuity
Read all three swarm protocols, AGENTS, actual runner research log/protocol, continuity, research state, CI summary (physical PASS 45352595797, 08:21 UTC, not an RH certificate), theta run 1 and peer Galois, character-box, literature, positivity, prime-window, Landau, kernel, acceleration, math and integration handoffs. This is the next frontier named by theta run 1; the seven-input downstream adapter is not repeated. Source pin leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed 0e40c084e27c44a3584e271cb14e7dd3bce9aa63; comparison against d27f71347abceb76cd37dc8a5fccbe556ec2be90 returned 9 commits ahead, only five listed changed files (CI scripts/tests and verification/CI-RUNNERS.md), no Lean files in that comparison. Keep current and pinned graphs separate.

## Source ledger
T = src/Development/WeilBound/ThetaLifts/; D = src/Development/AbelianVarietyTheory/Definitions/Divisors/. All at original pin.
- A T/SphericalLattices/SphericalClosure/CloseSph.lean 9a15ec479fb007975f15b6df7fe5fe46615e4f8f
- B T/AgreeOfLeaves.lean 7ded8dbfba9d886440ccb88f4333e9af2f6b8b0d
- C T/ConeHypotheses/CtSmallCone.lean 4adaba7515f7ee3b4c8321b34e2bb3dc3cc1550d
- D1 T/ConeHypotheses/KeyAOf.lean 87f479727a6a00be916ec96a5b0d888b7d214d2c
- E T/ConeHypotheses/PolDense.lean 7e2a0f5baf8296040d6bcd44f7accd625360aed3
- F D/MatchingOfParts.lean 0b28322e9e86af29a20031f44aae399dbf00c8a6
- G D/CTSmallCone.lean 59578c7a38cc131fdab95da5541523c42a5b159e
- H T/WeilDomination/ExistsUnitChrWNe.lean 4a76f97d605ebd8650af8ca6580f8e172f0db173
- I T/LatticeBasics/BotAsm.lean de3e30d43431c4ea373b47a59dc6aeaa4371d70a
- J T/LatticeBasics/ExistsIsHeckeLOfCompleted.lean a9870cbfacc6ffa1c17c95759232ef2ffff16239
- K T/Reductions/TopPolarZero/PolZero.lean 53e3dd1eecd90129f30180a66820109d0c8b54be
- M src/Development/AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean 4d0d94fd3fd9368e5428c05402979d6dd5123b4d
Additional inspected: T/ConeHypotheses/PureEqPureA.lean 32b61df65b96059ad599295ec7e5c558581f0daa; T/LatticeBasics/EulerHalf.lean 01deb51b0b752ba0d4ba5b0bbc7fb1b5393e0828; T/SphericalLattices/SphericalClosure/EndCore.lean c32993fc08a31615b2d84fbaf18abc4fdbfc87d0 (partial inspection); T/WeilDomination/FacNeGauss.lean c46039a3e0e96b54478853a957b4e006eb971abc (partial); T/Reductions/FiniteClosure/TheoremKOfMod.lean 61ff0c7c5ee7e5df0681112d6727ab143c3b6996; src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24.

## 1. Exact closure of the paired theta properties
A closeSph takes the 14 inputs identified in run 1, constructs a record L : PositivityTheory.ThKG.Leaves and supplies two further proofs hd : KDecay and hc : KCoinv. Its terminal call is B agree_of_leaves L hd hc. All 26 record fields are retained and source-checked against their actual supplying type annotations, in order:

evZero/EvZero; evCone/EvCone; stabEx/StabEx; towerA/TowerA; towerB/TowerB; facNe/FacNe; matchEx/MatchEx; leviEx/LeviEx; polDense/PolDense; weilConv/WeilConv; soCont/SoCont; splitEx/SplitEx; ctBigZero/CTBigZero; ctSmallZero/CTSmallZero; ctBigCone/CTBigCone; ctSmallCone/CTSmallCone; anAll/AnAll; polRe/PolRe; nonZeroAn/NonZeroAn; polZero/PolZero; locA/LocA'; locB/LocB'; endA/EndA'; endB/EndB'; kReal/KReal; kFin/KFin. No field is assumed dispensable.

B forms (agree_of_parts hd L.kConst hc L.kBeta L.kAlpha, matching_of_parts L.kReal L.kFin). F agree_of_parts explicitly packages Decay and (OneConst,Coinv) under the triple and matched quantifiers, plus separate existential unit triples for StepBeta and StepAlpha. F matching_of_parts independently chooses R from KReal and Rf from KFin, then forms IsMatched from the original triple and both properties. KReal and KFin alone do not give equality of theta integrals; the other five proofs remain indispensable to this composition. This is a textual dependency map, not exported kernel edges.

## 2. Induction invariant and exact hypotheses
For any number fields F,E with Algebra F E, algebra endomorphism sigma, base B, ranks a,a', geometric triple G, characters X and Weil representations om,om', fix matched quotient maps R,Rf. All IsTriple and IsMatched conditions from run 1 remain. E Claim means (i) a nonzero c with PolConst, (ii) a polynomial adelic test vector Phi with nonzero integral function I_A(Phi), and (iii) a polynomial test vector Phi' in the special small-side space So with nonzero I_B(Phi'). G PolConst quantifies over all polynomial-matched pairs with Phi' in So and all h. Below(n) quantifies over *all* the preceding data with p+q<n, not merely one fixed model. The proof's rank variable is p+q, not a+a'.

M Geo.IsGood requires a'<a, a+a' even, strict weight gap, 2(p+q)+1<floor((a-a')/2), 2(p+q)+1<a', and all form/model constraints. Denote k=floor((a-a')/2). In particular k>=2(p+q)+2>=2. The induction always removes two dimensions from one member and decreases p+q by one. TowerA and TowerB supply the smaller *good matched* geometry, not arbitrary decrements that might violate admissibility.

C Leaves.const_of obtains the nonzero polynomial proportionality by cases:
- p=q=0: exact L.polZero, with the actual source base-case producer K polynomial_vanishing_of_compactness. NonzeroAn supplies separate nonzero integral witnesses; proportionality alone could be vacuous.
- q=0,p>0 (Alpha): write a=b+2, construct the adapted same-signature reG and smaller geometry G1 via TowerA, choose matched maps for both. L.keyA gives C != 0 and local relation. The lower Claim supplies c1 != 0. Put k_A=floor((b+2-a')/2), F_A=stepFac with exponent 1-k_A and L_A=charL(X.nu,X.S0,k_A). Then c_A=C F_A L_A c1 is nonzero (FacNe and lower claim). In the polynomial relation, use SplitEx uniqueness to identify the first component fa' of the given splitting with the one constructed by KeyA. EndA' upgrades the Levi first-component equation to PolConst on the adapted model; PolRe transports existence of a nonzero proportionality back to the original model. Do not assume transport preserves a scalar value unless the exact PolRe proof says so.
- q>0 (Beta): write a'=b+2, use TowerB, analogous matched models. Put k_B=floor((a-(b+2))/2), F_B=stepFac at exponent -k_B and L_B=charL(X.nu,X.S0,k_B+1). KeyB gives (C F_B L_B) fb = c1 fb'. All denominator factors nonzero by FacNe. EndB' upgrades fb=c_B fb' to PolConst for c_B=c1/(C F_B L_B). PolRe transports existence. CfgB preserves p and decreases q by one; CfgA decreases p by one and q=q1=0.

H facNe proves two independent parts: stepFac is nonzero because ideal and character values are units, local norm powers and Gauss sums are nonzero (the latter via ramification, additive-character hypothesis and unit witness); and charL(X.nu,X.S0,k) !=0 for natural k>=2 by converges_charFam in Re(s)>1. Crucial noncircularity observation: the geometric inequalities place the induction's L_A,L_B in the ordinary Euler-product domain. This argument does NOT assume half-plane GRH; it also does not establish that the stronger base-case integer nonvanishing is trivial.

D1 keyA_of/keyB_of first choose universal integer units from LocA'/LocB'. For fixed geometric setup with at least one admissible pair, evaluation maps and stabilizer measures give three nonzero constants C0,C1,C2 from constant-term and local-cone producers. Set C=C2*C1/C0 before the universal character/matched vector quantifiers. The algebra identities alg_A/alg_B simply rescale the lower-model relation. In the no-admissible-pair branch choose C=1 and eliminate impossible matched triples; this is not a nonzero witness for an existing model. The nonzero test component comes by lifting a lower-model nonzero polynomial integral through a surjective evaluation map, selecting a nonzero point and lifting it to the Levi subgroup. Preserve the distinction: Beta uses lower large-side nonzero integral and fb; Alpha uses lower small-side nonzero integral and fa'. EndA'/EndB' still depend on the Below premise in E even though E endA'_of/endB'_of construct them from stronger G EndA/EndB.

## 3. Complete Claim and uniqueness (conditional on L)
C claim_of first obtains c by const_of and matching via MatchEx. If q=0, NonZeroAn gives a nonzero special small-side integral; MatchEx lifts its vector to a matched large-side vector. Since c !=0, the large integral is nonzero at the same point. If q>0, nzV gives the large-side witness through KeyB's nonzero fb: if I_A(Phi)=0, the zero splitting (0,0) contradicts the asserted nonzero fb. nz_move transfers existence from adapted to original model; its contradiction uses density of polynomial real data, continuity of the integral for fixed finite data, and submodule-span induction (zero, addition and scalar multiplication). MatchEx then supplies special matched small-side vector, whose integral cannot vanish identically since the large integral is nonzero. This simultaneously proves all three Claim components.

Below(0) is vacuous; Below(n+1) follows using claim_of and monotonicity of Below because any rank r<n+1 satisfies r<=n. Hence Claim at rank r follows by applying Below(r+1), or equivalently claim_of with Below(r). This is well-founded, not a circular assumption of Claim at the current rank.

C isConst_of extends polynomial equality to all Match data. Match explicitly includes finite decompositions into real test functions and fixed finite Schwartz-Bruhat factors, with convergent real approximants, polynomial matching at each stage and preservation of the special So condition. On the large side, use I_sum plus WeilConv continuity to take the limit of the finite sum; on the small side use SoCont. The two sequences are pointwise proportional, so uniqueness of limits in C gives equality for all h. Conversely polConst_of uses the MatchEx implication from polynomial matching with So to Match. These are two actual implications, not a presumption that dense data automatically proves equality.

C kConst: choose the nonzero small-side witness from Claim and use MatchEx to find the corresponding polynomial large-side test. For any other c' satisfying IsConst, evaluate both at a point h with I_B(Phi')(h) !=0. Then c'I_B=cI_B, and cancellation gives c'=c. This gives unique existence and every proportionality constant nonzero, together with the original small-side witness: exactly OneConst. Omitting the witness would permit arbitrary c when both integrals are identically zero.

C kBeta and kAlpha are the final rank-step equalities, not merely const_of restated. For Beta use the same KeyB splitting with a nonzero fb and the actual IsConst; scale the small-side splitting by c, cancel the nonzero component, and set u=(C F_B)^(-1), valid because C F_B !=0. Thus u C F_B=1 and c L_B=u c1. Alpha uses KeyA nonzero fa', AnAll to extend polynomial equality when q=0, and cancels the nonzero component to get c=C F_A L_A c1. Their quantified adapted-plane data, independent unit choices and all-match conditions remain those of StepBeta/StepAlpha from run 1.

## 4. Actual analytic nonzero bottom: I pair_ne_zero and nonZeroBottom_of_doubling_integral
The leaf NonZeroAn is constructed in A from NonZeroBot, TowerA/B, EvZero, CTBigZero/CTSmallZero, SchToPol, PolSch, LeviEx, SplitEx and ToSo. The separate bottom producer I nonZeroBottom_of_doubling_integral takes exactly KReal,LInt2,HgtEx,NormZeta,EulerProd,LocMeas,LocUnr,BadFactor,RealInv,DProd. It applies pair_ne_zero twice at p=q=0 with chi_W=X.nu^-1 and X.nu respectively; X.nu=alpha/beta. The real quotient is nontrivial, characters are Hecke, both Hermitian pairs definite, n>=1, n<d=a+a', d even, specified ramification and unramified conditions at T, and h_R supplies quotient hp. These are part of the statement. Do not infer nonvanishing for arbitrary characters.

I pair_ne_zero additionally requires an entire function Lambda matching the full charL for Re(z)>1 and nonzero at all integers j with -d<=2j (J LInt2). The function is named Lambda in source; it is not automatically the completed L-function, as J specifies agreement with charL itself. Height data, real invariant vector, bad-factor construction and normalized zeta data produce a polynomial Phi, a domain U, holomorphic Z on U, threshold t0, an integral H(z) restricted to g integral outside T, and a nonzero analytic normalizer d_T(z) on Re(z)>0. Under the supposition I(Phi)=0, the NormZeta vanishing clause gives Z(z0)=0 at z0=(d-n)/2>0. BadFactor ensures H(z0)!=0.

For Re(z)>max(t0,n/2), the Euler-product identity proved by I reads
  Z(z) d_T(z) = [product_{i=0}^{n-1} Lambda(z+n/2-i)] H(z).
Every shifted argument has Re>1 there (since i<=n-1). Ramified factors of charL at places over T are 1; I hasProd_off proves their deletion is exact, not an approximation. The product identity uses the local factors from LocUnr, the bad-place integral, and convergent product limits. I eq_zero_of_right analytically continues the *difference* to the open intersection U cap {Re z>0}; the hypothesis that the complement of U is discrete gives countability, and the exponential real-coordinate homeomorphism identifies the right-half-plane domain with a plane minus a countable set. Its preconnectedness and the complex identity theorem justify propagation from the right-hand open half-plane. The precise U membership and differentiability hypotheses are supplied by NormZeta/BadFactor/DProd and LInt2, not asserted for any arbitrary meromorphic function.

At z0 the shifted arguments become d/2-i, integers because d even. Since i<n<d, -d<=2(d/2-i), so every Lambda factor is nonzero by LInt2. H(z0) is nonzero by BadFactor. Their product cannot equal zero; contradiction to Z(z0)=0. Thus the chosen Phi has nonzero theta integral. This is the actual doubling-integral nonvanishing argument in the source, retaining the stronger analytic premise. It does NOT prove LInt2; that is a separate upstream task. In particular ordinary Euler products at k>=2 do not supply LInt2 on negative integers.

## 5. Base-case dependencies and literature boundary
K polynomial_vanishing_of_compactness uses SiegelWeilStd, EisBL, GlobalTheory.Published.HeckeLEntireAndNonzeroAtOne, NonZeroAn, Factor, MatchEx, ThetaBasic, WeilConv, KDecay, ICont, GrpTop,EpsOf,SiegelAll,FinVolU,Unimod. Its body constructs compactness and calls hermLine_of', coefLine_of, thConst_of', polZero_of; these are the remaining real analytic/representation theoretic steps of the p=q=0 proportionality proof. The literature wrapper in EveryCharacterOfLiteratureOfVWin names O but its EisBL and SiegelWeilStd producers do not explicitly use O: they invoke PositivityTheory.RgEis.Hd.eisBL and PositivityTheory.SiegelWeilFormula.Fin.siegelWeilStd. Do not confuse a wrapper with a source axiom or a verified published theorem. Those two producer bodies, the stronger LInt2 theorem lInt2, and the exact X.nu to downstream Dirichlet character construction are not reconstructed here; they remain open for this lane and literature audit. The nonzero-bottom chapter is conditional on the exact 10 input propositions, whose producers remain required.

## 6. Executed static and arithmetic checks
All 26 Leaves fields compared position-by-position to the actual annotated supplying types from A and C using V8. First two checker attempts failed because the extraction regex omitted a formal argument (KReal) then apostrophes in LocA'; corrected checker succeeds. This was a checker parsing error, not a theorem mismatch. Also executed bounded exact integer checks on the Geo inequalities, ranks and shifted arguments: alpha 10,665; beta 47,565; base 2,304; doubling shifts 71,545. All passed. These finite checks support transcription, not the proof for unbounded ranks; that is the inequalities derived above. No Lean execution or independent kernel extraction. No changed premises. All listed source hashes are connector-reported Git blob IDs; local hash replay below is supplied but not executed here.

Reproduce against pinned checkout (Python 3):
```python
from pathlib import Path
import hashlib
T=Path("src/Development/WeilBound/ThetaLifts")
names=["SphericalLattices/SphericalClosure/CloseSph.lean","ConeHypotheses/CtSmallCone.lean","ConeHypotheses/PolDense.lean"]
hashes=["9a15ec479fb007975f15b6df7fe5fe46615e4f8f","4adaba7515f7ee3b4c8321b34e2bb3dc3cc1550d","7e2a0f5baf8296040d6bcd44f7accd625360aed3"]
bs=[(T/n).read_bytes() for n in names]
assert [hashlib.sha1(b"blob "+str(len(b)).encode()+bytes([0])+b).hexdigest() for b in bs]==hashes
s,l,p=[b.decode() for b in bs]
fields=[x.strip().split(" : ")[1] for x in l.split("structure Leaves : Prop where",1)[1].split("namespace Leaves",1)[0].strip().splitlines()]
args=s.split("h_Weil6_ThKG_Leaves : PositivityTheory.ThKG.Leaves := ⟨",1)[1].split("⟩",1)[0].split(", ")
assert len(fields)==len(args)==26
for field,arg in zip(fields,args):
    line=next(x for x in s.splitlines() if "have "+arg+" :" in x or "("+arg+" :" in x)
    ty=line.split(arg+" : ",1)[1].split()[0].rstrip(")")
    assert ty.split(".")[-1]==field
counts=[0,0,0,0]
for a in range(101):
    for ap in range(a):
        if (a+ap)%2: continue
        for p in range(11):
            for q in range(11):
                if not(2*(p+q)+1<(a-ap)//2 and 2*(p+q)+1<ap): continue
                if q==0 and p>0:
                    assert a>=2 and (a-ap)//2>=2 and p-1+q<p+q
                    counts[0]+=1
                elif q>0:
                    assert ap>=2 and (a-ap)//2+1>=2 and p+q-1<p+q
                    counts[1]+=1
                else: counts[2]+=1
from fractions import Fraction
for n in range(1,60):
    for d in range(n+1,121):
        if d%2: continue
        for i in range(n):
            z=d//2-i
            assert -d<=2*z and Fraction(d-n,2)+Fraction(n,2)-i==z
            counts[3]+=1
assert counts==[10665,47565,2304,71545],counts
print("26 field matches",counts)
```

RESUME HERE: locate the actual declaration GlobalTheory.ThK.Dbl.lInt2 (not just J's definition LInt2), by traversing the imports of A and K, especially the HodgeTate/HeckeTateFunctionalEquationCM branch. Translate its proof of integer nonvanishing, retaining all character infinity-type bounds and exceptions, and check precisely how the completed functional equation avoids trivial zeros after removing gamma factors. Then unpack K polZero_of (base scalar) and hand over EisBL/SiegelWeilStd source provenance to literature lane. Do not redo the induction or substitute ordinary Euler-product nonvanishing for LInt2.
HANDOFF TO: proof editor, integration, formal audit, literature and character-box lanes. Signature induction, uniqueness and analytic nonzero-bottom argument ready for independent source review. Project OPEN; no physics gate touched.



---

## Appendix 16: math/2026-11-24_hypsalt_unramified_constructor.md
Working-repo blob 7e0a31ab3bc52e288f926784982d8545e191da37.

# MATH lane: constructing `HypsAlt` from unramified-exponent data

## RESULT

This run reconstructs the exact theorem immediately behind the seven-input `EveryCharacter`
adapter:

`GlobalTheory.Fc.S0.StageU.hypotheses_nonempty_of_unramified_exponents_alt`.

At upstream revision `40e56bab026552e089d7afcfeff08d2defb9c005`, the theorem turns one
unitary/global package, one rational-row premise, a recursive local-Langlands parameter, a real
dependence parameter, a retwisting point, and four late row/link conditions into an inhabited
`HypsAlt S0.NL DefiniteSideCondition` bundle.  The late inputs do not fill four independent final
fields: the prime bound becomes `nRest`; the functional and covolume links jointly enter `rRows`;
and the evaluation premise first constructs the member/existence data used by the class-selection
step.

Status: **SOURCE-MATCHED**.  This is a human derivation of the pinned Lean source, not a replacement
proof, not a transitive axiom audit, and not a local Lean elaboration.

## Source ledger

| ID | Pinned source path | Git blob | Declaration |
|---|---|---|---|
| `HA-S1` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean` | `c0ce994aa86f737b707b5617fb10bcfb35c0117e` | line 41, `hypotheses_nonempty_of_unramified_exponents_alt` |
| `HA-S2` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/MemberBundlesLargeUnramifiedExponents.lean` | `18ce45e0cb7d9555897580f6c5565217bea190a6` | lines 34, 69, member/existence constructor and exported alias |
| `HA-S3` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LinkROfIsLinked.lean` | `66e5fddcb389f78669cef5787ef2c648d537bf4d` | line 50, `allRows_of_open0_alt` |
| `HA-S4` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/AllRows.lean` | `be24ab5328945e90d2b981ff43ed9f20bb8b86ac` | line 12, `AllRowsAlt` |
| `HA-S5` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/NonemptyHypsOfAllRows.lean` | `6a09205dfc3e57486ecbc27517072f3c27f09a51` | line 19, `nonempty_hyps_of_allRows_alt` |
| `HA-S6` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/Hyps.lean` | `7e51220c82d43cf3a9345e87a9aa8751b38a5a25` | line 22, `HypsAlt` |
| `HA-S7` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/CFinal.lean` | `4a29a074e7b79272cca68b0e34b7191d282b9136` | line 19, `final_alt_alt` |

All paths and blob identities are for the pinned upstream commit above.

## Exact theorem boundary

Write

\[
p_0=\operatorname{parametersOfDependence}(h_L,c),
\]

and, for `A : GroupRetwisting.AtP`,

\[
N_A=\operatorname{extensionWithAtProperty}
  (h_L,\operatorname{extensionWithOrigin}(h_L,c),A),
\qquad
p_A=\operatorname{parametersOfExtension}(N_A,\mathrm{SExt.none},
\operatorname{geoCl}(\mathrm{anyGeometry})).
\]

`HA-S1:41` has the following quantifier order and premises:

1. `P : GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses`;
2. `hR : S0.RowRat`;
3. `hL : UpperTheory.Zero.LLC.RecTExists`;
4. `cDep : ℝ`;
5. `A : GroupRetwisting.AtP`;
6. `hEv : EvLgG A`;
7. `hN : RL.LinkedAt p₀ (...)`, where the predicate is

   ```
   fun Q L => R1.SlotNormCondition Q L
     fun 𝒞 => Closed 𝒞
       fun Fm _ => NLink.BoundAtTwoThreeFamilyFonAlt Fm
   ```

8. `hF : RL.LinkedAt p_A S0.FunctionalCondition`;
9. `hL3 : RL.LinkedAt p_A S0.CovolumeBoundThirdPlaceSeries`.

The conclusion is exactly

```
Nonempty (GlobalTheory.Fc.HypsAlt S0.NL
  GlobalTheory.Fc.DefiniteSideCondition)
```

The nesting matters.  `hN` lives initially at `p₀`, while `hF` and `hL3` already live at the
stronger extension `p_A`.  Replacing all three by predicates at one unnamed parameter erases the
transport obligation in the proof.

## Step 1 — evaluation produces the class-selection inputs

The first proof line is

```
obtain ⟨hP, hMem, hEx⟩ :=
  large_unramified_exponent_bundles_exist_alt P hR hL cDep A hEv
```

By `HA-S2`, these outputs have the exact types

\[
\begin{aligned}
h_P &: \mathrm{StandardLattice.SiegelMassRatioCM},\\
h_{Mem} &: \mathrm{MemberE}(p_A.s),\\
h_{Ex} &: \mathrm{ExBL}\bigl(
  KPx,\mathrm{IsBuiltE}(p_A.s),\mathrm{IsGoodE}(p_A.s),
  \mathrm{BundleLinkage}(p_A)\bigr).
\end{aligned}
\tag{1}
\]

Thus `hEv` is not copied into `HypsAlt`.  It is consumed inside the member-bundle theorem.  That
theorem builds compatible-system membership and rational weights from fields of `P` and `hR`,
constructs multiplicative closure, and uses `hEv` in
`memberE_extensionWithAtProperty_of_evLgG`.  Its final Weil-block existence statement supplies
`hEx`.  In the last constructor (`HA-S5`), `hP`, `hMem`, and `hEx` are precisely the inputs that
permit `classSel` to choose a family class and raw selection.

## Step 2 — the prime bound is converted and transported

The theorem next obtains `prN` and `serN` from

```
hyps_e_third_layer_ser_n_of_geometric_galois P.litN P.toHypothesesX
```

and forms

```
hNrow := UpperTheory.GalC.final_alt_alt
  P.nLink prN P.toHypothesesX serN P.depthZeroSupport'
  P.localFiniteness P.localTateDuality P.localEulerChar
  hL cDep hN
```

The final argument remains the original two/three-prime linked condition `hN`; it is not dropped.
`final_alt_alt` (`HA-S7`) delegates to `final_of_alt`, adding the good-cut facts and Galois
preconditions constructed from the displayed local and geometric hypotheses.  The resulting
`hNrow` is the `S0.NL` norm row at the dependence parameters `p₀` (its exact type is forced by the
subsequent typed transport).

The transport theorem

```
open_and_linked_of_stronger_extension_alt ...
```

returns `hmono`.  Its second projection sends the open assertion from `p₀` to `p_A`; its first
projection transports a linked row.  Therefore

```
hN' : RL.LinkedAt p_A
  (fun Q L => R1.SlotNormCondition Q L S0.NL)
```

is defined by

```
hmono.1 (fun 𝒜 _ => S0.NL (Cp.D3 3 𝒜)) hNrow.
```

This explains why the original prime estimate does not appear verbatim in the final record: it is
used to manufacture the stronger-extension `S0.NL` row, and that row later becomes `nRest`.

## Step 3 — build all 26 row obligations

Let `hO` be the open-parameter statement at `p₀`, constructed from `P`, and let
`hO' := hmono.2 hO` be its transported version at `p_A`.  The proof calls
`allRows_of_open0_alt` (`HA-S3`) with:

- seven published inputs from `P` (Artin reciprocity, Siegel–Weil convergence, discrete-series
  cover/classification, Harish–Chandra modules, rapid decay, Casselman–Wallach);
- the two components of `ontoX_and_lamLow_of_unitaryGroupHypotheses' P`;
- `hL`, the extension `N_A`, `SExt.none`, `geoCl anyGeometry`, and the family predicate `S0.NL`;
- the four row premises `hO'`, `hL3`, `hF`, and `hN'`.

The result is

\[
h_{All}:\mathrm{AllRowsAlt}
  (KPx,\mathrm{IsBuiltE}(p_A.s),\mathrm{IsGoodE}(p_A.s),
   \mathrm{BundleLinkage}(p_A),S0.NL,\mathrm{DefiniteSideCondition}).
\tag{2}
\]

`AllRowsAlt` (`HA-S4`) has 26 named fields.  `allRows_of_open0_alt` fills them as follows:

| Source | Fields of `AllRowsAlt` |
|---|---|
| transported open record `hO'` | `jOn`, `hPA`, `hLamP`, `hDivG`, `hDcPtG`, `selJ`, and the open subfields used to derive `hTw`, `zL`, and `rRows` |
| fixed/constructive row theorems | `hn4`, `hInstR`, `aC2`, `aP10`, `aAtG`, `aPt0`, `aPtTw`, `aPer0`, `aPerTw`, `tie`, `hRB`, `sLp`, `sO`, `hServ`, `hTF`, `c30` |
| `hL3` and `hF` | used together, with open fields, inside the proof of `rRows` |
| transported prime row `hN'` | copied exactly as `nRest` |

The key exact code is `nRest := hN`.  Here the local parameter name `hN` in `HA-S3` denotes the
already transported `hN'` supplied by `HA-S1`, not the original `BoundAtTwoThreeFamilyFonAlt`
premise at `p₀`.

The functional and covolume rows are not standalone fields of `HypsAlt`.  In `HA-S3` they are
conjoined with `hPA`, `hDivG`, `good`, `geo`, `mi`, `kap`, and `df`; the combined row is passed to
`row_rRows_stage0_alt`, producing `AllRowsAlt.rRows`.  Any summary that says “`hF` fills a
functional field and `hL3` fills a covolume field” is false for this record layout.

## Step 4 — simultaneous class selection constructs `HypsAlt`

The final call is `nonempty_hyps_of_allRows_alt` (`HA-S5`).  Its complete theorem boundary is:

\[
\begin{aligned}
&\mathrm{SiegelMassRatioCM}\to\mathrm{LitThin}\to\mathrm{WuDecayOfGap}
\to\mathrm{RowsFinDim}\to\mathrm{TypeP}\to\mathrm{RowNGP}\to\mathrm{RowMainEqP}\\
&\to(\forall D,\mathrm{MassRatioUnderVolume}(D))
\to(\forall D,\mathrm{GenusMassAt}(D,2))\\
&\to\forall KP,Q,Q',Lk,N,DR,\\
&\quad(\mathrm{MinkDiv}\to\mathrm{BaseCond}\land\mathrm{FirstG}
      \land\mathrm{ExportF}\land\mathrm{SecondG})\\
&\quad\to\mathrm{ExBL}(KP,Q,Q',Lk)
\to\mathrm{AllRowsAlt}(KP,Q,Q',Lk,N,DR)
\to\mathrm{Nonempty}(\mathrm{HypsAlt}(N,DR)).
\end{aligned}
\tag{3}

In `HA-S1`, (3) is instantiated with `KPx`, the inferred built/good slots and bundle linkage,
`N := S0.NL`, and `DR := DefiniteSideCondition`.  Its remaining inputs are:

- `hP` from (1);
- fixed literature/row constants (`litThin`, `wuDecayOfGap`, `rowsFinDim_link`, `rowsPos_typeP`);
- `rowNGP` and `rowMainEqP` derived from `P.siegelWeilUnitaryConvergent2`;
- the volume ratio from the same Siegel–Weil premise and `genusMassAt_two`;
- `(fun _ => hMem)`, `hEx`, and `hAll` from (1)–(2).

The difficult operation in `HA-S5` is not fieldwise copying.  It first obtains counting constants
from `hAll.c30`, appends all 26 row predicates (plus the `hTu` row) with repeated `RowL.and`, and
calls `UpperTheory.Top.classSel`.  This single selection returns one common family class `𝒜`, one
raw selection `σ`, existence/duty witnesses, and all row conclusions for that same choice.  Only
after that simultaneous choice does the proof construct the `HypsAlt` record.

The final 46 fields fall into four auditable groups:

1. **Chosen data:** `𝒜`, `σ`, `cT`, `hEx`, `hduty`, `hMt`.
2. **Rows selected from `hAll`:** `hRB`, `hTw`, `hPA`, `hLamP`, `hDivG`, `hDcPtG`, `hTF`,
   `sLp`, `sO`, `h30`, `hInstR`, `selJ`, `jOn`, `rRows`, `aPt0`, `aPtTw`, `aPer0`, `aPerTw`,
   `aP10`, `aAtG`, `aC2`, `hServ`, `irrC`, `zL`, `tie`, and `nRest`.
3. **Fixed structural/literature inputs:** `hLit`, `hWu`, `hRF`, `sTy`, `sNG`, `sM`, `hU`, `hG`.
4. **Counting and transfer data:** `hTu`, `hn4`, `c30`, `hc30`, `cIc`, `hcI`.

Several selected rows are restricted from the working class to the final closed class using
`Closed.sub` and the two inclusions `s1`/`s3`; `selJ` uses `Classical.choice`.  Those operations are
part of the proof and prevent the construction from being described as a purely constructive
record literal.

## Exact dependency map of the four late inputs

| Input to `HA-S1` | Consumed by | Exact downstream effect |
|---|---|---|
| `hEv : EvLgG A` | `large_unramified_exponent_bundles_exist_alt` | produces the member/existence package enabling `classSel`; no direct `HypsAlt` field |
| original `hN` at `p₀` | `final_alt_alt`, then `hmono.1` | becomes `hN'` at `p_A`, then `AllRowsAlt.nRest`, finally `HypsAlt.nRest` |
| `hF : LinkedAt p_A FunctionalCondition` | `allRows_of_open0_alt` | one conjunct used to prove `AllRowsAlt.rRows`, finally `HypsAlt.rRows` |
| `hL3 : LinkedAt p_A CovolumeBoundThirdPlaceSeries` | `allRows_of_open0_alt` | one conjunct used to prove the same `rRows`; not a separate final field |

This completes the unresolved mapping left by the preceding adapter chapter.

## Downstream link and scope

`nonempty_hyps_definite_side_of_closed_bound` supplies the nine inputs above at
`cDep = max CF0 CF1` and `A = GridA (max CF0 CF1)`.  Its output is passed unchanged to
`every_character_of_green_v_win`, which uses the `HypsAlt` witness in the zero-free character-box
theorem.  The present chapter therefore explains the record-construction bridge; it does not prove
the analytic zero-free theorem, the local/global Galois inputs, or any premise record.

No hypothesis has been discarded.  No URT scheduling or mathematical advantage is claimed.

## Executed tests

- `python3 verify_hypsalt_constructor.py --self-test`
- `python3 verify_hypsalt_constructor.py --report 2026-11-24_hypsalt_unramified_constructor.md`
- `python3 -m py_compile verify_hypsalt_constructor.py`

The verifier also supports

```
python3 verify_hypsalt_constructor.py --source-root /path/to/riemann-hypothesis
```

which checks all seven upstream Git blobs and the exact source tokens.  That mode was not executed
here because the pinned upstream repository was available through the GitHub connector but was not
materialized as a local checkout.

## Failed attempts and limitations

- Direct code search was not relied on: the relevant declaration is in a very large generated
  module tree.  It was located from the exact import list of the already-audited adapter file.
- The first likely file, `AllRows.lean`, defines only the 26-field record.  The constructor is in
  `LinkROfIsLinked.lean`; assuming a filename-to-theorem match would have missed the actual proof.
- Lean, Lake, and the upstream checkout were unavailable locally.  No kernel elaboration,
  `#print axioms`, or transitive trust audit was run.
- The types of intermediate `hNrow` and the inferred slots passed to the final constructor are
  source-forced by their subsequent typed uses, but were not independently printed by Lean in this
  run.
- This does not unpack `final_of_alt`, `row_rRows_stage0_alt`, `classSel`, or
  `zeroFreeAll_of_topG`; each remains a separate proof obligation.

## RESUME HERE

Trace `UpperTheory.Top.zeroFreeAll_of_topG` at the pinned revision.  Record its full quantifier
boundary, then show exactly how `forall_goal_of_shape_of_hyps`, the fixed `la = 3/2`,
`supplyChi`, and `VWin` discharge its hypotheses.  Preserve the primitive/imprimitive boundary and
do not repeat the already completed `HypsAlt` construction.

HANDOFF TO: MATH, character-box audit, integration, proof editor.



---

## Appendix 17: specialists/positivity_geometry/RUN2_SMALL_SECTION_COMPARISON.md
Working-repo blob bf9b30f08534b376682af8e750ec51ab2fd72344.

# Geometry run 2 — small-section comparison by quotient injection and radius control
2026-11-24. RESULT: SOURCE-MATCHED local reconstruction; full project PARTIAL. Completes the small-section continuity-from-above comparison used in run 1's VolGe argument. Also narrows the downstream height/volume dependency; no assertion of root kernel reachability.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity, research state/log/protocol and CI summary (PASS run 45355061872, 3149343, 08:41:49 UTC; physical CI is not RH validation). Read prior geometry RUN1 and latest peer handoffs (kernel, acceleration, integration, math, theta, Galois, character boxes, Landau, literature, prime, editor, structure, dependencies). No physics files or shared queue edited. Upstream main head observed ed2fb2c8dbc2380ce1f46627b8f777634b041244 (08:52:02 UTC); fetching the corresponding original comparison path at that revision returned 404, so no assertion of cross-revision equivalence. All below uses the original pin 40e56bab026552e089d7afcfeff08d2defb9c005 in leanprover-community/riemann-hypothesis.

## Source ledger
Paths relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ unless specified. Blob identities:
- A SmallSectionCountContinuousFromAbove.lean 1f906375336006e801ad61f14a09679c6dd380cb
- A' SmallSectionCountContinuousFromAboveStatement.lean 576ce7a9e4043f9dd3ac9b952163fc1e8c85a065
- B EncardMulLeOfQuotEmbed.lean d472deebf3195b1c42285d319e8c582efd2767cc
- C ArithSmallSectionsEncardMulLeFiniteLevel.lean 0b78e4fe16679b2bbffdcdc039b3d78445b82844
- D MemSmallSectionBallOfMulPowSection.lean 894c41e69deeac4905e35c5c6ec0f04b567e778a
- E ExistsLogNcardSeminormBallExpSmallLe.lean 78652f5802201a83030be5b2af64ae38db0371e6
- F SmallSectionCountNearPowersLe.lean 604268f009f2cb5a645eaa358705063ea2fdd503
- G SmallSectionCountLePowGoodPairStatement.lean fbf8546710cb9636902a475af1925e978dd3373e
- H HermLineBundlePairBallsFiniteStatement.lean 99cbe9bfa3c6a18db148efecb67343d68c45d25a
- I IsSeminormBallFamilySectionBallsStatement.lean 4e0068b55f6b6f756bcbea11711f40338b6de486
- J ArithGlobalMaximumPrincipleOffDivisorStatement.lean 362713b605e32e8e0adb262390cb3fde23c4cbff
- K ArithSmallSectionsEncardMulLeFiniteLevelStatement.lean 6f3988962f2f49c69c0e2b8dae30b873b83287f5
- L MemSmallSectionBallOfMulPowSectionStatement.lean 37c57acda6dfa8e0ee8c760c0f582ce3eef6d069
- M ExistsLogNcardSeminormBallExpSmallLeStatement.lean 1d21b35f15a1cefdea0b62bef3b0519ecafae718
- N SmallSectionCountNearPowersLeStatement.lean 77f9b93a8e1aa6495e6ae469b4a221a48d895e7c
- O src/Development/AbelianVarietyTheory/Definitions/Divisors/CharZeroFunctionField.lean f0bb42594c83ce7baca8da440bbbd36f2c9d730a

## Exact target and assumptions (A:36–39, A':12, O:37–109)
Let k be any commutative ring, X an integral scheme of universe 0, p:X→Spec k, D a natural number, and IsArithVar p D. Assume ArithHilbertSamuel and ArCalc, and a pair P of Hermitian line bundles L,A with rational trivializations r,r'. The subgroup H(a,c) consists of rational functions f for which all local expressions loc(a,c,f,i,j)=f r_i^a (r'_j)^c are regular at every point of the relevant charts. The norm nu(a,c,σ,y,f) is the absolute value of the corresponding rational evaluation times exp(-(a φ_L+c φ_A)/2). Bl(a,c,R) consists of members of H(a,c) with that norm ≤R for every embedding σ:k→C and complex point y. lc(a,c,R)=log(ncard Bl(a,c,R)).
Keep all eight Good fields: A underlying ample, A nef in dimension D, b>0, s in Bl(0,1,1), s≠0, t in Bl(-1,b,1), t≠0, and the local regularity implication for each x,i,j,g regular at x: if g loc(-1,b,t,i,j)/loc(0,1,s,i,j) is regular then g/loc(0,1,s,i,j) is regular. This last condition is crucial to quotient pullback. No assumption of nefness of L in this lemma.
For every epsilon>0 there is n0 such that for every n≥n0 there is m0(n) such that for every m≥m0(n), with N=nm and d=D+1:
  lc(N,m,1) ≤ lc(N,0,1)+epsilon N^d.
The inner m threshold may depend on n. This is not a uniform-in-n bound for all large pairs with one common m0.

## 1. The combinatorial heart (B:9–58)
In additive group G take subgroups Λ,Λ',Λ0,Λ0', ball families B,E and additive T. IsBallFam supplies containment in the subgroup, zero for nonnegative radii, subtraction B(r)-B(r')⊆B(r+r'), and positive integer scaling equivalence. Assume T(B(1))⊆E(1), and for u in Λ, T(u) in Λ0' implies u in Λ0, and B(1) finite.
Let R be the image of B(1) under G→G/Λ0. Choose s_c∈B(1) representing each c∈R. Every x∈B(1) is s_[x]+(x-s_[x]), where the difference belongs to B(2)∩Λ0. Therefore |B(1)|≤|R| |B(2)∩Λ0|.
The map (c,v)↦T(s_c)-v from R × (E(1)∩Λ0') lands in E(2) by subtraction. If two outputs coincide then T(s_c-s_c')=v-v'∈Λ0'. Since s_c-s_c'∈Λ, pullback gives s_c-s_c'∈Λ0, hence c=c', then v=v'. It is injective. Multiplying and associating the two cardinal inequalities gives
  |B(1)| |E(1)∩Λ0'| ≤ |B(2)∩Λ0| |E(2)|.
The Lean theorem uses extended cardinalities (encard); no cancellation by |R| or division by potentially infinite cardinals. Finiteness and positivity are established before taking real logarithms later.

## 2. Specialize to the rational sections (C:21–97)
For fixed N,m set B(R)=P.Bl(N,m,R), E(R)=P.Bl(0,bN+m,R), Λ=P.H(N,m), Λ'=P.H(0,bN+m), T(u)=u t^N. Define Λ0={u:u/(s^m)∈P.H(N,0)}, Λ0'={u:u/(s^m)∈P.H(0,bN)} as additive comaps. Powers of s,t have the expected bidegrees and nonnegative norms ≤1 (C:27–42); T maps B(1) into E(1) via multiplication and the bidegree sum (N,m)+(-N,bN)=(0,bN+m). The imported div_pow_mem_sections_of_mul_pow_mem supplies the required pullback condition via Good's local regularity hypothesis; keep it as a separate obligation. Multiplication by s^m is injective (s≠0, function field). It embeds Bl(0,bN,1) into E(1)∩Λ0', and gives a bijection between S={f∈H(N,0):f s^m∈Bl(N,m,2)} and B(2)∩Λ0. The inverse is division by s^m. Substituting in B yields exactly
  #Bl(N,m,1) · #Bl(0,bN,1) ≤ #S · #Bl(0,bN+m,2).
Initially in encard, with finiteness of Bl(N,m,1). This argument does not assume a direct map of all small sections from L^N A^m into L^N at radius 1.

## 3. Radius control and the three estimates (A:40–88, D:16–45, E:11–78, F:17–54)
H and I give finite balls and ball-family laws; all nonnegative-radius balls contain zero, so counts≥1. G gives C0 and eventual crude log count at exp(3N) ≤C0 N^d. Apply E with tolerance eta=epsilon/3. Its choice e=max(1,ceil_nat(C0/eta)), delta=1/e>0, gives eventual
  lc(N,0,exp(delta N))≤lc(N,0,1)+eta N^d.                 (R)
Here E invokes the still-open radius-change cardinal inequality with Q=ceil_nat(2R+1), R=exp(N/e)≥1. Q≤4R; R^(e+1)≤exp(2N). For N≥3e, R Q^e≤exp(3e+2N)≤exp(3N); monotonicity of balls follows by subtracting zero. The cardinal inequality #B(R)^e≤#B(1)^e #B(R Q^e), combined with finiteness, zero membership, the crude bound, log laws and C0≤eta e, proves (R). No assumption that C0>0 is required for this choice of e.
For D apply off-divisor maximum principle J with delta/2. It gives rho>0 with the implication: if f∈H(N,0) and all complex points where nu(s)≥rho have nu(f)≤R0, then f lies in Bl(N,0,exp((delta/2)N) R0). Choose C=max(0,-log rho), so exp(C)nu(s)≥1 at such points. For f∈S, nu(f)nu(s)^m≤2, hence nu(f)≤2 exp(Cm) there. J gives
  S ⊆ Bl(N,0,2 exp(delta N/2+Cm)).
For n≥max(1,(2C+2)/delta) and m≥1 we have delta n/2≥C+1, thus
  1+delta N/2+Cm≤delta N
using m≥1. Since 2≤exp(1), S⊆Bl(N,0,exp(delta N)); S is finite. This is the exact reason the factor 2 is harmless; do not drop it.
F invokes the polynomial-asymptotics comparison with d, b>0, leading coefficient selfInter(A)/d!, slope d·gdeg(A,D)/d!, and the Hilbert–Samuel log-ball limit for A shifted by zero (A nef). The fixed-radius 2 count is eventually dominated by exp(η'j) for every η'>0. It gives
  lc(0,bN+m,2)≤lc(0,bN,1)+eta N^d                      (P)
eventually n, eventually m. Preserve these imported asymptotics and nef shift theorem as obligations; the source proves the conversion (bn+1)m=bN+m.
Choose n large enough for F and the radius threshold. For this n≥1, N=nm→∞ as m→∞, so choose m sufficiently large for (R), (P), m≥1. From section 2 take natural counts using all finite balls and S finite; log product lemma A:20–34 derives
  lc(N,m,1)+lc(0,bN,1)≤lc(N,0,exp(delta N))+lc(0,bN+m,2).
Combining (R) and (P) gives lc(N,m,1)≤lc(N,0,1)+2eta N^d≤lc(N,0,1)+epsilon N^d since N^d≥0. The original uses linarith; no limit interchange. This proves the exact small-section comparison conditional on listed leaves and completes the comparison used in RUN1, not the entire geometry chain.

## 4. Downstream height dependency correction (source record, not exact kernel)
Additional pinned sources relative to src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/:
- ThirdPlaceSeries/HeightLowerBoundGeneral.lean b6012f8c9b260e1596140ce99671df2b7692f72c :22→ ThirdPlaceSeries/HeightOfSteps.lean 57977b43b6f96237cfe73383319866bceebbbad3 :36.
- HodgeBundleWeights/HeightAddLogNonneg.lean d764bb7e9b2524f39456e99a8d98de3b3ccdbf47 :98→slope_le_height :48–65.
- HodgeBundleWeights/VolumeLineBundleLe.lean 084f70a82c1d7335082f3284bf0620bcef38be05 :13–22 uses existence of nef model plus countingVolume_le_selfIntersection_nefHermitianBundle with hP.q9 (ArithHilbertSamuel), not direct hP.p2 (VolGe).
- HodgeBundleWeights/ExistsNefModelOfImage.lean 3c6930f48506b89563f7736aa44378fea26588cb :26–41 uses image model, hP.q11 (CycleHeights), nef shift and hPX.1/.2 (self-intersection upper bound and small-section injection). HodgeBundleWeights/VolumeEstimateHypotheses.lean e93eb83a9cef1478cbec92f522522b2fa3a33a55 :9–11 defines exactly these two hypotheses.
- HodgeBundleWeights/ExistsModelOfImage.lean b305815d2811ba8f4a542fb07d467b556e4b665a :15–16 accepts PublishedHodgeBundleTheorems but ignores that argument in its local body.
- HodgeBundleWeights/ImageHeightNonnegOfDivisor.lean 8321ba34e7d2620188f8a47cd946873a93d546d7 :11–12 and HodgeBundleWeights/CoverHeightComparison.lean 342c70053c61ddf2483dbc46adeed88b79ab1b40 :33–35 likewise ignore the record in their immediate bodies.
- HodgeBundleWeights/ToKnownTheoremsOf.lean 95aeefe8ba6bb9f38a0d32b3147d331792ef74d8 :7–35 identifies p2 as VolGe, q9 as ArithHilbertSamuel, q11 as CycleHeights. :39–45 explicitly projects p2 into Hypotheses'' via toClassicalTheoremsOf. This is a genuine source projection but not evidence that the downstream height proof uses it.
- ThirdPlaceSeries/CoveringGramMatrixOfLocalTraces.lean 89eef28a309cf74b302c60ded73f0f7abfcb9c6c :17–20 ignores hP, calling local row producers instead.
- ThirdPlaceSeries/TopCovolG.lean 62742fab059140fb67f88b2c1e18abd6078992b3 :54–58 connects height to uniform lower bound and covolume.
Important distinction: the prior VolGe is a LOWER bound on arithmetic volume, whereas volume_line_bundle_le uses a counting-volume UPPER bound via self-intersection. No direct implication from VolGe to the upper bound is claimed. hP.p2 is record-flow only on the inspected direct height path. It may be used in other producers; no global dead-code conclusion. Next inspect actual hPX.1 and .2 producers and consumers of toClassicalTheoremsOf.

## 5. Execution
Actual connector V8 run re-fetched and checked all six main body blob hashes A–F and 21 source substrings. Executed 4,212 finite integer quotient injection/cardinality examples; minimum cardinal slack zero; 19,800 exact rational radius-exponent cases; zero failures. These are generic regression tests, not source-native arithmetic schemes or Lean kernel proof checks. No URT speed claim. No source hypotheses discarded. Reproduce the executed integer checks with:
```python
from math import gcd
from itertools import product
qcount=rcount=0
minslack=None
for a,q,u in product(range(1,7),range(1,14),range(9)):
    for v in range(a*u,a*u+6):
        h=q//gcd(a,q)
        slack=(2*(2*u//h)+1)*(4*v+1)-(2*u+1)*(2*(v//q)+1)
        assert slack>=0
        minslack=slack if minslack is None else min(minslack,slack)
        reps={}
        for x in range(-u,u+1): reps.setdefault(x%h,x)
        z=[a*x-y for x in reps.values() for y in range(-(v//q)*q,v+1,q)]
        assert len(z)==len(set(z)) and all(abs(i)<=2*v for i in z)
        qcount+=1
for d,j,C,k,m in product(range(1,6),range(1,10),range(11),range(5),range(1,9)):
    n=((2*C+2)*j+d-1)//d+k
    assert d*n*m-2*j*C*m-2*j>=0
    rcount+=1
assert (qcount,rcount,minslack)==(4212,19800,0)
print(qcount,rcount,minslack)
```
Source assertions: A (2 * C + 2) / δ, htend.eventually hrad, hSfin.cast_ncard_eq, log_add_le_of_mul_le, simp only [Pair.lc]; B x - s (q x), T (s p.1) - p.2, hpull _ hΛ hd; C pow_ne_zero _ hg.s_ne, div_pow_mem_sections_of_mul_pow_mem, mul_left_injective₀ hs0; D max 0 (-Real.log ρ), arith_global_maximum_principle_off_divisor, one_le_pow₀ h1; E max 1 ⌈C / ε⌉₊, eventually_ge_atTop (3 * e), encard_seminormBall_pow_le_radius_change, le_of_mul_le_mul_left this heR; F eventually_le_of_poly_asymptotics, hG.pos, arith_hilbertSamuel_log_ball_count_tendsto. Re-fetch pinned bodies and compare git hash-object. No CI for this specific note yet.

RESUME HERE: Follow the actual VolumeEstimateHypotheses producer in ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean, locate the exact theorem implementing SelfIntersectionBound, translate its inequality (especially normalization [K:Q](D+1) times image degree and shifted height). Trace whether it calls PublishedHodgeBundleTheorems.p2 or uses different fields. Preserve SmallSectionsInject as distinct. Separately the next leaf of the comparison is EncardSeminormBallPowLeRadiusChange.lean; do not redo the quotient injection or radius comparison above.
HANDOFF TO: integration, editor, audit, literature, theta. The small-section comparison is now human-readable; correct any manuscript claim that VolGe alone proves the downstream height/covolume inequality.



---

## Appendix 18: specialists/character_boxes/RUN2_SMALL_LEVEL_RANK_EQUALITY.md
Working-repo blob 71000315655d3aa12634f4e943630b9ca7c7fa5b.

# Run 2 — small-level rank equality from surjective level projections
2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of the actual fourth link in TopShape's nine-link conjunction. Project remains OPEN. No kernel validation and no URT performance claim.

## Continuity and provenance
Read all three swarm protocols, AGENTS, continuity, research state, actual runner log/protocol, physical CI summary (45352595797 PASS, unrelated to RH), prior character-box run 1 and recent integration, math, theta, Galois, prime-window, Landau, kernel, acceleration and positivity handoffs. Run 1 already covered the connected-family witness and character transfer; this run takes its expressly open rank-equality frontier. Other math notes cover native host rank budgets, not this adjoint/range proof. All derivations below refer to upstream leanprover-community/riemann-hypothesis at 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed b37b32c236352418f6edf1ed85dd2e4b14420686, 08:32 UTC: the three old ThirdPlaceSeries Link/RankZeroOfRowConditions/BaseRowsEqRecordRows paths returned 404 at that commit; Formalism/LocalToGlobal/NormalizedHeckeFactors/BaseRowsEqRecordRows changed to blob 9000af1d3a539f8a1a89cf6400f1f4babe3b7239. No inference about deleted theorem contents or equivalence across versions.

## 1. Statement and actual route
SmallLevelRankEq(Fm) means: there exists x0 such that for every x >= x0, every i in Fm.Ix(x), every j in SizeData₂.lifts(D) (D=Fm.D(x,i)), the rank dZ0 of the small level j equals the base row count D.what₂.D0. This is NOT a claim of zero dimension. The source uses Finset.mem_Icc on the lifts, giving 1 <= j <= D.R.m.
Actual theta TopShape calls GlobalTheory.Top.link_alt_alt_alt, not the parallel old smallLevelRankEq_closed_of_levelProjection_surjective route. Its hypotheses are the common family class A and the typed selections sel, selS, selP, selDH, selC, selB, all-realisation primitivity hPA, lambda rows hLamP, divisor rows hDivG, and closed surjective level projection zL. These all refer to the SAME selected records.
For each relevant Fm in D3(3,A), zL supplies xr with the following eventual property: for x>Fm.x1, x >= selected threshold s and x >= xr, every i and k in Fin(D.R.m), the selected level projection lPrj at the base type P.A3.A.μ0 is surjective. No universal xr across families is asserted.

## 2. Produce the required local row conditions
At any allowed selected point, P is the first component of selP and its second component proves RowSideDeterminedAlt for the tied data T. hLamP gives RowsHoldLam3 P.
- hDivG is DivRows3G. The realisation Q from selB has Q.charW.tup.mu_used: each type is base or a place-indexed type. In BaseRankEqOfRealisation.tup_all_used_of_realisation, the place case is transported by D.plEq.symm and the identity Q.Rl.mu=P.S0.μ. This gives TupAllUsed(P), so hDivG.toRows yields the actual DivRows3 with all selected A3,P0,ψ0,Ps,ψs,Zs,S0,S1,p0,C,NuC,I arguments.
- AllRealisationsPrimitive consists of PrimRows3 for the chosen indefinite realisation AND TypesSep3. selP_condition_zero_of_primAll extracts both, then calls that realisation's rowsHold0 with selected column compatibility ok1. Result: RowsHold0_3 P. Neither primitivity nor type separation is replaced by surjectivity.
- BaseRowsEqRecordRows uses RowsHold0_3 to derive well-formedness wf0 from famOk, zsSt, zsBl, famSep, then transports row structure via rows0. Consequently dW(i)=P.S0.D and the E_p subspaces form an independent family spanning the entire base carrier.
The local rank step still presupposes the geometric/automorphic producers of these row conditions. We have not proved them from nothing.

## 3. Human proof of the local rank step
Fix one allowed point and k in Fin(D.R.m), one type t in P.T. Write j=k+1. Assume the local projection L=lPrj(...,k,t).mulVec is surjective; assume the row hypotheses just listed. The actual theorem is Formalism.L2.N.ExtNRows3.thetaT_injective_and_finrank_Zj_eq_D0_of_surjective.

(a) Base count: let E_c be the row subspaces P.S0.Ep(c). Independence and spanning give dim(base)=sum_c dim E_c. RowsHoldLam3 provides the map cOf from embeddings σ to classes c and its third component h3 identifies each dim E_c with sum over embeddings satisfying cOf(σ)=c of nRows0(σ). Because the fibers of a function partition its domain,
    P.S0.D = sum_c sum_{σ:cOf(σ)=c} nRows0(σ) = sum_σ nRows0(σ) = D.what₂.D0.
The last equality is the finite cardinality of the sigma-fiber decomposition of ft0 on Fin(D0). This is the actual sum_finrank / sum_fiberwise / sigmaFiberEquiv argument, not a dimension assumption.

(b) Level space M_j: the selected division data P.tied.div.th provides a linearly independent spanning family indexed by Fin(P.S0.dW(k)). It is a basis, so dim M_j=dW(k)=P.S0.D=D0. The equalities use finrank_Mj_eq_dW, dW_eq_D, base_rows_eq_record_rows_alt.

(c) Surjectivity transfer: set B=(P.S0.θ k t).mulVec. RowsHold0_3 gives rows0 and the l1c.2.1 field proving B bijective. For each coordinate basis vector e_a, choose z such that Bz=e_a; then choose y with Ly=z (surjectivity of L). DivRows3.thTheta is the required commutative identity: thetaP(y) is the basis embedding P.I.jW(k) applied to B(Ly), with domain coercions as in the Lean source. Thus thetaP(y)=jW(k)e_a, the corresponding spanning vector of M_j. The range of thetaP contains the spanning family, hence equals all of M_j. This proves thetaP surjective. Both the bijective B and the thTheta identity are indispensable; merely asserting that L is surjective is insufficient.

(d) Adjoint: thetaT is the adjoint of thetaP in the relevant finite-dimensional complex inner-product spaces. If thetaT(v)=0, choose u with thetaP(u)=v. Then <v,v>=<thetaP(u),v>=<u,thetaT(v)>=0 (up to inner-product convention), so v=0. Hence thetaT is injective. The definition Rows.Data.Zj is the range of thetaT, so dim Z_j(t)=dim M_j=D0 by the rank-of-injective-range theorem. This step uses adjoint_injective, thetaP_surj and LinearMap.finrank_range_of_inj, not any numerical approximation.

## 4. Family and type quantifiers
The outer rank_zero_of_row_conditions_alt accepts T and P pointwise above a fixed threshold x0, and all four row hypotheses, plus: at each point there exists t with P.I.tup(t)=D.what₂.mu0 and for ALL k the local projections at t are surjective. link_alt_alt_alt supplies exactly t=P.A3.A.μ0 via P.tied.div.tup.mu0 and zL. It is not a separately chosen t for each k. Choose x0=max(s,xr). The rank-zero wrapper uses X=max(x0,Fm.x1+1) to make the strict x>Fm.x1 premise automatic. At every x>=X and index i, any lift 1<=j<=m corresponds to k=j-1 in Fin(m); apply the local lemma and rewrite the selected type by htup. This is the source equality (Fm.L x i).dZ0 j=D0. No induction on j, no global choice of a threshold independent of Fm. If m=0 there are no such j.
Finally Closed.imp maps zL to the desired eventual rank property for all members, and closed_of_mem removes the repeated membership premise under the Closed class. The Closed quantifiers, design witness and all original selections remain in place.

## 5. Downstream and upstream joins
TopShape passes the resulting Closed(SmallLevelRankEq) as the fourth condition in topDesWin. DesWin combines it with the same-family HypV and LinkN to invoke divinN_of_hypV. There the equality is consumed as h4 x g4 i j hj in divinN_at (the argument hd); it supplies exactly the replacement of L.dZ0(j) by D0, allowing the common division budget. The analytic argument is NOT thereby independent of the arithmetic geometry.
Upstream: AllRowsAlt.zL is Lg1 KP Q Q' with SlotZeroLocusCondition; NonemptyHypsOfAllRows converts it to RowL SelectionZeroLocus, adds it to the nested hall conjunction, and classSel chooses the one common class and raw selection σ. The extracted zL is assigned directly to HypsAlt.zL. ShapeOf passes h.zL (and hPA,hLamP, and the divRows3G_iff conversion of hDivG) to the actual TopShapeAlt. This traces the record flow to the common selection; the substantive SlotZeroLocusCondition producer remains open, not silently discharged.

## Source inventory
T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
F = src/Formalism/LocalToGlobal/NormalizedHeckeFactors/
C = src/Development/AutomorphicArithmetic/CharacterBoxes/
Pinned blob identities returned by GitHub (not independently rehashed during this run):
- T/TopShape.lean 3f791ca182db235c4a8ff582d3f038019320d5cd
- T/Link.lean 2e303ba7a042b38d3edb0630fee6b519442b546f
- T/RankZeroOfRowConditions.lean a3b28b058716ef66ed61a86e9fda3fdf619667e5
- T/BaseRowsEqRecordRows.lean c224498f474ad9be9f8fe4fb0a9d9cb60f2a6615
- F/BaseRowsEqRecordRows.lean de4ad89a82942891d722dba018a7385cdea991bf
- T/BaseRankEqOfRealisation.lean 73832da09224c40d0aed60316629b1b80d6c55d1
- T/IndefiniteRealisationChoice.lean 9f48b3c9d62cb8f49d7d3787e40dcf496b3a66d9
- src/Formalism/SharpRestriction/GlobalTheoremInputs.lean ba31f5120ed089d48968754ae577427912d467c5
- T/Hyps.lean 7e51220c82d43cf3a9345e87a9aa8751b38a5a25
- T/NonemptyHypsOfAllRows.lean 6a09205dfc3e57486ecbc27517072f3c27f09a51
- T/AllRows.lean be24ab5328945e90d2b981ff43ed9f20bb8b86ac
- T/ShapeOf.lean 236d0eadd60b292bd0a832114f8c4a6253131250
- C/DivinNOfHypV.lean 5321920359316653b7627951429a6d7555c311b0

## Executed checks and reproducibility
V8: 13 connector blob-identity assertions and 71 literal source assertions (84 total) all succeeded. Inspected actual theorem bodies. For example replay from the pinned upstream checkout: git show PIN:T/Link.lean, replacing T by its full path; check rank_zero_of_row_conditions_alt, selP_condition_zero_of_primAll and tup_all_used_of_realisation calls; in T/RankZeroOfRowConditions check thetaT_injective_and_finrank_Zj_eq_D0_of_surjective; in F/BaseRowsEqRecordRows check hR.thTheta, hb.2 (Pi.single k 1), hl z, adjoint_inner_left; in T/BaseRowsEqRecordRows check sum_finrank, Finset.sum_fiberwise, sigmaFiberEquiv, LinearMap.finrank_range_of_inj; in C/DivinNOfHypV check h4 x g4 i j hj. Rehash via git hash-object --stdin against the above blobs. Literal tests are not elaborated dependency verification.

Executed independent finite elementary-algebra regression (real integer matrices, hence complex rank agrees; NOT native geometric operators). Exact BigInt rank elimination without division, all 2x3 projections and 2x2 factors over entries {-1,0,1}. 59,049 pairs: 29,952 both full rank yielded full-rank composite and injective transpose; 29,097 singular composite cases. Negative controls: 5,040 cases projection deficient but B invertible, 20,592 cases projection full rank but B deficient; both demonstrate necessity in this generic argument. Also 3,280 finite fiber maps, 7,572 threshold implications, 5,050 one-based/zero-based lift conversions. The universal proof is the linear algebra above, not these bounded cases. Actual code run in V8:
```js
function rank(a){a=a.map(r=>r.map(BigInt));let h=0;for(let j=0;j<a[0].length&&h<a.length;j++){let k=h;while(k<a.length&&a[k][j]===0n)k++;if(k===a.length)continue;[a[h],a[k]]=[a[k],a[h]];for(let i=h+1;i<a.length;i++){let c=a[i][j],p=a[h][j];for(let z=j;z<a[0].length;z++)a[i][z]=p*a[i][z]-c*a[h][z];}h++;}return h}
function mat(n,r,c){return Array.from({length:r},()=>Array.from({length:c},()=>{let z=n%3-1;n=Math.floor(n/3);return z;}))}
const mul=(a,b)=>a.map(r=>b[0].map((_,j)=>r.reduce((s,x,k)=>s+x*b[k][j],0))),tr=a=>a[0].map((_,j)=>a.map(r=>r[j]));
let full=0,singular=0,negP=0,negB=0,fiber=0,threshold=0,index=0;
for(let p=0;p<729;p++){let P=mat(p,2,3),rp=rank(P);for(let b=0;b<81;b++){let B=mat(b,2,2),rb=rank(B),A=mul(B,P),ra=rank(A),rt=rank(tr(A));if(ra!==rt)throw Error("adjoint rank");if(rp===2&&rb===2){if(ra!==2)throw Error("full rank failure");full++}else {if(ra===2)throw Error("singular unexpectedly full");singular++;if(rp<2&&rb===2)negP++;if(rp===2&&rb<2)negB++;}}}
for(let n=0;n<=7;n++)for(let map=0;map<3**n;map++){let v=map,cs=[0,0,0];for(let j=0;j<n;j++){cs[v%3]++;v=Math.floor(v/3)}if(cs.reduce((a,b)=>a+b,0)!==n)throw Error("fiber");fiber++}
for(let a=-4;a<=4;a++)for(let b=-4;b<=4;b++)for(let c=-4;c<=4;c++)for(let x=-4;x<=12;x++){if(x>=Math.max(a,b,c+1)){if(!(x>=a&&x>=b&&x>c))throw Error("threshold");threshold++}}
for(let m=0;m<=100;m++)for(let j=1;j<=m;j++){let k=j-1;if(!(0<=k&&k<m&&k+1===j))throw Error("index");index++}
console.log({full,singular,negP,negB,fiber,threshold,index});
```
No changed hypotheses. No independent Lean execution; exact kernel dependencies, the upstream SlotZeroLocusCondition producer and geometric row producer proofs remain unresolved. No full-proof denominator. No Cathedral physics edits or new speed benchmark.

RESUME HERE: locate the definition and actual producer of SlotZeroLocusCondition by following AllRowsAlt.zL back through allRows_of_open0_alt (from HypothesesNonemptyOfUnramifiedExponents imports) and the SelectionZeroLocus / RowL adapter. Translate why the actual selected lPrj is surjective for ALL k, retaining the uniform eventual xr and common σ. If it reduces to an open-orbit condition, trace the specific implication, not a generic linear-algebra assertion. Do not repeat the rank-equality implication above. Coordinate geometric producers with positivity/theta lanes.
HANDOFF TO: integration, proof editor, audit, theta, positivity, math and Galois lanes. Add this as the local proof of fourth condition, keeping zL and row producers as explicit open dependencies.



---

## Appendix 19: math/2026-11-24_native_rank_envelope.md
Working-repo blob c33efe2e16ed66630c60af763febc47e02ff3906.

# Native rank envelope and exact square-root budget
Status: SOURCE-MATCHED conditional arithmetic reconstruction, executed exact integer exponent comparisons. Native family existence and remaining geometric inputs OPEN. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.

## Original definitions and reduction
src/Formalism/SharpRestriction/ElevenLe.lean (75f2ab1404c69a5d1330671d96d8f6cd35e74e52): szTh=eps/100, SizeN, SizeM, SizeK, SizesAt. Let x>1, 0<eps<1/52. With delta1=x^(-eps/8), expand the native scale windows:
 n in [x^(2+799eps/100), x^(2+801eps/100)]
 m in [x^(1/2-29eps/400), x^(1/2-21eps/400)]
 k in [x^(9/2+999eps/100), x^(9/2+1001eps/100)].
These are mathematical conditions on the actual chosen host, not a probabilistic cancellation heuristic. SizeM contains the square root explicitly. They imply the downstream rank premises m>=x^(1/2-eps), m<=x^(1/2+eps/2), xm<=k and k<=n^2*x^(1/2-eps). Proof: compare exponents; k/(n^2)<=x^(1/2-597eps/100), much stronger than the last required bound. All inequalities use x>1, eps>0.

## Thick-set and row density are separate
src/Formalism/SharpRestriction/GlobalSchurBounds/Chosen.lean (9a85f26989d2381da29a40abfe7bd339d20815d8): ChTT_at gives n*delta1/2<=|TT|<=2*n*delta1. SizeTT alone has a weaker lower bound n*x^(-eps/100)*delta1, so do NOT silently replace ChosenTT by SizeTT.
src/Formalism/SharpRestriction/GlobalSchurBounds/LossesSmallShares.lean (70624b10f53b29e43deb89bd9dae257403ecb61e): size_windows_of_thick_density takes ThickSetDensityEventually, selects eK=5, common eventual threshold for XL using ev_pow_le_exp and ev_two_le_rpow, then uses Fm.sizes and Fm.params at each host, numN_at, winE, winP, and size_window_at_five. In linkCore, hW0 is Win_at at i0, w13 and w14 directly provide m lower and k upper; w15 gives T2 density; ChosenTT supplies TT lower bound. Native n matches model H by hcardH and native top/thick counts by card_TT and M.card_thick_set_model_eq. S1 is exactly RestSize. This pins down the route into the final size budget, without assuming these chosen-density properties arise automatically from ranks.

## Optional tighter algebraic envelope
Use the same normalized terms as math/2026-11-24_normalized_size_budget.md, with the additional native size bounds and same chosen densities, nT2<=n, aE<=2xb, delta=nT2/n>=x^(-eps). Then
 B1/Q <= 2*x^(1/2+29eps/400)
 B2/Q <= 2
 B3/Q <= 4*x^(1/2+429eps/400)
 B4/Q <= 2*x^(1/2-1538eps/400)
because the last exponent correction is 17/8 - 597/100 = -1538/400. Thus B/Q<=10*x^(1/2+429eps/400). The same positive normalization and 26 absorption yield Gx<=x^(1/2+(C+979/400)*eps), which implies the original C+3 bound. This is an explanatory strengthening conditional on the native envelope and exact same downstream normalization, not a claimed change to the original theorem or a shortcut around geometry. No new parameters. Keep original constants in integrated manuscript unless independently audited.

## Exact certificate
All comparisons of affine exponents are integer comparisons in units 1/400, and coefficients are positive. Executed 5 comparisons and exact max/add operations in V8:
{
  "checks": [
    {
      "label": "m lower",
      "margin": [
        0,
        371
      ]
    },
    {
      "label": "m upper",
      "margin": [
        0,
        221
      ]
    },
    {
      "label": "k>=xm",
      "margin": [
        1200,
        4017
      ]
    },
    {
      "label": "k<=n^2*x^(1/2-eps)",
      "margin": [
        0,
        1988
      ]
    },
    {
      "label": "original exponent sufficient",
      "margin": [
        0,
        221
      ]
    }
  ],
  "terms": [
    [
      200,
      29
    ],
    [
      0,
      0
    ],
    [
      200,
      429
    ],
    [
      200,
      -1538
    ]
  ],
  "max": [
    200,
    429
  ],
  "afterDensity": [
    200,
    829
  ],
  "final": [
    200,
    979
  ]
}
The algebra gives a direct reusable explanation of the four required rank inequalities, avoiding repeated tactic-level replay.

RESUME HERE: mathematical critical path is now construction of Fm.sizes (SizesAt), ChosenTT, ThickSetDensityEventually and the remaining Win_at conditions, not the analytic square-root error estimate. Find native size family existence (FamP construction, admissible host design), preserve actual chosen density and all 24 SizesAt fields. Follow size_window_at_five if needed for exact Win_at budget. Existing editor should integrate this chapter with seven-input adapter and cohomology algebra, not redo them. No complete proof claim.



---

## Appendix 20: math/2026-11-24_rank_and_thick_sphere_construction.md
Working-repo blob c0ebe83f511c381e3af317e36ba77ec3d757bec1.

# Explicit native ranks and Behrend thick-set construction
Status: SOURCE-MATCHED mathematical derivation of selected constructive lemmas. Not proof of the full host geometry. Pin leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005.

## 1. Native rank existence is constructive
Sources: src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsRanksRankValFrame.lean (f383bc28266dc3b81f4b1cf1f33e04c53ebc2d43), exists_even_between, exists_ranks_of_frame, exists_ranks_rankVal_frame; src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean (688162690ac7cbfe620037fcee8e451e7116f45b), RankVal, TOv, nWv. 
Fix x>=16, 0<eps<1/52 and a frame phi of order n in [x^(2+8eps),2x^(2+8eps)]. Let A=sqrt(x*delta1)=x^(1/2-eps/16), K=x^(9/2+10eps). Choose m=2 ceil(A/2), k=2 ceil(K/2). For any a>=2 the choice a_even=2ceil(a/2) lies in [a,a+2] subset [a,2a]. Here A>=2, A<=x and K>=x^4. Since n>=x^2 and n<=2x^3, we obtain m>=2, m<=2x<=2n, m+3<=k and 2n<=k. This uses only eps range and x>=16.
Define r=k+m-1, f=2n, T=ceil(x^377),
 W=ceil(10*r*(f+f^2*(k-1)^3*x^(2eps)/m)/8),
 t=8fr+4+8TW-r.
The source constructs Ranks with this t; r is odd, t positive odd since r is odd and 8fr+4+8TW is even and exceeds r. The equality r+t=8fr+4+T*nWv holds, nWv=8W. All other Ranks constructor side conditions are retained in exists_ranks_of_frame; this note does not infer a full arithmetic-geometric host solely from these numbers. RankVal follows immediately from the chosen ranges and equality. At x>=2^(100/eps) the factor 2 in RankVal is absorbed by x^(eps/100), implying the three SizeN/M/K windows from ElevenLe. This implication does NOT supply the other 21 SizesAt conditions.
The actual supply path: src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean (15c5451df3e6d1dbd5ab32860dc23f8aa6b5be17), admissibleClassesTwistedChar uses this theorem and admitted via exists_host; CharacterBoxes/SupplyChi calls it. The user-facing square-root exponent is imposed by constructive choice of rank, not derived from a physical golden ratio.

## 2. Thick set: actual geometric combinatorial mechanism
Sources: src/Formalism/FrobeniusOrbits/HostThickExists.lean (NoRel, HostThickExists); src/Formalism/FrobeniusOrbits/FrobeniusOrbitsProofs/ThickExists.lean (02c657a83fc154f32f088844242192d5395d3160), coeff_zero, sphere_rel, noRel_image, card_image, hostThickExists; src/Development/AutomorphicArithmetic/ThickFrames/ThickFrame2Large.lean (1fefe906dfa8c444e8297ce225ec01dd955a38e0), thickFrame2.
For n natural, L>=2, construct T subset naturals such that 4Ls<n for all s in T, and no three distinct s1,s2,s3 obey j(s2-s1)=i(s3-s1) with nonzero integer i,j, |i|,|j|<=L, i!=j. Want |T|>=n exp(-32 sqrt(log n log L))/L. Handle n=0 by empty set, or lower bound <=1 and n>0 by {0}.

For positive nontrivial case let u=log n, v=log L>1/2, z=sqrt(uv). Then u>32z+v so z>32v>16. Set S=floor(z/v)>=32, a=(u-v-3)/S, d=floor(exp(a)/(4L)), B=4Ld. Since z/(2v)<=S<=z/v, a<=2z. Also a>=z-(v^2+3v)/z>32v-(v+3)/32>=v+7 (use v>1/2). Thus exp(a)>=8L, d>=exp(a)/(8L)>=1, B<=exp(a).
Choose the largest equal-squared-norm subset of the digit box {0,...,d-1}^S. At most S(d-1)^2+1<=Sd^2 possible squared norms, so some sphere has at least d^S/(Sd^2) points. Encode each digit vector by integer sum v_j B^j. Injectivity holds by radix uniqueness. Its image is T. Every s<B^S, and 4LB^S<=4L exp(aS)=4n/e^3<=n. Thus the range constraint holds.
If j(s2-s1)=i(s3-s1), each signed digit coefficient has magnitude <=2L(d-1)<B. A sum of such coefficients times B^k is zero only if all coefficients are zero: reduce modulo B to see the constant coefficient is a multiple of B of smaller magnitude, then divide by B and repeat. Hence the corresponding digit vectors obey the same vector equation. Since i,j are nonzero and unequal and all three vectors are distinct, they are three different collinear points on the same Euclidean sphere, impossible: writing v2=v1+lambda(v3-v1), equal squared norms imply lambda(lambda-1)||v3-v1||^2=0. This proves NoRel, retaining all nonzero/distinct hypotheses.
Cardinality: n=e^(aS)*L*e^3, d>=e^a/(8L), d<=e^a. From S<=z/v, a<=2z, v>1/2, z>16,
 3+S(7+v)+S+2a <=3+21z<=32z.
Therefore e^3(8L)^S*S*e^(2a)<=e^(32z), and
 d^S/(S d^2)>=e^(aS)/[(8L)^S*S*e^(2a)]>=n e^(-32z)/L.
This recovers the exact 32 constant and construction, rather than treating thickFrame2 as an opaque density assumption. The alternative elementary inequality for a>=v+7 is mathematically equivalent to the source budget.

## 3. From subpower loss to the native density
The frame has n=o*n0, with 1<=o<=Co fixed, n<=Co*x^(2+8eps), and Lw<=CL log x, Lw>=2. Applying the preceding construction with n0 and Lw gives T. The construction in thickFrame2 produces the strengthened statement with CT=64 (twice 32), positive labels and 4Lw*|T2|<=n0, in addition to NoRel and range. Those extra selection details remain in the source theorem. For the density bound of that T2, take logs of its lower envelope:
 log(n/|T2|)<=log Co+log Lw+64 sqrt(log n0 log Lw).
Divide by log x. Since log n0=O(log x), log Lw=O(log log x), the quotient tends uniformly to zero for fixed Co,CL,eps. Thus for every eps>0 and sufficiently large x the loss is <=eps log x, giving |T2|>=n*x^(-eps). This is a human simplification of the source's explicit eventual threshold calculation (not an assumption that each x has the same T2).
src/Development/AutomorphicArithmetic/ShortNorms/hostOfFieldOf.lean (261b566b0ea0d155ef1a434889d720c3b439735f), hof_thick invokes thickFrame2 with CL=4084+60/eps, Co'=max(Co,2); hof_exists_host preserves T2. The distinct top subset TT is obtained through topsChoiceH (30fc631d84ac2188105d8ee9a92d2ed37ba43b7d), which invokes topsBase (d3a34386069e27091a1cd44e9f2bbb52044b591d), then topsFrame. It retains the cardinal interval, bad-orbit weighted bound and Shares approximation. Do not conflate the digit-sphere construction with the Bernoulli top-set selection. The latter is the next mathematical frontier.

## 4. Exact route to selected family and remaining obligations
FamP in ParConsts.lean (c3a5cddc3af0b027ad62b50a79cdb008712613a6) requires SizesAt at every index x>x1. The actual theta TopShape calls designExists_of_tuSize_aux4n_litThin in ThirdPlaceSeries/LinkEx.lean (e28c35e57535a15a17a9dfc7f7c1ded20e38ff82). This produces DesignExists from designChoices_upN(hEx minkowski_bound_rat), hTu, chosenProviso via class number plus second Chern rank ties, and chosenThin_closed. hEx remains substantive. Do not use alternate GlobalInterpolation/LinkEx as the exact caller. 
Actual HypsAlt producer (ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean c0ce994aa86f737b707b5617fb10bcfb35c0117e): large_unramified_exponent_bundles_exist_alt -> (hP,hMem,hEx); hyps_e_third_layer_ser_n_of_geometric_galois -> prN,serN; final_alt_alt yields hNrow, stronger-extension monotonicity transports hO and hNrow; allRows_of_open0_alt consumes those and hL3,hF; nonempty_hyps_of_allRows_alt combines hP,hMem,hEx,hAll and named geometric packages. NonemptyHypsOfAllRows.lean (6a09205dfc3e57486ecbc27517072f3c27f09a51) constructs one common class/selection via classSel and packages all its RowL conditions. The full proof still requires these geometry and automorphic producers; none dropped.

## Executed regressions
{
  "rounding": 1224,
  "ranks": 3420,
  "spheres": 64,
  "vectors": 1976,
  "distinctOrderedTriples": 55320
}
Exact rational ceiling inequalities (small safe integer numerators), abstract BigInt rank identities, and small digit spheres tested exhaustively for NoRel by reduced integer ratios; these are tests of the elementary construction only, not actual large native geometry or a Lean kernel check.
Replay:
```js
function verify(){
 let rounding=0,ranks=0,spheres=0,triples=0,vectors=0;
 for(let den=1;den<=17;den++)for(let num=2*den;num<10*den;num++){
   const m=2*Math.ceil(num/(2*den));
   if(m%2||m*den<num||m*den>2*num)throw Error("rounding");
   rounding++;
 }
 for(let n=1n;n<=18n;n++)for(let m=2n;m<=2n*n;m+=2n)for(let k=2n*n+4n;k<=2n*n+12n;k+=2n)for(const T of [0n,3n])for(const W of [0n,2n]){
  if(m+3n>k)continue;
  const f=2n*n,r=k+m-1n,t=8n*f*r+4n+8n*T*W-r;
  if(t<=0n||t%2n!==1n||r+t!==8n*f*r+4n+8n*T*W||m>t+1n)throw Error("rank");
  ranks++;
 }
 function gcd(a,b){a=Math.abs(a);b=Math.abs(b);while(b)[a,b]=[b,a%b];return a;}
 for(let S=1;S<=4;S++)for(let d=1;d<=4;d++)for(let L=2;L<=5;L++){
  const B=4*L*d,g=new Map();
  for(let p=0;p<d**S;p++){let q=p,k=0,v=0,b=1;for(let i=0;i<S;i++){const z=q%d;q=Math.floor(q/d);k+=z*z;v+=z*b;b*=B;}if(!g.has(k))g.set(k,[]);g.get(k).push(v);vectors++;}
  const a=[...g.values()].sort((u,v)=>v.length-u.length)[0];
  if(a.length*S*d*d<d**S||new Set(a).size!==a.length||a.some(t=>t>=B**S))throw Error("sphere cardinal");
  for(let i=0;i<a.length;i++)for(let j=0;j<a.length;j++)for(let k=0;k<a.length;k++){
   if(i===j||j===k||i===k)continue;
   const u=a[j]-a[i],v=a[k]-a[i],z=gcd(u,v);
   if(Math.abs(u/z)<=L&&Math.abs(v/z)<=L)throw Error("NoRel");
   triples++;
  }
  spheres++;
 }
 return {rounding,ranks,spheres,vectors,distinctOrderedTriples:triples};
}
console.log(verify());
```

RESUME HERE: reconstruct topsFrame from topsBase imports, HostTops Bernoulli selection and its simultaneous Shares bound, then native family formation hEx / classSel / designChoices. The rank and thick-sphere elementary arguments are now closed conditionally on the specified frame and growth hypotheses; do not rederive them. Add to proof_editor manuscript and update numbered open ledger.


---

## Appendix 21: math/2026-11-24_bernoulli_top_set_selection.md
Working-repo blob b7508c9524b1ff26d46dbdbe29f279783c5b4a4b.

# Bernoulli top-set selection and weighted coset balance
Status: source-matched human derivation of the selection and asymptotic probability budget. Some local marked-pattern and tail lemmas remain cited source obligations, not independently rederived here. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.

Sources relative to src/Development/AutomorphicArithmetic/ThickFrames/:
select.lean 32751767563d67d48acb0d4ff4e2e256d03b42e3; SharesOfCounts.lean 113e4cdc1f57fb1a746d8c0a0c12471ad9864dc2; topsGroup.lean 84d05b484bb41e3c6549da74fb667d83414e2ebd; topsFrame.lean 43fb28cdfebc62dbe0904c834116c39bd43961b3; orbitSum.lean e63add475a7d69b5a9380a730e7a7115380d42b8; orbitTerms.lean 065bd0ae97e6d4da20d104d7cfacf4cab3b8aac7; NotGoodLe.lean e830326694c79556247a5f7414b838ea42cede53; MarkedLowBounds.lean 52328d6049bab8ecb3e348ad64bca53687be1e20; TilesLe.lean 83d94cf2d4488f8864b5a2468874254460aebe04; TailLe.lean 61233648e6fb040b670e08ce9dfb097e0b3bb8f3.

## 1. One probabilistic witness, not separate incompatible selections
Let A be a finite set, N=|A|, partitioned by cl:A->kappa. Independent Bernoulli variables X_a have probabilities p_a in [0,delta] subset [0,1]. The random subset T={a:X_a=1} has probability w(T)=prod_{a in T}p_a prod_{a not in T}(1-p_a); total probability 1. For coset c let Y_c=sum_{cl(a)=c}(X_a-p_a). Independence and E X_a=p_a give E Y_c=0 and E Y_c^2=sum_{cl(a)=c}p_a(1-p_a). Therefore
 E sum_c Y_c^2<=delta*N<=D^2/2,
assuming D>0 and D^2>=2delta*N. This is the elementary content of sel_moment and select; no powerset enumeration is needed to evaluate these moments. In particular the variance budget can be evaluated in O(N) arithmetic operations by accumulating one sum per class.

Let I be the finite prime/index set, omega_i>=0 and BAD(i,t,T) any predicate. Assume P(t in T AND BAD(i,t,T))<=beta*delta for every i,t, beta>=0. The weighted bad count B(T)=sum_i omega_i sum_t 1_{t in T AND BAD} is nonnegative, with E B<=M=beta*delta*N*sum_i omega_i by linearity; no independence of bad events assumed.
If M>0, consider F(T)=sum Y_c^2/D^2+B(T)/(4M). Its mean <=1/2+1/4=3/4 (source uses <=1). A positive-probability subset has F<=mean: otherwise every positive-weight value would exceed the average. Consequently for this SAME T, |Y_c|<=D for every c and B(T)<=4M. If M=0 then nonnegative B vanishes on every positive-weight subset; select one with sum Y_c^2<=D^2/2. This preserves the source's zero-budget branch without dividing by zero.
A useful alternative implementation is the standard conditional-expectation method: assign bits one at a time, choose a positive-probability branch whose conditional expected F does not increase. The class-variance component can be updated in constant time per assigned bit via per-class conditional mean and remaining variance. HOWEVER the arbitrary BAD conditional expectations may be computationally hard; no general O(N) deterministic witness algorithm is claimed. The source uses finite existence, not a polynomial-time construction. Do not replace the existential proof with an unverified efficient search.

## 2. Biased cosets and the exact density
For finite abelian A and subgroup A0, write o=[A:A0]>=1, n0=|A0|>=1, N=o*n0. Set p_a=delta on A0 and 3delta/4 elsewhere. Expected coset counts are mu_c=w_c*delta*n0/4, w_0=4, other w_c=3. Sum mu=(3o+1)delta*n0/4. Let C_c=|T intersect coset c|, M_T=|T|. From |C_c-mu_c|<=D, obtain |M_T-mu|<=oD. If 4oD<=eta*delta*n0 and eta<=1, positivity implies eta>=0 and oD<=delta*n0/4. Hence 3delta*N/4<=M_T<=2delta*N (in fact upper <=delta*N+delta*n0/4), giving required density.
Then
 |C_c-w_c M_T/(3o+1)| <= D+w_c oD/(3o+1) <=3D.
Also 3D<=3o^2 D <= (3o/4)*eta*delta*n0 <= eta*M_T. Thus the required Shares bound holds for every coset with normalized weights 4/(3o+1),3/(3o+1). This is exactly shares_of_counts. It is not a fitted ratio or a URT physical parameter.

## 3. Why the concentration scale suffices
Set h=2+8eps, delta=x^(-eps/8), eta=x^(-1), D=sqrt(2delta*N). Assume x>=1, eps>0, x^h/2<=N<=Co*x^h, o<=Co. For sufficiently large x, x^eps>=64Co^4. Then delta*N>=x^(2+63eps/8)/2>=x^(2+eps)/2>=32o^4 x^2. Squaring (all positive) yields 4oD<=x^(-1)*delta*N/o=eta*delta*n0. The exact tg_num inequality follows. Since x^(-1)<=x^(-1+eps), the output meets the weaker requested Shares tolerance.

## 4. Actual orbit failure probability
topsGroup obtains the pointwise BAD premise from orbit_sum, not_good_le, orbit_terms. For each orbit direction h_p with additive order n>=x^(eps/4), choose base b=bs(h_p,t) such that t=b+i0*h_p for some index i0 modulo n. The n orbit positions are distinct. Marginalizing independent Bernoulli variables outside this orbit and fixing t in T factors the probability as p_t times the expectation over independent remaining indices with the marked index i0 inserted. This is orbit_sum, exact even for nonconstant probabilities.

Write K=ceil(8(h+2)/eps), r=K+1, u=ceil(1/delta), P=10^(6r+1), M0=ceil((h+3)log(x)*P), G'=goodG'(r,delta,h,x), J=orbitWindowCount(r,delta,h,x)-1=ceil(max(6e G' delta,(h+3)log_2 x)). GoodOrbitIntervalTileCondition is conjunction of CondA, CondTiles, CondIntervals. The exact union bound from not_good_le is
 n*choose(L2,K)*delta^K + n*(1-markedLow(delta,r,u))^M0 + n*binUpper(G',delta,J).
Retain source tail_le, tiles_le and the conditions (M0+1)(6r+1)u<=n. For fixed eps, Lb, Co, u=O(x^(eps/8)), M0=O(log x), so the product is eventually <=x^(eps/4)<=n. K ensures delta^K<=x^(-(h+2)); choose(L2,K)<=max(Lb,1)^K. 
For 0<delta<=1/100, u delta in [1,1+delta], log(1-delta)>=-delta/(1-delta). Thus (1-delta)^u>=exp(-103/100)>3/10, and floor(u/2)*delta>=99/200. The marked probability expression is ((1-delta)^u)^(3r+1) * (floor(u/2)*(3delta/4)*(1-delta)^(u-1))^(3r). Both bases at least 1/10 and at most 1, hence markedLow>=1/P. Removing the one tile that contains forced i0 leaves at least M0 disjoint trials in each cyclic block of M0+1 tiles. Independence gives failure <=(1-markedLow)^M0; union over at most n tile starts gives the second term. Then (1-markedLow)^M0<=exp(-M0/P)<=x^(-(h+3)).
For the third term use source ot_binUpper_le for J>=6e G' delta, giving binUpper<=exp(-J)<=x^(-(h+3)). The exact local marked event formula (marked_ge) and binUpper tail inequality still merit independent source proof review; do not assume arbitrary tile patterns have this probability.
Since n<=Co*x^h, total failure <=Cb*x^(-2), Cb=(|Co|+1)(max(Lb,1)^K+2). This is orbit_terms. Multiplying by p_t<=delta gives pointwise joint bound beta*delta, beta=Cb*x^(-2), required by select.

## 5. Integration to native host
topsGroup now yields one TT satisfying density, Shares, weighted exceptional bound. topsFrame transports through |phi.A|=phi.ord and subgroup index phi.o. topsBase applies actual residue-prime filtering and good-orbit equivalences; topsChoiceH uses PairWin/PairRow, class-zero prime lower bound, rank/host constants, and transports result to HostGood. The separate Behrend thick set T2 from prior chapter is not TT. hostOfFieldOf constructs both and preserves both. No geometric family existence inferred solely from finite group selection.

## Executed exact regression
{
  "selectionCases": 92,
  "subsetEvaluations": 12840,
  "zeroBadBudgetCases": 25,
  "cosetCountCases": 2016
}
Constructed finite Bernoulli tests enumerate support with exact rational weights, verify mean and variance and a simultaneous positive-weight witness, including zero M. Constructed coset counts verify exact rational normalization. These check generic algebra and finite existence, not real large prime orbits or Lean kernel. 
```js
function verify(){
 let cases=0,subsets=0,zeroCases=0,shares=0;
 for(let N=1;N<=9;N++)for(let o=1;o<=N;o++)if(N%o===0)for(let mode=0;mode<4;mode++){
  const p=Array.from({length:N},(_,i)=>i%o===0?4n:3n),den=8n**BigInt(N),W=[1n,3n],sw=4n;
  const mu=Array.from({length:o},(_,c)=>p.reduce((s,v,i)=>s+(i%o===c?v:0n),0n));
  const event=Array.from({length:2},()=>Array(N).fill(0n));let mass=0n,EB=0n,EY=0n,rows=[];
  for(let mask=0;mask<2**N;mask++){
   let w=1n,B=0n;const c=Array(o).fill(0n),bad=[];
   for(let i=0;i<N;i++){const yes=Boolean(mask&(1<<i));w*=yes?p[i]:8n-p[i];if(yes)c[i%o]++;}
   for(let j=0;j<2;j++)for(let i=0;i<N;i++)if((mask&(1<<i))&&mode!==0&&(mode===1||((mask+3*i+j)% (mode+2)===0))){B+=W[j];bad.push([j,i]);}
   for(const [j,i] of bad)event[j][i]+=w;
   const Y=c.map((v,i)=>8n*v-mu[i]),Y2=Y.reduce((s,v)=>s+v*v,0n);
   mass+=w;EB+=w*B;EY+=w*Y2;rows.push({w,B,Y,Y2});subsets++;
  }
  if(mass!==den||EY>32n*BigInt(N)*den)throw Error("moment");
  const e=event.flat().reduce((a,b)=>a>b?a:b,0n),mNum=e*BigInt(N)*sw;
  if(EB>mNum)throw Error("bad expectation");
  const Dden=64n*BigInt(N);
  let found=false;
  for(const r of rows)if(r.w>0n){
    const goodEnergy=mNum===0n?r.Y2<=Dden:r.Y2*4n*mNum+r.B*den*Dden<=Dden*4n*mNum;
    if(goodEnergy){if(r.Y.some(v=>v*v>Dden)||r.B*den>4n*mNum)throw Error("selected bounds");found=true;break;}
  }
  if(!found)throw Error("selection");cases++;if(mNum===0n)zeroCases++;
 }
 for(let o=1n;o<=7n;o++)for(const n0 of [64n,128n,256n,512n])for(let D=0n;4n*o*D*8n<=n0;D++){
  // delta=1/2, eta=1/4, integer exact coset means n0/2,3n0/8.
  for(let mask=0;mask<2**Number(o);mask++){
   const counts=Array.from({length:Number(o)},(_,i)=>(i===0?n0/2n:3n*n0/8n)+((mask&(1<<i))?D:-D)),T=counts.reduce((a,b)=>a+b,0n),N=o*n0;
   if(4n*T<N||T>N)throw Error("density");
   for(let i=0;i<counts.length;i++){const w=i===0?4n:3n,z=(3n*o+1n)*counts[i]-w*T,abs=z<0n?-z:z;if(4n*abs>(3n*o+1n)*T)throw Error("shares")}
   shares++;
  }
 }
 return {selectionCases:cases,subsetEvaluations:subsets,zeroBadBudgetCases:zeroCases,cosetCountCases:shares};
}
console.log(verify());
```
RESUME HERE: prioritize actual classSel / DesignChoices / FamP formation and the 21 non-rank SizesAt conditions. For independent audit of probability leaves, follow MarkedGe and ot_binUpper_le. Integrate this chapter rather than redo finite group selection.


---

## Appendix 22: math/2026-11-24_harmonic_scale_size_algebra.md
Working-repo blob e05d76f4592db6df5f08e87562045448e4de2ccc.

# URT harmonic-scale algebra reader — native size obligations
Status: exact conditional algebra, source-matched, no change to proof premises. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005; src/Formalism/SharpRestriction/ElevenLe.lean blob 75f2ab1404c69a5d1330671d96d8f6cd35e74e52. Prior native rank and normalized-size chapters supply the exact input windows.

## 1. Harmonic coordinate and linear reader
Let phi=(1+sqrt(5))/2, s=log(x)/log(phi), x=phi^s. Then c*x^(a+b*eps) = c*phi^(s*(a+b*eps)). Use the fixed rational exponent lattice (a,b)=(A,B)/400 because the native tolerances have denominator 400. Multiplication adds exponent pairs; division subtracts them only for positive denominators and appropriately directed bounds; a power scales the pair. A positive sum can be normalized by a common dominating exponent, leaving exact residuals. For a collection of terms with positive coefficients, accumulate the componentwise maximal exponent and coefficient sum in one pass. Alternatively use exact affine endpoint comparison on eps in (0,1/52). If a gap g=(A+B eps)/400 has nonnegative values at both endpoints and is not identically zero, then g>0 in the interior. At fixed eps any fixed coefficient can eventually be absorbed by x^g. This proof uses monotonicity, not floating harmonic phase as evidence. Negative/cancelling sums and unknown signs need separate verified rules. URT phi scaling is a coordinate choice; it does not supply new arithmetic premises or prove acceleration beyond standard log/tropical algebra. Fixed-dimensional exponent comparisons and graph traversals O(V+E) operations, plus big-integer bit cost and exact coefficient arithmetic. Human prose translation is not thereby guaranteed linear.

## 2. Actual native proof algebra
With tau=eps/100, delta1=x^(-eps/8), L=x^eps, n,m,k satisfy previous native windows, f=2n, r=k+m-1. SizeLa provides LaG<=x^(eps+tau). From the true source SizeKRel's 14 conjuncts, the following follow eventually from these simpler bounds (at fixed eps and family constants):
1. x^tau m^5 f L x^eps <= 2*x^(9/2+3903eps/400) <= k, since k>=x^(9/2+3996eps/400), gap 93eps/400.
2. 8 CGam m^5 f L <= k by gap 497eps/400 and absorption of 16 max(CGam,0), provided CGam is fixed/bounded uniformly in the family; negative case trivial. This is an explicitly conditional statement, not a proof of that uniformity.
5. m^2 L <= x^(1+358eps/400) <= k.
6. m sqrt(x) log x <= x^(1+379eps/400) <= k using eventual log x<=x^eps.
7. x^tau m^6 L <= x^(3+278eps/400) <= k log k, since log k>=1.
8. Under SizeQD and QS<=C n with fixed C>=1, log rdE<=log(Cn)+x^(21eps/100)<=2x^eps eventually. Then x^tau m^3 L log rdE<=2*x^(3/2+741eps/400) <= k(log k)^2. The QS bound must come from HostConst, not silently assumed for arbitrary FamP.
10. log f<=4 log x for x>=2 and eps<1/52, while m^2 L>=x^(1+342eps/400)>=x. Since 16(log x)^2<=x eventually, (log f)^2<=m^2 L.
11. log log b=eps log x (b=exp(x^eps)); x^tau L log log b<=x^(804eps/400)<=n<=r f log r for sufficiently large x. This preserves the logarithm instead of setting it to a constant.
12. x^tau L<=x^(404eps/400)<=n<=f log k eventually.
13. f=2n<=m^2 n because m>=2.
14. f<=r^2 because the native Ranks conditions give f<=k, r>=k, f>=1.
The remaining SizeKRel conjuncts 3,4,9 need the rankBudget and rS definitions/estimates, and must be kept OPEN. The above eleven implications are conditional on native size, host and uniformity premises. No independent claim of family existence.

## 3. A separate size condition is automatic
SizeRho requires
 4*szNst*x^eps*LaG/k + x^tau*log(x)*LaG/k <= x^(-2),
where szNst=2n delta1.
First term <=8*x^(-5/2-38eps/400).
Second term <=x^(-9/2-3188eps/400), using log(x)<=x^eps.
Thus the sum <=9*x^(-5/2)<=x^(-2) for x>=81 and the eventual log condition. This gives the actual source SizeRho from native SizeN,K,La and scale identities. It is not an additional numerical assumption.

## 4. Exact residual of the normalized error envelope
Earlier upper terms after division by Q are 2*x^(1/2+29eps/400), 2, 4*x^(1/2+429eps/400), 2*x^(1/2-1538eps/400). Set z=x^(-eps/400)=phi^(-s*eps/400). Factor the common scale:
 B/Q <= x^(1/2+429eps/400) * [4+2*z^400+2*x^(-1/2)*z^429+2*z^1967].
All residuals are positive and bounded by 1 before their coefficients. Hence the bracket <=10, giving the original budget; no subordinate term discarded. The normalized residual exposes which terms control the estimate and which can be made small. This is exact harmonic factoring of an upper bound, not equality with original B/Q.

## Executed certificate
{
  "lattice": 400,
  "checks": [
    {
      "id": "SizeKRel.1",
      "left": [
        1800,
        3903
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        0,
        93
      ],
      "coeff": "2",
      "assumption": "f=2n"
    },
    {
      "id": "SizeKRel.2",
      "left": [
        1800,
        3499
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        0,
        497
      ],
      "coeff": "16*max(CGam,0)",
      "assumption": "CGam fixed/bounded for given family; negative case immediate"
    },
    {
      "id": "SizeKRel.5",
      "left": [
        400,
        358
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        1400,
        3638
      ],
      "coeff": "1",
      "assumption": "positive ranks"
    },
    {
      "id": "SizeKRel.6",
      "left": [
        400,
        379
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        1400,
        3617
      ],
      "coeff": "1",
      "assumption": "log x<=x^eps eventually"
    },
    {
      "id": "SizeKRel.7",
      "left": [
        1200,
        278
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        600,
        3718
      ],
      "coeff": "1",
      "assumption": "log k>=1"
    },
    {
      "id": "SizeKRel.8",
      "left": [
        600,
        741
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        1200,
        3255
      ],
      "coeff": "2",
      "assumption": "SizeQD, QS<=fixed C*n; log rdE<=2*x^eps eventually; log k>=1"
    },
    {
      "id": "SizeKRel.11",
      "left": [
        0,
        804
      ],
      "right": [
        800,
        3196
      ],
      "gap": [
        800,
        2392
      ],
      "coeff": "1",
      "assumption": "b=exp(x^eps), eps log x<=x^eps eventually, r>=1 and log r>=1, f>=n"
    },
    {
      "id": "SizeKRel.12",
      "left": [
        0,
        404
      ],
      "right": [
        800,
        3196
      ],
      "gap": [
        800,
        2792
      ],
      "coeff": "1",
      "assumption": "f>=n, log k>=1"
    }
  ],
  "rho": {
    "terms": [
      {
        "c": 8,
        "e": [
          -1000,
          -38
        ]
      },
      {
        "c": 1,
        "e": [
          -1800,
          -3188
        ]
      }
    ],
    "envelope": {
      "c": 9,
      "e": [
        -1000,
        -38
      ]
    },
    "absorption": "x>=81 implies 9*x^(-5/2)<=x^(-2)"
  },
  "normalized": {
    "terms": [
      {
        "c": 2,
        "e": [
          200,
          29
        ]
      },
      {
        "c": 2,
        "e": [
          0,
          0
        ]
      },
      {
        "c": 4,
        "e": [
          200,
          429
        ]
      },
      {
        "c": 2,
        "e": [
          200,
          -1538
        ]
      }
    ],
    "peak": [
      200,
      429
    ],
    "residual": [
      {
        "c": 2,
        "e": [
          0,
          -400
        ]
      },
      {
        "c": 2,
        "e": [
          -200,
          -429
        ]
      },
      {
        "c": 4,
        "e": [
          0,
          0
        ]
      },
      {
        "c": 2,
        "e": [
          0,
          -1967
        ]
      }
    ]
  },
  "negativeControls": 4,
  "exactGridReplays": 10448
}
The grid replay tests affine margins, not native families. Analytic endpoint argument proves all margins for the entire eps interval. No numerical golden-ratio evaluation is needed.

RESUME HERE: use this conditional implication list in the manuscript and reduce the remaining native SizeKRel obligations 3,4,9 to exact rankBudget/rS. Then propagate through the other SizesAt fields and audit uniformity. Prioritize actual proof joins. Do not claim URT-specific speed improvement until measured against a conventional optimized algebra reader.



---

## Appendix 23: math/2026-11-24_harmonic_rank_closure_and_host_sizes.md
Working-repo blob 8fca5c89a0a40aa7f5d6ffdb1e0e2eefad0ee0df.

# Harmonic scale closure of native rank inequalities and host-size consequences
Status: SOURCE-MATCHED conditional mathematical reconstruction, not full FamP existence. Pinned source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Use jointly with math/2026-11-24_harmonic_scale_size_algebra.md, native_rank_envelope, rank_and_thick_sphere_construction and bernoulli_top_set_selection. This closes the three remaining SizeKRel inequalities under the retained native hypotheses; it does not close the whole 24-field SizesAt record.

## 1. Exact native definitions and all remaining rank inequalities
Sources: src/Formalism/LocalRingCardinality/DataArith.lean (851c12aac84bff1368763793613732f94dd15ff6) rankBudget=n*x^(-eps); Params.lean (09d1aeec3049821ed6d190c7970cdca9ec5b34cf) rS=m/2-1 (natural division/subtraction), n=ord, f=2n, r=k+m-1. ElevenLe.lean (75f2ab1404c69a5d1330671d96d8f6cd35e74e52) SizeKRel. Assume 0<eps<1/52, x>1, native SizeN/M/K. The preceding harmonic chapter handles 11 of 14 clauses (including conditional uniform bound for CGam and host QS). For the three outstanding clauses:
3. k<=x^(9/2+1001eps/100), while sqrt(x)*n*rankBudget>=x^(9/2+1498eps/100). Difference 497eps/100>0. This proves k<=sqrt(x)*n*rankBudget.
4. k/m<=x^(4+4033eps/400), rankBudget^2>=x^(4+5592eps/400). Difference 1559eps/400>0. Take square roots on both nonnegative sides to get sqrt(k/m)<=rankBudget.
9. Native m grows at least as x^(1/3), since 1/2-29eps/400>1/3 throughout the interval. Eventually m>=4. As m is even, rS=m/2-1>=m/4; sqrt(rS)>=x^(1/6)/2. From f=2n and upper n, log f<=4 log x eventually. Since log x=o(x^(1/6)), log f<=sqrt(rS) eventually. No assumption that rS positive at the original minimum m=2; the eventual threshold is essential.
Thus all 14 SizeKRel clauses are now reduced to elementary inequalities under native SizeN/M/K, the relevant SizeQD upper bounds, fixed HostConst (QS<=C*n), uniformly bounded CGam and sufficiently large scale. Keep these exact input premises in the manuscript; no independent derivation of uniform CGam yet.

## 2. A uniform polynomial envelope for t
Source RankVal and nWv, TOv: src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean (688162690ac7cbfe620037fcee8e451e7116f45b).
Let L=x^eps and T=ceil(x^377). RankVal gives t=8fr+4+T*8ceil(10*r*(f+f^2*(k-1)^3*L^2/m)/8)-r. For x>=1 and sufficiently large x, r<=2k, f>=1, m<=f, k>=2, L>=1. Then f<=f^2*k^3*L^2/m and the full formula is bounded by a fixed constant times x^377*k^4*n^2*x^(2eps)/m. For instance use T<=2x^377, ceil(a)<=a+1, and absorb additive terms by the positive leading expression, which tends to infinity. Using native size windows the exponent is
 377 + 4*(9/2+1001eps/100) + 2*(2+801eps/100) + 2eps - (1/2-29eps/400)
 = 398.5 + (23253/400)eps.
For eps<1/52 this is <400, since 52*600-23253=7947>0 in units 1/400. Thus t<=x^400 eventually. This is an independent simplified polynomial envelope, not a claim that the source chooses Ct=400. SizeT is immediate from SizeData2.t_win at the actual Ct, since x^Ct<=x^(Ct+eps/100). Establish the actual t_win witness separately.

## 3. Five further native size categories and splitBound
Exact definitions: ElevenLe.lean as above; scale identities in src/Formalism/LocalRingCardinality/DataParams₂.lean (50914500995df91e2646d91a6c5c99a7e603a51b); HostVal, HostConst, PairWin and PairRow in PairRowIffQdRows.lean. Assume the same native rank and actual HostVal witness, fixed C8, t polynomial as above, 1<=J<=C8, and choose a common sufficiently large threshold. The argument is uniform over hosts satisfying those fixed bounds, not a sequence of different thresholds depending on the host.

SizeTT: HostVal supplies delta1*n/2<=|TT|<=2delta1*n. When x^(eps/100)>=2 this gives the weaker SizeTT lower bound x^(-eps/100)*delta1*n and its exact upper bound. ChosenTT remains the stronger condition; do not replace it by SizeTT.

SizeLw: HostVal sets Lw=10ceil(405 log x)+2ceil(30/eps)+22. It is O(log x) for fixed eps, hence eventually <=(log x)^2.

SizeG: HostVal gives (kb)^8<=g_i<=2(kb)^8. In particular every ratio g_i/g_j<=2. With b=exp(x^eps), log g_i<=log 2+8 log k+8x^eps. Divide by x^eps: the expression is bounded eventually and x^(eps/100) grows without bound. Thus log g_i<=x^(eps/100)*L.

SizePde: HostVal bounds pde,pde' by (QS*q*d)^C8. PairRow and PairWin give log(QS*q*d)<=2Y^(eps/5)(log Y)^2<=2x^(eps/5)(log x)^2, since 1<=Y<=x. Hence log pde and log pde' are <=2C8*x^(eps/5)(log x)^2<=x^eps eventually.

SizeCond: with szCond=QS*q*d, use previous log bound and t<=x^400. Then
 log(szCond^36*t^150)<=72*x^(eps/5)(log x)^2+60000 log x=o(x^eps).
Eventually <=x^eps/2=log sqrt(b), hence SizeCond.

SplitBound: HostVal provides floor(x^(ez/5))<=splitBound with ez=eps/J>=eps/C8>0; thus eventually splitBound>=11. This last clause is a separate 24th SizesAt field.

## 4. Further independent scale identity — SizeW
Scale.a=x*b, Scale.X'=exp(x^(eps/3)), Scale.b'=a/X', Scale.w''=b'/(x*n). Thus w''=exp(x^eps-x^(eps/3))/n. The desired sqrt(b)<=w'' is equivalent to log n+x^(eps/3)<=x^eps/2. The left is o(x^eps) under native SizeN, so SizeW holds eventually. No approximate golden-ratio equality used.

## 5. Current coverage and exact residual
At the category level, the derived or directly supplied eventual conditions are SizeN, SizeM, SizeK (from RankVal with factor-two absorption), SizeKRel (conditional additional inputs), SizeT (conditional on actual t_win), SizeCond, SizeTT, SizeRho (conditional SizeLa), SizeLw, SizeW, SizeG, SizePde, splitBound. That is 13 of 24 fields as conditional reductions, NOT 13 independently proved FamP fields or proof completion percentage.
Remaining category obligations: SizeQD (all eight clauses, not just used upper bounds), SizeLa, SizeBot, SizeDe2, SizeEta, SizeNodes, SizeLstar, SizeDel, SizeBm, SizeXpp, SizeWords. The actual host/parameter/family producers, uniformity, same-index joins and independent source audit remain critical. Concentrate on these instead of redoing elementary rank arithmetic.
Further mathematical route: use super-polynomial separation of b, b', w'' and finite-rank/node choices to reduce SizeEta/Nodes/Lstar/Del jointly; locate exact etaSz, Sc and Del witnesses first. Keep source definitions, exact direction of each bound, and constant dependencies.

## 6. Executed exact checks
Using rational exponent units 1/400: KRel3 gap (0,1988); squared KRel4 gap (0,1559); 3*m exponent minus 1 is (200,-87), giving m>=x^(1/3); t target minus computed exponent (600,-23253). All gaps strictly positive for 0<eps<1/52 by endpoint comparison; executed 11,552 exact integer grid comparisons, zero failures. These certify the arithmetic comparison, not actual host geometry.

## 7. Integration approach
Use URT harmonic coordinate x=phi^s for shared scale factoring; exponent vector arithmetic on fixed-dimensional positive terms, endpoint gap comparisons, explicit residuals and exact premises. Use memoized typed DAG, SCC condensation, linear readiness counts and incremental invalidation for dependency analysis. Preserve all proof obligations, not just significant harmonic terms. For each positive algebra island, emit one reusable mathematical lemma and reference it from all consuming branches; do not repeatedly expand Lean tactic proof. No unique URT speed advantage claimed; no extrapolation to full proof completion. Integrate with the existing 15 lanes and single manuscript spine. Continue source-level proofs while full archive processing is pending.



---

## Appendix 24: math/2026-11-24_joint_exponential_size_closure.md
Working-repo blob 8f6ca96bce8aa4229b9b7683e01ed71715623416.

# Joint exponential-scale reconstruction of six native size fields
Status: source-matched conditional mathematical derivations. Not proof of actual complete family existence or independent Lean kernel verification. Pin leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005.

Sources:
- src/Formalism/SharpRestriction/ElevenLe.lean (75f2ab1404c69a5d1330671d96d8f6cd35e74e52), exact SizeBot, SizeDe2, SizeEta (9 clauses), SizeNodes (7), SizeLstar (2), SizeDel (8).
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean (688162690ac7cbfe620037fcee8e451e7116f45b), RankVal, HostVal, HCVal, Val, SzRow, h0v, Delv.
- src/Formalism/LocalRingCardinality/DataParams₂.lean (50914500995df91e2646d91a6c5c99a7e603a51b), Scale, Sc_eq, density identity, bT_ge.
- src/Formalism/LocalRingCardinality/DataHost.lean (7e9af8ab364965c62be250ae93974098141598c0), v=rdE/2.
- Previous native rank, thick sphere, Bernoulli selection, harmonic rank closure chapters.

## 1. Exact witnesses, not invented scales
For fixed eps in (0,1/52) and fixed C satisfying Std, Val C cD ch L supplies Del=ceil(x^cD), etaSz=m*h0v=2m ceil(x^ch), LaG=G.La C.GK s, bT upper bound, CGam=C.CGam, Ct=C.Ct. SizeData2 supplies Sc=4k Del, de2=|T2|/n and de2>0. HostVal supplies |T2|>=n*x^-eps. Thus SizeBot and SizeDe2 are direct consequences, with szNst=2n delta1. In SzRow the quantifier order is fix eps,C, choose c1, for EVERY cD>=c1 choose c2, for EVERY ch>=c2 choose x0, then every Val witness beyond x0. We preserve this order, and do not claim that such a witness exists.

Assume native rank envelopes already derived, HostVal, SizeLa (only LaG>=x^eps used for SizeDel), and SizeQD upper bound on rdE together with fixed HostConst. All thresholds uniform over the indicated witnesses at fixed eps,C,cD,ch.
For sufficiently large x use n<=x^3, m<=x, k,r<=x^5, f<=x^3, t<=x^400 from previous rank calculation, N=k+m(t+1)<=x^402; r<=x^5 follows from r=k+m-1 and k exponent strictly below 5. L=x^eps<=x, x^tau<=x. Choose cD>=414 and ch>=max(1210,cD+20). Then Del=O(x^cD), Sc=O(x^(cD+5)), etaSz=O(x^(ch+1)), and etaSz/m>=2x^ch. These are a sufficient alternative envelope, not a claim that source chooses these same constants.

## 2. One exact scale separation lemma
Write B=exp(x^eps), E=exp(x^(eps/3)); b=B, b'=xB/E, w''=B/(nE), X''=xnE. For every fixed real a, x^a/E ->0 and x^a E/B ->0, since a log x - x^(eps/3) -> -infty and a log x+x^(eps/3)-x^eps -> -infty. Also log of any uniformly polynomially bounded positive quantity is O(log x) from above. Thus each fixed polynomial is negligible compared with b', w'', B, and each fixed polynomial times b'/B tends to zero. This is exact harmonic/log-scale separation, not a floating numerical approximation. Products/quotients of positive monomials can use one-pass exponent vectors; sums use fixed-degree envelopes. No arbitrary symbolic expression simplification asserted O(N).

## 3. SizeEta: all nine clauses
Let eta=etaSz. First t<=eta follows from the lower eta bound and ch>400. Second eta*t^3*f*k^3 is polynomially bounded and therefore <=B eventually. Third log eta<=x^(eps/4) eventually. Clauses 4,5,6,7,8 compare respectively t eta, m(t+1)eta, m(Sc+eta), N eta, eta^2 r L against w''/x, w'', w'' L, de2*m*w'', de2*m*(w'')^2. In every case the left side has a fixed polynomial upper bound and the right side dominates every polynomial, using m>=2, de2>=x^-eps and L>=1. Hence all hold eventually.
Clause 9: szlA=k*x^eps/(m de2) is positive and polynomially bounded. Divide by de2*m*B. Then r*(b'+Sc)*log(x)*szlA/(de2*m*B) is bounded by a fixed polynomial times (x/E + Sc/B), tending to zero. This proves the ninth exact inequality. No need for a new eta formula.

## 4. SizeNodes and SizeLstar from the same common denominator
Set
 P=n*t^2*(N+t)*L^2 + k*n^2*(Sc+t+L).
Then szlStar=m B/P, so B/szlStar=P/m. P>0 and P=O(x^p) with p=max(1207,cD+16,411); p<ch. All seven SizeNodes left-hand sides have polynomial envelopes of degrees at most
 max(p,400), 406, 111, 1206, 11, 1203, 412
 respectively (the sixth comes from 3*max(r degree=5,m+t degree=401)). Each degree is strictly below ch. Hence each is <=eta/m eventually. The exact coefficients 12,2,8,4,6 etc. are fixed and absorbed by strict margins, not discarded.
For SizeLstar, szlStar>=B/(C_p x^p) for a fixed C_p>0. Divide each requested left side by szlStar. Polynomial terms vanish, while b'/szlStar=(x/E)*(P/m) also vanishes. The two inequalities are therefore strict eventually.

## 5. SizeDel: all eight clauses
The first two follow from Del>=x^cD with cD>=414, since N*m^10<=x^412 and x^tau*m*N<=x^404. Third log Del<=x^(eps/4)/2 eventually. Fourth and fifth compare k Sc and x^tau*m*k*Del (polynomial) against w'' (dominates all polynomials). Sixth and seventh compare 4Sc and 4*x^tau*k^2*Del against LaG*b'/k and LaG*b'; both RHS dominate all polynomials since LaG>=x^eps.
Last: v=rdE/2>0. From the earlier SizeQD/HostConst estimate log rdE<=2x^eps eventually, log v<=2x^eps. If log v is negative the inequality is immediate. Otherwise x^tau*m log v<=2x^(1+eps+tau) <= k eventually, since k>=x^(9/2+999eps/100). This uses the retained rdE bound, not a new arithmetic assumption.

## 6. Coverage bookkeeping and remaining exact work
Previous chapter conditionally reduced 13/24 SizesAt categories. The six here (SizeBot, SizeDe2, SizeEta, SizeNodes, SizeLstar, SizeDel) give 19/24 conditional category reductions, not 19 independent geometry proofs. Remaining categories are SizeQD, SizeLa, SizeBm, SizeXpp, SizeWords. In particular SizeQD and SizeLa were INPUTS in previous reductions and must not be counted as established. Actual Val witness, all uniform constants, and assembly into FamP are still substantive obligations.
RESUME HERE: locate exact G.La and GamL definitions, PairRow prime bounds X1/X2 and native rdE estimate, and partition of host places for the HCVal b1 lower bound and SizeXpp. Then reconstruct SizeWords via Val.words and GamL. Seek source theorem that combines all SzRow fields rather than constructing a parallel model. Integrate these chapters with the existing manuscript and keep proof dependencies visible.

## Executed certificate
{
  "checked": 60,
  "cDmin": 414,
  "chMin": "max(1210,cD+20)",
  "degreeEnvelopes": {
    "n": 3,
    "m": 1,
    "k": 5,
    "t": 400,
    "r": 5,
    "f": 3,
    "N": 402,
    "L": 1
  },
  "nativeSourceFields": [
    "SizeEta",
    "SizeNodes",
    "SizeLstar",
    "SizeDel",
    "SizeBot",
    "SizeDe2"
  ]
}
The certificate checks integer degree margins across six example choices of cD. The symbolic max comparison establishes the whole cD,ch range; no test of native arithmetic-geometric existence. No local Lean check.



---

## Appendix 25: math/2026-11-24_complete_conditional_size_algebra.md
Working-repo blob 506ef3fc1a88276a6dcdbf965ea84c72eac3b9a0.

# Completion of the conditional 24-field size algebra and exact SzRow join
Status: SOURCE-MATCHED conditional mathematical reconstruction. Not full RH proof; not proof of existence of Val or FamP, not local Lean verification. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005. This chapter resolves the five remaining categories of the earlier 19/24 conditional size reduction.

## 1. Remaining SizeQD
Source GlobalInterpolation/SzRowCondQdPde.lean e63a21d751f0edc2d9248375c7251641d58e822a and HostBoundsTwoMulRpowLogSqLe.lean 510fc1b8bad0ce27e6d2665c1f00e389d7d9d266 (paths under src/Development/AbelianVarietyTheory/Proofs/).
Retain native hostBounds theorem, for fixed eps,C8>=1, all sufficiently large x and RankVal/HostVal witnesses: log q in [x^(ez/5)/2,x^(eps/5)]; log d in [x^(ez/5)*(log x/J)^2/2,x^(eps/5)*(log x)^2]; ez=eps/J, 1<=J<=C8. Also 1<=rdE<=QS*sqrt(q*d)/2 and log rdE<=x^eps. The discriminant bound is the source host theorem, not a consequence of rank arithmetic alone. Val.dlog gives |L'/L(1)| in the exact source notation |L.logDerivativeAtOne|<=x^eps (do not identify with a particular character L-function without source check).
Eventually log x/J>=1 uniformly, x^(ez/100)>=2 because ez>=eps/C8. Hence both log q and log d >= x^(ez/5-ez/100). Since 1/5-1/100=19/100>1/6, the required additional lower bound log q>=x^(ez/6) follows. Both upper bounds <=x^(eps/5+eps/100) by (log x)^2=o(x^(eps/100)). Together with dlog and rdE bounds these are all eight SizeQD clauses. This establishes the implication from hostBounds and Val, not independent hostBounds proof. The source uses actual RankVal/HostVal and an eventual threshold.

## 2. SizeLa
Source GoodTopCountLeConstMulLog.lean d52188dc16121d35df22f9d3a672078e91cf9b3c, topCount_and_lambda_bounds; SzRowLaRhoBot.lean 45a03cf45fc962bac8175941f803f0ab297fabb3.
For fixed eps>0 let h=2+8eps, r=ceil(8(h+2)/eps)+1, delta=x^(-eps/8), u=ceil(1/delta), M0=ceil((h+3)log(x)*10^(6r+1)), G'=(M0+5)(6r+1)u, N1=1+ceil(max(6e G' delta,(h+3)log_2 x)). These are the source definitions. Since delta<=1, u*delta<=2; M0+5=O(log x) for fixed eps; therefore G'*delta=O(log x), N1=O(log x), N1>=1. The native formula is G.La K s=K.La*N1^2*log(a), a=x*exp(x^eps). Std gives K.La>=1 for K=C.GK. Val.La_eq supplies LaG=G.La. Since log(a)=log x+x^eps, we have
 x^eps<=LaG<=2 K.La CN^2 (log x)^2*x^eps<=x^(eps+eps/100)
eventually for fixed constants. This proves SizeLa. It also discharges the scale input to SizeRho and SizeDel from preceding chapters. No actual selection of C asserted.

## 3. SizeBm and SizeXpp
Source SzRowSizeWSizeBmSizeXpp.lean 097e0049a445a49985ce43bdfb59ddf7d373211b; native Val, HCVal, SizeData2 place windows. Use B=b, E=exp(x^(eps/3)), b'=xB/E, w''=B/(nE), X''=xB/w''. For fixed ch the prior scale-separation lemma proves eventually etaSz+1<=w''<=b'<=B, sqrt(B)<=w'', x>=2. Val.bT_le and SizeLa give bT+b'/x<=B, since bT<=b'*(1+2n delta x^eps LaG/k) and every fixed polynomial times b'/B tends to zero.
Every actual embedding tau is top, thick or thin: if in topPlaces choose its TT index; otherwise test thickPlaces; the complement is IsThin by source lemma place_top_or_thick_or_thin. HCVal gives b_j=b1+j*h0v, and b1 at top is bT+floor(b'/x), at thick at least ceil(B), at thin exactly ceil(w''). Thus b1>=w''>0 (at top use bT>=b' and nonnegative floor). Since (m-1)*h0v<=m*h0v=etaSz<=w''<=b1, b_last<=2b_first. This is SizeBm.
SizeData2.win_top/thick/thin give every wj for 1<=j<=m in [w'', B+etaSz+1], hence in [w'',2B]. For every pair wj,wj', wj<=2B<=xB=X''*w''<=X''*wj'. This is SizeXpp, with exact allowed indices and no division by a possibly vanishing weight. SizeW already proved. The place partition and native windows remain required actual data; no substitute constructed embedding.

## 4. SizeWords
Source SzRowCardWordsLe.lean c5c09ce7b2edb29899fbaf9ffac0fef6bdc326c7; SzRowSizeGSizeWords.lean 9e96e23293a7e43c2ce9e4277425ab3968848926. Val.words states word cardinality=ceil(3*GamL^2*x^CF), with GamL=exp(CG*m^5*f*x^eps), CG=C.CGam, CF=C.P.CF both>=1 by Std, f=2n. Use RankVal m<=2 sqrt(x*x^-eps/8)<=2sqrt(x), n<=2x^(2+8eps) (the source also uses a weaker bound 2 C8 x^(2+8eps), with rescaling n/C8). Let y=x^(9/2+9eps). Then m^5*(2n)*x^eps<=128 y and k>=y*x^eps. With G=CG (or conservatively CG*C8 as in source), F=CF, log of unrounded word count <= log3+256G y+F log x <=(256G+F+2)y, since y>=1 and log x<=y. For x^eps>=2(256G+F+2)+3, (k-3)/2 >= (256G+F+2)y. Since log2>=1/2 and k>=3, unrounded count<=exp((k-3)log2)=2^(k-3). RHS natural integer, so ceil preserves bound. This is SizeWords. No word enumeration. This reduction is independent of the polynomial-only size envelope and uses logarithmic comparison of exponential cardinalities.

## 5. Exact source assembly, now identified
Source SzRowElevenLeSplitBound.lean 6d646554a3c43556eb9853f3d2363e37510c2181, theorem szRow_sizesAt. It joins exactly eleven blocks via SzRow.and and reorders the conjuncts by SzRow.imp:
- rankSizes: N,M,K,T,TT,De2,Lw (7)
- KRel (1)
- Cond,QD,Pde (3)
- La,Rho,Bot (3)
- Eta (1)
- Nodes (1)
- Lstar (1)
- Del (1)
- W,Bm,Xpp (3)
- G,Words (2)
- eleven_le_splitBound (1)
Total 24, exactly the order-independent inventory in ElevenLe.lean. Prior notes gave 19 conditional categories; all five missing are now reduced, with all named input assumptions retained. This is a conditional translation of the size-bound assembly, not 24 independently proven family existence obligations.

SzRowAndImp.lean ca633b5e23f18e773bffbad6293cda846711bea7 proves the general reusable join: fix eps,C satisfying Std. For each block choose c1. Set common c1=max_i c1_i. For ANY cD>=c1, select each c2_i(cD); take common c2=max_i. For ANY ch>=c2, select thresholds x0_i(cD,ch); take x0=max_i. For ANY D,L with same eps, x>=x0 and Val C cD ch L, each block applies to precisely the same D,L witness; hence all conjuncts. Three linear passes over the blocks (not over all possible parameter values); no illegal exchange of exists and forall, no replacement of witness dependence by fixed independent constants. This is how linear reduction and harmonic-scale grouping combine. It does not reduce substantive Val construction to O(N).
Actual explicitConstants_parameterConditions_large in ExplicitConstantsParameterConditionsLarge.lean 8bb3bd4a9a5343eaeaef138a1dccf57016010f0a separately joins 21 blocks to construct ParameterChoice' with parConsts P=C.PK and P.CnW=C.P.CnW, conditional on Std,Val and HostArith. It is NOT identical to SizesAt: its other window/gap/parity/parameter obligations must be preserved. Next frontier is the actual family constructor supplying Val, HostArith, parameter choices, and coherent family fields; do not redo size algebra.

## 6. Executed exact regression
{
  "weightRatioChecks": 7680,
  "wordLogEnvelopeChecks": 2176,
  "thresholdFixtures": 24
}
Constructed abstract integer weights, word logarithmic envelopes and finite threshold-max fixtures, not native geometric samples; symbolic inequalities above establish the general conditional reductions. No new numerical values fitted, no claim URT coordinate gives unique algorithmic speed advantage, no full proof closure.

RESUME HERE: trace actual producers of Val and FamP (not merely record definitions) and exact callers of szRow_sizesAt / explicitConstants_parameterConditions_large. Integrate this whole size chapter in specialists/proof_editor manuscript. Preserve all external theorem producers, geometric witnesses and correct nested quantifiers. Separate from physics.



---

## Appendix 26: specialists/prime_window/RUN2_HOST_PRIME_SIGNAL_IDENTIFICATION.md
Working-repo blob fe24e43059a67e0d35b4142aef63ba3f38fbc69e.

# Prime-window run 2 — identify the prime signal across the arithmetic/analytic boundary

2026-11-24. RESULT: SOURCE-MATCHED / human reconstruction of the exact host-to-Level-to-CharFamily identification and discarded-character error. Conditional on the original host assumptions, not full RH, not Lean kernel execution, no URT advantage claim. This completes the detailed prime-signal adapter missing from run 1. The arithmetic source of the window remains conditional on the geometric/host producers.

## Preflight / avoid duplicate work
Read the three swarm protocols, AGENTS, state, actual runner log/protocol, continuity, state-branch summary (unrelated physical CI PASS 45350120163, 08:02 UTC), prime run 1, peer math window_exponent_and_character_projection and analytic_zero_exclusion, character-box connected witness, theta, Galois, positivity, literature, Landau, kernel run 2, acceleration run 2, integration and editor handoffs. Those chapters already explain the +7 exponent, window selection and conditional Landau argument; do not duplicate. This chapter reconstructs the exact signal equalities and the finite-character error bound with all exceptional weights, not just names. Other peer files were inventoried; no claim of reading every historical note. No physical files changed.

PIN leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream independently observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 (2026-11-24 07:32:48 UTC). GitHub comparison against prior run's 343b1de38bbe4c5c66f1c1c0afd7c34e8645acdf reports four commits, changed README and inbox workflows/scripts only; earlier source revisions remain different from PIN. Keep proofs version-separated.

## Pinned source ledger
C=src/Development/AutomorphicArithmetic/PrimitiveCosets/; D=src/Development/AutomorphicArithmetic/DedekindLFunctions/; F=src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/. Each SHA is the GitHub-reported blob ID at PIN. These are source references, not kernel edges.

| Path | Blob | declarations / lines |
|---|---|---|
| F/Analytic.lean | 599699b5b35f6fb7bf2ab94f5f0c577b14f35ea1 | abelian₂ 9; logDerivativeAtOne 11–12; G 14–16; sumLamChi 18–19; gChi 23–24; Induces 26–27; Induces.unique 42–66; HostRaw.dir/prim/isPrimOf_iff 102–119; kept_iff 127–134; Bounded, KeptInXp 136–138; BoundedCharsPointwise 154–156; ExceptionalCharacterKept 158–159 |
| F/ExplicitFormulaErrorOfHostConditions.lean | ed60b4b997cd4703713660b185b9e43fd95559a1 | Level 8–9; ZeroFreeAbove 24–26; Nt 32; wt 36; Gm 38; EAtH 144–151 |
| C/CoreAtH.lean | 0ba3621036f19146e7e67fa9c0e8a1c38661a097 | chr 14; HostAddCharCompatible 18–20; keptA 24–25; CoreAtH 29–41 |
| C/PrimRead.lean | 3960cf3e7d166f6664405a0d5fcb995924621ffb | prim_read_dir 6–10; prim_read_surj 12–23; prim_read_max 25–33; prim_read_Gz 35–38; prim_read_one 40–46; prim_read 48–97 |
| C/PrimInj.lean | 5720fe0139394b6e9d8c688b36ae2d6f5af10478 | prim_inj 6–27 |
| C/GmAEq.lean | 2f1a763f43d65eea1f6e61018c8b70c02d2dfa03 | character_trivial_on_generator_iff 10–14; gmA_eq_triv 16–59; gmA_eq 61–149 |
| C/SigALe.lean | e9c80e2017ec149ac559bc20c184b9264b9ec0c2 | character_trivial_first_factor 8–16; chr_bounded 18–36; sigA_le 38–60 |
| C/CardPsiA.lean | 4fe4ded735dd1ba55db3a01fc181ad794a2c4a0a | exists_comp_eq 8–24; card_PsiA_index 26–58; card_PsiA 60–63 |
| D/SplitInertia.lean | b5662cda1f3523fc53b547ee582a46bd3cd826d4 | PsiA 26; wtA 30; GmA 34–35; SigA 39–40; CharsA 56–62 |
| C/GChiEq.lean | d7abdea8d4ea78d5f4144e8781ab33dc1760069c | gChi_eq_ramp 6–14; gChi_eq 16–36 |
| C/GzEq.lean | ee8161fad71e4610eef5f9a362ec6fbee4a57e01 | Gz_eq 6–50 |
| C/LevelFamily.lean | d08c25d0cb674297482bec9a235401c14bfb22fa | level_family_wt 9–10; wt_pos 12–17; adm 19–25; sum 27–39; level_family 41–52 |
| C/CoreGm.lean | 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d | core_gm 12–74 |
| C/Imports.lean | 2dc9b4e690951c66ffe443e279fcada259bcce13 | formB 8–19 |
| D/CharFamily.lean | 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 | ramp/Gchi 10–19; CharFamily 24–32; Gm/ZeroFree 36–39 |

## 1. One signal written in three different languages
Use capital H for the host and A for the finite additive group of its frame φ; E0=(Z/2)^2. An additive character is denoted α, a primitive Dirichlet character p (a PChar) is denoted p. The finite level Λ has KEPT containing PChar.one and optional exceptional element psK. Its order field o is a natural number, so c=1/(3o+1)>0. Nt=KEPT minus one; Level.wt(p)=1 if psK=some p, else c. The zeta signal itself has weight one, whether or not the generic Level.wt(one) equals one.

The actual arithmetic host sum is GmA(D,ell,Kp,c,y)=sum_{α in Kp} wtA(c,α) Re GPsi(D,ell,α,y), where wtA=1 if α(0,h)=1 for EVERY h in A, else c. This condition is stronger than triviality on A0, which merely defines PsiA(A0). The Level signal is Gz(y)+sum_{p in Nt} Level.wt(p) Re An.gChi(p.χ,y). The analytic family signal is sum_i a_i Re Deduction.Gchi(χ_i,y). The two equalities below are exact for all real y, not estimates, and not assertions that every arithmetic host is admissible.

## 2. Exact primitive prime-power read (PrimRead:48–97)
Fix φ,H:HostAx φ and ell:AddChar(E0×A,C)→C with HostAddCharCompatible(H.raw,ell). Compatibility (CoreAtH:18–20) means for EVERY α≠0 and EVERY positive modulus N and primitive χ of modulus N with χ(n)=primVal(arith H,α,n) for EVERY natural n≠0, ell(α)=L'(χ,1)/L(χ,1). No unconditional formula for ell is inferred.

Let j(α)=H.raw.prim(chr φ α), a primitive PChar, not the uncorrected character modulo the host conductor. PrimRead:55–61 first identifies H.dir(chr φ α) with dirChar(recH H,α). Then the cited primitive_value_primitive gives for every n≠0, j(α).χ(n)=primVal(arith H,α,n), using the positive conductor. In particular this holds at n=p^k for k≥1, even at ramified primes. Replacing the primitive character by the imprimitive host character would be invalid at such primes. This underlying primitive_value_primitive proof is retained as an upstream obligation; not reconstructed here.

The zero-mode equivalence is j(α).χ=1 iff α=0 (PrimRead:64–83). A Dirichlet character is principal iff its primitive character is principal (changeLevel_primitiveCharacter and primitiveCharacter_one). If the host character is principal, evaluate on units u; for every g in φ.GG choose u with H.art(u)=g (HostDer.art_surj), and for every element of E0×A choose g mapping to it (prim_read_surj). Thus α takes value 1 everywhere; it is the zero additive character. Conversely α=0 gives the trivial host character. This is why surjectivity cannot be omitted.

For α≠0, use compatibility at j(α) to identify ell(α) with the log derivative at one. Every n in [1,floor_nat(y)] is nonzero and ≤y, so max(y/n−1,0)=y/n−1. The source rewrites the finite summands with the exact primitive values; hence GPsi=An.gChi. For α=0 the principal correction Gz=An.G supplies the equality. For y<1 the natural-floor interval is empty and no division-by-zero argument is required. The conclusion is
  (α≠0 → ell(α)=An.logDerivativeAtOne(j(α).χ)) AND for EVERY real y, GPsi(arith H,ell,α,y)=An.gChi(j(α).χ,y).
This is a transfer of the *whole weighted prime-power signal*, including the separate principal correction; it is not an estimate based on unramified primes alone.

## 3. Exact weights and no duplicated primitive character (GmAEq:61–149)
Fix Λ, φ, H, TT, x,eps,C and ell with EAtH Λ H.raw TT x eps C and HostAddCharCompatible. EAtH has all six fields o_eq, kept, ps, shares, bdG, bdL. Only relevant fields are used in this equality; none is removed from the theorem. Its kept field ensures each p∈KEPT is induced by a character θ∈Xp, where Xp comprises those θ trivial on A0 and θ(iod)=1. The ps field says if psK=some p then p is induced by φ.psC, and if psK=none then φ.psC is not kept. These are premises, not consequences of Fourier analysis.

By HostRaw.kept_iff, Kp=keptA is exactly {α:j(α)∈KEPT}. chr_bij supplies the bijection α↦θ. PrimInj:6–27 supplies injectivity of θ↦H.prim θ: if two primitive characters agree, then their inducing values agree on every host unit, since the unit's natural representative is coprime to the conductor. Artin surjectivity then makes them agree on every g; monoid hom extensionality gives equality. Thus j is injective. Surjectivity onto KEPT follows from EAtH.kept and chr_bij, so j:Kp→KEPT is bijective. The same argument ensures every α∈Kp has chr φ α∈Xp. No character is duplicated or discarded by the reindexing.

To match weights, note that on the two sign factors and A, θ(iod)=1 kills one sign factor. If additionally θ is trivial on every τ1(h) (h∈A), the remaining character depends only on the other sign factor, whose generator squares to one. Its value is +1 or −1. Hence θ=1 or θ=φ.psC, and conversely those two θ have the stated restriction (gmA_eq_triv:16–59, generator transport:10–14). Therefore for α in Kp:
- if θ=1, j(α)=PChar.one and its weight is one;
- if θ=φ.psC, it is kept. If j=one the weight is one; otherwise psK cannot be none by EAtH.ps. When psK=some p, isPrimOf_iff identifies that p with j; its weight is one;
- if θ is neither, it cannot map to one (injectivity) or to the optional psK element (the exceptional character condition plus injectivity); its weight is c.

This proves wtA(c,α)=if j(α)=one then 1 else Level.wt(j(α)), exactly as lines 94–128. Do not set every weight to c, or replace the exceptional case by an arbitrary character with a large value. Reindex the finite sum using the bijection and use section 2 termwise (129–136). Separate the principal character exactly once (137–149), obtaining
  GmA(arith H,ell,keptA Λ H.raw,c,y)=Λ.Gm(y) for EVERY real y.
This equality does not require bounds on the omitted signals. It does require the source's host/primitive and character compatibility.

## 4. Omitted-character bound (SigALe:38–60)
Fix the same Λ,φ,H,TT,x,eps,C,ell; additionally x>0. Define O=PsiA(A0) minus Kp. For α∈O, θ=chr φ α is trivial on A0. Since iod²=1, θ(iod)=+1 or −1. In the + case θ∈Xp and θ is not kept (since α∉Kp); in the − case θ∈Xm. Either case gives θ∈H.raw.Bounded Λ.KEPT, as defined at F/Analytic:136. EAtH.bdG (the original pointwise bound on bounded primitive characters) and section 2 imply
  |GPsi(arith H,ell,α,x)| ≤ x^(1/2+eps).
It is essential to retain this upstream square-root bound for the *omitted* class; it is not a consequence of their being omitted. No assumption of a pointwise bound on the retained signals.

Sum over O to get SigA≤|O| x^(1/2+eps)≤|PsiA(A0)| x^(1/2+eps), since the power is nonnegative. CardPsiA:26–63 supplies |PsiA(A0)|=4[A:A0]=4 φ.o: the character is trivial on kernel {0}×A0 of the surjection π:E0×A→E0×(A/A0), so descends uniquely. To see this, if π(u)=π(v), then u−v lies in kernel, giving α(u)=α(v)α(u−v)=α(v). Hence choose a lift per quotient point to define the descended character; independence of lift and multiplicativity follow from that same equality. Pullback is injective by surjectivity, so the finite complex character dual has cardinality of quotient, 4[A:A0], using AddChar.card_eq. Frame.index_A0_eq_o and EAtH.o_eq give 4Λ.o. Therefore
  SigA ≤ 4Λ.o x^(1/2+eps).
The absolute value here is for omitted individual complex signals, NOT for the final weighted retained sum. Negative retained values are allowed.

## 5. Finish the power-bound interface without assuming it
CoreGm:12–74 fixes Λ,eD,eL,K,cHH,eK,C,eps with eps>0 and returns a threshold x1 uniform over all later x and all φ,H,TT satisfying EAtH and CoreAtH. It applies ch_core and ch_top under the full CoreAtH unpacked hypotheses, including SizeData₂, ErrWindows, BNBoundsU, SizesA, ThinScales, CostWindows, RestSize, T2 subset A0, ell compatibility and local bounds. The source derives eD+eL≥0 inside this proof; it is not a free global assumption.

The retained-sum bound from ch_core has A=x^(1/2+(eD+eL+6)eps), plus SigA. Sections 3–4 give Λ.Gm≤A+4o B, B=x^(1/2+eps). For x≥1, eD+eL≥0 and eps>0, B≤A. Choose common threshold also ensuring x^eps≥1+4o, possible since eps>0. Then
  Λ.Gm≤(1+4o)A≤x^eps A=x^(1/2+(eD+eL+7)eps).
This is the exact final exponent absorption (CoreGm:61–74), not a proof of the antecedent from finite group algebra. The geometric and arithmetic producers of the hypotheses are separate tasks; the math and character-box chapters already map their selection into arbitrarily late windows (TopWin:68–81). FormB (Imports:8–19) uses level_family, la>1, 0<theta<1 and the supplied windows of Λ.Gm≤y^theta, setting C=1, delta=la−1. Then zeroFree_of_rpow_window applies. This identifies the direct consuming call site of the conditional prime-window theorem on the mapped root route. No claim of exhaustive full-corpus call-site search.

## 6. The Level-to-Landau identity (LevelFamily:41–52)
Choose F's finite index to be the subtype of KEPT; moduli and characters are exactly the PChar fields. They have nonzero modulus. Every primitive principal character has conductor=1 (GChiEq:21–31, LevelFamily:19–25); hence F.adm holds. This excludes imprimitive principal characters with missing Euler factors. F.a(p)=1 for p=one, and Level.wt(p) otherwise. Positivity is exact since denominator 3o+1≥1 (even when o=0).

GChiEq:6–36 proves An.gChi=Deduction.Gchi for every PChar and all y. The n=0 term vanishes by von Mangoldt(0)=0; the natural interval [1,floor_nat y] equals the remainder of the finite range. In the principal branch primitivity forces N=1, so χ(n)=1 for all n, including 0 in ZMod 1. Thus its prime sum and principal correction are the universal zeta signal. In the nonprincipal branch the same ramp and log derivative coincide definitionally after the finite-sum rewrite. GzEq:6–50 proves Gz=An.G=Deduction.G, including y<1 (empty range); on each nonempty summand max may be removed because n≤y, and endpoint n=0 contributes zero. Reindex F by KEPT, isolate one with weight one, and use these identities. Therefore for every real y, F.Gm(y)=Λ.Gm(y). Moreover for every real theta, F.ZeroFree(theta) iff Λ.ZeroFreeAbove(theta), since both quantify precisely the same primitive characters and all complex s with Re s>theta. This is an equivalence of quantified propositions, not a numerical inference. No universal nonvanishing assumed.

## 7. Execution / replay
Executed 82 literal/blob checks on the 15 pinned files above via GitHub connector and V8; exact finite V8 checks: 280 cyclic quotient-annihilator counts, 9,880 integer-scaled weighted reindex cases (including signed values and o=0), 16,640 integer absorption inequalities, 32 nonunit-weight controls, 44 prime-power principal-mod-4 versus primitive-mod-1 value checks, and 32 wrong-principal-weight counterexamples; all checks passed. Total finite checks 26,908 (plus 82 source checks). These are illustrative finite algebra regressions only, not tests of actual L-function nonvanishing or all groups. The quotient tests use cyclic groups, not surrogate native Cathedral matrices. Replay below uses Python standard library and the pinned git checkout (the Python version is provided for reproducibility, not separately executed in this session).

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
C="src/Development/AutomorphicArithmetic/PrimitiveCosets/"
for f,sha,terms in [
 ("LevelFamily.lean","d08c25d0cb674297482bec9a235401c14bfb22fa",["if ψ = PChar.one then 1 else Λ.wt ψ","Finset.sum_coe_sort"]),
 ("GmAEq.lean","2f1a763f43d65eea1f6e61018c8b70c02d2dfa03",["Finset.sum_image hinj","gmA_eq_triv","hE.ps"]),
 ("PrimRead.lean","3960cf3e7d166f6664405a0d5fcb995924621ffb",["primitive_value_primitive","@hell ψ hψ","HostDer.art_surj"]),
 ("SigALe.lean","e9c80e2017ec149ac559bc20c184b9264b9ec0c2",["hE.bdG","card_PsiA, hE.o_eq"]),
 ("CardPsiA.lean","4fe4ded735dd1ba55db3a01fc181ad794a2c4a0a",["exists_comp_eq","AddChar.card_eq"]),
 ("CoreGm.lean","3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d",["gmA_eq","sigA_le","1 + 4 * (Λ.o : ℝ)"]),
 ("Imports.lean","2dc9b4e690951c66ffe443e279fcada259bcce13",["level_family Λ","Deduction.zeroFree_of_rpow_window"])]:
    data=subprocess.check_output(["git","show",P+":"+C+f])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=data).decode().strip()==sha
    for t in terms: assert t in data.decode(),(f,t)
counts=[0]*6
for n in range(1,65):
    for o in range(1,n+1):
        if n%o: continue
        m=sum(1 for a in range(2) for b in range(2) for k in range(n)
              if all(k*o*j%n==0 for j in range(n//o)))
        assert m==4*o
        counts[0]+=1
for o in range(65):
    for m in range(1,17):
        for sp in range(-1,m):
            vals=[(i*17+o*7+m)%41-20 for i in range(m)]
            d=3*o+1
            a=vals[0]*d+sum(vals[i]*(d if i==sp else 1) for i in range(1,m))
            b=sum(vals[i]*(d if i==0 or i==sp else 1) for i in reversed(range(m)))
            assert a==b
            counts[1]+=1
    for r in range(1,33):
        for t in range(8):
            A,B,Q=r,r+t,1+4*o+t
            assert A<=B and B+4*o*A<=Q*B
            counts[2]+=1
for o in range(1,33):
    assert 3*o+1!=1
    counts[3]+=1
    assert 7*(3*o+1)+11!=7+11
    counts[5]+=1
for p in [2,3,5,7,11,13,17,19,23,29,31]:
    for k in range(1,5):
        assert ((p==2)==(1!=(p**k%2)))
        counts[4]+=1
assert counts==[280,9880,16640,32,44,32],counts
print(counts, sum(counts))
```

No Lean installation or kernel export executed in this run; no proof-coverage percentage, no novel RH theorem, no URT speed result. Source graph counts cannot replace kernel closure. Independent audit request: review j injectivity/surjectivity, the full exceptional weight branch, and the distinction A0 vs A, including imprimitive corrections and source positivity. Require exact pinned producer of primitive_value_primitive before marking primitive prime-power read fully reconstructed.

RESUME HERE: follow PrimRead:60's actual primitive_value_primitive definition through CoreAtH→RecH→GaloisMapComplexConjugation/its imports, reconstruct the local ramified and unramified p^k values from inertia and Frobenius and then the finite n≠0 statement; inspect GPsi and primVal actual definitions. Preserve conductor-level reduction and all zero/ramification exceptions. Coordinate with Galois and Landau lanes; do not redo their pole or geometry work.
HANDOFF TO: formal audit, math, integration, proof editor, Galois arithmetic, character boxes, Landau criterion. The three-stage exact prime-signal identification and omitted-class bound are ready for independent review.



---

## Appendix 27: specialists/landau_criterion/RUN2_MELLIN_CONJUGATION_AND_POLE_FIELDS.md
Working-repo blob cac177400caafac5138a1b9d68be3d376935eee1.

# Landau run 2 — Mellin, conjugation, and pole-data obligations

2026-11-24. RESULT: SOURCE-MATCHED human derivation of the five local analytic leaves left open in RUN1, plus completion of the modulus-one Mellin proof body and explicit Mathlib provenance. No independent Lean kernel run, no proof of upstream arithmetic window, no URT speed claim. The project remains OPEN. Read swarm protocol, queue, expansion, AGENTS and continuity/state/log/protocol; latest physical CI PASS 790adae is unrelated to RH correctness. Read current integration/editor/math, prime-window, character, theta, Galois, positivity, literature, kernel and acceleration handoffs. The prime lane owns the arithmetic producer and is not duplicated here.

## Source anchors

All original project paths below are relative to `src/Development/AutomorphicArithmetic/DedekindLFunctions/` at [40e56bab026552e089d7afcfeff08d2defb9c005](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005).
- CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 (ramp, Gchi, Gm, adm).
- LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 (seven PoleData fields).
- LandauTheorems/MellinRamp.lean f0a83b2bfc171061bfd86c2e00a0a5b963a3122e (mellin_ramp).
- LandauTheorems/mellinGchiOfNeOne.lean 675a25d278977948c8327f0e1e2e31fb3a990a7d (full body).
- LandauTheorems/mellinGchiModOne.lean 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc (full body, including previously unread final lines).
- LandauTheorems/GchiGrowth.lean 0adbad2399f91f6cd547c9195d4464ccb5512d45.
- LandauTheorems/measurableGchi.lean 3b014d914efcdcf58e8de1823570aeb3c64babf3.
- LandauTheorems/GchiConj.lean 63cdd6a1ec3e729a5465803a19ebcf5ab9c9577c.
- LandauTheorems/LFunctionConj.lean e43f4fab2a28eb31e20c5815ae6a923fd3d5b3de.
- LandauTheorems/poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1 (full body).
- LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109.
- LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f.
- LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002.

Upstream main observed 0e40c084e27c44a3584e271cb14e7dd3bce9aa63 (2026-11-24 08:19:26 UTC, CI merge message). At this revision CharFamily and LandauZeroFreeCriterion still have changed blobs cac521ab291c9dab261508613d4d12195cdfb799 and f4c5124f8a0188f85b60b2687864d531f9c0a3d8, and old mellinGchiModOne and poleData paths return 404. No semantic equivalence established. Original pin only.

## 1. Exact ramp transform, including absolute integrability

Let n>=1, s complex, sigma=Re(s)>1, and r_n(y)=max(y/n-1,0). For y>0 powers use the real logarithm. Since r_n=0 for 1<y<=n, the integral is over y>n. Both y^(-s) and y^(-s-1) are absolutely integrable on (n,infinity). On that interval,
  r_n(y)y^(-s-1)=y^(-s)/n-y^(-s-1).
Integrating gives n^(-s)/(s-1)-n^(-s)/s=n^(-s)/(s(s-1)). Both denominators are nonzero since sigma>1. No branch issue for positive bases. Because r_n is nonnegative,
  integral |r_n(y)y^(-s-1)| dy=n^(-sigma)/(sigma(sigma-1)).
This is the real-argument version of the same formula (mellin_ramp, mellin_Gchi_of_ne_one_norm). At n=0 the original ramp term is zero because von Mangoldt(0)=0, not by substituting n=0 into the positive-n identity. The series convention LSeries.term at n=0 is zero. This is relevant to the modulus-one proof, which explicitly includes n=0.

For arbitrary f:N->C, each y has finite support: n>floor_nat(y) implies r_n(y)=0 (and n>=1); so the pointwise sum equals the original finite ramp. To interchange integral and infinite sum, pointwise finiteness alone is NOT enough. The source adds the assumption of LSeriesSummable for f(n) Lambda(n) at s. Then
  sum_{n>=1} integral |Lambda(n) f(n) r_n(y) y^(-s-1)|dy
  = sum_{n>=1} |Lambda(n) f(n)| n^(-sigma)/(sigma(sigma-1)) < infinity.
Hence absolute-integral summability justifies the interchange. An extra integrable correction g(y) can be inserted as term zero, with all positive-n terms shifted by one. This is precisely mellin_Gchi_of_ne_one_ramp, via hasSum_integral_of_summable_integral_norm; the principal case uses mellin_Gchi_modOne_sum and the ordinary von Mangoldt summability. There is no unproved cancellation hypothesis.

## 2. Two distinct Mellin corrections

Nonprincipal chi (N>0, chi!=1): b=L'(1,chi)/L(1,chi), which exists because L is entire and nonzero at 1. On sigma>1, set D=L'(s,chi)/L(s,chi). The imported twisted von Mangoldt identity supplies sum chi(n)Lambda(n)n^(-s)=-D, with absolute summability. The correction in Gchi is y b; its Mellin integral is b/(s-1). Thus
  M_chi(s)=-D/[s(s-1)]+b/(s-1)=-(D-s b)/[s(s-1)].
The equality between the analytically continued LFunction and the series, and between their derivatives, holds on the open half-plane sigma>1. These are both explicit source rewrites; no assertion about derivative equality on the critical strip is used.

Modulus one chi: chi(n)=1 even at zero modulo 1 (trivial group). Let gamma_E be Euler's constant. Gchi=ramp - y log y+(1+gamma_E)y. The Mellin integrand correction is E(y)=(1+gamma_E)y^(-s)-log(y)y^(-s). Let e=(sigma-1)/2>0. On y>=1,
  log y<=y^e/e,
  |log(y)y^(-s)|<=y^(-sigma+e)/e (exponent <-1),
  |log(y)y^(1-s)|<=y^(1-sigma+e)/e -> 0.
This proves absolute integrability and the missing boundary condition. Differentiate H(y)=log(y)y^(1-s):
  H'=(1-s)log(y)y^(-s)+y^(-s).
Both H(1)=0 and H(infinity)=0. Integrate, use integral y^(-s)dy=1/(s-1), then solve for integral log(y)y^(-s)dy=1/(s-1)^2. This is mellin_Gchi_modOne_log_int and _log. All inequalities use Re(s)>1, not s real.
For the principal summands, the absolute integrals coincide with the real sigma term since Lambda(n)>=0 and r_n>=0. Source hsum uses LSeriesSummable_vonMangoldt at sigma, divides by sigma(sigma-1), then matches the norm integrals. The correction is integrable separately. Thus the final body of mellin_Gchi_modOne rewrites the finite ramp as E+tsum, interchanges integrals, applies the ordinary logarithmic derivative identity D=zeta'/zeta, and simplifies:
  M_1(s)=-D/[s(s-1)]-1/(s-1)^2+(1+gamma_E)/(s-1)
         =-[D+1/(s-1)+1-(1+gamma_E)s]/[s(s-1)].
The previously unread closing proof body is accounted for. This formula is only asserted for Re(s)>1.

## 3. Measurability and growth

For fixed integer k, finite sums of y->max(y/n-1,0) times constants are measurable (n=0 totalized division also measurable). The natural floor k=floor_nat(y) is measurable and countably valued. For a family f_k of measurable functions, y->f_floor(y)(y) is measurable by countable partition, equivalently measurable_from_prod_countable_left and measurable product map. Hence ramp is measurable on all real y; so is Gchi after adding the branch-specific corrections (Real.log is the formal total function).
For y>=1, |chi(n)|<=1, 0<=Lambda(n)<=log n<=n for n>=1, and r_n(y)<=y/n. Every summand has norm <=y (zero n=0), and there are floor_nat(y)+1<=y+1<=2y terms. Thus |ramp|<=2y^2. Nonprincipal |Gchi|<=(2+|b|)y^2, using y<=y^2. Principal |Gchi|<=(3+|1+gamma_E|)y^2, since 0<=log y<=y. This is Gchi_growth_ramp and Gchi_growth, with the original constants, not optimized estimates. Note growth itself holds for all characters; the adm restriction is needed for later pole construction.

For u>0, y=e^u>=1 and sigma>2:
  |Gchi(e^u)e^(-su)|<=max(C,0)e^(-(sigma-2)u).
The right side has finite integral. This justifies poleData_integrable and finite-family integral linearity. Source uses Re(s)>2 here (even though Mellin evaluation is valid on Re(s)>1). For poleData_change, the increasing injective smooth map u->e^u sends (0,infinity) onto (1,infinity). Its Jacobian is e^u; multiplying (e^u)^(-s-1) by e^u gives e^(-su), so the stated Laplace integral follows with no extra factor. No claim that the Laplace integral converges in Re(s)>theta.

## 4. Global conjugation, not just Euler-product conjugation

The local source LFunctionConj proves conjugation for ALL complex s, including totalized exceptional values. For x>=0, the formal complex power satisfies x^(conj s)=conj(x^s) (conj_cpow, arg x!=pi, including the formal x=0 convention). Gamma_R(s)=pi^(-s/2)Gamma(s/2) respects conjugation by Complex.Gamma_conj. For a in [0,1], on Re(s)>1, the absolutely convergent Hurwitz series sum 1/(n+a)^s respects conjugation termwise. At a=0,n=0 use the same formal power/division conventions, not an ordinary divergent term.

To cross the pole, define the specific regularization from the code:
  R_a(s)=HurwitzZeta(a,s)-1/[(s-1)Gamma_R(s)].
This, not unregularized Hurwitz zeta, is entire, using differentiableAt_hurwitzZeta_sub_one_div at 1; elsewhere use holomorphy of Hurwitz zeta and differentiability of reciprocal Gamma_R. The regularizing term respects conjugation, even at the totalized s=1, and F(s)=conj(R_a(conj s)) is entire by conjugate-chain differentiability. F=R_a on Re(s)>1; by the holomorphic identity theorem on C (source eq_of_eventuallyEq at 2), F=R_a everywhere. Undo regularization algebraically to obtain Hurwitz conjugation globally. Every a in R/Z is represented by fractional part in [0,1), so the result applies to all circle classes. Using
  L(s,chi)=N^(-s) sum_{j in Z/NZ} chi(j) HurwitzZeta(j/N,s)
and conj(chi(j))=chi^(-1)(j) (including nonunits where both zero), get
  L(conj s,chi^(-1))=conj(L(s,chi)).
These are the actual source steps LFunctionConjugation.ofReal_cpow_conj through hurwitz_conj and LFunction_conj. In particular the conjugate zero iff inverse-character zero is now explained in the critical strip, not extrapolated from the convergent series without an identity theorem.

For Gchi_conj_ramp use real weights Lambda and r_n, so finite-sum conjugation gives ramp(chi^-1)=conj(ramp(chi)). For the principal correction the added real terms are unchanged. For nonprincipal chi, chi^-1 is nonprincipal and the preceding relation at 1 yields conjugate L values. Differentiating the conjugate-composed function gives conjugate derivatives at conjugate points; the local deriv_conj_comp_conj even treats the formal nondifferentiable branch (both deriv values defined as zero). Thus b_inv=conj(b), and Gchi_inv(y)=conj(Gchi(y)). The averaging identity Re Gchi=(Gchi+Gchi_inv)/2 now holds for every real y. A complex character cannot in general be replaced by its own conjugate: the regression uses the actual order-four character modulo 5 and exhibits a nonreal ramp.

## 5. Zeta regularization and all seven family PoleData fields

Source poleData_char uses the entire f(s)=(s-1)zeta(s) away from 1 and f(1)=1. The residue-one limit gives continuity at 1; removable-singularity theorem makes f entire. The difference quotient at 1 equals zeta(s)-1/(s-1) for s!=1 and tends to gamma_E, so f'(1)=gamma_E. Away from 1, f'=zeta+(s-1)zeta'. Consequently f'/f=D+1/(s-1) for Re(s)>1. The abstract transform with k=1 has numerator f'/f-s gamma_E+1-s, precisely the modulus-one Mellin expression. For nonprincipal f=L and k=0, it is the other expression. The subtraction at s=1 in the abstract numerator is essential; its divided difference removes a spurious pole. At actual zeros rho!=0,1, factoring f=(s-rho)^m h and subtracting m times the divided difference of 1/[s(s-1)] leaves an analytic remainder, as in RUN1. Neither a zero of f at 1 nor a pole of Phi at 1 is introduced. Importantly, the locked Mathlib value zeta(1)=(gamma_E-log(4*pi))/2 is a nonzero totalized convention, not f(1), not the meromorphic zeta value, and not the usual Laurent constant gamma_E.

For finite admissible F and a_i>0, define Z={rho: Re(rho)>0 and some L_chi(rho)=0 or L_chi(conj rho)=0}, Phi=sum_i a_i(P_i+P_inv_i)/2 using admissibility of inverse as well. Seven fields:
- meas: finite real-part composition and weighted sum of measurable Gchi(e^u).
- growth: sum_i a_i C_i times e^(2u) bounds absolute value, by the triangle inequality and positive weights.
- laplace: integrate the exact conjugate-average identity using integrability for each original and inverse term.
- pos: by definition of Z.
- diff: outside Z in Re>0 every original and inverse L-value is nonzero and s!=0, so each P is analytic and finite sum differentiable.
- iso: each entire regularized f is nonzero at 1, hence not identically zero. Its zeros are isolated in punctured neighborhoods of every point, not merely each zero. Intersect finitely many such eventual conditions; any w in that intersection is not in Z. This excludes accumulations in the half-plane.
- pole: at rho in Z choose original/inverse multiplicities m_i,m'_i. At least one positive multiplicity follows from the witness; all others nonnegative. S=sum_i(a_i/2)(m_i+m'_i)>0. rho!=0 and rho!=1 by Re>0 and imported closed Re>=1 nonvanishing. Residue c=-S/[rho(rho-1)]!=0, and when rho real 0<rho<1, c>0 real. Remainder is finite analytic sum; punctured eventual equalities combined via finite intersection. No assumption excluding real exceptional zeros in (0,1); they are exactly covered by positive residue. For complex zeros the residue need not be real but cannot cancel. Empty F is vacuous and Z empty.

The precise dependency join is `poleData F` plus `windowHypU_of_windowHyp F hdelta h` -> `landau_window` with 0<theta<1 and delta>0 -> `lemmaL`. The latter excludes Re>=1 using imported nonvanishing and otherwise uses s in Z if theta<Re(s)<1. Then `zeroFree_of_rpow_window` applies `windowHyp_of_rpow` and `lemmaL`. No converse or proof of existence of the windows is supplied here. RUN1 covers the signed Cauchy/tail argument; these five leaf obligations fill its explicitly listed local gaps.

## 6. Locked external provenance (not a kernel dependency audit)

RH lake-manifest.json blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f locks mathlib4 at [0df444a360eaa60ab8c11dca51a86af692955474](https://github.com/leanprover-community/mathlib4/tree/0df444a360eaa60ab8c11dca51a86af692955474); lean-toolchain blob a8afa7d1b02d96f0671eba854a8dc4b416beb473 specifies v4.33.1. Retrieved locked library files, named statements verified by reading:
- Mathlib/NumberTheory/LSeries/Dirichlet.lean f718ca1edc35ffa92b318b2f74ddcef0e2e754a3 lines 381,402,409,436: von Mangoldt summability and log derivatives, precisely Re(s)>1.
- LSeries/DirichletContinuation.lean 9ccc38f52d669a88285a904e59dbb562ade5aba5 lines 67,75,79,98: modulus-one identity, L-series and derivative equality, nonprincipal differentiability.
- LSeries/Nonvanishing.lean 610bd56365d49c5ffa9ebeb29e0a383c768248e2 lines 398–415: LFunction nonvanishing Re>=1 under chi!=1 or s!=1; at nonprincipal s=1; zeta closed half-plane including its explicit totalized value. This is not RH and does NOT exclude any zero with Re<1.
- LSeries/RiemannZeta.lean 3c92195fce20df7fda41cfd823b3266f83cf3070 lines 139,242: differentiability away from 1, residue-one limit.
- LSeries/HurwitzZeta.lean 1fd05c4f234bb288bc97bd93c02f63e1e5623983 lines 66,72,88: differentiability, convergent series and regularized differentiability at 1.
- LSeries/ZMod.lean 0c6ccbe61ab0645b0b8f713af0f2398de6fcc936 lines 87–93,131–134: finite residue-class representation and continuation consequences.
- LSeries/HurwitzZetaEven.lean e24ca61b0261ee1627bdeaeaaac8ef7bcec437ba lines 613,630: continuation leaves.
- LSeries/HurwitzZetaValues.lean 4bdfedf2cf474a721e0687852a5782f304781eb7 inspected; not a direct named producer in this run.
- Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean 6846dc699ecd29cc8a1754c1680176210969ffd1: right-hand asymptotic at line 316, complex punctured asymptotic in continuity section, exact totalized zeta(1) formula and nonzero proof at lines 417–449.

No extra mathematical hypotheses introduced. These imported named theorem statements and selected bodies are located, not a fully expanded independent proof of the library or exact axiom reachability. In particular the classical nonvanishing-on-line-one proof and the absolute convergence/log-derivative Euler-product prerequisites are next audit targets. A source import of Mathlib is not a kernel graph. No Lean/Lake executable available in local container.

## 7. Executed regression certificate

Copy this code and append `console.log(run())` in Node.js, or run in ES2020. It was executed in V8 this session. Numerical quadrature checks evaluate ramp and Jacobian after the positive exponential substitution, and integration-by-parts log integral at real and genuinely complex s. Exact BigInt checks test the cleared modulus-one denominator algebra. Character modulo 5 tests use actual nontrivial character values, not a substitute proof; finite norm and conjugation checks are independent regression examples. They are not universal proofs or Lean validation.

~~~javascript
// Node.js (or any ES2020 JS engine), no dependencies.
// Finite regression only; not Lean verification or proof of analytic continuation.
function run() {
 const counts={ramp:0,log:0,change:0,algebra:0,character:0,growth:0};
 const maxErr={ramp:0,log:0,change:0};
 const check=(b,m)=>{if(!b)throw Error(m)};
 const add=([a,b],[c,d])=>[a+c,b+d], neg=([a,b])=>[-a,-b];
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 const div=([a,b],[c,d])=>[(a*c+b*d)/(c*c+d*d),(b*c-a*d)/(c*c+d*d)];
 const conj=([a,b])=>[a,-b], norm=([a,b])=>Math.hypot(a,b);
 const exp=([a,b])=>[Math.exp(a)*Math.cos(b),Math.exp(a)*Math.sin(b)];
 const scale=(a,[b,c])=>[a*b,a*c];
 function integrate(f,T,N=65536) {
   let z=[0,0]; const h=T/N;
   for(let i=0;i<=N;i++)z=add(z,scale(i===0||i===N?1:i%2?4:2,f(i*h)));
   return scale(h/3,z);
 }
 function compare(got,want,k) {
   const err=norm(add(got,neg(want)))/Math.max(1,norm(want));
   maxErr[k]=Math.max(maxErr[k],err);
   check(err<2e-7,k+" residual "+err);counts[k]++;
 }
 for(const a of [1.25,2,4])for(const b of [0,.7,3]){
   const s=[a,b], sm=[a-1,b], T=40/(a-1);
   compare(integrate(t=>scale(t,exp(scale(-t,sm))),T),div([1,0],mul(sm,sm)),"log");
   for(const n of [1,2,13]){
     const v=exp(scale(-Math.log(n),s));
     const expected=div(v,mul(s,sm));
     compare(integrate(t=>mul(v,mul(exp(scale(-t,sm)),[-Math.expm1(-t),0])),T),expected,"ramp");
     // Jacobian after y=e^u, with u=log(n)+t: ramp*e^{-su}.
     compare(integrate(t=>scale(Math.expm1(t),exp(scale(-(Math.log(n)+t),s))),T),expected,"change");
   }
 }
 // Exact Gaussian-integer cross-multiplication of the modulus-one correction:
 // -D/(s(s-1)) - 1/(s-1)^2 + (1+g)/(s-1)
 // = -(D+1/(s-1)+1-(1+g)s)/(s(s-1)).
 // Multiply both sides by s(s-1)^2. All operations exact BigInt.
 const A=([a,b],[c,d])=>[a+c,b+d], M=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 const N=([a,b])=>[-a,-b], eq=([a,b],[c,d])=>a===c&&b===d, one=[1n,0n];
 for(const x of [2n,3n,5n])for(const y of [-3n,0n,2n])
 for(const d of [-2n,0n,7n])for(const g of [-1n,0n,3n]){
   const s=[x,y], q=A(s,N(one)), D=[d,2n], G=[g,0n];
   const lhs=A(A(N(M(D,q)),N(s)),M(M(A(one,G),s),q));
   const rhs=N(A(A(M(D,q),one),M(A(one,N(M(A(one,G),s))),q)));
   check(eq(lhs,rhs),"mod-one numerator");counts.algebra++;
 }
 // Genuine order-four character modulo 5 (generator 2): chi(0)=0.
 const chi=[[0,0],[1,0],[0,1],[0,-1],[-1,0]];
 function lambda(n){if(n<2)return 0;for(let p=2;p<=n;p++)if(n%p===0){let k=n;while(k%p===0)k/=p;return k===1?Math.log(p):0;}return 0;}
 function ramp(y,inv){let z=[0,0];for(let n=1;n<=Math.floor(y);n++){
   let c=chi[n%5];if(inv)c=conj(c);
   z=add(z,scale(lambda(n)*Math.max(y/n-1,0),c));
 }return z;}
 for(let i=0;i<=160;i++){
   const y=1+i/4, z=ramp(y,false), w=ramp(y,true);
   check(norm(add(conj(z),neg(w)))<1e-12,"character conjugation");counts.character++;
   check(norm(z)<=2*y*y+1e-12,"ramp bound");counts.growth++;
 }
 check(Math.abs(ramp(3,false)[1])>0,"negative control: inverse character needed");
 return {counts,maxErr,negativeControl:"nonreal ramp at y=3",status:"finite regressions PASS"};
}

console.log(run());
~~~

Actual output:
~~~json
{
  "counts": {
    "ramp": 27,
    "log": 9,
    "change": 27,
    "algebra": 81,
    "character": 161,
    "growth": 161
  },
  "maxErr": {
    "ramp": 5.618033235387036e-12,
    "log": 5.366109301309177e-12,
    "change": 5.618010200314365e-12
  },
  "negativeControl": "nonreal ramp at y=3",
  "status": "finite regressions PASS"
}
~~~

Counts are 466 finite regressions plus one nonreal-ramp negative control. Five new analytic source files fully read and translated; previously partial modulus-one final body completed; six additional already-seen analytic files cross-checked for join, plus the definitions and locked Mathlib files. Seven fields preserved, no removed premises. Human proof local analytic construction now source-matched, not kernel-validated. No meaningful full-proof completion percentage; separate arithmetic producer remains outstanding.

RESUME HERE: independently reconstruct the locked Mathlib Nonvanishing.lean proof of LFunction_ne_zero_of_re_eq_one and its real quadratic exceptional-at-1 branch (including why the junk value of zeta is irrelevant away from 1). Trace the positivity/Dirichlet-series contradiction to its actual lemmas, then audit the named Dirichlet.lean log-derivative identities and ZetaAsymp complex asymptotic. Coordinate literature lane; do not redo prime-window or host producer. Request audit lane review both Landau chapters against pinned sources and preserve unresolved exact-kernel dependency boundary.

HANDOFF TO: integration, proof editor, formal audit, literature, prime-window and character-box lanes. The five local Mellin/growth/measurability/conjugation leaves and modulus-one final body now have a human reconstruction. No physics gates touched.



---

## Appendix 28: integration/2026-11-24_size_algebra_independent_join_audit.md
Working-repo blob 4e749603269c4c59dd1216079fa4e6edd7f0f4b5.

# Independent size-closure join audit
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005. The parallel chapter math/2026-11-24_complete_conditional_size_algebra.md already exists (blob 506ef3fc1a88276a6dcdbf965ea84c72eac3b9a0); preserve it. Independently inspected actual source SzRowElevenLeSplitBound.lean (6d646554a3c43556eb9853f3d2363e37510c2181), under src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation. Its theorem szRow_sizesAt joins precisely 11 blocks:
1. N,M,K,T,TT,De2,Lw
2. KRel
3. Cond,QD,Pde
4. La,Rho,Bot
5. Eta
6. Nodes
7. Lstar
8. Del
9. W,Bm,Xpp
10. G,Words
11. splitBound >= 11
These are 24 distinct fields. The source then permutes them into the order of ElevenLe.SizesAt using SzRow.imp. SzRow.and (ca633b5e23f18e773bffbad6293cda846711bea7) takes max first thresholds before selecting cD, max second thresholds at the SAME cD before selecting ch, and max x thresholds at the SAME cD,ch. All apply to the same D,L satisfying Val. This gives a reusable linear finite conjunction procedure; individual thresholds and witnesses are still mathematical work.

Independent final-five derivations agree with the existing chapter: uniform prime lower margin ez/100 absorbs 2; 19/100>1/6; upper logarithmic powers absorbed by eps/100; dlog from Val; factRd from hostBounds retained. N1=O(log x) from the marked Bernoulli tile scale and delta*ceil(1/delta)<=2; LaG from Val.La_eq and fixed K.La>=1. Three native place windows and eta+1<=w''<=b'<=b give weights in [w'',2b] and X''w''=xb. Native b_j=b1+j*h0v with b1>=w'' gives SizeBm. Word bound follows by logarithms: y=x^(9/2+9eps), m^5 f x^eps<=128y, log(3 GamL^2 x^CF)<=(256 CG+CF+2)y. At x^eps>=2(256 CG+CF+2)+3 the latter <=(k-3)log2; ceiling preserves integer upper bound. All these are conditional implications.
Executed independently in this session: 1536 positive rational prime exponent gap checks, 2184 abstract integer weight-window fixtures, 3600 exact integer word-log budget checks, 100 nested threshold joins; no failures. These are regression checks of algebra, not source kernel or native witness verification.

Separate exact next junction: ExplicitConstantsParameterConditionsLarge.lean (8bb3bd4a9a5343eaeaef138a1dccf57016010f0a), explicitConstants_parameterConditions_large: SzRow (fun C D L => HostArith D.host -> exists P:ParameterChoice' D L, parConsts P=C.PK and P.CnW=C.P.CnW). This joins 21 blocks including signature/gap/prime conditions. It is NOT the same as SizesAt. Prioritize producer of Val, HostArith and actual FamP construction. Full proof export retry, full lexical pool and typed challenge had no completed status records at this turn's check. Do not claim completed. All source-level size algebra covered conditionally; entire proof still open.



---

## Appendix 29: specialists/galois_representations/RUN3_ROW0B_GUARD_AND_INPUTS.md
Working-repo blob 5dc7623e927f41024b9315e0e46fdcf218af1836. Original validation status retained.

# Run 3 — exact Row0 to Row0b restriction and CoreAll input ledger

2026-11-24. SOURCE-MATCHED PARTIAL; local elementary implication proved below, not a Lean kernel validation. Pinned upstream leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Read swarm protocol, handoff, expansion, AGENTS, continuity and research log/protocol/state; peer integration 0900, theta/prime/Landau/acceleration/kernel run 3, literature/character/positivity run 2, proof-editor 0856, math depth-zero and dependency/structure notes. Physical CI run 45360853226 PASS unrelated to RH. This is the distinct Galois Row0b frontier, not a repetition of the LLC construction or CoreAll descent.

## Pinned source inventory
Base G = src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/.
- G/TypeConditions/WeightsConjAlt.lean — 486af16ec21e4f8c5a482e1481769093b9448bd4, lines 20–39, 51–73, 85–90.
- G/TypeConditions/WeightsConjBis.lean — 0a1eab0eb68defc45b4e62d19fbfd01dad459344, lines 15–86.
- G/IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean — eebd76fca5538c7a0156cf330cedd4b663b0d70a, lines 157–193.
- G/IntegralStructures/Development.lean — 4d4d9506494734f28fce7d39bac1a50650ecf148, lines 24–31.
- G/IntegralStructures/CrystallineInputs/OfInputs.lean — f400e69e7e620958ac2e9205be7f20107d26b829, lines 6–17.
- G/IntegralStructures/CrystallineInputs/InputsOf.lean — 39070d3b7c9ac51c51d6dc2115ee4f027fc850cc, lines 11–20.
- G/IntegralStructures/CrystallineInputs/Crys.lean — 8f176341db3f423d5ea0f163c814084f7f596a1d, lines 32–62.
- G/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCore.lean — a4054e96f51401b00acb7a5443040abdc94fa549, line 5.
- src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean — ee340012ab19713a8acfecf8adc6a331cbc2f1a4, lines 7–11.

Latest observed main c9883164b0b3d762cee21f889d03d59a53b3ba3b, commit date 09:08:06Z. At that revision WeightsConjBis blob 653245ae7ec15da590ef6e4a22b6f1ef59fc321f retains the guard and Row0.row0b declaration; Development blob 25eb1c9c60978c4e9a8edc0899e84289d74a11a1 retains the final conversion; original RowSrc path 404. No full cross-revision equivalence asserted. Continue on pin.

## Exact human proof (Row0.row0b)
Let Rc be the specified local correspondence predicate (RecNotion), not an arbitrarily chosen map asserted correct. IsQp(w) means there exists a rational prime p and a continuous ring equivalence Q_p ≃ w.adicCompletion E. IsQpBig(w,n) means the SAME existential data, with n=1 or 16n^2<p. Forgetting only the final conjunct gives IsQpBig.isQp. No claim that every local completion is Q_p, or that every rational prime satisfies the bound.

Fix CM field E and algebraic closure Ω, prime l, ring equivalence Qbar_l ≃ C, rank a≥1, cusp π of rank a, and Hecke character χ of its maximal real subfield. Assume regular algebraicity of CG.mk π and PolarizedPair π χ. Row0 Rc supplies a homomorphism r:G(E,Ω)→GL_a(Qbar_l), integer wt and integer multiset family HT indexed by embeddings E→Qbar_l, with Props Rc. Row0b has the identical outer quantifiers and witnesses, replacing only Props by PropsB.

1. Copy continuity and IsSSRep without any change.
2. For every embedding τ, copy the identity HT(τ) mapped to C equals the infinitesimal-character multiset mapped by z↦(a−1)/2−z. Copy the conjugation identity HT(τ∘c)=map(wt−·, HT(τ)).
3. Away from l, keep every place, valuation subring A, IsPlaceOver proof h, Rc h rc and local component σ as in Props.away. Set x=wdOf(h,hl,ι,r), y=rc(algNorm σ). Away.dim gives x.lpDim=y.lpDim; Away.tor gives x=y whenever Tor y and y.mono0. Retain both. For the tame branch, assume IsQpBig(w,y.lpDim), TmW y, Sqf y and y.mono0. Forget the numeric bound to obtain IsQp(w), apply Away.tame0 with the three other assumptions unchanged. This yields x.mono0 and charPol_x(g)=charPol_y(g) for every Weil element g with deg(g)=0. This is Away.big. Do not extend equality to nonzero-degree elements or conclude x=y in the tame case.
4. Above l, retain the quantified local prime P, Ainf AI, Nonempty LocTied, w,A,h, O and all ring/algebra/topology structures, LocBridge Bw and Pst.Induces. Above.crys is copied verbatim: for every spherical local component, crystalline, de Rham and all induced embedding jump identities. Above.nice now assumes ((IsQpBig(w,a) AND TmW y AND Sqf y) OR Tor y) and y.mono0, together with local component and Rc. In the left branch forget the bound to obtain IsQp(w) and retain TmW,Sqf. In the right branch retain Tor, with no large-prime assumption. Apply original Above.nice. Copy de Rham, potentially semistable and all jumps. Apply Away.big to the output comparison for wdAt. This is Props.big.
5. Return the original r,wt,HT and the new record. The original term literally destructures the witnesses of H and returns the same witnesses with k.big Rc. This proves Row0 Rc → Row0b Rc by restriction of hypotheses, not by proving a stronger local comparison.

Tor is the universal commutator-triviality test in Alt:27. Sqf is NOT ordinary square-freeness: for qualifying inertia generators γ (the topological closure condition in Alt:29–33), any root of multiplicity at least 2 must satisfy z^(normV(w)−1)=1. Do not drop the generator condition, or identify this with all roots being simple. TmW and all other source predicates retain their definitions. The rank in AwayB is y.lpDim, while AboveB.nice uses the global rank a.

## Distinguish the alternate direct route
InertCharpoly theorem galois_realisation_of_rank_two (173–190) assumes C:CoreAll, H1:R1 and H2:LocalGlobalCompatibilityAtPlaceClass (Q(w,n)=IsQpBig(w,n)). It constructs Row0b directly; it is not the call in Development.rest. It uses the local correspondence dimension axiom L.dim to identify y.lpDim=a and transport q: IsQpBig(w,y.lpDim) to rank a in the away case; q.isQp supplies the independent IsQp guard. In the above case it duplicates the relevant witness into IsQpBig and IsQp, retains TmW,Sqf or Tor, then uses k4.big. It does NOT assert a=2; the theorem name is not a rank restriction. The actual pinned path is rest→galoisLocalGlobal_of_localGlobalCompatibility→Row0, then Row0.row0b. MainConclusion.everyCharacter_of_row uses h twice in the literature record with recTExists and separately vwin_of_row h. No new downstream theorem is being claimed.

## Separate CoreAll input ledger
OfInputs.Inp is an eleven-field proposition, not a new axiom justified by its name. InputsOf.inp_holds constructs it:
- js: JacquetShalikaRigidity ← PositivityTheory.AdelicQuotientData.jacquetShalikaRigidity.
- gk: GelfandKazhdanDual ← UpperTheory.Gal.AbelianGaloisNormality.gk_holds.
- adm: IrreducibleAdmissibleGL ← UpperTheory.Zero.LLC.Pr.adm.
- len: StandardFunctorsFiniteLength ← PositivityTheory.Tls2.BZGL.standardFunctorsFiniteLength_top.
- exh: LanglandsExhaustionGL ← UpperTheory.Zero.LLC.Pr.exh.
- zel: ZelevinskyPolynomialRing ← UpperTheory.Zero.LLC.Pr.zel.
- gen: GenericUnitaryDualGL ← PositivityTheory.Gud.Fin.genericUnitaryDualGL_holds.
- ac: ArthurClozelStrongTC ← UpperTheory.Gal.AbelianGaloisNormality.strongTC_holds.
- hk: HeckeLAdicCharacterAbove ← Crys.hk.
- alg: AlgebraicCharacterWD ← Crys.alg, combining globalArtinReciprocity_holds, heckeLAdicCharacterDeRham, pst.
- pst: DeRhamPotSemistable ← Crys.pst, GlobalTheory.deRham_potentiallySemistable.

Crys.crys supplies a separate intermediate HeckeLAdicCharacterCrystalline theorem. With the original hypotheses h1,h2,h3, local bridge, induced place and unramified character assumption hu, it obtains local Artin reciprocity, continuous rank-one representation (the unique matrix entry is μ(g)), de Rham from heckeLAdicCharacterDeRham, then potential semistability via pst. The rewrite chain is crystalline ↔ unramified WD (PstLaws.unr_wdAt_iff under the potential semistability evidence), identification by alg, unramified local character via LocLanglands.Test.unr_lpOfChar_iff, and CharCrysModel.isUnram_iff applied to hu. hk combines the de Rham, crystalline and potential semistability statements via heckeLAdicCharacterAbove_of_potSemistable. These are producer references, not independent proofs of all named propositions. CoreAllOfRowStarCore supplies inp_holds to coreAll_of_core_inp. Keep this obligation record visible; no literature theorem is discharged solely by naming it.

## Executed regression and replay
65 text anchors checked against nine actual pinned connector-returned files; all found. Blob SHAs above recorded from connector, not independently rehashed. V8 enumerated ranks 1..50, primes 2..1001 (168 primes), and 16 Boolean combinations of Qp, TmW, Sqf and Tor. All 134400 guard implications succeeded; all 168 rank-one pairs pass the numerical restriction, 7650 higher-rank pairs excluded. This exercises the elementary implication only; it does not evaluate local completions or real WD representations. Strictness negative example rank 2 and prime 3 with Qp true, TmW true, Sqf true, Tor false: original guard true, restricted guard false. This is a propositional negative control, not a constructed automorphic counterexample.

Replay Python (same integer/Boolean test, supplied not executed here):
```python
from itertools import product
from math import isqrt
primes = [p for p in range(2,1002) if all(p%d for d in range(2,isqrt(p)+1))]
cases=rank1=excluded=0
for n in range(1,51):
    for p in primes:
        big=n==1 or 16*n*n<p
        if n==1:
            assert big
            rank1+=1
        elif not big:
            excluded+=1
        for qp,tm,sq,tor in product((False,True),repeat=4):
            weaker_domain=(qp and big and tm and sq) or tor
            original_domain=(qp and tm and sq) or tor
            assert not weaker_domain or original_domain
            cases+=1
assert (len(primes),cases,rank1,excluded)==(168,134400,168,7650)
assert not (2==1 or 16*2**2<3)
```
For source replay git checkout PIN; git hash-object each listed source; check definitions and exact constructor terms at listed lines. No independent Lean execution, exact kernel graph or URT speedup. The local restriction adapter is complete at source-matched level. Producers remain OPEN; no full-proof percentage.

RESUME HERE: follow the actual Crys.alg/hk calls into ThetaCorrespondence/AlgebraicCharacters/AlgebraicCharacterWD.lean and GaloisRepresentations/HeckeDeRham.lean, and the exact heckeLAdicCharacterAbove_of_potSemistable producer. Translate the local character WD normalization, Hodge jumps and precise unramified/crystalline equivalence hypotheses. Coordinate literature lane. Do not repeat the Row0 restriction, CoreAll scope adapter or prime-window induction.
HANDOFF TO: integration, audit, proof editor, literature, theta, character-box. Preserve IsQpBig guard in every downstream parameter-transfer use. No physical files changed.



---

## Appendix 30: specialists/theta_lifts/RUN3_INTEGER_NONVANISHING_AND_GAMMA_GUARD.md
Working-repo blob 4ab7b015e9dd196fcd1ff0609530f3a3cc9ad125. Original validation status retained.

# Theta lifts run 3 — integer nonvanishing and the gamma-pole guard

2026-11-24. RESULT: SOURCE-MATCHED human proof of the actual heckeL_ne_zero helper, plus a CONDITIONAL reconstruction of LInt2 from the Tate functional equation and original triple hypotheses. Exact source declaration GlobalTheory.ThK.Dbl.lInt2 and its supplying functional-equation proof still not located: do not mark that dependency closed. No Lean kernel execution or URT speed claim.

## Continuity and revision
Read the three swarm protocols, AGENTS, docs/RESEARCH_STATE, actual runner log/protocol, continuity, recent peer lane handoffs, integration manuscript spine, theta runs 1 and 2. Prior physical CI PASS 45360853226 (09:20 UTC) is unrelated to RH. Resume the LInt2 obligation left by run 2; no duplication of the induction or the Landau lane's Dirichlet line-one argument. Original source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current main c9883164b0b3d762cee21f889d03d59a53b3ba3b; comparison with previous observation 0e40c084e27c44a3584e271cb14e7dd3bce9aa63 shows extensive Lean source migration, including removed files. Current CloseSph blob b456f1f9f5defbd9056afcb978e2ff2612fb02cd (calls lInt2 at line 1733), ExistsIsHeckeLOfCompleted c07281b01222bb83c5f412abf58d65cccde968fe (definition LInt2 at 157, original heckeL_ne_zero helper no longer in that file), HeckeLNeZeroNat 393f7d432b9214d5373496e471973c4ae84a3eaf. Do NOT merge graphs or infer semantic equivalence. Continue with original pin.

## Source ledger
T=src/Development/WeilBound/ThetaLifts/; D=src/Development/AbelianVarietyTheory/.
- A T/SphericalLattices/SphericalClosure/CloseSph.lean 9a15ec479fb007975f15b6df7fe5fe46615e4f8f, lines 102 and 126.
- B T/LatticeBasics/ExistsIsHeckeLOfCompleted.lean a9870cbfacc6ffa1c17c95759232ef2ffff16239, 17–72,74–103,105–127,129–160,162–173,175–179.
- C T/LatticeBasics/GoodNe.lean db5a77ed007a052eb89fe1419815d2f2d25588f4, 20–30.
- D1 D/BlockTheory/DivisorBase/WeilTensorModels.lean 4d0d94fd3fd9368e5428c05402979d6dd5123b4d, 332–395.
- E D/BlockTheory/DivisorBase/CompletedLStripBounds.lean 1bdbf18d79ab19073e0c72867a8a2e75b66c3269, 12–17,32–49.
- F D/PublishedTheorems/Divisors₂/HeckeTateFunctionalEquationCM.lean a5ffc620467a060d7b31be9eaf198dedb081d180, 205–229,244–249.
- G D/Proofs/DivisorProofs/HeckeLNeZeroNat.lean 998eeb6c8239496943757f7e742548dd94e39361, 10–21.
- H D/PublishedTheorems/Divisors₂/IsCMTypeEmbedding.lean f903a88f78de55eb9654f028c747fa01cbf96cbf, 15–32.
- I D/Proofs/AdelicLatticeProofs/EulerProductNeZeroOneOfEntire.lean 959b1b46ae3f86d2ed5010941ca5012452d9607a, 95–end.
- Additional inspected: D/Proofs/TwistedOperators/HeckeLEntireAndNonzeroAtOneHolds.lean c01065ba01809142bda080d78a6bf1731d17a1ef; T/LatticeBasics/BotAsm.lean de3e30d43431c4ea373b47a59dc6aeaa4371d70a; src/GroundTheory/GlobalFields/TateThesis/GlobalZeta.lean 22e04bacda7799db391ba0b8e6b547d55cbd7afa.

## 1. The exact target, not RH
Fix F,E number fields with Algebra F E, sigma, base B, ranks a,a', geometry G, characters X, Weil representations om,om', and h:IsTriple B G X om om'. Keep all field/typeclass, CM, geometry, ramification, representation and character conditions. Put d=a+a' and nu=X.alpha/X.beta. B LInt2 states:
For each chi in the two-element set {nu,nu^(-1)}, there exists an entire f_chi:C→C such that f_chi(s)=charL chi empty s on Re(s)>1 and f_chi(z)≠0 for every integer z with -d<=2z. This is the UNCOMPLETED Hecke L-function, despite the variable Lambda in LInt2. No claim of nonvanishing for all complex points in a half-plane follows from this integer-only theorem.

A explicitly uses lInt2 to supply LInt2 to nonZeroBottom_of_doubling_integral. The declaration body of lInt2 is not in B (B ends after the definition), and is not in the same file A. Exact GitHub search and the indexed search both returned no hits, despite known calls; tree of ThetaLifts has 828 entries; inspected candidate import paths (including BotAsm, HodgeTateFromSandwich, GoodNe, NormZeta, EulerHalf, EndCore, PolZero, BadFactor, FinLevel, ConstHecke, LatticeBasics and core candidate paths), not an exhaustive transitive source scan. Failure of search is NOT evidence that the declaration is absent or is an axiom.

## 2. Actual helper B: converting completed to uncompleted entire function
Given an entire completed function Lambda for unitary HChar chi with infinity exponents n_i, E defines
  A_n(s)=product_i [2 (2 pi)^(-(s+|n_i|/2)) Gamma(s+|n_i|/2)].
IsCompletedL means entire and, for Re(s)>1, Lambda(s)=A_n(s) times the Euler product (with an explicitly convergent HasProd witness).
B exists_isHeckeL_of_completed constructs L(s)=Lambda(s) product_i [(2(2 pi)^(-(s+|n_i|/2)))^(-1) Gamma(s+|n_i|/2)^(-1)]. This is entire: the constant-base power is nonzero and holomorphic, and reciprocal Gamma is entire, including at its zeros. On Re(s)>1 every Gamma argument has positive real part; cancellation of the nonzero factors recovers the convergent Euler product, which is exactly IsHeckeL.

F completed_eq_mul proves the opposite identity Lambda(s)=A_n(s)L(s) for every s where no shifted argument is a nonpositive integer. It first extends the identity for reciprocal archFactor times Lambda to the whole plane by the identity theorem and then multiplies by the nonzero archFactor at an allowed s. Do not cancel Gamma at a pole. B shift_ne verifies that 2z+|n_i|>0 for integer z excludes all arguments -j (j a natural number): equality would give 2z+|n_i|=-2j<=0.

## 3. Actual helper B: the integer nonvanishing reflection
B heckeL_ne_zero takes explicitly hFE:GlobalTheory.Published.HeckeTateFunctionalEquation, a totally complex number field, finite CM embedding type phi, unitary HChar chi, HasInf chi phi n, and at least one nonzero n_i. It returns an entire uncompleted L, with L(z)≠0 for every integer z satisfying ALL 2z+|n_i|>0.
H supplies unitary inverse, negated infinity exponents, and a finitely supported exact conductor exponent family for chi^(-1). Invoke hFE on chi^(-1), exponent -n and that family. This gives completed functions Lambda' for chi^(-1), Lambda for chi (using inv_inv and neg_neg), with
  Lambda'(s)=archEps(-n) finEps(chi^(-1),conductor,s) Lambda(1-s).
Use section 2 twice to obtain L and L' and their entire Euler product agreements.

For z>=1, G IsHeckeL.ne_zero_nat gives L(z)≠0. At z>1 this is the exponential Euler-product identity, not a merely termwise nonzero infinite product. At z=1 G invokes the entire regularization of the Dedekind zeta product, coefficient bound <=1, summability for real part >1, nonempty prime index and the theorem I eulerProduct_ne_zero_one_of_entire. Entirety of L is an explicit premise. The proof of I and the regularized Dedekind zeta producer remain separate dependencies; do not replace by convergence of Euler product at 1.

For z<=0, t=1-z>=1, so L'(t)≠0 by G for the inverse character. All t+|-n_i|/2>0. F completed_eq_mul at t gives Lambda'(t)≠0 (each archimedean factor and L' nonzero). Rewrite Lambda'(t) using hFE, 1-t=z, and F completed_eq_mul at z using the supplied strict Gamma guard. This yields a nonzero product with rightmost factor L(z), hence L(z)≠0. The exact source extracts nonzeroness of the right factor twice; it does not divide by an unproved root number. This is an ordinary functional-equation reflection of INTEGER values to integers >=1; it does not cross to or imply nonvanishing throughout the critical strip.

The source F defines hFE as a proposition with exact finitary conductor and epsilon factors, and entire completed functions satisfying the equation for ALL complex s. The helper assumes that proposition; the file name PublishedTheorems is not proof of its availability. The actual supplier on the lInt2 route is still an unresolved source-provenance obligation, not an identified axiom. Historical Tate theory is relevant, but no independently inspected primary-text-to-formal-equation normalization equivalence is claimed here.

## 4. Conditional adapter from the original geometry to LInt2
This is our mathematical reconstruction from the above actual source lemmas, NOT an assertion that the unlocated source body of lInt2 uses precisely this sequence.

From C, nu is Hecke (continuity and trivial on diagonal principal units survive the quotient). Its exponent at w is m(w)=B.malpha(w)-B.mbeta(w), by multiplying archimedean character powers and the nonzero phase base. The inverse character is also Hecke with exponent -m, by continuity of inversion, triviality on principal units, and reciprocal of the finite product of integer powers. All characters remain circle-valued, not arbitrary nonunitary characters.

D1 Geo.IsGood.kappa supplies the crucial bound m(w)>d at EVERY infinite place. In particular m(w)>0 and the finite type of infinite places of a number field is nonempty; hence the nonzero exponent premise. D1 Base.IsGood.cm supplies the CM extension, with E totally complex. B isCMType_emb verifies that choosing the B.emb(w) over each real place of F enumerates exactly one embedding up to conjugation: restriction to F identifies the place and the quadratic CM extension has exactly two embeddings over it, conjugate to each other. B exists_hchar_unitary constructs H via the inverse tensor-adele equivalence followed by chi and Circle.toUnits, verifies continuity, principal-unit triviality and matching local values, and transfers infinity exponents. It is not enough merely to assert that chi extends to some global HChar without preserving local factors. For chi=nu or nu^(-1), the resulting n(w)=+m(w) or -m(w) and |n(w)|=m(w)>d.

Now for ANY integer z with -d<=2z, for EVERY w,
  2z+|n(w)| >= -d+m(w)>0.
This is precisely the strict Gamma guard in B heckeL_ne_zero, including z=0 and negative integers. Thus assuming hFE we obtain entire L with all those integer values nonzero. B eq_charL transfers the right-half-plane identity from the HChar L-function to the target charL with empty exclusion set: local character equality gives unramified equivalence and equality of uniformizer values, hence identical factor families; uniqueness of convergent products gives equality. Apply the argument separately to the two choices chi; the result has the full quantifier pattern of LInt2. No new geometric or arithmetic inequality is required. The remaining source-specific gap is locating lInt2's actual proof and hFE producer and confirming no hidden additional hypotheses.

The strict inequality is mathematically essential to this argument: for even d and m=d, take z=-d/2; the argument of Gamma becomes zero. Equality of the weight bound cannot justify gamma cancellation. This is a negative control for the GUARD, not a counterexample to the original admissible theorem. In run 2, the shifted doubling arguments z=d/2-i satisfy -d<=2z by n<d, so section 4 supplies exactly the nonvanishing needed there conditional on hFE. Thus we have a local explanation of why geometry keeps the negative-integer factors away from trivial zeros. No implication for arbitrary Hecke or Dirichlet L-functions at negative integers.

## 5. Executed evidence and replay
In tool V8, refetched 9 immutable blobs, matched connector-reported Git blob SHA and 37 exact source substring anchors. Executed 408000 nonnegative-right integer cases (z>=1), 106080 reflected cases (z<=0), 51 strict-bound negative controls for both signs of the exponent. These are exact bounded integer checks, not an analytic proof or Lean run. General inequalities above establish the unbounded guard; no numerical tests can validate the analytic functional equation. Source checks preserved original hypotheses; conditional adapter explicitly retains hFE. No Lean executable in local environment. No exact kernel edge exported. Replay against pinned checkout:
```python
from pathlib import Path
import hashlib
T="src/Development/WeilBound/ThetaLifts/"
D="src/Development/AbelianVarietyTheory/"
rows=[
(T+"SphericalLattices/SphericalClosure/CloseSph.lean","9a15ec479fb007975f15b6df7fe5fe46615e4f8f",[(102,"GlobalTheory.ThK.Dbl.LInt2 := GlobalTheory.ThK.Dbl.lInt2"),(126,"nonZeroBottom_of_doubling_integral h_GlobalTheory_ThK_KReal h_GlobalTheory_ThK_Dbl_LInt2")]),
(T+"LatticeBasics/ExistsIsHeckeLOfCompleted.lean","a9870cbfacc6ffa1c17c95759232ef2ffff16239",[(17,"theorem exists_hchar_unitary"),(74,"theorem isCMType_emb"),(105,"theorem exists_isHeckeL_of_completed"),(129,"theorem shift_ne"),(134,"theorem heckeL_ne_zero (hFE"),(147,"hL.ne_zero_nat hu"),(149,"hL'.ne_zero_nat hu'"),(158,"rw [fe, show 1 -"),(160,"exact right_ne_zero_of_mul (right_ne_zero_of_mul hΛ')"),(162,"theorem eq_charL"),(175,"def LInt2 : Prop")]),
(T+"LatticeBasics/GoodNe.lean","db5a77ed007a052eb89fe1419815d2f2d25588f4",[(20,"theorem isHecke_nu"),(24,"theorem hasExp_nu"),(24,"B.mα w - B.mβ w"),(30,"zpow_sub₀")]),
(D+"BlockTheory/DivisorBase/WeilTensorModels.lean","4d0d94fd3fd9368e5428c05402979d6dd5123b4d",[(342,"def Chars.ν (X : Chars F E) : Chr F E := X.α / X.β"),(363,"kappa : ∀ w, ((a + a' : ℕ) : ℤ) < B.mα w - B.mβ w"),(362,"even : Even (a + a')"),(388,"structure IsTriple")]),
(D+"BlockTheory/DivisorBase/CompletedLStripBounds.lean","1bdbf18d79ab19073e0c72867a8a2e75b66c3269",[(12,"def archFactor"),(15,"def IsCompletedL"),(16,"Differentiable ℂ Λ ∧ ∀ s : ℂ, 1 < s.re")]),
(D+"PublishedTheorems/Divisors₂/HeckeTateFunctionalEquationCM.lean","a5ffc620467a060d7b31be9eaf198dedb081d180",[(205,"theorem completed_eq_mul"),(223,"entire_eq_of_halfPlane"),(244,"def HeckeTateFunctionalEquation : Prop"),(249,"Λ s = archEps n * finEps χ a s * Λ' (1 - s)")]),
(D+"Proofs/DivisorProofs/HeckeLNeZeroNat.lean","998eeb6c8239496943757f7e742548dd94e39361",[(10,"theorem IsHeckeL.ne_zero_nat"),(12,"rcases hs.eq_or_lt"),(13,"dedekindZeta_eulerProduct_mul_sub_one_entire"),(15,"eulerProduct_ne_zero_one_of_entire"),(21,"Complex.exp_ne_zero")]),
(D+"PublishedTheorems/Divisors₂/IsCMTypeEmbedding.lean","f903a88f78de55eb9654f028c747fa01cbf96cbf",[(15,"theorem exists_exponents"),(25,"theorem hasInf_inv"),(30,"theorem isUnitary_inv")]),
(D+"Proofs/AdelicLatticeProofs/EulerProductNeZeroOneOfEntire.lean","959b1b46ae3f86d2ed5010941ca5012452d9607a",[(95,"theorem _root_.GlobalTheory.eulerProduct_ne_zero_one_of_entire")])
]
count=0
for path,sha,anchors in rows:
    b=Path(path).read_bytes()
    assert hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==sha,path
    lines=b.decode().split("\n")
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        count+=1
assert count==37
positive=reflected=controls=0
for d in range(0,101,2):
    for m in range(d+1,d+41):
        for z in range(-d//2,101):
            for e in (m,-m):
                assert 2*z+abs(e)>0
                if z>=1: positive+=1
                else:
                    assert 1-z>=1 and 2*(1-z)+abs(-e)>0
                    reflected+=1
    assert 2*(-d//2)+abs(d)==0
    controls+=1
assert (positive,reflected,controls)==(408000,106080,51)
print("source anchors",count,"integer guards",positive,reflected,"negative controls",controls)
```

This Python replay is supplied, not executed against a local checkout; actual tool checks used pinned connector text and blob IDs plus V8 integer loops.

RESUME HERE: ask dependency/acceleration lane for actual pinned source declaration index or use git grep -n -E 'theorem lInt2|def lInt2|lemma lInt2|theorem GlobalTheory\.ThK\.Dbl\.lInt2|HeckeTateFunctionalEquation_holds' PIN -- src (GitHub indexed searches failed). Obtain exact definition file and actual hFE supplier, verify the adapter above against its body and prove the matching exponent inverse step. Separately trace the line-one regularization producer G→I with literature lane, then resume base scalar polZero_of; do not redo Gamma guard or induction. If source not yet accessible via index, proceed with polZero_of while retaining lInt2 producer OPEN.
HANDOFF TO: proof editor, integration, formal audit, literature, Landau and dependency lanes. Use integer-only nonvanishing chapter conditionally; do not report exact lInt2 proof extracted or Tate functional equation validated. No physical queue or gates changed.



---

## Appendix 31: specialists/literature_provenance/RUN3_DIVIDED_POWER_FACTORIZATION_AND_GLUE.md
Working-repo blob f5b8abca724cad7b9fa466be73cb59c4ba641fd6. Original validation status retained.

# RUN3 — divided-power nilpotence factorization and two-step lifting

2026-11-24. RESULT: DONE for the local algebraic factorization, exponent induction, and source-matched conditional gluing arguments. PARTIAL for the underlying square-zero geometric producers, library proofs and complete RH. No independent Lean kernel execution. Zero new hypotheses added; all supplied assumptions retained. No URT speed claim.

## Continuity and provenance

Read swarm protocol, handoff, expansion, AGENTS, research state, continuity, runner log/protocol, latest CI and peer notes (integration, editor, dependency, structure, acceleration, kernel, prime, Landau, theta, Galois, character-box, positivity). Physical CI PASS 45364009178 (09:39:34 UTC) is not RH validation. Continue RUN2_GROTHENDIECK_DEFORMATION_PROVENANCE, not other lanes' current arithmetic tasks. Pin `40e56bab026552e089d7afcfeff08d2defb9c005` in leanprover-community/riemann-hypothesis. Source tree API response truncated; all files below individually fetched at the pin. Observed new head `bde3cce9fc2feaf9a39c7f37711cb26c7c44fd1b`; four former files no longer at their old paths. They have been consolidated into AbelianLiftingOfDeRhamUnobstructed.lean (head blob 5b16826bb38b1b907d24526e461f71510856654f, clump member markers and matching declarations at lines 230, 726, 928, 1908). PrimitiveCrystalHodgeLiftClasses head blob 4ce12845197fc458785384d112028a2ab0ff744b has NilExp at line 99. 76/77 checked pinned source lines occur literally somewhere in the corresponding head file (not a proof of semantic equivalence). Do not merge versions.

## 1. The exact nilpotence hypothesis

Fix a commutative ring R, ideal I, divided powers γ on I and a surjective ring homomorphism π:R→R₀ whose kernel is I. For a finite list L of pairs (r_i,x_i), r_i nonnegative integers and x_i∈I, write w(L)=Σr_i and p(L)=∏γ_{r_i}(x_i). Empty product = 1. NilExp(γ,m) means p(L)=0 for EVERY such list with w(L)≥m. The equivalence IsNilDP γ ↔ ∃m, NilExp(γ,m) is definitional (PrimitiveCrystalHodgeLiftClasses L59–62). This is a uniform bound on mixed products, not merely pointwise vanishing of high powers or ordinary nilpotence of I. Do not weaken it to either. No prime or Noetherian assumption here.

## 2. Construct the square-zero kernel explicitly

Assume NilExp(γ,N+2). Let J be the ideal generated by all p(L) with w(L)≥N+1. This is precisely DPStep.idl γ (N+1), ExistsIsStepNilExp L17–19,71.

(a) J⊆I: at least one r_i is positive, since N+1≥1. Its divided power belongs to I and I absorbs the rest of the product. Extend from generators to the ideal (L21–33,73–76).

(b) IJ=0: for a∈I prepend (1,a) to the list of a generator. The weight rises to at least N+2, and γ₁(a)=a. Thus a p(L)=0. By distributivity and R-linearity extend to J. Since J⊆I this also gives J²=0. This is L78–98. Crucially J can be zero; the induction only needs a bound decrease, not strict decrease of nonzero ideals.

(c) For b∈J and k≥2, γ_k(b)=0. First let b=p(L). Choose a positive index r and write b=Pγ_r(x), with P the other factors; leading degree-zero factors are units and may be removed. The DP axioms imply γ_k(b)=P^k c γ_{kr}(x), where c is the integer composition coefficient. The list obtained by replacing r with kr has weight w(L)+(k−1)r≥N+2. Consequently Pγ_{kr}(x)=0 and hence γ_k(b)=0 (no division by c, k!, or any integer). This is L35–63. Extend to J by span induction: scalar multiples use γ_k(ab)=a^kγ_k(b), zero is immediate, and for a sum use γ_k(b+b')=Σ_{i+j=k}γ_i(b)γ_j(b'). Terms with i≥2 or j≥2 vanish by induction. The sole other possibility for k≥2 is i=j=1, and bb'=0 by (b). This exactly explains L100–127. Thus J is a sub-DP ideal (L129–136), and its induced divided powers are the canonical square-zero powers: degree 1 identity, higher degrees zero. Ordinary J²=0 on its own would not certify that last compatibility.

(d) Set R₁=R/J, ρ the quotient, I₁=ρ(I), γ₁ the descended divided powers. Since J⊆ker π, there is a unique π₁:R₁→R₀ with π₁ρ=π. Both legs are surjective, kerρ=J, kerπ₁=I₁. The DP morphisms are ρ:(I,γ)→(I₁,γ₁) and id_R:(J,divided₂)→(I,γ). To prove NilExp(γ₁,N+1), take any list of elements of I₁ and lift each individually to I, keeping its degree. The quotient DP law preserves its product. The lifted product has weight≥N+1 and belongs to J, so its image is zero. This gives every field of IsStep: nil, nil₁, surj, surj₁, comp, ker, kerJ, ker₁, dp, dpJ (definition L64–75). The construction is internal in ExistsIsStepNilExp L142–200; not a postulated literature theorem. It does use Mathlib DP axioms, quotient constructions and ideal span facts.

## 3. Object lifting glues across the factorization

Keep all assumptions from RUN2: AbelianDeRham P, AbelianUnobstructed U, IsStep S, object lifting L₂ for the canonical square-zero extension R→R₁ and L₁ for R₁→R₀, a specified reference lift A' of A₀ over R of smooth relative dimension g and admissible F⊆HdR A'. No new unconditional lifting assertion.

Let A₁ be the intermediate reduction of A' with compatible group pullbacks. By group_scheme_divided_power_lift_tower transport F to admissible F₁ on A₁. Apply L₁ to obtain B₁ with the required intermediate crystal filtration. By U lift B₁ to an abelian scheme C over R, and recover relative dimension g from nilpotent reduction. Both A' and C have special fiber A₀. Rigidity P supplies linear bijections u'=crysToDR(γ,A') and u_C=crysToDR(γ,C) from the same full crystal. Put E=(u')^{-1}(F), F_C=u_C(E). F_C is a direct summand because F is. The remaining admissibility clause relative to B₁ uses the equality of correspondences in corr_crysToDR_step_iff (L20–42): the two pullback composites agree on primitive elements, and surjectivity of the full crystal pullback makes equality on their images sufficient. Consequently membership in Fil B₁ is equivalent to correspondence with an element of E, hence to correspondence with an element of F_C. This uses the exact F₁ property and the bijection from intermediate crystal to HdR B₁. Apply L₂ to C,F_C to obtain A lifting B₁ with desired square-zero filtration. Compare the two crystal reductions for A and C via deRham_crystal_two_reductions_agree. Their map N is definitionally the same (L105); a crystal element d lies in the final filtration iff u_C(d)∈F_C iff d∈E, the last equivalence using injectivity of u_C. This proves the required filtration on A, not only existence of a lift. Sources LiftAbelianSchemeAlongSquareZeroFactorization L44–111, wrapper Statement L13–16. Underlying geometric transport and comparison lemmas remain open for expansion.

## 4. Homomorphism lifting and uniqueness glue separately

Keep AbelianDeRham P, S, LiftHom H₂,H₁, two specified lifts A,B of A₀,B₀ (dimensions may differ), and f₀ satisfying the original full-crystal filtration preservation condition. Reduce A,B to A₁,B₁ with compatible pullback squares. Define redSub as the submodule of intermediate HdR elements corresponding to some member of the top filtration (LiftHomOfIsStep L32–45); surjectivity of ρ is needed for scalar closure. The middle-filtration comparison says every d₁∈liftFil(γ₁,A₁) corresponds to a d∈liftFil(γ,A). Apply the original hypothesis to d, use naturality of push for f₀, then the reverse comparison for B. Thus f₀ preserves the intermediate filtration. H₁ produces the unique intermediate group homomorphism f₁.

The two-reduction comparison provides NA, NB with filtration compatibility; NA.pull is bijective, so its linear dual map is surjective. For any e in the first square-zero filtration of A₁ choose d mapping to e; comparison implies d is in the full filtration. The hypothesis puts push(f₀)d in the full B filtration. The commutative-square identity dualMap_push (L59–74) states that applying NB.pull.dualMap to push(f₀)d equals push(f₁) applied to NA.pull.dualMap d. Thus f₁ preserves the square-zero filtration. H₂ produces f lifting f₁, and composition of the two reduction squares gives the original reduction equation. For uniqueness any competing group hom f' reducing to f₀ restricts to f₁' by the intermediate pullback universal property; the restriction is again a monoid hom by isMonHom_of_grpPullback. The equality on special fibers follows by pullback extensionality, giving f₁'=f₁ by H₁ uniqueness, then f'=f by H₂ uniqueness. This proves the original unique-existence statement. Source L78–123. Neither filtration guard nor group-hom condition can be deleted.

## 5. Induction and explicit assumption ledger

The induction assertion at n is universally quantified over rings, ideals, divided powers and quotient maps satisfying NilExp(γ,n+1). At n=0, each a∈I equals γ₁(a)=0 by the singleton list, so I=0 and γ equals the canonical DP on the zero ideal (degree 0,1 and ≥2 cases). Apply SqLifting. At successor use §2 with N=n, apply SqLifting to ρ and the IH to π₁, then §3 and §4 glue. For an arbitrary IsNilDP witness m, monotonicity converts NilExp(γ,m) to NilExp(γ,m+1), then instantiate the induction at m. This avoids assuming a minimal positive exponent. Source AbelianLiftingOfDeRhamUnobstructed L24–70.

Ledger:
- NilExp, IsStep, SqLifting: definitions of propositions/record, not axioms.
- exists_isStep_nilExp: internal proved theorem, using DP laws and Mathlib quotient/span facts. Local mathematical argument reconstructed above.
- liftObj_step and liftHom_of_isStep: internal proved conditional implications; explicit P,U,S and both leg lifting obligations as appropriate.
- liftAbelianScheme_along_squareZero_factorization: proved wrapper of liftObj_step; no independent external hypothesis.
- abelianLifting_of_sqLifting: internal proved conditional implication with P,U,SqLifting.
- abelianLifting_of_schemeLifts (L72–78): supplies SqLifting from squareZeroLifting_of_noetherian_case, with grothendieckMessingLiftAbelianScheme_of_squareZero and grothendieckMessingLiftHomomorphism_of_squareZero using AbelianSchemeLifts; these are unresolved deeper producers, not erased assumptions.
- Geometric dependencies retained: exists_intermediate_grpPullback_abelianScheme, group_scheme_divided_power_lift_tower, smoothOfRelativeDimension_of_nilpotent_reduction, deRham_crystal_two_reductions_agree, hodgeFiltration_middle_eq_reduction_of_top, isMonHom_of_grpPullback. Their actual proof bodies remain to be audited; no inference from names that they are external axioms or independently verified. Prior RUN2 historical provenance remains valid as a statement comparison, not semantic identity. In particular the uniform mixed-product nilpotence in this formal source must be preserved when comparing to locally nilpotent historical thickenings.

## 6. Executed reproducibility checks

Fetched 6 pinned source files, verified connector-reported blob IDs against the pinned ledger, checked 77/77 exact line anchors, no failures. These are source identity/anchor tests, not proof execution. Current head line occurrence is a separate weak textual check. Replay the JSON below with a Git checkout of upstream: for each path run `git rev-parse 40e56bab026552e089d7afcfeff08d2defb9c005:PATH` and compare sha, then `git show 40e56bab026552e089d7afcfeff08d2defb9c005:PATH` and assert checks' text occurs on the indicated 1-indexed line. Do not use current head for replay.

```json
[
  {
    "path": "src/Development/AbelianVarietyTheory/Definitions/Divisors/PrimitiveCrystalHodgeLiftClasses.lean",
    "sha": "33df8f02d248bc33f240a1fe1cee40d8e68d061e",
    "checks": [
      [
        59,
        "def NilExp"
      ],
      [
        60,
        "N ≤ (l.map Prod.fst).sum"
      ],
      [
        62,
        "Iff.rfl"
      ],
      [
        64,
        "structure IsStep"
      ],
      [
        70,
        "comp : π₁.comp ρ = π"
      ],
      [
        74,
        "dp : IsDPMorphism κ κ₁ ρ"
      ],
      [
        75,
        "dpJ : IsDPMorphism (divided₂ hJ) κ"
      ],
      [
        77,
        "def SqLifting"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsIsStepNilExp.lean",
    "sha": "6d7a85934f2d8e9f934ee8c8ff6d15093097e522",
    "checks": [
      [
        17,
        "def prods"
      ],
      [
        21,
        "theorem prod_mem"
      ],
      [
        35,
        "theorem dpow_prod_eq_zero"
      ],
      [
        51,
        "P * κ.dpow (n * p.1) p.2 = 0"
      ],
      [
        61,
        "κ.dpow_mul hm, κ.dpow_comp"
      ],
      [
        71,
        "def idl"
      ],
      [
        73,
        "theorem idl_le"
      ],
      [
        78,
        "theorem mul_idl_eq_zero"
      ],
      [
        94,
        "theorem idl_sq"
      ],
      [
        100,
        "theorem dpow_idl"
      ],
      [
        112,
        "κ.dpow_add"
      ],
      [
        123,
        "κ.dpow_one hxI"
      ],
      [
        129,
        "theorem isSubDPIdeal"
      ],
      [
        142,
        "theorem GlobalTheory.SqLift.exists_isStep_nilExp"
      ],
      [
        148,
        "set J := idl κ (N + 1)"
      ],
      [
        152,
        "Ideal.Quotient.lift J π hz"
      ],
      [
        153,
        "have hnil1"
      ],
      [
        173,
        "DividedPowers.Quotient.dpow_apply"
      ],
      [
        176,
        "Ideal.subset_span"
      ],
      [
        188,
        "DividedPowers.Quotient.isDPMorphism"
      ],
      [
        200,
        "squareZeroDividedPowers_dpow"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/LiftAbelianSchemeAlongSquareZeroFactorization.lean",
    "sha": "7666b758a9197e26b40ae7b4c99792ebfde0ea71",
    "checks": [
      [
        20,
        "theorem corr_crysToDR_step_iff"
      ],
      [
        27,
        "Function.Surjective (liftMor κ h).pull"
      ],
      [
        44,
        "theorem liftObj_step"
      ],
      [
        56,
        "exists_intermediate_grpPullback_abelianScheme"
      ],
      [
        58,
        "group_scheme_divided_power_lift_tower"
      ],
      [
        60,
        ":= L₁"
      ],
      [
        61,
        ":= U"
      ],
      [
        74,
        "set E := F.comap"
      ],
      [
        75,
        "set FC := E.map"
      ],
      [
        76,
        "have hFCa : IsAdmissible"
      ],
      [
        98,
        ":= L₂"
      ],
      [
        102,
        "deRham_crystal_two_reductions_agree"
      ],
      [
        105,
        "N' = N := rfl"
      ],
      [
        111,
        "bC.1 e"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/LiftHomOfIsStep.lean",
    "sha": "db8833d5ff92a4c382da7d7c487303276812fccf",
    "checks": [
      [
        32,
        "def redSub"
      ],
      [
        47,
        "theorem mem_liftFil_iff"
      ],
      [
        53,
        "hodgeFiltration_middle_eq_reduction_of_top"
      ],
      [
        59,
        "theorem dualMap_push"
      ],
      [
        78,
        "theorem liftHom_of_isStep"
      ],
      [
        89,
        "have hf₁"
      ],
      [
        93,
        "GrpMor.Corr.push"
      ],
      [
        94,
        ":= H₁"
      ],
      [
        100,
        "dualMap.surjective"
      ],
      [
        101,
        "have hf₂"
      ],
      [
        108,
        "dualMap_push"
      ],
      [
        110,
        ":= H₂"
      ],
      [
        117,
        "isMonHom_of_grpPullback"
      ],
      [
        122,
        "uf₁ f₁'"
      ],
      [
        123,
        "uf f'"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianLiftingOfDeRhamUnobstructed.lean",
    "sha": "271c5c0d12c40d2230c3df521256f39e9ebfc0f4",
    "checks": [
      [
        24,
        "theorem NilExp.mono"
      ],
      [
        28,
        "theorem NilExp.eq_zero"
      ],
      [
        34,
        "theorem NilExp.eq_sqDP"
      ],
      [
        49,
        "theorem abelianLifting_of_sqLifting"
      ],
      [
        53,
        "NilExp κ (n + 1)"
      ],
      [
        56,
        "induction n"
      ],
      [
        59,
        "NilExp.eq_sqDP"
      ],
      [
        63,
        "exists_isStep_nilExp"
      ],
      [
        64,
        "hS R J hJ R₁"
      ],
      [
        65,
        "ih R₁ I₁"
      ],
      [
        66,
        "liftAbelianScheme_along_squareZero_factorization"
      ],
      [
        67,
        "liftHom_of_isStep"
      ],
      [
        69,
        "isPDNilpotent_iff"
      ],
      [
        70,
        "hN.mono (Nat.le_succ N)"
      ],
      [
        75,
        "squareZeroLifting_of_noetherian_case"
      ],
      [
        77,
        "grothendieckMessingLiftAbelianScheme_of_squareZero"
      ],
      [
        78,
        "grothendieckMessingLiftHomomorphism_of_squareZero"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/LiftAbelianSchemeAlongSquareZeroFactorizationStatement.lean",
    "sha": "4dc154ca02c9d315929fe91e48adb9b137ce0ddb",
    "checks": [
      [
        13,
        "theorem _root_.GlobalTheory.T.liftAbelianScheme_along_squareZero_factorization"
      ],
      [
        16,
        "GlobalTheory.SqLift.liftObj_step"
      ]
    ]
  }
]
```

RESUME HERE: expand the exact producer squareZeroLifting_of_noetherian_case in SquareZeroLiftingOfNoetherianCase.lean at the pin; inspect its finite-generation/Noetherian descent, object and hom lifting branches, and identify which assumptions are discharged internally rather than presumed. Then trace the geometric filtration comparison producer if not claimed elsewhere. Do not repeat the nilpotent factorization or gluing. HANDOFF TO: proof editor, integration, formal audit, positivity geometry, Galois. Attach §§1–5 to RUN2 as the internal proof of its lifting induction. No physics queue or gates modified.



---

## Appendix 32: specialists/positivity_geometry/RUN3_CHOW_HEIGHT_SELF_INTERSECTION_EQUALITY.md
Working-repo blob 13bdd3f2b8bbaf70a7df459dcf9d20aafc567687. Original validation status retained.

# Geometry run 3 — exact shifted Chow-height/self-intersection identity
2026-11-24. RESULT: SOURCE-MATCHED reconstruction of the local equality and its downstream counting-volume normalization. Full RH translation PARTIAL; no independent Lean kernel execution.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, actual cathedral_arf_runner research protocol/log, continuity, latest CI summary (PASS 45364009178, 043409c, 09:39:34 UTC; not RH validation), geometry RUN1/RUN2 and current integration, literature, kernel, Galois, theta, character-box, Landau, prime-window and acceleration handoffs. No physics queue or gates changed. Source pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream main 73958da58a8a4d1f61b789745c5444baf6247cae, original VolumeLeSelfIntersection path returns 404 there; no cross-revision equivalence asserted.

## Source ledger
H = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/
T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
U = src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/
P = src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/
- T/TopCovolSlim2Use.lean 0e1bad41f4b165c0d9b1693f419530309e1da5ba (21)
- H/ChowFormHeightComparison.lean 8f6936bdac95711b138b0ee63cf5928518c89503 (9–12)
- H/WeilHeightInequality.lean 445fb6fde913f6ea31e0c003940d4ce96ed71a38 (10–31)
- H/VolumeLeSelfIntersection.lean 091429a5c3e58ed87fbeb6a7ef780f70c1459377 (10–65)
- U/VuSelfA.lean 69041d0d3e50e256e67646aa1b29b84a2336dc5d (13–64)
- U/VuSelfKnownTheorem.lean bf0cd8253466990e7c7e54b1f7a9fa726f5d3a44 (12–25)
- U/VuSelfB.lean 5c12211152312169a6112eba4666eebe29930ab1 (43–82,356 onward)
- H/VolumeLineBundleLe.lean 084f70a82c1d7335082f3284bf0620bcef38be05 (11–22)
- P/CountingVolumeLeSelfIntersectionNefHermitianBund.lean 95704f47d29ea425e661d65de614602ae43b81ae (13–39)
Additional source inspection:
- T/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24: final every_character_of_literature_of_vWin calls topCovolSlim2_use_alt_alt.
- H/VolumeEstimateHypotheses.lean e93eb83a9cef1478cbec92f522522b2fa3a33a55
- H/ExistsNefModelOfImage.lean 3c6930f48506b89563f7736aa44378fea26588cb
- H/SmallSectionsInjective.lean d8879d8a7eda4debcda1494cd18864c0302c24ba
- H/WeilHeightComparisonOfDegreeBound.lean 08db56669223ef219bb1b386f66b280e8d8b7245
- H/WeilHeightArchimedeanContribution.lean 8594fde18897fec5e51d38efa44601913999814f
- H/FubiniStudyChowHeightFormula.lean fc705016fa42c1f1d5ed1d878b4fad0515b35205
- U/VuSelfOf.lean e3b80e5347e532456b01b6a55fe094d34a2bc420 (parallel older Hypotheses2 version, not the chosen actual producer).
- U/HeightBoundOfHyp.lean 6fb0b65fcdbd0a601b83b60ab98592604c62cb05 (parallel older wrapper).
- src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/HermitianSectionsHeightBound.lean 52a0992a303be0c221c7497696f4263f49520258.
- src/Development/WeilBound/CoreStatements/NefModelVolumes/SelfInterBound.lean bd066f6f6141c85e11cd24f52815c1763afd93c6 (older Hypotheses2 statement).

## 1. Exact target, all hypotheses
For every number field K, K-vector space V with additive group, O_K-module and compatible scalar tower, field Omega with K-algebra structure, family Nm of real norms indexed by embeddings K→C, O_K-submodule W, K-linear evaluation ev:V→Omega, D natural, integral universe-0 scheme X with p:X→Spec O_K, Hermitian line bundle L over p, field map psi:Omega→X.functionField, section family s:W→L.B.Sec, and real t,a, assume the published Hodge bundle record hP; all embeddings of K are distinct from their conjugates; HasGram Nm; conjugation invariance of Nm; W finitely generated; K-span(W)=V; GenRatios ev; delta=imageDeg(ev,D)>0; IsModelOf(Nm,W,ev,D,p,L,psi,s); and shifted L has IsSelfInter a. Then
  a ≤ [K:Q] (D+1) delta (imageHeight(Nm,W,ev,D)+t).
The proof derives equality; preserve the original inequality statement as the formal result. No assumption that t, h, or a is nonnegative. The first four explicit premises after a are unused by the immediate WeilHeightInequality proof body (introduced as underscores), but preserved in its signature. Do not globally erase them.

Actual producer T:21 supplies the pair ⟨ChowFormHeightComparison₂.chow_form_height_comparison, Xj7N.small_sections_injective(NV)⟩. The first takes hP and constructs ChowFormHeight via CF.chowFormHeight_of_arch, CF.stArch, CF.stPts, CF.stCharts, mahler_section_statement_holds, hP.p4.arExists. Keep these exact inputs open for separate reconstruction. SmallSectionsInject is a DISTINCT premise, not a consequence of this equality.

## 2. Model to canonical projective closure
H/WeilHeightInequality obtains a rational model M of Omega from exists_pt(p,psi,hM.bij,hM.base), with X proper from projectivity. The model contains structure morphism, separation, finite type locally, quasi-compactness, point, base compatibility, generic image and surjectivity fields. Its frame hM.fs supplies N,m,b,g,A,c,gw, hF,hgw,hcb,hphi. Here b is a K-basis; g's columns generate the lattice frame; A is the archimedean matrix family; gw labels lattice elements.
The imported t_xgz_height_r_vol_up_model_mat constructs matrices Mt with det nonzero, conjugation compatibility via a unitary matrix and the exact norm-square identity
  sum_a |sum_k Mt(sigma|O_K)[k,a] sum_j sigma(g[j,k]) x_j|^2
    = archSize(A(sigma),x)^2.
The imported gen_all uses the ratios, basepoint-free condition, hG.1, K-span(W)=V and frame span to construct generic trivializations e, section values hv, a covering of X by nonzero loci hs and the divisor system hdiv. The ratio proof uses injectivity of psi (hM.bij.1) and compatibility h4 of the generic point evaluations. Keep these constructions as exact geometric leaves.

For H/VolumeLeSelfIntersection the frame, divisor system, arithmetic variety, LB structure, generic trivialization, valuations of each section, covering of nonzero loci, invertible Mt, conjugate unitary compatibility and norm-square identity are all hypotheses. Its proof derives charZero Omega, then hcomb from full frame, htop from hcomb, existence of nonzero generator and GenRatios ev. The generic divisor index i implies m≥1, so m=n+1. Obtain projective closure Z of the coordinates ev(sum_j g[j,k] b[j]). From GenRatios and positive delta, trdeg_Z(Omega)=D via trdeg over K and algebraic extension Z→K. Thus Z is an arithmetic variety of dimension D in the source convention (projective, flat in char zero, with dimension from trdeg). There is a model morphism pi:M.Z→Z.Z inducing identity of Omega; pullback will preserve the intersection number. Obtain the canonical bundle H' with its own generic trivialization, generating sections and cover. Obtain integral Chow form f' with delta positive; substitute the basis change to obtain f in b-coordinates with hf=IsChowFormInt. Nonzero f and its witness imply N>0.

## 3. Why the metric shift contributes (D+1)delta t
Write B=D+1, k=[K:Q]>0, delta>0 and F=formHeight(delta,g,A,f). The exact uniqueness theorem gives
  h=imageHeight(Nm,W,ev,D)=F/(B delta).
U/VuSelfA:13–25 proves linSubst(c A,f)=c^(B delta) linSubst(A,f): every monomial has degree delta separately in each of the B blocks, hence total degree B delta. Expand each substituted linear form; a common scalar c contributes once per power, then factor it out of the sum.
For c=exp(t)>0 the matrices c A remain invertible, the conjugate compatibility is preserved, and c Mt has the same unitary conjugation property since c is real. The norm-square identity for scaled matrices follows because both sides acquire c^2. The source uses sum_smul and archSize_smul_sq.
At each embedding the logarithmic block-sphere integral shifts by log(c^(B delta))=B delta t. U/VuSelfA:27–64 proves constant-polynomial mean under probability measure (N>0) and applies sphere_mean_mul_multihomogeneous with integrability Closed.sphereLogIntegrable, nonzero mapped/substituted form and block homogeneity. Finite/nonarchimedean part of formHeight is unchanged; sum over embeddings divided by k gives exactly the same B delta t because NumberField.Embeddings.card=k. Therefore
  formHeight(delta,g,c A,f)=F+B delta t=B delta(h+t).
No approximation, no positivity assumption on t and no extra factor 2. The metric potential uses a square norm but this height normalization uses log(norm); the formal scaling lemma fixes the convention.

## 4. Geometric transfer and exact identity
The hypothesis ChowFormHeight in U/VuSelfKnownTheorem:12–25 quantifies over number field K, K-algebra field Omega, d,N,m,delta, spanning columns g, invertible conjugation-compatible A, coordinate family y, projective closure model Z, IsArithVar, integral Chow form Phi on coneIdeal K y, line bundle H with generic trivialization, matching sections, nonzero-locus cover, invertible Mt and its unitary conjugation and exact norm-square relation. It concludes the Fubini–Study bundle's IsSelfInter of k*formHeight(delta,g,A,Phi).
Apply this to the scaled A and Mt on Z. This gives self-intersection k B delta(h+t). H/VolumeLeSelfIntersection:58–63 applies hP.p4.arProj to the model morphism, using the two arithmetic varieties, structure-map compatibility, map_generic and nonzero residue degree. U/VuSelfB:43–82 shows generic point map and residue degree 1: both generic residue fields identify with Omega and the compatible map is surjective (use surj_desc on Z and injectivity of the M residue identification), hence bijective. Thus no degree multiplier remains. Apply isometric_pull_fs to the pullback and shifted Fubini–Study metric; its IsSelfInter transport supplies the result on M. This is a stated geometric leaf, not re-proved in full here.
Finally H/WeilHeightInequality:29–31 uses isometric_fs to identify that shifted metric with the given L.shift on X, then ha.unique identifies a with k B delta(h+t). The final line is le_of_eq (by ring). This is stronger than the requested bound at the level of local source mathematics. Keep exact assumptions and imported isometries, Chow height and projection theorem as unresolved geometric dependencies. No universal self-intersection/height equality outside the specified model.

## 5. Counting-volume normalization, not lower-volume argument
H/ExistsNefModelOfImage:13–41 uses GoodOn, birational generation, NoBase, positive dg, short generators and log(shortness)≤t, plus Y.Good, host degree >2 and full signature, to produce model, shifted nef L, arithmetic dimension D, self-intersection a from hP.q11, its bound a≤k B dg(ht+t) via hPX.1, and small-section injection at degrees 8i (i≥1) via hPX.2. The counting theorem P:13–39 accepts an arbitrary commutative ring base, integral arithmetic variety, nef Hermitian L, IsSelfInter a, positive natural d and stride r, arbitrary extended-natural count m, ArithHilbertSamuel, and for each i≥1 m(ri)≤#smallSec(L^(ri)).
Since ri→∞, the nef Hilbert–Samuel normalized log count tends to a. For sufficiently large i the small-section set is finite, and its log count is nonnegative. Monotonicity of extended log and toENNReal applies to the assumed injection. At positive ri and d, the ratio defining countVol has numerator D! logCard(m(ri)) and denominator d (ri)^(D+1); rewriting (D+1)!=(D+1)D! identifies its upper bound with the nef Hilbert–Samuel expression divided by d(D+1). Take limsup of the eventual inequality and use ENNReal.ofReal continuity on the convergent real upper sequence. Thus
  countVol(D,d,r,m) ≤ ENNReal.ofReal(a/(d(D+1))).
No restriction on a needed in the formal theorem; the use of ofReal avoids invalid conversion of negative numbers. Specialize d=k,r=8. The positive denominator k B permits division of the earlier self-intersection bound, and monotonicity of ofReal gives
  volL ≤ ENNReal.ofReal(dg (ht+t)).
This is H/VolumeLineBundleLe, using hP.q9, and is not the converse VolGe of RUN1. The specific hPX.1 producer uses hP.p4.arExists and arProj, not hP.p2. This is a local direct-body result; no claim of global unused-field or kernel reachability.

## 6. Actual checks and reproducibility
Fetched the nine primary sources from PIN twice; all nine GitHub blob identities matched above. Checked 33 exact source anchor occurrences: ChowFormHeightComparison 10,12; WeilHeightInequality 12,17,19,27,29,30,31; VolumeLeSelfIntersection 17,21,26,38,58,59,60,63; VuSelfA 14,45,61; VuSelfKnownTheorem 12,17,25; VuSelfB 57,356; TopCovolSlim2Use 21 (two anchors); VolumeLineBundleLe 18,21; CountingVolumeLeSelfIntersectionNefHermitianBund 17,19,37,25. Connector V8 BigInt tests executed: 299376 shift/factorial integer identity cases, 240 block monomial scaling cases, 5 negative controls distinguishing B delta from delta (B=2..6, delta=1,c=2). All assertions held. Equivalent replay code (Python not independently executed; V8 was executed):
```python
from itertools import product
from math import factorial
cases=monomials=controls=0
for D,delta,k,H,t in product(range(9),range(1,13),range(1,13),range(-10,11),range(-5,6)):
    B=D+1; den=k*B; a=den*delta*(H+t)
    assert a==k*(B*delta*H+B*delta*t)
    assert a*factorial(D+1)==den*delta*(H+t)*B*factorial(D)
    cases+=1
for B,delta,q in product(range(1,7),range(8),range(1,6)):
    y=z=1
    for j in range(B):
        e=(j+1)%(delta+1); f=delta-e
        x=j+2; v=j+3
        y*=x**e*v**f
        z*=(q*x)**e*(q*v)**f
    assert z==q**(B*delta)*y
    monomials+=1
for B in range(2,7):
    assert 2**B!=2
    controls+=1
assert (cases,monomials,controls)==(299376,240,5)
print(cases,monomials,controls)
```
These checks are generic arithmetic regression cases, not native geometry or proof of an analytic limit. The equality is derived symbolically above; no Lean execution or kernel closure; no URT advantage or global coverage denominator. Source replay: git checkout PIN, git rev-parse PIN:path for each primary file; compare lines and full hypotheses. This note is not a registered RH CI proof.

RESUME HERE: expand actual CF.chowFormHeight_of_arch from src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/ChowFormHeightOfArch.lean and its CF.stArch/CF.stPts/CF.stCharts suppliers. Reconstruct the exact finite-place and archimedean contribution equality, including all normalization and arExists inputs. Then trace the distinct small_sections_injective_of_self_intersection_bound and its local regularity/isometric injection. Do not redo metric-shift homogeneity, model comparison or counting-volume normalization.
HANDOFF TO: integration, proof editor, audit, literature, theta and all. Replace the open self-intersection-bound adapter by this equality reconstruction with geometric leaves explicitly open. Do not claim VolGe implies the counting-volume bound. 



---

## Appendix 33: specialists/character_boxes/RUN3_LEVEL_PROJECTION_RIGHT_INVERSE.md
Working-repo blob ef024ae38f6716b03da16b8ddedc92cb6b6f1ce0. Original validation status retained.

# Run 3 — all small-level projections have explicit right inverses

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of the actual SlotZeroLocusCondition producer, including the elementary proof of surjectivity. This discharges the local implication left open by Run 2. It is not an independent Lean kernel check, a proof of native bundle existence, or a completion claim.

## Continuity
Read the swarm protocol, handoff queue, expansion plan, AGENTS, research state, runner log/protocol, continuity, prior lane Run 2, peer Galois/theta/Landau/prime/kernel/acceleration Run 3, positivity/literature Run 2, math rank and size chapters, native-family handoff and integration spine. Physical CI 45364009178 PASS (09:39 UTC) is unrelated to RH. This work is separate from the native rank envelope and the adjoint/rank implication already in Run 2.

All sources below pinned to leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Main at check: c9883164b0b3d762cee21f889d03d59a53b3ba3b (changed since Run 2 observation b37b32c236352418f6edf1ed85dd2e4b14420686). At current main, the old LPrjSurjAt and LPrjSurjective paths returned 404, LinkROfIsLinked changed to 270b3593ab7e2158aa34c05c8b609a03de0bd033 and LiftLatLemmas to b1264c460338c8eabcd167d0bae33c71e99d164c. No equivalence to migrated sources asserted.

## 1. Exact source route — the surprising simplification

HypothesesNonemptyOfUnramifiedExponents.lean lines 54–61 calls allRows_of_open0_alt, then nonempty_hyps_of_allRows_alt. The actual producer is LinkROfIsLinked.lean line 77:
```lean
zL := eventually_coreProperty_mono o.hPA fun Q h => _root_.GlobalTheory.Fc.R1.ZLAt.zL_of_hPA Q _ h
```
LPrjSurjAt.lean lines 18–22 shows that zL_of_hPA **does not inspect the primitivity hypothesis**: its first line is intro Q Lk _. It invokes Row.of_sel, supplies constants 1 (positive), the zero tuple in the source, and xr=0, then applies lPrj_surj_at_alt to the actual selected bundle sigma(Fm,d3_a(hc),x,hx,i), for the arbitrary level k. Thus the eventual surjectivity property is actually inherited from *every already-typed bundle* at each selected point. It is not an additional open-orbit nonvanishing theorem. Do NOT remove o.hPA from the original AllRowsAlt pipeline: the original application uses it for this monotonicity adapter and other arguments genuinely consume primitivity. No source proof has been rewritten.

## 2. Typed bundle assumptions

Fix D, O, c, b : BundleCondition D O c, k : Fin D.R.m. The type t used by the theorem is the selected base type b.P.A3.A.mu0. With the exact selected group, subgroup P0, character psi0, and subspace family Zs=b.P.A3.fam3.toSub2 b.P.Zs, lPrj_surj_at_alt calls LiftProjOnto.lPrj_surjective. It supplies:
- b.C.ok1.ok2, the required A.fam.Ok 1 proof;
- b.P.tied.div.mt.forms k b.P.A3.A.mu0, the FormsTie proof for the actual lift.

The latter is present in the original signature even though the proof body ignores it (final intro binder _). Preserve both in the manuscript statement. The former supplies BlockHyp for the specific block B=A.fam.L k t and level ell=A.fam.lvlA P0 psi0:
hB=(hOk.conj, hOk.irr, hOk.lifts k t).
BlockHyp requires IsConjAt(v0), absolute irreducibility of each character in ell.X, and B.Ok 1; RowLat.B.Ok includes good lattice data, rational Hermitian entries, positive definiteness at every infinite embedding, group-action goodness and rationality. This is conditional on these typed fields, NOT generic surjectivity for an arbitrary matrix. The theorem is over the coefficient number field K=D.what₂.LL, not an unproved assertion about integral lattice surjectivity.

## 3. Human mathematical proof of the projection theorem

Work over K. Suppress fixed B, ell, Z=Zs.Zl(k,t). Let E be the level-coordinate inclusion B.S.lvlE and R its projection B.S.lvlPr. Let V=B.vE include the good-part coordinates into the ambient space and S=B.vPr project to them. Let U=B.zE include the subspace coordinates into the good-part coordinates and Q=B.Pq project back. All sizes come from the native definitions; maps are rectangular. This Q denotes a matrix, not the slot Q in section 1.

The required identities are:
1. S V=I, from lf_v_proj hB. Its second part identifies V S with the matrix representation of goodAt.
2. Q U=I, from lf_z_proj hB. Here U is injective by lf_zE_inj and the restricted Hermitian form HV is positive by lf_HV_pos. The orthogonal-projection existence result gives the required left inverse; no new positivity assumption is added.
3. E R V=V, from lf_lvl_vE hB. This is the nontrivial nesting property: the good-part image lies in the level image. Source proof: level idempotent e=levelIdem and good-part idempotent g=goodAt satisfy e g=g (lf_lvl_mul_good, using idempotent_spec centrality/commutation and e²=e). The group-action matrix homomorphism therefore satisfies M(e)M(g)=M(g). Because E R=M(e), V S=M(g), S V=I, we get E R V=E R V S V=M(e)M(g)V=M(g)V=V S V=V.

The source definitions RowLat.lean lines 146–149 and LiftLat.lean line 130 are
F=B.fE=V U,
J=B.lE=R F,
L=B.lPr=Q S E.
Consequently
    L J = Q S E R V U
        = Q S V U
        = Q U
        = I.
This is exactly lf_lPr_lE, using lf_lvlE_lE and the two left-inverse identities. For each target y, choose the explicit preimage J y. Then L(J y)=y, which proves lf_lPr_surj. RowSideTie.lean lines 92–98 identifies the original lPrj with L and lZ0 with J. Note that the distinct name Formalism.L2.DIV.lE at line 84 denotes a level operator, NOT the inclusion J. Use the native BlockDat.lE or lZ0 for the right inverse.

This removes a conceptual bottleneck: the selected projection is onto because its inclusion is a section. No determinant search, asymptotic estimate, or additional induction is needed. The proof is exact; it does not claim that a representation satisfying BlockHyp always exists.

## 4. Quantifiers and common selection

SelectionZeroLocus (CountsIrreducibilityConstants.lean 105–111) is:
Closed(D3 3 A) of the property that for each Fm in D3 3 A there exists a real xr such that for all x>Fm.x1 with selected threshold <=x and xr<=x, for ALL i in Fm.Ix(x) and ALL k in Fin(Fm.D(x,i).R.m), the lPrj constructed from the same baseLevelChoiceOfRawSelection sigma is onto at its mu0.
The source proof takes xr=0, before x,i,k, so the bound is uniform in the family indices and levels. No choice of new sigma or of a new t per k. The proof applies for every typed selected point satisfying the original guards; it does not assert the existence of such points merely by surjectivity. Row.of_sel also supplies the Closed witnesses as in the literal source (positive 1 and zero tuple); do not replace Closed by an unguarded universal claim.
AllRowsAlt.zL is passed as RowL in NonemptyHypsOfAllRows lines 44,49–51,97 with the same A and sigma. Run 2 may now use the local result as the zL producer. The other row hypotheses there (divisor conditions, base count, bijective row transform, primitivity/type separation) remain separate.

## 5. Source inventory and evidence
T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
F = src/Formalism/LocalToGlobal/Divisibility/
A = src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/
Blob IDs returned by connector:
- T/HypothesesNonemptyOfUnramifiedExponents.lean c0ce994aa86f737b707b5617fb10bcfb35c0117e — 54–61.
- T/LinkROfIsLinked.lean 66e5fddcb389f78669cef5787ef2c648d537bf4d — 50–86, particularly 77.
- T/LPrjSurjAt.lean 9f1742e4e5d59d606c1cfeea0781cec6e51e5216 — 14–22.
- T/CountsIrreducibilityConstants.lean 1e6d9219a64c3d573bbd3c0a442570caeb553089 — 105–111.
- T/NonemptyHypsOfAllRows.lean 6a09205dfc3e57486ecbc27517072f3c27f09a51 — 44,49–51,97.
- A/LPrjSurjective.lean 2393ceb239e799365dc6eddd8b6c2a28254aa709 — 9–12.
- F/LiftLatLemmas.lean df553462d74f2ffd6c1790f8c9fe12f2df7a74e7 — 151–217, 284–287.
- F/RowLat.lean 0e9a96babee33b5034bf913f6a25ac6389daa83e — 105–107,138–149,176 onward.
- F/LiftLat.lean 5b2e6117f6419179774eabe36f62d908522f977e — 130,184–191.
- F/RowSideTie.lean 7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa — 61–62,84–98.

Executed V8 source checks: all 10 blob IDs matched and 47 literal source/body assertions passed (57 total). Replay using git show PIN:path, git hash-object --stdin, compare the above declarations and their actual calls: allRows_of_open0_alt -> eventually_coreProperty_mono o.hPA -> ZLAt.zL_of_hPA -> Row.of_sel -> lPrj_surj_at_alt -> LiftProjOnto.lPrj_surjective -> BlockDat.lf_lPr_surj -> lf_lPr_lE -> lf_lvlE_lE / lf_lvl_vE / lf_v_proj / lf_z_proj. These are static source references, not the full elaborated DAG. Connector blob IDs were compared, not independently recomputed.

## 6. Executed exact elementary regression

All entries below are small exact integers (safe JavaScript integer arithmetic), not native geometry. Test 116 pairs of one-dimensional split maps in dimension 2, conjugated by 125 invertible 3D integer shear bases and both orientations of target; 29,000 projection identities, 319,000 explicit preimage checks, and 14,500 negative controls lacking nesting. All passed. In the negative control both level and good maps separately split, but the good image is outside the level image, so L J=0. This verifies why nesting cannot be omitted. The universal algebra proof is section 3, not the bounded test.

Replay with Node or any JS engine; this is the actual executed test:
```js
const mul=(a,b)=>a.map(row=>b[0].map((_,j)=>row.reduce((s,x,k)=>s+x*b[k][j],0)));
const id=n=>Array.from({length:n},(_,i)=>Array.from({length:n},(_,j)=>i===j?1:0));
const eq=(a,b)=>JSON.stringify(a)===JSON.stringify(b);
function shear(i,j,s){const a=id(3);a[i][j]=s;return a;}
let pairs=0,cases=0,vecs=0,neg=0;
for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)for(let c=-3;c<=3;c++)for(let d=-3;d<=3;d++){
 if(c*a+d*b!==1)continue;pairs++;
 const U=[[a],[b]],V=[[c,d]];
 for(let s=-2;s<=2;s++)for(let t=-2;t<=2;t++)for(let h=-2;h<=2;h++){
  const A=mul(mul(shear(0,2,s),shear(2,1,t)),shear(1,0,h));
  const Ai=mul(mul(shear(1,0,-h),shear(2,1,-t)),shear(0,2,-s));
  if(!eq(mul(A,Ai),id(3)))throw Error("inverse");
  const E=A.map(r=>r.slice(0,2)), R=Ai.slice(0,2);
  const W=mul(E,U), S=mul(V,R);
  for(const q of [-1,1]){
   const F=mul(W,[[q]]),I=mul(R,F),P=mul(mul([[q]],S),E);
   if(!eq(mul(R,E),id(2))||!eq(mul(S,W),id(1))||!eq(mul(mul(E,R),W),W)||!eq(mul(P,I),id(1)))throw Error("tower");
   cases++;
   for(let y=-5;y<=5;y++){if(!eq(mul(P,mul(I,[[y]])),[[y]]))throw Error("section");vecs++;}
  }
  const Wbad=A.map(r=>[r[2]]), Sbad=[Ai[2]];
  if(!eq(mul(Sbad,Wbad),id(1))||!eq(mul(R,E),id(2)))throw Error("negative input");
  if(!eq(mul(mul(Sbad,E),mul(R,Wbad)),[[0]]))throw Error("negative");
  neg++;
 }
}
if(pairs!==116||cases!==29000||vecs!==319000||neg!==14500)throw Error("counts");
console.log({pairs,cases,vecs,neg});
```
No original hypotheses removed; two signature premises found unused locally, with scopes explicitly preserved. No independent Lean run; no full-proof denominator or measured URT speedup. No physical files changed.

RESUME HERE: trace the other indispensable inputs of Run 2, starting with the actual producer of o.hDivG in OpenOrbitOfUnramifiedExponents.lean lines 54–55 and its bk_law_entries_alt call; locate the exact DivRows3G -> DivRows3.thTheta theorem giving the commutative coordinate identity for the same bundle. If peer theta/Galois lanes have already claimed that producer, instead trace the exact A.fam.Ok 1 producer through the BundleCondition column compatibility construction, preserving all group representation and positivity conditions. Do not repeat the projection right-inverse or adjoint/range proofs.
HANDOFF TO: integration, proof editor, formal audit, theta, Galois, math. Replace the previously open zL local implication with this source-matched proof; keep native bundle/Ok and remaining row producer obligations OPEN.



---

## Appendix 34: specialists/prime_window/RUN3_PRIMITIVE_INERTIA_FROBENIUS.md
Working-repo blob 029340272045762c0163e4ec2aedee4b0a14ba07. Original validation status retained.

# Prime-window run 3 — exact primitive coefficients from inertia and Frobenius

2026-11-24. RESULT: SOURCE-MATCHED local human reconstruction; mathematical derivation plus executed finite exact regressions. The missing primitive-value producer from RUN2 is located and translated. No claim of Lean kernel execution, full RH proof or URT speedup. Project remains OPEN.

## Preflight and version separation

Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RESEARCH_STATE, the actual runner RESEARCH_LOG and RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, state-branch summary (#357 PASS 09:01 UTC, unrelated Cathedral checks), prior prime runs 1 and 2, latest relevant peer handoffs (math, integration, dependency, structure, formal audit, kernel, acceleration, character boxes, Landau, Galois, theta, literature, positivity, editor). Inventory checked; not every historical peer document read. The others address global witness producers, analytic zero-free conclusions, size algebra, or proof indexing. This run is solely the exact local coefficient identity underlying PrimRead:60. No physical files changed.

PIN = 40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. Observed upstream HEAD c9883164b0b3d762cee21f889d03d59a53b3ba3b (2026-11-24 09:08:06 UTC), 558 commits ahead of last prime-run observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 according to compare API (file list capped at 300). Unlike last run, all six files below have changed blob IDs. Targeted declaration-text comparisons show the same cosetMean/primVal/GPsi, localUnits/IsFrobUnit/cftData/dirChar/PrimValPrimitive, inertia_conductor, cosetMean_eq_primitive, primitive_value_primitive, recH/arith and prim_read. The prime-power proof has removed its redundant alternate simp tactic at HEAD. This is NOT a transitive equivalence audit or an update of the pinned manuscript. Keep the pinned version.

## Source ledger

B=src/Formalism/SizeWindowBrackets/, C=src/Development/AutomorphicArithmetic/PrimitiveCosets/. Blob IDs returned by GitHub for exact pin and observed head; 39 pinned line anchors checked.

| Path | Pinned blob | HEAD blob | Pinned declarations |
|---|---|---|---|
| B/FirstPrimeNeSecondPrime.lean | 18deb7cb85d6f650a69f01fda6e0c789b9f04d89 | d0498cdde8640558c61c6d342dd618e88b89f7a1 | ArithData 38–42; cosetMean 61–63; primVal 65–66; GPsi 68–70; PrimValPow 103–105; OrthoRam 116–121 |
| B/GaloisToProductIsIso.lean | 4f314d4aed9d7969e3f275c9dd03aca3d015ee43 | d54b2973f23f68aef414385a9891c5e1ba1d8dfa | localUnits 12; IsFrobUnit 14–16; frobUnit 18–20; cftData 25–29; dirChar 31–32; FrobUnitSpec 71–72; UnramSpec 74–75; DirCharSpec 80–83; InertiaConductor 85–87; PrimValRamified 89–93; PrimValPrimitive 95–97 |
| B/ChainSlopeWindows/StronglyIrreducible.lean | 94a385f59f3781ae6b1ab4beddc73850708a2bc6 | aa851c8306664ea7e17cd99e5b405eaf817d906f | primitive_value_trivial 213–221; primitive_value_pow 223–229 |
| B/ChainSlopeWindows/GaloisMapComplexConjugation.lean | b08d98f83d661d021b20ccff6c405af78e9afb59 | 3232ce5edad2b896dcec650403eb20478516ac42 | congruences 17–47; exists_unit_crt 49–62; frobenius_unit_spec 64–84; frobUnit_modEq 86–89; unramified_spec 91–108; dirichlet_character_spec/dirChar_unit 113–121; mem_inertia_iff 123–127; trivial_on_inertia_iff 129–143; inertia_conductor 145–153; cosetMean_of_trivial 155–165; cosetMean_of_nontrivial 167–201; primitive_value_ramified 203–207; cosetMean_eq_primitive 209–231; primitive_value_primitive 233–245 |
| C/RecH.lean | b2712cc402765cea3fd406285e05e32a7ce64ec7 | 6b4a0837798826f6cbf21bc052cba0c6e2a9502b | recH 21; arith 23 |
| C/PrimRead.lean | 3960cf3e7d166f6664405a0d5fcb995924621ffb | fc1f2ef9e2181f65505b61619d9e6c0506c558fc | prim_read 48–97, hval 56–61 |

Names in the principal local proof are in Formalism.LFunctionChainParameters.LHost; primVal and primitive_value_pow in Formalism.LFunctionChainParameters.characterSumData. Source-text references, not extracted kernel edges. Source can be retrieved via https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ followed by path and #L range.

## 1. Full quantifiers and definitions

Let H be any finite additive commutative group with decidable equality, G=E0×H, E0=(Z/2)^2. Fix N∈N with N≠0, arbitrary q1,d∈N, any homomorphism r:U_N=(Z/NZ)^×→G written multiplicatively in Lean, and any complex additive character ψ:G→C. No surjectivity of r, conditions on q1 or d, or special host prime restrictions are needed for PrimValPrimitive. Write χ=dirChar(r,ψ), so χ(u)=ψ(r(u)) on units, χ(x)=0 on nonunits. Let c=conductor(χ), χ*=primitiveCharacter(χ), with c|N and χ the changeLevel of χ*. The nonunit rule for χ* applies modulo c, not modulo N.

For a prime p split N=P M with P=p^{v_p(N)}, p∤M. P is ordProj[p]N and M is ordCompl[p]N. Define localUnits K_p=ker(U_N→U_M); inertia I_p=r(K_p) (as an additive subgroup), and f_p=r(w_p), where w_p is the unique unit satisfying w_p≡p mod M and w_p≡1 mod P. For N=1 or P=1 the congruences modulo 1 are vacuous and the trivial unit group is permitted. Source frobUnit has a fallback 1 if a witness fails to exist, but existence is proved under N≠0 and p prime (64–84); the fallback is not used in this argument.

The exact mean is A_I(h,ψ)=(1/|I|)Σ_{x∈I}ψ(h+x), with each subgroup element counted ONCE. I contains 0 so denominator never vanishes. Define primVal(D,ψ,n)=Π_{p∈primeFactors(n)} A_{I_p}(v_p(n) f_p,ψ). For n=1 this is the empty product 1. For n=0, do not extend the primitive-character identity: Lean theorem explicitly requires n≠0. For arbitrary real y the GPsi definition is the separate Gz(y) branch if ψ=0; otherwise sum over n=1,...,floor_nat(y) of Λ(n) primVal(n)(y/n−1) plus y ell(ψ). Here Λ is von Mangoldt, zero off prime powers. Thus all values used in the finite sum obey n≠0, even if y<1 (empty sum). This run does not derive ell or Gz, and does not replace the principal branch.

## 2. CRT supplies the Frobenius representative

Because P and M are coprime, Chinese remaindering is a ring isomorphism Z/N≅Z/P×Z/M inducing the corresponding unit-group isomorphism. The element (1,p) consists of units because gcd(p,M)=1. Its inverse image is w_p. If two units satisfy the two congruences, their residues differ by a multiple of P and M, hence of N; they are equal. This is exactly exists_unit_crt and frobenius_unit_spec. The kernel K_p corresponds to U_P×{1}. If p∤N, P=1 and M=N, so K_p is trivial, I_p={0} and w_p=p modulo N. This is unramified_spec. If p|N it is NOT enough to use p modulo N, since p is then a nonunit.

## 3. Ramification detected by the character conductor

trivial_on_inertia_iff (129–143) proves
  [∀x∈I_p, ψ(x)=1] iff c|M.
Indeed I_p is exactly the image of K_p. Thus ψ is trivial on I_p iff the unit character χ is trivial on the kernel K_p of U_N→U_M. That reduction is surjective by the CRT above. A character descends through a surjective homomorphism iff it kills its kernel: if lifts u,v have the same reduction, uv^{-1}∈K_p, so χ(u)=χ(v); conversely a descended homomorphism maps K_p to 1. The Lean proof uses DirichletCharacter.mem_conductorSet_iff_conductor_dvd, mem_conductorSet_iff and factorsThrough_iff_ker_unitsMap. The conductor is the minimal level in the precise divisibility sense given by those Mathlib results; retain them as upstream source dependencies, not an assumed theorem about RH.

Since c|N and p∤M, c|M iff p∤c: the forward direction is immediate, the reverse follows by factoring N=P M and removing every p-power from a divisor not divisible by p. This yields inertia_conductor (145–153), with N≠0 and p.Prime. Notice the distinction: p|N can coexist with p∤c, i.e. a ramified host but character unramified at p. Do not zero its coefficient just because p divides N.

## 4. Average as exact character projector

For any finite subgroup I≤G and any h∈G,
  A_I(h,ψ)=ψ(h) if ψ|_I=1; otherwise 0.
If ψ|_I=1 each summand equals ψ(h); divide by |I| (positive). Otherwise choose t∈I with ψ(t)≠1. Translation x↦t+x is a bijection I→I (inverse x↦x−t). For S=Σ_{x∈I}ψ(h+x), S=Σψ(h+t+x)=ψ(t)S; as C is a field and 1−ψ(t)≠0, S=0. These are cosetMean_of_trivial and cosetMean_of_nontrivial. The proof is over all complex characters, not only real ones. It does not use a probability approximation.

For k≥1 and prime p, the prime factors of p^k form the singleton {p}, valuation k. Thus primitive_value_pow reduces primVal(D,ψ,p^k) to A_{I_p}(k f_p,ψ). The preceding projector gives primitive_value_ramified: ψ(f_p)^k if ψ trivial on I_p, zero otherwise. The averaging subgroup is I_p, NOT k I_p. The latter can collapse a nontrivial character for even k, yielding a wrong answer.

## 5. Identify the mean with the primitive Dirichlet coefficient

cosetMean_eq_primitive (209–231) states under N≠0, p prime, k≠0:
  A_{I_p}(k f_p,ψ)=χ*(p mod c)^k.

Case 1: ψ|_I=1. Then c|M. We have w_p≡p mod M, hence w_p≡p mod c. Because w_p is a unit modulo N, χ(w_p)=ψ(f_p). Since χ=changeLevel(χ*) and χ on units reads the primitive character on the residue modulo c, χ(w_p)=χ*(w_p mod c)=χ*(p mod c). Raising to k matches the mean. This argument remains valid when p divides N but not c. It is exactly the changeLevel_primitiveCharacter and changeLevel_eq_cast_of_dvd step at 219–223.

Case 2: ψ|_I not trivial. By the conductor criterion p|c. Therefore gcd(p,c)≠1 (p prime, p>1) and p mod c is not a unit. MulChar.map_nonunit gives χ*(p)=0; since k≠0, χ*(p)^k=0. The projector is zero as well. k≠0 is essential; the Lean statement does not assert zero for exponent zero.

Combining the cases and multiplicativity, for EVERY n≥1,
  primVal(D,ψ,n)=Π_{p|n} χ*(p)^{v_p(n)}=χ*(n mod c).
Use unique factorization, cast_prod, map_prod, cast_pow, map_pow. The theorem primitive_value_primitive (233–245) explicitly requires N≠0 and n≠0, does not assume n coprime to N, and includes n=1 via empty product. This proves the missing coefficient equality used by prim_read. Substitution r=recH(R), N=R.condN and D=arith(R) gives exactly PrimRead:56–61; the source calls with HostRaw.condN_pos and reverses the equality. HostAddCharCompatible, the separate zero-character branch and all prime-window power-bound hypotheses remain as in RUN2. No Gm bound follows from character orthogonality by itself.

## 6. Exact regression, including three failure modes

Executed in V8 via connector orchestration on 2026-11-24. The fixtures are actual finite Dirichlet characters of conductors 1,3,4,5,7,8,12,15,20,24,35, including quartic complex characters and products. They are lifted to every multiple N≤160. Values use exact integer Gaussian pairs {±1,±i}; no floating trigonometry. For this finite regression take H=Z/4, r mapping units to their character exponent in H (E0 coordinates zero), ψ the fourth-root character. This is a valid special case of the general theorem. It is not a test of the entire original host or all finite characters. The analytic proof above, not these counts, gives the general conditional identity.

Actual counters: hosts 452 (character/level instances); multiplicativity checks 1,179,442; independent conductor-divisor checks 3,181; CRT uniqueness 18,532; inertia criterion 18,532; prime-power equality 74,128; average over units versus distinct inertia-image equality 74,128; multiplicative natural values 81,360 (n=1..180); host-level-zero negative controls 2,352; zero-exponent negative controls 333; incorrectly scaled inertia negative controls 333. All assertions succeeded. 39 source anchors also checked across six pinned blobs. No native Lean execution.

For a concrete counterexample to an imprimitive substitution, lift the trivial character of conductor 1 to level 4: χ(2)=0 while χ*(2)=1. For a nontrivial character on inertia of order dividing 4, using 4I rather than I makes the wrong mean 1 instead of 0. This is tested. The average over units (each has same number of lifts in its image under r) agrees with the average over distinct image elements; do not replace the source normalization with the full group cardinality.

Reproduce the exact finite regression by saving this JS block as a .js file and running node. These are the same algorithm and bounds executed in V8. It is not a Lean kernel test.

~~~js
function certificate(){
 const gcd=(a,b)=>b?gcd(b,a%b):a;
 const units=n=>Array.from({length:n},(_,i)=>i).filter(x=>gcd(x,n)===1);
 const mod=(x,n)=>((x%n)+n)%n;
 const primes=n=>{const a=[];for(let p=2;p<=n;p++){if(n%p===0){a.push(p);while(n%p===0)n/=p;}}return a;};
 const split=(n,p)=>{let a=1;while(n%p===0){a*=p;n/=p;}return [a,n]};
 const roots=[[1,0],[0,1],[-1,0],[0,-1]];
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 const eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
 const ok=(b,...s)=>{if(!b)throw Error(s.join(" "));};
 const leg=(a,p)=>{a=mod(a,p);if(a===0)throw Error("nonunit");for(let j=1;j<p;j++)if(j*j%p===a)return 0;return 2;};
 const q5=a=>{let b=1;for(let j=0;j<4;j++){if(mod(a,5)===b)return j;b=b*2%5;}throw Error("nonunit");};
 const e4=a=>mod(a,4)===1?0:2;
 const e8=a=>[1,7].includes(mod(a,8))?0:2;
 const fixtures=[
 [1,a=>0,"principal"],[3,a=>leg(a,3),"quadratic3"],[4,e4,"odd4"],[5,a=>leg(a,5),"quadratic5"],
 [5,q5,"quartic5"],[5,a=>mod(-q5(a),4),"inverseQuartic5"],[7,a=>leg(a,7),"quadratic7"],
 [8,e8,"even8"],[8,a=>mod(e4(a)+e8(a),4),"odd8"],[12,a=>mod(e4(a)+leg(a,3),4),"product12"],
 [15,a=>mod(leg(a,3)+q5(a),4),"product15"],[20,a=>mod(e4(a)+q5(a),4),"product20"],
 [24,a=>mod(e8(a)+leg(a,3),4),"product24"],[35,a=>mod(q5(a)+leg(a,7),4),"product35"]
 ];
 const counts={hosts:0,homomorphism:0,conductorDivisor:0,CRT:0,inertiaCriterion:0,primePower:0,unitVsImage:0,allNatural:0,imprimitiveNegativeControls:0,zeroExponentNegativeControls:0,scaledInertiaNegativeControls:0};
 for(const [c,E,name] of fixtures){
  const val=n=>gcd(n,c)===1?roots[mod(E(n),4)]:[0,0];
  for(let N=c;N<=160;N+=c){
   const U=units(N);const ex=u=>mod(E(u),4); counts.hosts++;
   for(const a of U)for(const b of U){ok(ex(a*b)===mod(ex(a)+ex(b),4),name,N,a,b);counts.homomorphism++;}
   for(let d=1;d<=N;d++)if(N%d===0){
    const map=new Map();let fact=true;
    for(const a of U){const k=a%d,v=ex(a);if(map.has(k)&&map.get(k)!==v)fact=false;map.set(k,v);}
    ok(fact===(d%c===0),"conductor",name,N,d);counts.conductorDivisor++;
   }
   const pset=new Set([...primes(N),...Array.from({length:179},(_,i)=>i+2).filter(p=>primes(p).length===1&&primes(p)[0]===p)]);
   const cache=new Map();
   for(const p of pset){
    const [a,M]=split(N,p);
    const I=U.filter(u=>u%M===1%M);
    const F=U.filter(u=>u%M===p%M&&u%a===1%a);
    ok(I.length>0&&F.length===1,"CRT",N,p);counts.CRT++;
    const w=F[0];const J=[...new Set(I.map(ex))];
    const trivial=J.every(j=>j===0);ok(trivial===(c%p!==0),"inertia",name,N,p);counts.inertiaCriterion++;
    for(let k=1;k<=4;k++){
     let sr=0,si=0,ur=0,ui=0;
     for(const j of J){const z=roots[mod(k*ex(w)+j,4)];sr+=z[0];si+=z[1];}
     for(const u of I){const z=roots[mod(k*ex(w)+ex(u),4)];ur+=z[0];ui+=z[1];}
     const v=val(p**k);
     ok(sr===J.length*v[0]&&si===J.length*v[1],"mean",name,N,p,k);counts.primePower++;
     ok(ur*J.length===sr*I.length&&ui*J.length===si*I.length,"fibres",name,N,p,k);counts.unitVsImage++;
     if(N%p===0&&c%p!==0){ok(!eq(v,[0,0]),"nonunit correction");counts.imprimitiveNegativeControls++;}
     if(!trivial&&k===1){ok(!eq(val(1),[0,0]),"zero exponent");counts.zeroExponentNegativeControls++;}
     if(!trivial&&k===4){
      const wrong=J.map(j=>roots[mod(k*(ex(w)+j),4)]).reduce(([x,y],[z,t])=>[x+z,y+t],[0,0]);
      ok(eq(wrong,[J.length,0])&&eq(v,[0,0]),"scaled inertia");counts.scaledInertiaNegativeControls++;
     }
     cache.set(p+":"+k,[sr/J.length,si/J.length]);
    }
   }
   for(let n=1;n<=180;n++){
    let v=[1,0],m=n;
    for(const p of primes(n)){
     let k=0;while(m%p===0){k++;m/=p;}
     let w=cache.get(p+":"+k);
     if(!w){const [a,M]=split(N,p),I=U.filter(u=>u%M===1%M),F=U.find(u=>u%M===p%M&&u%a===1%a);
      const J=[...new Set(I.map(ex))];const s=J.map(j=>roots[mod(k*ex(F)+j,4)]).reduce(([x,y],[z,t])=>[x+z,y+t],[0,0]);
      w=[s[0]/J.length,s[1]/J.length];}
     v=mul(v,w);
    }
    ok(eq(v,val(n)),"natural product",name,N,n);counts.allNatural++;
   }
  }
 }
 return counts;
}
console.log(certificate());
~~~

Source replay: git rev-parse PIN:path for each full path in table, or git show PIN:path | git hash-object --stdin; compare each blob and listed declaration/line to PIN. Exact line checks executed this session via connector, not a local Git clone. For a stronger independent audit, recover locked Mathlib versions of mem_conductorSet_iff_conductor_dvd, factorsThrough_iff_ker_unitsMap, changeLevel_primitiveCharacter, changeLevel_eq_cast_of_dvd and verify all implicit NeZero instances and proof terms. Do not confuse passing general Cathedral CI with validation of this Lean proof.

RESUME HERE: use actual StronglyIrreducible.lean lines 274–325 (ortho_coset, orthogonality_ramified, orthogonality_unramified), then 523–694 (characterSum_expansion) and 695–end (colour_balance) to reconstruct the exact ASK−MAIN=De Fourier identity. First derive factor 2/|I|, including the double coset singleton for p=d and exclusion of 2,q1. Preserve HostFacts, a>0, positivity on PhiSet, and finite truncation N conditions; do not repeat the conductor proof. This is the arithmetic signal expansion, NOT the global size bound. Verify Mathlib character orthogonality provenance and request independent audit of this chapter.

HANDOFF TO: formal audit, integration, proof editor, Galois, Landau, math and character-box lanes. Attach this as the proof of primitive_value_primitive in the human manuscript; independent audit of conductor and modulus-one exceptions still pending. 



---

## Appendix 35: specialists/landau_criterion/RUN3_LINE_ONE_NONVANISHING_AND_LOG_DERIVATIVE.md
Working-repo blob c6b989ac4e75f700767150a3124816c3ce1813d2. Original validation status retained.

# RUN3 — nonvanishing on Re(s)=1, logarithmic derivatives and zeta regularization

2026-11-24. RESULT: DONE for this source-linked human reconstruction of the named Mathlib argument; PARTIAL for full transitive library proof and independent kernel validation. No new RH assertion. Continue from RUN2_MELLIN_CONJUGATION_AND_POLE_FIELDS.md. No change to physics queue, other lanes or assumptions.

## Source revision and precise scope
Original RH pin 40e56bab026552e089d7afcfeff08d2defb9c005; locked Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. All line numbers below are from these immutable revisions, not main. Six Mathlib modules read in relevant sections:
- Mathlib/NumberTheory/LSeries/Nonvanishing.lean: 610bd56365d49c5ffa9ebeb29e0a383c768248e2, entire file (main proof).
- Mathlib/NumberTheory/LSeries/Positivity.lean: e7855803a338e1765edea208ca0595e7bbc858a2, entire file (Dirichlet-series positivity).
- Mathlib/Analysis/Complex/Positivity.lean: 84d0dd19081767dc0426eca372d937ade4b56f41, entire file (Taylor positivity).
- Mathlib/NumberTheory/LSeries/Dirichlet.lean: f718ca1edc35ffa92b318b2f74ddcef0e2e754a3, relevant lines 80–264,290–442 (Moebius inverse, convolution, logarithmic derivatives).
- Mathlib/NumberTheory/LSeries/Deriv.lean: 8c6ad6574f8ecc81f7d491143ce104763d1d4a02, lines 35–163 (analytic termwise differentiation).
- Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean: 6846dc699ecd29cc8a1754c1680176210969ffd1, selected lines 30–145,195–260,305–450 (finite sums, asymptotic and totalized value).
Two actual RH source wrappers reread: src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109 and lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f.

Upstream main observed c9883164b0b3d762cee21f889d03d59a53b3ba3b, commit timestamp 2026-11-24T09:08:06Z. Old ZeroFreeOfRpowWindow path 404; CharFamilyLFunctionNeZeroOfOneLeRe blob now d2528ce1ab28750b3b50ec1c8040ef3f65f6dd27. Manifest now locks Mathlib 31ce06eaadf4a200c0e1407c5f10953cf606b8f8 (manifest blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d). All six library blobs above also changed, respectively 9ff00d6fd0a8b212d88478cc00c0e0c3718ccb32, 1453d575835e66a01bbfae9f95a2a12cefbbe243, 4daa2fbc36860e73648a7faef9cdbddd03dcf223, 81d22d30291cde186823417dbe69a23a5bf6faf8, b2e325a69fb4ec998d10e20377430f38fc1017db, 30397bfe2272d8400aa42bcbb44bec085b7f23ab. These are observed content changes, not a claim that the mathematical conclusions changed. This chapter applies only to original pin; semantic migration is a separate obligation.

## 1. Exact statement and the two genuinely different cases
Let N>0, chi a Dirichlet character modulo N. Nonvanishing.lean:385–401 asserts L(s,chi)!=0 for Re(s)>=1 under chi!=1 OR s!=1. There is no assumption of primitivity. At s=1 for the nonprincipal quadratic case it uses a different positivity argument, not the familiar 3-4-1 inequality. At a real zero beta strictly between 0 and 1 this theorem says NOTHING; such a zero must be treated in RUN1's conditional window contradiction.

## 2. Re(s)>1: a convolution inverse, not an RH assumption
Use f*g(n)=sum_{d|n} f(d)g(n/d) for n>=1. Complete multiplicativity makes (chi f)*(chi g)=chi(f*g). The Moebius relation 1*mu=delta_1 therefore gives chi*(chi mu)=delta_1 (here the outer star denotes convolution). Both Dirichlet series converge absolutely for sigma>1 because |chi|,|mu|<=1. Convolution corresponds to multiplication by absolute rearrangement over ordered positive pairs (d,e), since (de)^(-s)=d^(-s)e^(-s). Thus L(s,chi) sum_n chi(n)mu(n)n^(-s)=1. The first factor cannot vanish. Exact source Dirichlet.lean:128–153,187–222,229–232. Modulus zero is allowed for the series lemma (chi on positive naturals is delta_1) but not the analytic continuation theorem requiring N>0. Modulus one is the constant-one character on positive integers.

## 3. The 3-4-1 argument on the boundary (except quadratic at s=1)
Fix x>0, t real, sigma=1+x. Write chi_0 for principal character at the SAME modulus N, not zeta if N>1. Define
 P(x)=L(sigma,chi_0)^3 L(sigma+it,chi)^4 L(sigma+2it,chi^2).
For prime p not dividing N let a=p^(-sigma) in (0,1) and z=chi(p)exp(-it log p) with |z|=1. For every k>=1,
 3+4 Re(z^k)+Re(z^(2k)) = 2(1+Re(z^k))^2 >=0.
Indeed Re(w^2)=2Re(w)^2-1 for |w|=1. Taylor expansion -Log(1-v)=sum_{k>=1}v^k/k on |v|<1 (principal analytic logarithm) shows
 3 Re[-Log(1-a)]+4 Re[-Log(1-az)]+Re[-Log(1-az^2)] >=0.
At primes dividing N all three character values, INCLUDING chi_0 and chi^2, vanish, so the three logarithms are zero, not a zeta factor. All prime-log series absolutely converge: |chi(p)p^(-s)|<=p^(-sigma), summable over primes, and -Log(1-v)=O(|v|) uniformly as v->0 (the finitely many remaining factors are valid). Thus using LSeries_eulerProduct_exp_log, summing and exponentiating gives |P(x)|>=1. The explicit positivity lemma applies also t=0 despite the comment mentioning nonzero y. Source Nonvanishing.lean:221–314. The Euler-product exponential identity is a named imported dependency here; its ordinary derivation by expanding finite products and absolute convergence follows uniqueness of factorization, with log sum and exp limit justified by the above bound. The exact transitive imported implementation is not claimed audited.

Suppose L(1+it,chi)=0 and (chi^2!=chi_0 OR t!=0).
- The principal factor is O(x^(-1)) as x->0+, from its residue prod_{p|N}(1-1/p) (empty product=1 at N=1).
- The assumed zero lies at a regular point since t!=0 or chi!=chi_0. Analyticity gives L(1+x+it,chi)=O(x).
- The last factor is O(1): t!=0 or chi^2!=chi_0 prevents the pole at 1.
Hence |P(x)|=O(x^(-3+4))=O(x)->0, contradicting >=1. This does not require assuming the zero is simple; holomorphy and vanishing give at least first order. The formal proof composes IsBigO inequalities into 1=O(x), then uses x=o(1) for contradiction (Nonvanishing.lean:316–381).
The exceptional branch is essential. If t=0 and chi^2=chi_0, the last factor is principal with pole; the resulting exponent for a simple zero is -3+4-1=0, not positive. The source does not try to deduce a contradiction in that case.

## 4. Nonprincipal quadratic at s=1: positivity carried across the entire plane
Assume chi^2=chi_0, chi!=chi_0, and L(1,chi)=0. Set a(n)=sum_{d|n}chi(d), n>=1. This is multiplicative as convolution of multiplicative functions; a(1)=1. On prime powers,
 a(p^k) = 1 (chi(p)=0);
          k+1 (chi(p)=1);
          1 for even k and 0 for odd k (chi(p)=-1).
Therefore a(n)>=0 real for every n, using prime factorization. The arithmetic-function value at n=0 is defined as zero. The L-series of a converges absolutely for Re(s)>1 by absolute convolution, even though the source needs only abscissa<=1.
Define F(s)=zeta(s)L(s,chi) for s!=1, F(1)=L'(1,chi). The hypothesis L(1,chi)=0 and zeta residue one yield
 F(s)=[(s-1)zeta(s)] [ (L(s,chi)-L(1,chi))/(s-1) ].
The bracketed functions continuously extend at 1 to 1 and L'(1,chi), respectively. F is holomorphic off 1 and continuous at 1, hence entire by the removable singularity theorem. On Re(s)>1 it equals the L-series with coefficients a(n). At -2, zeta(-2)=0 and L is entire, hence F(-2)=0. Source Nonvanishing.lean:75–112,126–211, especially F_differentiable and F_neg_two.

The decisive lemma is LSeries.positive_of_differentiable_of_eqOn (LSeries/Positivity.lean:68–82). In its full generality a>=0, a(1)>0, f entire, f agrees with LSeries(a) for Re(s)>b, b real and abscissa(a)<=b. Given real y take c=max(b,y)+1. At c, f(c)>0 by sum positivity (a(1) term). Since equality holds in an open neighborhood of c, every derivative is equal to its L-series derivative:
  (-1)^k f^(k)(c)=sum_{n>=1}a(n)(log n)^k n^(-c) >=0.
This includes k=0; for k>=1 use it in the Taylor expansion at c. Because f is ENTIRE, its Taylor series at c converges at every y, in particular y<=c:
  f(y)=f(c)+sum_{k>=1} [(-1)^k f^(k)(c)](c-y)^k/k! >=f(c)>0.
Each summand is real nonnegative, so the comparison is in ComplexOrder, not an inequality of absolute values. The exact source uses Differentiable.apply_le_of_iteratedDeriv_alternating (Complex/Positivity.lean:75–83), proving it via f(-z) and subtracting the constant term. No termwise continuation of the original Dirichlet series to y is required; Taylor convergence follows from the hypothetical entire extension. Take y=-2, contradict F(-2)=0. This excludes the quadratic zero exactly at 1. It does NOT exclude a possible exceptional real zero beta<1 by itself.

## 5. Joining the cases and formal pole convention
Nonvanishing.lean:385–415 splits chi^2=chi_0 and s=1 from its negation. In the former, admissibility chi!=chi_0 OR s!=1 forces chi nonprincipal, so section 4 applies; otherwise write s=1+i Im(s) and use section 3. The strict half-plane uses section 2.
At modulus one, L=zeta. Away from s=1 the analytic nonvanishing result holds without any convention. At s=1 the formal totalized zeta value is (gamma_E-log(4*pi))/2, nonzero since gamma_E<1<log(4*pi). This finite value is NOT the meromorphic value at a pole, NOT the Laurent constant, and NOT the regularized residue-one value. Source ZetaAsymp.lean:418–449. The RH family wrapper uses this separate formal fact only in the modulus-one branch. A family member is either modulus one or nonprincipal, by F.adm. Consequently every member is nonzero at all formal s with Re(s)>=1; the true analytic treatment of s=1 is the regularization in RUN2. This source wrapper has no extra assumption excluding quadratic real zeros in the critical strip.

## 6. Logarithmic derivatives: follow the actual convolution proof
Dirichlet.lean:372–442. The arithmetic identity sum_{d|n}Lambda(d)=log n follows from prime factorization: a prime p^e contributes e log p. Twisting gives
 (chi Lambda)*chi = chi log.
For Re(s)=sigma>1, sum Lambda(n)n^(-sigma) converges absolutely because 0<=Lambda(n)<=log n, and sum (log n)n^(-sigma) converges. Also |chi(n)|<=1; twisting cannot increase absolute terms. For the formal series at n=0 the term is zero, so no singular log 0 argument enters. By absolute convolution,
 [sum chi(n)Lambda(n)n^(-s)] L(s,chi) = sum chi(n)log(n)n^(-s) = -L'(s,chi).
Deriv.lean:45–100 proves differentiation in the open half-plane beyond absolute convergence: pick x0<y0<Re(s) with summability at x0, use a uniform summable majorant on Re(z)>y0, then apply holomorphic termwise derivative theorem. Higher derivatives follow by induction and the equality of abscissae for logarithm-weighted series (Deriv.lean:102–144). The latter follows from log n>=1 eventually, and forward log-weighted summability in the same open half-plane. Division by L is legal by section 2. Equality between series and continued LFunction, and equality of derivatives, holds on the open domain Re(s)>1. The modulus-zero special case is delta_1 and both log derivative sides vanish. For modulus one use chi=1, then transfer the derivative to zeta by equality on an open neighborhood. No Euler-product nonvanishing on the critical strip needed.

## 7. Complex asymptotic at 1, without assuming more than a simple pole
ZetaAsymp.lean:62–145,196–259,316–378. For real sigma>=1 use
 T_n(sigma)=int_n^(n+1) (u-n)u^(-sigma-1) du, n>=1.
It is nonnegative and bounded by 1/n^2 uniformly on sigma>=1, so T=sum T_n is continuous there by dominated summation (each integrand is continuous in sigma on its finite positive interval). At sigma=1,
 T_n(1)=log(n+1)-log n-1/(n+1),
 sum_{n=1}^M T_n(1)=log(M+1)-H_(M+1)+1 ->1-gamma_E.
For sigma>1 direct integration gives the finite identity
 sum_{n=1}^M T_n(sigma)
 = (1-(M+1)^(1-sigma))/(sigma-1)
   - [sum_{n=1}^M n^(-sigma)-M(M+1)^(-sigma)]/sigma.
All boundary powers vanish in the limit because sigma>1. Thus T(sigma)=1/(sigma-1)-zeta(sigma)/sigma. Rearranging,
 zeta(sigma)-1/(sigma-1)=1-sigma T(sigma) -> gamma_E as sigma->1+.
For complex s put h(s)=zeta(s)-1/(s-1). It is holomorphic off 1; residue-one says (s-1)h(s)->0, i.e. h(s)=o(1/(s-1)). The removable-singularity criterion gives a holomorphic extension at 1; uniqueness of the limit on the real right-hand approach forces h(1) for this extension to be gamma_E. No extrapolation from the real limit alone. This justifies RUN2's regularized f(1)=1, f'(1)=gamma_E using f(s)=1+(s-1)h(s). The formal totalized zeta value uses a different subtraction involving Gamma_R and is irrelevant to this derivative.

## 8. Integration and outstanding boundaries
Read original CharFamilyLFunctionNeZeroOfOneLeRe.lean and lemmaL.lean again: family nonvanishing is used only for Re(s)>=1 in lemmaL, and for excluding 1 in poleData; 0<theta<1 and delta>0 remain explicit hypotheses of lemmaL with WindowHyp. For theta<Re(s)<1 any hypothetical zero has positive real part and is a member of zeroSet, regardless of whether real or complex. RUN1's window theorem yields Re(s)<=theta, contradiction. No circular use of the sought RH or of nonvanishing in Re(s)<1 in these imported lemmas. No assumptions added, no claims of exact kernel dependency graph, full coverage or URT superiority. Deep imported holomorphic Taylor, Euler-product, residue, removable singularity and trivial-zero implementation proofs remain to be independently mapped; classical human derivations above give their role but are not a full transitive expansion. Source classification: SOURCE-MATCHED with cited theorem bodies; finite regression only. Do not use the latest main revision's changed hashes as proof-equivalence evidence.

## 9. Executed reproducible finite regression (Node.js or ES2020)
The checks test the coefficients, exact rational-circle identity (BigInt), twisted convolution, order bookkeeping and finite zeta identity. These are regression examples, not evidence for the universal analytic theorem. Negative control explicitly detects failure to get a positive exponent when the third factor is singular and the assumed zero is simple.

~~~javascript
const counts={primePower:0,quadraticConvolution:0,unitCircle:0,twistedConvolution:0,poleOrder:0,zetaAux:0};let maxErr=0;const ck=(b,m)=>{if(!b)throw Error(m)};
const chars=[{q:3,a:[0,1,-1]},{q:4,a:[0,1,0,-1]},{q:5,a:[0,1,-1,-1,1]},{q:8,a:[0,1,0,-1,0,-1,0,1]}];
const primes=[2,3,5,7,11,13,17,19];
function lam(n){if(n<2)return 0;for(let p=2;p<=n;p++)if(n%p===0){let m=n;while(m%p===0)m/=p;return m===1?Math.log(p):0;}return 0}
for(const {q,a} of chars){const chi=n=>a[n%q];for(const p of primes)for(let k=0;k<=12;k++){let v=0;for(let j=0;j<=k;j++)v+=chi(p)**j;let w=chi(p)===0?1:chi(p)===1?k+1:k%2?0:1;ck(v===w&&v>=0,"prime power");counts.primePower++}
for(let n=1;n<=512;n++){let s=0,t=0;for(let d=1;d<=n;d++)if(n%d===0){s+=chi(d);t+=chi(d)*lam(d)*chi(n/d)}ck(s>=0&&(n!==1||s===1),"coeff");counts.quadraticConvolution++;ck(Math.abs(t-chi(n)*Math.log(n))<1e-12,"twist");counts.twistedConvolution++;}}
for(let u=-25n;u<=25n;u++)for(let v=1n;v<=25n;v++){const D=u*u+v*v,A=v*v-u*u,B=2n*u*v;ck(A*A+B*B===D*D,"circle");ck(3n*D*D+4n*A*D+A*A-B*B===2n*(A+D)**2n,"343");counts.unitCircle++}
for(let m=1;m<=32;m++){ck(-3+4*m>=1,"regular third");counts.poleOrder++;ck(-3+4*m-1>=0,"singular third");counts.poleOrder++}ck(-3+4-1===0,"negative control");
for(const s of [2,3,4,5])for(const N of [1,2,7,13,64,128]){let sum=0,hs=0;for(let n=1;n<=N;n++){sum+=(n**(1-s)-(n+1)**(1-s))/(s-1)-n*(n**(-s)-(n+1)**(-s))/s;hs+=n**(-s)}let target=(1-(N+1)**(1-s))/(s-1)-(hs-N*(N+1)**(-s))/s;let e=Math.abs(sum-target);ck(e<1e-12,"finite zeta integral");maxErr=Math.max(maxErr,e);counts.zetaAux++}
console.log({counts,total:Object.values(counts).reduce((x,y)=>x+y,0),maxErr,negativeControl:"simple zero with third-factor pole gives exponent zero; cannot use 3-4-1 limit proof",status:"PASS"});
~~~

Actual V8 execution output:
~~~json
{"counts":{"primePower":416,"quadraticConvolution":2048,"unitCircle":1275,"twistedConvolution":2048,"poleOrder":64,"zetaAux":24},"total":5875,"maxErr":4.163336342344337e-16,"negativeControl":"simple zero with third-factor pole gives exponent zero; cannot use 3-4-1 limit proof","status":"PASS"}
~~~
Counts 5875 cases (plus the stated negative control); each unit-circle case uses two exact BigInt assertions. Four actual quadratic characters on residue classes modulo 3,4,5,8. Finite floating-point checks not proof of any limit. Six locked library modules and two original RH adapter modules inspected; no Lean execution. Source paths plus hashes preserved, no change of hypotheses.

RESUME HERE: independently audit RUN1's quantitative analytic Cauchy derivative and tail argument against the exact pinned LandauTheorems files, in particular the nearest-pole choice, radius isolation and all residue sign/conjugate branches; produce an explicit lemma-by-lemma audit ledger distinguishing local hypotheses from global window existence. Locate exact producer of LSeries_eulerProduct_exp_log in the locked Mathlib import graph and attach its source body as a leaf; do not redo the two line-one branches above. Check latest upstream path migration without assuming equivalence; coordinate audit/editor. The upstream arithmetic window producers remain the separate prime-window/geometry lanes' task.

HANDOFF TO: integration, proof editor, formal audit, literature, prime-window, character-box lanes. The boundary nonvanishing argument, exceptional-at-one quadratic case, log derivative and complex asymptotic are now human-readable on the original pin. The original window remains a conditional input.



---

## Appendix 36: math/2026-11-24_guarded_cusp_map_algebra.md
Working-repo blob 080046e0e9f4a74ed19d4d440443b9508fcd0c96. Original validation status retained.

# Human-readable local correspondence: guarded map, separator and exponent
2026-11-24. Source-matched conditional reconstruction, continuation of integration/2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. No new proof assumptions or physics. The entire RH reconstruction remains incomplete. This chapter is a substantive human mathematical derivation, not an exporter benchmark.

## Source ledger
- GoodMap: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/GoodMap.lean (blob 1223776d8052ec8c0e7fba84b94780fda55a60f2)
- JunkEx: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/JunkEx.lean (blob f3c62285ff5d609ea0032c5f0be843451a897570)
- Expo: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/ExponentMulAbsPow.lean (blob 0ef94a48be4acf09edadefd011f3110fa43caefe)
- NonTame: src/Development/AutomorphicArithmetic/WhittakerHecke/TameInertiaCharacterFrobeniusConjEqPow.lean (blob aa1a06aca447102686d4276eecc8273ef576ed4c)
- CuspEx: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/CuspEx.lean (blob 3c2550dd844817d87bf5eacae0fb1498df8603b0)
Exact types: Foundations/LocalLanglands/RecTTransport.lean, GoodMap, JunkEx, Expo, CuspT. Preserve all ambient number field, algebraic closure, place, local Artin, and smoothness assumptions.

## 1. Shared algebra: the character action
Write k for the completion, a for the local Artin map, T_chi x for x.tw chi, and S_chi V for V.lpTwist(chi comp a). All characters are smooth and unit-valued. Source clBasic/wDBasic give
T_psi T_chi x=T_(chi psi)x, T_1 x=x;
S_psi S_chi V=S_(chi psi)V, S_1 V=V.
In particular inverse twisting cancels. These identities are proved in GoodMap.tw_tw_inv', eq_tw_of_tw_eq, lpTwist_lpTwist' and reused in CuspEx.twist_twist. Define psi=chi*chi'^{-1}. If T_chi y=T_chi' y', then y'=T_psi y. This is a single group-action lemma; both domains must be retained, with smoothness and correct Artin pullback. Do not identify the two representations.

## 2. The good map is well-defined
Fix all ambient data and ha. GoodCusp is the source's rank-one or depth-zero-twist predicate (the latter includes a continuous p-adic field isomorphism). Define R(x,V) by either (i) x is rank-one chi and V is the Weil-Deligne character chi comp a, or (ii) there exist the stipulated p-adic isomorphism, cuspidal depth-zero y, parameter W with Par(a,y,W), smooth chi, x=T_chi y and V=S_chi W. No general depth-zero assumption on x.

For a good cuspidal x, existence follows by the rank-one construction or by invariance of cuspidality under twist followed by parEx on y. Uniqueness has four cases:
- two rank-one presentations: parOne character injectivity identifies chi;
- two depth-zero presentations: if x=T_chi y=T_chi' y', then y'=T_(chi/chi') y. Since both y and y' are depth-zero and y has positive rank, twTame implies chi/chi' is tame. parTw transports Par to (y', S_(chi/chi') W); parUniq identifies that parameter with W'. Twist by chi' and use the shared action to conclude S_chi W=S_chi' W';
- rank-one vs depth-zero: if x=ofChar(psi)=T_chi y, inverse twist identifies y=ofChar(psi/chi). The source parOne depth-zero iff tame gives tameness of psi/chi. Its rank-one parameter is Par, hence equals W by parUniq; twist by chi to obtain the original rank-one parameter;
- reverse mixed case follows by symmetry.
The relation is equivariant under every smooth further twist: in either case multiply the stored character by the new one, using parOne or the two group actions. Define r0(x)=epsilon V.R(x,V), using a nonempty WD type. For every existing R witness it equals that witness by uniqueness. This constructs the three GoodMap fields: rank-one agreement, equivariance on good cuspidal inputs, and Par for cuspidal depth-zero inputs over the indicated p-adic isomorphism (choose the trivial twist of the parEx witness). No claim epsilon selects a valid parameter for arbitrary bad input. This is the full local composition in GoodMap.lean, conditional on the cited substantive parEx/parUniq/parTw/parOne/twTame and basic laws.

## 3. Frobenius algebra produces the bad-branch separator
For n>=2 put q=normV(w)>1. JunkEx.exists_frobAut: given finite field K of cardinal q^n, characteristic p, q divides p^k=|K|, hence q=p^j. The q-power map f is an automorphism (iterate Frobenius, finite injective implies bijective). f^n=id because z^{q^n}=z. If 0<m<n and f^m=id, a generator b of K^* would satisfy b^{q^m-1}=1, so q^n-1 divides q^m-1, impossible. Thus order(f)=n.

JunkEx.junkData constructs K and a surjective homomorphism pi from inertia to the ADDITIVE group of K (Lean Multiplicative K), with open kernel and pi(Frob t Frob^{-1})=f(pi(t)). Exact construction: choose c in w but not w^2; extend the number field to L with a place u of residue degree n, inertia fixing L and c remaining a uniformizer. Frobenius restricts to a place-preserving automorphism of L and extends continuously to its completion. Use its residue field K, the valuation subring O, residue rho and the unit-residue logarithm l from exists_unit_residue_logarithm_of_roots_of_unity. Map inertia into the inertia over L by restriction/extension (the source proves this map is surjective); apply local Artin a_L and l to define pi. The logarithm is additive on the unit-value subgroup and surjective there; Artin maps inertia onto this subgroup. Its kernel contains the open preimage of the ball (b-1)/c^2 in O, since such b are closer to one than the uniformizer scale; continuity gives openness. Integral approximation in the completion shows rho(i z)=f(rho(z)); the uniformizer is fixed by i because c is from E. Artin transport and the residue-log equivariance prove the conjugation identity. Retain the field extension theorem, local reciprocity, residue-log existence, approximation and transport as upstream obligations, not established by the Frobenius arithmetic.

Now choose additive character psi of K whose automorphism stabilizer in <f> is trivial (exists_addChar_invariant_iff_finiteField_aut_eq_one). Set eta_j=psi o f^j o pi for integer j. Direct substitution yields eta_j(Frob t Frob^{-1})=eta_(j+1)(t). Surjectivity of pi and invertibility of f imply eta_j=eta_k iff f^(j-k)=1 iff n divides j-k. Each eta value has |K|-th power one; eta_0 kernel is open since it contains pi kernel. Apply indEx with Frobenius degree one, determinant parameter 1, orbit length n, obtaining irreducible J of dimension n whose inertia characteristic polynomial is product_{j=0}^{n-1}(X-eta_j(t)). The determinant at Frobenius is 1; on inertia the determinant is the product of eta values, hence a root of unity. Every Weil element is Frobenius to an integer power times inertia, so |det J(sigma)|=1.

Separation from every twist of a tame V: suppose eta_0 and eta_1 agree on wild inertia. Let chi=eta_0/eta_1. The source isWild_frob implies chi(Frob t Frob^{-1})=chi(t)^q (apply chi to Frob t Frob^{-1} t^{-q}, which is wild). Iterate n times. Because chi factors through pi and f^n=1, chi(t)=chi(t)^{q^n}=1. This gives eta_0=eta_1, contradicting n>=2 and the exact orbit law. Hence there is a wild t with eta_0(t) != eta_1(t). Any tame V is trivial on wild inertia, so after a scalar character twist its inertia characteristic polynomial at this t has only one root. Equality to J would force eta_0(t)=eta_1(t) (evaluate the polynomials at each root). Impossible. This is stronger than the conditional separation demanded by JunkEx. The source theorem invokes the exact induction existence and wild-inertia laws; no assumption of the ordinary tame local correspondence for arbitrary bad x.

## 4. Central-character exponent, shared with the separator
For each x choose its unique smooth central character omega_x using clBasic. Let d=rank(x)>0 and beta(omega) be the quasi-character exponent, so |omega(z)|=|z|^beta(omega). Define e(x)=beta(omega_x)/d. The twist x.nu(s) has the same rank and central character omega_x * absPow(s)^d. At a uniformizer, the logarithm of its modulus is -log q (q>1), so beta of that character is beta(omega_x)+ds. Hence e(x.nu(s))=e(x)+s. If J has dimension d and determinant modulus one, the twist J.lpTw(e(x)) has determinant modulus |a(sigma)|^(d e(x))=|omega_x(a(sigma))|. This proves both Expo fields. It does not prove complex determinant equality on the bad branch; division by d requires positive rank.

## 5. Assemble and prove the guarded cusp map
Define r(x)=r0(x) for GoodCusp(x) and J_rank(x).lpTw(e(x)) otherwise. For a bad cuspidal x, rank is positive and not one, hence >=2, so J is available. The eleven CuspT fields follow:
1–2 irreducibility and rank: for good rank-one use parOne; good twisted depth-zero use Par and twist invariance; bad use J and twist invariance.
3 rank-one agreement: rank-one is good.
4 real twists: GoodCusp is invariant under twist; good uses GoodMap and identification of absPow pullback; bad uses rank invariance, e(x.nu(s))=e(x)+s and lpTw_add.
5 absolute central law: good complex central law implies modulus; bad uses Expo and determinant normalization.
6–7 good twist and complex central law: equivariance; for depth-zero parameter the central character under twist is omega*chi^rank, while the determinant multiplies by the pullback of chi to the same power; rank-one from parOne and uniqueness of central character.
8 dual on good x: rank-one inverse character; depth-zero dual remains depth-zero and cuspidal, parDual and parUniq identify its parameter, and dual reverses a character twist. GoodCusp is preserved under dual.
9 injectivity with GOOD TARGET y: equality of parameters gives equal ranks. If x and y are good of rank one, equality of rank-one parameter evaluations and surjectivity of a identify their characters. For two higher-rank good inputs, x=T_chi u,y=T_chi' v, undo S_chi; r0(u)=S_(chi'/chi) r0(v). The two depth-zero parameters are tame and positive rank; wDBasic and tameArt imply chi'/chi is tame. Then parTw and the second (input-uniqueness) field of parUniq identify u=T_(chi'/chi)v; retwist to obtain x=y. For bad x and good y, rank equality excludes rank one; express y=T_chi v with the stipulated p-adic isomorphism and depth-zero v. Undo the real twist e(x) in equality, giving J_rank(x)=S_(chi * absPow(-e(x))) r0(v). But r0(v) is tame by Par, contradicting JunkEx. This is exactly the guarded cross-branch exclusion; no injectivity claim between two bad inputs.
10 good depth-zero implies tame: rank-one uses parOne; other good inputs provide the isomorphism needed to apply Par directly to x when DZ x.
11 TypeAt: for the inflated finite-field type, the native DzType.lDepth theorem gives depth-zero, and the continuous isomorphism provides GoodCusp via the trivial twist. Then the Par.type field gives the required type relation with all original parameters unchanged.
Thus CuspEx holds conditional on the named leaves. RecTExists uses this map and extends by segment sums; the 12-field assembly already exists in the preceding integration graph. Keep the guards distinct from an assertion of full LLC on bad objects.

## 6. Executed actual source algebra read
Re-fetched all five pinned blobs and checked 29 anchors. The selected mathematical argument graph, not a kernel DAG, was read once per node using URT q=(pi/e) exp(2pi i/phi^2) and bounded recurrence R=(1+q sum parents)/(1+|q| arity). The exact graph was retained; neither score nor reuse count is a proof premise. The shared character action supports GoodMap, Expo, and cusp injectivity without repeating the algebra.
```json
{
  "certificate": {
    "sourceFiles": 5,
    "anchors": 29,
    "sharedNodes": 26,
    "edges": 43,
    "rootScore": [
      0.07093824325476251,
      -0.10303904906976172
    ],
    "reuse": [
      [
        "twist-group",
        6
      ],
      [
        "par-uniqueness",
        2
      ],
      [
        "rank-one",
        4
      ],
      [
        "tame-transfer",
        2
      ],
      [
        "goodMap",
        4
      ],
      [
        "Frobenius-order",
        2
      ],
      [
        "eta-orbit",
        2
      ],
      [
        "JunkEx",
        2
      ],
      [
        "central-character",
        2
      ],
      [
        "Expo",
        2
      ]
    ],
    "status": "source-matched chapter graph, not kernel dependency closure"
  },
  "graph": [
    [
      "twist-group",
      []
    ],
    [
      "par-existence",
      []
    ],
    [
      "par-uniqueness",
      []
    ],
    [
      "rank-one",
      []
    ],
    [
      "tame-transfer",
      []
    ],
    [
      "good-rel-exists",
      [
        "par-existence",
        "rank-one"
      ]
    ],
    [
      "good-rel-unique",
      [
        "twist-group",
        "par-uniqueness",
        "rank-one",
        "tame-transfer"
      ]
    ],
    [
      "good-rel-equivariant",
      [
        "twist-group",
        "rank-one"
      ]
    ],
    [
      "goodMap",
      [
        "good-rel-exists",
        "good-rel-unique",
        "good-rel-equivariant"
      ]
    ],
    [
      "field-extension",
      []
    ],
    [
      "residue-log",
      []
    ],
    [
      "Artin-transport",
      []
    ],
    [
      "Frobenius-order",
      []
    ],
    [
      "junkData",
      [
        "field-extension",
        "residue-log",
        "Artin-transport",
        "Frobenius-order"
      ]
    ],
    [
      "additive-character",
      []
    ],
    [
      "eta-orbit",
      [
        "additive-character",
        "Frobenius-order"
      ]
    ],
    [
      "wild-contradiction",
      [
        "eta-orbit"
      ]
    ],
    [
      "induction",
      []
    ],
    [
      "JunkEx",
      [
        "junkData",
        "eta-orbit",
        "wild-contradiction",
        "induction"
      ]
    ],
    [
      "central-character",
      []
    ],
    [
      "exponent-shift",
      [
        "central-character",
        "twist-group"
      ]
    ],
    [
      "Expo",
      [
        "exponent-shift",
        "central-character"
      ]
    ],
    [
      "good-basic",
      [
        "goodMap",
        "rank-one",
        "twist-group"
      ]
    ],
    [
      "good-injection",
      [
        "goodMap",
        "par-uniqueness",
        "tame-transfer",
        "twist-group"
      ]
    ],
    [
      "cross-separation",
      [
        "JunkEx",
        "goodMap",
        "twist-group",
        "Expo"
      ]
    ],
    [
      "CuspEx",
      [
        "goodMap",
        "JunkEx",
        "Expo",
        "good-basic",
        "good-injection",
        "cross-separation"
      ]
    ]
  ],
  "readout": [
    [
      "twist-group",
      [
        1,
        0
      ]
    ],
    [
      "par-existence",
      [
        1,
        0
      ]
    ],
    [
      "par-uniqueness",
      [
        1,
        0
      ]
    ],
    [
      "rank-one",
      [
        1,
        0
      ]
    ],
    [
      "tame-transfer",
      [
        1,
        0
      ]
    ],
    [
      "good-rel-exists",
      [
        -0.21271459900945394,
        0.4715043256940475
      ]
    ],
    [
      "good-rel-unique",
      [
        -0.42838846335978914,
        0.5553584823632224
      ]
    ],
    [
      "good-rel-equivariant",
      [
        -0.21271459900945394,
        0.4715043256940475
      ]
    ],
    [
      "goodMap",
      [
        0.1248823097268596,
        -0.43505393812003473
      ]
    ],
    [
      "field-extension",
      [
        1,
        0
      ]
    ],
    [
      "residue-log",
      [
        1,
        0
      ]
    ],
    [
      "Artin-transport",
      [
        1,
        0
      ]
    ],
    [
      "Frobenius-order",
      [
        1,
        0
      ]
    ],
    [
      "junkData",
      [
        -0.42838846335978914,
        0.5553584823632224
      ]
    ],
    [
      "additive-character",
      [
        1,
        0
      ]
    ],
    [
      "eta-orbit",
      [
        -0.21271459900945394,
        0.4715043256940475
      ]
    ],
    [
      "wild-contradiction",
      [
        0.37721820313384125,
        -0.26342725510214926
      ]
    ],
    [
      "induction",
      [
        1,
        0
      ]
    ],
    [
      "JunkEx",
      [
        -0.03971542775591072,
        -0.0135028833837112
      ]
    ],
    [
      "central-character",
      [
        1,
        0
      ]
    ],
    [
      "exponent-shift",
      [
        -0.21271459900945394,
        0.4715043256940475
      ]
    ],
    [
      "Expo",
      [
        -0.01178267120793757,
        0.06426337920889563
      ]
    ],
    [
      "good-basic",
      [
        -0.1054759102187699,
        0.4543379844099152
      ]
    ],
    [
      "good-injection",
      [
        -0.23535457858295464,
        0.49979341589934223
      ]
    ],
    [
      "cross-separation",
      [
        0.06851897619010455,
        0.20727103466803903
      ]
    ],
    [
      "CuspEx",
      [
        0.07093824325476251,
        -0.10303904906976172
      ]
    ]
  ]
}
```
No synthetic speed benchmark or kernel recheck; full export retry GitHub run 45349329680 still in_progress on inspection. Human chapter is conditional, not the full RH proof.

RESUME HERE: replace the still-open ParEx/ParUniq/ParTw substantive leaves with exact source-derived constructions, beginning with the depth-zero ParEx parameter producer and preserving the isomorphism and regular-character hypotheses. Then merge this chapter into latest editor manuscript. The full export retry must actually finish before claiming complete proof-term coverage.
HANDOFF TO: proof_editor, literature_provenance, galois_representations, integration, audit.



---

## Appendix 37: math/2026-11-24_depth_zero_frobenius_parameter_proof.md
Working-repo blob ee837459e3ad710655196c3a2e260669e17ea1c5. Original validation status retained.

# Depth-zero parameter construction and uniqueness — human proof chapter
2026-11-24. Continuation of math/2026-11-24_guarded_cusp_map_algebra.md. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Status: source-matched mathematical reconstruction of the named compositions, conditional on their imported substantive leaves. No synthetic computation. No independent kernel run. Not a complete RH proof.

## Exact source ledger
- src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/CentralUnit.lean (blob 457b406cc2652f723ff98927964e50d2a0f9a21b)
- src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/ParUniq.lean (blob 87d971db5f5faa95d960b55914583b51d6baf31d)
- src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/NormEqProd.lean (blob 508e0b63fd6663de040d031771927c20a15bb3ba)
- src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/TameUniq.lean (blob 79c1421916a98253dca5785cf687c3d425cd73eb)
- src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/TwTame.lean (blob 0b571b6d5f85b283d8bcb8662c86cf664e037212)
- src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/DetByType.lean (blob df921e1cb033a12cb6d93974fbcff4746d3e60c9)
Definitions in src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/RecTTransport.lean (631f12febe08029e0d1d11139a704a6aaab367fb): InFor, TypeAt, Par, ParEx, ParUniq, ParTw, TameUniq, TwTame. Fixed ambient E, algebraic closure Ω, valuation A, place w, h, local Artin map a with ha; g prime and continuous i:Q_g ≃ completion k. Let y be cuspidal depth zero of rank n>0. Par(a,y,V) has five fields: irreducibility, rank, tameness, central-character determinant equality and the universal type law. The latter demands zero monodromy and InFor for EVERY allowed choice of field extension/residue map, regular character, finite cuspidal type, and inflation witness.

## 1. Existence: actual parameter from a regular finite-field orbit (CentralUnit.parEx)
Choose the unique smooth central character ω of y. Choose degree-one Weil element φ. TypeEx gives an inflated cuspidal finite GL_n(F_g) representation τ for the depth-zero y. ExtEx and ResEx supply D with residue field K of degree n over F_g and R:I→K* satisfying TameSys: surjection, open kernel, wild inertia in kernel, Frobenius conjugation given by g-power, and rank n. NameLaws supplies regular θ:K*→C* naming τ. Therefore |K|=g^n and F(z)=z^g has F^n=id. Regularity says θ∘F^r are pairwise distinct for 0≤r<n.

Define η_j(t)=θ((R t)^{g^{j mod n}}) for integer j, using the nonnegative remainder. Then
η_j(φ t φ^{-1})=η_(j+1)(t),   η_j=η_k iff n divides j-k.
First equality is direct Frobenius substitution and reduction of exponents modulo n. For second equality pull back along surjective R, use regularity on remainders, and translate equal remainders to divisibility. Kernel η_0 is open because it contains ker R. All η_j are trivial on wild inertia. Apply indEx with determinant parameter c=ω(aφ) ≠0 and orbit length n. It produces irreducible V of rank n, tame, with det V(φ)=c and
P_t(X)=∏_{j=0}^{n-1}(X-θ((Rt)^{g^j})).
This proves InFor for the initially chosen data, not yet TypeAt.

Central equality. For t in inertia, ResBase gives a unit u in Z_g* whose image under i is a(t) and whose reduction in F_g maps to ∏_j (Rt)^{g^j}=Norm_{K/F_g}(Rt). The nonzero inflation intertwiner from τ to y carries the finite central scalar action from NameCentral to the local central scalar ω. Evaluate on a vector with nonzero image and cancel that vector: θ(Norm(Rt))=ω(a(t)), where the norm is regarded in K*. The determinant from the inertia polynomial equals ∏_j θ((Rt)^{g^j})=θ(Norm(Rt)). Thus δ=det V and ω∘a agree on inertia and on φ. WDBasic uniqueness of characters from these generators gives δ=ω∘a everywhere. For every other central character of y use its uniqueness. This is actual determinant equality, not merely modulus.

Universal TypeAt. For arbitrary admissible g',i',n',D',R',θ',τ',σ', the source IsoUniq identifies g'=g and i'=i; the class equality identifies n'=n. TypeEx uniqueness gives equality of finite type characters for the two inflation witnesses. Hence θ' names τ' and also τ. ResIndep supplies field isomorphism e:K→K' transporting R to R'. NameLaws transports both the regularity and naming law for θ' to θ'∘e, then gives θ'∘e=θ∘F^j for some j<n. The same inertia polynomial results from cyclic reindexing of the full orbit. Irreducible WD has monodromy zero by WDBasic. This proves the universal TypeAt, not just one finite type. All five Par fields now follow with the original ambient hypotheses. Retained producers: TypeEx, ExtEx, ResEx, NameLaws, NameCentral, indEx, ResBase, ResIndep, IsoUniq and WDBasic.

## 2. One Frobenius polynomial gives both uniqueness laws (TameUniq)
Fix TameSys, positive n, regular θ and InFor for V. Cyclic shift θ→θ∘F^j permutes the n factors in P_t because F^n=id. This proves the first field of TameUniq.
If arbitrary θ' gives the same P_t for every t, compare coefficient of X^(n-1). Surjectivity of R yields, for every z in K*,
Σ_{j<n} θ(F^j z)=Σ_{j<n} θ'(F^j z).
Distinct multiplicative characters are linearly independent as complex-valued functions. Therefore their finite formal sums have identical multiplicities. θ' occurs on the right at j=0 because n>0, so it occurs on the left: θ'=θ∘F^j for some j<n. No assumption of regularity of θ' needed in this step.

Parameter uniqueness. For irreducible tame V,V' with same InFor and same determinant at every Weil element, use degree-minus-one φ=(Frob)^{-1} and a common tame generator t0 from pair_of_gen. In both representations let M=ρ(t0), G=ρ(φ), so MG=GM^g (normV(w)=g). Smooth tame representations are determined for intertwiners by the tame generator and φ; irreducibility of the full representation gives irreducibility of the pair. Both dimensions n follow from degree of P_t0. Source st1a supplies an eigenvalue z of M with exact g-power orbit of length n. It is one of θ((Rt0)^{g^i}), i<n. By F^n=id, z^{g^{n-i}}=θ(Rt0) is an eigenvalue of M'. Thus the orbits align. In an eigenbasis obtained by applying G repeatedly to a nonzero z-eigenvector, the eigenvalues are z,z^g,...,z^{g^(n-1)}; these are distinct and the basis has length n. G cyclically shifts basis vectors, with a last scalar c≠0. Indeed G^n v belongs to the original one-dimensional eigenspace. det G=(-1)^(n-1)c. Match starting eigenvalues by a cyclic change of start in the second basis. Equality of determinants at φ makes their last scalars equal. The linear map between the matched bases intertwines M and G. This is the matrix algebra of st1b; the source invokes st1a/st1b from the named imports. pair_of_gen extends the intertwiner to all Weil elements and both monodromies vanish by irreducibility. Hence V'=V. Do not replace the tame-generator theorem or smoothness by an unproved generation assertion.

## 3. ParUniq: both outputs and inputs
For fixed y choose τ,D,R,θ as in existence. The universal Par.type condition implies InFor for every competing V'. Their determinant characters coincide by Par.central applied to the same ω. Both tame and irreducible, hence TameUniq identifies V'=V.
For y' cuspidal depth zero with Par(a,y',V), dimension equality forces rank n. Choose its finite type τ' and naming θ' on the SAME D,R. TameUniq shows θ'=θ∘F^j, and NameLaws implies τ' and τ have equal characters. Equality of their central characters follows from equality of V's determinant and surjectivity of a. DetByType then gives y'=y.

DetByType algebra (actual DetByType.lean). Equal finite characters give isomorphic finite types. Transport both inflation embeddings to the same nontrivial finite type space W, obtaining injective type maps j:W→V_y and j':W→V_y'. For the diagonal product action P let J(w)=(j(w),j'(w)); let U be the span of all P(g)J(w). It is stable. The native torus/congruence theorem apply_mem_sup gives U⊆range J + twKer(P,KOne,1), and range J consists of KOne-fixed vectors. Smoothness and compact KOne imply fixed∩twKer=0; hence U∩fixed=range J. If U contained a nonzero pure second-coordinate vector, irreducibility would force all pure second-coordinate vectors into U, including (0,j'(w)) with w≠0, which is fixed and cannot lie in range J by injectivity of j. Contradiction. The other coordinate follows symmetrically. Projections U→V_y and U→V_y' are injective by this and surjective by irreducibility since their images are nonzero stable subspaces. Compose the inverse first projection with the second; equivariance follows from U stability. Thus the local representations are isomorphic. The crucial torus/congruence inclusion uses the cuspidal finite type and common central character; it is not a general assertion about arbitrary embeddings. Source finCusp_comp uses finite unipotent radical averaging and the cuspidal character condition to show there are no unwanted invariant vectors. Source isTypeMap_of obtains injection of each nonzero inflation map by finite-type irreducibility, with reduction surjectivity to transport equivariance. Preserve these imported geometric/representation lemmas.

## 4. Tame twists (NormEqProd.parTw)
Let χ be smooth tame. On the unit group the reduction map Z_g*→F_g* is surjective; χ∘i kills its kernel because χ is trivial on principal units. Therefore it factors as χ0 through reduction. For every permissible i' in TypeAt do this at that i', not by assuming an identification. Put ν=χ0∘Norm_{K/F_g}, a character of K*. It is Frobenius-invariant. Norm(z)=∏_{j<n}F^j(z), from finite field norm formula and geometric series. ResBase gives
χ(a(t))=ν(Rt) for inertia t.
A determinant twist of the finite type matches the local twist because determinant commutes with both reduction and i. This preserves the nonzero inflation map. To prove TypeAt for V'=S_χ V and x'=T_χ y, start with arbitrary naming θ and inflation τ for x'; untwist both: local T_(χ^-1)x'=y, finite type τ⊗(χ0^-1∘det), named by θ ν^-1. Regularity persists because ν is F-invariant, and cuspidality persists under determinant twist. Apply original V.type to these data. The roots at t before twisting back are (θν^-1)(F^j(Rt)); after twisting they are multiplied by χ(a(t))=ν(Rt). Thus
(θν^-1)(F^j(Rt)) ν(Rt)=θ(F^j(Rt))
for every j. This proves the required InFor for ALL target type witnesses. Irreducibility and rank are unchanged by twisting, tameArt and WDBasic preserve tameness, and determinant multiplication by χ(a(σ))^n agrees with the local central character ωχ^n. Irreducibility again gives monodromy zero. All five Par fields are established conditional on the named leaves.

## 5. Why a twist is depth-zero exactly when tame (TwTame)
Depth zero means a nonzero fixed vector for KOne. For any matrix in KOne, reduction is identity; determinant commutes with reduction, so its determinant is a principal unit. If χ tame, its determinant twist acts trivially on KOne, preserving the nonzero fixed vector via the representation equivalence.
Conversely assume rank>0 and both y and Tχ y have nonzero KOne-fixed vectors. Suppose a principal unit u has c=χ(u)≠1. Choose diagonal d with u in one slot and ones elsewhere. Then d∈KOne and commutes with every diagonal Cartan power. A twisted-fixed vector w satisfies ρ(d)w=c^-1 w. The same holds on every diagonal translate of w. Since c^-1-1≠0 each such translate lies in twKer(ρ,KOne,1), the span of differences ρ(k)v-v. Cartan decomposition writes any group element k1 D k2 with k1,k2 integral GL, which normalizes KOne; the twisted-fixed space is stable under k2, and twKer stable under k1. Consequently the whole orbit of w lies in twKer. Irreducibility and w≠0 imply its span is the whole representation. But y has a nonzero KOne-fixed vector and smooth compact-subgroup averaging gives fixed∩twKer=0. Contradiction. Thus χ kills principal units. This proves the exact iff, with both positive rank and original depth zero retained. Native Cartan, compactness, fixed-coinvariant complement and normalization lemmas remain.

## 6. Integration and verification
The same finite-field orbit P_t underlies existence, uniqueness and twists. Its two exact operations are cyclic rotation and pointwise multiplication by a Frobenius-invariant norm character. This gives a common algebraic reading of those proofs without conflating their hypotheses or discarding choices. No claim of full LLC on arbitrary inputs or of independent Lean verification.
Actual connector check re-fetched 6 original files at the pin, matched all blob IDs and 34 explicit source anchors. No synthetic data, performance claims or simulations. This chapter replaces the previous ParEx/ParUniq/ParTw/TwTame interface-only leaves by source-matched derivations, with the new imported theorem boundaries explicit. TameUniq and DetByType also expanded. Remaining native prerequisites include regular-character naming/classification, TypeEx, ExtEx/ResEx/ResBase/ResIndep, indEx, the exact tame-pair existence st1a, torus apply_mem_sup and ParDual (not fully translated here).
RESUME HERE: follow the actual NameLaws and TypeEx producers, then indEx, to replace the remaining shared finite-field representation and induction leaves. Incorporate this chapter into the main manuscript. Do not repeat GoodMap, JunkEx, Expo or the conditional 24-field algebra.
HANDOFF TO: editor, integration, galois, literature, audit.



---

## Appendix 38: math/2026-11-24_finite_character_induced_parameter_proof.md
Working-repo blob d51d022a29519bb83b23b1aab85ea9c603d4bd69. Original validation status retained.

# Finite-field character classification and explicit induced Weil parameter
2026-11-24. SOURCE-MATCHED continuation of depth_zero_frobenius_parameter_proof.md. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. No synthetic data. The original proof's finite exceptional cases are computed exactly below. No local Lean kernel run; full RH reconstruction remains open.

## Source ledger
All below under src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/:
- NameLaws.lean bacce9b1591f33a3d01f365d52dea406fd415dce
- NameCentral.lean 3f464328ab80f63f72c59c04fb41eec8e2e3c705
- TypeEx.lean 1fe68a05883be17946a5f6d797d22d9fe552b993
- IsSemisimpleInducedParam.lean d3412a05a3986e499bf640fe1eae54fea6ec6b55
- PairCheckThreeTwo.lean 4def811c68481291d9ad29ecb3106823dbaa6378
- PinFld.lean 4909d7af14357fba651c1b857a20192e6f01c471
- PinChar.lean be922c67043b498872a67f810bbb33b9c7a87d7b
- PinNum.lean b6859bd0b7f1e8653ff15ab063f946a370746958
Exact definitions RecTTransport.lean 631f12febe08029e0d1d11139a704a6aaab367fb.

## 1. The restricted character-sum uniqueness problem (Pin)
Fix prime g, n>0, K/F_g of degree n, G=K*, N=g^n-1. A regular character θ has n distinct Frobenius conjugates A={θ^(g^j):0≤j<n}. For a second regular θ' let B be its orbit. Unless θ' is in A, A and B are disjoint because Frobenius has period n.
Let D consist of z in G with degree over F_g less than n. If z has degree d<n, d divides n by the tower law. Choose prime p dividing n/d. Then d divides n/p, so z lies in the subgroup z^(g^(n/p)-1)=1. Hence |D|≤b(g,n)=Σ_{p|n prime}(g^(n/p)-1). This is PinFld.exists_D.
For disjoint A,B set H(z)=Σ_A χ(z)-Σ_B χ(z). Characters of G are unit-modulus and orthogonal: the sum of a nontrivial character is zero by multiplying its argument by an element on which it is not one. Thus Σ_G |H|²=N(|A|+|B|). If H vanishes outside D and |A|+|B|>0, the triangle inequality gives N(|A|+|B|)≤|D|(|A|+|B|)²; divide by the positive size. This proves PinChar.card_le. Also if a character η is trivial on D, the Fourier coefficient of H at ψ equals that at ψη; since the coefficients are N, -N or 0 according to membership, both A and B are stable under multiplication by η. This proves PinChar.mul_mem.
Taking B empty, if the orbit sum vanished at every full-degree z, we would get N≤n b. PinNum.one_bd supplies n b<N, contradiction. Taking B the second orbit gives N≤2n b. PinNum.two_bd supplies the opposite strict inequality except four explicit pairs (g,n)=(2,2),(3,2),(2,4),(2,6). The bound b≤2g^floor(n/2) follows from distinct divisors n/p≤floor(n/2) and a geometric sum; for n≥12 use m=floor(n/2)≥6 and 8m+1≤2^m≤g^m (elementary induction), giving 2n b+1<g^n. The smaller n polynomial inequalities and one_bd remain cited to the source PinNum (not independently rechecked here in full).

### Actual exceptional finite cases, resolved by exact orbit arithmetic
G is cyclic of order N, so every character is η0^t for a fixed generator η0 of its dual and exponent t modulo N. This follows by sending a generator of G to a primitive Nth root and noting every character is determined by that value. In each source exceptional pair choose e divisible by every g^(n/p)-1. Then η0^e is trivial on D. Disjoint orbits with equal full-degree sums would both have to be regular exponent orbits invariant under addition of e modulo N.
Computed exhaustively on the FOUR ACTUAL Lean exceptions (PairCheckThreeTwo.lean, not generated fixtures):
(g,n,N,e) | regular exponent count | regular & translation-invariant exponent count | invariant orbits
(2,2,3,1) | 2 | 0 | none
(3,2,8,2) | 6 | 0 | none
(2,4,15,3) | 12 | 0 | none
(2,6,63,21) | 54 | 6 | {7,14,28,35,49,56}
The first three exclude both orbits outright; the last permits only one orbit, so two disjoint ones are impossible. The code uses exact small integer residues and enumerates each exponent once; no floating-point approximations or simulation.
```python
for g,n,e in [(2,2,1),(3,2,2),(2,4,3),(2,6,21)]:
    N=g**n-1
    reg=closed=0
    orbits=set()
    for t in range(N):
        a={t*pow(g,j,N)%N for j in range(n)}
        if len(a)!=n: continue
        reg+=1
        if {(x+e)%N for x in a}!=a: continue
        closed+=1
        orbits.add(tuple(sorted(a)))
    assert len(orbits)<=1
    print(g,n,N,e,reg,closed,sorted(orbits))
```
Executed V8 equivalent produced the table above. Therefore Pin's nonvanishing and uniqueness follow from orthogonality, field arithmetic, the cited PinNum general bounds and the independently checked native exceptions.

## 2. NameLaws and central scalar (NameLaws, NameCentral)
The source greenRegularCharacters supplies a family τ_F(θ) of cuspidal characters indexed by regular θ, equality exactly up to Frobenius orbit and exhaustion of cuspidal characters. Its irreducible-characteristic-polynomial formula is
Tr τ(y)=(-1)^(n-1) Σ_{j<n}θ(z^(g^j)),
where z is a root of charpoly(y). Keep the Green theorem itself as a named imported obligation; the following deductions do not prove the theorem.
Every full-degree z∈K* is realized as an eigenvalue of an invertible matrix y in GL_n(F_g): multiplication by z on the n-dimensional field has characteristic polynomial the minimal polynomial of z (power basis), irreducible and with nonzero constant term. Two regular names for the same finite character therefore have equal orbit sums at every full-degree z. Pin implies they differ by a Frobenius power. Exhaustion gives a regular name for every cuspidal τ; comparison to the family τ_F plus uniqueness then proves that names in one orbit give equal finite characters. Frobenius powers preserve regularity since F^n=id. Any ring isomorphism of finite fields over F_g commutes with the base prime field and Frobenius; transporting a root and its character by this isomorphism preserves both the naming formula and distinctness of conjugates. These are all four NameLaws fields.

For central scalar c∈F_g*, Schur's lemma gives τ(cI)=l I since τ is irreducible. Pin gives a full-degree z with nonzero orbit sum. Multiplication by c does not change the field generated by z. Let L_z denote the invertible multiplication matrix. Then L_(cz)=cI L_z and the naming formula gives Tr τ(L_(cz))=θ(c)Tr τ(L_z) because c is Frobenius-fixed. The scalar action gives the same trace as l Tr τ(L_z). The trace is nonzero by Pin, hence l=θ(c). This proves the exact NameCentral field without division by a potentially vanishing character value.

## 3. Actual induced Weil parameter (IsSemisimpleInducedParam.indEx)
Fix ambient field/place data, degree-one Weil element φ, n>0, characters η_j of inertia indexed by integers with η_j(φtφ^-1)=η_(j+1)(t), η_j=η_k iff n divides j-k, and open ker η_0. Prescribe nonzero determinant c at φ. Put b=(-1)^(n-1)c. The space
V_b={f:Z→C : f(j+n)=b f(j)}
is n-dimensional: values on 0,...,n-1 determine f(j)=b^floor(j/n)f(j mod n), valid also for negative j because b≠0. This gives an explicit linear isomorphism V_b≃C^n.
Write σ=φ^d t_σ with d=deg σ, t_σ in inertia. Define
(ρ(σ)f)(j)=η_(j+d)(t_σ) f(j+d).
The n-periodicity of the η_j ensures preservation of V_b. For σ,σ' with degrees d,d', t_(σσ')=φ^-d' t_σ φ^d' t_σ'. Character covariance implies η_(j+d+d')(φ^-d't_σφ^d')=η_(j+d)(t_σ); multiply the two character factors to obtain ρ(σσ')=ρ(σ)ρ(σ'). Identity acts trivially. Inertia acts diagonally by η_j(t), φ by the cyclic shift with last row wrap b. Hence det ρ(φ)=(-1)^(n-1)b=c and charpoly ρ(t)=∏(X-η_j(t)).
Smoothness: each ker η_j is the continuous conjugation preimage of ker η_0. Their finite intersection for 0≤j<n is open in inertia and fixes the entire space. Semisimplicity of each ρ(σ): write σ^n=φ^(n d)t for t in inertia. Since inertia is compact and the action kernel is open, its image is finite, so some positive m has ρ(t)^m=I. The shift by nd acts as scalar b^d. Thus ρ(σ)^(nm)=b^(dm)I. The polynomial X^(nm)-b^(dm) has distinct complex roots because nm>0 and b≠0. An operator annihilated by it is semisimple.
Irreducibility: let U be a nonzero invariant subspace and u∈U with u_i≠0. For another occupied coordinate k, choose inertia t distinguishing η_i(t) from η_k(t); the vector (ρ(t)-η_k(t)I)u is still in U, has i-coordinate nonzero and k-coordinate zero, and creates no new nonzero coordinates. Iterating eliminates all other occupied coordinates, and scaling gives e_i. Shift powers then give all coordinate vectors; hence U=V_b. This is the support-decreasing induction single_mem in the source. Set monodromy zero, satisfying nilpotence and the WD covariance equation. Transport to C^n to obtain a Weil-Deligne class. If every η_j kills wild inertia then the constructed representation is tame. This proves the five exact IndEx outputs conditional only on its stated character-orbit and ambient group/topology premises; the native proof explicitly constructs the representation, no classification or LLC theorem invoked here.

## 4. TypeEx: existence and uniqueness of the finite depth-zero type
Transfer σ through the continuous p-adic isomorphism i. The native isSupercuspidal_of_isCuspidal and isCuspidal_repK show the principal-congruence fixed representation has the cuspidal condition. Since depth zero gives a nonzero fixed vector, TameGen.exists_simple produces a finite simple subrepresentation τ of the finite quotient action with injective intertwiner into the fixed space. The native character criterion gives IsCusp τ.character: invariants for a proper unipotent radical vanish by the cuspidality result and injection. Inclusion of the fixed space gives the nonzero inflation map into σ. Transport through the representative-class equivalence gives existence on the originally specified representative.
For uniqueness, transport two inflation maps to the same representative of the local class. Each is injective: its kernel is finite-group invariant (reduction surjective), and finite type irreducible plus nonzero map forces zero kernel. The imported st6 theorem of the torus/congruence argument gives that the image of each is the ENTIRE principal-congruence fixed space, using finite cuspidality and local central character. Hence their common image identifies the two finite type spaces by the linear isomorphism φ'^{-1}φ. The two maps intertwine the same local action of integral GL; reduction is surjective, so this is an isomorphism of finite-group representations. Their characters agree by invariance of trace under conjugation. This proves TypeEx's two fields, preserving the native supercuspidal, finite simple submodule and st6 producer obligations.

## 5. Frontier and integration
The actual native IndEx matrix construction and the exceptional Pin arithmetic are now translated, rather than left as theorem-name placeholders. NameLaws, NameCentral and TypeEx are reconstructed conditional on the listed producers. Shared Frobenius orbit and character algebra connect directly to the preceding ParEx/ParUniq/ParTw chapter and the guarded cusp-map chapter. No URT premise added. Source extraction/whole-proof coverage not claimed.
RESUME HERE: inspect the actual greenRegularCharacters producer and PinNum.one_bd/two_bd complete finite-case proof; then st6/finite cuspidal type producers and ExtEx/ResEx/ResBase/ResIndep. Merge chapter into current manuscript rather than repeat previous algebra.
HANDOFF TO: editor, literature, integration, galois, audit.



---

## Appendix 39: math/2026-11-24_green_exhaustion_and_pin_bounds.md
Working-repo blob 34caa94378031c7cdd0e0e0421383fc1e90a96e6. Original validation status retained.

# Close PinNum bounds and Green exhaustion by counting
2026-11-24. Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005. Continuation of finite_character_induced_parameter_proof. No synthetic tests; exact native inequalities. No independent kernel check.

## PinNum: all general bounds
Source: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/PinNum.lean, blob b6859bd0b7f1e8653ff15ab063f946a370746958.
Write B(g,n)=sum_{p prime divides n}(g^(n/p)-1), g>=2,n>=1. The distinct quotients n/p lie between 1 and floor(n/2), hence B<=sum_{j=0}^{floor(n/2)}g^j<=2g^floor(n/2). The last follows by induction: adding g^(m+1) to 2g^m gives at most 2g^(m+1).
For n>=12 write n=2m or 2m+1, m>=6. A=g^m>=2^m>=8m+1 (base 64>=49 and induction). For even n, 2nB+1<=8m A+1< A² since A²-8m A-1>=A-1>0. For odd n, 2nB+1<=(8m+4)A+1<2A²<=gA²=g^n, since 2A-(8m+4)>=8m-2>0. Thus 2nB+1<g^n.
For n=1..11 substitute g=c+h, h>=0, with c=4 for n=2, c=3 for n=4,6, c=2 otherwise. These cover every non-exceptional integer pair. The polynomial P(h)=(h+c)^n-2n sum_{p|n}( (h+c)^(n/p)-1)-1 has nonnegative coefficients and strictly positive constant, proven by the following exact binomial expansions (coefficients ascending degree; independently evaluated using BigInt):
- n=1, c=2: [1, 1]
- n=2, c=4: [3, 4, 1]
- n=3, c=2: [1, 6, 6, 1]
- n=4, c=3: [16, 60, 46, 12, 1]
- n=5, c=2: [21, 70, 80, 40, 10, 1]
- n=6, c=3: [320, 1062, 1095, 528, 135, 18, 1]
- n=7, c=2: [113, 434, 672, 560, 280, 84, 14, 1]
- n=8, c=2: [15, 512, 1408, 1664, 1104, 448, 112, 16, 1]
- n=9, c=2: [385, 2088, 4500, 5358, 4032, 2016, 672, 144, 18, 1]
- n=10, c=2: [343, 3440, 9900, 14560, 13240, 8044, 3360, 960, 180, 20, 1]
- n=11, c=2: [2025, 11242, 28160, 42240, 42240, 29568, 14784, 5280, 1320, 220, 22, 1]
Hence P(h)>0, proving two_bd for every non-exceptional g,n. For one_bd, outside exceptions use nB<=2nB. In the four actual exceptional cases the exact margin g^n-1-nB is positive:
- (2,2): B=1, margin=1
- (3,2): B=2, margin=4
- (2,4): B=3, margin=3
- (2,6): B=10, margin=3
This closes the previously retained PinNum.one_bd and two_bd numerical proof dependencies; combined with PinChar, PinFld and the explicit exceptional orbit classification in the prior chapter, the Pin theorem now has a complete ordinary mathematical argument using standard finite-field/group facts. No inferred new URT premises.

## Green regular-character theorem: actual exhaustion proof
Sources:
- src/Development/WeilBound/CoreStatements/StandardPublishedResults/StandardTheoremStatements/GreenRegularCharacters.lean 5b5cf915ed0b9e38e6e81450657ed8c903a75163
- src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GreenCuspidalCharsByRegularCharsProofStatement.lean 4d4dbc49de0b8bdb1950f53020b651b82654c67c
- src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GreenCuspidalCharsByRegularCharsProof.lean 8b77636fe17dd07c59e7b76bc1234be319b82395
- ExistsCuspidalCharacterOfRegularCharacterGLnStatement.lean 19d86e7ba54ddb5ec6ae7d95d53166bc1a6c9a14
- MonicIrreducibleInjectRegularCharacterOrbitsStatement.lean c82520e539321d142b9e52f3e6b3442586737651
- CardCuspidalMultisetsTotalDegreeLeStatement.lean 7f1435efc21379805c109e7e27b32e8c5a89d315
- NcardMonicNatDegreeCoeffZeroNeZeroStatement.lean fdc071c168aa5bad24905dd10086728d40a47f39
The latter four are in the same InertiaEigenvalues directory.

Fix prime g and degree d>0. Actual upstream existence theorem produces a family τ of cuspidal characters indexed by regular multiplicative characters θ of a degree-d finite field K. It supplies the degree product over 1<=i<d of (g^i-1), the elliptic character formula, and equality of τ exactly up to Frobenius conjugacy of regular θ. This is an important imported producer, not a hypothesis added to RH.

For each e>0 choose an e-degree finite field, using the specified K itself when e=d. The native primeLab_to_regularChar injects monic irreducible nonzero-constant polynomials of degree e into regular character orbits. Compose with the existence family to obtain L_e(P), a cuspidal character of GL_e(F_g), injective on such P. At degree d its image is contained in the specified τ family. At degree zero there are no irreducible prime labels (irreducible polynomial over field has positive degree). Consequently the graded map P↦(deg P,L_deg P(P)) is injective.

Let T be the set of monic degree-d polynomials with nonzero constant term. Its cardinality is (g-1)g^(d-1)=g^d-g^(d-1): choose the nonzero constant and d-1 arbitrary other coefficients. This independently explains the native GrPolys count. Factor each f∈T into a multiset of monic irreducibles. Every factor has nonzero constant term, since otherwise X divides f. Unique factorization and monicity give product of these factors=f. Mapping every factor by the graded injection gives a multiset F(f) of cuspidal characters of total degree d. This map is injective: invert each mapped factor on the image of the graded injection, then multiply. It retains multiplicities, not merely a set of factors.

Suppose χ is a degree-d cuspidal character outside the τ family. Its singleton multiset is not F(f) for any f, because equality of multisets would force one factor P of degree d with L_d(P)=χ, contradicting image containment. Adjoin this singleton to the image of T. The resulting finite set S of cuspidal multisets all of total degree d has cardinal g^d-g^(d-1)+1. But the native CardCuspidalMultisetsTotalDegreeLe theorem bounds every such S by g^d-g^(d-1). Contradiction. Thus every χ is in τ. This is the exact exhaustion argument in greenRegularCharacters_holds, not a circular call to Green regular classification.

## Remaining frontier
The Green exhaustion wrapper, PinNum general and exceptional inequalities, and polynomial count are now reconstructed. Retain these native producers explicitly: ExistsCuspidalCharacterOfRegularCharacterGLn (actual Green character construction and orbit equality); MonicIrreducibleInjectRegularCharacterOrbits; CardCuspidalMultisetsTotalDegreeLe (global upper count). They are not discharged by the counting argument. Next translate these, especially the upper count, then integrate with NameLaws, ParEx and the seven-input theta Green bridge. No full RH proof or kernel validation claimed.



---

## Appendix 40: grok_swarm/native_family_existence/CHAPTER_NATIVE_FAMILY_EXISTENCE.md
Working-repo blob 858edda335fc99a496c1a7298bb1bd9473db7281. Original validation status retained.

# Native arithmetic family existence: `classSel` → `recS` → `designS` → `exists_famP_of_kits`

**Lane:** native arithmetic family existence (Grok swarm). **Agent:** Grok. **Date:** 2026-11-24.
**Upstream:** `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`.
**Status:** SOURCE-MATCHED conditional reconstruction. The source files and tokens were checked by an executed script. An abstract skeleton was typechecked in Lean. The upstream-typed companion was **NOT EXECUTED**.
This chapter does **not** prove that a native family exists unconditionally. It reconstructs exactly how the formal proof *derives* family existence and which named producers it still consumes. No gate is closed. No URT premise is used.

Not redone here (reused): the `HypsAlt` outer constructor (`math/2026-11-24_hypsalt_unramified_constructor.md`), the 24-field size algebra, the guarded cusp map, the depth-zero Frobenius parameter, the induced Weil parameter, the Bernoulli top-set selection, the thick-sphere/rank chapters, and the `DIVinN` algebra.
Lanes not entered: Galois rows, the Green regular-character theorem, and Lean kernel extraction.

---

## 0. Where family existence sits in the proof (the junction)

The analytic side consumes `FamilyClassConnected (G.cls la)`, produced by `UpperTheory.Top.topDesWin` (DesWin.lean `94820ef3`). Its only existence premise is

    hEx : DesignExists (WithTw (WithSm 𝒞')) C0 .

In the actual root path (theta `TopShape.lean` `3f791ca1`, `shape_closed_link_n_of_green`), that premise is

    hE := designExists_of_tuSize_aux4n_litThin (fun Fm => 𝒜 Fm ∧ G.cls la Fm) cT (fun hM => hEx hM la G hla hH) …

with `hEx : MinkDiv → UpperTheory.Top.ExS 𝒜 cT`, a *field* of `TopShapeAlt` (TopShapeAlt.lean `0c6a19a0`) and hence of `HypsAlt`. Inside `designExists_of_tuSize_aux4n_litThin` (LinkEx.lean `e28c35e5`) the guard is discharged unconditionally by `hEx minkowski_bound_rat`. The result is then passed through `designChoices_upN` and `designExists_of_choices` (DesignExistsOfChoices.lean `bad4dbc2`), together with `hTu`, `hProv` and `chosenThin_closed … hLit`.

The field `HypsAlt.hEx` is built in `nonempty_hyps_of_allRows_alt` (theta NonemptyHypsOfAllRows.lean `6a09205d`) as

    hEx := fun hM la G hla hH => working_classes_frozen.2 _ _ (fun hM' => hE hM' la G hla hH) hM

where `hE : DC.MinkDiv → ExD 𝒜 cT` is the **first output of `UpperTheory.Top.classSel`** and `cT := fun _ y => cTmin y`.
`working_classes_frozen.2` (WorkingClassesFrozen.lean `92140623`) only re-reads `DC.DesignChoices` as `Formalism.MainNotions.DesignChoices`. The two records have the same 18 conjuncts. Only `TameDistinctF` (via `tameDistinctF_iff`) and `CodeUpF` (via `codeUpF_iff`, `Iff.rfl`) are converted.

**So "native family existence" is precisely the statement `DC.MinkDiv → ExD 𝒜 cT` for the class `𝒜` chosen by `classSel`.** The remainder of this chapter derives that statement down to named producers.

## 1. Shared mechanism, derived once: the eventual-parameter prefix is closed under ∧ (Lemma M)

Every existence statement below has the same quantifier prefix:

    ∃ε0>0 ∀eps∈(0,ε0] (eps<1/52) [∀C8≥1 …] ∃K0 ∀C (Std C, C.P.Cpde=C8, C.Large K0 C.P.CF)
      ∃c1 ∀cD≥c1 ∃c2 ∀ch≥c2 ∃x0 ∀(objects at scale x≥x0) …

This prefix appears in `ParEv`, `EvP`, `EvGd`, `ObjC`, `ObjCP`, `HostWW`, `KitCPW`, `RecExP`, `DesignChoices` and `Closed`.

**Lemma M.** If two statements with this prefix hold, their conjunction holds. Take `ε0 = min`, `K0 = K.sup K'`, `c1 = max`, `c2 = max` and `x0 = max`.

*Proof.* The only non-order-theoretic input is `large_of_sup` / `fc_large_of_sup`: `C.Large (K.sup K') CH → C.Large K CH ∧ C.Large K' CH`. This holds because `Large` is a list of lower bounds `max(K c, K' c) ≤ …` and `max` dominates each argument. Every other step is monotonicity of `≤` under `min` and `max`. ∎

Upstream instances that are exactly this lemma: `ParEv.and`, `EvP.and`, `ev_and`, the opening of `kitS`, the opening of `hostWW`, the threshold bookkeeping in `designS`, `designExists_of_choices` (`min ε0 ε1`, `K.sup K'`) and `topDesWin` (`min ε1 ε3`).
Below, "by M" means that the thresholds are merged this way. Nothing else happens at those steps.

## 2. NF-4 `UpperTheory.Top.classSel` (ClassSel.lean `bb17cd65`)

**Statement (all binders kept).** Assume
- `h1 : StandardLattice.SiegelMassRatioCM`;
- `h2 : ∀ D : D7, VolTie D → VolumeRatio₂ D`.

Then for all `KP`, slots `Q Q'`, `Bd : BdT`, `Lk : LkT Bd`, row property `H : ∀ 𝒜, RawSel Bd 𝒜 → Prop` and `cT`, if
- `hc : DC.MinkDiv → BaseCond KP ∧ FirstG KP Q ∧ ExportF KP Q ∧ SecondG KP Q Q'`,
- `hx : ExBL KP Q Q' Lk`, and
- `hr : RowL KP Q Q' Lk H`,

then there are a class `𝒜` and a raw selection `σ : RawSel Bd 𝒜` with
- (i) `DC.MinkDiv → ExD 𝒜 cT`;
- (ii) `∀ eps Fm, 𝒜 Fm → Duty7 Fm ∧ MtStableF Fm`;
- (iii) `IsSel Q' Lk (fun _ _ _ _ _ => True) 𝒜 σ`;
- (iv) `H 𝒜 σ`.

**Definitions used** (ValidFor…EventuallyWorking.lean `6f511130`; EventuallyAllScaleContextsAndOfBoth.lean `9cf715e7`):
- `QOf E κ D O := κ.Pos → ∀ c, ∃ b : Bd D O c, Built κ D O c b ∧ E κ D O c b`. Here `Built` means that b arises from a genuine built point `β : BPt K` with `κ.Of K`, `β.Is Q` and `Lk K β c b`.
- `cls E := clsP (QOf E)`, and `clsP QO Fm := ∃ κ, Link κ Fm ∧ DQ.cls7 (QO κ) Fm`.
- `pick E Fm hc x hx i := Classical.choose (cls_at …)`.
- `Row Q Lk H := ∃E, RowE E ∧ ∀ 𝒜 σ, IsSel E 𝒜 σ → H 𝒜 σ`.
- `ExBL := ∃R, LargeBaseCondition KP Q R ∧ ExB (sAnd Q' R) Lk`.
- `RowL H := ∃R, LargeBaseCondition KP Q R ∧ Row (sAnd Q' R) Lk H`.

**Proof.**
1. *One common slot.* `RowL.elim hx hr` intersects the existence slot `R_x` and the row slot `R_r` into `R = sAnd R_x R_r`. It does this with `LargeBaseCondition.and` (M again, at the level of scale contexts). The result is `r : LargeBaseCondition KP Q R`, `ExB (sAnd Q' R) Lk` and `Row (sAnd Q' R) Lk H`. The existence witness is transported to the stronger slot by `EvP.mono`, and the row by `Row.strengthen` (shrinking the slot only weakens the hypothesis `β.Is`).
2. *Canonical class.* `Row.elim` gives `E` such that
   - (a) `EvP (fun κ K => ∀β, β.Is (sAnd Q' R) → QOf E κ β.D β.O)`. This is `QOf₂`: combine `ExB` (some datum exists) with `RowE` (every linked datum satisfies `E`).
   - (b) `H (cls E) (pick E)`, because `pick_isSel` shows that `pick E` is a selection for `cls E`, and `Row` quantifies over *all* selections.
3. Set `𝒜 := cls (sAnd Q' R) Lk E` and `σ := pick …`. Then (iv) is 2(b).
4. (iii): `pick_isSel` weakened in `E` by `IsSel.mono` to `True`, then from slot `sAnd Q' R` to `Q'` by `isSel_of_sAnd` (ExistsClassSelOfRowL.lean).
5. (ii): `sevenDuties_of_class` unpacks `clsP` and applies `DQ.familyClass_sevenDuties_and_stableLattices` (named dependency D-10).
6. (i): apply `recS (QOf (sAnd Q' R) Lk E) cT`, which needs `DC.MinkDiv → RecExP (fun κ => withQD (QOf … κ))`. Given `hm : MinkDiv`, take `⟨a,b,c,d⟩ := hc hm`. Upgrade `d : SecondG KP Q Q'` to `d' : SecondG KP Q (sAnd Q' R)` using `secondG_sAnd_of_largeBase KP Q Q' R a (evG_of_ev r) d` (D-9). Then `memberTop_final_contextParameters h1 h2 KP Q (sAnd Q' R) (QOf …) a b c d' (2a)` returns `RecExP (fun κ => withQD (fun D O => κ.Pos → QOf … κ D O))`.
   **Guard identity:** `QOf` already begins with `κ.Pos →`, and `(P → P → X) ↔ (P → X)`. So the doubled guard equals `QOf` (`funext` + `propext`), and the required `RecExP` follows. ∎

**What `classSel` does and does not do.**
- `𝒜` is *defined* as the class of all `FamP`s linked to some parameter κ whose every point carries a selected built datum. `classSel` does not exhibit a member of `𝒜`.
- Non-emptiness, and in fact design-quality members for every small `eps` and every transport `K`, is exactly (i), and (i) is supplied wholly by `recS`.
- The selection uses `Classical.choose` and is non-constructive.
- The row conclusions `H` cost nothing extra because they are stated for every selection.

## 3. NF-5 `memberTop_final_contextParameters` (MemberTopFinalContextParameters.lean `57bbacba`)

Under `SiegelMassRatioCM` and `∀D, VolTie D → VolumeRatio₂ D`, with `BaseCond KP`, `FirstG KP Q`, `ExportF KP Q`, `SecondG KP Q Q'`, and `EvP (fun κ K => ∀β, β.Is Q' → QO κ β.D β.O)`, we get `RecExP (fun κ => withQD (fun D O => κ.Pos → QO κ D O))`. It is a composition of two wrappers:
- `volumes_eq_masses_of_unfold hU`, which turns VolumeRatio into VolumeEqMass;
- `layeredAutomorphicData_exists_of_twoPasses`, which equals `GroupRetwisting.recAtG_of_two_passes` and gives `RecAtG (FromCoreAt Q' ∧ TupUsedAt ∧ TwAllAt ∧ MtStableAt)`;
- `existsLayeredData_of_goodScaleContexts`, which equals `GlobalTheory.Fc.recExP_of_recAtG` and lifts it to `RecExP`.

**This is the deepest automorphic input of family existence.** It says that at every good scale context there is layered automorphic data `(D, Y)` over the prescribed `(P, Lv)`, and that every led part of that data satisfies the object property. The two producers `recAtG_of_two_passes` and `recExP_of_recAtG` are not unpacked here (D-1, D-2).

## 4. NF-3 `UpperTheory.Top.recS` (ObjCTrue.lean `abb0785a`)

**Statement.** For `QO`, `cT`, `hR : DC.MinkDiv → RecExP (fun κ => withQD (QO κ))` and `hM : DC.MinkDiv`, we get `ExD (clsP QO) cT`. That is, for every `la > 1`, every `G : FReq` and every `HostExW la G.req`,

    DC.DesignChoices (DC.WithTw fun Fm => clsP QO Fm ∧ G.cls la Fm) 3 cT .

**Proof.** Fix `la`, `G`, `hla` and `hH`.
1. `hS : SmallPrimeOne := smallPrimeOne_of_primesRel primesRel_holds` (D-3, stated unconditionally upstream).
2. Get `hO : ObjCP (fun κ => withObj (ptO (withQD (QO κ))))` from `existsObjects_of_admissibleTwistDatum _ (normPrimes_and_levelPrime_unconditional.2) (hR hM)` (D-4, D-5). Layered data at every good context becomes, at every admissible (scale, ranks, host, twist words, injective code `c`, start index `u0 < R.n`), a point `p : Pt C` at that scale with `Val`, `HostArith`, `From H a b c u0`, `CanonInst` and the object property.
3. `hW : HostWW la G.req := hostWW _ la _ hla (hostQ hS la G hH) (objC_true hO) windowShareRequirementClosedForm_proof`.
   - `objC_true` forgets the object property to `True`, so the host statement does not depend on `QO`.
   - `hostQ` turns `HostExW la G.req` plus SmallPrimeOne into `HostExQW` (the host prime `q0 = q0H H`) (D-6).
   - `hostWW` merges host existence, object existence and window-share closure by M (D-7).
4. Apply `designS` to `kitS _ la G hW hO`. ∎

**Definitional step not re-checked here.** The `designS` conclusion has class `(∃κ, Link κ Fm ∧ DC.cls (ptO (withQD (QO κ))) Fm) ∧ G.cls la Fm`. Upstream accepts it as `clsP QO Fm ∧ G.cls la Fm`, i.e. `DC.cls (ptO (withQD (QO κ)))` unfolds to `DQ.cls7 (QO κ)`. We record this as an elaboration fact of the upstream build. It was not re-elaborated here.

## 5. `kitS` (KitS.lean `0c36d8f9`): one kit per admissible scale

From `HostWW la G.req` and `ObjCP Q`, `kitS` gives `KitCPW la (withDuty (Q κ) ∧ WallPt ∧ G.pt)`. By M it merges the host and object prefixes and adds two further thresholds:
- `exists_injective_words` gives an injective code `c : Fin M → Fin (R.k-2) → Bool` with `M = ⌈3·exp(CΓ m⁵ f L)²·x^CF⌉`;
- `small_prime_lt` gives `q0 < X'`.

At every window scale `s ≥ x0` it takes the host `(R, H, q0, a, b)` and chooses one point `pt i` for each `i : Fin R.n`, each with start index `u0 = i`. It then checks:
- the kit invariants: `same` via `TieSame.same_of_from`, a common word-embedding `eW`, and the cover of weights;
- the point properties via `has_withDuty_wall_and_choices` and `G.at_of_from`.

**The kit index type is `Fin R.n`, which is nonempty since `R.n > 0`.**

## 6. NF-2 `UpperTheory.Top.designS` (DesignS.lean `94baadfe`)

**Statement.** For `Q`, `cT`, `la > 1`, `G`, `DC.MinkDiv` and `KitCPW la (withDuty (withObj (Q κ)) ∧ WallPt ∧ G.pt)`, we get `DC.DesignChoices (WithTw ((∃κ, Link κ Fm ∧ DC.cls (Q κ) Fm) ∧ G.cls la Fm)) 3 cT`.

**Proof.**
- Take the threshold `min ε0 (1/53)`. Then `eps < 1/52` (an exceptional range kept).
- For `eps` and a transport `K`, obtain `(CT2, C8, C5, c6, Cb, K0)` with `C8 ≥ 1` and `C5, c6, Cb > 0`.
- `exists_std_large (thrTu K (cT eps 9)) K0 CT2 C8` picks one standard constant pack `C` that is large for both transports (D-8).
- Merge the kit thresholds with those of `szRow_numAt` (D-11) by M. This gives `cD = max c1 c1'`, `ch = max c2 c2'` and `x1 := max 2 (max x0 x0') > 1`.
- Choose a kit `k s` at every window scale `s ≥ x1`. `NumAt`, `ChTT_at` and `ChCode_at` hold at every kit point.
- **Glue** with `exists_famP_of_kits` (§7).

Then verify the 18 `DesignChoices` conjuncts for `setTu Fm (cT eps 9)`:

| conjunct | source of truth |
|---|---|
| class membership | `Link ⟨eps,C,cD,ch,C5,c6,Cb⟩` (`pre/out/mid/last` from the glue equalities; `out` after `setTu`), plus `setTu_cls` with `classOf` of the kit property, `fix_and_win_of_numAt` (PageFix, PageWin) (D-12) |
| `G.cls la` | windows: for every `y`, `S.windows y` gives `Y ≥ y` with `[Y, Y^la] ⊆ Win = Fm.Win`; pointwise `G.At` from `G.pt` on kit points |
| `TwGood` | `classOf_twPt` (D-13) |
| `0 ≤ CH`, `CH = C.P.CF ≥ 1` | `hStd` middle constants |
| `Large K CH` | `setTu_large` with the glue equalities and `hLK` |
| `ThickSetEventually`, `ChosenTT`, `ChosenBad Cb`, `ChosenCode 3 CF` | transported pointwise from kit points (threshold 0) |
| `ChosenQD C5` | kit `ChQD_at`, rewritten with `L_x` / `L_eps` for `x ≥ x1+1` |
| `BoxesF`, `QDRowsF` | `classOf_reqPt` (D-13) |
| `DGamDvdF` | from the kit's Minkowski choice **and `hM : MinkDiv`** (the only use of MinkDiv) |
| `TameDistinctF` | kit point property |
| `CodeUpF 3 CF` | `card Word = ⌈3Γ²x^CF⌉ ≤ 3Γ²x^CF + 1` (`Nat.ceil_lt_add_one`, x ≥ 0) |
| `CYL ≤ 9` and `cT eps CYL ≤ CTu` | PageFix gives `CYL = 9`, and `CTu` was *set* to `cT eps 9`, so the second holds **with equality** |

The last row shows a structural trick: the tuning constant `CTu` is not estimated at all. It is overwritten after the gluing by `setTu`. This is legitimate only because `Link.out` is stated for `setTu Fm κ.C.CTu` and `exists_std_large` chose `C` large for `thrTu K (cT eps 9)`. ∎

## 7. NF-1 `GlobalTheory.EX.exists_famP_of_kits` (ExistsFamPOfKits.lean `b5246ad2`): the gluing theorem

**Statement.** Assume `0 < eps < 1/52`, `1 < x1`, `1 ≤ la`, `Std C`, `C.GK.Nonneg`, window scales `S : Scales la`, and a kit `k s : Kit C cD ch s` for **every** scale `s` with `s.eps = eps`, `x1 ≤ s.x` and `S.Mem s`, such that every kit point has `Nonempty (NumAt C …)`. Then there is `Fm : FamP eps` with:
- `x1`, `cPre`, `cMid`, `cLast` and `CTu` inherited from `C`, `cOut = C.cOut.set 15 C.P.Cpde`, `J = S.J`, `Win = S.Win` and `Co = C.P.Cpde`;
- (transfer-1) every `PtProp` holding at all kit points holds as `classOf` on `Fm`;
- (transfer-2) every pointwise relation `Rr D L Gx` holding at all kit points holds at all `(x, i)` of `Fm`.

**Proof.**
- `S.unb` gives a window point `y ≥ x1`.
- Define `cutScale x` to be the scale at `x` itself if `x1 < x ∧ x ∈ Win`, and the fixed fallback scale at `y` otherwise. Then `x1 ≤ (cutScale x).x` and `S.Mem (cutScale x)`, so `k (cutScale x)` is defined for **every real** `x`.
- `famOfKits` sets `Ix x := {i : (k (cutScale x)).Ix // x ≤ x1 ∨ x ∈ Win}`, `D x i := (k (cutScale x)).pt i`, and so on. Every one of the roughly 80 `FamP` fields is discharged by a kit invariant (`same`, `val`, `sc_eq`) or by `NumAt`.
- `L_x` (the scale of the data at `x` is `x`) is required only for `x > x1`, and there `i.2` forces `x ∈ Win`, so `cutScale_alt` applies.
- `J ≤ Cpde` is read off one kit point (`host.J_le`), which makes the `cOut` slot 15 equal to `max(J, Cpde) = Cpde`.
- The two transfers hold because every point of `Fm` is literally a kit point. ∎

**Exceptional cases that must not be dropped.**
- (a) For `x > x1` with `x ∉ Win`, `Ix x` is **empty**. Every `∀ i : Fm.Ix x, …` is vacuous there, so the family carries data *only on windows*. This is why `G.cls la` and every downstream window statement need `Windows la`.
- (b) For `x ≤ x1` the indices exist, but the data are copies of the fallback kit at `y`, and `L_x` is not claimed.
- (c) `Ix_win` holds at window points and `Ix_zero` at `x = 0`, both from the kit's `ne`. `Ix_zero` uses `0 ≤ x1`.
- (d) `eps < 1/52`, `1 < x1` and `1 ≤ la` are all genuinely used.

## 8. Remaining dependencies (exact names; none is proved here)

| id | declaration | role |
|---|---|---|
| D-1 | `GlobalTheory.Mem.Top.GroupRetwisting.recAtG_of_two_passes` (IwasawaDecomposition/LayeredAutomorphicDataExistsOfTwoPasses.lean) | layered automorphic data at good contexts (core automorphic existence) |
| D-2 | `GlobalTheory.Fc.recExP_of_recAtG` (IwasawaDecomposition/ExistsLayeredDataOfGoodScaleContexts.lean) | RecAtG ⇒ RecExP |
| D-2b | `GlobalTheory.Mem.VolMass.volumes_eq_masses_of_unfold` | VolumeRatio ⇒ VolumeEqMass |
| D-3 | `GlobalTheory.EX.smallPrimeOne_of_primesRel`, `GlobalTheory.Lin.primesRel_holds` | small prime supply (primes in progressions) |
| D-4 | `GlobalTheory.T.existsObjects_of_admissibleTwistDatum` → (Statement wrapper `6affb818`) | RecExP ⇒ ObjCP |
| D-5 | `GlobalTheory.EX.normPrimes_and_levelPrime_unconditional` | LevelPrime |
| D-6 | `hostQ` (location not resolved in this run) | HostExW + SmallPrimeOne ⇒ HostExQW |
| D-7 | `UpperTheory.Top.hostWW` internals; `GlobalTheory.T.windowShareRequirementClosedForm_proof` | host/window merge, WClosed |
| D-8 | `exists_std_large` (GlobalInterpolation/ExistsStdLarge.lean) | one standard constant pack large for two transports |
| D-9 | `GlobalTheory.Mem.Top.GroupRetwisting.SecondG.sAnd_of_largeBase` | SecondG stable under adding a large-base slot |
| D-10 | `DQ.familyClass_sevenDuties_and_stableLattices`, `DQ.familyClass_points_satisfy_objectProperty` | duties of class members; `cls_at` |
| D-11 | `szRow_numAt`, `exists_injective_words`, `small_prime_lt`, `TieSame.same_of_from`, `DC.has_withDuty_wall_and_choices` | per-kit numerics and invariants |
| D-12 | `fix_and_win_of_numAt`, `setTu_cls`, `setTu_large` | PageFix/PageWin, the tuning overwrite |
| D-13 | `classOf_twPt`, `classOf_reqPt` | TwGood, BoxesF/QDRowsF |
| D-14 | `minkowski_bound_rat` (location not resolved in this run) | discharges MinkDiv in LinkEx |
| D-15 | premise producers of `classSel` in the root path: `SiegelMassRatioCM` (`hP`), `ExBL` (`hEx`) and `MemberE` from `large_unramified_exponent_bundles_exist_alt`; `hc` (BaseCond/FirstG/ExportF/SecondG); `∀ D, MassRatioUnderVolume D` | theta/Galois lanes (see the HypsAlt constructor chapter) |
| D-16 | `designChoices_upN`, `chosenThin_closed`, `chosenProviso_min`, `second_chern_linked_closed_rank_ties` | downstream DesignChoices ⇒ DesignExists (junction side) |

**Cross-lane named dependencies.**
- D-15's `hc` and `ExBL` come from the Galois/theta producers (`grok_swarm/galois_rows/` lane and the theta lane).
- None of the above uses the Green regular-character theorem. That theorem enters only at `closed_linkIRR_of_join_count hGreen` in `TopShape`, i.e. *beside* family existence in `topDesWin`, not inside it.

## 9. Validation actually performed (2026-11-24, this box)

1. **Source verifier (EXECUTED).** `verify_native_family_sources.py --source-root <sparse blobless checkout at 40e56bab>` checked 23 files and 83 verbatim tokens: every git blob id matched and every token was present, with 0 failures. The log is in `verify_run.log`. This checks transcription only, not mathematics.
2. **Abstract Lean skeleton (EXECUTED, typechecked).** `NativeFamilyMechanismAbstract.lean`: Lean 4.33.1 (commit 819816b2), core only, exit 0. It typechecks `pick_isSel`, `Row.elim`, `classSel_shape`, `cut_ge/cut_win/cut_eq`, `FIx_empty` (the off-window vacuity), `FIx_nonempty` and `glue_transfer`.
   - `#print axioms`: `Classical.choice` (plus `propext` and `Quot.sound` for the gluing lemmas).
   - The upstream types are replaced by opaque parameters and the ParEv/EvP layer is dropped. **This is not evidence that the abstraction is equivalent to upstream.** It shows only that the selection/gluing logic as described here is sound.
   - The log is in `lean_run.log`; the file has sha256 `452c4d03…`.
3. **Upstream-typed companion `RH_NativeFamilyExistenceCompanion.lean`: NOT EXECUTED.** It needs the compiled upstream environment, which is not present. Its statements are copied from upstream and closed by the upstream declarations (NF-1 … NF-6). It may also need `open` adjustments: there are several `Kit`/`cls` names across namespaces.

## 10. RESUME HERE

Unpack **D-1 `GroupRetwisting.recAtG_of_two_passes`** and **D-2 `recExP_of_recAtG`** at the pinned revision (IwasawaDecomposition/). Record their full quantifier prefix and show which of `BaseCond / FirstG / ExportF / SecondG` each pass consumes. These are the remaining substantive automorphic content of native family existence.
Preview, read from the source but not yet derived: `recAtG_of_two_passes` takes `EvG.inter` of `FirstG`, `ExportF` and `SecondG` (merged by `large₂`, i.e. Lemma M), together with `BaseCond.ex` and `LayOfCore.lay_of_core`. Pass 1 (`h1`) builds a core satisfying `Q` over an untwisted datum `TwDat.untw`, using `untw_set_eq : set = {1, del, del'}`. Pass 2 (`h3`) retwists it to a core satisfying `Q'`. `lay_of_core` then supplies the layer `Y`, and the volume tie supplies `VolumeEqMass₂`. The file contains no `sorry` token (checked with rg). Then elaborate `RH_NativeFamilyExistenceCompanion.lean` once the lean_validation lane has a cached upstream environment.

HANDOFF TO: lean_validation (elaborate the companion), integration/editor (insert §0–§7 between the HypsAlt constructor chapter and `topDesWin`), theta/Galois (D-15).



---

## Appendix 41: grok_swarm/native_family_existence/02_recAtG/CHAPTER_RECATG_TWO_PASSES.md
Working-repo blob 0e0ebf9692cf9f30298fc23cf19b856183cda248. Original validation status retained.

# Native family existence, part 02: `recAtG_of_two_passes` and `recExP_of_recAtG`

Lane: `grok_swarm/native_family_existence/` (Grok executor). Run 2, 2026-11-24.
Upstream: `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`.
Paths below are relative to `src/Development/AbelianVarietyTheory/` unless they start with `src/`.

**Honest status**
- This is a human-readable reconstruction of two upstream proofs, made by reading the pinned source. It is **not** a new formal proof, and the upstream project was **not** built or elaborated here.
- `RecAtGMechanismAbstract.lean` is a core-Lean abstract skeleton (no Mathlib, no upstream imports). It was typechecked with Lean 4.33.1 and exited 0; see `lean_run.log`. It checks only the logical shape of the shared mechanisms.
- `RH_RecAtGCompanion.lean` restates the upstream statements so they can be checked against an upstream build. It is **NOT EXECUTED**.
- `verify_recatg_sources.py` was run against a local partial clone at the pin: 25 files, 67 verbatim tokens, 0 failures (`verify_run.log`). Its first run flagged 2 tokens that I had paraphrased rather than copied verbatim. I corrected them and re-ran; both runs are described in the log header.
- No gate is closed by this document. URT is not used anywhere as a premise.

These are first-run items D-1 and D-2 from `../CHAPTER_NATIVE_FAMILY_EXISTENCE.md`, and they are the last two links between the native family chain and its inputs. D-1 consumes the four conjuncts of `MemberE` (the Galois/theta producers' output). D-2 turns D-1's output into `RecExP`, which `recS` in the first-run chapter consumes.

---

## 1. Exact statements (copied verbatim from the pin)

**D-1a** `GlobalTheory.Mem.Top.GroupRetwisting.untw_set_eq` (`Proofs/IwasawaDecomposition/LayeredAutomorphicDataExistsOfTwoPasses.lean:12`)
```lean
theorem untw_set_eq (B : Base) (pl : Finset ℕ) (f : Fr B.toPre) :
    (TwDat.untw B pl).set f = {1, f.del, f.del'}
```

**D-1** `GlobalTheory.Mem.Top.GroupRetwisting.recAtG_of_two_passes` (same file, line 22)
```lean
theorem recAtG_of_two_passes : (∀ D : D7, Formalism.L2.Theta.VolTieG D → StandardLattice.VolumeEqMass₂ D) →
    ∀ (KP : GroupRetwisting.BaseP) (Q Q' : V4.Slot), GroupRetwisting.BaseCond KP → GroupRetwisting.FirstG KP Q → GroupRetwisting.ExportF KP Q → GroupRetwisting.SecondG KP Q Q' →
      RecAtG (fun K D Y => GroupRetwisting.FromCoreAt Q' K D Y ∧ DQ.TupUsedAt D ∧ DQ.TwAllAt D Y.nch Y.xd ∧ DQ.MtStableAt D)
```

**D-2** `GlobalTheory.Fc.recExP_of_recAtG` (`Proofs/IwasawaDecomposition/ExistsLayeredDataOfGoodScaleContexts.lean:16`)
```lean
theorem recExP_of_recAtG : StandardLattice.SiegelMassRatioCM → ∀ (Q' : V4.Slot) (QO : Par → ∀ D : D7, Obj D → Prop), RecAtG (fun K D Y => GroupRetwisting.FromCoreAt Q' K D Y ∧ DQ.TupUsedAt D ∧ DQ.TwAllAt D Y.nch Y.xd ∧ DQ.MtStableAt D) → (EvP fun κ K => ∀ β : BPt K, β.Is Q' → QO κ β.D β.O) → RecExP (fun κ => DQ.withQD (fun D O => κ.Pos → QO κ D O))
```

### Definitions used (unfolded from `Definitions/AutomorphicMembership/{CmQuadraticFormEqAlternatingForm,NotBaseCondFalse}.lean`)

- `Ctx` is a scale context. Its fields are `s, C, cD, ch, P, q1, a, b, c, std, ok, Lv, du_eq, Ds_eq, Gam_eq`.
- `Ev p` is the eventual-parameter prefix ∃ε0 ∀eps ∃K0 ∀C ∃c1 ∀cD ∃c2 ∀ch ∃x0, quantified over contexts.
- `EvG p` is `Ev` with extra `C5 c6 Cb` and the guard `K.Good C5 c6 Cb`, where `Ctx.Good` is `ChGood` (`Definitions/GlobalTwisting/SetUnipotentTranslate.lean:61`; it consists of `ok : ChOK …` and `host : HostGood …`).
- `large₂ K p` holds when there are finite algebraic demand sets `S₁ P₁ A S₂` such that, for every base `B`, frame `f` and twisting datum `T`, the following four conditions together imply `p B f T`:
  - `K.Over B.toPre`
  - `Has₂ B (S₁ …) (S₂ … (T.set f))`
  - `P₁ … ⊆ T.pl`
  - `T.Avoids A …`
- `EvLgG p := EvG fun K => large₂ K (p K)`.
- `RecAtG QL := EvG fun K => ∃ D Y, Over D K.P K.Lv ∧ RecOK ∧ LedOK ∧ TWAt D Y.nch Y.xd ∧ QL K D Y`.
- `TwDat.untw B pl` is the untwisted datum: `Q = ∅`, `k = 0`, `ψ = 1`.
- `TwDat.set f = {1, del, del'} ∪ range (xiTw f)`, where `xiTw w = (if resChar w = pde then del' else del) * ψ w`.
- `BaseCond KP` has two fields:
  - `ex`: EvG gives some `Pre P` over K with frame `f₀`, such that for any algebraic `S₁, S₂` there is a `Base B` with `B.toPre = P`, `f ≅ f₀`, `KP B f` and `Has₂`;
  - `enl`: KP is stable under enlargement.
- `Forced K B T`: every prime equal to some `g i`, equal to `d`, or with `p ≤ X'' n` lies in `T.pl`. `lg_forced K : large₂ K (Forced K)` holds with `P₁ = {g0, g1, d} ∪ range(⌊X''⌋+1)`.
- `Step KP p q := EvLgG (KP → Forced → p → q)`.
- `FirstG KP Q := Step KP (T = untw B T.pl) (HasCore Q)`.
- `ExportF KP Q`: `KP → T = untw → Q c → ExportAt` (large-field form).
- `SecondG KP Q Q' := Pass KP Q (HasCore (Q ∧ TwAllAt ∧ Q'))`. Here `Pass` means: given KP, untw, `Q c` and ExportAt, then for all algebraic `A, S₂` there exist `B' f' T'` with:
  - `Enl B B'`
  - `f' ≅ f`
  - `T'.pl = T.pl`
  - `T'.Avoids A`
  - the `S₂` membership
  - the target `r`.
- `FromCoreAt Q K D Y`: some core `c` satisfies `Q`, and `⟨D, layObj Y⟩ = ⟨X.toD7, c.O⟩`.

## 2. Shared mechanisms (derived once)

**Lemma M** (from run 1): the Ev/EvG prefix is closed under ∧. Take `min` of the ε's, `K.sup` of the field thresholds (via `large_of_sup`), and `max` of the c- and x-thresholds. Its instances are `EvG.inter` (line 339) and `EvG.imp` (line 327) in `CmQuadraticFormEqAlternatingForm.lean`; `evG_of_ev` (line 302) forgets the guard.

**Lemma L** (new): `large₂ K ·` is closed under ∧ and is monotone. These are `large₂.inter` (line 278) and `large₂.imp` (line 282).
- *Proof idea:* take the union of the two demand quadruples `(S₁ ∪ S₁', P₁ ∪ P₁', A ∪ A', S₂ ∪ S₂')`. Any `(B, f, T)` meeting the union meets each part. Upstream does this through `lg_iff_lgOn` / `LgOn.inter`; I did not unpack those (dependency R-9).
- An abstract version (demand = list, union = append) is `NFE2.Large.inter` / `Large.imp` in `RecAtGMechanismAbstract.lean`, which was typechecked.

## 3. Human proof of D-1 (`recAtG_of_two_passes`)

Hypotheses: `h2v` (volume tie ⇒ VolumeEqMass₂, for every D7), `KP`, `Q`, `Q'`, `hK : BaseCond KP`, `hF : FirstG`, `hX : ExportF` and `hS : SecondG`. No other assumption is used.

**Step 0: merging the eventual conditions.**
- `hF`, `hX` and `hS` are each `EvG (large₂ …)`. Use Lemma M to merge them under one parameter prefix. Then, inside, use Lemma L to merge the three large-field conditions together with `lg_forced K`. The result is one `hL : EvG fun K => large₂ K (FirstG-step ∧ Forced ∧ ExportF-step ∧ SecondG-step)`.
- Use Lemma M again to merge `hK.ex`, `hL` and `evG_of_ev lay_of_core` (the Ev form of `lay_of_core`, which carries no guard).
- After this merge, fix the parameters and a context `K` satisfying the guard `K.Good C5 c6 Cb`. The guard is inherited from EvG and is not dropped.

**Step 1: choosing the base.**
- From `hK.ex` we get `Pre P` over K, a frame `f₀`, and the base-producing clause `hks`.
- From `hL` we get demand sets `S₁ P₁ A S₂` (algebraic) and the forcing clause `hlg`.
- Apply `hks` to `S₁ P f₀` and to `S₂ P f₀ F F₀ {1, f₀.del, f₀.del'}`. This gives a Base `B` with `B.toPre = P`, a frame `f ≅ f₀`, `KP B f`, and `Has₂` for these sets.

**Step 2: first pass, on the untwisted datum.**
- Let `T₀ := TwDat.untw B (P₁ …)`. We check the four hypotheses of `hlg` at `(B, f, T₀)`:
  - `Over` comes from `B.toPre = P`.
  - `Has₂` holds because `untw_set_eq` gives `T₀.set f = {1, f.del, f.del'}` (every ψ is 1, so each `xiTw` value is `del` or `del'`). This matches exactly the set the base was chosen for.
  - `P₁ ⊆ T₀.pl` holds by reflexivity.
  - `T₀.Avoids A` holds vacuously because `Q = ∅`.
- So we get the conjunction `⟨⟨h1, hfo⟩, h2, h3⟩`. `hfo : Forced` holds because `lg_forced`'s primes were merged into `P₁`.
- `h1 hKP hfo rfl` gives a core `c` with `Q` at `(B, f, T₀)`. The `rfl` is the FirstG side condition `T₀ = untw B T₀.pl`.

**Step 3: export and second pass.**
- `h2 … c hQ` gives `ExportAt`.
- `h3 … c hQ (ExportAt) (fun _ => ∅) (fun _ _ _ => ∅)` applies the second pass with trivial extra demands (`A = ∅`, `S₂ = ∅`). It produces:
  - an enlargement `B'` of `B` (same Pre, larger field);
  - `f' ≅ f`;
  - `T'` with the same place set `T'.pl = T₀.pl`;
  - a core `c'` with `Q ∧ TwAllAt ∧ Q'` at `(B', f', T')`.
- Exceptional case: the extra avoid set and number set are deliberately empty, so the Avoids and S₂ conclusions are trivial. The place set is not enlarged. `BaseCond.enl` is **not** used in this proof.

**Step 4: laying the core.**
- `c'.real.vol` is the volume tie `VolTieG`, and `h2v` turns it into `VolumeEqMass₂` for `X'.toD7`.
- `lay_of_core` (at this K) applied to `⟨B', …⟩ f' T' c'` gives `Y` together with:
  - `layObj Y = c'.O`;
  - `Over X'.toD7 K.P K.Lv`, `RecOK` and `LedOK` (`k1`–`k3`);
  - `TupUsedAt` (`k4`).

**Step 5: assembling the RecAtG conclusion.**
- `D := X'.toD7`, and Y is the layer from Step 4.
- `TWAt D Y.nch Y.xd` comes from `TwAllAt`, after rewriting `Y.nch = c'.O.nch` and `Y.xd = c'.O.xd` (both from `layObj Y = c'.O`), and then `.twAt`.
- `FromCoreAt Q'` has witness `⟨_, f', T', c', hQ'⟩`, and the Sigma equation follows from `hY`.
- The remaining conjuncts are `TupUsedAt` from `k4`, `TwAllAt` from `hTw'`, and `MtStableAt` from `c'.mtStable`. ∎

An abstract shape check (first → export → second → volume tie → lay) is `NFE2.two_pass` in the Lean skeleton, which was typechecked.

## 4. Link to `MemberE` (why the inputs are the Galois/theta outputs)

`Definitions/AutomorphicMembership/ThetaChr.lean:102`:
```lean
def MemberE (𝒮 : Slots) : Prop :=
  BaseCond KPx ∧ FirstG KPx (IsBuiltE 𝒮) ∧ ExportF KPx (IsBuiltE 𝒮) ∧ SecondG KPx (IsBuiltE 𝒮) (IsGoodE 𝒮)
```
- So `recAtG_of_two_passes h2v KPx _ _ h.1 h.2.1 h.2.2.1 h.2.2.2` applies to any `h : MemberE 𝒮`. This instance is restated in the companion (NOT EXECUTED).
- On the RH path, `hMem` comes from `GlobalTheory.T.large_unramified_exponent_bundles_exist_alt` and is passed as `(fun _ => hMem)` to `GlobalTheory.Fc.nonempty_hyps_of_allRows_alt` (in `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean`, lines 43 and 61).
- `KPx B f := (∃ δ, B.KsExact δ f) ∧ PrePin B.toPre` (`PositionOfIntro.lean`).

## 5. Human proof of D-2 (`recExP_of_recAtG`)

Hypotheses:
- `hconds : SiegelMassRatioCM`
- `Q'`, `QO`
- `h : RecAtG (…)`, the output of D-1
- `hq : EvP (∀ β : BPt K, β.Is Q' → QO κ β.D β.O)`

**Parameter merge (Lemma M, written out by hand upstream).**
- `ε := min ε0 ε1`.
- Given `eps ≤ ε` and `C8 C5 c6 Cb`, take `K0` from `h` and `K1` from `hq`, and use `K0.sup K1` (split with `large_of_sup`).
- Lower bound on `cD`: `max (max c1 c1') 0`. **The 0 is essential.** It forces `0 ≤ cD`, which `window_lower` requires.
- `c2 := max (max c2 c2q) c2'`, where `c2'` comes from `window_lower hconds eps C he he52 hstd cD`.

**Choosing x3 (exceptional case).**
- By cases on `Par.Pos κ` for the current parameter tuple `κ = ⟨eps, C, cD, ch, C5, c6, Cb⟩`:
  - if it holds, `x3` comes from `hq`;
  - if not, `x3 := 0` and the clause is vacuous (`absurd`).
- This is why the conclusion only carries `κ.Pos → QO κ D O`.

**Thresholds.**
- `x1` comes from `window_lower` (at `ch`), and `x2` from `exists_du_nat eps he he52`.
- The RecExP witness uses scale constant `cs = 1` and `x0 := max (max x0 x3) (max x1 x2)`.

**Main step.** Given `s P a b c`, `hs : s.eps = eps`, `hx : x0 ≤ s.x` and `d3 : ChGood …`:
1. `hok := d3.ok`. It fixes `q1 = DC.q0H P.H`, which is forced by `ChGood.ok`.
2. `exists_du_nat` gives `du` (positive naturals) with `du u = duP P u`.
3. `DsP_pos_and_lower P` gives `0 < DsP P` and its lower bound. The RecExP data is `du`, `Ds := DsP P`, with positivity.
4. The log-size inequality for each `u` follows from `hlow` (`window_lower`), after `one_mul` (because `cs = 1`).
5. For each level choice `Lv` with equations `h1 h2 h3`, build the context `K := ⟨s, C, cD, ch, P, _, a, b, c, hstd, hok, Lv, (du_eq via h1), h2, h3⟩`. `h K rfl rfl rfl hs hx0 d3` (D-1's output at K; the guard is satisfied by `d3`) gives `D, Y, g1..g4` and `⟨X, f, T, co, hQ, he⟩`, `u1 u2 u3`.
6. For each led part `p` (with `p1..p4`):
   - **Pos branch:** `Sigma.mk.inj he` identifies `D = X.toD7` and `Y.obj` with `co.O` (heterogeneous equality). Then `hq' hp K ⟨rfl, rfl, rfl, hs, d3⟩ hx3` is applied to the BPt `⟨X, f, T, co, Y, eq_of_heq he, p, p1..p4, ⟨C5, c6, Cb, d3⟩, g2, g3, u1, u2⟩` and `hQ`, giving `QO κ D (Y.obj p)`.
   - **QD part, unconditional:** `DQ.qd_setDiv D (Y.obj p) (nPrime p.L) p.ht ⟨u1, u2, u3⟩`. ∎

Exceptional cases preserved:
- the non-Pos vacuous branch;
- `cD ≥ 0` forced by `max … 0`;
- `cs = 1`;
- `q1` pinned by `ChGood.ok`;
- the guard `d3` reused both for D-1's EvG guard and for the BPt.

## 6. `hostQ` and `minkowski_bound_rat` (located this run)

**`UpperTheory.Top.hostQ`** is at `src/Development/AutomorphicArithmetic/CharacterBoxes/SmallestPrimePolynomialBound.lean:64`. My earlier searches missed it because it is declared with the full dotted name.
```lean
theorem UpperTheory.Top.hostQ :
    SmallPrimeOne → ∀ (la : ℝ) (G : FReq), HostExW la G.req → DC.HostExQW la G.req
```
- `SmallPrimeOne := ∃ A : ℝ, 1 ≤ A ∧ ∀ M : ℕ, 2 ≤ M → ∃ p : ℕ, p.Prime ∧ p % M = 1 ∧ (p : ℝ) ≤ (M : ℝ) ^ A` (`Definitions/GlobalTwisting/LogCondLeThree.lean:87`). This is a Linnik-type bound on the least prime ≡ 1 mod M. It is a **hypothesis** of `hostQ`; I have not traced where it is discharged (R-12).
- Proof outline:
  1. Keep `CT2 C5 c6 Cb x0 S`, and replace `C8` by `(3 + 2·C8)·A`, which is ≥ C8 because A ≥ 1 and C8 ≥ 1.
  2. For each host H, relevel it at `q0 := q0H H`. Coprimality `q0H H ⊥ H.QS` follows from `q0H H ≡ 1 mod QS·q·d`, which holds because `QS·q·d > 1`.
  3. The private lemma `smallest_prime_polynomial_bound` gives `q0H H ≤ (QS·q·d)^((3+2C)A)`.
  4. Splitting of the five listed primes at the new level comes from `har` and `HostSplit.split_of_one_mod`.
- Used at `CharacterBoxes/ObjCTrue.lean:35` (`hostWW … (hostQ hS la G hH) …`).

**`minkowski_bound_rat`** is at `src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/MinkowskiQ.lean:6`. I found it by an import-graph BFS from `Proofs/GlobalInterpolation/LinkEx.lean`; 600 files were read from git objects.
```lean
theorem minkowski_bound_rat : PI.MinkowskiBoundQ := PI.MkQ.minkowskiBoundQ
```
- `PI.MinkowskiBoundQ := ∀ N (G : Subgroup (GL (Fin N) ℚ)), Finite G → Nat.card G ∣ minkowskiM N`. This is Minkowski's theorem on finite subgroups of GL_N(ℚ).
- `PI.MkQ.minkowskiBoundQ` (`…/UnitaryGroupMassFormula/MinkowskiTorsionFree/Lattice.lean:124`) works in two steps:
  1. It embeds G injectively (`phi_injective`) into a finite subgroup of the integral group.
  2. It applies `card_dvd_minkowskiNumber : PI.MinkowskiBound` (the GL_N(ℤ) version, built from `minkowskiBound_of_steps traceStep powerSumStep`).
- **Type match at the use site.** `LinkEx.lean:35` feeds it where `Formalism.MainNotions.MinkDiv := ∀ n, MinkMult n (minkM n)` is expected. That works by unfolding:
  - `MinkMult n M := ∀ H : Subgroup (GL (Fin n) ℚ), Finite H → Nat.card H ∣ M`;
  - `minkM n := Formalism.HermitianLatticeCounting.S6.minkowskiM n`;
  - `S6.minkowskiM`/`S6.minkowskiExp` and `PI.minkowskiM`/`PI.minkowskiExp` have character-identical bodies (checked by the verifier): `∏ p ∈ (range (N+2)).filter Prime, p ^ Σ_{i<N+1} N / (p^i (p-1))`.
  - I did **not** elaborate this definitional equality. The upstream build accepting `LinkEx.lean` would be the real check.
- **Executed transcription check.** In the Lean skeleton, `#eval` of the same formula for N = 0..8 gives `[1, 2, 24, 48, 5760, 11520, 2903040, 5806080, 1393459200]`. This equals OEIS A053657 (Minkowski's bound, offset 1). I fetched the OEIS entry with curl this run.

## 7. Remaining dependencies (exact names; not unpacked here)

| id | name | role | owner / note |
|---|---|---|---|
| R-1 | `GlobalTheory.T.large_unramified_exponent_bundles_exist_alt` / `GlobalTheory.Fc.StageOneU.member_bundles_large_unramified_exponents_alt` | produces `MemberE` (all 4 D-1 inputs) | **galois_rows** / theta lane (named dependency) |
| R-2 | producer of `h2v : ∀ D, VolTieG D → VolumeEqMass₂ D` (`volumes_eq_masses_of_unfold` per run 1) | D-1 hypothesis | native; not unpacked |
| R-3 | `GlobalTheory.Mem.Top.LayOfCore.lay_of_core` internals: `TamePow.tame_of_pow`, `lay`, `layObj_lay`, `isOver`, `ledOK`, `tupUsed`, `Full.dgam_pos_and_full`, `c.col.mink`, `c.col.atT` | Step 4 | native; next task |
| R-4 | core fields `V4.Core.real.vol`, `V4.Core.mtStable`, `TwAllAt.twAt` | Steps 4–5 | definitional/structure fields |
| R-5 | `GlobalTheory.EX.WinLow.window_lower` (+ `vandermonde_place_lower_bound`, `places_ok`, `scale_sizes`, `rank_consts`, `hostBounds`) | D-2 log-size bound | native |
| R-6 | `exists_du_nat` (`Inh.g_big`, `DuInt.duStarOf_nat`) | D-2 du | native |
| R-7 | `GlobalTheory.Mem.Top.DsLow.DsP_pos_and_lower` (`massTelescope_std_pos`) | D-2 Ds | native |
| R-8 | `DQ.qd_setDiv` | D-2 QD part | native |
| R-9 | `lg_iff_lgOn`, `LgOn.inter` | Lemma L internals | native |
| R-10 | `GroupRetwisting.lg_forced` | Step 0 | native |
| R-11 | `StandardLattice.SiegelMassRatioCM` | D-2 hypothesis | discharge not traced |
| R-12 | `SmallPrimeOne` | `hostQ` hypothesis | discharge not traced |
| R-13 | `PI.MkQ.phi_injective`, `card_dvd_minkowskiNumber`, `PI.Mk.traceStep`, `PI.Mk.powerSumStep` | Minkowski bound proof | native (Formalism/PeriodIntegrals) |

## 8. Validation actually run

- `lean_run.log`: `OMP_NUM_THREADS=1 nice lean RecAtGMechanismAbstract.lean` with Lean 4.33.1 (core) exited 0 and printed the Minkowski list. The first attempt failed with a parse error because `export` is a keyword; the parameter was renamed `exportF`.
- `verify_run.log`: 25 files, 67 tokens, 0 failures (second run). The first run found 2 non-verbatim tokens; I corrected them.
- Not run: any upstream elaboration, including `RH_RecAtGCompanion.lean`.

## RESUME HERE
1. Unpack `lay_of_core` (R-3) in `Proofs/IwasawaDecomposition/ExistsLayerParametersAdmissible.lean:105`, starting with `TamePow.tame_of_pow` and `Full.dgam_pos_and_full`.
2. Trace the discharge of `SiegelMassRatioCM` (R-11) and `SmallPrimeOne` (R-12) on the RH path.
3. If a box with an upstream build becomes available, run `RH_RecAtGCompanion.lean`.

## HANDOFF TO
- **galois_rows:** R-1 (the `MemberE` producer) is the only input of D-1 that comes from outside this lane.
- **lean_validation:** run `RH_RecAtGCompanion.lean` against an upstream build at the pin; it is NOT EXECUTED.



---

## Appendix 42: grok_swarm/native_family_existence/03_trust_boundary_lay_of_core/CHAPTER_TRUST_BOUNDARY_AND_LAY_OF_CORE.md
Working-repo blob 15120927344b01a5223e8aca00e545c436f01941. Original validation status retained.

# Native family existence, part 03: where `SmallPrimeOne` and `SiegelMassRatioCM` are discharged, and `lay_of_core`

Lane: `grok_swarm/native_family_existence/` (Grok executor), run 3, 2026-11-24.
Upstream: `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`.
Paths below are under `src/`.

## Honest status

- **What this document is.** It is a source-reading reconstruction. I did not build the upstream project, did not run `#print axioms`, and did not run the comparator.
- **What the source check covers.** `verify_trust_and_laycore.py` ran with 0 failures across 33 cited files and 70 verbatim tokens (see `verify_run.log`). The source was read from `/workspace/rh_orig`, a checkout of `homeowmorphism/riemann-hypothesis-original` at `4e8bb36`. The script compares the blob ids of both git trees. Its `src/` matches the pin's `src/` exactly: 175,187 files, 0 differing. The only extra file is `src/Challenge.lean`.
- **Scans run over that `src/`.**
  - 0 files declare an `axiom`.
  - The only file containing `sorry` or `admit` is `src/Challenge.lean`, the comparator's challenge stub.
- **Abstract Lean file.** `LayOfCoreMechanismAbstract.lean` uses core Lean 4.33.1 only. It typechecked with exit 0, and its axioms are `[propext, Quot.sound]` (see `lean_run.log`). It models only the integer skeleton of `tameDistinct_gen`.
- **Companion file.** `RH_TrustLayCoreCompanion.lean` is NOT EXECUTED.
- No gate is closed. URT is not used.

## 1. Trust boundary: both hypotheses are discharged by closed in-repo theorems

**Top level.** `src/Main.lean:4` reads `theorem riemannHypothesis : RiemannHypothesis := rhOfAll`. So the top-level theorem has **no hypotheses**.

The original environment's `comparator.json` lists `permitted_axioms` as `propext`, `Quot.sound` and `Classical.choice`. That is that repo's own configuration. I did not run the comparator.

Combined with the 0-`axiom` scan, any `SmallPrimeOne` or `SiegelMassRatioCM` on the path must be proved inside the repo. The real question is which term does it on the main path. The answers are below.

### 1a. `SmallPrimeOne`

```lean
def SmallPrimeOne : Prop := ∃ A : ℝ, 1 ≤ A ∧ ∀ M : ℕ, 2 ≤ M → ∃ p : ℕ, p.Prime ∧ p % M = 1 ∧ (p : ℝ) ≤ (M : ℝ) ^ A
```
This is defined at `Development/AbelianVarietyTheory/Definitions/GlobalTwisting/LogCondLeThree.lean:87`. It is a Linnik-type bound on the least prime ≡ 1 mod M.

On the main path (the first-run chain `classSel → recS`), it is discharged inside `UpperTheory.Top.recS`, at `Development/AutomorphicArithmetic/CharacterBoxes/ObjCTrue.lean:33`:
```lean
have hS : SmallPrimeOne := GlobalTheory.EX.smallPrimeOne_of_primesRel GlobalTheory.Lin.primesRel_holds
```
That `hS` is then used immediately in `hostQ hS la G hH`.

The discharge chain:
- `GlobalTheory.EX.smallPrimeOne_of_primesRel : GlobalTheory.Lin.PrimesRel → SmallPrimeOne` (`…/Proofs/GlobalInterpolation/SmallPrimeOneOfPrimesRel.lean:18`). It imports no `PublishedTheorems` module.
- `GlobalTheory.Lin.primesRel_holds : GlobalTheory.Lin.PrimesRel` (`…/Proofs/GlobalInterpolation/PrimesInProgressionsRelativeError.lean:22`) is a closed theorem built from three closed statements. Each statement file is a one-line `first | exact @…` wrapper around a native theorem:
  - `GlobalTheory.T.exceptionalDirichletZero_unique_zeroFreeRegion` wraps `GlobalTheory.ExceptionalPair.main`. This is the zero-free region with at most one exceptional real zero.
  - `GlobalTheory.T.chebyshevPsiProgression_relative_error` wraps `GlobalTheory.Lin.PsiRel.psiAP_relative`. This is ψ(x; M, b) with relative error.
  - `GlobalTheory.T.primeCount_relative_error_of_psi_relative_error` wraps `GlobalTheory.Lin.pi_rel_of_psi_rel`.

**Verdict.** At the pin, `SmallPrimeOne` is not a hypothesis of RH. It is discharged by an in-repo closed proof (Linnik's theorem derived from the exceptional-zero zero-free region plus the prime number theorem in progressions with relative error).
- No `GlobalTheory.Published.*` hypothesis enters this chain at the level I traced.
- There is also an alternative producer, `smallPrimeOne_of_tzRat : GlobalTheory.Mem.An.TZRat → SmallPrimeOne`. It imports `PublishedTheorems/AutomorphicForms₂/*` and is used by `HostExOfPublished.lean`, `ExistsRichRecordOverChoices.lean` and `GlobalRowsOfSizeParameters.lean`. It is **not** the one `recS` uses.
- Not unpacked: the proofs of `ExceptionalPair.main`, `PsiRel.psiAP_relative` and `pi_rel_of_psi_rel`. They are the next trust items (T-1, T-2, T-3).

### 1b. `StandardLattice.SiegelMassRatioCM`

It is defined at `Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean:281`. The main-path flow, consumer first:
1. `recExP_of_recAtG` (run 02, D-2) gets it from `memberTop_final_contextParameters h1 …` (`ClassSel.lean`). That in turn calls `existsLayeredData_of_goodScaleContexts hAll`.
2. `classSel`'s first argument `h1 : SiegelMassRatioCM` is supplied as `hP` in `UpperTheory.Top.classSel hP (fun D => hU D) …`. This happens in `nonempty_hyps_of_allRows_alt` (`…/ThirdPlaceSeries/NonemptyHypsOfAllRows.lean:51`), whose first premise is `SiegelMassRatioCM`.
3. In `hypotheses_nonempty_of_unramified_exponents_alt` (`…/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean:43,57`), we have `obtain ⟨hP, hMem, hEx⟩ := large_unramified_exponent_bundles_exist_alt …` and then `exact nonempty_hyps_of_allRows_alt hP …`.
4. `member_bundles_large_unramified_exponents_alt` (`…/ThirdPlaceSeries/MemberBundlesLargeUnramifiedExponents.lean`) returns `⟨hA.a18, …⟩`, where `hA := GlobalTheory.T.compatibleSystem_member_hypotheses P.globalArtinReciprocity …`.
5. `GlobalTheory.compatibleSystem_hypotheses_of_localInputs` (`…/LocalTypeDictionary/CompatibleSystemHypothesesOfLocalInputs.lean`) fills field `a18 : StandardLattice.SiegelMassRatioCM` of `HypAAlt` with **`GlobalTheory.Mass.massRatio_all_unramified_cmFields`**. This is a closed term. It does **not** come from any of the `GlobalTheory.Published.*` arguments (`ar cm we hm cd cw hf cl ce fd sw`) that the same constructor takes.
6. `massRatio_all_unramified_cmFields := standardMassRatio_of_modelMassRatio siegelMassRatio_holds` (`…/Proofs/GlobalInterpolation/MassRatioAllUnramifiedCmFields.lean:8`).
7. `GlobalTheory.Mass.siegelMassRatio_holds := siegelMassRatio_of_LI binary_hermitian_represents liStat` (`…/Proofs/FlagMeasures/SiegelMassRatioUnimodularDefinite.lean:9`). Its inputs:
   - `siegelMassRatio_of_LI (hH : HermRepUnram) (hLI : LIStat)` (`Formalism/GL3MeanSquares/GenusMeanAsymptotics/UnimodularClassRepresentatives/SiegelMassRatioOfLI.lean:35`);
   - `GlobalTheory.Mass.binary_hermitian_represents : HermRepUnram` (`…/Proofs/FlagMeasures/BinaryHermitianRepresents.lean:12`);
   - `liStat : LIStat := liStat_of liRatio liPin` (`…/UnimodularClassRepresentatives/LiStatOf.lean:24`).

**Verdict.** At the pin, `SiegelMassRatioCM` is not a hypothesis of RH, and on this path it is not taken from a `Published.*` input. It is discharged by the closed in-repo theorem `massRatio_all_unramified_cmFields`.
- **Caveat:** the surrounding theorems on the path do carry a large bundle `P : UnitaryGroupThirdPlaceHypotheses` of `GlobalTheory.Published.*` propositions (Artin reciprocity, Harish-Chandra, Casselman–Wallach, Siegel–Weil, …). Those must themselves be discharged further up, because the top theorem is closed. That belongs to the theta lane; I did not trace it here.
- Not unpacked: `siegelMassRatio_of_LI`, `binary_hermitian_represents`, `liRatio`, `liPin` (T-4 to T-7).

**What would actually confirm §1:** run `#print axioms` on `riemannHypothesis`, `primesRel_holds` and `massRatio_all_unramified_cmFields` against a build (companion §1). This is for lean_validation.

## 2. `lay_of_core` (R-3)

```lean
theorem lay_of_core : Ev fun K => ∀ (X : Stages) (f : Fr X.B.toPre) (T : TwDat X.B) (c : V4.Core K X f T),
    StandardLattice.VolumeEqMass₂ X.toD7 → ∃ Y : Lay X.toD7, layObj Y = c.O ∧ Over X.toD7 K.P K.Lv ∧ RecOK K.s K.C K.cD X.toD7 ∧
      LedOK K.s K.C K.cD K.ch Y K.a K.b ∧ DQ.TupUsedAt X.toD7
```
Location: `Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsLayerParametersAdmissible.lean:105`. Proof term: `ev_imp TamePow.tame_of_pow (fun _ hK X _ _ c hv => ⟨lay c hv, layObj_lay c hv, isOver c, ⟨…RecOK…⟩, ledOK c hv, tupUsed c⟩)`.

**Structure.** A core `c : V4.Core K X f T` (`…/Definitions/AutomorphicMembership/RationalRootsDef.lean:38`) already carries almost all the data. `lay_of_core` is mostly repackaging. Only two genuine steps occur: the tame-distinctness argument (§2.3) and the size identification from the volume hypothesis (§2.1).

### 2.1 The layer `Y := lay c hv`, with `layObj Y = c.O` by `rfl`

- `Y` is `c.O` extended by fields read off `c`: `ties`, `rrDef`, `th_io`, `vram`, `fills_all`, `idx`, `kap_def`, `lam_def`, `kapR_def`, `piG_lev`, `piT_lev`, `seen`, `tauOf`, `nch_tie`, `rationalRoots_def` and `gauge_def`.
- `dgam` (the `DGamDef` condition) follows from `c.col.one`, which says all `DGam`s agree, together with `(chTw u' μ').dvd_DGam`.
- `duStar_def` and `Dstar_def` come from `sizes_eq_count K X c.isOver hv c.dsig_eq` (`SizesEqCount.lean:30`). This is the **only use of `hv : VolumeEqMass₂`**. In the proof:
  - `K.Over` gives the size equations;
  - `hv.2`, at the Y₀ signature, gives `volY0 = massI X.toD7 r`;
  - `c.dsig_eq` identifies each `dsig τ` with `trueDsig`.

  Together these make `Dstar` equal the standard `DstarD`, and each `duStar u` equal `duStarU`.

### 2.2 `Over X.toD7 K.P K.Lv`

`isOver` repackages `c.isOver : K.Over X.B.toPre` with witness `X` and `rfl`.

### 2.3 `RecOK K.s K.C K.cD X.toD7`, field by field (`SetUnipotentTranslate.lean:121`)

| field | source | content |
|---|---|---|
| `del` | `c.del` | `Del = Delv s cD` |
| `etaF` | `c.etaF` | `etaF = 6 x^(-CF)` |
| `untw` | `untw c` | `Aj j w = 0` at untwisted places, from `c.row.untw` at `w` and at `conj w` |
| `fin` | `fin c` | finitely many twisted places: a subset of the finite set in `TwFin.tw_fin`, via `c.mu.sub`/`c.mu.off` |
| `dgam`, `full` | `Full.dgam_pos_and_full` | `DGam > 0` from `DGam_pos`; every vector has a nonzero multiple in `MramL`, via `exists_nsmul_mem_of_span` (a lattice of full span) |
| `tame` | `hK X c.isOver c.chiT` | **genuine step, below** |
| `mink`, `atT` | `c.col.mink`, `c.col.atT` | carried by the core |

**The tame step: `TamePow.tame_of_pow` (`FourMulRootLt.lean:105`).**

- *Exceptional case (`Ev` is trivial here).* `Ev` is discharged with ε₀ = 1 and every other threshold 0 (`refine ⟨1, one_pos, ?_⟩`). So the statement holds for every context K, not just eventually.
- *Inputs.* `c.chiT` gives a generator `w` of `(ℤ/g)ˣ` (order g − 1) with `chiT k v j = w^{2(j+1)}` for j < m. Here `g = g_k` is the host prime.
- *Size bound.* `bound_of_over` gives 4m·g^{1/4} < g − 1, from `K.Over` and the context's `RankVal`/`HostVal`:
  - m ≤ 2√x and k ≥ x⁴, so with b ≥ e we get max(2, m) + 3 ≤ k·b;
  - `HostVal` gives (k·b)⁸ ≤ g;
  - `four_mul_root_lt` (with m ← max(2, m), k ← k·b) then gives the bound. Its key step: with t = g^{1/4} ≥ k², we have 4m·t < k²·t ≤ t² < t⁴ − 1.
- *Tame distinctness.* `tameDistinct_gen` (`PowEqOfPartEq.lean:84`) proves `TameDistinct r g (j ↦ w^{2(j+1)})`, given `1 ≤ r` (from `two_le_m`). Write each `tameList` value as `w^{2e}`, where e ∈ {0, ±(j+1)}, so |e| ≤ m (`tameList_eq`, `expo_bound`).
  1. *Injectivity.* If `w^{2e} = w^{2e'}` with e ≠ e', then (g − 1) divides D := |2e' − 2e|, and 0 < D ≤ 4m (`dvd_of_pow_eq`). So g − 1 ≤ 4m, which contradicts the size bound. (Core-Lean skeleton: `NFE3.exps_distinct`.)
  2. *Prime-to-ℓ parts injective for ℓ ∉ BB r g.* We argue by contraposition: assume two prime-to-ℓ parts agree; we show ℓ ∈ BB r g.
     - By `pow_eq_of_part_eq`, x^{ℓ^a} = y^{ℓ^a}. So (g − 1) divides D·ℓ^a.
     - Write g − 1 = ℓ^v·M with gcd(M, ℓ) = 1. Then M divides D, so g − 1 ≤ 4m·ℓ^v. (Core-Lean skeleton: `NFE3.prime_to_part_bound`.)
     - Combined with the size bound: g^{1/4} < ℓ^v, i.e. g < ℓ^{4·v_ℓ(g−1)}. That is exactly `Exc g 1 ℓ`, so ℓ ∈ `BB r g` (`Formalism/CyclotomicNorms/StatementI.lean`).
     - Note: the clause applies to every prime ℓ outside BB, including ℓ = g. That case is harmless, because g ∈ BB by definition.
  3. *Squares.* `w^{2(j+1)} = (w^{j+1})²`.

### 2.4 `LedOK` (`ledOK c hv`)

- The first conjunct (Fval vanishing at untwisted places) is `c.fval`. Its "w ∉ Wt" premise comes from `TwFin.tw_fin` and `c.mu`.
- The second conjunct uses three ingredients:
  - `c.gy.led`;
  - `NP_full`, with the exponent read from `c.gatNum` and `Ce = 1` (from `K.std.1`, `FC.Fixed`);
  - `hs : L.sc = K.s`.

### 2.5 `TupUsedAt` (`tupUsed c`)

Each tuple slot μ has `xi μ ∈ T.set f = {1, del, del'} ∪ range xiTw`. We split into cases:
- The value is 1, del or del': injectivity of `c.mu` (`mu0`, `star`, `star'`) identifies μ.
- The value is `xiTw w`:
  - if w ∈ Wt, then μ is the twisted slot of w (`c.mu.tw`, `c.mu.on`);
  - if w ∉ Wt, then ψ w = 1 (`c.mu.supp`). So `xiTw w` is del or del' (depending on whether `resChar w = pde`), which reduces to the previous case.

**Hypotheses and edge cases kept:**
- `hv` is used only in `sizes_eq_count`.
- The `Ev` wrapper of `tame_of_pow` is uniform in K.
- `r ≥ 1` comes from `two_le_m`.
- `g ∈ BB` is covered by definition.
- The case w ∉ Wt with ψ = 1 is handled in §2.5.
- The `Ce = 1` normalisation comes from `K.std`.

## 3. Remaining dependencies (exact names)

| id | name | note |
|---|---|---|
| T-1 | `GlobalTheory.ExceptionalPair.main` | zero-free region with an exceptional zero (feeds SmallPrimeOne) |
| T-2 | `GlobalTheory.Lin.PsiRel.psiAP_relative` | ψ in progressions with relative error |
| T-3 | `GlobalTheory.Lin.pi_rel_of_psi_rel` | from ψ to π |
| T-4..7 | `siegelMassRatio_of_LI`, `GlobalTheory.Mass.binary_hermitian_represents`, `liRatio`, `liPin` | Siegel mass ratio |
| T-8 | the discharge of `P : UnitaryGroupThirdPlaceHypotheses` (Published.* bundle) up to `rhOfAll` | theta lane |
| L-1 | `V4.Core` producers (the data `c.col`, `c.gy`, `c.row`, `c.chiT`, `c.dsig_eq`, …) | they come from FirstG/SecondG (galois/theta via `MemberE`) |
| L-2 | `TwFin.tw_fin`, `exists_nsmul_mem_of_span`, `NP_full`, `GlobalTheory.NatMulIntegerMultiple.main` | small native lemmas |

## RESUME HERE
1. T-1 to T-3 (the analytic number theory behind `SmallPrimeOne`), starting at `GlobalTheory.ExceptionalPair.main`.
2. T-4 to T-7.
3. `window_lower` (R-5 from run 02).

## HANDOFF TO
- **lean_validation:** run `#print axioms` for `riemannHypothesis`, `GlobalTheory.Lin.primesRel_holds` and `GlobalTheory.Mass.massRatio_all_unramified_cmFields` (companion §1). This would turn §1 from source-reading into an executed result.
- **theta lane:** T-8.



---

## Appendix 43: grok_swarm/green_regular_character/RUN2_GENERIC_COUNT_MACKEY_ROOTSUM.md
Working-repo blob 770bd6a5fa5c2e683cc23a8bc51e7d4438c37b39. Original validation status retained.

# Green regular character lane — RUN2: generic count, cuspidal Mackey orthogonality, regular rootSum character

Lane: `green_regular_character` (Grok). Upstream: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`. Toolchain used: Lean 4.33.1 + Mathlib `0df444a` (identical to the upstream pins).
Date: 2026-11-24 (GMT). RUN1 = commit `7bc49a7` (exhaustion / Bridge companions).

## Honest status (read first)

| Upstream declaration (exact name) | What was done | Status |
|---|---|---|
| `GlobalTheory.GLq.card_generic_irr_le` | proof body copied verbatim into `GreenCompanion/GenericCount.lean`; its 5 upstream deps are explicit hypotheses with their exact upstream statements; built with lake; `#print axioms` = `[propext, Classical.choice, Quot.sound]` | **conditional companion compiled** (conditional on the 5 deps) |
| `GlobalTheory.GLq.IpCuspProd.ip_hcL_cusp` | same technique, `GreenCompanion/MackeyCusp.lean`; 5 deps as hypotheses; built; standard axioms only | **conditional companion compiled** (conditional on the 5 deps) |
| `GlobalTheory.T.isCharacter_cuspidal_rootSum_regular` (= `GlobalTheory.CuspGL.isChar_psi_rootSum_of_regular`) | both Mathlib-only definition files copied verbatim, proof body (2 helper lemmas + main) copied verbatim, 10 deps as hypotheses, `GreenCompanion/RootSumCore.lean`; built; standard axioms only | **conditional companion compiled** (conditional on the 10 deps) |

None of this proves the dependencies. No gate is closed by this file. Companions restate upstream definitions verbatim
(namespace renamed to `GreenCompanion`) and do not import the upstream repository, so "compiled" means: *the upstream proof
text, with exactly the listed upstream statements as premises, typechecks against Mathlib with no `sorry` and no extra axiom.*
The exact finite checks are small-case illustrations (GL₂(F_p)), not evidence for the general theorems.

## 1. `GlobalTheory.GLq.card_generic_irr_le`

Statement (verbatim, `Proofs/InertiaEigenvalues/NcardGenericIrreducibleCharactersGLnLe.lean`):

```lean
theorem card_generic_irr_le : ∀ (g : ℕ) [Fact g.Prime] (ψ : AddChar (ZMod g) ℂ), ψ ≠ 1 → ∀ n : ℕ, 0 < n →
    Set.ncard {ρ : Gn g n → ℂ | IsIrr ρ ∧ wh ψ ρ ≠ 0} ≤ g ^ n - g ^ (n - 1)
```

Hypotheses kept: `g` prime, `ψ` a **nontrivial** additive character of `ZMod g`, `n > 0`. The set counted is irreducible
characters with nonzero Whittaker functional `wh ψ ρ = tr(e_U ρ)`.

Human proof (follows the Lean body step for step).
1. *Finiteness.* The irreducible characters of the finite group `Gn g n = GL_n(F_g)` form a finite set `S`
   (`finite_irrCharacters_and_finsum_centralIdempotents_eq_one`), so `ncard` is the card of a Finset.
2. *Decomposition.* `gg ψ n` (the Gelfand–Graev character) is a class function (`gg_isClass`, proved in-file), hence
   `gg = Σ_{ρ∈S} ⟨gg,ρ⟩ ρ` (`character_decomposition_and_classFunction_expansion`).
3. *Integrality of multiplicities.* For irreducible ρ, `wh ψ ρ = tr(e_U · ρ)` with `e_U` idempotent, so it is a natural
   number `m_ρ` (`groupAlgebraTrace_idempotent_and_irreducible_degree` + `whittakerJacquetIdempotents_properties_primeField`).
4. *Reciprocity + norm.* `⟨ρ, gg⟩ = wh ψ ρ = m_ρ` and `wh ψ gg = g^n − g^(n−1)`
   (`gelfandGraevCharacterGLn_norm_and_reciprocity`; this is where `ψ ≠ 1` and `n > 0` are used).
5. Applying `wh ψ` (linear) to the decomposition gives `Σ_ρ m_ρ² = g^n − g^(n−1)`.
6. *Count.* Each ρ with `m_ρ ≠ 0` has `m_ρ ≥ 1`, so `m_ρ² ≥ 1`; hence `#{ρ : m_ρ ≠ 0} ≤ Σ m_ρ² = g^n − g^(n−1)`.
   No multiplicity-one theorem is used — the bound is weaker than, and independent of, uniqueness of Whittaker models.

Remaining upstream dependencies (exact names): `GlobalTheory.T.finite_irrCharacters_and_finsum_centralIdempotents_eq_one`,
`GlobalTheory.T.character_decomposition_and_classFunction_expansion`, `GlobalTheory.T.gelfandGraevCharacterGLn_norm_and_reciprocity`,
`GlobalTheory.T.groupAlgebraTrace_idempotent_and_irreducible_degree`, `GlobalTheory.T.whittakerJacquetIdempotents_properties_primeField`
(implementation names upstream: `irr_finite_and_finsum_zOf_eq_one`, `charDec`, `GGNorm.gg_norm`, `trIdem`,
`Adopt.whittakerJacquetIdempotents_properties_primeField`). In-file helpers reproved verbatim: `isChar_of_isIrr`, `ip_comm`,
`tr_finset_sum`, `gg_isClass`.

## 2. `GlobalTheory.GLq.IpCuspProd.ip_hcL_cusp`

Statement (verbatim, `Proofs/InertiaEigenvalues/CharacterPairingHarishChandraCuspidalMackey.lean`):

```lean
theorem ip_hcL_cusp : ∀ (g : ℕ) [Fact g.Prime] (L L' : List (Pc g)) (n : ℕ), degL L = n → degL L' = n →
    (∀ p ∈ L, IsCusp p.2) → (∀ p ∈ L', IsCusp p.2) →
    (¬ L.Perm L' → ip (hcL L n) (hcL L' n) = 0) ∧ (L.Nodup → ip (hcL L n) (hcL L n) = 1)
```

Hypotheses kept: both lists have total degree exactly `n`; **every** entry is cuspidal; conclusion (a) needs `¬ L.Perm L'`,
conclusion (b) needs `L.Nodup` (with repeats the norm is > 1 — see check §5b, where a repeated pair gives 2).

Human proof (the Lean proof is one induction, `finiteRing_sq_sub_mul_sq_eq_of_card`, on `L'`, generalising `L` and `n`).
* `L' = []`: then `n = 0`; `L` has degree 0 and cuspidal entries of positive degree, so `L = []` (`eq_nil_of_degL`) and the
  pairing is that of the trivial character with itself, 1 (`ip_triv`); the `¬Perm` case is vacuous.
* `L' = (m,ψ) :: L₀`: `hcL L' n = hc(ψ ⊠ hcL L₀)` (`hcL_cons`). By Harish-Chandra Frobenius reciprocity
  (`harishChandra_frobenius_reciprocity`), `⟨hcL L, hc(ψ⊠·)⟩ = ⟨res_{(m, n−m)} hcL L, ψ ⊠ hcL L₀⟩`. The restriction of a product
  of cuspidals is a sum over index subsets `I` of `L` of degree `m` (`harishChandraRestriction_cuspidal_product_sum_subsets`).
  Split by `|I|` (helper `ip_sub_cusp`): `|I| = 0` impossible (ψ cuspidal has degree `m > 0`, `hψ.1`); `|I| ≥ 2` gives a
  product of length ≥ 2 paired against the cuspidal ψ, which is 0 (`ip_long_cusp`: Frobenius reciprocity again, then the
  two-block restriction of a cuspidal vanishes, `harishChandraRestrictionTwoBlock_cuspidal_eq_zero`); `|I| = 1`, `I = {i}`, gives `⟨L_i, ψ⟩ ⟨hcL (L∖i), hcL L₀⟩` and `⟨L_i, ψ⟩ = δ` by orthogonality of irreducible
  characters (`centralIdempotentOfIrrCharacter_orthogonal_central`, via `ip_single_cusp`). Induction on `L₀`, together with
  permutation invariance of `hcL` (`harishChandraProductList_isCharacter_and_perm_invariant`), gives: sum is 0 unless `L` is a
  permutation of `L'`, and for `L = L'` Nodup exactly one `i` contributes, giving 1.

Remaining upstream dependencies (exact names): `GlobalTheory.T.harishChandra_frobenius_reciprocity`,
`GlobalTheory.T.harishChandraRestrictionTwoBlock_cuspidal_eq_zero`, `GlobalTheory.T.harishChandraRestriction_cuspidal_product_sum_subsets`,
`GlobalTheory.T.centralIdempotentOfIrrCharacter_orthogonal_central`, `GlobalTheory.T.harishChandraProductList_isCharacter_and_perm_invariant`
(implementations: `FrobRecHC.hcT_adjoint`, `res_cusp_eq_zero`, `ResCuspProd.main`, `ZOrth.zorth`, `gl_list_product_perm_char`).

## 3. `GlobalTheory.T.isCharacter_cuspidal_rootSum_regular`

Statement (verbatim, `Proofs/CharacterTheory/IsCharacterCuspidalRootSumRegular.lean`, aliased in `...Statement.lean`):

```lean
theorem _root_.GlobalTheory.CuspGL.isChar_psi_rootSum_of_regular (F : Type) [Field F] [Finite F] (θ : AlgebraicClosure F →* ℂ)
    (hθ : ∀ x y : AlgebraicClosure F, x ≠ 0 → y ≠ 0 → θ x = θ y → x = y) (d k : ℕ) (hd : 0 < d)
    (hk : ∀ i : ℕ, 0 < i → i < d → ¬ k * Nat.card F ^ i ≡ k [MOD Nat.card F ^ d - 1]) :
    BI.IsChar ℂ ℂ (fun x : GL (Fin d) F => (-1) ^ (d - 1) * psi (rootSum θ k) (Fin d → F) (Matrix.toLin' x)) ∧
    ipGL (psi (rootSum θ k) (Fin d → F)) (psi (rootSum θ k) (Fin d → F)) = glCard F d
```

Hypotheses kept: `F` finite field; `θ` injective **on nonzero elements only** (θ(0) is unconstrained); `d > 0`; regularity
`k·q^i ≢ k (mod q^d − 1)` for `0 < i < d` only (i = 0 trivially satisfies the congruence).

Human proof (Green's construction, following the Lean body).
1. `rootSum θ k` is additive and takes value `j` on `(X − 1)^j` (`rootSum_isAdditive_and_pow_X_sub_one`).
2. *Virtuality* (helper `psi_rootSum_charpoly_mem_virt`, strong induction on `d`): by `psi_eq`, `psi s V` equals
   `s ∘ charpoly` minus a sum, over proper nonzero invariant subspaces W, of `psi` on W times the quotient term; grouping W by
   dimension `a < d` (helper `finsum_proper_invariant_eq_sum_range_finrank`) turns each group into a parabolic induction of
   the smaller `psi` (`parab_virt`, using conjugation invariance `psi_conj`). `rootSum ∘ charpoly` is virtual
   (`rootSum_charpoly_mem_virt`, uses `hθ`), and virtual characters are closed under these operations, so `psi(rootSum θ k)` is virtual.
3. *Norm*: `psi` is primitive (`isPrimitive_psi`), so `ipGL(ψ, psi) = ipGL(ψ, s∘charpoly)` (`PrimOrth.ipGL_psi_eq`), and
   `ipGL(psi, rootSum∘charpoly) = glCard · #{i < d : k q^i ≡ k}` (`ipGL_psi_rootSum`). Regularity makes the count exactly 1
   (only i = 0), giving `ipGL psi psi = glCard F d`.
4. Transport to `GL (Fin d) F` with `extZero_spec`; a virtual character of norm |G| is ± an irreducible character
   (`BI.irr_of_norm_one`). The value at 1 is `psi_one`: `∏_{1≤i<d}(1 − q^i)`, so `(−1)^(d−1)·psi(1) = ∏(q^i − 1) > 0`, which
   selects the + sign; hence `(−1)^(d−1)·psi` is a character (indeed irreducible).

Remaining upstream dependencies (exact names): `GlobalTheory.CuspGL.psi_conj`, `GlobalTheory.CuspGL.rootSum_charpoly_mem_virt`,
`GlobalTheory.ParabVirt.parab_virt`, `GlobalTheory.CuspGL.rootSum_isAdditive_and_pow_X_sub_one`, `GlobalTheory.CuspGL.PrimOrth.ipGL_psi_eq`,
`GlobalTheory.CuspGL.isPrimitive_psi`, `GlobalTheory.CuspGL.ipGL_psi_rootSum`, `GlobalTheory.CuspGL.extZero_spec`,
`GlobalTheory.CuspGL.psi_one`, `GlobalTheory.BI.irr_of_norm_one`. (`GlobalTheory.CuspGL.psi_eq` lives in the definitions file and is
re-proved verbatim in the companion, so it is **not** a hypothesis.)

## 4. Shared mechanisms (stated once)

* **M1 — "count ≤ sum of squares of naturals"** (§1 step 6). Same shape as RUN1's injection-against-bound step: a set of labels
  injects into something whose size is bounded by an exactly computed norm.
* **M2 — "norm of a virtual character pins irreducibility"** (§3 step 4, and §2 for products): orthogonality relations compute an
  inner product; norm 1 ⇒ ±irreducible; positivity of degree fixes the sign. §2 provides the off-diagonal zeros, §3 the diagonal.
* **M3 — companion technique** (all three): verbatim definitions + verbatim proof body + upstream deps as `Prop`-valued
  hypotheses with exact statements, generated by script (`mk_run2.py`, `mk_rootsum.py`; kept on the worker box at `/workspace/rh_green_work/run2/`, not committed), so no hand edits to proof text beyond
  renaming dependency references to hypothesis names and threading those hypotheses through helper lemmas.

## 5. Exact finite checks (`RUN2_green_exact_checks.py`, output verbatim in Appendix C)

a. Gelfand–Graev norm on GL₂(F_p), p = 2, 3, 5: `⟨gg, gg⟩ = Σ m_ρ² = p² − p` (the upstream bound with n = 2), computed in Z[ζ_p].
b. Harish-Chandra products of GL₁ characters (cuspidal) in GL₂(F_p), p = 3, 5: all 16 / 256 pairings equal
   `[χ = χ'] + [χ = swap χ']`; Nodup self-pairing 1, repeated pair self-pairing 2 (shows the `Nodup` hypothesis is needed).
c. Regularity bookkeeping for q ∈ {2,3,4,5,7}, d ∈ {2,3}: for regular k, `#{i<d : k q^i ≡ k} = 1`, and the sign
   `(−1)^(d−1)∏(1−q^i) > 0`.

## 6. Overlap note

Checked recent commits before starting (`ac8d3e6` galois_rows, `9dbcc10` native family, `3cf1eb3` independent exhaustion/PinNum
note, which agrees with RUN1). None covers these three declarations.

## 7. Next task (proposal)

Push the same companion technique one level down on the highest-leverage deps: `GlobalTheory.CuspGL.ipGL_psi_rootSum` and
`GlobalTheory.ParabVirt.parab_virt` (both Mathlib-only import chains through the CuspGL/BI definitions already copied), then
`GlobalTheory.T.gelfandGraevCharacterGLn_norm_and_reciprocity`.

## Appendix A — Lean log (verbatim excerpts, this run)

Companion files committed under `companion/GreenCompanion/` (`LabelDefs.lean`, `GenericCount.lean`, `MackeyCusp.lean`,
`RootSumCore.lean`) are byte-identical to the files built below (lake project with RUN1's `lakefile.toml`/`lean-toolchain`;
`GenericCount`/`MackeyCusp` import `LabelDefs` → RUN1 `Exhaustion`).

```
$ lake env lean GreenCompanion/GenericCount.lean ; lake env lean GreenCompanion/MackeyCusp.lean
'GreenCompanion.card_generic_irr_le' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.ip_hcL_cusp' depends on axioms: [propext, Classical.choice, Quot.sound]
(other output: linter warnings only — 1 deprecation in GenericCount, unused-section-variable / unused-hypothesis-name linters in MackeyCusp; no errors)
$ lake env lean GreenCompanion/RootSumCore.lean
'GreenCompanion.isChar_psi_rootSum_of_regular' depends on axioms: [propext, Classical.choice, Quot.sound]
EXIT 0
$ grep -c sorry GreenCompanion/{LabelDefs,GenericCount,MackeyCusp,RootSumCore}.lean  -> 0 0 0 0
```

## Appendix B — upstream blob ledger (git hash-object vs. GitHub tree at the pin)

| path | blob @ pin | local fetch |
|---|---|---|
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NcardGenericIrreducibleCharactersGLnLe.lean` | `b7c093fab7b800163cefac3adbead8c8e87f3a97` | match (contents API) |
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/CharacterPairingHarishChandraCuspidalMackey.lean` | `3ef9da4e7c082fc138aa8eef95164d68308d17ed` | match (contents API) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IsCharacterCuspidalRootSumRegular.lean` | `408e2e3de53288e6ad13db1ffa9b9bf4f289fc26` | match |
| `src/Development/AbelianVarietyTheory/Definitions/CommutativeAlgebra/AbByPOfComm.lean` | `6277b155093ae63bcb99150317e091bbc3ced33e` | match |
| `src/Development/AbelianVarietyTheory/Definitions/CommutativeAlgebra/InvariantSubspaceMobiusInverseRecEqOfFinrankLt.lean` | `b54d4f567816eb79c2aeab71426a7bb1285cd166` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvariantSubspaceMobiusInverseCharpolyLinearEqui.lean` | `f9a2708041b2c1a3c371fd017c4dadce01f5625c` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/RootPowerSumCharpolyMemVirtualCharactersGL.lean` | `0e5ebcdaadfb74de874db5aefd64af3f7f3782a8` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/ParabolicInductionTrivialPreservesVirtualCharact.lean` | `0d5e00dab6e05d3fa13adf8c8e33b967542cfba0` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/RootPowerSumCharacterAdditiveAndXSubOnePow.lean` | `bcf5a029bed38d23bf2d69798783022c42aedd06` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvertibleEndomorphismInnerProductPrimitiveMobiu.lean` | `a6fd7499ebdb5940fa350d24fb6eb45ca2933bc0` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IsPrimitiveEndClassFunctionInvariantSubspaceMobi.lean` | `9961bb67bec706d9ef6c96910c3367c12058409e` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvertibleEndInnerProductRootPowerSumMobius.lean` | `3fa1ff31e5645e2138fdb2dab395d83be405636b` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/GeneralLinearFunctionExtendZeroEndProperties.lean` | `e77dac70833c63d9af130c5cf671b8caecd8756b` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvariantSubspaceMobiusInverseOneProdIco.lean` | `a8b0f6a8322b0d198603452f183ae76063b175c6` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IrreducibleOfVirtualCharacterNormOne.lean` | `bd9b0f361705d3c9471e1150436f252205a039eb` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IsCharacterCuspidalRootSumRegularStatement.lean` | `ca858311c006c5c5c92a30dd35ebabd27144bc31` | match |

## Appendix C — `python3 RUN2_green_exact_checks.py` output

```
== Gelfand-Graev norm <gg,gg> = sum_rho m_rho^2 on GL_2(F_p); upstream bound g^n - g^(n-1) with n = 2
p=2: <gg,gg> = 2; p^2-p = 2; equal: True
p=3: <gg,gg> = 6; p^2-p = 6; equal: True
p=5: <gg,gg> = 20; p^2-p = 20; equal: True
== Harish-Chandra products of GL_1 characters (cuspidal for GL_1) in GL_2(F_p):
   expected <Ind(a,b), Ind(a',b')> = [(a,b)=(a',b')] + [(a,b)=(b',a')]; Nodup (a!=b) gives norm 1
p=3: 16 pairs checked, mismatches = 0; self-pairing values: Nodup -> [Fraction(1, 1)], repeated -> [Fraction(2, 1)]
p=5: 256 pairs checked, mismatches = 0; self-pairing values: Nodup -> [Fraction(1, 1)], repeated -> [Fraction(2, 1)]
== rootSum regularity condition and sign of the degree (isChar_psi_rootSum_of_regular)
q=2 d=2: regular k mod q^d-1: 2; Frobenius orbits: 1 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 1 > 0: True
q=2 d=3: regular k mod q^d-1: 6; Frobenius orbits: 2 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 3 > 0: True
q=3 d=2: regular k mod q^d-1: 6; Frobenius orbits: 3 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 2 > 0: True
q=3 d=3: regular k mod q^d-1: 24; Frobenius orbits: 8 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 16 > 0: True
q=4 d=2: regular k mod q^d-1: 12; Frobenius orbits: 6 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 3 > 0: True
q=4 d=3: regular k mod q^d-1: 60; Frobenius orbits: 20 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 45 > 0: True
q=5 d=2: regular k mod q^d-1: 20; Frobenius orbits: 10 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 4 > 0: True
q=5 d=3: regular k mod q^d-1: 120; Frobenius orbits: 40 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 96 > 0: True
q=7 d=2: regular k mod q^d-1: 42; Frobenius orbits: 21 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 6 > 0: True
q=7 d=3: regular k mod q^d-1: 336; Frobenius orbits: 112 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 288 > 0: True
```



---

## Appendix 44: grok_swarm/galois_rows/RUN3_CM_PRESCRIBED_COMPLETION_AND_SPHERICAL_SATAKE.md
Working-repo blob 8b5d21ab29aa337fb0535415bb990d16addf7c85. Original validation status retained.

# galois_rows RUN 3 — prescribed-completion CM extensions and Satake parameters from unlinked unramified support

Lane: `grok_swarm/galois_rows` (Grok). Continues RUN 2 (`c77487a`, §7 RESUME HERE). Upstream: leanprover-community/riemann-hypothesis at pin `40e56bab026552e089d7afcfeff08d2defb9c005`.
Status: **human-readable re-derivation, CONDITIONAL on the named dependencies in §5. Upstream declarations NOT elaborated or kernel-checked here.** RH remains OPEN. URT was not used as a premise or as evidence.

Overlap check (2026-11-24 GMT): branch head `c7e3e2e` at start, re-checked at `f5bf62f` before push (intervening commits touch only green_regular_character, math/, specialists/character_boxes, specialists/literature_provenance); no file under `research_archive/2026-11-24_lean_rh_translation_swarm/` names `exists_cm_solvDisj_dec_eq`, `exists_cm_solvable_split`, `hasSat_of_unlinked_unr`, `SphUnr`, `SuppBC` or `AboveL` in its path, and `HANDOFF_QUEUE.md` has no claim on them. The fallback (`SuppBC`) was therefore not needed.

## 0. Provenance (blob ids at the pin; all re-checked by `RUN3_replay_checks.py`)

| file (under `src/Development/`) | blob | declarations used |
|---|---|---|
| AbelianVarietyTheory/Proofs/SatakeParameters/ExistsSolvableCmExtensionAbelianCompletion.lean | 788132cf | `GlobalTheory.AboveL.exists_cm_solvDisj_dec_eq`, `AboveL.DecRes.{resHom, resHom_injective, resHom_surjective, mem_map_iff, isOpen_map, commutator_le_map}` |
| …/SatakeParameters/ExistsSolvableCmExtensionAbelianCompletionStatement.lean | 4c6f90f5 | alias `GlobalTheory.T.exists_solvable_cm_extension_abelianCompletion` |
| …/SatakeParameters/ExistsSolvableCmExtensionSplitPlace.lean | 0e627042 | `GlobalTheory.AboveL.exists_cm_solvable_split`, `AboveL.mem_dec_congr` |
| …/SatakeParameters/ExistsSolvableCmExtensionSplitPlaceStatement.lean | 4d9e0009 | alias `GlobalTheory.T.exists_solvable_cm_extension_split_place` |
| …/SatakeParameters/ExistsCmFieldLiftDisjointOfRealSolvable.lean (+Statement 7e93ec1f) | 5303f735 | `GlobalTheory.KLift.exists_cm_lift` = `T.exists_cmField_lift_disjoint_of_real_solvable` |
| …/SatakeParameters/ExistsAbelianTotallyRealExtPrescribedCompletion.lean (+Statement 0c35a56c) | 74824e74 | `GlobalTheory.AbStep.{loc_char, gal_char, one_char, exists_abelian_real_field}` = `T.exists_abelian_totallyReal_ext_prescribedCompletion` |
| …/SatakeParameters/FiniteDecompositionGroupsCoverOpenQuotient.lean (+Statement 0a81780d) | 840f45a0 | `GlobalTheory.DecCover.main` = `T.finite_decompositionGroups_cover_openQuotient` |
| …/SatakeParameters/CmSubfieldsCompositumClosedStatement.lean | c385108b | `T.cm_subfields_compositum_closed` (third conjunct) |
| AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsHcharPrescribedTrivial.lean | 649f9a3d | `GlobalTheory.DelEps.Twist.exists_hchar_prescribed` |
| AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/LocalComponentsOfSmoothCharacters.lean | 5ee15c31 | `GlobalTheory.SphUnr.{hasSat_of_unlinked_unr, equiv_prodIrr_chars, equiv_prodIrr_untwist, exists_equiv_of_eq, hasSatGL_of_equiv_prodIrr, exists_isUnitarisable_twist, valAt_ofChar}` |
| …/ToralDeRham/FrobeniusCharpolyEqSatakeOfPlaceAbove.lean | a57bfc29 | the call site of `hasSat_of_unlinked_unr` (line 81) |

Notation. Ω an algebraic closure; G K Ω = Gal(Ω/K); for a valuation ring A of Ω, Dec_K(A) ≤ G_K its decomposition group; E CM with maximal totally real subfield E⁺ =: F. `SolvDisj M N` (RegPolOfRepOf, checked in RUN 2) = M/E Galois ∧ Gal(M/E) solvable ∧ every g ∈ G_E is x·n with x ∈ G_M, n ∈ N.

## 1. The shared mechanism, derived once — Proposition P (CM lift of a totally real abelian field with prescribed local Galois group)

**Statement (composite of `AbStep.exists_abelian_real_field` and `KLift.exists_cm_lift`).** Let E be CM, F = E⁺, A a valuation ring of Ω over a finite place v of F, N ≤ G_E open, and W ≤ Dec_F(A) open with [Dec_F(A), Dec_F(A)] ≤ W. Then there is a CM field M ⊇ E inside Ω with
 (P1) `SolvDisj M N`;
 (P2) M = E·F₁ for a finite abelian, totally real F₁/F, so for g ∈ G_E: g fixes M ⇔ g fixes F₁;
 (P3) for g ∈ Dec_F(A): g fixes F₁ ⇔ g ∈ W;
 (P4) F₁ ⊆ M⁺.

**Proof.**
*Step 1 (the set T, `KLift.exists_cm_lift` first line → `DecCover.main`).* Push N into G_F (`isOpen_map_restrictScalars`, open because [E:F] finite). Choose an open normal U ⊆ N. For each g, Chebotarev (`GlobalTheory.Published.cheb_holds`, applied with the excluded set {v}) gives a place u ≠ v and an element σ of a decomposition group at u with σ ≡ g mod U, so σ⁻¹g ∈ N. The open sets {h : σ_g⁻¹h ∈ N} cover the compact G_F; a finite subcover gives a finite T ∌ v with: every g ∈ G_F is x·n with x in a decomposition group Dec_F(A′) at some u ∈ T and n ∈ N.
*Step 2 (F₁, `AbStep.exists_abelian_real_field`).* Q := Dec_F(A)/W is finite (W open in the compact Dec_F(A), `LocVec.finiteIndex_of_isOpen`) and abelian (W ⊇ commutator). Pick characters ψ_q : Q → ℂˣ separating points (`CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`). For each q globalise χ_q := ψ_q∘(Dec→Q) by `one_char`:
 - (`loc_char`) the local Artin map a of v turns χ_q into a smooth finite-order θ on F_vˣ with θ(a σ) = χ_q(σ) for σ in the Weil group;
 - (`exists_hchar_prescribed`) a finite-order Hecke character η of F with η_v = θ, η_u = 1 for u ∈ T, trivial at all infinite places. Mechanism (as consumed at its call sites): with m = ∏ orders, `ChevalleySUnits.exists_places` gives a finite set of auxiliary places on which "global unit, locally a unit off S and ≡ 1 there" forces "m-th power"; then the idelic character prescribed on the S-components and trivial on an open level subgroup is well defined on Fˣ·(…) because the obstruction elements are m-th powers and θ_w^m = 1 (`hxz`), and extends by `exists_unitary_char_of_open_subgroup_and_hom`. No Grunwald–Wang obstruction arises because only the local components (not the global order) are prescribed;
 - (`gal_char`) global Artin reciprocity (`globalArtinReciprocity_holds`) turns η into an open-kernel character ρ of G_F^{ab}; r_q := ρ∘toAb.
 Then r_q|Dec = χ_q: on Weil elements by local–global compatibility (`haL.glob`) and the choice of θ; on all of Dec by density — for g ∈ Dec and a finite L on which r_q and χ_q are locally constant, a Weil element τ agreeing with g on L exists (`ConjWD.exists_weil_eq_on`), so r_q(g) = r_q(τ) = χ_q(τ) = χ_q(g). Also r_q(c) = 1 for every complex conjugation c (`HilbertFromArtin.art_sign_eq` with η_∞ = 1) and r_q kills Dec_F(A′) at u ∈ T (the image of Dec is the closure of the local idèles there, `ha.dec`, where η_u = 1).
 Let φ = (r_q)_q; ker φ is open, and `RayFromArtin.exists_field` gives F₁ finite abelian over F with G_{F₁} = ker φ. Hence (P3): g ∈ Dec fixes F₁ ⇔ ψ_q(gW) = 1 ∀q ⇔ gW = 1 (separation) ⇔ g ∈ W; split at T: Dec_F(A′) ≤ G_{F₁} for u ∈ T; totally real: for an embedding φ′ of F₁ extend to j : Ω → ℂ; since F is totally real, conj∘j and j agree on F, so some σ has j∘σ⁻¹ = conj∘j; σ⁻¹ is a complex conjugation, so fixes F₁, so φ′ is real.
*Step 3 (M, `KLift.exists_cm_lift`).* M := E(F₁) inside Ω. Finite over E (spanned by a basis of F₁/F), normal over E (F₁/F normal), CM by `cm_subfields_compositum_closed` (generated over E by elements real under every embedding). Gal(M/E) embeds into Gal(F₁/F) via restriction (equal kernels in G_E), hence is solvable (indeed abelian). (P2) is immediate from M = E(F₁); (P4): each z ∈ F₁ has real image under every complex embedding of M (it is real under every embedding of Ω), so z ∈ M⁺ = `maximalRealSubfield M`. (P1): for g ∈ G_E, Step 1 writes its image in G_F as x·n with x ∈ Dec_F(A′), u ∈ T, n ∈ N; x fixes F₁ (split at T), so g·n⁻¹ fixes F₁, hence fixes M by (P2); so g = (g n⁻¹)·n with g n⁻¹ ∈ G_M. ∎
Every hypothesis is used: CM-ness of E (for M CM and E⁺ totally real in Step 2), openness of N (Step 1), openness of W (finite index, open kernels), commutator ⊆ W (Q abelian, so characters separate), v ∉ T (prescribing θ at v and 1 at T simultaneously).

## 2. `AboveL.exists_cm_solvDisj_dec_eq` (= `T.exists_solvable_cm_extension_abelianCompletion`)

**Exact statement.** ∀ Ω E [NumberField E] [IsCMField E] [IsAlgClosure E Ω] A w (h : IsPlaceOver A w), (∀ g ∈ Dec_{E⁺}(A), g fixes E) → ∀ V ≤ Dec_E(A) open with [Dec_E(A),Dec_E(A)] ≤ V, ∀ N ≤ G_E open, ∃ CM M ⊇ E, `SolvDisj M N` ∧ ∀ g ∈ Dec_E(A), (g fixes M ⇔ g ∈ V).
**Proof.** The hypothesis `hfix` says Dec_{E⁺}(A) ≤ G_E, i.e. the place of E⁺ under A splits in E. Then restriction `resHom : Dec_E(A) → Dec_{E⁺}(A)` is injective always and surjective by `hfix` (`resHom_surjective` lifts k to an E-automorphism because k fixes E), so it is an isomorphism of topological groups onto Dec_{E⁺}(A). Put W := resHom(V): it is open (`isOpen_map`) and contains the commutator (`commutator_le_map`, by surjectivity). The place v of E⁺ under A comes from `ShaCmp.exists_over_iff` (both directions). Apply Proposition P with (v, W, N): M, F₁ with (P1)–(P3). For g ∈ Dec_E(A): g fixes M ⇔ g fixes F₁ (P2) ⇔ resHom g ∈ W (P3) ⇔ g ∈ V (injectivity: `mem_map_iff`). ∎ (Lean shape of this chain: `dec_eq_transport`.)
Gal(F₁/E⁺) abelian ⇒ solvable (`isSolvable_of_comm`) feeds the solvability hypothesis of `KLift`.

## 3. `AboveL.exists_cm_solvable_split` (= `T.exists_solvable_cm_extension_split_place`)

**Exact statement.** Same quantifier prefix (no `hfix`, no V); ∃ CM M ⊇ E with `SolvDisj M N` ∧ (∀ g ∈ Dec_E(A), g fixes M) ∧ (∀ g ∈ Dec_{M⁺}(A), g fixes M).
**Proof = Proposition P with W := Dec_F(A) ∩ G_E** (F = E⁺, v := comap of w, an explicit `HeightOneSpectrum` built from a nonzero x₀ ∈ w). W is open (G_E is the fixing group of the finite field E). Commutator ⊆ W: Gal(E/F) has order 2 (`IsQuadraticExtension.finrank_eq_two`), hence is cyclic, so every commutator in Dec_F(A) restricts trivially to E. Proposition P gives M = E·F₁ with: for g ∈ Dec_F(A), g fixes F₁ ⇔ g fixes E (`hkey`, `hkey2`).
 - Clause 2: g ∈ Dec_E(A) restricts to g′ ∈ Dec_F(A) (`mem_dec_congr`: same underlying map, same stabiliser of A) fixing E, hence fixing F₁, hence fixing M by (P2). So the place w is totally split in M/E (Dec_E(A) ≤ G_M).
 - Clause 3: g ∈ Dec_{M⁺}(A) fixes M⁺ ⊇ F₁ (P4); viewed in Dec_F(A) it fixes F₁ hence fixes E (P3 with W = Dec∩G_E); so it is an E-automorphism fixing F₁, so fixes M (P2). So the place of M⁺ under A splits in M — exactly the `hfix` hypothesis of §2 for the field M. ∎
**How RUN 2 chains them (WeaklyAttachedToralOfCmLift, checked in RUN 2):** §3 gives M₀ (with N₀ = trace-nonzero subgroup); its clause 3 is `hfixR₀` (line 41 destructures it, line 59 passes it to §2); §2 applied over M₀ with V from `exists_open_subgroup_weilElement_characterKernel` gives M₁. So both steps of Theorem B rest on the single Proposition P.

## 4. `SphUnr.hasSat_of_unlinked_unr`

**Exact statement.** Inq → ∀ E [NumberField E] [IsCMField E] n, 1 ≤ n → ∀ π : CuspSub E n, w, σ : SmIrr(GL_n(E_w)), π.IsLocComp w σ → ∀ ξ : Fin n → (E_wˣ →* ℂˣ) smooth, HasSupport σ.ρ (chars ξ) → Unlinked (chars ξ) → (∀ j, ξ_j trivial on units) → ∀ ϖ with v(ϖ) = exp(−1) → (CG.mk π).HasSat w {ξ_j(ϖ)}_j (as a multiset).
(At the call site the support hypothesis is for σ itself after norm-composition, `(ξ0 j).comp normU`; RUN 2 §2 step 3c.)
**Proof.**
 1. *Unitary twist* (`exists_isUnitarisable_twist`): some real t makes σ⊗|det|^t unitarisable — from a unitary twist π₀ = π⊗|·|^{−t} of the cuspidal π (`CG.exists_isUnitary_twist_absPow`) and unitarisability of local components of unitary cuspidals (`ResW.isUnitarisable_of_isLocComp_cusp`). Let χ = |·|^t.
 2. *Generic* (`Generic.isGeneric_of_isLocComp`): local components of cuspidal π are generic; genericity survives the twist.
 3. *Support transport*: the twist has support chars(ξ_j χ) (`TwistSupp.chars_eq_map_nu`, `HasSupport.tw`) and is still unlinked (`TwistSupp.unlinked_map_nu`: twisting by ν^t commutes with ν-shifts).
 4. *Classification* (`equiv_prodIrr_chars`, using `hI.gen : GlobalTheory.Published.GenericUnitaryDualGL`): a smooth irreducible unitarisable generic representation is ≅ a product ×_i L(Δ_i)ν^{s_i} of Langlands-segment representations. Its support is the sum of the segment multisets (`TD.hasSupport_of_isSubquotient_prodIrr`) and supports are unique (`TD.hasSupport_unique`, with the geometric lemma `geometricLemma_of_filtration Laid.bzfin_holds geometricLemmaFiltration_holds`). If some segment had length ≥ 2 it would contain both its first character μ and μν, which are linked — contradicting Unlinked (`hlen`; Lean shape `seg_len_one`). So every segment is a single character, equal to some ξ_{τ(i)}χ, and σ⊗χ ≅ ×_i ξ_{τ(i)}χ with multiset {ξ_{τ(i)}χ} = chars(ξχ).
 5. *Untwist* (`equiv_prodIrr_untwist`, `IrrGL.tw_ofChar`): σ ≅ ×_i ξ_{τ(i)}.
 6. *Spherical* (`hasSatGL_of_equiv_prodIrr`): ξ_{τ(i)} unramified ⇒ it is the unramified character with value ξ_{τ(i)}(ϖ) (`eq_unrChar`); the unramified principal series has a K-fixed vector (`GenSph.isSpherical_prodIrr_uc`), so σ is spherical with Satake parameters {ξ_{τ(i)}(ϖ)} (`hasSatGL_of_hasSatakeGL`); degree count forces h = n.
 7. *Multisets*: applying y ↦ valAt ϖ y · χ(ϖ)⁻¹ to {ξ_{τ(i)}χ} = {ξ_jχ} gives {ξ_{τ(i)}(ϖ)} = {ξ_j(ϖ)} (`valAt_ofChar`) — τ need not be given as a bijection; only the multiset identity is used.
 8. *Globalise* (`HeightCounting.Blocks.hasSatGL_locRep`, `CG.hasSat_mk`). ∎
Every hypothesis is used: 1 ≤ n and CM-ness (step 1), local component (1, 2, 8), support + Unlinked (4), unramified (6), uniformiser (6–7). The only field of `Inq` consumed is `gen`.

## 5. Remaining dependencies (exact names; not reconstructed here)

Published / trust boundary: `GlobalTheory.Published.cheb_holds` (Chebotarev), `GlobalTheory.Published.GenericUnitaryDualGL` (via `Inq.gen`).
Native, not yet reconstructed: `GlobalTheory.globalArtinReciprocity_holds`, `GlobalTheory.localArtinExists_holds`, `GlobalTheory.RayFromArtin.exists_field`, `GlobalTheory.HilbertFromArtin.art_sign_eq`, `GlobalTheory.ConjWD.exists_weil_eq_on`, `GlobalTheory.ChevalleySUnits.exists_places`, `GlobalTheory.exists_unitary_char_of_open_subgroup_and_hom`, `GlobalTheory.Mem.FinOrder.finite_order_of_inf_eq_one`, `GlobalTheory.CMSub.isCMField_sup_le_adjoin`, `Formalism.MainNotions.V.Pf.ShaCmp.exists_over_iff`, `GlobalTheory.Laid.bzfin_holds`, `GlobalTheory.geometricLemmaFiltration_holds`, `GlobalTheory.CompanionTheory.Hypotheses₂.TD.{hasSupport_unique, hasSupport_of_isSubquotient_prodIrr}`, `GlobalTheory.GenSph.{isSpherical_prodIrr_uc, eq_first_of_isLSeg}`, `GlobalTheory.ResW.isUnitarisable_of_isLocComp_cusp`, `CG.exists_isUnitary_twist_absPow`, `Generic.isGeneric_of_isLocComp`, `GlobalTheory.HeightCounting.Blocks.hasSatGL_locRep`, `GlobalTheory.LFun.SatCompare.hasSatGL_of_hasSatakeGL`.
(Whether a given `_holds` name is itself proved natively or rests on a `Published` wrapper was not traced in this run.)

## 6. Formal companion and evidence (actually run, 2026-11-24 GMT)

- `RUN3_CmPrescribedCompletionSchema.lean` (namespace `GrokCmPrescribed`), core Lean 4.33.1, no Mathlib: `solvDisj_of_cover` (no axioms), `fix_iff_mem_of_separating` (propext, Classical.choice, Quot.sound), `dec_eq_transport` (propext), `seg_len_one` (propext, Classical.choice, Quot.sound); exit 0, no sorryAx. Abstract shapes only; NOT a check of upstream constants. First attempt failed (an `rw` in `solvDisj_of_cover`); fixed by using the cover element directly, as upstream does after re-lifting.
- `RUN3_replay_checks.py /workspace/rh_up`: 14 blob-id checks + 77 verbatim text checks, `checks ok=91 bad=0`, exit 0. Confirms transcription, not mathematics.
- Raw outputs: `RUN3_VALIDATION_LOG.txt`.

## 7. RESUME HERE (galois_rows RUN 4)

Proposition P's arithmetic input is global class field theory. Next: reconstruct `GlobalTheory.ChevalleySUnits.exists_places` and `GlobalTheory.DelEps.Twist.exists_hchar_prescribed` in full (the Chevalley m-th-power step), then trace whether `globalArtinReciprocity_holds` / `localArtinExists_holds` are native or `Published`. Alternative if claimed: `UpperTheory.Gal.InertialTypesAlt.SuppBC` / `suppBC_outright` (RUN 2 Theorem C input).



---
## Appendix 45: grok_swarm/native_family_existence/09_exceptional_pair_build_and_positivity/CHAPTER_EXCEPTIONAL_PAIR_BUILD_AND_POSITIVITY.md
Peer Git blob: 1e7c0f9c13e1c8135eb64321a8f24800eb23f76e; evidence status retained.

# Chapter 09: compiling the closure of `ExceptionalPair.main`, and three positivity and bound lemmas

Lane: native_family_existence. Run 9, 2026-11-24 (GMT).
Pin: `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`, with Mathlib `0df444a`.
Paths are relative to `src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/`.

## Part 0. Execution (real output in `run_logs.txt`, which concatenates build_run.log, companion_run.log, verify_run.log and constants_run.log under BEGIN/END markers)

**Closure size.** `clos.py` reports that the import closure of `ExceptionalDirichletZeroUniqueZeroFreeRegionStatement`, the re-export of `GlobalTheory.ExceptionalPair.main`, has **30 upstream modules**. Compared with the run-8 closure it adds only two modules: `ExceptionalDirichletZeroUniqueZeroFreeRegion` and its `…Statement`. That was small, so it was compiled.

**Method.** The same as run 8, and read-only. The scripts `08_/build_closure.py`, `08_/clos.py` and `08_/run_companions.sh` were used unchanged except that the scratch output directory was changed from `/workspace/nfe8/build` to `/workspace/nfe9/build`. The roots are listed in the header of `build_run.log`. The dependency oleans came from `/workspace/rh_green_lean/.lake/packages`, whose 9 package revisions are identical to the upstream manifest. Each upstream source module was compiled with core `lean` v4.33.1 (`build_closure.py`), using the options from the upstream `lakefile.toml`. The outputs went to scratch, and nothing was downloaded. The verifier confirms the compiled source tree is blob-identical to the pin.

**Build.** `build_run.log` shows **30/30 modules compiled, 0 failures**. The only warnings are linter and deprecation warnings, and no module contains `sorry`. Among the compiled modules are `ExceptionalDirichletZeroUniqueZeroFreeRegion` (17 s) and its `…Statement` (13 s). The box was shared with other lanes' Lean jobs, so module times are longer than in run 8.

**Companions** (`companion_run.log`):

| file | result | `#print axioms` |
|---|---|---|
| 09_/RH_Run9Companion.lean (new) | **exit 0** | `RealZeroNearOne.exists_bound`, `TwoRealCharacters.neg_sum_logDeriv_nonneg`, `logDerivativeThreeFourOne.three_four_one`, `ExceptionalPair.main`, `T.exceptionalDirichletZero_unique_zeroFreeRegion`: [propext, Classical.choice, Quot.sound] |
| 09_/RH_ExceptionalPairCompanion_T1part.lean (new) | **exit 0** | `ExceptionalPair.main`: [propext, Classical.choice, Quot.sound] |

`RH_ExceptionalPairCompanion_T1part.lean` is the T-1 part of the committed `04_/RH_ExceptionalPairCompanion.lean`, copied verbatim from lines 5–21. Two things are dropped: the `import …CharacterBoxes.MainConclusion` line and the T-8 block, because MainConclusion's closure is about 175,000 modules. Its `example` re-types the chapter-04 statement of T-1 in full and closes it with `GlobalTheory.ExceptionalPair.main`. It elaborated, so chapter 04 quotes the T-1 statement faithfully. **The committed 04_ companion as a whole, including T-8, is still NOT EXECUTED.**

**What this establishes.** `GlobalTheory.ExceptionalPair.main` (T-1) and its whole upstream subtree compile from pinned source against Mathlib 0df444a. Its transitive axioms are only Lean's three standard ones. T-1 is therefore a proved theorem inside the pinned project, not merely a source reading. This is still not RH, and no gate is closed.

---
## A. `GlobalTheory.RealZeroNearOne.exists_bound` (OrderNeTop.lean:33)
```lean
theorem exists_bound : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
    χ ≠ 1 → ∀ σ : ℝ, 1 < σ → σ ≤ 2 → ∀ T : Finset ℝ,
    (∀ β ∈ T, 2 / 3 ≤ β ∧ LFunction χ β = 0) →
    -(deriv (LFunction χ) σ / LFunction χ σ).re ≤ C * Real.log (2 * q)
      - ∑ β ∈ T, (analyticOrderNatAt (LFunction χ) β : ℝ) / (σ - β) := by
```
**What it says.** For a non-principal χ and real σ ∈ (1, 2], take any finite set T of real zeros of L(χ, ·) in [2/3, 1). Then −Re L′/L(σ) is at most C·log 2q minus Σ_{β∈T} m_β/(σ − β). C is the constant of (LZ) and is uniform in q and χ. This is the bound used in chapter 05 (T-1a).

**Proof.** C is the (LZ) constant, `GlobalTheory.T.logDeriv_dirichletLFunction_local_zero_sum`, chapter 07 §A.
1. Apply (LZ) with t = 0 and s = σ. This is allowed because |σ − 3/2| ≤ 1/2 ≤ 2/3, and because L(χ, σ) ≠ 0 for σ > 1 (Mathlib `LFunction_ne_zero_of_one_le_re`). Write Z for the finite zero set in the 5/6-disc about 3/2 and S = Σ_{w∈Z} m_w/(σ − w). (LZ) gives |D − S| ≤ C·log(q·(|0| + 2)) = C·log 2q, where D = L′/L(σ). Taking real parts, Re D ≥ Re S − C log 2q.
2. *T ⊆ Z.* Each β ∈ T satisfies β < 1 (`re_lt_one`: L(χ, z) ≠ 0 for Re z ≥ 1, χ ≠ 1). Then |β − 3/2| ≤ 5/6 because 2/3 ≤ β < 1. The map ℝ → ℂ is injective, so distinct β are distinct points of Z.
3. *Each term of S has nonnegative real part.* For w ∈ Z, Re w < 1 < σ, so Re 1/(σ − w) = (σ − Re w)/|σ − w|² > 0, and m_w ≥ 0. So Σ_{β∈T} m_β/(σ − β), a sum over a subset with real terms, is ≤ Re S.
4. Hence −Re D ≤ C log 2q − Re S ≤ C log 2q − Σ_T m_β/(σ − β).

Edge cases: T = ∅ is allowed, and then the bound reads −Re D ≤ C log 2q. q = 1 is vacuous, since every χ is 1. The upper limit σ ≤ 2 is used only to stay in the 2/3-disc.

## B. `GlobalTheory.TwoRealCharacters.neg_sum_logDeriv_nonneg` (NegSumLogDerivNonneg.lean:42)
```lean
theorem neg_sum_logDeriv_nonneg : ∀ (q : ℕ) [NeZero q] (χ ψ : DirichletCharacter ℂ q) (σ : ℝ), χ ^ 2 = 1 → ψ ^ 2 = 1 → 1 < σ → 0 ≤ -((deriv (LFunction (1 : DirichletCharacter ℂ q)) σ / LFunction (1 : DirichletCharacter ℂ q) σ).re + (deriv (LFunction χ) σ / LFunction χ σ).re + (deriv (LFunction ψ) σ / LFunction ψ σ).re + (deriv (LFunction (χ * ψ)) σ / LFunction (χ * ψ) σ).re) := by
```
This is (NN) from chapter 05.

**Proof.**
1. *`hasSum_re_neg_logDeriv`:* for σ > 1, −Re L′/L(χ, σ) = Σ_n Re χ(n)·Λ(n)/n^σ, convergent. This uses Mathlib's `LSeries_twist_vonMangoldt_eq`, which says −L′/L = L-series of χΛ for Re > 1, together with `deriv_LFunction_eq_deriv_LSeries`. Then take real parts termwise, which is legitimate because n^σ is real.
2. *`re_sum_nonneg`:* for every a ∈ ℤ/q, Re[1(a) + χ(a) + ψ(a) + (χψ)(a)] ≥ 0. If a is a unit, χ² = ψ² = 1 forces χ(a), ψ(a) ∈ {±1}, and the sum is 1 + x + y + xy = (1 + x)(1 + y) ≥ 0. If a is not a unit, all four values are 0.
3. Adding the four series termwise, the n-th term is [step-2 quantity at a = n mod q]·Λ(n)/n^σ ≥ 0, since Λ ≥ 0. So the sum is ≥ 0 (`HasSum.nonneg`).

Edge cases: χ = ψ, χ = 1 and ψ = 1 are all allowed. The proof never uses χ ≠ ψ.

## C. `GlobalTheory.logDerivativeThreeFourOne.three_four_one` (LogDerivativeBound.lean:76)
```lean
theorem three_four_one : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (σ t : ℝ), 1 < σ → 0 ≤ -(3 * (deriv (LFunction (1 : DirichletCharacter ℂ q)) σ / LFunction (1 : DirichletCharacter ℂ q) σ).re + 4 * (deriv (LFunction χ) (σ + t * I) / LFunction χ (σ + t * I)).re + (deriv (LFunction (χ ^ 2)) (σ + 2 * t * I) / LFunction (χ ^ 2) (σ + 2 * t * I)).re)
```
This is the 3-4-1 kernel from chapter 06. The full statement line is copied word for word into `verify_run9_sources.py` and checked there. It is also printed by `#check` in `companion_run.log`.

**Proof.**
1. *`comb_nonneg`:* if |z| = 1 then 3 + 4 Re z + Re z² ≥ 0. With z = x + iy and x² + y² = 1, the expression is 3 + 4x + x² − y² = 2(1 + x)² ≥ 0.
2. *`neg_logDeriv_eq`:* for Re s > 1, −Re L′/L(χ, s) = Σ_n Re[χ(n)Λ(n)n^{−s}]. This uses the same Mathlib inputs as B.1.
3. *`term_nonneg`, for each n:* write n^σ = A > 0, b = n^{it} with |b| = 1, and c = Λ(n)/A ≥ 0.
   - If n is a unit mod q, the three terms are 3c, 4c·Re(χ(n)/b) and c·Re((χ(n)/b)²). This uses n^{σ+2it} = A·b² and χ²(n) = χ(n)². Since |χ(n)/b| = 1, step 1 gives a total ≥ 0.
   - If n is not a unit, all terms vanish.
4. Combine 3·(series at σ) + 4·(series at σ + it) + (series at σ + 2it). The sum is ≥ 0 termwise.

Edge cases: χ = 1, t = 0 and χ² = 1 are all allowed. No hypothesis on χ is needed.

---
## D. Erratum for RUN8
The header comment of `08_/RH_Run8Companion.lean` names `lake_lean_run.log` and `CHAPTER_ANALYTIC_BASE.md`. The correct names are `companion_run.log` and `CHAPTER_EXECUTED_COMPANIONS_AND_ANALYTIC_BASE.md`. This is recorded in `NOTE_RUN8_COMPANION_HEADER.md`, and the committed file is not rewritten.

## Remaining dependencies
- Mathlib only, for A, B and C: `LFunction_ne_zero_of_one_le_re`, `LSeries_twist_vonMangoldt_eq`, `deriv_LFunction_eq_deriv_LSeries`, `LSeriesSummable_twist_vonMangoldt` and `vonMangoldt_nonneg`. These are compiled into the oleans used.
- Inside the 30-module T-1 closure nothing is assumed, because all of it was compiled. Some of it is still not written up in prose, for example `ZeroFreeComplex.LFunction_conj_eq_zero` and the `DirichletLZerosEqPrimitiveCharacterZeros` internals.
- Not compiled here: anything above `ExceptionalPair.main`, namely `primesRel_holds` and the rest of the main path (chapters 02–03). Their closures are on the order of 13,000 or more modules.

## RESUME HERE
1. `PrimesInProgressionsRelativeError` (`Lin.primesRel_holds`), the next step up from T-1, has an import closure of **485 modules** (measured this run with `clos.py`), and `ChebyshevPsiProgressionRelativeError` has 481. That is probably buildable with the same method in about an hour when the box is quiet. Check disk first; the run-8 build of 29 modules used about 9 MB of oleans.
2. Write up `ExceptionalPair.main` assembly lemmas not yet written in prose, if any remain after chapter 04.
3. Fourth-level η users.

## HANDOFF TO
- **lean_validation:** the T-1 subtree, `ExceptionalPair.main` and below, is now compiled from pinned source with standard axioms. It need not be redone.


---
## Appendix 46: integration/2026-11-24_1000_PARUNIQ_CYCLIC_PROOF.mjs
Peer Git blob: 7644e7529c4e876cdf3ff26516f9e726419d915e; evidence status retained.

~~~javascript
/*
# Tame local parameter uniqueness — integration chapter, 24 Nov 2026
SOURCE-MATCHED conditional human derivation, not independent upstream Lean replay. Extends the 09:00 RecT graph and the math lane's guarded GoodMap/JunkEx chapter. This run expands ParUniq rather than duplicating ParEx existence. All ambient hypotheses are retained in RecTTransport and the typed graph below. The full RH proof is not reconstructed.

1. Orbit identity. For z in K× write f_j(z)=θ(z^(g^j)). Since |K|=g^n, f_(j+n)=f_j. Shifting the n-factor product cyclically does not change it. If two InFor polynomials agree at each inertia t, the coefficient of X^(n-1) is minus the corresponding orbit sum. Surjectivity of R extends equality to every z in K×. Distinct multiplicative complex characters are linearly independent (the source's linearIndependent_monoidHom). The orbit sums are finitely supported combinations with integer multiplicities. Their coefficient functions must coincide. θ' occurs in its own orbit with multiplicity at least one (j=0, n>0), so appears in the first: θ'=θ^(g^j) for some j<n. This private lemma needs no regularity of θ'; the surrounding TameUniq and NameLaws require regular θ. Do not conflate these conditions.

2. Tame generator and cyclic basis. TameUniq.pair_of_gen uses degree MINUS ONE Frobenius φ and a tame inertia generator t0. For a tame irreducible WD representative put M=ρ(t0), G=ρ(φ). The smooth tame generator theorem gives MG=GM^g (normV w=g); both operators are invertible. A common stable subspace is stable under the full Weil action by that theorem, hence the pair is irreducible. st1a: if Mv=zv, then M(G^j v)=z^(g^j)G^jv. The finite eigenvalue set gives a collision; choose z on a periodic orbit of least positive length d. E_z is stable under G^d. Choose a nonzero eigenvector v of the restriction of G^d to E_z over C, with eigenvalue μ≠0 by invertibility. The vectors b_j=G^jv for 0≤j<d are independent because their M-eigenvalues are distinct. Their span is stable under both M and G because G b_(d-1)=μ b_0. Irreducibility makes it the entire space: d=dim V. No prior diagonalizability hypothesis is added.

3. st1b: determinant fixes the closing coefficient. Given two n-dimensional pairs as in the graph, choose both cyclic bases with initial eigenvalue z. If the second eigenvalue initially given is z^(g^i), apply G'^(n*i-i) to its eigenvector, which moves it to z by periodicity. In these bases M,M' are the same diagonal matrix and G,G' cyclic shifts with final multipliers μ,μ'. Their determinants equal (-1)^(n-1)μ and (-1)^(n-1)μ'. The Lean proof instead uses a diagonal comparison whose last entry is μ/μ', then determinant multiplicativity. Either route gives μ=μ' using equality of determinants and μ'≠0. Sending b_j to b'_j intertwines both pairs. Without determinant equality this conclusion fails in general, because the closing coefficient is still free. The full WD isomorphism additionally needs the smooth tame generator theorem and zero monodromy of irreducible WD reps, retained dependencies.

4. TameUniq third projection: take both irreducible tame WD representatives via exists_good. The inertia characteristic polynomial at t0 has degree n, giving both dimensions. st1a gives z with exact period n. InFor gives z as the i-th character value, so the second polynomial contains z^(g^(n-i)), the zeroth character value; use st1b with this offset. The determinant character equality at every Weil element gives equal determinants at φ. The pair intertwiner lifts to WD isomorphism and WD.mk_eq_mk gives V'=V. This is not a classification of arbitrary nontame WD objects.

5. ParUniq first projection: fix y cuspidal depth zero and Par(a,y,V). Obtain n>0, D via extEx, R via resEx, finite cuspidal type τ and its inflation via typeEx, regular name θ via nameLaws. Par's universal TypeAt field gives InFor for every W with Par(a,y,W), using these same D,R,θ,τ. Choose the central character ω by clBasic. If Par(a,y,V'), both irreducibility and tameness plus common InFor and the exact central laws give equal determinant characters on every Weil element. TameUniq third projection gives V'=V.

6. Reverse projection: let y' also be cuspidal depth zero and Par(a,y',V). The dimension fields force equal ranks. Choose type τ' and regular θ' over the SAME D,K,R. TameUniq second projection says θ'=θ^(g^j); NameLaws third projection gives τ'.character=τ.character. Choose ω' for y'. For each unit z, local Artin surjectivity gives s with a(s)=z. The two central laws imply ω'(z)=ω(z), so ω'=ω, not merely equality of moduli. detByType identifies y'=y from finite-character equality, both inflation maps and both exact central laws. detByType uses iso_of_char to transport one inflation map to the common finite representation, preserving its nonzero and intertwining properties. With common central character and two type maps, equiv_of_typeMaps supplies p-adic representation equivalence and class equality. This proves precisely the two guarded projections in RecTTransport; no unconditional local correspondence or bad-to-bad injectivity follows. NameLaws actually calls native greenRegularCharacters and pin; peer Green companion checks remain conditional on their named upstream inputs.

The executable below emits JSON for eight selected nodes with the actual source paths and blob identities, named frontier, and updated project index. Reproduce using node THIS_FILE /path/to/rh-clone (checks git blob hashes and runs same source assertions). Connector-read bytes and reported SHA were used for this run, not an independent clone. Modular arithmetic illustrates the cyclic determinant formula; it is not the Lean proof. Tests include eight source deletions; the first attempt failed because replacing only the first occurrence of the Frobenius-degree clause left a duplicate. Corrected mutation replaces all occurrences. No URT benchmark or advantage claimed.

Continuity: protocol, AGENTS, research state/log/protocol, handoff, continuity, summary #360 PASS at 09:58:18 UTC (run 45366981032; unrelated to RH kernel verification), latest 09:56 manuscript, cancellation/guarded cusp math, audit removable pole, dependency/structure export checkpoints, kernel and acceleration, native family T8/T1 and Green/Galois commit records inspected. Blueprint PDF readable text retrieved as navigation, not proof input. Literal RESUME_HERE.md and root RESEARCH_PROTOCOL.md paths 404; dated files and nested protocol recovered from commit records. Some specialist checkpoints remain unchecked; complete lane inventory not asserted. Guessed ParEx.lean/CuspT.lean paths 404; no invented proof. Both retry and native fixture status files 404; no success inferred. Upstream main observed 73958da58a8a4d1f61b789745c5444baf6247cae, Main blob differs from pin, no equivalence assumed. No unrelated records touched.

RESUME HERE: follow actual parEx producer via GoodMap.CentralUnit in coordination with math, or if already claimed expand the substantive equiv_of_typeMaps input to detByType. Editor append this chapter; audit review degree-minus-one Frobenius and both depth-zero guards. Dependencies retain selected source versus kernel labels. Full proof remains OPEN.
*/
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
export const graph={
  "schema": "RH selected source obligation extension v1",
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "source_ledger": {
    "types": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/RecTTransport.lean",
      "631f12febe08029e0d1d11139a704a6aaab367fb"
    ],
    "par": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/ParUniq.lean",
      "87d971db5f5faa95d960b55914583b51d6baf31d"
    ],
    "tame": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/TameUniq.lean",
      "79c1421916a98253dca5785cf687c3d425cd73eb"
    ],
    "names": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/NameLaws.lean",
      "bacce9b1591f33a3d01f365d52dea406fd415dce"
    ],
    "det": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/DetByType.lean",
      "df921e1cb033a12cb6d93974fbcff4746d3e60c9"
    ],
    "typeEx": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/TypeEx.lean",
      "1fe68a05883be17946a5f6d797d22d9fe552b993"
    ],
    "good": [
      "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/GoodMap.lean",
      "1223776d8052ec8c0e7fba84b94780fda55a60f2"
    ],
    "cyclic": [
      "src/Development/WeilBound/RepresentationTheoryGL/GaloisPermutationReps/SubquotientEquivalence/EquivariantPartsOfFiniteType.lean",
      "fe27c490c35dee802a0b450a260f27ac3c01be5a"
    ],
    "pair": [
      "src/Development/WeilBound/RepresentationTheoryGL/GaloisPermutationReps/SubquotientEquivalence/PairingFactorsThroughPeriods.lean",
      "c192d0275052888b9606ea9e3a748099e21d39ea"
    ]
  },
  "root": "par",
  "status": "SOURCE-MATCHED, not kernel replay",
  "base": "2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json",
  "nodes": [
    {
      "id": "par",
      "source": "par",
      "range": [
        15,
        54
      ],
      "premises": [
        "E number field; Ω algebraic closure; A,w,h place data; all source typeclasses",
        "a local Artin map with ha",
        "prime g, continuous p-adic field isomorphism i",
        "y.IsCusp",
        "DZ y",
        "Par a y V"
      ],
      "conclusions": [
        "∀ V', Par a y V' → V'=V",
        "∀ y', y'.IsCusp → DZ y' → Par a y' V → y'=y"
      ],
      "deps": [
        "extEx",
        "resEx",
        "typeEx",
        "nameLaws",
        "clBasic",
        "tameUniq",
        "detByType"
      ]
    },
    {
      "id": "tameUniq",
      "source": "tame",
      "range": [
        160,
        214
      ],
      "premises": [
        "TameSys h g n R including n>0, normV=g, rank n, surjectivity, open kernel, wild and Frobenius laws",
        "regular θ",
        "InFor g n R θ V"
      ],
      "conclusions": [
        "every Frobenius shift gives InFor",
        "every alternate θ' giving InFor is in the orbit",
        "V'=V for irreducible tame V,V', same InFor, equal determinant characters on all Weil elements"
      ],
      "deps": [
        "pow_period",
        "prod_shift",
        "orbit_of_sums",
        "pair_of_gen",
        "st1a",
        "st1b",
        "wd_leaves"
      ]
    },
    {
      "id": "orbit_of_sums",
      "source": "tame",
      "premises": [
        "n>0",
        "equality of orbit character sums at every z in K×"
      ],
      "conclusions": [
        "∃ j<n, θ'=θ^(g^j)"
      ],
      "deps": [
        "linearIndependent_monoidHom"
      ]
    },
    {
      "id": "st1a",
      "source": "cyclic",
      "premises": [
        "finite dimensional complex V, nontrivial",
        "M,G units",
        "MG=GM^q",
        "only common invariant subspaces are zero and full V"
      ],
      "conclusions": [
        "an eigenvalue z of exact q-power period dim V"
      ],
      "deps": [
        "linear_algebra"
      ]
    },
    {
      "id": "st1b",
      "source": "pair",
      "premises": [
        "n>0, both dimensions n",
        "G,G' invertible",
        "MG=GM^q, M'G'=G'M'^q",
        "z exact period n",
        "z eigenvalue M, z^(q^i) eigenvalue M'",
        "det G=det G'"
      ],
      "conclusions": [
        "linear equivalence intertwining both pairs"
      ],
      "deps": [
        "basis_side"
      ]
    },
    {
      "id": "detByType",
      "source": "det",
      "range": [
        284,
        313
      ],
      "premises": [
        "ambient p-adic field isomorphism; n>0",
        "cuspidal τ",
        "τ'.character=τ.character",
        "both inflation witnesses",
        "common central character ω"
      ],
      "conclusions": [
        "cls σ'=cls σ"
      ],
      "deps": [
        "finite_char_iso",
        "type_maps",
        "equiv_of_typeMaps"
      ]
    },
    {
      "id": "nameLaws",
      "source": "names",
      "premises": [
        "prime g,n>0,rank K=n"
      ],
      "conclusions": [
        "regular names exist",
        "names unique modulo Frobenius",
        "same Frobenius orbit yields equal cuspidal characters",
        "transport along field isomorphism"
      ],
      "deps": [
        "greenRegularCharacters",
        "pin"
      ]
    },
    {
      "id": "typeEx",
      "source": "typeEx",
      "premises": [
        "ambient p-adic field isomorphism, n>0",
        "cuspidal depth-zero class for existence"
      ],
      "conclusions": [
        "finite cuspidal type and inflation",
        "finite characters agree for equal classes and both types"
      ],
      "deps": [
        "exists_cusp",
        "fixed_eq_range",
        "char_eq"
      ]
    }
  ],
  "unexpanded": [
    "extEx",
    "resEx",
    "clBasic",
    "pow_period",
    "prod_shift",
    "pair_of_gen",
    "wd_leaves",
    "linearIndependent_monoidHom",
    "linear_algebra",
    "basis_side",
    "finite_char_iso",
    "type_maps",
    "equiv_of_typeMaps",
    "greenRegularCharacters",
    "pin",
    "exists_cusp",
    "fixed_eq_range",
    "char_eq"
  ],
  "consumer_edges": [
    [
      "GoodMap.twist_eq_of_tw_eq",
      "par first projection"
    ],
    [
      "GoodMap.ofChar_eq_of_tw_eq",
      "par first projection"
    ]
  ],
  "edge_scope": "Selected source applications, not complete implicit/kernel references; frontier nodes are not asserted axioms.",
  "index": {
    "manuscript": "../specialists/proof_editor/2026-11-24_0956_INTEGRATED_MANUSCRIPT.md",
    "guarded_cusp": "../math/2026-11-24_guarded_cusp_map_algebra.md",
    "prior_graph": "2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json",
    "green_peer_commit": "f5bf62fe2b84df817e2cf8cff49a2f96d1594334",
    "native_family_peer_commit": "854a153db0f7027904c1f6c11323ddf2eea8fbaa",
    "audit_peer_commit": "cc0abbc2045168168b0206f110dda3fe637a86eb",
    "export_checkpoint": "WHOLE_PROOF_COVERAGE_AND_EXPORT_RUN.md"
  },
  "coverage": {
    "selected_nodes": 8,
    "source_modules": 9,
    "full_kernel_denominator": null,
    "full_translation_percent": null
  }
};
export const clauses={
  "types": [
    "structure Par ",
    "def ParUniq : Prop",
    "y.IsCusp → DZ y → ∀ V : WD h, Par a y V",
    "∀ y' : IrrGL (w.adicCompletion E), y'.IsCusp → DZ y' → Par a y' V → y' = y",
    "IsIrrWD V → IsIrrWD V' → IsTameWD V → IsTameWD V'",
    "(∀ σ, (V.eig σ).prod = (V'.eig σ).prod) → V' = V"
  ],
  "par": [
    "UpperTheory.Zero.LLC.extEx E Ω A w h g i hi n hn",
    "UpperTheory.Zero.LLC.resEx E Ω A w h g i hi n hn D",
    "UpperTheory.Zero.LLC.typeEx E Ω A w h g i hi n hn c.rep",
    "hW.type g i hi n hn D R hR θ hθ τ hτ hθτ c.rep hcl hinf",
    "hVu V' hV.irr hV'.irr hV.tame hV'.tame",
    "hV.central ω hω s, hV'.central ω hω s",
    "have hm : m = n := hV'.dim.symm.trans hV.dim",
    "hθu θ' hIF'",
    "hNchar τ τ' θ j hτ hτ' hθ hθτ hθτ'",
    "obtain ⟨s, rfl⟩ := ha.surj z",
    "hτ hch hinf hinf' hω hω'"
  ],
  "tame": [
    "FiniteField.pow_card",
    "hv.finsuppLinearCombination_injective hl",
    "l1 θ' = 0",
    "l2 θ' ≠ 0",
    "obtain ⟨t, rfl⟩ := hR.surj z",
    "congrArg Polynomial.nextCoeff",
    "deg φ = -1",
    "pair_of_gen φ hφ",
    "rw [hR.normV_eq] at hc hc'",
    "st1a (Fin m → ℂ)",
    "exact hdet φ",
    "st1b (Fin m → ℂ) (Fin m' → ℂ)",
    "irreducible_monodromy_zero a hirra",
    "mem_of_tame_generator_frobenius"
  ],
  "names": [
    "PositivityTheory.Stage1.PM.greenRegularCharacters",
    "UpperTheory.Zero.LLC.pin g n hn K hK",
    "regular_pow hn hK hθ j"
  ],
  "det": [
    "GlobalTheory.Top.Lq.iso_of_char",
    "φ'.comp e.toLinearMap",
    "equiv_of_typeMaps (finCusp_comp i hi τ hτ) σ' σ hω' hω h2 h1"
  ],
  "typeEx": [
    "exists_cusp i hi hn R hcusp.2 hdz",
    "fixed_eq_range i hi τ",
    "exact char_eq τ τ'"
  ],
  "good": [
    "(parUniq E Ω A w h a ha g i hi y₁ c₁ d₁ V₁ p₁).1",
    "(parUniq E Ω A w h a ha g i hi y₀ c d V₀ p).1"
  ],
  "cyclic": [
    "M.exists_eigenvalue",
    "Nat.find hP",
    "LinearMap.restrict (G ^ d) hmaps",
    "Module.End.eigenvectors_linearIndependent'"
  ],
  "pair": [
    "basis_side M G hG hMG hz hr",
    "basis_side M' G' hG' hMG' hz hr'",
    "if j = Fin.last m then μ / μ' else 1",
    "rw [hdet] at h1",
    "div_eq_one_iff_eq hμ'"
  ]
};
export function verify(src,clauses,graph){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 function source(s){let n=0;for(const [k,ss] of Object.entries(clauses))for(const t of ss){ck(s[k].includes(t),"missing "+k+": "+t);n++}return n}
 const count=source(src);let neg=0;for(const [k,i] of [["types",3],["par",4],["par",5],["par",9],["tame",4],["tame",6],["pair",3],["det",2]]){let rejected=false;try{source({...src,[k]:src[k].split(clauses[k][i]).join("REMOVED")})}catch{rejected=true}ck(rejected,"mutation survived "+k);neg++}
 const ids=new Set(graph.nodes.map(n=>n.id)),frontier=new Set(graph.unexpanded);let edges=0;ck(ids.size===graph.nodes.length,"duplicate graph IDs");for(const n of graph.nodes){ck(graph.source_ledger[n.source]&&n.premises.length&&n.conclusions.length,"bad node");for(const d of n.deps){ck(ids.has(d)||frontier.has(d),"unaccounted edge "+d);edges++}}
 const mod=(a,p)=>(a%p+p)%p;const pow=(a,n,p)=>{let r=1n;for(let i=0;i<n;i++)r=mod(r*a,p);return r};
 const det=(a,p)=>{if(a.length===0)return 1n;let r=0n;for(let j=0;j<a.length;j++)r+=((j%2)?-1n:1n)*a[0][j]*det(a.slice(1).map(row=>row.filter((_,i)=>i!==j)),p);return mod(r,p)};
 const mul=(a,b,p)=>a.map(r=>b[0].map((_,j)=>mod(r.reduce((s,x,k)=>s+x*b[k][j],0n),p)));
 const eq=(a,b)=>a.every((r,i)=>r.every((x,j)=>x===b[i][j]));
 let cases=0,detNeg=0,orbits=0;for(const [p,q,z,n] of [[7n,2n,2n,2],[31n,2n,2n,4]]){let orb=[z];for(let i=1;i<n;i++)orb.push(pow(orb[i-1],Number(q),p));ck(new Set(orb).size===n&&pow(orb[n-1],Number(q),p)===z,"bad orbit");orbits++;const M=orb.map((x,i)=>orb.map((_,j)=>i===j?x:0n));const G=mu=>orb.map((_,i)=>orb.map((_,j)=>i===(j+1)%n?(j===n-1?mu:1n):0n));const Mq=orb.map((x,i)=>orb.map((_,j)=>i===j?pow(x,Number(q),p):0n));for(let mu=1n;mu<p;mu++){let A=G(mu);ck(eq(mul(M,A,p),mul(A,Mq,p)),"cyclic relation");ck(det(A,p)===mod((n%2?1n:-1n)*mu,p),"det sign");cases++;for(let nu=1n;nu<p;nu++)if(mu!==nu){ck(det(A,p)!==det(G(nu),p),"det guard");detNeg++}}}
 return {source_clauses:count,source_mutations_rejected:neg,typed_nodes:ids.size,accounted_selected_edges:edges,finite_orbits:orbits,finite_cyclic_examples:cases,unequal_determinant_controls:detNeg};
}
export const observed={
  "source_clauses": 51,
  "source_mutations_rejected": 8,
  "typed_nodes": 8,
  "accounted_selected_edges": 25,
  "finite_orbits": 2,
  "finite_cyclic_examples": 36,
  "unequal_determinant_controls": 900
};
const rh=process.argv[2];if(!rh)throw Error('provide RH clone path');const src={};for(const [k,[path,sha]] of Object.entries(graph.source_ledger)){const b=execFileSync('git',['-C',rh,'show',graph.pin+':'+path]);const h=createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(h!==sha)throw Error('blob mismatch '+k);src[k]=b.toString('utf8')}console.log(JSON.stringify({graph,tests:verify(src,clauses,graph)},null,2));

~~~


---
## Appendix 47: math/2026-11-24_supply_of_admissible_character_hosts.md
Peer Git blob: 7bf1852fbf0f2849d478961dcf21884e2282ac23; evidence status retained.

# MATH lane: admissible character data supply the `GChi` host

## RESULT

At `leanprover-community/riemann-hypothesis` revision
`40e56bab026552e089d7afcfeff08d2defb9c005`, this checkpoint reconstructs the difficult interior of
`UpperTheory.T3.supplyOfAdmOf`: how

\[
\mathrm{VWinAt}(\psi,401)
\quad\text{and}\quad
\text{eventual admissible ranks for }\psi
\]

produce

\[
\mathrm{HostExW}\!left(\frac32,
  \lambda\_\ s\ R\ H\_.\;
  \mathrm{EAtH}(\mathrm{Level.cyc}\ \psi,H, H.TT,s.x,s.\varepsilon,4)
  \wedge \mathrm{VVle}(H.E,R.t,\sqrt{s.b})
\right).
\tag{1}
\]

The source has a precise three-stage cutoff conversion

\[
\lfloor (x')^{401}\rfloor_+
\longrightarrow \lfloor x^{400}\rfloor_+
\longrightarrow R.t,
\tag{2}
\]

not a direct substitution of `401` by `3/2`.  The first arrow is proved in `winPairs` by rescaling
`x=kx'`; the second is the eventual rank estimate `R.t ≤ x^400`.  This fills the exact gap left by the
previous `TopG`/`VWin` chapter.

Status: **SOURCE-MATCHED conditional derivation**.  It is not an independent Lean elaboration, does not prove the
input analytic-prime or admissible-rank theorems, and does not establish RH by itself.

## Pinned source ledger

| ID | Pinned source path | Git blob | Declaration or role |
|---|---|---|---|
| `SA-S1` | `src/Development/AutomorphicArithmetic/ShortNorms/supplyOfAdmOf.lean` | `04ca5068e90544580c7684a316ec79c49d3572fc` | the proof reconstructed here |
| `SA-S2` | `src/Development/AutomorphicArithmetic/CharacterBoxes/SupplyChi.lean` | `339885b77069601fb716a60739369805241e8222` | specializes `supplyOfAdmOf` to the native host theorem and ranks |
| `SA-S3` | `src/Development/AutomorphicArithmetic/CharacterBoxes/HostOfField.lean` | `d98214b25bf84966a5b4e858a35f21ac9193b49f` | specialization of `hostOfFieldOf` |
| `SA-S4` | `src/Development/AutomorphicArithmetic/ShortNorms/hostOfFieldOf.lean` | `261b566b0ea0d155ef1a434889d720c3b439735f` | exact host-construction boundary |
| `SA-S5` | `src/Development/AutomorphicArithmetic/CharacterBoxes/WinPairs.lean` | `4670fec488d1eb59a3cc52dffc8d0eab16e16b0b` | converts `VWinAt 401` into `3/2` windows of `WinDatum` |
| `SA-S6` | `src/Development/AutomorphicArithmetic/CharacterBoxes/TwistForm.lean` | `5e8b1a992a393336dffd3603524526dfccfa1981` | `KerChi`, `TwistForm`, and exact `WinDatum` fields |
| `SA-S7` | `src/Development/AutomorphicArithmetic/CharacterBoxes/PairGood.lean` | `68d04b506355e999c0f6020ee066c4967c1e6939` | analytic prime-pair bounds and zero boxes |
| `SA-S8` | `src/Development/AutomorphicArithmetic/CharacterBoxes/PairHyp.lean` | `d47dbeec05e2463c5882a8a7643dc2bf22059f35` | converts a `WinPair` into host and Jacobi-symbol conditions |
| `SA-S9` | `src/Development/AutomorphicArithmetic/CharacterBoxes/FieldChi.lean` | `f3e2032b133ff64406a87e27438cdf467aa05a1f` | constructs the frame and raw character host |
| `SA-S10` | `src/Development/AutomorphicArithmetic/CharacterBoxes/IsChiField.lean` | `181ab535373fb54af925bfdca6af685f6955ddc5` | turns `KerChi` into the exact number-field predicate |
| `SA-S11` | `src/Development/AutomorphicArithmetic/CharacterBoxes/BoundedTw.lean` | `69e88858735720bd60454c30c64d6380e216613f` | supplies the two bounded-character fields of `EAtH` |
| `SA-S12` | `src/Development/AutomorphicArithmetic/CharacterBoxes/EventuallyRankLeRpowOfLtOneDivFiftytwo.lean` | `d60585aca568591e8192b6fd1ce9a91433c4af2d` | proves `R.t ≤ x^400` for large scales |
| `SA-S13` | `src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean` | `398eb8ed3528aa2666e9d3b2b09a582ad4390dd7` | definitions of `VWinAt`, `VAt`, and `VVle` |
| `SA-S14` | `src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean` | `15c5451df3e6d1dbd5ab32860dc23f8aa6b5be17` | native admissible-rank producer used by `supplyChi` |

## 1. Complete theorem boundary

`supplyOfAdmOf` takes two higher-order inputs before fixing `ψ`.

The first is a host-construction theorem.  For every `0<eps<1/52` and `C₀≥1`, it returns constants
`CT2,C8,c6,Cb,x₀`, with `C₀≤C8`, `c6>0`, and `Cb>0`, such that a host can be constructed from any

- scale `s` with `s.eps=eps` and `x₀≤s.x`;
- ranks `R` satisfying `RankVal s R`;
- raw host `H₀ : HostAx R.toFrame`;
- positive integer `M` and real `Y`;
- bounds `s.J≤C₀`, `R.o≤C₀`, `H₀.QS≤C₀R.n`, and `M≤C₀`;
- divisibility `H₀.QS ∣ lcm(2^(R.e+2),M)`;
- `PairWin s Y`, `PairGood M eps Y s.x H₀.q H₀.d`;
- `FieldRows H₀.toHostRaw ⌊Y^(eps/5)⌋₊` and `admitted R H₀`.

Its conclusion is a typed `H : Host R` and prime `q₀` with the same raw host, fixed `CT2`, the complete
`HostGood s C8 4 c6 Cb H q₀` record, and the sharing bound

\[
R.toFrame.Shares(H.TT,s.x^{-1+s.\varepsilon}).
\tag{3}
\]

The second input says that for each `0<eps<1/52`, eventually every frame `φ` at the correct scale size

\[
s.x^{2+8\varepsilon}\le |\varphi|\le2s.x^{2+8\varepsilon},
\tag{4}
\]

with `φ.o=(Level.cyc ψ).o` and a raw host satisfying `KerChi ψ`, admits ranks `R` over exactly `φ` with
`RankVal s R` and `admitted R H₀`.

`SupplyChi.lean` supplies these two inputs as

```
hostOfField
admissibleClassesTwistedChar
```

and therefore proves `VWinAt ψ 401 →` (1).  No premise is synthesized by the wrapper itself.

## 2. From `VWinAt 401` to a `3/2` family of `WinDatum`

Fix `ψ` and `0<eps<1/52`.  `fieldChi ψ` first chooses integers `c,e₀`, with `1≤c`, and a constructor valid for
every `e≥e₀`.  Independently, `winPairs ψ eps c` consumes `VWinAt ψ 401` and `PairEx` and returns `J≥1` such that
for every starting point `y`, some `Z≥y` has this property:

\[
Z\le x\le Z^{3/2}
\Longrightarrow
\exists Y,q,d,e,\ \mathrm{WinDatum}(\psi,eps,J,c,x,Y,q,d,e).
\tag{5}
\]

This is the exact source of the `3/2` in (1).  It is a new outer interval assembled from the `VWinAt` data, not
the exponent in the original cohomological bound.

To see the difficult rescaling step, `winPairs` chooses `e(x')` from `PageN`, chooses the `VWinAt` scale `X`, its
prime pair `q,d`, and its interval base `W`, then sets

\[
k:=c^{1/(2+8\varepsilon)},\qquad x=kx'.
\]

Thus

\[
x^{2+8\varepsilon}=c(x')^{2+8\varepsilon},
\]

so the `PageN` inequalities become exactly the two frame-order fields of `WinDatum`:

\[
x^{2+8\varepsilon}\le c2^{e(x')}le2x^{2+8\varepsilon}.
\tag{6}
\]

The construction makes `k^400≤x'`.  Therefore

\[
x^{400}=k^{400}(x')^{400}\le(x')^{401}.
\tag{7}

`VVle.mono` uses (7), after taking floors, to restrict the original `VAt` cutoff
`⌊(x')^401⌋₊` to `⌊x^400⌋₊`.  It also enlarges the bound from
`√exp((x')^eps)` to `√exp(x^eps)`, valid because `x'≤x` and `eps>0`.  The resulting `WinDatum` contains

\[
\forall E,\ \mathrm{IsChiField}(\psi,e,q,d,E)
\Longrightarrow
\mathrm{VVle}(E,\lfloor x^{400}\rfloor_+,\sqrt{\exp(x^\varepsilon)}).
\tag{8}

This proves the first arrow of (2) and explains why the source needs both `401` and `400`.

## 3. Uniform thresholds and the character field

`supplyOfAdmOf` next chooses a single large `x₁` dominating five independent thresholds:

1. the host constructor's threshold;
2. the admissible-rank threshold;
3. the threshold for `R.t≤x^400`;
4. `A^J`, where `A^(eps/5)=K` and `K≥max(5,4ψ.N)`;
5. `c·2^e₀+1`.

The output window family is

\[
\{x\mid\exists Y,q,d,e,\ \mathrm{WinDatum}(\psi,eps,J,c,x,Y,q,d,e)\},
\]

with the `3/2` windows from (5).

Fix a scale `s` in that family and unpack a witness `Y,q,d,e`.  The lower bounds force

\[
Y^{eps/5}\ge K\ge4\psi.N.
\tag{9}
\]

`pairHyp` converts the `WinPair` field of `PairGood` into `HostHyp q d` and the Jacobi condition

\[
p\text{ prime},\ p\ne2,\ p\le Y^{eps/5}
\Longrightarrow \left(\frac{-d}{p}\right)=1.
\tag{10}

The proof also establishes `q≠3`: substituting `q=3` into the strict lower logarithmic bound in `WinPair`, while
`Y^(eps/5)≥5`, contradicts `log 3≤2`.

It proves `e≥e₀` by contradiction.  If `e<e₀`, then `2^e≤2^e₀`; but the lower order bound in (6), the fact
`s.x≤s.x^(2+8eps)`, and the global choice `c2^e₀<s.x` are incompatible.

Now `fieldChi` applies with (9), (10), the coprimality of `ψ.N` with `qd`, and `e≥e₀`.  It constructs a frame
`φ` and raw host `H₀` satisfying all of

\[
\begin{aligned}
&\varphi.e=e,\qquad |\varphi|=c2^e,\qquad H_0.q=q,\qquad H_0.d=d,\\
&\varphi.o=(\mathrm{Level.cyc}\ \psi).o,\\
&\mathrm{FieldRows}(H_0,\lfloor Y^{eps/5}\rfloor_+),\\
&H_0.QS\mid\operatorname{lcm}(2^{e+2},\psi.N),\qquad
H_0.QS\le4\psi.N|\varphi|,\\
&H_0.\mathrm{KeptInXp},\quad H_0.\mathrm{ExceptionalCharacterKept},\quad
\mathrm{KerChi}(\psi,H_0),\quad\mathrm{TwistForm}(\psi,H_0).
\end{aligned}
\tag{11}
\]

The admissible-rank hypothesis applies because (6) is exactly (4), giving `R`, an equality
`R.toFrame=φ`, `RankVal s R`, and `admitted R H₀`.  After transporting along the frame equality, the source derives
`H₀.QS≤C₀R.n` from the conductor bound in (11), the upper side of (6), the lower rank-size inequality, and the
chosen `C₀≥8ψ.N`.

## 4. What `hostOfFieldOf` contributes

The specialization `hostOfField` is

```
hostOfFieldOf shortNorm smallOne
```

so its proof still depends on the named short-norm and primes-in-progressions inputs in `Primes.lean`.  At the
source boundary recorded in `SA-S4`, it combines:

- `levelData`, producing the five auxiliary level primes `g₀,g₁,p,p',q₀` with congruence, norm, size, and
  disjointness conditions;
- `thinH`, `topsChoiceH`, and `pairRows`, producing the real-character, `TT`, and row bounds;
- `hof_thick`, producing the no-relation thick set `T` and its cardinality bounds;
- `hof_log_le_rpow` and `qdBig`, synchronizing the logarithmic and large-`q,d` thresholds;
- `admitted R H₀`, which materializes a `Host R` from the selected `Choices` once `FieldRows` and the lower
  `q,d` inequalities hold.

It then proves all fields of `HostGood`, including box, split, thick-set, logarithmic-derivative, thin-scale, prime
congruence, and `TT` sharing data.  This is why (1) cannot be replaced by “choose any number field having `ψ`”: the
host carries the precise analytic and Frobenius infrastructure used later by `EAtH`.

## 5. Constructing the two conjuncts of `GChi`

After `hostOfField` returns `H`, `q₀`, `HostGood`, and (3), two obligations remain.

### 5.1 `EAtH`

From `H.QS ∣ lcm(2^(e+2),ψ.N)`, every prime `l∣H.QS` divides `2ψ.N`: if `l` divides the power of two then
primality forces `l=2`; otherwise `l∣ψ.N`.  This exact elementary lemma is checked exhaustively by the companion
certificate.

`boundedTw` then consumes `TwistForm`, the conductor divisibility, that prime-divisor lemma, and
`PairGood ψ.N eps Y s.x H.q H.d`.  It supplies

- `H.BoundedCharsPointwise (Level.cyc ψ).KEPT s.x eps`;
- for every bounded primitive character, `‖logDerivativeAtOne χ‖≤4 log s.x`.

Together with the fields in (11), the sharing result (3), and `φ.o=(Level.cyc ψ).o`, these are exactly the six
components assembled by the source into

\[
\mathrm{EAtH}(\mathrm{Level.cyc}\ \psi,H,H.TT,s.x,eps,4).
\tag{12}
\]

### 5.2 `VVle` at the actual host rank

`isChiField` converts `KerChi ψ H` into

\[
\mathrm{IsChiField}(\psi,R.e,H.q,H.d,H.E).
\tag{13}

After rewriting `R.e=e`, `H.q=q`, and `H.d=d`, (8) applied to `H.E` and (13) gives

\[
\mathrm{VVle}(H.E,\lfloor s.x^{400}\rfloor_+,\sqrt{\exp(s.x^{eps})}).
\]

The eventual-rank theorem supplies

\[
R.t\le s.x^{400},
\]

hence `R.t≤⌊s.x^400⌋₊`.  A second application of `VVle.mono` restricts the cutoff to `R.t`.  Finally, the native
definitions `s.L=s.x^eps` and `s.b=exp(s.L)` identify the right-hand bound exactly:

\[
\sqrt{\exp(s.x^{eps})}=\sqrt{s.b}.
\tag{14}

Equations (12) and (14) are the two conjuncts in (1), completing the host supply.

## Downstream link and correction to the existing interpretation

`supplyChi ψ (hV ψ)` is the pointwise host premise passed to `zeroFreeAll_of_topG` in `TopPlug.lean`.  The previous
MATH checkpoint correctly separated exponents `401` and `3/2` but summarized the interior as an arithmetic-rank
and host translation.  The exact source shows an additional, essential intermediate exponent `400` and two
monotonicity steps:

\[
401\xrightarrow[\text{rescale in `winPairs`}]{x=kx'}400
\xrightarrow[\text{eventual rank bound}]{R.t\le x^{400}}R.t.
\]

The `EAtH` half does not follow from `VVle`; it separately uses `FieldChi`, `TwistForm`, `PairGood`, `boundedTw`, and
the full `HostGood` construction.  No premise has been discarded, no scalar-to-object identification is made, and
no URT speed advantage is claimed.

## Executed tests

- `python3 verify_supply_of_admissible_hosts.py --self-test`
- `python3 verify_supply_of_admissible_hosts.py --arithmetic-test`
- `python3 verify_supply_of_admissible_hosts.py --report 2026-11-24_supply_of_admissible_character_hosts.md`
- `python3 -m py_compile verify_supply_of_admissible_hosts.py`

The exact arithmetic regression exhausts `e=0,…,9`, `M=1,…,80`, every divisor
`Q∣lcm(2^(e+2),M)`, and every prime divisor of `Q`, checking that it divides `2M`.  It also runs a negative control
with the divisibility hypothesis removed.

The optional pinned-source mode is:

```
python3 verify_supply_of_admissible_hosts.py --source-root /path/to/riemann-hypothesis
```

It checks the fourteen blob identities and the exact declaration tokens.  This mode was not executed here because
the pinned source was available through the GitHub connector but no local upstream checkout was present.

## Failed attempts and limitations

- GitHub code search did not index `WinDatum` at the pinned revision; it was located by following the literal import
  from `WinPairs.lean` to `TwistForm.lean`.
- The earlier recursive-tree request was too large and closed its transport; discovery used pinned directory and
  file reads instead.
- No Lean executable or upstream checkout was available, so no `lake build`, `#print axioms`, or source-mode test
  was run.
- The finite arithmetic test checks a genuine lemma used in the source but does not simulate number fields,
  Galois cohomology, prime distribution, or Lean elaboration.
- This contribution preserves `PairEx`, `shortNorm`, `smallOne`, `admissibleClassesTwistedChar`, and the internal
  theorems used by `hostOfFieldOf` as named dependencies; it does not establish their truth independently.

## RESUME HERE

Trace the `winPairs` analytic input `QH.pairEx` backwards through the pair-prime construction.  Preserve the
quantifiers of `PairEx`, the dependence of `q,d` on `M,eps,A,Y`, all zero-box and character-sum bounds in
`PairGood`, and the source of the strict limit `eps<1/52`.  Explain how the special congruences
`q≡3 (mod 8)`, `d≡7 (mod 16)`, and `q∣d+1` are jointly produced; do not replace them by a generic “choose large
primes” statement.



---
## Appendix 48: specialists/character_boxes/RUN4_DIVISOR_ROW_THETA_FACTORIZATION.md
Peer Git blob: 73d1efedaa6df04b4e5d170e3440dda29e7c606c; evidence status retained.

# Run 4 — divisor-row compatibility and the exact theta factorisation

2026-11-24. RESULT: SOURCE-MATCHED conditional human reconstruction, with finite algebra regression. Follow the actual hDivG producer left by Run 3, and unpack its thTheta field to the orthogonal-projection argument. No Lean replay, full proof, or URT acceleration claim.

## Continuity and version lock

Read swarm protocols and handoff queue, AGENTS, research state, actual runner log/protocol, continuity, CI summary 45373263454 PASS (physical checks, not RH), character-box Runs 1–3, current integration, theta, Galois, prime-window, kernel, acceleration and math handoffs. The peer theta lane has the coefficient-line/Gram problem, not this coordinate factorisation. Prior rank equality and explicit projection right inverse are retained, not repeated. The shared blueprint is noted in the handoff queue; this run relies on the original source rather than its exposition. Blueprint PDF not independently reread here.

All source paths below refer to leanprover-community/riemann-hypothesis at 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream main now 2d0c622a3464ba41ad98fca9086bab54fb74e303 (commit time 2026-11-24 10:32:46 UTC); old AtHDivGOfMi path returned 404; OpenOrbitOfUnramifiedExponents blob cd72ff6e51662304cba84cfdf0b4881bcb5870a2; LiftCuspFormSpaceThetaMapEqData blob 6dcf961fb69628b653b5c24c718eb6ab5da619ab; TupUsed blob 75d0c9ab4b61ad880ede5f2030dde47a018bd8da. These are changed since pin. No equivalence across revisions established.

## 1. The actual arithmetic producer

OpenOrbitOfUnramifiedExponents.lean 43,54–55,69 obtains BkLaw for every WPt q from q.x.nx.2.1.2.down and applies bk_law_entries_alt with hB and hMi.1; the result is hDivG in the OpenParameterStatements record. Do not use the parallel earlier bk_law_entries for Bundle rather than BundleCondition.

AtHDivGOfMiStatement delegates to at_hDivG_main_alt. AtHDivGOfMi.lean 60–67 passes five real-group propositions to hDivG_linked_of_mIstar2: DiscreteSeriesCover, HarishChandraModules, CasselmanWallach, HarishChandraFinite, CuspRapidDecay. Its signature also requires WeilRepresentationUnitaryPair and DiscreteSeriesExists; these are unused in this particular forwarding body but are retained in the original statement. Fix hL:RecTExists, extension N, SExt S and GeoP Gamma, hence parameter p. Assume hB for every context K and WPt q and the linked MIstar2 row property hM. The result is a linked SlotDivisorCondition on the same parameter.

The mechanism of transfer (37–44) is important: take the same slot S and proof hS from hM; for each selected family and permissible x,hx,i, use the original built-bundle evidence (t x hx i).1. Built.ind recovers a concrete q,b', its BundleWitness w, and the equality he of dependent bundle triples; cast the predicate along he.symm. No new independent family or choice of a new bundle per condition. Local implication hDivG_of_mIstar2 (50–58) works in the real package from w.y.y, then transports by w.y.eq to b.

Specifically the local hypotheses are hC (five propositions above), TwIn x=w.x, intersection/base-change Holds x.R x.F (w.y.intersectionNumber_baseChange), BkLaw of the actual D and MIstar2 on the same realisation. The call pairing_definite_base_vanish_of_miStar2 uses Ok3 1, TypesSep3, WeakCharacterisation, PrimRows3, and the selected sEE and MIstar2. It produces BtVanish, not rationality. Separately divisionPairing_rational_on_rationalPoints' derives RationalMapValues D from hC, Pins and Holds; BkLaw maps that to D.BuRational. These are different necessary inputs to divisionRows_pairing_vanishes_of_rational_pairing_law (BkLawEntries.lean 40–46).

That theorem invokes the second conjunct of divisionCompatible_at_readIdentifications with x.mjH, ex.idx, the rationality just obtained, and BtVanish. Its DivRows3 output is converted via rowConditions_at_companion_from_readings and DivRows3.toG, then divRows3G_iff transports between the Formalism.L2.DIV and GlobalTheory.Cp records. None of these record adapters proves existence of Pins, Holds, MIstar2, BkLaw, or the real-group propositions.

## 2. Separate six obligations, not one unexplained geometric axiom

The actual theorem GlobalTheory.divTied3_read gives a DivDef3 record and a function producing DivRows3. Its dependent parameters are D:D7; finite group G; Pl0,I0,T; family A3; number field Ks with algebra structure over the indicated coefficient extension (Algebra Ks D.what₂.LL); real data R, face F, group comparison cG, base record X0, compatible readings Y,Z,C, sEE, divisor data Xd, JM; Pins R F, Holds R F, five real-group assumptions hC, and the conditional GrpTie from the two group-cardinality identities. The latter is consumed using pins_card_index_ranks. The second conjunct additionally takes MjHTie, IdxDefs, BuRational and BtVanish.

Its six fields (DivisionCompatibleAtReadIdentifications.lean 38–46):
1. sharpRR: the sharp-level Hermitian lattice compatibility from rowLattices_metrics_agree_of_realGroupTheorems.
2. baseRR: the corresponding base-level compatibility from that same theorem.
3. divisionRows_rationalLift: zero-space spanning from zeroSubspace_spanned_by_dataZeroSubspace_lifts.
4. thTheta: hthT, obtained **before** the four added arguments hMj,hIdx,hBu,hBt, by liftCuspFormSpace_thetaMap_eq_data.
5. num: the concrete number identities from numbers_eq_concreteNumbers_at_baseLevel (requires hMj,hIdx).
6. colsBk: rational pairing equals column pairing, consuming hBu,hBt.

This is a useful proof-graph refinement: rationality and base-tuple vanishing are necessary to the full DivRows3 constructor, but not used to establish hthT locally. We must retain them for colsBk and for the full downstream record. This does not prove the four other independent inputs or make MIstar2 dispensable globally.

## 3. Human proof of the theta-coordinate commutative diagram

Fix the same D,G,A3,Ks,R,F,cG,X0,Y,Z with Pins R F and Holds R F. For every i:Fin D.R.m, t:T, and every x in the coefficient-field coordinate space of dimension lDim(D,A3.A,F.P0,F.ψ0,i,t), set j=i+1. Write

    E = lZ0(...,i,t),   P = lPrj(...,i,t),   H = lH(...,i,t)
    A(x) = thetaP(Y.tup(t),j)(jMt(Y.tup(t),j)(Y.eMt(i,t,x)))
    C(x) = R.thG(i,t)(R.jV(i,t)(liftForm(...,i,t,x)))
    B(z) = Z.jW(i)((A3.indefDown(s0Of(R,F)).θ(i,t)) z)
    e = Y.mj.eW(i).

The desired statement is A(x)=B(Px), in the actual complex target space. The source distinguishes the coordinate field D.what₂.LL and the complex target; the jW and reading maps are embedded/semilinear as typed, not claimed to be complex-linear on the coefficient-field domain. The projection formula is valid over the field.

Proof (LiftCuspFormSpaceThetaMapEqData.lean 128–172):
* e is injective, by inj_of_norm_sq using RealDat.nP_pos and Y.mj.eW_norm (23–25); it identifies a read target with the concrete good-form space. T1 states eA(x)=C(x). T1 is not a definition or a general consequence of linearity.
* BlockDat.lf_l_proj obtains IsOrthProj H E P from the selected BlockHyp, built from hH.ok.ok2.conj, irr and lifts i t. Thus for every z, hform(H,Ez,x-EPx)=0 (hform_orth). Write r=x-EPx.
* T2, the theorem liftLevelForm_orthogonal_killed_by_thetaMap, gives C(r)=0. Since liftForm, R.jV and R.thG preserve subtraction, C(x)=C(EPx).
* For z=Px, liftMatrix_computes_lift_rational identifies the complex lift of the rational matrix output with theta applied to cr.toL(z), from hR.lifts0.1 and hR.ratTh. levelFormCoordinateMap_levelZero identifies cr.toL(z) with the level form of Ez. liftWeight_complexPoint_eq_twist identifies the same matrix output with the twist of goodForm. The phase is removed by the actual pin hP.phs i (phase equals one), not by assuming arbitrary phase conventions. Applying Tw.out to the identity gives C(Ez)=goodForm(z lifted by θ), which is eB(z) by eW_jW.
* Consequently eA(x)=C(x)=C(EPx)=eB(Px). Injectivity of e gives A(x)=B(Px).

The two cancellations have different justifications: orthogonal residual annihilation (T2) and target embedding injectivity. Neither follows from the prior right-inverse P E=I alone. The source produces a separate ThDef3 record (independence, spanning, OLatTie via li_span and lat_of); that record is retained as a distinct obligation, not silently absorbed into this equality.

## 4. What actually proves T1 and T2

T1 wrapper invokes thetaP_read. Its body uses used-tuple coverage from hP.char.tup.mu_used, transported by D.plEq.symm and the read maps. The theta adjoint is represented by a tensor map w with membership and lowest-K-type restriction from thetaAdjoint_at_lift_eq_lowestKType_restriction; the theta pin Y.tied.lift.theta connects this to the read target. Via Y.tupT_tup and Y.mtRead, the original input and its reconstructed lowest-type input agree under the injective extV. The difference of tensor maps is in the specified Wall multiplicity subspace and vanishes on every tuple of lowest K-types. LowTypeDetermined.eq_zero_of_lowT then gives equality; injectivity of tensor lift and of the target model finishes T1. This is a source-matched assembly, not a new proof of lowest-K-type determination.

T2 wrapper invokes thG_eq_zero_of_orth. It constructs the Core, eH laws, KFormL, JIsoL, RatZ and the unitary lift hypotheses from Pins, Holds, primitive links, and the family model. It identifies opV(idemOf X) with the twist of eH, which fixes range θ'. The input f0=liftForm(x) is fixed by the level idempotent. Hence goodAt applied to f0 agrees with idemOf X applied to it. For z in the intersection of the preimage of range adjoint θ' with range of the good projector, range_toF and goodR_eq write z as a level-zero coordinate vector. hJ transports the assumed hform(H,Ez,x)=0 to the Hilbert inner product, using the explicit csum_lvlForm identity. theta_eq_zero_of_orth then kills the concrete lift. Tw.out and hP.phs i remove the twist and phase. These are the native premises of T2; arbitrary orthogonality does not imply that an arbitrary map annihilates the residual.

## 5. Quantifier transfer into the rank step

ThThetaG has the exact shape forall i,t, Used0 D(P.I.tup t) -> forall x, A(x)=B(Px) (here P also denotes the selected RowSideFamily in the Lean names, not the matrix). ThTheta is the same statement without the Used0 guard. DivRows3.toG restricts to the guarded case, and DivRows3G.toRows recovers the unguarded form only using TupAllUsed, namely forall t, Used0 D(P.I.tup t). Its source is the actual indefinite realisation Q.charW.tup.mu_used and D.plEq transport (BaseRankEqOfRealisation.lean 29–36), as in Run 2. No extra induction over i or t is needed; a single universal coverage proof discharges the guard for every t. An arbitrary used subset is insufficient.

With the *same* selected bundle and maps from Run 3, the earlier rank proof may use A=B∘P and the separately established surjectivity P. Surjectivity of P is not derived from the commutative diagram and the diagram is not derived from surjectivity. Both are necessary for the composition step (plus Run 2's bijective row map and row-count conditions).

## 6. Source ledger

Prefix T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
Prefix A = src/Development/AbelianVarietyTheory/
Prefix I = A/Proofs/IwasawaDecomposition/
The following 17 connector-reported Git blob IDs were matched in a fresh fetch at the pin; 93 additional literal source anchors were checked (110 total). Anchors are source references rather than elaborated dependency edges.

- T/OpenOrbitOfUnramifiedExponents.lean 23e99cafd00e39835cfea1dba8431620b1bd9605: 43,54–55,69.
- T/AtHDivGOfMiStatement.lean c3166fc7fbc61cab9ee3aea4e97bc4d3f32669d4: 20–21.
- T/AtHDivGOfMi.lean 719d08273c86ce336f1b3a933cb42bf856e3186b: 30–67.
- A/Proofs/GlobalInterpolation/BkLawEntries.lean df437b3d83e05611f2fb1ff00e5043e76d0da17b: 40–46.
- I/RowConditionsAtCompanionFromReadings.lean 88e576fd7cf16e48a5b3b0388d346a1d3f0dbfd2: 14–17.
- I/DivisionCompatibleAtReadIdentifications.lean b6594122a28670a9dca1e61b23f5be9594f7f877: 22–46.
- I/DivisionCompatibleAtReadIdentificationsStatement.lean 177af5c6db7dba139da090fad705db744787566c: 14–15.
- I/LiftCuspFormSpaceThetaMapEqDataStatement.lean 1e4844972e2f5c0238dd34dcaa58bfa9f5dc4560: 9–10.
- I/LiftCuspFormSpaceThetaMapEqData.lean a20be49929e4ff6bd3d51e37e7906f937cafd2ac: 19–25,128–172.
- I/ThetaMapHilbertModelEqConcreteThetaMapFamilyThreStatement.lean 4a0d74d7c7e61dceb29556772123b2653a6706d8: 10.
- I/ThetaMapHilbertModelEqConcreteThetaMapFamilyThre.lean 7be4c6062b527ff56103791bf0ba20ff950bd8c0: 39–86.
- I/LiftLevelFormOrthogonalKilledByThetaMapStatement.lean f0dd303e6d8a6e4e290e8567f7cf38ddfbf2ba7c: 10.
- I/LiftLevelFormOrthogonalKilledByThetaMap.lean 509b52666c58017793f0ea974a7c7afe5b6ce808: 76–151.
- I/LiftMatrixComputesLiftRational.lean 69fe4305219cbaef466a84cab165940b380fd2b4: 173–175,290–303.
- src/Formalism/LocalToGlobal/Divisibility/TupUsed.lean 478364841e4931ae1cf32aa2dd7e2d95253e2336: 56–66,80,135–142.
- A/Definitions/GlobalTwisting/DivRows3GIff.lean 166a6de2b326fbebc98327ba49fa5eeed790cdc4: 123–125.
- T/BaseRankEqOfRealisation.lean 73832da09224c40d0aed60316629b1b80d6c55d1: 29–36.

Additional manually read inputs: A/Proofs/DivisorProofs/PairingDefiniteBaseVanishOfMiStar2.lean e0489b746f830aebe4b416e30f2a1bfe8862567c; I/DivisionPairingRationalOnRationalPoints.lean b738c81753e971b9d37c226eecdc46233dea0eca; its Statement wrapper 722b04b5fcb46eeb1b1e87e638686a1f561ada7a; T/MainTheoremPublishedInputsThird.lean d832bbf654cf584acc935f3af621f96ec60c5953. Source replay: git show PIN:path and git hash-object --stdin, verify all listed hashes and cited ranges. Source anchors checked include Built.ind, cast this.symm, w.y.eq, hB(divisionPairing_rational_on_rationalPoints'), thTheta := hthT, BlockDat.lf_l_proj, T1, T2, hform_orth, liftMatrix_computes_lift_rational, levelFormCoordinateMap_levelZero, liftWeight_complexPoint_eq_twist, hP.phs, Tw.out, eW_injective, LowTypeDetermined.eq_zero_of_lowT, theta_eq_zero_of_orth, and thTheta_of_G hU h.thTheta.

## 7. Executed exact finite regression

This is a finite algebra test, not a substitute for the actual number-field or theta objects. Test projection onto a nonzero vector E in Q^3 with positive diagonal H and P=E^t H/(E^t H E), clearing denominators. The factorising map uses a fixed two-component output (2,-3). Negative controls: a nonzero orthogonal residual can survive an unrelated coordinate map; a noninjective target comparison can hide inequality; a proper used-tuple subset permits false unguarded conclusions. Actual V8 test (replay in Node):

```js
const dot=(a,b)=>a.reduce((s,v,i)=>s+v*b[i],0);
const vectors=[];for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let c=-2;c<=2;c++)vectors.push([a,b,c]);
let cases=0,orth=0,factors=0,negativeAnnihilation=0,negativeNoninjective=0,guards=0,guardNeg=0;
for(const E of vectors){if(E.every(v=>!v))continue;
 for(let h1=1;h1<=3;h1++)for(let h2=1;h2<=3;h2++)for(let h3=1;h3<=3;h3++){
  const w=E.map((v,i)=>v*[h1,h2,h3][i]),d=dot(w,E);if(d<=0)throw Error("positive");
  for(const x of vectors){const num=dot(w,x),r=x.map((v,i)=>d*v-E[i]*num);
   if(dot(w,r)!==0)throw Error("orthogonality");orth++;
   const a=[2*num,-3*num],b=[2*dot(w,E)*num,-3*dot(w,E)*num];
   if(a.some((v,i)=>v*d!==b[i])||dot(w,r)!==0)throw Error("factorization");factors++;cases++;
   if(r.some(v=>v!==0))negativeAnnihilation++;
  }
 }
}
for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let c=-2;c<=2;c++){if(b!==c){const u=[a,b],v=[a,c];if(u[0]!==v[0]||u[1]===v[1])throw Error("negative");negativeNoninjective++;}}
for(let n=1;n<=8;n++)for(let mask=0;mask<(1<<n);mask++)for(let truth=0;truth<(1<<n);truth++){
 if((mask&truth)!==mask)continue;guards++;const all=(1<<n)-1;if(mask===all&&truth!==all)throw Error("guard");if(mask!==all&&truth!==all)guardNeg++;
}
console.log({cases,orth,factors,negativeAnnihilation,negativeNoninjective,guards,guardNeg});
```
Observed cases=418500, orth=418500, factors=418500, negativeAnnihilation=405648 (nonzero residual witnesses), negativeNoninjective=100, guards=9840, guardNeg=9330. No failures. No original hypotheses removed. Source anchor checks are static, not an independent elaboration. No full-proof denominator or URT speed claim; no physics files changed.

RESUME HERE: follow GlobalTheory.T.zeroSubspace_spanned_by_dataZeroSubspace_lifts from divTied3_read (line 43) into ZeroSubspaceSpannedByDataZeroSubspaceLiftsStatement and its actual implementation; prove why the same rational level-zero coordinate image spans the complex Z0, distinguishing a span equality from pointwise surjectivity over the number field. Preserve tuple guard and Pins/Holds hypotheses. Coordinate lowest-K-type and unitary theta leaves with theta lane; do not repeat the factorisation, projection right inverse, or rank equality. The other five record fields remain explicit dependencies at their respective source proofs.
HANDOFF TO: integration, proof editor, formal audit, theta, Galois and math. Mark the hthT local argument source-matched conditional, and preserve every remaining field of DivRows3 and the upstream MIstar2/BkLaw/real-group inputs.


---
## Appendix 49: specialists/galois_representations/RUN4_RANK_ONE_WD_NORMALIZATION.md
Peer Git blob: 47a35f7ac5dfd0f4064c83bf3920cd745801a31f; evidence status retained.

# Run 4 — rank-one Weil–Deligne normalization and disappearance of the correction character

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the actual local correction-character argument, global exponent cancellation and rank-one crystalline assembly. Conditional on identified upstream producers; no Lean kernel replay, full proof, or URT speed claim.

## Continuity and pin

Read swarm protocol, handoff queue, expansion, AGENTS, actual runner research log/protocol, state and continuity; recent peer checkpoints including Grok galois_rows RUN6 and trust table, theta, literature, character boxes, integration, editor, prime, Landau, kernel, structure, dependency, acceleration and positivity lanes. Physical CI 45369968953 PASS at 10:17Z unrelated to RH. External blueprint is referenced in the queue; its PDF was not reread in this run, and no result here is inferred from it. This expands the specific Crys.alg/hk producers left open by RUN3; Grok's trust table and downstream gal field trace are complementary, not duplicated.

All mathematical statements below use leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed fb990c7fb2d7e01039a22116b38c31457e56a796 (commit 10:21:15Z); same two principal paths remain, but AlgebraicCharacterWD and ContinuousRankOneRep blobs are now 2772fb810c95432228e35878b46f7ff11d550886 and fb0bdf5416986c8a291ace6ba2fadc618722623a respectively, with principal theorem identifiers still present. No full cross-revision equivalence established. Continue on pin.

## 1. Exact scope and notation

Fix a number field F, algebraic closure Ω, prime l, place w, valuation subring A above w, h:IsPlaceOver A w, the given local bridge Bw over the decomposition group and its Induces proof hj, and ring equivalence ι:Qbar_l ≃ C. For local Artin homomorphism a:W_h→K^× (K=F_w) assume IsLocalArtin h a. Let κ:D_A→Qbar_l^× be continuous, and let m:Emb(l,w)→Z with IsLocAlg h κ m. The finite embedding set consists of continuous embeddings; write A_m(x)=product_τ τ(x)^{m(τ)} for x a unit of K (K^×). This is multiplicative in x and additive-to-multiplicative in m. Let j:W_h→D_A be inclusion. WDis(P,κ,ξ) means IsPstAt(P,Bw,rk1 κ) AND existence of smoothness evidence for the character parameter identity wdAt(P,ι,Bw,h,hj,rk1 κ)=WD.lpOfChar(h,ι_*ξ). This is a WD class, not a matrix equality in a fixed basis.

The native LocWD conclusion gives ξ with WDis at canonical Loc.PP l and ξ(σ)=κ(jσ) A_m(aσ). It is not a claim that a continuous local character is automatically locally algebraic.

## 2. The actual proof of the correction character being trivial

Source ContinuousRankOneRep.lean. For fixed data above, define Df(m,d) to mean: for EVERY continuous κ locally algebraic with weights m, WDis(PP,κ,(κ∘j)(A_m∘a)d). Here d is a Weil character, not a scalar chosen separately for every σ.

(a) Existence of locally algebraic witnesses of every integral weight (exw, lines 97–102) is obtained from Loc.laGlob using global reciprocity and its Hecke-character construction. Potential semistability pst uses local algebraicity -> de Rham through Loc.laDeRham, then the de Rham-to-potentially-semistable theorem, with continuity of the rank-one matrix. Keep these inputs.

(b) df_zero (105–120): a weight-zero κ has smooth restriction to the Weil group: the open kernel in IsLocAlg provides the required open subgroup. The potentially unramified WD comparison Loc.wdPotUnr and rank-one dimension identify the parameter with κ∘j; thus Df(0,1). This uses more than mere continuity.

(c) df_of (123–138): suppose one continuous locally algebraic ν of weight m realizes the formula with d. For any other κ of the same weight, ψ=κν^{-1} is continuous of weight zero (Loc.laMul). Apply df_zero to ψ and use multiplicativity in ChBasic to multiply its WD character by ν's; κ=ψν. Thus the SAME d works for all κ. df_uniq (141–144) applies both proposed d to a witness ν from exw and uses uniqueness in ChBasic, then cancels the shared invertible character. df_ex (147–164) chooses d_m using the unique WD character of a witness, and proves d_(m+m')=d_m d_m' by the same uniqueness applied to νν'. Therefore δ:m↦d_m is a group homomorphism into the multiplicative character group (written Additive in Lean). hom_sum (166–170) expresses d_m(σ)=product_τ d_eτ(σ)^{m(τ)}, with eτ the coordinate unit vector.

(d) df_coef (172–195): if coefficient automorphism s sends embedding τ to τ', coefficient equivariance ChCoef and uniqueness imply d_eτ'(σ)=s(d_eτ(σ)). The source applies s to a locally algebraic witness of weight eτ, obtains weight eτ' with preserved continuity/open kernel, and cancels the nonzero common prefactors. This is the actual Galois descent relation on the values, not an assertion that all embeddings have identical weights.

(e) df_cyc (198–216): use the cyclotomic character, locally algebraic of constant weight -1 by Loc.laCyc. ChBasic says its WD value is q^{deg σ}, q=normV w. Loc.epsArt identifies the character value with q^{deg σ} A_1(aσ). The formula for d_-1 therefore gives q^{deg σ} = q^{deg σ} A_1(aσ) A_-1(aσ) d_-1(σ). Since A_1 A_-1=1 and q^{deg σ}≠0, d_-1=1; additivity gives d_1=1. This fixes the sign and the Frobenius normalization.

(f) df_unit (219–241): fix σ. If the embedding set is empty, the weight group is trivial and choose s=1. Otherwise EmbOrbit applies to the equivariant family d_eτ(σ), producing u∈K with τ(u)=d_eτ(σ) for every τ. At least one τ exists, all character values are nonzero, so u≠0. Surjectivity of a provides s with a(s)=u. Then d_m(σ)=A_m(a(s)) for ALL m by the basis decomposition. In particular A_1(u)=1 from (e). The ord_zero lemma (47–69) proves ord(u)=0: if valuation v(u)<1, continuity of each embedding implies |τ(u)|<1; the nonempty product has norm <1, contradiction. Applying the same to u^{-1} rules out v(u)>1. Using Artin ord_eq yields deg s=0. This does not yet imply u=1 or d_m=1.

(g) df_res (244–285): take a finite number-field extension F'/F inside Ω with place w' over w and matching Weil elements σ,σ' acting identically on Ω. ChRes supplies a compatible local bridge and character restriction. ArtNorm gives the embedding restriction res and norm homomorphism N, with τ(Ny)=product over τ' restricting to τ of τ'(y); matching Weil actions yield a(σ)=N(a'(σ')). The exact algebraic identity A_m(Ny)=A_(m∘res)(y) follows by regrouping the finite product by fibres. Restrict a locally algebraic witness ν, retaining continuity and local algebraicity of the pulled-back weight (open inertia kernel pulls back). ChBasic uniqueness identifies the restricted WD character with the extension correction formula. Cancel equal ν and norm-power factors. Applying df_unit at F' gives s' of degree zero and its restricted s at F such that d_m(σ)=A_m(a(s)) and s,s' agree as actions. Neither the extension nor s is asserted independent of σ.

(h) df_one (288–298): fix σ with deg σ=-1. Suppose d_m(σ)≠1. The set V={x∈K^×: A_m(x)≠d_m(σ)} is open by continuity and is a neighborhood of 1. ExField gives an extension F'/F and matching σ' such that EVERY pair of matching s,s' with deg s'=0 has a(s)∈V. But (g) produces exactly such a pair with A_m(a(s))=d_m(σ), a contradiction. Thus d_m(σ)=1 for every degree -1 element. Apply this to inverse Frobenius to obtain d_m(frob)=1. For any σ of integer degree k, frob^{-k-1}σ has degree -1, so multiplicativity gives d_m(σ)=1. No density assertion or limit argument is needed at this last step. The substantive neighborhood-separating input ExField must be proved, not silently assumed.

core (300–306) now uses df_ex and df_one to give LocWD. Public locWD (311–313) supplies chBasic, chCoef, embOrbit, chRes, artNorm hG and exField hG; it takes GlobalArtinReciprocity, HeckeLAdicCharacterDeRham and DeRhamPotSemistable. Their actual deeper proofs remain distinct obligations.

## 3. Global Hecke normalization and jump sign

Use E for the number field and the full common hypotheses of Published.AlgebraicCharacterWD: Ω, l prime, P, AI, Nonempty LocTied, ι, global art with IsGlobalArtin, Hecke χ, integral weight n indexed by embeddings E→C, continuous μ:G(E,Ω)→Qbar_l^×, IsAlgPos χ n and IsLAdicOf art ι χ n μ; all place/local bridge/induced-place data above, a with IsLocalArtin, local component ξ with IsComp χ w ξ.

LaHecke.lean proves local algebraicity of κ=μ restricted to D_A with weight m(τ)=-n(ι∘τ∘incl). It uses injectivity of the global-Artin local-idele map, smoothness of χ.loc w, local Artin continuity and an explicit inverse character on inertia with open kernel. Local-global Artin compatibility equates the chosen local values; IsLAdicOf.loc supplies the precise power factor, and the smooth local character factor is cancelled using its nonzero unit value.

LocWD yields η(σ)=μ(σ) A_-N(aσ), N(τ)=n(ι∘τ∘incl). IsLAdicOf.loc gives μ(σ)=ι^{-1}(χ.loc w(aσ)) A_N(aσ). Hence η(σ)=ι^{-1}(χ.loc w(aσ)), since every factor τ(aσ) is nonzero and integer exponents N and -N sum to zero. HeckeComp.main gives uniqueness of local components, so ξ=χ.loc w. ChIndep transfers the same η from canonical PP to the given P using Nonempty LocTied l P AI, preserving potential semistability and WD equality; it is not an arbitrary period-ring change without a tie. The actual proof constructs period-ring equivalences preserving Galois, Frobenius and unramified coefficient action, rescales monodromy by a nonzero scalar, transports Dpst and the WD spaces, then uses WD.sound and iso_of_equiv_smul; preserve these requirements (ChIndep.lean:95,131,187,239,249–254). Consequently wdAt of rk1 μ restricted to D_A equals WD.lpOfChar(h,ξ∘a). This is precisely Crys.alg. No extra absolute-value twist can be inserted.

Published.HeckeLAdicCharacterDeRham gives de Rham AND, for every global embedding τ:E→Qbar_l and finite coefficient extension LL' and local embedding τ' induced through Bw, the jump multiset is {-n(ι∘τ)}. Do not replace this by positive weights or assert the jump statement for an unrelated local embedding. The producer is HeckeDeRham.lean:3 -> HLdR.field_outright -> Hladr2.field_of_leaves with tilt_period and lubin_tate_period_not_filtered, not a new axiom inferred from the Published namespace. The deeper proof of field_of_leaves and its period suppliers is not reconstructed here.

## 4. Crystalline versus potentially crystalline — a separate rank-one argument

For a potentially semistable representation, the model theorem isCrys_iff says crystalline iff monD=0 AND inertia acts trivially. isPotCrys_iff says existence of a finite extension making it crystalline iff monD=0. wdN_eq_zero_iff transfers zero monodromy between the WD and period spaces; the nontrivial direction uses faithful detection by wdMk along all Frobenius iterates, not assumed injectivity of wdMk. unr_wdPst_iff matches inertia via exists_ine_of_fix and ine_mem_fix; acts trivial via actD_eq_one_of_wdMk. unr_wdAt_iff and wdParameterAt_monodromy_zero_iff_potCrystalline then unpack an actual potentially semistable finite coefficient model and transfer both results. BOTH require IsPstAt; no assertion about the fallback WD for a non-potentially-semistable input.

In Crys.crys, de Rham and continuous μ give potential semistability, then the WD unramified criterion plus algebraic-character identity identifies crystalline with unramified ξ∘a, then with χ.UnrAt w using the explicit local character comparison and CharCrysModel.isUnram_iff. The theorem uses χ.UnrAt w only in this branch.

Separately, a de Rham rank-one μ is potentially crystalline without an unramified-χ assumption: de Rham -> potentially semistable model -> WD space has dimension one. Nilpotent endomorphism N on a one-dimensional vector space over a field is zero: choose nonzero v spanning the space, Nv=cv, so N^k v=c^k v=0 for a positive nilpotence exponent; since v≠0 and the field has no nonzero nilpotents, c=0 and N=0. The native PotCrysRankOne theorem uses wdN_eq_zero_iff and isPotCrys_iff to obtain the finite extension. Finally heckeLAdicCharacterAbove_of_potSemistable constructs four exact fields: de Rham; potentially crystalline; crystalline IF χ is unramified; all induced embedding jump identities. This is Crys.hk, and supplies RUN3's CoreAll Inp.hk alongside Inp.alg and Inp.pst. The downstream CoreAll/Row0b and nonvanishing chain is unchanged.

Negative control: N=0 alone is insufficient for crystalline if inertia is nontrivial. A nontrivial finite ramified character is the standard rank-one case illustrating why the distinction is necessary; not a counterexample to the source criterion.

## 5. Reproducible evidence and scope

Pinned source inventory (abbreviations A=src/Development/AutomorphicArithmetic/, B=src/Development/AbelianVarietyTheory/, T=A/ThetaCorrespondence/AlgebraicCharacters/; slashes after A/B understood):
- T/ContinuousRankOneRep.lean 028d93377a68710f3e21da03eff798ff7fd103af, 105–313, df_zero/of/uniq/ex/coef/cyc/unit/res/one.
- T/EmbOrbit.lean f7b21c5d5a970b595c05d7b2226e9c2854b6622b, 21–98, WDis/ChBasic/ChRes/ChCoef/ChIndep/ArtNorm/ExField/EmbOrbit/LocWD.
- T/AlgebraicCharacterWD.lean a5148c5bad5cf0c977c250037793579bf3e9be24, 9–33, algebraicCharacterWD.
- A/AutomorphicVarieties/PadicHodgeTheory/LaHecke.lean 4ff54dc851a74068157e097a4a571fd0e5c25e28, 12–29.
- T/ChIndep.lean 123767a050d7d27b88ce75b4d9d2c0d0c4761de4, 95–254.
- B/Proofs/IwasawaDecomposition/WdParameterMonodromyZeroIffPotentiallyCrystallin.lean 6c68db6192193b8e5f5a94a31758fdddd2895555, 238–357.
- B/Proofs/InertiaEigenvalues/EqZeroOfIsNilpotentOfFinrankEqOne.lean 1f5b8626090ec554c2445efd93edfa6bffe6febf, 16–53.
- B/Proofs/InertiaEigenvalues/HeckeLAdicCharacterAboveOfPublished.lean f016f80710d5ec9a2135aff6ef97b9f2b7a7dacf, 14–22.
- B/PublishedTheorems/GaloisCohomology₂/HeckeLAdicCharacterAboveIff.lean 1f38314b25435f6467afbfe9d36ecefec14937b3, 13–29.
- B/PublishedTheorems/GaloisCohomology₂/HeckeLAdicCharacterDeRham.lean 6068fcd2be1b99412b09164307edd98329e9bdc3, 11–22.
- B/PublishedTheorems/GaloisCohomology₂/HeckeLAdicCharacterCrystalline.lean 642ca34de962ee10b731fbcea8fbe133f9175323, 11–20.
- B/PublishedTheorems/GaloisGeometry₂/AlgebraicCharacterWD.lean 49a010a94e57d7598d65177d747524e701e35611, 14–23.
- A/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/Crys.lean 8f176341db3f423d5ea0f163c814084f7f596a1d, 32–62.
- A/ThetaCorrespondence/GaloisRepresentations/HeckeDeRham.lean 9ad3fc6146b94549bc004cb88b6133220949f268, 3.
- src/Development/WeilBound/CoreStatements/PublishedTheorems/HeckeLAdicCharacters/Outright.lean f5aae4dbfa02d46165a820744628f0464eb87824, 7–8.

Actual execution: 70/70 source anchors in these 15 pinned files matched via GitHub connector; blob IDs recorded, not independently rehashed. V8 finite arithmetic regressions below actually ran: normalization 70,956; norm-fibre regrouping 323,400; integer degree shift 2,001; scalar nilpotence 1,440. Wrong sign fails 56,320/70,956 normalization cases. All asserted positive checks passed. These are elementary finite algebra checks only, not tests of actual local fields or period rings. Reproduce source reading by git checkout PIN, git hash-object paths above, inspect referenced ranges. Reproduce arithmetic with this JavaScript (same loops as actual run):
```js
const primes=[5,7,11,13,17,19];
const c={normalization:0,fibre:0,degree:0,monodromy:0,signNegative:0};
function check(x){if(!x)throw Error("failed")}
function pow(a,n,p){let r=1;n=((n%(p-1))+(p-1))%(p-1);for(let i=0;i<n;i++)r=r*a%p;return r}
for(const p of primes)for(let x=1;x<p;x++)for(let y=1;y<p;y++)for(let a=-4;a<=4;a++)for(let b=-4;b<=4;b++){
 let u=pow(x,a,p)*pow(y,b,p)%p,v=pow(x,-a,p)*pow(y,-b,p)%p;
 check(u*v%p===1);c.normalization++;if(u*u%p!==1)c.signNegative++;
}
for(const p of primes)for(let x=1;x<p;x++)for(let y=1;y<p;y++)for(let z=1;z<p;z++)for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++){
 check(pow(x*y%p,a,p)*pow(z,b,p)%p===pow(x,a,p)*pow(y,a,p)%p*pow(z,b,p)%p);c.fibre++;
}
for(let d=-1000;d<=1000;d++){check((-d-1)+d===-1);c.degree++}
for(const p of primes)for(let v=0;v<p;v++)for(let k=1;k<=20;k++){
 let r=1;for(let i=0;i<k;i++)r=r*v%p;check((r===0)===(v===0));c.monodromy++;
}
check(JSON.stringify(c)===JSON.stringify({normalization:70956,fibre:323400,degree:2001,monodromy:1440,signNegative:56320}));
console.log(c);
```

RESUME HERE: reconstruct the exact ExField producer in ThetaCorrespondence/AlgebraicCharacters/ExField.lean, especially construction of an extension retaining a specified degree -1 Weil action while making the restricted degree-zero Artin images lie in the prescribed neighborhood; trace ArtNorm if needed. This is the deepest distinct arithmetic premise in df_one, not a repeat of weight cancellation or the Grok gal field trace. Coordinate patching priorities with Grok and literature lane. Do not claim the external blueprint's coverage or independent Lean kernel verification.
HANDOFF TO: integration, editor, audit, Grok galois_rows, theta, literature, character boxes. No physical gate/queue changes.

---
## Appendix 50: specialists/landau_criterion/RUN4_LINEAR_NEAREST_POLE_AND_CAUCHY_AUDIT.md
Peer Git blob: 749073ec88279e0dbd484e0b0c3880f8f56e9bfb; evidence status retained.

# RUN4 — quantitative nearest-pole audit and linear witness construction

2026-11-24. RESULT: DONE for the independent human derivation of the finite nearest-pole selection and its Cauchy join; exact finite synthetic regression executed. SOURCE-MATCHED for the original mathematical obligations; alternative construction is human-proved, not Lean-replayed. Full RH, full kernel graph and URT speedup remain OPEN. No physics queue changes.

## Continuity and provenance
Read SWARM_PROTOCOL, HANDOFF_QUEUE (including the blueprint synopsis and correction), EXPANSION_15_LANES, AGENTS, research state/log/protocol, continuity and state branch summary; inspected RUN1–3, peer prime RUN4, math analytic chapter, editor 0956, kernel/acceleration RUN4 and Grok Landau–Page claim. The external blueprint PDF itself was not re-opened in this run; its source claims are not premises. This is the independent quantitative audit assigned by RUN3, not a retranslation of the Landau–Page real-zero theorem or the arithmetic window producer.

Pin: leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/, eight source files inspected at this pin:
- LandauFinite.lean 46a0dc63f21009582a2dda61c1267e9aad88bde5 lines 9–26.
- LandauDichotomy.lean 947dae363ce629febcba27b1b70355438f8639a0 lines 10–87.
- LandauNearest.lean 6a177498987e1ef453727131bf2004bc797a01a2 lines 10–109.
- LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b lines 9–33.
- LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7 lines 10–79.
- landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a lines 20–166.
- LandauGrowthContra.lean bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda lines 9–40.
- LandauPoleReLe.lean 205c7380b79e78b2752ed67aeb069f2a9d12cc77 lines 9–53.

Upstream main observed 73958da58a8a4d1f61b789745c5444baf6247cae, 2026-11-24T09:50:10Z, merge about CI guidance. At that revision old LandauNearest, LandauDichotomy, LandauPoleAsym paths return 404; LandauCauchy blob e4aa7a9a470043a1fcf7d63c3e32a92ae2934bdc and landauWindow blob 78d2ec6cc11c6e05db6c5a6b3e62a76ab43b97cc differ from pin. No migration or semantic equivalence claimed.

## 1. Audit and precise replacement lemma

The original nearest-pole proof is valid at the level of the inspected argument: it defines a finite forbidden set B as the image of F x F under the perpendicular-bisector formula, then chooses a height outside B. The division-by-zero pairs are totalized in Lean; they do not invalidate the finite-set argument. No pair enumeration is actually executed by this nonconstructive Lean proof.

We can remove the all-pairs construction from the human proof and give a concrete finite witness using two linear scans after filtering. Let Z be locally discrete at EVERY point in Re>0 (the source's punctured-neighborhood assumption, not merely discreteness at its own points). Suppose Re(p)<sigma for all p in Z, D<sigma, and there is w=x0+i t0 in Z with 0<sigma-x0<D. Take epsilon=min(D-(sigma-x0),sigma-D)/2>0 and c0=sigma+i t0. Then F=Z intersect closedBall(c0,D+epsilon) is finite by LandauFinite: the closed ball lies in Re>0 and each of its points has a neighborhood meeting Z in at most that point; a finite subcover implies finiteness. w belongs to F. Define q(p)=(sigma-Re p)^2+(t0-Im p)^2.

Select p* minimizing q on F, breaking ties by MAXIMUM imaginary part. This selects a unique point: equal q and equal height give equal positive horizontal gaps, hence identical points. Write y*=Im p*. For each p with Im p>y*, q(p)-q(p*) is strictly positive by the tie rule. Define
  h=min( {epsilon/2} union { [q(p)-q(p*)]/[4(Im p-y*)] : p in F, Im p>y* } ).
The minimum is over a nonempty finite set of positive numbers, hence h>0 and h<=epsilon/2. Set z=sigma+i(t0+h).

The squared-distance difference at the new center is EXACTLY
  |z-p|^2-|z-p*|^2 = q(p)-q(p*)+2h(y*-Im p).
For p != p*:
- Im p>y*: the choice of h leaves at least half the strictly positive old gap.
- Im p<y*: old gap is nonnegative and the perturbation adds a strictly positive term.
- Im p=y*: old gap is strictly positive by uniqueness at equal height.

Thus p* is the unique nearest point in F. Moreover |z-w|<=sigma-x0+h<D, hence d=|z-p*|<D and d>0 because Re(p*)<sigma. Define r=min({D} union {|z-p|: p in F minus {p*}}). Then d<r<=D, and any point of Z in ball(z,r) belongs to F by triangle inequality: |p-c0|<=|p-z|+h<D+epsilon. So p* is the only pole in that open ball. This establishes exactly the conclusion of Deduction.landau_nearest without pairwise bisectors. No extra premise, no weakened conclusion. The proof applies to arbitrary real coordinates; computation below uses exact rational/integer fixtures only.

Complexity: given the finite F as input, choose the lexicographic minimum, compute h, then select isolation radius in O(|F|) arithmetic operations and O(1) auxiliary scalar state beyond F. Constructing F, enumerating actual zeros, exact real comparisons and bit complexity are not bounded by this claim. The original proof uses an image of F x F, not a runtime algorithm: the avoided quadratic candidate count is a structural comparison, not an observed Lean or translation runtime improvement. No URT-specific advantage is asserted.

## 2. Cauchy join checked independently
With the unique pole p* and residue c!=0, define H(s)=Phi(s)-c/(s-p*) off p*, and H(p*)=h_local(p*) from the analytic remainder. The eventual equality on the punctured neighborhood gives actual equality of germs after defining this value. It makes H holomorphic on the whole open ball; away from p* both terms are holomorphic. No evaluation of Phi at the pole is used. Choose a=(d+r)/2, strictly between d and r. The circle of radius a is compactly inside the domain. Cauchy's coefficient formula gives |H^(k)(z)/k!| <= M/a^k where M=(1/(2pi))*integral_0^{2pi}|H(z+a exp(it))|dt, independent of k. This is the source's actual mean-norm constant, not an assumed maximum or growth bound on a punctured circle. From differentiating the principal part, A_k(z)=(-1)^k Phi^(k)(z)/k! differs from c/(z-p*)^(k+1) by at most M/a^k. The factorial is nonzero, (-1)^(2k)=1, and the inverse derivative is evaluated away from the pole. These are LandauPoleAsym lines 19–79.

For case A, the dichotomy supplies a pole-free real-center ball radius D, with a<r<=D<=sigma-theta<sigma. A second Cauchy estimate at sigma gives |A_k(sigma)|<=M'/a^k, and reverse triangle inequality plus Re A_k(sigma)>=-|A_k(sigma)| gives
  |A_k(z)|+Re A_k(sigma) >= (|c|/d)/d^k -(M+M')/a^k.
For case B, the original dichotomy excludes all poles with horizontal gap less than D; the minimizer of distance D then has Im=0 and Re=sigma-D. It is unique at distance D; the original witness with Re>theta implies D<sigma-theta. Finite separation provides r>D, r<=sigma-theta. At beta the residue condition in PoleData.pole provides Re c>0 (and Im c=0); only Re c>0 is needed. The same Cauchy estimate yields Re A_k(sigma) >= (Re c/d)/d^k-M/a^k, with d=sigma-beta>0. Add nonnegative |A_k(sigma)|; do NOT require the signed real coefficient to be nonnegative by assumption.

In both cases the constants are chosen before eta,U,k. The upper window bound is uniform in vertical height, with theta in (0,1), delta>0, sigma>2; none of these premises are removed. Compare c*/d^k <= M*/a^k+C exp(eta U)/E^k with E=sigma-theta>=a>d. Take C*=|M*|+|C|, L=log(a/d)>0, eta=L/2, U0=max(0,2C*/(c*L)). Because U>=U0 and k>=U, C*<c*exp(eta U) and exp(2eta U)<=exp(kL). Contradiction. Covers the real exceptional zero branch by positivity, not by assuming absence of such zeros. No converse is claimed. No arithmetic window existence inferred.

## 3. Exact finite executable certificate

All fixtures are synthetic finite point sets, not RH zeros or Cathedral operators. BigInt comparisons of squared distances and rational shift endpoints avoid floating error. Copy the following into a JS file and run with Node. The certificate was actually executed in the JS tool runtime, not Node or Lean. It exhausts subsets of ten points and eligible witnesses, checks global isolation against every listed point, includes a negative control for a fixed half-epsilon shift, and compares structural candidate counts for four larger families.

```js
function certificate(){
 const min=(a,b)=>a<b?a:b;
 const sq=x=>x*x;
 const fracMin=(a,b)=>a[0]*b[1]<=b[0]*a[1]?a:b;
 const check=(x,msg)=>{if(!x)throw Error(msg)};
 function choose(s,D,w,P){
   const [x0,t0]=w;
   const gap=s-x0, en=min(D-gap,s-D);
   check(en>0n&&gap>0n,"witness/radius");
   check(P.some(p=>p[0]===x0&&p[1]===t0),"missing witness");
   const q=p=>sq(s-p[0])+sq(t0-p[1]);
   const F=P.filter(p=>4n*q(p)<=sq(2n*D+en));
   let v=F[0];
   for(const p of F)if(q(p)<q(v)||(q(p)===q(v)&&p[1]>v[1]))v=p;
   let h=[en,4n], clips=0;
   for(const p of F)if(p[1]>v[1]){
      const g=q(p)-q(v);check(g>0n,"tie rule");
      h=fracMin(h,[g,4n*(p[1]-v[1])]);clips++;
   }
   const [a,b]=h;
   const dd=p=>sq((s-p[0])*b)+sq((t0-p[1])*b+a);
   const dv=dd(v); let R=sq(D*b);
   check(a>0n&&4n*a<=en*b,"perturbation");
   check(dv<R,"inside D");
   for(const p of F)if(p!==v){check(dd(p)>dv,"unique nearest");R=min(R,dd(p));}
   check(dv<R,"positive isolation gap");
   for(const p of P)if(p!==v)check(dd(p)>=R,"global isolation");
   return {v,h,F:F.length,clips,dist2:dv,rad2:R,den2:b*b};
 }
 let cases=0, ties=0, clipped=0;
 const s=10n,D=8n,w=[5n,0n];
 const options=[[9n,0n],[9n,1n],[9n,-1n],[8n,0n],[8n,2n],[8n,-2n],[3n,0n],[1n,0n],[9n,8n],[7n,-4n]];
 for(let mask=0;mask<1<<options.length;mask++){
    const P=[w,...options.filter((p,i)=>mask>>i&1)];
    for(const witness of P.filter(p=>s-p[0]<D)){
      const r=choose(s,D,witness,P);cases++;if(r.clips)clipped++;
      const q=p=>sq(s-p[0])+sq(witness[1]-p[1]);
      const m=P.reduce((a,p)=>min(a,q(p)),q(P[0]));
      if(P.filter(p=>q(p)===m).length>1)ties++;
    }
 }
 // A fixed, unadapted half-epsilon shift would tie these poles.
 const bad=[[5n,0n],[9n,0n],[9n,1n]];
 check(sq(2n*(10n-9n))+sq(1n)===sq(2n*(10n-9n))+sq(1n-2n),"fixed-shift tie");
 const good=choose(s,D,bad[0],bad);
 check(good.h[0]*4n===good.h[1],"adaptive shift");
 const counts=[];
 for(const n of [64,256,1024,4096]){
   const P=Array.from({length:n},(_,i)=>[BigInt(n+3),BigInt(i)-BigInt(n/2)]);
   const r=choose(BigInt(n+4),BigInt(n+2),P[n/2],P);
   check(r.F===n,"all in finite set");
   counts.push({n,linearCandidateVisits:3*n,pairCandidates:n*n});
 }
 return {cases,tiedInitialMinimumCases:ties,adaptiveConstraintCases:clipped,negativeControls:1,counts};
}
console.log(JSON.stringify(certificate(),null,2));
```

Actual result:
```json
{
  "cases": 5632,
  "tiedInitialMinimumCases": 292,
  "adaptiveConstraintCases": 4468,
  "negativeControls": 1,
  "counts": [
    {
      "n": 64,
      "linearCandidateVisits": 192,
      "pairCandidates": 4096
    },
    {
      "n": 256,
      "linearCandidateVisits": 768,
      "pairCandidates": 65536
    },
    {
      "n": 1024,
      "linearCandidateVisits": 3072,
      "pairCandidates": 1048576
    },
    {
      "n": 4096,
      "linearCandidateVisits": 12288,
      "pairCandidates": 16777216
    }
  ]
}
```

The linearCandidateVisits figures count three full passes on F (winner, shift and radius), excluding filtering and validation; pairCandidates counts the source's Cartesian pair domain including diagonal entries. This is not elapsed-time benchmarking. No changed hypothesis, no removed pole, no claim of mathematical novelty or new RH proof. No independent Lean replay performed in this run. The original source already gives the existence theorem; the alternative is an exact human simplification and finite-input constructive witness.

RESUME HERE: locate the relocated current-head nearest-pole and pole-asymmetry declarations using the imports of current landauWindow.lean and compare the seven PoleData fields, quantifier order and two lower-bound branches to original pin. Produce a revision migration table; do not migrate conclusions until statements and prerequisites match. Ask audit lane to review the new finite witness lemma, and kernel lane to consider a Lean companion once the original source environment is available. 

HANDOFF TO: formal audit, integration, editor, acceleration, structure, prime-window and character-box lanes. The all-pairs witness construction is unnecessary for the human proof; retain the original theorem and source references. The exact arithmetic-to-window producer and full kernel proof remain independent open obligations.


---
## Appendix 51: specialists/literature_provenance/RUN4_NOETHERIAN_DESCENT_AND_FILTRATION_REFLECTION.md
Peer Git blob: 099943b3d8405a5bef4ea0701c2e4fddf2e047d1; evidence status retained.

# RUN4 — Noetherian descent and filtration reflection

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the reduction from Noetherian rings to arbitrary rings for canonical square-zero lifting. PARTIAL for underlying geometric producers and whole RH. No independent Lean replay or URT speed claim.

Continuity: read swarm protocol, handoff, expansion, AGENTS, research state, runner log/protocol, continuity, CI and latest peer handoffs (integration, manuscript, kernel, acceleration, Galois, theta, prime, Landau, character-box, geometry, structure, dependencies, formal audit). Physical CI PASS run 45373263454 at 10:36:09 UTC is not RH verification. Follow RUN3, not other lanes' arithmetic tasks. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream main 35cf45f5e031bafe9ce8305214b2b3be108d1b40; proofs anchored to pin. Five old modules consolidated into AbelianLiftingOfDeRhamUnobstructed.lean, head blob 5b16826bb38b1b907d24526e461f71510856654f; migration checks below do not certify semantic equivalence.

## 1. Scope and assumption boundary

Let P=AbelianDeRham. Let H assert that for EVERY commutative Noetherian ring S, square-zero ideal J, commutative S0 and surjective q:S→S0 with ker(q)=J, both LiftObj and LiftHom hold for divided₂ J and q. Then sqLifting_of_noetherian gives SqLifting (same pair for EVERY commutative R). divided₂ means canonical square-zero DP, not an arbitrary DP structure on a square-zero ideal. SquareZeroLiftingOfNoetherianCase L17–23 uses an object lifting theorem, a scheme morphism existence theorem and a unique group-lift theorem. Its Statement wrapper is a theorem application, not an axiom. AbelianLiftingOfDeRhamUnobstructed L72–78 supplies H from two square-zero theorem applications using P and AbelianSchemeLifts.At (hL); hU=AbelianUnobstructed stays a premise of the larger induction. H is not the conclusion assumed recursively, and its base producers remain open for expansion.

## 2. Object: descend the scheme AND the projection

Fix arbitrary π:R→R0 surjective, kerπ=I, I²=0, reference abelian lift A' of A0 with relative dimension g, and admissible F⊆HdR(A'). Keep the group pullback and all admissibility conditions. A direct complement gives idempotent e with im e=F (GrothendieckMessingLiftOfNoetherianCase L240–249).

First descend A' to B over a finite-type Z-subring S⊆R. AbelianSchemeDescendsToFinitelyGeneratedSubring L144–171 first uses finite-presentation descent of smooth group schemes, then adjoins finitely many coefficients to ensure properness. Injectivity of S⊆R gives dominance of Spec R→Spec S. The actual connectedness proof is nontrivial: multiplication-by-n is surjective on the original abelian scheme for n≥1 by passage to algebraically closed fibers and finite/flat/surjective abelian endomorphisms (L91–119). Each descended multiplication map has closed image containing a dense subset, so is surjective (L121–142). In an algebraically closed fiber the rational points modulo the identity component form a finite group: components are open and compactness gives finitely many; translations preserve components. If the index is m, every point is an m-th power and hence lies in the identity component. A nonempty complement would have a rational point, contradiction (L25–71). Relative dimension follows by the separate dominant pullback lemma. Preserve these finite-presentation, properness, multiplication-finiteness and dimension producers. Noetherianity is due to finite type over Z, not a claim about arbitrary subrings.

Now put M=primDR(B), M_R=primDR(A'). P gives finite projectivity of M and base-change spanning and dual-extension properties. Choose a dual frame p_i,l_i with c=Σ_i l_i(c)p_i (L28–38). It need not be a basis. Let f:M→M_R be semilinear pullback, l'_i corresponding duals. Adjoin the n² coefficients a_ij=e(l'_i)(f(p_j)) to S inside R, obtaining T finite type over S and hence Noetherian. Factor the model through T, with corresponding frame p_i^T,l_i^T. Define the descended operator by

    e_T(x) = Σ_i x(p_i^T) Σ_j a_ij l_j^T.

For corresponding x,x', expand x' in the dual frame and f_T(c) in the primal frame. Commuting the two finite sums yields e(x')(f_T(c))=σ_T(e_T(x)(c)). These expansions and extensions follow from P and the span hypotheses, not from freeness of M (L40–89,200–238). n² counts coefficients for this frame, not total translation complexity.

Rename T as S, σ:S↪R; J=ker(πσ). Products of elements of J map into I²=0; injectivity gives J²=0. S0=S/J embeds into R0 by ρ, with ρq=πσ. The special fiber group pullback factors through S0. Compatibility, dual extension and injectivity of σ reflect e_S²=e_S, so im e_S is complemented by ker e_S (L250–279).

## 3. Admissibility and the return to R

red_descent (L91–140) is necessary; complementarity alone is insufficient. Use its square of semilinear maps f:M→M_R, r1:M→M0, r:M_R→M_R0, f0:M0→M_R0, with rf=f0r1 and ρq=πσ. Keep projectivity of M, finite projectivity of M_R, injectivity of ρ, surjectivity of q, stated span and dual-extension hypotheses. W=span_R0 f0(W0). The top reduction equality asserts that y' annihilates W iff it is the reduction of an element of im e.

If y annihilates W0, extend it to y' on M_R0; y' annihilates W. Write y' as reduction of e w. Lift y∘r1 to a dual x of M by projectivity and surjectivity of q; extend x to x' over R. On the spanning images f(M), the reductions of x' and e w agree. Therefore all coefficients of x'−e w in a finite dual frame reduce to zero. Linearity of e and e²=e imply reduction(e x')=reduction(e w). Compatibility with e_S and injectivity of ρ give the required reduction of e_S x on r1(M). Conversely, for y represented as reduction of e_S x, extend x and reduce e(x') to obtain y' annihilating W by the top equality. The span of r1(M) identifies the restriction along f0 with ρy; injectivity gives y annihilating W0. Neither step assumes faithful flatness of σ (L104–140).

Apply H's object branch to B over S→S/J with admissible im e_S. Obtain C over S and its prescribed crystal filtration; base-change C to R to get A lifting A0. P supplies crystal-to-de Rham bijections for B,C identifying their primitive modules. ann_bc (L142–181) proves the necessary two-way equality: for Q≅M and W⊕N=Q, let q_M project onto the image of N. A dual annihilating the extended W depends only on q_M, each l_i∘q_M is in im e_S, and preimages under e_S can be extended to R. Frame expansion writes the dual as a linear combination of their e-images. Conversely an e-image expanded in the extended dual frame kills the image of W and hence its span. The required correspondence of the two crystal duals is established by naturality and the DP morphism along σ (L280–305). This recovers the requested filtration over R, not only an object.

## 4. Morphism: the guard must descend too

Keep specified abelian lifts A,B and reductions A0,B0, dimensions g,g' (not necessarily equal), group pullbacks, f0 a group homomorphism and full filtration-preservation guard. AbelianHomReductionDescendsFinitelyGenerated L146–236 produces a common finite-type subring S, abelian models AS,BS, reductions modulo J=I∩S, a group map fS0, four group pullbacks and three compatibility equations.

Descend A first, then B over a subring containing a finite generating set for A's model; base-change A. S/J is isomorphic to its image in R0. Finite-presentation morphism descent for the composite of f0 with the model projection requires finitely many additional coefficients in R0; lift each into R using π surjective, then adjoin them (L74–136,166–190). Pullback universal properties yield a scheme map fS0. Injection of S/J→R0 gives scheme-theoretic dominance, and with source flatness and target separatedness ExtUnique.isMonHom_of_isGrpPullback reflects the group law (L224–232). Ordinary topological dominance alone is not asserted sufficient here.

PushMemLiftFilOfInjective L12–80 establishes the guard rather than assuming it. For any d in the smaller A filtration, P's base-change extension and crystal bijection supply corresponding d' over R. The big primitive submodule is spanned by pullbacks of smaller primitive elements, so d' annihilates it (L52–70). Apply the given filtration guard to d'. By push naturality and crystal correspondence, σ of the small pushed pairing equals the big pushed pairing, which vanishes on pulled-back primitive elements. Injectivity reflects zero (L71–80). This is elementwise reflection, not a claim that any tensor extension reflects membership; all commuting squares and pullbacks remain hypotheses.

As J²=0 and S is Noetherian, apply H's hom branch, then base-change the lifted map by the pullback property. Both projections verify reduction equality (LiftHomExistsOfNoetherian L24–45). The conclusion is only a scheme morphism φ lifting f0. The separate normalization is required.

## 5. Rigidity converts a scheme lift into a unique group lift

ExistsUniqueIsMonHomLift L29–72 assumes surjective π with NILPOTENT kernel, abelian schemes and group pullbacks, f0 a group hom and scheme lift φ. In additive notation put f(a)=φ(a)−φ(0). Since φ reduces to a pointed map, the correction reduces to zero. Thus f still lifts f0 and is pointed. GlobalTheory.rigidity_holds makes it a group hom. For another group lift g, d=g−f is pointed and reduces to zero. EqCompSectionOfProperSmoothNilpotentRigidity L16–62 proves that a map constant on the reduction factors through its value on the unit section: nilpotence gives surjectivity of Spec R0→Spec R on points, smooth geometrically connected source is geometrically integral (with properness used for global functions), global-functions isomorphisms and local rigidity on fibers give equality on an open cover. Hence d=0. These are substantive geometric dependencies, not a pointwise argument modulo I. The top assembly supplies the nilpotence exponent 2 and combines the unique group lift with the object lifting result.

## 6. Assumption ledger

P's primitive finite projectivity, base-change and rigidity fields are retained. H is a local quantified hypothesis with the explicit internal supplier described in §1. The seven Statement wrappers in the ledger are proved applications of the corresponding internal bodies, not extra axioms. The two base-case square-zero Statement wrappers point to liftObj_sq and Hom.liftHom_sq; their geometry is not reconstructed here. Remaining actual producer names include smooth_grpScheme_descends_to_fg_subring, ProperLimit.exists_finset_isProper, MulFiniteAny.isFinite_mulA, flat_and_surjective_of_isFinite_abelianEnd, smoothOfRelativeDimension_of_isPullback_isDominant, morphism_descends_to_subring, ExtUnique.isMonHom_of_isGrpPullback, rigidity_holds, GlobalFunctions.isIso_app, FlatFibreInjective.injective_baseChange, exists_noetherian_model_of_smooth, local_rigidity, and P's fields and definitions. Mathlib imports remain. These are source dependency edges, not full elaborated closure; historical attribution of all leaves and their kernel axiom footprints are not independently audited. No hypothesis added or discarded in the reconstruction.

## 7. Executed evidence

18/18 connector-reported pinned blob IDs matched on final retrieval. 147/147 source line substring anchors passed on the second run (after correcting an off-by-one anchor at MulFiniteAny.isFinite_mulA, 115→116; a separate mistyped expected blob ID in that run was corrected in the final retrieval). The appendix records exact source lines for independent replay: git rev-parse PIN:PATH must equal sha; git show PIN:PATH must contain the recorded line at each listed 1-indexed position. Migration tests use exact trimmed lines within clump boundaries, not proof equality. No Lean executable proof check performed.

RESUME HERE: inspect GrothendieckMessingLiftAbelianSchemeOfSquareZero.lean (liftObj_sq) and GrothendieckMessingLiftHomomorphismOfSquareZero.lean (Hom.liftHom_sq) at pin; expand actual base producers of H using AbelianSchemeLifts.At, trace the construction of that record. Do not repeat Noetherian descent or RUN3 induction. HANDOFF TO: integration, editor, audit, positivity geometry and Galois. Attach §§1–6 to RUN3. No physics gates changed. Project OPEN.

### Source ledger
```json
[
  {
    "name": "SquareZeroLiftingOfNoetherianCase",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SquareZeroLiftingOfNoetherianCase.lean",
    "sha": "cd93c5dfa11f49fdc4bf589047cbafda9a696f97",
    "checks": [
      [
        17,
        "theorem sqLifting_of_noetherian : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        20,
        "  refine ⟨GlobalTheory.T.grothendieckMessing_lift_of_noetherian_case P H R I h R₀ π hπ hI, ?_⟩"
      ],
      [
        22,
        "  obtain ⟨φ, hφ⟩ := GlobalTheory.T.liftHom_exists_of_noetherian_alt P H R I h R₀ π hπ hI g A₀ A i hA hAa hg g' B₀ B j hB hBa hg' f₀ hf"
      ],
      [
        23,
        "  exact GlobalTheory.T.existsUnique_isMonHom_lift_of_grpPullback_abelian R R₀ π hπ ⟨2, by rw [hI]; exact h⟩ A₀ B₀ A B i j hA hB hAa hBa f₀ φ hφ"
      ]
    ]
  },
  {
    "name": "SquareZeroLiftingOfNoetherianCaseStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SquareZeroLiftingOfNoetherianCaseStatement.lean",
    "sha": "60f7f4b838d2b1f3654082622c6a121ade1ad908",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.squareZeroLifting_of_noetherian_case : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        14,
        "  first | exact @GlobalTheory.SqLift.sqLifting_of_noetherian | exact GlobalTheory.SqLift.sqLifting_of_noetherian | (intros; apply GlobalTheory.SqLift.sqLifting_of_noetherian <;> assumption)"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftOfNoetherianCase",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckMessingLiftOfNoetherianCase.lean",
    "sha": "2c4102ba70d054e9dd61b0781b1e83713cf5ce22",
    "checks": [
      [
        28,
        "theorem exists_frame [Module.Finite S P] [Module.Projective S P] :"
      ],
      [
        40,
        "theorem cor_of_span {σ : S →+* R} {Λ : Type*} {v : Λ → P} (hv : Submodule.span S (Set.range v) = ⊤)"
      ],
      [
        50,
        "theorem frame_bc {σ : S →+* R} {n : ℕ} {p : Fin n → P} {l : Fin n → Dual S P}"
      ],
      [
        64,
        "theorem dual_frame {n : ℕ} {p : Fin n → P} {l : Fin n → Dual S P}"
      ],
      [
        70,
        "theorem exists_descent {τ : S →+* S₀} {σ₁ : S₀ →+* R} {σ : S →+* R} (hσ : ∀ a, σ₁ (τ a) = σ a)"
      ],
      [
        84,
        "  refine ⟨∑ i, (LinearMap.applyₗ (f₀ (p i))).smulRight (∑ j, b i j • l₁ j), fun x x' hx c ↦ ?_⟩"
      ],
      [
        91,
        "theorem red_descent [Module.Projective S P] [Module.Finite R P'] [Module.Projective R P']"
      ],
      [
        120,
        "    obtain ⟨x, hx⟩ := Module.projective_lifting_property (Algebra.linearMap S S₀) t hπ₁"
      ],
      [
        125,
        "    have z : ∀ c, π (e (x' - e w) c) = 0 := fun c ↦ by"
      ],
      [
        128,
        "    refine ⟨_, ⟨x, rfl⟩, fun c ↦ hρ ?_⟩"
      ],
      [
        135,
        "    have m := (H y').2 ⟨_, ⟨x', rfl⟩, hy'⟩"
      ],
      [
        138,
        "    refine (Submodule.mem_dualAnnihilator _).2 fun c hc ↦ hρ ?_"
      ],
      [
        142,
        "theorem ann_bc {Q Q' : Type*} [AddCommGroup Q] [Module S Q] [AddCommGroup Q'] [Module R Q']"
      ],
      [
        155,
        "    let q : P →ₗ[S] P := θ.toLinearMap ∘ₗ Submodule.projection _ _ hN.symm ∘ₗ θ.symm.toLinearMap"
      ],
      [
        174,
        "    choose l' hl using fun i ↦ ef (l i)"
      ],
      [
        187,
        "theorem exists_factor {S S' S'' : Scheme.{0}} {G : Over S} [GrpObj G] {G'' : Over S''} [GrpObj G'']"
      ],
      [
        200,
        "theorem bc_facts (P : AbelianDeRham) {S R : Type} [CommRing S] [CommRing R] {σ : S →+* R} {g : ℕ}"
      ],
      [
        207,
        "  obtain ⟨h₁, h₂⟩ := P.2.2.1 S B g hB hg R A φ h"
      ],
      [
        215,
        "theorem exists_noeth_model (P : AbelianDeRham) {R : Type} [CommRing R] {g : ℕ} (A : Over (Sp R)) [GrpObj A]"
      ],
      [
        222,
        "  obtain ⟨S, B, _, φ, -, hS, hB, hgB, h⟩ := GlobalTheory.T.abelianScheme_descends_to_finitelyGenerated_subring R g A ∅ hA hg"
      ],
      [
        223,
        "  haveI : IsNoetherianRing S := Algebra.FiniteType.isNoetherianRing ℤ S"
      ],
      [
        224,
        "  obtain ⟨hf, hp, -⟩ := P.1.prim hB hgB"
      ],
      [
        228,
        "  let a : Fin n × Fin n → R := fun ij ↦ e (l' ij.1) ((redMor h).pull (p ij.2))"
      ],
      [
        229,
        "  let T := Algebra.adjoin S (Set.range a)"
      ],
      [
        231,
        "  haveI : IsNoetherianRing T := Algebra.FiniteType.isNoetherianRing S T"
      ],
      [
        235,
        "  obtain ⟨e₁, he₁⟩ := exists_descent (τ := algebraMap S T) (σ₁ := T.val.toRingHom) (fun _ ↦ rfl) hpl _ b₁ hl e"
      ],
      [
        240,
        "theorem liftObj_of_noetherian (P : AbelianDeRham)"
      ],
      [
        245,
        "  intro g A₀ _ A' _ i' h' hA hg F ⟨⟨N, hN⟩, hF⟩"
      ],
      [
        247,
        "    ⟨Submodule.projection _ _ hN, fun x ↦ Submodule.projection_apply_left hN"
      ],
      [
        249,
        "  obtain ⟨S, _, _, σ, B, _, φ, h, e₁, hσ, hB, hgB, hee⟩ := exists_noeth_model P A' hA hg e"
      ],
      [
        250,
        "  let J : Ideal S := RingHom.ker (π.comp σ)"
      ],
      [
        252,
        "  have hJ : J ^ 2 = 0 := by"
      ],
      [
        257,
        "    exact hσ (this.trans (map_zero σ).symm)"
      ],
      [
        259,
        "  let ρ : S ⧸ J →+* R₀ := RingHom.kerLift (π.comp σ)"
      ],
      [
        260,
        "  have hρ : Function.Injective ρ := RingHom.kerLift_injective _"
      ],
      [
        267,
        "  have adm : IsAdmissible k (LinearMap.range e₁) := by"
      ],
      [
        270,
        "    refine ⟨⟨LinearMap.ker e₁, LinearMap.IsIdempotentElem.isCompl (LinearMap.ext fun x ↦ ?_)⟩,"
      ],
      [
        271,
        "      red_descent hρ Ideal.Quotient.mk_surjective hsq (redMor h).pull (redMor k).pull (redMor h').pull"
      ],
      [
        275,
        "      refine LinearMap.ext fun c ↦ hσ ?_"
      ],
      [
        280,
        "  obtain ⟨C, _, l, hl, hC, hgC, hfil⟩ := (H S J hJ (S ⧸ J) π₁ Ideal.Quotient.mk_surjective"
      ],
      [
        282,
        "  obtain ⟨A, _, χ, i, n, hi, hχ, hA₁, hg₁⟩ := exists_factor (k₀.comp hl) sq.symm hC hgC"
      ],
      [
        284,
        "  let α := LinearEquiv.ofBijective _ (P.2.2.2.1 S C g hC hgC J _ (isDPNilpotent_squareZero hJ) _ π₁"
      ],
      [
        289,
        "    GrpMor.of_isGrpPullback (isDPMorphism_sqDP hJ hI σ hJI) sq k₀"
      ],
      [
        291,
        "  refine ann_bc (α.trans β.symm) (redMor h).pull (redMor n).pull b₁ b₂ e e₁ hee _ M hM _"
      ],
      [
        293,
        "  · have := SetLike.ext_iff.1 hfil (x ∘ₗ β.symm.toLinearMap)"
      ],
      [
        301,
        "    exact (GrpMor.pull_pull (redMor n) (liftMor _ hi) ((liftMor (divided₂ hJ) hl).comp m) (fun _ ↦ rfl)"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftOfNoetherianCaseStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckMessingLiftOfNoetherianCaseStatement.lean",
    "sha": "6aae4a108bc44f6f9e009481b4773336f08612fc",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.grothendieckMessing_lift_of_noetherian_case : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        16,
        "  first | exact @GlobalTheory.NoethLiftObj.liftObj_of_noetherian | exact GlobalTheory.NoethLiftObj.liftObj_of_noetherian | (intros; apply GlobalTheory.NoethLiftObj.liftObj_of_noetherian <;> assumption)"
      ]
    ]
  },
  {
    "name": "LiftHomExistsOfNoetherian",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/LiftHomExistsOfNoetherian.lean",
    "sha": "d5b8cf31044329b8be401203e0d74d060a0a5fa6",
    "checks": [
      [
        14,
        "theorem liftHom_exists_of_noetherian : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        22,
        "  ∀ (f₀ : A₀ ⟶ B₀) [IsMonHom f₀], (∀ d ∈ liftFil (divided₂ h) hA, push (divided₂ h) (spMap π) f₀ d ∈ liftFil (divided₂ h) hB) →"
      ],
      [
        26,
        "    abBS, smBS, pA, pB, qA, qB, cA, cB, cf⟩ := GlobalTheory.T.abelian_hom_reduction_descends_finitely_generated R I R₀ π hπ hker g A₀ A i hA abA smA g' B₀ B j hB abB smB f₀"
      ],
      [
        27,
        "  have hS : (I.comap S.subtype) ^ 2 = 0 := by"
      ],
      [
        30,
        "    rw [h, Ideal.zero_eq_bot, Ideal.comap_bot_of_injective _ Subtype.val_injective]"
      ],
      [
        31,
        "  haveI : IsNoetherianRing S := Algebra.FiniteType.isNoetherianRing ℤ S"
      ],
      [
        32,
        "  have hfilS := GlobalTheory.T.push_mem_liftFil_of_injective_alt P R I h R₀ π hπ hker S S.subtype Subtype.val_injective (I.comap S.subtype) hS"
      ],
      [
        36,
        "  obtain ⟨fS, ⟨_, efS⟩, -⟩ := (H S (I.comap S.subtype) hS (S ⧸ I.comap S.subtype) (Ideal.Quotient.mk _)"
      ],
      [
        37,
        "    Ideal.Quotient.mk_surjective Ideal.mk_ker).2 g AS₀ AS iS hAS abAS smAS g' BS₀ BS jS hBS abBS smBS fS₀ hfilS"
      ],
      [
        38,
        "  let fl : A.left ⟶ B.left := pB.1.lift (φA ≫ fS.left) A.hom (by"
      ],
      [
        41,
        "  apply pB.1.hom_ext"
      ],
      [
        43,
        "    rw [reassoc_of% cA, efS, ← Category.assoc, ← cf, Category.assoc, cB]"
      ]
    ]
  },
  {
    "name": "LiftHomExistsOfNoetherianStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/LiftHomExistsOfNoetherianStatement.lean",
    "sha": "6bd9fddfe3905e45a06108fb901166b2c4c2fd8f",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.liftHom_exists_of_noetherian_alt : AbelianDeRham → (∀ (R : Type) [CommRing R] [IsNoetherianRing R] (I : Ideal R) (hI : I ^ 2 = 0) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        21,
        "    ∃ f : A ⟶ B, i ≫ f.left = f₀.left ≫ j := by"
      ],
      [
        22,
        "  first | exact @GlobalTheory.liftHom_exists_of_noetherian | exact GlobalTheory.liftHom_exists_of_noetherian | (intros; apply GlobalTheory.liftHom_exists_of_noetherian <;> assumption)"
      ]
    ]
  },
  {
    "name": "PushMemLiftFilOfInjective",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PushMemLiftFilOfInjective.lean",
    "sha": "6d162cf205e0ff1f4e5fa095994c072ec1c13c91",
    "checks": [
      [
        12,
        "theorem push_mem_liftFil_of_injective : AbelianDeRham →"
      ],
      [
        15,
        "  ∀ (S : Type) [CommRing S] (σ : S →+* R), Function.Injective σ →"
      ],
      [
        34,
        "    (∀ d ∈ liftFil (divided₂ h) hA, push (divided₂ h) (spMap π) f₀ d ∈ liftFil (divided₂ h) hB) →"
      ],
      [
        39,
        "  obtain ⟨_, _, HBC, HR, _⟩ := H"
      ],
      [
        45,
        "  have hdp : IsDPMorphism (divided₂ hJ) (divided₂ h) σ := isDPMorphism_sqDP hJ h σ hJI"
      ],
      [
        53,
        "  obtain ⟨y, hy⟩ := hBCA.1.exists (crysToDR (divided₂ hJ) hAS d)"
      ],
      [
        55,
        "    (GlobalTheory.Published.AbelianDeRham.Rigid.crysToDR_bijective HR hAab hAg (isDPNilpotent_squareZero h) hπ hI hA).2 y"
      ],
      [
        56,
        "  have hsurj := (HR S AS g hASab hASg J (divided₂ hJ) (isDPNilpotent_squareZero hJ) S₀ πS hπS hJk AS₀ iS hAS).2"
      ],
      [
        63,
        "  have hd' : d' ∈ liftFil (divided₂ h) hA := by"
      ],
      [
        65,
        "      rw [hBCA.2, Submodule.span_le]"
      ],
      [
        71,
        "  have hpush := hyp d' hd'"
      ],
      [
        72,
        "  have hcorr := GrpMor.Corr.push (m := mA) mB fS₀ f₀ hf.symm hm"
      ],
      [
        73,
        "  have hx := crysToDR_corr (divided₂ hJ) hBS hB mB nB hjB hcorr"
      ],
      [
        77,
        "  apply hσ"
      ],
      [
        80,
        "  exact (hx c).symm.trans (hpush _ (nB.isMor.pullback1_mem_hodgeFiltration hc))"
      ]
    ]
  },
  {
    "name": "PushMemLiftFilOfInjectiveStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PushMemLiftFilOfInjectiveStatement.lean",
    "sha": "2aa22534da913c9d18f759835872b656d0e7b036",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.push_mem_liftFil_of_injective_alt : AbelianDeRham →"
      ],
      [
        36,
        "  first | exact @GlobalTheory.SqLift.push_mem_liftFil_of_injective | exact GlobalTheory.SqLift.push_mem_liftFil_of_injective | (intros; apply GlobalTheory.SqLift.push_mem_liftFil_of_injective <;> assumption)"
      ]
    ]
  },
  {
    "name": "ExistsUniqueIsMonHomLift",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsUniqueIsMonHomLift.lean",
    "sha": "068d2a0d2492401d9951b1e018d06c5feecd18d8",
    "checks": [
      [
        29,
        "theorem existsUnique_isMonHom_lift :"
      ],
      [
        30,
        "    ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (π : R →+* R₀), Function.Surjective π → IsNilpotent (RingHom.ker π) →"
      ],
      [
        48,
        "  obtain ⟨f, hfdef⟩ : ∃ f : A ⟶ B, f = φ * ((1 : A ⟶ A) ≫ φ)⁻¹ := ⟨_, rfl⟩"
      ],
      [
        53,
        "  have hf : IsMonHom f := GlobalTheory.rigidity_holds (Sp R) A B hAab hBab f hηf"
      ],
      [
        55,
        "    rw [← hzl, hfdef, comp_mul, GrpObj.comp_inv, hc, inv_one, _root_.mul_one, hzl, hφ]"
      ],
      [
        57,
        "  obtain ⟨d, hddef⟩ : ∃ d : A ⟶ B, d = g * f⁻¹ := ⟨_, rfl⟩"
      ],
      [
        62,
        "  have key := GlobalTheory.Rigidity.eq_comp_section R R₀ π hπ hnil A B A₀ i hA.1 hAab.smooth hAab.proper"
      ],
      [
        72,
        "  exact mul_inv_eq_one.1 hd"
      ]
    ]
  },
  {
    "name": "ExistsUniqueIsMonHomLiftStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsUniqueIsMonHomLiftStatement.lean",
    "sha": "84fbf13797dbe233f5fab526d5bd535937ae26d1",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.existsUnique_isMonHom_lift_of_grpPullback_abelian : ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (π : R →+* R₀), Function.Surjective π → IsNilpotent (RingHom.ker π) →"
      ],
      [
        16,
        "  first | exact @GlobalTheory.HomLift.existsUnique_isMonHom_lift | exact GlobalTheory.HomLift.existsUnique_isMonHom_lift | (intros; apply GlobalTheory.HomLift.existsUnique_isMonHom_lift <;> assumption)"
      ]
    ]
  },
  {
    "name": "AbelianSchemeDescendsToFinitelyGeneratedSubring",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeDescendsToFinitelyGeneratedSubring.lean",
    "sha": "5e248e8d0cc15138e475d6b8a278c40d3d237d00",
    "checks": [
      [
        25,
        "theorem connectedSpace_of_surjective_pow {k : Type} [Field k] [IsAlgClosed k] (G : Over (Sp k)) [GrpObj G]"
      ],
      [
        59,
        "  have : H.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient"
      ],
      [
        65,
        "    exact H.pow_index_mem y"
      ],
      [
        91,
        "theorem surjective_pow {S : Scheme.{0}} (A : Over S) [GrpObj A] (hA : IsAbelianScheme A) (n : ℕ) (hn : 1 ≤ n) :"
      ],
      [
        116,
        "    hm (MulFiniteAny.isFinite_mulA K B hB n hn)).2"
      ],
      [
        121,
        "theorem isAbelianScheme_of_isDominant {S S' : Scheme.{0}} {B : Over S} {A : Over S'} [GrpObj B] [GrpObj A]"
      ],
      [
        132,
        "    rw [← ((𝟙 B) ^ n : B ⟶ B).left.isClosedMap.isClosed_range.closure_eq]"
      ],
      [
        141,
        "  exact connectedSpace_of_surjective_pow ((Over.pullback s).obj B) fun n hn =>"
      ],
      [
        144,
        "theorem abelianScheme_descends_to_fg_subring :"
      ],
      [
        152,
        "    smooth_grpScheme_descends_to_fg_subring R A F hA.smooth inferInstance inferInstance"
      ],
      [
        158,
        "  obtain ⟨s, hs⟩ := ProperLimit.exists_finset_isProper k R A₀.hom"
      ],
      [
        159,
        "  let S : Subalgebra k R := Algebra.adjoin k (s : Set R)"
      ],
      [
        165,
        "  have hd : IsDominant (spMap S.toSubring.subtype) :="
      ],
      [
        167,
        "      rw [(RingHom.injective_iff_ker_eq_bot _).1 Subtype.val_injective]"
      ],
      [
        170,
        "    SpreadGroup.finiteType_of_fg hk (Subalgebra.fg_adjoin_finset s), isAbelianScheme_of_isDominant hφ hA,"
      ]
    ]
  },
  {
    "name": "AbelianSchemeDescendsToFinitelyGeneratedSubringStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeDescendsToFinitelyGeneratedSubringStatement.lean",
    "sha": "db471312d16f8ab9ea199fe005c23722c1ed19bd",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.abelianScheme_descends_to_finitelyGenerated_subring : ∀ (R : Type) [CommRing R] (g : ℕ) (A : Over (Sp R)) [GrpObj A] (F : Finset R), IsAbelianScheme A → SmoothOfRelativeDimension g A.hom →"
      ],
      [
        15,
        "  first | exact @GlobalTheory.AbelianLimit.abelianScheme_descends_to_fg_subring | exact GlobalTheory.AbelianLimit.abelianScheme_descends_to_fg_subring | (intros; apply GlobalTheory.AbelianLimit.abelianScheme_descends_to_fg_subring <;> assumption)"
      ]
    ]
  },
  {
    "name": "AbelianHomReductionDescendsFinitelyGenerated",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianHomReductionDescendsFinitelyGenerated.lean",
    "sha": "457cca287fbacd987e38dcb4020c3ee98b25c010",
    "checks": [
      [
        37,
        "theorem exists_finset_le_of_finiteType : ∀ (R : Type) [CommRing R] (S : Subring R), Algebra.FiniteType ℤ S → ∃ F : Finset R, ∀ T : Subring R, (F : Set R) ⊆ T → S ≤ T := by"
      ],
      [
        74,
        "noncomputable def redEquiv {R R₀ : Type} [CommRing R] [CommRing R₀] (I : Ideal R) (π : R →+* R₀)"
      ],
      [
        98,
        "theorem morphism_descends_to_reduction : ∀ (R : Type) [CommRing R] (I : Ideal R) (R₀ : Type) [CommRing R₀] (π : R →+* R₀) (hπ : Function.Surjective π) (hI : RingHom.ker π = I) (S : Subring R) (X X₀ Y₀ : Scheme.{0}) (p : X ⟶ Sp R₀) (a : X₀ ⟶ Sp (S ⧸ I.comap S.subtype)) (b : Y₀ ⟶ Sp (S ⧸ I.comap S.subtype)) (π' : X ⟶ X₀) [QuasiCompact a] [QuasiSeparated a] [LocallyOfFinitePresentation b] (φ : X ⟶ Y₀), IsPullback π' p a (spMap (GlobalTheory.AbHomDesc.iota I π hI S)) → φ ≫ b = π' ≫ a → ∃ F : Finset R, ∀ (S' : Subring R) (h : S ≤ S'), (F : Set R) ⊆ S' → ∀ (X₁ : Scheme.{0}) (a₁ : X₁ ⟶ Sp (S' ⧸ I.comap S'.subtype)) (π₁ : X₁ ⟶ X₀) (k : X ⟶ X₁), IsPullback π₁ a₁ a (spMap (GlobalTheory.AbHomDesc.trans I h)) → k ≫ π₁ = π' → k ≫ a₁ = p ≫ spMap (GlobalTheory.AbHomDesc.iota I π hI S') → ∃ ψ : X₁ ⟶ Y₀, k ≫ ψ = φ ∧ ψ ≫ b = π₁ ≫ a := by"
      ],
      [
        105,
        "  obtain ⟨F₀, hF₀⟩ := GlobalTheory.morphism_descends_to_subring R₀ (iota I π hI S).range X X₀ Y₀ p"
      ],
      [
        108,
        "  refine ⟨F₀.image (Function.surjInv hπ), fun S' h hF X₁ a₁ π₁ k hpb₁ hk₁ hk₂ => ?_⟩"
      ],
      [
        138,
        "theorem exists_isGrpPullback_reduction : ∀ (R : Type) [CommRing R] (I : Ideal R) (R₀ : Type) [CommRing R₀] (π : R →+* R₀) (hI : RingHom.ker π = I) (S : Subring R) (A₀ : Over (Sp R₀)) [GrpObj A₀] (A : Over (Sp R)) [GrpObj A] (i : A₀.left ⟶ A.left) (AS : Over (Sp S)) [GrpObj AS] (φ : A.left ⟶ AS.left), IsGrpPullback A₀ A (spMap π) i → IsGrpPullback A AS (spMap S.subtype) φ → ∃ ψ : A₀.left ⟶ ((Over.pullback (spMap (Ideal.Quotient.mk (I.comap S.subtype)))).obj AS).left, IsGrpPullback A₀ ((Over.pullback (spMap (Ideal.Quotient.mk (I.comap S.subtype)))).obj AS) (spMap (GlobalTheory.AbHomDesc.iota I π hI S)) ψ ∧ i ≫ φ = ψ ≫ pullback.fst AS.hom (spMap (Ideal.Quotient.mk (I.comap S.subtype))) := by"
      ],
      [
        146,
        "theorem abelian_hom_reduction_descends : ∀ (R : Type) [CommRing R] (I : Ideal R) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        166,
        "  obtain ⟨S₀, AS₀, _, φA₀, -, hfg₀, hAS₀ab, hAS₀sm, hφA₀⟩ := GlobalTheory.T.abelianScheme_descends_to_finitelyGenerated_subring R g A ∅ hAab hAsm"
      ],
      [
        168,
        "  obtain ⟨S₁, BS₁, _, φB₁, hF₀S₁, hfg₁, hBS₁ab, hBS₁sm, hφB₁⟩ := GlobalTheory.T.abelianScheme_descends_to_finitelyGenerated_subring R g' B F₀ hBab hBsm"
      ],
      [
        184,
        "  obtain ⟨F, hF⟩ := morphism_descends_to_reduction R I R₀ π hπ hI S₁ A₀.left _ _ A₀.hom"
      ],
      [
        188,
        "  obtain ⟨S', h, hFS, hfg'⟩ := GlobalTheory.KeyTf.exists_finiteType_subring_adjoin R S₁ F hfg₁"
      ],
      [
        209,
        "  obtain ⟨ψ, hψ₁, hψ₂⟩ := hF S' h hFS _ (pullback.snd AS'.hom _) pA ψA' hpA cA wA'"
      ],
      [
        215,
        "  have key : f₀.left ≫ ψB' = ψA' ≫ fS.left := by"
      ],
      [
        224,
        "  have : IsSchemeTheoreticallyDominant (spMap (iota I π hI S')) :="
      ],
      [
        225,
        "    GlobalTheory.ExtUnique.isSchemeTheoreticallyDominant_spec_of_injective _ (iota_injective I π hI S')"
      ],
      [
        232,
        "  have hmon : IsMonHom fS := GlobalTheory.ExtUnique.isMonHom_of_isGrpPullback hψA' hψB' f₀ fS key"
      ]
    ]
  },
  {
    "name": "AbelianHomReductionDescendsFinitelyGeneratedStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianHomReductionDescendsFinitelyGeneratedStatement.lean",
    "sha": "e803020736ead31f5a1316b3a4eee5387dd25fcf",
    "checks": [
      [
        12,
        "theorem _root_.GlobalTheory.T.abelian_hom_reduction_descends_finitely_generated : ∀ (R : Type) [CommRing R] (I : Ideal R) (R₀ : Type) [CommRing R₀] (π : R →+* R₀),"
      ],
      [
        30,
        "  first | exact @GlobalTheory.AbHomDesc.abelian_hom_reduction_descends | exact GlobalTheory.AbHomDesc.abelian_hom_reduction_descends | (intros; apply GlobalTheory.AbHomDesc.abelian_hom_reduction_descends <;> assumption)"
      ]
    ]
  },
  {
    "name": "EqCompSectionOfProperSmoothNilpotentRigidity",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/EqCompSectionOfProperSmoothNilpotentRigidity.lean",
    "sha": "cb7128e5287191c40fcc5a39e55ee09fb9a62829",
    "checks": [
      [
        16,
        "theorem spMap_surjective {R R₀ : Type} [CommRing R] [CommRing R₀] (π : R →+* R₀)"
      ],
      [
        20,
        "  have h2 : PrimeSpectrum.zeroLocus (RingHom.ker π : Set R) = Set.univ := by"
      ],
      [
        31,
        "theorem eq_comp_section : ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (π : R →+* R₀), Function.Surjective π → IsNilpotent (RingHom.ker π) →"
      ],
      [
        40,
        "    forall_geometricallyIntegral_of_smooth_of_geometricallyConnected _ _ P.hom hsm hgc"
      ],
      [
        42,
        "    have := GlobalFunctions.isIso_app FlatFibreInjective.injective_baseChange"
      ],
      [
        43,
        "      exists_noetherian_model_of_smooth P.hom V"
      ],
      [
        49,
        "    refine local_rigidity _ _ _ P.hom ε f.left hε inferInstance hsurj t (s₀ t₀) ?_"
      ],
      [
        62,
        "  exact (P.left.openCoverOfIsOpenCover _ hc).hom_ext _ _ fun t => hfg t"
      ]
    ]
  },
  {
    "name": "AbelianLiftingOfDeRhamUnobstructed",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianLiftingOfDeRhamUnobstructed.lean",
    "sha": "271c5c0d12c40d2230c3df521256f39e9ebfc0f4",
    "checks": [
      [
        72,
        "theorem abelianLifting_of_schemeLifts :"
      ],
      [
        75,
        "  refine abelianLifting_of_sqLifting hD hU (GlobalTheory.T.squareZeroLifting_of_noetherian_case hD ?_)"
      ],
      [
        77,
        "  exact ⟨GlobalTheory.T.grothendieckMessingLiftAbelianScheme_of_squareZero hD R R₀ I hI π hπ hk (hL R I hI R₀ π hπ hk),"
      ],
      [
        78,
        "    GlobalTheory.T.grothendieckMessingLiftHomomorphism_of_squareZero hD R R₀ I hI π hπ hk (hL R I hI R₀ π hπ hk)⟩"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftAbelianSchemeOfSquareZeroStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckMessingLiftAbelianSchemeOfSquareZeroStatement.lean",
    "sha": "a4591047a5b6959a970e8593ff1ec6009be4ada4",
    "checks": [
      [
        13,
        "theorem _root_.GlobalTheory.T.grothendieckMessingLiftAbelianScheme_of_squareZero : AbelianDeRham → ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (I : Ideal R) (hI : I ^ 2 = 0) (π : R →+* R₀), Function.Surjective π → RingHom.ker π = I → AbelianSchemeLifts.At hI π → LiftObj (divided₂ hI) π := by"
      ],
      [
        14,
        "  first | exact @GlobalTheory.SqLift.liftObj_sq | exact GlobalTheory.SqLift.liftObj_sq | (intros; apply GlobalTheory.SqLift.liftObj_sq <;> assumption)"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftHomomorphismOfSquareZeroStatement",
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckMessingLiftHomomorphismOfSquareZeroStatement.lean",
    "sha": "5d748c8b2fc9816b156da7bc296a7abb536be3d9",
    "checks": [
      [
        13,
        "theorem _root_.GlobalTheory.T.grothendieckMessingLiftHomomorphism_of_squareZero : AbelianDeRham → ∀ (R R₀ : Type) [CommRing R] [CommRing R₀] (I : Ideal R) (hI : I ^ 2 = 0) (π : R →+* R₀), Function.Surjective π → RingHom.ker π = I → AbelianSchemeLifts.At hI π → LiftHom (divided₂ hI) π := by"
      ],
      [
        14,
        "  first | exact @GlobalTheory.SqLift.Hom.liftHom_sq | exact GlobalTheory.SqLift.Hom.liftHom_sq | (intros; apply GlobalTheory.SqLift.Hom.liftHom_sq <;> assumption)"
      ]
    ]
  }
]
```

### Current-head clump migration
```json
[
  {
    "name": "SquareZeroLiftingOfNoetherianCase",
    "start": 1822,
    "end": 1847,
    "anchors": 4,
    "matches": 3
  },
  {
    "name": "GrothendieckMessingLiftOfNoetherianCase",
    "start": 981,
    "end": 1292,
    "anchors": 46,
    "matches": 46
  },
  {
    "name": "LiftHomExistsOfNoetherian",
    "start": 1747,
    "end": 1795,
    "anchors": 12,
    "matches": 12
  },
  {
    "name": "PushMemLiftFilOfInjective",
    "start": 1620,
    "end": 1706,
    "anchors": 15,
    "matches": 15
  },
  {
    "name": "AbelianHomReductionDescendsFinitelyGenerated",
    "start": 1354,
    "end": 1585,
    "anchors": 16,
    "matches": 16
  }
]
```


---
## Appendix 52: specialists/positivity_geometry/RUN4_CHOW_HEIGHT_RECURSION_FINITE_ARCHIMEDEAN.md
Peer Git blob: 3d7c1202e9c9747096223d2cb2a2bb8fd7baac31; evidence status retained.

# Geometry run 4 — arithmetic Bézout recursion and Chow-height comparison
2026-11-24. RESULT: SOURCE-MATCHED local reconstruction of the finite/archimedean recursion, its dimension induction, and the model glue. Deep analytic and arithmetic existence leaves remain open; no kernel replay. Not a new RH proof.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, actual cathedral_arf_runner protocol/log, continuity, current CI summary (45373263454 PASS at 10:36:09 UTC, physical suite not RH verification), RUN3, latest editor and specialist handoffs. This is the distinct RUN3 frontier, not a repeat of metric scaling or the lower/counting-volume inequalities.
Source pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed cb4dc6e23a6187db392c96664295415c55b6b01e; pinned ChowFormHeightOfArch path 404 at that head. No equivalence across revisions claimed.

## Source ledger (all 14 pinned blobs re-fetched and 46 source anchors matched)
M=src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/
B=src/GroundTheory/HeightsAndTheta/Heights/ArithmeticBezout/
- M/ChowFormHeightOfArch.lean 6125310ae93f6438dd123609d603e26eeda73582 lines 14,15,16.
- M/GenIdeal.lean 10ebca1592125bca23c10ddac5eda40a3124d836 lines 92,126,77,104; full definitions StPts/StPull/StDiv/StVert/StCharts/StArch/StForm/StModel/StDim/StMain at 56–135.
- M/IsClosedOfCoheight.lean 8341150d5b8cfba3ffce52c7b969063abdcf658f lines 382,338,431,565,641,657,673; full core argument 271–680.
- M/SumNormSqUnitary.lean ba8001ffbb63f1c5fd63072b1be0e9911d455435 lines 64,80,91.
- M/FormHeightOneEq.lean 9d0aa18a4027c472ef9db40b30b8aa719629576e lines 53,131,111.
- M/IntegralOfLintegral.lean f4fc3a54cc5497db9ae6bc623265421bab42fcbf lines 22,118,186,194,207.
- M/StCharts.lean 72c1aaec797d4e62d1f49a4040ec37f3dd58625a lines 50,83,102.
- M/SpecializesIff.lean 98fa12ea4f56cac9fcf53a77807e2041b8a27d85 lines 276,306.
- B/Statements.lean 631ffa68c7ab0b2945864057ea600a61d64f3f4c lines 195,121,166,247,226.
- B/PRecursion.lean 35a3b54f4e89d741d029d27c05c7cd005285a478 lines 45,58,71,81.
- B/OfLeaves.lean 71029ac4e3add2b4c88466e0875a969937a62e19 line 44.
- M/DescEval.lean fbebe406f2346255efdb9c3a1aad646c9587d57b lines 77,110.
- M/ChowDegreeSection.lean ec5834d2108dad605a1316891f8cd7f73f809423 lines 146,19.
- src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/ChowFormHeightComparison.lean 8f6936bdac95711b138b0ee63cf5928518c89503 line 10 (two anchors).
Additional direct inspection: B/Assembly.lean bfc6dfcef3b6d8154e79a9be24606b49a82696e9; src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuSelfKnownTheorem.lean bf0cd8253466990e7c7e54b1f7a9fa726f5d3a44; src/Development/AutomorphicSpectrum/Proofs/AlgebraProofs/MahlerSectionStatementHoldsStatement.lean f4b35dcacb448ec2296d774393267d5f26c94574. These are not included in the 14 repeat-fetch assertion count.

## 1. Exact normalization and premises
Let K be any number field, k=[K:Q]>0, n the number of homogeneous coordinates, e the relative dimension, delta a natural, H a Hermitian norm family with conjugate compatibility, I a relevant homogeneous projective prime over K, f its Chow form in e+1 blocks, of degree delta in EACH block, and u an integral coefficient vector over O_K such that its linear form l_u is not in I. These are exactly the premises of ChowHeightRecursion.Statement, with all quantification in B/Statements:247–259. No positivity of height or logs is assumed. Set g=specFirst(f,u), the polynomial obtained by substituting u in the first block; e blocks remain. For each finite place v, write F_v(f)=log gaussNorm_v(f), where gaussNorm is the maximum of the local absolute values of coefficients on the finite support. Write M_sigma(f)=mahler(H_sigma,e+1,f mapped by sigma). Set c=harmonic(n-1)/2. The exact source definition of normalized Chow height is
  k C_{e+1,delta}(f) = sum_v F_v(f) + sum_sigma [M_sigma(f)+(e+1)delta c].
Every complex embedding is counted, not one from each conjugate pair. The formula uses log(norm), not log(norm squared); its harmonic correction is essential. The corresponding formula for g has e delta c, not (e+1) delta c.

For each v define V_v as the sum over relevant components W of the integral-model hyperplane intersection whose contraction to O_K is v:
  V_v = sum_W localMult(W) * chowDegree(reduceMod_v W,e+1) * log(absNorm(v)).
The ideals defining localMult and the index set are exactly integralModel(I)+span(l_u) in Statements:112–129; the vertical term is V=sum_v V_v. Define
  J_sigma = cycleIntegral(H_sigma,fundCycle(I extended by sigma),e,fsLog(H_sigma,sigma(u))).
Here fsLog is log(|sum u_j y_j|/dualNorm(y)), dualNorm(y)=|| (H.mat^T)^(-1)y ||_2. Cycle integral is a multiplicity-weighted sum of normalized Hausdorff integrals over the cone unit ball, real dimension 2(e+1); the denominator is the measure of the standard coordinate ball of that dimension. Keep the exact source conventions for Real.log at zero (Lean totalizes it); do not infer integrability merely from the formula.

## 2. Exact finite and infinite place cancellation (PRecursion.proof)
Four explicit input theorems: ChowFormSectionVertical.Statement, MahlerSection.Statement, ChowFormBaseChange.Statement, BaseChangeAvoid.Statement. These are NOT discharged by algebra.
The finite-place theorem says F_v(f)-F_v(g)=V_v. The source uses log_gaussNorm_support_finite for nonzero f, splits g=0 versus g≠0 using Lean's total log to establish finite support, and bounds support of V by the union of the two supports. Consequently summing is legitimate:
  F(f)=F(g)+V.
BaseChange identifies the complex Chow cycle and its projective primes; BaseChangeAvoid proves the linear form avoids every component. Mapping the first specialization commutes with coefficient embedding by map_specFirst. MahlerSection applied to the mapped multihomogeneous form then gives
  M_sigma(g)=M_sigma(f)+delta c+J_sigma.
Thus
  M_sigma(f)+(e+1)delta c=M_sigma(g)+e delta c-J_sigma.
Summing these equations and dividing by k proves the desired recursion:
  C_{e+1,delta}(f)=C_{e,delta}(g)+(V-sum_sigma J_sigma)/k.
This exact sign is necessary. The infinite-place contribution is SUBTRACTED. Omitting the harmonic correction or double-counting conjugates changes the normalization. The four leaves are supplied at CF.chowFormHeight_of_arch by ChowFormSectionVertical.full, hM, ChowFormBaseChange.full, BaseChangeAvoid.full; OfLeaves:44 passes them straight to the proof. The actual hM producer is T.mahler_section_statement_holds, forwarding to GlobalTheory.CompanionTheory.Ar.Short.mahlerSection, not a standalone verified assertion in this note.

## 3. Why the geometric height obeys the same recursion (IsClosedOfCoheight)
Assume an integral ambient arithmetic variety X over Spec O_K, Hermitian line bundle L, section embedding Emb, compatible FS norms for each embedding, and an arithmetic height function h satisfying L.IsArithHeight. For each horizontal integral closed immersion i:Z→X of topological Krull dimension e+1 assume contraction of its generic-point ideal Q to O_K is zero, and take f the Chow form of Q extended to K of block degree delta. This is the exact scope of core and core_lemma. The statement is h(i eta_Z)=k C_{e+1,delta}(f). In particular e is a relative dimension, not the dimension of the arithmetic scheme.

StPts identifies points with projective primes, inclusion with specialization, provides existence of points above the generic ideal and equivalence between a section's nonzero locus and the linear form avoiding that prime. StPull preserves these on closed immersions. By covering, choose a generating section s_j nonzero at the generic point, and u the jth unit coefficient vector. The prime contraction and localization map/comap ensure l_u avoids the generic K-ideal. StDiv identifies the nonzero Cartier multiplicities mu_z with the relevant components of Q+span(l_u) and their local multiplicities. Its actual proof begins in SpecializesIff:306 with a nonzero chart, Noetherian coordinate domain, and the height-one characterization of minimal primes over a nonzero principal ideal; no independent replay of all local length isomorphisms here.

The arithmetic height axiom and step give
  h(i eta_Z)=sum_z mu_z h(i z)-sum_sigma J_sigma.
For e>0 this uses recursion_sec; e=0 uses curveDeg_sec plus closedPoint values, with all complex points lying above the generic point, and the zero-dimensional archimedean sum. Embeddings O_K→C are in bijection with K→C (bijective_comp). No multiplicity 2 is inserted. Relevant components are finite by Noetherianity; injectivity of the point-ideal map and point existence establish a bijection with the finite nonzero-divisor support. Each closure Z_z is an integral closed subscheme of dimension e by stDim and coheight one.

Partition the finite sum into vertical components (nonzero prime contraction to O_K) and horizontal components (zero contraction).
* Vertical: height_vertical proves h(i z)=chowDegree(reduceMod_v W,e+1) log(absNorm(v)); this uses StVert's top self-intersection over the residue field and finite residue-field cardinality equals absNorm. Then vertTerm_eq identifies the sum of mu_z h(i z) exactly with V, not just an upper bound.
* Horizontal: divCycle_eq identifies the horizontal divisor weights with the generic-fibre cycle. ChowFormSection supplies g=c0 product_W f_W^(mu_W), c0 nonzero, all f_W nonzero Chow forms. For e>0, each factor has a block degree delta_W (exists_isMultiHomog_of_isChowForm_dvd), and uniqueness of the weighted degree of nonzero g gives delta=sum_W mu_W delta_W. By the induction hypothesis h(i z)=k C_{e,delta_W}(f_W) on each horizontal closure. Multiplicativity of Chow height and scalar product formula (chowHt_C_mul_prod) give sum_horizontal mu_z h(i z)=k C_{e,delta}(g). These are real dependencies; polynomial factorization by itself is not the height equality.
* At e=0, horizontal section cycle is empty: a projective prime cannot have a Chow form with zero blocks, using ProjPrimeHasPoint and not_isChowForm_zero. Then g is a nonzero scalar, and C_{0,delta}(g)=0 by chowHt_zero_groups_eq_zero. The horizontal sum is zero; no induction hypothesis at negative dimension is used.

Substitute the vertical and horizontal identities into the geometric recursion to obtain h(i eta_Z)=k C_e(g)+V-sum_sigma J_sigma=k C_{e+1}(f). The induction is precisely on e, with arbitrary closed immersed Z at each stage. stMain_of applies this to i=id and a witness h for L.IsSelfInter(a), using ambient charZero and dimension. Thus a=k C_{e+1,delta}(f). This derives the equality from the original premises, not a general unconditional intersection theorem.

## 4. Archimedean geometric bridge (actual stArch supplier)
GenIdeal:92–103 quantifies over K, integral Z, p, LB B, m sections s, e, Emb, IsArithVar, existence of Chow form of genIdeal, IsProjPrime, embedding sigma, smooth metric phi, HermNorm, IsFS, and u avoiding genIdeal. It asserts equality of chernInt on the nonzero-linear-form locus with J_sigma, and at e=0 also equality of the finite sum over complex points with J_sigma.
StCharts constructs a homogeneous q avoiding the generic prime whose nonvanishing locus admits algebraic etale charts. The construction in StCharts:50–99: complement of the generic etale open is a finite union of irreducible closed components; each generic prime contains a homogeneous polynomial absent from the ambient generic prime. Product q avoids the ambient prime by primality, and vanishes along every complementary component by specialization. StPts supplies these ideal-point properties, with stPts at SpecializesIff:276. The etale chart theorem is a separate geometric input.
IntegralOfLintegral:118–210 implements stArch. Cone-side lemmas give integrability, cycle identification and a null exceptional set including zero and q=0; q remains nonzero after localization. The function fsLog is invariant under nonzero complex scaling, since numerator and denominator acquire the same absolute scalar. Using measurable coordinates, chart coverage off the null set, and C.lintegral_cone, for every nonnegative measurable G the unnormalized cone integral of G(fsLog) equals b times the Chern-measure integral, where b is the positive finite coordinate-ball mass. The exact lemma integral_of_lintegral:22–40 converts this to equality for signed fsLog: test G=abs in extended nonnegative reals to infer integrability, then G=positive part and G=negative part; subtract and divide by b.toReal≠0. No sign assumption on fsLog is needed. With IsFS and smoothness, chernPart_neg=0; outside the section's nonzero locus the source totalized log is zero, so the signed integral agrees with chernInt. For e=0 all complex points admit charts because their underlying scheme point is generic; each chart source is a singleton. Compact discrete space is finite, and the zero-dimensional Chern measure is counting measure, proved via chart density one. This supplies both clauses of StArch. Cone-side integrability, null exceptional set, C.lintegral_cone (Jacobian and measure comparison), etale charts and all original hypotheses remain explicit obligations. We have reconstructed the glue, not independently proved those deep analytic ingredients.

## 5. Model glue to actual target
CF.chowFormHeight_of_arch accepts StArch, MahlerSection.Statement, Published.ArExists and explicitly composes stVert(stPts,stPull,stDiv), the four-leaf recursion, ChowFormSection.full, ChowHeightMul.full and ProjPrimeHasPoint.full into StMain. Then glue receives StMain, StModel, StForm and ArExists. Full ChowFormHeight hypothesis list is at VuSelfKnownTheorem:12–25, preserved in RUN3: number field, extension field, d,N,m,delta, spanning g, invertible conjugation-compatible A, coordinates y, projective closure RatModel, arithmetic variety, integral Chow form Phi, line bundle with generic trivialization, section valuations and nonzero-locus cover, invertible Mt with conjugate-unitary relation and exact norm-square identity.
DescEval.stModel gives section embedding and equality of the generic ideal to the cone ideal on coordinates g^T y. FormHeightOneEq.stForm uses a right inverse P of g (gP=1) from spanning columns, preserves irreducibility and block degree and transports incidence zeros in both directions; the image cone satisfies x=g^T P^T x. It identifies formHeight(delta,g,A,Phi) with C_{d+1,delta}(linSubst(g,Phi)), using equality of local Gauss norms, block-sphere means and the exact dual-norm relation; no assumption of square g. In glue, construct H_sigma from Mt^{-1}. Unitary conjugation proves compatibility; the dual norm is the square root of the supplied sum of squared norms. The first projection of hAr applied to the FS bundle yields an arithmetic height witness h0 satisfying IsArithHeight. This is the actual arExists input, not proved here or deemed an axiom merely because of the namespace. The FS norm formula proves the needed IsFS for every embedding. Apply StMain to h0(eta) and rewrite via the StForm height equality. Hence IsSelfInter(k*formHeight(delta,g,A,Phi)). This is the exact ChowFormHeight target used in RUN3. Actual caller uses h.p4.arExists and the Mahler producer above. The deeper producer of ArExists still needs tracing.

## 6. Executed reproducible local checks
Re-fetched all 14 primary blobs above and checked 46 literal anchors at recorded lines. Actual V8 BigInt execution, all assertions passed:
- 1,377,810 exact scalar recursion instances (arbitrary integer multiples of a common unit; not real analytic integrals).
- 1,180,980 wrong-sign negative controls, detecting every nonzero J in that grid.
- 86,436 exact weighted block-degree/multiplicative correction instances.
Equivalent replay (Python version supplied for portability, not executed here; V8 version executed):
```python
from itertools import product
cases=bad_sign=weighted=0
for e,d,h,F,A,V,J in product(range(9),range(9),range(6),range(-4,5),range(-4,5),range(5),range(-3,4)):
    before=F+V+A-d*h-J+(e+1)*d*h
    after=F+A+e*d*h
    assert before==after+V-J
    cases+=1
    if J:
        assert before!=after+V+J
        bad_sign+=1
for a,b,d,e,H,G in product(range(1,7),range(1,7),range(7),range(7),range(-3,4),range(-3,4)):
    delta=a*d+b*e
    k,c=3,5
    assert a*(H+k*d*c)+b*(G+k*e*c)==a*H+b*G+k*delta*c
    weighted+=1
assert (cases,bad_sign,weighted)==(1377810,1180980,86436)
print(cases,bad_sign,weighted)
```
These are checks of the scalar reconstruction, not proof of native geometric hypotheses, actual integration, or independent Lean validation. No source assumptions discarded. No global coverage percentage or URT advantage claimed.

RESUME HERE: reconstruct the distinct SmallSectionsInject producer Xj7N.small_sections_injective(NV) from TopCovolSlim2Use and trace small_sections_injective_of_self_intersection_bound, locating the exact regularity and norm comparison establishing the injection at degrees 8i. Also retain the open CF.C.lintegral_cone and ArExists producer as separate geometric leaves for subsequent sessions; do not redo the Chow-height recursion, metric shift, or counting normalization. HANDOFF TO: integration, editor, audit, literature, theta. Mark the Chow-height equality as source-matched conditional on the exact listed native inputs, not kernel-certified. No physics changes.


---
## Appendix 53: specialists/prime_window/RUN4_ARITHMETIC_FOURIER_BALANCE.md
Peer Git blob: 7e917163215cfc1bf8eade7d02d7b9e58041d7f9; evidence status retained.

# RUN4 — arithmetic Fourier balance (2026-11-24)

RESULT: SOURCE-MATCHED conditional human proof of ASK−MAIN=De with executed finite regression. No full RH translation, Lean replay or URT speedup. Read swarm protocol, queue, expansion, AGENTS, continuity, research state, runner log/protocol, prior prime chapters and relevant peer math, integration, Landau, character-box, kernel and acceleration handoffs. This is not geometric Data.key_identity. Physical CI #360 PASS 09:58 UTC is unrelated.

## Immutable sources
All RH paths relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/. Upstream observed HEAD 73958da58a8a4d1f61b789745c5444baf6247cae (09:50:10 UTC, merge #1005), changed since c9883164b0b3d762cee21f889d03d59a53b3ba3b. At HEAD the two principal blobs are d0498cdde8640558c61c6d342dd618e88b89f7a1 and aa851c8306664ea7e17cd99e5b405eaf817d906f, unchanged from run3 observation but not the original pin. At HEAD StronglyIrreducible has 477 rather than 770 lines and no declaration named colour_balance or characterSum_expansion in that file. No assertion of removal from whole repository or transitive equivalence. Continue original pin.

- src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean, blob 18deb7cb85d6f650a69f01fda6e0c789b9f04d89: 15–34 partner/chC; 38–59 ArithData/HostFacts; 61–70 cosetMean/primVal/GPsi; 72–101 ASK/MAIN/De/AskMainBalance; 103–138 predicates.
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean, blob 94a385f59f3781ae6b1ab4beddc73850708a2bc6: 47–83 partner sum/ortho; 131–211 cardinality, partner_bijection, colour_sum; 213–259 primitive_value_trivial/pow/double_coset_singleton; 266–328 ortho_coset, orthogonality_ramified/unramified; 335–410 sum_vonMangoldt_primePow/cutoff; 412–516 local kernels; 523–605 characterSum_expansion; 612–688 term_real/sum_cut/inner_eq; 695–765 colour_balance.
- src/Formalism/ThickAverageLoss/PartnersToFactorsAt.lean, blob d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af, 13–29 E0/InPhi/cconj/topPl/PhiSet; 47–69 related real Balance (not identical).
- src/Formalism/StatementOC.lean, blob 12ab19c0176bd4135c2b23a7ee3ac22888df0122, 11–13 Sz/Gz.
- lake-manifest.json blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f: locks Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Mathlib locked sources: Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean blob 3918dfeacbc483dc9304f9dc26e147e5568ee427, card_eq 101–109, doubleDualEmb_injective/bijective 151–161, sum_apply_eq_ite 188–190. Mathlib/Algebra/Group/AddChar.lean blob 0c9bc3c17393f14fd740b8f357d65654dc8da09d, sum_eq_ite 329–336. Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean blob 619b123068af91959127d951a3074884064b0a16, expect_eq_ite 35–36, wInner_cWeight_eq_boole 60–66. Dual cardinality and separation follow from finite abelian cyclic decomposition; evaluation at a nonzero group element is a nontrivial character of the dual. Translation invariance gives zero character sum by multiplying by a character value unequal to 1 and cancelling; at zero every summand is 1. These are actual source leaves, not extracted kernel edges.

## 1. Exact hypotheses
H any finite additive commutative group with decidable equality. G=(Z/2)^2×H, Phi={g:first bit=0}, B={g:first bit=1}, M=|Phi|=|B|=|G|/2>0. c=((1,1),0), s=((1,0),0), top(t)=((0,0),t), P_t(g)=c+g+top(t). Translation gives bijection B→Phi, inverse rho−top(t)−c. chC(g)=(-1)^firstBit(g); zero AddChar means trivial function 1.

Fix ANY ArithData D satisfying all HostFacts: q1,d distinct primes neither 2; for prime p other than 2,q1,d, I_p={0}; at p=2 or q1, I_p and Frob_p lie in Phi; I_d={0,s}. No condition on Frob_d. Fix arbitrary ell:Ghat→C, real a>0, t∈H, w:G→R positive at every rho∈Phi, and N∈Nat with a/w(rho)≤N for every rho∈Phi. No positivity outside Phi; no property of ell required. Original order: D→HostFacts→ell,a,t,w→positivity→N→uniform cutoff.

## 2. Local Fourier projector and prime expansion
A_I(h,psi)=Σ_{x∈I}psi(h+x)/|I|. Define v_psi(n)=product over p|n of A_{I_p}(v_p(n)Frob_p,psi). Thus for p prime, i≥1, v_psi(p^i)=A_{I_p}(i Frob_p,psi), and v_0(n)=1. Define K(n,g)=M^{-1}Σ_psi conjugate(psi(g)) v_psi(n), F(n,g)=max(a/n−w(P_t(g)),0).
With h=i Frob_p, finite orthogonality gives
K(p^i,g)=(M|I_p|)^{-1}Σ_{x∈I_p}|G| 1_{h+x=g}=(2/|I_p|)1_{g−h∈I_p}.
The subgroup contains 0, so its cardinality is positive. This is ortho_coset and orthogonality_ramified, without HostFacts for this generic formula.

Unramified p distinct from 2,q1,d: K=2 when g=h, 0 otherwise; if Frob_p∈Phi no multiple enters B; if Frob_p∈B precisely odd i enter B. At p=2 or q1 the entire coset lies in Phi, hence K=0 on B. At p=d the coset h+{0,s} has exactly one element in B (opposite first bits), coefficient 1, for EVERY i regardless of Frob_d. This explains local_unram/local_split/local_d and double_coset_singleton.

For n>N, w(P_t(g))>0 and a/w(P_t(g))≤N<n imply F=0. Reindex the finite Mangoldt sum by p prime≤N, 1≤i≤N, only p^i≤N contributes, unique prime-power representation, i<p^i≤N, Lambda(p^i)=log p not i log p. If d>N its separately written ASK term vanishes as well. No infinite sum or limit exchanged.

Exactly source ASK =
2 Σ_{p≤N,IsInert(p)} log p Σ_{1≤i≤N,i Frob_p∈B} F(p^i,i Frob_p)
+ log d Σ_{1≤i≤N}Σ_{g∈B∩(i Frob_d+I_d)}F(d^i,g).
Consequently
ASK = Σ_{n=1}^N Lambda(n)Σ_{g∈B}K(n,g)F(n,g)
= (1/M)Σ_{g∈B}Σ_psi conjugate(psi(g))Σ_{n=1}^N Lambda(n)v_psi(n)F(n,g).
This is characterSum_expansion as complex equality, not merely real parts.

## 3. Inner sum and correction
For g∈B let W=w(P_t(g))>0, y=a/W>0, L=floor_nat(y)≤N. F(n,g)=a/n−W if n≤L, zero otherwise; integral endpoint has zero weight, y<1 gives empty sum. Since a/n−W=W(y/n−1), use GPsi:
GPsi_0(y)=Gz(y)=Sz(y)−y log y+(1+gamma)y, Sz(y)=Σ_{n=1}^{floor_nat(y)}Lambda(n)(y/n−1).
GPsi_psi(y)=Σ Lambda(n)v_psi(n)(y/n−1)+y ell(psi) for psi≠0.
The inner sum is W GPsi + C_psi(W), where
C_0(W)=a log a−a log W−(1+gamma)a,
C_psi(W)=−a ell(psi) for psi≠0.
Use W y=a and log y=log a−log W (positive arguments). This is sum_cut and inner_eq.

The indicator of B is (1−chC)/2. Ordinary character orthogonality for psi and psi*chC gives Σ_{g∈B}conjugate(psi(g))=M if psi=0, −M if psi=chC, 0 otherwise. chC is real, order 2, nontrivial (at s gives −1). This proves colour_sum.

Substitute inner expansion: the GPsi terms give De=(1/M)Σ_{g∈B}Σ_psi conjugate(psi(g)) W GPsi(a/W).
The nontrivial correction is (−a ell(chC))(−M)/M=+a ell(chC). The trivial correction, using partner bijection, is a(log a−1−gamma)−(a/M)Σ_{rho∈Phi}log w(rho). Thus their sum is MAIN=a[log a−1−gamma+ell(chC)−(1/M)Σ_{rho∈Phi}log w(rho)]. Hence ASK=De+MAIN, or ASK−MAIN=De, the exact conditional colour_balance. The normalization M, order-two inertia and colour sum explain respectively factor 2, factor 1 and PLUS sign of ell(chC). No analytic estimate, no global host existence, no RH conclusion.

## 4. Executed finite checks
V8, Gaussian integer roots for H=0,C2,C4,C2×C2; subgroups generated by up to two elements plus whole group (not exhaustive in rank four). Clear subgroup means by |G|, rational weights by 2*lcm(1,...,N). Distinct q1,d, split inertia and Frobenius, shifts, positive weights only on Phi, N=1..16, y<1, equality at cutoff and d>N. Compare each coefficient of log(p) exactly, not numeric logarithms. MAIN checks use independent integer stand-ins for log a/log W/gamma and complex ell; the symbolic proof supplies actual logarithmic identities. All assertions passed; no Lean replay.

~~~json
{
  "groups": 4,
  "subgroups": 99,
  "cosets": 21072,
  "colour": 44,
  "singletons": 44,
  "fixtures": 1128,
  "cutoff": 44328,
  "primeCoefficients": 7896,
  "mainCorrection": 1128,
  "negative": 16
}
~~~

Same function executed; save as JS and run node.
~~~js
function check(){
 const plus=([a,b],[c,d])=>[a+c,b+d], mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c], conj=([a,b])=>[a,-b], eq=([a,b],[c,d])=>a===c&&b===d, scale=([a,b],k)=>[a*k,b*k];
 const roots=[[1,0],[0,1],[-1,0],[0,-1]],mod=(a,n)=>(a%n+n)%n;
 const assert=(v,s)=>{if(!v)throw Error(s)};
 const C={groups:0,subgroups:0,cosets:0,colour:0,singletons:0,fixtures:0,cutoff:0,primeCoefficients:0,mainCorrection:0,negative:0};
 for(const h of [[],[2],[4],[2,2]]){
  const ds=[2,2,...h], es=ds.reduce((a,d)=>a.flatMap(x=>Array.from({length:d},(_,i)=>[...x,i])),[[]]), G=es.length,M=G/2;
  const ids=new Map(es.map((x,i)=>[x.join(),i]));
  const add=(a,b)=>ids.get(es[a].map((x,i)=>(x+es[b][i])%ds[i]).join());
  const times=(a,k)=>ids.get(es[a].map((x,i)=>mod(x*k,ds[i])).join());
  const B=es.map((x,i)=>i).filter(i=>es[i][0]===1), P=es.map((x,i)=>i).filter(i=>es[i][0]===0);
  const s=ids.get([1,0,...h.map(()=>0)].join()),c=ids.get([1,1,...h.map(()=>0)].join());
  const V=es.map(u=>es.map(v=>roots[mod(u.reduce((r,x,i)=>r+x*v[i]*4/ds[i],0),4)]));
  const subs=new Map();
  for(let a=0;a<G;a++)for(let b=0;b<G;b++){
   const set=new Set();for(let i=0;i<4;i++)for(let j=0;j<4;j++)set.add(add(times(a,i),times(b,j)));
   const I=[...set].sort((a,b)=>a-b);subs.set(I.join(),I);
  }
  const full=es.map((_,i)=>i);subs.set(full.join(),full);
  const means=(I,x)=>V.map(row=>scale(I.reduce((r,i)=>plus(r,row[add(x,i)]),[0,0]),G/I.length));
  const kr=(mv,g)=>mv.reduce((r,v,u)=>plus(r,mul(conj(V[u][g]),v)),[0,0]);
  C.groups++;C.subgroups+=subs.size;
  for(const I of subs.values())for(let x=0;x<G;x++){
   const mv=means(I,x), co=new Set(I.map(i=>add(i,x)));
   for(let g=0;g<G;g++){assert(eq(kr(mv,g),[co.has(g)?G*G/I.length:0,0]),"coset");C.cosets++;}
  }
  for(let u=0;u<G;u++){assert(eq(B.reduce((r,g)=>plus(r,conj(V[u][g])),[0,0]),[u===0?M:u===s?-M:0,0]),"colour");C.colour++;}
  for(let x=0;x<G;x++){assert([x,add(x,s)].filter(g=>B.includes(g)).length===1,"singleton");C.singletons++;}
  const split=[...subs.values()].filter(I=>I.every(g=>P.includes(g))),ts=P.filter(t=>es[t][1]===0);
  for(let j=0;j<6;j++){
   const q=j%2?7:3,d=[5,11,17][j%3],t=ts[j%ts.length],partner=g=>add(add(c,g),t),W=es.map((_,g)=>P.includes(g)?1+(g+j)%4:-3);
   const I=p=>p===d?[0,s]:p===2||p===q?split[(p+j)%split.length]:[0];
   const F=p=>p===2||p===q?P[(p+j)%M]:(p+j*3)%G;
   for(let N=1;N<=16;N++){
    const gcd=(a,b)=>b?gcd(b,a%b):a;let L=1;for(let n=1;n<=N;n++)L=L*n/gcd(L,n);
    for(const a of new Set([1,2*N,Math.max(1,2*N-1)])){
     assert(P.every(g=>a<=2*N*W[g]),"hypotheses");C.fixtures++;
     for(const p of [2,3,5,7,11,13,17]){
      let ask=0,ft=[0,0],de=[0,0];
      for(let i=1,n=p;i<=N;i++,n*=p){
       if(n>N){assert(B.every(g=>a<=2*n*W[partner(g)]),"tail");C.cutoff++;break;}
       const x=times(F(p),i),mv=means(I(p),x);
       const weight=g=>a*(L/n)-2*L*W[partner(g)];
       for(const g of B){
        const raw=weight(g),clip=Math.max(raw,0),cut=2*W[partner(g)]*n<=a?raw:0;
        assert(clip===cut&&Number.isSafeInteger(raw),"clip");C.cutoff++;
        ft=plus(ft,scale(kr(mv,g),clip));
        if(2*W[partner(g)]*n<=a)for(let u=0;u<G;u++)de=plus(de,scale(mul(conj(V[u][g]),mv[u]),cut));
       }
       if(p===d){for(const g of [x,add(x,s)])if(B.includes(g))ask+=Math.max(weight(g),0);}
       else if(p!==2&&p!==q&&B.includes(F(p))&&B.includes(x))ask+=2*Math.max(weight(x),0);
      }
      assert(eq(ft,[M*G*ask,0])&&eq(de,ft),"prime coefficient");C.primeCoefficients++;
     }
     const A=3+j,gamma=j-2,T=g=>2*g-j,ell=u=>[u-j,2*u+1];let corr=[0,0];
     for(const g of B)for(let u=0;u<G;u++){
      const v=u===0?[-a*(A-T(partner(g))-1-gamma),0]:scale(ell(u),a);
      corr=plus(corr,mul(conj(V[u][g]),v));
     }
     const main=plus([a*(M*(A-1-gamma)-P.reduce((r,g)=>r+T(g),0)),0],scale(ell(s),a*M));
     assert(eq(plus(corr,main),[0,0]),"main");C.mainCorrection++;
    }
   }
  }
  assert(!eq(kr(means([0],s),s),[M*G,0]),"wrong normalization");C.negative++;
  assert(eq(kr(means([0,s],0),s),[M*G,0]),"special prime coefficient");C.negative++;
  assert(!eq(B.reduce((r,g)=>plus(r,conj(V[s][g])),[0,0]),[0,0]),"missing colour");C.negative++;
  assert(Math.max(5/2-1,0)>0,"bad cutoff");C.negative++;
 }
 return C;
}
console.log(check());
~~~

Independent audit request: verify original HostFacts and quantifier order, i≥1, locked Mathlib duality, d>N, complex equality and chC correction sign. Find actual caller of colour_balance rather than conflating this with the related real Balance.

RESUME HERE: trace concrete callers of characterSumData.colour_balance/AskMainBalance into arithmetic-to-geometric adapter, D5.Balance, CycHost/GC and exact ASK/MAIN/De versus real askTop/ledTop/balTop; preserve real-part conversion and host compatibility. Locate HostFacts producer for actual ch_top host or if claimed elsewhere reconstruct finite-sum adapter. Do not redo local Fourier or geometric Data.key_identity. Preserve source hashes and trust edges.
HANDOFF TO: audit, integration, editor, math, Galois, character boxes and Landau. Project OPEN.


---
## Appendix 54: specialists/theta_lifts/RUN4_BASE_SCALAR_ORTHOGONALITY.md
Peer Git blob: e798b42a2ce2ce13d97c9513b96ba80a143c6509; evidence status retained.

# Theta lifts run 4 — the base scalar follows from orthogonality and a nonzero coefficient

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the actual proof of GlobalTheory.ThK.Dbl.polZero_of, conditional on its nine original hypotheses, with a finite exact algebra check. This supplies the p=q=0 base-case proportionality argument for the signature induction in RUN2. It does not close the upstream suppliers of those hypotheses or establish kernel validity.

## Continuity and source revision
Read swarm protocol, queue (including blueprint caveats), expansion, AGENTS and continuity, actual runner log/protocol, previous theta runs 2/3, integration spine, recent acceleration/kernel, Galois, character-box, prime, Landau, literature and geometry lane handoffs. Physical orchestrator PASS 45369968953 at 10:17 UTC is unrelated to RH. Original upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream main fb990c7fb2d7e01039a22116b38c31457e56a796 (10:21:15 UTC, PR 1006 merge); pinned LatticeBasics/PolZero.lean path now returns 404, while Reductions/TopPolarZero/PolZero.lean at current head (blob 6bc5abdaf8999a267bc96aa7541b435d49ed4e09) now contains a theorem polZero_of. CTSmallCone at current head blob c060a18889275f7134946b2a34c8e1512aeb78f4. Do not infer equivalence of moved proofs. Work solely on pinned original. Dependency/acceleration lane still lacks a complete authenticated export in its latest handoff. Examined further 17 candidate source files in the theta subtree; exact original lInt2 declaration body remains not located. RUN3's conditional hFE dependency remains OPEN, not an axiom finding. Following RUN3's fallback, reconstruct polZero_of independently of lInt2.

## Source ledger
T = src/Development/WeilBound/ThetaLifts/; A = src/Development/AbelianVarietyTheory/.
- P: T/LatticeBasics/PolZero.lean, 1c4df9613cd7ab9604ec9aca188ccaa1685df842, lines 14–109 (I_left, swap_bdd, int_th, polZero_of).
- Q: T/LatticeBasics/PairsStable.lean, 15cdb3b0663f439d9ce45052db1299255f4196c9, 19–31 (pet, th, pairs, comb), 96–101 (ThConst), 114–129 (HermLine, CoefLine).
- C: T/LatticeBasics/FdEqZero.lean, 5a71acf351e947b2bef53cba29a0166d2bfce192, 17–46, 58–68, 80–122 (CptAll, boundedness, rapid, nonzero volume, norm-zero).
- S: A/Definitions/Divisors/CTSmallCone.lean, 59578c7a38cc131fdab95da5541523c42a5b159e, 106–108 (PolConst), 203–208 (MatchEx), 229–232 (NonZeroAn), 313–315 (PolZero).
- W: T/Reductions/TopPolarZero/PolZero.lean, 53e3dd1eecd90129f30180a66820109d0c8b54be, 35–45 (polynomial_vanishing_of_compactness).
- H: T/LatticeBasics/HermCpt.lean, 24ccc3389ccf5d1d062d587f14ec4d3f4775b508, 205–207 (hermLine_of').
- L: T/LatticeBasics/CoefLine.lean, aef065b49dd25f8c44f8a84762661e4c2e1682b5, 13–15 (coefLine_of).
- K: T/LatticeBasics/ThConst.lean, f28b691ef966c0a961bcafa3df32b74a89fdeebf, 134–136 (thConst_of; a related theorem, not a claim that this is the exact body of W's thConst_of').

## 1. Exact statement and all nine premises
Fix the original number fields F,E, Algebra F E, involution sigma, base B, ranks a,a', geometry G, characters X, representations om,om', real/finite matching maps R,Rf, and h:IsMatched B G X om om' R Rf. Keep all IsMatched/triple hypotheses and the typeclasses. Assume G.p=G.q=0. Then PolZero means there is one complex c != 0 such that for EVERY pair of test functions (Phi,Phi') with Phi' in G.M'.So B.psi B.tau_1 and PolMatch B G X R Rf Phi Phi', and EVERY adelic group element g, we have
  G.M.I om Phi(g) = c G.M'.I om' Phi'(g).
The actual theorem P polZero_of takes nine explicit propositions: CptAll, HermLine, CoefLine, ThConst, NonZeroAn, MatchEx, ThetaBasic, PositivityTheory.ThKF.ICont, PolSch. None is removed or replaced by a claim that a published theorem is true.

Let Y denote the matching-pair set in Q. For y=(Phi,Phi') in Y put A_y=G.M.I om Phi, B_y=G.M'.I om' Phi', C_y(s,t)=s A_y+t B_y. Write P_W(f,g)=integral_D f(h) conjugate(g(h)) dmu(h), linear in FIRST argument. The same notation P_V' refers to the original G.M'.mu and G.M'.dom. A norm here is the corresponding L2 squared norm, not a vector norm imposed by URT.

- CptAll supplies compact-cover/fundamental-domain/finite-measure data on W and V' from the definite signatures. Not compactness of the entire adelic group.
- MatchEx gives (m1) a permitted matching Phi' for every polynomial Phi, (m2) a matching Phi for every polynomial Phi', and (m3) polynomial membership and full Match for every y in Y. The second direction alone does not certify membership in So: the NonZeroAn witness supplies that separately.
- ThetaBasic, ICont and PolSch provide continuity and rational left-invariance via Schwartz membership for the lifts; products are integrable by compact-cover boundedness and finite restricted measure (P 52–71). Cpt.rapid then supplies exactly the rapid condition required by ThConst.
- NonZeroAn supplies a polynomial Phi0 with A_Phi0 nonzero as a function, and a polynomial Phi' in So with B_Phi' nonzero as a function, using p=0 and q=0 respectively. These are two distinct existential witnesses.
- HermLine: for each s,t,s',t' there is lambda in C, independent of y,y', such that P_W(C_y(s,t),C_y'(s',t'))=lambda P_W(B_y,B_y') for all y,y' in Y. No positivity of lambda is assumed by the source.
- CoefLine: if the diagonal-in-(s,t) HermLine identity holds for ALL y,y', then the squared norms of the backward theta lifts on V' satisfy the SAME lambda identity, for each y in Y and every polynomial test Psi. This is the essential transfer of the coefficient, not a consequence of HermLine alone.
- ThConst: for every s,t, if all C_y(s,t) are rapid, the backward theta lifts on both spaces are constant in their group argument for every Schwartz test function. P uses the primed half.

## 2. Exact analytic mechanism: a residual is forced to vanish
P 72–82: apply HermLine with (s,t)=(1,0), (s',t')=(0,1), obtaining c such that P_W(A_y,B_y')=c P_W(B_y,B_y') for all matching pairs. Define R_y=A_y-c B_y. Integrability justifies subtracting integrals. Thus P_W(R_y,B_y)=0 for every y. Apply HermLine again, now (1,-c),(1,-c), obtaining a possibly different uniform lambda with
  P_W(R_y,R_y')=lambda P_W(B_y,B_y')  (all y,y').
It is NOT enough to conclude R_y=0 merely from its orthogonality to B_y. The next step supplies the missing information.

P 83–96: pick the primed nonzero polynomial witness Phi' from NonZeroAn, with its So condition; use MatchEx m2 to obtain Phi, hence y0=(Phi,Phi') in Y. Let V=G.M'.mu.real G.M'.dom. By C Cpt.vol_ne, V is finite and strictly positive: nonzero Haar measure of a fundamental domain and finite total measure of that domain. Let n=P_W(B_y0,B_y0). This is a nonnegative real embedded in C, and n != 0 by Cpt.eq_zero and the witness. Do not replace this by pointwise nonzero at a guessed g.

Let T(f)=th om' mu D f Phi' (a function on V'). By ThConst it is constant for f=C_y0(s,t), including both R_y0 and B_y0. Fubini plus conjugation of the integral gives, with the original measure on V',
  integral_{D'} T(f)(g) dmu'(g) = P_W(f,B_y0).
This is P int_th, proved using finite-measure restrictions of Haar measures, continuity of phi(h) conjugate(theta(g,h)), and rational invariance on both variables to bound that product globally (P 27–42, C bdd₂). Dividing by V is valid. Hence
  T(R_y0) = constant 0,
  T(B_y0) = constant n/V.
This is P's key equality; it holds uniformly for every s,t in C, not just the two selected combinations.

P 97–101: CoefLine applies to the SAME lambda from the residual Gram identity and the polynomial witness Phi'. Therefore
  0 = P_V'(T(R_y0),T(R_y0))
    = lambda P_V'(T(B_y0),T(B_y0))
    = lambda V |n/V|^2 = lambda n^2/V.
Since n>0 and V>0, lambda=0, even though lambda was initially complex. This is the decisive nonzero scalar factor. No approximation or division by an unproved theta value.

P 102–109: for arbitrary y in Y, P_W(R_y,R_y)=0 by the uniform Gram identity and lambda=0. By Cpt.eq_zero, continuity and rational invariance this implies R_y=0 as a function, not only a.e. (integral of |R|^2 is zero, invariant null set extends from fundamental domain to group, then continuity plus full-support Haar measure). Thus A_y=c B_y pointwise for every matching pair. Finally choose the UNPRIMED nonzero witness Phi0 from NonZeroAn, with its permitted match via m1. If c=0, A_Phi0 is identically zero by the established equality, contradicting its witness. Hence c != 0, proving PolZero.

## 3. Source-level dependency and trust boundary
CloseSph calls W polynomial_vanishing_of_compactness. W first constructs anisotropic Siegel-Weil and compactness data, then calls P with hermLine_of', coefLine_of, thConst_of' and the remaining six inputs. H explicitly delegates to hermLine_of hC cptOpen polRank hS hJ hF hN hW hB hI hM. L explicitly requires SWFull, BoxSec, DblW, HgtEx, HgtInt, Stab2Cpt, CptAll, PairsStable, MatchEx, ThetaBasic, ICont and PolSch. W's thConst_of' input uses locDist, goodNe, PositivityTheory.SA.constOfGood p5, Factor, MatchEx, ThetaBasic, KDecay, GrpTop, EpsOf, FinVolU, Unimod. W's p0=SiegelWeilStd, p2=EisBL, p5=GlobalTheory.Published.HeckeLEntireAndNonzeroAtOne remain explicit obligations. Do not infer that Published names identify independently verified theorems. This run reconstructs the actual source proof of P, not merely a theorem-shaped declaration or hypothetical alternate proof; the analytic suppliers of HermLine, CoefLine and ThConst remain to be reconstructed. In particular the proof of RUN3 lInt2 is not resolved by this argument.

Negative controls: in C^2 with B=(1,0), A=(0,1), residual R=A is orthogonal to B and nonzero. For one pair the two HermLine identities alone hold with c=0, lambda=1. It violates CoefLine with a constant nonzero backward lift of B. Dropping ThConst is not harmless either: on a two-point unit-measure-per-point domain, a backward lift (1,-1) has zero integral but nonzero norm; Fubini does not imply zero function without constancy. If the primed witness is zero, the factor n^2/V cannot detect lambda; if the unprimed witness is zero, proportionality may hold with c=0. These are finite diagnostic models for individual implications, not counterexamples to the full geometric theorem.

## 4. Executed checks and reproducibility
Refetched eight pinned blobs and checked all 39 literal anchors below using V8 (8/8 SHA matches and 39/39 anchor matches). Executed 25,920 exact Gaussian-integer test cases (two-dimensional B nonzero, c,t in {-1,0,1}+i{-1,0,1}, V=1..4). Residual R=t*(-conj(B2),conj(B1)). Computed cross-inner-product and orthogonality; Gram scalar lambda=||R||^2/n. Clearing positive V, the CoefLine condition becomes 0=||R||^2*n. Exactly 2,880 cases compatible, all proportional; 23,040 nonzero residuals rejected; 320 compatible cases have zero c and must be excluded by the separate left witness. Finite model checks support the algebra only. No Lean kernel execution, no proof of upstream analytic inputs, no URT acceleration claim.

Replay from pinned upstream checkout (Python 3; source hash replay included, not executed locally):
~~~python
from pathlib import Path
import hashlib
T="src/Development/WeilBound/ThetaLifts/"
A="src/Development/AbelianVarietyTheory/"
ledger=[
(T+"LatticeBasics/PolZero.lean","1c4df9613cd7ab9604ec9aca188ccaa1685df842",["theorem polZero_of","theorem swap_bdd","theorem int_th","have orth :","obtain ⟨lam, hl⟩","have key :","have n0 :","have l0 : lam = 0","have main : PolConst","refine ⟨c, fun c0 => q2"]),
(T+"LatticeBasics/PairsStable.lean","15cdb3b0663f439d9ce45052db1299255f4196c9",["def pet ","def th ","def pairs ","def comb ","def ThConst","def HermLine","def CoefLine","∀ s t s' t', ∃ lam"]),
(T+"LatticeBasics/FdEqZero.lean","5a71acf351e947b2bef53cba29a0166d2bfce192",["def CptAll","theorem Cpt.bdd ","theorem Cpt.bdd₂","theorem Cpt.rapid","theorem Cpt.vol_ne","theorem Cpt.eq_zero","theorem fd_eq_zero","integral_eq_zero_iff_of_nonneg"]),
(A+"Definitions/Divisors/CTSmallCone.lean","59578c7a38cc131fdab95da5541523c42a5b159e",["def PolConst","def MatchEx","def NonZeroAn","def PolZero","G.p = 0 → G.q = 0 → ∃ c"]),
(T+"Reductions/TopPolarZero/PolZero.lean","53e3dd1eecd90129f30180a66820109d0c8b54be",["theorem _root_.PositivityTheory.ThKR.polynomial_vanishing_of_compactness","polZero_of hc (hermLine_of'","(coefLine_of","(thConst_of'"]),
(T+"LatticeBasics/HermCpt.lean","24ccc3389ccf5d1d062d587f14ec4d3f4775b508",["theorem hermLine_of'","hermLine_of hC cptOpen polRank"]),
(T+"LatticeBasics/CoefLine.lean","aef065b49dd25f8c44f8a84762661e4c2e1682b5",["theorem coefLine_of"]),
(T+"LatticeBasics/ThConst.lean","f28b691ef966c0a961bcafa3df32b74a89fdeebf",["theorem thConst_of"])
]
count=0
for path,sha,anchors in ledger:
    b=Path(path).read_bytes()
    assert hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==sha,path
    s=b.decode()
    for a in anchors:
        assert a in s,(path,a)
        count+=1
assert count==39
from itertools import product
def add(u,v): return u[0]+v[0],u[1]+v[1]
def neg(u): return -u[0],-u[1]
def conj(u): return u[0],-u[1]
def mul(u,v): return u[0]*v[0]-u[1]*v[1],u[0]*v[1]+u[1]*v[0]
def ip(u,v): return add(mul(u[0],conj(v[0])),mul(u[1],conj(v[1])))
def norm(u): return ip(u,u)[0]
Z=(0,0)
C=list(product(range(-1,2),repeat=2))
total=good=blocked=zero_scalar=0
for b1,b2 in product(C,repeat=2):
    B=(b1,b2)
    n=norm(B)
    if not n: continue
    for c,t in product(C,repeat=2):
        R=(mul(t,neg(conj(b2))),mul(t,conj(b1)))
        A=tuple(add(mul(c,b),r) for b,r in zip(B,R))
        assert ip(A,B)==mul(c,(n,0))
        assert ip(R,B)==Z
        r=norm(R)
        for V in range(1,5):
            compatible=(r*n==0)
            assert compatible==(t==Z)
            if compatible:
                assert A==tuple(mul(c,b) for b in B)
                good+=1
                if c==Z: zero_scalar+=1
                else: assert norm(A)>0
            else: blocked+=1
            total+=1
assert (total,good,blocked,zero_scalar)==(25920,2880,23040,320)
print("anchors",count,"cases",total,"compatible",good,"rejected",blocked,"zero scalar",zero_scalar)
~~~

RESUME HERE: expand L coefLine_of, beginning at its exact proof in LatticeBasics/CoefLine.lean and the ContinuousFlat imports. Identify exactly why the SAME Gram coefficient lambda transfers through the doubling integral to the primed backward theta norm, including the SWFull assumptions, all Fubini/measure/scalar normalizations, and where nonzero factors allow cancellation. This is the next indispensable mathematical input exposed by P. In parallel request actual lInt2 source from dependency lane when authenticated export arrives. Do not repeat RUN3 Gamma guard or RUN4 orthogonality.
HANDOFF TO: proof editor, integration, formal audit, theta, literature. Replace base proportionality assembly by this actual source-matched argument; leave nine hypotheses' producer proofs open as appropriate. No physics queue or gate changed.
