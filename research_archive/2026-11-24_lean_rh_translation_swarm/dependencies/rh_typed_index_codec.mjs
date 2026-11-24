/*
RH dependencies lane 2026-11-24 10:12 UTC. RESULT PARTIAL, executed dependency-index codec.
Pinned RH source 40e56bab026552e089d7afcfeff08d2defb9c005. Current observed upstream 73958da58a8a4d1f61b789745c5444baf6247cae; pinned src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc vs latest 67c65badc15f80a1db65df1c84dc7a4928fc410f. Latest root uses Claim.zeta LFunction_ne_zero_of_half_lt_re; pinned uses rhOfAll. Never mix.
Precommit Cathedral branch 52588523e385aba44c1973eefa3060df9d1137a8. Read protocol, AGENTS, state/log/protocol, continuity, handoff and peer checkpoints. Previous actual projection fixture ccefc7376b8201061060adf09452ab7a61ab9cac. This is its next storage layer, not repeated projection.
Prior signed three-slot stream index discards expression kind; direct reference classification cannot be recovered from it. New fixed 4 x uint32 record stores opcode and up to three IDs. This is lossless for dependency edges and classification only; raw export remains mandatory for exact hypotheses, levels, binder data, literal values and proof terms. It is NOT a proof-term serializer, verifier, or kernel replay.
IDs 0..2^32-1; strict sequential IDs and backward children (verified on actual fixture, full RH not yet tested). Little-endian disk implementation not yet written; typed arrays here are in-memory reference model. Literal primitive names resolved later by exact tagged-name table. Axioms, declaration/group metadata and names remain in separate tables. No proof dependency dropped by this codec relative to supported dependency schema.
Actual fixture leanprover/lean4export @ 15f6055e299ad5b89345e533cc2192f4cc00f659, examples/Nat.add_succ.ndjson blob d3cd35f1313b4e78b5fded9886e450112aa75def, format 3.0.0; 3.1.0 expression shapes from https://github.com/leanprover/lean4export/blob/v4.33.0/format_ndjson.md. All 11 kinds tested, absent fixture forms synthetic, not proof claims. Tests executed in V8 on connector-fetched actual fixture. Node CLI below verifies blob SHA before replay; not run in this session. Linear encode and read scan (fixed fields) O(N); typed storage exactly 16N bytes plus page rounding, actual process RSS not measured. Timing is unisolated V8 wall clock, not URT speedup.
Corrected stream retry and native Lean fixture v2 status absent (404); first actual challenge stopped only at byte-count mismatch (350862311, digest matched). Local git and MIT DNS failed, Lean absent. Prior physical CI PASS 45366981032 at 7bc49a7 is unrelated.
RESUME HERE: check corrected retry status; adapt this codec to a little-endian disk block store (bounded cache), and integrate with direct projection for the pinned RH root, preserving raw authenticated evidence and declaration metadata. Do not repeat actual fixture projection or launch duplicate archive fetches.
HANDOFF TO: kernel extraction, integration, audit.
Observed:
{
  "checks": 451,
  "negativeControls": 9,
  "actual": {
    "records": 434,
    "payloadBytes": 6944,
    "allocatedBytes": 7168,
    "pages": 7,
    "references": 45,
    "edges": 746,
    "rawCharacters": 32434
  },
  "allExpressionKinds": 11,
  "scaling": [
    {
      "records": 50000,
      "payloadBytes": 800000,
      "allocatedBytes": 851968,
      "pages": 13,
      "edges": 99998,
      "buildMs": 36,
      "scanMs": 30
    },
    {
      "records": 100000,
      "payloadBytes": 1600000,
      "allocatedBytes": 1638400,
      "pages": 25,
      "edges": 199998,
      "buildMs": 70,
      "scanMs": 59
    },
    {
      "records": 200000,
      "payloadBytes": 3200000,
      "allocatedBytes": 3211264,
      "pages": 49,
      "edges": 399998,
      "buildMs": 160,
      "scanMs": 116
    },
    {
      "records": 400000,
      "payloadBytes": 6400000,
      "allocatedBytes": 6422528,
      "pages": 98,
      "edges": 799998,
      "buildMs": 292,
      "scanMs": 235
    }
  ]
}
*/
import fs from 'node:fs';
import {createHash} from 'node:crypto';
const kinds=["bvar","sort","const","app","lam","forallE","letE","proj","natVal","strVal","mdata"];
function u32(x){if(!Number.isInteger(x)||x<0||x>0xffffffff)throw Error("invalid uint32 "+x);return x}

function pack(r,expected){
 if(r.ie!==expected)throw Error("nonsequential expression");
 const ks=Object.keys(r).filter(k=>k!=="ie");
 if(ks.length!==1||!kinds.includes(ks[0]))throw Error("unknown expression kind");
 const k=ks[0],v=r[k],a=[kinds.indexOf(k)+1,0,0,0];
 const child=(x)=>{u32(x);if(x>=expected)throw Error("forward/self expression reference");return x};
 switch(k){
 case "const":a[1]=u32(v.name);break;
 case "app":a[1]=child(v.fn);a[2]=child(v.arg);break;
 case "lam":case "forallE":a[1]=child(v.type);a[2]=child(v.body);break;
 case "letE":a[1]=child(v.type);a[2]=child(v.value);a[3]=child(v.body);break;
 case "proj":a[1]=u32(v.typeName);a[2]=child(v.struct);break;
 case "mdata":a[1]=child(v.expr);break;
 case "bvar":case "sort":u32(v);break;
 case "natVal":if(typeof v!=="string"||!/^[0-9]+$/.test(v))throw Error("bad nat literal");break;
 case "strVal":if(typeof v!=="string")throw Error("bad string literal");break;
 }return a;
}

function unpack(a,id){
 if(a.length!==4)throw Error("record width");
 const k=kinds[a[0]-1];if(!k)throw Error("bad opcode");
 const p=(...ix)=>ix.map(i=>{const x=u32(a[i]);if(x>=id)throw Error("bad packed child");return x});
 let children=[],refs=[];
 switch(k){
 case "const":refs=[["explicit_const",u32(a[1])]];break;
 case "app":case "lam":case "forallE":children=p(1,2);break;
 case "letE":children=p(1,2,3);break;
 case "proj":refs=[["projection_carrier",u32(a[1])]];children=p(2);break;
 case "mdata":children=p(1);break;
 case "natVal":refs=[["literal_primitive","Nat"]];break;
 case "strVal":refs=[["literal_primitive","Char.ofNat"],["literal_primitive","String.ofList"]];break;
 }return {kind:k,children,refs};
}

function index(pageRows=65536){
 if(!Number.isInteger(pageRows)||pageRows<1)throw Error("pageRows");
 const pages=[];let n=0;
 return {append(r){const a=pack(r,n),p=Math.floor(n/pageRows),i=(n%pageRows)*4;if(!pages[p])pages[p]=new Uint32Array(pageRows*4);pages[p].set(a,i);n++},
 read(id){u32(id);if(id>=n)throw Error("missing expression");const p=Math.floor(id/pageRows),i=(id%pageRows)*4;return unpack(pages[p].subarray(i,i+4),id)},
 stats(){return {records:n,payloadBytes:n*16,allocatedBytes:pages.length*pageRows*16,pages:pages.length}}}
}

function oracle(r){
 const [k]=Object.keys(r).filter(x=>x!=="ie"),v=r[k];
 const children={app:()=>[v.fn,v.arg],lam:()=>[v.type,v.body],forallE:()=>[v.type,v.body],letE:()=>[v.type,v.value,v.body],proj:()=>[v.struct],mdata:()=>[v.expr]};
 const refs={const:()=>[["explicit_const",v.name]],proj:()=>[["projection_carrier",v.typeName]],natVal:()=>[["literal_primitive","Nat"]],strVal:()=>[["literal_primitive","Char.ofNat"],["literal_primitive","String.ofList"]]};
 return {kind:k,children:children[k]?.()||[],refs:refs[k]?.()||[]};
}

function tests(raw){
 let checks=0;const eq=(a,b)=>{if(JSON.stringify(a)!==JSON.stringify(b))throw Error("mismatch "+JSON.stringify([a,b]));checks++};
 const rows=raw.trimEnd().split(/\r?\n/).map(JSON.parse),expr=rows.filter(r=>Object.hasOwn(r,"ie"));eq(rows[0].meta.format.version,"3.0.0");
 const ix=index(64);for(const r of expr)ix.append(r);let references=0,edges=0;for(const r of expr){const a=ix.read(r.ie),b=oracle(r);eq(a,b);references+=a.refs.length;edges+=a.children.length}
 const synthetic=[{ie:0,sort:0},{ie:1,bvar:0},{ie:2,const:{name:0xffffffff,us:[]}},{ie:3,app:{fn:0,arg:2}},{ie:4,lam:{type:0,body:1}},{ie:5,forallE:{type:0,body:4}},{ie:6,letE:{type:0,value:2,body:5}},{ie:7,proj:{typeName:42,struct:6}},{ie:8,natVal:"123"},{ie:9,strVal:"x"},{ie:10,mdata:{expr:7,data:{}}}];
 const j=index(3);for(const r of synthetic)j.append(r);for(const r of synthetic)eq(j.read(r.ie),oracle(r));
 let rejected=0;for(const f of [()=>pack({ie:0,app:{fn:0,arg:0}},0),()=>pack({ie:1,sort:0},0),()=>pack({ie:0,unknown:0},0),()=>pack({ie:0,const:{name:4294967296}},0),()=>pack({ie:0,sort:0,bvar:0},0),()=>ix.read(expr.length),()=>unpack([255,0,0,0],1),()=>unpack([4,1,0,0],1),()=>pack({ie:0,natVal:"x"},0)]){try{f()}catch(e){rejected++}}eq(rejected,9);
 const scaling=[];for(const n of [50000,100000,200000,400000]){const k=index(4096),t=Date.now();k.append({ie:0,const:{name:1,us:[]}});for(let i=1;i<n;i++)k.append({ie:i,app:{fn:i-1,arg:i-1}});const buildMs=Date.now()-t,t2=Date.now();let ec=0;for(let i=0;i<n;i++)ec+=k.read(i).children.length;const scanMs=Date.now()-t2;eq(ec,2*(n-1));scaling.push({...k.stats(),edges:ec,buildMs,scanMs})}
 return {checks,negativeControls:rejected,actual:{...ix.stats(),references,edges,rawCharacters:raw.length},allExpressionKinds:synthetic.length,scaling};
}
export {pack,unpack,index,tests};
if(process.argv[1] && import.meta.url===new URL('file://'+process.argv[1]).href){const b=fs.readFileSync(process.argv[2]);if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!=='d3cd35f1313b4e78b5fded9886e450112aa75def')throw Error('fixture blob mismatch');console.log(JSON.stringify(tests(b.toString('utf8')),null,2));}
