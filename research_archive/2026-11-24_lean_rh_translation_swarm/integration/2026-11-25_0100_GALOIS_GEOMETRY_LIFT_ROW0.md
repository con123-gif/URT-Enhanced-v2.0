# Geometry-lift Galois local–global bridge — integration 01:00
2026-11-25. PARTIAL / SOURCE-MATCHED with cross-checked exported direct role evidence. One contribution: expand authenticated owner 13235288 and its Row0 constructor, not independent kernel replay or the entire proof.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream b2f365a68500e2bde98cd60a2324263fc62fba10, not adopted. Development.lean changed blob from 4d4d9506494734f28fce7d39bac1a50650ecf148 to 25eb1c9c60978c4e9a8edc0899e84289d74a11a1; no semantic cross-revision claim. Current [volume 15](../specialists/proof_editor/2026-11-25_0056_INTEGRATED_MANUSCRIPT.md) blob a67ed230901d3e5b6460db204d2f935bf4213679 reports 177 primary +16 supporting entries (not unique declaration count). Attach this chapter after GeoOne/TLiftK before Row0b.
Read protocol first, AGENTS, state, actual runner log/protocol, continuity, handoff and expansion. Peer checkpoints editor 742bc96, geometry faef914, audit 1fedf6d, literature c27fa70, math a025323, boxes 36ac455, Galois 6e6bda2, theta 5e33efb, structure 9f8d550, Landau f7e9644, prime d8c5ce4, dependencies 84f2185, kernel d543273, acceleration 23b2b75. Galois reserves this bridge to integration. Prior integration e169d46 retained. CI #406 PASS 00:47:27 UTC, run 45517969326, general checks only. External blueprint not reread, no claims from it. Root log/protocol 404 corrected runner paths; default branch code search returned no match, followed MainConclusion→RowSrc→GaloisRepresentationsOfThetaLift→Development imports. First regression failed because oldest direct projection has no pin field; corrected to require absence in first exact blob and pin in other four; common archive digest and root checked. Second attempt exceeded connector call budget. No unsupported source-to-export equivalence.

## Human proof
Development L18–31: recT(h,rc)=IsRecT(h,rc), not full reciprocity IsRec. Given geo:GeoOne and up:TLiftK, prove Row0(recT). By WeightsConjAlt L85–89 this means: for every CM number field E, algebraic closure Ω with Field, Algebra E Ω and IsAlgClosure E Ω, prime ℓ with Fact ℓ.Prime, ring isomorphism ι:Qbar ℓ≃+*C, natural a≥1, cuspidal subspace π:CuspSub E a and χ:HChar(maximalRealSubfield E), assuming regular algebraicity and ContraPair.PolarizedPair π χ, construct one r:G E Ω→*GL(Fin a)(Qbar ℓ), integer wt, and HT assigning multiset of integers to each embedding τ:E→+*Qbar ℓ. Props requires continuous semisimple r, away compatibility, HT equality, conjugation, above-ℓ clauses. Both GeoOne and TLiftK retained.
1. s=seedFinOdd_of_geoOne(geo) via seedFinOdd_of with divAll_holds,cplMem_of,sameOr_of(cplMem_of),satConj_of(locIso_of),tyConj_of(locIso_of),lacConj_of(cplMem_of),gapLac_of,dGenMul_of,geo.
2. w=wtLacEx_holds from top_of(famEx_holds,famProj_holds,famWt_holds). c=congFinOdd_of_ex(w) through stepSt_of_ex(ellSt_holds,w), congUWG_of with finU_holds,DGen,dGen_ne_zero, then congUW4 at Odd. Not unrestricted rank.
3. L=limFinOdd_of(s,c), K=toCoreK(up)(congPhi_holds)(descOffT)(L):Core, via toCore(twoUpOK_of_k(up)); C=coreAll_of_core(K):CoreAll via coreAll_of_core_inp(inp_holds). Trace limit, descent, theta remain subobligations.
4. H1=galoisCompat_unlinkedSupport_of_spherical(C):R1 via inq_holds=(inp_holds,charLiftPrime_holds). H2=localGlobalCompatAtIwahoriFixed_of_unlinked(H1) via r2g(mixedOf,toTor_holds,drDesc,recTExists). Use same H1.
5. Row.galoisLocalGlobal_of_localGlobalCompatibility(C,H1,H2) invokes galoisLocalGlobal_of_placeClassCompatibility with Q=True via localGlobalAtPlaceClass_of_localGlobal. Chooses right disjunct IsQg(w)∧Apart(algNorm σ) from H2's PlainTor-or-pair premise; Q=True does NOT erase nonzero KOne fixed space, IsQg, Apart or mono0.

### Row0 constructor
InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean L157–171: pair regular algebraicity and polarization with trivial to give InScope .all ℓ π χ. C.1 produces r with Weak π ι r; extract continuity and semisimplicity. exists_weights L127–148 produces wt and HT independently of local choices. With c0=(a−1)/2 each infinitesimal character entry z=c0+n (n integer) gives c0−z=−n. Lift the entire multiset preserving multiplicities, choose HT for each τ. Polarized weight theorem, multiset map and injective integer cast yield HT(τ∘conj)=map(wt−·,HT(τ)); retain exists_isWeight, choice and Multiset.canLift.
Away ℓ: quantify height-one w with ℓ outside ideal, valuation subring A, h:IsPlaceOver A w, rc:IrrGL→WD(h) with IsRecT, local component σ. x=wdOf(h,hl,ι,r), y=rc(algNorm σ). L96–106 first dimension equality by lpDim_wdOf and L.dim. For Tor(y) and mono0(y), genericity and plainTor_of_tor feed H1 and give x=y. In separate tame case require IsQp(w),TmW(y),Sqf(y),mono0(y). guard_tame derives nonzero KOne-fixed space and Apart; H2 gives mono0(x) and equal inertia characteristic polynomials. Every degree-zero Weil element g is inertia since exists_eq_zpow_mul deg_frob g writes g=frob^0 times inertia. Thus equal characteristic polynomials for all degree-zero g, not equality of representations in general tame case.
Above ℓ: quantify P:LocPrime ℓ,AI:LocAinf ℓ P,Nonempty(LocTied ℓ P AI),w,A,h,O with CommRing O,Algebra Z_ℓ O,TopologicalSpace O,Bw:LocBridge,hj:Pst.Induces Bw. For spherical local σ, obtain B with HasSat(w,B); C.2 twice (.crys,.dR), and w1(τ) identifies induced embedding jumps with HT(τ). For nice clause require local σ, IsRecT, ((IsQp∧TmW∧Sqf)∨Tor), mono0. L108–125 splits Tor(y): if true H1 yields de Rham,potentially semistable,mono0,charpoly identities; eq_of_mono0_charPol supplies x=y. Otherwise three tame guards follow from disjunction and guard_tame then H2 supply de Rham,potentially semistable,inertia compatibility. Dimension equality via charpoly degree at inertia identity; Tor implication vacuous. mem_of_induces provides ℓ-in-place. Apply de Rham jumps to w1(τ), retaining every τ, finite extension LL',τ' and IsInduced hypothesis. Same r,wt,HT fill six Props fields.
Row0.row0b (WeightsConjBis L76–87) keeps r,wt,HT and restricts IsQp to IsQpBig via IsQpBig.isQp, including above-ℓ disjunction. Extra guard n=1 OR 16n²<g on local field identification. Despite wrapper name Strong this conversion restricts obligations, not extra local cases. Actual root uses Row0b.

## Tests and scope
Executed V8 checks {"checks":9519,"owners":176,"path":7,"type":18,"value":7,"weights":9300,"negative":5}; source files in graph were fetched and blob IDs matched in earlier attempt, not locally rehashed. Negative controls: digest, incoming witness, removed value record, changed type root, altered value witness. Integer-grid sign checks are not analytic proof. Exact incoming seven edges independently cross-checked against previous projection records, not just request path. All selected type/value witnesses retained. No axiom census or raw binder replay inferred from selected report. No independent reviewer sign-off yet. Shared traversal benchmark from acceleration lane does not show golden superiority. Source-only suppliers remain open.
## JSON dependency evidence and typed tree
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "projectionBlobs": [
    "64b935e4ef309f6c555912a377012c7708eda510",
    "d49fbcc22a2382039986b09ff91dd11af2ef2e7b",
    "d04e0fb24160d3ee1be54cd50082f59526864d4e",
    "d823c364f446f5066dbbc61f7e9cf9c891fcbdb2",
    "deabbd86afc8f21d9897ba3bb74349178517fde3"
  ],
  "archiveDigest": "5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e",
  "root": 14065054,
  "selectedOwner": {
    "request": {
      "name": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
      "id": 13235288,
      "kind": "thm",
      "origin": "authenticated_root_path_frontier",
      "incoming": {
        "owner": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift",
        "ownerId": 13235289,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1004086667
      },
      "path": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062,
          "expressionRoot": 1065212062,
          "ownerName": "riemannHypothesis",
          "targetName": "rhOfAll"
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060,
          "expressionRoot": 1065212061,
          "ownerName": "rhOfAll",
          "targetName": "allChi"
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058,
          "expressionRoot": 1065212058,
          "ownerName": "allChi",
          "targetName": "UpperTheory.FinalTheorems.everyCharacter"
        },
        {
          "owner": 14065051,
          "target": 14065050,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212056,
          "expressionRoot": 1065212057,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
          "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"
        },
        {
          "owner": 14065050,
          "target": 14009158,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212052,
          "expressionRoot": 1065212054,
          "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
          "targetName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift"
        },
        {
          "owner": 14009158,
          "target": 13235289,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1062644800,
          "expressionRoot": 1062644804,
          "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
          "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift"
        },
        {
          "owner": 13235289,
          "target": 13235288,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1004086667,
          "expressionRoot": 1004086672,
          "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift",
          "targetName": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift"
        }
      ]
    },
    "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
    "id": 13235288,
    "kind": "thm",
    "encodedRootsAndStructuralEdges": [
      1004086649,
      1004086662
    ],
    "type": {
      "expressionRoot": 1004086648,
      "expressionsRead": 88,
      "childEdges": 120,
      "referenceOccurrences": 18,
      "peakPending": 13,
      "references": [
        {
          "kind": "explicit_const",
          "target": 13125903,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "recT"
          ],
          "targetKind": "def",
          "witnessExpression": 1000095259,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385914,
          "nameParts": [
            "NumberField",
            "instCommRingRingOfIntegers"
          ],
          "targetKind": "def",
          "witnessExpression": 8609075,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385909,
          "nameParts": [
            "NumberField",
            "RingOfIntegers"
          ],
          "targetKind": "def",
          "witnessExpression": 8609071,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385674,
          "nameParts": [
            "IsDedekindDomain",
            "HeightOneSpectrum"
          ],
          "targetKind": "inductive",
          "witnessExpression": 8609070,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385664,
          "nameParts": [
            "ValuationSubring"
          ],
          "targetKind": "inductive",
          "witnessExpression": 8609067,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385652,
          "nameParts": [
            "UpperTheory",
            "GalStar",
            "RecNotion",
            "_proof_1"
          ],
          "targetKind": "thm",
          "witnessExpression": 8609060,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4099,
          "nameParts": [
            "Field",
            "toCommRing"
          ],
          "targetKind": "def",
          "witnessExpression": 1244768,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 341243,
          "nameParts": [
            "IsAlgClosure"
          ],
          "targetKind": "inductive",
          "witnessExpression": 8609052,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4101,
          "nameParts": [
            "Field",
            "toSemifield"
          ],
          "targetKind": "def",
          "witnessExpression": 315578,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4098,
          "nameParts": [
            "Semifield",
            "toDivisionSemiring"
          ],
          "targetKind": "def",
          "witnessExpression": 315576,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4074,
          "nameParts": [
            "DivisionSemiring",
            "toSemiring"
          ],
          "targetKind": "def",
          "witnessExpression": 315574,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4083,
          "nameParts": [
            "Semifield",
            "toCommSemiring"
          ],
          "targetKind": "def",
          "witnessExpression": 1246540,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 85935,
          "nameParts": [
            "Algebra"
          ],
          "targetKind": "inductive",
          "witnessExpression": 5945860,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 3820,
          "nameParts": [
            "Field"
          ],
          "targetKind": "inductive",
          "witnessExpression": 216818,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 341190,
          "nameParts": [
            "NumberField"
          ],
          "targetKind": "inductive",
          "witnessExpression": 8609044,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13126182,
          "nameParts": [
            "UpperTheory",
            "GalStar",
            "Row0"
          ],
          "targetKind": "def",
          "witnessExpression": 997988582,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13125905,
          "nameParts": [
            "UpperTheory",
            "TP",
            "TLiftK"
          ],
          "targetKind": "def",
          "witnessExpression": 1000528341,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13126169,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "Geo",
            "GeoOne"
          ],
          "targetKind": "def",
          "witnessExpression": 1002626056,
          "distinctExpressionRecords": 1
        }
      ]
    },
    "value": {
      "expressionRoot": 1004086661,
      "expressionsRead": 17,
      "childEdges": 16,
      "referenceOccurrences": 7,
      "peakPending": 6,
      "references": [
        {
          "kind": "explicit_const",
          "target": 13235287,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Wt",
            "wtLacEx_holds"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086655,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13232503,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "Cong",
            "congFinOdd_of_ex"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086654,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13220887,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "Div",
            "seedFinOdd_of_geoOne"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086651,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13208115,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "coreAll_of"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086650,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13172410,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "rest"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086649,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13125905,
          "nameParts": [
            "UpperTheory",
            "TP",
            "TLiftK"
          ],
          "targetKind": "def",
          "witnessExpression": 1000528341,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13126169,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "Geo",
            "GeoOne"
          ],
          "targetKind": "def",
          "witnessExpression": 1002626056,
          "distinctExpressionRecords": 1
        }
      ]
    },
    "structural": [],
    "mutualBlock": [
      {
        "id": 13235288,
        "nameParts": [
          "UpperTheory",
          "Gal",
          "Int",
          "galoisLocalGlobal_of_geometry_lift"
        ],
        "exported": true
      }
    ]
  },
  "source": [
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/Development.lean",
      "blob": "4d4d9506494734f28fce7d39bac1a50650ecf148",
      "lines": "18–31"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjAlt.lean",
      "blob": "486af16ec21e4f8c5a482e1481769093b9448bd4",
      "lines": "16–40,51–79,85–89"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjBis.lean",
      "blob": "0a1eab0eb68defc45b4e62d19fbfd01dad459344",
      "lines": "16–23,76–87"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/ZetaCharacterDivisibility/MainFin.lean",
      "blob": "b023ec56003f657cfae4d37daf01914aa4302922",
      "lines": "13–15"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CongruenceOddLevel/CongFinOddOfLvLac.lean",
      "blob": "9221b34460b1ebb347eb6019c3f63ac0cd714079",
      "lines": "10–16"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/WeightCharacters/LadicWeightEmbeddingOverPlace.lean",
      "blob": "27b0e6abc40fbf2fdefe4b7899b906a1fb4f4f01",
      "lines": "wtLacEx_holds"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TraceLimits/LimFinOddOf.lean",
      "blob": "3268147bfbbcac7babd43aa92da8ddf577e029db",
      "lines": "197"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineDescent/ToCoreK.lean",
      "blob": "e4235a62a4bce78539c94be995d8f5a0ff59fac3",
      "lines": "7–9"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCore.lean",
      "blob": "a4054e96f51401b00acb7a5443040abdc94fa549",
      "lines": "4–5"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/GaloisCompatUnlinkedSupportOfSpherical.lean",
      "blob": "e01a86b5f2ec5fee9e16c3e0556d98bbea26bcbf",
      "lines": "8–10"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedOfUnlinked.lean",
      "blob": "90390f831b31ac30e7672dc7d1a499464910ef27",
      "lines": "14–18"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedPlaces.lean",
      "blob": "f6b0fadd7bad69ef19b48cae73c42ea6441310df",
      "lines": "Apart, LocalGlobalCompatAtIwahoriFixedPlaces"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean",
      "blob": "eebd76fca5538c7a0156cf330cedd4b663b0d70a",
      "lines": "24–46,53–79,84–171,192–193"
    }
  ],
  "obligationTree": {
    "name": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
    "status": "source-matched assembly; kernel replay open",
    "premises": [
      "GeoOne",
      "TLiftK"
    ],
    "children": [
      {
        "id": 13208115,
        "name": "coreAll_of",
        "children": [
          {
            "id": 13220887,
            "name": "seedFinOdd_of_geoOne"
          },
          {
            "id": 13232503,
            "name": "congFinOdd_of_ex",
            "children": [
              {
                "id": 13235287,
                "name": "wtLacEx_holds"
              }
            ]
          },
          {
            "name": "limFinOdd_of",
            "status": "source-only"
          },
          {
            "name": "toCoreK",
            "status": "source-only"
          },
          {
            "name": "coreAll_of_core",
            "status": "source-only"
          }
        ]
      },
      {
        "id": 13172410,
        "name": "rest",
        "children": [
          {
            "name": "galoisCompat_unlinkedSupport_of_spherical",
            "status": "source-only"
          },
          {
            "name": "localGlobalCompatAtIwahoriFixed_of_unlinked",
            "status": "source-only"
          },
          {
            "name": "galoisLocalGlobal_of_localGlobalCompatibility",
            "status": "source-only",
            "children": [
              {
                "name": "galoisLocalGlobal_of_placeClassCompatibility",
                "status": "source-matched conditional assembly"
              }
            ]
          }
        ]
      }
    ]
  },
  "tests": {
    "checks": 9519,
    "owners": 176,
    "path": 7,
    "type": 18,
    "value": 7,
    "weights": 9300,
    "negative": 5
  }
}
```
## Reproduce
Save JS block as verify.mjs, supply five raw report files in listed order. Native CLI hash check supplied, not executed here.
```js
import fs from "node:fs";import crypto from "node:crypto";
function check(ds){let n=0;const ck=(x)=>{if(!x)throw Error("assertion "+n);n++};let owners=new Map;for(const [i,d] of ds.entries()){ck(i===0?d.pin===undefined:d.pin==="40e56bab026552e089d7afcfeff08d2defb9c005");ck(d.root===14065054&&d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e");for(const r of d.reports){ck(!owners.has(r.id));owners.set(r.id,r)}}let r=owners.get(13235288);ck(r.request.name==="UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift");ck(r.type.expressionRoot===1004086648&&r.value.expressionRoot===1004086661);ck(r.type.references.length===18&&r.value.references.length===7&&r.structural.length===0);let last=14065054;ck(r.request.path.length===7);for(const e of r.request.path){let o=owners.get(e.owner);ck(e.owner===last&&e.role==="value"&&e.kind==="explicit_const");ck(o.value.expressionRoot===e.expressionRoot);ck(o.value.references.some(x=>x.target===e.target&&x.kind===e.kind&&x.witnessExpression===e.witness&&x.nameParts.join(".")===e.targetName));last=e.target}ck(last===r.id);const expected=[[13235287,1004086655],[13232503,1004086654],[13220887,1004086651],[13208115,1004086650],[13172410,1004086649],[13125905,1000528341],[13126169,1002626056]];r.value.references.forEach((x,i)=>ck(x.target===expected[i][0]&&x.witnessExpression===expected[i][1]&&x.distinctExpressionRecords===1));let weights=0;for(let a=1;a<=12;a++)for(let w=-12;w<=12;w++)for(let j=-15;j<=15;j++){let c=a-1,z=c+2*j,zc=2*c-2*w-z;ck((c-z)%2===0&&(c-zc)/2===w-(c-z)/2);weights++}return {checks:n,owners:owners.size,path:7,type:18,value:7,weights}}
const hs=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","deabbd86afc8f21d9897ba3bb74349178517fde3"];const p=process.argv.slice(2);if(p.length!==5)throw Error("need five reports");const d=p.map((x,i)=>{const b=fs.readFileSync(x);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==hs[i])throw Error("blob");return JSON.parse(b)});console.log(check(d));
```
RESUME HERE: obtain queued post34 projection compute/rh-post34-frontier-20261125/outputs/solution_post34_frontier.json; bind actual role references of coreAll_of (13208115) and rest (13172410) to source-only children; expand first unclaimed root-linked CoreAll supplier. HANDOFF TO Galois, dependencies, kernel, editor, audit, theta, literature. Full RH human proof OPEN.
