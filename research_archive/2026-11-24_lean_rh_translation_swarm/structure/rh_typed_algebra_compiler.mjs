const S={"str":["pre","str"],"num":["pre","i"],"const":["name","us"],"app":["fn","arg"],"lam":["name","type","body","binderInfo"],"forallE":["name","type","body","binderInfo"],"letE":["name","type","value","body","nondep"],"proj":["typeName","idx","struct"],"mdata":["expr","data"],"axiom":["name","levelParams","type","isUnsafe"],"def":["name","levelParams","type","value","hints","safety","all"],"opaque":["name","levelParams","type","value","isUnsafe","all"],"thm":["name","levelParams","type","value","all"],"quot":["name","levelParams","type","kind"],"inductive":["types","ctors","recs"],"type":["name","levelParams","type","numParams","numIndices","all","ctors","numNested","isRec","isUnsafe","isReflexive"],"ctor":["name","levelParams","type","induct","cidx","numParams","numFields","isUnsafe"],"rec":["name","levelParams","type","all","numParams","numIndices","numMotives","numMinors","rules","k","isUnsafe"],"rule":["ctor","nfields","rhs"]};
const NAME=["str","num"],LEVEL=["succ","max","imax","param"],EXPR=["bvar","sort","const","app","lam","forallE","letE","proj","natVal","strVal","mdata"],DECL=["axiom","def","opaque","thm","quot","inductive"];
function pack(o,fields){
 if(!o||typeof o!=="object"||Array.isArray(o)||Object.keys(o).length!==fields.length||fields.some(k=>!Object.hasOwn(o,k)))throw Error("schema mismatch "+JSON.stringify(o).slice(0,240));
 return fields.map(k=>o[k]);
}

function unpack(a,fields){if(a.length!==fields.length)throw Error("tuple length");return Object.fromEntries(fields.map((k,i)=>[k,a[i]]))}

function convert(r){
 if(Object.hasOwn(r,"meta")){pack(r,["meta"]);return ["M",r.meta]}
 for(const [tag,id,ks] of [["N","in",NAME],["U","il",LEVEL],["E","ie",EXPR]]){
  if(!Object.hasOwn(r,id))continue;
  const kinds=ks.filter(k=>Object.hasOwn(r,k));if(kinds.length!==1)throw Error("unknown primitive");
  const k=kinds[0];pack(r,[id,k]);const v=r[k];
  return [tag,r[id],ks.indexOf(k),S[k]?pack(v,S[k]):v];
 }
 const ks=DECL.filter(k=>Object.hasOwn(r,k));if(ks.length!==1)throw Error("unknown declaration");const k=ks[0];pack(r,[k]);
 if(k==="inductive"){
  const [types,ctors,recs]=pack(r[k],S.inductive);
  return ["D",DECL.indexOf(k),[types.map(t=>pack(t,S.type)),ctors.map(t=>pack(t,S.ctor)),recs.map(t=>{const a=pack(t,S.rec);a[8]=a[8].map(r=>pack(r,S.rule));return a})]];
 }
 return ["D",DECL.indexOf(k),pack(r[k],S[k])];
}

function restore(a){
 if(a[0]==="M"){if(a.length!==2)throw Error("meta tuple");return {meta:a[1]}}
 if(a[0]==="D"){
  if(a.length!==3||!DECL[a[1]])throw Error("decl tuple");
  const k=DECL[a[1]],v=a[2];
  if(k==="inductive"){
   if(v.length!==3)throw Error("group tuple");
   return {inductive:{types:v[0].map(t=>unpack(t,S.type)),ctors:v[1].map(t=>unpack(t,S.ctor)),recs:v[2].map(t=>{const p=t.slice();p[8]=p[8].map(r=>unpack(r,S.rule));return unpack(p,S.rec)})}};
  }
  return {[k]:unpack(v,S[k])};
 }
 const info={N:["in",NAME],U:["il",LEVEL],E:["ie",EXPR]}[a[0]];
 if(!info||a.length!==4||!info[1][a[2]])throw Error("primitive tuple");
 const k=info[1][a[2]];return {[info[0]]:a[1],[k]:S[k]?unpack(a[3],S[k]):a[3]};
}

function equal(a,b){
 if(a===b)return true;
 if(!a||!b||typeof a!=="object"||typeof b!=="object"||Array.isArray(a)!==Array.isArray(b))return false;
 const ks=Object.keys(a);
 return ks.length===Object.keys(b).length&&ks.every(k=>Object.hasOwn(b,k)&&equal(a[k],b[k]));
}

function scalarSafety(v){
 if(typeof v==="number"&&!Number.isSafeInteger(v))throw Error("numeric value not exactly represented");
 if(v&&typeof v==="object")for(const x of Object.values(v))scalarSafety(x);
}

function readEngine(){
 const phi=(1+Math.sqrt(5))/2,k=Math.PI/Math.E,angle=2*Math.PI/(phi*phi),qr=k*Math.cos(angle),qi=k*Math.sin(angle);
 const block=1<<17,pages=[];let n=0,edges=0,maxNorm=0,checksum=[0,0];
 const tags=EXPR.map((_,i)=>[Math.cos(i*angle),Math.sin(i*angle)]);
 function read(id){if(!Number.isSafeInteger(id)||id<0||id>=n)throw Error("invalid expression edge "+id+" at "+n);const p=pages[Math.floor(id/block)],j=2*(id%block);return [p[j],p[j+1]]}
 function append(a){
  if(a[0]!=="E"||a[1]!==n)throw Error("nonsequential expression");
  const type=EXPR[a[2]],v=a[3];let children=[];
  if(type==="app")children=v;
  if(type==="lam"||type==="forallE")children=[v[1],v[2]];
  if(type==="letE")children=[v[1],v[2],v[3]];
  if(type==="proj")children=[v[2]];
  if(type==="mdata")children=[v[0]];
  let r=tags[a[2]][0],s=tags[a[2]][1],cr=0,ci=0;
  for(const id of children){const [x,y]=read(id);cr+=x;ci+=y;edges++}
  const denom=1+k*children.length;
  r=(r+qr*cr-qi*ci)/denom;s=(s+qr*ci+qi*cr)/denom;
  const norm=Math.hypot(r,s);if(!Number.isFinite(norm)||norm>1+1e-12)throw Error("URT norm exceeded");
  maxNorm=Math.max(maxNorm,norm);
  if(n%block===0)pages.push(new Float64Array(2*block));
  const p=pages[Math.floor(n/block)],j=2*(n%block);p[j]=r;p[j+1]=s;n++;
  checksum[0]+=r;checksum[1]+=s;
 }
 return {append,read,summary:()=>({expressions:n,expressionChildEdges:edges,maxNorm,scoreSum:checksum,scoreBytes:pages.length*block*16,q:[qr,qi]})};
}

function checkRecords(records){
 const r=readEngine(),counts={},names=1,unused=names;
 let nameNext=1,levelNext=1,raw=0,compact=0;
 const declared=new Set();
 function id(i,n,label){if(!Number.isSafeInteger(i)||i<0||i>=n)throw Error("invalid "+label+" "+i)}
 function name(i){id(i,nameNext,"name")}
 function lev(i){id(i,levelNext,"level")}
 function ex(i){id(i,r.summary().expressions,"expr")}
 function d(m){name(m.name);if(declared.has(m.name))throw Error("duplicate declaration");declared.add(m.name);m.levelParams.forEach(name);ex(m.type);if(Object.hasOwn(m,"value"))ex(m.value);for(const a of m.all||[])name(a);for(const a of m.ctors||[])name(a);if(Object.hasOwn(m,"induct"))name(m.induct);for(const a of m.rules||[]){name(a.ctor);ex(a.rhs)}}
 for(const obj of records){
  scalarSafety(obj);const a=convert(obj);if(!equal(obj,restore(a)))throw Error("roundtrip");
  raw+=JSON.stringify(obj).length;compact+=JSON.stringify(a).length;
  counts[a[0]]=(counts[a[0]]||0)+1;
  if(a[0]==="N"){if(a[1]!==nameNext)throw Error("name order");name(a[3][0]);nameNext++}
  if(a[0]==="U"){if(a[1]!==levelNext)throw Error("level order");if(a[2]===3)name(a[3]);else if(a[2]===0)lev(a[3]);else a[3].forEach(lev);levelNext++}
  if(a[0]==="E"){
   const k=EXPR[a[2]],v=a[3];
   if(k==="sort")lev(v);
   if(k==="const"){name(v[0]);v[1].forEach(lev)}
   if(["lam","forallE","letE","proj"].includes(k))name(v[0]);
   r.append(a);
  }
  if(a[0]==="D"){const k=DECL[a[1]];if(k==="inductive"){for(const group of [obj.inductive.types,obj.inductive.ctors,obj.inductive.recs])group.forEach(d)}else d(obj[k]);}
 }
 return {counts,rawCharacters:raw,algebraCharacters:compact,declared:declared.size,...r.summary()};
}


import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawn} from 'node:child_process';
import {once} from 'node:events';
import readline from 'node:readline';
const HASH='bd484ac9886a96f26b1d9a7a59ebd45b7a70d102c015d4f31f9302bbdd6ab2b9';
const BYTES=350862311;
const args=process.argv.slice(2);
if(args[0]==='fixtures'){
 const b=JSON.parse(fs.readFileSync(args[1],'utf8'));
 console.log(JSON.stringify(b.map(checkRecords),null,2));
}else{
 const i=args.indexOf('--out');if(i<0||!args[i+1])throw Error('missing --out');
 const out=path.resolve(args[i+1]);fs.mkdirSync(out,{recursive:true});
 const reader=readEngine(),counts={},sha=crypto.createHash('sha256'),algebraSha=crypto.createHash('sha256');
 const child=spawn('bash',['-o','pipefail','-c','curl --fail --location --silent --show-error "$1" | zstd -dc --long=30','rh','https://math.mit.edu/~drew/grh/challenge.ndjson.zst'],{stdio:['ignore','pipe','inherit']});
 const end=once(child,'close');let bytes=0,raw=0,compact=0,lines=0,carry=Buffer.alloc(0),meta=null;
 // Optional artifact output is compressed on the fly; never store the raw archive.
 const z=spawn('zstd',['-q','-3','-o',path.join(out,'challenge_typed_algebra.jsonl.zst')],{stdio:['pipe','inherit','inherit']});
 const zEnd=once(z,'close');let pending=[],len=0;
 async function flush(){if(!len)return;const b=pending.join('');pending=[];len=0;if(!z.stdin.write(b))await once(z.stdin,'drain')}
 async function line(b){
  const obj=JSON.parse(b.toString('utf8'));scalarSafety(obj);
  const a=convert(obj);
  if(!equal(obj,restore(a)))throw Error('roundtrip failed '+lines);
  if(lines===0){meta=obj.meta;if(meta?.format?.version!=='3.1.0')throw Error('format mismatch')}
  else if(a[0]==='M')throw Error('unexpected metadata');
  if(a[0]==='E')reader.append(a);
  const s=JSON.stringify(a)+'\n';
  counts[a[0]]=(counts[a[0]]||0)+1;lines++;raw+=b.length+1;compact+=Buffer.byteLength(s);algebraSha.update(s);
  pending.push(s);len+=s.length;if(len>=1048576)await flush();
 }
 try{
  for await(const chunk of child.stdout){
   bytes+=chunk.length;sha.update(chunk);
   const b=carry.length?Buffer.concat([carry,chunk]):chunk;let start=0,j;
   while((j=b.indexOf(10,start))>=0){await line(b.subarray(start,j));start=j+1}
   carry=b.subarray(start);
  }
  if(carry.length)await line(carry);
  const [code]=await end;if(code!==0)throw Error('download or decompress failed');
  if(bytes!==BYTES||sha.digest('hex')!==HASH)throw Error('challenge checksum/length mismatch');
  await flush();z.stdin.end();const [zc]=await zEnd;if(zc!==0)throw Error('algebra compression failed');
  const summary={status:'LOSSLESS_EXPORT_RECORD_ALGEBRA_NOT_KERNEL_CHECK',archive:'challenge.ndjson.zst',inputSha256:HASH,algebraSha256:algebraSha.digest('hex'),bytes,algebraUncompressedBytes:compact,records:lines,counts,meta,...reader.summary(),maxRssKiB:process.resourceUsage().maxRSS,limits:['challenge only, not the solution archive','roundtrip semantic JSON equality, not raw byte equality','constructor-level URT score not injective and not a proof check','expression references topologically checked; not independent declaration/type checking','scores held in chunked memory; full-scale disk-backed reader not yet executed']};
  fs.writeFileSync(path.join(out,'summary.json'),JSON.stringify(summary,null,2));console.log(JSON.stringify(summary,null,2));
 }catch(e){child.kill();z.kill();throw e}
}
