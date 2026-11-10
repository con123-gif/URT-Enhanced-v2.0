# Research log — Cathedral gates A–F

Continuity record for the scheduled research sessions (see `RESEARCH_PROTOCOL.md`).
Newest entry first. Every entry names its certificate; the orchestrator executes it.

## Log

### 2026-11-10 20:10 UTC — Setup — baseline at the start of scheduled sessions
- Task: establish the verified baseline before automated research begins.
- Result: VERIFIED-ARCHIVE
- Statement: on GitHub Actions, all 17 registered gating checks pass (test suite 188/188). The archive sweep executes 256 research scripts: 222 pass, 14 need ChatGPT's `/mnt/data` sandbox, 20 need files that were never committed. The handover's numeric claims reproduce independently (28/29); erratum: p₅ = 6.196027670655×10⁻⁶, not 6.19613×10⁻⁶.
- Evidence: orchestrator runs 42888496058 and 42888823899 (pass); checkpoint `cathedral-research-state`.
- State of the frontier (from the 2026-11-10 ledgers in `research_archive/2026-11-10_urt_arf_forward/new_gate/`):
  - Proved: the exact all-order Q⁶ cumulant recursion; five native K₂ rates {67/48, 33/16, 25/24, 33/16, 5/6}; the A5 vacuum mixture is non-ergodic (κ₄ grows as (1493/1920)n²), so the A5-averaged rates are quenched averages, not one physical response.
  - Falsified: A5 covariance plus the primitive six-bit shift does not select an axis-order-independent chronology. Reordering the six axes gives second moments 31440, 42480, 27120 (`URT_A5_TWIRLED_CHRONOLOGY_STATUS_2026_11_10.md`).
  - Conditional, not derived: the A5 chronology (Dirichlet) penalty and its coefficient 1; R(Q) = M/120 is the Frobenius-nearest A5-equivariant chronology, not a dynamical selection.
- Dead ends: do not identify any source cumulant or history-resolvent pole with a physical coupling without a charged H13⊕H51 pole map (gates B–E).
- Next step:
  1. **VERIFIED-ARCHIVE first.** Record the CI outcome of check `history.native_q6_fourth_cumulants` (`URT_NATIVE_Q6_TILTED_TRANSFER_ALL_CUMULANTS_2026_11_10.py --native`, asserting the quenched K₄ mean 845671/57600 + (4271/800)√5). Until now it had only run in ChatGPT's sandbox. If it fails, diagnose it exactly.
  2. **Gate A, axis-ordering ambiguity.** The six bits of a history are six consecutive binary digits of the orbit of F(x) = 2x + φ⁻² mod 1; which antipodal axis is assigned to which digit position, and with which sign, is a choice. A5 acts on the six axes as PSL(2,5) on six points, freely on orderings, so orderings fall into 720/60 = 12 orbits; signed assignments, modulo A5 and central inversion, form a finite set. Classify all of them and evaluate the twirled-chronology second moment (and the five K₂ values) on every class. Result: either a THEOREM (the observable is ordering-independent on all classes) or an OBSTRUCTION (the exact number of distinct values is the size of the free choice gate A must remove), with the classes tabulated.
