# Green regular character lane — RUN3: `ipGL_psi_rootSum`, `parab_virt`, `gelfandGraevCharacterGLn_norm_and_reciprocity`

Lane `green_regular_character` (Grok). Upstream `leanprover-community/riemann-hypothesis` @ `40e56bab026552e089d7afcfeff08d2defb9c005`.
Lean 4.33.1 + Mathlib `0df444a` (= upstream pins), lake project reused from RUN1/RUN2 (no new Mathlib cache).
Date 2026-11-24 (GMT). Previous: RUN1 `7bc49a7`, RUN2 `f5bf62f`.

## Honest status

| Upstream declaration (exact) | Companion | Remaining hypotheses | Status |
|---|---|---|---|
| `GlobalTheory.CuspGL.ipGL_psi_rootSum` | `CuspGLRun3.lean` (IpglRootSum part) | 8 upstream `GlobalTheory.T.*` statements | conditional companion compiled, standard axioms |
| `GlobalTheory.ParabVirt.parab_virt` | `CuspGLRun3.lean` (ParabVirt part) | 1 (`GlobalTheory.T.virtualCharacters_mul_comap_conj_ind_linear`) | conditional companion compiled, standard axioms |
| `GlobalTheory.T.gelfandGraevCharacterGLn_norm_and_reciprocity` (= `GlobalTheory.GLq.GGNorm.gg_norm`) | `GGNorm.lean` | 1 (`GlobalTheory.GLm.GGSum.sum_wh_gg`) | conditional companion compiled, standard axioms |

"Compiled" means: the upstream proof text, copied verbatim (namespaces renamed, dependency references replaced by
hypothesis names), typechecks against Mathlib with the listed exact upstream statements as premises; `#print axioms` =
`[propext, Classical.choice, Quot.sound]`; no `sorry`. Definitions are textual copies — their identity with the upstream
constants is not machine-checked. No gate is closed. Finite checks are small-case illustrations only.

**Chaining to RUN2 (checked in Lean).** RUN2's `RootSumCore.lean` (`isCharacter_cuspidal_rootSum_regular`) took
`IPRPart` and `ParabVirtPart` as hypotheses. RUN3 adds `iprPart_of_deps : RAPart → … → OrthPart → IPRPart` and
`parabVirtPart_of_deps : VirtPart → ParabVirtPart`, with the RUN2 hypothesis texts copied byte-for-byte, both compiled with
standard axioms. So those two RUN2 premises are reduced to the 8 + 1 deeper statements listed below. (The two modules
restate the definitions separately, so the composition is checked at the level of identical statement text, not as one
linked Lean term.) Likewise RUN2's `GenericCount.lean` premise `GGNormPart` (= upstream `gelfandGraevCharacterGLn_norm_and_reciprocity`)
is reduced to `sum_wh_gg`.

## 1. `GlobalTheory.CuspGL.ipGL_psi_rootSum`

```lean
theorem ipGL_psi_rootSum (F : Type) [Field F] [Finite F] (V : Type) [AddCommGroup V] [Module F V]
    [FiniteDimensional F V] (θ : AlgebraicClosure F →* ℂ)
    (hθ : ∀ x y : AlgebraicClosure F, x ≠ 0 → y ≠ 0 → θ x = θ y → x = y) (hn : 0 < Module.finrank F V)
    (k l : ℕ) :
    ipGL (psi (rootSum θ k) V) (fun g : Module.End F V => rootSum θ l (LinearMap.charpoly g)) =
      glCard F (Module.finrank F V) * (((Finset.range (Module.finrank F V)).filter
        (fun i => k * Nat.card F ^ i ≡ l [MOD (Nat.card F ^ Module.finrank F V - 1)])).card : ℂ)
```

Hypotheses kept: `F` finite; `θ` injective on nonzero elements only; `dim V = n > 0`; `k, l` arbitrary (no regularity here).
Write `q = |F|`, `N = q^n − 1 > 0` (needs `q > 1` and `n > 0`).

Proof.
1. `s = rootSum θ k` is additive (`rootPowerSumCharacter_additive_and_X_sub_one_pow`), so `psi s V` is a class function
   (`invariantSubspaceMobiusInverseCharpoly_linearEquiv_conj`) and primitive (`isPrimitiveEndClassFunction_invariantSubspaceMobiusInverse`).
2. For a primitive class function φ, `ipGL(φ, rootSum θ l ∘ charpoly)` is a torus sum
   `Σ_{α^N = 1} (n / deg m_α) · mass φ (m_α^{n/deg m_α}) · conj(θ α^l)`, `m_α = minpoly_F α`
   (`invertibleEndInnerProduct_rootPowerSum_eq_torusSum`); the set `{α^N = 1}` is rewritten as the finset of `N`-th roots of 1.
3. Per α: `deg m_α ∣ n` (`frobeniusTorus_minpoly_degree_rootPowerSum`), `m_α` monic irreducible, `P = m_α^{n/deg}` has degree n.
   The mass of `psi s V` at a monic degree-n `P` is `glCard·Λ_s(P)/(q^n − 1)` (`endomorphismMass_mobiusInverse_monic_eq`), and
   the von Mangoldt function of an additive `s` at a prime power is `s(m_α)` (`additive_eq_polynomialVonMangoldt_convolution_one`, 2nd clause, needs `n/deg > 0`).
   Additivity gives `(n/deg)·s(m_α) = s(m_α^{n/deg}) = Σ_{i<n} θ(α)^{k q^i}` (in-file `IsAdditive.map_pow_monic` + the root-sum clause).
   Hence each term equals `glCard/(q^n−1) · Σ_{i<n} θ(α)^{k q^i} conj(θ(α)^l)`.
4. Swap sums. Torus orthogonality (`frobeniusTorus_character_orthogonality`, uses `hθ`) gives
   `Σ_α θ(α)^{k q^i} conj θ(α)^l = N·[k q^i ≡ l mod N]`. Summing over `i < n` and cancelling `N = q^n − 1 ≠ 0` gives the claim.

Remaining deps (exact): `GlobalTheory.T.rootPowerSumCharacter_additive_and_X_sub_one_pow`, `GlobalTheory.T.invariantSubspaceMobiusInverseCharpoly_linearEquiv_conj`,
`GlobalTheory.T.isPrimitiveEndClassFunction_invariantSubspaceMobiusInverse`, `GlobalTheory.T.invertibleEndInnerProduct_rootPowerSum_eq_torusSum`,
`GlobalTheory.T.frobeniusTorus_minpoly_degree_rootPowerSum`, `GlobalTheory.T.endomorphismMass_mobiusInverse_monic_eq`,
`GlobalTheory.T.additive_eq_polynomialVonMangoldt_convolution_one`, `GlobalTheory.T.frobeniusTorus_character_orthogonality`
(implementations: `CuspGL.rootSum_isAdditive_and_pow_X_sub_one`, `CuspGL.psi_conj`, `CuspGL.isPrimitive_psi`, `CuspGL.ipGL_rootSum_eq_sum_torus`,
`CuspGL.torus_minpoly`, `CuspGL.mass_psi_eq_glCard_mul_mangoldt_div`, `CuspGL.mangoldt_conv_spec`, `CuspGL.torus_orthogonality`).

## 2. `GlobalTheory.ParabVirt.parab_virt`

Statement (verbatim): for `F` finite, `Φ` a family of functions on `End(V)` invariant under linear-equivalence conjugation, and
`a n : ℕ`: if `x ↦ Φ (Fin a → F) (toLin' x)` is a virtual character of `GL_a(F)`, then
`x ↦ ∑ᶠ W : {W ≤ F^n // finrank W = a ∧ W is x-stable}, Φ W (x|_W)` is a virtual character of `GL_n(F)`.

Proof (follows the Lean body).
* Case `a > n`: no subspace of dimension `a` exists, the finsum is empty, and 0 is virtual. (Kept: the statement has no `a ≤ n` hypothesis.)
* Case `a ≤ n`: fix `W₀ = span(e_1..e_a)` and `e₀ : W₀ ≃ F^a`. `P = stab W₀` (a parabolic subgroup); `ρ : P → GL_a(F)` is
  "restrict to W₀ and transport by e₀" (`resMat`, a monoid hom). `χ ∘ ρ` is virtual on `P` (pull-back clause of
  `virtualCharacters_mul_comap_conj_ind_linear`), so `Ind_P^G(χ∘ρ)` is virtual (induction clause). It remains to show the
  finsum equals `Ind_P^G(χ∘ρ)(x) = |P|⁻¹ Σ_t ext0_P(χ∘ρ)(t⁻¹xt)`:
  - `π : t ↦ t·W₀` maps `GL_n` onto the a-dimensional subspaces (any two a-dim subspaces are related by some `t`, via
    complements: `exists_gl_map_lin_eq_of_finrank_eq`), with fibres the cosets `tP` (`map_eq_map_iff`);
  - `t⁻¹xt ∈ P ⇔ x stabilises tW₀` (`conj_mem_stab_iff`), and then `χ(ρ(t⁻¹xt)) = Φ(tW₀)(x|_{tW₀})` by Φ's conjugation invariance;
  - summing over fibres (`sum_fibres`, each fibre has `|P|` elements) cancels `|P|⁻¹` and leaves exactly the sum over stable W.

Remaining dep (exact): `GlobalTheory.T.virtualCharacters_mul_comap_conj_ind_linear` (impl. `GlobalTheory.BI.virt_mul_comap_conj_ind_linear`).

## 3. `GlobalTheory.T.gelfandGraevCharacterGLn_norm_and_reciprocity`

```lean
∀ (g : ℕ) [Fact g.Prime] (ψ : AddChar (ZMod g) ℂ), ψ ≠ 1 → ∀ n : ℕ, 0 < n →
  wh ψ (gg ψ n) = (g : ℂ) ^ n - (g : ℂ) ^ (n - 1) ∧ ∀ χ : Gn g n → ℂ, IsClass χ → ip χ (gg ψ n) = wh ψ χ
```

Proof.
* *Reciprocity* (`ip_gg`, no use of `ψ ≠ 1` or `n > 0`): `wh ψ χ = |U|⁻¹ Σ_u [u ∈ U] ψ(sd u)⁻¹ χ(u)` (`wh_formula`, unfolding
  `eU`). `gg(x) = |U|⁻¹ Σ_y F(y⁻¹xy)` with `F(z) = [z ∈ U] ψ(sd z)`. Then `|G|·ip(χ, gg) = |U|⁻¹ Σ_y Σ_x χ(x) F(y⁻¹x⁻¹y)`; the
  substitution `x ↦ y⁻¹xy` and class-invariance of χ make each inner sum `Σ_u χ(u)F(u⁻¹)`, independent of y, giving `|G|` copies.
  Finally `F(u⁻¹) = [u∈U] ψ(sd u)⁻¹` (`gg_term_inv`): U is closed under inverse (`isUniUp_inv`) and `sd` is additive on U
  (`sd_mul`, `sd_one`), so `sd(u⁻¹) = −sd(u)` and `ψ(−s) = ψ(s)⁻¹`.
* *Norm* (`wh_gg`, uses `ψ ≠ 1`, `n > 0`): `sum_wh_gg` gives `Σ_{j ≤ k} wh(gg_j) = g^k` for every k; subtract the instances
  `k = n` and `k = n − 1` (valid since `n − 1 + 1 = n`).

`isUniUp_inv`, `sd_mul`, `sd_one` (and helpers `isUniUp_one`, `diag_mul_of_tri`, `isUniUp_mul`, `sd`, `entN_mul_super`) are
copied with their upstream proofs (elementary unitriangular-matrix algebra), so they are discharged, not assumed.
Remaining dep (exact): `GlobalTheory.GLm.GGSum.sum_wh_gg` (Proofs/FlagMeasures/BlockDiagonalWithIdentityGLEqOneIff.lean), which
itself rests on `GlobalTheory.T.mirabolicClassFun_blockDiagonal_eq_sum_derivatives` and the Bernstein–Zelevinsky derivative /
Whittaker–Harish-Chandra statements imported by that file (not reconstructed here).

## 4. Shared mechanisms (once)

* **M4 — torus diagonalisation**: inner products against `rootSum ∘ charpoly` become sums over the N-th roots of unity,
  where character orthogonality counts Frobenius-orbit coincidences `k q^i ≡ l`. Used in §1, and it is what feeds RUN2's norm computation.
* **M5 — induction as a sum over a homogeneous space**: `Ind_P^G` of a pulled-back function = sum over the `G`-orbit `G/P` of
  fixed points (fibre count `|P|`). Used in §2; the same shape underlies Harish-Chandra induction in RUN2 §2.
* **M6 — twisted-sum reciprocity**: `ip(χ, Ind_U ψ) = wh ψ χ` by conjugation-averaging of a class function (§3); this is the
  Frobenius reciprocity instance used by RUN2 §1.
* **M3 (RUN2)** companion technique, now with the generators committed: `RUN3_generators_bundle.py` writes out `RUN2_mk_run2.py`, `RUN2_mk_rootsum.py`,
  `RUN2_rootsum_deps.lean`, `RUN3_mk_run3.py`, `RUN3_ipgl_deps.lean` byte-for-byte (bundled only because the commit tool limits file attachments).

## 5. Exact finite checks (`RUN3_green_exact_checks.py`; output in Appendix C)

a. `wh ψ (gg ψ n) = g^n − g^(n−1)` computed from the definitions for (n,p) ∈ {(1,2),(1,3),(2,2),(2,3),(2,5),(3,2),(3,3)}, and
   `Σ_{j≤3} wh(gg_j) = p^3` for p = 2, 3 (the `sum_wh_gg` instance).
b. Reciprocity `⟨1_C, gg⟩ = wh(1_C)` for every conjugacy class of GL₂(F_p), p = 2, 3, 5 (class indicators span class functions).
c. `parab_virt` core identity on GL₂(F_p), a = 1: `Σ_{stable lines W} λ(x|_W) = Ind_P^G(λ∘ρ)(x)` for all x and all characters λ of F_p^×, p = 2, 3, 5.
d. `ipGL_psi_rootSum` torus step: `Σ_{α^N=1} Σ_{i<n} ζ^{α(kq^i − l)} = N·#{i<n : kq^i ≡ l}` for all k, l mod N, (q,n) ∈ {(2,2),(3,2),(2,3),(4,2),(5,2)}.

## 6. Overlap check

Before starting, latest commits on `newtons-cathedral` were `751c1b1` (TopG/VWin bridge), `f96f7ff` (nilpotent divided powers),
`63d8f00` (character-box projection), `c7e3e2e` (native family 02), `c77487a` (galois_rows RUN2) — none touch these declarations.
Re-checked immediately before push: new head `f3eef65` (RH cancellation), plus `db2c1bc` (blueprint), `3ab4548` (Chow height),
`1cb49a3` (native family 03), `cc0abbc` (audit), `847cda2` (galois_rows RUN3) — none touch these declarations.

## 7. Next task

`GlobalTheory.GLm.GGSum.sum_wh_gg` (mirabolic/Bernstein–Zelevinsky route) and `GlobalTheory.T.invertibleEndInnerProduct_rootPowerSum_eq_torusSum`
(the torus formula, M4's analytic core), then `GlobalTheory.T.endomorphismMass_mobiusInverse_monic_eq`.

## Appendix A — Lean log (this run, verbatim excerpt of `lake build GreenCompanion.CuspGLRun3 GreenCompanion.ParabVirt GreenCompanion.IpglRootSum GreenCompanion.GGNorm`)

Committed companion modules: `companion/GreenCompanion/CuspGLRun3.lean` = concatenation of the generated `CuspGLDefs.lean`
(verbatim BI/CuspGL definition files), `ParabVirt.lean` and `IpglRootSum.lean` (one module only because the commit tool limits
attachments; the separate modules were also built, log below), and `companion/GreenCompanion/GGNorm.lean` (imports RUN2 `LabelDefs`).

```
⚠ [8707/8712] Replayed GreenCompanion.ParabVirt
info: GreenCompanion/ParabVirt.lean:307:0: 'GreenCompanion.ParabVirt.parab_virt' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/ParabVirt.lean:319:0: 'GreenCompanion.parabVirtPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
ℹ [8708/8712] Replayed GreenCompanion.IpglRootSum
info: GreenCompanion/IpglRootSum.lean:120:0: 'GreenCompanion.CuspGL.ipGL_psi_rootSum' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/IpglRootSum.lean:139:0: 'GreenCompanion.iprPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
ℹ [8709/8712] Replayed GreenCompanion.Exhaustion
info: GreenCompanion/Exhaustion.lean:263:0: 'GreenCompanion.greenRegularCharacters_of_parts' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/Exhaustion.lean:264:0: 'GreenCompanion.greenRegularCharacters_holds_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
⚠ [8711/8712] Replayed GreenCompanion.GGNorm
info: GreenCompanion/GGNorm.lean:195:0: 'GreenCompanion.GGNorm.gg_norm' depends on axioms: [propext, Classical.choice, Quot.sound]
⚠ [8712/8712] Built GreenCompanion.CuspGLRun3 (26s)
info: GreenCompanion/CuspGLRun3.lean:440:0: 'GreenCompanion.ParabVirt.parab_virt' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/CuspGLRun3.lean:452:0: 'GreenCompanion.parabVirtPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/CuspGLRun3.lean:572:0: 'GreenCompanion.CuspGL.ipGL_psi_rootSum' depends on axioms: [propext, Classical.choice, Quot.sound]
info: GreenCompanion/CuspGLRun3.lean:591:0: 'GreenCompanion.iprPart_of_deps' depends on axioms: [propext, Classical.choice, Quot.sound]
Build completed successfully (8712 jobs).
(remaining output: linter/deprecation warnings only)
$ grep -c sorry GreenCompanion/{CuspGLRun3,GGNorm}.lean  -> 0 0
```

Committed companion files are byte-identical to the built files; `RUN3_mk_run3.py` (inside `RUN3_generators_bundle.py`) regenerates them from the pinned upstream sources.

## Appendix B — upstream blob ledger (git hash-object vs. GitHub at the pin)

| path | blob @ pin | local |
|---|---|---|
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvertibleEndInnerProductRootPowerSumMobius.lean` | `3fa1ff31e5645e2138fdb2dab395d83be405636b` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/ParabolicInductionTrivialPreservesVirtualCharact.lean` | `0d5e00dab6e05d3fa13adf8c8e33b967542cfba0` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GelfandGraevCharacterGLnNormAndReciprocity.lean` | `547088bd480d3d01c008e657acdf9d5a52263dc8` | match (contents API) |
| `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GelfandGraevCharacterGLnNormAndReciprocityStatement.lean` | `c9bb914c65c29d61db8773e0334f46639a786f15` | match (contents API) |
| `src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsWhittakerDatumAndHalfLevels.lean` | `200a3d1824b10563b8c15acf023f0b62b196d673` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/BlockDiagonalWithIdentityGLEqOneIff.lean` | `4c22baad995d07ce23a55f49855f975ad2a2e444` | match (contents API) |
| `src/Development/AbelianVarietyTheory/Definitions/CommutativeAlgebra/AbByPOfComm.lean` | `6277b155093ae63bcb99150317e091bbc3ced33e` | match (tree) |
| `src/Development/AbelianVarietyTheory/Definitions/CommutativeAlgebra/InvariantSubspaceMobiusInverseRecEqOfFinrankLt.lean` | `b54d4f567816eb79c2aeab71426a7bb1285cd166` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/VirtualCharactersMulComapConjIndLinearStatement.lean` | `112c194fc8c6483e8bc8615aaaa30b504de14032` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/AdditiveEqPolynomialVonMangoldtConvolutionOneStatement.lean` | `5de41079385272b1cd1354f1bec62bc678cb74f1` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/EndomorphismMassMobiusInverseMonicEqStatement.lean` | `cec76f0b489b52c30e773fdde7c63df1215ddd39` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/FrobeniusTorusCharacterOrthogonalityStatement.lean` | `fb4c4708d9a6dad74101128fb73274fb10229f06` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/FrobeniusTorusMinpolyDegreeRootPowerSumStatement.lean` | `64eea5291fa23d703b7f49c6dfdc7b7d89acba78` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvertibleEndInnerProductRootPowerSumEqTorusSumStatement.lean` | `cc59ccf7586db967f3c3f0a10366032901fd844a` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/RootPowerSumCharacterAdditiveAndXSubOnePowStatement.lean` | `47fb30fcff1d198482619d608068ecb1d1360e85` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/IsPrimitiveEndClassFunctionInvariantSubspaceMobiStatement.lean` | `fd82a9d09fc1e2fc57df813c61125a9c1822cc71` | match (tree) |
| `src/Development/AbelianVarietyTheory/Proofs/CharacterTheory/InvariantSubspaceMobiusInverseCharpolyLinearEquiStatement.lean` | `5587eede8307cac3dc493a0dc000ebff1f1c8b34` | match (tree) |

## Appendix C — `python3 RUN3_green_exact_checks.py`

```
== gg_norm: wh psi (gg psi n) = g^n - g^(n-1), and sum_{j<=k} wh(gg_j) = g^k (sum_wh_gg), from the definitions
n=1 p=2: wh(gg) = 1; g^n-g^(n-1) = 1; equal: True
n=1 p=3: wh(gg) = 2; g^n-g^(n-1) = 2; equal: True
n=2 p=2: wh(gg) = 2; g^n-g^(n-1) = 2; equal: True
n=2 p=3: wh(gg) = 6; g^n-g^(n-1) = 6; equal: True
n=2 p=5: wh(gg) = 20; g^n-g^(n-1) = 20; equal: True
n=3 p=2: wh(gg) = 4; g^n-g^(n-1) = 4; equal: True
n=3 p=3: wh(gg) = 18; g^n-g^(n-1) = 18; equal: True
p=2: 1 + wh(gg_1)+wh(gg_2)+wh(gg_3) = 8; p^3 = 8; equal: True  (j=0 term = wh on GL_0 = 1)
p=3: 1 + wh(gg_1)+wh(gg_2)+wh(gg_3) = 27; p^3 = 27; equal: True  (j=0 term = wh on GL_0 = 1)
== ip_gg reciprocity on GL_2(F_p): <1_C, gg> = wh(1_C) for every conjugacy class C
p=2: 3 classes, mismatches = 0
p=3: 8 classes, mismatches = 0
p=5: 24 classes, mismatches = 0
== parab_virt core identity on GL_2(F_p), a=1: sum_{invariant lines W} lam(g|W) = Ind_P^G(lam o rho)(g)
p=2: 6 (g, lam) pairs, mismatches = 0
p=3: 96 (g, lam) pairs, mismatches = 0
p=5: 1920 (g, lam) pairs, mismatches = 0
== ipGL_psi_rootSum torus step: sum_alpha sum_{i<n} theta(alpha)^(k q^i) conj theta(alpha)^l = (q^n-1) #{i<n: k q^i = l}
q=2 n=2: 9 (k,l) pairs, mismatches = 0
q=3 n=2: 64 (k,l) pairs, mismatches = 0
q=2 n=3: 49 (k,l) pairs, mismatches = 0
q=4 n=2: 225 (k,l) pairs, mismatches = 0
q=5 n=2: 576 (k,l) pairs, mismatches = 0
```
