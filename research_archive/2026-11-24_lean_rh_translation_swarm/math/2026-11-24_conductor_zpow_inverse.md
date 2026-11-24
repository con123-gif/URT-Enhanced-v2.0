# MATH lane — powers cannot increase conductor; inversion preserves it

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of Mathlib `conductor_zpow_dvd`, its natural-power
corollary, and `conductor_inv`, with the exact use in the pinned RH source.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source ledger

The RH revision is `40e56bab026552e089d7afcfeff08d2defb9c005`. Its
`lake-manifest.json` (blob `b4d1ec31575a26b2159ec3a262b482bc051f3f6f`) pins Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | all three conductor declarations and their factor-through suppliers |
| `Mathlib/NumberTheory/MulChar/Basic.lean` | `dc3c465d304326784909c686d278edfa30a75385` | commutative-group structure and integer powers of multiplicative characters |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | RH consumer `prim_mul` |

At current RH head `9282d3a102c4aff0e6026746db2a8990f5d9cddd`, the manifest instead pins
Mathlib `31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; the relevant current Basic file has blob
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`. Direct comparison found the bodies of
`conductor_zpow_dvd` and `conductor_inv` unchanged. The current RH consumer blob is
`4564722f96a5e2ca86092fb039e127a77a950c34`, and still uses `conductor_inv` in `prim_mul`.
This is source-text comparison, not elaborated-term equivalence.

## 1. Exact integer-power theorem

Let `R` be any type with `[CommMonoidWithZero R]`, let `n : Nat`, let
`chi : DirichletCharacter R n`, and let `m : Int`. There is no field, nontriviality, or nonzero-level
hypothesis. The source states

    conductor_zpow_dvd (chi) (m) : conductor(chi^m) | conductor(chi).

Thus every positive, zero, or negative character-group power may lose conductor but cannot acquire
a new conductor factor.

### Level zero

The proof begins with `eq_zero_or_neZero n`. If `n=0`,
`conductor_eq_zero_iff_level_eq_zero` gives

    conductor(chi) = 0,  conductor(chi^m) = 0.

The goal is therefore `0|0`, which is true. No primitive-character witness or nonzero-level theorem
is used in this branch.

### Nonzero level

Assume now `[NeZero n]` and write `c=conductor(chi)`. We know `c|n`. Apply
`mem_conductorSet_iff_conductor_dvd` to the character `chi^m` and the divisor `c|n`. It changes the
desired divisibility into the exact factor-through obligation

    c is in conductorSet(chi^m),

or equivalently, `chi^m` is the lift of some character of level `c`.

The lower-level witness is explicit:

    chi0 = chi.primitiveCharacter : DirichletCharacter R c,
    witness = chi0^m.

By definition of the primitive character,

    changeLevel(c|n, chi0) = chi.

The map `changeLevel(c|n)` is a monoid homomorphism between the commutative groups of
multiplicative characters, so `MonoidHom.map_zpow` gives

    changeLevel(c|n, chi0^m)
      = changeLevel(c|n, chi0)^m
      = chi^m.

This is the required factor-through witness. The conductor-minimality equivalence then returns
`conductor(chi^m)|c`.

The proof does not require values of `chi` to be invertible at nonunits. Integer powers are taken in
the character group: its identity character is one on units and zero on nonunits, and inverse powers
retain the mandated nonunit zero.

## 2. Natural powers

For `k : Nat`, Mathlib immediately derives

    conductor_pow_dvd (chi) (k) : conductor(chi^k) | conductor(chi)

by identifying the natural power with the integer power at exponent `(k:Int)` using
`zpow_natCast`. It introduces no additional premise or new factor-through argument.

The result is only divisibility. Equality fails: a nontrivial quadratic character of prime
conductor `p` has square equal to the principal character, whose conductor is `1` rather than `p`.

## 3. Exact inverse theorem

Under the same hypotheses on `R,n,chi`, with no `[NeZero n]`, Mathlib states

    conductor_inv (chi) : conductor(chi^-1) = conductor(chi).

Rewrite inversion as the integer power `-1`. The integer-power theorem directly gives

    conductor(chi^-1) | conductor(chi).                 (1)

For the reverse direction, apply the same theorem to the character `chi^-1`, again with exponent
`-1`:

    conductor((chi^-1)^-1) | conductor(chi^-1).         (2)

The double inverse is `chi`, so (2) is

    conductor(chi) | conductor(chi^-1).

Divisibility antisymmetry applied to (1) and (2) proves equality. This explains the compact source
sequence `dvd_antisymm`, `inv_inv`, two `zpow_neg_one` rewrites, and a second call to
`conductor_zpow_dvd`; none of those rewrites assumes a field of scalar values.

## 4. Exact downstream link

In RH private lemma `prim_mul`, let `A` and `B` be the two primitive characters lifted to the common
level `N`. To extract the conductor of `A` from the product `A*B`, the source applies
`conductor_mul_dvd_lcm_conductor` to `(A*B)` and `B^-1`. Character-group cancellation makes the
product `(A*B)B^-1=A`, while this theorem supplies

    conductor(B^-1) = conductor(B) = n.

Therefore

    conductor(A)=m | lcm(conductor(A*B),n).

The inverse-conductor equality is used only for this replacement; it does not itself prove product
primitivity. Coprimality and the product-level bounds finish `prim_mul` afterward.

## 5. Correction to the prior interpretation

The preceding report correctly described inverse-conductor equality as two applications of the
power bound, but did not reconstruct the factor-through witness or the level-zero branch. Those are
now explicit. Also, it contains a literal stray `+` after `[NeZero n]`; the
mathematical correction is: there is no `[NeZero n]` hypothesis on the general product bound,
`conductor_zpow_dvd`, or `conductor_inv`.

This report does not repeat the product-LCM construction, Jacobi evaluation, or the rest of
`prim_mul`.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_zpow_inverse.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_zpow_inverse.py

Observed output:

    conductor zpow/inverse regression: OK; report_checks=9, character_checks=114, fibre_checks=604, zpow_checks=2850, value_checks=160750, inverse_checks=228, negative_controls=3

The exact finite model enumerates all characters of products of the small cyclic unit groups listed
in the checker. Values are represented as root-of-unity exponents, with a separate nonunit zero.
For each character the conductor is recovered from constancy on fibres of the maps of unit groups.
The checker then exhausts integer exponents `-12..12`, verifies the lifted-value power law,
conductor divisibility, inverse equality and the double inverse. It includes strict-power,
identity-on-nonunits and zero-level controls.

This is an independently checkable finite regression, not a proof for arbitrary
`CommMonoidWithZero R`, a Lean replay, or an axiom audit.

## Failed attempts / limitations

- Replacing divisibility by equality fails for even powers of a quadratic character.
- Reasoning with pointwise scalar powers alone mishandles exponent zero and negative exponents at
  nonunits; the relevant operation is the character-group power, whose identity is also zero there.
- Proving only (1) yields one divisibility, not equality; the second application to `chi^-1` and
  the double inverse are necessary.
- Omitting the level-zero branch silently adds `[NeZero n]` to a theorem that does not assume it.
- The finite regression uses squarefree products of small odd primes. It does not establish the
  universal theorem or replace the pinned Lean proof term.
- No Lean, Lake, or Elan executable is installed locally. Status remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `conductor_changeLevel`, including both conductor-set divisibilities and
the injectivity step that returns the primitive character. Connect only its two uses establishing
`conductor(A)=m` and `conductor(B)=n` in `prim_mul`.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
