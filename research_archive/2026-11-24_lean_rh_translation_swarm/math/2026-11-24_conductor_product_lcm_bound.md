# MATH lane — conductor of a product divides the LCM of the conductors

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of Mathlib theorem
`conductor_mul_dvd_lcm_conductor` and its exact use in the pinned RH source.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source ledger

The RH source revision is `40e56bab026552e089d7afcfeff08d2defb9c005`. Its
`lake-manifest.json` (blob `b4d1ec31575a26b2159ec3a262b482bc051f3f6f`) pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem, conductor set, primitive character and change-level identities |
| `Mathlib/NumberTheory/MulChar/Basic.lean` | `dc3c465d304326784909c686d278edfa30a75385` | inverse and commutative-group structure on multiplicative characters |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | immediate RH consumer `prim_mul` |

The current Mathlib default branch also contains the same named theorem, but this reconstruction
uses only the manifest-pinned revision. No equivalence of elaborated terms across revisions is
claimed.

## 1. Exact theorem, including the zero-level case

Let `R` be any type with `[CommMonoidWithZero R]`, let `n : Nat`, and let
`chi, psi : DirichletCharacter R n`. There is no `Nontrivial R`, ring, field, or `[NeZero n]`+hypothesis. The theorem is

    (chi * psi).conductor | lcm(chi.conductor, psi.conductor).

In source notation:

    conductor_mul_dvd_lcm_conductor (chi psi : DirichletCharacter R n) :
      (chi * psi).conductor | lcm(chi.conductor, psi.conductor)

The proof starts with `eq_zero_or_neZero n`.

- If `n=0`, `conductor_eq_zero_iff_level_eq_zero` makes the three relevant conductors zero.
  The goal is `0 | lcm(0,0)=0`, discharged by simplification. This branch is absent from the
  earlier informal account and must not be hidden by silently installing `[NeZero n]`.
- Henceforth `[NeZero n]` is available, so the conductor-set divisibility characterization may be
  used.

## 2. The factor-through witness at the LCM

Put

    c_chi = conductor(chi),  c_psi = conductor(psi),
    L = lcm(c_chi,c_psi).

Each conductor divides the common level `n`. Therefore

    L | n

by `Nat.lcm_dvd chi.conductor_dvd_level psi.conductor_dvd_level`.

For nonzero `n`, `mem_conductorSet_iff_conductor_dvd` says, for every `d|n`,

    d is in conductorSet(theta)  iff  conductor(theta) | d.

Thus it suffices to exhibit that `chi*psi` factors through level `L`. The witness is not an
abstract existence argument. Take the primitive lower-level characters

    chi0 = chi.primitiveCharacter       at level c_chi,
    psi0 = psi.primitiveCharacter       at level c_psi,

lift each to `L`, and multiply there. In Mathlib this lower-level character is

    DirichletCharacter.mul chi0 psi0
      = changeLevel(c_chi | L, chi0) * changeLevel(c_psi | L, psi0),

whose declared level is exactly `lcm(c_chi,c_psi)=L`.

Now lift this product from `L` to `n`. Since `changeLevel` is a monoid homomorphism,

    changeLevel(L|n, chi0 lifted to L * psi0 lifted to L)
      = changeLevel(L|n, chi0 lifted to L)
        * changeLevel(L|n, psi0 lifted to L).

Transitivity of `changeLevel` turns the two factors into the direct lifts from their conductors to
`n`. Finally `changeLevel_primitiveCharacter` identifies those direct lifts with `chi` and `psi`.
Consequently the lifted lower-level product is exactly `chi*psi`. This supplies

    L in conductorSet(chi*psi),

and the conductor-set equivalence gives `conductor(chi*psi) | L`.

This is the entire mathematical content of the short source proof. It is a universal upper bound:
it does not assert equality, and it allows cancellation of local character components.

## 3. Why inverse multiplication recovers a character

The RH consumer applies the bound to `(A*B)` and `B^-1`. The rewrite

    (A*B) * B^-1 = A

uses the `CommGroup (MulChar R R')` instance, not cancellation in the scalar target at every
residue. Mathlib defines the inverse character by totalized inverse on values. It then proves
`MulChar.inv_mul` by extensionality:

- on a unit of the domain, the character value is a unit of the target, so its totalized inverse
  multiplies it to one;
- on a nonunit, every multiplicative character, including the trivial character, has value zero.
  Hence the product and the character-group identity both evaluate to zero there.

These two cases make multiplicative characters a genuine commutative group even though their
pointwise values live in a monoid with zero. Thus `mul_inv_cancel_right` is valid as an equality of
characters. It does **not** claim `0 * 0^-1 = 1` in the scalar target; at a nonunit both sides of the
character equality are zero.

Also `conductor_inv B = conductor B`. This follows from the two applications of
`conductor_zpow_dvd`: inverse cannot have a larger conductor than `B`, and applying the same fact
to the double inverse gives the reverse divisibility.

## 4. Exact downstream use in `prim_mul`

The private RH lemma assumes natural levels `N,m,n`, `[NeZero N]`, divisibilities `m|N` and `n|N`,
`Coprime(m,n)`, the equality `N=m*n`, and primitive complex characters `chi1` and `chi2` of levels
`m` and `n`. Let

    A = changeLevel(m|N, chi1),
    B = changeLevel(n|N, chi2),
    c = conductor(A*B).

Primitivity and conductor invariance under change of level give `conductor(A)=m` and
`conductor(B)=n`.

Apply the product bound to `(A*B, B^-1)`. The character-group identity and inverse-conductor
identity give

    m = conductor(A) | lcm(c,n).

Since `lcm(c,n) | c*n`, one gets `m | c*n`; coprimality removes the factor `n`, yielding `m|c`.
Swapping `A` and `B` gives `n|c`. Coprimality then combines these into `m*n|c`, hence `N|c`.
Every conductor divides its declared level, so also `c|N`. Antisymmetry proves `c=N`, exactly the
primitivity of `A*B`.

The coprimality premise is used only after the general LCM theorem. Without it, `m|c*n` does not
imply `m|c`; for example `m=n=3,c=1`.

## 5. Correction to the existing interpretation

The earlier MATH report correctly used the resulting divisibility chain, but compressed the
imported theorem to “the conductor of a product divides the LCM.” The missing details are now
fixed:

1. the theorem is valid even at level zero and has no hidden nontriviality or field premise;
2. the proof constructs the exact lower-level product of the two primitive characters and lifts it
   through the LCM;
3. inverse cancellation is character-group cancellation, with the nonunit case `0=0`, not illicit
   scalar cancellation of zero;
4. the bound can be strict. For a nontrivial quadratic character `eta` of conductor `p`,
   `eta*eta^-1=1` has conductor `1`, while `lcm(p,p)=p`.

This contribution does not repeat the Jacobi evaluation, `twist_prim`, `ind_drop`, or
`ind_unique`; it closes only the imported conductor inequality and its immediate use.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_product_lcm_bound.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_product_lcm_bound.py

Observed output:

    conductor product LCM regression: OK; report_checks=9, character_checks=30, fibre_checks=340, product_checks=340, inverse_checks=19386, euclid_checks=10738, negative_controls=5

The standard-library certificate recovers conductors from the factor-through condition for every
quadratic character generated by the first one through four primes in `(3,5,7,11)`. It then checks
every ordered product, every divisor-level fibre, and the character inverse identity at every
residue, including nonunits. It separately exhausts the Euclid removal step for integers through
60 and executes strictness, reversed-divisibility, nonunit, noncoprime and zero-level controls.

This finite quadratic family is an independently checkable regression, not a proof for arbitrary
`CommMonoidWithZero R`. It does not elaborate the Lean source or audit transitive axioms.

## Failed attempts / limitations

- Treating the theorem as equality fails when local factors cancel; the quadratic inverse control
  gives conductor `1` below the LCM `p`.
- Reversing the divisibility fails in the same example.
- Explaining `(A*B)B^-1=A` by scalar cancellation fails on nonunits; the valid proof compares two
  multiplicative characters, both zero there.
- Omitting the `n=0` source branch strengthens the imported hypotheses without justification.
- The finite certificate covers squarefree quadratic characters only. It does not establish the
  theorem over arbitrary targets or replace the pinned Lean term.
- No Lean, Lake, or Elan executable is installed locally. Status is SOURCE-MATCHED, not ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `conductor_zpow_dvd` and `conductor_inv`, preserving the zero-level
branch and the double-inverse reverse-divisibility argument. Connect only their exact use in
`prim_mul`; do not repeat the LCM factor-through construction or the Jacobi twist evaluation.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
