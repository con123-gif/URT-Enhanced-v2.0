function condense(input, roots){
 const by=new Map();for(const n of input){if(by.has(n.name))throw Error("duplicate node");by.set(n.name,n)}
 // Unknown names are explicit boundary nodes, never implicitly discharged.
 const ids=[],index=new Map(),stack=roots.slice();
 function enroll(id){if(index.has(id))return;index.set(id,ids.length);ids.push(id);for(const d of by.get(id)?.refs||[])stack.push(d)}
 while(stack.length)enroll(stack.pop());
 const n=ids.length,adj=ids.map(id=>(by.get(id)?.refs||[]).map(d=>index.get(d))),rev=Array.from({length:n},()=>[]);
 let occurrences=0,edgeReads=0;
 for(let i=0;i<n;i++)for(const j of adj[i]){rev[j].push(i);occurrences++;edgeReads++}
 // Iterative Kosaraju. No recursion stack overflow on deep proofs.
 const seen=new Uint8Array(n),finish=[];
 for(let i=0;i<n;i++){
  if(seen[i])continue;seen[i]=1;
  const v=[i],cursor=[0];
  while(v.length){
   const k=v.length-1,a=v[k];
   if(cursor[k]<adj[a].length){const b=adj[a][cursor[k]++];edgeReads++;if(!seen[b]){seen[b]=1;v.push(b);cursor.push(0)}}
   else{finish.push(a);v.pop();cursor.pop()}
  }
 }
 const comp=new Int32Array(n);comp.fill(-1);const members=[];
 for(let i=finish.length-1;i>=0;i--){
  const root=finish[i];if(comp[root]!==-1)continue;
  const cid=members.length,group=[],todo=[root];comp[root]=cid;
  while(todo.length){
   const a=todo.pop();group.push(a);
   for(const b of rev[a]){edgeReads++;if(comp[b]===-1){comp[b]=cid;todo.push(b)}}
  }
  members.push(group);
 }
 const c=members.length,dependencies=Array.from({length:c},()=>new Set()),dependents=Array.from({length:c},()=>new Set()),internal=new Uint32Array(c),cross=new Uint32Array(c),boundary=new Uint8Array(c);
 for(let i=0;i<n;i++){
  const a=comp[i];if(!by.has(ids[i]))boundary[a]=1;
  for(const j of adj[i]){edgeReads++;const b=comp[j];if(a===b)internal[a]++;else{cross[a]++;dependencies[a].add(b);dependents[b].add(a)}}
 }
 const ds=dependencies.map(x=>[...x]),rs=dependents.map(x=>[...x]);
 // Keep node adjacency as well as the condensation map; SCC grouping never deletes an original obligation.
 if(internal.reduce((a,b)=>a+b,0)+cross.reduce((a,b)=>a+b,0)!==occurrences)throw Error("edge accounting");
 return {ids,adj,comp:[...comp],members,dependencies:ds,dependents:rs,internal:[...internal],cross:[...cross],boundary:[...boundary],occurrences,edgeReads,uniqueComponentEdges:ds.reduce((a,b)=>a+b.length,0)};
}

function schedule(g, initial=[]){
 const n=g.members.length,done=new Uint8Array(n),remaining=new Uint32Array(n),queued=new Uint8Array(n),q=[];let cursor=0,edgeReads=0;
 for(const i of initial){if(!Number.isInteger(i)||i<0||i>=n||done[i])throw Error("invalid checkpoint");done[i]=1}
 for(let i=0;i<n;i++){
  for(const d of g.dependencies[i]){edgeReads++;if(!done[d])remaining[i]++}
  if(done[i]&&remaining[i])throw Error("checkpoint not closed");
  if(!done[i]&&!remaining[i]&&!g.boundary[i]){queued[i]=1;q.push(i)}
 }
 function next(){while(cursor<q.length){const i=q[cursor++];if(queued[i])return i}return null}
 function finish(i){
  if(!queued[i]||done[i]||g.boundary[i])throw Error("component not ready");
  queued[i]=0;done[i]=1;
  for(const p of g.dependents[i]){edgeReads++;if(remaining[p]===0)throw Error("underflow");if(--remaining[p]===0&&!g.boundary[p]){queued[p]=1;q.push(p)}}
 }
 return {next,finish,done,stats:()=>({edgeReads,completed:done.reduce((a,b)=>a+b,0),blocked:n-done.reduce((a,b)=>a+b,0)})};
}

function invalidate(g,changed){
 const dirty=new Uint8Array(g.members.length),q=[];let edgeReads=0;
 for(const i of changed){if(!Number.isInteger(i)||i<0||i>=dirty.length)throw Error("invalid change");if(!dirty[i]){dirty[i]=1;q.push(i)}}
 for(let h=0;h<q.length;h++)for(const p of g.dependents[q[h]]){edgeReads++;if(!dirty[p]){dirty[p]=1;q.push(p)}}
 return {dirty:q,edgeReads};
}

function selftest(){
 const N=(name,refs=[])=>({name,refs});
 const g=condense([N("root",["a","a"]),N("a",["b"]),N("b",["a","leaf"]),N("leaf")],["root"]);
 if(g.members.length!==3||g.occurrences!==5||g.internal.reduce((a,b)=>a+b)!==2||g.uniqueComponentEdges!==2)throw Error("cycle/occurrences");
 const a=schedule(g);let v,order=[];while((v=a.next())!==null){order.push(v);a.finish(v)}
 if(order.length!==3||g.members[order[1]].length!==2)throw Error("cycle unit");
 if(invalidate(g,[order[0]]).dirty.length!==3)throw Error("invalidation");
 const ext=condense([N("root",["unavailable"])],["root"]),s=schedule(ext);
 if(s.next()!==null||s.stats().blocked!==2)throw Error("boundary lost");
 const boundary=ext.boundary.indexOf(1),resume=schedule(ext,[boundary]);let x=resume.next();if(x===null)throw Error("audited boundary");resume.finish(x);
 let rejects=0;for(const f of [()=>schedule(ext,[ext.boundary.indexOf(0)]),()=>s.finish(boundary),()=>condense([N("a"),N("a")],["a"])])try{f()}catch(e){rejects++}
 if(rejects!==3)throw Error("negative control");
 // Test a large constructed chain, every 10th pair forming a mutual dependency.
 const size=100000,chain=Array.from({length:size},(_,i)=>N(String(i),[...(i?[String(i-1)]:[]),...(i%10===0&&i+1<size?[String(i+1)]:[])]));
 const big=condense(chain,[String(size-1)]),w=schedule(big);let count=0;while((x=w.next())!==null){w.finish(x);count++}
 if(big.ids.length!==size||big.members.length!==90000||count!==90000||big.edgeReads!==4*big.occurrences||w.stats().edgeReads!==2*big.uniqueComponentEdges)throw Error("large graph");
 return {cycles:true,duplicatesPreserved:true,boundaryBlocks:true,checkpoint:true,invalidation:true,rejects,large:{nodes:size,edges:big.occurrences,components:big.members.length,condensationEdgeReads:big.edgeReads,schedulingEdgeReads:w.stats().edgeReads}};
}


import fs from 'node:fs';
const [input,out]=process.argv.slice(2);
if(!input||input==='selftest')console.log(JSON.stringify(selftest()));
else {
 const data=JSON.parse(fs.readFileSync(input,'utf8')),g=condense(data.nodes,data.plan.roots),s=schedule(g);let i,order=[];
 while((i=s.next())!==null){order.push(i);s.finish(i)}
 const r={status:'GRAPH_PLAN_ONLY_NOT_AUDITED_COMPLETIONS',graph:g,simulatedOrder:order,metrics:s.stats(),tests:selftest()};
 if(out)fs.writeFileSync(out,JSON.stringify(r));else console.log(JSON.stringify(r));
}
