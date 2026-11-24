# RUN17 — raw expression sub-DAG extraction, four selected owners

Status PARTIAL / fixture executed / authenticated RH role metadata inspected / native archive slice NOT executed. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged, not adopted. Read swarm protocol, queue, expansion, AGENTS, research log/state/protocol and continuity excerpts, CI #400 (physics only), recent lane commits and relevant handoffs. Blueprint not reopened; not all peer notes read in full. No physics changes.

Previous RUN16 e55b6e2 requested constructor and raw expression sub-DAG. RUN17 acceleration 845139f recovered missing 47-owner report via Git blob endpoint, and the constructor is already present in that recovered report. This lane now targets actual raw expression structure, not another role-set union. Integration 2110dc7 owns TLiftK frontier and manuscript mapping; no overlap. Inputs: https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/64b935e4ef309f6c555912a377012c7708eda510
https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d49fbcc22a2382039986b09ff91dd11af2ef2e7b
https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d04e0fb24160d3ee1be54cd50082f59526864d4e
https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d823c364f446f5066dbbc61f7e9cf9c891fcbdb2. Connector blob endpoints supplied parsed reports; this run did not recompute their byte hashes in V8. Native CLI checks all four hashes and the entire solution archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, size 61570595788. Use a stable immutable input file throughout both passes. Fixture https://github.com/leanprover/lean4export/blob/15f6055e299ad5b89345e533cc2192f4cc00f659/examples/Nat.add_succ.ndjson (blob d3cd35f1313b4e78b5fded9886e450112aa75def), connector text; raw blob hash not recomputed in V8.

Source anchors: EveryCharacter.lean blob 6ac769568b67f85f33565ba3e1eef7b91f53c55f; EveryCharacterOfLiteratureOfVWin.lean blob a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 (constructor fields Row, RecTExists, Row). Constructor ID 550021 recovered, type root 12992048, 6 expression records, 6 child edges, 3 direct const references; structural parent slot repeated twice. Do not conflate fields of identical types. Recursor RHS retains exact slot 3. No claim of extracted argument order or exact auxiliary proposition until native slice runs.

Algorithm: reverse NDJSON scan with required expression, name and universe-level sets. Lean4export emits dependencies before parents (postorder); zero name/level implicit. Induction on descending record position shows every required child is queued before encountered, provided source ordering holds. Remaining pending IDs fail closed. Preserve raw selected line payloads, not just const names, including binder names/info, universe levels, ordered app fn/arg, literals, projections, let and metadata. Independent forward oracle on real example checks exact selected expression ID set; actual role verifier checks each selected root's reachable expression count, child edge count, typed target multiplicity, representative witness and tagged name. This is exact explicit sub-DAG preservation conditional on authenticated source and exporter schema; not proof checking. Archive hashing + reverse scan O(input bytes), maps O(selected closure); worst-case reverse scan whole archive, JSON parses every line, no speed claim. Native I/O wrapper and archive verification are unexecuted; code-mode V8 core executed on actual small exported example and target binding on actual four reports. No Lean installed/run, no new #print axioms, no URT advantage.

Actual result:
```json
{
  "fixture": {
    "checks": 46,
    "summary": [
      {
        "owner": "Nat.add_succ",
        "role": "type",
        "root": 428,
        "expressions": 24,
        "edges": 32,
        "referenceSignatures": 6
      },
      {
        "owner": "Nat.add_succ",
        "role": "value",
        "root": 433,
        "expressions": 21,
        "edges": 26,
        "referenceSignatures": 6
      }
    ],
    "expressions": 29,
    "names": 10,
    "levels": 1,
    "scannedLines": 571
  },
  "independentOracleRecords": 29,
  "negativeControls": 5,
  "actualReportRoots": [
    {
      "id": 550021,
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk",
      "role": "type",
      "slot": 0,
      "root": 12992048,
      "records": 6,
      "edges": 6,
      "refs": 3
    },
    {
      "id": 550020,
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements",
      "role": "type",
      "slot": 0,
      "root": 3,
      "records": 1,
      "edges": 0,
      "refs": 0
    },
    {
      "id": 550025,
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.rec",
      "role": "type",
      "slot": 0,
      "root": 12992060,
      "records": 21,
      "edges": 24,
      "refs": 4
    },
    {
      "id": 550025,
      "owner": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.rec",
      "role": "rhs",
      "slot": 3,
      "root": 12992065,
      "records": 25,
      "edges": 32,
      "refs": 4
    },
    {
      "id": 326948,
      "owner": "UpperTheory.EveryCharacter._proof_1",
      "role": "type",
      "slot": 0,
      "root": 1025073,
      "records": 21,
      "edges": 26,
      "refs": 8
    },
    {
      "id": 326948,
      "owner": "UpperTheory.EveryCharacter._proof_1",
      "role": "value",
      "slot": 1,
      "root": 44333,
      "records": 17,
      "edges": 20,
      "refs": 7
    }
  ],
  "actualReportedRoleRecords": 91,
  "actualReportedRoleEdges": 108
}
```

Reproduce: node run17_raw_slice.mjs /path/to/solution.ndjson direct.json frontier.json next.json literature.json > selected_raw.json . Redirect only to a fresh output file; successful exit required. The raw slice is not yet available. Field projections still unbound. Source hash validation does not prove Lean validity. Full RH reconstruction OPEN.

RESUME HERE: run the new slicer on immutable SHA256-pinned 61.6 GB solution export using a native runner, retain selected_raw.json, independently pretty-print aux type and value and constructor/recursor expressions, check binder order and de Bruijn scope before any prose translation. Coordinate with dependency and acceleration lanes to avoid duplicate archive scan; if they have an offset index, use it with identical verification. HANDOFF TO dependencies, literature, character boxes, audit, editor, integration, acceleration.
