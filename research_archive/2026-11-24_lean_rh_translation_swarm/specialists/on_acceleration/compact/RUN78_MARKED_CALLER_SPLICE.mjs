/*
RUN78 — actual A2 marked caller splice and shared square-frame transfer, 27 Nov 2026.
SOURCE-MATCHED / prepared for native replay, not Lean verified.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 historical only.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
67e542df1b5557b2e1314643931ef1355bbdc50d / 073d86374ebc415e217a2732814dde7b0f3dfb9d.
Prior RUN77 commit 263f17633ff7322374e8b7498dbd2c2aabf14513. Reuse its square-frame proof; do not claim additional frame existence.
Source paths below and peer A1 RUN78 f1abc81e, C2 RUN79 fab4aba0, B2 replay receipt inspected.
Original exact source static edges:
  Data.IsGoodDatum.mem_raises -> norm_jetSeries_le -> exists_isTightFrame + original transfer.
  norm_jet_jetSeries_le_one -> norm_jetSeries_le -> exists_isTightFrame + original transfer.
Replacement:
  mem_raises -> prime_to_level_run78 -> from_square_frame_run78 + isTightFrame_zeta_pow + chiK_eq_one_of_dvd.
  norm_jet_jetSeries_le_one -> norm_jetSeries_le -> from_square_frame_run78 + exists_isTightFrame.
The same marked guard is ALREADY used verbatim at that caller for norm_iota_periodFactor_eq_one;
no new hypothesis, datum, norm, level or Hecke exponent. N1>0 via native NeZero.
The shared supplier assumes p.Coprime M, M != 0, IsTightFrame w k (M*M), and precisely all original
standardData, V.IsStd, thetaProducts scale and linear functional premises. Except the explicit nonzero
proof the downstream transfer body is byte-identical. General caller has no p-not-dividing-N1 premise;
do not replace that call with the specialized theorem. The original large-frame theorem stays reachable
there (and may remain imported through other declarations); no global dependency deletion claimed.
A2 span, integral frame, local pairing, A1 and all other live ledger obligations remain open.
Context cache keys: pinned blobs, exact guard, V, P,s,p,delta,f,c,L,r, M,w,k, frame, caller. No native
rh_scan/prune/reduce/auto/frontier available locally (lean and lake absent). Static edge checks only,
not elaborated proof dependencies, no claimed URT speedup or full proof. All old graphs retained.
Actual executed JS patch on exact connector-returned source: two source blob IDs matched, one caller
substitution reversed byte-for-byte, shared transfer body preserved, unrestricted fallback preserved,
three deliberately changed anchor/guard inputs rejected. Shared original transfer body 1843 JS characters.
No runtime benchmark claimed. CI receipt compute/rh-compact-primitives-replay-20261126/outputs/
targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804 six earlier original checks;
JetExponentBound timeout 124, all_requested_checks_ok=false, full_RH_replay=false.
New B2 actual receipt compute/rh-compact-b2-human-replay-20261127/status.json
d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d, Actions 45986308748: status pass, exit 0,
8 helper proofs, 6 original caller axiom probes, negative control rejected;
caller_replacements_checked=false, human_assembly_verified=false, full_RH_replay=false.
Not an A2 replay; no new Lean verification claimed.
RESUME HERE: Run this script on a disposable compact checkout at the exact pin with --apply,
then shared runner builds New.Columns.LocalStatement and probes the three named replacement/supplier
declarations and original mem_raises, plus norm_jet_jetSeries_le_one. Compare constructor-inclusive
proof-term dependencies, including type/value/constructor roles and axioms, against unmodified pin.
Do not queue duplicate build if same workspace receipt exists. If replay fails, repair actual elaboration.
General p|N one-block supplier from RUN77 remains uncompiled; it is still needed if removing
exists_isTightFrame from general norm_jet_jetSeries_le_one. No claim of closure.
HANDOFF TO kernel/integration/editor/theta/audit. Next mathematical action only after caller replay:
formalize the RUN77 p|N block against native IsTightFrame, not another arithmetic regression.
*/
import fs from 'node:fs';
import path from 'node:path';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const patch = (jet, local) => {
  function once(s, needle, replacement) {
    if (s.split(needle).length !== 2) throw Error("anchor not unique: "+needle.slice(0,100));
    return s.replace(needle, replacement);
  }
  const start=jet.indexOf("lemma norm_jetSeries_le {");
  const end=jet.indexOf("\n/-- Integrality of jets:",start);
  if(start<0||end<0)throw Error("missing original declaration bounds");
  const orig=jet.slice(start,end);
  const intro="  let M := p * (P.d * P.N₁ s) ^ 6 + 1\n  obtain ⟨hM, _, _, w, k, hw, -⟩ := (by simp [M] : p.Coprime M), P.exists_isTightFrame s (by\n    unfold M; grw [← q.1.one_le]; lia : _ * 1 ≤ M * M)\n";
  const tail="  obtain ⟨F, hW, hF, -, K, y, _, hy, _, hs⟩";
  const cut=orig.indexOf(intro);
  if(cut<0||!orig.slice(cut+intro.length).startsWith(tail))throw Error("frame selection changed");
  const sig=orig.slice(0,cut);
  const body=orig.slice(cut+intro.length);
  const guard="[V.IsStd] (hf";
  const genSig=once(once(sig,"lemma norm_jetSeries_le {","lemma norm_jetSeries_le_from_square_frame_run78 {"),guard,
    "[V.IsStd] {I : Type} [Fintype I] {w : I → E P s} {k : I → ℕ} {M : ℕ}\n    (hM : p.Coprime M) (hM0 : M ≠ 0) (hw : IsTightFrame w k (M * M)) (hf");
  const genBody=once(body,"(by simp :\n    M * M ≠ 0)","(by simp [hM0] :\n    M * M ≠ 0)");
  const general=sig+intro+"  exact norm_jetSeries_le_from_square_frame_run78 hM (by simp [M]) hw hf c L H\n";
  const specialized=once(once(sig,"lemma norm_jetSeries_le {","lemma norm_jetSeries_le_prime_to_level_run78 {"),guard,
    "[V.IsStd] (hLevel : ¬ p ∣ P.N₁ s) (hf")+
    "  exact norm_jetSeries_le_from_square_frame_run78 (q.1.coprime_iff_not_dvd.2 hLevel)\n    (NeZero.ne _) (P.isTightFrame_zeta_pow s (P.N₁ s)) hf c L H\n";
  const comment=jet.lastIndexOf("/-- Let V be standard, f standard data",start);
  if(comment<0)throw Error("missing documentation boundary");
  const newJet=jet.slice(0,comment)+"/-- Transfer from a supplied nonzero square tight frame of p-unit length. -/\n"+
    genSig+genBody+"\n"+jet.slice(comment,start)+general+"\n"+
    "/-- The prime-to-level branch uses only the repeated root-of-unity frame. -/\n"+specialized+jet.slice(end);
  const call="from norm_jetSeries_le hf _\n    (.proj _ ∘ₗ .proj _ ∘ₗ schurJet _)";
  const after="from norm_jetSeries_le_prime_to_level_run78 (hΛ.4.2 ∘ P.chiK_eq_one_of_dvd Fact.out) hf _\n    (.proj _ ∘ₗ .proj _ ∘ₗ schurJet _)";
  const newLocal=once(local,call,after);
  const callerGuard="P.norm_iota_periodFactor_eq_one _ (hΛ.4.2 ∘ P.chiK_eq_one_of_dvd Fact.out)";
  if(!local.includes(callerGuard))throw Error("existing guard witness absent");
  const ordinary="| rfl => norm_jetSeries_le hf _ _ (r := 1)";
  if(!newJet.includes(ordinary)||!jet.includes(ordinary))throw Error("general consumer dropped");
  if(once(newLocal,after,call)!==local)throw Error("unexpected caller changes");
  if(genBody.replace("(by simp [hM0] :\n    M * M ≠ 0)","(by simp :\n    M * M ≠ 0)")!==body)throw Error("transfer body changed");
  if(genSig.includes("exists_isTightFrame")||genBody.includes("exists_isTightFrame")||specialized.includes("exists_isTightFrame"))throw Error("large-frame dependency leaked");
  if(!general.includes("P.exists_isTightFrame"))throw Error("unrestricted fallback lost");
  return {newJet,newLocal,originalChars:orig.length,sharedBodyChars:body.length};
};
const root=path.resolve(process.argv[2]||'.');
const pin='72fead102f663d5c7a407964a13dc0cf9d977207';
const head=execFileSync('git',['rev-parse','HEAD'],{cwd:root,encoding:'utf8'}).trim();
if(head!==pin)throw Error('wrong source commit '+head);
const files=['grh-compact/src/New/Curve/ConjugatesOfJets.lean','grh-compact/src/New/Columns/LocalStatement.lean'];
const expected=['8b841d76bb938d8a18fd4341aa832a20b13dd9e0','9d5bd0d698b0db2850cbd306d8d400d7e99a3547'];
const sources=files.map((f,i)=>{const s=fs.readFileSync(path.join(root,f));const h=createHash('sha1').update('blob '+s.length+'\\0'.replace('\\0','\0')).update(s).digest('hex');if(h!==expected[i])throw Error('wrong blob '+f+' '+h);return s.toString('utf8');});
const r=patch(...sources);
let rejected=0;
for(const [x,y] of [[sources[0].replace('let M := p *','let M := 1 + p *'),sources[1]],[sources[0],sources[1].replace('from norm_jetSeries_le hf _','from norm_jetSeries_le hf\' _')],[sources[0],sources[1].replace('P.norm_iota_periodFactor_eq_one _ (hΛ.4.2 ∘ P.chiK_eq_one_of_dvd Fact.out)','P.norm_iota_periodFactor_eq_one _ (by assumption)')]]){try{patch(x,y)}catch(e){rejected++}}
if(rejected!==3)throw Error('negative control accepted');
if(process.argv.includes('--apply')){fs.writeFileSync(path.join(root,files[0]),r.newJet);fs.writeFileSync(path.join(root,files[1]),r.newLocal);}
console.log(JSON.stringify({source_patch_checks:true,negative_controls_rejected:rejected,shared_transfer_chars:r.sharedBodyChars,applied:process.argv.includes('--apply'),native_verified:false}));
