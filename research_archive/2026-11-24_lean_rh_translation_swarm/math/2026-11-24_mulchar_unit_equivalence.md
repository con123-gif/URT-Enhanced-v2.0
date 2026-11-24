# MATH lane — multiplicative characters are exactly homomorphisms on units

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the pinned Mathlib bridge behind
MulChar.ext_iff, MulChar.toUnitHom, and MulChar.ofUnitHom.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source pin and revision comparison

The RH source is pinned at 40e56bab026552e089d7afcfeff08d2defb9c005. Its lake-manifest.json,
blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f, pins Mathlib at
0df444a360eaa60ab8c11dca51a86af692955474.

| Exact source | Pinned blob | Declaration |
|---|---|---|
| Mathlib/NumberTheory/MulChar/Basic.lean | dc3c465d304326784909c686d278edfa30a75385 | MulChar, ext, toUnitHom, ofUnitHom, equivToUnitHom |
| Mathlib/NumberTheory/DirichletCharacter/Basic.lean | 4569ebb8e61f683a9c89877f0cda4d3add4d766d | changeLevel_def, changeLevel_injective |
| RH src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean | d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e | downstream project consumer |

The current RH head inspected on 2026-11-24 is
9282d3a102c4aff0e6026746db2a8990f5d9cddd. Its manifest pins Mathlib at
31ce06eaadf4a200c0e1407c5f10953cf606b8f8. The current relevant blobs are
acae35e68481b6095d7e1c154b0015383a7fe2f9 for MulChar/Basic.lean and
a954549811e3e87c5f4e85b5d37f359ddfc83a81 for DirichletCharacter/Basic.lean. The mathematical declarations and
proof structure below remain unchanged; the visible MulChar edit replaces simplifier names such as
dif_pos/dif_neg by dite_eq_left/dite_eq_right. This is a textual source comparison, not an
elaboration-equivalence proof.

## 1. Exact hypotheses and object

Fix:

- a type A with CommMonoid A;
- a type B with CommMonoidWithZero B.

A multiplicative character chi : MulChar A B is a monoid homomorphism A ->* B plus the additional
field

    map_nonunit' : forall a : A, not IsUnit(a) -> chi(a)=0.

The domain needs only a commutative monoid. The target supplies multiplication, one, and an
absorbing zero. Neither MulChar.ext nor the unit-homomorphism equivalence assumes Nontrivial B.
For a Dirichlet character, A is ZMod n and B is the coefficient monoid R; hence the public
DirichletCharacter definition assumes CommMonoidWithZero R.

This corrects a possible overreading of apply_eq_zero_iff. That later theorem assumes Nontrivial B
to prove the converse chi(a)=0 -> not IsUnit(a). Extensionality uses only the forward structural
rule for nonunits.

## 2. Why values on units determine the whole character

Pinned MulChar.ext has the exact input

    h : forall u : Units A, chi(u)=psi(u)

and concludes chi=psi. To compare values at an arbitrary a : A, split on IsUnit(a).

1. If a is a unit, the witness ha : IsUnit(a) supplies ha.unit : Units A whose underlying value is
   a. Thus h(ha.unit) is exactly chi(a)=psi(a).
2. If a is not a unit, map_nonunit gives chi(a)=0 and psi(a)=0, so the two values agree.

Function extensionality then identifies the structures. The theorem is tagged @[ext]. Mathlib's
extensionality machinery supplies the iff-form used downstream:

    MulChar.ext_iff : (chi=psi) iff
      (forall u : Units A, chi(u)=psi(u)).

There is no separate handwritten ext_iff proof in the pinned file; it is generated from the tagged
ext theorem. The reverse implication is the argument above, while the forward implication is
substitution.

The nonunit-zero field is essential. On ZMod 4, the constant-one monoid homomorphism and the
principal character agree on the units {1,3}, but differ at 0 and 2. The constant-one homomorphism
is not a MulChar because it sends those nonunits to one rather than zero.

## 3. Restriction to the unit groups

For chi : MulChar A B, Mathlib defines

    toUnitHom(chi) : Units A ->* Units B := Units.map chi.

A unit u has an inverse u^-1. Since chi is a monoid homomorphism,
chi(u)chi(u^-1)=chi(1)=1, so chi(u) is a unit in B. The underlying-value equation is definitionally

    coe_toUnitHom chi u : value(toUnitHom(chi)(u))=chi(u).

This is stronger than merely restricting chi as a function: the result records an actual
unit-group homomorphism.

## 4. Extension by zero

Given f : Units A ->* Units B, the pinned noncomputable definition is

    ofUnitHom(f)(a) =
      value(f(ha.unit)) if ha : IsUnit(a),
      0 otherwise.

Classical decidability chooses the unit/nonunit branch. The definition proves all required
structure fields:

- At one, isUnit_one.unit equals the unit-group identity, so f maps it to one.
- For x*y, IsUnit.mul_iff says the product is a unit exactly when both factors are units.
- If both are units, Units.ext proves
  (hx.mul hy).unit = hx.unit*hy.unit; multiplicativity of f then gives
  ofUnitHom(f)(xy)=ofUnitHom(f)(x)ofUnitHom(f)(y).
- If either factor is a nonunit, x*y is a nonunit and the appropriate zero_mul or mul_zero identity
  proves multiplicativity.
- The nonunit branch is definitionally zero, establishing map_nonunit'.

For u : Units A, ofUnitHom_coe states

    ofUnitHom(f)(value(u))=value(f(u)).

No value on a nonunit is chosen freely.

## 5. The two inverse laws

Mathlib packages restriction and extension as

    equivToUnitHom : MulChar A B ≃ (Units A ->* Units B).

For the left inverse, start with chi and compare ofUnitHom(toUnitHom chi) with chi using MulChar.ext.
At a unit u,

    ofUnitHom(toUnitHom chi)(u)
      = value(toUnitHom chi(u))
      = chi(u)

by ofUnitHom_coe and coe_toUnitHom.

For the right inverse, start with f and apply MonoidHom extensionality. At every unit u,

    toUnitHom(ofUnitHom f)(u)=f(u)

after comparing underlying values using the same two lemmas. Therefore restriction loses no
information precisely because MulChar already fixes every nonunit value.

## 6. Exact downstream rewrite in changeLevel_injective

For hnm : n divides m, DirichletCharacter.changeLevel is definitionally

    changeLevel hnm chi =
      ofUnitHom(chi.toUnitHom.comp(ZMod.unitsMap hnm)).

Suppose two changed-level characters are equal. The pinned proof performs

    rw [MulChar.ext_iff] at h

so h becomes equality at every z : Units(ZMod m). After choosing z whose unitsMap image is the
desired y : Units(ZMod n), the exact final line is

    simpa [changeLevel_def] using h z.

Unfolding changeLevel_def and applying ofUnitHom_coe changes h(z) into

    chi.toUnitHom(unitsMap hnm z)
      = psi.toUnitHom(unitsMap hnm z).

Substituting unitsMap hnm z=y yields equality at y, which is the extensionality goal at level n.
The previous MATH chapter separately established the surjectivity that supplies z; it is not
repeated here.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mulchar_unit_equivalence.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mulchar_unit_equivalence.py

Corrected execution output:

    MulChar unit-equivalence regression: OK; report_checks=27, unit_homs=24, multiplicativity_checks=1143, inverse_checks=158, extensionality_checks=70, change_level_checks=1090, negative_control_checks=36, trivial_target_checks=417

The certificate exhausts homomorphisms from Units(ZMod n) into the multiplicative units of F5 for
n=1,...,10; checks extension by zero is multiplicative; checks both inverse laws and unit
extensionality; checks the exact change-level composition formula over divisible nonzero levels;
and executes the ZMod 4 constant-one negative control.

This validates a finite model of the mathematical skeleton. It does not elaborate Lean, recreate
the generated ext_iff declaration in the kernel, or audit imported axioms.

## Failed attempts / limitations

- The first certificate run allowed source level 19 in exhaustive change-level testing and therefore
  attempted to enumerate 4^18 raw functions. It exceeded the 30-second execution window before
  reporting a result. The corrected certificate bounds exhaustive source levels to n<=10 while
  retaining target levels through 20.
- Searching DirichletCharacter/Basic.lean for definitions of ofUnitHom found only their uses.
  They live in its imported Mathlib/NumberTheory/MulChar/Basic.lean.
- Searching the pinned MulChar file for a handwritten declaration named ext_iff finds only uses.
  Its name is generated from @[ext] theorem ext; a text-only declaration search would miss it.
- Equality on units fails for arbitrary monoid homomorphisms: the ZMod 4 constant-one negative
  control agrees with the principal character on units but violates map_nonunit'.
- Nontrivial B must not be added to this theorem. It is required by apply_eq_zero_iff, not by ext,
  ofUnitHom, or equivToUnitHom.
- The finite F5 certificate cannot prove the polymorphic theorem or proof irrelevance for the
  selected IsUnit witness. Those remain supplied by the pinned Lean source and kernel.

## RESUME HERE

Trace the exact generated signature/provenance of MulChar.ext_iff from Mathlib's ext attribute and
reconstruct the Units.map mechanism that produces a target unit, using pinned Lean meta/source
declarations where available. Then return to the next unresolved imported character-box dependency;
do not repeat ofUnitHom, change-level surjectivity, or ind_unique.

**HANDOFF TO:** MATH, dependency, audit, integration.
