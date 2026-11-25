# RUN18 — disk-bounded raw proof slice and de Bruijn scope certificate
2026-11-25. PARTIAL / genuine exported fixture executed in V8 / native full archive run registered but NOT executed here. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream b2f365a68500e2bde98cd60a2324263fc62fba10 (00:06:45Z), compare 204 commits ahead of last inspected 9282d3a102c4aff0e6026746db2a8990f5d9cddd; not adopted. Toolchain still leanprover/lean4:v4.37.0-rc1. Read AGENTS, protocol, handoff, expansion, state/log/continuity/CI excerpts and recent integration/editor/geometry/literature/character boxes/math/audit/acceleration notes; not all 14 peer notes in full, blueprint not reopened. CI #403 is physics-only, not RH validation. No physics edits.
Prior RUN17 561baec2302910ec9344fd77bab33f51ca8960fc assumed a stable 61.57GB raw file. Local disk is 30GB available, no Lean, MIT DNS unavailable (curl exit 6). Acceleration RUN18 reports projection index but no expression-offset index; integration e169d46057980178889959d246d8c0690ce75b94 requests all four TLiftK generated proof roots. Dependency native report 45508109328 has exact owner identities. This contribution binds all 14 roots (6 previous + 8 new) and adds a compressed forward spool plus independent scope verification, rather than repeat role-name extraction.
Inputs: peer RUN17 script Git blob 45fc2bc30521a1607a7a763b114bba189c87e114; genuine Nat.add_succ fixture leanprover/lean4export commit 15f6055e299ad5b89345e533cc2192f4cc00f659 examples/Nat.add_succ.ndjson blob d3cd35f1313b4e78b5fded9886e450112aa75def; role reports d49fbcc22a2382039986b09ff91dd11af2ef2e7b, d04e0fb24160d3ee1be54cd50082f59526864d4e, d823c364f446f5066dbbc61f7e9cf9c891fcbdb2, deabbd86afc8f21d9897ba3bb74349178517fde3; archive SHA256 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, length 61570595788. Connector report/fixture identities retrieved; raw byte hashes not recomputed in V8; native CLI checks full report/fixture/script blob hashes and entire archive SHA. Source anchors EveryCharacter.lean 6ac769568b67f85f33565ba3e1eef7b91f53c55f; EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24; HalfIndexLattices/TLiftK.lean 4b36fc43e988270944cef2fc1b5e9ee1493fc275 (integration matched). Fourth generated proof root is much later than the other three; do not infer binder scope or exact AF alias from role lists.
Theorem: given an acyclic ordered expression DAG, define m(bvar i)=i+1, m(app f a)=max(m(f),m(a)), m(binder A b)=max(m(A),m(b)-1), m(let A v b)=max(m(A),m(v),m(b)-1), m(leaf)=0; projections/metadata propagate the child. Then m(t) is the least number of outer binders needed for all de Bruijn occurrences to be in range, by structural induction. A binder domain and let value are outside the new binder; only body gains one. Independent context-depth traversal checks each (record ID, depth) instead. This establishes syntactic scope, not typechecking or definitional equality. Preserve ordered children, tagged names, levels, binder info, raw expression records, original role/structural metadata and witnesses. The raw archive is hashed even if spool ends early. Compress complete-line 8MiB blocks into bounded temporary storage, store SHA per frame, reverse scan only after full archive authentication. If the disk cap is reached and high root missing, explicitly report both TLiftK._proof_4 roots unresolved and retain the twelve other roots only after full authentication and successful verification. No silent fallback on parser errors. Worst-case O(total archive bytes plus reverse scans) time, O(compressed prefix up to cap) disk, bounded block memory plus selected records; no speed benchmark or URT-specific claim. Native I/O wrapper not executed here. No new #print axioms or kernel replay.
Actual V8 result:
```json
{
  "checks": 13,
  "negative": 5,
  "fixtureRoleChecks": 46,
  "fixtureNodes": 29,
  "independentScopedStates": 31,
  "fixtureSpines": [
    {
      "role": "type",
      "binders": [
        {
          "kind": "forallE",
          "name": [
            "n"
          ]
        },
        {
          "kind": "forallE",
          "name": [
            "m"
          ]
        }
      ]
    },
    {
      "role": "value",
      "binders": [
        {
          "kind": "lam",
          "name": [
            "n"
          ]
        },
        {
          "kind": "lam",
          "name": [
            "m"
          ]
        }
      ]
    }
  ],
  "targetRoots": [
    {
      "id": 550021,
      "role": "type",
      "root": 12992048,
      "records": 6,
      "edges": 6
    },
    {
      "id": 550020,
      "role": "type",
      "root": 3,
      "records": 1,
      "edges": 0
    },
    {
      "id": 550025,
      "role": "type",
      "root": 12992060,
      "records": 21,
      "edges": 24
    },
    {
      "id": 550025,
      "role": "rhs",
      "root": 12992065,
      "records": 25,
      "edges": 32
    },
    {
      "id": 326948,
      "role": "type",
      "root": 1025073,
      "records": 21,
      "edges": 26
    },
    {
      "id": 326948,
      "role": "value",
      "root": 44333,
      "records": 17,
      "edges": 20
    },
    {
      "id": 13125906,
      "role": "type",
      "root": 9078396,
      "records": 47,
      "edges": 64
    },
    {
      "id": 13125906,
      "role": "value",
      "root": 9078404,
      "records": 20,
      "edges": 24
    },
    {
      "id": 13125937,
      "role": "type",
      "root": 9838915,
      "records": 54,
      "edges": 72
    },
    {
      "id": 13125937,
      "role": "value",
      "root": 9838921,
      "records": 54,
      "edges": 74
    },
    {
      "id": 13125938,
      "role": "type",
      "root": 9838937,
      "records": 69,
      "edges": 94
    },
    {
      "id": 13125938,
      "role": "value",
      "root": 9838943,
      "records": 54,
      "edges": 74
    },
    {
      "id": 13125939,
      "role": "type",
      "root": 997980875,
      "records": 127,
      "edges": 186
    },
    {
      "id": 13125939,
      "role": "value",
      "root": 997980883,
      "records": 113,
      "edges": 166
    }
  ],
  "totalRoleRecords": 629,
  "totalRoleEdges": 862
}
```
Reproduce native fixture: node run18_bounded_raw_scope.mjs test /path/to/Nat.add_succ.ndjson (also retrieves four pinned reports). Full job: node run18_bounded_raw_scope.mjs --out /tmp/rh-raw-scope. No full archive raw expression claims until successful job output.
RESUME HERE: retrieve compute/rh-bounded-raw-scope-20261125/status.json and outputs/selected_raw_scope.json on cathedral-research-state; check complete versus explicit partial, exact raw binder spines for TLiftK._proof_1..4, EveryCharacter auxiliary, OpenLiterature constructor/recursor; if disk cap prevents proof_4 use a peer offset index or a targeted second pass, not a guessed statement. Map exact AF alias and both Units.map occurrences to pinned TLiftK L18–19. HANDOFF TO integration, editor, theta, Galois, literature, character boxes, dependencies, acceleration, audit. Full RH reconstruction OPEN.
