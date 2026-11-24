# Green regular character lane — RUN2: generic count, cuspidal Mackey orthogonality, regular rootSum character

Lane: `green_regular_character` (Grok). Upstream: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`. Toolchain used: Lean 4.33.1 + Mathlib `0df444a` (identical to the upstream pins).
Date: 2026-11-24 (GMT). RUN1 = commit `7bc49a7` (exhaustion / Bridge companions).

## Honest status (read first)

| Upstream declaration (exact name) | What was done | Status |
|---|---|---|
| `GlobalTheory.GLq.card_generic_irr_le` | proof body copied verbatim into `GreenCompanion/GenericCount.lean`; its 5 upstream deps are explicit hypotheses with their exact upstream statements; built with lake; `#print axioms` = `[propext, Classical.choice, Quot.sound]` | **conditional companion compiled** (conditional on the 5 deps) |
| `GlobalTheory.GLq.IpCuspProd.ip_hcL_cusp` | same technique, `GreenCompanion/MackeyCusp.lean`; 5 deps as hypotheses; built; standard axioms only | **conditional companion compiled** (conditional on the 5 deps) |
| `GlobalTheory.T.isCharacter_cuspidal_rootSum_regular` (= `GlobalTheory.CuspGL.isChar_psi_rootSum_of_regular`) | both Mathlib-only definition files copied verbatim, proof body (2 helper lemmas + main) copied verbatim, 10 deps as hypotheses, `GreenCompanion/RootSumCore.lean`; built; standard axioms only | **conditional companion compiled** (conditional on the 10 deps) |

None of this proves the dependencies. No gate is closed by this file. Companions restate upstream definitions verbatim
(namespace renamed to `GreenCompanion`) and do not import the upstream repository, so "compiled" means: *the upstream proof
text, with exactly the listed upstream statements as premises, typechecks against Mathlib with no `sorry` and no extra axiom.*
The exact finite checks are small-case illustrations (GL₂(F_p)), not evidence for the general theorems.

## 1. `GlobalTheory.GLq.card_generic_irr_le`

Statement (verbatim, `Proofs/InertiaEigenvalues/NcardGenericIrreducibleCharactersGLnLe.lean`):

```lean
theorem card_generic_irr_le : ∀ (g : ℕ) [Fact g.Prime] (ψ : AddChar (ZMod g) ℂ), ψ ≠ 1 → ∀ n : ℕ, 0 < n →
    Set.ncard {ρ : Gn g n → ℂ | IsIrr ρ ∧ wh ψ ρ ≠ 0} ≤ g ^ n - g ^ (n - 1)
```

Hypotheses kept: `g` prime, `ψ` a **nontrivial** additive character of `ZMod g`, `n > 0`. The set counted is irreducible
characters with nonzero Whittaker functional `wh ψ ρ = tr(e_U ρ)`.

Human proof (follows the Lean body step for step).
1. *Finiteness.* The irreducible characters of the finite group `Gn g n = GL_n(F_g)` form a finite set `S`
   (`finite_irrCharacters_and_finsum_centralIdempotents_eq_one`), so `ncard` is the card of a Finset.
2. *Decomposition.* `gg ψ n` (the Gelfand–Graev character) is a class function (`gg_isClass`, proved in-file), hence
   `gg = Σ_{ρ∈S} ⟨gg,ρ⟩ ρ` (`character_decomposition_and_classFunction_expansion`).
3. *Integrality of multiplicities.* For irreducible ρ, `wh ψ ρ = tr(e_U · ρ)` with `e_U` idempotent, so it is a natural
   number `m_ρ` (`groupAlgebraTrace_idempotent_and_irreducible_degree` + `whittakerJacquetIdempotents_properties_primeField`).
4. *Reciprocity + norm.* `⟨ρ, gg⟩ = wh ψ ρ = m_ρ` and `wh ψ gg = g^n − g^(n−1)`
   (`gelfandGraevCharacterGLn_norm_and_reciprocity`; this is where `ψ ≠ 1` and `n > 0` are used).
5. Applying `wh ψ` (linear) to the decomposition gives `Σ_ρ m_ρ² = g^n − g^(n−1)`.
6. *Count.* Each ρ with `m_ρ ≠ 0` has `m_ρ ≥ 1`, so `m_ρ² ≥ 1`; hence `#{ρ : m_ρ ≠ 0} ≤ Σ m_ρ² = g^n − g^(n−1)`.
   No multiplicity-one theorem is used — the bound is weaker than, and independent of, uniqueness of Whittaker models.

Remaining upstream dependencies (exact names): `GlobalTheory.T.finite_irrCharacters_and_finsum_centralIdempotents_eq_one`,
`GlobalTheory.T.character_decomposition_and_classFunction_expansion`, `GlobalTheory.T.gelfandGraevCharacterGLn_norm_and_reciprocity`,
`GlobalTheory.T.groupAlgebraTrace_idempotent_and_irreducible_degree`, `GlobalTheory.T.whittakerJacquetIdempotents_properties_primeField`
(implementation names upstream: `irr_finite_and_finsum_zOf_eq_one`, `charDec`, `GGNorm.gg_norm`, `trIdem`,
`Adopt.whittakerJacquetIdempotents_properties_primeField`). In-file helpers reproved verbatim: `isChar_of_isIrr`, `ip_comm`,
`tr_finset_sum`, `gg_isClass`.

## 2. `GlobalTheory.GLq.IpCuspProd.ip_hcL_cusp`

Statement (verbatim, `Proofs/InertiaEigenvalues/CharacterPairingHarishChandraCuspidalMackey.lean`):

```lean
theorem ip_hcL_cusp : ∀ (g : ℕ) [Fact g.Prime] (L L' : List (Pc g)) (n : ℕ), degL L = n → degL L' = n →
    (∀ p ∈ L, IsCusp p.2) → (∀ p ∈ L', IsCusp p.2) →
    (¬ L.Perm L' → ip (hcL L n) (hcL L' n) = 0) ∧ (L.Nodup → ip (hcL L n) (hcL L n) = 1)
```

Hypotheses kept: both lists have total degree exactly `n`; **every** entry is cuspidal; conclusion (a) needs `¬ L.Perm L'`,
conclusion (b) needs `L.Nodup` (with repeats the norm is > 1 — see check §5b, where a repeated pair gives 2).

Human proof (the Lean proof is one induction, `finiteRing_sq_sub_mul_sq_eq_of_card`, on `L'`, generalising `L` and `n`).
* `L' = []`: then `n = 0`; `L` has degree 0 and cuspidal entries of positive degree, so `L = []` (`eq_nil_of_degL`) and the
  pairing is that of the trivial character with itself, 1 (`ip_triv`); the `¬Perm` case is vacuous.
* `L' = (m,ψ) :: L₀`: `hcL L' n = hc(ψ ⊠ hcL L₀)` (`hcL_cons`). By Harish-Chandra Frobenius reciprocity
  (`harishChandra_frobenius_reciprocity`), `⟨hcL L, hc(ψ⊠·)⟩ = ⟨res_{(m, n−m)} hcL L, ψ ⊠ hcL L₀⟩`. The restriction of a product
  of cuspidals is a sum over index subsets `I` of `L` of degree `m` (`harishChandraRestriction_cuspidal_product_sum_subsets`).
  Split by `|I|` (helper `ip_sub_cusp`): `|I| = 0` impossible (ψ cuspidal has degree `m > 0`, `hψ.1`); `|I| ≥ 2` gives a
  product of length ≥ 2 paired against the cuspidal ψ, which is 0 (`ip_long_cusp`: Frobenius reciprocity again, then the
  two-block restriction of a cuspidal vanishes, `harishChandraRestrictionTwoBlock_cuspidal_eq_zero`); `|I| = 1`, `I = {i}`, gives `⟨L_i, ψ⟩ ⟨hcL (L∖i), hcL L₀⟩` and `⟨L_i, ψ⟩ = δ` by orthogonality of irreducible
  characters (`centralIdempotentOfIrrCharacter_orthogonal_central`, via `ip_single_cusp`). Induction on `L₀`, together with
  permutation invariance of `hcL` (`harishChandraProductList_isCharacter_and_perm_invariant`), gives: sum is 0 unless `L` is a
  permutation of `L'`, and for `L = L'` Nodup exactly one `i` contributes, giving 1.

Remaining upstream dependencies (exact names): `GlobalTheory.T.harishChandra_frobenius_reciprocity`,
`GlobalTheory.T.harishChandraRestrictionTwoBlock_cuspidal_eq_zero`, `GlobalTheory.T.harishChandraRestriction_cuspidal_product_sum_subsets`,
`GlobalTheory.T.centralIdempotentOfIrrCharacter_orthogonal_central`, `GlobalTheory.T.harishChandraProductList_isCharacter_and_perm_invariant`
(implementations: `FrobRecHC.hcT_adjoint`, `res_cusp_eq_zero`, `ResCuspProd.main`, `ZOrth.zorth`, `gl_list_product_perm_char`).

## 3. `GlobalTheory.T.isCharacter_cuspidal_rootSum_regular`

Statement (verbatim, `Proofs/CharacterTheory/IsCharacterCuspidalRootSumRegular.lean`, aliased in `...Statement.lean`):

```lean
theorem _root_.GlobalTheory.CuspGL.isChar_psi_rootSum_of_regular (F : Type) [Field F] [Finite F] (θ : AlgebraicClosure F →* ℂ)
    (hθ : ∀ x y : AlgebraicClosure F, x ≠ 0 → y ≠ 0 → θ x = θ y → x = y) (d k : ℕ) (hd : 0 < d)
    (hk : ∀ i : ℕ, 0 < i → i < d → ¬ k * Nat.card F ^ i ≡ k [MOD Nat.card F ^ d - 1]) :
    BI.IsChar ℂ ℂ (fun x : GL (Fin d) F => (-1) ^ (d - 1) * psi (rootSum θ k) (Fin d → F) (Matrix.toLin' x)) ∧
    ipGL (psi (rootSum θ k) (Fin d → F)) (psi (rootSum θ k) (Fin d → F)) = glCard F d
```

Hypotheses kept: `F` finite field; `θ` injective **on nonzero elements only** (θ(0) is unconstrained); `d > 0`; regularity
`k·q^i ≢ k (mod q^d − 1)` for `0 < i < d` only (i = 0 trivially satisfies the congruence).

Human proof (Green's construction, following the Lean body).
1. `rootSum θ k` is additive and takes value `j` on `(X − 1)^j` (`rootSum_isAdditive_and_pow_X_sub_one`).
2. *Virtuality* (helper `psi_rootSum_charpoly_mem_virt`, strong induction on `d`): by `psi_eq`, `psi s V` equals
   `s ∘ charpoly` minus a sum, over proper nonzero invariant subspaces W, of `psi` on W times the quotient term; grouping W by
   dimension `a < d` (helper `finsum_proper_invariant_eq_sum_range_finrank`) turns each group into a parabolic induction of
   the smaller `psi` (`parab_virt`, using conjugation invariance `psi_conj`). `rootSum ∘ charpoly` is virtual
   (`rootSum_charpoly_mem_virt`, uses `hθ`), and virtual characters are closed under these operations, so `psi(rootSum θ k)` is virtual.
3. *Norm*: `psi` is primitive (`isPrimitive_psi`), so `ipGL(ψ, psi) = ipGL(ψ, s∘charpoly)` (`PrimOrth.ipGL_psi_eq`), and
   `ipGL(psi, rootSum∘charpoly) = glCard · #{i < d : k q^i ≡ k}` (`ipGL_psi_rootSum`). Regularity makes the count exactly 1
   (only i = 0), giving `ipGL psi psi = glCard F d`.
4. Transport to `GL (Fin d) F` with `extZero_spec`; a virtual character of norm |G| is ± an irreducible character
   (`BI.irr_of_norm_one`). The value at 1 is `psi_one`: `∏_{1≤i<d}(1 − q^i)`, so `(−1)^(d−1)·psi(1) = ∏(q^i − 1) > 0`, which
   selects the + sign; hence `(−1)^(d−1)·psi` is a character (indeed irreducible).

Remaining upstream dependencies (exact names): `GlobalTheory.CuspGL.psi_conj`, `GlobalTheory.CuspGL.rootSum_charpoly_mem_virt`,
`GlobalTheory.ParabVirt.parab_virt`, `GlobalTheory.CuspGL.rootSum_isAdditive_and_pow_X_sub_one`, `GlobalTheory.CuspGL.PrimOrth.ipGL_psi_eq`,
`GlobalTheory.CuspGL.isPrimitive_psi`, `GlobalTheory.CuspGL.ipGL_psi_rootSum`, `GlobalTheory.CuspGL.extZero_spec`,
`GlobalTheory.CuspGL.psi_one`, `GlobalTheory.BI.irr_of_norm_one`. (`GlobalTheory.CuspGL.psi_eq` lives in the definitions file and is
re-proved verbatim in the companion, so it is **not** a hypothesis.)

## 4. Shared mechanisms (stated once)

* **M1 — "count ≤ sum of squares of naturals"** (§1 step 6). Same shape as RUN1's injection-against-bound step: a set of labels
  injects into something whose size is bounded by an exactly computed norm.
* **M2 — "norm of a virtual character pins irreducibility"** (§3 step 4, and §2 for products): orthogonality relations compute an
  inner product; norm 1 ⇒ ±irreducible; positivity of degree fixes the sign. §2 provides the off-diagonal zeros, §3 the diagonal.
* **M3 — companion technique** (all three): verbatim definitions + verbatim proof body + upstream deps as `Prop`-valued
  hypotheses with exact statements, generated by script (`mk_run2.py`, `mk_rootsum.py`; kept on the worker box at `/workspace/rh_green_work/run2/`, not committed), so no hand edits to proof text beyond
  renaming dependency references to hypothesis names and threading those hypotheses through helper lemmas.

## 5. Exact finite checks (`RUN2_green_exact_checks.py`, output verbatim in Appendix C)

a. Gelfand–Graev norm on GL₂(F_p), p = 2, 3, 5: `⟨gg, gg⟩ = Σ m_ρ² = p² − p` (the upstream bound with n = 2), computed in Z[ζ_p].
b. Harish-Chandra products of GL₁ characters (cuspidal) in GL₂(F_p), p = 3, 5: all 16 / 256 pairings equal
   `[χ = χ'] + [χ = swap χ']`; Nodup self-pairing 1, repeated pair self-pairing 2 (shows the `Nodup` hypothesis is needed).
c. Regularity bookkeeping for q ∈ {2,3,4,5,7}, d ∈ {2,3}: for regular k, `#{i<d : k q^i ≡ k} = 1`, and the sign
   `(−1)^(d−1)∏(1−q^i) > 0`.

## 6. Overlap note

Checked recent commits before starting (`ac8d3e6` galois_rows, `9dbcc10` native family, `3cf1eb3` independent exhaustion/PinNum
note, which agrees with RUN1). None covers these three declarations.

## 7. Next task (proposal)

Push the same companion technique one level down on the highest-leverage deps: `GlobalTheory.CuspGL.ipGL_psi_rootSum` and
`GlobalTheory.ParabVirt.parab_virt` (both Mathlib-only import chains through the CuspGL/BI definitions already copied), then
`GlobalTheory.T.gelfandGraevCharacterGLn_norm_and_reciprocity`.

## Appendix A — Lean log (verbatim excerpts, this run)

Companion files committed under `companion/GreenCompanion/` (`LabelDefs.lean`, `GenericCount.lean`, `MackeyCusp.lean`,
`RootSumCore.lean`) are byte-identical to the files built below (lake project with RUN1's `lakefile.toml`/`lean-toolchain`;
`GenericCount`/`MackeyCusp` import `LabelDefs` → RUN1 `Exhaustion`).

```
$ lake env lean GreenCompanion/GenericCount.lean ; lake env lean GreenCompanion/MackeyCusp.lean
'GreenCompanion.card_generic_irr_le' depends on axioms: [propext, Classical.choice, Quot.sound]
'GreenCompanion.ip_hcL_cusp' depends on axioms: [propext, Classical.choice, Quot.sound]
(other output: linter warnings only — 1 deprecation in GenericCount, unused-section-variable / unused-hypothesis-name linters in MackeyCusp; no errors)
$ lake env lean GreenCompanion/RootSumCore.lean
'GreenCompanion.isChar_psi_rootSum_of_regular' depends on axioms: [propext, Classical.choice, Quot.sound]
EXIT 0
$ grep -c sorry GreenCompanion/{LabelDefs,GenericCount,MackeyCusp,RootSumCore}.lean  -> 0 0 0 0
```

## Appendix B — upstream blob ledger (git hash-object vs. GitHub tree at the pin)

| path | blob @ pin | local fetch |
|---|---|---|
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/NcardGenericIrreducibleCharactersGLnLe.lean` | `b7c093fab7b800163cefac3adbead8c8e87f3a97` | match (contents API) |
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/CharacterPairingHarishChandraCuspidalMackey.lean` | `3ef9da4e7c082fc138aa8eef95164d68308d17ed` | match (contents API) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IsCharacterCuspidalRootSumRegular.lean` | `408e2e3de53288e6ad13db1ffa9b9bf4f289fc26` | match |
| `src/Development/AbelianVarietyTheory/Definitions/CommutativeAlgebra/AbByPOfComm.lean` | `6277b155093ae63bcb99150317e091bbc3ced33e` | match |
| `src/Development/AbelianVarietyTheory/Definitions/CommutativeAlgebra/InvariantSubspaceMobiusInverseRecEqOfFinrankLt.lean` | `b54d4f567816eb79c2aeab71426a7bb1285cd166` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvariantSubspaceMobiusInverseCharpolyLinearEqui.lean` | `f9a2708041b2c1a3c371fd017c4dadce01f5625c` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/RootPowerSumCharpolyMemVirtualCharactersGL.lean` | `0e5ebcdaadfb74de874db5aefd64af3f7f3782a8` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/ParabolicInductionTrivialPreservesVirtualCharact.lean` | `0d5e00dab6e05d3fa13adf8c8e33b967542cfba0` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/RootPowerSumCharacterAdditiveAndXSubOnePow.lean` | `bcf5a029bed38d23bf2d69798783022c42aedd06` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvertibleEndomorphismInnerProductPrimitiveMobiu.lean` | `a6fd7499ebdb5940fa350d24fb6eb45ca2933bc0` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IsPrimitiveEndClassFunctionInvariantSubspaceMobi.lean` | `9961bb67bec706d9ef6c96910c3367c12058409e` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvertibleEndInnerProductRootPowerSumMobius.lean` | `3fa1ff31e5645e2138fdb2dab395d83be405636b` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/GeneralLinearFunctionExtendZeroEndProperties.lean` | `e77dac70833c63d9af130c5cf671b8caecd8756b` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvariantSubspaceMobiusInverseOneProdIco.lean` | `a8b0f6a8322b0d198603452f183ae76063b175c6` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IrreducibleOfVirtualCharacterNormOne.lean` | `bd9b0f361705d3c9471e1150436f252205a039eb` | match |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IsCharacterCuspidalRootSumRegularStatement.lean` | `ca858311c006c5c5c92a30dd35ebabd27144bc31` | match |

## Appendix C — `python3 RUN2_green_exact_checks.py` output

```
== Gelfand-Graev norm <gg,gg> = sum_rho m_rho^2 on GL_2(F_p); upstream bound g^n - g^(n-1) with n = 2
p=2: <gg,gg> = 2; p^2-p = 2; equal: True
p=3: <gg,gg> = 6; p^2-p = 6; equal: True
p=5: <gg,gg> = 20; p^2-p = 20; equal: True
== Harish-Chandra products of GL_1 characters (cuspidal for GL_1) in GL_2(F_p):
   expected <Ind(a,b), Ind(a',b')> = [(a,b)=(a',b')] + [(a,b)=(b',a')]; Nodup (a!=b) gives norm 1
p=3: 16 pairs checked, mismatches = 0; self-pairing values: Nodup -> [Fraction(1, 1)], repeated -> [Fraction(2, 1)]
p=5: 256 pairs checked, mismatches = 0; self-pairing values: Nodup -> [Fraction(1, 1)], repeated -> [Fraction(2, 1)]
== rootSum regularity condition and sign of the degree (isChar_psi_rootSum_of_regular)
q=2 d=2: regular k mod q^d-1: 2; Frobenius orbits: 1 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 1 > 0: True
q=2 d=3: regular k mod q^d-1: 6; Frobenius orbits: 2 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 3 > 0: True
q=3 d=2: regular k mod q^d-1: 6; Frobenius orbits: 3 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 2 > 0: True
q=3 d=3: regular k mod q^d-1: 24; Frobenius orbits: 8 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 16 > 0: True
q=4 d=2: regular k mod q^d-1: 12; Frobenius orbits: 6 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 3 > 0: True
q=4 d=3: regular k mod q^d-1: 60; Frobenius orbits: 20 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 45 > 0: True
q=5 d=2: regular k mod q^d-1: 20; Frobenius orbits: 10 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 4 > 0: True
q=5 d=3: regular k mod q^d-1: 120; Frobenius orbits: 40 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 96 > 0: True
q=7 d=2: regular k mod q^d-1: 42; Frobenius orbits: 21 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 6 > 0: True
q=7 d=3: regular k mod q^d-1: 336; Frobenius orbits: 112 (divisible: True); #{i<d : k q^i = k} = 1 for all regular k: True; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = 288 > 0: True
```
