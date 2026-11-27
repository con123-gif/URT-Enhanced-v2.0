# Compact C: the principal-Artin residue sum

**Status:** SOURCE-MATCHED human derivation of the first (global-sum)
direction of `SplitPlaces.power_residue_reciprocity`; native replay pending.
This is not RH and does not prove the converse representation of compatible
functionals.

## Source and caller

Pinned source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`
(`grh-compact/src`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`).

| declaration | source path | blob | lines |
|---|---|---|---:|
| `SplitPlaces.power_residue_reciprocity` | `Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean` | `fbfa4f703035c833491594169f2089c01fda3d03` | 47–124 |
| `sum_ord_smul_frob_eq_zero` | `Lib/ClassField/Global/Avatars.lean` | `dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa` | 80–100 |
| `artin_reciprocity` | `Lib/ClassField/Global/ArtinReciprocity.lean` | `72cbcb94dd0762e91178fe6c0d04acb0e642414b` | 63–115 |
| `resH2_cyclicClass_eq_zero` | `Lib/ClassField/GaloisCohomology/SylowReduction.lean` | `6382a7e01d1f673dbc87e663c195f05b6839abca` | 99–105 |

Actual downstream path:
`power_residue_reciprocity` → `exists_split_primes_relations` →
`IsPencil.length_le_of_unseen_class` → `exists_anticyclotomic_twist` → C.
The prior math checkpoint reconstructed the downstream mirror-isotropy use but
left this Artin step explicit.

## Exact hypotheses retained

Let `Q` be the fixed-field Galois subgroup used in the source, `P` a
trivialised cocycle with values in the `Z/mZ`-module `V`, and `u : V → Z/mZ`
an arbitrary additive functional.  Hilbert 90 applied to

\[
g\longmapsto \operatorname{rootPowHom}_m\bigl(u(P(g))\bigr)
\]

gives a multiplicative element `r` and an `S`-unit `a` satisfying
`m • r = ofBase(a)`.  Retain all of the source's conditions:

1. `m • ofZModCocycle m (u ∘ P) = 0`;
2. the stabiliser used for Artin reciprocity contains every complex
   conjugation (source lines 101–103);
3. on that stabiliser, `r` is fixed and `m` kills the character, so
   `resH2_cyclicClass_eq_zero` applies;
4. the selected places are distinct, unramified for the character, and carry
   the actual Frobenii `S.φ θ`;
5. at every unselected place either the local Artin character is already one,
   or `a/r^m` is a unit and `r` is inertia-fixed (lines 121–124).

No total-complexity hypothesis is needed for this direction.  Total
complexity enters the *converse* construction at source lines 89–100 and must
not be silently imported here.

## Derivation

Put

\[
\chi=\operatorname{ofZModCocycle}_m(u\circ P).
\]

The cyclic class of `(χ,a)` restricts to zero because `m r=a`, the subgroup
fixes `r`, and `mχ=0`.  `artin_reciprocity` therefore gives

\[
\chi\bigl(\operatorname{Art}(a)\bigr)=0.                 \tag{1}
\]

Factor the global Artin image into its local factors.  At an unselected
place the source's dichotomy makes the local character zero: in the second
branch, write the local valuation as an integer multiple `k`; the local term
is `k(mχ)=0`, which is exactly the calculation in
`sum_ord_smul_frob_eq_zero:94–100`.  At a selected unramified place `S.v θ`,
the local term is the valuation times the Frobenius value.  Thus (1) becomes

\[
\sum_{\theta}
 -\operatorname{ord}_{S.v\theta}(a)\,\chi(S.\phi\theta)=0.\tag{2}
\]

The two substitutions at the actual caller are exact:

\[
-\operatorname{ord}_{S.v(i,\delta)}(a)
 = b(\operatorname{fixedSUnitsRep}_{\delta}(y))_i,       \tag{3}
\]

from the Kummer-character/valuation identity `n` (source lines 62–76), and

\[
u\!\left(V(\delta^{-1})P(\gamma_i)\right)
 =\chi(S.\phi(i,\delta)),                                \tag{4}
\]

from cocycle conjugation plus the same Kummer identity (lines 116–118).
Substitute (3) and (4) **before** taking any bounds.  The one decisive
equation is

\[
\boxed{
\sum_{(i,\delta)}
b(\operatorname{fixedSUnitsRep}_{\delta}(y))_i\,
u\!\left(V(\delta^{-1})P(\gamma_i)\right)=0 .}
                                                               \tag{5}
\]

Because `u` was arbitrary and the native dual separates points,
`eq_zero_of_forall_hom_eq_zero` turns (5) into the vector-valued global
power-residue sum asserted by `power_residue_reciprocity`.  This is exact
algebraic cancellation; replacing (3) by an unsigned valuation would negate
the sum and is not definitionally harmless.

## Dependency reduction and boundary

Original root-reachable graph is retained.  This checkpoint expands only

`power_residue_reciprocity(first direction)` ← `Hilbert 90` +
`resH2_cyclicClass_eq_zero` + `artin_reciprocity` +
`sum_ord_smul_frob_eq_zero` + exact identities (3),(4).

It does **not** discharge Albert–Brauer–Hasse–Noether inside
`artin_reciprocity`, Hilbert 90, Kummer-character existence, or the converse
functional-representation direction.  No claimed RH theorem is imported.
The old-pin `rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier` executables
are not available in this compact checkout; the source-matched reduction and
companion certificate preserve the unresolved leaves rather than declaring
them pruned.

## Checks and failed shortcuts

- Checked the compact source revision and all four blob hashes above.
- Inspected the exact bodies and caller lines quoted above.
- Executed the companion finite cyclic-group certificate over moduli `2..9`,
  family sizes `1..3`, coefficients `[-2,2]`: `260320` exact substitutions
  and `201928` sign-deletion negative controls, all successful.
- Local `lean`, `lake`, and `elan` are absent.  The companion Lean file is
  PREPARED only; no native PASS or axiom result is claimed.
- Rejected shortcut: `χ(Art(a))=0` alone is insufficient until every
  unselected local factor satisfies the source dichotomy.
- Rejected shortcut: total complexity cannot be used to hide the first
  direction's complex-conjugation stabiliser check.
- Rejected shortcut: testing a nonzero dual functional is insufficient;
  separation needs **all** additive `u : V → Z/mZ`.
- Failed diagnostic retained: an initial unnecessarily broad enumeration
  (moduli `2..12`, sizes through `4`) exceeded the 30-second local command
  window before producing a receipt.  It was replaced by the still exhaustive
  finite ranges above; this changes no mathematical claim.

## RESUME HERE

Reconstruct the converse direction at
`SplitPrimeReciprocity.lean:89–100`: from a compatible finite functional,
use the totally-complex idele decomposition supplied by
`exists_kummer_chars`, then verify that the constructed trivialised cocycle
has exactly the prescribed tame values.  Preserve principal-ideles,
`idelesPowAt`, units-off-`S`, and root-detection hypotheses.  Do not redo
equation (5).

