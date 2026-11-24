/*
RH AUDIT — 2026-11-24 17:48 UTC — REVIEW / SOURCE-MATCHED, PARTIAL overall.
RESULT: exact three-branch character estimate one_char -> sum_vv -> hY; independent Gaussian-integer regressions and weakening controls.
Source leanprover-community/riemann-hypothesis pinned 40e56bab026552e089d7afcfeff08d2defb9c005. Latest checked 307cef33f046955ee79dba47e0d828d06496d75f: current old ChCore path unavailable: NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {"message":"Not Found","documentation_url":"https://docs.github.com/rest/repo. No equivalence inferred.
Preflight: SWARM_PROTOCOL first; AGENTS, state/log/protocol (root log/protocol 404, actual runner paths read), continuity, HANDOFF_QUEUE, prior audit f651367, structure 4ad5898, dependencies c35d085, integration a20bf40, math 98ed759, boxes c85e003, kernel b28cdca. Cathedral CI #384 PASS run 45447821218, not RH replay. External blueprint not reread. Local lean/lake/elan unavailable, git ls-remote failed DNS. Default-branch searches DerivInt/GPsi/sgc0 returned no hits. Their imported producers remain open; the source uses them, not an invented formula. Connector directory entries checked both exact blob IDs; CLI replay below independently hashes actual bytes, not executed in this run.
Proof (ChCore lines 154–281, SplitInertia 26–40,56–62, ChCore 343–442): let P=PsiA(A0), K=Kp subset P, N=|TT|, g=GPsi(psi,x), g_t=GPsi(psi,y(t)); w=1 if psi restricts trivially to ALL H, else c. vv=w Re(g) on K, -|g| outside. The zero character in K has w=1 and real movement <=Cd via DerivInt.2, so sum Re(g_t)>=N(Re(g)-Cd). This is not the same branch as a nonzero character trivial on H: e.g. psi(i,j,h)=(-1)^j. The latter uses DerivInt.1 (move and triv lemmas), not DerivInt.2. For psi !=0 in K, phase guard psi(sgc0)=1 gives psi(e1 t)=psi(0,t). Set z_t=psi(0,t), A=log(x+1)+Cd+Ko, B=x(log x+Cd+Ko). move gives |g_t-g|<=A and triv gives |g|<=B, using hx>=3, Cd>=0, |y(t)-x|<=1, hDer and hK. If restriction to H trivial, sum z_t=N and w=1; else h2 gives |sum z_t-wN|<=rho N. Exact decomposition S-wNg=sum z_t(g_t-g)+(sum z_t-wN)g. Unit modulus, triangle and nonnegative rho imply Re S>=N(w Re g-A-rho B)>=N(vv-R) by r2. For psi outside K, h0K excludes zero, so move and h3 give |g_t-g|<=log(x+1)+Cd+L<=R. No phase guard needed: Re(psi(e1 t)g_t)>=-|g_t|>=-|g|-R. Summing all three branches preserves signed outside norm. sum_vv uses K subset P, otherwise positive or negative terms from K outside P appear spuriously in GmA. Summing over P and exchanging finite sums yields N(GmA-SigA-|P|R)<=sum_t Re sum_psi psi(e1 t)g_t. CharsA supplies |P|<=M, phase guard, h0K, coefficient and ell bounds. ch_core uses s=x^(1/4)>=1,e=x^eps>=1,R=A1*s*e with A1 as exact source; cutoff ensures |M|A1<=s. Therefore |P|R<=s²e=x^(1/2+eps), in particular <=4*x^(1/2+eps) as source hY. This stronger elementary loss bound is only conditional on same hypotheses, not a changed final RH theorem. Preserve hc, hC,hε, HostFactsS, SizesA, ThinScales, CostWindows, RestSize, subgroup condition, hTop, derivative producer and size-bound producer at ch_core; this result does not establish those premises or Main reachability of this route. No division by N; empty TT valid locally. Do not remove h0K even though some special examples have equal numeric formulas.
Controls: H=C4, A0={0,2}; restriction-trivial nonzero psi=(0,1,0) differs from zero, A0-trivial psi=(0,0,2) nontrivial on H. With psi=(1,0,0), TT={0}, g_t=g=1, psi(0,t)=1 but psi(e1 t)=-1; if phase guard dropped, zero-error kept algebra predicts +1 instead of -1. These are weakened local algebra countermodels, not full native arithmetic hosts. Outside-K sign, K subset, and cardinality/cutoff loss are indispensable in the displayed derivations. No physical analogy or URT claim.
Executed V8 connector source and integer fixtures: {"counts":{"source":41,"mutation":41,"character":128,"kept":13440,"outside":30720,"zero":1920,"split":828,"aggregate":6480,"negative":7},"total":53605}. Gaussian norm upper bounds use integer ceilings (kept tests use D=ceil norm of phase discrepancy and B=ceil norm g); not approximate complex arithmetic, not verification of DerivInt or actual native GPsi values. Mutation controls are source-anchor detection only. No #print axioms, Lean kernel, or source-to-export equivalence checked; peer export closure is distinct.
RESUME HERE: locate DerivInt, GPsi and derivative_integral_all pinned producer definitions via exact import trace, then audit both derivative branches and their y>=1 guard, preserving psi=0 vs psi!=0. Coordinate dependency lane for typed role evidence for Deduction.CharacterBalanceMoves.one_char and Deduction.ch_core rather than infer Main reachability. HANDOFF TO math, dependencies, editor, integration, kernel.
AGREE with the source-matched three-case inequality and hY assembly; DISAGREE with weakening phase, membership, weight or sign guards; PARTIAL overall.
*/
import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
const spec=[
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "(hDer : DerivInt D ell Cd)",
      "(hρ : 0 ≤ ρ) (hKo : 0 ≤ Ko) (h0K : 0 ∈ Kp) (hsg : ∀ ψ ∈ Kp, ψ sgc0 = 1)",
      "(h2 : ∀ ψ ∈ Kp, (¬ ∀ h : H, ψ (0, h) = 1)",
      "(hK : ∀ ψ ∈ Kp, ψ ≠ 0 → ‖ell ψ‖ ≤ Ko)",
      "(h3 : ∀ ψ ∈ PsiA A0, ψ ∉ Kp → ‖ell ψ‖ ≤ L)",
      "by_cases h0 : ψ = 0",
      "have hG := hDer.2",
      "by_cases hX : ψ ∈ Kp",
      "unfold wtA",
      "split_ifs with h",
      "exact h2 ψ hX h",
      "generalize wtA c ψ = c at h2' ⊢",
      "= sgc0 + (0, t)",
      "hsg ψ hX, one_mul",
      "ψ (0, t) * (GPsi D ell ψ (y t) - GPsi D ell ψ x)",
      "have hl := hK ψ hX h0",
      "rw [norm_mul, AddChar.norm_apply, one_mul]",
      "have k2 := h3 ψ hψ hX",
      "if ψ ∈ Kp then wtA c ψ * (GPsi D ell ψ x).re else -‖GPsi D ell ψ x‖",
      "(hKp : ∀ ψ ∈ Kp, ψ ∈ PsiA A0)",
      "⟨hKp ψ h, h⟩",
      "(r1 : Cd ≤ R)",
      "(r3 : Real.log (x + 1) + Cd + L ≤ R)",
      "set A1 : ℝ := 5 + Cd + |Ko| + |M| * (4 + Cd + |Ko|) + 4 * |CE|",
      "eventually_ge_atTop (|M| * A1)",
      "(fun ψ h => (hKp ψ h).2)",
      "Finset.sum_sub_distrib, CharacterBalanceMoves.sum_vv A0 Kp (fun ψ h => (hKp ψ h).1)",
      "(G - 4 * x ^ ((1 : ℝ) / 2 + ε))",
      "hM.trans (le_abs_self M)",
      "mul_le_mul_of_nonneg_right hbig"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4",
    [
      "def PsiA",
      "∀ s ∈ A0, ψ (0, s) = 1",
      "def wtA",
      "if ∀ h : H, ψ (0, h) = 1 then 1 else c",
      "def GmA",
      "def SigA",
      "ψ ∈ PsiA A0 \\ Kp",
      "0 ∈ Kp ∧ (∀ ψ ∈ Kp, ψ ∈ PsiA A0 ∧ ψ sgc0 = 1)",
      "((PsiA A0).card : ℝ) ≤ M",
      "M * x ^ (-1 + ε)",
      "CE * Real.log x"
    ]
  ]
];
function cert(spec,files){
 const counts={source:0,mutation:0,character:0,kept:0,outside:0,zero:0,split:0,aggregate:0,negative:0};
 function ck(b,k,msg){if(!b)throw Error(k+" "+msg);counts[k]++}
 function anchors(f){for(const [p,,as] of spec)for(const a of as)if(!f[p].includes(a))throw Error(p+" "+a)}
 anchors(files);counts.source=spec.reduce((n,x)=>n+x[2].length,0);
 for(const [p,,as] of spec)for(const a of as){let rejected=false;try{anchors({...files,[p]:files[p].split(a).join("REMOVED")})}catch{rejected=true}ck(rejected,"mutation",a)}
 const add=([a,b],[c,d])=>[a+c,b+d], mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c], scale=([a,b],n)=>[a*n,b*n], sub=(a,b)=>add(a,scale(b,-1)), ns=([a,b])=>a*a+b*b, sum=a=>a.reduce(add,[0,0]);
 const ceilNorm=z=>{let n=0;while(n*n<ns(z))n++;return n};
 const roots=[[1,0],[0,1],[-1,0],[0,-1]],unit=k=>roots[((k%4)+4)%4];
 const chars=Array.from({length:16},(_,j)=>[j>>3,(j>>2)&1,j&3]),val=([a,b,k],i,j,t)=>unit(2*a*i+2*b*j+k*t);
 const values=[[0,0],[1,0],[-1,0],[0,1],[0,-1],[3,4],[-3,4],[4,-3]],errors=roots.concat([[0,0]]);
 // H=C4, G=(C2)^2 x C4: exact Gaussian arithmetic, not native analytic GPsi.
 for(const psi of chars){const [a,b,k]=psi;for(let t=0;t<4;t++){ck(ns(val(psi,1,0,t))===1,"character","unit norm");ck(ns(sub(val(psi,1,0,t),mul(val(psi,1,0,0),val(psi,0,0,t))))===0,"character","phase decomposition")}
 for(let mask=0;mask<16;mask++){const T=[0,1,2,3].filter(t=>mask>>t&1),N=T.length;
 for(const g of values)for(const c of [-1,0,1]){
 const w=k===0?1:c;const z=sum(T.map(t=>val(psi,0,0,t)));const D=ceilNorm(sub(z,[w*N,0])),B=ceilNorm(g);
 for(let e=0;e<errors.length;e++){const gs=T.map(t=>add(g,errors[(e+t)%errors.length])),S=sum(T.map((t,j)=>mul(val(psi,1,0,t),gs[j])));
 if(a===0&&(b!==0||k!==0)){ck(S[0]>=w*N*g[0]-N-D*B,"kept","real part estimate")}
 // the outside branch makes no sgc0 restriction, and uses a NEGATIVE norm.
 ck(S[0]>=-N*(B+1),"outside","signed norm");
 if(a===0&&b===0&&k===0)ck(S[0]>=N*(g[0]-1),"zero","real movement");
 }
 }
 }}
 // Exact finite-set split, with true integer norms for chosen values.
 for(const step of [1,2,4]){const P=chars.filter(([a,b,k])=>k*step%4===0),allowed=P.filter(([a])=>a===0);
 for(let mask=0;mask<2**allowed.length;mask++){const K=allowed.filter((_,j)=>mask>>j&1);
 const has=u=>K.includes(u);for(const c of [-1,0,1]){const g=u=>values[chars.indexOf(u)%values.length],w=u=>u[2]===0?1:c;
 const lhs=P.reduce((s,u)=>s+(has(u)?w(u)*g(u)[0]:-ceilNorm(g(u))),0);
 const G=K.reduce((s,u)=>s+w(u)*g(u)[0],0),Sig=P.filter(u=>!has(u)).reduce((s,u)=>s+ceilNorm(g(u)),0);
 ck(lhs===G-Sig,"split","subset partition");}
 }}
 // hY loss absorption: n<=M, M*A1<=s, R=A1*s*e. No need to divide by TT.card.
 for(let n=0;n<=8;n++)for(let M=n;M<=9;M++)for(let A1=0;A1<=9;A1++)for(let s=Math.max(1,M*A1);s<=Math.max(1,M*A1)+3;s++)for(let e=1;e<=3;e++){
 const R=A1*s*e,X=s*s*e;ck(n*R<=X&&n*R<=4*X,"aggregate","one unit sufficient; source uses four");}
 // Countermodels are for individual weakened algebraic implications, not full native ArithData.
 const phase=[1,0,0],nonzeroRestrictionTrivial=[0,1,0],nonzeroA0Trivial=[0,0,2];
 ck(val(phase,0,0,0)[0]===1&&val(phase,1,0,0)[0]===-1,"negative","omit phase guard: one term GPsi=1 flips sign");
 ck(nonzeroRestrictionTrivial.some(Boolean)&&[0,1,2,3].every(t=>val(nonzeroRestrictionTrivial,0,0,t)[0]===1),"negative","nonzero psi may restrict trivially to H");
 ck(val(nonzeroA0Trivial,0,0,2)[0]===1&&val(nonzeroA0Trivial,0,0,1)[0]===-1,"negative","A0-trivial does not imply H-trivial");
 ck(-1<1,"negative","outside norm must be negative: phase -1 and GPsi=1");
 ck(0!==1,"negative","non-subset K={outside} contributes 1 to G but nothing to sum over PsiA");
 ck(1*1>0,"negative","omit h0K: cannot use kept formula on zero character");
 ck(2*3>4*1,"negative","omit cardinality/cutoff loss absorption: nR=6 exceeds 4X=4");
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0)};
}
const root=process.argv[2]; if(!root) throw Error("usage: node certificate.mjs PINNED_RH_CHECKOUT"); const files={}; for(const [p,sha] of spec){const b=fs.readFileSync(path.join(root,p));const h=crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(h!==sha)throw Error("blob mismatch "+p);files[p]=b.toString("utf8")} console.log(JSON.stringify(cert(spec,files),null,2));
