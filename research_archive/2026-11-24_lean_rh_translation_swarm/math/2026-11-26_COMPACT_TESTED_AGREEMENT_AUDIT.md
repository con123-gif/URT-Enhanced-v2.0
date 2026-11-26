# Compact C audit: the tested-form cut is label-specific

26 November 2026. **HUMAN SOURCE-MATCHED CORRECTION; prepared native probe, not locally kernel-checked.** This note audits one root-reachable step in `denominatorLe_rowBudget`, the Theorem C denominator supplier used through `exists_isFitFamily` and the compact long-forms bound. It corrects the invariant subspace described in the integration checkpoint `2026-11-26_COMPACT_TESTED_FORM_DENOMINATOR.md`; it does not alter the pinned Lean source or claim a new proof of RH.

Source: Levent Alpöge and Luke Sernau, with the repository's stated Anthropic/Claude collaborators, `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, `grh-compact`, Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`. Cathedral parent after the final pre-commit rebase: `8f0558ca27af3d70ac4e60f040013539e4e7e442`.

## Exact source ledger

| Role | Pinned path | Lines | Git blob |
|---|---|---:|---|
| Caller and audited proof | `New/Selmer/DenominatorBound.lean` | 47–166, especially 133–162 | `5889d96fe1a6ad7926e0df09a7d183232f91c534` |
| Definition of tested form | `New/Selmer/FitTwists.lean` | 37–40 | `c62935a73ccbef6c7fc42f45c83f111e811a5825` |
| Invariant-space reduction | `New/Selmer/HeckeStableSubspaces.lean` | 112–126 | `be64542e80d1a93f47f65abae6adba9823e5a76e` |
| Root string | `New/Selmer/HeckeString.lean` | 44–62 | `e687e4e029036374decd6f30a289c0f709212cc2` |
| Integral diagonal operator | `New/Patching/OnePrimeTie.lean` | 185–304 | `d161966411413f049b0ae5a6baee8fdd4bcc0a26` |
| Operator-to-determinant consumer | `New/Selmer/DeterminantBound.lean` | 108–127 | `686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df` |

No old-source theorem, claimed RH theorem, or URT premise is imported into this audit.

## 1. Correction: the source uses a smaller cut

Fix the label `c` selected at lines 62–70 and write

\[
 P=P_c=\operatorname{tupleProj}(O,c),\qquad
 A_c=\operatorname{im}P\cap Z^\perp,\qquad
 K_w=\ker H_w(\operatorname{testValue}(w)).
\]

The anonymous subspace in lines 147–152 is inferred from its uses. The exact source cut is

\[
 \boxed{W_c=A_c\cap(A_c\cap K_w)^\perp.}\tag{C-cut}
\]

It is **not** the stronger cut

\[
 \operatorname{im}P\cap Z^\perp\cap(F\cap K_w)^\perp,
 \qquad F=\operatorname{im}(\operatorname{groupAlgAction}E),
\]

stated in the integration checkpoint. This identification is forced by two native terms:

1. In the isotypic callback, `r.2 v ⟨r.1, ?_⟩` pairs `v` with itself after `r.1 : v ∈ A_c` and the missing term establishes `v ∈ K_w`. Thus `r.2` is orthogonality to `A_c ∩ K_w`.
2. In the membership proof, an arbitrary `a ∈ A_c ∩ K_w` is unpacked as `a.1.1 : a ∈ im P`, `a.1.2 : a ∈ Z⊥`, and `a.2 : a ∈ K_w`. The term `⟨⟨le a.1.1, a.2⟩, a.1.2⟩` converts exactly these into
   \(a\in F\cap K_w\cap Z^\perp\), the subspace occurring in `AuxPair.IsTested`.

The fixed-label inclusion `im P ⊆ F` is available from `IsApt`. The global inclusion `Z ⊆ F` for this fixed `c` is not: `hw` spans `Z` by lifts which may carry different labels. Therefore the earlier prose's decomposition through `F ∩ K_w`, and its assertion that projection to `Z` preserves that kernel, must not be used.

## 2. Exact membership and agreement argument

Let

\[
 x_b=\operatorname{pr}_Z(\Xi'_b),\qquad
 u=P(\Xi'_b-x_b).
\]

Then `u ∈ W_c` by the following three source-matched steps.

1. **Range.** `u ∈ im P` by definition.
2. **Orthogonality to the cut.** The tuple projector is symmetric. Its action on every generator of `Z` is either zero or the identity (the dichotomy `z` at lines 64–69), so `PZ ⊆ Z`; symmetry then gives `P(Z⊥) ⊆ Z⊥`. Since `Xi'_b-x_b ∈ Z⊥`, we have `u ∈ Z⊥`, hence `u ∈ A_c`.
3. **Orthogonality to `A_c ∩ K_w`.** Take `a ∈ A_c ∩ K_w`. Symmetry and `Pa=a` give
   \[
   \langle u,a\rangle
   =\langle P(\Xi'_b-x_b),a\rangle
   =\langle \Xi'_b-x_b,Pa\rangle
   =\langle \Xi'_b-x_b,a\rangle.
   \]
   From `a ∈ im P ⊆ F`, `a ∈ K_w`, and `a ∈ Z⊥`, the tested-form hypothesis gives `⟨Xi'_b,a⟩=0`. Also `x_b ∈ Z` gives `⟨x_b,a⟩=0`. Thus `⟨u,a⟩=0`. This is precisely lines 153–156; it needs neither a decomposition of `Pa` nor commutation of `pr_Z` with the Hecke operator.

The source proves that every factor of `(C-cut)` is stable under the off-level Hecke polynomials, using `IsApt.range_tupleProj_mem_invtSubmodule`, `hT`, `orthogonal_mem_invtSubmodule_hecke`, and commutation of the Hecke polynomials. Hence `le_of_isotypic_mem` reduces `W_c ⊆ ker E_t` to its nonzero isotypic vectors.

Let `v ∈ W_c` have nonzero smooth form in an isotypic system `y`, and suppose `E_t v ≠ 0`. Because `v ∈ im P`, the diagonal-action formula makes `t(y) ≠ 0`. If some Galois element failed to have `1` as a root of the characteristic polynomial of the normalised representation of `y`, then `y` would lie in the complement of the set defined at line 83. The annihilator `hz'` and the universal vanishing hypothesis `k` would give `t(y)=0`, a contradiction. Therefore every such characteristic polynomial has root `1`.

At the same split place `w`, `isRoot_hecke_string` plus the local Hecke-polynomial description then gives `v ∈ K_w` (lines 157–162). Now `v ∈ A_c`, `v ∈ K_w`, and `v ∈ (A_c ∩ K_w)⊥`; therefore

\[
 \boxed{\langle v,v\rangle=0,}
\]

contradicting the nonzero smooth form. Thus `W_c ⊆ ker E_t`, so `E_tu=0`. With `G_t=E_tP`, exact linearity before any norm yields the required agreement

\[
 \boxed{G_t\Xi'_b=G_t\operatorname{pr}_Z\Xi'_b.}\tag{agreement}
\]

This is the conclusion consumed by the integral-diagonal theorem. It is label-specific but fully sufficient.

## 3. Why the stronger cut does not follow from the stated premises

A two-dimensional rational diagnostic isolates the missing implication. Take the standard inner product, `P=I`, `Z=span(e1)`, `F=Q^2`, and

\[
 H=\begin{pmatrix}1&-1\\0&0\end{pmatrix},\qquad
 K=\ker H=\operatorname{span}(e_1+e_2).
\]

Then `P` is symmetric, preserves `Z`, commutes with `H`, `H` preserves `Z`, and `im P ⊆ F`. Set `Xi'=e2`; its projection to `Z` is zero and `u=e2`. Since
\(F\cap K\cap Z^\perp=0\), the tested orthogonality condition is vacuous, but

\[
 \langle u,e_1+e_2\rangle=1.
\]

Thus `u ⊥ (F ∩ K)` does not follow. In contrast, `A_c=Z⊥=span(e2)` and `A_c ∩ K=0`, exactly matching the sufficient native cut. This finite example is a logical negative control, not a model of the automorphic objects.

## 4. Exact scalar substitution at the determinant consumer

In the third callback of `norm_gram_det_le_of_operators` (lines 136–166), the binders have the exact meanings

\[
 w\in Z,\qquad
 e:\ j(w)=G_s(x_b),\qquad x_b=\operatorname{pr}_Z(\Xi'_b),
\]

where

\[
 j=\operatorname{toSmoothForm},\quad
 G_s=\operatorname{diagOp}(s)\circ j\circ P,
\quad y=j(Px_b),\quad l=j(P\Xi'_b).
\]

The base-level map supplies `H l` integral for `H=D.chosenGroupOrder`. The support and `(agreement)` hypotheses feed `BaseLevel.exists_diagOp_mem_ellIntegralForms`, whose conclusion at line 201 gives

\[
 H^2\operatorname{diagOp}(s)y\in\operatorname{ellIntegralForms}.
\]

But `e` is definitionally

\[
 j(w)=G_s(x_b)=\operatorname{diagOp}(s)y.
\]

Therefore line 139's literal `e ▸ h.2 ...` transports membership to

\[
 \boxed{H^2j(w)\in\operatorname{ellIntegralForms}.}\tag{integrality}
\]

No scalar is cancelled, `y` is not identified with `j(w)`, and no arbitrary projected form is declared integral. The final norm estimate pays the separate third factor `H` in the pairing, giving the caller's `H^3` bound. This confirms the corrected scalar substitution in integration commit `4cc2b4d7`.

## Verification boundary and executed checks

- Confirmed the six pinned Git blobs above and source pin `72fead102...`.
- Ran five literal source-anchor assertions for the invariant cut, self-pairing contradiction, tested-subspace tuple, and `e ▸ h.2`; all passed.
- Ran the exact rational `2×2` negative control above. All eight structural assertions passed and `dot(u,e1+e2)=1`.
- `command -v lean`, `lake`, and `elan` returned no executable. The accompanying probe is therefore **PREPARED, NOT A LEAN PASS**. No CI job was launched, and no old compact CI result is attributed to this file.
- Failed approach: enlarging the source cut to orthogonality against all of `F ∩ K_w`. The source only constructs orthogonality against `A_c ∩ K_w`; the displayed counterexample shows the enlargement needs an extra premise.

Original and reduced dependency graphs remain intact. This correction changes only the human interpretation of the existing edge

`IsTested + fixed-label invariance + isRoot_hecke_string ⇒ agreement`.

**RESUME HERE:** At the same caller, reconstruct the immediate `ribet_columns` output and its exact handoff into `exists_diagOp_mem_ellIntegralForms`, especially the `ellVal(m*s(π))` budget and all quantifiers in lines 115–132. Do not redo the determinant lemma. Separately queue the accompanying probe in the shared compact Lean 4.35 runner and inspect its actual axiom output before marking it checked.

**HANDOFF TO:** integration/editor should replace the stronger `F ∩ K_w` prose by `(C-cut)` and remove the unsupported claim that `pr_Z` preserves `K_w`; formal audit/kernel runner should elaborate the probe; mathematics should continue upstream at `ribet_columns`.
