/* DEPENDENCIES — 2026-11-24 13:12 UTC — PARTIAL / explicit export reference closure, NOT kernel replay.
Pinned RH 40e56bab026552e089d7afcfeff08d2defb9c005; pinned src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc (unqualified riemannHypothesis). Upstream observed e26756e547b281cbf137eb7e0f16cccb738f3f84; pinned snapshot unchanged. Base Cathedral 12f095879f2e85c229e9561298a7027bf9d4f905.
Read SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, continuity, research state/log/protocol, integration 1300 WD dual, structure 1224 postdominators/stream retry, audit claim strip, math PairEx, kernel RUN7. Physical CI #370 PASS, not RH verification.
NEW OBSERVED RESULT: compute/rh-stream-closure-retry-20261124/status.json on cathedral-research-state (run 45349329680) authenticated challenge 350862311 bytes, 6112241 indexed expressions, 53722 declarations, closure 6046012 expressions / 53242 declarations / 12128971 edges in 11.090469057 s, peak RSS 497624 KiB; reachable axioms Classical.choice, Quot.sound, propext, sorryAx (challenge only). The solution run timed out at 19200.26 s; last printed scan 61524057792 bytes / 1064472747 expressions. Artifact-only reachable_declarations.jsonl 84971920 bytes, SHA256 94e78ab55162a7137935cb429d8ca32ad2ec8a6ddb4d5e06ea0b395d1b0bf057, without completed solution summary: NOT an authenticated complete closure. The partial file indicates some traversal/output took place, but precise phase times unavailable. Do not infer proof status or exact bottleneck solely from this. Native fixture v3 and typed-algebra challenge separately passed; owned by peer lanes.
RESULT: locality-aware traversal of same signed graph, prioritizing highest expression ID and exhausting reachable declaration queue before next expression. Mark seen on enqueue; exact set equality with DFS follows by reachability induction; every enqueued node drained, each edge read once, no filtering. For fixed 31-bit IDs, pending bitmap hierarchy has <=7 levels, O(V+E) graph operations, O(N) bits for expression seen/pending (~2.033N bits) plus sparse declaration bitsets and queue; file I/O not universally linear. If reachable expr edges and expanded declaration roots never jump forward, every index page is accessed at most once; forward jumps counted explicitly and invalidate that bound. Simulated page reads, NOT measured disk I/O or actual RH acceleration. Real 3.0 fixture via connector plus generated graphs and negative controls executed in V8; old extractor source transformation anchors checked, Node wrapper NOT yet executed. No URT-specific speedup, proof completion, or dropped assumptions.
Fixture leanprover/lean4export 15f6055e299ad5b89345e533cc2192f4cc00f659 examples/Nat.add_succ.ndjson blob d3cd35f1313b4e78b5fded9886e450112aa75def. V8 connector blob metadata confirmed, CLI independently verifies raw Git blob SHA. Exact names preserved in test report. Source graph baseline and structural package edges retained; raw export archive is authoritative.
Reproduce: node rh_locality_frontier_retry.mjs test /path/to/Nat.add_succ.ndjson; node rh_locality_frontier_retry.mjs --out /tmp/rh-new [--challenge-only]. Run wrapper checks original extractor blob SHA, substitutes traversal only and adds authenticated scan boundary/progress logging. Existing challenge/solution digest gates remain. New compute job registered; actual full retry pending.
RESUME HERE: inspect compute/rh-locality-frontier-retry-20261124/status.json; require authenticated solution summary, compare challenge counts and axioms with original, inspect forward insertions/block transitions and phase boundary before any further optimisation. If timeout, obtain checkpointed scan/closure state or use native kernel exporter, not another blind rerun. HANDOFF TO: integration, audit, acceleration, kernel extractor. Project OPEN.
*/
// Executed V8 results (simulated cache; times are illustrative):
// {"actual":{"root":["Nat","add_succ"],"expressions":434,"declarations":32,"results":[{"name":"dfs","counts":{"expressions":434,"declarations":32,"edges":921},"loads":53,"reads":434,"ms":0},{"name":"locality","counts":{"expressions":434,"declarations":32,"edges":921,"locality":{"forwardInsertions":0,"blockTransitions65536":1,"peakPending":48,"peakDeclQueue":3,"expressionBitsetBytes":116,"declarationSeenBytes":65536}},"loads":28,"reads":434,"ms":2}],"reachableNames":[[["Add","add"],"def"],[["Add","mk"],"ctor"],[["Add","rec"],"rec"],[["Add"],"inductive"],[["Eq","rec"],"rec"],[["Eq","refl"],"ctor"],[["Eq"],"inductive"],[["HAdd","hAdd"],"def"],[["HAdd","mk"],"ctor"],[["HAdd","rec"],"rec"],[["HAdd"],"inductive"],[["instAddNat"],"def"],[["instHAdd"],"def"],[["Nat","add_succ"],"thm"],[["Nat","add","match_1"],"def"],[["Nat","add"],"def"],[["Nat","below"],"def"],[["Nat","brecOn","go"],"def"],[["Nat","brecOn"],"def"],[["Nat","casesOn"],"def"],[["Nat","rec"],"rec"],[["Nat","succ"],"ctor"],[["Nat","zero"],"ctor"],[["Nat"],"inductive"],[["outParam"],"def"],[["PProd","mk"],"ctor"],[["PProd","rec"],"rec"],[["PProd"],"inductive"],[["PUnit","rec"],"rec"],[["PUnit","unit"],"ctor"],[["PUnit"],"inductive"],[["rfl"],"def"]]},"graphChecks":24,"controls":4,"scaling":[{"n":50000,"dfs":{"name":"dfs","counts":{"expressions":50000,"declarations":1,"edges":99999},"loads":226,"reads":50000,"ms":51},"locality":{"name":"locality","counts":{"expressions":50000,"declarations":1,"edges":99999,"locality":{"forwardInsertions":0,"blockTransitions65536":1,"peakPending":11370,"peakDeclQueue":1,"expressionBitsetBytes":12712,"declarationSeenBytes":65536}},"loads":196,"reads":50000,"ms":86}},{"n":100000,"dfs":{"name":"dfs","counts":{"expressions":100000,"declarations":1,"edges":199999},"loads":458,"reads":100000,"ms":106},"locality":{"name":"locality","counts":{"expressions":100000,"declarations":1,"edges":199999,"locality":{"forwardInsertions":0,"blockTransitions65536":2,"peakPending":22812,"peakDeclQueue":1,"expressionBitsetBytes":25412,"declarationSeenBytes":65536}},"loads":391,"reads":100000,"ms":167}},{"n":200000,"dfs":{"name":"dfs","counts":{"expressions":200000,"declarations":1,"edges":399999},"loads":948,"reads":200000,"ms":268},"locality":{"name":"locality","counts":{"expressions":200000,"declarations":1,"edges":399999,"locality":{"forwardInsertions":0,"blockTransitions65536":4,"peakPending":45495,"peakDeclQueue":1,"expressionBitsetBytes":50816,"declarationSeenBytes":65536}},"loads":782,"reads":200000,"ms":333}},{"n":400000,"dfs":{"name":"dfs","counts":{"expressions":400000,"declarations":1,"edges":799999},"loads":1918,"reads":400000,"ms":529},"locality":{"name":"locality","counts":{"expressions":400000,"declarations":1,"edges":799999,"locality":{"forwardInsertions":0,"blockTransitions65536":7,"peakPending":90850,"peakDeclQueue":1,"expressionBitsetBytes":101620,"declarationSeenBytes":65536}},"loads":1563,"reads":400000,"ms":665}}]}

function localityTraverse(roots,readExpr,readDecl,visit,n=100001){
 const ok=(v,m)=>{if(!v)throw Error(m)};
 ok(Number.isInteger(n)&&n>0&&n<=2147483647,"invalid expression count");
 const seen=new Uint32Array(Math.ceil(n/32)),levels=[new Uint32Array(seen.length)];
 while(levels[levels.length-1].length>1)levels.push(new Uint32Array(Math.ceil(levels[levels.length-1].length/32)));
 const declPages=new Map(),dq=[];
 let pending=0,last=n,forward=0,peakPending=0,peakDeclQueue=0,transitions=0,prevBlock=-1;
 const counts={expressions:0,declarations:0,edges:0};
 function schedule(i){
  if(i>=n)throw Error("missing expr "+i);
  const word=i>>>5,bit=1<<(i&31);
  if(seen[word]&bit)return;
  seen[word]|=bit;
  if(i>last)forward++;
  pending++;peakPending=Math.max(peakPending,pending);
  for(const a of levels){const w=i>>>5,m=1<<(i&31),old=a[w];a[w]=old|m;if(old)break;i=w}
 }
 function markDecl(i){
  const p=i>>>19,j=(i&524287)>>>5,m=1<<(i&31);
  let a=declPages.get(p);if(!a){a=new Uint32Array(16384);declPages.set(p,a)}
  if(a[j]&m)return;
  a[j]|=m;dq.push(i);peakDeclQueue=Math.max(peakDeclQueue,dq.length);
 }
 function push(ref){
  if(ref===0)return;
  ok(Number.isInteger(ref)&&Math.abs(ref)<=2147483647,"invalid edge");
  const i=Math.abs(ref)-1;if(ref>0)schedule(i);else markDecl(i)
 }
 function pop(){
  let i=0;
  for(let l=levels.length-1;l>=0;l--){const word=levels[l][i];ok(word!==0,"pending hierarchy");i=i*32+31-Math.clz32(word)}
  const result=i;for(const a of levels){const w=i>>>5,m=1<<(i&31);a[w]&=~m;if(a[w])break;i=w}
  pending--;return result
 }
 function visitEdges(edges){for(const ref of edges)if(ref!==0){counts.edges++;push(ref)}}
 for(const id of roots){ok(Number.isInteger(id)&&id>=0&&id<2147483647,"root ID");push(-id-1)}
 while(pending||dq.length){
  while(dq.length){const id=dq.pop(),v=readDecl(id);ok(v,"missing decl "+id);counts.declarations++;visitEdges(v.edges);visit(id,v)}
  if(!pending)break;
  const i=pop(),block=Math.floor(i/65536);if(block!==prevBlock){transitions++;prevBlock=block}last=i;
  const v=readExpr(i);ok(v,"missing expr "+i);counts.expressions++;visitEdges(v);
  if(counts.expressions%10000000===0&&typeof process!=="undefined"&&process.env.RH_LOCALITY_PROGRESS==="1")console.error("reachable expressions",counts.expressions,"declarations",counts.declarations,"forward insertions",forward,"block transitions",transitions)
 }
 return {...counts,locality:{forwardInsertions:forward,blockTransitions65536:transitions,peakPending,peakDeclQueue,expressionBitsetBytes:seen.byteLength+levels.reduce((s,a)=>s+a.byteLength,0),declarationSeenBytes:declPages.size*65536}};
}

function baseline(roots,re,rd,visit){
 const seen=new Set(),stack=[];const c={expressions:0,declarations:0,edges:0};
 function push(r){if(r&&!seen.has(r)){seen.add(r);stack.push(r)}}
 roots.forEach(i=>push(-i-1));while(stack.length){const r=stack.pop(),i=Math.abs(r)-1,v=r>0?re(i):rd(i);if(!v)throw Error("missing reference");c[r>0?"expressions":"declarations"]++;for(const x of r>0?v:v.edges)if(x){c.edges++;push(x)}if(r<0)visit(i,v)}return c
}

function fixtureGraph(raw){
 const names=[null],expr=[],decl=new Map(),quot=[];
 const e=i=>i+1,d=i=>-i-1;
 const resolve=id=>{const p=[];while(id){const [pre,val]=names[id];p.unshift(val);id=pre}return p};
 const lookup=p=>{const x=names.findIndex((_,i)=>i&&JSON.stringify(resolve(i))===JSON.stringify(p));if(x<0)throw Error("name not found "+p);return x};
 for(const line of raw.trimEnd().split("\n")){
  const r=JSON.parse(line);if("meta"in r||"il"in r)continue;
  if("in"in r){const v=r.str??r.num;if(r.in!==names.length)throw Error("name sequence");names.push([v.pre,r.str?v.str:v.i]);continue}
  if("ie"in r){const k=Object.keys(r).find(x=>x!=="ie"),v=r[k];let a;
   switch(k){case"const":a=[d(v.name)];break;case"app":a=[e(v.fn),e(v.arg)];break;case"lam":case"forallE":a=[e(v.type),e(v.body)];break;case"letE":a=[e(v.type),e(v.value),e(v.body)];break;case"proj":a=[d(v.typeName),e(v.struct)];break;case"mdata":a=[e(v.expr)];break;case"natVal":a=[d(lookup(["Nat"]))];break;case"strVal":a=[d(lookup(["Char","ofNat"])),d(lookup(["String","ofList"]))];break;case"bvar":case"sort":a=[];break;default:throw Error(k)}
   if(r.ie!==expr.length)throw Error("expression sequence");expr.push(a);continue
  }
  const k=Object.keys(r)[0],v=r[k];
  const groups=k==="inductive"?[...v.inductiveVals.map(m=>["inductive",m]),...v.constructorVals.map(m=>["ctor",m]),...v.recursorVals.map(m=>["rec",m])]:[...(Array.isArray(v)?v:[v])].map(m=>[k,m]);
  const anchor=groups[0][1].name;
  for(const [kind,m] of groups){
   const edges=[e(m.type),...(m.all??[]).map(d),...(m.ctors??[]).map(d)];
   if(m.value!==undefined)edges.push(e(m.value));if(m.induct!==undefined)edges.push(d(m.induct));for(const q of m.rules??[])edges.push(d(q.ctor),e(q.rhs));
   if(k==="inductive")edges.push(...(m.name===anchor?groups.map(x=>d(x[1].name)):[d(anchor)]));
   if(decl.has(m.name))throw Error("duplicate");decl.set(m.name,{kind,edges});if(kind==="quot")quot.push(m.name)
  }
 }
 if(quot.length){decl.get(quot[0]).edges.push(...quot.map(d));for(const i of quot.slice(1))decl.get(i).edges.push(d(quot[0]))}
 return {expr,decl,root:lookup(["Nat","add_succ"]),resolve}
}

function runTests(raw){
 const check=(x,m)=>{if(!x)throw Error(m)};
 function compare(n,roots,expr,decl,page,cap,retain=true){
  const results=[];
  for(const [name,algorithm] of [["dfs",baseline],["locality",localityTraverse]]){
   const cache=new Map(),es=retain?new Set():null,ds=new Set();let loads=0,reads=0;
   const re=i=>{reads++;if(es){check(!es.has(i),"duplicate expression read");es.add(i)}
    const p=Math.floor(i/page);if(cache.has(p))cache.delete(p);else loads++;cache.set(p,1);if(cache.size>cap)cache.delete(cache.keys().next().value);return expr(i)};
   const t=Date.now(),c=algorithm(roots,re,decl,id=>{check(!ds.has(id),"duplicate declaration visit");ds.add(id)},n);
   results.push({name,counts:c,loads,reads,ms:Date.now()-t,es,ds})
  }
  const [a,b]=results;for(const k of ["expressions","declarations","edges"])check(a.counts[k]===b.counts[k],"count mismatch "+k);
  check(a.ds.size===b.ds.size&&[...a.ds].every(x=>b.ds.has(x)),"declaration closure mismatch");
  if(retain)check(a.es.size===b.es.size&&[...a.es].every(x=>b.es.has(x)),"expression closure mismatch");
  return results.map(({es,ds,...x})=>x)
 }
 const f=fixtureGraph(raw);check(f.expr.length===434&&f.decl.size===32&&f.root===102,"fixture identity");
 const actual=compare(f.expr.length,[f.root],i=>f.expr[i],i=>f.decl.get(i),16,4);
 const named=[];const real=localityTraverse([f.root],i=>f.expr[i],i=>f.decl.get(i),(id,v)=>named.push([f.resolve(id),v.kind]),f.expr.length);
 check(real.declarations===32,"actual fixture package closure");
 let graphChecks=0,controls=0;
 for(let k=1;k<=24;k++){
  const n=63+k*7,expr=i=>i===0?[]:[i,1+((Math.imul(i,2654435761)>>>0)%i),...(i%11===0?[-(i%5)-1]:[])];
  const ds=i=>i<5?{edges:[1+((i*71+19)%n),-((i+1)%5)-1]}:undefined;
  compare(n,[k%5],expr,ds,8+(k%4)*8,1+k%4);graphChecks++;
 }
 for(const fn of [()=>localityTraverse([0],()=>[],()=>null,()=>{},1),()=>localityTraverse([0],()=>[],()=>({edges:[2]}),()=>{},1),()=>localityTraverse([0],()=>[],()=>({edges:[NaN]}),()=>{},1),()=>localityTraverse([0],()=>null,()=>({edges:[1]}),()=>{},1)]){try{fn()}catch{controls++}}
 check(controls===4,"fail closed controls");
 const scaling=[];
 for(const n of [50000,100000,200000,400000]){
  const r=compare(n,[0],i=>i===0?[]:[i,1+((Math.imul(i,2654435761)>>>0)%i)],()=>({edges:[n]}),256,8,false);
  check(r[1].loads===Math.ceil(n/256),"descending DAG block bound");check(r[1].counts.expressions===n,"chain coverage");scaling.push({n,dfs:r[0],locality:r[1]})
 }
 return {actual:{root:f.resolve(f.root),expressions:f.expr.length,declarations:f.decl.size,results:actual,reachableNames:named.sort((a,b)=>JSON.stringify(a).localeCompare(JSON.stringify(b)))},graphChecks,controls,scaling};
}

function rewrite(source,implementation){
 const start=source.indexOf("function traverse("),end=source.indexOf("function selftest(",start);
 if(start<0||end<=start)throw Error("extractor anchor");
 let result=source.slice(0,start)+implementation.replace("function localityTraverse(","function traverse(")+"\n\n"+source.slice(end);
 const from="});flushOut();",to="},edges.count());flushOut();";
 if(result.split(from).length!==2)throw Error("traversal call anchor");
 result=result.replace(from,to);
 const seal="edges.seal();";
 if(result.split(seal).length!==2)throw Error("seal anchor");
 return result.replace(seal,seal+"\n   console.error('authenticated archive',file,digest,'bytes',bytes,'expressions',edges.count(),'declarations',decls.size,'begin locality traversal');");
}

import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {fileURLToPath} from 'node:url';
import {spawnSync} from 'node:child_process';
const args=process.argv.slice(2);
const blob=b=>crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');
if(args[0]==='test'){
 const b=fs.readFileSync(args[1]);if(blob(b)!=='d3cd35f1313b4e78b5fded9886e450112aa75def')throw Error('fixture blob');
 console.log(JSON.stringify(runTests(b.toString('utf8')),null,2));
}else{
 if(!args.includes('--out'))throw Error('use --out DIR [--challenge-only]');
 const source=fs.readFileSync(path.join(path.dirname(fileURLToPath(import.meta.url)),'rh_stream_export_closure.mjs'));
 if(blob(source)!=='bffe89b20ff5e297d921443492e918933c8e0d92')throw Error('original extractor blob mismatch');
 const tmp=fs.mkdtempSync(path.join(os.tmpdir(),'rh-locality-'));
 try{
  const script=path.join(tmp,'retry.mjs');fs.writeFileSync(script,rewrite(source.toString('utf8'),localityTraverse.toString()));
  const child=spawnSync(process.execPath,[script,...args],{stdio:'inherit',env:{...process.env,RH_LOCALITY_PROGRESS:'1'}});
  if(child.error)throw child.error;
  if(child.status!==0)throw Error('retry failed '+child.status+' '+child.signal);
 }finally{fs.rmSync(tmp,{recursive:true,force:true})}
}
