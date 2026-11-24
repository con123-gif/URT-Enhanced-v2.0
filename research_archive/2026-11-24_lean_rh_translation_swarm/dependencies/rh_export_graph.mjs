function entries(r) {
  if ("meta" in r || "il" in r) return [];
  if ("ie" in r) return [["e",r.ie]];
  if ("in" in r) return [["n",r.in]];
  if ("inductive" in r) {
    const a=members(r);
    if(!a.length) throw Error("empty inductive group");
    return [...a.map(x=>["d",x.name]),["g",a[0].name]];
  }
  const k=declKind(r);
  return [["d",r[k].name]];
}

function declKind(r) {
  const k=["axiom","def","opaque","thm","quot"].filter(k=>k in r);
  if(k.length!==1) throw Error("unknown declaration: "+Object.keys(r));
  return k[0];
}

function members(r) {
  return [...r.inductive.types,...r.inductive.ctors,...r.inductive.recs];
}

function edges(kind,r) {
  const e=x=>["e",x], d=x=>["d",x];
  if(kind==="e"){
    if("const" in r)return [d(r.const.name)];
    if("app" in r)return [e(r.app.fn),e(r.app.arg)];
    for(const k of ["lam","forallE"])if(k in r)return [e(r[k].type),e(r[k].body)];
    if("letE" in r)return [e(r.letE.type),e(r.letE.value),e(r.letE.body)];
    if("proj" in r)return [d(r.proj.typeName),e(r.proj.struct)];
    if("mdata" in r)return [e(r.mdata.expr)];
    if(["bvar","sort","natVal","strVal"].some(k=>k in r))return [];
    throw Error("unknown expression: "+Object.keys(r));
  }
  if(kind==="d" && "inductive" in r)return [["g",members(r)[0].name]];
  if(kind==="g"){
    const out=[];
    for(const m of members(r)){
      out.push(d(m.name),e(m.type));
      for(const id of [...(m.all||[]),...(m.ctors||[])])out.push(d(id));
      if("induct" in m)out.push(d(m.induct));
      for(const rule of m.rules||[])out.push(d(rule.ctor),e(rule.rhs));
    }
    return out;
  }
  if(kind!=="d")throw Error("unknown node kind "+kind);
  const k=declKind(r), m=r[k], out=[e(m.type)];
  if(["thm","opaque","def"].includes(k))out.push(e(m.value));
  for(const id of m.all||[])out.push(d(id));
  return out;
}

function makeSeen() {
  const chunks=new Map(), size=65536;
  return function(kind,id) {
    if(!Number.isSafeInteger(id)||id<0)throw Error("bad id "+id);
    const key=kind+":"+Math.floor(id/(size*8));
    let a=chunks.get(key);
    if(!a){a=new Uint8Array(size);chunks.set(key,a);}
    const bit=id%(size*8), i=Math.floor(bit/8), mask=1<<(bit%8);
    if(a[i]&mask)return true;
    a[i]|=mask;return false;
  };
}

function trace(read,roots,emit) {
  const seen=makeSeen(), stack=[], counts={e:0,d:0,g:0,edges:0,axioms:0};
  function add(k,id){if(!seen(k,id))stack.push([k,id]);}
  for(const id of roots)add("d",id);
  while(stack.length){
    const [k,id]=stack.pop(), r=read(k,id);
    if(!r)throw Error("missing "+k+":"+id);
    const es=edges(k,r);
    counts[k]++;counts.edges+=es.length;
    if(k==="d"&&"axiom" in r)counts.axioms++;
    emit(k,id,r,es);
    for(const [t,j] of es)add(t,j);
  }
  return counts;
}

function selftest() {
  const rows=[
    {ie:0,sort:0},{ie:1,const:{name:1,us:[]}},{ie:2,app:{fn:1,arg:1}},
    {ie:3,lam:{type:0,body:2}},{ie:4,forallE:{type:0,body:3}},
    {ie:5,letE:{type:0,value:4,body:2}},{ie:6,proj:{typeName:2,struct:5}},
    {ie:7,mdata:{expr:6,data:{}}},{ie:8,bvar:0},{ie:9,natVal:"1"},
    {ie:10,strVal:"x"},{ie:11,app:{fn:8,arg:9}},{ie:12,app:{fn:10,arg:11}},
    {axiom:{name:1,type:0}},
    {inductive:{types:[{name:2,type:0,all:[2],ctors:[3]}],ctors:[{name:3,type:0,induct:2}],recs:[{name:4,type:0,all:[2],rules:[{ctor:3,rhs:12}]}]}},
    {thm:{name:5,type:0,value:7,all:[5]}},{def:{name:6,type:0,value:1,all:[]}},
    {opaque:{name:7,type:0,value:1,all:[]}},{quot:{name:8,type:0}}
  ];
  const index=new Map();for(const r of rows)for(const [k,id] of entries(r))index.set(k+id,r);
  const out=[], read=(k,id)=>index.get(k+id);
  const result=trace(read,[5,7,8],(k,id)=>out.push(k+id));
  if(result.d!==7||result.e!==13||result.g!==1||result.axioms!==1||out.includes("d6")||out.length!==new Set(out).size)throw Error(JSON.stringify({result,out}));
  let rejected=0;
  for(const root of [99])try{trace(read,[root],()=>{})}catch(e){if(String(e).includes("missing"))rejected++;}
  try{edges("e",{ie:0,unknown:1})}catch(e){rejected++;}
  if(rejected!==2)throw Error("fail closed");
  let reads=0;
  const n=100000;
  const chain=trace((k,id)=>{reads++;return k==="d"?{thm:{name:1,type:0,value:n,all:[1]}}:id===0?{ie:0,sort:0}:{ie:id,app:{fn:id-1,arg:id-1}}},[1],()=>{});
  if(reads!==n+2||chain.e!==n+1)throw Error("duplicate expansion");
  return {fixture:result,negativeControls:rejected,sharedChain:{...chain,reads}};
}


/*
NDJSON 3.1.0 mixed expression/declaration graph index. Source:
https://github.com/leanprover/lean4export/blob/v4.33.0/format_ndjson.md
Actual RH archive: https://math.mit.edu/~drew/grh/solution.ndjson.zst
Unpacked SHA256: 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e
Download compressed file and verify SHA256, then zstd -d --long=30.
Run: node rh_export_graph.mjs selftest
     node rh_export_graph.mjs index solution.ndjson indexdir
     node rh_export_graph.mjs trace solution.ndjson indexdir riemannHypothesis > reachable.ndjson
Use an SSD with space for the source and direct-address index. Index scan is
linear in input bytes plus indexed IDs; traversal visits every reachable mixed
node once, with one fixed-offset lookup per node (group/member records may be
reread). Disk random I/O and JSON record parsing cost are not benchmarked.
This extracts explicit constant references and conservative inductive groups,
not a kernel checker, direct theorem-only DAG, or human proof.
Only format fixtures tested so far; actual archive and Node disk I/O untested.
*/
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
const expected='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e';
const kinds=['e','d','g','n'], width=12;
function slot(id){if(!Number.isSafeInteger(id)||id<0||!Number.isSafeInteger(id*width))throw Error('bad index');return id*width;}
function files(dir,mode){return Object.fromEntries(kinds.map(k=>[k,fs.openSync(path.join(dir,k+'.idx'),mode)]));}
function put(fd,id,off,len){const b=Buffer.allocUnsafe(width);b.writeBigUInt64LE(BigInt(off)+1n);b.writeUInt32LE(len,8);if(fs.writeSync(fd,b,0,width,slot(id))!==width)throw Error('short index write');}
function get(fd,id){const b=Buffer.alloc(width),n=fs.readSync(fd,b,0,width,slot(id));if(n===0)return null;if(n!==width)throw Error('truncated index');const v=b.readBigUInt64LE();return v===0n?null:[Number(v-1n),b.readUInt32LE(8)];}
async function index(src,dir){
  fs.mkdirSync(dir);const f=files(dir,'wx+'), hash=crypto.createHash('sha256');
  let off=0,carry=Buffer.alloc(0),meta=null,root=null,lines=0;
  function line(b,len){
    const r=JSON.parse(b.toString('utf8'));
    if(lines++===0){meta=r.meta;if(meta?.format?.version!=='3.1.0')throw Error('unsupported format');}
    for(const [k,id] of entries(r))put(f[k],id,off,len);
    if(r.str?.pre===0&&r.str.str==='riemannHypothesis')root=r.in;
    off+=len;
  }
  for await(const chunk of fs.createReadStream(src,{highWaterMark:1024*1024})){
    hash.update(chunk);const b=carry.length?Buffer.concat([carry,chunk]):chunk;let i=0,j;
    while((j=b.indexOf(10,i))>=0){line(b.subarray(i,j),j-i+1);i=j+1;}
    carry=b.subarray(i);
  }
  if(carry.length)line(carry,carry.length);
  const digest=hash.digest('hex');if(digest!==expected)throw Error('RH export hash mismatch: '+digest);
  if(root===null)throw Error('root not found');
  for(const fd of Object.values(f))fs.closeSync(fd);
  fs.writeFileSync(path.join(dir,'manifest.json'),JSON.stringify({digest,bytes:off,lines,root,meta,sourceStat:fs.statSync(src).mtimeMs}));
}
function runTrace(src,dir,root){
  const m=JSON.parse(fs.readFileSync(path.join(dir,'manifest.json'),'utf8'));
  const stat=fs.statSync(src);
  if(m.digest!==expected||stat.size!==m.bytes||stat.mtimeMs!==m.sourceStat)throw Error('source changed since indexing');
  const f=files(dir,'r'), fd=fs.openSync(src,'r');
  function read(k,id){const p=get(f[k],id);if(!p)return null;const [off,len]=p,b=Buffer.allocUnsafe(len);if(fs.readSync(fd,b,0,len,off)!==len)throw Error('short read');return JSON.parse(b.toString('utf8'));}
  function name(id){const a=[];while(id!==0){const r=read('n',id);if(!r)throw Error('missing name '+id);if(r.str){a.push(r.str.str);id=r.str.pre;}else if(r.num){a.push(String(r.num.i));id=r.num.pre;}else throw Error('invalid name');}return a.reverse().join('.');}
  const id=root==='riemannHypothesis'?m.root:Number(root);
  const counts=trace(read,[id],(k,id,r,es)=>{
    const o={k,id,edges:es};
    if(k==='d'){o.name=name(id);o.kind='inductive' in r?'inductive':declKind(r);}
    fs.writeSync(1,JSON.stringify(o)+'\n');
  });
  console.error(JSON.stringify(counts));for(const d of Object.values(f))fs.closeSync(d);fs.closeSync(fd);
}
const [mode,src,dir,root='riemannHypothesis']=process.argv.slice(2);
if(mode==='selftest')console.log(JSON.stringify(selftest()));
else if(mode==='index')await index(src,dir);
else if(mode==='trace')runTrace(src,dir,root);
else throw Error('use selftest, index or trace');
