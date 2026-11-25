# RUN19 — Prime-local inverse integrality, conjugation, and prime-fibre detection
2026-11-25. SOURCE-MATCHED / DONE for this bounded conditional human derivation. Root-level elaborated reachability and independent Lean replay remain OPEN.

Continuity: fetched AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, and summary.md on cathedral-research-state (CI #408, 01:25:36Z, not RH validation). Read RUN18 and RUN16 and inspected the 25 latest RH commit titles plus 14 other lanes' latest commit files/available RESUME HERE excerpts. No duplicate of the inverse-integrality and conjugation derivation identified. RUN16 already explains not_int_iff and tie_iff, so retain those as consumers, not new discoveries. Full peer documents and blueprint not reread; specialist directory fan-out hit connector call limit, recovered via commit patches. No physics queue changes.

## Pinned sources
Repo leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005.
H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061, returned by default main branch commit endpoint (merge PR #1739); differs from RUN18's b2f365a68500e2bde98cd60a2324263fc62fba10. Do not infer ancestry or chronological advancement from the different hashes.
- C=src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean, P blob 4125fd7aed8d975a8179e2debf22c365e01f237e; H blob 357326bc75d8b98a7383d706ac7713e6a817233d. [Pinned source, lines 208–285](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L208-L285). [Consumer, lines 327–410](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L327-L410).
- L=src/Formalism/SatakeDualWeyl/AdelicIwasawaHecke/Levelaf.lean, P blob a82305067315c15f9bd280d1167ce411cf54a34a; H blob 68c3b18a9c6d4326d56571fc8b72286c71e8c85b. L:14–16 levelaf_valued_algebraMap. [Pinned supplier](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SatakeDualWeyl/AdelicIwasawaHecke/Levelaf.lean#L14-L16).
- W=src/Formalism/LocalToGlobal/BesselHermitianTheta/LemmasWeil.lean, P blob f12892eb4c68bddd7215cd814157f16120b13cef; H blob cea6b9a899aac26661d25555c4b16668921ec680. W:96–107 cA_cA. [Pinned supplier](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/BesselHermitianTheta/LemmasWeil.lean#L96-L107).

## Exact hypotheses and proof
Fix the source's D:D7, F=D.host.F, E=D.host.E, CM involution σ=star on E, A=AE D. Write O=𝓞 E, I=intAE D and J(z)=finPart D z. Q and P range over HeightOneSpectrum O (nonzero prime ideals in this Dedekind domain); write |·|_Q for the multiplicative valuation used in the source. Do not replace D by an arbitrary extension; the fixed-field property is used below.

1. **Inverse integrality** (C:278–285, GlobalTheory.IdemSupport.inv_mem_iff). For EVERY Q and EVERY x∈O with x≠0, the embedded inverse of x in E_Q belongs to its completion integer ring iff x∉Q. L:14–16 first proves the valuation of the embedded field element equals the original valuation, by algebraMap_adicCompletion and adicCompletion.valued_coe (imported obligations). Thus membership is |x⁻¹|_Q≤1 iff |x|_Q⁻¹≤1 iff 1≤|x|_Q, using positivity of |x|_Q from Valuation.zero_iff and x≠0. Finally valuation_lt_one_iff_mem identifies |x|_Q<1 with x∈Q, so the claim follows by negating this strict inequality. This explicitly uses multiplicative valuation convention; in additive valuation notation it is v_Q(x⁻¹)≥0 iff v_Q(x)=0 for nonzero integral x. Zero excluded: Lean totalized inverse of zero does not provide this equivalence.

2. **Conjugation on O and A** (C:215–258; W:96–107). cO is the ring equivalence induced by star, cP(P) its prime comap; x∈cP(P) iff cO(x)∈P, and cO²=id by star_star and ring-of-integers extensionality. C:230 eq_of_le uses maximality of height-one primes, not arbitrary prime ideals. C:233–243 isConjPl_iff proves the source's conjugate-place relation equivalent to P'=cP(P): the witness in the original relation for cO(x)∈P must be x by involution, hence cP(P)⊆P'; maximality gives equality. Conversely choose cO(c) for c∈P and use cO²=id. W proves cA²=id by TensorProduct.induction_on: zero, pure tensor a⊗b (σ²(b)=b), and sum. C:245–250 shows cA(incA x)=incA(star x), and cA fixes the base-adele embedding since σ(1)=1. C:252–258 shows BOTH infinite and finite parts commute with the corresponding tensor conjugation sigR, by the same zero/pure/sum induction. Not every tensor is pure; induction is retained.

3. **Integral subgroup invariance** (C:260–266 finPart_cA_mem). J(z)∈I implies J(cA z)∈I: I is the additive closure of generators a⊗x with a in the prescribed base integral adeles and x∈O. Conjugation of such a generator is a⊗cO(x), still an allowed generator, so closure_le and the additive map give the implication. Applying it to cA z and using cA²=id proves the reverse implication. Consequently J(z)∉I iff J(cA z)∉I. No principal-ideal or finite-support hypothesis is inserted.

4. **Comparison₂ transport** (C:268–276). The predicate Comparison₂(P,e) is the UNIVERSAL statement: for all x∈O, x≠0 implies [x∈P iff J(e incA(x⁻¹))∉I]. For ANY e∈A satisfying this predicate, prove Comparison₂(cP(P),cA(e)). Fix x≠0. Since cO is a ring equivalence, y=cO(x)≠0. The original Comparison₂ applies to y. The ring-hom/involution identities give
   cA(e incA(y⁻¹)) = cA(e) incA(x⁻¹).
   Chain x∈cP(P) iff y∈P iff J(e incA(y⁻¹))∉I iff J(cA(e) incA(x⁻¹))∉I, using step 3 for the last equivalence. Thus no idempotence or zero-infinite-part assumption is needed for this particular implication. Those are indispensable in the later delta identification, not silently imported here.

5. **Immediate consumer, existing RUN16 comparison** (C:327–363). Fix Φ with Comp D Φ (all five fields in RUN16/18) and an idempotent e²=e. Each local coordinate is 0 or 1 by field cancellation. For nonzero integral x, J(e incA(x⁻¹))∉I iff there EXISTS a height-one Q with Φ(e)_Q≠0 and x∈Q: zero coordinates are integral; nonzero coordinates reduce to step 1. If additionally infPart(e)=0, then Comparison₂(P,e) iff IsDelta(Φ,P,e). To show the forward direction, any nonzero coordinate Q must satisfy Q⊆P by the universal x test (x=0 included separately when proving ideal inclusion), hence Q=P. Since P is nonzero, select x∈P nonzero; comparison forces a nonempty support. Therefore that unique coordinate is 1. Converse by substitution of the singleton support. Delta idempotence follows from Comp.ext' and the 0/1 coordinates. Conjugation preserves idempotence by multiplicativity, preserves the zero infinite part by parts_cA, and preserves Comparison₂ by step 4. Apply tie_iff in reverse: IsDelta(Φ,P,e) implies IsDelta(Φ,cP(P),cA(e)). This is C:359–363 delta_conj; no unsupported pointwise formula for Φ∘cA is used.

6. **Why there are only two possible primes in a CM fibre** (C:379–410, under_cP and eq_or_eq_cP). First cP(P) contracts to the same base prime as P because star fixes the image of F, including its integers. Now suppose Q and P contract to the same base prime. For each x∈Q, xσ(x) is σ-fixed, hence the image of t∈F by D.sp.cm.fixed. Its integrality over Z follows from x,cO(x)∈O and isIntegral_algHom_iff along the injective F→E map. The element t therefore belongs to 𝓞 F and lies in Q's contraction because xσ(x)∈Q. The assumed equality of contractions implies xσ(x)∈P. Primality gives x∈P OR σ(x)∈P, equivalently x∈P OR x∈cP(P). Hence Q⊆P∪cP(P) as sets. An ideal contained in a union of two ideals is contained in one of them (if neither, pick a,b in Q outside the respective ideal; each must lie in the other, then a+b lies in neither). Maximality of the height-one primes gives Q=P or Q=cP(P). Retain fixed-field, integrality descent, contraction and maximality obligations. This does not say the two primes are distinct. C:482–507 uses the two cases cP(P)=P and cP(P)≠P to construct IsPrimeIdem; the first uses delta uniqueness, the second delta_conj plus pointwise orthogonality and the sum of the two deltas equalling the base-place cut. Full supported subgroup assembly C:511–530 is the next consumer; no claim of reconstructing its full downstream arithmetic here.

## Executed provenance and source dependency check
Connector V8: 62/62 assertions (3 exact blob hashes + 59 literal source-reference anchors across 14 slices). Reproduce by git rev-parse P:path and git show P:path; index lines inclusively and fail if any following anchors absent. The source-reference edges are lexical, not elaborated constants:
- C220–222: RingOfIntegers.ext, star_star.
- C233–243: eq_of_le, mem_cP, cO_cO.
- C252–258: TensorProduct.induction_on, | zero, | tmul, | add.
- C260–266: AddSubgroup.closure_le, AddSubgroup.subset_closure, cO D x.
- C268–276: cA_incA, star_inv₀, star_star, mem_cP, not_congr, finPart_cA_mem, cA_cA.
- C278–285: mem_adicCompletionIntegers, levelaf_valued_algebraMap, map_inv₀, valuation_lt_one_iff_mem, inv_le_one₀, Valuation.zero_iff, exact_mod_cast hx.
- C327–337: hΦ.int, hΦ.inc, by_cases h0, mul_left_cancel₀, inv_mem_iff.
- C339–357: eq_of_le, by_cases hx0, exists_mem_ne_zero_of_ne_bot, not_int_iff, one_ne_zero.
- C359–363: delta_idem, tie_iff, parts_cA, map_zero, .conj.
- C379–388: HeightOneSpectrum.ext, D.sp.cm.fixed.
- C390–410: D.sp.cm.fixed, isIntegral_algHom_iff, Ideal.mul_mem_right, P.isPrime.mem_or_mem, Ideal.subset_union, eq_of_le.
- C482–507: exists_delta, delta_conj, eq_or_eq_cP, under_cP.
- L14–16: algebraMap_adicCompletion, adicCompletion.valued_coe.
- W96–107: star_star, TensorProduct.induction_on, Algebra.TensorProduct.map_tmul, map_add.

H comparison by extracting each declaration through next blank line: 13 of 15 slices identical. C cO_cO, mem_cP, eq_of_le, isConjPl_iff, finPart_cA_mem, Comparison₂.conj, inv_mem_iff, not_int_iff, tie_iff, delta_conj, under_cP, eq_or_eq_cP and L levelaf_valued_algebraMap unchanged. C parts_cA and W cA_cA each change map_add to map_add (f := _). No semantic equivalence or successful build inferred.

## Reproducible exact regression (executed connector V8)
Gaussian integers model E=Q(i), F=Q. Six prime representatives over 2,3,5,13 (ramified, inert, split); conjugation permutes them up to associates. Integer division tests valuations exactly for nonzero Gaussian integers in [-20,20]². Norm powers use BigInt, no floating valuation. Finite mask support is a model of the 0/1 local coordinates, not an adelic or Lean construction. The norm-divisibility and inverse-valuation checks are algebraic regressions rather than independent general valuation theorems. The finite grid contains each chosen prime generator, so it distinguishes all masks in this model. Counts include separate assertions per case.

```js
function regress(){
const A=(b)=>{if(!b)throw Error("regression")};
const ps=[[1,1],[3,0],[2,1],[2,-1],[3,2],[3,-2]],bar=[0,1,3,2,5,4];
const v=(a,b,[c,d])=>{if(a===0&&b===0)throw Error("zero");let k=0,N=c*c+d*d;while((a*c+b*d)%N===0&&(b*c-a*d)%N===0){[a,b]=[(a*c+b*d)/N,(b*c-a*d)/N];k++}return k};
let inv=0,conj=0,supp=0,ties=0,perm=0,neg=0;const good=Array.from({length:64},()=>Array(6).fill(true));
for(let a=-20;a<=20;a++)for(let b=-20;b<=20;b++){if(!a&&!b)continue;
 const ns=ps.map(p=>v(a,b,p)),ms=ps.map(p=>v(a,-b,p));
 for(let i=0;i<6;i++){const [c,d]=ps[i],N=c*c+d*d;
 const divides=(a*c+b*d)%N===0&&(b*c-a*d)%N===0;
 A((BigInt(N)**BigInt(ns[i])<=1n)===!divides);inv++;
 A(ns[i]===ms[bar[i]]);conj++;
 }
 for(let m=0;m<64;m++){
  const lhs=ns.some((n,i)=>(m&(1<<i))!==0&&n>0);
  const localIntegral=ns.every((n,i)=>!(m&(1<<i))||BigInt(ps[i][0]**2+ps[i][1]**2)**BigInt(n)<=1n);
  A(lhs===!localIntegral);supp++;
  const mc=bar.reduce((s,j,i)=>s|(((m>>i)&1)<<j),0);
  A(lhs===ms.some((n,i)=>(mc&(1<<i))!==0&&n>0));perm++;
  for(let i=0;i<6;i++)good[m][i]&&=lhs===(ns[i]>0);
 }
}
for(let m=0;m<64;m++)for(let i=0;i<6;i++){A(good[m][i]===(m===(1<<i)));ties++}
try{v(0,0,ps[0]);throw Error("expected rejection")}catch(e){A(e.message==="zero");neg++}
A(v(2,1,ps[2])===1 && v(2,1,ps[2])-v(2,1,ps[2])===0);neg++; // e=pi non-idempotent cancels inverse
A([1,1].slice(1)[0]===[0,1].slice(1)[0]&&[1,1][0]!==[0,1][0]);neg++; // finite data misses infinite part
A(v(2,1,ps[2])>0&&v(2,1,ps[3])===0);neg++; // split pair distinct
return {inv,conj,supp,ties,perm,neg}
}
console.log(regress());
```

Actual output {"inv":10080,"conj":10080,"supp":107520,"ties":384,"perm":107520,"neg":4}. No original hypotheses removed. Three primary source files, 14 source-reference slices, 15 upstream comparison slices. Other five immediate import files inspected for supplier location only. No full Lean kernel replay, independent proof of imported valuation lemmas, authenticated Main root reachability, or URT acceleration demonstrated.

## RESUME HERE
Expand C:482–530 (exists_isPrimeIdem and supported_group_and_prime_idempotents), particularly both branches of of_isPrimeIdem at C:460–480, and the original IsIdemAt/IsPrimeIdem definitions from the actual imported source. Then trace its character-box consumer, not repeat the already-translated RUN16 comparison. Request authenticated role-labelled Main-root edges to IdemSupport.inv_mem_iff, Comparison₂.conj, delta_conj, eq_or_eq_cP and RUN15–18 suppliers from dependency/kernel lanes. Retain ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf, Keep/Pins obligations. HANDOFF TO kernel, dependencies, integration, editor, Galois, theta, audit. Project OPEN.
