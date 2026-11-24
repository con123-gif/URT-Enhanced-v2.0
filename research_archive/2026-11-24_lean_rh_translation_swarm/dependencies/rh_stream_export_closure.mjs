function fail(msg){throw Error(msg)}

function eid(i){if(!Number.isInteger(i)||i<0||i>=2147483647)fail("expression ID out of range");return i+1}

function did(i){return -eid(i)}

function exprEdges(r,lookup) {
  const kinds=["const","app","lam","forallE","letE","proj","mdata","bvar","sort","natVal","strVal"].filter(k=>Object.hasOwn(r,k));
  if(kinds.length!==1)fail("unsupported expression: "+Object.keys(r));
  const k=kinds[0],a=r[k];
  switch(k){
    case "const":return [did(a.name)];
    case "app":return [eid(a.fn),eid(a.arg)];
    case "lam":case "forallE":return [eid(a.type),eid(a.body)];
    case "letE":return [eid(a.type),eid(a.value),eid(a.body)];
    case "proj":return [did(a.typeName),eid(a.struct)];
    case "mdata":return [eid(a.expr)];
    case "natVal":return [did(lookup("Nat"))];
    case "strVal":return [did(lookup("Char.ofNat")),did(lookup("String.ofList"))];
    default:return [];
  }
}

function addDeclarations(r,put){
  if(r.inductive){
    const ms=[...r.inductive.types.map(m=>["inductive",m]),...r.inductive.ctors.map(m=>["ctor",m]),...r.inductive.recs.map(m=>["rec",m])];
    if(!ms.length)fail("empty inductive");
    const anchor=ms[0][1].name;
    for(const [kind,m] of ms){
      const edges=[eid(m.type),...(m.all||[]).map(did),...(m.ctors||[]).map(did)];
      if(m.induct!==undefined)edges.push(did(m.induct));
      for(const rule of m.rules||[])edges.push(did(rule.ctor),eid(rule.rhs));
      if(m.name===anchor)edges.push(...ms.map(x=>did(x[1].name)));
      else edges.push(did(anchor));
      put(m.name,kind,edges);
    }
    return;
  }
  const ks=["axiom","def","opaque","thm","quot"].filter(k=>Object.hasOwn(r,k));
  if(ks.length!==1)fail("unsupported declaration: "+Object.keys(r));
  const k=ks[0],m=r[k],edges=[eid(m.type),...(m.all||[]).map(did)];
  if(["def","opaque","thm"].includes(k))edges.push(eid(m.value));
  put(m.name,k,edges);
}

function seenBits(){
  const pages=new Map(),bits=1<<19;
  return id=>{
    const p=Math.floor(id/bits),n=id%bits;
    let a=pages.get(p);if(!a){a=new Uint8Array(bits/8);pages.set(p,a)}
    const j=n>>3,b=1<<(n&7);
    if(a[j]&b)return true;a[j]|=b;return false;
  };
}

function traverse(roots,readExpr,readDecl,visit){
  const es=seenBits(),ds=seenBits(),stack=[];
  const counts={expressions:0,declarations:0,edges:0};
  function push(ref){
    if(ref===0)return;
    if(!Number.isInteger(ref)||Math.abs(ref)>2147483647)fail("invalid edge");
    const id=Math.abs(ref)-1;
    if(!(ref>0?es(id):ds(id)))stack.push(ref);
  }
  for(const id of roots)push(did(id));
  while(stack.length){
    const r=stack.pop(),id=Math.abs(r)-1;
    const v=r>0?readExpr(id):readDecl(id);
    if(!v)fail("missing "+(r>0?"expr":"decl")+" "+id);
    const edges=r>0?v:v.edges;
    counts[r>0?"expressions":"declarations"]++;
    for(const ref of edges)if(ref!==0){counts.edges++;push(ref)}
    if(r<0)visit(id,v);
  }
  return counts;
}

function selftest(){
  const expr=[{ie:0,sort:0},{ie:1,const:{name:1,us:[]}},{ie:2,app:{fn:1,arg:1}},{ie:3,proj:{typeName:2,struct:2}},{ie:4,letE:{type:0,value:2,body:3}},{ie:5,natVal:"7"},{ie:6,strVal:"x"},{ie:7,app:{fn:4,arg:5}},{ie:8,app:{fn:7,arg:6}}];
  const names={"Nat":6,"Char.ofNat":7,"String.ofList":8};
  const d=new Map(),put=(id,kind,edges)=>d.set(id,{kind,edges});
  addDeclarations({axiom:{name:1,type:0}},put);
  addDeclarations({inductive:{types:[{name:2,type:0,all:[2],ctors:[3]}],ctors:[{name:3,type:0,induct:2}],recs:[{name:4,type:0,all:[2],rules:[{ctor:3,rhs:1}]}]}},put);
  addDeclarations({thm:{name:5,type:0,value:8,all:[5]}},put);
  for(const id of [6,7,8,9])addDeclarations({def:{name:id,type:0,value:0,all:[id]}},put);
  const got=[],counts=traverse([5],id=>expr[id]&&exprEdges(expr[id],n=>names[n]),id=>d.get(id),id=>got.push(id));
  if(counts.expressions!==9||counts.declarations!==8||got.includes(9)||new Set(got).size!==got.length)fail("fixture closure");
  let rejected=0;try{traverse([99],()=>null,id=>d.get(id),()=>{})}catch(e){rejected++}
  try{exprEdges({ie:10,unknown:1},()=>0)}catch(e){rejected++}
  if(rejected!==2)fail("fail closed");
  let reads=0;
  const deep=traverse([0],id=>{reads++;return id===0?[]:[eid(id-1),eid(id-1)]},()=>({edges:[eid(100000)]}),()=>{});
  if(reads!==100001||deep.expressions!==100001)fail("duplicate visit");
  return {fixture:counts,negativeControls:rejected,sharedChain:deep};
}


import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawn} from 'node:child_process';
import {once} from 'node:events';
import {performance} from 'node:perf_hooks';

const HASH='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e';
const CHALLENGE_HASH='bd484ac9886a96f26b1d9a7a59ebd45b7a70d102c015d4f31f9302bbdd6ab2b9';
const ROOT='riemannHypothesis';
const BASE='https://math.mit.edu/~drew/grh/';
const widths=12, blockRecords=65536;
function fileStore(file){
 const fd=fs.openSync(file,'wx+'),buf=Buffer.allocUnsafe(widths*blockRecords);
 let n=0,used=0,closed=false;
 function flush(){if(used){let at=0;while(at<used)at+=fs.writeSync(fd,buf,at,used-at);used=0}}
 function append(id,edges){
   if(id!==n)fail('nonsequential expression index '+id+' expected '+n);
   if(edges.length>3)fail('record exceeds width');
   for(let k=0;k<3;k++)buf.writeInt32LE(edges[k]||0,used+4*k);
   used+=widths;n++;if(used===buf.length)flush();
 }
 const cache=new Map(),maxBlocks=128;
 function read(id){
   if(!closed)fail('index not sealed');
   if(id<0||id>=n)return null;
   const block=Math.floor(id/blockRecords),i=(id%blockRecords)*widths;
   let b=cache.get(block);
   if(b){cache.delete(block);cache.set(block,b)}
   else{
     const len=Math.min(blockRecords,n-block*blockRecords)*widths;
     b=Buffer.allocUnsafe(len);let got=0;
     while(got<len){const k=fs.readSync(fd,b,got,len-got,block*blockRecords*widths+got);if(!k)fail('short index read');got+=k}
     cache.set(block,b);if(cache.size>maxBlocks)cache.delete(cache.keys().next().value);
   }
   return [b.readInt32LE(i),b.readInt32LE(i+4),b.readInt32LE(i+8)];
 }
 return {append,read,seal(){flush();closed=true},close(){fs.closeSync(fd)},count:()=>n};
}
async function runArchive(file,expected,expectedBytes,out,challenge=false){
 const t=performance.now(),tmp=fs.mkdtempSync(path.join(os.tmpdir(),'rh-edges-'));
 const edges=fileStore(path.join(tmp,'expr.bin'));
 const names=[null],decls=new Map(),special=new Map(),quot=[];
 const wanted=new Set([ROOT,'Nat','Char.ofNat','String.ofList']);
 // Prefixes only; retain all original tagged name components for output.
 const prefixes=new Set(['','Char','String',...wanted]);
 const prefixIds=new Map([[0,'']]);
 let bytes=0,lines=0,meta=null,carry=Buffer.alloc(0);
 const hash=crypto.createHash('sha256');
 function lookup(s){if(!special.has(s))fail('literal dependency not exported: '+s);return special.get(s)}
 function nameParts(id){
   const a=[];
   while(id!==0){const r=names[id];if(!r)fail('missing name '+id);a.push(r[1]);id=r[0]}
   return a.reverse();
 }
 function nameText(id){return nameParts(id).map(String).join('.')}
 function put(id,kind,refs){
   did(id);if(decls.has(id))fail('duplicate declaration '+id);
   if(!names[id])fail('unknown declaration name '+id);
   decls.set(id,{kind,edges:refs});
   if(kind==='quot')quot.push(id);
 }
 function line(b){
   const r=JSON.parse(b.toString('utf8'));lines++;
   if(lines===1){meta=r.meta;if(meta?.format?.version!=='3.1.0')fail('unexpected export format');return}
   if(Object.hasOwn(r,'ie')){edges.append(r.ie,exprEdges(r,lookup));return}
   if(Object.hasOwn(r,'in')){
     if(r.in!==names.length)fail('nonsequential name index');
     const m=r.str||r.num;if(!m||!Number.isSafeInteger(m.pre)||m.pre<0||m.pre>=r.in)fail('invalid name prefix');
     const val=r.str?m.str:m.i;
     if(typeof val==='number'&&!Number.isSafeInteger(val))fail('unsafe numeric name component');
     names.push([m.pre,val]);
     if(r.str&&prefixIds.has(m.pre)){
       const q=prefixIds.get(m.pre),s=q?q+'.'+val:val;
       // Matching only the exact expected tagged prefix chains, not ambiguous dots in a component.
       if(!val.includes('.')&&prefixes.has(s)){prefixIds.set(r.in,s);if(wanted.has(s))special.set(s,r.in)}
     }
     return;
   }
   if(Object.hasOwn(r,'il'))return;
   addDeclarations(r,put);
 }
 const child=spawn('bash',['-o','pipefail','-c','curl --fail --location --retry 0 --silent --show-error "$1" | zstd -dc --long=30','rh',BASE+file],{stdio:['ignore','pipe','inherit']});
 const exited=once(child,'close');
 try{
   for await(const chunk of child.stdout){
     hash.update(chunk);bytes+=chunk.length;
     const b=carry.length?Buffer.concat([carry,chunk]):chunk;let start=0,j;
     while((j=b.indexOf(10,start))>=0){line(b.subarray(start,j));start=j+1}
     carry=b.subarray(start);
     if(lines%5000000<chunk.length/20)console.error('indexed',bytes,'bytes',edges.count(),'expressions');
   }
   if(carry.length)line(carry);
   const [code,signal]=await exited;if(code!==0)fail('download/decompress failed '+code+' '+signal);
   const digest=hash.digest('hex');
   if(bytes!==expectedBytes||digest!==expected)fail('export byte/hash mismatch '+bytes+' '+digest);
   edges.seal();
   if(quot.length){const anchor=quot[0];decls.get(anchor).edges.push(...quot.map(did));for(const id of quot.slice(1))decls.get(id).edges.push(did(anchor))}
   const root=lookup(ROOT),axioms=[],outFile=path.join(out,challenge?'challenge_declarations.jsonl':'reachable_declarations.jsonl');
   const fd=fs.openSync(outFile,'w');let pending=[],pendingBytes=0;
   function flushOut(){if(pending.length){fs.writeSync(fd,pending.join(''));pending=[];pendingBytes=0}}
   let counts;
   try{
     counts=traverse([root],edges.read,id=>decls.get(id),(id,v)=>{
       const name=nameText(id);if(v.kind==='axiom')axioms.push(name);
       const row=JSON.stringify({id,nameParts:nameParts(id),kind:v.kind,refs:v.edges})+'\n';
       pending.push(row);pendingBytes+=row.length;if(pendingBytes>=1048576)flushOut();
     });flushOut();
   }finally{fs.closeSync(fd)}
   const result={status:'EXPLICIT_EXPORT_REFERENCE_CLOSURE_NOT_KERNEL_RECHECK',archive:file,digest,bytes,lines,meta,
    indexedExpressions:edges.count(),indexedDeclarations:decls.size,indexedNames:names.length-1,root,reachable:counts,axioms:axioms.sort(),
    unusualAxioms:axioms.filter(a=>!['propext','Classical.choice','Quot.sound'].includes(a)),seconds:(performance.now()-t)/1000,
    maxRssKiB:process.resourceUsage().maxRSS,
    expressionIndexBytes:edges.count()*widths,
    limits:['literal and inductive/quotient structural references conservatively retained','not a logically minimal proof or direct theorem-only DAG','no local kernel recheck','raw archive streamed and hash checked; no raw archive persisted','expression index transient; declaration roots and named records retained for reproducible next passes']};
   fs.writeFileSync(path.join(out,challenge?'challenge_summary.json':'summary.json'),JSON.stringify(result,null,2));
   console.log(JSON.stringify(result,null,2));
   if(!challenge&&result.unusualAxioms.length)fail('unexpected reachable axiom; inspect graph');
   // Compress the named declaration manifest without retaining a second uncompressed copy.
   const z=spawn('zstd',['-q','-f','--rm','-3',outFile],{stdio:'inherit'});
   const [zc]=await once(z,'close');if(zc!==0)fail('declaration compression failed');
   return result;
 }finally{child.kill();edges.close();fs.rmSync(tmp,{recursive:true,force:true})}
}
const args=process.argv.slice(2);
if(args[0]==='selftest'){console.log(JSON.stringify(selftest()));}
else{
 const i=args.indexOf('--out');if(i<0||!args[i+1])fail('use --out DIR');
 const out=path.resolve(args[i+1]);fs.mkdirSync(out,{recursive:true});
 console.log(JSON.stringify({selftest:selftest()}));
 await runArchive('challenge.ndjson.zst',CHALLENGE_HASH,350862311,out,true);
 if(!args.includes('--challenge-only'))await runArchive('solution.ndjson.zst',HASH,61570595788,out);
}
