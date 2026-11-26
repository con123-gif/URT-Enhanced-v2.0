# Compact C review: the final Ribet payment is one scalar inequality

26 November 2026. **INDEPENDENT HUMAN REVIEW / SOURCE-MATCHED; Lean probe prepared, not locally elaborated.** Integration commit `452515bd` already reconstructed the broad `ribet_columns` final budget. This run contributes one distinct audit result: it checks that reconstruction against the literal source coefficient at `RibetElement.lean:211–223`, identifies the exact nonnegative padding used by the native caller, and isolates the final `card(r) * rowBudget` payment as a standalone scalar certificate. It does not prove the retained Selmer, odd-Sha, triangle, magnitude, or automorphic suppliers, and it does not prove RH.

Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`; Lean 4.35.0; Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`. Cathedral parent: `afcf28ec6aeeeccf79261608b29e28b61f6bed4c` (freshly rebased from `origin/newtons-cathedral` before commit).

## Source and downstream ledger

| Role | Pinned path | Git blob |
|---|---|---|
| Actual caller and budget | `New/Selmer/RibetElement.lean:36–37,80–109,116–223` | `188eeb68d437bfa58bcc30042d4eee66c2111e18` |
| First-order coefficient inequality | `New/Selmer/RibetFirstOrder.lean:91–106` | `a05cb18d1ee62520f104d41361099db4b23cbe1f` |
| Pointwise Selmer length | `New/Selmer/AptTupleDefs.lean:34–38` | `ba41ff0e729d5182ac236911898dfd0865165f8c` |
| Auxiliary twist and detector | `New/Selmer/Corepresentable.lean:152–167` | `3e401695d96b8ea826d60dadf0174d366f85d37c` |
| Tate-twist triangle cost | `New/Selmer/TateTwistSteps.lean:28–64` | `941e383bd401d51e8a8c2d856320ef61c7fa17e7` |
| Odd-Sha common integer | `Lib/Cyclotomic/OddSha/OddShaBound.lean` | `71e1148ba135da7530abe211af57ba8a0d63f195` |
| Places above the two chosen primes | `New/Selmer/AptTuples.lean:28–31` | `49699d4679d83a7bc7714afc53b7e2757ae4adf3` |
| Scale comparison | `New/Data/Magnitudes.lean:125` | `306fe7e22378322422d11b1f8415fcdac75ffd6e` |
| Immediate downstream consumer | `New/Selmer/DenominatorBound.lean:47–55,129–138` | `5889d96fe1a6ad7926e0df09a7d183232f91c534` |

Prior-work ledger: integration note `integration/2026-11-26_COMPACT_RIBET_FINAL_BUDGET.md` at commit `452515bd` derives the same sharp subtotal as equation (2) below and explicitly requests independent audit; the earlier MATH first-order note establishes the coefficient formula and valuation collection. This result is root-reachable through `denominatorLe_rowBudget`, but it is an audit and algebraic contraction of the existing route, not a new replacement theorem. The period-basis and crystalline-radius work in peer lanes is also already closed. None of those results is repeated here.

## 1. Quantifiers and guards that cannot be weakened away

Retain every hypothesis of `ribet_columns`, in particular:

1. one fixed chosen row `pi`, with `IsRow` and `SelmerLengthLe` for every member of `mathcal X`;
2. the strict cutoff `floor(D.r * rowBudget) < m0`;
3. `h <= v_ell(chosenGroupOrder)` and the triangle at level `H*h`, cost `H^22*h`;
4. one auxiliary twist whose entire `Q`-sum is at most `crudeUnit`;
5. one common odd-Sha integer for every `e < t`;
6. the rank interval `1 <= R <= D.r`, where `R = card(r)`;
7. the source magnitude comparisons furnished by `D.nat_le_of_hasLogBound`.

Lines 143–147 choose **one** coefficient ring `O'` satisfying the block-loss bound, every column lattice, roots of unity, polynomial integrality, and all row lattice/span/scalar eventualities simultaneously. Replacing this by separately chosen rings would reverse an existential/universal dependency and is invalid.

The strict cutoff is also structural. Lines 184–191 bound the first-order row module by injecting its intersection term into the actual twisted Selmer module, while its relative-length term remains part of the common block-loss sum. Only then does

\[
b_0 < v_\ell(\ell^{m_0+Hh})
\]

follow from the floor hypothesis. An average row bound cannot replace this pointwise statement at `pi`.

## 2. Exact cost ledger before coarse magnitude bounds

Write

\[
R=\#r,\quad t=D.t=5D.r,\quad H=D.h_2,\quad
c=\operatorname{crudeUnit}_\ell(D),\quad
q=v_\ell(X_{\mathrm{odd}}),\quad L=\operatorname{loss}_\ell(D).
\]

Also write `u = v_ell(chosenGroupOrder)`, so `u <= c`, and `v(C)=Hh`, so `v(C) <= Hc` because `h <= u <= c`.

After inserting the already verified first-order coefficient bound, the native callers supply these terms:

| Charge | Bound retained from source |
|---|---:|
| chosen row plus its Selmer intersection | row relative loss `+ (10 f R + 1)c` |
| all character blocks | character relative losses `+ t q` |
| all relative losses together | `<= 4 R f L` by `sum_blockLoss_le` |
| the two conjugate auxiliary-`Q` polynomial sides | `<= 2 t c` |
| two chosen-prime sides | `<= 8 f t c`, since `#hG <= 4f` |
| detector union in the `2 #s v(C)` term | `<= 4 t H^22 c` |
| final `( #J + 1 )v(C)` term | `<= (H^22+H)c` |
| multiplying the coefficient by `chosenGroupOrder^3` | `<= 3c` |

For the detector line, `s = s0 union image(withConjInv tau) univ`, hence

\[
\#s\le \#s_0+2\#J,
\qquad (\#J+\#s_0)Hh\le H^{22}h.
\]

Therefore

\[
2\#s\,Hh
\le 2(\#s_0+\#J)Hh+2\#J\,Hh
\le 4H^{22}h
\le 4H^{22}c. \tag{1}
\]

No triangle norm is taken before the union and image cardinalities are combined.

The sharp subtotal supplied by this ledger is

\[
4RfL+tq+
\bigl[10fR+4+t(2+8f+4H^{22})+H^{22}+H\bigr]c. \tag{2}
\]

The source deliberately pads (2). Put `D.r = R+s`, with `s >= 0`. Exact algebra gives

\[
\begin{aligned}
t(2+10f+6H^{22})
={}&10fR+t(2+8f+4H^{22})\\
&+10fs+2tH^{22}. \tag{3}
\end{aligned}
\]

Thus the last three terms are explicit nonnegative slack. This explains—rather than merely restating—the source coefficient

\[
A:=4+t(2+10f+6H^{22})+H^{22}+H. \tag{4}
\]

## 3. The decisive local equation

The two remaining magnitude facts used at lines 219–223 are exactly

\[
A\le H^{27},\qquad t\le H^{27}. \tag{5}
\]

They are not inferred from RH and are not fitted constants: the source discharges them with `D.nat_le_of_hasLogBound`. Since `R >= 1`, (5) implies `A <= R H^27` and `t <= R H^27`. The entire final payment is therefore the one inequality

\[
\boxed{
A c+tq+4RfL
\le R\bigl(H^{27}(c+q)+4fL\bigr)
=R\,\operatorname{rowBudget}(D,\ell).} \tag{6}
\]

The proof of (6) is only monotonicity followed by the exact distributive identity

\[
(RH^{27})c+(RH^{27})q+4RfL
=R\bigl(H^{27}(c+q)+4fL\bigr). \tag{7}
\]

Equations (3) and (7) perform the required algebraic cancellation before any further bound. The third term in (6) already equals the loss part of `R * rowBudget`; it must not be enlarged and paid twice.

## 4. What this confirms and what it does not

This independently confirms the **existing human reconstruction of the original final scalar aggregation** in `RibetElement.lean:211–223`. In particular, equation (2) agrees term-for-term with integration commit `452515bd`, while (3) explains the extra slack in the literal source coefficient rather than replacing it by a different sufficient estimate. Together with the preceding first-order coefficient note, it checks the implication

\[
\text{retained native Ribet/Selmer/triangle suppliers}
\Longrightarrow
v_\ell(\mathrm{chosenGroupOrder}^3 d)\le R\,\mathrm{rowBudget}.
\]

It does not independently prove any retained supplier, the existence of the rows or triangle, the global denominator theorem, the compact proof root, or RH. The external formal source is still the certification for those declarations; this local probe is not a replacement CI receipt.

## Checks, failed reductions, and axiom boundary

- Verified source SHA and the nine blobs above; compared the result with the prior integration derivation at commit `452515bd`.
- Verified the actual caller and immediate downstream occurrence with source search; `ribet_columns` is consumed at `DenominatorBound.lean:129`.
- Checked (3) by exact symbolic polynomial cancellation; the residual is exactly `10 f s + 2 t H^22`, hence nonnegative.
- The companion Lean file imports the actual caller, checks the relevant declarations, proves the slack identity by `ring`, and proves (6) over `ENNReal` from only `1 <= R`, `A <= H^27`, and `t <= H^27`.
- `lean`, `lake`, and `elan` are unavailable locally. The certificate is **PREPARED, NOT A LEAN OR CI PASS**; no workflow result is claimed.
- The compact pinned source exposes no `rh_prune`, `rh_scan`, `rh_reduce`, `rh_auto`, or `rh_auto_frontier` commands, and the absent Lean executable prevents loading the older Cathedral tactic modules. The applicable reduction stages were therefore performed explicitly: root-caller search, premise preservation, exact cancellation (3), aggregate bounds (1)–(2), and the weakened scalar consumer (6). Native engine output remains an audit task, not a claimed result.
- Failed attempt preserved: replacing the chosen-row Selmer bound by an aggregate row average does not establish the strict `b0` guard.
- Failed attempt preserved: separately choosing coefficient rings for the eventual lattice, integrality, and loss properties changes the quantifiers.
- Failed attempt preserved: absorbing `4RfL` into the `H^27` term loses the exact equality with `R * rowBudget` and creates an unnecessary stronger obligation.
- No claimed RH theorem, URT premise, or previously proved endgame theorem is imported. Original/reduced obligations and axiom evidence remain intact.

**RESUME HERE:** Follow the actual consumer into `DenominatorBound.lean:47–55,129–138`. Reconstruct the single implication from (6) and `IsRibetElement` to `DenominatorLe`, preserving the nonzero generic normaliser, the `chosenGroupOrder^3` multiplier, and the exact `rowBudget * log ell` normalization. Do not redo the first-order coefficient, final payment, period inverse, or crystalline radius.

**HANDOFF TO:** formal-audit/kernel should elaborate the companion probe on the pinned toolchain and record the actual CI receipt; integration/editor may replace the open `RibetElement.lean:143–223` prose gap by (1)–(7).
