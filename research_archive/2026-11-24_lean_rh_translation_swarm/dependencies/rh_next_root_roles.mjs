/* DEPENDENCIES 2026-11-24 20:12 UTC — PARTIAL. Next authenticated direct-role frontier.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; original Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc retrieved; upstream HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd not adopted. Base observed fff5a2d099402a3f819e553f5317c3c8a2702213. Preflight SWARM_PROTOCOL, HANDOFF_QUEUE, expansion, AGENTS, runner log/protocol and continuity/state excerpts, CI #391 (physical, not RH), latest integration 20:00, kernel run14, acceleration run14 and math/structure/audit excerpts. Blueprint not reopened. No physical gates altered.
Inputs: previous verified root-path certificate Git blob a3e1029ee0204bb7d883e8f0aee87e7ccdc2f3a3; actual 47-target report blob d49fbcc22a2382039986b09ff91dd11af2ef2e7b and earlier six-anchor blob 64b935e4ef309f6c555912a377012c7708eda510 remain upstream evidence. Ten exact previously root-linked IDs with incoming expression witnesses, plus eight optional peer probes; no missing optional probe is inferred unreachable. Deduction.poleData_abstract already projected, not duplicated. Exact tagged matching, no suffix search. Source matches not proof edges. Source/export full binding and independent kernel replay open.
New: extend direct-role extractor beyond constructors to inductive packages and recursors, preserve every encoded structural entry in order, distinguish positive rule-RHS expression roots from negative declaration IDs; structural package edges conservatively retained, not equated to explicit theorem references. Raw per-field inductive metadata is not fully represented by prior flattened parser; original authenticated archive remains evidence. Type and value separated; no fabricated value for non-value declarations. Fixture test against genuine pinned lean4export Nat.add_succ blob d3cd35f1313b4e78b5fded9886e450112aa75def, executed V8 semantic test: {"checks":1078,"negative":5,"expressions":434,"declarations":32,"targets":32,"constructors":7,"inductives":6,"recursors":6,"ruleRhs":7,"structuralRows":72,"roles":52,"referenceWitnesses":116}. CLI hash and full next projection not executed here. Work O(B + expanded name bytes + sum per-role reachable expression records/edges + output), fixed targets; 12-byte disk index plus parser memory, per-role seen set and output. No fresh full-scale time/RSS or URT speed claim.
Replay: node rh_next_root_roles.mjs test /path/to/Nat.add_succ.ndjson ; node rh_next_root_roles.mjs --out /tmp/rh-next. Job rh-next-root-roles-20261124 requested. RESUME HERE: read compute/rh-next-root-roles-20261124/status.json and outputs/solution_next_root_roles.json on cathedral-research-state, reconcile all ten required IDs and structural witnesses, and link optional probes only via observed incoming paths. HANDOFF TO kernel, integration, structure, math, audit and specialist lanes. Project OPEN.
*/
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import crypto from "node:crypto";
import {fileURLToPath} from "node:url";
import {spawnSync} from "node:child_process";
const here=path.dirname(fileURLToPath(import.meta.url));
const requests=[
  {
    "name": "UpperTheory.TP.K.tLiftK",
    "id": 14065049,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
      "role": "value",
      "witness": 1065212053
    }
  },
  {
    "name": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
    "id": 14009158,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
      "role": "value",
      "witness": 1065212052
    }
  },
  {
    "name": "UpperTheory.One.Join.automorphic_window_of_inputs",
    "id": 13125898,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.vwin_of_row",
      "role": "value",
      "witness": 997980685
    }
  },
  {
    "name": "UpperTheory.BaseChangeIdentities.baseChangeN",
    "id": 8352348,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.vwin_of_row",
      "role": "value",
      "witness": 677083986
    }
  },
  {
    "name": "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
    "id": 8026888,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "role": "value",
      "witness": 893073824
    }
  },
  {
    "name": "UpperTheory.LiteratureTheorems.published_results_arithmetic",
    "id": 11298207,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "role": "value",
      "witness": 893073879
    }
  },
  {
    "name": "UpperTheory.Zero.LLC.CuspT.type",
    "id": 11307204,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.recTExists",
      "role": "value",
      "witness": 893652253
    }
  },
  {
    "name": "UpperTheory.Zero.LLC.extDepth",
    "id": 11306966,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Zero.LLC.recTExists",
      "role": "value",
      "witness": 893651816
    }
  },
  {
    "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
    "id": 550020,
    "kind": "inductive",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk",
      "role": "type",
      "witness": 12992045
    }
  },
  {
    "name": "UpperTheory.EveryCharacter",
    "id": 326947,
    "kind": "def",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "role": "type",
      "witness": 6497236
    }
  },
  {
    "name": "GlobalTheory.CentralExponent.exists_cong_subset",
    "origin": "peer_exact_name_probe_not_root_bound"
  },
  {
    "name": "GlobalTheory.CentralExponent.isOpen_cong",
    "origin": "peer_exact_name_probe_not_root_bound"
  },
  {
    "name": "GlobalTheory.SmGL.isSmoothChar_deltaHalf",
    "origin": "peer_exact_name_probe_not_root_bound"
  },
  {
    "name": "GlobalTheory.SmGL.nabs_eq_one",
    "origin": "peer_exact_name_probe_not_root_bound"
  },
  {
    "name": "GroundTheory.Automorphic.Parabolic.conj_mem_unipotentRadical",
    "origin": "peer_exact_name_probe_not_root_bound"
  },
  {
    "name": "GroundTheory.Automorphic.Parabolic.leviProj_inv_mul_mem",
    "origin": "peer_exact_name_probe_not_root_bound"
  },
  {
    "name": "Deduction.logDeriv_local",
    "origin": "peer_exact_name_probe_not_root_bound"
  },
  {
    "name": "Deduction.poleData",
    "origin": "peer_exact_name_probe_not_root_bound"
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
 fs.writeFileSync(path.join(out,challenge?"challenge_next_root_roles.json":"solution_next_root_roles.json"),JSON.stringify(result,null,2)+"\n");
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
 ck(requests.length===18&&requests.filter(r=>r.id!==undefined).length===10,"target census");
 return {checks,negative,expressions:expr.length,declarations:decls.size,targets:wanted.length,constructors:ctors,inductives,recursors,ruleRhs,structuralRows,roles:roleCount,referenceWitnesses:refCount};
}
function readPeer(name,sha){const b=fs.readFileSync(path.join(here,name));if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob "+name);return b.toString("utf8")}
const base=readPeer("rh_targeted_role_witness.mjs","9a3e8b56a0df0b37cb693575742080284ebf302f");
const args=process.argv.slice(2);
if(args[0]==="test"){const raw=fs.readFileSync(args[1]);if(crypto.createHash("sha1").update("blob "+raw.length+"\0").update(raw).digest("hex")!=="d3cd35f1313b4e78b5fded9886e450112aa75def")throw Error("fixture hash");console.log(JSON.stringify(testBatch(raw.toString("utf8"),base,readPeer("rh_stream_export_closure.mjs","bffe89b20ff5e297d921443492e918933c8e0d92"),readPeer("rh_locality_frontier_retry.mjs","336ea4ba85ba9d81235313e44f3430c112c76c45"),readPeer("rh_mutual_metadata_closure.mjs","a6d43d873703f5e632df199ac6165ed13450c3bd"),collectBatch,splice,requests),null,2));}
else{if(!args.includes("--out"))throw Error("use --out DIR");const tmp=fs.mkdtempSync(path.join(os.tmpdir(),"rh-frontier-driver-"));try{const p=path.join(tmp,"driver.mjs");fs.writeFileSync(p,splice(base,requests,here));const c=spawnSync(process.execPath,[p,...args],{stdio:"inherit"});if(c.error)throw c.error;if(c.status!==0)throw Error("combined driver "+c.status+" "+c.signal)}finally{fs.rmSync(tmp,{recursive:true,force:true})}}
