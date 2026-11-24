/*
RH AUDIT — 2026-11-24 — ch_core uniform error allowance — REVIEW / SOURCE-MATCHED.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Single contribution: replace the sum of two mutually exclusive branch budgets by their maximum, preserving the original theorem, all hypotheses and the uniform quantifier order. Source ChCore lines 202–212, 343–442; SplitInertia CharsA definition; paths and Git blob identities in spec.
Preflight: read SWARM_PROTOCOL, AGENTS, research-state, runner log/protocol, continuity, HANDOFF_QUEUE, previous audit c242308, structure 9adeb62, dependencies 63102da/593acf8, math 841a46b, integration e89edf7 and specialist checkpoint tails eded523/e6f6267/5faf1b9/f7a615b/b9d37e3. Cathedral CI #393 PASS 45479331883, not RH verification. Blueprint not reopened; no claims from blueprint. Root log/protocol paths returned 404; corrected paths. Current default ChCore path returns 404; no revised equivalence claimed. Next-root and combined-frontier extraction jobs report pass; next-root report blob d04e0fb24160d3ee1be54cd50082f59526864d4e, 18 reports, does not expand triv ID 856978; combined report connector returned truncated JSON (not parsed). No new outgoing role edges inferred. Request triv explicitly. Local lean/lake/elan not available (node and git available), no #print axioms, sorry census, or kernel replay. V8 execution used connector source blob metadata checks; replay below independently hashes pinned checkout bytes. No physical analogy or URT claim.
Derivation: ch_core first fixes C, eps>0, CE, Ko, c with |c|<=1, M and the universal Cd>=0 supplied by derivative_integral_all, before choosing x1 and before introducing H, D, ell or any host data. Define K=|Ko|, E=|CE|, J=|M|, U=K+J*(4+Cd+K), V=4*E. Original A1=5+Cd+U+V. Proposed A=5+Cd+max(U,V). A<=A1, exact reduction min(U,V), strict if both positive. Set s=x^(1/4), e=x^eps, l=log x, p=log(x+1). For x>=3 the original proof establishes s,e>=1, 0<=l<=4s, p<=5s, and x^(-1+eps)*x=e. Retain all original CharsA fields and absolute-value majorants; in particular rho=J*x^(-1+eps)>=0, Ko parameter K>=0 and L=E*l. The three one_char allowances are a1=Cd, a2=p+Cd+K+J*e*(l+Cd+K), a3=p+Cd+E*l. They satisfy a1<=A*s*e; a2<=(5+Cd+K+J*(4+Cd+K))*s*e=(5+Cd+U)*s*e<=A*s*e; a3<=(5+Cd+4E)*s*e<=A*s*e. This uses only the source's log and sign bounds, no changed character conditions. max(a1,a2,a3) is the smallest allowance satisfying these three numeric inequalities, not necessarily the actual optimal character error. Use R=A*s*e in one_char. The threshold for hbig can be replaced by s>=J*A, still chosen before H: for example x>=max(3,26^(8/(3*eps)),(J*A)^4) suffices by monotonic positive powers. All remaining premises, notably RestSize, HostFactsS, SizesA, ThinScales, CostWindows, T2 membership, CharsA, gapA, are unchanged. Since card PsiA<=M<=J and R>=0, card PsiA*R<=J*A*s*e<=s^2*e=x^(1/2+eps). In particular the original hY with 4*x^(1/2+eps) follows unchanged. No need to change proposition_size_bound or final exponent; no final theorem strengthening asserted. Empty retained/excluded nonzero classes can make the corresponding Ko/CE norm constraints vacuous; do not assume signed constants globally nonnegative. Numeric fixtures test the relaxed envelope, not native host realizability or transcendental bounds. Omitting one branch or the threshold fails in this envelope; these are not claimed countermodels of the full Lean theorem.
Executed V8 checks: {"counts":{"anchors":32,"mutations":32,"allowances":641520,"slack":1620,"threshold":32400,"negative":6},"total":675610}. Reproduction: node this-file.mjs PINNED_RH_CHECKOUT. Source mutations verify literal anchors only, not Lean term semantics; no source-to-export binding assumed. 
RESUME HERE: dependencies lane request exact triv ID 856978 direct type/value roles; audit SizeWindows producer size_windows_split and the exact transport of hW to proposition_size_bound using ChCore 367–370,440–442, compare prior HANDOFF_QUEUE correction, do not repeat the already-proved four-term algebra. HANDOFF TO dependencies, math, editor, kernel, integration. AGREE with original common allowance; AGREE with max-budget conditional refinement; DISAGREE with dropping any branch allowance, uniform threshold, or sign guard. PARTIAL for full reconstruction.
*/
import {execFileSync} from "node:child_process";
import {createHash} from "node:crypto";
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",spec=[
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "lemma one_char (A0 : AddSubgroup H)",
      "(hρ : 0 ≤ ρ) (hKo : 0 ≤ Ko) (h0K : 0 ∈ Kp)",
      "(r1 : Cd ≤ R) (r2 : Real.log (x + 1) + Cd + Ko + ρ * (x * (Real.log x + Cd + Ko)) ≤ R)",
      "(r3 : Real.log (x + 1) + Cd + L ≤ R)",
      "theorem ch_core (C ε CE Ko c M : ℝ) (hC : 0 ≤ C) (hε : 0 < ε) (hc : |c| ≤ 1) : ∃ x1 : ℝ, ∀ x ≥ x1,",
      "obtain ⟨Cd, hCd, hDer⟩ := derivative_integral_all",
      "set A1 : ℝ := 5 + Cd + |Ko| + |M| * (4 + Cd + |Ko|) + 4 * |CE|",
      "eventually_ge_atTop (|M| * A1)",
      "refine ⟨max 3 (max x₁ x₂), fun x hx => ?_⟩",
      "intro H _ _ _ m D S ell N TT T2 a w b b' k aE η X' θ A0 Kp",
      "obtain ⟨h0K, hKp, hM, hE2, hKo, hE3⟩ := hCh",
      "have hs1 : 1 ≤ s",
      "have he1 : 1 ≤ e",
      "have hX : x ^ ((1 : ℝ) / 2 + ε) = s * (s * e)",
      "have hρ : x ^ (-1 + ε) * x = e",
      "have hl : Real.log x ≤ 4 * s",
      "have hl1 : Real.log (x + 1) ≤ 5 * s",
      "have r1 : Cd ≤ A1 * (s * e)",
      "have r2 : Real.log (x + 1) + Cd + |Ko| + |M| * x ^ (-1 + ε) * (x * (Real.log x + Cd + |Ko|)) ≤ A1 * (s * e)",
      "have r3 : Real.log (x + 1) + Cd + |CE| * Real.log x ≤ A1 * (s * e)",
      "(L := |CE| * Real.log x)",
      "(hDer H D ell)",
      "r1 r2 r3",
      "(TT.card : ℝ) * (G - 4 * x ^ ((1 : ℝ) / 2 + ε))",
      "have k1 := mul_le_mul_of_nonneg_right (hM.trans (le_abs_self M))",
      "have k2 := mul_le_mul_of_nonneg_right hbig",
      "have hz := proposition_size_bound"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4",
    [
      "def CharsA (ell",
      "0 ∈ Kp ∧ (∀ ψ ∈ Kp, ψ ∈ PsiA A0 ∧ ψ sgc0 = 1) ∧ ((PsiA A0).card : ℝ) ≤ M",
      "‖(∑ t ∈ TT, ψ (0, t)) - (c : ℂ) * (TT.card : ℂ)‖ ≤ M * x ^ (-1 + ε) * (TT.card : ℝ)",
      "(∀ ψ ∈ Kp, ψ ≠ 0 → ‖ell ψ‖ ≤ Ko)",
      "(∀ ψ ∈ PsiA A0, ψ ∉ Kp → ‖ell ψ‖ ≤ CE * Real.log x)"
    ]
  ]
];
function certify(spec,files){
 const counts={anchors:0,mutations:0,allowances:0,slack:0,threshold:0,negative:0};
 const ck=(b,k,m)=>{if(!b)throw Error(k+" "+m);counts[k]++};
 const checkAnchors=f=>{for(const [p,,a] of spec)for(const s of a)if(!f[p].includes(s))throw Error(p+" "+s)};
 checkAnchors(files);counts.anchors=spec.reduce((n,r)=>n+r[2].length,0);
 for(const [p,,a] of spec)for(const s of a){let rejected=false;try{checkAnchors({...files,[p]:files[p].split(s).join("REMOVED")})}catch{rejected=true}ck(rejected,"mutations",s)}
 // Exact integers for a relaxation of the log bounds; no floating log or rpow computations.
 // L = log x; P = log(x+1); every real admissible input is covered by the analytical proof.
 for(let Cd=0;Cd<=4;Cd++)for(let k=-4;k<=4;k++)for(let c=-4;c<=4;c++)for(let M=1;M<=4;M++){
  const K=Math.abs(k),E=Math.abs(c),U=K+M*(4+Cd+K),V=4*E;
  const A=5+Cd+Math.max(U,V),old=5+Cd+U+V;
  ck(old-A===Math.min(U,V)&&A<=old&&A>=Cd,"slack","max identity");
  for(let s=1;s<=4;s++)for(let e=1;e<=3;e++)for(let L=0;L<=4*s;L++)for(const P of [L,Math.min(5*s,L+1),5*s]){
   const R=A*s*e, r2=P+Cd+K+M*e*(L+Cd+K),r3=P+Cd+E*L;
   ck(Cd<=R&&r2<=R&&r3<=R&&R<=old*s*e,"allowances","three branches");
  }
  for(const s of [Math.max(1,M*A),Math.max(1,M*A)+1])for(let e=1;e<=4;e++)for(let n=1;n<=M;n++){
   ck(n*A*s*e<=s*s*e,"threshold","aggregate");
  }
 }
 // Controls: if a branch is discarded the interface bound can fail, even with s=e=1
 // (relaxed algebra fixtures, NOT actual log values or native hosts).
 ck(5+0+10+1*(4+10)>5+Math.max(0,0),"negative","r2 omitted");
 ck(5+10*4>5+4,"negative","r3 omitted");
 ck(5+10+1*(4+10)>5+Math.max(10,14),"negative","r2 summands cannot be maxed");
 ck(2*7*3*2>3*3*2,"negative","threshold removed");
 ck(2*7>1*7,"negative","host count cannot be replaced by one");
 ck(0+4*(-2)<0,"negative","signed CE not uniform nonnegative majorant");
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0)};
}
const root=process.argv[2];if(!root)throw Error("usage: node certificate.mjs PINNED_RH_CHECKOUT");
const files={};for(const [p,sha] of spec){const b=execFileSync("git",["-C",root,"show",pin+":"+p]);const h=createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(h!==sha)throw Error("blob "+p);files[p]=b.toString("utf8")}
const r=certify(spec,files);if(JSON.stringify(r)!=="{\"counts\":{\"anchors\":32,\"mutations\":32,\"allowances\":641520,\"slack\":1620,\"threshold\":32400,\"negative\":6},\"total\":675610}")throw Error("replay counts");console.log(JSON.stringify(r,null,2));
