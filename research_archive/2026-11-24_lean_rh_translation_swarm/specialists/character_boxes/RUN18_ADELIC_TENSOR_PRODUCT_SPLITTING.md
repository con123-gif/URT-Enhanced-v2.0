# RUN18 — Full adelic tensor-product splitting and its topological inverse
2026-11-25. SOURCE-MATCHED / DONE for the human reconstruction of the two native splitting declarations and their immediate consumer; NOT kernel replay or authenticated root reachability. Project OPEN.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI #405 (00:28:28Z, physical checks only), RUN17 and 25 recent commit titles plus available peer RESUME HERE excerpts from 15 recent patches. No duplicate identified. Some full peer files and external blueprint were not reopened. No physics or protected-file changes.

## Provenance
Upstream leanprover-community/riemann-hypothesis; pin P=40e56bab026552e089d7afcfeff08d2defb9c005; latest returned H=b2f365a68500e2bde98cd60a2324263fc62fba10 (Merge PR #1787; changed since RUN17's 9282d3a102c4aff0e6026746db2a8990f5d9cddd).
A=src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/ExistsAdeleRingTensorEquivInfiniteProdFinite.lean
P blob 6efcfa7fffd73e9509215b0a1f6b74eda90860b5; H blob 0df62830b18b609e043561bd449ce4de56f02070.
[Original](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/ExistsAdeleRingTensorEquivInfiniteProdFinite.lean#L9-L114).
C=src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean
P blob 4125fd7aed8d975a8179e2debf22c365e01f237e.
[Consumer](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L181-L206).

## Quantifiers and human proof
A:9–18, GlobalTheory.AdSplit.exists_prod_equiv. For ALL commutative rings F,E,A,B with F-algebra structures on E,A,B, and topological-ring instances on A and B, equip the three tensor products with the specific module topologies in the source (over A×B, A, B respectively). There EXISTS a single ring equivalence e: (A×B)⊗_F E → (A⊗_F E)×(B⊗_F E) satisfying BOTH coordinate equations for EVERY z and with continuous forward and inverse maps. No flatness, field, finite-dimensionality, Hausdorffness or completeness hypothesis is added. This concerns these declared module topologies, not an arbitrary completed tensor product.

1. A:19–42. The universal tensor maps p=pr_A⊗id_E and q=pr_B⊗id_E are algebra homomorphisms; on pure tensors they map (a,b)⊗x to a⊗x and b⊗x. The imported linear equivalence l=TensorProduct.prodLeft has coordinates (p,q) by tensor induction (zero, pure tensor, sum). Because p and q preserve multiplication, l preserves multiplication coordinatewise. The source packages l.toAddEquiv plus map_mul' as the ring equivalence e. The imported prodLeft equivalence is an actual obligation, not a bijectivity assertion from the displayed pure-tensor formula alone.
2. A:43–64. Define i=rTensor_E(inl), j=rTensor_E(inr) as F-linear maps. For r∈A×B, z arbitrary, p(rz)=pr_A(r)p(z), q(rz)=pr_B(r)q(z), by induction on z, including both additive branches. Thus p and q are semilinear over the two continuous projection ring homomorphisms. The source invokes IsModuleTopology.continuous_of_linearMapₛₗ with continuous_fst/snd. Module-topology instances and ContinuousAdd are set up at A:19–27; these are indispensable for the subsequent continuity arguments. The identities concern module scalar actions.
3. A:65–88. i(a⊗x)=(a,0)⊗x, j(b⊗x)=(0,b)⊗x. Their scalar compatibilities follow again by tensor induction, now over the multiplicative monoid maps r↦(r,0) and s↦(0,s). These maps are continuous and additive coordinate inclusions, but NOT in general unit-preserving ring maps. The source uses distributive multiplicative action homomorphisms (→ₑ+) and IsModuleTopology.continuous_of_distribMulActionHomₑ, not a unital ring-hom continuity lemma. This distinction prevents incorrectly adding an assumption that one component is trivial.
4. A:89–100. Induct on arbitrary x∈A⊗E and y∈B⊗E, not on the number of places: p i=id, q i=0; p j=0, q j=id. Each pure tensor computation follows from its coordinate inclusion, and the sum case follows from additivity.
5. A:101–110. e=(p,q) is continuous by pairing the two continuous maps. Its inverse is EXACTLY (x,y)↦i(x)+j(y): apply e and use the four identities in step 4 to get (x,y); injectivity of e identifies this candidate with e.symm. Both inclusions are continuous, both product projections continuous and addition continuous in the declared module topology, so the inverse is continuous. The inverse formula is one reusable lemma, not a separate construction for every place.
6. A:112–114, GlobalTheory.AdSplit.exists_adele_equiv. For ALL number fields F,E with Algebra F E, substitute A=InfiniteAdeleRing F and B=FiniteAdeleRing (𝓞 F) F into step 1–5; the source uses the adele ring as their product. The same witness e satisfies all four obligations: first projection, second projection, continuity, inverse continuity. No use of RUN17's finite base-change bijectivity is needed for this general product splitting.

## Exact consumer (C:181–206)
For each D:D7, C.exists_comp chooses the finite base-change hom ι from RUN17, and the product equivalence e above. It uses its projections he1,he2 but discards the continuity pair at this call site (not removed from the upstream theorem). Let s=swapAE, the bijective tensor-factor commutation map, and Φ=ι∘s∘finPart. C.Comp (153–158) includes ext, surj, inc, int, base.
- ext: if infPart z=0 and Φz=0, injectivity of ι and s gives finPart z=0. Then e(z)=(0,0), hence z=0 by injectivity of e.
- surj: for any finite adele t, choose w with ι(w)=t by RUN17, then y with s(y)=w; choose z=e⁻¹(0,y). Both infPart z=0 and Φz=t hold simultaneously.
- inc/int/base: the original source invokes RUN17 map_tmul_one, mem_intAE_iff and map_mem_int/mem_int_of_map, and the original hι pure tensor formula. These are retained dependencies, not re-proved here. In particular, splitting alone does not imply finite integral compatibility.
The first two fields use both halves of e's bijectivity; neither a single projection nor mere continuity suffices.

## Static dependency check, actual execution and upstream diff
Executed in connector V8 on fetched source. 27/27 source anchors found. 16 anchors in exists_prod_equiv: TensorProduct.prodLeft; TensorProduct.induction_on; l.toAddEquiv; map_mul'; LinearMap.rTensor E (LinearMap.inl; LinearMap.rTensor E (LinearMap.inr; IsModuleTopology.continuous_of_linearMapₛₗ continuous_fst; same continuous_snd; IsModuleTopology.continuous_of_distribMulActionHomₑ; continuous_id.prodMk continuous_const; continuous_const.prodMk continuous_id; hpi; hpj; hp.prodMk hq; RingEquiv.symm_apply_eq; (hi.comp continuous_fst).add (hj.comp continuous_snd).
4 anchors in exists_adele_equiv: exists_prod_equiv F E; Continuous e ∧ Continuous e.symm; AlgHom.fst; AlgHom.snd.
7 anchors in exists_comp: GlobalTheory.AdSplit.exists_adele_equiv; (he z).1; (he z).2; e.injective; e.surjective (0, y); GlobalTheory.AdeleBaseChange.map_injective; GlobalTheory.AdeleBaseChange.map_surjective.
Reproduce by git show P:path and search each named declaration slice (A:9–110,112–114; C:181–206) for the listed literal substrings, fail if absent. These are lexical anchors, not 27 authenticated kernel edges. Exact slice comparison: wrapper A:112–114 identical at H:160–162. Generic theorem A:9–110 vs H:57–158 differs at exactly four lines (P 53,63,74,86): map_add changed to map_add (f := _) in simp only. H file has a longer import/module preamble. No semantic equivalence or successful elaboration inferred.

## Reproducible finite algebra regression
Executed JavaScript in connector V8. Specialization F=Z, A=Z/m, B=Z/n, E=Z/k. The standard cyclic tensor identity Z/m⊗_Z Z/k ≅ Z/gcd(m,k) is used as a model; the test checks the explicit coordinate formulas, congruence representatives, and inclusions, NOT the general prodLeft theorem, topology, local fields or Lean. The pair encoding is by enumeration, not CRT and not independent evidence of general multiplicativity; counts are regression checks only. Nonflat cases and zero component cases included.
```js
function gcd(a,b){while(b){[a,b]=[b,a%b]}return a}
let pure=0,round=0,add=0,mul=0,sel=0,neg=0,collapse=0;
const eq=(x,y)=>x.every((v,i)=>v===y[i]);
const assert=x=>{if(!x)throw Error("regression")};
for(let m=2;m<=9;m++)for(let n=2;n<=9;n++)for(let k=2;k<=9;k++){
 const d=gcd(m,k),e=gcd(n,k),D=d*e;
 const p=z=>z%d,q=z=>Math.floor(z/d),I=x=>x,J=y=>d*y;
 const f=z=>[p(z),q(z)],g=([x,y])=>I(x)+J(y);
 const plus=(x,y)=>((p(x)+p(y))%d)+d*((q(x)+q(y))%e);
 const times=(x,y)=>((p(x)*p(y))%d)+d*((q(x)*q(y))%e);
 for(let a=0;a<m;a++)for(let b=0;b<n;b++)for(let c=0;c<k;c++){
  const t=g([(a*c)%d,(b*c)%e]);
  assert(eq(f(t),[(a*c)%d,(b*c)%e]));
  assert(t===g([((a+m)*c)%d,((b+n)*c)%e])&&t===g([(a*(c+k))%d,(b*(c+k))%e]));
  pure++;
 }
 for(let z=0;z<D;z++){
  assert(g(f(z))===z);round++;
  assert(p(I(p(z)))===p(z)&&q(I(p(z)))===0&&p(J(q(z)))===0&&q(J(q(z)))===q(z));
  assert(plus(I(p(z)),J(q(z)))===z&&times(I(p(z)),J(q(z)))===0);sel++;
  for(let w=0;w<D;w++){
   assert(eq(f(plus(z,w)),[(p(z)+p(w))%d,(q(z)+q(w))%e]));add++;
   assert(eq(f(times(z,w)),[(p(z)*p(w))%d,(q(z)*q(w))%e]));mul++;
  }
 }
 if(d===1||e===1)collapse++;
}
assert(!eq([1,0],[1,1]));neg++; // nonunital inclusion
assert([0,0][0]===[0,1][0]&&!eq([0,0],[0,1]));neg++; // projection loses information
assert(gcd(2,3)===1);neg++; // tensor factor can collapse
console.log({pure,round,add,mul,sel,collapse,neg});
```
Actual output {"pure":85184,"round":2136,"add":31424,"mul":31424,"sel":2136,"collapse":408,"neg":3}. 512 triples of moduli; 408 with at least one zero tensor component. Original hypotheses removed: 0. No URT speedup or kernel check claimed. Two distinct source files examined; three named declarations traced.

## RESUME HERE
Reconcile RUN16 existing coverage of IdemSupport with C:327–363; then trace the native supplier of inv_mem_iff and Comparison₂.conj (in C itself or immediate imports), preserving nonzero x, idempotence, zero infinite part and height-one-prime hypotheses. If already covered, follow the first unexpanded actual supplier, not the repeated finite base change. Request authenticated role-labelled root edges to exists_adele_equiv, exists_prod_equiv, exists_comp and earlier RUN15–17 frontier; retain initial ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf, Keep/Pins as outstanding. HANDOFF TO kernel, dependencies, integration, editor, Galois, theta, audit. Project OPEN.
