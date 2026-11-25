# MATH lane — factor-through levels are upward closed among divisors

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED reconstruction of pinned Mathlib `FactorsThrough.mono` and the reverse
implication of `mem_conductorSet_iff_conductor_dvd`.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, axiom census,
or proof of RH.

## Source ledger

Required RH revision: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | both reconstructed theorems and the kernel factorization criterion |
| `Mathlib/Data/ZMod/Units.lean` | `c93c732e5bedd18aadd8cab7b9baf139bfb41553` | exact `unitsMap`, `unitsMap_comp`, and nonzero-level surjectivity |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | downstream RH `prim_mul` through conductor power/product lemmas |

At the fresh 2026-11-25 upstream check, RH HEAD was
`a18a350c3e5aad997766cff2670b292313e46574`; its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` still pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`. The current Dirichlet-character Basic blob is
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`; direct extraction found both theorem bodies unchanged.
This is source-text comparison, not elaborated-term equivalence.

## 1. Exact monotonicity theorem

Let `R` have `[CommMonoidWithZero R]`, let `n,d,m : Nat`, let

    chi : DirichletCharacter R n,

and assume `[NeZero n]`. The theorem takes

    hchi : chi.FactorsThrough d,
    hd   : d|m,
    hm   : m|n,

and concludes

    chi.FactorsThrough m.                                (1)

There is no ring, field, `Nontrivial R`, positivity, primality, or coprimality premise. The order is
important: a character descending to the **smaller** factor level `d` also descends to every
intermediate multiple `m` that still divides its ambient level `n`. The converse is false in
general.

## 2. Replace the conclusion by a kernel inclusion

The factorization criterion at `hm:m|n` changes (1) into

    ker(unitsMap(n -> m)) <= ker(chi.toUnitHom).          (2)

Take

    x : Units(ZMod n)

with

    unitsMap(n -> m)(x) = 1.                             (3)

The goal is `chi.toUnitHom(x)=1`.

The existing factorization `hchi` includes its own divisor proof

    hchi.dvd : d|n.

Applying the same criterion to `hchi` gives

    ker(unitsMap(n -> d)) <= ker(chi.toUnitHom).          (4)

Thus it remains only to show that (3) puts `x` in the kernel on the left of (4).

## 3. Exact direction of unit-map composition

The pinned theorem states

    ZMod.unitsMap_comp (hd:d|m) (hm:m|n) :
      unitsMap(m -> d) comp unitsMap(n -> m)
        = unitsMap(n -> d).                              (5)

The arrows reverse the divisibility arrows because reducing a residue at level `n` first modulo
`m` and then modulo `d` is direct reduction modulo `d`.

Evaluate (5) at `x`. By (3), its left side is

    unitsMap(m -> d)(1) = 1.                             (6)

Therefore `unitsMap(n -> d)(x)=1`. Inclusion (4) now gives `chi.toUnitHom(x)=1`, proving (2), and
the factorization criterion constructs the required level-`m` character.

The source proof does not manually extend the old level-`d` character. Kernel transport proves the
condition, while `factorsThrough_iff_ker_unitsMap` performs the noncomputable quotient construction
using `MonoidHom.liftOfSurjective`. The `[NeZero n]` hypothesis enters through that criterion and
the surjectivity of the unit reduction from the ambient level.

## 4. Reverse membership from conductor divisibility

For `[NeZero n]` and a specified `hd:d|n`, the pinned theorem is

    mem_conductorSet_iff_conductor_dvd (hd) :
      d in chi.conductorSet <-> chi.conductor|d.          (7)

The forward implication is the previously reconstructed gcd-minimality theorem. For the reverse
implication, assume

    h : chi.conductor|d.                                 (8)

By definition of the conductor and its primitive character,

    chi.factorsThrough_conductor :
      chi.FactorsThrough chi.conductor.                  (9)

Apply `FactorsThrough.mono` to (9), using (8) as the first divisibility and the explicit theorem
argument `hd:d|n` as the second. The result is

    chi.FactorsThrough d,                                (10)

which is definitionally `d in chi.conductorSet`. No appeal to the numerical inequality
`conductor<=d` is made; the required input is the stronger divisibility (8).

Consequently, among the divisors of a fixed nonzero ambient level, the conductor set is exactly

    {d : d|n and conductor|d}.                            (11)

It is upward closed in the divisibility poset, not upward closed merely in the ordinary numerical
order.

## 5. Downstream use and correction

`conductor_zpow_dvd` and `conductor_mul_dvd_lcm_conductor` use (7) backwards: they exhibit a
factorization through the old conductor or through the lcm of two conductors, then obtain conductor
divisibility. `conductor_inv` derives equality by two applications of the power bound. Pinned RH
`prim_mul` consumes these facts after changing primitive characters to a common level.

Earlier MATH reports described `FactorsThrough.mono` as “factorization persists at intermediate
levels.” The missing proof direction is now explicit: an element killed modulo `m` is also killed
modulo the divisor `d`, because the unit map is `n -> m -> d`. The reverse kernel implication would
be false and would incorrectly claim descent from a larger level to every divisor. The report also
records that `mono` delegates construction of the new character to the kernel criterion; it does
not reuse the old lower character without changing its formal level.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_monotonicity.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_monotonicity.py

The exact checker enumerates all `C_60`-valued characters of `Units(ZMod n)` for `1<=n<=18`.
It compares fibre factorization with kernel containment; checks every chain `d|m|n` for which the
character factors through `d`; evaluates the unit-map composition and kernel transport on every
ambient unit; constructs the level-`m` fibre witness; and verifies (7) for every divisor of every
tested level.

Observed output:

    factor-through monotonicity regression: OK; report_checks=7, characters=90,
    criterion_checks=299, monotone_pairs=265, unit_compositions=1646,
    kernel_transports=480, descent_witnesses=265, conductor_equivalences=299,
    reverse_memberships=159, negative_controls=4

This is an independently checkable finite regression of the proof skeleton, not a universal proof,
Lean elaboration, or axiom audit.

## Failed attempts / limitations

- Reversing the divisibility direction fails: a conductor-5 character at level 15 factors through
  5 but not through 1.
- Replacing `conductor|d` by `conductor<=d` fails: a conductor-3 character at level 12 has `3<=4`
  but does not factor through 4.
- Dropping `m|n` does not define conductor-set membership at `m`; for example `2|4` but `4` does
  not divide ambient level 6.
- The proof route cannot simply drop `[NeZero n]`: the unit-kernel criterion's reverse construction
  can fail at formal level zero, as the exact `Units(Z)->Units(ZMod 5)` sign-extension obstruction
  shows. This is a limitation of the route, not a claim that every possible zero-level monotonicity
  statement is false.
- The checker stops at level 18 with target group `C_60`; it does not prove the polymorphic theorem.
- No Lean, Lake, or Elan executable was available locally. Status remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `conductor_zpow_dvd` and `conductor_inv`, preserving the separate
`n=0` branch, the use of `MonoidHom.map_zpow`, and the two divisibility directions in the inverse
equality. Then trace their exact use or non-use in pinned RH `prim_mul` before moving to the product
LCM bound.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
