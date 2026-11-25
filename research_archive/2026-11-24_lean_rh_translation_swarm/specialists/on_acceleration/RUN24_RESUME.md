# RUN24 — authenticated cross-lane manifest receipt

2026-11-25. RESULT: DONE for query-only batch receipt and full native independent-scan replay; PARTIAL for shared persistent DB deployment and role-labelled outgoing extraction. Pinned upstream https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean (rhOfAll); upstream main observed a18a350c3e5aad997766cff2670b292313e46574, not mixed. Read SWARM/HANDOFF/EXPANSION, AGENTS, state excerpt, Run23, latest peer commit list and dependencies, integration, structure, kernel, geometry, literature, math notes. Some other peer note fetches exceeded connector call cap; no claim of exhaustive continuity. Combined status at 07017df empty; no new CI claim.

Authentic artifact 14931267327, member job/outputs/reachable_declarations.jsonl.zst SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf. Native CPython + zstd on all 1,484,705 rows and 3,035,045 raw signed refs, all five independent group scans and one union scan. 106 exact arithmetic IDs reconstructed from dependency commit bd222c6780470673af6e0b65202471f6c5661a50; emitted TSV digest 9b98ff91a61fdbf09266761e21f80460e8b85ec7f977d8504618208afffed28e exactly matches peer, including original 99 value + 1 mixed + 6 manifest-only categories (classification is peer evidence, not independently proved by manifest). Six duplicated arithmetic IDs and seven current terminal requests from integration ca285468, geometry 05db6019, literature 28b8abb1. This is a replay of peer requests grouped into five batches, not actual measured concurrent worker execution.

One shared verified scan 5.71563 s vs five independent verified scans 27.43288 s (4.80x for this workload, one observation each, no OS-cache flush). Hash before/after each scan included; all candidate lists exactly equal. Targeted cache 20509 bytes; SHA256 3795bd2c1f3d629005d19a25fdf1434de85314b84da49ced5a1b64e7cf7d3844. Cache includes ID, typed name parts, kind, raw signed refs, manifest row ordinal and row SHA256, and complete candidate lists for exactly 113 keys / 119 request occurrences. Rebuild deterministically from artifact; this commit records trusted digest, not a remote full DB publication. Separate native --read process passed with pinned digest. Native peak RSS 96920 KiB (~94.65 MiB, whole process, not isolated mode memory). 120 cold/warm comparisons, 11 corrupt-input rejection tests; "cold" is reopened file read+hash+parse+validation, not storage-cold; warm uses already authenticated in-memory cache. 15 repeats per mode, medians in ms:

| mode | reopened incl authentication | warm |
|---|---:|---:|
| independent | .255325 | .016295 |
| shared | .242135 | .020561 |
| golden | .277618 | .039529 |
| periodic | .276717 | .040130 |

Plain independent fastest warm; no URT scheduling advantage. Shared scan is ordinary hash dispatch O(B+Q+C), expected with bounded record schema, where B=manifest bytes, Q=request count, C=candidate occurrences incl output. Golden/periodic sorting O(Q log Q). No arbitrary proof-search bound; no new outgoing elaborated edges, no source/static reference equated to proof dependency. Cache verification requires trusted external digest; self-hashing cannot authenticate arbitrary terminal deletion. Memory bounded in corpus size for fixed Q and C, not arbitrary result count. No hostile concurrent writer/durability guarantee; private output path required.

Exact newly requested candidates, each unique in pinned manifest under exact terminal string (not inferred source matches or root paths). Raw signed references positive, decoded expression IDs are raw minus one:
- GlobalTheory.TraceIso.exists_equiv_of_trace_eq 6674680: 514997827,515004413
- jacobson_density 1800736: 101690570,101691894
- ReciprocityTheory.MultiplicativeHeights.Closed.sphere_height_lower_bound 4403566: 319020184,319021814
- ReciprocityTheory.MultiplicativeHeights.heightLowerBound_of_sj_of_sphereLogIntegrable 4403544: 319020186,319021811
- ReciprocityTheory.MultiplicativeHeights.Closed.gauss_height_additivity 4398915: 318602766,318603125
- FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham 11224217: 883657118,887455967
- GlobalTheory.Published.AbelianDeRham.rigid_of_free_of_crystallineDeRham 11221518: 887222824,887224726

Reproduce: unzip -p github-actions-artifact-14931267327.zip job/outputs/reachable_declarations.jsonl.zst > reachable.zst; python run24_receipt.py reachable.zst run24_cache.json; python run24_receipt.py --read run24_cache.json 3795bd2c1f3d629005d19a25fdf1434de85314b84da49ced5a1b64e7cf7d3844. Native tested executable blob 5c2383dc3305a60d44b5de2094ce5fb6cdd87864. No premises removed; no independent Lean replay. 

RESUME HERE: dependency/kernel lanes add the seven exact IDs above to the next targeted role extraction without rescanning the full raw archive independently; acceleration lane ingest the resulting role projection once available and certify actual typed paths (or retain manifest-only). HANDOFF TO dependencies, kernel, integration, geometry, literature, Galois, all specialists. Full RH OPEN.
