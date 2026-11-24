# covolume_premises RUN2 — unpacking `resK`; faithfulness of the Lean resolution / blow-up / SNC notions

Pin: leanprover-community/riemann-hypothesis `40e56bab026552e089d7afcfeff08d2defb9c005`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`.
Method: source reading of the pinned checkout. Every file:line below is replayed by `../galois_rows/RUN6_replay_checks.py` (log: `../galois_rows/RUN6_VALIDATION_LOG.txt`).
Nothing was compiled against Mathlib in this run. The repo-wide scan in RUN4 found no `axiom`/`sorry`; in this run `rg` found 0 hits of `sorry|axiom|admit` in `Development/ResolutionOfSingularities`, `Development/WeilBound/CoreStatements/ResolutionCharZero` and `FinalTheorems.lean`.
Literature references are cited from memory and were **not re-opened this run**; the theorem numbers should be checked before anyone relies on them. No gate is marked closed.

## 1. How `resK` unpacks (all paths are under `src/`)

| step | Lean | file:line |
|---|---|---|
| R0 | `resK : ResKStatement := resK_of_weak resW princW` | Development/WeilBound/CoreStatements/ResolutionCharZero/PlugResK.lean:7–8 |
| R1 | `resW := resW_of_functorialResolution FunctorialResolution.functorialResolutionCharZero.{0}` | PlugResW.lean (same dir) |
| R2 | `princW := princW_of_functorialPrincipalization FunctorialResolution.functorialPrincipalizationCharZero.{0}` | PlugPrincW.lean |
| R3 | `resW_of_functorialResolution`: `obtain ⟨R, hR, -, -⟩ := H`. **Both functoriality clauses are discarded.** Only `IsResolutionRuleCharZero R` is used, and from it only smoothness, iso over the smooth locus, and the dense preimage. | FromRes.lean:44–46 |
| R4 | `princW_of_functorialPrincipalization`: again `⟨R, hR, -, -⟩`, so the functoriality is discarded. It applies the principalization rule to `I = vanishingIdeal (X∖U)` with empty boundary `[]`. | FromRes.lean:65–67 |
| R5 | `resK_of_weak`, in five moves: (a) ResW resolves X to a projective smooth X₁ that is iso over U; (b) PrincW, applied on X₁ to the reduced ideal of X₁∖s⁻¹U, gives X₂ with `Snc` of that preimage, iso over s⁻¹U; (c) compose; (d) `coords_statement` turns `Snc` into `HasSncCoords`; (e) `exists_closed_in_prod` embeds the projective X₂ in ℙᴹ×ℙʳ. | WeakPair.lean:68ff, :87, :89 |
| R6 | `functorialResolutionCharZero` comes from `EmbeddedResolution.strongResolutionOfSingularitiesCharZero` (HironakaTheorem.lean:69, built from the principalization algorithm). Native in the RUN4 sense. | HasSimpleNormalCrossingsOfInStrictNormalCrossing.lean:15–16 |

So `resK` depends on the *non-functorial content* of two statements: resolution, and principalization of a reduced ideal. Whether the functoriality clauses are faithful **does not affect what `resK` asserts**. Those clauses are still compared in §3 because `FunctorialResolutionCharZero` is the named target.

## 2. What `ResKStatement` says (BlowupProjStatement.lean:66)

Take K of characteristic 0 and X ⊂ ℙᴹ_K closed (`IsResInput`, :45). Suppose X is reduced, U ⊆ X is a dense open, and U is smooth of relative dimension D. Then there exist r, X′, a closed immersion j : X′ ↪ ℙᴹ ×_K ℙʳ, and f : X′ → X with f≫i = j≫pr₁, such that `IsResWithCoords` (:52) holds:
- X′ is smooth of relative dimension D;
- f is an iso over U;
- f⁻¹U is dense;
- `HasSncCoords (f⁻¹(X∖U))` (:24): there is a finite affine cover {V_j} of X′ with D functions z on each V_j whose differentials dz form a Γ(V_j)-basis of Ω_{Γ(V_j)/K} (`IsCoords`, :19), and a k ≤ D, such that V_j ∩ f⁻¹(X∖U) = {y ∈ V_j : z_i(y) = 0 for some i < k}.

In standard language, this is a **projective log resolution of the pair (X, X∖U)**, stated with a strict-normal-crossings boundary in étale coordinates.

Standard counterpart: Hironaka's theorem; e.g. Kollár, *Lectures on Resolution of Singularities* (2007), ch. 3, where a log resolution follows from principalization of the ideal of X∖U on a resolution. The Lean proof (R5) takes exactly this route.

Discrepancies checked:
- **U is an arbitrary dense smooth open, not the whole smooth locus.** f is only required to be an iso over U. This is the usual log-resolution convention, so there is no discrepancy.
- **The boundary is a set-theoretic union of coordinate hyperplanes.** No multiplicities are tracked. That is the standard meaning of "f⁻¹(Z) is an SNC divisor" when the divisor is taken reduced, so there is no discrepancy. k = 0 on a chart just means the boundary misses that chart.
- **Pure dimension D.** This follows from U being dense, so it is not an extra hypothesis.

## 3. Definition-by-definition comparison

| notion | Lean (exact) | standard | verdict |
|---|---|---|---|
| ideal pull-back `I.comap f` | Mathlib `IdealSheaf/Functorial.lean:39`: `(pullback.fst f I.subschemeι).ker`, i.e. the ideal of the scheme-theoretic preimage X ×_Y V(I) (blob `c2ba4d50739f`) | inverse-image ideal sheaf I·O_X = im(f*I → O_X), which is the ideal of f⁻¹(V(I)) | **matches** |
| effective Cartier | `EffCartier` (FinalTheorems.lean:6) and `IsEffectiveCartier` (Statements.lean:9): every x has an affine U ∋ x with I(U) = (f), f a non-zero-divisor of Γ(U) | locally generated by one non-zero-divisor (Stacks, "effective Cartier divisor") | **matches**. Locality is witnessed on one affine nbhd, which is equivalent for quasi-coherent ideals. |
| blow-up | `Blowup π I` (FinalTheorems.lean:10) and `IsBlowup` (Statements.lean:13): I·O_{X′} is effective Cartier, **and** every g : W → X with I·O_W effective Cartier factors uniquely through π | universal property of blowing up (Hartshorne II.7.14; Stacks, "universal property of blowing up") | **matches**. The definition is a characterisation rather than a construction, so X′ is determined up to unique iso. W ranges over `Scheme.{u}` with u = 0 in use; this is harmless. |
| regular system of parameters | `Rsp`/`IsRegularSystemOfParameters`: span(x) = 𝔪 and n = Krull dim | standard | **matches** |
| SNC (ideal) | `Snc D` (FinalTheorems.lean:17) and `IsStrictNormalCrossings` (Statements.lean:20,26): for **every** y, O_{Y,y} is regular, and there are an affine U ∋ y and f : Fin n → Γ(U) whose germs are an rsp at y, plus J ⊆ Fin n, with D(U) = (∏_{i∈J} f_i) | strict normal crossings divisor (Stacks "strict normal crossings"; Kollár 3.x): regular ambient, and locally D = (x₁⋯x_r) for part of an rsp | **matches**. The product is squarefree because the indices are distinct. Off supp D, J must be ∅. Equality on an affine nbhd rather than only in the stalk is the usual spreading-out. |
| SNC (coordinates) | `HasSncCoords` (§2) | étale coordinates z : V → 𝔸ᴰ with boundary = ∪_{i<k}{z_i=0} | **matches** (for smooth V, a dz-basis gives étale coordinates) |
| SNC (principalization) | `HasSimpleNormalCrossingsAt` (Statements.lean:175): étale c : U → 𝔸ᵐ over k, an injective assignment a of boundary components to coordinates, each E_i equal to a pulled-back coordinate hyperplane or trivial on U; each E_i a smooth divisor | simple normal crossings with smooth components | **matches** |
| blow-up sequence (premise 1) | `IsBlowupSeq` (ConclusionOfSmooth.lean:17): an inductive composite of `Blowup` steps with **arbitrary** centres J | sequence of blow-ups, usually with smooth centres inside the non-smooth locus | **weaker** (no condition on the centres) |
| blow-up sequence (rule) | `BlowupSequence` (Statements.lean:35): length, tower ℕᵒᵖ ⥤ Scheme, centres, each step `IsBlowup` | same | matches as data |
| `ResolutionCharZero` (premise 1) | ConclusionOfSmooth.lean:53: k of char 0, X loft, qc, **separated**, reduced ⇒ ∃ s with `IsBlowupSeq s`, X′ smooth, s iso over the smooth locus, `Snc` of the reduced preimage of the non-smooth locus | strong resolution (Kollár Thm 3.36 as recalled): iso over the smooth locus, reduced preimage of Sing is SNC, smooth centres | **weaker** than the literature: separatedness is assumed, and smoothness of the centres is not required. Implied by the literature. |
| `IsResolutionRuleCharZero` | Statements.lean:126: top smooth over k, `topMap` proper, iso over the smooth locus, preimage of the smooth locus dense, `CentersOver` the non-smooth locus, `IsStrictNormalCrossings (reducedPreimage topMap nonSmoothLocus)`; for X loft, qc, reduced, **not** necessarily separated | Kollár Thm 3.36 / Włodarczyk / Temkin (char 0) | **weaker or equal**: the centres must lie over Sing but need not be smooth. Non-separated X is covered in the literature by gluing via open-immersion functoriality, and Temkin treats qe schemes, so dropping separatedness is not a strengthening beyond the literature. |
| smooth functoriality | `IsSmoothFunctorialRule` (:135): for φ : X′ → X smooth of relative dimension r over k, `IsPullbackSequence φ (R X′) (R X)`. This means the sequence of X′ equals the pulled-back sequence of X after **deleting the steps whose pulled-back centre has empty support**, with centres equal to pulled-back centres (:91–104). | "commutes with smooth morphisms", empty blow-ups omitted (Kollár 3.36) | **matches**. Not used by resK (R3). |
| field-extension functoriality | `IsFieldExtensionFunctorialRule` (:143): for any K ⊇ k of char 0 with X_K reduced, the rule on X_K is the pull-back sequence | "commutes with field extensions" (Kollár 3.36); regular-morphism functoriality (Temkin) | **matches**. The hypothesis `[IsReduced X_K]` is automatic in char 0 (redundant, harmless). Not used by resK. |
| principalization | `IsPrincipalizingSequence` (:208): smooth centres; centres SNC with the boundary (`HasSimpleNormalCrossingsWith`); controlled transform J·I_{i+1} = I_i·O with I_i ≤ J_i; I_len = ⊤; I·O_top = `exceptionalProduct`; boundaries SNC at every stage | strong principalization (Kollár Thm 3.26 / Włodarczyk) | **matches the strong form** (read; not re-derived term by term in this run) |

## 4. Answer to the faithfulness question

- **Blow-up:** standard (universal property). **SNC:** standard strict normal crossings in all three encodings.
- **No Lean definition in the resK chain is stronger than the standard theorem.** Wherever the Lean statements differ from the literature, they are *weaker*: centres are unconstrained or only lie over Sing, and premise 1 assumes separatedness. So the literature theorems imply the Lean statements, which is the safe direction for a premise.
- **Flag, scope only:** "functorial" in `FunctorialResolutionCharZero` is faithful, but the `resK` route discards it (R3, R4). Any claim that the repo *uses* functorial resolution in the covolume chain would be inaccurate. It uses resolution and principalization of a reduced ideal.
- **Open items, honestly stated:**
  - The theorem numbers (Kollár 3.26, 3.36; Hartshorne II.7.14) are from memory and were not re-opened.
  - The principalization row was read but not re-derived clause by clause.
  - Nothing was compiled with Mathlib in this run.
