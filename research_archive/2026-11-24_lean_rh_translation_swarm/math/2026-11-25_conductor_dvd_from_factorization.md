# MATH lane — factorization level is a multiple of the conductor

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED line-by-line reconstruction of pinned Mathlib
`conductor_dvd_of_mem_conductorSet`, including its gcd descent and nonzero common-level
injectivity step.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, axiom census,
or proof of RH.

## Source ledger

Required RH revision: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem; conductor set; `factorsThrough_gcd`; `changeLevel_injective` |
| `Mathlib/Data/ZMod/Units.lean` | `c93c732e5bedd18aadd8cab7b9baf139bfb41553` | surjectivity behind nonzero-level `changeLevel_injective` |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | downstream RH consumer `prim_mul` through conductor lemmas |

A fresh upstream check on 2026-11-25 found RH HEAD
`fcb6eac7534875d32d68030967e2deae6d686151`. Its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` still pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; current Dirichlet-character Basic blob
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`. Direct extraction and diff found the complete theorem
text below unchanged. This is textual comparison, not equality of elaborated proof terms.

## 1. Exact statement and all hypotheses

Fix a type `R` with `[CommMonoidWithZero R]`, naturals `n,d`, and

    chi : DirichletCharacter R n.

Assume `[NeZero n]` and

    hd : d in chi.conductorSet.

By definition, `hd` says that there are a proof `d|n`, a character
`chi0 : DirichletCharacter R d`, and an equality

    chi = changeLevel(d|n, chi0).                         (1)

The theorem concludes

    chi.conductor | d.                                   (2)

There is no ring, field, `Nontrivial R`, primality, coprimality, positivity, or preselected
primitive-character premise. Write `c = chi.conductor` below.

## 2. Line 1: membership forces the factor level to be nonzero

The proof first installs `[NeZero d]`. If `d=0`, then membership gives `0|n`; because `n!=0`, this
is impossible. Lean packages the contradiction through

    zero_ne_mem_conductorSet chi : 0 notin chi.conductorSet.

This step is not cosmetic. Both `factorsThrough_gcd` and the later injectivity argument need a
nonzero ambient source or target level. It also prevents the degenerate formal level zero from
entering the conductor-set minimum.

## 3. Reduce divisibility to gcd closure of the conductor set

The proof declares it sufficient to establish

    gcd(d,c) in chi.conductorSet.                         (3)

Suppose (3). Because `c` is the natural-number infimum of `chi.conductorSet`, `Nat.sInf_le` gives

    c <= gcd(d,c).                                       (4)

Universally `gcd(d,c) <= c`. Lean uses the strict form needed by its contraposition: if `c` did not
divide `d`, then

    gcd(d,c) != c                                        (5)

by the **right-oriented** equivalence

    Nat.gcd_eq_right_iff_dvd : gcd(d,c)=c <-> c|d.       (6)

The bound `gcd(d,c)<=c`, together with (5), gives `gcd(d,c)<c`, contradicting (4). The call
`Nat.gcd_le_right d (...)` requires `c>0`; this is supplied by `conductor_ne_zero chi`, itself a
consequence of `[NeZero n]` and `c|n`. Thus the conclusion is exactly `c|d`, not `d|c`.

This explains why the theorem is stronger than the bare least-element statement `c<=d`.
Inequality alone does not imply divisibility; gcd closure is the missing arithmetic structure.

## 4. Unpack the given factorization

Lean next destructs `hd` into the three pieces already displayed in (1):

    hd  : d|n,
    chi0 : DirichletCharacter R d,
    hchi0 : chi = changeLevel(hd,chi0).                   (7)

The conductor factorization supplies independently

    c|n,
    primitiveCharacter : DirichletCharacter R c,
    changeLevel(c|n,primitiveCharacter) = chi.            (8)

To invoke `factorsThrough_gcd chi0 primitiveCharacter`, the source requires equality of those two
characters after lifting to the product level `d*c`:

    changeLevel(d|d*c,chi0)
      = changeLevel(c|d*c,primitiveCharacter).            (9)

Notice the theorem is called with the **d-level** character as its first argument. Its conclusion
is therefore initially that `chi0` factors through `gcd(d,c)`, not directly that `chi` does.

## 5. Why equality at `d*c` holds

Equation (9) is the difficult step. The two known equalities (7) and (8) live at level `n`, while
`d*c` need not divide `n` and `n` need not divide `d*c`. The source does not identify these levels
or silently cancel them.

Instead it uses the further common multiple

    M = d*c*n.                                            (10)

Since `d!=0`, `c!=0`, and `n!=0`, Lean constructs `[NeZero M]`. It then applies

`changeLevel_injective` to the divisibility `d*c | M`. Therefore it is enough to prove equality
after both sides of (9) are lifted from `d*c` to `M`.

For the left side, `changeLevel_trans` rewrites the path

    d -> d*c -> M

as the path

    d -> n -> M.

At level `n`, (7) replaces the lift of `chi0` by `chi`. For the right side, transitivity rewrites

    c -> d*c -> M

as

    c -> n -> M,

and (8), namely `changeLevel_primitiveCharacter`, again replaces the intermediate lift by `chi`.
Both final characters are thus the same lift of `chi` from `n` to `M`.

The Lean `rw` block also normalizes the multiplication associations and the proposition-valued
divisibility witnesses. The mathematics is equality of the two composites just described; it does
not introduce a numerical identification between `n` and `d*c`.

Injectivity at a nonzero multiple is backed by surjectivity of

    Units(ZMod M) -> Units(ZMod (d*c)).

Consequently equality after the lift to `M` reflects equality at `d*c`, establishing (9).

## 6. `factorsThrough_gcd` and the return to the original character

The exact supplier has the contract

    factorsThrough_gcd (alpha at level a) (beta at level b)
      (their lifts to a*b agree)
      : alpha.FactorsThrough(gcd(a,b)),                   (11)

under `[NeZero a]`. Internally it uses the kernel criterion and a Chinese-remainder representative;
that internal CRT proof is not re-proved in this contribution.

Applying (11) to `chi0`, `primitiveCharacter`, and (9) produces

    chi1 : DirichletCharacter R gcd(d,c),
    chi0 = changeLevel(gcd(d,c)|d,chi1).                  (12)

Compose (12) with (7). `changeLevel_trans` gives

    chi = changeLevel(gcd(d,c)|n,chi1).                   (13)

The divisor in (13) is the explicit composite

    gcd(d,c)|d|n.

Thus (13) is precisely membership (3). Section 3 now yields `c|d`, completing the theorem.

## 7. Comparison with the prior interpretation and downstream link

The previous MATH conductor report correctly identified a gcd closure argument but compressed two
points that are now corrected:

1. `factorsThrough_gcd` first descends `chi0` at level `d`; only transitivity returns that witness to
   `chi` at level `n`.
2. The source proves (9) by lifting to the specifically nonzero level `d*c*n` and then invoking
   injectivity. It does not infer equality at `d*c` directly from the two factorizations at `n`.

The immediate next theorem is

    mem_conductorSet_iff_conductor_dvd (hd:d|n) :
      d in chi.conductorSet <-> c|d.

Its forward direction is this theorem. Its reverse direction uses `factorsThrough_conductor` and
`FactorsThrough.mono`. `conductor_changeLevel`, the power and product conductor bounds, and pinned
RH `prim_mul` then consume this divisibility characterization. Formal level is never substituted
for conductor.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_dvd_from_factorization.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_dvd_from_factorization.py

Observed output:

    conductor divisibility regression: OK; report_checks=8, characters=90, factor_levels=159, gcd_descents=159, product_equalities=159, common_level_equalities=159, injectivity_checks=159, divisibility_checks=159, negative_controls=4

The exact checker enumerates all `C_60`-valued characters of `Units(ZMod n)` for `1<=n<=18`.
For every character and every divisor level through which it actually factors, it recovers the
conductor as the least fibre-constant divisor, constructs the lower characters, checks descent to
`gcd(d,c)`, equality at `d*c`, equality after the further lift to `d*c*n`, unit-map surjectivity for
the injectivity step, the minimality squeeze, and the final orientation `c|d`.

This is an independently checkable finite regression of the proof skeleton. It is not a universal
proof for arbitrary coefficient monoids, a Lean elaboration, or an axiom audit.

## Failed attempts / limitations

- Replacing gcd closure by the inequality `c<=d` fails: `3<=4` but `3` does not divide `4`.
- An abstract factor-level set `{3,4}` has least element `3` and contains `4`, but is not gcd closed;
  therefore least membership alone cannot prove divisibility.
- Dropping the nonzero common target invalidates injectivity. At formal level zero, the exponent-1
  and exponent-3 characters modulo 5 agree on the only integer units `+/-1` while remaining distinct.
- Membership at `d=0` is impossible when `n!=0`; ignoring this makes the later nonzero instances
  unavailable.
- The checker uses positive levels at most 18 and `C_60` values. It does not prove the polymorphic
  theorem.
- No Lean, Lake, or Elan executable was available locally. The result remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `factorsThrough_gcd` line by line, expanding the exact
`Nat.chineseRemainder'` representative, the two coprimality proofs that make a unit at level `n*m`,
and the two `changeLevel_eq_cast_of_dvd` evaluations. Preserve its asymmetric conclusion: it proves
factorization of the first character through `gcd(n,m)`.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
