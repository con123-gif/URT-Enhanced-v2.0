# One-equation / ten-page RH mission — clean live entry

27 November 2026. User instruction: remove redundant mathematics from the live proof, organise everything, retain evidence, and prioritise closing the real remaining obligations. **RH reconstruction remains OPEN.** The target is a rigorous human-readable proof within ten normally formatted pages if possible, not a promise of length or proof completion.

## Start here every run (all 15 lanes)

1. [LIVE_PROOF_SPINE.md](LIVE_PROOF_SPINE.md): one current compact proof path.
2. [LIVE_OBLIGATIONS.md](LIVE_OBLIGATIONS.md): current gaps, preferred derivations, owners, verification status and next work. Read the entry for your lane and relevant newest peer commits before working.
3. [HUMAN_PROOF_COMPACT.md](HUMAN_PROOF_COMPACT.md): detailed evidence archive and working derivations. Consult exact sections on demand. Do not append repetitive versions to the live spine. The old-pin manuscript is separate: [HUMAN_PROOF_ONE_EQUATION.md](HUMAN_PROOF_ONE_EQUATION.md).
4. Existing SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES and AGENTS instructions remain binding where compatible; the compact pin and this current queue supersede historical five-lane/old-pin priorities. All 15 schedules and assigned domains unchanged.

Primary source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Never transfer old-pin checks as compact verification.

## Continue without another proceed — user instruction, 27 November

All 15 existing lanes continue on their existing schedules until the stated
proof/audit closure criteria are met and the user accepts completion, or
the user pauses the work. Within each available run budget, resume the next
nonduplicate unresolved step without asking for another "proceed"; do not
end at a status-only update. Save substantive results and failed routes,
leave one executable next action, and let the next scheduled run resume.
Keep missing mathematics distinct from extant derivations awaiting audit
or replay. Preserve assignments, source pins and protected workflows. The
scheduled runs have per-run limits; never claim guaranteed gap-free work.

## Cleanup and closure-first rule

- Keep one preferred derivation per actual declaration/caller, with exact premises. Reuse earlier derivations rather than reopen them absent a specific discrepancy. All superseded, failed or redundant versions stay in the evidence archive. Do not delete source, source hashes, hypotheses, counterexamples, original/reduced graphs, or unverified obligations.
- The editor and integration workers are the maintainers of the live spine and ledger. Specialists provide small source-linked deltas, not another accumulating full manuscript. Every run either closes an actual gap, audits/replays an existing proof, connects an existing supplier to its exact caller, or documents a specific blocker. Avoid irrelevant improvements, repeated scalar tests and duplicate derivations.
- Coordinate native replay through the existing shared compute runner. Do not edit protected workflows or infer success from a job label. No unsupported progress percentage, no claim of full RH until proof and audits actually complete.
- URT and other reduction methods remain tools for finding valid conventional mathematical reductions, not extra mathematical assumptions. URT-specialist lane remains the sole dedicated URT lane, other lanes use the common methods as applicable.

## Archived previous mission

The complete previous mission and all historical instructions/checkpoints are preserved at [immutable pre-cleanup revision](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/93f1fe32928fb5427dc20572c3c594a8e549aaf5/research_archive/2026-11-24_lean_rh_translation_swarm/ONE_EQUATION_MISSION.md) (blob a69122b6ad568910a45d2bc13961ab9da4855143). Read exact archived supplier notes when relevant, not every historical paragraph every run. No evidence is being erased. Detailed manuscript remains unchanged in this cleanup.

## Mandatory unified reduction engine — all 15 RH lanes
25 November 2026. User explicitly directs ALL bots to use ALL reduction techniques. This section is binding for every RH lane and supersedes any older translation-only objective. Each bot retains its assigned mathematical domain, but uses the same reduction pipeline and shared evidence. Do not duplicate the engine or already checked jobs.

### Native verification baseline (confirmed PASS)
- GitHub Actions run 45577239749: compute/rh-recursive-reduction-strip-root-20261125/status.json on cathedral-research-state. Repaired RHRecursiveReductionFixed.lean and RHRecursiveReductionAutoV3.lean under specialists/kernel_extractor/ compile; named tests, negative controls and axiom ledger pass. The actual pinned functional-equation adapter and reduced_strip_root compile with only propext, Classical.choice, Quot.sound reported. Conditional root: prove nonvanishing only for 1/2 < Re(s) < 1; Mathlib already supplies the Re(s)>=1 region. This is not a proof of the missing nonvanishing premise or RH.
- Run 45576756833: compute/rh-proof-term-prune-native-20261125/status.json PASS. RHProofTermPrune.lean implements rh_prune and rh_scan. Regression controls reduce 4 binders to 2 and 3 to 2 with kernel-checked original-statement bridges; no-drop control passed. Actual rh_of_right dependency scan bounded at 2000 declarations: 1642 values, 358 without value, zero missing in visited subset, 324 discovered pending names. No unused binder removed from rh_of_right itself. This is not coverage of full upstream Main.riemannHypothesis.
- Exact toolchain Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Read logs/result.json and exact source versions rather than citing old failed prototypes. Earlier local results remain intact.

### Mandatory common pipeline in every lane
1. Read current mission, latest peer results and current original/reduced dependency frontier. Choose one actual root-reachable obligation; avoid duplicate work.
2. Specialise to RH-only (principal character, actual host, critical half-strip where applicable). Analyse proof body, conclusion, binder dependency closure and actual consumers. Use rh_scan and rh_prune when native environment and proof bodies are available; otherwise perform source-matched analysis and prepare executable Lean certificates. Preserve original and reduced graphs, structural/type/value edges, unresolved axioms and all pending nodes.
3. Apply all relevant mathematical reduction techniques: delete unused premises with valid replacement theorem; weaken exact equalities to sufficient inequalities; eliminate impossible cases; exploit exact symmetry/orthogonality; combine sums, factor, substitute and cancel before norms; aggregate weights/dimensions/valuations; avoid redundant parameters, auxiliary constructions, repeated arguments and algebra. Check signs, domains, uniformity, all quantifiers and boundary terms. Do not mistake algebraic re-expression for closing an obligation.
4. Use rh_reduce for bounded rule-driven recursive proof search; rh_auto and rh_auto_frontier for candidate discovery/backtracking and open frontier analysis; rh_prune for proof-term premise removal. Apply to the actual theorem context, not merely demonstrations. Extend tools only when a specific obstacle requires it. Cache context-sensitive results and use graph reachability rather than repeated full scans. Original URT and O(N) methods remain optional where demonstrated useful; do not assume global proof-search complexity or a universal minimality guarantee.
5. Verify new declarations with native Lean, original-statement bridges and axiom audit whenever feasible. Inspect constructor-inclusive dependency roles as well as #print axioms. No sorry/admit, circular references or import of the claimed RH theorem as a shortcut. Use existing CI compute queue/runner when local Lean unavailable; check actual published outputs before reporting PASS. Distinguish native verified, human source-matched, prepared, queued, and open.
6. Record one substantive reduction or proof result per run, exact source and replacement statement, surviving obligations, tests actually executed and RESUME HERE. Send to integration/audit; integration and editor maintain one concise live proof spine. Prioritise proving the smallest remaining mathematical obstruction over expanding manuscripts.
7. Repeat until no further justified reduction is available or the remaining premises are proved. A fixed point under these heuristics is not proof of global minimality. RH remains OPEN.

Kernel/dependency/acceleration lanes: next build a batch pass on actual pinned theorem values, not just rh_of_right. Prioritise base_rows_eq_record_rows_alt, native rank/count/weight suppliers, actual TopG, Galois integral-length and Landau dependencies; use authenticated exports and native environments where available. Test theorem replacement at caller level; a locally pruned binder is not a globally removed dependency. Other mathematical lanes should use the same common pipeline on their own bottlenecks and submit precise lemmas for native checking, not wait for a complete automation engine.

Grok/other external agents: follow the same pipeline through HANDOFF_QUEUE.md; this is a repository handoff, not confirmation that external agents have been launched.
