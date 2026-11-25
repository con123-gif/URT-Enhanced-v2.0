# RUN21 — Crystalline connection: tensor splitting, base change and Gauss–Manin
2026-11-25. SOURCE-MATCHED local reconstruction; full RH OPEN. Continues RUN20 (b8d56b09344a4fe972a4bdbf16bae9f0a4895cab). No Cathedral physics changes.

Preflight: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state excerpts, log head, research/continuity protocols, CI summary (45538182382 at b7b2208, unrelated Cathedral PASS), RUN20 full content, RUN14/15 relevant lines. Recent commit listing and handoff excerpts from math, audit, character boxes, kernel, integration, geometry, dependencies and editor; theta/Galois/prime/Landau/structure/acceleration recent commit titles inspected, not all detailed notes recovered. No overlapping task in inspected records. Blueprint not re-read in full; source direct.

## Source ledger
Repository leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. Paths below relative to src/Development/.
- AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean (E), blob 6d297c66f38f4c8ec5e21ec7ffe2fc53a9960a49.
- AbelianVarietyTheory/Definitions/Divisors/IsKSValueOneOfRetraction.lean (K), blob 4cb728f371c0bd82fdbe21c0339552a02519c1a4.
- AbelianVarietyTheory/PublishedTheorems/Divisors₂/CrysToDRBijective.lean (C), blob 9b005affbcf5e67a6578a405aefe484b57ad940b.
- WeilBound/CoreStatements/AutomorphicKernels/DualAbelianScheme/AbelianDeRhamDuality/AbelianDeRhamDuality.lean (D), blob bf38bb3decc713a4cbbabd8fb847247fcdf3df8c.
- WeilBound/CoreStatements/AbelianDeRhamStructure/AbelianDeRhamPages/AbelianDeRhamStructureOfPage.lean (P), blob 3deb4a5569bcfdcf9b8a77e3e053ba4ab232af6f.
- WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/CrystallineDeRham.lean (R), blob efc95dd74b086a96d3de1f13d40c04d4d4796931.
Blob IDs returned by GitHub, not independently recomputed here. Exact reproduction: git show PIN:src/Development/PATH | git hash-object --stdin. Upstream observed fcb6eac7534875d32d68030967e2deae6d686151. Same E path blob b2fb2ea7c10836b0ac385e6f875938eb99fb469b (unchanged from prior run); 36/142 pinned lines 242–383 match an ordered subsequence of the current file, and 27/29 lines 400–428. E no longer contains secMor, inlMor, prMor, inrPull, IsConn, existsUnique_isConn, existsUnique_isConn_of_lift, existsUnique_gaussManin declarations; migration destinations NOT located. Do not infer deletion from the entire corpus or semantic equivalence. Current K blob b41a14a661784adab1974f29e278094a155cb2fd still defines IsBC at L317. Pinned evidence governs.

## 1. Precise hypotheses and maps (E L18,72–74,204–208,242–307; K L29–34,66–73,132–142,262–276)
R commutative, ideal I with divided powers κ, M central R-bimodule as in RUN20 (additive commutative group, R and Rᵐᵒᵖ module actions, IsCentralScalar). T commutative base with Algebra T R, Module T M and IsScalarTower T R M. D:T-relative derivation R→M. Assume hD:IsDPDer κ D, i.e. D(γ_(n+1)(a))=γ_n(a)D(a) for every natural n and a∈I. No freeness/flatness assumed. Set E=R⊕M square-zero extension, J=pr⁻¹I, Γ as in RUN20. The section s(a)=(a,D(a)) is a ring map by Leibniz. It is a PD map: ideal inclusion follows from first coordinate; Γ_n(s(a)) and s(γ_n(a)) have equal first coordinates; second coordinate equality is D(1)=0 at n=0, and hD at n>0. The constant inclusion i(a)=(a,0) and projection pr are PD maps too.

Let S be a scheme, t:S→Spec R, A a group object over S. P=prim κ t A denotes the primitive submodule of crystalline H¹: pullback under product of two points equals the sum of pullbacks (all test objects/points, K L29–34). Q=prim Γ (t∘Spec(pr)) A. A GrpMor is a proposition with four fields: PD compatibility, base triangle, morphism over the base, multiplicativity on all points (K L66–73). E L264–278 secMor, inlMor, prMor use the identity group morphism and the base triangle from pr∘s=id or pr∘i=id. Their induced pullbacks s*,i*:P→Q are semilinear for s,i, and pr*:Q→P is semilinear for pr. The identity relations pr*s*=id and pr*i*=id follow from functorial pullback K L138–142, not from assuming cohomology is free.

L=liftSemi(i*): E⊗_R P→Q, L(x⊗c)=x i*(c). H:(inlMor M κ t A).IsBC means precisely bijectivity of L (K L276), with H.1 injectivity and H.2 surjectivity. This is an extra local premise, not built into the definition of primitive cohomology. Define j=(inrHom).rTensor P:M⊗P→E⊗P, d=(sndHom).rTensor P in the reverse direction, and J=L∘j (inrPull). Since snd∘inr=id, d∘j=id on tensors without flatness. J(m⊗c)=(0,m)i*(c); J additive, J(0)=0; xJ(w)=J(pr(x)w), by tensor induction (E L290–307).

IsConn hD c ω (E L285–286) is s*(c)=i*(c)+J(ω).

## 2. Existence and uniqueness (E L356–383)
For arbitrary z∈E⊗P, decompose its E factor into (a,0)+(0,m). On simple tensors, then finite sums, this yields
    L(z)=i*(pr*L(z))+J(d z).
Reason: pr*L((a,m)⊗c)=a c and d((a,m)⊗c)=m⊗c. This is the source's auxiliary d identity, distinct from the notation d for the tensor component projection.

For c∈P, let y=s*(c)−i*(c). Since pr*y=0, H.2 supplies z with L(z)=y; the displayed decomposition gives y=J(d z). Thus ω=d z exists. For uniqueness cancel i*(c) from two proposed solutions, use H.1 to get j(ω)=j(ω'), then apply the left inverse d. This reproduces the actual proof order (first proves j injective, then uniqueness via H.1, existence via H.2, pr*s*=id and tensor decomposition). No assumption that tensoring preserves arbitrary monomorphisms. No integrability/curvature theorem asserted.

## 3. Connection laws (E L309–354)
Additivity is immediate by adding the two equations defining IsConn. For r∈R, semilinearity gives
s*(rc)=(r,D r)(i*(c)+J(ω))=i*(rc)+J(D r⊗c+rω)
using square-zero multiplication and the scalar rule for J. This supplies IsConn.smul, including the derivation term. With uniqueness, the resulting assignment c↦ω is additive and obeys Leibniz.

For base change R→R' by σ and a GrpMor m from the original data to the primed data (including PD map, scheme arrows b,φ and group multiplication compatibility), require a T'-relative derivation D' and hD' for κ', plus σ-semilinear u:M→M' with D'σ=uD pointwise. RUN20 supplies extMap σ u:E→E' as PD morphism. The same geometric arrows b,φ induce k on extensions (E L322–325). Three actual source identities are k i*=i'*m*, k s*=s'*m*, and k J=J' (u⊗m*). First two follow by composition equality of ring maps and geometric maps using K.pull_pull; third by simple tensors and additivity. Applying k to IsConn gives the primed IsConn for m*c and TensorProduct.map u m* ω. No base-change bijectivity needed for this implication; it is needed if identifying a unique primed connection. Keep the compatibility e, PD morphism and semilinearity.

For a GrpMor from a group B over base T with PD ideal J₀ and δ to A over R via algebraMap T R (E L344–349), s and i agree on images of T since D is a T-derivation. Hence s*m*c=i*m*c and ω=0 is a solution. Multiplying by r yields ω=D r⊗m*c by the preceding Leibniz law. This is a conditional pullback statement, not a theorem that every c is constant.

## 4. Supply IsBC by a genuine lift (E L395–441; C L40–67)
Assume H:Published.AbelianDeRham (five conjuncts), hA:IsAbelianScheme A over Spec R and hg:SmoothOfRelativeDimension g A.hom. Let π:R→R₀ surjective, ker π=I, κ weighted-nilpotent (RUN20), A₀ group pullback of A along Spec π with arrow i. Given R-algebra R', a second surjective π':R'→R₀' with ker π'=I', nil DP κ', GrpMor m from A₀ data to A₀' data along algebraMap R R' with geometric arrows b,φ, require hφ:IsGrpPullback A₀' A₀ b φ. These are all explicit premises of isBC_of_lift, not consequences of any arbitrary GrpMor.

Form A' as group pullback of A along Spec(R→R') (FlagTan.exists_isGrpPullback). The composite pullback hφ.comp h, base triangle m.base, and universal property give i':A₀'→A' with i'ψ=φi (diagrammatic notation); cancel the pullback hψ to obtain h':A₀' is pullback along Spec π'. A' inherits abelian scheme and relative smooth dimension g. Define U=primDR A, U'=primDR A', V=prim κ A₀, V'=prim κ' A₀'. Four maps in the source commutative square:
    b0: U→V, liftMor κ h.pull (bijective by H.Rigid);
    b1: U'→V', liftMor κ' h'.pull (bijective by H.Rigid);
    b2: R'⊗U→U', liftSemi(bcMor hψ.pull) (bijective by H.BaseChange.1);
    mbar: R'⊗V→V', liftSemi m.pull (wanted bijective).
The fourth known bijection b3=R'⊗b0 follows by tensoring the linear *equivalence* associated to b0, not by assuming R' flat. On x⊗c, pullback composition with equality i'ψ=φi proves mbar b3=b1 b2; additivity extends to all tensors. As RHS and b3 are bijective, mbar is bijective. This supplies H.1 and H.2 of section 2 simultaneously.

The source's H.2.2.2.1 is the Rigid predicate, H.2.2.1 is BaseChange; .1 of its result is IsBC, not the primitive span equality. C L40–54 gives their exact quantifiers. Free/Hodge/Duality are retained in the declared H although this proof uses only the two projections. In existsUnique_isConn_of_lift choose R'=E, π'=π∘pr, A₀'=A₀ and b,φ identity. π' surjective since pr has section i, kernel is pr⁻¹I, κ' weighted nilpotent by RUN20, identity is group pullback. Base structure map equality follows from contravariance of Spec. Thus apply isBC_of_lift to inlMor and then section 2. In existsUnique_gaussManin (E L443–451) take π=id_R, I=0, κ=dp0, A₀=A with reflexive group pullback and Spec(id)=id. Zero DP ideal nilpotent, D is PD-compatible (E L210–211); conclude ∃! ω for every c∈primDR A. This is a Gauss–Manin connection along the specified derivation, not a statement about curvature or the entire RH theorem.

## 5. External assumption ledger delta
| Source | Classification and retained obligation |
|---|---|
| E L207–208,280–286; K L276 | definitions IsDPDer, inrPull, IsConn, IsBC, not theorem proof or axiom |
| E L242–278,290–354,356–383 | explicit conditional proof bodies; hD, geometric group/morphism assumptions and H:IsBC retained where used |
| E L400–451 | explicit conditional theorem bodies, not postulate wrappers; H:AbelianDeRham remains a supplied proposition |
| C L40–67 | BaseChange, Rigid, and five-conjunct AbelianDeRham are predicates, not independent proof terms |
| D L20–23 | actual global theorem body PositivityTheory.DualRT.abelianDeRham, constructs all five fields; BaseChange from hS.2.2, Rigid from rigid_of_free_of_crystallineDeRham hF and FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham |
| P L8–10 | explicit conditional wrapper abelianDeRhamStructure_of_page, uses SmoothLift.crystallineSmoothLift_of_relations and abelianHodgeDeRham_of_page P; P supplied by D from MainStatements.Hodge.Free.abelianDeRhamPage |
| R L98ff | actual source theorem crystallineDeRham, with native Red.pull1/2 at L74–95; deeper tag acyclicity not reconstructed here |
| K L90–142,262–276, imported category/ring/tensor theorems, FlagTan.exists_isGrpPullback, PolPull.isAbelianScheme_of_isGrpPullback | visible source references/imported results; no independent kernel audit of transitive assumptions |
No citation claim or explicit axiom declaration encountered in the inspected target bodies. This does not prove absence of axioms/sorry in their dependencies. RUN15 has authenticated export evidence for the separate literature adapter to global AbelianDeRham; this run has no authenticated Main-root path to the connection declarations and no proof that all local leaves are required by RH. No new mathematical premise introduced.

## 6. Reproducible regression
Executed in JS sandbox: 25 literal source anchors in E, LCS counts above. Finite algebra model (not actual crystalline group realization): R=F_p[t]/t², p=2,3, ideal (t) with γ_n=0 for n≥2, M=P=R, D=t∂/∂t, L canonical split, α_A(c)=(c,D(c)+Ac) for all A∈R. Enumerate all c and all candidate ω; verify DP section and Leibniz, additive law, eval at t=0 compatibility (noninjective ring map, D'=0), constant special case A=0. Two abstract diagram negative controls: injectivity absent → nonunique, surjectivity absent → no solution. The latter uses a larger module with R-action via first coordinate on extra component; these controls show why the abstract splitting proof cannot drop its assumptions, not geometric counterexamples. Output p=2 counts derivation16, PD section10, existence/uniqueness16, addition64, Leibniz64, pull16, constant2; p=3 counts 81,15,81,729,729,81,3 respectively; 1907 positive assertions, 2 controls. No native Lean execution.

Extract and run this JS block with Node:
```js
const certificate=()=>{
 const check=(b,m)=>{if(!b)throw Error(m)};
 const models=[];
 for(const p of [2,3]){
  const n=p*p,range=Array.from({length:n},(_,i)=>i),f=x=>x%p,t=x=>Math.floor(x/p),enc=(a,b)=>(a%p)+p*(b%p),add=(a,b)=>enc(f(a)+f(b),t(a)+t(b)),mul=(a,b)=>enc(f(a)*f(b),f(a)*t(b)+t(a)*f(b)),D=a=>enc(0,t(a));
  const counts={derivation:0,pdSection:0,existenceUniqueness:0,addition:0,leibniz:0,pull:0,constant:0};
  const eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
  const addE=(a,b)=>[add(a[0],b[0]),add(a[1],b[1])];
  const gamma=(k,a)=>f(a)!==0?0:k===0?1:k===1?a:0;
  const sec=a=>[a,D(a)];
  const gammaE=(k,a)=>[gamma(k,a[0]),k===0?0:mul(gamma(k-1,a[0]),a[1])];
  for(const a of range)for(const b of range){
    check(D(mul(a,b))===add(mul(a,D(b)),mul(b,D(a))),"derivation");counts.derivation++;
  }
  for(const a of range.filter(a=>f(a)===0))for(let k=0;k<=4;k++){
    check(eq(sec(gamma(k,a)),gammaE(k,sec(a))),"PD section");counts.pdSection++;
  }
  for(const A of range){
    const w=c=>add(D(c),mul(A,c)),s=c=>[c,w(c)],i=c=>[c,0],j=x=>[0,x];
    for(const c of range){
      let solutions=range.filter(x=>eq(s(c),addE(i(c),j(x))));
      check(solutions.length===1&&solutions[0]===w(c),"exist unique");counts.existenceUniqueness++;
      check(f(w(c))===f(A)*f(c)%p,"base change eval");counts.pull++;
      if(A===0&&t(c)===0){check(w(c)===0,"constant");counts.constant++}
      for(const r of range){
        check(w(add(c,r))===add(w(c),w(r)),"add");counts.addition++;
        check(w(mul(r,c))===add(mul(D(r),c),mul(r,w(c))),"Leibniz");counts.leibniz++;
      }
    }
  }
  models.push({p,ringSize:n,counts});
 }
 const candidates=[0,1];
 check(candidates.filter(w=>0===(0*w)).length===2,"noninjective control");
 check(candidates.filter(w=>[1,w,0].join()===[1,0,1].join()).length===0,"nonsurjective control");
 return {models,negativeControls:2};
};console.log(JSON.stringify(certificate()));
```
Source anchors executed: theorem IsDPDer.isDPMorphism; theorem secMor; theorem inlMor; theorem prMor; def inrPull; def IsConn; theorem smul_inrPull; theorem IsConn.add; theorem IsConn.smul; theorem IsConn.pull; theorem isConn_const; theorem isConn_smul_const; theorem existsUnique_isConn ; Function.LeftInverse.injective; H.1 (add_left_cancel; H.2 ((secMor; inl_fst_add_inr_snd_eq; theorem isBC_of_lift; H.2.2.2.1 R A; H.2.2.2.1 R' A'; H.2.2.1 R A; Function.Bijective.of_comp_iff; theorem existsUnique_isConn_of_lift; theorem existsUnique_gaussManin; isDPNilpotent_extend M hκ. Check against git show PIN:src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean. LCS is lexical comparison, not proof equivalence.

RESULT: DONE local source-matched existence/uniqueness, laws and conditional geometric base-change assembly; PARTIAL transitive assumption and upstream migration audit.
RESUME HERE: reconstruct R L74–95 Red.pull1 and Red.pull2 from their actual tag restriction and acyc_NT suppliers, retaining nilpotence, smoothness, separatedness and pullback inputs, then trace rigid_of_free_of_crystallineDeRham exact source. Request authenticated Main-root role-labelled paths for CrysConn.existsUnique_isConn_of_lift, existsUnique_gaussManin, isBC_of_lift before attributing them to RH's reachable core. HANDOFF TO literature, dependencies, kernel, integration, editor, geometry, audit. RH OPEN; no independent Lean replay or URT performance claim.
