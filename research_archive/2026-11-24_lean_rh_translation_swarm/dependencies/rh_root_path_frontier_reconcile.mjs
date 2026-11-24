/* DEPENDENCIES 2026-11-24 19:12 UTC — RESULT: verified native exported role report reconciliation and observed ROOT PATHS, PARTIAL.
Base 5220d42dfe953d9524b9f30c6436e769529458d5; original source pin 40e56bab026552e089d7afcfeff08d2defb9c005, upstream HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd (not adopted). Main pinned blob dbd5db70bc11b35f18fa5751216ab335321e7bfc independently retrieved. Read SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, actual runner state/log/protocol and continuity excerpts, CI #388 PASS (not RH validation), latest dependency, structure, math, audit, integration, kernel, acceleration, editor checkpoint excerpts. External blueprint not reread. No physical gate changes.
CI 45457486389 PASS; status blob 4c5971962078338f780db9d3f6cded8339fec452, code SHA 79b0d6581d926291326248eb68ce58741f49f1ff. 47/47 targets, 3044 type + 10157 value + 2 structural records, 409097 expression reads; projection 65810 ms, peak RSS 2332216 KiB, job 1815.01 s. Exact solution blob d49fbcc22a2382039986b09ff91dd11af2ef2e7b, SHA256 9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6 (CI reported); six-anchor blob 64b935e4ef309f6c555912a377012c7708eda510 (original source assertion failure preserved, namespace reconciliation done separately). Both retrieved by Git blob connector; local V8 semantic execution, no independent byte hash in V8, no Lean replay; CLI verifies Git blob hash and SHA256 before parsing. Distinct from peer reverse invalidation RUN13: forward root witness paths, no source-match promotion. The 40 unlinked expanded owners are not declared unreachable in the full graph; they may be connected by unexpanded intermediates. Type/value and structural roles retained; mutual metadata not hard edges. Value-only paths are a diagnostic, not proof of completeness. All original records remain authoritative. Complexity expected O(B+V+E) parsing/index/traversal; witness materialization O(sum path lengths), fixed-point test may be superlinear, no new throughput or URT advantage. No hypotheses dropped.
Executed V8 checks 67366, negative controls 6/6. Results below. RESUME HERE: feed the ten exact next target IDs/names (with role and expression witness) into a single next authenticated projection batch; combine with current peer requests only after deduplication. Then extend observed root paths and audit source provenance of each target. HANDOFF TO kernel, integration, structure, acceleration, audit and specialists. Project OPEN.
Replay: node rh_root_path_frontier_reconcile.mjs solution_frontier_roles.json solution_direct_roles.json
*/
import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
function certify(a,old){
 let checks=0; const ck=(p,m)=>{if(!p)throw Error(m);checks++},key=JSON.stringify;
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";
 for(const x of [a,old])ck(x.digest===digest&&x.bytes===61570595788&&x.n===1065214335&&x.root===14065054&&x.indexedDeclarations===1484733,"archive identity");
 ck(a.pin===pin&&a.reports.length===47&&old.reports.length===6,"report identity");
 const owners=new Map(),names=new Map(),all=new Map(),edges=new Map(),incoming=[];
 const checkIdentity=(id,parts,kind)=>{ck(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length>0&&parts.every(v=>typeof v==="string"||(Number.isSafeInteger(v)&&v>=0))&&typeof kind==="string","target identity");const k=key(parts),prior=all.get(id);ck(!prior||(prior.k===k&&prior.kind===kind),"ID/name/kind mismatch");ck(!names.has(k)||names.get(k)===id,"name/ID mismatch");all.set(id,{k,kind,parts});names.set(k,id)};
 let expected=0,optional=0;const totals={type:0,value:0,structural:0},combinedTotals={type:0,value:0,structural:0};let mutual=0,exprReads=0;
 for(const [group,rows] of [["six",old.reports],["combined",a.reports]])for(const x of rows){
  const q=x.request??x.source,parts=q.name.split(".");ck(x.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK"&&!owners.has(x.id),"duplicate/absent owner");checkIdentity(x.id,parts,x.kind);owners.set(x.id,{name:q.name,group,kind:x.kind,origin:q.origin??"six_anchor"});edges.set(x.id,[]);
  if(group==="combined"){ck(q.kind===x.kind,"requested kind mismatch");if(q.id!==undefined){ck(q.id===x.id,"manifest ID");expected++}else optional++;if(q.incoming)incoming.push({id:x.id,...q.incoming});if(q.type!==undefined)ck(q.type===x.encodedRootsAndStructuralEdges[0]&&q.value===x.encodedRootsAndStructuralEdges[1],"requested roots");}
  ck(x.type&&((x.kind==="ctor")?x.value===null:!!x.value),"constructor/value shape");
  for(const role of ["type","value"]){const z=x[role];if(!z)continue;ck(Number.isSafeInteger(z.expressionRoot)&&z.expressionRoot>=0&&z.expressionRoot<a.n,"expression root");if(x.encodedRootsAndStructuralEdges)ck(z.expressionRoot+1===x.encodedRootsAndStructuralEdges[role==="type"?0:1],"one-based seed");const seen=new Set();let sum=0;
   for(const e of z.references){checkIdentity(e.target,e.nameParts,e.targetKind);const token=key([e.kind,e.target]);ck(["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&!seen.has(token),"reference role duplicate/kind");seen.add(token);ck(Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=z.expressionRoot&&Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"witness bound");sum+=e.distinctExpressionRecords;edges.get(x.id).push({owner:x.id,role,target:e.target,kind:e.kind,witness:e.witnessExpression,records:e.distinctExpressionRecords});totals[role]++;if(group==="combined")combinedTotals[role]++;}
   ck(sum===z.referenceOccurrences,"reference occurrence census");if(group==="combined")exprReads+=z.expressionsRead;
  }
  for(const e of x.structural??[]){checkIdentity(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1&&x.encodedRootsAndStructuralEdges[e.edgeIndex]===e.encoded,"signed structural witness");edges.get(x.id).push({owner:x.id,role:"structural",target:e.target,kind:e.kind,edgeIndex:e.edgeIndex,encoded:e.encoded});totals.structural++;if(group==="combined")combinedTotals.structural++;}
  mutual+=x.mutualBlock?.length??0;
 }
 ck(expected===41&&optional===6,"expected and optional request coverage");
 ck(combinedTotals.type===a.summary.typeEdges&&combinedTotals.value===a.summary.valueEdges&&combinedTotals.structural===a.summary.structuralEdges&&exprReads===a.summary.expressionReads,"CI totals");
 for(const q of incoming){const owner=names.get(key(q.owner.split(".")));ck(edges.get(owner)?.some(e=>e.role==="value"&&e.kind==="explicit_const"&&e.target===q.id&&e.witness===q.witness),"incoming anchor mismatch")}
 function traverse(seed,allowed){const prev=new Map([[seed,null]]),queue=[seed];let scanned=0;for(let i=0;i<queue.length;i++){for(const e of edges.get(queue[i])??[]){scanned++;if(allowed(e)&&!prev.has(e.target)){prev.set(e.target,e);queue.push(e.target)}}}return {prev,scanned}}
 const hard=()=>true,proof=e=>e.role==="value"&&e.kind==="explicit_const";
 const root=a.root,full=traverse(root,hard),v=traverse(root,proof);
 // Independent fixed-point baseline on observed edge records.
 function baseline(allowed){const reached=new Set([root]);let change=true;while(change){change=false;for(const [id,ee] of edges)if(reached.has(id))for(const e of ee)if(allowed(e)&&!reached.has(e.target)){reached.add(e.target);change=true}}return reached}
 for(const [view,allowed] of [[full,hard],[v,proof]]){const q=baseline(allowed);ck(q.size===view.prev.size&&[...q].every(x=>view.prev.has(x)),"fixed-point disagreement")}
 const route=(id,prev)=>{if(!prev.has(id))return null;const path=[];let x=id;while(x!==root){const e=prev.get(x);ck(e&&e.target===x&&edges.get(e.owner)?.includes(e),"path witness");path.push({...e,ownerName:owners.get(e.owner).name,targetNameParts:all.get(e.target).parts});x=e.owner;ck(path.length<=owners.size,"cyclic witness")}return path.reverse()};
 const connected=[...owners].filter(([id])=>full.prev.has(id)).map(([id,o])=>({id,...o,path:route(id,full.prev)}));
 const unlinked=[...owners].filter(([id])=>!full.prev.has(id)).map(([id,o])=>({id,...o}));
 const plans=[
 ["UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter","value","UpperTheory.TP.K.tLiftK"],
 ["UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter","value","UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift"],
 ["UpperTheory.One.vwin_of_row","value","UpperTheory.One.Join.automorphic_window_of_inputs"],
 ["UpperTheory.One.vwin_of_row","value","UpperTheory.BaseChangeIdentities.baseChangeN"],
 ["UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin","value","UpperTheory.Lit.every_character_of_theta_integrals_local_matching"],
 ["UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin","value","UpperTheory.LiteratureTheorems.published_results_arithmetic"],
 ["UpperTheory.Zero.LLC.recTExists","value","UpperTheory.Zero.LLC.CuspT.type"],
 ["UpperTheory.Zero.LLC.recTExists","value","UpperTheory.Zero.LLC.extDepth"],
 ["UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk","type","UpperTheory.LiteratureTheorems.OpenLiteratureStatements"],
 ["UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin","type","UpperTheory.EveryCharacter"]
 ];
 const next=plans.map(([owner,role,target])=>{const i=names.get(key(owner.split("."))),j=names.get(key(target.split(".")));ck(full.prev.has(i)&&!owners.has(j),"next target already projected or owner unlinked");const e=edges.get(i).find(e=>e.target===j&&e.role===role&&e.kind==="explicit_const");ck(!!e,"next edge missing");return {owner,role,target,id:j,targetKind:all.get(j).kind,witness:e.witness}});
 const components=[];for(const [i,ee] of edges)for(const e of ee)if(owners.has(e.target))components.push({owner:owners.get(i).name,target:owners.get(e.target).name,...e});
 return {checks,expected,optional,owners:owners.size,identities:all.size,totals,combinedTotals,exprReads,mutualMetadataRows:mutual,rootConnectedOwnerCount:connected.length,rootValueOnlyConnectedOwnerCount:[...owners.keys()].filter(i=>v.prev.has(i)).length,rootObservedHardReachableNames:full.prev.size,rootObservedHardBoundary:full.prev.size-connected.length,rootObservedValueOnlyNames:v.prev.size,rootObservedEdgesScanned:full.scanned,connected,unlinked,observedOwnerEdges:components,next};
}
const expectedResult={
  "checks": 67366,
  "expected": 41,
  "optional": 6,
  "owners": 53,
  "identities": 3293,
  "totals": {
    "type": 3077,
    "value": 10233,
    "structural": 2
  },
  "combinedTotals": {
    "type": 3044,
    "value": 10157,
    "structural": 2
  },
  "exprReads": 409097,
  "mutualMetadataRows": 52,
  "rootConnectedOwnerCount": 13,
  "rootValueOnlyConnectedOwnerCount": 13,
  "rootObservedHardReachableNames": 613,
  "rootObservedHardBoundary": 600,
  "rootObservedValueOnlyNames": 610,
  "rootObservedEdgesScanned": 906,
  "connected": [
    {
      "id": 14065054,
      "name": "riemannHypothesis",
      "group": "six",
      "kind": "thm",
      "origin": "six_anchor",
      "path": []
    },
    {
      "id": 14065053,
      "name": "rhOfAll",
      "group": "six",
      "kind": "thm",
      "origin": "six_anchor",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        }
      ]
    },
    {
      "id": 14065052,
      "name": "allChi",
      "group": "six",
      "kind": "thm",
      "origin": "six_anchor",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 14065052,
          "kind": "explicit_const",
          "witness": 1065212060,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "allChi"
          ]
        }
      ]
    },
    {
      "id": 14065051,
      "name": "UpperTheory.FinalTheorems.everyCharacter",
      "group": "six",
      "kind": "thm",
      "origin": "six_anchor",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 14065052,
          "kind": "explicit_const",
          "witness": 1065212060,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "allChi"
          ]
        },
        {
          "owner": 14065052,
          "role": "value",
          "target": 14065051,
          "kind": "explicit_const",
          "witness": 1065212058,
          "records": 1,
          "ownerName": "allChi",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter"
          ]
        }
      ]
    },
    {
      "id": 13125901,
      "name": "UpperTheory.FinalTheorems.everyCharacter_of_row",
      "group": "six",
      "kind": "thm",
      "origin": "six_anchor",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 14065052,
          "kind": "explicit_const",
          "witness": 1065212060,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "allChi"
          ]
        },
        {
          "owner": 14065052,
          "role": "value",
          "target": 14065051,
          "kind": "explicit_const",
          "witness": 1065212058,
          "records": 1,
          "ownerName": "allChi",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter"
          ]
        },
        {
          "owner": 14065051,
          "role": "value",
          "target": 13125901,
          "kind": "explicit_const",
          "witness": 1065212055,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter_of_row"
          ]
        }
      ]
    },
    {
      "id": 341189,
      "name": "Formalism.VW.rh_of_every",
      "group": "six",
      "kind": "thm",
      "origin": "six_anchor",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 341189,
          "kind": "explicit_const",
          "witness": 1065212059,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "Formalism",
            "VW",
            "rh_of_every"
          ]
        }
      ]
    },
    {
      "id": 341050,
      "name": "Formalism.VW.rh_of_right",
      "group": "combined",
      "kind": "thm",
      "origin": "seven_frontier",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 341189,
          "kind": "explicit_const",
          "witness": 1065212059,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "Formalism",
            "VW",
            "rh_of_every"
          ]
        },
        {
          "owner": 341189,
          "role": "value",
          "target": 341050,
          "kind": "explicit_const",
          "witness": 6497238,
          "records": 1,
          "ownerName": "Formalism.VW.rh_of_every",
          "targetNameParts": [
            "Formalism",
            "VW",
            "rh_of_right"
          ]
        }
      ]
    },
    {
      "id": 341183,
      "name": "DirichletCharacter.LFunction_modOne_eq",
      "group": "combined",
      "kind": "thm",
      "origin": "seven_frontier",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 341189,
          "kind": "explicit_const",
          "witness": 1065212059,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "Formalism",
            "VW",
            "rh_of_every"
          ]
        },
        {
          "owner": 341189,
          "role": "value",
          "target": 341183,
          "kind": "explicit_const",
          "witness": 6497276,
          "records": 1,
          "ownerName": "Formalism.VW.rh_of_every",
          "targetNameParts": [
            "DirichletCharacter",
            "LFunction_modOne_eq"
          ]
        }
      ]
    },
    {
      "id": 14065050,
      "name": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
      "group": "combined",
      "kind": "thm",
      "origin": "seven_frontier",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 14065052,
          "kind": "explicit_const",
          "witness": 1065212060,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "allChi"
          ]
        },
        {
          "owner": 14065052,
          "role": "value",
          "target": 14065051,
          "kind": "explicit_const",
          "witness": 1065212058,
          "records": 1,
          "ownerName": "allChi",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter"
          ]
        },
        {
          "owner": 14065051,
          "role": "value",
          "target": 14065050,
          "kind": "explicit_const",
          "witness": 1065212056,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
          "targetNameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "galoisLocalGlobalStrong_recParameter"
          ]
        }
      ]
    },
    {
      "id": 11298208,
      "name": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "group": "combined",
      "kind": "thm",
      "origin": "seven_frontier",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 14065052,
          "kind": "explicit_const",
          "witness": 1065212060,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "allChi"
          ]
        },
        {
          "owner": 14065052,
          "role": "value",
          "target": 14065051,
          "kind": "explicit_const",
          "witness": 1065212058,
          "records": 1,
          "ownerName": "allChi",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter"
          ]
        },
        {
          "owner": 14065051,
          "role": "value",
          "target": 13125901,
          "kind": "explicit_const",
          "witness": 1065212055,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter_of_row"
          ]
        },
        {
          "owner": 13125901,
          "role": "value",
          "target": 11298208,
          "kind": "explicit_const",
          "witness": 997980691,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
          "targetNameParts": [
            "UpperTheory",
            "LiteratureTheorems",
            "every_character_of_literature_of_vWin"
          ]
        }
      ]
    },
    {
      "id": 11307205,
      "name": "UpperTheory.Zero.LLC.recTExists",
      "group": "combined",
      "kind": "thm",
      "origin": "seven_frontier",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 14065052,
          "kind": "explicit_const",
          "witness": 1065212060,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "allChi"
          ]
        },
        {
          "owner": 14065052,
          "role": "value",
          "target": 14065051,
          "kind": "explicit_const",
          "witness": 1065212058,
          "records": 1,
          "ownerName": "allChi",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter"
          ]
        },
        {
          "owner": 14065051,
          "role": "value",
          "target": 13125901,
          "kind": "explicit_const",
          "witness": 1065212055,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter_of_row"
          ]
        },
        {
          "owner": 13125901,
          "role": "value",
          "target": 11307205,
          "kind": "explicit_const",
          "witness": 901833048,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
          "targetNameParts": [
            "UpperTheory",
            "Zero",
            "LLC",
            "recTExists"
          ]
        }
      ]
    },
    {
      "id": 13125899,
      "name": "UpperTheory.One.vwin_of_row",
      "group": "combined",
      "kind": "thm",
      "origin": "seven_frontier",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 14065052,
          "kind": "explicit_const",
          "witness": 1065212060,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "allChi"
          ]
        },
        {
          "owner": 14065052,
          "role": "value",
          "target": 14065051,
          "kind": "explicit_const",
          "witness": 1065212058,
          "records": 1,
          "ownerName": "allChi",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter"
          ]
        },
        {
          "owner": 14065051,
          "role": "value",
          "target": 13125901,
          "kind": "explicit_const",
          "witness": 1065212055,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter_of_row"
          ]
        },
        {
          "owner": 13125901,
          "role": "value",
          "target": 13125899,
          "kind": "explicit_const",
          "witness": 997980696,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
          "targetNameParts": [
            "UpperTheory",
            "One",
            "vwin_of_row"
          ]
        }
      ]
    },
    {
      "id": 550021,
      "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk",
      "group": "combined",
      "kind": "ctor",
      "origin": "seven_frontier",
      "path": [
        {
          "owner": 14065054,
          "role": "value",
          "target": 14065053,
          "kind": "explicit_const",
          "witness": 1065212062,
          "records": 1,
          "ownerName": "riemannHypothesis",
          "targetNameParts": [
            "rhOfAll"
          ]
        },
        {
          "owner": 14065053,
          "role": "value",
          "target": 14065052,
          "kind": "explicit_const",
          "witness": 1065212060,
          "records": 1,
          "ownerName": "rhOfAll",
          "targetNameParts": [
            "allChi"
          ]
        },
        {
          "owner": 14065052,
          "role": "value",
          "target": 14065051,
          "kind": "explicit_const",
          "witness": 1065212058,
          "records": 1,
          "ownerName": "allChi",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter"
          ]
        },
        {
          "owner": 14065051,
          "role": "value",
          "target": 13125901,
          "kind": "explicit_const",
          "witness": 1065212055,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
          "targetNameParts": [
            "UpperTheory",
            "FinalTheorems",
            "everyCharacter_of_row"
          ]
        },
        {
          "owner": 13125901,
          "role": "value",
          "target": 550021,
          "kind": "explicit_const",
          "witness": 12992050,
          "records": 1,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
          "targetNameParts": [
            "UpperTheory",
            "LiteratureTheorems",
            "OpenLiteratureStatements",
            "mk"
          ]
        }
      ]
    }
  ],
  "unlinked": [
    {
      "id": 8981975,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of'",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 14034132,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of'_k",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 8953756,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.vacK_of",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 8953455,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.vac_K'",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 8953738,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.vac_res'",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 8953593,
      "name": "GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 6375344,
      "name": "GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 6375353,
      "name": "GlobalTheory.T.psiLevelPairCompatible_of_columnLevels",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 6375493,
      "name": "GlobalTheory.Mem.R3.Grp.grp_levels_exist",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 4997285,
      "name": "GlobalTheory.Mem.R3.pins_card_index_ranks",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 2367057,
      "name": "GlobalTheory.MemLoc.frob_laws",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 868949,
      "name": "Deduction.iteratedDeriv_laplace",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 868943,
      "name": "Deduction.iteratedDeriv_laplace_hasDerivAt",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 868955,
      "name": "Deduction.landau_coeff",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 11189057,
      "name": "GlobalTheory.eq_zero_of_forall_residueField_functional",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 11189127,
      "name": "GlobalTheory.PtVanish.connForm_eq_zero",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 3987187,
      "name": "ReciprocityTheory.ChartRestriction.G.Chart.tan_lift",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 3986738,
      "name": "ReciprocityTheory.ChartRestriction.G.Chart.tan_uniq",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 3987404,
      "name": "ReciprocityTheory.ChartRestriction.G.Chart.glue_tan",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 9615658,
      "name": "GlobalTheory.T.complex_section_finite_combination",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 9615598,
      "name": "GlobalTheory.CompanionTheory.VanDescent.vanish_descent",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 9615438,
      "name": "GlobalTheory.CompanionTheory.Ar.ClosedPt.exists_residue_eval",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 9615504,
      "name": "GlobalTheory.CompanionTheory.Arith.DedekindDescent.linIndep_descent",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 869799,
      "name": "Formalism.MainNotions.LinkG_at",
      "group": "combined",
      "kind": "def",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 869816,
      "name": "Formalism.MainNotions.LinkG",
      "group": "combined",
      "kind": "def",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 1076940,
      "name": "Formalism.L2.GlobalTheoryTheory.Loss.loss_bound_at",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN12"
    },
    {
      "id": 6078879,
      "name": "GlobalTheory.divTied3_read",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN11"
    },
    {
      "id": 6078946,
      "name": "GlobalTheory.T.divisionCompatible_at_readIdentifications",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN11"
    },
    {
      "id": 868460,
      "name": "Deduction.poleData_abstract",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN11"
    },
    {
      "id": 869149,
      "name": "Deduction.landau_cauchy",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN11"
    },
    {
      "id": 869232,
      "name": "Deduction.landau_pole_asym",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN11"
    },
    {
      "id": 9616555,
      "name": "PositivityTheory.Xj7N.norm_small_le",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN11"
    },
    {
      "id": 9613757,
      "name": "PositivityTheory.Xj7N.local_unit_map_surjective",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN11"
    },
    {
      "id": 9616232,
      "name": "ModelDimension.cusp_form_extension_vanishing",
      "group": "combined",
      "kind": "thm",
      "origin": "authenticated_manifest_RUN11"
    },
    {
      "id": 4832698,
      "name": "PositivityTheory.RgGu.NR.signature",
      "group": "combined",
      "kind": "thm",
      "origin": "integration_RUN11_source_candidate"
    },
    {
      "id": 4833221,
      "name": "PositivityTheory.RgGu.NR.BoundB.bound_main",
      "group": "combined",
      "kind": "thm",
      "origin": "integration_RUN11_source_candidate"
    },
    {
      "id": 4833917,
      "name": "PositivityTheory.RgGu.NR.boundB",
      "group": "combined",
      "kind": "thm",
      "origin": "integration_RUN11_source_candidate"
    },
    {
      "id": 4832560,
      "name": "PositivityTheory.RgGu.NR.Sig.lim_form",
      "group": "combined",
      "kind": "thm",
      "origin": "integration_RUN11_source_candidate"
    },
    {
      "id": 856985,
      "name": "Deduction.CharacterBalanceMoves.one_char",
      "group": "combined",
      "kind": "thm",
      "origin": "audit_RUN11_exact_name_request"
    },
    {
      "id": 858797,
      "name": "Deduction.ch_core",
      "group": "combined",
      "kind": "thm",
      "origin": "audit_RUN11_exact_name_request"
    }
  ],
  "observedOwnerEdges": [
    {
      "owner": 14065054,
      "target": 14065053,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212062,
      "records": 1
    },
    {
      "owner": 14065053,
      "target": 14065052,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212060,
      "records": 1
    },
    {
      "owner": 14065053,
      "target": 341189,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212059,
      "records": 1
    },
    {
      "owner": 14065052,
      "target": 14065051,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212058,
      "records": 1
    },
    {
      "owner": 14065051,
      "target": 14065050,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212056,
      "records": 1
    },
    {
      "owner": 14065051,
      "target": 13125901,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212055,
      "records": 1
    },
    {
      "owner": 13125901,
      "target": 13125899,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980696,
      "records": 1
    },
    {
      "owner": 13125901,
      "target": 11307205,
      "role": "value",
      "kind": "explicit_const",
      "witness": 901833048,
      "records": 1
    },
    {
      "owner": 13125901,
      "target": 550021,
      "role": "value",
      "kind": "explicit_const",
      "witness": 12992050,
      "records": 1
    },
    {
      "owner": 13125901,
      "target": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980691,
      "records": 1
    },
    {
      "owner": 341189,
      "target": 341183,
      "role": "value",
      "kind": "explicit_const",
      "witness": 6497276,
      "records": 1
    },
    {
      "owner": 341189,
      "target": 341050,
      "role": "value",
      "kind": "explicit_const",
      "witness": 6497238,
      "records": 1
    },
    {
      "owner": 8953756,
      "target": 8953738,
      "role": "value",
      "kind": "explicit_const",
      "witness": 719345242,
      "records": 1
    },
    {
      "owner": 8953756,
      "target": 8953455,
      "role": "value",
      "kind": "explicit_const",
      "witness": 719345212,
      "records": 1
    },
    {
      "owner": 6375353,
      "target": 6375344,
      "role": "value",
      "kind": "explicit_const",
      "witness": 482473989,
      "records": 1
    },
    {
      "owner": 6375493,
      "target": 6375353,
      "role": "value",
      "kind": "explicit_const",
      "witness": 482496561,
      "records": 1
    },
    {
      "owner": 868949,
      "target": 868943,
      "role": "value",
      "kind": "explicit_const",
      "witness": 27135355,
      "records": 1
    },
    {
      "owner": 868955,
      "target": 868949,
      "role": "value",
      "kind": "explicit_const",
      "witness": 27135582,
      "records": 1
    },
    {
      "owner": 9615658,
      "target": 9615598,
      "role": "value",
      "kind": "explicit_const",
      "witness": 769111314,
      "records": 1
    },
    {
      "owner": 9615598,
      "target": 9615504,
      "role": "value",
      "kind": "explicit_const",
      "witness": 769104076,
      "records": 1
    },
    {
      "owner": 9615598,
      "target": 9615438,
      "role": "value",
      "kind": "explicit_const",
      "witness": 769100310,
      "records": 1
    },
    {
      "owner": 869816,
      "target": 869799,
      "role": "value",
      "kind": "explicit_const",
      "witness": 27224776,
      "records": 1
    },
    {
      "owner": 1076940,
      "target": 869799,
      "role": "type",
      "kind": "explicit_const",
      "witness": 27224776,
      "records": 1
    },
    {
      "owner": 1076940,
      "target": 869799,
      "role": "value",
      "kind": "explicit_const",
      "witness": 27224776,
      "records": 1
    },
    {
      "owner": 6078879,
      "target": 4997285,
      "role": "value",
      "kind": "explicit_const",
      "witness": 369519968,
      "records": 1
    },
    {
      "owner": 6078946,
      "target": 6078879,
      "role": "value",
      "kind": "explicit_const",
      "witness": 458455888,
      "records": 1
    },
    {
      "owner": 869232,
      "target": 869149,
      "role": "value",
      "kind": "explicit_const",
      "witness": 27165541,
      "records": 1
    },
    {
      "owner": 4832698,
      "target": 4832560,
      "role": "value",
      "kind": "explicit_const",
      "witness": 350566237,
      "records": 1
    },
    {
      "owner": 4833917,
      "target": 4833221,
      "role": "value",
      "kind": "explicit_const",
      "witness": 350653173,
      "records": 1
    },
    {
      "owner": 858797,
      "target": 856985,
      "role": "value",
      "kind": "explicit_const",
      "witness": 26608091,
      "records": 1
    }
  ],
  "next": [
    {
      "owner": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
      "role": "value",
      "target": "UpperTheory.TP.K.tLiftK",
      "id": 14065049,
      "targetKind": "thm",
      "witness": 1065212053
    },
    {
      "owner": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
      "role": "value",
      "target": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
      "id": 14009158,
      "targetKind": "thm",
      "witness": 1065212052
    },
    {
      "owner": "UpperTheory.One.vwin_of_row",
      "role": "value",
      "target": "UpperTheory.One.Join.automorphic_window_of_inputs",
      "id": 13125898,
      "targetKind": "thm",
      "witness": 997980685
    },
    {
      "owner": "UpperTheory.One.vwin_of_row",
      "role": "value",
      "target": "UpperTheory.BaseChangeIdentities.baseChangeN",
      "id": 8352348,
      "targetKind": "thm",
      "witness": 677083986
    },
    {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "role": "value",
      "target": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "id": 8026888,
      "targetKind": "thm",
      "witness": 893073824
    },
    {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "role": "value",
      "target": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "id": 11298207,
      "targetKind": "thm",
      "witness": 893073879
    },
    {
      "owner": "UpperTheory.Zero.LLC.recTExists",
      "role": "value",
      "target": "UpperTheory.Zero.LLC.CuspT.type",
      "id": 11307204,
      "targetKind": "thm",
      "witness": 893652253
    },
    {
      "owner": "UpperTheory.Zero.LLC.recTExists",
      "role": "value",
      "target": "UpperTheory.Zero.LLC.extDepth",
      "id": 11306966,
      "targetKind": "thm",
      "witness": 893651816
    },
    {
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk",
      "role": "type",
      "target": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
      "id": 550020,
      "targetKind": "inductive",
      "witness": 12992045
    },
    {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "role": "type",
      "target": "UpperTheory.EveryCharacter",
      "id": 326947,
      "targetKind": "def",
      "witness": 6497236
    }
  ]
};
function read(file,sha,sha256){const b=fs.readFileSync(file);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("Git blob identity");if(sha256&&crypto.createHash("sha256").update(b).digest("hex")!==sha256)throw Error("report digest");return JSON.parse(b.toString("utf8"))}
if(process.argv.length!==4)throw Error("provide two exact report paths");
const a=read(process.argv[2],"d49fbcc22a2382039986b09ff91dd11af2ef2e7b","9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6"),old=read(process.argv[3],"64b935e4ef309f6c555912a377012c7708eda510");
const start=performance.now(),result=certify(a,old);if(JSON.stringify(result)!==JSON.stringify(expectedResult))throw Error("replay differs");let negatives=0;for(const mutate of [x=>x.digest="0",x=>x.reports[0].request.id++,x=>x.reports[0].type.references[0].nameParts=["wrong"],x=>x.reports[0].request.incoming.witness++,x=>x.reports[6].structural[0].encoded++,x=>x.reports[0].value.references.push(x.reports[0].value.references[0])]){const x=JSON.parse(JSON.stringify(a));mutate(x);try{certify(x,old)}catch(e){negatives++}}if(negatives!==6)throw Error("negative controls");console.log(JSON.stringify({result,negatives,wallMs:performance.now()-start,maxRssKiB:process.resourceUsage().maxRSS},null,2));
