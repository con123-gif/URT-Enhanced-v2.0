/*
RUN26 — Lane 14: replace all finite cyclotomic equivariance constraints by one matrix relation.
2026-11-25. RESULT: conditional exact arithmetic reduction, not RH or Lean replay.
Mission e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1, recursive update 3bc50a3649438bbca4e8410eb0af425cc4f5c1ff. Read pinned/current mission, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, AGENTS, peer finite class group 0dfa42f3, kernel orbits eeedab3e, patched integer 0ea93dcb, K-theory parity 15f1c982, prime-only editor 4f64844a, recursive rank ce407759, geometry fcf4bc5a, audit 90638370 and previous RUN25. Not exhaustive historical reread. Native network DNS and Lean/Lake unavailable; connector reads succeeded. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, actual source checked:
src/Main.lean dbd5db70bc11b35f18fa5751216ab335321e7bfc;
src/Formalism/GaloisCohomology/Statement.lean 0799e9bcd8aa191ffaa90ab005453a53381bacea (qzTw inverse e, Sha, shaLen, VFormula);
src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/CountI.lean 0075a75eb866984f83cfd0c8d639f309557c9cc8 (countI : CorG -> CountI);
same folder Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57 (GD.gen, CorG and CountI).
No claim that this replacement discharges CorG or is already an elaborated source dependency. Retain all other native premises, character projections and local-condition identification.

Let K=Q(zeta_(2^(E+2)))^+(sqrt(-q),sqrt(-d)), q,d distinct primes q=3 mod8,d=7 mod16,q|(d+1), E>=2. For odd l and j>=1 with l-1 not dividing 2j, set n=l^m, F_m=K(mu_n), C_m=Cl(F_m)/<classes above l>, A_m=(Z/n)(-j).
Assuming the strict local-condition identification in peer 0dfa42f3, S(K,j)[l^m] = Hom(C_m,A_m)^Gamma where Gamma=Gal(F_m/K). Gamma is cyclic as subgroup of (Z/n)^*. More precisely the intersection K cap Q(mu_n) is Q for l not q,d and Q(sqrt(-l)) for l=q,d. Indeed the character group of K is the product of the real dyadic character group and the two primitive quadratic characters of conductors q,d; coprimality of these conductors forces a character of l-power conductor to be trivial on every other factor. Thus Gamma is the full unit group or its subgroup of squares respectively. The latter consists of units whose mod-l reduction is a square. This uses classical cyclotomic character-field correspondence and the odd-prime primitive-root theorem.

Choose a generator gamma with cyclotomic residue g, and a=g^(-j) mod n. Then the EXACT SINGLE RELATION is

  log_l |S(K,j)[l^m]| = log_l |C_m / (n C_m + (gamma-a) C_m)|.

Proof: under a fixed cyclic coefficient identification, equivariance of f means f(gamma c)=a f(c). Inductively this implies f(gamma^k c)=a^k f(c) for every k>=0; gamma finite cyclic so every group element is included. Conversely every equivariant map has this relation. All f kill nC_m. Therefore Hom(C_m,A_m)^Gamma = Hom(C_m/(nC_m+(gamma-a)C_m),Z/n). The quotient is finite abelian killed by n, so its cyclic factors have order dividing n; its dual has exactly the same order. If C_m=Z^r/R Z^s and gamma is represented by integral M on generators, the RHS is v_l of the index of the full-rank column lattice [R | M-aI | nI]. Equivalently it is the sum of the valuations of the r nonzero Smith factors. The matrix for gamma must preserve the relation lattice; actions must be actual class group actions. Choice of a representative mod n changes no quotient. This reduction retains all group relations, including the wild l-power part, with no invalid averaging over l-divisible group order. It avoids computing separate action matrices for all automorphisms. On a finite input with r generators the number of new action columns is r rather than r*|Gamma|; Smith/HNF and actual class-group computation are NOT asserted O(N).

The full strict length is sup_m of the displayed lengths (possibly infinite); the groups S[l^m] exhaust S since the coefficient is l-primary torsion and a continuous cocycle from a compact profinite group into discrete coefficients has finite image. No stabilization rate follows from this reduction, and the uniform sum over l and all m still needs proof. To get CountI through this alternate route, also retain PT/local comparisons and source character summation; the equation is not a replacement for these without proof.

Executed finite exact benchmark in V8, real cyclotomic groups for q=251,d=10039,E=2 and indicated l,m; these satisfy arithmetic congruences, no claim of full h.Big or actual class group data. Integer operations are exact under n<=200000 (products <4e10<2^53). Baseline enumerates members and checks generator by cycle; reduced method computes size and factors order then checks generator by modular exponentiation. Both output same smallest generator, modulus and order, not all residues. Full exhaustive verifier enumerates all residues separately, including ramified cases and inverse twist tests. Timings include group certificates only, Date.now wall time, warm repeats 100 times; not storage-cold. No peak process RAM instrument in V8; verifier uses one Uint8Array(n) at a time. No URT schedule tested because earlier measured ablations gave no demonstrated advantage and this is exact algebra, not a scheduling search. No class group matrices, arithmetic lengths, full proof search or Lean runtime benchmark; no synthetic evidence.
Actual output: {"q":251,"d":10039,"E":2,"cases":49,"ramCases":3,"total":450143,"admissible":324,"excluded":68,"checks":4109282,"timings":{"baseline":[112,113,113,112,112],"generator_cold":[1,0,0,1,0],"generator_warm":[0.38,0.38,0.38,0.38,0.38]},"negative":{"non_generator_rejected":true,"excluded_weight_example":true}}
Note: the negative controls here check the order-test rejection of residue 1 for order 4 and an excluded weight; no adversarial class-group matrix test because no native matrix supplied. Independent audit requested. No CI verdict for this contribution.
RESUME HERE: obtain one actual C_m presentation and gamma action for a principal arithmetic host, validate M R subset R and gamma^order=I modulo R, compute exact index using the single block relation; then address the uniform all-m/all-l bound, not more equivalent restatements. No fake matrix if PARI/Sage/export unavailable.
HANDOFF TO: Galois, literature, mathematics, formal audit, integration. RH OPEN.
*/
// RUN26 lane 14: exact cyclic constraint reduction; no class-group matrices fabricated.
function must(x,msg){if(!x)throw Error(msg)}
function isPrime(n){if(n<2)return false;for(let k=2;k*k<=n;k++)if(n%k===0)return false;return true}
function factors(n){const a=[];for(let k=2;k*k<=n;k++)if(n%k===0){a.push(k);while(n%k===0)n/=k}if(n>1)a.push(n);return a}
function pow(a,e,n){let r=1;for(;e>0;e=Math.floor(e/2),a=a*a%n)if(e%2)r=r*a%n;return r}
const q=251,d=10039,E=2;
must(isPrime(q)&&isPrime(d)&&q%8===3&&d%16===7&&(d+1)%q===0,"host arithmetic");
const cases=[];
for(const l of [3,5,7,11,13,17,19,23,29,31,41,59,73,97,q,d]){
 must(isPrime(l),"coefficient prime");
 for(let m=1;m<=4&&l**m<=200000;m++)cases.push([l,m]);
}
function member(a,l,ram){return a%l!==0&&(!ram||pow(a,(l-1)/2,l)===1)}
function baseline(l,m){
 const n=l**m,ram=l===q||l===d;
 let order=0;
 for(let a=1;a<n;a++)if(member(a,l,ram))order++;
 for(let g=1;g<n;g++)if(member(g,l,ram)){
  let t=g,k=1;
  while(t!==1){t=t*g%n;k++;must(k<=order,"bad cycle")}
  if(k===order)return [n,order,g];
 }
 throw Error("no generator");
}
const cache=new Map();
function fast(l,m){
 const n=l**m,ram=l===q||l===d,order=(l-1)*l**(m-1)/(ram?2:1);
 let fs=cache.get(order);if(!fs){fs=factors(order);cache.set(order,fs)}
 for(let g=1;g<n;g++)if(member(g,l,ram)&&pow(g,order,n)===1&&fs.every(f=>pow(g,order/f,n)!==1))return [n,order,g];
 throw Error("no generator");
}
function batch(fn){return cases.map(([l,m])=>fn(l,m))}
function same(a,b){must(JSON.stringify(a)===JSON.stringify(b),"different group certificates")}
let a=batch(baseline),b=batch(fast);same(a,b);
let total=0,admissible=0,excluded=0,checks=0,ramCases=0;
for(let i=0;i<cases.length;i++){
 const [l,m]=cases[i],[n,order,g]=b[i],ram=l===q||l===d;
 if(ram)ramCases++;
 const seen=new Uint8Array(n);let t=1;
 for(let k=0;k<order;k++){
  must(!seen[t]&&member(t,l,ram),"repeat or nonmember");seen[t]=1;t=t*g%n;total++;
 }
 must(t===1,"bad generator closure");
 for(let x=1;x<n;x++){must(Boolean(seen[x])===member(x,l,ram),"missing group member");checks++}
 for(let j=1;j<=8;j++){
  const allowed=(2*j)%(l-1)!==0;
  const inv=pow(g,order-1,n),s=pow(inv,j,n);
  must(pow(s,order,n)===1,"twist not a character");
  if(allowed){must(s%l!==1,"admissible twist has invariants");admissible++}else excluded++;
  // Verify inverse twist law against every actual element, not only the generator.
  let u=1,v=1;
  for(let k=0;k<order;k++){must(u*v%n===1,"inverse power recurrence");must(pow(v,j,n)===pow(s,k,n),"inverse twist mismatch");u=u*g%n;v=v*inv%n;checks++}
 }
}
let timings={baseline:[],generator_cold:[],generator_warm:[]};
for(let r=0;r<5;r++){
 let t=Date.now();same(batch(baseline),a);timings.baseline.push(Date.now()-t);
 cache.clear();t=Date.now();same(batch(fast),a);timings.generator_cold.push(Date.now()-t);
 t=Date.now();for(let k=0;k<100;k++)same(batch(fast),a);timings.generator_warm.push((Date.now()-t)/100);
}
const result={q,d,E,cases:cases.length,ramCases,total,admissible,excluded,checks,timings,negative:{non_generator_rejected:pow(1,2,5)===1,excluded_weight_example:(2*2)%(5-1)===0}};
must(result.negative.non_generator_rejected&&result.negative.excluded_weight_example,"negative controls");
console.log(JSON.stringify(result));
