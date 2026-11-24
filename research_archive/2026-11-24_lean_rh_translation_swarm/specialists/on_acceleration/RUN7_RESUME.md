# RUN7 — block-local mixed-graph traversal, 2026-11-24

RESULT PARTIAL / native Node filesystem benchmark and official sample replay in V8. No full RH solution extraction or kernel recheck. Scope only acceleration lane.

Read coordination protocol, handoff, expansion, latest peer resumes, prior acceleration RUN6, dependency projector/exporter, kernel RUN6, integration 13:00, AGENTS and research state/log/protocol excerpts, physical CI #369 PASS (unrelated). Source pin leanprover-community/riemann-hypothesis @40e56bab026552e089d7afcfeff08d2defb9c005; upstream main e26756e547b281cbf137eb7e0f16cccb738f3f84 (12:49:24Z), not adopted. No new job or duplicate extraction.

## Actual blocker now observed

State branch compute/rh-stream-closure-retry-20261124/status.json records timeout, returncode -9, 19200.26s, run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45349329680. Last progress 61524057792 raw bytes and 1064472747 expressions; partial reachable_declarations.jsonl artifact 84971920 bytes. The artifact is evidence output started, not a complete manifest or authenticated solution closure. Need instrumentation to separate scan vs traversal vs compression; locality is a plausible bottleneck, not yet measured on actual solution. Challenge summary (same job outputs/challenge_summary.json) hash bd484ac9886a96f26b1d9a7a59ebd45b7a70d102c015d4f31f9302bbdd6ab2b9, 350862311 bytes, 6112241 indexed expressions, 53722 indexed declarations, reachable 6046012 expressions/53242 declarations/12128971 edges, 11.090469057s, peak RSS 497624 KiB. Contains sorryAx as intended; not the solution. Source pool pass (175187 modules, 979 fields, 96 textual duplicates, 242 unsupported boundaries), compression lane owns it. Native fixture v2 failed after Lean toolchain download; kernel lane owns diagnosis.

## New implementation

block_frontier.mjs preserves the signed 12-byte record adapter interface from dependencies/rh_stream_export_closure.mjs, including duplicates, all reachable expression/declaration references and cycles; 0 padding only. No raw reference decoder changed, no proof premises removed. Modes: stack (same LIFO reference order as existing baseline), block LIFO, golden phase, periodic phase, descending numeric block priority. Seen is a sparse paged bitset, marking at enqueue. Active bucket remains registered while drained; every newly discovered same-block reference is processed before another block. Highest block uses sparse seven-level radix bitmap over bounded 31-bit IDs, not sort or heap. Every reachable vertex is enqueued and expanded once; each nonzero outgoing reference is examined once; every bucket activation has at least one vertex. Thus O(V+E) expected map operations at fixed 31-bit width, including bounded radix/bucket overhead. Exact same reachable set and multiplicity counts by induction; no changes to evidence/axiom policies. If all expression edges point backward and all expression seeds known initially, descending blocks need only one activation per reached block; mixed declarations may introduce new higher seeds, so no general one-read-per-block guarantee. Frontier JS arrays can still grow O(V), not strict constant RAM; seen pages may be sparse/large, disk cache bounded separately. Do not run billion-node graph without memory instrumentation or spill. Block scheduling does not fix byte hash, storage durability, source-to-export revision binding or typed role loss. Static-source graph is distinct from elaborated serialized expression reference graph; neither this nor closure proves RH.

## Executed

Native Node v22.16.0, Linux, exact local git blobs block_frontier.mjs cc19d31f1c495dda90c1f4ebf991be20ee2f90f0 and block_certificate.mjs 0dc178b8a7ddf7ad558c2cb48665f5dbe15196d5. 510 checks (100 random mixed cyclic fixtures x 5 schedules, empty fixture x 5 and 5 fail-on-error negatives), independent FIFO set oracle. 45 fresh process trials, 262144 expr nodes, one decl, 3 shapes, 5 modes, 3 trials; fixed 8-block LRU 98304-byte payload, 1024 records/block, 12 bytes/record. All visited bitmaps SHA256 2d864c0b789a43214eee8524d3182075125e5ca2cd527f3582ec87ffd94076bc; exact edge counts, no missed or repeated node visits. OS cache not flushed, app cache empty at start, query-only wall time includes open reader and visited callback but excludes file preparation; process RSS includes interpreter and buffers, not physical disk reads. Read counts are explicit fs.readSync calls, not measured device I/O. Local raw results JSONL sha256 810c0a51adcc864392bcd374c00b25b7ee6286fd921f76c42e932848da5d9900 (not committed; reproducible). Median values:
| shape | mode | ms | peak RSS KiB | block reads | pending peak | activations |
|---|---|---:|---:|---:|---:|---:|
| cross | stack | 638.362 | 117852 | 131200 | 2 | 1 |
| cross | block | 75.111 | 52492 | 256 | 131072 | 257 |
| cross | golden | 118.257 | 49228 | 8210 | 6013 | 8238 |
| cross | periodic | 109.959 | 63904 | 7081 | 21938 | 7151 |
| cross | descending | 72.581 | 52556 | 256 | 131072 | 257 |
| spread | stack | 60.744 | 40524 | 293 | 23 | 1 |
| spread | block | 90.074 | 52296 | 401 | 66725 | 426 |
| spread | golden | 84.524 | 52400 | 410 | 65494 | 427 |
| spread | periodic | 94.923 | 52168 | 320 | 65698 | 336 |
| spread | descending | 90.430 | 52880 | 256 | 90090 | 257 |
| chain | stack | 59.577 | 40868 | 256 | 1 | 1 |
| chain | block | 69.026 | 41356 | 256 | 1 | 257 |
| chain | golden | 62.992 | 40804 | 256 | 1 | 257 |
| chain | periodic | 67.388 | 41568 | 256 | 1 | 257 |
| chain | descending | 67.208 | 42316 | 256 | 1 | 257 |

Cross locality stress: descending ~8.80x faster, 512.5x fewer application read calls, ~55.4% lower RSS, but pending frontier far larger; stack wins chain and spread. No general URT-specific advantage (golden loses to descending on cross, periodic loses too). Synthetic evidence only. No proof-translation throughput claim. Future repeat with buffer reuse (current cache allocates per miss), bounded frontier spill, warm queries and real trace.

Actual legacy sample leanprover/lean4export @15f6055e299ad5b89345e533cc2192f4cc00f659 examples/Nat.add_succ.ndjson blob d3cd35f1313b4e78b5fded9886e450112aa75def fetched by connector and executed in V8, official 3.0.0 format, not RH 3.1.0. All five schedules compared against separate FIFO oracle using the same legacy signed adapter, every declaration root. Counts: {"lines":572,"expressions":434,"declarations":32,"checks":160,"rootResult":{"expressions":434,"declarations":32,"edges":915,"peakPending":50,"peakBlocks":25,"activations":72,"seenPayloadBytes":131072}}. Replay block_actual_fixture.mjs includes git blob check for native replay (not native executed here). No semantic decoder or Lean verification inferred from agreement. Retains mixed edges, not declaration-only role witnesses.

Reproduce:
  node block_certificate.mjs
  node block_certificate.mjs prepare /tmp/block-run7
  for s in cross spread chain; do for m in stack block golden periodic descending; do node block_certificate.mjs bench /tmp/block-run7 "$s" "$m"; done; done
  git -C lean4export show 15f6055e299ad5b89345e533cc2192f4cc00f659:examples/Nat.add_succ.ndjson > sample.ndjson
  node block_actual_fixture.mjs sample.ndjson

RESUME HERE: coordinate with dependency/kernel lane to retain verified expression index and separately time solution scan, closure and output; implement spillable per-block frontier and cache-buffer reuse in this lane, then compare stack vs descending on a checksum-verified challenge trace before any full solution retry. RUN6 raw-ID-to-dense typed-role mapping remains pending until authenticated typed projection input exists. Do not replace peer exporter or launch duplicate jobs. HANDOFF TO: dependencies, kernel extractor, integration, structure, audit. Project OPEN.
