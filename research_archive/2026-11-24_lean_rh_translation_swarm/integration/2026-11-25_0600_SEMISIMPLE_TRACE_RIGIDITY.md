# Integration — semisimple trace rigidity via Jacobson density
2026-11-25. SOURCE-MATCHED human reconstruction, OPEN kernel and transitive dependency audit. Pinned 40e56bab026552e089d7afcfeff08d2defb9c005. Previous integration 18705392f69c4f1c9caa04d0d2bbd9d1b9932350.
Source: src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean, blob 3133cd181bab7d1f71383c8be7b4e1aee0e35d78; caller src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ColRepSemisimple.lean, blob 182a2b8d161eb8c3cd85b4247c98cd90cd915d3d (L39). Both blob IDs compared and 12 anchors checked this session.

## Exact statement, premises and proof
Let k be a field of characteristic zero, Gamma a monoid (not necessarily a group), V,W finite-dimensional k-vector spaces, rho,sigma representations of Gamma on them, both semisimple. Suppose tr(rho(g))=tr(sigma(g)) for EVERY g in Gamma. Then there exists a k-linear equivalence e:V→W with e(rho(g)v)=sigma(g)e(v) for all g,v. No algebraic closure, topology, continuity, or nonzero dimension required. The proof is not a finite trace comparison and does not assume the characters already separate simple modules.

A. For a k-algebra A (Ring A, Algebra k A) and A-modules V,W with compatible k-actions (IsScalarTower), define tr_V(a) as the k-linear trace of the action of a (L11–13). An A-linear equivalence preserves trace by restricting scalars and conjugating (L20–24). Product action is block diagonal, so tr_(V×W)=tr_V+tr_W (L26–31); identity action has trace dim V (L33). A-submodules are finite-dimensional by restriction of scalars (L35).

B. Separation lemma L37–77: suppose all A-linear maps V→W AND W→V are zero. On U=V×W let p(v,w)=(v,0). Every A-linear endomorphism phi of U has zero off-diagonal blocks, since these are precisely compositions of the inclusions/projections with phi, hence cross-module maps. Thus p phi=phi p; this is exactly the source's proof that p is linear over End_A(U), L41–58. U is semisimple: the two summand images are semisimple, their join is all U (L60–64). Invoke the imported Mathlib jacobson_density (L65) on this End_A(U)-linear p and the finite set of vectors of a k-basis of U. It produces ONE r∈A acting like p on every basis vector. Both actions are k-linear, so agree everywhere (L66–67). Evaluating at (v,0),(0,w) gives r acting as identity on V and zero on W. The hypothesis of equality of traces on all a∈A then yields dim_k V=0 in k; characteristic zero makes the natural-number map injective, hence dim V=0. Swapping V,W gives dim W=0. Do not replace density by an unproved assertion that arbitrary k-linear maps are in the image of A: the double-centralizer linearity and semisimplicity are essential. Density remains a named imported obligation.

C. Common summand lemma L79–98: given nonzero A-linear f:V→W, semisimplicity gives complements P' to ker f in V and Q to im f in W. Set P=ker f, S=im f. The first isomorphism theorem identifies P' ≅ V/ker f ≅ S; hence V ≅ P×S and W ≅ Q×S as A-modules. f nonzero implies S nontrivial, dim S>0. All summands are finite-dimensional; dimension additivity gives dim P<dim V and dim Q<dim W. The source uses complement equivalences, quotient equivalence, then finrank_prod. Submodules inherit semisimplicity as needed by the induction.

D. L102–136 strong induction on an arbitrary natural n bounding dim V+dim W. With equal trace on every a∈A and a nonzero forward map, use C; trace congruence and product identities give tr_P(a)+tr_S(a)=tr_Q(a)+tr_S(a), hence tr_P=tr_Q by cancellation, preserving quantification over all a. dim P+dim Q<n, so induction gives P≅Q. Compose V≅P×S→Q×S≅W. If only a reverse nonzero map exists, apply the same step with V,W swapped, then invert. If neither direction has a nonzero map, B shows both dimensions zero, so both spaces subsingleton and canonically equivalent. This handles n=0 without an extra assumption. Despite the native name nonempty_linear_equiv_of_charpoly_eq, the premise is equality of traces on all a∈A, not equality of one characteristic polynomial.

E. L138–175: take A=k[Gamma], the monoid algebra; rho.asModule and sigma.asModule are the associated A-modules. The named semisimplicity equivalence supplies both IsSemisimpleModule instances (L144–145). For each basis monoid element [g], action is conjugate via asModuleEquiv to rho(g) or sigma(g) (L150–166). Equality of traces follows by the original hypothesis; additivity and k-homogeneity extend it to every finitely supported monoid algebra element (L168–169). D supplies A-linear e between the associated modules. Transport by the canonical k-linear equivalences, restrict scalars to k; A-linearity for [g] gives the desired intertwining identity. In caller ColRepSemisimple L39–55 this supplies the invertible intertwiner for matrix conjugacy and thus the preceding index-two extension chapter. Neither density nor the semisimplicity equivalence is discharged by finite tests.

## Incremental proof graph / typed obligations
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "nodes": [
    {
      "id": "GlobalTheory.TraceIso.tr_congr",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        20,
        24
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.tr_prod",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        26,
        31
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.tr_one",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        33,
        33
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        35,
        35
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.finrank_eq_zero_of_hom",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        37,
        77
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.split_of_hom",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        79,
        98
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        102,
        136
      ]
    },
    {
      "id": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NonemptyLinearEquivOfCharpolyEq.lean",
      "lines": [
        138,
        175
      ]
    },
    {
      "id": "GlobalTheory.TraceConj.conj_of_trace_eq",
      "kind": "theorem",
      "status": "SOURCE_MATCHED",
      "path": "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ColRepSemisimple.lean",
      "lines": [
        33,
        55
      ]
    },
    {
      "id": "jacobson_density",
      "kind": "imported_theorem",
      "status": "OPEN_SUPPLIER",
      "path": null
    },
    {
      "id": "Representation.isSemisimpleRepresentation_iff_isSemisimpleModule_asModule",
      "kind": "imported_theorem",
      "status": "OPEN_SUPPLIER",
      "path": null
    }
  ],
  "edges": [
    {
      "owner": "GlobalTheory.TraceIso.finrank_eq_zero_of_hom",
      "target": "jacobson_density",
      "line": 65,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.split_of_hom",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 90,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.split_of_hom",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 91,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.split_of_hom",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 92,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.split_of_hom",
      "line": 114,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 115,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 116,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finiteDimensional_sub",
      "line": 117,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.tr_congr",
      "line": 120,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.tr_prod",
      "line": 120,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finrank_eq_zero_of_hom",
      "line": 126,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "target": "GlobalTheory.TraceIso.finrank_eq_zero_of_hom",
      "line": 128,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "target": "Representation.isSemisimpleRepresentation_iff_isSemisimpleModule_asModule",
      "line": 144,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "target": "Representation.isSemisimpleRepresentation_iff_isSemisimpleModule_asModule",
      "line": 145,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "target": "GlobalTheory.TraceIso.nonempty_linear_equiv_of_charpoly_eq",
      "line": 170,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    },
    {
      "owner": "GlobalTheory.TraceConj.conj_of_trace_eq",
      "target": "GlobalTheory.TraceIso.exists_equiv_of_trace_eq",
      "line": 39,
      "role": "source_value_call",
      "status": "SOURCE_MATCHED_NOT_EXPORTED"
    }
  ],
  "unresolved": [
    "exact elaborated roles, signed roots and Main-root path",
    "Mathlib jacobson_density and module equivalence/complement suppliers",
    "transitive axiom ledger",
    "independent kernel replay"
  ],
  "note": "Selected source call records, not exhaustive; repeated source lines retained where distinct."
}
```
## Executed certificate
V8 exact integer arithmetic. {"character_pairs":65536,"trace_inverse":256,"common_summand_cancellation":65536,"projection_commutation":2401,"negative":3}. Finite examples over rational integer matrices / split C2×C2 characters, not arbitrary A or a proof of density. The characteristic-5 and unipotent examples are counterexamples to dropping characteristic zero or semisimplicity respectively: the latter has trace 2 at every integer power, but the action of generator is not conjugate to identity. The third control shows dimension alone is insufficient. Run the following with node:
```js
const certificate=()=>{
 const ck=(x)=>{if(!x)throw Error("regression")},dot=(a,b)=>a.reduce((s,x,i)=>s+x*b[i],0),eq=(a,b)=>a.every((x,i)=>x===b[i]),H=[[1,1,1,1],[1,-1,1,-1],[1,1,-1,-1],[1,-1,-1,1]],mul=a=>H.map(h=>dot(h,a));
 let counts={character_pairs:0,trace_inverse:0,common_summand_cancellation:0,projection_commutation:0,negative:0};
 const all=Array.from({length:256},(_,i)=>[i%4,(i>>2)%4,(i>>4)%4,(i>>6)%4]);
 for(const a of all){let t=mul(a);ck(eq(mul(t),a.map(x=>4*x)));counts.trace_inverse++;
 for(const b of all){let u=mul(b);ck(eq(t,u)===eq(a,b));counts.character_pairs++;
 const s=a.map((x,i)=>Math.min(x,b[i])),p=a.map((x,i)=>x-s[i]),q=b.map((x,i)=>x-s[i]),z=mul(s),v=mul(p),w=mul(q);
 ck(eq(t,v.map((x,i)=>x+z[i]))&&eq(u,w.map((x,i)=>x+z[i]))&&(eq(t,u)===eq(v,w)));if(s.some(x=>x>0))ck(p.reduce((x,y)=>x+y,0)<a.reduce((x,y)=>x+y,0)&&q.reduce((x,y)=>x+y,0)<b.reduce((x,y)=>x+y,0));counts.common_summand_cancellation++;
 }}
 // Disjoint C2 sign blocks: commuting endomorphisms have zero cross blocks, so commute with p.
 const mm=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]],p=[1,0,0,0],g=[1,0,0,-1];
 for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)for(let c=-3;c<=3;c++)for(let d=-3;d<=3;d++){let m=[a,b,c,d];if(eq(mm(g,m),mm(m,g)))ck(eq(mm(p,m),mm(m,p)));ck(eq(mm(g,m),mm(m,g))===(b===0&&c===0));counts.projection_commutation++}
 // In characteristic 5, 5 copies of the trivial representation and the zero representation have equal traces.
 ck(5%5===0&&5!==0);counts.negative++;
 // Without semisimplicity, the Z-action by a nontrivial unipotent Jordan block and identity has equal traces for every power.
 for(let n=-10;n<=10;n++)ck(1+1===2&&eq(mm([1,n,0,1],[1,-n,0,1]),[1,0,0,1]));ck(!eq([1,1,0,1],[1,0,0,1]));counts.negative++;
 // Equal dimension alone cannot identify characters.
 ck(!eq(mul([1,0,0,0]),mul([0,1,0,0])));counts.negative++;
 return counts;
};
console.log(certificate());
```
## Integration continuity
Read SWARM_PROTOCOL first, AGENTS, research state/log/protocol excerpts, continuity, HANDOFF_QUEUE, expansion; consulted latest principal 14 peer lanes (dependency 0512, structure 0524, math conductor, audit 0548, boxes RUN23, Galois RUN23, kernel RUN23, Landau RUN23, literature RUN23, acceleration RUN23, geometry RUN24, prime RUN23, editor 0456, theta RUN23). General orchestrator checkpoint #422 PASS 05:55:54 UTC run 45554576525, not RH kernel or this commit's CI. Editor volume 19 reports 234 peer documents before this run, not proof-coverage numerator. Upstream head a18a350c3e5aad997766cff2670b292313e46574 dated 05:32:50 UTC; Main blob eb95ca808793dd61984cc853ab5630f54a74490c uses Claim.zeta, still different from pinned root; no repin or equivalence claim. Arithmetic frontier status returned pass, but expected solution_arithmetic_frontier.json returned 404; do not infer role data. Failed root-level research log/protocol paths corrected to runner paths; initial combined peer retrieval exceeded call cap, retried in batches. External blueprint not reopened. No new authenticated Main-root path, independent reviewer finding for this derivation, or kernel/axiom replay; no URT speed claim. All unrelated records preserved. 
RESUME HERE: obtain pinned Mathlib source of jacobson_density (including its actual semisimplicity and double-centralizer premises), translate that supplier, and request cached signed-root role path to TraceIso.exists_equiv_of_trace_eq from dependency/kernel rather than another full raw scan. Then finite adjoint and six-twist suppliers. HANDOFF TO editor, audit, kernel, dependencies, acceleration, Galois. Full RH OPEN.
