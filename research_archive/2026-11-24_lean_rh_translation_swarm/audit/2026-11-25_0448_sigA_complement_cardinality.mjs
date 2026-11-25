/*
AUDIT 2026-11-25 04:48 — source-matched sigA_le, exact complement cardinality refinement.
Pinned leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream head 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59; SigALe.lean original path returned 404 on default branch. No cross-revision claim.
Continuity: SWARM_PROTOCOL first, AGENTS, research state/log/protocol and continuity, HANDOFF_QUEUE; audit 0348 kept-weight, math mem_conductor_set_iff, dependencies 0412 reconciliation, structure 0424 native benchmark, integration 0400 CMBasePatch. CI #418 PASS at 3df7d31 (general checks, before this contribution). Blueprint not reopened. Original root log/protocol paths 404, corrected runner paths. Native lean/lake/elan unavailable; git ls-remote DNS failure. No kernel replay or transitive axioms/sorry verdict. Connector metadata supplied pinned blob IDs (no independent rehash in V8); source checks compare exact text anchors. The optional Node --source mode fetches pinned metadata and independently recomputes blob hashes.
REVIEW: preserve all arguments and hypotheses of sigA_le (including x>0, EAtH, HostAddCharCompatible, HostAx). Let P=PsiA(phi.A0), K=keptA(Lambda,H.raw), M=x^(1/2+eps)>0. For psi in P minus K, chr is trivial on first factor. The element iod squares to 1; its character value over C is +1 or -1. If +1, chr is in Xp and not kept; if -1, chr is in Xm. BOTH are in H.Bounded by its definition. prim_read transports the FULL complex GPsi to An.gChi of the actual primitive character; hE.bdG applies at the given x using HostRaw.isPrimOf_prim. It bounds each norm by M, not a real part or signed sum. Finset.sum_le_sum yields SigA <= |P minus K| M. Lean then drops K via sdiff_subset and card_PsiA,hE.o_eq to reach 4 Lambda.o M. No eps>0 is needed for this local theorem, though core_gm has eps>0.
Cardinality proof: projection E0 x A -> E0 x (A/A0) is surjective; kernel elements exactly (0,s) with s in A0. A character trivial there is constant on fibres since psi(a)=psi(b)psi(a-b); choose a section to construct the unique descended character, and use surjectivity for injectivity of pullback. AddChar.card_eq identifies cardinality with group order, E0 has 4 elements and Frame.index_A0_eq_o gives quotient order o. Thus |P|=4o, NOT 2o. Sign halves are equal: under the product quotient, multiply by the character (-1)^(first E0 coordinate) (chC), which is trivial on (0,A0), has value -1 at sgc0 and squares to the trivial character. This is an explicit involution between signs; |P_plus|=|P_minus|=2o. chr_bij transports plus to Xp. By hE.kept, prim_inj and chr_bij, K lies in P_plus: if p(psi) is kept, there exists theta in Xp with same primitive character, hence theta=chr(psi). Same proof gives p=prim o chr bijection K -> Lambda.KEPT (actual hKimg and hinj in gmA_eq). Since Lambda.one_mem, 1<=|K|=|Lambda.KEPT|<=2o. Consequently exact refinement (human derivation, not a new checked Lean declaration):
    SigA <= (4*Lambda.o - |Lambda.KEPT|) * M
         = (2*Lambda.o + (2*Lambda.o - |Lambda.KEPT|)) * M.
The summands count all odd and the unkept even characters respectively. This is stronger than 4o M, not 2o M or (2o-|K|)M in general. The latter fails on abstract saturating payloads. Sharpness is ONLY relative to independent per-term bounds, not asserted for actual arithmetic functions.
At core_gm, hmain (from Deduction.ch_core and gmA_eq) gives Gm<=B+SigA for B=x^(1/2+(eD+eL+6)eps). The original proof derives eD+eL>=0 from core size hypotheses, x>=1 and eps>0, so M<=B. It chooses an eventual x^eps>=1+4o, multiplies by B>=0, then uses x>0 and rpow_add. Our sharper estimate allows the sufficient eventual threshold x^eps>=1+4o-|Lambda.KEPT| with all original other thresholds/hypotheses retained. Same exponent, no new RH claim. This refinement is not needed for soundness of the original.
ReadsKept: direct textual use in ChainCoreH definition (SplitInertia) confirmed; not a theorem proving it and no root-path to that route established. Actual core_gm uses CoreAtH, not ChainCoreH. No claims about global absence. No inferred physical analogies or URT advantages.
Executed V8: {"sourceChecks":62,"groups":150,"models":5922,"counts":{"quotient":150,"partition":12294,"transport":11844,"bound":35532,"negative":6},"total":59826}. Finite exact regression on C_m x C_n, all cyclic subgroup generators, m*n<=12; exact phases modulo 2mn, exhaustive retained subsets containing trivial for <=10 optional chars; structured subsets at each size otherwise. Synthetic injective relabelling and bounded integer payloads are regression controls, NOT full HostAx models. Six negative checks target odd exclusion, 2o bound, subset, injectivity, norm-vs-signed sum, and explicit saturating bound. Source checks count metadata receipts and substring anchors; not elaborated proof refs. Re-run node file.mjs; node file.mjs --source additionally checks source via REST (network required).
RESUME HERE: independently audit the preceding core_gm exponent comparison and construction of LargeX from hLX and C.cHH <= cHH, including the CErr bound and sign conditions; identify exact fields w1,w2,heD,heL and supplier definitions. Do not assert a kernel path for ChainCoreH unless exported.
HANDOFF TO math, dependencies, integration, audit. AGREE pinned conditional sigA_le; DISAGREE omission of odd branch or invalid cardinality shrink; PARTIAL new human strengthening/kernel/full proof.
*/
const pin="40e56bab026552e089d7afcfeff08d2defb9c005", repo="leanprover-community/riemann-hypothesis";
const spec=[
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/SigALe.lean",
    "e9c80e2017ec149ac559bc20c184b9264b9ec0c2",
    [
      "theorem UpperTheory.Comparison₂.sigA_le",
      "0 < x →",
      "EAtH Λ H.toHostRaw TT x eps C → HostAddCharCompatible H.toHostRaw ell",
      "have hT := character_trivial_first_factor φ ψ h",
      "mul_self_eq_one_iff.mp hv",
      "· left",
      "· right",
      "exact hE.bdG",
      "Finset.sum_le_sum hb",
      "Finset.sum_const, nsmul_eq_mul",
      "Finset.card_le_card Finset.sdiff_subset",
      "rw [card_PsiA, hE.o_eq]"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean",
    "3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d",
    [
      "have hs := sigA_le",
      "rw [gmA_eq Λ φ H TT _ _ C ell hE hell] at hmain",
      "1 + 4 * (Λ.o : ℝ)",
      "0 ≤ eD + eL",
      "rw [h2]"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CardPsiA.lean",
    "4fe4ded735dd1ba55db3a01fc181ad794a2c4a0a",
    [
      "Function.Surjective π",
      "Function.surjInv hπ",
      "π (x - y) = 0",
      "AddChar.card_eq",
      "AddSubgroup.index_eq_card",
      "(PsiA φ.A0).card = 4 * φ.o"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/GmAEq.lean",
    "2f1a763f43d65eea1f6e61018c8b70c02d2dfa03",
    [
      "have hXp : ∀ ψ",
      "have hKimg : Λ.KEPT",
      "have hinj : Set.InjOn",
      "hE.kept p hp",
      "hbij.1 (hpinj h)"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/ChrBij.lean",
    "cc28de6e8170b10950d5caaf20e1ac31ac319070",
    [
      "chr φ ψ ∈ φ.Xp ↔ (ψ ∈ PsiA φ.A0 ∧ ψ sgc0 = 1)"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/PrimInj.lean",
    "5720fe0139394b6e9d8c688b36ae2d6f5af10478",
    [
      "Function.Injective H.toHostRaw.prim",
      "HostDer.art_surj H.der g"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/PrimRead.lean",
    "3960cf3e7d166f6664405a0d5fcb995924621ffb",
    [
      "∀ y, GPsi (arith H.toHostRaw) ell ψ y = An.gChi",
      "HostAddCharCompatible H.toHostRaw ell",
      "∀ n : ℕ, n ≠ 0"
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean",
    "599699b5b35f6fb7bf2ab94f5f0c577b14f35ea1",
    [
      "def Xp : Set φ.Char",
      "def Xm : Set φ.Char",
      "def Bounded (S : Finset PChar) : Set φ.Char := {θ | (θ ∈ φ.Xp ∧ ¬ H.Kept S θ) ∨ θ ∈ φ.Xm}",
      "def BoundedCharsPointwise",
      "‖An.gChi χ x‖ ≤ x ^ ((1 : ℝ) / 2 + eps)"
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean",
    "ed60b4b997cd4703713660b185b9e43fd95559a1",
    [
      "o_eq : φ.o = Λ.o",
      "kept : H.KeptInXp Λ.KEPT",
      "bdG : H.BoundedCharsPointwise Λ.KEPT x eps"
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/FrameFacts.lean",
    "22402e8349688ace18526a8fc486eb659a5e7450",
    [
      "theorem index_A0_eq_o : φ.A0.index = φ.o"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4",
    [
      "def PsiA",
      "def SigA",
      "‖GPsi D ell ψ y‖",
      "def ReadsKept",
      "def ChainCoreH",
      "∧ ReadsKept T D ell Kp ∧"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "GmA D ell Kp c x ≤ x ^ ((1 : ℝ) / 2 + (C + 3) * ε) + SigA"
    ]
  ]
];
function checkAnchors(spec,rows){let n=0; for(let i=0;i<spec.length;i++){let [path,sha,anchors]=spec[i]; let r=rows[i];if(r.sha!==sha)throw Error("sha "+path);n++;for(const a of anchors){if(!r.content.includes(a))throw Error(path+" missing "+a);n++}}return n}
function finiteTests(){
 const c={quotient:0,partition:0,transport:0,bound:0,negative:0};const ck=(v,k)=>{if(!v)throw Error(k);c[k]++};
 let models=0,groups=0;
 const range=n=>Array.from({length:n},(_,i)=>i);
 for(let m=1;m<=6;m++)for(let n=1;n<=6;n++)if(m*n<=12){
  const A=range(m*n).map(i=>[Math.floor(i/n),i%n]);
  const all=range(4*m*n).map(i=>[Math.floor(i/(2*m*n)),Math.floor(i/(m*n))%2,...A[i%(m*n)]]);
  const modulus=2*m*n;
  const phase=(ch,g)=>(m*n*(ch[0]*g[0]+ch[1]*g[1])+2*n*ch[2]*g[2]+2*m*ch[3]*g[3])%modulus;
  for(const [u,v] of A){
   const subgroup=new Map();
   for(let t=0;t<m*n;t++){let a=[t*u%m,t*v%n];subgroup.set(a.join(","),a)}
   const o=m*n/subgroup.size; groups++;
   const P=all.map((_,i)=>i).filter(i=>[...subgroup.values()].every(([a,b])=>phase(all[i],[0,0,a,b])===0));
   const ev=P.filter(i=>phase(all[i],[1,0,0,0])===0), od=P.filter(i=>phase(all[i],[1,0,0,0])===modulus/2);
   ck(P.length===4*o,"quotient");ck(ev.length===2*o&&od.length===2*o,"partition");
   ck(P.every(i=>ev.includes(i)!==od.includes(i)),"partition");
   ck(ev.every(i=>od.includes(i+2*m*n)),"partition");
   // Keep exhaustive subsets if small; for larger sets test structured subsets of every size, including full.
   const tail=ev.filter(i=>i!==0);
   const subsets=tail.length<=10?range(2**tail.length).map(mask=>[0,...tail.filter((_,j)=>(mask>>j)&1)]):range(tail.length+1).flatMap(k=>[[0,...tail.slice(0,k)],[0,...tail.slice(tail.length-k)]]);
   for(const K of subsets){
    models++;const keep=new Set(K),img=new Set(K.map(i=>all.length-1-i));
    const comp=P.filter(i=>!keep.has(i));
    const bounded=P.filter(i=>od.includes(i)||(ev.includes(i)&&!keep.has(i)));
    ck(comp.length===4*o-img.size,"transport");ck(comp.length===od.length+ev.length-K.length,"partition");
    ck(comp.length===bounded.length&&comp.every((v,i)=>v===bounded[i]),"partition");
    ck(img.size===K.length&&K.every(i=>ev.includes(i)),"transport");
    for(const M of [0,1,7]) {
     const sum=comp.reduce((s,i)=>s+((i*13+K.length)%(M+1)),0);
     ck(sum<=(4*o-K.length)*M&&sum<=4*o*M,"bound");
     // Every summand may reach M in the abstract inequality; exact sharpness in this model.
     ck(comp.reduce(s=>s+M,0)===(4*o-img.size)*M,"bound");
    }
   }
  }
 }
 // Explicit local countermodels, not full arithmetic host models.
 const P=[0,1,2,3], ev=[0,1],od=[2,3],K=[0],comp=P.filter(i=>!K.includes(i));
 ck(comp.some(i=>od.includes(i)&&!ev.includes(i)),"negative"); // even-only Bounded misses odd
 ck(comp.length>2-K.length,"negative"); // 2o-|K| undercounts
 const outside=[0,4];ck(P.filter(i=>!outside.includes(i)).length>4-outside.length,"negative");
 const collapse=new Set([0,0]);ck(collapse.size!==2,"negative"); // injectivity necessary to replace size
 const weights=[1,1,-3];ck(weights.reduce((a,b)=>a+b,0)!==weights.reduce((a,b)=>a+Math.abs(b),0),"negative"); // signed sum not norm sum
 const sum=comp.length*7;ck(sum>0&&sum> (2-1)*7,"negative");
 return {groups,models,counts:c,total:Object.values(c).reduce((a,b)=>a+b,0)}
}
console.log(JSON.stringify(finiteTests()));
if(process.argv.includes("--source")){
 const {createHash}=await import("node:crypto"); const rows=[];
 for(const [p,sha] of spec){const r=await fetch("https://api.github.com/repos/"+repo+"/contents/"+p+"?ref="+pin,{headers:{Accept:"application/vnd.github+json"}});if(!r.ok)throw Error(p+" "+r.status);const j=await r.json();const b=Buffer.from(j.content,"base64");const h=createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(h!==j.sha)throw Error("hash "+p);rows.push({sha:h,content:b.toString("utf8")});}console.log("source assertions",checkAnchors(spec,rows));}
