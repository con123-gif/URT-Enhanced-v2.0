# RUN6 — source-policy axiom cache cycle audit (2026-11-24 12:08 UTC)

RESULT PARTIAL — graph-model execution on actual serialized sample and exhaustive finite negative controls. No native Lean compilation or RH kernel validation. Read swarm protocol, handoff/expansion, AGENTS, continuity, research state/log/protocol excerpts, CI checkpoint 366 PASS (physical, unrelated), peer latest handoffs (including 12:00 integration, acceleration RUN6, and kernel RUN5 embedded note). Source pin 40e56bab026552e089d7afcfeff08d2defb9c005 unchanged; upstream head 5f2c8594adf1f48032d37583118512cd7bbf3afa at 11:41:50 UTC, not adopted. Native fixture, stream retry and source pool status paths still 404; no new download. Node present locally, Lean/lake absent, git DNS fails. The RUN4 native disk replay remains outstanding.

Lean source: leanprover/lean4 @v4.33.1, source tree 819816b2e0a3bf405af45ae5c7af2491d8f5bee6; src/Lean/Util/CollectAxioms.lean blob dc9897059a4463dfd143a2b3f8fbb4f4a3c3f154. Source checks: imported axiom cache consulted first; local memo sentinel inserted before recursion; axioms include type dependencies; definition/theorem/opaque traverse type and value; quot ignored; inductive visits constructors; shared state during module export. Official upstream test tests/pkg/collectAxioms/CollectAxioms.lean blob 06a21df33a9a308678bf5c02d6eccd2b58e7c063 checks private-name diamond, stripped-definition chain and axiom type. The exact getUsedConstants primitive is not independently re-derived here; sample projection follows explicit constant occurrences plus inductive constructor edges, matching prior verifier policy. Graph model omits imported cache extension and kernel-specific scheduling; it is not a reproduction of all Lean behavior.

For a fixed complete graph G, independent BFS from root retains each visited vertex and a predecessor, yielding shortest edge-count witness for each reachable axiom in O(V+E) traversal plus witness output length. For repeated roots, naive shared recursion memo with empty in-progress sentinel can cache a strict subset for a member of a cycle: I → plain,guarded; plain → I; guarded → guardProp,I. Processing I first can cache plain empty even though a path plain→I→guarded→guardProp exists. Processing plain first yields guardProp. A fresh per-root traversal obtains correct graph reachability in this model; shared export cache ordering may matter on cyclic graphs. This is an abstract graph counterexample, NOT an established Lean bug, soundness flaw, or RH result. Actual native declaration dependency order and semantics may prevent or explain it. For RH audit, do not treat disagreement with collector alone as proof invalidity: retain full exact graph and separately investigate imported-cache trust boundaries. Axioms reachable through structural package edges may differ from collector semantics.

Executed in functions V8: actual official lean4export fixture @15f6055e299ad5b89345e533cc2192f4cc00f659 examples/Nat.add_succ.ndjson blob d3cd35f1313b4e78b5fded9886e450112aa75def; exact code below. Results:
```json
{
  "checks": 27,
  "sourceAnchors": 10,
  "syntheticCycle": {
    "exactPlain": {
      "visited": 4,
      "axioms": [
        "guardProp"
      ],
      "witnesses": [
        {
          "axiom": "guardProp",
          "path": [
            "I.plain",
            "I",
            "I.guarded",
            "guardProp"
          ]
        }
      ]
    },
    "sharedOrderIThenPlain": [
      [
        "I",
        [
          "guardProp"
        ]
      ],
      [
        "I.plain",
        []
      ],
      [
        "I.guarded",
        [
          "guardProp"
        ]
      ]
    ],
    "sharedOrderPlainThenI": [
      [
        "I.plain",
        [
          "guardProp"
        ]
      ],
      [
        "I",
        [
          "guardProp"
        ]
      ],
      [
        "I.guarded",
        [
          "guardProp"
        ]
      ]
    ]
  },
  "exhaustive": {
    "graphs": 65536,
    "freshChecks": 262144,
    "sharedMismatchGraphs": 23904,
    "sharedMismatchRoots": 30688
  },
  "actualFixture": {
    "records": 572,
    "declarations": 32,
    "policyEdges": 79,
    "rootReachable": 27,
    "rootAxioms": [],
    "allRootsAgree": true
  },
  "scope": "Source-policy graph model only; not Lean execution or a claim of an actual kernel bug"
}
```
The fixture contains no axiom declarations, so its agreement cannot establish axiom-positive accuracy. Exhaustive graphs include arbitrary edges not necessarily legal Lean declarations; all 262144 fresh root comparisons agree with independent BFS. Shared-cache counterexamples motivate a native cyclic fixture, not a claim against Lean. Output counts only graph-model execution.

Reproduce:
```sh
git -C lean4 show v4.33.1:src/Lean/Util/CollectAxioms.lean > CollectAxioms.lean
git -C lean4 show v4.33.1:tests/pkg/collectAxioms/CollectAxioms.lean > CollectAxiomsTest.lean
git -C lean4export show 15f6055e299ad5b89345e533cc2192f4cc00f659:examples/Nat.add_succ.ndjson > Nat.add_succ.ndjson
node axiom_cache_cycle_audit.mjs CollectAxioms.lean Nat.add_succ.ndjson CollectAxiomsTest.lean
```
Native companion (prepared, NOT run): copy AxiomCycleBase.lean.txt and AxiomCycleImport.lean.txt to temporary working directory without .txt suffix, use Lean 4.33.1, set LEAN_PATH to include directory, then run lean -o AxiomCycleBase.olean AxiomCycleBase.lean and lean AxiomCycleImport.lean. Record six actual #print axioms lines and compare local versus imported exact dependency witnesses; compile failures must be reported, not inferred. Preserve all original files and no duplicate job registration.

RESUME HERE: inspect native fixture and stream retry status again; run the two-module native experiment alongside existing exporter once Lean is available. If local/imported axiom lists differ, record source and actual graph paths, not an inferred proof defect. For multiple-root cache reuse use SCC condensation / reachability of axiom sets with output-sensitive cost, or fresh per-root BFS, never empty sentinel as a complete closure. Continue prior authenticated disk fingerprint integration when available.
HANDOFF TO: dependencies, acceleration, formal audit, integration. Project OPEN.
