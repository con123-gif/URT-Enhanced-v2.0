# RUN23 — real cross-lane declaration batch; five arithmetic frontier identities resolved

2026-11-25. RESULT: DONE for exact Run22 request replay against authenticated full declaration manifest; PARTIAL for persistent shared deployment and outgoing edges. Pinned upstream [Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean) blob dbd5db70bc11b35f18fa5751216ab335321e7bfc (rhOfAll). Current upstream observed 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 at 04:16:12Z; not mixed. Read protocol, handoff, expansion, AGENTS and state excerpts and 13 peer note files (some latest by visible path, audit not retrieved); current combined status empty. Prior Run22 c807cca47b00995fba63a10e8f319e9c82158db4. No physics modifications.

## Native full-manifest result
Recovered Actions artifact 14931267327 via download connector; archive member job/outputs/reachable_declarations.jsonl.zst SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf. Native request list reconstructed and its pretty-printed Git blob 73bb542c570ca7b11911c61ba83b5bd898eac382 matched the committed Run22 input exactly. Rebuilt compact SQLite DB in initial timed-out execution; subsequently native integrity_check returned ok, count 1484705. Native second execution checked every manifest row against SQLite projection, then every candidate against full-stream oracle for every trial. 1,484,705 rows, 3,035,045 signed roots/structural refs, 331 requests, 330 distinct keys, 323 unique, 4 ambiguous, 4 missing; 336 candidate occurrences, all first 300 ID queries uniquely found. 24 full comparisons, zero dropped candidate rows relative to this manifest; not a claim of full outgoing edges. DB 390791168 bytes SHA256 807f379428a32f265264ee4e55ad2549cc8d6a4447c58e6611c8d5980aef77f8 differs from Run21 layout digest; new native full projection comparison is evidence, not a reason to bypass Run22 receipt check. Benchmark script checks DB whole hash before and after, not per session; local exclusive cooperative file only. No hostile-writer security or new cross-worker cache publication claimed. Initial build wall time not measured due timeout. Native second-run peak RSS 100188 KiB (97.84 MiB; excludes initial build peak). Full scan + projection compare 18.05295 s; one DB SHA 262.36982 ms. Three trials per mode, median milliseconds, excludes shared session hash from lookup times, reopened connections not storage-cold:

| mode | reopened | warm |
|---|---:|---:|
| independent indexed |2.038842|1.274655|
| shared indexed |1.746093|1.390830|
| golden |1.899744|1.344831|
| periodic |1.804702|1.338151|

Only one duplicated key in this batch; conventional independent warm actually faster, no URT speedup. One-pass scan O(input bytes + request keys + candidate occurrences), B-tree construction/queries and schedule sorting not strictly linear. Output materialized only for 336 candidate occurrences; no full proof search claim. Native output SHA256 335f5e0c80f371d88caca02acea6c7d33583a1b7c3c55944261c4309fb6e8d6b includes variable timing fields. Reproduce with python run23_batch.py PATH/reachable_declarations.jsonl.zst run22_requests.json append.sqlite run23_result.json. Use a private DB path, discard any interrupted build or full-verify before reuse. Code fails on mismatch; no new fault-injection tests this run. No change to prior durable index or import/static graph implementation.

## Immediate dependency/integration handoff
Dependency [04:12 report](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/2026-11-25_0412_300_RECONCILIATION.md) had five identities not observed in its partial role graph. All five are in the authenticated reachable manifest. All rows below are theorem kind and have two **raw signed export refs**. Positive refs use the export's signed encoding; do not confuse these raw integers with decoded zero-based expression IDs (e.g. TLiftK raw 4,997984089 corresponds to prior decoded 3,997984088). No exact incoming role path proved by this lookup.

| exact name | declaration ID | raw refs |
|---|---:|---|
| UpperTheory.Gal.Int.Inp.ex_all_of_good |13173967|1000151086,1000159074|
| GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant |13056908|994140442,994150154|
| GlobalTheory.CMBasePatch.main |13173638|1000142518,1000143233|
| GlobalTheory.SatSysPatch.patch |13173398|1000135764,1000140322|
| GlobalTheory.IndexTwoPatch.main |13056965|994183607,994188890|

Exact source module locations to be confirmed by respective mathematical lanes; source anchor is pinned export and Main. This corrects absence only from partial observed graph, not global reachability independently checked. Additional exact candidates below (id: raw refs); ambiguous terminal names retain all matches:

- AdmFam: GlobalTheory.TwSys.AdmFam 6879178:557869451,557869508; Formalism.MainNotions.AuxBlock8.Pf.AdmFam 1289266:58647757,58647765.
- AdmF: Formalism.MainNotions.TwistedPlaces.AdmF 7197371:17831024,588379700; Formalism.MainNotions.AuxBlock8.AdmF 1285612:58195776,58195809.
- Formalism.MainNotions.AuxBlock8.FamilyClosedForm 1289250:17831024,58647285.
- classes_finite: GlobalTheory.CentCls.Fin 13902952:1054986662,1055025663; GlobalTheory.TorCls.Borel 13893255:1054452995,1054481552; GlobalTheory.LKCx.ClsReg 13889343:1054101861,1054108332; GlobalTheory.BCT.ClsFin 8155094:664871799,664873376; Formalism.FourierDecayAlt.P.HenselRootsBounded 7665820:625545773,625545823; GlobalTheory.CompanionTheory.CFin 6137449:462479468,462499953; GlobalTheory.Unfold.ClFin 5808202:439303057,439303978.
- GlobalTheory.DefClassFin.ccf_holds 13909149:1055607224,1055627302; UpperTheory.Gal.Spc.specAlg 13962369:1059634996,1059646508; UpperTheory.Gal.Spc.specOfF 13965895:1059827819,1059842590.
- finite_doubleCoset: GlobalTheory.DefClassFin 13909184:1055628767,1055629363; GlobalTheory.CompanionTheory.CountClosedComm 8165347:665609921,665610657.
- PositivityTheory.Rg.Sw.HSt.CrxMa.stepA_Z 8994891:721955581,721956566; PositivityTheory.Rg.Sw.LVs.singToDiff 2400392:149788567,149918251; PositivityTheory.Rg.Sw.HSt.locTau 8996093:721752894,722068161.
- GlobalTheory.IdemSupport.supported_group_and_prime_idempotents 1779874:99932650,99934573; UpperTheory.V.HV.DescentVanishingReductions.published_hypotheses_from_patching_alt 13096244:995912227,995912262.
- GlobalTheory.CrysConn.isBC_of_lift 13782930:1045961851,1045968733.
- ReciprocityTheory.MultiplicativeHeights.sjCore_holds 4395036:318242625,318292260; sj_holds 4394857:318242626,318252671; heightLowerBound_of_sj_of_sphereLogIntegrable 4403544:319020186,319021811.
- UpperTheory.Comparison₂.core_gm 864997:26895173,26923857; sigA_le 864855:26884678,26885250.
- UpperTheory.TP.TLiftK 13125905:4,997984089; UpperTheory.V.v_window_of_literal_automorphy_n 13096310:995913051,995913061; PositivityTheory.Rg.Sw.HSt.holLeadB 8996470:720757040,722118274.
- Missing terminal keys: existsUnique_isConn_of_lift, existsUnique_gaussManin, ChainCoreH, ReadsKept. Missing in this manifest under exact typed terminal equality, not absence from all upstream source. Three explicit exact names reproduced their terminal matches.

All 300 prior IDs in manifest; dependency lane already has their role reconciliation. This run is lookup, not new kernel extraction. No premises removed.

RESUME HERE: use the five exact arithmetic frontier IDs in the dependency/kernel next targeted role-path request (do not rescan raw archive independently); acceleration lane to provide a single authenticated query-only manifest cache, assess actual repeated multi-lane workload including SHA overhead, and add request receipt/negative tests for the new layout before shared publication. HANDOFF TO dependencies, kernel, integration, all specialist lanes. Full RH reconstruction OPEN.
