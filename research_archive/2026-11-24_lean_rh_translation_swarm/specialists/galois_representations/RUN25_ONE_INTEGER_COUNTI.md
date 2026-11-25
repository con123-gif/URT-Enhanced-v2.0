# RUN25 — one integer controls all Case I characters and coefficient primes
2026-11-25. Lane 5 of ONE_EQUATION_MISSION. Status: conditional human theorem, SOURCE-MATCHED premises; RH OPEN. No Lean kernel/CI replay, no URT. Prior RUN24 remains unchanged.

Continuity: read mission at e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 (blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d), current mission (same), SWARM, HANDOFF_QUEUE, EXPANSION, AGENTS, research state/log/protocol/continuity excerpts and summary (general CI #426 at 07:12 UTC, not RH). Read peer 0dfa42f3 finite class-group reduction, 7c4c328c fixed-prime stabilization, eeedab3e orbit compression, bc7dd46f actual CountI path, 9c7751fd dyadic defects, a5911b27 dependency, ce477f4e acceleration, 7a9ec19f prime mesh, ce3c04a5 Landau obstruction. This replaces neither the original full proof nor other lanes' obligations. Unlike the prior per-kernel CorGK aggregation, the construction below uses the entire admissible parity family in one integer construction per auxiliary prime.

## Decisive conditional CountI equation
Fix a principal host h with N=2^(E+2) q1 d, E>=2, and G=(Z/N)^*/H=C_(2^E) x C2 x C2. Fix weight e>=1, e<t, all native h.Big t and host premises; K=Kstar(pK(h.chi))=Q(sqrt(-7)) for the principal character, not the varying large host field. Let O_l be any native Coef l. For odd CaseI l, let X_l=h.X(c_l,e). Define A_l=sum_{psi in X_l} Vn(Omega,c_l,e,psi). Retain all source GD hypotheses from gdOfHost (odd l, positive e, even N, prime-to-l order, comp(l,psi)^2=1, PsiEven, imaginary quadratic K, l coprime to discriminant times class number, discr coprime to N, eta kernel noncontainment, l-1 not dividing 2e). Require a common algebraic closure with K embedding as in native source.

Assume the actual native NumberU3U_s and OneCharU_s statements. Choose distinct auxiliary primes p,r not dividing 30*N*|disc K|, with original bounds p,r<q1,d; e.g. native lower threshold 211, r=223 for principal if host permits. Define Orb as ALL complex characters of G of parity (-1)^e at -1, rather than a single kernel orbit. Orb has size 2^(E+1); this is the peer parity mass, not a new count. Pick a place w over p and let Q=norm(w). Apply NumberU3U_s once to Orb with z(chi)=chi(Q)^(-1). Q is a unit modulo N; each z is a root of unity, and every complex field automorphism permutes Orb by postcomposition, fixing parity and H. It yields a nonzero integer n_p fixed before every coefficient prime, ring, closure and representation choice. Repeat for r to get n_r.

For a CaseI l != p, choose the source embedding iota:Qbar_l~C and an extension place B over w and Frobenius sigma. Map every psi in X_l to its complex character chi=iota(comp psi); this is injective and belongs to Orb (kernel containment/parity preserved). No surjectivity or splitting of the coefficient ring is required. Use hD=NumberU3U_s's uniform norm-product conclusion on singleton representation sets in each Orb slot (all other slots empty) to get nonzero trace difference for every admissible representation. The source FPropGKU.frob_val and t_eq identify the reference trace at sigma^{-1} with iota^{-1}(eis3(Q,e,z(chi))); do not reverse the Frobenius normalization. Apply OneCharU_s to each psi using gdOfHost. This yields finite Vlen and a finite set X(psi) of mutually nonisomorphic admissible reps with Vn <= 2 sum v_l(trace difference). Fill each Orb slot with X(psi) if chi is the image of psi, empty otherwise. Now apply hD to these sets simultaneously. Taking -log_l of its norm inequality (all differences nonzero) gives A_l <= 2 v_l(n_p). Exactly the same proof gives A_l<=2 v_l(n_r) for l!=r. This bypasses the per-kernel orb_equiv, gdFacts propagation, CorGK and the final fiberwise summation for the principal CountI-only argument; none of the deep input hypotheses is removed.

For positive a=|n_p|, b=|n_r|, write a_0=a/(p^v_p(a)*r^v_r(a)) and b_0=b/(p^v_p(b)*r^v_r(b)). Define the patched gcd integer

    B = p^v_p(b) * r^v_r(a) * gcd(a_0,b_0).

For all CaseI odd l, including p and r when admissible,

    A_l <= 2 v_l(B),     sum_{l in ANY finite Ls} log(l) A_l <= 2 log B.

Proof: if l=p use n_r; if l=r use n_p; otherwise take the min of both valuations. Unique factorization gives the finite-sum bound and B divides ab. Thus all actual CaseI contributions outside the prime divisors of B vanish (each Vn nonnegative; with finite Vlen and positive ramification normalization, Vlen itself is zero). This is the strongest budget obtained from those two individual integers alone; an unpatched gcd is invalid, e.g. p=3,r=5,a=1,b=3 permits v_3(b)=1 but gcd=1. B does not depend on Ls or any coefficient choices. NumberU gives log B <= c*2^(E+1)*(N*(e+1))^A*(log p+log r). This is the same valid parity-mass bound as peer integration but one product over the whole parity family rather than a product of independently chosen per-kernel certificates. No computational speedup demonstrated.

## Recover the actual two suppliers and reduce the exponent
Pinned source KeepNumU.lean L25–80 proves NumberU3U_s from Af.Hypotheses', LevelKNAlt, LevelPNAlt, AdmResNAlt, NewAdmAlt and rank-two Adm2A=>Adm2B transfer (all universal hypotheses in source retained). The last theorem numberU3U_of_prints supplies these via levelKA_alt, levelPA_alt, admissible_restriction_level_n_of_printed_results, newAdmS_alt, adm2B_of_adm2B. The two native finite trace classifiers have sizes <= c1*Y^A1 and c2*dK^A2*Y^A2, Y=N(e+1)>=1, dK=|disc K|. Since Y>=1,

    |S_1 disjoint-union S_2| <= (c1+c2*dK^A2) Y^max(A1,A2).

The native proof uses A1+A2 instead. Its other factor 2e log Q+1 <= 5Y log p is unchanged (Q=p^f, 1<=f<=2, p>=7). Thus the actual NumberU construction admits c=5(c1+c2*dK^A2), A=1+max(A1,A2), not 1+A1+A2, with K fixed before p,N,e. This is a human inequality improvement, not a new Lean theorem. Both c_i,A_i still require the actual classifiers.

Exact native integer mechanism in FrobeniusTraceNormNonzeroLogBound.lean: with trace data D, t(s) algebraic, |t(s)|<=3, Q^e*t(s) integral, Galois permutations on the label set and trace value compatibility, set

    n_p = product_{chi in Orb,s in D.S} [Q^e*t(s)-z(chi)-Q^e-Q^(2e)*z(chi)^(-1)].

Every factor is an algebraic integer; nonzero follows by Q^(2e)>4Q^e+1 for Q>=7,e>=1. Galois permutes the indexed factors, so product is a rational algebraic integer. The representation classifier must be injective modulo isomorphism, NOT the trace map itself (multiple distinct labels may have equal traces). This permits a selected subset product to dominate |n_p|_l because all factors are integral and |Q|_l=1 for l!=p. All multiplicities retained, including repeated z. This constructs a finite common integer; no numeric integer computed for actual automorphic data.

Pinned FOneCharU.lean L21–73,75–91 proves OneCharU_s from CohInp, LemmaM, LemmaM', LemmaP, KatoTwoW, RigidityFirstCase, RigiditySecondCase, AdmI_s and AutomorphyUnramifiedCoefficientsAlt. First coefficient descent to eO=1 via exists_unram, gd_chHom, coefIndep and exact character value equality. Then exists_dat, automorphy supplies marked g1 and hFin/hB/hW, exists_uLoc, exists_ring, exists_model. model_upper produces finite length and weighted valuation sum on two-point representations; vlen_le transfers to Vlen. twoPt_shape plus AdmI_s and type-II modular extension transfer supply admissibility, while hTo proves pairwise inequivalence after restriction via rhoK. These are substantive suppliers; neither finite class group reduction nor the gcd argument proves them.

Audit torsion detour: actual Vlen is Chr.V' over Q with character twist psi^-1*cyclotomic^-e and ShaU local family: all inertia plus decomposition at primes dividing lN. Not literally the untwisted S(K_E,e) of 0dfa42f3. Native Chr.vLe proves equality V=V' for prime-to-l finite character order; redPrime then supplies the host-to-character length inequality with its model/parity/coefficient hypotheses. The peer host class-group formula addresses its intrinsic strict Sha; using it for native CountI still requires those descent/normalization identifications. The direct integer route above avoids pretending a fixed-l residual class-group rank controls the all-prime sum.

## Exact source provenance
Repo leanprover-community/riemann-hypothesis pin 40e56bab026552e089d7afcfeff08d2defb9c005. All paths below relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/; fetched exact Git blob:
- ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e (L49–54 actual CountI).
- same directory NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258; FPropGKU.lean 4887bdf435a54a8ab856102e15d60da39d041970; KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7; FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91.
- BuildingsResidueChars/FrobeniusTraceNormNonzeroLogBound.lean f668c92985c3f460cc8d179e2da941b24d19dfa4; EisensteinTraceDifferenceLogBound.lean 8a55cbfdf728181e437f826fca2927d454bcc096; AutomorphicForms/Classifies.lean 6a79b362efaef184a302c96e631e34613abd8f49.
- UnitaryThreeGroups/KatoUse.lean f4c048cb3bf45f91461b536bae82636a22467ed3; CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674; HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57; GdOfHost.lean 8ab8e7e79a09e2d7f00292d525733fac8badfae2.
- HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean 1feb420e376868ca41d85fb09bc4f8c7ee66778e; RedPrime.lean 9b5f1ab583d11365a37d6db8b573168f825ecbe7; CharacterLevelBounds/ShaFamMono.lean f1b517fa7cddda3e25b5a7ba89c1e57096bbf59e; VLe.lean fe84b4080a340b9859c432e1e393bec5f75292bd; GaloisLibrary/SelmerTransport/ConjStableShaFam.lean 578402a7b2aea9f24d31473aab4486dd43055fb2.
Latest observed upstream 75e2012dcc6f3093e223ef8d327b88395ff7d27c (search_commits). Same old paths for KeepNumU and FrobeniusTraceNormNonzeroLogBound returned 404; FOneCharU now 1301 lines, blob eb2aa97acb4dd330736055d7ebc712a4fd3c6ffd, theorem name still present. No mixing revisions. Search for corGK returned no results; native body still not located. Bypass above is independent human proof given exact suppliers, not an assertion of having extracted corGK body or authenticated its kernel role.

## Actual reproducible algebra checks
Executed in ECMAScript tool runtime: 30,000 integer cases, 750,000 pointwise valuation equalities, 2,044 parity Galois permutations, 980 exponent inequality checks; no failures. These are deterministic algebra regression cases, NOT data from actual Galois reps, not proofs of asymptotic estimates or a URT comparison.

```js
function gcd(a,b){while(b){[a,b]=[b,a%b]}return a}
function vp(a,p){let v=0;while(a%p===0n){a/=p;v++}return v}
function strip(a,p){return a/p**BigInt(vp(a,p))}
let cases=0,point=0;
for(let a=1n;a<=100n;a++)for(let b=1n;b<=100n;b++)for(let [p,r] of [[3n,5n],[5n,7n],[7n,11n]]){
 const B=p**BigInt(vp(b,p))*r**BigInt(vp(a,r))*gcd(strip(strip(a,p),r),strip(strip(b,p),r));
 if(a*b%B!==0n)throw Error("product bound");
 for(let l of [2n,3n,5n,7n,11n,13n,17n,19n,23n,29n,31n,37n,41n,43n,47n,53n,59n,61n,67n,71n,73n,79n,83n,89n,97n]){
 let va=vp(a,l),vb=vp(b,l),goal=l===p?vb:l===r?va:Math.min(va,vb);
 if(vp(B,l)!==goal)throw Error("valuation");point++}
 cases++;
}
let n=0;
for(let E=2;E<=10;E++){let M=2**E;for(let parity=0;parity<2;parity++){let set=new Set;for(let k=0;k<M;k++)for(let a=0;a<2;a++)for(let b=0;b<2;b++)if((a+b)%2===parity)set.add(`${k}:${a}:${b}`);
 if(set.size!==2*M)throw Error("parity");
 for(let u=1;u<M;u+=2){let img=new Set;for(let s of set){let [k,a,b]=s.split(":").map(Number);img.add(`${k*u%M}:${a}:${b}`)}if(img.size!==set.size||[...img].some(s=>!set.has(s)))throw Error("Galois stable");n++}
}}
let exp=0;for(let y=1n;y<=20n;y++)for(let a=0n;a<=6n;a++)for(let b=0n;b<=6n;b++){let c=3n,d=7n;let m=a>b?a:b;if(c*y**a+d*y**b>(c+d)*y**m)throw Error("max");exp++}
console.log({cases,point,n,exp});
```

RESUME HERE: recover exact actual model_upper and vlen_le proof bodies called in FOneCharU.lean (via RigEnd3/FPtHypU), determine whether the deformation-model finite length inequality can be replaced by a direct determinant bound without losing the rigidity or local hypotheses. Dependency lane: authenticate NumberU3U_of_prints (12743328) and OneCharU supplier (12806368) value edges; exact corGK body still needed for original proof, not for proposed bypass. Audit: independently check full parity injection, single integer quantification and min/gcd patch. Integration: use B only conditionally; all other CountII/V/Vs, 2-primary/minus, TopG/ASK-MAIN and weighted prime lower bound remain OPEN. No claim of RH or full proof translation. HANDOFF TO integration, math, audit, dependencies, Galois.
