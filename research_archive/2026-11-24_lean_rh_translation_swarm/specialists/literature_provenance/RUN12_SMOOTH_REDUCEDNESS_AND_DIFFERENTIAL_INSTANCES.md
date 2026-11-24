# RUN12 — Smooth reducedness and differential instance suppliers
2026-11-24. SOURCE-MATCHED / PARTIAL. RH source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Mathlib pin 0df444a360eaa60ab8c11dca51a86af692955474, independently read from RH lake-manifest.json. Upstream head observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (18:24:32 UTC, PR #1313), after RUN11's 307cef33f046955ee79dba47e0d828d06496d75f. Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RUN11, research-state/log/protocol/continuity excerpts and latest CI summary (18:41:07, physical orchestrator PASS not RH). Read fourteen peer handoffs including the combined 47-target role projection and acceleration/kernel notes. No collision with other lanes observed. Blueprint not reread. No physics changes. This run takes the first half of RUN11's explicit frontier; chart factorization remains next.

## 1. The actual native proof of smooth reducedness
D = src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/.
D/IsReducedOfSmoothOverFieldStatement.lean L5–6 is a theorem wrapper, not a new axiom. Its body invokes GlobalTheory.isReduced_of_smooth_over_field, D/IsReducedOfSmoothOverField.lean L5–19.

Given field K, commutative K-algebra A with Algebra.Smooth K A, let a∈A be nilpotent. Assume a≠0. The annihilator J=Ann_A(Aa) is proper because 1∈J would imply a=0. Choose a maximal ideal p⊇J (L9–10). The choice matters: an arbitrary prime need not detect a. By smoothness and the pinned Mathlib theorem Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial (L11), there exist f∉p, n≥0 and a compatible P=K[X_1,…,X_n]-algebra structure on B=A[1/f] with B standard étale over P. P is a domain. Write F=Frac(P). The two critical properties are:
- B is flat over P; P→F injective; hence B→F⊗_P B, b↦1⊗b, is injective (L15–16).
- F⊗_P B is étale over the field F, thus formally unramified and essentially of finite type; it is reduced by Algebra.FormallyUnramified.isReduced_of_field (L13–14). The field need not be perfect.

Therefore B is reduced. The image of a is nilpotent in B, hence zero. By the localization zero criterion there exists N≥0 with f^N a=0 (L17–18), so f^N∈J⊆p. Primality forces f∈p (L19), contradiction. Thus a=0. This proves reducedness without assuming A is a domain or a finite K-module. It also avoids circularly using reducedness to infer the injection.

Negative controls: nonsmooth K[ε]/ε² has nonzero nilpotent ε (therefore merely finite presentation over a field does not suffice); generic-fiber injection fails without the flatness premise, e.g. Z→Q injective but B=Z/2 maps to Q⊗_Z B=0. The latter is a counterexample to dropping the flatness guard of the imported tensor theorem, not a smooth algebra counterexample. The finite computations below check the localization and differential identities, not smoothness or a Lean proof.

## 2. Imported theorem bodies and residual leaves
All following paths under Mathlib/RingTheory/ at the exact Mathlib pin above.
- Unramified/LocalStructure.lean L387–422, Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial: obtain f outside p with A_f standard smooth, then factor through a polynomial ring via RingHom.IsStandardSmooth.exists_etale_mvPolynomial. Map p into A_f (prime because f∉p), then obtain a further localization at g₀ outside the mapped prime, standard étale. Write g₀=g/f^m, deduce g∉p; localization first at f then g₀ is localization at fg. Transport the algebra, scalar tower, and standard étale instance through the localization equivalence. The actual witness in the source is fg, not just f. The standard-smooth and étale local structure theorems are further library dependencies, not discarded premises.
- Etale/StandardEtale.lean L382–391: IsStandardEtale is a class containing a nonempty standard presentation; the instance obtains Algebra.Etale via algebra equivalence with the presentation. Etale/Basic.lean L223–225 and L242: étale implies smooth and unramified and survives base change. Unramified/Basic.lean L358–365 supplies the formal-unramified and finite-type fields. Smooth/Flat.lean L52–62 proves smooth flatness: over Noetherian bases uses a finite-type polynomial quotient and the formally smooth flatness result; general proof descends to finite-type Z-algebras, then transports flatness through the base-change equivalence. Flat/Basic.lean L417–422 proves the tensor inclusion injectivity by preservation of injectivity under right tensoring with a flat module and the left-unit isomorphism. These are imported instances/theorems with inspected source bodies, not new assumptions; their deeper proofs are still owed for an expanded dependency closure. No elaborated instance-selection trace was obtained.
- Unramified/Field.lean L58, L61–152: the actual imported reducedness theorem requires [FormallyUnramified K A] and [EssFiniteType K A], not just any K-algebra with vanishing differentials asserted. Proof first injects A into C=Kbar⊗_K A by flatness of a vector space over K. Localize C at maximal ideals. Formal unramifiedness and essential finite type survive extension and localization. Over the algebraically closed field Kbar the local algebra is the field itself: the source first obtains a finite-dimensional algebra by finite_of_free, hence Artinian, hence its maximal ideal m nilpotent. Its residue field is Kbar via algebraic closedness and integrality. The unramified splitting sec gives an A-linear section s:A/m→A of the quotient, with q(s(1))=1. By linearity s(1) is idempotent (s(1)^2=s(q(s(1)))=s(1)); thus 1-s(1) is both idempotent and in nilpotent m, hence zero. This yields the algebra-map bijectivity and isField_of_isAlgClosed_of_isLocalRing. A nilpotent in C has zero image in all maximal localizations and thus is zero by eq_zero_of_localization. Injectivity brings this back to A. Exact sec construction and finite_of_free remain imported obligations, as do all typeclass and algebraic closure infrastructure. No historical priority claim.

## 3. Why the differential module in RUN11 is finite projective
D/CmpFormEqZeroOfPullbackVanishing.lean L145–156, GlobalTheory.PtVanish.connForm_eq_zero: for affine U, hX supplies Algebra.Smooth K A via sec_smooth (L153), A=Sec(X→Spec K,U), then the preceding wrapper supplies IsReduced A (L155). The source passes Ω_{A/K} to the residue-field functional separation theorem (L156). Finiteness and projectivity are actual instance obligations, not a separate axiom or automatically true for arbitrary Ω.

Pinned Mathlib Smooth/Basic.lean L540–548: Smooth has FormallySmooth and FinitePresentation fields, both registered as instances. L70–75: FormallySmooth contains Module.Projective A Ω[A/K] and Subsingleton H1Cotangent; the projection is registered as an instance. This is the definition used by this revision, not a proof of equivalence to all textbook definitions. L189–190 further provides finite presentation of Ω when the algebra is essentially finite type and formally smooth. FinitePresentation.lean L56 provides finite type from finite presentation, EssentialFiniteness.lean L95–98 essential finite type from finite type.

Kaehler/Basic.lean L433–454 gives the actual finite-generation proof. Choose a finite set S of essential generators, and let M be the A-span of {ds:s∈S}. By induction on sums and products, the differentials of every element of the R-subalgebra generated by S lie in M, using d(r)=0 and Leibniz. For arbitrary x∈A, essential finite type provides a unit t in this subalgebra such that xt also belongs to it. Then
    dx=t^{-1}(d(xt)-x dt) ∈ M.
The differentials of all x span Ω; hence M=Ω. This explains finite generation separately from projectivity. The displayed formula needs t invertible, not just nonzero. No assertion that Ω is globally free is made. The source proof uses the exact essential-finite-type condition, even though finite type is already available at this caller.

## 4. Assumption ledger delta and audit status
| Item | Classification | Evidence / remaining obligation |
|---|---|---|
| GlobalTheory.T.isReduced_of_smooth_over_field' | internal proved wrapper, source only | D/IsReducedOfSmoothOverFieldStatement L5–6 |
| GlobalTheory.isReduced_of_smooth_over_field | internal theorem body, source only | D/IsReducedOfSmoothOverField L5–19; smoothness and field are local hypotheses |
| Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial | imported Mathlib proof inspected | standard smooth and étale local structure producers still open |
| Algebra.FormallyUnramified.isReduced_of_field | imported Mathlib proof inspected | formal unramifiedness, essential finite type, closure, finite_of_free and sec |
| Algebra.TensorProduct.includeRight_injective | imported Mathlib proof inspected | flatness and injective map required |
| Standard étale, étale, smooth, unramified class/instance chain | imported definitions and proof instances | no independent axiom declaration inferred from class fields; caller must construct instances |
| KaehlerDifferential.finite | imported Mathlib proof inspected | essential finite type, universal derivation, finite generators |
| Smooth/FormallySmooth projections | imported definitions with registered instance fields | projectivity is part of the local smoothness interface, no claim of an independent unconditional proof |
| sec_smooth; geometric Smooth X.hom | unresolved supplier / explicit local premise | exact definition location not yet found; keep separate from algebraic smoothness |
| Main-root reachability / exact type/value edges | unresolved | peer combined role job not assumed to authenticate these declarations |
No new premises introduced in the native reconstruction. No new literature citations asserted. No claim of globally empty axiom closure, complete RH proof, Lean replay, or URT improvement. The above ledger extends earlier PublishedTheorems/OpenLiteratureStatements wrapper audits via their internal suppliers; it is not a complete inventory of every wrapper.

## 5. Source identity and reproducibility
Connector returned all 15 expected pinned Git blob identities; 51 first-occurrence source substring anchors succeeded. Three further exact body-position anchors succeeded (LocalStructure L400 and L422, Field L150). Initial search anchors for IsEtaleAt.exists_isStandardEtale and exact ⟨f * g and isField_of_isAlgClosed_of_isLocalRing also occur earlier in the file, so those three extra checks explicitly target the actual proof body. No kernel check. At new upstream head, D/IsReducedOfSmoothOverField blob 6c8b72aab504dd90e63a6dc8316033dc36552468 contains all 15 original L5–19 verbatim at L52–66; the consolidated ExistsTangentVectorFunctionalGlobalFormsAbelianS (blob 0610edb6e4bb7564e19ef9d9da168bc35b880f00) calls the theorem directly at L254. The old wrapper is bypassed in this caller. Not a claim of global revision equivalence.

For reproducibility, obtain both git checkouts and run the following Python from the RH checkout, with Mathlib checkout path as argv[1]. This equivalent git check was not executed in the connector; connector fetch/anchor checks were executed.
```python
import subprocess,sys,json
P="40e56bab026552e089d7afcfeff08d2defb9c005"
Q="0df444a360eaa60ab8c11dca51a86af692955474"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
M="Mathlib/RingTheory/"
def git(c,*a):return subprocess.check_output(["git","-C",c,*a]).decode()
def read(c,r,p,h):
    spec=r+":"+p
    assert git(c,"rev-parse",spec).strip()==h,(p,h)
    return git(c,"show",spec)
rows=[
(".",P,"lake-manifest.json","b4d1ec31575a26b2159ec3a262b482bc051f3f6f",[(10,Q)]),
(".",P,D+"IsReducedOfSmoothOverFieldStatement.lean","670941bf2fbf3cb473f97d57ee8186029d2b80e0",[(5,"theorem"),(6,"exact @GlobalTheory.isReduced")]),
(".",P,D+"IsReducedOfSmoothOverField.lean","b7dc3ea7686a1f933e751e4727851704eef06940",[(9,"Ideal.exists_le_maximal"),(11,"exists_isStandardEtale_mvPolynomial"),(14,"isReduced_of_field"),(16,"includeRight_injective"),(17,"map_eq_zero_iff"),(19,"mem_of_pow_mem")]),
(".",P,D+"CmpFormEqZeroOfPullbackVanishing.lean","9d644eaffc0f556171b7b9563a46fa0def3ad54b",[(153,"sec_smooth"),(155,"isReduced_of_smooth_over_field'"),(156,"eq_zero_of_forall_residueField_functional'")]),
(sys.argv[1],Q,M+"Smooth/Basic.lean","696c5eb8786599a8fda889a857de74f1b683945b",[(71,"Module.Projective"),(74,"[instance]"),(189,"Module.FinitePresentation"),(540,"class Smooth"),(548,"[instance]")]),
(sys.argv[1],Q,M+"Kaehler/Basic.lean","828517e10d74a556bbfa457dffb64efa1ef43cf4",[(433,"instance KaehlerDifferential.finite"),(443,"adjoin_induction"),(453,"unit")]),
(sys.argv[1],Q,M+"Unramified/LocalStructure.lean","3aa963a14f1343f1a817f56418272e481f048802",[(387,"theorem IsSmoothAt"),(400,"IsEtaleAt.exists_isStandardEtale"),(422,"exact ⟨f * g")]),
(sys.argv[1],Q,M+"Unramified/Field.lean","f7256c8feb9b059034d8e694d86209c3e96efbc7",[(58,"EssFiniteType"),(93,"IsIdempotentElem"),(123,"theorem isReduced_of_field"),(140,"eq_zero_of_localization"),(150,"isField_of_isAlgClosed_of_isLocalRing")]),
(sys.argv[1],Q,M+"Flat/Basic.lean","b82c8eaaa79e718788a456125280dd53d8a17da8",[(417,"Module.Flat"),(420,"rTensor_preserves_injective")]),
(sys.argv[1],Q,M+"Etale/StandardEtale.lean","f7617b61a44784d26cdf19e55ec600389a8aa824",[(382,"class IsStandardEtale"),(390,"Algebra.Etale")]),
(sys.argv[1],Q,M+"Etale/Basic.lean","9dbcb40ff16f7eec7683a001495a1c3c41e520d3",[(206,"class Etale"),(223,"Smooth R A"),(225,"Unramified R A"),(242,"baseChange")]),
(sys.argv[1],Q,M+"Smooth/Flat.lean","df4ed4f7919b2a0a59ecfd7d8619ccb26f521a4a",[(52,"flat_of_isNoetherianRing"),(58,"Smooth.flat"),(59,"exists_finiteType")]),
(sys.argv[1],Q,M+"EssentialFiniteness.lean","09c76102f4e2224ce345079013405a4c4235def4",[(95,"of_finiteType")]),
(sys.argv[1],Q,M+"FinitePresentation.lean","727b74aa458f5f9b5ded15758be0b474c34e88d8",[(56,"of_finitePresentation")]),
(sys.argv[1],Q,M+"Unramified/Basic.lean","f28b28d1e42a3a4a21846f867710ce0899befe24",[(358,"class Unramified")])]
texts=[]
for c,r,p,h,anchors in rows:
    s=read(c,r,p,h);texts.append(s)
    for i,a in anchors:assert a in s.splitlines()[i-1],(p,i,a)
assert next(p for p in json.loads(texts[0])["packages"] if p["name"]=="mathlib")["rev"]==Q
new=read(".",H,D+"IsReducedOfSmoothOverField.lean","6c8b72aab504dd90e63a6dc8316033dc36552468")
assert texts[2].splitlines()[4:19]==new.splitlines()[51:66]
print("15 pinned blob identities, selected exact anchors, 15 unchanged body lines")
```

Actual executed finite arithmetic regression (connector JS): for m=2..80 and every nonzero a∈Z/m, choose a prime p dividing m whose ideal contains the annihilator. Test that for each f∉(p), a has nonzero image in (Z/m)[1/f]. Also test the Leibniz division identity with all scalar tuples over six prime fields. This does not assert the finite rings are smooth or that scalar tuples are actual derivations.
```js
const gcd=(a,b)=>b?gcd(b,a%b):a;
let n=0,chosen=0,differential=0;
for(let m=2;m<=80;m++)for(let a=1;a<m;a++){
  const ann=Array.from({length:m},(_,i)=>i).filter(i=>i*a%m===0);
  const p=Array.from({length:m-1},(_,i)=>i+2).find(p=>m%p===0&&Array.from({length:p-2},(_,i)=>i+2).every(d=>p%d!==0)&&ann.every(x=>x%p===0));
  if(!p)throw Error("ann");chosen++;
  for(let f=0;f<m;f++)if(f%p!==0){
    let q=m;while(gcd(q,f)>1)q/=gcd(q,f);
    if(a%q===0)throw Error("localization");n++;
  }
}
for(let p of [2,3,5,7,11,13])for(let x=0;x<p;x++)for(let t=1;t<p;t++)for(let dx=0;dx<p;dx++)for(let dt=0;dt<p;dt++){
 const inv=Array.from({length:p},(_,i)=>i).find(i=>i*t%p===1);
 if(inv===undefined||((inv*(dx*t+x*dt-x*dt)-dx)%p+p)%p!==0)throw Error("Leibniz");
 differential++;
}
console.log({chosen,n,differential,total:chosen+n+differential});
```
Actual outputs in two executed calls: chosen=3160, n=125844, differential=42294; total 171298. Additionally checked the nonzero square-zero class 2 in Z/4 and nonzero class 1 in Z/2 with 2·1=0 as illustrations of nilpotence and nonflat torsion. No independent native geometry checks.

RESULT: SOURCE-MATCHED / PARTIAL, one internal wrapper and its actual body audited, imported comparison/instance suppliers traced to pinned Mathlib. No unsupported completeness or physics claim.

RESUME HERE: resolve the exact pinned declaration/source for sec_smooth in CmpFormEqZeroOfPullbackVanishing L153 via import tracing, then reconstruct le_preimage_of_nil/exists_pt chart factorization in the ToroidalCompactification TanSRestrict chain. Keep the Mathlib finite_of_free/sec and smooth local-structure deeper leaves open for dependency expansion; prioritize authenticated root-reachable evidence. Request role-labelled witnesses for GlobalTheory.isReduced_of_smooth_over_field, GlobalTheory.T.isReduced_of_smooth_over_field', GlobalTheory.PtVanish.connForm_eq_zero and the imported Mathlib suppliers. Continue HC/HH comparison realization after chart suppliers; do not repeat RUN11 or this reducedness proof. HANDOFF TO integration, editor, audit, dependency, kernel, geometry, acceleration. Project OPEN.
