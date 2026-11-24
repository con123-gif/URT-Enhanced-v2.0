/* DEPENDENCIES — 2026-11-24 15:12 UTC — PARTIAL, executed V8 regression plus real CI result reconciliation.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed HEAD a398a113633f09458c977d81a56ff1cace6566b4 (15:10:31 UTC), not adopted. Preflight working SHA 980b933389d019d3c1b1f07177c928899fed2b66. Read SWARM_PROTOCOL, HANDOFF_QUEUE, 15-lane expansion, AGENTS, continuity, log/state/protocol excerpts and latest relevant peer integration, acceleration and kernel checkpoints. Not all specialist notes or blueprint reread. Physical CI not RH replay.
ACTUAL FULL CLOSURE: compute/rh-mutual-metadata-closure-20261124/status.json on cathedral-research-state, run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798, SHA 968720f55f6503e28ff4526260cb1e8b0526b983, PASS. SHA256 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, 61570595788 bytes, 1065214335 indexed expressions, 1484733 declarations; root 14065054; reached 1065212063 expressions, 1484705 declarations, 2133543711 edges. Hard missing 0; 5 metadata-only missing. ID 6019714 Formalism.FourierDecayAlt.P.CutBP.block_growth_bound_of_compact_coef, one mutualBlock witness owner 6019703 block_growth_bound_of_compact_coefCpt; no hard occurrences. Reachable axioms Classical.choice, Quot.sound, propext, no unusual axioms under this export policy. 1276.687362649s, max RSS 2875140 KiB, index 12782572020 bytes; named manifest artifact only 38823812 bytes SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf, not downloaded. Denominator is mixed explicit export/structural closure, NOT human-proof denominator or independent kernel recheck. Source/export binding remains open; peer native axiom cache discrepancy separately audited.
NEW: target six exact top-chain names; encode expression-reference kind in third padding slot of negative-bearing records, leaving 12-byte record width unchanged; ordinary ID range deliberately restricted (far above actual archive max). Reuse corrected authenticated archive parser and global census, skip repeat mixed traversal. This representation is NOT compatible with original mixed traversal. Direct per-role scans do not expand referenced declarations; output typed named edges, expression ID witnesses, number of distinct expression records, exact source anchor expectations and root/type/value IDs. Source pin matches are expectations only until full run; no statements or proof obligations dropped from evidence store. Fixed six anchors cost O(total bytes + total expanded name components + sum of reachable expression edges for role queries), at most 12 passes over any expression, not O(N) universal all-owner projection. Memory is peer parser plus per-role seen set and output; no claim of constant RSS. Source line numbers are advisory navigation; exact blob/name authoritative. Test ran in V8 against real pinned lean4export 3.0 Nat.add_succ sample; no Node CLI/full new export run locally. Synthetic scale is explicitly not an URT benchmark.
RESULTS {"checks":1661,"negativeControls":5,"expressions":434,"declarations":32,"roleSeeds":45,"roleEdges":99,"reads":679,"scale":[{"n":50000,"ms":84,"reads":50000,"childEdges":99998,"packedBytes":600000,"peakPending":1},{"n":100000,"ms":164,"reads":100000,"childEdges":199998,"packedBytes":1200000,"peakPending":1},{"n":200000,"ms":347,"reads":200000,"childEdges":399998,"packedBytes":2400000,"peakPending":1},{"n":400000,"ms":713,"reads":400000,"childEdges":799998,"packedBytes":4800000,"peakPending":1}]}
Replay: node rh_targeted_role_witness.mjs test /path/to/Nat.add_succ.ndjson; node rh_targeted_role_witness.mjs --out /tmp/rh-targeted. New compute job requests challenge and solution. Existing full closure not repeated, but authenticated streaming index necessarily rebuilt because previous expression index was transient. RESUME HERE: inspect compute/rh-targeted-role-witness-20261124/status.json and outputs/solution_direct_roles.json; reconcile exact typed root and anchor body dependencies against source and independent native kernel lane, then expand next target set. HANDOFF TO integration, audit, kernel extractor. OPEN.
*/

const PIN="40e56bab026552e089d7afcfeff08d2defb9c005";
const SOL="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";
const CH="bd484ac9886a96f26b1d9a7a59ebd45b7a70d102c015d4f31f9302bbdd6ab2b9";
const anchors=[
 ["riemannHypothesis","src/Main.lean","dbd5db70bc11b35f18fa5751216ab335321e7bfc",4,["rhOfAll"]],
 ["rhOfAll","src/Supplements/Kernels/MainTheorems.lean","6a542d7ce969a791fd12ce575f587e6bc29044bf",9,["Formalism.VW.rh_of_every","allChi"]],
 ["allChi","src/Supplements/Kernels/MainTheorems.lean","6a542d7ce969a791fd12ce575f587e6bc29044bf",7,["UpperTheory.FinalTheorems.everyCharacter"]],
 ["UpperTheory.FinalTheorems.everyCharacter","src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean","ee340012ab19713a8acfecf8adc6a331cbc2f1a4",10,["UpperTheory.FinalTheorems.everyCharacter_of_row","UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"]],
 ["UpperTheory.FinalTheorems.everyCharacter_of_row","src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean","ee340012ab19713a8acfecf8adc6a331cbc2f1a4",7,["UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin","UpperTheory.Zero.LLC.recTExists","UpperTheory.One.vwin_of_row"]],
 ["Formalism.VW.rh_of_every","src/Formalism/GammaFactorNonvanishing/CritLine.lean","95fa4da5c50119db164aa93944d106f22fdb576d",26,["Formalism.VW.rh_of_right","LFunction_modOne_eq"]]
];
const need=(x,msg)=>{if(!x)throw Error(msg)};
const key=JSON.stringify;
const tags={explicit_const:-2147483648,projection_carrier:-2147483647,literal_primitive:-2147483646};
// All ordinary signed IDs are in [-2147483647,2147483647]; these sentinels
// are interpreted ONLY in slot 3 of negative-bearing records. In this
// authenticated corpus IDs are far below that reserved range.
function pack(refs,r){
 need(refs.length<=3&&refs.every(x=>Number.isInteger(x)&&x!==0&&Math.abs(x)<2147483646),"invalid ordinary ref");
 const neg=refs.filter(x=>x<0).length;
 if(!neg)return [...refs,0,0,0].slice(0,3);
 const kind=r.const?"explicit_const":r.proj?"projection_carrier":r.natVal!==undefined||r.strVal!==undefined?"literal_primitive":null;
 need(kind&&refs.length<=2,"untyped negative expression");
 return [refs[0],refs[1]||0,tags[kind]];
}
function decode(row){
 need(Array.isArray(row)&&row.length===3&&row.every(Number.isInteger),"invalid packed record");
 const [a,b,c]=row;
 const kind=Object.keys(tags).find(k=>tags[k]===c);
 if(!kind){
  need(row.every(x=>x>=0&&x<2147483646),"negative without tag");
  need((a!==0||b===0&&c===0)&&(b!==0||c===0),"noncanonical padding");
  return {children:row.filter(Boolean).map(x=>x-1),refs:[]};
 }
 need(a<0&&a> -2147483646&&b> -2147483646&&b<2147483646,"invalid tagged ID");
 if(kind==="explicit_const")need(b===0,"const layout");
 if(kind==="projection_carrier")need(b>0,"projection layout");
 if(kind==="literal_primitive")need(b<=0,"literal layout");
 return {children:b>0?[b-1]:[],refs:[a,...(b<0?[b]:[])].map(x=>({kind,target:-x-1}))};
}
function project(expr,read,decls,nameOf,n){
 need(Number.isInteger(expr)&&expr>=0&&expr<n,"bad root");
 const seen=new Set([expr]),stack=[expr],refs=new Map();
 let childEdges=0,referenceOccurrences=0,peakPending=1;
 while(stack.length){
  const e=stack.pop(),r=decode(read(e));
  for(const {kind,target} of r.refs){
   need(decls.has(target),"missing declaration "+target);
   const k=kind+":"+target;
   if(!refs.has(k)){const nameParts=nameOf(target);need(Array.isArray(nameParts),"missing name");refs.set(k,{kind,target,nameParts,targetKind:decls.get(target).kind,witnessExpression:e,distinctExpressionRecords:0});}
   refs.get(k).distinctExpressionRecords++;referenceOccurrences++;
  }
  for(const x of r.children){
   childEdges++;need(x>=0&&x<n,"missing expression "+x);
   if(!seen.has(x)){seen.add(x);stack.push(x)}
  }
  peakPending=Math.max(peakPending,stack.length);
 }
 return {expressionRoot:expr,expressionsRead:seen.size,childEdges,referenceOccurrences,peakPending,references:[...refs.values()]};
}
function select(decls,nameOf,wanted){
 const lookup=new Map(wanted.map(x=>[key(x.split(".")),x])),found=new Map();
 for(const [id,v] of decls){
  const k=lookup.get(key(nameOf(id)));
  if(k!==undefined){need(!found.has(k),"duplicate tagged name");found.set(k,{id,v})}
 }
 return found;
}
function rewriteForProjection(src,loc,mut,moduleURL){
 const cut=mut.indexOf("function test(");need(cut>0,"peer rewrite anchor");
 const rewrite=new Function(mut.slice(0,cut)+"\nreturn rewrite;")();
 let p=rewrite(src,loc);
 const once=(a,b)=>{need(p.split(a).length===2,"nonunique patch anchor "+a);p=p.replace(a,b)};
 // Encode tag into existing zero padding, no extra index bytes. The old
 // mixed closure reader must NEVER consume this representation.
 once("edges.append(r.ie,refs);","edges.append(r.ie,packTagged(refs,r));");
 once("const root=lookup(ROOT),axioms=[]","const root=lookup(ROOT);\n   if(audit.hardMissing!==0)fail('hard reference census failed');\n   await (await import("+key(moduleURL)+")).writeProjection({out,file,digest,bytes,meta,n:edges.count(),root,decls,nameOf,read:edges.read,challenge});\n   return;\n   const axioms=[]");
 // Retain declarations and census from peer parser, not its original traversal.
 once("function fail(msg){throw Error(msg)}","const packTagged="+pack.toString()+";\nconst need="+need.toString()+";\nconst tags="+key(tags)+";\nfunction fail(msg){throw Error(msg)}");
 return p;
}
function test(raw,src,loc,mut){
 let checks=0,negativeControls=0;const ck=(x,m)=>{need(x,m);checks++},reject=fn=>{let bad=false;try{fn()}catch{bad=true}ck(bad,"expected rejection");negativeControls++};
 const patch=rewriteForProjection(src,loc,mut,"file:///fixture.mjs");
 const core=new Function(patch.slice(0,patch.indexOf("import fs"))+"\nreturn {exprEdges,addDeclarations,packTagged};")();
 const names=[[]],rawExpr=[],packed=[],decls=new Map(),seeds=[];
 const rows=raw.trimEnd().split("\n").map(JSON.parse);
 for(const r of rows)if("in" in r){const a=r.str||r.num;ck(r.in===names.length,"name order");names.push([...names[a.pre],r.str?a.str:a.i])}
 const find=s=>names.findIndex(a=>key(a)===key(s.split(".")));
 const nameOf=i=>names[i];
 for(const r of rows){
  if("meta"in r||"in"in r||"il"in r)continue;
  if("ie"in r){
   ck(r.ie===rawExpr.length,"expression order");rawExpr.push(r);
   const refs=core.exprEdges(r,find),p=core.packTagged(refs,r);
   ck(key(p)===key(pack(refs,r)),"injected encoder");
   packed.push(p);continue;
  }
  const k=Object.keys(r)[0],v=r[k];
  const norm=k==="inductive"?[{inductive:{types:v.types??v.inductiveVals,ctors:v.ctors??v.constructorVals,recs:v.recs??v.recursorVals}}]:(Array.isArray(v)?v:[v]).map(m=>({[k]:m}));
  for(const q of norm)core.addDeclarations(q,(id,kind,edges)=>{decls.set(id,{kind,edges});seeds.push({id,role:"type",expr:edges[0]-1});if(["def","thm","opaque"].includes(kind))seeds.push({id,role:"value",expr:edges[1]-1})});
 }
 // Independent record-shape oracle for all expression kinds.
 function oracle(r){
  let children=[],refs=[];
  const add=(kind,target)=>refs.push({kind,target});
  if(r.const)add("explicit_const",r.const.name);
  else if(r.app)children=[r.app.fn,r.app.arg];
  else if(r.lam||r.forallE){const a=r.lam||r.forallE;children=[a.type,a.body]}
  else if(r.letE)children=[r.letE.type,r.letE.value,r.letE.body];
  else if(r.proj){children=[r.proj.struct];add("projection_carrier",r.proj.typeName)}
  else if(r.mdata)children=[r.mdata.expr];
  else if("natVal"in r)add("literal_primitive",find("Nat"));
  else if("strVal"in r){add("literal_primitive",find("Char.ofNat"));add("literal_primitive",find("String.ofList"))}
  return {children,refs};
 }
 for(let i=0;i<rawExpr.length;i++)ck(key(decode(packed[i]))===key(oracle(rawExpr[i])),"typed codec roundtrip "+i);
 let reads=0,edges=0;
 for(const seed of seeds){
  const got=project(seed.expr,i=>packed[i],decls,nameOf,packed.length),todo=[seed.expr],seen=new Set(),expected=new Map();
  while(todo.length){const i=todo.pop();if(seen.has(i))continue;seen.add(i);const r=oracle(rawExpr[i]);todo.push(...r.children);
   for(const v of r.refs){const k=v.kind+":"+v.target;expected.set(k,(expected.get(k)||0)+1)}}
  ck(got.expressionsRead===seen.size&&got.references.length===expected.size,"direct size");
  for(const v of got.references){ck(expected.get(v.kind+":"+v.target)===v.distinctExpressionRecords,"direct edge multiplicity");ck(oracle(rawExpr[v.witnessExpression]).refs.some(x=>x.kind===v.kind&&x.target===v.target),"witness");edges++}
  reads+=got.expressionsRead;
 }
 const root=select(decls,nameOf,["Nat.add_succ","Nat.add.succ"]);ck(root.size===1&&root.get("Nat.add_succ").id===102,"tagged root");
 ck(select(new Map([[1,{}],[2,{}]]),i=>i===1?["a.b"]:["a","b"],["a.b"]).get("a.b").id===2,"literal dot name not conflated");
 ck(key(decode(pack([-7],{natVal:"1"})).refs)==='[{"kind":"literal_primitive","target":6}]',"nat literal");
 ck(decode(pack([-8,-9],{strVal:"x"})).refs.length===2,"string literal");
 reject(()=>decode([-2,0,0]));reject(()=>decode([-2,1,tags.explicit_const]));reject(()=>decode([0,1,0]));reject(()=>project(0,()=>[-99,0,tags.explicit_const],decls,nameOf,1));reject(()=>project(0,()=>[2,0,0],decls,nameOf,1));
 const scale=[];
 for(const n of [50000,100000,200000,400000]){
  const t=Date.now(),r=project(n-1,i=>i?[i,i,0]:[0,0,0],decls,nameOf,n),ms=Date.now()-t;
  ck(r.expressionsRead===n&&r.childEdges===2*(n-1),"linear reads");
  scale.push({n,ms,reads:r.expressionsRead,childEdges:r.childEdges,packedBytes:n*12,peakPending:r.peakPending});
 }
 return {checks,negativeControls,expressions:packed.length,declarations:decls.size,roleSeeds:seeds.length,roleEdges:edges,reads,scale};
}

import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import crypto from "node:crypto";
import {fileURLToPath,pathToFileURL} from "node:url";
import {spawnSync} from "node:child_process";
export function writeProjection({out,file,digest,bytes,meta,n,root,decls,nameOf,read,challenge}){
 need(digest===(challenge?CH:SOL)&&bytes===(challenge?350862311:61570595788)&&n===(challenge?6112241:1065214335)&&decls.size===(challenge?53722:1484733)&&root===(challenge?326835:14065054),"archive identity");
 const start=Date.now(),found=select(decls,nameOf,anchors.map(a=>a[0])),reports=[];
 for(const [name,sourcePath,blob,line,expectedValueNames] of anchors){
  const x=found.get(name),source={pin:PIN,path:sourcePath,blob,line,name,expectedValueNames};
  if(!x){reports.push({source,status:"NOT_EXPORTED"});continue}
  need(x.v.kind==="thm"&&x.v.edges.length===2&&x.v.edges.every(e=>e>0),"unexpected target declaration shape "+name);
  const type=project(x.v.edges[0]-1,read,decls,nameOf,n),value=project(x.v.edges[1]-1,read,decls,nameOf,n);
  const actual=new Set(value.references.filter(x=>x.kind==="explicit_const").map(x=>key(x.nameParts)));
  const missingExpected=expectedValueNames.filter(x=>!actual.has(key(x.split("."))));
  reports.push({source,status:"EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",id:x.id,kind:x.v.kind,type,value,missingExpected,mutualBlock:x.v.mutualBlock.map(id=>({id,nameParts:nameOf(id)}))});
 }
 need(found.get("riemannHypothesis")?.id===root,"root name binding");
 const result={status:"AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK",file,digest,bytes,meta,n,root,indexedDeclarations:decls.size,projectionMs:Date.now()-start,maxRssKiB:process.resourceUsage().maxRSS,reports};
 fs.writeFileSync(path.join(out,challenge?"challenge_direct_roles.json":"solution_direct_roles.json"),JSON.stringify(result,null,2)+"\n");
 console.log(JSON.stringify({status:result.status,file,projectionMs:result.projectionMs,anchors:reports.map(r=>({name:r.source.name,status:r.status,id:r.id,typeEdges:r.type?.references.length,valueEdges:r.value?.references.length,missingExpected:r.missingExpected}))}));
 // Report before failing: challenge is intentionally incomplete; solution
 // missing source anchors require investigation, not a fabricated match.
 if(!challenge)need(reports.every(r=>r.id!==undefined&&r.missingExpected.length===0),"source anchor mismatch; inspect emitted report");
}
const here=path.dirname(fileURLToPath(import.meta.url));
const blob=b=>crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");
const readPeer=(name,sha)=>{const b=fs.readFileSync(path.join(here,name));need(blob(b)===sha,"peer blob "+name);return b.toString("utf8")};
function main(args){
 const s=readPeer("rh_stream_export_closure.mjs","bffe89b20ff5e297d921443492e918933c8e0d92"),
 l=readPeer("rh_locality_frontier_retry.mjs","336ea4ba85ba9d81235313e44f3430c112c76c45"),
 m=readPeer("rh_mutual_metadata_closure.mjs","a6d43d873703f5e632df199ac6165ed13450c3bd");
 if(args[0]==="test"){
  const f=fs.readFileSync(args[1]);need(blob(f)==="d3cd35f1313b4e78b5fded9886e450112aa75def","fixture hash");console.log(JSON.stringify(test(f.toString("utf8"),s,l,m),null,2));return;
 }
 need(args.includes("--out"),"use --out DIR [--challenge-only]");
 const tmp=fs.mkdtempSync(path.join(os.tmpdir(),"rh-targeted-"));
 try{const p=path.join(tmp,"run.mjs");fs.writeFileSync(p,rewriteForProjection(s,l,m,import.meta.url));const c=spawnSync(process.execPath,[p,...args],{stdio:"inherit"});if(c.error)throw c.error;need(c.status===0,"projection child "+c.status+" "+c.signal)}finally{fs.rmSync(tmp,{recursive:true,force:true})}
}
if(process.argv[1]&&pathToFileURL(path.resolve(process.argv[1])).href===import.meta.url)main(process.argv.slice(2));
