# RUN5 — current-head migration and removal of the analytic theta guard
2026-11-24. RESULT: DONE for source comparison and human reconstruction of the new wrapper; SOURCE-MATCHED, finite exact regression executed. Not a kernel replay or adoption of the new revision.

## Continuity and pinned sources
Read AGENTS, research state/log/protocol, continuity, CI state (#364, run 45379182627, not RH validation), swarm protocol, queue, expansion, RUN4, other lanes' latest handoffs (including prime RUN5, kernel RUN4, acceleration RUN5, editor 1056, integration 1100, theta/Galois/character/geometry/literature RUN4), math analytic chapter, peer Landau and regularized-point audits and Grok Landau–Page claim. Blueprint synopsis read, PDF itself not reopened. No duplicate Landau–Page or arithmetic producer work.

Upstream repository leanprover-community/riemann-hypothesis. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current head at inspection ba5e02170fcf8bc19acf4d63110f5eb85f8c0161 (2026-11-24 11:18:50 UTC; merge #367). Keep old pin as reconstruction target. Current clump locations below refer ONLY to this head. Content and blob IDs fetched from GitHub connector, line numbers refer to returned source lines. No Lean executable or elaborated export used this run.

Paths relative to src/Development/AutomorphicArithmetic/:
- DedekindLFunctions/LandauTheorems/landauWindow.lean (current blob 78d2ec6cc11c6e05db6c5a6b3e62a76ab43b97cc): relocated 12 original modules.
- CharacterBoxes/ZeroFreeAllOfTopG.lean (current blob c3bcece31e76be6368af5af4647f1ad30012fd3b): relocated window, family pole, final wrappers and primitive-family adapter.
- DedekindLFunctions/LandauZeroFreeCriterion.lean: old 54fd0de979e0dad6ac7709ad8ecbec8a29e21872, current f4c5124f8a0188f85b60b2687864d531f9c0a3d8.
- DedekindLFunctions/CharFamily.lean: old 81c8dfd66d910d083d5bc88c664c7917fdbdfe96, current cac521ab291c9dab261508613d4d12195cdfb799.

## 1. Actual migration table
Compared entire exact text from namespace Deduction through end Deduction in each old file against the member section of each current clump (excluding imports, clump header, exposure and surrounding sections). "Same" means exact equality of that substring, NOT equality of elaboration or transitive dependencies. "Changed" means do not automatically migrate. The current source uses module/public exposure and changed Mathlib; equality of bodies alone cannot certify equivalence.

Old names in DedekindLFunctions/LandauTheorems/, old blob IDs, current destination A=landauWindow, B=ZeroFreeAllOfTopG, S=standalone file.

| Old module | Old blob | Current destination/member lines | Text |
|---|---|---|---|
| IteratedDerivLaplace | c1c05ec801b258064f1e14fb9d7e624eb7345382 | A 71–185 | Changed |
| LandauCoeff | dc8287f2dbe7c767dcb77893eaf53d07092ed1f3 | A 187–223 | Same |
| LandauDichotomy | 947dae363ce629febcba27b1b70355438f8639a0 | A 225–336 | Changed |
| LandauGrowthContra | bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda | A 338–390 | Changed |
| LandauNearest | 6a177498987e1ef453727131bf2004bc797a01a2 | A 392–509 | Same |
| LandauPoleAsym | e5ec846b37b8879944576a38c83013814a6f1fe7 | A 511–598 | Same |
| LandauPoleReLe | 205c7380b79e78b2752ed67aeb069f2a9d12cc77 | A 600–662 | Changed |
| kernelIntegral | d785c54e03a55b0ef6c0fcb64bc4f8158e803642 | A 664–693 | Same |
| landauTails | 0e55797bac5320acf02d9acc832ca53df716e436 | A 695–866 | Changed |
| LandauKernelMax | b230a9e40c3710eac205f32ceb8a44f2d003b647 | A 868–896 | Same |
| landauWindowIneq | cda93b0185260d72395d2ef2c90314e0fa7128ef | A 898–1017 | Same |
| landauWindow | 7915058f10b33a52652290cd887cbccdc00e676a | A 1019–1225 | Changed |
| LandauFinite | 46a0dc63f21009582a2dda61c1267e9aad88bde5 | S | Same |
| LandauCauchy | f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b | S | Same |
| WindowHypOfRpow | dde1c159371538875c28374574ca7e452b0450d9 | B 82–148 | Same |
| WindowHypUOfWindowHyp | 701f0502ae106ab89e390105cd9c98e6cf881e1a | B 150–203 | Changed |
| GchiConj | 63cdd6a1ec3e729a5465803a19ebcf5ab9c9577c | B 205–265 | Changed |
| GchiGrowth | 0adbad2399f91f6cd547c9195d4464ccb5512d45 | B 267–342 | Same |
| LogDerivLocal | 56dd45f8630096e041bdad64152e07862e0d4c27 | B 344–392 | Same |
| measurableGchi | 3b014d914efcdcf58e8de1823570aeb3c64babf3 | B 394–431 | Same |
| mellinGchiModOne | 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc | B 433–640 | Same |
| mellinGchiOfNeOne | 675a25d278977948c8327f0e1e2e31fb3a990a7d | B 642–790 | Changed |
| poleData | 1f7fdc4409d2f1185700764c51d5c17a907d76e1 | B 792–1189 | Changed |
| lemmaL | 6c37aebd05121b6d68e3532d8529f0ce8357386f | B 1191–1215 | Changed |
| ZeroFreeOfRpowWindow | 2ed00ad3aa862f3e522686557fb8f559b17fc002 | B 1217–1238 | Changed |

13 identical body spans, 12 changed. Standalone current LandauFinite blob 01e7d133edc7261bea496e74e1257715dbce131d, LandauCauchy e4aa7a9a470043a1fcf7d63c3e32a92ae2934bdc. The three core definition spans (all seven PoleData fields, WindowHypU, and CharFamily through WindowHyp) compare textually equal. In particular iso is still at EVERY z of positive real part and pole is still nonzero with positive real residue at a real pole. No weaker definition hidden by relocation. Quantifier order of WindowHypU is eta>0 -> arbitrary U0 -> exists U>=U0 -> exists majorant R with integrability, pointwise g<=R and 0<=R, and integral bound. No fixed R or all-U requirement is added.

The explicit proof changes in LandauDichotomy replace nlinarith by the two squared bounds and the positive product contradiction; the actual dichotomy body is unchanged. LandauNearest and LandauPoleAsym are identical, including isolation and strict radius guards. GrowthContra, PoleReLe, IteratedDerivLaplace, tails contain tactic/algebra expansions; they have not been replayed. WindowHypUOfWindowHyp now uses Real.image_exp_Icc rather than its local interval-image helper. The alternative linear witness from RUN4 remains an independent human construction, not part of upstream.

## 2. New theorem: no theta restriction for the abstract analytical criterion
Original landau_window required 0<theta<1 and delta>0. Current A 1204–1218 requires only delta>0 and WindowHypU, plus PoleData. The following is the actual new mathematics, not a claim that RH is now proved by a weaker arithmetic input.

First, current A 1050–1083 generalizes landau_window_key to 0<theta<2. Its proof needs theta<sigma, with sigma>2 supplied by landau_tails, and theta>0 to compare sigma-theta <= sigma. The former theta<1 hypothesis was stronger than needed. Current private landau_window_of_pos_lt_two (A 1093–1176) keeps both previous lower-bound branches: nonreal/shifted isolated pole coefficient |c|/d, or real exceptional pole coefficient Re(c)/d. The same strict gap d<e<=sigma-theta, same uniformity in gamma, same order of eta,U0,U,k, same real residue sign. No dropped lower-bound condition.

Second, A 1178–1194 proves monotonicity of the window predicate in theta. Suppose theta<=theta' and hW(theta). For given eta>0 and U0 request its witness at max(U0,0), so U>=0 and every u in the window is nonnegative. Set
  R'(u)=R(u) exp((theta'-theta)u).
Since R>=0 and the exponential multiplier >=1, R'>=R>=g and R'>=0, even if g is negative. Pointwise on the entire domain:
  R'(u) exp(-theta' u)=R(u) exp(-theta u).
Consequently integrability and the integral bound are literally preserved by equality. U and eta do not change, and delta remains the same. This establishes WindowHypU(g,theta',delta). The nonnegative-U choice and monotonicity direction matter: if u<0, or theta'<theta, the multiplier may be <1 and the majorant fails (take R=g=1). One must not silently substitute R' on a negative window.

Third, apply three cases to any rho in Z:
- theta>=2: landau_pole_re_le gives Re rho<=2<=theta, independent of the window.
- 0<theta<2: the private analytical theorem applies.
- theta<=0: PoleData.pos gives b=Re rho>0. Choose t=min(1,b/2). Then 0<t<2, theta<=t, and t<b. Monotonicity gives WindowHypU at t with exactly the same delta; the private theorem gives b<=t, contradiction. This is a proof for each proposed pole; it does not assert one universal t independent of rho. It implies Z is empty in the nonpositive-theta case. No assumption of a pole at a specific height is introduced.
Thus Re rho<=theta for every rho in Z and any real theta. This is an exact human reconstruction of the new wrapper.

## 3. Family-level consequence and exceptional zero safeguard
Old lemmaL and zeroFree_of_rpow_window required 0<theta<1. Current B 1202–1208 and 1228–1231 require **0<=theta** (not arbitrary real theta). For a hypothetical L-zero at s with Re s>theta>=0, the same zeroSet membership is immediate, so abstract landau_window contradicts Re s>theta. The old separate Re s>=1 split is gone from lemmaL, but nonvanishing on Re s>=1 is NOT gone from the proof.

Indeed, current poleData (B 792–1189) now proves hρlt : rho.re<1 before choosing multiplicities/residue, using charFamily_LFunction_ne_zero_of_one_le_re in both direct and conjugate zero branches; previously this fact appeared later and rho!=1 was separately shown. For any real zero beta in (0,1) the same weighted multiplicity S>0 gives residue S/(beta(1-beta))>0. The positivity proof still depends on a positive weight and a nonzero multiplicity for at least one family member; other multiplicities are nonnegative. The modulus-one regularization g(1)=1 and equivalence of g-nonzero with totalized zeta-nonzero at 1 are retained. No exceptional real-zero exclusion by fiat. Line-one nonvanishing remains an imported essential input. A family theta<0 conclusion would demand handling possible nonpositive-real-part zeros; current lemmaL rightly keeps theta>=0 because zeroSet only contains positive-real-part zeros.

The actual power-window hypothesis is unchanged:
 for every Y0 there is Y>=Y0 such that for all y in [Y,Y^(1+delta)], Gm(F,y)<=C y^theta.
WindowHypOfRpow body is identical. Therefore the new theorem changes the allowable theta range, not the required arithmetic window existence or majorant, and does not provide a converse.

Current B 1248–1306 embeds the family construction previously factored through level_family, rather than invoking it as at the original pin (PrimitiveCosets/Imports.lean blob 2dc9b4e690951c66ffe443e279fcada259bcce13). The current proof takes KEPT as its index set, weight(one)=1, weight(other)=Lambda.wt>0, uses primitivity to show the principal character must have modulus one, and proves the sum equality by splitting off one and rewriting gChi_eq. The use of max(y/n-1,0)=y/n-1 on 1<=n<=floor(y) is explicit. Then hZ maps family nonvanishing to the level and invokes zeroFree_of_rpow_window with delta=la-1, C=1, and htheta0.le. This call's direction is unchanged; the level FormB still introduces an extra old hypothesis as underscore, not proof of arithmetic window existence. Independent audit of the inlined producer and level definition dependencies remains open. Do not infer whole-current-head equivalence, source closure or Lean validation.

## 4. Reproducible checks
Executed in JS tool runtime on fetched connector contents: 25 body comparisons (13 same, 12 changed); 8 source blob ID comparisons for the two core definitions and two clumps (both revisions); 24 exact anchor tests for residue, theta branches, window rescaling, family membership and adapter direction; 3 exact definition-span equalities. Hash IDs returned by connector, not independently recomputed from raw local Git bytes. For replay use git show <revision>:<path> and git hash-object --stdin; cut the original and clump member namespace spans. No complete dependency export or Lean kernel replay. The finite algebra certificate below was actually executed in JS runtime. It replaces exp of integer exponent by base-2 rational powers ONLY as an exact test of exponent identities and monotonicity; the preceding proof is for real exp. Counts refer to finite checks, not RH zeros or proof steps.

~~~js
function regression(){
 const assert=(x,m)=>{if(!x)throw Error(m)};
 const p2=n=>n>=0?[2n**BigInt(n),1n]:[1n,2n**BigInt(-n)];
 const mul=(a,b)=>[a[0]*b[0],a[1]*b[1]];
 const le=(a,b)=>a[0]*b[1]<=b[0]*a[1];
 const eq=(a,b)=>le(a,b)&&le(b,a);
 let monotone=0,weight=0,zeroCase=0,guards=0;
 for(let t=-4;t<=4;t++)for(let T=t;T<=4;T++)for(let u=0;u<=8;u++)for(let r=0;r<=6;r++){
   const R=[BigInt(r),1n],Rnew=mul(R,p2((T-t)*u));
   assert(eq(mul(Rnew,p2(-T*u)),mul(R,p2(-t*u))),"weight identity");weight++;
   for(let g=-3;g<=r;g++){
     assert(le([0n,1n],Rnew)&&le([BigInt(g),1n],Rnew),"majorant");
     monotone++;
   }
 }
 for(let theta=-32;theta<=0;theta++)for(let beta=1;beta<=16;beta++){
    const t16=Math.min(16,beta);
    assert(t16>0&&t16<32&&2*theta<=t16&&t16<2*beta,"nonpositive theta witness");zeroCase++;
 }
 for(let theta=-32;theta<=32;theta++)for(let beta=1;beta<=16;beta++){
   const b=theta>=16?"high":theta>0?"interior":"nonpositive";
   if(b==="high")assert(beta<=theta,"pole upper bound");
   if(b==="interior")assert(theta>0&&theta<16,"interior");
   if(b==="nonpositive")assert(beta>theta,"contradiction target");
   guards++;
 }
 assert(!le([1n,1n],p2(-1)),"negative u counterexample");
 assert(!le([1n,1n],p2(-1)),"reversed theta counterexample");
 assert(2*1<2*2,"positive window");
 assert(2*0<2*1,"negative delta reverses window");
 return {weight,monotone,zeroCase,guards,negativeControls:3};
}
console.log(regression());
~~~

Actual output: {"weight":2835,"monotone":19845,"zeroCase":528,"guards":1040,"negativeControls":3}. Total 24,248 positive finite regression cases and three negative controls. No elapsed speedup benchmark or URT advantage. No change to Cathedral physical gates or queue.

RESUME HERE: Independently source-audit the current-head inlined formB family producer at B 1248–1306 against original LevelFamily.lean and the exact definitions of Level.wt, Gm, Nt, PChar.one and gChi_eq; derive the same finite-sum equality including the modulus-one correction. Coordinate with prime-window and character-box lanes; avoid duplicate arithmetic host producer work. Then trace changed current WindowHypUOfWindowHyp into Mathlib Real.image_exp_Icc and record the pinned-to-current import provenance. Keep original pin separate and ask kernel/audit lanes to replay the new abstract wrapper when the native environment becomes available.
HANDOFF TO: integration, editor, audit, kernel, prime window and character boxes. Record the stronger abstract interface as CURRENT-HEAD SOURCE-MATCHED, not as a change to the pinned original proof or a completed RH proof.
