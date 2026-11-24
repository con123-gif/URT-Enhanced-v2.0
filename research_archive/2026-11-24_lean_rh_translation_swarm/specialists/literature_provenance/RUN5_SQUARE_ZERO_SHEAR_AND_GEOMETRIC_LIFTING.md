# RUN5 — Square-zero lifting: shear, rigidity, and actual supplier

2026-11-24. SOURCE-MATCHED, conditional human reconstruction; no independent Lean replay or URT-specific speed claim. Followed RUN4 handoff; read coordination, AGENTS, continuity, research state/log/protocol, peer handoffs and physical CI (11:35 PASS, unrelated to RH). Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream main 5f2c8594adf1f48032d37583118512cd7bbf3afa, changed since RUN4. At that head the two base modules are consolidated in AbelianLiftingOfDeRhamUnobstructed (blob 5b16826bb38b1b907d24526e461f71510856654f, liftObj_sq L306 and liftHom_sq L385). Shear theorem is at L328 of ExistsLiftShearMapSquareZeroAbelianSchemes (blob 94cc58edebc072cd8611647920be5b4934c45141); HodgeDeRham producer at L1635 of AbelianSchemeSquareZeroLiftsOfHodgeDeRham (blob 56819493f085ef977c38d4eaaca7c9705a31d84b). These are declaration location checks, not semantic equivalence. All original references below use pin and directory src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ unless specified.

## 1. Hypotheses and H's three fields

Fix surjection pi:R→R0 with kernel I, I²=0, canonical divided powers divided₂. Given abelian reference lift A' of A0, group pullback i', smooth relative dimension g, H=AbelianSchemeLifts.At(hI,pi) asserts three properties of smooth *scheme* lifts with a specified special-fiber identification:
(1) every smooth scheme lift X yields admissible F⊆HdR(A') with schemeFil(X)=crysToDR^{-1}(F);
(2) every admissible F is realized by such a smooth scheme lift;
(3) equality of scheme filtrations of X,Y yields an isomorphism E:X≅Y respecting their specified special-fiber maps.
IsNoetherianRingDualNumber (PublishedTheorems/Divisors₂, blob 5e8fc93f969ce75f4bea60e3b1ed1d17f8e93b03) L17–33 defines these conjuncts and L40–59 projects them. Not independent axioms. The global AbelianSchemeLifts proposition quantifies over Noetherian R; the local adapters accept H without requiring Noetherianity themselves. RUN4 gives the extension.

Scheme filtration is the dual annihilator of the primitive crystalline submodule pulled back from F1 of the smooth lift. Definitions/Divisors/PrimitiveCrystalHodgeLiftClasses (blob 33df8f02d248bc33f240a1fe1cee40d8e68d061e) L17–57 proves that for a group lift schemeFil equals liftFil provided AllPrim of its de Rham comparison. P=AbelianDeRham supplies AllPrim. Do not discard this guard.

## 2. Common shear lift (ExistsLiftShearMapSquareZeroAbelianSchemes L69–143)

Let A0,B0 be the abelian special fibers with reference abelian lifts A',B' of dimensions g,g'. Let X,Y be smooth scheme lifts with pullbacks i,j and sections e,e' lifting the identities. Let l:A0×B0→X×Y have both projection compatibilities. Let f0:A0→B0 be a group homomorphism with push(f0)(schemeFil X)⊆schemeFil Y.

In additive notation sigma(a,b)=(a,f0(a)+b), tau(a,b)=(a,-f0(a)+b). They are inverse maps (L86–104). B0 is commutative by group pullback from B' (L26–43,83–85), so sigma is a group homomorphism. A'×B' is abelian and of summed relative dimension; l and l∘sigma are both pullback identifications of X×Y (L105–118).

Write p(d),q(d) for the crystalline push projections of a class d on A0×B0, U=schemeFil X, V=schemeFil Y. Use the two named geometric lemmas: filtration under re-marking by group isomorphism, and product filtration iff both projections lie in U,V (requires the lifted sections). Push of sigma transforms the two coordinates into (p(d),push(f0)p(d)+q(d)) by functoriality and additivity (L119–132). Thus p(d)∈U and q(d)∈V iff p(d)∈U and push(f0)p(d)+q(d)∈V, by addition and subtraction in V using the guard. No inverse of f0 required (L134–140).

Invoke H.exists_iso on the two marked lifts (reference A'×B'), obtaining E with E∘l=l∘sigma. Then phi=pr_Y∘E lifts (a,b)↦f0(a)+b (L141–143). This is the shared mathematical construction for both base adapters, not a new assumption. Keep the underlying filtration comparison lemmas as open child obligations.

## 3. Object: construct a group law, do not assume one

GrothendieckMessingLiftAbelianSchemeOfSquareZero L16–38: H.exists_lift produces smooth X with required filtration. The special fiber is abelian of relative dimension g by group-pullback and smooth base change. Lift its identity section to e over R using nilpotence and smoothness. Construct l by product universal property. Apply §2 with A0=B0 and f0=id (guard via push_id), yielding m:X×X→X lifting addition.

ExistsGrpObjIsAbelianSchemeSmoothLiftNilpotent L15–209 proves this yields an actual group law. Lift properness and geometric connectedness from the special fiber; these and smoothness hold on X, X², X³. Set t(x)=m(e,x); reduction is id, so flat nilpotent reduction reflects isomorphism. Normalize m1=t^{-1}∘m; it still reduces to addition, satisfies m1(e,x)=x and m1(e,e)=e (L70–100). S(x,y)=(x,m1(x,y)) is an isomorphism because its reduction (a,b)↦(a,a+b) is, by the same flat reflection lemma (L102–120).

Crucial noncircular rigidity: for smooth proper geometrically connected P with section epsilon, maps f,g:P→X agreeing on the special fiber and at epsilon are equal (EqOfShearAutomorphismLiftNilpotent L19–99). Apply S^{-1} to (f,g) and (f,f). Both first coordinates are f; both second coordinates reduce to the identity section of A0 and agree at epsilon. The proper smooth nilpotent rigidity theorem makes each second coordinate constant, determined by epsilon. They agree, hence cancellation of S^{-1} proves f=g. No group structure on X assumed. RUN4 records the underlying rigidity source.

Apply this to m1(x,e) and x on X; m1(x,y) and m1(y,x) on X²; both associations on X³. Reductions agree by group laws on A0, section values agree by m1(e,e)=e. This proves right unit, commutativity, associativity (L126–166). Define inverse x↦pr₂ S^{-1}(x,e), a right inverse by product universal property and left inverse by commutativity (L168–186). Bundle GrpObj and verify group-pullback compatibility and abelian properties (L187–209). Relative dimension lifts by nilpotent-spectrum surjectivity and local dimension comparison; use P to identify schemeFil and liftFil. This closes the source-level object adapter conditional on stated internal geometry.

Section producer ExistsSectionLiftSmoothNilpotentThickening (blob 2c3f91a354e7edeaf07acf116b06fbe778911f52) L18–36 uses induction from square-zero, local affine basic-open lifts, finite unit-ideal cover and gluing. SmoothOfRelativeDimensionOfNilpotentReduction (blob 3d8ad2d5fceca557bd928012ddcbdba78718b0c4) L11–41 uses nilpotent spectrum surjectivity and local dimension/base-change comparison. Their deeper proofs remain attached.

## 4. Morphism: uniqueness separately established

GrothendieckMessingLiftHomomorphismOfSquareZero L35–59: given actual abelian lifts A,B and f0 satisfying liftFil compatibility, P supplies AllPrim for both. Rewrite guard to schemeFil, apply §2 with true identity sections, restrict phi to (a,0), yielding a scheme map psi:A→B reducing to f0. No claim psi is already a group map.

ExistsUniqueIsMonHomLift L29–72 corrects psi by translation f(a)=psi(a)-psi(0). Then f(0)=0 and reduction still f0. The abelian rigidity_holds theorem converts the identity-preserving scheme map into a group homomorphism. If g is another group lift, d=g-f reduces to zero and d(0)=0; proper smooth geometrically connected nilpotent rigidity makes d constant equal to its identity value, hence d=0 and g=f. This part works for nilpotent kernels generally; here the bound is 2.

## 5. Actual producer of H

AbelianSchemeSquareZeroLiftsOfDeRhamCohomology (blob d83a4815a5af4d990fb7afa8223bc7125d24ba3a) L13–14 applies the Hodge–de Rham producer with the internal CrystallineSmoothLift theorem. AbelianSchemeSquareZeroLiftsOfHodgeDeRham L32–72 takes hC=CrystallineSmoothLift, hH=AbelianHodgeDeRham. For Noetherian R and specified square-zero quotient, R0 is Noetherian by surjectivity. Establish standard reduction facts, Good, RhoBC, three summand interfaces ad1/ad2/ad3. Choose reference system S' presenting A'. Core1 gives each lift system filtration K as direct summand with required reduction; ksup relates reduction to Hodge filtration. SchemeFil(X) equals dual annihilator of K restricted to primitives (L34–48).
* Field 1: present X by S; core1 and ad1 produce admissible F and equality (L50–53).
* Field 2: ad2 produces summand K with required reduction. Realize K by S, present S by scheme X, prove smoothness and pullback, obtain equality (L54–59).
* Field 3: present X,Y by S,T. ad3 turns equality of restricted dual annihilators into T.K=S.K. Prove Full T, build system morphism and scheme morphism reducing to identity, reflect isomorphism by flat nilpotent reduction (L60–72).

CrystallineSmoothLiftOfRelations L19–46,52–72 constructs hC: choose affine smooth thickening for every datum. A relation total in both directions, additive, scalar compatible and reflecting zero in both directions determines a linear equivalence (uniqueness by subtracting two related pairs, injectivity by zero reflection, surjectivity by totality). Apply in degrees 1,2, then prove cup compatibility, degree-one comparison and naturality by named internal theorems. No additional hC axiom asserted. hH remains a premise of this interface; RUN2 traces the parent supplier.

## 6. Literature/provenance ledger

The published At definition and projections are not axioms. Explicit native theorem applications, read at pin: GrothendieckMessingLiftAbelianSchemeOfSquareZeroStatement (a4591047a5b6959a970e8593ff1ec6009be4ada4 L14); GrothendieckMessingLiftHomomorphismOfSquareZeroStatement (5d748c8b2fc9816b156da7bc296a7abb536be3d9 L14); ExistsLiftShearMapSquareZeroAbelianSchemesStatement (c7267d0a5f4028cd15ae1774b2672628505cb2be L25); ExistsGrpObjIsAbelianSchemeSmoothLiftNilpotentStatement (01ce7a147731f9e58f9267f2a5defaa12ac3b7e4 L19); ExistsUniqueIsMonHomLiftStatement (84fbf13797dbe233f5fab526d5bd535937ae26d1 L16); EqOfShearAutomorphismLiftNilpotentStatement (170d848afe49636729666a92368d0560df0766ea L19); AbelianSchemeSquareZeroLiftsOfDeRhamCohomologyStatement (06514f41dd0359b37fdce155a7a4b0f379ea4e5d L12); AbelianSchemeSquareZeroLiftsOfHodgeDeRhamStatement (5fd6c997821fb84b0351568132a48b779f2288ce L12). These are wrapper classifications only, not transitive kernel axiom results.

Remaining native obligations: both filtration invariance/product lemmas, three admissible summand interfaces (especially ad3), Good/RhoBC, system direct summand realization and presentation, comparison relation producers, properness and flat reduction reflection, rigidity, section chart gluing. HodgeFiltrationCompIsoLiftIffStatement (3d99600aa11609eb9d77966c2cefc8c98f23d6b6 L12–16) requires group isomorphism, and HodgeFiltrationTensorLiftsIffProjectionsStatement (8b10d82b7e4b8a467cd72b36188045d4a119fb8e L12–21) requires the stated identity-lifting sections and product compatibility. No new premise introduced by this exposition; no RH kernel claim.

## 7. Actual executed evidence

JavaScript connector check refetched 8 pinned files, compared their blob SHAs against prior observed values, and tested 75 line-specific substrings; all passed. Other sources were read and their blob IDs recorded above. The following data allow reproduction from a git checkout. No Lean execution. Current-head locations separately observed, not a claim of migrated proof equivalence.

RESUME HERE: expand actual HodgeFiltrationCompIsoLiftIff and HodgeFiltrationTensorLiftsIffProjections, including primitive decomposition/product annihilator and lifted-section hypotheses; then trace ad3 in AdmissibleDeRhamHomologySummandsCrystal. Do not redo group law or H-field assembly. HANDOFF TO integration, proof editor, formal audit, geometry, theta. Project OPEN.

Copy JSON into run5_sources.json; execute from upstream checkout:

```python
import json, subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
base="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
def git(*args):
    return subprocess.check_output(["git", *args]).decode("utf-8")
records=json.load(open("run5_sources.json"))
n=0
for r in records:
    spec=pin+":"+base+r["name"]+".lean"
    assert git("rev-parse",spec).strip()==r["sha"], spec
    lines=git("show",spec).splitlines()
    for i,s in r["checks"]:
        assert s in lines[i-1], (spec,i)
        n+=1
print(len(records),"blob hashes;",n,"anchors")
```

```json
[
  {
    "name": "GrothendieckMessingLiftAbelianSchemeOfSquareZero",
    "sha": "d349fdb706b07b78555c662043dc92418fa62c18",
    "checks": [
      [
        16,
        "theorem liftObj_sq"
      ],
      [
        19,
        "H.exists_lift"
      ],
      [
        23,
        "exists_section_lift"
      ],
      [
        31,
        "exists_lift_shearMap"
      ],
      [
        32,
        "push_id"
      ],
      [
        36,
        "exists_grpObj_isAbelianScheme"
      ],
      [
        38,
        "schemeFil_eq_liftFil"
      ]
    ]
  },
  {
    "name": "GrothendieckMessingLiftHomomorphismOfSquareZero",
    "sha": "9aad72370e8be54878ef82d0ce3ca8e8f8e38911",
    "checks": [
      [
        35,
        "theorem liftHom_sq"
      ],
      [
        38,
        "P.1 R A"
      ],
      [
        45,
        "exists_lift_shearMap"
      ],
      [
        48,
        "schemeFil_eq_liftFil"
      ],
      [
        49,
        "existsUnique_isMonHom_lift"
      ]
    ]
  },
  {
    "name": "ExistsLiftShearMapSquareZeroAbelianSchemes",
    "sha": "c9bb7ab3fc7a0a2d59bab4f7307e2e3162072bf2",
    "checks": [
      [
        69,
        "theorem exists_lift_shear"
      ],
      [
        86,
        "∃ σ"
      ],
      [
        87,
        "∃ τ"
      ],
      [
        93,
        "hστ"
      ],
      [
        98,
        "hτσ"
      ],
      [
        122,
        "hodgeFiltration_comp_iso"
      ],
      [
        123,
        "hodgeFiltration_tensor"
      ],
      [
        131,
        "push_mul"
      ],
      [
        136,
        "add_mem"
      ],
      [
        139,
        "sub_mem"
      ],
      [
        141,
        "hL.exists_iso"
      ],
      [
        142,
        "E.hom ≫ snd"
      ]
    ]
  },
  {
    "name": "ExistsGrpObjIsAbelianSchemeSmoothLiftNilpotent",
    "sha": "c8bb62046a077281873af172be53c17ffd17863f",
    "checks": [
      [
        25,
        "isProper_geometricallyConnected"
      ],
      [
        70,
        "∃ τ"
      ],
      [
        77,
        "isIso_of_flat_pullback_reduction"
      ],
      [
        81,
        "m ≫ inv τ"
      ],
      [
        95,
        "one_mul₁"
      ],
      [
        116,
        "σiso"
      ],
      [
        123,
        "eq_of_shear_automorphism"
      ],
      [
        126,
        "mul_one₁"
      ],
      [
        138,
        "comm₁"
      ],
      [
        158,
        "assoc₁"
      ],
      [
        168,
        "∃ iX"
      ],
      [
        187,
        "GrpObj X"
      ],
      [
        202,
        "comm₁"
      ]
    ]
  },
  {
    "name": "EqOfShearAutomorphismLiftNilpotent",
    "sha": "ba86bb78a1df2110c40050eabfbebc14c064e20f",
    "checks": [
      [
        19,
        "theorem eq_of_shear"
      ],
      [
        52,
        "∃ g"
      ],
      [
        53,
        "∃ g"
      ],
      [
        69,
        "hgu_k"
      ],
      [
        71,
        "hgu_ε"
      ],
      [
        84,
        "eq_comp_section"
      ],
      [
        85,
        "eq_comp_section"
      ],
      [
        91,
        "gu = gv"
      ],
      [
        96,
        "cancel_mono"
      ]
    ]
  },
  {
    "name": "ExistsUniqueIsMonHomLift",
    "sha": "068d2a0d2492401d9951b1e018d06c5feecd18d8",
    "checks": [
      [
        29,
        "theorem existsUnique_isMonHom_lift"
      ],
      [
        48,
        "φ *"
      ],
      [
        53,
        "rigidity_holds"
      ],
      [
        57,
        "g * f⁻¹"
      ],
      [
        62,
        "Rigidity.eq_comp_section"
      ],
      [
        72,
        "mul_inv_eq_one"
      ]
    ]
  },
  {
    "name": "AbelianSchemeSquareZeroLiftsOfHodgeDeRham",
    "sha": "8b7694e7cc66ec12b5b055da455ec8ac16b2cc9f",
    "checks": [
      [
        32,
        "theorem abelianSchemeLifts_of_hodgeDeRham"
      ],
      [
        35,
        "isNoetherianRing_of_surjective"
      ],
      [
        37,
        "goodForSquareZero"
      ],
      [
        38,
        "crystal_reduces"
      ],
      [
        39,
        "admissible_deRhamHomology"
      ],
      [
        42,
        "filtration_direct_summand"
      ],
      [
        52,
        "ad1"
      ],
      [
        54,
        "ad2"
      ],
      [
        55,
        "exists_squareZeroLiftSystem_of_summand"
      ],
      [
        57,
        "exists_scheme_presenting"
      ],
      [
        62,
        "ad3"
      ],
      [
        64,
        "filtration_inf_eq_and_full"
      ],
      [
        66,
        "exists_squareZeroLiftSystem_hom"
      ],
      [
        70,
        "isIso_of_flat_of_isIso_reduction"
      ]
    ]
  },
  {
    "name": "CrystallineSmoothLiftOfRelations",
    "sha": "b1bf4854a196e421a8c96ad821dd4f1a2957817b",
    "checks": [
      [
        19,
        "theorem exists_linearEquiv_of_rel"
      ],
      [
        33,
        "Injective"
      ],
      [
        40,
        "Surjective"
      ],
      [
        52,
        "theorem crystallineSmoothLift_of_relations"
      ],
      [
        53,
        "Classical.choice"
      ],
      [
        54,
        "relations_total_detect_zero"
      ],
      [
        67,
        "respect_cup"
      ],
      [
        69,
        "degreeOne_comparison"
      ],
      [
        71,
        "natural_smoothLift"
      ]
    ]
  }
]
```
