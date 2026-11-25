# Integration 2026-11-25 07:00 — actual CountI supplier and principal-character orbit saving

Status: one source-bound human reconstruction/improvement, conditional. Not a full RH proof, not a kernel replay, not a URT benchmark.

## Continuity

Read SWARM_PROTOCOL first, AGENTS, research state, runner log/protocol, continuity, HANDOFF_QUEUE and expansion. Follow the current simplicity pivot rather than the previous Jacobson-density continuation (deferred, not discarded). Read latest checkpoint excerpts from math, editor, audit, geometry, literature, character boxes, Galois, theta, Landau, structure, prime, kernel, dependencies and acceleration. Peer context: principal host 26e90fe6, Count reduction 49631f4b, CountIV vanishing 9ad1dec5 (candidate human argument; not independently certified here), editor b9cd0062, audit d5f4c851, dependencies f6b396aa. Previous integration ca285468. External blueprint not reopened. General orchestrator PASS at 06:53:00Z run 45561155528, checkpoint 425; not RH kernel verification. Source repository leanprover-community/riemann-hypothesis pinned 40e56bab026552e089d7afcfeff08d2defb9c005; observed newer main a18a350c3e5aad997766cff2670b292313e46574 not used.

## Correct actual supplier

MainConclusion.everyCharacter_of_row calls vwin_of_row. VwinOfRow through TopMainZj invokes v_window_of_literal_automorphy_n. WindowBoundOfLiteratureLevel lines 25–34 uses count_i_of_printed_bound_k_kato_automorphy. The missing source is **LinkedUnlE.lean lines 49–54**. It invokes U3.countI (U3.corGK (propGK_of_numberU3U_of_oneCharU ...)). The older HeightAndVanishing/CountI.lean is a different theorem with premise CorG. Do not import its fixed N^18 e^7 disc^5 exponent into this actual CorGK route. Current bound has constants c5,A natural, depending on K, fixed before e,N,orbit,coefficient primes.

Exact assembly inputs: hH : HypothesesH', hK : exists CK, LemmaK CK, hKa : WeilSphericalRecords.KatoTwoW, h3 : AutomorphyUnramifiedCoefficientsAlt. Set hC=cohInp_alt hH.litN hK, hE=unlEnd3E (linkedUnlE_alt hH). Supplier numberU3U_of_prints hH.toClassicalTheorems gives NumberU3U_s; oneCharU_of_katoTwoW_rig_admI_automorphy consumes hC, Alg.M.main_holds, Alg.M.mprime_holds, Alg.lemmaP, hKa, rigIUE_alt hC hH (adjoint_lifting_of_cohomology hH) hE, rigII_a_alt hC hH (adjoint_lifting_of_cohomology hH), admissible_typeI_even_level_alt hC hH hE, h3. No assumption removed.

For fixed orbit kernel K', the PropGK argument supplies a nonzero integer NN **before** the coefficient prime l, algebraic closure, coefficient ring and representations are selected. NumberU3U_s requires its root-of-unity orbit and automorphism stability, the chosen place and Frobenius, and yields the norm-product lower bound and size upper bound. OneCharU_s supplies Vlen finiteness and Vn bounded by twice the sum of valuations of nonzero trace differences for pairwise nonisomorphic representations. FPropGKU matches the character orbit and Frobenius inverse traces, then takes valuations to obtain Vn orbit sum <= 2 v_l(NN). The exact GD fields remain: odd coefficient prime, e>=1, N even, l not dividing character order, comp l psi squared trivial, parity, imaginary quadratic field, l coprime to discriminant times class number, discriminant coprime to N, eta kernel noncontainment, and l-1 not dividing 2e.

Human CorGK step: use two distinct admissible auxiliary primes p,p'. For l != p apply the single-prime integer from PropGK; for l=p apply the integer associated with p'. Summing nonnegative valuations times log l over arbitrary finite prime subsets is bounded by log |NN_p|+log |NN_p'| via prime factorization, giving the CorGK constant 2 c5 phi(index)(N(e+1))^A(log p+log p'). If e=0, nonempty GD selection is impossible, so the prime set must be empty. This explains the mathematical mechanism but exact native corGK body and axiom dependencies remain open.

## Principal-only saving (one improved orbit estimate)

Specialize chi=PChar.one, q=o=1, tower exponent E=h.ex>=2, N=2^(E+2) q1 d. Keep all source host conditions. The Host.H definition is the intersection of the inverse image of {+1,-1} at the dyadic modulus, the trivial base-character kernel, and the square subgroups at q1,d. CRT and the distinct primes congruent to 3 mod 4 yield G/H = C_(2^E) x C2 x C2. The image of -1 is (0,1,1), nontrivial. The source mem_X says each psi has kernel containing H and psi(-1)=(-1)^e.

Let T be the distinct kernels from all selected coefficient-prime fibers, exactly as U3.countI lines 61–62. Every K' in T contains H, has cyclic quotient, and contains -1 exactly when e is even (coefficient primes odd, coefficient ring domain characteristic zero). All complex characters with this kernel have the SAME parity: their value at -1 has order <=2, and is 1 iff -1 belongs to K'. Distinct kernels give disjoint character sets. A cyclic quotient of size m has exactly phi(m) faithful complex characters. Therefore

    sum_{K' in T} phi([G:K']) <= 2^(E+1)

because exactly half the 4*2^E characters of G/H have prescribed parity. This is stronger than the native upper bound N, even when coefficient rings lack roots of unity. No assumption of a common coefficient-ring embedding across primes is needed: the count is in the complex dual.

Choose r1=211,r2=223 (both prime, satisfying original lower bounds 30*1*7+1 and r1+1). Retain r_i<q1,d, all Big t constraints, arbitrary finite Ls of odd CaseI primes and arbitrary coefficient systems, 0<e<t, all algebraic closure hypotheses. For K=Q(sqrt(-7)) the source CorGK constants c5,A are fixed; the original gdOfHost supplies GD for each occupied fiber. Apply the original hcorK finiteness and weighted bounds without modification. Summing using the sharper kernel mass gives

    S_I <= 2*c5*2^(E+1)*(N*(e+1))^A*(log 211+log 223).

Here S_I is the exact native sum over l in Ls of log(l) sum_{psi in X(c l,e)} Vn. The finiteness conclusion is unchanged. This improves the orbit-count prefactor by 2*q1*d relative to the native bound N; it does not bound c5 or A, establish CorGK independently, or prove RH. The original exponent absorption still works. Do not apply this principal-only argument to general chi. The unmodified complete original proof remains a separate target.

## Typed obligation graph (incremental, not exhaustive)
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "source-level selected graph, not authenticated kernel closure",
  "nodes": [
    {
      "id": "everyCharacter_of_row",
      "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean",
      "blob": "ee340012ab19713a8acfecf8adc6a331cbc2f1a4",
      "lines": "7–9",
      "status": "source-read"
    },
    {
      "id": "vwin_of_row",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean",
      "blob": "4cba179acd45ac08d3cad21f51c9b9d62715a9a4",
      "lines": "4–5",
      "status": "source-read"
    },
    {
      "id": "v_window_of_literal_automorphy_n",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean",
      "blob": "01c499108485b16d33791a9e46fbb1e2af865522",
      "lines": "25–34",
      "status": "source-read"
    },
    {
      "id": "count_i_of_printed_bound_k_kato_automorphy",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean",
      "blob": "01ff1f8cd56f56488e044a35443a8eda3d5d0e3e",
      "lines": "49–54",
      "status": "source-read"
    },
    {
      "id": "propGK_of_numberU3U_of_oneCharU",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FPropGKU.lean",
      "blob": "4887bdf435a54a8ab856102e15d60da39d041970",
      "lines": "110–172",
      "status": "source-read"
    },
    {
      "id": "NumberU3U_s; OneCharU_s",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/NumberU3US.lean",
      "blob": "b31b9a1b9f3e84a792e915f864c681034c9eb258",
      "lines": "30–59",
      "status": "source-read"
    },
    {
      "id": "PropGK; CorGK",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/KatoUse.lean",
      "blob": "f4c048cb3bf45f91461b536bae82636a22467ed3",
      "lines": "36–52",
      "status": "source-read"
    },
    {
      "id": "U3.countI",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/CountI.lean",
      "blob": "9e3faf892430e58c8d5f8d92e4196d838346c674",
      "lines": "22–137",
      "status": "source-read"
    },
    {
      "id": "GD; CountI",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean",
      "blob": "0d9f87aacf2d53abe43d894c1d822f071599ee57",
      "lines": "9–22,53–58",
      "status": "source-read"
    },
    {
      "id": "gdOfHost",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/GdOfHost.lean",
      "blob": "8ab8e7e79a09e2d7f00292d525733fac8badfae2",
      "lines": "37–59",
      "status": "source-read"
    },
    {
      "id": "orbFacts",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/OrbFacts.lean",
      "blob": "3e9cc961e8adf343cb1dce03b6765402605dfb64",
      "lines": "17–20",
      "status": "source-read"
    },
    {
      "id": "orbSum",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/OrbSum.lean",
      "blob": "3596c37deeaa00866afb256a16181c4891878e87",
      "lines": "44–58",
      "status": "source-read"
    },
    {
      "id": "hostIndex",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/HostIndex.lean",
      "blob": "ccc755aa50d8c7e732d74d5d6bd211f7d903c419",
      "lines": "67–71",
      "status": "source-read"
    },
    {
      "id": "Host; PsiEven; mem_X; mem_orb",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean",
      "blob": "1feb420e376868ca41d85fb09bc4f8c7ee66778e",
      "lines": "104,143–219",
      "status": "source-read"
    },
    {
      "id": "HV.countI (alternative)",
      "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/CountI.lean",
      "blob": "0075a75eb866984f83cfd0c8d639f309557c9cc8",
      "lines": "19–20",
      "status": "source-read"
    }
  ],
  "edges": [
    {
      "from": "everyCharacter_of_row",
      "to": "vwin_of_row",
      "role": "source-call"
    },
    {
      "from": "v_window_of_literal_automorphy_n",
      "to": "count_i_of_printed_bound_k_kato_automorphy",
      "role": "transitive source route via vwin_of_hypotheses_H_E_alt"
    },
    {
      "from": "count_i_of_printed_bound_k_kato_automorphy",
      "to": "U3.countI",
      "role": "source-call"
    },
    {
      "from": "count_i_of_printed_bound_k_kato_automorphy",
      "to": "U3.corGK",
      "role": "source-call; supplier file open"
    },
    {
      "from": "count_i_of_printed_bound_k_kato_automorphy",
      "to": "propGK_of_numberU3U_of_oneCharU",
      "role": "source-call"
    },
    {
      "from": "propGK_of_numberU3U_of_oneCharU",
      "to": "NumberU3U_s; OneCharU_s",
      "role": "premise"
    },
    {
      "from": "U3.countI",
      "to": "PropGK; CorGK",
      "role": "premise CorGK"
    },
    {
      "from": "U3.countI",
      "to": "gdOfHost",
      "role": "source-call"
    },
    {
      "from": "U3.countI",
      "to": "orbFacts",
      "role": "source-call"
    },
    {
      "from": "U3.countI",
      "to": "orbSum",
      "role": "source-call"
    },
    {
      "from": "U3.countI",
      "to": "hostIndex",
      "role": "source-call"
    },
    {
      "from": "U3.countI",
      "to": "GD; CountI",
      "role": "type/goal"
    },
    {
      "from": "U3.countI",
      "to": "Host; PsiEven; mem_X; mem_orb",
      "role": "source-call"
    }
  ],
  "open": [
    "exact U3.corGK declaration path and elaborated proof",
    "NumberU3U_s supplier",
    "OneCharU_s supplier",
    "root kernel dependency and axiom closure",
    "formalization of principal improvement"
  ]
}
```

## Reproducible finite regression

Executed ECMAScript enumeration (no Lean kernel). Each tested group is precisely the abstract principal host quotient, not the native cohomological module. Enumerate character kernels independently by checking every group element, compare indices, verify each fiber equals phi(index), parity invariance, exact half-dual totals and a negative control showing that ignoring parity doubles the total. Auxiliary prime check by trial division. Run following as node script:
```js
function check(x){if(!x)throw Error("regression failed")}
function gcd(a,b){while(b){[a,b]=[b,a%b]}return a}
function phi(n){let z=0;for(let i=1;i<=n;i++)if(gcd(i,n)===1)z++;return z}
function prime(n){return n>=2&&Array.from({length:Math.floor(Math.sqrt(n))-1},(_,i)=>i+2).every(d=>n%d!==0)}
let chars=0,kernelChecks=0,fibers=0,parityChecks=0,negative=0;
for(let E=2;E<=8;E++){
 const M=2**E, order=4*M, groups=new Map();
 for(let k=0;k<M;k++)for(let a=0;a<2;a++)for(let b=0;b<2;b++){
  const K=[]; for(let x=0;x<M;x++)for(let u=0;u<2;u++)for(let v=0;v<2;v++){
   if((k*x+(M/2)*(a*u+b*v))%M===0)K.push(4*x+2*u+v);
   kernelChecks++;
  }
  const key=K.join(","), p=(a+b)%2, idx=order/K.length;
  check(idx===M/gcd(gcd(gcd(M,k),a*M/2),b*M/2));
  check(K.includes(3)===(p===0));chars++;
  if(!groups.has(key))groups.set(key,{idx,p,n:0});
  const g=groups.get(key);check(g.idx===idx&&g.p===p);g.n++;
 }
 let totals=[0,0];
 for(const g of groups.values()){check(g.n===phi(g.idx));totals[g.p]+=g.n;fibers++}
 check(totals[0]===2*M);check(totals[1]===2*M);parityChecks+=2;
 check(totals[0]+totals[1]>2*M);negative++;
}
check(prime(211)&&prime(223)&&211>=30*7+1&&223>=212); 
console.log(JSON.stringify({chars,kernelChecks,fibers,parityChecks,negative,primePair:1}));
```
Observed: {"chars":2032,"kernelChecks":1398016,"fibers":168,"parityChecks":14,"negative":7,"primePair":1}. These are finite regression checks, not evidence for the cohomology estimate or an asymptotic proof. Mathematical derivation above is general E>=2. No URT advantage claimed.

## Failed attempts / limitations

Root-level RESEARCH_LOG/PROTOCOL paths returned 404; corrected to runner paths. TorsClass source search and exact corGK search returned no results; guessed UnitaryThreeGroups/CorGK.lean returned 404. Exact CountI route recovered by import traversal. No independent reviewer has yet evaluated this new improvement. No native Lean or full transitive axiom replay performed. Graph records source calls, not exported proof-term edges. General CI before this commit only. Full human-readable reconstruction OPEN; no meaningful completion percentage available.

## RESUME HERE

Galois/math: reconstruct numberU3U_of_prints and oneCharU_of_katoTwoW_rig_admI_automorphy (LinkedUnlE lines 52–54), keeping fixed-before-primes integer quantification, and recover exact U3.corGK body. Kernel/dependency: authenticate the value-role edges from this actual CountI supplier; distinguish legacy CorG. Editor: incorporate the principal orbit saving as a conditional lemma, not as a replacement for the full proof. Audit: verify parity transfer and all quantifier guards; compare with CountIII/IV peer results. No unrelated Cathedral modifications.
