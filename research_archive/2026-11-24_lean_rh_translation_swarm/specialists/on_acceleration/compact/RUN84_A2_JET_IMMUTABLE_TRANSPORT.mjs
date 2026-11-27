/* RUN84 — 27 Nov 2026, A2 immutable original environment proof transport.
SOURCE-MATCHED / PREPARED, no new native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
Read current mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine, ledger
c40f1debc6872fb9e1f080a90c39d94e0b1caffe, protocols, RUN78/81/83, peer kernel
42f6ef9e (original olean cache retention prepared), theta RUN84/85 (separate
freeness supplier). No duplicate cold job. Latest actual A2 status 07a2b14930c38095e6771ae9ed1a10a3cf1bf678,
Actions 46023465491: original build 3199.21 s, overlay failed at area cancellation
39.38 s, no reduced graph; RUN83 repair not yet verified. No new receipt.
NEW: retain original .olean files, extract only changed square-frame transfer,
marked-prime adapter and marked gauge proof with exact original contexts.
Stage1 transports six actual caller bodies (eight source edges) to the local
index theorem, preserving ordinary fallback. Stage2 additionally elaborates
the single-block frame and general adapter, transports ten bodies (13 edges)
and substitutes all four gauge branches at the SAME index theorem; ordinary
jet integrality -> standardData -> ordinary gauge, marked -> move -> pow ->
marked and collision -> jetCeil. Also retarget mem_raises_of_dvd (separate
consumer). Each transported proof uses original type and universes, changes
only named constants, and must pass normal kernel addDecl, exact value-edge
set guard and standard/no-new axiom audit. Marked adapter has extra guard
already present at original caller, so cannot simply rename a constant of a
different type; changed leaf must elaborate normally. Keep original proof
terms and graphs, no source mutation. No claim of speed until measured.
Do NOT conflate this index candidate with independent theta freeness or A1
index/type candidates; final fusion requires joint substitutions at overlapping
callers. Other suppliers including jet exponent and all A/B/C/D/E/V remain.
Actual connector-source JS generation: six exact blobs, stage1 8
edges/8 damaged anchors rejected, stage2 13
edges/13 damaged anchors rejected. Local command -v
lean/lake/elan absent. No native rh_scan/prune/reduce/auto/frontier execution,
no URT speed claim. Source edges not full kernel graph. Full RH remains OPEN.
RESUME HERE: integration/kernel reuse authenticated ORIGINAL LocalStatement
workspace (before overlays), run node RUN84_A2_JET_IMMUTABLE_TRANSPORT.mjs
ROOT OUT; then cd ROOT/grh-compact and lake env lean --tstack=400000
OUT/Jet84Marked.lean (absolute OUT), capture rc and full log. Require one
JET84_LEAF and six JET84_CHECKED, no unexpected axioms/error, then run
OUT/Jet84General.lean independently requiring two leaf and ten checked markers.
Repair first actual compiler error, retain failed and original logs; strict
constructor-inclusive old/new graph and joint caller fusion remain separate.
No new cold build, no protected edits, no root claim.
HANDOFF TO kernel/integration/theta/audit.
*/

import fs from 'node:fs';
import path from 'node:path';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
import {fileURLToPath} from 'node:url';
const paths={
  "jet": [
    "grh-compact/src/New/Curve/ConjugatesOfJets.lean",
    "8b841d76bb938d8a18fd4341aa832a20b13dd9e0"
  ],
  "local": [
    "grh-compact/src/New/Columns/LocalStatement.lean",
    "9d5bd0d698b0db2850cbd306d8d400d7e99a3547"
  ],
  "splice": [
    "RUN78_MARKED_CALLER_SPLICE.mjs",
    "9026bf359bc7d88723ccc6e0dcbce32a7a161f30"
  ],
  "repair": [
    "RUN83_A2_AREA_CANCELLATION_REPAIR.mjs",
    "2590860396433c4b40108b3065ff78740ec93afd"
  ],
  "frame": [
    "RUN80_GENERAL_PUNIT_SQUARE_FRAME.lean",
    "805aaaa8695448ae89c32b240501c1e5516d5de4"
  ],
  "stage2": [
    "RUN81_A2_GENERAL_CALLER_SPLICE.mjs",
    "418b945e43806a7b147169d7534e621acc8bdc53"
  ]
};
function generate(inputs,second){
 const {jet,local,splice,repair,frame,stage2}=inputs;
 const req=(ok,m)=>{if(!ok)throw Error(m)};
 const once=(s,a,b)=>{req(s.split(a).length===2,"anchor "+a);return s.replace(a,b)};
 const region=(s,a,b)=>{const i=s.indexOf(a),j=s.indexOf(b,i+a.length);req(i>=0&&j>i,"region "+a);return s.slice(i,j)};
 const patch=Function(region(splice,"const patch = ","const root=path.resolve")+";return patch;")()(jet,local);
 const repaired=Function(region(repair,"const old = ","const root=path.resolve")+";return repair;")()(patch.newJet);
 let candidate=repaired,helper="";
 if(second){
  const s=Function("once",region(stage2,"function stage2(","function audit(")+";return stage2;")(once)(repaired,frame);
  candidate=s.newJet;helper=once(s.newHelper,"import New.Curve.TightFrameExists\n","");
 }
 const header="import New.Columns.LocalStatement\nimport New.Curve.TightFrameExists\nimport Lean\n\nset_option debug.skipKernelTC false\nset_option Elab.async false\nset_option maxHeartbeats 0\nset_option pp.fullNames true\n";
 const jctx=region(jet,"open CMLattice","lemma integralAfter.of_integral");
 const square=region(candidate,"lemma norm_jetSeries_le_from_square_frame_run78","/-- Let V be standard, f standard data");
 const general=region(candidate,"lemma norm_jetSeries_le {","/-- The prime-to-level branch");
 const prime=region(candidate,"lemma norm_jetSeries_le_prime_to_level_run78","/-- Integrality of jets:");
 const lctx=region(local,"open Polynomial","/-- For a set Λ of primes");
 const marked=once(region(patch.newLocal,"lemma Data.IsGoodDatum.mem_raises","/-- For L listing distinct primes"),"lemma Data.IsGoodDatum.mem_raises ","lemma Data.IsGoodDatum.mem_raises_jet_run84 ");
 req(square.includes("hMreal")&&marked.includes("hΛ.4.2 ∘ P.chiK_eq_one_of_dvd Fact.out"),"repair/guard absent");
 let result=header+"\n"+(second?"section\n"+helper+"\nend\n":"")+"\nsection\n"+jctx+square+(second?once(general,"lemma norm_jetSeries_le {","lemma norm_jetSeries_le_general_run84 {"):"")+prime+"\nend Parameters\nend\n\nsection\n"+lctx+"include H hQ\n"+marked+"\nend\n";
 const D="Data.IsGoodDatum.",P="Parameters.",M=D+"mem_raises",T=P+"norm_jetSeries_le",G=P+"norm_jet_jetSeries_le_one",S=P+"mem_raises_of_standardData",Move=D+"exists_move_markOperator",Pow=D+"gaugeLe_markOperator_pow",Mark=D+"gaugeLe_Bmu_of_isMarked",Col=D+"gaugeLe_collisionSum",Ceil=D+"gaugeLe_pow_jetCeil_smul",One=D+"gaugeLe_one",Idx="Data.exists_indexDvd_Bmu_divisible";
 const fresh=n=>n===T?n+"_general_run84":n+"_jet_run84";
 const edges=[
 [Move,local,[[M,"H.mem_raises"]]], [Pow,local,[[Move,"H.exists_move_markOperator"]]],
 [Mark,local,[[Pow,"H.gaugeLe_markOperator_pow"]]], [Col,local,[[Pow,"H.gaugeLe_markOperator_pow"]]],
 [Ceil,local,[[Col,"H.gaugeLe_collisionSum"]]],
 ...(second?[[G,jet,[[T,"norm_jetSeries_le hf"]]],[S,jet,[[G,"norm_jet_jetSeries_le_one h0"]]],[P+"mem_raises_of_dvd",jet,[[S,"mem_raises_of_standardData out"]]],[One,local,[[S,"P.mem_raises_of_standardData"]]]]:[]),
 [Idx,local,[[Mark,"G.gaugeLe_Bmu_of_isMarked"],[Ceil,"G.gaugeLe_pow_jetCeil_smul"],[Col,"G.gaugeLe_collisionSum"],...(second?[[One,"G.gaugeLe_one"]]:[])]]
 ];
 function body(s,n){const a=s.includes("lemma "+n+" ")?"lemma "+n+" ":"lemma "+n.split(".").at(-1)+" ";const i=s.indexOf(a);req(i>=0,"missing declaration "+n);const j=s.indexOf("\n/--",i);return s.slice(i,j<0?s.length:j);}
 function check(b,needle){req(b.includes(needle),"missing source edge "+needle)}
 let rejected=0,count=0;
 for(const [n,s,subs] of edges){const b=body(s,n);for(const [,needle] of subs){check(b,needle);count++;try{check(b.replaceAll(needle,"__removed__"),needle)}catch(e){rejected++}}}
 req(rejected===count,"negative accepted");
 result+=`
private def jet84Same (a b : Lean.ConstantInfo) : Lean.Elab.Command.CommandElabM Unit := do
  unless a.levelParams == b.levelParams do
    Lean.throwError "JET84 universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq a.type b.type
  unless same do
    Lean.throwError "JET84 type mismatch"

private def jet84Audit (old fresh : Lean.Name) : Lean.Elab.Command.CommandElabM Unit := do
  jet84Same (← Lean.getConstInfo old) (← Lean.getConstInfo fresh)
  let allowed : Array Lean.Name := #[\`\`propext, \`\`Classical.choice, \`\`Quot.sound]
  let oa ← Lean.collectAxioms old
  let na ← Lean.collectAxioms fresh
  unless oa.all (fun x => allowed.contains x) && na.all (fun x => allowed.contains x && oa.contains x) do
    Lean.throwError "JET84 unexpected axiom"
  for n in #[old, fresh] do
    let info ← Lean.getConstInfo n
    let some v := info.value? (allowOpaque := true) | Lean.throwError "JET84 missing value"
    Lean.logInfo m!"JET84_TYPE|{n}|{(Lean.toJson (reprStr info.type)).compress}"
    Lean.logInfo m!"JET84_LEVEL|{n}|{(Lean.toJson (reprStr info.levelParams)).compress}"
    for dep in info.type.getUsedConstants do
      Lean.logInfo m!"JET84_EDGE|{n}|type|{dep}"
    for dep in v.getUsedConstants do
      Lean.logInfo m!"JET84_EDGE|{n}|value|{dep}"
    Lean.logInfo m!"JET84_AXIOMS|{n}|{← Lean.collectAxioms n}"

private def jet84Leaf (old fresh required forbidden : Lean.Name) : Lean.Elab.Command.CommandElabM Unit := do
  jet84Audit old fresh
  let some v := (← Lean.getConstInfo fresh).value? (allowOpaque := true) | Lean.throwError "JET84 leaf missing"
  let deps := v.getUsedConstants
  unless deps.contains required && !deps.contains forbidden && !deps.contains old do
    Lean.throwError "JET84 leaf edge mismatch"
  Lean.logInfo m!"JET84_LEAF|{fresh}"

private def jet84Transport (old fresh : Lean.Name) (subs : Array (Lean.Name × Lean.Name)) :
    Lean.Elab.Command.CommandElabM Unit := do
  let .thmInfo info ← Lean.getConstInfo old | Lean.throwError "JET84 original not theorem"
  let before := info.value.getUsedConstants
  for (a,b) in subs do
    jet84Same (← Lean.getConstInfo a) (← Lean.getConstInfo b)
    unless before.contains a && !before.contains b do
      Lean.throwError "JET84 original edge absent or already changed"
  let proof := info.value.replace fun e =>
    match e with
    | .const n us =>
      match subs.find? (fun pair => pair.1 == n) with
      | some pair => some (.const pair.2 us)
      | none => none
    | _ => none
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := fresh
    levelParams := info.levelParams
    type := info.type
    value := proof
  })
  let .thmInfo checked ← Lean.getConstInfo fresh | Lean.throwError "JET84 checked theorem absent"
  unless checked.type == info.type && checked.levelParams == info.levelParams do
    Lean.throwError "JET84 caller statement changed"
  let expected := (before.filter (fun n => !subs.any (fun s => s.1 == n))) ++ subs.map (·.2)
  let after := checked.value.getUsedConstants
  unless expected.all (fun x => after.contains x) && after.all (fun x => expected.contains x) do
    Lean.throwError "JET84 changed unexpected edge"
  unless !after.contains old && subs.all (fun s => !after.contains s.1) do
    Lean.throwError "JET84 old supplier remains"
  jet84Audit old fresh
  Lean.logInfo m!"JET84_CHECKED|{fresh}"
`;
 const raw=n=>"`"+n;
 result+="\nrun_cmd jet84Leaf "+[M,fresh(M),P+"norm_jetSeries_le_prime_to_level_run78",T].map(raw).join(" ")+"\n";
 if(second)result+="run_cmd jet84Leaf "+[T,fresh(T),P+"exists_punit_square_frame_run80",P+"exists_isTightFrame"].map(raw).join(" ")+"\n";
 for(const [n,,subs] of edges)result+="run_cmd jet84Transport "+raw(n)+" "+raw(fresh(n))+" #["+subs.map(([o])=>"("+raw(o)+", "+raw(fresh(o))+")").join(", ")+"]\n";
 result+="#print axioms "+P+"norm_jetSeries_le_from_square_frame_run78\n#print axioms "+P+"norm_jetSeries_le_prime_to_level_run78\n"+(second?"#print axioms "+P+"exists_punit_square_frame_run80\n":"")+"#print axioms "+fresh(Idx)+"\n";
 req(!result.includes("import Main"),"forbidden root import");
 return {result,edgeCount:count,negativeRejected:rejected,transportCount:edges.length,leafCount:second?2:1,spec:edges.map(([n,,s])=>[n,s.map(([o])=>o)])};
}
const root=path.resolve(process.argv[2]||'.'),out=path.resolve(process.argv[3]||'jet84-out'),here=path.dirname(fileURLToPath(import.meta.url));
if(execFileSync('git',['rev-parse','HEAD'],{cwd:root,encoding:'utf8'}).trim()!=="72fead102f663d5c7a407964a13dc0cf9d977207")throw Error('wrong pin');
const inputs={};
for(const [k,[p,h]] of Object.entries(paths)){
 const raw=fs.readFileSync(path.join(k==='jet'||k==='local'?root:here,p));
 const actual=createHash('sha1').update('blob '+raw.length+'\0').update(raw).digest('hex');
 if(actual!==h)throw Error('blob mismatch '+k);
 inputs[k]=raw.toString('utf8');
}
fs.mkdirSync(out,{recursive:true});
const manifest={native_verified:false,full_RH_replay:false,original_source_untouched:true,phases:{}};
for(const [name,second] of [['Jet84Marked',false],['Jet84General',true]]){
 const {result,...stats}=generate(inputs,second);
 fs.writeFileSync(path.join(out,name+'.lean'),result,{flag:'wx'});
 manifest.phases[name]={...stats,sha256:createHash('sha256').update(result).digest('hex')};
}
fs.writeFileSync(path.join(out,'jet84_manifest.json'),JSON.stringify(manifest,null,2),{flag:'wx'});
console.log(JSON.stringify(manifest));
