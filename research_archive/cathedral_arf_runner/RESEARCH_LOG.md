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
- [x] Q6 [repair] **Missing intermediates.** For each remaining `missing_file` script, find whether another archived script produces the missing file. Record producer → consumer pairs; where a producer exists, say what ordering the sweep needs. — Grok 2026-11-10: VERIFIED-ARCHIVE, 1 basename-only producer / 0 exact-path producers (log: "Missing intermediate producer map")
- [ ] Q7 [review] **Independent review** of Theorems 1–2 in `research_archive/2026-11-10_urt_arf_forward/new_gate/URT_Q6_CUMULANTS_AND_A5_MIXING_THEOREMS_2026_11_10.md` (finite Poisson inverse and cumulant recursion; non-ergodic A5 mixing with κ₄ ≈ (1493/1920)n²). Re-derive; AGREE / DISAGREE / PARTIAL with reasons.
- [x] Q8 [compute] **Independent K₂.** Recompute the five native K₂ rates {67/48, 33/16, 25/24, 33/16, 5/6} from the five-solid source with a standalone exact script that does not import the archived K₂ code. — GPT 2026-11-10: THEOREM (Independent exact five-vacuum K₂ reconstruction)
- [ ] Q9 [review] **Claim ledger catch-up.** Fold the 2026-10-18 → 2026-11-10 results into `docs/CLAIM_LEDGER.md`: one row per result, with a `CONTINUITY_PROTOCOL.md` status class and a linked source file, using `RESEARCH_STATE.md` §2–4 as the index. Read each source; do not copy statuses blindly.

- [x] Q10 [compute] (A) **Unsigned axis-order K₂ spectrum.** Using the exact six-bit source and A4 projectors, enumerate one representative of each of the 12 unsigned A5 axis-order classes; compute and count the distinct five-vacuum K₂ multisets without varying source coefficients. Record exact witnesses for any collisions. — GPT 2026-11-10: OBSTRUCTION (Exact unsigned A5 axis-order spectra and fixed-endpoint sign choice)

- [x] Q11 [compute] (A) **Signed A5 covariance.** Construct the induced signed six-axis transformations from the 60 proper icosahedral rotations, transport the five A4 vacua simultaneously, and test exact invariance of the five K₂ multiset under all 60 transformations on the native source. Record exact counterexamples if covariance fails. — GPT 2026-11-10: THEOREM + OBSTRUCTION (Signed A5 covariance and fixed-Q obstruction)
- [ ] Q12 [compute] (A) **Signed axis dictionary classes.** Enumerate the 768 signed six-axis dictionaries modulo proper A5; evaluate exact five-vacuum K₂ spectra for one representative per orbit and count collisions. Keep the original fixed Q and distinguish passive joint covariance from active Q symmetry.
- [ ] Q13 [repair] **Companion copies of existing intermediates.** For the three remaining missing_file scripts whose missing basename or near-name already exists in the archive — `golden_species_operators.npz` (three byte-identical copies), `run_endpoint_test.py` (at `research_archive/run_endpoint_test.py`, with other `full_library/` names at archive root) and `joint_original_h64_species_link_source.npz` (same directory as the consumer) — test whether a byte-identical companion copy at the path the consumer actually opens unblocks that script. Do not invent file contents.


## Log

### 2026-11-10 22:17 UTC — Grok — Archive — Missing intermediate producer map
- Task: Q6 [repair] — for each remaining non-`/mnt/data` `missing_file` script, find whether another archived script produces the missing file; record producer → consumer pairs and any sweep ordering that would help.
- Result: VERIFIED-ARCHIVE — CLOSED INTERNALLY (archive-health classification only)
- Statement:
  - Of the 10 `sweep.md` missing_file scripts whose detail is not a sandbox path `/mnt/data` (orchestrator run 42903908099), no archived script writes the missing file at the path the consumer opens, so no sweep reordering unblocks any of them.
  - Exactly one script writes one of the ten basenames: `golden_species_derivation.py` writes `golden_species_operators.npz` next to itself (a committed copy already lives there). The consumer `urt_h64_quadratic_phase_derivation.py` looks in its own directory.
  - The other nine missing files have no producer. Three of the ten missing basenames (or a near-name) already exist elsewhere in the archive.
- Evidence: `research.missing_intermediates`; executed in this session (AST certificate plus all 10 scripts run after `restore_matrices.py`, with `nice`, `OMP_NUM_THREADS=1`, `OPENBLAS_NUM_THREADS=1`). Certificate: `research_archive/2026-11-10_missing_intermediates/find_missing_intermediate_producers.py`. Notes: `research_archive/2026-11-10_missing_intermediates/MISSING_INTERMEDIATES.md`.
- Dead ends: reordering the archive sweep cannot place any of these 10 files at the path the consumer opens; inventing the seven files that have no copy is not an archive repair.
- Next step: Q13 [repair] — for the three scripts whose missing basename or near-name already exists in the archive, test whether a byte-identical companion copy at the consumer path unblocks the script (no invented contents).

### 2026-11-10 21:18 UTC — GPT — Gate A — Signed A5 covariance and fixed-Q obstruction
- Task: Q11 [compute] — transport six antipodal-axis signs and all five A4 vacua under every proper A5 rotation; check native K₂ invariance and fixed-Q commutation.
- Result: THEOREM + OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (specified native icosahedral source output and fixed six-bit chronology).
- Statement: All 60 signed A5 rotations preserve the native five-vacuum K₂ multiset {5/6,25/24,67/48,33/16,33/16} under joint axis/vacuum transport (76,800 exact face-source equalities, 300 exact normalized K₂ checks). Only the identity of A5 commutes with the untransformed de Bruijn Q. Explicit witness at h=0: transported successors {54,55} versus successors after transport {44,45}.
- Evidence: research.signed_a5_covariance; local Python 3.13.5, SymPy 1.14.0, NetworkX 3.6.1, 2026-11-10 21:18 UTC, exit 0, 3.73 s; script SHA256 1a08ef941f2e661c1df2ffa22441a33ab24525d0988ef1d44943af9e5ece4011; CI pending this commit.
- Dead ends: treating passive joint A5 covariance as an active symmetry of the fixed URT chronology is invalid; no full charged-matter observable or ARF follows.
- Next step: Q12 [compute] — enumerate 768 signed-axis dictionaries modulo proper A5 and compute exact representative K₂ spectra and collisions.


### 2026-11-10 21:13 UTC — GPT — Gate A — Exact unsigned A5 axis-order K₂ spectra
- Task: Q10 [compute] — enumerate 12 A5 unsigned axis-order classes and compute exact K₂ multiset for each canonical representative, without free coefficients.
- Result: OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (fixed-endpoint six-axis source dictionary only).
- Statement: Proper icosahedral A5 acts freely on 720 unsigned six-axis orders in 12 orbits of 60. Their 12 lexicographically first representatives have pairwise distinct five-vacuum K₂ multisets; exhaustive exact evaluation of all 720 fixed-endpoint orders gives 44 different multisets, with per-orbit counts (8,8,10,7,8,10,10,8,7,10,8,8). In the same unsigned orbit, (0,1,2,3,4,5) yields (5/6,25/24,67/48,33/16,33/16) but (0,5,4,2,1,3) yields (299/240,121/60,649/240,649/240,103/30).
- Evidence: research.unsigned_axis_order_k2; CI pending new commit; executed GPT container 2026-11-10 21:09 UTC, Python 3.11 with SymPy and NetworkX, exit 0, 28.66 seconds. Exact Q(sqrt(5)) geometry/source projector and rational K₂ assertions; all 720 orders enumerated.
- Dead ends: unsigned axis relabelings alone do not transport the signs induced by proper A5 rotations. The count 44 is scoped to fixed axis-endpoint signs, NOT a count of physical theories or A5-invariant observables.
- Next step: Q11 [compute] — certify signed A5 covariance with simultaneous transportation of the five A4 vacua.

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
