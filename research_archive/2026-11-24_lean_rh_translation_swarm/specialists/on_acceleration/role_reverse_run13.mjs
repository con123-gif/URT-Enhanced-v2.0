// RUN13 executable fail-on-error certificate. Node >=22. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
function run13(full,anchors,clock=()=>Date.now()){
  const need=(x,m)=>{if(!x)throw Error(m)}, checks=[];
  const ok=(x,m)=>{need(x,m);checks.push(m)};
  const pin="40e56bab026552e089d7afcfeff08d2defb9c005", digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";
  function index(){
    const owners=new Map(),nodes=new Map(),names=new Map(),rev=new Map(),records=[],roleCounts={type:0,value:0,structural:0};let metadata=0;
    for(const a of [full,anchors])need(a.status==="AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK"&&a.digest===digest&&a.n===1065214335&&a.root===14065054&&a.indexedDeclarations===1484733,"scope mismatch");
    need(full.pin===pin&&full.reports.length===47&&anchors.reports.length===6,"source coverage mismatch");
    function intern(id,parts,kind){
      need(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length>0&&parts.every(x=>typeof x==="string"||Number.isSafeInteger(x))&&typeof kind==="string","malformed name or ID");
      const key=JSON.stringify(parts);const old=nodes.get(id);
      need(!old||old.key===key&&old.kind===kind,"ID identity collision");
      // Do not use rendered dotted names or suffix lookup. Export numeric IDs
      // are authority only within this archive. Keep same rendered names distinct.
      if(!old){nodes.set(id,{key,kind});if(!names.has(key))names.set(key,new Set());names.get(key).add(id)}
    }
    for(const a of [full,anchors])for(const row of a.reports){
      const q=row.request||row.source;
      need(row.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK"&&q&&typeof q.name==="string"&&!owners.has(row.id)&&(!q.id||q.id===row.id),"invalid/duplicate owner");
      need(!row.source||row.source.pin===pin,"anchor pin mismatch");
      owners.set(row.id,{name:q.name,kind:row.kind,source:q.source||row.source||null});
      // owner parts are not derived from dotted display strings; identity is
      // joined by numeric archive ID. Referenced name parts are retained below.
      need(row.type&&Array.isArray(row.type.references)&&Number.isSafeInteger(row.type.expressionRoot),"missing type role");
      need(row.kind==="ctor"?row.value===null:row.value&&Array.isArray(row.value.references),"invalid value role");
      if(row.kind==="ctor")need(Array.isArray(row.structural)&&row.structural.length>0,"constructor structure missing");
      for(const role of ["type","value","structural"]){
        const refs=role==="structural"?(row.structural||[]):(row[role]?.references||[]);
        for(const ref of refs){
          const kind=role==="structural"?"structural":ref.kind;
          if(role!=="structural"){
            need(["explicit_const","projection_carrier","literal_primitive"].includes(kind)&&Number.isSafeInteger(ref.witnessExpression)&&ref.witnessExpression>=0&&ref.witnessExpression<full.n&&Number.isSafeInteger(ref.distinctExpressionRecords)&&ref.distinctExpressionRecords>=1,"bad expression witness");
          }else need(Number.isSafeInteger(ref.edgeIndex)&&Number.isSafeInteger(ref.encoded)&&ref.encoded===-ref.target-1,"bad structural witness");
          intern(ref.target,ref.nameParts,role==="structural"?ref.kind:ref.targetKind);
          const rec={owner:row.id,target:ref.target,role,kind,ref};
          records.push(rec);roleCounts[role]++;
          if(!rev.has(ref.target))rev.set(ref.target,[]);
          rev.get(ref.target).push(rec);
        }
      }
      metadata+=(row.mutualBlock||[]).length;
    }
    // Never fabricate an unobserved outgoing dependency list for boundary IDs.
    for(const [id,o] of owners)if(nodes.has(id))need(nodes.get(id).kind===o.kind,"owner kind mismatch");
    return {owners,nodes,rev,records,roleCounts,metadata,boundary:[...nodes.keys()].filter(id=>!owners.has(id)).length,ambiguous:[...names.values()].filter(s=>s.size>1).length};
  }
  const t0=clock(),g=index(),indexMs=clock()-t0;
  ok(g.owners.size===53,"all 47 targets and 6 anchors retained");
  ok(g.roleCounts.type===full.summary.typeEdges+anchors.reports.reduce((s,x)=>s+x.type.references.length,0),"type edge census");
  ok(g.roleCounts.value===full.summary.valueEdges+anchors.reports.reduce((s,x)=>s+x.value.references.length,0),"value edge census");
  ok(g.roleCounts.structural===full.summary.structuralEdges,"structural edge census");
  const equal=(a,b)=>a.size===b.size&&[...a].every(x=>b.has(x));
  // Independent full-record baseline builds no reverse adjacency for its closure.
  function scan(seeds){
    const seen=new Set(seeds);let visits=0,changed=true;
    while(changed){changed=false;for(const e of g.records){visits++;if(seen.has(e.target)&&!seen.has(e.owner)){seen.add(e.owner);changed=true}}}
    return {seen,visits};
  }
  function walk(seeds){
    const seen=new Set(seeds),q=[...seen];let visits=0;
    for(let i=0;i<q.length;i++)for(const e of g.rev.get(q[i])||[]){visits++;if(!seen.has(e.owner)){seen.add(e.owner);q.push(e.owner)}}
    return {seen,visits};
  }
  function separate(seeds){const seen=new Set();let visits=0;for(const s of seeds){const r=walk([s]);visits+=r.visits;for(const x of r.seen)seen.add(x)}return {seen,visits}}
  function phase(seeds,theta){const b=Array.from({length:64},()=>[]);for(let i=0;i<seeds.length;i++)b[Math.floor(64*((i*theta)%1))].push(seeds[i]);return b.flat()}
  // Use each observed owner as an edit seed, and each boundary direct target
  // as a seed. Distinguish unexpanded references from a proved leaf.
  for(const id of g.owners.keys())ok(equal(walk([id]).seen,scan([id]).seen),"owner reverse closure "+id);
  let boundaryTests=0;for(const id of g.nodes.keys())if(!g.owners.has(id)){
    // For large sets, independently compare all one-step consumers via a
    // grouped full-edge scan below and run full closure on a reproducible sample.
    if(boundaryTests<100){ok(equal(walk([id]).seen,scan([id]).seen),"boundary reverse sample "+id);boundaryTests++}
  }
  // Full role-labelled multiset equality, including both duplicate structural edges.
  const expected=new Map();for(const e of g.records){const k=JSON.stringify([e.target,e.owner,e.role,e.kind,e.ref]);expected.set(k,(expected.get(k)||0)+1)}
  const actual=new Map();for(const [target,es] of g.rev)for(const e of es){need(target===e.target,"wrong reverse key");const k=JSON.stringify([target,e.owner,e.role,e.kind,e.ref]);actual.set(k,(actual.get(k)||0)+1)}
  ok(expected.size===actual.size&&[...expected].every(([k,v])=>actual.get(k)===v),"full edge multiset equality");
  const ctor=full.reports.find(x=>x.kind==="ctor");ok(ctor.value===null&&g.records.filter(e=>e.owner===ctor.id&&e.role==="structural").length===2,"constructor has no invented value and both structural records");
  const byDegree=[...g.rev.keys()].sort((a,b)=>g.rev.get(b).length-g.rev.get(a).length||a-b);
  const sets={overlap:byDegree.slice(0,15),sparse:byDegree.slice(-15),anchors:anchors.reports.map(x=>x.id)};
  const benchmarks={};
  for(const [label,seeds] of Object.entries(sets)){
    const oracle=scan(seeds),modes={full_scan:()=>scan(seeds),separate_indexed:()=>separate(seeds),shared:()=>walk(seeds),golden:()=>walk(phase(seeds,1/((1+Math.sqrt(5))/2)**2)),periodic:()=>walk(phase(seeds,.25))};
    const row={seeds,affected:oracle.seen.size,affectedOwners:[...oracle.seen].filter(x=>g.owners.has(x)).length,modes:{}};
    for(const [m,fn] of Object.entries(modes)){
      let out;const coldStart=clock();out=fn();const first=clock()-coldStart;
      ok(equal(out.seen,oracle.seen),label+" "+m+" first equality");
      const repeat=m==="full_scan"?50:1000;const t=clock();for(let i=0;i<repeat;i++)out=fn();const elapsed=clock()-t;
      ok(equal(out.seen,oracle.seen),label+" "+m+" repeated equality");
      row.modes[m]={firstMs:first,warmTotalMs:elapsed,repeats:repeat,warmMs:elapsed/repeat,edgeVisits:out.visits};
    }benchmarks[label]=row;
  }
  // Negative controls: corrupt a role, ID and structural witness. Restore after rejection.
  const bad=(label,mutate,restore)=>{mutate();let caught=false;try{index()}catch{caught=true}finally{restore()}ok(caught,label)};
  const first=full.reports[0],firstRef=first.type.references[0],save=firstRef.witnessExpression;
  bad("bad witness rejected",()=>firstRef.witnessExpression=-1,()=>firstRef.witnessExpression=save);
  const id=full.reports[1].id;bad("duplicate owner rejected",()=>full.reports[1].id=first.id,()=>full.reports[1].id=id);
  const value=ctor.value;bad("fabricated constructor value rejected",()=>ctor.value={references:[]},()=>ctor.value=value);
  const encoded=ctor.structural[0].encoded;bad("bad structural encoding rejected",()=>ctor.structural[0].encoded=0,()=>ctor.structural[0].encoded=encoded);
  return {status:"PARTIAL_AUTHENTICATED_EXPORT_ROLE_INDEX_NOT_KERNEL_RECHECK",indexMs,owners:g.owners.size,referencedIds:g.nodes.size,boundary:g.boundary,ambiguousTaggedRepresentations:g.ambiguous,roleCounts:g.roleCounts,metadata:g.metadata,checks:checks.length,boundaryTests,benchmarks};
}
const [fullPath,anchorPath]=process.argv.slice(2);if(!fullPath||!anchorPath)throw Error("usage: node role_reverse_run13.mjs solution_frontier_roles.json solution_direct_roles.json");
const read=(p,sha)=>{const b=fs.readFileSync(p);const actual=crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(actual!==sha)throw Error("wrong input blob "+p);return JSON.parse(b)};
const full=read(fullPath,"d49fbcc22a2382039986b09ff91dd11af2ef2e7b"),anchor=read(anchorPath,"64b935e4ef309f6c555912a377012c7708eda510");
const result=run13(full,anchor,()=>performance.now());result.peakRssKiB=process.resourceUsage().maxRSS;console.log(JSON.stringify(result,null,2));
