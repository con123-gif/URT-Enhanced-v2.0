# Geometry RUN8 — isolated fiber, quasi-finiteness and Zariski's Main Theorem
2026-11-24. SOURCE-MATCHED local reconstruction, not kernel replay. Project OPEN.

## Continuity and sources
Read AGENTS, RESEARCH_STATE, RESEARCH_LOG head, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, CI summary checkpoint 375 (physical orchestrator PASS, unrelated to RH validity), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, geometry RUN6/RUN7 and recent other lanes' handoffs (character boxes, Galois, kernel, Landau, literature, acceleration, prime window, editor, theta, dependency, integration, math, structure). No overlapping reconstruction found in those inspected handoffs. Blueprint linked in queue not reopened; no physics changes.
RH pin 40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream 9477923066c923e6dbf7292da17019f8d08d0db8, 2026-11-24 14:18:56Z, quick-check runner diagnostic merge. Caller src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/ExistsValuationSubringLiftOfSpecialFibre.lean blob e9fe8c1496cd259f4f9d1248e8ac67396736c64d at pin, fa2a909d785af744a49caf4b15d7047473c3db1d at observed head. The extracted quasiFiniteAt_of_height_le_one theorem text (1993 characters, trimmed) is identical in both. No claim of whole-file or dependency equivalence.
Manifest Mathlib pin 0df444a360eaa60ab8c11dca51a86af692955474. The previously missing supplier was located by code search and then fetched at the manifest pin, not at search-result HEAD:
- Mathlib/RingTheory/ZariskisMainTheorem.lean blob f24dbf615d28cca4234323f10f7cf6d828b7d339. Lines 75–94 definition and integral saturation criterion; 637–651 finite-type weak Zariski property; 666–701 finite subalgebra; 710–725 quasi-finite consequence; 727–730 weak→strong; 732–740 residue-field reduction; **742–752 of_isOpen_singleton_fiber**; 754–764 equivalence.
- Mathlib/RingTheory/QuasiFinite/Basic.lean blob 8bce47952c308f1faee518a6eb45d3023e59917f. 358–359 QuasiFiniteAt definition; 481–516 of_isOpen_singleton over an Artinian base.
- Mathlib/RingTheory/QuasiFinite/Weakly.lean blob 32073e6d26b9bb0b1e82d53decf25e0896fefaf2. 50–74 weak definition/quotient form; 230–269 weak residue-field proof.
- Mathlib/RingTheory/Spectrum/Prime/Jacobson.lean blob bc04095a3fdbe7b5559f7e9f036051aed9de3efd, 80–105 isolated singleton clopen proof.
- Mathlib/RingTheory/LocalRing/ResidueField/Fiber.lean blob 93c620109dc6f443cafe903f217252a8f49cdd22, 212–231 fiber homeomorphism.
- Mathlib/RingTheory/QuasiFinite/Polynomial.lean e23c9320233c2306875902256f828f771c964b59; AlgebraicGeometry/Morphisms/QuasiFinite.lean 00c0dccd3930ed5d09d37ed75edd5422256648ed; RingTheory/Etale/QuasiFinite.lean c6239cdbe7e8fa7ebf80e4eb8bb411e32dd302ea; RingTheory/RingHom/QuasiFinite.lean 0d711883d8668bd5a7709f6b0868cab9aeeffffd inspected for supplier. All hashes returned by GitHub; not independent raw-byte hash replay.
 
## 1. Precise source theorem and geometry
For commutative rings R,S, an R-algebra structure on S, and S finite type over R, let q be a point of Spec S and p its contraction to R. If {q} is open in the subspace F = (Spec S → Spec R)^(-1)({p}), then S_q is quasi-finite over R (Algebra.QuasiFiniteAt R q.asIdeal). Here quasi-finite means finite-dimensional fibers over each residue field, NOT necessarily a finite R-module. No assumption that {q} is open in the entire Spec S, or that R is a field, or that q is maximal globally. RUN7's maximal height-one point produces precisely this relative openness using D(s)∩F={q}. This is the source obligation at RH caller line 82.

## 2. From topological fiber to algebraic fiber
Let k(p)=Frac(R/p), understood as residue field of R_p, and A=k(p)⊗_R S. PrimeSpectrum.preimageHomeomorphFiber identifies F with Spec A. Write Q for the image of q, so Q contracts to q under S→A. The homeomorphism transports the open singleton to {Q} open in Spec A. A is finite type over the field k(p). This is all that the source body 742–752 does before invoking the next two results; no unexplained positivity assumption is introduced.

## 3. Isolated point over a field (source actually allows Artinian R)
For an Artinian base R0 and a finite-type R0-algebra A, the algebra A is Noetherian and Jacobson. The singleton {Q} open implies it is closed: a nonempty open subset of a Jacobson spectrum contains a closed point, and here the only candidate is Q. Thus it is clopen. In an affine spectrum a clopen set is D(e) for an idempotent e. Since e∉Q, A_e→A_Q exists. Spec A_e has only one point by localization and D(e)={Q}. For s∉Q, its image in A_e must be a unit: otherwise a maximal ideal of A_e contains it, but the sole prime is the contraction of the closed point of Spec A_Q, which excludes s. Every fraction x/s in A_Q therefore comes from A_e. The map is surjective; A_Q is finite type over R0 and has at most one prime. Every fiber has at most one prime, hence a finite spectrum; the finite-type criterion yields QuasiFinite R0 A_Q. This follows source 481–516, including finite type of the localized ring rather than assuming arbitrary localization finite type.

## 4. The weak-to-strong step cannot be skipped
Set C=S_q/p S_q, and A_Q as above. WeaklyQuasiFiniteAt R q is equivalent to QuasiFinite R C (Weakly 54–74). The source constructs an R-algebra surjection A_Q→C. First map k(p)→C via R_p then quotient; then tensor with S→C. Any y∈A outside Q has a representation after clearing a base denominator, (r/1)y=1⊗s with r∉p; primality of Q gives s∉q. Therefore 1⊗s maps to a unit in C, as does y. The tensor map extends to A_Q. Every element of C has a representative x/s, s∉q, whose preimage is (1⊗x)/(1⊗s). The residue field k(p) is quasi-finite over R and the preceding field case gives A_Q quasi-finite over k(p); transitivity and the surjection establish weak quasi-finiteness. This only handles the localized fiber, not every fiber of S_q. The actual theorem that promotes this to strong quasi-finiteness is Zariski's Main Theorem, not a mere identity of fibers.

## 5. Zariski bridge, exactly as used
ZariskisMainProperty R q means there exists r∈integralClosure(R,S), r∉q, with the localization of the integral closure at r mapping bijectively onto S_r. The equivalent criterion is: r∉q, r integral over R and for every x∈S some m≥0 has r^m x integral over R (lines 75–94). The deep producer of this property from finite type + weak quasi-finiteness is lines 637–651; its underlying multivariable polynomial induction, strong transcendence/conductor and going-down steps remain separate imported obligations, not replaced by this reconstruction. The file itself references Stacks 00PI and annotates its algebraic Zariski theorem 00Q9.
Choose finite algebra generators x_i of S. The integral elements r and r^{m_i}x_i generate a finite R-subalgebra S'⊂S. After inverting r each generator x_i lies in S'[1/r], hence S'[1/r]→S[1/r] is surjective; injectivity follows from the localization of the subalgebra inclusion (even with zero divisors). S' is a finite R-module; its localization at one element is quasi-finite over S', so by transitivity and the localized isomorphism, S_r is quasi-finite over R. Finally S_q is a further localization: for x/s∈S_q, s∉q maps to a unit and multiplying by s gives x in the image of S_r. Apply the exact denominator-clearing preservation lemma QuasiFinite.of_forall_exists_mul_mem_range. Hence S_q is quasi-finite over R. This reproduces lines 666–730, and then 732–752 establishes RUN7's previously unresolved imported implication. The finite-type hypothesis is needed in both the field case and Zariski step; weak and strong quasi-finiteness are not identified by definition.
 
## 6. Finite regression (executed in JS tool)
Exact split polynomial examples over F_p, including repeated roots, represent A=F_p[T]/((T-a)^c(T-b)^d) via CRT as the two local truncated rings; a,b distinct, c,d=1,2,3. Check selector idempotents, all local elements, all units and fraction representatives on basis elements. Nonunits are nilpotent; additional negative controls for the generic prime in D(g) on the affine line. These examples check the local field argument only, not Zariski's Main Theorem for arbitrary rings or the RH proof. Counts: {"components":120720,"selectors":2520,"inverses":102084,"products":288876,"negative":19052}. No assumptions discarded. Reproduce with Node by saving the following JS block as .mjs. No Lean execution and no URT comparison.
~~~js
const assert=(x,m)=>{if(!x)throw Error(m)};
let components=0, selectors=0, inverses=0, products=0, negative=0;
for(const p of [2,3,5,7]){
 const mod=x=>(x%p+p)%p;
 const mul=(a,b,m)=>Array.from({length:m},(_,k)=>mod(a.slice(0,k+1).reduce((s,x,i)=>s+x*b[k-i],0)));
 const pow=(a,n,m)=>{let b=Array(m).fill(0);b[0]=1;while(n){if(n%2)b=mul(b,a,m);a=mul(a,a,m);n=Math.floor(n/2)}return b;};
 const eq=(a,b)=>a.every((x,i)=>x===b[i]);
 const one=m=>[1,...Array(m-1).fill(0)];
 const zero=m=>Array(m).fill(0);
 // Product of local rings F_p[u]/(u^m), representing distinct roots of a split polynomial.
 for(let a=0;a<p;a++)for(let b=0;b<p;b++)if(a!==b)
 for(let c=1;c<=3;c++)for(let d=1;d<=3;d++){
   const roots=[a,b],ms=[c,d];
   // g(T)=T-otherRoot, written as a truncated series at each root.
   for(let i=0;i<2;i++){
     let P=1;while(P<Math.max(c,d))P*=p;
     const e=roots.map((r,j)=>pow(Array.from({length:ms[j]},(_,k)=>k===0?mod(r-roots[1-i]):k===1?1:0),(p-1)*P,ms[j]));
     for(let j=0;j<2;j++){
       assert(eq(e[j],j===i?one(ms[j]):zero(ms[j])),"selector value");
       assert(eq(mul(e[j],e[j],ms[j]),e[j]),"idempotence");selectors++;
     }
     const m=ms[i], count=p**m;
     for(let k=0;k<count;k++){
       const x=Array.from({length:m},(_,j)=>Math.floor(k/p**j)%p);components++;
       if(x[0]===0){assert(eq(pow(x,P,m),zero(m)),"nilpotent nonunit");negative++;continue;}
       const v=pow(x,(p-1)*P-1,m);
       assert(eq(mul(x,v,m),one(m)),"outside-prime unit");inverses++;
       for(let j=0;j<m;j++){
         const y=zero(m);y[j]=1;
         assert(eq(mul(mul(y,v,m),x,m),y),"fraction representative");products++;
       }
     }
   }
 }
 // Nonisolated closed point of A^1 over Fp: any nonzero g not in (T-a) also avoids (0).
 for(let a=0;a<p;a++)for(let c=0;c<p;c++)for(let d=0;d<p;d++)
   if(mod(c+d*a)!==0){assert(c!==0||d!==0,"generic prime also in basic open");negative++;}
}
console.log(JSON.stringify({components,selectors,inverses,products,negative}));
~~~

RESUME HERE: trace the exact pinned IntAll.lean declaration intAll_all and its actual caller dispatch into positive-rank and rank-zero integral frame extension. Preserve finite-residue, ramification and frame data; if the actual supplier is missing, search the pinned tree or consult dependency exporter before claiming completion. Keep Zariski's deeper proof (637–651 via multivariable induction) as a separate standard imported obligation for literature lane. Next archimedean local_unit_map_surjective / norm_small_le. HANDOFF TO literature, integration, editor, audit, geometry. Project OPEN.
