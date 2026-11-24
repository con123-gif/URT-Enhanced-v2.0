#!/usr/bin/env node
// RH kernel-extractor run 4. Disk-backed version of run-3 fingerprint_export.mjs.
// Source pin: lean4export 15f6055e299ad5b89345e533cc2192f4cc00f659, Export.lean m.size index.
// Serialized declaration identity only. Neither proof validation nor dependency closure.
// No full RH export execution here. Preserve full input and provenance.
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import {createHash} from 'node:crypto';
const digest=s=>createHash('sha256').update(s,'utf8').digest('hex');
function fingerprints(records, digest, stores=null){
 const fail=m=>{throw Error(m)};
 const obj=(x)=>{if(!x||typeof x!=="object"||Array.isArray(x))fail("object required");return x};
 const fields=(x,ks)=>{obj(x);let a=Object.keys(x).sort().join("|");if(a!==ks.split(" ").sort().join("|"))fail("unexpected keys: "+a+" expected "+ks);return x};
 const nat=x=>{if(!Number.isSafeInteger(x)||x<0)fail("unsafe or negative numeric field");return x};
 const str=x=>{if(typeof x!=="string"||/[\uD800-\uDBFF](?![\uDC00-\uDFFF])|(?<![\uD800-\uDBFF])[\uDC00-\uDFFF]/u.test(x))fail("bad string");return x};
 const bool=x=>{if(typeof x!=="boolean")fail("bad boolean");return x};
 const arr=(x,f)=>{if(!Array.isArray(x))fail("array required");return x.map(f)};
 const one=(x,opts)=>{if(!opts.includes(x))fail("unknown enum "+x);return x};
 const H=(...p)=>digest(JSON.stringify(["cathedral-export-content-v1",...p]));
 const names=stores?stores.names:new Map(),lev=stores?stores.levels:new Map(),expr=stores?stores.expressions:new Map(),decl=stores?stores.declarations:new Map();
 names.set(0,{hash:H("anonymous"),label:""});lev.set(0,H("zero"));
 const get=(m,i)=>{nat(i);if(!m.has(i))fail("unknown or forward index "+i);return m.get(i)};
 const put=(m,i,v)=>{nat(i);if(m.has(i))fail("duplicate index "+i);m.set(i,v)};
 const N=i=>{nat(i);return stores?names.hash(i):get(names,i).hash},L=i=>get(lev,i),E=i=>get(expr,i),Ns=a=>arr(a,N);
 const common=x=>[N(x.name),Ns(x.levelParams),E(x.type)];
 const kinds=["axiom","def","opaque","thm","quot","inductive"];
 const bi=x=>one(x,["default","implicit","strictImplicit","instImplicit"]);
 const fieldKinds={
 axiom:"name levelParams type isUnsafe",
 def:"name levelParams type value hints safety all",
 opaque:"name levelParams type value isUnsafe all",
 thm:"name levelParams type value all",
 quot:"name levelParams type kind",
 type:"name levelParams type numParams numIndices all ctors numNested isRec isUnsafe isReflexive",
 ctor:"name levelParams type induct cidx numParams numFields isUnsafe",
 rec:"name levelParams type all numParams numIndices numMotives numMinors rules k isUnsafe"};
 function hint(h){if(typeof h==="string")return one(h,["opaque","abbrev"]);fields(h,"regular");return ["regular",nat(h.regular)];}
 function member(k,x){
  fields(x,fieldKinds[k]);let c=common(x),extra;
  switch(k){
   case "axiom":extra=[bool(x.isUnsafe)];break;
   case "def":extra=[E(x.value),hint(x.hints),one(x.safety,["unsafe","safe","partial"]),Ns(x.all)];break;
   case "opaque":extra=[E(x.value),bool(x.isUnsafe),Ns(x.all)];break;
   case "thm":extra=[E(x.value),Ns(x.all)];break;
   case "quot":extra=[one(x.kind,["type","ctor","lift","ind"])];break;
   case "type":extra=[nat(x.numParams),nat(x.numIndices),Ns(x.all),Ns(x.ctors),nat(x.numNested),bool(x.isRec),bool(x.isUnsafe),bool(x.isReflexive)];break;
   case "ctor":extra=[N(x.induct),nat(x.cidx),nat(x.numParams),nat(x.numFields),bool(x.isUnsafe)];break;
   case "rec":extra=[Ns(x.all),nat(x.numParams),nat(x.numIndices),nat(x.numMotives),nat(x.numMinors),arr(x.rules,r=>{fields(r,"ctor nfields rhs");return [N(r.ctor),nat(r.nfields),E(r.rhs)]}),bool(x.k),bool(x.isUnsafe)];break;
   default:fail("unsupported declaration");
  }
  return {name:x.name,kind:k,digest:H("declaration",k,c,extra)};
 }
 function group(k,ms){
  if(!ms.length)fail("empty group");
  const groupHash=H("group",k,ms.map(m=>m.digest));
  for(const m of ms){let n=get(names,m.name);put(decl,m.name,{id:n.hash,display:n.label,kind:m.kind,digest:m.digest,groupDigest:groupHash});}
 }
 let meta=null,version=null,rows=0;
 for(const r of records){
  rows++;obj(r);
  if(rows===1){fields(r,"meta");meta=r.meta;fields(meta,"exporter lean format");fields(meta.exporter,"name version");fields(meta.lean,"githash version");fields(meta.format,"version");str(meta.exporter.name);str(meta.exporter.version);str(meta.lean.githash);str(meta.lean.version);version=one(meta.format.version,["3.0.0","3.1.0"]);continue;}
  const tags=["in","il","ie"].filter(k=>Object.hasOwn(r,k));
  if(tags.length>1)fail("multiple primitive indices");
  if(tags.length){
   const t=tags[0],ks=Object.keys(r).filter(k=>k!==t);if(ks.length!==1)fail("invalid primitive");const k=ks[0],x=r[k];let v;
   if(t==="in"){
    if(k==="str"){fields(x,"pre str");v=str(x.str);}
    else if(k==="num"){fields(x,"pre i");v=nat(x.i);}
    else fail("unknown name constructor");
    const p=get(names,x.pre);put(names,r.in,{hash:H("name",k,p.hash,v),label:(p.label?p.label+".":"")+v});
   }else if(t==="il"){
    if(k==="succ")v=[L(x)];else if(k==="param")v=[N(x)];else if(k==="max"||k==="imax"){if(!Array.isArray(x)||x.length!==2)fail("bad level pair");v=x.map(L);}else fail("unknown level constructor");
    put(lev,r.il,H("level",k,v));
   }else{
    switch(k){
     case "bvar":v=[nat(x)];break;
     case "sort":v=[L(x)];break;
     case "const":fields(x,"name us");v=[N(x.name),arr(x.us,L)];break;
     case "app":fields(x,"fn arg");v=[E(x.fn),E(x.arg)];break;
     case "lam":case "forallE":fields(x,"name type body binderInfo");v=[N(x.name),E(x.type),E(x.body),bi(x.binderInfo)];break;
     case "letE":fields(x,"name type value body nondep");v=[N(x.name),E(x.type),E(x.value),E(x.body),bool(x.nondep)];break;
     case "proj":fields(x,"typeName idx struct");v=[N(x.typeName),nat(x.idx),E(x.struct)];break;
     case "natVal":v=[str(x)];if(!/^(0|[1-9][0-9]*)$/.test(x))fail("bad literal");break;
     case "strVal":v=[str(x)];break;
     case "mdata":fields(x,"expr data");v=[E(x.expr),Object.entries(obj(x.data)).sort(([a],[b])=>a<b?-1:a>b?1:0).map(([k,v])=>[str(k),str(v)])];break;
     default:fail("unknown expression constructor "+k);
    }
    put(expr,r.ie,H("expr",k,v));
   }
  }else{
   const ks=Object.keys(r);if(ks.length!==1||!kinds.includes(ks[0]))fail("unknown record");
   const k=ks[0],x=r[k];
   if(k==="inductive"){
    const old=version==="3.0.0",names=old?["inductiveVals","constructorVals","recursorVals"]:["types","ctors","recs"];
    fields(x,names.join(" "));group(k,names.flatMap((f,i)=>arr(x[f],v=>member(["type","ctor","rec"][i],v))));
   }else{
    const ms=version==="3.0.0"&&Array.isArray(x)?arr(x,v=>member(k,v)):[member(k,x)];
    group(k,ms);
   }
  }
 }
 if(!meta||!decl.size)fail("missing metadata/declarations");
 return {schema:"cathedral-export-content-v1",meta,rows,names:names.size-1,levels:lev.size-1,expressions:expr.size,declarations:stores?decl.size:[...decl.values()]};
}

// The official exporter uses m.size as each next index (Export.lean line 90).
// Fixed-width dense index; no sparse seeks for primitive records. Each read
// checks that the index is already written. Current block is not on disk yet.
const hex=a=>Array.from(a,b=>b.toString(16).padStart(2,"0")).join("");
function unhex(s){if(typeof s!=="string"||!(/^[a-f0-9]{64}$/).test(s))throw Error("invalid digest");return Uint8Array.from({length:32},(_,i)=>parseInt(s.slice(2*i,2*i+2),16));}
const safe=(n)=>{if(!Number.isSafeInteger(n)||n<0)throw Error("unsafe index/offset");return n};
function exact(io,p,n){const v=io.readAt(safe(p),safe(n));if(v.length!==n)throw Error("short scratch read");return v}
class DenseRows{
 constructor(io,width,rowsPerBlock=2048,cacheBlocks=32){
  if(!Number.isSafeInteger(rowsPerBlock)||rowsPerBlock<1||!Number.isSafeInteger(cacheBlocks)||cacheBlocks<0)throw Error("bad cache configuration");
  this.io=io;this.width=width;this.rpb=rowsPerBlock;this.cap=cacheBlocks;this.blockBytes=safe(width*rowsPerBlock);this.pending=new Uint8Array(this.blockBytes);this.cache=new Map();this.size=0;this.block=0;this.filled=0;this.reads=0;this.hits=0;
 }
 has(i){return Number.isSafeInteger(i)&&i>=0&&i<this.size}
 set(i,row){
  if(i!==this.size||row.length!==this.width)throw Error("nonsequential primitive index or row width");
  this.pending.set(row,this.filled*this.width);this.filled++;this.size++;
  if(this.filled===this.rpb){this.io.writeAt(safe(this.block*this.blockBytes),this.pending);this.block++;this.filled=0;this.pending=new Uint8Array(this.blockBytes);}
 }
 get(i){
  if(!this.has(i))throw Error("unknown or forward index "+i);
  const k=Math.floor(i/this.rpb),off=(i%this.rpb)*this.width;let a;
  if(k===this.block){a=this.pending;this.hits++;}
  else if(this.cache.has(k)){a=this.cache.get(k);this.cache.delete(k);this.cache.set(k,a);this.hits++;}
  else{a=exact(this.io,safe(k*this.blockBytes),this.blockBytes);this.reads++;if(this.cap){this.cache.set(k,a);if(this.cache.size>this.cap)this.cache.delete(this.cache.keys().next().value);}}
  return a.subarray(off,off+this.width);
 }
 // No subsequent writes permitted after seal. Pending bytes are persisted.
 seal(){if(this.filled)this.io.writeAt(safe(this.block*this.blockBytes),this.pending.subarray(0,this.filled*this.width));}
}
function makeStores(open,encode,decode,emit,rowsPerBlock=2048,cacheBlocks=32){
 const nameRows=new DenseRows(open("name.rows"),44,rowsPerBlock,cacheBlocks),labels=open("name.labels"),
  levelRows=new DenseRows(open("level.rows"),32,rowsPerBlock,cacheBlocks),
  exprRows=new DenseRows(open("expr.rows"),32,rowsPerBlock,cacheBlocks),seen=open("decl.seen");
 let labelEnd=0,declCount=0;
 const digestTable=t=>({get size(){return t.size},has:i=>t.has(i),set:(i,h)=>t.set(i,unhex(h)),get:i=>hex(t.get(i))});
 const names={
  get size(){return nameRows.size},has:i=>nameRows.has(i),hash:i=>hex(nameRows.get(i).subarray(0,32)),
  set(i,v){
   if(i!==nameRows.size)throw Error("nonsequential name index");
   const bytes=encode(v.label),row=new Uint8Array(44),d=new DataView(row.buffer);
   if(bytes.length>0xffffffff)throw Error("label too large");
   row.set(unhex(v.hash));d.setBigUint64(32,BigInt(safe(labelEnd)),true);d.setUint32(40,bytes.length,true);
   if(bytes.length)labels.writeAt(labelEnd,bytes);labelEnd=safe(labelEnd+bytes.length);nameRows.set(i,row);
  },
  get(i){const a=nameRows.get(i),d=new DataView(a.buffer,a.byteOffset,a.byteLength),p=safe(Number(d.getBigUint64(32,true))),n=d.getUint32(40,true);
   return {hash:hex(a.subarray(0,32)),label:n?decode(exact(labels,p,n)):""};}
 };
 const declarations={
  get size(){return declCount},
  has(i){safe(i);const a=seen.readAt(i,1);return a.length===1&&a[0]===1},
  set(i,v){if(!nameRows.has(i))throw Error("unknown declaration name");if(this.has(i))throw Error("duplicate declaration");seen.writeAt(i,Uint8Array.of(1));emit(v);declCount++;}
 };
 return {names,levels:digestTable(levelRows),expressions:digestTable(exprRows),declarations,
  seal(){nameRows.seal();levelRows.seal();exprRows.seal()},
  metrics(){return {primitiveBytes:44*nameRows.size+32*(levelRows.size+exprRows.size),labelBytes:labelEnd,declSeenMaxBytes:nameRows.size,blockReads:nameRows.reads+levelRows.reads+exprRows.reads,blockHits:nameRows.hits+levelRows.hits+exprRows.hits,cacheUpperBytes:(cacheBlocks+1)*rowsPerBlock*(44+32+32)}}};
}
// Reference oracle for tests only: no promise of bounded memory here.
function memoryFiles(){
 const files=new Map();
 return {files,open(name){if(files.has(name))throw Error("duplicate scratch");let a=new Uint8Array(0);const x={
  readAt(p,n){return a.slice(p,p+n)},
  writeAt(p,b){if(p+b.length>a.length){const c=new Uint8Array(p+b.length);c.set(a);a=c}a.set(b,p)}
 };files.set(name,x);return x;}};
}
function tests(records,digest,encode,decode){
 const ref=fingerprints(records,digest);let assertions=0;
 const assert=(v,m)=>{if(!v)throw Error(m);assertions++};
 const same=(a,b,m)=>assert(JSON.stringify(a)===JSON.stringify(b),m);
 function run(rows,rpb,cap){const mem=memoryFiles(),decls=[];const s=makeStores(mem.open,encode,decode,v=>decls.push(v),rpb,cap);const result=fingerprints(rows,digest,s);s.seal();return {result,decls,metrics:s.metrics()}}
 let out;
 for(const [r,c] of [[1,0],[3,1],[16,2],[2048,32]]){out=run(records,r,c);same(out.decls,ref.declarations,"disk record mismatch");same({...out.result,declarations:out.decls},ref,"summary mismatch");assert(out.metrics.cacheUpperBytes===(c+1)*r*108,"cache bound")}
 assert(ref.declarations.find(x=>x.display==="Nat.add_succ").digest==="0e56f47be0ae6b2cffc4763e5f494166630fa594f80f5995b7d6a1837c79be23","prior digest mismatch");
 const clone=()=>JSON.parse(JSON.stringify(records));
 function rejects(f){const r=clone();f(r);let ok=false;try{run(r,3,1)}catch{ok=true}assert(ok,"invalid input accepted")}
 rejects(x=>x.find(r=>r.ie===0).ie=1);
 rejects(x=>x.find(r=>r.in===1).in=0);
 rejects(x=>x.find(r=>r.ie===433).lam.body=999999);
 rejects(x=>x.push(x.find(r=>r.thm)));
 rejects(x=>x.find(r=>r.thm).thm[0].value=undefined);
 const changed=clone();changed.find(r=>r.thm).thm[0].value=changed.find(r=>r.thm).thm[0].type;
 let m=run(changed,3,1);assert(m.decls.find(x=>x.display==="Nat.add_succ").digest!==ref.declarations.find(x=>x.display==="Nat.add_succ").digest,"value change missed");
 const r=run(records,3,1);assert(r.metrics.blockReads>0&&r.metrics.blockHits>0,"cache path not exercised");
 const t=new DenseRows(memoryFiles().open("short"),32,1,0);t.set(0,new Uint8Array(32));t.io.readAt=()=>new Uint8Array(31);let rejected=false;try{t.get(0)}catch{rejected=true}assert(rejected,"short read accepted");
 return {assertions,records:ref.rows,declarations:ref.declarations.length,rootDigest:ref.declarations.find(x=>x.display==="Nat.add_succ").digest,smallCache:r.metrics,defaultCache:out.metrics};
}


function diskIO(fd){
 return {
  readAt(p,n){const a=new Uint8Array(n);let done=0;while(done<n){const k=fs.readSync(fd,a,done,n-done,p+done);if(!k)break;done+=k}return a.subarray(0,done)},
  writeAt(p,a){let done=0;while(done<a.length){const k=fs.writeSync(fd,a,done,a.length-done,p+done);if(!k)throw Error("short scratch write");done+=k}}
 };
}
// Bounded single-record buffer. Input is hashed as bytes, not normalized JSON.
// Official exporter input only: JSON.parse does not detect duplicate object keys.
function* recordsFrom(fd,hash,maxLine=64*1024*1024){
 const b=Buffer.allocUnsafe(1024*1024);let fragments=[],bytes=0;
 const decoder=new TextDecoder("utf-8",{fatal:true});
 function add(v){bytes+=v.length;if(bytes>maxLine)throw Error("record exceeds configured limit");if(v.length)fragments.push(Buffer.from(v))}
 function finish(){if(!bytes)throw Error("empty NDJSON record");const x=JSON.parse(decoder.decode(Buffer.concat(fragments,bytes)));fragments=[];bytes=0;return x}
 for(;;){const n=fs.readSync(fd,b,0,b.length,null);if(!n)break;hash.update(b.subarray(0,n));let start=0;
  for(let i=0;i<n;i++)if(b[i]===10){add(b.subarray(start,i));yield finish();start=i+1}
  add(b.subarray(start,n));
 }
 if(bytes)yield finish();
}
function main(){
 const [mode,input,output,expected]=process.argv.slice(2);
 if(mode==="--self-test"){
  const rows=fs.readFileSync(input,"utf8").trim().split(/\r?\n/).map(JSON.parse);
  console.log(JSON.stringify(tests(rows,digest,s=>new TextEncoder().encode(s),a=>new TextDecoder("utf-8",{fatal:true}).decode(a)),null,2));return;
 }
 if(mode!=="--scan"||!input||!output||!expected||!(/^[a-f0-9]{64}$/).test(expected))throw Error("usage: node fingerprint_export_disk.mjs --scan INPUT.ndjson|- OUTPUT.ndjson EXPECTED_DECOMPRESSED_SHA256");
 const scratch=fs.mkdtempSync(path.join(process.env.RH_SCRATCH||os.tmpdir(),"rh-fp-"));
 const temp=fs.mkdtempSync(path.join(path.dirname(path.resolve(output)),".rh-fp-")),part=path.join(temp,"output");
 const fds=[];let inFd=null;
 try{
  const fd=fs.openSync(part,"wx");fds.push(fd);let offset=0;const out=diskIO(fd);
  const emit=(record)=>{const a=Buffer.from(JSON.stringify(record)+"\n");out.writeAt(offset,a);offset=safe(offset+a.length)};
  emit({header:{schema:"cathedral-export-content-v1-stream",expectedDecompressedSHA256:expected,scope:"serialized content only; source identity and closure separate"}});
  const open=name=>{const fd=fs.openSync(path.join(scratch,name),"wx+");fds.push(fd);return diskIO(fd)};
  const s=makeStores(open,v=>new TextEncoder().encode(v),a=>new TextDecoder("utf-8",{fatal:true}).decode(a),declaration=>emit({declaration}));
  inFd=input==="-"?0:fs.openSync(input,"r");const hash=createHash("sha256");
  const result=fingerprints(recordsFrom(inFd,hash),digest,s);s.seal();const actual=hash.digest("hex");
  if(actual!==expected)throw Error("decompressed input digest mismatch");
  emit({footer:{...result,inputSHA256:actual,metrics:s.metrics(),maxRSSKiB:process.resourceUsage().maxRSS}});
  fs.fsyncSync(fd);fs.linkSync(part,path.resolve(output)); // no overwrite; no published partial file
  console.log(JSON.stringify({result,inputSHA256:actual,metrics:s.metrics(),output},null,2));
 }finally{if(inFd!==null&&inFd!==0)fs.closeSync(inFd);for(const fd of fds)fs.closeSync(fd);fs.rmSync(scratch,{recursive:true,force:true});fs.rmSync(temp,{recursive:true,force:true});}
}
main();
