# GL topology and integral lifting — integration 21:00

2026-11-24. RESULT: SOURCE-MATCHED / PARTIAL. One contribution: resolve the GL embedding and integral lift suppliers of [20:00](2026-11-24_2000_CONGRUENCE_MODULUS_LEVI.md), including the directly adjacent compactness and residue-lift arguments. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed main 9282d3a102c4aff0e6026746db2a8990f5d9cddd (unchanged); no migration equivalence.

## Human proof

Fix a field k with ValuativeRel, topology and IsNonarchimedeanLocalField, and a finite decidable index type n. Write O for the valuation ring and F for its residue field, and j:GL_n(O)→GL_n(k) for the entrywise inclusion. The source definitions (MatrixMeasurableSpace, KO/KOne) are KO=range(j) and KOne=j(ker(GL_n(O)→GL_n(F))). Thus KOne≤KO by image inclusion; this is the whole native proof of Model.KOne_le_KO, not a determinant assumption. The StepData version is its alias.

**Integral inverse criterion.** For g∈GL_n(k), g∈KO iff both g and g^{-1} have integral entries. Forward: choose u∈GL_n(O) mapping to g. Both u and u^{-1} have entries in O; functoriality sends u^{-1} to g^{-1}. Reverse: form A,B over O by lifting the entries of g and g^{-1} respectively. Entrywise inclusion is injective. It sends AB and BA to I because g is a unit. Hence AB=BA=I in Mat_n(O). The explicit unit (A,B) maps to g by extensionality of units. This proves SplitFlip.mem_KO_iff and supplies StepData.mem_KO and intM_of_mem_KO. Do not weaken the premise to integrality of g alone: over Q_p, diag(p,1,...,1) is invertible over Q_p and integral but its inverse has p^{-1}, not integral.

**Topology.** The topology on units is induced by the pair (g,g^{-1}), with the inverse factor written in the opposite monoid. The projection to g is continuous and injective. To recover the inverse coordinate continuously on the image, use continuousAt_matrix_inv: on the invertible locus, A^{-1}=adj(A)/det(A), a continuous function since matrix entries of adj(A) and det(A) are polynomial and scalar inversion is continuous at nonzero det(A). The native proof uses Units.isEmbedding_val_mk', continuousAt_matrix_inv and Ring.inverse_eq_inv', obtaining det(A)≠0 from IsUnit A. It first installs the local field's second-countability/Hausdorff instances via Model.secondCountable_and_t2_local_field, which uses the additive uniform space, rank-one valuation embedding, and proper-space theorem. Therefore the projection is a topological embedding, not just an injection. This supplies the exact neighbourhood comap used in exists_cong_subset. Inversion is asserted continuous at units, not at singular matrices. The Mathlib topology/inversion/proper-space lemmas are preserved as open imported obligations, not claimed independently reconstructed.

**Compact open KO.** Entry-integral matrices form the finite product of O, open by finite intersections of continuous entry projections, compact by product compactness (the source compactness lemma actually allows arbitrary index types). O is open by Valuation.isOpen_integer and compact by the local field closed-ball axiom/theorem. Pull back the two open matrix sets under g and g^{-1} and use the integral inverse criterion. For compactness use the closed embedding of units into Mat×Mat^op and pull back the compact product of integral matrix sets. Do not claim that an arbitrary continuous preimage of a compact set is compact. This is exactly the separate closed-embedding hypothesis in SplitFlip.isCompact_KO, supplying CentralExponent.isCompact_cong.

**Residue lift (supplier of cong_factor).** For an arbitrary matrix M over k with v((M-I)_ij)<1 at every entry, M is integral since M=(M-I)+I. Define A over O entrywise by these witnesses. The equivalence residue(x)=residue(y) iff v(x-y)<1 follows by reducing the difference to zero, using the maximal ideal/nonunit valuation characterization. It implies residue(A)=I. The determinant commutes with reduction, so residue(det A)=1≠0, and the local-ring criterion gives IsUnit(det A). By the matrix unit determinant criterion A is a unit u over O. Its residue is the identity unit (units extensionality); j(u) belongs to KOne and has underlying matrix M. This proves exists_mem_KOne without assuming M invertible in advance. Conversely, a KOne witness has residue identity, hence all entries of g-I have valuation <1. The reverse implication uses exists_mem_KOne and injectivity of GL underlying values. This proves mem_KOne and supplies the earlier congruence-factorization argument. Strict <1 cannot be replaced by ≤1: M=0 satisfies the weak bound but is singular for nonempty n. Empty n is allowed in the original finite index type; matrix identities are vacuous and its determinant is the empty product 1. No positive dimension premise added.

## Integration / independent findings

Latest editor [2056 manuscript](../specialists/proof_editor/2026-11-24_2056_INTEGRATED_MANUSCRIPT.md) reports 143 primary + 11 supporting entries by its convention, not unique declarations or proof completion. This new chapter is additional; do not count it twice when the editor integrates it. Prior conservative closure 1,484,705 reported reachable declarations is not a source translation denominator with a verified numerator. Kernel RUN14 (fff5a2d09) demonstrates role-edge deletion can be masked by target-set equality on actual 47-owner projection; use full role evidence, not target equality. Dependencies 63102da24 requests next 18 targets; acceleration a23fb0d5f merges 47+6 same-archive reports without claiming new extraction. Structure 9adeb6277 schedules only observed roles; audit 5cead6ee3 retains branch budgets; math 841a46bce preserves extensionality and unit map provenance. Specialist handoffs: boxes RUN14, Galois RUN14, Landau RUN14, literature RUN14, geometry RUN14, prime RUN14, theta RUN14, editor 2056, kernel and acceleration latest commit checkpoints, Grok run9 claim. General CI checkpoint 394, run 45482075317 PASS at 20:55:53, not RH validation. Protocol, handoff queue, AGENTS, actual runner research log/protocol and continuity/state excerpts inspected. Root-level RESEARCH_LOG/RESEARCH_PROTOCOL paths failed 404; corrected to runner paths. Full external blueprint and older nested handoffs not reread; no claim of using them. No Lean toolchain replay or authenticated root membership for these suppliers. No URT benchmark.

## JSON typed obligation tree (shared nodes)

Source anchors are exact declaration starting lines, not full proof-term dependency lists. The external node deliberately leaves imported obligations open. All file blobs retrieved at pin and matched; 25 declaration anchors located uniquely, all graph targets exist, no cycle. Axiom dependencies remain unclassified locally, not discarded. The 20:00 consumers are included to connect the chapter, not counted as newly translated.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "selected human obligation graph, not authenticated root membership or exhaustive kernel graph",
  "files": [
    {
      "path": "src/Development/AbelianVarietyTheory/Definitions/Foundations/MatrixMeasurableSpace.lean",
      "blob": "3357ad90bd4c82c9fd86d50aa023c7997703b5c0"
    },
    {
      "path": "src/Development/AbelianVarietyTheory/Definitions/Foundations/SecondCountableAndT2LocalField.lean",
      "blob": "829125937719426936bae9f8be35ee5f482e05bd"
    },
    {
      "path": "src/Development/AbelianVarietyTheory/Definitions/Divisors/T2SpaceGeneralLinearGroup.lean",
      "blob": "141a89b315186ad19bd50a06f2945f52a87c4c91"
    },
    {
      "path": "src/Development/AbelianVarietyTheory/Definitions/TwistedInnerProducts/ValuationDetOfMemKO.lean",
      "blob": "29229eb6e42f62e63c0f9aea2b200c5fe8051e3f"
    },
    {
      "path": "src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/CentralExponentBoundOver.lean",
      "blob": "15c5d5b8b52fd25b3de410ae0696ff186298a926"
    }
  ],
  "nodes": [
    {
      "id": "ko",
      "kind": "definition",
      "file": 0,
      "line": 24,
      "anchor": "def KO ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "kone",
      "kind": "definition",
      "file": 0,
      "line": 27,
      "anchor": "def KOne ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "local",
      "kind": "lemma",
      "file": 1,
      "line": 44,
      "anchor": "theorem secondCountable_and_t2_local_field",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "subset",
      "kind": "lemma",
      "file": 1,
      "line": 126,
      "anchor": "theorem KOne_le_KO ",
      "requires": [
        "ko",
        "kone",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ring_open",
      "kind": "lemma",
      "file": 1,
      "line": 132,
      "anchor": "theorem isOpen_int ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ring_compact",
      "kind": "lemma",
      "file": 1,
      "line": 134,
      "anchor": "theorem isCompact_int ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ko_iff",
      "kind": "lemma",
      "file": 2,
      "line": 14,
      "anchor": "theorem mem_KO_iff ",
      "requires": [
        "ko",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "embedding",
      "kind": "lemma",
      "file": 2,
      "line": 31,
      "anchor": "theorem isEmbedding_val_GL ",
      "requires": [
        "local",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "mat_open",
      "kind": "lemma",
      "file": 2,
      "line": 53,
      "anchor": "theorem isOpen_intMatrix ",
      "requires": [
        "ring_open",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "mat_compact",
      "kind": "lemma",
      "file": 2,
      "line": 59,
      "anchor": "theorem isCompact_intMatrix ",
      "requires": [
        "ring_compact",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ko_open",
      "kind": "lemma",
      "file": 2,
      "line": 67,
      "anchor": "theorem isOpen_KO ",
      "requires": [
        "ko_iff",
        "mat_open",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ko_compact",
      "kind": "lemma",
      "file": 2,
      "line": 73,
      "anchor": "theorem isCompact_KO ",
      "requires": [
        "local",
        "ko_iff",
        "mat_compact",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "intm",
      "kind": "definition",
      "file": 3,
      "line": 14,
      "anchor": "def IntM ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "maxm",
      "kind": "definition",
      "file": 3,
      "line": 16,
      "anchor": "def MaxM ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "mem_ko",
      "kind": "lemma",
      "file": 3,
      "line": 62,
      "anchor": "theorem mem_KO ",
      "requires": [
        "intm",
        "ko_iff"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "integral",
      "kind": "lemma",
      "file": 3,
      "line": 64,
      "anchor": "theorem intM_of_mem_KO ",
      "requires": [
        "mem_ko"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "subset_alias",
      "kind": "lemma",
      "file": 3,
      "line": 66,
      "anchor": "theorem KOne_le_KO ",
      "requires": [
        "subset"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "res_zero",
      "kind": "lemma",
      "file": 3,
      "line": 68,
      "anchor": "theorem residue_eq_zero_iff_lt ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "res_eq",
      "kind": "lemma",
      "file": 3,
      "line": 72,
      "anchor": "theorem residue_eq_iff_lt ",
      "requires": [
        "res_zero",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "kone_exists",
      "kind": "lemma",
      "file": 3,
      "line": 76,
      "anchor": "theorem exists_mem_KOne ",
      "requires": [
        "intm",
        "maxm",
        "res_eq",
        "kone",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "kone_iff",
      "kind": "lemma",
      "file": 3,
      "line": 96,
      "anchor": "theorem mem_KOne ",
      "requires": [
        "kone_exists",
        "res_eq",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "cong",
      "kind": "consumer",
      "file": 4,
      "line": 95,
      "anchor": "def cong ",
      "requires": [
        "subset_alias",
        "integral",
        "kone_iff",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "cong_compact",
      "kind": "consumer",
      "file": 4,
      "line": 125,
      "anchor": "theorem isCompact_cong ",
      "requires": [
        "cong",
        "ko_compact",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "cong_basis",
      "kind": "consumer",
      "file": 4,
      "line": 130,
      "anchor": "theorem exists_cong_subset ",
      "requires": [
        "cong",
        "embedding",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "cong_factor",
      "kind": "consumer",
      "file": 4,
      "line": 154,
      "anchor": "theorem cong_factor ",
      "requires": [
        "cong",
        "kone_exists",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "external",
      "kind": "open-imports",
      "requires": [],
      "status": "OPEN: Mathlib units topology, determinant/inversion, valuation, ring, compactness, and other source-visible suppliers not expanded here; exact axiom list not established locally"
    }
  ]
}
```

## Executed finite regression certificate

Executed the following exact integer-arithmetic JS in V8. Exhaustive 2×2 matrices over Z/p² for p=2,3,5; determinant-unit equivalence, both inverse products, identity residue inverse and a fixed p-divisible perturbation preserving inverse residue. This is finite regression, not proof of topology or Lean. The Q_p counterexample above is mathematical, not a finite test. Outputs {"matrices":397442,"inverses":303984,"kone":722,"perturbations":303984,"negative":3}. Reproduce by saving the following block as a .js file and invoking node. Source matching and typed graph checks were run separately through GitHub pinned fetch and the explicit DFS described above; not included in the finite counts. No failed numerical cases. No CI registration outside lane, no unrelated records changed.

```js
function finite(){
 const c={matrices:0,inverses:0,kone:0,perturbations:0,negative:0};
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const mod=(x,q)=>((x%q)+q)%q;
 const mul=(a,b,q)=>[mod(a[0]*b[0]+a[1]*b[2],q),mod(a[0]*b[1]+a[1]*b[3],q),mod(a[2]*b[0]+a[3]*b[2],q),mod(a[2]*b[1]+a[3]*b[3],q)];
 const I=[1,0,0,1],eq=(a,b)=>a.every((x,i)=>x===b[i]),det=a=>a[0]*a[3]-a[1]*a[2];
 function inverse(a,q){const d=mod(det(a),q);let u=0;for(let i=1;i<q;i++)if(mod(d*i,q)===1){u=i;break}return u?[a[3],-a[1],-a[2],a[0]].map(x=>mod(u*x,q)):null}
 for(const p of [2,3,5]){
  const q=p*p;
  for(let a=0;a<q;a++)for(let b=0;b<q;b++)for(let d=0;d<q;d++)for(let e=0;e<q;e++){
   const A=[a,b,d,e],B=inverse(A,q),isK=A.every((x,i)=>mod(x-I[i],p)===0);
   ck((B!==null)===(mod(det(A),p)!==0),"det criterion");c.matrices++;
   if(B){ck(eq(mul(A,B,q),I)&&eq(mul(B,A,q),I),"two-sided inverse");c.inverses++}
   if(isK){ck(B!==null&&B.every((x,i)=>mod(x-I[i],p)===0),"KOne inverse");c.kone++}
   if(B){const C=A.map((x,i)=>mod(x+p*(i+1),q)),D=inverse(C,q);ck(D!==null&&D.every((x,i)=>mod(x-B[i],p)===0),"inverse congruence");c.perturbations++}
  }
 }
 ck(inverse([2,0,0,1],4)===null,"singular mod maximal ideal");c.negative++;
 ck(!eq([1,2,0,1],I)&&[1,2,0,1].every((x,i)=>mod(x-I[i],2)===0),"residue not equality");c.negative++;
 ck(inverse([1,0,0,0],9)===null,"nonunit determinant");c.negative++;
 return c;
}
console.log(finite());
```

**RESUME HERE:** expand the remaining native SplitFlip topology/valuation dependencies by fetching the manifest-pinned Mathlib bodies of Units.isEmbedding_val_mk', continuousAt_matrix_inv, Units.isClosedEmbedding_embedProduct and the local proper-space supplier; distinguish standard-library expansion from RH-specific obligations, and prioritize root-linked consumers once the next role projection returns. Request authenticated paths for SplitFlip.mem_KO_iff, isEmbedding_val_GL, isCompact_KO, StepData.exists_mem_KOne, mem_KOne and CentralExponent.cong_factor. HANDOFF TO dependencies, kernel, audit, editor, integration. Project OPEN.
