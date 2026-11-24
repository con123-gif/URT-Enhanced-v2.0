# MATH lane — Mathlib \`changeLevel_injective\`: lifting every residue-class unit

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the injectivity theorem used three times by pinned
\`QH.ind_unique\`, including the arithmetic proof that the unit reduction map is surjective.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a proof
of RH.

## Source pin and theorem chain

The RH source is pinned at \`40e56bab026552e089d7afcfeff08d2defb9c005\`. Its
\`lake-manifest.json\` (blob \`b4d1ec31575a26b2159ec3a262b482bc051f3f6f\`) pins Mathlib to
\`0df444a360eaa60ab8c11dca51a86af692955474\`.

| Exact source | Blob | Declaration used |
|---|---|---|
| Mathlib \`Mathlib/NumberTheory/DirichletCharacter/Basic.lean\` | \`4569ebb8e61f683a9c89877f0cda4d3add4d766d\` | \`changeLevel\`, \`changeLevel_injective\` |
| Mathlib \`Mathlib/Data/ZMod/Units.lean\` | \`c93c732e5bedd18aadd8cab7b9baf139bfb41553\` | \`unitsMap\`, \`unitsMap_surjective\` |
| RH \`src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean\` | \`d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e\` | immediate project consumer |
| RH \`src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean\` | \`1fc497069c8499edef750d4264a106e442dcb1ef\` | downstream conductor-identification theorem |

The preceding MATH chapter reconstructed the whole \`ind_unique\` argument but left this Mathlib
injectivity result named rather than derived. This chapter fills exactly that gap.

## 1. Exact definitions and quantifiers

Let \`R\` be a commutative monoid with zero, let \`n,m\` be naturals, and assume \`h : n|m\`.
For a Dirichlet character \`chi\` of level \`n\`, Mathlib defines

\`changeLevel h chi = MulChar.ofUnitHom(chi.toUnitHom comp ZMod.unitsMap h)\`.

Here

\`unitsMap h : Units(ZMod m) ->* Units(ZMod n)\`

reduces a unit modulo \`m\` to a unit modulo \`n\`. The theorem is:

> If \`[NeZero m]\`, then \`changeLevel h\` is injective.

There is no independent \`NeZero n\` premise. It follows: if \`n=0\` and \`0|m\`, then \`m=0\`,
contradicting \`NeZero m\`.

## 2. Surjectivity of the unit reduction map

The difficult input is the pinned theorem

\`ZMod.unitsMap_surjective [NeZero m] (h:n|m)\`.

It first proves the arithmetic lifting statement

\`forall x, Coprime(x,n) -> exists k, Coprime(x+k*n,m)\`.

Fix \`x\` coprime to \`n\`. Define the finite set

\`P = {p in primeFactors(m) | p does not divide x}\`

and set \`k\` to the product of the primes in \`P\`. We show no prime divisor \`p\` of \`m\`
can divide \`x+k*n\`.

### Case 1: \`p|x\`

If also \`p|(x+k*n)\`, subtraction gives \`p|k*n\`. Since \`p\` is prime:

- If \`p|n\`, then \`p\` divides both \`x\` and \`n\`, contradicting \`Coprime(x,n)\`.
- If \`p|k\`, primality and the finite-product lemma give a prime \`q in P\` with \`p=q\`.
  Membership of \`q\` in \`P\` says \`q\` does not divide \`x\`, contradicting \`p|x\`.

### Case 2: \`p\` does not divide \`x\`

Because \`p|m\`, the prime \`p\` belongs to \`P\`, hence \`p|k\` and therefore \`p|k*n\`.
If \`p|(x+k*n)\`, subtraction now gives \`p|x\`, again a contradiction.

Thus every prime divisor of \`m\` is coprime to \`x+k*n\`; \`Nat.coprime_of_dvd\` concludes
\`Coprime(x+k*n,m)\`.

Now take an arbitrary unit \`y : Units(ZMod n)\`. Its canonical natural representative
\`x=y.val.val\` is coprime to \`n\`. The construction gives \`k\` and hence the unit

\`z = unitOfCoprime(x+k*n) : Units(ZMod m)\`.

Reduction modulo \`n\` kills the term \`k*n\`, so \`unitsMap h z=y\`. This establishes
surjectivity.

## 3. Why surjectivity gives injectivity of level change

Suppose \`chi\` and \`psi\` are characters of level \`n\` and

\`changeLevel h chi = changeLevel h psi\`.

To prove \`chi=psi\`, it suffices by \`MulChar.ext_iff\` to compare their unit-group homomorphisms.
Let \`y : Units(ZMod n)\`. Surjectivity supplies \`z : Units(ZMod m)\` with
\`unitsMap h z=y\`. Evaluate equality of the changed-level characters at \`z\`:

\`chi.toUnitHom(unitsMap h z)=psi.toUnitHom(unitsMap h z)\`.

Substitute \`unitsMap h z=y\` to obtain

\`chi.toUnitHom y=psi.toUnitHom y\`.

This holds for every unit \`y\`, so character extensionality yields \`chi=psi\`. The proof is
ordinary cancellation of precomposition by a **surjective** homomorphism; it does not infer equality
from a non-surjective sample.

## 4. The nonzero target-level obstruction is real

The target-level condition cannot simply be dropped. Since every natural divides zero, take
\`n=5\`, \`m=0\`. Then \`ZMod 0\` is the integers and its only units are \`+1\` and \`-1\`.
Their images modulo five are \`1\` and \`4\`, whereas

\`Units(ZMod 5) = {1,2,3,4}\`.

The units \`2\` and \`3\` have no lift from level zero, so \`unitsMap(5|0)\` is not surjective.
The pinned proof uses \`NeZero m\` both to rule out this obstruction and inside the
\`primeFactors(m)\` construction.

## 5. Exact use inside \`QH.ind_unique\`

\`ind_unique\` invokes \`changeLevel_injective\` three times:

1. from level \`N*N'\` to \`N*N'*M\`, cancelling the auxiliary comparison factor \`M\`;
2. from level \`N'*N\` to the same common level, producing the reversed gcd factorization;
3. after proving \`N=N'\`, from level \`N\` to \`N*N\`, recovering equality of the original
   characters.

All three target levels are explicitly made nonzero from \`NeZero N\`, \`NeZero N'\`, and
\`M!=0\`. The previous chapter was correct to use injectivity here; this reconstruction corrects
any interpretation that level-change cancellation is formal without the target nonzero condition.

## Executed certificate

Executed locally with Python 3.12:

\`\`\`text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_change_level_injective_unit_lifting.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_change_level_injective_unit_lifting.py
\`\`\`

Corrected execution output:

\`\`\`text
changeLevel_injective unit-lifting regression: OK; report_checks=21, lift_checks=28201, surjectivity_checks=10582, cancellation_checks=4116, zero_level_checks=4, negative_controls=4
\`\`\`

The certificate reproduces the pinned prime-factor product \`k\`; checks the lifted integer is
coprime to \`m\` and unchanged modulo \`n\`; enumerates surjectivity of unit reduction for deterministic
nonzero divisible levels; exhaustively checks cancellation of Boolean-valued functions under those
surjections; and verifies the \`n=5,m=0\` negative control.

This finite certificate validates the arithmetic and categorical skeleton only. It does not replace
Lean's proofs of \`Nat.coprime_of_dvd\`, unit extensionality, or \`MulChar.ext_iff\`.

## Failed attempts / limitations

- The first certificate execution failed before any mathematical check because the script confused
  \`itertools.product\` with integer multiplication. It was corrected to \`math.prod\`; the executed
  result below is from the corrected script.
- Dropping \`NeZero m\` fails at \`n=5,m=0\`: two of the four units modulo five have no preimage.
- Choosing \`k=0\` does not generally work: at \`n=5,m=10,x=2\`, \`x\` is a unit modulo five but
  not modulo ten. The source's prime-factor construction handles all source units uniformly.
- Equality on an arbitrary proper subset of source units does not imply equality of characters;
  surjectivity of \`unitsMap\` is the exact cancellation hypothesis.
- The argument is about unit-group homomorphisms. It does not say every element of \`ZMod n\` has a
  unit lift.
- No local Lean environment or \`.olean\` dependency graph was available. The status is
  SOURCE-MATCHED plus an independently executed finite regression, not ELABORATED or an axiom census.

## RESUME HERE

Reconstruct pinned Mathlib \`MulChar.ext_iff\` / \`ofUnitHom\` bridge used in
\`changeLevel_injective\`: explain why a Dirichlet character is determined by its unit restriction
despite vanishing on nonunits, preserve the \`CommMonoidWithZero\` hypotheses, and give the exact
downstream rewrite used by \`changeLevel_def\`. Do not repeat the unit-surjectivity or
\`ind_unique\` arguments.

**HANDOFF TO:** MATH, dependency, audit, integration.
