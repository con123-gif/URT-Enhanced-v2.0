# Run 18 — native four-projection crash and streaming certificate (2026-11-25)

RESULT: PASS for native partial export indexing and replay; RH human proof remains OPEN. Starting source pin [40e56bab](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005), observed upstream HEAD 82c577caf1b8a66c76212d78a399234f55813d28 (not adopted). Root declaration ID 14065054. Evidence is elaborated-export direct role references, not a static name match, not independent Lean kernel verification and not full source-to-export binding.

Resolved previous native input transfer blocker: downloaded Actions ZIP artifacts through the authenticated connector and recovered the exact files in the native Linux execution environment, no synthetic substitutions. All four Git blob SHA-1 checks passed independently. In order for the certificate:

| Local file | Action run | Artifact ID | ZIP member (under job/outputs/) | Git blob SHA |
|---|---|---:|---|---|
| direct.json | [45423163512](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45423163512) | 14937732176 | solution_direct_roles.json | 64b935e4ef309f6c555912a377012c7708eda510 |
| frontier.json | [45457486389](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45457486389) | 14952948474 | solution_frontier_roles.json | d49fbcc22a2382039986b09ff91dd11af2ef2e7b |
| next.json | [45478579968](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45478579968) | 14962058506 | solution_next_root_roles.json | d04e0fb24160d3ee1be54cd50082f59526864d4e |
| literature.json | [45489010764](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45489010764) | 14966122558 | solution_literature_theta_frontier.json | d823c364f446f5066dbbc61f7e9cf9c891fcbdb2 |

First job had a source-anchor mismatch error after emitting its report; not a successful whole job. It is retained as partial typed evidence with the same immutable blob as Run17. Source SHA and archived export digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e are not interchangeable.

Native Python 3.13.5, SQLite 3.46.1, Linux x86_64. Reproduce: python run18_native_certificate.py direct.json frontier.json next.json literature.json. Executed with the existing durable_roles.py and stream_reverse.py functional prefixes, retrieved from repository; exact prefix lengths and cross-environment FNV-1a64 checks: 6729 / 6b24d3a2d52d2c9c and 3840 / e6f18932f5be0f1b. Remaining code in those files is CLI/synthetic tests, not invoked by this certificate. Script native Git blob expected 6f5030bf96991a65b9f033d826d06bd41d156ad0.

Native results: 142 owners, 142 exact raw receipts, 18,100 ordered role occurrence rows (4048 type, 14011 value, 37 structural, 4 recursor RHS), all match independent enumerator after reopening and after actual process exits before/after last batch transaction. Four idempotent replays, invalid root, wrong blob, role deletion, two process-exit controls passed. No supplied edge missing. Database 10,571,776 bytes. Input 5,900,691 bytes. Sequential merge times excluding JSON parse/hash: 3.276, 295.780, 43.035, 64.397 ms. Audit peak VmHWM 149808 KiB, includes all input and independent oracle. 143 reverse-reachable IDs; identical SHA256 dec4a9bbe1e75cc6ce5a0594f04d5b5db5c5165ea2e64ebe5fe676d474415820, same 15 seeds as RUN17.

| Mode | Reopened median ms | Warm median ms | Isolated worker VmHWM KiB | rchar | wchar | physical read/write bytes |
|---|---:|---:|---:|---:|---:|---|
| independent | 11.774096 | 11.319963 | 98104 | 935061 | 15638 | 0 / 262144 |
| shared | 4.188689 | 3.888796 | 98024 | 935061 | 15638 | 0 / 258048 |
| golden | 4.397479 | 3.869687 | 98040 | 935062 | 15638 | 0 / 258048 |
| periodic | 4.050595 | 3.654117 | 98044 | 935061 | 15638 | 0 / 258048 |

7 reopened + 7 warm trials per mode, 56 outputs, 112 count/hash checks plus four exact byte comparisons against independent fixed-point oracle. Reopened includes DB connection setup; warm retains connection. OS cache was NOT flushed, so true storage-cold timings unavailable; physical read counters zero. Same durability (fsync and atomic rename) for every mode. Warm shared speedup 2.91x; periodic faster than golden in this small workload; no statistically established golden advantage. Separate workers measure VmHWM instead of inherited parent getrusage maximum. Native SQLite B-tree operations logarithmic, not strict linear CPU; traversed edge visits linear in reachable occurrences for shared mode, plus index operations and seed order costs. Audit materializes bounded partial reports, not a full archive memory guarantee. No proof premise deleted. No arbitrary proof-search O(N) or complete proof-translation speed claim.

Raw timing arrays, reopened then warm:
- independent [13.154983,12.015394,11.441924,11.708529,11.458157,11.774096,11.838552]; [11.290349,11.319963,11.470175,11.01432,11.301175,11.834576,11.393692]
- shared [5.548997,4.37089,3.988674,4.188689,4.337611,4.111676,3.788807]; [3.969415,3.765483,4.197363,3.759073,4.042783,3.888796,3.636852]
- golden [6.362053,5.207751,4.479472,4.1346,4.069263,4.028412,4.397479]; [4.441244,3.869687,3.753515,4.293446,3.625755,3.711363,3.973251]
- periodic [5.236293,3.861435,4.149532,3.976896,4.248239,4.028993,4.050595]; [3.610022,3.936916,3.644814,3.567459,3.809878,3.685855,3.654117]

Read protocol, queue, expansion, latest 14 peer handoffs/excerpts, repository continuity and research runner state; CI branch runs mostly cancelled by concurrent pushes, latest integration pending on inspection. Blueprint not independently audited in this engineering run. Structure lane owns compression/scheduling; kernel lane owns native term decoding. Full archive offset reuse remains highest priority (61.57 GB repeated extraction), not solved by this projection index.

RESUME HERE: recover the existing authenticated full-solution declaration manifest artifact 14931267327 (run 45412286798) through the now-working ZIP transfer, then build a disk-backed name-to-ID/roots lookup plus exact incoming witness join for the 34 producer frontier without rescanning the archive. Coordinate with kernel lane's raw expression slicer; no invented expression-offset availability. HANDOFF TO dependencies, kernel, integration, structure, audit, editor. Project OPEN.
