/*
AUDIT lane 2026-11-25 — actual kept-character weight transport, not a kernel proof.
SOURCE-MATCHED + exact finite linear-form audit. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Prior audit dfb499342c461f1fdbe3555f09680ec57ed4c4b5 requested ReadsKept.
Read SWARM_PROTOCOL first, AGENTS, research state/log/protocol excerpts, continuity, handoff, latest peer commit patches (math e2ce836, dependencies b7b2208, structure 898c3d4, integration 8a6c269), CI #415 PASS for b7b2208 only. External blueprint not reopened. Current upstream fcb6eac7534875d32d68030967e2deae6d686151: GmAEq original path 404; SplitInertia blob changed to cb31619e10acc3effdeec94e10c89abba559f78d. Do not mix revisions.
Result: ReadsKept is a predicate, NOT a proved transport or evidence it is used. Direct consumer of that predicate not located: default-branch code search returned no matches; a broad batch exceeded connector call limit. The actual inspected core_gm calls gmA_eq and sigA_le; gmA_eq uses EAtH, HostAddCharCompatible and HostAx, not a ReadsKept argument. No claim of global nonreachability or equality of the DType/Level routes.
Human derivation of gmA_eq lines 61-149: let J=keptA, K=Lambda.KEPT and p(psi)=H.prim(chr phi psi). By chr_bij and prim_inj (Artin surjectivity), p is injective; hE.kept supplies a frame-character witness for every p in K, so p maps J bijectively onto K. For psi in J its image lies in Xp; hence it is trivial on A0 and evaluates 1 on sgc0. Under this sign condition the characters trivial on ALL of A=phi.A are precisely 0 and psC (two remaining signs, with the other fixed); chC is not psC. Let e=p(psC), t=p(0)=PChar.one. ExceptionalCharacterKept has BOTH implications: some q means q is the primitive character of phi.psC, none excludes that exceptional character from K. Thus for p in K, psK=some p iff p=e, using injectivity and the none clause. The trivial character separately has unit weight even if psK is none. For c=(3*Lambda.o+1)^(-1), wtA(c,psi) = 1 if p(psi)=t or psK=some p(psi), and c otherwise. This is a coefficientwise identity, so the finite sums agree for arbitrary real payloads transported by p. prim_read supplies equality of the FULL complex GPsi and An.gChi for every real y, via HostAddCharCompatible and the primitive character comparison on n!=0, plus special handling of psi=0. Take real parts only after this equality. Finset.sum_image uses injectivity; then erase PChar.one and use Lambda.one_mem, Gz_eq, and the trivial gChi branch. This proves precisely the conditional human version of gmA_eq; all original HostAx, EAtH and HostAddCharCompatible hypotheses remain, even if not all fields used in this subproof.
ReadsKept itself has rd injective only ON T.KEPT, Kp=image, value equality for nonzero naturals, rd=0 iff PC.one, kappa only for non-one, and the exceptional-or-trivial biconditional for each retained xi. Do not replace by global injectivity or infer a global map from the predicate. The n=0 guard cannot in general extend: primVal is a product over primeFactors, empty at 0 (value 1), while a nontrivial primitive Dirichlet character e.g. mod 3 has chi(0)=0. This is a local definitional obstruction, not a constructed full HostAx counterexample. The actual sum Icc 1 floor(y) never uses n=0. Do not drop positive-integer restriction. 
Controls: cyclic H=C_m, m=1..6, every subgroup d|m, every retained subset satisfying Xp and containing zero; exact phase residues (no floating arithmetic), bijective synthetic relabelling ONLY as finite algebra regression, scaled weights on every basis vector, not a model of the full RH hypotheses. Negative controls show why local premises matter; no physical claims or URT advantage. 
Executed in tool V8: {"sourceCount":90,"models":2788,"count":{"phase":406,"transport":116950,"negative":7,"zero":34},"total":117397}. Source anchors and mutation checks use exact connector-provided blob IDs; no independent Git hash recomputation. Native shell: lean and lake absent, git ls-remote DNS failure; no kernel term or #print axioms. No transitive axiom/sorry statement. Run node thisfile.mjs (finite tests); node thisfile.mjs --source (also fetch pinned source via GitHub REST, network required). No unrelated Cathedral changes.
RESUME HERE: trace actual core_gm -> sigA_le bounded complement, especially the odd sign branch and 4*Lambda.o cardinal bound; independently locate direct ChainCoreH/ReadsKept consumers in pinned dependency evidence before attributing their use.
HANDOFF TO math, dependencies, integration, audit. Verdict AGREE conditional gmA_eq; DISAGREE dropping exceptional/zero/nonzero guards; PARTIAL for ReadsKept reachability and full human reconstruction.
*/
const pin="40e56bab026552e089d7afcfeff08d2defb9c005";
const repo="leanprover-community/riemann-hypothesis";
const spec=[
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4",
    [
      "Set.InjOn rd T.KEPT",
      "Kp = T.KEPT.image rd",
      "∀ n : ℕ, n ≠ 0",
      "rd ξ = 0 ↔ ξ = PC.one",
      "T.psK = some ξ ∨ ξ = PC.one ↔ rd ξ = psC ∨ rd ξ = 0"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/GmAEq.lean",
    "2f1a763f43d65eea1f6e61018c8b70c02d2dfa03",
    [
      "theorem UpperTheory.Comparison₂.gmA_eq",
      "EAtH Λ H.toHostRaw TT x eps C → HostAddCharCompatible H.toHostRaw ell → ∀ y",
      "have hKimg : Λ.KEPT",
      "have hinj : Set.InjOn",
      "have hiod : chr φ ψ φ.iod = 1",
      "obtain ⟨hps1, hps2⟩ := hE.ps",
      "prim_read φ H ell hell ψ",
      "Finset.sum_image hinj",
      "Λ.one_mem"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/PrimRead.lean",
    "3960cf3e7d166f6664405a0d5fcb995924621ffb",
    [
      "HostAddCharCompatible H.toHostRaw ell",
      "∀ n : ℕ, n ≠ 0",
      "have hn0 : n ≠ 0",
      "prim_read_max y n hn",
      "HostDer.art_surj H.der"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/PrimInj.lean",
    "5720fe0139394b6e9d8c688b36ae2d6f5af10478",
    [
      "Function.Injective H.toHostRaw.prim",
      "HostDer.art_surj H.der g",
      "H.toHostRaw.prim 1 = PChar.one"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/ChrBij.lean",
    "cc28de6e8170b10950d5caaf20e1ac31ac319070",
    [
      "chr φ psC = φ.psC",
      "chr φ ψ ∈ φ.Xp ↔ (ψ ∈ PsiA φ.A0 ∧ ψ sgc0 = 1)"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreAtH.lean",
    "0ba3621036f19146e7e67fa9c0e8a1c38661a097",
    [
      "ψ ≠ 0 → ∀ (N : ℕ) [NeZero N]",
      "χ.IsPrimitive",
      "def keptA",
      "def pcEquiv"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean",
    "3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d",
    [
      "theorem UpperTheory.Comparison₂.core_gm",
      "rw [gmA_eq Λ φ H TT _ _ C ell hE hell] at hmain",
      "have hs := sigA_le"
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean",
    "599699b5b35f6fb7bf2ab94f5f0c577b14f35ea1",
    [
      "def ExceptionalCharacterKept",
      "psK = some ψ → H.IsPrimOf φ.psC ψ.χ",
      "psK = none → ¬ H.Kept S φ.psC"
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean",
    "ed60b4b997cd4703713660b185b9e43fd95559a1",
    [
      "def Nt : Finset PChar := Λ.KEPT.erase PChar.one",
      "def wt (ψ : PChar)",
      "ps : H.ExceptionalCharacterKept Λ.KEPT Λ.psK"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean",
    "18deb7cb85d6f650a69f01fda6e0c789b9f04d89",
    [
      "def sgc0 : E0 × H := ((1, 0), 0)",
      "∏ p ∈ n.primeFactors",
      "∑ n ∈ Icc 1 ⌊y⌋₊"
    ]
  ]
];
function checkSource(spec, rows) {
 let count=0; const a=(v,m)=>{if(!v)throw Error(m);count++};
 for(let i=0;i<spec.length;i++){
  const [p,sha,anchors]=spec[i],r=rows[i];
  a(r.sha===sha,p+" blob");
  for(const s of anchors){a(r.content.includes(s),p+" "+s);a(!r.content.replaceAll(s,"__AUDIT_MUTATION__").includes(s),p+" mutation")}
 }
 return count;
}
function finiteTests() {
 const count={phase:0,transport:0,negative:0,zero:0};const a=(v,k)=>{if(!v)throw Error("failed "+k);count[k]++};
 let models=0;
 for(let m=1;m<=6;m++){
  const chars=Array.from({length:4*m},(_,i)=>[Math.floor(i/(2*m)),Math.floor(i/m)%2,i%m]);
  const phase=(c,g)=>(m*(c[0]*g[0]+c[1]*g[1])+2*c[2]*g[2])%(2*m);
  const sg=[1,0,0], z=0, ps=m;
  for(let j=0;j<chars.length;j++){
   const c=chars[j], htriv=Array.from({length:m},(_,h)=>phase(c,[0,0,h])===0).every(Boolean);
   if(phase(c,sg)===0)a(htriv===(j===z||j===ps),"phase");
   for(let h=0;h<m;h++)a(phase(c,[0,0,h])===0===((c[2]*h)%m===0),"phase");
  }
  for(let d=1;d<=m;d++)if(m%d===0){
   const A0=Array.from({length:m/d},(_,i)=>i*d);
   const allowed=chars.map((c,j)=>j).filter(j=>phase(chars[j],sg)===0&&A0.every(h=>phase(chars[j],[0,0,h])===0));
   const rest=allowed.filter(j=>j!==0);
   const p=j=>4*m-1-j; // injective relabelling, not an actual Artin map
   const den=3*d+1; 
   for(let mask=0;mask<2**rest.length;mask++){
    const K=[0,...rest.filter((_,i)=>(mask>>i)&1)], image=K.map(p),flag=K.includes(ps)?p(ps):null;
    models++;
    a(new Set(image).size===K.length,"transport");
    for(const j of K){
     a((j===0)===(p(j)===p(0)),"transport");
     a((j===0||j===ps)===(p(j)===p(0)||p(j)===flag),"transport");
     a((chars[j][2]===0?den:1)===(p(j)===p(0)||p(j)===flag?den:1),"transport");
    }
    // Compare coefficients of every basis vector: proves equality of the two linear forms for arbitrary payloads.
    for(let j=0;j<4*m;j++){
     const lhs=K.includes(j)?(chars[j][2]===0?den:1):0;
     const rhs=p(j)===p(0)?den:image.includes(p(j))?(p(j)===flag?den:1):0;
     a(lhs===rhs,"transport");
    }
   }
  }
 }
 // Independent explicit counterexamples for proposed omitted premises; local algebra models, not full HostAx countermodels.
 const den=4;
 a(den!==1,"negative"); // exceptional retained, flag missing: unit vs 1/4
 a(1!==den,"negative"); // nonexceptional falsely flagged: 1/4 vs unit
 a(den!==1,"negative"); // trivial term with raw Level.wt, flag none
 a(2!==1,"negative"); // noninjective collapse of two unit-weight payloads into one
 a(1!==0,"negative"); // omit image coverage: a missing basis vector
 const firstSign=(i,j)=>i,secondSign=(i,j)=>j;
 a(firstSign(1,0)!==secondSign(1,0),"negative"); // chC not psC
 a(firstSign(0,1)===0&&secondSign(0,1)===1,"negative");
 // chi modulo 3: primitive nontrivial real Dirichlet character, chi(0)=0.
 const chi=n=>[0,1,-1][n%3]; const primeFactors=n=>{let out=[];for(let p=2;p<=n;p++)if(n%p===0){out.push(p);while(n%p===0)n/=p}return out};
 a(chi(0)===0,"zero");a(primeFactors(0).length===0,"zero");a(primeFactors(0).reduce((v,p)=>v*p,1)===1,"zero");a(chi(0)!==1,"zero");
 for(let n=1;n<=30;n++)a(chi(n)===primeFactors(n).reduce((v,p)=>{let k=n,e=0;while(k%p===0){e++;k/=p}return v*chi(p)**e},1),"zero");
 return {models,count,total:Object.values(count).reduce((a,b)=>a+b,0)};
}
console.log(JSON.stringify(finiteTests()));
if(process.argv.includes("--source")){
 const rows=[];for(const [p] of spec){const r=await fetch("https://api.github.com/repos/"+repo+"/contents/"+p+"?ref="+pin,{headers:{Accept:"application/vnd.github+json"}});if(!r.ok)throw Error(p+" "+r.status);const j=await r.json();rows.push({sha:j.sha,content:Buffer.from(j.content,"base64").toString("utf8")});}console.log("source assertions",checkSource(spec,rows));}
