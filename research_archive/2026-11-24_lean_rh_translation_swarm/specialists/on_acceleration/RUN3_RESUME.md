# Run 3 — batch invalidation and conservative proof-evidence cache gate

2026-11-24. RESULT: PARTIAL; executed graph engineering, not kernel verification. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; current main observed 64970dc64f26807fe87a1d50514bf9bec905058f (08:59:58Z, documentation PR). Read coordination files and peer notes including kernel exporter v2, typed root obligation graph, integration, mathematical and structural lanes. Prior source-cache speedup not repeated.

## Important correctness constraint
KernelGraphExport_v2.lean currently exports exact-name references and structural metadata, not cryptographic commitments to complete expressions, universe parameters or declaration bodies. Two different theorems/proofs can have identical constant sets. Therefore do not use dependency sets as proof identities or authorize cross-environment evidence reuse from them. New scope gate requires exact source pin, immutable environment, export, extractor, checker, policy digests, exact declaration ID, claim and evidence digests plus an independently authenticated receipt and INDEPENDENTLY_RECHECKED status. Authentication is an external obligation; this module checks a supplied receipt set, does not authenticate one itself, and cannot upgrade lexical or source-matched status. Any scope change blocks reuse, even if references are identical. No actual audited kernel evidence presently loaded.

## Batch reverse invalidation
Build reverse adjacency once; seed union once; visit every affected vertex and outgoing reverse edge at most once per graph. On revision diff use both old and new reverse graphs, add missing/added nodes and changed boundary/dependency sets to supplied changed-body seeds. Any old or new path from a seed to a dependent is a path in their union; induction on path length proves inclusion. Union may overinvalidate, including mixed old/new paths, but never underinvalidates represented paths. Unknown endpoints are retained. Cycles terminate by visited set. This is O(V+E) graph preprocessing and revision comparison, O(affected vertices + affected edges + seed count) closure per batch, O(V+E) memory; name token length included, hash-map amortized. Actual semantic/body changes must be provided by authenticated fingerprints or conservative scope invalidation; no claim of arbitrary proof search or complete dependencies. Distinct source proof ports remain in original graph; dedup only adjacency for reachability. No premises deleted.

## Executed certificate (V8 connector)
Actual selected RH source-obligation graph from integration/2026-11-24_0800_TYPED_ROOT_OBLIGATION_GRAPH.json blob 1823f58b56baf53d1db6a5ce7b781cd24707a1f5, matched pinned src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc, not an elaborated graph. Every pair of seed IDs checked against independent per-seed traversals. Synthetic 100000-node shared-trunk stress case, 15 edit seeds, comparison of independent walks, batched FIFO, fixed golden-angle buckets and periodic buckets. All results equal. Timings are coarse V8 wall-clock medians of five trials; no process peak RSS measurement in V8. Node CLI reports process peak RSS when replayed (not run here). No cold/warm full Git parse rerun or kernel missed-edge ground truth; previous full scan is lexical only.

```json
{
  "tests": [
    "exact scope and independently authenticated receipt",
    "no authentication means no reuse",
    "source-only status rejected",
    "environment change blocks reuse",
    "export change blocks reuse",
    "extractor change blocks reuse",
    "checker change blocks reuse",
    "policy change blocks reuse",
    "changed exact claim blocked",
    "changed evidence blocked",
    "wrong declaration blocked",
    "lexical graph cannot be used as kernel scope",
    "cycle terminates and unresolved endpoint retained",
    "old deleted edge still invalidates downstream",
    "duplicate node rejected",
    "all real selected graph seed pairs agree",
    "peer boundary/root union agrees",
    "synthetic shared union equality",
    "phase permutation preserves every seed"
  ],
  "peer": {
    "nodes": 16,
    "edges": 15,
    "unknown": 0,
    "seed_count": 13,
    "pair_checks": 256,
    "invalidated": 16,
    "independent_edge_visits": 62,
    "batch_edge_visits": 15
  },
  "synthetic": {
    "nodes": 100000,
    "edges": 99999,
    "seeds": 15,
    "index_ms": 225,
    "runs": {
      "independent": {
        "median_ms": 886,
        "samples_ms": [
          713,
          758,
          886,
          922,
          1102
        ],
        "edge_visits": 1499775,
        "invalidated": 100000
      },
      "batch": {
        "median_ms": 51,
        "samples_ms": [
          46,
          48,
          51,
          55,
          80
        ],
        "edge_visits": 99999,
        "invalidated": 100000
      },
      "golden": {
        "median_ms": 50,
        "samples_ms": [
          43,
          48,
          50,
          54,
          61
        ],
        "edge_visits": 99999,
        "invalidated": 100000
      },
      "periodic": {
        "median_ms": 41,
        "samples_ms": [
          40,
          41,
          41,
          42,
          43
        ],
        "edge_visits": 99999,
        "invalidated": 100000
      }
    }
  }
}
```

Interpretation: overlap-aware batching, not the golden angle, removes redundant traversals. Phase ordering does not reduce edge visits and may add overhead. Synthetic workload is intentionally highly overlapping, not a measured RH translation speedup. The selected graph test is an actual peer artifact but incomplete. No percentage or RH proof closure.

## RESUME HERE
When the existing kernel lane delivers an authenticated exact expression export/closure, ask it for complete per-declaration content fingerprints or keep immutable whole-export scope. Apply batch invalidation to actual exact graphs and measured edit/frontier sets, benchmark 15 independent requests vs batched with identical outputs, and measure Node peak RSS. Use this evidence cache guard only with independent review receipts. Retry full persistent source Git cache in the existing compute environment without editing other lanes or registering duplicate jobs. Current original public export status remains failed on length check; retry/native fixture status files absent as of check, not evidence of failure. Prior Cathedral CI checkpoint 357 PASS is unrelated to RH. No physical files changed.

HANDOFF TO: kernel extractor, dependency extraction, integration, all translation lanes. Do not reuse a human proof based on equal constant lists.
