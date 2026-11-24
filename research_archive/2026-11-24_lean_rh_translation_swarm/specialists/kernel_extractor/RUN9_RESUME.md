# RUN9 — native cycle policy reconciliation and newer-compiler test (2026-11-24 15:08 UTC)

RESULT: actual native v4.33.1 fixture outputs independently rechecked in V8; current-version fresh-collector test prepared, not yet executed. No RH kernel recheck or URT speedup. Project OPEN.

Preflight: AGENTS, research state/log/protocol, continuity, swarm protocol/queue/expansion, RUN8 kernel, recent integration/editor, geometry, audit/structure commit identities, literature, boxes, math, Galois, theta, Landau, prime, acceleration and dependency checkpoints inspected; audit/structure recent code rather than separate prose handoff not read in full. Physics CI checkpoint #375 PASS, unrelated to RH. No duplicate full-export computation.

Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005, src/Main.lean dbd5db70bc11b35f18fa5751216ab335321e7bfc, root riemannHypothesis := rhOfAll, toolchain v4.33.1 (819816b2e0a3bf405af45ae5c7af2491d8f5bee6). Latest upstream observed 9477923066c923e6dbf7292da17019f8d08d0db8 at 14:18:56Z, quick-check prerequisite diagnostics merge; Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f and v4.37.0-rc1 unchanged from RUN8 latest observed. Newer toolchain source pin 0b77e12952ad39077d80d8bd6b66d601f225c321; never combine proof revisions.

## Actual evidence (native fixture)
Native run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45411137925 completed with returncode 0, 14.51 s; compute/rh-native-cycle-witness-20261124/status.json blob 1d638b892b3c4ea80dcafa337ed50fb5bac15179. Input graph blobs in order plain/inductive/guarded: e5096a6d88ffc80f98fdc73c75f9f67f73b9f41d, 38d4822594b4c229c015cf5b5751d244840a05fc, b38a6d4a99f22080da02b8f1bf7c060beac4999e. Native runner supplied SHA256 values 18abf8240d610702b09f90799f1caf38c2e27798564c12b0628aad7fc10409a3, 00b4214284994aae41d6455c3119ff4c9c6e597b2c434afe8f74b610f69e0867, 58adbbfe8c8b371bd9430a8a05ed0899dd9e4b0f3f8694684f5028d1d922a718. Fetched graph blob identities checked; local V8 ran auditPolicy with actual fetched contents, not the Node SHA256 wrapper. Output:

```json
{
  "delta": {
    "oldPrivate": 6,
    "newPrivate": 0,
    "removedPrivate": 6,
    "identicalAfterVisibilityNormalization": true
  },
  "result": {
    "status": "ACTUAL_NATIVE_FIXTURE_ROLE_POLICY_RECHECK_NOT_RH_KERNEL_RECHECK",
    "checks": 97,
    "negativeControls": 3,
    "results": {
      "plain": {
        "expression": {
          "nodes": 2,
          "axioms": []
        },
        "collector": {
          "nodes": 4,
          "axioms": [
            "CathedralAxiomCycle.guardProp"
          ]
        },
        "package": {
          "nodes": 4,
          "axioms": [
            "CathedralAxiomCycle.guardProp"
          ]
        },
        "cached": []
      },
      "inductive": {
        "expression": {
          "nodes": 1,
          "axioms": []
        },
        "collector": {
          "nodes": 4,
          "axioms": [
            "CathedralAxiomCycle.guardProp"
          ]
        },
        "package": {
          "nodes": 4,
          "axioms": [
            "CathedralAxiomCycle.guardProp"
          ]
        },
        "cached": [
          "CathedralAxiomCycle.guardProp"
        ]
      },
      "guarded": {
        "expression": {
          "nodes": 3,
          "axioms": [
            "CathedralAxiomCycle.guardProp"
          ]
        },
        "collector": {
          "nodes": 4,
          "axioms": [
            "CathedralAxiomCycle.guardProp"
          ]
        },
        "package": {
          "nodes": 4,
          "axioms": [
            "CathedralAxiomCycle.guardProp"
          ]
        },
        "cached": [
          "CathedralAxiomCycle.guardProp"
        ]
      }
    }
  }
}
```

New independent comparison: expression-only vs collector reference policy (adds inductive constructor edges) vs package closure (keeps structural dependencies without ordinary mutual-block metadata). All 3 native graphs contain exactly the same four declaration records. Expression-only traversal from plain has 2 nodes and no axiom; from inductive 1 node and no axiom; from guarded 3 nodes and guardProp. Under the actual collector policy all roots reach the same axiom. Native imported cache reports none for plain, one for other two. The native path plain -> Witness -> guarded -> guardProp is confirmed; three deletion controls rejected. This is a distinction in *reference policies*, not proof that an inhabitant made by plain logically requires guardProp. Source/module imports alone cannot distinguish these roots. No claim of minimal logical assumptions or kernel unsoundness. Keep every edge with its role rather than suppressing constructors.

## New toolchain source result
Compare https://github.com/leanprover/lean4/blob/819816b2e0a3bf405af45ae5c7af2491d8f5bee6/src/Lean/Util/CollectAxioms.lean (blob dc9897059a4463dfd143a2b3f8fbb4f4a3c3f154) and https://github.com/leanprover/lean4/blob/0b77e12952ad39077d80d8bd6b66d601f225c321/src/Lean/Util/CollectAxioms.lean (blob e789f33849debe5cc1f1d9bc60aa3e54a56df0d9). Executed byte-text comparison after stripping only line-initial private modifiers: texts identical; 6 visibility modifiers removed. New public CollectAxioms.runM and collectAndGet permit fresh queries with extFind? = fun _ _ => none, using native implementation without persisted axiom-cache shortcut. The current release still has recursion sentinel and shared export state in source; actual rc1 cache result not inferred. Registered isolated runner run_native_cycle_rc1.sh with release asset SHA256 2e1bbb832870bb81b7131cb70b13aec2cc7ed9f22e2bdbb236b86076ae20382d (GitHub release metadata). Native rc1 job not executed here; local container has no Lean and cannot resolve api.github.com. The new job measures cached vs fresh results for all three imported roots; deliberately does not require discrepancy on new compiler. Reproduce old check: get three JSONL output files and the two pinned CollectAxioms.lean files; node cycle_policy_recheck.mjs OUTPUT_DIR OLD_CollectAxioms.lean NEW_CollectAxioms.lean. The CLI independently checks file digests. Native next: bash run_native_cycle_rc1.sh --out /tmp/rh-rc1.

## Cross-lane evidence — original solution explicit-export closure
Dependency lane native computation https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798 passed at commit 968720f55f6503e28ff4526260cb1e8b0526b983. Fetched status and summary/census, not independently re-traversed 61.57GB archive. Summary blob f1387d522a1017871332d030e2c155ea4f1c6c8d; census b394885b6574c73d92aab55d00ee7476588b01fe; challenge summary 704e34859927e02f7ae96d999681577d845a3029. Original solution archive SHA256 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, root numeric id 14065054, 1,484,705 reachable declarations, 1,065,212,063 reachable expressions, 2,133,543,711 mixed graph edges (not theorem-only), 0 missing hard names. 5 metadata-only absent mutual group names preserved; 6019714 is a metadata-only reference from 6019703. Axioms Classical.choice, Quot.sound, propext; challenge (not solution) detected sorryAx as positive control. This supports explicit-export closure under declared reference policy; not a new full Lean kernel replay nor proof that source is equivalent to export. Retain both data provenance and the five metadata witnesses. Source-reference/ import graph not equivalent to elaborated closure. This resolves the earlier authenticated missing-declaration obstacle at the reference-policy level, not the human proof.

## RESUME HERE
Inspect compute/rh-native-cycle-rc1-20261124/status.json, outputs/rc1_result.json and fresh.log. Compare fresh vs cached native collector under separate version, report exact results and failures. Coordinate with dependency/integration to produce source-linked role-labelled direct declaration edges from the now-completed authenticated solution closure, with a compact direct-reference certificate and preserved metadata; no duplicate full extraction. Independent kernel replay and source-to-export equivalence remain open. HANDOFF TO dependency, formal audit, editor, integration, acceleration. No physics changes.
