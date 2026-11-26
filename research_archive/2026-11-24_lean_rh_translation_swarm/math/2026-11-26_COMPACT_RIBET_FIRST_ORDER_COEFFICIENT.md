# Compact C: the first-order Ribet coefficient budget

26 November 2026. **HUMAN SOURCE-MATCHED / PARTIAL; arithmetic probe prepared, not locally elaborated.** This is one contribution: it reconstructs the exact coefficient and valuation collection inside `ribet_first_order`, the input used next by `ribet_columns`. It neither proves the retained local/automorphic premises nor RH.

Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`; Lean 4.35.0; Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`. Cathedral parent: `5ebb3f406728365251c9811cef6d378f9f334086`.

## Source ledger

| Role | Pinned path | Git blob |
|---|---|---|
| First-order construction | `New/Selmer/RibetFirstOrder.lean:61–245` | `a05cb18d1ee62520f104d41361099db4b23cbe1f` |
| Double Cramer | `New/Selmer/RibetCramer.lean:37–75` | `6f5a4b0d00c600aaa0acdbf118da2f7dffee1e69` |
| Caller/final budget | `New/Selmer/RibetElement.lean:116–223` | `188eeb68d437bfa58bcc30042d4eee66c2111e18` |
| Bounded row determinant | `Lib/General/Algebra/BlockFittingBound.lean:11–30` | `9107737c82be74338b8843ab315bf11d1b186d51` |
| Pointwise Selmer predicate | `New/Selmer/AptTupleDefs.lean:29–38` | `ba41ff0e729d5182ac236911898dfd0865165f8c` |

## Exact reduction

Retain all hypotheses of `ribet_first_order`: the decomposition

\[
u_x\simeq \rho_x\oplus\operatorname{diag}(\xi_0,\ldots,\xi_{t-1}),\qquad \xi_0=1,
\]

full matrix span for `rho_pi`, scalar normalisers, trace ideal, tied-prime divisibilities, Lagrange denominator `C`, strict `b0 < v(p0)`, row bound `b0`, character costs `b_e`, and annihilating polynomials `o_v`.

The source constructs a universal group-algebra `k` with `eta_e(k)=1` and `psi_x(k)=0` by multiplying by `z_x(y_x-U(gamma_x))`, plus Lagrange selectors `q_e` with `eta_j(q_e)=C` exactly when `j=e`. The resulting relation module contains the cocycle, coordinate, tied-prime, right-ideal, and `p`-multiple relations. Full matrix span and the strict row hypothesis give

\[
v(\det\psi_0(B_0))\le b_0. \tag{1}
\]

For `I_e={j in J | ty(j)=e}`, the characterwise Fitting step gives

\[
v(\Gamma_e(0))\le b_e+(|I_e|+|s|)v(C),
\qquad \sum_e|I_e|=|J|. \tag{2}
\]

The lower-set ideal kills all coefficients strictly below `o=sum_j e_j`. Define, exactly as in the source,

\[
a=\left(\prod_v o_v(1)\right)C^{|s|}. \tag{3}
\]

The block determinant calculation is an equality before any norm,

\[
\det(\eta_e(M(i)))=a\det B_e(i_e), \tag{4}
\]

and double Cramer identifies the scalar represented by the surviving coefficient as

\[
\boxed{c=\det\psi_0(B_0)\;C\;a^t\prod_{e<t}\Gamma_e(0).} \tag{5}
\]

Applying the additive valuation to (5), then (1)–(3), leaves one exact collection equation:

\[
\boxed{
\begin{aligned}
&b_0+\sum_e b_e+(|J|+t|s|)v(C)+v(C)
 +t\left(\sum_vv(o_v(1))+|s|v(C)\right)\\
&\quad=b_0+\sum_e b_e
 +t\left(\sum_vv(o_v(1))+2|s|v(C)\right)
 +( |J|+1 )v(C).
\end{aligned}} \tag{6}
\]

Equation (6) is the bound stated by `ribet_first_order`. One `t|s|v(C)` comes from the `t` Fitting bounds in (2), the other from `a^t`; merging them undercounts by exactly `t|s|v(C)`.

`ribet_columns` must still supply the pointwise chosen-row bound, `sum_blockLoss_le`, local duality/odd-Sha lengths, triangle costs, trace-ideal conversion, and the final inequality to `card(r) * rowBudget(D,ell)`. The already integrated diagonal-Hecke transport adds no further valuation loss.

## Checks and boundary

- Verified the source pin and all five blobs.
- Six literal source anchors passed: theorem bound, definition (3), determinant identity (4), Cramer call, product-valuation step, and fibre-cardinality identity.
- Exhaustively checked (6) for seven parameters in `{0,1,2,3,4}`: **78,125 exact cases**.
- Checked 64 nonzero negative controls: counting the auxiliary-set factor once is short by exactly `t*|s|*v(C)`.
- `lean`, `lake`, and `elan` are absent locally. The probe is **PREPARED, NOT A LEAN PASS**; no CI receipt is claimed.
- Failed reductions preserved: an aggregate average does not replace the pointwise `b0` bound for chosen `pi`; merging the two `|s|` costs is false.
- No RH theorem or URT premise is imported. Prior graphs, unresolved premises, and axiom evidence remain untouched.

**RESUME HERE:** Reconstruct only `RibetElement.lean:143–223`: turn (6), `sum_blockLoss_le`, the Selmer bound, odd-Sha length, and prime-triangle cardinalities into `ellVal(chosenGroupOrder^3*c) <= card(r)*rowBudget(D,ell)`. Preserve every use of `hS`, `hq`, `hh`, `hJ.t_le`, and `HasLogBound`; do not redo (5)–(6).

**HANDOFF TO:** integration/editor may use (5)–(6); formal audit/kernel runner should elaborate the probe; mathematics/Galois should continue the final arithmetic aggregation and retained local inputs.
