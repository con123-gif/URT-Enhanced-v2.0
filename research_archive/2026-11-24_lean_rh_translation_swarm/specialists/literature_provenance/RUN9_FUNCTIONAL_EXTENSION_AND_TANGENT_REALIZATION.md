# RUN9 — Functional extension and tangent realization through residue fields
2026-11-24. SOURCE-MATCHED / PARTIAL: geometric child obligations remain open. No new mathematical premises added to source statements. No independent Lean kernel check, no URT speed claim. Upstream pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Latest checked 1da818b50f1e18808db2792b9dc735bda8cb84d8 (15:42:48 UTC, merge #1198). Read AGENTS, state, continuity, queue/protocol, swarm/handoff/expansion, peer lane handoffs and RUN8. Peer geometry RUN8 concerns quasi-finite fibers; kernel RUN9 reports an authenticated closure and requests direct edge export, not this translation. Physics CI at 15:28:23 is unrelated. Blueprint PDF not reread this run; pinned theorem bodies rather than blueprint claims are the evidence. No physics modifications.

## 1. Actual t5 supplier: tensor extension with kernel control
All paths below relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ at the pin.
ParPt.t5 (ExistsUniqueVectorFieldOfGlobalOneFormValues L26) explicitly invokes T.existsUnique_forms_functional_abelian_base_change, whose wrapper (ExistsUniqueFormsFunctionalAbelianBaseChangeStatement L18–19) applies BaseChangeForm.existsUnique_functional. This is not an axiom declaration. Its actual body uses BaseChangeForm.existsUnique_of_baseChange (ExistsUniqueFormsFunctionalAbelianBaseChange L25–55).

Let R→S be a homomorphism of commutative rings; F,G are R-modules, F',G' S-modules. Let c:F→G be surjective, c':F'→G' linear, p:F→F' semilinear, e:S⊗_R G ≅ G' an S-linear isomorphism, and c'p(f)=e(1⊗c(f)). For any R-linear l:G→S there is exactly one S-linear ψ:F'→S with ψ|ker c'=0 and ψp=l c. In fact
    ψ = l_S ∘ e^{-1} ∘ c',   l_S(s⊗g)=s l(g).
Existence follows by the tensor universal property. For uniqueness take any y in F', write e^{-1}c'(y)=Σ s_i⊗g_i, choose f_i with c(f_i)=g_i, and set z=Σ s_i p(f_i). Then c'(z)=c'(y), so any candidate ψ has ψ(y)=ψ(z)=Σ s_i l(g_i). This is precisely the source's tensor induction (zero, pure tensor, addition) and subtraction of a kernel element. It incidentally proves c' surjective, without assuming it or assuming flatness, finite generation or projectivity. No deletion of the semilinearity or tensor isomorphism condition is justified.

Geometric specialization L59–70: F,F' are crystalline forms on A,A_S; G,G' global 1-forms; c,c' are LieDual.glob, p=m.pullForm. Premises: CrystallineSmoothLift (HC), AbelianHodgeDeRham (HH), commutative R,S, algebra R S, group abelian scheme A smooth of relative dimension g, cartesian base change A' via φ, and the specified divided-power IsMor m. HH gives the compatible global-form tensor equivalence (L61–63). Uniqueness of pulled global forms follows from T.affinePairRestriction_injective_firstCohomology (wrapper explicitly invokes CechDR.pairRes_injective; body not expanded here). c is surjective by LieDual.glob_surjective. Because glob is the closed-form subtype inclusion composed with cmpForm, its kernel equals ker cmpForm, not merely a subset. The last two lines transport the vanishing condition in both directions by subtype coercion and extensionality. This is why no assertion of injectivity of cmpForm is required.

## 2. The actual quotient and its supplier
ExistsTangentVectorFunctionalGlobalFormsAbelianS L108–153:
glob = inclusion ∘ cmpForm. L122–143 supplies surjectivity, not an assumption of this geometric theorem: HC gives degree-one crystalline/de Rham comparison, HH gives closedness of global forms and injectivity of their classes; injectivity of the structure-sheaf comparison and exact filtration range permit lifting the class of each global form to a crystalline form. Same algebra as RUN8, reused rather than counted as new proof. Exact source child dependencies: cechDeRham_comparison_bijective_cup_smooth, structure_sheaf_comparison_injective, hodgeFiltration_eq_range, comparison_formClass, cechHodgeFiltration_eq_range. L145–153: for φ:F→R killing ker cmpForm, ker glob⊆ker φ; the quotient universal property yields φ̄:F/ker glob→R. By surjectivity, F/ker glob ≅ G, so ψ=φ̄∘e^{-1} satisfies ψ glob=φ, uniquely by surjectivity. Source constructs existence; uniqueness is a direct consequence, not a separate source declaration here.

## 3. Tangent realization: field case, residue lifting, global patching
Same module L155–346. Write L=Serre.Lie(intAct A), G=GlobForm, F=Form. Evaluation l: L→F* is linear (tangent addition and epsilon scaling). Vanishing on ker cmpForm is supplied by the internal theorem T.formValueOnTangentVector_eq_zero_of_globalForm_zero; its producer TanVanish.tanVal_eq_zero_of_cmpForm_eq_zero (FormValueOnTangentVectorEqZeroOfGlobalFormZero L156–163) is proved by local affine derivations and localization (L20–154), not by assuming evaluation factors. It holds for arbitrary dual-number points, not just tangents. The complete localization proof remains a child obligation.

Field step L164–206: factor every l(v) through c:F→G; surjectivity of c makes the induced T:L→G* linear and unique pointwise. If l injective then T injective. Over a field, finite equal dimensions of L,G (and therefore G*) imply T surjective. The geometric supplier invokes the given IsLieBasis, HH's stalk rank g, and LieInjField.eq_of_tanVal_eq (its body still open here). Thus every functional on G is realized over the field. Do not apply this finite-dimensional argument over arbitrary rings.

Residue step L223–324: for each surjective algebra map σ:R→K to a field, choose r outside ker σ with local chart and Lie basis over R[1/r]. Base change to K gives a basis y_i; clearing denominators (LieAway.tan_away_lift) provides global tangents w_i whose evaluations agree with those of u_i y_i after pullback, where u_i=σ(r)^N≠0. Preserve chart existence, smoothness, group pullback, base-change of IsLieBasis, dual-number naturality tanVal_pullForm (L67–106) and denominator-clearing as separate obligations. The set of v'∈Lie(A_K) whose evaluation on pulled forms agrees with some global tangent modulo σ is a K-subspace: add lifts; for scalar a∈K choose r_a∈R by surjectivity of σ and scale the lift by r_a. Since it contains u_i y_i and each u_i is invertible, it contains the entire basis, hence every v'. HH provides G_K≅K⊗G with pull compatibility. Apply field realization to the scalar extension of any α∈G*, then lift its evaluation along the basis argument. Thus for each α there is v over R such that σ(tanVal(v,f))=σ(α(c f)) for every f. The statement is congruence of evaluations, not a claim that every residue tangent as a geometric point lifts.

Global step L29–63 and 326–346: let N⊆G* consist of functionals χ with χ∘c in the range of l. G is finite projective by HH. Every maximal ideal m gives K=R/m, and the residue step plus quotient factorization shows for every α∈G* there is χ∈N with (α−χ)(G)⊆m. For finite projective G, choose G as a direct summand of R^n, with f:R^n→G, g:G→R^n and fg=id. Then any λ with λ(G)⊆m satisfies λ=Σ λ(f(e_i))(π_i∘g)∈mG*. Therefore G*/N=m(G*/N) for every maximal m. The quotient is finite. If α∉N, its annihilator ideal in G*/N is proper, so choose maximal m containing it. The determinant/Nakayama lemma yields r with r−1∈m annihilating the quotient. Then r also belongs to the annihilator of α+N, hence to m, contradiction. Thus N=G*. Finally φ killing ker cmpForm factors as ψc, and ψ∈N gives an actual tangent v with evaluation φ. This is the native proof of exists_tangent_of_functional, not a new literature axiom. Finite projectivity is essential to the pointwise residue criterion; see negative control below.

Related uniqueness wrapper: LieInj.tangent_eq_of_tanVal_eq (AbelianSchemeTangentEqOfCrystallineValuesEq L98–128) uses quotient dual-annihilator ≅ G*, finite projectivity of L and G*, surjectivity from the above theorem and equal stalk rank g to obtain injectivity. Preserve LieProj finite-projective-rank construction and Mathlib surjective equal-stalk-rank theorem; this is distinct from field injectivity used earlier, not a circular invocation of the final uniqueness theorem.

## 4. Provenance ledger and executed checks
Seven pinned source blobs reread; 71 exact line anchors checked in connector JS, all matched. Two wrapper bodies, one explicit conditional geometric chain, quotient and residue proofs, and imported Mathlib facts kept distinct. HC/HH are propositions supplied as premises; their global producers have not yet been translated. No new axioms inferred from citation labels, no independent external historical citation audit or Lean elaborated-edge audit this run. Request actual root-reachable direct edges for LieDual.exists_tangent_of_functional, BaseChangeForm.existsUnique_functional and the HC/HH suppliers from kernel lane.

Upstream: original ExistsUniqueFormsFunctionalAbelianBaseChange.lean now 404; moved into ExistsUniqueFormsFunctionalAbelianBaseChangeStatement.lean, blob 6419d54850aed6a4bd4edefda85071f9f112b772. Original L25–55 vs new L67–97 29/31 exact lines (explicit map_add argument changes); original L59–70 vs new L101–112 11/12 (direct pairRes_injective instead of old wrapper). Tangent module blob 0610edb6e4bb7564e19ef9d9da168bc35b880f00, original 8 selected blocks 203/208 aligned exact lines; principal L326–346 equals new L771–791, 21/21. Other changed lines not semantically certified. Do not assert equivalence of full revisions.

Compact reproducible hash/anchor replay in upstream git checkout (subset of 71 executed anchors):
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="1da818b50f1e18808db2792b9dc735bda8cb84d8"
base="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
rows=[
("ExistsUniqueFormsFunctionalAbelianBaseChange","c342aedb5fd27a7b4628352615ef54870239ac43",[(25,"existsUnique_of_baseChange"),(35,"TensorProduct.induction_on"),(47,"LinearMap.liftBaseChange"),(52,"ψ (f - f') = 0"),(59,"existsUnique_functional"),(67,"glob_surjective")]),
("ExistsUniqueFormsFunctionalAbelianBaseChangeStatement","9883e4b4b060882ad43b8462733c30db4d43ac29",[(19,"GlobalTheory.BaseChangeForm.existsUnique_functional")]),
("ExistsTangentVectorFunctionalGlobalFormsAbelianS","8b520290720c379350a27efc6171eb0cab0a658f",[(29,"eq_top_of_residue"),(33,"exists_comp_eq_id_of_projective"),(50,"exists_sub_one_mem_and_smul_eq_zero"),(108,"def glob"),(122,"glob_surjective"),(145,"exists_factor"),(150,"liftQ"),(164,"exists_eq_comp"),(188,"exists_tangent_field"),(223,"exists_lieBasis_lift"),(243,"tan_away_lift"),(263,"exists_lift_of_basis"),(278,"hσ c"),(290,"exists_tangent_residue"),(326,"exists_tangent_of_functional"),(338,"Ideal.Quotient.mk_surjective")]),
("AbelianSchemeTangentEqOfCrystallineValuesEq","48b8e2b8f0e72e2a19742dd68501e3ef68f8965d",[(98,"tangent_eq_of_tanVal_eq"),(117,"dualQuotEquivDualAnnihilator"),(122,"bijective_of_surjective_of_rankAtStalk_eq")]),
("AffinePairRestrictionInjectiveFirstCohomologyStatement","3996375bf10fc0c378687b2d5fe2a2eeee46eaf0",[(7,"GlobalTheory.CechDR.pairRes_injective")]),
("FormValueOnTangentVectorEqZeroOfGlobalFormZero","a9ea464bc1d9c1e677577decdf864948f701f83d",[(156,"tanVal_eq_zero_of_cmpForm_eq_zero"),(161,"snd_val_eq_zero")]),
("ExistsUniqueVectorFieldOfGlobalOneFormValues","366f5679daac8351fbdc73d7e76ae2281b1b031c",[(26,"theorem t5"),(132,"exists_tangent_of_functional")])]
def git(*a): return subprocess.check_output(["git",*a]).decode()
def read(ref,n,h):
    spec=ref+":"+base+n+".lean"
    assert git("rev-parse",spec).strip()==h
    return git("show",spec).splitlines()
for n,h,anchors in rows:
    ls=read(pin,n,h)
    for i,s in anchors: assert s in ls[i-1],(n,i)
a=read(pin,*rows[2][:2]); b=read(head,rows[2][0],"0610edb6e4bb7564e19ef9d9da168bc35b880f00")
blocks=[(29,63,521),(122,143,573),(145,153,596),(164,186,615),(223,261,668),(263,286,708),(290,324,735),(326,346,771)]
assert sum(x==y for lo,hi,st in blocks for x,y in zip(a[lo-1:hi],b[st-1:st+hi-lo]))==203
assert a[325:346]==b[770:791]
a=read(pin,*rows[0][:2]); b=read(head,rows[1][0],"6419d54850aed6a4bd4edefda85071f9f112b772")
assert sum(x==y for x,y in zip(a[24:55],b[66:97]))==29
assert sum(x==y for x,y in zip(a[58:70],b[100:112]))==11
print("hashes, anchors and alignment checked")
```

Finite algebra regression actually executed in connector JS (not Lean): 90 unique extension candidates, 78,370 compatibility checks, 440 kernel checks, 481 cyclic residue criteria, total 79,381 assertions, plus 3 negative controls. This is an illustrative algebra regression, not the full geometry or complexity benchmark. The uniqueness enumeration uses coefficient constraints implied by coordinate basis; compatibility and kernel identities are independently checked over all finite vectors. Reproduction:
```js
const assert=(p,msg)=>{if(!p)throw Error(msg||"failure")};
let extension=0,compat=0,kernel=0,residue=0,negative=0;
const mod=(x,n)=>((x%n)+n)%n;
for(const [n,m] of [[4,2],[6,3],[8,4],[12,6],[5,5]]){
 const tuples=(d,k)=>Array.from({length:d**k},(_,i)=>Array.from({length:k},(_,j)=>Math.floor(i/d**j)%d));
 const src=tuples(n,3),tar=tuples(m,3);
 for(const [x,y,z] of src){assert(mod(mod(x-z,m)+mod(z,m),m)===mod(x,m));compat++}
 for(const [a,b] of tuples(m,2)){
  const candidates=tuples(m,3).filter(([u,v,w])=>u===a&&v===b&&mod(w-u,m)===0);
  assert(candidates.length===1&&candidates[0][2]===a);extension++;
  const [u,v,w]=candidates[0];const psi=([x,y,z])=>mod(u*x+v*y+w*z,m);
  for(const f of src){const [x,y,z]=f;assert(psi([mod(x-z,m),mod(y,m),mod(z,m)])===mod(a*x+b*y,m));compat++}
  for(const [x,y,z] of tar)if(mod(x+z,m)===0&&y===0){assert(psi([x,y,z])===0);kernel++}
 }
}
for(let n=2;n<=100;n++){let primes=[];for(let p=2;p<=n;p++)if(n%p===0&&Array.from({length:p-2},(_,i)=>i+2).every(k=>p%k!==0))primes.push(p);for(let d=1;d<=n;d++)if(n%d===0){const surj=primes.every(p=>d%p!==0);assert(surj===(d===1));residue++}}
// Missing c surjectivity: c=p=0, c'=id over F2; both functionals valid.
assert([0,1].filter(a=>[0,1].every(x=>a*0===0)).length===2);negative++;
// Missing kernel vanishing: p embeds F2 in first coordinate, c' projects.
assert([0,1].filter(b=>[0,1].every(x=>mod(x+b*0,2)===x)).length===2);negative++;
// Missing projectivity: R=Z4, G=Z2, N=0, all duals take values in 2R.
const homs=[0,1,2,3].filter(a=>mod(2*a,4)===0);
assert(homs.length===2&&homs.every(a=>a%2===0));negative++;
console.log({extension,compat,kernel,residue,negative,total:extension+compat+kernel+residue});
```
RESUME HERE: reconstruct the pinned field injectivity LieInjField.eq_of_tanVal_eq and the native LieAway.tan_away_lift denominator-clearing supplier from the imports of ExistsTangentVectorFunctionalGlobalFormsAbelianS; then global HC/HH suppliers and system realization. Do not redo tensor extension or residue Nakayama. HANDOFF TO integration, editor, audit, kernel, geometry. Project OPEN.
