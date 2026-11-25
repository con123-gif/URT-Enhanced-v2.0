/*
AUDIT 2026-11-25 — core_gm LargeX, exponent and eventual threshold transport.
Pinned leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005; latest observed upstream a18a350c3e5aad997766cff2670b292313e46574. CoreGm.lean at latest pin returned 404, ErrorFormsWeakWindowsFalse and SubThreeMulLogTwoLe changed blobs to a5629b4543f3491643a6f17d62e65518f079ca73 and 81fb91ded7eba569c0893cde61175bf55ae25ea1. No cross-revision equivalence asserted. Working branch base observed 28b8abb1a8973ff2021cc67ceae5675687827c99.
Continuity: read SWARM_PROTOCOL first, AGENTS, research state, runner protocol/log, continuity, HANDOFF_QUEUE; prior audit 0448, peer structure 0524, dependency 0512, math factor-through monotonicity and integration 0500 checkpoints; latest peer commits reviewed. Cathedral CI checkpoint 421 PASS at 7d17c3c (not Lean proof verification). Research log/protocol at root returned 404, corrected to runner paths. Blueprint not reopened; this is direct pinned source review, no external blueprint premise. Native git ls-remote failed DNS; lean/lake/elan not on PATH. No #print axioms, kernel graph, global sorry absence, or full proof claim. No physical analogies/URT advantage.
REVIEW (SOURCE-MATCHED, human derivation, not a new Lean theorem):
CoreGm L12-15: for EVERY Level Lambda and real eD,eL,K,cHH,eK,C,eps with eps>0, exists x1 depending only on these fixed parameters, for every real x>=x1 and all Frame phi, HostAx H and finite TT, IF EAtH and CoreAtH, then Lambda.Gm x <= x^(1/2+(eD+eL+7)eps). The threshold precedes all host witnesses. Do not move it after phi,H,TT or assume the witnesses exist for all x. C (analytic error coefficient, CE argument to ch_core) is not local Cc:Consts nor the nonnegative first ch_core exponent max(eD+eL,0)+3.
CoreAtH supplies equalities Dd.x=x and Dd.eps=eps, heD:Cc.eDiv<=eD, heL:Cc.eLoss<=eL, hcHH:Cc.cHH<=cHH, hcov:every s in A0 has a preimage u under tr; plus compatible ell, IdentU, SizeData2, ErrWindows, BNBoundsU, SizesA, ThinScales, CostWindows, RestSize and T2 subset A0, including all existential types, finiteness, nonempty W, and equivalences. None are removed. EAtH separate. CoreGm L30-37 destructures these; ErrWindows0 in ErrorForms L28-41 maps w1:1<=x; w2:0<eps; w3:eps<=1 (LOCAL, not an extra global eps restriction); w4:1<=b; w5:x*b<=a; w6:1<=nT; w7:m<=x^(1/2+eps/2); w8:x*m<=k; w9:0<=eK; w10:1<=k; w11:k<=x^eK; w12:k<=a. w13..27 and wEta remain in hWin for ch_top. ConstsBound L23-26 has seven paired coefficient bounds c1..14 and c15:0<=Cc.eDiv,c16:0<=Cc.eLoss,c17:0<=Cc.cHH. Therefore eD,eL>=0 CONDITIONALLY, not from the theorem's initial universally quantified reals. This explains initial max(eD+eL,0), and rewrite at L47 only AFTER extracting hCore.
LargeX L38-41: log x<=x^eps unchanged. Set A=200(1+K)^2>=0. KBig(K,cHH,eK)-KBig(K,Cc.cHH,eK)=A(cHH-Cc.cHH)(1+eK)>=0 from hcHH and w9; hence the uniform cap for cHH implies the witness-specific cap. No need to assume K>=0 for this monotonicity; other original K constraints remain. The original supplier large_x_eventually (SubThreeMulLogTwoLe L319-330) uses log=o(x^eps) and x^eps->infinity with eps>0, NOT just eventual divergence of the log. It is valid even for arbitrary fixed real K,cHH,eK.
CErr L51-54: CErr(Cc)=Cc.eDiv+Cc.eLoss+3<=eD+eL+3. Multiplying by eps>=0 preserves order; x>=1 makes positive-base rpow monotone. The bracket is nonnegative from x>0,b>0,k>0,a>=0 and nonnegative natural cardinalities; a>=0 follows w5 and x*b>0. All denominators used in the human fraction rewriting are positive: n=|phi.A|>=1 as a group, k>=1, x^(-eps)>0. Then ch_top pointwise gap for tr(v) <= x^(CErr(Cc)*eps)*bracket <= x^((eD+eL+3)*eps)*bracket. The coverage hcov supplies a v for EVERY u in A0, so ch_core receives its universally quantified pointwise premise; no inversion/injectivity of tr required. The bound is on gap, not its absolute value. All other ch_top and ch_core arguments unchanged.
Final absorption L61-74: write d=eD+eL>=0, M=x^(1/2+eps), B=x^(1/2+(d+6)eps)>0. From gmA_eq/ch_core and sigA_le: Gm<=B+SigA<=B+4o*M <=(1+4o)B <= x^eps B=x^(1/2+(d+7)eps). The intermediate exponent difference is (d+5)eps>=0. The final product law needs x>0. The last inequality requires x^eps>=1+4o, supplied uniformly by x3. Nat o>=0. No absorption at fixed arbitrary x.
Optional explicit threshold for the SAME uniform x2 and x3 (human proof, not kernel replay): set T=max(1,2/eps), Q=max(1,KBig(K,cHH,eK),1+4o). For x>=max(1,T^(2/eps),Q^(1/eps)), y=x^(eps/2)>=T. Then log x=(2/eps)log y <=(2/eps)(y-1)<= (2/eps)y<=y^2=x^eps. Also x^eps>=Q. This yields both uniform LargeX and absorption. Still take max with the independent x1 from ch_core: this is NOT an explicit total proof threshold. All original input premises remain.
Negative controls: local order reversal with 1+eK<0 (not a countermodel to full LargeX under all other guards); wrong hcHH direction, missing cap transport, x<1, negative eps, premature max substitution, negative bracket, missing absorption threshold, eps=0. These are local algebra controls not full admissible HostAx counterexamples. No necessity/minimality of every guard claimed. In particular x>=1 is used for monotonicity, x>0 for the power product.
Executed in V8: source checks (pinned blob metadata receipt + exact textual anchors) 66, finite tests {"counts":{"transport":1125,"exponents":7500,"bracket":135000,"absorption":25000,"threshold":45540,"negative":9},"total":214174}. All finite tests use integer BigInt algebra; rational eps=1/q and perfect-power bases x=t^(2q) give exact powers; log inequality proven analytically above, test only rational upper bound. Bracket test uses positive denominator clearing. Optional Node --source independently checks Git blob hashes and exact anchors; network required; not executed natively this run. No independent kernel replay.
RESUME HERE: audit actual errX5at_le in PChain.lean L614ff, reconstruct its coefficient-budget inequalities and verify the CErr/KBig normalization against ErrorFormsWeakWindowsFalse.lean without reusing the final transport as proof of its supplier.
HANDOFF TO math, audit, integration, dependencies. AGREE with source-matched conditional core_gm transport; DISAGREE with treating eD,eL as unconditional or host-specific threshold as uniform without cap proof; PARTIAL for kernel, explicit threshold formalization and full proof.
*/
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",upstream="leanprover-community/riemann-hypothesis";
const spec=[
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean",
    "3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d",
    [
      "∀ (Λ : Level) (eD eL K cHH eK C eps : ℝ), 0 < eps → ∃ x1 : ℝ",
      "EAtH Λ H.toHostRaw TT x eps C → CoreAtH H.toHostRaw TT eD eL K cHH eK eps x",
      "max (eD + eL) 0 + 3",
      "large_x_eventually eps K cHH eK heps",
      "max x₁ (max x₂ x₃)",
      "subst hxx hε",
      "have hWin' := hWin",
      "have hLX' : LargeX Dd.x Dd.ε K Cc.cHH eK",
      "mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left",
      "have hE0 : 0 ≤ eD + eL",
      "rw [max_eq_left hE0] at hx₁",
      "Real.rpow_le_rpow_of_exponent_le w1 (mul_le_mul_of_nonneg_right ?_ w2.le)",
      "obtain ⟨v, rfl⟩ := hcov u hu",
      "hId hLed hWin hBN hLX' v",
      "mul_le_mul_of_nonneg_right hExp hBr",
      "rw [gmA_eq",
      "have hs := sigA_le",
      "(eD + eL + 3 + 3)",
      "Real.rpow_add hx0",
      "1 + 4 * (Λ.o : ℝ)"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreAtH.lean",
    "0ba3621036f19146e7e67fa9c0e8a1c38661a097",
    [
      "HostAddCharCompatible H ell ∧ Dd.x = x ∧ Dd.ε = eps ∧ C.eDiv ≤ eD ∧ C.eLoss ≤ eL ∧ C.cHH ≤ cHH",
      "(∀ s ∈ φ.A0, ∃ u, tr u = s)",
      "SizeData₂ Dd C Xpp ∧ ErrWindows Dd C Xpp eK K ∧ BNBoundsU Dd T2",
      "ThinScales (arith H) ell X' θ",
      "CostWindows x (fPl φ.A) Dd.b η θ",
      "RestSize eps x",
      "∀ s ∈ T2, s ∈ φ.A0"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ErrorFormsWeakWindowsFalse.lean",
    "1d1d179d111b5aa668893327264648558f30fdb6",
    [
      "def CErr (C : Consts) : ℝ := C.eDiv + C.eLoss + 3",
      "def KBig (K cHH eK : ℝ) : ℝ := 200 * (1 + K) ^ 2 * (1 + cHH) * (1 + eK)",
      "0 ≤ C.eDiv ∧ 0 ≤ C.eLoss ∧ 0 ≤ C.cHH",
      "1 ≤ D.x ∧ 0 < D.ε ∧ D.ε ≤ 1",
      "1 ≤ D.b ∧ D.x * D.b ≤ D.a",
      "0 ≤ eK ∧ 1 ≤ D.k ∧ D.k ≤ D.x ^ eK",
      "(m : ℝ) ≤ D.x ^ ((1 : ℝ) / 2 + D.ε / 2) ∧ D.x * m ≤ D.k",
      "ErrWindows0 D C Xpp eK K ∧",
      "(D.etaBar + 4 * Real.sqrt D.eBar)",
      "def LargeX (x ε K cHH eK : ℝ) : Prop := Real.log x ≤ x ^ ε ∧ KBig K cHH eK ≤ x ^ ε",
      "∀ ε K cHH eK : ℝ, 0 < ε → ∃ x₀",
      "(nT : ℝ) * aE * (1 + (m : ℝ) ^ 2 / k)",
      "nT2 * k * b * x ^ ε / (n * (n * x ^ (-ε)))"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/SubThreeMulLogTwoLe.lean",
    "28ee72c3eb9d128f39780d53241ebb18ab723374",
    [
      "theorem large_x_eventually : LargeXEv",
      "isLittleO_log_rpow_atTop hε",
      "tendsto_rpow_atTop hε",
      "Filter.eventually_atTop.1 (h1.and h2)"
    ]
  ],
  [
    "src/Formalism/RankGapBounds/MeanBoundSecondForm.lean",
    "e4332fd8680d2b2f82e0a1e44a276453e03e2109",
    [
      "structure Consts where",
      "eDiv : ℝ",
      "eLoss : ℝ",
      "cHH : ℝ"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean",
    "ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5",
    [
      "(h5 : LargeX Dd.x Dd.ε K C.cHH eK)",
      "each_unit_bound_statement",
      "errX5at_le Dd C Xpp eK K h3 h5 u",
      "mul_le_mul_of_nonneg_left htext hpow"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "theorem ch_core (C ε CE Ko c M : ℝ) (hC : 0 ≤ C) (hε : 0 < ε) (hc : |c| ≤ 1)",
      "GmA D ell Kp c x ≤ x ^ ((1 : ℝ) / 2 + (C + 3) * ε) + SigA",
      "(∀ u ∈ A0, gapA D N ell TT a w u ≤ x ^ (C * ε)",
      "refine ⟨max 3 (max x₁ x₂)"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/SigALe.lean",
    "e9c80e2017ec149ac559bc20c184b9264b9ec0c2",
    [
      "theorem UpperTheory.Comparison₂.sigA_le",
      "rw [card_PsiA, hE.o_eq]"
    ]
  ]
];
function sourceTests(spec,rows){let n=0;for(let i=0;i<spec.length;i++){const [p,h,anchors]=spec[i],r=rows[i];if(r.sha!==h)throw Error("blob "+p);n++;for(const a of anchors){if(!r.content.includes(a))throw Error(p+" missing "+a);n++}}return n}
function finiteTests(){
 const c={transport:0,exponents:0,bracket:0,absorption:0,threshold:0,negative:0};
 const ck=(v,k)=>{if(!v)throw Error(k);c[k]++};
 const kb=(K,h,e)=>200n*(1n+K)**2n*(1n+h)*(1n+e);
 const seq=n=>Array.from({length:n},(_,i)=>BigInt(i));
 // All arithmetic is exact. x=t^(2q), eps=1/q; thus x^eps=t^2.
 for(const K of seq(5))for(const h of seq(5))for(const H of seq(5))if(h<=H)for(const e of seq(5)){
   ck(kb(K,h,e)<=kb(K,H,e),"transport");
   for(const a of [kb(K,H,e),kb(K,H,e)+1n])ck(kb(K,h,e)<=a,"transport");
 }
 for(const q of [1n,2n,3n,4n,6n])for(const t of [1n,2n,3n,8n,20n]){
   const X=t**(2n*q), E=t*t;
   for(const d of seq(4))for(const l of seq(4))for(const D of seq(4))if(d<=D)for(const L of seq(4))if(l<=L){
     const P=t**(2n*(d+l+3n)),Q=t**(2n*(D+L+3n)),M=t**(q+2n),B=t**(q+2n*(D+L+6n)),Y=t**(q+2n*(D+L+7n));
     ck(D+L>=0n&&P<=Q,"exponents");ck(M<=B,"exponents");ck(Y===E*B,"exponents");
     for(const o of seq(10))if(E>=1n+4n*o){
       ck(B+4n*o*M<=B+4n*o*B,"absorption");
       ck(B+4n*o*B<=Y,"absorption");
     }
     // Bracket transport after positive-denominator clearing.
     // Bk = nT*a*(1+m^2/k)+m*(2*n*m*b*E+nT2*k*b*E^2/n^2).
     for(const n of [1n,2n,5n])for(const nT of [0n,1n,3n])for(const nT2 of [0n,1n])for(const m of [0n,1n,2n]){
       const b=2n,k=X*(m+1n),a=X*b,den=k*n*n;
       const num=nT*a*(k+m*m)*n*n+m*(2n*n*m*b*E*den+nT2*k*b*E*E*k);
       ck(den>0n&&num>=0n&&P*num<=Q*num,"bracket");
     }
   }
 }
 // Explicit shared x2/x3 bound for eps=1/q on perfect power inputs:
 // log(x)=2q log(t) <= 2q*t <= t^2 if t>=2q; first inequality is analytic, not an evaluated log.
 for(const q of [1n,2n,3n,4n,6n,10n])for(const t of [20n,40n,100n,200n,500n,1000n])if(t>=2n*q)
 for(const K of seq(4))for(const H of seq(4))for(const e of seq(4))for(const o of seq(10)){
   const E=t*t;if(E>=kb(K,H,e)&&E>=1n+4n*o){
     ck(2n*q*t<=E,"threshold");ck(E>=kb(K,H,e),"threshold");ck(E>=1n+4n*o,"threshold");
   }
 }
 // Negative controls are local algebra counterexamples, NOT admissible complete host models.
 ck(kb(0n,0n,-2n)>kb(0n,1n,-2n),"negative"); // order reversal if 1+eK<0
 ck(kb(0n,2n,0n)>kb(0n,1n,0n),"negative"); // wrong direction of hcHH
 ck(kb(0n,2n,0n)>400n && kb(0n,1n,0n)<=400n,"negative"); // LargeX cap fails without hcHH
 ck(1n*4n>1n*2n,"negative"); // x=1/2: x^1 > x^2, compare over denom 4
 ck(2n>1n,"negative"); // eps=-1, x=2: x^-1 > x^-2, compare over denom 4
 ck(-2n+1n<0n,"negative"); // dropping nonnegative local eDiv/eLoss makes max substitution invalid
 ck(2n*(-1n)>3n*(-1n),"negative"); // negative bracket reverses power comparison
 ck(1n+4n*1n>4n,"negative"); // local cap: B=1, M=1, E=4; B+4o*M>EB
 ck(2n**2n>2n**1n,"negative"); // eps=0 cannot absorb a fixed 4 with x^eps=1
 return {counts:c,total:Object.values(c).reduce((s,x)=>s+x,0)}
}
console.log(JSON.stringify(finiteTests()));
if(process.argv.includes("--source")){
 const {createHash}=await import("node:crypto");const rows=[];
 for(const [p] of spec){const r=await fetch("https://api.github.com/repos/"+upstream+"/contents/"+p+"?ref="+pin,{headers:{Accept:"application/vnd.github+json"}});if(!r.ok)throw Error(p+" "+r.status);const j=await r.json();const b=Buffer.from(j.content,"base64");const h=createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(h!==j.sha)throw Error("blob hash "+p);rows.push({sha:h,content:b.toString("utf8")});}
 console.log("source checks",sourceTests(spec,rows));
}
