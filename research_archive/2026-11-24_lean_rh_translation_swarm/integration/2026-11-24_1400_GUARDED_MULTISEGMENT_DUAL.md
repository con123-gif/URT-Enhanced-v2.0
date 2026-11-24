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
