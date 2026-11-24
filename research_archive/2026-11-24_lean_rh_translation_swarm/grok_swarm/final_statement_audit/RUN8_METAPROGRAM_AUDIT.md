# final_statement_audit RUN8: metaprogram-written declarations and environment-modifying code

Pin: riemann-hypothesis `40e56bab026552e089d7afcfeff08d2defb9c005`, Lean v4.33.1, Mathlib 0df444a. Evidence: `RUN8_VALIDATION_LOG.txt`.
- **Compiled:** two core-Lean toy files (`RUN8_MetaToolsPositive.lean`, `RUN8_MetaToolsNegative.lean`). Each contains verbatim copies of the upstream metaprograms, run against toy declarations.
- **Not built:** the upstream modules themselves. No gate is marked closed.

## 1. Inventory (complete source scan of src/, 175,187 files)

| tool | where | what it does | declarations it produces |
|---|---|---|---|
| `cpt_copy_thms` (command) | Formalism/HermitianCurvature/HermitianCurvatureProofs/CutCptCopy.lean:87. Invoked **once**, at CutMainCpt.lean:945 (`set_option maxHeartbeats 0 in cpt_copy_thms`). | Starts from 6 hard-coded roots (`CutBP.thmBpAt_main4`, `germ_truncation_positive`, `block_growth_bound_of_compact_coef`, `nFTopFormAll_of_ptw`, `top_identity_of_domination_limits`, `nfPolFormAll_of_top`). It walks every `Formalism.*` constant they use, transitively. Any constant whose type or value uses a "terminal" name (14 `manual` names, 3 `special` names) or an already-tainted name is copied under the name `<name>Cpt`. In the copy's **type and value**, terminals are replaced by their hand-written `…Cpt` versions or by the 3 `special` replacements, and tainted names by their copies. It is added with `addDecl (.defnDecl {d with …})` or `addDecl (.thmDecl {t with …})` (CutCptCopy.lean:78, :82). It skips names that already exist. | `…Cpt` copies of definitions and theorems. The exact list is only known after the 1,661-module import closure of CutMainCpt is built; **not enumerated here**. At source level exactly **one** generated name is referenced outside the copy machinery: `block_growth_bound_of_compact_coefCpt` at CompanionTheory/AutomorphicTheory/CompactTopologicalForms/FinalS.lean:61. Every other `*Cpt` name referenced in CptCopy2.lean and FinalS.lean is declared in the source text. |
| `kcopy` (tactic), `#kcopy_probe` (command) | Formalism/LocalToGlobal/NumberFieldFamilies/OwnStruct.lean:53, :60 | Builds a term of the target type from a source term. It does this by η-expanding over binders and rebuilding `Formalism.*` structures, plus `And`/`Prod`/`Sigma`/`Subtype`/`Iff`, field by field from projections. At the leaves it **returns the source term unchanged** whenever the types differ and `probe = false`. `kdefeq` calls `Kernel.isDefEq` only in probe mode. The result is assigned to the goal with `g.assign`. | No new constants; it only fills the body of the user's declaration. Used in 3 files, one of them a **`def`**: `hermRe` (IwasawaDecomposition/HermRe.lean:19). `#kcopy_probe` is used nowhere. |
| `kexactB` (tactic) | Formalism/LocalToGlobal/IndefiniteReal/HeckeNonvanishing/Imports.lean:5 | Elaborates the term with **no expected type** and assigns it to the goal with `g.assign`. There is **no elaboration-time type check**, so defeq is left to the kernel. Used through `local macro "kc% " e => (by kexactB $e)`. | No constants. Used in 49 files. |
| `run_tac` blocks | 16 files under Development/AbelianVarietyTheory/Proofs/… | 14 files only `revertAll` and then `exact`. Two assign raw metavariables: ExistsGIs.lean:81–83 does `m.assign (h)` with no type check, where the goal and `h` differ in `recOf Z` versus `recOf Z'`; FramesTildeGammaValues.lean:70–79 builds `Subsingleton.elim` with `mkAppM`, which is type-checked. | No constants. |
| `run_cmd Lean.modifyEnv … nameDenyListExt.addEntry` | BuildAid/D1–D5.lean:4 | Adds a namespace to the `LibrarySuggestions` deny-list. Run: the state became `["CompanionTheory", "Lake", "Lean", "Internal", "Tactic"]`. | No constants; it only affects tactic suggestions. |
| `@[positivity …] evalFrameOrd` | Formalism/SharpRestriction/…/EvalFrameOrd.lean:7 | A Mathlib positivity extension. It returns the proof `Formalism.HC.Frame.ord_pos a`. | No constants; proofs only, which the kernel checks. |

**Import path.** Every item above is in the import closure of `Main` (175,187 modules) and of `everyCharacter` (MainConclusion.lean, 175,174 modules). Closure computed from import lines; see the log.
**Constant-dependency path.** Whether `riemannHypothesis` or `everyCharacter` actually *uses* a generated `…Cpt` constant, or a `kexactB`/`kcopy`-filled body, cannot be settled without the built environment. The source-level entry point is FinalS.lean:61 → FinalC.lean.

## 2. Programmatic axiom / opaque / unsafe creation: none found

0 hits in src/ for each of:
- **axioms:** `axiomDecl`, `mkAxiom`, `AxiomVal`, `axiomInfo`;
- **opaque and other declaration kinds:** `opaqueDecl`, `OpaqueVal`, `quotDecl`, `mutualDefnDecl`;
- **unchecked environment changes:** `addDeclCore`, `addDeclWithoutChecking`, `Environment.addDecl`, `Kernel.Environment`, `setEnv`, `replaceConst`;
- **compilation hooks:** `addAndCompile`, `compileDecl`, `implemented_by`, `setImplementedBy`;
- **unsafe:** `DefinitionSafety`, `.unsafe`, `unsafe`;
- **other:** `ReducibilityHints`, `sorryAx`, `ofReduceBool`, `axiom`/`opaque`/`unsafe` declarations.

The only `Declaration` constructors in the repo are the two in CutCptCopy (`.defnDecl` and `.thmDecl`). They copy `safety` and `hints` from the original, which is safe because the repo contains no `unsafe` declarations. `partial def` appears twice, both metaprogram helpers (`CptCopy.go`, `KCopy.copyAt`); compiling them created exactly these 2 `opaque` constants and nothing else (log). There are 25 `instance : Inhabited` declarations, but they matter only for `partial`/`opaque` implementations, and none of those exist outside the two helpers.

## 3. Does any of this bypass checks in a way that matters?

Execution evidence from the toy files, using verbatim tool code:
- **`cpt_copy_thms`, well-typed case:** it copied 2 declarations: `helperCpt`, a **def**, and `thmBpAt_main4Cpt : SizeStdCpt → SizeStdCpt`. `#print axioms` reports no axioms. The substitution really does **change the statement**: the copy is a different theorem whose type mentions the `…Cpt` replacements. That is legitimate, but it means the generated theorems' *statements* are machine-generated.
- **`cpt_copy_thms`, ill-typed substitution:** the copy's type became False while its value stayed `trivial : True`. Result: `(kernel) declaration type mismatch` and exit code 1.
- **`kexactB`, ill-typed term** (`rfl : 1 = 1` for the goal `1 = 2`): result `(kernel) declaration type mismatch` and exit code 1.
- **`kcopy` and `#kcopy_probe`, well-typed case:** they work, with no axioms; `#kcopy_probe` refused nothing.

**The finding that matters most: error recovery.** After each kernel error, Lean *kept the name in the environment so it could continue elaborating*. `#check thmBpAt_main4Cpt` then succeeded, and `#print axioms Formalism.Toy.bad` printed `[Formalism.Toy.bad]`, meaning the failed theorem now stands as **its own axiom**.

So, conclusions:
- None of these tools bypasses the kernel. A wrong `kexactB`, `kcopy`, `m.assign` or `addDecl` result produces a build **error**, not a silent proof.
- A failed declaration does not disappear, though. It sits in the environment as an axiom-like stand-in, so downstream uses still elaborate.
- Soundness of the final theorem therefore needs **(i)** an error-free `lake build` *and* **(ii)** `#print axioms riemannHypothesis` showing only `propext`, `Classical.choice` and `Quot.sound`. Check (ii) alone also catches the stand-ins, because they appear by name in the axiom list, as `Formalism.Toy.bad` did.
- `kcopy` on the def `hermRe` and `kexactB` on data terms affect *definitional* content, i.e. which term a def unfolds to. The kernel checks the types, but the chosen value is whatever the tool built. That is legitimate, but it is opaque to a human reader.

## 4. Decisive checks for the full build (not run)

```lean
import Main
#print axioms riemannHypothesis            -- must be exactly [propext, Classical.choice, Quot.sound]
open Lean in                                -- which machine-generated constants riemannHypothesis really uses
#eval show CoreM Unit from do
  let env ← getEnv
  let mut seen : NameSet := {}
  let mut todo : Array Name := #[`riemannHypothesis]
  let mut gen : Array Name := #[]
  while todo.size > 0 do
    let n := todo.back!
    todo := todo.pop
    if seen.contains n then continue
    seen := seen.insert n
    let some ci := env.find? n | continue
    if (← findDeclarationRanges? n).isNone && n.toString.endsWith "Cpt" then gen := gen.push n
    for c in ci.type.getUsedConstants ++ ((ci.value? (allowOpaque := true)).map (·.getUsedConstants)).getD #[] do
      todo := todo.push c
  IO.println s!"{seen.size} constants reached; generated *Cpt constants used: {gen}"
```
The walk itself was run on the toy environment, rooted at `thmBpAt_main4Cpt`: it reached 9 constants and correctly flagged both generated copies, which have no declaration ranges. It has **not** been run on `riemannHypothesis`.

Also: the `lake build` log must have **zero** `error:` lines, especially at CutMainCpt.lean:945, the 49 `kexactB` files, the 3 `kcopy` files and ExistsGIs.lean:81. An independent kernel replay (`lean4checker`) re-checks the `addDecl` copies.
