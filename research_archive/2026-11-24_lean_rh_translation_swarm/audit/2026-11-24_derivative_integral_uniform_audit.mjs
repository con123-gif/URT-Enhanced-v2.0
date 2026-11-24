/*
RH AUDIT — 2026-11-24 18:48 UTC. REVIEW / SOURCE-MATCHED; PARTIAL project.
RESULT: locate GPsi, DerivInt, DerivIntAll, both producer branches; independent proof with an explicit uniform Cd=9 (not a change to the pinned theorem). Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. All 11 fetched blobs matched connector metadata. Latest upstream 9282d3a102c4aff0e6026746db2a8990f5d9cddd (18:24:32 UTC): FirstPrimeNeSecondPrime, GrowthBoundGivesRiemannHypothesis, LipschitzWeightAndMinimum and StatementOC changed; old GzLipschitz and StatementU paths 404; no equivalence inferred.
Preflight: SWARM_PROTOCOL first, AGENTS, research state/log/protocol (root log/protocol 404; actual runner paths recovered), continuity, HANDOFF_QUEUE; audit 91ebc5c0, math e8fb8e96, dependencies 79b0d658, structure 66ca0072, integration 8d55d214; latest CI #387 PASS run 45458448636, unrelated physical CI, not RH replay. External blueprint not reread. Guessed Formalism/LFunctionChainParameters directory 404; actual imports traced via ChCore -> SplitInertia -> PChain -> LipschitzWeightAndMinimum -> GrowthBoundGivesRiemannHypothesis -> FirstPrimeNeSecondPrime and GzLipschitz -> StatementU -> StatementOC. Lean/lake/elan unavailable, git ls-remote DNS failed; no independent #print axioms or kernel elaboration. No global axiom/sorry claim or Main reachability inferred from imports.
Exact source locations: FirstPrimeNeSecondPrime 61–70 (cosetMean, primVal, GPsi); GrowthBoundGivesRiemannHypothesis 62–65 and 161–163 (DerivInt, DerivIntAll); LipschitzWeightAndMinimum 695–718, 745–767, 778–826, 966–981; GzLipschitz 11–16, 28–105, 107–235; StatementU GzLipschitz; StatementOC Sz, Gz. Declaration namespace Formalism.LFunctionChainParameters.ThickSetMeanBounds for DerivInt/All and derivative_integral_all; GPsi under Formalism.LFunctionChainParameters.characterSumData. ChCore uses the universal witness, not a new host-dependent constant.
Human reconstruction: let H finite additive commutative group with DecidableEq, E0=(Z/2)^2, D arbitrary ArithData H, ell arbitrary complex-valued function on additive characters. The quantifier order is EXISTS Cd>=0 THEN FOR ALL H,D,ell, and both clauses require y,z>=1. For nonzero character psi: cosetMean is the average of unit-modulus values over the inertia subgroup, containing zero and therefore nonempty. Its norm <=1 by triangle inequality, hence the finite product primVal over prime factors has norm <=1 (including empty product). Since Lambda>=0, |Lambda(n) primVal|<=Lambda(n). GPsi= sum_{1<=n<=floor(y)} Lambda(n) primVal(n)(y/n-1)+y ell(psi). Rewrite both sums to common M=floor(max(y,z)) using positive parts max(y/n-1,0); any added term vanishes, including the endpoint n=y. Since positive part is 1-Lipschitz, each difference is <= |y-z|/n. Triangle gives |GPsi(y)-GPsi(z)| <= |y-z|(A(M)+|ell(psi)|), where A(M)=sum_{1<=n<=M} Lambda(n)/n. M>=1. GzLipschitz.mertens_upper follows from log(M!)=sum Lambda(n)floor(M/n), M/n<=floor(M/n)+1, nonnegative Lambda, Chebyshev.psi_le_const_mul_self and M!<=M^M; divide by M>0 to get A(M)<=log M+log4+4 <=log(max(y,z))+log4+4. No RH estimate used here, no host conditions inserted. Retain named Mathlib Chebyshev and arithmetic dependencies.
Zero character: GPsi(D,ell,0,y)=Gz(y), not the character sum plus y ell(0). For x in [k,k+1], Gz(x)=x A(k)-sum_{n<=k}Lambda(n)-x log x+(1+gamma)x. At upper endpoint the new term is zero; adjacent formulas agree. On positive x the derivative of this smooth PIECE is A(k)-log x+gamma, not a claim that Gz is differentiable across every integer. For k>=1, source lower Mertens bound log k-1<=A(k) follows from floor<=k/n and k^k/k!<=exp(k). Upper bound above; log k<=log x<=log k+log2; 1/2<gamma<2/3; hence derivative within +/-K0, K0=log4+7. For k=0 and x>=1/2, A(0)=0 and -log x in [0,log2]; same bound. The mean-value bound on each closed piece and triangle across contiguous pieces (ordered endpoints, lengths telescope) yields |Gz(y)-Gz(z)|<=K0|y-z| for all y,z>=1/2, as lip_upto proves. Source zetaPrimeSumErrorLipschitz chooses K=K0+2|Gz(1/2)| to cover also the separate magnitude |Gz(t)|<=K t. derivative_integral_all chooses Cd=|K|+log4+4. For DerivInt alone the extra magnitude term is unnecessary: K0 already dominates log4+4, hence Cd=K0 works for both branches, and Cd=9 also works since log4=2log2<2. This is a conditional human/source-matched improvement using the exact same upstream lemmas, not independently Lean checked or a new result about RH. Preserve original witness and theorem dependencies in the evidence store. The original y,z>=1 remains the interface; stronger zero range >=1/2 and nonzero estimate when max>=1 do not authorize discarding all domain conditions.
Counterexamples: (i) for t=2^-m with m>=3, Sz(t)=Sz(2t)=0; (Gz(2t)-Gz(t))/t=(m-2)log2+1+gamma, unbounded as m grows, so no finite Cd works on all positive endpoints; log2>1/2 follows by integrating 1/u on [1,2]. (ii) for any nonzero psi and ell(psi)=100, y=2,z=1 the smoothed sum vanishes at both ends (Lambda(1)=0 and new weight at n=2 is zero); difference=100. Cannot delete ell from bound with Cd=9 or any fixed Cd independent of arbitrary ell. (iii) psi=0, ell(0)=0, y=1 gives Gz(1)=1+gamma>0, not generic character formula zero. (iv) at prime 2, right-left derivative jump=Lambda(2)/2=log2/2>0, despite continuity; no global smooth differentiation shortcut. These are counterexamples to weakened local claims, not to Lean or RH.
Executed in V8 tool isolate: {"counts":{"source":72,"mutation":72,"coset":6425,"product":25,"hinge":451632,"logfactor":128,"floor":8256,"glue":2144,"negative":132},"total":468886,"subgroups":25,"distinctScaledMeans":5}. All tests exact integer arithmetic within safe integer range; coset means are actual finite-group fixture values, not native arithmetic D hosts; symbolic log-factorial coefficients test exact finite identities, not all analytic inequalities. Hinge quarter-grid and partition checks test finite boundaries; dyadic slope check uses analytic lower bound given above; no floating-point tests or claimed kernel facts. Source mutations reject missing anchors, not semantic Lean equivalence. Replay with Node and local checkout; actual file bytes Git SHA1 checked by CLI on replay, not by connector run. 
RESUME HERE: audit the subsequent consumer CharacterBalanceMoves.triv in ChCore, specifically its global value estimate, start at GPsi(D,ell,psi,1) for psi!=0 and retain the correct log(max) and ell terms; compare derivative producer's actual typed reference roles with combined frontier extraction when available. HANDOFF TO math, integration, dependency, kernel, editor. AGREE with pinned two-branch proof and uniform quantifier order; DISAGREE with dropping the zero-character branch, ell or domain entirely; PARTIAL overall.
*/
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
const spec=[
  [
    "src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean",
    "18deb7cb85d6f650a69f01fda6e0c789b9f04d89",
    [
      "def cosetMean",
      "ψ (h + x)) /",
      "def primVal",
      "∏ p ∈ n.primeFactors",
      "def GPsi",
      "if ψ = 0 then ((Gz y : ℝ) : ℂ)",
      "(y : ℂ) * ell ψ"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/GrowthBoundGivesRiemannHypothesis.lean",
    "a3ece4b4aea97a95ba2977fa9e8d437e72677774",
    [
      "import Formalism.SizeWindowBrackets.FirstPrimeNeSecondPrime",
      "def DerivInt",
      "ψ ≠ 0 → ∀ y z : ℝ, 1 ≤ y → 1 ≤ z",
      "Real.log (max y z) + Cd + ‖ell ψ‖",
      "|Gz y - Gz z| ≤ Cd * |y - z|",
      "def DerivIntAll",
      "∃ Cd : ℝ, 0 ≤ Cd ∧ ∀ (H : Type)"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LipschitzWeightAndMinimum.lean",
    "4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b",
    [
      "import Formalism.ZetaNonvanishing.GzLipschitz",
      "import Formalism.SizeWindowBrackets.GrowthBoundGivesRiemannHypothesis",
      "lemma truncC",
      "max (y / n - 1) 0",
      "lemma norm_cosetMean_le",
      "⟨0, h0⟩",
      "simp [AddChar.norm_apply]",
      "lemma norm_primVal_le",
      "Finset.prod_le_one",
      "lemma norm_coef_le",
      "lemma deriv_char",
      "(_hz : 1 ≤ z)",
      "rw [if_neg hψ, if_neg hψ, ty, tz]",
      "abs_max_sub_max_le_abs",
      "norm_coef_le D ψ n",
      "Formalism.LogFactorialMertensBounds.mertens_upper _ hM1",
      "theorem derivative_integral_all : DerivIntAll",
      "obtain ⟨K, hK⟩ := Formalism.zetaPrimeSumErrorLipschitz",
      "⟨|K| + (Real.log 4 + 4), by positivity, ?_⟩",
      "AN.deriv_char D ell ψ hψ y z hy hz",
      "(hK y z (by linarith) (by linarith)).2"
    ]
  ],
  [
    "src/Formalism/ZetaNonvanishing/GzLipschitz.lean",
    "339c28ebcbab310534b0ce757997b432184edeeb",
    [
      "import Formalism.StatementU",
      "def A (k : ℕ)",
      "def K0 : ℝ := Real.log 4 + 7",
      "ArithmeticFunction.vonMangoldt_sum.symm",
      "lemma mertens_upper",
      "Chebyshev.psi_le_const_mul_self",
      "lemma mertens_lower",
      "Real.pow_div_factorial_le_exp",
      "lemma Sz_eq",
      "rcases lt_or_eq_of_le hx2 with h | h",
      "lemma Gz_eq_P",
      "lemma hasDerivAt_P",
      "A k - Real.log x + Real.eulerMascheroniConstant",
      "Real.one_half_lt_eulerMascheroniConstant",
      "Real.eulerMascheroniConstant_lt_two_thirds",
      "lemma lip_piece",
      "Convex.norm_image_sub_le_of_norm_hasDerivWithin_le",
      "lemma lip_upto",
      "have split : ∀ u v : ℝ",
      "K0 * (v - u)",
      "theorem zetaPrimeSumErrorLipschitz",
      "⌊a⌋₊ + ⌊b⌋₊",
      "⟨K0 + 2 * |Gz (1 / 2)|"
    ]
  ],
  [
    "src/Formalism/StatementU.lean",
    "2484a3b42fb98ab41015e7cd6a50246f01720470",
    [
      "import Formalism.StatementOC",
      "def GzLipschitz : Prop",
      "1 / 2 ≤ t → 1 / 2 ≤ t'",
      "|Gz t| ≤ K * t ∧ |Gz t - Gz t'|"
    ]
  ],
  [
    "src/Formalism/StatementOC.lean",
    "12ab19c0176bd4135c2b23a7ee3ac22888df0122",
    [
      "def Sz (x : ℝ)",
      "def Gz (x : ℝ) : ℝ := Sz x - x * Real.log x + (1 + Real.eulerMascheroniConstant) * x"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "import Development.AutomorphicArithmetic.DedekindLFunctions.SplitInertia",
      "import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChBalance",
      "have hd := hDer.1 ψ hψ0 y x (by linarith) (by linarith)",
      "obtain ⟨Cd, hCd, hDer⟩ := derivative_integral_all"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean",
    "37648715bcf507e086374e8cc476ee746fd274f4",
    [
      "import Formalism.SizeWindowBrackets.ChainSlopeWindows.StronglyIrreducible"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean",
    "94a385f59f3781ae6b1ab4beddc73850708a2bc6",
    [
      "import Formalism.SizeWindowBrackets.FirstPrimeNeSecondPrime"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4",
    [
      "import Formalism.SizeWindowBrackets.ChainSlopeWindows.PChain"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/PChain.lean",
    "57559bc6dedbabbac7365c9f31fbbab09164edca",
    [
      "import Formalism.SizeWindowBrackets.ChainSlopeWindows.LipschitzWeightAndMinimum"
    ]
  ]
];
function cert(spec,files){
 const counts={source:0,mutation:0,coset:0,product:0,hinge:0,logfactor:0,floor:0,glue:0,negative:0};
 function ck(b,k,m){if(!b)throw Error(k+" "+m);counts[k]++}
 function anchors(f){for(const [p,,as] of spec)for(const a of as)if(!f[p].includes(a))throw Error(p+" "+a)}
 anchors(files);counts.source=spec.reduce((n,x)=>n+x[2].length,0);
 for(const [p,,as] of spec)for(const a of as){let bad=false;try{anchors({...files,[p]:files[p].split(a).join("DELETED")})}catch{bad=true}ck(bad,"mutation",a)}
 // Finite exact coset means on E0 x C4. Integers are numerators with denominator 16.
 const elements=Array.from({length:16},(_,j)=>[j>>3,(j>>2)&1,j&3]);
 const plus=([a,b,c],[d,e,f])=>[(a+d)%2,(b+e)%2,(c+f)%4],key=u=>u.join(",");
 const roots=[[1,0],[0,1],[-1,0],[0,-1]],ev=([a,b,c],[i,j,t])=>roots[(2*a*i+2*b*j+c*t)%4];
 const norm2=([a,b])=>a*a+b*b,prod=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 const subgroups=new Map();
 // All generated subgroups with up to two generators (fixture, not exhaustive for every H).
 for(const g of elements)for(const h of elements){let S=new Map();let u=[0,0,0];for(let i=0;i<4;i++){let v=u;for(let j=0;j<4;j++){S.set(key(v),v);v=plus(v,h)}u=plus(u,g)}subgroups.set([...S.keys()].sort().join(";"),[...S.values()])}
 const means=new Map();
 for(const S of subgroups.values()){ck(S.some(u=>key(u)==="0,0,0")&&16%S.length===0,"coset","positive divisor");for(const psi of elements)for(const h of elements){let a=0,b=0;for(const u of S){const z=ev(psi,plus(h,u));a+=z[0];b+=z[1]}const m=[a*16/S.length,b*16/S.length];ck(norm2(m)<=256,"coset","norm of coset mean");means.set(m.join(","),m)}}
 for(const a of means.values())for(const b of means.values()){ck(norm2(prod(a,b))===norm2(a)*norm2(b)&&norm2(prod(a,b))<=65536,"product","norm product")}
 // y,z represented by integers in quarter units; scaled hinge (4*n)*max(y/n-1,0).
 for(let y=0;y<=96;y++)for(let z=0;z<=96;z++)for(let n=1;n<=24;n++){const u=Math.max(y-4*n,0),v=Math.max(z-4*n,0);ck(Math.abs(u-v)<=Math.abs(y-z),"hinge","max contraction");ck((n<=Math.floor(y/4)?y-4*n:0)===u,"hinge","common floor extension")}
 // Exact log factorial/Mangoldt divisor identity: equality of coefficients of log p.
 function fac(n){let r={};for(let p=2;p<=n;p++)while(n%p===0){r[p]=(r[p]||0)+1;n/=p}return r}
 const pp=[];for(let n=1;n<=128;n++){let f=Object.keys(fac(n));pp[n]=f.length===1?f[0]:null}
 let f={};for(let k=1;k<=128;k++){for(const [p,e] of Object.entries(fac(k)))f[p]=(f[p]||0)+e;let b={};for(let n=1;n<=k;n++){const p=pp[n];if(p)b[p]=(b[p]||0)+Math.floor(k/n);ck(Math.floor(k/n)*n<=k&&k<(Math.floor(k/n)+1)*n,"floor","Mertens integer sandwich")}ck(Object.keys(f).every(p=>f[p]===b[p])&&Object.keys(b).every(p=>f[p]===b[p]),"logfactor","exact symbolic log identity")}
 // At integer boundary k+1 the additional weight is exactly zero, regardless of coefficient.
 for(let k=0;k<=127;k++){ck((4*(k+1)-4*(k+1))===0,"glue","new hinge vanishes at boundary")}
 // Additive lengths of contiguous subintervals, exact quarter-grid.
 for(let y=2;y<=64;y++)for(let z=y;z<=64;z++){let pts=[y];for(let t=4*Math.ceil(y/4);t<z;t+=4)if(t>y)pts.push(t);pts.push(z);let len=0;for(let i=1;i<pts.length;i++)len+=Math.abs(pts[i]-pts[i-1]);ck(len===z-y,"glue","telescoping distances")}
 // Below 1, Sz=0. With t=2^-m, slope from t to 2t equals (m-2)log2+1+gamma.
 // log2>1/2 and gamma>1/2 give an exact rational lower bound; for every nonnegative C choose m=2C+3.
 for(let C=0;C<=128;C++){let m=2*C+3;ck(m>=3&&m-2+3>2*C,"negative","dyadic slope lower bound exceeds C")}
 // On [1,2], all Mangoldt terms vanish (Lambda(1)=0, weight at 2=0).
 ck(100>9+1,"negative","omitting ell: ell=100 gives slope 100, log2+9<10");
 ck(1+1/2>0,"negative","zero character with ell=0 at x=1: Gz(1)=1+gamma, not zero");
 ck(1>0,"negative","derivative jump at prime 2 is log2/2>0, although boundary value glues");
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0),subgroups:subgroups.size,distinctScaledMeans:means.size};
}
const root=process.argv[2];if(!root)throw Error('usage: node certificate.mjs PINNED_RH_CHECKOUT');const files={};for(const [p,sha] of spec){const b=fs.readFileSync(path.join(root,p));const h=crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(h!==sha)throw Error('blob mismatch '+p);files[p]=b.toString('utf8')}console.log(JSON.stringify(cert(spec,files),null,2));
