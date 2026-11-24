# Geometry RUN7 — height-one avoidance and finite valuation specialization
2026-11-24. RESULT: SOURCE-MATCHED local reconstruction of both RUN6 existence inputs; exact finite example regression executed. Project OPEN; no Lean kernel replay.

## Continuity and revision
Read AGENTS, current RESEARCH_STATE, top RESEARCH_LOG and RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, CI summary checkpoint 372 (Cathedral run 45403441156 PASS, not RH), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, geometry RUN6, and recent specialist/integration/math/dependencies/structure/Grok/editor handoffs. No overlapping producer reconstruction found among those handoffs. External linked blueprint was not reopened; no physical queue changes.
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed head 5b84436dcf68e7c435b9bd0251450a5904ecbace (2026-11-24 13:50:38Z, CI priority merge). At head, the two old caller paths below return 404. The producer path persists with blob fa2a909d785af744a49caf4b15d7047473c3db1d; direct text comparison finds the first four theorem blocks identical, and manual inspection finds the fifth theorem body identical through its final simpa, followed by section endings instead of subsequent pinned declarations. Imports differ substantially. No full head equivalence, elaboration or current Main reachability inferred.

## Source and obligation ledger
RH paths at original pin:
- src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/ExistsPointOfValGen.lean blob 431fac2f75d387f15000b692a7d3fab9bb3e75dc, exists_point_of_val_gen lines 9–75, calls at 38 and 67.
- src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsIsRatSecOfPull.lean blob 567a011416ffd86252fbb7339d564bd2bbf2c029, imports producer directly at line 4; calls at 68 and 90.
- src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/ExistsValuationSubringLiftOfSpecialFibre.lean blob e9fe8c1496cd259f4f9d1248e8ac67396736c64d, namespace GlobalTheory, imports Mathlib only. Exact declarations height_le_one_of_forall_mem 11–49, exists_notMem_forall_mem_minimalPrimes 51–64, quasiFiniteAt_of_height_le_one 66–104, exists_valuationSubring_of_height_le_one 106–152, exists_mem_height_map_le_one 154–185. All five original bodies inspected, not inferred from filenames.
Manifest Mathlib pin 0df444a360eaa60ab8c11dca51a86af692955474:
- Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean blob 21e9d6d1b819226c79ef79d46b50d2f6850fa12a, line 108 principal ideal height theorem.
- Mathlib/RingTheory/QuasiFinite/Basic.lean blob 8bce47952c308f1faee518a6eb45d3023e59917f, finite-fiber class 67, Module.Finite.of_quasiFinite 141, of_restrictScalars 233, of_forall_exists_mul_mem_range 259, QuasiFiniteAt 358.
- Mathlib/RingTheory/Valuation/LocalSubring.lean blob de496303057e86b877eb913933516f68cbda2592, LocalSubring.exists_le_valuationSubring 119, IsLocalRing.exists_factor_valuationRing 251.
These are direct source reads with returned Git blob identifiers; no independent raw-byte hash replay. Remaining Mathlib inputs explicitly include the exact supplier of Algebra.QuasiFiniteAt.of_isOpen_singleton_fiber (not located in inspected QuasiFinite/Basic, Weakly, Etale or AlgebraicGeometry/Morphisms files), finite prime avoidance, height monotonicity/strict-chain increment, localization and ideal correspondence, and the Zorn valuation domination proof. No imported theorem is reclassified as an axiom from its name.

## 1. Height bound from a single protected nonzero element
The precise lemma height_le_one_of_forall_mem assumes B a Noetherian domain, m prime, f nonzero, and every nonzero prime P contained in m contains f. Then height(m) <= 1.
If m=0, done. For each nonzero x in m, choose P minimal over (x) below m. It is nonzero (x !=0), and has height <=1 by Krull's principal ideal theorem. By hypothesis f is in P. Choose Q minimal over (f) below P. Since f !=0, Q !=0. If Q were strictly below P, the chain 0<Q<P would have length two, contradicting height(P)<=1. Thus Q=P, and x belongs to a minimal prime over (f). For x=0 choose any minimal prime over (f) contained in m, using m !=0 and the hypothesis. Consequently m lies in the union of the finitely many minimal primes over (f). Finite prime avoidance puts m inside one of them, whose height is <=1. Height monotonicity finishes.
Notice that f !=0 and the domain condition are essential to the given chain argument; do not replace them with merely f in m.

## 2. Exact avoidance theorem (RUN6 first input)
For a Noetherian commutative ring A (not necessarily a domain), prime m, open U in Spec A, and a witness p0 in U with p0 contained in m, exists_mem_height_map_le_one produces q in U with q contained in m and ht(m/q in A/q)<=1.
By Noetherianity choose q maximal by inclusion among all such primes. The basic-open basis gives f with q in D(f) contained in U. Let B=A/q, M=m/q. B is a Noetherian domain because q is prime. The image of f is nonzero. For any nonzero prime P of B below M, suppose fbar is not in P. Its inverse image P' is a prime strictly containing q (strictness follows from P !=0 and quotient surjectivity), contained in m by ideal correspondence, and belongs to D(f) and hence U. This contradicts the choice of q. Thus every nonzero prime below M contains fbar. Apply section 1. This proves the exact quotient height bound, not a bound on the height of q or the original m. The open set U need not itself be a single basic open.
At RUN6 the chosen U=D(pi*t) with pi a nonzero base prime element, t protected. The generic zero ideal is a witness because the original A is a domain. Thus q avoids both factors. The base-injection argument of RUN6 remains necessary before using the next theorem.

## 3. Isolating the height-one point in its fiber
For any Noetherian ring B, ideal I, prime p, assume every minimal prime over I contained in p equals p. The separation lemma constructs s outside p belonging to every other minimal prime over I. There are finitely many such primes, none contained in p. Their finite intersection is not contained in p by primality; choose s in the intersection outside p (empty intersection is the unit ideal).
Now take O Noetherian, B a finite-type O-algebra and domain, m maximal of height <=1, pi in O whose image is nonzero and lies in m. Each minimal prime P over (pi) below m is nonzero. If P !=m the strict chain 0<P<m contradicts height(m)<=1. Hence section's separating s exists for I=(pi) and p=m. In the fiber over m's contraction to O, any prime Q in D(s) contains pi, so contains some minimal prime P over (pi). If P !=m it contains s, contradiction. Thus m<=Q, and maximality forces Q=m. Conversely m lies in this basic open and in its fiber. The singleton {m} is therefore open in the fiber. The source invokes Algebra.QuasiFiniteAt.of_isOpen_singleton_fiber for finite-type B. Exact imported declaration location remains a provenance task; its role and all source hypotheses have been retained. This is not an assumption that all of Spec B has dimension one.

## 4. Finite field extension and valuation-ring construction (RUN6 second input)
Exact statement: O Noetherian domain, K a field and fraction ring of O, B a finite-type domain over O with injective base map, m maximal with height <=1, pi !=0 in O with image in m. Then there exist a field K' with K-algebra structure and Module.Finite K K', a valuation subring O' of K', and a ring hom phi:B→O', with:
(i) phi on O agrees inside K' with O→K→K';
(ii) phi injective;
(iii) phi inverse image of the maximal ideal of O' equals m.
Proof: section 3 gives quasi-finiteness at m, meaning the localization L=B_m is quasi-finite over O (Mathlib definition). Set K'=Frac(B), and embed L in K'. For every x=a/b in K', b!=0, the image of b from L is a unit of K' and multiplying x by this image lands in the image of a. Mathlib QuasiFinite.of_forall_exists_mul_mem_range proves quasi-finiteness of K' over O by factoring through the localization at all elements of L mapping to units, then using its surjectivity onto K'. The injective O→K' extends uniquely to K→K' and supplies the scalar tower. QuasiFinite.of_restrictScalars transfers to K→K': its proof uses a surjection of residue-field tensor products and finite modules. Since K is a field, hence Artinian, Module.Finite.of_quasiFinite yields [K':K]<infty.
The local ring L embeds in K'. IsLocalRing.exists_factor_valuationRing produces a valuation subring O' through which this map factors as a local hom psi:L→O'. This follows from domination of a local subring by a maximal local subring (Zorn), which is a valuation ring. Compose B→B_m→O'. After inclusion into K' the result is the canonical injection B→Frac(B), proving (i) and (ii). Locality of psi pulls the maximal ideal back to the maximal ideal of B_m, and localization pulls that ideal back to m. This proves (iii).
The construction does not claim a DVR or completeness for arbitrary O. RUN6's number-field specialization and completion are separate subsequent steps. Also phi is injective on B=A/q, not on A; the composed specialization on A can have kernel q. This distinction is required for the earlier regularity contradiction.

## 5. Reproducible finite regression (executed V8)
Concrete arithmetic instances of sections 2 and 4: A=Z[X], m=(p,X-a) for p prime and 0<=a<p. For every nonzero integer polynomial t of degree <=3 with four coefficients in [-2,2], choose b among a,a+p,a+2p,a+3p with t(b)!=0, possible because a nonzero degree <=3 polynomial has at most 3 roots. Then q=(X-b) is contained in m, avoids p*t, A/q=Z, m/q=(p), and Frac(A/q)=Q has extension degree 1 over Q. The valuation subring Z_(p) supplies the desired center. Test exact evaluation, center congruence and monic division identity, plus root avoidance and vertical-quotient negative controls. These tests verify finite concrete examples, not general Noetherianity, dimension, Zorn, quasi-finiteness or the kernel.
Executed counts: specializations=10608; center=53040; division=53040; avoidedInitialRoot=880 (subset of examples); negative=8.
~~~js
const check=()=>{
 const assert=(b,m)=>{if(!b)throw Error(m)};
 const evalP=(c,x)=>c.reduceRight((s,a)=>s*x+a,0n);
 const mod=(x,p)=>(x%p+p)%p;
 const polys=[];for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let c=-2;c<=2;c++)for(let d=-2;d<=2;d++)if(a||b||c||d)polys.push([a,b,c,d].map(BigInt));
 let specializations=0,center=0,division=0,avoidedInitialRoot=0,negative=0;
 for(const p of [2n,3n,5n,7n])for(let a=0n;a<p;a++)for(const t of polys){
   let b=a; if(evalP(t,b)===0n)avoidedInitialRoot++;
   while(evalP(t,b)===0n&&b<a+4n*p)b+=p;
   assert(b<a+4n*p&&evalP(t,b)!==0n,"degree <=3 root bound");
   assert(mod(b-a,p)===0n&&p*evalP(t,b)!==0n,"center/avoidance");
   specializations++;
   for(const g of [[1n,1n,0n,0n],t,[0n,1n,0n,0n],[-a,1n,0n,0n],[p,0n,0n,0n]]){
     assert(mod(evalP(g,b),p)===mod(evalP(g,a),p),"center contraction");center++;
     const q2=g[3],q1=g[2]+b*q2,q0=g[1]+b*q1,rem=g[0]+b*q0;
     assert(rem===evalP(g,b)&&g[0]===rem-b*q0&&g[1]===q0-b*q1&&g[2]===q1-b*q2&&g[3]===q2,"synthetic division");division++;
   }
 }
 for(const p of [2n,3n,5n,7n]){assert(evalP([0n,1n],0n)===0n,"unprotected evaluation");negative++;assert(mod(p,p)===0n&&p!==0n,"vertical quotient kills base");negative++;}
 return {specializations,center,division,avoidedInitialRoot,negative};
};console.log(check());
~~~
Replay by saving the JS block as .mjs and running node; source replay by git show PIN:path and git rev-parse PIN:path. No new premise, no URT speed claim. No full RH kernel check.

RESUME HERE: locate exact Mathlib supplier of Algebra.QuasiFiniteAt.of_isOpen_singleton_fiber at manifest pin (search actual source rather than assuming the theorem name proves it). Then trace intAll_all dispatch from RUN6, retaining all integral-frame hypotheses, and the archimedean local_unit_map_surjective / norm_small_le. Coordinate with literature lane on the standard imported algebraic geometry boundary; with integration/editor on replacing RUN6's two unnamed existence inputs by this five-theorem chain.
HANDOFF TO: editor, integration, audit, literature, prime-window. Project OPEN.
