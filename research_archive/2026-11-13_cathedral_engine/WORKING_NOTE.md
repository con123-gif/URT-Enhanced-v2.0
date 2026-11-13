# Working note — exact Cathedral engine, Q88/Q89 recovery, Q90 (Claude, opened 2026-11-13 21:54 UTC)

WORK IN PROGRESS / NOT VERIFIED until the commit and CI verdict below are filled in.

Task (owner directive 2026-11-13, "Newton's Cathedral — Claude implementation directive"): build a reusable,
tested exact engine (`cathedral_engine/`) over the original operators; recover Q81–Q89; independently check
Q88/Q89; run one fresh calculation with the engine (Q90); persist evidence; verify CI.

Base commit: `c33fc56cdeb7714a9de701944f606312bc58edb6` (GPT, Q89 persist), branch `newtons-cathedral`.
CI at start: last completed orchestrator run 43500419492 on 83baa0d = PASS; run 43512220021 on c33fc56
(first CI execution of `research.q89_exact_source_all_dictionaries`) in progress.

## Prior-work ledger (checked: RESEARCH_STATE, Queue, log, registry, summary.md, Q81/Q83/Q89 sources)

| Item | Source | Scope | Status | Executed |
|---|---|---|---|---|
| Q81 | `2026-11-13_q81_native_source/` (GPT) | radical form of the all-five source; ‖h3‖² ≈ 0.0321945448…, ‖h5‖² ≈ 0.0018261794… | radical form closed; norms are mpmath values, not enclosures | CI pass ×6 |
| Q82 | `2026-11-13_q82_oriented_source_weights/` (Claude) | A5 quartet weights (4,2,2,0) on orbit 1, c-blind | conditional theorem | CI pass |
| Q83 | `2026-11-13_q83_native_clock/` (GPT) | T = P_σ₁⁶ is −1 on H3,D and +1 on H5,D, 8 dictionaries; P3 carrier in k ≡ 2 (mod 4) | theorem | CI pass ×4 |
| Q84 | Queue only | six k ≡ 2 (mod 4) energies | OPEN, no artifact | — |
| Q85 | `2026-11-13_q85_chronology_coefficient/` (Claude) | centrally symmetric chronologies leave c free | obstruction | CI pass |
| Q86 | Queue only | parity-history energy fixing c | OPEN, no artifact | — |
| Q87 | Queue only | rigorous B^J scan for all c > 0 | OPEN, no artifact — must stay open | — |
| Q88 | GPT local only; **not committed, not in the Queue**; its three integer rows appear only inside the Q89 script | joint row space of clock constraints | unverified | never in CI |
| Q89 | `2026-11-13_q89_exact_source/` (GPT, c33fc56) | r_j·f = 0, j = 0,1,2 (SymPy radsimp) | VERIFIED-ARCHIVE claimed | GPT local; CI run 43512220021 pending |
| Q90 | Queue only | exact unnormalised k = 6, 18 energies | OPEN | — |

`Q89_RECOVERY_GITHUB_PATCH.txt` was named in the directive but was not attached to the conversation and is not
in the repository; the committed `Q89_EXACT_SOURCE.py/.md` are audited instead.

## Reconstruction of Q88 (float64 exploration, 2026-11-13 21:50 UTC, scratch only — exact certificate to follow)

Objects (all original, as in Q83): icosahedron (Q83 vertex order), faces, C, Ph, P3, P5, M (64×20),
σ₁ (β ≡ 1), the eight Q64 dictionaries. Π_k = (1/24) Σ_t ω^{−kt} P_σ₁^t, ω = e^{2πi/24}.

- For each of the 8 dictionaries the row space of {Π_k Π_D M P3 : k ∈ {2,10,14,22}} in R²⁰ is 2-dimensional;
  the k ∈ {2,22} and k ∈ {10,14} row spaces coincide per dictionary.
- Joint over the 8 dictionaries: dimension 3, and Q89's three integer rows span it (residual 0).
- k ∈ {6,18}: 2 per dictionary, 4 jointly (= im P3).
- The Q81 source vector x lies in span{z, xy} (unit icosahedral coordinate functions), and the three rows
  annihilate (Cz)², (Cz)(Cxy) and (Cxy)² separately — so the Q89 cancellation does not depend on the
  Gram whitening coefficients. To be proved exactly.
- Source σ₁-clock energies, all 8 dictionaries: k = 6 and k = 18 each 0.0160972724111826 = ‖h3‖²/2, others 0.
- Over all 768 A5 classes the normalised source spectrum on k = (2,6,10,14,18,22) takes 5 patterns:
  384 × (1/8,1/4,1/8,1/8,1/4,1/8), 192 × uniform 1/6, 64 × (0,1/2,0,0,1/2,0) (contains orbit 1),
  64 × (5/24+√3/12, 1/12, 5/24−√3/12, …), 64 × (5/24−√3/12, 1/12, 5/24+√3/12, …) (float values; exact form to be certified).

## Checkpoint 2026-11-13 22:20 UTC (local sandbox, exact, not yet in CI)

- Engine modules written: fields, linalg, geometry, histories, clock, source, cache, provenance, certify, gate_a.
  Faces, edges and b1/b2 of all five solids equal the original 2026-11-07 functions (executed unmodified via
  `provenance.load_definitions`); Tr D² = 720, Tr D⁴ = 3456, dim ker D = 10; Q64 maximiser recomputed = Q83 list.
- `Q88_Q89_ENGINE_RECOVERY.py`: 71 checks pass in 2.5 s. Q88 reconstructed exactly (per-dictionary rank 2,
  joint 3 = span of the Q89 rows; k ∈ {2,22} and {10,14} give the same plane). Q89 holds for the whole family
  x = aZ + bXY (9 Q(√5) identities) and directly for the source (zero tower element).
- `Q90_SOURCE_CLOCK_ENERGIES.py`: 997 checks pass in 1.7 s.
  ‖h3‖² = (1 + 2/√5)(539116576348 − 164287376√579)/(3·193²·16787²) = 0.03219454482236522169450345594831162652…;
  ‖h5‖² = (122294404990 + 2087425120√579)/(3²·193²·16787²) (ρ and τ cancel). E_6 = E_18 = ‖h3‖²/2 on all
  8 selected dictionaries, others 0; P5 source: E_0 = 5/8, E_12 = 3/8 of ‖h5‖². 768-class census: 5 spectra;
  pure k = 6,18 on 8 Q24 orbits (incl. orbit 1). Q81 printed digits all correct.

## Checkpoint 2026-11-13 22:30 UTC

- CI run 43512220021 on c33fc56 finished PASS (22:05 UTC); GPT's SymPy Q89 check passed on CI (17.6 s).
- Engine complete for this session: + interfaces, evidence (ledger + Queue reader), `__main__` (status, evidence,
  selftest, originals), BENCHMARK.py. `tests/test_cathedral_engine.py`: 18 passed, 6 s.
- Registry: research stage was at 27–28 of 30 job minutes → five heaviest checks moved to `research_heavy`;
  engine checks in new stage `engine`; BENCHMARK.py excluded from the sweep (run by its check).
- Local benchmark (`BENCHMARK_LOCAL.md`): Q64 8.10 → 0.98/0.52 s; Q3 census 22.43 → 0.53 s; SymPy originals
  skipped locally (CI measures them).

## RESUME HERE

Last step: records written (ledger, log entry, Queue, RESEARCH_STATE, CATHEDRAL_ENGINE.md). Next: commit on a
fresh parent, push, read the orchestrator verdict for the commit, fill in commit SHA + verdict below.
Next command: `python -m cathedral_engine status` then Q86 [derive] (parity-history energy on orbit 1).

Commit: (to be filled) · CI: (to be filled)
