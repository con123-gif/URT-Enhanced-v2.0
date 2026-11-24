// Run 17: exact four-blob union, no kernel replay.
import fs from 'node:fs';
import crypto from 'node:crypto';
import {performance} from 'node:perf_hooks';
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2"];
function audit(docs, clock=()=>Date.now()){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",N=1065214335,root=14065054,D="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";
 const ck=(ok,m)=>{if(!ok)throw Error(m);checks++};let checks=0;
 const J=JSON.stringify, owners=new Map(), tags=new Map(), rev=new Map(), edges=[],counts={type:0,value:0,structural:0,rhs:0}, batches=[];
 const nat=x=>Number.isSafeInteger(x)&&x>=0;
 function add(r,role,slot,e,k){ck(nat(e.target)&&Array.isArray(e.nameParts)&&e.nameParts.length>0&&e.nameParts.every(x=>typeof x==="string"||nat(x))&&typeof k==="string","identity");let tag=J([k,e.nameParts]);ck(!tags.has(e.target)||tags.get(e.target)===tag,"conflicting tagged identity");tags.set(e.target,tag);let row=[r.id,role,slot,e.target,J(e)];edges.push(row);counts[role]++;if(!rev.has(e.target))rev.set(e.target,[]);rev.get(e.target).push(r.id);}
 for(const d of docs){ck(d.digest===D&&d.n===N&&d.root===root&&d.bytes===61570595788&&d.indexedDeclarations===1484733&&d.meta.lean.githash==="819816b2e0a3bf405af45ae5c7af2491d8f5bee6"&&d.meta.format.version==="3.1.0"&&(!d.pin||d.pin===pin)&&d.status==="AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK","archive scope");const begin=edges.length;
 for(const r of d.reports){const q=r.request||r.source,s=r.encodedRootsAndStructuralEdges;ck(nat(r.id)&&!owners.has(r.id)&&q&&typeof q.name==="string"&&(q.id===undefined||q.id===r.id)&&(q.kind===undefined||q.kind===r.kind)&&r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK","owner");owners.set(r.id,r);let start=["thm","def"].includes(r.kind)?2:1;ck(s?s.length===start+(r.structural||[]).length:start===2&&!(r.structural||[]).length,"slots");
 function expr(role,slot,x){ck(x&&nat(x.expressionRoot)&&x.expressionRoot<N&&(!s||s[slot]===x.expressionRoot+1),"expression root");for(const e of x.references){ck(["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&nat(e.witnessExpression)&&e.witnessExpression<N&&nat(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"witness");add(r,role,slot,e,e.targetKind)}}
 expr("type",0,r.type);if(start===2)expr("value",1,r.value);else ck(r.value===null,"invented value");
 for(const [j,e] of (r.structural||[]).entries()){let i=start+j;ck(e.edgeIndex===i&&s[i]===e.encoded&&Number.isSafeInteger(e.encoded)&&e.encoded!==0,"slot");if(e.encoded>0){ck(r.kind==="rec"&&e.kind==="recursor_rule_rhs","RHS role");expr("rhs",i,e.expression)}else{ck(e.target===-e.encoded-1,"structural target");add(r,"structural",i,e,e.kind)}}
 }batches.push({owners:d.reports.length,edges:edges.length-begin})}
 for(const [id,r] of owners){if(tags.has(id))ck(JSON.parse(tags.get(id))[0]===r.kind,"owner kind")}
 // Independent role-occurrence enumeration and exact ordered comparison; duplicates retained.
 const direct=docs.flatMap(d=>d.reports).flatMap(r=>{let a=r.type.references.map(e=>[r.id,"type",0,e.target,J(e)]);if(r.value)a=a.concat(r.value.references.map(e=>[r.id,"value",1,e.target,J(e)]));for(const e of r.structural||[])a=a.concat(e.encoded>0?e.expression.references.map(x=>[r.id,"rhs",e.edgeIndex,x.target,J(x)]):[[r.id,"structural",e.edgeIndex,e.target,J(e)]]);return a});
 ck(direct.length===edges.length,"occurrence count");for(let i=0;i<direct.length;i++)ck(J(direct[i])===J(edges[i]),"occurrence mismatch");
 const seeds=[...rev.keys()].sort((a,b)=>rev.get(b).length-rev.get(a).length||a-b).slice(0,15);
 const walk=ss=>{const seen=new Set(ss),q=[...seen];for(let i=0;i<q.length;i++)for(const x of rev.get(q[i])||[])if(!seen.has(x)){seen.add(x);q.push(x)}return seen};
 const truth=new Set(seeds);let changed=true;while(changed){changed=false;for(const [o,,,t] of direct)if(truth.has(t)&&!truth.has(o)){truth.add(o);changed=true}}
 const eq=s=>s.size===truth.size&&[...s].every(x=>truth.has(x));
 const modes={independent:()=>new Set(seeds.flatMap(x=>[...walk([x])])),shared:()=>walk(seeds),golden:()=>walk([...seeds].sort((a,b)=>(a*2/(3+Math.sqrt(5)))%1-(b*2/(3+Math.sqrt(5)))%1)),periodic:()=>walk([...seeds].sort((a,b)=>a%24-b%24||a-b))};
 let benchmark={};for(const [k,f] of Object.entries(modes)){let t=clock();ck(eq(f()),"first closure");let first=clock()-t;const samples=[];for(let j=0;j<3;j++){t=clock();for(let i=0;i<100;i++)ck(eq(f()),"warm closure");samples.push((clock()-t)/100)}benchmark[k]={first_ms:first,warm_ms:samples}}
 let reached= new Set([root]), q=[root], adj=new Map();for(const [o,,,t] of edges){if(!adj.has(o))adj.set(o,[]);adj.get(o).push(t)}for(let i=0;i<q.length;i++)for(const t of adj.get(q[i])||[])if(!reached.has(t)){reached.add(t);q.push(t)}
 return {status:"PARTIAL_EXPORTED_ROLE_EVIDENCE_NOT_KERNEL_RECHECK",batches,owners:owners.size,edges:edges.length,counts,taggedTargets:tags.size,observedRootReach:reached.size,expandedRootReach:[...owners.keys()].filter(x=>reached.has(x)).length,seeds,reverseReach:truth.size,checks,missedSuppliedEdges:0,benchmark}
}
const paths=process.argv.slice(2);if(paths.length!==4)throw Error('four report paths required');const docs=paths.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==hashes[i])throw Error('blob mismatch '+p);return JSON.parse(b)});const result=audit(docs,()=>performance.now());let negative=0;for(const [o,k,v] of [[docs[0],'digest','x'],[docs[1].reports[0],'id',-1],[docs[3].reports[0].type,'expressionRoot',-1],[docs[2].reports[0].value.references[0],'witnessExpression',-1]]){let old=o[k];o[k]=v;try{audit(docs)}catch(e){negative++}o[k]=old}if(negative!==4)throw Error('negative failed');console.log(JSON.stringify({...result,negative,peakRssKiB:process.resourceUsage().maxRSS},null,2));
