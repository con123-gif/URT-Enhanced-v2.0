# RH translation swarm — 15-lane expansion (2026-11-24)

**Status:** Dedicated open research and engineering queue. **Not a proof of RH, and not a complete translation.**
**Original five bots:** :00 integration, :12 dependency extraction, :24 URT structural compression, :36 mathematical translator, :48 formal audit.
**Ten additional specialist slots (including one dedicated O(N) acceleration bot)** are offset at :04, :08, :16, :20, :28, :32, :40, :44, :52, :56 (UK time, hourly). These are scheduled starts, not finish-triggered continuous work. Existing five tasks remain enabled and unchanged.

All 15 bots MUST first read `SWARM_PROTOCOL.md`, `HANDOFF_QUEUE.md`, this file, relevant lane artifacts, `AGENTS.md`, research state and continuity, then select an unclaimed proof frontier. Work in distinct subfolders: `specialists/<lane>/`. For each source cite repository `leanprover-community/riemann-hypothesis`, pinned commit starting `40e56bab026552e089d7afcfeff08d2defb9c005`, exact path, declaration and premises. Every run yields a small tested or independently auditable artifact with an explicit status; never fabricate kernel verification. Do not modify baseline physics Queue or protected files; do not overwrite other bots' checkpoints. If code cannot execute, label limitations; if GitHub commit fails, give the complete recovery text and state it was NOT SAVED. The user decides completion.

## New specialist lanes
- **:04 O(N) SPEED — acceleration specialist:** Dedicated end-to-end speed worker. Build and benchmark full-corpus streaming/upstream indexing in O(total source bytes + import/reference edges) when input and edge sizes are counted; perform incremental hash-based updates, memory-bounded graph traversal, reverse dependency invalidation, caching, cheap duplication detection and parallel-safe extraction. Test against non-URT and conventional tools with identical source coverage, correctness and machine resources. Report wall time, peak RAM, I/O, and any non-linear stages; aim for actual performance improvements, not merely asymptotic notation. Keep every proof obligation, full provenance and explicit Lean-kernel validation boundary.
- **:08 KERNEL — kernel-extractor:** Create a Lean-native exporter for elaborated declaration expression constants and transitive theorem dependencies, including `#print axioms` audits, when runnable; fallback to static analysis explicitly labelled. Prove no dependency drop.
- **:16 PRIME — prime-window:** Translate analytic prime-power weighted sums, `Gm`, `WindowHyp`, `WindowHypOfRpow`, source-linked with quantifiers and bound conventions; produce exact derivations rather than prose alone.
- **:20 LANDAU — landau-criterion:** Translate `DedekindLFunctions/LandauTheorems` and the pole/Laplace zero-free criterion; verify each implication, exceptional zero or pole and range.
- **:28 THETA — theta-lifts:** Translate `ThetaCorrespondence` source theorem chain supporting `every_character_of_literature_of_vWin`; track hypotheses and character-construction maps.
- **:32 GALOIS — galois-representations:** Trace `Foundations/GaloisRepresentations/IntegralStructures/RowSrc` into `ThetaParseval` and local–global compatibility; state precise required arithmetic inputs.
- **:40 WINDOWS — character-boxes:** Trace `CharacterBoxes/MainConclusion`, `EveryCharacter`, `ShapeWin`, `SupplyChi`, imprimitive reduction; explain quantifier transfer.
- **:44 LITERATURE — external-provenance:** Audit `PublishedTheorems` and `OpenLiteratureStatements` wrappers for actual antecedents, trust boundaries and cited mathematical sources; never equate a statement name with a proof or published theorem.
- **:52 GEOMETRY — positivity-heights:** Explain the arithmetic-geometric positivity, intersection estimates, divisor/height inputs supporting the final nonvanishing argument; find dependencies and possible lemmas worth compressing.
- **:56 EDITOR — proof-chapters:** Assemble self-contained human-readable chapters with lemma→reason→source→status, glossaries and theorem-proof correspondences. Compare reader understanding without skipping assumptions; link independent audit requests to :48 bot.

**O(N) bot handoff:** `specialists/on_acceleration/`; benchmark against the full original proof rather than extrapolating tiny excerpts. URT's original recursive π/e and golden-angle mechanisms can be investigated as optional schedulers, but must justify any speed claim with an ablation study. This role has independent priority from URT mathematical compression (:24).

## Scheduling and collision rules
Existing five bots still run hourly. Each new bot is independent, may overlap in clock time, and must inspect the other bots' last committed `RESUME HERE` notes; no guarantee of uninterrupted 24/7 compute. If a bot finishes before its next hourly run, preserve its checkpoint and the next scheduled bot picks it up. For each new file use unique relative names within its lane. Integration bot at :00 may update consolidated coverage, but does not mark final closure. No invented completion dates.

## URT experiment
The fixed original golden-angle and pi/e recursion can rank presentation/exploration *only*. Always compare against a deterministic conventional (topological/salience) baseline; never discard any necessary implication or claim a time advantage absent matched data. Plain-English simplification can suppress tactical boilerplate, but the proof DAG and exact provenance must remain accessible.

## Metrics each lane reports
Source modules inspected; exact declarations and edges mapped; source-vs-elaborated classification; proof obligations fully translated vs partial; tests run; changed assumption counts; estimated complexity; last verified upstream SHA; next executable step. A completion percentage requires a defined denominator (e.g. reachable elaborated proof graph), not an extrapolation from selected files.

## RESUME HERE
Create the ten scheduled specialist roles and check success via automation dashboard. First runs map their respective main entrypoint and produce independent source-backed checkpoints. Integration bot reads this expansion and allocates follow-ups. 
