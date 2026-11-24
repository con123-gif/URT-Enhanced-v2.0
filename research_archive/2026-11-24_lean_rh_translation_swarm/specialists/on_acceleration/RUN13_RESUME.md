# RUN13 — shared role-preserving reverse invalidation on real RH export (PARTIAL)

2026-11-24. Original source [pin](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005); this does not independently bind export to source or check the kernel. Read swarm protocol, queue, expansion, repository continuity excerpts, CI summary and relevant lane handoffs. No physics changes or duplicate compression. Blueprint not reopened. Prior upstream HEAD not adopted. Dependency lane [combined native job](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45457486389) passed: 47/47 requests, 3044 type, 10157 value, 2 structural edges, projection 65.810 s; entire CI job 1815.01 s. All 26 RUN12 targets included in that peer batch. Older six-anchor report [failed source-name comparison job](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45423163512) is used only as emitted direct reference evidence, NOT a passed source anchor audit; peer subsequently reconciled namespace. Native downstream fixture [run](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45456786809) confirms combined type/value axiom equality can mask a per-role omission; do not substitute combined reports for role edges.

## Inputs and replay
- [47-role projection](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json) Git blob d49fbcc22a2382039986b09ff91dd11af2ef2e7b; job reported SHA256 9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6, 4218336 bytes.
- [six-anchor projection](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json) Git blob 64b935e4ef309f6c555912a377012c7708eda510.
- Same solution archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e. Retrieved directly by exact Git blob using authenticated connector and executed identical semantic function in V8; independent byte hash and Node RSS unavailable in that environment. Native replay: `node role_reverse_run13.mjs solution_frontier_roles.json solution_direct_roles.json` checks both Git blob SHA1s before parsing and prints peak process RSS and high resolution timing. No new Lean execution. Local clocks millisecond resolution, first/repeated calls not OS cache cold/warm. No speed claim from sub-clock times.

## Algorithm and validity
Index reverse by archive-scoped numeric target ID, retain each original role/kind/witness object; distinct structural occurrences remain distinct. Owner IDs come from exact reports, no suffix name promotion. Seed changes and propagate to each observed owner depending on a seed via any observed edge, mark once; induction on path length establishes equality with a full-record fixed point on this partial graph. Type/value and structural edges stay queryable separately, mutual-block metadata counted but not treated as hard proof edges. Invalidation is conservative within the observed graph, never a cache reuse authorization. Unexpanded boundaries not proved leaves. Index expected O(B+V+E), shared union closure O(V_affected+E_affected+S) expected, per-seed independent closure sums affected sets. Selecting degree-ranked stress seeds sorts O(V log V) outside timed queries. Baseline full scans O(E*passes); stronger independent indexed baseline also measured. Memory O(B+V+E) for this projected graph, not full billion-expression bounded index. No dependency removed or proof-search complexity claim. No full-graph completeness, exact typed transitive proof of RH, or end-to-end translation timing.

## Executed results (V8)
```json
{
  "status": "PARTIAL_AUTHENTICATED_EXPORT_ROLE_INDEX_NOT_KERNEL_RECHECK",
  "indexMs": 25,
  "owners": 53,
  "referencedIds": 3268,
  "boundary": 3240,
  "ambiguousTaggedRepresentations": 0,
  "roleCounts": {
    "type": 3077,
    "value": 10233,
    "structural": 2
  },
  "metadata": 52,
  "checks": 193,
  "boundaryTests": 100,
  "benchmarks": {
    "overlap": {
      "seeds": [
        61,
        1,
        80,
        4101,
        4074,
        4098,
        5660,
        22503,
        273,
        4078,
        2055,
        3995,
        7484,
        2083,
        25327
      ],
      "affected": 66,
      "affectedOwners": 51,
      "modes": {
        "full_scan": {
          "firstMs": 4,
          "warmTotalMs": 221,
          "repeats": 50,
          "warmMs": 4.42,
          "edgeVisits": 53248
        },
        "separate_indexed": {
          "firstMs": 1,
          "warmTotalMs": 321,
          "repeats": 1000,
          "warmMs": 0.321,
          "edgeVisits": 1232
        },
        "shared": {
          "firstMs": 0,
          "warmTotalMs": 89,
          "repeats": 1000,
          "warmMs": 0.089,
          "edgeVisits": 920
        },
        "golden": {
          "firstMs": 0,
          "warmTotalMs": 105,
          "repeats": 1000,
          "warmMs": 0.105,
          "edgeVisits": 920
        },
        "periodic": {
          "firstMs": 0,
          "warmTotalMs": 89,
          "repeats": 1000,
          "warmMs": 0.089,
          "edgeVisits": 920
        }
      }
    },
    "sparse": {
      "seeds": [
        14026527,
        14031558,
        14032426,
        14033732,
        14033783,
        14033919,
        14033939,
        14034091,
        14034113,
        14034122,
        14065049,
        14065050,
        14065051,
        14065052,
        14065053
      ],
      "affected": 17,
      "affectedOwners": 6,
      "modes": {
        "full_scan": {
          "firstMs": 2,
          "warmTotalMs": 99,
          "repeats": 50,
          "warmMs": 1.98,
          "edgeVisits": 26624
        },
        "separate_indexed": {
          "firstMs": 0,
          "warmTotalMs": 17,
          "repeats": 1000,
          "warmMs": 0.017,
          "edgeVisits": 25
        },
        "shared": {
          "firstMs": 0,
          "warmTotalMs": 4,
          "repeats": 1000,
          "warmMs": 0.004,
          "edgeVisits": 15
        },
        "golden": {
          "firstMs": 0,
          "warmTotalMs": 11,
          "repeats": 1000,
          "warmMs": 0.011,
          "edgeVisits": 15
        },
        "periodic": {
          "firstMs": 0,
          "warmTotalMs": 12,
          "repeats": 1000,
          "warmMs": 0.012,
          "edgeVisits": 15
        }
      }
    },
    "anchors": {
      "seeds": [
        14065054,
        14065053,
        14065052,
        14065051,
        13125901,
        341189
      ],
      "affected": 6,
      "affectedOwners": 6,
      "modes": {
        "full_scan": {
          "firstMs": 1,
          "warmTotalMs": 45,
          "repeats": 50,
          "warmMs": 0.9,
          "edgeVisits": 13312
        },
        "separate_indexed": {
          "firstMs": 1,
          "warmTotalMs": 7,
          "repeats": 1000,
          "warmMs": 0.007,
          "edgeVisits": 12
        },
        "shared": {
          "firstMs": 0,
          "warmTotalMs": 1,
          "repeats": 1000,
          "warmMs": 0.001,
          "edgeVisits": 5
        },
        "golden": {
          "firstMs": 0,
          "warmTotalMs": 8,
          "repeats": 1000,
          "warmMs": 0.008,
          "edgeVisits": 5
        },
        "periodic": {
          "firstMs": 0,
          "warmTotalMs": 8,
          "repeats": 1000,
          "warmMs": 0.008,
          "edgeVisits": 5
        }
      }
    }
  }
}
```
All comparisons use full affected-ID set equality; all role-labelled edge multisets match. Synthetic edit requests on authentic projected edges, not observed edits. Golden/periodic alter only seed order. No universal scheduler advantage inferred. Missing dependencies outside projection unknown; no discrepancy on tested supplied graph.

RESUME HERE: obtain next source-linked authenticated typed projection for current peer requests, then merge by archive-scoped owner ID and exact role evidence; reject conflicting repeated owner rows rather than overwriting. Compare incremental reverse-index update against rebuild on actual delta and record true Node RSS. HANDOFF TO dependencies, kernel, integration, audit, editor and all specialists. Project OPEN.
