/* STRUCTURE 2026-11-25 02:24 UTC — PARTIAL. One contribution: direct-to-CSR successor signature construction on the exact six-report graph (no new extraction claimed).
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, src/Main.lean: riemannHypothesis := rhOfAll. Current upstream c40250a50104b7e02e7d74f658d00fa7b1f4827c changes the entry to Claim.zeta LFunction_ne_zero_of_half_lt_re; not adopted. Previous structure 167b33ea877c8d6d9e5610c8aa9f0badbb0609eb, previous input path/blob documentation in its 2026-11-25_0124_csr_post34_release.mjs. Exact seven inputs listed at bottom. V8 independently hashed the fetched UTF-8 bytes as Git blobs using SHA-1 before running. Source export digest and witness paths checked again. Peer checkpoints: dependencies 276bc2393cd88389333f5316a8908173fd1dca90 (same 151-owner projection), integration e5e626d8d7d0795647cc25dfac97d1ef37d2a39f (CoreAll), acceleration 9cd16155b26ed311273eba8b33a9b9524d8cb0ac, math d866eb368c4468b33ee420b16a96e0b754a7d122, audit 1dfdae13c556fa842a26db79aad62bc01fdf42df. Read SWARM_PROTOCOL first, AGENTS, state/log excerpts, runner protocol, continuity, handoff. Blueprint not reread or used. Prior Cathedral CI #411 PASS 45529563830, not proof replay.
Proof: for each vertex, sort its distinct outgoing expression target indices in a reusable scratch buffer. Their comma-separated decimal string is an injective representation of the set; the empty set is represented by the empty string. Assign class IDs in first occurrence order, same as list/CSR. Count sizes and prefix lengths; write the sorted target indices directly into exact-size CSR by decoding each key once; each target indegree increments once per class. Thus class memberships, group sizes, offsets, targets, indegrees, and resulting ready-set transitions equal previous CSR, which itself equals raw DAG by last-member release. No merging propositions or deleting hypotheses, roles, axiom dependencies or witness multiplicities. Preparation complexity unchanged (sorting and hashing); no universal O(N) Lean optimizer. Direct path eliminates per-vertex ordinary adjacency arrays and retained per-class target list in preparation, not common adjacency Sets or signature strings, subarray views, scratch, or all temporary allocations.
V8 execution: Date.now with 3 warmups and 15 rotated repeats; medians cover preparation plus scheduling, exclude common graph/authentication. Readability span/weighted span/peak open edges are proxies only; human reader study not performed. Typed array counts exact, list payload estimates not process RAM. Direct scratch byte count transient. Native Node isolated --rss replay supported but not executed: local shell git ls-remote failed DNS, no connector-to-native data bridge; no native process RSS measured. Initial root protocol/log paths 404, corrected to runner paths. No independent Lean kernel/axiom replay. Prior source records remain unchanged.
Executed V8 output:
{
  "status": "PARTIAL_EXPORT_NOT_KERNEL_RECHECK",
  "checks": 958014,
  "negative": 17,
  "counts": {
    "type": 4551,
    "value": 21596,
    "package": 37,
    "rhs": 4
  },
  "owners": 327,
  "identities": 5674,
  "rootMixed": 3430,
  "rootExpression": 3422,
  "result": {
    "rootMixed": {
      "nodes": 3430,
      "records": 11660,
      "rows": {
        "ordinary_raw": {
          "span": 20888790,
          "weighted": 21223348,
          "peak": 8674,
          "records": 11660,
          "updates": 10853,
          "workBytes": 82320,
          "groups": 3430,
          "prepTypedBytes": 41160,
          "targetPayloadBytes": 86824,
          "scratchBytes": null,
          "medianPrepMs": 3,
          "medianScheduleMs": 10,
          "medianTotalMs": 13
        },
        "ordinary_list": {
          "span": 20888790,
          "weighted": 21223348,
          "peak": 8674,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 31504,
          "targetPayloadBytes": 51768,
          "scratchBytes": null,
          "medianPrepMs": 2,
          "medianScheduleMs": 9,
          "medianTotalMs": 11
        },
        "ordinary_csr": {
          "span": 20888790,
          "weighted": 21223348,
          "peak": 8674,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 61456,
          "targetPayloadBytes": 25884,
          "scratchBytes": null,
          "medianPrepMs": 2,
          "medianScheduleMs": 9,
          "medianTotalMs": 12
        },
        "ordinary_direct": {
          "span": 20888790,
          "weighted": 21223348,
          "peak": 8674,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 61456,
          "targetPayloadBytes": 25884,
          "scratchBytes": 600,
          "medianPrepMs": 4,
          "medianScheduleMs": 9,
          "medianTotalMs": 13
        },
        "centrality_raw": {
          "span": 26311835,
          "weighted": 26664158,
          "peak": 9542,
          "records": 11660,
          "updates": 10853,
          "workBytes": 82320,
          "groups": 3430,
          "prepTypedBytes": 41160,
          "targetPayloadBytes": 86824,
          "scratchBytes": null,
          "medianPrepMs": 3,
          "medianScheduleMs": 10,
          "medianTotalMs": 13
        },
        "centrality_list": {
          "span": 26311835,
          "weighted": 26664158,
          "peak": 9542,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 31504,
          "targetPayloadBytes": 51768,
          "scratchBytes": null,
          "medianPrepMs": 2,
          "medianScheduleMs": 9,
          "medianTotalMs": 11
        },
        "centrality_csr": {
          "span": 26311835,
          "weighted": 26664158,
          "peak": 9542,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 61456,
          "targetPayloadBytes": 25884,
          "scratchBytes": null,
          "medianPrepMs": 2,
          "medianScheduleMs": 9,
          "medianTotalMs": 11
        },
        "centrality_direct": {
          "span": 26311835,
          "weighted": 26664158,
          "peak": 9542,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 61456,
          "targetPayloadBytes": 25884,
          "scratchBytes": 600,
          "medianPrepMs": 5,
          "medianScheduleMs": 9,
          "medianTotalMs": 14
        },
        "urt_raw": {
          "span": 28832488,
          "weighted": 29227577,
          "peak": 10097,
          "records": 11660,
          "updates": 10853,
          "workBytes": 82320,
          "groups": 3430,
          "prepTypedBytes": 41160,
          "targetPayloadBytes": 86824,
          "scratchBytes": null,
          "medianPrepMs": 3,
          "medianScheduleMs": 9,
          "medianTotalMs": 12
        },
        "urt_list": {
          "span": 28832488,
          "weighted": 29227577,
          "peak": 10097,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 31504,
          "targetPayloadBytes": 51768,
          "scratchBytes": null,
          "medianPrepMs": 2,
          "medianScheduleMs": 8,
          "medianTotalMs": 10
        },
        "urt_csr": {
          "span": 28832488,
          "weighted": 29227577,
          "peak": 10097,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 61456,
          "targetPayloadBytes": 25884,
          "scratchBytes": null,
          "medianPrepMs": 3,
          "medianScheduleMs": 8,
          "medianTotalMs": 11
        },
        "urt_direct": {
          "span": 28832488,
          "weighted": 29227577,
          "peak": 10097,
          "records": 11660,
          "updates": 6471,
          "workBytes": 72664,
          "groups": 1016,
          "prepTypedBytes": 61456,
          "targetPayloadBytes": 25884,
          "scratchBytes": 600,
          "medianPrepMs": 4,
          "medianScheduleMs": 8,
          "medianTotalMs": 13
        }
      }
    },
    "all": {
      "nodes": 5674,
      "records": 26188,
      "rows": {
        "ordinary_raw": {
          "span": 80244847,
          "weighted": 81438345,
          "peak": 21791,
          "records": 26188,
          "updates": 22440,
          "workBytes": 136176,
          "groups": 5674,
          "prepTypedBytes": 68088,
          "targetPayloadBytes": 179520,
          "scratchBytes": null,
          "medianPrepMs": 6,
          "medianScheduleMs": 17,
          "medianTotalMs": 24
        },
        "ordinary_list": {
          "span": 80244847,
          "weighted": 81438345,
          "peak": 21791,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 52288,
          "targetPayloadBytes": 122512,
          "scratchBytes": null,
          "medianPrepMs": 5,
          "medianScheduleMs": 16,
          "medianTotalMs": 21
        },
        "ordinary_csr": {
          "span": 80244847,
          "weighted": 81438345,
          "peak": 21791,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 120444,
          "targetPayloadBytes": 61256,
          "scratchBytes": null,
          "medianPrepMs": 5,
          "medianScheduleMs": 16,
          "medianTotalMs": 22
        },
        "ordinary_direct": {
          "span": 80244847,
          "weighted": 81438345,
          "peak": 21791,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 120444,
          "targetPayloadBytes": 61256,
          "scratchBytes": 600,
          "medianPrepMs": 10,
          "medianScheduleMs": 16,
          "medianTotalMs": 26
        },
        "centrality_raw": {
          "span": 107962725,
          "weighted": 109316764,
          "peak": 22938,
          "records": 26188,
          "updates": 22440,
          "workBytes": 136176,
          "groups": 5674,
          "prepTypedBytes": 68088,
          "targetPayloadBytes": 179520,
          "scratchBytes": null,
          "medianPrepMs": 6,
          "medianScheduleMs": 17,
          "medianTotalMs": 23
        },
        "centrality_list": {
          "span": 107962725,
          "weighted": 109316764,
          "peak": 22938,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 52288,
          "targetPayloadBytes": 122512,
          "scratchBytes": null,
          "medianPrepMs": 5,
          "medianScheduleMs": 16,
          "medianTotalMs": 21
        },
        "centrality_csr": {
          "span": 107962725,
          "weighted": 109316764,
          "peak": 22938,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 120444,
          "targetPayloadBytes": 61256,
          "scratchBytes": null,
          "medianPrepMs": 5,
          "medianScheduleMs": 16,
          "medianTotalMs": 21
        },
        "centrality_direct": {
          "span": 107962725,
          "weighted": 109316764,
          "peak": 22938,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 120444,
          "targetPayloadBytes": 61256,
          "scratchBytes": 600,
          "medianPrepMs": 10,
          "medianScheduleMs": 16,
          "medianTotalMs": 26
        },
        "urt_raw": {
          "span": 115619772,
          "weighted": 117095553,
          "peak": 24237,
          "records": 26188,
          "updates": 22440,
          "workBytes": 136176,
          "groups": 5674,
          "prepTypedBytes": 68088,
          "targetPayloadBytes": 179520,
          "scratchBytes": null,
          "medianPrepMs": 6,
          "medianScheduleMs": 16,
          "medianTotalMs": 22
        },
        "urt_list": {
          "span": 115619772,
          "weighted": 117095553,
          "peak": 24237,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 52288,
          "targetPayloadBytes": 122512,
          "scratchBytes": null,
          "medianPrepMs": 5,
          "medianScheduleMs": 15,
          "medianTotalMs": 20
        },
        "urt_csr": {
          "span": 115619772,
          "weighted": 117095553,
          "peak": 24237,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 120444,
          "targetPayloadBytes": 61256,
          "scratchBytes": null,
          "medianPrepMs": 5,
          "medianScheduleMs": 15,
          "medianTotalMs": 20
        },
        "urt_direct": {
          "span": 115619772,
          "weighted": 117095553,
          "peak": 24237,
          "records": 26188,
          "updates": 15314,
          "workBytes": 120376,
          "groups": 1724,
          "prepTypedBytes": 120444,
          "targetPayloadBytes": 61256,
          "scratchBytes": 600,
          "medianPrepMs": 9,
          "medianScheduleMs": 15,
          "medianTotalMs": 24
        }
      }
    }
  },
  "controls": {
    "graphs": 2198,
    "comparisons": 13188
  }
}
RESUME HERE: run --rss on all seven exact blobs in a native process with network or mounted exports; compare list, previous CSR, direct CSR in isolated processes including common input validation; then test whether releasing signature keys incrementally reduces peak RAM. HANDOFF TO dependencies, acceleration, integration, audit. Full human proof OPEN.
*/
function experiment(docs,requests,clock=()=>Date.now(),reps=15,only=null){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",root=14065054,J=JSON.stringify,phi=(1+Math.sqrt(5))/2,kappa=Math.PI/Math.E,theta=2*Math.PI/phi**2;
 let checks=0,negative=0;const ck=(x,m)=>{if(!x)throw Error(m);checks++};function reject(f){let bad=false;try{f()}catch{bad=true}ck(bad,"negative accepted");negative++}
 const ids=new Map(),names=new Map(),owners=new Map(),records=[],counts={type:0,value:0,package:0,rhs:0};
 function ident(id,parts,kind){const key=J([parts,kind]),name=J(parts);ck(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length&&typeof kind==="string"&&(!ids.has(id)||ids.get(id)===key)&&(!names.has(name)||names.get(name)===id),"identity");ids.set(id,key);names.set(name,id)}
 for(const [i,d] of docs.entries()){
  ck(d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&d.bytes===61570595788&&d.n===1065214335&&d.root===root&&d.indexedDeclarations===1484733&&d.reports.length===[6,47,18,71,34,151][i]&&(i===0||d.pin===pin),"report identity");
  for(const r of d.reports){const q=r.request??r.source;ck(!owners.has(r.id)&&r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK"&&(q.id===undefined||q.id===r.id)&&(q.kind===undefined||q.kind===r.kind),"owner");owners.set(r.id,r);ident(r.id,q.name.split("."),r.kind);
   ck(r.type&&(["thm","def","opaque"].includes(r.kind)?!!r.value:r.value===null),"shape");const encoded=r.encodedRootsAndStructuralEdges,first=r.value?2:1;
   if(encoded)ck(encoded.length===first+(r.structural??[]).length&&encoded[0]===r.type.expressionRoot+1&&(!r.value||encoded[1]===r.value.expressionRoot+1),"slots");else ck(i===0&&!(r.structural??[]).length,"legacy");
   function add(t,role,slot){let sum=0;const seen=new Set();ck(Number.isSafeInteger(t.expressionRoot)&&t.expressionRoot>=0&&t.expressionRoot<d.n,"expr root");for(const [index,e] of t.references.entries()){ident(e.target,e.nameParts,e.targetKind);const k=J([e.kind,e.target]);ck(!seen.has(k)&&["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=t.expressionRoot&&Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"witness");seen.add(k);sum+=e.distinctExpressionRecords;records.push({a:e.target,b:r.id,role,slot,index,w:e.distinctExpressionRecords,expressionRoot:t.expressionRoot,raw:e});counts[role]++}ck(sum===t.referenceOccurrences,"occurrence count")}
   add(r.type,"type",0);if(r.value)add(r.value,"value",1);
   for(const [j,e] of (r.structural??[]).entries()){const slot=first+j;ck(e.edgeIndex===slot&&encoded[slot]===e.encoded&&e.encoded!==0,"structural");if(e.encoded<0){ident(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1,"structural target");records.push({a:e.target,b:r.id,role:"package",slot,index:0,w:1,raw:e});counts.package++}else{ck(r.kind==="rec"&&e.kind==="recursor_rule_rhs"&&e.expression.expressionRoot+1===e.encoded,"rhs");add(e.expression,"rhs",slot)}}
  }
 }
 ck(owners.size===327&&J(counts)===J({type:4551,value:21596,package:37,rhs:4}),"census");
 const recordKey=e=>J([e.b,e.role,e.slot,e.index]),ledger=new Map(records.map(e=>[recordKey(e),J(e)]));ck(ledger.size===records.length,"ledger uniqueness");
 const by=new Map();for(const e of records){if(!by.has(e.b))by.set(e.b,[]);by.get(e.b).push(e)}
 const name=id=>JSON.parse(ids.get(id))[0].join(".");
 const targets=new Map(docs[5].reports.map(r=>[r.id,r]));ck(targets.size===151&&requests.length===151,"151 requests");
 for(const q of requests){const r=targets.get(q.id);ck(r&&J(r.request)===J(q)&&r.kind===q.kind&&name(q.id)===q.name,"request match");let at=root;for(const e of q.path){ck(e.owner===at&&name(e.owner)===e.ownerName&&name(e.target)===e.targetName&&e.role==="value"&&e.kind==="explicit_const"&&by.get(at)?.some(z=>z.role==="value"&&z.a===e.target&&z.raw.kind===e.kind&&z.raw.witnessExpression===e.witness&&z.expressionRoot===e.expressionRoot)&&!targets.has(at),"prior path witness");at=e.target}ck(at===q.id,"path end");const e=q.path.at(-1);ck(q.incoming.ownerId===e.owner&&q.incoming.owner===e.ownerName&&q.incoming.witness===e.witness&&q.incoming.role===e.role&&q.incoming.kind===e.kind,"incoming");}
 function reach(allow){const q=[root],s=new Set(q);for(let i=0;i<q.length;i++)for(const e of by.get(q[i])??[])if(allow(e)&&!s.has(e.a)){s.add(e.a);q.push(e.a)}return s}
 const mixed=reach(()=>true),expr=reach(e=>e.role!=="package");
 function graph(nodes,rs){const ni=[...nodes].sort((a,b)=>a-b),ix=new Map(ni.map((v,i)=>[v,i])),A=Array.from(ni,()=>new Set());for(const e of rs){if(e.role==="package")continue;const a=ix.get(e.a),b=ix.get(e.b);if(a===undefined||b===undefined||a===b)throw Error("bad expression edge");A[a].add(b)}return {ni,ix,A,rs}}
 // All three representations release the same ready set; CSR stores each class's targets contiguously.
 // Direct CSR: reusable typed scratch for canonical signature, no per-vertex JS
 // adjacency array and no retained class adjacency list. Decode the exact keys in
 // insertion order; the full role-labelled evidence ledger remains untouched.
 function prepDirect(g){
  const n=g.ni.length,of=new Int32Array(n),sizes=[],ends=[0],map=new Map(),ind=new Int32Array(n);
  let max=0;for(const a of g.A)max=Math.max(max,a.size);
  const scratch=new Int32Array(max);
  for(let i=0;i<n;i++){
   let k=0;for(const v of g.A[i])scratch[k++]=v;
   const key=scratch.subarray(0,k).sort().join(",");
   let c=map.get(key);
   if(c===undefined){c=sizes.length;map.set(key,c);sizes.push(0);ends.push(ends.at(-1)+k)}
   sizes[c]++;of[i]=c;
  }
  const sz=Int32Array.from(sizes),offsets=Int32Array.from(ends),arcs=ends.at(-1),flat=new Int32Array(arcs);
  let c=0,j=0;
  for(const key of map.keys()){
   if(key.length){let value=0;for(let i=0;i<=key.length;i++){
    if(i===key.length||key.charCodeAt(i)===44){flat[j++]=value;ind[value]++;value=0}
    else value=value*10+key.charCodeAt(i)-48;
   }}
   if(j!==offsets[++c])throw Error("direct CSR count mismatch");
  }
  if(c!==sz.length||j!==arcs)throw Error("direct CSR fill mismatch");
  return {g,rep:"direct",of,targets:null,sz,ind,arcs,offsets,flat,prepTypedBytes:of.byteLength+sz.byteLength+ind.byteLength+offsets.byteLength+flat.byteLength,targetPayloadBytes:flat.byteLength,scratchBytes:scratch.byteLength};
 }
 function prep(g,rep){if(rep==="direct")return prepDirect(g);const n=g.ni.length,of=new Int32Array(n),sizes=[],targets=[],map=new Map(),ind=new Int32Array(n);
  for(let i=0;i<n;i++){const a=[...g.A[i]].sort((a,b)=>a-b),key=rep==="raw"?"i:"+i:a.join(",");let j=map.get(key);if(j===undefined){j=targets.length;map.set(key,j);sizes.push(0);targets.push(a);for(const v of a)ind[v]++}sizes[j]++;of[i]=j}
  const sz=Int32Array.from(sizes),arcs=targets.reduce((s,a)=>s+a.length,0);let offsets=null,flat=null;
  if(rep==="csr"){offsets=new Int32Array(targets.length+1);flat=new Int32Array(arcs);let k=0;for(let j=0;j<targets.length;j++){offsets[j]=k;flat.set(targets[j],k);k+=targets[j].length}offsets[targets.length]=k}
  return {g,rep,of,targets:rep==="csr"?null:targets,sz,ind,arcs,offsets,flat,prepTypedBytes:of.byteLength+sz.byteLength+ind.byteLength+(offsets?.byteLength??0)+(flat?.byteLength??0),targetPayloadBytes:rep==="csr"?flat.byteLength:arcs*8};
 }
 function schedule(p,mode){const {g,of,targets,sz,ind,offsets,flat}=p,n=g.ni.length,left=sz.slice(),d=ind.slice(),heap=new Int32Array(n),out=new Int32Array(n),score=Float64Array.from(g.ni,(_,i)=>mode==="ordinary"?0:g.A[i].size+(mode==="urt"?kappa*Math.cos((i+1)*theta):0));let size=0,k=0,updates=0;
  const better=(a,b)=>score[a]>score[b]||score[a]===score[b]&&a<b;
  function push(x){let i=size++;while(i){let t=(i-1)>>1;if(!better(x,heap[t]))break;heap[i]=heap[t];i=t}heap[i]=x}
  function pop(){const x=heap[0],v=heap[--size];if(size){let i=0;while(2*i+1<size){let j=2*i+1;if(j+1<size&&better(heap[j+1],heap[j]))j++;if(!better(heap[j],v))break;heap[i]=heap[j];i=j}heap[i]=v}return x}
  function release(w){updates++;if(--d[w]===0)push(w)}
  for(let i=0;i<n;i++)if(!d[i])push(i);while(size){const v=pop();out[k++]=g.ni[v];const c=of[v];if(--left[c]===0){if(flat){for(let j=offsets[c];j<offsets[c+1];j++)release(flat[j])}else for(const w of targets[c])release(w)}}if(k!==n)throw Error("expression cycle");return {out,updates,workBytes:left.byteLength+d.byteLength+heap.byteLength+out.byteLength+score.byteLength};
 }
 function metric(g,out,verify=false,expected=g.rs){const n=g.ni.length,rank=new Int32Array(n).fill(-1),diff=new Int32Array(n+1);if(out.length!==n)throw Error("length");
  for(const [i,v] of out.entries()){const j=g.ix.get(v);if(j===undefined||rank[j]!==-1)throw Error("permutation");rank[j]=i}
  let span=0,weighted=0,peak=0,open=0;const seen=new Set();
  for(const e of g.rs){if(verify){const k=recordKey(e);ck(!seen.has(k)&&ledger.get(k)===J(e),"typed record fidelity");seen.add(k)}const a=rank[g.ix.get(e.a)],b=rank[g.ix.get(e.b)];if(e.role==="package")continue;if(a>=b)throw Error("expression precedence");span+=b-a;weighted+=(b-a)*e.w;diff[a]++;diff[b]--}
  if(verify)ck(seen.size===expected.length&&expected.every(e=>seen.has(recordKey(e))),"record conservation");for(let i=0;i<n;i++){open+=diff[i];peak=Math.max(peak,open)}return {span,weighted,peak,records:g.rs.length};
 }
 function validatePrep(p){const {g,of,targets,offsets,flat,sz,ind}=p;const actual=new Int32Array(g.ni.length),cnt=new Int32Array(sz.length);for(let i=0;i<g.ni.length;i++){const c=of[i];ck(c>=0&&c<sz.length,"class range");cnt[c]++;const a=flat?Array.from(flat.subarray(offsets[c],offsets[c+1])):targets[c];ck(J(a)===J([...g.A[i]].sort((a,b)=>a-b)),"roundtrip adjacency")}if(flat){ck(offsets[0]===0&&offsets.at(-1)===flat.length&&offsets.every((x,i)=>!i||x>=offsets[i-1]),"CSR offsets")}for(let c=0;c<sz.length;c++){ck(cnt[c]===sz[c]&&cnt[c]>0,"group count");const a=flat?flat.subarray(offsets[c],offsets[c+1]):targets[c];for(const v of a)actual[v]++}ck(J([...actual])===J([...ind]),"indegree roundtrip")}
 const modes=["ordinary","centrality","urt"],repset=["raw","list","csr","direct"],result={};
 for(const [scope,nodes] of [["rootMixed",mixed],["all",new Set(ids.keys())]]){
  const rs=records.filter(e=>nodes.has(e.b)),g=graph(nodes,rs),cases=modes.flatMap(mode=>repset.map(rep=>({mode,rep,key:mode+"_"+rep}))).filter(c=>!only||c.key===only),times=Object.fromEntries(cases.map(c=>[c.key,[]])),last={};
  for(const c of cases)for(let j=0;j<3;j++)schedule(prep(g,c.rep),c.mode);
  for(let j=0;j<reps;j++)for(let i=0;i<cases.length;i++){const c=cases[(i+j)%cases.length],t=clock(),p=prep(g,c.rep),mid=clock(),s=schedule(p,c.mode),end=clock();times[c.key].push([mid-t,end-mid,end-t]);last[c.key]={p,s}}
  const rows={};for(const c of cases){const {p,s}=last[c.key];validatePrep(p);const {out,...stats}=s;const med=a=>a.sort((a,b)=>a-b)[Math.floor(a.length/2)];rows[c.key]={...metric(g,out,true),...stats,groups:p.sz.length,prepTypedBytes:p.prepTypedBytes,targetPayloadBytes:p.targetPayloadBytes,scratchBytes:p.scratchBytes??null,medianPrepMs:med(times[c.key].map(t=>t[0])),medianScheduleMs:med(times[c.key].map(t=>t[1])),medianTotalMs:med(times[c.key].map(t=>t[2]))};ck(J([...out])===J([...schedule(prep(g,c.rep),c.mode).out]),"determinism");ck(s.updates===p.arcs,"arc count")}
  if(!only){for(const mode of modes){const a=last[mode+"_raw"].s.out;for(const rep of ["list","csr","direct"])ck(J([...a])===J([...last[mode+"_"+rep].s.out]),"exact priority order")}
  const order=last.ordinary_raw.s.out;reject(()=>metric(g,[...order].reverse(),true));reject(()=>metric({...g,rs:rs.slice(1)},order,true,rs));const rhs=rs.find(e=>e.role==="rhs");if(rhs)reject(()=>metric({...g,rs:rs.map(e=>e===rhs?{...e,role:"value"}:e)},order,true,rs));for(const rep of ["csr","direct"]){const p=prep(g,rep);p.offsets[p.offsets.length-1]--;reject(()=>validatePrep(p));}}
  result[scope]={nodes:nodes.size,records:rs.length,rows};
 }
 let graphs=0,comparisons=0;
 if(!only){for(let n=1;n<=5;n++){const possible=[];for(let a=0;a<n;a++)for(let b=a+1;b<n;b++)possible.push({a,b,role:"value",w:1});for(let mask=0;mask<2**possible.length;mask++){const es=possible.filter((_,i)=>mask&(1<<i));for(const rev of [false,true]){const rs=rev?es.map(e=>({...e,a:n-1-e.a,b:n-1-e.b})):es,g=graph(Array.from({length:n},(_,i)=>i),rs),p=prep(g,"raw"),q=prep(g,"csr"),r=prep(g,"direct");validatePrep(q);validatePrep(r);graphs++;for(const mode of modes){const a=schedule(p,mode);for(const variant of [q,r]){const b=schedule(variant,mode);ck(J([...a.out])===J([...b.out]),"small graph equivalence");metric(g,b.out);comparisons++}}}}}
 const cycle=graph([0,1],[{a:0,b:1,role:"value",w:1},{a:1,b:0,role:"value",w:1}]);for(const rep of repset)reject(()=>schedule(prep(cycle,rep),"ordinary"));
 const toy=graph([0,1,2],[{a:0,b:1,role:"value",w:1},{a:2,b:1,role:"value",w:1}]);reject(()=>metric(toy,[0,1,2]));ck(J([...schedule(prep(toy,"csr"),"ordinary").out])===J([0,2,1]),"last member guard");
 for(const rep of ["csr","direct"]){const p=prep(toy,rep);p.flat[0]=0;reject(()=>validatePrep(p));}
 }
 ck(records.every(e=>ledger.get(recordKey(e))===J(e)),"unmodified ledger");
 return {status:"PARTIAL_EXPORT_NOT_KERNEL_RECHECK",checks,negative,counts,owners:owners.size,identities:ids.size,rootMixed:mixed.size,rootExpression:expr.size,result,controls:{graphs,comparisons}};
}
import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
import {spawnSync} from "node:child_process";
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","deabbd86afc8f21d9897ba3bb74349178517fde3","b22cf0a1ae745fb1d44e83fd75f149ed175c55d0","8ab52b2b23622d9cbf406af24baaca70f9dee485"];
const args=process.argv.slice(2);const rss=args[0]==="--rss";if(rss)args.shift();const only=args[0]==="--only"?args.splice(0,2)[1]:null;
if(args.length!==7)throw Error("usage: node certificate.mjs [--rss] direct.json frontier.json next.json literature.json producers34.json post34.json rh_post34_frontier.mjs");
if(rss){for(const m of ["ordinary","centrality","urt"])for(const r of ["raw","list","csr","direct"]){const c=spawnSync(process.execPath,[process.argv[1],"--only",m+"_"+r,...args],{encoding:"utf8",maxBuffer:16*1024*1024});if(c.status!==0)throw Error(c.stderr);console.log(c.stdout)}process.exit(0)}
const raw=args.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==hashes[i])throw Error("blob mismatch "+p);return b.toString("utf8")});
const docs=raw.slice(0,6).map(JSON.parse),requests=JSON.parse(raw[6].match(/const requests=(\[.*?\]);\n/s)[1]);
const result=experiment(docs,requests,()=>performance.now(),15,only);result.peakRssKiB=process.resourceUsage().maxRSS;result.rssScope=only?"isolated method process including common input validation and both graph scopes":"all methods combined";console.log(JSON.stringify(result,null,2));
