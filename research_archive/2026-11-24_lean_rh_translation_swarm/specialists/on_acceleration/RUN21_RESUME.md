# RUN21 — matched full-manifest staged build and verified publication

2026-11-25. RESULT: DONE for native matched compact construction/verification, atomic publication controls and amortization; PARTIAL for cross-worker persistent artifact and full RH translation. Source [pinned Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean), blob dbd5db70bc11b35f18fa5751216ab335321e7bfc re-fetched. Latest upstream observed fcb6eac7534875d32d68030967e2deae6d686151; no equivalence asserted and no repinning. Run20 9cd16155b26ed311273eba8b33a9b9524d8cb0ac. Read protocol, handoff queue, expansion, AGENTS, research state/log/protocol/continuity excerpts, CI #413 (45534517299, physics checks only). Inspected 14 latest peer commits and visible RESUME HERE notes; editor excerpt had none. External blueprint not reread (no mathematical derivation in this run). Integration 8a6c269a has reconciled coreAll/rest; dependency 276bc239 owns further outgoing role extraction; structure 9d77c3e9 owns direct CSR; kernel c50fdeaf owns TLiftK term paths. No duplicate work or physical gate changes.

## Native full-data execution

Downloaded [artifact 14931267327 / run 45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798); ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97; extracted reachable_declarations.jsonl.zst SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf. Base compact_run20.py native Git blob hash 80bd60e3884d62ecccd1c439e6a3ab9b78ff6932 matches repository. New staged_run21.py adds exclusive advisory flock across each stage and atomic no-overwrite link + fsync publication. Completed one successful full build and roundtrip per layout, separate native processes with same 64 MiB SQLite cache, disk temp store, FULL synchronous. An earlier clustered attempt was killed by execution limit after append publication; it was quarantined and rebuilt rather than assumed valid. One successful trial each, warm OS cache not controlled; do not extrapolate to other hardware.

| phase | append order | ID clustered conventional |
|---|---:|---:|
| load seconds | 18.158175 | 19.634636 |
| indexes/commit/close seconds | 2.898666 | 3.190079 |
| integrity seconds | 2.745053 | 2.959505 |
| all-row verify seconds | 17.413761 | 18.359788 |
| publish phase total seconds | 20.164082 | 21.326132 |
| total successful stage seconds | 41.220923 | 44.150847 |
| bytes | 390791168 | 564961280 |
| load peak KiB | 231776 | 231924 |
| publish peak KiB | 168720 | 168844 |
| GNU time FS output blocks load | 966832 | 1312632 |

Append occupies 30.83% less disk, 6.64% less build+verification time (single trial). GNU time FS output blocks are OS-reported counters, not measured device traffic. Input reads warm/cached, not storage-cold. Both integrity checks and all 1,484,705 projected rows per layout passed (2,969,410 row comparisons); all 3,035,045 signed hard-root entries per layout preserved. Mutual-block metadata retained only in original authenticated evidence store and raw-row digests, not individually in compact index. This is not an elaborated constant-edge census, nor source import extraction. No premises removed.

## Matched lookup and amortization

One conventional authenticated streaming projection scan for same 12 IDs: 15.446155 s. 21 trials for each schedule/layout/state (252 comparisons), all matched full truth records; 24 exact-name checks and four missing/ambiguous terminal checks. Peak process KiB 99984, includes scan. Lookup medians in ms:

| layout | schedule | reopened | warm |
|---|---|---:|---:|
| append | shared | .200000 | .062153 |
| append | golden | .202763 | .066049 |
| append | periodic | .206108 | .064977 |
| clustered | shared | .195312 | .058367 |
| clustered | golden | .195954 | .062153 |
| clustered | periodic | .186009 | .061042 |

Conventional shared warm fastest within both layouts; no URT-specific improvement. Reopened means new connection, not flushed OS cache. Append total build/verification cost recovered after about three repeated equivalent batches on this machine (41.22/15.446); clustered also three (44.15/15.446). Excludes artifact transport; workloads known in advance may prefer a single union scan. B-tree insertion, indexing and schedule sorting are not strictly linear; underlying streaming pass O(expanded bytes + signed refs + maxID/8), fixed schema, lookup O(Q log N + output). No arbitrary proof-search complexity claim.

Four executable negative controls: lock contention, refuse existing interrupted stage, malformed stage cannot publish, existing destination cannot be overwritten. All passed. Cooperative lock is per canonical destination; not a defense against arbitrary external modification. Failure after link before stage unlink may leave a verified public file and a redundant stage link. Published DB is immutable by convention; subsequent use requires trusted filesystem or reauthentication.

Append DB SHA256 6967b534c57a38bdec7deced48f8b2756c0bfade7f1454c5f1f0fe6c38e3403d equals Run20 byte-for-byte (reproducibility on this SQLite environment); clustered SHA256 9dbb0b3ba02e2aecce024c5ca8d123e30c6525c425f22c652f42d052045a96bf. No DB uploaded or assumed persistent; remote source artifact + code provide reproducible rebuild. No authorized shared cache upload interface exercised. Native benchmark executed before adding controls-only branch and removing unused import; final controls executed successfully.

## Reproduce (fresh output directory, Linux, Python, zstd)

    set -eu
    python staged_run21.py controls manifest.zst
    for mode in append clustered; do
      /usr/bin/time -v python staged_run21.py load manifest.zst "$mode.sqlite" "$mode"
      /usr/bin/time -v python staged_run21.py publish manifest.zst "$mode.sqlite" "$mode"
    done
    /usr/bin/time -v python staged_run21.py bench manifest.zst append.sqlite clustered.sqlite

If interrupted, preserve stage and journal together under an isolated name after ensuring no writer is active; do not publish unless integrity and all-row verification pass. No independent kernel replay, source equivalence check across upstream revisions, or completed human proof.

RESUME HERE: implement receipt-keyed immutable reuse with explicit whole-file digest verification and batch name resolution for newly requested specialist declarations; benchmark verification amortization and compare a single union scan versus multiple workers' repeated requests. Do not upload huge Git blobs or duplicate dependency/CSR lanes. HANDOFF TO integration, dependency, kernel, Galois, theta, geometry, character boxes, structure, audit. Project OPEN.
