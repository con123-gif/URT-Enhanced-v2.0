# Compact C: crystalline block-loss aggregation into the Ribet row budget

27 November 2026. **HUMAN SOURCE-MATCHED / PARTIAL; exact scalar certificate executed, Lean probe prepared but not locally elaborated.** This contribution reconstructs the complete caller bridge from the one-place crystalline defect theorem to `sum_blockLoss_le`, and records its use by `ribet_columns`. It does not prove the retained local crystalline, cup-product, tame-type, or lattice-existence inputs, and it does not prove RH.

Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`; Lean 4.35.0; Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`. Cathedral parent: `f31010864ea60a512f7b7558c2098608c0793eaf`.

## Source ledger

| Role | Pinned path and declaration | Git blob |
|---|---|---|
| Global aggregation and actual consumer | `New/Selmer/RibetElement.lean:80–114`, `sum_blockLoss_le`; `:122–218`, `ribet_columns` | `188eeb68d437bfa58bcc30042d4eee66c2111e18` |
| One-place defect | `New/Selmer/OnePlaceDefect.lean:15–83`, `block_defect_le_at_place` | `709e688740863f10dbbb284446ca20c0ba2a280a` |
| Crystalline case split | `New/Selmer/CrystallineBound.lean:17–74`, `crystalline_defect_le` | `7b7ba1c2ac12f09651b5c1285109ff0435258e79` |
| Rank/length conversion | `New/Selmer/CrystallineRank.lean:47–56`, `normLength_defect_le` | `601a4af17cf5f164a2a3b947442192661c680650` |
| Column-to-local-class and duality bridge | `New/Selmer/RowBalanced.lean:43–66`, `inClass_of_isLatticeIn`; `:73–100`, `relLength_obeyingCocycles_le` | `ab1371acacfb1c5f262146456a380a9111ce6444` |
| Place/embedding disjointness | `New/Selmer/DeterminantBound.lean:98–106`, `index_eq_card_range`, `sum_complexEmbOf_le` | `686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df` |
| Block ranks | `New/Selmer/BlocksAndCocycles.lean:39–51`, `RowBlockIndex`, `blockRep` | `2bc5a11b2127e4b46eb4f57bfc1bd12f64c1ef55` |
| Row guards | `New/Selmer/AptTupleDefs.lean:40–59`, `IsColumn`, `IsRow` | `ba41ff0e729d5182ac236911898dfd0865165f8c` |
| Intersection length | `Lib/General/Algebra/FittingDuality.lean:65–67`, `relLength_iInf_le` | `50c522f409cc0214163df1d26b77aede4aa8100a` |

## Exact theorem and retained premises

Fix all parameters of source theorem `sum_blockLoss_le`: an apt pair `hc`, a row `hT : IsRow D t tau R`, labelled columns `hC`, a block reindexing equivalence `epsilon`, and the chosen column `pi`. The theorem is eventual in the coefficient ring `O`. For every sufficiently large `O`, every row lattice `T`, full column lattice family `u`, and moduli `M`, it retains all four caller hypotheses:

1. `u pi` is exactly the reindexed block diagonal representation of `T` and the `t` cyclotomic string blocks;
2. every `u x` is a lattice in the labelled column `R' x`;
3. `T0` is a lattice in the row representation `R`;
4. at every `v | ell`, restriction of `T` agrees with restriction of `T0`.

Its conclusion is

\[
 \sum_{i:\operatorname{Option}(\operatorname{Fin}t)}
 \operatorname{nlen}_O\bigl(\operatorname{blockLoss}(\operatorname{blockRep}(T,i),u,M_i)\bigr)
 \le 4\,r\,D.f\,\operatorname{loss}(D,\ell),                 \tag{B}
\]

where `r = Fintype.card r`. No premise is replaced by a scalar estimate.

## Human derivation of the actual source proof

Let `v` range over the places of `D.E` above `ell`, and let

\[
 L_{v,i}=\operatorname{matrixLattice}
   (\operatorname{blockRep}(T,i)|_{G_v}).
\]

The reindexing equivalence `f` induced by `epsilon` is equivariant because of the exact block-diagonal hypothesis. The labelled-column lattice hypothesis and `inClass_of_isLatticeIn` put every restricted full column in the same local `InClass`. The block injection through `f^{-1}` is jointly injective, so `InClass.of_jointly_injective` puts each `L_{v,i}` in that class. The same joint injectivity and `exists_jump_of_jointly_injective` show that every nonzero jump of a block occurs in some labelled column. These are the non-scalar premises used at source lines 90–110.

By `obeying_crysRels`, the crystalline relations are the intersection of the local relations. Then `relLength_iInf_le` and the linear-map inequality give

\[
 \operatorname{nlen}(\operatorname{blockLoss}_i)
 \le \sum_{v\mid\ell}
 \operatorname{nlen}(\operatorname{localLoss}_{v,i}).          \tag{1}
\]

Local duality in `relLength_obeyingCocycles_le` changes each term into a defect of the Tate dual:

\[
 \operatorname{nlen}(\operatorname{localLoss}_{v,i})
 \le \operatorname{nlen}\left(
 Z_f(L_{v,i}^{\vee}(1))/\operatorname{cupOrthogonal}
 \right).                                                       \tag{2}
\]

This is not a formal cancellation of local conditions: it uses the open local Galois embedding, potential crystallinity of the full columns and the block, the jointly-injective maps, and the perfect-pairing/divisibility result inside `relLength_obeyingCocycles_le`.

For every place, `block_defect_le_at_place` applies with the exact tame-or-crystalline disjunction produced at source lines 100–105. Places above `D.g` use inertia eigenvalues and `isTameType_of_roots`; the other places use the crystalline branch. The jump witness, exact row jumps, cyclotomic string jumps, row rank, and local `InClass` hypotheses are all supplied at lines 106–110. Hence

\[
 \delta_{v,i}\le q_v\,\operatorname{rk}(L_{v,i})
       \frac{\mathcal L}{x_i},\qquad
 x_{\mathrm{none}}=1,\quad x_{\mathrm{some}(c)}=D.t,           \tag{3}
\]

where `delta` is the right side of (2), `mathcal L = loss(D,ell)`, and

\[
 q_v=[G_\ell:j_v(G_v)]
    =\#\operatorname{range}(\operatorname{complexEmbOf}_v).     \tag{4}
\]

The distinguished block has rank `r`; every string block has rank one. There are `t` string blocks. Put `T=D.t`. The bounds `t <= T` and `1 <= r` are stored in `IsRowType`, while `D.t_odd.pos` gives `0 < T`. Therefore

\[
\begin{aligned}
\sum_i \operatorname{rk}(L_{v,i})\frac{\mathcal L}{x_i}
 &=\left(r+\frac{t}{T}\right)\mathcal L\\
 &\le (r+1)\mathcal L\\
 &\le 2r\mathcal L.                                             \tag{5}
\end{aligned}
\]

The ranges in (4) for distinct places are disjoint; `sum_complexEmbOf_le` therefore gives

\[
 \sum_{v\mid\ell}q_v\le \#\operatorname{Embeddings}(D.E)
 =2D.f.                                                          \tag{6}
\]

Combining (1)–(6) yields the decisive caller equation

\[
\boxed{
\sum_{v,i}\delta_{v,i}
 \le (2D.f)\left(r+\frac{t}{D.t}\right)\mathcal L
 \le (2D.f)(r+1)\mathcal L
 \le 4rD.f\mathcal L.}                                         \tag{7}
\]

This is exactly (B), rather than a new or stronger local theorem.

## Downstream link and dependency graph

`ribet_columns` takes `sum_blockLoss_le` in its simultaneous eventual choice at source lines 143–147. The resulting bound is named `hS`. Source line 215 rewrites by `hS`, and the definition

\[
 \operatorname{rowBudget}(D,\ell)
 =D.h_2^{27}\bigl(\operatorname{crudeUnit}+v_\ell(X)\bigr)
   +4D.f\operatorname{loss}(D,\ell)
\]

absorbs (7) after multiplication by `r`. Thus the local theorem is root-relevant through

\[
\texttt{block_defect_le_at_place}
\to\texttt{sum_blockLoss_le}
\to\texttt{ribet_columns}
\to\text{Ribet row coefficient budget}.
\]

Original graph retained:

`crystalline_defect_le` -> `block_defect_le_at_place` <- local `InClass`/jump/tame suppliers; then local duality -> intersection sum -> place/embedding sum -> `sum_blockLoss_le` -> `ribet_columns`.

Reduced scalar graph only:

`t <= D.t`, `0 < D.t`, `1 <= r`, `sum_v q_v <= 2 D.f` -> equation (7).

The reduced graph does not discharge any node in the original local graph.

## Checks, failed reductions, and boundary

- The source pin and all nine blob identifiers in the ledger were resolved in the local pinned source clone.
- The Python certificate exhaustively checked **102,060** exact rational instances over `1 <= r <= 9`, `1 <= D.t <= 9`, `0 <= t <= D.t`, `1 <= f <= 5`, six losses, and every admissible total place index `q <= 2f`.
- It separately checked the equality of the direct block sum with `(r+t/D.t)*loss`, each inequality in (7), and the final `4rf loss` bound.
- Negative controls are exact: dropping `1 <= r` fails at `(r,t,D.t)=(0,1,1)`; dropping `t <= D.t` fails at `(1,2,1)`; replacing `4rf` by `2rf` fails already at `(1,1,1)`.
- `lean`, `lake`, and `elan` are unavailable locally. The Lean probe is **PREPARED, NOT A LEAN PASS**. No claim is made that the source theorem or probe was replayed in this environment.
- Failed shortcut preserved: (7) cannot replace `relLength_obeyingCocycles_le` or `block_defect_le_at_place`. Without the common `InClass`, local cup-orthogonality, tame/crystalline case, jump detection, and exact block restriction, the quantities bounded in (3) have not been related to `blockLoss`.
- Failed strengthening preserved: the constant `2rf` is false for the abstract guards because the row and the full cyclotomic string each contribute one rank unit when `r=t=D.t=1`.
- No claimed RH theorem, old 38/40 EEG result, or URT premise is imported. All unresolved obligations and prior axiom evidence remain intact.

**RESUME HERE:** Expand the retained local leaf in `OnePlaceDefect.lean:31–83`: reconstruct the two branches of `block_defect_le_at_place` through `normLength_defect_le` and `crystalline_defect_le`, especially the `lambdaLoss`/`loss` arithmetic at lines 57–64. Preserve the Kummer chart, jump-window, tame-type and cup-orthogonality hypotheses; do not redo aggregation equation (7).

**HANDOFF TO:** integration/editor may insert (1)–(7) as the exact proof of the global crystalline-loss term; audit/kernel should elaborate the prepared probe and independently inspect the local duality hypotheses; mathematics continues the local one-place branch.
