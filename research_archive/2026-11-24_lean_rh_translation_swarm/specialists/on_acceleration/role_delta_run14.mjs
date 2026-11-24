// RUN14, 2026-11-24. Transactional same-archive role projection merge; PARTIAL.
// Source pin https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005
// Upstream HEAD observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd; not adopted.
// Inputs: https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json
// and https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json
// Existing genuine 47 + 6 reports reused as arrival delta, NOT new extraction or observed edits.
// No newer typed projection directory observed. Integration 20:00 requests six additional roots;
// Landau RUN9 requests logDeriv_local, poleData_abstract, poleData. Dependency lane owns export.
// Scope is archive digest and format, not a cross-source-revision join. One source claim is from
// a different revision and unbound requests stay unbound; provenance is preserved, not promoted.
// Expected O(delta bytes + delta records) hash-table work, bounded record field count assumed;
// canonical object key sorting adds O(k log k) per object. Reverse queries O(affected V+E+seeds).
// Entire projected graph resident; this is not a memory-bounded full-export index. Atomicity
// covers validation failures before publication, not process failure, disk crash or concurrent writes.
// Conventional rebuild uses same exact validator; independent full scans test reverse closure.
// Timing V8 Date.now first/repeated in-process, not OS cold/warm. No RSS exposed; CLI reports RSS.
// No proof term checking, no cache reuse authorization, no missing-edge claims beyond supplied records.
// Actual executed V8 result:
// {
//   "status": "PARTIAL_SAME_ARCHIVE_ROLE_DELTA_NOT_KERNEL_RECHECK",
//   "before": {
//     "owners": 47,
//     "edges": 13203,
//     "targets": 3255,
//     "boundary": 3239,
//     "receipts": 47
//   },
//   "delta": {
//     "ownersAdded": 6,
//     "edgesAdded": 109,
//     "duplicateOwners": 0,
//     "newReceipts": 6
//   },
//   "after": {
//     "owners": 53,
//     "edges": 13312,
//     "targets": 3268,
//     "boundary": 3240,
//     "receipts": 53
//   },
//   "first": {
//     "ownersAdded": 47,
//     "edgesAdded": 13203,
//     "duplicateOwners": 0,
//     "newReceipts": 47
//   },
//   "again": {
//     "ownersAdded": 0,
//     "edgesAdded": 0,
//     "duplicateOwners": 6,
//     "newReceipts": 0
//   },
//   "alternate": {
//     "ownersAdded": 0,
//     "edgesAdded": 0,
//     "duplicateOwners": 6,
//     "newReceipts": 6
//   },
//   "checks": 83,
//   "sourceClaims": {
//     "differentRevision": [
//       {
//         "id": 341183,
//         "name": "DirichletCharacter.LFunction_modOne_eq",
//         "rev": "0df444a360eaa60ab8c11dca51a86af692955474"
//       }
//     ],
//     "noSourceRevision": 36,
//     "pinned": 16
//   },
//   "timing": {
//     "incremental": {
//       "medianMs": 1,
//       "samplesMs": [
//         1,
//         2,
//         1,
//         2,
//         1,
//         2,
//         1,
//         1,
//         1,
//         1,
//         1,
//         1,
//         1,
//         2,
//         1
//       ]
//     },
//     "rebuild": {
//       "medianMs": 127,
//       "samplesMs": [
//         131,
//         127,
//         124,
//         128,
//         128,
//         138,
//         126,
//         126,
//         127,
//         127,
//         127,
//         132,
//         127,
//         125,
//         127
//       ]
//     },
//     "retry": {
//       "medianMs": 1,
//       "samplesMs": [
//         1,
//         1,
//         2,
//         1,
//         2,
//         1,
//         2,
//         2,
//         1,
//         1,
//         1,
//         1,
//         1,
//         1,
//         1
//       ]
//     }
//   },
//   "query": {
//     "shared": {
//       "meanMs": 0.084,
//       "visits": 920
//     },
//     "golden": {
//       "meanMs": 0.09,
//       "visits": 920
//     },
//     "periodic": {
//       "meanMs": 0.091,
//       "visits": 920
//     },
//     "independent": {
//       "meanMs": 0.295,
//       "visits": 1232
//     }
//   }
// }
// RESUME HERE: obtain next authenticated role projection for integration 20:00 and Landau RUN9;
// replay as same-archive delta, preserve cross-revision source claims as unbound until reconciled,
// then test crash-durable transactions and RSS on native Node. HANDOFF TO dependency, kernel, integration, audit, editor. OPEN.

function run14(inputs,clock=()=>Date.now()){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e",n=1065214335;
 const need=(p,m)=>{if(!p)throw Error(m)}, tests=[];
 const ok=(p,m)=>{need(p,m);tests.push(m)};
 const canon=x=>Array.isArray(x)?'['+x.map(canon).join(',')+']':x!==null&&typeof x==="object"?'{'+Object.keys(x).sort().map(k=>JSON.stringify(k)+':'+canon(x[k])).join(',')+'}':JSON.stringify(x);
 const int=x=>Number.isSafeInteger(x)&&x>=0;
 const eqset=(a,b)=>a.size===b.size&&[...a].every(x=>b.has(x));
 const bag=xs=>{const m=new Map();for(const x of xs){const k=canon(x);m.set(k,(m.get(k)||0)+1)}return m};
 const eqbag=(a,b)=>a.size===b.size&&[...a].every(([k,v])=>b.get(k)===v);
 function envelope(a){need(a.status==="AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK"&&a.digest===digest&&a.n===n&&a.root===14065054&&a.indexedDeclarations===1484733&&a.bytes===61570595788&&a.meta?.lean?.githash==="819816b2e0a3bf405af45ae5c7af2491d8f5bee6"&&a.meta?.format?.version==="3.1.0"&&(!a.pin||a.pin===pin)&&Array.isArray(a.reports),"archive scope mismatch")}
 function decode(row){
  need(row.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK"&&int(row.id)&&typeof row.kind==="string","bad owner");
  const q=row.request||row.source;need(q&&typeof q.name==="string"&&(!q.id||q.id===row.id),"bad owner request");
  const edges=[], roots=[];
  for(const role of ["type","value"]){
   const r=row[role];
   if(role==="value"&&row.kind==="ctor"){need(r===null,"invented constructor value");roots.push(null);continue}
   need(r&&int(r.expressionRoot)&&r.expressionRoot<n&&Array.isArray(r.references),"bad "+role+" role");roots.push(r.expressionRoot);
   for(const e of r.references){
    need(["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&int(e.witnessExpression)&&e.witnessExpression<n&&int(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"bad expression witness");
    edges.push({owner:row.id,role,ref:e});
   }
  }
  const structure=row.structural||[];need(Array.isArray(structure)&& (row.kind!=="ctor"||structure.length>0),"missing structural role");
  for(const e of structure){need(int(e.edgeIndex)&&e.encoded===-e.target-1,"bad structural witness");edges.push({owner:row.id,role:"structural",ref:e})}
  if(row.encodedRootsAndStructuralEdges){const v=row.encodedRootsAndStructuralEdges;need(Array.isArray(v)&&v.length===(row.kind==="ctor"?1:2)+structure.length&&v[0]===roots[0]+1&&(row.kind==="ctor"||v[1]===roots[1]+1)&&structure.every(e=>v[e.edgeIndex]===e.encoded),"encoded root mismatch")}
  const identities=[];
  for(const {role,ref:e} of edges){const k=role==="structural"?e.kind:e.targetKind;need(int(e.target)&&typeof k==="string"&&Array.isArray(e.nameParts)&&e.nameParts.length&&e.nameParts.every(x=>typeof x==="string"||int(x)),"bad tagged target");identities.push([e.target,{kind:k,parts:canon(e.nameParts)}])}
  need(Array.isArray(row.mutualBlock||[])&&(row.mutualBlock||[]).every(m=>int(m.id)&&Array.isArray(m.nameParts)&&m.nameParts.every(x=>typeof x==="string"||int(x))),"bad mutual metadata");
  return {row,edges,roots,identities,edgeBag:bag(edges),metaBag:bag(row.mutualBlock||[])};
 }
 function create(){return {owners:new Map(),identities:new Map(),rev:new Map(),edgeCount:0,receipts:new Map()}}
 function merge(g,a,receipt){
  envelope(a);need(typeof receipt==="string"&&receipt.length>0,"missing provenance label");
  // Validate entire delta against staged and committed state before publishing it.
  const pending=new Map(),identities=new Map(),notes=new Map();let duplicates=0,edges=0;
  for(const row of a.reports){
   const d=decode(row),prev=pending.get(row.id)||g.owners.get(row.id);
   if(prev){need(prev.row.kind===row.kind&&canon(prev.roots)===canon(d.roots)&&eqbag(prev.edgeBag,d.edgeBag)&&eqbag(prev.metaBag,d.metaBag),"conflicting owner "+row.id);duplicates++}
   else {pending.set(row.id,d);edges+=d.edges.length}
   const pr=notes.get(row.id)||new Map();const pk=receipt+":"+canon(row);pr.set(pk,{receipt,row});notes.set(row.id,pr);
   for(const [id,x] of d.identities){const old=identities.get(id)||g.identities.get(id);need(!old||old.kind===x.kind&&old.parts===x.parts,"conflicting tagged identity "+id);const own=pending.get(id)||g.owners.get(id);need(!own||own.row.kind===x.kind,"target/owner kind mismatch");if(!old)identities.set(id,x)}
   const iden=identities.get(row.id)||g.identities.get(row.id);need(!iden||iden.kind===row.kind,"owner/target kind mismatch");
  }
  // A repeated receipt is idempotent per exact row; different source claims remain separate.
  for(const [id,x] of identities)g.identities.set(id,x);
  for(const [id,d] of pending){g.owners.set(id,d);for(const e of d.edges){const t=e.ref.target;if(!g.rev.has(t))g.rev.set(t,[]);g.rev.get(t).push(e)}}
  let newReceipts=0;
  for(const [id,p] of notes){if(!g.receipts.has(id))g.receipts.set(id,new Map());const out=g.receipts.get(id);for(const [k,v] of p)if(!out.has(k)){out.set(k,v);newReceipts++}}
  g.edgeCount+=edges;
  return {ownersAdded:pending.size,edgesAdded:edges,duplicateOwners:duplicates,newReceipts};
 }
 const reference=(rows,seeds)=>{let seen=new Set(seeds),changed=true;while(changed){changed=false;for(const r of rows){if(seen.has(r.id))continue;if([...(r.type?.references||[]),...(r.value?.references||[]),...(r.structural||[])].some(e=>seen.has(e.target))){seen.add(r.id);changed=true}}}return seen};
 function walk(g,seeds){const s=new Set(seeds),q=[...s];let visits=0;for(let i=0;i<q.length;i++)for(const e of g.rev.get(q[i])||[]){visits++;if(!s.has(e.owner)){s.add(e.owner);q.push(e.owner)}}return {s,visits}}
 const phase=(s,f)=>{const b=Array.from({length:64},()=>[]);s.forEach((v,i)=>b[Math.floor(64*((i*f)%1))].push(v));return b.flat()};
 function baseline(a,b){const g=create();merge(g,a,"A");merge(g,b,"B");return g}
 function census(g){return {owners:g.owners.size,edges:g.edgeCount,targets:g.identities.size,boundary:[...g.identities.keys()].filter(x=>!g.owners.has(x)).length,receipts:[...g.receipts.values()].reduce((n,m)=>n+m.size,0)}}
 const [a,b]=inputs;envelope(a);envelope(b);need(a.reports.length===47&&b.reports.length===6,"fixture mismatch");
 const g=create();const first=merge(g,a,"A"),before=census(g),delta=merge(g,b,"B"),after=census(g);
 ok(after.owners===53&&after.edges===13312,"real two-projection census");
 const all=[...a.reports,...b.reports],original=bag(all.flatMap(r=>[...["type","value"].flatMap(role=>(r[role]?.references||[]).map(ref=>({owner:r.id,role,ref}))),...(r.structural||[]).map(ref=>({owner:r.id,role:"structural",ref}))]));
 ok(eqbag(original,bag([...g.rev.values()].flat())),"full original edge multiset preserved");
 const again=merge(g,b,"B");ok(again.ownersAdded===0&&again.edgesAdded===0&&again.newReceipts===0,"exact replay idempotent");
 const reversed={...b,reports:b.reports.map(r=>({...r,type:{...r.type,references:r.type.references.slice().reverse()},value:r.value?{...r.value,references:r.value.references.slice().reverse()}:null}))};
 const alternate=merge(g,reversed,"B-reordered");ok(alternate.edgesAdded===0&&alternate.newReceipts===6,"different provenance preserved without edge duplication");
 const negative=(mut,label)=>{const old=canon(census(g));let rejected=false;try{merge(g,mut,"negative")}catch{rejected=true}ok(rejected&&canon(census(g))===old&&eqbag(original,bag([...g.rev.values()].flat())),label)};
 const clone=x=>JSON.parse(JSON.stringify(x));
 let x=clone(b);x.reports[0].value.references=[];negative(x,"missing value reference rejected");
 x=clone(b);x.reports[0].type.expressionRoot++;negative(x,"changed type root rejected");
 x=clone(b);x.reports[0].type.references[0].nameParts=["wrong"];negative(x,"changed tagged identity rejected");
 x=clone(b);x.digest="0".repeat(64);negative(x,"cross archive rejected");
 x=clone(b);x.reports[0].mutualBlock=[];negative(x,"changed mutual metadata rejected");
 x=clone(a);const ctor=x.reports.find(r=>r.kind==="ctor");ctor.structural.pop();negative(x,"dropped structural occurrence rejected");
 // Atomicity on a genuine fresh row followed by a bad repeated owner.
 const ag=create();merge(ag,a,"A");x=clone(b);x.reports.push({...x.reports[0],type:{...x.reports[0].type,expressionRoot:x.reports[0].type.expressionRoot+1}});let reject=false;try{merge(ag,x,"bad")}catch{reject=true}
 ok(reject&&canon(census(ag))===canon(before),"late conflict leaves base unchanged");
 const seeds=[...g.rev.keys()].sort((u,v)=>g.rev.get(v).length-g.rev.get(u).length||u-v).slice(0,15);
 for(const s of [...g.owners.keys(),...seeds])ok(eqset(walk(g,[s]).s,reference(all,[s])),"reverse oracle "+s);
 const oracle=reference(all,seeds),modes={shared:()=>walk(g,seeds),golden:()=>walk(g,phase(seeds,1/((1+Math.sqrt(5))/2)**2)),periodic:()=>walk(g,phase(seeds,1/24)),independent:()=>{let s=new Set(),visits=0;for(const seed of seeds){const r=walk(g,[seed]);visits+=r.visits;for(const k of r.s)s.add(k)}return{s,visits}}};
 const times={};
 for(const [name,f] of Object.entries(modes)){let r;const t=clock();for(let i=0;i<1000;i++)r=f();const elapsed=clock()-t;ok(eqset(r.s,oracle),"schedule "+name);times[name]={meanMs:elapsed/1000,visits:r.visits}}
 const samples={incremental:[],rebuild:[],retry:[]};
 for(let i=0;i<15;i++){const base=create();merge(base,a,"A");let t=clock();merge(base,b,"B");samples.incremental.push(clock()-t);t=clock();merge(base,b,"B");samples.retry.push(clock()-t);t=clock();const rebuilt=baseline(a,b);samples.rebuild.push(clock()-t);need(canon(census(base))===canon(census(rebuilt))&&eqbag(bag([...base.rev.values()].flat()),bag([...rebuilt.rev.values()].flat())),"rebuild inequality")}
 const timing=Object.fromEntries(Object.entries(samples).map(([k,v])=>[k,{medianMs:v.slice().sort((a,b)=>a-b)[7],samplesMs:v}]));
 const sourceClaims=all.map(r=>({id:r.id,name:(r.request||r.source).name,rev:r.request?.source?.rev||r.source?.pin||null}));
 return {status:"PARTIAL_SAME_ARCHIVE_ROLE_DELTA_NOT_KERNEL_RECHECK",before,delta,after,first,again,alternate,checks:tests.length,sourceClaims:{differentRevision:sourceClaims.filter(x=>x.rev&&x.rev!==pin),noSourceRevision:sourceClaims.filter(x=>!x.rev).length,pinned:sourceClaims.filter(x=>x.rev===pin).length},timing,query:times};
}

import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
const paths=process.argv.slice(2), hashes=["d49fbcc22a2382039986b09ff91dd11af2ef2e7b","64b935e4ef309f6c555912a377012c7708eda510"];
if(paths.length!==2)throw Error("usage: node role_delta_run14.mjs solution_frontier_roles.json solution_direct_roles.json");
const inputs=paths.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==hashes[i])throw Error("input blob mismatch "+p);return JSON.parse(b)});
const out=run14(inputs,()=>performance.now());out.peakRssKiB=process.resourceUsage().maxRSS;console.log(JSON.stringify(out,null,2));
