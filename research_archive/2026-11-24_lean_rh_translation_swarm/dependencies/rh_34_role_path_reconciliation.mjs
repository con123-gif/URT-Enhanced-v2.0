/* DEPENDENCIES 2026-11-25 00:12 UTC — PARTIAL AUTHENTICATED EXPORT RECONCILIATION.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc re-fetched. Current upstream main b2f365a68500e2bde98cd60a2324263fc62fba10 differs, not adopted; no claim newer proof unchanged. Working base d543273638409f84ce6cdd222eb1c8e18da916cb. Read swarm/handoff, AGENTS, state, runner log/protocol excerpts, continuity, CI #404, current peer checkpoint list, integration 00:00, structure 23:24, math conductor inverse, audit CR, kernel RUN18. No physics edits.
Actual 34-target projection PASS run 45508109328 (2026-11-24 23:31:55 UTC): 34/34, 146 type, 324 value, 0 structural, 1412 expression reads, projection 779 ms, wall 1065.55 s. Five exact Git blob objects fetched (large report via blob endpoint, normal content endpoint truncated). Reconciled original role records, checked each 34-target incoming path against prior reports. Executed semantic tests in V8, no native CLI replay in this session. Observed result {"checks":95784,"owners":176,"identities":4301,"counts":{"type":4194,"value":14335,"package":37,"rhs":4},"previous":{"observed":1309,"expanded":127},"mixed":{"observed":1539,"expanded":127},"expression":{"observed":1531,"expanded":126},"valueConstant":{"observed":1471,"expanded":126},"generated":[{"id":13125906,"name":"UpperTheory.TP.TLiftK._proof_1","typeRoot":9078396,"valueRoot":9078404,"typeRefs":10,"valueRefs":4},{"id":13125937,"name":"UpperTheory.TP.TLiftK._proof_2","typeRoot":9838915,"valueRoot":9838921,"typeRefs":13,"valueRefs":12},{"id":13125938,"name":"UpperTheory.TP.TLiftK._proof_3","typeRoot":9838937,"valueRoot":9838943,"typeRefs":17,"valueRefs":12},{"id":13125939,"name":"UpperTheory.TP.TLiftK._proof_4","typeRoot":997980875,"valueRoot":997980883,"typeRefs":29,"valueRefs":25}],"uniquePathEdges":50,"targets":151,"negative":5,"ms":69,"byNamespace":{"Algebra.to_smulCommClass":1,"NumberField.RingOfIntegers":2,"NumberField.of_subfield":1,"UpperTheory.Lit":2,"UpperTheory.One":1,"UpperTheory.LiteratureTheorems":116,"UpperTheory.Gal":11,"UpperTheory.TP":17}}.
Four generated TLiftK root pairs validated here; integration and kernel RUN18 already received them, do not duplicate raw slicing. New manifest expands only unexpanded direct value-constant producers of the 34, UpperTheory definitions/theorems/opaque and four specific external typeclass supplier IDs if not previously expanded. Exact name tags required; unselected is not unreachable. All roles retained in evidence store. Expected reconciliation O(R+E+V) with hash maps plus output path lengths (path validation scans short owner adjacency lists); 69ms measured on five real reports in V8, no fresh peak-RSS measurement for this small reconciliation and no URT acceleration. Full projection uses prior 12-byte disk index, per-role visited sets; universal all-owner scan not demonstrated O(N). No independent kernel recheck or human proof completion.
Replay: node rh_34_role_path_reconciliation.mjs direct.json frontier.json next.json literature.json producers34.json. Run next job: node rh_post34_frontier.mjs --out /tmp/rh-post34.
RESUME HERE: recover compute/rh-post34-frontier-20261125/status.json and outputs/solution_post34_frontier.json, validate each identity and witness, prioritize Lit theorem statement definitions and Galois/Theta producers with specialists. HANDOFF TO literature, theta, Galois, kernel, integration, editor, audit, structure. Project OPEN.
*/
function reconcile(docs){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",root=14065054,n=1065214335;
 let checks=0;const ck=(p,m)=>{if(!p)throw Error(m);checks++},key=JSON.stringify;
 const identities=new Map(),byName=new Map(),owners=new Map(),adj=new Map(),incoming=new Map();
 const counts={type:0,value:0,package:0,rhs:0};
 function ident(id,parts,kind){ck(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length>0&&parts.every(p=>typeof p==="string"||Number.isSafeInteger(p))&&typeof kind==="string","identity");let k=key(parts),v=key([parts,kind]);ck(!identities.has(id)||identities.get(id).v===v,"identity collision");ck(!byName.has(k)||byName.get(k)===id,"tag collision");identities.set(id,{v,parts,kind});byName.set(k,id)}
 const label=id=>identities.get(id).parts.join(".");
 function edge(e){adj.get(e.owner).push(e);if(!incoming.has(e.target))incoming.set(e.target,[]);incoming.get(e.target).push(e);counts[e.role]++}
 for(let i=0;i<5;i++){
  let d=docs[i];ck(d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&d.bytes===61570595788&&d.n===n&&d.root===root&&d.indexedDeclarations===1484733&&d.reports.length===[6,47,18,71,34][i],"archive identity");if(i)ck(d.pin===pin,"pin");
  let t=0,v=0,s=0,reads=0,rhs=0;
  for(const r of d.reports){
   const q=r.request??r.source;
   ck(r.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK"&&!owners.has(r.id),"owner status/duplicate");ident(r.id,q.name.split("."),r.kind);ck(q.id===undefined||q.id===r.id,"requested ID");ck(q.kind===undefined||q.kind===r.kind,"requested kind");owners.set(r.id,{r,i});adj.set(r.id,[]);
   ck(r.type&&(["thm","def","opaque"].includes(r.kind)?!!r.value:r.value===null),"value shape");
   function role(z,role,slot){
    ck(Number.isSafeInteger(z.expressionRoot)&&z.expressionRoot>=0&&z.expressionRoot<n,"expression root");let sum=0;const seen=new Set();
    for(const e of z.references){ident(e.target,e.nameParts,e.targetKind);let k=key([e.kind,e.target]);ck(!seen.has(k)&&["explicit_const","projection_carrier","literal_primitive"].includes(e.kind),"reference identity");seen.add(k);ck(Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=z.expressionRoot&&Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"witness/count");sum+=e.distinctExpressionRecords;edge({owner:r.id,target:e.target,role,kind:e.kind,witness:e.witnessExpression,expressionRoot:z.expressionRoot,...(slot===undefined?{}:{slot})})}
    ck(sum===z.referenceOccurrences,"reference census");return z.references.length
   }
   t+=role(r.type,"type");reads+=r.type.expressionsRead;
   if(r.value){v+=role(r.value,"value");reads+=r.value.expressionsRead}
   if(r.encodedRootsAndStructuralEdges){ck(r.encodedRootsAndStructuralEdges[0]===r.type.expressionRoot+1,"type encoded seed");if(r.value)ck(r.encodedRootsAndStructuralEdges[1]===r.value.expressionRoot+1,"value encoded seed");else ck(r.encodedRootsAndStructuralEdges.length===1+(r.structural??[]).length,"all structural slots retained")}
   for(const e of r.structural??[]){s++;ck(e.encoded===r.encodedRootsAndStructuralEdges[e.edgeIndex],"structural slot");if(e.encoded<0){ident(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1,"structural target");edge({owner:r.id,target:e.target,role:"package",kind:"package_member",slot:e.edgeIndex,encoded:e.encoded})}else{ck(r.kind==="rec"&&e.kind==="recursor_rule_rhs"&&e.expression.expressionRoot+1===e.encoded,"recursor RHS");rhs++;role(e.expression,"rhs",e.edgeIndex)}}
  }
  if(i>=2)ck(t===d.summary.typeEdges&&v===d.summary.valueEdges&&s===d.summary.structuralEdges&&reads===d.summary.expressionReads&&rhs===d.summary.recursorRuleRhs,"report totals")
 }
 function walk(allow){let prev=new Map([[root,null]]),q=[root];for(let j=0;j<q.length;j++)for(const e of adj.get(q[j])??[])if(allow(e)&&!prev.has(e.target)){prev.set(e.target,e);q.push(e.target)}return prev}
 const all=walk(()=>true),expr=walk(e=>e.role!=="package"),proof=walk(e=>e.role==="value"&&e.kind==="explicit_const"),before=walk(e=>owners.get(e.owner).i<3);
 const describe=e=>({...e,ownerName:label(e.owner),targetName:label(e.target)});
 function path(id,walk){if(!walk.has(id))return null;let out=[];while(id!==root){let e=walk.get(id);out.push(describe(e));id=e.owner}return out.reverse()}
 const last=docs[3].reports;
 for(const r of last){const q=r.request;ck(q.id===r.id&&q.kind===r.kind,"71 manifest ID");for(const a of q.incomingWitnesses){const es=adj.get(a.ownerId);ck(owners.get(a.ownerId)?.i<3&&label(a.ownerId)===a.owner&&es.some(e=>e.target===r.id&&(a.role==="structural"?e.role==="package"&&e.slot===a.edgeIndex&&e.encoded===a.encoded:e.role===a.role&&e.kind===a.kind&&e.witness===a.witness)),"incoming witness");if(q.origin==="authenticated_root_path_frontier")ck(before.has(a.ownerId)&&before.has(r.id),"prior root path")}ck(q.origin==="authenticated_root_path_frontier"?all.has(r.id):q.origin==="authenticated_owner_path_not_root_bound","origin")}
 const special=[326948,550025,856978].map(id=>({id,name:label(id),mixedPath:path(id,all),expressionPath:path(id,expr),valueConstantPath:path(id,proof),direct:adj.get(id).map(describe),metadata:owners.get(id).r.mutualBlock}));
 ck(special[0].valueConstantPath!==null&&special[1].mixedPath!==null&&special[1].expressionPath===null&&special[2].mixedPath===null,"special boundary");ck(special[1].direct.filter(x=>x.role==="rhs").length===4,"recursor RHS references");
 const before34=walk(e=>owners.get(e.owner).i<4);
 const oldProof=walk(e=>owners.get(e.owner).i<4&&e.role==="value"&&e.kind==="explicit_const");
 const got34=new Set(),uniquePathEdges=new Set();
 for(const r of docs[4].reports){
  const q=r.request;ck(q.id===r.id&&q.kind===r.kind&&oldProof.has(r.id)&&!got34.has(r.id),"34 identity/root");got34.add(r.id);
  let at=root;
  for(const e of q.path){ck(e.owner===at&&owners.get(at)?.i<4&&e.role==="value"&&e.kind==="explicit_const"&&adj.get(at).some(x=>x.target===e.target&&x.role===e.role&&x.kind===e.kind&&x.witness===e.witness&&x.expressionRoot===e.expressionRoot)&&label(at)===e.ownerName&&label(e.target)===e.targetName,"34 path exact witness");at=e.target;uniquePathEdges.add(key([e.owner,e.target,e.witness]))}
  ck(at===r.id&&q.path.length>0,"34 path endpoint");let e=q.path.at(-1);ck(q.incoming.ownerId===e.owner&&q.incoming.owner===e.ownerName&&q.incoming.witness===e.witness&&q.incoming.role===e.role&&q.incoming.kind===e.kind,"34 incoming");
 }
 ck(got34.size===34,"34 count");
 const generated=[13125906,13125937,13125938,13125939].map(id=>{let r=owners.get(id).r;ck(got34.has(id)&&r.kind==="thm","generated owner");return {id,name:label(id),typeRoot:r.type.expressionRoot,valueRoot:r.value.expressionRoot,typeRefs:r.type.references.length,valueRefs:r.value.references.length}});
 const suppliers=new Set([435583,417457,417477,164561]), selected=new Set(),targets=[];
 for(const owner of got34){
  ck(proof.has(owner),"new owner value reachable");
  for(const e of adj.get(owner)){
   const id=e.target,v=identities.get(id);
   if(e.role!=="value"||e.kind!=="explicit_const"||owners.has(id)||selected.has(id)||!["thm","def","opaque"].includes(v.kind)||(!label(id).startsWith("UpperTheory.")&&!suppliers.has(id))||!v.parts.every(x=>typeof x==="string"&&!x.includes(".")))continue;
   selected.add(id);const a=describe(e);targets.push({name:label(id),id,kind:v.kind,origin:"authenticated_root_path_frontier",incoming:{owner:a.ownerName,ownerId:a.owner,role:a.role,kind:a.kind,witness:a.witness},path:[...path(owner,proof),a]});
  }
 }
 targets.sort((a,b)=>a.id-b.id);
 ck(new Set(targets.map(x=>x.id)).size===targets.length&&targets.length>0,"next target identities");
 const peer=[]; const size=w=>({observed:w.size,expanded:[...w.keys()].filter(id=>owners.has(id)).length});
 return {checks,owners:owners.size,identities:identities.size,counts,previous:size(before34),mixed:size(all),expression:size(expr),valueConstant:size(proof),special,peer,targets,generated,uniquePathEdges:uniquePathEdges.size};
}
import fs from "node:fs";
import crypto from "node:crypto";
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","deabbd86afc8f21d9897ba3bb74349178517fde3"];
const args=process.argv.slice(2);if(args.length!==hashes.length)throw Error("five exact reports required");
const docs=args.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==hashes[i])throw Error("blob mismatch "+p);return JSON.parse(b.toString("utf8"))});
const start=performance.now(),result=reconcile(docs),ms=performance.now()-start;let negative=0;
for(const [obj,k,bad] of [[docs[4],"digest","bad"],[docs[4].reports[0].request.path[0],"witness",-1],[docs[4].reports[0].request.incoming,"ownerId",-1],[docs[4].reports[0].value.references[0],"witnessExpression",-1],[docs[4].reports[0],"id",-1]]){const save=obj[k];obj[k]=bad;let reject=false;try{reconcile(docs)}catch(e){reject=true}obj[k]=save;if(!reject)throw Error("negative failed "+k);negative++}
console.log(JSON.stringify({...result,negative,ms,peakRssKiB:process.resourceUsage().maxRSS},null,2));
