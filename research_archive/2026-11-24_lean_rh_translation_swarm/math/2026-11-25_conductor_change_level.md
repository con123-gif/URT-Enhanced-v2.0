# MATH lane — changing to a nonzero multiple preserves conductor

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED reconstruction of Mathlib `conductor_changeLevel` and its two exact uses
in RH `prim_mul`.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a proof
of RH.

## Source ledger

The RH revision is `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem and its conductor-set, transitivity and injectivity suppliers |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | immediate consumer `prim_mul` |

At current RH head `9282d3a102c4aff0e6026746db2a8990f5d9cddd`, Mathlib is pinned instead to
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; the corresponding Basic blob is
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`. Direct comparison found the
`conductor_changeLevel` body unchanged. The current RH consumer blob
`4564722f96a5e2ca86092fb039e127a77a950c34` retains the same two calls. This is source-text
comparison, not elaborated-term equivalence.

## 1. Exact theorem and hypotheses

Let `R` be any type with `[CommMonoidWithZero R]`, let `n,m : Nat`, let
`chi : DirichletCharacter R n`, assume `[NeZero m]`, and let `hm : n|m`. Then

    conductor_changeLevel (hm) :
      conductor(changeLevel(hm,chi)) = conductor(chi).

There is no `Nontrivial R`, ring, field, primality or coprimality premise. The nonzero hypothesis is
on the **target level** `m`. Since `n|m` and `m!=0`, it follows that `n!=0`; the proof installs
`[NeZero n]` internally.

Write

    psi = changeLevel(hm,chi),
    c   = conductor(chi),
    C   = conductor(psi).

The proof establishes `C|c` and `c|C`, then applies divisibility antisymmetry.

## 2. Why conductor-set membership yields divisibility

The supplier `conductor_dvd_of_mem_conductorSet` says that at nonzero level, if a character factors
through `d`, then its conductor divides `d`. This is stronger than the bare fact that the conductor
is the numerical infimum of the conductor set: a numerical inequality alone would not imply
divisibility.

The source proves the stronger statement by showing the character also factors through
`gcd(d,c)`, where `c` is its conductor. The lower-level character at `d` and the primitive character
at `c` become equal after lifting to a common multiple; injectivity at a further nonzero level
justifies that equality. `factorsThrough_gcd` then supplies a character at `gcd(d,c)`. Minimality of
`c` gives `c<=gcd(d,c)`, while always `gcd(d,c)<=c`; hence `gcd(d,c)=c`, which is equivalent to
`c|d`. Membership also forces `d!=0`, so the injectivity invocation is legitimate.

This imported supplier is used twice below, once for each direction. No equality of formal levels is
substituted for its argument.

## 3. First direction: the lifted conductor divides the old conductor

The original character factors through its conductor:

    changeLevel(c|n, chi.primitiveCharacter) = chi.       (1)

Because `c|n|m`, the lifted character `psi` also factors through `c`, with the same lower-level
witness `chi.primitiveCharacter`. Indeed, `changeLevel_trans` and (1) give

    changeLevel(c|m, chi.primitiveCharacter)
      = changeLevel(n|m, changeLevel(c|n,chi.primitiveCharacter))
      = changeLevel(n|m,chi)
      = psi.

Thus `c` belongs to `psi.conductorSet`. Applying
`conductor_dvd_of_mem_conductorSet` to `psi` gives

    C | c.                                                (2)

This is the easy direction: a character already descending to level `c` continues to descend after
its formal level is enlarged.

## 4. Reverse direction: injectivity recovers the original character

From (2), `C|c`, and from `c|n`, so `C|n`. The candidate lower-level character is now

    psi.primitiveCharacter : DirichletCharacter R C.

To show that `chi` factors through `C`, the required equality at level `n` is

    chi = changeLevel(C|n, psi.primitiveCharacter).       (3)

The source does not assume (3). It applies `changeLevel_injective hm`, reducing (3) to equality
after lifting both sides from `n` to the nonzero level `m`.

The left lift is `psi` by definition. On the right, `changeLevel_trans` identifies the two-stage
lift `C -> n -> m` with the direct lift `C -> m`; by
`changeLevel_primitiveCharacter`, that direct lift is also `psi`. Therefore the two lifted
characters agree, and injectivity proves (3).

Consequently `C` belongs to `chi.conductorSet`, and the same conductor-set divisibility theorem
gives

    c | C.                                                (4)

Combining (2) and (4) proves `C=c`.

## 5. Why `changeLevel` is injective here

For `n|m` with `m!=0`, the unit map

    ZMod(m)^* -> ZMod(n)^*

is surjective (`ZMod.unitsMap_surjective`). If two lifted characters at level `m` agree, take any
unit `y` modulo `n`, choose a unit `z` modulo `m` mapping to it, and evaluate the lifted equality at
`z`. The definition of `changeLevel` then returns equality of the original characters at `y`.
`MulChar.ext_iff` says equality on all units is equality of multiplicative characters, including
their forced zeros on nonunits.

The target nonzero premise is essential. For the formal map from level `5` to level `0`, the target
unit group has only `+1` and `-1`; the order-four characters with exponents `1` and `3` agree on
both target units but are distinct modulo `5`. Thus the corresponding level-zero change map cannot
be injective.

## 6. Exact downstream link in `prim_mul`

The RH lemma has `[NeZero N]`, divisibilities `hm:m|N` and `hn:n|N`, and primitive characters
`chi1` at level `m` and `chi2` at level `n`. It defines their lifts

    A = changeLevel(hm,chi1),  B = changeLevel(hn,chi2).

The two calls

    rw [conductor_changeLevel]; exact h1
    rw [conductor_changeLevel]; exact h2

use the theorem above and the primitive hypotheses `h1:conductor(chi1)=m` and
`h2:conductor(chi2)=n` to obtain exactly

    conductor(A)=m,  conductor(B)=n.

These equalities feed the later inverse/LCM conductor argument. Merely knowing that `A` and `B`
have formal level `N` would not suffice and would generally be false as a conductor statement.

## 7. Comparison with the existing interpretation

Earlier MATH reports used `conductor_changeLevel` correctly but treated it as a one-line invariant.
The missing logical step was the reverse descent (3): it depends on injectivity after lifting to the
nonzero common level. The report now records the exact target-level hypothesis and explains why it
cannot be removed. It also distinguishes formal level from conductor; for example, a conductor-5
character lifted to level 55 still has conductor 5, not 55.

This contribution does not repeat the completed product-LCM, inverse-power, Jacobi evaluation or
Euclid arguments.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_change_level.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_change_level.py

Observed output:

    conductor changeLevel regression: OK; report_checks=9, character_checks=115, conductor_checks=230, fibre_checks=230, transitivity_checks=115, injectivity_checks=124, negative_controls=2

The exact finite model enumerates characters of small squarefree levels, represents values by exact
root-of-unity exponents, and recovers conductors solely from unit-fibre constancy. It checks
conductor equality before and after lifts, both factor-through memberships, transitivity and
injectivity. The level-zero collision and formal-level/conductor confusion are negative controls.

This is an independently checkable finite regression, not a proof over arbitrary targets, a Lean
kernel replay, or an axiom audit.

## Failed attempts / limitations

- The inequality `C|c` alone does not prove equality; the reverse factor-through construction and
  injectivity are indispensable.
- Treating the conductor as merely the least natural in the set gives `c<=d`, not automatically
  `c|d`; the gcd closure argument in `conductor_dvd_of_mem_conductorSet` supplies divisibility.
- Dropping `[NeZero m]` invalidates injectivity, as the level-5 to level-0 collision demonstrates.
- Confusing the lifted formal level with its conductor produces false equalities such as `55=5`.
- The finite checker uses squarefree products of small odd primes. It does not establish the
  universal theorem or replace the pinned Lean proof term.
- No Lean, Lake, or Elan executable is installed locally. Status remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `mem_conductorSet_iff_conductor_dvd` from
`conductor_dvd_of_mem_conductorSet` and `FactorsThrough.mono`, including the exact nonzero-level
hypothesis and the upward-closure argument used by the power and product conductor theorems.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
