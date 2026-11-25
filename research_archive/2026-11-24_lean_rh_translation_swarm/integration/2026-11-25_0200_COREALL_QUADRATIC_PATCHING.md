# CoreAll assembly and quadratic patching: integration 02:00
2026-11-25 — PARTIAL / SOURCE-MATCHED human reconstruction. One contribution: the actual Inp-to-CoreAll assembly and its existence branch ex_all_of_good. No Lean replay or claim of independent full proof.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream main observed 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061; not adopted, semantic equivalence not checked. Attach after geometry-lift bridge (previous integration 4f08b858276541b942e6d007b33b6eceb8fd58a3), before rest/Row0. Existing manuscript volume XVI: ../specialists/proof_editor/2026-11-25_0156_INTEGRATED_MANUSCRIPT.md (8dec30184d1e4ec262da419408ce29715038ca20). No new full-project percentage. Existing 177+16 prior volume entries not a completion metric.
Continuity: SWARM_PROTOCOL first, AGENTS, state, actual runner log/protocol, continuity, handoff, latest 15 principal lane checkpoints (some files are .mjs rather than Markdown); editor volume XVI; dependencies 32d64e9, structure 167b33e, audit 1dfdae1, math d866eb3, boxes RUN19 0f1e20f, Galois RUN19 8f10660, kernel RUN19 ec46488, Landau RUN19 4d81b2a, literature RUN19 cb3bd42, acceleration RUN19 5c85f2a, geometry RUN20 41afb0c, prime RUN19 07f4b0c, theta RUN19 da8bb00, integration previous above. Grok green regular RUN8 b600c82 is distinct. General CI checkpoint 410 PASS (02:03:57 UTC, run 45527764744), not RH verification. Blueprint not reread. No unrelated files changed.
Post34 compute status PASS (run 45516475333, source commit 84f21851ddf1a3259b4f713674c39ffe08da6047): 151/151 owners, 357 type edges, 7261 value edges, no unresolved requests, 526917 expression reads. Output solution_post34_frontier.json 3058217 bytes, SHA256 2cd911a88341ad57d0e85090af4e4f58748046d9e49e2b2cb26945ea526230ff. Fetch of this full file rejected as too large (HTTP400); direct curl failed DNS. Cannot independently authenticate outgoing roles from that file yet; prior authenticated incoming records are retained unchanged below. Metadata listing initially failed due file response interpreted as JSON and trailing slash; corrected directory queries returned Git blob IDs for five files, dev blob retained from prior chapter. No locally rehashed source or full export. Source-term dependency edges deliberately separated from exported explicit_const records.

## Human proof: CoreAll
Use definitions CyclicStrongAtCusp L75–96. Core is Ex(.csd) plus SphericalLevelCondition(.csd,c) for every c in {unr,dR,crys,phi}; CoreAll replaces .csd by .all. The condition quantifies over CM number field E, algebraic closure Ω with its field and algebra structures, prime ℓ, isomorphism ι:Qbar_ℓ≃C, a≥1, cusp π and character χ of the maximal real subfield, InScope(s,ℓ,π,χ), representation r with Weak π ι r, every place w satisfying PlaceOK(s,w), and every multiset B of nonzero complex Satake parameters satisfying HasSat. The four conclusions are: away-ℓ Frobenius eigenvalues guarded by ℓ not in w; the de Rham clause; the crystalline clause; and equality of WD characteristic polynomials for all Weil g with the local bridge, tied period data, valuation subring, coefficient ring and Induces hypothesis of SphAt. This is NOT a blanket compatibility claim for arbitrary local components.
Development L20–25 first obtains Core from toCoreK(up)(congPhi_holds)(descOffT)(limFinOdd_of(seed,cong)); the wrapper CoreAllOfRowStarCore L4–5 supplies inp_holds. Inp is an eleven-field proposition (OfInputs L6–17): Jacquet–Shalika rigidity, Gelfand–Kazhdan duality, irreducible admissibility, finite length of standard functors, Langlands exhaustion, Zelevinsky polynomial ring, generic unitary dual, Arthur–Clozel strong TC, Hecke ℓ-adic character above ℓ, algebraic character WD, de Rham potentially semistable. InputsOf L11–20 names all eleven producers, none dropped.
Given Inp and Core=(hex,hh), CoreAllOfRowStarCoreInp L538–550 constructs exg=ex_good_of_ex_csd(automorphicFormsFiniteGL,hex); unrg=holdsS_good_unr(Inp,hh(unr)); crysg=holdsS_good_crys(Inp,hh(crys)). Ex(.all)=ex_all_of_good(Inp,exg,unrg). For arbitrary c, exhaustive case elimination gives:
- unr: holdsS_all_unr(Inp,unrg).
- dR: holdsS_dR_all_of_good(Inp,holdsS_good_dR_of_csd(Inp,hh(dR))).
- crys: holdsS_all_crys(Inp,crysg).
- phi: holdsS_all_phi(Inp,crysg,holdsS_good_phi(Inp,hh(crys),hh(phi))). The phi branch explicitly needs crystalline data at BOTH levels, not only the phi condition.
Pair the existence and universal condition. This is a proof of the assembler conditional on its named suppliers. No replacement by the similarly named GlobalTheory.RoadU.coreAll_of_core (different Inputs with additional fields).

## Ex(.all) branch, exact quadratic-field selection (L466–521)
Fix the complete native Ex context (E,Ω,ℓ,ι,a≥1,π,χ, InScope .all). Keep hreg,hpol, the hypotheses Inp, Ex(.good), good.unr. Let S be the set of Q in QCM E Ω for which a cusp P over Q.K is both a lift of π and Good(ℓ,P).
1. The native infinite_qcm_split_good family fam(w) has for each place w an infinite collection of quadratic CM extensions with the required decomposition inclusion at w, splitting above w, a ramified spherical place (for the lift), and goodness of every lift. quadLift(Inp.ac,Inp.js) supplies a lift P from the ramified-spherical condition; the goodness clause makes Q a member of S. The proof uses an actual height-one place v0, obtained from a maximal ideal of the ring of integers not a field, to deduce S infinite. This does not assume S nonempty by definition.
2. For each Q in S choose a lift P_Q with its two witnesses. LiftPolar.main(automorphicFormsFiniteGL,Inp.js,Inp.gk,…) supplies a polarizing χ'_Q and regularity; together with goodness this gives InScope(.good,ℓ,P_Q,χ'_Q). Apply Ex(.good) to obtain r_Q with Weak(P_Q,ι,r_Q). Choice of all P,χ',r retains witnesses.
3. CMBasePatch.main with the infinite S and family (P_Q,r_Q) produces one continuous semisimple ρ over E and eventual (cofinite on S) RepIso(r_Q,ρ restricted to Q.K). Do not assert patching for all Q. Select Q0 from that eventual property (the subtype S is infinite) and use ConjUnr.unr_of_conj_res on the eventual unramified clause of r_Q0 to obtain eventual unramifiedness hunr of ρ.
4. The places dividing ℓ are finite: span{ℓ} is nonzero since ℓ prime and nonzero in the characteristic-zero integer ring; Ideal.finite_factors yields cofinite hlf away from ℓ. eventual_hasSatGL_locRep gives cofinite hsat. For any fixed w, let F be the image under subtype.val of the finite exceptional set {Q∈S : not RepIso(r_Q,ρ|Q.K)}. The infinite family fam(w) minus F is nonempty. Pick Q there. The ramified-spherical and goodness properties imply Q∈S independently of RepIso. If RepIso failed, its subtype witness would put Q in F, contradiction. Thus decomposition inclusion, splitting above w, and the actual isomorphism coexist for THIS w. Q may vary with w; ρ must not.
5. On the intersection of the three cofinite sets hlf, hsat, hunr, choose B from hsat and use step 4. Apply the good.unr hypothesis at each w' above w using hsplit and the transported Satake witness hB'. Apply frobEig_of_dec with the lift, B, RepIso, unramifiedness, and decomposition inclusion to descend the Frobenius eigenvalues to ρ. This establishes the eventual compatibility needed by Weak (in addition to continuity and semisimplicity in the native Ex result). The exact statement of CMBasePatch.main and frobEig_of_dec remain named proof obligations rather than assumptions promoted to unconditional facts.

Key point: cofinite patching alone is insufficient to obtain the needed local comparison at a specified place; the infinite place-specific family minus the image of the finite exceptional set supplies a compatible extension. Do not exchange ∀w∃Q with ∃Q∀w or weaken any decomposition/splitting requirement. The finite test below verifies the avoidance combinatorics only, not existence of the number fields or patching theorem.
## Source-bound dependency graph, typed obligation tree
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "archiveDigest": "5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e",
  "root": 14065054,
  "authenticatedIncoming": {
    "owner": 13235288,
    "expressionRoot": 1004086661,
    "role": "value",
    "references": [
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
      }
    ],
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
  "sourceOnlyEdges": [
    {
      "owner": "coreAll_of",
      "target": "coreAll_of_core",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of",
      "target": "toCoreK",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of",
      "target": "limFinOdd_of",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core",
      "target": "inp_holds",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core",
      "target": "coreAll_of_core_inp",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "ex_good_of_ex_csd",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_good_unr",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_good_crys",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "ex_all_of_good",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_all_unr",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_good_dR_of_csd",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_dR_all_of_good",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_all_crys",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_good_phi",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "coreAll_of_core_inp",
      "target": "holdsS_all_phi",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "infinite_qcm_split_good",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "quadLift",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "LiftPolar.main",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "CMBasePatch.main",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "unr_of_conj_res",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    },
    {
      "owner": "ex_all_of_good",
      "target": "frobEig_of_dec",
      "role": "source-term",
      "status": "source-only; exact exported role pending"
    }
  ],
  "typedObligations": {
    "conclusion": "CoreAll",
    "premises": [
      "Inp (11 fields)",
      "Core = Ex .csd and all four csd spherical conditions"
    ],
    "branches": [
      {
        "type": "existence",
        "conclusion": "Ex .all",
        "requires": [
          "Ex .good",
          "SphericalLevelCondition .good .unr",
          "Inp",
          "ex_all_of_good"
        ]
      },
      {
        "type": "unr",
        "requires": [
          "holdsS_all_unr",
          "good.unr"
        ]
      },
      {
        "type": "dR",
        "requires": [
          "holdsS_dR_all_of_good",
          "holdsS_good_dR_of_csd",
          "csd.dR"
        ]
      },
      {
        "type": "crys",
        "requires": [
          "holdsS_all_crys",
          "good.crys"
        ]
      },
      {
        "type": "phi",
        "requires": [
          "holdsS_all_phi",
          "good.crys",
          "holdsS_good_phi",
          "csd.crys",
          "csd.phi"
        ]
      }
    ]
  },
  "sources": [
    {
      "key": "dev",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/Development.lean",
      "blob": "4d4d9506494734f28fce7d39bac1a50650ecf148",
      "anchors": [
        "theorem coreAll_of (seed : SeedFinOdd) (cong : CongFinOdd) (up : UpperTheory.TP.TLiftK)",
        "theorem rest (h : GlobalTheory.RoadU.CoreAll)",
        "Inp.coreAll_of_core",
        "Core.toCoreK up",
        "Lim.limFinOdd_of seed cong"
      ]
    },
    {
      "key": "wrap",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCore.lean",
      "blob": "a4054e96f51401b00acb7a5443040abdc94fa549",
      "anchors": [
        "coreAll_of_core_inp UpperTheory.Gal.Int.Inp.inp_holds"
      ]
    },
    {
      "key": "core",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean",
      "blob": "894cd3878a45a90662e07a57502169d65829ca79",
      "anchors": [
        "have exg : Ex .good",
        "have unrg : SphericalLevelCondition .good .unr",
        "have crysg : SphericalLevelCondition .good .crys",
        "ex_all_of_good hI exg unrg",
        "| unr => exact UpperTheory.Gal.Int.Inp.holdsS_all_unr hI unrg",
        "| dR => exact UpperTheory.Gal.Int.Inp.holdsS_dR_all_of_good hI (UpperTheory.Gal.Int.Inp.holdsS_good_dR_of_csd hI (hh .dR))",
        "| crys => exact UpperTheory.Gal.Int.Inp.holdsS_all_crys hI crysg",
        "| phi => exact UpperTheory.Gal.Int.Inp.holdsS_all_phi hI crysg (UpperTheory.Gal.Int.Inp.holdsS_good_phi hI (hh .crys) (hh .phi))",
        "let S : Set (GlobalTheory.RealGal.QCM E Ω)",
        "have hS : S.Infinite",
        "haveI : Infinite ↥S := hS.to_subtype",
        "CMBasePatch.main",
        "have hfin := (Filter.eventually_cofinite.1 hev).image Subtype.val",
        "((fam w).diff hfin).nonempty",
        "exact hQn ⟨⟨Q, hQS⟩, hc, rfl⟩",
        "filter_upwards [hlf, hsat, hunr]",
        "exact frobEig_of_dec",
        "rw [tw_tw_inv] at h2",
        "field_simp"
      ]
    },
    {
      "key": "inp",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/OfInputs.lean",
      "blob": "f400e69e7e620958ac2e9205be7f20107d26b829",
      "anchors": [
        "structure Inp : Prop where",
        "js : GlobalTheory.Published.JacquetShalikaRigidity",
        "gk : GlobalTheory.Published.GelfandKazhdanDual",
        "adm : GlobalTheory.Published.IrreducibleAdmissibleGL",
        "len : GlobalTheory.Published.StandardFunctorsFiniteLength",
        "exh : GlobalTheory.Published.LanglandsExhaustionGL",
        "zel : GlobalTheory.Published.ZelevinskyPolynomialRing",
        "gen : GlobalTheory.Published.GenericUnitaryDualGL",
        "ac : GlobalTheory.Published.ArthurClozelStrongTC",
        "hk : GlobalTheory.Published.HeckeLAdicCharacterAbove",
        "alg : GlobalTheory.Published.AlgebraicCharacterWD",
        "pst : GlobalTheory.Published.DeRhamPotSemistable"
      ]
    },
    {
      "key": "inps",
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/InputsOf.lean",
      "blob": "39070d3b7c9ac51c51d6dc2115ee4f027fc850cc",
      "anchors": [
        "theorem inp_holds : Inp := ⟨js, gk, adm, len, exh, zel, gen, ac, hk, alg, pst⟩"
      ]
    },
    {
      "key": "def",
      "path": "src/Development/AbelianVarietyTheory/Definitions/GaloisGeometry/CyclicStrongAtCusp.lean",
      "blob": "8b43b079fcf131124b5d37f7a237c8594e84e0ba",
      "anchors": [
        "def Core : Prop := Ex .csd ∧ ∀ c, SphericalLevelCondition .csd c",
        "def CoreAll : Prop := Ex .all ∧ ∀ c, SphericalLevelCondition .all c",
        "| unr | dR | crys | phi",
        "InScope s l π χ → ∀ r",
        "Weak π ι r → ∀ w, PlaceOK s w",
        "(CG.mk π).HasSat w B → SphAt c π ι r w B"
      ]
    }
  ],
  "tests": {
    "checks": 59041,
    "sourceFiles": 6,
    "anchors": 44,
    "finite": 58975,
    "negative": 4
  }
}
```
## Executed checks and reproduction
V8 connector-fetched sources: {"checks":59041,"sourceFiles":6,"anchors":44,"finite":58975,"negative":4}. Four negative controls remove phi branch, pst premise, PlaceOK guard, and exceptional-set contradiction. Finite avoidance checks exhaust nonempty differences of subsets of an eight-element set. No Lean build run; no theorem-level independent reviewer sign-off for this chapter. Prior independent kernel audit preserves role multiplicities; no axiom census change, no URT advantage claimed.
Replay JS (supply source map ss using each pinned path, graph g from previous integration chapter and spec from JSON sources mapped to [key,path,blob,anchors]):
```js
function verify(spec,ss,g){let n=0,finite=0,negative=0;function ck(b,m){if(!b)throw Error(m);n++}for(const [k,p,sha,anchors] of spec){ck(sha.length===40,"source metadata");for(const a of anchors)ck(ss[k].includes(a),k+":"+a)}ck(g.root===14065054&&g.pin==="40e56bab026552e089d7afcfeff08d2defb9c005","prior root");const r=g.selectedOwner;ck(r.id===13235288&&r.value.expressionRoot===1004086661,"owner");for(const [id,w] of [[13208115,1004086650],[13172410,1004086649]])ck(r.value.references.some(x=>x.kind==="explicit_const"&&x.target===id&&x.witnessExpression===w&&x.distinctExpressionRecords===1),"incoming role");let prev=g.root;for(const e of r.request.path){ck(e.owner===prev&&e.role==="value"&&e.kind==="explicit_const","path");prev=e.target}ck(prev===r.id,"endpoint");
for(let fam=1;fam<256;fam++)for(let bad=0;bad<256;bad++){let diff=fam&~bad&255;if(!diff)continue;let q=diff&-diff;ck((fam&q)!==0&&(bad&q)===0,"finite avoidance");finite++}
for(const [k,a] of [["core","| phi => exact"],["inp","pst : GlobalTheory.Published.DeRhamPotSemistable"],["def","PlaceOK s w"],["core","hQn ⟨⟨Q, hQS⟩, hc, rfl⟩"]]){let rejected=false;try{let s={...ss,[k]:ss[k].replace(a,"__removed__")};for(const [key,p,sha,anchors] of spec)for(const x of anchors)if(!s[key].includes(x))throw Error("anchor")}catch{rejected=true}ck(rejected,"negative mutation");negative++}
return {checks:n,sourceFiles:spec.length,anchors:spec.reduce((n,x)=>n+x[3].length,0),finite,negative}}
```
## RESUME HERE
Request a compact authenticated projection containing complete type/value/structural records for 13208115 coreAll_of and 13172410 rest from the existing 151-owner output (no archive rescan); compare against source-only children above. Expand exact CMBasePatch.main producer and its cofinite RepIso guarantee only if not already covered in Galois peer lane. HANDOFF TO dependency, Galois, kernel, editor, audit, acceleration. Full human-readable RH proof OPEN.
