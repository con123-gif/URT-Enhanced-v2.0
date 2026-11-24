// RUN17 — exact raw sub-DAG slicer; actual RH replay NOT executed. See RUN17_RESUME.md.
import fs from 'node:fs';
import crypto from 'node:crypto';
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2"];
const digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";
function targets(docs){
 const ids=[326948,550020,550021,550025],out=[];let seen=new Set();
 for(const d of docs){if(d.digest!=="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"||d.root!==14065054||d.n!==1065214335||d.bytes!==61570595788||d.meta.format.version!=="3.1.0")throw Error("scope");
 for(const r of d.reports){if(!ids.includes(r.id))continue;if(seen.has(r.id))throw Error("duplicate owner");seen.add(r.id);
 const add=(role,slot,x)=>out.push({id:r.id,owner:(r.source||r.request).name,role,slot,...x});
 add("type",0,r.type);if(r.value)add("value",1,r.value);for(const s of r.structural||[])if(s.encoded>0){if(s.kind!=="recursor_rule_rhs"||s.encoded!==s.expression.expressionRoot+1)throw Error("rhs binding");add("rhs",s.edgeIndex,s.expression);}
 }}
 if(seen.size!==4||out.length!==6)throw Error("missing target");return out;
}
function shape(r){
 const tags=["in","il","ie"].filter(k=>Object.hasOwn(r,k));if(tags.length===0)return null;if(tags.length!==1)throw Error("multiple indexes");
 const t=tags[0],i=r[t],keys=Object.keys(r).filter(k=>k!==t);if(keys.length!==1||!Number.isSafeInteger(i)||i<0)throw Error("bad primitive");
 const k=keys[0],x=r[k];let e=[],n=[],l=[];
 const need=(o,ks)=>{if(!o||typeof o!=="object"||Object.keys(o).sort().join(",")!==ks.split(",").sort().join(","))throw Error("unknown payload "+k)};
 if(t==="in"){if(k==="str"){need(x,"pre,str");if(typeof x.str!=="string")throw Error("name str");}else if(k==="num"){need(x,"pre,i");if(!Number.isSafeInteger(x.i)||x.i<0)throw Error("name num");}else throw Error("name tag");n=[x.pre]}
 else if(t==="il"){if(k==="succ")l=[x];else if(k==="param")n=[x];else if(k==="max"||k==="imax"){if(!Array.isArray(x)||x.length!==2)throw Error("level pair");l=x}else throw Error("level tag");}
 else switch(k){
 case "bvar":if(!Number.isSafeInteger(x)||x<0)throw Error("bvar");break;
 case "sort":l=[x];break;
 case "const":need(x,"name,us");n=[x.name];l=x.us;if(!Array.isArray(l))throw Error("levels");break;
 case "app":need(x,"fn,arg");e=[x.fn,x.arg];break;
 case "lam":case "forallE":need(x,"name,type,body,binderInfo");n=[x.name];e=[x.type,x.body];break;
 case "letE":need(x,"name,type,value,body,nondep");n=[x.name];e=[x.type,x.value,x.body];break;
 case "proj":need(x,"typeName,idx,struct");n=[x.typeName];e=[x.struct];break;
 case "mdata":need(x,"expr,data");e=[x.expr];break;
 case "natVal":if(typeof x!=="string"||!/^(0|[1-9][0-9]*)$/.test(x))throw Error("nat literal");break;
 case "strVal":if(typeof x!=="string")throw Error("str literal");break;
 default:throw Error("unknown expression "+k);
 }
 for(const a of [e,n,l])if(!a.every(v=>Number.isSafeInteger(v)&&v>=0))throw Error("bad child id");
 for(const child of (t==="ie"?e:t==="in"?n:l))if(child>=i)throw Error("not postorder");
 return {t,i,k,e,n,l};
}
function extract(lines,seeds){
 const pending={ie:new Set(seeds.map(s=>s.expressionRoot)),in:new Set(),il:new Set()},rows={ie:new Map(),in:new Map(),il:new Map()};let scans=0,edges=0;
 for(const s of seeds)for(const r of s.references||[])if(r.target!==0)pending.in.add(r.target);
 const add=(t,v)=>{if((t==="in"||t==="il")&&v===0)return;if(rows[t].has(v))throw Error("non-postorder input");pending[t].add(v)};
 for(const line of lines){if(!pending.ie.size&&!pending.in.size&&!pending.il.size)break;scans++;if(!line.trim())continue;
 const r=JSON.parse(line);const t=["ie","in","il"].find(k=>Object.hasOwn(r,k));if(!t||!pending[t].has(r[t]))continue;const q=shape(r);
 pending[t].delete(q.i);rows[t].set(q.i,line);for(const [a,vs] of [["ie",q.e],["in",q.n],["il",q.l]])for(const v of vs){edges++;add(a,v)}
 }
 if(Object.values(pending).some(s=>s.size))throw Error("missing selected records "+JSON.stringify(Object.fromEntries(Object.entries(pending).map(([k,v])=>[k,[...v].slice(0,20)]))));
 return {rows,scans,edges};
}
function verify(x,seeds){
 const rs=x.rows,cache=new Map(),names=new Map([[0,[]]]);let checks=0;
 const ck=(v,m)=>{if(!v)throw Error(m);checks++};
 const name=i=>{if(names.has(i))return names.get(i);const r=JSON.parse(rs.in.get(i));const p=r.str||r.num,a=[...name(p.pre),r.str?p.str:p.i];names.set(i,a);return a};
 for(const [id,raw] of rs.ie)cache.set(id,{r:JSON.parse(raw),q:shape(JSON.parse(raw))});
 const all=new Set(),summary=[];
 for(const s of seeds){let seen=new Set(),todo=[s.expressionRoot],edges=0,refs=new Map();const expected=new Map((s.references||[]).map(r=>[r.kind+":"+r.target,r]));
 const lit=new Map((s.references||[]).filter(r=>r.kind==="literal_primitive").map(r=>[JSON.stringify(r.nameParts),r.target]));
 while(todo.length){const i=todo.pop();if(seen.has(i))continue;seen.add(i);all.add(i);const p=cache.get(i);ck(!!p,"missing expression");edges+=p.q.e.length;todo.push(...p.q.e);
 const add=(k,t)=>{const key=k+":"+t;if(!refs.has(key))refs.set(key,new Set());refs.get(key).add(i)};
 if(p.q.k==="const")add("explicit_const",p.r.const.name);
 if(p.q.k==="proj")add("projection_carrier",p.r.proj.typeName);
 if(s.references&&p.q.k==="natVal"){const t=lit.get('["Nat"]');ck(t!==undefined,"missing Nat literal target");add("literal_primitive",t)}
 if(s.references&&p.q.k==="strVal")for(const label of ['["Char","ofNat"]','["String","ofList"]']){const t=lit.get(label);ck(t!==undefined,"missing string target");add("literal_primitive",t)}
 }
 if(s.references){ck(seen.size===s.expressionsRead&&edges===s.childEdges,"expression/edge census");ck(refs.size===expected.size,"reference signature set");
 let count=0;for(const [k,v] of refs){let a=expected.get(k);ck(!!a&&v.size===a.distinctExpressionRecords&&v.has(a.witnessExpression),"reference witness/count "+k);ck(JSON.stringify(name(a.target))===JSON.stringify(a.nameParts),"tagged name");count+=v.size;}ck(count===s.referenceOccurrences,"reference occurrence total");}
 summary.push({owner:s.owner,role:s.role,root:s.expressionRoot,expressions:seen.size,edges,referenceSignatures:refs.size});
 }
 ck(all.size===rs.ie.size,"extraneous selected expression");return {checks,summary,expressions:rs.ie.size,names:rs.in.size,levels:rs.il.size,scannedLines:x.scans};
}
function* reverseLines(file) {
 const fd=fs.openSync(file,'r');try{let pos=fs.fstatSync(fd).size,tail=Buffer.alloc(0);
 while(pos>0){const n=Math.min(pos,8*1024*1024);pos-=n;const b=Buffer.allocUnsafe(n);let got=0;while(got<n){const k=fs.readSync(fd,b,got,n-got,pos+got);if(!k)throw Error('short read');got+=k}
 const block=Buffer.concat([b,tail]);let end=block.length;for(let j=block.length-1;j>=0;j--)if(block[j]===10){yield block.subarray(j+1,end).toString('utf8');end=j}tail=block.subarray(0,end);}
 if(tail.length)yield tail.toString('utf8');}finally{fs.closeSync(fd)}
}
const [file,...paths]=process.argv.slice(2);if(!file||paths.length!==4)throw Error('usage: node run17_raw_slice.mjs solution.ndjson direct.json frontier.json next.json literature.json');
const reports=paths.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash('sha1').update('blob '+b.length+'\\0'.replace('\\0','\0')).update(b).digest('hex')!==hashes[i])throw Error('report blob hash '+p);return JSON.parse(b)});
if(fs.statSync(file).size!==61570595788)throw Error('archive size');
const h=crypto.createHash('sha256');for await(const b of fs.createReadStream(file))h.update(b);if(h.digest('hex')!==digest)throw Error('archive digest');
const selected=targets(reports),slice=extract(reverseLines(file),selected),audit=verify(slice,selected);
console.log(JSON.stringify({status:'AUTHENTICATED_RAW_EXPRESSION_SLICE_NOT_KERNEL_REPLAY',sourcePin:'40e56bab026552e089d7afcfeff08d2defb9c005',digest,hashes,selected,audit,records:Object.fromEntries(Object.entries(slice.rows).map(([k,v])=>[k,[...v.entries()].sort((a,b)=>a[0]-b[0])]))},null,2));
