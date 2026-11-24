# RUN16 — Continuous adelic character transport and place-local readback
2026-11-24. SOURCE-MATCHED / DONE for the human reconstruction of GlobalTheory.CharTransport.exists_hom and its immediate suppliers; not a kernel replay or authenticated Main reachability result.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity protocol, research state/log/protocol excerpts, CI #399 (22:31:27 UTC, physics only), RUN14/15 commit patches, 35 recent RH commit titles and 15 recent peer commit file lists with available RESUME HERE notes. No duplicate of exists_hom located in that review. Not all peer full notes or external blueprint reread; explicit path guesses for standalone RESUME_HERE.md returned 404; actual notes are embedded in lane reports. No physics changes.

## Pinned sources
Repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned by commit listing, same as RUN15). B=src/Development/AbelianVarietyTheory/.
- B/Proofs/IwasawaDecomposition/ExistsCmAdeleUnitCharacterReadingHeckeChar.lean, P blob 0786c38c2dd1a2ba1314c5e5cc18ff2cb05d9642, H blob 07679744b9c3439e037ed28b3904515d79ad1522: GlobalTheory.CharTransport.locMap_eq L21–37, exists_toAdele 39–58, isDelta_of_isPlIdem 62–70, map_loc 72–74, exists_hom 78–136, exists_chrEq 138–160.
- B/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean, P 4125fd7aed8d975a8179e2debf22c365e01f237e: IdemSupport.Comp 153–159, mem_intAE_iff 161–179, exists_comp 181–206, IsDelta 208–210, Comparison₂ 212–213, not_int_iff 327–337, tie_iff 339–357, place_comp 365–377.
- B/Proofs/FoundationProofs/ExistsFinitePlaceIdempotentBaseChangeAdeles.lean, P fef26f720d0a63e3b045398510637c444a299ade: PlaceIdem.eq_zero_of_val 60–67, parts_inj 156ff.
- B/BlockTheory/AdelicCMFields/UnitaryHeckeCharacterIdele.lean, P ed8fbb8b6937abb680a6482f38bfd3e52b895d80: finiteCompletionMap 86ff, continuous_finiteCompletionMap 98ff, finiteCompletionMap_coe 107ff, finiteCompletionMap_mapsTo 122ff, tendsto_under 149ff, finiteAdeleMap, infiniteAdeleMap, adeleMap 160–173, adeleMap_algebraMap 179ff, continuous_adeleMap 191ff.

## Quantifier and obligation ledger
For each D:D7, write F=D.host.F, E=D.host.E, A=AE D=AF F ⊗_F E. There exists ONE ring hom Θ:A→Adele(E) with (i) continuity, (ii) for every x∈E, Θ(incA D x)=diagonal(x), (iii) for every finite place P of E and e∈A satisfying IsPlIdem D e P, and every k∈E^×, Θ(locE D e (k:E))=underlying adele of localIdele E P (atFin P k). Θ chosen before P,e,k. No isomorphism, injectivity, surjectivity or continuity of an inverse claimed here. The conditional place-idempotent premise is not dropped or asserted for an arbitrary idempotent. D7's dependent number-field and algebra structure retained. General locMap_eq and exists_toAdele require [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E]. Only map_loc is a general two-ring lemma.

## Proof
1. Identify the two maps F_v→E_P (v=P.under): let a∈F_v and n∈N. In the source proof choose k∈F from the intersection of two open neighborhoods of a: the first requires v(a−k)≤exp(−n); the second requires v_P(g(a)−g(k))≤exp(−n) for the continuous completion map g. Density of F guarantees this common k, not a single k for all n. Both maps agree on embedded F, so their difference at a is the difference of their values on a−k. The valuation estimate for locMap and ultrametric subtraction bound give v_P(locMap(a)−g(a))≤exp(−n) for all n. PlaceIdem.eq_zero_of_val: a nonzero value has a finite integer logarithm m; choose n=|m|+1, contradiction. Thus locMap_eq. Retain locMap_valued, openness of valuation balls, denseRange_algebraMap, locMap_algebraMap, finiteCompletionMap_coe and continuous_finiteCompletionMap as source obligations.

2. Construct g=adeleMap F E and f=diagonal E. They agree as F-algebra maps on F (adeleMap_algebraMap). The tensor product universal property gives Θ(a⊗x)=g(a)f(x). For continuity, regard Θ as additive and g-semilinear over AF F: Θ(rz)=g(r)Θ(z), from the pure tensor formula and multiplicativity. The actual source installs IsModuleTopology on the tensor product (definitional topology) and invokes continuous_of_linearMapₛₗ using continuous_adeleMap; algebra alone does not imply continuity. The latter is backed by the product of continuous archimedean completion maps and restricted-product mapAlong_continuous. Restricted-product admissibility uses finiteCompletionMap_mapsTo: the target integral ring is closed, source integral ring open, embedded F dense, and the valuation of an embedded field element raises to the local ramification power, preserving integrality. The inverse image of a finite set of base places is finite by primesOver_finite; hence tendsto_under for cofinite filters. This is why coordinatewise assembly gives an actual restricted adele map, not just an arbitrary infinite tuple.

3. Independently choose Φ:A→finite adeles of E from IdemSupport.exists_comp. Its five fields are ext (infPart z=0 and Φz=0 imply z=0), surj (each finite adele has a preimage with zero infinite part), inc (diagonal agreement), int (integrality iff every finite image coordinate integral), base (base-adele coordinate formula via locMap). Construction: choose the finite tensor base-change map ι via exists_toAd and product-splitting equivalence e via exists_adele_equiv. Compose ι with swapAE and finPart. Injectivity of ι on its domain and the tensor swap plus product splitting prove ext; reverse using their surjectivity and the pair (0,y) proves surj. inc and base are the pure-tensor identities; int uses mem_intAE_iff and both directions of integral transport via ι. mem_intAE_iff proves one direction by closure of the elementary integral tensors, the reverse using finite generation of O_E over Z and levelaf_decomp followed by tensor swap injectivity. Do not treat the underlying finite base-change theorem as established by this reconstruction; its native proof is the next target.

4. Diagonal identity hinc follows by writing incA x=1⊗x. To show hfin: for ALL z∈A, (Θz)_fin=Φz, the actual proof uses tensor-product induction: zero maps to zero; sums follow by additivity; pure tensor a⊗x=(a⊗1)(1⊗x), and Φ.inc, Φ.base, locMap_eq show equality at every finite Q. Thus extensionality and induction establish the global equality, without assuming every tensor is pure.

5. Infinite component: take u=algebraMap(pairA(1,0)) (the archimedean cut). If infPart z=0, then both parts of uz vanish: infinite part by that hypothesis, finite part since finPart u=0. parts_inj gives uz=0. The pure-tensor formula gives (Θu)_inf=1. Since Θ preserves multiplication, (Θz)_inf=(Θu)_inf(Θz)_inf=(Θ(uz))_inf=0. Only this implication is needed, not an independent characterization of the full infinite component.

6. Recover the finite delta from the actual IsPlIdem witness. isDelta_of_isPlIdem unpacks idempotency, an underlying base-place idempotent ε with its two allowed cases, and Comparison₂. In the split case e=(e+cA e)e from e²=e and the given orthogonality; replace e+cA e by the supplied base cut, whose infinite part is zero by place_comp. In the other case e is itself the base cut, again infinite part zero. For an idempotent e, every Φ(e)_Q is an idempotent in a field and therefore 0 or 1. The original nonintegrality test not_int_iff says for every nonzero integral x, the finite part of e incA(x⁻¹) is nonintegral iff x lies in some Q with Φ(e)_Q≠0. Comparison₂ requires this to be equivalent to x∈P. Any Q in the support must satisfy Q⊆P (include x=0 separately), hence Q=P by eq_of_le for height-one primes. A nonzero x in P exists since P≠(0); Comparison₂ forces a nonzero support coordinate, thus Φ(e)_P=1. Conversely a singleton delta gives Comparison₂ directly. This proves tie_iff and d0,d1,d2: infPart e=0, Φe(P)=1, Φe(Q)=0 for Q≠P. The inverse-integrality characterization inv_mem_iff and the prime-ideal facts remain explicit obligations.

7. map_loc gives Θ(locE e k)=1+Θ(e)(diag(k)−1). Its infinite coordinate equals 1 by step 5 and d0. By steps 4 and 6, its finite coordinate is k embedded in E_P if Q=P and 1 otherwise. This is exactly Function.update of the all-one tuple at P, the local idele's underlying adele. k is a field unit, so the chosen local idele exists. The two cases Q=P and Q≠P exhaust the universal place quantifier. No induction on the set of places needed. The tensor induction is essential to extend the comparison off pure tensors.

8. RUN14 consumer exists_chrEq: for every D and unitary Hecke character χ, define u=Units.map Θ, continuous by Continuous.units_map, and c(x)=χ(u(x)) valued in Circle by unitarity. Unit extensionality plus the diagonal and place-local identities identifies u on the required units. χ trivial on principal ideles gives c trivial on diagonal units; local readback gives the ChrEq field for every P,e,k and every unit x whose underlying element is locE e k. This is a pullback, not a construction of χ or proof of its nonvanishing.

## Executed evidence
Connector V8 source assertions: 60 successful (four pinned blob SHA comparisons, literal declaration/reference anchors, and six current declaration-existence checks). Four inspected theorem texts unchanged at H: locMap_eq, exists_toAdele, isDelta_of_isPlIdem, exists_chrEq. map_loc and exists_hom have tactic annotations (f := _) in map_add/RingHom.map_add and the latter loses local maxHeartbeats wrapper; no proof-term equivalence claimed. Imports changed. Other three pinned source files not compared with H in this run. Reproduction: git rev-parse P:path for four listed blob hashes and git show P:path for cited declaration and reference anchors; git diff P H -- primary path. These are literal source edges, not native elaborated dependencies.

The following exact regression was executed in connector V8. Output {"tensor":3400,"ring":16418,"local":84,"cut":722,"neg":3}. Finite split-algebra model A=F_p³, E=F_p², A⊗E=F_p⁶ with first pair infinite, four remaining coordinates finite. It checks the tensor factorization and component/local update algebra, not number-field topology, prime existence, or native Lean proof. No URT benchmark. Zero original premises deleted.
```js
function regress(){
 const A=(x,m)=>{if(!x)throw Error(m)}, eq=(x,y)=>x.every((v,i)=>v===y[i]);let tensor=0,ring=0,local=0,cut=0,neg=0;
 for(const p of [2,3,5]){
 const mod=x=>((x%p)+p)%p, add=(a,b)=>a.map((x,i)=>mod(x+b[i])),mul=(a,b)=>a.map((x,i)=>mod(x*b[i]));
 const one=Array(6).fill(1),zero=Array(6).fill(0),diag=x=>[...x,...x,...x],pure=(a,x)=>a.flatMap(v=>x.map(w=>mod(v*w)));
 const decode=(n,k)=>Array.from({length:k},()=>{let d=n%p;n=Math.floor(n/p);return d});
 for(let i=0;i<p**3;i++)for(let j=0;j<p**2;j++){const a=decode(i,3),x=decode(j,2);A(eq(pure(a,x),mul(pure(a,[1,1]),diag(x))),"pure factor");tensor++}
 for(let i=0;i<p**6;i++){
 const z=decode(i,6),w=decode((i*31+7)%p**6,6),u=[1,1,0,0,0,0];
 const fin=x=>x.slice(2),inf=x=>x.slice(0,2);
 A(eq(fin(add(z,w)),add(fin(z),fin(w)))&&eq(fin(mul(z,w)),mul(fin(z),fin(w))),"finite projection ring");ring++;
 if(inf(z).every(x=>x===0)){A(eq(mul(u,z),zero),"infinite annihilator");cut++}
 }
 for(let q=2;q<6;q++)for(let a=1;a<p;a++)for(let b=1;b<p;b++){
 const e=zero.map((_,i)=>+(i===q)),k=diag([a,b]),v=add(one,mul(e,add(k,one.map(x=>mod(-x))))),expected=one.map((x,i)=>i===q?k[i]:x);
 A(eq(v,expected),"local update");A(eq(mul(v,one.map((x,i)=>i===q?Array.from({length:p},(_,j)=>j).find(j=>mod(j*k[i])===1):x)),one),"local unit");local++;
 }
 }
 const e=[0,0,1,1,0,0];A(e.filter(Boolean).length===2,"base-place cut not single upstairs");neg++;
 A([1,0,0,0,0,0].slice(2).every(x=>x===0),"finite comparison alone cannot determine infinite coordinate");neg++;
 A(1+1*(0-1)===0,"zero scalar not local unit");neg++;
 return {tensor,ring,local,cut,neg}
}
console.log(regress())
```

## RESUME HERE
Trace GlobalTheory.AdeleBaseChange.exists_toAd in B/Proofs/IwasawaDecomposition/ExistsFiniteAdeleBaseChangeEquiv.lean, especially map_injective, map_surjective, map_mem_int, mem_int_of_map and the actual integral restricted-product comparison. Retain all number-field and completion topology hypotheses. Request authenticated role-labelled root edges for CharTransport.exists_hom, exists_toAdele, locMap_eq, IdemSupport.exists_comp, tie_iff, isDelta_of_isPlIdem and RUN15 pending frame suppliers. Initial ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf, Keep/Pins still open. HANDOFF TO kernel, dependencies, integration, editor, Galois, theta, audit. Project OPEN.
