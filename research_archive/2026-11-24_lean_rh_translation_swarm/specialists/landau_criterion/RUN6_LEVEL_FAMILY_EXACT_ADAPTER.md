# RUN6 — exact level-to-family adapter, both revisions
2026-11-24 12:20 UTC. RESULT: SOURCE-MATCHED conditional human reconstruction with executed finite symbolic coefficient regression. No independent kernel replay, RH completion, or URT speedup.

## Continuity
Read AGENTS, research state, runner log/protocol, continuity, latest physical CI #367 (PASS, run 45387831523, unrelated to RH), all three swarm coordination files, own RUN5, prime RUN5, character RUN5, kernel RUN6, acceleration RUN6, theta/Galois/literature/geometry RUN5, editor 1156, integration 1200, math analytical chapter, audit signed-tail and structure heap handoff, dependency typed projection, Grok native family run9 claim. The latter reports its own companion execution for exceptional-pair producers, not a run performed here. Blueprint synopsis read; PDF not reopened. No unrelated physics work. Peer audit is working on WindowHypOfRpow/WindowHypU; do not duplicate that task.

## Source ledger
Repository leanprover-community/riemann-hypothesis. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005 remains the target. Current HEAD observed c6d67c05b648be9f1993aa84bd32c29ea9d2fb72 (merge #1083); current formB clump unchanged in blob since RUN5. All source bytes below fetched by connector; blob IDs returned by connector, not independently hashed locally. Paths relative to src/:
- Development/AutomorphicArithmetic/PrimitiveCosets/LevelFamily.lean (pin d08c25d0cb674297482bec9a235401c14bfb22fa): level_family_wt, _wt_pos, _adm, _sum, level_family; lines 8–end.
- Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean (pin 2dc9b4e690951c66ffe443e279fcada259bcce13): formB.
- Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean (HEAD c3bcece31e76be6368af5af4647f1ad30012fd3b): current zeroFree_of_rpow_window and inlined formB, lines 1217–1306.
- Development/AutomorphicArithmetic/PrimitiveCosets/GChiEq.lean (pin d7abdea8d4ea78d5f4144e8781ab33dc1760069c; HEAD ca4bc026db6ba9475ee55d45ad090db44a878082): gChi_eq_ramp and gChi_eq, current lines 57,67.
- Development/AutomorphicArithmetic/PrimitiveCosets/GzEq.lean (pin ee8161fad71e4610eef5f9a362ec6fbee4a57e01): Gz_eq, two equalities; current inline re-proves first only.
- Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean (pin 81c8dfd66d910d083d5bc88c664c7917fdbdfe96): ramp, Gchi, CharFamily, Gm, ZeroFree.
- Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean (pin 2ed00ad3aa862f3e522686557fb8f559b17fc002): original guarded theorem.
- Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/PrimePairSizeCondition.lean (pin aee05935e7bac6625cd4e07fef4912722d796780; HEAD 5684e9bc153551cf610b4acbe003b7348edc32db): PChar, PChar.one, KSet and one_mem (pin lines 7–45; current 50–82).
- Same folder ExplicitFormulaErrorOfHostConditions.lean (pin ed60b4b997cd4703713660b185b9e43fd95559a1; HEAD 22c9c2935c787e59b5e434d7a3872cc6fe28cfd2): Level, PChar.ZeroFreeAbove, Level.ZeroFreeAbove, Nt, wt, Gm, pin 8–38, current 68–80 for level defs.
- Same folder Analytic.lean (pin 599699b5b35f6fb7bf2ab94f5f0c577b14f35ea1; HEAD 768db8d27cbffae0506239b189d41eda0db287d7): abelian₂, logDerivativeAtOne, G, sumLamChi, gChi (current gChi L70).
- Same folder Window.lean (pin 099d96fec932b03a505ea79a81c45bcc3fbf0ea3; HEAD f8d72c815121c2bb87536852ca9d1a9f4241b9d6): HasWindows, FormBAt, FormB; current L62–65 unchanged theta guards.
- Formalism/StatementOC.lean (pin 12ab19c0176bd4135c2b23a7ee3ac22888df0122; HEAD a6d8473df6682e9c114f1d1b44a39a8335754ff4): Sz, Gz (pin L11,13; current L54,56).
- lake-manifest.json: pin b4d1ec31575a26b2159ec3a262b482bc051f3f6f uses Mathlib 0df444a360eaa60ab8c11dca51a86af692955474; HEAD 8a747b58a34565cc6cb5341b86544aa5d3a20a2d uses 31ce06eaadf4a200c0e1407c5f10953cf606b8f8. No transitive proof equivalence assumed.

## 1. Build the actual family
Fix any native Level Λ, extending KSet. K=Λ.KEPT is a finite set of primitive Dirichlet characters, each with modulus N>0, containing the modulus-one character e=PChar.one. Inherited data: inverse closure of K; optional psK, which if some ψ must belong to K and be odd and real; retain these hypotheses even if local adapter does not use them all. The symbol psK designates a character, not proof it possesses an exceptional zero. o=Λ.o is natural. Set D=3o+1>0. Define a(e)=1 and for ψ≠e let a(ψ)=1 if psK=some ψ, otherwise 1/D. All weights strictly positive, including o=0. Neither exceptional member nor modulus one is removed from the family. The source's Nt=K.erase(e) is only a summation partition.
Take index type subtype K, with finite instance, modulus N_i, nonzero instance, χ_i inherited, weight a_i. Admissibility requires N_i=1 or χ_i≠1. If χ_i=1, primitivity says conductor(χ_i)=N_i and conductor(1)=1, so N_i=1. The other branch is immediate. This uses actual primitive data, not a blanket assumption that principal characters are constant on every integer at arbitrary modulus.
For N=1 every integer is a unit modulo 1 because gcd(n,1)=1, including n=0, hence χ(n)=1. This is the principal branch of gChi_eq; no need to claim uniqueness of a primitive character using proof irrelevance in the local adapter.

## 2. Exact equality of the two prime signals, for EVERY real y
Write m=floor_nat(y), with the natural floor truncated at zero, λ(n)=von Mangoldt(n), E=EulerGamma.
R_f(y)=sum_{n=0}^m λ(n) f(n) max(y/n-1,0) (with Lean's totalized arithmetic at zero).
λ(0)=0, so deleting n=0 is exact, not an approximation. Remaining indices 1≤n≤m imply n≤y and n>0. When y<1 the positive-index sum is empty; do not divide by zero or require y>0 globally. For positive indices the ramp is y/n-1≥0. For nontrivial χ the log derivative term in An.gChi and Deduction.Gchi is exactly y L'(1,χ)/L(1,χ), and the prime sum is the same after removing n=0. For trivial χ, primitivity above implies χ(n)=1, and both expressions are
Gz(y)=sum_{n=1}^m λ(n)(y/n-1)-y log y+(1+E)y.
At nonpositive y the log is the totalized real logarithm used by Lean, not the usual complex logarithm; no analytic continuation is claimed in this algebra identity.
The pinned Gz_eq proves Gz=An.G and An.G=Deduction.G. Current inline formB needs only the first equality, via Nat.le_floor_iff' on n>0, and uses gChi_eq for the rest. The nonprincipal complex equality is stronger than just its real part. Now
Deduction.Gm(F,y)=sum_{i:K} a_i Re Gchi(χ_i,y)
 = Re Gchi(e,y) + sum_{ψ in K.erase(e)} Λ.wt(ψ) Re Gchi(χψ,y)
 = Gz(y)+sum_{ψ in Nt} Λ.wt(ψ) Re An.gChi(χψ,y)
 = Λ.Gm(y).
The first equality after the definition uses subtype-to-finset summation then sum_erase at the actual member e; no multiplicity or residual term lost. A designated odd real member receives its exact original weight. In particular do not multiply zeta by 1/D even if psK is absent.

## 3. Quantifier transfer and logical direction
For all real θ, ZeroFree F θ is equivalent to Λ.ZeroFreeAbove θ by explicit maps ψ∈K ↔ i=⟨ψ,hψ⟩ and i↦i.val with its membership proof, with identical complex s and strict θ<Re(s). Original level_family exports this biconditional plus pointwise signal equality. Current inlined formB only uses the forward implication; reverse is still a valid consequence of the same constructed family, not a claim that HEAD exports the old named lemma.
Now fix la>1, 0<θ<1, and hW: for every real Y0 there exists Y≥Y0 such that for ALL y with Y≤y≤Y^la, Λ.Gm(y)≤y^θ. Choose δ=la-1>0 and C=1. For each Y0 take the SAME witness Y from hW. Since 1+δ=la exactly, and Gm(F,y)=Λ.Gm(y), the analytic power-window premise follows pointwise. Apply pinned zeroFree_of_rpow_window with θ positivity, θ<1, δ positivity, and the window; transfer the conclusion back by the subtype map. Current theorem accepts 0≤θ, supplied by hθ0.le, and ignores only the input θ<1 of the unchanged outer FormBAt. Thus neither revision proves hW; both give hW → nonvanishing, not nonvanishing → hW. No connectedness, arithmetic host existence or GRH follows from this adapter alone. Inversion closure, exceptional-character specification, primitivity and finite index type remain in the native interface.

## 4. Executed certificate
The following JS was actually run in tool runtime. Uses genuine small explicit character values (mod 1, odd real mod 3 and 4, quadratic mod 5 and complex conjugate pair mod 5); finite sets include e and inverse pairs. Tests rational y=q/4 from -2 to 16, weights exactly scaled by D, ramp coefficients exactly scaled by Q=4*lcm(1,...,16), and independent formal symbols log(p), common zeta correction Z and complex log-derivative components. Z deliberately represents the identical common correction as an opaque symbol; not a test of logarithm values or infinite analytic estimates. This checks the finite sum partition algebra independently of floating point. No numerical zeros inferred. Counts are finite assertions, not proof coverage. Negative controls reject nonprimitive principal mod 3, incorrect principal weight, duplicate principal and dropped designated member.

```js
function regression(){
 const check=(b,m)=>{if(!b)throw Error(m)};
 const L=720720n, Q=4n*L;
 const chars=[
 {id:"one",N:1,v:n=>[1,0]},
 {id:"chi3",N:3,v:n=>[[0,0],[1,0],[-1,0]][n%3]},
 {id:"chi4",N:4,v:n=>[[0,0],[1,0],[0,0],[-1,0]][n%4]},
 {id:"chi5q",N:5,v:n=>[[0,0],[1,0],[-1,0],[-1,0],[1,0]][n%5]},
 {id:"chi5i",N:5,v:n=>[[0,0],[1,0],[0,1],[0,-1],[-1,0]][n%5]},
 {id:"chi5-i",N:5,v:n=>[[0,0],[1,0],[0,-1],[0,1],[-1,0]][n%5]}
 ];
 const primes=[2,3,5,7,11,13], base=n=>primes.find(p=>{let t=n;while(t>1&&t%p===0)t/=p;return n>1&&t===1;});
 const add=(m,k,x)=>m.set(k,(m.get(k)||0n)+x);
 const merge=(m,a,k)=>{for(let [s,v] of a)add(m,s,k*v);return m};
 const same=(a,b)=>[...new Set([...a.keys(),...b.keys()])].every(k=>(a.get(k)||0n)===(b.get(k)||0n));
 // q = 4*y; coefficients scaled by Q. Independent formal variables log(p),
 // y*log(y) and (1+EulerGamma)*y (the latter two represented together by Z),
 // and real/imag parts of each nontrivial logarithmic derivative.
 function signal(c,q,mode,component=0){
  const m=new Map(),hi=Math.max(0,Math.floor(q/4));
  const lo=mode==="ramp"?0:1;
  for(let n=lo;n<=hi;n++){
   const p=base(n);if(!p)continue; // includes van Mangoldt(0)=0
   const d=BigInt(q-4*n)*(L/BigInt(n));
   const coeff=mode==="plain"?d:d>0n?d:0n;
   add(m,"log"+p,coeff*BigInt(c.v(n)[component]));
  }
  if(c.id==="one"){if(component===0)add(m,"Z",1n*Q);}
  else add(m,"ell:"+c.id+":"+component,BigInt(q)*L);
  return m;
 }
 let ramps=0,families=0,weights=0,guards=0,neg=0;
 for(let q=-8;q<=64;q++){
  for(let c of chars)for(let j=0;j<2;j++){
   check(same(signal(c,q,"ramp",j),signal(c,q,"clipped",j)),"range/complex equality");ramps++;
  }
  check(same(signal(chars[0],q,"plain"),signal(chars[0],q,"clipped")),"zeta unclipped");guards++;
  for(let o=0;o<=12;o++)for(let mask=0;mask<16;mask++){
   const kept=[chars[0],...chars.slice(1,4).filter((_,i)=>mask&(1<<i)),...(mask&8?chars.slice(4):[])];
   // designated psK either absent or one of the two odd real chars in KEPT.
   for(let exc of [null,...kept.filter(c=>c.id==="chi3"||c.id==="chi4").map(c=>c.id)]){
    const D=BigInt(3*o+1),a=c=>c.id==="one"||c.id===exc?D:1n;
    let lhs=new Map(),rhs=merge(new Map(),signal(chars[0],q,"plain"),D);
    for(let c of kept){check(a(c)>0n,"weight positive");weights++;merge(lhs,signal(c,q,"ramp"),a(c));}
    for(let c of kept.filter(c=>c.id!=="one"))merge(rhs,signal(c,q,"clipped"),c.id===exc?D:1n);
    check(same(lhs,rhs),"family equality");families++;
   }
  }
 }
 // principal modulus 3 is not constant 1 on integers; n=3 and y=4 gives nonzero log3 coefficient.
 const principal3={id:"one",N:3,v:n=>[n%3===0?0:1,0]};
 check(!same(signal(principal3,16,"ramp"),signal(chars[0],16,"plain")),"imprimitive negative");neg++;
 const z=signal(chars[0],16,"plain");
 check(!same(merge(new Map(),z,1n),merge(new Map(),z,4n)),"incorrect principal weight");neg++;
 check(!same(merge(new Map(),z,8n),merge(new Map(),z,4n)),"duplicate principal");neg++;
 check(!same(merge(new Map(),signal(chars[1],16,"ramp"),1n),new Map()),"dropping designated member");neg++;
 return {ramps,families,weights,guards,negativeControls:neg};
}
console.log(regression());
```

Actual result: {"ramps":876,"families":30368,"weights":113880,"guards":73,"negativeControls":4}.
No Lean executable invoked and no performance experiment. The human proof above is general; the test is only finite regression.

RESUME HERE: audit the next consumer in current ZeroFreeAllOfTopG.lean immediately after formB: the exact theorem mapping connected family-scale bounds to ZeroFreeAbove and then ZeroFreeAll, with quantifiers of SupplyChi and primitive/imprimitive transfer; coordinate with math/character boxes and do not repeat their existing zeroFreeOn_of_tiedWin_cyc or everyCharacter derivations. If already fully covered, independently check the equality of original vs current GChiEq proof obligations and Mathlib conductor_one / Nat.le_floor_iff' actual declarations at both manifest pins. Signed-tail audit lane is covering window change of variables, so avoid that overlap. 
HANDOFF TO: integration, editor, prime-window, character boxes, formal audit, kernel. Use Sections 1–3 as exact adapter; keep outer 0<θ<1 and arithmetic hW as named outstanding input. Project OPEN.
