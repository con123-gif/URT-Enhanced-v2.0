# Prime-window run 3 — exact primitive coefficients from inertia and Frobenius

2026-11-24. RESULT: SOURCE-MATCHED local human reconstruction; mathematical derivation plus executed finite exact regressions. The missing primitive-value producer from RUN2 is located and translated. No claim of Lean kernel execution, full RH proof or URT speedup. Project remains OPEN.

## Preflight and version separation

Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RESEARCH_STATE, the actual runner RESEARCH_LOG and RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, state-branch summary (#357 PASS 09:01 UTC, unrelated Cathedral checks), prior prime runs 1 and 2, latest relevant peer handoffs (math, integration, dependency, structure, formal audit, kernel, acceleration, character boxes, Landau, Galois, theta, literature, positivity, editor). Inventory checked; not every historical peer document read. The others address global witness producers, analytic zero-free conclusions, size algebra, or proof indexing. This run is solely the exact local coefficient identity underlying PrimRead:60. No physical files changed.

PIN = 40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. Observed upstream HEAD c9883164b0b3d762cee21f889d03d59a53b3ba3b (2026-11-24 09:08:06 UTC), 558 commits ahead of last prime-run observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 according to compare API (file list capped at 300). Unlike last run, all six files below have changed blob IDs. Targeted declaration-text comparisons show the same cosetMean/primVal/GPsi, localUnits/IsFrobUnit/cftData/dirChar/PrimValPrimitive, inertia_conductor, cosetMean_eq_primitive, primitive_value_primitive, recH/arith and prim_read. The prime-power proof has removed its redundant alternate simp tactic at HEAD. This is NOT a transitive equivalence audit or an update of the pinned manuscript. Keep the pinned version.

## Source ledger

B=src/Formalism/SizeWindowBrackets/, C=src/Development/AutomorphicArithmetic/PrimitiveCosets/. Blob IDs returned by GitHub for exact pin and observed head; 39 pinned line anchors checked.

| Path | Pinned blob | HEAD blob | Pinned declarations |
|---|---|---|---|
| B/FirstPrimeNeSecondPrime.lean | 18deb7cb85d6f650a69f01fda6e0c789b9f04d89 | d0498cdde8640558c61c6d342dd618e88b89f7a1 | ArithData 38–42; cosetMean 61–63; primVal 65–66; GPsi 68–70; PrimValPow 103–105; OrthoRam 116–121 |
| B/GaloisToProductIsIso.lean | 4f314d4aed9d7969e3f275c9dd03aca3d015ee43 | d54b2973f23f68aef414385a9891c5e1ba1d8dfa | localUnits 12; IsFrobUnit 14–16; frobUnit 18–20; cftData 25–29; dirChar 31–32; FrobUnitSpec 71–72; UnramSpec 74–75; DirCharSpec 80–83; InertiaConductor 85–87; PrimValRamified 89–93; PrimValPrimitive 95–97 |
| B/ChainSlopeWindows/StronglyIrreducible.lean | 94a385f59f3781ae6b1ab4beddc73850708a2bc6 | aa851c8306664ea7e17cd99e5b405eaf817d906f | primitive_value_trivial 213–221; primitive_value_pow 223–229 |
| B/ChainSlopeWindows/GaloisMapComplexConjugation.lean | b08d98f83d661d021b20ccff6c405af78e9afb59 | 3232ce5edad2b896dcec650403eb20478516ac42 | congruences 17–47; exists_unit_crt 49–62; frobenius_unit_spec 64–84; frobUnit_modEq 86–89; unramified_spec 91–108; dirichlet_character_spec/dirChar_unit 113–121; mem_inertia_iff 123–127; trivial_on_inertia_iff 129–143; inertia_conductor 145–153; cosetMean_of_trivial 155–165; cosetMean_of_nontrivial 167–201; primitive_value_ramified 203–207; cosetMean_eq_primitive 209–231; primitive_value_primitive 233–245 |
| C/RecH.lean | b2712cc402765cea3fd406285e05e32a7ce64ec7 | 6b4a0837798826f6cbf21bc052cba0c6e2a9502b | recH 21; arith 23 |
| C/PrimRead.lean | 3960cf3e7d166f6664405a0d5fcb995924621ffb | fc1f2ef9e2181f65505b61619d9e6c0506c558fc | prim_read 48–97, hval 56–61 |

Names in the principal local proof are in Formalism.LFunctionChainParameters.LHost; primVal and primitive_value_pow in Formalism.LFunctionChainParameters.characterSumData. Source-text references, not extracted kernel edges. Source can be retrieved via https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ followed by path and #L range.

## 1. Full quantifiers and definitions

Let H be any finite additive commutative group with decidable equality, G=E0×H, E0=(Z/2)^2. Fix N∈N with N≠0, arbitrary q1,d∈N, any homomorphism r:U_N=(Z/NZ)^×→G written multiplicatively in Lean, and any complex additive character ψ:G→C. No surjectivity of r, conditions on q1 or d, or special host prime restrictions are needed for PrimValPrimitive. Write χ=dirChar(r,ψ), so χ(u)=ψ(r(u)) on units, χ(x)=0 on nonunits. Let c=conductor(χ), χ*=primitiveCharacter(χ), with c|N and χ the changeLevel of χ*. The nonunit rule for χ* applies modulo c, not modulo N.

For a prime p split N=P M with P=p^{v_p(N)}, p∤M. P is ordProj[p]N and M is ordCompl[p]N. Define localUnits K_p=ker(U_N→U_M); inertia I_p=r(K_p) (as an additive subgroup), and f_p=r(w_p), where w_p is the unique unit satisfying w_p≡p mod M and w_p≡1 mod P. For N=1 or P=1 the congruences modulo 1 are vacuous and the trivial unit group is permitted. Source frobUnit has a fallback 1 if a witness fails to exist, but existence is proved under N≠0 and p prime (64–84); the fallback is not used in this argument.

The exact mean is A_I(h,ψ)=(1/|I|)Σ_{x∈I}ψ(h+x), with each subgroup element counted ONCE. I contains 0 so denominator never vanishes. Define primVal(D,ψ,n)=Π_{p∈primeFactors(n)} A_{I_p}(v_p(n) f_p,ψ). For n=1 this is the empty product 1. For n=0, do not extend the primitive-character identity: Lean theorem explicitly requires n≠0. For arbitrary real y the GPsi definition is the separate Gz(y) branch if ψ=0; otherwise sum over n=1,...,floor_nat(y) of Λ(n) primVal(n)(y/n−1) plus y ell(ψ). Here Λ is von Mangoldt, zero off prime powers. Thus all values used in the finite sum obey n≠0, even if y<1 (empty sum). This run does not derive ell or Gz, and does not replace the principal branch.

## 2. CRT supplies the Frobenius representative

Because P and M are coprime, Chinese remaindering is a ring isomorphism Z/N≅Z/P×Z/M inducing the corresponding unit-group isomorphism. The element (1,p) consists of units because gcd(p,M)=1. Its inverse image is w_p. If two units satisfy the two congruences, their residues differ by a multiple of P and M, hence of N; they are equal. This is exactly exists_unit_crt and frobenius_unit_spec. The kernel K_p corresponds to U_P×{1}. If p∤N, P=1 and M=N, so K_p is trivial, I_p={0} and w_p=p modulo N. This is unramified_spec. If p|N it is NOT enough to use p modulo N, since p is then a nonunit.

## 3. Ramification detected by the character conductor

trivial_on_inertia_iff (129–143) proves
  [∀x∈I_p, ψ(x)=1] iff c|M.
Indeed I_p is exactly the image of K_p. Thus ψ is trivial on I_p iff the unit character χ is trivial on the kernel K_p of U_N→U_M. That reduction is surjective by the CRT above. A character descends through a surjective homomorphism iff it kills its kernel: if lifts u,v have the same reduction, uv^{-1}∈K_p, so χ(u)=χ(v); conversely a descended homomorphism maps K_p to 1. The Lean proof uses DirichletCharacter.mem_conductorSet_iff_conductor_dvd, mem_conductorSet_iff and factorsThrough_iff_ker_unitsMap. The conductor is the minimal level in the precise divisibility sense given by those Mathlib results; retain them as upstream source dependencies, not an assumed theorem about RH.

Since c|N and p∤M, c|M iff p∤c: the forward direction is immediate, the reverse follows by factoring N=P M and removing every p-power from a divisor not divisible by p. This yields inertia_conductor (145–153), with N≠0 and p.Prime. Notice the distinction: p|N can coexist with p∤c, i.e. a ramified host but character unramified at p. Do not zero its coefficient just because p divides N.

## 4. Average as exact character projector

For any finite subgroup I≤G and any h∈G,
  A_I(h,ψ)=ψ(h) if ψ|_I=1; otherwise 0.
If ψ|_I=1 each summand equals ψ(h); divide by |I| (positive). Otherwise choose t∈I with ψ(t)≠1. Translation x↦t+x is a bijection I→I (inverse x↦x−t). For S=Σ_{x∈I}ψ(h+x), S=Σψ(h+t+x)=ψ(t)S; as C is a field and 1−ψ(t)≠0, S=0. These are cosetMean_of_trivial and cosetMean_of_nontrivial. The proof is over all complex characters, not only real ones. It does not use a probability approximation.

For k≥1 and prime p, the prime factors of p^k form the singleton {p}, valuation k. Thus primitive_value_pow reduces primVal(D,ψ,p^k) to A_{I_p}(k f_p,ψ). The preceding projector gives primitive_value_ramified: ψ(f_p)^k if ψ trivial on I_p, zero otherwise. The averaging subgroup is I_p, NOT k I_p. The latter can collapse a nontrivial character for even k, yielding a wrong answer.

## 5. Identify the mean with the primitive Dirichlet coefficient

cosetMean_eq_primitive (209–231) states under N≠0, p prime, k≠0:
  A_{I_p}(k f_p,ψ)=χ*(p mod c)^k.

Case 1: ψ|_I=1. Then c|M. We have w_p≡p mod M, hence w_p≡p mod c. Because w_p is a unit modulo N, χ(w_p)=ψ(f_p). Since χ=changeLevel(χ*) and χ on units reads the primitive character on the residue modulo c, χ(w_p)=χ*(w_p mod c)=χ*(p mod c). Raising to k matches the mean. This argument remains valid when p divides N but not c. It is exactly the changeLevel_primitiveCharacter and changeLevel_eq_cast_of_dvd step at 219–223.

Case 2: ψ|_I not trivial. By the conductor criterion p|c. Therefore gcd(p,c)≠1 (p prime, p>1) and p mod c is not a unit. MulChar.map_nonunit gives χ*(p)=0; since k≠0, χ*(p)^k=0. The projector is zero as well. k≠0 is essential; the Lean statement does not assert zero for exponent zero.

Combining the cases and multiplicativity, for EVERY n≥1,
  primVal(D,ψ,n)=Π_{p|n} χ*(p)^{v_p(n)}=χ*(n mod c).
Use unique factorization, cast_prod, map_prod, cast_pow, map_pow. The theorem primitive_value_primitive (233–245) explicitly requires N≠0 and n≠0, does not assume n coprime to N, and includes n=1 via empty product. This proves the missing coefficient equality used by prim_read. Substitution r=recH(R), N=R.condN and D=arith(R) gives exactly PrimRead:56–61; the source calls with HostRaw.condN_pos and reverses the equality. HostAddCharCompatible, the separate zero-character branch and all prime-window power-bound hypotheses remain as in RUN2. No Gm bound follows from character orthogonality by itself.

## 6. Exact regression, including three failure modes

Executed in V8 via connector orchestration on 2026-11-24. The fixtures are actual finite Dirichlet characters of conductors 1,3,4,5,7,8,12,15,20,24,35, including quartic complex characters and products. They are lifted to every multiple N≤160. Values use exact integer Gaussian pairs {±1,±i}; no floating trigonometry. For this finite regression take H=Z/4, r mapping units to their character exponent in H (E0 coordinates zero), ψ the fourth-root character. This is a valid special case of the general theorem. It is not a test of the entire original host or all finite characters. The analytic proof above, not these counts, gives the general conditional identity.

Actual counters: hosts 452 (character/level instances); multiplicativity checks 1,179,442; independent conductor-divisor checks 3,181; CRT uniqueness 18,532; inertia criterion 18,532; prime-power equality 74,128; average over units versus distinct inertia-image equality 74,128; multiplicative natural values 81,360 (n=1..180); host-level-zero negative controls 2,352; zero-exponent negative controls 333; incorrectly scaled inertia negative controls 333. All assertions succeeded. 39 source anchors also checked across six pinned blobs. No native Lean execution.

For a concrete counterexample to an imprimitive substitution, lift the trivial character of conductor 1 to level 4: χ(2)=0 while χ*(2)=1. For a nontrivial character on inertia of order dividing 4, using 4I rather than I makes the wrong mean 1 instead of 0. This is tested. The average over units (each has same number of lifts in its image under r) agrees with the average over distinct image elements; do not replace the source normalization with the full group cardinality.

Reproduce the exact finite regression by saving this JS block as a .js file and running node. These are the same algorithm and bounds executed in V8. It is not a Lean kernel test.

~~~js
function certificate(){
 const gcd=(a,b)=>b?gcd(b,a%b):a;
 const units=n=>Array.from({length:n},(_,i)=>i).filter(x=>gcd(x,n)===1);
 const mod=(x,n)=>((x%n)+n)%n;
 const primes=n=>{const a=[];for(let p=2;p<=n;p++){if(n%p===0){a.push(p);while(n%p===0)n/=p;}}return a;};
 const split=(n,p)=>{let a=1;while(n%p===0){a*=p;n/=p;}return [a,n]};
 const roots=[[1,0],[0,1],[-1,0],[0,-1]];
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 const eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
 const ok=(b,...s)=>{if(!b)throw Error(s.join(" "));};
 const leg=(a,p)=>{a=mod(a,p);if(a===0)throw Error("nonunit");for(let j=1;j<p;j++)if(j*j%p===a)return 0;return 2;};
 const q5=a=>{let b=1;for(let j=0;j<4;j++){if(mod(a,5)===b)return j;b=b*2%5;}throw Error("nonunit");};
 const e4=a=>mod(a,4)===1?0:2;
 const e8=a=>[1,7].includes(mod(a,8))?0:2;
 const fixtures=[
 [1,a=>0,"principal"],[3,a=>leg(a,3),"quadratic3"],[4,e4,"odd4"],[5,a=>leg(a,5),"quadratic5"],
 [5,q5,"quartic5"],[5,a=>mod(-q5(a),4),"inverseQuartic5"],[7,a=>leg(a,7),"quadratic7"],
 [8,e8,"even8"],[8,a=>mod(e4(a)+e8(a),4),"odd8"],[12,a=>mod(e4(a)+leg(a,3),4),"product12"],
 [15,a=>mod(leg(a,3)+q5(a),4),"product15"],[20,a=>mod(e4(a)+q5(a),4),"product20"],
 [24,a=>mod(e8(a)+leg(a,3),4),"product24"],[35,a=>mod(q5(a)+leg(a,7),4),"product35"]
 ];
 const counts={hosts:0,homomorphism:0,conductorDivisor:0,CRT:0,inertiaCriterion:0,primePower:0,unitVsImage:0,allNatural:0,imprimitiveNegativeControls:0,zeroExponentNegativeControls:0,scaledInertiaNegativeControls:0};
 for(const [c,E,name] of fixtures){
  const val=n=>gcd(n,c)===1?roots[mod(E(n),4)]:[0,0];
  for(let N=c;N<=160;N+=c){
   const U=units(N);const ex=u=>mod(E(u),4); counts.hosts++;
   for(const a of U)for(const b of U){ok(ex(a*b)===mod(ex(a)+ex(b),4),name,N,a,b);counts.homomorphism++;}
   for(let d=1;d<=N;d++)if(N%d===0){
    const map=new Map();let fact=true;
    for(const a of U){const k=a%d,v=ex(a);if(map.has(k)&&map.get(k)!==v)fact=false;map.set(k,v);}
    ok(fact===(d%c===0),"conductor",name,N,d);counts.conductorDivisor++;
   }
   const pset=new Set([...primes(N),...Array.from({length:179},(_,i)=>i+2).filter(p=>primes(p).length===1&&primes(p)[0]===p)]);
   const cache=new Map();
   for(const p of pset){
    const [a,M]=split(N,p);
    const I=U.filter(u=>u%M===1%M);
    const F=U.filter(u=>u%M===p%M&&u%a===1%a);
    ok(I.length>0&&F.length===1,"CRT",N,p);counts.CRT++;
    const w=F[0];const J=[...new Set(I.map(ex))];
    const trivial=J.every(j=>j===0);ok(trivial===(c%p!==0),"inertia",name,N,p);counts.inertiaCriterion++;
    for(let k=1;k<=4;k++){
     let sr=0,si=0,ur=0,ui=0;
     for(const j of J){const z=roots[mod(k*ex(w)+j,4)];sr+=z[0];si+=z[1];}
     for(const u of I){const z=roots[mod(k*ex(w)+ex(u),4)];ur+=z[0];ui+=z[1];}
     const v=val(p**k);
     ok(sr===J.length*v[0]&&si===J.length*v[1],"mean",name,N,p,k);counts.primePower++;
     ok(ur*J.length===sr*I.length&&ui*J.length===si*I.length,"fibres",name,N,p,k);counts.unitVsImage++;
     if(N%p===0&&c%p!==0){ok(!eq(v,[0,0]),"nonunit correction");counts.imprimitiveNegativeControls++;}
     if(!trivial&&k===1){ok(!eq(val(1),[0,0]),"zero exponent");counts.zeroExponentNegativeControls++;}
     if(!trivial&&k===4){
      const wrong=J.map(j=>roots[mod(k*(ex(w)+j),4)]).reduce(([x,y],[z,t])=>[x+z,y+t],[0,0]);
      ok(eq(wrong,[J.length,0])&&eq(v,[0,0]),"scaled inertia");counts.scaledInertiaNegativeControls++;
     }
     cache.set(p+":"+k,[sr/J.length,si/J.length]);
    }
   }
   for(let n=1;n<=180;n++){
    let v=[1,0],m=n;
    for(const p of primes(n)){
     let k=0;while(m%p===0){k++;m/=p;}
     let w=cache.get(p+":"+k);
     if(!w){const [a,M]=split(N,p),I=U.filter(u=>u%M===1%M),F=U.find(u=>u%M===p%M&&u%a===1%a);
      const J=[...new Set(I.map(ex))];const s=J.map(j=>roots[mod(k*ex(F)+j,4)]).reduce(([x,y],[z,t])=>[x+z,y+t],[0,0]);
      w=[s[0]/J.length,s[1]/J.length];}
     v=mul(v,w);
    }
    ok(eq(v,val(n)),"natural product",name,N,n);counts.allNatural++;
   }
  }
 }
 return counts;
}
console.log(certificate());
~~~

Source replay: git rev-parse PIN:path for each full path in table, or git show PIN:path | git hash-object --stdin; compare each blob and listed declaration/line to PIN. Exact line checks executed this session via connector, not a local Git clone. For a stronger independent audit, recover locked Mathlib versions of mem_conductorSet_iff_conductor_dvd, factorsThrough_iff_ker_unitsMap, changeLevel_primitiveCharacter, changeLevel_eq_cast_of_dvd and verify all implicit NeZero instances and proof terms. Do not confuse passing general Cathedral CI with validation of this Lean proof.

RESUME HERE: use actual StronglyIrreducible.lean lines 274–325 (ortho_coset, orthogonality_ramified, orthogonality_unramified), then 523–694 (characterSum_expansion) and 695–end (colour_balance) to reconstruct the exact ASK−MAIN=De Fourier identity. First derive factor 2/|I|, including the double coset singleton for p=d and exclusion of 2,q1. Preserve HostFacts, a>0, positivity on PhiSet, and finite truncation N conditions; do not repeat the conductor proof. This is the arithmetic signal expansion, NOT the global size bound. Verify Mathlib character orthogonality provenance and request independent audit of this chapter.

HANDOFF TO: formal audit, integration, proof editor, Galois, Landau, math and character-box lanes. Attach this as the proof of primitive_value_primitive in the human manuscript; independent audit of conductor and modulus-one exceptions still pending. 
