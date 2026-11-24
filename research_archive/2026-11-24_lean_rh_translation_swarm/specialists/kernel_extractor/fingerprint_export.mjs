#!/usr/bin/env node
// Source-linked declaration fingerprints: OPEN, not RH kernel validation.
// Exact serialized-content identity for lean4export 3.0/3.1, not Lean definitional equality.
// IDs replaced by typed Merkle digests; per-declaration and complete exported group hashes.
// Dependency validity and complete closure must be established separately.
// Requires lossless integer fields or rejects unsafe JS numbers. Metadata normalization is exporter-specific.
// Read a small export only: in-memory reference implementation, not the 61 GB solution.
import fs from 'node:fs';
import {createHash} from 'node:crypto';
const digest=s=>createHash('sha256').update(s,'utf8').digest('hex');
function fingerprints(records, digest){
 const fail=m=>{throw Error(m)};
 const obj=(x)=>{if(!x||typeof x!=="object"||Array.isArray(x))fail("object required");return x};
 const fields=(x,ks)=>{obj(x);let a=Object.keys(x).sort().join("|");if(a!==ks.split(" ").sort().join("|"))fail("unexpected keys: "+a+" expected "+ks);return x};
 const nat=x=>{if(!Number.isSafeInteger(x)||x<0)fail("unsafe or negative numeric field");return x};
 const str=x=>{if(typeof x!=="string"||/[\uD800-\uDBFF](?![\uDC00-\uDFFF])|(?<![\uD800-\uDBFF])[\uDC00-\uDFFF]/u.test(x))fail("bad string");return x};
 const bool=x=>{if(typeof x!=="boolean")fail("bad boolean");return x};
 const arr=(x,f)=>{if(!Array.isArray(x))fail("array required");return x.map(f)};
 const one=(x,opts)=>{if(!opts.includes(x))fail("unknown enum "+x);return x};
 const H=(...p)=>digest(JSON.stringify(["cathedral-export-content-v1",...p]));
 const names=new Map([[0,{hash:H("anonymous"),label:""}]]),lev=new Map([[0,H("zero")]]),expr=new Map(),decl=new Map();
 const get=(m,i)=>{nat(i);if(!m.has(i))fail("unknown or forward index "+i);return m.get(i)};
 const put=(m,i,v)=>{nat(i);if(m.has(i))fail("duplicate index "+i);m.set(i,v)};
 const N=i=>get(names,i).hash,L=i=>get(lev,i),E=i=>get(expr,i),Ns=a=>arr(a,N);
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
 return {schema:"cathedral-export-content-v1",meta,rows,names:names.size-1,levels:lev.size-1,expressions:expr.size,declarations:[...decl.values()]};
}
function regression(actual, digest){
 const rows=actual.trim().split(/\r?\n/).map(JSON.parse), result=fingerprints(rows,digest);
 const root=r=>{let x=r.declarations.find(d=>d.display==="Nat.add_succ");if(!x)throw Error("root absent");return x.digest};
 const initial=root(result);let tests=0;
 const assert=(x,m)=>{if(!x)throw Error(m);tests++};
 assert(digest("")==="e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855","SHA empty");
 assert(digest("abc")==="ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad","SHA abc");
 const clone=x=>JSON.parse(JSON.stringify(x));
 let x=clone(rows);let t=x.find(r=>r.thm).thm[0];t.value=t.type;assert(root(fingerprints(x,digest))!==initial,"changed value not detected");
 x=clone(rows);let last=x.find(r=>r.ie===433);last.lam.binderInfo="implicit";assert(root(fingerprints(x,digest))!==initial,"binder changed");
 x=clone(rows);last=x.find(r=>r.ie===433);last.lam.name=103;assert(root(fingerprints(x,digest))!==initial,"binder name changed");
 x=clone(rows);x.find(r=>r.thm).thm[0].levelParams=[6];assert(root(fingerprints(x,digest))!==initial,"universe params changed");
 x=clone(rows).map(r=>Object.fromEntries(Object.entries(r).reverse()));assert(root(fingerprints(x,digest))===initial,"JSON field order changed digest");
 x=clone(rows);x.splice(1,0,{in:9999,str:{pre:0,str:"unused"}});assert(root(fingerprints(x,digest))===initial,"unrelated name changed digest");
 const rejects=f=>{let v=clone(rows);f(v);let b=false;try{fingerprints(v,digest)}catch{b=true}assert(b,"invalid export accepted")};
 rejects(x=>x.find(r=>r.ie===433).lam.extra="newField");
 rejects(x=>x.find(r=>r.ie===433).lam.body=999999);
 rejects(x=>x.push(x.find(r=>r.ie===433)));
 rejects(x=>x.find(r=>r.in===19).num.i=Number.MAX_SAFE_INTEGER+1);
 rejects(x=>x.find(r=>r.thm).thm[0].value=undefined);
 // A miniature valid-format 3.1 graph with unchanged names and constant set but changed literal.
 const mk=(ids,lit)=>[{meta:{exporter:{name:"lean4export",version:"3.1.0"},lean:{githash:"fixture",version:"fixture"},format:{version:"3.1.0"}}},
 {in:ids[0],str:{pre:0,str:"f"}},{in:ids[1],str:{pre:0,str:"Nat"}},
 {ie:ids[2],const:{name:ids[1],us:[]}},{ie:ids[3],natVal:lit},
 {def:{name:ids[0],levelParams:[],type:ids[2],value:ids[3],hints:"abbrev",safety:"safe",all:[ids[0]]}}];
 let u=fingerprints(mk([1,2,0,1],"1"),digest).declarations[0].digest;
 assert(u===fingerprints(mk([7,3,20,10],"1"),digest).declarations[0].digest,"ID renumbering failed");
 assert(u!==fingerprints(mk([1,2,0,1],"2"),digest).declarations[0].digest,"same refs changed literal undetected");
 return {tests,actual:{rows:result.rows,names:result.names,levels:result.levels,expressions:result.expressions,declarations:result.declarations.length,rootDigest:initial,meta:result.meta},scope:"content fingerprints only, not kernel check or transitive validity"};
}
const args=process.argv.slice(2);
if(!args.length)throw Error('usage: node fingerprint_export.mjs [--self-test] example.ndjson');
if(args[0]==='--self-test')console.log(JSON.stringify(regression(fs.readFileSync(args[1],'utf8'),digest),null,2));
else console.log(JSON.stringify(fingerprints(fs.readFileSync(args[0],'utf8').trim().split(/\\r?\\n/).map(JSON.parse),digest),null,2));
