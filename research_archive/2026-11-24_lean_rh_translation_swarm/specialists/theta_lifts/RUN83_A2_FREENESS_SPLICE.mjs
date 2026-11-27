#!/usr/bin/env node
/*
RUN83 — A2 in-place chosen-level freeness replacement and actual caller inventory.
27 November 2026. SOURCE-MATCHED SPLICE EXECUTED against connector-retrieved
pinned source; NATIVE LEAN REPLAY PREPARED ONLY. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact source lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 remains historical.

Read current mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 4878ea106b791c42b5f5a45810162de59701c4d9, ledger
01fa22a6b12abad5ccf580d2621f82be3bf70c13, AGENTS, protocols, RUN81/82
and A2 peer RUN79 cd306c11. No redundant geometric-sum derivation,
new scalar tests, registry entry, cold build or changes to shared state.

Mathematical premise audit: same rational point y, finite stabilizer
at the chosen level, distinct residue primes, local matrix reduction
and field injection from RUN81/82 remain necessary inputs. The stronger
rank-free candidate is not a proof for unrestricted adeles. Rather than
rewrite every consumer, replace ONLY the body of the original named
lemma with ThetaRun82.chosenLevel_free hK, retaining its exact rank-bound
binder, declaration name, and all consumer statements. Insert the
candidate helpers after the IsConjApart instance and before the named
lemma. Remove self-imports of New.Data.ChosenPlaceLevels and RUN81 from
the inserted helpers, because importing the helper files from their own
dependency would create a cycle. Retain all original imports, in
particular NeatLevel. No global dependency deletion is claimed.

NEW source audit: FOUR direct textual calls, not just the two often
listed in RUN81/82:
  Data.card_classAut_dvd_chosenGroupOrder (ChosenPlaceLevels)
  Data.classAut_columnLevel_eq_bot (ColumnDefs)
  Data.finrank_ker_one_sub_centralGen_le (ChainValuation)
  Data.exists_chain_eq_sum (ChainValuation)
The first retains its rank guard for the finite GL-order divisibility
bound; the third retains the rank and cyclic-orbit size argument. These
are distinct callers even though one body replacement suffices. Indirect
A2 consumers include Data.ramifyingOp_finrank_comap_and_short,
Data.span_short_ramifiedColumns, Data.IsGoodDatum.gaugeLe_chain,
and Data.short_forms (direct span edge in ShortAndEnough). The graph is
source-static until native probes. Do not claim exhaustive root
reachability or remove rank requirements elsewhere.

Actual connector-source check performed this run: exact unique splice
anchors, byte-string round trip, 1+1+2 direct source occurrences, actual
ShortAndEnough span edge, and mutated-original negative control rejected.
All four exact source blobs and both helper blobs authenticated by
connector response; this Node driver rechecks their git-blob digests
when run in the real workspace. Local command -v lean lake elan found
none. No rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier executed.
No new native PASS. Prior A receipt 088cd2ec0e935ee1a282f10096949bcf671cc804
re-read: module_1_build exit 124, six separate original checks standard,
all_requested_checks_ok=false. Peer B2 run 46006832164 job summaries
inspected; ledger documents graph ERROR despite separate module passes.
None of that is evidence for this A2 splice.

Use same shared compact workspace as acceleration RUN79, NOT another cold
build. Let ROOT be upstream checkout (containing grh-compact), OUT an
external scratch directory. Run:
  node RUN83_A2_FREENESS_SPLICE.mjs ROOT OUT
  cd ROOT/grh-compact
  lake build +New.Columns.ChainValuation:olean
  lake env lean OUT/original_probe.lean > OUT/original.log 2>&1
  node /absolute/path/RUN83_A2_FREENESS_SPLICE.mjs ROOT OUT --apply
  lake build +New.Columns.ChainValuation:olean
  lake env lean OUT/reduced_probe.lean > OUT/reduced.log 2>&1
  node /absolute/path/RUN83_A2_FREENESS_SPLICE.mjs ROOT OUT --audit
  node /absolute/path/RUN83_A2_FREENESS_SPLICE.mjs ROOT OUT --restore
Use absolute ROOT/OUT, save exit codes and both build logs separately.
Probe checks direct old/new named proof edges, the four actual callers,
unchanged types and universes (text comparison), and axiom sets via
#print axioms. It does not establish constructor-inclusive transitive
closure; retain that separate graph requirement. If any native error,
preserve log, repair first failing helper, do not label the splice PASS.
All A1–A3 quantitative/frame, other B/C/D/E/V obligations survive.

RESUME HERE: execute this splice/probe sequence in the shared A2 build
after coordinating with acceleration RUN79 (separate marked-frame
replacement); repair first actual Lean error in RUN81/82 helpers.
HANDOFF TO: acceleration, kernel, integration, audit, editor.
*/
const pin="72fead102f663d5c7a407964a13dc0cf9d977207";
const paths=["New/Data/ChosenPlaceLevels.lean","New/Columns/ColumnDefs.lean","New/Columns/ChainValuation.lean","New/Endgame/ShortAndEnough.lean"];
const helpers=["RUN81_COMPACT_GEOMETRIC_SUM_FREE_LEVEL.lean","RUN82_COMPACT_CHOSEN_LEVEL_LOCAL_BRIDGE.lean"];
const hashes={"New/Data/ChosenPlaceLevels.lean":"d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3","New/Columns/ColumnDefs.lean":"104b875374798b99448625fe6ce062ea6bfbfe65","New/Columns/ChainValuation.lean":"19e853dfa8c645bfcdf3b3e21183f9b432620ef7","New/Endgame/ShortAndEnough.lean":"b99eea0689be372d84362c58272b705e104b6a3a"};
const helperHashes={"RUN81_COMPACT_GEOMETRIC_SUM_FREE_LEVEL.lean":"f34c82d30b5d3cfa3582b14f9ba50bf337ae4f40","RUN82_COMPACT_CHOSEN_LEVEL_LOCAL_BRIDGE.lean":"f8f7fbd14a1d8372e71e46dc5438ec886ecd9d25"};
const rootNames=["Data.classAut_eq_bot_of_le_chosenLevel","Data.card_classAut_dvd_chosenGroupOrder","Data.classAut_columnLevel_eq_bot","Data.finrank_ker_one_sub_centralGen_le","Data.exists_chain_eq_sum","Data.ramifyingOp_finrank_comap_and_short","Data.span_short_ramifiedColumns","Data.IsGoodDatum.gaugeLe_chain"];
const newNames=["ThetaRun81.matrix_torsion_eq_one","ThetaRun81.finite_group_trivial","ThetaRun81.chosenLevel_free_of_prime_kill","ThetaRun81.smallerLevel_free","ThetaRun82.cast_prime_ne_zero_of_card_prime","ThetaRun82.gl_map_injective","ThetaRun82.chosen_component_prime_kill","ThetaRun82.rational_eq_one_of_component","ThetaRun82.chosenLevel_prime_kill","ThetaRun82.chosenLevel_free","ThetaRun82.chosenLevel_free_original"];
function requireCheck(b,m){if(!b)throw Error(m)}
function once(s,a,b){requireCheck(s.split(a).length===2,"non-unique splice anchor: "+a);return s.replace(a,b)}
function body(s,n){const start="namespace "+n+"\n",stop="\nend "+n;requireCheck(s.split(start).length===2&&s.split(stop).length===2,"helper namespace");return (start+s.split(start)[1].split(stop)[0]+stop).split("\n").filter(l=>!/^#(print axioms|check)\b/.test(l)).join("\n")}
function patch(s,a,b){
  const marker="/-- If n has at most 2𝗇_m elements";
  const old=":= classAut_eq_bot D.isConjApart_chosen.1\n  (by grw [prod_q_chosenPlace, h, finrank_eq_two_mul_card_infinitePlace,\n  pow_mul]; gcongr; use D.nat_lt_of_hasLogBound) hK";
  const imports=[...new Set((a+"\n"+b).split("\n").filter(l=>l.startsWith("import ")&&!l.includes("New.Data.ChosenPlaceLevels")&&!l.includes("RUN81_COMPACT_")))].filter(l=>!s.split("\n").includes(l));
  const payload="end Data\n\nsection\nopen NumberField Matrix MonoidHom\n\n"+body(a,"ThetaRun81")+"\n\n"+body(b,"ThetaRun82")+"\nend\n\nnamespace Data\n\n";
  let t=once(s,marker,payload+marker);
  t=once(t,old,":= ThetaRun82.chosenLevel_free hK");
  t=once(t,"\n\n/-! Set-up","\n"+imports.join("\n")+"\n\n/-! Set-up");
  requireCheck(once(once(once(t,"\n"+imports.join("\n")+"\n\n/-! Set-up","\n\n/-! Set-up"),payload+marker,marker),":= ThetaRun82.chosenLevel_free hK",old)===s,"round-trip");
  return t
}

import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';
import {fileURLToPath} from 'node:url';
const here=path.dirname(fileURLToPath(import.meta.url));
const root=path.resolve(process.argv[2]||'.'), out=path.resolve(process.argv[3]||'./rh83-output'), mode=process.argv[4]||'--prepare';
requireCheck(['--prepare','--apply','--restore','--audit'].includes(mode),'invalid mode');
const upstream=path.join(root,'grh-compact','src'), target=path.join(upstream,paths[0]);
const blob=s=>crypto.createHash('sha1').update('blob '+Buffer.byteLength(s)+'\0').update(s).digest('hex');
const read=p=>fs.readFileSync(p,'utf8');
const write=(p,s)=>fs.writeFileSync(path.join(out,p),s);
requireCheck(execFileSync('git',['-C',root,'rev-parse','HEAD'],{encoding:'utf8'}).trim()===pin,'wrong upstream commit');
requireCheck(!out.startsWith(root+path.sep)&&out!==root,'OUT must be external');
fs.mkdirSync(out,{recursive:true});
const orig=execFileSync('git',['-C',root,'show',pin+':grh-compact/src/'+paths[0]],{encoding:'utf8',maxBuffer:2**20});
requireCheck(blob(orig)===hashes[paths[0]],'original pin blob');
const inputs=helpers.map(f=>{const s=read(path.join(here,f));requireCheck(blob(s)===helperHashes[f],'helper blob: '+f);return s});
for(const p of paths.slice(1))requireCheck(blob(read(path.join(upstream,p)))===hashes[p],'changed caller: '+p);
const candidate=patch(orig,...inputs);
const now=read(target);
requireCheck(now===orig||now===candidate,'unexpected source modification; preserve and inspect');
const counts=[orig,...paths.slice(1,3).map(p=>read(path.join(upstream,p)))].map(s=>(s.match(/D\.classAut_eq_bot_of_le_chosenLevel/g)||[]).length);
requireCheck(JSON.stringify(counts)==='[1,1,2]','unexpected direct source occurrence count');
requireCheck(read(path.join(upstream,paths[3])).includes('D.span_short_ramifiedColumns'),'A root span edge missing');
const names=(reduced)=>reduced?[...rootNames,...newNames]:rootNames;
function probe(reduced){
  const header='import New.Columns.ChainValuation\nimport Lean\nopen Lean\nset_option pp.fullNames true\nset_option maxHeartbeats 0\n';
  const inspection=[
    'private def rh83inspect (n : Name) : Lean.Elab.Command.CommandElabM Unit := do',
    '  let info ← Lean.getConstInfo n',
    '  let some v := info.value? (allowOpaque := true) | throwError "RH83 missing proof value {n}"',
    '  logInfo m!"RH83TYPE|{n}|{(Lean.toJson (reprStr info.type)).compress}"',
    '  logInfo m!"RH83LEVEL|{n}|{(Lean.toJson (reprStr info.levelParams)).compress}"',
    '  for d in info.type.getUsedConstants do logInfo m!"RH83EDGE|{n}|type|{d}"',
    '  for d in v.getUsedConstants do logInfo m!"RH83EDGE|{n}|value|{d}"',
    '  logInfo m!"RH83DONE|{n}"'
  ].join('\n');
  return header+inspection+'\n'+names(reduced).map(n=>'run_cmd rh83inspect '+String.fromCharCode(96)+n+'\n#print axioms '+n).join('\n')+'\n';
}
function parse(log,expected){
  const types={},levels={},axioms={},edges=[],done=new Set();
  for(const line of log.split('\n')){
    const x=line.match(/RH83(TYPE|LEVEL|EDGE|DONE)\|(.+)$/);
    if(x){
      const [n,...r]=x[2].split('|');
      if(x[1]==='TYPE')types[n]=JSON.parse(r.join('|'));
      else if(x[1]==='LEVEL')levels[n]=JSON.parse(r.join('|'));
      else if(x[1]==='EDGE')edges.push([n,...r]);
      else done.add(n);
    }
    const a=line.match(/'([^']+)' depends on axioms: \[(.*?)\]/);
    if(a)axioms[a[1]]=a[2].split(',').map(x=>x.trim()).filter(Boolean).sort();
    const no=line.match(/'([^']+)' does not depend on any axioms/);
    if(no)axioms[no[1]]=[];
  }
  requireCheck(!/error:|sorryAx/.test(log),'compiler/proof error in log');
  for(const n of expected){
    requireCheck(n in types&&n in levels&&n in axioms&&done.has(n),'missing receipt: '+n);
    requireCheck(axioms[n].every(a=>['propext','Classical.choice','Quot.sound'].includes(a)),'unexpected axiom: '+n);
  }
  return {types,levels,axioms,edges,done:[...done]};
}
function audit(){
  const a=parse(read(path.join(out,'original.log')),names(false)), b=parse(read(path.join(out,'reduced.log')),names(true));
  write('original_graph.json',JSON.stringify(a,null,2));write('reduced_graph.json',JSON.stringify(b,null,2));
  const val=(g,n,d)=>g.edges.some(e=>e[0]===n&&e[1]==='value'&&e[2]===d);
  for(const n of rootNames){
    requireCheck(a.types[n]===b.types[n]&&a.levels[n]===b.levels[n],'changed exact type/levels '+n);
    requireCheck(JSON.stringify(a.axioms[n])===JSON.stringify(b.axioms[n]),'changed original axiom set '+n);
  }
  const rootName=rootNames[0];
  requireCheck(val(a,rootName,'classAut_eq_bot'),'baseline neatness edge missing');
  requireCheck(val(b,rootName,'ThetaRun82.chosenLevel_free')&&!val(b,rootName,'classAut_eq_bot'),'replacement edge missing or old edge retained');
  for(const n of rootNames.slice(1,5))requireCheck(val(a,n,rootName)&&val(b,n,rootName),'actual caller edge missing '+n);
  const receipt={source_pin:pin,scope:'exact original types, levels, axiom sets and four direct caller edges; not full graph',local_caller_checks:true,full_RH_replay:false,global_dependency_deletion:false,remaining_obligations:'all live ledger root rows'};
  write('audit_receipt.json',JSON.stringify(receipt,null,2));console.log(JSON.stringify(receipt));
}
write('original.lean',orig);write('reduced.lean',candidate);
write('original_probe.lean',probe(false));write('reduced_probe.lean',probe(true));
write('static_manifest.json',JSON.stringify({pin,hashes,helperHashes,original_blob:blob(orig),reduced_blob:blob(candidate),counts,static_only:true,native_verified:false},null,2));
if(mode==='--apply'){requireCheck(now===orig,'already modified');fs.writeFileSync(target,candidate)}
if(mode==='--restore'){requireCheck(now===candidate,'not exact candidate');fs.writeFileSync(target,orig)}
if(mode==='--audit'){requireCheck(now===candidate,'audit requires exact candidate checkout');audit()}
console.log('RUN83 source splice preparation/check complete; mode='+mode+'; not a native PASS');
