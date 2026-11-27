#!/usr/bin/env node
/*
RUN62 — joint marked-index A1 + gauge A2 transport at the SAME Theorem A.
27 Nov 2026. Source-matched PREPARED only, not native replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger read at blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87c621d0d18103ec2eb9be14bf774b8bff2a747d, 2c9e5148a947ff4b28482afd18c4d7c810af97d5.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
Reviewed AGENTS, SWARM, HANDOFF, EXPANSION, latest A1 RUN78 and A2
RUN82 and, crucially, theta RUN85_A2_THEOREM_A_TRANSPORT.mjs / RUN84.
RUN85 already transports A2 to short_forms and exists_family_covolumeSq_le.
Do NOT create another independent A-only transport or repeat that proof.
Its index transport replaces four gauge suppliers but not the marked index
supplier. RUN57's index transport replaces that marked index supplier
but not the four gauge suppliers. Using either alone does not integrate both.

Exact source-matched five-edge fusion: form the proof of
Data.exists_indexDvd_Bmu_divisible from its ORIGINAL proof expression
by simultaneously replacing the marked index supplier with the A1
replacement and the four gauge suppliers with the A2 replacements.
These are five distinct constant names, all present in the original
source caller. For a fixed proof expression P and disjoint name maps
s,t whose ranges do not intersect the domains, substitution commutes:
  P[s][t] = P[s union t] = P[t][s].
Proof by structural induction on Expr, with the constant case using
the disjointness and range condition; universe arguments unchanged.
This is exact syntactic substitution, NOT a claim that separate whole
proofs imply their composition without typechecking. Both original
supplier types and original caller type must be checked in one
environment. Then replace ALL three suppliers at short_forms in one
original proof (span, archimedean size, joint index), then replace
short_forms at exists_family_covolumeSq_le. Keep enough_forms unchanged.
Same D, rational q, B, S, y, t, delta, twist family, all quantifiers,
gauge/index bounds, C and remainder inputs. No new premises; no
quantitative strengthening or propagation into independent gauge
branches. A1 RUN78 stronger bound not used here; retained separately.

This extends the existing theta84Transport helper inside the generated
RUN85 source rather than copying a new transport engine. Import the
checked A1 object from RUN58 only; do not re-elaborate A1. Require its
actual RUN61 retry/graph receipts, exact generated source blob, object
SHA256 and standard axioms. The A2 source can be generated in the same
original LongForms workspace; its existing checks execute before the
joint tail. No new registry job or cold build. Do not use an A2-mutated
source tree. Do not import Main/New.Main. Original proof bodies and
all prior evidence retained.

Actual current-run checks: retrieved original three files at compact
pin via GitHub connector and verified nine source supplier anchors
(5+3+1), all 9 damaged-edge controls rejected; enough_forms present.
Source/static checks only. Local command -v lean/lake returned no
binaries; no native rh_scan/prune/reduce/auto/frontier run. Earlier
A1 retry status.json and outputs/retry_summary.json returned 404.
C1 run 46055305146 job 140698522135 was in progress, not A1 evidence.
RUN61 already registered corrected A1 replay. No duplicate job.
The new generator itself is PREPARED; no compiled joint theorem or
full graph yet. B2/C2 local receipts do not certify this branch.

RESUME HERE: after the existing RUN61 A1 retry is accepted, reuse its
checked MarkedTransportRun57 object and execute this generator in the
same authenticated original LongForms workspace as theta RUN85
(see command at bottom); check all prior and three joint native
markers, exact theorem types/universes and standard axiom audit, then
export strict constructor-inclusive old/new graph at the three
joint roots. Record any surviving old supplier paths; no global deletion.
If a prerequisite replay fails, repair its first actual diagnostic
instead. HANDOFF TO theta, acceleration, integration, audit.
All A/B/C/D/E/V root obligations and star/RH remain OPEN.
*/
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';

const pin="72fead102f663d5c7a407964a13dc0cf9d977207";
const mathlib="56a005855ea17e0b0958f73ec801ae140b0a1679";
const repair="0b809db534349fdf6b5d179365a6045f28d7dc7c";
const paths=["New/Columns/LocalStatement.lean","New/Endgame/ShortAndEnough.lean","New/Endgame/LongForms.lean"];
const hashes=["9d5bd0d698b0db2850cbd306d8d400d7e99a3547","b99eea0689be372d84362c58272b705e104b6a3a","9eff36cf003ac398fbd24361e80e95a03d0b0e05"];
const spec=[
 ["Data.exists_indexDvd_Bmu_divisible",0,[
  ["Data.IsMarked.hasType_prod_markOperator_pow","Data.IsMarked.hasType_prod_markOperator_pow_run57"],
  ["Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked","Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked_run85"],
  ["Data.IsGoodDatum.gaugeLe_pow_jetCeil_smul","Data.IsGoodDatum.gaugeLe_pow_jetCeil_smul_run85"],
  ["Data.IsGoodDatum.gaugeLe_collisionSum","Data.IsGoodDatum.gaugeLe_collisionSum_run85"],
  ["Data.IsGoodDatum.gaugeLe_one","Data.IsGoodDatum.gaugeLe_one_run85"]]],
 ["Data.short_forms",1,[
  ["Data.span_short_ramifiedColumns","Data.span_short_ramifiedColumns_run84"],
  ["Data.weylNormSq_Bmu_le","Data.weylNormSq_Bmu_le_run85"],
  ["Data.exists_indexDvd_Bmu_divisible","Data.exists_indexDvd_Bmu_divisible_run62"]]],
 ["Data.exists_family_covolumeSq_le",2,[
  ["Data.short_forms","Data.short_forms_run62"]]]
];
function requireCheck(ok,msg){if(!ok)throw Error(msg)}
const read=p=>fs.readFileSync(p,'utf8');
const json=p=>JSON.parse(read(p));
const blob=s=>crypto.createHash("sha1").update("blob "+Buffer.byteLength(s)+"\0").update(s).digest("hex");
const sha256=p=>crypto.createHash("sha256").update(fs.readFileSync(p)).digest("hex");
const last=n=>n.split(".").at(-1);
function declaration(s,n){
 const marker="lemma "+n,i=s.indexOf(marker);
 requireCheck(i>=0&&s.indexOf(marker,i+1)<0,"missing/ambiguous "+n);
 const t=s.slice(i),b=t.slice(1).search(/\n(?:\/--|lemma |theorem |variable |include |omit |seal |noncomputable def |def |end\b)/);
 return b<0?t:t.slice(0,b+1);
}
function edge(n){return new RegExp("(^|[^A-Za-z0-9_])"+last(n)+"(?![A-Za-z0-9_])","gm")}
function check(t,ds){for(const [n] of ds)requireCheck(edge(n).test(t),"missing edge "+n)}
requireCheck(process.argv.length===6,"usage: node RUN62...mjs UPSTREAM_ROOT RUN61_OUTPUT RUN85_FILE OUT");
const [root,a1,inputFile,out]=process.argv.slice(2).map(p=>path.resolve(p));
requireCheck(execFileSync("git",["-C",root,"rev-parse","HEAD"],{encoding:"utf8"}).trim()===pin,"wrong compact source");
requireCheck(execFileSync("git",["-C",path.join(root,"grh-compact/.lake/packages/mathlib"),"rev-parse","HEAD"],{encoding:"utf8"}).trim()===mathlib,"wrong mathlib");
execFileSync("git",["-C",root,"diff","--exit-code",pin,"--","grh-compact/src","grh-compact/lakefile.toml"]);
requireCheck(out!==root&&!out.startsWith(root+path.sep),"external output required");
const sources=paths.map((p,i)=>{
 const s=read(path.join(root,"grh-compact/src",p));
 requireCheck(blob(s)===hashes[i],"changed source "+p);return s;
});
let anchors=0,negative=0;
for(const [n,i,ds] of spec){
 const t=declaration(sources[i],n);check(t,ds);
 const old=ds.map(s=>s[0]),fresh=ds.map(s=>s[1]);
 requireCheck(new Set(old).size===old.length&&new Set(fresh).size===fresh.length&&fresh.every(n=>!old.includes(n)),"non-disjoint substitutions");
 for(const [d] of ds){anchors++;try{check(t.replace(edge(d),"$1REMOVED62"),ds)}catch(e){negative++}}
}
requireCheck(anchors===9&&negative===9,"source controls failed");
requireCheck(edge("enough_forms").test(declaration(sources[2],spec[2][0])),"B branch absent");

const receipt=json(path.join(a1,"a1_transport.json"));
const retry=json(path.join(a1,"retry_summary.json"));
const graph=json(path.join(a1,"a1_graph/a1_graph_result.json"));
const names=["Columns.hasType_markOperator_run55","Data.IsMarked.hasType_markOperator_run57",
 "Data.IsMarked.hasType_prod_markOperator_pow_run57","Data.exists_indexDvd_Bmu_divisible_run57"];
const allowed=new Set(["propext","Classical.choice","Quot.sound"]);
requireCheck(retry.native_verified===true&&retry.graph_and_prune_complete===true&&
 receipt.native_verified===true&&receipt.steps.transport.returncode===0&&receipt.leaf_marker===true&&
 JSON.stringify(receipt.transport_markers)===JSON.stringify(names.slice(1))&&
 receipt.generated_blob===repair&&blob(read(path.join(a1,"MarkedTransportRun57.lean")))===repair,
 "A1 retry not accepted");
requireCheck(receipt.axiom_audit.axiom_audit_ok===true&&
 Object.keys(receipt.axiom_audit.axioms).length===names.length&&
 names.every(n=>Array.isArray(receipt.axiom_audit.axioms[n])&&receipt.axiom_audit.axioms[n].every(a=>allowed.has(a))),
 "A1 axiom roster differs");
requireCheck(graph.compact===pin&&graph.mathlib===mathlib&&graph.graph_audited===true&&
 graph.new_paths_present===true&&graph.prune_result.returncode===0&&graph.object_compile.returncode===0,
 "A1 graph/scan incomplete");
const a1Object=path.join(a1,"a1_graph/MarkedTransportRun57.olean");
const artifact=graph.objects.find(x=>x.name==="MarkedTransportRun57.olean");
requireCheck(artifact&&sha256(a1Object)===artifact.sha256,"A1 object mismatch");
const input=read(inputFile),prior=json(path.join(path.dirname(inputFile),"source_manifest.json"));
requireCheck(prior.pin===pin&&prior.generated_blob===blob(input)&&prior.edges===14&&prior.negative===14,
 "RUN85 source/manifest mismatch");
requireCheck(input.split("import New.Endgame.LongForms\n").length===2&&
 input.includes("private def theta84Transport")&&input.includes("THETA84_LEAF_CHECKED")&&
 !/^import MarkedTransportRun57\b/m.test(input),"unexpected RUN85 input");

const tick=String.fromCharCode(96),q=n=>tick+tick+n, fresh=n=>tick+n;
let tail="\n\n-- RUN62 joint A1/A2 tail: normal checked insertion.\nrun_cmd do\n";
for(const [n,,ds] of spec){
 const subs=ds.map(([a,b])=>"("+q(a)+", "+q(b)+")").join(", ");
 tail+="  theta84Transport "+q(n)+" "+fresh(n+"_run62")+"\n    #["+subs+"]\n";
}
for(const [n] of spec)tail+="\n#print axioms "+n+"_run62\n";
const generated=input.replace("import New.Endgame.LongForms\n","import New.Endgame.LongForms\nimport MarkedTransportRun57\n")+tail;
requireCheck(!/^import (?:Main|New\.Main)\b/m.test(generated),"forbidden root import");
fs.mkdirSync(out,{recursive:true});
fs.writeFileSync(path.join(out,"JointTheoremARun62.lean"),generated,{flag:"wx"});
fs.writeFileSync(path.join(out,"source_manifest.json"),JSON.stringify({
 pin,mathlib,paths,hashes,spec,anchors,negative,prior_run85_blob:blob(input),
 a1_source_blob:repair,a1_object_sha256:artifact.sha256,a1_object_directory:path.dirname(a1Object),
 generated_blob:blob(generated),native_verified:false,full_RH_replay:false,global_dependency_deletion:false
},null,2),{flag:"wx"});
console.log("RUN62 generated; source checks only. Native execution still required.");
/*
From original grh-compact, after accepted RUN61 and generated RUN85:
  node /path/RUN62_A1_A2_JOINT_THEOREM_A.mjs /upstream /retry/outputs /theta85-out/ThetaTransportRun85.lean /joint-out
  lake env bash -c 'export LEAN_PATH="/retry/outputs/a1_graph:$LEAN_PATH"; lean --tstack=400000 /joint-out/JointTheoremARun62.lean' > /joint-out/native.log 2>&1
Use actual environment/object paths, preserve exit code, all previous
THETA84_CHECKED markers and the three joint _run62 markers. No PASS
until native receipt, #print axioms, and original type and edge checks.
*/
