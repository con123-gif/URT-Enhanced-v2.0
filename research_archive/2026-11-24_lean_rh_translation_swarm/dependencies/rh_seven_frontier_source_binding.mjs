/* DEPENDENCIES — 2026-11-24 17:12 UTC — PARTIAL, actual parent-role evidence / source-bound frontier.
Working head before commit b28cdcabbd398b946f72d584b562e51ee9247e80. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream 307cef33f046955ee79dba47e0d828d06496d75f, Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f (not adopted; no whole revision equivalence). Mathlib exact lock 0df444a360eaa60ab8c11dca51a86af692955474. Preflight: SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, research state/log/protocol and continuity excerpts, physics CI #382, structure 1624, integration 1700, editor 1656, kernel and acceleration RUN11, audit and math excerpts. External blueprint not reread. No physical changes.
RESULT: Seven immediate targets of the six-anchor export now bound to exact pinned declaration sources; all seven actual incoming value-role edges, IDs, witnesses and kinds checked. Critical corrections: constructor is UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk, not unqualified; it has THREE fields, including two separate Row slots, and no theorem value. DirichletCharacter.LFunction_modOne_eq is external Mathlib, pin from lake-manifest.json, not RH local source. Source candidates below are not newly extracted outgoing proof-term edges; retain hypotheses and both Row slots. Parent report from original CI error, not relabelled. Source/file identity does not establish complete source-export equivalence. The source frontier is not an independent kernel replay.
Executed V8 semantic result: {"checks":140,"scannedValueEdges":76,"targets":7,"distinctSourceFiles":6,"negativeControls":7}. No full reindex or speedup claim. Complexity O(E+B+H) for fixed targets (E parent value records, B source bytes, H bounded source substring scans); storage O(E+B); no fresh native timing/RSS. CLI replay hashes original byte report and source git blobs; not executed here. Prior full closure result unchanged.
Replay: node rh_seven_frontier_source_binding.mjs solution_direct_roles.json PINNED_RH_CHECKOUT PINNED_MATHLIB_CHECKOUT. Obtain report from cathedral-research-state:compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json. Parent report SHA256 2b775ec5100e19711b40fa9852607b876524a91283432cfeb12a99c22a2ec3f8.
RESUME HERE: extend rh_targeted_role_witness.mjs using these seven exact tagged names/IDs; for ctor use type seed edges[0]-1, retain every remaining signed structural edge separately (never treat as proof value), preserve mutual metadata; run the authenticated solution projection once for these and integration 1700 requested anchors after source binding. Inspect native collector order-dependent cache issue separately; do not use cached axiom summaries as substitute for exact closure. HANDOFF TO kernel, integration, audit, structure, editor. OPEN.
*/
import fs from "node:fs";
import crypto from "node:crypto";
import {execFileSync} from "node:child_process";
const specs=[
  [
    "Formalism.VW.rh_of_right",
    341050,
    6497238,
    "thm",
    "Formalism.VW.rh_of_every",
    "leanprover-community/riemann-hypothesis",
    "40e56bab026552e089d7afcfeff08d2defb9c005",
    "src/Formalism/GammaFactorNonvanishing/RhOfRight.lean",
    "3604637147a33e72248faddd775ea750e7846ead",
    "theorem Formalism.VW.rh_of_right",
    [
      "riemannZeta_one_sub",
      "Complex.Gamma_ne_zero_of_re_pos",
      "Complex.cos_eq_zero_iff",
      "htriv"
    ]
  ],
  [
    "DirichletCharacter.LFunction_modOne_eq",
    341183,
    6497276,
    "thm",
    "Formalism.VW.rh_of_every",
    "leanprover-community/mathlib4",
    "0df444a360eaa60ab8c11dca51a86af692955474",
    "Mathlib/NumberTheory/LSeries/DirichletContinuation.lean",
    "9ccc38f52d669a88285a904e59dbb562ade5aba5",
    "@[simp] lemma LFunction_modOne_eq",
    [
      "LFunction χ = riemannZeta",
      "ZMod.LFunction_modOne_eq",
      "map_one"
    ]
  ],
  [
    "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
    14065050,
    1065212056,
    "thm",
    "UpperTheory.FinalTheorems.everyCharacter",
    "leanprover-community/riemann-hypothesis",
    "40e56bab026552e089d7afcfeff08d2defb9c005",
    "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean",
    "f769999ac5e49241993e5efbf81e4d2cded18acd",
    "theorem galoisLocalGlobalStrong_recParameter",
    [
      "UpperTheory.GalStar.Row0b recT",
      "galoisRepresentations_of_thetaLift",
      "UpperTheory.TP.K.tLiftK"
    ]
  ],
  [
    "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
    11298208,
    997980691,
    "thm",
    "UpperTheory.FinalTheorems.everyCharacter_of_row",
    "leanprover-community/riemann-hypothesis",
    "40e56bab026552e089d7afcfeff08d2defb9c005",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
    "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
    "theorem UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
    [
      "UpperTheory.Lit.every_character_of_theta_integrals_local_matching",
      "SelfIntersectionVolumeEstimates.topCovolSlim2_use_alt_alt",
      "local_langlands_gl_recT_exists_of_literature O",
      "hV : UpperTheory.Top.VWin"
    ]
  ],
  [
    "UpperTheory.Zero.LLC.recTExists",
    11307205,
    901833048,
    "thm",
    "UpperTheory.FinalTheorems.everyCharacter_of_row",
    "leanprover-community/riemann-hypothesis",
    "40e56bab026552e089d7afcfeff08d2defb9c005",
    "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/RecTExists.lean",
    "268786576f96cb5a2cea5fab2da4cf4f291c1116",
    "theorem UpperTheory.Zero.LLC.recTExists",
    [
      "UpperTheory.Zero.LLC.artEx",
      "UpperTheory.Zero.LLC.cuspEx",
      "GlobalTheory.LocLanglands.exists_isLExt",
      "UpperTheory.Zero.LLC.extDim",
      "UpperTheory.Zero.LLC.extTw",
      "UpperTheory.Zero.LLC.extDual",
      "UpperTheory.Zero.LLC.extInj",
      "UpperTheory.Zero.LLC.extDepth",
      "UpperTheory.Zero.LLC.typeIff"
    ]
  ],
  [
    "UpperTheory.One.vwin_of_row",
    13125899,
    997980696,
    "thm",
    "UpperTheory.FinalTheorems.everyCharacter_of_row",
    "leanprover-community/riemann-hypothesis",
    "40e56bab026552e089d7afcfeff08d2defb9c005",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean",
    "4cba179acd45ac08d3cad21f51c9b9d62715a9a4",
    "theorem UpperTheory.One.vwin_of_row",
    [
      "UpperTheory.One.Join.automorphic_window_of_inputs",
      "UpperTheory.LiteratureTheorems.OpenImageCondition.mk",
      "UpperTheory.BaseChangeIdentities.baseChangeN"
    ]
  ],
  [
    "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk",
    550021,
    12992050,
    "ctor",
    "UpperTheory.FinalTheorems.everyCharacter_of_row",
    "leanprover-community/riemann-hypothesis",
    "40e56bab026552e089d7afcfeff08d2defb9c005",
    "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
    "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
    "structure UpperTheory.LiteratureTheorems.OpenLiteratureStatements : Prop where",
    [
      "caraianiLocalGlobalDual : _root_.UpperTheory.One.M.Row",
      "localLanglandsExists : _root_.UpperTheory.Zero.LLC.RecTExists",
      "galoisRepOfPolarizedPairLit : _root_.UpperTheory.One.M.Row"
    ]
  ]
];
function verify(j,files,manifest,specs){
 const key=JSON.stringify;let checks=0;const ck=(a,m)=>{if(!a)throw Error(m);checks++};
 ck(manifest.sha==="b4d1ec31575a26b2159ec3a262b482bc051f3f6f"&&JSON.parse(manifest.content).packages.some(p=>p.name==="mathlib"&&p.rev==="0df444a360eaa60ab8c11dca51a86af692955474"),"Mathlib lock");
 ck(j.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&j.n===1065214335&&j.root===14065054&&j.indexedDeclarations===1484733&&j.reports.length===6,"archive identity");
 const byOwner=new Map(),byId=new Map();let scanned=0;
 for(const owner of j.reports){ck(!byOwner.has(owner.source.name),"duplicate owner");const refs=new Map();for(const e of owner.value.references){scanned++;const k=key([e.kind,e.nameParts]);ck(!refs.has(k),"duplicate role edge");refs.set(k,e);if(byId.has(e.target))ck(byId.get(e.target)===key(e.nameParts),"ID name consistency");else byId.set(e.target,key(e.nameParts))}byOwner.set(owner.source.name,refs)}
 const rows=[];for(const [name,id,witness,kind,owner,repo,rev,p,sha,header,hints] of specs){
  const e=byOwner.get(owner)?.get(key(["explicit_const",name.split(".")]));ck(e&&e.target===id&&e.targetKind===kind&&e.witnessExpression===witness&&e.distinctExpressionRecords===1,"exact exported parent edge "+name);
  const f=files[p];ck(f?.sha===sha,"pinned source blob "+p);const lines=f.content.split("\n"),hits=lines.map((l,i)=>l.startsWith(header)?i:-1).filter(i=>i>=0);ck(hits.length===1,"unique declaration header "+name);const start=hits[0];let end=lines.length;for(let i=start+1;i<lines.length;i++)if(/^(?:theorem |lemma |structure |def |@\[[^\]]+\] (?:lemma |theorem )|end(?: |$))/.test(lines[i])){end=i;break}
  const body=lines.slice(start,end).join("\n");for(const hint of hints)ck(body.includes(hint),"source candidate "+hint);
  if(name==="DirichletCharacter.LFunction_modOne_eq")ck(lines.slice(0,start).some(l=>l==="namespace DirichletCharacter"),"mathlib namespace");
  if(name==="UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter")ck(lines.slice(0,start).some(l=>l==="namespace UpperTheory.Gal.Int"),"galois namespace");
  if(kind==="ctor"){ck(hints.length===3&&lines.slice(start+1,start+4).map(x=>x.trim()).join("\n")===hints.join("\n"),"exact three constructor fields");ck(!body.includes(":="),"structure declaration not theorem value")}
  rows.push({name,id,witness,kind,owner,source:{repo,rev,path:p,sha,line:start+1},roles:kind==="ctor"?["type","structural_edges"]:["type","value"],sourceCandidates:hints})
 }
 return {checks,scannedValueEdges:scanned,targets:rows};
}
const [reportPath,rh,ml]=process.argv.slice(2);
if(!ml)throw Error("usage: report.json pinned-RH-checkout pinned-Mathlib-checkout");
const raw=fs.readFileSync(reportPath);
if(raw.length!==41772||crypto.createHash("sha256").update(raw).digest("hex")!=="2b775ec5100e19711b40fa9852607b876524a91283432cfeb12a99c22a2ec3f8")throw Error("report authentication");
function get(root,rev,p){const b=execFileSync("git",["-C",root,"show",rev+":"+p],{maxBuffer:32*1024*1024});return {content:b.toString("utf8"),sha:crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")}}
const files={};for(const a of specs)if(!files[a[7]])files[a[7]]=get(a[5]==="leanprover-community/riemann-hypothesis"?rh:ml,a[6],a[7]);
const manifest=get(rh,"40e56bab026552e089d7afcfeff08d2defb9c005","lake-manifest.json");
console.log(JSON.stringify(verify(JSON.parse(raw.toString("utf8")),files,manifest,specs),null,2));
