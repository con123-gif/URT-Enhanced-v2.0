# Human-readable RH reconstruction — ninth edition (15:56 UTC, 24 November 2026)

INCOMPLETE. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream head 1da818b50f1e18808db2792b9dc735bda8cb84d8; Main.lean blob 67c65badc15f80a1db65df1c84dc7a4928fc410f uses Claim.zeta and Claim.strip rather than pinned rhOfAll. No revision substitution or asserted equivalence.

Read [Volume I](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [Volume II](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [Volume III](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [Volume IV](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [Volume V](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), then this Volume VI. Previous 89 primary and five supporting entries; nine new primary peer chapters (95–103), for 98 primary and five supporting entries. These are editorial counts, not a theorem-coverage numerator. Full peer text preserved from working snapshot be344b50b0fbfbb9b56ffe29c1c654f07e7b8735, connector-reported blob SHA checked and source pin present; peer mathematical claims not independently replayed. All new prose from the comparison included; code-only contributions indexed separately.

## 1. New local derivation: block 14, cloud-unit lower and count bounds

SOURCE-MATCHED / local human derivation. For every 0<eps<1/52 and FC C with Std C, put c=C.P.CDel, F=C.P.CF, K=C.P.CCount, each >=1 by Std. Choose c1=5c+Fc+406K+412 as in the source, and for every cD>=c1 choose c2=0, then for every ch>=0 choose x0=max(rank threshold,c). For all D:D7, L:SizeData₂ D with L.sc.eps=eps and x=L.sc.x>=x0, assume Val C cD ch L. Write k=D.R.k, m=D.R.m, N=D.R.N D.R.m, f=D.R.f and l=L.sc.L. The exact rank statement explicitRanks_basic_bounds_large_scale supplies 0<=k<=x^5 (via k<=r<=x^5), 0<=m<=x, 0<=N<=x^402, 0<=f<=x^3, 1<=l<=x. Also x>=c>=1. The native Del and etaF are tied by Val.Del_eq and Val.etaF_eq:
  Del=ceil_nat(x^cD)>=x^cD, etaF=6x^(-F)>0.
All reals are in the domain of the needed nonnegative-base power comparisons. No positive rank lower bound is needed for this lemma beyond the stated assumptions. In particular zero numerators allowed.

Each of the five target quantities is bounded by a power of x:
1. k^c (cm)^3 / etaF^c <= x^(5c+6+Fc). Indeed k^c<=x^(5c), cm<=x², and etaF^c >= x^(-Fc)>0 by 6>=1 and c>=0. Multiplication and division preserve the order with these signs.
2. cmN<=x^(1+1+402)=x^404.
3. k^c(cm^4 l)^4<=x^(5c+4(1+4+1))=x^(5c+24).
4. Nm^10<=x^412.
5. (Nfl)^K<=x^((402+3+1)K)=x^(406K).
All five exponents are <=c1<=cD, since c,F,K>=1. For x>=1, exponent monotonicity gives each target <=x^cD<=Del. These are exactly the four Del_ge components and the one Del_count component in ParameterChoice' of the same D,L, passed through sizes_del_ge_cloudUnit_and_count_bounds. The wrapper does not add hypotheses.

**Optional sharper witness, not a change to the native constants or the consumer:** Instead of the conservative sum c1, choose the maximum of the five displayed exponents. The same proof works with this threshold and unchanged rank/x threshold; it is an alternative witness for this isolated SzRow predicate. The native conjunction still requires every other SzRow threshold and the same Val witness. No automatic claim that the global witness becomes smaller.

## 2. Exact source ledger and reproducible local checks

- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/SzRowCloudUnitLower.lean — 8854838b50759067e3cf71c540e25529c56d841d; anchors: theorem cloudUnit_poly_bounds; 5 * c + F * c + 406 * K + 412; 5 * c + 6 + F * c; 404 : ℝ; 5 * c + 24; 412 : ℝ; 406 * K; theorem szRow_cloudUnit_lower; max x0 C.P.CDel; V.Del_eq; Nat.le_ceil; V.etaF_eq
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/SzRowCloudUnitLowerStatement.lean — f0acfe38432a63e1ce79ddadabe0c9ceea2b786a; anchors: sizes_del_ge_cloudUnit_and_count_bounds; GlobalTheory.EX.szRow_cloudUnit_lower
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitRanksBasicBoundsLargeScaleStatement.lean — 06f43bd62169da68ca742524f7b57dcb6ca87454; anchors: explicitRanks_basic_bounds_large_scale; R.k ≤ R.r; R.N R.m : ℝ) ≤ s.x ^ (402; GlobalTheory.EX.rank_basic_bounds
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitConstantsParameterConditionsLarge.lean — 8bb3bd4a9a5343eaeaef138a1dccf57016010f0a; anchors: SzRow.and GlobalTheory.T.sizes_del_ge_cloudUnit_and_count_bounds; ⟨h_Del_ge, h_Del_count⟩; Del_ge := h_Del_ge; Del_count := h_Del_count
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean — 688162690ac7cbfe620037fcee8e451e7116f45b; anchors: def Delv; structure Val; Del_eq :; etaF_eq : D.div.etaF = 6; def SzRow; ∀ cD ≥ c1; ∀ ch ≥ c2
- src/Formalism/GammaFactorNonvanishing/CritLine.lean — 95fa4da5c50119db164aa93944d106f22fdb576d; anchors: open Complex DirichletCharacter; theorem Formalism.VW.rh_of_every; rwa [LFunction_modOne_eq] at this

All six connector-reported pinned blobs matched; 32 textual anchors checked. Reproduce using git rev-parse PIN:PATH and git show PIN:PATH. The rank theorem body behind the wrapper is not rederived here. Search of current default branch for Val C cD ch, FamP and explicitConstants_parameterConditions_large produced no matches; cannot infer pinned absence or producer identity. Targeted role report has only six top-chain anchors, not Val. Native Val and FamP existence remains open.

Executed V8 regression: {"exponent":241425,"integer":1890,"negative":3}. Exact BigInt scaled exponent comparisons and cleared-denominator integer evaluations at constructed endpoint/interior/zero budgets; negative controls for insufficient exponent, missing c<=x, and lost eta exponent. These are finite checks, not native geometry or independent Lean replay. Code below is directly reproducible in Node.

~~~js
function regression(){
 let exponent=0,integer=0,negative=0;
 const ck=(v,m)=>{if(!v)throw Error(m)};
 // c,F,K on quarter grid. All exponents scaled by 16.
 for(let c=4n;c<=48n;c++)for(let F=4n;F<=40n;F++)for(let K=4n;K<=32n;K++){
   const E=[20n*c+96n+F*c,6464n,20n*c+384n,6592n,1624n*K];
   const S=20n*c+F*c+1624n*K+6592n;
   const M=E.reduce((a,b)=>a>b?a:b);
   for(const e of E){ck(e<=M&&M<=S,"exponent");exponent++;}
 }
 // Full cleared-denominator bounds for integer exponents and positive integer x.
 for(let x=2n;x<=5n;x++)for(let c=1n;c<=x;c++)for(let F=1n;F<=3n;F++)for(let K=1n;K<=3n;K++){
   const E=[5n*c+6n+F*c,404n,5n*c+24n,412n,406n*K],d=E.reduce((a,b)=>a>b?a:b);
   const D=x**d;
   for(const mode of [0n,1n,2n]){
     const k=mode===0n?0n:mode===1n?x**5n-1n:x**5n;
     const m=mode===0n?0n:mode===1n?x-1n:x;
     const N=mode===0n?0n:mode===1n?x**402n-1n:x**402n;
     const f=mode===0n?0n:mode===1n?x**3n-1n:x**3n;
     const L=m;
     ck(k**c*(c*m)**3n*x**(F*c)<=D*6n**c,"cloud denominator");
     ck(c*m*N<=D,"linear");ck(k**c*(c*m**4n*L)**4n<=D,"quartic");
     ck(N*m**10n<=D,"count");ck((N*f*L)**K<=D,"power");integer+=5;
   }
 }
 ck(2n**412n>2n**411n,"drop exponent guard");negative++;
 ck((3n*2n)**4n>2n**8n,"drop c<=x");negative++;
 ck(2n**5n*2n**6n*2n**2n>2n**12n,"drop etaF exponent contribution (normalized denominator 1)");negative++;
 return {exponent,integer,negative};
}
console.log(regression());
~~~

## 3. Dependency closure advance and exact root join correction

Independently retrieved state-branch compute/rh-mutual-metadata-closure-20261124/status.json (65ed645839b57285c0809092e953f0b66e8edd28) and outputs/summary.json (f1387d522a1017871332d030e2c155ea4f1c6c8d). Run 45412286798 reports returncode 0; uncompressed archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, 61,570,595,788 bytes, 1,065,214,335 indexed expressions, 1,484,733 indexed declarations; root 14065054. Reached 1,065,212,063 expressions, 1,484,705 declarations, 2,133,543,711 mixed reference edges. Zero hard missing, five metadata-only missing; standard reachable axioms Classical.choice, Quot.sound, propext under this traversal policy. This supersedes the earlier failed archive traversal, not the independent kernel/source-to-export audit. The manifest artifact itself was not downloaded. The count is a defined denominator for mixed export declaration closure only, not the number of mathematical lemmas that require human translation. No full coverage percentage claimed.

Targeted role job 45423163512 status.json blob f71b039f3c65341ba1a032eb75506b402485e457 reports ERROR (source anchor mismatch and separate challenge projection child 1 null). Its committed solution_direct_roles.json blob 64b935e4ef309f6c555912a377012c7708eda510 nevertheless records six exact root anchor projections. The apparent missing LFunction_modOne_eq is actually present as DirichletCharacter.LFunction_modOne_eq, explicit constant target 341183, expression 6497276. Pinned CritLine.lean opens DirichletCharacter and uses the unqualified name, so this specific mismatch is a namespace-resolution error in the comparison, not an absent dependency. Checked all 11 expected references in all six reports by exact qualified name and kind, no suffix-only matching. Exact results:

- riemannHypothesis -> rhOfAll (target 14065053, expression 1065212062)
- rhOfAll -> Formalism.VW.rh_of_every (target 341189, expression 1065212059)
- rhOfAll -> allChi (target 14065052, expression 1065212060)
- allChi -> UpperTheory.FinalTheorems.everyCharacter (target 14065051, expression 1065212058)
- UpperTheory.FinalTheorems.everyCharacter -> UpperTheory.FinalTheorems.everyCharacter_of_row (target 13125901, expression 1065212055)
- UpperTheory.FinalTheorems.everyCharacter -> UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter (target 14065050, expression 1065212056)
- UpperTheory.FinalTheorems.everyCharacter_of_row -> UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin (target 11298208, expression 997980691)
- UpperTheory.FinalTheorems.everyCharacter_of_row -> UpperTheory.Zero.LLC.recTExists (target 11307205, expression 901833048)
- UpperTheory.FinalTheorems.everyCharacter_of_row -> UpperTheory.One.vwin_of_row (target 13125899, expression 997980696)
- Formalism.VW.rh_of_every -> Formalism.VW.rh_of_right (target 341050, expression 6497238)
- Formalism.VW.rh_of_every -> DirichletCharacter.LFunction_modOne_eq (target 341183, expression 6497276)

Reproduction: parse the solution report, verify digest and blob, for each report compare its expectedValueNames to explicit_const value references joined by "."; replace ONLY the exact unqualified LFunction_modOne_eq with DirichletCharacter.LFunction_modOne_eq for this source. Assert exactly one matching reference per expected name. The source has open Complex DirichletCharacter. The challenge error remains unresolved; do not relabel the job PASS. HANDOFF TO dependency/formal audit: correct the explicit qualified-name map and separately diagnose challenge projection child 1 null; preserve typed and structural references and verify source-to-export build correspondence. No local kernel replay.

## 4. Integrated reading order and joins

1. Arithmetic representation: 95 ordered multisegment existence/exhaustion uses actual cosocle and rank-induction hypotheses; distinguish ordered internal list from paired external list, preserve linkage and native segment representation. 97 expands ChCoef via rank-one quotient universal property and semilinear coefficient action; retains finite basis/fixing field, local realization and native EmbOrbit inputs.
2. Host supply: 96 supplies pair_exists from nested positive densities and rows_of_mem with same cutoffs, preserving the dependent second prime set and guard. Do not claim analytic pair_share stages or conductor descent supplied by this finite extraction.
3. Theta and geometric producers: 101 supplies cOneVal_pf via COne.fcVal and the half spectral shift; retains the source IwaQ, VacK, OrbRes, HolLead, FourierZero. 102 tensor extension and tangent realization supplies the functional lift under HC/HH; no arbitrary flatness assumption; tangent injectivity and denominator-clearing remain. 99 supplies integral-frame/Iwasawa comparisons for intAll_all but not the deeper moduli and archimedean existence. 98 reading witness from DivDef3 retains guarded RRTie and DcPt; does not supply initial MjHTie/IdxDefs. Block 14 above uses the same Val as blocks 10–13 and 21; not a new witness.
4. Character bound: 100 four served-prime bounds retain low/high cutoff and actual hL guard, not yet native guard supplier. Audit tiedCore_of_chainTied preserves TT identity, owner and subgroup conditions; no replacement with arbitrary independently chosen witnesses. Prior normalized power bound and exact character projection remain conditional.
5. Analytic zero exclusion: 103 expands analytic zero order/local factorization/residue normalization under the source nonidentically-zero and pole assumptions; distinguish nonzero complex residues from positive real ones. Exact modulus-one join checked in section 3. Finite Euler factors, pole at one, functional equation and root scope remain as earlier volumes.
6. Dependency: section 3 supersedes prior traversal failure. See [role projection code](../../dependencies/rh_targeted_role_witness.mjs), [kernel RUN9](../kernel_extractor/RUN9_RESUME.md), [acceleration RUN9](../on_acceleration/RUN9_RESUME.md), [structure sparse oracle](../../structure/2026-11-24_1524_sparse_ideal_oracle.mjs), [audit tied core](../../audit/2026-11-24_tied_core_witness_transport_audit.mjs). These remain supplementary evidence rather than new mathematical proof chapters; exact source and fixtures stay in original files.

## 5. Numbered remaining obligation groups — all OPEN

1. Native GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, finite fixing field for exists_actD_eq_one, LocPrime, TypeAt, segmentRepresentation and lSegExists, full correspondence producers; 95 and 97 local advances only.
2. RecTExists/VWin, native host existence, conductor descent ind_drop, ShortNorm, StagePow, analytic relative-error/mass ratio and pair_share producer inputs; 96 finite extraction expanded.
3. Seven theta/literature inputs, 15 covolume premises, IwaQ/VacK/OrbRes, HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and literature trust; 101/102 local expansions.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type and Green leaves.
5. Nine same-witness design closures, Val/HostArith/FamP, native lattice/height/thick density, initial MjHTie/IdxDefs, local_unit_map_surjective and archimedean suppliers, slope/tDetD, native low-prime guard and loss/count producers. Blocks 10–14 and 21 expanded; remaining blocks not inferred complete.
6. Independent analytic tail/derivative/regularized-pole/local order audit and native caller; 103 local expansion, not independent full proof.
7. Source/build-to-export equivalence, exact qualified typed projection including challenge error, metadata/package policy and independent kernel replay/axiom provenance. Export traversal denominator now measured; translation numerator not mapped.
8. Independent mathematical audit of all essential derivations or precise verified established theorem citations, full joins, and revision equivalence if requested.

Coverage: five of five local block-14 inequalities, 11/11 expected qualified reference matches across six exported anchor reports, nine of nine peer blob/pin checks. Defined mixed export denominator 1,484,705 reachable declarations; number of independently translated declarations unknown. No human proof-completion fraction. Preflight: AGENTS, continuity, state/log/protocol excerpts, swarm/handoff/expansion/spine, prior editor, recent compare and peer handoffs; physical CI checkpoint 378 unrelated to RH. External blueprint not reopened; source bodies primary. No physics modifications or URT performance claim.

## Appendix map
95. [Ordered multisegment existence and cosocle exhaustion](../../integration/2026-11-24_1500_ORDERED_EXISTENCE_EXHAUSTION.md) — 22b6a430e2a0a7718c260b8e7119d69a6bfd9eb1
96. [Nested density to admissible prime pair](../../math/2026-11-24_pair_exists_witness_extraction.md) — 4465b75031d4f7ec35e3b491198004f941687676
97. [Rank-one semilinear Weil coefficient transport](../../specialists/galois_representations/RUN9_CHCOEF_SEMILINEAR_WEIL_TRANSPORT.md) — 9730f573fa7c0ec8a9286bccfcdedca01df711a9
98. [Good-subspace reading witness and guards](../../specialists/character_boxes/RUN9_READING_WITNESS_GUARDED_PROPERTIES.md) — 8dda10e43864eedbbd2496bcd5bca02079e695ca
99. [Arbitrary level integral frames and Iwasawa reframing](../../specialists/positivity_geometry/RUN9_ARBITRARY_LEVEL_INTEGRAL_FRAMES_IWASAWA.md) — 9a8948bc5769daac64258fe3c432ebed89b9dda4
100. [Four finite served-prime counting bounds](../../specialists/prime_window/RUN9_SERVED_PRIME_COUNTING.md) — 894eb9f7d40a6657d86600846e40a2ea6278a61d
101. [Restricted Eisenstein coefficient and half shift](../../specialists/theta_lifts/RUN9_RESTRICTED_COEFFICIENT_HALF_SHIFT.md) — a4cac1cb1712769a3b7fe5d3a5ccf517722364e8
102. [Functional extension and tangent realization](../../specialists/literature_provenance/RUN9_FUNCTIONAL_EXTENSION_AND_TANGENT_REALIZATION.md) — 82cf86c6ec535747ef06be52eaa0dfaf6f5767e4
103. [Analytic zero order and residue normalization](../../specialists/landau_criterion/RUN9_ANALYTIC_ORDER_AND_RESIDUE_NORMALIZATION.md) — 916f2778ef1e9033875eeddab6c1ce312b69ca2e

RESUME HERE: source-to-export qualified join correction is sent to dependency/audit; editor next locate native Val/FamP supplier using the authenticated named manifest or targeted reverse callers; if unavailable, expand block 15 sizes_node_bounds_le_h0 from exact pinned source while retaining missing producer. Integrate next peer native IwaQ, ind_drop, fixing-field, tangent, archimedean and low-prime guard chapters. HANDOFF TO all RH lanes. Project OPEN.


---

## Appendix 95 — preserved peer text, blob 22b6a430e2a0a7718c260b8e7119d69a6bfd9eb1

# Ordered multisegment existence, standard cosocle and exhaustion — 2026-11-24 15:00 UTC

RESULT: SOURCE-MATCHED / PARTIAL. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, observed upstream head 9477923066c923e6dbf7292da17019f8d08d0db8 (14:18:56 UTC), not substituted. Follow-up to 1400_GUARDED_MULTISEGMENT_DUAL. One contribution: close the selected ordering and rank-induction argument, while retaining the native representation producers as explicit frontier. No kernel replay.

Preflight: SWARM_PROTOCOL first, AGENTS, research state and log excerpts, runner RESEARCH_PROTOCOL (root path returned 404, recovered under runner), continuity, HANDOFF_QUEUE, EXPANSION_15_LANES, prior integration, structure 1424, audit boundary, math scale/rank, all ten specialist RUN8/editor 1456 checkpoints. Initial directory listing JSON parse failed due to response truncation; recovered names via git tree/listing. Not all Grok lane notes or external blueprint reread. Physical CI #375 PASS 45414223054 (14:49:27 UTC), not RH verification. Editor eighth edition contains 94 numbered entries, not a coverage denominator. Dependency handoff: authenticated archive but closure failed at name ID 6019714 (structure checkpoint); no full root closure assumed. Latest specialist kernel fixture demonstrates a possible imported axiom-report discrepancy, not evidence of RH unsoundness. Preserve independent audit's quadratic boundary guard. No URT speed claim.

## 1. Exact ordering: why the direction is reversed

For nonempty segments A,B with first terms cuspidal of positive rank, the pinned Segment.precedes_iff says A precedes B iff there is a natural j with 0<j<=len(A), len(A)<j+len(B), and first(B)=nu^j(first(A)). In integer interval coordinates [c,d],[e,f] on a common twist line, j=e-c and the inequalities are exactly c<e<=d+1 and d<f. The equality at d+1 is allowed: adjacent intervals are linked. The Lean proof obtains these coordinates by eq_icc_of_first_eq, reduces to precedes_icc, and uses injectivity of integer twists. For a nonempty transitive path, induction on its edges adds their positive natural shifts; the twist law nu_s nu_t=nu_(s+t) gives endpoint shift J>0. A cycle would imply nu^J(first(A))=first(A)=nu^0(first(A)), contrary to nu_natCast_inj (positive-rank premise from IsCusp). This is not a claim that Precedes itself is transitive.

For an arbitrary relation r with no nonempty cycle, define a partial order p(a,b) iff b reaches a by zero or more r edges. Reflexivity and transitivity follow from reachability; antisymmetry follows from the no-cycle premise. Extend p to a linear order s and sort the original multiset by s, preserving multiplicities. If a occurs before b and r(a,b), then s(a,b) by sortedness and s(b,a) by extension of p, so a=b, contradicting the no-cycle premise. Thus every earlier/later pair satisfies NOT r(a,b). Specialize to segments, convert the list to its Fin(card(m)) enumeration, using Fin.univ_val_map and List.pairwise_iff_get. This constructs IsOrderedForm including the empty multiset and repeated equal segments. Sorting in the forward r direction would be wrong; [0,0] followed by [1,1] is a counterexample. The source uses order extension, not our finite integer sorting regression.

## 2. LExist.main with no lost hypothesis

Fix k with Field, ValuativeRel, TopologicalSpace, IsNonarchimedeanLocalField and CharZero. Assume hS: StandardCosocleGL, and hL: for EVERY segment Δ there is an irreducible class y(Δ) with IsLSeg Δ y(Δ).rep. For any multiset m choose its ordered enumeration Δ by the preceding theorem. Classical choice selects y and its proof globally; set x_i=y(Δ_i). Then LFactors m x is witnessed by Δ, its ordered form, and the pointwise IsLSeg proofs. Set N=sum_i rank(x_i), so hd is reflexivity; hS supplies a smooth irreducible representation π of GL_N with IsCosocle(π,prodIrr(x,hd)). Take the class IrrGL.of π. Transport the cosocle property along IrrGL.equivOf (identity equivalence on the induced product), retaining card(m), x, hd and LFactors. This is exactly IsL m class.rep. No assumption that N>0; m empty is admitted. The hL producer is exists_class_isLSeg, via lSegExists and Quotient.mk_out. The consumer lExists_of_cosocle supplies hL, retaining hS. This establishes existence for EVERY m, not the reverse assertion that every x has such m.

## 3. Native standard cosocle bridge

standardCosocle_of requires hZ: SegmentRepresentation and hI: for every local field LUnlinkedIrr. For each ordered LFactors m x and hd, use irreducibleAdmissibleGL and langlands_segment_dual hA hZ to obtain reversed dual ordered factors Γ with their factor conditions (langlands_factors_dual_reverse_ordered). contragredient_product_irreducible gives a rank equality hd' and equivalence e between the relevant product and contragredient. reverse_ordered_product_has_socle uses hA, segment_jacquet_all hA hZ, hI k and unlinked_commute_of_irreducible to construct τ and its socle proof for the reversed dual product. Transport that proof by e.symm; cosocle_of_contragredient_socle now supplies the desired original cosocle, using isSmooth_prodIrr and product_irreducible_finite_length. These are named native obligations, not general facts inferred from matrix duality. standardCosocleGL_of_seg supplies hI=lUnlinkedIrr_of_seg hZ; standardCosocleGL_holds supplies native RgGu.segmentRepresentation. The latter and each named representation theorem remain deeper obligations.

## 4. Exhaustion is the other direction; exact terminating rank induction

exhaustion_of_steps assumes nine local predicates, with CharZero: MidP, RefineP, SwapP, CuspEmbP, SuppP, JuxtP, LinkP, MinP, PeelGoodP. For rank zero use exh_le_one; for positive rank n, hC supplies a cuspidal list l and EmbL x l. It cannot be empty since the rank sum equals n. hMin supplies a minimal ρ in l; write l=A++[ρ]++B. For every a in A, hMin gives ρ≠a.nu(1) and hl gives cuspidality. Starting with the single segment on ρ, move_left produces Γ,c,y with Γ.first=ρ, IsLSeg Γ c.rep, EmbL x [c,y]. Its induction is on A by reverse recursion: empty A uses hM to group the tail; for A'++[a], if single(a) is linked to Δ then hL gives two possibilities, first excluded by ρ≠a.nu 1. Otherwise hM groups [a,b], and hJ either enlarges the segment to up Δ (first unchanged) or gives a refinement via hR that moves a into the tail. In the unlinked case hS swaps a past b. Every recursive call strictly shortens A by one. Preserve actual witnesses hΔ, hb and hx.

From EmbL x [c,y] obtain hd, an injective intertwiner f and its proof. IsLSeg yields rank(c)=deg Γ=len Γ * d Γ>0, since both factors positive. hd gives rank(c)+rank(y)=n. Consequently rank(y)<n, even when y has rank zero; strong induction supplies a multiset n' and IsL n' y.rep. hG peels Γ into the result, but requires no forbidden precedence of a segment Δ' of n' relative to Γ. Given a forbidden Precedes witness, its positive j and first-term equality contradict hMin, using hP to transport support of Δ' to the original cuspidal list and Γ.first=ρ. Keep that support transport; rank alone cannot prove the final order. This establishes LanglandsExhaustionGL conditional on nine predicates.

exhaustion_of_three constructs those nine from MidP,RefineP,SwapP plus hZ,hI: cuspEmbP_of_refine, suppP, juxtP_of_fineUniq (with segment_product_word_in_shuffle and irreducible_sub_segment_product), linkP, minP, peelGoodP (using standardCosocle_of and lSocleGL_of). lSocleGL_of uses lOrderFree_of, which uses unlinked_commute_of_irreducible. langlandsExhaustionGL_of_seg gets hI from lUnlinkedIrr_of_seg and the first three from midP', refineP', swapP' with lUnlinkedComm. Outright supplies native segmentRepresentation. Do not infer uniqueness or treat these imported obligations as axioms or proved independently here.

## Verification and provenance

Executed in V8 during this run: {"anchors":87,"nodes":18,"edges":19,"interval":784,"lists":462,"rank":5050,"negative":7}. Ten source blobs were matched to pinned GitHub API SHA, source anchors checked, selected typed graph traversed with cycle/orphan/missing/guard controls. Integer interval models and finite multiset/rank regressions check the algebra, not actual representations. Failed attempts: root protocol 404 and directory JSON truncation above; no test failures after recovery. No Lean kernel run or independent reviewer acceptance for this chapter. Whole-proof denominator unavailable. JSON below is an additive typed graph, not a replacement for earlier graphs. To reproduce, extract JSON and JS blocks to adjacent graph.json and test.mjs; run node test.mjs /path/to/pinned/rh checkout. Git blob verification fails closed.

## Typed proof obligations (JSON)

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "selected source-visible interfaces, not elaborated/kernel dependency closure; edges point from consumer to prerequisite, some are transitive",
  "source": {
    "order": [
      "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsListPairwiseNotRel.lean",
      "46283448a63e401268044ca489830e6dacb4bb80",
      [
        "theorem precedes_icc",
        "c < c' ∧ c' ≤ d + 1 ∧ d < d'",
        "theorem precedes_iff",
        "0 < j ∧ j ≤ Δ.len ∧ Δ.len < j + Δ'.len",
        "theorem exists_first_eq_of_transGen",
        "⟨i + j, by omega",
        "theorem not_transGen_precedes_self",
        "IrrGL.nu_natCast_inj Δ.isCusp_first.1",
        "theorem exists_list_pairwise_not_rel",
        "Relation.ReflTransGen r b a",
        "extend_partialOrder p",
        "m.sort s",
        "theorem exists_isOrderedForm",
        "List.pairwise_iff_get.1 hl",
        "theorem precedes_and_orderedForms"
      ]
    ],
    "defs": [
      "src/Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/NonemptyEquivMultiProdOne.lean",
      "4fb9f2f98e463779ca4408d5f9d8681bde1236e6",
      [
        "def IsOrderedForm",
        "∀ i j, i < j → ¬ (Δ i).Precedes (Δ j)",
        "def IsLSeg",
        "def LFactors",
        "def IsL (",
        "IsCosocle π (prodIrr x hd)",
        "def equivOf",
        "theorem nu_nu"
      ]
    ],
    "main": [
      "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ImportsSideRest.lean",
      "6f0c76681f689af1a7fe4512d6c6d08dfc68480c",
      [
        "namespace GlobalTheory.LocGL.LExist",
        "theorem main",
        "[CharZero k]",
        "((precedes_and_orderedForms k).1.2.2)",
        "choose y hy using hL",
        "let x : Fin 𝔪.card",
        "have hx : LFactors",
        "hS k 𝔪 𝔪.card _ x rfl hx",
        "IrrGL.of π.ρ π.smooth π.irr",
        "hπ.of_equiv"
      ]
    ],
    "cosdef": [
      "src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/StandardCosocleGL.lean",
      "5b9e4b91dd77ef84c08e25c1cb403c5a140f5dec",
      [
        "def StandardCosocleGL",
        "[CharZero k]",
        "LFactors 𝔪 x →",
        "∃ π : IrrRep (GL (Fin N) k), IsCosocle π.ρ"
      ]
    ],
    "three": [
      "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LanglandsExhaustion/ExhaustionOfThree.lean",
      "eec2d2e3bb585f0076e5fa29a9015b73e3b15865",
      [
        "theorem standardCosocle_of",
        "langlands_factors_dual_reverse_ordered",
        "contragredient_product_irreducible",
        "reverse_ordered_product_has_socle",
        "cosocle_of_contragredient_socle",
        "product_irreducible_finite_length",
        "hτ.of_equiv",
        "theorem lOrderFree_of",
        "theorem lSocleGL_of",
        "theorem exhaustion_of_three",
        "cuspEmbP_of_refine",
        "juxtP_of_fineUniq",
        "peelGoodP (standardCosocle_of hZ hI)"
      ]
    ],
    "steps": [
      "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LanglandsExhaustion/ExhaustionOfSteps.lean",
      "bb396c7e6f8f8affaaba1c3930686367b0207c74",
      [
        "theorem move_left",
        "List.reverseRecOn",
        "by_cases hlk",
        "hL a ha.1 Δ hlk",
        "(ha.2 (hΔ.symm.trans h)).elim",
        "hJ σ b Δ hb hσ",
        "ih hA' (up Δ)",
        "hR x σ A'",
        "hS x a b A'",
        "theorem exhaustion_of_steps",
        "Nat.strong_induction_on",
        "exh_le_one",
        "have hne : l ≠ []",
        "hm l hne hl",
        "move_left hM hR hS hJ hL",
        "Nat.mul_pos Γ.len_pos Γ.d_pos",
        "Fin.sum_univ_two",
        "ih y.1 (by omega)",
        "hG x [c, y].get",
        "hP x c y"
      ]
    ],
    "seg": [
      "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LanglandsExhaustion/LanglandsMultisegmentsOfSeg.lean",
      "cad378fe983922ff8e9760620577c4210f92b7be",
      [
        "theorem standardCosocleGL_of_seg",
        "standardCosocle_of hZ (lUnlinkedIrr_of_seg hZ)",
        "theorem langlandsExhaustionGL_of_seg",
        "midP' k irreducibleAdmissibleGL",
        "refineP' k",
        "swapP' k"
      ]
    ],
    "outright": [
      "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LanglandsExhaustion/Outright.lean",
      "cc5e11dde338857b42c8285a2e7de7337bcd1ae6",
      [
        "theorem standardCosocleGL_holds",
        "standardCosocleGL_of_seg PositivityTheory.RgGu.segmentRepresentation",
        "theorem langlandsExhaustionGL_holds",
        "langlandsExhaustionGL_of_seg PositivityTheory.RgGu.segmentRepresentation"
      ]
    ],
    "classseg": [
      "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LanglandsExhaustion/ExistsClassIsLSeg.lean",
      "f2ae9f989deab81836baa4b3172b24cd44596898",
      [
        "theorem PositivityTheory.Exh.exists_class_isLSeg",
        "PositivityTheory.Exh.lSegExists",
        "Quotient.mk_out",
        "IsCosocle.of_equiv"
      ]
    ],
    "consumer": [
      "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LocalLanglandsExistence/LanglandsDataDualGLOfCosocle.lean",
      "17eb5f909e340ec0fc9ed73aaa701240db9ecec2",
      [
        "theorem lExists_of_cosocle",
        "GlobalTheory.LocGL.LExist.main k hS",
        "PositivityTheory.Exh.exists_class_isLSeg k"
      ]
    ]
  },
  "roots": [
    "exist",
    "exh"
  ],
  "nodes": [
    {
      "id": "exist",
      "file": "consumer",
      "declaration": "lExists_of_cosocle",
      "deps": [
        "main",
        "classseg",
        "cos"
      ],
      "guard": "local field characteristic zero; StandardCosocleGL",
      "frontier": [
        "LanglandsDataDualGL second field is prior chapter"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "main",
      "file": "main",
      "declaration": "GlobalTheory.LocGL.LExist.main",
      "deps": [
        "ordered",
        "defs",
        "cos"
      ],
      "guard": "local field characteristic zero; hS; ∀ segment exists IsLSeg; any multiset including empty",
      "frontier": [
        "classical choice",
        "IrrGL.equivOf",
        "IsCosocle.of_equiv"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "ordered",
      "file": "order",
      "declaration": "exists_isOrderedForm",
      "deps": [
        "sort",
        "acyclic",
        "defs"
      ],
      "guard": "any finite multiset of segments",
      "frontier": [
        "Fin.univ_val_map",
        "List.ofFn_get",
        "List.pairwise_iff_get"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "sort",
      "file": "order",
      "declaration": "exists_list_pairwise_not_rel",
      "deps": [],
      "guard": "∀ a ¬ TransGen r a a; arbitrary multiset",
      "frontier": [
        "extend_partialOrder",
        "Multiset.sort_eq",
        "pairwise_sort"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "acyclic",
      "file": "order",
      "declaration": "Segment.not_transGen_precedes_self",
      "deps": [
        "positive",
        "precedes"
      ],
      "guard": "positive-rank cuspidal first term of nonempty segment",
      "frontier": [
        "IrrGL.nu_natCast_inj"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "positive",
      "file": "order",
      "declaration": "Segment.exists_first_eq_of_transGen",
      "deps": [],
      "guard": "nonempty relation path",
      "frontier": [
        "IrrGL.nu_nu"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "precedes",
      "file": "order",
      "declaration": "Segment.precedes_iff",
      "deps": [],
      "guard": "two nonempty segments in local field",
      "frontier": [
        "precedes_icc",
        "eq_icc_of_first_eq",
        "nu_intCast_inj",
        "linked_icc"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "defs",
      "file": "defs",
      "declaration": "IsOrderedForm / LFactors / IsL",
      "deps": [],
      "guard": "ordered indexed family; rank sum equality; IsLSeg",
      "frontier": [
        "native prodIrr and IsCosocle definitions"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "classseg",
      "file": "classseg",
      "declaration": "exists_class_isLSeg",
      "deps": [],
      "guard": "segment; lSegExists producer",
      "frontier": [
        "lSegExists",
        "Quotient.mk_out",
        "IsCosocle.of_equiv"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "cos",
      "file": "outright",
      "declaration": "standardCosocleGL_holds",
      "deps": [
        "cosseg",
        "cosdef"
      ],
      "guard": "local field characteristic zero in conclusion",
      "frontier": [
        "RgGu.segmentRepresentation"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "cosdef",
      "file": "cosdef",
      "declaration": "StandardCosocleGL",
      "deps": [],
      "guard": "all fields, rank sum, LFactors",
      "frontier": [],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "cosseg",
      "file": "seg",
      "declaration": "standardCosocleGL_of_seg",
      "deps": [
        "cos3"
      ],
      "guard": "hZ SegmentRepresentation",
      "frontier": [
        "lUnlinkedIrr_of_seg"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "cos3",
      "file": "three",
      "declaration": "standardCosocle_of",
      "deps": [],
      "guard": "hZ; hI LUnlinkedIrr; all StandardCosocleGL guards",
      "frontier": [
        "irreducibleAdmissibleGL",
        "langlands_segment_dual",
        "langlands_factors_dual_reverse_ordered",
        "contragredient_product_irreducible",
        "reverse_ordered_product_has_socle",
        "segment_jacquet_all",
        "unlinked_commute_of_irreducible",
        "product_irreducible_finite_length",
        "cosocle_of_contragredient_socle"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "exh",
      "file": "outright",
      "declaration": "langlandsExhaustionGL_holds",
      "deps": [
        "exhseg"
      ],
      "guard": "every irreducible class over characteristic-zero local field",
      "frontier": [
        "RgGu.segmentRepresentation"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "exhseg",
      "file": "seg",
      "declaration": "langlandsExhaustionGL_of_seg",
      "deps": [
        "three"
      ],
      "guard": "hZ SegmentRepresentation",
      "frontier": [
        "lUnlinkedIrr_of_seg",
        "midP'",
        "refineP'",
        "swapP'",
        "lUnlinkedComm"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "three",
      "file": "three",
      "declaration": "exhaustion_of_three",
      "deps": [
        "steps",
        "cos3"
      ],
      "guard": "hZ; hI; ∀ local field MidP ∧ RefineP ∧ SwapP",
      "frontier": [
        "cuspEmbP_of_refine",
        "suppP",
        "juxtP_of_fineUniq",
        "segment_product_word_in_shuffle",
        "segment_jacquet_all",
        "irreducible_sub_segment_product",
        "linkP",
        "minP",
        "peelGoodP",
        "lSocleGL_of"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "steps",
      "file": "steps",
      "declaration": "exhaustion_of_steps",
      "deps": [
        "move"
      ],
      "guard": "nine premises MidP, RefineP, SwapP, CuspEmbP, SuppP, JuxtP, LinkP, MinP, PeelGoodP; CharZero",
      "frontier": [
        "exh_le_one",
        "List.append_of_mem",
        "single_spec",
        "hc.deg_eq",
        "Fin.sum_univ_two",
        "hP support transport",
        "hG peel"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "move",
      "file": "steps",
      "declaration": "move_left",
      "deps": [],
      "guard": "hM hR hS hJ hL; all a in A cuspidal and ρ≠a.nu 1; Δ.first=ρ; IsLSeg; EmbL",
      "frontier": [
        "hM split",
        "hL linked alternatives",
        "hJ extension or replacement",
        "hR refinement",
        "hS swap"
      ],
      "status": "SOURCE-MATCHED"
    }
  ]
}
```

```javascript
import fs from 'node:fs';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const g=JSON.parse(fs.readFileSync(new URL('./graph.json',import.meta.url),'utf8'));const rh=process.argv[2];if(!rh)throw Error('provide RH checkout');const src={};for(const [k,[p,h]] of Object.entries(g.source)){const b=execFileSync('git',['-C',rh,'show',g.pin+':'+p],{maxBuffer:32*1024*1024});if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==h)throw Error('blob mismatch '+p);src[k]=b.toString('utf8')}
function test(g,src){
 function ck(x,m){if(!x)throw Error(m)}
 function verify(g,src){let anchors=0;for(const [k,[p,h,as]] of Object.entries(g.source)){ck(p&&h.length===40&&typeof src[k]==="string","source "+k);for(const a of as){ck(src[k].includes(a),"missing anchor "+k+" "+a);anchors++}}
 const map=new Map(g.nodes.map(n=>[n.id,n]));ck(map.size===g.nodes.length,"duplicate node");let seen=new Set(),active=new Set(),edges=0;
 function visit(i){ck(map.has(i)&&!active.has(i),"missing/cyclic "+i);if(seen.has(i))return;const n=map.get(i);ck(n.guard&&g.source[n.file]&&Array.isArray(n.frontier),"guard/source");active.add(i);for(const j of n.deps){edges++;visit(j)}active.delete(i);seen.add(i)}g.roots.forEach(visit);ck(seen.size===map.size,"orphan");return {anchors,nodes:seen.size,edges}}
 const base=verify(g,src);let interval=0,lists=0,rank=0,negative=0;
 // Integer interval models of one cuspidal twist line; no native representation execution.
 function precedes(a,b){const [c,d]=a,[e,f]=b;return c<e&&e<=d+1&&d<f}
 const iv=[];for(let a=-3;a<=3;a++)for(let b=a;b<=3;b++)iv.push([a,b]);
 for(const a of iv)for(const b of iv){let [c,d]=a,[e,f]=b,j=e-c,n=d-c+1,m=f-e+1;
 ck(precedes(a,b)===(0<j&&j<=n&&n<j+m),"precedes iff");ck(!(precedes(a,b)&&precedes(b,a)),"asymmetry");
 const da=[-d,-c],db=[-f,-e];ck(precedes(a,b)===precedes(db,da),"dual order");interval++}
 // Exhaust every multiset of size <=5 from six distinct interval types (duplicates and empty retained).
 const types=[[0,0],[1,1],[2,2],[0,1],[1,2],[0,2]];
 function listcheck(l){const sorted=l.slice().sort((a,b)=>types[b][0]-types[a][0]||a-b);
 ck(l.length===sorted.length&&l.slice().sort().join(",")===sorted.slice().sort().join(","),"multiset multiplicity");
 for(let i=0;i<sorted.length;i++)for(let j=i+1;j<sorted.length;j++)ck(!precedes(types[sorted[i]],types[sorted[j]]),"ordered form");lists++}
 function enumerate(l,start){listcheck(l);if(l.length===5)return;for(let j=start;j<types.length;j++)enumerate([...l,j],j)}enumerate([],0);
 for(let n=1;n<=100;n++)for(let c=1;c<=n;c++){let y=n-c;ck(c+y===n&&0<=y&&y<n,"strong induction rank");rank++}
 function reject(f){let bad=false;try{f()}catch(e){bad=true}ck(bad,"negative accepted");negative++}
 reject(()=>verify({...g,nodes:g.nodes.filter(n=>n.id!=="ordered")},src));
 reject(()=>verify({...g,nodes:g.nodes.map(n=>n.id==="move"?{...n,deps:["steps"]}:n)},src));
 reject(()=>verify({...g,nodes:g.nodes.map(n=>n.id==="main"?{...n,guard:""}:n)},src));
 reject(()=>verify(g,{...src,order:src.order.replace("Relation.ReflTransGen r b a","Relation.ReflTransGen r a b")}));
 reject(()=>ck(!precedes([0,0],[1,1]),"ascending order invalid"));
 reject(()=>ck(5-0<5,"zero peeled rank invalid"));
 reject(()=>ck([0,0].length===[0].length,"dedup loses multiplicity"));
 return {...base,interval,lists,rank,negative}
}
console.log(JSON.stringify(test(g,src),null,2));
```

RESUME HERE: expand native RgGu.segmentRepresentation and lSegExists, starting at ProbeL.lean and SegmentRepresentation.lean imports; retain the exact linked/unlinked and socle/cosocle distinctions. HANDOFF TO editor (append this chapter), audit (review reversed order and hP/hMin support argument), dependencies (resolve name ID 6019714). Project OPEN.


---

## Appendix 96 — preserved peer text, blob 4465b75031d4f7ec35e3b491198004f941687676

# MATH lane — `QH.pair_exists`: extracting an admissible prime pair

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED human derivation of the single pinned theorem `QH.pair_exists`, with a finite exact/numeric regression.  
**Status:** PARTIAL for the full reconstruction. This is not a Lean kernel replay, does not reprove `pair_share` or its analytic inputs, and is not a proof of RH.

## Source pin and exact scope

Authoritative source: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role used here |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean` | `7e63fdeda04264253733059bf951a4c1635cebaa` | theorem reconstructed here |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean` | `712579c16be75074705a2c5c00f69e2f5d835cf9` | nested positive-density premise |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean` | `f9d738eb0e0dce29b14633183dcafe3e0db5cb0d` | converts the two selected memberships to `Rows` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | definitions of the two prime sets, `GoodQ`, `GoodD`, and `Rows` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/pairEx.lean` | `0020840fcf9b97e9e6e834c591e8516b9875e003` | immediate downstream consumer `QH.pairEx` |

Current upstream `HEAD` observed during this run was
`59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780` (2026-11-24 15:13:54 UTC). The pinned
`PairExists.lean` path returns 404 there, and current-head code search finds no `pair_exists`, so this
chapter claims fidelity only to the requested pin.

The preceding MATH chapter reconstructed `pair_share`. This contribution begins at its output and
ends with one actual pair `(q,d)`. It does not repeat the zero-density estimates that produced the
good sets.

## 1. Exact theorem and quantifier order

There exists a real constant `C>0` such that, for every real `eps,tau,K` and natural `N0`, if

`0<eps`, `eps<1/52`, `0<tau`, `1<=K`, and `0<N0`,

then there exists a real threshold `Y0` such that for every `Y>=Y0` and every real `X,z'` with

`X<=Y^K`,

`Y^(eps/5)*(log Y)^2 <= z' <= K^2*(Y^(eps/5)*(log Y)^2)`,

there exist naturals `q,d` satisfying all four conclusions simultaneously:

1. `Rows (Y^(eps/5)) z' q d`;
2. `N0<q`;
3. `GoodQ N0 C tau Y X (Y^(eps/5)) q`;
4. `GoodD N0 C tau Y X (Y^(eps/5)) z' q d`.

The choices are dependent: first choose `q` from `G1`; only then does `pair_share` provide the set
`G2(q)` from which `d` is selected.

## 2. Freeze the loss at one half

Take `C>0` and the threshold-producing statement from `pair_share`, and specialize its free loss
parameter to

`eta = 1/2`.

This is not a fitted physical constant. It is a proof choice ensuring that a positive-cardinality
ambient finite set has a nonempty good half. The source does this twice.

For a finite ambient set `P` and good subset `G`, `pair_share` gives

`0<card(P)` and `(1-1/2)*card(P) <= card(G)`.

After casting cardinalities to the reals,

`0 < (1/2)*card(P) <= card(G)`.

Hence `0<card(G)`, equivalently `G.Nonempty`. Applied first to

`P1=primePairSetFirst(Y^(eps/5))`,

this selects `q in G1`. The nested conclusion at that `q` gives the same two inequalities for

`P2(q)=primeSetTwoBounds(Y^(eps/5),z',q)`,

so it selects `d in G2(q)`. No independence, product-density, or common `G2` is asserted.

The strict choice `eta<1` is essential to this selection step. `pair_share` itself only assumes
`eta>0`; at `eta=1` its cardinality lower bound permits `G` to be empty.

## 3. Add exactly the two growth cutoffs

Write

`z = Y^(eps/5)`.

Because `eps/5>0`, `Y^(eps/5)` tends to infinity with `Y`. The proof obtains a threshold `Y2` such
that

`2*N0 <= z`

for every `Y>=Y2`. It then takes the final threshold

`Y0 = max(max(Y1,Y2), exp 2)`,

where `Y1` is the threshold returned by `pair_share` at `eta=1/2`.

The last cutoff is used quantitatively, not cosmetically. From `exp 2<=Y` the source obtains

`0<Y`, `2<=log Y`, and therefore the weaker but sufficient inequality

`2 <= (log Y)^2`.

Combining that with the theorem's lower window bound gives

`2*z <= z*(log Y)^2 <= z'`.

This is the separation premise needed by `rows_of_mem`. Without `Y>=exp 2`, the stated lower bound
need not dominate `2z`; for example `Y=e` gives `(log Y)^2=1`.

## 4. Convert memberships to the full `Rows` record

The subset witnesses from `pair_share` give

`q in primePairSetFirst z`, and `d in primeSetTwoBounds z z' q`.

Together with `z>0` and `2z<=z'`, the exact call is

`rows_of_mem z z' q d hz hzz (hG1 hq) (hG2 hd)`.

Unfolding the two prime sets, `rows_of_mem` obtains:

- `q` prime, `q mod 8=3`, `exp(z/2)<q<=exp z`;
- `d` prime, `d mod 16=7`, `exp(z'/2)<d<=exp z'`;
- `oddM z q` divides `d+1`.

Positivity of the two primes turns the exponential inequalities into

`z/2 < log q <= z`, and `z'/2 < log d <= z'`.

For the order relation, `2z<=z'` gives

`exp z <= exp(z'/2)`.

Thus

`q <= exp z <= exp(z'/2) < d`,

so `q<d`. Finally, the divisibility `oddM z q | d+1` implies the `Rows.d_class` condition: every
odd prime `p<=z` occurs in the finite product defining `oddM`, and the additional factor `q` handles
the separate case `p=q`. Therefore each such `p` divides `d+1`, equivalently `(d+1) mod p=0`.

This is more than a type conversion: the difficult step is the `q<d` comparison, and its source
proof uses the separately manufactured scale separation `2z<=z'`.

## 5. Prove the strict lower bound `N0<q`

The selected `Rows` witness supplies `q` prime and

`z/2 < log q`.

Primality gives `q>0`, so the standard logarithmic inequality used in the source is

`log q <= q-1`.

The growth cutoff gives `2*N0<=z`, hence `(N0:real)<=z/2`. The complete chain is

`(N0:real) <= z/2 < log q <= q-1 < q`.

Consequently `(N0:real)<q`, and exact casting returns the natural-number conclusion `N0<q`.
Nothing in this step changes `C`, `tau`, `X`, either modulus, or either character quantifier.

## 6. Preserve `GoodQ` and `GoodD`

Once `q in G1` is chosen, the first component of the nested `pair_share` conclusion is already

`GoodQ N0 C tau Y X z q`.

Once `d in G2(q)` is chosen, its final universal statement is already

`GoodD N0 C tau Y X z z' q d`.

The proof merely projects these two facts (`hgq` and `H4 d hd`). It performs no new monotonicity,
character manipulation, zero-free estimate, or parameter weakening here.

## 7. Immediate downstream link

Pinned `QH.pairEx` applies `pair_exists` with

`tau=eps/2`, `K=A`, `N0=8*M`, `X=Y^A`, and `z'=Y^(eps/5)*(log Y)^2`.

It receives `q,d,Rows,8*M<q,GoodQ,GoodD`; then `pairEx_box` transports the two good-character
statements into the `Box` obligations for the four `(i,j):Fin 2 x Fin 2` twists. Thus
`pair_exists` is the finite witness-selection bridge between density estimates and the character-box
consumer. It does not itself prove `PairEx`, the theta lift, the Galois representation input, or RH.

## 8. Corrections to existing interpretation

- **Corrected:** the existing `pairEx` chapter said `pair_share` “intersects positive-density good
  subsets.” The source does not form an intersection: it selects `q` from `G1`, then selects `d`
  from a dependent `G2(q)`.
- **Corrected:** half-density is used twice and sequentially; it is not a single simultaneous choice
  of `(q,d)` and not a product-density argument.
- **Corrected:** `2z<=z'` is not a theorem hypothesis. It is derived from the extra cutoff
  `Y>=exp 2` and the lower `z'` window bound.
- **Corrected:** `N0<q` is not supplied by `pair_share`; it uses the new cutoff `2*N0<=z`, the
  strict `Rows.q_gt`, and `log q<=q-1`.
- **Preserved:** the upper bound on `z'` and `X<=Y^K` are used when invoking `pair_share`, even
  though the later witness-extraction arithmetic does not mention them.
- **Preserved:** `rows_of_mem` establishes every field of `Rows`, including congruences,
  logarithmic windows, `q<d`, and the divisibility class.
- **Preserved:** all original hypotheses `0<eps<1/52`, `0<tau`, `1<=K`, and `0<N0` remain.

## Executed tests

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_exists_witness.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_exists_witness.py
```

The checker validates the five pinned path/blob pairs and report anchors; exhaustively tests the
half-density-to-nonempty inference for positive finite cardinalities; checks the two cutoff
inequalities over a parameter grid; verifies the strict `N0<q` chain on actual primes; and checks an
explicit `Rows` fixture

`z=3, z'=6, q=11, d=263`.

It also runs three negative controls: `eta=1` permits an empty good set, `Y=e` fails to force
`2z<=z'`, and prime interval bounds without `2z<=z'` permit reversed order. This validates the
finite/arithmetic assembly, not Lean elaboration or the upstream analytic theorems.

## Failed attempts / limitations

- The first attempted repository read failed because no checkout was mounted in the workspace; the
  exact protocol and sources were then read through the connected repository API before editing.
- The case-sensitive guess `PairEx.lean` returned 404. A pinned directory enumeration showed the
  actual downstream path is lowercase `pairEx.lean`; that path and blob are recorded above.
- The pinned `PairExists.lean` path returns 404 at current upstream `HEAD`, and current-head code
  search found no replacement declaration. No renamed theorem was guessed.
- No local upstream Lean checkout exists, so `lake build`, elaborated proof-term inspection, and
  `#print axioms QH.pair_exists` were not run.
- The checker treats `pair_share` and `rows_of_mem` as source-matched premises. It cannot certify
  their analytic inputs or kernel dependencies.

## RESUME HERE

Reconstruct pinned `QH.ind_drop`, the unresolved conductor-descent step used only in the
`pairEx_box` branch `j=0,i=1`: preserve both ambient moduli, `q` primality and `q!=2`, the premise
`not q divides 8*M`, primitive-character uniqueness, and every change-level evaluation. Do not
repeat the completed `pairEx`, `pair_share`, `pair_exists`, or `rows_of_mem` assemblies.

**HANDOFF TO:** MATH, character-box specialist, audit, integration.


---

## Appendix 97 — preserved peer text, blob 9730f573fa7c0ec8a9286bccfcdedca01df711a9

# Run 9 — ChCoef: semilinear coefficient transport on rank-one Weil–Deligne parameters

2026-11-24. RESULT: SOURCE-MATCHED reconstruction, including the native quotient universal property, the twist existence mechanism, and the consumer df_coef. Executed finite algebra regression below. Not independent Lean replay, not full RH closure, not a URT benchmark.

## Preflight
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state and continuity excerpts, research-log and protocol excerpts, Run 8, and recent specialist RESUME notes (theta Run 9 IwaQ; kernel Run 9 fresh/cached export; character boxes Run 8 lattice; literature Run 8 LieDual; editor 1456 local zero-order; geometry Run 8 integral frame; prime and Landau Run 9; dependency, integration, structure and acceleration notes). No duplicate of their tasks. Latest Cathedral summary observed PASS at 15:28:23Z, run 45420945162, not an RH certificate. Blueprint and full source/kernel DAG not read in this run; source claims below are from the original Lean declarations, not the blueprint. Canonical pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780. No physics queue changes.

## 1. Exact target and quantifiers
In EmbOrbit.lean, WDis(P,iota,h,B,hj,kappa,xi) means (a) IsPstAt P B (rk1 kappa), and (b) existence of a smoothness witness hs such that wdAt P iota B h hj (rk1 kappa) equals WD.lpOfChar h (iota_* xi) hs. Here F is a number field, Omega its algebraic closure, l a prime, A a valuation subring, w a finite place, h the place-over witness, B a LocBridge on the decomposition group with coefficient ring O a topological Z_l algebra, hj : Induces B, iota : Qbar_l ≃+* C. Kappa is a unit-valued monoid hom on the decomposition group, xi on Weil(h). ChCoef universally quantifies over all of these data, s in GQ(l)=Gal(Qbar_l/Q_l), and assumes Continuous kappa and WDis for P=Loc.PP l. It asserts WDis for s_* kappa and s_* xi, with the same iota, h, B, hj and P. No assertion that arbitrary complex conjugation preserves p-adic continuity. The source intro discards the continuity hypothesis in this particular proof; retain it in the statement and in consumers.

## 2. Universal property of Letter: the two scalar relations
For fields L,U,F, L-algebra F, L-module D, m:U→End_L(D) a ring hom, tau:U→F, F-module M, let g:D→M be additive. Assume for ALL a∈L,c∈U,x∈D,
 g(ax)=i_L(a)g(x),    g(m(c)x)=tau(c)g(x).
Letter(m,F,tau) is (F⊗_L D)/sum_c im(m(c)_F - tau(c)I).
The first condition makes g L-linear after restricting M's F-action. Base change gives gtilde(b⊗x)=b g(x), F-linear. For the second relation:
 gtilde((m(c)_F-tau(c)I)(b⊗x))
 = b g(m(c)x)-tau(c)b g(x)=0.
Pure tensors span the tensor product, so every relation image, and then their sum, is in the kernel. The quotient lift Φ is F-linear and Φ([1⊗x])=g(x). This is letter_lift; the proof actually checks zero, pure tensor and addition by tensor induction. Neither dimension nor a field embedding bijection is needed for this universal property. Uniqueness follows from spanning classes, though the native conclusion is existence only.

## 3. Potential semistability under a coefficient-semilinear equivalence
Let k=Q_l, U=MaximalUnramifiedExtension l, L1,L2 finite subextensions of Qbar_l/k, V_i L_i-modules with compatible k-module structures, rho_i representations of the SAME local group GK(K). Suppose f:V1≃_k V2 intertwines every group action. The map Q=dQ(P,hf) on D_i=Dpst(P,rho_i) is induced by f⊗id on V_i⊗_k Bst(P). Fixed-space witnesses carry over by intertwining; the inverse of f also intertwines. dQ_inv proves the two compositions equal identity by tensor induction, and dQ_bij uses these inverses. Q commutes with multiplication by U (dQ_mulD), so it is U-linear on DpstUr, and the U-rank agrees. Since the k-rank of V also agrees, IsPst for rho1 implies IsPst for rho2 (isPst_equiv). This does not require that f be L1-linear into V2.
If additionally f(av)=s_L(a)f(v) for s_L:L1→L2 induced by s on Qbar_l, then Q(ax)=s_L(a)Q(x) by tensQ_smul. Q commutes with actD and phiD, hence with integer powers of the invertible phiU (including negative exponents), and with weilD for each σ (dQ_weilD). Q by itself is U-linear, not generally U-semilinear for s.

## 4. Why a second map T is needed, and why it exists
The crucial bridge is BridgeParam.IsTwist. For a representation rho over coefficient field LL with compatible k action, T is a UNIT of End_LL(Dpst P rho); it must satisfy
 T m(c)=m(s(c)) T for all c∈U (the target c' in U is justified by BridgeInd.mem_Kur_iff);
 T actD(h)=actD(h) T for every h∈GK(K);
 T phiD=phiD T;
 T monD=a monD T for some a∈LL with a≠0.
Note the monodromy factor is not required to equal 1. In the rank-one eigenvalue argument only the first three laws are used, but the native twist theorem has all four and must not be weakened in the evidence store.

The theorem exists_isTwist assumes DpstUr finite-dimensional over U. It constructs the subgroup S of s admitting T. Identity uses T=I; multiplication uses T T' and monodromy factor aa'; inverse uses T^{-1} and a^{-1}. The source proves S open: choose finite K' by exists_actD_eq_one (the actual finite-action lemma is a remaining leaf), and N the finite normal closure of the compositum of K,K'. For s fixing N use T=actD(s|GK(K)). It acts on U as s, commutes with phiD and monD, and commutes with each actD(h) because the commutator s^{-1}h^{-1}s h lies in the fixing subgroup of N and acts trivially on U. The latter follows from comm_on_Kur: all automorphisms commute on prime-to-l roots of unity, where their actions are power maps, then kur_algHom_ext extends this equality to U. The finite-action lemma kills that commutator on Dpst. Thus the fixing subgroup of N lies in S and S is open, hence closed.
For s fixing U use T=I. For s acting on U as frobUr use T=phiU, with nonzero monodromy factor l^{-1} (monD_phiD). Finally eq_top_of_isOpen: if x is fixed by S, x is fixed by Gal(Qbar_l/U) and therefore lies in U by infinite Galois correspondence; it is then fixed by frobUr (an extension exists by FrobLaws.exists_ext), so lies in k by MemLoc.frob_laws. Since S is closed and its fixed field equals k, S is all GQ(l). This is the native existence proof; the finite-action producer, MemLoc.frob_laws, and actual LocPrime realization are distinct obligations, not consequences of the finite model below.

## 5. Semilinear descent to the complex quotient
Set S=T∘Q, with T on D2. Then S is additive, S(ax)=s_L(a)S(x), S(m1(c)x)=m2(s(c))S(x), and S weilD1(σ)=weilD2(σ)S. The two scalar conditions have different origins: Q transports L, T transports U.
Put θ=iota∘s∘iota^{-1}:C→C. This is a field automorphism, not assumed continuous or the usual complex conjugation. In exists_semi, take g(x)=[Sx]_2 and give the target WDSpace the twisted scalar action b⋆y=θ(b)y. Apply letter_lift: the two laws above, together with wdMk_smul and wdMk_mul, are exactly its hypotheses in the twisted module. The resulting map is θ-semilinear in the ordinary target action:
 Φ(iota(z)y)=iota(s(z))Φ(y),   Φ([x]_1)=[Sx]_2.
The proof constructs it rather than assuming it descends. A naive ordinary C-linear map would not satisfy the required scalar transport. The actual exists_semi statement returns a function with these laws; additivity comes from its constructed linear lift.

## 6. Eigenvalues and monodromy: why rank one matters
Under the two rank-one hypotheses dim_Li Vi=1 and IsPst for rho1, Run 8's LetterDim gives dim_C W_i=1; section 3 supplies IsPst for rho2. Suppose iota(z) belongs to eig of wdPst1 at σ. DpstMap.charPol_wdPst identifies its characteristic polynomial with that of wdRho1. A linear operator on a one-dimensional space with root λ of its characteristic polynomial equals λI (line_smul). Apply Φ to wdRho1(σ)[x]_1=iota(z)[x]_1. The intertwining of Q with weilD and T with actD and all powers of phiU shows
 wdRho2(σ)[Sx]_2=iota(s(z))[Sx]_2.
To produce a NONZERO eigenvector, choose y∈D2 with [y]_2≠0 (otherwise the spanning classes would force W2=0, contradicting dimension one). T and Q are surjective, so y=Sx for some x. Thus iota(s(z)) is a root of the target characteristic polynomial, exactly eig_conj. No assertion that every input x has nonzero quotient class.
The source recovers the complete WD class via ParamAboveModel.eq_lpOfChar: for rank one, all Weil operators are specified by these roots, and nilpotent monodromy must be zero (a scalar c with c^n=0 over a field has c=0). This explains why ignoring monodromy is legitimate here, not at higher rank. The theorem requires smoothness of the candidate character. It is not a generic reconstruction of a higher-rank WD representation from eigenvalues.

## 7. From the finite model back to wdAt and to correction characters
ChCoef starts from the finite coefficient model (L,r) extracted from IsPstAt for rk1 kappa. Set L2=mapExt(s,L), t:L≃_k L2 induced by s, f=t coordinatewise on Fin 1→L, and r2=mapRep(t,r). Matrix-vector multiplication respects t, so f intertwines the same local group representations and is t-semilinear. The single matrix entry gives mapRep(inclusion,r2)=rk1(s_*kappa). wdAt_eq_of does NOT assume L2 contains the bridge coefficient field B.LL: enlarge to supExt(L2,B.LL), establish IsPst by PstExt.isPst_enlarge, and compare the chosen wdAt witness with the supplied model in a common finite compositum using equal entrywise images and BridgeParam.wdPst_enlarge. Thus the target is genuinely wdAt for s_*kappa. The original smoothness witness for iota_*xi gives smoothness for iota_*s_*xi by inclusion of the old kernel into the new one (in fact equality since s and iota injective). For every σ, eig_conj sends the old eigenvalue iota(xi(σ)) to iota(s(xi(σ))). Apply eq_lpOfChar with the native rank-one lpDim_wdAt theorem. This supplies ChCoef, not any claim that the coefficient automorphism acts on the underlying global field or on the Weil-group argument σ.

Consumer ContinuousRankOneRep.df_coef:
 let δ_τ denote the correction at weight e_τ=Pi.single τ 1. For embeddings τ,τ' of the local completion related by τ'=s∘τ and Df(e_τ,d), Df(e_τ',d'), choose a continuous locally algebraic ν of weight e_τ (exw). The conjugated ν'=s_*ν is continuous by cont_gq (spectral norm invariance), and locally algebraic with weight e_τ' by the original sign -1 in the inertia formula. The old open-kernel witness transports by s. The two candidate WDis characters for ν' are s_*(ν|Weil · τ(a) · d) via ChCoef, and ν'|Weil · τ'(a) · d' by Df(e_τ',d'). ChBasic uniqueness makes them equal; cancel the common nonzero unit ν'(σ) τ'(a(σ)), obtaining d'(σ)=s(d(σ)). This is the actual native lemma name df_coef, not an assumed df_gal. Additivity of corrections is constructed separately in df_ex; hom_sum expands δ(wt) as the product of the single-weight corrections to their integer weights. df_unit invokes EmbOrbit on df_coef, then df_res, df_one and LocWD as in Runs 4–7. LocWD feeds Crys.alg/CoreAll and Row0b (Runs 1–3), then recParameter/window nonvanishing; the full kernel reachability and downstream obligations remain open.

## 8. Pinned source inventory and head comparison
Paths below relative to src/Development/. Blob hashes are connector-returned Git blob IDs, not locally rehashed.
- AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/ChCoef.lean, 7db4f32626a0c604ace1a4909a1312601693849a: letter_lift 11–29; line_smul 31; dQ_inv 45; dQ_bij 58; isPst_equiv 67; exists_semi 87; eig_conj 115; wdAt_eq_of 162; chCoef 181. Migrated into ContinuousRankOneRep.lean at observed head fb0bdf5416986c8a291ace6ba2fadc618722623a, starts 353,373,387,400,409,429,459,506,525 respectively. Literal declaration slices through first blank line: line_smul,dQ_bij,isPst_equiv,eig_conj,wdAt_eq_of unchanged. letter_lift makes map_add argument explicit; exists_semi makes module scalar action explicit. chCoef has same inspected body plus clump endings. dQ_inv text differs; not asserting semantic equivalence.
- AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/EmbOrbit.lean, f7b21c5d5a970b595c05d7b2226e9c2854b6622b → ab7211e5b4527fe7478c7134ce2c524359988de9. ChCoef 52→93 unchanged. WDis 21→61, line break and wdAt qualification changed.
- AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/ContinuousRankOneRep.lean, 028d93377a68710f3e21da03eff798ff7fd103af → fb0bdf5416986c8a291ace6ba2fadc618722623a. df_ex 147→1095 unchanged; hom_sum 166→1114 changed text; df_coef 172→1121 changed text; df_unit 219→1168 unchanged. Pinned proof translated above; no blanket upstream semantic-equivalence claim.
- AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean, ffdce791714cb11064760245f465f9ba78449bbc → 6e6f30ca2a8b1428043c1212f4c75896a3c5d747. eq_top_of_isOpen 20, comm_on_Kur 39, IsTwist 79→123, twistGroup 84, isOpen_twistGroup 107→151, exists_isTwist 132→176. Last three compared declarations IsTwist,isOpen_twistGroup,exists_isTwist identical.
- AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/ConclusionFinite.lean, 149eac42d2d0f593e5736a50b7d7aadd8dba9df0 → 0b68268987669ffc126f293c08e5b08cbdf937f2. eq_lpOfChar 27→72 identical.
- AbelianVarietyTheory/Proofs/SatakeParameters/CharpolyWeilDelignePotSemistableEnlargeCoefficie.lean, 11da869cd4f69f2465a3589e62e3e97e9c211b84: dQ 98, dQ_mulD 112, dQ_weilD 157, tensQ_smul 238, anchored only in pinned source.
- AbelianVarietyTheory/Proofs/SatakeParameters/CommuteIsNilpotentOfUnipotent.lean, c1da854fc3cfdf3869f24fa1462d226991a776c0: charPol_wdPst 226, anchored only.
- AbelianVarietyTheory/Proofs/SatakeParameters/IsPotentiallySemistableCoefficientFieldEnlarge.lean, b1b70f827f4f946cfdc2faf70666cbc338c86900: native isPst_enlarge proof inspected, uses coordinate splitting and rank equality. Not head-compared.

## 9. Executed exact finite regression (not p-adic Hodge verification)
Model F4=F2[t]/(t²+t+1), s(x)=x². D=F4², L=U=F4. L action A(a)=diag(a,s(a)), U action scalar c. Base-changed coordinates B(x)=(x0,s(x1)); quotient by U-relations is first coordinate. Q swaps the two coordinates (L-semilinear, U-linear); T swaps and squares (L-linear, U-semilinear). S=TQ squares both coordinates. Weil operators are W1=diag(z,s(z)), W2=diag(s(z),z); Q intertwines, T commutes with W2. This explicitly demonstrates the two distinct scalar requirements and rank-one descended eigenvalue; not a substitute for the actual period ring or proof of twist existence. Negative controls omit T or demand ordinary rather than twisted linearity. Counters count loop instances, not independent theorems. OmitTwist counts repeated scalar-loop instances (12 distinct vectors fail; 48 iterations). All code executed in JS, exact integers; reproducible with Node.
Output: {"tensor":64,"relations":64,"scalar":64,"intertwine":48,"eigen":36,"additivity":256,"omitTwist":48,"ordinaryLinear":24,"monodromy":16,"weight":297}.

~~~js
function regression(){
 const ok=(p,m)=>{if(!p)throw Error(m)};
 const mul=(a,b)=>{let z=0;while(b){if(b&1)z^=a;b>>=1;a<<=1;if(a&4)a^=7}return z};
 const sq=a=>mul(a,a), all=[0,1,2,3], nz=[1,2,3], vs=all.flatMap(a=>all.map(b=>[a,b]));
 const eq=(x,y)=>x.every((a,i)=>a===y[i]), add=(x,y)=>x.map((a,i)=>a^y[i]), diag=(a,b,x)=>[mul(a,x[0]),mul(b,x[1])];
 const A=(a,x)=>diag(a,sq(a),x), U=(c,x)=>diag(c,c,x), B=x=>[x[0],sq(x[1])], pi=x=>x[0];
 const Q=x=>[x[1],x[0]], T=x=>[sq(x[1]),sq(x[0])], S=x=>T(Q(x)), W1=(z,x)=>diag(z,sq(z),x),W2=(z,x)=>diag(sq(z),z,x);
 let tensor=0,relations=0,scalar=0,intertwine=0,eigen=0,additivity=0,omitTwist=0,ordinaryLinear=0,monodromy=0,weight=0;
 const rel=new Set();
 for(const x of vs){
  for(const c of all){
   ok(eq(B(A(c,x)),diag(c,c,B(x))),"base change");tensor++;
   const r=add(B(U(c,x)),diag(c,c,B(x)));ok(r[0]===0,"relation");rel.add(r[1]);relations++;
   ok(eq(Q(A(c,x)),A(sq(c),Q(x)))&&eq(Q(U(c,x)),U(c,Q(x))),"dQ");
   ok(eq(T(A(c,x)),A(c,T(x)))&&eq(T(U(c,x)),U(sq(c),T(x))),"twist");
   ok(eq(S(A(c,x)),A(sq(c),S(x)))&&eq(S(U(c,x)),U(sq(c),S(x))),"two scalar laws");scalar++;
   ok(pi(S(x))===sq(pi(x)),"factorization");
   if(pi(Q(x))!==sq(pi(x)))omitTwist++;
   if(sq(mul(c,pi(x)))!==mul(c,sq(pi(x))))ordinaryLinear++;
  }
  for(const y of vs){ok(eq(S(add(x,y)),add(S(x),S(y))),"additive");additivity++}
  ok(eq(Q(Q(x)),x)&&eq(T(T(x)),x),"invertibility");
  for(const z of nz){
   ok(eq(Q(W1(z,x)),W2(z,Q(x)))&&eq(T(W2(z,x)),W2(z,T(x)))&&eq(S(W1(z,x)),W2(z,S(x))),"commuting");intertwine++;
   if(pi(x)){ok(pi(W2(z,S(x)))===mul(sq(z),pi(S(x)))&&pi(S(x))!==0,"conjugate eigenvalue");eigen++}
  }
 }
 ok(rel.size===4,"full relation line");ok(omitTwist>0&&ordinaryLinear>0,"negative controls");
 for(const a of all){let b=a;for(let i=1;i<=4;i++){ok((b===0)===(a===0),"nilpotent rank one");monodromy++;b=mul(b,a)}}
 const pow=(a,n)=>{let z=1;for(let i=0;i<((n%3)+3)%3;i++)z=mul(z,a);return z};
 for(const k of nz)for(const a of nz)for(const d of nz)for(let n=-5;n<=5;n++){const xi=mul(mul(k,pow(a,n)),d);ok(sq(xi)===mul(mul(sq(k),pow(sq(a),n)),sq(d)),"coefficient transport");weight++}
 return {tensor,relations,scalar,intertwine,eigen,additivity,omitTwist,ordinaryLinear,monodromy,weight};
}
console.log(regression());
~~~

RESUME HERE: locate the exact pinned producer of exists_actD_eq_one from the BridgeParam imports, reconstruct its finite-basis/fixing-field argument and quantify the role of finite U-dimension. Then trace MemLoc.frob_laws and EmbOrbit's actual native producer EmbOrbitAlt. Keep LocPrime realization and the later parameter transfer independent. No duplicate of Runs 1–9, no physics changes. HANDOFF TO integration, editor, formal audit, theta, kernel and galois_rows. Project OPEN.


---

## Appendix 98 — preserved peer text, blob 8dda10e43864eedbbd2496bcd5bca02079e695ca

# RUN9 — Read witness from DivDef3: good-subspace span and two guarded properties
2026-11-24. SOURCE-MATCHED conditional reconstruction. No Lean replay, proof-completion or URT speed claim.

## Continuity / selection
Read AGENTS, three swarm protocols, research state/log/protocol, continuity, physical CI summary #377 (not RH), RUN1–8 and recent handoffs from Galois, theta, kernel, acceleration, Landau, prime, literature, geometry, editor, dependencies, integration, math, structure. Audit directory had no readable latest markdown in listing; blueprint not reread. Kernel/acceleration notes describe authenticated solution closure and still-open source mapping; no usable pinned reverse-import index retrieved. Local git ls-remote failed DNS. Scoped IwasawaDecomposition tree 7501f7939fae16a6d24ad8f55ec8c9857c483a4d has 7769 entries, untruncated; candidate files RowIdentificationsRealRowSideOfChainComparison, WeakCompatibilityOfRealRowSideAdelicChain, ConcreteSplitPrimeAutomorphicDataDivisionLattice, AdelicRowsDivisionTransportSpectralStageLattices, RowCompatibilitiesTransportReplacedStages inspected; none identified as initial MjHTie/IdxDefs producer (rows_up_at transports idx via idxDefs_up). Thus select one adjacent nonduplicate bounded task: reconstruct exists_read_of_divDef3 and its proof of ReadingFormsSpanGoodSubspace with guarded RRTie/DcPt. RUN7 cited range lemmas in pairing context, but did not reconstruct this witness and its quantifier order. Do not identify it as a kernel-reachable Main edge absent exporter evidence.

## 1. Source statement and scope
Pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
GlobalTheory.Mem.SJ.exists_read_of_divDef3:
For every D:D7, finite group G, Pl0 I0 T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, n:ℕ, assume A3.fam3.Ok3 n. For every S0:IndefData(A3.side3 F.P0 F.ψ0 (R.toCx3 F).zs), p0:BaseLevelRowSide D, Sp:SPer(F.Dc (R.toCx3 F).zs), C:ColData of that face/Sp/sharp data, NuC family of integral submodules and I:DivisionCompatibilityDataThreeSided for these SAME data, assume DivDef3(...). Then there exists ONE Rd:Read D (R.toCx3 F) F.fc (twAt D.what₂.embLL A3.A.v0) satisfying:
1–4. HEq of wU, eNu, eRR with I's fields; ∀ y, HEq(Rd.jV y, I.jA A3.A.μ0 (rV0(...).mulVec y)).
5. ReadingFormsSpanGoodSubspace; 6. IotaRd F.cr; 7. NuTie.
8. DivRows3(same inputs) → Rd.RRTie F.cr.
9. [∀ u,x,y, σ(Dc.Pt(I.wU u,μ0,x,y)) = perCol(u,I.tup μ0,jN(u,I.eNu u x),I.jA μ0(rV0 y))] → Rd.DcPt.
Here σ=D.what₂.embLL, μ0 on the coordinate side is A3.A.μ0, on the native side D.what₂.mu0; h.tup.mu0 identifies them. Both x and y vary in the number-field coordinate spaces of the source, x's dimension depends on wU u. The same witness is selected before either implication; neither antecedent is asserted to exist. The equality in 9 is the entire all-word/all-coordinate condition, not one sample. hOk.ok2 is passed to range_goodProjector_eq_range_goodCoordinates. Do not replace HEq by homogeneous equality before identifying the types.

## 2. Construct the witness
Apply exists_read_of_matrix_tie with μ=I.tup A3.A.μ0, hμ=h.tup.mu0, hv=h.tup.v0, j=I.jA A3.A.μ0, H=rH, E=rE, V=rV0 at (F.P1,F.ψ1,A3.A.μ0); wU,eNu,eRR copied from I. hF=h.sharp.forms μ0, hE from range_goodProjector_eq_range_goodCoordinates, hι=h.sharp.iota μ0, and ∀u,∃L,HLatTie(...) from h.cols.Nu u. Substitute hμ; define
  Rd.jV(y)=j(Vy).
Semilinearity follows by composition. The five nontrivial input conditions are hμ, hv, FormsTie, range equality, iota and NuTie (six if hμ/hv counted separately); preserve all six. Embedding twist is emb_eq followed by sgAt_mk at hv; do not drop twist even though a coordinate map is complex-linear after extension. The first four HEqs hold by reflexivity after substitution. Native iota equality uses sharp_iota_eq, unfolding RowSide.iota and Rows.Data.iota then PrimeDegreeVariant.sharp_downTo. The two lattice properties differ: NuTie is already supplied for EVERY word; RRTie is conditional. DivRows3.sharpRR gives the needed witness for RRTie; baseRR, thTheta, num, colsBk and rationalLift are not used in this adapter but remain premises of DivRows3. The separate pairing implication DcPt is definitionally the supplied equality after hμ substitution. Neither implication can become unconditional through a choice of Rd.

## 3. Exact span theorem (range, not rational surjectivity)
Let K be the number field, σ:K→ℂ, j:K^n→W σ-semilinear, E:K^n→K^n, V:K^k→K^n, O:W→W complex-linear. FormsTie contains complex linear independence AND full spanning of j(e_i), Hermitian inner equality with H, and O(j(x))=j(E x) for all x. Assume im_K(E)=im_K(V).
Claim: im_ℂ(O)=span_ℂ{j(Vy): y∈K^k}. Proof:
- Since the j(e_i) span W, im O is spanned by O(j(e_i))=j(E e_i). For each i choose y_i with Vy_i=E e_i; each generator is in the asserted span.
- For any y choose x with Ex=Vy. Then j(Vy)=O(j(x)), hence all complex linear combinations belong to im O.
No inverse of V, no invertible E, no pointwise surjectivity K^k→complex W is required. The source uses h.span and h.op_eq; h.li and h.inner remain in FormsTie. In particular the two inclusions do not require injectivity of j, though source has it.

Native range equality is not an assumption invented here: range_lvlOp_idemOf_eq_range_lvlPr_mul_V0E identifies L=lvlE as coordinate image of A=gaMat(lvlIdem), and U=V0E as coordinate image of gaMat(goodAt)=B A, B=gaMat(idemOf X). With P=lvlPr, rE=P B L and rV0=P U. Since im L=im A and im U=im BA, im(PBL)=P B(im L)=P(im BA)=im(PU). Source uses image_idempotent_spec, group_action_matrix_hom and map_comp. No commutation assumption on A,B or cancellation of P. Wrapper accepts A.fam.Ok s (body does not use it), keep it. Apply span lemma to obtain ReadingFormsSpanGoodSubspace = span_ℂ(range Rd.jV)=D.what₂.V0(D.what₂.mu0).
Subsequent Seam.cF is complex linear with cF(e_i)=Rd.jV(e_i), and cF(cpt σ y)=Rd.jV(y) by expanding y in standard basis. Thus every rational reading is in range cF and span is in range cF. This gives GoodPartHasComplexCoordinates (inclusion as stated, not claimed surjection onto W); explicit example at end of GoodPartHasComplexCoordinates.lean proves it. No proof here of arbitrary physical quantities or global character nonvanishing.

## 4. Provenance and checks
All paths under src/, P=Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/, Q=Development/AbelianVarietyTheory/Proofs/DivisorProofs/, A=Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/, F=Formalism/LocalToGlobal/Divisibility/.
Pinned blob hashes and anchors (93 actual connector V8 assertions: seven returned SHA equalities + 86 exact anchor substring matches; not independent hash or elaboration):
- P/ExistsReadOfDivDef3.lean 14dc45102bd1e6326704d40e01541e338882e137; exists_read_of_divDef3, h.tup.mu0, h.tup.v0, hOk.ok2, h.sharp.forms, h.sharp.iota, h.cols.Nu, hR.sharpRR.
- P/ExistsReadOfMatrixTie.lean 06e0eeb0fb01c230a0053d53c9ae4b0948137f8d; sharp_iota_eq, exists_read_of_matrix_tie, subst hμ, jA.comp V.mulVecLin, HEq.rfl, sgAt_mk, range_op_eq_span_of_formsTie.
- Q/RangeGoodProjectorEqRangeGoodCoordinates.lean f734655cc295cc7e026c82f6643f0b13f4c9ddc3; range_lvlOp_idemOf_eq_range_lvlPr_mul_V0E, image_idempotent_spec, group_action_matrix_hom, range_goodProjector_eq_range_goodCoordinates.
- Q/RangeOpEqSpanOfFormsTie.lean 4460b2e7afd75ed7c90d0420da804d338738f26b; range_op_eq_span_of_formsTie, h.span, h.op_eq, both hr directions.
- A/GoodPartHasComplexCoordinates.lean 6d858d982efc6e1296b672e517d5bda782552d14; Read, ReadingFormsSpanGoodSubspace, IotaRd, NuTie, RRTie, DcPt, lin_cpt_semilinear, seam, cF_eq, GoodPartHasComplexCoordinates.
- F/RowSideTie.lean 7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa; FormsTie, TupTie, rE, rV0.
- F/DivisionCompatibleToSub2Indef2.lean 5ed096a646ac2da6e7016b77b9d9fce0602920; DivDef3, DivRows3, DivTied3.ofSplit.
Replay source evidence with git rev-parse PIN:src/PATH and git show PIN:src/PATH, search exact declarations/anchors. Upstream latest observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780, merge #1242. Both ExistsRead files return 404 at old paths; relocation or removal not yet identified. Current remaining blobs: Q range good 765f8f99b35a07d51b455a376b085334ab0708d0, Q range op e65a673a7164ca94dbbaf470c24597ac8908bcb4 (all 9 anchors each retained), A good part c5648fc8a0526bf6541cd6e7314b77768ecabe04 (8/13), F row b53a28bbac7000abed4c18fe791fee739e52bbda (10/10), F division 3a61ce7901cc3488327bc63667a3e490b967395d (9/9). This does NOT establish equivalence at head.

Exact finite explanatory regression executed in connector V8: cases=78125, complex=78125, guards=9, negative=4. Integer matrix calculations, Q(i) components, Boolean implication truth cases. Not a computation of native automorphic objects or a kernel dependency graph. Reproduce in Node:
```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)},eq=(a,b)=>JSON.stringify(a)===JSON.stringify(b);
 const mv=(M,v)=>M.map(r=>r.reduce((s,x,j)=>s+x*v[j],0));
 const mm=(A,B)=>A.map(r=>B[0].map((_,j)=>r.reduce((s,x,k)=>s+x*B[k][j],0)));
 const S=[-2,-1,0,1,2],V=[];for(const x of S)for(const y of S)V.push([x,y]);
 let cases=0,complex=0,guards=0,negative=0;
 for(const a of V)for(const b0 of S)for(const c0 of S)for(const t of S){
  const A=a.map(x=>[x]), E=mm(A,[[1,b0]]), W=mm(A,[[c0,1,2]]);
  const J=[[1,t],[0,1]],Ji=[[1,-t],[0,1]],O=mm(mm(J,E),Ji);
  for(const x of V){
   const z=x[0]+b0*x[1],y=[0,z,0];
   ck(eq(mv(E,x),mv(W,y)),"E->V");
   const q=c0*x[0]+x[1]+2*x[0],u=[q,0],w=[x[0],x[1],x[0]];
   ck(eq(mv(W,w),mv(E,u)),"V->E");
   ck(eq(mv(O,mv(J,x)),mv(J,mv(E,x))),"intertwine");
   ck(eq(mv(O,mv(J,u)),mv(J,mv(W,w))),"reading");cases++;
  }
  for(const [r,s] of V){
   ck(eq(mv(J,mv(W,[0,r,0])),mv(O,mv(J,[r,0])))&&eq(mv(J,mv(W,[0,s,0])),mv(O,mv(J,[s,0]))),"complex components");complex++;
  }
 }
 for(let def=0;def<2;def++)for(let rows=0;rows<2;rows++)for(let pair=0;pair<2;pair++)for(let rr=0;rr<2;rr++)for(let dc=0;dc<2;dc++){
  if(def&&(!rows||rr)&&(!pair||dc)){ck(!rows||rr,"guard RR");ck(!pair||dc,"guard Dc");guards++;}
 }
 ck(!eq(mv([[1,0],[0,1]],[0,1]),mv([[1,0],[0,0]],[0,1])),"nonspanning j omits e2");negative++;
 ck(!eq(mv([[1,0],[0,0]],[1,0]),mv([[0,0],[0,1]],[1,0])),"different ranges");negative++;
 ck(!eq(mv([[0,0],[0,1]],[1,0]),mv([[1,0],[0,0]],[1,0])),"wrong intertwining");negative++;
 ck((!false||false)&&!false,"conditional not unconditional");negative++;
 return {cases,complex,guards,negative}
}
console.log(regress())
```
Guard tests are illustrative truth-table checks, not proof of dependent quantifier validity; that follows from explicit source construction. No original premise removed. No new full-RH closure.
RESUME HERE: use the kernel/dependency lane's authenticated source-linked direct-edge export when available to find the initial actual MjHIds/MjHTie/IdxDefs producer (not the transport); query the precise declarations divisionCompatible_at_readIdentifications and divTied3_read for reverse callers. If still unavailable, trace existence of ReadL from the actual native constructor, distinguishing Pins and Holds from MjHTie. Preserve conditional RRTie and DcPt separately. HANDOFF TO integration, editor, audit, theta, Galois and dependency. Project OPEN; no physics changes.


---

## Appendix 99 — preserved peer text, blob 9a8948bc5769daac64258fe3c432ebed89b9dda4

# Geometry RUN9 — arbitrary-level integral frames and Iwasawa reframing
2026-11-24. SOURCE-MATCHED / local derivation; exact rational regression executed. Project OPEN.

## Continuity
Read AGENTS, RESEARCH_STATE head, RESEARCH_LOG head, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, CI checkpoint 378 (physical orchestrator unrelated to RH), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, geometry RUN5–8, and current handoffs of character boxes, Galois, literature, editor, integration, structure, kernel, Landau, acceleration, prime-window and theta. Other dependency/math/audit directories listed, not all latest bodies reread. No overlapping frame reconstruction found in inspected notes. External blueprint not reopened; proof bodies primary. No physics changes.
RH repository leanprover-community/riemann-hypothesis; pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream head 1da818b50f1e18808db2792b9dc735bda8cb84d8 (2026-11-24 15:42:48Z, batch 6 small PRs). Caller NvalLeOfMul.lean head blob 34a1ee4ef1a9a10cd0a5a4ead4515a39f4007bb7 differs from pin, but the trimmed intAll_all body and statement (617 characters) compare identical. No global migration equivalence.
 
## Source ledger
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FinSmallGen.lean` blob `4d2546abb6eaa7950fcfeb20dd8adca341631fa2`; anchor lines 102.
- `src/Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/NvalLeOfMul.lean` blob `c6b7783c3c1ad3319333be797ab43aca15bd8bbf`; anchor lines 84, 87, 88, 89, 92.
- `src/Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/ExistsPointOfVal.lean` blob `fd82a60e19a3b136aa30dc3f0803670912ec48b3`; anchor lines 6, 7.
- `src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/ModuliPointIntegralFrameAfterFiniteExtension.lean` blob `298cdd04964790141271458fc6ceba40d55430ad`; anchor lines 300, 310, 334, 342.
- `src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/IntegralFrameExtensionOfRankZeroSignature.lean` blob `4f61dbd79337fcfdb4f87ef060e6a4cf16d8e470`; anchor lines 42, 47, 53.
- `src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/IntAll.lean` blob `4ce2f8fdf261d60498aa4c67d3b17fa56cc94084`; anchor lines 27, 27.
- `src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/FrameLawsOfModuli.lean` blob `becdbf32bc9bc13ae29364b153537467657ecced`; anchor lines 27, 33.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/IntAllProof.lean` blob `79ce58f2b234495ed0a560047905fd0f7ec102fa`; anchor lines 65, 73, 220, 234, 251, 253.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/SatLeaves.lean` blob `71878d630587d0804791b91b5632578f8ed7a5b7`; anchor lines 852, 864, 865, 873, 875.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/ExistsOfValILeOne.lean` blob `22e87e13c2d149f494c3dfaac6fd4b829900e7a8`; anchor lines 26, 29, 85, 140, 161, 163.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/IsCombAt.lean` blob `a62154367e2bcd3f268e84669715f9753e326b0f`; anchor lines 79, 87, 89.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/IntAllFree.lean` blob `d76587f73175d29f7ea81d653a3d86ca1af416ed`; anchor lines 14, 17.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/IntAll.lean` blob `64467f9d10006a0fa5cb6520a3fb4a2f422dc380`; anchor lines 12, 15.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/AllTest.lean` blob `e0e5983c72403a6b7743cde2b4527e5a0d2fb70b`; anchor lines 12, 13.
Blob IDs supplied by GitHub and compared against retrieved pinned results; 45 exact text anchors checked. Not a raw-byte hash replay or an elaborated dependency export.

## 1. The actual supplier is NOT the same-named good-level theorem
The exact FinSmallGen line 102 calls intAll_ramified (intAll_all Xo c). The actual supplier is GlobalTheory.CompanionTheory.SmallFin.intAll_all in NvalLeOfMul, lines 84–93, not GlobalTheory.IntegralFrames.intAll in the UnitariyExistence/IntAll module. For any field E with NumberField and IsCMField, host H, datum Dw, level l, moduli Xo and coefficients c, the conclusion is PjFree.IntAll Xo c. The source first obtains AllTest from frame_laws_of_moduli, then constructs IntFrExt by exhaustive Nat.eq_zero_or_pos(Dw.p+Dw.q). Zero invokes RankZeroFrames.intFrExt_of_rank_zero; positive invokes AnyLevelFrame.intFrExt. FrBaseChg follows from FramedBaseChange.exists_frMap using SecBaseChangeSt (lawsFieldsSeparately.2.1). Finally intAll_of_allTest hE hB hA proves the result. The similarly named good-level theorem needs rank >=1 and every prime good; neither is an extra input of the actual arbitrary-level caller. Both Pj.IntAll and PjFree.IntAll definitions have the same displayed quantifier/body; the Lean call uses that conversion. Do not conflate the theorem names.

## 2. Rank dispatch and existence (source-level, named geometric obligations retained)
For each CDVR T with fraction field F, io:c.F→F, finite residue field and a generic point x over c, IntFrExt gives a CDVR T', ring embedding i:F→F', integer r>0, equality v_{T'}(i(a))=r v_T(a) in source vV convention, finite residue, an integral frame y0 with base point spMap i ≫ x. All structure and coefficient embeddings are retained.
- Rank zero (Dw.p+Dw.q=0): exists_model_int constructs the model over Spec Z from isIso_moduli and the zero semiabelian triple; pushInvertible_any uses global section rank and arbitrary section base change. gfp_frPt_gen constructs the identity tangent basis on the original point (empty dimensions allowed). intFr_of_model uses intFrames_of_laws to obtain integral frame y with FrBor to the generated frame. Its base point is preserved; take T'=T, i=id, r=1, original finite-residue evidence. This is not an arbitrary assertion that integral extension is trivial for nonzero rank.
- Positive rank: AnyLevelFrame.intFrExt chooses a good level l2 and raised coefficient c2, a moduli scheme X2, a semiabelian model object and compatible finite field extension L via exists_obj_level; exists_cdvr_finite_extension produces T',i,r,psi, valuation scaling and finite-residue implication. A prime in the maximal ideal of T'.V is obtained from finite residue; its good-level hypothesis enables exists_model_pushInvertible_under_cdvr. The generic point z lifts to the model by extPt. genFibre and thetaCore_of produce the compatible theta sections; sabCancel and three sabComp calls relate the original and model semiabelian maps; the equality psi∘algebraMap=i identifies the base point. exists_intFr supplies the required integral frame. All named moduli existence, proper extension, thetaCore_of and frame-construction suppliers remain obligations; this is a body-level reconstruction of dispatch and assembly, not their independent full proofs.

## 3. Exact Iwasawa step — the frame correction is on the RIGHT
Work over a DVR V, fraction field F, fixed point x and eigenlabel tau. Write the two tangent bases as column lists Y (integral) and Z (transported generic). By their unique eigenbasis properties Z=YA and Y=ZB. Tangent-combination associativity (TanLin) and uniqueness give AB=I, hence det A≠0. For m=Dw.mult tau (possibly zero), the source iwasawa' provides
  A N = k_F,    k in GL_m(V), N in GL_m(F) upper triangular, N_ii≠0.
Here k_F is the entrywise embedding. The orientation matters: the new integral basis is Y k_F=Z N, NOT N A or an arbitrary unit change of the generic basis. The diagonal of N gives the nonzero components t(some(tau,i)); the entries below the diagonal vanish, precisely the FrBor condition.

Proof of the factorization, as in ExistsOfValILeOne. Choose a first-column nonzero pivot with maximal multiplicative valuation (equivalently minimal additive order). All other first-column entries divided by the pivot lie in V by the valuation-ring membership lemma. Swap the pivot into row zero and subtract these integral multiples from lower rows. The combined Q belongs to GL_m(V): permutation determinant ±1 and lower triangular elementary matrix determinant 1. Then B=Q_F A has form [b w; 0 C]; det B=b det C≠0. By induction C=k' U' with k' integral invertible, U' upper triangular with nonzero diagonal; use K=diag(1,k') and U=[b w; 0 U'] to obtain B=K_F U, so A=(Q^{-1}K)_F U. Rank zero uses identity and vacuous triangular conditions. Set N=U^{-1}; triangular inverse has nonzero diagonal and U N=I. This proves A N=k_F for every dimension without assuming every entry of A or N integral.

## 4. Reframe and transport (actual SatLeaves path)
AllTest means every frame over a reduced coefficient algebra comes from a test ring; for a field F' this applies. SatLeaves.intRebase_of uses k with unit determinant to rebase y0, transports determinant to the field, uses integral_reb to preserve the integral frame data, and gen_unit to compare the two generators of the rank-one section module. The latter provides t0 in F'^×; the generator comparison uses the identity map on the common base point. Then reFrame_of combines tangent linearity and this IntRebase to obtain y' with FrBor t z y'.1; t(none)=t0 is the generator factor, not a tangent diagonal. This preserves all components, including the section clause, not just matrix equality.
Given the original la,T,io,e, OverLa, finite residue and arbitrary frame y, intAll_of applies IntFrExt to y.x, then FrBaseChg via i to obtain z, then ReFrame at their common base point. Its output uses io'=i∘io, e'=r e, finite residue and the ring preservation condition. Since r>0 and e>0, OverLa transports (ho.bc); for a∈V, vV(i(a))=r vV(a)≥0 (zero handled by source convention), hence i(a) lies in V' by mem_range_of_vV_nonneg. The result is the complete local existential assembly required by RUN6, including FrMap and FrBor. No equality of actual generic and integral frames before reframing, no finite residue dropped, no added good-level assumption.

## 5. Executed checks
Exact rational DVR examples with V=Z_(p) (not CDVR; tests only the algebraic Iwasawa sublemma) for p=2,3,5: ranks 0–3; exhaustive small 2x2 matrices with varied p-power denominators and deterministic 3x3 samples. Verify A=KU, AN=K, UN=I, integrality and unit determinant of K, triangular/diagonal conditions, singular rejection and noncommuting order negative controls. These do not prove the moduli existence theorems or arbitrary DVR factorization; the proof above is the mathematical argument. Actual JS execution result: {"dimensions":[3,90,4800,900],"negative":834,"entries":27390,"wrongOrder":4922,"total":5793}. Source anchors 45, pinned blob comparisons 14. No Lean kernel execution. No URT benchmark. No original assumptions discarded.
Save this block to run9.mjs and run node run9.mjs:

~~~js
function regression(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 const gcd=(a,b)=>{a=a<0n?-a:a;while(b){let t=a%b;a=b;b=t;}return a<0n?-a:a;};
 const f=(a,b=1n)=>{a=BigInt(a);b=BigInt(b);ck(b!==0n,"denominator");if(b<0n){a=-a;b=-b}let d=gcd(a,b);return [a/d,b/d]};
 const add=(x,y)=>f(x[0]*y[1]+y[0]*x[1],x[1]*y[1]), neg=x=>f(-x[0],x[1]), mul=(x,y)=>f(x[0]*y[0],x[1]*y[1]), div=(x,y)=>f(x[0]*y[1],x[1]*y[0]);
 const zero=x=>x[0]===0n,eq=(x,y)=>x[0]===y[0]&&x[1]===y[1];
 const vp=(x,p)=>{if(zero(x))return Infinity;let v=a=>{let z=0;while(a%p===0n){a/=p;z++}return z};return v(x[0])-v(x[1])};
 const eye=n=>Array.from({length:n},(_,i)=>Array.from({length:n},(_,j)=>f(i===j?1:0)));
 const mm=(A,B)=>A.map(row=>row.map((_,j)=>row.reduce((s,x,k)=>add(s,mul(x,B[k][j])),f(0))));
 const same=(A,B)=>A.every((r,i)=>r.every((x,j)=>eq(x,B[i][j])));
 function det(A){let n=A.length;if(!n)return f(1);return A[0].reduce((s,x,j)=>add(s,mul(j%2?neg(x):x,det(A.slice(1).map(r=>r.filter((_,k)=>j!==k))))),f(0))}
 function dec(A,p){let n=A.length,U=A.map(r=>r.slice()),K=eye(n);
  for(let j=0;j<n;j++){
   let pivot=j;for(let i=j+1;i<n;i++)if(vp(U[i][j],p)<vp(U[pivot][j],p))pivot=i;
   if(zero(U[pivot][j]))throw Error("singular");
   [U[j],U[pivot]]=[U[pivot],U[j]];
   for(let i=0;i<n;i++) [K[i][j],K[i][pivot]]=[K[i][pivot],K[i][j]];
   for(let i=j+1;i<n;i++){let c=div(U[i][j],U[j][j]);ck(vp(c,p)>=0,"pivot integrality");
    U[i]=U[i].map((x,k)=>add(x,neg(mul(c,U[j][k]))));
    for(let k=0;k<n;k++)K[k][j]=add(K[k][j],mul(c,K[k][i]));
   }
  }
  let N=eye(n);
  for(let col=0;col<n;col++)for(let i=n-1;i>=0;i--){let s=f(i===col?1:0);for(let j=i+1;j<n;j++)s=add(s,neg(mul(U[i][j],N[j][col])));N[i][col]=div(s,U[i][i])}
  return {K,U,N}
 }
 let dimensions=[0,0,0,0],negative=0,entries=0,wrongOrder=0;
 function test(A,p){let d=det(A);if(zero(d)){let failed=false;try{dec(A,p)}catch(e){failed=e.message==="singular"}ck(failed,"singular control");negative++;return}
 let {K,U,N}=dec(A,p),n=A.length;ck(same(mm(K,U),A),"A=KU");ck(same(mm(A,N),K),"AN=K");ck(same(mm(U,N),eye(n)),"inverse");ck(vp(det(K),p)===0,"unit det");
 for(let i=0;i<n;i++)for(let j=0;j<n;j++){ck(vp(K[i][j],p)>=0,"K integral");if(i>j)ck(zero(U[i][j])&&zero(N[i][j]),"upper");if(i===j)ck(!zero(N[i][j]),"nonzero diag");entries++}
 if(!same(mm(N,A),K))wrongOrder++;dimensions[n]++;
 }
 for(const p of [2n,3n,5n]){test([],p);for(let a=-5;a<=5;a++)for(let s=0;s<=2;s++)test([[f(a,p**BigInt(s))]],p);
 for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let c=-2;c<=2;c++)for(let d=-2;d<=2;d++)for(let s=0;s<=2;s++)test([[f(a,p**BigInt(s)),f(b,p)],[f(c),f(d,p**BigInt(2-s))]],p);
 for(let t=0;t<300;t++){let A=Array.from({length:3},(_,i)=>Array.from({length:3},(_,j)=>f(((t+3)*(i+2)*(j+7)+t*t*(i+1)+i*i+3*j*j+i*j*t)%17-8,p**BigInt((t+i+2*j)%3))));test(A,p)}
 }
 ck(wrongOrder>0,"order negative control");return {dimensions,negative,entries,wrongOrder,total:dimensions.reduce((a,b)=>a+b,0)};
}
console.log(regression());
~~~

RESUME HERE: reconstruct the pinned archimedean supplier local_unit_map_surjective used by WeilHeightArchimedeanContribution (RUN5 source ledger), specifically its exact coefficient-field embedding, local unit surjection and holomorphic cusp-form matching, then norm_small_le with all unfolded-domain hypotheses. Deeper moduli existence/section suppliers from the positive rank branch remain open and can be assigned by the integration/dependency lane; do not repeat Iwasawa. HANDOFF TO literature, integration, editor, audit, geometry. Project OPEN.


---

## Appendix 100 — preserved peer text, blob 894eb9f7d40a6657d86600846e40a2ea6278a61d

# RUN9 — Four served-prime counting bounds (2026-11-24)

Status SOURCE-MATCHED conditional human reconstruction + executed exact regression in V8. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. No Lean replay, no claim of full RH translation or kernel reachability or URT improvement.

Preflight: AGENTS, research state/log/protocol and continuity excerpts, CI summary 15:09:27 UTC general Cathedral PASS (not RH validation); swarm protocol, queue, expansion, RUN8 and peer handoffs (character boxes, Galois, kernel, Landau, literature, acceleration, geometry, editor, theta, integration, math, structure, dependency). Blueprint referenced in queue, not reread in this run; audit lane latest explicit RESUME not located. No changes to Cathedral queue. RUN8 derived size envelopes, not the counting lemmas. This run completes that nonduplicate frontier.

## 1. Exact quantified statements

All four assertions universally quantify the stated real parameters, natural p0 where used, finite set s of naturals, and real function L1 on naturals where used, BEFORE imposing the listed hypotheses. All four are finite sums, not asymptotic estimates. Use X2 for X'', X1 for X', and M for mT.

Definitions, SecondKindBucket.lean 146–154:
- flF(p)=C f [N² log(a)/log(p)+(log(a)/log(p))²].
- cpF(p)=C Sk log(2a)/log(p).
- prF(p)=Q1 if p<p0, Q2 otherwise.
- orF(p)=C lx [La a/(pk)+ (a p^(-L1(p)) if p<p0, a/p² otherwise)].
The displayed logarithm quotients are used only when p>=2. The native definitions use Real.logb and real rpow, not integer powers for L1.

FloorBucket (156–160): C,f>=0, a>=1, every p in s >=2, |s|<=X2. N is an arbitrary real, not necessarily nonnegative. Then sum_s 2 log(p) flF(p) <= 2 C f X2 [N² log(a)+2 log(a)²].
CpBucket (162–165): C,Sk,M>=0, a>=1/2, every p in s >=2, |s|<=X2. Then sum_s 2 log(p) M cpF(p) <= 2 C Sk log(2a) M X2.
PrBucket (167–170): X1,Q1,Q2>=0, every p in s prime and p<X1. p0 arbitrary natural (including zero). Then sum_s 2 log(p) prF(p) <= 2 log(4) [p0 Q1 + X1 Q2].
OrBucket (172–178): C,lx,La,a>=0, k,K0>0, X1>=1, p0>=3, every p in s prime with p<X1, and for EVERY p in s with p<p0, K0<=p^(L1(p)-1). Then sum_s 2 log(p) orF(p) <= 2 C lx a [(La/k+1/K0)(log X1+log 4)+2(log(p0-1)+1)/(p0-1)].
No assumption removed; primality is NOT required by the first two statements; p=X1 excluded in the last two, p=p0 belongs to upper branch. Empty sets and zero coefficients allowed.

## 2. The four proofs

Floor: since log(p)>=log 2>1/2 (integrate 1/t on [1,2]), 1/log(p)<=2. Exact per-p cancellation leaves 2Cf[N² log a+(log a)²/log p]. Replace inverse log by 2, since Cf>=0 and (log a)²>=0. Sum over s, replace card by X2 because N² log a+2(log a)²>=0. Source floor_bucket_bound 483–510. This is called a floor bucket but the proof bounds a logb expression, not a separate rounding theorem.

Cp: per-p exact identity 2 log p M cpF(p)=2 C Sk M log(2a). Nonnegative since 2a>=1. Multiply by |s|<=X2. Source cp_bucket_bound 512–528.

Pr: define s_low={p in s:p<p0}. The original proof uses the inequality
sum_s log(p) prF(p) <= Q1 sum_s_low log(p)+Q2 sum_s log(p).
This deliberately adds the nonnegative Q2 part on low primes. Use ThetaFin at p0 on s_low and at X1 on s. Multiplying by 2 gives the exact result, without assuming Q1<=Q2 or p0<=X1. Source pr_bucket_bound 530–549.

Or: p>0, so the low-order premise implies K0*p<=p^L1(p). Taking reciprocals (K0,p positive), p^(-L1(p))<=1/(K0*p). Upper branch is exactly 1/p². Factor out 2 C lx a, nonnegative; DO NOT divide by it as it may be zero. Bound by
2 C lx a [(La/k) sum_s log(p)/p +(1/K0) sum_s_low log(p)/p + sum_(s\s_low) log(p)/p²].
The two log/p sums are bounded by PrimeLogSum at X1 (not p0); the tail by TailSq at p0. Source or_bucket_bound 551–600. Strict low branch and non-strict high branch partition s.

## 3. Derive the three elementary prime-sum inputs

ThetaFin (SecondKindBucket 86–88, AdmissibleSchurLemma 155–164): for any Y>=0 and finite s of primes <=Y, s subset primesLE floor(Y); positivity of logs bounds subset by full sum, equal to Chebyshev.theta(floor Y). Imported Chebyshev.theta_le_log4_mul_x yields <=log4 floor(Y)<=log4 Y. The imported Chebyshev estimate is retained, not proved in this lane.

PrimeLogSum (SecondKindBucket 82–84, AdmissibleSchurLemma 141–153): Y>=1, s finite primes <=Y, n=floor Y>=1. For each p<=n, floor(n/p)<=v_p(n!) by the first term of Legendre's formula. Distinct prime powers coprime, hence product p^floor(n/p) divides n!. Take logs to get sum floor(n/p) log p<=log(n!)<=n log n. Imported primorial_le_4_pow yields sum log p<=n log4. Since n/p<=floor(n/p)+1, sum n log(p)/p<=log(n!)+n log4<=n(log n+log4). Divide by n>0. Then restrict to s and use log n<=log Y. Source PrimeSum.lean div_le_factorization_factorial 10–20, sum_div_mul_log_le_log_factorial 22–61, log_factorial_le 63–69, sum_primesLE_log_div_le 71–116. This is an elementary factorial estimate, not the prime number theorem or RH.

TailSq (SecondKindBucket 90–93, AdmissibleSchurLemma 166–240): any natural p0>=3 and finite s of NATURALS n>=p0 (not necessarily prime). g(y)=(log y+1)/y. For real y>=3, D=log y-log(y-1)<=1/(y-1) from log t<=t-1. Thus yD<=3/2 and L=log y>=1. Exact identity g(y-1)-g(y)=(L+1-yD)/(y(y-1))>=L/[2y(y-1)]. Hence log y/y²<=2(g(y-1)-g(y)). Telescope over consecutive n=p0,...,p0+K-1; discard nonnegative g(p0+K-1) and enlarge any finite subset to such an interval (all terms nonnegative). Result <=2 g(p0-1). The source uses this factor 2. A simpler optional HUMAN-ONLY strengthening follows from monotonicity of f(t)=log t/t² on t>=2 (f'=(1-2log t)/t³<=0): sum_{n>=p0} f(n) <= integral_{p0-1}^infinity f(t)dt = g(p0-1). This factor-1 bound is not substituted for the pinned Lean conclusion; no proof-term equivalence claim.

## 4. Exact caller and remaining hypotheses

SecondKindLoss (SecondKindBucket 261–293) universally quantifies types iota,kappa,tau; finite W, Ps, J, TT; below,l, cl, TTp; Iex, at_,wz,Id,wd,d; gainW,tauW,gain,tau,lo,fl; real parameters a,th,w'',X'',X',C,f,N,Sk,Q1,Q2,lx,La,k,K0; L1 and p0. It assumes:
(i) UnitRule (24–28) with exact fibres, gains and tau on Ps and zero gains/tau off Ps; every p in Ps prime.
(ii) w''>0, 0<=th<=1/2, X''>=2, X''w''=a, a>=1, X'>=1, p0>=3, d>=4; C,f,Sk,Q1,Q2,lx,La>=0, k,K0>0.
(iii) for every t in TT, 0<=at_t<=a(1+th); for every j in J,t in TT,p in Ps,i in Iex(j,t,p), i odd and wz>=w''; for every j,t,i in Id(j,t), i>=1 and wd>=0.
(iv) for each p in Ps, served implies p<=X'', high implies X''<p; served implies SizeData2 (TTp subset TT and retained-ledger inequality, lines 45–48), nonserved implies every gain and tau zero.
(v) served implies fl<=flF, lo<=loF; each p in Ps below p0 satisfies K0<=p^(L1(p)-1). loF=cpF+indicator(p<X')(prF+orF) (258–259).
All hypotheses retained. ASK minus GaW <= floor term + cp term + pr term + order term + missing tops term + first-class term + second-class term + high term + d term, exactly as 283–293. The raw first/second terms are 4 m T a times the respective sum log p/p. Missing tops term is sum_served 4 m a log(p)/p |TT\TTp|. High term=mT*2log(2X'')(a th²+w'' th); d term=mT*2a log d/d.

In loss_bound 762–918, write S={p in Ps:cl p=served}, S'={p in S:p<X'}. The first two bounds use S and the last two use S'. IntervalCount 340–355 (empty set or min/max integer interval) gives |S|<=X''-2+1<=X''. For lo replacement, first use lo<=loF, then |TTp|<=T and loF>=0. No positivity assumption on lo itself is needed. Multiply floor by m=|J|, cp already contains M=mT, prime and order by mT. Source hServ/hS1/hcardS/hCp/hFl/hPrB/hOrB at 813–914. No need for T>=1 at this counting layer; that is used later by RUN8's size envelope. This proves the served portion of the nine-term inequality conditional on native hfl,hlo,hL; it does not establish those three premises for the host.

## 5. Source provenance and upstream drift

Repository leanprover-community/riemann-hypothesis, pinned revision above, source links prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ .
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/AdmissibleSchurLemma.lean blob 91c8966257416ce67a92357ff67f1ded82bba9c9. Namespace Formalism.LFunctionChainParameters.DeficitSplitLemmas; lines as above.
- src/Formalism/SizeWindowBrackets/SecondKindBucket.lean blob 502d2a6bf146f38b4c51ed87db9cf1ffbc9d7db8.
- src/Formalism/LogFactorialBounds/LogFactorialProofs/PrimeSum.lean blob 7088404e0bbc960487bf76f19264941245f88aac.
Latest upstream observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780 (2026-11-24 15:13:54 UTC, CI merge #1242). All three blobs changed: respectively 7a39bb9f1fb5195e32a23cd22ec2085b2db9b416, dd75da148c717f5d531d39fb3875f719efff4cb4, d9f43590bdb0736ccf9363d5bd39db1a817301. Direct source slice comparison: four theorem blocks old 483–511,512–529,530–550,551–601 equal byte-for-byte in fetched text to new 964–992,993–1010,1011–1031,1032–1082 respectively; old tail_step 168–197 equals new 641–670; four predicate blocks old 156–179 equal new 188–211. PrimeSum 71–116 vs 87–132 not identical. This is local source-text stability only, NOT dependency or kernel equivalence; pin unchanged.

## 6. Reproducible regression

Copy the following into run9.cjs and run node run9.cjs. Executed in V8 in this session. Log bounds use exact BigInt fixed-point intervals: log n=k log 2+2 atanh((n-2^k)/(n+2^k)), the ratio is in [0,1/3]; 32 positive series terms rounded outward and remainder bounded by geometric majorant. Divisions round outward. The factorial and primorial tests are exact integers; floor/cp tests also use exact rational proxy identities. Prime and order tests use actual finite prime sets, integer L1 as a sample of the real-exponent statement, not native geometry. Four negative controls check removed guards/branches, not counterexamples to Lean. No assertion of universal proof from finite tests.

```js
function regression(){
 const S=10n**30n,M=32,cache=new Map(),counts={factorial_divisibility:0,primorial_and_factorial:0,mertens:0,chebyshev:0,tail:0,floor_cp:0,prime_bucket:0,order_bucket:0,negative:0};
 const ck=(v,k)=>{if(!v)throw Error(k+" #"+counts[k]);counts[k]++};
 const ceil=(a,b)=>(a+b-1n)/b;
 // rigorous fixed-point enclosure of 2 atanh(u/v), 0<=u/v<=1/3.
 function series(u,v){let lo=0n,hi=0n;if(!u)return [0n,0n];for(let j=0;j<M;j++){let r=BigInt(2*j+1),a=2n*S*u**r,b=r*v**r;lo+=a/b;hi+=ceil(a,b)}let r=BigInt(2*M+1);hi+=ceil(2n*S*u**r*v*v,r*v**r*(v*v-u*u));return [lo,hi]}
 const L2=series(1n,3n);
 function L(n){if(cache.has(n))return cache.get(n);if(n<1)throw Error("log domain");let N=BigInt(n),b=1n,k=0n;while(2n*b<=N){b*=2n;k++}let [l,h]=series(N-b,N+b);let t=[l+k*L2[0],h+k*L2[1]];cache.set(n,t);return t}
 const primes=[];for(let n=2;n<=200;n++){if(primes.every(p=>p*p>n||n%p!==0))primes.push(n)}
 let fact=1n;
 for(let n=1;n<=160;n++){let N=BigInt(n);fact*=N;let pp=1n,prod=1n;for(const p of primes.filter(p=>p<=n)){let P=BigInt(p);pp*=P;let q=P**(N/P);ck(fact%q===0n,"factorial_divisibility");prod*=q}ck(fact%prod===0n,"primorial_and_factorial");ck(pp<=4n**N,"primorial_and_factorial");ck(fact<=N**N,"primorial_and_factorial");
 for(const ps of [primes.filter(p=>p<=n),primes.filter((p,i)=>p<=n&&i%2===0),[]]){let sum=ps.reduce((a,p)=>a+ceil(L(p)[1],BigInt(p)),0n);ck(sum<=L(n)[0]+L(4)[0],"mertens");let th=ps.reduce((a,p)=>a+L(p)[1],0n);ck(th<=N*L(4)[0],"chebyshev")}}
 for(let y=3;y<=200;y++){let Y=BigInt(y),a=L(y-1),b=L(y);let diff=(a[0]+S)/(Y-1n)-ceil(b[1]+S,Y);ck(ceil(b[1],Y*Y)<=2n*diff,"tail");
 // test stronger integral bound on an integer subset of [y,200].
 let sum=0n;for(let n=y;n<=200;n+=3)sum+=ceil(L(n)[1],BigInt(n)**2n);ck(sum<=(a[0]+S)/(Y-1n),"tail")}
 for(let p=2;p<=60;p++){ck(2n*L(p)[0]>=S,"floor_cp");for(let l=1n;l<=8n;l++)for(let d=1n;d<=6n;d++){
 // exact rational proxy log a=l/d, log p=u/v with u/v>=1/2.
 let u=BigInt(p),v=2n*u-1n;ck(l*l*v<=2n*l*l*u,"floor_cp");
 // cp identity: log p * logb(p,a) = log a after clearing denominators.
 let num=u*l*v,den=v*d*u;ck(num*d===l*den,"floor_cp")}}
 for(let X=1;X<=65;X+=4)for(let p0=0;p0<=15;p0++)for(let q1=0;q1<=3;q1++)for(let q2=0;q2<=3;q2++){
 let ps=primes.filter(p=>p<X);let left=ps.reduce((s,p)=>s+BigInt(p<p0?q1:q2)*L(p)[1],0n);
 ck(left<=L(4)[0]*BigInt(p0*q1+X*q2),"prime_bucket")}
 for(let X=3;X<=60;X+=3)for(let p0=3;p0<=14;p0++)for(let K0=2;K0<=5;K0++)for(let k=2;k<=4;k++)for(let La=1;La<=3;La++){
 let left=0n;for(const p of primes.filter(p=>p<X)){let P=BigInt(p),ell=1n;if(p<p0){while(P**(ell-1n)<BigInt(K0))ell++}else ell=2n;
 left+=ceil(BigInt(La)*L(p)[1],P*BigInt(k))+ceil(L(p)[1],P**ell)}
 let ll=L(X)[0]+L(4)[0],right=(BigInt(La)*ll)/BigInt(k)+ll/BigInt(K0)+2n*(L(p0-1)[0]+S)/BigInt(p0-1);
 ck(left<=right,"order_bucket")}
 // Failure controls for removed hypotheses.
 ck(3n*2n>2n*2n,"negative"); // cp count 3 with bound X''=2, positive common coefficient
 ck(3n>2n**0n,"negative"); // order reciprocal guard fails for p=2,L1=1,K0=3
 let lo=0n;for(let n=2;n<=100;n++)lo+=L(n)[0];ck(lo>100n*L(4)[1],"negative"); // theta fails for all integers
 ck(2n*L(2)[0]>0n,"negative"); // p=p0=2 must use Q2, not Q1=0
 return counts;
}
console.log(JSON.stringify(regression()));
```

Actual output: {"factorial_divisibility":3373,"primorial_and_factorial":480,"mertens":480,"chebyshev":480,"tail":396,"floor_cp":5723,"prime_bucket":4352,"order_bucket":8640,"negative":4}. All assertions succeeded. No Lean run. No URT speed benchmark.

## RESUME HERE
Next source-linked task: identify the actual producer of the low-prime order guard hL (K0<=p^(L1(p)-1)) and native hlo/hfl bounds in the host-to-SecondKindLoss adapter, using the pinned reverse-import map if available. Begin with the caller found in RUN7 and the definitions of native L1, lo and fl; do not infer from names. Independent audit requested: verify the four quantified statements and factors, especially p=p0, distinction S versus S', nonnegative loF rather than lo, and the optional stronger tail estimate being separate from the original source. HANDOFF TO math, geometry, editor, integration, dependency and formal audit. Project OPEN.


---

## Appendix 101 — preserved peer text, blob a4cac1cb1712769a3b7fe5d3a5ccf517722364e8

# Theta lifts RUN9 — exact half-step spectral shift and restriction of the first Eisenstein coefficient

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of AStep.cOneVal_pf and its native COne.fcVal/hv_shift dependencies. Full RH proof OPEN; no Lean kernel replay, no URT speed claim.

## Continuity and provenance

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state excerpts, continuity, research protocol/log, current CI summary (physical checkpoint #377; unrelated to RH), RUN8, and peer handoffs (integration, math, Galois, character boxes, Landau, kernel, prime window, literature, acceleration, geometry, editor). Prior theta RUN8 derived incompatible dilation laws; the missing lower-rank value is this run's unique task. Peer handoffs inspected via recent compare and individual fetches; not all historic files or linked external blueprint reread. The prior kernel lane's explicit-export closure result is not a new kernel replay here. Original upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; HEAD observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780 (2026-11-24); path check only, not semantic equivalence: [{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/SectionEqThetaZero.lean","old":"8c2954a4ed5807b833067ea5a53f5e6ff4a5b171","current":"550f3b0b9839149a4275f2fc8a12724b5b209dc4"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/DegCut.lean","old":"1079d74072e904d278cba232030edc7bee2c9e2a","current":null,"error":"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repository-content\",\"status\":\"404\"}"},{"path":"src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/LowerRankDatum.lean","old":"1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b","current":"50a6dbbb774c444de5da6b5e7900d599c6e7c4bb"}]. Keep original pin.

## 1. Native theorem and exact scope

SectionEqThetaZero.lean lines 113–182 proves cOneVal_pf; DegCut.lean cOneVal calls it verbatim. All fields/types of SD, RD, LD, Hyps (25 fields), both CoefData records, the two Fourier indices T,T', L.IsSub T T', arbitrary x, Schwartz hPhi, vacuum hv and hIH: MainV 2 R' retained. In the section hmn and hE are declared but not used by this lemma: do not add a strict rank condition or larger-rank EData to its standalone statement. The enclosing rank step does use them. Seven explicit H fields in the proof and its fcVal helper: iwaQ, vacK, thetaCoef, orbRes, polyKFin, secK, eisWk. All other packaged premises remain available to callers. No assertion of their independent truth.

Write n=d.n, n'=L.n, m=d.m, s=(m-n)/2, s'=(m-n')/2, j=L.j. Let FC_T and FC'_T' denote original normalized Fourier integrals with the same additive character d.B.psi but their own frames, measures and fundamental domains. cOne (FourierZero.lean) is FC'_T' of the lower-rank coset sum formed from the restricted higher-rank section and height, evaluated at identity, not at x or g0. Claim: its HolValueAt at s is 2 FC_T(I_Phi)(x).

## 2. Restrict the Schwartz vector after Iwasawa factorization

IwaQ gives q,g0,k,r,c with k in K, x=q j(g0) k, r>0 and a(j(g')x)=r a'(g'g0) for EVERY g'. Its other condition is the equality on all matrices X whose removed column i0 is zero:
T_d(om(j(g')q) Psi)(X)=c T_d(om(j(g')) Psi)(X)
for every Schwartz Psi and g'. The scalar c is complex; the source does NOT require c != 0. No division by c is valid or needed.

Schwartz stability (om_sch) and the first VacK field imply Phi_k=om(k)Phi is Schwartz and vacuum. The last VacK field constructs Phi' with lower vacuum and IsRes(Phi_k,Phi'): Schwartz and T'(Phi')(X|em)=T_d(Phi_k)(X) on zero-column matrices. LD.res upgrades this to equivariant restriction for every g. At X=0, submatrix_zero gives T'(om'(g)Phi')(0)=T_d(om(j(g))Phi_k)(0).

COne.T_zero uses d.ok.dbl.kill at zero and zero matrix multiplication to identify T_d(Psi)(0)=d.l(Psi); section_eq_theta_zero then says sec0(Phi)(x)=T_d(om(x)Phi)(0). Combine the group homomorphism law, IwaQ with Psi=om(j(g0))Phi_k, and equivariant restriction at zero. For every lower group element g':
sec0_d(Phi)(j(g')x) = c sec0_L(Phi')(g'g0).
This is hf, lines 128–136. It is not an asserted equality of all unrestricted Weil vectors.

## 3. Spectral shift and coset sum

COne.Ln proves n'+1=n, not a separate premise: em injectively enumerates the complement of i0, so Fin n' is equivalent to that complement and has cardinality n-1. Hence s'=s+1/2 and (z+1/2)-s'=z-s, for all complex z. This exact half-step is essential, including n'=0 if allowed by the inherited data.

Heights are a.toNNReal, not assumed arbitrary complex powers. Because r>0, max(ra,0)=r max(a,0) for all real a. The source ht_cpow factors Ht(j(g')x)^(z-s) into r^(z-s) Ht'(g'g0)^((z+1/2)-s') using the nonnegative-real complex-power product rule; it does not use a false general complex-power product rule. Together with hf this gives equality of each restricted section term with c r^(z-s) times its lower-rank translated counterpart. COne.cosetSum_factor transports the identity over the actual coset sum by associativity and tsum_mul_left; then linearity of the Fourier set integral moves the same scalar outside. The native hid is therefore
cOne(z,x)= c r^(z-s) FC'_T'(E'_Phi'(z+1/2))(g0).
Here g0 comes from IwaQ; evaluation at the identity in the original cOne is the reason it becomes g0 on the right. Both sides retain the same lower Fourier character factor. This is a pointwise equality of the defined functions; convergence of the raw series at the special point is not asserted.

## 4. Carry the lower-rank special value through the Fourier functional

hIH (MainV 2 R') is a pointwise HolValueAt for every admissible vacuum Phi' and every group point, not yet a coefficient theorem. COne.fcVal converts it into a coefficient HolValueAt.

Use vacK's vacuum inclusion in the Fock submodule, polyKFin and secK to get a valid section. EisWk gives U,p,Ehat,t: U open right-domain containing s', p nonzero, spectral holomorphy and joint continuity, left rational invariance, compact uniform summable majorants and Ehat=p E' on the far-right region. Let k0=rootMultiplicity_s'(p).

FcCont.fcAll proves the Fourier functional is complex-linear on continuous left-rational-invariant functions and bounded by a compact sup norm. Its proof uses additive rational cocompactness to choose compact representatives; the character has absolute value one and is continuous; the finite measure of the fundamental domain is exactly one. This is why the bound has coefficient one, not an untracked Haar volume. Integrability follows by the compact bound and finite measure. DerivInv.lamDeriv applies the native holomorphic functional derivative statement, giving holomorphy and commutation of all iterated derivatives at s'. This is not an interchange based merely on pointwise convergence.

For each group point y and 0<=i<=k0, ordVal applied to hIH gives Ehat^(i)(s',y)=p^(i)(s')*2 I'_Phi'(y). Apply the Fourier functional, commuting derivatives and scalars, to obtain identical equalities for regularized coefficient derivatives. Below k0 these derivatives vanish by pderiv_lt; at k0 their value is p^(k0)(s')*2 FC'_T'(I'_Phi')(g0). wrap removes the common root factor locally and proves the required coefficient HolValueAt, including k0=0. This proves fcVal conditionally, not the source of hIH.

COne.hv_shift now composes the holomorphic representative with z->z+1/2 and multiplies by c r^(z-s). r>0 gives an entire multiplier with value c at z=s; the source uses positive-real slit-plane membership, meromorphic extension composition and product. Thus cOne has HolValueAt at s with value 2 c FC'_T'(I'_Phi')(g0). This works even if c=0.

## 5. Exact original theta coefficient

It remains to identify this value without introducing an extra volume or character. H.thetaCoef on the two models writes FC_T(I_Phi)(x)=orb_d(T,om(x)Phi) and FC'_T'(I'_Phi')(g0)=orb_L(T',om'(g0)Phi'). The IsSub guard means T has zero removed row and column and T' is its submatrix. H.orbRes (second field) applies to these orbit sums provided the correct restriction is shown. Set Psi=om(x)Phi and Psi'=c • om'(g0)Phi'. The lower vector is Schwartz by om_sch and submodule scalar closure. On each zero-column X, LD.res at g0 yields T'(om'(g0)Phi')(X|em)=T_d(om(j(g0))Phi_k)(X). IwaQ at g'=1 (not g0) for Psi0=om(j(g0))Phi_k yields T_d(om(q)Psi0)(X)=c T_d(Psi0)(X). T_smul and hx imply IsRes(Psi,Psi'). Thus orbRes gives equality of higher orbit sum and lower orbit sum at Psi'. COne.orb_smul extracts c from the actual normalized orbit average and infinite sum; no new measure identification is assumed outside OrbRes. Consequently
FC_T(I_Phi)(x)=c FC'_T'(I'_Phi')(g0).
Substitute in the value from section 4, proving HolValueAt(cOne(.,x),s,2 FC_T(I_Phi)(x)). The factor 2 comes solely from hIH, not from deleting a row, from Iwasawa normalization, or from a fitted constant.

## 6. Proof obligations and provenance

Native local source-body edges: cOneVal -> cOneVal_pf -> om_sch, section_eq_theta_zero -> T_zero, Ln, ht_cpow, cosetSum_factor, fcVal -> fcAll, lamDeriv, ordVal, wrap, hv_shift, orb_smul -> T_smul; projected hypotheses as above. No new independent publication theorem asserted: elementary linearity, finite-measure bounds, cardinality, holomorphic continuation and scalar-factor arguments are standard; actual local Iwasawa, restriction, theta coefficient/orbit and rank-induction inputs are explicit source premises. Locate their native producers separately, not label as proved by citation. This advances RUN8's lawSep input with all scope retained. No theorem-only or elaborated dependency closure measured here.

## 7. Executed reproducibility check

7 exact Git blob IDs matched against prior pinned observations, 84 source anchors found by fail-on-missing checks in connector JS. Current path checks recorded above. This is an actual static source check; no synthetic numerical model and no Lean build. Reproduce on a pinned upstream git checkout: save the JSON below as run9_sources.json and execute:

```python
import json,subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
rows=json.load(open("run9_sources.json"))
n=0
for r in rows:
    b=subprocess.check_output(["git","show",pin+":"+r["path"]])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=b).decode().strip()==r["sha"]
    lines=b.decode().splitlines()
    for i,a in r["anchors"]:
        assert a in lines[i-1],(r["path"],i,a)
        n+=1
print(len(rows),"blob IDs;",n,"source anchors")
```

```json
[
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/SectionEqThetaZero.lean",
    "sha": "8c2954a4ed5807b833067ea5a53f5e6ff4a5b171",
    "anchors": [
      [
        15,
        "theorem om_sch"
      ],
      [
        18,
        "theorem T_zero"
      ],
      [
        27,
        "theorem section_eq_theta_zero"
      ],
      [
        30,
        "theorem T_smul"
      ],
      [
        36,
        "theorem orb_smul"
      ],
      [
        42,
        "theorem Ln"
      ],
      [
        44,
        "Equiv.ofInjective L.em L.inj"
      ],
      [
        50,
        "theorem cosetSum_factor"
      ],
      [
        56,
        "theorem ht_cpow"
      ],
      [
        61,
        "theorem hv_shift"
      ],
      [
        66,
        "Complex.ofReal_mem_slitPlane.2 hr"
      ],
      [
        73,
        "theorem fcVal"
      ],
      [
        78,
        "H.polyKFin"
      ],
      [
        79,
        "H.secK"
      ],
      [
        80,
        "H.eisWk"
      ],
      [
        82,
        "fcAll d' hc T g"
      ],
      [
        83,
        "lamDeriv"
      ],
      [
        86,
        "ordVal U p"
      ],
      [
        87,
        "hMV Ψ hΨ hv g'"
      ],
      [
        95,
        "rw [hComm _ hs i]"
      ],
      [
        100,
        "refine wrap"
      ],
      [
        103,
        "pderiv_lt"
      ],
      [
        115,
        "theorem cOneVal_pf"
      ],
      [
        119,
        "H.iwaQ"
      ],
      [
        120,
        "COne.om_sch d k hΦ"
      ],
      [
        121,
        "(H.vacK F E σ d R).1"
      ],
      [
        122,
        "(H.vacK F E σ d R).2.2"
      ],
      [
        126,
        "L.res _ hΦk"
      ],
      [
        127,
        "Matrix.submatrix_zero"
      ],
      [
        128,
        "have hf"
      ],
      [
        134,
        "hTq _ hΨ g' 0"
      ],
      [
        137,
        "have hs'"
      ],
      [
        138,
        "COne.Ln L"
      ],
      [
        139,
        "have hid"
      ],
      [
        142,
        "have ex : z + 1 / 2"
      ],
      [
        150,
        "COne.ht_cpow"
      ],
      [
        156,
        "COne.cosetSum_factor"
      ],
      [
        157,
        "unfold cOne"
      ],
      [
        40,
        "integral_const_mul"
      ],
      [
        160,
        "COne.fcVal H R' hIH"
      ],
      [
        162,
        "COne.hv_shift"
      ],
      [
        163,
        "have hv1"
      ],
      [
        164,
        "H.thetaCoef"
      ],
      [
        165,
        "H.orbRes"
      ],
      [
        165,
        "COne.orb_smul"
      ],
      [
        168,
        "COne.T_smul"
      ],
      [
        171,
        "hTq _ hΨ 1 X hX"
      ],
      [
        176,
        "rw [e, h2]"
      ],
      [
        180,
        "rw [hfun, hv1]"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/DegCut.lean",
    "sha": "1079d74072e904d278cba232030edc7bee2c9e2a",
    "anchors": [
      [
        5,
        "import Development.WeilBound.CoreStatements.AutomorphicKernels.SiegelWeilFormula.AdelicDilations.SectionEqThetaZero"
      ],
      [
        56,
        "theorem cOneVal"
      ],
      [
        60,
        "cOneVal_pf H R L R' hIH hΦ hv hc hc' hT x"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/FourierZero.lean",
    "sha": "3b892acbdefc04bd96ca0818751096d202069c47",
    "anchors": [
      [
        11,
        "structure Hyps"
      ],
      [
        15,
        "thetaCoef : ThetaCoef"
      ],
      [
        31,
        "vacK : VacK"
      ],
      [
        32,
        "iwaQ : IwaQ"
      ],
      [
        36,
        "orbRes : OrbRes"
      ],
      [
        53,
        "def cOne"
      ],
      [
        56,
        "T' 1"
      ],
      [
        40,
        "def EData"
      ],
      [
        41,
        "p ≠ 0"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/LowerRankDatum.lean",
    "sha": "1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",
    "anchors": [
      [
        94,
        "structure LD"
      ],
      [
        98,
        "rng : ∀ i"
      ],
      [
        112,
        "def IsRes"
      ],
      [
        121,
        "def IsSub"
      ],
      [
        119,
        "ν 𝓤 = 1"
      ],
      [
        126,
        "def MainV"
      ],
      [
        147,
        "def VacK"
      ],
      [
        150,
        "def IwaQ"
      ],
      [
        24,
        "0 < r"
      ],
      [
        175,
        "def OrbRes"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/FcCont.lean",
    "sha": "cde3c01a796de6eb1cad61b1666f03bc5567f63a",
    "anchors": [
      [
        14,
        "theorem fcAll"
      ],
      [
        20,
        "hvol"
      ],
      [
        27,
        "kfour.nF_cocompact"
      ],
      [
        31,
        "‖χ β‖ = 1"
      ],
      [
        50,
        "Measure.integrableOn_of_bounded"
      ],
      [
        61,
        "norm_setIntegral_le_of_norm_le_const"
      ],
      [
        62,
        "lam.real 𝓖 = 1"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/DerivInv.lean",
    "sha": "599346241479f91ea4b012ce39ecf2606f407c81",
    "anchors": [
      [
        20,
        "theorem lamDeriv"
      ],
      [
        4,
        "AutomorphicFunctionalHolomorphicDerivativeStatement"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/AdelicDilations/IsExtAtOfDiff.lean",
    "sha": "7a79c77e00affe229c88b89f0eef23832a4272ed",
    "anchors": [
      [
        65,
        "theorem ordVal"
      ],
      [
        85,
        "theorem wrap"
      ],
      [
        36,
        "theorem polyFac"
      ],
      [
        9,
        "theorem iterDerivPow"
      ]
    ]
  }
]
```

RESUME HERE: reconstruct the pinned native producer of IwaQ (start from the IwaQ argument at SiegelWeilStdOf.lean AStep.stepOf, trace its imports to the exact theorem body), preserving positive height ratio, both group positions, uniformity over Schwartz vectors, zero-column restriction and no c!=0 requirement. Then VacK restriction and OrbRes producers independently. HolLead, FourierZero and RUN3 lInt2 deeper producers still open. HANDOFF TO theta, integration, editor, audit, literature. No physics changes.


---

## Appendix 102 — preserved peer text, blob 82cf86c6ec535747ef06be52eaa0dfaf6f5767e4

# RUN9 — Functional extension and tangent realization through residue fields
2026-11-24. SOURCE-MATCHED / PARTIAL: geometric child obligations remain open. No new mathematical premises added to source statements. No independent Lean kernel check, no URT speed claim. Upstream pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Latest checked 1da818b50f1e18808db2792b9dc735bda8cb84d8 (15:42:48 UTC, merge #1198). Read AGENTS, state, continuity, queue/protocol, swarm/handoff/expansion, peer lane handoffs and RUN8. Peer geometry RUN8 concerns quasi-finite fibers; kernel RUN9 reports an authenticated closure and requests direct edge export, not this translation. Physics CI at 15:28:23 is unrelated. Blueprint PDF not reread this run; pinned theorem bodies rather than blueprint claims are the evidence. No physics modifications.

## 1. Actual t5 supplier: tensor extension with kernel control
All paths below relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ at the pin.
ParPt.t5 (ExistsUniqueVectorFieldOfGlobalOneFormValues L26) explicitly invokes T.existsUnique_forms_functional_abelian_base_change, whose wrapper (ExistsUniqueFormsFunctionalAbelianBaseChangeStatement L18–19) applies BaseChangeForm.existsUnique_functional. This is not an axiom declaration. Its actual body uses BaseChangeForm.existsUnique_of_baseChange (ExistsUniqueFormsFunctionalAbelianBaseChange L25–55).

Let R→S be a homomorphism of commutative rings; F,G are R-modules, F',G' S-modules. Let c:F→G be surjective, c':F'→G' linear, p:F→F' semilinear, e:S⊗_R G ≅ G' an S-linear isomorphism, and c'p(f)=e(1⊗c(f)). For any R-linear l:G→S there is exactly one S-linear ψ:F'→S with ψ|ker c'=0 and ψp=l c. In fact
    ψ = l_S ∘ e^{-1} ∘ c',   l_S(s⊗g)=s l(g).
Existence follows by the tensor universal property. For uniqueness take any y in F', write e^{-1}c'(y)=Σ s_i⊗g_i, choose f_i with c(f_i)=g_i, and set z=Σ s_i p(f_i). Then c'(z)=c'(y), so any candidate ψ has ψ(y)=ψ(z)=Σ s_i l(g_i). This is precisely the source's tensor induction (zero, pure tensor, addition) and subtraction of a kernel element. It incidentally proves c' surjective, without assuming it or assuming flatness, finite generation or projectivity. No deletion of the semilinearity or tensor isomorphism condition is justified.

Geometric specialization L59–70: F,F' are crystalline forms on A,A_S; G,G' global 1-forms; c,c' are LieDual.glob, p=m.pullForm. Premises: CrystallineSmoothLift (HC), AbelianHodgeDeRham (HH), commutative R,S, algebra R S, group abelian scheme A smooth of relative dimension g, cartesian base change A' via φ, and the specified divided-power IsMor m. HH gives the compatible global-form tensor equivalence (L61–63). Uniqueness of pulled global forms follows from T.affinePairRestriction_injective_firstCohomology (wrapper explicitly invokes CechDR.pairRes_injective; body not expanded here). c is surjective by LieDual.glob_surjective. Because glob is the closed-form subtype inclusion composed with cmpForm, its kernel equals ker cmpForm, not merely a subset. The last two lines transport the vanishing condition in both directions by subtype coercion and extensionality. This is why no assertion of injectivity of cmpForm is required.

## 2. The actual quotient and its supplier
ExistsTangentVectorFunctionalGlobalFormsAbelianS L108–153:
glob = inclusion ∘ cmpForm. L122–143 supplies surjectivity, not an assumption of this geometric theorem: HC gives degree-one crystalline/de Rham comparison, HH gives closedness of global forms and injectivity of their classes; injectivity of the structure-sheaf comparison and exact filtration range permit lifting the class of each global form to a crystalline form. Same algebra as RUN8, reused rather than counted as new proof. Exact source child dependencies: cechDeRham_comparison_bijective_cup_smooth, structure_sheaf_comparison_injective, hodgeFiltration_eq_range, comparison_formClass, cechHodgeFiltration_eq_range. L145–153: for φ:F→R killing ker cmpForm, ker glob⊆ker φ; the quotient universal property yields φ̄:F/ker glob→R. By surjectivity, F/ker glob ≅ G, so ψ=φ̄∘e^{-1} satisfies ψ glob=φ, uniquely by surjectivity. Source constructs existence; uniqueness is a direct consequence, not a separate source declaration here.

## 3. Tangent realization: field case, residue lifting, global patching
Same module L155–346. Write L=Serre.Lie(intAct A), G=GlobForm, F=Form. Evaluation l: L→F* is linear (tangent addition and epsilon scaling). Vanishing on ker cmpForm is supplied by the internal theorem T.formValueOnTangentVector_eq_zero_of_globalForm_zero; its producer TanVanish.tanVal_eq_zero_of_cmpForm_eq_zero (FormValueOnTangentVectorEqZeroOfGlobalFormZero L156–163) is proved by local affine derivations and localization (L20–154), not by assuming evaluation factors. It holds for arbitrary dual-number points, not just tangents. The complete localization proof remains a child obligation.

Field step L164–206: factor every l(v) through c:F→G; surjectivity of c makes the induced T:L→G* linear and unique pointwise. If l injective then T injective. Over a field, finite equal dimensions of L,G (and therefore G*) imply T surjective. The geometric supplier invokes the given IsLieBasis, HH's stalk rank g, and LieInjField.eq_of_tanVal_eq (its body still open here). Thus every functional on G is realized over the field. Do not apply this finite-dimensional argument over arbitrary rings.

Residue step L223–324: for each surjective algebra map σ:R→K to a field, choose r outside ker σ with local chart and Lie basis over R[1/r]. Base change to K gives a basis y_i; clearing denominators (LieAway.tan_away_lift) provides global tangents w_i whose evaluations agree with those of u_i y_i after pullback, where u_i=σ(r)^N≠0. Preserve chart existence, smoothness, group pullback, base-change of IsLieBasis, dual-number naturality tanVal_pullForm (L67–106) and denominator-clearing as separate obligations. The set of v'∈Lie(A_K) whose evaluation on pulled forms agrees with some global tangent modulo σ is a K-subspace: add lifts; for scalar a∈K choose r_a∈R by surjectivity of σ and scale the lift by r_a. Since it contains u_i y_i and each u_i is invertible, it contains the entire basis, hence every v'. HH provides G_K≅K⊗G with pull compatibility. Apply field realization to the scalar extension of any α∈G*, then lift its evaluation along the basis argument. Thus for each α there is v over R such that σ(tanVal(v,f))=σ(α(c f)) for every f. The statement is congruence of evaluations, not a claim that every residue tangent as a geometric point lifts.

Global step L29–63 and 326–346: let N⊆G* consist of functionals χ with χ∘c in the range of l. G is finite projective by HH. Every maximal ideal m gives K=R/m, and the residue step plus quotient factorization shows for every α∈G* there is χ∈N with (α−χ)(G)⊆m. For finite projective G, choose G as a direct summand of R^n, with f:R^n→G, g:G→R^n and fg=id. Then any λ with λ(G)⊆m satisfies λ=Σ λ(f(e_i))(π_i∘g)∈mG*. Therefore G*/N=m(G*/N) for every maximal m. The quotient is finite. If α∉N, its annihilator ideal in G*/N is proper, so choose maximal m containing it. The determinant/Nakayama lemma yields r with r−1∈m annihilating the quotient. Then r also belongs to the annihilator of α+N, hence to m, contradiction. Thus N=G*. Finally φ killing ker cmpForm factors as ψc, and ψ∈N gives an actual tangent v with evaluation φ. This is the native proof of exists_tangent_of_functional, not a new literature axiom. Finite projectivity is essential to the pointwise residue criterion; see negative control below.

Related uniqueness wrapper: LieInj.tangent_eq_of_tanVal_eq (AbelianSchemeTangentEqOfCrystallineValuesEq L98–128) uses quotient dual-annihilator ≅ G*, finite projectivity of L and G*, surjectivity from the above theorem and equal stalk rank g to obtain injectivity. Preserve LieProj finite-projective-rank construction and Mathlib surjective equal-stalk-rank theorem; this is distinct from field injectivity used earlier, not a circular invocation of the final uniqueness theorem.

## 4. Provenance ledger and executed checks
Seven pinned source blobs reread; 71 exact line anchors checked in connector JS, all matched. Two wrapper bodies, one explicit conditional geometric chain, quotient and residue proofs, and imported Mathlib facts kept distinct. HC/HH are propositions supplied as premises; their global producers have not yet been translated. No new axioms inferred from citation labels, no independent external historical citation audit or Lean elaborated-edge audit this run. Request actual root-reachable direct edges for LieDual.exists_tangent_of_functional, BaseChangeForm.existsUnique_functional and the HC/HH suppliers from kernel lane.

Upstream: original ExistsUniqueFormsFunctionalAbelianBaseChange.lean now 404; moved into ExistsUniqueFormsFunctionalAbelianBaseChangeStatement.lean, blob 6419d54850aed6a4bd4edefda85071f9f112b772. Original L25–55 vs new L67–97 29/31 exact lines (explicit map_add argument changes); original L59–70 vs new L101–112 11/12 (direct pairRes_injective instead of old wrapper). Tangent module blob 0610edb6e4bb7564e19ef9d9da168bc35b880f00, original 8 selected blocks 203/208 aligned exact lines; principal L326–346 equals new L771–791, 21/21. Other changed lines not semantically certified. Do not assert equivalence of full revisions.

Compact reproducible hash/anchor replay in upstream git checkout (subset of 71 executed anchors):
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="1da818b50f1e18808db2792b9dc735bda8cb84d8"
base="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
rows=[
("ExistsUniqueFormsFunctionalAbelianBaseChange","c342aedb5fd27a7b4628352615ef54870239ac43",[(25,"existsUnique_of_baseChange"),(35,"TensorProduct.induction_on"),(47,"LinearMap.liftBaseChange"),(52,"ψ (f - f') = 0"),(59,"existsUnique_functional"),(67,"glob_surjective")]),
("ExistsUniqueFormsFunctionalAbelianBaseChangeStatement","9883e4b4b060882ad43b8462733c30db4d43ac29",[(19,"GlobalTheory.BaseChangeForm.existsUnique_functional")]),
("ExistsTangentVectorFunctionalGlobalFormsAbelianS","8b520290720c379350a27efc6171eb0cab0a658f",[(29,"eq_top_of_residue"),(33,"exists_comp_eq_id_of_projective"),(50,"exists_sub_one_mem_and_smul_eq_zero"),(108,"def glob"),(122,"glob_surjective"),(145,"exists_factor"),(150,"liftQ"),(164,"exists_eq_comp"),(188,"exists_tangent_field"),(223,"exists_lieBasis_lift"),(243,"tan_away_lift"),(263,"exists_lift_of_basis"),(278,"hσ c"),(290,"exists_tangent_residue"),(326,"exists_tangent_of_functional"),(338,"Ideal.Quotient.mk_surjective")]),
("AbelianSchemeTangentEqOfCrystallineValuesEq","48b8e2b8f0e72e2a19742dd68501e3ef68f8965d",[(98,"tangent_eq_of_tanVal_eq"),(117,"dualQuotEquivDualAnnihilator"),(122,"bijective_of_surjective_of_rankAtStalk_eq")]),
("AffinePairRestrictionInjectiveFirstCohomologyStatement","3996375bf10fc0c378687b2d5fe2a2eeee46eaf0",[(7,"GlobalTheory.CechDR.pairRes_injective")]),
("FormValueOnTangentVectorEqZeroOfGlobalFormZero","a9ea464bc1d9c1e677577decdf864948f701f83d",[(156,"tanVal_eq_zero_of_cmpForm_eq_zero"),(161,"snd_val_eq_zero")]),
("ExistsUniqueVectorFieldOfGlobalOneFormValues","366f5679daac8351fbdc73d7e76ae2281b1b031c",[(26,"theorem t5"),(132,"exists_tangent_of_functional")])]
def git(*a): return subprocess.check_output(["git",*a]).decode()
def read(ref,n,h):
    spec=ref+":"+base+n+".lean"
    assert git("rev-parse",spec).strip()==h
    return git("show",spec).splitlines()
for n,h,anchors in rows:
    ls=read(pin,n,h)
    for i,s in anchors: assert s in ls[i-1],(n,i)
a=read(pin,*rows[2][:2]); b=read(head,rows[2][0],"0610edb6e4bb7564e19ef9d9da168bc35b880f00")
blocks=[(29,63,521),(122,143,573),(145,153,596),(164,186,615),(223,261,668),(263,286,708),(290,324,735),(326,346,771)]
assert sum(x==y for lo,hi,st in blocks for x,y in zip(a[lo-1:hi],b[st-1:st+hi-lo]))==203
assert a[325:346]==b[770:791]
a=read(pin,*rows[0][:2]); b=read(head,rows[1][0],"6419d54850aed6a4bd4edefda85071f9f112b772")
assert sum(x==y for x,y in zip(a[24:55],b[66:97]))==29
assert sum(x==y for x,y in zip(a[58:70],b[100:112]))==11
print("hashes, anchors and alignment checked")
```

Finite algebra regression actually executed in connector JS (not Lean): 90 unique extension candidates, 78,370 compatibility checks, 440 kernel checks, 481 cyclic residue criteria, total 79,381 assertions, plus 3 negative controls. This is an illustrative algebra regression, not the full geometry or complexity benchmark. The uniqueness enumeration uses coefficient constraints implied by coordinate basis; compatibility and kernel identities are independently checked over all finite vectors. Reproduction:
```js
const assert=(p,msg)=>{if(!p)throw Error(msg||"failure")};
let extension=0,compat=0,kernel=0,residue=0,negative=0;
const mod=(x,n)=>((x%n)+n)%n;
for(const [n,m] of [[4,2],[6,3],[8,4],[12,6],[5,5]]){
 const tuples=(d,k)=>Array.from({length:d**k},(_,i)=>Array.from({length:k},(_,j)=>Math.floor(i/d**j)%d));
 const src=tuples(n,3),tar=tuples(m,3);
 for(const [x,y,z] of src){assert(mod(mod(x-z,m)+mod(z,m),m)===mod(x,m));compat++}
 for(const [a,b] of tuples(m,2)){
  const candidates=tuples(m,3).filter(([u,v,w])=>u===a&&v===b&&mod(w-u,m)===0);
  assert(candidates.length===1&&candidates[0][2]===a);extension++;
  const [u,v,w]=candidates[0];const psi=([x,y,z])=>mod(u*x+v*y+w*z,m);
  for(const f of src){const [x,y,z]=f;assert(psi([mod(x-z,m),mod(y,m),mod(z,m)])===mod(a*x+b*y,m));compat++}
  for(const [x,y,z] of tar)if(mod(x+z,m)===0&&y===0){assert(psi([x,y,z])===0);kernel++}
 }
}
for(let n=2;n<=100;n++){let primes=[];for(let p=2;p<=n;p++)if(n%p===0&&Array.from({length:p-2},(_,i)=>i+2).every(k=>p%k!==0))primes.push(p);for(let d=1;d<=n;d++)if(n%d===0){const surj=primes.every(p=>d%p!==0);assert(surj===(d===1));residue++}}
// Missing c surjectivity: c=p=0, c'=id over F2; both functionals valid.
assert([0,1].filter(a=>[0,1].every(x=>a*0===0)).length===2);negative++;
// Missing kernel vanishing: p embeds F2 in first coordinate, c' projects.
assert([0,1].filter(b=>[0,1].every(x=>mod(x+b*0,2)===x)).length===2);negative++;
// Missing projectivity: R=Z4, G=Z2, N=0, all duals take values in 2R.
const homs=[0,1,2,3].filter(a=>mod(2*a,4)===0);
assert(homs.length===2&&homs.every(a=>a%2===0));negative++;
console.log({extension,compat,kernel,residue,negative,total:extension+compat+kernel+residue});
```
RESUME HERE: reconstruct the pinned field injectivity LieInjField.eq_of_tanVal_eq and the native LieAway.tan_away_lift denominator-clearing supplier from the imports of ExistsTangentVectorFunctionalGlobalFormsAbelianS; then global HC/HH suppliers and system realization. Do not redo tensor extension or residue Nakayama. HANDOFF TO integration, editor, audit, kernel, geometry. Project OPEN.


---

## Appendix 103 — preserved peer text, blob 916f2778ef1e9033875eeddab6c1ce312b69ca2e

# RUN9 — analytic zero order, local factorization and Landau residue normalization

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the imported analytic-order producer, with exact finite algebra regression executed in V8; no independent Lean kernel replay. Project OPEN. This expands the Mathlib leaf behind RUN1–2 and the RUN8 handoff; it is not a repeat of the outer residue argument.

## Continuity

Read AGENTS, swarm protocol/queue/expansion, research-state and continuity, runner log/protocol opening, CI summary (15:09:27 UTC, #376 run 45418026448, baseline Cathedral PASS only), RUN1/2/5/8, latest commit RESUME notes for prime, dependencies, kernel, acceleration, integration, audit, structure, theta, Galois, character, literature and geometry, plus editor integrated manuscript and math handoff. Peer editor explicitly requests local zero-order audit; math and prime work on distinct arithmetic producers. Blueprint link noted but not independently reopened in this run. No changes to physics queue or gates.

## Source ledger (Git blob SHAs returned by connector)

RH P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed default-branch commit H=59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780 (merge #1242, CI triage change). Original manifest b4d1ec31575a26b2159ec3a262b482bc051f3f6f pins Mathlib Pm=0df444a360eaa60ab8c11dca51a86af692955474; H manifest 8a747b58a34565cc6cb5341b86544aa5d3a20a2d pins Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8, unchanged from RUN8.

RH paths relative to src/Development/AutomorphicArithmetic/:
- P DedekindLFunctions/LandauTheorems/LogDerivLocal.lean, 56dd45f8630096e041bdad64152e07862e0d4c27, L9–39 Deduction.logDeriv_local.
- P DedekindLFunctions/LandauTheorems/poleData.lean, 1f7fdc4409d2f1185700764c51d5c17a907d76e1, L17–89 poleData_dslope/poleData_abstract, L137–239 poleData_char, L336–400 weighted pole.
- H CharacterBoxes/ZeroFreeAllOfTopG.lean, c3bcece31e76be6368af5af4647f1ad30012fd3b (unchanged since RUN8), L355ff logDeriv_local, L851 call, L923ff poleData_char. Exact source comparison executed: logDeriv_local, poleData_dslope and poleData_abstract textually identical after relocation; poleData_char 103-line spans differ only in simp [g, Function.update_apply, hw] becoming simp [g, hw]. Do not infer entire upstream equivalence.

Mathlib paths, Pm/Hm blobs:
- Mathlib/Analysis/Analytic/Order.lean: 43cc6d88cb0ecba9560d4c29a410b271d9432628 / 0e8c74f9a388978486459a02ec9f1ff21a3d0927. P L45–138, H L47–153: actual definitions analyticOrderAt, analyticOrderNatAt; cast, infinity, finite factor, zero equivalence proofs.
- Mathlib/Analysis/Analytic/IsolatedZeros.lean: 9bad403947a1959b68846a3a407f28fdd19d320e / 7c40b052b1a9919a2097da95ad412f62e67d5f81. Read P/H power-series dslope iteration, nonzero leading coefficient, local isolation, uniqueness and exists_eventuallyEq_pow_smul_nonzero_iff (H renamed *_ne_zero_iff with deprecated alias).
- Mathlib/Analysis/Analytic/Uniqueness.lean: 20fe97cfe84c8c26280250418f78ab8f317207e2 / 63e997b6189aa1b0830a6084ee4769b1ddfe7556. H L160–219 identity theorem aux and public completion step. Actual body inspected; P aux also inspected.
- Hm Mathlib/Analysis/Calculus/DSlope.lean 46cd51fe87f023f70ce60210aaa4de28dec458f3 L171–188 HasFPowerSeriesAt.dslope_fslope, alias has_fpower_series_dslope_fslope. P producer was in IsolatedZeros; relocation preserves coefficient shift. Source checks are textual, not elaborated proof-term extraction; blob hashes not independently recomputed.

## 1. Analytic order: why both guards are mandatory

Let f be complex analytic at rho. In a disk, f(rho+x)=sum_{j>=0} a_j x^j, with positive convergence radius. If all a_j=0, f is zero near rho; conversely local vanishing gives zero series by uniqueness. If not, well-ordering yields m=min{j:a_j!=0}, finite. Define T f(s)=(f(s)-f(rho))/(s-rho) for s!=rho and T f(rho)=f'(rho). Its series shifts the coefficients a_j to a_{j+1}: subtract a_0 and divide the convergent tail by x when x!=0, and at zero take a_1. The exact source uses HasSum, dslope and fslope; H moves the one-step theorem to DSlope. Iteration m times yields g=T^m f analytic near rho, g(rho)=a_m!=0. Since the first m coefficients vanish, f(rho+x)=x^m g(rho+x) near rho. Continuity keeps g nonzero in a sufficiently small disk. Hence f has no zeros in the punctured disk. This proves both existence and local isolation without a global RH assumption.

Uniqueness: suppose f=x^m g=x^n j, both factors analytic and nonzero at rho. On a common punctured neighborhood cancel x^min(m,n). If m>n, j=x^(m-n)g tends to 0 at rho, contradicting j(rho)!=0; reverse roles if n>m. Thus m=n. The source first proves the integer-power punctured version, and specializes to naturals via cast and restriction. Conversely a factorization with g(rho)!=0 cannot be identically zero near rho, by punctured nonzero and continuity. This is the iff in IsolatedZeros.

Mathlib analyticOrderAt is an extended natural. For nonanalytic f the definition returns a default 0; for locally zero f it returns infinity; otherwise it chooses the unique factor exponent. analyticOrderNatAt is its toNat, which returns 0 even for infinity. Therefore converting to a natural is valid as an actual multiplicity only after checking finite order; the source obtains not-top from hne (not locally identically zero), then invokes Nat.cast_analyticOrderNatAt. Under analyticity and that guard, m=0 iff f(rho)!=0. One cannot infer nonvanishing merely from analyticOrderNatAt=0 in general (zero function is a counterexample). The distinct guard analyticAt is also required. The factor exponent is not a floating estimate, and no simple-zero hypothesis occurs.

## 2. Why the Landau g is not locally zero anywhere

poleData_abstract assumes g entire (complex differentiable everywhere) and g(1)!=0. If g vanished in a neighborhood of any rho, the identity theorem on connected C would imply g(1)=0. Mathlib's general identity theorem proves the set u of local-zero centers open and relatively closed in U: at x in closure(u) intersect U choose analytic expansion on radius r>0, take y in u within r/2, recenter the expansion at y on radius r/2; every recentered coefficient vanishes because the germ is zero. That ball contains x, proving local zero at x. Preconnectedness then implies U subset u. The public theorem embeds into the normed completion for arbitrary target F, applies the complete-space result, then uses injectivity. For F=C it gives exactly the required implication. It is not a claim that g has no zeros, only that none has infinite local order.

For a nonprincipal character, g=L(s,chi) entire and g(1)!=0 by RUN3 line-one theorem; for modulus-one, g(s)=(s-1)zeta(s) away from 1, g(1)=1 by the residue-one extension (RUN2). Both obey the guards. For the latter g zero multiplicity equals zeta zero multiplicity at rho!=1 since the other factor is nonzero analytic there. At rho=1 no zero is present; totalized zeta(1) is a separate convention, not a value of the meromorphic pole. No assumption of GRH or exclusion of exceptional real zeros within (0,1).

## 3. Local logarithmic derivative

Use f(s)=(s-rho)^m g(s), g(rho)!=0, in a neighborhood, and differentiate at every s in a smaller punctured disk. The Lean Eventually.eventually_nhds step is necessary: equality as a germ at rho yields equality in a neighborhood of each such s, so their derivatives agree. Analyticity of g and g(s)!=0 persist there. For m>=1 the product rule gives
 f'/f = [m(s-rho)^(m-1)g + (s-rho)^m g']/[(s-rho)^m g]
      = m/(s-rho)+g'/g.
For m=0 the direct equality f=g gives the same result with zero pole term; there is no negative natural power. h=g'/g is analytic at rho because g(rho)!=0. The exact source returns m, the iff m=0 iff f(rho)!=0, its equality to analyticOrderAt after casting, and h analytic with the punctured equality. It does NOT assert a point value at rho. A multiple zero produces a simple pole with residue m, not a pole of order m.

## 4. Explicit regularized remainder and residue sign

Set c=g'(1)/g(1), N(s)=g'(s)/g(s)-s*c+k*(1-s), and R(s)=1/[s(s-1)]. Since N(1)=0 and N analytic there, the source defines Phi=-dslope(N,1)(s)/s. It is analytic at 1, away from s=0; away from 1, Phi=-N(s)R(s). This preserves the modulus-one adjustment and no spurious pole at 1. At a zero rho!=0,1 substitute the preceding local logarithmic derivative. Write Q(s)=h(s)-s*c+k*(1-s). Then
 Phi(s) = -m R(rho)/(s-rho) + H(s),
 H(s) = -m dslope(R,rho)(s) - Q(s)R(s).

The explicit divided difference is a useful independently derived simplification:
 dslope(R,rho)(s) = -(s+rho-1)/[s(s-1)rho(rho-1)],
with analytic continuation at s=rho equal to -(2rho-1)/[rho^2(rho-1)^2]. It follows from factoring the difference of the quadratic denominators. Thus H is analytic at rho, with no limit ambiguity in the displayed explicit formula; all denominators are nonzero locally. At a nonzero nonroot choose m=0 and H=Phi, including rho=1. No claim of analytic extension at 0. This simplification is supplementary, not an assertion of a newly checked Lean term or URT advantage.

For the finite family the original and inverse characters are combined with weight a_i/2; conjugation supplies a witness for either branch. Their residues share the factor -1/[rho(rho-1)], and the coefficient S=sum_i(a_i/2)(m_i+m'_i)>0 because at least one multiplicity is positive and every a_i>0. Finite sums preserve analyticity of the remainders. Hence c_rho=-S/[rho(rho-1)] is nonzero at every family pole. Line-one nonvanishing implies 0<beta=Re(rho)<1. For real rho=beta, c_rho=S/[beta(1-beta)]>0 and Im=0, including an exceptional real zero. For complex rho=beta+it, the source only needs a nonzero complex residue; it need not be real. As an optional stronger algebraic consequence, its real part is S*[beta(1-beta)+t^2]/|rho(rho-1)|^2>0. This does not replace the real-pole hypothesis in Landau's real-axis branch: the imaginary part is generally nonzero. No cancellation across different pole positions is inferred. Zero or negative family weights would invalidate the strict S argument.

Dependency direction: convergent power series + identity theorem -> finite order and nonzero factor -> logarithmic derivative -> poleData_abstract -> poleData_char -> family poleData -> abstract Landau contradiction (requires prime window). Nothing here supplies the prime window or proves RH. Original level 0<theta<1 and delta>0 remain intact; current abstract theta generalization described in RUN5 is not used in this local producer.

## 5. Executed reproducible finite certificate

Run with Node by extracting the following fenced block. Executed as shown in the V8 tool runtime. Complex arithmetic uses exact Gaussian integers (BigInt), with a rational grid represented by numerator and common denominator 5. Polynomial factors are bounded illustrative fixtures, not actual L-function zeros. Cross multiplication is done only with guarded nonzero factors; 360 evaluations where the local g vanishes at test points are excluded from the logarithmic-derivative check, not silently accepted. Diagonal check is a coefficient identity, not an experimental analytic limit. The positive-weight loop uses small exact integers. No numerical error tolerance, no infinite analytic proof inferred from regression counts.

~~~js
function certificate(){
 const Z=[0n,0n],ONE=[1n,0n],I=n=>[BigInt(n),0n],C=(a,b)=>[BigInt(a),BigInt(b)];
 const add=([a,b],[c,d])=>[a+c,b+d],neg=([a,b])=>[-a,-b],sub=(a,b)=>add(a,neg(b)),mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],eq=([a,b],[c,d])=>a===c&&b===d,nonzero=a=>!eq(a,Z);
 const conj=([a,b])=>[a,-b],pow=(a,n)=>{let r=ONE;for(let i=0;i<n;i++)r=mul(r,a);return r;};
 const ev=(p,x)=>p.reduceRight((r,c)=>add(mul(r,x),c),Z),der=p=>p.slice(1).map((c,i)=>mul(I(i+1),c)),order=p=>p.findIndex(nonzero),A=(v,m)=>{if(!v)throw Error(m)};
 let factor=0,logderiv=0,orders=0,skipped=0,divdiff=0,diag=0,residue=0,weight=0,negative=0;
 const points=[];for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)if(a||b)points.push(C(a,b));
 for(let m=0;m<=8;m++)for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)if(a||b)for(let c=-1;c<=1;c++)for(let d=-1;d<=1;d++){
  const g=[C(a,b),C(c,d),C(b,c)],f=Array(m).fill(Z).concat(g);
  A(order(f)===m&&eq(ev(f,Z),m?Z:g[0]),"order/center");orders++;
  for(const x of points){
   const fv=ev(f,x),gv=ev(g,x);A(eq(fv,mul(pow(x,m),gv)),"shift factor");factor++;
   if(!nonzero(gv)){skipped++;continue;}
   A(nonzero(fv)&&eq(mul(mul(x,gv),ev(der(f),x)),mul(add(mul(I(m),gv),mul(x,ev(der(g),x))),fv)),"log derivative");logderiv++;
  }
 }
 const q=I(5),D=z=>mul(z,sub(z,q));
 for(let a=1;a<5;a++)for(let b=-5;b<=5;b++){
  const r=C(a,b),dr=D(r);A(nonzero(dr),"rho guard");
  // Numerator of the real part of -S/[rho(rho-1)] with S>0.
  A(neg(conj(dr))[0]>0n,"positive real part");if(b===0)A(neg(conj(dr))[1]===0n,"real pole");
  residue++;
  // Diagonal divided difference numerator agrees with -D'(rho).
  A(eq(neg(sub(add(r,r),q)),neg(sub(mul(I(2),r),q))),"diagonal derivative");diag++;
  for(let c=-4;c<=9;c++)for(let d=-5;d<=5;d++){
   const s=C(c,d),ds=D(s);if(!nonzero(ds)||eq(s,r))continue;
   A(eq(sub(dr,ds),mul(neg(sub(s,r)),sub(add(s,r),q))),"divided difference");divdiff++;
  }
 }
 for(let m=0;m<=8;m++)for(let n=0;n<=8;n++)if(m+n>0)for(let a=1;a<=9;a++)for(let b=1;b<=9;b++){
  // Two weights a/7 and b/11; positive common denominator 77.
  A(11*a*m+7*b*n>0,"positive weighted multiplicity");weight++;
 }
 A(order([Z,Z])===-1,"identically zero has no finite order");negative++;
 A(order([Z,ONE])!==0,"zero leading factor cannot certify order zero");negative++;
 A(!nonzero(D(Z))&&!nonzero(D(q)),"excluded denominator 0,1");negative++;
 A(0*1===0,"zero weight loses witness");negative++;
 A(1*1+(-1)*1===0,"negative weight cancels witness");negative++;
 return {orders,factor,logderiv,skipped,divdiff,diag,residue,weight,negative,total:orders+factor+logderiv+divdiff+diag+residue+weight};
}
console.log(certificate());
~~~

Actual output: {"orders":1944,"factor":93312,"logderiv":92952,"skipped":360,"divdiff":6644,"diag":44,"residue":44,"weight":6480,"negative":5,"total":201420}. Total 201420 finite assertions counted by positive test case, 5 negative controls. Independently checked three identical RH proof-body spans plus the one-line poleData_char difference. No Lean build, kernel validation, independent axiom audit or proven URT improvement. Source replay with git show PIN:PATH and git rev-parse PIN:PATH in the corresponding upstream repos.

RESUME HERE: trace the exact pinned producer of differentiableOn_dslope and its analytic derivative at the base point (the removable singular at s=1 in poleData_abstract), then inspect the native Cauchy coefficient extraction dependency and its precise circle/closed-ball assumptions; distinguish source from kernel replay. Coordinate with kernel/dependency lane to request role-labelled edges for Deduction.logDeriv_local, poleData_abstract and poleData in the authenticated solution closure; avoid duplicating their exporter. HANDOFF TO editor, integration, formal audit, math and kernel. Project OPEN.
