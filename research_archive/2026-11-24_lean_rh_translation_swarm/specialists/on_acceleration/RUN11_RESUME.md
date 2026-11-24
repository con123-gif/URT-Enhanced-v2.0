# Run 11 — authenticated native RH declaration-manifest replay (PARTIAL, executed)
2026-11-24. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD 307cef33f046955ee79dba47e0d828d06496d75f observed, not adopted. Read protocol, queue, expansion, latest specialist handoffs, AGENTS, state/log/protocol excerpts; external blueprint not reread. Work confined to acceleration. Dependency peer's six-anchor reconciliation, not duplicate role extraction.

RESULT: downloaded actual artifact 14931267327 from [run 45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798); ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97 matches GitHub. Both contained Zstandard manifests independently hashed to the pinned digests in code. Node v22.16.0, native zstd, fresh processes, same container, 15 exact tagged queries (all string components; no inferred suffix equivalence). All selected complete rows hashed, including mutual metadata. Scope is membership in reachable export, NOT a static name resolution proof, a complete direct declaration dependency DAG, proof translation, or kernel recheck. Earlier source/import/invalidation tools remain intact. No change of premises.

Native measurements (scan milliseconds, Node max RSS KiB; /usr/bin/time peak RSS within 384 KiB of these; child RSS not summed). Each scan has equal validation; compressed digest checks before and after timed region, first precheck 5–12 ms challenge and 47–55 ms solution. First process / repeated process = application cold/warm only; OS page cache was not purged, storage physical I/O not measured.

| corpus | mode | scan ms | max RSS KiB | rows |
|---|---|---:|---:|---:|
| challenge | shared first | 204.4 | 49364 | 53242 |
| challenge | golden | 182.3 | 47576 | 53242 |
| challenge | periodic | 180.8 | 47244 | 53242 |
| challenge | shared repeat | 151.5 | 46096 | 53242 |
| challenge | independent 15 scans | 2256.6 | 84804 | 798630 |
| solution | shared first | 4339.5 | 110884 | 1484705 |
| solution | golden | 4336.9 | 107100 | 1484705 |
| solution | periodic | 4330.8 | 106856 | 1484705 |
| solution | shared repeat | 4348.6 | 108172 | 1484705 |

Challenge baseline/shared first 11.04x; baseline/shared repeat 14.89x. Same full-row SHA256 across all five challenge and four solution runs, separately checked via Python JSON digest/match equality. One tamper control (append byte) rejected. Full 15-query independent solution baseline twice terminated at execution limit before emitting result; do not infer speedup. URT only changes query registration order; no reliable additional advantage. One-pass O(B+Q+K) expected with fixed-width IDs and total expanded name bytes counted, plus O(Q log Q) for optional scheduler; baseline O(QB). 3,035,045 solution declaration-root hard refs and 114,679 challenge refs inspected per pass; these are not all expression dependency edges. Positive expression roots checked for range, not independently expanded.

Challenge result digest 6ddb4da465f975c633bf9853942e5bf758736f0e0e90785cb388625c0bb306dd (1/15 names found; root only). Solution result digest 5413912b32b684b8747bf25c48004e74532a88b9554ca41c00ee40deaf190e83 (14/15 exact requests found). All six top anchors agree in declaration ID, type and value expression roots with peer [role report](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json), blob 64b935e4ef309f6c555912a377012c7708eda510. Roots in manifest are one-based; report zero-based. No independent recheck of inner role witnesses.

New peer targets, id, encoded type/value roots:
GlobalTheory.divTied3_read 6078879 458452916 458455888
GlobalTheory.T.divisionCompatible_at_readIdentifications 6078946 458452916 458455889
Deduction.poleData_abstract 868460 27052341 27058371
Deduction.landau_cauchy 869149 27162294 27163272
Deduction.landau_pole_asym 869232 27164513 27168267
PositivityTheory.Xj7N.norm_small_le 9616555 769193561 769198767
PositivityTheory.Xj7N.local_unit_map_surjective 9613757 769150835 769154759
ModelDimension.cusp_form_extension_vanishing 9616232 769162544 769164447
Avac.iwaQ_of' absent as requested; separate literal grep recovered candidate exact export name PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of' ID 8981975, refs 721071981,721077114; also distinct iwaQ_of'_k ID 14034132. Preserve both names; source namespace binding and typed-role witnesses remain open. No suffix acceptance, no assertion of source nonexistence, no missing hard-reference count inferred from this membership test.

Replay from artifact outputs: node manifest_real_benchmark.mjs challenge challenge_declarations.jsonl.zst shared (also golden, periodic, baseline); node manifest_real_benchmark.mjs solution reachable_declarations.jsonl.zst shared (also golden, periodic, baseline). Compare resultSha within corpus to recorded expected; any difference fails replay. Negative control: append byte to copy of challenge zst, run shared, require nonzero exit. Earlier run10 certificate covers display ambiguities; this benchmark is exact requests only. Full results are local native measurements, new CI not run.

## RESUME HERE
Run full solution baseline as 15 separate one-query scans with bounded invocation time, sum scan costs transparently (do not call this single-process wall time); compare each selected full row to shared output and verify exact pinned source namespace for theta candidate before registering corrected query. Provide the new root IDs above to kernel/dependency lanes for targeted role extraction; do not repeat billion-expression closure or URT compression. HANDOFF TO kernel, dependencies, integration, theta, Landau, character boxes, geometry, editor. Project OPEN.
