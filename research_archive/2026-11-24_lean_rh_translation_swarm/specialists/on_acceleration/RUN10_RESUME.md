# Run 10 — one-pass multi-lane manifest membership lookup (PARTIAL, executed V8)
Pinned RH 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream HEAD observed 1da818b50f1e18808db2792b9dc735bda8cb84d8 (15:42:48 UTC), not adopted. Protocol, queue, expansion, continuity, state, lane inventories and relevant latest dependency/kernel/structure/integration/own handoffs read; not all other notes retrieved (connector call cap); blueprint not reread. Physical CI #378 PASS, unrelated to RH. No other lane modified.

The successful dependency run [45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798) retained a 38,823,812-byte Zstandard declaration manifest (1,484,705 rows) and challenge 1,356,147-byte manifest (53,242 rows); status and summary retrieved from cathedral-research-state/compute/rh-mutual-metadata-closure-20261124/. Exact SHA256, dimensions and root IDs pinned in code. Binary artifacts unavailable to this connector, local DNS blocked, no native challenge replay or full solution scan performed. Do not duplicate peer targeted-role projection. The new consumer scans a named manifest once for any set of exact tagged-name or display-only requests, retaining full selected rows including all hard refs and optional mutual metadata. Display matches are never identified as exact source names, including single candidates; exact string-vs-number and dotted-component ambiguity preserved. NOT_FOUND is manifest absence only, not source nonexistence. Duplicate IDs, duplicate selected tagged names, invalid references, missing root/count fail; unselected duplicate names and resolution of all hard references are not re-audited here. Original export remains authoritative. No source/export equivalence, kernel replay, proof-term dependency reconstruction, or proof translation implied. Original source anchor src/Main.lean theorem riemannHypothesis := rhOfAll verified at pinned revision.

Real fixture: https://raw.githubusercontent.com/leanprover/lean4export/15f6055e299ad5b89345e533cc2192f4cc00f659/examples/Nat.add_succ.ndjson, expected Git blob d3cd35f1313b4e78b5fded9886e450112aa75def. Fetched entire text, actual 32 declaration identities tested with fixture-specific structural-row adapter (not full decoder); local V8 certificate executed on retrieved contents, Node CLI Git blob check not run. Synthetic 15 queries and 100,000 rows: same exact output, no omitted candidate within these fixtures. Baseline scans once per request; shared scans once for all, golden and periodic schedule query registration only (not traversal order). O(B + Q + K) expected with fixed-width IDs and string key bytes counted, K matching output links, O(names/8 + Q + selected rows + K) memory excluding parser single line, runtime and input. Golden/periodic sorting O(Q log Q). Synthetic input is preallocated; cold first and later process scans not OS cold/warm, no measured peak RSS here; CLI records native max RSS. No claim of URT-specific advantage or arbitrary proof-search complexity. Source/import/cache pipeline from prior runs remains intact.

Executed results (V8):
```json
{
  "checks": 56,
  "negative": 6,
  "fixture": {
    "declarations": 32,
    "expressions": 434,
    "queries": 34
  },
  "n": 100000,
  "lanes": 15,
  "timings": {
    "baseline": {
      "firstMs": 3669,
      "subsequentMs": [
        3657,
        3681
      ],
      "medianMs": 3669,
      "rows": 1500000,
      "refs": 3000000,
      "metaRefs": 0,
      "candidateLinks": 15,
      "bitmapBytes": 12500
    },
    "shared": {
      "firstMs": 263,
      "subsequentMs": [
        241,
        253
      ],
      "medianMs": 253,
      "rows": 100000,
      "refs": 200000,
      "metaRefs": 0,
      "matchedRows": 15,
      "candidateLinks": 15,
      "bitmapBytes": 12500
    },
    "golden": {
      "firstMs": 244,
      "subsequentMs": [
        247,
        262
      ],
      "medianMs": 247,
      "rows": 100000,
      "refs": 200000,
      "metaRefs": 0,
      "matchedRows": 15,
      "candidateLinks": 15,
      "bitmapBytes": 12500
    },
    "periodic": {
      "firstMs": 257,
      "subsequentMs": [
        258,
        241
      ],
      "medianMs": 257,
      "rows": 100000,
      "refs": 200000,
      "metaRefs": 0,
      "matchedRows": 15,
      "candidateLinks": 15,
      "bitmapBytes": 12500
    }
  },
  "limits": "Synthetic rows preallocated; V8 elapsed wall time, no measured RSS here; repeated application scans, no OS cache claim."
}
```

Replay native: node manifest_membership.mjs test /path/to/Nat.add_succ.ndjson; node manifest_membership.mjs query challenge /path/to/challenge_declarations.jsonl.zst requests.json result.json (requests.json = {"pin":"40e56bab026552e089d7afcfeff08d2defb9c005","queries":[{"id":"root","kind":"exact","name":["riemannHypothesis"]}]}). Native query authenticates compressed bytes before and after decode, then writes new output only on success; no adversarial concurrent writer guarantee. Use solution with reachable_declarations.jsonl.zst; obtain artifact through existing compute host. CLI not executed locally; new CI not yet run.

## RESUME HERE
On existing networked host retrieve the authenticated challenge manifest and run the query CLI for the six peer anchors, then repeat on solution artifact with all lanes' exact tagged-name requests; compare to independent per-request scans and typed-role witnesses, measure native peak RSS/cold/warm I/O. Keep missing and ambiguous source references unresolved, retain proof premises; no new billion-expression extraction. HANDOFF TO integration, dependency, kernel extractor and editor. Project OPEN.
