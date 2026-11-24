/* STRUCTURE 2026-11-24 19:24 UTC — one contribution: terminal-motif quotient for unrestricted exact explanation scheduling on the expanded authenticated ROOT-CONNECTED projection. PARTIAL.
Preflight SWARM_PROTOCOL first, AGENTS, state and actual runner protocol/log, continuity, HANDOFF_QUEUE, CI #389 PASS run 45465413878 (not RH validity), prior structure 66ca007, dependency 593acf8, acceleration f08ab98, audit 2c70f96, math e8fb8e96, integration c04db34, kernel 5220d42, editor a22b20b and specialist Landau/prime/geometry checkpoints. Root-level log/protocol 404 corrected. External blueprint not reopened. Upstream HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd not adopted, no equivalence assumed.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Retrieved pinned blobs src/Main.lean dbd5db70bc11b35f18fa5751216ab335321e7bfc; src/Supplements/Kernels/MainTheorems.lean 6a542d7ce969a791fd12ce575f587e6bc29044bf; src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean ee340012ab19713a8acfecf8adc6a331cbc2f1a4; src/Formalism/GammaFactorNonvanishing/CritLine.lean 95fa4da5c50119db164aa93944d106f22fdb576d. Source-to-export binding and native kernel replay not established. 47-target CI job 45457486389; six-anchor earlier source-name comparison failed, exact export role evidence retained and namespace reconciled by dependency lane. Inputs on cathedral-research-state: compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json blob d49fbcc22a2382039986b09ff91dd11af2ef2e7b, SHA256 9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6; compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json blob 64b935e4ef309f6c555912a377012c7708eda510. Both retrieved by exact Git blob; V8 cannot independently compute byte hashes or process RSS; CLI below verifies bytes and reports RSS. Local container has Node but GitHub DNS failed and no Lean executable. No fabricated native timing.
Theorem: Fix any admissible owner order. All observed edges terminate at an owner; every boundary vertex is a prerequisite only in this projection, not proved a global leaf. Reverse the order as in prior structure certificate: reverse owner chain with each frontier leaf child of its earliest forward consumer. Cost of role-edge lengths equals sum_v (outweight-inweight)*reverse_position(v). In this reversed tree, terminal leaves with identical coefficient c and parent p have identical constraints. There exists an optimal schedule with these leaves consecutive: take two consecutive occurrences of this class separated by a block Z. Both leaves can legally move across Z because they are terminal and their common parent precedes both. Moving the first leaf after Z changes cost by c*|Z|-sum weights(Z); moving the second leaf before Z changes it by the negative of that quantity. Choose nonpositive change. More generally move a contiguous run of leaves across Z, or move Z across that run; the sign is the same scaled by run length. Thus minimize number of separated runs among optimal orders and merge neighboring runs, without splitting any already contiguous other class (Z includes entire other classes). Iterate. Replace each equal-parent/equal-coefficient class by a job of duration multiplicity, mass c*m and internal offset c*m*(m-1)/2. Reversed tree exact density contraction from 1824 applies to arbitrary positive durations: choose maximal nonroot block density W/L, append immediately after its sole parent block; exchange across intervening blocks cannot increase cost (L_B W_C-L_C W_B<=0). Contract to preserve rooted tree; expand the group and reverse. The result is exact for fixed owner order; enumerate all owner orders for unrestricted optimum in this projection. Grouping is an explanation schedule optimization only; it does NOT identify mathematical propositions or remove witness records. Initial motifs use same full successor set + coefficient, then grouped by earliest owner + coefficient for each order; objective weights either one per typed role or distinct expression record counts. Full input preserves 53 owners, all 13312 role records including two structural records; the selected root-connected region is 13 owners and 600 opaque frontiers. Other 40 expanded owners are out of this view, NOT proved unreachable in full graph. Mutual metadata remains metadata. All source obligations, type/value/structural roles and witness IDs remain in original immutable input; no change to proof or axioms.
Complexity: P legal owner orders; grouping O(M*max degree + N) per order (rank array initialization and optional expansion); density scan O(G^2) for G grouped jobs, versus O(N^2) ungrouped; exponential/factorial P possible, no universal O(N). Score uses fixed pi/e*cos((sorted-index+1)*2pi/phi^2) added to ordinary out-degree centrality, only ready-set priority. No fitting. Readability proxies: total role/occurrence span, peak simultaneously live role edges and distinct prerequisites. Human reader study unmeasured; typed array payload excludes JS maps/arrays, runtime and GC overhead. V8 timing uses Date.now, not native process timings. No claim of URT superiority without comparisons.
Executed V8 results:
{
  "status": "PARTIAL_EXPORT_ROLE_PROJECTION_NOT_KERNEL_RECHECK",
  "full": {
    "owners": 53,
    "nodes": 3293,
    "records": 13312,
    "roles": {
      "type": 3077,
      "value": 10233,
      "structural": 2
    }
  },
  "root": {
    "owners": 13,
    "nodes": 613,
    "records": 906,
    "structural": 2,
    "unexpanded": 600
  },
  "checks": 46951,
  "negative": 8,
  "oracleCases": 72,
  "oracleOrders": 4442,
  "results": {
    "roles": {
      "motifs": 35,
      "rows": {
        "raw/ordinary": {
          "d": 206817,
          "wd": 216087,
          "peak": 645,
          "peakNodes": 436,
          "msPerRun": 38.15,
          "repeats": 20
        },
        "batch/ordinary": {
          "d": 105639,
          "wd": 108208,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.6,
          "repeats": 20
        },
        "grouped-tree/ordinary": {
          "d": 105639,
          "wd": 107819,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.5,
          "repeats": 20,
          "jobs": 39,
          "typedBytes": 3271
        },
        "raw/centrality": {
          "d": 277795,
          "wd": 287125,
          "peak": 751,
          "peakNodes": 457,
          "msPerRun": 34.85,
          "repeats": 20
        },
        "batch/centrality": {
          "d": 105639,
          "wd": 108208,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.6,
          "repeats": 20
        },
        "grouped-tree/centrality": {
          "d": 105639,
          "wd": 107819,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.4,
          "repeats": 20,
          "jobs": 39,
          "typedBytes": 3271
        },
        "raw/urt": {
          "d": 329916,
          "wd": 339612,
          "peak": 807,
          "peakNodes": 579,
          "msPerRun": 28.45,
          "repeats": 20
        },
        "batch/urt": {
          "d": 113160,
          "wd": 115745,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.6,
          "repeats": 20
        },
        "grouped-tree/urt": {
          "d": 108203,
          "wd": 110449,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.4,
          "repeats": 20,
          "jobs": 38,
          "typedBytes": 3250
        },
        "ungrouped-tree/ordinary": {
          "d": 105639,
          "wd": 107819,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 27,
          "repeats": 3,
          "jobs": 613,
          "typedBytes": 15325
        },
        "grouped-exact": {
          "d": 105109,
          "wd": 107099,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 12844,
          "repeats": 1,
          "jobs": 38,
          "typedBytes": 3250,
          "paths": 47520,
          "minJobs": 37,
          "maxJobs": 44,
          "maxTypedBytes": 3376,
          "ownerOrder": [
            341050,
            341183,
            341189,
            11307205,
            13125899,
            14065050,
            11298208,
            550021,
            13125901,
            14065051,
            14065052,
            14065053,
            14065054
          ]
        }
      }
    },
    "weighted": {
      "motifs": 38,
      "rows": {
        "raw/ordinary": {
          "d": 206817,
          "wd": 216087,
          "peak": 645,
          "peakNodes": 436,
          "msPerRun": 35.25,
          "repeats": 20
        },
        "batch/ordinary": {
          "d": 105662,
          "wd": 107777,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.6,
          "repeats": 20
        },
        "grouped-tree/ordinary": {
          "d": 105661,
          "wd": 107777,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.4,
          "repeats": 20,
          "jobs": 40,
          "typedBytes": 3292
        },
        "raw/centrality": {
          "d": 277795,
          "wd": 287125,
          "peak": 751,
          "peakNodes": 457,
          "msPerRun": 33.65,
          "repeats": 20
        },
        "batch/centrality": {
          "d": 105662,
          "wd": 107777,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.6,
          "repeats": 20
        },
        "grouped-tree/centrality": {
          "d": 105661,
          "wd": 107777,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.4,
          "repeats": 20,
          "jobs": 40,
          "typedBytes": 3292
        },
        "raw/urt": {
          "d": 329916,
          "wd": 339612,
          "peak": 807,
          "peakNodes": 579,
          "msPerRun": 28.7,
          "repeats": 20
        },
        "batch/urt": {
          "d": 113183,
          "wd": 115314,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.6,
          "repeats": 20
        },
        "grouped-tree/urt": {
          "d": 108227,
          "wd": 110407,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 0.4,
          "repeats": 20,
          "jobs": 38,
          "typedBytes": 3250
        },
        "ungrouped-tree/ordinary": {
          "d": 105661,
          "wd": 107777,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 29.666666666666668,
          "repeats": 3,
          "jobs": 613,
          "typedBytes": 15325
        },
        "grouped-exact": {
          "d": 105137,
          "wd": 107057,
          "peak": 497,
          "peakNodes": 339,
          "msPerRun": 12953,
          "repeats": 1,
          "jobs": 38,
          "typedBytes": 3250,
          "paths": 47520,
          "minJobs": 37,
          "maxJobs": 44,
          "maxTypedBytes": 3376,
          "ownerOrder": [
            341050,
            341183,
            341189,
            11307205,
            13125899,
            14065050,
            11298208,
            550021,
            13125901,
            14065051,
            14065052,
            14065053,
            14065054
          ]
        }
      }
    }
  }
}
Replay: node certificate.mjs solution_frontier_roles.json solution_direct_roles.json. Exact same function; requires matching input blobs. CLI RSS includes process overhead. Negative tests reject scope/role/witness corruption, cycles, and dropped nodes. Exhaustive oracle is synthetic graph mathematics only. The prior 76-node exact theorem is extended only to the observed root projection. No proof completion or physical gate change.
RESUME HERE: extend this grouped exact scheduler to the next authenticated root-connected owner projection, cap owner permutation enumeration explicitly and compare deterministic frontier-priority against grouped tree if cap exceeded; never represent the cap as exact. Preserve the full role ledger. HANDOFF TO dependencies, audit, integration, kernel, acceleration and editor. Project OPEN.
*/
function run(A,B,clock){
 let checks=0,negative=0;
 const ck=(p,m)=>{if(!p)throw Error(m);checks++}, J=JSON.stringify;
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";
 for(const r of [A,B])ck(r.digest===digest&&r.bytes===61570595788&&r.n===1065214335&&r.root===14065054&&r.indexedDeclarations===1484733,"archive");
 ck(A.pin===pin&&A.reports.length===47&&B.reports.length===6,"reports");
 const own=new Map(), identities=new Map(), records=[],roles={type:0,value:0,structural:0};
 function ident(id,parts,kind){const k=J([parts,kind]);ck(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length>0&&(!identities.has(id)||identities.get(id)===k),"identity");identities.set(id,k)}
 for(const z of [...B.reports,...A.reports]){
  ck(!own.has(z.id)&&z.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK","owner");own.set(z.id,z);
  ident(z.id,(z.request??z.source).name.split("."),z.kind);
  ck(z.type&&((z.kind==="ctor")?z.value===null:!!z.value),"role shape");
  for(const role of ["type","value"]){const t=z[role];if(!t)continue;let sum=0;const seen=new Set();
   for(const [index,e] of t.references.entries()){
    ident(e.target,e.nameParts,e.targetKind);const k=J([e.kind,e.target]);ck(!seen.has(k)&&["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=t.expressionRoot&&Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"typed witness");seen.add(k);sum+=e.distinctExpressionRecords;records.push({a:e.target,b:z.id,role,index,w:e.distinctExpressionRecords,raw:e});roles[role]++;
   }ck(sum===t.referenceOccurrences,"role count");
  }
  for(const [index,e] of (z.structural??[]).entries()){ident(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1&&z.encodedRootsAndStructuralEdges[e.edgeIndex]===e.encoded,"structural witness");records.push({a:e.target,b:z.id,role:"structural",index,w:1,raw:e});roles.structural++}
 }
 ck(records.length===13312&&own.size===53&&identities.size===3293&&J(roles)===J({type:3077,value:10233,structural:2}),"full census");
 const byOwner=new Map([...own.keys()].map(x=>[x,[]]));for(const e of records)byOwner.get(e.b).push(e);
 const reachable=new Set([A.root]),todo=[A.root];for(let i=0;i<todo.length;i++)for(const e of byOwner.get(todo[i])??[])if(!reachable.has(e.a)){reachable.add(e.a);todo.push(e.a)}
 const ids=[...reachable].sort((a,b)=>a-b),ix=new Map(ids.map((x,i)=>[x,i])),owners=ids.filter(x=>own.has(x)).map(x=>ix.get(x)),rs=records.filter(e=>reachable.has(e.b));
 ck(ids.length===613&&owners.length===13&&rs.length===906,"root census");
 const edges=rs.map(e=>[ix.get(e.a),ix.get(e.b),e.w]);
 const original=new Map(rs.map(e=>[J([e.b,e.role,e.index]),J(e.raw)]));
 ck(original.size===rs.length,"record slots");
 function fidelity(q,rows=rs){const pos=new Map(q.map((x,i)=>[ids[x],i])),seen=new Set();ck(q.length===ids.length&&pos.size===ids.length&&rows.length===rs.length,"view size");for(const e of rows){const k=J([e.b,e.role,e.index]);ck(!seen.has(k)&&original.get(k)===J(e.raw)&&pos.get(e.a)<pos.get(e.b),"role fidelity");seen.add(k)}}
 function model(n,oo,ee,weighted){
  const O=new Set(oo),P=Array.from({length:n},()=>new Set()),S=Array.from({length:n},()=>new Set()),w=new Int32Array(n);
  for(const [a,b,v] of ee){if(a===b||!O.has(b)||v<=0)throw Error("outtree scope");P[b].add(a);S[a].add(b);const t=weighted?v:1;w[a]+=t;w[b]-=t}
  if([...Array(n).keys()].some(a=>!O.has(a)&&!S[a].size))throw Error("orphan leaf");
  const motifs=new Map();for(let a=0;a<n;a++)if(!O.has(a)){const targets=[...S[a]].sort((x,y)=>x-y),k=J([w[a],targets]);if(!motifs.has(k))motifs.set(k,{w:w[a],targets,ids:[]});motifs.get(k).ids.push(a)}
  const M=[...motifs.values()],OP=oo.map(a=>[...P[a]].filter(x=>O.has(x))),idx=new Map(oo.map((x,i)=>[x,i]));
  const mask=OP.map(p=>p.reduce((s,a)=>s|1<<idx.get(a),0));
  function metric(q){const rank=new Int32Array(n).fill(-1);if(q.length!==n)throw Error("length");q.forEach((a,i)=>{if(a<0||a>=n||rank[a]>=0)throw Error("duplicate");rank[a]=i});let d=0,wd=0;const diff=new Int32Array(n+1),open=new Int32Array(n+1);for(const [a,b,v] of ee){const t=rank[b]-rank[a];if(t<=0)throw Error("topology");d+=t;wd+=v*t;diff[rank[a]]++;diff[rank[b]]--}for(let a=0;a<n;a++)if(S[a].size){let last=-1;for(const b of S[a])last=Math.max(last,rank[b]);open[rank[a]]++;open[last]--}let r=0,l=0,peak=0,peakNodes=0;for(let i=0;i<n;i++){r+=diff[i];l+=open[i];peak=Math.max(peak,r);peakNodes=Math.max(peakNodes,l)}return {d,wd,peak,peakNodes}}
  const phi=(1+Math.sqrt(5))/2,theta=2*Math.PI/phi**2,kappa=Math.PI/Math.E;
  function kahn(mode,core){const active=core?oo:[...Array(n).keys()],ind=new Int32Array(n),score=new Float64Array(n),ready=[],out=[];for(const i of active){ind[i]=core?[...P[i]].filter(x=>O.has(x)).length:P[i].size;score[i]=mode==="ordinary"?0:S[i].size+(mode==="urt"?kappa*Math.cos((i+1)*theta):0);if(!ind[i])ready.push(i)}while(ready.length){let j=0;for(let k=1;k<ready.length;k++)if(score[ready[k]]>score[ready[j]]||score[ready[k]]===score[ready[j]]&&ready[k]<ready[j])j=k;const x=ready[j];ready[j]=ready.at(-1);ready.pop();out.push(x);for(const y of S[x])if(--ind[y]===0)ready.push(y)}if(out.length!==active.length)throw Error("cycle");return out}
  function batch(order){const seen=new Set(),out=[];for(const o of order){for(const a of [...P[o]].filter(a=>!O.has(a)&&!seen.has(a)).sort((a,b)=>w[a]-w[b]||a-b)){out.push(a);seen.add(a)}out.push(o)}return out}
  // A fixed owner order induces the reversed out-tree. Combine terminal leaves
  // of equal coefficient and parent into a job of length multiplicity.
  function solve(order,group=true,expand=true){
   const m=order.length,rank=new Int32Array(n).fill(-1);order.forEach((x,i)=>rank[x]=i);
   for(const o of order)for(const a of P[o])if(O.has(a)&&rank[a]>=rank[o])throw Error("bad owner order");
   const members=order.map(x=>[x]),parent=order.map((_,i)=>i+1),coef=order.map(x=>w[x]),count=order.map(()=>1),lookup=new Map();
   for(const motif of M){let p=m;for(const t of motif.targets)p=Math.min(p,rank[t]);if(p<0||p>=m)throw Error("earliest parent");
    if(group){const k=p+":"+motif.w;let j=lookup.get(k);if(j===undefined){j=count.length;lookup.set(k,j);parent.push(p);coef.push(motif.w);count.push(0);members.push([])}count[j]+=motif.ids.length;if(expand)members[j].push(...motif.ids)}
    else for(const a of motif.ids){parent.push(p);coef.push(motif.w);count.push(1);members.push([a])}
   }
   const k=count.length,root=m-1,rep=Int32Array.from({length:k},(_,i)=>i),tail=Int32Array.from(rep),next=new Int32Array(k).fill(-1),mass=Int32Array.from(count,(c,i)=>c*coef[i]),len=Int32Array.from(count),active=new Uint8Array(k).fill(1);
   function find(x){while(rep[x]!==x){rep[x]=rep[rep[x]];x=rep[x]}return x}
   for(let t=1;t<k;t++){let b=-1;for(let i=0;i<k;i++)if(active[i]&&i!==root&&(b<0||mass[i]*len[b]>mass[b]*len[i]))b=i;if(b<0)throw Error("no block");const a=find(parent[b]);if(a===b||!active[a])throw Error("parent");next[tail[a]]=b;tail[a]=tail[b];mass[a]+=mass[b];len[a]+=len[b];rep[b]=a;active[b]=0}
   let pos=0,cost=0;const q=[];for(let j=root;j!==-1;j=next[j]){const c=count[j];cost+=coef[j]*(c*pos+c*(c-1)/2);pos+=c;if(expand)for(const x of members[j])q.push(x)}
   if(pos!==n)throw Error("bad expansion");
   return {cost,order:expand?q.reverse():undefined,jobs:k,typedBytes:rank.byteLength+rep.byteLength+tail.byteLength+next.byteLength+mass.byteLength+len.byteLength+active.byteLength}
  }
  function exact(){if(oo.length>20)throw Error("owner enumeration scope");let best=Infinity,bestOrder,paths=0,minJobs=Infinity,maxJobs=0,maxTypedBytes=0;const q=[],all=(1<<oo.length)-1;
   function visit(s){if(s===all){paths++;const r=solve(q,true,false);minJobs=Math.min(minJobs,r.jobs);maxJobs=Math.max(maxJobs,r.jobs);maxTypedBytes=Math.max(maxTypedBytes,r.typedBytes);if(r.cost<best){best=r.cost;bestOrder=q.slice()}return}
    for(let i=0;i<oo.length;i++)if(!(s&(1<<i))&&(mask[i]&s)===mask[i]){q.push(oo[i]);visit(s|(1<<i));q.pop()}}
   visit(0);if(!bestOrder)throw Error("no order");const r=solve(bestOrder,true,true);if(r.cost!==best)throw Error("exact reconstruction");return {...r,paths,minJobs,maxJobs,maxTypedBytes,ownerOrder:bestOrder}
  }
  function brute(){let best=Infinity,paths=0;const q=[],s=new Set();function rec(){if(q.length===n){paths++;const r=metric(q);best=Math.min(best,weighted?r.wd:r.d);return}for(let a=0;a<n;a++)if(!s.has(a)&&[...P[a]].every(b=>s.has(b))){s.add(a);q.push(a);rec();q.pop();s.delete(a)}}rec();return {best,paths}}
  return {metric,kahn,batch,solve,exact,brute,motifCount:M.length};
 }
 const results={};
 for(const weighted of [false,true]){
  const M=model(ids.length,owners,edges,weighted),key=weighted?"wd":"d",rows={};
  function bench(name,f,n=20){const t=clock();let r;for(let i=0;i<n;i++)r=f();const elapsed=clock()-t;const q=r.order??r,metrics=M.metric(q);if(r.cost!==undefined)ck(r.cost===metrics[key],"objective equality");fidelity(q);rows[name]={...metrics,msPerRun:elapsed/n,repeats:n,jobs:r.jobs,typedBytes:r.typedBytes,paths:r.paths,minJobs:r.minJobs,maxJobs:r.maxJobs,maxTypedBytes:r.maxTypedBytes,ownerOrder:r.ownerOrder?.map(i=>ids[i])};return r}
  for(const mode of ["ordinary","centrality","urt"]){
   bench("raw/"+mode,()=>M.kahn(mode,false));
   bench("batch/"+mode,()=>M.batch(M.kahn(mode,true)));
   bench("grouped-tree/"+mode,()=>M.solve(M.kahn(mode,true),true,true));
   const g=M.solve(M.kahn(mode,true),true),u=M.solve(M.kahn(mode,true),false);ck(g.cost===u.cost&&M.metric(u.order)[key]===g.cost,"ungrouped native control");
  }
  bench("ungrouped-tree/ordinary",()=>M.solve(M.kahn("ordinary",true),false,true),3);
  const exact=bench("grouped-exact",()=>M.exact(),1);ck(exact.paths===47520&&Object.values(rows).every(r=>r[key]>=exact.cost),"global search");
  results[weighted?"weighted":"roles"]={motifs:M.motifCount,rows};
 }
 // Exhaustive independent all-node oracle on deterministic small graphs, including
 // repeated terminal motifs and unequal occurrence weights.
 let seed=20261124,oracleCases=0,oracleOrders=0;const rand=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed};
 for(let t=0;t<36;t++){
  const m=2+t%3,n=m+3,oo=Array.from({length:m},(_,i)=>i+3),ee=[];
  for(let a=0;a<3;a++){ee.push([a,oo[rand()%m],1+rand()%4]);for(const b of oo)if(rand()%3===0)ee.push([a,b,1+rand()%4])}
  if(t%3===0)for(const e of ee.filter(e=>e[0]===0)){ee.push([1,e[1],e[2]])}
  for(const a of oo)for(const b of oo)if(a<b&&rand()%3===0)ee.push([a,b,1+rand()%4]);
  for(const weighted of [false,true]){const M=model(n,oo,ee,weighted),r=M.exact(),b=M.brute();ck(r.cost===b.best&&M.metric(r.order)[weighted?"wd":"d"]===b.best,"exhaustive oracle");oracleCases++;oracleOrders+=b.paths}
 }
 const M=model(ids.length,owners,edges,false),q=M.solve(M.kahn("ordinary",true)).order;
 const reject=f=>{let bad=false;try{f()}catch(e){bad=true}ck(bad,"negative accepted");negative++};
 reject(()=>fidelity(q.slice(1)));reject(()=>fidelity(q.slice().reverse()));reject(()=>fidelity(q,rs.slice(1)));
 for(const field of ["witnessExpression","targetKind","distinctExpressionRecords"]){const copy=JSON.parse(J(rs));const t=copy.find(e=>e.role==="type");t.raw[field]=null;reject(()=>fidelity(q,copy))}
 const copy=JSON.parse(J(rs));copy[0].role="structural";reject(()=>fidelity(q,copy));
 reject(()=>model(3,[1,2],[[0,1,1],[1,2,1],[2,1,1]],false).exact());
 return {status:"PARTIAL_EXPORT_ROLE_PROJECTION_NOT_KERNEL_RECHECK",full:{owners:own.size,nodes:identities.size,records:records.length,roles},root:{owners:owners.length,nodes:ids.length,records:rs.length,structural:rs.filter(e=>e.role==="structural").length,unexpanded:ids.length-owners.length},checks,negative,oracleCases,oracleOrders,results};
}
import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
const [a,b]=process.argv.slice(2);if(!a||!b)throw Error("usage: node certificate.mjs solution_frontier_roles.json solution_direct_roles.json");
function read(p,sha,sha256){const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob mismatch");if(sha256&&crypto.createHash("sha256").update(b).digest("hex")!==sha256)throw Error("SHA256 mismatch");return JSON.parse(b)}
const r=run(read(a,"d49fbcc22a2382039986b09ff91dd11af2ef2e7b","9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6"),read(b,"64b935e4ef309f6c555912a377012c7708eda510"),()=>performance.now());r.maxRssKiB=process.resourceUsage().maxRSS;console.log(JSON.stringify(r,null,2));
