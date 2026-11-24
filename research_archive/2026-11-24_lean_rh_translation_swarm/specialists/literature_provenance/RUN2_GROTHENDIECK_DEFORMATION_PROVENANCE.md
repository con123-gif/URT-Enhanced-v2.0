# Literature provenance — RUN 2: Grothendieck deformation, 2026-11-24

**RESULT: DONE for the scoped source adapter and historical statement comparison; PARTIAL for the deeper producers and formal semantic identification.** No independent Lean execution. No URT speedup claimed. No new axioms or changed assumptions.

Pinned upstream: `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`. Current main observed `1b19a23c664c605c6ef4b724c72b97645114881b`; adapter blob `f4f6eb32f04c91b5cde32f11631828eb4016fa7f`, unchanged from RUN1's observed adapter blob, although upstream head advanced. Four relevant wrappers have identical displayed bodies at current head (lines 1112, 1275, 1277, 1279); use only pinned revision below. Read protocols, continuity, runner log/state and latest lane handoffs; physical CI PASS 45355061872 (08:41:49 UTC) is unrelated to RH validity. No physics work or queue changes.

## 1. Exact local proof and quantifiers

Let R and R₀ be commutative rings, I an ideal of R, κ divided powers on I satisfying IsNilDP κ, and π:R→R₀ a surjective ring map with ker π=I. Write T for this entire tuple including all its premises. The pinned `GrothendieckDeformation` is ∀T, At(κ,π). The target `At` is literally the conjunction Canonical ∧ LiftObj ∧ LiftHom (right-associated). The prime-specific `GrothendieckMessing` additionally quantifies over a prime p and requires p nilpotent in R. Therefore GrothendieckDeformation implies GrothendieckMessing simply by specialization; there is no reverse implication provided here.

The entire local proof of `grothendieckDeformation_of_lifting` takes **two** typed inputs P:AbelianDeRham and L:AbelianLifting. At T, use `canonical_of_abelianDeRham P hκ hπ hI` to obtain Canonical, and L(T) for both LiftObj and LiftHom. Pair these proofs. This is an ordinary conjunction introduction, not a new deformation theorem from nothing. The two witnesses are supplied by separate internal producers, not by postulating the literature record O:

- adapter L239–240: P = PositivityTheory.DualRT.abelianDeRham;
- L403–404: L = GlobalTheory.abelianScheme_hom_lifting_nilpotent_dividedPowers;
- L405–406: form the two-input deformation theorem;
- L407–408: specialize to prime-nilpotent GrothendieckMessing.

The two wrappers for P and L have no explicit O use in their bodies. This permits sharing their reconstruction across consumers, not removing the underlying geometric arguments.

## 2. Preserve the three geometric obligations

At a fixed T:
1. Canonical: for each g and specified pullback h of an abelian scheme A/R of smooth relative dimension g to A₀/R₀, (liftMor κ h).pull is bijective and Fil A is admissible. Admissibility of F ⊆ HdR A means existence of a complementary submodule and, for every y∈HdR A₀, y∈Fil A₀ iff there is x∈F with (redMor h).Corr x y.
2. LiftObj: **given a reference lift A'** of A₀ with the same pullback/abelian/smooth-dimension requirements, and admissible F⊆HdR A', construct A/R with group structure, specified special-fiber pullback, abelian/smooth dimension g, and liftFil κ h = F.comap(crysToDR κ h'). This is not an unconditional existence assertion for every A₀ absent a reference lift. Separate square-zero unobstructedness is available deeper in the source.
3. LiftHom: for two such lifts A and B (possibly different dimensions), and group homomorphism f₀:A₀→B₀, assume every d in liftFil of A is sent by push κ (spMap π) f₀ to liftFil of B. There exists a unique f:A→B with IsMonHom f and i ≫ f.left = f₀.left ≫ j. Preserve the actual equation, typeclass and universal filtration condition. Do not infer unconditional lifting of all maps.

### Human argument for Canonical (source-matched)

The AbelianDeRham package consists of Free, Hodge, BaseChange, Rigid and Duality. Canonical uses the first four, not the last explicitly. Fix h, A, g as above, M=primDR A and U=PrimitiveSubmodule A. Hodge supplies M=U⊕N. Free.prim supplies projectivity of M. BaseChange identifies the special-fiber primitive submodule with the R₀-span of pull(U). Rigid gives the bijectivity clause immediately.

Fil A is the dual annihilator of U. The annihilator of N complements it: intersection zero because a functional vanishing on U and N vanishes on their sum; decomposition follows by composing any functional with the two projections of M. For a special-fiber functional y vanishing on the primitive submodule, compose y with redMor.pull to get an R-linear map ℓ:M→R₀ (R-module structure via π). Projectivity lifts ℓ through π to an R-linear x:M→R. Compose x with projection onto N to kill U. Since ℓ already kills U, the modified functional still reduces to ℓ, hence corresponds to y. Conversely, if a functional vanishing on U corresponds to y, then y vanishes on pull(U), and therefore on its R₀-span by linearity. This proves exactly the admissibility equivalence, along with the direct-summand clause. No analytic or prime-specific hypotheses inserted. The typed definitions of Corr, primDR and HdR are retained by references; their full equivalence with conventional crystalline cohomology is not independently rederived here.

## 3. Producers, not external axioms

P is supplied by the explicit theorem PositivityTheory.DualRT.abelianDeRham. Its first three fields come from a page-level AbelianDeRhamStructure plus conversion to Free; Rigid comes from rigid_of_free_of_crystallineDeRham and a crystallineDeRham witness; Duality comes from duality_of_surjAll using the same structural page, and surjAll_of_hodge with crystallineSmoothLift_of_relations and the Hodge package. Those named producers remain separate source obligations. Do not claim P's entire transitive closure has been reconstructed.

L is supplied by the explicit theorem GlobalTheory.abelianScheme_hom_lifting_nilpotent_dividedPowers. It uses Hodge, dual abelian scheme, Poincare duality (derived from those first two) and unobstructedness. The four-input adapter internally adds the cube theorem, giving five inputs to SqLift.abelianLifting_of_known_theorems: AbelianHodgeDeRham, CubeTheorem, DualAbelianScheme, PoincareDeRhamDuality, AbelianUnobstructed. From them construct another AbelianDeRham package (do not conflate its proof term with P) and AbelianSchemeLifts, then apply abelianLifting_of_schemeLifts with unobstructedness. This constructs SqLifting via a reduction from the Noetherian square-zero case with the two square-zero object/hom lifting theorems.

The final nilpotent induction is explicit in AbelianLiftingOfDeRhamUnobstructed.lean: prove LiftObj∧LiftHom for every exponent n+1. At n=0 the divided-power ideal is zero by degree-one evaluation; its divided powers agree with square-zero powers. Apply the square-zero witness. At successor, exists_isStep_nilExp produces a square-zero first quotient with residual divided-power exponent lowered by one. Apply square-zero lifting to the first leg and the induction hypothesis to the residual leg. Combine using liftAbelianScheme_along_squareZero_factorization and liftHom_of_isStep. For arbitrary IsNilDP obtain N and NilExp κ N from isPDNilpotent_iff, use monotonicity N≤N+1, and apply the induction. Preserve the factorization hypotheses st and the separate object and hom gluing arguments. This is a genuine source-level proof tree, but the square-zero lemmas and exact exponent-definition comparison are still unexpanded.

## 4. Historical provenance — important distinction confirmed in primary source

A. Grothendieck, *Groupes de Barsotti-Tate et cristaux de Dieudonné*, Séminaire de mathématiques supérieures 45, Montréal, 1974, Chapter V §4, printed pp. 114–116. Primary scan: https://webusers.imj-prg.fr/~leila.schneps/grothendieckcircle/barsottitate.pdf (PDF page 110, zero-based 109, printed 115; PDF page 111, zero-based 110, printed 116; duplicate printed 116 on zero-based 111). Inspected actual page images for printed 115 and 116. Bibliographic record: https://catalogue.bnf.fr/ark:/12148/cb374179201.

The primary theorem concerns abelian schemes over a general locally divided-power-nilpotent thickening, and identifies their category with the category of a special-fiber abelian scheme equipped with a locally split extension of its Hodge submodule in the crystal. Page 115 identifies the crystal at a lift with first de Rham cohomology and describes its Hodge exact sequence. Page 116 states the equivalence of categories. It does not require a fixed prime. Thus the broad scope of GrothendieckDeformation is historically appropriate; the narrower prime-nilpotent GrothendieckMessing statement is a specialization, not an adequate citation by itself for the stronger source declaration. For the usual p-divisible-group version see Chai–Oort, *Moduli of abelian varieties and p-divisible groups*, arXiv:math/0701479, Theorem 2.4, https://arxiv.org/abs/math/0701479 (secondary corroboration, not the basis of the general claim).

Correspondence: canonical crystal identification and Hodge reduction correspond to Canonical; essential surjectivity of the equivalence corresponds to LiftObj; full faithfulness corresponds to LiftHom. The formal source uses the dual module and the annihilator filtration, so preservation under a push map corresponds to the contravariant cohomological pullback preserving the original Hodge submodule (requires the actual finite-projective comparison). The reference-lift hypothesis makes LiftObj locally narrower than an arbitrary existence claim. Exact semantic equivalence is **not** certified by historical citation: still verify the actual IsNilDP definition and crystal comparison, local vs global direct-summand descent, and the defined category/morphism maps. This is not an external axiom added to Lean.

## 5. Reproducible source certificate

Fetched 19 pinned modules and checked their expected Git blob identifiers, then tested 54 exact literal source anchors. All passed in connector runtime. This is a source identity/anchor check, not kernel validation. Below is a machine-readable ledger and standalone Python replay. Run with the pinned upstream Git checkout; it reads only Git objects at the fixed revision. Zero added assumptions. No claim of complete reachability, full proof translation or measured acceleration.

```json
[
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
    "sha": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
    "checks": [
      [
        240,
        "PositivityTheory.DualRT.abelianDeRham"
      ],
      [
        404,
        "GlobalTheory.abelianScheme_hom_lifting_nilpotent_dividedPowers"
      ],
      [
        406,
        "GlobalTheory.Published.grothendieckDeformation_of_lifting"
      ],
      [
        408,
        "GlobalTheory.Published.GrothendieckDeformation.grothendieckMessing"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GrothendieckDeformationOfLifting.lean",
    "sha": "0c354048cc2fd757ae786f765d8921f85b48d466",
    "checks": [
      [
        9,
        "(P : AbelianDeRham) (L : AbelianLifting)"
      ],
      [
        12,
        "⟨GrothendieckMessing.canonical_of_abelianDeRham P hκ hπ hI, L R I κ hκ R₀ π hπ hI⟩"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/GrothendieckDeformation.lean",
    "sha": "88188d49a09a09565265ef1e83f9a91335cafec4",
    "checks": [
      [
        12,
        "def GrothendieckDeformation : Prop"
      ],
      [
        26,
        "exact H R I κ hκ R₀ π hπ hker"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/CanonicalOfAbelianDeRham.lean",
    "sha": "049bc86fde20550ab8ead714c36d9df45b6775e8",
    "checks": [
      [
        26,
        "def IsAdmissible"
      ],
      [
        33,
        "def Canonical"
      ],
      [
        38,
        "def LiftObj"
      ],
      [
        47,
        "def LiftHom"
      ],
      [
        55,
        "def At : Prop := Canonical κ π ∧ LiftObj κ π ∧ LiftHom κ π"
      ],
      [
        60,
        "IsNilpotent (p : R)"
      ],
      [
        137,
        "theorem canonical_of_abelianDeRham"
      ],
      [
        163,
        "Module.projective_lifting_property"
      ],
      [
        140,
        "obtain ⟨PF, PH, PB, PR, -⟩ := P"
      ],
      [
        174,
        "Submodule.span_le"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/CrysToDRBijective.lean",
    "sha": "9b005affbcf5e67a6578a405aefe484b57ad940b",
    "checks": [
      [
        24,
        "def Free : Prop"
      ],
      [
        33,
        "def Hodge : Prop"
      ],
      [
        40,
        "def BaseChange : Prop"
      ],
      [
        47,
        "def Rigid : Prop"
      ],
      [
        55,
        "def Duality : Prop"
      ],
      [
        65,
        "def AbelianDeRham : Prop"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/AbelianLifting.lean",
    "sha": "a2b7f1fff22f60cf4eea45df66073896a5310e54",
    "checks": [
      [
        15,
        "def AbelianLifting : Prop"
      ],
      [
        18,
        "GrothendieckMessing.LiftObj κ π ∧ GrothendieckMessing.LiftHom κ π"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/AutomorphicKernels/DualAbelianScheme/AbelianDeRhamDuality/AbelianDeRhamDuality.lean",
    "sha": "bf38bb3decc713a4cbbabd8fb847247fcdf3df8c",
    "checks": [
      [
        20,
        "theorem abelianDeRham : AbelianDeRham"
      ],
      [
        23,
        "rigid_of_free_of_crystallineDeRham"
      ],
      [
        16,
        "theorem duality"
      ],
      [
        13,
        "theorem surjAll"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeHomLiftingNilpotentDividedPowers.lean",
    "sha": "0852a9d2ec0f40e0ab6bdb6d955c3bb5bd195ba2",
    "checks": [
      [
        20,
        "GlobalTheory.LiftFour.abelianLifting_of_four"
      ],
      [
        22,
        "GlobalTheory.UnobTop.abelianUnobstructed"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianLiftingOfFour.lean",
    "sha": "2e09b565613e3592cafbba9dc055eb886e6ec45e",
    "checks": [
      [
        15,
        "theorem abelianLifting_of_four"
      ],
      [
        19,
        "GlobalTheory.T.theoremOfCubeAbelianScheme_over_arbitrary_base"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeHomLiftingNilDPOfFiveStatementsStatement.lean",
    "sha": "4f8511895f3a30189d45fe0bde6dbfaa27d3e3d6",
    "checks": [
      [
        13,
        "GlobalTheory.SqLift.abelianLifting_of_known_theorems"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeHomLiftingNilDPOfFiveStatements.lean",
    "sha": "71cd7dba25200cd8ae2f6f226f2f20fe1f6a78af",
    "checks": [
      [
        14,
        "theorem GlobalTheory.SqLift.abelianLifting_of_known_theorems"
      ],
      [
        19,
        "GlobalTheory.SqLift.abelianLifting_of_schemeLifts"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianLiftingOfDeRhamUnobstructed.lean",
    "sha": "271c5c0d12c40d2230c3df521256f39e9ebfc0f4",
    "checks": [
      [
        49,
        "theorem abelianLifting_of_sqLifting"
      ],
      [
        56,
        "induction n with"
      ],
      [
        63,
        "exists_isStep_nilExp"
      ],
      [
        66,
        "liftAbelianScheme_along_squareZero_factorization"
      ],
      [
        67,
        "liftHom_of_isStep"
      ],
      [
        69,
        "(isPDNilpotent_iff κ).1 hκ"
      ],
      [
        72,
        "theorem abelianLifting_of_schemeLifts"
      ],
      [
        75,
        "squareZeroLifting_of_noetherian_case"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PoincareDeRhamDualityOfHodgeDeRhamDual.lean",
    "sha": "db49f7a6e700efd8584fb4a845ef53445cef36f0",
    "checks": [
      [
        16,
        "theorem poincareDeRhamDuality_of_hodge"
      ],
      [
        20,
        "isPerfect_of_isDual"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeDeRhamLocallyFreeHodgeDegeneratesStatement.lean",
    "sha": "19262443cccd767549ce8fbbdc29fb6d482dc1db",
    "checks": [
      [
        12,
        "GlobalTheory.AbCoh.abelianHodgeDeRham"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/DualAbelianSchemeExistsBidualityStatement.lean",
    "sha": "73f5ff151e7b7e1c5c0224f741ec842599ac02fb",
    "checks": [
      [
        11,
        "GlobalTheory.dualAbelianScheme"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeUnobstructedSquareZeroAffine.lean",
    "sha": "4940da4c4a50b11b76c3188a43e1a2ab4ed9c852",
    "checks": [
      [
        17,
        "abelianScheme_unobstructed_of_cohomology_structure"
      ],
      [
        18,
        "globalFunctionsConstantAfterBaseChange_of_abelianScheme"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/TheoremOfCubeAbelianSchemeOverArbitraryBaseStatement.lean",
    "sha": "615a03074a3b71ed3a410d3bf3497058f5b45d93",
    "checks": [
      [
        6,
        "GlobalTheory.CubeTop.cubeTheorem"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeSquareZeroLiftsOfDeRhamCohomologyStatement.lean",
    "sha": "06514f41dd0359b37fdce155a7a4b0f379ea4e5d",
    "checks": [
      [
        12,
        "GlobalTheory.LiftSys.abelianSchemeLifts_of_abelianHodgeDeRham"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/AbelianSchemeDeRhamStructureOfCubeDualPoincareStatement.lean",
    "sha": "70bdfbdddd502be8a10008586b781ee1ff7d5e6b",
    "checks": [
      [
        13,
        "GlobalTheory.abelianDeRham_of_hodge_cube_dual_poincare"
      ]
    ]
  }
]
```

```python
# Save the JSON block above as ledger.json. Run from upstream checkout.
import json, subprocess
pin = "40e56bab026552e089d7afcfeff08d2defb9c005"
rows = json.load(open("ledger.json", encoding="utf-8"))
count = 0
for r in rows:
    obj = pin + ":" + r["path"]
    assert subprocess.check_output(["git","rev-parse",obj], text=True).strip() == r["sha"], obj
    lines = subprocess.check_output(["git","show",obj]).decode("utf-8").split("\n")
    for i, literal in r["checks"]:
        assert literal in lines[i-1], (obj, i, literal)
        count += 1
print("PASS",len(rows),"pinned blobs;",count,"source anchors")
```

## RESUME HERE
Follow the pinned `ExistsIsStepNilExp.lean` imports to the actual `NilExp`, `IsNilDP` and `isPDNilpotent_iff` definitions, reconstruct the square-zero factorization with precise divided-power descent and nilpotence bound, and compare with the historical locally nilpotent site hypothesis. Do not retranslate the conjunction adapter or the above dual-annihilator argument. Then handle theta lane's pending EisBL/SiegelWeilStd citation claims separately.

HANDOFF TO: integration, proof editor, formal audit, geometry and theta lanes. The deformation branch now has an exact two-input source bridge, all three output clauses, the Canonical linear-algebra proof, a source-linked five-input lifting producer and verified primary historical statement scope. The deeper square-zero and crystalline producers remain OPEN.
