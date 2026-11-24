# RUN7 — Crystalline-to-de Rham reduction: quotient and commuting comparison

2026-11-24. SOURCE-MATCHED conditional human argument, plus finite regression; not independent Lean replay. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream main 6866a9c6260d77b88a7b5477433e3044b6844f9b, changed since RUN6. Preflight: read coordination, AGENTS, continuity, research state/log/protocol and peer handoffs. Physical CI 13:29 PASS unrelated to RH. No physical queue changes. This follows RUN6 RhoBC frontier, not another derivation of ad3 or group-law lifting.

## 1. Exact theorem and proof obligations

All paths below relative to src/Development/AbelianVarietyTheory/. Let R,R0 be commutative rings, π:R→R0 surjective with kernel I and I²=0. Let A' be a g-dimensional abelian scheme over R, A0 its marked group pullback over R0, marking i'. Both group-object structures and the pullback condition are explicit. H1=CrystallineSmoothLift, H2=AbelianHodgeDeRham are explicit proposition-valued hypotheses, not asserted here as independent axioms or automatically proven literature. Definitions/Divisors/SurjectiveOfIsPullbackSqZero L43,169–178,200–201 defines Crys=Cr(hI,π,A0.hom), and rho:Crys→DR1(A0) as the pullback induced by the divided-power reduction map. The reduction morphism kills the ideal and its positive divided powers (L172–174). RhoBC says rho is onto and rho(c)=0 iff c∈I Crys.

Proofs/DivisorProofs/AbelianSchemeCrystalReducesToDeRhamSqZero L42–80 proves this with H1,H2. Statement wrapper L11–12 applies the body. No claim of transitive root reachability follows from this local source inspection.

## 2. The elementary quotient argument (stronger than a free-module calculation)

For ANY R-module M, not necessarily finite, flat or projective, define t:M→R0⊗_R M, m↦1⊗m. Since R0≅R/I, tensor quotient gives R0⊗_R M≅M/IM, taking 1⊗m to [m]. Thus t is onto and its kernel is IM. Source L18–33 explicitly composes quotientKerAlgEquivOfSurjective, TensorProduct.congr and quotTensorEquivQuotSMul; it uses quotient surjectivity and equivalence injectivity. No square-zero condition in this helper. A direct human construction: (r mod I)⊗m↦[rm] is well-defined and balanced, and the inverse sends [m] to 1⊗m. The two composites are identity on generators. The surjectivity of π is essential; π:Z→Q, M=Z is a counterexample if dropped. The second helper L35–40 says an R-linear isomorphism E sends IM exactly to I E(M), by image of the ideal product and surjectivity. It requires neither finite generation nor projectivity.

## 3. The actual commuting comparison

Set D=FirstDeRham(A'), D0=FirstDeRham(A0), H=HH1(A'), H0=HH1(A0), K=Cr(hI,π,A0.hom). The source constructs:
- L:D≃_R K from hm.pull1 and H1.toCrystallineDeRham (L54,57–59,68).
- C:D≃_R H from cmp1 A' and H1 (L62,69).
- B:D0≃_R0 H0 from cmp1 A0 and H1 (L51–52,63). Smooth/proper descend along the pullback; separated and quasi-compact are obtained as instances.
- e:R0⊗_R H≃_R0 H0 from the HH1 base-change clause of H2 (L64). In H2 this is accompanied by IsPull1, not merely an arbitrary isomorphism.
- hn:D→D0 is the semilinear pullback along i' with zero divided-power ideal on R0 (L56). Functoriality identifies rho L=hn (L60–61). The equality B hn(d)=e(1⊗C(d)) is obtained by comparison_pullback and the H2 IsPull1 witness, then reflected by injectivity of pullHyp1(pairRes i' A0.hom) (L65–66). This is a necessary compatibility, not just the existence of four isomorphisms.

Hence the entire proof is the factorization
  rho = B^{-1} ∘ e ∘ t ∘ C ∘ L^{-1}.
All identifications have their indicated linearity; t and rho are π-semilinear. The formula is a faithful mathematical reading of L60–80, not a new assumption. Surjectivity: for y∈D0 choose t0=e^{-1}B(y), then m∈H with 1⊗m=t0, then d=C^{-1}(m); rho(Ld)=y by injectivity of B. Kernel: rho(Ld)=0 iff t(Cd)=0 iff Cd∈IH iff d∈ID iff Ld∈IK. The source uses mem_smul_top_of_equiv for both C and L and injectivity of B and e. Finiteness/projectivity are genuine clauses of H2 and needed elsewhere (RUN6 dual summands) but are not needed for this particular quotient argument. Do not weaken the full geometric theorem by deleting H1 or H2 merely because its terminal algebra works for arbitrary modules.

## 4. Provenance of the comparison and restriction suppliers

PublishedTheorems/Divisors₂/BijectiveCechDeRhamComparisonDegreeOne L130–136 defines CrystallineSmoothLift as existence, for every smooth separated quasi-compact divided-power lifting datum D with actual reduction pullback, of degree-one and degree-two linear equivalences compatible with cup products, degree-one de Rham pullback, and morphism naturality in both degrees. Data.ofQuot L42–67 transports along R/ker π≃R0 using an isomorphism of spectra. L138–143 is a theorem conditional on H1: choose the self datum with zero ideal and identity map; the comparison equals e1 because pullback by the identity is identity. L145–158 derives CrystallineDeRham from H1: e1∘m.pull1=cmp1, hence m.pull1 is bijective, and the degree-two analogue follows from morphism naturality plus pairRes2_id_injective. The latter has an explicit left inverse from the diagonal restriction (L108–122). These theorems are proof bodies, while H1 itself is a proposition definition. Its global producer remains to be separately traced; no citation or name establishes it.

PublishedTheorems/Divisors₂/AbelianHodgeDeRham L15–29 is a proposition definition, with finite projective HH1 of stalkwise rank 2g, exterior-square/cup comparison, finite projective global forms and HO1 of rank g, closedness/injectivity/surjectivity, and compatible base change for each of the three modules. Only the HH1 base-change equivalence and IsPull1 compatibility are extracted at this local step; H2 as a whole remains a premise. Proofs/DivisorProofs/AbelianHodgeDeRhamOfCrystallineLift L77–92 is a consumer of H1,H2, not a proof of H2 itself (different proposition AbelianDeRham.Hodge). Do not mistake these similar names for a supplier.

Proofs/DivisorProofs/AffinePairRestrictionInjectiveFirstCohomology L46–86 gives three injectivity statements: structure cohomology, global forms, and total hypercohomology H1. The last is the exact component used in rhoBC. Given a total degree-one cocycle (f,ω) whose restriction is a coboundary g on affine pairs, first use its function component f(p,q)=g(q)-res(g(p)). The earlier lemma exists_cob_of_pair (L17–39) glues, for each affine W, the functions g(p)-f(W,p); compatibility follows from the 1-cocycle relation and the given coboundary equation. The resulting G on all affines satisfies d0G=f, as equality can be tested on pairs. The differential component satisfies d g(p)=ω(p). Therefore restriction of dG-ω to each pair is zero, using d commuting with restriction and the connection relation for the total cocycle (L76–86). The one-form vanishing lemma implies dG=ω on W; thus the total cocycle is globally a coboundary. Retain the imported functions gluing, section equality, one-form vanishing, comparison_pullback and cohomological functoriality lemmas as child obligations. No full proof of them is claimed by this reconstruction.

## 5. Ledger integration

Proofs/DivisorProofs/AbelianSchemeSquareZeroLiftsOfHodgeDeRham L32–43 supplies hG:Good and hR:RhoBC separately under hC,hH; uses hR in direct-summand, filtration-sup, realization and hom existence steps (L42–43,55–56,66). It is not permissible to replace Good with RhoBC or deduce system realization solely from the quotient. AbelianLiftReductionStandardFacts L19–44 independently transports finite generation/projectivity from the de Rham free predicate. RUN6 retains this separate branch for projective duality. This run resolves the conditional algebraic RhoBC step, not those geometric suppliers.

Current head comparison: original body file consolidated into Proofs/DivisorProofs/AbelianSchemeCrystalReducesToDeRhamSqZeroStatement.lean, blob 9f232bd010b669695ce78cfd8bd6d400a0eae2d4. Every line 18–80 of the pinned body equals line 65–127 of this clump literally (63/63). Current wrapper L143–144 uses direct exact GlobalTheory.LiftSys.rhoBC_of_abelianLift rather than the pinned first/exact alternatives. This is textual migration evidence only, not kernel equivalence.

## 6. Actual checks and reproducibility

Executed in connector JS environment: refetched eight pinned files, all eight observed blob IDs matched and all 98 line anchors matched; current body comparison 63/63. Two other pinned files (Hodge consumer and wrapper) and current comparison supplier were also read but not counted in eight. Finite JS regression used modules Z/4², Z/4⊕Z/2, Z/2² over Z/4 with I=(2), quotient F2, and nontrivial linear shears; 12 target witnesses, 28 kernel checks, 28 commuting-square checks, 112 scalar-compatibility checks, 336 fibre-equivalence checks, 516 positive assertions total, plus two elementary negative controls. Two of the three modules are nonprojective. This illustrates the quotient argument, not the geometric comparison or an independent Lean proof. No URT advantage claimed.

Reproduce source checks from the pinned upstream git checkout with Python:
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="6866a9c6260d77b88a7b5477433e3044b6844f9b"
base="src/Development/AbelianVarietyTheory/"
P="Proofs/DivisorProofs/"
D="Definitions/Divisors/"
T="PublishedTheorems/Divisors₂/"
rows=[
(P+"AbelianSchemeCrystalReducesToDeRhamSqZero.lean","074249a3977640bbaa001c337289975be7889a8c",[(18,"oneTmul_surjective_ker"),(19,"(hπ : Function.Surjective π)"),(22,"I •"),(25,"quotientKerAlgEquivOfSurjective"),(27,"quotTensorEquivQuotSMul"),(28,"Submodule.Quotient.mk"),(31,"mk_surjective"),(33,"map_eq_zero_iff"),(35,"mem_smul_top_of_equiv"),(39,"map_smul"),(42,"rhoBC_of_abelianLift"),(43,"I ^ 2 = 0"),(45,"IsGrpPullback"),(46,"RhoBC"),(51,"Smooth A₀.hom"),(52,"IsProper A₀.hom"),(54,"IsMor (dp0 R)"),(56,"(dp0 R₀)"),(57,"Function.Bijective hm.pull1"),(58,"H1.toCrystallineDeRham"),(60,"rho hI hk"),(61,"pullback1_comp"),(62,"H1.bijective_cechDeRhamComparison_degreeOne"),(63,"H1.bijective_cechDeRhamComparison_degreeOne"),(64,"(H2 R A'"),(65,"cmp1 A₀.hom"),(66,"pairRes_injective"),(67,"oneTmul_surjective_ker"),(68,"LinearEquiv.ofBijective"),(69,"LinearEquiv.ofBijective"),(71,"e.surjective"),(72,"hsurj t"),(73,"b'.2 m"),(74,"b₀.1"),(75,"bm.2 c"),(76,"mem_smul_top_of_equiv"),(77,"hker"),(79,"map_eq_zero_iff"),(80,"b₀.1 h")]),
(P+"AbelianSchemeCrystalReducesToDeRhamSqZeroStatement.lean","f66a3522d8361815474eadde6dcc53996cb8296d",[(11,"theorem _root_.GlobalTheory.T."),(12,"rhoBC_of_abelianLift")]),
(D+"SurjectiveOfIsPullbackSqZero.lean","b4324e88eb9b117877d056cb7608693f944b8bbb",[(43,"abbrev Cr"),(169,"theorem redMor"),(172,"π a = 0"),(174,"dpow_eval_zero"),(177,"def rho"),(178,"pull1"),(200,"def RhoBC"),(201,"Function.Surjective")]),
(T+"BijectiveCechDeRhamComparisonDegreeOne.lean","5c1ea214a49422785892f5afd011edde47b23911",[(38,"IsPullback"),(42,"def Data.ofQuot"),(60,"quotientKerEquivOfSurjective"),(66,"h.of_iso"),(69,"def Data.self"),(130,"def CrystallineSmoothLift : Prop"),(131,"∃ (e₁"),(132,"cupHH"),(133,"cmp1"),(135,"φ₀ ≫ D.i"),(138,"theorem CrystallineSmoothLift.bijective"),(140,"obtain"),(143,"bijective"),(145,"theorem CrystallineSmoothLift.toCrystallineDeRham"),(153,"∘"),(154,"of_comp_iff"),(157,"pairRes2_id_injective"),(158,"of_comp_iff")]),
(T+"AbelianHodgeDeRham.lean","80799a38567aba92e73f29eb44b8da65f95f44c2",[(15,"def AbelianHodgeDeRham : Prop"),(17,"Module.Finite"),(18,"2 * g"),(24,"Function.Surjective"),(26,"IsPullback"),(27,"IsPull1"),(28,"IsPullForm"),(29,"IsPullO")]),
(P+"AffinePairRestrictionInjectiveFirstCohomology.lean","4b85d4a931235cc8a096ae89ca2a95a681085838",[(17,"exists_cob_of_pair"),(26,"exists_glue_functions"),(27,"Z1.comp"),(34,"sec_eq_of_pair"),(46,"pairRes_injective"),(48,"pullHyp1"),(69,"Hyp1.mk_surjective"),(71,"obtain"),(78,"exists_cob_of_pair"),(81,"oneForm_eq_zero_of_vanishing_on_pairs"),(82,"cechDeRhamTotalCocyclesOne.conn"),(86,"abel")]),
(P+"AbelianSchemeSquareZeroLiftsOfHodgeDeRham.lean","8b7694e7cc66ec12b5b055da455ec8ac16b2cc9f",[(32,"abelianSchemeLifts_of_hodgeDeRham"),(37,"goodForSquareZero"),(38,"abelianScheme_crystal_reduces"),(42,"hG hR"),(55,"hG hR"),(66,"hG hR")]),
(P+"AbelianLiftReductionStandardFacts.lean","4fa5fe242698ba967f45d0941c2ff6b71ddc839a",[(19,"abelianLift_facts"),(23,"H1.toCrystallineDeRham"),(42,"Module.Finite"),(43,"Module.Projective"),(44,"Module.Projective.of_equiv")])]
def git(*a): return subprocess.check_output(["git",*a]).decode("utf8")
def read(ref,path,sha):
    spec=ref+":"+base+path
    assert git("rev-parse",spec).strip()==sha
    return git("show",spec).splitlines()
n=0
for p,h,anchors in rows:
    lines=read(pin,p,h)
    for i,s in anchors:
        assert s in lines[i-1],(p,i,s)
        n+=1
assert n==98
old=read(pin,*rows[0][:2])
new=read(head,rows[1][0],"9f232bd010b669695ce78cfd8bd6d400a0eae2d4")
assert old[17:80]==new[64:127]
assert "exact GlobalTheory.LiftSys.rhoBC_of_abelianLift" in new[143]
print(len(rows),n,len(old[17:80]))

```
Finite regression (Node, exact small integer arithmetic):
```js
function finiteCheck(){
 const assert=(v,msg)=>{if(!v)throw Error(msg)};
 const eq=(a,b)=>a.every((v,i)=>v===b[i]),key=a=>a.join(","),scale=(s,a,m)=>a.map((v,i)=>s*v%m[i]);
 let surj=0,kernel=0,diagram=0,semilinear=0,quotientFibres=0,nonprojective=0;
 for(const m of [[4,4],[4,2],[2,2]]){
   const V=Array.from({length:m[0]*m[1]},(_,i)=>[Math.floor(i/m[1]),i%m[1]]);
   const Q=[[0,0],[0,1],[1,0],[1,1]];
   const L=x=>[x[0],(x[1]+x[0])%m[1]],C=x=>[(x[0]+(m[0]===4&&m[1]===2?2:1)*x[1])%m[0],x[1]];
   const red=x=>x.map(t=>t%2),e=x=>[x[0]^x[1],x[1]],B=x=>[x[0],x[0]^x[1]];
   const inverse=(f,W,y)=>{const a=W.filter(x=>eq(f(x),y));assert(a.length===1,"bijection");return a[0]};
   const rho=x=>inverse(B,Q,e(red(C(inverse(L,V,x)))));
   const IM=new Set(V.map(x=>key(scale(2,x,m))));
   for(const y of Q){assert(V.some(x=>eq(rho(x),y)),"surj");surj++;}
   for(const x of V){assert(eq(rho(x),[0,0])===IM.has(key(x)),"kernel");kernel++;
     assert(eq(B(rho(L(x))),e(red(C(x)))),"diagram");diagram++;
     for(let s=0;s<4;s++){assert(eq(rho(scale(s,x,m)),scale(s%2,rho(x),[2,2])),"semilinearity");semilinear++;}
     for(const y of V){let diff=x.map((t,i)=>(t-y[i]+m[i])%m[i]);assert(eq(red(x),red(y))===IM.has(key(diff)),"quotient fibres");quotientFibres++;}
   }
   if(m.includes(2)) nonprojective++;
 }
 assert(!Number.isInteger(1/2),"nonsurj negative");
 const x=[1,0];assert(!eq([0,0],x),"missing compatibility negative");
 return {surj,kernel,diagram,semilinear,quotientFibres,nonprojective,negative:2};
}
console.log(finiteCheck());

```

RESUME HERE: reconstruct GoodForSquareZeroLiftClassificationOfAbelianSche at pin, keeping all five Good fields (const, par, proj, surj, inj), and trace the exact suppliers of invariant differential trivialization and closed-form comparison. Then system realization, and separately locate actual H1/H2 producers in upstream package; do not confuse Hodge consumer with supplier. HANDOFF TO integration, editor, audit, geometry and theta. Project OPEN.
