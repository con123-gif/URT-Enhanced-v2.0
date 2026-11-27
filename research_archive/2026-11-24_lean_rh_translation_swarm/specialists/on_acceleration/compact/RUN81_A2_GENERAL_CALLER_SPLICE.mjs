/* RUN81 — 27 November 2026, A2 second-stage actual caller overlay.
SOURCE-MATCHED / executable preparation, native replay PENDING.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679;
Lean 4.35.0. Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 separate.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
4878ea106b791c42b5f5a45810162de59701c4d9, ledger
01fa22a6b12abad5ccf580d2621f82be3bf70c13; reviewed peer A2 5bc36ce5,
RUN78-80 and B2 graph compatibility. Registry 0fbfb0329bd795615015a63197a0470ee45667d4
contains no A2 shared replay entry at inspection. No new cold build or protected
workflow edits. No new native verification receipt. B2 46006832164 is separate:
seven pair/energy and skew/count passed; recursive graph not accepted.
 
Actual new work: exact Mathlib pinned Data/ZMod/Basic.lean blob aa726b1c3b551100c23970554d93064c758bd8b6
defines natCast_eq_zero_iff (a b : Nat), NOT a parameter R. RUN80's explicit
(R := ZMod p) is therefore invalid for the intended lemma. Correct in a
disposable module, using ZMod.natCast_eq_zero_iff (M l) p. Its mathematical
content is exactly the implication (M_l : ZMod p)=0 => p divides M_l.
No extra premise, no weaker proof goal. Source Different.lean confirms
dvd_norm_c₀ : p.Prime -> p divides N1 -> p divides (d+1)/4.
 
The second-stage splice changes ONLY the general frame-selection body and adds
one import, after authenticated RUN78 stage1. The marked Hecke caller and
shared jet-transfer body are byte-identical to stage1. General jet statement,
its caller norm_jet_jetSeries_le_one, p-unit, nonzero and frame hypotheses
are retained. Both old graphs and all unresolved A1-A3 and other obligations
remain. Original direct path: GENERAL -> TRANSFER -> exists_isTightFrame;
stage1 retains fallback; stage2 candidate GENERAL -> TRANSFER ->
exists_punit_square_frame_run80 + shared transfer. No global deletion
until full reachability; original large-frame theorem may still serve
other callers. No URT benchmark, no claimed proof-search acceleration.
 
Actual executed JS on connector-returned pinned sources: 5 source signature/
blob guards, original RUN78 patch function evaluated on exact upstream blobs,
second-stage reversible edit and 4/4 deliberately broken source controls rejected.
No local Lean execution. Native rh_scan/prune/reduce/auto/frontier remain pending;
RUN79 existing direct-role probe is NOT complete recursive coverage. The
peer projection carrier diagnosis applies to a later strict recursive audit.
 
RESUME HERE: integration/kernel use RUN79's original and stage1 probe in the
SAME pinned shared workspace; after stage1 compare succeeds run
node RUN81_A2_GENERAL_CALLER_SPLICE.mjs <checkout-root> --apply
then lake build +New.Columns.LocalStatement:olean in grh-compact.
Use RUN79 probe/parse with NEW plus Parameters.exists_punit_square_frame_run80;
save separate stage2_graph.json. Require exact types/universes and axiom sets
for ORIG, standard axioms for new helper, stage1 marked caller edge still
present, GENERAL still consumes TRANSFER, TRANSFER consumes helper and
SQUARE but not exists_isTightFrame, and helper excludes that old direct edge.
Use --audit <stage1_graph.json> <stage2_graph.json> below. Retain actual
logs including first native error. Never use a status label as a Lean receipt.
HANDOFF TO theta/kernel/integration/audit. RH/star OPEN.
*/
import fs from 'node:fs';
import path from 'node:path';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
import {fileURLToPath} from 'node:url';
function once(s,a,b){if(s.split(a).length!==2)throw Error("nonunique anchor: "+a);return s.replace(a,b)}
function stage1(old,jet,local){const a=old.indexOf("const patch = "),b=old.indexOf("const root=path.resolve");if(a<0||b<a)throw Error("RUN78 patch missing");return Function(old.slice(a,b)+";return patch;")()(jet,local)}
function stage2(jet,helper){
 const old="  let M := p * (P.d * P.N₁ s) ^ 6 + 1\n  obtain ⟨hM, _, _, w, k, hw, -⟩ := (by simp [M] : p.Coprime M), P.exists_isTightFrame s (by\n    unfold M; grw [← q.1.one_le]; lia : _ * 1 ≤ M * M)\n  exact norm_jetSeries_le_from_square_frame_run78 hM (by simp [M]) hw hf c L H\n";
 const fresh="  obtain ⟨M, hM, hM0, I, hI, w, k, hw⟩ := P.exists_punit_square_frame_run80 s (p := p)\n  letI := hI\n  exact norm_jetSeries_le_from_square_frame_run78 hM hM0 hw hf c L H\n";
 const imp="import New.Curve.IntegralVacuum\n", imp2=imp+"import New.Curve.PUnitSquareFrameRun80\n";
 const bad="rw [← natCast_eq_zero_iff (R := ZMod p)]", good="rw [← ZMod.natCast_eq_zero_iff (M l) p]";
 const newJet=once(once(jet,old,fresh),imp,imp2),newHelper=once(helper,bad,good);
 if(once(once(newJet,fresh,old),imp2,imp)!==jet||once(newHelper,good,bad)!==helper)throw Error("not reversible");
 if(!newJet.includes("| rfl => norm_jetSeries_le hf _ _ (r := 1)")||!newJet.includes("lemma norm_jetSeries_le_prime_to_level_run78")||!newHelper.includes("lemma Parameters.exists_punit_square_frame_run80"))throw Error("consumer missing");
 return {newJet,newHelper};
}
function audit(a,b){
 const T="Parameters.norm_jetSeries_le", G="Parameters.norm_jet_jetSeries_le_one", C="Data.IsGoodDatum.mem_raises", F="Parameters.exists_isTightFrame", S="Parameters.norm_jetSeries_le_from_square_frame_run78", P="Parameters.norm_jetSeries_le_prime_to_level_run78", N="Parameters.exists_punit_square_frame_run80";
 const req=(x,m)=>{if(!x)throw Error(m)};
 const edge=(g,x,y)=>g.edges.some(e=>e[0]===x&&e[1]==="value"&&e[2]===y);
 const canonical=x=>JSON.stringify([...x].sort());
 req(a.complete&&b.complete,"incomplete graph/axioms");
 for(const n of [T,G,C,S,P]){
  req(typeof a.types[n]==="string"&&a.types[n]===b.types[n]&&typeof a.levels[n]==="string"&&a.levels[n]===b.levels[n],"statement changed "+n);
  req(Array.isArray(a.axioms[n])&&Array.isArray(b.axioms[n])&&canonical(a.axioms[n])===canonical(b.axioms[n]),"axioms changed "+n);
 }
 req(Array.isArray(b.axioms[N])&&b.axioms[N].every(x=>["propext","Classical.choice","Quot.sound"].includes(x))&&b.done.includes(N),"new helper audit missing");
 req(edge(a,T,F)&&edge(a,G,T)&&edge(a,C,P),"stage1 baseline absent");
 req(edge(b,G,T)&&edge(b,C,P)&&!edge(b,C,T),"consumer edge changed");
 req(edge(b,T,N)&&edge(b,T,S)&&!edge(b,T,F)&&!edge(b,N,F),"stage2 supplier dependency failed");
 return {scope:"direct edges only",stage2_direct_caller_checked:true,global_dependency_deletion:false,full_RH_replay:false};
}

if(process.argv[2]==="--audit"){
 console.log(JSON.stringify(audit(...process.argv.slice(3,5).map(f=>JSON.parse(fs.readFileSync(f,'utf8'))))));
}else{
 const root=path.resolve(process.argv[2]||'.'), here=path.dirname(fileURLToPath(import.meta.url));
 const git=(...args)=>execFileSync('git',args,{cwd:root});
 const blob=s=>createHash('sha1').update('blob '+Buffer.byteLength(s)+'\0').update(s).digest('hex');
 const checked=(s,h)=>{if(blob(s)!==h)throw Error('blob mismatch '+h);return s};
 if(git('rev-parse','HEAD').toString().trim()!=='72fead102f663d5c7a407964a13dc0cf9d977207')throw Error('wrong pin');
 const j='grh-compact/src/New/Curve/ConjugatesOfJets.lean',l='grh-compact/src/New/Columns/LocalStatement.lean',n='grh-compact/src/New/Curve/PUnitSquareFrameRun80.lean';
 const o=checked(fs.readFileSync(path.join(here,'RUN78_MARKED_CALLER_SPLICE.mjs'),'utf8'),'9026bf359bc7d88723ccc6e0dcbce32a7a161f30'),h=checked(fs.readFileSync(path.join(here,'RUN80_GENERAL_PUNIT_SQUARE_FRAME.lean'),'utf8'),'805aaaa8695448ae89c32b240501c1e5516d5de4');
 const origJ=checked(git('show','HEAD:'+j).toString('utf8'),'8b841d76bb938d8a18fd4341aa832a20b13dd9e0'),origL=checked(git('show','HEAD:'+l).toString('utf8'),'9d5bd0d698b0db2850cbd306d8d400d7e99a3547');
 const s1=stage1(o,origJ,origL);
 if(fs.readFileSync(path.join(root,j),'utf8')!==s1.newJet||fs.readFileSync(path.join(root,l),'utf8')!==s1.newLocal||fs.existsSync(path.join(root,n)))throw Error('not exact clean stage1 overlay');
 const s2=stage2(s1.newJet,h);
 if(process.argv.includes('--apply')){fs.writeFileSync(path.join(root,n),s2.newHelper,{flag:'wx'});fs.writeFileSync(path.join(root,j),s2.newJet);}
 console.log(JSON.stringify({stage1_jet_blob:blob(s1.newJet),stage1_local_blob:blob(s1.newLocal),stage2_jet_blob:blob(s2.newJet),stage2_helper_blob:blob(s2.newHelper),local_unchanged:true,native_verified:false,applied:process.argv.includes('--apply')}));
}
