/*
RH AUDIT — 2026-11-24 — REVIEW / SOURCE-MATCHED — PARTIAL overall.
One contribution: exact normalization and sign/cancellation guards in Deduction.CharacterBalanceMoves.sum_Th -> core -> ch_core.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Latest upstream observed 1da818b50f1e18808db2792b9dc735bda8cb84d8; old ChCore path returns 404 there; no equivalence assumed. Connector verified reported Git blob IDs below; independent byte hashes available in CLI replay, not run here.
Preflight: SWARM_PROTOCOL first, AGENTS, state, runner log/protocol, continuity, HANDOFF_QUEUE, recent audit/math/dependency/structure/integration checkpoints. Root protocol/log paths 404; actual runner files retrieved. Cathedral checkpoint 381 PASS (45437036754), not RH verification. External blueprint not reread. Local command -v lean/lake and ~/.elan/bin yielded no executable. No independent Lean #print axioms, sorry or kernel replay. Peer export reference closure is not independent kernel checking.
Derivation (ChCore lines 18–73, 283–338, 343–442): write n=|H|>0, q=|A0|>0 (identity), r=|T2|, B=PhiSet. E0=(Z/2)^2 and InPhi fixes first coordinate to zero, hence B has 2*n elements (not 4*n, nor |A0|); independently follows from bijection (second bit,h)->((0,bit),h). Balance.card_G_eq and phiSet_card_ne_zero corroborate. Exact imported lemma phiSet_card producer not separately located; source call verified. delta2=r/n. For psi trivial on 0 x A0, psi(-e1(s+u-t))=psi(e1 t) since e1 has order-two first coordinate and s,u in A0. Otherwise restriction to A0 is nontrivial and sum over u is zero by orthogonality (translation by a point with nonunit character value, or Lean's AddChar.sum_eq_zero_iff_ne_zero). GPsi(D,ell,psi,y) and b independent of u and s. Thus sum_Th=q*b*r/(2*n) times sum over PsiA of psi(e1 t)*GPsi. No b positivity or T2 nonemptiness required for the equality. Empty T2 gives zero; do not divide by r here. In core, hu provides bound Err+2*|TT|*m*b/x per u. Sum over all q subgroup elements then commute finite sums, take real parts, and use sum_Th to obtain q*K*U <= q*R where K=m*b*r/(2*n), U=sum_t Re(sum_PsiA), R=Err+2*|TT|*m*b/x. Cancel q>0, not n and not an extra average. hY: |TT|*Y<=U. Since K>=0 (m,r nonnegative and b>0), obtain K*|TT|*Y<=R even if Y negative. core retains HostFactsS, SizesA, ThinScales, CostWindows, hT2 and hTop; this algebra alone does not establish hu. ch_core chooses uniform Cd and cutoff after C,eps,CE,Ko,c,M before H,D and windows. CharsA, one_char, sum_vv give hY for Y=GmA-SigA-4*x^(1/2+eps); retain those premises, not proved here. ch_core passes hT2 and hY to core then hW to proposition_size_bound. Only in SizeWindows is r/n>=x^(-eps)>0, and |TT|,m,b>0, so downstream division by Q and delta is licensed. Preserve signed G, SigA and all original predicates. No physics analogy or URT claim.
Counterexamples: H=Z/2, A0=H, T2={0}, b=1, only trivial character GPsi=1 gives sum_Th=1/2, full group normalizer gives 1/4, extra averaging by q gives 1/4. H=Z/8, A0={0,4}, T2={0}: r/n=1/8, not r/q=1/2. Core alone permits zero prefactor (e.g. m=0 or T2 empty in the algebra), so 0*Y<=R cannot bound Y; this is a countermodel to the weakened inference, not a full native host. Negative K reverses inequality. Exact polynomial tests below in Q[X]/Phi_l for cyclic finite group fixtures check each character coefficient, not approximated complex values or a substitute for a native Lean proof.
Executed in V8 with connector-fetched pinned source: {"counts":{"source":39,"cardinality":8,"cyclotomic":34,"coefficient":113152,"inequality":151200,"negative":7,"mutation":11},"total":264451}.
Failed attempts: default-branch code search for phiSet_card returned empty; current old ChCore path 404. No kernel binaries. No independent raw-byte hash during V8 run; CLI can replay against pinned checkout. Mutation tests are anchor-loss controls, not a semantic proof checker.
RESUME HERE: audit CharacterBalanceMoves.one_char and sum_vv -> hY, especially psi=0 vs restriction-trivial, Kp membership, the sgc0 phase guard, and signed outside-Kp norm. HANDOFF TO math, editor, dependency, integration, kernel. AGREE with source-matched normalization; DISAGREE with weakened denominators or cancellation guards; PARTIAL overall.
*/
import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
const spec=[
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "(1 / ((PhiSet (H := H)).card : ℂ))",
      "ψ (-(e1 (s + u0 - t)))",
      "(hT2 : ∀ s ∈ T2, s ∈ A0)",
      "sum_A A0 _ s t (hT2 s hs)",
      "Finset.sum_const, nsmul_eq_mul, phiSet_card",
      "Fintype.card_ne_zero",
      "unfold delta2",
      "field_simp",
      "have hA : (0 : ℝ) < Fintype.card A0",
      "sum_Th A0 D ell T2 hT2",
      "le_of_mul_le_mul_left h1 hA",
      "have h4 : 0 ≤ (m : ℝ) * b * (delta2 T2 / 2)",
      "mul_le_mul_of_nonneg_left hY h4",
      "set G : ℝ := GmA D ell Kp c x - SigA D ell A0 Kp x",
      "CharacterBalanceMoves.core A0 D S hHost ell N TT T2 a w hx3 hb hS hThin hCost hT2 hTop hY",
      "proposition_size_bound _ _ _ _ _ _ _ _ _ _ _ G hW hc'"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4",
    [
      "def PsiA",
      "∀ s ∈ A0, ψ (0, s) = 1",
      "def GmA",
      "def SigA",
      "def CharsA",
      "ψ ∈ PsiA A0 ∧ ψ sgc0 = 1"
    ]
  ],
  [
    "src/Formalism/ThickAverageLoss/PartnersToFactorsAt.lean",
    "d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af",
    [
      "abbrev E0 := ZMod 2 × ZMod 2",
      "def InPhi (g : E0 × H) : Prop := g.1.1 = 0",
      "def PhiSet : Finset (E0 × H) := univ.filter InPhi"
    ]
  ],
  [
    "src/Formalism/ThickAverageLoss/ThickAverageProofs/Balance.lean",
    "c3acda6e44e220280f69723ae7b876912ac6b3c9",
    [
      "lemma card_G_eq : (Fintype.card (E0 × H) : ℂ) = 2 * ((PhiSet (H := H)).card : ℂ)",
      "lemma phiSet_card_ne_zero : ((PhiSet (H := H)).card : ℂ) ≠ 0"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/GrowthBoundGivesRiemannHypothesis.lean",
    "a3ece4b4aea97a95ba2977fa9e8d437e72677774",
    [
      "def delta2 (T2 : Finset H) : ℝ := (T2.card : ℝ) / (Fintype.card H : ℝ)",
      "def SizeWindows",
      "x ^ (-ε) ≤ (nT2 : ℝ) / n",
      "def GrowthSizeBound",
      "(((nT2 : ℝ) / n) / 2)"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/SChain.lean",
    "a4bc8cecac40a1f5fd307661e151639aaf6a6efa",
    [
      "def RestSize",
      "x ^ (-ε) ≤ (nT2 : ℝ) / n",
      "x ^ ((1 : ℝ) / 2 - ε) ≤ m"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LipschitzWeightAndMinimum.lean",
    "4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b",
    [
      "theorem proposition_size_bound : GrowthSizeBound",
      "have hQ : 0 < (nT : ℝ) * m * b",
      "have hδ0 : 0 < δ := lt_of_lt_of_le (pos _) hd2",
      "le_of_mul_le_mul_left h1 hQ"
    ]
  ]
];
function certificate(spec,files){
 const counts={source:0,cardinality:0,cyclotomic:0,coefficient:0,inequality:0,negative:0,mutation:0};
 function ck(v,k,msg){if(!v)throw Error(k+": "+msg);counts[k]++}
 function anchors(f){for(const [p,sha,ss] of spec)for(const a of ss)ck(f[p].includes(a),"source",p+" "+a)}
 anchors(files);
 const trim=a=>{while(a.length>1&&!a[a.length-1])a.pop();return a};
 function div(a,b){a=trim([...a]);const q=Array(Math.max(1,a.length-b.length+1)).fill(0);
  while(a.length>=b.length&&a.some(Boolean)){const d=a.length-b.length,c=a[a.length-1];q[d]=c;for(let j=0;j<b.length;j++)a[d+j]-=c*b[j];trim(a)}return [trim(q),a]}
 const phi={};for(let l=1;l<=16;l++){let p=Array(l+1).fill(0);p[0]=-1;p[l]=1;
  for(let d=1;d<l;d++)if(l%d===0){const [q,r]=div(p,phi[d]);ck(r.every(x=>x===0),"cyclotomic","exact division");p=q}phi[l]=p}
 const mod=(a,n)=>((a%n)+n)%n;
 const zero=(p,l)=>div(p,phi[l])[1].every(x=>x===0);
 // In G=(Z/2)^2 x Z/n, character (a,c,k) evaluated at (i,j,h)
 // is X^((a*i+c*j)*l/2+k*h*l/n), X primitive l-th root.
 for(let n=1;n<=8;n++){const l=n%2?2*n:n;
  let card=0;for(let i=0;i<2;i++)for(let j=0;j<2;j++)for(let h=0;h<n;h++)if(i===0)card++;
  ck(card===2*n,"cardinality","PhiSet");
  for(let step=1;step<=n;step++)if(n%step===0){const A=Array.from({length:n/step},(_,i)=>i*step);
   for(let mask=0;mask<2**A.length;mask++){const T=A.filter((_,i)=>(mask>>i)&1);
    for(let t=0;t<n;t++)for(let a=0;a<2;a++)for(let c=0;c<2;c++)for(let k=0;k<n;k++){
     const p=Array(l).fill(0);for(const s of T)for(const u of A)p[mod(-a*l/2-k*(s+u-t)*l/n,l)]++;
     const trivial=A.every(u=>(k*u)%n===0);
     if(trivial)p[mod(a*l/2+k*t*l/n,l)]-=A.length*T.length;
     // denominator 2*n on BOTH sides; arbitrary common scalar b and
     // arbitrary character-specific GPsi multiply the identity.
     ck(zero(p,l),"coefficient",JSON.stringify({n,step,mask,t,a,c,k}));
    }
   }
  }
 }
 // exact cross-multiplied inequality chain; includes zeros and signed Y.
 // choose integer U=sum Re, L=TT.card*Y<=U; b>=0; R scaled to 2*n
 for(let n=1;n<=9;n++)for(let a0=1;a0<=n;a0++)for(let r=0;r<=a0;r++)for(let m=0;m<=4;m++)for(let b=0;b<=3;b++)for(let L=-4;L<=4;L++)for(let d=0;d<=3;d++){
   const U=L+d,K=m*b*r,R=K*U+1;
   ck(a0*K*U<=a0*R && K*L<=R,"inequality","positive cancellation and nonnegative scaling");
 }
 // Concrete weakened implications: full group rather than PhiSet normalization,
 // normalizing by A0 twice, replacing delta2 with density in A0,
 // dividing by zero in the local core, allowing a negative multiplier.
 ck(4*2!==2*2,"negative","full group vs PhiSet (H=Z/2)");
 ck(2*1*2!==1*1*2,"negative","double averaging A0");
 ck(1*8!==1*2,"negative","density in A0 instead of H (n=8,a0=2,r=1)");
 ck(0*123===0*0&&123>0,"negative","zero factor gives no bound");
 ck(1<=2&&-1>-2,"negative","negative multiplier reverses");
 ck(0*3<=0*1&&3>1,"negative","zero denominator cannot cancel");
 ck(-2<=-1&&2*(-2)<=2*(-1),"negative","signed Y is permitted");
 // Each selected unique anchor is necessary to the source assertion checker.
 const picks=[0,3,4,6,8,9,10,11,12,14,15];for(const j of picks){const [p,,ss]=spec[0],a=ss[j];const f=files[p].split(a).join("REMOVED");ck(!f.includes(a),"mutation",a)}
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0)};
}
const root=process.argv[2];if(!root)throw Error("usage: node certificate.mjs PINNED_UPSTREAM_CHECKOUT");const files={};for(const [p,sha] of spec){const b=fs.readFileSync(path.join(root,p));const h=crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(h!==sha)throw Error("blob mismatch "+p);files[p]=b.toString("utf8")}console.log(JSON.stringify(certificate(spec,files),null,2));
