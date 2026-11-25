# MATH lane — factorization is exactly kernel containment for a nonzero level

**Date:** 2026-11-25
**Result:** SOURCE-MATCHED reconstruction of pinned Mathlib
`factorsThrough_iff_ker_unitsMap`, including the noncomputable quotient homomorphism used in the
reverse implication.
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, axiom census,
or proof of RH.

## Source ledger

Required RH pin: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem, `FactorsThrough`, `changeLevel_toUnitHom` |
| `Mathlib/Algebra/Group/Subgroup/Basic.lean` | `5fa1fa1e91518a7faa920b6bb10a3071a09f0577` | `MonoidHom.liftOfRightInverse`, `liftOfSurjective`, composition theorem |
| `Mathlib/Data/ZMod/Units.lean` | `c93c732e5bedd18aadd8cab7b9baf139bfb41553` | `unitsMap`, `unitsMap_surjective` |
| `Mathlib/NumberTheory/MulChar/Basic.lean` | `dc3c465d304326784909c686d278edfa30a75385` | `toUnitHom`, `ofUnitHom`, `equivToUnitHom` |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | downstream RH consumer `prim_mul`, through conductor lemmas |

Fresh upstream check on 2026-11-25 found RH HEAD
`c40250a50104b7e02e7d74f658d00fa7b1f4827c`. Its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; current Dirichlet-character Basic blob
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`. Direct extraction found the complete theorem text
below unchanged. This is textual comparison only, not equality of elaborated proof terms.

## 1. Exact theorem and hypotheses

Fix a type `R` with `[CommMonoidWithZero R]`, naturals `n,d`, a character

    chi : DirichletCharacter R n,

an instance `[NeZero n]`, and a divisibility witness

    hd : d | n.

The pinned theorem is

    factorsThrough_iff_ker_unitsMap (hd) :
      FactorsThrough chi d
        <-> (ZMod.unitsMap hd).ker <= chi.toUnitHom.ker.

Here

    ZMod.unitsMap hd : Units(ZMod n) ->* Units(ZMod d).

The right side says: every unit modulo `n` that becomes `1` modulo `d` is sent to `1` by the unit
restriction of `chi`. There is no `Nontrivial R`, ring, field, coprimality, or positivity premise.
Although `R` is only a commutative monoid with zero, `Units R` is a group, which is the target of
all group-homomorphism descent below.

## 2. Factorization implies kernel containment

Assume `FactorsThrough chi d`. Unpack its exact existential data:

    hdn : d | n,
    chi0 : DirichletCharacter R d,
    hchi0 : chi = changeLevel hdn chi0.

Take `x` in the kernel of `ZMod.unitsMap hd`. The goal is `x` in the kernel of `chi.toUnitHom`, or
equivalently `chi.toUnitHom x = 1`. Substitute `hchi0`. The pinned identity

    (changeLevel hdn chi0).toUnitHom
      = chi0.toUnitHom.comp (ZMod.unitsMap hdn)

turns the left side into `chi0.toUnitHom (unitsMap hdn x)`. Proof irrelevance identifies the two
divisibility witnesses `hdn` and `hd`; the kernel premise makes this argument `1`, and a homomorphism
maps `1` to `1`. Thus the required kernel inclusion holds.

No cancellation, conductor minimality, or assertion about nonunits occurs in this direction.

## 3. Kernel containment constructs the lower-level character

Conversely assume

    h : ker(unitsMap hd) <= ker(chi.toUnitHom).              (1)

Because `[NeZero n]`, the pinned arithmetic theorem `ZMod.unitsMap_surjective hd` supplies a
preimage in `Units(ZMod n)` for every unit modulo `d`. Mathlib then defines

    E := MonoidHom.liftOfSurjective
           (ZMod.unitsMap hd)
           (ZMod.unitsMap_surjective hd)
           <chi.toUnitHom, h>.

This is a group homomorphism

    E : Units(ZMod d) ->* Units R.                           (2)

The construction is noncomputable: `Function.surjInv` chooses a right inverse `s` to `unitsMap`.
At a unit `y` modulo `d`, the underlying formula is

    E(y) = chi.toUnitHom(s(y)).                              (3)

Why (3) is independent of the chosen representative is precisely (1). If `x` and `x'` have the
same image, then `x*x'^{-1}` lies in the kernel of `unitsMap`; (1) sends that quotient to `1`, so
`chi.toUnitHom x = chi.toUnitHom x'`.

The same quotient calculation proves multiplicativity. The selected representative
`s(y1)*s(y2)` and the selected representative `s(y1*y2)` have the same image. Their quotient is in
the kernel, so applying `chi.toUnitHom` identifies their values. Therefore

    E(y1*y2) = E(y1)*E(y2).

The pinned theorem `MonoidHom.liftOfRightInverse_comp` records the decisive triangle identity

    E.comp (ZMod.unitsMap hd) = chi.toUnitHom.               (4)

It also gives uniqueness: a homomorphism out of `Units(ZMod d)` is determined by its composite with
the surjective units map.

## 4. Return from unit homomorphisms to Dirichlet characters

Apply the pinned inverse bridge

    MulChar.ofUnitHom E : DirichletCharacter R d.

It takes the value represented by `E` on units and assigns zero to every nonunit. Use this as the
witness in `FactorsThrough chi d` together with `hd`. It remains to prove

    chi = changeLevel hd (MulChar.ofUnitHom E).              (5)

`MulChar.equivToUnitHom.injective` reduces (5) to equality of unit restrictions.
`changeLevel_toUnitHom` makes the right restriction

    toUnitHom(ofUnitHom E).comp(unitsMap hd).

The two inverse laws for `equivToUnitHom` reduce `toUnitHom(ofUnitHom E)` to `E`; equation (4) then
reduces the whole expression to `chi.toUnitHom`. Hence (5), and therefore the requested
factorization, follows.

The zero values on nonunits are not an extra choice. They are forced by `MulChar.ofUnitHom`, and the
unit-homomorphism equivalence proves that equality on units is equality of Dirichlet characters.

## 5. Why `[NeZero n]` is genuinely necessary

The failure occurs at the surjectivity step and can make the equivalence false, not merely harder
to prove. Take formal level `n=0`, so `ZMod 0` is the integers and its unit group is
`{+1,-1}=C2`. Let the coefficient monoid be the integers and let `chi` be the MulChar obtained from
the sign homomorphism on these two units.

Take `d=5`; of course `5|0`. The map

    Units(Z) -> Units(ZMod 5) = C4

embeds `{+1,-1}` as the order-two subgroup, so its kernel is trivial. Thus the kernel-containment
condition holds for the sign character. But factorization would require a homomorphism

    E : C4 -> {+1,-1}=C2

whose restriction to the order-two subgroup is nontrivial. Every homomorphism `C4->C2` sends the
order-two element to the square of an element of `C2`, hence to the identity. No such `E` exists.
Therefore the right side holds while `FactorsThrough chi 5` fails.

This also explains why mere kernel containment characterizes quotient descent only when the map is
surjective. For a non-surjective map, it controls equality on fibres inside the image but neither
existence nor uniqueness of an extension beyond that image.

## 6. Downstream chain and correction

The immediate pinned consumer is `FactorsThrough.mono`: if `chi` factors through `c` and
`c|d|n`, then a unit killed modulo `d` is also killed modulo `c`; the criterion above promotes the
factorization to `d`. `mem_conductorSet_iff_conductor_dvd` then applies this monotonicity to the
primitive character at the conductor. The subsequent `conductor_zpow_dvd` and
`conductor_mul_dvd_lcm_conductor` turn divisibility goals into explicit factor-through witnesses.
Pinned RH `prim_mul` consumes those conductor bounds.

The previous MATH checkpoint correctly described kernel transport inside `FactorsThrough.mono`,
but left the reverse half of this theorem named. This chapter supplies the missing quotient
construction, records its noncomputable choice, and strengthens the scope warning with an exact
level-zero counterexample. It does not repeat the already reconstructed unit-map arithmetic or
MulChar extension-by-zero proof.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_kernel_criterion.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_kernel_criterion.py

Observed output:

    factorsThrough kernel criterion regression: OK; report_checks=7, characters=80, criterion_checks=255, surjectivity_checks=255, descents=136, composition_checks=863, uniqueness_checks=136, negative_controls=3

The exact checker enumerates `C_60`-valued characters of `Units(ZMod n)` for `1<=n<=16`. For every
divisor `d|n`, it compares fibre constancy with kernel containment, constructs the descended
character from actual fibres, verifies its homomorphism and composition laws, and exhaustively
checks uniqueness among lower-level characters. It separately executes the level-zero extension
obstruction, missing-kernel-condition obstruction, and non-surjective nonuniqueness control.

This is a finite regression of the mathematical skeleton, not a universal proof, Lean elaboration,
or transitive axiom audit.

## Failed attempts / limitations

- Kernel containment without surjectivity does not ensure extension: the level-zero/sign/modulo-5
  example is an exact failure.
- Removing kernel containment fails already for `C4 -> C2` and the identity character of `C4`:
  the quotient kills `2`, while the character does not.
- Equality on the image of a non-surjective map does not ensure uniqueness outside the image.
- Replacing `MulChar.ofUnitHom` by an arbitrary extension to nonunits would lose the defining
  zero-on-nonunits law.
- The checker uses positive levels at most 16 and `C_60` values. It does not prove the polymorphic
  theorem for all coefficient monoids.
- `MonoidHom.liftOfSurjective` uses classical `Function.surjInv`; no local `#print axioms` or Lean
  kernel replay was available. The result remains SOURCE-MATCHED.

## RESUME HERE

Reconstruct pinned Mathlib `conductor_dvd_of_mem_conductorSet` line by line, expanding its use of
`factorsThrough_gcd`, the common-level injectivity step, and the `Nat.gcd_eq_right_iff_dvd`
contraposition. Compare the expanded proof with the earlier summary and correct any orientation or
nonzero-level mismatch.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
