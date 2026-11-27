#!/usr/bin/env node
/*
RUN84 — A2 multi-edge proof transport, no source rebuild.
27 November 2026. SOURCE-MATCHED / PREPARED, NOT NATIVE REPLAYED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
4878ea106b791c42b5f5a45810162de59701c4d9, 01fa22a6b12abad5ccf580d2621f82be3bf70c13.
Read AGENTS, swarm, expansion, handoff, RUN81–83, acceleration RUN79
and kernel RUN57. Existing shared A1/A2 job status and output returned
404 (no receipt at retrieval); do not start another cold build.
Peer actual native core transport receipt 46022635354, blob
26a5d659f56be7b28385a40e33d16248a729e1de: good retarget exit 0,
wrong type rejected exit 1. Core only, not A2 verification.

NEW source-matched result: one supplier body replacement is sufficient in
a rebuilt checkout (RUN83), but proof transport on immutable olean
artifacts must replace MULTIPLE edges in the same caller. Actual
Data.finrank_ker_one_sub_centralGen_le references BOTH
Data.classAut_eq_bot_of_le_chosenLevel AND classAut_columnLevel_eq_bot.
Replacing only the former leaves the latter's original freeness proof
reachable. Likewise Data.span_short_ramifiedColumns references BOTH
ramifyingOp_finrank_comap_and_short AND classAut_columnLevel_eq_bot.
The seven named callers therefore require the nine listed exact
source edges simultaneously, in topological order. No source rebuild or
retactic elaboration of those seven theorem bodies is necessary for
this candidate: change only their supplier constants, preserve original
type, universe order and every other expression, then invoke normal
kernel addDecl. This is proof substitution, NOT closure of A2.
The unchanged rank guard remains in the exact adapter and numerical
callers; finite stabilizer, two residue primes, integral lift and same
rational point injectivity remain the mathematical premises of RUN81/82.
No claim that the old leaf is absent transitively through all other
suppliers; require the strict constructor-inclusive graph separately.
All A1–A3 and other live obligations survive. No URT improvement claimed.

Actual connector-source preflight: 9 required source-edge anchors
across seven named proof bodies, 9 individual damaged-edge controls
rejected, exact helper namespace extraction, seven generated transport
calls, no self-import or Main. Native Lean not executed here; no
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier execution or new PASS.
Original RUN83 in-place splice remains alternative and all graphs kept.
This script authenticates the pinned source and helpers again on actual
workspace; uses unchanged upstream olean artifacts rather than rewriting
source. Source graph is textual, not an elaborated exhaustive DAG.
A2 actual replay is still open.

RESUME HERE: in the existing shared original ChainValuation workspace,
before any destructive overlay, run
  node RUN84_A2_MULTI_EDGE_TRANSPORT.mjs ROOT OUT
  cd ROOT/grh-compact
  lake env lean --tstack=400000 OUT/ThetaTransportRun84.lean > OUT/theta84.log 2>&1
where OUT is absolute and external. If ChainValuation olean absent,
incrementally build only that module in the shared original workspace.
Preserve compiler exit status, exact generated file and all edge/axiom
logs. Accept only exit 0, one LEAF_CHECKED and seven CHECKED markers,
no unexpected axioms/errors; then strict graph and original root caller
audit. Repair first actual helper failure if any; no new cold build,
no full RH replay, no global dependency deletion. HANDOFF: kernel,
acceleration, integration, audit.
*/
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';
import {fileURLToPath} from 'node:url';
const here=path.dirname(fileURLToPath(import.meta.url));
const root=path.resolve(process.argv[2]||'.'),out=path.resolve(process.argv[3]||'./theta84-out');
const pin="72fead102f663d5c7a407964a13dc0cf9d977207";
const paths=["New/Data/ChosenPlaceLevels.lean","New/Columns/ColumnDefs.lean","New/Columns/ChainValuation.lean"];
const hashes=["d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3","104b875374798b99448625fe6ce062ea6bfbfe65","19e853dfa8c645bfcdf3b3e21183f9b432620ef7"];
const helperPaths=["RUN81_COMPACT_GEOMETRIC_SUM_FREE_LEVEL.lean","RUN82_COMPACT_CHOSEN_LEVEL_LOCAL_BRIDGE.lean"];
const helperHashes=["f34c82d30b5d3cfa3582b14f9ba50bf337ae4f40","f8f7fbd14a1d8372e71e46dc5438ec886ecd9d25"];
const spec=[["Data.card_classAut_dvd_chosenGroupOrder",0,["Data.classAut_eq_bot_of_le_chosenLevel"]],["Data.classAut_columnLevel_eq_bot",1,["Data.classAut_eq_bot_of_le_chosenLevel"]],["Data.finrank_ker_one_sub_centralGen_le",2,["Data.classAut_eq_bot_of_le_chosenLevel","Data.classAut_columnLevel_eq_bot"]],["Data.exists_chain_eq_sum",2,["Data.classAut_eq_bot_of_le_chosenLevel"]],["Data.ramifyingOp_finrank_comap_and_short",2,["Data.finrank_ker_one_sub_centralGen_le"]],["Data.span_short_ramifiedColumns",2,["Data.ramifyingOp_finrank_comap_and_short","Data.classAut_columnLevel_eq_bot"]],["Data.IsGoodDatum.gaugeLe_chain",2,["Data.exists_chain_eq_sum"]]];
const header="import New.Columns.ChainValuation\nimport Lean\nimport Lib.Adelic.Transference.MassBasic\nimport Mathlib.Algebra.Ring.GeomSum\nimport Mathlib.GroupTheory.OrderOfElement\nimport Mathlib.LinearAlgebra.Matrix.NonsingularInverse\nimport Mathlib.RingTheory.LocalRing.ResidueField.Basic\nimport Mathlib.Tactic\nimport Mathlib.FieldTheory.Finite.Basic\n\nnoncomputable section\nopen NumberField Matrix MonoidHom\nset_option debug.skipKernelTC false\nset_option Elab.async false\nset_option maxHeartbeats 0\n";
const tail="\nset_option debug.skipKernelTC false\nset_option Elab.async false\nset_option maxHeartbeats 0\nset_option pp.fullNames true\n\nprivate def theta84SameType (a b : Lean.ConstantInfo) :\n    Lean.Elab.Command.CommandElabM Unit := do\n  unless a.levelParams == b.levelParams do\n    Lean.throwError \"THETA84 universe mismatch\"\n  let same ← Lean.Elab.Command.liftTermElabM do\n    Lean.Meta.isDefEq a.type b.type\n  unless same do\n    Lean.throwError \"THETA84 supplier type mismatch\"\n\nprivate def theta84Audit (old fresh : Lean.Name) :\n    Lean.Elab.Command.CommandElabM Unit := do\n  theta84SameType (← Lean.getConstInfo old) (← Lean.getConstInfo fresh)\n  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]\n  let oa ← Lean.collectAxioms old\n  let na ← Lean.collectAxioms fresh\n  unless oa.all (fun x => allowed.contains x) &&\n      na.all (fun x => allowed.contains x && oa.contains x) do\n    Lean.throwError \"THETA84 unexpected/new axiom\"\n  for n in #[old, fresh] do\n    let info ← Lean.getConstInfo n\n    let some val := info.value? (allowOpaque := true) |\n      Lean.throwError \"THETA84 missing proof value\"\n    Lean.logInfo m!\"THETA84_TYPE|{n}|{(Lean.toJson (reprStr info.type)).compress}\"\n    Lean.logInfo m!\"THETA84_LEVEL|{n}|{(Lean.toJson (reprStr info.levelParams)).compress}\"\n    for dep in info.type.getUsedConstants do\n      Lean.logInfo m!\"THETA84_EDGE|{n}|type|{dep}\"\n    for dep in val.getUsedConstants do\n      Lean.logInfo m!\"THETA84_EDGE|{n}|value|{dep}\"\n    Lean.logInfo m!\"THETA84_AXIOMS|{n}|{← Lean.collectAxioms n}\"\n\nprivate def theta84Transport (old fresh : Lean.Name)\n    (subs : Array (Lean.Name × Lean.Name)) :\n    Lean.Elab.Command.CommandElabM Unit := do\n  let .thmInfo info ← Lean.getConstInfo old |\n    Lean.throwError \"THETA84 original not a theorem\"\n  let before := info.value.getUsedConstants\n  for (a,b) in subs do\n    theta84SameType (← Lean.getConstInfo a) (← Lean.getConstInfo b)\n    unless before.contains a && !before.contains b do\n      Lean.throwError m!\"THETA84 expected edge absent or already changed: {old} {a}\"\n  let proof := info.value.replace fun e =>\n    match e with\n    | .const n us =>\n      match subs.find? (fun pair => pair.1 == n) with\n      | some pair => some (.const pair.2 us)\n      | none => none\n    | _ => none\n  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {\n    name := fresh\n    levelParams := info.levelParams\n    type := info.type\n    value := proof\n  })\n  let .thmInfo checked ← Lean.getConstInfo fresh |\n    Lean.throwError \"THETA84 checked theorem missing\"\n  unless checked.type == info.type && checked.levelParams == info.levelParams do\n    Lean.throwError \"THETA84 changed exact caller type\"\n  let expected := (before.filter (fun n => !subs.any (fun s => s.1 == n))) ++\n    subs.map (·.2)\n  let after := checked.value.getUsedConstants\n  unless expected.all (fun x => after.contains x) &&\n      after.all (fun x => expected.contains x) do\n    Lean.throwError \"THETA84 changed unexpected value edge\"\n  unless !after.contains old && subs.all (fun s => !after.contains s.1) do\n    Lean.throwError \"THETA84 old caller or supplier remains\"\n  theta84Audit old fresh\n  Lean.logInfo m!\"THETA84_CHECKED|{fresh}\"\n\nrun_cmd do\n  let old := ``Data.classAut_eq_bot_of_le_chosenLevel\n  let fresh := ``ThetaRun82.chosenLevel_free_original\n  theta84Audit old fresh\n  let some v := (← Lean.getConstInfo fresh).value? (allowOpaque := true) |\n    Lean.throwError \"THETA84 leaf missing\"\n  unless v.getUsedConstants.contains ``ThetaRun82.chosenLevel_free &&\n      !v.getUsedConstants.contains old do\n    Lean.throwError \"THETA84 leaf bridge mismatch\"\n  Lean.logInfo \"THETA84_LEAF_CHECKED\"\n\nrun_cmd do\n  theta84Transport ``Data.card_classAut_dvd_chosenGroupOrder ``Data.card_classAut_dvd_chosenGroupOrder_run84\n    #[(``Data.classAut_eq_bot_of_le_chosenLevel, ``ThetaRun82.chosenLevel_free_original)]\n  theta84Transport ``Data.classAut_columnLevel_eq_bot ``Data.classAut_columnLevel_eq_bot_run84\n    #[(``Data.classAut_eq_bot_of_le_chosenLevel, ``ThetaRun82.chosenLevel_free_original)]\n  theta84Transport ``Data.finrank_ker_one_sub_centralGen_le ``Data.finrank_ker_one_sub_centralGen_le_run84\n    #[(``Data.classAut_eq_bot_of_le_chosenLevel, ``ThetaRun82.chosenLevel_free_original), (``Data.classAut_columnLevel_eq_bot, ``Data.classAut_columnLevel_eq_bot_run84)]\n  theta84Transport ``Data.exists_chain_eq_sum ``Data.exists_chain_eq_sum_run84\n    #[(``Data.classAut_eq_bot_of_le_chosenLevel, ``ThetaRun82.chosenLevel_free_original)]\n  theta84Transport ``Data.ramifyingOp_finrank_comap_and_short ``Data.ramifyingOp_finrank_comap_and_short_run84\n    #[(``Data.finrank_ker_one_sub_centralGen_le, ``Data.finrank_ker_one_sub_centralGen_le_run84)]\n  theta84Transport ``Data.span_short_ramifiedColumns ``Data.span_short_ramifiedColumns_run84\n    #[(``Data.ramifyingOp_finrank_comap_and_short, ``Data.ramifyingOp_finrank_comap_and_short_run84), (``Data.classAut_columnLevel_eq_bot, ``Data.classAut_columnLevel_eq_bot_run84)]\n  theta84Transport ``Data.IsGoodDatum.gaugeLe_chain ``Data.IsGoodDatum.gaugeLe_chain_run84\n    #[(``Data.exists_chain_eq_sum, ``Data.exists_chain_eq_sum_run84)]\n\n#print axioms Data.classAut_eq_bot_of_le_chosenLevel\n#print axioms ThetaRun82.chosenLevel_free_original\n#print axioms Data.card_classAut_dvd_chosenGroupOrder\n#print axioms Data.card_classAut_dvd_chosenGroupOrder_run84\n#print axioms Data.classAut_columnLevel_eq_bot\n#print axioms Data.classAut_columnLevel_eq_bot_run84\n#print axioms Data.finrank_ker_one_sub_centralGen_le\n#print axioms Data.finrank_ker_one_sub_centralGen_le_run84\n#print axioms Data.exists_chain_eq_sum\n#print axioms Data.exists_chain_eq_sum_run84\n#print axioms Data.ramifyingOp_finrank_comap_and_short\n#print axioms Data.ramifyingOp_finrank_comap_and_short_run84\n#print axioms Data.span_short_ramifiedColumns\n#print axioms Data.span_short_ramifiedColumns_run84\n#print axioms Data.IsGoodDatum.gaugeLe_chain\n#print axioms Data.IsGoodDatum.gaugeLe_chain_run84";
const blob=s=>crypto.createHash('sha1').update('blob '+Buffer.byteLength(s)+'\0').update(s).digest('hex');
function requireCheck(x,m){if(!x)throw Error(m)}
requireCheck(execFileSync('git',['-C',root,'rev-parse','HEAD'],{encoding:'utf8'}).trim()===pin,'wrong pin');
requireCheck(out!==root&&!out.startsWith(root+path.sep),'external output required');
const read=p=>fs.readFileSync(p,'utf8');
const src=paths.map((p,i)=>{const s=read(path.join(root,'grh-compact/src',p));requireCheck(blob(s)===hashes[i],'modified source '+p);return s});
const h=helperPaths.map((p,i)=>{const s=read(path.join(here,p));requireCheck(blob(s)===helperHashes[i],'modified helper '+p);return s});
const short=n=>n.replace(/^Data\./,"");
function extract(s,n){const marker="lemma "+short(n)+" ";let i=s.indexOf(marker);if(i<0){const alt="lemma "+short(n)+":";i=s.indexOf(alt)}if(i<0)throw Error(n);const tail=s.slice(i+6);const m=tail.search(/\n(?:\/--|lemma |theorem |variable |structure |noncomputable def |def |namespace |end\b)/);return m<0?tail:tail.slice(0,m);}
function check(s,n,deps){const t=extract(s,n);for(const dep of deps){if(!t.includes(short(dep)))throw Error("missing "+n+" -> "+dep)}return true}
function body(s,n){const a="namespace "+n+"\n",b="\nend "+n;if(s.split(a).length!==2||s.split(b).length!==2)throw Error("bad helper boundary");return (a+s.split(a)[1].split(b)[0]+b).split("\n").filter(l=>!/^#(print axioms|check)\b/.test(l)).join("\n")}
let checks=0,negative=0;
for(const [n,i,deps] of spec){check(src[i],n,deps);checks+=deps.length;for(const dep of deps){const t=extract(src[i],n);const changed=src[i].replace(t,t.split(short(dep)).join("removed_dependency_run84"));try{check(changed,n,deps)}catch(e){negative++}}}
requireCheck(checks===9&&negative===checks,'source controls failed');
const generated=header+'\n'+h.map((s,i)=>body(s,'ThetaRun'+(81+i))).join('\n\n')+'\n'+tail;
requireCheck((generated.match(/  theta84Transport ``Data\./g)||[]).length===7&&!generated.includes('import RUN81')&&!generated.includes('import Main'),'generated content guard');
fs.mkdirSync(out,{recursive:true});
fs.writeFileSync(path.join(out,'ThetaTransportRun84.lean'),generated);
fs.writeFileSync(path.join(out,'source_manifest.json'),JSON.stringify({pin,paths,hashes,helperPaths,helperHashes,spec,source_edge_checks:checks,negative_controls_rejected:negative,generated_blob:blob(generated),native_verified:false,full_RH_replay:false},null,2));
console.log('RUN84 authenticated source and generated candidate; not native PASS');
