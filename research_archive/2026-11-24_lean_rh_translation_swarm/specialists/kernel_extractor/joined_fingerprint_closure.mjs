#!/usr/bin/env node
/* RH kernel extractor RUN5 — 2026-11-24 11:08 UTC.
RESULT PARTIAL: joined content + role-closure signatures; actual lean4export sample
executed in functions V8. NOT RH kernel data. No cache reuse authorization.

Reproduce with Node:
  git -C lean4export show 15f6055e299ad5b89345e533cc2192f4cc00f659:examples/Nat.add_succ.ndjson > sample.ndjson
  node joined_fingerprint_closure.mjs sample.ndjson
Pinned fixture Git blob d3cd35f1313b4e78b5fded9886e450112aa75def,
reference fingerprint eac6c9dd4ba78ca366d291573e52e6f69da62e58,
peer projection 6727688a7bbcda69dd7d719d7a1f74efde551fdc.
*/
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import {createHash} from 'node:crypto';
import {execFileSync} from 'node:child_process';
import {projectBatch,declarationRoots} from '../../dependencies/rh_direct_dependency_projection.mjs';

function join(records,fp,projectBatch,declarationRoots,digest){
 const need=(v,m)=>{if(!v)throw Error(m)};
 const enc=x=>JSON.stringify(x);
 const H=(...p)=>digest(enc(["cathedral-export-content-v1",...p]));
 const meta=records[0]?.meta;
 need(meta?.format?.version==="3.0.0","legacy fixture only");
 need(fp.schema==="cathedral-export-content-v1"&&enc(fp.meta)===enc(meta)&&fp.rows===records.length,"fingerprint scope mismatch");
 const names=new Map([[0,{id:H("anonymous"),parts:[]}]]),expr=new Map(),decl=new Map(),groups=[];
 for(const r of records.slice(1)){
  if(Object.hasOwn(r,"in")){
   const k=r.str?"str":"num",a=r[k],p=names.get(a.pre),v=k==="str"?a.str:a.i;
   need(p&&!names.has(r.in),"bad name");
   names.set(r.in,{id:H("name",k,p.id,v),parts:[...p.parts,v]});continue;
  }
  if(Object.hasOwn(r,"il"))continue;
  if(Object.hasOwn(r,"ie")){need(!expr.has(r.ie),"duplicate expression");expr.set(r.ie,r);continue;}
  const k=Object.keys(r)[0],a=r[k];
  const ms=k==="inductive"?[...a.inductiveVals.map(m=>[m,"inductive"]),...a.constructorVals.map(m=>[m,"ctor"]),...a.recursorVals.map(m=>[m,"rec"])]:a.map(m=>[m,k]);
  need(ms.length,"empty group");groups.push(ms.map(([m])=>m.name));
  for(const [m,kind] of ms){need(!decl.has(m.name)&&names.has(m.name),"bad declaration");decl.set(m.name,{m,kind});}
 }
 const id=n=>{need(decl.has(n)&&names.has(n),"unresolved declaration "+n);return names.get(n).id};
 const pmap=new Map();
 for(const r of fp.declarations){need(!pmap.has(r.id)&&/^[0-9a-f]{64}$/.test(r.id)&&/^[0-9a-f]{64}$/.test(r.digest)&&/^[0-9a-f]{64}$/.test(r.groupDigest),"bad fingerprint row");pmap.set(r.id,r);}
 need(pmap.size===decl.size,"fingerprint cardinality");
 const nodes=new Map(),seeds=[],structural=[];
 for(const [n,{m,kind}] of decl){
  const a=id(n),f=pmap.get(a);
  need(f&&f.kind===(kind==="inductive"?"type":kind),"fingerprint identity/kind mismatch");
  need(!nodes.has(a),"duplicate typed name");nodes.set(a,{id:a,parts:names.get(n).parts,kind:f.kind,digest:f.digest,groupDigest:f.groupDigest});
  const p=declarationRoots(kind,m);seeds.push(...p.roots);structural.push(...p.structural);
 }
 const getName=parts=>[...names].find(([n,v])=>enc(v.parts)===enc(parts))?.[0];
 const primitives={Nat:getName(["Nat"]),"Char.ofNat":getName(["Char","ofNat"]),"String.ofList":getName(["String","ofList"])};
 const rowkey=(o,r,k,t)=>enc([id(o),r,k,id(t)]);
 // Independent walk of each supplied expression role. No shared mask.
 const oracle=new Set();
 for(const s of seeds){
  const seen=new Set(),todo=[s.expr];
  while(todo.length){
   const i=todo.pop();if(seen.has(i))continue;seen.add(i);
   const e=expr.get(i);need(e,"missing expression");
   const add=(k,t)=>oracle.add(rowkey(s.owner,s.role,k,t));
   if(e.const)add("explicit_const",e.const.name);
   else if(e.proj){add("projection_carrier",e.proj.typeName);todo.push(e.proj.struct);}
   else if(e.app)todo.push(e.app.fn,e.app.arg);
   else if(e.lam||e.forallE){const a=e.lam||e.forallE;todo.push(a.type,a.body);}
   else if(e.letE)todo.push(e.letE.type,e.letE.value,e.letE.body);
   else if(e.mdata)todo.push(e.mdata.expr);
   else if(Object.hasOwn(e,"natVal"))add("literal_primitive",primitives.Nat);
   else if(Object.hasOwn(e,"strVal")){add("literal_primitive",primitives["Char.ofNat"]);add("literal_primitive",primitives["String.ofList"]);}
   else need(Object.hasOwn(e,"sort")||Object.hasOwn(e,"bvar"),"unknown expression");
  }
 }
 const direct=new Set();
 for(let i=0;i<seeds.length;i+=32){
  const a=projectBatch(seeds.slice(i,i+32),j=>expr.get(j),primitives);
  for(const r of a.rows){const k=rowkey(r.owner,r.role,r.kind,r.target);need(!direct.has(k),"duplicate projected role reference");direct.add(k);}
 }
 need(direct.size===oracle.size&&[...direct].every(k=>oracle.has(k)),"projector/oracle role mismatch");
 const pkg=new Set(direct);
 for(const r of structural)pkg.add(rowkey(r.owner,r.role,"structural",r.target));
 for(const g of groups)for(const n of g.slice(1)){
  pkg.add(rowkey(g[0],"export_group","structural",n));
  pkg.add(rowkey(n,"export_group","structural",g[0]));
 }
 const root=id(getName(["Nat","add_succ"]));
 return {meta,nodes,root,direct,pkg,seeds:seeds.length,structural:structural.length};
}
function closureSignature(graph,edges,digest,mode,root=graph.root){
 const need=(v,m)=>{if(!v)throw Error(m)};
 need(mode==="direct"||mode==="package","bad closure mode");
 const adj=new Map([...graph.nodes.keys()].map(k=>[k,[]]));
 for(const s of edges){const [o,r,k,t]=JSON.parse(s);need(adj.has(o)&&adj.has(t),"missing edge endpoint");adj.get(o).push([s,t]);}
 need(adj.has(root),"missing root");
 const seen=new Set([root]),q=[root],e=[];
 for(let i=0;i<q.length;i++)for(const [s,t] of adj.get(q[i])){e.push(s);if(!seen.has(t)){seen.add(t);q.push(t);}}
 const n=q.map(i=>{let x=graph.nodes.get(i);return [i,x.kind,x.digest,x.groupDigest];}).sort((a,b)=>a[0]<b[0]?-1:a[0]>b[0]?1:0);
 e.sort();
 return {nodes:n.length,roleEdges:e.length,digest:digest(JSON.stringify(["cathedral-serialized-closure-v1",mode,graph.meta,root,n,e]))};
}
function regression(records,makeFP,projectBatch,declarationRoots,digest){
 let checks=0;const ok=(v,m)=>{if(!v)throw Error(m);checks++};
 const rejects=(f,m)=>{let b=false;try{f()}catch(e){b=true;}ok(b,m)};
 const run=(r=records,p=projectBatch)=>join(r,makeFP(r),p,declarationRoots,digest);
 const base=run(),sig=(g,m)=>closureSignature(g,m==="direct"?g.direct:g.pkg,digest,m);
 const d=sig(base,"direct"),p=sig(base,"package");
 ok(base.nodes.size===32&&base.seeds===52&&base.direct.size===116&&base.structural===46,"actual fixture counts");
 ok(d.nodes===27&&p.nodes===32,"closure counts");
 ok(base.nodes.get(base.root).digest==="0e56f47be0ae6b2cffc4763e5f494166630fa594f80f5995b7d6a1837c79be23","root fingerprint");
 const changed=JSON.parse(JSON.stringify(records));
 const target=[...base.nodes.values()].find(n=>JSON.stringify(n.parts)==='["instAddNat"]');
 ok(!!target,"target leaf");
 // Mutate the serialized value (NOT a valid Lean proof mutation).
 // Find exact raw numeric name by constructing its typed hash.
 const names=new Map([[0,digest(JSON.stringify(["cathedral-export-content-v1","anonymous"]))]]);
 for(const r of changed)if(Object.hasOwn(r,"in")){const k=r.str?"str":"num",a=r[k];names.set(r.in,digest(JSON.stringify(["cathedral-export-content-v1","name",k,names.get(a.pre),k==="str"?a.str:a.i])));}
 const leaf=changed.flatMap(r=>Array.isArray(r.def)?r.def:[]).find(m=>names.get(m.name)===target.id);
 ok(leaf&&leaf.value!==leaf.type,"mutatable definition");leaf.value=leaf.type;
 const mut=run(changed),md=sig(mut,"direct"),mp=sig(mut,"package");
 ok(mut.nodes.get(mut.root).digest===base.nodes.get(base.root).digest,"root local fingerprint should stay unchanged");
 ok(mut.nodes.get(target.id).digest!==target.digest,"leaf change detected");
 ok(md.digest!==d.digest&&mp.digest!==p.digest,"transitive change detected");
 const reverse={...base,nodes:new Map([...base.nodes].reverse()),direct:new Set([...base.direct].reverse()),pkg:new Set([...base.pkg].reverse())};
 ok(sig(reverse,"direct").digest===d.digest&&sig(reverse,"package").digest===p.digest,"canonical output order");
 rejects(()=>run(records,(...a)=>{const r=projectBatch(...a);return {...r,rows:r.rows.slice(1)}}),"dropped role rejected");
 rejects(()=>run(records,(...a)=>{const r=projectBatch(...a);return {...r,rows:[...r.rows,...r.rows.slice(0,1)]}}),"duplicate role rejected");
 let bad=makeFP(records);bad.declarations=bad.declarations.slice(1);
 rejects(()=>join(records,bad,projectBatch,declarationRoots,digest),"missing fingerprint rejected");
 bad=makeFP(records);bad.declarations[0].id=bad.declarations[1].id;
 rejects(()=>join(records,bad,projectBatch,declarationRoots,digest),"duplicate fingerprint rejected");
 const missing={...base,nodes:new Map(base.nodes)};missing.nodes.delete(target.id);
 rejects(()=>sig(missing,"package"),"missing endpoint rejected");
 // Dotted strings and nested names can have identical display text, not typed IDs.
 const H=(...x)=>digest(JSON.stringify(["cathedral-export-content-v1",...x])),anon=H("anonymous");
 ok(H("name","str",anon,"a.b")!==H("name","str",H("name","str",anon,"a"),"b"),"typed identity");
 return {checks,fixture:{records:records.length,nodes:base.nodes.size,seeds:base.seeds,projectedRoleRows:base.direct.size,structuralRows:base.structural,packageRoleRows:base.pkg.size},direct:d,package:p,mutation:{localRootUnchanged:true,direct:md,package:mp},scope:"Serialized sample only; not a kernel check, cache authorization, or RH graph"};
}

const here=path.dirname(fileURLToPath(import.meta.url));
const hashBlob=b=>createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");
const sample=fs.readFileSync(process.argv[2]),fpPath=path.join(here,"fingerprint_export.mjs");
if(hashBlob(sample)!=="d3cd35f1313b4e78b5fded9886e450112aa75def"||
 hashBlob(fs.readFileSync(fpPath))!=="eac6c9dd4ba78ca366d291573e52e6f69da62e58"||
 hashBlob(fs.readFileSync(path.join(here,"../../dependencies/rh_direct_dependency_projection.mjs")))!=="6727688a7bbcda69dd7d719d7a1f74efde551fdc")throw Error("pinned blob mismatch");
const rows=sample.toString("utf8").trimEnd().split(/\r?\n/).map(JSON.parse),dir=fs.mkdtempSync(path.join(os.tmpdir(),"rh-join-"));
try{
 const makeFP=r=>{const f=path.join(dir,"sample.ndjson");fs.writeFileSync(f,r.map(x=>JSON.stringify(x)).join("\n")+"\n");return JSON.parse(execFileSync(process.execPath,[fpPath,f],{encoding:"utf8",maxBuffer:64*1024*1024}));};
 console.log(JSON.stringify(regression(rows,makeFP,projectBatch,declarationRoots,s=>createHash("sha256").update(s,"utf8").digest("hex")),null,2));
}finally{fs.rmSync(dir,{recursive:true,force:true});}

/*
RUN5 HANDOFF / source-linked result
Read AGENTS, continuity, research protocol/state/log, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION, latest specialist notes, kernel RUN4, acceleration RUN5,
integration 11:00 and Grok TIER_C + metaprogram audit. CI #363 PASS is physical
orchestrator only. Original RH pin 40e56bab026552e089d7afcfeff08d2defb9c005,
Main blob dbd5db70bc11b35f18fa5751216ab335321e7bfc (rhOfAll), Lean 4.33.1.
Observed upstream cb4dc6e23a6187db392c96664295415c55b6b01e (10:44 UTC),
Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f, Lean 4.37.0-rc1.
Do not mix. Native fixture v2, stream retry and full obligation pool status
paths returned 404 again; no inference of failure. Node exists, no lean/lake,
GitHub DNS failed in native container, public raw download unavailable. Prior
disk-driver real IO test is still outstanding; no redundant download or job.
This is the join follow-up in RUN4, not the acceleration lane's reverse walk.
Correctness: exact typed name digest join is a bijection on declared names
(conditional on collision resistance), rejecting missing/duplicate IDs and kind
disagreement. Independent per-role traversal compares complete sets to the
shared projector. For supplied role roots, each expression is visited once,
its children enqueued, and all constant/projection/literal refs retained. Package
star edges ensure reaching one group member reaches all. Closure BFS includes
every outgoing edge of every reached node. Canonical serialization of reached
typed IDs, kind, local and group digests and distinct role-labelled edges detects
serialized transitive changes even when root's local fingerprint is unchanged,
subject to collision resistance and completeness of supplied role/group adapter.
Canonical sorting is O(Vr log Vr + Er log Er); traversal O(V+E); per-role oracle
cost is sum of reached expression sizes, not global O(N). Memory in-memory
sample only. Exact serialization may change for mathematically equivalent
terms; equality is not proof validity or environment authentication. Scope
metadata not an authenticated source/environment receipt. Use with acceleration
receipt gate, never infer rechecked status. Direct signature includes local
group digests (conservative). No axiom/trust upgrade. Restricted to actual 3.0
fixture; 3.1 RH adapter, quotient package policy and kernel completeness remain
open. Test mutation is deliberately NOT valid Lean; demonstrates detection only.
Actual execution: V8, exact connector-fetched peer functions, portable SHA-256
(empty and abc vectors matched). Node replay wrapper supplied but not executed.
{
  "checks": 15,
  "fixture": {
    "records": 572,
    "nodes": 32,
    "seeds": 52,
    "projectedRoleRows": 116,
    "structuralRows": 46,
    "packageRoleRows": 188
  },
  "direct": {
    "nodes": 27,
    "roleEdges": 96,
    "digest": "0186a2839e47e5d4479833f1867cde0f97232667ca06e5139b7c693c8bd7325e"
  },
  "package": {
    "nodes": 32,
    "roleEdges": 188,
    "digest": "aa46e8b0fcefaf27e8d8c5878ee40ef03990a5354ab82bfebb6ae7cddde84bca"
  },
  "mutation": {
    "localRootUnchanged": true,
    "direct": {
      "nodes": 14,
      "roleEdges": 36,
      "digest": "8640c472d0fb163cf8e96328a7f9949a2bdd6a4215f966aea7ca648945f8eda6"
    },
    "package": {
      "nodes": 20,
      "roleEdges": 108,
      "digest": "5b37a010e4e692b0b08179d493b1ceb2f4eb761c6116db57a5208f1b4627a99a"
    }
  },
  "scope": "Serialized sample only; not a kernel check, cache authorization, or RH graph"
}
RESUME HERE: recheck native fixture and stream status; run RUN4 native disk scan
and compare against reference in a checkout with fixture and Node. On real
authenticated 3.1 export, adapt typed identity join and compare native
type/value/axiom boundaries; do not use this legacy sample adapter as full
RH exporter. Coordinate receipt and disk CSR sidecar with acceleration.
HANDOFF TO: dependencies, acceleration, integration, formal audit.
*/
