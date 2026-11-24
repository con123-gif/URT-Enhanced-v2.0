# Grok lane: formal Lean validation (toolchain, kernel dependencies, storage)

**Agent:** Grok (formal-validation specialist). **Date:** 2026-11-24 (Europe/London = UTC).
**Status:** PARTIAL. RH is OPEN. No gate is closed by this lane.
**Pins:** upstream `40e56bab026552e089d7afcfeff08d2defb9c005`; frozen mirror
`homeowmorphism/riemann-hypothesis-original` @ `4e8bb36faa8c9e3f1bda144ccf5a637f8b96066e`
(src tree `24df20b62d9976ccd20da819bc20b16f808f0fdd`, `40e56bab:src` = `b41b516b…`, only diff `A src/Challenge.lean`,
lake-manifest blob `b4d1ec31…`, lean-toolchain blob `a8afa7d1…`; all checked with `git rev-parse` before use).
Lean `4.33.1` (commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`), Lake `5.0.0-src+819816b`, elan `4.4.0`,
Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` (official cache.mathlib.org oleans, 8,689 files; not rechecked).

## Box
8 vCPU, 16 GB RAM (≈5–12 GB available, shared with other lanes), 128 GB disk (114 GB free at start;
shared, kept ≥ 55 GB free during this run). Toolchain installed in shared `~/.elan` (`/home/box/.elan`,
toolchain dir `/home/box/.elan/toolchains/leanprover--lean4---v4.33.1`). Frozen checkout `/workspace/rh_orig`.

## What was actually executed (exact logs in `logs/`)

| Tier | What | Inputs loaded | Exit | `#print axioms` (real output) |
|---|---|---|---|---|
| A | `lean -o` **from source**: `src/Statements.lean` (blob `1cd1bce9…`), `src/Formalism/GammaFactorNonvanishing/RhOfRight.lean` (blob `36046371…`) | Mathlib only | 0, 0 | — |
| A | `TierA_ReflectionSlice.lean`: companion's `zetaRight` verbatim + `rh_of_right ∘ zetaRight` | Mathlib + the 2 source-built oleans | 0 | `Formalism.VW.rh_of_right`, `zetaRight`, `rhOfDirichletRight`: `[propext, Classical.choice, Quot.sound]` |
| B | selective restore of the **14,301-module** import closure of `Formalism.GammaFactorNonvanishing.CritLine` (sha256-checked per archive) | 565 MB download, 10.45 GB oleans | 0 | — |
| B | `lean -o` **from source**: `src/Formalism/GammaFactorNonvanishing/CritLine.lean` (kernel rechecks its 3 theorems) | the restored closure | 0 | — |
| B | `TierB_EveryCharacterJunction.lean` | closure + source-built `Statements` | 0 | `Formalism.VW.gammaFactor_ne_zero`, `Formalism.VW.critLine`, `Formalism.VW.rh_of_every`, `everyOfRight`, `rhOfDirichletRight_viaEvery`: `[propext, Classical.choice, Quot.sound]` |
| K | kernel dependency export, root `Formalism.VW.rh_of_right` | Tier A env | 0 | collectAxioms `[propext, Classical.choice, Quot.sound]`; 54,444 nodes, 0 missing |
| K | kernel dependency export, root `Formalism.VW.rh_of_every` | Tier B env | 0 | collectAxioms `[propext, Classical.choice, Quot.sound]`; 54,775 nodes, 0 missing |
| C | full environment (175,187 modules) | see storage | see `TIER_C.md` | see `TIER_C.md` |

`everyOfRight : DirichletLNonvanishingRightOfHalf → UpperTheory.EveryCharacter := h` typechecks, i.e. the companion's
interface statement is *definitionally* the upstream `UpperTheory.EveryCharacter`.

### Findings
1. **Companion bug-risk, not a bug:** `zetaRight` uses the unqualified name `LFunction_modOne_eq`; it only resolves
   because the companion namespace has `open Complex DirichletCharacter` (Mathlib name `DirichletCharacter.LFunction_modOne_eq`).
   A slice copied without that `open` fails (`Unknown identifier`, logged in `tierA_compile.log`, exit 1). Keep the `open`.
2. **Kernel closure ≪ import closure.** `rh_of_every` imports a 14,301-module closure but its kernel dependency closure
   contains only **6 project declarations** (`rh_of_every`, `UpperTheory.EveryCharacter` (+`._proof_1`), `rh_of_right` (+2 aux proofs));
   everything else is Mathlib/core (47,591 Mathlib, 7,008 Init, 168 Batteries, 1 Std, 1 Aesop). The analytic junction
   EveryCharacter ⇒ RH is therefore machine-confirmed to rest only on Mathlib + 6 project declarations, standard axioms only.
   `critLine` is *not* in the kernel closure of `rh_of_every` (that route uses the modulus-one character + `rh_of_right`).
3. **The previously committed exporter `specialists/kernel_extractor/KernelGraphExport_v2.lean` did not parse** under Lean 4.33.1
   (`mutual`, `at` are keywords; a multi-line structure instance silently dropped the literal-flag fields). Repaired copy:
   `kernel/KernelDepExport.lean.in` (repairs listed in its header). With the repair, the committed checker
   `verify_graph_v2.mjs` returns `REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT` (self-test exit 0; both graphs exit 0; 0 missing,
   0 bodyMissing, no `sorryAx`, no nonstandard axioms, no unsafe/partial nodes). Edges: 1,396,033 / 1,410,678.
4. **Import closure of the companion = 175,177 of 175,187 modules** (909,798 import edges incl. Mathlib roots; 344 Mathlib,
   3 Lean, 1 Batteries external roots). `Main`'s closure is 175,179 + Main. So *module-level* pruning cannot shrink the full
   companion: stock Lean `import` needs every transitive `.olean`. Only `Statements` (1 module) and `RhOfRight` (1 module)
   are small; `EveryCharacter`/`CritLine` already pull 14,299/14,301.
5. **Loading 14k+ modules fails with `failed to read file '...olean'` unless `vm.max_map_count` is raised** (default 65,530;
   each olean is mmapped). `sudo sysctl -w vm.max_map_count=1048576` fixed it (Tier B exit 1 → 0).
6. **leantar needs `RUST_MIN_STACK=8388608`** (as `restore-cache.py` sets) or it aborts with a stack overflow.

## Storage strategy (≈105 GB → 30 GB, nothing discarded)
* Artifact URL scheme (from Lake 4.33 `s3ArtifactUrl`): `https://rh-cache.taucetiproject.org/artifacts/leanprover-community/riemann-hypothesis/<hash>.art`;
  manifest `bootstrap/e50d0981…/modules.jsonl.gz` (sha256 `292caa38…` = pinned). Per-module selective fetch works
  (`selective_restore.py`, 48 threads): full 175,187 archives = 4.94 GB in ~10.5 min.
* Measured sizes: 14,301 modules → 10.45 GB `.olean`, 0.57 GB `.ilean`, 0.16 GB `.c`. Full set ≈ 99 GB unpacked.
* `squash_pipeline.py`: extract in 12,000-module batches → zstd-3 squashfs image → delete staging. **15 images, 30 GB total**
  (peak extra staging ≈ 9 GB). All 175,187 `.olean` present (counted).
* Mounting: FUSE (`squashfuse` + `fuse-overlayfs`) works but reads at ~5 MB/s → unusable for a full import. **Kernel
  `mount -t squashfs -o loop,ro` works on this box (sudo)**; kernel overlayfs is refused, so the 15 mounts are merged with a
  per-file symlink farm (`symlink_farm.py`, 175,187 symlinks, 708 MB of directory inodes) used as the project LEAN_PATH root.
  Read rate ~90–130 MB/s.
* The unmodified `integration/run_proof_companion_cached.sh` was started against this tree (all pin checks passed, `Main.olean`
  present so no 105 GB download); it was **stopped by me** during `lake build --no-build` after ~8 min, because Lake was
  hashing all ≈525k outputs through FUSE (143k `.hash` files written to the overlay upper) and starving the Lean import.
  Script exit 143 (SIGTERM). Not a script failure; not a PASS.

## Trust boundaries
Tier A: project files compiled from source by this box's kernel; Mathlib oleans trusted (official cache, not rebuilt).
Tier B/C: every project `.olean` except `Statements`, `RhOfRight`, `CritLine` comes from the published community cache
(sha256 matches the pinned manifest = "received the recorded files", not "compiled from source here"). `#print axioms` reports
on what the kernel environment contains; it is not an independent re-check of cached modules. No comparator/nanoda run here.
No prose↔Lean equivalence is claimed.

Closure counts and sha256 of each sorted module list: `closure_summary.json`. All other lane files (tools/, tierA-C/, kernel/, logs/, REPRODUCE.sh, closure_summary.json) are packed in `lean_validation_bundle.sh` (run `bash lean_validation_bundle.sh` to extract; it checks every sha256) because the commit connector accepts 4 files per call.

## Reproduce
See `REPRODUCE.sh`.

## RESUME HERE
Formal-validation lane: rebuild the squashfs images with a 16K block size (or put the 14,301-module CritLine closure plus
Mathlib on ext4), then rerun `tierC/run_tierC.sh tierC/TierC_PrintAxioms.lean` and, if it finishes, the unmodified
`integration/run_proof_companion_cached.sh` with `vm.max_map_count` raised. Before that, check
`grok_swarm/native_family_existence/08_*/09_*` so bounded closures are not built twice.
**HANDOFF TO:** integration (the Tier A/B axiom results and the `open DirichletCharacter` dependency of `zetaRight`),
dependencies (repaired exporter + verifier agreement on two real graphs), audit.
