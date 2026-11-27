# Compact C: audited Ribet scalar collection and retraction

27 November 2026. **SOURCE-MATCHED CORRECTION TO THE PREVIOUS MATH-LANE
REPORT / HUMAN PROOF; no new kernel replay.** The first version of this
file incorrectly inferred that the RUN60/integration coefficient bound
was invalid because it could be smaller than a different coarse bound
used in `RibetElement.lean`. That comparison was not logically valid:
two upper bounds for the same raw expression need not dominate one
another. This version retracts that claim and audits both valid routes
from the actual `ribet_first_order` output.

Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude.

## 1. Actual caller and raw terms

Use `New/Selmer/RibetElement.lean`, blob
`188eeb68d437bfa58bcc30042d4eee66c2111e18`, `ribet_columns` lines
134--223, and `New/Selmer/RibetFirstOrder.lean`, blob
`a05cb18d1ee62520f104d41361099db4b23cbe1f`, `ribet_first_order`
lines 91--106. Put

- `H=D.h₂`, `T=D.t`, `f=D.f`, `r=card row-rank`;
- `c=crudeUnit ℓ D`, `a=padicValNat ℓ X`, and `L=loss D ℓ`;
- `j=card J`, `d=card s₀`, and `q=Hh`, where `h<=v_ℓ(M)<=c`.

The retained source hypotheses give

\[
 H\ge2,\quad 1\le T\le H,\quad 0\le f\le H,\quad 1\le r\le D.r.
\]

All valuation, length, and cardinality terms below are nonnegative.
The exact first-order conclusion is

\[
v(d)\le b_0+\sum_{e<T}b_e
 +T\left(\sum_v v(o_v(1))+2|s|q\right)+(j+1)q.       \tag{1}
\]

The caller supplies the following terms, with the same row, twist,
triangle, coefficient ring and odd-Sha integer throughout:

1. `SelmerLengthLe` plus row block loss:
   \(b_0\le(10fr+1)c+L_0\).
2. `hasTriangleCost_tateTwist` for every character block:
   \(\sum_e b_e\le\sum_e L_e+Ta\).
3. `sum_blockLoss_le` at the actual moduli:
   \(L_0+\sum_eL_e\le4rfL\).
4. The two conjugate-inverse copies of the auxiliary set cost at most
   \(2c\); the two copies of the g-set cost at most \(8fc\), since its
   cardinality is at most `4f` and \(v_\ell(M)\le c\).
5. `tri.detect` gives \((j+d)q\le H^{22}h\), while the actual detector
   is `s=s₀∪image(withConjInv τ)`, so \(|s|\le d+2j\). Hence
   \[
   2|s|q\le4(j+d)q\le4H^{22}h\le4H^{22}c.             \tag{2}
   \]
   No division by `h` occurs, so this also covers `h=0`.
6. Likewise \((j+1)q\le(H^{22}+H)c\).
7. Multiplication by `M³` adds exactly \(3v_\ell(M)\le3c\).

Substitution into (1), with exact algebraic collection before any
large-power estimate, gives the valid direct envelope

\[
\boxed{v_\ell(M^3d)\le C_{\rm raw}c+Ta+4rfL,}        \tag{3}
\]

where

\[
C_{\rm raw}=4+10fr+T(2+8f+4H^{22})+H^{22}+H.          \tag{4}
\]

This is equation (9) of
`integration/2026-11-26_COMPACT_RIBET_FINAL_BUDGET.md`. Its derivation
is valid. RUN60 replaces `4H²²` by `6H²²`, a harmless weakening.

## 2. Direct RUN60/integration payment

Since `r>=1`, (4) implies

\[
C_{\rm raw}\le rA,
\quad A=4+10f+T(2+8f+4H^{22})+H^{22}+H.              \tag{5}
\]

Indeed the `10fr` term is already exactly `r(10f)` and every other
nonnegative term can be multiplied by `r`. From `T,f<=H`,

\[
 A\le4+13H+8H^2+4H^{23}+H^{22}.                      \tag{6}
\]

For `H>=2`,

\[
4+13H+8H^2\le16H^2\le H^6\le H^{22},
\]

so `A<=4H²³+2H²²<=5H²³<=H²⁷`. Also
`T<=H<=H²⁷<=rH²⁷`. Equations (3)--(6) therefore give

\[
v_\ell(M^3d)
 \le rH^{27}c+rH^{27}a+4rfL
 =r\{H^{27}(c+a)+4fL\}.                               \tag{7}
\]

Thus the earlier integration route reaches the native `rowBudget`
without any missing premise. The first version of this file is
formally retracted.

## 3. The source's separate coarser factoring

At `RibetElement.lean` lines 215--223 the native proof instead factors
the rank earlier and pays the sufficient inner coefficient

\[
N=4+T(2+10f+6H^{22})+H^{22}+H.                       \tag{8}
\]

This is not asserted to be pointwise above `C_raw`. The required
statement is the rank-weighted comparison

\[
C_{\rm raw}\le rN.                                   \tag{9}
\]

To see it, first charge `10fr` to `rT(10f)` using `T>=1`, and charge
all remaining terms to their `r`-multiples. Inside the `T`-bracket the
only residual check is

\[
10f+(2+8f+4H^{22})\le2+10f+6H^{22},
\]

which is exactly `8f<=2H²²`; this follows from `f<=H`, `H>=2`, and
`4H<=H²²`. This proves (9).

Independently,

\[
N\le4+3H+10H^2+H^{22}+6H^{23}\le7H^{23}\le H^{27}.   \tag{10}
\]

The low-degree part is at most `13H²<=H²²`; then
`2H²²<=H²³`, and `7H²³<=H²⁷` because `H⁴>=16`.
Equations (9)--(10) reproduce the native factoring and again give (7).
The two proofs are compatible but neither intermediate coefficient
must dominate the other.

## 4. Same-witness and strict-modulus audit

`New/Selmer/TwistForRows.lean`, blob
`802242498ad4530e7f52cc4f14e0a03be2c59f4d`, lines 14--19 returns one
`MFoldTwist τ` whose every permitted power simultaneously has
`IsAuxTwist`, every indexed `SelmerLengthLe` witness at the one supplied
modulus, and every ratio bound. `New/Selmer/FitTwistsExist.lean`, blob
`da769eba595af2f883eed9b82dbd322a521aea14`, lines 35--37 supplies

\[
m_0=\lfloor D.r\,\mathrm{rowBudget}(D,\ell)\rfloor+1.
\]

Its two `denominatorLe_rowBudget` calls at lines 57--65 use the same
`H κ` output for good-lift and rank-one rows. There is no average and no
second independently selected twist. At `RibetElement.lean` line 128
the explicit input is exactly `floor(D.r*rowBudget)<m₀`; the successor
choice supplies it. Immediately before `ribet_first_order`, lines
176--187 prove the required strict local-length inequality by composing
`le_self_add`, the normalized-length comparison, the row-rank bound
`hJ.rank_mem.2`, and `Nat.lt_of_floor_lt hm`. That proof is upstream of
the scalar conclusion (7), so the strict input is not circular.

## 5. Verification, failed inference, and status

Executable certificate:
`math/certificates/ribet_source_scalar_correction.py`. It checks the raw
collection, both rank-weighted factorizations, both `H²⁷` payments for
all `2<=H<=64`, `0<=f<=H`, `1<=T,r<=H` (4,415,838 parameter tuples),
and 50,000 deterministic full nonnegative payments. The general proofs
are (2)--(10); finite checks are regression evidence only.

Failed attempt retained explicitly: the prior version compared `N`
directly with a different RUN60 coefficient and found cases with `N`
larger. That arithmetic identity was correct, but it did not test
whether either expression bounded the raw right side of (1). The
relevant comparisons are (5) and (9), both rank-weighted and both valid.

`command -v lean`, `lake`, and `elan` returned no executable. Therefore
no Lean elaboration, native reduction-engine run, axiom print, or CI PASS
is claimed. Original/reduced graphs and all deep premises remain:
row construction, local/crystalline block loss, reciprocity/triangle,
odd-Sha and first-order Fitting. This audit repairs our exposition; it
does not prove RH or complete the human reconstruction.

**RESUME HERE:** integration/editor may keep equations (9)--(10), but
should add the explicit term ledger (1)--(4) and avoid comparing their
factor `A` pointwise with the native factor `N`. Next arithmetic audit:
the `hS`/`hq` rewrite orientations at `RibetElement.lean` 211--223 and
the common `H κ` witness through `denominatorLe_rowBudget ->
exists_isFitFamily`, preferably in native Lean when available.

