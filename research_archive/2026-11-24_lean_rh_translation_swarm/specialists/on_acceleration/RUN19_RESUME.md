# Run 19 — persistent full-manifest lookup and exact 34-producer witness join (2026-11-25)

RESULT: PASS for native lookup and selected projected value-path reconciliation; PARTIAL overall. Source pin [40e56bab026552e089d7afcfeff08d2defb9c005](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005); observed main b2f365a68500e2bde98cd60a2324263fc62fba10, not adopted. The source pin and solution export digest are distinct evidence identities. Root source [src/Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean), global riemannHypothesis ID 14065054. Static source/import references are not elaborated proof-term edges. No mathematical premises removed, no new translation closure, no independent kernel recheck.

## Native results
Artifact [45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798), ID 14931267327, ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97. Extract job/outputs/reachable_declarations.jsonl.zst; compressed SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf, 38,823,812 bytes. Both digests independently verified. All 1,484,705 records indexed with unique tagged names and IDs. 3,035,045 encoded declaration hard-root entries and 1,460,414 metadata entries validated against census; negative structural targets checked for membership, positive expression root ranges checked (not inner expression traversal). Five earlier metadata-only absences not promoted to hard dependencies. Exact raw rows stored in SQLite, 1,067,364,352 bytes. Build committed successfully but initial process hit execution limit during integrity_check before publication; recovered committed temporary file, ran quick_check (1.453s), renamed, then full integrity_check with 256 MiB cache (4.320s, ok). Thus no valid complete build wall time or build peak RAM claim. The recovered database itself is local ephemeral, not uploaded; reproduce from artifact and code. Receipt identifies input, not cryptographic attestation of every cached output after arbitrary tampering.

Same 40 exact ID requests (6 anchors plus 34 producers), identical full-row bytes to conventional single shared scan of authenticated manifest; 40 exact tagged-name comparisons and 66 repeated ID batch comparisons passed. Native Python baseline 13.1850372s for validated shared scan including pre/post SHA checks. Prior Node baseline not same interpreter and not used in this comparison. Query-only timings after building index:

| Schedule | Reopened median ms | Warm median ms |
|---|---:|---:|
| conventional shared | 0.370911 | 0.199648 |
| golden-angle | 0.452646 | 0.218857 |
| periodic | 0.481911 | 0.236068 |

11 repetitions per schedule and connection state; reopened includes opening connection and receipt verification, OS cache not flushed. Reused-index benchmark process VmHWM 100248 KiB (includes baseline scan); isolated build/lookup peaks, storage-cold timings, physical I/O, and amortized build break-even not measured. No universal URT advantage: ordinary order fastest here. This is repeated membership lookup acceleration, not full proof reconstruction. Comparison includes saved prevalidation and parsing work, not equal fresh authentication costs. SQL B-tree operations and index construction are not strictly O(N); stream validation is O(expanded manifest bytes + refs + max ID/8), query O(Q log N + output bytes) plus optional Q log Q scheduling. Raw record size and SQLite caches bounded by configured resources, not full-source memory proof. Exact tagged components avoid flattening numeric and string names. Terminal _proof_1 has 71,506 candidates; never auto-promote a suffix. Negative controls actually run: same-size compressed byte corruption, appended report byte, wrong cache receipt, absent exact name, ambiguous terminal; all handled correctly.

## Exact incoming-path join
Run18 four immutable report blobs and artifact IDs retained, independently verified again. Joined 142 owners to manifest roots, 4,025 distinct manifest identities (owner or explicit value target), 1,263 observed value-reachable IDs, 34/34 integration-selected unexpanded producers, 231 path edge occurrences (shared edges repeated across paths). Each chosen path keeps incoming owner, target, role=value, kind=explicit_const, zero-based caller expressionRoot, witness, multiplicity and report blob. Every traversed explicit target's tagged name and kind matched manifest; every owner type root and available value root matched. Other roles retained in original reports/Run18 index, not discarded. This is a projection join, not fresh raw-term witness verification. Reproducible JSON SHA256 da2afdaf80384ed27f548aee54f1e0b033e45198670e9e957c4cebd8c1f66646. Integration's 23:00 concordance defines frontier; 00:00 integration and kernel Run19 request TLiftK caller body. Prior 34 remain the fixed historical frontier; newer projections can expand them.

## Priority raw-slicer requests (zero-based expression IDs, subtract 1 from manifest refs)
| Exact name | Declaration ID | Type | Value |
|---|---:|---:|---:|
| UpperTheory.TP.TLiftK (def) | 13125905 | 3 | 997984088 |
| UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift | 13235288 | 1004086648 | 1004086661 |
| UpperTheory.TP.TLiftK._proof_1 | 13125906 | 9078396 | 9078404 |
| UpperTheory.TP.TLiftK._proof_2 | 13125937 | 9838915 | 9838921 |
| UpperTheory.TP.TLiftK._proof_3 | 13125938 | 9838937 | 9838943 |
| UpperTheory.TP.TLiftK._proof_4 | 13125939 | 997980875 | 997980883 |
| UpperTheory.Gal.CertificateRingHomMap.pProjOne_holds | 13871527 | 1052651031 | 1052660505 |
| UpperTheory.Gal.CertificateRingHomMap.pTracePow_holds | 13962196 | 1059622222 | 1059628383 |
| UpperTheory.Gal.Spc.specAlg | 13962369 | 1059634995 | 1059646507 |
| UpperTheory.Gal.Spc.specOfF | 13965895 | 1059827818 | 1059842589 |
| UpperTheory.Gal.Spc.specTopG | 13966873 | 1059933754 | 1059934839 |
| PositivityTheory.Rg.Sw.HSt.holLeadB | 8996470 | 720757039 | 722118273 |
| PositivityTheory.Rg.Sw.HSt.asmH_of | 8991968 | 721758566 | 721770742 |
| PositivityTheory.Rg.Sw.HSt.locTau | 8996093 | 721752893 | 722068160 |
| PositivityTheory.Rg.Sw.HSt.crLem | 8996469 | 721752895 | 722118264 |
| HurwitzZeta.completedHurwitzZetaEven_residue_one | 866011 | 26972462 | 26972723 |

Galois/theta/Landau requests below the first six rows found by unique terminal lookup in this manifest; exact names provided, but source binding and projected incoming paths not checked for those additional rows here. GammaDeriv and Lambda_residue_k absent under exact terminal lookup; no claim of nonreachability under alternative names. Kernel lane can now target actual TLiftK definition, not just auxiliaries. Galois integration producer incoming last edge 13235289 -> 13235288, caller value root 1004086672, witness 1004086667, multiplicity 1, report d823c364f446f5066dbbc61f7e9cf9c891fcbdb2.

## Replay
Code commits edf5b4ceea4739826d915994dad431daf1506c18 and dba844154ced6d1f66cb2fa6ea1e12836e9feca3, repository blobs d942437d545b723cfed9c6f651c545cf9223dfdf and aea6be27c4e91bf2970d0a034b4afca5451b2f74 independently matched native executed files.
```sh
set -eu
python manifest_index_run19.py reachable_declarations.jsonl.zst index.sqlite
python frontier_join_run19.py index.sqlite solution_direct_roles.json solution_frontier_roles.json solution_next_root_roles.json solution_literature_theta_frontier.json > frontier_join.json
echo 'da2afdaf80384ed27f548aee54f1e0b033e45198670e9e957c4cebd8c1f66646  frontier_join.json' | sha256sum -c -
```
The four reports are from artifacts 14937732176,14952948474,14962058506,14966122558 respectively, members under job/outputs/ as named above. The first report job failed later source-anchor validation; its exact partial report remains independently hash-bound. Full integrity check on a fresh build may exceed a short execution limit; do not publish partially built database. Do not assume cached files persist across sessions. No source/physics modifications outside acceleration lane. Protocol, queue, expansion, own Run18, integration 23:00 and 00:00, nine specialist handoffs, original lanes' available notes, repository continuity and CI summary inspected; audit directory lacks markdown top-level notes, not fully reread; blueprint not reread or relied on. General CI #407 PASS at 01:06:19Z, not this new code or a kernel replay.

RESUME HERE: add append-order bulk construction and streaming full-cache roundtrip certificate to eliminate random-write/integrity bottleneck, then benchmark fresh build versus reused lookup and persist an authenticated compact name/ID/root index in an available artifact (no huge Git blob). Feed TLiftK definition roots 3/997984088 and Galois/theta requests to kernel/dependency lane; they own raw-term extraction, structure owns compression. Do not rescan raw archive for membership. HANDOFF TO kernel, dependencies, integration, Galois, theta, Landau, editor, structure, audit. Project OPEN.
