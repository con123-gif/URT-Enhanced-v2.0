/* STRUCTURE 2026-11-25 00:24 UTC — PARTIAL. One contribution: dynamic successor-signature release, exactly preserving ordinary/centrality/URT individual ready priorities on the expanded five-report graph.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc refetched; current upstream main b2f365a68500e2bde98cd60a2324263fc62fba10 differs, not adopted. Previous structure ca5a04dd495f93149e6db6018d6b9c01f9a95706; dependency reconciliation 84f21851ddf1a3259b4f713674c39ffe08da6047. Read SWARM_PROTOCOL first, AGENTS, state excerpt, runner log/protocol, continuity, handoff, peer checkpoints integration e169d46, audit dbb81da, math ac54d32, kernel d543273, recent acceleration commit list, CI #404 PASS (45512681764; not Lean verification). Root log/protocol 404 corrected to runner paths. Blueprint not reread; no blueprint claims used. Branch head before create f7e96446c6e8c3b5be6aaa1e33ab43d50e3a37a7. No physics edits.
Inputs on cathedral-research-state: compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json; compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json; compute/rh-next-root-roles-20261124/outputs/solution_next_root_roles.json; compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json; compute/rh-34-producer-frontier-20261124/outputs/report identified by fifth exact blob SHA. Five exact blob IDs below, retrieved via GitHub blob endpoint and internal validation; byte hashes not independently recomputed in V8. Native CLI hashes input bytes before running.
Proof: partition vertices by exact outgoing neighbor set. For each class C and successor v in S(C), every member of C is a predecessor of v. Thus at any step v is ready iff all its predecessor classes have no remaining members. Decrement its group-indegree only when the final member of each class is emitted. Inductively the ready set equals ordinary Kahn's at every step, so identical deterministic priority yields identical order, without forced contiguity. No mathematical propositions merged, no role records discarded. Grouping empty successor sets is safe (no releases). A counterexample to first-member release is 0->1 and 2->1, where 1 must not precede 2. Earlier compulsory contiguity has worse locality on 67 tiny controls; dynamic release avoids that specific restriction but cannot improve the same baseline order. Exact release update count drops from sum |S(C)|*|C| to sum |S(C)|. Heap remains per vertex, O((V+E_group) log V) loose bound; more tightly O(V log V+E_group), plus signature construction O(sum d log d+V+E). No universal linear-time proof optimizer.
Executed in V8, Date.now ms, 5 warmups and 30 rotated repeats; preparation separately measured, excludes input retrieval and verification. Typed working arrays and persistent typed prep arrays counted, not JS object allocation or process RSS; native CLI additionally prints aggregate peak RSS, not per method. Readability proxies only (span, weighted span, peak open records), exactly equal within paired priorities; human reader study not performed. Lean kernel/axiom replay not performed. Failed/negative attempts: early release, reversed schedule, missing typed record, mutated RHS role, true expression cycles; grouping does not guarantee elapsed-time gain. Baseline uses the same singleton-release code path, not fastest possible native Kahn. Report projection is partial; all original 18,570 typed records conserved.
Observed V8 output:
{
  "status": "PARTIAL_EXPORT_NOT_KERNEL_RECHECK",
  "checks": 258076,
  "negative": 9,
  "counts": {
    "type": 4194,
    "value": 14335,
    "package": 37,
    "rhs": 4
  },
  "owners": 176,
  "identities": 4301,
  "rootMixed": 1539,
  "rootExpression": 1531,
  "result": {
    "rootMixed": {
      "nodes": 1539,
      "records": 4042,
      "groups": 355,
      "rawArcs": 3441,
      "groupArcs": 1659,
      "build": {
        "raw": 4,
        "dynamic": 2
      },
      "rows": {
        "ordinaryRaw": {
          "span": 2265721,
          "weighted": 2320830,
          "peak": 2264,
          "records": 4042,
          "updates": 3441,
          "workBytes": 36936,
          "prepTypedBytes": 18468,
          "meanMs": 4.1
        },
        "ordinaryDynamic": {
          "span": 2265721,
          "weighted": 2320830,
          "peak": 2264,
          "records": 4042,
          "updates": 1659,
          "workBytes": 32200,
          "prepTypedBytes": 13732,
          "meanMs": 3.8666666666666667
        },
        "centralityRaw": {
          "span": 3069041,
          "weighted": 3133201,
          "peak": 2851,
          "records": 4042,
          "updates": 3441,
          "workBytes": 36936,
          "prepTypedBytes": 18468,
          "meanMs": 4.2
        },
        "centralityDynamic": {
          "span": 3069041,
          "weighted": 3133201,
          "peak": 2851,
          "records": 4042,
          "updates": 1659,
          "workBytes": 32200,
          "prepTypedBytes": 13732,
          "meanMs": 3.966666666666667
        },
        "urtRaw": {
          "span": 3973525,
          "weighted": 4059458,
          "peak": 3133,
          "records": 4042,
          "updates": 3441,
          "workBytes": 36936,
          "prepTypedBytes": 18468,
          "meanMs": 3.9
        },
        "urtDynamic": {
          "span": 3973525,
          "weighted": 4059458,
          "peak": 3133,
          "records": 4042,
          "updates": 1659,
          "workBytes": 32200,
          "prepTypedBytes": 13732,
          "meanMs": 3.7333333333333334
        }
      }
    },
    "all": {
      "nodes": 4301,
      "records": 18570,
      "groups": 1138,
      "rawArcs": 15028,
      "groupArcs": 9378,
      "build": {
        "raw": 8,
        "dynamic": 6
      },
      "rows": {
        "ordinaryRaw": {
          "span": 41386256,
          "weighted": 42056809,
          "peak": 15375,
          "records": 18570,
          "updates": 15028,
          "workBytes": 103224,
          "prepTypedBytes": 51612,
          "meanMs": 13.366666666666667
        },
        "ordinaryDynamic": {
          "span": 41386256,
          "weighted": 42056809,
          "peak": 15375,
          "records": 18570,
          "updates": 9378,
          "workBytes": 90572,
          "prepTypedBytes": 38960,
          "meanMs": 12.6
        },
        "centralityRaw": {
          "span": 56850513,
          "weighted": 57627215,
          "peak": 16155,
          "records": 18570,
          "updates": 15028,
          "workBytes": 103224,
          "prepTypedBytes": 51612,
          "meanMs": 13.3
        },
        "centralityDynamic": {
          "span": 56850513,
          "weighted": 57627215,
          "peak": 16155,
          "records": 18570,
          "updates": 9378,
          "workBytes": 90572,
          "prepTypedBytes": 38960,
          "meanMs": 12.533333333333333
        },
        "urtRaw": {
          "span": 60749995,
          "weighted": 61602975,
          "peak": 17067,
          "records": 18570,
          "updates": 15028,
          "workBytes": 103224,
          "prepTypedBytes": 51612,
          "meanMs": 12.533333333333333
        },
        "urtDynamic": {
          "span": 60749995,
          "weighted": 61602975,
          "peak": 17067,
          "records": 18570,
          "updates": 9378,
          "workBytes": 90572,
          "prepTypedBytes": 38960,
          "meanMs": 12.133333333333333
        }
      }
    }
  },
  "controls": {
    "graphs": 2198,
    "comparisons": 6594,
    "noncontiguous": 1754,
    "example": {
      "n": 3,
      "edges": [
        [
          0,
          1
        ]
      ],
      "mode": "urt",
      "order": [
        2,
        0,
        1
      ],
      "groups": [
        [
          1
        ],
        [
          2,
          0
        ]
      ]
    }
  }
}
RESUME HERE: retrieve next 151-target post34 frontier (compute/rh-post34-frontier-20261125/outputs/solution_post34_frontier.json) when available; benchmark a compact CSR signature release representation in a native process with per-method peak RSS and preparation-inclusive timings. HANDOFF TO dependency, acceleration, integration, audit. Full human proof OPEN.
*/
function experiment(docs,clock=()=>Date.now(),reps=30){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",root=14065054,J=JSON.stringify,phi=(1+Math.sqrt(5))/2,kappa=Math.PI/Math.E,theta=2*Math.PI/phi**2;
 let checks=0,negative=0;const ck=(v,m)=>{if(!v)throw Error(m);checks++};function reject(f){let bad=false;try{f()}catch{bad=true}ck(bad,"control accepted");negative++}
 const ids=new Map(),names=new Map(),owners=new Set(),records=[],counts={type:0,value:0,package:0,rhs:0};
 function ident(id,parts,kind){const key=J([parts,kind]),name=J(parts);ck(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length&&typeof kind==="string"&&(!ids.has(id)||ids.get(id)===key)&&(!names.has(name)||names.get(name)===id),"identity");ids.set(id,key);names.set(name,id)}
 for(const [i,d] of docs.entries()){
  ck(d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&d.bytes===61570595788&&d.n===1065214335&&d.root===root&&d.indexedDeclarations===1484733&&d.reports.length===[6,47,18,71,34][i]&&(i===0||d.pin===pin),"report identity");
  for(const r of d.reports){ck(!owners.has(r.id)&&r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK","owner");owners.add(r.id);ident(r.id,(r.request??r.source).name.split("."),r.kind);
   ck(r.type&&(["thm","def","opaque"].includes(r.kind)?!!r.value:r.value===null),"shape");const encoded=r.encodedRootsAndStructuralEdges,first=r.value?2:1;
   if(encoded)ck(encoded.length===first+(r.structural??[]).length&&encoded[0]===r.type.expressionRoot+1&&(!r.value||encoded[1]===r.value.expressionRoot+1),"slots");else ck(i===0&&!(r.structural??[]).length,"legacy");
   function add(t,role,slot){let sum=0;const seen=new Set();ck(Number.isSafeInteger(t.expressionRoot)&&t.expressionRoot>=0&&t.expressionRoot<d.n,"expr root");for(const [index,e] of t.references.entries()){ident(e.target,e.nameParts,e.targetKind);const k=J([e.kind,e.target]);ck(!seen.has(k)&&["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=t.expressionRoot&&Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"witness");seen.add(k);sum+=e.distinctExpressionRecords;records.push({a:e.target,b:r.id,role,slot,index,w:e.distinctExpressionRecords,expressionRoot:t.expressionRoot,raw:e});counts[role]++}ck(sum===t.referenceOccurrences,"occurrence count")}
   add(r.type,"type",0);if(r.value)add(r.value,"value",1);
   for(const [j,e] of (r.structural??[]).entries()){const slot=first+j;ck(e.edgeIndex===slot&&encoded[slot]===e.encoded&&e.encoded!==0,"structural");if(e.encoded<0){ident(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1,"structural target");records.push({a:e.target,b:r.id,role:"package",slot,index:0,w:1,raw:e});counts.package++}else{ck(r.kind==="rec"&&e.kind==="recursor_rule_rhs"&&e.expression.expressionRoot+1===e.encoded,"rhs");add(e.expression,"rhs",slot)}}
  }
 }
 ck(owners.size===176&&ids.size===4301&&J(counts)===J({type:4194,value:14335,package:37,rhs:4}),"census");
 const recordKey=e=>J([e.b,e.role,e.slot,e.index]),ledger=new Map(records.map(e=>[recordKey(e),J(e)]));ck(ledger.size===records.length,"ledger uniqueness");
 const by=new Map();for(const e of records){if(!by.has(e.b))by.set(e.b,[]);by.get(e.b).push(e)}
 function reach(allow){const q=[root],s=new Set(q);for(let i=0;i<q.length;i++)for(const e of by.get(q[i])??[])if(allow(e)&&!s.has(e.a)){s.add(e.a);q.push(e.a)}return s}
 const mixed=reach(()=>true),expr=reach(e=>e.role!=="package");ck(mixed.size===1539&&expr.size===1531,"reach");
 function graph(nodes,rs){const ni=[...nodes].sort((a,b)=>a-b),ix=new Map(ni.map((v,i)=>[v,i])),A=Array.from(ni,()=>new Set());for(const e of rs){if(e.role==="package")continue;const a=ix.get(e.a),b=ix.get(e.b);if(a===undefined||b===undefined||a===b)throw Error("bad expression edge");A[a].add(b)}return {ni,ix,A,rs}}
 // Each successor of a signature class depends on every member; release it only on last emission.
 function prep(g,grouped){const n=g.ni.length,of=new Int32Array(n),parts=[],targets=[],map=new Map(),ind=new Int32Array(n);
  for(let i=0;i<n;i++){const a=[...g.A[i]].sort((a,b)=>a-b),key=grouped?"s:"+a.join(","):"i:"+i;let j=map.get(key);if(j===undefined){j=parts.length;map.set(key,j);parts.push([]);targets.push(a);for(const v of a)ind[v]++}parts[j].push(i);of[i]=j}
  for(let i=0;i<n;i++){ck(J([...g.A[i]].sort((a,b)=>a-b))===J(targets[of[i]]),"exact successor signature")}
  const sz=Int32Array.from(parts,p=>p.length);return {g,of,targets,sz,ind,arcs:targets.reduce((s,a)=>s+a.length,0)}
 }
 function schedule(p,mode){const {g,of,targets,sz,ind}=p,n=g.ni.length,left=sz.slice(),d=ind.slice(),heap=new Int32Array(n),out=new Int32Array(n),score=Float64Array.from(g.ni,(_,i)=>mode==="ordinary"?0:g.A[i].size+(mode==="urt"?kappa*Math.cos((i+1)*theta):0));let size=0,k=0,updates=0;
  const better=(a,b)=>score[a]>score[b]||score[a]===score[b]&&a<b;
  function push(x){let i=size++;while(i){let t=(i-1)>>1;if(!better(x,heap[t]))break;heap[i]=heap[t];i=t}heap[i]=x}
  function pop(){const x=heap[0],v=heap[--size];if(size){let i=0;while(2*i+1<size){let j=2*i+1;if(j+1<size&&better(heap[j+1],heap[j]))j++;if(!better(heap[j],v))break;heap[i]=heap[j];i=j}heap[i]=v}return x}
  for(let i=0;i<n;i++)if(!d[i])push(i);while(size){const v=pop();out[k++]=g.ni[v];if(--left[of[v]]===0)for(const w of targets[of[v]]){updates++;if(--d[w]===0)push(w)}}if(k!==n)throw Error("expression cycle");
  return {out,updates,workBytes:left.byteLength+d.byteLength+heap.byteLength+out.byteLength+score.byteLength,prepTypedBytes:of.byteLength+sz.byteLength+ind.byteLength};
 }
 function metric(g,out,verify=false,expected=g.rs){const n=g.ni.length,rank=new Int32Array(n).fill(-1),diff=new Int32Array(n+1);if(out.length!==n)throw Error("length");
  for(const [i,v] of out.entries()){const j=g.ix.get(v);if(j===undefined||rank[j]!==-1)throw Error("permutation");rank[j]=i}
  let span=0,weighted=0,peak=0,open=0;const seen=new Set();
  for(const e of g.rs){if(verify){const k=recordKey(e);ck(!seen.has(k)&&ledger.get(k)===J(e),"typed record fidelity");seen.add(k)}const a=rank[g.ix.get(e.a)],b=rank[g.ix.get(e.b)];if(e.role==="package")continue;if(a>=b)throw Error("expression precedence");span+=b-a;weighted+=(b-a)*e.w;diff[a]++;diff[b]--}
  if(verify)ck(seen.size===expected.length&&expected.every(e=>seen.has(recordKey(e))),"record conservation");for(let i=0;i<n;i++){open+=diff[i];peak=Math.max(peak,open)}return {span,weighted,peak,records:g.rs.length};
 }
 const result={};const modes=["ordinary","centrality","urt"];for(const [scope,nodes] of [["rootMixed",mixed],["all",new Set(ids.keys())]]){
  const rs=records.filter(e=>nodes.has(e.b)),g=graph(nodes,rs),build={},ps=[];for(const grouped of [false,true]){const t=clock();ps.push(prep(g,grouped));build[grouped?"dynamic":"raw"]=clock()-t}
  const cases=modes.flatMap(mode=>[0,1].map(p=>({mode,p,key:mode+(p?"Dynamic":"Raw")}))),times=Object.fromEntries(cases.map(c=>[c.key,[]])),last={};
  for(const c of cases)for(let j=0;j<5;j++)schedule(ps[c.p],c.mode);
  for(let j=0;j<reps;j++)for(let i=0;i<cases.length;i++){const c=cases[(i+j)%cases.length],t=clock();last[c.key]=schedule(ps[c.p],c.mode);times[c.key].push(clock()-t)}
  const rows={};for(const c of cases){const {out,...stats}=last[c.key];rows[c.key]={...metric(g,out,true),...stats,meanMs:times[c.key].reduce((a,b)=>a+b,0)/reps};ck(J([...out])===J([...schedule(ps[c.p],c.mode).out]),"determinism")}
  for(const mode of modes){ck(J([...last[mode+"Raw"].out])===J([...last[mode+"Dynamic"].out]),"exact raw priority equivalence");ck(last[mode+"Dynamic"].updates===ps[1].arcs&&last[mode+"Raw"].updates===ps[0].arcs,"arc census")}
  const order=last.ordinaryRaw.out;reject(()=>metric(g,[...order].reverse(),true));reject(()=>metric({...g,rs:rs.slice(1)},order,true,rs));const rhs=rs.find(e=>e.role==="rhs");if(rhs)reject(()=>metric({...g,rs:rs.map(e=>e===rhs?{...e,role:"value"}:e)},order,true,rs));
  result[scope]={nodes:nodes.size,records:rs.length,groups:ps[1].sz.length,rawArcs:ps[0].arcs,groupArcs:ps[1].arcs,build,rows};
 }
 let graphs=0,comparisons=0,noncontiguous=0,example=null;
 // Exhaust all forward-labelled DAGs n<=5, plus reverse relabelling to exercise nontrivial ready order.
 for(let n=1;n<=5;n++){const possible=[];for(let a=0;a<n;a++)for(let b=a+1;b<n;b++)possible.push({a,b,role:"value",w:1});for(let mask=0;mask<2**possible.length;mask++){const es=possible.filter((_,i)=>mask&(1<<i));for(const rev of [false,true]){const rs=rev?es.map(e=>({...e,a:n-1-e.a,b:n-1-e.b})):es,g=graph(Array.from({length:n},(_,i)=>i),rs),p=prep(g,false),q=prep(g,true);graphs++;for(const mode of modes){const a=schedule(p,mode),b=schedule(q,mode);ck(J([...a.out])===J([...b.out]),"small graph equivalence");metric(g,b.out);comparisons++;const rank=new Map([...b.out].map((v,i)=>[v,i]));const lists=Array.from(q.sz,()=>[]);for(let i=0;i<n;i++)lists[q.of[i]].push(rank.get(i));if(lists.some(l=>Math.max(...l)-Math.min(...l)+1!==l.length)){noncontiguous++;if(!example)example={n,edges:rs.map(e=>[e.a,e.b]),mode,order:[...b.out],groups:lists}}}}}}
 ck(noncontiguous>0,"interleaving exercised");
 const cycle=graph([0,1],[{a:0,b:1,role:"value",w:1},{a:1,b:0,role:"value",w:1}]);for(const flag of [false,true])reject(()=>schedule(prep(cycle,flag),"ordinary"));
 // Unsafe early release: a,b -> c; emitting a alone cannot make c ready.
 const toy=graph([0,1,2],[{a:0,b:1,role:"value",w:1},{a:2,b:1,role:"value",w:1}]);reject(()=>metric(toy,[0,1,2]));ck(J([...schedule(prep(toy,true),"ordinary").out])===J([0,2,1]),"last member guard");
 ck(records.every(e=>ledger.get(recordKey(e))===J(e)),"unmodified ledger");
 return {status:"PARTIAL_EXPORT_NOT_KERNEL_RECHECK",checks,negative,counts,owners:owners.size,identities:ids.size,rootMixed:mixed.size,rootExpression:expr.size,result,controls:{graphs,comparisons,noncontiguous,example}};
}
import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","deabbd86afc8f21d9897ba3bb74349178517fde3"];
const args=process.argv.slice(2);if(args.length!==5)throw Error("usage: node certificate.mjs direct.json frontier.json next.json literature.json producers34.json");
const docs=args.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==hashes[i])throw Error("blob mismatch "+p);return JSON.parse(b)});
const result=experiment(docs,()=>performance.now());result.peakRssKiB=process.resourceUsage().maxRSS;console.log(JSON.stringify(result,null,2));
