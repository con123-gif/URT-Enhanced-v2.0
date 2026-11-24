/* DEPENDENCIES 2026-11-24 21:12 UTC — PARTIAL. Exact next frontier from 18 native projections.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream main 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged, not adopted. Prior producer 63102da2488b52ab2f89e484e71a975547ad4118. Read SWARM_PROTOCOL first, HANDOFF_QUEUE, AGENTS, runner log/protocol, continuity/state excerpts, CI #394 (physical only), integration 21:00, math/audit/structure, kernel RUN15, acceleration RUN15 and editor 20:56 checkpoints. Blueprint not reopened. No physical changes.
Inputs Git blobs 64b935e4ef309f6c555912a377012c7708eda510, d49fbcc22a2382039986b09ff91dd11af2ef2e7b, d04e0fb24160d3ee1be54cd50082f59526864d4e. Actual CI PASS https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45478579968 (status blob 8707978d94d4df32b7a359c01a6dcb8e5ed56952). 18/18 exact, 370 type, 1866 value, 5 structural, 37002 reads, projection 5949ms, peak RSS 2204588 KiB, wall 1496.69s. All 10 prior incoming paths reconciled; 8 peer probes present but no observed root path, not classified unreachable. Kernel/acceleration already audited slot/delta; distinct new contribution is disjoint next manifest and reproducible selection. No independent kernel replay.
V8 semantic execution actual reports: {"checks":78702,"owners":71,"rootConnected":23,"priorConnected":13,"rootObserved":706,"rootBoundary":683,"proofOnly":701,"optionalRootLinked":0,"totals":{"type":370,"value":1866,"structural":5,"reads":37002},"count":71,"rootTargets":70,"negative":5,"ms":75}. Five negative controls rejected (archive digest, ID, incoming witness, slot encoding, witness bounds). Git connector blob identities used; CLI verifies exact hashes. Expected O(B+V+E) parsing/index/traversal, fixed number of report groups; no new full-scale speed/RSS or URT advantage. Producer template reused; new CLI not executed here. No hypotheses/axioms removed. Project OPEN.
RESUME HERE: read compute/rh-literature-theta-frontier-20261124/status.json and outputs/solution_literature_theta_frontier.json, verify exact IDs and structural RHS slots; prioritize EveryCharacter._proof_1 and OpenLiteratureStatements.rec; audit triv is owner-bound only until a root path is witnessed. HANDOFF TO kernel, literature, Galois, theta, geometry, integration, audit, structure, editor and acceleration.
Replay: node rh_literature_theta_frontier.mjs verify-manifest solution_direct_roles.json solution_frontier_roles.json solution_next_root_roles.json ; node rh_literature_theta_frontier.mjs --out /tmp/rh-lit
*/
function derive(docs){
 let checks=0;const ck=(x,m)=>{if(!x)throw Error(m);checks++},key=JSON.stringify,owners=new Map(),edges=new Map(),identities=new Map(),names=new Map(),root=14065054;
 function ident(id,parts,kind){ck(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length>0&&typeof kind==="string","identity");const k=key([parts,kind]);ck(!identities.has(id)||identities.get(id)===k,"id collision");ck(!names.has(key(parts))||names.get(key(parts))===id,"name collision");identities.set(id,k);names.set(key(parts),id)}
 for(let i=0;i<3;i++){const d=docs[i];ck(d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&d.bytes===61570595788&&d.n===1065214335&&d.root===root&&d.indexedDeclarations===1484733&&d.reports.length===[6,47,18][i],"archive identity");if(i>0)ck(d.pin==="40e56bab026552e089d7afcfeff08d2defb9c005","source pin");for(const r of d.reports){const q=r.request??r.source;ck(r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK"&&!owners.has(r.id),"owner");ident(r.id,q.name.split("."),r.kind);ck(q.id===undefined||q.id===r.id,"request id");ck(q.kind===undefined||q.kind===r.kind,"request kind");owners.set(r.id,{q,i});edges.set(r.id,[]);function add(z,role){ck(Number.isSafeInteger(z.expressionRoot)&&z.expressionRoot>=0&&z.expressionRoot<d.n,"expression root");let sum=0;const seen=new Set();for(const e of z.references){ident(e.target,e.nameParts,e.targetKind);const k=key([e.kind,e.target]);ck(!seen.has(k)&&["explicit_const","projection_carrier","literal_primitive"].includes(e.kind),"role reference");seen.add(k);ck(Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=z.expressionRoot&&Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"witness");sum+=e.distinctExpressionRecords;edges.get(r.id).push({owner:r.id,role,kind:e.kind,target:e.target,nameParts:e.nameParts,targetKind:e.targetKind,witness:e.witnessExpression});}ck(sum===z.referenceOccurrences,"reference count")}
 ck(!!r.type&&(["thm","def","opaque"].includes(r.kind)?!!r.value:r.value===null),"value shape");add(r.type,"type");if(r.value)add(r.value,"value");for(const e of r.structural??[]){ck(e.encoded===r.encodedRootsAndStructuralEdges[e.edgeIndex],"slot witness");if(e.encoded<0){ident(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1,"slot target");edges.get(r.id).push({owner:r.id,role:"structural",kind:"package_member",target:e.target,nameParts:e.nameParts,targetKind:e.kind,edgeIndex:e.edgeIndex,encoded:e.encoded})}else{ck(e.kind==="recursor_rule_rhs"&&e.expression.expressionRoot+1===e.encoded,"RHS");add(e.expression,"recursor_rule_rhs:"+e.edgeIndex)}}}}
 function walk(allow){const seen=new Set([root]),q=[root];for(let j=0;j<q.length;j++)for(const e of edges.get(q[j])??[])if(allow(e)&&!seen.has(e.target)){seen.add(e.target);q.push(e.target)}return seen}
 const full=walk(()=>true),proof=walk(e=>e.role==="value"&&e.kind==="explicit_const"),previous=walk(e=>owners.get(e.owner).i!==2);
 const rows=docs[2].reports,required=rows.slice(0,10);for(const r of required){const a=r.request.incoming,owner=names.get(key(a.owner.split(".")));ck(r.request.origin==="authenticated_root_path_frontier"&&previous.has(r.id)&&previous.has(owner)&&edges.get(owner).some(e=>e.target===r.id&&e.role===a.role&&e.kind==="explicit_const"&&e.witness===a.witness),"incoming anchor")}
 const picks=new Map();function select(e,origin){if(owners.has(e.target))return;ck(e.nameParts.every(x=>typeof x==="string"&&!x.includes(".")),"tagged name");const incoming={owner:owners.get(e.owner).q.name,ownerId:e.owner,role:e.role,kind:e.kind,...(e.witness!==undefined?{witness:e.witness}:{edgeIndex:e.edgeIndex,encoded:e.encoded})};if(picks.has(e.target)){picks.get(e.target).incomingWitnesses.push(incoming);return}picks.set(e.target,{name:e.nameParts.join("."),id:e.target,kind:e.targetKind,origin,incoming,incomingWitnesses:[incoming]})}
 for(const r of required)for(const e of edges.get(r.id)){const n=e.nameParts.join(".");if(e.role==="structural"||(e.role==="value"&&e.kind==="explicit_const"&&(/^(UpperTheory|GlobalTheory)\./.test(n)||n==="DirichletCharacter.LFunction")&&(r!==rows[7]||/^UpperTheory\.Zero\.LLC/.test(n))))select(e,"authenticated_root_path_frontier")}
 let audit=0;for(const es of edges.values())for(const e of es)if(e.target===856978&&e.kind==="explicit_const"){audit++;select(e,full.has(e.owner)?"authenticated_root_path_frontier":"authenticated_owner_path_not_root_bound")}ck(audit>0,"audit witness");
 const requests=[...picks.values()];for(const q of requests)ck(!owners.has(q.id)&&(q.origin==="authenticated_root_path_frontier"?full.has(q.id):!full.has(q.id)),"classification");
 const t={type:0,value:0,structural:0,reads:0};for(const r of rows){t.type+=r.type.references.length;t.value+=r.value?.references.length??0;t.structural+=r.structural?.length??0;t.reads+=r.type.expressionsRead+(r.value?.expressionsRead??0)}ck(t.type===docs[2].summary.typeEdges&&t.value===docs[2].summary.valueEdges&&t.structural===docs[2].summary.structuralEdges&&t.reads===docs[2].summary.expressionReads,"totals");
 const connected=[...owners.keys()].filter(x=>full.has(x)).length;return {checks,owners:owners.size,rootConnected:connected,priorConnected:[...owners].filter(([x,o])=>previous.has(x)&&o.i!==2).length,rootObserved:full.size,rootBoundary:full.size-connected,proofOnly:proof.size,optionalRootLinked:rows.slice(10).filter(r=>full.has(r.id)).length,totals:t,requests}
}
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import crypto from "node:crypto";
import {fileURLToPath} from "node:url";
import {spawnSync} from "node:child_process";
const here=path.dirname(fileURLToPath(import.meta.url));
const requests=[
  {
    "name": "UpperTheory.TP.tLift_holds_k",
    "id": 14065048,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.TP.K.tLiftK",
      "ownerId": 14065049,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212051
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.TP.K.tLiftK",
        "ownerId": 14065049,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212051
      }
    ]
  },
  {
    "name": "UpperTheory.Gal.Int.Geo.geoOne_holds",
    "id": 14009157,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
      "ownerId": 14009158,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644801
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
        "ownerId": 14009158,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1062644801
      }
    ]
  },
  {
    "name": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift",
    "id": 13235289,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
      "ownerId": 14009158,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644800
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
        "ownerId": 14009158,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1062644800
      }
    ]
  },
  {
    "name": "UpperTheory.TP.TLiftK",
    "id": 13125905,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
      "ownerId": 14009158,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1000528341
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
        "ownerId": 14009158,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1000528341
      }
    ]
  },
  {
    "name": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
    "id": 13125897,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.automorphic_window_of_inputs",
      "ownerId": 13125898,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980678
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "ownerId": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678
      }
    ]
  },
  {
    "name": "UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm",
    "id": 13096368,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.automorphic_window_of_inputs",
      "ownerId": 13125898,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980674
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "ownerId": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980674
      }
    ]
  },
  {
    "name": "UpperTheory.V.Z.Win.RowT",
    "id": 11307286,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.automorphic_window_of_inputs",
      "ownerId": 13125898,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893652341
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "ownerId": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893652341
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.OpenImageCondition",
    "id": 11307287,
    "kind": "inductive",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.automorphic_window_of_inputs",
      "ownerId": 13125898,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893652342
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "ownerId": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893652342
      }
    ]
  },
  {
    "name": "UpperTheory.HeckeLevelFrameExistence.candFin",
    "id": 8352347,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.BaseChangeIdentities.baseChangeN",
      "ownerId": 8352348,
      "role": "value",
      "kind": "explicit_const",
      "witness": 677083983
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.BaseChangeIdentities.baseChangeN",
        "ownerId": 8352348,
        "role": "value",
        "kind": "explicit_const",
        "witness": 677083983
      }
    ]
  },
  {
    "name": "UpperTheory.BaseChangeIdentities.baseChangeN_of",
    "id": 8349692,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.BaseChangeIdentities.baseChangeN",
      "ownerId": 8352348,
      "role": "value",
      "kind": "explicit_const",
      "witness": 677083982
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.BaseChangeIdentities.baseChangeN",
        "ownerId": 8352348,
        "role": "value",
        "kind": "explicit_const",
        "witness": 677083982
      }
    ]
  },
  {
    "name": "GlobalTheory.Mem.Top.Bl.parametersOfDependence",
    "id": 1571814,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 471448676
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 471448676
      }
    ]
  },
  {
    "name": "GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses.nLink",
    "id": 7587637,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 657233342
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 657233342
      }
    ]
  },
  {
    "name": "UpperTheory.N.boundAtTwoThree_linked_of_recT",
    "id": 8026883,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 657234199
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 657234199
      }
    ]
  },
  {
    "name": "UpperTheory.Lit.nonempty_hyps_definite_side_of_closed_bound",
    "id": 8026822,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 657234192
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 657234192
      }
    ]
  },
  {
    "name": "GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses.greenRegularCharacters",
    "id": 1551045,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 471449753
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 471449753
      }
    ]
  },
  {
    "name": "GlobalTheory.GreenBridge.green_of_regular",
    "id": 1551004,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 471449752
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 471449752
      }
    ]
  },
  {
    "name": "UpperTheory.Top.every_character_of_green_v_win",
    "id": 1550746,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 657234187
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 657234187
      }
    ]
  },
  {
    "name": "UpperTheory.Top.VWin",
    "id": 551631,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 80597571
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 80597571
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.RecTExists",
    "id": 550010,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 12992044
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 12992044
      }
    ]
  },
  {
    "name": "GlobalTheory.CovTop.CovolumeBoundOfX",
    "id": 792461,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 471595887
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 471595887
      }
    ]
  },
  {
    "name": "GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.LocalMatching",
    "id": 679666,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 120701144
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 120701144
      }
    ]
  },
  {
    "name": "GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.ThetaIntegralsAgree",
    "id": 679647,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 120701143
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 120701143
      }
    ]
  },
  {
    "name": "GlobalTheory.FunPr.ThetaLocalInputs",
    "id": 678408,
    "kind": "inductive",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 17642256
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 17642256
      }
    ]
  },
  {
    "name": "GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses",
    "id": 670194,
    "kind": "inductive",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "ownerId": 8026888,
      "role": "value",
      "kind": "explicit_const",
      "witness": 17300403
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
        "ownerId": 8026888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 17300403
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.formal_algebraisation_of_literature",
    "id": 11298206,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073819
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073819
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.principalisation_of_literature",
    "id": 11188026,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 883324021
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 883324021
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.nadel_vanishing_and_non_klt_divisor_of_literature",
    "id": 11284967,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073815
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073815
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.serre_holomorphic_sections_of_literature",
    "id": 11284966,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073812
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073812
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.cycle_heights_of_literature",
    "id": 11284965,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073809
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073809
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.chow_form_exists_of_literature",
    "id": 11284964,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073806
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073806
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.arith_hilbert_samuel_of_literature",
    "id": 11188027,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 883324033
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 883324033
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.l2_extension_log_canonical_of_literature",
    "id": 11284939,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073802
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073802
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.nef_numerics_of_literature",
    "id": 11188029,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 883324039
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 883324039
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.kawamata_viehweg_of_literature",
    "id": 11276513,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073798
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073798
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.prismatic_dieudonne_hodge_of_literature",
    "id": 11274891,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073795
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073795
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.grothendieck_messing_of_literature",
    "id": 11274890,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073792
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073792
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.ab_mul_n_st_of_literature",
    "id": 11243348,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073789
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073789
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.principal_polarisation_one_section_of_literature",
    "id": 11243347,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073786
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073786
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.induced_simple_lowest_alcove_of_literature",
    "id": 11243345,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073783
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073783
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.semi_abelian_hom_extension_of_literature",
    "id": 11243344,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073780
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073780
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.hasse_norm_st_of_literature",
    "id": 11243343,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073777
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073777
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.landherr_st_of_literature",
    "id": 11243342,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073774
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073774
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.good_chern_weil_of_literature",
    "id": 11243341,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073771
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073771
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.green_series_st_of_literature",
    "id": 8728855,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 707740887
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 707740887
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.strong_approx_su_of_literature",
    "id": 8559847,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 703725935
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 703725935
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.semistable_reduction_st_of_literature",
    "id": 11225740,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073766
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073766
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.ray_class_field_st_of_literature",
    "id": 8521556,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 695668735
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 695668735
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.abelian_de_rham_of_literature",
    "id": 11225739,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 891403526
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 891403526
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.ar_calc_of_literature",
    "id": 11188028,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 883324036
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 883324036
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.vol_nef_of_literature",
    "id": 11188039,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073760
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073760
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.vol_ge_of_literature",
    "id": 11188030,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073757
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073757
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.toroidal_compactification_of_literature",
    "id": 11148737,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073754
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073754
      }
    ]
  },
  {
    "name": "GlobalTheory.CovTop.PublishedHodgeBundleTheorems.mk",
    "id": 9038705,
    "kind": "ctor",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "ownerId": 11298207,
      "role": "value",
      "kind": "explicit_const",
      "witness": 724118235
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
        "ownerId": 11298207,
        "role": "value",
        "kind": "explicit_const",
        "witness": 724118235
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.CuspT",
    "id": 11298209,
    "kind": "inductive",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.CuspT.type",
      "ownerId": 11307204,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893074170
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.CuspT.type",
        "ownerId": 11307204,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893074170
      },
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893074170
      }
    ]
  },
  {
    "name": "GlobalTheory.WeilDeligne.WD",
    "id": 421532,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.CuspT.type",
      "ownerId": 11307204,
      "role": "value",
      "kind": "explicit_const",
      "witness": 8609135
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.CuspT.type",
        "ownerId": 11307204,
        "role": "value",
        "kind": "explicit_const",
        "witness": 8609135
      }
    ]
  },
  {
    "name": "GlobalTheory.LocGL.IrrGL",
    "id": 387338,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.CuspT.type",
      "ownerId": 11307204,
      "role": "value",
      "kind": "explicit_const",
      "witness": 8609087
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.CuspT.type",
        "ownerId": 11307204,
        "role": "value",
        "kind": "explicit_const",
        "witness": 8609087
      }
    ]
  },
  {
    "name": "GlobalTheory.LocLanglands.IsLocalArtin",
    "id": 545496,
    "kind": "inductive",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.CuspT.type",
      "ownerId": 11307204,
      "role": "value",
      "kind": "explicit_const",
      "witness": 12850433
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.CuspT.type",
        "ownerId": 11307204,
        "role": "value",
        "kind": "explicit_const",
        "witness": 12850433
      }
    ]
  },
  {
    "name": "GlobalTheory.WeilDeligne.Weil",
    "id": 419556,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.CuspT.type",
      "ownerId": 11307204,
      "role": "value",
      "kind": "explicit_const",
      "witness": 11611005
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.CuspT.type",
        "ownerId": 11307204,
        "role": "value",
        "kind": "explicit_const",
        "witness": 11611005
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.CuspT.dim",
    "id": 11303551,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893473707
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893473707
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.CuspT.depth",
    "id": 11306963,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893633522
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893633522
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.Pr.dzs",
    "id": 6187254,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 466376890
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 466376890
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.DZ",
    "id": 6187266,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 466363290
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 466363290
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.goodSeg",
    "id": 6921387,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 562834711
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 562834711
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.GoodCusp",
    "id": 548452,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 12958046
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 12958046
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.Good",
    "id": 548468,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 12988606
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 12988606
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.extDim",
    "id": 11303687,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893631863
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893631863
      }
    ]
  },
  {
    "name": "UpperTheory.Zero.LLC.InFor._proof_1",
    "id": 6921466,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.extDepth",
      "ownerId": 11306966,
      "role": "value",
      "kind": "explicit_const",
      "witness": 562463326
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.Zero.LLC.extDepth",
        "ownerId": 11306966,
        "role": "value",
        "kind": "explicit_const",
        "witness": 562463326
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.rec",
    "id": 550025,
    "kind": "rec",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
      "ownerId": 550020,
      "role": "structural",
      "kind": "package_member",
      "edgeIndex": 5,
      "encoded": -550026
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
        "ownerId": 550020,
        "role": "structural",
        "kind": "package_member",
        "edgeIndex": 5,
        "encoded": -550026
      }
    ]
  },
  {
    "name": "DirichletCharacter.LFunction",
    "id": 328658,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.EveryCharacter",
      "ownerId": 326947,
      "role": "value",
      "kind": "explicit_const",
      "witness": 6102695
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.EveryCharacter",
        "ownerId": 326947,
        "role": "value",
        "kind": "explicit_const",
        "witness": 6102695
      }
    ]
  },
  {
    "name": "UpperTheory.EveryCharacter._proof_1",
    "id": 326948,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.EveryCharacter",
      "ownerId": 326947,
      "role": "value",
      "kind": "explicit_const",
      "witness": 6102670
    },
    "incomingWitnesses": [
      {
        "owner": "UpperTheory.EveryCharacter",
        "ownerId": 326947,
        "role": "value",
        "kind": "explicit_const",
        "witness": 6102670
      }
    ]
  },
  {
    "name": "Deduction.CharacterBalanceMoves.triv",
    "id": 856978,
    "kind": "thm",
    "origin": "authenticated_owner_path_not_root_bound",
    "incoming": {
      "owner": "Deduction.CharacterBalanceMoves.one_char",
      "ownerId": 856985,
      "role": "value",
      "kind": "explicit_const",
      "witness": 26464300
    },
    "incomingWitnesses": [
      {
        "owner": "Deduction.CharacterBalanceMoves.one_char",
        "ownerId": 856985,
        "role": "value",
        "kind": "explicit_const",
        "witness": 26464300
      }
    ]
  }
];
function collectBatch(requests,ctx,project,select){
 const {decls,nameOf,read,n,challenge}=ctx;
 const ck=(p,m)=>{if(!p)throw Error(m)}, key=JSON.stringify, known=new Set(),names=new Set();
 for(const r of requests){ck(typeof r.name==="string"&&r.name.length>0&&!names.has(r.name),"duplicate request name");names.add(r.name);if(r.id!==undefined){ck(Number.isSafeInteger(r.id)&&r.id>=0&&!known.has(r.id),"duplicate/bad request ID");known.add(r.id)}}
 const lookup=select(decls,nameOf,requests.map(r=>r.name)),reports=[];
 for(const r of requests){
  const f=lookup.get(r.name);
  if(!f){ck(challenge||r.id===undefined,"required solution declaration absent "+r.name);reports.push({request:r,status:"NOT_EXPORTED_BY_EXACT_NAME"});continue}
  const {id,v}=f;
  ck(key(nameOf(id))===key(r.name.split(".")),"tagged name mismatch");
  ck(r.kind===undefined||v.kind===r.kind,"kind mismatch "+r.name);
  if(!challenge&&r.id!==undefined)ck(id===r.id,"manifest ID mismatch "+r.name);
  ck(Array.isArray(v.edges)&&v.edges.length>0&&Number.isSafeInteger(v.edges[0])&&v.edges[0]>0&&v.edges[0]<=n,"type seed");
  const isValue=["def","thm","opaque"].includes(v.kind);
  ck(isValue?v.edges.length===2&&Number.isSafeInteger(v.edges[1])&&v.edges[1]>0&&v.edges[1]<=n:["axiom","quot","ctor","inductive","rec"].includes(v.kind)&&v.edges.slice(1).every(e=>Number.isSafeInteger(e)&&(e<0||(v.kind==="rec"&&e>0&&e<=n))),"declaration shape "+r.name);
  if(!challenge&&r.type!==undefined)ck(r.type===v.edges[0]&&r.value===v.edges[1],"one-based root mismatch "+r.name);
  const type=project(v.edges[0]-1,read,decls,nameOf,n);
  const value=isValue?project(v.edges[1]-1,read,decls,nameOf,n):null;
  const structural=isValue?[]:v.edges.slice(1).map((e,i)=>{if(e>0)return {edgeIndex:i+1,encoded:e,kind:"recursor_rule_rhs",expression:project(e-1,read,decls,nameOf,n)};const target=-e-1;ck(decls.has(target),"missing structural declaration");return {edgeIndex:i+1,encoded:e,target,nameParts:nameOf(target),kind:decls.get(target).kind}});
  ck(Array.isArray(v.mutualBlock),"missing mutual metadata");
  const mutualBlock=v.mutualBlock.map(id=>{const parts=nameOf(id);ck(Array.isArray(parts),"missing mutual name");return {id,nameParts:parts,exported:decls.has(id)}});
  reports.push({request:r,status:"EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",id,kind:v.kind,encodedRootsAndStructuralEdges:[...v.edges],type,value,structural,mutualBlock});
 }
 return reports;
}
function newWrite({out,file,digest,bytes,meta,n,root,decls,nameOf,read,challenge}){
 need(digest===(challenge?CH:SOL)&&bytes===(challenge?350862311:61570595788)&&n===(challenge?6112241:1065214335)&&decls.size===(challenge?53722:1484733)&&root===(challenge?326835:14065054),"archive identity");
 need(key(nameOf(root))===key(["riemannHypothesis"]),"root tagged identity");
 const start=Date.now(),reports=collectBatch(requests,{decls,nameOf,read,n,challenge},project,select);
 const summary={recursorRuleRhs:reports.reduce((s,r)=>s+(r.structural?.filter(e=>e.kind==="recursor_rule_rhs").length||0),0),requests:reports.length,found:reports.filter(r=>r.id!==undefined).length,typeEdges:reports.reduce((s,r)=>s+(r.type?.references.length||0),0),valueEdges:reports.reduce((s,r)=>s+(r.value?.references.length||0),0),structuralEdges:reports.reduce((s,r)=>s+(r.structural?.length||0),0),expressionReads:reports.reduce((s,r)=>s+(r.type?.expressionsRead||0)+(r.value?.expressionsRead||0),0)};
 const result={status:"AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK",pin:PIN,file,digest,bytes,meta,n,root,indexedDeclarations:decls.size,projectionMs:Date.now()-start,maxRssKiB:process.resourceUsage().maxRSS,summary,reports};
 fs.writeFileSync(path.join(out,challenge?"challenge_literature_theta_frontier.json":"solution_literature_theta_frontier.json"),JSON.stringify(result,null,2)+"\n");
 console.log(JSON.stringify({file,projectionMs:result.projectionMs,summary,unresolved:reports.filter(r=>r.id===undefined).map(r=>r.request.name)}));
}
function splice(base,requests,here){
 const marker="const here=path.dirname(fileURLToPath(import.meta.url));",a=base.indexOf("export function writeProjection("),b=base.indexOf(marker,a);
 if(a<0||b<a||base.indexOf("export function writeProjection(",a+1)>=0)throw Error("projection splice anchor");
 return base.slice(0,a)+"const requests="+JSON.stringify(requests)+";\n"+collectBatch.toString()+"\nexport "+newWrite.toString().replace("function newWrite(","function writeProjection(")+"\nconst here="+JSON.stringify(here)+";"+base.slice(b+marker.length);
}
function testBatch(raw,base,s,l,m,collectBatch,splice,requests){
 const core=new Function(base.slice(base.indexOf("const PIN="),base.indexOf("\nimport fs from"))+"\nreturn {project,select,rewriteForProjection,pack};")();
 const patched=core.rewriteForProjection(s,l,m,"file:///fixture.mjs");
 const parser=new Function(patched.slice(0,patched.indexOf("\nimport fs from"))+"\nreturn {exprEdges,addDeclarations,packTagged};")();
 let checks=0,negative=0;const ck=(x,msg)=>{if(!x)throw Error(msg);checks++},reject=(f)=>{let bad=false;try{f()}catch{bad=true}ck(bad,"negative control");negative++};
 const rows=raw.trimEnd().split("\n").map(JSON.parse),names=[[]],expr=[],packed=[],decls=new Map();
 for(const r of rows)if("in"in r){const a=r.str||r.num;ck(r.in===names.length,"name order");names.push([...names[a.pre],r.str?a.str:a.i])}
 const nameOf=i=>names[i],find=s=>names.findIndex(a=>JSON.stringify(a)===JSON.stringify(s.split(".")));
 for(const r of rows){
  if("meta"in r||"in"in r||"il"in r)continue;
  if("ie"in r){ck(r.ie===expr.length,"expr order");expr.push(r);packed.push(parser.packTagged(parser.exprEdges(r,find),r));continue}
  const k=Object.keys(r)[0],v=r[k],norm=k==="inductive"?[{inductive:{types:v.types??v.inductiveVals,ctors:v.ctors??v.constructorVals,recs:v.recs??v.recursorVals}}]:(Array.isArray(v)?v:[v]).map(x=>({[k]:x}));
  for(const q of norm)parser.addDeclarations(q,(id,kind,edges,mutualBlock=[])=>decls.set(id,{kind,edges,mutualBlock}));
 }
 const wanted=[...decls].filter(([id,v])=>["thm","def","opaque","ctor","inductive","rec","quot","axiom"].includes(v.kind)&&names[id].every(x=>typeof x==="string"&&!x.includes("."))).map(([id,v])=>({id,name:names[id].join("."),kind:v.kind,...(["def","thm","opaque"].includes(v.kind)?{type:v.edges[0],value:v.edges[1]}:{})}));
 const ctx={decls,nameOf,read:i=>packed[i],n:expr.length,challenge:false};
 const reports=collectBatch(wanted,ctx,core.project,core.select);
 function oracle(seed){
  const seen=new Set(),stack=[seed],refs=new Map();while(stack.length){const i=stack.pop();if(seen.has(i))continue;seen.add(i);const r=expr[i];let children=[],targets=[];
   if(r.const)targets.push(["explicit_const",r.const.name]);
   else if(r.app)children=[r.app.fn,r.app.arg];
   else if(r.lam||r.forallE){const a=r.lam||r.forallE;children=[a.type,a.body]}
   else if(r.letE)children=[r.letE.type,r.letE.value,r.letE.body];
   else if(r.proj){children=[r.proj.struct];targets.push(["projection_carrier",r.proj.typeName])}
   else if(r.mdata)children=[r.mdata.expr];
   else if("natVal"in r)targets.push(["literal_primitive",find("Nat")]);
   else if("strVal"in r)targets.push(["literal_primitive",find("Char.ofNat")],["literal_primitive",find("String.ofList")]);
   for(const [k,id] of targets){const key=k+":"+id;if(!refs.has(key))refs.set(key,new Set());refs.get(key).add(i)}stack.push(...children);
  }return {seen,refs};
 }
 let roleCount=0,refCount=0,ctors=0,inductives=0,recursors=0,ruleRhs=0,structuralRows=0;
 for(const r of reports){const d=decls.get(r.id);ck(JSON.stringify(r.encodedRootsAndStructuralEdges)===JSON.stringify(d.edges),"raw roots");ck(JSON.stringify(r.mutualBlock.map(v=>v.id))===JSON.stringify(d.mutualBlock),"mutual metadata");
  if(r.kind==="ctor")ctors++;if(r.kind==="inductive")inductives++;if(r.kind==="rec")recursors++;if(!["def","thm","opaque"].includes(r.kind)){ck(r.value===null,"non-value not proof");ck(JSON.stringify(r.structural.map(e=>e.encoded))===JSON.stringify(d.edges.slice(1)),"structural edges");for(const e of r.structural){structuralRows++;ck(e.encoded===d.edges[e.edgeIndex],"structural index");if(e.encoded<0){ck(e.target===-e.encoded-1&&JSON.stringify(e.nameParts)===JSON.stringify(nameOf(e.target)),"structural target")}else{ruleRhs++;ck(r.kind==="rec"&&e.kind==="recursor_rule_rhs","structural rhs kind")}}}
  for(const [p,seed] of [[r.type,d.edges[0]-1],...(r.value?[[r.value,d.edges[1]-1]]:[]),...r.structural.filter(e=>e.encoded>0).map(e=>[e.expression,e.encoded-1])]){roleCount++;const a=oracle(seed);ck(p.expressionRoot===seed&&p.expressionsRead===a.seen.size&&p.references.length===a.refs.size,"role closure");for(const e of p.references){refCount++;const q=a.refs.get(e.kind+":"+e.target);ck(q?.has(e.witnessExpression)&&q.size===e.distinctExpressionRecords,"exact witness/count");ck(JSON.stringify(e.nameParts)===JSON.stringify(nameOf(e.target)),"tagged target")}}
 }
 ck(ctors>0&&inductives>0&&recursors>0&&ruleRhs>0,"actual inductive/constructor/recursor fixture");
 const first=wanted.find(x=>x.value!==undefined);ck(!!first,"value fixture");
 reject(()=>collectBatch([first,first],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,id:first.id+1}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,value:first.value+1}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,kind:"ctor"}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,name:"ABSENT"}],ctx,core.project,core.select));
 ck(collectBatch([{name:"ABSENT",kind:"thm"}],ctx,core.project,core.select)[0].status==="NOT_EXPORTED_BY_EXACT_NAME","optional exact absent");
 ck(collectBatch([{...first,id:first.id+1,type:first.type+1}],{...ctx,challenge:true},core.project,core.select)[0].id===first.id,"challenge independent IDs");
 const generated=splice(base,requests,"/fixture/dep");
 ck(generated.includes("export function writeProjection(")&&generated.includes('const here="/fixture/dep";'),"driver splice");
 ck(requests.length===71&&requests.filter(r=>r.id!==undefined).length===71,"target census");
 return {checks,negative,expressions:expr.length,declarations:decls.size,targets:wanted.length,constructors:ctors,inductives,recursors,ruleRhs,structuralRows,roles:roleCount,referenceWitnesses:refCount};
}
function readPeer(name,sha){const b=fs.readFileSync(path.join(here,name));if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob "+name);return b.toString("utf8")}
const base=readPeer("rh_targeted_role_witness.mjs","9a3e8b56a0df0b37cb693575742080284ebf302f");
const args=process.argv.slice(2);
if(args[0]==="verify-manifest"){const expected=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e"];const inputs=args.slice(1);if(inputs.length!==3)throw Error("three reports required");const docs=inputs.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==expected[i])throw Error("input blob "+p);return JSON.parse(b.toString("utf8"))});const x=derive(docs);if(JSON.stringify(x.requests)!==JSON.stringify(requests))throw Error("manifest mismatch");console.log(JSON.stringify({...x,requests:undefined,count:x.requests.length},null,2));}
else if(args[0]==="test"){const raw=fs.readFileSync(args[1]);if(crypto.createHash("sha1").update("blob "+raw.length+"\0").update(raw).digest("hex")!=="d3cd35f1313b4e78b5fded9886e450112aa75def")throw Error("fixture hash");console.log(JSON.stringify(testBatch(raw.toString("utf8"),base,readPeer("rh_stream_export_closure.mjs","bffe89b20ff5e297d921443492e918933c8e0d92"),readPeer("rh_locality_frontier_retry.mjs","336ea4ba85ba9d81235313e44f3430c112c76c45"),readPeer("rh_mutual_metadata_closure.mjs","a6d43d873703f5e632df199ac6165ed13450c3bd"),collectBatch,splice,requests),null,2));}
else{if(!args.includes("--out"))throw Error("use --out DIR");const tmp=fs.mkdtempSync(path.join(os.tmpdir(),"rh-frontier-driver-"));try{const p=path.join(tmp,"driver.mjs");fs.writeFileSync(p,splice(base,requests,here));const c=spawnSync(process.execPath,[p,...args],{stdio:"inherit"});if(c.error)throw c.error;if(c.status!==0)throw Error("combined driver "+c.status+" "+c.signal)}finally{fs.rmSync(tmp,{recursive:true,force:true})}}
