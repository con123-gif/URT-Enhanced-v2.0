/* DEPENDENCIES — 2026-11-24 18:12 UTC — PARTIAL. One combined authenticated role projection, not a new kernel proof.
Working head at checkpoint c251ffa4df2f5995271852c05585554960cc56d0. RH source pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream 307cef33f046955ee79dba47e0d828d06496d75f (not adopted). Preflight: SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, runner log/protocol and state/continuity excerpts, CI #385 PASS (unrelated physical checks), prior seven-frontier, kernel RUN12, acceleration RUN11/12, integration 1800, latest peer commit/handoff excerpts. External blueprint not reread. No physical gate changes.
RESULT: 47 exact-name requests, 41 with known solution declaration IDs (7 incoming edge targets + 34 manifest rows), six additional integration/audit exact-name probes. Seven source-binding blob 6ae146c5246bebdef4bed5e0b05b31feff9cfb0c; RUN12 manifest handoff c26db49a072dcbec8eab6b14578cdd20e7bd02e6; RUN11 a9bb6ded82fd10797a439eec227d2162ed3e8f66. Four integration source candidate headers and blob identities independently checked against original pin; not proof edges. Known roots use one-based manifest IDs with explicit zero-based conversion only for expression projection. Challenge archive ID namespace independent. Constructor: only type and separately retained signed structural edges, never a fabricated proof value. Mutual metadata retained. Unknown exact names can remain NOT_EXPORTED; no suffix fallback or inference of proof reachability. All 41 known IDs required in solution. Membership in full export alone does not imply root-reachability. No hypotheses deleted, no cached axiom summaries used as replacement for exact dependencies.
Executed V8 actual lean4export 3.0 fixture (blob d3cd35f1313b4e78b5fded9886e450112aa75def): {"checks":805,"negative":5,"expressions":434,"declarations":32,"targets":20,"constructors":7,"roles":33,"referenceWitnesses":85}; raw independent expression traversal checks each distinct witness/count; negative controls for duplicate requests, wrong IDs, wrong seeds/kinds, missing required names. Full native CLI and RH projection NOT executed in this session. Expected O(B + expanded declaration-name bytes + sum of per-role reachable expression nodes/edges + output), B raw archive bytes, fixed 47 requests; not globally linear for arbitrary owner count. Working memory parser + per-role seen set + output, 12-byte disk index; no fresh full-scale timing or RSS or URT advantage. Single full reindex needed because previous index transient. Reuse hash-pinned parser, no repeated mixed root closure.
Replay: node rh_combined_frontier_roles.mjs --out /tmp/rh-frontier; local fixture: node rh_combined_frontier_roles.mjs test /path/to/Nat.add_succ.ndjson. New compute job rh-combined-frontier-roles-20261124 requested; result pending. RESUME HERE: read compute/rh-combined-frontier-roles-20261124/status.json and outputs/solution_frontier_roles.json; compare all 41 known IDs, constructor structural rows and actual new role references with specialist source claims; distinguish six optional probes that are absent or not yet root-linked. HANDOFF TO integration, audit, kernel, acceleration, structure, editor and math specialists. Project OPEN.
*/
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import crypto from "node:crypto";
import {fileURLToPath} from "node:url";
import {spawnSync} from "node:child_process";
const here=path.dirname(fileURLToPath(import.meta.url));
const requests=[
  {
    "name": "Formalism.VW.rh_of_right",
    "id": 341050,
    "kind": "thm",
    "origin": "seven_frontier",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Formalism/GammaFactorNonvanishing/RhOfRight.lean",
      "blob": "3604637147a33e72248faddd775ea750e7846ead",
      "header": "theorem Formalism.VW.rh_of_right"
    },
    "incoming": {
      "owner": "Formalism.VW.rh_of_every",
      "witness": 6497238
    }
  },
  {
    "name": "DirichletCharacter.LFunction_modOne_eq",
    "id": 341183,
    "kind": "thm",
    "origin": "seven_frontier",
    "source": {
      "repository": "leanprover-community/mathlib4",
      "rev": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/NumberTheory/LSeries/DirichletContinuation.lean",
      "blob": "9ccc38f52d669a88285a904e59dbb562ade5aba5",
      "header": "@[simp] lemma LFunction_modOne_eq"
    },
    "incoming": {
      "owner": "Formalism.VW.rh_of_every",
      "witness": 6497276
    }
  },
  {
    "name": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
    "id": 14065050,
    "kind": "thm",
    "origin": "seven_frontier",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean",
      "blob": "f769999ac5e49241993e5efbf81e4d2cded18acd",
      "header": "theorem galoisLocalGlobalStrong_recParameter"
    },
    "incoming": {
      "owner": "UpperTheory.FinalTheorems.everyCharacter",
      "witness": 1065212056
    }
  },
  {
    "name": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
    "id": 11298208,
    "kind": "thm",
    "origin": "seven_frontier",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
      "blob": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
      "header": "theorem UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
    },
    "incoming": {
      "owner": "UpperTheory.FinalTheorems.everyCharacter_of_row",
      "witness": 997980691
    }
  },
  {
    "name": "UpperTheory.Zero.LLC.recTExists",
    "id": 11307205,
    "kind": "thm",
    "origin": "seven_frontier",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/RecTExists.lean",
      "blob": "268786576f96cb5a2cea5fab2da4cf4f291c1116",
      "header": "theorem UpperTheory.Zero.LLC.recTExists"
    },
    "incoming": {
      "owner": "UpperTheory.FinalTheorems.everyCharacter_of_row",
      "witness": 901833048
    }
  },
  {
    "name": "UpperTheory.One.vwin_of_row",
    "id": 13125899,
    "kind": "thm",
    "origin": "seven_frontier",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean",
      "blob": "4cba179acd45ac08d3cad21f51c9b9d62715a9a4",
      "header": "theorem UpperTheory.One.vwin_of_row"
    },
    "incoming": {
      "owner": "UpperTheory.FinalTheorems.everyCharacter_of_row",
      "witness": 997980696
    }
  },
  {
    "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk",
    "id": 550021,
    "kind": "ctor",
    "origin": "seven_frontier",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
      "blob": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
      "header": "structure UpperTheory.LiteratureTheorems.OpenLiteratureStatements : Prop where"
    },
    "incoming": {
      "owner": "UpperTheory.FinalTheorems.everyCharacter_of_row",
      "witness": 12992050
    }
  },
  {
    "name": "PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of'",
    "id": 8981975,
    "kind": "thm",
    "type": 721071981,
    "value": 721077114,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of'_k",
    "id": 14034132,
    "kind": "thm",
    "type": 1064108806,
    "value": 1064113892,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "PositivityTheory.SiegelWeilFormula.Avac.vacK_of",
    "id": 8953756,
    "kind": "thm",
    "type": 719345210,
    "value": 719345276,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "PositivityTheory.SiegelWeilFormula.Avac.vac_K'",
    "id": 8953455,
    "kind": "thm",
    "type": 719330417,
    "value": 719332516,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "PositivityTheory.SiegelWeilFormula.Avac.vac_res'",
    "id": 8953738,
    "kind": "thm",
    "type": 719344087,
    "value": 719345204,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames",
    "id": 8953593,
    "kind": "thm",
    "type": 719334572,
    "value": 719339157,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf",
    "id": 6375344,
    "kind": "thm",
    "type": 482469303,
    "value": 482473989,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.T.psiLevelPairCompatible_of_columnLevels",
    "id": 6375353,
    "kind": "thm",
    "type": 482469303,
    "value": 482473990,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.Mem.R3.Grp.grp_levels_exist",
    "id": 6375493,
    "kind": "thm",
    "type": 482488644,
    "value": 482497057,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.Mem.R3.pins_card_index_ranks",
    "id": 4997285,
    "kind": "thm",
    "type": 369503821,
    "value": 369505607,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.MemLoc.frob_laws",
    "id": 2367057,
    "kind": "thm",
    "type": 146721290,
    "value": 146724857,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "Deduction.iteratedDeriv_laplace",
    "id": 868949,
    "kind": "thm",
    "type": 27135065,
    "value": 27135383,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "Deduction.iteratedDeriv_laplace_hasDerivAt",
    "id": 868943,
    "kind": "thm",
    "type": 27133262,
    "value": 27135043,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "Deduction.landau_coeff",
    "id": 868955,
    "kind": "thm",
    "type": 27135405,
    "value": 27136665,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.eq_zero_of_forall_residueField_functional",
    "id": 11189057,
    "kind": "thm",
    "type": 883466002,
    "value": 883467093,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.PtVanish.connForm_eq_zero",
    "id": 11189127,
    "kind": "thm",
    "type": 883478321,
    "value": 883487623,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "ReciprocityTheory.ChartRestriction.G.Chart.tan_lift",
    "id": 3987187,
    "kind": "thm",
    "type": 279772183,
    "value": 279775949,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "ReciprocityTheory.ChartRestriction.G.Chart.tan_uniq",
    "id": 3986738,
    "kind": "thm",
    "type": 279727724,
    "value": 279731467,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "ReciprocityTheory.ChartRestriction.G.Chart.glue_tan",
    "id": 3987404,
    "kind": "thm",
    "type": 279800089,
    "value": 279808282,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.T.complex_section_finite_combination",
    "id": 9615658,
    "kind": "thm",
    "type": 769100270,
    "value": 769111315,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.CompanionTheory.VanDescent.vanish_descent",
    "id": 9615598,
    "kind": "thm",
    "type": 769100270,
    "value": 769111314,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.CompanionTheory.Ar.ClosedPt.exists_residue_eval",
    "id": 9615438,
    "kind": "thm",
    "type": 769089428,
    "value": 769095537,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.CompanionTheory.Arith.DedekindDescent.linIndep_descent",
    "id": 9615504,
    "kind": "thm",
    "type": 769096953,
    "value": 769099883,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "Formalism.MainNotions.LinkG_at",
    "id": 869799,
    "kind": "def",
    "type": 27224548,
    "value": 27224774,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "Formalism.MainNotions.LinkG",
    "id": 869816,
    "kind": "def",
    "type": 17831024,
    "value": 27224802,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "Formalism.L2.GlobalTheoryTheory.Loss.loss_bound_at",
    "id": 1076940,
    "kind": "thm",
    "type": 41251314,
    "value": 41255196,
    "origin": "authenticated_manifest_RUN12"
  },
  {
    "name": "GlobalTheory.divTied3_read",
    "id": 6078879,
    "kind": "thm",
    "type": 458452916,
    "value": 458455888,
    "origin": "authenticated_manifest_RUN11"
  },
  {
    "name": "GlobalTheory.T.divisionCompatible_at_readIdentifications",
    "id": 6078946,
    "kind": "thm",
    "type": 458452916,
    "value": 458455889,
    "origin": "authenticated_manifest_RUN11"
  },
  {
    "name": "Deduction.poleData_abstract",
    "id": 868460,
    "kind": "thm",
    "type": 27052341,
    "value": 27058371,
    "origin": "authenticated_manifest_RUN11"
  },
  {
    "name": "Deduction.landau_cauchy",
    "id": 869149,
    "kind": "thm",
    "type": 27162294,
    "value": 27163272,
    "origin": "authenticated_manifest_RUN11"
  },
  {
    "name": "Deduction.landau_pole_asym",
    "id": 869232,
    "kind": "thm",
    "type": 27164513,
    "value": 27168267,
    "origin": "authenticated_manifest_RUN11"
  },
  {
    "name": "PositivityTheory.Xj7N.norm_small_le",
    "id": 9616555,
    "kind": "thm",
    "type": 769193561,
    "value": 769198767,
    "origin": "authenticated_manifest_RUN11"
  },
  {
    "name": "PositivityTheory.Xj7N.local_unit_map_surjective",
    "id": 9613757,
    "kind": "thm",
    "type": 769150835,
    "value": 769154759,
    "origin": "authenticated_manifest_RUN11"
  },
  {
    "name": "ModelDimension.cusp_form_extension_vanishing",
    "id": 9616232,
    "kind": "thm",
    "type": 769162544,
    "value": 769164447,
    "origin": "authenticated_manifest_RUN11"
  },
  {
    "name": "PositivityTheory.RgGu.NR.signature",
    "kind": "thm",
    "origin": "integration_RUN11_source_candidate",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "blob": "dc54f7d3f4921d7add75e4938a994af9900d19b1",
      "header": "theorem signature : Signature"
    }
  },
  {
    "name": "PositivityTheory.RgGu.NR.BoundB.bound_main",
    "kind": "thm",
    "origin": "integration_RUN11_source_candidate",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "blob": "35e0cd0ce0af5c0c7abb7be0351d14743a2f5321",
      "header": "theorem bound_main : Bound k"
    }
  },
  {
    "name": "PositivityTheory.RgGu.NR.boundB",
    "kind": "thm",
    "origin": "integration_RUN11_source_candidate",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "blob": "35e0cd0ce0af5c0c7abb7be0351d14743a2f5321",
      "header": "theorem boundB"
    }
  },
  {
    "name": "PositivityTheory.RgGu.NR.Sig.lim_form",
    "kind": "thm",
    "origin": "integration_RUN11_source_candidate",
    "source": {
      "repository": "leanprover-community/riemann-hypothesis",
      "rev": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "blob": "dc54f7d3f4921d7add75e4938a994af9900d19b1",
      "header": "theorem lim_form"
    }
  },
  {
    "name": "Deduction.CharacterBalanceMoves.one_char",
    "kind": "thm",
    "origin": "audit_RUN11_exact_name_request"
  },
  {
    "name": "Deduction.ch_core",
    "kind": "thm",
    "origin": "audit_RUN11_exact_name_request"
  }
];
function collectBatch(requests,ctx,project,select){
 const {decls,nameOf,read,n,challenge}=ctx;
 const ck=(p,m)=>{if(!p)throw Error(m)}, key=JSON.stringify, known=new Set(),names=new Set();
 for(const r of requests){ck(typeof r.name==="string"&&r.name.length>0&&!names.has(r.name),"duplicate request name");names.add(r.name);if(r.id!==undefined){ck(Number.isSafeInteger(r.id)&&r.id>=0&&!known.has(r.id),"duplicate/bad request ID");known.add(r.id)}}
 const lookup=select(decls,nameOf,requests.map(r=>r.name)),reports=[];
 for(const r of requests){
  const f=lookup.get(r.name);
  if(!f){ck(challenge||r.id===undefined,"required solution declaration absent "+r.name);reports.push({request:r,status:"NOT_EXPORTED_BY_EXACT_NAME"});continue}
  const {id,v}=f;
  ck(key(nameOf(id))===key(r.name.split(".")),"tagged name mismatch");
  ck(v.kind===r.kind,"kind mismatch "+r.name);
  if(!challenge&&r.id!==undefined)ck(id===r.id,"manifest ID mismatch "+r.name);
  ck(Array.isArray(v.edges)&&v.edges.length>0&&Number.isSafeInteger(v.edges[0])&&v.edges[0]>0&&v.edges[0]<=n,"type seed");
  const isValue=["def","thm","opaque"].includes(v.kind);
  ck(isValue?v.edges.length===2&&v.edges[1]>0&&v.edges[1]<=n:v.kind==="ctor"&&v.edges.slice(1).every(e=>Number.isSafeInteger(e)&&e<0),"declaration shape "+r.name);
  if(!challenge&&r.type!==undefined)ck(r.type===v.edges[0]&&r.value===v.edges[1],"one-based root mismatch "+r.name);
  const type=project(v.edges[0]-1,read,decls,nameOf,n);
  const value=isValue?project(v.edges[1]-1,read,decls,nameOf,n):null;
  const structural=isValue?[]:v.edges.slice(1).map((e,i)=>{const target=-e-1;ck(decls.has(target),"missing structural declaration");return {edgeIndex:i+1,encoded:e,target,nameParts:nameOf(target),kind:decls.get(target).kind}});
  ck(Array.isArray(v.mutualBlock),"missing mutual metadata");
  const mutualBlock=v.mutualBlock.map(id=>{const parts=nameOf(id);ck(Array.isArray(parts),"missing mutual name");return {id,nameParts:parts,exported:decls.has(id)}});
  reports.push({request:r,status:"EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",id,kind:v.kind,encodedRootsAndStructuralEdges:[...v.edges],type,value,structural,mutualBlock});
 }
 return reports;
}
function newWrite({out,file,digest,bytes,meta,n,root,decls,nameOf,read,challenge}){
 need(digest===(challenge?CH:SOL)&&bytes===(challenge?350862311:61570595788)&&n===(challenge?6112241:1065214335)&&decls.size===(challenge?53722:1484733)&&root===(challenge?326835:14065054),"archive identity");
 need(key(nameOf(root))===key(["riemannHypothesis"]),"root tagged identity");
 const start=Date.now(),reports=collectBatch(requests,{decls,nameOf,read,n,challenge},project,select);
 const summary={requests:reports.length,found:reports.filter(r=>r.id!==undefined).length,typeEdges:reports.reduce((s,r)=>s+(r.type?.references.length||0),0),valueEdges:reports.reduce((s,r)=>s+(r.value?.references.length||0),0),structuralEdges:reports.reduce((s,r)=>s+(r.structural?.length||0),0),expressionReads:reports.reduce((s,r)=>s+(r.type?.expressionsRead||0)+(r.value?.expressionsRead||0),0)};
 const result={status:"AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK",pin:PIN,file,digest,bytes,meta,n,root,indexedDeclarations:decls.size,projectionMs:Date.now()-start,maxRssKiB:process.resourceUsage().maxRSS,summary,reports};
 fs.writeFileSync(path.join(out,challenge?"challenge_frontier_roles.json":"solution_frontier_roles.json"),JSON.stringify(result,null,2)+"\n");
 console.log(JSON.stringify({file,projectionMs:result.projectionMs,summary,unresolved:reports.filter(r=>r.id===undefined).map(r=>r.request.name)}));
}
function splice(base,requests,here){
 const marker="const here=path.dirname(fileURLToPath(import.meta.url));",a=base.indexOf("export function writeProjection("),b=base.indexOf(marker,a);
 if(a<0||b<a||base.indexOf("export function writeProjection(",a+1)>=0)throw Error("projection splice anchor");
 return base.slice(0,a)+"const requests="+JSON.stringify(requests)+";\n"+collectBatch.toString()+"\nexport "+newWrite.toString().replace("function newWrite(","function writeProjection(")+"\nconst here="+JSON.stringify(here)+";"+base.slice(b+marker.length);
}
function testBatch(raw,base,s,l,m,collectBatch,splice,requests){
 const core=new Function(base.slice(base.indexOf("const PIN="),base.indexOf("\nimport fs from"))+"\nreturn {project,select,rewriteForProjection,pack};")();
 const patched=core.rewriteForProjection(s,l,m,"file:///fixture.mjs");
 const parser=new Function(patched.slice(0,patched.indexOf("\nimport fs from"))+"\nreturn {exprEdges,addDeclarations,packTagged};")();
 let checks=0,negative=0;const ck=(x,msg)=>{if(!x)throw Error(msg);checks++},reject=(f)=>{let bad=false;try{f()}catch{bad=true}ck(bad,"negative control");negative++};
 const rows=raw.trimEnd().split("\n").map(JSON.parse),names=[[]],expr=[],packed=[],decls=new Map();
 for(const r of rows)if("in"in r){const a=r.str||r.num;ck(r.in===names.length,"name order");names.push([...names[a.pre],r.str?a.str:a.i])}
 const nameOf=i=>names[i],find=s=>names.findIndex(a=>JSON.stringify(a)===JSON.stringify(s.split(".")));
 for(const r of rows){
  if("meta"in r||"in"in r||"il"in r)continue;
  if("ie"in r){ck(r.ie===expr.length,"expr order");expr.push(r);packed.push(parser.packTagged(parser.exprEdges(r,find),r));continue}
  const k=Object.keys(r)[0],v=r[k],norm=k==="inductive"?[{inductive:{types:v.types??v.inductiveVals,ctors:v.ctors??v.constructorVals,recs:v.recs??v.recursorVals}}]:(Array.isArray(v)?v:[v]).map(x=>({[k]:x}));
  for(const q of norm)parser.addDeclarations(q,(id,kind,edges,mutualBlock=[])=>decls.set(id,{kind,edges,mutualBlock}));
 }
 const wanted=[...decls].filter(([id,v])=>["thm","def","opaque","ctor"].includes(v.kind)&&names[id].every(x=>typeof x==="string"&&!x.includes("."))).map(([id,v])=>({id,name:names[id].join("."),kind:v.kind,...(v.kind==="ctor"?{}:{type:v.edges[0],value:v.edges[1]})}));
 const ctx={decls,nameOf,read:i=>packed[i],n:expr.length,challenge:false};
 const reports=collectBatch(wanted,ctx,core.project,core.select);
 function oracle(seed){
  const seen=new Set(),stack=[seed],refs=new Map();while(stack.length){const i=stack.pop();if(seen.has(i))continue;seen.add(i);const r=expr[i];let children=[],targets=[];
   if(r.const)targets.push(["explicit_const",r.const.name]);
   else if(r.app)children=[r.app.fn,r.app.arg];
   else if(r.lam||r.forallE){const a=r.lam||r.forallE;children=[a.type,a.body]}
   else if(r.letE)children=[r.letE.type,r.letE.value,r.letE.body];
   else if(r.proj){children=[r.proj.struct];targets.push(["projection_carrier",r.proj.typeName])}
   else if(r.mdata)children=[r.mdata.expr];
   else if("natVal"in r)targets.push(["literal_primitive",find("Nat")]);
   else if("strVal"in r)targets.push(["literal_primitive",find("Char.ofNat")],["literal_primitive",find("String.ofList")]);
   for(const [k,id] of targets){const key=k+":"+id;if(!refs.has(key))refs.set(key,new Set());refs.get(key).add(i)}stack.push(...children);
  }return {seen,refs};
 }
 let roleCount=0,refCount=0,ctors=0;
 for(const r of reports){const d=decls.get(r.id);ck(JSON.stringify(r.encodedRootsAndStructuralEdges)===JSON.stringify(d.edges),"raw roots");ck(JSON.stringify(r.mutualBlock.map(v=>v.id))===JSON.stringify(d.mutualBlock),"mutual metadata");
  if(r.kind==="ctor"){ctors++;ck(r.value===null,"constructor not proof");ck(JSON.stringify(r.structural.map(e=>e.encoded))===JSON.stringify(d.edges.slice(1)),"constructor structural edges")}
  for(const [p,seed] of [[r.type,d.edges[0]-1],...(r.value?[[r.value,d.edges[1]-1]]:[])]){roleCount++;const a=oracle(seed);ck(p.expressionRoot===seed&&p.expressionsRead===a.seen.size&&p.references.length===a.refs.size,"role closure");for(const e of p.references){refCount++;const q=a.refs.get(e.kind+":"+e.target);ck(q?.has(e.witnessExpression)&&q.size===e.distinctExpressionRecords,"exact witness/count");ck(JSON.stringify(e.nameParts)===JSON.stringify(nameOf(e.target)),"tagged target")}}
 }
 ck(ctors>0,"actual constructor fixture");
 const first=wanted.find(x=>x.value!==undefined);ck(!!first,"value fixture");
 reject(()=>collectBatch([first,first],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,id:first.id+1}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,value:first.value+1}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,kind:"ctor"}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,name:"ABSENT"}],ctx,core.project,core.select));
 ck(collectBatch([{name:"ABSENT",kind:"thm"}],ctx,core.project,core.select)[0].status==="NOT_EXPORTED_BY_EXACT_NAME","optional exact absent");
 ck(collectBatch([{...first,id:first.id+1,type:first.type+1}],{...ctx,challenge:true},core.project,core.select)[0].id===first.id,"challenge independent IDs");
 const generated=splice(base,requests,"/fixture/dep");
 ck(generated.includes("export function writeProjection(")&&generated.includes('const here="/fixture/dep";'),"driver splice");
 ck(requests.length===47&&requests.filter(r=>r.id!==undefined).length===41,"target census");
 return {checks,negative,expressions:expr.length,declarations:decls.size,targets:wanted.length,constructors:ctors,roles:roleCount,referenceWitnesses:refCount};
}
function readPeer(name,sha){const b=fs.readFileSync(path.join(here,name));if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob "+name);return b.toString("utf8")}
const base=readPeer("rh_targeted_role_witness.mjs","9a3e8b56a0df0b37cb693575742080284ebf302f");
const args=process.argv.slice(2);
if(args[0]==="test"){const raw=fs.readFileSync(args[1]);if(crypto.createHash("sha1").update("blob "+raw.length+"\0").update(raw).digest("hex")!=="d3cd35f1313b4e78b5fded9886e450112aa75def")throw Error("fixture hash");console.log(JSON.stringify(testBatch(raw.toString("utf8"),base,readPeer("rh_stream_export_closure.mjs","bffe89b20ff5e297d921443492e918933c8e0d92"),readPeer("rh_locality_frontier_retry.mjs","336ea4ba85ba9d81235313e44f3430c112c76c45"),readPeer("rh_mutual_metadata_closure.mjs","a6d43d873703f5e632df199ac6165ed13450c3bd"),collectBatch,splice,requests),null,2));}
else{if(!args.includes("--out"))throw Error("use --out DIR");const tmp=fs.mkdtempSync(path.join(os.tmpdir(),"rh-frontier-driver-"));try{const p=path.join(tmp,"driver.mjs");fs.writeFileSync(p,splice(base,requests,here));const c=spawnSync(process.execPath,[p,...args],{stdio:"inherit"});if(c.error)throw c.error;if(c.status!==0)throw Error("combined driver "+c.status+" "+c.signal)}finally{fs.rmSync(tmp,{recursive:true,force:true})}}
