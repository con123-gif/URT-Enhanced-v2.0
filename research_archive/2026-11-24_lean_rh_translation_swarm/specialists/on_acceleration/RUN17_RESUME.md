# Run 17 — recovered exact four-projection union

Status PARTIAL, authenticated export evidence, not kernel replay. Pinned upstream [40e56bab](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005); observed newer HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd not adopted. Root ID 14065054. Inputs (exact Git blob SHA-1 verified over UTF-8 bytes and Git header):
- [64b935e4ef309f6c555912a377012c7708eda510](https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/64b935e4ef309f6c555912a377012c7708eda510)
- [d49fbcc22a2382039986b09ff91dd11af2ef2e7b](https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d49fbcc22a2382039986b09ff91dd11af2ef2e7b)
- [d04e0fb24160d3ee1be54cd50082f59526864d4e](https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d04e0fb24160d3ee1be54cd50082f59526864d4e)
- [d823c364f446f5066dbbc61f7e9cf9c891fcbdb2](https://api.github.com/repos/con123-gif/URT-Enhanced-v2.0/git/blobs/d823c364f446f5066dbbc61f7e9cf9c891fcbdb2)

The previously inaccessible 47-owner report was recovered via Git blob endpoint. All four reports audited, role-labelled occurrences preserved in order including recursor RHS and structural slots; no kernel replay or completeness claim beyond supplied projections. Independent closure fixed-point oracle checked every timed schedule. Observed root reach is a mixed-edge projection, not proof-value-only reachability. Static source names are not proof-term edges. Source correspondence remains separate.

Executed actual code-mode results (Date.now millisecond clock, first/repeated same process; no OS cold cache and no RSS available in this mode):
```json
{
  "status": "PARTIAL_EXPORTED_ROLE_EVIDENCE_NOT_KERNEL_RECHECK",
  "batches": [
    {
      "owners": 6,
      "edges": 109
    },
    {
      "owners": 47,
      "edges": 13203
    },
    {
      "owners": 18,
      "edges": 2241
    },
    {
      "owners": 71,
      "edges": 2547
    }
  ],
  "owners": 142,
  "edges": 18100,
  "counts": {
    "type": 4048,
    "value": 14011,
    "structural": 37,
    "rhs": 4
  },
  "taggedTargets": 4042,
  "observedRootReach": 1309,
  "expandedRootReach": 93,
  "seeds": [
    61,
    4101,
    4074,
    4098,
    80,
    2055,
    5660,
    1,
    3820,
    4078,
    22503,
    25327,
    550020,
    2083,
    273
  ],
  "reverseReach": 143,
  "checks": 74327,
  "missedSuppliedEdges": 0,
  "benchmark": {
    "independent": {
      "first_ms": 1,
      "warm_ms": [
        0.77,
        0.77,
        0.73
      ]
    },
    "shared": {
      "first_ms": 0,
      "warm_ms": [
        0.18,
        0.17,
        0.17
      ]
    },
    "golden": {
      "first_ms": 1,
      "warm_ms": [
        0.18,
        0.18,
        0.17
      ]
    },
    "periodic": {
      "first_ms": 0,
      "warm_ms": [
        0.17,
        0.17,
        0.18
      ]
    }
  },
  "negative": 4
}
```

Reproduce: node run17_union.mjs direct.json frontier.json next.json literature.json. Node wrapper is executable, uses native SHA-1 and records process RSS; code-mode core actually executed. Independent schedule baseline is indexed reverse traversal per seed, not whole-source proof search. Hash maps expected O(V+E); seed selection sorting is O(V log V), 15-seed independent cost is sum of closures. No universal golden scheduling advantage claimed. Full report parsing retains all report objects, not memory bounded. No premise deletion.

Coordination: read protocol, queue, expansion, latest dependency/structure/integration and specialist handoff patches; structure owns compression and expression-safe SCC schedules, integration owns manuscript concordance. Native SQLite stream-output separate implementation (see companion checkpoint if present).

RESUME HERE: run durable_roles.py ingest on the four exact report files on a native runner; validate native role occurrence rows against this union and run streamed reverse output on the exact 15 seeds, recording per-mode RSS. No full translation closure. HANDOFF TO dependencies, kernel, structure, integration, audit, editor.
