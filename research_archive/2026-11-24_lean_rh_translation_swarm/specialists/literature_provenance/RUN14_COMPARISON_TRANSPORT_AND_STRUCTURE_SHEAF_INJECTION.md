# RUN14 — comparison transport and structure-sheaf H1 injectivity
2026-11-24. SOURCE-MATCHED / PARTIAL; project OPEN.
Source leanprover-community/riemann-hypothesis; pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (same as RUN13).

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN13 and RUN7, RESEARCH_STATE and RESEARCH_LOG excerpts, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, Cathedral CI summary #393 20:37:01 UTC (not RH verification). Inspected 13 recent peer commit file lists and available RESUME HERE lines; editor 19:56 note separately read. No duplicate of this free_of/cmpO expansion identified. Blueprint link reviewed, PDF not reopened. No physics changes.

## 1. Exact comparison transfer, not a global supplier
In AbelianDeRhamFreeOfCrystallineComparison L33–52, R is an arbitrary commutative ring, A an over-object of Spec R with group structure, hab:IsAbelianScheme A, hg:SmoothOfRelativeDimension g A.hom, s:A.left→Spec R and hs:s=A.hom. Keep hC:Published.CrystallineSmoothLift and hA:Published.AbelianHodgeDeRham as separate explicit premises (RUN7 recorded their full fields). Substitute hs, use hab.smooth and hab.proper, obtaining smooth, separated and quasi-compact structure for comparison.

CechDeRhamComparisonBijectiveCupSmooth L12–35 constructs a lift datum D with zero ideal, trivial divided powers dp0, X₀=X, i=id, t=s. The quotient R/0≃R gives an isomorphism on spectra and required pullback. At L43–56 the supplied hC gives e₁:D's H1≃HH1 and e₂:D's H2≃HH2. Its compatibility with the identity lift morphism and IsMor.pullCohomologyOne_id identifies e₁(c)=cmp1(c). Thus cmp1 is bijective and e₂ takes cup(a,b) to cupHH(cmp1 a,cmp1 b). Choosing D specializes hC; it does not prove hC.

Write E₁=cmp1:DR1≃HH1, E₂:DR2≃HH2, E_H:∧²HH1≃HH2, the latter supplied by hA. From hA obtain finite generation, projectivity and stalkwise rank 2g of HH1 (not a global free basis). Transport finiteness and projectivity along E₁⁻¹ and rank along localization equivalence. The required map is
    F = E₂⁻¹ ∘ E_H ∘ ∧²E₁ : ∧²DR1 ≃ DR2.
ExteriorPower.map respects composition and identity, so ∧²E₁ has inverse ∧²(E₁⁻¹) (L18–31). On a∧b,
    F(a∧b) = E₂⁻¹(E_H(E₁a∧E₁b))
             = E₂⁻¹(cupHH(E₁a,E₁b)) = cup(a,b).
L58–61 supplies Published.AbelianDeRhamFree via free_of and Category.comp_id; statement wrapper L7–8 is conditional, not an independent axiom or a proof of hC/hA. AbelianDeRhamStructure is a distinct conjunction of this predicate, Hodge and BaseChange (PublishedTheorems/Divisors₂/AbelianDeRhamStructure L15–24). Neither latter conjunct follows solely from F. Remaining hA fields are not consumed at free_of but must remain in its declared premise. No extra freeness, field restriction or basis choice.

## 2. Independent structure-sheaf comparison injectivity
StructureSheafComparisonInjective L17–30 proves cmpO injective for every commutative ring R, scheme X and s:X→Spec R, without taking hC or hA as local premises. Suffices to prove kernel zero. Given a class c with cmpO(c)=0, choose representative f via H1.mk_surjective. Vanishing comparison class gives a 0-cochain g on affine opens through H1.mk_eq_zero.1. For a:U→V in the opposite affine-open category, exact sign:
    g(V) − res(g(U)) = fv(f,affF(a)).
Here f is a cocycle on trivial thickenings TT(s); composition obeys fv(f,a≫b)=b_*(fv(f,a))+fv(f,b). For T∈TT(s), B=T.obj.B. On a pair p of compatible affine opens in Spec B and X (point map pt T), local section
    h_p = secPullA(T,p)(g(op p.second)) + fv(f,aM(T,p)) − fv(f,bM(T,p)).
CocycleLocalSectionsRestrictCompatibly L34–55 gives h_p=res(h_q) for p≤q. Put ρ=res, δ=fv(f,resThk), u=fv(f,affF(d)). Equations b_p=ρb_q+δ; ρa_q+δ=P_p(u)+a_p; g_p=res(g_q)+u; P_p(res(g_q))=ρP_q(g_q). Substituting yields h_p=ρh_q.

ExistsGlueFunctionsSpecFromPairs L11–54 proves existence of G_T∈B restricting to h_p: affine opens form a local basis; for y in overlap choose affine W containing x(y) in intersection of target opens and affine V containing y inside both source opens and x⁻¹W. The resulting pair r refines both. Compatibility under r≤p implies equal germs on overlaps. Every y is covered by such a pair. Sheaf section extensionality and existsUnique_gluing' give a global section; ΓSpecIso identifies it with an element of B.

For φ:T→T', pull back to every compatible affine source pair in T'. CochainValueOnThickeningHomEqSubOfGlued L51–99 constructs p' and c:thk T p→thk T' p' using pt_comp and secPull. Its identities are a'=χa+δ, χb+δ=res(fv(f,φ))+b', and χP(g)=P'(g), with χ local pullback and δ=fv(f,c). Thus
    res(G_T'−φ_*G_T)=h'−χh
                    = (a'−χa)+(χb−b')
                    = res(fv(f,φ)).
SpecFunctionsEqOfRestrictionsOnPairsStatement upgrades local equality to equality in B'. Its proof is a separate dependency not unfolded here. Therefore fv(f,φ)=G_T'−φ_*G_T. Choosing all G_T gives a 0-cochain whose coboundary is f; H1.mk_eq_zero.2 proves c=0. The .symm in the final Lean line preserves orientation. Statement wrapper is unconditional at this local level with a native proof body, not evidence about its transitive axioms.

## 3. External assumption ledger delta
| Name | Classification | Premises / next trust obligation |
|---|---|---|
| Published.CrystallineSmoothLift (BijectiveCechDeRhamComparisonDegreeOne L130–136) | def : Prop; hC local hypothesis | All D, nil divided powers, actual reduction pullback; equivalences, cup, degree-one comparison, naturality. Global producer not located. |
| Published.AbelianHodgeDeRham (L15–29) | def : Prop; hA local hypothesis | HH1 and other finite projective ranks, cup, closedness, injectivity/surjectivity, all base changes. Global producer not located. |
| Published.AbelianDeRhamFree / Structure L15–24 | definitions, not proof terms | Structure has three conjuncts; free_of supplies first only. |
| Proof.abelianDeRhamFree_of_hodge; T.abelianDeRhamFree_of_crystalline_comparison | conditional native theorem and wrapper | hC,hA; no evidence either is an axiom or is globally supplied. |
| CechDR.cechDeRham_comparison_bijective_cup_smooth L43–56 | conditional native theorem | hC, smooth, separated, quasi-compact. |
| CechDR.cmpO_injective and T.structure_sheaf_comparison_injective | native theorem and wrapper, no hC/hA parameter | Imported H1 quotient, affine basis, sheaf gluing and local separation proofs retained. |
| AffLoc.exists_glue_pair, hSec_res, fv_eq_sub_of_glued | native bodies; corresponding T.exists_glue_functions_spec_from_pairs, T.cocycle_local_sections_restrict_compatibly, T.cochainValueOnThickeningHom_eq_sub_of_glued are wrappers | Pair compatibility, cocycle, actual coboundary g, actual glued sections. |
| Mathlib exteriorPower.map_comp/map_id, Module.Finite.equiv, Module.Projective.of_equiv, Module.rankAtStalk_eq_of_equiv, sheaf section_ext and existsUnique_gluing' | imported named lemmas | Not independently replayed or expanded here. |
| SpecFunctionsEqOfRestrictionsOnPairsStatement, SecPullA, H1.mk_eq_zero, IsMor.pullCohomologyOne_id | named source dependencies | Preserve, expand if root-linked; transitive axiom status unknown. |
No new citation claims; no OpenLiteratureStatements declaration classified in this local run. Published names are not evidence of proof or citation. Repository code search for both hC and hA predicate names returned zero results: a search limitation, not proof of nonexistence of producers. RUN7 already explained CrystallineSmoothLift.toCrystallineDeRham.

## 4. Reproducibility, actual execution and migration
Live GitHub connector/V8 checks: 14/14 pinned blob IDs matched expected IDs and 87/87 exact source line anchors matched. Six current file blob IDs matched. 146 lines literally identical; two additional lines matched after replacing three wrapper calls with previously inspected direct native bodies. No claim of kernel equivalence after consolidation. Initial attempt to write note in same tool invocation exhausted its tool-call allowance after checks; this separate write preserves the result.

Replay below (Python not separately executed here) in upstream checkout independently rehashes all 20 raw Git blobs, checks the 148-line comparison and a representative subset of the 87 anchors. No synthetic numerical tests: deliverable is source and obligation preservation.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
base="src/Development/AbelianVarietyTheory/"
D=base+"Proofs/DivisorProofs/"
A=base+"PublishedTheorems/Divisors₂/"
rows=[
(D+"AbelianDeRhamFreeOfCrystallineComparisonStatement.lean","8fee6206895e54258144505d60a5f5343c546253",7,"CrystallineSmoothLift"),
(D+"StructureSheafComparisonInjectiveStatement.lean","f0ab09e0d666ee3b6e1dbe19d77f25869d58a331",6,"Function.Injective (cmpO s)"),
(D+"AbelianDeRhamFreeOfCrystallineComparison.lean","257bdd4da072b61006e841e8d52b2ab1d331f19f",50,"eH.trans e2.symm"),
(D+"StructureSheafComparisonInjective.lean","0ff11567c19d8bcbe019fea3b7022d573e36837a",29,"H1.mk_eq_zero.2"),
(D+"CechDeRhamComparisonBijectiveCupSmooth.lean","a322dc4b1c40fd22f5b1d2523687786a878ac2bc",51,"pullCohomologyOne_id"),
(A+"AbelianDeRhamStructure.lean","84cbcbc1da6f5de3d1066b698f962efccf006cda",24,"AbelianDeRham.Hodge ∧ AbelianDeRham.BaseChange"),
(A+"AbelianHodgeDeRham.lean","80799a38567aba92e73f29eb44b8da65f95f44c2",15,"def AbelianHodgeDeRham : Prop"),
(A+"BijectiveCechDeRhamComparisonDegreeOne.lean","5c1ea214a49422785892f5afd011edde47b23911",130,"def CrystallineSmoothLift : Prop"),
(D+"ExistsGlueFunctionsSpecFromPairsStatement.lean","bcb168683fa64dc2d6690838a5639016d3f89af4",7,"exists_glue_pair"),
(D+"CocycleLocalSectionsRestrictCompatiblyStatement.lean","934acb1e517a336d1b247b9c0aaca2654608d61f",7,"hSec_res"),
(D+"CochainValueOnThickeningHomEqSubOfGluedStatement.lean","46b1c52d612954fb0d426fb4e65de34bea8f4a8e",7,"fv_eq_sub_of_glued"),
(D+"ExistsGlueFunctionsSpecFromPairs.lean","84bb43a5ca45b8aa583de4256c560e099588d8f1",44,"existsUnique_gluing'"),
(D+"CocycleLocalSectionsRestrictCompatibly.lean","e8ff98d09f903b4f42a112324be9f7f0236ca990",55,"linear_combination e2"),
(D+"CochainValueOnThickeningHomEqSubOfGlued.lean","d83a0852aaa77434be6eeca1056047cc34502f71",99,"linear_combination -e1 - e2")]
migr=[
(D+"AbelianDeRhamFreeOfCrystallineComparison.lean",18,52,59,"cdb90afa63d3d36c016d52b132894c4d4b66624c"),
(D+"CechDeRhamComparisonBijectiveCupSmooth.lean",12,56,51,"acf9f8578b0f8d8b212e6b3b8cfbb013a225e97e"),
(A+"AbelianHodgeDeRham.lean",15,29,56,"cf94101456bb9df42a76f1975b2fc2cf08917082"),
(A+"AbelianDeRhamStructure.lean",15,24,54,"1915b7d7ab8cf97843e272113e31e7410ffc3ec6"),
(A+"BijectiveCechDeRhamComparisonDegreeOne.lean",130,158,136,"79e914237bb842f625c2eba1dde6976715944caf"),
(D+"StructureSheafComparisonInjective.lean",17,30,346,"1d23d2432d501ff6d60a714e0162f7b30607671b")]
repl=[
("GlobalTheory.T.exists_glue_functions_spec_from_pairs","_root_.GlobalTheory.CechDR.AffLoc.exists_glue_pair"),
("GlobalTheory.T.cocycle_local_sections_restrict_compatibly","_root_.GlobalTheory.CechDR.AffLoc.hSec_res"),
("GlobalTheory.T.cochainValueOnThickeningHom_eq_sub_of_glued","_root_.GlobalTheory.CechDR.AffLoc.fv_eq_sub_of_glued")]
def read(rev,path,sha):
    raw=subprocess.check_output(["git","show",rev+":"+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    return raw.decode().splitlines()
old={}
for path,sha,i,s in rows:
    old[path]=read(P,path,sha)
    assert s in old[path][i-1],(path,i,s)
exact=changed=0
for path,l,u,v,sha in migr:
    new=read(H,path,sha)[v-1:v+u-l]
    original=old[path][l-1:u]
    assert len(new)==len(original)
    for x,y in zip(original,new):
        if x==y: exact+=1
        else:
            for a,b in repl:x=x.replace(a,b)
            assert x==y,path
            changed+=1
assert (len(rows),exact,changed)==(14,146,2)
print(len(rows),exact,changed)
```

RESULT: SOURCE-MATCHED / PARTIAL. Conditional degree-two exterior-square transfer and independent structure-sheaf degree-one injection translated, with five statement wrappers distinguished from proof bodies. No global producer of hC/hA established, no independent Lean execution or root reachability claim.
RESUME HERE: locate actual proof-producing declarations of Published.CrystallineSmoothLift and Published.AbelianHodgeDeRham using dependency lane's authenticated role-labelled reverse edges (default-branch text search returned empty). If unavailable, follow imports of SecPullA and SpecFunctionsEqOfRestrictionsOnPairsStatement to finish injection leaves; do not repeat RUN7 or RUN14. Request role-labelled root witnesses for GlobalTheory.Proof.abelianDeRhamFree_of_hodge, GlobalTheory.CechDR.cechDeRham_comparison_bijective_cup_smooth, GlobalTheory.CechDR.cmpO_injective, and all three GlobalTheory.CechDR.AffLoc native suppliers. Keep system realization separate. HANDOFF TO integration, editor, audit, dependencies, kernel, geometry, acceleration. Project OPEN.
