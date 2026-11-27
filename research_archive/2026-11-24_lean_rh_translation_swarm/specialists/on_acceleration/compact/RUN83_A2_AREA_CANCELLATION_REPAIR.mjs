/* RUN83 — 27 November 2026. Actual A2 native failure diagnosed, source repair PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin historical only.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
87e949a9ea899dd09d297aa30f59df4d1b533fc4 / 261b9e8bf027af37e6abe6920deb544b23352d48.
Reviewed latest A2 peer freeness and B2/C2 verified local graphs; protocol, handoff,
expansion, AGENTS and RUN78/79/81/82. No RH root import or URT speed claim.

ACTUAL NATIVE RECEIPT (not PASS):
https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/46023465491
compute/rh-compact-a1-a2-transport-20261127 on cathedral-research-state:
status.json 07a2b14930c38095e6771ae9ed1a10a3cf1bf678, overall error, 3376.82 s.
outputs/targeted_results.json 01b71a484e2e8c0236ff7d429d4809a5e687fb7d:
original LocalStatement build exit 0, 3199.21 s; module_0 overall exit 1.
outputs/a2_replay.json 566a91c8625dd1f17e13f7722b9286c0bd1b3402:
original direct probe exit 0 (6.63 s); splice exit 0; rebuild exit 1 (39.38 s).
Driver reached splice, so original direct probe passed its completeness guard;
original detailed axiom/type graph not independently read here, retained in artifact
15213743994 (a2_original_graph.json and a2_original.log, both ~77 MB uncompressed).
No reduced direct graph or strict recursive audit reached.
outputs/a2_rebuild.log 68891bf526f3fc8449e755d78e6cf543ff478f78:
ONLY failing source target New.Curve.ConjugatesOfJets, line 60:5, exact unsolved goal
  ‖↑P.Ω₀‖ ^ 2 = ‖↑P.Ω₀‖ ^ 2 / (↑M * ↑M) * (↑M * ↑M) ∨ P.d = 0.
A2 shared-transfer extraction removed the old definitional choice M=p*(d*N1)^6+1.
It retained M != 0 but failed to explicitly transport that premise into the
real area calculation. This is not a missing number-theoretic estimate.
For x = ‖Ω₀‖², a = (M:ℝ), hM0 implies a != 0, hence
  (x / (a*a)) * (a*a) = x.
Select the LEFT disjunct of the actual goal; no premise on d and no division
by zero. Exact original hypotheses and statement retained, no norm bound
weakened, no new theorem/axiom. The Lean repair below uses exact_mod_cast
and div_mul_cancel₀; it is NOT yet compiled.
A1 transport separately exit 1: IsOpen.matrix type mismatch, CommRing Nat,
markOperator ring mismatch and cascading missing declaration errors
(a1_transport.log ba683f34264daaa9c633314558cbee36916dba78).
Do not mark A1 successful; leave repairs to its owner.
Artifact 15213743994 is evidence, not an authenticated olean cache.

Tests EXECUTED on exact connector-returned stage1 jet/local and RUN81/RUN80 source:
unique replacement and byte-exact reversal; stage2 generation retains repaired
shared transfer and unchanged marked consumer; 4/4 negative source controls
rejected (wrong anchor, removed nonzero premise, duplicate anchor, already
patched input). These are source checks, not Lean execution.
RUN81's stock CLI rejects any changed stage1 bytes, so this adapter reuses
its authenticated stage2 transformation rather than undoing a repaired proof.
It retains the stage2 audit CLI and records corrected stage hashes. No duplicate
cold build registered; local Lean/lake absent. All A/B/C/D/E/V root gaps remain.

RESUME HERE: kernel/integration attach this adapter after RUN78 splice, before
the next shared RUN79 A2 rebuild (same authenticated workspace if available):
  node RUN83_A2_AREA_CANCELLATION_REPAIR.mjs <pinned-checkout-root> --apply
Then lake build +New.Columns.LocalStatement:olean from grh-compact; require
native direct guards, original types/universes/axioms, and RUN82 strict
stage1 graph before proceeding. Only after stage1 accepted, this adapter's
--stage2 --apply generates stage2 from exact corrected stage1, then replay/audit
RUN81 and RUN82 with separate logs and corrected hashes. Preserve original and
failed graphs; never mark global dependency deletion or RH closure from this.
HANDOFF TO kernel/integration/theta/audit.
*/
import fs from 'node:fs';
import path from 'node:path';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
import {fileURLToPath} from 'node:url';
const old = "    (by simp [QuadField.area_eq_of_eq_scaledIdeal latticeModule_cmCurve])";
const fix = "    (by\n      have hMreal : (M : ℝ) ≠ 0 := by exact_mod_cast hM0\n      simp [QuadField.area_eq_of_eq_scaledIdeal latticeModule_cmCurve] <;>\n        exact Or.inl (div_mul_cancel₀ _ (mul_ne_zero hMreal hMreal)).symm)";
const fail = (ok,m) => {if(!ok)throw Error(m)};
function once(s,a,b){fail(s.split(a).length===2,"nonunique anchor");return s.replace(a,b)}
function repair(s){
 fail(s.includes("(hM0 : M ≠ 0)")&&s.includes("lemma norm_jetSeries_le_from_square_frame_run78"),"missing premise or supplier");
 const t=once(s,old,fix);
 fail(once(t,fix,old)===s,"not reversible");
 return t;
}
const root=path.resolve(process.argv[2]||'.'), here=path.dirname(fileURLToPath(import.meta.url));
const blob=s=>createHash('sha1').update('blob '+Buffer.byteLength(s)+'\0').update(s).digest('hex');
const check=(s,h)=>{fail(blob(s)===h,"blob mismatch "+h);return s};
const j=path.join(root,'grh-compact/src/New/Curve/ConjugatesOfJets.lean');
const l=path.join(root,'grh-compact/src/New/Columns/LocalStatement.lean');
const n=path.join(root,'grh-compact/src/New/Curve/PUnitSquareFrameRun80.lean');
fail(execFileSync('git',['rev-parse','HEAD'],{cwd:root,encoding:'utf8'}).trim()==='72fead102f663d5c7a407964a13dc0cf9d977207',"wrong pin");
const source=fs.readFileSync(j,'utf8'), local=check(fs.readFileSync(l,'utf8'),'e029ebbb854d93cb4a55eb536a6dea9b8aeb89b3');
const stage2Mode=process.argv.includes('--stage2'), apply=process.argv.includes('--apply');
const baseline=check(stage2Mode?once(source,fix,old):source,'62f5b0ca5f833ec482739ed8bddf45fd725ae075');
const repaired=repair(baseline);
let rejected=0;
for(const bad of [baseline.replace(old,"    (by sorry)"),baseline.replace("(hM0 : M ≠ 0)","(hM0 : True)"),baseline+"\n"+old,repaired]){
 try{repair(bad)}catch(e){rejected++}
}
fail(rejected===4,"negative source control accepted");
fail(!fs.existsSync(n),"stage2 helper already exists");
const runner=check(fs.readFileSync(path.join(here,'RUN81_A2_GENERAL_CALLER_SPLICE.mjs'),'utf8'),'418b945e43806a7b147169d7534e621acc8bdc53');
const helper=check(fs.readFileSync(path.join(here,'RUN80_GENERAL_PUNIT_SQUARE_FRAME.lean'),'utf8'),'805aaaa8695448ae89c32b240501c1e5516d5de4');
const start=runner.indexOf("function stage2("),end=runner.indexOf("function audit(",start);
fail(start>=0&&end>start,"stage2 transform missing");
const stage2=Function("once",runner.slice(start,end)+";return stage2;")(once);
const s2=stage2(repaired,helper);
fail(s2.newJet.includes(fix)&&s2.newJet.includes("P.exists_punit_square_frame_run80 s (p := p)")&&local.includes("from norm_jetSeries_le_prime_to_level_run78"),"repair or consumer lost");
if(stage2Mode)fail(source===repaired,"not exact repaired stage1");
if(apply){
 if(stage2Mode)fs.writeFileSync(n,s2.newHelper,{flag:'wx'});
 fs.writeFileSync(j,stage2Mode?s2.newJet:repaired);
}
console.log(JSON.stringify({phase:stage2Mode?'stage2':'stage1',applied:apply,negative_controls_rejected:rejected,
 prior_failed_jet_blob:blob(baseline),stage1_jet_blob:blob(repaired),stage1_local_blob:blob(local),
 stage2_jet_blob:blob(s2.newJet),stage2_helper_blob:blob(s2.newHelper),local_unchanged:true,
 native_verified:false,full_RH_replay:false}));
