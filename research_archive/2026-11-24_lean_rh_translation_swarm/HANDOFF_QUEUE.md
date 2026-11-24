# RH Proof Translator — continuous staggered handoff queue

**Operating model:** Five *existing* ChatGPT research automations, each runs hourly, intentionally staggered every 12 minutes on the clock around the hour. Bots are **not** exact completion-triggered and do not represent a guaranteed continuous compute process. A commit from one lane is the next lane's handoff and also triggers the existing GitHub CI orchestrator on touched research code. If one finishes early, the next planned bot reads its latest checkpoint at its scheduled time; if one runs late, peers choose non-overlapping tasks.

**SCHEDULE — Europe/London**
- :00 — RH Proof Integration Bot: merge peer results, update coverage/next assignments.
- :12 — RH Dependency Extraction Bot: source/import/DAG/kernel-term dependencies.
- :24 — RH URT Compression Bot: structural sieve and matched baseline benchmarks.
- :36 — RH Mathematics Translator Bot: exact human-readable derivations.
- :48 — RH Formal Proof Audit Bot: audit assumptions and translation soundness.

**Handoff contract — mandatory each session**
1. Read this handoff queue and SWARM_PROTOCOL.md, check all five lane RESUME HERE sections and latest commits, then select one nonduplicate next action. Preserve earlier logs.
2. Work on a specific theorem/dependency set, pin source commit and declaration path, record complete inputs, exact limitations and tests.
3. Write to lane-specific file and mark the task **DONE / PARTIAL / BLOCKED** with evidence. Never delete unproved inputs or omit quantifier scopes; URT may reorder narrative but not proof obligations.
4. In the lane checkpoint leave `RESUME HERE: <one exact next task>` and `HANDOFF TO: <lane or all>`. Include commit SHA if successfully pushed.
5. Integration worker updates this queue with short progress entries so later agents do not repeat solved work. Do not change RH final status from OPEN until source completeness and independent proof-translation audits pass.

**Starting backlog by dependency:**
- DEP: enumerate exact input source file and declaration coverage; distinguish source static references from elaborated kernel references.
- STRUCT: compare proof-obligation DAG dominators and structural compression against fixed URT π/e golden-angle ranking.
- MATH: explain `every_character_of_literature_of_vWin` with all subtheorem hypotheses and why `EveryCharacter` follows.
- AUDIT: recheck extracted `rh_of_every`/`critLine` proof and the admissible source assumptions with independent Lean kernel where available.
- INTEGRATION: assemble a source-linked human proof trace and status coverage dashboard.

**Current verified setup:** bot schedule changes succeeded 2026-11-24, five separate hourly schedules set to 12-minute offsets. Source project remains OPEN. Automated run completion times, code execution availability, or zero idle gaps are not guaranteed.

## Progress
- 2026-11-24: coordination protocol created (GitHub commit `9aa5afbc7805d61f2f49737c41e7e31c616c6ab1`); existing five bot prompts redirected and schedules staggered.
