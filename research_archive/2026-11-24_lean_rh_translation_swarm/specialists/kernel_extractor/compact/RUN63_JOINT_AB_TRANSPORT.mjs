#!/usr/bin/env node
/*
RUN63 — SAME A/B covolume witness, not another isolated A reduction.
27 Nov 2026. SOURCE-MATCHED / PREPARED; no native PASS.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs read: 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679; old pin separate.
Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity and RUN86–89 theta
and RUN87 acceleration. Reuse, do not recreate, theta RUN87's common-map
and rank transport and RUN88's name-literal repair; RUN89 isolates its leaf.

Actual new interface: RUN62 still leaves enough_forms original. That proof
uses columnCoords.nontrivial, finrank_rows_ne_zero, and
ramifiedColumns_fill_rows. The latter uses the original rank supplier
ramifyingOp_finrank_comap_and_short and fitting certificate.
Consequently the original B branch retains source-level paths to the
old chosen-level freeness proof, even if A's replacements all succeed.
The other path via filling_fits (type) -> filling (value) ->
classAut_columnLevel_eq_bot is already addressed locally by RUN86/87.
This run connects their prepared replacements to the actual B consumer
and then replaces BOTH A and B in the ORIGINAL covolume theorem at once.
Same D, q, S, Poincare maps, t, row/column spaces, n, delta, all-conjugate
Gram bound, all scale guards and quantitative premises. No new assumptions
or B4 estimates, no independent choice of maps or witness. Original type
and universe checks and ordinary Lean kernel insertion remain mandatory.
The actual original B proof's statement names projectedPoincare; retain
it, not a separately chosen map. Definitional equality of the common maps
and exact original statement is required before transport. Old paths via
filling.eq_1, finrank_rows_le_mass, FillingAdmissible, projectedPoincare,
seesaw, or other untouched nodes may survive. No global deletion.

Actual this-run checks on connector-returned pinned sources: 12 anchors
across five declarations and 12/12 deleted-anchor controls rejected.
Identified two more resolved forward references in actual RUN62 spec;
two malformed name-roster controls rejected on synthetic tail. Reuse
RUN88's repair for its own 39 names; fix ONLY these two RUN62 names in
the appended joint tail. Native Lean/lake unavailable locally.
RUN61 retry status and retry_summary both returned 404 at inspection;
old shared run 46023465491 remains ERROR, status blob
07a2b14930c38095e6771ae9ed1a10a3cf1bf678. No native rh_scan/prune/reduce/
auto/frontier executed this run; no new Lean or URT performance claim.
No new compute job, no Main import, no changes to protected workflows.
All original/reduced evidence and A/B/C/D/E/V obligations retained.

RESUME HERE: after the existing A1 RUN61 and A2 RUN89 leaf checks accept,
generate the repaired RUN88 source and authenticated RUN62 source using
the original pinned workspace; use this generator to join both into one
module, then compile with the checked A1 object on LEAN_PATH. Require
exit 0, all prior markers, RUN63_B_CHECKED and RUN63_JOINT_AB_CHECKED,
exact theorem type/universe and standard-axiom guards. On failure repair
the first actual diagnostic. Then use the existing RUN26 strict exporter
with 4.35 adapter to inspect original/new enough_forms and covolume roots;
check both replacement supplier paths and report surviving old leaves.
No separate cold build. HANDOFF TO theta, integration, acceleration, audit.
Star/RH OPEN.
*/
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';
const PIN="72fead102f663d5c7a407964a13dc0cf9d977207", MATHLIB="56a005855ea17e0b0958f73ec801ae140b0a1679";
const sources=[
  [
    "New/Endgame/ShortAndEnough.lean",
    "b99eea0689be372d84362c58272b705e104b6a3a",
    "Data.enough_forms",
    [
      "columnCoords",
      "finrank_rows_ne_zero",
      "ramifiedColumns_fill_rows",
      "projectedPoincare"
    ]
  ],
  [
    "New/Endgame/LongForms.lean",
    "9eff36cf003ac398fbd24361e80e95a03d0b0e05",
    "Data.exists_family_covolumeSq_le",
    [
      "short_forms",
      "enough_forms"
    ]
  ],
  [
    "New/Filling/FillingTheorem.lean",
    "801448ae9b895babd0d69dc4f7967d86eb006e76",
    "Data.ramifiedColumns_fill_rows",
    [
      "ramifyingOp_finrank_comap_and_short",
      "filling_fits",
      "finrank_rows_le_mass"
    ]
  ],
  [
    "New/Seesaw/BesselGeneric.lean",
    "a7c7ef1df4208394af100088f6e142c6acbceac8",
    "Data.filling_fits",
    [
      "filling"
    ]
  ],
  [
    "New/Filling/FillingData.lean",
    "0ef8b0dfe13173b16bd0a8820a4924f10124e278",
    "Data.filling",
    [
      "classAut_columnLevel_eq_bot",
      "exists_besselSystem"
    ]
  ]
];
const mark="-- RUN62 joint A1/A2 tail: normal checked insertion.";
function req(ok,msg){if(!ok)throw Error(msg)}
function decl(s,n){const marker=new RegExp("^(?:noncomputable def|lemma|theorem) "+n.replaceAll(".","\\.")+"(?=\\s|:)", "gm");const hits=[...s.matchAll(marker)];req(hits.length===1,"declaration boundary "+n);const rest=s.slice(hits[0].index);const end=rest.slice(1).search(/\n(?:\/--|lemma |theorem |noncomputable def |def |variable |include |omit |end\b)/);return end<0?rest:rest.slice(0,end+1)}
function pattern(n){return new RegExp("(^|[^A-Za-z0-9_])"+n+"(?![A-Za-z0-9_])","gm")}
function edgeChecks(body,edges){for(const n of edges)req(pattern(n).test(body),"missing source edge "+n)}
function fixJointTail(t){
 const re=new RegExp("(?<!"+String.fromCharCode(96)+")"+String.fromCharCode(96).repeat(2)+"(Data\\.(?:exists_indexDvd_Bmu_divisible|short_forms)_run62)\\b","g");
 const names=[...t.matchAll(re)].map(m=>m[1]);req(JSON.stringify(names)===JSON.stringify(["Data.exists_indexDvd_Bmu_divisible_run62","Data.short_forms_run62"]),"joint forward-name roster");
 const fixed=t.replace(re,(_,n)=>String.fromCharCode(96)+n);req(!re.test(fixed)&&t.length-fixed.length===2,"forward-name repair");return fixed;
}
const blob=s=>crypto.createHash('sha1').update('blob '+Buffer.byteLength(s)+'\0').update(s).digest('hex');
const read=p=>fs.readFileSync(p,'utf8'), json=p=>JSON.parse(read(p));
const [root,run88,run62,out]=process.argv.slice(2).map(p=>path.resolve(p));
req(process.argv.length===6,'usage: node RUN63...mjs UPSTREAM_ROOT RUN88_FILE RUN62_FILE OUT');
req(execFileSync('git',['-C',root,'rev-parse','HEAD'],{encoding:'utf8'}).trim()===PIN,'wrong upstream pin');
req(execFileSync('git',['-C',path.join(root,'grh-compact/.lake/packages/mathlib'),'rev-parse','HEAD'],{encoding:'utf8'}).trim()===MATHLIB,'wrong mathlib pin');
execFileSync('git',['-C',root,'diff','--exit-code',PIN,'--','grh-compact/src','grh-compact/lakefile.toml']);
req(out!==root&&!out.startsWith(root+path.sep)&&!fs.existsSync(out),'fresh external output required');
let anchors=0,negative=0;
for(const [file,sha,name,edges] of sources){
 const s=read(path.join(root,'grh-compact/src',file));req(blob(s)===sha,'source differs '+file);
 const t=decl(s,name);edgeChecks(t,edges);
 for(const n of edges){anchors++;try{edgeChecks(t.replace(pattern(n),'$1REMOVED63'),edges)}catch(e){negative++}}
}
req(anchors===12&&negative===12,'source controls');
const a=read(run88), b=read(run62);
const ar=json(path.join(path.dirname(run88),'run88_receipt.json'));
const br=json(path.join(path.dirname(run62),'source_manifest.json'));
req(ar.pin===PIN&&ar.generated_blob===blob(a)&&ar.changed_names.length===39&&ar.negative_controls_rejected===4,'RUN88 source/receipt mismatch');
req(br.pin===PIN&&br.mathlib===MATHLIB&&br.generated_blob===blob(b)&&br.anchors===9&&br.negative===9&&br.a1_source_blob==='0b809db534349fdf6b5d179365a6045f28d7dc7c','RUN62 source/receipt mismatch');
req(b.split(mark).length===2&&a.split('import New.Endgame.LongForms\n').length===2&&a.includes('private def theta87Transport')&&a.includes('private def theta84Transport')&&!a.includes(mark),'unexpected source boundary');
const raw=mark+b.split(mark)[1], fixed=fixJointTail(raw);
const generated=a.replace('import New.Endgame.LongForms\n','import New.Endgame.LongForms\nimport MarkedTransportRun57\n')+'\n'+fixed+"\n-- RUN63: propagate the already prepared A2 common-map/rank proof into B,\n-- then combine it with the already prepared joint A1/A2 Theorem A.\nrun_cmd do\n  theta87Transport ``Data.enough_forms `Data.enough_forms_run63\n    #[( ``Data.columnCoords, ``Data.columnCoords_run87),\n      (``Data.finrank_rows_ne_zero, ``Data.finrank_rows_ne_zero_run87),\n      (``Data.ramifiedColumns_fill_rows, ``Data.ramifiedColumns_fill_rows_run87)]\n    #[``Data.columnCoords, ``Data.finrank_rows_ne_zero, ``Data.ramifiedColumns_fill_rows]\n  Lean.logInfo \"RUN63_B_CHECKED\"\n\nrun_cmd do\n  theta84Transport ``Data.exists_family_covolumeSq_le `Data.exists_family_covolumeSq_le_run63\n    #[(``Data.short_forms, ``Data.short_forms_run62),\n      (``Data.enough_forms, ``Data.enough_forms_run63)]\n  Lean.logInfo \"RUN63_JOINT_AB_CHECKED\"\n\n#print axioms Data.enough_forms_run63\n#print axioms Data.exists_family_covolumeSq_le_run63\n";
req(!/^import (?:Main|New\.Main)\b/m.test(generated),'forbidden root import');
fs.mkdirSync(out,{recursive:true});
fs.writeFileSync(path.join(out,'JointABRun63.lean'),generated,{flag:'wx'});
fs.writeFileSync(path.join(out,'source_manifest.json'),JSON.stringify({pin:PIN,mathlib:MATHLIB,anchors,negative,run88_blob:blob(a),run62_blob:blob(b),a1_object_sha256:br.a1_object_sha256,a1_object_directory:br.a1_object_directory,generated_blob:blob(generated),forward_name_repairs:2,native_verified:false,full_RH_replay:false,global_dependency_deletion:false},null,2),{flag:'wx'});
console.log('RUN63 generated; source checks only. Native execution still required.');
