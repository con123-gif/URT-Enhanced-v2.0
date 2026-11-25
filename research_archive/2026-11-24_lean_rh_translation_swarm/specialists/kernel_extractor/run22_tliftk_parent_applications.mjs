/* RUN22 — 2026-11-25. PARTIAL / AUTHENTICATED EXPORTED FIXTURE AUDIT; PARENT JOB NOT EXECUTED.
Read protocol, handoff, expansion, AGENTS, state, continuity, research protocol/log, current CI checkpoint #416 PASS (not this task), all fourteen peer recent commit/handoff notes. Blueprint not reopened; no reliance on it. Role frontier 300 owned by dependency lane; peers request role paths not raw expressions. Avoid repeating their scans. No local Lean; MIT archive DNS failed in container; no retained archive. Upstream HEAD fcb6eac7534875d32d68030967e2deae6d686151 unchanged from RUN21, Main 67c65badc15f80a1db65df1c84dc7a4928fc410f, toolchain 0e037f58f9a1aa2d5139277bcc4be0061ebeeb05, TLiftK 35d26e2a7115dd2d4bed12c169866e93de6d3856. Original pinned TLiftK source blob 4b36fc43e988270944cef2fc1b5e9ee1493fc275, lines 18–19: separate ResEtaPow guards for chiX,n and chiW,d. No repinning.
Result: each constant occurrence has a unique maximal application boundary, obtained by ascending only function-slot edges; conversely a maximal application has a unique head path. This is a bijection on unfolded ordered paths, including shared nodes and zero-argument occurrences. Count boundaries using forward path multiplicities on all edges except function-slot edges. Counting all application prefixes overcounts. Actual V8 execution on prior authenticated 14-root slice (connector blob identity; native CLI checks bytes):
{"roots":14,"groups":7,"applications":7,"paths":"29","goal":[{"record":997980872,"paths":"1","head":110448,"headRecord":3028215,"args":[9078386,997980834,997980834,997980864,997980871]}],"supplier":[{"record":997980880,"paths":"1","head":164561,"headRecord":3028221,"args":[9078386,997980876,9838930,9841530,9841535]}],"inflatedPrefixRecords":6,"negatives":3,"parentSeeds":[{"role":"type","root":3,"records":1,"edges":0},{"role":"value","root":997984088,"records":1623,"edges":2940}]}
Three corruption controls rejected. The proof4 goal's single fully applied SMulCommClass has six distinct head/prefix records, not six obligations. This is an expression-structure check, not a kernel conversion. The exact parent selection and runnable compressed spool derive from the pinned previous script (blob 4362c91211595661e991dfc09edf8c8b5f2246ae). Parent report pinned by blob. Parent run fails closed if raw closure exceeds cap; no partial claim. The new job extracts only parent type/value roots, not the earlier 14 roots or 300-peer projections. Parent extraction and resulting argument slots are unexecuted. Complexity sorting O(V log V), counting O(V+E) graph operations plus BigInt cost; repeated per-argument traversal and spine materialization not claimed linear globally. No new axiom census, kernel validation, or URT improvement.
RESUME HERE: read compute/rh-tliftk-parent-raw-20261125/status.json and outputs/tliftk_parent_raw.json; check two ResEtaPow guard occurrence counts and map chiX,n vs chiW,d by exact argument IDs and scoped binder indices; verify all auxiliary application paths and preserve any additional occurrences. If cap exceeded, use retained authenticated archive or higher-cap worker. HANDOFF TO theta, integration, dependencies, Galois, audit, acceleration, editor. Full RH OPEN.
*/
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import crypto from "node:crypto";
import {deflateRawSync,inflateRawSync} from "node:zlib";
import {spawn,spawnSync} from "node:child_process";
import {once} from "node:events";
import {fileURLToPath} from "node:url";
const HERE=path.dirname(fileURLToPath(import.meta.url));
const PIN="40e56bab026552e089d7afcfeff08d2defb9c005", DIGEST="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e", BYTES=61570595788;
const shaBlob=b=>crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");
function checked(b,h){if(shaBlob(b)!==h)throw Error("blob SHA mismatch "+h);return b}
function download(url){const p=spawnSync("curl",["--fail","--location","--retry","2","--silent","--show-error",url],{maxBuffer:20*1024*1024});if(p.error||p.status!==0)throw Error("download "+url+" "+p.error+" "+p.stderr);return p.stdout}
const peer=checked(fs.readFileSync(path.join(HERE,"run17_raw_slice.mjs")),"45fc2bc30521a1607a7a763b114bba189c87e114").toString("utf8");
const core=new Function(peer.slice(peer.indexOf("function targets("),peer.indexOf("function* reverseLines("))+"\nreturn {targets,shape,extract,verify};")();
function scopeAudit(x,seeds,shape){
 const expr=new Map([...x.rows.ie].map(([i,r])=>[i,JSON.parse(r)])),names=new Map([[0,[]]]),levels=new Map([[0,["zero"]]]),need=new Map(),rows=[];
 for(const [i,raw] of [...x.rows.in].sort((a,b)=>a[0]-b[0])){const r=JSON.parse(raw),q=shape(r),a=r[q.k],pre=names.get(a.pre);if(!pre)throw Error("missing name prefix");names.set(i,[...pre,q.k==="str"?a.str:a.i])}
 for(const [i,raw] of [...x.rows.il].sort((a,b)=>a[0]-b[0])){const r=JSON.parse(raw),q=shape(r);if(q.l.some(j=>!levels.has(j))||q.n.some(j=>!names.has(j)))throw Error("missing universe child");levels.set(i,[q.k,r[q.k]])}
 const dep=i=>{if(!need.has(i))throw Error("missing expression child "+i);return need.get(i)};
 for(const [i,r] of [...expr].sort((a,b)=>a[0]-b[0])){const q=shape(r);if(q.n.some(j=>!names.has(j))||q.l.some(j=>!levels.has(j)))throw Error("missing name/level");let k;
 if(q.k==="bvar")k=r.bvar+1;
 else if(q.k==="lam"||q.k==="forallE")k=Math.max(dep(q.e[0]),dep(q.e[1])-1);
 else if(q.k==="letE")k=Math.max(dep(q.e[0]),dep(q.e[1]),dep(q.e[2])-1);
 else k=Math.max(0,...q.e.map(dep));need.set(i,k);
 rows.push({id:i,kind:q.k,minimumOuterBinders:k,orderedExpressionChildren:q.e,taggedNames:q.n.map(j=>names.get(j)),universeLevelIDs:q.l,payload:r[q.k]});
 }
 const result=[];for(const s of seeds){const root=s.expressionRoot;if(dep(root)!==0)throw Error("unbound de Bruijn index at root "+root+" need="+dep(root));let spine=[],cur=root;for(;;){const r=expr.get(cur),q=shape(r);if(!["lam","forallE","letE"].includes(q.k))break;const a=r[q.k];spine.push({id:cur,kind:q.k,name:names.get(a.name),binderInfo:a.binderInfo??null,type:a.type,...(q.k==="letE"?{value:a.value,nondep:a.nondep}:{}),body:a.body});cur=a.body}
 result.push({owner:s.owner,role:s.role,slot:s.slot??null,root,minimumOuterBinders:0,binderSpine:spine,body:cur});}
 return {roots:result,nodes:rows,nameTable:[...names],universeTable:[...levels]};
}
function independentScope(x,seeds,shape){
 let visits=0;const seen=new Set();for(const s of seeds){const stack=[[s.expressionRoot,0]];while(stack.length){const [id,depth]=stack.pop(),key=id+":"+depth;if(seen.has(key))continue;seen.add(key);visits++;const raw=x.rows.ie.get(id);if(raw===undefined)throw Error("missing independent child");const r=JSON.parse(raw),q=shape(r);if(q.k==="bvar"&&r.bvar>=depth)throw Error("unbound at "+id);for(let j=0;j<q.e.length;j++){const inc=((q.k==="lam"||q.k==="forallE")&&j===1)||(q.k==="letE"&&j===2);stack.push([q.e[j],depth+(inc?1:0)])}}}return visits;
}
function writeAll(fd,b){let n=0;while(n<b.length){let k=fs.writeSync(fd,b,n,b.length-n);if(!k)throw Error("short write");n+=k}}
function readAll(fd,n,offset){const b=Buffer.allocUnsafe(n);let p=0;while(p<n){let k=fs.readSync(fd,b,p,n-p,offset+p);if(!k)throw Error("short read");p+=k}return b}
function* reverseSpool(fd,index){for(let j=index.length-1;j>=0;j--){const p=index[j],raw=inflateRawSync(readAll(fd,p.size,p.offset));if(raw.length!==p.raw)throw Error("spool length");if(crypto.createHash("sha256").update(raw).digest("hex")!==p.hash)throw Error("spool hash");const lines=raw.toString("utf8").split("\n");for(let k=lines.length-1;k>=0;k--)yield lines[k]}}
async function spool(child,fd,cap,maxRoot){
 const hash=crypto.createHash("sha256"),index=[];let bytes=0,rawBytes=0,stored=0,parts=[],pending=0,stop=null;
 const token=Buffer.from('"ie":'+maxRoot);
 function block(b){if(!b.length||stop)return;const z=deflateRawSync(b,{level:1});if(stored+z.length>cap){stop="DISK_CAP";return}writeAll(fd,z);index.push({offset:stored,size:z.length,raw:b.length,hash:crypto.createHash("sha256").update(b).digest("hex")});stored+=z.length;rawBytes+=b.length;
 if(b.includes(token)&&b.toString("utf8").split("\n").some(l=>l.includes(token.toString())&&JSON.parse(l).ie===maxRoot))stop="MAX_ROOT_REACHED";
 }
 const exited=once(child,"exit");
 for await(const chunk of child.stdout){hash.update(chunk);bytes+=chunk.length;if(!stop){parts.push(chunk);pending+=chunk.length;if(pending>=8*1024*1024){const b=Buffer.concat(parts,pending),end=b.lastIndexOf(10)+1;if(!end)throw Error("record exceeds block");block(b.subarray(0,end));parts=stop?[]:[b.subarray(end)];pending=stop?0:b.length-end}}if(bytes%1000000000<chunk.length)console.log(JSON.stringify({bytes,stored,stop}))}
 if(!stop&&pending)block(Buffer.concat(parts,pending));const [status,signal]=await exited;if(status!==0)throw Error("stream failed "+status+" "+signal);
 return {index,bytes,digest:hash.digest("hex"),rawBytes,stored,stop:stop||"EOF"};
}

function parentSeeds(d){
 if(d.pin!==PIN||d.digest!==DIGEST||d.bytes!==BYTES||d.n!==1065214335||d.root!==14065054||d.meta.format.version!=="3.1.0")throw Error("report identity");
 const p=d.reports.filter(r=>r.id===13125905);
 if(p.length!==1)throw Error("parent count");
 const r=p[0],v=r.value,t=r.type;
 if(JSON.stringify([r.request.name,r.kind,r.encodedRootsAndStructuralEdges,t.expressionRoot,t.expressionsRead,t.childEdges,v.expressionRoot,v.expressionsRead,v.childEdges,v.referenceOccurrences])!==JSON.stringify(["UpperTheory.TP.TLiftK","def",[4,997984089],3,1,0,997984088,1623,2940,118]))throw Error("parent identity");
 return [{id:r.id,owner:r.request.name,role:"type",slot:0,...t},{id:r.id,owner:r.request.name,role:"value",slot:1,...v}];
}
// A maximal application occurrence is at the root or is entered through a
// non-function slot. The same DAG node can occur in both kinds of context.
function applicationAudit(rows,root,targets,enumerate=false){
 const a=new Map(rows.map(([i,s])=>[i,typeof s==="string"?JSON.parse(s):s]));
 if(a.size!==rows.length||!a.has(root))throw Error("row identity");
 const children=e=>{if(e.app)return [e.app.fn,e.app.arg];if(e.lam||e.forallE){const z=e.lam||e.forallE;return [z.type,z.body]}if(e.letE)return [e.letE.type,e.letE.value,e.letE.body];if(e.proj)return [e.proj.struct];if(e.mdata)return [e.mdata.expr];if(e.const||"bvar"in e||"sort"in e||"natVal"in e||"strVal"in e)return [];throw Error("unknown expression")};
 const order=[...a.keys()].sort((x,y)=>x-y),heads=new Map,spines=new Map;
 for(const i of order){const e=a.get(i);if(e.ie!==i||children(e).some(j=>j>=i||!a.has(j)))throw Error("not closed postorder");
  heads.set(i,e.app?heads.get(e.app.fn):e.const?.name??null);
 }
 function spine(i){if(spines.has(i))return spines.get(i);let args=[],j=i;while(a.get(j).app){const e=a.get(j).app;args.push(e.arg);j=e.fn}const s={head:heads.get(i),headRecord:j,args:args.reverse()};spines.set(i,s);return s}
 const counts=new Map([[root,1n]]), boundary=new Map([[root,1n]]);
 for(const i of [...order].reverse()){const n=counts.get(i)||0n;if(!n)continue;const e=a.get(i);children(e).forEach((j,k)=>{counts.set(j,(counts.get(j)||0n)+n);if(!e.app||k!==0)boundary.set(j,(boundary.get(j)||0n)+n)})}
 const picked=new Set(targets),results=[];
 for(const t of picked){const applications=[],witnesses=[];let maxTotal=0n,constTotal=0n;
  for(const i of order){const n=boundary.get(i)||0n,c=counts.get(i)||0n,e=a.get(i);
   if(e.const?.name===t&&c){constTotal+=c;witnesses.push({record:i,paths:c.toString()})}
   if(n&&heads.get(i)===t){maxTotal+=n;applications.push({record:i,paths:n.toString(),...spine(i)})}
  }
  if(maxTotal!==constTotal)throw Error("maximal-application conservation "+t);
  if(constTotal)results.push({target:t,paths:constTotal.toString(),witnesses,applications});
 }
 if(enumerate){const expanded=[...counts.values()].reduce((x,y)=>x+y,0n);if(expanded>1000000n)throw Error("enumeration cap");const brute=new Map,stack=[[root,true]];
  while(stack.length){const [i,isBoundary]=stack.pop(),e=a.get(i);if(isBoundary){let j=i;while(a.get(j).app)j=a.get(j).app.fn;const t=a.get(j).const?.name;if(picked.has(t)){const k=t+":"+i;brute.set(k,(brute.get(k)||0n)+1n)}}children(e).forEach((j,k)=>stack.push([j,!e.app||k!==0]))}
  for(const t of results)for(const u of t.applications){const k=t.target+":"+u.record;if(brute.get(k)!==BigInt(u.paths))throw Error("independent enumeration mismatch");brute.delete(k)}if(brute.size)throw Error("missing occurrence boundary");
 }
 return results;
}
function actualFixture(d,report){
 const seeds=parentSeeds(report),targets=[13125906,13125937,13125938,13125939,110448,164561,560935,260882,676057];
 if(d.pin!==PIN||d.archiveDigest!==DIGEST||d.partial||d.unresolved.length)throw Error("fixture receipt");
 let roots=0,groups=0,applications=0,paths=0n;
 for(const s of d.selected){const a=applicationAudit(d.records.ie,s.expressionRoot,targets,true);roots++;groups+=a.length;for(const t of a){applications+=t.applications.length;paths+=BigInt(t.paths)}}
 const g=applicationAudit(d.records.ie,997980875,targets,true),v=applicationAudit(d.records.ie,997980883,targets,true);
 const goal=g.find(x=>x.target===110448),supplier=v.find(x=>x.target===164561);
 if(!goal||!supplier||goal.paths!=="1"||supplier.paths!=="1"||goal.applications[0].args.length!==5||supplier.applications[0].args.length!==5)throw Error("proof4 spines");
 // Real export: the head constant is shared by many nested application prefixes;
 // counting every application node would inflate the actual occurrence count.
 const rawRows=new Map(d.records.ie.map(([i,s])=>[i,JSON.parse(s)]));
 function allPrefixes(t,root){const seen=new Set,stack=[root];let n=0;while(stack.length){const i=stack.pop(),e=rawRows.get(i);if(seen.has(i))continue;seen.add(i);let j=i;while(rawRows.get(j).app)j=rawRows.get(j).app.fn;if(rawRows.get(j).const?.name===t)n++;if(e.app)stack.push(e.app.fn,e.app.arg);else if(e.lam||e.forallE){const z=e.lam||e.forallE;stack.push(z.type,z.body)}else if(e.letE)stack.push(e.letE.type,e.letE.value,e.letE.body);else if(e.proj)stack.push(e.proj.struct);else if(e.mdata)stack.push(e.mdata.expr)}return n}
 const inflated=allPrefixes(110448,997980875);
 if(inflated!==6)throw Error("prefix inflation control");
 let negatives=0;function reject(f){try{f()}catch{negatives++;return}throw Error("negative accepted")}
 reject(()=>parentSeeds({...report,reports:report.reports.filter(r=>r.id!==13125905)}));
 reject(()=>parentSeeds({...report,reports:report.reports.map(r=>r.id===13125905?{...r,value:{...r.value,expressionRoot:r.value.expressionRoot-1}}:r)}));
 reject(()=>applicationAudit(d.records.ie.filter(([i])=>i!==997980830),997980875,targets,true));
 return {roots,groups,applications,paths:paths.toString(),goal:goal.applications,supplier:supplier.applications,inflatedPrefixRecords:inflated,negatives,parentSeeds:seeds.map(s=>({role:s.role,root:s.expressionRoot,records:s.expressionsRead,edges:s.childEdges}))};
}

const reportHash="d823c364f446f5066dbbc61f7e9cf9c891fcbdb2";
const rawHash="63c3592e4b3997433e5e0af910eddf6137cdac69";
const reportURL="https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/cathedral-research-state/compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json";
const args=process.argv.slice(2);
if(args[0]==="test"){
 const d=JSON.parse(checked(fs.readFileSync(args[1]),rawHash)),r=JSON.parse(checked(fs.readFileSync(args[2]),reportHash));console.log(JSON.stringify(actualFixture(d,r),null,2));
}else{
 const oi=args.indexOf("--out");if(oi<0||!args[oi+1])throw Error("use --out DIR");
 const out=path.resolve(args[oi+1]);fs.mkdirSync(out,{recursive:true});
 const report=JSON.parse(checked(download(reportURL),reportHash)),seeds=parentSeeds(report);
 const maxRoot=Math.max(...seeds.map(s=>s.expressionRoot)),tmp=fs.mkdtempSync(path.join(os.tmpdir(),"rh-caller-spool-")),fd=fs.openSync(path.join(tmp,"blocks"),"w+");let child;
 try{
 const st=fs.statfsSync(tmp),cap=Math.min(10*2**30,st.bavail*st.bsize-2**30);if(cap<64*2**20)throw Error("insufficient disk reserve");
 child=spawn("bash",["-o","pipefail","-c",'curl --fail --location --retry 0 --silent --show-error "$1" | zstd -dc --long=30',"rh","https://math.mit.edu/~drew/grh/solution.ndjson.zst"],{stdio:["ignore","pipe","inherit"]});
 const s=await spool(child,fd,cap,maxRoot);if(s.bytes!==BYTES||s.digest!==DIGEST)throw Error("full archive authentication failed");
 const x=core.extract(reverseSpool(fd,s.index),seeds),audit=core.verify(x,seeds),scope=scopeAudit(x,seeds,core.shape),independentStates=independentScope(x,seeds,core.shape);
 const records=Object.fromEntries(Object.entries(x.rows).map(([k,v])=>[k,[...v].sort((a,b)=>a[0]-b[0])]));
 const targets=[676057,260882,560935,13125906,13125937,13125938,13125939];
 const applications=applicationAudit(records.ie,seeds[1].expressionRoot,targets),guards=applications.find(a=>a.target===676057);
 if(!guards)throw Error("no ResEtaPow application");
 const guardArguments=guards.applications.map(g=>({record:g.record,paths:g.paths,args:g.args.map((id,slot)=>({slot,id,uses:applicationAudit(records.ie,id,targets.filter(t=>t!==676057))}))}));
 const data={status:"AUTHENTICATED_PARENT_RAW_EXPRESSION_NOT_KERNEL_REPLAY",pin:PIN,archiveDigest:DIGEST,reportHash,selected:seeds,ownerRecords:report.reports.filter(r=>r.id===13125905),partial:false,unresolved:[],audit,scope,independentStates,records,applications,guardArguments,spool:{bytes:s.bytes,rawBytes:s.rawBytes,stored:s.stored,frames:s.index.length,stop:s.stop,cap}};
 fs.writeFileSync(path.join(out,"tliftk_parent_raw.json"),JSON.stringify(data,null,2)+"\n");console.log(JSON.stringify({roots:seeds.length,audit,guardArguments,spool:data.spool}));
 }finally{if(child&&child.exitCode===null)child.kill();fs.closeSync(fd);fs.rmSync(tmp,{recursive:true,force:true})}
}
