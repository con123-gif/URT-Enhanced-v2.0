# galois_rows RUN 4 — Chevalley's S-unit theorem and Hecke characters with prescribed local components

Lane: `grok_swarm/galois_rows` (Grok). Continues RUN 3 (`847cda2`, §7 RESUME HERE). Upstream: leanprover-community/riemann-hypothesis at pin `40e56bab026552e089d7afcfeff08d2defb9c005`.
Status: **human-readable re-derivation; upstream declarations NOT elaborated or kernel-checked here.** RH remains OPEN. URT was not used as a premise or as evidence. Companion trust classification: `RUN4_TRUST_TABLE.md` (this folder).

Overlap check (2026-11-24 GMT): branch head `1cb49a3` at start; no file under the swarm directory names `ChevalleySUnits`, `exists_hchar_prescribed`, Chevalley, Artin or a trust table for these inputs. The literature lane's `specialists/literature_provenance/RUN1_EXTERNAL_ASSUMPTION_LEDGER.md` covers the `UpperTheory.LiteratureTheorems` adapter (a different file); it is cited, not repeated. Re-checked before push at head `60db7df`: no new file in `grok_swarm/galois_rows/` and none naming `ChevalleySUnits`/`exists_hchar_prescribed`; native_family_existence run 4's T8 wrapper table overlaps the trust classification and agrees (see `RUN4_TRUST_TABLE.md`, last section).

## 0. Provenance (blob ids at the pin; re-checked by `RUN4_replay_checks.py`)

| file (under `src/Development/AbelianVarietyTheory/Proofs/`) | blob | declarations |
|---|---|---|
| InertiaEigenvalues/ExistsKummerField.lean | 9b99d747 | `GlobalTheory.ChevalleySUnits.{exists_kummer_field (14), exists_integral_mul (76), core (116), exists_places_of_fg (219), exists_places (252)}` |
| InertiaEigenvalues/ExistsPowDescentCyclotomic.lean | c413cc4a | `CyclotomicKummerDescent.{geom_sum_valuation (8), exists_aut (38), descent (70)}`, `GlobalTheory.exists_pow_descent_cyclotomic (141)` |
| InertiaEigenvalues/IsFrobFixesRootOfOneModPlace.lean | ab8b7973 | `GlobalTheory.frob_fixes_root_of_one_mod (7)` |
| InertiaEigenvalues/ChebotarevDegreeOne.lean | 2c257044 | `GlobalTheory.Published.chebotarevDegreeOne' (17)`, `Published.cheb_holds (66)` |
| AdelicLatticeProofs/SUnitsNumberFieldFg.lean | 6fee3811 | `GlobalTheory.QNorm.sUnits_fg (35)` |
| InertiaEigenvalues/ExistsHcharPrescribedTrivial.lean | 649f9a3d | `GlobalTheory.DelEps.Twist.exists_hchar_prescribed (82)` |
| IwasawaDecomposition/ExistsUnitaryCharOfOpenSubgroupAndHom.lean | 6331c58b | `GlobalTheory.exists_unitary_char_of_open_subgroup_and_hom (32)` |

## 1. Shared mechanism, derived once — Lemma K (cyclotomic Kummer descent, `exists_pow_descent_cyclotomic`)

**Statement.** For a number field E, a prime l and r ≥ 0 there is M = l^{r+s} > 0 (l^r | M) such that: for every field Ω ⊇ E and primitive M-th root ζ ∈ Ω, if u ∈ E has an M-th root w lying in E(ζ), then u is an l^r-th power in E.
**Proof.** Let d = [E:ℚ], t = (1+l²)^{d!} = k+1, and write k = l^s·e with l ∤ e.
 (a) (`exists_aut`) The image H of Gal(E(ζ)/E) in (ℤ/M)ˣ has index ≤ d (since φ(M) = deg_ℚ ζ ≤ d·[E(ζ):E] = d·|H|), so the index divides d! and the d!-th power of every unit lies in H. As 1+l² is a unit mod M, some τ has τζ = ζ^t. (Lean shape: `dvd_fact`.)
 (b) (`geom_sum_valuation`) Since l² | t−1, lifting the exponent gives v_l(Σ_{i<l^r} t^i) = r exactly — for l = 2 via `Int.two_pow_sub_pow'`, which needs 4 | t−1, hence the choice 1+l² (this is how the l = 2 exception is avoided).
 (c) (`descent`) Put n = l^r; M | (Σ_{i<n} t^i)·k because l^r | Σ and l^s | k. With τw = αw (α^M = 1), iterating gives τ^n w = α^{Σ t^i} w and τ^n ζ = ζ^{t^n} = ζ^{(Σ t^i)k+1} = ζ (identity `hgeom`, Lean shape `geom_identity`), so τ^n = 1 and α^{Σ t^i} = 1. Gal(E(ζ)/E) is abelian, so each σ satisfies σα = a_σ^k α where σw = a_σ w; hence w^k/α is Galois-fixed: w^k = vα with v ∈ E.
 (d) ord(α) divides both M (an l-power) and Σ t^i (l-adic valuation exactly r), so α^{l^r} = 1, and v^{l^r} = w^{k l^r} = u^{k l^r / M} = u^e. Bezout (e coprime to l^r) gives u = (v^a u^b)^{l^r}. (u = 0 is trivial.) ∎

## 2. `GlobalTheory.ChevalleySUnits.exists_places`

**Exact statement.** ∀ E [NumberField E] (S : Finset of finite places) (m > 0), ∃ T finite, Disjoint S T ∧ ∀ x ∈ Eˣ, (∀ v ∉ S, |x|_v = 1) → (∀ t ∈ T, |x − 1|_t < 1) → ∃ y ∈ E, y^m = x.
**Proof.** The S-units form a finitely generated group Γ (`QNorm.sUnits_fg`), so it suffices to prove `exists_places_of_fg` for any finitely generated Γ ≤ Eˣ.
 *Reduction to prime powers:* induction on m by `Nat.recOnPosPrimePosCoprime`; for coprime a, b take T = T_a ∪ T_b, and from y_a^a = x = y_b^b get (y_a^{B} y_b^{A})^{ab} = x with Aa + Bb = 1.
 *Prime power m = l^r (`core`):* take M from Lemma K, ζ a primitive M-th root, K = E(ζ), and the Kummer field L = K(Γ^{1/M}) — the splitting field of ∏_{g∈gens}(X^M − g), finite Galois over K and containing every M-th root of every element of Γ (`exists_kummer_field`, by closure induction over the generators). Let N = M·∏_{s∈S} a_s with 0 ≠ a_s ∈ s. For each τ ∈ Gal(L/K), Chebotarev in degree one (`Published.chebotarevDegreeOne'`) gives a degree-one place v_τ of K not dividing N and a Frobenius σ_τ at v_τ restricting to τ. Put T = {v_τ ∩ E}; T ∩ S = ∅ because v_τ ∤ ∏ a_s.
 Now let x ∈ Γ with x ≡ 1 at every t ∈ T, and w^M = x. For each τ: choose d ∈ Eˣ with z = d^M x integral and z ≡ 1 mod t (`exists_integral_mul`); then (dw)^M = z ≡ 1 mod v_τ with v_τ ∤ M, so Frobenius fixes dw (`frob_fixes_root_of_one_mod`, used by statement only: for v ∤ M, x ≡ 1 mod v and w^M = x, a Frobenius at v fixes w — its proof was not re-derived in this run); σ_τ fixes d ∈ E, hence fixes w, i.e. τ fixes w. (Lean shape of this cover: `frob_cover`.) So w ∈ L^{Gal(L/K)} = K = E(ζ), and Lemma K gives y ∈ E with y^{l^r} = x. ∎
Every hypothesis is used: m > 0 (prime-power induction), S (only to make T disjoint from S and to restrict to S-units), finiteness of S (N ≠ 0).
Note: `Published.ChevalleyUnits` (GaloisCohomology₂/ChevalleyUnits.lean, the classical unit-congruence form) is a separate Prop, proved natively by `Published.chevalleyUnits'` (Proofs/InertiaEigenvalues/ChevalleyUnits.lean) by the same Kummer+Chebotarev+descent pattern; `exists_places` does not use it.

## 3. `GlobalTheory.DelEps.Twist.exists_hchar_prescribed`

**Exact statement.** ∀ k [NumberField k] (S finite set of finite places) (θ_w : k_wˣ →* ℂˣ) with θ_w smooth and of finite order for w ∈ S, ∃ Hecke character η of finite order, trivial at every infinite place, with η_w = θ_w for all w ∈ S.
**Proof.** Let m = ∏_{w∈S} ord θ_w, so θ_w^m = 1. Apply §2 to (S, m): T disjoint from S. Let U ⊆ 𝔸_kˣ be the open subgroup of idèles that are units at every finite place, ≡ 1 at T, and lie in ker θ_w at each w ∈ S. Consider β : ∏_{w∈S} k_wˣ → 𝔸_kˣ (local idèles) and the character γ = ∏ θ_w on it; we need χ on 𝔸_kˣ, continuous and unitary, with χ = 1 on U, χ∘β = γ and χ = 1 on kˣ. `exists_unitary_char_of_open_subgroup_and_hom` (with A = kˣ × ∏_{w∈S} k_wˣ, α = diag·β, a = 1·γ, ψ = 1) produces a continuous unitary χ equal to 1 on U with χ∘α = a, provided a(y) = 1 whenever α(y) ∈ U; so it suffices: if x·β(y) ∈ U with x ∈ kˣ, then γ(y) = 1. Off S the S-component of β is 1, so x is a unit outside S and ≡ 1 at T; by §2, x = z^m. At w ∈ S, x_w·y_w ∈ ker θ_w, so θ_w(y_w) = θ_w(x)^{−1} = θ_w(z)^{−m} = 1. Unitarity of γ: |γ|^m = 1. The resulting η is trivial at infinity (U contains the infinite idèles), hence of finite order (`Mem.FinOrder.finite_order_of_inf_eq_one`), and η_w = θ_w on S by evaluating on single local idèles. ∎
Remark: no Grunwald–Wang obstruction arises because only local components are prescribed, not the global order; the 2-adic subtlety is absorbed in Lemma K (b).

## 4. Consequence for RUN 3 Proposition P

RUN 3 §1 Step 2 used `exists_hchar_prescribed` with S = {v} ∪ T (θ_v = local character from χ, θ_u = 1 on T). With §§1–3 the Hecke-character construction in Proposition P is now reconstructed down to: Chebotarev in degree one, S-unit finite generation, the idelic character-extension lemma, and global/local Artin reciprocity. Their status is in `RUN4_TRUST_TABLE.md`.

## 5. Remaining dependencies (exact names; not reconstructed in prose here)

`GlobalTheory.T.exists_prime_dvd_sub_one_cyclotomic_irreducible_over`, `GlobalTheory.T.exists_cyclotomic_crossing_field_deciding_frobenius`, `GlobalTheory.T.exists_prime_absNorm_eq_of_irreducible_cyclotomic'`, `GlobalTheory.T.isFrob_restrictScalars_of_prime_absNorm'`, `GlobalTheory.T.finite_places_inertia_not_fixing_finiteExtension` (inputs of `chebotarevDegreeOne'`); `GlobalTheory.QNorm.sUnits_fg`; `GlobalTheory.exists_unitary_char_of_open_subgroup_and_hom`; `GlobalTheory.Mem.FinOrder.finite_order_of_inf_eq_one`; `CompanionTheory.FamInh.art0` (global Artin map).

## 6. Formal companion and evidence (actually run, 2026-11-24 GMT)

- `RUN4_ChevalleyHcharSchema.lean` (namespace `GrokChevalleyHchar`), core Lean 4.33.1, no Mathlib: `dvd_fact` (propext, Quot.sound), `geom_identity` (propext, Quot.sound), `frob_cover` (no axioms); exit 0, no sorryAx. Abstract shapes only. First attempt failed (`rw` rewrote both occurrences in `geom_identity`); fixed by `generalize` + `omega`.
- `RUN4_replay_checks.py /workspace/rh_up4` (full checkout at the pin): worktree-at-PIN check, 31 blob-id checks, 80 verbatim text checks, plus a lexical scan of all 175,187 `src/**/*.lean` files (0 `axiom` declarations, 0 `sorry`, 0 `admit`, 0 `native_decide`, 0 `ofReduceBool`, 0 `implemented_by`/`extern`, 0 `unsafe`, 0 `skipKernelTC`, 0 `axiomDecl`/`AxiomVal`; the only `addDecl` sites add `defnDecl`/`thmDecl`): `checks ok=122 bad=0`, exit 0. Confirms transcription and absence of these constructs in upstream source text; it is not elaboration, and dependencies outside `src/` (Mathlib, Lean core) were not scanned.
- Raw outputs: `RUN4_VALIDATION_LOG.txt`.

## 7. RESUME HERE (galois_rows RUN 5)

Reconstruct `chebotarevDegreeOne'` (Deuring-type reduction to a cyclotomic crossing field; inputs in §5) and `CompanionTheory.FamInh.art0` / `isGlobalArtin_inv` (global Artin map), then re-run the trust table's "native body" rows at depth 2. Alternative if claimed: `UpperTheory.Gal.InertialTypesAlt.SuppBC`.
