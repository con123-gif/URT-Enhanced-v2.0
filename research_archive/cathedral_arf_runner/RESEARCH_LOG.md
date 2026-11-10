# Research log — Cathedral gates A–F

The continuity record for every agent session. Rules are in `RESEARCH_PROTOCOL.md`; the entry point
is `AGENTS.md`; the current state is `docs/RESEARCH_STATE.md`.

## Queue

Take the first open item in your lane (`AGENTS.md`), else any open item. Mark items done in the same
commit as your result.

- [x] Q1 [verify] (B) Execute `URT_NATIVE_Q6_TILTED_TRANSFER_ALL_CUMULANTS_2026_11_10.py --native` on CI — Claude 2026-11-10: VERIFIED-ARCHIVE, PASS in orchestrator run 42892169483; A5 mean K₄ = 845671/57600 + (4271/800)√5 (log: "Consolidation and multi-agent setup")
- [x] Q2 [repair] Restore the archive scripts whose companion sources were never committed beside them — Claude 2026-11-10: two byte-identical copies; all 10 scripts now PASS (orchestrator run 42894969958; sweep 235/259 pass, 0 regressions)
- [ ] Q3 [derive] (A) **Axis-ordering classes.** A history's six bits are six consecutive binary digits of the orbit of F(x) = 2x + φ⁻² mod 1; which antipodal axis sits at which digit, and with which sign, is a choice. A5 acts on the six axes as PSL(2,5) on six points, freely on orderings, giving 720/60 = 12 orbits; signed assignments modulo A5 and central inversion form a finite set. Classify every class and evaluate on each the twirled-chronology second moment (`URT_A5_TWIRLED_CHRONOLOGY_SPECTRUM_2026_11_10.py`) and the five native K₂ rates. Deliver a THEOREM (ordering-independent) or an OBSTRUCTION: the exact number of distinct values is the size of the free choice gate A must remove. If it is heavy, queue it as a `[[job]]`.
- [ ] Q4 [derive] (B) **What the native matter archive already defines.** From `microscopic_source_currents_operators.npz` (written by `run_native_source.py`; keys `Q96`, `physical_generators96`, `site_projection_indices`, `site_Schur_kernel`, `site_effective_current`, `site_effective_contact`, `site_hidden_resolvent`) and the v61 source, determine exactly how its 48 sites, 528 links and 96 charged states relate to the icosahedral vertices, the 30 edges and the 64 histories. State the map the archive defines, or prove it defines none. Either result pins down the missing object of `RESEARCH_STATE.md` §5.
- [x] Q5 [repair] **Sandbox-bound scripts.** For the 14 scripts that fail on `/mnt/data` paths (`sweep.md`), classify each as write-only there (runnable if the runner creates `/mnt/data`) or reading inputs that existed only in ChatGPT's sandbox. List both groups, and for write-only ones propose the one-line sweep change. — Grok 2026-11-10: VERIFIED-ARCHIVE, 3 write-only / 11 read-input (log: "Sandbox-bound /mnt/data classification")
- [ ] Q6 [repair] **Missing intermediates.** For each remaining `missing_file` script, find whether another archived script produces the missing file. Record producer → consumer pairs; where a producer exists, say what ordering the sweep needs.
- [ ] Q7 [review] **Independent review** of Theorems 1–2 in `research_archive/2026-11-10_urt_arf_forward/new_gate/URT_Q6_CUMULANTS_AND_A5_MIXING_THEOREMS_2026_11_10.md` (finite Poisson inverse and cumulant recursion; non-ergodic A5 mixing with κ₄ ≈ (1493/1920)n²). Re-derive; AGREE / DISAGREE / PARTIAL with reasons.
- [x] Q8 [compute] **Independent K₂.** Recompute the five native K₂ rates {67/48, 33/16, 25/24, 33/16, 5/6} from the five-solid source with a standalone exact script that does not import the archived K₂ code. — GPT 2026-11-10: THEOREM (Independent exact five-vacuum K₂ reconstruction)
- [ ] Q9 [review] **Claim ledger catch-up.** Fold the 2026-10-18 → 2026-11-10 results into `docs/CLAIM_LEDGER.md`: one row per result, with a `CONTINUITY_PROTOCOL.md` status class and a linked source file, using `RESEARCH_STATE.md` §2–4 as the index. Read each source; do not copy statuses blindly.

- [ ] Q10 [compute] (A) **Unsigned axis-order K₂ spectrum.** Using the exact six-bit source and A4 projectors, enumerate one representative of each of the 12 unsigned A5 axis-order classes; compute and count the distinct five-vacuum K₂ multisets without varying source coefficients. Record exact witnesses for any collisions.

## Log

### 2026-11-10 20:50 UTC — GPT — Gate A — Independent exact five-vacuum K₂ reconstruction
- Task: Q8 [compute]; reconstruct the five native source second cumulant rates without importing archived K₂ code.
- Result: THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (stipulated finite six-axis dictionary).
- Statement: For the canonical 64-history Q and the five rank-one A4 normalizer singlets in the native hidden-5 icosahedral face output, the exact unit-normalized K₂ multiset is {5/6, 25/24, 67/48, 33/16, 33/16}; its equal-vacuum mean is 71/48.
- Evidence: research.independent_native_five_k2; CI pending first run from this commit; executed in GPT container on 2026-11-10 using Python 3.11, sympy 1.14.0 and networkx 3.6.1, exit 0, wall time 1.45 s. Script reconstructed geometry, A5/A4 projectors and Q⁶ exactly, with no archived imports.
- Dead ends: none new; rates depend on the archived choice of six-bit antipodal ordering. This calculation does not select a unique axis dictionary, physical vacuum, charged pole or any ARF.
- Next step: Q10 [compute], enumerate the 12 unsigned A5 axis-order classes and calculate the exact five-vacuum K₂ multisets to quantify the remaining gate-A choice.

### 2026-11-10 20:50 UTC — Grok — Archive — Sandbox-bound /mnt/data classification
- Task: Q5 [repair] — classify the 14 sweep-labelled `/mnt/data` scripts as write-only or read-input, and propose the one-line sweep change for the write-only group.
- Result: VERIFIED-ARCHIVE — CLOSED INTERNALLY (archive-health classification only)
- Statement:
  - Of the 14 scripts whose `sweep.md` detail is `sandbox path /mnt/data/...` (orchestrator run 42894969958), exactly 3 are write-only to `/mnt/data` and 11 read hardcoded `/mnt/data` inputs.
  - Write-only: `urt_platonic_u2_holonomy.py`, `cathedral_golay_leech_selection_audit.py`, `cathedral_native_spatial_vacuum_audit_2026-11-09.py`. Each exited 0 and wrote its results JSON once a writable `/mnt/data` existed.
  - The other 11 still raised `FileNotFoundError` on a `/mnt/data` input with that directory present. Eight of nine distinct read basenames already have a same-named file somewhere in `research_archive/`; the scripts do not look there.
  - Proposed one-line sweep change, not inserted: `Path("/mnt/data").mkdir(parents=True, exist_ok=True)` in `orchestrator.py` `sweep()` immediately after `out.mkdir(...)`. On this machine that mkdir raises `PermissionError` because `/mnt` is root-owned; a bare insert would stop the whole sweep on typical GitHub-hosted runners unless the workflow first creates a writable `/mnt/data`.
- Evidence: `research.sandbox_bound_scripts`; executed in this session (AST certificate plus all 14 scripts run with `nice`, `OMP_NUM_THREADS=1`, `OPENBLAS_NUM_THREADS=1`). Certificate: `research_archive/2026-11-10_sandbox_bound_scripts/classify_sandbox_bound_scripts.py`. Notes: `research_archive/2026-11-10_sandbox_bound_scripts/SANDBOX_BOUND_SCRIPTS.md`.
- Dead ends: creating `/mnt/data` does not unblock the 11 read-input scripts; inserting the proposed mkdir without a writable `/mnt` raises `PermissionError` and would break the sweep.
- Next step: Q6 [repair] (already queued) — for each remaining non-`/mnt/data` `missing_file` script, find whether another archived script produces the missing file.

### 2026-11-10 20:30 UTC — Claude — All gates — Consolidation and multi-agent setup
- Task: Con asked for the whole repository to be put in order, with GPT and Grok working on it alongside Claude.
- Result: VERIFIED-ARCHIVE — Q1 and Q2 done.
- Statement:
  - The `--native` fourth-cumulant computation passes on GitHub's runners (orchestrator run 42892169483), so the five native K₄ values and their A5 mean 845671/57600 + (4271/800)√5 are execution-verified.
  - Eight scripts in `2026-11-08_native_h64_diffusion/` and two in `2026-11-10_urt_arf_forward/aux_tests/` were blocked by missing companion sources; byte-identical copies are now in place.
  - `docs/RESEARCH_STATE.md` consolidates the state from every dated folder since 2026-10-13. Its finding: about forty status files from 9–10 November end at one missing object, the charged H64 ↔ v61 Wilson / Q96 map (§5).
- Evidence: orchestrator runs 42888496058, 42888823899, 42890431851, 42892169483, all pass. Added `AGENTS.md`, `CLAUDE.md`, the lane-based Queue above, and a compute queue (`cathedral-compute.yml` + `[[job]]`).
- Dead ends: none new. `RESEARCH_STATE.md` §3 lists the existing ones.
- Next step: Q3 (gate A axis-ordering classes) for Claude; Q8 for GPT; Q5–Q7 for Grok.

### 2026-11-10 20:10 UTC — Claude — Setup — baseline at the start of scheduled sessions
- Task: establish the verified baseline before automated research begins.
- Result: VERIFIED-ARCHIVE
- Statement:
  - On GitHub Actions, all 17 registered gating checks pass (test suite 188/188).
  - The archive sweep runs 256 research scripts: 222 pass, 14 need ChatGPT's `/mnt/data` sandbox, and 20 need files that were never committed.
  - The handover's numeric claims reproduce independently, 28 of 29. Erratum: p₅ = 6.196027670655×10⁻⁶, not 6.19613×10⁻⁶.
- Evidence: orchestrator runs 42888496058 and 42888823899 (pass); checkpoint `cathedral-research-state`.
- Dead ends: do not identify any source cumulant or history-resolvent pole with a physical coupling without a charged H13⊕H51 pole map (gates B–E).
- Next step: Q1, then Q3.
