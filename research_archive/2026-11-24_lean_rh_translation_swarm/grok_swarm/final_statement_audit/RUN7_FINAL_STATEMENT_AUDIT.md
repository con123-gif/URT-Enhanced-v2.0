# final_statement_audit RUN7: what `riemannHypothesis` actually states

Pin: leanprover-community/riemann-hypothesis `40e56bab026552e089d7afcfeff08d2defb9c005`, Lean `v4.33.1`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`. The lake-manifest is identical to the one in the local package set I compiled against.
Evidence: `RUN7_VALIDATION_LOG.txt`. No gate is marked closed. The full upstream proof was **not** built.

## 1. The statement and the chain behind it

| item | exact text | file:line (blob) |
|---|---|---|
| final theorem | `theorem riemannHypothesis : RiemannHypothesis := rhOfAll` | src/Main.lean:4 (`dbd5db70bc11`) |
| Main's preamble | `import Statements`, `import Supplements.Kernels.MainTheoremsAll`; no `open`, no `namespace`, no `set_option`, no notation | src/Main.lean:1–2 |
| `rhOfAll` | `theorem rhOfAll : RiemannHypothesis := Formalism.VW.rh_of_every allChi` | src/Supplements/Kernels/MainTheorems.lean:9 (`6a542d7ce969`) |
| `allChi` | `theorem allChi : UpperTheory.EveryCharacter := UpperTheory.FinalTheorems.everyCharacter` | same file:7 |
| `EveryCharacter` | `∀ N [NeZero N] (χ : DirichletCharacter ℂ N) s, 1/2 < s.re → (χ ≠ 1 ∨ s ≠ 1) → LFunction χ s ≠ 0` | …/CharacterBoxes/EveryCharacter.lean |
| `rh_of_every` | apply `EveryCharacter` at N = 1, χ = 1; Mathlib's `LFunction_modOne_eq` turns it into ζ(s) ≠ 0 for Re s > 1/2 and s ≠ 1; then `rh_of_right` | src/Formalism/GammaFactorNonvanishing/CritLine.lean (`95fa4da5c501`) |
| `rh_of_right` | (∀ s, 1/2 < Re s → s ≠ 1 → ζ s ≠ 0) → `RiemannHypothesis`. Proof: the functional equation `riemannZeta_one_sub` reflects a zero with Re s < 1/2 to 1 − s. Γ and 2(2π)^{s−1} do not vanish there, and cos(π(1−s)/2) vanishes only at the trivial zeros or s = 0, both excluded. | src/Formalism/GammaFactorNonvanishing/RhOfRight.lean (`3604637147a3`) |

## 2. Is it Mathlib's `RiemannHypothesis`? Yes.

- **The name resolves to Mathlib's definition, confirmed by running it.** In the companion, the elaborator resolved the bare identifier `RiemannHypothesis` to the root constant `RiemannHypothesis` declared in module `Mathlib.NumberTheory.LSeries.RiemannZeta`. `#print` gives
  `∀ (s : ℂ), riemannZeta s = 0 → (¬∃ n, s = -2 * (↑n + 1)) → s ≠ 1 → s.re = 1 / 2`
  This is the Mathlib source at RiemannZeta.lean:185–186 (blob `3c92195fce20`), in the root namespace. `riemannZeta` likewise resolves to Mathlib's `riemannZeta := hurwitzZetaEven 0` (:121).
- **No repo declaration shadows it (source scan).** In all 175,187 `.lean` files under src/ there is no declaration of `RiemannHypothesis` or `*.RiemannHypothesis` of any kind (def, abbrev, theorem, structure, class, inductive, opaque, axiom or instance). No `src/Mathlib/` directory shadows a module, there are no `prelude` files, and no `export` mentions it.
- **The repo's own spelling is definitionally Mathlib's, confirmed by running it.** `example : RiemannHypothesis = RiemannZetaZerosOnLine := rfl` compiles. `RiemannZetaZerosOnLine` is the repo's spelling in Statements.lean:3, and Main.lean:6 relies on this equality.
- **Comparison with textbook RH:**
  - The zeros are those of Mathlib's ζ. Mathlib's ζ is the meromorphic continuation on ℂ∖{1}, with an arbitrary "junk" value at the pole s = 1.
  - The trivial zeros −2, −4, … are excluded as `-2*(n+1)`, n ∈ ℕ. This is correct: n = 0 gives −2, and 0 is not excluded, which is right because ζ(0) = −1/2.
  - The pole s = 1 is excluded, so its junk value cannot matter.
  - The conclusion is Re s = 1/2.
  - Mathlib's form asserts this for **every** non-trivial zero in ℂ, not only for zeros in the strip 0 < Re s < 1. It is classically equivalent to the textbook RH, because ζ has no zeros with Re s ≥ 1 and none with Re s ≤ 0 other than the trivial ones. If anything it is the logically stronger-looking form.
  - **Discrepancy: none.**

## 3. Could anything change the statement's meaning? Nothing found.

| mechanism | finding |
|---|---|
| global notation, macros, syntax, elaborators | There are 26 non-local or non-scoped declarations in the whole repo: 22 are `macro … : tactic`, 2 are `elab … : tactic` (`kcopy`, `kexactB`), and 2 are `elab … : command` (`cpt_copy_thms`, `#kcopy_probe`). All introduce new keywords. None can rewrite the identifier `RiemannHypothesis` or the `theorem` command. The other ~1.8k notation/macro lines are `local` or `scoped`, and Main opens nothing. |
| environment manipulation | `CutCptCopy.lean` copies declarations with `addDecl`, which is kernel-checked. `OwnStruct.lean` calls `Kernel.isDefEq` as a probe and builds proof terms (`kcopy`). `kexactB` assigns a goal without an elaboration-time type check, but the kernel re-checks every finished declaration. `BuildAid/D1–D5` `run_cmd` only add namespaces to the `LibrarySuggestions` deny-list, which only affects tactic suggestions. All of these are in Main's closure. None can alter Mathlib's `RiemannHypothesis` constant, and none can bypass the kernel. |
| kernel bypass | 0 hits for `skipKernelTC` or `debug.skip`, and none in lakefile.toml. 0 hits for `implemented_by`, `@[extern]`, `ofReduceBool`, `native_decide`, `trustCompiler`, `unsafeCast` or `@[csimp]`. |
| `set_option` | Only resource limits, linters, `backward.*` defeq flags, `allowUnsafeReducibility` (37), `hygiene` (31) and `quotPrecheck` (7). These are file- or section-scoped and affect elaboration or automation only. None appears in Main.lean. |
| lakefile | `autoImplicit=false`, heartbeats, `--tstack`; the `Main` lib has roots `Statements` and `Main`. Nothing meaning-changing. |

## 4. Compilation

- **What compiled** (`RUN7_FinalStatementCompanion.lean`): I ran `lean v4.33.1` against Mathlib 0df444a, using the read-only prebuilt packages in /workspace/rh_green_lean/.lake/packages. It exited with code 0 in 6.8 s. The file contains verbatim copies of Statements.lean, RhOfRight.lean, the `EveryCharacter` definition and the `rh_of_every` proof, together with checks (a)–(d). `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for both `rh_of_right` and `rh_of_every`. So the last two steps, "EveryCharacter ⇒ Mathlib RH", are proven with only standard axioms.
- **Why the full check was not run:** a source-level import scan shows Main's closure is the **entire repo**, all 175,187 modules. `CritLine`'s closure alone is 14,301 modules, because `EveryCharacter` lives in a file importing that many. That is far beyond a small run. `example : RiemannHypothesis := riemannHypothesis` against the real `Main` was therefore **not** compiled.
- **The decisive check for the full build:**
  ```lean
  import Main
  example : _root_.RiemannHypothesis := riemannHypothesis   -- the name resolves to Mathlib's constant (§2)
  #print axioms riemannHypothesis                           -- expect only propext, Classical.choice, Quot.sound
  ```
  Run it after `lake build` of the pinned repo with the pinned Mathlib. Optionally add `lean4checker` or a `--run` replay of the kernel over `Main`'s environment, which covers the `addDecl` copies too.
- **Remaining gap:** `UpperTheory.FinalTheorems.everyCharacter`, the proof of `EveryCharacter`, was not compiled here. That is the whole mathematical content. This audit only shows that *if* it typechecks, it proves exactly Mathlib's RH.
