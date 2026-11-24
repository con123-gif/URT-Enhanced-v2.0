/* RH AUDIT — 2026-11-24 22:48 UTC — REVIEW / SOURCE-MATCHED, PARTIAL.
One result: audit CostWindows -> CharacterBalanceMoves.th_le -> core hK; conditional factor-two tightening of the additive cost allowance.
Upstream 40e56bab026552e089d7afcfeff08d2defb9c005; observed current 9282d3a102c4aff0e6026746db2a8990f5d9cddd. Current ChCore path 404, SChain changed f81e4ebf75f32583942eab5351cca6d3f8abc341, SplitInertia changed cb31619e10acc3effdeec94e10c89abba559f78d, Growth changed c09b82158a535b791e6b77be36385da52d6f3d48; no equivalence asserted.
Preflight: SWARM_PROTOCOL first, AGENTS, research state, runner log/protocol, continuity, HANDOFF_QUEUE, CI checkpoint #399 PASS (45498204367, not RH proof evidence); latest audit 8a14444, math fe24ed4, structure 9f977c3, dependencies fd407df, integration 6e12102, prior sum_Th and ch_core max-allowance audits. Blueprint Drive text retrieved; no blueprint premise used. Root log/protocol paths 404; corrected runner paths. Default-branch search norm_avg_le empty; exact supplier not independently located, call verified at ChCore 105–108. lean/lake/elan absent locally; no independent #print axioms, sorry census, or kernel replay. No inferred typed edges; dependency checkpoint fd407df reports triv ID 856978 expanded but not on observed root path; do not imply root reach. No physical or URT claims.

Exact human proof (pin; source paths/blob IDs below):
SChain 50–51 defines CostWindows, a conjunction, not equality. Put f=fPl H=|PhiSet|>=0 (Growth 39), L=3(x+1)(eta+1), U=(x+1)b theta, R=b/x. CostWindows asserts 2f(x+1)theta<=1/x and 6f(x+1)(eta+1)<=b/x. By b>0 multiply the first by b to get 2fU<=R; second is 2fL<=R. Adding gives exactly hK at ChCore 296–301: 2f(L+U)<=2R. No sign assumption on theta or eta needed for this particular addition; original SizesA has eta,theta>=0, x>=3, b>0, so both branch budgets are nonnegative. hK is not equivalent to the conjunction. Do not silently substitute it for CostWindows where the conjunction is needed.

Refinement: the two pointwise estimates inside th_le are alternatives for EACH (g,psi) (ChCore 105–139). In the thick branch the original Lipschitz estimate gives norm<=L (lines 114–123); in the thin branch the original ThinScales estimate gives norm<=U (124–139). Both remain valid with all original guard hypotheses (including partner inPhi, positive w, A>0, hbX, hLip, hThin, and all host and size assumptions). Thus use M=max(L,U) instead of L+U as the uniform nonnegative parameter to the same finite norm-average argument. This is not summing two errors at a single index, nor assuming all indices fall in one branch. The call CR.norm_avg_le accepts a common nonnegative bound with pointwise proof as seen in source; its declaration not independently recovered. Equivalently, use triangle inequality on the displayed finite expression with |g-set|<=f and |AddChar(E0 x H,C)|=2f, |psi(-g)|=1, f=2|H|>0 (cardinality normalization independently reconstructed in earlier audit 2026-11-24_sum_th_normalization_audit.mjs). Then norm <= (1/f)*f*(2f)*M=2fM. The exact signed difference De.re-Th.re in lines 141–151 is unchanged. Since 2f>=0, 2fM=max(2fL,2fU)<=R. Therefore under original assumptions the pointwise conclusion strengthens to Th.re<=De.re+b/x. Both cost windows are still used; no replacement by min.
ChCore core 302–320: apply original ch_balance identity to replace De.re by ASK-MAIN.re, sum over TT and Fin m, and apply hTop to the signed gapA. Replace the repeated 2*b/x by b/x throughout this argument to get hu<=Err+|TT|*m*b/x. Sum over A0 and cancel |A0|>0, use exact sum_Th and nonnegative m*b*(delta2/2) multiplying hY (previous audit). Therefore the strengthened conditional core inequality is |TT|*m*b*(delta2/2)*Y <= Err+|TT|*m*b/x. Original bound follows because b/x>=0; no change to final ch_core conclusion or proposition_size_bound needed, and no claim of a stronger RH theorem. In particular preserve hTop, hY, hT2, HostFactsS, SizesA, ThinScales and both CostWindows atoms; Y and gapA can be signed, no absolute-value replacement. No new assumptions. This is a source-matched human refinement, not a Lean patch or independent elaboration.

Negative controls: explicit f=2,x=3,eta=0,b=288,theta=1/32 gives scaled costs (48,144), R=96: hK holds but first window fails; b=72,theta=0 gives (48,0), R=24: hK holds but second fails. Dropping either atom can also make hK false. b<0 algebra-only fixture shows multiplying hC.1 can reverse the inequality; it is NOT an example obeying SizesA (eta>=0). Min not a common upper bound. These are local relaxed numeric countermodels, not claims of native host realizability.
Executed in V8 against connector-retrieved pinned source: {"counts":{"anchors":36,"mutations":36,"cost":172800,"branch":129600,"aggregation":4176,"negative":7},"total":306655,"feasible":57600}. CLI independently hashes raw pinned checkout files before repeating same tests; not run here. Tests exact BigInt rational inequalities, finite signed real averaging controls and source-anchor mutations, not a Lean semantic checker or a proof of the full complex/analytic assumptions.
RESUME HERE: locate exact CR.norm_avg_le supplier and typed references, audit its cardinality and normalization hypotheses and CR.De_re/CR.GC_host used by th_le 105–151, then validate the proposed max-bound as a separate Lean lemma if kernel available. HANDOFF TO math, integration, editor, dependencies, kernel.
AGREE with pinned CostWindows transport; AGREE with conditional max-bound refinement at human-proof level; DISAGREE with replacing conjunction by aggregate or min. PARTIAL for full reconstruction.
*/
import {readFileSync} from "node:fs";
import {createHash} from "node:crypto";
import {join} from "node:path";
const spec={
  "core": [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de"
  ],
  "s": [
    "src/Formalism/SizeWindowBrackets/SChain.lean",
    "a4bc8cecac40a1f5fd307661e151639aaf6a6efa"
  ],
  "split": [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4"
  ],
  "growth": [
    "src/Formalism/SizeWindowBrackets/GrowthBoundGivesRiemannHypothesis.lean",
    "a3ece4b4aea97a95ba2977fa9e8d437e72677774"
  ],
  "p": [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/PChain.lean",
    "57559bc6dedbabbac7365c9f31fbbab09164edca"
  ]
};
function audit(src){
 const counts={anchors:0,mutations:0,cost:0,branch:0,aggregation:0,negative:0};
 const ck=(v,k,msg)=>{if(!v)throw Error(k+": "+msg);counts[k]++};
 const norm=s=>s.replace(/\s+/g," ").trim();
 const anchors={
 s:["def CostWindows (x f b η θ : ℝ) : Prop :=","2 * f * (x + 1) * θ ≤ 1 / x ∧ 6 * f * (x + 1) * (η + 1) ≤ b / x"],
 split:["import Formalism.SizeWindowBrackets.ChainSlopeWindows.PChain","def SizesA (A0 : AddSubgroup H)","0 ≤ η ∧ 0 < X' ∧ 0 < b' ∧ b' * X' ≤ x * b ∧ 0 ≤ θ","(∀ u0 ∈ A0, ∀ j ρ, IsThickAt T2 u0 ρ → b ≤ w u0 j ρ ∧ w u0 j ρ ≤ b + η + 1)","(∀ u0 ∈ A0, ∀ j ρ, InPhi ρ → ¬ IsThickAt T2 u0 ρ → w u0 j ρ ≤ 2 * b')","∑ t ∈ TT, ∑ j : Fin m, (ASK D N (a t) t (w u0 j) - (MAIN ell (a t) (w u0 j)).re)"],
 p:["import Formalism.SizeWindowBrackets.SChain"],
 growth:["def fPl (H : Type) [AddCommGroup H] [Fintype H] [DecidableEq H] : ℝ := ((PhiSet (H := H)).card : ℝ)","def delta2 (T2 : Finset H) : ℝ := (T2.card : ℝ) / (Fintype.card H : ℝ)"],
 core:["import Development.AutomorphicArithmetic.DedekindLFunctions.SplitInertia","lemma th_le","(hx : 3 ≤ x) (hb : 0 < b) (hη : 0 ≤ η)","(hThin : ThinScales D ell X' θ) (hLip : LipW D ell)","(Th D ell T2 b (A / b) u0 t).re ≤ (De D ell A t w).re + 2 * fPl H * (3 * (x + 1) * (η + 1) + (x + 1) * b * θ)","have hn := CR.norm_avg_le","(3 * (x + 1) * (η + 1) + (x + 1) * b * θ) (by positivity)","by_cases hth : IsThickAt T2 u0 (cconj + g + topPl t)","3 * A / b * (w (cconj + g + topPl t) - b) ≤ 3 * (x + 1) * (η + 1)","_ ≤ (x + 1) * b * θ := mul_le_mul_of_nonneg_right hA2 hθ","have hre := (abs_le.1 (le_trans (Complex.abs_re_le_norm _) hn)).1","rw [← e] at hre","(hC : CostWindows x (fPl H) b η θ)","have hK : 2 * fPl H * (3 * (x + 1) * (η + 1) + (x + 1) * b * θ) ≤ 2 * b / x","have h1 := mul_le_mul_of_nonneg_left hC.1 hb.le","have h2 := hC.2","have e : 2 * b / x = b * (1 / x) + b / x := by ring","have k1 := th_le D ell T2 x b b' η X' θ (a t) u0 t (w u0 j)","have k2 := congrArg Complex.re (ch_balance","∑ _t ∈ TT, ∑ _j : Fin m, 2 * b / x = 2 * (TT.card : ℝ) * m * b / x","unfold gapA at this","have hA : (0 : ℝ) < Fintype.card A0","(TT.card : ℝ) * m * b * (delta2 T2 / 2) * Y ≤ Err + 2 * (TT.card : ℝ) * m * b / x","SizesA A0 TT T2 a w N x b b' η X' θ → ThinScales D ell X' θ → CostWindows x (fPl H) b η θ","have hc' := CharacterBalanceMoves.core A0 D S hHost ell N TT T2 a w hx3 hb hS hThin hCost hT2 hTop hY"]
 };
 for(const [k,arr] of Object.entries(anchors))for(const a of arr){const n=norm(src[k]),b=norm(a);ck(n.includes(b),"anchors",k+" "+a);ck(!n.split(b).join("__REMOVED__").includes(b),"mutations",k+" "+a);}
 const max=(a,b)=>a>b?a:b;
 // Exact rational fixture: theta=k/(d*2*f*(x+1)*x), integer x,b,eta,f.
 // Multiply each cost inequality by x*d>0. A=scaled thick budget, B=scaled thin budget, R=scaled b/x.
 // hC.1 is exactly k<=d; hC.2 is exactly A<=R. b>0 gives B<=R.
 let feasible=0;
 for(let x=3n;x<=10n;x++)for(let f=2n;f<=12n;f+=2n)for(let eta=0n;eta<=4n;eta++)for(let d=1n;d<=6n;d++){
   const b0=6n*f*(x+1n)*(eta+1n)*x;
   for(let j=1n;j<=5n;j++){const b=b0*j;
     for(let k=-d;k<=d;k++){
       const A=b0*d,B=b*k,R=b*d;feasible++;
       ck(k<=d&&A<=R&&B<=R,"cost","two costs");
       ck(A+B<=2n*R,"cost","original hK");
       ck(max(A,B)<=R,"cost","refined hK");
       if(k>=0n){ck(A>=0n&&B>=0n,"branch","nonneg from SizesA");
         ck(A+B-max(A,B)===(A<B?A:B),"branch","exact budget saving");
         for(const thick of [false,true]){
           const active=thick?A:B;
           ck(active<=max(A,B)&&active<=R,"branch","exclusive allowance");
         }
       }
     }
   }
 }
 // Exact scaled finite averaging controls: each summand has magnitude <= one of T,U.
 // A real signed special case (phases +/-1) verifies the cardinality normalization 2f.
 // General complex inequality follows by triangle inequality, not by these real fixtures.
 for(let f=2n;f<=8n;f+=2n)for(let T=0n;T<=4n;T++)for(let U=0n;U<=4n;U++)for(let g=0n;g<=f;g++){
   const M=max(T,U),C=2n*f;
   // g thick positions, at most f-g thin positions, C characters per position.
   const total=C*(g*T+(f-g)*U);
   ck(total<=f*C*M,"aggregation","triangle numerator bound");
   for(const s of [-1n,1n])ck(-f*C*M<=s*total&&s*total<=f*C*M,"aggregation","signed real part");
 }
 // Reuse downstream positive factors without changing signed Y: if nT*Y <= U0 and K>=0, multiply.
 for(let nT=0n;nT<=5n;nT++)for(let K=0n;K<=5n;K++)for(let Y=-5n;Y<=5n;Y++)for(let d=0n;d<=5n;d++){
   const U0=nT*Y+d;
   ck(K*nT*Y<=K*U0,"aggregation","nonnegative multiplier");
 }
 // Explicit relaxed numerical countermodels, not complete ArithData models.
 // x=3,f=2,eta=0,b=288,theta=1/32: A=48,B=144,R=96.
 ck(48n<=96n&&144n>96n&&48n+144n===2n*96n,"negative","hK does not imply first window");
 // x=3,f=2,eta=0,b=72,theta=0: A=48,B=0,R=24.
 ck(0n<=24n&&48n>24n&&48n+0n===2n*24n,"negative","hK does not imply second window");
 // If one window is simply dropped, even original combined hK can fail.
 ck(48n<=96n&&48n+192n>2n*96n,"negative","first window omission");
 ck(0n<=12n&&48n+0n>2n*12n,"negative","second window omission");
 // x=3,f=2,b=-12,eta=-2,theta=-1: both windows, but b<0 reverses first multiplication.
 ck(-16n*3n<=1n&&-48n<=-4n&&-48n+192n>2n*(-4n),"negative","signed b algebra only");
 // Using min or assuming both contributions are simultaneously absent is invalid.
 ck(1n>0n&&3n>1n,"negative","min cannot bound active larger branch");
 // Max bound is sharp as a common envelope in the relaxed scalar model (one branch at R).
 ck(max(4n,1n)===4n&&max(1n,4n)===4n,"negative","both branches needed");
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0),feasible};
}
const root=process.argv[2];if(!root)throw Error("usage: node certificate.mjs /path/to/pinned/checkout");
const src={};for(const [key,[p,sha]] of Object.entries(spec)){const b=readFileSync(join(root,p));const h=createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(h!==sha)throw Error("blob mismatch "+p);src[key]=b.toString("utf8")}
console.log(JSON.stringify(audit(src)));
