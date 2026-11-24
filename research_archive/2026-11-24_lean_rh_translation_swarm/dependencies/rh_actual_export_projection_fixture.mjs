/* RH dependency extraction, 2026-11-24 09:12 UTC session.
RESULT PARTIAL: first actual lean4export sample direct projection test, not RH itself.
RH source pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream observed c9883164b0b3d762cee21f889d03d59a53b3ba3b. Main.lean pinned blob dbd5db70bc11b35f18fa5751216ab335321e7bfc uses rhOfAll; latest blob 67c65badc15f80a1db65df1c84dc7a4928fc410f uses Claim.zeta LFunction_ne_zero_of_half_lt_re. Do not mix revisions.
Cathedral pre-write branch SHA 0fdd038fc82ce872c289c1f61e897461fa51bd5e. Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity, research state/log/protocol, prior dependencies and integration/structure/audit/math and specialist handoffs.
Actual export fixture leanprover/lean4export 15f6055e299ad5b89345e533cc2192f4cc00f659:examples/Nat.add_succ.ndjson, blob d3cd35f1313b4e78b5fded9886e450112aa75def; exporter format 3.0.0, not the RH 3.1.0 export. Prior projector blob 6727688a7bbcda69dd7d719d7a1f74efde551fdc. Actual fixture fetched by connector and executed in V8. Node replay verifies git blob hash; CLI not executed here. No Lean executable locally; git DNS unavailable.
Existing corrected stream retry and native fixture v2 status paths return 404; no duplicate jobs. Original challenge scan failed only byte length despite exact hash; no RH closure. Last physical CI #357 PASS run 45357167804 unrelated to this test.
This independently traverses role roots from real serialized expressions, compares 4 batch sizes, verifies each reference witness and tagged name, and separates direct expression references from structural package closure. Shared declaration-root adapter is not independently checked against Lean; legacy format adapter handles the actual fixture only, not arbitrary untrusted input. No proof validity, axiom absence or original source proof verification inferred. Counts are graph evidence conditional on the published sample, not a complete RH proof.
Expected O(B+V+E+K) per scan/batch under hash-map assumptions, where B is input bytes, K attributed references; repeated batches sum costs, not globally O(N) for arbitrary output. Legacy name reconstruction uses total expanded name lengths, and small fixture lookup uses linear scan; in-memory sample parser, not a bounded-memory RH runner. Peak retained expression-node counts not RSS. V8 ms coarse, not an URT advantage.
Replay: git clone https://github.com/leanprover/lean4export ; git -C lean4export show 15f6055e299ad5b89345e533cc2192f4cc00f659:examples/Nat.add_succ.ndjson > sample.ndjson ; node rh_actual_export_projection_fixture.mjs sample.ndjson
Observed output:
{
  "meta": {
    "exporter": {
      "name": "lean4export",
      "version": "3.0.0"
    },
    "format": {
      "version": "3.0.0"
    },
    "lean": {
      "githash": "2fcce7258eeb6e324366bc25f9058293b04b7547",
      "version": "4.27.0-rc1"
    }
  },
  "lines": 572,
  "names": 104,
  "levels": 16,
  "expr": 434,
  "declarations": 32,
  "groups": 19,
  "seeds": 52,
  "roleRefs": 116,
  "referenceKinds": {
    "explicit_const": 112,
    "projection_carrier": 4
  },
  "structuralRows": 46,
  "independentReads": 835,
  "benches": [
    {
      "batchSize": 1,
      "reads": 835,
      "childEdges": 1026,
      "peakRetainedExprNodes": 56,
      "ms": 5
    },
    {
      "batchSize": 7,
      "reads": 521,
      "childEdges": 796,
      "peakRetainedExprNodes": 108,
      "ms": 3
    },
    {
      "batchSize": 16,
      "reads": 483,
      "childEdges": 784,
      "peakRetainedExprNodes": 214,
      "ms": 2
    },
    {
      "batchSize": 32,
      "reads": 457,
      "childEdges": 766,
      "peakRetainedExprNodes": 249,
      "ms": 3
    }
  ],
  "directClosure": 27,
  "packageClosure": 32,
  "directOnlyEdges": 75,
  "packageEdges": 107,
  "directClosureEdgeVisits": 65,
  "packageClosureEdgeVisits": 107,
  "packageOnly": [
    [
      "Add",
      "rec"
    ],
    [
      "Eq",
      "rec"
    ],
    [
      "HAdd",
      "rec"
    ],
    [
      "PProd",
      "rec"
    ],
    [
      "PUnit",
      "rec"
    ]
  ],
  "axioms": [],
  "rootRows": [
    {
      "role": "type",
      "kind": "explicit_const",
      "target": [
        "instAddNat"
      ],
      "witnessExpr": 418
    },
    {
      "role": "type",
      "kind": "explicit_const",
      "target": [
        "instHAdd"
      ],
      "witnessExpr": 416
    },
    {
      "role": "type",
      "kind": "explicit_const",
      "target": [
        "HAdd",
        "hAdd"
      ],
      "witnessExpr": 412
    },
    {
      "role": "type",
      "kind": "explicit_const",
      "target": [
        "Eq"
      ],
      "witnessExpr": 410
    },
    {
      "role": "type",
      "kind": "explicit_const",
      "target": [
        "Nat",
        "succ"
      ],
      "witnessExpr": 11
    },
    {
      "role": "type",
      "kind": "explicit_const",
      "target": [
        "Nat"
      ],
      "witnessExpr": 1
    },
    {
      "role": "value",
      "kind": "explicit_const",
      "target": [
        "rfl"
      ],
      "witnessExpr": 429
    },
    {
      "role": "value",
      "kind": "explicit_const",
      "target": [
        "instAddNat"
      ],
      "witnessExpr": 418
    },
    {
      "role": "value",
      "kind": "explicit_const",
      "target": [
        "instHAdd"
      ],
      "witnessExpr": 416
    },
    {
      "role": "value",
      "kind": "explicit_const",
      "target": [
        "HAdd",
        "hAdd"
      ],
      "witnessExpr": 412
    },
    {
      "role": "value",
      "kind": "explicit_const",
      "target": [
        "Nat",
        "succ"
      ],
      "witnessExpr": 11
    },
    {
      "role": "value",
      "kind": "explicit_const",
      "target": [
        "Nat"
      ],
      "witnessExpr": 1
    }
  ],
  "negativeControls": 3,
  "verifiedRoleRowsAcrossBatches": 464
}
RESUME HERE: inspect existing rh-stream-closure-retry-20261124 and native fixture v2 statuses. Once actual challenge export passes, adapt typed record reader to 3.1.0 and project exact type/value roots of riemannHypothesis, rhOfAll, allChi from the authenticated RH export; compare native extractor and package-aware closure. No source-only match upgraded. HANDOFF TO: kernel extractor, integration, audit, acceleration.
*/
import fs from 'node:fs';
import {createHash} from 'node:crypto';
import {projectBatch,declarationRoots} from './rh_direct_dependency_projection.mjs';
function run(data,projectBatch,declarationRoots){
  const assert=(x,m)=>{if(!x)throw Error(m)};
  const eq=(a,b,m)=>assert(JSON.stringify(a)===JSON.stringify(b),m);
  const parse=(data)=>{
    const expr=new Map(),names=new Map([[0,[]]]),decl=new Map(),groups=[],levels=new Set([0]); let meta=null,lines=0;
    const put=(m,k,g)=>{assert(!decl.has(m.name),"duplicate declaration");decl.set(m.name,{m,k,g})};
    for(const line of data.trimEnd().split(/\r?\n/)){
      const r=JSON.parse(line);lines++;
      if(r.meta){assert(!meta&&r.meta.format.version==="3.0.0","wrong legacy format");meta=r.meta;continue}
      if(Object.hasOwn(r,"in")){const n=r.str||r.num;assert(n&&names.has(n.pre)&&!names.has(r.in),"bad name");names.set(r.in,[...names.get(n.pre),r.str?n.str:n.i]);continue}
      if(Object.hasOwn(r,"il")){assert(!levels.has(r.il),"duplicate level");levels.add(r.il);continue}
      if(Object.hasOwn(r,"ie")){assert(!expr.has(r.ie),"duplicate expression");expr.set(r.ie,r);continue}
      const k=Object.keys(r)[0];assert(Object.keys(r).length===1,"bad declaration record");
      let members=[];
      if(k==="inductive"){
        for(const [field,kind] of [["inductiveVals","inductive"],["constructorVals","ctor"],["recursorVals","rec"]]){
          assert(Array.isArray(r[k][field]),"missing group section");for(const m of r[k][field])members.push([m,kind]);
        }
      }else{assert(["def","thm","opaque","axiom","quot"].includes(k)&&Array.isArray(r[k]),"unexpected group");members=r[k].map(m=>[m,k])}
      assert(members.length,"empty group");const g=groups.length;groups.push(members.map(([m])=>m.name));for(const [m,kind] of members)put(m,kind,g);
    }
    assert(meta,"missing meta");
    for(const [id,{m}] of decl){assert(names.has(id)&&expr.has(m.type),"invalid declaration root");}
    return {expr,names,decl,groups,levels,meta,lines};
  };
  const x=parse(data);
  const idOf=parts=>[...x.names].find(([_,v])=>JSON.stringify(v)===JSON.stringify(parts))?.[0];
  const primitives={Nat:idOf(["Nat"]),"Char.ofNat":idOf(["Char","ofNat"]),"String.ofList":idOf(["String","ofList"])};
  const root=idOf(["Nat","add_succ"]);assert(x.decl.has(root),"root absent");
  const seeds=[],structural=[];
  for(const {m,k} of x.decl.values()){const a=declarationRoots(k,m);seeds.push(...a.roots);structural.push(...a.structural)}
  // Independent traversal: explicit field paths, no projection helper or shared mask.
  const oracle=new Map();let independentReads=0;
  for(const s of seeds){
    const seen=new Set(),stack=[s.expr],refs=new Set();
    while(stack.length){
      const i=stack.pop();if(seen.has(i))continue;seen.add(i);independentReads++;
      const r=x.expr.get(i);assert(r,"missing expression");
      const ks=Object.keys(r).filter(k=>k!=="ie");assert(ks.length===1,"ambiguous expr");
      const k=ks[0],v=r[k];const add=(kind,target)=>{assert(x.decl.has(target),"unresolved reference");refs.add(kind+":"+target)};
      if(k==="const")add("explicit_const",v.name);
      else if(k==="proj"){add("projection_carrier",v.typeName);stack.push(v.struct)}
      else if(k==="app")stack.push(v.arg,v.fn);
      else if(k==="lam"||k==="forallE")stack.push(v.body,v.type);
      else if(k==="letE")stack.push(v.body,v.value,v.type);
      else if(k==="mdata")stack.push(v.expr);
      else if(k==="natVal")add("literal_primitive",primitives.Nat);
      else if(k==="strVal"){add("literal_primitive",primitives["Char.ofNat"]);add("literal_primitive",primitives["String.ofList"])}
      else assert(["bvar","sort"].includes(k),"unknown expression kind");
    }
    oracle.set(JSON.stringify([s.owner,s.role]),{seen,refs});
  }
  const key=r=>JSON.stringify([r.owner,r.role,r.kind,r.target]);
  const expected=seeds.flatMap(s=>[...oracle.get(JSON.stringify([s.owner,s.role])).refs].map(k=>{const [kind,target]=k.split(":");return key({...s,kind,target:Number(target)})})).sort();
  const benches=[];let rows=[];
  for(const size of [1,7,16,32]){
    let all=[],reads=0,peak=0,childEdges=0;const t=Date.now();
    for(let i=0;i<seeds.length;i+=size){
      const got=projectBatch(seeds.slice(i,i+size),id=>x.expr.get(id),primitives,id=>x.names.get(id));
      all.push(...got.rows);reads+=got.stats.expressionReads;childEdges+=got.stats.childEdges;peak=Math.max(peak,got.stats.retainedExpressionNodes);
    }
    eq(all.map(key).sort(),expected,"batch vs independent "+size);
    for(const r of all){
      const o=oracle.get(JSON.stringify([r.owner,r.role]));assert(o.seen.has(r.witnessExpr),"witness unreachable");
      const rec=x.expr.get(r.witnessExpr);
      assert(r.kind==="explicit_const"?rec.const?.name===r.target:r.kind==="projection_carrier"?rec.proj?.typeName===r.target:r.kind==="literal_primitive"&&(Object.hasOwn(rec,"natVal")||Object.hasOwn(rec,"strVal")),"wrong witness kind");
      eq(r.targetNameParts,x.names.get(r.target),"name mismatch");
    }
    benches.push({batchSize:size,reads,childEdges,peakRetainedExprNodes:peak,ms:Date.now()-t});rows=all;
  }
  const direct=new Map([...x.decl.keys()].map(id=>[id,new Set()])),pkg=new Map([...x.decl.keys()].map(id=>[id,new Set()]));
  for(const r of rows){direct.get(r.owner).add(r.target);pkg.get(r.owner).add(r.target)}
  for(const r of structural){assert(x.decl.has(r.target),"missing structural ref");pkg.get(r.owner).add(r.target)}
  // Star group edges are sufficient to include all declarations of reached package.
  for(const g of x.groups)for(const id of g.slice(1)){pkg.get(g[0]).add(id);pkg.get(id).add(g[0])}
  function closure(adj){const q=[root],seen=new Set(q);let visits=0;for(let i=0;i<q.length;i++)for(const z of adj.get(q[i])){visits++;if(!seen.has(z)){seen.add(z);q.push(z)}}return {seen,visits}}
  const d=closure(direct),p=closure(pkg);assert([...d.seen].every(id=>p.seen.has(id)),"package dropped direct ref");
  for(const id of p.seen)assert(x.groups[x.decl.get(id).g].every(z=>p.seen.has(z)),"incomplete package");
  const name=id=>x.names.get(id);
  const names=ids=>[...ids].map(name).sort((a,b)=>JSON.stringify(a).localeCompare(JSON.stringify(b)));
  const counts={};for(const r of rows)counts[r.kind]=(counts[r.kind]||0)+1;
  const rootRows=rows.filter(r=>r.owner===root).map(r=>({role:r.role,kind:r.kind,target:r.targetNameParts,witnessExpr:r.witnessExpr}));
  const bads=[data+"\n"+data.trimEnd().split(/\r?\n/).find(s=>JSON.parse(s).ie===0),data.replace('"version":"3.0.0"},"format":{"version":"3.0.0"','"version":"3.0.0"},"format":{"version":"99.0.0"'),data.trimEnd().split(/\r?\n/).filter(s=>JSON.parse(s).ie!==428).join("\n")];
  let rejected=0;for(const bad of bads){try{parse(bad)}catch(e){rejected++}}eq(rejected,3,"negative controls");
  return {meta:x.meta,lines:x.lines,names:x.names.size,levels:x.levels.size,expr:x.expr.size,declarations:x.decl.size,groups:x.groups.length,seeds:seeds.length,roleRefs:rows.length,referenceKinds:counts,structuralRows:structural.length,independentReads,benches,directClosure:d.seen.size,packageClosure:p.seen.size,directOnlyEdges:[...direct.values()].reduce((a,v)=>a+v.size,0),packageEdges:[...pkg.values()].reduce((a,v)=>a+v.size,0),directClosureEdgeVisits:d.visits,packageClosureEdgeVisits:p.visits,packageOnly:names([...p.seen].filter(id=>!d.seen.has(id))),axioms:names([...p.seen].filter(id=>x.decl.get(id).k==="axiom")),rootRows,negativeControls:rejected,verifiedRoleRowsAcrossBatches:rows.length*4};
}
const b=fs.readFileSync(process.argv[2]);
if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!=='d3cd35f1313b4e78b5fded9886e450112aa75def')throw Error('fixture blob mismatch');
console.log(JSON.stringify(run(b.toString('utf8'),projectBatch,declarationRoots),null,2));
