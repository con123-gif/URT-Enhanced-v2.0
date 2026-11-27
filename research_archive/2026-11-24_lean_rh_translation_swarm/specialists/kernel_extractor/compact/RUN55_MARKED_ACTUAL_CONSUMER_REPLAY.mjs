/*
RUN55 — A1/V1 actual-caller replay bridge, 27 Nov 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
SOURCE-MATCHED / PREPARED; NOT Lean-replayed. This is a verification advance,
not a new mathematical bound. Reuses RUN54 (2f04e074) unchanged, no new premise.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin remains historical.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
f62d03bdcd987268e70657298702a238335fb3e6 / b24ae883acc131f657241e944d523013ac5432a9.
AGENTS, swarm, handoff, expansion, peer RUN78 f1abc81e and RUN77 cbe15af7
read. Integration 97bc2912 already repairs B2 opaque audit; acceleration
cd306c11 prepares A2 replay. Do not duplicate their work.

A1: actual caller graph (source edges, not elaborated):
Columns.hasType_markOperator -> Data.IsMarked.hasType_markOperator
-> New/Columns/LocalStatement.lean (blob 9d5bd0d698b0db2850cbd306d8d400d7e99a3547).
Replacement graph: RUN54 local open-matrix density -> renamed exact original
Columns theorem -> renamed exact original Data.IsMarked theorem. The latter
retains all twist, weight, p, level, scale, finite field, and size premises.
Original global approximation at other occurrences remains. No global
dependency deletion, no claimed RH import, no change to protected files.

The new driver constructs BOTH original-statement replacements in one
disposable probe importing original MarkedPrimeType, not the RH root.
The native guards compare the actual types in the SAME environment,
require proof values (allowOpaque=true, see Lean 4.35.0 Declaration.lean),
check exact direct supplier consumption and absence of the old target,
and compare canonical axiom Names (not pretty-printed choice aliases).
It logs original/reduced direct type/value edges for later graph audit.
rh_scan/rh_prune are prepared separately for actual candidates and originals;
no rule-search goals arise until native elaboration exposes a failure.
Do not confuse direct edges with transitive/constructor-inclusive closure;
reuse KernelGraphExport_v3 for that later. No old graph discarded.

Actual JS source construction on connector-returned pinned files succeeded:
3/3 changed/deleted/duplicate anchor controls rejected; exact downstream
apply renamed once, no original apply remains. Local command -v lean/lake
returned no executable; no rh_scan/prune/reduce/auto/frontier executed here.
No native PASS for A1. No URT comparison claimed.

Actual latest B2 receipt 45998845682 status error (blob c2bedaa5acd2a8d68d42a49a461675d3f3ed417b);
b2_build exit 0, candidate exit 1, original_callers exit 0, missing guard
control rejected. active_b2_energy.log bbfb981a34c342107737e35786b6287556132142:
pair and energy theorem types printed, two proof-value guards fail because
ConstantInfo.value? defaults allowOpaque=false, and choice display shortened.
Integration 97bc2912 owns repair; do not report full PASS. Separate skew
replacement has actual type mismatch -(P*alpha)^H * X vs -((P*alpha)^H*X)
and sorryAx, receipt cbbcf8c04095cf9da0c29370120084cc3f06c14b; remains rejected.

RESUME HERE: in shared A2 runner workspace after original LocalStatement
build (imports MarkedPrimeType -> TwistedHeckeType), run
  node RUN55_MARKED_ACTUAL_CONSUMER_REPLAY.mjs /absolute/pinned/grh-checkout /absolute/out --run
Inspect both original-statement guards and actual Lean failures, retain logs;
if both guards succeed, run --scan to capture bounded native scan/prune
for original and replacement. Do not register duplicate expensive build;
coordinate with shared A2 runner, which already compiles these imports.
HANDOFF TO kernel/dependency, acceleration, theta, integration/audit.
All A1 root obligations remain OPEN.
*/
import fs from "node:fs";
import path from "node:path";
import {fileURLToPath} from "node:url";
import {execFileSync,spawnSync} from "node:child_process";
import {createHash} from "node:crypto";
const here=path.dirname(fileURLToPath(import.meta.url));
const root=path.resolve(process.argv[2]||".");
const out=path.resolve(process.argv[3]||"run55-out");
const compact=path.join(root,"grh-compact");
const pin="72fead102f663d5c7a407964a13dc0cf9d977207";
function req(ok,msg){if(!ok)throw Error(msg)}
function blob(b){return createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")}
function checked(p,h){const b=fs.readFileSync(p);req(blob(b)===h,"wrong blob "+p);return b.toString("utf8")}
function once(x,a,b){req(x.split(a).length===2,"nonunique anchor "+a);return x.replace(a,b)}
req(execFileSync("git",["rev-parse","HEAD"],{cwd:root,encoding:"utf8"}).trim()===pin,"wrong compact pin");
req(fs.readFileSync(path.join(compact,"lean-toolchain"),"utf8").trim()==="leanprover/lean4:v4.35.0","wrong Lean pin");
const manifest=JSON.parse(fs.readFileSync(path.join(compact,"lake-manifest.json"),"utf8"));
req(manifest.packages.some(p=>p.name==="mathlib"&&p.rev==="56a005855ea17e0b0958f73ec801ae140b0a1679"),"wrong Mathlib pin");
const prev=checked(path.join(here,"RUN54_MARKED_OPEN_MATRIX_CALLER_SPLICE.mjs"),"4c16e62b9f90cdb4c201c3f17ae789aac81d5b67");
const s=checked(path.join(compact,"src/New/Columns/TwistedHeckeType.lean"),"ccae44b8b21d1bface80bc3c8b10370a48c8ea48");
const t=checked(path.join(compact,"src/New/Columns/MarkedPrimeType.lean"),"5433d457d06b8f0e209209be1407fe1971ef86f8");
const literal=n=>JSON.parse(prev.match(new RegExp("^const "+n+"=(.*);$","m"))[1]);
const a=literal("anchor"), old=literal("old"), replacement=literal("replacement"), helper=literal("helper");
const header="import New.Columns.MarkedPrimeType\n\nseal Finset.univ Finset.sum Finset.prod\nopen Ideal IsSplitLevel QuadField Matrix NumberField Parameters Real Ideal.Quotient Data Finset Space\nopen GeneralLinearGroup Function TwistingData Gf ComplexConjugate WithZero Fintype\nseal liftKernel Kernel.lift SmoothForm\n\n";
function make(s,t){
  req(s.split(a).length===2,"source context anchor");
  const tail=s.slice(s.indexOf(a));
  let q=once(tail,old,replacement);
  q=once(q,"lemma Columns.hasType_markOperator ","lemma Columns.hasType_markOperator_run55 ");
  let c=once(t,"import New.Columns.TwistedHeckeType\n","");
  c=once(c,"theorem IsMarked.hasType_markOperator ","theorem IsMarked.hasType_markOperator_run55 ");
  c=once(c,"apply Columns.hasType_markOperator ","apply Columns.hasType_markOperator_run55 ");
  req(!c.includes("apply Columns.hasType_markOperator "),"old direct caller remains");
  return header+helper+q+"\n"+c+"\nend Data\n";
}
let rejects=0;
for(const [x,y] of [[s.replace(old,"broken"),t],[s,t.replace("apply Columns.hasType_markOperator ","apply broken ")],[s+"\n"+old,t]]){try{make(x,y)}catch(e){rejects++}}
req(rejects===3,"negative controls");
const tick=String.fromCharCode(96).repeat(2);
const guard=`
set_option pp.fullNames true
run_cmd do
  let pairs : Array (Lean.Name × Lean.Name × Lean.Name) := #[
    (${tick}Columns.hasType_markOperator, ${tick}Columns.hasType_markOperator_run55,
      ${tick}kernelRun54_local_double_integral),
    (${tick}Data.IsMarked.hasType_markOperator, ${tick}Data.IsMarked.hasType_markOperator_run55,
      ${tick}Columns.hasType_markOperator_run55)]
  let allowed : Array Lean.Name := #[${tick}propext, ${tick}Classical.choice, ${tick}Quot.sound]
  for (orig, repl, supplier) in pairs do
    let oi ← Lean.getConstInfo orig
    let ni ← Lean.getConstInfo repl
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq oi.type ni.type
    unless same do
      Lean.throwError "RUN55 original declaration type differs"
    let some nv := ni.value? (allowOpaque := true) |
      Lean.throwError "RUN55 replacement value unavailable"
    let nd := nv.getUsedConstants
    if nd.contains orig then
      Lean.throwError "RUN55 replacement calls its original target"
    unless nd.contains supplier do
      Lean.throwError "RUN55 replacement does not use new supplier"
    let oa ← Lean.collectAxioms orig
    let na ← Lean.collectAxioms repl
    unless na.all (fun x => allowed.contains x && oa.contains x) do
      Lean.throwError "RUN55 replacement has unexpected/new axiom"
    Lean.logInfo m!"RUN55 {orig} original_type_edges {oi.type.getUsedConstants.map Lean.Name.toString}"
    Lean.logInfo m!"RUN55 {repl} replacement_type_edges {ni.type.getUsedConstants.map Lean.Name.toString}"
    match oi.value? (allowOpaque := true) with
    | some ov => Lean.logInfo m!"RUN55 {orig} original_value_edges {ov.getUsedConstants.map Lean.Name.toString}"
    | none => Lean.throwError "RUN55 original proof value unavailable; keep frontier open"
    Lean.logInfo m!"RUN55 {repl} replacement_value_edges {nd.map Lean.Name.toString}"
    Lean.logInfo m!"RUN55 {orig} original_axioms {oa.map Lean.Name.toString}"
    Lean.logInfo m!"RUN55 {repl} replacement_axioms {na.map Lean.Name.toString}"
    Lean.logInfo m!"RUN55 checked original type, supplier, direct proof edges and exact axioms: {repl}"
#print axioms Columns.hasType_markOperator_run55
#print axioms Data.IsMarked.hasType_markOperator_run55
`;
fs.mkdirSync(out,{recursive:true});
const probe=path.join(out,"MarkedCallerRun55.lean");
const body=make(s,t)+guard;
fs.writeFileSync(probe,body);
fs.writeFileSync(path.join(out,"preflight.json"),JSON.stringify({pin,negative_controls_rejected:rejects,generated_blob:blob(Buffer.from(body)),native_verified:false},null,2));
function run(file,log){
  const fd=fs.openSync(log,"w");
  let p;
  try{p=spawnSync("lake",["env","lean",file],{cwd:compact,stdio:["ignore",fd,fd],timeout:900000});}
  finally{fs.closeSync(fd)}
  const output=fs.readFileSync(log,"utf8");
  return {exit:p.status,signal:p.signal,error:p.error?.message??null,
    original_statement_guards:(output.match(/RUN55 checked original type, supplier, direct proof edges and exact axioms:/g)||[]).length};
}
if(process.argv.includes("--run")||process.argv.includes("--scan")){
  const result=run(probe,path.join(out,"caller.log"));
  fs.writeFileSync(path.join(out,"caller_result.json"),JSON.stringify({...result,scope:"local two-theorem candidate only",full_RH_replay:false},null,2));
  req(result.exit===0&&result.original_statement_guards===2,"candidate replay/audit incomplete, inspect caller.log");
}
if(process.argv.includes("--scan")){
  const engine=checked(path.join(here,"../RHProofTermPrune.lean"),"f6d3e7f6047a7895ecf183be3fb54c203f4fc46a");
  const targets=["Columns.hasType_markOperator","Columns.hasType_markOperator_run55","Data.IsMarked.hasType_markOperator","Data.IsMarked.hasType_markOperator_run55"];
  const scan=path.join(out,"MarkedCallerScanRun55.lean");
  // Native engine regression tests retained, then actual theorem contexts.
  fs.writeFileSync(scan,once(body,"import New.Columns.MarkedPrimeType\n","import Lean\nimport New.Columns.MarkedPrimeType\n")+"\n"+once(engine,"import Lean\n","")+"\n"+targets.map((n,i)=>"rh_scan "+n+" limit 2000\nrh_prune "+n+" as Run55Pruned"+i).join("\n")+"\n");
  const result=run(scan,path.join(out,"scan.log"));
  fs.writeFileSync(path.join(out,"scan_result.json"),JSON.stringify({...result,scope:"bounded scan/prune; not global closure"},null,2));
  req(result.exit===0,"scan/prune replay failed; preserve all logs");
}
