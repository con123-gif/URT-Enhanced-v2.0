import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import {performance} from 'node:perf_hooks';
import {createHash} from 'node:crypto';
import {traverse} from './block_frontier.mjs';
const need=(ok,msg)=>{if(!ok)throw Error(msg)};
const modes=['stack','block','golden','periodic','descending'];
function oracle(roots,expr,decl){const q=roots.map(x=>-(x+1)),seen=new Set(q);let edges=0;for(let i=0;i<q.length;i++){const r=q[i],v=(r>0?expr:decl)[Math.abs(r)-1];need(v,'oracle missing');for(const s of v){if(!s)continue;edges++;if(!seen.has(s)){seen.add(s);q.push(s)}}}return {seen,edges}}
function fixture(expr,decl,roots){const want=oracle(roots,expr,decl);let checks=0;for(const m of modes){const got=new Set();const c=traverse(roots,i=>expr[i],i=>decl[i]&&{edges:decl[i]},r=>{need(!got.has(r),'duplicate visit');got.add(r)},m,4);need(got.size===want.seen.size&&[...got].every(x=>want.seen.has(x))&&c.edges===want.edges,'closure mismatch '+m);checks++}return checks}
function selftest(){let checks=0;for(let seed=1;seed<=100;seed++){let s=seed;const rand=n=>{s=(Math.imul(s,1664525)+1013904223)>>>0;return s%n};const ref=()=>rand(3)?rand(80)+1:-(rand(20)+1);const expr=Array.from({length:80},()=>Array.from({length:rand(4)},ref)),decl=Array.from({length:20},()=>Array.from({length:rand(8)},ref));checks+=fixture(expr,decl,[0,4,19])}checks+=fixture([],[],[]);for(const f of [()=>traverse([0],()=>[],()=>null),()=>traverse([0],()=>[],()=>({edges:[2147483648]})),()=>traverse([-1],()=>[],()=>({edges:[]})),()=>traverse([0],()=>[],()=>({edges:[1.5]})),()=>traverse([0],()=>[],()=>({edges:[NaN]}))]){let bad=false;try{f()}catch{bad=true}need(bad,'negative accepted');checks++}return {checks}}
// 12-byte signed-reference disk records, same layout as dependency lane.
// Wide synthetic DAG: each expression points to earlier records only.
const N=262144,B=1024,C=8;
function prepare(dir,shape){fs.mkdirSync(dir,{recursive:true});const fd=fs.openSync(path.join(dir,shape),'w'),buf=Buffer.alloc(B*12);for(let i=0;i<N;i++){let a=0,b=0,c=0;if(shape==='cross'){if(i>=N/2){a=i>N/2?i:0;b=1+((Math.imul(i,2654435761)>>>0)%(N/2))}}else if(i){a=i; if(shape==='spread'){b=1+(Math.imul(i,2654435761)>>>0)%i;c=1+(Math.imul(i,2246822519)>>>0)%i}}let j=i%B*12;buf.writeInt32LE(a,j);buf.writeInt32LE(b,j+4);buf.writeInt32LE(c,j+8);if(i%B===B-1)need(fs.writeSync(fd,buf)===buf.length,'short write')}fs.closeSync(fd)}
function bench(dir,shape,mode){const fd=fs.openSync(path.join(dir,shape),'r');const cache=new Map();let reads=0,hits=0;const roots=[0];const decl={edges:[N]};const visited=Buffer.alloc(N/8);function get(i){if(i<0||i>=N)return null;const k=Math.floor(i/B),j=i%B*12;let b=cache.get(k);if(b){cache.delete(k);hits++}else{b=Buffer.allocUnsafe(B*12);need(fs.readSync(fd,b,0,b.length,k*b.length)===b.length,'short read');reads++}cache.set(k,b);if(cache.size>C)cache.delete(cache.keys().next().value);return [b.readInt32LE(j),b.readInt32LE(j+4),b.readInt32LE(j+8)]}const t=performance.now();let c;try{c=traverse(roots,get,i=>i===0?decl:null,(r,i)=>{if(r>0){const mask=1<<(i&7);need(!(visited[i>>3]&mask),'duplicate');visited[i>>3]|=mask}},mode,B)}finally{fs.closeSync(fd)}need(c.expressions===N&&c.declarations===1&&c.edges===(shape==='spread'?3*(N-1)+1:N),'benchmark coverage');need(visited.every(x=>x===255),'missed expression');return {shape,mode,...c,reads,hits,readBytes:reads*B*12,cacheBytes:C*B*12,ms:performance.now()-t,rssKiB:process.resourceUsage().maxRSS,visitedDigest:createHash('sha256').update(visited).digest('hex')}}
const [cmd,dir,shape,mode]=process.argv.slice(2);
if(cmd==='prepare')for(const s of ['spread','chain','cross'])prepare(dir,s);
else if(cmd==='bench')console.log(JSON.stringify(bench(dir,shape,mode)));
else console.log(JSON.stringify(selftest()));
