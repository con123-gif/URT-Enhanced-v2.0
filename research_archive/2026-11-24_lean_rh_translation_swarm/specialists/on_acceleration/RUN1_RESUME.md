# Run 1 — content-addressed proof index and incremental URT rank-two scheduler

**2026-11-24; PARTIAL / engineering certificate executed in tool V8; not a Lean proof audit.**
Pinned upstream: https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005
The previous local prototype was recovered from /mnt/data/urt_rh_on_acceleration and the eleven-file translation fixture. No peer checkpoint files existed in the swarm tree at this preflight. The prior mtime/size cache risks stale same-size edits. This run uses Git blob identity + scanner version as a shared parse key.

## Critical provenance correction
Three local fixture files are not byte-identical to the pinned upstream revision: the prior MainConclusion fixture was 759 bytes with one import, but the pinned file is 1213 bytes with five imports. The theta-lift file is 97,393 bytes upstream versus the 1,953-byte local excerpt. RhOfRight also differs. See benchmark.json for paths and hashes. Treat previous fixture-based statements as excerpt-only until matched with the exact source. The pinned sources were fetched directly from the GitHub connector; the standalone Node script independently hashes git-show bytes before replay.

## Executed result
```json
{
  "cache": {
    "workers": 15,
    "files": 11,
    "baselineBytes": 1600215,
    "sharedParseBytes": 106681,
    "coldMisses": 11,
    "warmMisses": 0,
    "baselineMs": 341,
    "sharedMs": 22
  },
  "graph": {
    "localModules": 11,
    "internalEdges": 10,
    "boundaryEdges": 225,
    "boundaryNames": 222,
    "reachableLocal": 11
  },
  "invalid": {
    "changed": [
      "Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion"
    ],
    "invalidated": [
      "Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion",
      "Supplements.Kernels.MainTheorems",
      "Supplements.Kernels.MainTheoremsCritical",
      "Supplements.Kernels.MainTheoremsAll",
      "Main"
    ]
  },
  "actualModuleRank2": {
    "n": 11,
    "updates": 20,
    "maxScoreDifference": 6.661338147750939e-16,
    "incrementalResidual": 2.6645352591003757e-15,
    "rebuildResidual": 1.7763568394002505e-15,
    "incrementalMs": 0,
    "rebuildMs": 0,
    "incrementalContributionTerms": 40,
    "rebuildContributionTerms": 220,
    "initialBuildExcluded": true,
    "fullOutputRequiresN": true
  },
  "syntheticRank2": {
    "golden": {
      "n": 50000,
      "updates": 60,
      "maxScoreDifference": 1.7763568394002505e-15,
      "incrementalResidual": 1.7763568394002505e-15,
      "rebuildResidual": 1.7763568394002505e-15,
      "incrementalMs": 0,
      "rebuildMs": 1340,
      "incrementalContributionTerms": 120,
      "rebuildContributionTerms": 3000000,
      "initialBuildExcluded": true,
      "fullOutputRequiresN": true
    },
    "periodicAblation": {
      "n": 50000,
      "updates": 60,
      "maxScoreDifference": 0,
      "incrementalResidual": 1.7763568394002505e-15,
      "rebuildResidual": 1.7763568394002505e-15,
      "incrementalMs": 0,
      "rebuildMs": 1182,
      "incrementalContributionTerms": 120,
      "rebuildContributionTerms": 3000000,
      "initialBuildExcluded": true,
      "fullOutputRequiresN": true
    }
  },
  "mismatches": [
    {
      "path": "src/Formalism/GammaFactorNonvanishing/RhOfRight.lean",
      "prior": {
        "sha": "a5688aa302fe065716dabb3e5939cd4607b45f46",
        "bytes": 2551
      },
      "pinned": {
        "sha": "3604637147a33e72248faddd775ea750e7846ead",
        "bytes": 2459
      },
      "matches": false
    },
    {
      "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean",
      "prior": {
        "sha": "0c7a305f2f4622443d984efa170faa9378050546",
        "bytes": 759
      },
      "pinned": {
        "sha": "ee340012ab19713a8acfecf8adc6a331cbc2f1a4",
        "bytes": 1213
      },
      "matches": false
    },
    {
      "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
      "prior": {
        "sha": "64de225cc83a0dbe978e031dc961929468ce5e88",
        "bytes": 1953
      },
      "pinned": {
        "sha": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
        "bytes": 97393
      },
      "matches": false
    }
  ],
  "declCandidates": 217
}
```

For fixed node IDs, N, feature matrix U, and phase, solve (D+UU^T)x=b. Store A=I+sum_i u_i u_i^T/d_i and z=sum_i u_i b_i/d_i. For a changed row, subtract its old contributions and add its new contributions. Solve A c=z and query x_i=(b_i-u_i^T c)/d_i. Construction O(N), one update and one lazy score O(1); k changed rows O(k), materializing all N scores Omega(N). The certificate compares incremental scores against full recomputation after each change and checks final residual. Periodic phase is a matched non-golden ablation: same asymptotics, so no URT-specific speed advantage is established. This is a scheduler, not proof search. Floating-point accumulation should be periodically rebuilt in production; changing node IDs/N/phase invalidates the stored sums.

The shared-cache test actually scans the fetched source strings; repeated 15-consumer workload is a controlled simulation, not a measurement of live bot network traffic. The graph preserves unresolved names rather than calling them external. Lexical declaration names are candidate records only, not resolved dependencies. The GitHub recursive tree query at the pin was truncated (44,877 returned Lean entries, 231,467,948 bytes in that partial listing); never treat it as full repository coverage. No Lean executable or outbound git DNS available in local container. V8 timings are coarse and do not include network or kernel verification. No peak RAM in tool V8; Node replay reports process max RSS. Existing Cathedral physical CI status read as PASS before this engineering task; new certificate not registered in physical CI and not independently CI-run.

## RESUME HERE
Replace partial manifest with an exhaustive pinned Git-tree inventory using nonrecursive subtree traversal; store shared blob-keyed cache durably and perform a real cold/warm batched git-cat-file benchmark, including peak RSS and exact source coverage. Coordinate with kernel extractor on elaborated declaration IDs; use the rank-two lazy updates only as optional scheduling, compare with FIFO/dependency critical-path scheduling on matched tasks. Never promote lexical graph to kernel graph.

HANDOFF TO: integration, dependencies, kernel extractor, theta translator, and all math lanes — invalidate unpinned excerpts; use exact Git blob hash before any translation.
