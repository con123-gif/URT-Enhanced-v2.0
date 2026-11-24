/* DEPENDENCIES 2026-11-24 23:12 UTC — PARTIAL; exact next manifest, native full projection pending.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; pinned Main.lean retrieved blob dbd5db70bc11b35f18fa5751216ab335321e7bfc; upstream main 9282d3a102c4aff0e6026746db2a8990f5d9cddd not adopted. Observed working base 561baec2302910ec9344fd77bab33f51ca8960fc. Read protocol/handoff, AGENTS, state/continuity/runner protocol/log excerpts, CI #401, integration 23:00, kernel RUN17, structure/math/audit and acceleration/Grok checkpoints; blueprint not reopened. No physical edits.
Prior projection 71/71 PASS run 45489010764; reuse four immutable reports and prior reconciler, do not repeat mixed closure. V8 actual-report replay and manifest tests: {"priorChecks":92617,"newChecks":10,"negative":6,"targets":34,"pathEdges":231,"uniquePathEdges":50,"generated":4,"ms":96}. Four TLiftK generated proof targets prioritized with exact IDs, not assumed field mappings. Peer kernel RUN17 raw slicer handles separate already-known roots; this job projects previously unexpanded theorem producers, not raw expression pretty-printing. New full projection and Node CLI not yet run. Unchanged projection core previously tested on genuine Lean fixture; fixture re-fetch from working repo failed 404 this session, no fresh fixture test claimed. No independent kernel recheck, no hypotheses/axioms discarded, no new URT timing claim. Fixed batch scan expected O(input bytes + expanded name bytes + sum of role-specific expression reads/edges); memory 12-byte disk records, parser and per-role visited sets, plus outputs. Full universal all-owner projection is not demonstrated O(N).
Reproduce: node rh_34_producer_frontier.mjs verify-manifest direct.json frontier.json next.json literature.json ; node rh_34_producer_frontier.mjs --out /tmp/rh34
RESUME HERE: retrieve compute/rh-34-producer-frontier-20261124/status.json and outputs/solution_34_producer_frontier.json from cathedral-research-state. Check 34 exact IDs and types/value roles; send four TLiftK generated type/value root IDs to kernel/editor for raw slicing and field binding. HANDOFF TO kernel, theta, Galois, literature, editor, integration, audit. RH human proof OPEN.
*/
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import crypto from "node:crypto";
import {fileURLToPath} from "node:url";
import {spawnSync} from "node:child_process";
const here=path.dirname(fileURLToPath(import.meta.url));
const requests=[
  {
    "name": "UpperTheory.LiteratureTheorems.local_langlands_gl_recT_exists_of_literature",
    "id": 8477096,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 685292527
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 8477096,
        "role": "value",
        "kind": "explicit_const",
        "witness": 685292527,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.local_langlands_gl_recT_exists_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_literature",
    "id": 11274889,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 891403535
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 11274889,
        "role": "value",
        "kind": "explicit_const",
        "witness": 891403535,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.ar_degree_of_literature",
    "id": 11148669,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073876
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 11148669,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073876,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.ar_degree_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.point_separation_pair_of_literature",
    "id": 11134501,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073873
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 11134501,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073873,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.point_separation_pair_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.semi_abelian_lie_seminegative_of_literature",
    "id": 11090272,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073870
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 11090272,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073870,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.semi_abelian_lie_seminegative_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.toroidal_for_fan_ks_of_literature",
    "id": 11080156,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073867
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 11080156,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073867,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.toroidal_for_fan_ks_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.siegel_toroidal_integral_of_literature",
    "id": 10951735,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073864
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 10951735,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073864,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.siegel_toroidal_integral_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.nef_rr_of_literature",
    "id": 10575871,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073861
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 10575871,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073861,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.nef_rr_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.zarhin_statement",
    "id": 10575034,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073858
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 10575034,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073858,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.zarhin_statement"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.fargues_exact_of_literature",
    "id": 10523616,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073855
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 10523616,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073855,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.fargues_exact_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.poincare_lelong_inv_of_literature",
    "id": 10419805,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073848
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 10419805,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073848,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.poincare_lelong_inv_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.principalisation_char_zero_of_literature",
    "id": 10383261,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073845
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 10383261,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073845,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.principalisation_char_zero_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.resolution_char_zero_of_literature",
    "id": 10381888,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073842
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 10381888,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073842,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.resolution_char_zero_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature",
    "id": 9013533,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073833
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 9013533,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073833,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.published_results_first",
    "id": 8797770,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073828
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 8797770,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073828,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.published_results_first"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.published_results_eigen",
    "id": 8728574,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "ownerId": 11298208,
      "role": "value",
      "kind": "explicit_const",
      "witness": 893073825
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 11298208,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980691,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"
      },
      {
        "owner": 11298208,
        "target": 8728574,
        "role": "value",
        "kind": "explicit_const",
        "witness": 893073825,
        "expressionRoot": 893073889,
        "ownerName": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
        "targetName": "UpperTheory.LiteratureTheorems.published_results_eigen"
      }
    ]
  },
  {
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
  {
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
  {
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
  {
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
  {
    "name": "UpperTheory.TP.tools_holds_k",
    "id": 14065047,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.TP.tLift_holds_k",
      "ownerId": 14065048,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212048
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
        "target": 14065049,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212053,
        "expressionRoot": 1065212054,
        "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
        "targetName": "UpperTheory.TP.K.tLiftK"
      },
      {
        "owner": 14065049,
        "target": 14065048,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212051,
        "expressionRoot": 1065212051,
        "ownerName": "UpperTheory.TP.K.tLiftK",
        "targetName": "UpperTheory.TP.tLift_holds_k"
      },
      {
        "owner": 14065048,
        "target": 14065047,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212048,
        "expressionRoot": 1065212050,
        "ownerName": "UpperTheory.TP.tLift_holds_k",
        "targetName": "UpperTheory.TP.tools_holds_k"
      }
    ]
  },
  {
    "name": "UpperTheory.TP.tLift_of_tools_k",
    "id": 14019846,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.TP.tLift_holds_k",
      "ownerId": 14065048,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1065212047
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
        "target": 14065049,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212053,
        "expressionRoot": 1065212054,
        "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
        "targetName": "UpperTheory.TP.K.tLiftK"
      },
      {
        "owner": 14065049,
        "target": 14065048,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212051,
        "expressionRoot": 1065212051,
        "ownerName": "UpperTheory.TP.K.tLiftK",
        "targetName": "UpperTheory.TP.tLift_holds_k"
      },
      {
        "owner": 14065048,
        "target": 14019846,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212047,
        "expressionRoot": 1065212050,
        "ownerName": "UpperTheory.TP.tLift_holds_k",
        "targetName": "UpperTheory.TP.tLift_of_tools_k"
      }
    ]
  },
  {
    "name": "UpperTheory.Gal.Int.Geo.weight_one_geometric_realization",
    "id": 14009156,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Gal.Int.Geo.geoOne_holds",
      "ownerId": 14009157,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644798
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
        "target": 14009157,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1062644801,
        "expressionRoot": 1062644804,
        "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
        "targetName": "UpperTheory.Gal.Int.Geo.geoOne_holds"
      },
      {
        "owner": 14009157,
        "target": 14009156,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1062644798,
        "expressionRoot": 1062644799,
        "ownerName": "UpperTheory.Gal.Int.Geo.geoOne_holds",
        "targetName": "UpperTheory.Gal.Int.Geo.weight_one_geometric_realization"
      }
    ]
  },
  {
    "name": "UpperTheory.Gal.Int.Geo.geometric_realization_of_weight_one",
    "id": 13967295,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.Gal.Int.Geo.geoOne_holds",
      "ownerId": 14009157,
      "role": "value",
      "kind": "explicit_const",
      "witness": 1062644797
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
        "target": 14009157,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1062644801,
        "expressionRoot": 1062644804,
        "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
        "targetName": "UpperTheory.Gal.Int.Geo.geoOne_holds"
      },
      {
        "owner": 14009157,
        "target": 13967295,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1062644797,
        "expressionRoot": 1062644799,
        "ownerName": "UpperTheory.Gal.Int.Geo.geoOne_holds",
        "targetName": "UpperTheory.Gal.Int.Geo.geometric_realization_of_weight_one"
      }
    ]
  },
  {
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
  {
    "name": "UpperTheory.LiteratureTheorems.hecke_tate_functional_equation_of_open",
    "id": 13125896,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "ownerId": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980667
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13125897,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature"
      },
      {
        "owner": 13125897,
        "target": 13125896,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980667,
        "expressionRoot": 997980670,
        "ownerName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
        "targetName": "UpperTheory.LiteratureTheorems.hecke_tate_functional_equation_of_open"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.partial_zeta_functional_equation_of_open",
    "id": 13125895,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "ownerId": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980664
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13125897,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature"
      },
      {
        "owner": 13125897,
        "target": 13125895,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980664,
        "expressionRoot": 997980670,
        "ownerName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
        "targetName": "UpperTheory.LiteratureTheorems.partial_zeta_functional_equation_of_open"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.siegel_klingen_deligne_ribet_of_open",
    "id": 13125894,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "ownerId": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980661
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13125897,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature"
      },
      {
        "owner": 13125897,
        "target": 13125894,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980661,
        "expressionRoot": 997980670,
        "ownerName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
        "targetName": "UpperTheory.LiteratureTheorems.siegel_klingen_deligne_ribet_of_open"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.hilbert_class_field_j_of_open",
    "id": 13125892,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "ownerId": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980658
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13125897,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature"
      },
      {
        "owner": 13125897,
        "target": 13125892,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980658,
        "expressionRoot": 997980670,
        "ownerName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
        "targetName": "UpperTheory.LiteratureTheorems.hilbert_class_field_j_of_open"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.elliptic_main_theorem_cm_of_open",
    "id": 13125891,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "ownerId": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980655
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13125897,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature"
      },
      {
        "owner": 13125897,
        "target": 13125891,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980655,
        "expressionRoot": 997980670,
        "ownerName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
        "targetName": "UpperTheory.LiteratureTheorems.elliptic_main_theorem_cm_of_open"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.dual_abelian_scheme_of_open",
    "id": 13096374,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "ownerId": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980644
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13125897,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature"
      },
      {
        "owner": 13125897,
        "target": 13096374,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980644,
        "expressionRoot": 997980670,
        "ownerName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
        "targetName": "UpperTheory.LiteratureTheorems.dual_abelian_scheme_of_open"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.abelian_de_rham_of_open",
    "id": 13096369,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "ownerId": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 995913394
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13125897,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature"
      },
      {
        "owner": 13125897,
        "target": 13096369,
        "role": "value",
        "kind": "explicit_const",
        "witness": 995913394,
        "expressionRoot": 997980670,
        "ownerName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
        "targetName": "UpperTheory.LiteratureTheorems.abelian_de_rham_of_open"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_open",
    "id": 13096371,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
      "ownerId": 13125897,
      "role": "value",
      "kind": "explicit_const",
      "witness": 997980639
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13125897,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980678,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature"
      },
      {
        "owner": 13125897,
        "target": 13096371,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980639,
        "expressionRoot": 997980670,
        "ownerName": "UpperTheory.One.Join.cm_abelian_inputs_from_literature",
        "targetName": "UpperTheory.LiteratureTheorems.grothendieck_deformation_of_open"
      }
    ]
  },
  {
    "name": "UpperTheory.LiteratureTheorems.galois_cohomology_from_literature",
    "id": 13096367,
    "kind": "thm",
    "origin": "authenticated_root_path_frontier",
    "incoming": {
      "owner": "UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm",
      "ownerId": 13096368,
      "role": "value",
      "kind": "explicit_const",
      "witness": 995913380
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
        "target": 13125901,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1065212055,
        "expressionRoot": 1065212057,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
        "targetName": "UpperTheory.FinalTheorems.everyCharacter_of_row"
      },
      {
        "owner": 13125901,
        "target": 13125899,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980696,
        "expressionRoot": 997980699,
        "ownerName": "UpperTheory.FinalTheorems.everyCharacter_of_row",
        "targetName": "UpperTheory.One.vwin_of_row"
      },
      {
        "owner": 13125899,
        "target": 13125898,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980685,
        "expressionRoot": 997980689,
        "ownerName": "UpperTheory.One.vwin_of_row",
        "targetName": "UpperTheory.One.Join.automorphic_window_of_inputs"
      },
      {
        "owner": 13125898,
        "target": 13096368,
        "role": "value",
        "kind": "explicit_const",
        "witness": 997980674,
        "expressionRoot": 997980683,
        "ownerName": "UpperTheory.One.Join.automorphic_window_of_inputs",
        "targetName": "UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm"
      },
      {
        "owner": 13096368,
        "target": 13096367,
        "role": "value",
        "kind": "explicit_const",
        "witness": 995913380,
        "expressionRoot": 995913388,
        "ownerName": "UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm",
        "targetName": "UpperTheory.LiteratureTheorems.galois_cohomology_from_literature"
      }
    ]
  }
];
function verifyManifest(list,expected,docs){
 const byId=new Map(docs.flatMap(d=>d.reports.map(x=>[x.id,x]))), seen=new Set();
 if(JSON.stringify(list)!==JSON.stringify(expected))throw Error("manifest differs from reproduced frontier");
 for(const q of list){if(byId.has(q.id)||seen.has(q.id)||q.kind!=="thm"||!q.path.length)throw Error("target uniqueness or kind");seen.add(q.id);let at=14065054;for(const e of q.path){const owner=byId.get(at);if(e.owner!==at||e.role!=="value"||e.kind!=="explicit_const"||!owner||!owner.value.references.some(v=>v.target===e.target&&v.kind===e.kind&&v.witnessExpression===e.witness&&v.nameParts.join(".")===e.targetName)||owner.value.expressionRoot!==e.expressionRoot)throw Error("unwitnessed path");at=e.target}if(at!==q.id||q.path.at(-1).targetName!==q.name||q.incoming.witness!==q.path.at(-1).witness||q.incoming.ownerId!==q.path.at(-1).owner)throw Error("terminal mismatch");}
 return {targets:list.length,pathEdges:list.reduce((n,q)=>n+q.path.length,0),uniquePathEdges:new Set(list.flatMap(q=>q.path.map(e=>e.owner+":"+e.target+":"+e.witness))).size,generated:list.filter(q=>q.name.includes("._proof_")).length};
}
function collectBatch(requests,ctx,project,select){
 const {decls,nameOf,read,n,challenge}=ctx;
 const ck=(p,m)=>{if(!p)throw Error(m)}, key=JSON.stringify, known=new Set(),names=new Set();
 for(const r of requests){ck(typeof r.name==="string"&&r.name.length>0&&!names.has(r.name),"duplicate request name");names.add(r.name);if(r.id!==undefined){ck(Number.isSafeInteger(r.id)&&r.id>=0&&!known.has(r.id),"duplicate/bad request ID");known.add(r.id)}}
 const lookup=select(decls,nameOf,requests.map(r=>r.name)),reports=[];
 for(const r of requests){
  const f=lookup.get(r.name);
  if(!f){ck(challenge||r.id===undefined,"required solution declaration absent "+r.name);reports.push({request:r,status:"NOT_EXPORTED_BY_EXACT_NAME"});continue}
  const {id,v}=f;
  ck(key(nameOf(id))===key(r.name.split(".")),"tagged name mismatch");
  ck(r.kind===undefined||v.kind===r.kind,"kind mismatch "+r.name);
  if(!challenge&&r.id!==undefined)ck(id===r.id,"manifest ID mismatch "+r.name);
  ck(Array.isArray(v.edges)&&v.edges.length>0&&Number.isSafeInteger(v.edges[0])&&v.edges[0]>0&&v.edges[0]<=n,"type seed");
  const isValue=["def","thm","opaque"].includes(v.kind);
  ck(isValue?v.edges.length===2&&Number.isSafeInteger(v.edges[1])&&v.edges[1]>0&&v.edges[1]<=n:["axiom","quot","ctor","inductive","rec"].includes(v.kind)&&v.edges.slice(1).every(e=>Number.isSafeInteger(e)&&(e<0||(v.kind==="rec"&&e>0&&e<=n))),"declaration shape "+r.name);
  if(!challenge&&r.type!==undefined)ck(r.type===v.edges[0]&&r.value===v.edges[1],"one-based root mismatch "+r.name);
  const type=project(v.edges[0]-1,read,decls,nameOf,n);
  const value=isValue?project(v.edges[1]-1,read,decls,nameOf,n):null;
  const structural=isValue?[]:v.edges.slice(1).map((e,i)=>{if(e>0)return {edgeIndex:i+1,encoded:e,kind:"recursor_rule_rhs",expression:project(e-1,read,decls,nameOf,n)};const target=-e-1;ck(decls.has(target),"missing structural declaration");return {edgeIndex:i+1,encoded:e,target,nameParts:nameOf(target),kind:decls.get(target).kind}});
  ck(Array.isArray(v.mutualBlock),"missing mutual metadata");
  const mutualBlock=v.mutualBlock.map(id=>{const parts=nameOf(id);ck(Array.isArray(parts),"missing mutual name");return {id,nameParts:parts,exported:decls.has(id)}});
  reports.push({request:r,status:"EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",id,kind:v.kind,encodedRootsAndStructuralEdges:[...v.edges],type,value,structural,mutualBlock});
 }
 return reports;
}
function newWrite({out,file,digest,bytes,meta,n,root,decls,nameOf,read,challenge}){
 need(digest===(challenge?CH:SOL)&&bytes===(challenge?350862311:61570595788)&&n===(challenge?6112241:1065214335)&&decls.size===(challenge?53722:1484733)&&root===(challenge?326835:14065054),"archive identity");
 need(key(nameOf(root))===key(["riemannHypothesis"]),"root tagged identity");
 const start=Date.now(),reports=collectBatch(requests,{decls,nameOf,read,n,challenge},project,select);
 const summary={recursorRuleRhs:reports.reduce((s,r)=>s+(r.structural?.filter(e=>e.kind==="recursor_rule_rhs").length||0),0),requests:reports.length,found:reports.filter(r=>r.id!==undefined).length,typeEdges:reports.reduce((s,r)=>s+(r.type?.references.length||0),0),valueEdges:reports.reduce((s,r)=>s+(r.value?.references.length||0),0),structuralEdges:reports.reduce((s,r)=>s+(r.structural?.length||0),0),expressionReads:reports.reduce((s,r)=>s+(r.type?.expressionsRead||0)+(r.value?.expressionsRead||0),0)};
 const result={status:"AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK",pin:PIN,file,digest,bytes,meta,n,root,indexedDeclarations:decls.size,projectionMs:Date.now()-start,maxRssKiB:process.resourceUsage().maxRSS,summary,reports};
 fs.writeFileSync(path.join(out,challenge?"challenge_34_producer_frontier.json":"solution_34_producer_frontier.json"),JSON.stringify(result,null,2)+"\n");
 console.log(JSON.stringify({file,projectionMs:result.projectionMs,summary,unresolved:reports.filter(r=>r.id===undefined).map(r=>r.request.name)}));
}
function splice(base,requests,here){
 const marker="const here=path.dirname(fileURLToPath(import.meta.url));",a=base.indexOf("export function writeProjection("),b=base.indexOf(marker,a);
 if(a<0||b<a||base.indexOf("export function writeProjection(",a+1)>=0)throw Error("projection splice anchor");
 return base.slice(0,a)+"const requests="+JSON.stringify(requests)+";\n"+collectBatch.toString()+"\nexport "+newWrite.toString().replace("function newWrite(","function writeProjection(")+"\nconst here="+JSON.stringify(here)+";"+base.slice(b+marker.length);
}
function testBatch(raw,base,s,l,m,collectBatch,splice,requests){
 const core=new Function(base.slice(base.indexOf("const PIN="),base.indexOf("\nimport fs from"))+"\nreturn {project,select,rewriteForProjection,pack};")();
 const patched=core.rewriteForProjection(s,l,m,"file:///fixture.mjs");
 const parser=new Function(patched.slice(0,patched.indexOf("\nimport fs from"))+"\nreturn {exprEdges,addDeclarations,packTagged};")();
 let checks=0,negative=0;const ck=(x,msg)=>{if(!x)throw Error(msg);checks++},reject=(f)=>{let bad=false;try{f()}catch{bad=true}ck(bad,"negative control");negative++};
 const rows=raw.trimEnd().split("\n").map(JSON.parse),names=[[]],expr=[],packed=[],decls=new Map();
 for(const r of rows)if("in"in r){const a=r.str||r.num;ck(r.in===names.length,"name order");names.push([...names[a.pre],r.str?a.str:a.i])}
 const nameOf=i=>names[i],find=s=>names.findIndex(a=>JSON.stringify(a)===JSON.stringify(s.split(".")));
 for(const r of rows){
  if("meta"in r||"in"in r||"il"in r)continue;
  if("ie"in r){ck(r.ie===expr.length,"expr order");expr.push(r);packed.push(parser.packTagged(parser.exprEdges(r,find),r));continue}
  const k=Object.keys(r)[0],v=r[k],norm=k==="inductive"?[{inductive:{types:v.types??v.inductiveVals,ctors:v.ctors??v.constructorVals,recs:v.recs??v.recursorVals}}]:(Array.isArray(v)?v:[v]).map(x=>({[k]:x}));
  for(const q of norm)parser.addDeclarations(q,(id,kind,edges,mutualBlock=[])=>decls.set(id,{kind,edges,mutualBlock}));
 }
 const wanted=[...decls].filter(([id,v])=>["thm","def","opaque","ctor","inductive","rec","quot","axiom"].includes(v.kind)&&names[id].every(x=>typeof x==="string"&&!x.includes("."))).map(([id,v])=>({id,name:names[id].join("."),kind:v.kind,...(["def","thm","opaque"].includes(v.kind)?{type:v.edges[0],value:v.edges[1]}:{})}));
 const ctx={decls,nameOf,read:i=>packed[i],n:expr.length,challenge:false};
 const reports=collectBatch(wanted,ctx,core.project,core.select);
 function oracle(seed){
  const seen=new Set(),stack=[seed],refs=new Map();while(stack.length){const i=stack.pop();if(seen.has(i))continue;seen.add(i);const r=expr[i];let children=[],targets=[];
   if(r.const)targets.push(["explicit_const",r.const.name]);
   else if(r.app)children=[r.app.fn,r.app.arg];
   else if(r.lam||r.forallE){const a=r.lam||r.forallE;children=[a.type,a.body]}
   else if(r.letE)children=[r.letE.type,r.letE.value,r.letE.body];
   else if(r.proj){children=[r.proj.struct];targets.push(["projection_carrier",r.proj.typeName])}
   else if(r.mdata)children=[r.mdata.expr];
   else if("natVal"in r)targets.push(["literal_primitive",find("Nat")]);
   else if("strVal"in r)targets.push(["literal_primitive",find("Char.ofNat")],["literal_primitive",find("String.ofList")]);
   for(const [k,id] of targets){const key=k+":"+id;if(!refs.has(key))refs.set(key,new Set());refs.get(key).add(i)}stack.push(...children);
  }return {seen,refs};
 }
 let roleCount=0,refCount=0,ctors=0,inductives=0,recursors=0,ruleRhs=0,structuralRows=0;
 for(const r of reports){const d=decls.get(r.id);ck(JSON.stringify(r.encodedRootsAndStructuralEdges)===JSON.stringify(d.edges),"raw roots");ck(JSON.stringify(r.mutualBlock.map(v=>v.id))===JSON.stringify(d.mutualBlock),"mutual metadata");
  if(r.kind==="ctor")ctors++;if(r.kind==="inductive")inductives++;if(r.kind==="rec")recursors++;if(!["def","thm","opaque"].includes(r.kind)){ck(r.value===null,"non-value not proof");ck(JSON.stringify(r.structural.map(e=>e.encoded))===JSON.stringify(d.edges.slice(1)),"structural edges");for(const e of r.structural){structuralRows++;ck(e.encoded===d.edges[e.edgeIndex],"structural index");if(e.encoded<0){ck(e.target===-e.encoded-1&&JSON.stringify(e.nameParts)===JSON.stringify(nameOf(e.target)),"structural target")}else{ruleRhs++;ck(r.kind==="rec"&&e.kind==="recursor_rule_rhs","structural rhs kind")}}}
  for(const [p,seed] of [[r.type,d.edges[0]-1],...(r.value?[[r.value,d.edges[1]-1]]:[]),...r.structural.filter(e=>e.encoded>0).map(e=>[e.expression,e.encoded-1])]){roleCount++;const a=oracle(seed);ck(p.expressionRoot===seed&&p.expressionsRead===a.seen.size&&p.references.length===a.refs.size,"role closure");for(const e of p.references){refCount++;const q=a.refs.get(e.kind+":"+e.target);ck(q?.has(e.witnessExpression)&&q.size===e.distinctExpressionRecords,"exact witness/count");ck(JSON.stringify(e.nameParts)===JSON.stringify(nameOf(e.target)),"tagged target")}}
 }
 ck(ctors>0&&inductives>0&&recursors>0&&ruleRhs>0,"actual inductive/constructor/recursor fixture");
 const first=wanted.find(x=>x.value!==undefined);ck(!!first,"value fixture");
 reject(()=>collectBatch([first,first],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,id:first.id+1}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,value:first.value+1}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,kind:"ctor"}],ctx,core.project,core.select));
 reject(()=>collectBatch([{...first,name:"ABSENT"}],ctx,core.project,core.select));
 ck(collectBatch([{name:"ABSENT",kind:"thm"}],ctx,core.project,core.select)[0].status==="NOT_EXPORTED_BY_EXACT_NAME","optional exact absent");
 ck(collectBatch([{...first,id:first.id+1,type:first.type+1}],{...ctx,challenge:true},core.project,core.select)[0].id===first.id,"challenge independent IDs");
 const generated=splice(base,requests,"/fixture/dep");
 ck(generated.includes("export function writeProjection(")&&generated.includes('const here="/fixture/dep";'),"driver splice");
 ck(requests.length===34&&requests.filter(r=>r.id!==undefined).length===34,"target census");
 return {checks,negative,expressions:expr.length,declarations:decls.size,targets:wanted.length,constructors:ctors,inductives,recursors,ruleRhs,structuralRows,roles:roleCount,referenceWitnesses:refCount};
}

function readPeer(name,sha){const b=fs.readFileSync(path.join(here,name));if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob "+name);return b.toString("utf8")}
const base=readPeer("rh_targeted_role_witness.mjs","9a3e8b56a0df0b37cb693575742080284ebf302f");
const args=process.argv.slice(2);
if(args[0]==="verify-manifest"){
 const expected=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2"];
 if(args.length!==5)throw Error("four report inputs required");
 const docs=args.slice(1).map((p,i)=>{const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==expected[i])throw Error("report hash "+p);return JSON.parse(b.toString("utf8"))});
 const prior=readPeer("rh_71_role_path_reconciliation.mjs","6ba69fe0e03421c136195e32793cef59f32cf013");
 const reconcile=new Function(prior.slice(prior.indexOf("function reconcile("),prior.indexOf("\nimport fs"))+"\nreturn reconcile;")();
 const r=reconcile(docs);const m=verifyManifest(requests,r.targets,docs);console.log(JSON.stringify({priorChecks:r.checks,...m}));
}else if(args[0]==="test"){
 const raw=fs.readFileSync(args[1]);if(crypto.createHash("sha1").update("blob "+raw.length+"\0").update(raw).digest("hex")!=="d3cd35f1313b4e78b5fded9886e450112aa75def")throw Error("fixture hash");
 console.log(JSON.stringify(testBatch(raw.toString("utf8"),base,readPeer("rh_stream_export_closure.mjs","bffe89b20ff5e297d921443492e918933c8e0d92"),readPeer("rh_locality_frontier_retry.mjs","336ea4ba85ba9d81235313e44f3430c112c76c45"),readPeer("rh_mutual_metadata_closure.mjs","a6d43d873703f5e632df199ac6165ed13450c3bd"),collectBatch,splice,requests)));
}else{
 if(!args.includes("--out"))throw Error("use --out DIR");const tmp=fs.mkdtempSync(path.join(os.tmpdir(),"rh34-driver-"));
 try{const p=path.join(tmp,"driver.mjs");fs.writeFileSync(p,splice(base,requests,here));const c=spawnSync(process.execPath,[p,...args],{stdio:"inherit"});if(c.error)throw c.error;if(c.status!==0)throw Error("driver "+c.status+" "+c.signal)}finally{fs.rmSync(tmp,{recursive:true,force:true})}
}
