#!/usr/bin/env node
/*
RUN53, 26 Nov 2026: actual compact native CI reuse, independent receipt audit.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; peers 837e9bc7,6bdfdba6,fc278308,99802a3d,4d94ebdc,2e61d8c6; RUN29 queue 2ba4fee7.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpoge, Sernau, Claude and collaborators.
Actual CI https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45799225653, 912.12s. State commit 5223fd7d8f163d29fffd0c8a3e89bf0cc904b386, status blob 77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35, results blob 23de197bd48f404ca2074c69676de289c4f7934e.
Executed in V8: all 19 artifact byte lengths and SHA256 hashes match status manifest, actual log parsing matches 10 native theorem and 4 peer scalar axiom reports, only propext/Classical.choice/Quot.sound, six fail-closed controls (status, wrong pin, sorryAx, missing declaration, unbound replay, failed build). No new Lean run. 95 distinct explicitly built modules, 17 explicit replay notices bound to earlier build records; corresponding earlier build durations total 211.7 module-seconds across repeat uses. Not wall-clock savings, not an independently measured cold baseline, not counting silent cache hits. Native build walls 567.28,10.24,218.29 seconds; shared Mathlib cache 67.98s. No URT.
Actual source references:
A: New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a:157 uses IndexDvd.sup. New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:258,267,299 uses marked low-column, jet exponent and collision bounds (RUN29 not yet verified here).
B: New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76:25 uses Fits.exists_translate_finrank_comap_le; Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444:234,333 connects energy_fixingSet_le and sum_le_of_positive_type (RUN29 pending here).
C: New/Selmer/TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754:67,119,120,140 uses unseen-class, TWO root-of-unity selections and drop-ties estimates. Both selections and their distinct arguments retained. New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05:66-69 uses one fit family, height pow/mul/nonneg. Verified heights do not close reciprocity, crystalline defects, balanced rows.
Original and reduced graph unchanged from RUN52 blob 6ea4d8787d3458b88ed0dba1beceb9dc4bb3bebf. No premise removed, no native caller substitution, no full proof. All unresolved graph boundaries and prior axiom evidence retained.
Replay: node RUN53_ACTUAL_REPLAY_RECEIPT.mjs /path/to/pinned-state-checkout
Optional args: /path/to/kernel_extractor /path/to/grh-compact /path/to/probe-output. Prepares six module-local probes for rh_scan and rh_prune on 19 actual named theorem inputs, using pinned engine and source. No Lean executed by preparation. Old engine CI on 4.33.1 does not establish 4.35.0 compatibility. Never import Main/New.Main as shortcut. Only try rh_reduce/rh_auto/rh_auto_frontier on changed caller goals after new-toolchain engine compatibility, not merely call original theorem to claim independent proof.
RESUME HERE: inspect actual RUN29 primitive receipts; use shared approved environment for targeted scan/prune probes; audit generated bridges and exact context, preserve open frontier. No competing CI jobs or guard override. A stage support and marked elementary divisors, B local Bessel/energy, C reciprocity/local defects/balanced rows remain mathematical priorities. No more redesign of sufficient endgame.
HANDOFF TO kernel, dependencies, integration, audit.
*/
import {readFileSync,writeFileSync,mkdirSync} from "node:fs";
import {createHash} from "node:crypto";
import {join} from "node:path";
const require=(v,m)=>{if(!v)throw Error(m)};
const gitBlob=b=>createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");
const expected={
root_gauss_scalar:["CompactCharacterBoxes50.telescoping_gain","CompactCharacterBoxes50.budget_contradiction"],
ribet_prefix:["CompactRibetRun50.prefix_replace","CompactRibetRun50.scalar_prefix_replace"],
module_0:["exists_root_of_unity_eval_large","exists_roots_of_unity_ellVal_le"],
module_1:["IndexDvd.comap","IndexDvd.trans","IndexDvd.map","IndexDvd.sup","HasType.prod"],
module_2:["HeightLe.mul","HeightLe.pow","HeightLe.nonneg"]};
const modules=[
["New.Selmer.RootsOfUnityPoints","7c07be15e6c410124a9bc5ecb470e7750ac67074",expected.module_0],
["New.Core.ModuleIndex","214cc116f97852925f444db42bfa36cf563af508",expected.module_1],
["New.Heights.Heights","a18a99e1f76a6e963113cae8f906ddc99814f518",expected.module_2],
["New.Selmer.TiltingLemma","62784266136a2936dd6f8d662b79fa051d28c470",["IsPencil.length_le_of_unseen_class","tilting","IsPencil.length_le_of_drop_ties"]],
["New.Columns.JetExponentBound","bedef08c7c1707f74e9afce0c8008b88ba37dc8a",["Data.le_jetExponent","Data.IsMarked.sum_lowColumns_le","Data.mul_collisionSum_le_loss"]],
["New.Filling.Moments","ec2cb964ede0d5eeae41a077dc6dbfface9c0444",["Filling.energy_fixingSet_le","Filling.sum_le_of_positive_type","Filling.Fits.exists_translate_finrank_comap_le"]]];
const state=process.argv[2];require(state,"supply state checkout");
const dir=join(state,"compute/rh-compact-targeted-replay-20261126");
const statusBytes=readFileSync(join(dir,"status.json"));
require(gitBlob(statusBytes)==="77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35","status blob mismatch");
const manifest=JSON.parse(statusBytes),raw={};
for(const item of manifest.outputs_committed){
 const b=readFileSync(join(dir,"outputs",item.path));
 require(b.length===item.bytes&&createHash("sha256").update(b).digest("hex")===item.sha256,"receipt mismatch "+item.path);
 raw[item.path]=b.toString("utf8");
}
function audit(m,r){
 const report=JSON.parse(r["targeted_results.json"]),pins=JSON.parse(r["pins.json"]);
 const eq=(x,y)=>JSON.stringify(x)===JSON.stringify(y);
 require(m.status==="pass"&&m.returncode===0&&m.sha==="4c55b565a0583f08b6c87de5ae3ddfa8d3a9747a"&&m.run_url.endsWith("/45799225653"),"wrong CI status");
 require(report.full_RH_replay===false&&report.all_requested_checks_ok===true,"wrong scope");
 require(pins.compact==="72fead102f663d5c7a407964a13dc0cf9d977207"&&pins.mathlib==="56a005855ea17e0b0958f73ec801ae140b0a1679"&&pins.lean_release_sha256==="7289597a44543246c9227b8cae501767e095ce17f6d448b95fc4a8dc97268f6d","wrong pins");
 require(r["version.log"].includes("Lean (version 4.35.0,"),"wrong Lean");
 const allow=new Set(["propext","Classical.choice","Quot.sound"]);let native=[],peer=[];
 for(const [label,names] of Object.entries(expected)){
  const s=report.steps[label],log=r[label+".log"],a={};
  require(s?.returncode===0&&s.axiom_audit_ok===true,"missing check "+label);
  require(!/\bsorryAx\b|declaration uses 'sorry'/.test(log),"sorry");
  for(const h of log.matchAll(/^'([^']+)' depends on axioms: \[([^\]]*)\]$/gm)){
   require(!(h[1] in a),"duplicate theorem");a[h[1]]=h[2].split(",").map(x=>x.trim()).filter(Boolean);
  }
  require(eq(Object.keys(a).sort(),[...names].sort())&&eq(Object.keys(s.axioms).sort(),[...names].sort()),"wrong roster");
  for(const n of names){require(a[n].every(x=>allow.has(x))&&eq([...a[n]].sort(),[...s.axioms[n]].sort()),"axiom discrepancy "+n);(label.startsWith("module_")?native:peer).push({name:n,axioms:a[n]})}
 }
 let prior=new Map(),groups=[];
 for(let i=0;i<3;i++){
  const [module,blob]=modules[i],label="module_"+i,log=r[label+"_build.log"],b=report.steps[label+"_build"];
  require(pins.source_blobs[module]===blob&&report.steps[label].module===module,"wrong module");
  require(b.returncode===0&&/Build completed successfully \(\d+ jobs\)\./.test(log),"build failed");
  const fresh=[...log.matchAll(/^\S+ \[(\d+)\/(\d+)\] Built ([\w.]+) \(([\d.]+)s\)$/gm)].map(h=>({name:h[3],seconds:+h[4]}));
  const reused=[...log.matchAll(/^\S+ \[(\d+)\/(\d+)\] Replayed ([\w.]+)$/gm)].map(h=>h[3]);
  require(fresh.some(x=>x.name===module),"target missing");
  require(new Set(reused).size===reused.length&&reused.every(x=>prior.has(x)),"unbound replay");
  const sum=xs=>+xs.reduce((a,b)=>a+b,0).toFixed(1);
  groups.push({module,built:fresh.length,replayed:reused.length,reusedPriorModuleSeconds:sum(reused.map(x=>prior.get(x))),newModuleSeconds:sum(fresh.map(x=>x.seconds)),buildWallSeconds:b.seconds,reused});
  for(const x of fresh){require(!prior.has(x.name),"unexpected repeat build");prior.set(x.name,x.seconds)}
 }
 require(native.length===10&&peer.length===4&&prior.size===95,"unexpected count");
 return {native,peer,groups,distinctBuilt:prior.size,explicitReplayEvents:groups.reduce((s,g)=>s+g.replayed,0),priorModuleSecondsRepresented:+groups.reduce((s,g)=>s+g.reusedPriorModuleSeconds,0).toFixed(1),wall:m.wall_s,cacheSeconds:report.steps.mathlib_cache.seconds,fullReplay:false};
}
const result=audit(manifest,raw);
const mutations=[
(m,r)=>{m.status="error"},
(m,r)=>{const p=JSON.parse(r["pins.json"]);p.compact="wrong";r["pins.json"]=JSON.stringify(p)},
(m,r)=>{r["module_0.log"]=r["module_0.log"].replace("propext","sorryAx")},
(m,r)=>{r["module_1.log"]=r["module_1.log"].split("\n").slice(1).join("\n")},
(m,r)=>{r["module_2_build.log"]=r["module_2_build.log"].replace("Replayed Lib.General.LinearAlgebra.Base","Replayed Unknown.Module")},
(m,r)=>{const p=JSON.parse(r["targeted_results.json"]);p.steps.module_1_build.returncode=1;r["targeted_results.json"]=JSON.stringify(p)}];
for(const mutate of mutations){const m=JSON.parse(JSON.stringify(manifest)),r={...raw};mutate(m,r);let rejected=false;try{audit(m,r)}catch{rejected=true}require(rejected,"negative accepted")}
console.log(JSON.stringify({...result,authenticatedFiles:manifest.outputs_committed.length,negativeControls:mutations.length},null,2));
const [engineDir,compact,output]=process.argv.slice(3);
if(engineDir||compact||output){
 require(engineDir&&compact&&output,"provide all optional paths");
 const bytes=readFileSync(join(engineDir,"RHProofTermPrune.lean"));
 require(gitBlob(bytes)==="f6d3e7f6047a7895ecf183be3fb54c203f4fc46a","engine pin mismatch");
 const src=bytes.toString("utf8"),tick=String.fromCharCode(96);
 require(src.startsWith("import Lean\n"),"engine import anchor changed");
 mkdirSync(output,{recursive:true});
 for(let i=0;i<modules.length;i++){
  const [module,sha,names]=modules[i],path=join(compact,"src",module.replaceAll(".","/")+".lean");
  require(gitBlob(readFileSync(path))===sha,"source pin mismatch "+module);
  let probe=src.replace("import Lean\n","import Lean\nimport "+module+"\n");
  for(let j=0;j<names.length;j++){
   const name=names[j],target="CompactRun53_"+i+"_"+j;
   probe+="\n#check "+name+"\n#print axioms "+name+"\nrh_scan "+name+" limit 2000\nrh_prune "+name+" as "+target+"\n";
   probe+="run_cmd do\n  if (← getEnv).contains "+tick+target+" then\n    for n in ["+tick+target+", "+tick+target+".original] do\n      let axs ← Lean.collectAxioms n\n      logInfo m!\"RUN53_PRUNE_AXIOMS {n} {axs}\"\n";
  }
  writeFileSync(join(output,"CompactRun53_"+i+".lean"),probe);
 }
 console.log("Prepared six module-local probes; no Lean executed.");
}
