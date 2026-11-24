# Cathedral–Lean RH Translation Swarm — coordination protocol

**Requested:** 2026-11-24. **Status:** OPEN — HUMAN PROOF RECONSTRUCTION NOT COMPLETE.
**Priority:** User-directed temporary reassignment of five existing hourly research bots to the RH translation project. This is a separate engineering/research lane and does not assert closure of any Cathedral physical gate or alter AGENTS.md.
**Source repository:** https://github.com/leanprover-community/riemann-hypothesis (formal RH proof, Levent Alpöge et al.). Starting source snapshot: `40e56bab026552e089d7afcfeff08d2defb9c005`; record source commits in all derived outputs. Always check whether a new upstream revision changes the conclusions.
**Working repository:** https://github.com/con123-gif/URT-Enhanced-v2.0 branch `newtons-cathedral`.
**Target:** A complete human-readable, exact, traceable reconstruction and *validated* simplification of the full formal proof, not merely a high-level summary. Explain each key implication, bound, and dependency, while preserving its source proof term, hypotheses and dependencies.

## Evidence already recovered (not the whole proof)
- `src/Main.lean`: `riemannHypothesis : RiemannHypothesis := rhOfAll`.
- `src/Supplements/Kernels/MainTheorems.lean`: `rhOfAll` uses `Formalism.VW.rh_of_every allChi`; `allChi` calls `UpperTheory.FinalTheorems.everyCharacter`.
- `src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean`: `everyCharacter` from `galoisLocalGlobalStrong_recParameter` via the row-to-window and literature-to-nonvanishing machinery.
- `src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean`: `EveryCharacter` is nonvanishing of all Dirichlet L-functions when Re(s)>1/2 (excluding trivial-character pole).
- `src/Formalism/GammaFactorNonvanishing/CritLine.lean`: functional-equation transfer from right-side nonvanishing to critical-line claim.
- `src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean`: prime-window-to-zero-free criterion; previously translated example `WindowHypOfRpow.lean`.
- Existing prototype (conversation artifact): linear source-declaration sieve, 11 selected files/excerpts, 22 declarations, 11 reachable matches, 11/11 tests passed. **Not kernel-extracted dependency graph; not all 17M lines; no proven URT advantage.** Recover or rebuild from source, never treat counts as full-corpus evidence.

**INTERLEAVED HOURLY HANDOFF:** Before each run, read `research_archive/2026-11-24_lean_rh_translation_swarm/HANDOFF_QUEUE.md`, including its five UTC/London 12-minute-staggered lane slots. Write an exact RESUME HERE handoff for the next scheduled bot. These are scheduled starts, **not** instantaneous finish-triggered starts and not guaranteed uninterrupted work.

## Five staggered dedicated lanes — one unique checkable result per hourly run

1. **DEPENDENCIES — URT–ZPE Physics Worker (repurposed):**
   Extract the Lean source/import/declaration dependency DAG starting from `Main.riemannHypothesis`, progressing toward *elaborated* proof-term constant references. Implement exact graph reachability and provenance; distinguish import graph vs name reference vs kernel dependencies. Memory bounded, complexity measured O(total input size + edges) where appropriate. Write results in `research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/`.

2. **STRUCTURE — Platonic Torus Research Bot (repurposed):**
   Investigate equivalence classes, graph dominators, reusable proof motifs, symmetry/structural compression without deleting any premise. Compare plain DAG topological ranking against fixed URT pi/e + golden-angle scheduler and a non-URT conventional baseline; assess coverage, readability, runtime, memory. Report negative controls. Work in `.../structure/`.

3. **MATH — Gravity Fluid Research Bot (repurposed):**
   Reconstruct exact human argument across the arithmetic/analytic bridge, prioritizing `EveryCharacter`, character boxes, zero-free windows, pole/prime estimates, theta and Galois dependencies. Write concrete theorems, quantifier scopes, hypotheses, intuition, and exact source locations; do NOT infer proof from filenames. Work in `.../math/`.

4. **AUDIT — Matter Neutrino Research Bot (repurposed):**
   Independently audit each proposed simplification for changed quantifiers, added assumptions, conflated names, hidden axioms/sorry or false proof claims. When a Lean environment exists, inspect elaborated terms and axiom dependencies and machine-check translations; otherwise label unverified. Develop counterexample/regression tests, use `#print axioms` or equivalent where available. Work in `.../audit/`.

5. **INTEGRATION — Cathedral Hourly GitHub Worker (repurposed):**
   Maintain a durable end-to-end translator, test suite, source-linked proof map, assembled plain-English chapter files and JSON graph with all provenance. Merge lane results, eliminate duplicates, fix CI, maintain a measurable completion ledger. Compare to non-URT baseline, never advertise benchmark superiority untested. Work in `.../integration/`.

## URT slop sieve policy
- **Drop from the main reading view, never from the evidence store:** generated identifiers, import noise, automatic tactic boilerplate, unneeded repeated algebra, duplicate natural-language paraphrases.
- **NEVER DROP:** hypotheses, quantifiers, parameter ranges, failed branches, relevant theorem references, proof obligations, nonconstructive steps, exception cases, axiom dependencies or cross-language translation equivalences.
- Original URT: `kappa=pi/e`, `theta=2pi/phi^2`. They may rank or schedule work as a *controlled experiment*. They do not confer validity, explain RH automatically, or guarantee an advantage over graph algorithms.
- For every condensed proof step, include source path + revision + declaration + local premises + consequence + dependency IDs + status: SOURCE-MATCHED / ELABORATED / RECHECKED / EXPLANATORY ONLY.

## Continuity and collision avoidance
- Each bot reads this file, `AGENTS.md`, `docs/RESEARCH_STATE.md`, `RESEARCH_LOG.md`, `RESEARCH_PROTOCOL.md`, current CI status, and any lane notes. Read other lanes' RESUME HERE summaries; take the earliest unclaimed task in your own lane.
- Do not change the existing Cathedral research Queue, physical gates, prior automations, or protected archive files as part of this experiment.
- Commit small source-linked artifacts on `newtons-cathedral` where write access is available; reread/rebase before committing to avoid conflict. Do not overwrite another bot's WIP. If a push or verification is unavailable, publish explicit checkpoint and failure reason rather than claiming success.
- Each run ends with: `RESULT`, exact file/commit, tests actually run, limitations, `RESUME HERE` one specific next action. No unsubstantiated success claims.

## Closure criteria (all required)
1. Full exact upstream-source coverage for the reachable kernel-level proof DAG under a pinned commit, including all imported external axioms and Mathlib dependencies relevant to correctness, with reproducible extraction.
2. End-to-end plain-language proof readable by a mathematically literate human, covering the entire essential chain and its deepest nontrivial theorems (not merely the final 10 lines).
3. Each simplified implication is logically equivalent to / soundly entailed by the cited Lean theorem and prerequisites, independently audited and automatically regression-tested; source references never silently missing.
4. Independently verified axiom/sorry/trust-dependency status; explicit human-vs-Lean verification boundaries.
5. Benchmarks comparing URT-guided method to a conventional baseline on speed, memory, completeness and explanation clarity; report losses honestly.
6. Fully reproducible output and independent review, with the user deciding when the project is solved.

**Do not self-declare the project solved or promise a date.** Continue on each scheduled run and report meaningful audited progress or exact blockers.

## RESUME HERE
First run: build an upstream module index and dependency coverage baseline anchored at `src/Main.lean`, check origin SHA and last source revision; assign distinct tasks across the five lanes, then begin extracting the first not-yet-explained upstream theorem with full hypotheses.
