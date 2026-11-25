// RUN18 — authenticated compressed raw expression spool, scope audit; see RUN18_RESUME.md
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
const specs=[["d49fbcc22a2382039986b09ff91dd11af2ef2e7b","rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json"],["d04e0fb24160d3ee1be54cd50082f59526864d4e","rh-next-root-roles-20261124/outputs/solution_next_root_roles.json"],["d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json"],["deabbd86afc8f21d9897ba3bb74349178517fde3","rh-34-producer-frontier-20261124/outputs/solution_34_producer_frontier.json"]];
const shaBlob=b=>crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");
function checked(b,h){if(shaBlob(b)!==h)throw Error("blob SHA mismatch "+h);return b}
function download(url){const p=spawnSync("curl",["--fail","--location","--retry","2","--silent","--show-error",url],{maxBuffer:20*1024*1024});if(p.error||p.status!==0)throw Error("download "+url+" "+p.error+" "+p.stderr);return p.stdout}
const peer=checked(fs.readFileSync(path.join(HERE,"run17_raw_slice.mjs")),"45fc2bc30521a1607a7a763b114bba189c87e114").toString("utf8");
const core=new Function(peer.slice(peer.indexOf("function targets("),peer.indexOf("function* reverseLines("))+"\nreturn {targets,shape,extract,verify};")();
function bindTargets(docs,core){
 const base=core.targets(docs.slice(0,3)),d=docs[3],expected=[[13125906,9078396,9078404],[13125937,9838915,9838921],[13125938,9838937,9838943],[13125939,997980875,997980883]];
 if(d.digest!=="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"||d.root!==14065054||d.n!==1065214335||d.bytes!==61570595788||d.meta.format.version!=="3.1.0")throw Error("report identity");
 for(let i=0;i<expected.length;i++){const [id,t,v]=expected[i],rs=d.reports.filter(r=>r.id===id),name="UpperTheory.TP.TLiftK._proof_"+(i+1);if(rs.length!==1)throw Error("missing owner "+id);const r=rs[0];if(r.request.name!==name||r.kind!=="thm"||r.type.expressionRoot!==t||r.value.expressionRoot!==v||JSON.stringify(r.encodedRootsAndStructuralEdges)!==JSON.stringify([t+1,v+1]))throw Error("owner or root mismatch "+id);base.push({id,owner:name,role:"type",slot:0,...r.type},{id,owner:name,role:"value",slot:1,...r.value});}
 if(base.length!==14)throw Error("root count");return base;
}
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
function test(raw,core,docs){
 let checks=0,negative=0;const ck=(p,m)=>{if(!p)throw Error(m);checks++},reject=(f)=>{let ok=false;try{f()}catch{ok=true}ck(ok,"negative control accepted");negative++};
 const selected=bindTargets(docs,core);ck(selected.length===14,"target roots");ck(selected.filter(s=>s.expressionRoot>12992065).length===2,"high root pair");
 const lines=raw.trimEnd().split("\n"),row=lines.map(JSON.parse).find(r=>r.thm?.some(x=>x.name===102)).thm.find(x=>x.name===102);
 const seeds=[{owner:"Nat.add_succ",role:"type",expressionRoot:row.type},{owner:"Nat.add_succ",role:"value",expressionRoot:row.value}];
 const x=core.extract([...lines].reverse(),seeds),a=core.verify(x,seeds),s=scopeAudit(x,seeds,core.shape),v=independentScope(x,seeds,core.shape);
 ck(x.rows.ie.size===29&&s.nodes.length===29,"fixture closure");ck(s.roots.every(r=>r.minimumOuterBinders===0&&r.binderSpine.length===2),"two binders");
 ck(s.roots[0].binderSpine.every(r=>r.kind==="forallE")&&s.roots[1].binderSpine.every(r=>r.kind==="lam"),"type and proof binder kinds");
 ck(s.roots.every(r=>JSON.stringify(r.binderSpine.map(b=>b.name))===JSON.stringify([["n"],["m"]])),"ordered names");
 ck(v>=29,"independent scoped traversal");
 // Real fixture mutation: replacing an occurrence of an in-scope bound variable by a large index is rejected by both analyses.
 const bv=s.nodes.find(r=>r.kind==="bvar");ck(!!bv,"bound variable fixture");
 const mutant={...x,rows:{...x.rows,ie:new Map(x.rows.ie)}};const m=JSON.parse(mutant.rows.ie.get(bv.id));m.bvar=99;mutant.rows.ie.set(bv.id,JSON.stringify(m));
 reject(()=>scopeAudit(mutant,seeds,core.shape));reject(()=>independentScope(mutant,seeds,core.shape));
 // A forall's own domain is evaluated outside that binder; treating it as scoped would accept this corrupt term.
 const outer=s.roots[0].binderSpine[0];const bad={...x,rows:{...x.rows,ie:new Map(x.rows.ie)}};bad.rows.ie.set(outer.type,JSON.stringify({ie:outer.type,bvar:0}));reject(()=>scopeAudit(bad,seeds,core.shape));reject(()=>independentScope(bad,seeds,core.shape));
 const baddocs=docs.slice();baddocs[3]={...docs[3],reports:docs[3].reports.map(r=>r.id===13125939?{...r,value:{...r.value,expressionRoot:r.value.expressionRoot-1}}:r)};reject(()=>bindTargets(baddocs,core));
 return {checks,negative,fixtureRoleChecks:a.checks,fixtureNodes:s.nodes.length,independentScopedStates:v,fixtureSpines:s.roots.map(r=>({role:r.role,binders:r.binderSpine.map(b=>({kind:b.kind,name:b.name}))})),targetRoots:selected.map(r=>({id:r.id,role:r.role,root:r.expressionRoot,records:r.expressionsRead,edges:r.childEdges})),totalRoleRecords:selected.reduce((n,r)=>n+r.expressionsRead,0),totalRoleEdges:selected.reduce((n,r)=>n+r.childEdges,0)};
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
function selectReports(docs,seeds){const ids=new Set(seeds.map(s=>s.id));return docs.flatMap(d=>d.reports.filter(r=>ids.has(r.id)))}
function makeOutput(x,seeds,docs,extra){const audit=core.verify(x,seeds),scope=scopeAudit(x,seeds,core.shape),independentStates=independentScope(x,seeds,core.shape);return {status:"AUTHENTICATED_RAW_EXPRESSION_AND_SCOPE_NOT_KERNEL_REPLAY",pin:PIN,archiveDigest:DIGEST,reportHashes:specs.map(s=>s[0]),selected:seeds,ownerRecords:selectReports(docs,seeds),audit,scope,independentStates,records:Object.fromEntries(Object.entries(x.rows).map(([k,v])=>[k,[...v].sort((a,b)=>a[0]-b[0])])),...extra}}
const docs=specs.map(([h,p])=>JSON.parse(checked(download("https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/cathedral-research-state/compute/"+p),h)));
const args=process.argv.slice(2);
if(args[0]==="test"){const raw=checked(fs.readFileSync(args[1]),"d3cd35f1313b4e78b5fded9886e450112aa75def").toString("utf8");console.log(JSON.stringify(test(raw,core,docs)));}else{
 const oi=args.indexOf("--out");if(oi<0||!args[oi+1])throw Error("use --out DIR");const out=path.resolve(args[oi+1]);fs.mkdirSync(out,{recursive:true});
 const selected=bindTargets(docs,core),maxRoot=Math.max(...selected.map(s=>s.expressionRoot)),tmp=fs.mkdtempSync(path.join(os.tmpdir(),"rh-raw-spool-")),fd=fs.openSync(path.join(tmp,"blocks"),"w+");
 let child;
 try{const st=fs.statfsSync(tmp),cap=Math.min(10*2**30,st.bavail*st.bsize-2**30);if(cap<64*2**20)throw Error("insufficient disk reserve");
 child=spawn("bash",["-o","pipefail","-c",'curl --fail --location --retry 0 --silent --show-error "$1" | zstd -dc --long=30',"rh","https://math.mit.edu/~drew/grh/solution.ndjson.zst"],{stdio:["ignore","pipe","inherit"]});
 const s=await spool(child,fd,cap,maxRoot);if(s.bytes!==BYTES||s.digest!==DIGEST)throw Error("full archive authentication failed");
 let seeds=selected,x,partial=false;try{x=core.extract(reverseSpool(fd,s.index),seeds)}catch(e){if(s.stop!=="DISK_CAP"||!String(e).includes("missing selected records"))throw e;seeds=selected.filter(r=>r.id!==13125939);x=core.extract(reverseSpool(fd,s.index),seeds);partial=true}
 const data=makeOutput(x,seeds,docs,{partial,unresolved:partial?selected.filter(r=>r.id===13125939):[],spool:{bytes:s.bytes,rawBytes:s.rawBytes,stored:s.stored,frames:s.index.length,stop:s.stop,cap}});
 fs.writeFileSync(path.join(out,"selected_raw_scope.json"),JSON.stringify(data,null,2)+"\n");console.log(JSON.stringify({partial,roots:seeds.length,scope:data.scope.roots.length,uniqueNodes:data.audit.expressions,checks:data.audit.checks,spool:data.spool}));
 }finally{if(child&&child.exitCode===null)child.kill();fs.closeSync(fd);fs.rmSync(tmp,{recursive:true,force:true})}
}
