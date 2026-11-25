/* RUN21 — 2026-11-25, PARTIAL / AUTHENTICATED EXPORTED EXPRESSION AUDIT.
Independent task: close the precise structural instance mismatch left open in RUN19/RUN20.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; TLiftK.lean pinned blob
4b36fc43e988270944cef2fc1b5e9ee1493fc275, src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/TLiftK.lean.
Upstream observed fcb6eac7534875d32d68030967e2deae6d686151 (changed from c40250a50104b7e02e7d74f658d00fa7b1f4827c).
Current Main.lean 67c65badc15f80a1db65df1c84dc7a4928fc410f, lean-toolchain 0e037f58f9a1aa2d5139277bcc4be0061ebeeb05,
TLiftK 35d26e2a7115dd2d4bed12c169866e93de6d3856 unchanged between these upstream checkpoints. No repinning.
Read protocol/queue/expansion/AGENTS/state/log/continuity excerpts, CI checkpoint #413 PASS (not this task),
RUN19, RUN20, all 14 peer lane recent handoffs; integration owns CoreAll/rest, dependencies owns 151-target graph,
acceleration manifest cache, theta singular-test analytic steps. Blueprint not reopened, no reliance on it.
Input: cathedral-research-state/compute/rh-bounded-raw-scope-20261125/outputs/selected_raw_scope.json
blob 63c3592e4b3997433e5e0af910eddf6137cdac69, archive SHA256 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e.
GitHub connector returned blob identity; CLI independently hashes raw bytes. Actual V8 test on retrieved data.
No new native Lean execution (lean executable absent in local container). No new archive download; no retained archive in current container.

Mathematical result: the proof4 declared goal SMulCommClass F A A uses generated proof1/2/3 applications,
while its supplier Algebra.to_smulCommClass uses their supplying terms. Each application is exactly applied
to E, Field E, NumberField E (de Bruijn indices 2,1,0) in the identical outer context. Replace precisely the
three full applications with the corresponding three stored lambda bodies; do not rewrite arbitrary occurrences
or descend into different binder depth for a replacement. Under that explicit syntactic expansion the four
ambient terms AF, AdeleRing, Semiring, Algebra are exactly equal to the supplier-side expressions, including
all ordered application slots, bound variables, binder metadata and universe IDs. The second goal action is
instSMulOfMul via Distrib.toMul and instDistribOfSemiring from the same semiring; the first is Algebra.toSMul
from the same algebra and semiring. This resolves the expression-level correspondence, NOT Lean's
definitional equality, theorem opacity, proof irrelevance/type checking, or validity of the imported supplier.
All original raw terms and dependency paths remain in evidence; expansion is an explanatory view only.
Proof of check: equal canonical IDs imply equal finite trees by induction on constructor keys and ordered children.
The lockstep traversal additionally enumerates each replacement path and independently agrees; binder depths
checked in both traversals. Finite input; memoized interning O(scoped DAG nodes+edges), ignoring key lengths;
expanded lockstep can be exponential and is only used on these four small terms.
Initial implementation failed on a genuine nested lambda in maximalRealSubfield expression; corrected to track
binder depth and reject replacement outside the common depth 3. No ignored binder or mutation failure.
Actual result:
{"checks":63,"negatives":8,"interned":92,"visited":115,"equalities":[{"name":"AF","goal":997980834,"supplier":997980876,"substitutionOccurrences":[1,0,0],"paths":[{"path":"a","source":997980833,"replacement":9078401}]},{"name":"AdeleRing","goal":997980850,"supplier":9841520,"substitutionOccurrences":[0,1,1],"paths":[{"path":"fffa","source":997980842,"replacement":9838918},{"path":"a","source":997980849,"replacement":9838940}]},{"name":"Semiring","goal":997980858,"supplier":9841530,"substitutionOccurrences":[0,3,3],"paths":[{"path":"fafffa","source":997980842,"replacement":9838918},{"path":"faa","source":997980849,"replacement":9838940},{"path":"afafffa","source":997980842,"replacement":9838918},{"path":"afaa","source":997980849,"replacement":9838940},{"path":"aafffa","source":997980842,"replacement":9838918},{"path":"aaa","source":997980849,"replacement":9838940}]},{"name":"Algebra","goal":997980863,"supplier":9841535,"substitutionOccurrences":[0,1,1],"paths":[{"path":"fffa","source":997980842,"replacement":9838918},{"path":"a","source":997980849,"replacement":9838940}]}],"scope":"syntactic expansion only; no kernel conversion or fresh axiom check"}
RESUME HERE: TLiftK parent roots 3,997984088 still not available raw; no current registry job for caller.
Coordinate a single shared raw-archive request with dependency/acceleration for parent and outstanding peer roots,
or use retained archive/offsets if available; reconstruct both ResEtaPow argument spines and map exact generated
proof4 usage. Do not infer parent occurrence slots from auxiliary equivalence. HANDOFF TO integration, theta,
Galois, editor, audit, dependencies, acceleration. RH project OPEN; no URT improvement or new kernel validation.
*/
function certificate(d){
 let checks=0,negatives=0;
 const ck=(p,m)=>{if(!p)throw Error(m);checks++},eq=(a,b,m)=>ck(JSON.stringify(a)===JSON.stringify(b),m);
 ck(d.pin==="40e56bab026552e089d7afcfeff08d2defb9c005"&&d.archiveDigest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&!d.partial&&d.unresolved.length===0,"provenance");
 const a=new Map(d.records.ie.map(([i,s])=>[i,JSON.parse(s)]));ck(a.size===d.records.ie.length&&a.size===256,"raw rows");
 const rows=[[13125906,9078396,9078404,9078401,997980833],[13125937,9838915,9838921,9838918,997980842],[13125938,9838937,9838943,9838940,997980849],[13125939,997980875,997980883,997980880,null]];
 function get(i){const e=a.get(i);if(!e||e.ie!==i)throw Error("missing expression "+i);return e}
 function spine(i){let args=[];while(get(i).app){let z=get(i).app;args.unshift(z.arg);i=z.fn}return {head:get(i).const?.name??null,args}}
 function strip(i,kind){let result=[];while(get(i)[kind]){const x=get(i)[kind];result.push([x.type,x.binderInfo]);i=x.body}return {result,body:i}}
 const subst=new Map;
 for(const [id,t,v,body,app] of rows){
  const owner=d.ownerRecords.filter(x=>x.id===id);ck(owner.length===1&&owner[0].kind==="thm","owner kind");
  eq(owner[0].encodedRootsAndStructuralEdges,[t+1,v+1],"owner roots");
  let T=strip(t,"forallE"),V=strip(v,"lam");
  eq(T.result,[[315,"default"],[2200840,"instImplicit"],[8711353,"instImplicit"]],"type context");
  eq(T.result,V.result,"matching value context");eq(V.body,body,"value body");
  if(app!==null){eq(spine(app),{head:id,args:[13,2,1]},"fully applied auxiliary");eq([get(13).bvar,get(2).bvar,get(1).bvar],[2,1,0],"identity substitution");subst.set(app,body)}
 }
 eq(strip(997980875,"forallE").body,997980872,"goal body");
 eq(spine(997980872),{head:110448,args:[9078386,997980834,997980834,997980864,997980871]},"goal spine");
 eq(spine(997980880),{head:164561,args:[9078386,997980876,9838930,9841530,9841535]},"supplier spine");
 eq(spine(997980864).args,[9078386,997980834,9838930,997980858,997980863],"first action inputs");
 eq(spine(997980871).args,[997980834,997980870],"second action inputs");
 eq(spine(997980870).args,[997980834,997980869],"multiplication projection");
 eq(spine(997980869).args,[997980834,997980858],"distribution inputs");
 const pairs=[[997980834,997980876,"AF"],[997980850,9841520,"AdeleRing"],[997980858,9841530,"Semiring"],[997980863,9841535,"Algebra"]];
 function shape(i,depth){
  const e=get(i),{ie,...payload}=e;
  if(e.app)return {key:["app"],children:[[e.app.fn,depth,"f"],[e.app.arg,depth,"a"]]};
  for(const k of ["lam","forallE"]){if(e[k]){const {type,body,...meta}=e[k];return {key:[k,meta],children:[[type,depth,"t"],[body,depth+1,"b"]]}}}
  if("bvar" in e&&(!Number.isInteger(e.bvar)||e.bvar<0||e.bvar>=depth))throw Error("scope "+i);
  if(e.proj){const {struct,...meta}=e.proj;return {key:["proj",meta],children:[[struct,depth,"p"]]}}
  if(e.const||"bvar"in e||"sort"in e||"natVal"in e||"strVal"in e)return {key:[payload],children:[]};
  throw Error("unsupported expression "+i);
 }
 // Structural interning with exact JSON keys, not probabilistic hashes.
 function validate(map,pairList=pairs){
  const ids=new Map,memo=new Map,active=new Set;
  function normalize(i,depth){
   const m=i+":"+depth;if(memo.has(m))return memo.get(m);
   if(active.has(m))throw Error("cycle");active.add(m);
   let result;
   if(map.has(i)){if(depth!==3)throw Error("nonidentity context");result=normalize(map.get(i),depth)}
   else{const s=shape(i,depth);const k=JSON.stringify([s.key,s.children.map(([j,d])=>normalize(j,d))]);if(!ids.has(k))ids.set(k,ids.size+1);result=ids.get(k)}
   memo.set(m,result);active.delete(m);return result;
  }
  // Independent lockstep expanded-tree comparison retaining every replaced path.
  function compare(x,y,depth,path,ledger){
   if(map.has(x)){if(depth!==3)throw Error("nonidentity context");ledger.push({path,source:x,replacement:map.get(x)});x=map.get(x)}
   if(map.has(y))throw Error("unexpected substitution on supplier side");
   const X=shape(x,depth),Y=shape(y,depth);
   if(JSON.stringify(X.key)!==JSON.stringify(Y.key)||X.children.length!==Y.children.length)throw Error("node mismatch "+x+"/"+y);
   X.children.forEach(([j,d,slot],k)=>{const [l,dd,ss]=Y.children[k];if(d!==dd||slot!==ss)throw Error("child slot");compare(j,l,d,path+slot,ledger)});
  }
  const results=[];
  for(const [x,y,name] of pairList){
   if(normalize(x,3)!==normalize(y,3))throw Error("not structurally equal "+name);
   let ledger=[];compare(x,y,3,"",ledger);
   const counts=[...map.keys()].map(i=>ledger.filter(q=>q.source===i).length);
   results.push({name,goal:x,supplier:y,substitutionOccurrences:counts,ledger});
  }
  return {interned:ids.size,visited:memo.size,results};
 }
 const report=validate(subst);
 eq(report.results.length,4,"four equalities");
 for(const row of report.results){ck(row.ledger.length>0,"actual substitution");ck(new Set(row.ledger.map(z=>z.path)).size===row.ledger.length,"unique ordered paths");for(const z of row.ledger){eq(subst.get(z.source),z.replacement,"ledger map");}}
 function reject(f){let rejected=false;try{f()}catch(e){rejected=true}ck(rejected,"negative accepted");negatives++}
 for(const [x,y] of subst){const m=new Map(subst);m.delete(x);reject(()=>validate(m));}
 for(const [x,y] of subst){const m=new Map(subst);m.set(x,9078386);reject(()=>validate(m));}
 reject(()=>validate(subst,[[997980858,9841535,"wrong instance slot"]]));
 const old=a.get(13);a.set(13,{ie:13,bvar:99});reject(()=>validate(subst));a.set(13,old);
 return {checks,negatives,interned:report.interned,visited:report.visited,equalities:report.results.map(({ledger,...x})=>({...x,paths:ledger})),scope:"syntactic expansion only; no kernel conversion or fresh axiom check"};
}
import fs from "node:fs";
import crypto from "node:crypto";
const p=process.argv[2];if(!p)throw Error("usage: node run21_tliftk_instance_coherence.mjs selected_raw_scope.json");
const bytes=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+bytes.length+"\0").update(bytes).digest("hex")!=="63c3592e4b3997433e5e0af910eddf6137cdac69")throw Error("input blob");
console.log(JSON.stringify(certificate(JSON.parse(bytes.toString("utf8"))),null,2));
