/*
AUDIT / 2026-11-24 / reflection and root-branch compression
RESULT: AGREE with pinned integration reflection argument, subject to explicit branch
separation. PARTIAL overall: SOURCE-MATCHED only, not elaborated or kernel rechecked.
Peer: integration/2026-11-24_0718_reflection_and_export_handoff.md
(blob 6b3c337c9a2fe1acc41d8246a79a6ca8e565ee66).

The pinned root is the global riemannHypothesis (not Main.riemannHypothesis).
Its explicit chain is riemannHypothesis -> rhOfAll -> rh_of_every -> rh_of_right,
with allChi -> UpperTheory.FinalTheorems.everyCharacter as the essential input.
critLine is a sibling result used by critAll, NOT a direct call of rh_of_every.
Do not label absence of an explicit call as a kernel-level non-dependency.

EveryCharacter: all N : Nat with NeZero N, all characters and complex s,
strict Re(s)>1/2, guard (chi != 1 OR s != 1). Only their simultaneous failure
is excluded. Replacing OR by AND loses the modulus-one specialization.
For critLine: primitive chi, strict 0<Re(s)<1, zero premise. On left,
gammaFactor nonzero at s by positive real part; completed L zero follows.
Inverse primitive functional equation gives completed L zero at 1-s.
At 1-s the formula divides by the gamma factor with nonzero argument
(1-s != 0); 1-s != 1 by s != 0. No division-cancellation assumption added.
On right, use EveryCharacter directly. No conclusion about boundary zeros.

For actual rh_of_right, the RH definition is unfolded with zero, exclusion
of negative even integers and s != 1. No initial critical-strip hypothesis.
s=0 contradicts zeta(0)=-1/2. For Re(s)<1/2, t=1-s has Re(t)>1/2,
t != 1 and t != -n for every natural n. Functional equation has nonzero
2*(2*pi)^(-t), Gamma(t), zeta(t). If cosine vanishes, its exact zero
characterization yields s=-2k (k integer). k<0 implies Re(s)>=2, impossible;
k=0 implies s=0; k>0 contradicts nontriviality with witness n=k-1.
Hence all factors nonzero, contradiction. Right side directly excluded.
Dropping the nontriviality premise is mathematically false (zeta(-2)=0).
Integer fixture checks below are regression tests, not a proof of the
analytic functional equation, cosine characterization or zeta values.

Executed: GitHub connector fetched six pinned source blobs; exact blob IDs
matched. V8 tool executed the same audit/regress functions below:
{"source_and_logic_assertions":236,"mutations_rejected":9}. The six-file lexical scan found no axiom/sorry/admit
tokens; this is NOT a transitive axiom audit. Lean/lake/elan absent locally,
so #print axioms and kernel elaboration NOT run. Audit cannot certify entire
proof or benchmark URT. Failed latest-source fetches: old CritLine,
RhOfRight, MainTheorems paths returned 404. Latest observed upstream
d27f71347abceb76cd37dc8a5fccbe556ec2be90 uses Claim.zeta directly in
src/Main.lean (blob 67c65badc15f80a1db65df1c84dc7a4928fc410f), so pinned
and latest source graphs must be separated. No conclusions about latest
transitive proof from this comparison.

Replay: node this_file.mjs /path/to/upstream-git-clone
Uses git show at exact pin and verifies Git blob hashes before running.
No network required once git objects are present. Node harness not run
against a local clone in this session (source obtained via connector).
Prior Cathedral CI 45347447866 PASS for 1dec3c8; not this commit's CI.
Audit directory absent on initial read (404); no previous audit file overwritten.
No changes to Cathedral gates, queue, protected files.

RESUME HERE: audit ClaimStrip.lean pinned Claim.strip and Claim.zeta separately
from critLine, especially how imprimitive factors preserve zero-free strip
and why full-character statement does not require primitive chi.
HANDOFF TO: integration, dependencies, human proof editor, audit.
*/
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const pin="40e56bab026552e089d7afcfeff08d2defb9c005";
const files={
  "main": [
    "src/Main.lean",
    "dbd5db70bc11b35f18fa5751216ab335321e7bfc"
  ],
  "kern": [
    "src/Supplements/Kernels/MainTheorems.lean",
    "6a542d7ce969a791fd12ce575f587e6bc29044bf"
  ],
  "every": [
    "src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean",
    "6ac769568b67f85f33565ba3e1eef7b91f53c55f"
  ],
  "crit": [
    "src/Formalism/GammaFactorNonvanishing/CritLine.lean",
    "95fa4da5c50119db164aa93944d106f22fdb576d"
  ],
  "right": [
    "src/Formalism/GammaFactorNonvanishing/RhOfRight.lean",
    "3604637147a33e72248faddd775ea750e7846ead"
  ],
  "stmt": [
    "src/Statements.lean",
    "1cd1bce93344065936b2b392b23306254e0785ef"
  ]
};
function audit(s){
 const norm=t=>t.replace(/\s+/gu," ").trim();
 let count=0;
 const req=(b,m)=>{if(!b)throw Error(m);count++};
 const has=(k,t)=>req(norm(s[k]).includes(norm(t)),k+": "+t);
 has("main","theorem riemannHypothesis : RiemannHypothesis := rhOfAll");
 has("kern","theorem rhOfAll : RiemannHypothesis := Formalism.VW.rh_of_every allChi");
 has("kern","theorem allChi : UpperTheory.EveryCharacter := UpperTheory.FinalTheorems.everyCharacter");
 has("main","theorem LFunction_eq_zero_re_of_isPrimitive : PrimitiveDirichletLZerosOnLine := critAll");
 has("kern","Formalism.VW.critLine allChi N χ hχ s h0 h1 hz");
 has("every","∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (s : ℂ), 1 / 2 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s ≠ 0");
 has("crit","theorem Formalism.VW.rh_of_every (h : UpperTheory.EveryCharacter) : RiemannHypothesis := Formalism.VW.rh_of_right fun s hs hs1 => by have := h 1 (1 : DirichletCharacter ℂ 1) s hs (Or.inr hs1) rwa [LFunction_modOne_eq] at this");
 has("crit","(hχ : χ.IsPrimitive) (s : ℂ) (h0 : 0 < s.re) (h1 : s.re < 1) (hz : LFunction χ s = 0) : s.re = 1 / 2");
 has("crit","have hinv : χ⁻¹.IsPrimitive");
 has("crit","(div_eq_zero_iff.1 hz).resolve_right (Formalism.VW.gammaFactor_ne_zero χ h0)");
 has("crit","rw [inv_inv, hc, mul_zero] at hfe");
 has("crit","have h2 : (1 - s) ≠ 0");
 has("crit","(Or.inr fun e => hs0 (by linear_combination -e))");
 has("right","(hz : ∀ s : ℂ, 1 / 2 < s.re → s ≠ 1 → riemannZeta s ≠ 0)");
 has("right","intro s hs htriv hs1");
 has("right","rw [riemannZeta_zero] at hs");
 has("right","have hnat : ∀ n : ℕ, (1 - s) ≠ -(n : ℂ)");
 has("right","have key := riemannZeta_one_sub hnat h1");
 has("right","have hsk : s = -2 * (k : ℂ)");
 has("right","apply htriv refine ⟨(k - 1).toNat, ?_⟩");
 has("right","exact absurd hs (hz s hgt hs1)");
 has("stmt","(¬∃ n : ℕ, s = -2 * ((n : ℂ) + 1)) → s ≠ 1 → s.re = 1 / 2");
 // Explicit local source scan, not a transitive axiom check.
 for(const k of Object.keys(s)) req(!/\b(?:sorry|admit|axiom)\b/u.test(s[k]),"local trust token "+k);
 // Boolean guard: excludes exactly the simultaneous pole case.
 for(const principal of [false,true])for(const one of [false,true])
   req((!principal||!one)===!(principal&&one),"guard De Morgan");
 req((!true||!false)&&!(!true&&!false),"AND mutation would omit the modulus-one character away from one");
 req((!false||!true)&&!(!false&&!true),"AND mutation would omit nontrivial character at one");
 // Cosine-zero candidate s=-2k: exact integer witness n=k-1 when k>0.
 for(let k=-100;k<=100;k++){
   const x=-2*k;
   req(k<0?x>=2:k===0?x===0:(k-1>=0&&x===-2*((k-1)+1)),"cosine branch "+k);
 }
 // Known trivial zero zeta(-2) (analytic fact, not numerically evaluated here).
 req(-2!==0.5 && -2===-2*(0+1),"trivial-zero exclusion is substantive");
 return count;
}
function regress(s){
 const n=audit(s);
 const mutations=[
 ["every","χ ≠ 1 ∨ s ≠ 1","χ ≠ 1 ∧ s ≠ 1"],
 ["crit","(h0 : 0 < s.re)","(h0 : 0 ≤ s.re)"],
 ["crit","(hχ : χ.IsPrimitive)",""],
 ["crit","Formalism.VW.rh_of_right fun","Formalism.VW.critLine fun"],
 ["right","intro s hs htriv hs1","intro s hs hs1"],
 ["right","(k - 1).toNat","k.toNat"],
 ["right","have hnat : ∀ n : ℕ","have hnat : ∃ n : ℕ"],
 ["main",":= rhOfAll",":= critAll"],
 ["main","import Statements","axiom fictitious : False\nimport Statements"]];
 for(const [k,a,b] of mutations){
  if(!s[k].includes(a))throw Error("bad mutation "+a);
  let rejected=false;
  try{audit({...s,[k]:s[k].replace(a,b)})}catch(e){rejected=true}
  if(!rejected)throw Error("mutation survived "+a);
 }
 return {source_and_logic_assertions:n,mutations_rejected:mutations.length};
}
const repo=process.argv[2]; if(!repo)throw Error('Usage: node audit.mjs /path/to/upstream-clone');
const s={};
for(const [k,[path,sha]] of Object.entries(files)){
 const b=execFileSync('git',['-C',repo,'show',pin+':'+path]);
 const actual=createHash('sha1').update('blob '+b.length+'\\0'.replace('\\0','\0')).update(b).digest('hex');
 if(actual!==sha)throw Error('blob mismatch '+path);
 s[k]=b.toString('utf8');
}
console.log(JSON.stringify(regress(s)));
