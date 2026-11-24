/* DEPENDENCIES — 2026-11-24 14:12 UTC — PARTIAL / SOURCE-MATCHED kernel-metadata correction and tested extractor regression.
Base Cathedral revision at commit refresh: 1dcb00df4415e582ae86635c87aa94a1e2d12814.
Pinned RH: 40e56bab026552e089d7afcfeff08d2defb9c005; src/Main.lean theorem riemannHypothesis := rhOfAll; Lean v4.33.1. Observed new upstream HEAD 5ba3d66a2a5acdcd70e2482d73e05b41d7116186 has changed root body to Claim.zeta LFunction_ne_zero_of_half_lt_re and toolchain to v4.37.0-rc1; not assumed equivalent for graph purposes. Maintain separate pins.
Read protocol, handoff, AGENTS, continuity, research state/log/protocol, recent structure/math/audit/integration/kernel peer changes. Latest orchestrator physical PASS at 14:08:40 UTC, run 45406895276, not RH replay.
NEW ACTUAL RUN: https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45401413615 (compute/rh-locality-frontier-retry-20261124/status.json and job.log.tail.txt, cathedral-research-state). Authenticated full solution SHA256 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e; 61,570,595,788 uncompressed bytes, 1,065,214,335 expressions, 1,484,733 declaration records. Traversal exceeded 610,000,000 expressions / 766,354 declarations, then failed on missing declaration name ID 6019714. Job wall 1605.13 s; no complete root closure. Challenge previously authenticated and completed, with sorryAx expected in challenge. Full archive authentication is not kernel verification or independent binding of archive to pinned source. Original timeout is superseded by the now-localized failure.
EXACT SOURCE CORRECTION: Lean githash 819816b2e0a3bf405af45ae5c7af2491d8f5bee6 src/Lean/Declaration.lean blob 52a32d4fdeae1fe12e46cd46a1635420a3b62195 lines 120–163 explicitly says DefinitionVal.all is user mutual-block metadata unused by kernel; TheoremVal.all and OpaqueVal.all refer to that comment. InductiveVal.all / RecursorVal.all are different and retained. lean4export 15f6055e299ad5b89345e533cc2192f4cc00f659 Export.lean blob e77a14f00ee6290ab7e6e6f95765fce3a14626a8 lines 235–290 dumps type/value dependencies but serializes .all names without dumping their declarations. Thus prior graph conflated optional grouping metadata with proof references; a missing metadata sibling alone is not a missing proof dependency. Whether ID 6019714 is such a sibling is UNKNOWN until diagnostic run. No assumptions, statement/type/proof refs, literal refs or inductive/quotient structural refs removed. All original mutualBlock names are retained separately in reachable rows, and all absent sibling owner/name pairs are emitted from the authenticated corpus. Hard missing refs still fail closed; global unresolved refs do not alone establish root reachability.
NEW TEST: real pinned lean4export Nat.add_succ 3.0 export blob d3cd35f1313b4e78b5fded9886e450112aa75def normalized record shapes only (inductive keys and array-valued def/thm). First fixture attempt failed on old record shape; corrected and rerun. Tested in Code Mode V8: exact node closure, lossless edge partition, absent mutual sibling counterexample, hard reference counterexamples, typed census, original selftest, synthetic scan scaling. Connector blob metadata verified; CLI verifies bytes. Census stores first witness per kind/ID, exact target name and bounded samples, O(R + fixed page space) work and O(N) sparse typed payload for dense name range. Original locality graph traversal unchanged. No whole-archive retry executed locally (network unavailable), no URT advantage, no kernel replay, no RH completion.
RESULTS {"checks":590,"negativeControls":4,"fixture":{"expressions":434,"declarations":32,"oldEdges":921,"hardEdges":908,"metadataRefs":13,"reachableExpressions":434,"reachableDeclarations":32,"axioms":[]},"selftest":{"fixture":{"expressions":9,"declarations":8,"edges":38,"locality":{"forwardInsertions":0,"blockTransitions65536":1,"peakPending":4,"peakDeclQueue":2,"expressionBitsetBytes":25420,"declarationSeenBytes":65536}},"negativeControls":2,"sharedChain":{"expressions":100001,"declarations":1,"edges":200001,"locality":{"forwardInsertions":0,"blockTransitions65536":2,"peakPending":1,"peakDeclQueue":1,"expressionBitsetBytes":25420,"declarationSeenBytes":65536}}},"scaling":[{"references":50000,"buildMs":13,"finishMs":9,"payloadBytes":1310720,"missing":50},{"references":100000,"buildMs":28,"finishMs":17,"payloadBytes":2621440,"missing":100},{"references":200000,"buildMs":58,"finishMs":34,"payloadBytes":5242880,"missing":200},{"references":400000,"buildMs":139,"finishMs":71,"payloadBytes":9175040,"missing":400}]}
Reproduce: node rh_mutual_metadata_closure.mjs test /path/to/Nat.add_succ.ndjson; node rh_mutual_metadata_closure.mjs --out /tmp/rh-metadata. Original source and locality blobs pinned in wrapper; source transformation anchors checked in V8. New job registered with precise diagnostics; full wrapper execution pending CI.
RESUME HERE: inspect compute/rh-mutual-metadata-closure-20261124/status.json and outputs/solution_reference_census.json, solution_missing_metadata_owners.jsonl, summary.json or solution_closure_failure.json. Resolve ID 6019714 by exact tagged name and witness kinds; if hard missing and reachable, recover its true declaration from upstream or native Lean exporter, never discard it. If complete hard closure succeeds, compare axioms, root/type/body IDs and source mapping with native independent graph and record denominator. HANDOFF TO integration, audit, acceleration, kernel extractor. Project OPEN.
*/
function makeCensus(){
 const labels=["constant","projection","literal","structural","mutualBlock"];
 const P=65536,pages=labels.map(()=>new Map()),occurrences=labels.map(()=>0);
 const target=6019714,targetWitnesses=[];let targetOccurrences=0;
 function note(kind,id,source){
  if(!Number.isInteger(kind)||kind<0||kind>=labels.length||!Number.isInteger(id)||id<0||id>=2147483647||!Number.isInteger(source)||source<0||source>=2147483647)throw Error("invalid census reference");
  occurrences[kind]++;
  const p=Math.floor(id/P),j=id%P;let a=pages[kind].get(p);
  if(!a){a=new Uint32Array(P);pages[kind].set(p,a)}
  if(!a[j])a[j]=source+1;
  if(id===target){targetOccurrences++;if(targetWitnesses.length<64)targetWitnesses.push({kind:labels[kind],source})}
 }
 function finish(decls,nameOf){
  const missing=new Map(),byKind=labels.map(()=>0);let payload=0;
  for(let k=0;k<labels.length;k++)for(const [p,a] of pages[k]){
   payload+=a.byteLength;
   for(let j=0;j<P;j++)if(a[j]){
    const id=p*P+j;if(decls.has(id))continue;
    byKind[k]++;
    let row=missing.get(id);if(!row){row={id,nameParts:nameOf(id),witnesses:[]};missing.set(id,row)}
    const source=a[j]-1;
    row.witnesses.push({kind:labels[k],source,sourceNameParts:k>=3?nameOf(source):null});
   }
  }
  const rows=[...missing.values()]; // no sorting needed: linear scan and stable encounter order
  return {status:"GLOBAL_EXPORT_REFERENCE_CENSUS_NOT_ROOT_CLOSURE",occurrences:Object.fromEntries(labels.map((k,i)=>[k,occurrences[i]])),missingByKind:Object.fromEntries(labels.map((k,i)=>[k,byKind[i]])),missingNames:rows.length,metadataOnlyMissing:rows.filter(r=>r.witnesses.every(w=>w.kind==="mutualBlock")).length,hardMissing:rows.filter(r=>r.witnesses.some(w=>w.kind!=="mutualBlock")).length,indexPayloadBytes:payload,target:{id:target,nameParts:nameOf(target),exported:decls.has(target),occurrences:targetOccurrences,witnesses:targetWitnesses.map(w=>({...w,sourceNameParts:["structural","mutualBlock"].includes(w.kind)?nameOf(w.source):null}))},rows};
 }
 return {note,finish};
}

function rewrite(source,localitySource){
 function once(s,from,to){if(s.split(from).length!==2)throw Error("missing/nonunique patch anchor: "+from.slice(0,80));return s.replace(from,to)}
 const a=localitySource.indexOf("function localityTraverse("),b=localitySource.indexOf("function baseline(",a);
 if(a<0||b<=a)throw Error("locality source anchors");
 const t=localitySource.slice(a,b).replace("function localityTraverse(","function traverse(");
 let s=source;
 // Change ONLY the non-inductive .all metadata edge, not inductive packages.
 s=once(s,'const k=ks[0],m=r[k],edges=[eid(m.type),...(m.all||[]).map(did)];\n  if(["def","opaque","thm"].includes(k))edges.push(eid(m.value));\n  put(m.name,k,edges);','const k=ks[0],m=r[k],edges=[eid(m.type)];\n  const hasMutual=["def","opaque","thm"].includes(k);\n  const mutualBlock=hasMutual?(m.all||[]):[];\n  if(!Array.isArray(mutualBlock))fail("invalid mutual metadata");\n  mutualBlock.forEach(did);\n  if(hasMutual)edges.push(eid(m.value));else edges.push(...(m.all||[]).map(did));\n  put(m.name,k,edges,mutualBlock);');
 let i=s.indexOf("function traverse("),j=s.indexOf("function selftest(",i);
 if(i<0||j<=i)throw Error("traverse anchors");
 s=s.slice(0,i)+t+"\n"+makeCensus.toString()+"\n"+s.slice(j);
 s=once(s,"});flushOut();","},edges.count());flushOut();");
 s=once(s,"const names=[null],decls=new Map(),special=new Map(),quot=[];","const names=[null],decls=new Map(),special=new Map(),quot=[],census=makeCensus();");
 s=once(s,"function put(id,kind,refs){","function put(id,kind,refs,mutualBlock=[]){");
 s=once(s,"decls.set(id,{kind,edges:refs});","decls.set(id,{kind,edges:refs,mutualBlock});\n   for(const ref of refs)if(ref<0)census.note(3,-ref-1,id);\n   for(const other of mutualBlock)census.note(4,other,id);");
 s=once(s,"if(Object.hasOwn(r,'ie')){edges.append(r.ie,exprEdges(r,lookup));return}","if(Object.hasOwn(r,'ie')){const refs=exprEdges(r,lookup);edges.append(r.ie,refs);for(const ref of refs)if(ref<0){const kind=r.const?0:r.proj?1:2;census.note(kind,-ref-1,r.ie)}return}");
 s=once(s,"edges.seal();","edges.seal();\n   const nameOf=id=>id===0?[]:names[id]?nameParts(id):null;\n   const audit=census.finish(decls,nameOf);\n   const prefix=challenge?'challenge_':'solution_';\n   fs.writeFileSync(path.join(out,prefix+'reference_census.json'),JSON.stringify({archive:file,digest,bytes,meta,indexedExpressions:edges.count(),indexedDeclarations:decls.size,...audit},null,2));\n   console.error('authenticated archive',file,digest,'bytes',bytes,'expressions',edges.count(),'declarations',decls.size,'global missing hard',audit.hardMissing,'metadata-only',audit.metadataOnlyMissing,'target',JSON.stringify(audit.target),'begin hard-reference closure');\n   let metadataOwners=0;\n   const mf=fs.openSync(path.join(out,prefix+'missing_metadata_owners.jsonl'),'w');\n   try{for(const [id,v] of decls){const absent=v.mutualBlock.filter(n=>!decls.has(n));if(absent.length){metadataOwners++;fs.writeSync(mf,JSON.stringify({owner:id,ownerNameParts:nameParts(id),absent:absent.map(n=>({id:n,nameParts:nameOf(n)}))})+'\\n')}}}finally{fs.closeSync(mf)}");
 s=once(s,"const row=JSON.stringify({id,nameParts:nameParts(id),kind:v.kind,refs:v.edges})+'\\n';","const row=JSON.stringify({id,nameParts:nameParts(id),kind:v.kind,refs:v.edges,mutualBlock:v.mutualBlock.map(n=>({id:n,nameParts:nameOf(n),exported:decls.has(n)}))})+'\\n';");
 s=once(s,"}finally{fs.closeSync(fd)}","}catch(e){fs.writeFileSync(path.join(out,prefix+'closure_failure.json'),JSON.stringify({status:'PARTIAL_NO_COMPLETE_ROOT_CLOSURE',archive:file,digest,error:String(e),globalMissing:audit.missingNames,target:audit.target},null,2));throw e}finally{fs.closeSync(fd)}");
 s=once(s,"status:'EXPLICIT_EXPORT_REFERENCE_CLOSURE_NOT_KERNEL_RECHECK'","status:'EXPLICIT_EXPORT_REFERENCE_AND_INDUCTIVE_PACKAGE_CLOSURE_NOT_KERNEL_RECHECK',mutualMetadataOwnersWithAbsentMembers:metadataOwners,globalReferenceCensus:{hardMissing:audit.hardMissing,metadataOnlyMissing:audit.metadataOnlyMissing,target:audit.target}");
 s=once(s,"'literal and inductive/quotient structural references conservatively retained'","'literal and inductive/quotient structural references conservatively retained; def/thm/opaque mutualBlock metadata preserved separately, not a kernel reference'");
 return s;
}

function test(raw,source,localitySource){
 const check=(v,m)=>{if(!v)throw Error(m)};
 const patched=rewrite(source,localitySource),pure=patched.slice(0,patched.indexOf("import fs"));
 const core=new Function(pure+"\nreturn {eid,did,exprEdges,addDeclarations,traverse,selftest,makeCensus};")();
 const old=new Function(source.slice(0,source.indexOf("import fs"))+"\nreturn {eid,did,exprEdges,addDeclarations,traverse};")();
 let tests=0,controls=0;
 function ck(v,m){check(v,m);tests++}
 function reject(f,needle){let e;try{f()}catch(err){e=err}check(e&&String(e).includes(needle),"negative control "+needle+" got "+e);controls++}
 const rows=raw.trimEnd().split("\n").map(JSON.parse);
 const names=[null];for(const r of rows)if("in"in r){ck(r.in===names.length,"name sequence");let v=r.str||r.num;names.push([v.pre,r.str?v.str:v.i])}
 function parts(id){if(id>=names.length)return null;let out=[];while(id){let a=names[id];if(!a)throw Error("name");out.push(a[1]);id=a[0]}return out.reverse()}
 const find=p=>names.findIndex((_,i)=>i&&JSON.stringify(parts(i))===JSON.stringify(p));
 const root=find(["Nat","add_succ"]);ck(root===102,"real fixture root");
 const expr=[],decl=new Map(),oldDecl=new Map(),census=core.makeCensus();
 for(const r0 of rows){
  if("meta"in r0||"in"in r0||"il"in r0)continue;
  if("ie"in r0){
   ck(r0.ie===expr.length,"expression sequence");
   const a=core.exprEdges(r0,n=>find(n.split(".")));
   expr.push(a);for(const ref of a)if(ref<0)census.note(r0.const?0:r0.proj?1:2,-ref-1,r0.ie);continue;
  }
  // 3.0 fixture has array-valued def/thm records and old inductive field names.
  const k=Object.keys(r0)[0],v=r0[k];
  const normalized=k==="inductive"?[{inductive:{types:v.types??v.inductiveVals,ctors:v.ctors??v.constructorVals,recs:v.recs??v.recursorVals}}]:(Array.isArray(v)?v:[v]).map(m=>({[k]:m}));
  for(const r of normalized){
   core.addDeclarations(r,(id,kind,edges,mutualBlock=[])=>{decl.set(id,{kind,edges,mutualBlock});for(const q of edges)if(q<0)census.note(3,-q-1,id);for(const n of mutualBlock)census.note(4,n,id)});
   old.addDeclarations(r,(id,kind,edges)=>oldDecl.set(id,{kind,edges}));
  }
 }
 const run=(alg,ds,ex=expr)=>{const seen=[];const counts=alg([root],id=>ex[id],id=>ds.get(id),id=>seen.push(id),ex.length);return {counts,seen:seen.sort((a,b)=>a-b)}};
 const oldRes=run(old.traverse,oldDecl),newRes=run(core.traverse,decl);
 ck(expr.length===434&&decl.size===32,"fixture identity");
 ck(oldRes.counts.expressions===newRes.counts.expressions&&JSON.stringify(oldRes.seen)===JSON.stringify(newRes.seen),"fixture exact node closure");
 const metaRefs=[...decl.values()].reduce((n,v)=>n+v.mutualBlock.length,0);
 ck(oldRes.counts.edges-newRes.counts.edges===metaRefs,"only metadata edges removed");
 for(const [id,v] of decl)ck(JSON.stringify([...v.edges,...v.mutualBlock.map(core.did)].sort((a,b)=>a-b))===JSON.stringify([...oldDecl.get(id).edges].sort((a,b)=>a-b)),"lossless edge partition");
 const ac=census.finish(decl,parts);ck(ac.missingNames===0,"fixture census no missing");
 const absent=names.length;names.push([0,"not_exported_mutual_sibling"]);
 const ds=new Map(decl),ov=new Map(oldDecl);
 ds.set(root,{...ds.get(root),mutualBlock:[...ds.get(root).mutualBlock,absent]});
 ov.set(root,{...ov.get(root),edges:[...ov.get(root).edges,core.did(absent)]});
 reject(()=>run(old.traverse,ov),"missing decl");
 ck(JSON.stringify(run(core.traverse,ds).seen)===JSON.stringify(newRes.seen),"metadata-only missing sibling does not change hard closure");
 const mc=core.makeCensus();mc.note(4,absent,root);
 let report=mc.finish(ds,parts);
 ck(report.metadataOnlyMissing===1&&report.hardMissing===0&&report.rows[0].witnesses[0].source===root,"metadata witness");
 for(const kind of [0,1,2,3]){
  const cc=core.makeCensus();cc.note(4,absent,root);cc.note(kind,absent,root);
  const rr=cc.finish(ds,parts);ck(rr.hardMissing===1&&rr.metadataOnlyMissing===0&&rr.rows[0].witnesses.length===2,"hard+metadata not masked");
 }
 let hard=new Map(ds);hard.set(root,{...ds.get(root),edges:[...ds.get(root).edges,core.did(absent)]});
 reject(()=>run(core.traverse,hard),"missing decl");
 let ex=expr.slice();ex.push([core.did(absent)]);hard=new Map(ds);hard.set(root,{...ds.get(root),edges:[...ds.get(root).edges,core.eid(expr.length)]});
 reject(()=>run(core.traverse,hard,ex),"missing decl");
 for(const k of ["def","opaque","thm"]){
  const r={[k]:{name:root,type:0,value:1,all:[root,absent]}};
  core.addDeclarations(r,(id,kind,edges,mb)=>ck(id===root&&kind===k&&JSON.stringify(edges)==="[1,2]"&&JSON.stringify(mb)===JSON.stringify([root,absent]),"all partition "+k));
 }
 core.addDeclarations({inductive:{types:[{name:root,type:0,all:[root,absent],ctors:[]}],ctors:[],recs:[]}},(id,k,refs,mb=[])=>ck(refs.includes(core.did(absent))&&!mb.length,"inductive all stays hard"));
 reject(()=>mc.note(4,-1,root),"invalid census reference");
 const t=core.makeCensus();t.note(0,6019714,10);t.note(4,6019714,root);const tr=t.finish(new Map(),parts);ck(tr.target.occurrences===2&&tr.target.witnesses.length===2&&tr.hardMissing===1,"known missing ID diagnostics");
 const self=core.selftest();ck(self.fixture.declarations===8&&self.negativeControls===2,"original regression");
 const scaling=[];
 for(const n of [50000,100000,200000,400000]){
  const c=core.makeCensus(),defs=new Map(),start=Date.now();
  for(let i=1;i<=n;i++){c.note(i%5,i,i);if(i%1000!==0)defs.set(i,1)}
  const mid=Date.now(),r=c.finish(defs,id=>[id]),end=Date.now();
  ck(r.missingNames===n/1000&&r.rows.every(x=>x.id%1000===0),"census scale exact");
  scaling.push({references:n,buildMs:mid-start,finishMs:end-mid,payloadBytes:r.indexPayloadBytes,missing:r.missingNames});
 }
 return {checks:tests,negativeControls:controls,fixture:{expressions:expr.length,declarations:decl.size,oldEdges:oldRes.counts.edges,hardEdges:newRes.counts.edges,metadataRefs:metaRefs,reachableExpressions:newRes.counts.expressions,reachableDeclarations:newRes.counts.declarations,axioms:newRes.seen.filter(id=>decl.get(id).kind==="axiom").map(parts)},selftest:self,scaling};
}
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {fileURLToPath} from 'node:url';
import {spawnSync} from 'node:child_process';
const args=process.argv.slice(2),here=path.dirname(fileURLToPath(import.meta.url));
const blob=b=>crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');
const read=(f,sha)=>{const b=fs.readFileSync(path.join(here,f));if(blob(b)!==sha)throw Error('source blob mismatch '+f);return b.toString('utf8')};
const source=read('rh_stream_export_closure.mjs','bffe89b20ff5e297d921443492e918933c8e0d92');
const loc=read('rh_locality_frontier_retry.mjs','336ea4ba85ba9d81235313e44f3430c112c76c45');
if(args[0]==='test'){
 const b=fs.readFileSync(args[1]);if(blob(b)!=='d3cd35f1313b4e78b5fded9886e450112aa75def')throw Error('fixture blob mismatch');
 console.log(JSON.stringify(test(b.toString('utf8'),source,loc),null,2));
}else{
 if(!args.includes('--out'))throw Error('use --out DIR [--challenge-only]');
 const tmp=fs.mkdtempSync(path.join(os.tmpdir(),'rh-metadata-'));
 try{
  const script=path.join(tmp,'retry.mjs');fs.writeFileSync(script,rewrite(source,loc));
  const child=spawnSync(process.execPath,[script,...args],{stdio:'inherit',env:{...process.env,RH_LOCALITY_PROGRESS:'1'}});
  if(child.error)throw child.error;
  if(child.status!==0)throw Error('metadata retry failed '+child.status+' '+child.signal);
 }finally{fs.rmSync(tmp,{recursive:true,force:true})}
}
