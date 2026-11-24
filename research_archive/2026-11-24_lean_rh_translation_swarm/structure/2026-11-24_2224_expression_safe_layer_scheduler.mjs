/* STRUCTURE 2026-11-24 22:24 UTC — one contribution: role-separated, expression-safe scheduling over the 71-target delta. PARTIAL.
Read SWARM_PROTOCOL first, AGENTS, state/log/protocol (root paths 404; actual runner paths read), continuity, HANDOFF_QUEUE, CI #398 PASS (45494978576; not RH proof validation). Peer checkpoints fd407dfd361f1498edbcc991ed6edc677af5a10e, e55b6e2bca0f61a975c7e6bf75d646d2235a1541, 5d2024c6b6d142f9dc93e7ffa7129d2ccd6660e2, 6e12102fe7ea62b9ee879a87c364d6fee2b7a6fd, 8a1444442642e9f13f56ca18e88b74aa7a8e49db, d531fdfeb57adc62963dc59d9949e47d56158aa1; latest editor and specialist commits inspected in list. Blueprint limitations read in handoff, PDF not reopened. Prior structure fab19321e2d57f10651826c80a06e1da4bae697f. No unrelated edits.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc checked; upstream HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd not adopted. Input reports on cathedral-research-state:
compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json
compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json
compute/rh-next-root-roles-20261124/outputs/solution_next_root_roles.json
compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json
Exact blobs in CLI below. Contents API returned empty for 47-owner blob; recovered all 4,218,119 characters via fetch_blob by SHA. Raw URL failed. All four exact SHA blob retrievals parsed and tests ran in V8. Native CLI not run; no independent Lean kernel replay, no axiom audit or completeness claim. Reports are authenticated export evidence, not fresh Lean proof.
Algorithm: same nodes and typed records for both layers. Expression-only precedence includes type/value/RHS, mixed SCC navigation includes package links. Inside each mixed SCC, topologically sort expression edges; reject genuine expression cycles/self loops, do not equate package cycles to logical equality. Every expression edge must be forward at individual declaration resolution, including those within mixed blocks. Package edges remain in evidence store and their backwards/self counts are reported. Absolute package span is diagnostic only. This is stricter than previous component-only scoring. Raw canonical ID expansion can break expression ordering; synthetic two-node control shows necessity. Ordinary ID, outdegree centrality and fixed pi/e cosine golden angle share heap implementation. Same population and score for fair comparison. Span, weighted span, peak open expression reference records are readability proxies only; human comprehension unmeasured. Exact typed array allocations reported for scheduling, local SCC ordering and scoring; no total process RSS in V8. Timing Date.now, 5 warmups and 30 repetitions each, scheduling only. No grouped optimizer attempted yet because role safety was prerequisite. SCC O(V+E) before sorting; local edge filtering costs O(number of nontrivial SCCs * E) in this implementation; heap O((V+E)log V). No universal O(N) claim.
Executed result:
{
  "status": "PARTIAL_EXPORT_NOT_KERNEL_RECHECK",
  "checks": 253297,
  "negative": 14,
  "owners": 142,
  "identities": 4074,
  "count": {
    "type": 4048,
    "value": 14011,
    "package": 37,
    "rhs": 4
  },
  "rootExpressionReach": 1299,
  "rootMixedReach": 1309,
  "result": {
    "rootMixed": {
      "nodes": 1309,
      "owners": 93,
      "records": 3572,
      "expressionRecords": 3535,
      "rows": {
        "expression": {
          "blocks": 1309,
          "multi": [],
          "naiveViolations": 0,
          "buildMs": 4,
          "localTypedBytes": 0,
          "methods": {
            "ordinary": {
              "span": 1846679,
              "weighted": 1897688,
              "peak": 2086,
              "packageBackward": 18,
              "packageSelf": 12,
              "packageSpan": 33,
              "rhs": 4,
              "metricBytes": 10476,
              "ms": 4.266666666666667,
              "typedScheduleBytes": 31416
            },
            "centrality": {
              "span": 2490321,
              "weighted": 2548859,
              "peak": 2604,
              "packageBackward": 18,
              "packageSelf": 12,
              "packageSpan": 21499,
              "rhs": 4,
              "metricBytes": 10476,
              "ms": 3.6666666666666665,
              "typedScheduleBytes": 31416
            },
            "urt": {
              "span": 3001419,
              "weighted": 3074107,
              "peak": 2794,
              "packageBackward": 14,
              "packageSelf": 12,
              "packageSpan": 15769,
              "rhs": 4,
              "metricBytes": 10476,
              "ms": 3.466666666666667,
              "typedScheduleBytes": 31416
            }
          }
        },
        "mixed": {
          "blocks": 1307,
          "multi": [
            {
              "ids": [
                550020,
                550021,
                550025
              ],
              "expressionOrder": [
                550020,
                550021,
                550025
              ]
            }
          ],
          "naiveViolations": 0,
          "buildMs": 7,
          "localTypedBytes": 60,
          "methods": {
            "ordinary": {
              "span": 1846838,
              "weighted": 1897847,
              "peak": 2086,
              "packageBackward": 3,
              "packageSelf": 12,
              "packageSpan": 38,
              "rhs": 4,
              "metricBytes": 10476,
              "ms": 3.6666666666666665,
              "typedScheduleBytes": 31376
            },
            "centrality": {
              "span": 2458859,
              "weighted": 2517567,
              "peak": 2521,
              "packageBackward": 3,
              "packageSelf": 12,
              "packageSpan": 3294,
              "rhs": 4,
              "metricBytes": 10476,
              "ms": 3.6666666666666665,
              "typedScheduleBytes": 31376
            },
            "urt": {
              "span": 2940631,
              "weighted": 3013161,
              "peak": 2748,
              "packageBackward": 3,
              "packageSelf": 12,
              "packageSpan": 6164,
              "rhs": 4,
              "metricBytes": 10476,
              "ms": 3.433333333333333,
              "typedScheduleBytes": 31376
            }
          }
        }
      }
    },
    "all": {
      "nodes": 4074,
      "owners": 142,
      "records": 18100,
      "expressionRecords": 18063,
      "rows": {
        "expression": {
          "blocks": 4074,
          "multi": [],
          "naiveViolations": 0,
          "buildMs": 12,
          "localTypedBytes": 0,
          "methods": {
            "ordinary": {
              "span": 39977036,
              "weighted": 40633703,
              "peak": 15197,
              "packageBackward": 18,
              "packageSelf": 12,
              "packageSpan": 33,
              "rhs": 4,
              "metricBytes": 32596,
              "ms": 13.4,
              "typedScheduleBytes": 97776
            },
            "centrality": {
              "span": 53478388,
              "weighted": 54224971,
              "peak": 15912,
              "packageBackward": 18,
              "packageSelf": 12,
              "packageSpan": 63002,
              "rhs": 4,
              "metricBytes": 32596,
              "ms": 13.066666666666666,
              "typedScheduleBytes": 97776
            },
            "urt": {
              "span": 56425259,
              "weighted": 57225806,
              "peak": 16700,
              "packageBackward": 14,
              "packageSelf": 12,
              "packageSpan": 52039,
              "rhs": 4,
              "metricBytes": 32596,
              "ms": 12.7,
              "typedScheduleBytes": 97776
            }
          }
        },
        "mixed": {
          "blocks": 4072,
          "multi": [
            {
              "ids": [
                550020,
                550021,
                550025
              ],
              "expressionOrder": [
                550020,
                550021,
                550025
              ]
            }
          ],
          "naiveViolations": 0,
          "buildMs": 27,
          "localTypedBytes": 60,
          "methods": {
            "ordinary": {
              "span": 39977195,
              "weighted": 40633862,
              "peak": 15197,
              "packageBackward": 3,
              "packageSelf": 12,
              "packageSpan": 38,
              "rhs": 4,
              "metricBytes": 32596,
              "ms": 13.366666666666667,
              "typedScheduleBytes": 97736
            },
            "centrality": {
              "span": 53416914,
              "weighted": 54164249,
              "peak": 15908,
              "packageBackward": 3,
              "packageSelf": 12,
              "packageSpan": 9550,
              "rhs": 4,
              "metricBytes": 32596,
              "ms": 13.433333333333334,
              "typedScheduleBytes": 97736
            },
            "urt": {
              "span": 56446052,
              "weighted": 57250467,
              "peak": 16837,
              "packageBackward": 3,
              "packageSelf": 12,
              "packageSpan": 18345,
              "rhs": 4,
              "metricBytes": 32596,
              "ms": 12.833333333333334,
              "typedScheduleBytes": 97736
            }
          }
        }
      }
    }
  }
}
RESUME HERE: use the recovered four-blob union and expression-safe ordering to implement successor-signature grouping on the expression layer; compare fidelity, common expression span and peak open records, keep full package and RHS slots. Index internal SCC edges once before scaling. HANDOFF TO dependencies, audit, kernel, acceleration, integration and editor. Project OPEN.
*/
function experiment(docs,clock=()=>Date.now(),reps=30){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",root=14065054,nexpr=1065214335,J=JSON.stringify;
 let checks=0,negative=0;const ck=(v,m)=>{if(!v)throw Error(m);checks++};
 const ids=new Map(),names=new Map(),owners=new Map(),records=[],count={type:0,value:0,package:0,rhs:0};
 function ident(id,parts,kind){const k=J([parts,kind]),s=J(parts);ck(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length>0&&typeof kind==="string"&&(!ids.has(id)||ids.get(id)===k)&&(!names.has(s)||names.get(s)===id),"identity");ids.set(id,k);names.set(s,id)}
 for(const [i,d] of docs.entries()){
  ck(d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&d.bytes===61570595788&&d.n===nexpr&&d.root===root&&d.indexedDeclarations===1484733&&d.reports.length===[6,47,18,71][i]&&(i===0||d.pin===pin),"archive");
  for(const r of d.reports){
   ck(!owners.has(r.id)&&r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK","owner");
   const q=r.request??r.source;ident(r.id,q.name.split("."),r.kind);owners.set(r.id,r);
   ck(r.type&&(["thm","def","opaque"].includes(r.kind)?!!r.value:r.value===null),"shape");
   const encoded=r.encodedRootsAndStructuralEdges,first=r.value?2:1;
   if(encoded){ck(encoded.length===first+(r.structural??[]).length&&encoded[0]===r.type.expressionRoot+1&&(!r.value||encoded[1]===r.value.expressionRoot+1),"slots")}
   else ck(i===0&&!(r.structural??[]).length,"legacy slot availability");
   function add(t,role,slot){ck(Number.isSafeInteger(t.expressionRoot)&&t.expressionRoot>=0&&t.expressionRoot<nexpr,"root");let sum=0;const seen=new Set();for(const [index,e] of t.references.entries()){ident(e.target,e.nameParts,e.targetKind);const k=J([e.kind,e.target]);ck(!seen.has(k)&&["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=t.expressionRoot&&Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"reference");seen.add(k);sum+=e.distinctExpressionRecords;records.push({a:e.target,b:r.id,role,slot,index,w:e.distinctExpressionRecords,expressionRoot:t.expressionRoot,raw:e});count[role]++}ck(sum===t.referenceOccurrences,"role count")}
   add(r.type,"type",0);if(r.value)add(r.value,"value",1);
   for(const [j,e] of (r.structural??[]).entries()){const slot=first+j;ck(e.edgeIndex===slot&&encoded[slot]===e.encoded&&e.encoded!==0,"structural slot");if(e.encoded<0){ident(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1,"target");records.push({a:e.target,b:r.id,role:"package",slot,index:0,w:1,raw:e});count.package++}else{ck(r.kind==="rec"&&e.kind==="recursor_rule_rhs"&&e.expression.expressionRoot+1===e.encoded,"RHS");add(e.expression,"rhs",slot)}}
  }
 }
 ck(owners.size===142&&ids.size===4074&&J(count)===J({type:4048,value:14011,package:37,rhs:4}),"census");
 const key=e=>J([e.b,e.role,e.slot,e.index]),ledger=new Map(records.map(e=>[key(e),J(e)]));ck(ledger.size===records.length,"unique record");
 const by=new Map();for(const e of records){if(!by.has(e.b))by.set(e.b,[]);by.get(e.b).push(e)}
 function reach(allow){const q=[root],s=new Set(q);for(let i=0;i<q.length;i++)for(const e of by.get(q[i])??[])if(allow(e)&&!s.has(e.a)){s.add(e.a);q.push(e.a)}return s}
 const mixed=reach(()=>true),expr=reach(e=>e.role!=="package");ck(mixed.size===1309&&expr.size===1299,"reachable");
 const phi=(1+Math.sqrt(5))/2,kappa=Math.PI/Math.E,theta=2*Math.PI/phi**2;
 // Dependency->consumer direction. Package links are navigation metadata, not precedence obligations.
 function adjacency(nodes,rs){const ni=[...nodes].sort((a,b)=>a-b),ix=new Map(ni.map((v,i)=>[v,i])),A=Array.from(ni,()=>new Set()),B=Array.from(ni,()=>new Set());for(const e of rs){const a=ix.get(e.a),b=ix.get(e.b);if(a===undefined||b===undefined)throw Error("endpoint");A[a].add(b);B[b].add(a)}return {ni,ix,A,B}}
 function scc(g){const {ni,A,B}=g,n=ni.length,seen=new Uint8Array(n),post=[];for(let i=0;i<n;i++){if(seen[i])continue;seen[i]=1;const st=[[i,A[i].values()]];while(st.length){const [v,it]=st.at(-1),t=it.next();if(t.done){post.push(v);st.pop()}else if(!seen[t.value]){seen[t.value]=1;st.push([t.value,A[t.value].values()])}}}const label=new Int32Array(n).fill(-1),parts=[];for(let i=n-1;i>=0;i--){const v=post[i];if(label[v]>=0)continue;const q=[v];label[v]=parts.length;for(let j=0;j<q.length;j++)for(const w of B[q[j]])if(label[w]<0){label[w]=parts.length;q.push(w)}parts.push(q.map(j=>ni[j]).sort((a,b)=>a-b))}parts.sort((a,b)=>a[0]-b[0]);return parts}
 function heapTopo(A,B,mode){const n=A.length,ind=Int32Array.from(B,b=>b.size),heap=new Int32Array(n),out=new Int32Array(n),score=Float64Array.from(A,(a,i)=>mode==="ordinary"?0:a.size+(mode==="urt"?kappa*Math.cos((i+1)*theta):0));let size=0,k=0;
  const better=(a,b)=>score[a]>score[b]||score[a]===score[b]&&a<b;
  function push(x){let i=size++;while(i){let p=(i-1)>>1;if(!better(x,heap[p]))break;heap[i]=heap[p];i=p}heap[i]=x}
  function pop(){const x=heap[0],v=heap[--size];if(size){let i=0;while(2*i+1<size){let j=2*i+1;if(j+1<size&&better(heap[j+1],heap[j]))j++;if(!better(heap[j],v))break;heap[i]=heap[j];i=j}heap[i]=v}return x}
  for(let i=0;i<n;i++)if(!ind[i])push(i);while(size){const v=pop();out[k++]=v;for(const w of A[v])if(--ind[w]===0)push(w)}if(k!==n)throw Error("expression or condensation cycle");return {out,bytes:ind.byteLength+heap.byteLength+out.byteLength+score.byteLength}
 }
 function prepare(nodes,rs,layer){
  const exp=rs.filter(e=>e.role!=="package"),g=adjacency(nodes,exp),parts=layer==="mixed"?scc(adjacency(nodes,rs)):g.ni.map(v=>[v]),map=new Map();parts.forEach((p,i)=>p.forEach(v=>map.set(v,i)));
  const A=Array.from(parts,()=>new Set()),B=Array.from(parts,()=>new Set()),local=parts.map(p=>p.slice());let localBytes=0;
  for(const e of layer==="mixed"?rs:exp){const a=map.get(e.a),b=map.get(e.b);if(a!==b){A[a].add(b);B[b].add(a)}}
  // For multi-node SCC, restore actual expression precedence inside the navigation block.
  for(const [i,p] of parts.entries())if(p.length>1){const inside=exp.filter(e=>map.get(e.a)===i&&map.get(e.b)===i),h=adjacency(p,inside),s=heapTopo(h.A,h.B,"ordinary");local[i]=Array.from(s.out,j=>h.ni[j]);localBytes+=s.bytes}
  // Reject expression self-loops, even inside a mixed navigation component.
  if(exp.some(e=>e.a===e.b))throw Error("expression self-loop");
  return {A,B,parts,local,localBytes,exp,rs,g,layer}
 }
 function schedule(p,mode){const s=heapTopo(p.A,p.B,mode),out=new Int32Array(p.g.ni.length);let k=0;for(const j of s.out)for(const v of p.local[j])out[k++]=v;return {out,bytes:s.bytes+out.byteLength}}
 function evaluate(p,out,verify=true,expected=p.rs){
  const n=p.g.ni.length,rank=new Int32Array(n).fill(-1),diff=new Int32Array(n+1);if(out.length!==n)throw Error("length");for(const [i,v] of out.entries()){const j=p.g.ix.get(v);if(j===undefined||rank[j]!==-1)throw Error("permutation");rank[j]=i}
  let span=0,weighted=0,peak=0,open=0,back=0,self=0,packageSpan=0,rhs=0;const seen=new Set();
  for(const e of p.rs){if(verify){const k=key(e);ck(!seen.has(k)&&ledger.get(k)===J(e),"ledger");seen.add(k)}const a=rank[p.g.ix.get(e.a)],b=rank[p.g.ix.get(e.b)];if(e.role==="package"){if(a>b)back++;if(a===b)self++;packageSpan+=Math.abs(b-a);continue}if(a>=b)throw Error("expression precedence");span+=b-a;weighted+=(b-a)*e.w;diff[a]++;diff[b]--;if(e.role==="rhs")rhs++}
  if(verify)ck(seen.size===expected.length&&expected.every(e=>seen.has(key(e))),"record conservation");
  for(let i=0;i<n;i++){open+=diff[i];peak=Math.max(peak,open)}return {span,weighted,peak,packageBackward:back,packageSelf:self,packageSpan,rhs,metricBytes:rank.byteLength+diff.byteLength}
 }
 function reject(f){let bad=false;try{f()}catch{bad=true}ck(bad,"negative accepted");negative++}
 const result={};
 // identical node and record populations for fair layer comparisons, including metadata-only nodes.
 for(const [scope,nodes] of [["rootMixed",mixed],["all",new Set(ids.keys())]]){
  const rs=records.filter(e=>nodes.has(e.b));const rows={};
  for(const layer of ["expression","mixed"]){
   const t=clock(),p=prepare(nodes,rs,layer),buildMs=clock()-t;
   const methods={};for(const mode of ["ordinary","centrality","urt"]){for(let i=0;i<5;i++)schedule(p,mode);let a;const t=clock();for(let i=0;i<reps;i++)a=schedule(p,mode);const ms=(clock()-t)/reps;methods[mode]={...evaluate(p,a.out),ms,typedScheduleBytes:a.bytes};}
   const baseline=schedule(p,"ordinary");reject(()=>evaluate(p,Array.from(baseline.out).reverse()));reject(()=>evaluate({...p,rs:p.rs.slice(1)},baseline.out,true,rs));const e=p.rs.find(e=>e.role==="rhs");if(e)reject(()=>evaluate({...p,rs:p.rs.map(x=>x===e?{...x,role:"value"}:x)},baseline.out,true,rs));
   // On real graph check whether naïvely expanding mixed components by ID would break an expression constraint.
   const c=heapTopo(p.A,p.B,"ordinary"),naive=Int32Array.from(Array.from(c.out).flatMap(i=>p.parts[i]));let naiveViolations=0;const rank=new Map(Array.from(naive,(v,i)=>[v,i]));for(const e of p.exp)if(rank.get(e.a)>=rank.get(e.b))naiveViolations++;
   rows[layer]={blocks:p.parts.length,multi:p.parts.filter(x=>x.length>1).map(x=>({ids:x,expressionOrder:p.local[p.parts.indexOf(x)]})),naiveViolations,buildMs,localTypedBytes:p.localBytes,methods};
  }
  result[scope]={nodes:nodes.size,owners:[...nodes].filter(v=>owners.has(v)).length,records:rs.length,expressionRecords:rs.filter(e=>e.role!=="package").length,rows};
 }
 // Synthetic adversarial control: ID order reverses a genuine expression edge inside a package cycle.
 const control=[{a:2,b:1,role:"value"},{a:1,b:2,role:"package"}],p=prepare(new Set([1,2]),control,"mixed");ck(J(p.parts)===J([[1,2]])&&J(Array.from(schedule(p,"ordinary").out))===J([2,1]),"internal order control");
 reject(()=>prepare(new Set([1,2]),[...control,{a:1,b:2,role:"type"}],"mixed"));
 reject(()=>prepare(new Set([1]),[{a:1,b:1,role:"value"}],"mixed"));
 return {status:"PARTIAL_EXPORT_NOT_KERNEL_RECHECK",checks,negative,owners:owners.size,identities:ids.size,count,rootExpressionReach:expr.size,rootMixedReach:mixed.size,result};
}
import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2"];
const args=process.argv.slice(2);if(args.length!==4)throw Error("usage: node certificate.mjs direct.json frontier.json next.json literature.json");
const docs=args.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==hashes[i])throw Error("blob mismatch "+p);return JSON.parse(b)});
const result=experiment(docs,()=>performance.now());result.peakRssKiB=process.resourceUsage().maxRSS;console.log(JSON.stringify(result,null,2));
