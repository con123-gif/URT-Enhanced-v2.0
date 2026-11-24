/*
RESULT: AGREE with peer regularization / line-one distinction; DISAGREE with
any extension of the punctured quotient identity to s=1 without dslope.
PARTIAL overall; SOURCE-MATCHED, not kernel-checked. 2026-11-24.
Prior audit: 61e22dcccb5d33a4946bc6b2a16ec0105160170a.
Reviewed protocol, handoff, AGENTS, research state/log/protocol, continuity,
math analytic chapter, integration spine and join audit, dependency inventory,
structure pool, specialist kernel and Landau RUN3 (blob c6b989ac4e75f700767150a3124816c3ce1813d2).
The latter already explains Mathlib's pole convention; this independent audit
adds a precise removable-point identity and counterexample regression, not a
duplicate claim of discovery.

Pinned RH and Mathlib sources: see files below; nine blobs retrieved and SHA
matched from connector. Mathlib pin recovered from RH manifest, not guessed.
Latest upstream observed bde3cce9fc2feaf9a39c7f37711cb26c7c44fd1b;
Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f uses Claim.zeta;
manifest now locks 31ce06eaadf4a200c0e1407c5f10953cf606b8f8; old poleData path
404 at latest. No semantic migration/equivalence asserted.

Three different quantities MUST NOT be conflated:
  Lean's totalized zeta(1) = (gamma_E-log(4*pi))/2 !=0;
  g(1)=1 where g=update((s-1)*zeta(s),1,1);
  g'(1)=gamma_E (Laurent constant).
The classical meromorphic zeta has a pole, not a finite value at one.
Mathlib's ZetaAsymp proves nonzero totalized value; Nonvanishing uses
riemannZeta_one_ne_zero separately at s=1. LFunction_modOne_eq is equality
of totalized functions. For admissible CharFamily, principal forces N=1;
otherwise nonprincipal LFunction_apply_one_ne_zero handles the point.
Thus the unguarded ZeroFree(F,theta) conclusion is internally legitimate at
s=1; its proof lemmaL splits Re(s)>=1 from theta<Re(s)<1. In the latter
it invokes landau_window via actual poleData and WindowHyp, not RH itself.
No analytic nonvanishing-at-a-pole statement or guard removal for arbitrary
principal characters at larger moduli is authorized.

NEW independent removable-point audit:
For entire g with g(1)!=0, c=g'(1)/g(1), k complex, N(s)=g'(s)/g(s)-s*c+k*(1-s),
N(1)=0. Source defines Phi(s)=-dslope N 1 s / s. For s!=1 it has the
punctured quotient -N(s)/(s*(s-1)); source only claims analyticity where
rho!=0 and g(rho)!=0. At 1, dslope uses the derivative, so
  Phi(1) = c^2+c+k-g''(1)/g(1).
Proof: differentiate N near 1 using g(1)!=0, then evaluate -N'(1).
For constant g=1 and k=1, all hypotheses of poleData_abstract hold:
N(s)=1-s, Phi(s)=1/s near 1 and Phi(1)=1. A naive totalized quotient
at s=1 is 0/0=0. Thus omitting the guard or replacing dslope globally
changes the function, even for a valid entire g. No contradiction with
the source, which keeps the guard. At s=0 no extension claim is made.
For the actual zeta regularization k=1, c=gamma_E; no numeric g'' input
or computed zeta value is required. The proof uses imported analytic
derivative/removable-singularity lemmas; not independently kernel verified.

Executed V8 tests: {"source":37,"polynomial":980,"punctured":4720,"branch":4,"negative":10}; polynomial cases use exact
BigInt coefficients for g(1+t)=A+B*t+C*t^2, with A!=0. P=A*g*N has zero
constant coefficient; -P'[0]/A^2 matches the analytic value.
Punctured cases skip t=0,-1 and g=0. These are algebraic regressions,
not a proof by finite testing. Mutations are source clause failures,
not Lean compilation tests. Explicit counterexample is a mathematical
control, not a claim against the original proof. No axioms discharged.
Failed attempts: local git ls-remote DNS failure; lean/lake/elan absent,
so no #print axioms; upstream latest old poleData path 404; root recursive
tree truncated. Prior Cathedral CI checkpoint 359 PASS (043409c,
run 45364009178), unrelated to this audit. Pre-write branch head f5bf62fe2b84df817e2cf8cff49a2f96d1594334.
Replay: node this_file.mjs /path/to/rh/git /path/to/mathlib/git
Reads pinned git blobs and checks blob identity before rerunning same tests.
RESUME HERE: audit the nearest-pole isolation / Cauchy radius strict
inequalities in landauWindow and its called lemmas; coordinate with Landau
specialist to check their reconstructed argument rather than duplicate it.
HANDOFF TO: integration, proof editor, landau_criterion, audit.
*/
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",ml="0df444a360eaa60ab8c11dca51a86af692955474";
const files={
  "manifest": [
    "rh",
    "lake-manifest.json",
    "b4d1ec31575a26b2159ec3a262b482bc051f3f6f"
  ],
  "family": [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean",
    "81c8dfd66d910d083d5bc88c664c7917fdbdfe96"
  ],
  "pole": [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/poleData.lean",
    "1f7fdc4409d2f1185700764c51d5c17a907d76e1"
  ],
  "lemma": [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/lemmaL.lean",
    "6c37aebd05121b6d68e3532d8529f0ce8357386f"
  ],
  "line": [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean",
    "e3aaad883b956e2d45c50bdf6d58367d6f9ef109"
  ],
  "mellin": [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/mellinGchiModOne.lean",
    "11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc"
  ],
  "asymp": [
    "ml",
    "Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean",
    "6846dc699ecd29cc8a1754c1680176210969ffd1"
  ],
  "nonvan": [
    "ml",
    "Mathlib/NumberTheory/LSeries/Nonvanishing.lean",
    "610bd56365d49c5ffa9ebeb29e0a383c768248e2"
  ],
  "cont": [
    "ml",
    "Mathlib/NumberTheory/LSeries/DirichletContinuation.lean",
    "9ccc38f52d669a88285a904e59dbb562ade5aba5"
  ]
};
const clauses={
  "family": [
    "adm : ∀ i, N i = 1 ∨ χ i ≠ 1",
    "∀ i, ∀ s : ℂ, θ < s.re → DirichletCharacter.LFunction (F.χ i) s ≠ 0"
  ],
  "pole": [
    "(hg : Differentiable ℂ g) (h1 : g 1 ≠ 0) (k : ℂ)",
    "(∀ s, s ≠ 1 → Φ s =",
    "(∀ ρ, ρ ≠ 0 → g ρ ≠ 0 → AnalyticAt ℂ Φ ρ)",
    "have hN1 : N 1 = 0",
    "fun s => -(dslope N 1 s) / s",
    "have hN : N = 1 := adm.resolve_right",
    "Function.update (fun s => (s - 1) * riemannZeta s) 1 1",
    "have hg1 : g 1 = 1",
    "continuousAt_update_same] using riemannZeta_residue_one",
    "have hderiv1 : deriv g 1 = Real.eulerMascheroniConstant",
    "tendsto_riemannZeta_sub_one_div.congr'",
    "have hgz : ∀ w : ℂ, g w ≠ 0 ↔ riemannZeta w ≠ 0",
    "exact ⟨fun _ => riemannZeta_one_ne_zero, fun _ => one_ne_zero⟩",
    "poleData_abstract g hg (by rw [hg1]; exact one_ne_zero) 1",
    "(DirichletCharacter.LFunction_apply_one_ne_zero hχ) 0",
    "have hρ1 : ρ ≠ 1"
  ],
  "lemma": [
    "(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ) (h : WindowHyp F θ δ)",
    "by_cases h1 : 1 ≤ s.re",
    "exact charFamily_LFunction_ne_zero_of_one_le_re F i s h1 hzero",
    "⟨by linarith, i, Or.inl hzero⟩"
  ],
  "line": [
    "rcases F.adm i with h | h",
    "rw [DirichletCharacter.LFunction_modOne_eq]",
    "exact riemannZeta_ne_zero_of_one_le_re hs",
    "(Or.inl h) hs"
  ],
  "mellin": [
    "(χ : DirichletCharacter ℂ 1) (s : ℂ) (hs : 1 < s.re)",
    "1 / (s - 1) + 1 - (1 + Real.eulerMascheroniConstant) * s"
  ],
  "asymp": [
    "lemma riemannZeta_one : riemannZeta 1 = (γ - log (4 * π)) / 2",
    "lemma riemannZeta_one_ne_zero : riemannZeta 1 ≠ 0",
    "Real.eulerMascheroniConstant_lt_two_thirds"
  ],
  "nonvan": [
    "rcases eq_or_ne s 1 with rfl | hs₀",
    "· exact riemannZeta_one_ne_zero",
    "LFunction_modOne_eq (χ := 1) ▸ LFunction_ne_zero_of_one_le_re _ (.inr hs₀) hs"
  ],
  "cont": [
    "lemma LFunction_modOne_eq {χ : DirichletCharacter ℂ 1}",
    "LFunction χ = riemannZeta"
  ]
};
function regression(src,clauses,ml){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 function source(s){let n=0;for(const [key,arr] of Object.entries(clauses))for(const x of arr){ck(s[key].includes(x),key+": "+x);n++}ck(JSON.parse(s.manifest).packages.find(x=>x.name==="mathlib").rev===ml,"manifest");return n+1}
 const counts={source:source(src),polynomial:0,punctured:0,branch:0,negative:0};
 // A*g*N = A*g' - B*(1+t)*g - k*A*t*g, where t=s-1.
 function mul(a,b){const c=Array(a.length+b.length-1).fill(0n);a.forEach((x,i)=>b.forEach((y,j)=>c[i+j]+=x*y));return c}
 function ev(a,t){return a.reduceRight((acc,x)=>acc*t+x,0n)}
 for(let A=1n;A<=4n;A++)for(let B=-3n;B<=3n;B++)for(let C=-3n;C<=3n;C++)for(let k=-2n;k<=2n;k++){
   const g=[A,B,C], ag=mul([A],[B,2n*C]), bg=mul([B,B],g), kg=mul([0n,k*A],g);
   const P=Array.from({length:4},(_,i)=>(ag[i]??0n)-(bg[i]??0n)-(kg[i]??0n));
   ck(P[0]===0n,"removable factor");
   ck(-P[1]===B*B+A*B+k*A*A-2n*A*C,"analytic value numerator");
   counts.polynomial++;
   for(const t of [-3n,-2n,1n,2n,3n]){
      const gt=ev(g,t);if(gt===0n)continue;
      const direct=A*(B+2n*C*t)-B*(1n+t)*gt-k*A*t*gt;
      ck(direct===t*ev(P.slice(1),t),"punctured quotient cancellation");
      ck(A*gt*(1n+t)!==0n,"denominator scope");
      counts.punctured++;
   }
 }
 for(const principal of [false,true])for(const modOne of [false,true])for(const atOne of [false,true]){
   if(modOne&&!principal)continue; // unique modulus-one character
   if(!modOne&&principal)continue; // family admissibility
   const guard=!principal||!atOne;
   ck(guard||(modOne&&atOne),"unguarded branch only modulus-one at pole");counts.branch++;
 }
 // Exact counterexample to dropping s != 1: g=1, k=1 gives N=1-s,
 // dslope(N,1,1)=-1, Phi(1)=1, but totalized quotient is 0/0=0.
 ck(1n!==0n,"counterexample");counts.negative++;
 const mutations=[
 ["pole","(∀ s, s ≠ 1 → Φ s =","(∀ s, Φ s ="],
 ["pole","Function.update (fun s => (s - 1) * riemannZeta s) 1 1","(fun s => (s - 1) * riemannZeta s)"],
 ["pole","have hg1 : g 1 = 1","have hg1 : g 1 = 0"],
 ["pole","have hderiv1 : deriv g 1 = Real.eulerMascheroniConstant","have hderiv1 : deriv g 1 = riemannZeta 1"],
 ["pole","fun s => -(dslope N 1 s) / s","fun s => -N s / (s * (s - 1))"],
 ["family","adm : ∀ i, N i = 1 ∨ χ i ≠ 1","adm : ∀ i, True"],
 ["line","exact riemannZeta_ne_zero_of_one_le_re hs","exact DirichletCharacter.LFunction_ne_zero_of_one_le_re _"],
 ["nonvan","· exact riemannZeta_one_ne_zero","· trivial"],
 ["asymp","lemma riemannZeta_one : riemannZeta 1 = (γ - log (4 * π)) / 2","lemma riemannZeta_one : riemannZeta 1 = γ"]
 ];
 for(const [key,from,to] of mutations){ck(src[key].includes(from),"mutation absent");let rejected=false;try{source({...src,[key]:src[key].split(from).join(to)})}catch{rejected=true}ck(rejected,"mutation survived");counts.negative++}
 return counts;
}
const [rhdir,mldir]=process.argv.slice(2);if(!rhdir||!mldir)throw Error('provide RH and Mathlib clones');
const src={};for(const [key,[which,path,sha]] of Object.entries(files)){const b=execFileSync('git',['-C',which==='rh'?rhdir:mldir,'show',(which==='rh'?pin:ml)+':'+path]);const got=createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(got!==sha)throw Error('blob mismatch '+path);src[key]=b.toString('utf8');}
console.log(JSON.stringify(regression(src,clauses,ml)));
