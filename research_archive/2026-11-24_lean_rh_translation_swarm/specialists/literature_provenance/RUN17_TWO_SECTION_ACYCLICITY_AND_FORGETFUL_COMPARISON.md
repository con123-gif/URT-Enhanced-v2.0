# RUN17 — two-section acyclicity and forgetful comparison in degrees 1 and 2
2026-11-24. SOURCE-MATCHED / PARTIAL. Project OPEN. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; main 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged since RUN16. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, state/log/protocol excerpts, continuity, physics-only CI #402 (23:30:34Z), RUN16, 25 recent commits, 14 peer commit patches and accessible RESUME HERE notes (including character, Galois, theta, prime, math, kernel, geometry, acceleration, audit, integration). No duplicate identified in these records; external blueprint not reopened and some peer full notes not read. No physical Queue/gate edits.

## 1. Exact local result and notation
In Definitions/Divisors/PullbackBijectiveDegreesOneTwo.lean, Coef C is covariant additive coefficients on an arbitrary category C (native universe Type 1, Category.{0} for the following theorem). Define δg(φ)=g(T')−M(φ)g(T), δf(φ,ψ)=M(ψ)f(φ)−f(ψ∘φ)+f(ψ). Ac0 asserts every compatible object family is zero; Ac1 asserts every closed arrow cochain is δg; Ac2 asserts every closed composable-pair cochain is δf. Degree-two closure is M(χ)z(φ,ψ)+z(ψ∘φ,χ)−z(φ,χ∘ψ)−z(ψ,χ)=0 for ALL composable triples. These are predicates, not assumptions that hold for all coefficients.

Theorem GlobalTheory.coef_acyclic_of_two_sections (CoefficientsAcyclicOfTwoSectionsRetraction.lean L10–74): given endofunctor S, natural transformations u,v:Id→S, additive r_T:M(ST)→M(T), natural for EVERY arrow φ and input x, with r_T M(u_T)=0 and r_T M(v_T)=id for EVERY object, then Ac0, Ac1, Ac2 all hold. There is no assumption that u or v is invertible or that M is a vector space.

## 2. Human-readable contraction
For a compatible g, g(ST)=M(u_T)g(T)=M(v_T)g(T). Apply r_T to show 0=g(T) at every object.

For an arrow cocycle f, set Aθ(T)=r_T f(θ_T). Naturality θ_{T'}∘φ=Sφ∘θ_T and the cocycle equation on these two factorizations give
    r_{T'} M(θ_{T'}) f(φ)+Aθ(T')=M(φ)Aθ(T)+r_{T'}f(Sφ).
Subtract the u equation from the v equation: the last term cancels and the first term becomes f(φ). Therefore δ(Au−Av)=f. This is the exact source primitive; reversing its sign is not valid over general additive groups.

For a pair cocycle z let Bθ(φ)=z(φ,θ_{T'})−z(θ_T,Sφ), in M(ST'), and bθ(φ)=r_{T'}Bθ(φ). Use three cocycle equations, on (φ,ψ,θ_{T''}), (φ,θ_{T'},Sψ), (θ_T,Sφ,Sψ). Calling the left sides of the degree-two closure formula h1,h2,h3, the combination h2−h3−h1 gives
    M(Sψ)Bθ(φ)=M(θ_{T''})z(φ,ψ)+Bθ(ψ∘φ)−Bθ(ψ)−z(Sφ,Sψ).
Apply r, use its naturality, and move the two B terms: δ bθ = r M(θ) z−r z(Sφ,Sψ). Thus δ(bv−bu)=z. The native code uses the opposite order in its last linear_combination because it writes the target equality with z first. The primitive is bv−bu, not bu−bv. This proves precisely the three low-degree acyclicity predicates, not arbitrary higher cohomological vanishing.

## 3. Forgetting forms: both cohomological degrees
For K:Cx C use M0,...,M3 and natural vertical additive differentials d0,d1,d2 with d1 d0=d2 d1=0. Projection to M0 is fnMap. Source D0 g=(δg,d0g); D1(f,ω)=(δf,δω−d0f,d1ω). Degree-one closed pair (a,w) satisfies δa=0, δw=d0a, d1w=0. Degree-two closed triple (a,β,γ) satisfies δa=0, δβ=−d0a, δγ=d1β, d2γ=0. All cochains quantified over the actual object/arrow/chain families; equalities are pointwise. H1 and H2 are cocycles modulo the corresponding images.

H1 injectivity (ForgetPositiveH1Bijective.lean L7–42): if projected class zero, a=δg. Then δ(w−d0g)=0. Ac0(M1) kills that difference, hence (a,w)=D0g.
H1 surjectivity (L43–67): given any closed M0 arrow a, δ(d0a)=0. Ac1(M1) supplies w with δw=d0a. Then δ(d1w)=d1d0a=0, so Ac0(M2) gives d1w=0. The pair (a,w) is closed and projects exactly to a.

H2 injectivity (ForgetPositiveH2Bijective.lean L8–51): if projected class zero, a=δf. Then δ(β+d0f)=−d0a+d0δf=0. Ac1(M1) gives ω with δω=β+d0f. Consequently δ(γ−d1ω)=d1β−d1(β+d0f)=0; Ac0(M2) gives γ=d1ω. The triple equals D1(f,ω).
H2 surjectivity (L52–82): given any closed M0 pair a, δ(d0a)=0. Ac2(M1) supplies f with δf=d0a. Take β=−f (the minus sign is essential). Then δ(d1β)=−d1d0a=0, so Ac1(M2) supplies γ with δγ=d1β. Finally δ(d2γ)=d2d1β=0; Ac0(M3) gives d2γ=0. The resulting triple is closed and projects to a. No cochain-level isomorphism is asserted.

Exact acyclicity demand ledger (each entry Mj:Aci): H1 injectivity 1:0; H1 surjectivity 1:1,2:0; H2 injectivity 1:1,2:0; H2 surjectivity 1:2,2:1,3:0. The native assembly fnMap_pullbackBijective12_of_acyclic accepts all nine predicates for M1,M2,M3, uses these six distinct ones and does not silently remove unused conjuncts. M3:0 is indispensable to this argument; do not truncate the vertical complex at degree two.

## 4. Site AND affine-pair restriction
CrystallineForgetFormsBijectiveSiteAndPairs.lean L16–62: for every commutative R, ideal I, divided powers κ on I, scheme X, t:X→Spec R, scheme Y, i:X→Y, K=KK κ t and its restriction along pE κ t i have bijective fnMap in degrees 1,2. The local contraction is applied to M1,M2,M3 separately, on both categories.

The pair category EE has objects consisting of a thickening T and an affine open U of Y with the indicated point image contained in U (and subtype property). liftE keeps U and replaces T by ST; containment follows by top_le_preimage_of_hom from the original point map and the equality of point maps f.pt for f=u_T. On arrows it uses S on the thickening arrow and the same inclusion of opens. Functor identity/composition follow from S and ObjectProperty.hom_ext. liftT supplies the transformations on EE for u and v with inclusion le_rfl; naturality follows from that of u,v. The r on a pair a is r_{a.obj.T}; naturality/zero/identity reduce to the three original identities on the underlying thickening. Thus no new independent acyclicity assumption on the pair category. The exact native geometric definition of EE and divided-power first-neighbourhood construction remain dependencies, not replaced by an arbitrary category.

## 5. External assumption ledger delta
Five wrapper files inspected, each contains an explicit theorem by first/exact of the following body, not an independent axiom:
- T.coefficients_acyclic_of_two_sections_retraction → GlobalTheory.coef_acyclic_of_two_sections (fully translated above).
- T.forget_positive_h1_bijective → GlobalTheory.CxCoh.Cx.fnMap_h1_bijective (both directions above).
- T.forget_positive_h2_bijective → GlobalTheory.CxCoh.fnMap_h2_bijective (both directions above).
- T.fnMap_pullbackBijective12_kk_and_res → PDForm.crystalline_forget_forms_bijective_site_and_pairs (assembly above).
- T.exists_diagonal_firstNeighbourhood_retraction_forms → PDForm.Nbhd.exists_retraction, native theorem L23ff. Its body selects ρ from T.exists_formsMap_of_dividedPowerDerivation; uses rel ideal closure from T.divPowerCompatRel_filtration_twoSided_rel_eq_bot_of_base. It proves naturality using natAgree, mDR_mem_rel and rK_spec; zero for positive degree j via uAgree and algebraMapInv_eq_zero (requires j≠0), identity via vAgree; degree one uses the separate one-form quotient r1 and divPowerCompatOneForm_retraction_spec. These geometric suppliers are OPEN; the theorem is not a free axiom merely because its name is in a statement wrapper, nor does the wrapper establish the transitive trust boundary. All actual arguments R,I,κ,X,t retained.
- Coef, Cx, Ac0–2, H1,H2 and fnMap: structures/definitions, not proof of existence or vanishing. Their naturality and square-zero identities are input fields.
- QuotientAddGroup.mk_surjective, eq_zero_iff, AddMonoidHom.mem_range, injective_iff_map_eq_zero, Category.assoc, etc.: imported theorem uses at source level. No independent transitive Mathlib axiom audit.
- No new external citation claim verified; no new mathematical premises introduced. RUN16 restriction bijectivity, compatible-cochain correspondence, RUN15 Hodge and all earlier leaves remain open. No authenticated elaborated path to Main claimed.

## 6. Exact pinned provenance
All below under src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ except last:
- CrystallineForgetFormsBijectiveSiteAndPairs.lean 88ef6478cd3a53e2a78aa7efb8b019027f591878
- CrystallineForgetFormsBijectiveSiteAndPairsStatement.lean 2b1f07a5f7d45b46f6e65fc4949784c6dec78011
- CoefficientsAcyclicOfTwoSectionsRetraction.lean 3e9bdfb435218f48313e730dc3c1c43ac0eb8b9c
- CoefficientsAcyclicOfTwoSectionsRetractionStatement.lean fb9e92c9f72e6d612a32f771398303c4e9b00f33
- ForgetPositiveH1Bijective.lean 1a70d6f540c5a9479dcb547f5b9b8b00bfa42623
- ForgetPositiveH1BijectiveStatement.lean 8df643949cfd722898b084fa50233d6228af9025
- ForgetPositiveH2Bijective.lean 833e0c3da53d5f79d6bf0f9ae3e21d6be0f72bdf
- ForgetPositiveH2BijectiveStatement.lean aed373f2ba44f7bc8db0d2309fdc7944e8877496
- ExistsDiagonalFirstNeighbourhoodRetractionForms.lean 5f80de635aa0cf3a9c265f114a81124330e6948a
- ExistsDiagonalFirstNeighbourhoodRetractionFormsStatement.lean c8da2339c03418bb76c15d9a43f4c90668d3d5fd
- src/Development/AbelianVarietyTheory/Definitions/Divisors/PullbackBijectiveDegreesOneTwo.lean 1ad00c67e68aba7ab16ea4b99c355edb4f30944e

These are GitHub connector-returned blob identities, not independently locally recomputed. Reproduce with git show PIN:PATH | git hash-object --stdin. Definitions file inspected for the Coef/Cx/D0/D1/Z2 and quotient declarations; not the entire file. Full diagonal supplier body not completely inspected, only the initial portion and exact wrapper.

Head CrystallineForgetFormsBijectiveSiteAndPairs.lean blob 6afe75f2b096d3fcd586970fe9dc6dac8a5dad97 now consolidates the earlier four separate body files (which returned 404 on head). Declaration anchors at L66 coef_acyclic_of_two_sections, L541 exists_retraction, L634 fnMap_h1_bijective, L709 fnMap_h2_bijective, L802 fnMap_pullbackBijective12_of_acyclic, L838 crystalline_forget_forms_bijective_site_and_pairs. Actual JS comparison: LCS of pinned L10–74 vs head L66–127 is 60/65 old lines (three redundant tactic alternatives removed, two map_add annotations changed); H1 L7–67 vs L634–694 60/61; H2 L8–82 vs L709–783 70/75 exact aligned lines; assembly L16–63 vs L802–849 42/48 exact aligned lines. Not full semantic equivalence or kernel validation; wrapper calls changed to direct body calls and @[simps] annotation removed.

## 7. Executed finite cochain regression
This is a deliberately small algebra model, not crystalline geometry, Lean kernel replay or URT. One-object categories with monoid {0} union cyclic group of order n−1; 0 absorbing, 1 identity, S=Id, u=0, v=1, r=id, M(0)=0 and all other arrows act identically on F_p. Enumerate all arrow and pair cochains and verify the EXACT source primitives on every closed cochain. Executed in V8: (p,n,scanned1,scanned2,Ac0 closed,Ac1 closed,Ac2 closed,pointwise checks) = (2,2,4,16,1,2,2,12), (3,2,9,81,1,3,3,18), (5,2,25,625,1,5,5,30), (2,3,8,512,1,2,4,42), (3,3,27,19683,1,3,9,90). Totals 73 arrow cochains, 20917 pair cochains, 192 pointwise primitive checks and 5 invariant-family checks. No counterexample among those tested. Dropping separation gives the mathematical negative example M(0)=id, u=v=id and nonzero invariant coefficient, but no independent automated negative-control test is counted. Replay in Node JS:
```js
const assert=(x,m)=>{if(!x)throw Error(m)};
function test(p,n){
 const mod=x=>((x%p)+p)%p, mul=(a,b)=>a===0||b===0?0:1+(a+b-2)%(n-1), act=(a,x)=>a===0?0:x;
 const ids=Array.from({length:n},(_,i)=>i), pairs=ids.flatMap(a=>ids.map(b=>[a,b])), triples=pairs.flatMap(([a,b])=>ids.map(c=>[a,b,c]));
 const vectors=function*(len){for(let i=0;i<p**len;i++){let x=i;yield Array.from({length:len},()=>{let t=x%p;x=Math.floor(x/p);return t})}};
 const D0=(g,a)=>mod(g-act(a,g)), D1=(f,a,b)=>mod(act(b,f[a])-f[mul(a,b)]+f[b]);
 const zval=(z,a,b)=>z[a*n+b], D2=(z,a,b,c)=>mod(act(c,zval(z,a,b))+zval(z,mul(a,b),c)-zval(z,a,mul(b,c))-zval(z,b,c));
 let ac0=0,ac1=0,ac2=0,checks=0;
 for(const [g] of vectors(1))if(ids.every(a=>D0(g,a)===0)){assert(g===0,"Ac0");ac0++}
 for(const f of vectors(n))if(pairs.every(([a,b])=>D1(f,a,b)===0)){const g=mod(f[0]-f[1]);for(const a of ids){assert(D0(g,a)===f[a],"Ac1");checks++}ac1++}
 for(const z of vectors(n*n))if(triples.every(([a,b,c])=>D2(z,a,b,c)===0)){const A=(t,a)=>mod(zval(z,a,t)-zval(z,t,a));const f=ids.map(a=>mod(A(1,a)-A(0,a)));for(const [a,b] of pairs){assert(D1(f,a,b)===zval(z,a,b),"Ac2");checks++}ac2++}
 return {p,n,scanned1:p**n,scanned2:p**(n*n),ac0,ac1,ac2,checks};
}
console.log([test(2,2),test(3,2),test(5,2),test(2,3),test(3,3)]);
```

RESULT: local acyclicity contraction, four injectivity/surjectivity implications and site/pair assembly reconstructed, five wrappers traced, eleven pinned blob identities recorded. Not full RH translation, kernel validation, transitive axiom audit, or URT acceleration.
RESUME HERE: reconstruct PDForm.Nbhd.exists_retraction in full, especially exact definitions nbF,uN,vN,rK,r1 and quotient independence of chosen ρ, then actual exists_formsMap_of_dividedPowerDerivation supplier. Preserve degree-one special treatment, all naturality and positive-degree hypotheses and remaining RUN15/16 obligations. Request authenticated role-labelled root paths for coef_acyclic_of_two_sections, fnMap_h1_bijective, fnMap_h2_bijective, crystalline_forget_forms_bijective_site_and_pairs, Nbhd.exists_retraction, and previous crystalline/Hodge frontier. HANDOFF TO dependency, kernel, editor, integration, audit, geometry, acceleration. Project OPEN.
