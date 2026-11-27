#!/usr/bin/env node
/*
RUN86, 27 Nov 2026. A2 actual short-forms -> A/B family -> star caller
connection. SOURCE-MATCHED / PREPARED, NOT KERNEL-VERIFIED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
87c621d0d18103ec2eb9be14bf774b8bff2a747d, ledger 2c9e5148a947ff4b28482afd18c4d7c810af97d5,
protocols and current B2/C2 and A1/A2 evidence.
A2 latest actual status 07a2b14930c38095e6771ae9ed1a10a3cf1bf678 (run
46023465491): ERROR, not a replacement proof. Artifact 15213743994 has
original graph/log evidence, no original compiled olean cache; kernel
retention patch 42f6ef9e is prepared, not a produced A2 cache receipt.
Peer C2 chain 46050109450 success, separate scope. C1 shared
46055305146 in progress at inspection. No new native execution here.
Do not start duplicate cold build.

NEW: the actual A2 index is consumed by Data.short_forms in one exact
source occurrence. The same short_forms witness (q,B,S,index) is selected
with D.enough_forms by Data.exists_family_covolumeSq_le. The star body
consumes this same (n,y,i,big,delta,index,I,short) and unchanged C
integral_forms_long i big I short. Thus an exact-type A2 replacement can
be carried to A and the A/B family by the existing normal-kernel
jet84Transport, and to star by replaying ONLY its own source body with
the one family reference replaced; never import New.Main or Main.
No separate selection of A, B or C witnesses, no premise weakening
claimed. Original and reduced star source roundtrip exact. Source checks
on all three pinned connector files executed in V8, 5/5 damaged source
negative controls rejected. Full elaborated dependency edges and axiom
guards remain to be executed; source reference is not a kernel edge.
No global removal of the old frame inferred, no URT speed claim.
A1/theta joint fusion and all other live suppliers remain open. Preserve
original and reduced graphs and failure evidence. This staged extension
does not rerun or change RUN85. It only accepts a general-phase RUN85
actual native receipt and identical paired stream as an input.

Usage AFTER shared RUN85 general native receipt and existing original
ShortAndEnough/LongForms build (do not cold-build for this script):
node RUN86_A2_ACTUAL_STAR_CALLERS.mjs ROOT PAIR85_DIR OUT short
node RUN86_A2_ACTUAL_STAR_CALLERS.mjs ROOT PAIR85_DIR OUT2 star
ROOT is the upstream pinned repository, not grh-compact.
Then in ROOT/grh-compact use lake env lean --tstack=400000 with absolute
generated Jet86Short.lean or Jet86Star.lean, preserving native logs.
The full original and replacement A and family types are checked by
jet84Transport; star uses exact original source statement with new name.
No original star proof is imported, used, or counted as a shortcut.
For root dependency audit use accepted compact strict exporter with
roots Data.short_forms, Data.short_forms_jet_run86,
Data.exists_family_covolumeSq_le, Data.exists_family_covolumeSq_le_jet_run86,
star_inequality_jet_run86 (star stage), and independent axiom checks.
Do not report native PASS without actual logs, graph and negative controls.
RESUME HERE: obtain/inspect the shared A2 original workspace receipt and
execute RUN85 general there before executing this staged caller extension.
HANDOFF TO kernel/integration/theta/audit.
*/
import fs from 'node:fs';
import path from 'node:path';
import {createHash} from 'node:crypto';
import {execFileSync} from 'node:child_process';
function plan(short,long,main){
  const require=(b,m)=>{if(!b)throw Error(m)};
  const count=(s,a)=>s.split(a).length-1;
  const once=(s,a,b)=>{require(count(s,a)===1,"anchor missing or ambiguous: "+a);return s.replace(a,b)};
  const region=(s,a,b)=>{require(count(s,a)===1,"start anchor "+a);const i=s.indexOf(a),j=s.indexOf(b,i+a.length);require(j>i,"end anchor "+b);return s.slice(i,j)};
  const A=region(short,"lemma Data.short_forms :","/-- Enough forms:");
  const familyStart="lemma Data.exists_family_covolumeSq_le (D : Data P) :";
  require(count(long,familyStart)===1,"family declaration missing");
  const AB=long.slice(long.indexOf(familyStart));
  const star=region(main,"lemma star_inequality {P} {D : Data P} :","/-- One-sided bound:");
  require(count(A,"(exists_indexDvd_Bmu_divisible (Int.ceil_lt_add_one _)).elim")===1,"actual A index consumer");
  require(count(AB,"D.short_forms, D.enough_forms")===1,"same witness A/B consumer");
  require(count(star,"D.exists_family_covolumeSq_le.elim")===1,"actual star family consumer");
  require(count(star,"integral_forms_long i big I short")===1,"C must consume same witness");
  require(short.includes("import New.Columns.LocalStatement\n")&&long.includes("import New.Endgame.ShortAndEnough\n")&&main.includes("import New.Endgame.LongForms\n"),"actual module edges");
  require(count(main,"open DirichletCharacter Real Finset Filter Data Parameters ZMod Module\n")===1,"star namespace context");
  const tick=String.fromCharCode(96);
  const trans=(old,fresh,dep,replacement)=>"run_cmd jet84Transport "+tick+old+" "+tick+fresh+" #[("+tick+dep+", "+tick+replacement+")]\n";
  const shortTail="\n"+trans("Data.short_forms","Data.short_forms_jet_run86","Data.exists_indexDvd_Bmu_divisible","Data.exists_indexDvd_Bmu_divisible_jet_run84");
  const familyTail=trans("Data.exists_family_covolumeSq_le","Data.exists_family_covolumeSq_le_jet_run86","Data.short_forms","Data.short_forms_jet_run86");
  const starNew=once(once(star,"lemma star_inequality {P}","lemma star_inequality_jet_run86 {P}"),"D.exists_family_covolumeSq_le.elim","D.exists_family_covolumeSq_le_jet_run86.elim");
  require(once(once(starNew,"lemma star_inequality_jet_run86 {P}","lemma star_inequality {P}"),"D.exists_family_covolumeSq_le_jet_run86.elim","D.exists_family_covolumeSq_le.elim")===star,"star roundtrip differs");
  const audit="\nrun_cmd do\n  let info ← Lean.getConstInfo "+tick+tick+"star_inequality_jet_run86\n  let some v := info.value? (allowOpaque := true) | Lean.throwError \"RUN86 missing star proof\"\n  let deps := v.getUsedConstants\n  unless deps.contains "+tick+tick+"Data.exists_family_covolumeSq_le_jet_run86 && !deps.contains "+tick+tick+"Data.exists_family_covolumeSq_le do\n    Lean.throwError \"RUN86 actual family edge not replaced\"\n  unless deps.contains "+tick+tick+"Data.integral_forms_long do\n    Lean.throwError \"RUN86 common C witness supplier missing\"\n  let axs ← Lean.collectAxioms "+tick+tick+"star_inequality_jet_run86\n  unless axs.all (fun n => #["+tick+tick+"propext, "+tick+tick+"Classical.choice, "+tick+tick+"Quot.sound].contains n) do\n    Lean.throwError \"RUN86 unexpected star axiom\"\n  Lean.logInfo \"RUN86_STAR_CHECKED\"\n#print axioms star_inequality_jet_run86\n";
  return {shortTail,starTail:shortTail+familyTail+"\nopen DirichletCharacter Real Finset Filter Data Parameters ZMod Module\n\n"+starNew+audit, source_checks:5, originalStarChars:star.length, replacementStarChars:starNew.length};
}
const require=(b,m)=>{if(!b)throw Error(m)};
const [rootArg,pairArg,outArg,stage]=process.argv.slice(2);
require(rootArg&&pairArg&&outArg&&["short","star"].includes(stage),"usage ROOT PAIR85_DIR OUT short|star");
const root=path.resolve(rootArg),pair=path.resolve(pairArg),out=path.resolve(outArg);
require(execFileSync("git",["rev-parse","HEAD"],{cwd:root,encoding:"utf8"}).trim()==="72fead102f663d5c7a407964a13dc0cf9d977207","wrong compact pin");
const blobs={"New/Endgame/ShortAndEnough":"b99eea0689be372d84362c58272b705e104b6a3a","New/Endgame/LongForms":"9eff36cf003ac398fbd24361e80e95a03d0b0e05","New/Main":"198ed5bf26aa294898931e0649bc2b88f1389f65"};
const source={};
for(const [n,h] of Object.entries(blobs)){
 const raw=fs.readFileSync(path.join(root,"grh-compact/src",n+".lean"));
 require(createHash("sha1").update("blob "+raw.length+"\0").update(raw).digest("hex")===h,"changed source "+n);
 source[n]=raw.toString("utf8");
}
const a=source["New/Endgame/ShortAndEnough"],b=source["New/Endgame/LongForms"],c=source["New/Main"];
const result=plan(a,b,c);
const neg=[[a.replace("(exists_indexDvd_Bmu_divisible (Int.ceil_lt_add_one _)).elim","(wrong_index (Int.ceil_lt_add_one _)).elim"),b,c],[a,b.replace("D.short_forms, D.enough_forms","D.short_forms, D.short_forms"),c],[a,b,c.replace("D.exists_family_covolumeSq_le.elim","D.otherFamily.elim")],[a,b,c.replace("integral_forms_long i big I short","integral_forms_long i big I other")],[a,b.replace("import New.Endgame.ShortAndEnough\n",""),c]];
let rejected=0;for(const n of neg){try{plan(...n)}catch{rejected++}}require(rejected===neg.length,"negative control accepted");
const manifest=JSON.parse(fs.readFileSync(path.join(pair,"manifest.json"),"utf8"));
const sha=x=>createHash("sha256").update(x).digest("hex");
require(manifest.phase==="general"&&manifest.native_verified===true&&manifest.compact==="72fead102f663d5c7a407964a13dc0cf9d977207"&&manifest.mathlib==="56a005855ea17e0b0958f73ec801ae140b0a1679","no exact prior native general receipt");
const graph=fs.readFileSync(path.join(pair,"paired_graph.jsonl"));
require(sha(graph)===manifest.paired_graph_sha256,"graph receipt mismatch");
const candidate=fs.readFileSync(path.join(pair,"generated/Jet84General.lean"),"utf8");
require(sha(candidate)===manifest.candidate_sha256,"candidate receipt mismatch");
const importLine="import New.Columns.LocalStatement\n";
require(candidate.split(importLine).length===2,"original import anchor");
const mod=stage==="short"?"New.Endgame.ShortAndEnough":"New.Endgame.LongForms";
const combined=candidate.replace(importLine,"import "+mod+"\n"+importLine)+(stage==="short"?result.shortTail:result.starTail);
require(!/^import (?:Main|New\.Main)\b/m.test(combined),"forbidden RH import");
fs.mkdirSync(out,{recursive:false});
const filename=stage==="short"?"Jet86Short.lean":"Jet86Star.lean";
fs.writeFileSync(path.join(out,filename),combined,{flag:"wx"});
const receipt={stage,source_blobs:blobs,source_checks:result.source_checks,negative_controls_rejected:rejected,originalStarChars:result.originalStarChars,replacementStarChars:result.replacementStarChars,prior_graph_sha256:manifest.paired_graph_sha256,candidate_sha256:sha(combined),native_verified:false,full_RH_replay:false};
fs.writeFileSync(path.join(out,"manifest.json"),JSON.stringify(receipt,null,2)+"\n",{flag:"wx"});
console.log(JSON.stringify(receipt));
