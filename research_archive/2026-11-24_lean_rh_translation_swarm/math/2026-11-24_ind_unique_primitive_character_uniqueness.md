# MATH lane — `QH.ind_unique`: primitive-character uniqueness from common-level agreement

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of pinned `QH.ind_unique`, including the imported
`factorsThrough_gcd` CRT argument.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a proof
of RH.

## Source pin and exact dependency

The project source is `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Source | Git blob | Use |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean` | `d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e` | theorem reconstructed |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean` | `1fc497069c8499edef750d4264a106e442dcb1ef` | immediate downstream consumer |
| `lake-manifest.json` | `b4d1ec31575a26b2159ec3a262b482bc051f3f6f` | pins Mathlib to `0df444a360eaa60ab8c11dca51a86af692955474` |
| Mathlib `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` at that revision | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | `changeLevel`, conductor, primitivity, `factorsThrough_gcd` |

The earlier `ind_drop` chapter treated `ind_unique` honestly as an imported proved theorem. This
chapter discharges that explanatory gap without changing its premises.

## 1. Exact theorem and quantifiers

For every natural `N,N',M`, with typeclass hypotheses `NeZero N` and `NeZero N'`, and every
pair

`psi : DirichletCharacter C N`,  
`psi' : DirichletCharacter C N'`,

assume:

1. `M != 0`;
2. `psi.IsPrimitive`, meaning `psi.conductor=N`;
3. `psi'.IsPrimitive`, meaning `psi'.conductor=N'`;
4. for every natural `n`, if `Coprime(n,M)), then
   `psi(n mod N)=psi'(n mod N')`.

Then

`⟨N,psi⟩ = ⟨N',psi'⟩ : Sigma (fun r => DirichletCharacter C r)`.

The conclusion identifies both the level and the character after dependent transport. It is not
merely equality of values on a finite sample. The nonzero hypothesis on `M` is retained even though
`M` is not a character level.

## 2. Lift both characters to one nonzero level

Set `L=N*N'*M`. Nonzeroness of `N,N',M` gives `L!=0`, so change-level injectivity is available.
The source records the divisibilities

`N|L`, `N'|L`, `M|L`, `N*N'|L`, and `N'*N|L`.

Claim:

`psi.changeLevel(N|L) = psi'.changeLevel(N'|L)`.

To prove it, extensionality reduces equality of Dirichlet characters to their values on an arbitrary
unit `a` of `ZMod L`. Its natural representative `a.val` is coprime to `L`; since `M|L`,
it is also coprime to `M). The hypothesis therefore gives

`psi(a.val mod N)=psi'(a.val mod N')`.

`changeLevel_eq_cast_of_dvd`, together with the natural-cast identities, says these two values are
exactly the values of the lifted characters at `a`. This proves the claim. The proof uses only
integers represented by units at level `L`; it does not extend the original hypothesis to
non-coprime integers.

## 3. Remove the auxiliary factor `M`

The previous equality lives at `N*N'*M`, but `factorsThrough_gcd` expects equality at the product
level. Change-level injectivity removes the last factor:

`k1 : psi.changeLevel(N|N*N') = psi'.changeLevel(N'|N*N')`.

Indeed, lift both sides of `k1` from `N*N'` to `L); transitivity of `changeLevel` turns the
result into the established common-level equality.

The proof constructs the reversed ordered-product version separately:

`k2 : psi'.changeLevel(N'|N'*N) = psi.changeLevel(N|N'*N)`.

It lifts to `L`, uses the ring identity `N'*N*M=N*N'*M`, and applies the symmetric common-level
equality. Although multiplication is commutative arithmetically, the two dependent character types
and divisibility proofs are not definitionally interchangeable; the source keeps both transports
explicit.

## 4. What `factorsThrough_gcd` actually proves

Mathlib defines `psi.FactorsThrough d` to mean that there exist `d|N` and a character of level
`d` whose change of level equals `psi`. From `k1`,

`f1 : psi.FactorsThrough(gcd(N,N'))`;

from `k2`,

`f2 : psi'.FactorsThrough(gcd(N',N))`.

This is not a black-box appeal. At the pinned Mathlib revision,
`factorsThrough_gcd` proves a kernel inclusion for the unit map

`(ZMod N)^* -> (ZMod gcd(N,N'))^*`.

Take a unit `x` in its kernel, so `x ≡ 1 mod gcd(N,N')`. The generalized Chinese remainder
theorem, invoked in the source as `Nat.chineseRemainder'`, produces a natural `z` satisfying

`z ≡ x mod N`, and `z ≡ 1 mod N'`.

Because `x` is a unit modulo `N` and `1` is a unit modulo `N'`, `z` is coprime to
`N*N'`. Equality of the two product-level lifts gives

`psi(x)=psi(z)=psi'(z)=psi'(1)=1`.

Thus every kernel element is killed by `psi`; the kernel criterion
`factorsThrough_iff_ker_unitsMap` supplies factorization through the gcd. Swapping the characters
gives the reverse factorization. This CRT step is the mathematical content behind the imported
theorem name.

## 5. Primitivity forces equality of levels

The conductor is Mathlib's `sInf` of all levels through which a character factors. Therefore
`f1` and `f2` give

`psi.conductor <= gcd(N,N')`,  
`psi'.conductor <= gcd(N',N)`.

Primitivity substitutes `psi.conductor=N` and `psi'.conductor=N'`, so

`N <= gcd(N,N') <= N`,  
`N' <= gcd(N',N) <= N'`.

Consequently

`gcd(N,N')=N`, and `gcd(N',N)=N'`.

Using commutativity of gcd yields `N=N'`. Both directions are essential. The first alone says
`gcd(N,N')=N`, equivalently `N|N'`; for example `N=2,N'=4` satisfies it without equality.
The second supplies the reverse divisibility.

## 6. Recover the character and the sigma equality

After substituting `N'=N`, `k1` states that the two characters become equal after changing both
from level `N` to level `N*N`. Since this change-level map is injective, `psi=psi'`.
Substitution reduces the dependent pairs to the same constructor, and `rfl` proves

`⟨N,psi⟩ = ⟨N,psi⟩`.

This final route explains why the theorem returns sigma equality rather than trying to state ordinary
equality between characters whose levels may initially differ.

## Downstream link and correction

`QH.ind_drop` calls `ind_unique` with

`N' = xi.conductor*q`, and `M_comparison = M*N0*q`.

Its preceding proof establishes agreement only on integers coprime to that comparison modulus.
`ind_unique` then forces the unknown primitive level `N` to equal `xi.conductor*q` and transports
`chi` to the canonical primitive Jacobi twist. The earlier explanation was correct about this
dependent identification; the present reconstruction corrects any impression that pointwise
agreement itself makes differently typed characters definitionally equal.

## Executed certificate

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_unique_primitive_character_uniqueness.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_unique_primitive_character_uniqueness.py
```

The certificate validates the pinned source/blob ledger and required proof anchors; exhaustively
checks the common-level coprimality restriction; constructs every compatible CRT witness over a
finite deterministic grid; checks the two-gcd equality implication; and includes negative controls
showing that one gcd direction, `M=0`, or unrestricted evaluations are insufficient.

These checks validate the finite arithmetic skeleton. They do not replay Lean, prove character
extensionality, or replace Mathlib's kernel theorem.

## Failed attempts / limitations

- A one-direction proof through `f1` stops at `N|N'`; the concrete pair `2,4` is a counterexample
  to concluding equality.
- Taking `M=0` makes `L=N*N'*M=0`, so the needed `NeZero L` instance and change-level
  injectivity are unavailable.
- The source hypothesis does not cover arbitrary integers; the proof must first represent a unit at
  level `L`, whose value is coprime to `M`.
- Treating `N*N'` and `N'*N` as definitionally identical obscures the required dependent
  transports; the pinned proof constructs `k1` and `k2` separately.
- No local Lean checkout or compiled `.olean` graph was available, so no kernel replay or axiom
  census is claimed. This reconstruction relies on the pinned source proofs and Mathlib revision
  recorded above.

## RESUME HERE

Reconstruct pinned Mathlib `changeLevel_injective` and the exact unit-map surjectivity argument used
by `QH.ind_unique`: preserve the nonzero target-level requirement, the lift from unit-group equality
to Dirichlet-character equality, and the distinction between source-level and target-level units.
Do not repeat `ind_unique`, `ind_drop`, or the completed `pairEx` assembly.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
