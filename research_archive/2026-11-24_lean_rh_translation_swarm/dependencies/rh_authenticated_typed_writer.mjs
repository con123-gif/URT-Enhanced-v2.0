/* DEPENDENCIES / 2026-11-24 12:12 UTC — PARTIAL
Pinned RH 40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed 5f2c8594adf1f48032d37583118512cd7bbf3afa. Pinned Main blob dbd5db70bc11b35f18fa5751216ab335321e7bfc. Base Cathedral 0f225b800ebd9bc57b48ddb580316248b391b6c5.
Read protocol, handoff, AGENTS, continuity, research log/state/protocol, integration 1200 ParDual, structure stream retry/1124, math PairEx, audit reflection. Physical CI #366 pass, run 45385315955, not RH validation. Retry and native fixture status still 404; prior challenge failed byte count only, actual 350862311 with matching SHA256. Do not duplicate active archive compute.
RESULT: streaming typed writer with exact decompressed byte offsets, raw non-expression metadata and declaration roots. Compatible 16-byte little-endian index for rh_disk_typed_projection.py. Offset sidecar 12 bytes/expression. Original authenticated raw archive remains authoritative: typed index cannot reconstruct hypotheses, binder names, literal values or universes. Source module origin not supplied by export; separate join required. Writer does not recheck kernel or enforce every invariant (e.g. duplicate non-root declarations, full package consistency), and no axiom or proof completeness claim. All non-expression metadata preserved as parsed JSON, not byte-identical; exact source bytes recoverable by offsets from authenticated stream. O(B + N + D) ordinary fixed-width indexing with B raw bytes, N expressions, D declaration members; bounded core state for fixed root paths and buffered output plus longest line/record and runtime overhead; CLI carry concatenation may be superlinear for pathological giant lines. Disk 28N plus sidecars, not measured full archive. No URT-specific speedup.
Actual fixture blob d3cd35f1313b4e78b5fded9886e450112aa75def at leanprover/lean4export 15f6055e299ad5b89345e533cc2192f4cc00f659 examples/Nat.add_succ.ndjson. Actual V8 test executed twice on connector content; 3.0 fixture and mechanically adapted 3.1 envelope (not actual 3.1 proof export). Byte offsets tested on reconstructed LF-terminated fixture, not claimed independently verified raw archive SHA. 646 checks, 4/4 negative controls rejected. Node CLI disk writer and hash gate NOT executed here; replay with node this_file.mjs test /path/to/Nat.add_succ.ndjson, then index OUT SHA256 BYTES 3.0.0 '["Nat","add_succ"]' < fixture. For pinned RH root use 3.1.0 '["riemannHypothesis"]' and published solution digest/size only after existing retry; stream producer exit status must be checked separately with pipefail. No new job launched.
Observed: {"checks":646,"rejected":4,"actual":{"meta":{"exporter":{"name":"lean4export","version":"3.0.0"},"format":{"version":"3.0.0"},"lean":{"githash":"2fcce7258eeb6e324366bc25f9058293b04b7547","version":"4.27.0-rc1"}},"bytes":32437,"rows":572,"expressions":434,"names":103,"levels":15,"declarations":32,"root":{"id":102,"kind":"thm","type":428,"value":433,"offset":32362,"length":75},"resolved":[["[\"Nat\"]",1],["[\"Nat\",\"add_succ\"]",102]]},"typedBytes":6944,"metadataRows":138,"adaptedFixture":{"meta":{"exporter":{"name":"lean4export","version":"3.0.0"},"format":{"version":"3.1.0"},"lean":{"githash":"2fcce7258eeb6e324366bc25f9058293b04b7547","version":"4.27.0-rc1"}},"bytes":32255,"rows":572,"expressions":434,"names":103,"levels":15,"declarations":32,"root":{"id":102,"kind":"thm","type":428,"value":433,"offset":32182,"length":73},"resolved":[["[\"Nat\"]",1],["[\"Nat\",\"add_succ\"]",102]]}}
RESUME HERE: check retry output, run actual Node fixture disk/hash test, then consume expr.bin with disk projection root roles and join declaration package + exact tagged name IDs; validate 3.1 actual challenge before solution. HANDOFF TO: integration, audit, structure.
*/

const OP=['bvar','sort','const','app','lam','forallE','letE','proj','natVal','strVal','mdata'];
function need(ok,msg){if(!ok)throw Error(msg)}
function writer(emit,version,rootParts){
 let n=0,names=1,levels=1,rows=0,decls=0,root=null,roots=0,meta=null,bytes=0;
 const wanted=[rootParts,['Nat'],['Char','ofNat'],['String','ofList']];
 const prefix=new Map([[0,[]]]),resolved=new Map(),rootKey=JSON.stringify(rootParts);
 const uint=x=>Number.isInteger(x)&&x>=0&&x<=0xffffffff;
 const ref=(x,b,label)=>{need(uint(x)&&x<b,label+' reference '+x);return x};
 const name=x=>ref(x,names,'name'),level=x=>ref(x,levels,'level'),expr=x=>ref(x,n,'expression');
 const list=(a,f)=>{need(Array.isArray(a),'array required');a.forEach(f)};
 const text=x=>need(typeof x==='string','string required');
 const keys=(r,k)=>need(Object.keys(r).length===k,'unexpected record fields');
 const bind=v=>{name(v.name);need(['default','implicit','strictImplicit','instImplicit'].includes(v.binderInfo),'binder info')};
 function row(r,len){
  need(Number.isSafeInteger(len)&&len>0&&Number.isSafeInteger(bytes+len),'byte offset');
  const start=bytes;bytes+=len;rows++;
  const side=(kind,id)=>emit('metadata',{kind,id,offset:start,length:len,row:r});
  if(rows===1){keys(r,1);need(r.meta?.format?.version===version,'format mismatch');meta=r.meta;side('meta',0);return}
  if('in'in r){keys(r,2);need(r.in===names&&uint(r.in),'name sequence');const v=r.str??r.num;need(v&&('str'in r)!==('num'in r),'name kind');name(v.pre);
   if('str'in r){text(v.str);const parent=prefix.get(v.pre);if(parent){const a=[...parent,v.str];if(wanted.some(w=>a.length<=w.length&&a.every((s,i)=>s===w[i]))){prefix.set(names,a);const k=JSON.stringify(a);if(wanted.some(w=>JSON.stringify(w)===k)){need(!resolved.has(k),'duplicate exact name');resolved.set(k,names)}}}}
   else need(Number.isSafeInteger(v.i)&&v.i>=0,'unsafe numeric name component');
   side('name',names++);return
  }
  if('il'in r){keys(r,2);need(r.il===levels&&uint(r.il),'level sequence');const k=Object.keys(r).find(x=>x!=='il'),v=r[k];if(k==='succ')level(v);else if(k==='param')name(v);else if(k==='max'||k==='imax'){need(Array.isArray(v)&&v.length===2,'level pair');v.forEach(level)}else throw Error('level kind');side('level',levels++);return}
  if('ie'in r){keys(r,2);need(r.ie===n&&uint(n),'expression sequence');const k=Object.keys(r).find(x=>x!=='ie'),v=r[k],op=OP.indexOf(k)+1;need(op>0,'expression kind');let a=0,b=0,c=0;
   switch(k){case'bvar':need(uint(v),'bvar');break;case'sort':level(v);break;case'const':a=name(v.name);list(v.us,level);break;case'app':a=expr(v.fn);b=expr(v.arg);break;case'lam':case'forallE':bind(v);a=expr(v.type);b=expr(v.body);break;case'letE':name(v.name);need(typeof v.nondep==='boolean','let nondep');a=expr(v.type);b=expr(v.value);c=expr(v.body);break;case'proj':a=name(v.typeName);need(uint(v.idx),'projection index');b=expr(v.struct);break;case'natVal':need(typeof v==='string'&&/^[0-9]+$/.test(v),'nat literal');break;case'strVal':text(v);break;case'mdata':a=expr(v.expr);need(v.data&&typeof v.data==='object','metadata');break}
   emit('expression',{id:n++,record:[op,a,b,c],offset:start,length:len});return
  }
  keys(r,1);const k=Object.keys(r)[0],v=r[k];let members;
  if(k==='inductive'){
   const g=version==='3.0.0'?['inductiveVals','constructorVals','recursorVals']:['types','ctors','recs'];
   need(g.every(x=>Array.isArray(v[x]))&&v[g[0]].length>0,'inductive schema');
   members=g.flatMap((x,i)=>v[x].map(m=>[['inductive','ctor','rec'][i],m]));
  }else{need(['def','thm','opaque','axiom','quot'].includes(k),'declaration kind');members=(Array.isArray(v)&&version==='3.0.0'?v:[v]).map(m=>[k,m])}
  for(const [kind,m] of members){
   name(m.name);expr(m.type);list(m.levelParams,name);
   if('value'in m)expr(m.value);
   if(['def','thm','opaque'].includes(kind))need('value'in m,'missing proof/value');
   if('all'in m)list(m.all,name);if('ctors'in m)list(m.ctors,name);if('induct'in m)name(m.induct);
   if('rules'in m)list(m.rules,q=>{name(q.ctor);expr(q.rhs)});
   emit('declaration',{id:m.name,kind,type:m.type,value:m.value??null,rules:(m.rules??[]).map(q=>({ctor:q.ctor,rhs:q.rhs})),offset:start,length:len});
   decls++;
   if(resolved.get(rootKey)===m.name){need(++roots===1,'duplicate root');root={id:m.name,kind,type:m.type,value:m.value??null,offset:start,length:len}}
  }
  side('declaration-package',decls);
 }
 return {row,finish(){need(meta&&root&&roots===1,'missing root');return {meta,bytes,rows,expressions:n,names:names-1,levels:levels-1,declarations:decls,root,resolved:[...resolved]}}}
}
function test(raw,oracle){
 const enc=new TextEncoder();
 function feed(lines,version){const out={expression:[],metadata:[],declaration:[]};const w=writer((k,v)=>out[k].push(v),version,['Nat','add_succ']);for(const line of lines)w.row(JSON.parse(line),enc.encode(line+'\n').length);return {out,summary:w.finish()}}
 const lines=raw.trimEnd().split('\n'),a=feed(lines,'3.0.0');let checks=0;const eq=(x,y)=>{need(JSON.stringify(x)===JSON.stringify(y),'test mismatch');checks++};
 eq(a.summary.expressions,434);eq(a.summary.declarations,32);eq(a.summary.root.id,102);eq(a.summary.root.type,428);eq(a.summary.root.value,433);
 const rawBytes=enc.encode(lines.join('\n')+'\n'),dec=new TextDecoder();
 for(const x of a.out.expression){const r=JSON.parse(dec.decode(rawBytes.slice(x.offset,x.offset+x.length)));eq(x.record,oracle(r,r.ie))}
 for(const x of a.out.metadata){eq(JSON.parse(dec.decode(rawBytes.slice(x.offset,x.offset+x.length))),x.row)}
 for(const x of a.out.declaration){const row=JSON.parse(dec.decode(rawBytes.slice(x.offset,x.offset+x.length)));const all=row.inductive?Object.values(row.inductive).flat():Object.values(row).flat();const m=all.find(m=>m.name===x.id);need(m,'declaration offset');eq(x.type,m.type);eq(x.value,m.value??null)}
 const adapted=lines.map((s,i)=>{const r=JSON.parse(s);if(!i)r.meta.format.version='3.1.0';if(r.inductive){const v=r.inductive;r.inductive={types:v.inductiveVals,ctors:v.constructorVals,recs:v.recursorVals}}for(const k of ['def','thm','opaque','axiom','quot'])if(Array.isArray(r[k])){need(r[k].length===1,'fixture group');r[k]=r[k][0]}return JSON.stringify(r)});
 const b=feed(adapted,'3.1.0');eq(b.summary.expressions,a.summary.expressions);eq(b.summary.declarations,a.summary.declarations);eq(b.out.expression.map(x=>x.record),a.out.expression.map(x=>x.record));eq(b.out.declaration.map(({offset,length,...x})=>x),a.out.declaration.map(({offset,length,...x})=>x));
 let rejected=0;for(const bad of [r=>({...r,ie:1}),r=>({...r,sort:999999}),r=>({ie:0,app:{fn:0,arg:0}}),r=>({ie:0,unknown:0})]){const m=lines.slice(),i=m.findIndex(s=>'ie'in JSON.parse(s));m[i]=JSON.stringify(bad(JSON.parse(m[i])));try{feed(m,'3.0.0')}catch{rejected++}}eq(rejected,4);
 return {checks,rejected,actual:a.summary,typedBytes:a.summary.expressions*16,metadataRows:a.out.metadata.length,adaptedFixture:b.summary};
}

import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {pack} from './rh_typed_index_codec.mjs';
export {writer,test};
async function main(){
 const [mode,...args]=process.argv.slice(2);
 if(mode==='test'){
  const b=fs.readFileSync(args[0]);need(crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')==='d3cd35f1313b4e78b5fded9886e450112aa75def','fixture Git blob mismatch');
  console.log(JSON.stringify(test(b.toString('utf8'),pack)));return
 }
 need(mode==='index'&&args.length===5,'index OUT SHA256 BYTES FORMAT ROOT_PARTS_JSON < raw.ndjson');
 const [target,digest,size,version,rootJson]=args,root=JSON.parse(rootJson),expected=Number(size);
 need(/^[0-9a-f]{64}$/.test(digest)&&Number.isSafeInteger(expected)&&expected>0,'expected authentication');
 need(['3.0.0','3.1.0'].includes(version)&&Array.isArray(root)&&root.length&&root.every(x=>typeof x==='string'),'format/root');
 const out=path.resolve(target);need(!fs.existsSync(out),'output exists');
 const stage=fs.mkdtempSync(out+'.tmp-'),files=new Map();
 function write(name,b){let s=files.get(name);if(!s){s={fd:fs.openSync(path.join(stage,name),'wx'),buf:Buffer.alloc(1<<20),used:0};files.set(name,s)}
  if(b.length>s.buf.length){flush(s);writeAll(s.fd,b);return}
  if(s.used+b.length>s.buf.length)flush(s);b.copy(s.buf,s.used);s.used+=b.length
 }
 function writeAll(fd,b){let at=0;while(at<b.length){const n=fs.writeSync(fd,b,at,b.length-at);need(n>0,'short write');at+=n}}
 function flush(s){writeAll(s.fd,s.buf.subarray(0,s.used));s.used=0}
 const w=writer((k,x)=>{if(k==='expression'){
  const b=Buffer.allocUnsafe(16),o=Buffer.allocUnsafe(12);x.record.forEach((v,i)=>b.writeUInt32LE(v,4*i));o.writeBigUInt64LE(BigInt(x.offset));o.writeUInt32LE(x.length,8);write('expr.bin',b);write('expr_offsets.bin',o)
 }else write(k+'.jsonl',Buffer.from(JSON.stringify(x)+'\n'))},version,root);
 const hash=crypto.createHash('sha256'),decoder=new TextDecoder('utf-8',{fatal:true});let carry=Buffer.alloc(0),bytes=0;
 const t=performance.now();
 function line(b,len){w.row(JSON.parse(decoder.decode(b)),len)}
 try{
  for await(const chunk of process.stdin){hash.update(chunk);bytes+=chunk.length;need(bytes<=expected,'excess bytes');const b=carry.length?Buffer.concat([carry,chunk]):chunk;let at=0,j;
   while((j=b.indexOf(10,at))>=0){line(b.subarray(at,j),j-at+1);at=j+1}carry=b.subarray(at)}
  if(carry.length)line(carry,carry.length);
  const got=hash.digest('hex');need(got===digest&&bytes===expected,'archive authentication mismatch');
  const summary=w.finish();need(summary.bytes===bytes,'offset accounting');
  for(const s of files.values()){flush(s);fs.closeSync(s.fd);s.fd=null}
  const report={...summary,sha256:got,seconds:(performance.now()-t)/1000,maxRSSKiB:process.resourceUsage().maxRSS,status:'AUTHENTICATED_TYPED_INDEX_NOT_KERNEL_RECHECK'};
  fs.writeFileSync(path.join(stage,'summary.json'),JSON.stringify(report,null,2));need(!fs.existsSync(out),'output appeared');fs.renameSync(stage,out);console.log(JSON.stringify(report))
 }catch(e){for(const s of files.values())if(s.fd!==null)fs.closeSync(s.fd);fs.rmSync(stage,{recursive:true,force:true});throw e}
}
if(process.argv[1]&&import.meta.url===new URL('file://'+process.argv[1]).href)await main();
