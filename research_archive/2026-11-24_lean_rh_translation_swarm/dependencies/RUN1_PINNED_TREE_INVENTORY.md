# RH dependencies — run 1 — pinned source tree inventory
Date: 2026-11-24. RESULT: PARTIAL — exhaustive disjoint **GitHub-reported metadata partition**, not independently Git-verified; no complete source or kernel graph yet.

Upstream commit: 40e56bab026552e089d7afcfeff08d2defb9c005 (2026-11-20); actual root tree e517b335d21898fd2506ad538a1e1775c0aaa4e4. Latest upstream observed 343b1de38bbe4c5c66f1c1c0afd7c34e8645acdf; do not merge graphs. Working branch pre-write SHA 10794e971522a1a4cbbda7a03534638a2fa87633. Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity, research log/state/protocol, specialist acceleration and kernel RUN1_RESUME notes. No dependency directory existed at preflight. Physical CI run 45342893347 passed for 9aa5afb; unrelated to this result.

## Result
Root recursive query returned truncated=true (44,877 Lean entries in earlier response). Recursive queries for Development, AbelianVarietyTheory and Proofs were also truncated, so discarded those aggregates and split on their nonrecursive direct children. All terminal subtree queries reported truncated=false. Root verified via actual commit tree SHA; its only directory is src. Disjoint leaf partition: 58 rows (56 subtree responses and two direct Lean blobs). Counts reported by connector: **175187 Lean paths, 1030531854 source bytes**. These are metadata counts of paths, not unique blobs, not declarations, not reachable imports, not proof completeness. All 58 rows were individually observed through the pinned Git tree API and aggregated in V8; eight checks passed (row count, distinct paths, SHA format/positive counts, nonoverlap, and four direct-child counts). No elapsed full-corpus scan or RAM measured, no URT speedup. Local DNS failed for git; lean/lake/elan absent. Treat totals as provisional pending independent git ls-tree replay, not as proof of source integrity. The recursive API listing itself is not archived in full.

Parent links (relative to repo):
- src b41b516b1f7baee4d83ced235ecc71fd43c97695 direct children 11
- src/Development 5d52390aaf61586f3663f042188a769dde34c02b direct children 7
- src/Development/AbelianVarietyTheory 3f2edc0185b494ee03ccad51da30758374d204fc direct children 7
- src/Development/AbelianVarietyTheory/Proofs 6e317e55fe96e8ebf2cb6d537b49bfe58a32f57b direct children 36

Partition rows: relative to src, tree/blob SHA, Lean file count, sum of blob size.
```tsv
BuildAid	f1d4cdaa4600516b6f91366f1e01afb2e2020faf	5	850
CompanionTheory	d7655bb9c208325e248f5c7929eb931e725f08db	2027	11296366
GroundTheory	f69795fdee798f404ea2e4e399c295c35bb2df56	8507	54564791
Lemmata	8c5a4a58ee7d2e86e5104b4e59c6627359c859a0	167	452342
PositivityTheory	9e439ded245a886f2a5bb9dd3e88c36659b6f598	449	3109326
Formalism	942167f8b8761a0e783324800f23b31bafdbccaa	18254	164903481
Supplements	57912d7bf0c595a16244152a3a5adc5e65ef261d	3	1195
ReciprocityTheory	2d094891db4835bb99bb80189f8b3119159e2ce2	3845	28914051
Main.lean	dbd5db70bc11b35f18fa5751216ab335321e7bfc	1	433
Statements.lean	1cd1bce93344065936b2b392b23306254e0785ef	1	783
Development/DiscreteGroups	a0378f36deb46ce756c4d574f7ef88e4bf06acd7	215	1254731
Development/EtaleCohomology	41ea19937d64fa440053c6ff550801dafe30575d	1398	5781649
Development/ResolutionOfSingularities	a0324b7d2e358114977626862387abb49151c76e	499	8379570
Development/AutomorphicSpectrum	653935c6f5fae40749d9b605bfc95bac0f490149	15147	72332162
Development/WeilBound	3d918c7695c8f7230f906fc4212a1377f93598c3	7051	48734349
Development/AutomorphicArithmetic	f6d1f8f866d72cbe2b9d5de9d7c95641ae9454e4	18431	110939648
Development/AbelianVarietyTheory/BlockTheory	ff1e6c6ee2c3273f2693b71e781f3f1a56ca83ba	753	5341194
Development/AbelianVarietyTheory/Counterexamples	af6267b64be8d9afa1f676eee9b225976e67e4da	192	1051939
Development/AbelianVarietyTheory/CrystallinePeriods	a34be5d76d1b560d5b4d9527136df8f711dfa6aa	12	238990
Development/AbelianVarietyTheory/Definitions	37aa4867b73fdf0c46c6824e01b47d18b8448ac7	2198	26618685
Development/AbelianVarietyTheory/PublishedTheorems	a0a37180e8f939b2664afbf89f9de06d4fd653b7	493	3122818
Development/AbelianVarietyTheory/Statements	a6e78cf3f3b57a3dc8de1059bdf2d6facad54068	121	791646
Development/AbelianVarietyTheory/Proofs/AlgebraicCurves	fe74520e355c275072ad2fb6a24eedc52757925b	4	53661
Development/AbelianVarietyTheory/Proofs/CoherentCohomologyProofs	6f695da8220897e1cc8fcba18e46408e880a20d1	220	1921624
Development/AbelianVarietyTheory/Proofs/AbelianSchemeLawProofs	de70af416591b3475e516d7fee1317b31110f464	162	1877535
Development/AbelianVarietyTheory/Proofs/CharacterTheory	2b0dcd1c1f9a8717d0ab311123ea117dbe530360	232	631625
Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs	180e976153ae5f9d30efd6d18517247478d875d5	594	2657576
Development/AbelianVarietyTheory/Proofs/CovolumeBounds	22c913934b92f5cde0eb59499a5861cc42d1ba78	96	1022144
Development/AbelianVarietyTheory/Proofs/CubicalLineBundles	6be9d6967fac6ec67ff10598ade32691a39f40f0	495	2656705
Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations	72614a408ec9f4cc6a98f9ef70d36c5b6d8889a4	586	4205129
Development/AbelianVarietyTheory/Proofs/DegenerationProofs	681f12340889b871993ae657eb0bbbc52a7fbf90	1563	9896395
Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs	939eaf21afbe208046e836405701e204e93d93a5	5063	25667008
Development/AbelianVarietyTheory/Proofs/FlagMeasures	407beb32eb98e00122dc65111776a3d92c4d95ce	4003	23717553
Development/AbelianVarietyTheory/Proofs/DivisorProofs	3d9a754f55a69d6e7b0adbb2734d3ac5640b3e79	42424	189325218
Development/AbelianVarietyTheory/Proofs/FormalGroupCharts	9eb7eac10eff37b29f80e21c9afbbf7fb1c6d7c6	221	1186511
Development/AbelianVarietyTheory/Proofs/GenericRegularity	120f43fa7328488ec8963b4e7ebd44d87848e70f	251	1552764
Development/AbelianVarietyTheory/Proofs/HeightProofs	6a20991704fb571fb0917bbbcb4a8a3a11763764	599	3624835
Development/AbelianVarietyTheory/Proofs/FoundationProofs	b5afee208189aa2f418f231443bff0275cf76159	3411	16886338
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation	1d21852aef2d82ea314045918cf3a1e85ef8932e	1298	7157535
Development/AbelianVarietyTheory/Proofs/HermitianTraceForms	8e31f7e3ed117383b394e3bcbbdb98aee42db03d	10	219622
Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals	ac04a8c989a49a5798ac2374fc7673ca3d965df3	96	1659977
Development/AbelianVarietyTheory/Proofs/JetHarmonics	ccaf6830a0e56f7834bbf42813bf18f6e17925dd	1417	8203173
Development/AbelianVarietyTheory/Proofs/ModuliProofs	65bc17f3470b72e5ae1f1fbf2887f6a93e5b2e28	1539	11435512
Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues	5a067ca4f2b6e1a236665ecc585ce4ca5850faa3	8951	42591992
Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition	7501f7939fae16a6d24ad8f55ec8c9857c483a4d	7769	39670443
Development/AbelianVarietyTheory/Proofs/RingsOfIntegers	511eeaa4a2a8cfef5e18596a89b088bcdbc44fb9	325	2398217
Development/AbelianVarietyTheory/Proofs/ThetaFamilyOrigin	53feceb33c43dfcab1efb9b632a0372c2236ec75	45	425973
Development/AbelianVarietyTheory/Proofs/ThetaLawProofs	846e1a4b46be68d0f91d2ef3db46ebcd581bd8eb	356	2623042
Development/AbelianVarietyTheory/Proofs/SiegelThetaTransformation	1118700f5dbda6790cc92f3c52befa7868e3a55d	516	4161168
Development/AbelianVarietyTheory/Proofs/ThetaShiftProofs	0aac0eff5d46c66e2edc7a9db20eb960193c410a	476	4463938
Development/AbelianVarietyTheory/Proofs/SatakeParameters	ecfb08b15fc0b7093b8b55cfc81eb53526b23c76	3462	15293573
Development/AbelianVarietyTheory/Proofs/TorusHaarMeasure	dfa29cb65609b6765e20ddb63725bbe6ac418b7c	231	1700717
Development/AbelianVarietyTheory/Proofs/ToricGeometry	8864ebf2a4a181fffbdf4bbbcfa92d6f6bd0f580	106	1259861
Development/AbelianVarietyTheory/Proofs/TorusSplitting	d88e2657d48782a0528fc9b87fe28f3fb534afc5	113	529958
Development/AbelianVarietyTheory/Proofs/UniformizationProofs	171fe315cb28e0c49a4a8b59fef36985ccbc1484	869	6933671
Development/AbelianVarietyTheory/Proofs/TwistedOperators	9c84e057d3a92d063fa8ea3bdd661b60065a5dae	6642	36651101
Development/AbelianVarietyTheory/Proofs/UnramifiedDepth	47952b8b59d20f8c3137e73095d574a3e1f75cc4	506	3321175
Development/AbelianVarietyTheory/Proofs/UnitaryExistence	440257876f2f1590855feec2a9285c2cef5eb76a	767	5117586
```

## Replay
On a networked checkout of upstream, verify the pin and root tree:
```sh
git rev-parse 40e56bab026552e089d7afcfeff08d2defb9c005^{tree}
git ls-tree -r -l -z 40e56bab026552e089d7afcfeff08d2defb9c005 -- src | python3 -c 'import sys; n=b=0; carry=b""; f=sys.stdin.buffer
while True:
    chunk=f.read(65536)
    if not chunk: break
    parts=(carry+chunk).split(b"\0"); carry=parts.pop()
    for r in parts:
        meta,path=r.split(b"\t",1)
        if path.endswith(b".lean"):
            mode,kind,sha,size=meta.split()
            assert kind==b"blob"
            n+=1; b+=int(size)
assert not carry
print(n,b)'
```
Expected connector totals: 175187 1030531854. A mismatch invalidates the reported metadata counts and must be investigated; do not silently adjust. Each subtree can be independently checked by git ls-tree -r -l <tree SHA>; compare count and byte sum. This shell/Python replay is supplied but was not executed on RH. Streaming counting is O(metadata bytes) time and O(chunk + longest record) working memory, excluding git process memory; actual source scan still needs to read all source bytes. The V8 connector aggregation materialized one subtree at a time per request, not a measured streaming benchmark.

## Root proof boundary (source-matched, not kernel)
Pinned src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc contains global theorem riemannHypothesis : RiemannHypothesis := rhOfAll. Main is a module, not a namespace. Imports Statements and Supplements.Kernels.MainTheoremsAll. The latter imports MainTheoremsCritical and CorGKOf; Critical imports MainTheorems, ClassNumberThree, LenEqZeroIff, OnePoint. These are import edges, not proof-term edges. MainTheorems defines rhOfAll := Formalism.VW.rh_of_every allChi and allChi := UpperTheory.FinalTheorems.everyCharacter. Statements imports Mathlib and defines four other propositions; no local definition of RiemannHypothesis in that file. No axioms or hypotheses were removed; no kernel axiom claim. Acceleration peer already scanned 11 files; this session adds corpus metadata coverage rather than repeat its source-sample benchmark. Kernel peer has uncompiled exporter, not validated kernel evidence.

## RESUME HERE
Use the exact source tree denominator above only after independent git replay. Next dependency task: stream git cat-file --batch over the pinned paths, parse import headers with a Lean-aware scanner, retain unresolved names, build Main import reachability and exact blob provenance; share the inventory with acceleration and reconcile with kernel lane's eventual export. If no networked Lean host, continue bounded source fetch with explicit frontier. No physical queue changes.
HANDOFF TO: integration, acceleration, kernel extractor.
