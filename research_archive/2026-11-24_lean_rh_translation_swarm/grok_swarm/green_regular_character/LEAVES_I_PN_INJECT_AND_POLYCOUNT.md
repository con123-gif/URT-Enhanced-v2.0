# green_regular_character — LEAVES I and Pn of Theorem A (prime labels → regular characters; the polynomial count)

Lane: `grok_swarm/green_regular_character` (Grok executor, separate from the concurrent RUN5/RUN6 executor of this lane; file prefix `LEAVES_I_PN_` to avoid collisions).
Upstream: `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`. Written 2026-11-24, ~10:20–10:45 GMT.

**CLAIM / scope.** The two leaves of Theorem A (`GlobalTheory.greenRegularCharacters_holds`) that RUN4's dependency tree marked
"leaf for this lane — open, not attempted": `I = GlobalTheory.T.monicIrreducible_inject_regularCharacterOrbits` and
`Pn = GlobalTheory.T.ncard_monic_natDegree_coeff_zero_ne_zero`. Not touched: the 11 targets of RUN5's generator
(`charpolyEndomorphismDensityGL_recursion`, `classFn_eq_zero_of_charpoly_not_irreducible_pow`, `monicFactorizationConvolution_cancel_of_one`,
the mirabolic/BZ leaves, …), the E and C inputs of Theorem A, and everything in galois_rows / covolume_premises (RUN6).
Overlap re-check immediately before pushing (branch head `01c60a1`): RUN5 (`8298f23`, `RUN5_GREEN_DEPENDENCY_TREE.md`) still lists I and Pn as open frontier and does not suggest them; the concurrent RUN6 working files on the box do not mention them. Claim is released at this commit.

**Status (exact strength).** Both leaves are **closed in-repo theorems with no upstream dependency beyond Mathlib** (the imported upstream
modules supply only the two definitions `IsPrimeLab`, `IsRegularChar`). Executed this session (logs in `LEAVES_I_PN_VALIDATION_LOG.txt`):
1. The four pinned upstream source files were **re-elaborated** with Lean 4.33.1 against the published pinned environment (upstream lakefile
   `[leanOptions]`, Mathlib 0df444a, upstream oleans of the imports from the frozen mirror 4e8bb36f): all four `EXIT=0`, no errors.
   The source text used is byte-identical to the raw-URL fetch at the pin (`cmp`).
2. `#print axioms` on the four upstream constants in that environment: `[propext, Classical.choice, Quot.sound]` only.
3. A **Mathlib-only verbatim companion** (`LEAVES_I_PN_GreenLeafCompanion.lean`: the two definitions + the four files' bodies, only the
   `import` lines replaced by `import Mathlib`) elaborates with exit 0 and standard axioms **when run with the upstream leanOptions**.
4. A kernel identity check (`LEAVES_I_PN_UpstreamIdentityCheck.lean`, upstream env): the companion's copies of `IsPrimeLab` and
   `IsRegularChar` are `rfl`-equal to the upstream constants; the companion statement texts are exactly the upstream theorem types; and each
   `T.*` wrapper type is `rfl`-equal to the type of its proof-file theorem.
5. Exact finite checks (`LEAVES_I_PN_leaf_exact_checks.py`, integer arithmetic): 13 (g,n) cases of Pn and 11 (g,d) fields for I, 0 mismatches.
   These are instances, not proofs.

**New finding (reproducible, relevant to every verbatim companion).** Under Lean/Mathlib *default* options the verbatim body of
`primeLab_to_regularChar` does **not** elaborate: `rw [hcu, ← map_pow, ← map_pow] at h` (upstream lines 141 and 147) fails with
"did not find an occurrence of the pattern ?f ?a ^ ?n" (log `companion_default_options`; a 3-line Mathlib probe reproduces it, and
`rw [← map_pow e]` would work). It succeeds with the upstream lakefile option `maxSynthPendingDepth = 3`. So a companion that is built with a
plain `lakefile.toml` (no `[leanOptions]`) can fail on upstream bodies that are fine upstream. This is an elaboration-option dependency,
not a soundness issue. Other companions in this lane were not re-checked.

---

## 1. Exact upstream declarations (pin 40e56ba; git blob sha1)

| Name | File : line | Blob |
|---|---|---|
| `GlobalTheory.T.ncard_monic_natDegree_coeff_zero_ne_zero` (wrapper, `first \| exact @…`) | `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NcardMonicNatDegreeCoeffZeroNeZeroStatement.lean:8` | `fdc071c1` |
| `GlobalTheory.GrPolys.card_monic_coeff_zero_ne_zero` | `…/InertiaEigenvalues/NcardMonicNatDegreeCoeffZeroNeZero.lean:38` | `f7e73d9d` |
| `GlobalTheory.GrPolys.monic_deg_equiv_card` | same file `:8` | |
| `GlobalTheory.GrPolys.zero_part_eq` | same file `:19` | |
| `GlobalTheory.T.monicIrreducible_inject_regularCharacterOrbits` (wrapper) | `…/InertiaEigenvalues/MonicIrreducibleInjectRegularCharacterOrbitsStatement.lean:8` | `c82520e5` |
| `GlobalTheory.PrimeLabOrbit.primeLab_to_regularChar` | `…/InertiaEigenvalues/MonicIrreducibleInjectRegularCharacterOrbits.lean:125` | `4a7a4f26` |
| `PrimeLabOrbit.aeval_pow_frob` / `frob_injective` / `card_le_of_gen_fixed` | same file `:12` / `:20` / `:28` | |
| `PrimeLabOrbit.finrank_adjoin` / `adjoin_gen` / `le_of_dvd` (section `adjoin`, hyp `hP : IsPrimeLab d P`) | same file `:51` / `:55` / `:60` | |
| `PrimeLabOrbit.exists_unit_root` / `orbit_regular` | same file `:81` / `:103` | |
| `GlobalTheory.GLq.IsPrimeLab` (def; section variables `{g : ℕ} [Fact g.Prime]`, line 30) | `src/Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/LabelDatum.lean:91` | `8b45fadb` |
| `GlobalTheory.Published.IsRegularChar` (def) | `src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/GreenRegularCharacters.lean:10` | `29f45aba` |
| consumer `GlobalTheory.GLq…family` (uses I once, line 30) and `…count` (uses Pn once, line 72), assembled in `GlobalTheory.greenRegularCharacters_holds` (:137) | `…/InertiaEigenvalues/GreenCuspidalCharsByRegularCharsProof.lean` | `8b77636f` |

Definitions (verbatim):
* `IsPrimeLab d P :≡ P.Monic ∧ Irreducible P ∧ P.coeff 0 ≠ 0 ∧ P.natDegree = d` (over `(ZMod g)[X]`; carries an unused `[Fact g.Prime]` argument — `#check` shows `{g} → [Fact g.Prime] → ℕ → (ZMod g)[X] → Prop`; earlier companions in this lane restate it without that argument, which is propositionally harmless but not the same constant signature).
* `IsRegularChar g d θ :≡ ∀ i j, i < d → j < d → θ ^ g ^ i = θ ^ g ^ j → i = j` for `θ : Kˣ →* ℂˣ`.

## 2. Leaf Pn — the polynomial count

**Statement (exact).** For every `g : ℕ` with `[Fact g.Prime]` and every `n : ℕ` with `0 < n`, writing
`T_n = {f ∈ (ZMod g)[X] | f.Monic ∧ f.natDegree = n ∧ f.coeff 0 ≠ 0}`:
`Set.ncard T_n = g ^ n - g ^ (n - 1)` **and** `Set.Finite T_n`. (Natural-number subtraction; it is never truncated because g^(n−1) ≤ g^n.
`n − 1` is natural subtraction, harmless because `0 < n`.)

**Proof.**
*Lemma A (`monic_deg_equiv_card`, any n including 0).* `S_m = {f | f.Monic ∧ f.natDegree = m}` is in bijection with `Fin m → ZMod g`
(a monic polynomial of degree m is X^m plus an arbitrary polynomial of degree < m, i.e. its m lower coefficients: Mathlib
`monicEquivDegreeLT` then `degreeLTEquiv`). Hence `S_m` is finite with `ncard S_m = g^m` (`ZMod.card`).
*Lemma B (`zero_part_eq`, needs 0 < n).* `B_n = {f ∈ S_n | f.coeff 0 = 0}` equals the image of `S_{n−1}` under `h ↦ X·h`.
(⊆) `f(0)=0` ⇒ `X ∣ f`, `f = X·h`; h is monic (`Monic.of_mul_monic_left`) and `natDegree (X·h) = natDegree h + 1`, so `deg h = n − 1`
(here 0 < n is used). (⊇) `X·h` is monic of degree `(n−1)+1 = n` and has zero constant coefficient.
*Main.* `T_n ∪ B_n = S_n`, disjoint (`f(0) ≠ 0` vs `= 0`), both finite as subsets of `S_n`. Multiplication by X is injective
(`mul_left_cancel₀ X_ne_zero`), so `ncard B_n = ncard S_{n−1} = g^(n−1)`. By `Set.ncard_union_eq`, `ncard T_n + g^(n−1) = g^n`, and `omega` gives
`ncard T_n = g^n − g^(n−1)`. Finiteness of `T_n` is the subset fact. ∎
Primality of g enters through `ZMod g` being a finite type of cardinality g (`ZMod.card`, needs `NeZero g`) and through the domain instances used by `mul_left_cancel₀ X_ne_zero` and `natDegree_X_mul` (`ZMod g` is a field). Mathematically, cancellation by X holds over any nontrivial ring, but the Lean proof takes it from the field instance.

## 3. Leaf I — prime labels inject into regular characters modulo Frobenius orbits

**Statement (exact).** For every `g` with `[Fact g.Prime]`, every `d` with `0 < d`, every `K : Type` with `[Field K] [Algebra (ZMod g) K]`
and `Module.finrank (ZMod g) K = d`, there is `c : (ZMod g)[X] → (Kˣ →* ℂˣ)` such that
(i) for all P, `IsPrimeLab d P → IsRegularChar g d (c P)`; and
(ii) for all P, P', `IsPrimeLab d P → IsPrimeLab d P' → (∃ i < d, c P' = c P ^ g ^ i) → P = P'`.
(c is a total function on all polynomials; only its values on prime labels of degree d are constrained. Clause (ii) is the
"Frobenius-orbit" injectivity used by `family`; it needs i < d only as stated, the proof never uses the bound on i.)

**Shared mechanism (derived once): Frobenius on a finite field of characteristic g.** For any field `K` with a `ZMod g`-algebra
structure, `CharP K g` holds (`Algebra.charP_iff`), so `y ↦ y^(g^n)` is the n-th iterated Frobenius, a ring endomorphism; hence
(a) `aeval (y^(g^n)) Q = (aeval y Q)^(g^n)` for `Q ∈ (ZMod g)[X]` (`aeval_pow_frob`: Frobenius fixes the coefficients — the algebra map
from `ZMod g` is unique, `Subsingleton.elim`), and (b) `y ↦ y^(g^n)` is injective (`frob_injective`). Both are used twice below.

**Lemma (`card_le_of_gen_fixed`).** If L is a finite `ZMod g`-field generated as `{aeval x Q}` by one element x with `x^(g^k) = x`, k > 0,
then `|L| ≤ g^k`. Proof: by (a) every y = aeval x Q satisfies `y^(g^k) = aeval (x^(g^k)) Q = y`, so every element is a root of
`X^(g^k) − X ≠ 0` (g^k > 1), which has at most `g^k` roots. ∎

**Lemma (`le_of_dvd`, hyp IsPrimeLab d P).** If `0 < k` and `P ∣ X^(g^k) − X` then `d ≤ k`. Proof: `AdjoinRoot P` is a field (P irreducible),
has a power basis of dimension `natDegree P = d` (`finrank_adjoin`), hence `g^d` elements; it is generated by its root (`adjoin_gen`), and
the root satisfies `root^(g^k) = root` because P divides `X^(g^k) − X`. The previous lemma gives `g^d ≤ g^k`, so `d ≤ k` (g > 1). ∎

**Lemma (`exists_unit_root`, needs 0 < d and finrank K = d).** Every prime label P of degree d has a root u ∈ Kˣ. Proof: `AdjoinRoot P` and K are
finite fields with `g^d` elements (both have `ZMod g`-dimension d; K is finite-dimensional because finrank is positive); finite fields of
equal cardinality are isomorphic as `ZMod g`-algebras (`FiniteField.algEquivOfCardEq`), and the image φ(root) is a root of P in K.
It is nonzero because `P.coeff 0 ≠ 0` (a zero root would force the constant coefficient to vanish). ∎ — *This is the only place where the
exceptional polynomial P = X is excluded, via the clause `coeff 0 ≠ 0` of IsPrimeLab.*

**Lemma (`orbit_regular`).** If P is a prime label of degree d and `aeval u P = 0`, then for i, j < d, `u^(g^i) = u^(g^j)` implies i = j.
Proof: suppose i < j < d and `u^(g^i) = u^(g^j)`. Cancelling the injective map `y ↦ y^(g^i)` (mechanism (b)) gives `u^(g^(j−i)) = u`.
P is the minimal polynomial of u (monic, irreducible, `minpoly.eq_of_irreducible_of_monic`), so P divides `X^(g^(j−i)) − X`, and `le_of_dvd`
gives `d ≤ j − i < d`, contradiction; the case j < i is symmetric. ∎

**Proof of I.** K is finite. Fix a group isomorphism `e : Kˣ ≃* (Kˣ →* ℂˣ)` (Mathlib `CommGroup.monoidHom_mulEquiv_of_hasEnoughRootsOfUnity`:
Kˣ is finite abelian and ℂ has enough roots of unity; the isomorphism is chosen non-canonically via `Nonempty.some`). Define
`c P := e(u_P)` where u_P is a chosen unit root of P in K if one exists, else `c P := 1`. For a prime label P of degree d,
`exists_unit_root` guarantees the first branch, so `c P = e(u)` with `aeval u P = 0`.
(i) If `(e u)^(g^i) = (e u)^(g^j)` with i, j < d, then `e(u^(g^i)) = e(u^(g^j))` (e is a homomorphism), so `u^(g^i) = u^(g^j)` (e injective, then
coerce units to K), and `orbit_regular` gives i = j. — *This is the step that needs `maxSynthPendingDepth = 3` in Lean (see Status).*
(ii) If `c P' = (c P)^(g^i)`, then `e(u') = e(u^(g^i))`, so `u' = u^(g^i)` in K. By mechanism (a), `aeval u' P = (aeval u P)^(g^i) = 0`
(`zero_pow`, g^i ≠ 0). So u' is a root of both P and P'; both are monic irreducible, hence both equal `minpoly (ZMod g) u'`, so P = P'. ∎

**What is *not* claimed by I.** c is not shown to hit every regular character, and no compatibility with Teichmüller lifts/`LabelDatum`
is part of I (that is Theorem B / `green_of_regular`, RUN1). The exhaustion count (Theorem A, Step 2) does not need surjectivity: it needs only
(i), (ii) and E(ii).

## 4. Where they enter (consumer check, source-read)
`GreenCuspidalCharsByRegularCharsProof.lean` (blob 8b77636f): `family` (:23) obtains `⟨c, hc1, hc2⟩` from I at degree e (:30) to build the
injective label family `L_e(P) = τ_e(c_e(P))`; `count` (:56) obtains `⟨hcard, hfin⟩` from Pn at degree d (:72) for the size `g^d − g^(d−1)` of
`T_d`. Both are used exactly once (lexical search over all 175,188 source files: the only files mentioning these names are the two proof files,
the two Statement files and this consumer). The human proof of Theorem A in `2026-11-24_GREEN_REGULAR_CHARACTER_CHAPTER.md` §2 is unchanged.

## 5. Preserved assumptions (none added)
g prime (`Fact`), `0 < n` (Pn), `0 < d`, an arbitrary field K with *some* `ZMod g`-algebra structure and `finrank = d` (I); no finiteness of K is
assumed (it is derived), no choice of generator or Teichmüller map is assumed (e is chosen inside the proof). No hypothesis was dropped,
strengthened or reordered in the companion; the only textual changes are the replaced `import` lines.

## 6. Remaining dependencies (exact names)
* I and Pn: **none** beyond Mathlib at 0df444a (kernel `#print axioms`: propext, Classical.choice, Quot.sound).
* Theorem A (`GlobalTheory.greenRegularCharacters_holds`) after this run still depends on:
  `GlobalTheory.T.exists_cuspidalCharacter_of_regularCharacter_GLn` (E) and `GlobalTheory.T.card_cuspidal_multisets_total_degree_le` (C),
  whose subtrees are in RUN2–RUN4 (and the concurrent RUN5/RUN6) of this lane.

## 7. Files
* `LEAVES_I_PN_GreenLeafCompanion.lean` — generated, Mathlib-only verbatim companion (run with upstream leanOptions; see the run script).
* `LEAVES_I_PN_scripts_bundle.py` — `python3 LEAVES_I_PN_scripts_bundle.py [dir]` writes, byte-for-byte, the four run files:
  `LEAVES_I_PN_mk_companion.py` (the generator; textual slicing from the raw-URL fetch at the pin),
  `LEAVES_I_PN_UpstreamIdentityCheck.lean` (rfl-identity and axiom check in the pinned upstream environment),
  `LEAVES_I_PN_run_pinned_env.sh` (exact command used for upstream-environment runs: LEAN_PATH, options),
  `LEAVES_I_PN_leaf_exact_checks.py` (exact finite checks). Bundled only because the commit tool limits files per commit.
* `LEAVES_I_PN_VALIDATION_LOG.txt` — commands, exit codes, timings, axiom output, and the default-options failure.

Where things ran: the box shared by Con's agents (Linux, 8 cores, 15 GB), Lean 4.33.1 from `~/.elan`, `nice -n 10`, `OMP_NUM_THREADS=1`.
The upstream oleans were not rebuilt by me: they are the published cache oleans of the frozen mirror, mounted read-only by the lean_validation
lane (`/workspace/rh_full_build`). Not run: CI; `lake build` of the upstream project; nanoda/comparator.

## RESUME HERE
Next executable task (this lane, not claimed by RUN5's generator list): re-run the existing GreenCompanion modules
(`companion/GreenCompanion/*.lean`) with the upstream `[leanOptions]` (in particular `maxSynthPendingDepth = 3`) added to the companion
`lakefile.toml` (the committed one has no `[leanOptions]`), and record per module whether it still elaborates with the same axioms;
then, in the upstream environment via `LEAVES_I_PN_run_pinned_env.sh`, re-elaborate `GreenCuspidalCharsByRegularCharsProof.lean` and print
axioms of `GlobalTheory.greenRegularCharacters_holds` to confirm the Theorem A assembly in the real environment.
HANDOFF TO: green_regular_character (RUN5/RUN6 executor), lean_validation (the leanOptions finding applies to every verbatim companion).
