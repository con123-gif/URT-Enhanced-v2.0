# RUN22 — Crystalline reduction: tagged categories, acyclicity and comparison
2026-11-25. SOURCE-MATCHED local human proof; full RH OPEN. Continues RUN21 4e3c4bf16426b98cf19a9c93ec04b5096cad7f06, without revisiting Cathedral physics.

Preflight: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log excerpts, research and continuity protocols, latest CI summary (45545297982 at 3df7d31, unrelated Cathedral PASS), RUN21 full source ledger and handoff. Read recent peer handoffs from math, Galois, theta, Landau, prime, dependencies, acceleration, integration, character boxes, structure, kernel, geometry and audit; editor RUN22 commit and path inspected, full editor note and blueprint not reread. No duplicate of this crystalline reduction task identified. No authenticated Main-root path for this supplier retrieved: do not count these declarations as confirmed RH essential nodes.

## Source ledger (all paths relative to src/Development/)
Repository leanprover-community/riemann-hypothesis; pin 40e56bab026552e089d7afcfeff08d2defb9c005. B = WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/.
- R = B/CrystallineDeRham.lean, efc95dd74b086a96d3de1f13d40c04d4d4796931.
- T = B/TagIso.lean, 8774201f72ff039500e42c2f034b30d82ae7d1f7.
- A = B/AcycOfCoprod.lean, 6dd3e0d2c9681c3e31b7794c84b4e6e79854a341.
- F = B/CompF.lean, 5ca821664575e0d175f7de49095efbb7ec7bc571.
- L = B/IsNilpotentOfIsNilDP.lean, 09934d09743cb9868157e06156c78e7e6fbf5fc8.
- D = B/IsDPMorphismId.lean, 0b205314bb9cd8cdc4b67f0797ac0a949960a647.
- P = AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsCrystalPairing.lean, 53aee5b7a7aaa544c0e22ff51f0a7d449b0a036f.

Actual GitHub blob receipts matched all seven recorded SHA values. Upstream observed 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59; R at that revision is a 1247-line clump, blob 16ae3e6fef93fe4c8dc5c4907ec31fc77a81d47c. Of 70 nonblank pinned lines between exists_lev and the closing namespace, 66 occur verbatim somewhere in the clump (line membership, not ordered or kernel equivalence). Missing original lines R44,47 (Tag.hom_ext references) and R98–99 (crystallineDeRham wrapper). Red.pull1/2 remain at H1218 and H1229. No claim that wrapper is deleted globally; its new producer/use site needs locating.

## 1. Exact proposition and elementary reduction diagram
P L31–37 defines Published.CrystallineDeRham as a proposition, not an axiom or proof. Quantify over commutative rings R,R₀, ideal I, divided powers κ with IsNilDP κ; surjective π:R→R₀ with ker π=I; schemes X,X₀, s:X→Spec R, s₀:X₀→Spec R₀ and i:X₀→X; s smooth, separated and quasi-compact; the square (i,s₀,s,Spec π) a pullback; and every m:IsMor (dp0 R) s κ (s₀≫Spec π) (id_R) i. Conclusion: m.pull1 and m.pull2 bijective. D L22–29 packages nilpotence, surjectivity, kernel equality and pullback in Red, and L36–39 constructs the canonical morphism. IsMor is proof data over fixed underlying maps, not a new arbitrary map on cohomology. R L98–99 has an actual proof term constructing both conclusions; it ignores the quasi-compactness and final m binders syntactically. Preserve them in the published proposition. No new axiom inferred.

A chart U in F L20–24 is an affine open with flat coordinate algebra over R and a formally étale map R[x₁,…,x_d]→Γ(U,O). Smoothness gives the chart cover (L160ff), separatedness gives intersections (L208–219): the intersection of two affine opens is affine by the affine diagonal; the restriction is étale, hence flat and formally étale, so composing preserves the chart property. The reduced chart opens are i⁻¹(U); preimages preserve unions and intersections, so R65–72 derives cover and intersection closure without needing i to be an open immersion.

For j=1,2, write A_j=H^j(Thick(dp0 R,s),O), B_j=H^j(Tag(dp0 R,s,U),O), C_j=H^j(NTκ,O), E_j=H^j(Tag(κ,s₀≫Specπ,i⁻¹U),O), Z_j=H^j(Thick(κ,s₀≫Specπ),O). The native maps are a:A_j→B_j by tag restriction; b:B_j→C_j by inclusion restriction; c:C_j→E_j by cG; d:Z_j→E_j by reduced tag restriction; p:A_j→Z_j by h.mor.pullj. For each j:
    d p = c b a.
The equality is checked in R74–95 on arbitrary cohomology classes by H1.mk_surjective or H2.mk_surjective and definitional equality of the representative maps. Each of a,b,c,d is bijective by the actual source suppliers below, hence p=d⁻¹ c b a is bijective. It would be incorrect to cancel d without bijectivity. The statement is about cohomological classes, not individual cochains.

## 2. Tags, small objects and the two restriction maps (F29–60; T36–65,152–235)
Tag(γ,s,U) objects are (T,k, image of T.x contained in U_k); arrows are thick-object arrows plus U_k⊆U_l. An arrow is determined by its thick arrow, since the order constraint is propositional. IsSmall is the full subcategory of thick objects admitting such a chart. toSmall forgets the tag, and the whole forgetful functor factors through inclusion of IsSmall.
Fix a small target T, choose a tag k₀ containing its image, and consider a comma object a=(S,k,c:S→T). The arrow implies T's image is contained in U_k. Let self(k)=(T,k,id_T) for each admissible k, and choose m(k) with U_m=U_k∩U_k₀. A comma arrow to self(l) is unique if it exists: its thick component is forced to be the structural map to T, and inclusion of opens supplies the tag condition.
Construct S₁(a)=self(k), S₂(a)=self(m(k)). Monotonicity of intersection yields functoriality; the unique arrows to self objects make the following three families natural:
    Id → S₁ ← S₂ → const(self(k₀)).
Thus the comma category is nonempty, any compatible objectwise constant-coefficient family takes the same value at all objects, and identity and constant restriction on H¹,H² agree. T uses its explicit natural-transformation pullback lemmas and the one-point category (H¹ vanishes by initiality, H² by an explicit constant primitive). This proves acyc_toSmall. Important: acyclicity here is the exact A14–16 predicate (nonempty, constant 0-cochain property and H¹/H² vanish for EVERY commutative R-algebra of constant coefficients), not merely connectedness or a general all-degrees contractibility claim.
For a,d in §1, T190ff composes qa1 with SmallDescent.pull1_bijective. Degree two T199ff uses Desc.pull2_bijective: constructs its localization premise from SmallDescent.exists_isLoc (unit, surjectivity, kernel and universal property), uses smallness inheritance under a thick morphism, and constructs a finite cover via SmallDescent.exists_cover and its Fin indexing. Then qa2 applies. The deeper localization and cover descent proofs are imported, not established merely by this composition.

## 3. NT comma acyclicity (R20–60; F16–18; L223–354)
InNκ(S) asserts existence of divided powers on S.J + I B_S extending both S's PD structure and κ through algebraMap. NT is the full subcategory of tags with this condition, not the entire category. Fix T in the tag category. Since T's PD ideal is weighted nilpotent with cutoff N, n=N+1≥1 has filtration ideal fil_n=0 (exists_lev uses the generators of the ideal span). Use the tag k=T.k. Let D_T be the comma category of NT over T. The standard chart object bas(k) is InN because its chart algebra is flat and flatExt supplies extension of κ; the zero PD ideal is compatible. A lift a₀:bas(k)→T.T exists because the reduction maps are surjective with nilpotent kernels and the chart coordinate map is formally étale (L255–297). Choose lifted polynomial coordinates and lift uniquely relative to those coordinates, not uniquely without them. This gives distinguished comma object d=(bas(k),k,a₀).
For each a∈D_T let c_a:S_a→T.T be its thick arrow. Its tag is contained in T's chart. L313–354 supplies P_a with arrows i_a:S_a→P_a, j_a:bas(k)→P_a, InNκ(P_a), and fil_n(P_a)=0, and the universal property ONLY for level-n targets V:
    for every φ:S_a→V and b:bas(k)→V there exists a unique ψ:P_a→V with ψ i_a=φ, ψ j_a=b.
Construction: choose chart lift j_S to S; use exists_adj S hS d n hn to adjoin d nilpotent coordinates y_k with universal property. Lift chart into P with coordinates i(j_S(x_k))+y_k, since y_k reduces to zero. Given φ,b into V, prescribe y_k↦ b(x_k)−φ(j_S(x_k)). These differences lie in V.J since the reductions agree (π_eq). The universal property of exists_adj gives ψ; agreement on coordinates plus formal unramifiedness gives ψj=b (lift_ext). The same argument forces any competitor to have the prescribed y values, proving uniqueness. This is conditional on exists_adj, whose actual construction is the next frontier, not an unrestricted categorical coproduct.
Apply that property to V=T.T to obtain q_a:P_a→T.T with q_ai_a=c_a and q_aj_a=a₀. Give P_a the tag T.k, producing Q(a) in D_T. Its chart constraint is carried by i_a; the original tag inclusion makes i_a an arrow a→Q(a). For any comma arrow φ:a→Q(b), apply universal property with V=P_b (level n) to obtain ψ extending φ and j_b. Both q_bψ and q_a extend c_a and a₀, hence equal by uniqueness with target T.T (also level n). So ψ is an arrow Q(a)→Q(b) over T. Its uniqueness as a comma arrow follows from faithfulness of forgetting tags and the comma equation. These are exactly the hypotheses of A65 acyc_of_coprod; they do not require coproducts for arbitrary targets.
A65–79 constructs Q on an arrow f:a→b by uniquely extending i_b f and j_b; identity and composition follow by the same uniqueness. Thus Id→Q←const(d). A29–63 transports restriction through this zigzag with identity coefficient maps. For H¹ the constant restriction evaluates a cocycle at id_d, which is zero (Z1.id). For H² it evaluates at (id_d,id_d) to a constant z; the constant 1-cochain z has differential z−z+z=z. Every class is a boundary. Compatible functions are constant via the zigzag, and d witnesses nonemptiness. This proves acyc_NT. No assumption of arbitrary-degree vanishing.
Now b in §1 is bijective by qa1/qa2 for all comma targets T. A138–275 contains actual proof bodies; their general descent identities are recorded separately below.

## 4. The middle comparison c and its inverse (D41–78,83–176,180–242)
Surjectivity of i: weighted nilpotence implies each element of I nilpotent (repeat degree-one divided powers N times); thus every prime of R contains I, and surjectivity of π identifies Spec R₀ with the primes containing I. Surjectivity is preserved by pullback. Consequently inclusion of opens may be detected on i⁻¹(U); this is what permits G on tagged arrows.
For S∈NT, enlarge J_S to J_S+I B_S and take quotient of B_S by that sum, preserving B_S itself. The maps from old quotient and R₀ exist by quotient universality. Their agreement over R gives a point in X₀ by the pullback property. Chosen compatible PD structure is nilpotent by nil_sup (both original structures nilpotent; required). This is D's Red.up. Its arrows extend through the quotient because both ideals map into the target ideal; PD compatibility follows from isDPMorphism_sup. Unit arrow on B_S is identity. Conversely, a thick object over X₀ already contains the base PD image; forgetting κ preserves its ring and places it in NT. These constructions give D's G,H, with same coefficient rings and identity coefficient maps cG,cH. The unit Id→H⋙G and counit G⋙H→Id induce identities on coefficient rings. Coefficient-map natural-transformation invariance then gives inverse compositions on H¹ and H² (D226–242). No claim that these are inverse on raw objects, or that arbitrary natural transformations imply equality without coefficient compatibility.
Combining §§1–4 discharges both Red.pull1 and Red.pull2 under their native local premises.

## 5. General qa1/qa2 proof-body reading (A138–275; no transitive kernel claim)
For an arrow c:GS→T write c_* for the coefficient map. Each comma category satisfies Acyc; in its constant coefficients, differences of compatible expressions descend to unique constant values because it is nonempty and connected. Degree one injectivity: if a restricted cocycle f is δg, the expression f(c)+c_*g(S) is invariant under precomposing by comma arrows; denote the constant m(T). For φ:T→T', the cocycle equation yields f(φ)=m(T')−φ_*m(T). Degree one surjectivity: for cocycle f on C', choose v_T with v_T(S',c)−v_T(S,cGψ)=−c_*f(ψ), using H¹=0; define m(φ)=v_T'(S,φc)−φ_*v_T(S,c), invariant under comma arrows. Its cocycle identity telescopes; at identity c of GS, its restriction differs from f by δ of v evaluated at identity.
Degree two injectivity: if restricted z=δf, choose v_T with
    v_T(S',c)−v_T(S,cGψ)=z(Gψ,c)−c_*f(ψ).
Use z's cocycle identity to show m(φ)=z(c,φ)−φ_*v_T(S,c)+v_T'(S,φc) independent of c; then δm=z by the same cocycle identity, as the v terms cancel.
Degree two surjectivity: let y be a cocycle on C'. H² comma acyclicity gives w_T on comma arrows satisfying δw_T(φ,ψ;c)=c_*y(φ,ψ). H¹ acyclicity gives x_φ on objects with δx_φ(ψ;c)=φ_*w_T(ψ;c)−w_T'(ψ;φc). Define m(φ,φ')=φ'_*x_φ(S,c)+x_φ'(S,φc)−x_(φ'φ)(S,c), which is invariant by these identities. The cocycle condition for m telescopes on a chosen comma object; restriction differs from y by δ of the cochain ψ↦x_(Gψ)(S,id_GS)−w_(GS')(ψ,id_GS'). These are the signs in A263–275. No use of H³=0. The actual natural-transformation cohomology invariance theorem and small descent localization internals remain imported dependencies, not proved here.

## 6. External assumption ledger delta
| Source | Status / obligation |
|---|---|
| P L31–37, F16–42, A14–16, D22–29 | Proposition/structure definitions, not external postulates or citation evidence. Preserve their full scopes. |
| R20–60,65–99 | Explicit proof bodies, including published proposition producer; smooth/separated/PD-nilpotent/surjective/kernel/pullback premises retained. |
| T152–235, A29–79,138–275 | Explicit conditional comparison and acyclicity arguments; imported CoefMap naturality invariance, SmallDescent and Desc results remain dependencies. |
| L223–354 | Explicit conditional lifting and level-limited coproduct proofs; flatExt, exists_adj, formal smoothness/unramifiedness and nil_ker supply actual obligations. |
| D41–242 | Explicit reduction and inverse construction; compatible PD ideal sums/nil_sup and categorical pullback/quotient results required. |
| PositivityTheory.DualRT.abelianDeRham | Prior RUN21 identified caller uses AbelianDeRham.rigid_of_free_of_crystallineDeRham hF crystallineDeRham; rigid producer not yet located in this run (checked ExistsCrystalPairing and AbelianDeRhamPoincareDualityOfCubeDual, no declaration found). |
| OpenLiteratureStatements | No new direct declaration inspected in this run; no global negative axiom/sorry claim. |
No external citation claim used as proof. No additional premises introduced to native implications. This is local source reading, not authentication of Main reachability, transitive dependency closure or independent Lean replay.

## 7. Reproducible native-source check
Actual execution in JS tool sandbox: 75 literal anchors across seven pinned files; seven GitHub blob receipts exactly matched; 66/70 exact nonblank line membership comparison with latest observed clump (above). No numerical surrogate or synthetic cohomology operator used. Run this Python snippet against a git clone with both source commits available. It checks actual git object hashes and the same anchor groups; failure exits nonzero. The executable below is a local replay recipe; the equivalent source checks were executed through GitHub retrieval and JS, not by running Python or Lean.
```python
import subprocess as sp, sys
repo = sys.argv[1]
pin = "40e56bab026552e089d7afcfeff08d2defb9c005"
head = "27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59"
base = "src/Development/"
B = base + "WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/"
spec = [
(B+"CrystallineDeRham.lean","efc95dd74b086a96d3de1f13d40c04d4d4796931",["theorem exists_lev","⟨N + 1","theorem acyc_NT","exists_lift T.k T.T T.le","exists_coprod T.k","(hun a T.T hT (c a) a₀).exists","refine acyc_of_coprod","hun a (P b) (hl b)","(hun a T.T hT (c a) a₀).unique","exact hψ' (u χ)","theorem red_cover","theorem red_inf","theorem Red.pull1","theorem Red.pull2","h.cG_pull1","h.cG_pull2","Function.Bijective.of_comp_iff' d _","H1.mk_surjective","H2.mk_surjective","theorem crystallineDeRham"]),
(B+"TagIso.lean","8774201f72ff039500e42c2f034b30d82ae7d1f7",["theorem acyc_toSmall","let θ1 : 𝟭 _ ⟶ S1","let θ2 : S2 ⟶ S1","let θ3 : S2 ⟶","theorem tag_pull1","SmallDescent.pull1_bijective","private theorem pull2_restrict_isSmall_bijective_of_cover","apply Desc.pull2_bijective","SmallDescent.exists_isLoc","SmallDescent.exists_cover","theorem tag_pull2"]),
(B+"AcycOfCoprod.lean","6dd3e0d2c9681c3e31b7794c84b4e6e79854a341",["def Acyc","theorem cm_zigzag","theorem acyc_of_zigzag","Z1.id f d","sub_add_cancel","theorem acyc_of_coprod","(φ ≫ i b)","Zigzag.of_inv η","theorem qa1","theorem qa2"]),
(B+"CompF.lean","5ca821664575e0d175f7de49095efbb7ec7bc571",["def InN","def IsChart","Module.Flat R","structure Tag","structure Tag.Hom","theorem Tag.hom_ext","def Tag.forget"]),
(B+"IsNilpotentOfIsNilDP.lean","09934d09743cb9868157e06156c78e7e6fbf5fc8",["theorem fe_lift","theorem fe_uniq","theorem chart_cover","theorem chart_inf","theorem bas_inN","theorem exists_lift_of_coord","theorem exists_lift","theorem lift_ext","theorem exists_coprod","exists_adj S hS d n hn","let zV","apply lift_ext"]),
(B+"IsDPMorphismId.lean","0b205314bb9cd8cdc4b67f0797ac0a949960a647",["structure Red","theorem surjective","def Red.G","def Red.H","def Red.cG","def Red.cH","def Red.η","def Red.ε","theorem Red.cG_pull1","theorem Red.cG_pull2","Function.bijective_iff_has_inverse"]),
(base+"AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsCrystalPairing.lean","53aee5b7a7aaa544c0e22ff51f0a7d449b0a036f",["def CrystallineDeRham : Prop","QuasiCompact s","∀ m : IsMor","Function.Bijective m.pull1 ∧ Function.Bijective m.pull2"])]
def git(*a): return sp.check_output(["git","-C",repo,*a]).decode("utf-8")
count=0
for path,sha,anchors in spec:
    assert git("rev-parse",pin+":"+path).strip()==sha
    s=git("show",pin+":"+path)
    for a in anchors:
        assert a in s,(path,a)
        count+=1
assert count==75
p=spec[0][0]
assert git("rev-parse",head+":"+p).strip()=="16ae3e6fef93fe4c8dc5c4907ec31fc77a81d47c"
l=git("show",pin+":"+p).split("\n")
start=next(i for i,s in enumerate(l) if s.startswith("theorem exists_lev"))
end=next(i for i,s in enumerate(l) if s.startswith("end Fubini"))
selected=[s for s in l[start:end] if s.strip()]
current=set(git("show",head+":"+p).split("\n"))
assert (len(selected),sum(s in current for s in selected))==(70,66)
print({"blobs":len(spec),"anchors":count,"upstream_exact_line_membership":[66,70]})
```
RESULT: DONE local source-matched degree 1/2 reduction comparison, acyclicity assembly and external ledger delta; PARTIAL imported descent, level coproduct construction, root reachability and upstream wrapper migration. Native source anchors executed, not Lean kernel verification. No URT performance claim.
RESUME HERE: expand the actual exists_adj source B/ExistsAdj.lean, especially its level-n PD extension and universal property supplying L313–354, retaining InN, nilpotence and coordinate hypotheses; obtain authenticated cached Main-root role paths for crystallineDeRham and rigid_of_free_of_crystallineDeRham before assigning their coverage to RH. Trace rigid producer through exact imports rather than guessing. HANDOFF TO literature, dependencies, kernel, integration, acceleration, geometry, editor, audit.
