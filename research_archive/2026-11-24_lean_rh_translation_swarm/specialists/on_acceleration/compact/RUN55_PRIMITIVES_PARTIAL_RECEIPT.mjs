#!/usr/bin/env node
/*
RUN55, 26 November 2026 — primitive replay diagnosis and A-only retry.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; current manuscript and
peer heads a6e9cc7f (thick cell), 837dd3d8 (crystalline), b5cd3751 (reciprocity).
Source pin 72fead102f663d5c7a407964a13dc0cf9d977207; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679; Lean 4.35.0.
Actual RUN29 CI 45803534769, status error, 5147.99s. Six native declarations
independently confirmed by original logs AND receipt, B/C standard axioms only.
A build timed out at 2700.11s; no A declaration checked. Last printed
9367/9376 is a Lake progress counter, NOT exact remaining module count.
401 distinct observed source builds, 91 observed replay events all matched
prior source builds; 2152.0s sum of their previously logged module times,
not wall savings. Five negative controls executed in V8 on real fetched logs.
No new premise discharged. Preserve RUN52 static graph, RUN54 original and
reduced role-graph plans, all native axiom evidence and all open leaves.
Do not spend a second CI cycle reproducing B/C axiom checks just to retry A.
The prepared A-only adapter retains original RUN28 resource guard, pins,
cache and audit; doubles only target build timeout to 5400s within approved
320min budget. A fresh workspace is cold for compact modules: no prediction
of completion. Original unmodified A source, no import of Main. After A
passes, run RUN54 A scan/prune in SAME workspace before teardown (separate
result; old engine compatibility unknown). No competing CI or registry edit.
Usage: node RUN55_PRIMITIVES_PARTIAL_RECEIPT.mjs /path/to/receipt
       node RUN55_PRIMITIVES_PARTIAL_RECEIPT.mjs --prepare-retry /path/to/retry.py
Retry adapter: python3 retry.py --out DIR (approved runner only).
RESUME HERE: kernel lane coordinate A-only replay with 5400s cap; retain
B/C prior verified receipts, inspect A probe failures and exact typed
frontier before proposing caller substitutions. A exact jet/stage support,
B peak/packet suppliers, C local defects/row/comparison unresolved in human
proof. HANDOFF TO kernel, integration, audit, theta.
*/
import {readFileSync,writeFileSync} from "node:fs";
import {createHash} from "node:crypto";
import {join,dirname} from "node:path";
import {fileURLToPath} from "node:url";
const files={"status.json":"a56e2d3afb99ed8275e81fd63c8494306e57c43f","outputs/targeted_results.json":"088cd2ec0e935ee1a282f10096949bcf671cc804","outputs/pins.json":"1c788a9bdc029a7671366945d3c37d3801b4edf8","outputs/module_0.log":"ad9f319e5675c2deb3a0f4ee22b4379b185f2a93","outputs/module_2.log":"984dd559e7bc0f7bb65b389e7ea1ff754d561d3c","outputs/module_0_build.log":"b685bd16a7081c974fa3b821eeb7194ba21c2364","outputs/module_1_build.log":"c52e8f60211ead133d2f19f4c8ea6093cba513b0","outputs/module_2_build.log":"ce6ab5209737dd409e37b4224adfa5d4d98ea6ad"};
const check=(v,m)=>{if(!v)throw Error(m)};
const audit=(content)=>{
 const s=JSON.parse(content["status.json"]),q=JSON.parse(content["outputs/targeted_results.json"]),p=JSON.parse(content["outputs/pins.json"]);
 check(s.status==="error"&&q.all_requested_checks_ok===false&&q.full_RH_replay===false,"not partial receipt");
 check(p.compact==="72fead102f663d5c7a407964a13dc0cf9d977207"&&p.mathlib==="56a005855ea17e0b0958f73ec801ae140b0a1679","pin mismatch");
 const targets=[["New.Selmer.TiltingLemma",["IsPencil.length_le_of_unseen_class","tilting","IsPencil.length_le_of_drop_ties"]],["New.Columns.JetExponentBound",["Data.le_jetExponent","Data.IsMarked.sum_lowColumns_le","Data.mul_collisionSum_le_loss"]],["New.Filling.Moments",["Filling.energy_fixingSet_le","Filling.sum_le_of_positive_type","Filling.Fits.exists_translate_finrank_comap_le"]]];
 const allowed=["Classical.choice","Quot.sound","propext"];let validated=0;const known=new Map(),summary=[];
 for(let i=0;i<3;i++){const k="module_"+i, b=q.steps[k+"_build"],l=content["outputs/"+k+"_build.log"],rows=[...l.matchAll(/^[^\n]*?\[(\d+)\/(\d+)\] (Built|Replayed) ((?:New|Lib)\.[\w.]+)(?: \(([\d.]+)(ms|s|m)\))?/gm)];let built=0,replayed=0,sec=0;for(const m of rows){if(m[3]==="Built"){check(!known.has(m[4]),"duplicate build");known.set(m[4],+m[5]*({ms:.001,s:1,m:60}[m[6]]));built++}else{check(known.has(m[4]),"unmatched replay");replayed++;sec+=known.get(m[4])}}
 if(i===1){check(b.returncode===124&&!q.steps[k]&&l.includes("TIMEOUT: bounded targeted job")&&!rows.some(m=>m[4]===targets[i][0]),"incorrect timeout classification");}
 else{check(b.returncode===0&&q.steps[k].returncode===0&&q.steps[k].axiom_audit_ok&&q.steps[k].module===targets[i][0],"native check missing");const log=content["outputs/"+k+".log"];check(!/\bsorryAx\b|declaration uses 'sorry'/.test(log),"sorry");for(const name of targets[i][1]){const m=[...log.matchAll(/['‘]([^'’]+)['’]\s+depends on axioms:\s*\[([^\]]*)\]/g)].find(m=>m[1]===name);check(m&&JSON.stringify(m[2].split(",").map(x=>x.trim()).sort())===JSON.stringify(allowed)&&JSON.stringify([...q.steps[k].axioms[name]].sort())===JSON.stringify(allowed),"axiom mismatch "+name);validated++}}
 summary.push({module:targets[i][0],built,replayed,replayedSeconds:Math.round(sec*10)/10,wall:b.seconds,last:Number(rows.at(-1)[1]),total:Number(rows.at(-1)[2])});}
 check(validated===6&&known.size===401,"unexpected counts");return {validated,uniqueBuilds:known.size,summary};
};
const [arg,out]=process.argv.slice(2);
if(arg==="--prepare-retry"){
 check(out,"supply retry.py output path");
 const here=dirname(fileURLToPath(import.meta.url)),kernel=join(here,"../../kernel_extractor");
 // Absolute paths are for the approved runner's checkout, not a persistent cache.
 const py=[
 "import sys, pathlib, json, subprocess",
 "sys.path.insert(0, "+JSON.stringify(kernel)+")",
 "import RUN28_COMPACT_TARGETED as replay",
 "replay.PEERS = {}",
 "replay.TARGETS = [('New.Columns.JetExponentBound','bedef08c7c1707f74e9afce0c8008b88ba37dc8a',['Data.le_jetExponent','Data.IsMarked.sum_lowColumns_le','Data.mul_collisionSum_le_loss'])]",
 "base_step = replay.step",
 "probe_result = {}",
 "def step(args,cwd,env,log,seconds):",
 "    label=log.stem",
 "    result=base_step(args,cwd,env,log,5400 if label=='module_0_build' else seconds)",
 "    if label=='module_0' and result['returncode']==0:",
 "        dst=log.parent/'run54_probes'; dst.mkdir(exist_ok=True)",
 "        gen=base_step(['node',"+JSON.stringify(join(here,"RUN54_SHARED_NATIVE_SCAN.mjs"))+",cwd,"+JSON.stringify(kernel)+",dst],cwd,env,log.parent/'run54_generate.log',120)",
 "        probe_result['generate']=gen",
 "        if gen['returncode']==0:",
 "            probe_result['scan']=base_step(['lake','env','lean',dst/'CompactRun54_1.lean'],cwd,env,log.parent/'run54_A_scan.log',900)",
 "        (log.parent/'run54_A_scan_result.json').write_text(json.dumps(probe_result,indent=2))",
 "    return result",
 "replay.step=step",
 "replay.main()",
 "# Keep native named checks separate from an unverified scanner. A successful",
 "# scan process alone is not a complete bridge audit or a proof reduction.",
 "if probe_result.get('scan',{}).get('returncode')!=0: raise RuntimeError('A named receipt preserved; separate scan missing/failed')",
 ].join("\n")+"\n";
 writeFileSync(out,py,{flag:"wx"});console.log("Prepared A-only retry; not executed.");
}else{
 check(arg,"supply receipt directory");
 const content={};
 for(const [f,sha] of Object.entries(files)){
  const b=readFileSync(join(arg,f));
  check(createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")===sha,"blob mismatch "+f);
  content[f]=b.toString("utf8");
 }
 const result=audit(content);let neg=0;
 for(const [file,change] of [["status.json",s=>s.replace('"status": "error"','"status": "pass"')],["outputs/pins.json",s=>s.replace("72fead102f663d5c7a407964a13dc0cf9d977207","bad")],["outputs/module_0.log",s=>s.replace("propext","sorryAx")],["outputs/module_1_build.log",s=>s.replace("TIMEOUT: bounded targeted job","")],["outputs/module_2.log",s=>s.replace("Filling.energy_fixingSet_le","fake")]]){
  try{audit({...content,[file]:change(content[file])})}catch(e){neg++;continue}throw Error("negative control accepted "+file)
 }
 console.log(JSON.stringify({result,neg,scope:"partial native receipt only"},null,2));
}
