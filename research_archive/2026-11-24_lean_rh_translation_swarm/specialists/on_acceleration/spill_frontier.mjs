// Signed mixed-graph traversal with a globally bounded in-RAM frontier payload.
// No semantic decoding: preserve duplicates, cycles, signed IDs, zero padding.
import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
const need=(ok,msg)=>{if(!ok)throw Error(msg)};
function io(fd,b,n,pos,write){let at=0;while(at<n){const k=write?fs.writeSync(fd,b,at,n-at,pos+at):fs.readSync(fd,b,at,n-at,pos+at);need(k>0,'short spill I/O');at+=k}}
export function spillTraverse(roots,readExpr,readDecl,visit=()=>{},opts={}){
 const {mode='descending',blockSize=65536,pageRefs=1024,budgetRefs=65536,tmpRoot=os.tmpdir()}=opts;
 need(['stack','block','descending','golden','periodic'].includes(mode),'mode');
 need([blockSize,pageRefs,budgetRefs].every(x=>Number.isSafeInteger(x)&&x>0)&&pageRefs<=budgetRefs&&pageRefs<=1048576,'limits');
 const dir=fs.mkdtempSync(path.join(tmpRoot,'rh-spill-'));let fd;
 try{
 fd=fs.openSync(path.join(dir,'frontier.bin'),'wx+');
 const scratch=Buffer.allocUnsafe(12+4*pageRefs),queues=new Map(),resident=new Map(),bins=Array.from({length:64},()=>[]),levels=Array.from({length:7},()=>new Map());
 const pages=[new Map(),new Map()],pageBits=1<<19;
 let end=0,held=0,peakHeld=0,pending=0,peakPending=0,peakBlocks=0,active=0,activations=0,spills=0,reloads=0,readBytes=0,writeBytes=0;
 const counts={expressions:0,declarations:0,edges:0};
 const theta=mode==='golden'?1/((1+Math.sqrt(5))/2)**2:1/7;
 const key=r=>mode==='stack'?0:r<0?-1:Math.floor((r-1)/blockSize);
 const bin=k=>k<0||mode==='stack'||mode==='block'?63:Math.floor(64*((k*theta)%1));
 function mark(k,on){for(const l of levels){const g=Math.floor(k/32),bit=1<<(k%32),old=l.get(g)||0,v=on?old|bit:old&~bit;if(v)l.set(g,v);else l.delete(g);if(Boolean(old)===Boolean(v))break;k=g}}
 function highest(){let g=0;for(let i=levels.length-1;i>=0;i--){const w=levels[i].get(g);need(w,'empty radix node');g=g*32+31-Math.clz32(w)}return g}
 function touch(k,q){resident.delete(k);if(q.tail.length)resident.set(k,q)}
 function spill(k,q){const n=q.tail.length;need(n>0&&n<=pageRefs,'bad page');scratch.writeDoubleLE(q.head,0);scratch.writeUInt32LE(n,8);for(let i=0;i<n;i++)scratch.writeInt32LE(q.tail[i],12+4*i);const len=12+4*n;need(Number.isSafeInteger(end+len),'spill offset overflow');io(fd,scratch,len,end,true);q.head=end;end+=len;writeBytes+=len;spills++;held-=n;q.tail=[];resident.delete(k)}
 function room(n){while(held+n>budgetRefs){const entry=resident.entries().next().value;need(entry,'empty resident');spill(...entry)}}
 function load(k,q){need(!q.tail.length&&q.head>=0,'bad load');const pos=q.head;io(fd,scratch,12,pos,false);const prev=scratch.readDoubleLE(0),n=scratch.readUInt32LE(8);need(Number.isSafeInteger(prev)&&prev>=-1&&prev<pos&&n>0&&n<=pageRefs&&pos+12+4*n<=end,'corrupt spill page');room(n); // room may overwrite scratch; reread payload after eviction.
 io(fd,scratch,4*n,pos+12,false);q.head=prev;for(let i=0;i<n;i++)q.tail.push(scratch.readInt32LE(i*4));held+=n;peakHeld=Math.max(peakHeld,held);readBytes+=12+4*n;reloads++;touch(k,q)}
 function add(r){need(Number.isInteger(r)&&Math.abs(r)<=2147483647,'invalid ref');if(!r)return;
 const id=Math.abs(r)-1,p=Math.floor(id/pageBits),i=id%pageBits,m=pages[r>0?0:1];let a=m.get(p);if(!a){a=new Uint8Array(pageBits/8);m.set(p,a)}const mask=1<<(i&7),j=i>>3;if(a[j]&mask)return;a[j]|=mask;
 const k=key(r);let q=queues.get(k);if(!q){q={tail:[],head:-1};queues.set(k,q);if(mode==='descending'){if(k>=0)mark(k,true)}else bins[bin(k)].push(k);active++;peakBlocks=Math.max(peakBlocks,queues.size)}
 if(q.tail.length===pageRefs)spill(k,q);room(1);q.tail.push(r);held++;peakHeld=Math.max(peakHeld,held);touch(k,q);pending++;peakPending=Math.max(peakPending,pending)}
 for(const id of roots){need(Number.isInteger(id)&&id>=0&&id<2147483647,'root');add(-(id+1))}
 while(active){let k;if(mode==='descending'){k=queues.has(-1)?-1:highest();if(k>=0)mark(k,false)}else{let b=63;while(b>=0&&!bins[b].length)b--;need(b>=0,'empty bins');k=bins[b].pop()}
 const q=queues.get(k);active--;activations++;
 while(q.tail.length||q.head>=0){if(!q.tail.length)load(k,q);const r=q.tail.pop(),id=Math.abs(r)-1;held--;pending--;touch(k,q);const v=r>0?readExpr(id):readDecl(id);need(v!=null,'missing '+r);const es=r>0?v:v.edges;need(es&&typeof es[Symbol.iterator]==='function','missing edges');counts[r>0?'expressions':'declarations']++;visit(r,id,v);for(const ref of es){if(ref!==0)counts.edges++;add(ref)}}
 queues.delete(k);resident.delete(k)}
 need(!held&&!pending&&!queues.size&&!resident.size&&spills===reloads,'frontier accounting');
 return {...counts,peakPending,peakBlocks,activations,peakHeld,frontierScratchBytes:scratch.length,spills,reloads,readBytes,writeBytes,spillFileBytes:end,seenPayloadBytes:(pages[0].size+pages[1].size)*(pageBits/8)};
 }finally{if(fd!==undefined)fs.closeSync(fd);fs.rmSync(dir,{recursive:true,force:true})}
}
// Reusable exact 12-byte record buffers. Returned refs are copied, never views.
export function reusableReader(fd,n,blockRecords=65536,maxBlocks=128){
 need([n,blockRecords,maxBlocks].every(Number.isSafeInteger)&&n>=0&&blockRecords>0&&maxBlocks>0,'reader limits');
 const cache=new Map();let reads=0,hits=0,bytes=0,allocations=0;
 return {read(id){if(!Number.isInteger(id)||id<0||id>=n)return null;const k=Math.floor(id/blockRecords),j=id%blockRecords*12;let b=cache.get(k);if(b){hits++;cache.delete(k)}else{if(cache.size===maxBlocks){const old=cache.keys().next().value;b=cache.get(old);cache.delete(old)}else{b=Buffer.allocUnsafe(blockRecords*12);allocations++}const len=Math.min(blockRecords,n-k*blockRecords)*12;io(fd,b,len,k*blockRecords*12,false);reads++;bytes+=len}cache.set(k,b);return [b.readInt32LE(j),b.readInt32LE(j+4),b.readInt32LE(j+8)]},stats:()=>({reads,hits,bytes,allocations,cachePayloadBytes:allocations*blockRecords*12})};
}
