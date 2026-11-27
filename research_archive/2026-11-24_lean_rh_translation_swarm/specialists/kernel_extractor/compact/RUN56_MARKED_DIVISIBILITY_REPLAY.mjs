/*
RUN56 — extend A1 marked-Hecke replacement through the actual local
divisibility theorem, 27 Nov 2026. SOURCE-MATCHED / PREPARED, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger read at blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
4878ea106b791c42b5f5a45810162de59701c4d9, 01fa22a6b12abad5ccf580d2621f82be3bf70c13.
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION and continuity reviewed.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin 40e56bab retained separately.

RUN55 was a two-declaration prepared probe. The actual root-reachable
A1 consumer is not the isolated marked-prime bound: it is
Data.exists_indexDvd_Bmu_divisible in New/Columns/LocalStatement.lean.
This run reuses RUN55 unchanged and propagates its new theorem into
Data.IsMarked.hasType_prod_markOperator_pow, and that theorem into
the marked branch of Data.exists_indexDvd_Bmu_divisible. These are
exact original statements, not weaker surrogate targets.

Original source chain:
  Columns.hasType_markOperator -> Data.IsMarked.hasType_markOperator
  -> Data.IsMarked.hasType_prod_markOperator_pow
  -> Data.exists_indexDvd_Bmu_divisible.
Replacement source chain: RUN54 helper -> RUN55 two replacements
  -> RUN56 product -> RUN56 divisibility.
Only the direct supplier call at each new site changes. Preserve all
other original cases: level prime, collision-small nonsplit, trivial
gauge, integer beta and allowedLoss, the same D, p, integralColumns,
ramifiedColumns, twists, level norms, good data, and index witness.
In particular the original 3*loss(p)*dim bound remains in the product
statement; do not claim the separate RUN78 stronger constant here.
No claim of global removal of approximation or of a complete A1 proof.
Original and reduced direct type/value edges and canonical axiom names
are logged by both guards; transitive graph still needs constructor-
inclusive audit using repaired compact collector. No RH root imported.

Executed on actual connector-returned source in JS: 4/4 anchor
negative controls rejected; both original statement strings retained
modulo names and both direct supplier replacements matched. No local
lean/lake executable. No native reduction commands executed.
Peer 94189600 records actual B2 proof replay for seven declarations,
separate skew/count PASS; recursive graph failed projection carrier
cross-check (run 46006832164), repair owned by integration. A2 runner
RUN79 cd306c11 builds LocalStatement, coordinate shared cache before
its destructive patch step; do not register duplicate expensive job.
C2 shared replay 4cdf568e is separate. A1 RUN78 f1abc81e and prime
RUN77 cbe15af7 retained unchanged. No new mathematical premise.

RESUME HERE: in authenticated unmodified shared A2 workspace after
LocalStatement.olean build, run
  node RUN56_MARKED_DIVISIBILITY_REPLAY.mjs /absolute/grh-checkout /absolute/out --run
Check all four original-statement guards and actual logs, then apply
native scan/prune to the two new consumers (see RUN55 engine invocation),
and compare constructor-inclusive reachability before deleting any edge.
If replay fails, fix the first actual elaboration failure, not another
normalization estimate. No protected workflow edits. RH/star OPEN.
HANDOFF TO kernel, theta, acceleration, integration/audit.
*/
import fs from "node:fs";
import path from "node:path";
import {fileURLToPath} from "node:url";
import {execFileSync,spawnSync} from "node:child_process";
import {createHash} from "node:crypto";

function requireOK(b,m){if(!b)throw Error(m)}
function once(s,a,b){requireOK(s.split(a).length===2,"missing/duplicate anchor "+a);return s.replace(a,b)}
function between(s,a,b){requireOK(s.split(a).length===2&&s.split(b).length===2,"nonunique section anchor");const i=s.indexOf(a),j=s.indexOf(b);requireOK(i<j,"wrong section order");return s.slice(i,j)}
function makeLocal(s){
 const ctx=between(s,"open Polynomial Finset Gf Kernel Module Parameters Real Submodule\n","/-- For a set Λ");
 const start="lemma Data.IsMarked.hasType_prod_markOperator_pow ";
 const end="\ninclude H hQ hv\n";
 const root="lemma Data.exists_indexDvd_Bmu_divisible ";
 let a=between(s,start,end);
 requireOK(s.split(root).length===2,"nonunique root");
 let b=s.slice(s.indexOf(root));
 const aStatement=a.split(" := by\n")[0], bStatement=b.split(" := by\n")[0];
 a=once(a,start,"lemma Data.IsMarked.hasType_prod_markOperator_pow_run56 ");
 a=once(a,"hΛ.hasType_markOperator (D.jetCeil p) l.2","hΛ.hasType_markOperator_run55 (D.jetCeil p) l.2");
 b=once(b,root,"lemma Data.exists_indexDvd_Bmu_divisible_run56 ");
 b=once(b,"peel hΛ.hasType_prod_markOperator_pow.2","peel hΛ.hasType_prod_markOperator_pow_run56.2");
 requireOK(a.split(" := by\n")[0]===aStatement.replace(start,"lemma Data.IsMarked.hasType_prod_markOperator_pow_run56 "),"changed product premises");
 requireOK(b.split(" := by\n")[0]===bStatement.replace(root,"lemma Data.exists_indexDvd_Bmu_divisible_run56 "),"changed root premises");
 return ctx+"seal Space.weightRep Space.embFin\n\n"+a+"\n\n"+b;
}
function negative(s){
 const bad=[
  s.replace("hΛ.hasType_markOperator (D.jetCeil p) l.2","broken"),
  s.replace("peel hΛ.hasType_prod_markOperator_pow.2","broken"),
  s+"\nlemma Data.exists_indexDvd_Bmu_divisible ",
  s.replace("\ninclude H hQ hv\n","\n-- missing include marker\n"),
  s+"\nhΛ.hasType_markOperator (D.jetCeil p) l.2\n" // outside product scope: not an expected rejection
 ];
 let n=0;
 for(const q of bad.slice(0,4)){try{makeLocal(q)}catch(e){n++}}
 requireOK(n===4,"source negative controls");
 return n;
}

const tick=String.fromCharCode(96).repeat(2);
const guard=`
set_option pp.fullNames true
run_cmd do
  let pairs : Array (Lean.Name × Lean.Name × Lean.Name) := #[
    (${tick}Data.IsMarked.hasType_prod_markOperator_pow, ${tick}Data.IsMarked.hasType_prod_markOperator_pow_run56,
      ${tick}Data.IsMarked.hasType_markOperator_run55),
    (${tick}Data.exists_indexDvd_Bmu_divisible, ${tick}Data.exists_indexDvd_Bmu_divisible_run56,
      ${tick}Data.IsMarked.hasType_prod_markOperator_pow_run56)]
  let allowed : Array Lean.Name := #[${tick}propext, ${tick}Classical.choice, ${tick}Quot.sound]
  for (orig, repl, supplier) in pairs do
    let oi ← Lean.getConstInfo orig
    let ni ← Lean.getConstInfo repl
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq oi.type ni.type
    unless same do
      Lean.throwError "RUN56 original declaration type differs"
    let some nv := ni.value? (allowOpaque := true) |
      Lean.throwError "RUN56 replacement value unavailable"
    let nd := nv.getUsedConstants
    if nd.contains orig then
      Lean.throwError "RUN56 replacement calls its original target"
    unless nd.contains supplier do
      Lean.throwError "RUN56 replacement does not use new supplier"
    let oa ← Lean.collectAxioms orig
    let na ← Lean.collectAxioms repl
    unless na.all (fun x => allowed.contains x && oa.contains x) do
      Lean.throwError "RUN56 replacement has unexpected/new axiom"
    Lean.logInfo m!"RUN56 {orig} original_type_edges {oi.type.getUsedConstants.map Lean.Name.toString}"
    Lean.logInfo m!"RUN56 {repl} replacement_type_edges {ni.type.getUsedConstants.map Lean.Name.toString}"
    match oi.value? (allowOpaque := true) with
    | some ov => Lean.logInfo m!"RUN56 {orig} original_value_edges {ov.getUsedConstants.map Lean.Name.toString}"
    | none => Lean.throwError "RUN56 original proof value unavailable; keep frontier open"
    Lean.logInfo m!"RUN56 {repl} replacement_value_edges {nd.map Lean.Name.toString}"
    Lean.logInfo m!"RUN56 {orig} original_axioms {oa.map Lean.Name.toString}"
    Lean.logInfo m!"RUN56 {repl} replacement_axioms {na.map Lean.Name.toString}"
    Lean.logInfo m!"RUN56 checked original type, supplier, direct proof edges and exact axioms: {repl}"
#print axioms Data.IsMarked.hasType_prod_markOperator_pow_run56
#print axioms Data.exists_indexDvd_Bmu_divisible_run56
`;

const here=path.dirname(fileURLToPath(import.meta.url));
const root=path.resolve(process.argv[2]||".");
const out=path.resolve(process.argv[3]||"run56-out");
const compact=path.join(root,"grh-compact");
const pin="72fead102f663d5c7a407964a13dc0cf9d977207";
function blob(b){return createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")}
function checked(p,h){const b=fs.readFileSync(p);requireOK(blob(b)===h,"wrong blob "+p);return b.toString("utf8")}
const prior=path.join(here,"RUN55_MARKED_ACTUAL_CONSUMER_REPLAY.mjs");
checked(prior,"af53b153fee150d720216617314adb79de17e3fb");
const s=checked(path.join(compact,"src/New/Columns/LocalStatement.lean"),"9d5bd0d698b0db2850cbd306d8d400d7e99a3547");
const rejects=negative(s);
fs.mkdirSync(out,{recursive:true});
const out55=path.join(out,"run55");
execFileSync("node",[prior,root,out55],{stdio:"inherit"});
const base=fs.readFileSync(path.join(out55,"MarkedCallerRun55.lean"),"utf8");
const body=once(base,"import New.Columns.MarkedPrimeType\n","import New.Columns.LocalStatement\n")+"\n"+makeLocal(s)+"\n"+guard;
const probe=path.join(out,"MarkedDivisibilityRun56.lean");
fs.writeFileSync(probe,body);
const state={pin,negative_controls_rejected:rejects,generated_blob:blob(Buffer.from(body)),native_verified:false,full_RH_replay:false};
const receipt=path.join(out,"run56_result.json");
function save(){fs.writeFileSync(receipt,JSON.stringify(state,null,2))}
save();
function run(file,log){
 const fd=fs.openSync(log,"w");let p;
 try{p=spawnSync("lake",["env","lean","--tstack=400000",file],{cwd:compact,stdio:["ignore",fd,fd],timeout:900000})}finally{fs.closeSync(fd)}
 const txt=fs.readFileSync(log,"utf8");
 return {exit:p.status,signal:p.signal,error:p.error?.message??null,
   run55_guards:(txt.match(/RUN55 checked original type, supplier, direct proof edges and exact axioms:/g)||[]).length,
   run56_guards:(txt.match(/RUN56 checked original type, supplier, direct proof edges and exact axioms:/g)||[]).length};
}
if(process.argv.includes("--run")||process.argv.includes("--scan")){
 state.caller=run(probe,path.join(out,"caller.log"));
 state.native_verified=state.caller.exit===0&&state.caller.run55_guards===2&&state.caller.run56_guards===2;
 save();requireOK(state.native_verified,"four-caller replay incomplete; retain caller.log");
}
if(process.argv.includes("--scan")){
 const engine=checked(path.join(here,"../RHProofTermPrune.lean"),"f6d3e7f6047a7895ecf183be3fb54c203f4fc46a");
 const targets=["Data.IsMarked.hasType_prod_markOperator_pow","Data.IsMarked.hasType_prod_markOperator_pow_run56","Data.exists_indexDvd_Bmu_divisible","Data.exists_indexDvd_Bmu_divisible_run56"];
 const scan=path.join(out,"MarkedDivisibilityScanRun56.lean");
 fs.writeFileSync(scan,once(body,"import New.Columns.LocalStatement\n","import Lean\nimport New.Columns.LocalStatement\n")+"\n"+once(engine,"import Lean\n","")+"\n"+targets.map((n,i)=>"rh_scan "+n+" limit 2000\nrh_prune "+n+" as Run56Pruned"+i).join("\n")+"\n");
 state.scan=run(scan,path.join(out,"scan.log"));save();
 requireOK(state.scan.exit===0,"scan/prune failed; preserve logs");
}
