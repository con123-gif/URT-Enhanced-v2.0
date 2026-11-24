// RUN15 2026-11-24: authenticated incremental role projection, not kernel replay.
// Pin: https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005
// Upstream HEAD observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd, not adopted.
// Inputs (Git blob SHA, actual archived report):
// d49fbcc22a2382039986b09ff91dd11af2ef2e7b https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json
// 64b935e4ef309f6c555912a377012c7708eda510 https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json
// d04e0fb24160d3ee1be54cd50082f59526864d4e https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-next-root-roles-20261124/outputs/solution_next_root_roles.json
// New extraction CI: https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45478579968
// All 18 new exact export IDs are preserved, only proven incoming paths are called root linked.
// Source claims/metadata retained in receipts; archive IDs are not source revision proofs.
// Structural slots and type/value references are distinct; cycles are allowed in this projection.
// Expected incremental O(delta input bytes + delta edges), bounded fields and hash-table assumptions;
// canonical sorting of keys is O(k log k) per object. Reverse and forward O(reached V+E).
// No full graph in memory, only projected graph (71 owners); NOT full-export memory-bound.
// First/repeated timings are V8 in-process, NOT OS cold/warm. RSS unavailable in tool; CLI reports it.
// Atomic validation in memory only; durable process-crash transaction remains OPEN.
// Independent fixed-point oracle checks supplied evidence, not unexported dependencies.
// Result from actual V8 run:
/*
{
  "status": "PARTIAL_AUTHENTICATED_ROLE_DELTA_NOT_KERNEL_RECHECK",
  "before": {
    "owners": 53,
    "edges": 13312,
    "targets": 3268,
    "boundary": 3240,
    "receipts": 53
  },
  "delta": {
    "ownersAdded": 18,
    "edgesAdded": 2241
  },
  "after": {
    "owners": 71,
    "edges": 15553,
    "targets": 3595,
    "boundary": 3556,
    "receipts": 71
  },
  "checks": 177,
  "firstMs": 45,
  "timing": {
    "incremental": {
      "medianMs": 50,
      "samplesMs": [
        50,
        50,
        50,
        46,
        45,
        49,
        60
      ]
    },
    "rebuild": {
      "medianMs": 326,
      "samplesMs": [
        326,
        318,
        330,
        357,
        307,
        313,
        339
      ]
    },
    "retry": {
      "medianMs": 49,
      "samplesMs": [
        50,
        51,
        45,
        49,
        49,
        44,
        61
      ]
    }
  },
  "query": {
    "shared": {
      "meanMs": 0.164,
      "visits": 1123
    },
    "golden": {
      "meanMs": 0.18,
      "visits": 1123
    },
    "periodic": {
      "meanMs": 0.174,
      "visits": 1123
    },
    "independent": {
      "meanMs": 0.566,
      "visits": 1507
    }
  },
  "rootReachableOwners": 23,
  "rootReachableBefore": 13,
  "rootReachableBoundary": 683,
  "optionalObserved": 0,
  "routes": [
    {
      "id": 14065049,
      "name": "UpperTheory.TP.K.tLiftK",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 14065050,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212056
        },
        {
          "owner": 14065050,
          "target": 14065049,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212053
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 14009158,
      "name": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 14065050,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212056
        },
        {
          "owner": 14065050,
          "target": 14009158,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212052
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 13125898,
      "name": "UpperTheory.One.Join.automorphic_window_of_inputs",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 13125901,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212055
        },
        {
          "owner": 13125901,
          "target": 13125899,
          "role": "value",
          "kind": "explicit_const",
          "witness": 997980696
        },
        {
          "owner": 13125899,
          "target": 13125898,
          "role": "value",
          "kind": "explicit_const",
          "witness": 997980685
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 8352348,
      "name": "UpperTheory.BaseChangeIdentities.baseChangeN",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 13125901,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212055
        },
        {
          "owner": 13125901,
          "target": 13125899,
          "role": "value",
          "kind": "explicit_const",
          "witness": 997980696
        },
        {
          "owner": 13125899,
          "target": 8352348,
          "role": "value",
          "kind": "explicit_const",
          "witness": 677083986
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 8026888,
      "name": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 13125901,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212055
        },
        {
          "owner": 13125901,
          "target": 11298208,
          "role": "value",
          "kind": "explicit_const",
          "witness": 997980691
        },
        {
          "owner": 11298208,
          "target": 8026888,
          "role": "value",
          "kind": "explicit_const",
          "witness": 893073824
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 11298207,
      "name": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 13125901,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212055
        },
        {
          "owner": 13125901,
          "target": 11298208,
          "role": "value",
          "kind": "explicit_const",
          "witness": 997980691
        },
        {
          "owner": 11298208,
          "target": 11298207,
          "role": "value",
          "kind": "explicit_const",
          "witness": 893073879
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 11307204,
      "name": "UpperTheory.Zero.LLC.CuspT.type",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 13125901,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212055
        },
        {
          "owner": 13125901,
          "target": 11307205,
          "role": "value",
          "kind": "explicit_const",
          "witness": 901833048
        },
        {
          "owner": 11307205,
          "target": 11307204,
          "role": "value",
          "kind": "explicit_const",
          "witness": 893652253
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 11306966,
      "name": "UpperTheory.Zero.LLC.extDepth",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 13125901,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212055
        },
        {
          "owner": 13125901,
          "target": 11307205,
          "role": "value",
          "kind": "explicit_const",
          "witness": 901833048
        },
        {
          "owner": 11307205,
          "target": 11306966,
          "role": "value",
          "kind": "explicit_const",
          "witness": 893651816
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 550020,
      "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 13125901,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212055
        },
        {
          "owner": 13125901,
          "target": 550021,
          "role": "value",
          "kind": "explicit_const",
          "witness": 12992050
        },
        {
          "owner": 550021,
          "target": 550020,
          "role": "type",
          "kind": "explicit_const",
          "witness": 12992045
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 326947,
      "name": "UpperTheory.EveryCharacter",
      "claim": "authenticated_root_path_frontier",
      "observedRootPath": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058
        },
        {
          "owner": 14065051,
          "target": 13125901,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212055
        },
        {
          "owner": 13125901,
          "target": 11298208,
          "role": "value",
          "kind": "explicit_const",
          "witness": 997980691
        },
        {
          "owner": 11298208,
          "target": 326947,
          "role": "type",
          "kind": "explicit_const",
          "witness": 6497236
        }
      ],
      "withoutStructuralEdges": true,
      "sourceRevision": null
    },
    {
      "id": 2114194,
      "name": "GlobalTheory.CentralExponent.exists_cong_subset",
      "claim": "peer_exact_name_probe_not_root_bound",
      "observedRootPath": null,
      "withoutStructuralEdges": false,
      "sourceRevision": null
    },
    {
      "id": 2114215,
      "name": "GlobalTheory.CentralExponent.isOpen_cong",
      "claim": "peer_exact_name_probe_not_root_bound",
      "observedRootPath": null,
      "withoutStructuralEdges": false,
      "sourceRevision": null
    },
    {
      "id": 2113163,
      "name": "GlobalTheory.SmGL.isSmoothChar_deltaHalf",
      "claim": "peer_exact_name_probe_not_root_bound",
      "observedRootPath": null,
      "withoutStructuralEdges": false,
      "sourceRevision": null
    },
    {
      "id": 521889,
      "name": "GlobalTheory.SmGL.nabs_eq_one",
      "claim": "peer_exact_name_probe_not_root_bound",
      "observedRootPath": null,
      "withoutStructuralEdges": false,
      "sourceRevision": null
    },
    {
      "id": 2117521,
      "name": "GroundTheory.Automorphic.Parabolic.conj_mem_unipotentRadical",
      "claim": "peer_exact_name_probe_not_root_bound",
      "observedRootPath": null,
      "withoutStructuralEdges": false,
      "sourceRevision": null
    },
    {
      "id": 2123770,
      "name": "GroundTheory.Automorphic.Parabolic.leviProj_inv_mul_mem",
      "claim": "peer_exact_name_probe_not_root_bound",
      "observedRootPath": null,
      "withoutStructuralEdges": false,
      "sourceRevision": null
    },
    {
      "id": 868440,
      "name": "Deduction.logDeriv_local",
      "claim": "peer_exact_name_probe_not_root_bound",
      "observedRootPath": null,
      "withoutStructuralEdges": false,
      "sourceRevision": null
    },
    {
      "id": 868834,
      "name": "Deduction.poleData",
      "claim": "peer_exact_name_probe_not_root_bound",
      "observedRootPath": null,
      "withoutStructuralEdges": false,
      "sourceRevision": null
    }
  ]
}
*/
// RESUME HERE: make the role-delta index crash-durable with an fsync/rename journal and
// fault injection, then benchmark native RSS and consume the next authenticated projection.
// HANDOFF TO dependency, kernel, integration, audit, editor, structure. Project OPEN.
function run15(A,B,C,clock=()=>Date.now()){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e",root=14065054,n=1065214335;
 let checks=0;const need=(x,m)=>{if(!x)throw Error(m)}, ck=(x,m)=>{need(x,m);checks++};
 const int=x=>Number.isSafeInteger(x)&&x>=0;
 const canon=x=>Array.isArray(x)?'['+x.map(canon).join(',')+']':x!==null&&typeof x==="object"?'{'+Object.keys(x).sort().map(k=>JSON.stringify(k)+':'+canon(x[k])).join(',')+'}':JSON.stringify(x);
 const bag=xs=>{const m=new Map();for(const x of xs){const k=canon(x);m.set(k,(m.get(k)||0)+1)}return m};
 const equal=(a,b)=>a.size===b.size&&[...a].every(([k,v])=>b.get(k)===v);
 const seteq=(a,b)=>a.size===b.size&&[...a].every(x=>b.has(x));
 const clone=x=>JSON.parse(JSON.stringify(x));
 function envelope(a){need(a.status==="AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK"&&a.digest===digest&&a.n===n&&a.root===root&&a.indexedDeclarations===1484733&&a.bytes===61570595788&&a.meta?.lean?.githash==="819816b2e0a3bf405af45ae5c7af2491d8f5bee6"&&a.meta?.format?.version==="3.1.0"&&(!a.pin||a.pin===pin)&&Array.isArray(a.reports),"archive scope mismatch")}
 function rawEdges(r){return [...["type","value"].flatMap(role=>(r[role]?.references||[]).map(ref=>({owner:r.id,role,ref}))),...(r.structural||[]).map(ref=>({owner:r.id,role:"structural",ref}))]}
 function decode(r){
  const q=r.request||r.source;
  need(r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK"&&int(r.id)&&typeof q?.name==="string"&&(!q.id||q.id===r.id)&&(!q.kind||q.kind===r.kind),"bad owner");
  const noValue=["ctor","inductive"].includes(r.kind);need(["thm","def","ctor","inductive"].includes(r.kind),"unsupported owner kind; fail closed");
  for(const role of ["type","value"]){
   if(role==="value"&&noValue){need(r[role]===null,"invented value");continue}
   need(r[role]&&int(r[role].expressionRoot)&&r[role].expressionRoot<n&&Array.isArray(r[role].references),"bad root");
   for(const e of r[role].references)need(["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&int(e.witnessExpression)&&e.witnessExpression<n&&int(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"invalid expression witness");
  }
  const s=r.structural||[];need(Array.isArray(s)&&(!noValue||s.length>0),"missing structure");
  for(const e of s)need(int(e.edgeIndex)&&e.encoded===-e.target-1,"bad structural edge");
  if(r.encodedRootsAndStructuralEdges){const x=r.encodedRootsAndStructuralEdges,roots=noValue?1:2;need(Array.isArray(x)&&x.length===roots+s.length&&x[0]===r.type.expressionRoot+1&&(noValue||x[1]===r.value.expressionRoot+1)&&s.every((e,i)=>e.edgeIndex===roots+i&&x[e.edgeIndex]===e.encoded),"encoded slot mismatch")}
  need(Array.isArray(r.mutualBlock||[])&&(r.mutualBlock||[]).every(m=>int(m.id)&&Array.isArray(m.nameParts)),"bad mutual metadata");
  const edges=rawEdges(r);
  for(const {role,ref:e} of edges)need(int(e.target)&&typeof (role==="structural"?e.kind:e.targetKind)==="string"&&Array.isArray(e.nameParts)&&e.nameParts.length&&e.nameParts.every(x=>typeof x==="string"||int(x)),"bad tagged target");
  return {r,edges,edgeBag:bag(edges),key:canon([r.kind,r.type.expressionRoot,r.value?.expressionRoot??null,r.mutualBlock||[]])};
 }
 function make(){return {owners:new Map(),rev:new Map(),identity:new Map(),receipts:new Map(),count:0}}
 function merge(g,a,receipt){
  envelope(a);const staged=new Map(),ids=new Map(),notes=new Map();let added=0;
  for(const r of a.reports){
   const d=decode(r),p=staged.get(r.id)||g.owners.get(r.id);
   if(p)need(p.key===d.key&&equal(p.edgeBag,d.edgeBag),"conflicting owner "+r.id);else{staged.set(r.id,d);added+=d.edges.length}
   const rs=notes.get(r.id)||new Map();rs.set(receipt+":"+canon(r),r);notes.set(r.id,rs);
   for(const {role,ref:e} of d.edges){const k=role==="structural"?e.kind:e.targetKind,identity=canon([k,e.nameParts]),old=ids.get(e.target)||g.identity.get(e.target);need(!old||old.key===identity,"identity conflict "+e.target);const own=staged.get(e.target)||g.owners.get(e.target);need(!own||own.r.kind===k,"target owner kind conflict");ids.set(e.target,{key:identity,kind:k,parts:e.nameParts})}
   const ownerIdentity=ids.get(r.id)||g.identity.get(r.id);need(!ownerIdentity||ownerIdentity.kind===r.kind,"owner kind conflict");
  }
  for(const [id,v] of ids)g.identity.set(id,v);
  for(const [id,d] of staged){g.owners.set(id,d);for(const e of d.edges){const t=e.ref.target;if(!g.rev.has(t))g.rev.set(t,[]);g.rev.get(t).push(e)}}
  for(const [id,rs] of notes){if(!g.receipts.has(id))g.receipts.set(id,new Map());for(const [k,r] of rs)g.receipts.get(id).set(k,r)}
  g.count+=added;return {ownersAdded:staged.size,edgesAdded:added};
 }
 function census(g){return {owners:g.owners.size,edges:g.count,targets:g.identity.size,boundary:[...g.identity.keys()].filter(x=>!g.owners.has(x)).length,receipts:[...g.receipts.values()].reduce((a,m)=>a+m.size,0)}}
 function forward(g,seed,allow=()=>true){const seen=new Set([seed]),q=[seed],parents=new Map();for(let i=0;i<q.length;i++)for(const e of g.owners.get(q[i])?.edges||[]){if(!allow(e))continue;const t=e.ref.target;if(!seen.has(t)){seen.add(t);parents.set(t,e);q.push(t)}}return {seen,parents}}
 function path(f,id){if(!f.seen.has(id))return null;const p=[];while(id!==root){const e=f.parents.get(id);need(e,"broken parent");p.push({owner:e.owner,target:id,role:e.role,kind:e.ref.kind,witness:e.role==="structural"?e.ref.edgeIndex:e.ref.witnessExpression});id=e.owner}return p.reverse()}
 function reverse(g,seeds){const seen=new Set(seeds),q=[...seen];let visits=0;for(let i=0;i<q.length;i++)for(const e of g.rev.get(q[i])||[]){visits++;if(!seen.has(e.owner)){seen.add(e.owner);q.push(e.owner)}}return {seen,visits}}
 function oracle(rows,seeds,back){const seen=new Set(seeds);let changed=true;while(changed){changed=false;for(const r of rows)for(const e of rawEdges(r)){const [from,to]=back?[e.ref.target,e.owner]:[e.owner,e.ref.target];if(seen.has(from)&&!seen.has(to)){seen.add(to);changed=true}}}return seen}
 const phase=(s,f)=>{const b=Array.from({length:64},()=>[]);s.forEach((v,i)=>b[Math.floor(64*((i*f)%1))].push(v));return b.flat()};
 function base(){const g=make();merge(g,A,"A");merge(g,B,"B");return g}
 function verifyIncoming(g,r,f){const i=r.request?.incoming;need(i&&typeof i.owner==="string","missing claimed incoming");const matches=[...g.owners.values()].filter(d=>(d.r.request||d.r.source).name===i.owner);need(matches.length===1,"ambiguous incoming owner "+i.owner);const d=matches[0];need(f.seen.has(d.r.id),"incoming owner not observed from root");const e=d.edges.find(e=>e.role===i.role&&e.ref.target===r.id&&e.ref.witnessExpression===i.witness);need(e,"missing claimed incoming witness "+r.id);return [...path(f,d.r.id),{owner:d.r.id,target:r.id,role:e.role,kind:e.ref.kind,witness:i.witness}]}
 ck(A.reports.length===47&&B.reports.length===6&&C.reports.length===18,"input counts");
 const all=[...A.reports,...B.reports,...C.reports],g=base(),before=census(g),f0=forward(g,root);
 const t0=clock(),delta=merge(g,C,"C"),firstMs=clock()-t0,after=census(g);
 ck(before.owners===53&&before.edges===13312&&delta.ownersAdded===18&&delta.edgesAdded===2241&&after.owners===71&&after.edges===15553,"census");
 const expected=bag(all.flatMap(rawEdges));ck(equal(expected,bag([...g.rev.values()].flat())),"all role occurrences retained");
 const f=forward(g,root);ck(seteq(f.seen,oracle(all,[root],false)),"forward oracle");
 const term=forward(g,root,e=>e.role!=="structural");
 const routes=C.reports.map(r=>{
  const isClaim=r.request.origin==="authenticated_root_path_frontier";
  const route=isClaim?verifyIncoming(g,r,f0):path(f,r.id);
  if(isClaim)ck(route&&f.seen.has(r.id),"root witness "+r.id);
  if(route)for(const p of route)ck(g.owners.get(p.owner).edges.some(e=>e.ref.target===p.target&&e.role===p.role&&e.ref.kind===p.kind&&(p.role==="structural"?e.ref.edgeIndex:e.ref.witnessExpression)===p.witness),"route replay");
  return {id:r.id,name:r.request.name,claim:r.request.origin,observedRootPath:route,withoutStructuralEdges:term.seen.has(r.id),sourceRevision:r.request.source?.rev??null};
 });
 const st=C.reports.find(r=>r.kind==="inductive");
 ck(st.value===null&&st.structural.length===5&&new Set(st.structural.map(e=>e.target)).size===3,"inductive repeated slots");
 ck(g.owners.get(st.id).edges.length===5,"preserve structural multiplicity");
 const seed=[...g.rev.keys()].sort((u,v)=>g.rev.get(v).length-g.rev.get(u).length||u-v).slice(0,15);
 for(const id of [...g.owners.keys(),...seed])ck(seteq(reverse(g,[id]).seen,oracle(all,[id],true)),"reverse oracle "+id);
 const truth=oracle(all,seed,true),modes={shared:()=>reverse(g,seed),golden:()=>reverse(g,phase(seed,2/(3+Math.sqrt(5)))),periodic:()=>reverse(g,phase(seed,1/24)),independent:()=>{let seen=new Set(),visits=0;for(const id of seed){const r=reverse(g,[id]);for(const x of r.seen)seen.add(x);visits+=r.visits}return{seen,visits}}};
 const query={};for(const [k,fn] of Object.entries(modes)){let r;const t=clock();for(let i=0;i<500;i++)r=fn();query[k]={meanMs:(clock()-t)/500,visits:r.visits};ck(seteq(r.seen,truth),"schedule "+k)}
 const again=merge(g,C,"C");ck(!again.ownersAdded&&!again.edgesAdded&&census(g).receipts===71,"idempotent");
 function negative(mut,label){const prev=canon(census(g));let rejected=false;try{merge(g,mut,"bad")}catch{rejected=true}ck(rejected&&canon(census(g))===prev&&equal(expected,bag([...g.rev.values()].flat())),label)}
 let x=clone(C);x.reports[8].structural.pop();negative(x,"structural deletion rejected");
 x=clone(C);x.reports[0].value.references=[];negative(x,"proof reference deletion rejected");
 x=clone(C);x.digest="0".repeat(64);negative(x,"cross archive rejected");
 x=clone(C.reports[0]);x.request.incoming.witness++;let bad=false;try{verifyIncoming(g,x,f0)}catch{bad=true}ck(bad,"false incoming rejected");
 x=clone(C.reports[0]);x.request.incoming.owner="not.a.real.owner";bad=false;try{verifyIncoming(g,x,f0)}catch{bad=true}ck(bad,"missing incoming owner rejected");
 const samples={incremental:[],rebuild:[],retry:[]};
 for(let i=0;i<7;i++){const b=base();let t=clock();merge(b,C,"C");samples.incremental.push(clock()-t);t=clock();merge(b,C,"C");samples.retry.push(clock()-t);t=clock();const rebuilt=base();merge(rebuilt,C,"C");samples.rebuild.push(clock()-t);ck(equal(bag([...b.rev.values()].flat()),bag([...rebuilt.rev.values()].flat())),"rebuild equality")}
 const timing=Object.fromEntries(Object.entries(samples).map(([k,v])=>[k,{medianMs:v.slice().sort((a,b)=>a-b)[3],samplesMs:v}]));
 return {status:"PARTIAL_AUTHENTICATED_ROLE_DELTA_NOT_KERNEL_RECHECK",before,delta,after,checks,firstMs,timing,query,rootReachableOwners:[...g.owners.keys()].filter(id=>f.seen.has(id)).length,rootReachableBefore:[...g.owners.keys()].filter(id=>f0.seen.has(id)&&!C.reports.some(r=>r.id===id)).length,rootReachableBoundary:[...f.seen].filter(id=>!g.owners.has(id)).length,optionalObserved:routes.filter(r=>r.claim==="peer_exact_name_probe_not_root_bound"&&r.observedRootPath).length,routes};
}
import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
const files=process.argv.slice(2), hashes=["d49fbcc22a2382039986b09ff91dd11af2ef2e7b","64b935e4ef309f6c555912a377012c7708eda510","d04e0fb24160d3ee1be54cd50082f59526864d4e"];
if(files.length!==3)throw Error("usage: node role_delta_run15.mjs frontier.json direct.json next.json");
const inputs=files.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==hashes[i])throw Error("blob mismatch "+p);return JSON.parse(b)});
const result=run15(...inputs,()=>performance.now());result.peakRssKiB=process.resourceUsage().maxRSS;console.log(JSON.stringify(result,null,2));
