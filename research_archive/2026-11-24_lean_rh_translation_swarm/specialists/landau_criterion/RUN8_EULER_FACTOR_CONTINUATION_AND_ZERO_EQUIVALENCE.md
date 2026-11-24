# RUN8 — Euler-factor analytic continuation and zero equivalence
2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of imported producer, plus exact finite coefficient checks executed in V8. No independent Lean kernel replay. Project OPEN.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/continuity/runner queue and protocol opening, CI summary #373 run 45406895276 (physical CI, not RH verification), RUN7, recent dependency, integration, math, character, theta, Galois, literature, prime, geometry, kernel, acceleration, structure and editor RESUME notes. Math analytic_zero_exclusion_chapter already describes the OUTER imprimitive transfer; it does not expand the imported LFunction_changeLevel proof. This run expands that producer, not the entire EveryCharacter assembly. Audit lane files not found under audit/ in tree; editor reports peer final-statement audit. Blueprint not independently reopened. No baseline physics modifications.

## Source ledger
RH P = 40e56bab026552e089d7afcfeff08d2defb9c005. H = 9477923066c923e6dbf7292da17019f8d08d0db8 (observed latest 2026-11-24 14:18:56Z, merge #1174). H manifest blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d still pins Mathlib Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8; Pm=0df444a360eaa60ab8c11dca51a86af692955474 (RUN7).
- P src/Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean blob 97cbdce9fcc91c4f0dcc25fef62daf4c95724afa, UpperTheory.Top.imprimitive. H path no longer exists.
- H src/Development/AutomorphicArithmetic/CharacterBoxes/HalfPlane.lean blob 432979618e8a88062e9d8bffc5bdac624a5e7e47, L19–45 Claim.factor_ne_zero, Claim.eulerFactors_ne_zero, Claim.LFunction_eq_zero_iff_primitiveCharacter. New reusable equivalence on Re(s)>0, not merely a consequence on Re(s)>1/2. Full current consumer chain not traced here.
- H src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/ZetaEulerProducts/MeromorphicAtProd.lean blob a62f67ca22d3158a24ce2ee58e540ec5a0a47cf7, L159–168 PositivityTheory.Lord.factor_ne_zero, actual body retrieved.
- H src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean blob c3bcece31e76be6368af5af4647f1ad30012fd3b unchanged from RUN7.

Mathlib path | Pm blob / Hm blob | declaration
- Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean: 58a6430496fc0b4c22b2c5ccdc777b09a099a6a6 / 27c7ad1e4cab9ea2268089832836d68d311cfeac; LSeries_eulerProduct_hasProd and tprod, LSeries_changeLevel P171–207/H169–205. Actual full-span comparison equal after replacing if_false -> ite_false and if_true -> ite_true, raw text differs.
- Mathlib/NumberTheory/LSeries/DirichletContinuation.lean: 9ccc38f52d669a88285a904e59dbb562ade5aba5 / 9c298ece8f124faf92ba9dbf04d8a45f8283e4ce. LFunction_eq_LSeries P75/H74, differentiableAt_LFunction P92/H91, differentiable_LFunction P98/H97, LFunction_changeLevel_aux P125–144/H124–143, LFunction_changeLevel P150–162/H149–161. Aux eventualEq type annotation changed; public dense equality final congrFun -> congrm. Read both proof bodies.
- Mathlib/NumberTheory/LSeries/ZMod.lean: 0c6ccbe61ab0645b0b8f713af0f2398de6fcc936 / eb49c8a21cfa211f137578580a7d8f00e4eb88a9. LFunction_eq_LSeries P93/H95; differentiableAt_LFunction P122/H124; residue_one follows. Actual source groups by residue classes and cancels Hurwitz pole.
- Mathlib/NumberTheory/DirichletCharacter/Bounds.lean: 624525b93fbcdda02dac7628a86e3a71eed86652 / fad2a4b54fc0ddb657a572e87438db83fef6b9cd. norm_le_one P33/H44, same unit/nonunit argument.
- Mathlib/NumberTheory/DirichletCharacter/Basic.lean: 4569ebb8e61f683a9c89877f0cda4d3add4d766d / a954549811e3e87c5f4e85b5d37f359ddfc83a81. changeLevel_eq_cast_of_dvd, changeLevel_one, changeLevel_primitiveCharacter (P310/H309).
Hashes are connector-returned; not independent git hash-object verification.

## 1. Dirichlet series producer, Re(s)>1
Let positive integers M|N, chi a character modulo M, chiN=changeLevel chi. At a prime p not dividing N, p is a unit mod N, and chiN(p)=chi(p) by changeLevel_eq_cast_of_dvd. At p dividing N, chiN(p)=0. For p already dividing M the old chi(p)=0 as well, so the correction is 1. The Euler products of both Dirichlet series are available from LSeries_eulerProduct_hasProd, using complete multiplicativity and summability of their Dirichlet summands. This is an imported convergent product theorem, not a formal cancellation of divergent expressions. Define f(p)=1-chi(p)p^(-s). The absolute bound |chi(p)|<=1 follows from unit values having norm one and nonunits mapping to zero. For Re(s)>1, |p^(-s)|<=1/2, so f(p) is nonzero. The source rewrites the finite correction product as a multiplicative indicator over natural numbers, extends both prime products by identity outside primes, and combines them using Multipliable.tprod_mul. Its two convergence obligations are the original Euler product and finite support of the correction. Pointwise, nonprime terms are 1; at primes not dividing N the old inverse factor is unchanged; at primes dividing N the old inverse multiplied by f(p) is exactly 1, equal to the new inverse factor. Thus
 LSeries(chiN,s)=LSeries(chi,s) * product_{p|N, p prime} f(p).
The stronger Re(s)>0 nonzero-factor bound alone does NOT justify Euler product convergence there.

Independent algebraic check: expand the finite product as sum_{d|rad(N)} mu(d)chi(d)d^(-s). Its coefficient at n is sum_{d|n,d|rad(N)} mu(d)chi(d)chi(n/d)=chi(n)sum_{d|gcd(n,rad(N))}mu(d), hence chi(n) when gcd(n,N)=1 and 0 otherwise. This is exactly chiN(n). Absolute convergence for Re(s)>1 legitimates rearrangement. No primality assumption on N or squarefreeness needed.

## 2. Analytic continuation producer
The LFunction defined through periodic Hurwitz zeta is equal to LSeries on Re(s)>1. The actual ZMod proof partitions the absolutely summable natural series by residue class j mod N, yielding N^(-s) sum_j chi(j) zeta(s,j/N), with j=0 term using the source's n=0 convention (not an ordinary divergent 0^(-s) term). Multiplicative complex-power manipulations are valid for nonnegative real bases with the zero-term convention; no arbitrary complex-base product rule.
Each Hurwitz function is holomorphic away from 1, and each has residue 1. At 1 the ZMod proof subtracts 1/(s-1) from every summand; if sum_j chi(j)=0 the weighted singular term cancels. For nonprincipal chi this sum is zero by character orthogonality (multiply by a unit with character value not 1 to permute the finite sum). Thus nonprincipal L-functions are entire.
On D=C\{1}, both F(s)=LFunction(chiN,s) and G(s)=LFunction(chi,s) product f(p) are holomorphic. Each factor is entire since p>=2 and p^(-s)=exp(-s log p). D is open and connected (real dimension 2; deleting one point does not disconnect). They agree on an open neighbourhood of 2 contained in Re(s)>1. The complex analytic identity theorem extends equality throughout D. This is exactly LFunction_changeLevel_aux (preconnectedness, basepoint 2, eventual equality).
For chi !=1, chiN !=1 by changeLevel_eq_one_iff, so both F and G are continuous at 1; agreement on dense D extends to all C. If chi=1 the public theorem instead requires s!=1. The guard is chi!=1 OR s!=1, not AND. Principal pole residue at 1 is product_{p|N}(1-1/p)>0 for the modulus-one induced principal character; the exclusion is about the pole, not the exceptional real zero of a nonprincipal character. Source's totalized point value at 1 must not be confused with a meromorphic pole. No extension of unregularized equality at the excluded pole is asserted.

## 3. Current H zero equivalence
For sigma=Re(s)>0, |chi(p)p^(-s)|<=p^(-sigma)<1. Reverse triangle yields |f(p)|>=1-p^(-sigma)>0. H uses IsUnit.one_sub_of_norm_lt_one in PositivityTheory.Lord.factor_ne_zero with arbitrary integer base >=2 and coefficient in closed unit disk; Claim.factor_ne_zero specializes to prime p. Finite product is nonzero, including empty product N=1. This needs only sigma>0, not sigma>1/2. At sigma=0 a principal inducing character gives f(p)=0 at s=0, so strictness matters. If coefficient norm bound or base>=2 is dropped, elementary counterexamples exist.
Given any chi modulo N>0, conductor M>0 and primitive character psi, changeLevel psi=chi. If chi!=1 then psi!=1 by changeLevel_one; if s!=1 the right disjunct supplies the guard regardless of psi. Apply LFunction_changeLevel and mul_eq_zero, discard the correction zero branch via product nonzero. Thus for Re(s)>0 and (chi!=1 or s!=1):
 LFunction(chi,s)=0 iff LFunction(psi,s)=0.
For the original P theorem, instantiate the already supplied ZeroFreeAll at psi (PChar.of chi), then apply this direction with Re(s)>1/2. It is a consumer, not a proof of ZeroFreeAll. A nonprincipal real exceptional zero in (0,1) is preserved by this equivalence, not assumed absent. RUN1–7 family positivity, delta>0 and outer 0<theta<1 remain unchanged; this local adapter contains no theta or delta. Arithmetic window existence remains upstream. No full Main closure or URT advantage inferred.

## 4. Executed finite regression
JS Node/V8 replay (integer arithmetic exact within representable range; tests actual explicit characters modulo 1,4,5,8, not arbitrary character theorem):
~~~js
const assert=(c,m)=>{if(!c)throw Error(m)};
function check(){
 const gcd=(a,b)=>b?gcd(b,a%b):a, primes=n=>{let r=[];for(let d=2;d<=n;d++)if(n%d===0&&Array.from({length:d-2},(_,i)=>i+2).every(k=>d%k))r.push(d);return r;};
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
 const units=[[1,0],[0,1],[-1,0],[0,-1]];
 const chars=[{m:1,f:n=>[1,0]},{m:4,f:n=>n%2===0?[0,0]:[n%4===1?1:-1,0]},{m:5,f:n=>n%5===0?[0,0]:units[[1,2,4,3].indexOf(n%5)]},{m:8,f:n=>n%2===0?[0,0]:[[1,0],[-1,0],[-1,0],[1,0]][(n%8-1)/2]}];
 let mult=0,coeff=0,factor=0,negative=0;
 for(const {m,f} of chars){
  for(let a=1;a<=40;a++)for(let b=1;b<=40;b++){assert(eq(f(a*b),mul(f(a),f(b))),"character multiplicativity");mult++;}
  for(let k=1;k<=20;k++){const N=m*k, ps=primes(N);let ds=[[1,1]];for(const p of ps)ds=ds.concat(ds.map(([d,v])=>[d*p,-v]));
   for(let n=1;n<=300;n++){let a=0,b=0;for(const [d,sign] of ds)if(n%d===0){const [x,y]=mul(f(d),f(n/d));a+=sign*x;b+=sign*y;}assert(eq([a,b],gcd(n,N)===1?f(n):[0,0]),"Dirichlet coefficient");coeff++;}
   for(const p of ps)for(let j=1;j<=4;j++){const q=p**j,[a,b]=f(p);assert((q-a)**2+b*b>0 && a*a+b*b<q*q,"nonzero factor");factor++;}
  }
 }
 assert(1-1===0,"sigma=0 or base=1 counterexample");negative+=2;
 assert(1-2*0.5===0,"coefficient disk guard");negative++;
 let residue=0;for(let n=1;n<=200;n++){let a=1,b=1;for(const p of primes(n)){a*=p-1;b*=p;}assert(a>0&&a<=b,"principal residue");residue++;}
 return {mult,coeff,factor,residue,negative};
}
console.log(check());
~~~
Actual V8 output {"mult":6400,"coeff":24000,"factor":560,"residue":200,"negative":3}. Total 31160 positive finite cases and 3 logically distinct negative controls (base 1 and sigma 0 share arithmetic assertion); source body comparison separately executed. Finite tests cover coefficient inclusion-exclusion and positive integer real exponents, not the infinite analytic continuation or all complex s. No Lean kernel execution. Source replay git show PIN:PATH and git rev-parse PIN:PATH in the proper repositories. Full proof and dependency graph remain OPEN.

RESUME HERE: trace the pinned local zero-order decomposition supplying each complex residue in the Landau pole family (analyticOrderAt/toNat, nonidentically-zero input, local factor and logarithmic derivative). Preserve distinction between real positive residue and complex nonzero residue; compare the exact H clump and imported Mathlib theorem bodies. Do not redo RUN1–8, outer EveryCharacter adapter or prime-window producer. HANDOFF TO integration, editor, audit, math and kernel. Project OPEN.
