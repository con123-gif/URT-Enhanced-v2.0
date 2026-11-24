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
