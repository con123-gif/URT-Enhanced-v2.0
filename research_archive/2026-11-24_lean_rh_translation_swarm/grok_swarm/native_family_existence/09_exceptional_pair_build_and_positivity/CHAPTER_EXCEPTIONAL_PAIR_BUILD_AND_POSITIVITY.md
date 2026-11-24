# Chapter 09: compiling the closure of `ExceptionalPair.main`, and three positivity and bound lemmas

Lane: native_family_existence. Run 9, 2026-11-24 (GMT).
Pin: `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`, with Mathlib `0df444a`.
Paths are relative to `src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/`.

## Part 0. Execution (real output in `run_logs.txt`, which concatenates build_run.log, companion_run.log, verify_run.log and constants_run.log under BEGIN/END markers)

**Closure size.** `clos.py` reports that the import closure of `ExceptionalDirichletZeroUniqueZeroFreeRegionStatement`, the re-export of `GlobalTheory.ExceptionalPair.main`, has **30 upstream modules**. Compared with the run-8 closure it adds only two modules: `ExceptionalDirichletZeroUniqueZeroFreeRegion` and its `…Statement`. That was small, so it was compiled.

**Method.** The same as run 8, and read-only. The scripts `08_/build_closure.py`, `08_/clos.py` and `08_/run_companions.sh` were used unchanged except that the scratch output directory was changed from `/workspace/nfe8/build` to `/workspace/nfe9/build`. The roots are listed in the header of `build_run.log`. The dependency oleans came from `/workspace/rh_green_lean/.lake/packages`, whose 9 package revisions are identical to the upstream manifest. Each upstream source module was compiled with core `lean` v4.33.1 (`build_closure.py`), using the options from the upstream `lakefile.toml`. The outputs went to scratch, and nothing was downloaded. The verifier confirms the compiled source tree is blob-identical to the pin.

**Build.** `build_run.log` shows **30/30 modules compiled, 0 failures**. The only warnings are linter and deprecation warnings, and no module contains `sorry`. Among the compiled modules are `ExceptionalDirichletZeroUniqueZeroFreeRegion` (17 s) and its `…Statement` (13 s). The box was shared with other lanes' Lean jobs, so module times are longer than in run 8.

**Companions** (`companion_run.log`):

| file | result | `#print axioms` |
|---|---|---|
| 09_/RH_Run9Companion.lean (new) | **exit 0** | `RealZeroNearOne.exists_bound`, `TwoRealCharacters.neg_sum_logDeriv_nonneg`, `logDerivativeThreeFourOne.three_four_one`, `ExceptionalPair.main`, `T.exceptionalDirichletZero_unique_zeroFreeRegion`: [propext, Classical.choice, Quot.sound] |
| 09_/RH_ExceptionalPairCompanion_T1part.lean (new) | **exit 0** | `ExceptionalPair.main`: [propext, Classical.choice, Quot.sound] |

`RH_ExceptionalPairCompanion_T1part.lean` is the T-1 part of the committed `04_/RH_ExceptionalPairCompanion.lean`, copied verbatim from lines 5–21. Two things are dropped: the `import …CharacterBoxes.MainConclusion` line and the T-8 block, because MainConclusion's closure is about 175,000 modules. Its `example` re-types the chapter-04 statement of T-1 in full and closes it with `GlobalTheory.ExceptionalPair.main`. It elaborated, so chapter 04 quotes the T-1 statement faithfully. **The committed 04_ companion as a whole, including T-8, is still NOT EXECUTED.**

**What this establishes.** `GlobalTheory.ExceptionalPair.main` (T-1) and its whole upstream subtree compile from pinned source against Mathlib 0df444a. Its transitive axioms are only Lean's three standard ones. T-1 is therefore a proved theorem inside the pinned project, not merely a source reading. This is still not RH, and no gate is closed.

---
## A. `GlobalTheory.RealZeroNearOne.exists_bound` (OrderNeTop.lean:33)
```lean
theorem exists_bound : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
    χ ≠ 1 → ∀ σ : ℝ, 1 < σ → σ ≤ 2 → ∀ T : Finset ℝ,
    (∀ β ∈ T, 2 / 3 ≤ β ∧ LFunction χ β = 0) →
    -(deriv (LFunction χ) σ / LFunction χ σ).re ≤ C * Real.log (2 * q)
      - ∑ β ∈ T, (analyticOrderNatAt (LFunction χ) β : ℝ) / (σ - β) := by
```
**What it says.** For a non-principal χ and real σ ∈ (1, 2], take any finite set T of real zeros of L(χ, ·) in [2/3, 1). Then −Re L′/L(σ) is at most C·log 2q minus Σ_{β∈T} m_β/(σ − β). C is the constant of (LZ) and is uniform in q and χ. This is the bound used in chapter 05 (T-1a).

**Proof.** C is the (LZ) constant, `GlobalTheory.T.logDeriv_dirichletLFunction_local_zero_sum`, chapter 07 §A.
1. Apply (LZ) with t = 0 and s = σ. This is allowed because |σ − 3/2| ≤ 1/2 ≤ 2/3, and because L(χ, σ) ≠ 0 for σ > 1 (Mathlib `LFunction_ne_zero_of_one_le_re`). Write Z for the finite zero set in the 5/6-disc about 3/2 and S = Σ_{w∈Z} m_w/(σ − w). (LZ) gives |D − S| ≤ C·log(q·(|0| + 2)) = C·log 2q, where D = L′/L(σ). Taking real parts, Re D ≥ Re S − C log 2q.
2. *T ⊆ Z.* Each β ∈ T satisfies β < 1 (`re_lt_one`: L(χ, z) ≠ 0 for Re z ≥ 1, χ ≠ 1). Then |β − 3/2| ≤ 5/6 because 2/3 ≤ β < 1. The map ℝ → ℂ is injective, so distinct β are distinct points of Z.
3. *Each term of S has nonnegative real part.* For w ∈ Z, Re w < 1 < σ, so Re 1/(σ − w) = (σ − Re w)/|σ − w|² > 0, and m_w ≥ 0. So Σ_{β∈T} m_β/(σ − β), a sum over a subset with real terms, is ≤ Re S.
4. Hence −Re D ≤ C log 2q − Re S ≤ C log 2q − Σ_T m_β/(σ − β).

Edge cases: T = ∅ is allowed, and then the bound reads −Re D ≤ C log 2q. q = 1 is vacuous, since every χ is 1. The upper limit σ ≤ 2 is used only to stay in the 2/3-disc.

## B. `GlobalTheory.TwoRealCharacters.neg_sum_logDeriv_nonneg` (NegSumLogDerivNonneg.lean:42)
```lean
theorem neg_sum_logDeriv_nonneg : ∀ (q : ℕ) [NeZero q] (χ ψ : DirichletCharacter ℂ q) (σ : ℝ), χ ^ 2 = 1 → ψ ^ 2 = 1 → 1 < σ → 0 ≤ -((deriv (LFunction (1 : DirichletCharacter ℂ q)) σ / LFunction (1 : DirichletCharacter ℂ q) σ).re + (deriv (LFunction χ) σ / LFunction χ σ).re + (deriv (LFunction ψ) σ / LFunction ψ σ).re + (deriv (LFunction (χ * ψ)) σ / LFunction (χ * ψ) σ).re) := by
```
This is (NN) from chapter 05.

**Proof.**
1. *`hasSum_re_neg_logDeriv`:* for σ > 1, −Re L′/L(χ, σ) = Σ_n Re χ(n)·Λ(n)/n^σ, convergent. This uses Mathlib's `LSeries_twist_vonMangoldt_eq`, which says −L′/L = L-series of χΛ for Re > 1, together with `deriv_LFunction_eq_deriv_LSeries`. Then take real parts termwise, which is legitimate because n^σ is real.
2. *`re_sum_nonneg`:* for every a ∈ ℤ/q, Re[1(a) + χ(a) + ψ(a) + (χψ)(a)] ≥ 0. If a is a unit, χ² = ψ² = 1 forces χ(a), ψ(a) ∈ {±1}, and the sum is 1 + x + y + xy = (1 + x)(1 + y) ≥ 0. If a is not a unit, all four values are 0.
3. Adding the four series termwise, the n-th term is [step-2 quantity at a = n mod q]·Λ(n)/n^σ ≥ 0, since Λ ≥ 0. So the sum is ≥ 0 (`HasSum.nonneg`).

Edge cases: χ = ψ, χ = 1 and ψ = 1 are all allowed. The proof never uses χ ≠ ψ.

## C. `GlobalTheory.logDerivativeThreeFourOne.three_four_one` (LogDerivativeBound.lean:76)
```lean
theorem three_four_one : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (σ t : ℝ), 1 < σ → 0 ≤ -(3 * (deriv (LFunction (1 : DirichletCharacter ℂ q)) σ / LFunction (1 : DirichletCharacter ℂ q) σ).re + 4 * (deriv (LFunction χ) (σ + t * I) / LFunction χ (σ + t * I)).re + (deriv (LFunction (χ ^ 2)) (σ + 2 * t * I) / LFunction (χ ^ 2) (σ + 2 * t * I)).re)
```
This is the 3-4-1 kernel from chapter 06. The full statement line is copied word for word into `verify_run9_sources.py` and checked there. It is also printed by `#check` in `companion_run.log`.

**Proof.**
1. *`comb_nonneg`:* if |z| = 1 then 3 + 4 Re z + Re z² ≥ 0. With z = x + iy and x² + y² = 1, the expression is 3 + 4x + x² − y² = 2(1 + x)² ≥ 0.
2. *`neg_logDeriv_eq`:* for Re s > 1, −Re L′/L(χ, s) = Σ_n Re[χ(n)Λ(n)n^{−s}]. This uses the same Mathlib inputs as B.1.
3. *`term_nonneg`, for each n:* write n^σ = A > 0, b = n^{it} with |b| = 1, and c = Λ(n)/A ≥ 0.
   - If n is a unit mod q, the three terms are 3c, 4c·Re(χ(n)/b) and c·Re((χ(n)/b)²). This uses n^{σ+2it} = A·b² and χ²(n) = χ(n)². Since |χ(n)/b| = 1, step 1 gives a total ≥ 0.
   - If n is not a unit, all terms vanish.
4. Combine 3·(series at σ) + 4·(series at σ + it) + (series at σ + 2it). The sum is ≥ 0 termwise.

Edge cases: χ = 1, t = 0 and χ² = 1 are all allowed. No hypothesis on χ is needed.

---
## D. Erratum for RUN8
The header comment of `08_/RH_Run8Companion.lean` names `lake_lean_run.log` and `CHAPTER_ANALYTIC_BASE.md`. The correct names are `companion_run.log` and `CHAPTER_EXECUTED_COMPANIONS_AND_ANALYTIC_BASE.md`. This is recorded in `NOTE_RUN8_COMPANION_HEADER.md`, and the committed file is not rewritten.

## Remaining dependencies
- Mathlib only, for A, B and C: `LFunction_ne_zero_of_one_le_re`, `LSeries_twist_vonMangoldt_eq`, `deriv_LFunction_eq_deriv_LSeries`, `LSeriesSummable_twist_vonMangoldt` and `vonMangoldt_nonneg`. These are compiled into the oleans used.
- Inside the 30-module T-1 closure nothing is assumed, because all of it was compiled. Some of it is still not written up in prose, for example `ZeroFreeComplex.LFunction_conj_eq_zero` and the `DirichletLZerosEqPrimitiveCharacterZeros` internals.
- Not compiled here: anything above `ExceptionalPair.main`, namely `primesRel_holds` and the rest of the main path (chapters 02–03). Their closures are on the order of 13,000 or more modules.

## RESUME HERE
1. `PrimesInProgressionsRelativeError` (`Lin.primesRel_holds`), the next step up from T-1, has an import closure of **485 modules** (measured this run with `clos.py`), and `ChebyshevPsiProgressionRelativeError` has 481. That is probably buildable with the same method in about an hour when the box is quiet. Check disk first; the run-8 build of 29 modules used about 9 MB of oleans.
2. Write up `ExceptionalPair.main` assembly lemmas not yet written in prose, if any remain after chapter 04.
3. Fourth-level η users.

## HANDOFF TO
- **lean_validation:** the T-1 subtree, `ExceptionalPair.main` and below, is now compiled from pinned source with standard axioms. It need not be redone.
