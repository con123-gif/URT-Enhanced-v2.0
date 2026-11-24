function graph(nodes,roots){
 const all=new Map();
 for(const n of nodes){if(all.has(n.name))throw Error("duplicate node");all.set(n.name,n);}
 const seen=new Set(),stack=roots.slice(),ids=[];
 while(stack.length){const v=stack.pop();if(seen.has(v))continue;const n=all.get(v);if(!n)throw Error("missing node "+v);seen.add(v);ids.push(v);for(const d of n.refs)stack.push(d)}
 const index=new Map(ids.map((v,i)=>[v,i]));
 const deps=ids.map(v=>[...new Set(all.get(v).refs.map(d=>index.get(d)))]);
 const reverse=ids.map(()=>[]);let edges=0;
 for(let i=0;i<ids.length;i++)for(const d of deps[i]){reverse[d].push(i);edges++}
 return {ids,index,deps,reverse,edges};
}

function readyEngine(g,done=[]){
 const n=g.ids.length,completed=new Uint8Array(n),missing=new Uint32Array(n),ready=new Uint8Array(n),q=[];
 let edgeReads=0,initialChecks=0,transitions=0,head=0;
 for(const v of done){if(!Number.isInteger(v)||v<0||v>=n||completed[v])throw Error("invalid saved completion");completed[v]=1}
 // A saved completed set must be downward closed; never infer missing proofs.
 for(let i=0;i<n;i++){
  for(const d of g.deps[i]){edgeReads++;if(!completed[d])missing[i]++}
  if(completed[i]&&missing[i])throw Error("checkpoint missing prerequisite");
  initialChecks++;
  if(!completed[i]&&!missing[i]){q.push(i);ready[i]=1;transitions++}
 }
 function finish(v){
  if(!Number.isInteger(v)||v<0||v>=n||!ready[v]||completed[v])throw Error("not ready or already complete");
  completed[v]=1;ready[v]=0;
  const newReady=[];
  for(const u of g.reverse[v]){
   edgeReads++;
   if(completed[u]||missing[u]===0)throw Error("invalid reverse edge");
   if(--missing[u]===0){q.push(u);ready[u]=1;transitions++;newReady.push(u)}
  }
  return newReady;
 }
 function next(){while(head<q.length){const v=q[head++];if(ready[v])return v}return null}
 return {finish,next,ready,completed,stats:()=>({edgeReads,initialChecks,readyTransitions:transitions})};
}

function critical(g){
 const a=readyEngine(g),depth=new Uint32Array(g.ids.length),order=[];
 let v;while((v=a.next())!==null){let d=0;for(const u of g.deps[v])d=Math.max(d,depth[u]);depth[v]=d+1;order.push(v);a.finish(v)}
 if(order.length!==g.ids.length)throw Error("cycle: condense SCC before scheduling");
 const downstream=new Uint32Array(g.ids.length),fanout=g.reverse.map(x=>x.length);
 let longest=0;
 for(let i=order.length-1;i>=0;i--){const u=order[i];let d=0;for(const x of g.reverse[u])d=Math.max(d,downstream[x]);downstream[u]=d+1;longest=Math.max(longest,depth[u])}
 return {order,depth:[...depth],downstream:[...downstream],fanout,longest};
}

function bench(g){
 const p=critical(g),n=g.ids.length,a=readyEngine(g);
 let baselineNodeChecks=0,baselineEdgeChecks=0,comparisons=0;
 const order=p.order;
 // Deliberately simple baseline: rescans all pending nodes on each completed task.
 // Match its exact ready set to the event-driven result at every step.
 function compare(){
  for(let i=0;i<n;i++){
   if(a.completed[i])continue;
   baselineNodeChecks++;let r=true;
   for(const d of g.deps[i]){baselineEdgeChecks++;if(!a.completed[d])r=false}
   if(r!==Boolean(a.ready[i]))throw Error("ready-set disagreement "+g.ids[i]);
  }
  comparisons++;
 }
 for(const v of order){compare();a.finish(v)}
 compare();
 if(a.completed.some(x=>x!==1))throw Error("not complete");
 const s=a.stats();
 return {nodes:n,edges:g.edges,comparisons,baselineNodeChecks,baselineEdgeChecks,linearNodeChecks:s.initialChecks,linearEdgeChecks:s.edgeReads,readyTransitions:s.readyTransitions,baselineTotalChecks:baselineNodeChecks+baselineEdgeChecks,linearTotalChecks:s.initialChecks+s.edgeReads,checkReduction:1-(s.initialChecks+s.edgeReads)/(baselineNodeChecks+baselineEdgeChecks),unitCostCriticalDepth:p.longest,criticalCandidates:g.ids.map((name,i)=>({name,depth:p.depth[i],downstream:p.downstream[i],fanout:p.fanout[i]})).filter(x=>x.depth+x.downstream-1===p.longest)};
}

function selftest(){
 const n=(name,refs=[])=>({name,refs});
 const g=graph([n("r",["b","c","b"]),n("b",["d"]),n("c",["d"]),n("d")],["r"]);
 const b=bench(g);if(b.nodes!==4||b.edges!==4||b.comparisons!==5||b.unitCostCriticalDepth!==3)throw Error("diamond");
 const d=g.index.get("d"),x=readyEngine(g,[d]);if(!x.ready[g.index.get("b")]||!x.ready[g.index.get("c")]||x.ready[g.index.get("r")])throw Error("resume");
 let reject=0;
 for(const f of [()=>readyEngine(g,[g.index.get("r")]),()=>readyEngine(g).finish(g.index.get("r")),()=>critical(graph([n("a",["a"])],["a"])),()=>graph([n("a",["b"])],["a"])])try{f()}catch(e){reject++}
 if(reject!==4)throw Error("negative tests");
 const chain=graph(Array.from({length:2000},(_,i)=>n(String(i),i?[String(i-1)]:[])),["1999"]);
 const c=bench(chain);if(c.linearEdgeChecks!==3998||c.baselineNodeChecks!==2001000)throw Error("linear chain");
 return {diamond:true,checkpointResume:true,invalidOperationsRejected:reject,syntheticChain:{nodes:c.nodes,edges:c.edges,baselineTotalChecks:c.baselineTotalChecks,linearTotalChecks:c.linearTotalChecks,checkReduction:c.checkReduction}};
}


import fs from 'node:fs';
const [file,out]=process.argv.slice(2);
if(!file||file==='selftest')console.log(JSON.stringify(selftest()));
else{
 const j=JSON.parse(fs.readFileSync(file,'utf8')),g=graph(j.nodes,j.plan.roots),result={status:'INTERNAL SOURCE GRAPH SCHEDULER ONLY; NOT PROOF VALIDATION',pin:j.pin,sourceBlob:j.blob,tests:selftest(),actual:bench(g)};
 if(out)fs.writeFileSync(out,JSON.stringify(result,null,2));else console.log(JSON.stringify(result,null,2));
}
