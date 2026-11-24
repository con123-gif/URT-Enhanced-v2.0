/* STRUCTURE 2026-11-24 12:24 UTC. PARTIAL: exact reverse-DAG immediate postdominators and a new dominator-local explanation priority on the peer ParDual root join. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; current upstream head c6d67c05b648be9f1993aa84bd32c29ea9d2fb72 has different src/Main.lean Claim.zeta entry; never mixed. Graph research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1200_PARDUAL_ROOT_JOIN.json, blob ce4a6de087061290db15f82581eb70567cc16d55. Six pinned source paths and SHAs embedded in graph sourceLedger; connector checked each blob ID plus anchors, not independent byte hashing until local replay. All original records/guards/clauses and scoped occurrences retained in lossless ledger. This is a presentation graph only, not a kernel closure. 
Method: reverse topological traversal; a node's postdominator set equals itself union the intersection of the postdominator sets of its successors (single sink, all nodes reach it). Hence immediate postdominator is LCA of successor nodes in the already constructed postdominator tree. Binary lifting gives O((V+E) log V) construction, O(V log V) index; child sorting adds O(V log V). Postorder ranks are priorities only, heap Kahn still enforces each original edge. Recursive traversals used here are bounded fixture implementations; production should use explicit stacks. Each edge exiting a dominated region originates at its dominator, but shared incoming prerequisites need not be localized. Independent deletion oracle checks all ordered vertex pairs; diamond control checks shared inverse.poly is not dominated by either immediate consumer. No proof equivalence or URT physical claim.
Timing: V8 connector Date.now median of seven batches, microseconds per schedule, excludes shared graph construction and score preprocessing; postdominator preprocessing measured separately. Typed buffer payload only: scheduler 12V bytes, score 8V bytes, postdom tree arrays 4V(L+3)+8V bytes, excludes adjacency, JS objects, interpreter, metric arrays; Node replay reports process high-water RSS but not isolated per policy. Human readability NOT tested; edge span, peak live edges and count of noncontiguous nontrivial dominator subtrees are proxies.
Preflight: swarm, AGENTS, state/log and actual runner protocol, continuity, handoff, peer structure 1124, dependency typed disk projection and authenticated writer, math PairEx, audit signed-window, integration 1200, blueprint text consulted as navigation. Cathedral CI #367 PASS run 45387831523 (not RH validation). Retry status 404; original export failed byte-count gate despite digest match, no authenticated RH closure. Local git remote DNS failed; Node installed, Lean unavailable. V8 assertions executed, Node replay not executed. No duplicate export attempt. 
RESUME HERE: apply postdominator extraction to authenticated typed RH dependency graph when available, preserve package/role/occurrence witnesses, use explicit stacks and benchmark total memory with isolated policy processes; compare DFS before adopting any dominator priority. HANDOFF TO integration, dependencies, math and audit.
Observed V8 result: {
  "sourceAnchors": 70,
  "nodes": 70,
  "edges": 70,
  "declared": 18,
  "frontier": 52,
  "oracleTests": 4900,
  "singleExitBoundaryChecks": 70,
  "rejected": 4,
  "sharedProducer": "inverse.poly",
  "sharedImmediatePostdominator": "names",
  "postdomTypedBytes": 3360,
  "medianPostdomPrecomputeUs": 88,
  "results": {
    "lexical": {
      "area": 1117,
      "peak": 32,
      "split": 10,
      "nontrivial": 16,
      "medianScheduleUs": 95,
      "typedScheduleBytes": 840,
      "priorityBytes": 560
    },
    "centrality": {
      "area": 1117,
      "peak": 32,
      "split": 10,
      "nontrivial": 16,
      "medianScheduleUs": 87,
      "typedScheduleBytes": 840,
      "priorityBytes": 560
    },
    "urt": {
      "area": 1667,
      "peak": 39,
      "split": 15,
      "nontrivial": 16,
      "medianScheduleUs": 95,
      "typedScheduleBytes": 840,
      "priorityBytes": 560
    },
    "frontier": {
      "area": 1117,
      "peak": 32,
      "split": 10,
      "nontrivial": 16,
      "medianScheduleUs": 89,
      "typedScheduleBytes": 840,
      "priorityBytes": 560
    },
    "dfs": {
      "area": 275,
      "peak": 10,
      "split": 0,
      "nontrivial": 16,
      "medianScheduleUs": 83,
      "typedScheduleBytes": 840,
      "priorityBytes": 560
    },
    "dominator": {
      "area": 275,
      "peak": 10,
      "split": 1,
      "nontrivial": 16,
      "medianScheduleUs": 90,
      "typedScheduleBytes": 840,
      "priorityBytes": 560
    },
    "depth": {
      "area": 368,
      "peak": 14,
      "split": 10,
      "nontrivial": 16,
      "medianScheduleUs": 86,
      "typedScheduleBytes": 840,
      "priorityBytes": 560
    }
  },
  "immediatePostdominators": [
    [
      "average",
      "inflation"
    ],
    [
      "cusp.field",
      "summand"
    ],
    [
      "cusp.good",
      "cusp.field"
    ],
    [
      "extension",
      "root"
    ],
    [
      "finite.cusp",
      "par"
    ],
    [
      "inflation",
      "par"
    ],
    [
      "inverse.irred",
      "names"
    ],
    [
      "inverse.poly",
      "names"
    ],
    [
      "inverse.root",
      "names"
    ],
    [
      "list",
      "extension"
    ],
    [
      "names",
      "par"
    ],
    [
      "par",
      "cusp.good"
    ],
    [
      "rad.inverse",
      "finite.cusp"
    ],
    [
      "rad.support",
      "rad.inverse"
    ],
    [
      "regular",
      "par"
    ],
    [
      "reverse.irred",
      "inverse.irred"
    ],
    [
      "root",
      null
    ],
    [
      "summand",
      "list"
    ],
    [
      "unexpanded:average:0",
      "average"
    ],
    [
      "unexpanded:average:1",
      "average"
    ],
    [
      "unexpanded:average:2",
      "average"
    ],
    [
      "unexpanded:average:3",
      "average"
    ],
    [
      "unexpanded:cusp.field:0",
      "cusp.field"
    ],
    [
      "unexpanded:cusp.field:1",
      "cusp.field"
    ],
    [
      "unexpanded:cusp.field:2",
      "cusp.field"
    ],
    [
      "unexpanded:cusp.good:0",
      "cusp.good"
    ],
    [
      "unexpanded:cusp.good:1",
      "cusp.good"
    ],
    [
      "unexpanded:cusp.good:2",
      "cusp.good"
    ],
    [
      "unexpanded:cusp.good:3",
      "cusp.good"
    ],
    [
      "unexpanded:cusp.good:4",
      "cusp.good"
    ],
    [
      "unexpanded:cusp.good:5",
      "cusp.good"
    ],
    [
      "unexpanded:cusp.good:6",
      "cusp.good"
    ],
    [
      "unexpanded:cusp.good:7",
      "cusp.good"
    ],
    [
      "unexpanded:cusp.good:8",
      "cusp.good"
    ],
    [
      "unexpanded:extension:0",
      "extension"
    ],
    [
      "unexpanded:extension:1",
      "extension"
    ],
    [
      "unexpanded:extension:2",
      "extension"
    ],
    [
      "unexpanded:extension:3",
      "extension"
    ],
    [
      "unexpanded:extension:4",
      "extension"
    ],
    [
      "unexpanded:finite.cusp:0",
      "finite.cusp"
    ],
    [
      "unexpanded:finite.cusp:1",
      "finite.cusp"
    ],
    [
      "unexpanded:finite.cusp:2",
      "finite.cusp"
    ],
    [
      "unexpanded:inflation:0",
      "inflation"
    ],
    [
      "unexpanded:inflation:1",
      "inflation"
    ],
    [
      "unexpanded:inflation:2",
      "inflation"
    ],
    [
      "unexpanded:inflation:3",
      "inflation"
    ],
    [
      "unexpanded:inflation:4",
      "inflation"
    ],
    [
      "unexpanded:inverse.irred:0",
      "inverse.irred"
    ],
    [
      "unexpanded:inverse.poly:0",
      "inverse.poly"
    ],
    [
      "unexpanded:inverse.poly:1",
      "inverse.poly"
    ],
    [
      "unexpanded:inverse.poly:2",
      "inverse.poly"
    ],
    [
      "unexpanded:inverse.poly:3",
      "inverse.poly"
    ],
    [
      "unexpanded:inverse.root:0",
      "inverse.root"
    ],
    [
      "unexpanded:list:0",
      "list"
    ],
    [
      "unexpanded:names:0",
      "names"
    ],
    [
      "unexpanded:par:0",
      "par"
    ],
    [
      "unexpanded:par:1",
      "par"
    ],
    [
      "unexpanded:par:2",
      "par"
    ],
    [
      "unexpanded:par:3",
      "par"
    ],
    [
      "unexpanded:regular:0",
      "regular"
    ],
    [
      "unexpanded:reverse.irred:0",
      "reverse.irred"
    ],
    [
      "unexpanded:reverse.irred:1",
      "reverse.irred"
    ],
    [
      "unexpanded:reverse.irred:2",
      "reverse.irred"
    ],
    [
      "unexpanded:root:0",
      "root"
    ],
    [
      "unexpanded:root:1",
      "root"
    ],
    [
      "unexpanded:root:2",
      "root"
    ],
    [
      "unexpanded:summand:0",
      "summand"
    ],
    [
      "unexpanded:summand:1",
      "summand"
    ],
    [
      "unexpanded:summand:2",
      "summand"
    ],
    [
      "unexpanded:summand:3",
      "summand"
    ]
  ]
}
*/
function run(g,sources){
 const check=(c,m)=>{if(!c)throw Error(m)};let anchors=0,tests=0;
 const validate=(s)=>{for(const n of g.nodes){check(s[n.file].split(/\r?\n/)[n.line-1].includes(n.anchor),"line "+n.id);anchors++}for(const [k,clauses] of Object.entries(g.clauses))for(const c of clauses){check(s[k].includes(c),"clause "+k+c);anchors++}};
 validate(sources);const sourceAnchors=anchors;
 const nodes=g.nodes.map(n=>({id:n.id,record:n})),originalIDs=new Set(nodes.map(n=>n.id)),edges=[];
 for(const n of g.nodes){for(const [slot,d] of n.deps.entries()){check(originalIDs.has(d),"unresolved declared edge");edges.push({from:d,to:n.id,kind:"selected",slot})}for(const [slot,spelling] of n.frontier.entries()){const id="unexpanded:"+n.id+":"+slot;nodes.push({id,record:{owner:n.id,slot,spelling,status:"UNEXPANDED; no equivalence inferred"}});edges.push({from:id,to:n.id,kind:"frontier",slot})}}
 const ledger={original:g,nodes,edges};check(JSON.stringify(JSON.parse(JSON.stringify(ledger)))===JSON.stringify(ledger),"lossless ledger");
 const ids=nodes.map(n=>n.id).sort(),N=ids.length,index=new Map(ids.map((x,i)=>[x,i])),root=index.get(g.root),adj=ids.map(()=>[]),pred=ids.map(()=>[]),ind=new Int32Array(N),pairs=edges.map(e=>[index.get(e.from),index.get(e.to)]);
 check(index.size===N,"duplicate ID");
 for(const [a,b] of pairs){adj[a].push(b);pred[b].push(a);ind[b]++}for(const p of pred)p.sort((a,b)=>a-b);
 function schedule(score){const d=ind.slice(),q=new Int32Array(N),out=new Int32Array(N);let len=0,k=0;
  const better=(a,b)=>score[a]>score[b]||(score[a]===score[b]&&a<b);
  const push=a=>{let i=len++;while(i){const j=(i-1)>>1;if(!better(a,q[j]))break;q[i]=q[j];i=j}q[i]=a};
  const pop=()=>{const a=q[0],v=q[--len];if(len){let i=0;while(2*i+1<len){let j=2*i+1;if(j+1<len&&better(q[j+1],q[j]))j++;if(!better(q[j],v))break;q[i]=q[j];i=j}q[i]=v}return a};
  for(let i=0;i<N;i++)if(!d[i])push(i);while(len){const a=pop();out[k++]=a;for(const b of adj[a])if(--d[b]===0)push(b)}check(k===N,"cycle");return out}
 const scores={lexical:new Float64Array(N),centrality:Float64Array.from(adj,a=>a.length),urt:Float64Array.from(adj,(a,i)=>a.length+Math.PI/Math.E*Math.cos((i+1)*2*Math.PI/((1+Math.sqrt(5))/2)**2)),frontier:Float64Array.from(adj,(a,i)=>ind[i]-a.length)};
 const top=schedule(scores.lexical);
 function dominance(){
  const L=Math.ceil(Math.log2(N+1)),up=Array.from({length:L},()=>new Int32Array(N).fill(-1)),depth=new Int32Array(N),tree=ids.map(()=>[]);
  for(let k=0;k<L;k++)up[k][root]=root;
  function lca(a,b){if(depth[a]<depth[b])[a,b]=[b,a];let diff=depth[a]-depth[b];for(let j=0;diff;j++,diff>>=1)if(diff&1)a=up[j][a];if(a===b)return a;for(let j=L-1;j>=0;j--)if(up[j][a]!==up[j][b]){a=up[j][a];b=up[j][b]}return up[0][a]}
  for(let i=N-1;i>=0;i--){const a=top[i];if(a===root)continue;check(adj[a].length>0,"nonroot sink");let p=adj[a][0];for(const b of adj[a]){check(up[0][b]>=0,"root not reachable");p=lca(p,b)}up[0][a]=p;depth[a]=depth[p]+1;for(let j=1;j<L;j++)up[j][a]=up[j-1][up[j-1][a]];tree[p].push(a)}
  for(const ch of tree)ch.sort((a,b)=>a-b);
  const rank=new Float64Array(N),start=new Int32Array(N),end=new Int32Array(N);let t=0;
  function visit(a){start[a]=t;for(const b of tree[a])visit(b);rank[a]=-t++;end[a]=t}
  visit(root);check(t===N,"dominator tree coverage");
  return {up,depth,tree,rank,start,end,bytes:4*N*(L+3)+8*N};
 }
 const dom=dominance(),isdom=(a,b)=>dom.start[a]<=dom.start[b]&&dom.end[b]<=dom.end[a];
 function reachable(a,ban){const seen=new Set(),stack=[a];while(stack.length){const x=stack.pop();if(x===ban||seen.has(x))continue;if(x===root)return true;seen.add(x);for(const y of adj[x])stack.push(y)}return false}
 for(let a=0;a<N;a++){check(reachable(a,-1),"disconnected");for(let b=0;b<N;b++){check(isdom(b,a)===!reachable(a,b),"deletion oracle "+ids[a]+" "+ids[b]);tests++}}
 let boundaries=0;for(let b=0;b<N;b++)for(const [u,v] of pairs)if(isdom(b,u)&&!isdom(b,v)){check(u===b,"non-single-exit region");boundaries++}
 // DFS is an independent conventional baseline; its postorder is itself topological.
 const dfsRank=new Float64Array(N),seen=new Uint8Array(N);let t=0;
 function dfs(a){if(seen[a])return;seen[a]=1;for(const b of pred[a])dfs(b);dfsRank[a]=-t++}
 dfs(root);check(t===N,"DFS coverage");scores.dfs=dfsRank;scores.dominator=dom.rank;
 const depth=new Float64Array(N);for(let i=N-1;i>=0;i--){const a=top[i];for(const b of adj[a])depth[a]=Math.max(depth[a],depth[b]+1)}scores.depth=depth;
 function metrics(o){check(o.length===N&&new Set(o).size===N&&Array.from(o).every(x=>x>=0&&x<N),"coverage");const pos=new Int32Array(N),delta=new Int32Array(N);o.forEach((a,i)=>pos[a]=i);let area=0,peak=0,live=0,sum=0;for(const [a,b] of pairs){check(pos[a]<pos[b],"edge order");area+=pos[b]-pos[a];delta[pos[a]]++;delta[pos[b]]--}for(const d of delta){live+=d;peak=Math.max(peak,live);sum+=live}check(area===sum&&live===0,"cut identity");let split=0,nontrivial=0;for(let b=0;b<N;b++){const s=dom.end[b]-dom.start[b];if(s<=1||s===N)continue;nontrivial++;let lo=N,hi=-1;for(let a=0;a<N;a++)if(isdom(b,a)){lo=Math.min(lo,pos[a]);hi=Math.max(hi,pos[a])}if(hi-lo+1!==s)split++}return {area,peak,split,nontrivial}}
 const results={};for(const [name,score] of Object.entries(scores)){const o=schedule(score),m=metrics(o),ts=[];for(let k=0;k<7;k++){const s=Date.now();for(let j=0;j<1000;j++)schedule(score);ts.push((Date.now()-s))}ts.sort((a,b)=>a-b);results[name]={...m,medianScheduleUs:ts[3],typedScheduleBytes:12*N,priorityBytes:score.byteLength}}
 const pre=[];for(let k=0;k<7;k++){const s=Date.now();for(let j=0;j<250;j++)dominance();pre.push((Date.now()-s)*4)}pre.sort((a,b)=>a-b);
 let rejected=0;for(const bad of [Array.from(top).reverse(),top.slice(1),[top[0],...top.slice(0,-1)]]){try{metrics(bad)}catch{rejected++}}check(rejected===3,"order controls");
 const [key,guard]=g.controls[0];try{validate({...sources,[key]:sources[key].split(guard).join("REMOVED_GUARD")})}catch{rejected++}check(rejected===4,"source guard negative");
 // A diamond prevents treating a shared prerequisite as dominated by either branch.
 const diamond=g.nodes.find(n=>n.id==="inverse.poly");check(diamond&&adj[index.get(diamond.id)].length===2,"diamond absent");const shared=index.get(diamond.id);for(const a of adj[shared])check(!isdom(a,shared),"shared producer falsely localized");
 return {sourceAnchors,nodes:N,edges:pairs.length,declared:g.nodes.length,frontier:N-g.nodes.length,oracleTests:tests,singleExitBoundaryChecks:boundaries,rejected,sharedProducer:ids[shared],sharedImmediatePostdominator:ids[dom.up[0][shared]],postdomTypedBytes:dom.bytes,medianPostdomPrecomputeUs:pre[3],results,immediatePostdominators:ids.map((id,i)=>[id,i===root?null:ids[dom.up[0][i]]])};
}
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const [cat,rh]=process.argv.slice(2);if(!cat||!rh)throw Error('node certificate.mjs /path/to/Cathedral /path/to/pinned-RH');
function read(repo,ref,path,sha){const b=execFileSync('git',['-C',repo,'show',ref+':'+path],{maxBuffer:16*1024*1024});if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==sha)throw Error('blob mismatch '+path);return b.toString('utf8')}
const g=JSON.parse(read(cat,'newtons-cathedral',"research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1200_PARDUAL_ROOT_JOIN.json","ce4a6de087061290db15f82581eb70567cc16d55"));const sources={};for(const [k,[p,h]] of Object.entries(g.sourceLedger))sources[k]=read(rh,"40e56bab026552e089d7afcfeff08d2defb9c005",p,h);
console.log(JSON.stringify({result:run(g,sources),processHighWaterRSSBytes:process.resourceUsage().maxRSS*1024},null,2));
