# Kernel extractor run 3 — declaration content identity (2026-11-24 09:08 UTC)

RESULT: PARTIAL — independently executed content-fingerprint reference implementation on actual upstream lean4export example, not RH kernel validation.

## Continuity and provenance
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, AGENTS, research state/log/protocol, continuity, prior kernel run and peer handoff tails (integration 09:00, proof editor 08:56, acceleration run3, all specialist run2 notes, audit/math/structure/dependencies). Current upstream RH head c9883164b0b3d762cee21f889d03d59a53b3ba3b; original pinned Main blob dbd5db70bc11b35f18fa5751216ab335321e7bfc and toolchain a8afa7d1b02d96f0671eba854a8dc4b416beb473 (v4.33.1). Current Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f explicitly uses Claim.zeta LFunction_ne_zero_of_half_lt_re; toolchain blob 0e037f58f9a1aa2d5139277bcc4be0061ebeeb05 (v4.37.0-rc1). Preserve separate namespaces. Current state native fixture v2 status path 404; existing registered job has no published outcome. Peer stream closure first attempt error (archive byte/hash mismatch), retry assigned to structure lane. No Lean/lake locally; GitHub DNS unavailable from container. No duplicate native job.

## Task
Acceleration run3 specifically requests complete per-declaration content fingerprints rather than name/edge equivalence. Source schema: leanprover/lean4export tag v4.33.0 tree 15f6055e299ad5b89345e533cc2192f4cc00f659, Export.lean blob e77a14f00ee6290ab7e6e6f95765fce3a14626a8, format_ndjson.md blob 6eee6b0f1dcaa4570590dcf878a1fb3ba381f07c, actual examples/Nat.add_succ.ndjson blob d3cd35f1313b4e78b5fded9886e450112aa75def. Example is OLDER format 3.0.0, schema doc 3.1.0. Do not treat sample as RH. 3.0 uses group arrays and old inductive keys, 3.1 object schema. Unknown fields and unresolved primitive indexes fail closed. Read all fields of each known expression and declaration variant, including level parameters, binder names and flags, reduction hints, safety, constructor/recursor fields and rule RHS; retain group digest. Literal string values retained. Metadata sorted as serialized key/value strings; default exporter strips metadata and normalizes nondep flag before export. No claim of original unexported information identity. Large numeric JSON tokens rejected if not safe integers; duplicate JSON keys are not detected by JSON.parse so use authenticated official exporter input only. No semantic/kernel validity assertion, no closure check. Whole export scope and checked dependency closure still needed for review reuse.

Hash definition: SHA-256 over domain-separated JSON tuples with named constructor tags, canonicalized children and ordered scalars. Replace exporter-local numeric references to names, levels, expressions with their own typed digest. By induction on the exporter child-before-parent stream, two equal serialized typed trees have equal digest regardless of index assignment; conversely equality is evidence of identical serialized tree conditional on no SHA-256 collision and authenticated schema. A declaration group hash additionally binds all its members in exported order. This cannot establish identity of transitive referenced declarations: a change in a referenced declaration body may not alter the caller's digest. Invalidation must include reverse dependency closure, entire group and exact version/trust scope; safe baseline remains whole-export identity when dependencies unresolved. No URT-specific advantage.

## Actual execution (functions V8)
{
  "tests": 15,
  "actual": {
    "rows": 572,
    "names": 103,
    "levels": 15,
    "expressions": 434,
    "declarations": 32,
    "rootDigest": "0e56f47be0ae6b2cffc4763e5f494166630fa594f80f5995b7d6a1837c79be23",
    "meta": {
      "exporter": {
        "name": "lean4export",
        "version": "3.0.0"
      },
      "format": {
        "version": "3.0.0"
      },
      "lean": {
        "githash": "2fcce7258eeb6e324366bc25f9058293b04b7547",
        "version": "4.27.0-rc1"
      }
    }
  },
  "scope": "content fingerprints only, not kernel check or transitive validity"
}
Portable SHA-256 function used in V8, checked two standard digest vectors. Committed runner uses Node crypto SHA-256 instead; Node CLI itself not run in this session. Tested same fingerprint and regression functions. Negative controls include changes to value, binder info/name, level parameters, same-reference literal change, unsupported field, unknown reference, duplicate index, unsafe numeric, missing value. Small 3.1 fixture is synthetic; actual 3.0 file tested from pinned connector. SHA reported by connector; no local clone. Note synthetic mutation is not necessarily a well-typed Lean proof. In-memory reference: expected O(input bytes + primitive reference occurrences) hash work except metadata sorting and name display strings; O(number of primitives) memory plus variable-length names. No full-corpus performance measured. Native Lean fixture and RH export not executed.

## Reproduce
git clone https://github.com/leanprover/lean4export
git -C lean4export show 15f6055e299ad5b89345e533cc2192f4cc00f659:examples/Nat.add_succ.ndjson > example.ndjson
node fingerprint_export.mjs --self-test example.ndjson
For 61 GB export, do not use in-memory reference. First validate native fixture result and exact pinned export. Implement fixed-width disk-backed 32-byte digest tables keyed by primitive ID; retain source context and complete group fingerprints, use verified dependency graph for transitive invalidation. Authentication must include exact archive digest, toolchain, exporter version and schema, no assumption proof is valid merely from matching fingerprint.

RESUME HERE: check compute/rh-native-lean-fixture-v2-20261124/status.json again; if present inspect compilation logs and fixture axiom comparison. If unavailable, implement disk-backed digest arrays in coordination with dependency stream retry, not a duplicate download/job. Compare native exact proof references to public export when both exist. HANDOFF TO: acceleration, dependencies, integration, audit. Do not reuse translation based on equal reference names.
