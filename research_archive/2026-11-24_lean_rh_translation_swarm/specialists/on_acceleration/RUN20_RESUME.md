# RUN20 — compact full-manifest projection and all-row roundtrip (2026-11-25)

RESULT: PASS for exact full-projection roundtrip and native lookup; PARTIAL for construction timing, durable shared artifact and overall proof. Source [pinned Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean), blob dbd5db70bc11b35f18fa5751216ab335321e7bfc re-fetched: riemannHypothesis := rhOfAll. Source pin and export identity are distinct. Run19 prior checkpoint e5380ad558455902a9602b33ebbd4c34742ed1af. Latest peer notes read via commit diffs across 14 lanes (integration e5e626d, dependencies 32d64e9, structure 167b33e, kernel e14abc2, theta bdb5bc7, Galois 108f870, geometry 25f653e, others); editor patch lacked RESUME HERE. Read protocol, queue, expansion, AGENTS and research state excerpts; root-level log/protocol paths returned 404; correct archive paths and blueprint not reread. No upstream main freshness comparison performed here; no repinning or source-equivalence inference.

## Real data and certificate

Downloaded artifact [14931267327 / run 45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798), ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97, extracted job/outputs/reachable_declarations.jsonl.zst, SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf. Native append-order SQLite projection: 1,484,705 rows; 3,035,045 signed hard-root entries and 1,460,414 metadata entries counted. Source row order is not sorted by declaration ID. Store ordinal, exact tagged name, terminal, kind, all signed refs and SHA256 of the complete raw row. Keep the original authenticated manifest as the evidence store; mutualBlock contents and raw row bytes are not independently stored in this compact projection. It is NOT a replacement for Run19 raw-row store or complete graph.

Native build process reached a committed temporary database but exceeded tool execution limit before publication; no complete build timing or build peak RSS available. Recovered database had exact receipt, 1,484,705 rows and quick_check ok. Reopened native full streaming roundtrip compared every projected field and complete-source-row digest for all rows in 18.951585 s (isolated process peak 168324 KiB); full integrity_check with 256 MiB cache passed in 2.631857 s, then atomic rename + directory fsync. Final database 390,791,168 bytes versus Run19 raw database 1,067,364,352 bytes (63.4% smaller, different payload). This is not a matched build-speed improvement; clustered compact baseline implemented but unrun. Final local DB SHA256 6967b534c57a38bdec7deced48f8b2756c0bfade7f1454c5f1f0fe6c38e3403d after rollback controls; not uploaded and not assumed persistent across sessions. Code blob 80bd60e3884d62ecccd1c439e6a3ab9b78ff6932 matched native executed file, code commit 5aaea4f071b7111afae9be6c936fddbfae7445c8.

## Same twelve exact declaration requests

Conventional single streaming scan (includes source authentication, projecting and hashing every row) 16.616130 s. Cached lookup excludes build and full reauthentication cost; reopened connection is NOT cold storage. 11 trials per schedule per state, 66 exact comparisons; 12 exact name checks, missing-name and ambiguous terminal controls passed. Benchmark process peak 100120 KiB includes scan. Warm timing excludes connection opening and previous equality check. No repeated baseline trials; no URT-specific performance claim.

| schedule | reopened median ms | warm median ms |
|---|---:|---:|
| shared | 0.243242 | 0.067131 |
| golden | 0.198084 | 0.071046 |
| periodic | 0.182921 | 0.068812 |

Negative controls executed against temporary uncommitted modifications of first row: refs='[]', digest=zeroblob(32); both rejected at row 1; transactions rolled back. No supplied projected hard-root entry omitted. The census/range checks do not prove that all inner expression dependencies have been extracted or that every reference is correct in Lean. Metadata remains available in pinned manifest, not interpreted as a hard edge. Source lexical reference, import graph, declaration root reference and actual elaborated expression-constant edge remain different evidence classes. No premises removed.

## Exact manifest root handoff

Expression roots below are zero-based; manifest positive refs are 1-based. For these thm/def rows with two positive refs, subtract one from the type and value root. Names exact, but source binding and incoming path not newly authenticated by this lookup.

| declaration | id | type root | value root |
|---|---:|---:|---:|
| UpperTheory.TP.TLiftK | 13125905 | 3 | 997984088 |
| UpperTheory.Gal.Int.coreAll_of | 13208115 | 1002624501 | 1002624515 |
| UpperTheory.Gal.Int.rest | 13172410 | 1000095279 | 1000095288 |
| UpperTheory.Gal.Spc.specAlg | 13962369 | 1059634995 | 1059646507 |
| PositivityTheory.Rg.Sw.HSt.holLeadB | 8996470 | 720757039 | 722118273 |
| PositivityTheory.Rg.Sw.HSt.locTau | 8996093 | 721752893 | 722068160 |

Integration explicitly requests role-separated outgoing evidence for coreAll_of and rest from existing 151-owner projection. These roots identify their expressions, not the outgoing edges. Dependency lane owns 151-owner validation, kernel owns raw-term replay and TLiftK occurrence paths, structure owns CSR/compression; do not duplicate them.

## Replay / complexity

```sh
set -eu
python compact_run20.py build manifest.zst append.sqlite append
python compact_run20.py verify manifest.zst append.sqlite append
python compact_run20.py bench manifest.zst append.sqlite append
# Matched construction comparison, not yet executed:
python compact_run20.py build manifest.zst clustered.sqlite clustered
python compact_run20.py bench manifest.zst clustered.sqlite clustered
```

If killed before publication, do not use a temporary DB until exact receipt, count, full streaming verification and integrity_check pass; then publish atomically. The script uses no assertions for primary checks; ValueError or SQLite failure exits nonzero. Negative controls reproduced by opening a transaction on a verified DB, changing first row refs or digest, calling verify and requiring ValueError, then rollback. Authentication checks input bytes, and full roundtrip checks the cached projection; normal receipt-only lookup does not independently detect arbitrary post-build corruption. Concurrent publishers still require external single-writer coordination (existence check alone is not a lock). Stream pass cost O(expanded source bytes + signed refs + maxID/8) under fixed row schema, plus SQLite index sorts/B-tree cost (not strictly linear); append-order verification sequential row traversal, query O(Q log N + output) plus optional O(Q log Q) ordering. RSS includes process and subprocess effects as reported by native process HWM; not system-wide aggregate memory. No independently measured physical I/O or true cold storage. No kernel replay, no full human proof, no new mathematical closure.

RESUME HERE: split build and verified publication into independently timed stages with exclusive publisher lock; execute matched clustered vs append compact builds with identical cache and verification, record phase timing, isolated RSS and amortization, and seek authorized durable artifact reuse without giant Git blob. Deliver coreAll_of/rest roots to integration and dependencies; leave their outgoing projection validation to that lane. HANDOFF TO integration, dependencies, kernel, Galois, theta, structure, audit. Project OPEN.
