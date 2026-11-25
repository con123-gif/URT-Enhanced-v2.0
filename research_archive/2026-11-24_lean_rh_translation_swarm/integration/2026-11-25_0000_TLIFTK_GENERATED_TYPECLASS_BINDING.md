# TLiftK generated obligations: source and export-role binding — integration 00:00
2026-11-25. RESULT: PARTIAL / SOURCE-MATCHED mathematical reconstruction with authenticated direct reference evidence. One contribution: join the four formerly unexpanded generated proof owners to their pinned mathematical suppliers, retaining exact role slots and original statement. Not an exact raw type pretty-print, kernel replay or full RH proof.

## Evidence and reading order
RH pin 40e56bab026552e089d7afcfeff08d2defb9c005; current upstream observed 82c577caf1b8a66c76212d78a399234f55813d28 (2026-11-24 23:53:24 UTC), not adopted. Mathlib pin 0df444a360eaa60ab8c11dca51a86af692955474 from pinned lake-manifest.json. Working head observed 8e5ce707b458e819577700acc4e332732f21dedd. Prior integration 2110dc7ad48a142ebd843262588b9627b8e0fcb2, selected frontier 34. New dependency job 45508109328 PASS: 34/34 owners, 146 type and 324 value reference records, no unresolved requests, 1412 expression reads. This is projection, not kernel replay. Report blob deabbd86afc8f21d9897ba3bb74349178517fde3 (peer SHA256 3bed0b78f4f379e8721e3c9e855d335ddc04cba283f86744c11511e0e1bc0acd); earlier owner report d823c364f446f5066dbbc61f7e9cf9c891fcbdb2. Both from authenticated solution digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e. [Job](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45508109328).
Latest editor volume 14: [2026-11-24_2356_INTEGRATED_MANUSCRIPT.md](../specialists/proof_editor/2026-11-24_2356_INTEGRATED_MANUSCRIPT.md) blob e479bb14dbf87c90312ee7974d08fef2f55a22ac, links all preceding volumes. 169 primary + 14 supporting entries, not unique theorem coverage. Attach this chapter to its TLiftK/GeoOne root join (volume 1). Prior 34-target concordance remains evidence, not replaced. Four selected owners now have both role projections and source-supported supplier meanings; zero counted as independently replayed. All other 30 have newly projected roles but not translated by this contribution.

## Human mathematical argument
Let E be a field with NumberField E and IsCMField E, and F=maximalRealSubfield E. This is a subfield, not an arbitrary subring. The four generated theorems are not four additional substantive theta-lift assertions. The source and role evidence identifies the following typeclass infrastructure:
1. NumberField F: characteristic zero descends under the injective subfield inclusion; F is a Q-vector subspace of the finite-dimensional Q-space E and is therefore finite dimensional. Basic.lean:43–46,78–79 supplies NumberField.of_subfield by FiniteDimensional.left. The type references NumberField and maximalRealSubfield; value references of_subfield. The finite-dimensionality step does not need CM, though the original TLiftK still requires it.
2. IsDedekindDomain O_F: O_F is the integral closure of Z in F. Since F/Q is finite and characteristic zero (hence separable), the integral-closure theorem over the Dedekind domain Z gives the Dedekind-domain instance. Basic.lean:297–317 calls IsIntegralClosure.isDedekindDomain Z Q F. This is an application, not a reconstruction of that imported theorem. The generated body references the actual instance and NumberField.of_subfield.
3. IsFractionRing O_F F: every x in F is algebraic over Q. Write its monic polynomial x^m+sum a_i x^i=0, a_i rational. Choose a positive integer D clearing denominators of all a_i. Then y=Dx satisfies y^m+sum (D^(m-i) a_i)y^i=0 with integer coefficients, since m-i>=1. Thus y in O_F and x=y/D, D nonzero in characteristic zero. The inclusion O_F -> F is injective and all nonzero elements become units, so F is the fraction field. Native Basic.lean:277–278 invokes integralClosure.isFractionRing_of_finite_extension Q. This is a human derivation of the mathematical statement, not expansion of the imported Lean implementation.
4. The commuting scalar action: for a commutative semiring R and a semiring A equipped with Algebra R A, r acting on a*b equals (algebraMap r)*(a*b) = (a*algebraMap r)*b = a*(r acting on b). This proves SMulCommClass R A A with the native scalar actions; centrality, not commutativity of all A, is essential. Algebra/Basic.lean:420–434 gives the native producer. The export type mentions AF, NumberField.AdeleRing, instAlgebraAdeleRing and all three preceding generated proofs. The value mentions Algebra.to_smulCommClass and the native adele algebra. The likely exact specialization is R=F, A=AF F; Mathlib AdeleRing.lean:46–48 constructs the adele ring with Dedekind-domain, fraction-field and algebra assumptions and derives Algebra F. Exact AF alias definition and ordered raw binder/application tree have not been retrieved; do not present this specialization as a verbatim elaborated type. Source TLiftK:18–19 contains both identical Units.map ranges with AF F; precise generated occurrence binding requires raw expressions, not guessing from source order.

The original definition (HalfIndexLattices/TLiftK.lean:12–23) quantifies over every E, its field/number-field/CM instances, B:Base F E, and W.GoodK(cj E) B. For every natural n>=1 and X:Spc F E n satisfying X.J=1 and X.IsHerm(cj E) B n 0, there is a natural d0 such that for every d>=d0, W:Spc F E d and delta:E satisfying W.J=delta times I and W.IsSkew(cj E) B d 0, for every pair chiX,chiW:Chr F E and integer-valued infinite-place exponent functions mX,mW, assume both IsHecke, both ResEtaPow on the exact Units.map(algebraMap F (AF F)).toMonoidHom range (powers n,d respectively), and HasExp B.emb for each. For every complex submodule U of functions on UA E n and family lam of dominant weights at infinite places of F, assume IsAutRepU U, HasWeightAt U (B.emb w).1 (lam w) for every w, and d+mW(w)<=2*(lam w).w(k) for every w,k. Then there exists a complex submodule U' of functions on UA E d with IsLift B chiX chiW mX mW lam U U'. The four infrastructure proofs do not discharge this existential lift. The separate ThetaKernels/TLiftK.lean:4–5 theorem uses tLift_holds_k. All previous substantive theta and Galois obligations, imported axiom dependencies and full raw source-to-export equivalence remain open.

## Source ledger
- 40e56bab026552e089d7afcfeff08d2defb9c005 src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/TLiftK.lean — blob 4b36fc43e988270944cef2fc1b5e9ee1493fc275
- 40e56bab026552e089d7afcfeff08d2defb9c005 src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/ThetaKernels/TLiftK.lean — blob e9101ee7d8551561a1d6ca3b18fdcfe84dbfc713
- 0df444a360eaa60ab8c11dca51a86af692955474 Mathlib/NumberTheory/NumberField/Basic.lean — blob 241f20aa14f5f0bc718a147831e2d71bb520eea0
- 0df444a360eaa60ab8c11dca51a86af692955474 Mathlib/NumberTheory/NumberField/AdeleRing.lean — blob c88b4583107e9e07477a23531bb717a45c27b11d
- 0df444a360eaa60ab8c11dca51a86af692955474 Mathlib/Algebra/Algebra/Basic.lean — blob 81ec13d6fbf7c0290de4312d704db572f52c7171
The original source and Mathlib files were retrieved from exact revisions; connector blob IDs matched 5/5. No independent raw-byte hashing in V8. Failed attempts: root-level runner log/protocol 404 (corrected actual paths), GitHub current code search TLiftK returned incomplete zero hits (not evidence of absence), two guessed AF namespace-as-path files/directories 404, guessed Mathlib RingOfIntegers.lean 404 (actual instances in Basic.lean). Raw expression payload for four new owners not retrieved; no Lean execution, no source-to-export equivalence or exact elaborated statement claim. Native CLI below checks exact byte hashes before running the executed pure verifier. General Cathedral CI #403 PASS 23:49:53 UTC, run 45510487903, unrelated to RH proof. New commit CI not yet checked.

## Typed proof-obligation delta
Preserve complete selected records (including type/body root, all reference witnesses, role multiplicities, metadata and incoming root paths). All 4 records remain OPEN for raw type and independent replay. No transitive premises removed. Full 34-owner report remains upstream, no omission inferred.
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "mathlibPin": "0df444a360eaa60ab8c11dca51a86af692955474",
  "reportHashes": [
    "d823c364f446f5066dbbc61f7e9cf9c891fcbdb2",
    "deabbd86afc8f21d9897ba3bb74349178517fde3"
  ],
  "reportPaths": [
    "compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json",
    "compute/rh-34-producer-frontier-20261124/outputs/solution_34_producer_frontier.json"
  ],
  "root": 14065054,
  "owner": 13125905,
  "status": "PARTIAL_SOURCE_ROLE_BINDING",
  "checks": 385,
  "negativeControls": 7,
  "roleCounts": {
    "type": 69,
    "value": 53
  },
  "selected": [
    {
      "id": 13125906,
      "n": 1,
      "meaning": "NumberField F",
      "status": "SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",
      "supplier": "NumberField.of_subfield",
      "record": {
        "request": {
          "name": "UpperTheory.TP.TLiftK._proof_1",
          "id": 13125906,
          "kind": "thm",
          "origin": "authenticated_root_path_frontier",
          "incoming": {
            "owner": "UpperTheory.TP.TLiftK",
            "ownerId": 13125905,
            "role": "value",
            "kind": "explicit_const",
            "witness": 997980830
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
              "target": 13125905,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1000528341,
              "expressionRoot": 1062644804,
              "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
              "targetName": "UpperTheory.TP.TLiftK"
            },
            {
              "owner": 13125905,
              "target": 13125906,
              "role": "value",
              "kind": "explicit_const",
              "witness": 997980830,
              "expressionRoot": 997984088,
              "ownerName": "UpperTheory.TP.TLiftK",
              "targetName": "UpperTheory.TP.TLiftK._proof_1"
            }
          ]
        },
        "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
        "id": 13125906,
        "kind": "thm",
        "encodedRootsAndStructuralEdges": [
          9078397,
          9078405
        ],
        "type": {
          "expressionRoot": 9078396,
          "expressionsRead": 47,
          "childEdges": 64,
          "referenceOccurrences": 10,
          "peakPending": 9,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
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
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "value": {
          "expressionRoot": 9078404,
          "expressionsRead": 20,
          "childEdges": 24,
          "referenceOccurrences": 4,
          "peakPending": 6,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 435583,
              "nameParts": [
                "NumberField",
                "of_subfield"
              ],
              "targetKind": "thm",
              "witnessExpression": 9078397,
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
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "structural": [],
        "mutualBlock": [
          {
            "id": 13125906,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK",
              "_proof_1"
            ],
            "exported": true
          }
        ]
      }
    },
    {
      "id": 13125937,
      "n": 2,
      "meaning": "IsDedekindDomain (O_F)",
      "status": "SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",
      "supplier": "NumberField.RingOfIntegers.instIsDedekindDomain",
      "record": {
        "request": {
          "name": "UpperTheory.TP.TLiftK._proof_2",
          "id": 13125937,
          "kind": "thm",
          "origin": "authenticated_root_path_frontier",
          "incoming": {
            "owner": "UpperTheory.TP.TLiftK",
            "ownerId": 13125905,
            "role": "value",
            "kind": "explicit_const",
            "witness": 997980839
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
              "target": 13125905,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1000528341,
              "expressionRoot": 1062644804,
              "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
              "targetName": "UpperTheory.TP.TLiftK"
            },
            {
              "owner": 13125905,
              "target": 13125937,
              "role": "value",
              "kind": "explicit_const",
              "witness": 997980839,
              "expressionRoot": 997984088,
              "ownerName": "UpperTheory.TP.TLiftK",
              "targetName": "UpperTheory.TP.TLiftK._proof_2"
            }
          ]
        },
        "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
        "id": 13125937,
        "kind": "thm",
        "encodedRootsAndStructuralEdges": [
          9838916,
          9838922
        ],
        "type": {
          "expressionRoot": 9838915,
          "expressionsRead": 54,
          "childEdges": 72,
          "referenceOccurrences": 13,
          "peakPending": 10,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
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
              "target": 348070,
              "nameParts": [
                "IsDedekindDomain"
              ],
              "targetKind": "inductive",
              "witnessExpression": 9740115,
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
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "value": {
          "expressionRoot": 9838921,
          "expressionsRead": 54,
          "childEdges": 74,
          "referenceOccurrences": 12,
          "peakPending": 9,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 435583,
              "nameParts": [
                "NumberField",
                "of_subfield"
              ],
              "targetKind": "thm",
              "witnessExpression": 9078397,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 417457,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instIsDedekindDomain"
              ],
              "targetKind": "thm",
              "witnessExpression": 8609095,
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
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "structural": [],
        "mutualBlock": [
          {
            "id": 13125937,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK",
              "_proof_2"
            ],
            "exported": true
          }
        ]
      }
    },
    {
      "id": 13125938,
      "n": 3,
      "meaning": "IsFractionRing (O_F) F",
      "status": "SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",
      "supplier": "NumberField.RingOfIntegers.instIsFractionRing",
      "record": {
        "request": {
          "name": "UpperTheory.TP.TLiftK._proof_3",
          "id": 13125938,
          "kind": "thm",
          "origin": "authenticated_root_path_frontier",
          "incoming": {
            "owner": "UpperTheory.TP.TLiftK",
            "ownerId": 13125905,
            "role": "value",
            "kind": "explicit_const",
            "witness": 997980846
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
              "target": 13125905,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1000528341,
              "expressionRoot": 1062644804,
              "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
              "targetName": "UpperTheory.TP.TLiftK"
            },
            {
              "owner": 13125905,
              "target": 13125938,
              "role": "value",
              "kind": "explicit_const",
              "witness": 997980846,
              "expressionRoot": 997984088,
              "ownerName": "UpperTheory.TP.TLiftK",
              "targetName": "UpperTheory.TP.TLiftK._proof_3"
            }
          ]
        },
        "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
        "id": 13125938,
        "kind": "thm",
        "encodedRootsAndStructuralEdges": [
          9838938,
          9838944
        ],
        "type": {
          "expressionRoot": 9838937,
          "expressionsRead": 69,
          "childEdges": 94,
          "referenceOccurrences": 17,
          "peakPending": 10,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 386786,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instAlgebra_1"
              ],
              "targetKind": "def",
              "witnessExpression": 8609102,
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
              "target": 7441,
              "nameParts": [
                "CommRing",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209800,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 360211,
              "nameParts": [
                "IsFractionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8452731,
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
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "value": {
          "expressionRoot": 9838943,
          "expressionsRead": 54,
          "childEdges": 74,
          "referenceOccurrences": 12,
          "peakPending": 9,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 435583,
              "nameParts": [
                "NumberField",
                "of_subfield"
              ],
              "targetKind": "thm",
              "witnessExpression": 9078397,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 417477,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instIsFractionRing"
              ],
              "targetKind": "thm",
              "witnessExpression": 8609106,
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
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "structural": [],
        "mutualBlock": [
          {
            "id": 13125938,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK",
              "_proof_3"
            ],
            "exported": true
          }
        ]
      }
    },
    {
      "id": 13125939,
      "n": 4,
      "meaning": "SMulCommClass F A A (A=AF F; exact raw arguments pending)",
      "status": "SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",
      "supplier": "Algebra.to_smulCommClass",
      "record": {
        "request": {
          "name": "UpperTheory.TP.TLiftK._proof_4",
          "id": 13125939,
          "kind": "thm",
          "origin": "authenticated_root_path_frontier",
          "incoming": {
            "owner": "UpperTheory.TP.TLiftK",
            "ownerId": 13125905,
            "role": "value",
            "kind": "explicit_const",
            "witness": 997983762
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
              "target": 13125905,
              "role": "value",
              "kind": "explicit_const",
              "witness": 1000528341,
              "expressionRoot": 1062644804,
              "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
              "targetName": "UpperTheory.TP.TLiftK"
            },
            {
              "owner": 13125905,
              "target": 13125939,
              "role": "value",
              "kind": "explicit_const",
              "witness": 997983762,
              "expressionRoot": 997984088,
              "ownerName": "UpperTheory.TP.TLiftK",
              "targetName": "UpperTheory.TP.TLiftK._proof_4"
            }
          ]
        },
        "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
        "id": 13125939,
        "kind": "thm",
        "encodedRootsAndStructuralEdges": [
          997980876,
          997980884
        ],
        "type": {
          "expressionRoot": 997980875,
          "expressionsRead": 127,
          "childEdges": 186,
          "referenceOccurrences": 29,
          "peakPending": 16,
          "references": [
            {
              "kind": "explicit_const",
              "target": 13125938,
              "nameParts": [
                "UpperTheory",
                "TP",
                "TLiftK",
                "_proof_3"
              ],
              "targetKind": "thm",
              "witnessExpression": 997980846,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 386786,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instAlgebra_1"
              ],
              "targetKind": "def",
              "witnessExpression": 8609102,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 13125937,
              "nameParts": [
                "UpperTheory",
                "TP",
                "TLiftK",
                "_proof_2"
              ],
              "targetKind": "thm",
              "witnessExpression": 997980839,
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
              "target": 425483,
              "nameParts": [
                "NumberField",
                "instCommRingAdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8733954,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 424954,
              "nameParts": [
                "NumberField",
                "AdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8711357,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 7441,
              "nameParts": [
                "CommRing",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209800,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4078,
              "nameParts": [
                "CommSemiring",
                "toSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209807,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 13125906,
              "nameParts": [
                "UpperTheory",
                "TP",
                "TLiftK",
                "_proof_1"
              ],
              "targetKind": "thm",
              "witnessExpression": 997980830,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 560935,
              "nameParts": [
                "Formalism",
                "MainNotions",
                "GlobalTheoryTheory",
                "GenusMassVolumes",
                "AF"
              ],
              "targetKind": "def",
              "witnessExpression": 13430270,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4037,
              "nameParts": [
                "instDistribOfSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 90669,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4033,
              "nameParts": [
                "Distrib",
                "toMul"
              ],
              "targetKind": "def",
              "witnessExpression": 89792,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 10473,
              "nameParts": [
                "instSMulOfMul"
              ],
              "targetKind": "def",
              "witnessExpression": 330978,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 432711,
              "nameParts": [
                "NumberField",
                "instAlgebraAdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8972371,
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
              "target": 85948,
              "nameParts": [
                "Algebra",
                "toSMul"
              ],
              "targetKind": "def",
              "witnessExpression": 1197970,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 110448,
              "nameParts": [
                "SMulCommClass"
              ],
              "targetKind": "inductive",
              "witnessExpression": 3028215,
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
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "value": {
          "expressionRoot": 997980883,
          "expressionsRead": 113,
          "childEdges": 166,
          "referenceOccurrences": 25,
          "peakPending": 11,
          "references": [
            {
              "kind": "explicit_const",
              "target": 421661,
              "nameParts": [
                "NumberField",
                "maximalRealSubfield"
              ],
              "targetKind": "def",
              "witnessExpression": 9078380,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 435583,
              "nameParts": [
                "NumberField",
                "of_subfield"
              ],
              "targetKind": "thm",
              "witnessExpression": 9078397,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 400657,
              "nameParts": [
                "Subfield",
                "toField"
              ],
              "targetKind": "def",
              "witnessExpression": 8759110,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4684,
              "nameParts": [
                "Field",
                "toDivisionRing"
              ],
              "targetKind": "def",
              "witnessExpression": 224927,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399899,
              "nameParts": [
                "Subfield",
                "instSetLike"
              ],
              "targetKind": "def",
              "witnessExpression": 8748944,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 399888,
              "nameParts": [
                "Subfield"
              ],
              "targetKind": "inductive",
              "witnessExpression": 8748937,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 25327,
              "nameParts": [
                "SetLike",
                "instMembership"
              ],
              "targetKind": "def",
              "witnessExpression": 863513,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 5660,
              "nameParts": [
                "Membership",
                "mem"
              ],
              "targetKind": "def",
              "witnessExpression": 66990,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 2092,
              "nameParts": [
                "Subtype"
              ],
              "targetKind": "inductive",
              "witnessExpression": 23205,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 417477,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instIsFractionRing"
              ],
              "targetKind": "thm",
              "witnessExpression": 8609106,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 386786,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instAlgebra_1"
              ],
              "targetKind": "def",
              "witnessExpression": 8609102,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 417457,
              "nameParts": [
                "NumberField",
                "RingOfIntegers",
                "instIsDedekindDomain"
              ],
              "targetKind": "thm",
              "witnessExpression": 8609095,
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
              "target": 432711,
              "nameParts": [
                "NumberField",
                "instAlgebraAdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8972371,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 425483,
              "nameParts": [
                "NumberField",
                "instCommRingAdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8733954,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 424954,
              "nameParts": [
                "NumberField",
                "AdeleRing"
              ],
              "targetKind": "def",
              "witnessExpression": 8711357,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 7441,
              "nameParts": [
                "CommRing",
                "toCommSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209800,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 4078,
              "nameParts": [
                "CommSemiring",
                "toSemiring"
              ],
              "targetKind": "def",
              "witnessExpression": 209807,
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
              "target": 560935,
              "nameParts": [
                "Formalism",
                "MainNotions",
                "GlobalTheoryTheory",
                "GenusMassVolumes",
                "AF"
              ],
              "targetKind": "def",
              "witnessExpression": 13430270,
              "distinctExpressionRecords": 1
            },
            {
              "kind": "explicit_const",
              "target": 164561,
              "nameParts": [
                "Algebra",
                "to_smulCommClass"
              ],
              "targetKind": "thm",
              "witnessExpression": 3028221,
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
              "target": 3820,
              "nameParts": [
                "Field"
              ],
              "targetKind": "inductive",
              "witnessExpression": 216818,
              "distinctExpressionRecords": 1
            }
          ]
        },
        "structural": [],
        "mutualBlock": [
          {
            "id": 13125939,
            "nameParts": [
              "UpperTheory",
              "TP",
              "TLiftK",
              "_proof_4"
            ],
            "exported": true
          }
        ]
      }
    }
  ]
}
```

## Executed regression and reproducibility
V8 execution on actual connector-returned pinned sources and reports: 385 assertions passed, 32 literal source anchors, 7/7 negative controls rejected (root ID, wrong supplier, missing preceding instance dependency, wrong parent witness, wrong path role, changed threshold scope, multiplicity). These are evidence-binding checks, not finite tests of RH or proof equivalence. The 69 type + 53 value distinct-reference occurrences are selected only, not whole proof coverage. Preserve exact JSON and raw reports.
Extract following JS block to a .mjs file; invoke Node with arguments report1 report2 and the five source files in ledger order. CLI hash wrapper not run here; pure verify function executed in V8 as stated.
```js
function verify(docs,sources){
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",root=14065054,owner=13125905, digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";let checks=0;
 const ck=(x,m)=>{if(!x)throw Error(m);checks++};
 const [old,now]=docs;
 for(const d of docs){ck(d.pin===pin,"pin");ck(d.root===root,"root");ck(d.digest===digest,"archive digest");ck(d.status==="AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK","status")}
 ck(now.summary.requests===34&&now.summary.found===34&&now.reports.length===34,"34 census");ck(new Set(now.reports.map(r=>r.id)).size===34,"unique owners");
 const p=old.reports.find(r=>r.id===owner);ck(p&&p.value.expressionRoot===997984088,"owner root");
 const targets=[
 [13125906,1,9078396,9078404,997980830,435583,"NumberField.of_subfield",341190,"NumberField F"],
 [13125937,2,9838915,9838921,997980839,417457,"NumberField.RingOfIntegers.instIsDedekindDomain",348070,"IsDedekindDomain (O_F)"],
 [13125938,3,9838937,9838943,997980846,417477,"NumberField.RingOfIntegers.instIsFractionRing",360211,"IsFractionRing (O_F) F"],
 [13125939,4,997980875,997980883,997983762,164561,"Algebra.to_smulCommClass",110448,"SMulCommClass F A A (A=AF F; exact raw arguments pending)"]];
 const anchors=[
 [0,"def TLiftK : Prop :="],[0,"[Field E] [NumberField E] [IsCMField E]"],[0,"W.GoodK (cj E) B"],[0,"1 ≤ n"],[0,"X.J = 1"],[0,"X.IsHerm (cj E) B n 0"],[0,"∃ d₀ : ℕ, ∀ d, d₀ ≤ d"],[0,"W.J = δ •"],[0,"W.IsSkew (cj E) B d 0"],[0,"IsHecke (maximalRealSubfield E) E χX"],[0,"IsHecke (maximalRealSubfield E) E χW"],[0,"ResEtaPow (Units.map (algebraMap (maximalRealSubfield E) (AF (maximalRealSubfield E))).toMonoidHom).range χX n"],[0,"ResEtaPow (Units.map (algebraMap (maximalRealSubfield E) (AF (maximalRealSubfield E))).toMonoidHom).range χW d"],[0,"HasExp B.emb χX mX"],[0,"HasExp B.emb χW mW"],[0,"GlobalTheory.UnitaryBC.IsAutRepU U"],[0,"GlobalTheory.UnitaryBC.HasWeightAt U (B.emb w).1 (lam w)"],[0,"(d : ℤ) + mW w ≤ 2 * (lam w).w k"],[0,"IsLift B χX χW mX mW lam U U'"],[1,"theorem UpperTheory.TP.K.tLiftK : UpperTheory.TP.TLiftK :="],[1,"UpperTheory.TP.tLift_holds_k"],[2,"instance of_subfield [NumberField K] (E : Subfield K) : NumberField E where"],[2,"to_finiteDimensional := FiniteDimensional.left ℚ E K"],[2,"instance [NumberField K] : IsFractionRing (𝓞 K) K :="],[2,"integralClosure.isFractionRing_of_finite_extension ℚ _"],[2,"instance : IsDedekindDomain (𝓞 K) :="],[2,"IsIntegralClosure.isDedekindDomain ℤ ℚ K _"],[3,"[Algebra R K] [IsFractionRing R K] := InfiniteAdeleRing K × FiniteAdeleRing R K"],[3,"deriving CommRing, TopologicalSpace, IsTopologicalRing, Algebra K"],[4,"[Algebra R A] : SMulCommClass R A A :="],[4,"IsScalarTower.to_smulCommClass"],[4,"rw [algebra_compatible_smul A r (a • m), smul_smul, Algebra.commutes"]];
 for(const [i,s] of anchors)ck(sources[i].includes(s),"anchor "+s);
 let total={type:0,value:0},selected=[];
 for(const [id,n,tr,vr,w,supplier,sname,cls,meaning] of targets){
  const r=now.reports.find(z=>z.id===id);ck(r&&r.request.id===id&&r.kind==="thm","proof id/kind");ck(r.request.name===`UpperTheory.TP.TLiftK._proof_${n}`,"generated name");
  ck(r.type.expressionRoot===tr&&r.value.expressionRoot===vr,"role roots");
  ck(r.request.incoming.ownerId===owner&&r.request.incoming.witness===w&&r.request.incoming.role==="value","incoming");
  const parent=p.value.references.filter(a=>a.target===id);ck(parent.length===1&&parent[0].witnessExpression===w&&parent[0].distinctExpressionRecords===1&&parent[0].kind==="explicit_const","previous parent witness");
  let at=root;for(const e of r.request.path){ck(e.owner===at&&e.role==="value"&&e.kind==="explicit_const"&&Number.isSafeInteger(e.witness)&&Number.isSafeInteger(e.expressionRoot),"path edge");at=e.target}ck(at===id,"path endpoint");
  const e=r.request.path.at(-1);ck(e.owner===owner&&e.witness===w&&e.expressionRoot===p.value.expressionRoot,"path parent");
  ck(r.mutualBlock.length===1&&r.mutualBlock[0].id===id&&r.mutualBlock[0].exported===true,"mutual metadata");ck(r.structural.length===0,"no structural entries in selected owner");
  for(const role of ["type","value"]){let rr=r[role];let ids=new Set();let count=0;
   for(const a of rr.references){ck(a.kind==="explicit_const"&&Number.isSafeInteger(a.target)&&a.nameParts.length>0&&Number.isSafeInteger(a.witnessExpression)&&Number.isSafeInteger(a.distinctExpressionRecords)&&a.distinctExpressionRecords>0,"typed record");ck(!ids.has(a.target),"unique role target");ids.add(a.target);count+=a.distinctExpressionRecords}
   ck(count===rr.referenceOccurrences,"role multiplicity");ck(ids.has(421661),"maximalRealSubfield");total[role]+=count;
  }
  ck(r.type.references.some(a=>a.target===cls),"class in type");ck(r.value.references.some(a=>a.target===supplier&&a.nameParts.join(".")===sname&&a.targetKind==="thm"),"native supplier in body");
  ck(r.value.references.some(a=>a.target===435583),"number field inheritance in body");
  if(n===4){for(const q of [13125906,13125937,13125938])ck(r.type.references.some(a=>a.target===q),"proof4 type dependency "+q);ck(r.type.references.some(a=>a.target===560935),"AF type");ck(r.value.references.some(a=>a.target===432711),"adele algebra body")}
  selected.push({id,n,meaning,status:"SOURCE_AND_ROLE_MATCHED_RAW_TYPE_PENDING",supplier:sname,record:r});
 }
 ck(total.type===69&&total.value===53,"selected census");
 return {checks,total,selected,anchors:anchors.length,root,owner};
}
import fs from "node:fs";
import crypto from "node:crypto";
const expected=["d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","deabbd86afc8f21d9897ba3bb74349178517fde3","4b36fc43e988270944cef2fc1b5e9ee1493fc275","e9101ee7d8551561a1d6ca3b18fdcfe84dbfc713","241f20aa14f5f0bc718a147831e2d71bb520eea0","c88b4583107e9e07477a23531bb717a45c27b11d","81ec13d6fbf7c0290de4312d704db572f52c7171"];
const args=process.argv.slice(2);
if(args.length!==expected.length)throw Error("need two reports and five source files");
const data=args.map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==expected[i])throw Error("blob mismatch "+p);return b.toString("utf8")});
console.log(JSON.stringify(verify(data.slice(0,2).map(JSON.parse),data.slice(2)),null,2));
```

## Continuity and reviewer notes
Read SWARM_PROTOCOL first, AGENTS, state, actual runner log/protocol, continuity, handoff queue, prior 23:00 integration, editor 23:56, dependency 23:12, structure 23:24, audit 23:48 and all specialist recent checkpoints from commit patches. Latest: geometry 28e13dd, audit dbb81da, literature b753f44, boxes 3b2dbb9, math ac54d32, Galois eb1e710, theta c0904ac, structure ca5a04d, Landau f800e76, prime 91ec9fc, dependencies 9a967ec, kernel 561baec, acceleration 845139f and 250d79b. Read older RUN9 directory notes before discovering current RUN17/RUN18 commits. Nested Grok swarm and external blueprint not reread; no reliance on their claims. Kernel RUN17 raw slicer separate task; send exact type/value roots 13125906:9078396/9078404, 13125937:9838915/9838921, 13125938:9838937/9838943, 13125939:997980875/997980883. No new independent reviewer sign-off; request review of exact proof4 argument order and alias. Preserve prior finding that target-set comparison cannot detect missing role edges. No URT performance claim or physics changes.

RESUME HERE: kernel lane should feed the eight exact roots above into the existing raw slicer, using already authenticated archive/offset index, then verify ordered binders and AF alias against TLiftK lines 18–19; integration next expands the newly projected galoisLocalGlobal_of_geometry_lift producer (ID 13235288) with exact source and its typed references, coordinating with Galois lane. HANDOFF TO kernel, Galois, theta, dependency, editor, audit, structure. Project OPEN.
