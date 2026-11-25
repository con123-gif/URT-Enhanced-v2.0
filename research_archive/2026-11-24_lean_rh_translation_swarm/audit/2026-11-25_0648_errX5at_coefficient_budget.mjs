/*
AUDIT 2026-11-25 06:48 lane — errX5at_le / core_ineq coefficient budget, SOURCE-MATCHED human proof, not kernel replay.
Pinned leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream a18a350c3e5aad997766cff2670b292313e46574 (05:32:50 UTC). Five pinned paths changed at head, ChTop original path 404. No cross-revision equivalence. All source paths, blob IDs, exact anchors below.
Continuity: read SWARM_PROTOCOL first; AGENTS, research state, runner log/protocol, continuity, handoff including simplicity pivot, CI summary #424 PASS (f6b396a, run 45559002341; not Lean replay), prior audit 0548 and latest dependency, structure, math, integration checkpoints. Reviewed factorial and principal-character peer checkpoints; no claim that this local budget supplies their tied-family/TopG/VVle assumptions. Root-level log/protocol 404 corrected to runner paths. External blueprint not reopened, no premise imported from it. Native git ls-remote failed DNS; lean/lake/elan absent. No #print axioms, global sorry absence, independent kernel or axiom closure. User-directed RH lane isolated; no physical gate or URT advantage claim.

RESULT: errX5at_le (PChain lines 613-672) follows from a finite coefficient budget plus the original scale guards. New optional sharper sufficient threshold for this LOCAL algebra alone: y >= (3814/73)(1+K)^2 h g (or integer constant 53), replacing 200 only in core_ineq/errX5at_le. Do not change pinned definitions or claim the smaller threshold is a source theorem, necessary for core_ineq, or sufficient for whole RH. The exact original conclusion is unchanged.

1. Premises: for all finite U0, W(u0) finite nonempty, Top finite, natural m,f, data D, constants C, real Xpp,eK,K, ErrWindows D C Xpp eK K and LargeX D.x D.ε K C.cHH eK, and each u0: ErrX5at(D,C,Xpp,u0) <= x^(CErr(C)*eps) ErrText(D). No choice of u0 after imposing a witness-specific threshold: the conditions are uniform. Full ErrWindows0, trace cap, ConstsBound and LargeX definitions remain exactly as pinned ErrorForms lines 23-45,52; not just their scalar abstractions below. ChTop retains IdentU, SizeData2, BNBoundsU, eT/eP etc. The inequality bounds a pointwise error, not just its mean.
2. Set y=x^eps, yD=x^(eDiv eps), yL=x^(eLoss eps), h=1+cHH, g=1+eK. From x>=1, 0<eps<=1, eDiv,eLoss,cHH,eK>=0, all y,yD,yL,h,g>=1. Seven coefficients cDiv,cE,cH,cCount,cSlope,cSl1,cLoss lie [0,K], hence K>=0. b>=1, xb<=a gives a>=b>=1. M=m>=0 and M<=x^(.5+eps/2)<=x, xM<=k and x>=1 give M<=k and Mb<=a; k>=1. nT=card Top>=1. L,La in [0,2y]; 0<=b',kb'<=a; 0<=Xpp<=a; 0<=sA=sum aT<=2nT a; B0,Nc>=0. Pointwise lW=log card W(u0)<= (k-3) log 2<=k<=a (0<=log2<=1). lk=log k in [0,g y] by k<=x^eK and log x<=y; lH=log(1+x^cHH) in [0,h y] by 1+x^cHH<=2 x^cHH. dI=(1-delBar)^(-1) in [0,2] since delBar<=1/2; no extra delBar>=0 needed for this step. et=(etaBar+4sqrt(eBar))*x^cHH*b<=K y nT a from the strong ErrWindows trace cap, NOT just separate eta/e <=1. Original eta/e nonnegative remain. KBig=200(1+K)^2 h g<=y. Positive x gives exact x^(CErr eps)=yD*yL*y^3.
3. Algebra: write r=M^2/k>=0, q=M/k in [0,1], A=nT*a, B=M*B0, N=M*Nc, E=A(1+r)+B+N=ErrText>=1, Y=yD*yL*y, P=YE. Each A,A*r,B,B+N,a,b,1 <= E, y,yD,yL,1<=Y. Expand ErrX5at using QuotientSlopeBoundsWith 37-54 and MeanBoundSecondForm 105,165-167. The following eight components plus trace are exactly the source LHS, not a dropped term list:
 T1=sA*cCount*La*(1+r) <=4KP (sA(1+r)<=2E, La<=2Y).
 T2a=cDiv*A*La <=2KP; T2b=cDiv*(B+N)*yD<=KP.
 T3=cE*B<=KP.
 T4=cSlope*A*La*(1+q)<=4KP.
 T5=lW<=P.
 T6=LoP=cLoss*nT*M*b*yL<=KP by Mb<=a.
 Tmid=cSl1*cCount*L*nT*M^2*(a/k+b')<=4K^2 P, since b'<=a/k and nT*M^2*(a/k+b')<=2Ar<=2E.
 T7=MLo5=cSl1*T6+Tmid+cSl1*Xpp+1<=(5K^2+K+1)P.
 Thus outside trace sum T1+T2a+T2b+T3+T4+T5+T6+T7 <=(5K^2+14K+2)P.
 U=UBar5+b=cSlope*A*La*(2+q)+2T3+cH*(A*La+B)+sA*cCount*lk+cSl1*B+T7+b.
 Its successive caps in units P are 6K,2K,3K,2Kg,K,5K^2+K+1,1, so U<=uP with u=5K^2+13K+2Kg+2.
 Trace dI*(4*lH*U+et)<=8h y u P+2KP: first use dI>=0 to substitute caps, then dI<=2 on the NONNEGATIVE cap; no assumption et>=0 needed in abstract core_ineq. Total <=(5K^2+16K+2)P+8h y u P <=[5K^2+16K+2+8h u] yP.
4. Since h,g>=1, u<=(5K^2+15K+2)g; hence square bracket <=(45K^2+136K+18)hg. Original source uses 200: difference from 200(1+K)^2 is 155K^2+264K+182>=0. Sharper exact polynomial identity:
 (3814/73)(1+K)^2 - (45K^2+136K+18)=(23K-50)^2/73 >=0.
 Equality K=50/23, h=g=1 proves this is optimal for the UNIFORM POLYNOMIAL ENVELOPE ONLY; integer 52 fails, 53 suffices. Under either original or sharpened sufficient y cap, bracket <= y, so total <=y^2 P=yD*yL*y^3 E=x^(CErr eps) ErrText. This is a short direct human reconstruction of source L13-207. It does not prove that the host trace cap, slope or geometric suppliers hold. No global reduction in exponent.
5. Mean-vs-pointwise warning: error_sizes L259-317 is a separate mean theorem; it uses umean log card W rather than pointwise lW. An average is not an upper bound at every u0: for two cardinalities 1 and 4 the mean log is log2 < log4. Retain pointwise uniform card bound for ChTop. No silent replacement of either definition. Dropping y cap or et cap fails even in abstract core_ineq (see exact negative tests); no countermodel claimed to all original host hypotheses. For d=3/4 the inverse is 4, not <=2.
Executed in V8: 60 source metadata and anchor assertions, exact BigInt finite tests {"counts":{"budget":22220,"sharpness":2,"guard":27648,"terms":119808,"total":9216,"negative":4},"assertions":"178898"}. Source checks compare pinned blob metadata and exact text; optional native --source recomputes Git blob hashes if network available (not executed). Finite models include fractional M/k, dI=1/2, negative abstract et/lW, zero M, saturation and slack; not full Lean host instances or proof by testing. Algebraic equality above establishes general result independently of finite grid.
RESUME HERE: independently audit the math peer's uF logarithmic envelope (2026-11-25_uf_phi_envelope.md) against LevelOfCongruence Ga_bound5 / each_unit_bound_statement, focusing on uF=0 and the 11 premises, then map precisely into ChTop. Preserve the simplicity-pivot bottleneck: the host suppliers, not 200 vs 53, are the missing mathematical mechanism.
HANDOFF TO math, integration, dependencies and audit. AGREE with pinned conditional error budget; DISAGREE with using a mean bound pointwise or dropping trace/threshold without proof; PARTIAL for optional smaller cap kernel replay, actual supplier coverage and full proof.
*/
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",upstream="leanprover-community/riemann-hypothesis";
const spec=[
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/PChain.lean",
    "57559bc6dedbabbac7365c9f31fbbab09164edca",
    [
      "lemma errX5at_le",
      "(hW : ErrWindows D C Xpp eK K) (hX : LargeX D.x D.ε K C.cHH eK) (u0 : U0)",
      "ErrX5at D C Xpp u0 ≤ D.x ^ (CErr C * D.ε) * ErrText D",
      "have hmx : (m : ℝ) ≤ D.x",
      "have hMb : (m : ℝ) * D.b ≤ D.a",
      "have hlWk : Real.log (Fintype.card (W u0) : ℝ) ≤ D.a",
      "inv_one_sub_le_two hdel",
      "(h := 1 + C.cHH) (g := 1 + eK)",
      "unfold ErrX5at UBar5 MLo5 Data.Vvar Data.LoP ErrText"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/SubThreeMulLogTwoLe.lean",
    "28ee72c3eb9d128f39780d53241ebb18ab723374",
    [
      "theorem core_ineq",
      "(hh : 1 ≤ h) (hg : 1 ≤ g) (hbig : 200 * (1 + K) ^ 2 * h * g ≤ y)",
      "sA * (cCount * (La + M ^ 2 * La / k))",
      "cSl1 * nT * M * (a / k + b') * (cCount * M * L)",
      "≤ yD * yL * y * y * y * (nT * a * (1 + M ^ 2 / k) + M * (B0 + Nc))",
      "have T1 :",
      "have T2a :",
      "have T2b :",
      "have T3 :",
      "have T4 :",
      "have T5 :",
      "have FreeQuotientRank :",
      "have Tmid :",
      "(5 * K ^ 2 + K + 1) * P",
      "(5 * K ^ 2 + 13 * K + 2 * K * g + 2) * P",
      "(5 * K ^ 2 + 16 * K + 2) + 8 * h * u",
      "(155 * K ^ 2 + 264 * K + 182) * (h * g)",
      "(5 * K ^ 2 + 14 * K + 2) * P",
      "theorem error_sizes : ErrorFormsUnderWindows",
      "umean (fun u0 => Real.log (Fintype.card (W u0) : ℝ))"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ErrorFormsWeakWindowsFalse.lean",
    "1d1d179d111b5aa668893327264648558f30fdb6",
    [
      "D.nT * D.a * (1 + (m : ℝ) ^ 2 / D.k) + (m : ℝ) * (D.B0 + D.Nc)",
      "def CErr (C : Consts) : ℝ := C.eDiv + C.eLoss + 3",
      "def KBig (K cHH eK : ℝ) : ℝ := 200 * (1 + K) ^ 2 * (1 + cHH) * (1 + eK)",
      "0 ≤ C.eDiv ∧ 0 ≤ C.eLoss ∧ 0 ≤ C.cHH",
      "1 ≤ D.x ∧ 0 < D.ε ∧ D.ε ≤ 1",
      "(m : ℝ) ≤ D.x ^ ((1 : ℝ) / 2 + D.ε / 2) ∧ D.x * m ≤ D.k",
      "(∀ t, 0 ≤ D.aT t ∧ D.aT t ≤ 2 * D.a)",
      "(∀ u0, Real.log (Fintype.card (W u0) : ℝ) ≤ (D.k - 3) * Real.log 2)",
      "(D.etaBar + 4 * Real.sqrt D.eBar) * (D.x ^ C.cHH * D.b) ≤ K * D.x ^ D.ε * (D.nT * D.a)",
      "def LargeX (x ε K cHH eK : ℝ) : Prop"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean",
    "f9f34a9147750e215a6b2f206eb6f9889aa726b6",
    [
      "def MLo5 : ℝ :=",
      "C.cSl1 * D.LoP C + C.cSl1 * D.nT * (m : ℝ) * (D.a / D.k + D.b') * (C.cCount * (m : ℝ) * D.L)",
      "def UBar5 : ℝ :=",
      "def ErrX5at (u0 : U0) : ℝ :=",
      "+ Real.log (Fintype.card (W u0) : ℝ)",
      "+ umean (fun u0 => Real.log (Fintype.card (W u0) : ℝ))",
      "(1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH) * (UBar5 D C Xpp + D.b)"
    ]
  ],
  [
    "src/Formalism/RankGapBounds/MeanBoundSecondForm.lean",
    "e4332fd8680d2b2f82e0a1e44a276453e03e2109",
    [
      "def nT (_ : Data U0 W Top m f) : ℝ := (Fintype.card Top : ℝ)",
      "def sumA : ℝ := ∑ t, D.aT t",
      "def LoP : ℝ := C.cLoss * D.nT * (m : ℝ) * D.b * D.x ^ (C.eLoss * D.ε)",
      "def Vvar : ℝ :=",
      "2 * (m : ℝ) * C.cE * D.B0 + C.cH * (D.nT * D.a * D.La + (m : ℝ) * D.B0)"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean",
    "ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5",
    [
      "have herr := errX5at_le Dd C Xpp eK K h3 h5 u",
      "have htext : ErrText Dd ≤ errorBracketSizeWindows",
      "_ ≤ _ := mul_le_mul_of_nonneg_left htext hpow"
    ]
  ]
];
function sourceChecks(spec,rows){let n=0;for(let i=0;i<spec.length;i++){const [p,sha,anchors]=spec[i],r=rows[i];if(r.sha!==sha)throw Error("blob "+p);n++;for(const a of anchors){if(!r.content.includes(a))throw Error(p+" missing "+a);n++}}return n}
function finiteTests(){
 const counts={budget:0,sharpness:0,guard:0,terms:0,total:0,negative:0};
 const ck=(b,k)=>{if(!b)throw Error(k);counts[k]++};
 const S=xs=>xs.reduce((a,b)=>a+b,0n);
 // Polynomial audit for K=p/q (q>0); h,g integer >=1.
 for(let p=0n;p<=100n;p++)for(let q=1n;q<=20n;q++){
   const R=45n*p*p+136n*p*q+18n*q*q, D=(p+q)**2n;
   ck(3814n*D-73n*R===(23n*p-50n*q)**2n,"budget");
   ck(53n*D>=R && 200n*D>=R,"budget");
   for(const h of [1n,2n,7n])for(const g of [1n,2n,11n]){
     const u=5n*p*p+(13n+2n*g)*p*q+2n*q*q;
     const v=5n*p*p+16n*p*q+2n*q*q;
     ck(v+8n*h*u<=R*h*g,"budget");
   }
 }
 const p=50n,q=23n,R=45n*p*p+136n*p*q+18n*q*q;
 ck(3814n*(p+q)**2n===73n*R,"sharpness");
 ck(52n*(p+q)**2n<R,"sharpness");
 // All LHS terms scaled by k, including trace; dI=d2/2.
 // These are abstract core_ineq models, not constructions of native hosts.
 function model(z,check=true){
   const {K,h,g,y,yD,yL,nT,a,b,bp,k,M,B,N,L,La,sA,lW,lk,lH,d2,et,X,c}=z;
   const [cd,ce,ch,cc,cs,cl,co]=c;
   const E=nT*a*(k+M*M)+k*M*(B+N),P=yD*yL*y*E;
   if(check){
     ck(y>=1n&&yD>=1n&&yL>=1n&&nT>=1n&&a>=1n&&b>=0n&&b<=a&&M>=0n&&k>0n&&M<=k&&M*b<=a,"guard");
     ck(L>=0n&&L<=2n*y&&La>=0n&&La<=2n*y&&bp>=0n&&k*bp<=a&&X>=0n&&X<=a&&sA>=0n&&sA<=2n*nT*a&&B>=0n&&N>=0n,"guard");
     ck(lW<=a&&lk>=0n&&lk<=g*y&&lH>=0n&&lH<=h*y&&d2>=0n&&d2<=4n&&et<=K*y*nT*a&&c.every(v=>v>=0n&&v<=K)&&h>=1n&&g>=1n&&53n*(1n+K)**2n*h*g<=y,"guard");
   }
   const T1=sA*cc*La*(k+M*M),T2a=k*cd*nT*a*La,T2b=k*cd*M*(B+N)*yD,T3=k*M*ce*B;
   const T4=cs*nT*a*La*(k+M),T5=k*lW,T6=k*co*nT*M*b*yL;
   const Tmid=cl*nT*M*(a+k*bp)*cc*M*L;
   const T7=cl*T6+Tmid+k*cl*X+k;
   const U=cs*nT*a*La*(2n*k+M)+2n*T3+k*ch*(nT*a*La+M*B)+k*sA*cc*lk+k*cl*M*B+T7+k*b;
   const u=5n*K*K+13n*K+2n*K*g+2n;
   const sum=S([T1,T2a,T2b,T3,T4,T5,T6,T7]),lhs2=2n*sum+d2*(4n*lH*U+k*et),rhs2=2n*y*y*P;
   if(check){
     const terms=[T1,T2a,T2b,T3,T4,T5,T6,Tmid,T7,U,k*et];
     const caps=[4n*K,2n*K,K,K,4n*K,1n,K,4n*K*K,5n*K*K+K+1n,u,K];
     for(let i=0;i<terms.length;i++)ck(terms[i]<=caps[i]*P,"terms");
     ck(sum<=(5n*K*K+14n*K+2n)*P,"terms");
     ck(lhs2<=2n*((5n*K*K+16n*K+2n)*P+8n*h*y*u*P),"terms");
     ck(lhs2<=rhs2,"total");
   }
   return {lhs2,rhs2};
 }
 for(const K of [0n,1n,2n,5n])for(const h of [1n,3n])for(const g of [1n,4n])
 for(const k of [1n,2n,5n])for(const M of new Set([0n,1n,k]))for(const nT of [1n,3n])
 for(const yD of [1n,3n])for(const yL of [1n,5n])for(const d2 of [0n,1n,4n])
 for(const mode of [0n,1n,2n]){
   const a=k+2n,b= M===0n?a:a/M,y=53n*(1n+K)**2n*h*g*(mode===2n?2n:1n);
   const full=mode!==0n, c=Array.from({length:7},(_,i)=>mode===2n&&i%2===1?0n:K);
   model({K,h,g,y,yD,yL,nT,a,b,bp:full?a/k:0n,k,M,B:full?3n:0n,N:mode===2n?7n:0n,L:full?2n*y:0n,La:2n*y,sA:full?2n*nT*a:0n,lW:full?a:-1n,lk:g*y,lH:h*y,d2,et:full?K*y*nT*a:-1n,X:full?a:0n,c});
 }
 const z={K:1n,h:1n,g:1n,y:1n,yD:1n,yL:1n,nT:1n,a:1n,b:1n,bp:1n,k:1n,M:1n,B:0n,N:0n,L:2n,La:2n,sA:2n,lW:1n,lk:1n,lH:1n,d2:4n,et:1n,X:1n,c:Array(7).fill(1n)};
 let v=model(z,false);ck(v.lhs2>v.rhs2,"negative"); // omit large y
 const y=212n;v=model({...z,y,et:1000n*y**3n},false);ck(v.lhs2>v.rhs2,"negative"); // omit trace cap
 ck(4n*4n>1n*4n,"negative"); // pointwise log 4 > mean(log 1,log 4)=log 2, exponentiate twice
 ck(4n>2n,"negative"); // del=3/4 -> inverse 4
 return {counts,assertions:S(Object.values(counts).map(BigInt)).toString()};
}
console.log(JSON.stringify(finiteTests()));
if(process.argv.includes("--source")){
 const {createHash}=await import("node:crypto"),rows=[];
 for(const [path] of spec){const r=await fetch("https://api.github.com/repos/"+upstream+"/contents/"+path+"?ref="+pin,{headers:{Accept:"application/vnd.github+json"}});if(!r.ok)throw Error(path+" "+r.status);const j=await r.json(),b=Buffer.from(j.content,"base64"),sha=createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(sha!==j.sha)throw Error("Git blob hash "+path);rows.push({sha,content:b.toString("utf8")});}
 console.log("source checks",sourceChecks(spec,rows));
}
