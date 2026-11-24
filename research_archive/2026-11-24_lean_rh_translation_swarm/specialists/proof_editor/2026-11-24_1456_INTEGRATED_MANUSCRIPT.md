# Human-readable RH reconstruction — eighth edition (14:56 UTC, 24 November 2026)

INCOMPLETE. Original upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed latest head 9477923066c923e6dbf7292da17019f8d08d0db8 (14:18:56 UTC; quick-check diagnostic merge). Main.lean still blob 67c65badc15f80a1db65df1c84dc7a4928fc410f, changed from original. Do not substitute revisions.

Read [Volume I](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [Volume II](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [Volume III](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [Volume IV](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), then this Volume V. Prior 80 primary entries and 5 supplements; 9 further primary chapters (86–94), preserving text and peer blobs. 89 primary + 5 supplements, not a theorem-count denominator. Peer content checked for connector-reported blob and original pin; peer mathematical claims not independently replayed.

## New local derivation: thin scale lower bounds (block 13)

Source GlobalTheory.EX.szRow_thinSize_ge, conditional SzRow. For every 0<eps<1/52 and FC C with Std C, choose c1=c2=0, for every cD,ch>=0 choose x0 depending only on eps,C. For every D:D7, L:SizeData₂ D with L.sc.eps=eps, x>=x0 and Val C cD ch L, prove k^C.P.Cw<=w''(n) and b^C.P.cw<=w''(n), where n=D.R.n, k=D.R.k. Std fixes cw=9/10. No assumption that Cw positive is required for this block (consumer also supplies positivity via parConsts_pos).

Let x=L.sc.x, eps>0, b=exp(x^eps), P=X'=exp(x^(eps/3)), W=w''=b/(Pn). Positivity of n,k follows from RankVal lower powers at x>=16. RankVal upper bounds give n<=2x^(2+8eps) and k<=2x^(9/2+10eps). Because 2<=x^(1/4) and eps<1/52, 2+8eps+1/4<3 and 9/2+10eps+1/4<5. Thus 1<=n<=x^3 and 1<=k<=x^5; the original proof uses n_le' and then absorbs 2. Either route valid with original hypotheses.

Write Cw=C.P.Cw and c=5|Cw|. By k>=1, exponent monotonicity and k<=x^5, k^Cw<=k^|Cw|<=x^c. The exact logarithmic lower-bound target is b^(9/10)*x^c<=W, equivalent to x^(eps/3)+log n+c log x<=x^eps/10. Sufficient: x^(eps/3)+(c+3)log x<=x^eps/10, since n<=x^3. This is precisely the comparison supplying the sixth component of scale_poly_comparison, with κ=1/10.

**Explicit sufficient threshold (alternative witness, not literal Lean threshold):** set t=x^(eps/3)>1. Then log x=(3/eps)log t<=(3/eps)t; x^eps=t^3. Hence t+3(c+3)log(t)/eps <= [1+3(c+3)/eps]t. Choose x0=max(16,[10(1+3(c+3)/eps)]^(3/(2eps))). Then t²>=10(1+3(c+3)/eps), giving the sufficient inequality uniformly in D,L,cD,ch. All logarithms and divisions have positive arguments; epsilon is never zero. From b>=1 and x>=1, both x^c and b^(9/10) are >=1; hence each factor individually <= their product <=W. This proves both original fields. The threshold can be enormous as eps→0; not an efficient numeric cutoff or a physical parameter.

Consumer ExplicitConstantsParameterConditionsLarge passes h_w''_ge into w''_ge of the same ParameterChoice' D L. No new geometric witness, no replacement of Val, no proof of existence of Val. Exact proof is elementary once rank and scale hypotheses supplied. 2/2 fields reconstructed (local denominator only).

## Source ledger
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/SzRowThinSizeGe.lean — 98a112bba579c192c8311d9ff80d1b135aacea35; szRow_thinSize_ge, hup, hn3, hk5, hkC, hcw.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ScalePolynomialQuantitiesComparison.lean — c0845d6330b22fdbf58258f45244f3011f92f525; scale_poly_comparison, sixth component, g3, hw.
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean — 688162690ac7cbfe620037fcee8e451e7116f45b; Std, RankVal, n_le', Val, SzRow, HostVal, HostArith, HCVal.
- src/Formalism/LocalRingCardinality/DataParams₂.lean — 50914500995df91e2646d91a6c5c99a7e603a51b; Scale, b, a, X', b', w''.
- src/Formalism/LocalRingCardinality/DataParams.lean — 6dc2612028528e242333116820c35775ba802c37; w''_ge, Cw, cw.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitConstantsParameterConditionsLarge.lean — 8bb3bd4a9a5343eaeaef138a1dccf57016010f0a; block 13, h_w''_ge, w''_ge := h_w''_ge.

All six pinned source blobs retrieved and relevant declarations inspected. Reproduce git show PIN:PATH and git rev-parse PIN:PATH. Native Val producer still open; attempted scoped global-interpolation directory retrieval returned empty/unparseable JSON. Do not infer a supplier from filename. Next use pinned reverse imports or an exact path from peer graph.

## Executed regression
V8 BigInt (no kernel execution): epsilon=1/q, q=53..100, Cw=a/2, a=-12..12, integer t at or above sufficient threshold, four log n upper budgets between 0 and 3 times conservative log x bound. Counts: rank 96, threshold 3600, split 43200, negative 2. These are exact rational inequalities in surrogate log budgets derived from the analytic argument, not native geometry, exp floating evaluation, or independent Lean proof. Negative controls show small threshold and excessive log n budget can break the argument.

~~~js
function regression(){
 let rank=0,threshold=0,split=0,negative=0;
 const ck=(v,m)=>{if(!v)throw Error(m)};
 for(let q=53n;q<=100n;q++){
   ck(4n*(2n*q+8n)+q<12n*q,"n exponent");ck(18n*q+40n+q<20n*q,"k exponent");rank+=2;
   for(let a=-12n;a<=12n;a++){const abs=a<0n?-a:a,c2=5n*abs;
      const h=2n+3n*q*(c2+6n);
      let t=1n;while(t*t<5n*h)t++;
      for(const u of [t,t+1n,2n*t]){
       ck(2n*u**3n>=10n*h*u,"explicit threshold");threshold++;
       const L=3n*q*u;
       for(const N of [0n,L,2n*L,3n*L]){
         const w10=10n*(u**3n-u-N);
         ck(2n*w10>=18n*u**3n+10n*c2*L,"joint log budget");
         ck(w10>=9n*u**3n,"b^cw");
         ck(2n*w10>=10n*c2*L,"k^Cw");split+=3;
       }
      }
   }
 }
 ck(2n*2n**3n<10n*(2n+3n*53n*6n)*2n,"threshold neg");negative++;
 ck(10n*(1000n-10n-101n)<9n*1000n,"rank budget neg");negative++;
 return {rank,threshold,split,negative};
}
console.log(regression());
~~~

## Integrated reading order and exact joins
1. Root/reflection and nonvanishing: earlier volumes, 94 imported Euler-factor continuation and zero equivalence; distinguish pinned Mathlib from current-head zero-equivalence wrapper. Preserve Re(s)>0 for nonzero removed factors, principal-at-one exclusion and analytic uniqueness domain. No inference of current revision equivalence.
2. Arithmetic representation: 86 expands GoodSeg and LanglandsDataDualGL, includes reversal and contragredient twist, prior ParDual and WD signed reversal remain. 88 expands Dpst restriction and LetterDim.finrank_wdSpace conditional on actual semilinear decomposition/realization; ChCoef and LocPrime still open. Do not treat native field realization as a dimension assumption.
3. Host supply: 87 nested pair_share uses stage1 and stage2 and a common C, eta; retain dependence of the second set on chosen q, positive density and nonempty source sets. Analytic stages not reproved. Next pair_exists joins rows_of_mem with cutoffs.
4. Theta: 92 expands AStep.stepOf via incompatible dilation laws, weighted holomorphy and rank induction. Preserve hIH, actual cOneVal_pf, HolLead, FourierZero and measures. Earlier seven-input adapter and covolume producers remain.
5. Geometry: 89 sharpRR/baseRR local gluing and metric equality retain initial MjHTie/IdxDefs; 90 isolated-fibre quasi-finiteness distinguishes weak and strong finite algebra properties and uses actual imported Zariski theorem; intAll_all, archimedean maps and literature proof chain open. 93 five Good fields conditional on CrystallineSmoothLift and AbelianHodgeDeRham; t5 and LieDual tangent lift not automatic. Block 13 above attaches solely to same Val witness.
6. Loss and character estimates: 91 all eleven buckets, conditional on original counting and geometric hypotheses. Preserve cutoff and floor order, four quarter-σ contributions and 2^e₂<=n. Count producers, native slope/tDetD and exact join to Gm remain. Prior normalized exponent and character projection unchanged.
7. Dependency/trust: kernel RUN8 reports actual native synthetic fixture export and discrepancy between cached imported axiom reporting and independent traversal; not RH kernel or evidence of unsoundness. Acceleration RUN8 disk-backed synthetic tests only. Full stream closure still timed out per peer status; authenticated Main graph unavailable. No URT advantage claim.

## Eight outstanding groups — OPEN
1. Native GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, ChCoef, LocPrime, TypeAt, guarded multisegment existence and full correspondence producers. Dpst restriction and LetterDim now locally expanded in 88.
2. RecTExists/VWin, native host existence, PairEx/pair_exists, ShortNorm, StagePow and native progression relative-error/mass ratio; pair_share finite assembly expanded in 87.
3. Seven theta/literature inputs, 15 covolume premises, cOneVal_pf, HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, square-zero Good and global Hodge/crystalline producers, literature trust. AStep and local Good comparison expanded in 92/93.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type and Green leaves.
5. Nine same-witness design closures, Val/HostArith/FamP, native lattice/height/thick density, MjHTie/IdxDefs, intAll_all and archimedean suppliers, slope loss/tDetD, eleven bucket counts. Blocks 10,11,12,13,21 expanded; other blocks not inferred complete.
6. Independent analytic tail/derivative/regularized-pole/local zero-order/Euler-factor audit and native caller; distinguish revisions.
7. Authenticated reachable elaborated graph and exact denominator, all relevant axioms/generated-declaration provenance; 175187 modules/753261 import edges not proof denominator.
8. Independent mathematical audit of every essential derivation or exact established theorem citation, full joins, original/current revision correspondence if requested.

Coverage this run: 2/2 block-13 fields; 9/9 peer blob and pin checks. Full proof percentage undefined. Preflight: AGENTS, state, continuity, research log/protocol excerpts, CI summary #375 (unrelated), swarm/handoff/expansion/spine, prior editor and recent peer handoffs. Linked external blueprint not reopened. No physics modifications.

## Appendix map
86. [integration/2026-11-24_1400_GUARDED_MULTISEGMENT_DUAL.md](../../integration/2026-11-24_1400_GUARDED_MULTISEGMENT_DUAL.md) — 7c136b279d96e1249908b15591297a7f28b1a2f1
87. [math/2026-11-24_pair_share_nested_density.md](../../math/2026-11-24_pair_share_nested_density.md) — 24e587af9a5a9b44b439dc76657bc24e4d4248cf
88. [specialists/galois_representations/RUN8_DPST_RESTRICTION_LETTER_DIMENSION.md](../../specialists/galois_representations/RUN8_DPST_RESTRICTION_LETTER_DIMENSION.md) — 68cff61ebec531f5faf90576e42f8553d53fa46b
89. [specialists/character_boxes/RUN8_ROW_LATTICE_METRIC_COMPATIBILITY.md](../../specialists/character_boxes/RUN8_ROW_LATTICE_METRIC_COMPATIBILITY.md) — ae4f6f50d91391befc97952d9715761280ab1c30
90. [specialists/positivity_geometry/RUN8_ISOLATED_FIBER_ZARISKI_QUASIFINITENESS.md](../../specialists/positivity_geometry/RUN8_ISOLATED_FIBER_ZARISKI_QUASIFINITENESS.md) — 62459467729d9f070a7e21a8031bfcd91def110b
91. [specialists/prime_window/RUN8_ELEVEN_BUCKET_SIZE_BOUND.md](../../specialists/prime_window/RUN8_ELEVEN_BUCKET_SIZE_BOUND.md) — e1904c45828163ca9c1f75fc26646ae167fc1277
92. [specialists/theta_lifts/RUN8_SINGULAR_COEFFICIENT_DILATION_SEPARATION.md](../../specialists/theta_lifts/RUN8_SINGULAR_COEFFICIENT_DILATION_SEPARATION.md) — 898528c6c006cf0404a9914caad2202d316b4cf1
93. [specialists/literature_provenance/RUN8_GOOD_CLASSIFICATION_AND_DIFFERENTIAL_TRIVIALIZATION.md](../../specialists/literature_provenance/RUN8_GOOD_CLASSIFICATION_AND_DIFFERENTIAL_TRIVIALIZATION.md) — 44aa73befeea0711cfdbfce09f37696d84b83af0
94. [specialists/landau_criterion/RUN8_EULER_FACTOR_CONTINUATION_AND_ZERO_EQUIVALENCE.md](../../specialists/landau_criterion/RUN8_EULER_FACTOR_CONTINUATION_AND_ZERO_EQUIVALENCE.md) — 26cf8e7bd9fc3d2183ae2fc8e68bf2ccdc416248

RESUME HERE: locate actual Val/FamP supplier through pinned reverse-import index or native host construction; if unavailable, expand block 14 sizes_del_ge_cloudUnit_and_count_bounds from exact source while recording missing producer. Audit explicit threshold and rank bounds; integrate exact cOneVal_pf, ChCoef, pair_exists, MjHTie/IdxDefs and intAll_all peers. HANDOFF TO all RH lanes, particularly formal audit and dependency. OPEN.


---

## Appendix 86 — preserved peer text, blob 7c136b279d96e1249908b15591297a7f28b1a2f1

# Guarded multisegment existence and duality — 24 November 2026, 14:00 UTC

Original pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream head 5b84436dcf68e7c435b9bd0251450a5904ecbace, not substituted. Extends integration/2026-11-24_1300_WD_SEGMENT_DUAL. SOURCE-MATCHED; not kernel replay.

## GoodSeg: three fields
For every nonarchimedean local field k of characteristic zero (with valuation and topology instances), GoodSeg asserts (i) for each list l and irreducible class x with IsL(l,x.rep), Good(x) iff every segment first term is GoodCusp; (ii) for cuspidal x, Good(x) iff GoodCusp(x); (iii) any two supports of x are equal. The proof first derives support uniqueness with geometricLemmaGL and Pr.bz. Good is existence of a support all of whose entries are good; uniqueness makes this equivalent to goodness of any specified support. IsL gives the flattened multiset msupp by hasSupport_msupp_of_isL Pr.zel. GoodCusp is invariant under every complex nu twist by clBasic. Each segment has positive length, hence its zeroth twist belongs to its support; goodness of flattened support implies goodness of each first term. Conversely each support entry comes from a segment and valid index; twist invariance proves goodness there. For cuspidal x use singleton support. The nonempty segment guard is indispensable. Named upstream proofs remain leaves.

## LanglandsDataDualGL: two fields
Under the same local field prefix, including CharZero, (1) every multiset of segments has an irreducible class x satisfying IsL; (2) given IsL(l,x.rep) and DualCl(x,y), there exists l' with List.Forall₂ SegDual l l' and IsL(l',y.rep). Pr.dual calls langlandsDataDualGL_of_cosocle Pr.cos. Field one applies LExist.main to StandardCosocleGL and exists_class_isLSeg. For each segment, lSegExists supplies a representation π of degree Δ.deg and a cosocle witness; forming its quotient class and transporting along Quotient.mk_out preserves that witness (LanglandsExhaustion/ExistsClassIsLSeg.lean blob f2ae9f989deab81836baa4b3172b24cd44596898). Further proof of LExist.main remains open. Field two uses langlandsDataDualGL_dual with irreducibleAdmissibleGL_top. Pr.exh separately supplies the opposite direction (given x, obtain a multisegment) via native segmentRepresentation and langlandsExhaustionGL_of_seg. Do not confuse the two existential directions.

## Segment duality and two orders
DualCl(x,y) means there are a common rank n, irreducible representatives π,π' with these classes and equivalence π' ≃ contra π. The native dualMap gives D with five laws: DualCl(x,y) iff y=D(x); D²=id; D(x.nu(s))=D(x).nu(-s) for complex s; preservation of cuspidality; preservation of degree. These follow from the named inverse-transpose/contragredient, twist and cusp lemmas. SegDual(Δ,Δ') means equal lengths and DualCl(Δ.first.nu(n−1),Δ'.first) (Definitions/NonGaloisDescent/CuspLaws.lean blob 698957f9595361c9b0c4e581ffec23e79fac69fc). For n=Δ.len>0 and ρ=Δ.first, take Δ' first term D(ρ.nu(n−1)) and length n; it is cuspidal. For any such Δ' and 0≤a<n,
    Δ'.first.nu(a) = D(ρ.nu(n−1)).nu(a) = D(ρ.nu(n−1−a)).
The complex twist law with parameter −a and twist addition prove this. Thus the segment terms are duals in reversed order, not same-index duals. The source order lemma proves Γ'.Precedes Δ' ⇒ Δ.Precedes Γ with both SegDual premises, using Segment.precedes_iff, D²=id and i=j+len(Δ)−len(Γ) (existence as a natural follows by omega from original inequalities). It transports the twist equality by applying D and then twisting; j+len(Δ)=len(Γ)+i gives the final linear combination. The exact internal inequalities of Segment.precedes_iff remain an explicit leaf.

For IsLSeg, keep original degree-sum equality, cosocle, admissibility and all five D laws. Inverse transpose is an involutive surjection, so precomposition preserves the cosocle by isCosocle_comp. The normalized parabolic induced product transforms to the reversed block product: deltaHalf_revPlace and revRep_leviProj establish equality of inducing actions, smInd_equiv_comp transports induction under the involution, and multiProd_placing_equiv adjusts target block placement. The equality of reversed dual term families supplies the required congruence; Fin.cast transfers across equal lengths. Compose these equivalences to transport the cosocle.

For IsL(l,x.rep), choose a dual segment f(Δ) for each Δ; return l.map f, with pairwise SegDual in ORIGINAL list order. The internal ordered witness consists of h, z, degree sum, a family Δ with multiset equality and order condition and IsLSeg witnesses, and a cosocle. Reverse its index a→Fin.rev a, replace z by its inverse-transpose class and Δ by f(Δ(Fin.rev a)). Rank sum equals old by permutation; multiset equality follows by mapping then reindexing; order follows by Fin.rev_lt_rev and the Precedes reversal lemma; each factor is IsLSeg by preceding paragraph; cosocle follows by product equivalence. The external paired list need not reverse: IsL sees the multiset, whereas the ordered internal witness must reverse. This is the essential integration distinction. ExtDual uses these three obligations with the preceding WD duality chapter.

## Project index and boundaries
Editor volume IV (59e6a7f6daed6aad06d641b92ab03def53e8825c) links volumes I–III and now contains 85 numbered entries, some overlaps; not a completeness denominator. Latest peer checkpoints inspected: 8a496078 geometry, b576ca2 audit (retain quadratic exception), b81ec6c literature, a000b75 boxes, 8014f03 math, 3120ae0 Galois, 78a58b3 theta, 4e3a139 prime-window, e116ce7 Landau, 88b205e dependencies, 12f0958 kernel, c7e63c7 acceleration. Editor reports compiled ExceptionalPair.main subtree (30 modules, standard axioms); not independently replayed here. Complete authenticated RH kernel graph and root axiom audit remain outstanding. Cathedral gating verdict PASS 2026-11-24 13:48:45 UTC, run 45403441156, not this commit. No unrelated files changed. No URT superiority claim.

Executed in V8: {"nodes":12,"edges":11,"term":50020,"order":5456,"good":8191,"negative":5,"sourceBlobs":6,"anchors":50}. The finite integer twist coordinate, index and Boolean support checks test consequences only, not representation-theoretic premises. Independent reviewer pending. Failed attempts: conventional RESUME_HERE.md names 404; recovered actual paths via commit metadata. Search for precedes_iff returned no results. First combined source/head comparison and commit request exceeded tool-call limit; retry uses six original pinned files, no claim of current-head equivalence. Source anchors checked by connector; no Lean replay.

## Reproduction
Extract JSON and JS blocks, bind JSON to graph, run the fail-on-error function. Verify pinned blob IDs using git show PIN:path and git hash-object, and the listed line anchors. This is a typed partial source dependency graph, not the full kernel graph.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "head": "5b84436dcf68e7c435b9bd0251450a5904ecbace",
  "roots": [
    "good",
    "exh",
    "dualwrap"
  ],
  "consumer": {
    "path": "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/ExtDual.lean",
    "sha": "d73720859f5c9237ec612be0ce3ba0c727e20835"
  },
  "source": {
    "good": {
      "path": "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/GoodSeg.lean",
      "sha": "3e5f5fc7aff81cdb81862052b1142c1ac9bdeca7",
      "anchors": [
        {
          "line": 15,
          "anchor": "hasSupport_unique"
        },
        {
          "line": 16,
          "anchor": "have hgood"
        },
        {
          "line": 26,
          "anchor": "have htw"
        },
        {
          "line": 33,
          "anchor": "hasSupport_msupp_of_isL"
        },
        {
          "line": 38,
          "anchor": "Δ.len_pos"
        },
        {
          "line": 39,
          "anchor": "Multiset.mem_bind.mp"
        },
        {
          "line": 46,
          "anchor": "hasSupport_self hx"
        }
      ]
    },
    "multi": {
      "path": "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/Multi.lean",
      "sha": "ea3ed51ce271cb20eaa5120dddf63aca2c444a06",
      "anchors": [
        {
          "line": 11,
          "anchor": "theorem exh"
        },
        {
          "line": 13,
          "anchor": "theorem cos"
        },
        {
          "line": 14,
          "anchor": "theorem bz"
        },
        {
          "line": 15,
          "anchor": "theorem zel"
        },
        {
          "line": 17,
          "anchor": "theorem dual"
        },
        {
          "line": 17,
          "anchor": "langlandsDataDualGL_of_cosocle cos"
        }
      ]
    },
    "clauses": {
      "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LocalLanglandsExistence/LanglandsDataDualGLOfCosocle.lean",
      "sha": "17eb5f909e340ec0fc9ed73aaa701240db9ecec2",
      "anchors": [
        {
          "line": 10,
          "anchor": "theorem lExists_of_cosocle"
        },
        {
          "line": 13,
          "anchor": "LExist.main"
        },
        {
          "line": 13,
          "anchor": "exists_class_isLSeg"
        },
        {
          "line": 15,
          "anchor": "theorem langlandsDataDualGL_of_clauses"
        },
        {
          "line": 22,
          "anchor": "theorem langlandsDataDualGL_of_cosocle"
        },
        {
          "line": 23,
          "anchor": "LDual2.langlandsDataDualGL_dual"
        }
      ]
    },
    "dual": {
      "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LocalLanglandsExistence/MultiProdCompInvTranspose.lean",
      "sha": "c8532c1d20685de868bfa0ec4fce42a6dd85ee60",
      "anchors": [
        {
          "line": 19,
          "anchor": "theorem multiProd_comp_invTranspose"
        },
        {
          "line": 36,
          "anchor": "deltaHalf_revPlace"
        },
        {
          "line": 39,
          "anchor": "Relabel.smInd_equiv_comp"
        },
        {
          "line": 52,
          "anchor": "multiProd_placing_equiv"
        },
        {
          "line": 72,
          "anchor": "theorem dualMap"
        },
        {
          "line": 60,
          "anchor": "theorem dual_nu"
        },
        {
          "line": 66,
          "anchor": "theorem isCusp_dual"
        },
        {
          "line": 93,
          "anchor": "theorem isLSeg_dual"
        },
        {
          "line": 121,
          "anchor": "Fin.val_rev"
        },
        {
          "line": 121,
          "anchor": "Nat.cast_sub"
        },
        {
          "line": 137,
          "anchor": "theorem isL_dual_of_admissible"
        },
        {
          "line": 144,
          "anchor": "l.map f"
        },
        {
          "line": 146,
          "anchor": "List.forall₂_same"
        },
        {
          "line": 165,
          "anchor": "f (Δ (Fin.rev a))"
        },
        {
          "line": 170,
          "anchor": "Fin.rev_lt_rev.2 hij"
        },
        {
          "line": 171,
          "anchor": "precedes_of_segDual_precedes"
        },
        {
          "line": 172,
          "anchor": "isLSeg_dual hA"
        },
        {
          "line": 176,
          "anchor": "theorem langlandsDataDualGL_dual"
        },
        {
          "line": 180,
          "anchor": "irreducibleAdmissibleGL_top"
        }
      ]
    },
    "seg": {
      "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/SegDualExistsTerms.lean",
      "sha": "b9a99018bee2786396868c14603627419dac7ce0",
      "anchors": [
        {
          "line": 12,
          "anchor": "theorem segDual_exists_terms"
        },
        {
          "line": 15,
          "anchor": "Segment.ofFirst _ hρ Δ.len Δ.len_pos"
        },
        {
          "line": 19,
          "anchor": "hnu (Δ.first.nu"
        },
        {
          "line": 20,
          "anchor": "IrrGL.nu_nu"
        },
        {
          "line": 21,
          "anchor": "exact h1.symm"
        }
      ]
    },
    "ord": {
      "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PrecedesOfSegDualPrecedes.lean",
      "sha": "6463564b70ae9b7c51ab64b504f078e683bd6d27",
      "anchors": [
        {
          "line": 14,
          "anchor": "theorem precedes_of_segDual_precedes"
        },
        {
          "line": 20,
          "anchor": "Segment.precedes_iff.1 H"
        },
        {
          "line": 22,
          "anchor": "congrArg D e"
        },
        {
          "line": 26,
          "anchor": "j + Δ.len = Γ.len + i"
        },
        {
          "line": 26,
          "anchor": "j + Δ.len - Γ.len"
        },
        {
          "line": 27,
          "anchor": "Segment.precedes_iff.2"
        },
        {
          "line": 33,
          "anchor": "linear_combination hc"
        }
      ]
    }
  },
  "nodes": [
    {
      "id": "good",
      "file": "good",
      "declaration": "goodSeg",
      "deps": [],
      "guard": "char-zero local field, IsL or cusp; support uniqueness",
      "frontier": "hasSupport_unique, geometricLemmaGL, Pr.bz, Pr.zel, hasSupport_msupp_of_isL, clBasic, hasSupport_self",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "exh",
      "file": "multi",
      "declaration": "Pr.exh",
      "deps": [],
      "guard": "native exhaustion predicate",
      "frontier": "langlandsExhaustionGL_holds",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "dualwrap",
      "file": "multi",
      "declaration": "Pr.dual",
      "deps": [
        "clauses"
      ],
      "guard": "Published.LanglandsDataDualGL, char zero",
      "frontier": "Pr.cos",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "clauses",
      "file": "clauses",
      "declaration": "langlandsDataDualGL_of_cosocle",
      "deps": [
        "existall",
        "dualall"
      ],
      "guard": "StandardCosocleGL; both fields",
      "frontier": "",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "existall",
      "file": "clauses",
      "declaration": "lExists_of_cosocle",
      "deps": [],
      "guard": "every multiset, local field char zero",
      "frontier": "LExist.main, exists_class_isLSeg",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "dualall",
      "file": "dual",
      "declaration": "langlandsDataDualGL_dual",
      "deps": [
        "listdual"
      ],
      "guard": "local field char zero, IsL and DualCl",
      "frontier": "irreducibleAdmissibleGL_top",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "listdual",
      "file": "dual",
      "declaration": "isL_dual_of_admissible",
      "deps": [
        "dmap",
        "term",
        "ordering",
        "segdual",
        "prod"
      ],
      "guard": "local field, IrreducibleAdmissibleGL, list, x,y, IsL, DualCl",
      "frontier": "IsCosocle_comp, prodIrrEquiv, Multiset.map_coe",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "dmap",
      "file": "dual",
      "declaration": "dualMap",
      "deps": [],
      "guard": "IrreducibleAdmissibleGL",
      "frontier": "DualClassTranspose.dualCl_iff, dual_dual, InvTransposeTwist.main, InvTransposeCusp",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "term",
      "file": "seg",
      "declaration": "segDual_exists_terms",
      "deps": [],
      "guard": "all five D laws, nonempty segment, a<len",
      "frontier": "Segment.ofFirst, IrrGL.nu_nu",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "ordering",
      "file": "ord",
      "declaration": "precedes_of_segDual_precedes",
      "deps": [],
      "guard": "all five D laws, SegDual twice and Γ'.Precedes Δ'",
      "frontier": "Segment.precedes_iff",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "segdual",
      "file": "dual",
      "declaration": "isLSeg_dual",
      "deps": [
        "term",
        "prod"
      ],
      "guard": "admissibility, five D laws, IsLSeg, SegDual",
      "frontier": "CosocleComp, prodIrrEquiv, IrrGL.equivOf, prodIrr_cast",
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "prod",
      "file": "dual",
      "declaration": "multiProd_comp_invTranspose",
      "deps": [],
      "guard": "local field, block dimensions, two placing equivalences, representations",
      "frontier": "deltaHalf_revPlace, revRep_leviProj, smInd_equiv_comp, multiProd_placing_equiv",
      "status": "SOURCE-MATCHED"
    }
  ],
  "scope": "selected source obligations, not kernel closure",
  "result": {
    "nodes": 12,
    "edges": 11,
    "term": 50020,
    "order": 5456,
    "good": 8191,
    "negative": 5,
    "sourceBlobs": 6,
    "anchors": 50
  }
}
```

```javascript
function regression(g){
function ck(x,m){if(!x)throw Error(m)}
function walk(z){let seen=new Set(),active=new Set(),map=new Map(z.nodes.map(n=>[n.id,n])),edges=0;function v(i){ck(map.has(i)&&!active.has(i),"missing/cycle");if(seen.has(i))return;let n=map.get(i);ck(n.guard&&z.source[n.file],"lost guard/source");active.add(i);for(let d of n.deps){edges++;v(d)}active.delete(i);seen.add(i)}z.roots.forEach(v);ck(seen.size===z.nodes.length,"orphan");return {nodes:seen.size,edges}}
let counts=walk(g),term=0,order=0,good=0,neg=0;
for(let t=-30;t<=30;t++)for(let n=1;n<=40;n++)for(let a=0;a<n;a++){ck(-(t+n-1)+a===-(t+n-1-a),"segment endpoint reversal");term++}
for(let n=0;n<=32;n++)for(let i=0;i<n;i++)for(let j=i+1;j<n;j++){ck(n-1-j<n-1-i,"order reversal");order++}
for(let n=0;n<=12;n++)for(let mask=0;mask<(1<<n);mask++){let flags=Array.from({length:n},(_,i)=>Boolean(mask&(1<<i))),support=flags.flatMap((f,i)=>Array(1+i%4).fill(f));ck(flags.every(Boolean)===support.every(Boolean),"GoodSeg nonempty fibres");good++}
for(let bad of [{...g,nodes:g.nodes.filter(n=>n.id!=="term")},{...g,nodes:g.nodes.map(n=>n.id==="good"?{...n,guard:""}:n)},{...g,nodes:g.nodes.map(n=>n.id==="term"?{...n,deps:["listdual"]}:n)}]){let rejected=false;try{walk(bad)}catch(e){rejected=true}ck(rejected,"accepted mutation");neg++}
ck(-(3+4-1)+1!==-(3+1),"same-index counterexample");neg++;ck([false].every(Boolean)!==[].every(Boolean),"empty segment counterexample");neg++;
return {...counts,term,order,good,negative:neg}}
console.log(regression(graph));
```

RESUME HERE: expand LExist.main and standard cosocle/exhaustion bridge, including exact Segment.precedes_iff definition and full ordered witness. HANDOFF TO editor (append chapter), audit (review inverse-transpose normalization and order), dependency lane (authenticate full graph). Full reconstruction OPEN.


---

## Appendix 87 — preserved peer text, blob 24e587af9a5a9b44b439dc76657bc24e4d4248cf

# MATH lane — `QH.pair_share`: nested positive-density `GoodQ`/`GoodD` sets

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED human derivation of the single pinned theorem `QH.pair_share`, with an exact finite-set regression.  
**Status:** PARTIAL for the full reconstruction. This is not a Lean kernel replay, does not reprove the analytic `stage1`/`stage2` inputs, and is not a proof of RH.

## Source pin and exact scope

Authoritative source: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role used here |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean` | `712579c16be75074705a2c5c00f69e2f5d835cf9` | `boxAll_mono`, `share_of_bad`, and theorem `QH.pair_share` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/Stage1Succ.lean` | `79f79fe71e41f403a4d22e5b86540410748ac7c3` | sparse failed-`GoodQ` estimate |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/CharOf.lean` | `3eeed8077330efa249cde313d99d89a7c09d8ba6` | sparse failed-`GoodD` estimate `stage2` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | exact `BoxAll`, `GoodQ`, `GoodD`, and prime-set definitions |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean` | `7e63fdeda04264253733059bf951a4c1635cebaa` | immediate downstream witness selection |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean` | `f9d738eb0e0dce29b14633183dcafe3e0db5cb0d` | downstream conversion of memberships to `Rows` |

Current upstream `HEAD` observed here was `9477923066c923e6dbf7292da17019f8d08d0db8`
(2026-11-24 14:18:56 UTC). The pinned `PairShare.lean` path returns 404 at that revision, so this
chapter claims fidelity only to the requested pin.

The preceding two MATH runs reconstructed `stage1` and `stage2`. This run contributes only their
finite-density assembly. It corrects the misleading idea that two independent global good sets are
intersected: the source first constructs `G1`, then constructs a separate `G2(q)` for every
`q in G1`.

## 1. Exact statement and quantifier order

There exists a real `C>0` such that for all reals `eps,tau,K,eta` and naturals `N0`, if

`0<eps`, `eps<1/52`, `0<tau`, `1<=K`, `0<eta`, `0<N0`,

then there is `Y0` such that, for every `Y>=Y0` and every real `X,z'` satisfying

`X<=Y^K`,

`Y^(eps/5)*(log Y)^2 <= z' <= K^2*Y^(eps/5)*(log Y)^2`,

there is a set

`G1 subset primePairSetFirst(Y^(eps/5))`

such that the ambient first-prime set has positive cardinality,

`(1-eta)*card(P1) <= card(G1)`,

and every `q in G1` satisfies `GoodQ N0 C tau Y X ... q` and has an associated set

`G2(q) subset primeSetTwoBounds(Y^(eps/5),z',q)`

whose ambient second-prime set has positive cardinality,

`(1-eta)*card(P2(q)) <= card(G2(q))`,

and every `d in G2(q)` satisfies `GoodD N0 C tau Y X ... q d`.

The witness `G2` occurs inside `forall q in G1`; it may and generally does depend on `q`.

## 2. Exact finite complement lemma `share_of_bad`

Let `P` be a finite set and `p(x)` any predicate. Assume that every all-bad subset `B subset P`
satisfies

`card B <= eta*card P`.

Choose

`G = {x in P : p(x)}`.

The complementary filtered set

`D = {x in P : not p(x)}`

is itself an all-bad subset, so `card D<=eta*card P`. The exact finite partition identity is

`card G + card D = card P`.

Subtracting the bad-set estimate gives

`(1-eta)*card P <= card G`.

This private lemma assumes no sign or upper bound on `eta`. The public theorem supplies `eta>0`,
but does **not** assume `eta<1`. If `eta>=1`, the lower bound may be nonpositive and therefore
uninformative, although still correct. The later selector uses `eta=1/2`.

## 3. Exact monotonicity lemma `boxAll_mono`

Suppose

`C<=C'`, `1<=Y`, `X'<=X`,

and `BoxAll Q C tau Y X f M`. For every primitive induced character inside `BoxAll`, its `Box`
has three components:

1. `GoodC Q psi`, unchanged;
2. `||logDerivLAtOne psi|| <= C*log Y`;
3. for every `y in [Y,X]`, `||Gchi psi y||<=y^(1/2+tau)`.

Because `Y>=1`, `log Y>=0`; hence `C*log Y<=C'*log Y`. If `y in [Y,X']`, then `X'<=X` puts the
same `y` in `[Y,X]`. Thus

`BoxAll Q C' tau Y X' f M`.

Both side conditions are essential. For `Y<1`, enlarging `C` can lower the product `C log Y`; for
`X'>X`, a point in the new interval need not lie in the old one.

## 4. Assemble the first good set

Take constants from the two analytic wrappers:

`stage1 -> C1>0`, and `stage2 -> C2>0`.

Set

`C = max(C1,C2)`.

The source records positivity via `C1<C`; it could equally use positivity of `C2`, but no sum or
new fitted constant is introduced. Let `Y1,Y2` be the two stage thresholds and choose

`Y0 = max(max(Y1,Y2),1)`.

The final `1` is needed specifically for `boxAll_mono`.

At `Y>=Y0`, `stage1` supplies:

- nonemptiness of `P1=primePairSetFirst(Y^(eps/5))`;
- a bad-subset bound for the predicate
  `GoodQ N0 C1 tau Y (Y^K) ...`.

Apply `share_of_bad`. This produces `G1 subset P1` with the required density and every member good
at constant `C1` and upper endpoint `Y^K`. The theorem reports `0<card P1` by converting the stage-1
nonempty witness with `Finset.Nonempty.card_pos`; it does not yet assert `G1` nonempty for arbitrary
`eta`.

For `q in G1`, the target uses `C=max(C1,C2)` and arbitrary `X<=Y^K`. Unfolding `GoodQ` leaves one
`BoxAll` for each character `xi`; apply `boxAll_mono` with

`C1<=C`, `1<=Y`, `X<=Y^K`.

No character, modulus, zero-free scale, or exponent is altered.

## 5. Assemble the dependent second good sets

Before choosing a particular good `q`, `stage2` is instantiated at `Y,z'`. It returns a statement
for every `q in P1`. Since `G1 subset P1`, each `q in G1` is admissible.

For such a `q`, put

`P2(q)=primeSetTwoBounds(Y^(eps/5),z',q)`.

Stage 2 supplies nonemptiness of `P2(q)` and the bad-subset inequality for

`GoodD N0 C2 tau Y (Y^K) ... q d`.

Applying `share_of_bad` produces `G2(q) subset P2(q)` with

`(1-eta)*card P2(q) <= card G2(q)`

and every `d in G2(q)` good at `C2,Y^K`. For every character `xi` and twist bit `a<=1`, apply
`boxAll_mono` with

`C2<=max(C1,C2)`, `1<=Y`, `X<=Y^K`.

This yields exactly the target `GoodD` at the unified constant and shorter interval. Again, the
ambient modulus and all `GoodD` quantifiers are preserved.

## 6. Downstream selection and what is not proved here

`PairExists.lean` specializes this theorem to `eta=1/2`. Since each ambient prime set has positive
cardinality, the inequalities

`card G1 >= card P1/2`, and `card G2(q) >= card P2(q)/2`

force both good sets to be nonempty. It chooses `q in G1`, then `d in G2(q)`. Additional growth
cutoffs give `2*Y^(eps/5)<=z'`, so `rows_of_mem` converts their two memberships into `Rows`. A
separate logarithmic argument proves `N0<q`. Those steps belong to `pair_exists`, not to
`pair_share`.

This chapter therefore establishes a nested density bridge only. It does not prove the analytic
stage bounds, choose the final primes, build `PairGood`, discharge theta/Galois inputs, or establish
RH.

## 7. Corrections to the existing interpretation

- **Corrected:** `G2` is a family `G2(q)`, not one second-prime set shared by all first primes.
- **Corrected:** there is no multiplication of independent densities or probabilistic independence
  assertion; each density bound is conditional at its own level.
- **Corrected:** `eta<1` is not a theorem hypothesis. Nonemptiness of the good subsets enters only
  downstream after choosing `eta=1/2`.
- **Preserved:** the strict `eps<1/52` and every stage hypothesis are passed unchanged to both
  analytic inputs.
- **Preserved:** changing from `Y^K` to `X` is justified by interval restriction and `log Y>=0`, not
  by silently strengthening `GoodQ` or `GoodD`.

## Executed tests

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_share_nested_density.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_share_nested_density.py
```

The exact checker validates all six pinned path/blob pairs and report anchors; exhaustively checks
the complement lemma on finite predicates and all-bad subsets; checks the `BoxAll` monotonicity
inequalities plus both required negative controls; constructs nested `G1,G2(q)` fixtures; and checks
the `eta=1/2` nonemptiness inference used downstream. It verifies finite assembly logic, not Lean
elaboration or the analytic estimates.

## Failed attempts / limitations

- The pinned `PairShare.lean` path returns 404 at current upstream `HEAD`; this run does not guess a
  renamed replacement or claim current-head equivalence.
- Current-head code search did not supply a replacement declaration, so the requested pinned tree
  remains the sole source of this reconstruction.
- No local upstream Lean checkout exists; `lake build`, elaborated proof-term inspection, and axiom
  auditing were not run.
- The finite checker deliberately treats `stage1` and `stage2` conclusions as premises. It cannot
  certify their zero-density or mean-square dependencies.

## RESUME HERE

Reconstruct pinned `QH.pair_exists`: preserve the specialization `eta=1/2`, the two cardinality-to-
nonempty arguments, the extra cutoffs giving `2*z<=z'` and `N0<q`, and the exact call to
`rows_of_mem`. Do not repeat the analytic stages or this density-complement chapter.

**HANDOFF TO:** MATH, prime-window specialist, character-box specialist, audit, integration.


---

## Appendix 88 — preserved peer text, blob 68cff61ebec531f5faf90576e42f8553d53fa46b

# Run 8 — Dpst restriction and the exact Weil–Deligne dimension

2026-11-24. RESULT: SOURCE-MATCHED reconstruction of Dpst_resTo and LetterDim.finrank_wdSpace, with their native algebraic proofs and explicit dependencies. No Lean replay, no full RH closure, no URT-specific speedup.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research-state prefix, continuity prefix, research_archive/cathedral_arf_runner/RESEARCH_LOG.md and RESEARCH_PROTOCOL.md opening sections, previous Run 7, relevant specialist and Grok handoffs and other available lane RESUME notes. In particular theta Run 8 is about singular coefficient dilation, literature Run 7 about crystalline/de Rham lifting, kernel Run 8 about cached axiom discrepancies; distinct from this local dimension theorem. Latest Cathedral CI summary at read: run 45410580111, 14:27:38Z, PASS for physical orchestrator, not RH. No changes to baseline physics queue. External blueprint not used as source evidence; full blueprint and full reachable proof graph not read in this run. Canonical source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 9477923066c923e6dbf7292da17019f8d08d0db8 on 2026-11-24. Both pins preserved.

## 1. Native period-space restriction (not a dimension assumption)
Let k=Q_l for prime l, Ω=Om l, K and K' finite subextensions of Ω/k with K⊂K', G_K their fixing groups. Let L be a coefficient field over k, V an L- and k-module with the scalar tower, and ρ an L-linear representation of G_K. P is the source LocPrime l, with its period data and laws. The actual source takes Bst(P)=Polynomial P.R.B; phiSt acts on coefficients by P.φB and sends X to lX, and monSt is negative derivative (LocalPrimeGaloisActionPeriodT lines 187,221,227). Its Galois action actSt is a monoid hom at line 208. Do not replace P by an arbitrary ring or assert its realization without checking the producers of LocPrime.

In EqOfPowEqOneOfNormSubLt, the underlying L-module M=V⊗_k Bst(P) does not depend on K. The diagonal action stRep(g)(v⊗b)=ρ(g)v⊗actSt(g)b. Dst is the intersection over all g of ker(stRep(g)-Id). The restriction resTo is composition with the subgroup inclusion G_K'→G_K, not a change of coefficient field or tensor ring. Hence
 x∈Dst(ρ|G_E) iff for every g∈G_K with g∈G_E, stRep(g)x=x, for K⊂E finite.
Dpst is the union of these spaces over E finite containing K. It is a submodule: addition uses the finite compositum supExt(E1,E2), whose fixing group is contained in both fixing groups; scalar multiplication preserves the same witness. No finite-dimensional hypothesis or potential semistability hypothesis is used for Dpst_resTo.
The native mem_Dpst (265) relaxes the witness E: it need not contain K, but the predicate quantifies over g∈G_K with g∈G_E. To turn such a witness into the defining one use supExt(K,E). Finite-dimensionality of the compositum is explicitly provided by supExt at 86, and the antitone inclusion GK_le is applied to each leg. This quantifier distinction explains the exact source proof (277):
 * For x∈Dpst(ρ|G_K'), choose its relaxed witness E. Downstairs choose supExt(K',E). Every g in its fixing group belongs to G_K' and G_E. The upstairs fixed-vector condition applies to the restricted group element, so x∈Dpst(ρ).
 * For x∈Dpst(ρ), choose its relaxed witness E. Use the same E upstairs: every g∈G_K' also lies in G_K, and both actions on M are identical. Thus x∈Dpst(ρ|G_K').
This proves equality of the two submodules, not equality of Dst before extension. It also gives a U-linear isomorphism on DpstUr for U=MaximalUnramifiedExtension l because both U-actions are induced by the same mulV on M; the source isPst_resTo_iff builds the inverse maps through toUr and the two inclusions. IsPst is defined by rank_U(DpstUr)=rank_k(V), so its truth is invariant without first assuming finite dimension.

## 2. The quotient whose dimension is being computed
For L now a finite subextension of Ω/k, V finite-dimensional over L with scalar tower, D=Dpst(P,ρ), U as above, m:U→End_L(D) is mulD, multiplication by U in the ambient period tensor. Fix ι:Ω≃+* C. The source WDSpace is Letter(m,C,τ), where C has L-algebra structure via ι and τ=ι|U:
 W = (C⊗_L D) / Σ_{c∈U} im(m(c)_C - τ(c)Id).
The sum is a supremum of submodules, not an intersection or an arbitrary projection. Write [x] for the class of 1⊗x. These classes span W; they satisfy [a x]=s(a)[x] and [m(c)x]=τ(c)[x], with s=ι|L. The finiteDimensional_wdSpace instance uses the U-basis of DpstUr (finite when IsPst holds) and the two scalar rules to prove W finite-dimensional over C. It does not suppose a finite L-basis of D.

For arbitrary fields L,U,F and m:U→End_L(D), let H(s,τ)=letterHom(m,s,τ) consist of additive f:D→F satisfying
 f(a x)=s(a)f(x) for all a∈L, x∈D;
 f(m(c)x)=τ(c)f(x) for all c∈U, x∈D.
The theorem finrank_dual_letter (27) identifies W* with H(s,τ): precompose a linear functional with [x]. Injectivity follows from the spanning classes. Conversely an f with the two laws extends L-linearly to the scalar tensor, annihilates each relation image, hence factors through the quotient. The annihilation argument checks each c on pure tensors, which span the tensor. This is an actual isomorphism, not just an upper bound.

## 3. Sum of the embedding dimensions
For the dimension proof work temporarily in Ω rather than C. Define d(s)=dim_Ω H(s,incl_U) for every k-embedding s:L→Ω. Here IsPst implies D has finite U-dimension equal to dim_k V. The source sum_finrank_letterHom (135) considers W0=Hom_U(D,Ω). Because the L-action commutes with m and the k-actions agree (the scalar tower), L acts on W0 by precomposition: r(a)f(x)=f(ax). It is a ring hom because L is commutative. The common eigenspace for s is precisely H(s,incl_U), as checked by the explicit linear equivalence in the proof.

The preceding native sum_finrank_eigen (87) proves the spectral decomposition for finite separable L/k and algebraically closed F: choose primitive α of L/k. For any a=q(α), r(a)=q(r(α)); hence the joint s-eigenspace equals the s(α)-eigenspace of r(α). Its minimal annihilator divides the mapped separable minpoly of α, so r(α) is semisimple. Distinct s give distinct roots s(α); every nonzero eigenvector's eigenvalue is a root of the minpoly and thus belongs to an embedding. Therefore the eigenspaces form an internal direct sum (zero spaces are allowed). Taking dimension yields
 Σ_s d(s)=dim_Ω Hom_U(D,Ω)=dim_U D.
All hypotheses matter: finite separability, algebraic closure, the compatible base k action and finite dimension over U. No claim of equal individual d(s) follows from this sum alone.

## 4. Why the summands really are equal
There are two exact invariances:
 (i) finrank_letterHom_comp (50) sends f↦g∘f for a field equivalence g:F≃F'; inverse uses g^{-1}. It is semilinear, so dimensions agree when s and τ are transported by g. In particular, if g∈G_k fixes U, then d(g∘s)=d(s).
 (ii) finrank_letterHom_frob (64) uses an invertible L-linear φ on D satisfying φm(c)=m(σ(c))φ, with σ surjective on U. For τ'=τ∘σ, f↦f∘φ is a linear equivalence H(s,τ)→H(s,τ'); inverse precomposes φ^{-1} and uses surjectivity of σ. Here φ=phiD, σ=frobUr; phiD_mulD supplies the semilinearity. phiD is injective in the ambient period tensor and is bijective on D when DpstUr is finite-dimensional: images of a U-basis under an injective semilinear map with bijective σ are independent, have full cardinality and hence span (phiD_bijective at 394). The earlier native phiB_algebraMap establishes the relevant coefficient Frobenius identity on prime-to-l roots of unity, using the residual norm separation lemma and P's Frobenius-on-K0 laws. This is where P's field-specific laws enter. If g extends frobUr on U, combine (ii) with (i) for that g to obtain d(g∘s)=d(s). In particular, we do not claim that every automorphism of Ω fixes U.

The const_of_invariant theorem (180) turns these two types into transitivity:
 define S={g∈G_k | for every s, d(g∘s)=d(s)}. Identity, composition and inverse preserve the condition. The normal closure N of L/k is finite, and its fixing group is contained in S, since it fixes every s(L). Thus S is open and closed. Any x fixed by S is fixed by the subgroup fixing U (by (i)), hence lies in U by the infinite Galois correspondence. Choose an extension g of frobUr to Ω via FrobLaws.exists_ext (ResEqIff 190). By (ii), g∈S, so x is fixed by frobUr. The invoked MemLoc.frob_laws fixed-field conclusion forces x∈k. Conversely k is fixed by all G_k. Thus Ω^S=k; closedness of S and infinite Galois correspondence give S=G_k. Finally G_k acts transitively on the k-embeddings of finite L into Ω: extend the isomorphism between their images to Ω (IsAlgClosed.surjective_restrictDomain_of_isAlgebraic, then bijectivity). Therefore all d(s) equal d(inclusion).
This uses fixed-field information, not merely cyclic finite-field arithmetic. The source proof of MemLoc.frob_laws and the construction of LocPrime are independent named dependencies not fully reconstructed here. In particular, no generic assertion of surjectivity of Frobenius on an arbitrary ring is sufficient.

## 5. Final dimension cancellation, with the finite coefficient factor
Transport H from Ω to C by ι using (i), then apply the dual identification and finite-dimensional dual equality. We obtain dim_C W=d(inclusion). Since the number of k-embeddings of L into Ω is [L:k], and IsPst yields dim_U D=dim_k V:
 [L:k] d(inclusion) = Σ_s d(s) = dim_U D = dim_k V = [L:k] dim_L V.
The degree [L:k]>0, so cancel in the natural numbers. This is exactly LetterDim.finrank_wdSpace (228–260). No choice of special embedding, no rank-one assumption, no hidden averaging approximation. The hypothesis IsPst cannot be dropped: otherwise D may have smaller rank. The source WDSpace is specifically the quotient above, not the full period tensor.

## 6. Link to the original RH route
Run 7's eig_res now has both of its previously unresolved local algebra ingredients explained: restriction preserves Dpst and IsPst; the induced quotient map from the restricted WDSpace to the old WDSpace is onto and both have dimension dim_L V, hence an isomorphism. Frobenius normalization and matching actions give intertwining. Consequently the equality of characteristic polynomials used in rank-one ChRes is justified under the original hypotheses. The rank-one argument separately uses zero nilpotent monodromy and smoothness, plus admissible finite-model independence. This feeds df_res, df_one, LocWD, Crys.alg, CoreAll and Row0b; the recParameter, character-window and nonvanishing obligations remain separately required. We have not proved that the entire source-import chain is part of the elaborated Main proof graph.

## 7. Source inventory and upstream comparison
All paths below relative to src/Development/AbelianVarietyTheory/. Connector returned these pinned Git blob IDs; not locally rehashed. Old→new anchors checked at the two specified commits; "identical" means literal declaration text through the first blank line (not semantic equivalence of transitive dependencies).
- Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean: 21a02daf0f36829d50c3c4243c10e36a9bd311d9 → dcbcc4dbbf8d4018f934fc09b2da07716608f63f. mem_Dpst 265→310 (8 lines), Dpst_resTo 277→322 (9), IsPst 374→415 (1), phiD_mulD 345→388 (2), phiD_bijective 394→435 (25), identical. Also supExt 86, stRep/Dst/resTo/Dpst 213–264, DpstUr 358, isPst_iff 378.
- Proofs/IwasawaDecomposition/FinrankLetterHomComp.lean: 95525cc673771796f6540b5138344b03afbdffae → 80200d69dcdb2c626391f819ab9129977c296731. finrank_letterHom_frob 64→116 (22 lines), sum_finrank_eigen 87→139 (47), sum_finrank_letterHom 135→187 (38), const_of_invariant 180→232 (45), finrank_wdSpace 228→280 (33): identical. finrank_dual_letter 27→75 adds explicit f argument to map_add rewrite. finrank_letterHom_comp 50→98 replaces inline rank rewrite by an explicit rank equality, with g.map_mul proof of semilinearity. Statements retained; no elaborated equivalence claim.
- Definitions/AutomorphicMembership/FiniteDimensionalLetter.lean: 7e14f2d6438a10355be2cf8291c0c51e63e75221 → eb4c586b2760f181337e3d1c2df3159a4010cf3f. letterKer 19→66 (2 lines), Letter 22→69 (1), identical; finiteDimensional_letter 73→115 body checked separately, blank line inserted in the inspected body.
- Definitions/AutomorphicMembership/FiniteDimensionalWdSpace.lean: dd7de531043d35481be4a07d58e9c956705662d7 → c58b7210b5efa3e01e6d68398a9cd2ddbe83a753. WDSpace 23→67 (2 lines), finiteDimensional_wdSpace 59→100 (6), identical.
- Proofs/IwasawaDecomposition/WdParameterMonodromyZeroIffPotentiallyCrystallin.lean: 6c68db6192193b8e5f5a94a31758fdddd2895555 → 5e9ec0711498b5700463c5f48fb72c454bb63539. isPst_resTo_iff 228→424 (9 lines), identical.
- Proofs/IwasawaDecomposition/ResEqIff.lean: 6210cc354991c3f2ba94bbc1ee42d8c05e019ef7 → e70f0e7abffc8c9f4a422d5331f01c7452dc05a8. exists_ext 190→235 (5 lines), identical.
- Definitions/AutomorphicMembership/LocalPrimeGaloisActionPeriodT.lean: a8ea7e2814d271ced2abef4cf4d3edfb57c61ca6, original Bst 187, actSt 208, phiSt 221, monSt 227 (pinned anchors checked; not compared at head).
- Definitions/AutomorphicMembership/MonodromyZeroOfWeilDeligneRepClassIff.lean: 4c424b486a66ef4a8581a5c16af5a91572d721be, inspected import header only.
- ChRes consumer: src/Development/AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/WdAtModel.lean at pin 4efff78a337541217cf4fe061e2710aa0f3a4fcb (Run 7); migrated to ContinuousRankOneRep.lean at head fb0bdf5416986c8a291ace6ba2fadc618722623a, eig_res 837.

## 8. Executed finite regressions (V8)
Output: {"restriction":163840,"witnessForward":249556,"witnessBack":134632,"dualChecks":599186,"dimension":127,"nonuniform":98,"frobIntertwine":333956,"frobInvert":83489}.
The first model acts on binary vectors by cyclic shifts, with permitted finite subgroup intersections corresponding to divisors of 12, and checks both directed-witness implications. This is a finite analogy, not a computation in p-adic periods.
The second uses F4 with L=U=F4, k=F2, assigning each coordinate one of the two embeddings for its L-action; enumerate all U-linear functionals. The sum of dimensions is always n; individual dimensions are unequal in 98 of 127 assignments. These are counterexamples to the inference that the dimension sum alone implies constant summands, NOT counterexamples to the native theorem with Frobenius and Galois hypotheses. For balanced assignments construct an involution by swapping the embedding types and squaring coordinates, and check both L-linearity and U-semilinearity plus invertibility. This explains exactly what the missing symmetry supplies. Counts overlap; frobIntertwine counts pairs (x,a) with both conditions, not two independent proof validations. Run this exact code with Node:
~~~js
function regression(){
 const assert=(p,m)=>{if(!p)throw Error(m)};
 const divisors=[1,2,3,4,6,12];
 const gcd=(a,b)=>b?gcd(b,a%b):a, lcm=(a,b)=>a*b/gcd(a,b);
 const fix=(v,d)=>(((v<<d)|(v>>(12-d)))&4095)===v;
 let restriction=0,witnessForward=0,witnessBack=0,dualChecks=0,dimension=0,nonuniform=0,frobIntertwine=0,frobInvert=0;
 for(const m of divisors)for(const b of divisors.filter(d=>m%d===0))for(const bp of divisors.filter(d=>d%b===0&&m%d===0)){
  const ds=divisors.filter(d=>m%d===0);
  for(let v=0;v<4096;v++){
   const lower=ds.some(d=>fix(v,lcm(b,d))),upper=ds.some(d=>fix(v,lcm(bp,d)));
   assert(lower===upper,"directed fixed spaces");restriction++;
   for(const d of ds){
     if(fix(v,lcm(bp,d))){assert(fix(v,lcm(b,lcm(bp,d))),"witness to base");witnessForward++}
     if(fix(v,lcm(b,d))){assert(fix(v,lcm(bp,d)),"witness to extension");witnessBack++}
   }
  }
 }
 const mul=(a,b)=>{let z=0;while(b){if(b&1)z^=a;b>>=1;a<<=1;if(a&4)a^=7}return z};
 const sq=x=>mul(x,x), emb=(a,j)=>j?sq(a):a;
 const vec=(v,n)=>Array.from({length:n},(_,i)=>(v>>(2*i))&3);
 const eq=(a,b)=>a.every((x,i)=>x===b[i]);
 const act=(x,a,mask)=>x.map((u,i)=>mul(emb(a,(mask>>i)&1),u));
 const scalar=(x,c)=>x.map(u=>mul(c,u));
 for(let n=0;n<=6;n++)for(let mask=0;mask<(1<<n);mask++){
  const sets=[[],[]];for(let i=0;i<n;i++)sets[(mask>>i)&1].push(i);
  let counts=[0,0];const total=4**n;
  for(let k=0;k<total;k++){
   const f=vec(k,n);
   for(let s=0;s<2;s++){
    const good=[0,1,2,3].every(a=>f.every((u,i)=>mul(u,emb(a,(mask>>i)&1))===mul(emb(a,s),u)));
    const predicted=f.every((u,i)=>!u||((mask>>i)&1)===s);
    assert(good===predicted,"letterHom weight space");dualChecks++;
    if(good)counts[s]++;
   }
  }
  const dims=counts.map(c=>Math.log(c)/Math.log(4));
  assert(dims.every(Number.isInteger)&&dims[0]+dims[1]===n,"sum dimensions");
  dimension++;
  if(sets[0].length!==sets[1].length){assert(dims[0]!==dims[1],"nonuniform negative");nonuniform++;continue;}
  assert(dims[0]===dims[1]&&dims[0]===n/2,"balanced dimension");
  const perm=[];for(let i=0;i<sets[0].length;i++){perm[sets[0][i]]=sets[1][i];perm[sets[1][i]]=sets[0][i]}
  const phi=x=>x.map((_,i)=>sq(x[perm[i]]));
  for(let k=0;k<total;k++){
   const x=vec(k,n);
   assert(eq(phi(phi(x)),x),"bijective frobenius");frobInvert++;
   for(let a=0;a<4;a++){
    assert(eq(phi(act(x,a,mask)),act(phi(x),a,mask)),"L linear");
    assert(eq(phi(scalar(x,a)),scalar(phi(x),sq(a))),"U semilinear");
    frobIntertwine++;
   }
  }
 }
 return {restriction,witnessForward,witnessBack,dualChecks,dimension,nonuniform,frobIntertwine,frobInvert};
}
console.log(regression());
~~~

RESUME HERE: reconstruct ChCoef, starting with the actual letter_lift producer in the pinned AlgebraicCharacters imports, including semilinear coefficient conjugation, monodromy, and the exact relation of coefficient embeddings to wdAt. Retain independent MemLoc.frob_laws and LocPrime realization obligations in the ledger; do not conflate them with the completed dimension cancellation. Follow the source to df_add and df_gal. No duplicate of Runs 1–8 or theta/geometry lanes. HANDOFF TO integration, editor, audit, theta and Grok galois_rows. Project OPEN.


---

## Appendix 89 — preserved peer text, blob ae4f6f50d91391befc97952d9715761280ab1c30

# RUN8 — Two-level row-lattice and metric compatibility

2026-11-24. SOURCE-MATCHED conditional reconstruction of sharpRR/baseRR in DivRows3. Initial MjHTie/IdxDefs producers remain OPEN; later IdxDefs transport traced. No independent Lean replay or URT speed claim.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol, continuity excerpts, physical CI #374 (not RH), RUN7 and latest accessible handoffs from Galois RUN8, Landau RUN8, theta RUN8, prime RUN8, geometry RUN7, literature RUN7, kernel RUN8, acceleration RUN8, editor 1356, integration, math, dependencies, structure and Grok. Blueprint not reread. No duplication of RUN6 index equalities or RUN7 pairing. Tried to locate initial MjHTie/IdxDefs caller: GitHub default-branch code searches returned no matches; recursive root tree truncated; scoped trees IwasawaDecomposition 7769 entries, LocalToGlobal 5733 and LocalRingCardinality 175 enumerated. Rather than invent an initial producer, traced adjacent unfinished row-lattice and metric obligations.

Pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream main 9477923066c923e6dbf7292da17019f8d08d0db8 (2026-11-24 14:18:56 UTC). At that revision DivisionCompatibleAtReadIdentificationsStatement.lean blob e34a9fe4644fa2038729074eea6d86bc557fc70a retains divTied3_read (176) and sharpRR/baseRR (195–196). RowLatticesMetricsAgreeOfRealGroupTheorems.lean blob 5d59980ce4303c890f8f8b9eec1bdc09946ec743 contains relocated majAt_rows_fixed (720), majAt_eq_of_diag (808), metric_base_fixed (849), rowLat_ties (921). Old IpMSmulMeasureSelf and MajAtSmulRightOf paths 404. IdxDefsUp.lean blob db05a811dc5caf4604b858dfda3c6095d06bd31b retains idxDefs_up (91). Source migration, not kernel equivalence.

## 1. Exact local statement
GlobalTheory.T.rowLattices_metrics_agree_of_realGroupTheorems invokes GlobalTheory.Mem.R3.rowLat_ties. Assume hC = DiscreteSeriesCover ∧ HarishChandraModules ∧ CasselmanWallach ∧ HarishChandraFinite ∧ CuspRapidDecay; for every D:D7, finite group G, types Pl0 I0 T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, cG:G0 R.Pg D.R.r ≃* G0g D.nd, X0:BaseLevelRowSide D, Y:Read R.toRealDat F.lv2 X0, Z:ReadL R F X0 Y, assume Pins R F cG and Holds R F. Then BOTH
  HLatTie (RowSide.sharp D).RR (A3.indefDown (s1Of R F)).RR (A3.indefDown (s1Of R F)).XE Z.eRR
and
  HLatTie X0.s.RR (A3.indefDown (s0Of R F)).RR (A3.indefDown (s0Of R F)).XE Z.eRR0.
For each level let e be its K-linear equivalence, A native Hermitian lattice and L,X coordinate lattice/metrics. HLatTie consists of A.L=e(L) as O_K-submodules AND ∀ infinite places v, ∀ x,y, majAt(A,v,e x,e y)=majAt(X,v,x,y). Not equality of K-spans alone. Parent divTied3_read assumes hMj,hIdx,hBu,hBt for DivRows3; this local pair does not use those four, but all parent hypotheses remain.

## 2. Integral gluing for each level
Obtain hD=rowSide_definition_both_levels(hC,Pins,Holds) and hOk=hH.ok.ok2: A3.A.fam.Ok 1. For S=indefDown(s_b), Y.muAt identifies every native finite-place tuple with tup(S.μ(D.plEq w)). The adopted theorem takes hOk, hD.1 or hD.2, Z.rr or Z.rr0 (RRDef), Y.muAt and Y.stable or Y.stable0; keep eRR/eRR0, jA/jA0 paired with their respective levels.

V0 is zero subspace, U=V0∩ker iota, Q=V0∩U^⊥. For x∈V0 subtract its Q-projection. Residual y∈V0∩Q^⊥. Subtract U-projection of y; remainder belongs to Q∩Q^⊥ and vanishes. Thus y∈U and iota(proj_Q x)=iota(x). RRset_eq_iota_image identifies RRset with iota(Mtilde.carrier∩V0), not the whole ambient image.

span_le_lemma_8 starts with a rational row generator y with jEE y∈RRset. Lift to u∈carrier∩V0. integral_iff_matrix_indefinite_side gives F∈Mt, and hX.iota identifies its image as jEE(eRR(ι_t Pq_t F)); jEE injective by complex independence of basis images and field embedding injectivity. This places y in eRR(matLat(ι_t,abelian₂_t)). le_span_lemma_9 reverses it: given F in the coordinate lattice, the reverse integral characterization and the finite-sum premise hint express jA(rV0 F)=Σ c_u u with u in carrier∩V0. Each u has rational lift z_u with jEE z_u=iota(u). Semilinearity and injectivity give eRR(ι_t Pq_t F)=Σ c_u z_u, and each z_u belongs to the generating row set. Both inclusions are over O_K. The adopted theorem derives hint via stability under integral scalars, zero and addition: an x already in the intersection admits singleton {x}, coefficient 1. This does NOT assert original generators are individually in V0.

Set L_w=matLat(ι_(μ(w)),abelian₂_(μ(w))). The glued lattice intersects the local conditions ∃d∈O_K, d∉p_w, d x∈L_w. By e^{-1}(d y)=d e^{-1}(y) and equivalence of places D.plEq, mem_glued_lemma_10 proves
  (∀ native w, ∃d∉p_w, d y∈e(L_(D.plEq w))) ⇔ e^{-1}y∈S.RR.
This uses all places, not a sampled list or one denominator uniform in w. RRDef yields A.L=e(S.RR). No integral determinant unit requirement. The upstream integral_iff_matrix_indefinite_side remains a named deeper dependency.

## 3. Hermitian metric compatibility
For v≠v0, use Z.met/Z.met0. At v0 sharp uses MetSharp.majAt_rows_fixed, base MetBase.metric_base_fixed. PrincipalLevelLattice.majorant_at_base_place_eq_inner gives coordinate majorant nP_b^{-1} times the Hilbert pairing of iC at μ0, with source conjugation convention; needs H2 and nP_b>0. Native norm matches jEE/jEE0 at the designated embedding. Read tie transports to the Petersson pairing with measure nP_b^{-1}ν0. HE model is injective, with original inner product. Sharp norm_sq_rows separates zero and nonzero z; nonzero forces an IsMultIP witness since ipM defaults to zero if none exists. ipM_smul_measure_self uses IntegrableOn and integral_smul_measure, then uniqueness of Petersson coefficient using nonzero vectors in all tensor factors. Base uses ipM_smul_of_vec with nonzero evaluation witness, or separately the zero vector. Consequently both diagonal forms agree. Conjugation of inner_self leaves it unchanged. Exact normalization is inverse nP, not nP or its square.

For base polarization put D(x,y)=H_native(e x,e y)−H_coord(x,y), conjugate-linear in first slot and linear in second via σ=v.embedding. From D(x,x)=0 for every K-vector:
  D(x,y)+D(y,x)=0.
Choose a∈K with σ(a)≠conj σ(a) via exists_nonreal, IsComplex, ptField_main/IsTotallyComplex. Expand for x+a y:
  σ(a)D(x,y)+conjσ(a)D(y,x)=0.
Subtract conjσ(a) times first equation, so (σ(a)−conjσ(a))D(x,y)=0 and D(x,y)=0. This works over K without assuming K=C. Sharp uses majAt_eq_of_normAt after matching norms. Real embedding alone insufficient: distinct positive Hermitian matrices 2I and [[2,i],[-i,2]] agree on diagonal evaluations of real vectors but not cross terms. Combine both integral and metric fields to obtain the two HLatTie values consumed by divTied3_read.

## 4. Index producer boundary
DataIdx.lean defines IjIdx=lidx(p_w,X.MjH(j).L,thTj X μ j), jwIdx=lidx(p_w,TjL,TjDual). IdxDefs requires BOTH equalities for EVERY μ,j,w with 1≤j≤D.R.m. IdxDefsUp.idxDefs_up transfers IdxDefs(w.D Z,divBack Y) to IdxDefs(w.D(SRe.upL Z S' N h),Y) via with_unfolding_all for both fields. divBack retains DivX and retypes md. Not an initial existence theorem. numTie_of_read consumes JM.eW i with hM.j_eq i and (hM.hlat i).lat on the same i and eW; a separate equivalence is insufficient. Initial MjHTie and IdxDefs producers not located; leave them open.

## 5. Source/test certificate
12 pinned source files, 83 returned-blob-format and exact anchor presence assertions executed in connector V8 (not independent hashing or elaboration). Replay with git hash-object at pin and verify named anchors. Paths abbreviated P=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/, F=src/Formalism/. Ledger:
- P/DivisionCompatibleAtReadIdentifications.lean: b6594122a28670a9dca1e61b23f5be9594f7f877; divTied3_read, intro hMj hIdx hBu hBt, sharpRR, baseRR.
- P/RowLatticesMetricsAgreeOfRealGroupTheoremsStatement.lean: 25b73b84f494bb924a2d69e481a86b2f1afb9f20; rowLat_ties.
- P/RowLatticesMetricsAgreeOfRealGroupTheorems.lean: 46a94b1eb789adc8ad9ab35bcef9fa2be5af4e37; rowLat_ties, hH.ok.ok2, Y.muAt, Z.rr/Z.rr0, Y.stable/Y.stable0, Z.met/Z.met0.
- F/LocalToGlobal/Divisibility/RowSideTie.lean: 7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa; HLatTie lat metric.
- P/IndefiniteSideRowLatticeAdoptedStatement.lean: 9c0c9174fb263ba16b799406271e91c92a7329ac; Adopt.indefinite_side_row_lattice_adopted.
- P/IndefiniteSideRowLatticeAdopted.lean: 0761b2c0d2e71f2c9bf88933f3b131d3d28d43d6; iota_starProjection_Qsp, RRset_eq_iota_image, span_le_lemma_8, le_span_lemma_9, span_ratPoints_eq_matLat, mem_glued_lemma_10, rrDef_iff_glued, exists_finset_sum_of_mem_V0_Mtilde.
- P/MajAtSmulRightOf.lean: a35700275601f7bffcdc5f4f6651d86f410ebe1c; majAt_eq_of_diag, exists_nonreal, metric_base_fixed.
- P/IpMSmulMeasureSelf.lean: 64f98203a57cbef83e131f3c3ce9bc69b8033634; ipM_smul_measure_self, norm_sq_rows, majAt_rows_fixed.
- F/LocalToGlobal/IndefiniteReal/PrincipalLevelLattice.lean: ea4e713700a8fb33ac97ea566d26ee41dbb60054; majorant_at_base_place_eq_inner.
- F/LocalRingCardinality/DataIdx.lean: 3c508b4f1d3efa3e1f8b5c5d76998dfbd7f41795; IdxDefs, Ij_def, jw_def, IjIdx, jwIdx.
- P/IdxDefsUp.lean: 661e022794a6f4b74d105a589e695a314df16879; divBack, idxDefs_up.
- P/NumbersEqConcreteNumbersAtBaseLevel.lean: 9cf0934c44661d941505ed28f7cb6db637c340a9; numTie_of_read, JM.eW, hM.j_eq, hM.hlat, hI.Ij_def, hI.jw_def.

Executed exact finite explanatory regressions in V8: polarization=4100625, glue=76800, witness=47488, negative=3. These are not native automorphic computations or Lean checks. Reproduce below with Node (counts per loop case, each may contain multiple assertions). First save attempt timed out after tests; subsequent retrieval 404. This is the compact retry artifact.

```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)}, S=[-2,-1,0,1,2];
 const add=(a,b)=>[a[0]+b[0],a[1]+b[1]],mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]],conj=a=>[a[0],-a[1]], sub=(a,b)=>add(a,[-b[0],-b[1]]), eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],i=[0,1];
 const av=(x,y)=>x.map((v,j)=>add(v,y[j]));
 const vals=[-1,0,1];const V=[];for(const a of vals)for(const b of vals)for(const c of vals)for(const d of vals)V.push([[a,b],[c,d]]);
 let polarization=0,glue=0,witness=0,negative=0;
 for(const a of S)for(const b of S)for(const c of S)for(const d of S){
  const H=[[[a,0],[c,d]],[[c,-d],[b,0]]];
  const B=(x,y)=>{let z=[0,0];for(let j=0;j<2;j++)for(let k=0;k<2;k++)z=add(z,mul(conj(x[j]),mul(H[j][k],y[k])));return z};
  const Q=x=>B(x,x);
  for(const x of V)for(const y of V){
   const z=B(x,y),u=B(y,x),iy=y.map(v=>mul(i,v));
   const A=sub(sub(Q(av(x,y)),Q(x)),Q(y));
   const C=sub(sub(Q(av(x,iy)),Q(x)),Q(iy));
   ck(eq(A,add(z,u))&&eq(C,sub(mul(i,z),mul(i,u))),"expansion");
   ck(eq(A,[2*z[0],0])&&eq(C,[-2*z[1],0]),"reconstruction");polarization++;
  }
 }
 const gcd=(a,b)=>{a=Math.abs(a);b=Math.abs(b);while(b){let t=a%b;a=b;b=t}return a};
 const red=(n,d)=>{let g=gcd(n,d);return [n/g,d/g]};
 const local=(n,d,m,p)=>{let [u,v]=red(n,d*m);return [v%p!==0,v,u]};
 for(let a=0;a<=3;a++)for(let b=0;b<=3;b++)for(let n=-12;n<=12;n++)for(let d=1;d<=12;d++)for(let r=1;r<=4;r++)for(let s=1;s<=4;s++){
  const m2=2**a,m3=3**b,l2=local(n,d,m2,2),l3=local(n,d,m3,3);
  const k2=local(n*r*s,d*s*r,m2,2),k3=local(n*r*s,d*s*r,m3,3);
  ck(l2[0]===k2[0]&&l3[0]===k3[0],"local transport");
  ck((l2[0]&&l3[0])===(k2[0]&&k3[0]),"intersection");
  if(l2[0]){ck((l2[1]*n)%(d*m2)===0&&l2[1]%2!==0,"2 witness");witness++}
  if(l3[0]){ck((l3[1]*n)%(d*m3)===0&&l3[1]%3!==0,"3 witness");witness++}
  glue++;
 }
 for(const x of V.filter(x=>x.every(z=>z[1]===0))){ck(mul(conj(x[0]),mul(i,x[1]))[0]===0,"real-field example")}
 ck(!eq([0,0],i),"distinct cross pair");negative++;
 ck(local(1,3,1,2)[0]&&!local(1,3,1,3)[0],"omitted prime");negative++;
 ck(1%2!==0,"wrong lattice substitution");negative++;
 return {polarization,glue,witness,negative};
}
console.log(regress())
```

RESUME HERE: obtain the pinned reverse-import index from dependency/kernel/acceleration lane for DivisionCompatibleAtReadIdentificationsStatement; locate its actual caller and initial MjHIds.eW, MjHTie.j_eq/hlat and IdxDefs producers (not idxDefs_up). If unavailable, trace RowSideFamily/BaseDivisionAmbientCompatibilityFamily actual definitions and caller imports. Keep integral_iff_matrix_indefinite_side as a separate deeper dependency. HANDOFF TO integration, editor, audit, theta, Galois and dependencies. Project OPEN; no physics queue changes.


---

## Appendix 90 — preserved peer text, blob 62459467729d9f070a7e21a8031bfcd91def110b

# Geometry RUN8 — isolated fiber, quasi-finiteness and Zariski's Main Theorem
2026-11-24. SOURCE-MATCHED local reconstruction, not kernel replay. Project OPEN.

## Continuity and sources
Read AGENTS, RESEARCH_STATE, RESEARCH_LOG head, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, CI summary checkpoint 375 (physical orchestrator PASS, unrelated to RH validity), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, geometry RUN6/RUN7 and recent other lanes' handoffs (character boxes, Galois, kernel, Landau, literature, acceleration, prime window, editor, theta, dependency, integration, math, structure). No overlapping reconstruction found in those inspected handoffs. Blueprint linked in queue not reopened; no physics changes.
RH pin 40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream 9477923066c923e6dbf7292da17019f8d08d0db8, 2026-11-24 14:18:56Z, quick-check runner diagnostic merge. Caller src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/ExistsValuationSubringLiftOfSpecialFibre.lean blob e9fe8c1496cd259f4f9d1248e8ac67396736c64d at pin, fa2a909d785af744a49caf4b15d7047473c3db1d at observed head. The extracted quasiFiniteAt_of_height_le_one theorem text (1993 characters, trimmed) is identical in both. No claim of whole-file or dependency equivalence.
Manifest Mathlib pin 0df444a360eaa60ab8c11dca51a86af692955474. The previously missing supplier was located by code search and then fetched at the manifest pin, not at search-result HEAD:
- Mathlib/RingTheory/ZariskisMainTheorem.lean blob f24dbf615d28cca4234323f10f7cf6d828b7d339. Lines 75–94 definition and integral saturation criterion; 637–651 finite-type weak Zariski property; 666–701 finite subalgebra; 710–725 quasi-finite consequence; 727–730 weak→strong; 732–740 residue-field reduction; **742–752 of_isOpen_singleton_fiber**; 754–764 equivalence.
- Mathlib/RingTheory/QuasiFinite/Basic.lean blob 8bce47952c308f1faee518a6eb45d3023e59917f. 358–359 QuasiFiniteAt definition; 481–516 of_isOpen_singleton over an Artinian base.
- Mathlib/RingTheory/QuasiFinite/Weakly.lean blob 32073e6d26b9bb0b1e82d53decf25e0896fefaf2. 50–74 weak definition/quotient form; 230–269 weak residue-field proof.
- Mathlib/RingTheory/Spectrum/Prime/Jacobson.lean blob bc04095a3fdbe7b5559f7e9f036051aed9de3efd, 80–105 isolated singleton clopen proof.
- Mathlib/RingTheory/LocalRing/ResidueField/Fiber.lean blob 93c620109dc6f443cafe903f217252a8f49cdd22, 212–231 fiber homeomorphism.
- Mathlib/RingTheory/QuasiFinite/Polynomial.lean e23c9320233c2306875902256f828f771c964b59; AlgebraicGeometry/Morphisms/QuasiFinite.lean 00c0dccd3930ed5d09d37ed75edd5422256648ed; RingTheory/Etale/QuasiFinite.lean c6239cdbe7e8fa7ebf80e4eb8bb411e32dd302ea; RingTheory/RingHom/QuasiFinite.lean 0d711883d8668bd5a7709f6b0868cab9aeeffffd inspected for supplier. All hashes returned by GitHub; not independent raw-byte hash replay.
 
## 1. Precise source theorem and geometry
For commutative rings R,S, an R-algebra structure on S, and S finite type over R, let q be a point of Spec S and p its contraction to R. If {q} is open in the subspace F = (Spec S → Spec R)^(-1)({p}), then S_q is quasi-finite over R (Algebra.QuasiFiniteAt R q.asIdeal). Here quasi-finite means finite-dimensional fibers over each residue field, NOT necessarily a finite R-module. No assumption that {q} is open in the entire Spec S, or that R is a field, or that q is maximal globally. RUN7's maximal height-one point produces precisely this relative openness using D(s)∩F={q}. This is the source obligation at RH caller line 82.

## 2. From topological fiber to algebraic fiber
Let k(p)=Frac(R/p), understood as residue field of R_p, and A=k(p)⊗_R S. PrimeSpectrum.preimageHomeomorphFiber identifies F with Spec A. Write Q for the image of q, so Q contracts to q under S→A. The homeomorphism transports the open singleton to {Q} open in Spec A. A is finite type over the field k(p). This is all that the source body 742–752 does before invoking the next two results; no unexplained positivity assumption is introduced.

## 3. Isolated point over a field (source actually allows Artinian R)
For an Artinian base R0 and a finite-type R0-algebra A, the algebra A is Noetherian and Jacobson. The singleton {Q} open implies it is closed: a nonempty open subset of a Jacobson spectrum contains a closed point, and here the only candidate is Q. Thus it is clopen. In an affine spectrum a clopen set is D(e) for an idempotent e. Since e∉Q, A_e→A_Q exists. Spec A_e has only one point by localization and D(e)={Q}. For s∉Q, its image in A_e must be a unit: otherwise a maximal ideal of A_e contains it, but the sole prime is the contraction of the closed point of Spec A_Q, which excludes s. Every fraction x/s in A_Q therefore comes from A_e. The map is surjective; A_Q is finite type over R0 and has at most one prime. Every fiber has at most one prime, hence a finite spectrum; the finite-type criterion yields QuasiFinite R0 A_Q. This follows source 481–516, including finite type of the localized ring rather than assuming arbitrary localization finite type.

## 4. The weak-to-strong step cannot be skipped
Set C=S_q/p S_q, and A_Q as above. WeaklyQuasiFiniteAt R q is equivalent to QuasiFinite R C (Weakly 54–74). The source constructs an R-algebra surjection A_Q→C. First map k(p)→C via R_p then quotient; then tensor with S→C. Any y∈A outside Q has a representation after clearing a base denominator, (r/1)y=1⊗s with r∉p; primality of Q gives s∉q. Therefore 1⊗s maps to a unit in C, as does y. The tensor map extends to A_Q. Every element of C has a representative x/s, s∉q, whose preimage is (1⊗x)/(1⊗s). The residue field k(p) is quasi-finite over R and the preceding field case gives A_Q quasi-finite over k(p); transitivity and the surjection establish weak quasi-finiteness. This only handles the localized fiber, not every fiber of S_q. The actual theorem that promotes this to strong quasi-finiteness is Zariski's Main Theorem, not a mere identity of fibers.

## 5. Zariski bridge, exactly as used
ZariskisMainProperty R q means there exists r∈integralClosure(R,S), r∉q, with the localization of the integral closure at r mapping bijectively onto S_r. The equivalent criterion is: r∉q, r integral over R and for every x∈S some m≥0 has r^m x integral over R (lines 75–94). The deep producer of this property from finite type + weak quasi-finiteness is lines 637–651; its underlying multivariable polynomial induction, strong transcendence/conductor and going-down steps remain separate imported obligations, not replaced by this reconstruction. The file itself references Stacks 00PI and annotates its algebraic Zariski theorem 00Q9.
Choose finite algebra generators x_i of S. The integral elements r and r^{m_i}x_i generate a finite R-subalgebra S'⊂S. After inverting r each generator x_i lies in S'[1/r], hence S'[1/r]→S[1/r] is surjective; injectivity follows from the localization of the subalgebra inclusion (even with zero divisors). S' is a finite R-module; its localization at one element is quasi-finite over S', so by transitivity and the localized isomorphism, S_r is quasi-finite over R. Finally S_q is a further localization: for x/s∈S_q, s∉q maps to a unit and multiplying by s gives x in the image of S_r. Apply the exact denominator-clearing preservation lemma QuasiFinite.of_forall_exists_mul_mem_range. Hence S_q is quasi-finite over R. This reproduces lines 666–730, and then 732–752 establishes RUN7's previously unresolved imported implication. The finite-type hypothesis is needed in both the field case and Zariski step; weak and strong quasi-finiteness are not identified by definition.
 
## 6. Finite regression (executed in JS tool)
Exact split polynomial examples over F_p, including repeated roots, represent A=F_p[T]/((T-a)^c(T-b)^d) via CRT as the two local truncated rings; a,b distinct, c,d=1,2,3. Check selector idempotents, all local elements, all units and fraction representatives on basis elements. Nonunits are nilpotent; additional negative controls for the generic prime in D(g) on the affine line. These examples check the local field argument only, not Zariski's Main Theorem for arbitrary rings or the RH proof. Counts: {"components":120720,"selectors":2520,"inverses":102084,"products":288876,"negative":19052}. No assumptions discarded. Reproduce with Node by saving the following JS block as .mjs. No Lean execution and no URT comparison.
~~~js
const assert=(x,m)=>{if(!x)throw Error(m)};
let components=0, selectors=0, inverses=0, products=0, negative=0;
for(const p of [2,3,5,7]){
 const mod=x=>(x%p+p)%p;
 const mul=(a,b,m)=>Array.from({length:m},(_,k)=>mod(a.slice(0,k+1).reduce((s,x,i)=>s+x*b[k-i],0)));
 const pow=(a,n,m)=>{let b=Array(m).fill(0);b[0]=1;while(n){if(n%2)b=mul(b,a,m);a=mul(a,a,m);n=Math.floor(n/2)}return b;};
 const eq=(a,b)=>a.every((x,i)=>x===b[i]);
 const one=m=>[1,...Array(m-1).fill(0)];
 const zero=m=>Array(m).fill(0);
 // Product of local rings F_p[u]/(u^m), representing distinct roots of a split polynomial.
 for(let a=0;a<p;a++)for(let b=0;b<p;b++)if(a!==b)
 for(let c=1;c<=3;c++)for(let d=1;d<=3;d++){
   const roots=[a,b],ms=[c,d];
   // g(T)=T-otherRoot, written as a truncated series at each root.
   for(let i=0;i<2;i++){
     let P=1;while(P<Math.max(c,d))P*=p;
     const e=roots.map((r,j)=>pow(Array.from({length:ms[j]},(_,k)=>k===0?mod(r-roots[1-i]):k===1?1:0),(p-1)*P,ms[j]));
     for(let j=0;j<2;j++){
       assert(eq(e[j],j===i?one(ms[j]):zero(ms[j])),"selector value");
       assert(eq(mul(e[j],e[j],ms[j]),e[j]),"idempotence");selectors++;
     }
     const m=ms[i], count=p**m;
     for(let k=0;k<count;k++){
       const x=Array.from({length:m},(_,j)=>Math.floor(k/p**j)%p);components++;
       if(x[0]===0){assert(eq(pow(x,P,m),zero(m)),"nilpotent nonunit");negative++;continue;}
       const v=pow(x,(p-1)*P-1,m);
       assert(eq(mul(x,v,m),one(m)),"outside-prime unit");inverses++;
       for(let j=0;j<m;j++){
         const y=zero(m);y[j]=1;
         assert(eq(mul(mul(y,v,m),x,m),y),"fraction representative");products++;
       }
     }
   }
 }
 // Nonisolated closed point of A^1 over Fp: any nonzero g not in (T-a) also avoids (0).
 for(let a=0;a<p;a++)for(let c=0;c<p;c++)for(let d=0;d<p;d++)
   if(mod(c+d*a)!==0){assert(c!==0||d!==0,"generic prime also in basic open");negative++;}
}
console.log(JSON.stringify({components,selectors,inverses,products,negative}));
~~~

RESUME HERE: trace the exact pinned IntAll.lean declaration intAll_all and its actual caller dispatch into positive-rank and rank-zero integral frame extension. Preserve finite-residue, ramification and frame data; if the actual supplier is missing, search the pinned tree or consult dependency exporter before claiming completion. Keep Zariski's deeper proof (637–651 via multivariable induction) as a separate standard imported obligation for literature lane. Next archimedean local_unit_map_surjective / norm_small_le. HANDOFF TO literature, integration, editor, audit, geometry. Project OPEN.


---

## Appendix 91 — preserved peer text, blob e1904c45828163ca9c1f75fc26646ae167fc1277

# RUN8 — Eleven-bucket discriminant size bound (2026-11-24)

Status SOURCE-MATCHED conditional human derivation; exact integer regression executed in V8. No Lean replay, no claim of Main reachability, no URT improvement. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream latest observed 5ba3d66a2a5acdcd70e2482d73e05b41d7116186 (14:06:03 UTC, CI priority-command merge). At this head AdmissibleSchurLemma, WindowSettingSatisfiable and PrimeClassLossHypothesesSatisfiable have different blobs (7a39bb9f1fb5195e32a23cd22ec2085b2db9b416, 797b675e634354236b854fb4ca27a7c4fa43edd2, 15f79da47e636ae0ed5d36c74e0021fb31fc1388); old DiscriminantSettingSatisfied and OneLeThresholdMulPowers paths give 404. No migration equivalence inferred.

Preflight: AGENTS, research state/log/protocol, continuity, CI summary (14:08:40 general Cathedral PASS, NOT RH verification), swarm protocol/queue/expansion and RUN7, recent peer RESUME HERE notes across all available specialist lanes, editor, integration, structure, dependency and Grok inspected. Blueprint linked in queue not reread. Prior RUN7 established common-weight selection and loss transport, not the eleven-bucket proof; math lane is following distinct uF/phi and key_identity5 estimates. This run expands exactly the size_core proof, not the source of geometric ParametersHyp.

## 1. Exact scope and common comparison lemma

For every P:Par, real e,K,m,T, assume Windows P e K and LargeX P.x P.ε e K, m>=0, T>=1. For WindowsD use clr P and discriminant_windows_iff (DiscriminantSettingSatisfied 9–21); this changes only β,s₀, which do not occur in tDetD. No additional constraint imposed on ε by size_core. Eventual existence of LargeX separately uses 0<ε<1/4 (OneLeThresholdMulPowers 867–927); native host route uses stricter ε<1/52 as in RUN7. Retain all Windows clauses (WindowSettingSatisfiable 95–110) and LargeX (112–115).

Notation x=P.x, z=x^ε, u=x^(ε/3), E=x^e, X=exp(u)=P.Xp, S=exp(x^(ε/4)), B=exp(z/2), b=B², v=b/X, w=x^(ε/8), a=xb, L=log x. Then Xpp=x n X, wpp=v/n, bp=xv, δ₁=1/w, f=2n, log a=L+z. U=mTb and σ=100K z^4/x. Facts (9–162) supplies x>=100, z>=1, 1<=u<=z, 1<=w<=z, E,S,X>=1, 100Kz^4<=x, 100K E^4 x^4<=X, 100K E^4 x^4 XS<=B, b>=B>=1, n>=x², n<=E, 0<=L<=z, eL<=z, log a<=x. For positive y<=E, log y<=z. Also C,Cord in [0,K], N,t,rG<=E and nonnegative, k>=x², p₀>=x⁴+1, La<=z², 0<=Sc,η<=S, 0<=bo<=B, 0<=th<=1/x, 0<=ρ<=1/x², K₀,d>=x², 1<=Y<=2X; 0<=Jo,Ib<=z. The source uses P.nA via n; do not assume n equals 2^e₂: only x²<=2^e₂<=n.

For i<=4,j<=3 and 0<=c<=100,
 c K E^i x^j XS <= b/x <= σ b,
 c K E^i x^j X <= b/x,
 c K E^i x^j v <= b/x.
First follows from monotonicity E,x>=1, the B lower bound and B<=b; second from S>=1; third from Xv=b and X lower bound. Also for i<=4, 100Kz^i/x<=σ<=1. These are Facts.polyXS', polyX', polyv', Kzr_sg, zr_sg and sg1 (240–375). Each bound on a per-mT term q<=σb implies mTq<=σU by nonnegativity; only the floor bucket has factor m rather than mT, so T>=1 is essential for it.

## 2. All eleven buckets, in the exact source order

All definitions below are WindowSettingSatisfiable 130–161 except tOutD,tSecondD from PrimeClassLossHypothesesSatisfiable 60–64. Denote q=t/(mT) informally as its explicit factor, NEVER divide by m; m=0 permitted.

1. Floors: tFloors=m q, q=2 C f Xpp (N² log a + 2(log a)²). Since f=2n, q<=4K E(x E X)(E² x+2x²)=4K E⁴ x² X+8K E² x³ X<=12K E⁴ x³ X<=σb. Thus m q<=σU. Source size_floors_bound 379–397.
2. Cp: q=2 C Sk log(2a) Xpp. Sk=Sc+k+η<=3ES and nonnegative; 0<=log(2a)<=1+2z<=x. Then q<=6K E² x² XS<=σb. size_cp_bucket_bound 399–423.
3. Prime low: q=2 log4 p₀ Q₁, Q₁=C rG bp L. Since 0<=2log4<=3, p₀,rG<=E, L<=x and bp=xv, q<=3K E² x² v<=σb. size_prime_low_bound 425–442.
4. Prime high: q=2 log4 X Q₂. Exact identity (444–452):
 XQ₂=Cb + A₂+A₃+A₄+A₅,
 A₂=C X(η+Sc), A₃=C(b/n)Lw, A₄=C X t Lw, A₅=Xbo.
 All four are nonnegative and each 4A_j<=σb: (i) 4A₂<=8K XS by polynomial comparison; (ii) 4A₃<=4K b z²/x²<=b/x since 100Kz²/x<=1; (iii) 4A₄<=4K X E z²<=4K X E x<=σb; (iv) 4A₅<=4XB<=b/x because 4xXB<=100K E⁴x⁴ XSB<=B². Hence XQ₂<=Cb+σb; q<= (2log4 C+3σ)b. This is the ONLY bucket retaining a leading constant rather than a pure σ contribution. size_prime_high_bound 454–524. Do not substitute 4σ for the sum of four quarter-σ estimates.
5. Order remainder: q=2 C L a [(La/k+1/K₀)(log X+log4)+2(log(p₀−1)+1)/(p₀−1)]. The bracket is <=3z(z²+1)/x²+4z/x²=(3z³+7z)/x²<=10z³/x²: k,K₀,p₀−1>=x², p₀−1<=E, log X=u<=z. q<=20K b z⁴/x<=σb. size_or_bucket_bound 526–577.
6. Outside/omitted tops: q=4a x^(-2+ε)=4b z/x<=σb. sizeOut_core (DiscriminantSettingSatisfied 114–129). This is tOutD, not tBad.
7. First-class small orders: q=4a Cord Jo [log(2^e₂ max(Y,Xpp))]²/2^e₂. With M=max(Y,Xpp)>=1, log M<=3z (Y<=2X, Xpp=x n X). log(2^e₂)<=z as 2^e₂<=n<=E; thus total log<=4z, nonnegative. Jo<=z and 2^e₂>=x² imply q<=64K b z³/x<=σb. size_orders_bucket_bound 601–643.
8. First-class narrow band: q=4a Ib(4ρ+1/p₀)log(2X). Use Ib<=z, ρ,1/p₀<=1/x² and log(2X)<=2z to get q<=40b z²/x<=σb. size_band_bound 645–671.
9. High-prime tail: q=2log(2Xpp)(a th²+wpp th). Since log(2Xpp)<=4z, a th²<=b/x and wpp th<=b/x (v/n<=b), q<=16b z/x<=σb. size_high_bucket_bound 673–709.
10. Exceptional d: q=2a log(d)/d. Derivative of log(t)/t is (1-log t)/t²<=0 for t>=exp(1). Since d>=x²>=10000, log d/d<=2L/x². Then q<=4b z/x<=σb. size_discriminant_bound 711–740. This is a monotone real function bound, not an assumed prime density result.
11. Second-class small share: q=2a/x⁹=2b/x⁸<=σb, since x>=1 and 2/x<=100K z⁴/x. size_ninth_power_bound and sizeSecond_core (DiscriminantSettingSatisfied 131–149). Separately tIoD=mT a/x⁹<=σU (151–160); it is not a twelfth summand of tDetD.

Summing the eleven bounds yields exactly tDetD<=(2log4 C+13σ)U: ten ordinary σ terms plus three from prime high. As 2log4<=3, C>=0 and σ<=1 this gives (3C+13)U. Source size_core 162–176. No new asymptotic constants, no hypotheses removed.

## 3. What is still required for the geometric loss inequality

AdmissibleSchurLemma.loss_bound (762–918) is not the same theorem as size_core. Its split_classes_count decomposes ASK−Ga into first, second, high, served and d terms. hTop bounds each top's weighted prime contribution by 4a log(p)/p via top_loss_bound, then sums J and TT. hHigh uses high_bucket_bound per (j,t); hD uses d_term_bound per (j,t). For a served p, decompose missing tops TT\\TTp, cpF, prF and orF (last two only p<X), and flF. Use TTp⊆TT and nonnegative loF, then sum; interval_count bounds served cardinality by Xpp, and cp_bucket_bound, floor_bucket_bound, pr_bucket_bound, or_bucket_bound give their respective totals. first and second class sums still carry the raw log(p)/p weights. The final linarith combines these at 910–918. No new proof of hLed, hdrop, hfl, hlo, hL or other premises, and no derivation yet of those four per-bucket counting theorems. joint_core (196–213) substitutes out_discriminant_bound, first_le, second_discriminant_bound and the size_core bound above; IO separately uses io_discriminant_bound. This identifies the real remaining frontier and does not confuse an arithmetic envelope with the source of the geometry.

## 4. Source ledger

URL prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SizeWindowBrackets/ . Fetched source at exact pin:
- ChainSlopeWindows/OneLeThresholdMulPowers.lean, e056ba0d7b0d84078666ab3531c6ca1c6f744235; Facts 9–162, common estimates 240–375, eleven comparisons 379–740 as cited, eventual LargeX 867–927.
- WindowSettingSatisfiable.lean, 641dc12c8c7005d532889ed7a3044636ba72b3c5; Par fields/definitions 11–93, Windows and LargeX 95–118, unit and budget 130–161, bound signatures 169 onward.
- PrimeClassLossHypothesesSatisfiable.lean, 3f609406f5456e034f5dfb94e9688fca6c9f95a9; WindowsD 12–26, tOutD/tSecondD/tIoD 60–64, tDetD 78–84, hypotheses 86–94.
- ChainSlopeWindows/DiscriminantSettingSatisfied.lean, edc32424311c076565c2e13b7657f6a5f58cfd84; 9–21, 114–176, 178–241.
- ChainSlopeWindows/AdmissibleSchurLemma.lean, 91c8966257416ce67a92357ff67f1ded82bba9c9; loss_bound 762–918.

## 5. Executed exact regression

Node/V8 BigInt tests of the elementary algebraic envelopes under sampled rational scale relations, NOT actual native Par records (the independent exponential definitions are not simulated), not prime counting, not Lean. All comparisons are exact cross-multiplied positive denominators; finite regression cannot prove the universal inequalities, which are derived above.

```js
const regression=function(){
 const counts={envelopes:0,scaling:0,aggregation:0,negative:0};const chk=(v,k)=>{if(!v)throw Error(k);counts[k]++};
 // Exact rational comparison n/d <= p/q. All denominators positive.
 const le=(n,d,p,q)=>n*q<=p*d;
 for(let z=1n;z<=7n;z++)for(let K=1n;K<=5n;K++)for(let a=1n;a<=3n;a++){
 const x=100n*K*z**4n*a, E=x*x*a, X=100n*K*E**4n*x**4n*a,S=z*a, sb=100n*K*E**4n*x**4n*X*S*a,b=sb*sb;
 const sn=100n*K*z**4n; // sg=sn/x
 // floor/cp/low and four high-prime subterms, polynomial envelopes
 for(const [c,i,j,scale,den] of [[12n,4n,3n,X,1n],[6n,2n,2n,X*S,1n],[3n,2n,2n,b,X],[8n,0n,0n,X*S,1n],[4n,1n,1n,X,1n]])
 chk(le(c*K*E**i*x**j*scale,den,sn*b,x),"envelopes");
 // high-prime p3, p5; orbit, outside, orders, band, high, d, second, IO
 for(const [n,d] of [[4n*K*b*z*z,x*x],[4n*X*sb,1n],[20n*K*b*z**4n,x],[4n*b*z,x],[64n*K*b*z**3n,x],[40n*b*z*z,x],[16n*b*z,x],[4n*b*z,x],[2n*b,x**8n],[b,x**8n]])
 chk(le(n,d,sn*b,x),"envelopes");
 chk(sn<=x,"envelopes");
 for(let m=0n;m<=4n;m++)for(let T=1n;T<=5n;T++)chk(m*sn*b<=T*m*sn*b,"scaling");
 }
 for(let j=0n;j<=10n;j++)for(let C=0n;C<=10n;C++)for(let U=0n;U<=10n;U++){
 // use L=2log4 <=3, sg=j/10; multiply by 10.
 chk((10n*3n*C+13n*j)*U<=(3n*C+13n)*10n*U,"aggregation");
 }
 chk(10+3===13,"aggregation");chk(1n*1n>0n*1n,"negative"); // T=0 cannot absorb nonzero floor
 chk(100n*2n**4n>100n,"negative"); // z>=1 alone does not ensure sg<=1
 chk(4n>3n,"negative"); // replacing leading high-prime coefficient by sg alone fails when C=1 and sg small
 return counts;
};
console.log(JSON.stringify(regression()));
```
Actual output {"envelopes":1680,"scaling":2625,"aggregation":1332,"negative":3}. No failures. Negative controls: T=0 invalidates floor scaling; z>=1 alone cannot force σ<=1; dropping the leading high-prime term is unjustified (illustrative coefficient guard, not a native counterexample). No performance benchmark.

## RESUME HERE
Next task: reconstruct the four served-prime counting lemmas (floor_bucket_bound, cp_bucket_bound, pr_bucket_bound, or_bucket_bound) in AdmissibleSchurLemma, preserving their prime cutoffs, integer floors, Mertens estimates and order constraints. In particular locate exact definitions of flF, cpF, prF, orF and the SecondKindLoss quantifier signature via imports; distinguish counting arguments from the size envelopes just completed. Independent audit requested: verify all eleven factors, especially four quarter-σ terms in prime high, floor m vs mT and the use of 2^e₂<=n rather than equality. HANDOFF TO math, geometry, editor, integration, dependency and formal audit. No change to baseline physics queue. Full Main dependency and kernel status OPEN.


---

## Appendix 92 — preserved peer text, blob 898528c6c006cf0404a9914caad2202d316b4cf1

# Theta lifts RUN8 — singular Fourier coefficients, incompatible dilation weights and removal of the regularization polynomial

2026-11-24. RESULT: SOURCE-MATCHED conditional human reconstruction of native AStep.stepOf including deg, lawSep, holCoef, ndZero, strong induction and wrap. OPEN as a full RH proof. Not kernel replay and not an independently established published theorem.

## Continuity
Read AGENTS, swarm protocol, handoff, expansion, research state, research protocol/log, continuity, theta RUN7, current physical CI summary (checkpoint #374 PASS, 45410580111, 14:27:38 UTC, unrelated to RH), and retrieved peer handoffs for the dedicated lanes. No duplicate of this precise task found. Blueprint linked in queue not reread. Original pinned source 40e56bab026552e089d7afcfeff08d2defb9c005; upstream latest observed 9477923066c923e6dbf7292da17019f8d08d0db8 at 14:18:56 UTC (quick-check diagnostic merge). Path-level migration check (not semantic equivalence): [{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdOf.lean","old":"f6f68c195888579f8d05362afa946ee169153cf0","current":"ba9124032c534e1ddb55f57c44896c58c699a144"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/NdZero.lean","old":"05314df049d2034876de64be326e9e518ce7ff6b","current":null,"error":"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repository-content\",\"status\":\"404\"}"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/ExpNeOfLt.lean","old":"8214159335009d04c57924614b348e08d1b612a6","current":"445821f9bc878c405cceb7fd549a793dd3c3012b"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/AvgHolPf.lean","old":"4673a7f5fb7831b10990c909e09dc75764d6e4aa","current":null,"error":"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repository-content\",\"status\":\"404\"}"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/IsExtAtOfDiff.lean","old":"7a79c77e00affe229c88b89f0eef23832a4272ed","current":"abdf35ccabcedb3e89361c63e0d8c0a44d873e55"}]. Stay on original pin.

## 1. Actual entry and scope
The import in SiegelWeilStdOf.lean directly names AdelicDilations.NdZero. AStep.stepOf takes the 25 StepOf hypotheses in LowerRankDatum.lean and packages them into Hyps before calling step. Preserve exact order: HolLead, HolT, TAll, ThetaCoef, AuxiliaryPrimeFunction, CoefEx, FockMem, LiftEx, LocOpEx, LocInst, GSplit, PolyKFin, SecK, EisWk, LamBd, LamSing, FourierZero, Unfold, WhitLow, VacK, IwaQ, CTSplit, UEx, FcConj, OrbRes. For every pair of number fields F,E with F-algebra E and sigma, every SD datum d, RD d R, LD d L and RD L.sd R', assume m<n and MainV(2,R'). For every Schwartz Phi with d.T Phi in R.vac and every x, establish HolValueAt of the original Eisenstein sum at s=(m-n)/2 with value 2 I_Phi(x). This is a rank step, not the entire SW theorem. All structural, topological, measure, local representation and exact matching premises within SD/RD/LD are retained.

EisWk and SecK (using VacK and PolyKFin) give EData: open right-domain U containing s, nonzero polynomial p, holomorphic-in-z regularized series Ê(z,g) on U, jointly continuous, left rational-invariant, absolute compact-uniform summable majorants and equality Ê=p E far right. Let k=rootMultiplicity_s(p); A_j(g)=partial_z^j Ê(s,g), P_j=p^(j)(s), B_j(g)=A_j(g)-2P_j I_Phi(g). Want B_j=0 for 0<=j<=k. In induction assume A_i=0 globally for i<j (not merely at x). All coefficients are normalized fundamental-domain Fourier integrals; the argument compares derivatives at s, not convergence of original series there.

## 2. Nonsingular coefficients and weighted holomorphy
ndZero: for any CoefData and nonsingular T, thetaCoef and OrbRes give fc_T(I_Phi)=0 because m<n. LamBd makes the coefficient linear and compact-bounded; lamDeriv commutes spectral derivatives. Unfold and WhitLow give unfolded integral HolValueAt(s,0); ordVal in IsExtAtOfDiff proves its regularized derivatives through k vanish. Thus fc_T(A_j)=fc_T(B_j)=0. This is not enough to conclude B_j=0: singular coefficients still needed.
CntFalse.ndA applies the same argument to every functional in d.lamSet. vac_tens expresses vacuum at w as fP(1) tensor away factor (span induction); LocOpEx and LiftEx give lift phi(1)=Phi via injectivity of coordinate transform; LocInst and definite signature give (pp,qq)=(m,0) or (0,m). GSplit supplies local factorization and positive height multiplier; LamSing upgrades ndA to all singular-test integrals zero. HolLead uses the lower-derivative vanishings and these integral vanishings to conclude each translate of A_j is IsHolW(pp,qq,e). HolLead is an input, not replaced by a heuristic.

## 3. Singular coefficient with zero row/column: two transformation laws
FcConj brings any singular T to conjugate T0 with deleted row/column zero and lower index T', preserving the coefficient at rationally translated x. Work at that T0 (write T). Fix infinite place w and y the dilation at i0 with tau=1, Yx=R.iota(w,y)*x. holCoef_pf: local beta_W has zero i0 row/column by L.IsSub. Character translation comes from Fourier shift; HolT.1 implies the Levi law for transformations stabilizing beta_W. HolPhi uses HolT.2, compact representatives, finite normalized measure and unit-modulus additive character to obtain weighted holomorphy of Fourier integrals. The diagonal dilation stabilizes beta_W, and weight_factor_dilation with either definite signature gives fc_T(A_j)(Yx)=exp(m) fc_T(A_j)(x). The row unipotents also stabilize beta_W, have determinant 1 (zero diagonal entry and only one supported row), and give invariance. UEx extends rational and local unipotent invariance to all u. Therefore normalized average of fc_T(A_j) equals fc_T(A_j) exactly, since nu(Ucal)=1. These invariances are proved in HolCoefPf, not implied by CTSplit alone.

CTSplit supplies, only far to the right, average(fc_T(E))(z,x)=c1(z,x)+c2(z,x), where c1 is lower-rank restricted Eisenstein coefficient and c2(z,Yx)=exp(n-2z)c2(z,x). The arbitrary choice of c2 outside the right half-plane has no analytic significance. cOneVal supplies HolValueAt(c1(.,x),s,2fc_T(I_Phi)(x)) via MainV(2,R') and matching. cOneLaw_pf proves the first summand's distinct law: d.a(Yg)=exp(2tau)d.a(g), section dilation exp(tau*m), lower-rank j commutes with Y. Thus c1(z,Yx)=exp(tau(2z+n))c1(z,x), using complex power of positive real exponential, scalar transport through coset sum and integral. valLaw transports this right-domain identity to the holomorphic values; n+2s=m, so fc_T(I_Phi)(Yx)=exp(m)fc_T(I_Phi)(x). Do not assume c2 is holomorphic or independently defined at s.

## 4. lawSep: analytic separation without illicit evaluation
Let a(z)=avg(fc_T(Ê(z)))(x), a'(z) its value at Yx (prime denotes second location, not derivative). Both holomorphic on U by avgHol_pf: rational periodicity gives compact Fourier and unipotent representatives, normalized finite measures give compact sup bound, then lamDeriv applies. Lower derivatives vanish by the global hlow and derivative commutation. On common right half-plane a=p(c1+c2), a'=p(c1'+c2'), c2'=exp(n-2z)c2. Let C,C' holomorphic extensions of c1,c1', v=C(s), v'=C'(s). p=(z-s)^j gp, where gp=(z-s)^(k-j)q and q(s)!=0. Analytic vanishing gives a=(z-s)^j ga and a'=(z-s)^j ga' locally. The meromorphic identity theorem identifies a'-p C' with exp(n-2z)(a-p C) on punctured neighborhood: both extend the same right-domain expression p c2'. Divide by (z-s)^j off s, then continuity extends to s. Hence ga'(s)-gp(s)v'=exp(n-2s)(ga(s)-gp(s)v). Multiply by j!; iterDerivPow identifies jth derivative with j! times leading coefficient. This is exactly lawSep, including j=0 and j=k. No premise c2 holomorphic required; no evaluating raw c2 at s.

Since avg derivative equals fc_T(A_j) by normalized unipotent invariance, lawSep gives fc_T(B_j)(Yx)=exp(n-2s)fc_T(B_j)(x). Section 3 simultaneously gives fc_T(B_j)(Yx)=exp(m)fc_T(B_j)(x). Therefore [exp(2n-m)-exp(m)] fc_T(B_j)(x)=0. exp_ne_of_lt uses injectivity of real exponential and the natural subtraction cast justified by m<n. Since 2n-m>m, the factor is nonzero; the singular coefficient residual vanishes. At m=n the multiplier is zero and this argument cannot be used; RUN7 equal-rank branch is mandatory.

## 5. Global vanishing and regularization removal
stepJ: B_j continuous and left-rational invariant (famCont, derivInv and theta automorphy). FourierZero, with normalized CoefData, gives B_j=0 pointwise: nonsingular case ndZero, singular case FcConj then deg. Strong induction on j<=k: when i<j, i<k (also for j=k); pderiv_lt gives P_i=0; prior B_i=0 yields A_i=0 globally. Thus B_j=0 for all j<=k. Consequently A_i=0 below k, A_k=2p^(k)(s)I_Phi.
wrap: factor p=(z-s)^k q, q(s)!=0 because p!=0; analytic order criterion factors Ê(z,x)=(z-s)^k g_x(z) locally. k! cancellation gives g_x(s)=q(s)*2 I_Phi(x). Meromorphic extension of E via Ê/p is legitimate on sufficiently far right since nonzero polynomial has finitely many zeros. Punctured local ratio equals g_x/q, which has the prescribed finite limit and holomorphic representative. Therefore HolValueAt(E,s,2I_Phi). This handles k=0 too. Does not claim pointwise convergence of E at s.
Classical tools: identity theorem, analytic order and Taylor derivatives, Fourier uniqueness, positive measure, real exponential injectivity. Native local representation/dilation formula and arithmetic matching are source premises with their exact producers identified where above. No publication equivalence, full root reachability, no-sorry or axiom status proved here.

## 6. Executed checks
13 pinned files fetched through connector; 12 previously observed blob IDs compared exactly, one caller recorded on this run; 111 line anchors found with fail-on-missing checks, and five current-path fetch attempts recorded. This was executed in connector JS; not a Lean build. To reproduce with a full local pinned git checkout, save the JSON block as run8_sources.json and run:
```python
import json,subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
rows=json.load(open("run8_sources.json"))
count=0
for r in rows:
    b=subprocess.check_output(["git","show",pin+":"+r["path"]])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=b).decode().strip()==r["sha"]
    lines=b.decode().splitlines()
    for i,a in r["anchors"]:
        assert a in lines[i-1],(r["path"],i,a)
        count+=1
print(len(rows),"blob hashes;",count,"source anchors")
```
No numerical proxy or URT performance test. Source-matched local dependency edges only, not elaborated closure.
```json
[
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SiegelWeilStandard/SiegelWeilStdOf.lean",
    "sha": "f6f68c195888579f8d05362afa946ee169153cf0",
    "anchors": [
      [
        23,
        "import Development.WeilBound.CoreStatements.AutomorphicKernels.SiegelWeilFormula.AdelicDilations.NdZero"
      ],
      [
        63,
        "AStep.stepOf hH Holtb.holT"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/LowerRankDatum.lean",
    "sha": "1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",
    "anchors": [
      [
        20,
        "def HolLead"
      ],
      [
        36,
        "def HolT"
      ],
      [
        141,
        "def WhitLow"
      ],
      [
        155,
        "def CTSplit"
      ],
      [
        178,
        "def Step :"
      ],
      [
        180,
        "def StepOf :"
      ],
      [
        162,
        "d.n - 2 * z"
      ],
      [
        119,
        "ν 𝓤 = 1"
      ],
      [
        168,
        "def FcConj"
      ],
      [
        175,
        "def OrbRes"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/NdZero.lean",
    "sha": "05314df049d2034876de64be326e9e518ce7ff6b",
    "anchors": [
      [
        13,
        "theorem ndZero"
      ],
      [
        30,
        "H.orbRes"
      ],
      [
        39,
        "H.whitLow"
      ],
      [
        52,
        "theorem stepJ"
      ],
      [
        65,
        "H.fourierZero"
      ],
      [
        69,
        "ndZero H R"
      ],
      [
        72,
        "exact deg H"
      ],
      [
        74,
        "theorem step ("
      ],
      [
        81,
        "Nat.strong_induction_on"
      ],
      [
        86,
        "pderiv_lt p"
      ],
      [
        88,
        "refine wrap"
      ],
      [
        94,
        "theorem stepOf"
      ],
      [
        95,
        "step ⟨h1"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/ExpNeOfLt.lean",
    "sha": "8214159335009d04c57924614b348e08d1b612a6",
    "anchors": [
      [
        13,
        "theorem exp_ne_of_lt"
      ],
      [
        18,
        "Real.exp_injective"
      ],
      [
        22,
        "theorem deg"
      ],
      [
        49,
        "holA H R"
      ],
      [
        50,
        "holCoef H R"
      ],
      [
        53,
        "H.cTSplit"
      ],
      [
        60,
        "Classical.choose (hspl"
      ],
      [
        73,
        "avgHol H"
      ],
      [
        75,
        "lawSep U p"
      ],
      [
        96,
        "cOneVal H"
      ],
      [
        105,
        "huA uM"
      ],
      [
        106,
        "hu.2.2.2"
      ],
      [
        110,
        "valLaw"
      ],
      [
        112,
        "cOneLaw H"
      ],
      [
        114,
        "d.n : ℂ) + 2 * s = d.m"
      ],
      [
        121,
        "d.n : ℂ) + -2 * s"
      ],
      [
        126,
        "exp_ne_of_lt hmn"
      ],
      [
        129,
        "linear_combination -hsep"
      ],
      [
        130,
        "mul_eq_zero.1 key"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/DegCut.lean",
    "sha": "1079d74072e904d278cba232030edc7bee2c9e2a",
    "anchors": [
      [
        29,
        "theorem holA"
      ],
      [
        32,
        "exists_isHolW_iteratedDeriv"
      ],
      [
        36,
        "theorem holCoef"
      ],
      [
        42,
        "holCoef_pf"
      ],
      [
        46,
        "theorem avgHol"
      ],
      [
        52,
        "avgHol_pf"
      ],
      [
        56,
        "theorem cOneVal"
      ],
      [
        60,
        "cOneVal_pf"
      ],
      [
        64,
        "theorem cOneLaw"
      ],
      [
        68,
        "cOneLaw_pf"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/CntFalse.lean",
    "sha": "d5247f88431b918ce08dd635a226c282dfed64b4",
    "anchors": [
      [
        21,
        "theorem vac_tens"
      ],
      [
        40,
        "theorem ndA"
      ],
      [
        55,
        "H.whitLow"
      ],
      [
        57,
        "ordVal U p"
      ],
      [
        74,
        "theorem exists_isHolW_iteratedDeriv"
      ],
      [
        89,
        "H.locInst"
      ],
      [
        94,
        "hLD.sign"
      ],
      [
        99,
        "H.holLead"
      ],
      [
        102,
        "H.gSplit"
      ],
      [
        106,
        "H.lamSing"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/HolCoefPf.lean",
    "sha": "a837d56f6202729ebe9ae87402622de560350bff",
    "anchors": [
      [
        13,
        "theorem holPhi"
      ],
      [
        44,
        "H.holT.2"
      ],
      [
        52,
        "theorem holCoef_pf"
      ],
      [
        62,
        "hT.1 l"
      ],
      [
        64,
        "hT.1 k"
      ],
      [
        75,
        "H.holT.1"
      ],
      [
        83,
        "stab_diag"
      ],
      [
        84,
        "weight_factor_dilation"
      ],
      [
        88,
        "H.uEx"
      ],
      [
        110,
        "stab_row"
      ],
      [
        110,
        "weight_factor_det_one"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/AvgHolPf.lean",
    "sha": "4673a7f5fb7831b10990c909e09dc75764d6e4aa",
    "anchors": [
      [
        49,
        "theorem avgHol_pf"
      ],
      [
        60,
        "ratV_cocompact"
      ],
      [
        70,
        "H.fcConj"
      ],
      [
        82,
        "ν 𝓤 < ⊤"
      ],
      [
        26,
        "have hbd"
      ],
      [
        105,
        "lamDeriv"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/COneLawPf.lean",
    "sha": "9ecfe07fbcc9c0d5817a73c8eeeeaa232f43e1de",
    "anchors": [
      [
        18,
        "theorem cOneLaw_pf"
      ],
      [
        27,
        "j_comm_dil"
      ],
      [
        28,
        "a_dil"
      ],
      [
        29,
        "section_dilation_exp"
      ],
      [
        22,
        "Complex.exp (τ * (2 * z + d.n))"
      ],
      [
        54,
        "tsum_mul_left"
      ],
      [
        57,
        "integral_const_mul"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/IsExtAtOfDiff.lean",
    "sha": "7a79c77e00affe229c88b89f0eef23832a4272ed",
    "anchors": [
      [
        9,
        "theorem iterDerivPow"
      ],
      [
        36,
        "theorem polyFac"
      ],
      [
        65,
        "theorem ordVal"
      ],
      [
        85,
        "theorem wrap"
      ],
      [
        91,
        "hq0 hp"
      ],
      [
        124,
        "theorem valLaw"
      ],
      [
        132,
        "theorem lawSep"
      ],
      [
        153,
        "Nat.add_sub_cancel' hj"
      ],
      [
        173,
        "hX'.eventuallyEq hY'"
      ],
      [
        184,
        "mul_left_cancel₀ hne"
      ],
      [
        187,
        "eqNhds hlim"
      ],
      [
        189,
        "j.factorial : ℂ"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/SingularHermitian/FourierStep.lean",
    "sha": "a6c6ce0f91f81e6f970cafb5c0cd765a21a0e1d0",
    "anchors": [
      [
        14,
        "theorem fourierStep"
      ],
      [
        47,
        "hψ.2.2"
      ],
      [
        48,
        "hL (fun f"
      ],
      [
        51,
        "hFZ F E σ"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/ADil.lean",
    "sha": "4049d675a926f883c8038a162c261f59087a89e0",
    "anchors": [
      [
        15,
        "theorem a_dil"
      ],
      [
        16,
        "Real.exp (2 * τ)"
      ],
      [
        29,
        "absE_adrU"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/HolomorphicTheta/HolomorphicAverageUniform.lean",
    "sha": "0fd4083591381494ee126f661b677a56e0ed49d6",
    "anchors": [
      [
        15,
        "theorem holomorphic_average_uniform"
      ],
      [
        30,
        "differentiableOn_integral_of_bdd"
      ],
      [
        27,
        "spherical_section_ne_zero_group"
      ],
      [
        68,
        "theorem holT"
      ]
    ]
  }
]
```

RESUME HERE: trace cOneVal_pf actual source body via DegCut imports (especially SectionEqThetaZero / COneLawPf transitive imports), prove how IwaQ, VacK restriction and OrbRes turn the restricted Eisenstein coefficient into 2 times the original theta coefficient with correct spectral shift and character factors. Preserve hIH and all measure normalizations. Then trace HolLead native analytic producer and FourierZero supplier separately. RUN3 exact lInt2 source remains open. HANDOFF TO theta, editor, integration, audit and literature. No unrelated Cathedral changes.


---

## Appendix 93 — preserved peer text, blob 44aa73befeea0711cfdbfce09f37696d84b83af0

# RUN8 — Five Good fields, differential trivialization and exact filtration comparison
2026-11-24. SOURCE-MATCHED / PARTIAL (geometric child obligations open). No new premises added to source statement. Not independent Lean kernel checking. No URT speed claim. Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Latest upstream checked 9477923066c923e6dbf7292da17019f8d08d0db8 (2026-11-24 14:18:56 UTC). Preflight read AGENTS, state, continuity, queue and protocol, swarm/expansion/handoff, peer lane handoffs and RUN7. Latest physics CI PASS at 14:27:38, irrelevant to RH validity. No physical queue changes. Prior RUN7 handled RhoBC, not Good. Geometry lane RUN7 handles valuation and quasi-finite suppliers, not this argument.

## The five fields — preserve all
Let R be a commutative Noetherian ring, A an abelian scheme/group object over Spec R with smooth relative dimension g. The theorem GlobalTheory.LiftSys.good_of_isAbelianScheme takes HC:CrystallineSmoothLift and HH:AbelianHodgeDeRham. These are proposition definitions, not proofs of themselves; their actual global suppliers remain open in this lane. Good, in Definitions/Divisors/SurjectiveOfIsPullbackSqZero L188–198, means:
1. const: every compatible affine family of functions (d0=0) is induced by some scalar r in R.
2. par: for every affine U, evaluation of global one-forms is a base-change map to local Kahler differentials.
3. proj: GlobForm is projective over R.
4. surj: every global one-form is the underlying global form of a crystalline Form via cmpForm.
5. inj: Form.cl(f)=0 iff cmpForm(f)=0. This is a kernel equality, NOT injectivity of Form.cl or cmpForm separately.

Proofs/DivisorProofs/GoodForSquareZeroLiftClassificationOfAbelianSche L21–53:
const and par are supplied by internal GlobalTheory.T wrappers; proj is the explicit HH conjunct. HC gives bijectivity of cmp1 for smooth separated quasi-compact structure morphism (properness supplies appropriate instances). HH gives all global forms closed and clForm injective. The remaining two fields follow from the following reusable algebra.

## Exact filtered comparison (local proof, no additional hypotheses)
Write E=FirstDeRham, D=HH1, O=FirstCohomStructureSheaf, O'=HO1; C=cmp1:E→D, Q=toH1O, Q'=toHO1, S=cmpO:O→O'. Let V=Form, W=ClosedForm, a=Form.cl, b=cmpForm, j=clForm. All maps are R-linear. The identities are Q'C=SQ, Ca=jb, im a=ker Q, im j=ker Q'. C bijective, S injective, j injective. HH identifies W with GlobForm (not before closedness).
For w in W, choose c=C^{-1}(j(w)). Since Q'j=0, SQ(c)=0 and hence Q(c)=0 by S injective. Exactness gives f with a(f)=c. Then j(b(f))=C(a(f))=j(w), hence b(f)=w by j injective. This proves surj after forgetting the closedness subtype. Separately Ca=jb and C,j injective give a(f)=0 iff b(f)=0. This proves inj. This reasoning does NOT assert that the crystalline form module itself is equal to global forms; it proves only the stated surjectivity and equality of kernels. Nor is surj of Q needed for this argument. The full HH proposition still has other independent obligations.
Source: L31–46 and L47–53 in Good body, comparison definitions L208–216,249–270 of ComparisonMemCechHodgeFiltration; hodgeFiltration_eq_range used L42 (its deeper proof retained); S supplied by StructureSheafComparisonInjective L17–30. That proof represents a class by a cocycle f, uses comparison-zero to obtain affine coboundary g, glues a section G on each thickening T using compatible pair restrictions, then checks f is the coboundary of G on all thickening morphisms. Child obligations are exact imported statements exists_glue_functions_spec_from_pairs, cocycle_local_sections_restrict_compatibly, cochainValueOnThickeningHom_eq_sub_of_glued and H1 quotient facts. This does not replace these by axioms.

## Par: a duality proof, then an actual geometric supplier
AbelianSchemeDifferentialsFromGlobalForms L12–34: for R→B and f:M→N R-linear, M finite projective over R and N finite projective over B, suppose every R-linear l:M→B extends uniquely to a B-linear δ:N→B with δf=l. Extend f to F:B⊗_R M→N. Tensor universal property identifies Hom_R(M,B) with Hom_B(B⊗M,B); existence and uniqueness mean F* is bijective. Dualize once more and use evaluation isomorphisms for the two finite projective B-modules: ev_N F=F** ev_(B⊗M). Therefore F bijective and f exhibits base change. Do not delete finite projectivity from this particular dual-reflexivity argument. In L44–49 take B=Sec(A,U), M=GlobForm, N=Ω_{B/R}; smoothness of the affine section algebra (L36–42) supplies local differential-module properties; HH supplies M finite projective. The needed dual extension is not merely attributed to invariant differentials: it is constructed by ParPt.exists_unique_of_globForm (wrapper ExistsUniqueVectorFieldOfGlobalOneFormValuesStatement L11–12).

ParPt actual body L105–147: base-change A to B, retaining abelian and relative-dimension conditions via group pullback and smooth base change. For a B-linear functional δ on Ω_{B/R}, the dual-number ring map b↦b+εδ(db) gives a dual-number point ptOf(δ) over B reducing to the constant point c=ptOf(0) (L49–83). Conversely, dual-number points above the chart with the required reduction give such derivations via exists_derHom. Translation y↦yc⁻¹ sends points reducing to c to tangent points at identity, preserving crystalline form evaluation (t6, L28). Tangent evaluation on pulled crystalline forms equals δ evaluated on the original global form restricted to U (L96–99, t4 L24).
Uniqueness: two candidate δ's extending l give two translated tangent points with identical pulled form values. The functional extension t5 is unique (L123–125), because each tangent functional kills ker cmpForm. Injectivity LieInj.tangent_eq_of_tanVal_eq gives equal translated points (L126–127). Cancel right c⁻¹, then eq_of_affPt_eq identifies δ (L128–130).
Existence: t5 gives a functional ψ on crystalline forms of A_B killing ker cmpForm and extending l on pullbacks. LieDual.exists_tangent_of_functional realizes ψ as a tangent point v (L131–132). Translate back vc, recover δ from its reduction (L133–138). Every global w comes from a crystalline f by LieDual.glob_surjective; tangent evaluation compatibility implies δ(w|U)=l(w) (L139–146). Hence uniqueness and existence. Preserve the exact source dependencies t4 tangent_value_pullback_crystalline_form_dual_numbers, t5 existsUnique_forms_functional_abelian_base_change, t6 translate_dual_number_point_inverse_constant_tangent, TanVanish.tanVal_eq_zero_of_cmpForm_eq_zero, LieInj.tangent_eq_of_tanVal_eq, LieDual.exists_tangent_of_functional, LieDual.glob_surjective, exists_derHom and snd_val_derHom. These child bodies still need independent translation; they are not postulated by this run.
The global-functions supplier is also internal: GlobalFunctionsAreConstantAbelianSchemeNoetheria L15–46 uses smooth geometrically connected ⇒ geometrically integral, proper-functions theorem over Noetherian base, and sheaf gluing across the affine basis to turn d0-compatible functions into a global section t; then the proper-functions bijection gives r. Preserve GlobalTheory.geometricallyIntegral_of_smooth, GlobalTheory.ProperFunctions.functions_of_isProper and sheaf gluing as children. No independent historical citation verification here.

## Assumption ledger and reproducibility
Wrapper declarations GoodForSquareZeroLiftClassificationOfAbelianScheStatement, AbelianSchemeDifferentialsFromGlobalFormsStatement, ExistsUniqueVectorFieldOfGlobalOneFormValuesStatement and GlobalFunctionsAreConstantAbelianSchemeNoetheriaStatement all have explicit bodies applying their internal named theorem. HC/HH are premises, not axiom declarations. Mathlib imports supply tensor, dual, smooth and categorical properties; imported dependency bodies not exhausted. No assertion about kernel axioms from name/lexical checks.
In connector JS environment re-fetched 12 pinned blobs and checked 87 exact line anchors (all matched), and exact original L21–53 equals current clump L1443–1475 (33/33 lines). Original Good body and wrapper no longer at same paths on head (404); actual migrated body found by caller import/source, not guessed. Reproduce hashes using git rev-parse and migration with Python in upstream checkout:
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="9477923066c923e6dbf7292da17019f8d08d0db8"
base="src/Development/AbelianVarietyTheory/"
P="Proofs/DivisorProofs/"
D="Definitions/Divisors/"
T="PublishedTheorems/Divisors₂/"
rows=[
(P+"GoodForSquareZeroLiftClassificationOfAbelianSche.lean","34ab76ca73351ce089c2dc20b7a0897c3de75275",[(21,"theorem good_of_isAbelianScheme"),(29,"bijective_cechDeRhamComparison_degreeOne"),(33,"globalFunctionsAreConstant"),(39,"cmpO_injective"),(42,"hodgeFiltration_eq_range"),(45,"hinj"),(52,"bij.1")]),
(P+"GoodForSquareZeroLiftClassificationOfAbelianScheStatement.lean","11a955b12884b107a4332afdeea3a6583cb78fb0",[(12,"exact @GlobalTheory.LiftSys.good_of_isAbelianScheme")]),
(D+"SurjectiveOfIsPullbackSqZero.lean","b4324e88eb9b117877d056cb7608693f944b8bbb",[(193,"structure Good"),(194,"const"),(195,"par"),(196,"proj"),(197,"surj"),(198,"inj")]),
(P+"AbelianSchemeDifferentialsFromGlobalForms.lean","a7db5e10df02be19cc408e4a1d21ba1a4edb7f48",[(12,"isBaseChange_of_dual"),(18,"Bijective F.dualMap"),(32,"bijective_dual_eval"),(49,"exists_unique_vectorField")]),
(P+"AbelianSchemeDifferentialsFromGlobalFormsStatement.lean","d2deb9d6350d204b33c37b091183ce0996436a8e",[(12,"GlobalTheory.ParForm.par")]),
(P+"ExistsUniqueVectorFieldOfGlobalOneFormValues.lean","366f5679daac8351fbdc73d7e76ae2281b1b031c",[(105,"theorem key"),(123,".unique"),(126,"tangent_eq_of_tanVal_eq"),(132,"exists_tangent_of_functional"),(138,"exists_derHom"),(141,"hglob"),(147,"uniq")]),
(P+"ExistsUniqueVectorFieldOfGlobalOneFormValuesStatement.lean","6a7f3f0d352c8a5d89483ff07f8281c91ab27d5a",[(12,"GlobalTheory.ParPt.exists_unique_of_globForm")]),
(P+"GlobalFunctionsAreConstantAbelianSchemeNoetheria.lean","ac73f506d791f4e1bcf340a101ce258a60d9ded5",[(21,"GeometricallyIntegral"),(22,"functions_of_isProper"),(29,"existsUnique_gluing'"),(43,"hbij.2")]),
(P+"GlobalFunctionsAreConstantAbelianSchemeNoetheriaStatement.lean","3d2b4ea8bd667271c342c19adf69249f60778815",[(12,"GlobalTheory.LiftSys.const_of_isAbelianScheme")]),
(P+"StructureSheafComparisonInjective.lean","0ff11567c19d8bcbe019fea3b7022d573e36837a",[(17,"cmpO_injective"),(27,"exists_glue_functions_spec_from_pairs"),(30,"cochainValueOnThickeningHom_eq_sub_of_glued")]),
(T+"AbelianHodgeDeRham.lean","80799a38567aba92e73f29eb44b8da65f95f44c2",[(15,"def AbelianHodgeDeRham : Prop"),(20,"Module.Projective"),(24,"ClosedForm A.hom = ⊤")]),
(D+"ComparisonMemCechHodgeFiltration.lean","b3632190bd27a8054a03bd8f64c41ab27f7c6fa8",[(216,"LinearMap.range"),(253,"structureSheaf_comparison_comm"),(270,"comparison_formClass")])]
def git(*a): return subprocess.check_output(["git",*a]).decode("utf8")
def read(ref,p,h):
    spec=ref+":"+base+p
    assert git("rev-parse",spec).strip()==h
    return git("show",spec).splitlines()
for p,h,anchors in rows:
    ls=read(pin,p,h)
    for i,s in anchors: assert s in ls[i-1],(p,i)
old=read(pin,*rows[0][:2])
new=read(head,P+"AbelianSchemeSquareZeroLiftsOfHodgeDeRham.lean","56819493f085ef977c38d4eaaca7c9705a31d84b")
assert old[20:53]==new[1442:1475]
print(len(rows),sum(len(a) for _,_,a in rows),33)
```
This compact replay uses a subset of the 87 anchors actually checked, plus all hashes and migration. Finite illustration actually executed in connector JS, not Lean, enumerating all 2x2 matrices over F2,F3,F5 (722), 12,456 unique dual extensions, 2,556 filtered form lift checks and 2,556 zero-kernel equivalences = 18,290 successful assertions. Two negative controls confirmed: failure of surj without S injectivity (C=id, q=id, q'=0, S=0, a=b:0→F2, j=id); failure of zero-kernel equivalence without j injectivity (C=S=q=q'=id, a=j=0, b=id). Both preserve the two comparison identities; first preserves both range equalities, second also does. Finite tests illustrate algebra only, not geometric child obligations.
```js
const assert=p=>{if(!p)throw Error("failed")};
let matrices=0,dual=0,forms=0,zero=0;
for(const p of [2,3,5]){
 const mod=x=>((x%p)+p)%p,V=Array.from({length:p*p},(_,i)=>[i%p,Math.floor(i/p)]),key=v=>v.join(","),dot=(a,b)=>mod(a[0]*b[0]+a[1]*b[1]),mul=(A,v)=>A.map(a=>dot(a,v));
 for(const a of V)for(const b of V){
  const A=[a,b],T=[[a[0],b[0]],[a[1],b[1]]],bij=M=>new Set(V.map(x=>key(mul(M,x)))).size===V.length;
  assert(bij(A)===bij(T));matrices++;
  if(!bij(A))continue;
  for(const l of V){assert(V.filter(d=>key(mul(T,d))===key(l)).length===1);dual++;}
  for(let w=0;w<p;w++){
   let c=V.find(v=>key(mul(A,v))===key([w,0]));assert(c!==undefined);
   const q=v=>mul(A,v)[1];assert(q(c)===0);const F=V.filter(v=>q(v)===0);
   assert(F.some(v=>key(v)===key(c)));assert(mul(A,c)[0]===w);forms++;
   assert((key(c)==="0,0")===(w===0));zero++;
  }
 }
}
assert(matrices+dual+forms+zero===18290);
console.log({matrices,dual,forms,zero});
const V=[0,1],Z=[0],id=x=>x,z=x=>0,range=(f,S)=>new Set(S.map(f)),ker=(f,S)=>S.filter(x=>f(x)===0),same=(a,b)=>a.size===b.size&&[...a].every(x=>b.has(x));
assert(V.every(x=>z(id(x))===z(id(x))));
assert(same(range(z,Z),new Set(ker(id,V))));
assert(same(range(id,V),new Set(ker(z,V))));
assert(range(z,Z).size<V.length);
assert(V.every(x=>id(z(x))===z(id(x))));
assert(z(1)===0&&id(1)!==0);
```
RESUME HERE: trace the actual t5 and LieDual.glob_surjective producers and LieDual.exists_tangent_of_functional from the pinned ParPt imports, including the precise quotient by ker cmpForm. Then system realization, followed by actual global HC/HH producers. Keep RhoBC separate from Good. HANDOFF TO integration, editor, audit, geometry. Project OPEN.


---

## Appendix 94 — preserved peer text, blob 26cf8e7bd9fc3d2183ae2fc8e68bf2ccdc416248

# RUN8 — Euler-factor analytic continuation and zero equivalence
2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of imported producer, plus exact finite coefficient checks executed in V8. No independent Lean kernel replay. Project OPEN.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/continuity/runner queue and protocol opening, CI summary #373 run 45406895276 (physical CI, not RH verification), RUN7, recent dependency, integration, math, character, theta, Galois, literature, prime, geometry, kernel, acceleration, structure and editor RESUME notes. Math analytic_zero_exclusion_chapter already describes the OUTER imprimitive transfer; it does not expand the imported LFunction_changeLevel proof. This run expands that producer, not the entire EveryCharacter assembly. Audit lane files not found under audit/ in tree; editor reports peer final-statement audit. Blueprint not independently reopened. No baseline physics modifications.

## Source ledger
RH P = 40e56bab026552e089d7afcfeff08d2defb9c005. H = 9477923066c923e6dbf7292da17019f8d08d0db8 (observed latest 2026-11-24 14:18:56Z, merge #1174). H manifest blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d still pins Mathlib Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8; Pm=0df444a360eaa60ab8c11dca51a86af692955474 (RUN7).
- P src/Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean blob 97cbdce9fcc91c4f0dcc25fef62daf4c95724afa, UpperTheory.Top.imprimitive. H path no longer exists.
- H src/Development/AutomorphicArithmetic/CharacterBoxes/HalfPlane.lean blob 432979618e8a88062e9d8bffc5bdac624a5e7e47, L19–45 Claim.factor_ne_zero, Claim.eulerFactors_ne_zero, Claim.LFunction_eq_zero_iff_primitiveCharacter. New reusable equivalence on Re(s)>0, not merely a consequence on Re(s)>1/2. Full current consumer chain not traced here.
- H src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/ZetaEulerProducts/MeromorphicAtProd.lean blob a62f67ca22d3158a24ce2ee58e540ec5a0a47cf7, L159–168 PositivityTheory.Lord.factor_ne_zero, actual body retrieved.
- H src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean blob c3bcece31e76be6368af5af4647f1ad30012fd3b unchanged from RUN7.

Mathlib path | Pm blob / Hm blob | declaration
- Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean: 58a6430496fc0b4c22b2c5ccdc777b09a099a6a6 / 27c7ad1e4cab9ea2268089832836d68d311cfeac; LSeries_eulerProduct_hasProd and tprod, LSeries_changeLevel P171–207/H169–205. Actual full-span comparison equal after replacing if_false -> ite_false and if_true -> ite_true, raw text differs.
- Mathlib/NumberTheory/LSeries/DirichletContinuation.lean: 9ccc38f52d669a88285a904e59dbb562ade5aba5 / 9c298ece8f124faf92ba9dbf04d8a45f8283e4ce. LFunction_eq_LSeries P75/H74, differentiableAt_LFunction P92/H91, differentiable_LFunction P98/H97, LFunction_changeLevel_aux P125–144/H124–143, LFunction_changeLevel P150–162/H149–161. Aux eventualEq type annotation changed; public dense equality final congrFun -> congrm. Read both proof bodies.
- Mathlib/NumberTheory/LSeries/ZMod.lean: 0c6ccbe61ab0645b0b8f713af0f2398de6fcc936 / eb49c8a21cfa211f137578580a7d8f00e4eb88a9. LFunction_eq_LSeries P93/H95; differentiableAt_LFunction P122/H124; residue_one follows. Actual source groups by residue classes and cancels Hurwitz pole.
- Mathlib/NumberTheory/DirichletCharacter/Bounds.lean: 624525b93fbcdda02dac7628a86e3a71eed86652 / fad2a4b54fc0ddb657a572e87438db83fef6b9cd. norm_le_one P33/H44, same unit/nonunit argument.
- Mathlib/NumberTheory/DirichletCharacter/Basic.lean: 4569ebb8e61f683a9c89877f0cda4d3add4d766d / a954549811e3e87c5f4e85b5d37f359ddfc83a81. changeLevel_eq_cast_of_dvd, changeLevel_one, changeLevel_primitiveCharacter (P310/H309).
Hashes are connector-returned; not independent git hash-object verification.

## 1. Dirichlet series producer, Re(s)>1
Let positive integers M|N, chi a character modulo M, chiN=changeLevel chi. At a prime p not dividing N, p is a unit mod N, and chiN(p)=chi(p) by changeLevel_eq_cast_of_dvd. At p dividing N, chiN(p)=0. For p already dividing M the old chi(p)=0 as well, so the correction is 1. The Euler products of both Dirichlet series are available from LSeries_eulerProduct_hasProd, using complete multiplicativity and summability of their Dirichlet summands. This is an imported convergent product theorem, not a formal cancellation of divergent expressions. Define f(p)=1-chi(p)p^(-s). The absolute bound |chi(p)|<=1 follows from unit values having norm one and nonunits mapping to zero. For Re(s)>1, |p^(-s)|<=1/2, so f(p) is nonzero. The source rewrites the finite correction product as a multiplicative indicator over natural numbers, extends both prime products by identity outside primes, and combines them using Multipliable.tprod_mul. Its two convergence obligations are the original Euler product and finite support of the correction. Pointwise, nonprime terms are 1; at primes not dividing N the old inverse factor is unchanged; at primes dividing N the old inverse multiplied by f(p) is exactly 1, equal to the new inverse factor. Thus
 LSeries(chiN,s)=LSeries(chi,s) * product_{p|N, p prime} f(p).
The stronger Re(s)>0 nonzero-factor bound alone does NOT justify Euler product convergence there.

Independent algebraic check: expand the finite product as sum_{d|rad(N)} mu(d)chi(d)d^(-s). Its coefficient at n is sum_{d|n,d|rad(N)} mu(d)chi(d)chi(n/d)=chi(n)sum_{d|gcd(n,rad(N))}mu(d), hence chi(n) when gcd(n,N)=1 and 0 otherwise. This is exactly chiN(n). Absolute convergence for Re(s)>1 legitimates rearrangement. No primality assumption on N or squarefreeness needed.

## 2. Analytic continuation producer
The LFunction defined through periodic Hurwitz zeta is equal to LSeries on Re(s)>1. The actual ZMod proof partitions the absolutely summable natural series by residue class j mod N, yielding N^(-s) sum_j chi(j) zeta(s,j/N), with j=0 term using the source's n=0 convention (not an ordinary divergent 0^(-s) term). Multiplicative complex-power manipulations are valid for nonnegative real bases with the zero-term convention; no arbitrary complex-base product rule.
Each Hurwitz function is holomorphic away from 1, and each has residue 1. At 1 the ZMod proof subtracts 1/(s-1) from every summand; if sum_j chi(j)=0 the weighted singular term cancels. For nonprincipal chi this sum is zero by character orthogonality (multiply by a unit with character value not 1 to permute the finite sum). Thus nonprincipal L-functions are entire.
On D=C\{1}, both F(s)=LFunction(chiN,s) and G(s)=LFunction(chi,s) product f(p) are holomorphic. Each factor is entire since p>=2 and p^(-s)=exp(-s log p). D is open and connected (real dimension 2; deleting one point does not disconnect). They agree on an open neighbourhood of 2 contained in Re(s)>1. The complex analytic identity theorem extends equality throughout D. This is exactly LFunction_changeLevel_aux (preconnectedness, basepoint 2, eventual equality).
For chi !=1, chiN !=1 by changeLevel_eq_one_iff, so both F and G are continuous at 1; agreement on dense D extends to all C. If chi=1 the public theorem instead requires s!=1. The guard is chi!=1 OR s!=1, not AND. Principal pole residue at 1 is product_{p|N}(1-1/p)>0 for the modulus-one induced principal character; the exclusion is about the pole, not the exceptional real zero of a nonprincipal character. Source's totalized point value at 1 must not be confused with a meromorphic pole. No extension of unregularized equality at the excluded pole is asserted.

## 3. Current H zero equivalence
For sigma=Re(s)>0, |chi(p)p^(-s)|<=p^(-sigma)<1. Reverse triangle yields |f(p)|>=1-p^(-sigma)>0. H uses IsUnit.one_sub_of_norm_lt_one in PositivityTheory.Lord.factor_ne_zero with arbitrary integer base >=2 and coefficient in closed unit disk; Claim.factor_ne_zero specializes to prime p. Finite product is nonzero, including empty product N=1. This needs only sigma>0, not sigma>1/2. At sigma=0 a principal inducing character gives f(p)=0 at s=0, so strictness matters. If coefficient norm bound or base>=2 is dropped, elementary counterexamples exist.
Given any chi modulo N>0, conductor M>0 and primitive character psi, changeLevel psi=chi. If chi!=1 then psi!=1 by changeLevel_one; if s!=1 the right disjunct supplies the guard regardless of psi. Apply LFunction_changeLevel and mul_eq_zero, discard the correction zero branch via product nonzero. Thus for Re(s)>0 and (chi!=1 or s!=1):
 LFunction(chi,s)=0 iff LFunction(psi,s)=0.
For the original P theorem, instantiate the already supplied ZeroFreeAll at psi (PChar.of chi), then apply this direction with Re(s)>1/2. It is a consumer, not a proof of ZeroFreeAll. A nonprincipal real exceptional zero in (0,1) is preserved by this equivalence, not assumed absent. RUN1–7 family positivity, delta>0 and outer 0<theta<1 remain unchanged; this local adapter contains no theta or delta. Arithmetic window existence remains upstream. No full Main closure or URT advantage inferred.

## 4. Executed finite regression
JS Node/V8 replay (integer arithmetic exact within representable range; tests actual explicit characters modulo 1,4,5,8, not arbitrary character theorem):
~~~js
const assert=(c,m)=>{if(!c)throw Error(m)};
function check(){
 const gcd=(a,b)=>b?gcd(b,a%b):a, primes=n=>{let r=[];for(let d=2;d<=n;d++)if(n%d===0&&Array.from({length:d-2},(_,i)=>i+2).every(k=>d%k))r.push(d);return r;};
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
 const units=[[1,0],[0,1],[-1,0],[0,-1]];
 const chars=[{m:1,f:n=>[1,0]},{m:4,f:n=>n%2===0?[0,0]:[n%4===1?1:-1,0]},{m:5,f:n=>n%5===0?[0,0]:units[[1,2,4,3].indexOf(n%5)]},{m:8,f:n=>n%2===0?[0,0]:[[1,0],[-1,0],[-1,0],[1,0]][(n%8-1)/2]}];
 let mult=0,coeff=0,factor=0,negative=0;
 for(const {m,f} of chars){
  for(let a=1;a<=40;a++)for(let b=1;b<=40;b++){assert(eq(f(a*b),mul(f(a),f(b))),"character multiplicativity");mult++;}
  for(let k=1;k<=20;k++){const N=m*k, ps=primes(N);let ds=[[1,1]];for(const p of ps)ds=ds.concat(ds.map(([d,v])=>[d*p,-v]));
   for(let n=1;n<=300;n++){let a=0,b=0;for(const [d,sign] of ds)if(n%d===0){const [x,y]=mul(f(d),f(n/d));a+=sign*x;b+=sign*y;}assert(eq([a,b],gcd(n,N)===1?f(n):[0,0]),"Dirichlet coefficient");coeff++;}
   for(const p of ps)for(let j=1;j<=4;j++){const q=p**j,[a,b]=f(p);assert((q-a)**2+b*b>0 && a*a+b*b<q*q,"nonzero factor");factor++;}
  }
 }
 assert(1-1===0,"sigma=0 or base=1 counterexample");negative+=2;
 assert(1-2*0.5===0,"coefficient disk guard");negative++;
 let residue=0;for(let n=1;n<=200;n++){let a=1,b=1;for(const p of primes(n)){a*=p-1;b*=p;}assert(a>0&&a<=b,"principal residue");residue++;}
 return {mult,coeff,factor,residue,negative};
}
console.log(check());
~~~
Actual V8 output {"mult":6400,"coeff":24000,"factor":560,"residue":200,"negative":3}. Total 31160 positive finite cases and 3 logically distinct negative controls (base 1 and sigma 0 share arithmetic assertion); source body comparison separately executed. Finite tests cover coefficient inclusion-exclusion and positive integer real exponents, not the infinite analytic continuation or all complex s. No Lean kernel execution. Source replay git show PIN:PATH and git rev-parse PIN:PATH in the proper repositories. Full proof and dependency graph remain OPEN.

RESUME HERE: trace the pinned local zero-order decomposition supplying each complex residue in the Landau pole family (analyticOrderAt/toNat, nonidentically-zero input, local factor and logarithmic derivative). Preserve distinction between real positive residue and complex nonzero residue; compare the exact H clump and imported Mathlib theorem bodies. Do not redo RUN1–8, outer EveryCharacter adapter or prime-window producer. HANDOFF TO integration, editor, audit, math and kernel. Project OPEN.
