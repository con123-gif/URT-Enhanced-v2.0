# RUN6 — Primitive filtration, product and dual-summand faithfulness

2026-11-24. SOURCE-MATCHED human reconstruction and finite regression, not independent Lean replay. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream main 26c37b400bc9cfd43c81d798aa5e798af5c55b94, changed since RUN5. Read coordination, AGENTS, continuity, state/log/protocol and recent peer handoffs. Physical CI 12:32 PASS is unrelated. No physical gate changes. All proof paths below in src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ except indicated definitions.

## 1. Filtration and naturality
For group object A over S, t:S→Spec R, divided powers κ on I⊆R and X over Spec R with structure-compatible marking i:A→X, define P_A=prim κ t A, C_A=P_A^∨ (Crys), L_i=P_A ∩ i^* F¹H¹_dR(X) (image of F1 under pull1 then inverse image by primitive subtype), U_i=Ann(L_i). Definitions/Divisors/PrimitiveCrystalHodgeLiftClasses L17–24, blob 33df8f02d248bc33f240a1fe1cee40d8e68d061e. X need not have a group law; identifying schemeFil and liftFil requires group pullback and AllPrim (L26–57).

Given group map f:A'→A and scheme map m:X'→X over R commuting with markings, f^* sends L_i into L_i'. Choose a∈F1 representing c∈L_i. Then m^*a∈F1 by pullback1_mem_hodgeFiltration and i'^*m^*a=f^*i^*a by functoriality; group pullback preserves primitivity. HodgeFiltrationTensorLiftsIffProjections L26–41. Push on Crys is dual to primitive pullback, not cohomological push. Functoriality/F1 preservation remain imported results.

## 2. Re-marking
HodgeFiltrationCompIsoLiftIff L11–49: fix commutative R,R0, I,κ,π:R→R0, group objects A0,B0 over Spec R0, group isomorphism σ:A0→B0, X over Spec R, marking j:B0→X and both structural identities for j and j∘σ. No square-zero or π surjectivity requirement here. Inverse σ is a group map by cancellation (L15–19). Contravariance gives (j∘σ)^*a=σ^*j^*a and the inverse identity (L21–37). Thus L_(j∘σ)=σ^*L_j. As push(σ)d(c)=d(σ^*c), d∈U_(j∘σ) iff push(σ)d∈U_j. Converse uses inverse primitive pullback L45–49. Do not invert an arbitrary group map.

## 3. Product without blanket Künneth
HodgeFiltrationTensorLiftsIffProjections L43–106: fix R,R0,I,κ,π, group objects A0,B0, schemes X,Y and compatible markings i,j. Require sections e,e' over R lifting both group identities, and l:A0×B0→X×Y with both projection identities and structural compatibility wl. Then d∈U_l iff push(p1)d∈U_i and push(p2)d∈U_j for every d∈Crys(A0×B0). Forward is §1 for both projections L60–70.

Reverse: put ι1(a)=(a,1), ι2(b)=(1,b). The pointwise group product of ι1∘p1 and ι2∘p2 is identity. By the defining primitive property,
c=p1^*ι1^*c+p2^*ι2^*c
for primitive c (L73–85). This is direct decomposition for primitives, not a Künneth assertion for all cohomology. Lift ι1 by mX:x↦(x,e'(base(x))) and ι2 by mY:y↦(e(base(y)),y). These are scheme maps without group structure on X,Y. The identity-lifting sections and both projection equations give the marked squares by extensionality (L87–102). §1 gives ι1^*c∈L_i, ι2^*c∈L_j for c∈L_l (L103–104). Evaluate d on the decomposition: both push evaluations vanish (L105–106). Retain the section guards.

## 4. Admissible summands
AdmissibleDeRhamHomologySummandsCrystal L59–161 takes H1=CrystallineSmoothLift, H2=AbelianHodgeDeRham, commutative R,R0, I²=0, π onto with kernel I, group pullback of abelian A' of relative dimension g. Set C=Cr(hI,π,A0), P=prim(divided₂ hI,spMap π,A0), M=primDR A', M0=primDR A0. abelianLift_facts supplies P=top, comparison Ψ:M≃P, finite projective C, and geometric facts; Φ:M≃C is Ψ followed by top-submodule equivalence (L61–68). Comparison pullbacks give F1 membership equivalence, reduction ρ:M→M0 onto with kernel I M using RhoBC (L69–103), and PrimitiveSubmodule A0 complemented by abelianDeRham_hodge.

Let a:Crys→HdR(A') be crysToDR, onto because precomposition by Ψ admits inverse precomposition by Ψ⁻¹ (L119–122). For K⊆C,
Ann_P(K∩P)=a⁻¹(Ann_M(Φ⁻¹K))
by testing functionals both directions, using Ψ⁻¹ for an arbitrary primitive (L123–139). Surjectivity of a reflects equality of submodules under inverse image (L140–145).
D1,D2 below are the two outputs of summand_dual_reduction. ad1: complemented K satisfying F1 reduction pulls back under Φ; D1 yields complemented annihilator with dual reduction condition, hence admissible F (L147–148). ad2: for admissible F, D2 gives complemented K' in M with F=Ann(K'); D1 reflects dual to primal reduction; transport K' to C by Φ (L149–155).
ad3: complemented K,K' with equal restricted annihilators give equal annihilators in M by surjectivity of a. D1 double annihilation gives equal inverse images under Φ, and surjectivity of Φ gives K=K' (L156–161). No F1 reduction condition on K,K' needed for ad3. The complements, projectivity and full primitive comparison are kept. Negative control: in R² with P=Re1, K=0, K'=Re2, both restrictions intersect P in zero but K≠K'. This is not a counterexample to the Lean theorem, but to dropping the full-primitive guard.

## 5. Native linear algebra supplier
SummandDualAnnihilatorReductionProjective L180–235 assumes π:R→R0 onto, C finite projective, ρ:C→C0 surjective semilinear with ker ρ=IC, F0⊆C0 complemented (I=ker π; no square-zero here). D1 for each complemented K with complement N:
(i) Ann(K) complemented by Ann(N): pK+pN=id (L15–39).
(ii) coAnn(Ann(K))=K (L41–54): if c is in coAnn, every φ∘pN vanishes on c; projective duals separate vectors so pN(c)=0. Converse by definition.
(iii) K+IC=ρ⁻¹(F0) iff for every y∈C0^∨, y∈Ann(F0) precisely when some x∈Ann(K) satisfies y(ρc)=π(x(c)) for every c. Forward: lift y by projectivity then compose with pN; pK term vanishes by F0 membership. Conversely any x reducing to y kills F0 via decomposition into k+IC. To recover the primal condition from the dual condition, project onto complement of F0 and test every dual; they separate C0 by descent, ker ρ=IC and projectivity (L109–118,209–224). If c reduces into F0, every x0∘pN descends to a y annihilating F0, so every x0(pN c)∈I; projective splitting into free module yields pN c∈IC (L56–61,225–235).
D2: every complemented G⊆C^∨ equals Ann(K) for complemented K=coAnn(G). Finite projectivity gives bijective C→C^∨∨, transporting dual splitting projections to primal splitting and recovering G (L120–172).
Dual lift uses projectivity and chosen π-preimages of coordinate values (L65–71); dual descent factors π∘x through ρ because ker ρ=IC (L73–98).

## 6. External-assumption ledger
HodgeFiltrationCompIsoLiftIffStatement L16 (blob 3d99600aa11609eb9d77966c2cefc8c98f23d6b6) and HodgeFiltrationTensorLiftsIffProjectionsStatement L21 (8b10d82b7e4b8a467cd72b36188045d4a119fb8e) explicitly apply internal bodies above. AdmissibleDeRhamHomologySummandsCrystalStatement L12 (83daee79d1bde07140a822581edae37e4fde4c0e) calls admissible_classification with H1,H2 explicit hypotheses. SummandDualAnnihilatorReductionProjectiveStatement L12 (a03b881e7bffcb4f99f01cd3048dab441bedd32c) applies native summand_dual_reduction. AbelianLiftReductionStandardFacts L19–44 derives all-primitive/bijective/finite/projective/geometric facts via H1,H2, abelianDeRham_free, CrystallineDeRham, rigidity and group pullback; comparison surjectivity transports primDR=top to P=top. AbelianSchemeCrystalReducesToDeRhamSqZeroStatement L12 (f66a3522d8361815474eadde6dcc53996cb8296d) applies rhoBC_of_abelianLift, next body to audit. These wrappers are not independent axioms; deeper Hodge/crystalline suppliers, pullback functoriality, F1 preservation and RhoBC remain open child obligations. No transitive axiom status claimed.

Current head 26c37b400bc9cfd43c81d798aa5e798af5c55b94: ExistsLiftShearMapSquareZeroAbelianSchemes (94cc58edebc072cd8611647920be5b4934c45141) contains schemeFil_comp_iso L62, adapter L118, primitive naturality L154, product L171, adapter L253. AbelianSchemeSquareZeroLiftsOfHodgeDeRham (56819493f085ef977c38d4eaaca7c9705a31d84b) contains double annihilator L274, summand_dual_reduction L414, admissible_classification L544 and adapter L662. Locations only, not migration equivalence.

## 7. Actual execution
Five pinned producer blobs refetched and matched; 77 anchors passed. Other six definition/wrapper files fetched and read, their observed blob IDs above. Earlier larger check stopped on recorded wrapper ID mismatch; not counted as passed. Finite JS regression: {"summands":8,"baseSummands":5,"double":8,"reduce":40,"realize":8,"properPrimitiveCounterexample":1}. Checks complemented summands of (Z/4Z)^2 and F2²: double annihilation, reduction equivalence for all pairs, realization of every dual summand and one proper-primitive negative control. Finite illustration, not proof over arbitrary rings or independent kernel validation. No URT-specific speedup claim.

Reproduction: save JSON below as run6_sources.json, run from upstream git checkout:
```python
import json, subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
base="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
def git(*args): return subprocess.check_output(["git",*args]).decode("utf-8")
n=0
records=json.load(open("run6_sources.json"))
for name,sha,anchors in records:
    spec=pin+":"+base+name+".lean"
    assert git("rev-parse",spec).strip()==sha
    lines=git("show",spec).splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(name,i,s)
        n+=1
print(len(records),"blob hashes;",n,"anchors")
```
```json
[
  [
    "HodgeFiltrationCompIsoLiftIff",
    "f6770456c5cf99131eb8b08c635a138607b8f9d8",
    [
      [
        11,
        "theorem schemeFil_comp_iso"
      ],
      [
        12,
        "[IsMonHom σ] [IsIso σ]"
      ],
      [
        15,
        "IsMonHom (inv σ)"
      ],
      [
        27,
        "have key"
      ],
      [
        29,
        "have key'"
      ],
      [
        32,
        "have back"
      ],
      [
        38,
        "mem_dualAnnihilator"
      ],
      [
        46,
        "primPull"
      ],
      [
        49,
        "key'"
      ]
    ]
  ],
  [
    "HodgeFiltrationTensorLiftsIffProjections",
    "09d15be67892ace54fd49984f2e2544b7e1e1201",
    [
      [
        26,
        "theorem primitive_pullback"
      ],
      [
        31,
        "mem_map"
      ],
      [
        34,
        "pullback1_mem_hodgeFiltration"
      ],
      [
        38,
        "pullback1_comp"
      ],
      [
        43,
        "theorem schemeFil_tensor_iff"
      ],
      [
        46,
        "e ≫ X.hom"
      ],
      [
        47,
        "spMap π ≫ e"
      ],
      [
        48,
        "l ≫ (fst"
      ],
      [
        66,
        "hl1.symm"
      ],
      [
        70,
        "hl2.symm"
      ],
      [
        75,
        "have hmul"
      ],
      [
        79,
        "have hdec"
      ],
      [
        81,
        "c.2"
      ],
      [
        87,
        "let mX"
      ],
      [
        88,
        "let mY"
      ],
      [
        95,
        "h1'"
      ],
      [
        100,
        "h1"
      ],
      [
        103,
        "have k1"
      ],
      [
        104,
        "have k2"
      ],
      [
        105,
        "map_add"
      ]
    ]
  ],
  [
    "AdmissibleDeRhamHomologySummandsCrystal",
    "884f19ab32fd58c37956574dbacab6b6a16f485e",
    [
      [
        59,
        "CrystallineSmoothLift → AbelianHodgeDeRham"
      ],
      [
        62,
        "abelianLift_facts"
      ],
      [
        63,
        "abelianScheme_crystal_reduces"
      ],
      [
        64,
        "abelianDeRham_hodge"
      ],
      [
        66,
        "let Ψ"
      ],
      [
        67,
        "LinearEquiv.ofTop"
      ],
      [
        86,
        "have F1iff"
      ],
      [
        96,
        "have ρker"
      ],
      [
        99,
        "have ρsurj"
      ],
      [
        104,
        "summand_dualAnnihilator_reduction_projective"
      ],
      [
        119,
        "have crysSurj"
      ],
      [
        123,
        "have ann"
      ],
      [
        140,
        "have eqiff"
      ],
      [
        145,
        "comap_injective_of_surjective"
      ],
      [
        147,
        "D1"
      ],
      [
        149,
        "D2"
      ],
      [
        153,
        "D1"
      ],
      [
        156,
        "rw [ann, ann]"
      ],
      [
        157,
        "comap_injective_of_surjective"
      ],
      [
        158,
        "c2"
      ],
      [
        159,
        "c2'"
      ],
      [
        160,
        "Φ.surjective"
      ],
      [
        161,
        "← c2"
      ]
    ]
  ],
  [
    "SummandDualAnnihilatorReductionProjective",
    "adf886a88ca617dee152e4e00f31aa2a434ca88b",
    [
      [
        15,
        "theorem isCompl_dualAnnihilator"
      ],
      [
        41,
        "[Projective R C]"
      ],
      [
        46,
        "forall_dual_apply_eq_zero_iff"
      ],
      [
        48,
        "N.projection"
      ],
      [
        56,
        "mem_smul_top_of_forall_dual"
      ],
      [
        65,
        "exists_dual_lift"
      ],
      [
        73,
        "exists_dual_descent"
      ],
      [
        109,
        "eq_zero_of_forall_dual_reduction"
      ],
      [
        120,
        "[Module.Finite R C]"
      ],
      [
        125,
        "bijective_dual_eval"
      ],
      [
        156,
        "G.dualCoannihilator"
      ],
      [
        180,
        "theorem summand_dual_reduction"
      ],
      [
        184,
        "dualAnnihilator_dualCoannihilator_eq"
      ],
      [
        194,
        "exists_dual_lift"
      ],
      [
        215,
        "eq_zero_of_forall_dual_reduction"
      ],
      [
        228,
        "mem_smul_top_of_forall_dual"
      ],
      [
        229,
        "exists_dual_descent"
      ]
    ]
  ],
  [
    "AbelianLiftReductionStandardFacts",
    "4fa5fe242698ba967f45d0941c2ff6b71ddc839a",
    [
      [
        19,
        "CrystallineSmoothLift → AbelianHodgeDeRham"
      ],
      [
        22,
        "abelianDeRhamFree_of_hodge"
      ],
      [
        24,
        "rigid_of_free"
      ],
      [
        31,
        "have bij"
      ],
      [
        36,
        "have pc"
      ],
      [
        38,
        "b₁.2"
      ],
      [
        40,
        "pullback_mem_primitive"
      ],
      [
        44,
        "Module.Projective.of_equiv"
      ]
    ]
  ]
]
```
Finite regression (Node):
```js
function finiteCheck(){
 const assert=x=>{if(!x)throw Error("finite assertion")};
 const vec=m=>Array.from({length:m*m},(_,i)=>[Math.floor(i/m),i%m]);
 const key=v=>v.join(","),canon=xs=>[...new Set(xs.map(key))].sort().join(";");
 const sub=m=>{let vs=vec(m),a=[[vs[0]],vs];for(let v of vs)if(v.some(t=>t%2===1))a.push(Array.from({length:m},(_,i)=>v.map(t=>t*i%m)));return [...new Map(a.map(s=>[canon(s),s])).values()]};
 const ann=(m,K)=>vec(m).filter(f=>K.every(v=>(f[0]*v[0]+f[1]*v[1])%m===0)),red=K=>K.map(v=>v.map(t=>t%2));
 const S=sub(4),T=sub(2);let double=0,reduce=0,realize=0;
 for(let K of S){assert(canon(ann(4,ann(4,K)))===canon(K));double++;for(let F of T){assert((canon(red(K))===canon(F))===(canon(red(ann(4,K)))===canon(ann(2,F))));reduce++;}}
 for(let G of S){assert(S.some(K=>canon(ann(4,K))===canon(G)));realize++;}
 const P=[[0,0],[1,0],[2,0],[3,0]],K=[[0,0]],L=[[0,0],[0,1],[0,2],[0,3]];
 const restrict=K=>K.filter(v=>P.some(p=>key(p)===key(v)));
 assert(canon(K)!==canon(L)&&canon(restrict(K))===canon(restrict(L)));
 return {summands:S.length,baseSummands:T.length,double,reduce,realize,properPrimitiveCounterexample:1};
}
console.log(finiteCheck());
```

RESUME HERE: Trace AbelianSchemeCrystalReducesToDeRhamSqZero/rhoBC_of_abelianLift at pin; derive RhoBC surjectivity and kernel from finite projective de Rham comparison. Then GoodForSquareZero and system realization. Do not redo primitive/product/ad3. HANDOFF TO integration, editor, audit, geometry, theta. Project OPEN.
