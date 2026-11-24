// Run 10. One-pass multi-lane declaration manifest lookup, not kernel checking.
const PIN='40e56bab026552e089d7afcfeff08d2defb9c005';
const MANIFEST={
 solution:{sha:'45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf',bytes:38823812,rows:1484705,names:14065150,expr:1065214335,root:14065054,archive:'5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'},
 challenge:{sha:'0cf670099286ae98715f17a659c3db76257ea31373ecbbbca6e3ea2d6fdc2b26',bytes:1356147,rows:53242,names:329321,expr:6112241,root:326835,archive:'bd484ac9886a96f26b1d9a7a59ebd45b7a70d102c015d4f31f9302bbdd6ab2b9'}
};
const need=(v,m)=>{if(!v)throw Error(m)};
const integer=(v,max)=>Number.isSafeInteger(v)&&v>=0&&v<=max;
const parts=a=>Array.isArray(a)&&a.length>0&&a.every(x=>typeof x==='string'||integer(x,Number.MAX_SAFE_INTEGER));
const key=JSON.stringify;
function validateQuery(q){
 need(q&&typeof q.id==='string'&&q.id.length>0,'request ID');
 need(q.kind==='exact'?parts(q.name):q.kind==='display'&&typeof q.name==='string'&&q.name.length>0,'request name');
}
function selector(queries,meta,mode='shared'){
 need(Array.isArray(queries)&&queries.length>0,'requests');
 const ids=new Set(),exact=new Map(),display=new Map(),out=queries.map(q=>({request:q,candidates:[]}));
 let order=queries.map((_,i)=>i);
 if(mode==='golden'||mode==='periodic'){
  const angle=mode==='golden'?2*Math.PI/((1+Math.sqrt(5))/2)**2:2*Math.PI/24;
  const phase=order.map(i=>Math.cos(angle*(i+1))*Math.PI/Math.E);
  order.sort((a,b)=>phase[b]-phase[a]||a-b);
 }else need(mode==='shared','mode');
 for(const i of order){
  const q=queries[i];validateQuery(q);need(!ids.has(q.id),'duplicate request ID');ids.add(q.id);
  const m=q.kind==='exact'?exact:display,k=q.kind==='exact'?key(q.name):q.name;
  if(!m.has(k))m.set(k,[]);m.get(k).push(i);
 }
 const seen=new Uint8Array(Math.ceil((meta.names+1)/8)),selectedNames=new Map();
 let rows=0,refs=0,metaRefs=0,matchedRows=0,candidateLinks=0,rootSeen=false;
 function feed(line){
  const r=typeof line==='string'?JSON.parse(line):line;
  need(integer(r.id,meta.names)&&parts(r.nameParts)&&typeof r.kind==='string'&&r.kind.length>0,'declaration row');
  const i=r.id>>3,b=1<<(r.id&7);need(!(seen[i]&b),'duplicate declaration ID');seen[i]|=b;
  need(Array.isArray(r.refs)&&r.refs.every(q=>Number.isSafeInteger(q)&&q!==0&&(q>0?q<=meta.expr:-q-1<=meta.names)),'hard reference range');
  need(Array.isArray(r.mutualBlock)&&r.mutualBlock.every(m=>integer(m.id,meta.names)&&parts(m.nameParts)&&typeof m.exported==='boolean'),'metadata reference');
  rows++;refs+=r.refs.length;metaRefs+=r.mutualBlock.length;if(r.id===meta.root)rootSeen=true;
  const a=exact.get(key(r.nameParts))||[],d=display.get(r.nameParts.join('.'))||[];
  if(a.length||d.length){
   const k=key(r.nameParts);need(!selectedNames.has(k),'duplicate selected tagged declaration');selectedNames.set(k,r.id);
   matchedRows++;candidateLinks+=a.length+d.length;
   for(const j of a)out[j].candidates.push(r);for(const j of d)out[j].candidates.push(r);
  }
 }
 function finish(){
  need(rows===meta.rows&&rootSeen,'manifest row/root census');
  return {results:out.map(x=>({...x,status:x.candidates.length===0?'NOT_FOUND':x.request.kind==='display'?(x.candidates.length===1?'DISPLAY_CANDIDATE_ONLY':'AMBIGUOUS_DISPLAY'):'EXACT_TAGGED_NAME_PRESENT'})),stats:{rows,refs,metaRefs,matchedRows,candidateLinks,bitmapBytes:seen.byteLength}};
 }
 return {feed,finish};
}
function run(lines,queries,meta,mode='shared'){
 if(mode==='baseline'){
  let results=[],rows=0,refs=0,metaRefs=0,candidateLinks=0;
  for(const q of queries){const r=run(lines,[q],meta);results.push(...r.results);rows+=r.stats.rows;refs+=r.stats.refs;metaRefs+=r.stats.metaRefs;candidateLinks+=r.stats.candidateLinks}
  return {results,stats:{rows,refs,metaRefs,candidateLinks,bitmapBytes:Math.ceil((meta.names+1)/8)}};
 }
 const s=selector(queries,meta,mode);for(const l of lines)s.feed(l);return s.finish();
}
// Actual lean4export 3.0 fixture: translate raw declaration rows to manifest shape.
// This test adapter is not a general exporter or expression dependency extractor.
function fixtureRows(raw){
 const names=[[]],ds=[],lines=raw.trimEnd().split('\n').map(JSON.parse);
 for(const r of lines)if('in'in r){const a=r.str||r.num;need(r.in===names.length&&a.pre<r.in,'name order');names.push([...names[a.pre],r.str?a.str:a.i])}
 const put=(v,k,struct=[])=>ds.push({id:v.name,nameParts:names[v.name],kind:k,refs:[v.type+1,...('value'in v?[v.value+1]:[]),...struct],mutualBlock:['def','thm','opaque'].includes(k)?(v.all||[]).map(id=>({id,nameParts:names[id],exported:true})):[]});
 for(const r of lines){
  for(const k of ['def','thm','opaque','axiom'])if(r[k])for(const v of Array.isArray(r[k])?r[k]:[r[k]])put(v,k);
  if(r.inductive){const d=r.inductive;for(const v of d.inductiveVals)put(v,'inductive',[...v.all,...v.ctors].map(x=>-x-1));for(const v of d.constructorVals)put(v,'constructor',[-v.induct-1]);for(const v of d.recursorVals)put(v,'recursor',[...v.all.map(x=>-x-1),...v.rules.flatMap(x=>[-x.ctor-1,x.rhs+1])])}
 }
 need(ds.length===32,'fixture declarations');
 return {rows:ds.map(key),meta:{rows:ds.length,names:names.length-1,expr:lines.filter(x=>'ie'in x).length,root:102}};
}
function certificate(raw,n=100000){
 let checks=0,negative=0;const ck=(x,m)=>{need(x,m);checks++},reject=f=>{let b=false;try{f()}catch{b=true}ck(b,'negative accepted');negative++};
 const f=fixtureRows(raw),all=f.rows.map(JSON.parse),qs=all.map((r,i)=>({id:'f'+i,kind:'exact',name:r.nameParts}));
 qs.push({id:'absent',kind:'exact',name:['not_a_real_decl']},{id:'display',kind:'display',name:'Nat.add_succ'});
 const a=run(f.rows,qs,f.meta,'baseline');
 for(const mode of ['shared','golden','periodic'])ck(key(run(f.rows,qs,f.meta,mode).results)===key(a.results),'fixture results');
 for(let i=0;i<all.length;i++)ck(key(a.results[i].candidates)===key([all[i]]),'fixture full row preserved');
 ck(a.results.at(-2).status==='NOT_FOUND'&&a.results.at(-1).status==='DISPLAY_CANDIDATE_ONLY','fixture query semantics');
 const collision=[['A',1],['A','1'],['A.1']].map((nameParts,id)=>({id,nameParts,kind:'thm',refs:[1,-1,1],mutualBlock:[{id:9,nameParts:['missing'],exported:false}]}));
 const cm={rows:3,names:9,expr:1,root:0},cq=[{id:'exact',kind:'exact',name:['A',1]},{id:'display',kind:'display',name:'A.1'}];
 const c=run(collision,cq,cm);ck(c.results[0].candidates.length===1&&c.results[1].candidates.length===3&&c.results[1].status==='AMBIGUOUS_DISPLAY','tag ambiguity');ck(c.stats.refs===9&&c.stats.metaRefs===3,'multiplicity');
 reject(()=>run([...collision,collision[0]],cq,{...cm,rows:4}));
 reject(()=>run(collision.map((r,i)=>i===1?{...r,nameParts:collision[0].nameParts}:r),cq,cm));
 reject(()=>run(collision.map((r,i)=>i===1?{...r,refs:[99]}:r),cq,cm));
 reject(()=>run(collision.slice(1),cq,{...cm,rows:2}));
 reject(()=>run(collision,[cq[0],cq[0]],cm));
 reject(()=>run(collision,cq,{...cm,rows:4}));
 const data=Array.from({length:n},(_,id)=>key({id,nameParts:['Synthetic','d',id],kind:'thm',refs:[1,id?-(id-1)-1:-1],mutualBlock:[]}));
 const meta={rows:n,names:n-1,expr:1,root:n-1};
 const q=Array.from({length:15},(_,i)=>({id:'lane'+i,kind:'exact',name:['Synthetic','d',Math.floor(i*(n-1)/14)]}));
 const timings={},base=run(data,q,meta,'baseline');
 for(const mode of ['baseline','shared','golden','periodic']){
  const times=[];let r;for(let j=0;j<3;j++){const t=Date.now();r=run(data,q,meta,mode);times.push(Date.now()-t);ck(key(r.results)===key(base.results),'benchmark agreement')}
  const ordered=times.slice().sort((a,b)=>a-b);timings[mode]={firstMs:times[0],subsequentMs:times.slice(1),medianMs:ordered[1],...r.stats};
 }
 return {checks,negative,fixture:{declarations:f.meta.rows,expressions:f.meta.expr,queries:qs.length},n,lanes:q.length,timings,limits:'Synthetic rows preallocated; V8 elapsed wall time, no measured RSS here; repeated application scans, no OS cache claim.'};
}

import fs from 'node:fs';
import {createHash} from 'node:crypto';
import {spawn} from 'node:child_process';
import {createInterface} from 'node:readline';
import {once} from 'node:events';
import {performance} from 'node:perf_hooks';
async function digestFile(file){
 const h=createHash('sha256');let bytes=0;for await(const b of fs.createReadStream(file)){h.update(b);bytes+=b.length}return {sha:h.digest('hex'),bytes};
}
async function scan(file,queries,meta,mode){
 const s=selector(queries,meta,mode),p=spawn('zstd',['-dc','--',file],{stdio:['ignore','pipe','inherit']});
 const exited=once(p,'close');exited.catch(()=>{}); // attach immediately; await below
 try{for await(const line of createInterface({input:p.stdout,crlfDelay:Infinity}))s.feed(line);const [status]=await exited;need(status===0,'zstd failed');return s.finish()}
 catch(e){p.kill();await exited.catch(()=>{});throw e}
}
async function main(){
 const [cmd,...args]=process.argv.slice(2);
 if(cmd==='test'){
  const b=fs.readFileSync(args[0]);need(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')==='d3cd35f1313b4e78b5fded9886e450112aa75def','fixture Git blob');
  console.log(JSON.stringify({...certificate(b.toString('utf8'),args[1]?Number(args[1]):100000),maxRssKiB:process.resourceUsage().maxRSS},null,2));return;
 }
 need(cmd==='query'&&args.length===4,'query solution|challenge MANIFEST.zst REQUESTS.json OUTPUT.json');
 const [kind,file,requestFile,output]=args,meta=MANIFEST[kind];need(meta&&!fs.existsSync(output),'manifest kind/output');
 const q=JSON.parse(fs.readFileSync(requestFile,'utf8'));need(q.pin===PIN&&Array.isArray(q.queries),'source pin');
 const t=performance.now(),d=await digestFile(file);need(d.sha===meta.sha&&d.bytes===meta.bytes,'compressed manifest identity');const verifyMs=performance.now()-t;
 const t2=performance.now(),r=await scan(file,q.queries,meta,'shared'),scanMs=performance.now()-t2;
 // Recheck same file bytes to detect accidental mutation during decode; assumes trusted local host.
 const d2=await digestFile(file);need(d2.sha===d.sha&&d2.bytes===d.bytes,'manifest changed during scan');
 const result={status:'AUTHENTICATED_NAMED_MANIFEST_MEMBERSHIP_NOT_SOURCE_EXPORT_EQUIVALENCE',pin:PIN,manifest:meta,verifyMs,scanMs,maxRssKiB:process.resourceUsage().maxRSS,...r};
 fs.writeFileSync(output,JSON.stringify(result,null,2)+'\n',{flag:'wx'});console.log(JSON.stringify({verifyMs,scanMs,stats:r.stats,maxRssKiB:result.maxRssKiB}));
}
await main();
