# MATH lane — generated MulChar.ext_iff and the explicit Units.map witness

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the generated iff theorem and the unit-valued
homomorphism used by MulChar.toUnitHom.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Exact source ledger

The RH source pin is 40e56bab026552e089d7afcfeff08d2defb9c005. Its manifest blob
b4d1ec31575a26b2159ec3a262b482bc051f3f6f pins Mathlib at
0df444a360eaa60ab8c11dca51a86af692955474 and Lean v4.33.1, whose resolved Lean commit is
819816b2e0a3bf405af45ae5c7af2491d8f5bee6.

| Source at the pinned revisions | Blob | Role |
|---|---|---|
| Mathlib/NumberTheory/MulChar/Basic.lean | dc3c465d304326784909c686d278edfa30a75385 | @[ext] theorem MulChar.ext and toUnitHom |
| Mathlib/Algebra/Group/Units/Hom.lean | 253a16e52bc0469a2071c2c29a03a97951d790f7 | Units.map and coe_map |
| Mathlib/NumberTheory/DirichletCharacter/Basic.lean | 4569ebb8e61f683a9c89877f0cda4d3add4d766d | consumer changeLevel_injective |
| Lean src/Lean/Elab/Tactic/Ext.lean | 526ed04905f730e568144cbf0043f439a6d86651 | mkExtIffType, realizeExtIffTheorem, ext attribute |
| Lean src/Lean/Meta/Tactic/Ext.lean | 5e503f026f6e03a03a44f7ce25f5e5ab5cc6f96f | ExtTheorem and extExtension |

The current RH head 9282d3a102c4aff0e6026746db2a8990f5d9cddd pins Mathlib
31ce06eaadf4a200c0e1407c5f10953cf606b8f8 and Lean v4.37.0-rc1, commit
0b77e12952ad39077d80d8bd6b66d601f225c321. Both current Lean ext files have the same blobs as
v4.33.1. Current Units/Hom.lean has blob b7bcab6786a7c009f3cdf020189fc33b8f7685eb,
but the complete Units.map/coercion block inspected here is textually identical. This is a source
comparison, not a kernel equivalence proof.

## 1. Exact generated signature of MulChar.ext_iff

The pinned handwritten theorem is

    @[ext] theorem MulChar.ext
      {chi psi : MulChar A B}
      (h : forall u : Units A, chi u = psi u) :
      chi = psi.

Here A is a CommMonoid and B is a CommMonoidWithZero. There is no handwritten declaration named
MulChar.ext_iff in MulChar/Basic.lean.

Lean's ext attribute defaults its iff option to true unless the source explicitly writes
@[ext (iff := false)]. It validates that the theorem concludes x=y with x and y variable
arguments, records the theorem under a discrimination-tree key for their type, and calls
realizeExtIffTheorem.

mkExtIffType locates the consecutive x,y arguments in the theorem telescope. Every argument after
y must be a proof and must not be depended upon by a later argument. It conjoins the types of those
proof arguments and constructs

    (x=y) iff conjunction-of-extensionality-premises.

MulChar.ext has exactly one proof argument after chi,psi, namely h. Consequently the generated
theorem has the exact mathematical signature

    MulChar.ext_iff :
      (chi=psi) iff
      (forall u : Units A, chi u = psi u).

realizeExtIffTheorem appends the suffix _iff, hence MulChar.ext becomes MulChar.ext_iff. It creates
a theorem declaration with the same universe parameters and marks the generated namespaced theorem
protected.

## 2. Generated proof, not an extra mathematical assumption

The generated forward implication introduces an equality, eliminates it, and proves each
extensionality premise by reflexivity or simplification. In this case, after replacing psi by chi,
the goal is forall u, chi u=chi u.

The reverse implication introduces the unitwise equality and applies MulChar.ext. Therefore
MulChar.ext_iff contains no new premise and is not an axiom inserted by the RH project. It is a
Lean-generated theorem whose proof term depends on the already proved MulChar.ext plus equality
elimination and reflexivity.

The extExtension environment entry is operational metadata for the ext tactic: ExtTheorem stores
the declaration name, priority, and discrimination-tree keys. It is not part of the mathematical
statement used by rw [MulChar.ext_iff].

## 3. Units.map constructs the inverse explicitly

Let M,N be monoids and f : M ->* N. For a unit

    u = (u.val, u.inv, u.val*u.inv=1, u.inv*u.val=1),

the pinned Units.map definition returns the target unit

    (f(u.val), f(u.inv),
     f(u.val)*f(u.inv)=1,
     f(u.inv)*f(u.val)=1).

The first inverse identity is

    f(u.val)f(u.inv)
      = f(u.val*u.inv)
      = f(1)
      = 1,

and the second uses u.inv*u.val=1. Thus no cancellation, injectivity, commutativity, field
structure, or nonzero hypothesis is needed. A monoid homomorphism preserves the explicit inverse.

The multiplication law for Units.map is proved by Units.ext: equality of target units reduces to
equality of their underlying values, and

    f((u*v).val)=f(u.val*v.val)=f(u.val)f(v.val).

The exact coercion theorem is definitional:

    Units.coe_map f u : value(Units.map f u)=f(u).

## 4. How MulChar.toUnitHom uses it

The pinned definition is simply

    MulChar.toUnitHom chi := Units.map chi,

where chi is viewed through its underlying monoid homomorphism. Therefore the target-unit witness
for chi(u) uses chi(u.inv) as inverse. The map_nonunit field of a MulChar is not used here: every
monoid homomorphism sends units to units. That field is instead essential to the previously
reconstructed MulChar.ext theorem and extension by zero.

Combining coe_map with the definition gives

    MulChar.coe_toUnitHom chi u :
      value(chi.toUnitHom u)=chi u

by rfl. This is the exact bridge that lets rw [MulChar.ext_iff] at h turn equality of changed
characters into equality of their evaluations on every target-level unit.

## 5. Necessary premise and negative control

An arbitrary function need not send units to units. On ZMod 5, the constant-zero function sends
the unit 1 to 0, which has no multiplicative inverse. It also fails the monoid-homomorphism law
f(1)=1. Hence Units.map genuinely needs a MonoidHom; the target-unit witness cannot be manufactured
from a bare function.

Conversely, f need not be injective. The trivial monoid homomorphism sends every source unit to the
target identity, which is still a valid unit. Injectivity is irrelevant to Units.map.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ext_iff_units_map_provenance.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ext_iff_units_map_provenance.py

Observed output:

    ext_iff/Units.map provenance regression: OK; report_checks=30, name_checks=2, iff_checks=87381, unit_witness_checks=61712, unit_multiplicativity_checks=247056, composition_checks=17632, negative_controls=2

The certificate checks the source/revision ledger; the generated name rule; the logical iff shape
over finite observation families; and explicit Units.map witnesses for power monoid homomorphisms
on ZMod n, including both inverse equations, multiplicativity, coercion, and composition. It also
executes the constant-zero bare-function negative control.

This does not run Lean, inspect the compiled declaration with #print, or provide an imported-axiom
census. The generated signature is reconstructed directly from the pinned MulChar theorem and
Lean's pinned mkExtIffType/realizeExtIffTheorem implementation.

## Failed attempts / limitations

- Initial GitHub searches for mkExtIff in Mathlib returned nothing because the generator belongs to
  Lean core's src/Lean/Elab/Tactic/Ext.lean, not Mathlib.
- A broad code-search query containing Lean arrow notation was rejected by GitHub's query parser.
  Narrow filename/source searches located Mathlib/Algebra/Group/Units/Hom.lean instead.
- No Lean or lake executable is installed locally, so #check MulChar.ext_iff and #print axioms could
  not be executed. The status remains SOURCE-MATCHED, not ELABORATED.
- The finite power-map certificate instantiates the construction; it cannot prove the polymorphic
  Monoid theorem or validate Lean's generated proof term.

## RESUME HERE

Return to the first unresolved imported theorem in the character-box chain after the completed
ind_drop/ind_unique dependency cluster. Identify its exact caller and source body before choosing
the theorem; do not further expand generic Mathlib unit machinery unless a new RH caller requires it.

**HANDOFF TO:** MATH, dependency, audit, integration.
