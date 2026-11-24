// Official legacy export fixture adapter for scheduling checks only.
export function actualFixture(data,traverse){
 const need=(x,m)=>{if(!x)throw Error(m)}, modes=['stack','block','golden','periodic','descending'];
 const es=new Map(),ds=new Map(),names=new Map([[0,[]]]);
 const E=i=>{need(Number.isInteger(i)&&i>=0&&i<2147483647,'invalid expr id');return i+1};
 const D=i=>-E(i); let meta=null,lines=0;
 for(const line of data.trimEnd().split(/\r?\n/)){
   const r=JSON.parse(line);lines++;
   if(r.meta){need(!meta&&r.meta.format.version==='3.0.0','format');meta=r.meta;continue}
   if(Object.hasOwn(r,'in')){const n=r.str||r.num;need(n&&names.has(n.pre)&&!names.has(r.in),'name');names.set(r.in,[...names.get(n.pre),r.str?n.str:n.i]);continue}
   if(Object.hasOwn(r,'il'))continue;
   if(Object.hasOwn(r,'ie')){need(!es.has(r.ie),'duplicate expression');es.set(r.ie,r);continue}
   const k=Object.keys(r)[0];let ms=[];
   if(k==='inductive'){for(const [f,t] of [['inductiveVals','inductive'],['constructorVals','ctor'],['recursorVals','rec']])for(const m of r[k][f])ms.push([t,m]);}
   else{need(['def','thm','opaque','axiom','quot'].includes(k),'unknown declaration');ms=r[k].map(m=>[k,m]);}
   need(ms.length,'empty group');for(const [kind,m] of ms){need(!ds.has(m.name),'duplicate declaration');const refs=[E(m.type),...(m.all||[]).map(D),...(m.ctors||[]).map(D)];if(['def','thm','opaque'].includes(kind))refs.push(E(m.value));if(m.induct!==undefined)refs.push(D(m.induct));for(const rr of m.rules||[])refs.push(D(rr.ctor),E(rr.rhs));if(ms.length>1){if(m.name===ms[0][1].name)refs.push(...ms.slice(1).map(x=>D(x[1].name)));else refs.push(D(ms[0][1].name))}ds.set(m.name,{edges:refs});}
 }
 need(meta,'no meta');const byName=p=>[...names].find(([_,a])=>JSON.stringify(a)===JSON.stringify(p))?.[0];
 const expr=new Map();
 for(const [i,r] of es){const k=Object.keys(r).filter(x=>x!=='ie');need(k.length===1,'ambiguous expr');const a=r[k[0]];let refs=[];
 switch(k[0]){case 'const':refs=[D(a.name)];break;case 'app':refs=[E(a.fn),E(a.arg)];break;case 'lam':case 'forallE':refs=[E(a.type),E(a.body)];break;case 'letE':refs=[E(a.type),E(a.value),E(a.body)];break;case 'proj':refs=[D(a.typeName),E(a.struct)];break;case 'mdata':refs=[E(a.expr)];break;case 'natVal':refs=[D(byName(['Nat']))];break;case 'strVal':refs=[D(byName(['Char','ofNat'])),D(byName(['String','ofList']))];break;case 'sort':case 'bvar':break;default:throw Error('unknown expr '+k);}
 expr.set(i,refs);}
 let checks=0,rootResult=null;const root=byName(['Nat','add_succ']);
 for(const id of ds.keys()){
   const q=[D(id)],seen=new Set(q);let edgeCount=0;
   for(let j=0;j<q.length;j++){const r=q[j],i=Math.abs(r)-1,refs=r>0?expr.get(i):ds.get(i)?.edges;need(refs,'missing fixture reference');for(const ref of refs){edgeCount++;if(!seen.has(ref)){seen.add(ref);q.push(ref)}}}
   for(const mode of modes){const got=new Set();const counts=traverse([id],i=>expr.get(i),i=>ds.get(i),r=>{need(!got.has(r),'double visit');got.add(r)},mode,8);need(got.size===seen.size&&[...got].every(r=>seen.has(r))&&counts.edges===edgeCount,'fixture closure mismatch');checks++;if(id===root&&mode==='descending')rootResult=counts}
 }
 need(rootResult,'root missing');return {lines,expressions:expr.size,declarations:ds.size,checks,rootResult};
}

import fs from 'node:fs';
import {createHash} from 'node:crypto';
import {traverse} from './block_frontier.mjs';
const b=fs.readFileSync(process.argv[2]);
if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!=='d3cd35f1313b4e78b5fded9886e450112aa75def')throw Error('fixture blob mismatch');
console.log(JSON.stringify(actualFixture(b.toString('utf8'),traverse)));
