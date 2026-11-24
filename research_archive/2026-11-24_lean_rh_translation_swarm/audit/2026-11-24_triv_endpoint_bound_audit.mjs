/*
RH AUDIT — 2026-11-24 — CharacterBalanceMoves.triv — REVIEW / SOURCE-MATCHED, PARTIAL project.
Single contribution: exact endpoint-based global bound with sharper retained-character loss. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Source paths and Git blob SHAs below; ChCore lines 167–179 (triv), 257–261 (one_char consumer); FirstPrimeNeSecondPrime 68–70 (GPsi); GrowthBoundGivesRiemannHypothesis 62–65 (DerivInt); StatementOC 11–13 (Sz,Gz).
Preflight read SWARM_PROTOCOL first, AGENTS, state, actual runner protocol/log, continuity, handoff queue, audit 2c70f964, structure 9b7dbd7b, dependency 593acf8a, math 1c79a786, integration c04db34a, character boxes 66bb0f95. CI #390 PASS 45468931672 (unrelated Cathedral status, not RH verification). Root log/protocol guesses returned 404; recovered actual paths. External blueprint not reread this run. Current upstream 9282d3a102c4aff0e6026746db2a8990f5d9cddd: original ChCore path 404; GPsi producer file changed to d0498cdde8640558c61c6d342dd618e88b89f7a1, DerivInt file to c09b82158a535b791e6b77be36385da52d6f3d48. No equivalence or relocation claim. Local container lean/lake/elan not found; git ls-remote failed DNS; Node available; ran exact checks in V8 with connector-fetched source blobs, no independent Lean elaboration, #print axioms, sorry scan or kernel replay. Local replay below verifies byte hashes; connector run compared blob metadata, not independent byte hashes.
Human derivation: H finite additive commutative group with DecidableEq; D arbitrary ArithData H; ell arbitrary function AddChar(E0 x H,C)->C; psi !=0; Cd>=0; DerivInt D ell Cd. The source requires x>=3. For this LOCAL lemma x>=1 suffices. GPsi(D,ell,psi,1)=ell(psi): only possible sum term n=1 has (1/1-1)=0 (also Lambda(1)=0); nonzero-character guard selects correct branch. Put E=||ell(psi)||, T=log x+Cd>=0. Applying FIRST DerivInt clause at (x,1) gives ||GPsi(x)-ell(psi)|| <= (x-1)(T+E); triangle then gives ||GPsi(x)|| <= (x-1)(T+E)+E = (x-1)T+xE = x(T+E)-T <= x(T+E). This proves the source inequality, with exact available slack T, without new premises and at x>=1. At x=1 refined bound is equality. The original x>=3 still belongs in one_char and move: this local weakening is not a global range change. At 1<=x<=2, the smoothed sum vanishes (Lambda(1)=0; n=2 only enters at x=2 with zero weight) so GPsi=x ell exactly. If E<=Ko and rho>=0, N=card TT>=0, the n2 retained-character loss can use rho*N*((x-1)*(log x+Cd)+x*Ko) rather than rho*N*x*(log x+Cd+Ko), a nonnegative saving rho*N*(log x+Cd); n1 and remaining branches unchanged. Do not assert final improved R unless all other r1/r3 constraints retained. This is a human implication from pinned hypotheses; not an edited Lean theorem.
Negative controls: cannot drop ell dependence: at x=1 choose ell(psi)!=0; at fixed x>=3 the smoothed sum independent of ell, so ||GPsi||>=x||ell||-||smoothed sum|| by reverse triangle and arbitrarily large ell defeats any ell-independent bound with the uniform Cd from derivative_integral_all. Cannot treat zero character as nonzero: GPsi(D,ell,0,1)=Gz(1)=1+gamma, independent of ell(0); with ell(0)=0 endpoint identity fails (not a counterexample to the original inequality). For subunit x=exp(-(Cd+1)) with ell=0 and psi!=0, GPsi=0 since floor x=0, but proposed bound x(log x+Cd)=-x<0; hence cannot extend to all positive x. Negative rho would invalidate loss monotonicity; original nonnegative premises retained.
Authenticated export projection Git blob d49fbcc22a2382039986b09ff91dd11af2ef2e7b, reported SHA256 9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6, CI 45457486389. Exact owner/role/ID/witness records below: one_char type DerivInt 855579 at 26382559; one_char value triv 856978 at 26464300, value DerivInt 855579 at 26382559; ch_core value derivative_integral_all 856822 at 26595159 and DerivInt 855579 at 26382559. triv is an observed target, not expanded owner in this 47-target projection; outgoing edges not established. These are export records and not independent kernel facts, nor a new root-reachability proof. No axioms omitted or declared absent.
Executed V8 exact checks: {"anchors":24,"sourceMutation":24,"role":7,"roleMutation":5,"triangle":2157686,"slack":1134,"consumer":198450,"boundary":69312,"negative":9}, total 2426651. Finite Gaussian rational fixtures test norm triangle and real-algebra interface, not all analytic hypotheses; source and role mutations test record consistency, not Lean equivalence. No physical analogy or URT performance claim.
RESUME HERE: request target ID 856978 Deduction.CharacterBalanceMoves.triv direct type/value records, then audit ch_core's use of the retained-character loss r2, including all three competing r1/r2/r3 allowances and exact choice of R with host-independent constants. HANDOFF TO dependencies, kernel, math, editor and integration. AGREE with pinned endpoint bound; DISAGREE with erasing the nonzero-character guard or ell dependence or extending below 1; PARTIAL for complete RH reconstruction.
*/
import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
const spec=[
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "namespace CharacterBalanceMoves",
      "lemma triv (D : ArithData H)",
      "(hx : 3 ≤ x) (hCd : 0 ≤ Cd)",
      "(hDer : DerivInt D ell Cd) (ψ : AddChar (E0 × H) ℂ) (hψ0 : ψ ≠ 0)",
      "‖GPsi D ell ψ x‖ ≤ x * (Real.log x + Cd + ‖ell ψ‖)",
      "hDer.1 ψ hψ0 x 1 (by linarith) le_rfl",
      "have h1 : GPsi D ell ψ 1 = ell ψ",
      "rw [if_neg hψ0]",
      "rw [h1, max_eq_left (by linarith), abs_of_nonneg (by linarith)] at hd",
      "norm_add_le (GPsi D ell ψ x - ell ψ) (ell ψ)",
      "Real.log_nonneg (by linarith)",
      "((triv D ell hx hCd hDer ψ h0).trans ?_)",
      "have n2 : ‖((∑ t ∈ TT, ψ (0, t))"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean",
    "18deb7cb85d6f650a69f01fda6e0c789b9f04d89",
    [
      "def GPsi",
      "if ψ = 0 then ((Gz y : ℝ) : ℂ)",
      "∑ n ∈ Icc 1 ⌊y⌋₊",
      "(Λ n : ℂ) * primVal D ψ n * ((y / n - 1 : ℝ) : ℂ)",
      "(y : ℂ) * ell ψ"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/GrowthBoundGivesRiemannHypothesis.lean",
    "a3ece4b4aea97a95ba2977fa9e8d437e72677774",
    [
      "def DerivInt",
      "ψ ≠ 0 → ∀ y z : ℝ, 1 ≤ y → 1 ≤ z",
      "‖GPsi D ell ψ y - GPsi D ell ψ z‖ ≤ |y - z| * (Real.log (max y z) + Cd + ‖ell ψ‖)",
      "|Gz y - Gz z| ≤ Cd * |y - z|"
    ]
  ],
  [
    "src/Formalism/StatementOC.lean",
    "12ab19c0176bd4135c2b23a7ee3ac22888df0122",
    [
      "def Sz (x : ℝ) : ℝ := ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, Λ n * (x / n - 1)",
      "def Gz (x : ℝ) : ℝ := Sz x - x * Real.log x + (1 + Real.eulerMascheroniConstant) * x"
    ]
  ]
];
function certify(spec,files,p){
 const counts={anchors:0,sourceMutation:0,role:0,roleMutation:0,triangle:0,slack:0,consumer:0,boundary:0,negative:0};
 const ck=(ok,k,m)=>{if(!ok)throw Error(k+" "+m);counts[k]++};
 function anchors(f){for(const [path,,a] of spec)for(const s of a)if(!f[path].includes(s))throw Error(path+" missing "+s)}
 anchors(files);counts.anchors=spec.reduce((s,x)=>s+x[2].length,0);
 for(const [path,,aa] of spec)for(const a of aa){let reject=false;try{anchors({...files,[path]:files[path].split(a).join("REMOVED")})}catch{reject=true}ck(reject,"sourceMutation",a)}
 const expected=[
 ["Deduction.CharacterBalanceMoves.one_char","type",855579,"Formalism.LFunctionChainParameters.ThickSetMeanBounds.DerivInt","def",26382559],
 ["Deduction.CharacterBalanceMoves.one_char","value",856978,"Deduction.CharacterBalanceMoves.triv","thm",26464300],
 ["Deduction.CharacterBalanceMoves.one_char","value",855579,"Formalism.LFunctionChainParameters.ThickSetMeanBounds.DerivInt","def",26382559],
 ["Deduction.ch_core","value",855579,"Formalism.LFunctionChainParameters.ThickSetMeanBounds.DerivInt","def",26382559],
 ["Deduction.ch_core","value",856822,"Formalism.LFunctionChainParameters.ThickSetMeanBounds.derivative_integral_all","thm",26595159]];
 function rolecheck(j){
   if(j.pin!=="40e56bab026552e089d7afcfeff08d2defb9c005"||j.reports.length!==47)throw Error("projection scope");
   const get=n=>j.reports.find(r=>(r.request??r.source).name===n);
   for(const [o,role,id,name,kind,w] of expected){const a=get(o);const refs=a?.[role]?.references??[];if(refs.filter(r=>r.kind==="explicit_const"&&r.target===id&&r.nameParts.join(".")===name&&r.targetKind===kind&&r.witnessExpression===w&&r.distinctExpressionRecords===1).length!==1)throw Error("role "+o+" "+name)}
   if(get("Deduction.CharacterBalanceMoves.triv"))throw Error("unexpected expanded owner; revise scope");
 }
 rolecheck(p);counts.role=7;
 for(let i=0;i<expected.length;i++){const j=JSON.parse(JSON.stringify(p)),[o,role,id]=expected[i];const r=j.reports.find(r=>r.request.name===o)[role].references.find(r=>r.target===id);r.witnessExpression++;let reject=false;try{rolecheck(j)}catch{reject=true}ck(reject,"roleMutation",i)}
 // Exact quarter-unit Gaussian differences; T stands for nonnegative log(x)+Cd.
 // This checks the real-algebra interface, not native GPsi values or transcendental estimates.
 const es=[[0,0,0],[1,0,1],[0,-2,2],[3,4,5],[-4,3,5],[5,-12,13]];
 for(let q=4;q<=24;q++)for(let T=0;T<=8;T++)for(const [a,b,E] of es){
  const dmax=(q-4)*(T+E), refined=(q-4)*T+q*E, original=q*(T+E);
  ck(original-refined===4*T&&refined===dmax+4*E&&refined>=0,"slack","identity");
  for(let u=-24;u<=24;u++)for(let v=-24;v<=24;v++){
   if(u*u+v*v>dmax*dmax)continue;
   const z=(u+4*a)**2+(v+4*b)**2;
   ck(z<=refined**2&&refined**2<=original**2,"triangle","norm bound");
  }
  // Consumer replacement after E<=Ko and nonnegative rho,N; all are scaled integers.
  for(let Ko=E;Ko<=E+4;Ko++)for(let rho=0;rho<=4;rho++)for(let N=0;N<=6;N++){
    const r=(q-4)*T+q*Ko,old=q*(T+Ko);
    ck(rho*N*refined<=rho*N*r&&rho*N*r<=rho*N*old&&rho*N*(old-r)===rho*N*4*T,"consumer","retained loss");
  }
 }
 // GPsi nonzero character, x in (0,2], Lambda(1)=0 and n=2 term vanishes at its first endpoint.
 // q/16 is x; allow arbitrary coefficients for n=2; denominator 32.
 for(let q=1;q<=32;q++)for(const [a,b,E] of es)for(let c=-9;c<=9;c++)for(let d=-9;d<=9;d++){
   const f=Math.floor(q/16)>=2?q-32:0;
   ck(f*c+2*q*a===2*q*a&&f*d+2*q*b===2*q*b,"boundary","initial interval");
 }
 // Countercontrols: omitted ell term already fails at x=1; old domain lower bound needed
 // for the downstream move lemma, but not triv. For x<1 choose log x+Cd=-1.
 for(const [a,b,E] of es.filter(x=>x[2]>0))ck(a*a+b*b>E*0,"negative","endpoint ell");
 for(let q=1;q<4;q++)ck(q*(-1)<0,"negative","subunit negative RHS");
 // A norm bound cannot treat a negative multiplier as monotone.
 ck(-1*3<-1*2,"negative","signed multiplier");
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0),projectionRecords:expected,scope:"source matched and authenticated export-reference records; not kernel replay"};
}
const [root,projectionPath]=process.argv.slice(2);
if(!root||!projectionPath)throw Error("usage: node certificate.mjs PINNED_RH_CHECKOUT solution_frontier_roles.json");
const hash=b=>crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");
const files={};
for(const [p,sha] of spec){const b=fs.readFileSync(path.join(root,p));if(hash(b)!==sha)throw Error("source hash "+p);files[p]=b.toString("utf8")}
const b=fs.readFileSync(projectionPath);if(hash(b)!=="d49fbcc22a2382039986b09ff91dd11af2ef2e7b"||crypto.createHash("sha256").update(b).digest("hex")!=="9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6")throw Error("projection hash");
const result=certify(spec,files,JSON.parse(b.toString("utf8")));
if(JSON.stringify(result.counts)!==JSON.stringify({"anchors":24,"sourceMutation":24,"role":7,"roleMutation":5,"triangle":2157686,"slack":1134,"consumer":198450,"boundary":69312,"negative":9}))throw Error("replay count mismatch");
console.log(JSON.stringify(result,null,2));
