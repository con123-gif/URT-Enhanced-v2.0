# MATH lane — gcd descent from equality at the product level

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED line-by-line reconstruction of pinned Mathlib
`DirichletCharacter.factorsThrough_gcd`, including the generalized Chinese-remainder witness and
both character evaluations.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, axiom census,
or proof of RH.

## Source ledger

Required RH revision: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem, factor-through kernel criterion, change-level evaluation |
| `Mathlib/Data/Nat/ModEq.lean` | `1ffd68b0527a5bd6d04b77b323b024bc9c0aba83` | generalized `Nat.chineseRemainder'` for possibly noncoprime moduli |
| `Mathlib/Data/ZMod/Basic.lean` | `9049c491aa452af92b1833707270bc914c7d0d4e` | `unitOfCoprime`, `coe_unitOfCoprime`, `isUnit_iff_coprime` |
| `Mathlib/Data/ZMod/Units.lean` | `c93c732e5bedd18aadd8cab7b9baf139bfb41553` | `unitsMap_val` used to translate kernel membership |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | downstream RH `prim_mul`, via conductor gcd closure and product bounds |

At the fresh 2026-11-25 upstream check, RH HEAD was
`27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59`; its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` still pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`. The current Dirichlet-character Basic blob is
`a954549811e3e87c5f4e85b5d37f359ddfc83a81`, and direct extraction found this theorem text
unchanged. This is a source-text comparison, not elaborated-term equivalence.

## 1. Exact theorem, quantifiers, and asymmetry

Let `R` have `[CommMonoidWithZero R]`. Let `n,m : Nat`, assume **only** `[NeZero n]`, and take

    chi : DirichletCharacter R n,
    psi : DirichletCharacter R m.

Suppose their lifts to the product level agree:

    changeLevel(n | n*m, chi)
      = changeLevel(m | n*m, psi).                        (1)

Then

    chi.FactorsThrough(gcd(n,m)).                         (2)

There is no `[NeZero m]`, `Nontrivial R`, ring, field, primality, or coprimality hypothesis. The
conclusion is deliberately asymmetric: it descends `chi`, the first and known-nonzero-level
character. The theorem does not state an equality of conductors.

## 2. Reduce factorization to a unit-kernel calculation

Because `gcd(n,m)|n`, the already reconstructed criterion gives

    chi.FactorsThrough(gcd(n,m))
      <-> ker(unitsMap(n -> gcd(n,m))) <= ker(chi.toUnitHom).  (3)

Take

    x : Units(ZMod n)

in the kernel on the right of (3). The goal is

    chi.toUnitHom(x) = 1 in Units R.                      (4)

After applying `MonoidHom.mem_ker`, `Units.ext_iff`, `MulChar.coe_toUnitHom`, and
`Units.val_one`, Lean reduces (4) to equality of the underlying values in `R`.

The kernel hypothesis says that reducing `x` modulo `gcd(n,m)` gives the unit `1`. Via
`ZMod.unitsMap_val`, `ZMod.natCast_val`, and `ZMod.natCast_eq_natCast_iff`, this is exactly

    x.val.val == 1  (mod gcd(n,m)),                       (5)

where `x.val : ZMod n` and `x.val.val : Nat` is its canonical natural representative.

## 3. The generalized Chinese-remainder representative

The pinned definition

    Nat.chineseRemainder' :
      a == b (mod gcd(n,m))
        -> {z : Nat // z == a (mod n) and z == b (mod m)}

does **not** require `n` and `m` to be coprime. Apply it to (5), with `a=x.val.val` and `b=1`.
It yields a natural number `z` satisfying

    z == x.val.val (mod n),                              (6)
    z == 1         (mod m).                              (7)

The two `ZMod.natCast_eq_natCast_iff` rewrites turn these congruences into the exact equalities used
later:

    (z : ZMod n) = x.val,                                (8)
    (z : ZMod m) = 1.                                    (9)

This is why the kernel condition uses `gcd(n,m)`: it is precisely the compatibility condition for
the two requested residues. A unit `x` outside that kernel need not admit any such `z`.

## 4. Why `z` is a unit at the product level

Equation (8) identifies the residue of `z` modulo `n` with the unit `x`, so

    Coprime(z,n).                                         (10)

Equation (9) identifies its residue modulo `m` with the unit `1`, so

    Coprime(z,m).                                         (11)

Lean obtains (10) and (11) through `ZMod.isUnit_iff_coprime`; it then applies
`Nat.Coprime.mul_right` to get

    Coprime(z,n*m).                                       (12)

Consequently the pinned constructor

    ZMod.unitOfCoprime z (12) : Units(ZMod (n*m))         (13)

is available. The proof has not assumed that every CRT solution is a unit: it derives unit status
from the two particular residues (8) and (9).

## 5. Evaluate the product-level equality at that unit

Let `u` be the unit in (13). The first use of

    changeLevel_eq_cast_of_dvd chi (n | n*m) u

says that evaluating the left side of (1) at `u` equals evaluating `chi` at the cast of `u` to
`ZMod n`. After simplifying `coe_unitOfCoprime` and `cast_natCast`, this becomes

    changeLevel(chi)(u) = chi(z mod n) = chi(x),          (14)

where the final equality is (8).

Rewrite (14) backwards, then use hypothesis (1). This converts the goal `chi(x)=1` into

    changeLevel(psi)(u) = 1.                              (15)

The second use

    changeLevel_eq_cast_of_dvd psi (m | n*m) u

gives

    changeLevel(psi)(u) = psi(z mod m) = psi(1) = 1.      (16)

Here the middle equality is (9), and the last is `map_one`. Equations (14)–(16) prove (4) for every
kernel unit `x`; criterion (3) then returns the factorization in (2).

## 6. The second level may be zero

The absence of `[NeZero m]` is genuine, not an omitted premise. If `m=0`, then `ZMod 0` is the
integers and (9) is literal integer equality `z=1`. Also `gcd(n,0)=n`, so the kernel in (3) is
trivial and the conclusion says only that `chi` factors through its own level. The construction
chooses `z=1`, which is coprime to `n*0=0` because `gcd(1,0)=1`.

Thus no nonzero-target injectivity is being smuggled into this theorem. The nonzero premise is on
the first level because the kernel criterion and units-map surjectivity are used to descend that
first character.

## 7. Downstream use and correction of the previous interpretation

`conductor_dvd_of_mem_conductorSet` applies this theorem with `chi0` at factor level `d` as the
first character and `chi.primitiveCharacter` at conductor level `c` as the second. It first proves
their lifts agree at `d*c`; this theorem then produces a character at `gcd(d,c)`. Transitivity lifts
that witness back to the original level, making the conductor set gcd closed. Minimality and
`Nat.gcd_eq_right_iff_dvd` finally yield `c|d`.

The previous checkpoint correctly named CRT as the internal mechanism but omitted three important
details now restored: the CRT is the noncoprime `chineseRemainder'`; compatibility is exactly the
kernel congruence modulo the gcd; and no nonzero hypothesis is present on `m`. The previous
conductor report's invocation remains correct because its first level `d` was separately proved
nonzero.

This chain feeds `mem_conductorSet_iff_conductor_dvd`, `conductor_changeLevel`, product and power
conductor bounds, and finally pinned RH `prim_mul`. It is a Mathlib arithmetic dependency of that RH
consumer, not a standalone proof of the character-box or RH conclusions.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_gcd_crt.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_factors_through_gcd_crt.py

Observed output:

    factorsThrough_gcd CRT regression: OK; report_checks=8, level_pairs=210, common_lift_pairs=344, kernel_units=960, crt_witnesses=960, coprimality_checks=2880, evaluation_chains=960, gcd_factorizations=344, zero_second_level_pairs=64, negative_controls=4

The exact checker enumerates `C_60`-valued unit characters for `1<=n<=14` and `0<=m<=14`, groups
pairs whose lifts to `n*m` agree, constructs every required CRT witness, and checks its two
residues, three coprimality statements, both change-level evaluations, kernel conclusion, and the
resulting gcd factorization. Formal level zero is represented by the actual integer unit group
`{+1,-1}`, not an empty residue range.

This is an independently checkable finite regression of the proof skeleton, not a universal proof
for arbitrary coefficient monoids, Lean elaboration, or axiom audit.

## Failed attempts / limitations

- Without the kernel congruence, the CRT residues can be inconsistent: no `z` is simultaneously
  `2 mod 5` and `1 mod 10`.
- Without equality of common lifts, a nontrivial character modulo 5 need not factor through
  `gcd(5,2)=1`.
- Congruence only to `x` modulo `n` is insufficient: the second congruence is what reduces the
  `psi` evaluation to `map_one`.
- Treating `Units(ZMod 0)` as `range(0)` would erase its two genuine units and make zero-level tests
  vacuous. The checker handles this edge explicitly.
- The checker stops at levels 14 and target group `C_60`; it does not prove the polymorphic theorem.
- No Lean, Lake, or Elan executable was available locally. Status remains SOURCE-MATCHED, not
  ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `FactorsThrough.mono` line by line from
`factorsThrough_iff_ker_unitsMap`, expanding `ZMod.unitsMap_comp` and the exact direction of kernel
transport for `d|m|n`; then connect it without abbreviation to the reverse implication of
`mem_conductorSet_iff_conductor_dvd`.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
