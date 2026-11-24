// Shared exact per-worker source-graph closure. Not a Lean proof verifier.
import fs from 'node:fs';
function engine(){
 const need=(v,m)=>{if(!v)throw Error(m)};
 function graph(rows){
  const names=[], ids=new Map(), declared=new Set();
  const intern=s=>{need(typeof s==="string"&&s.length,"invalid ID");if(!ids.has(s)){need(names.length<2147483647,"index overflow");ids.set(s,names.length);names.push(s)}return ids.get(s)};
  let e=0;
  for(const r of rows){need(r&&Array.isArray(r.deps)&&!declared.has(r.id),"invalid/duplicate row");intern(r.id);declared.add(r.id);for(const d of r.deps){intern(d);e++;need(e<2147483647,"edge overflow")}}
  const n=names.length;
  const a=new Uint32Array(n+1),b=new Uint32Array(n+1);
  for(const r of rows){const u=ids.get(r.id);for(const d of r.deps){a[u+1]++;b[ids.get(d)+1]++}}
  for(let i=1;i<=n;i++){a[i]+=a[i-1];b[i]+=b[i-1]}
  const f=new Uint32Array(e),r=new Uint32Array(e),ac=a.slice(),bc=b.slice();
  for(const row of rows){const u=ids.get(row.id);for(const d of row.deps){const v=ids.get(d);f[ac[u]++]=v;r[bc[v]++]=u}}
  return {names,ids,declared,n,e,a,b,f,r};
 }
 function components(g){
  const {n,a,b,f,r}=g;
  const seen=new Uint8Array(n),fin=new Uint32Array(n),stack=new Uint32Array(n),next=new Uint32Array(n);
  let count=0;
  for(let s=0;s<n;s++){
   if(seen[s])continue;let top=1;stack[0]=s;next[0]=a[s];seen[s]=1;
   while(top){let k=top-1,u=stack[k];if(next[k]<a[u+1]){let v=f[next[k]++];if(!seen[v]){seen[v]=1;stack[top]=v;next[top]=a[v];top++}}else{fin[count++]=u;top--}}
  }
  const comp=new Int32Array(n).fill(-1),members=new Uint32Array(n),starts=new Uint32Array(n+1);let c=0,m=0;
  for(let i=n-1;i>=0;i--){const s=fin[i];if(comp[s]>=0)continue;starts[c]=m;let top=1;stack[0]=s;comp[s]=c;
   while(top){let u=stack[--top];members[m++]=u;for(let j=b[u];j<b[u+1];j++){const v=r[j];if(comp[v]<0){comp[v]=c;stack[top++]=v}}}c++;
  }
  starts[c]=m;
  need(count===n&&m===n,"SCC coverage");
  for(let u=0;u<n;u++)for(let j=a[u];j<a[u+1];j++)need(comp[u]<=comp[f[j]],"SCC topological order");
  return {comp,members,starts,c};
 }
 function queries(g,groups){need(Array.isArray(groups)&&groups.length<=32,"1 word supports at most 32 lanes");return groups.map(x=>{need(Array.isArray(x),"bad seed group");return x.map(s=>{need(g.ids.has(s),"unrepresented seed "+s);return g.ids.get(s)})})}
 function shared(g,c,groups,reverse=false){
  const seeds=queries(g,groups),masks=new Uint32Array(c.c),{comp,members,starts}=c;
  for(let i=0;i<seeds.length;i++)for(const v of seeds[i])masks[comp[v]]|=(1<<i)>>>0;
  const off=reverse?g.b:g.a,ed=reverse?g.r:g.f;let visits=0;
  for(let k=0;k<c.c;k++){const q=reverse?c.c-1-k:k,mask=masks[q];if(!mask)continue;
   for(let i=starts[q];i<starts[q+1];i++){const u=members[i];for(let j=off[u];j<off[u+1];j++){visits++;masks[comp[ed[j]]]|=mask}}
  }
  const out=new Uint32Array(g.n);for(let i=0;i<g.n;i++)out[i]=masks[comp[i]];
  return {out,visits};
 }
 function independent(g,groups,reverse=false){
  const seeds=queries(g,groups),out=new Uint32Array(g.n),stack=new Uint32Array(g.n);
  const off=reverse?g.b:g.a,ed=reverse?g.r:g.f;let visits=0;
  for(let k=0;k<seeds.length;k++){const bit=(1<<k)>>>0;let top=0;
   for(const s of seeds[k])if(!(out[s]&bit)){out[s]|=bit;stack[top++]=s}
   while(top){const u=stack[--top];for(let j=off[u];j<off[u+1];j++){visits++;const v=ed[j];if(!(out[v]&bit)){out[v]|=bit;stack[top++]=v}}}
  }
  return {out,visits};
 }
 // Ablation changes the ordering of the worker seed groups, not the meaning.
 function phase(groups,theta){const b=Array.from({length:64},()=>[]);for(let i=0;i<groups.length;i++)b[Math.floor(64*((i*theta)%1))].push(i);return b.flat()}
 function phased(g,c,groups,theta,reverse=false){
  const order=phase(groups,theta),z=shared(g,c,order.map(i=>groups[i]),reverse);
  // Remap bits once using four 256-entry byte tables: O(V) for fixed 32 lanes.
  const t=Array.from({length:4},()=>new Uint32Array(256));
  for(let k=0;k<4;k++)for(let v=0;v<256;v++)for(let j=0;j<8;j++){let i=8*k+j;if(i<order.length&&(v&(1<<j)))t[k][v]|=(1<<order[i])>>>0}
  for(let i=0;i<z.out.length;i++){let v=z.out[i];z.out[i]=t[0][v&255]|t[1][(v>>>8)&255]|t[2][(v>>>16)&255]|t[3][v>>>24]}
  return z;
 }
 function actualRows(peer){need(peer.schema==="RH selected source application obligation multigraph v1","wrong source schema");return Object.entries(peer.nodes).map(([id,n])=>({id,deps:n.ports.filter(p=>p.producer!=null).map(p=>p.producer)}))}
 function equal(a,b){return a.length===b.length&&a.every((v,i)=>v===b[i])}
 function certificate(peer,clock=()=>Date.now()){
  let tests=0,randomPairs=0;const ok=(x,m)=>{need(x,m);tests++};
  const compare=(g,c,s,rev)=>{let a=independent(g,s,rev),b=shared(g,c,s,rev);ok(equal(a.out,b.out),"mask mismatch");ok(equal(a.out,phased(g,c,s,1/((1+Math.sqrt(5))/2)**2,rev).out),"golden mismatch");ok(equal(a.out,phased(g,c,s,0.25,rev).out),"periodic mismatch");return {independent:a.visits,shared:b.visits}};
  const pr=actualRows(peer),pg=graph(pr),pc=components(pg),all=pg.names.map(s=>[s]);
  const peerResults={nodes:pg.n,edges:pg.e,unknown:pg.n-pg.declared.size,groups:all.length,forward:compare(pg,pc,all,false),reverse:compare(pg,pc,all,true)};
  const fixture=graph([{id:"a",deps:["b","b"]},{id:"b",deps:["a","unknown"]},{id:"isolated",deps:[]}]),fc=components(fixture),s32=Array.from({length:32},(_,i)=>i===31?["a"]:i%2?["b"]:[]);
  compare(fixture,fc,s32,false);compare(fixture,fc,s32,true);
  ok(shared(fixture,fc,s32).out[fixture.ids.get("unknown")]===2863311530,"unsigned lane 31 or unresolved endpoint");
  let caught=0;for(const f of [()=>graph([{id:"x",deps:[]},{id:"x",deps:[]}]),()=>shared(fixture,fc,[["missing"]]),()=>shared(fixture,fc,Array.from({length:33},()=>[]))]){try{f()}catch{caught++}}ok(caught===3,"fail closed");
  let seed=1761;const rand=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed};
  for(let t=0;t<60;t++){let rows=Array.from({length:23},(_,i)=>({id:String(i),deps:Array.from({length:rand()%6},()=>String(rand()%26))})),g=graph(rows),c=components(g),s=Array.from({length:15},()=>Array.from({length:rand()%4},()=>g.names[rand()%g.n]));compare(g,c,s,false);compare(g,c,s,true);randomPairs+=2}
  const N=100000,rows=Array.from({length:N},(_,i)=>({id:String(i),deps:i?[String(i-1)]:[]}));
  let t=clock(),g=graph(rows),indexMs=clock()-t;t=clock();let c=components(g),sccMs=clock()-t;
  const groups=Array.from({length:15},(_,i)=>[String(N-1-i)]),gold=1/((1+Math.sqrt(5))/2)**2;
  const baseline=independent(g,groups),methods={independent:()=>independent(g,groups),shared:()=>shared(g,c,groups),golden:()=>phased(g,c,groups,gold),periodic:()=>phased(g,c,groups,.25)},runs={};
  for(const [name,fn] of Object.entries(methods)){const ms=[];let v;for(let i=0;i<7;i++){let start=clock();v=fn();ms.push(clock()-start);ok(equal(v.out,baseline.out),"stress mismatch "+name)}ms.sort((a,b)=>a-b);runs[name]={median_ms:ms[3],samples_ms:ms,visits:v.visits}}
  // retained typed-array bytes only; excludes names, maps, input rows and temporary arrays/RSS.
  const retained=[g.a,g.b,g.f,g.r,c.comp,c.members,c.starts].reduce((s,x)=>s+x.byteLength,0);
  return {tests,randomPairs,peer:peerResults,synthetic:{nodes:g.n,edges:g.e,lanes:groups.length,index_ms:indexMs,scc_ms:sccMs,retained_typed_array_bytes:retained,result_bytes:baseline.out.byteLength,runs}};
 }
 return {graph,components,shared,independent,phased,certificate};
}
const path=process.argv[2];if(!path)throw Error('usage: node multi_lane_closure.mjs <typed-root-obligation-graph.json>');
const peer=JSON.parse(fs.readFileSync(path,'utf8'));const r=engine().certificate(peer,()=>performance.now());r.process_peak_rss_kib=process.resourceUsage().maxRSS;console.log(JSON.stringify(r,null,2));
