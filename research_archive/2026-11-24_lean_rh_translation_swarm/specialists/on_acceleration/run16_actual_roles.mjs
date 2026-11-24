// RUN16 2026-11-24. Pin: https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005
// Upstream HEAD checked 9282d3a102c4aff0e6026746db2a8990f5d9cddd, not adopted.
// Git blob linked inputs (three disjoint projections):
// 64b935e4ef309f6c555912a377012c7708eda510 https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json
// d04e0fb24160d3ee1be54cd50082f59526864d4e https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-next-root-roles-20261124/outputs/solution_next_root_roles.json
// d823c364f446f5066dbbc61f7e9cf9c891fcbdb2 https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json
// 47-owner older file d49fbcc22a2382039986b09ff91dd11af2ef2e7b returned empty content
// in UTF-8, base64 and line-range fetch; not re-audited. Thus no full 142-owner union claim.
// All 70 claimed immediate incoming witnesses replayed, NOT full transitive root-path verification.
// Deduction.CharacterBalanceMoves.triv remains owner-bound, not root-bound.
// RHS slot 3 of OpenLiteratureStatements.rec has positive encoded expression root 12992065,
// distinct from package slots and from ordinary theorem values. Four RHS references retained.
// Code-mode actual report result (first/repeated in-process, not OS cold/warm; RSS not exposed):
/*
{
  "status": "PARTIAL_EXPORTED_ROLE_EVIDENCE_NOT_KERNEL_RECHECK",
  "summary": [
    {
      "sha": "64b935e4ef309f6c555912a377012c7708eda510",
      "owners": 6,
      "counts": {
        "type": 33,
        "value": 76,
        "structural": 0,
        "rhs": 0
      },
      "missingSlots": 6
    },
    {
      "sha": "d04e0fb24160d3ee1be54cd50082f59526864d4e",
      "owners": 18,
      "counts": {
        "type": 370,
        "value": 1866,
        "structural": 5,
        "rhs": 0
      },
      "missingSlots": 0
    },
    {
      "sha": "d823c364f446f5066dbbc61f7e9cf9c891fcbdb2",
      "owners": 71,
      "counts": {
        "type": 601,
        "value": 1912,
        "structural": 30,
        "rhs": 4
      },
      "missingSlots": 0
    }
  ],
  "owners": 95,
  "edges": 4897,
  "checks": 10272,
  "matchedImmediateIncoming": 70,
  "unboundProbe": 856978,
  "reverseMeanMs": {
    "independent": 0.384,
    "shared": 0.056,
    "golden": 0.07,
    "periodic": 0.06
  },
  "rhs": [
    [
      550025,
      3,
      550010
    ],
    [
      550025,
      3,
      549946
    ],
    [
      550025,
      3,
      550021
    ],
    [
      550025,
      3,
      550020
    ]
  ]
}
*/
// Native SQLite certificate source blob 2535754b23c53a5e24b4dad172556e366121c7c6,
// commit 56542e45ec5ae7d3a5e9387b9771aa4f0949cc02; executed: python durable_roles.py test.
// SYNTHETIC 3300 owners, 6598 edges, zero oracle discrepancies; 2 process-exit crash controls
// passed before/after commit, integrity_check passed both, late conflict rolled back,
// idempotent replay, invalid blob rejected, synthetic RHS and legacy slot parsing passed.
// Single-trial native ms: incremental 26.574; rebuild 307.692; independent reverse 197.364;
// shared 49.945; golden 42.114; periodic 46.997; reopened shared 44.631.
// Peak parent process RSS 111408 KiB including fixture and oracle; no isolated per-mode RSS.
// Reopen is not OS cold cache; no statistical scheduling claim. Native full authentic batch not run.
// SQLite WAL/FULL provides transaction crash recovery under SQLite filesystem assumptions;
// process-exit test is not power-loss or storage corruption simulation. B-tree work is logarithmic,
// final returned tuple O(reached V), JSON whole-batch parsing is O(batch bytes) RAM;
// not yet a full memory-bounded stream or linear-time B-tree construction.
// Static source references, exact export-role evidence, and independent kernel replay are distinct.
// Read protocol, queue, expansion, previous 15 lane patches, AGENTS, research state/log/protocol,
// continuity and physics-only CI checkpoint #397. No changes outside acceleration lane.
// RESUME HERE: retrieve missing 47-owner blob through native runner; run durable ingest on all four
// pinned reports, compare role-labelled occurrence multisets, and stream reverse output rather than
// materializing the tuple. Add RSS per mode and repeated cold/warm trials. HANDOFF TO dependencies,
// kernel, integration, audit, structure and editor. Project OPEN.
function audit(docs,clock=()=>Date.now()){
 const canon=x=>Array.isArray(x)?'['+x.map(canon).join(',')+']':x!==null&&typeof x==='object'?'{'+Object.keys(x).sort().map(k=>JSON.stringify(k)+':'+canon(x[k])).join(',')+'}':JSON.stringify(x);
 let checks=0;const ck=(ok,m)=>{if(!ok)throw Error(m);checks++};const owners=new Map(),ids=new Map(),edges=[],summary=[];
 for(const {sha,a} of docs){
  ck(a.digest==='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'&&a.n===1065214335&&a.root===14065054&&a.status==='AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK','scope');let counts={type:0,value:0,structural:0,rhs:0},missingSlots=0;
  for(const r of a.reports){
   ck(!owners.has(r.id),'duplicate owner in this disjoint projection');owners.set(r.id,r);
   const s=r.encodedRootsAndStructuralEdges,start=r.value===null?1:2;
   if(s)ck(s.length===start+(r.structural||[]).length,'slots');else{missingSlots++;ck(start===2&&!(r.structural||[]).length,'missing package slot data')}
   const add=(role,slot,e,k)=>{const tag=canon([k,e.nameParts]);ck(!ids.has(e.target)||ids.get(e.target)===tag,'tag conflict');ids.set(e.target,tag);edges.push({owner:r.id,target:e.target,role,slot,ref:e});counts[role]++};
   const expr=(role,slot,x)=>{if(s)ck(s[slot]===x.expressionRoot+1,'expression root');for(const e of x.references){ck(Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<a.n&&e.distinctExpressionRecords>0,'witness');add(role,slot,e,e.targetKind)}};
   expr('type',0,r.type);if(r.value)expr('value',1,r.value);
   for(const [j,e] of (r.structural||[]).entries()){const i=j+start;ck(i===e.edgeIndex&&s[i]===e.encoded,'slot');if(e.encoded>0){ck(r.kind==='rec'&&e.kind==='recursor_rule_rhs','rhs');expr('rhs',i,e.expression)}else{ck(e.target===-e.encoded-1,'structural');add('structural',i,e,e.kind)}}
  }summary.push({sha,owners:a.reports.length,counts,missingSlots})
 }
 const latest=docs[2].a.reports,claims=latest.filter(r=>r.request.origin==='authenticated_root_path_frontier');
 for(const r of claims){const i=r.request.incoming;ck(owners.has(i.ownerId)&&edges.some(e=>e.owner===i.ownerId&&e.target===r.id&&e.role===i.role&&(i.role==='structural'?e.slot===i.edgeIndex:e.ref.witnessExpression===i.witness)),'incoming '+r.id)}
 ck(claims.length===70&&latest.length===71&&owners.size===95&&edges.length===4897,'counts');
 const rawCount=docs.flatMap(d=>d.a.reports).reduce((sum,r)=>sum+r.type.references.length+(r.value?.references.length||0)+(r.structural||[]).reduce((n,e)=>n+(e.encoded>0?e.expression.references.length:1),0),0);ck(rawCount===edges.length,'role row count');
 const rev=new Map();for(const e of edges){if(!rev.has(e.target))rev.set(e.target,[]);rev.get(e.target).push(e.owner)}
 const walk=seed=>{const seen=new Set(seed),q=[...seen];for(let i=0;i<q.length;i++)for(const n of rev.get(q[i])||[])if(!seen.has(n)){seen.add(n);q.push(n)}return seen};
 const seeds=[...rev.keys()].sort((a,b)=>rev.get(b).length-rev.get(a).length||a-b).slice(0,15);
 const fixed=new Set(seeds);let change=true;while(change){change=false;for(const e of edges)if(fixed.has(e.target)&&!fixed.has(e.owner)){fixed.add(e.owner);change=true}}
 const eq=s=>s.size===fixed.size&&[...s].every(x=>fixed.has(x));
 const phase=(s,k)=>s.map((v,i)=>[v,(i*k)%1]).sort((a,b)=>a[1]-b[1]).map(a=>a[0]);
 const modes={independent:()=>new Set(seeds.flatMap(x=>[...walk([x])])),shared:()=>walk(seeds),golden:()=>walk(phase(seeds,2/(3+Math.sqrt(5)))),periodic:()=>walk(phase(seeds,1/24))};
 const query={};for(const [k,f] of Object.entries(modes)){const t=clock();let s;for(let i=0;i<500;i++)s=f();query[k]=(clock()-t)/500;ck(eq(s),'reverse mismatch '+k)}
 const rhs=edges.filter(e=>e.role==='rhs').map(e=>[e.owner,e.slot,e.target]);ck(rhs.length===4&&rhs.every(e=>e[0]===550025&&e[1]===3),'RHS conservation');
 return {status:'PARTIAL_EXPORTED_ROLE_EVIDENCE_NOT_KERNEL_RECHECK',summary,owners:owners.size,edges:edges.length,checks,matchedImmediateIncoming:claims.length,unboundProbe:latest.find(r=>r.request.origin!=='authenticated_root_path_frontier').id,reverseMeanMs:query,rhs};
}
import fs from 'node:fs';
import crypto from 'node:crypto';
import {performance} from 'node:perf_hooks';
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2"];
const files=process.argv.slice(2);if(files.length!==3)throw Error('usage: node run16_actual_roles.mjs direct.json next.json literature.json');
const docs=files.map((p,i)=>{const b=fs.readFileSync(p);const sha=crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(sha!==hashes[i])throw Error('blob mismatch '+p);return {sha,a:JSON.parse(b)}});
const result=audit(docs,()=>performance.now());result.peakRssKiB=process.resourceUsage().maxRSS;console.log(JSON.stringify(result,null,2));
