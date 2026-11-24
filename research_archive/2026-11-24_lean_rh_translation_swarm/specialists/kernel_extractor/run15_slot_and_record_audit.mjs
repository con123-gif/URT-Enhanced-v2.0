// RH kernel RUN15 (2026-11-24): REVIEW / PARTIAL, authenticated export report audit, not new Lean replay.
// Input: https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-next-root-roles-20261124/outputs/solution_next_root_roles.json
// Git blob d04e0fb24160d3ee1be54cd50082f59526864d4e; authenticated archive SHA256 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e; extraction CI https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45478579968.
// Source: https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean blob 6ac769568b67f85f33565ba3e1eef7b91f53c55f.
// Upstream HEAD observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged since RUN14 (2641 commits ahead of pin per previous compare). No cross-revision joins.
// Preflight: AGENTS, swarm protocol/queue/expansion, continuity, research state/log/protocol excerpts, general CI #394 (PASS, not RH verification), peer latest commits and available lane handoffs, integration 2100 and acceleration RUN15. Some specialist directory handoff selections returned RUN9 rather than latest RUN14; recent commit identities inspected, not all newest texts. No physics changes.
// Prior work: RUN14 audited 47 owners for target-only loss; acceleration RUN15 merged 18 new owners. This independent task audits new batch structural slot identities and reference multiplicity conservation, not another merge or full scan.
// Lemma: if a report records distinct expression count per (role,kind,target), its sum equals that role's referenceOccurrences provided these counts partition the visited reference records. Structural slots are separately indexed signed encoding entries; two slots may target the same declaration. Deleting a repeated slot leaves target set unchanged but breaks slot census or slot identity against retained encodedRootsAndStructuralEdges. Deleting a repeated expression reference record leaves the representative target unchanged but violates the independently retained role census. Neither check establishes original proof-term completeness or identifies each occurrence; coordinated corruption of both redundant fields can evade the check, hence immutable input blob and exact signature checks are required.
// EveryCharacter source: quantifies N with NeZero, character and complex s, strict Re(s)>1/2, excludes trivial character at s=1, concludes LFunction !=0. Four source imports are module dependencies, not constant references. Actual definition type has no exported reference edges (Prop); its value includes 35 role/kind edges including generated _proof_1, literal and explicit Nat references. Do not remove generated proof, instances or guards from evidence. OpenLiteratureStatements is an inductive structure, not an external axiom merely by name; retain constructor/recursor slots; no inference of unconditional availability from type alone.
// 10 root-linked requests and 8 peer name probes; root labels as reported, not newly proven by this audit. No new kernel run, no full RH translation, no URT-specific advantage. V8 executed semantic function against connector-retrieved exact Git blobs; Node replay below verifies raw SHA1 (not separately executed here). Complexity expected O(V+E) on this projection with hash maps; witness index checks are necessary not sufficient.
// RESUME HERE: obtain expression-record list or independently replay exact source proof-term graph for EveryCharacter._proof_1 (ID 326948), and native structure constructor/recursor slots for OpenLiteratureStatements (IDs 550021,550025). Coordinate next batch with dependency lane; distinguish generated proof and actual obligations, keep 8 peer probes unbound unless witnessed. HANDOFF TO dependencies, acceleration, integration, character boxes, literature, audit, editor. Project OPEN.
import fs from 'node:fs';
import crypto from 'node:crypto';
function audit(a,sourceText){
 let checks=0;const ck=(x,m)=>{if(!x)throw Error(m);checks++};
 const sum=(v,f)=>v.reduce((x,y)=>x+f(y),0);
 ck(a.pin==="40e56bab026552e089d7afcfeff08d2defb9c005"&&a.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&a.n===1065214335&&a.reports.length===18,"archive identity");
 const totals={owners:0,typeEdges:0,valueEdges:0,structuralEdges:0,referenceRecords:0,repeatedRecordsBeyondRepresentative:0,maskedEdgeDeletions:0,ownerTargetPairs:0,structuralSlotLoss:0};let owners=new Set(), rows=[];
 function validate(r){
   const roots=r.encodedRootsAndStructuralEdges, es=[];
   ck(Array.isArray(roots)&&roots.every(Number.isSafeInteger),"encoded roots");
   for(const [i,role] of ["type","value"].entries()){
     const v=r[role];if(!v)continue;
     ck(roots[i]===v.expressionRoot+1,"role root mismatch");
     const seen=new Set();
     for(const e of v.references){
       const k=JSON.stringify([e.kind,e.target]);ck(!seen.has(k),"duplicate role/kind/target");seen.add(k);
       ck(Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=v.expressionRoot,"witness range");
       ck(Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"reference multiplicity");
       es.push({role,...e});
     }
     ck(sum(v.references,e=>e.distinctExpressionRecords)===v.referenceOccurrences,"reference record census");
   }
   const slots=roots.flatMap((x,i)=>x<0?[i]:[]);
   ck(slots.length===r.structural.length,"structural slot census");
   for(const [j,e] of r.structural.entries()){
     ck(e.edgeIndex===slots[j]&&e.encoded===roots[e.edgeIndex]&&e.target===-e.encoded-1,"structural slot identity");
     es.push({role:"structural",...e});
   }
   return es;
 }
 for(const r of a.reports){
   ck(!owners.has(r.id),"unique owner");owners.add(r.id);
   const es=validate(r), by=new Map(), sb=new Set(r.structural.map(e=>e.target));
   for(const e of es)by.set(e.target,(by.get(e.target)??0)+1);
   const rec=sum(es,e=>e.distinctExpressionRecords??0);
   const row={id:r.id,name:r.request.name,origin:r.request.origin,typeEdges:r.type?.references.length??0,valueEdges:r.value?.references.length??0,structuralEdges:r.structural.length,referenceRecords:rec,repeatedRecordsBeyondRepresentative:rec-(es.length-r.structural.length),maskedEdgeDeletions:sum([...by.values()],n=>n>1?n:0),ownerTargetPairs:by.size,structuralSlotLoss:r.structural.length-sb.size};
   for(const k of Object.keys(totals))totals[k]+=k==="owners"?1:row[k];
   rows.push(row);
 }
 for(const k of ["typeEdges","valueEdges","structuralEdges"])ck(totals[k]===a.summary[k],"summary "+k);
 const r=a.reports.find(r=>r.id===550020), e=a.reports.find(r=>r.id===326947);
 ck(r.kind==="inductive"&&r.structural.length===5&&new Set(r.structural.map(e=>e.target)).size===3,"inductive package");
 ck(e.kind==="def"&&e.type.references.length===0&&e.value.references.length===35,"EveryCharacter roots");
 const names=new Set(e.value.references.map(x=>x.nameParts.join(".")));
 for(const n of ["NeZero","DirichletCharacter","Complex.re","Or","DirichletCharacter.LFunction","UpperTheory.EveryCharacter._proof_1","Nat"])ck(names.has(n),"EveryCharacter semantic reference "+n);
 const declaration=sourceText.split("\n").find(x=>x.includes("∀ (N : ℕ)"));
 ck(sourceText.includes("def UpperTheory.EveryCharacter : Prop :=")&&declaration?.includes("[NeZero N]")&&declaration.includes("1 / 2 < s.re")&&declaration.includes("(χ ≠ 1 ∨ s ≠ 1)")&&declaration.includes("DirichletCharacter.LFunction χ s ≠ 0"),"source quantifier and pole guard");
 const nat=e.value.references.filter(x=>x.target===61);ck(nat.length===2&&new Set(nat.map(x=>x.kind)).size===2&&sum(nat,x=>x.distinctExpressionRecords)===4,"literal/explicit distinction");
 let negative=0;const clone=x=>JSON.parse(JSON.stringify(x));
 function reject(r,mut,why){const x=clone(r);mut(x);let rejected=false;try{validate(x)}catch(err){rejected=String(err).includes(why)}ck(rejected,"negative control: "+why);negative++}
 reject(r,x=>x.structural.splice(2,1),"structural slot census");
 reject(r,x=>x.structural[2].edgeIndex=x.structural[0].edgeIndex,"structural slot identity");
 reject(e,x=>x.value.expressionRoot--,"role root mismatch");
 reject(e,x=>x.value.references.find(q=>q.kind==="literal_primitive"&&q.target===61).distinctExpressionRecords--,"reference record census");
 reject(e,x=>x.value.references.splice(x.value.references.findIndex(q=>q.kind==="literal_primitive"&&q.target===61),1),"reference record census");
 return {checks,negative,totals,ownersWithMasked:rows.filter(x=>x.maskedEdgeDeletions>0).length,ownersWithRepeatedRecords:rows.filter(x=>x.repeatedRecordsBeyondRepresentative>0).length,rootLinkedRequests:rows.filter(x=>x.origin==="authenticated_root_path_frontier").length,peerProbes:rows.filter(x=>x.origin==="peer_exact_name_probe_not_root_bound").length,EveryCharacter:{...rows.find(x=>x.id===326947),sourceLine:declaration.trim(),nat},OpenLiteratureStatements:{...rows.find(x=>x.id===550020),slots:r.structural},rows};
}
const expected={
  "checks": 7084,
  "negative": 5,
  "totals": {
    "owners": 18,
    "typeEdges": 370,
    "valueEdges": 1866,
    "structuralEdges": 5,
    "referenceRecords": 2259,
    "repeatedRecordsBeyondRepresentative": 23,
    "maskedEdgeDeletions": 705,
    "ownerTargetPairs": 1886,
    "structuralSlotLoss": 2
  },
  "ownersWithMasked": 16,
  "ownersWithRepeatedRecords": 9,
  "rootLinkedRequests": 10,
  "peerProbes": 8,
  "EveryCharacter": {
    "id": 326947,
    "name": "UpperTheory.EveryCharacter",
    "origin": "authenticated_root_path_frontier",
    "typeEdges": 0,
    "valueEdges": 35,
    "structuralEdges": 0,
    "referenceRecords": 37,
    "repeatedRecordsBeyondRepresentative": 2,
    "maskedEdgeDeletions": 2,
    "ownerTargetPairs": 34,
    "structuralSlotLoss": 0,
    "sourceLine": "∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (s : ℂ), 1 / 2 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s ≠ 0",
    "nat": [
      {
        "kind": "literal_primitive",
        "target": 61,
        "nameParts": [
          "Nat"
        ],
        "targetKind": "inductive",
        "witnessExpression": 389,
        "distinctExpressionRecords": 3
      },
      {
        "kind": "explicit_const",
        "target": 61,
        "nameParts": [
          "Nat"
        ],
        "targetKind": "inductive",
        "witnessExpression": 316,
        "distinctExpressionRecords": 1
      }
    ]
  },
  "OpenLiteratureStatements": {
    "id": 550020,
    "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
    "origin": "authenticated_root_path_frontier",
    "typeEdges": 0,
    "valueEdges": 0,
    "structuralEdges": 5,
    "referenceRecords": 0,
    "repeatedRecordsBeyondRepresentative": 0,
    "maskedEdgeDeletions": 4,
    "ownerTargetPairs": 3,
    "structuralSlotLoss": 2,
    "slots": [
      {
        "edgeIndex": 1,
        "encoded": -550021,
        "target": 550020,
        "nameParts": [
          "UpperTheory",
          "LiteratureTheorems",
          "OpenLiteratureStatements"
        ],
        "kind": "inductive"
      },
      {
        "edgeIndex": 2,
        "encoded": -550022,
        "target": 550021,
        "nameParts": [
          "UpperTheory",
          "LiteratureTheorems",
          "OpenLiteratureStatements",
          "mk"
        ],
        "kind": "ctor"
      },
      {
        "edgeIndex": 3,
        "encoded": -550021,
        "target": 550020,
        "nameParts": [
          "UpperTheory",
          "LiteratureTheorems",
          "OpenLiteratureStatements"
        ],
        "kind": "inductive"
      },
      {
        "edgeIndex": 4,
        "encoded": -550022,
        "target": 550021,
        "nameParts": [
          "UpperTheory",
          "LiteratureTheorems",
          "OpenLiteratureStatements",
          "mk"
        ],
        "kind": "ctor"
      },
      {
        "edgeIndex": 5,
        "encoded": -550026,
        "target": 550025,
        "nameParts": [
          "UpperTheory",
          "LiteratureTheorems",
          "OpenLiteratureStatements",
          "rec"
        ],
        "kind": "rec"
      }
    ]
  },
  "rows": [
    {
      "id": 14065049,
      "name": "UpperTheory.TP.K.tLiftK",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 1,
      "valueEdges": 1,
      "structuralEdges": 0,
      "referenceRecords": 2,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 0,
      "ownerTargetPairs": 2,
      "structuralSlotLoss": 0
    },
    {
      "id": 14009158,
      "name": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 17,
      "valueEdges": 3,
      "structuralEdges": 0,
      "referenceRecords": 20,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 2,
      "ownerTargetPairs": 19,
      "structuralSlotLoss": 0
    },
    {
      "id": 13125898,
      "name": "UpperTheory.One.Join.automorphic_window_of_inputs",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 4,
      "valueEdges": 5,
      "structuralEdges": 0,
      "referenceRecords": 9,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 6,
      "ownerTargetPairs": 6,
      "structuralSlotLoss": 0
    },
    {
      "id": 8352348,
      "name": "UpperTheory.BaseChangeIdentities.baseChangeN",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 1,
      "valueEdges": 2,
      "structuralEdges": 0,
      "referenceRecords": 3,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 0,
      "ownerTargetPairs": 3,
      "structuralSlotLoss": 0
    },
    {
      "id": 8026888,
      "name": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 8,
      "valueEdges": 15,
      "structuralEdges": 0,
      "referenceRecords": 23,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 14,
      "ownerTargetPairs": 16,
      "structuralSlotLoss": 0
    },
    {
      "id": 11298207,
      "name": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 2,
      "valueEdges": 30,
      "structuralEdges": 0,
      "referenceRecords": 32,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 2,
      "ownerTargetPairs": 31,
      "structuralSlotLoss": 0
    },
    {
      "id": 11307204,
      "name": "UpperTheory.Zero.LLC.CuspT.type",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 66,
      "valueEdges": 65,
      "structuralEdges": 0,
      "referenceRecords": 131,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 129,
      "ownerTargetPairs": 66,
      "structuralSlotLoss": 0
    },
    {
      "id": 11306966,
      "name": "UpperTheory.Zero.LLC.extDepth",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 1,
      "valueEdges": 176,
      "structuralEdges": 0,
      "referenceRecords": 186,
      "repeatedRecordsBeyondRepresentative": 9,
      "maskedEdgeDeletions": 2,
      "ownerTargetPairs": 176,
      "structuralSlotLoss": 0
    },
    {
      "id": 550020,
      "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 0,
      "valueEdges": 0,
      "structuralEdges": 5,
      "referenceRecords": 0,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 4,
      "ownerTargetPairs": 3,
      "structuralSlotLoss": 2
    },
    {
      "id": 326947,
      "name": "UpperTheory.EveryCharacter",
      "origin": "authenticated_root_path_frontier",
      "typeEdges": 0,
      "valueEdges": 35,
      "structuralEdges": 0,
      "referenceRecords": 37,
      "repeatedRecordsBeyondRepresentative": 2,
      "maskedEdgeDeletions": 2,
      "ownerTargetPairs": 34,
      "structuralSlotLoss": 0
    },
    {
      "id": 2114194,
      "name": "GlobalTheory.CentralExponent.exists_cong_subset",
      "origin": "peer_exact_name_probe_not_root_bound",
      "typeEdges": 47,
      "valueEdges": 177,
      "structuralEdges": 0,
      "referenceRecords": 228,
      "repeatedRecordsBeyondRepresentative": 4,
      "maskedEdgeDeletions": 94,
      "ownerTargetPairs": 177,
      "structuralSlotLoss": 0
    },
    {
      "id": 2114215,
      "name": "GlobalTheory.CentralExponent.isOpen_cong",
      "origin": "peer_exact_name_probe_not_root_bound",
      "typeEdges": 41,
      "valueEdges": 115,
      "structuralEdges": 0,
      "referenceRecords": 156,
      "repeatedRecordsBeyondRepresentative": 0,
      "maskedEdgeDeletions": 82,
      "ownerTargetPairs": 115,
      "structuralSlotLoss": 0
    },
    {
      "id": 2113163,
      "name": "GlobalTheory.SmGL.isSmoothChar_deltaHalf",
      "origin": "peer_exact_name_probe_not_root_bound",
      "typeEdges": 27,
      "valueEdges": 106,
      "structuralEdges": 0,
      "referenceRecords": 134,
      "repeatedRecordsBeyondRepresentative": 1,
      "maskedEdgeDeletions": 54,
      "ownerTargetPairs": 106,
      "structuralSlotLoss": 0
    },
    {
      "id": 521889,
      "name": "GlobalTheory.SmGL.nabs_eq_one",
      "origin": "peer_exact_name_probe_not_root_bound",
      "typeEdges": 28,
      "valueEdges": 196,
      "structuralEdges": 0,
      "referenceRecords": 225,
      "repeatedRecordsBeyondRepresentative": 1,
      "maskedEdgeDeletions": 56,
      "ownerTargetPairs": 196,
      "structuralSlotLoss": 0
    },
    {
      "id": 2117521,
      "name": "GroundTheory.Automorphic.Parabolic.conj_mem_unipotentRadical",
      "origin": "peer_exact_name_probe_not_root_bound",
      "typeEdges": 25,
      "valueEdges": 67,
      "structuralEdges": 0,
      "referenceRecords": 93,
      "repeatedRecordsBeyondRepresentative": 1,
      "maskedEdgeDeletions": 51,
      "ownerTargetPairs": 66,
      "structuralSlotLoss": 0
    },
    {
      "id": 2123770,
      "name": "GroundTheory.Automorphic.Parabolic.leviProj_inv_mul_mem",
      "origin": "peer_exact_name_probe_not_root_bound",
      "typeEdges": 38,
      "valueEdges": 60,
      "structuralEdges": 0,
      "referenceRecords": 100,
      "repeatedRecordsBeyondRepresentative": 2,
      "maskedEdgeDeletions": 77,
      "ownerTargetPairs": 59,
      "structuralSlotLoss": 0
    },
    {
      "id": 868440,
      "name": "Deduction.logDeriv_local",
      "origin": "peer_exact_name_probe_not_root_bound",
      "typeEdges": 58,
      "valueEdges": 299,
      "structuralEdges": 0,
      "referenceRecords": 358,
      "repeatedRecordsBeyondRepresentative": 1,
      "maskedEdgeDeletions": 116,
      "ownerTargetPairs": 298,
      "structuralSlotLoss": 0
    },
    {
      "id": 868834,
      "name": "Deduction.poleData",
      "origin": "peer_exact_name_probe_not_root_bound",
      "typeEdges": 6,
      "valueEdges": 514,
      "structuralEdges": 0,
      "referenceRecords": 522,
      "repeatedRecordsBeyondRepresentative": 2,
      "maskedEdgeDeletions": 14,
      "ownerTargetPairs": 513,
      "structuralSlotLoss": 0
    }
  ]
};
const [report,source]=process.argv.slice(2);if(!report||!source)throw Error('usage: node run15_slot_and_record_audit.mjs REPORT.json PINNED_EveryCharacter.lean');
const read=(p,sha)=>{const b=fs.readFileSync(p);const actual=crypto.createHash('sha1').update('blob '+b.length+'\\0'.replace('\\0','\0')).update(b).digest('hex');if(actual!==sha)throw Error('blob mismatch '+p);return b.toString('utf8')};
const actual=audit(JSON.parse(read(report,'d04e0fb24160d3ee1be54cd50082f59526864d4e')),read(source,'6ac769568b67f85f33565ba3e1eef7b91f53c55f'));if(JSON.stringify(actual)!==JSON.stringify(expected))throw Error('replay mismatch');console.log(JSON.stringify(actual,null,2));
