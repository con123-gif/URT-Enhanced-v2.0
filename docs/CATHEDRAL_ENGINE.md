# cathedral_engine — the exact Cathedral research engine

2026-11-13 · Claude · infrastructure (owner directive "Newton's Cathedral — Claude implementation directive").
It implements `docs/CATHEDRAL_COMPUTE_ACCELERATION.md` phases 1–4. It does not supersede `AGENTS.md`,
`RESEARCH_PROTOCOL.md` or `CONTINUITY_PROTOCOL.md`, and it closes no gate.

## Start of every session

```
python -m cathedral_engine status            # CI verdict, ACTIVE PROBLEM, open Queue by lane, newest next steps, ledger
python -m cathedral_engine status --lane derive
python -m cathedral_engine selftest          # rebuilds the core operators, checks archived invariants (~2 s)
python -m cathedral_engine evidence          # validates research_archive/cathedral_arf_runner/evidence.jsonl
python -m cathedral_engine originals         # re-hashes the original sources the engine was ported from
python -m pytest -q tests/test_cathedral_engine.py
```

Fetch the CI state first with `git fetch --depth 1 origin cathedral-research-state`.

## What it contains

Everything is exact and uses only the standard library plus numpy, so it runs in every sandbox. Every operator is
regression-tested against the original archived code.

| Module | Objects | Reproduces (tested) |
|---|---|---|
| `fields` | `Q5` = Q(√5); `RadicalTower` (iterated square roots; canonical prime radicals; certified interval enclosures, decimals and signs; `certify_field`; minimal polynomials) | — |
| `linalg` | RREF, rank, nullspace, row space, det, inverse, charpoly, integer bases, rank mod p, permutation algebra | — |
| `geometry` | five solids (exact coordinates), faces, edges, b1, b2, the 190 Hodge–Dirac D, icosahedral C, L_face, Ph, P3, P5, the 120 symmetries, 60 rotations, the A5 character table (derived), D6→H3 folding, L12 and centred 13-cell spectra | faces, edges, b1, b2 = the 2026-11-07 `build_faces`/`build_bdry`, executed unmodified; Tr D² = 720, Tr D⁴ = 3456, dim ker D = 10 |
| `histories` | Q2, H_bits, M, P8/H3/H5 carriers (im U_h), H13 (Q62), lifts σ_β, I/R/S, signed dictionaries, the 60 signed axis actions, 768 A5 classes, 96 Q24 orbits, A5 on codes, twirled chronology S_D (history and code frames), Q64 conditioned likelihood and selected orbit | H_bits spectrum 0(2), 10(12), 16(30), 18(20); A5 code action = Q3's function; 32 Tr S² values incl. 31440, 42480, 27120; 372 code-frame operators (Q41); Q64 maximiser = the Q83 list, σ₁, margin ×4.54 |
| `clock` | σ₁ 24-clock multiplicities, exact cosines of 2πj/24, autocorrelation energies, exact mode-class projectors; native Z₂₄ Wilson clock spectrum (float only, transcendental phase) | 6/5/0 multiplicities (Q69); T = P⁶ is −1 on H3,D (Q83) |
| `source` | all-five harmonic moments, Gram blocks, Cayley–Hamilton B^{−1/2}, Plinear, the exact source x, f, h3, h5 and norms; `hidden_source_float` runs the original numpy function unmodified | x equals the original to 1e-16; Q81's printed norms to every digit |
| `gate_a` | selected dictionaries, pull-back, clock constraint matrices, joint row spaces, the Q89 rows (parsed, not retyped), the source line, the source-family vectors | Q88/Q89 |
| `interfaces` | charged-sector interfaces with status (ESTABLISHED / CONDITIONAL / OBSTRUCTION / UNRESOLVED); `require()` raises for the unresolved §5 map instead of inventing one | — |
| `cache` | content-addressed disk cache (`.cathedral_cache/`, git-ignored); key = engine sources + original-file sha256 + declared assumptions | — |
| `provenance` | sha256 index of the original sources; `load_definitions` runs selected original definitions unmodified | the 2026-11-07 file is pinned to sha256 5577557613a7… |
| `evidence`, `certify` | evidence ledger and Queue reader; certificate context manager (fail-on-error, timing, sha stamp) | — |

## Soundness rules built in

- **Exact zero tests.** A `RadicalTower` element is a polynomial in square roots t_i with t_i² = d_i, evaluated at
  t_i = +√d_i. That evaluation is a ring homomorphism, so a zero representation proves a zero value even before the
  generators are known to be independent. `certify_field()` proves independence by induction: each d_i is shown to
  be a non-square in the field below it. After that, every zero test is also complete and `minimal_polynomial` is
  the minimal polynomial over Q.
- **Floating point is a diagnostic.** Decimals are printed from rigorous rational enclosures, and every printed
  digit is certified.
- **No silent caching across changes.** Changing an engine source, an original input or an assumption changes the
  cache key.
- **No invented interfaces.** `interfaces.require("h64_to_v61_charged_map")` raises `UnresolvedInterface` and lists
  the known constraints (RESEARCH_STATE §5).
- **Symmetry reductions carry a proof.** One example is S_hist on A5 classes. The twirl is invariant under
  reindexing g → ga, so S_{aD} = S_D. The tests check this on all 60 images of a class, and the Q3 census over
  46,080 dictionaries is reproduced exactly from the 768 classes. Without such a lemma, compute every case.

## Reusing results instead of rebuilding them

```python
from cathedral_engine import histories, gate_a, source
histories.selected_orbit()        # Q64: 8 classes, sigma_1, exact likelihood and runner-up
histories.twirled_chronologies()  # S_D for all 768 classes (disk-cached)
gate_a.q89_rows(); gate_a.source_line()
source.exact_source()             # exact x, f, h3, h5, norms in a certified radical tower
```

Verified results are recorded in `research_archive/cathedral_arf_runner/evidence.jsonl`, one JSON object per
line and append-only. Each record has the statement, status class, certificate path and sha256, registry check,
where it was executed and the CI verdict. A later session reads the value there and does not recompute it unless
it has a new premise. Corrections and reviews are new lines (`kind = "review"`); existing lines are never edited.
`python -m cathedral_engine evidence` flags missing certificates, unknown checks and stale ones, where a
certificate changed after it was recorded.

## Coordination (one Queue, one evidence record)

- The **Queue** is still `RESEARCH_LOG.md`, the only place a task is chosen. The **evidence record** is
  `evidence.jsonl` plus the registry checks, which CI re-executes.
- Before computing, run `status`, and read the ledger and the ACTIVE PROBLEM's "Attempts so far". If an equivalent
  result is recorded, reuse it. If another agent's newest log entry names your intended item as its next step, take
  a different untried sub-question, or record yours as a REVIEW.
- Lanes are unchanged. Claude derives and reviews; GPT does bounded exact certificates; Grok verifies and repairs.
  The engine is shared by all of them.
- New certificates should import `cathedral_engine` operators. Do not rebuild the icosahedron, dictionaries, S_D,
  σ₁ or the source by hand. If an operator is missing, add it to the engine with a regression test against the
  original first.

## Measured performance

Same-machine figures from GitHub Actions: check `engine.benchmark`, run 43519849068, Python 3.11, 4 CPUs. Each run
is a fresh process with imports included, and both sides must give the same answer. Source:
`research_archive/2026-11-13_cathedral_engine/BENCHMARK_CI.md`. Local sandbox figures, which the CI figures
confirm, are in `BENCHMARK_LOCAL.md`.

| Case | Original | Engine cold | Engine warm | Speed-up |
|---|---|---|---|---|
| Q64 selection over 768 classes | 14.98 s | 1.59 s | 0.69 s | ×9.4 cold, ×21.8 warm |
| Q3 census over 46,080 dictionaries | 51.62 s | 0.64 s | 0.63 s | ×80.5 (orbit reduction, identical census) |
| Q81 exact source norms (original: SymPy + mpmath) | 8.65 s | 1.00 s | 0.96 s | ×8.7; engine also gives closed forms |
| Q89 three exact zeros (original: SymPy) | 11.77 s | 1.05 s | 1.01 s | ×11.2 |
| Q83 carrier clock check (original: SymPy) | 0.85 s | 0.82 s | 0.83 s | ×1.0 (already fast) |

## Not in the engine yet (do not assume it is)

- An exact port of the v61 Wilson operator. It is executed only through `run_native_source.py`.
- The H51 complement as a separate object. It is available as 1 − P13.
- The nonlinear entropy response and the full 190×64×24 action.
- Golay/Leech.
- The charged ↔ history map, which is UNRESOLVED.

Add each with a regression test against its original before use.
