# Run 12 — full native solution baseline completed; 26 specialist roots (PARTIAL)
2026-11-24. Source pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; observed HEAD 307cef33f046955ee79dba47e0d828d06496d75f, not adopted. Read protocol, queue, expansion, specialist handoffs and core repository continuity excerpts. No physical gate changes or duplication of URT compression. Linked blueprint not reopened. Code commit b3e72233cc1d434388dc5feb9de9ef72f77dd1ef.

RESULT: [native artifact](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798), ID 14931267327, ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97 independently matched. Node v22.16.0, zstd, same local sandbox. The full 1,484,705-row solution manifest now has a completed conventional 15-scan baseline. All 15 separate fresh process results, including the one absent short name, exactly equal shared full-row outputs in original order. The sum of scan timings is 67,698.35 ms (not a single process end-to-end wall time); one previously interrupted invocation excluded and rerun. All four shared/URT runs reproduce run11 full-row digest 5413912b32b684b8747bf25c48004e74532a88b9554ca41c00ee40deaf190e83. Corrupted compressed input (appended byte) rejected before decode.

|mode|scan ms|Node peak RSS KiB|rows visited|
|---|---:|---:|---:|
|15 separate baseline scans, sum/max|67698.35|115708|22270575|
|shared first|4902.30|105868|1484705|
|golden|4626.9|114252|1484705|
|periodic|4363.5|108636|1484705|
|shared repeat|4464.44|108004|1484705|
|26 new exact requests, shared|4719.5|108296|1484705|

Baseline summed scan vs shared first 13.81x; vs repeated 15.16x. Per-query baseline times ms: 4806.6,4731.3,4461.8,4542.3,4388.6,4507.7,4491.8,4469.4,4374.0,4317.2,4363.2,4567.8,4567.0,4564.6,4545.0. First/repeat means application invocation order, not OS cache purge. Peak RSS is individual Node process, not summed child RSS; physical I/O not measured. Equal per-scan census/range/duplicate-ID checks and compressed pre/post SHA256 outside timed scan. URT registration order alone does not show reliable additional benefit; periodic wins this single trial. O(B+Q+K) expected one pass, including expanded name bytes; optional sort O(Q log Q), independent O(QB). No general proof-search bound.

## Specialist lookup results
All 26 new exact tagged requests PRESENT. The following rows are from the authenticated reachable manifest, not independently re-elaborated terms or proof edges. Positive refs are one-based expression roots (type,value in these rows); subtract 1 only when handing to the peer zero-based expression exporter. Preserve full rows and kind; LinkG_at and LinkG are defs; others thm. Every pass inspected 3,035,045 declaration hard-root refs and 1,460,414 mutual metadata refs. No assertion of zero missed inner dependencies from this test. New batch full-row SHA256 51b46ac630b6007f4801894f2bba78a3355b2a6e12472ac3636e5ed7a6bd81fa.

Theta: independently fetched [pinned IwaTop.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/VacuumIwasawa/IwaTop.lean#L12-L17); namespace PositivityTheory.SiegelWeilFormula.Avac, theorem iwaQ_of' (hT : TAll) : IwaQ. Corrected name below, distinct from _k. No suffix promotion. Other exact requests originate in named peers' RUN11 handoffs, not all separately source-located here.

Name | declaration ID | encoded type | encoded value
---|---:|---:|---:
PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of' | 8981975 | 721071981 | 721077114
PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of'_k | 14034132 | 1064108806 | 1064113892
PositivityTheory.SiegelWeilFormula.Avac.vacK_of | 8953756 | 719345210 | 719345276
PositivityTheory.SiegelWeilFormula.Avac.vac_K' | 8953455 | 719330417 | 719332516
PositivityTheory.SiegelWeilFormula.Avac.vac_res' | 8953738 | 719344087 | 719345204
GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames | 8953593 | 719334572 | 719339157
GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf | 6375344 | 482469303 | 482473989
GlobalTheory.T.psiLevelPairCompatible_of_columnLevels | 6375353 | 482469303 | 482473990
GlobalTheory.Mem.R3.Grp.grp_levels_exist | 6375493 | 482488644 | 482497057
GlobalTheory.Mem.R3.pins_card_index_ranks | 4997285 | 369503821 | 369505607
GlobalTheory.MemLoc.frob_laws | 2367057 | 146721290 | 146724857
Deduction.iteratedDeriv_laplace | 868949 | 27135065 | 27135383
Deduction.iteratedDeriv_laplace_hasDerivAt | 868943 | 27133262 | 27135043
Deduction.landau_coeff | 868955 | 27135405 | 27136665
GlobalTheory.eq_zero_of_forall_residueField_functional | 11189057 | 883466002 | 883467093
GlobalTheory.PtVanish.connForm_eq_zero | 11189127 | 883478321 | 883487623
ReciprocityTheory.ChartRestriction.G.Chart.tan_lift | 3987187 | 279772183 | 279775949
ReciprocityTheory.ChartRestriction.G.Chart.tan_uniq | 3986738 | 279727724 | 279731467
ReciprocityTheory.ChartRestriction.G.Chart.glue_tan | 3987404 | 279800089 | 279808282
GlobalTheory.T.complex_section_finite_combination | 9615658 | 769100270 | 769111315
GlobalTheory.CompanionTheory.VanDescent.vanish_descent | 9615598 | 769100270 | 769111314
GlobalTheory.CompanionTheory.Ar.ClosedPt.exists_residue_eval | 9615438 | 769089428 | 769095537
GlobalTheory.CompanionTheory.Arith.DedekindDescent.linIndep_descent | 9615504 | 769096953 | 769099883
Formalism.MainNotions.LinkG_at | 869799 | 27224548 | 27224774
Formalism.MainNotions.LinkG | 869816 | 17831024 | 27224802
Formalism.L2.GlobalTheoryTheory.Loss.loss_bound_at | 1076940 | 41251314 | 41255196

## Replay certificate
Extract reachable_declarations.jsonl.zst from the artifact and run in separate invocations (split to fit local execution limits):
```sh
set -eu
f=reachable_declarations.jsonl.zst
for i in $(seq 0 14); do node replay.mjs "$f" single "$i" > "single_$i.json"; done
for m in shared golden periodic extra; do node replay.mjs "$f" "$m" > "$m.json"; done
python - <<'PY'
import json
s=[json.load(open('single_%d.json'%i)) for i in range(15)]
b=[x['out'][0] for x in s]
for m in ('shared','golden','periodic'):
 a=json.load(open(m+'.json'))
 assert a['out']==b and a['rows']==1484705
assert sum(x['rows'] for x in s)==22270575
e=json.load(open('extra.json'))
assert len(e['out'])==26 and all(len(x)==1 for x in e['out'])
assert e['resultSha']=='51b46ac630b6007f4801894f2bba78a3355b2a6e12472ac3636e5ed7a6bd81fa'
PY
```
Actual run independently compared the fifteen singleton outputs against both shared runs, and code checked each golden/periodic full digest and theta IDs. Tamper negative tested. New CI not run. Unresolved short names, exact deeper dependencies, source equivalence, kernel replay, and full human proof remain open. No premises deleted.

## RESUME HERE
Provide the 26 exact IDs above plus run11 anchors to the dependency/kernel lanes as one combined targeted type/value role projection; after their authenticated projected edges arrive, implement shared reverse invalidation and compare against independent closures with full edge equality. Do not independently repeat their archive scan or URT compression. HANDOFF TO dependencies, kernel, integration, audit, editor, theta, Landau, Galois, character boxes, literature, geometry, prime window. Project OPEN.
