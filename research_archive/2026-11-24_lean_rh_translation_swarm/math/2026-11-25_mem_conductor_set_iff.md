# MATH lane — conductor-set membership is divisibility inside the level lattice

**Date:** 2026-11-25
**Result:** SOURCE-MATCHED reconstruction of Mathlib
`mem_conductorSet_iff_conductor_dvd`, including the kernel argument inside
`FactorsThrough.mono` and the theorem's two immediate conductor consumers.
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source ledger

The pinned RH revision is `40e56bab026552e089d7afcfeff08d2defb9c005`. Its
`lake-manifest.json` blob `b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Declarations used |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | `FactorsThrough`, `factorsThrough_iff_ker_unitsMap`, `FactorsThrough.mono`, `conductor_dvd_of_mem_conductorSet`, `mem_conductorSet_iff_conductor_dvd`, `conductor_zpow_dvd`, `conductor_mul_dvd_lcm_conductor` |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | RH consumer `prim_mul`, indirectly through the inverse and product conductor bounds |

Fresh comparison on 2026-11-25 found RH upstream HEAD
`4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061`. Its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` still pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; comparison is recorded only as a
revision check. The theorem reconstructed below is from the required pinned snapshot. No
elaborated-term equivalence between revisions is claimed.

## 1. Exact theorem and quantifiers

Let `R` be any type with `[CommMonoidWithZero R]`. Let `n d : Nat`, let
`chi : DirichletCharacter R n`, assume `[NeZero n]`, and assume

    hd : d | n.

Then the pinned declaration is

    mem_conductorSet_iff_conductor_dvd (hd) :
      d in chi.conductorSet  <->  chi.conductor | d.

There is no `Nontrivial R`, ring, field, primality, coprimality, or positivity hypothesis on `d`.
Its nonzeroness follows when needed from `d|n` and membership, because a nonzero formal level cannot
factor through level zero.

The ambient restriction `hd : d|n` is part of the theorem, not bookkeeping. By definition,
`FactorsThrough chi d` already contains a proof of `d|n`. Without `hd`, the reverse implication is
false: the trivial character at level 5 has conductor 1, so `1|2`, but it cannot factor through
formal level 2 because `2` does not divide `5`.

## 2. Forward implication

Assume `d in chi.conductorSet`. By definition this is a witness that `chi` factors through a
Dirichlet character of level `d`. The earlier pinned theorem

    conductor_dvd_of_mem_conductorSet chi

proves directly that

    chi.conductor | d.                                      (1)

Its difficult content was reconstructed in the previous MATH checkpoint: factorization at `d` and
at the conductor is combined at `gcd(d,conductor chi)`; minimality forces that gcd to equal the
conductor. Merely knowing that the conductor is the least natural number in the set would yield an
inequality, not (1).

## 3. Reverse implication and the upward-closure mechanism

Now assume

    h : chi.conductor | d,

along with the original `hd : d|n`. The canonical fact

    chi.factorsThrough_conductor : FactorsThrough chi (chi.conductor)

is promoted from the conductor to `d` by

    chi.factorsThrough_conductor.mono chi h hd.

Unpacking `FactorsThrough.mono` explains the step rather than naming it. For any `e|n`, the pinned
kernel criterion is

    FactorsThrough chi e
      <-> ker(Units(ZMod n) -> Units(ZMod e)) <= ker(chi.toUnitHom).   (2)

Let `x` be a unit modulo `n` that maps to `1` modulo `d`. Since

    conductor(chi) | d | n,

the units maps compose as

    Units(ZMod n) -> Units(ZMod d) -> Units(ZMod conductor(chi)).

Therefore `x` also maps to `1` modulo the conductor: the second map sends `1` to `1`. Because `chi`
already factors through its conductor, (2) says `chi.toUnitHom(x)=1`. Hence the kernel for `n -> d`
lies in the kernel of `chi`, and a second application of (2) constructs the level-`d` factorization.

Equivalently, one can display the witness as the primitive character lifted first from the
conductor to `d`, then from `d` to `n`; `changeLevel_trans` makes this equal to its direct lift to
`n`, namely `chi`. The source implementation uses the kernel proof above.

Thus

    chi.conductor | d  ->  d in chi.conductorSet.           (3)

Together, (1) and (3) show that for a nonzero level `n`, the conductor set is exactly

    { d : d|n and conductor(chi)|d }.

It is an upward-closed interval in the divisor lattice of `n`, not an upward-closed subset of all
natural numbers.

## 4. Why `[NeZero n]` cannot be discarded

At formal level zero, the pinned theorem `conductor_eq_zero_iff_level_eq_zero` gives conductor zero
for every character. The trivial character of level zero nevertheless factors through level one:
the witness is the trivial level-one character and `changeLevel_one`. Hence, with `n=0,d=1`,

    1 in conductorSet(1 at level 0),

but `0` does not divide `1`. The equivalence is therefore false without `[NeZero n]`; this is not
merely a limitation of the kernel-surjectivity proof.

## 5. Exact downstream links

The pinned Basic file uses this equivalence twice.

1. In `conductor_zpow_dvd`, after separately discharging `n=0`, put
   `c=conductor(chi)`. Since `c|n`, the goal

       conductor(chi^m) | c

   is rewritten by this theorem into membership of `c` in the conductor set of `chi^m`. The witness
   is `chi.primitiveCharacter^m`; lifting commutes with integer powers.

2. In `conductor_mul_dvd_lcm_conductor`, after its own `n=0` branch, put
   `L=lcm(conductor(chi),conductor(psi))`. Both conductors divide `n`, hence `L|n`. The desired

       conductor(chi*psi) | L

   becomes conductor-set membership at `L`. The witness is the product, at level `L`, of the two
   primitive characters lifted to `L`.

The pinned RH lemma `prim_mul` consumes the resulting inverse- and product-conductor statements to
prove primitivity of a coprime product. This bridge therefore supplies the precise factorization
meaning behind those divisibility rewrites; it is not itself an RH theorem.

## 6. Correction to the existing interpretation

Earlier MATH reports quoted the equivalence correctly but left two points implicit:

- the reverse direction is valid only for `d|n`; conductor divisibility alone cannot create a
  factorization at an unrelated formal level;
- `[NeZero n]` is semantically necessary, with an explicit level-zero counterexample.

The reconstruction also identifies the exact difficult step in `FactorsThrough.mono`: kernel
triviality is pulled back through the composed unit maps. No scalar-to-geometry analogy, fitted
constant, omitted premise, or URT advantage is used.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mem_conductor_set_iff.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mem_conductor_set_iff.py

Observed output:

    mem conductorSet iff conductor divides regression: OK; report_checks=7, characters=80, equivalence_checks=255, mono_checks=220, surjective_fibre_checks=255, negative_controls=3

The checker enumerates exact finite unit-group characters with values represented as exponents in
`C_60`, derives each conductor only from unit-map fibre constancy, checks the equivalence for every
divisor of levels 1 through 16, and independently checks the finite upward-closure and unit-map
surjectivity statements. It also executes the unrelated-level, level-zero, and least-number-versus-
divisibility negative controls.

This finite regression is independently checkable evidence for the translation. It is not the
universal Lean proof, a kernel replay, or an axiom/sorry audit.

## Failed attempts / limitations

- Replacing divisibility by the numerical inequality `conductor <= d` is insufficient; for example
  `3<=4` but `3` does not divide `4`.
- Dropping `hd:d|n` admits the level-5/conductor-1/target-2 counterexample above.
- Dropping `[NeZero n]` admits the trivial level-zero character factoring through level one.
- Describing `FactorsThrough.mono` merely as “obvious upward closure” hides the composed unit-map
  kernel argument and its surjectivity dependency.
- The finite checker covers positive levels at most 16 and `C_60`-valued characters. It does not
  establish the theorem for arbitrary `CommMonoidWithZero R`.
- No Lean, Lake, or Elan executable is installed locally. Status remains SOURCE-MATCHED, not
  ELABORATED; transitive axiom dependencies were not rechecked.

## RESUME HERE

Reconstruct pinned Mathlib `factorsThrough_iff_ker_unitsMap` itself, including the two uses of
surjectivity: factorization implies kernel triviality by evaluation, while kernel triviality creates
the lower-level homomorphism with `MonoidHom.liftOfSurjective`. Preserve the unit-hom/Dirichlet-
character equivalence and explain exactly where nonzero level is required.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
