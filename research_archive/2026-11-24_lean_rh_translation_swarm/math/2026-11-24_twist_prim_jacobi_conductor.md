# MATH lane — `QH.twist_prim`: primitive Jacobi twist at a new odd prime

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the first unresolved supplier behind `QH.ind_drop`.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source ledger

The required source revision is `40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Blob | Role |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/TwistPrim.lean` | `5443adc0075731900672030d140d5d8c85b668f7` | theorem reconstructed |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | primitivity and nontriviality supplier |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/WeightedVonMangoldtSumIdentity.lean` | `2c73f2f3005e8fe05017d74506cff497df52e4bd` | evaluation formula supplier |
| `src/Formalism/GL3MeanSquares/SecondEstimateOfIntervalHypothesis.lean` | `bdea967f4db26bfc2b040f01beeebbed0ff8909c` | definitions `qc`, `tw`, `TwPrimitive`, `TwEval` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean` | `1fc497069c8499edef750d4264a106e442dcb1ef` | immediate downstream caller |

The current upstream head checked on 2026-11-24 is
`9282d3a102c4aff0e6026746db2a8990f5d9cddd`. The corresponding first four blobs are respectively
`12203d3f4ca7e7da27ab01667d8c084d61246de6`,
`4564722f96a5e2ca86092fb039e127a77a950c34`,
`ed8c63c192dc174f282bad96335dbb57c6d4a4a2`, and
`3a2de971bd8f34ce6fc3ca7aad7f635a4187fd5f`. Direct source comparison found the targeted theorem
bodies and definitions unchanged; the modules' generated import preludes differ. This is a text
comparison, not a compiled-term equivalence claim.

The two direct formal suppliers are
`ThinSetIntegral.twist_is_primitive_character` and
`ZeroFreeRegionGL2.twist_evaluation_formula`; the latter's nonunit branch invokes
`jacobiSym.eq_zero_iff_not_coprime`.

## 1. Exact theorem and every hypothesis

For all natural numbers `f,q`, a typeclass witness `[NeZero f]`, and every
`xi : DirichletCharacter C f`, assume

1. `xi.IsPrimitive`;
2. `q.Prime`;
3. `q != 2`;
4. `not q divides f`.

Then there exists `psi : DirichletCharacter C (f*q)` satisfying all three conclusions

1. `psi.IsPrimitive`;
2. `psi != 1`;
3. for every natural `n`,
   `psi(n mod f*q) = xi(n mod f) * J(q,n)`.

Here `J(q,n)` is the complex cast of the Jacobi symbol `(n/q)`. The conclusion is global in `n`;
there is no coprimality guard because both sides vanish in the nonunit cases handled below.

## 2. The constructed character

Install `Fact q.Prime` from the explicit primality hypothesis. Since `q` is prime,
`not q|f` is equivalent to `Coprime(q,f)`.

The source defines

    qc(q) = the quadratic character of ZMod q, cast from Z to C,

and

    tw(xi,q)
      = changeLevel(xi, f | f*q)
        * changeLevel(qc(q), q | f*q).

Thus the witness is not chosen abstractly: `psi := tw(xi,q)`. It is the product of the original
primitive character and the quadratic character at the new prime, both evaluated at the product
level.

## 3. Why the quadratic factor is primitive

The conductor of `qc(q)` divides its level `q`. Since `q` is prime, the conductor is either `1` or
`q`. If it were `1`, `eq_one_iff_conductor_eq_one` would make `qc(q)` the principal character.

For `q != 2`, this is impossible. The source reduces equality of the complex-valued character to
equality of the underlying quadratic character on units using `MulChar.ext`; Mathlib's
`quadraticChar_ne_one` supplies a unit on which the quadratic character is not one. Hence

    conductor(qc(q)) = q.

The excluded prime `2` is substantive: `(ZMod 2)^*` has one element, so its quadratic character is
principal and has conductor `1`.

## 4. Why the product has conductor exactly `f*q`

The difficult step is the private lemma `prim_mul`. Write `N=f*q`, let `A` be `xi` lifted from `f`
to `N`, let `B` be `qc(q)` lifted from `q` to `N`, and put `c=conductor(A*B)`.
Changing level preserves the two primitive conductors:

    conductor(A)=f,  conductor(B)=q.

Apply `conductor_mul_dvd_lcm_conductor` to `(A*B)` and `B^{-1}`. Since
`(A*B)B^{-1}=A` and `conductor(B^{-1})=q`, it yields

    f divides lcm(c,q), hence f divides c*q.

Because `Coprime(f,q)`, Euclid's lemma removes the `q` factor and gives `f|c`. Repeating the same
argument with `(B*A)A^{-1}=B` gives `q|c`. Coprimality then gives `f*q|c`.

Every character conductor divides its level, so also `c|f*q`. Antisymmetry forces

    conductor(tw(xi,q)) = f*q.

That is exactly primitivity. The argument would fail if the new prime divided `f`: one could not
separate the two conductor factors.

## 5. Why the twist is nonprincipal

Suppose `tw(xi,q)=1`. Its conductor would then be `1`. But the preceding result says its conductor
is `f*q`. From `[NeZero f]` we have `1<=f`, and primality gives `2<=q`, so `2<=f*q`; contradiction.
Therefore the constructed character is not principal.

The more general supplier also proves that if `xi^2=1`, then `tw(xi,q)^2=1`. It expands the square
of the product, commutes powers with both change-level maps, and uses `qc(q)^2=1` on every unit.
`QH.twist_prim` intentionally discards this optional implication; its conclusion does not assume
or assert that `xi` is quadratic.

## 6. The evaluation formula, including nonunits

For a natural `n`, split on whether its residue is a unit modulo `f*q`.

If it is a unit, both change-level characters evaluate by casting the residue to `ZMod f` and
`ZMod q`. The first factor becomes `xi(n mod f)`. For prime `q`, the quadratic character agrees
with the Legendre symbol, and the Legendre symbol agrees with the Jacobi symbol, giving `J(q,n)`.

If it is not a unit, the product-level character is zero. Nonunit mod `f*q` means
`not Coprime(n,f*q)`. There are two exhaustive branches:

- If `not Coprime(n,f)`, then `xi(n mod f)=0` by `MulChar.map_nonunit`.
- If `Coprime(n,f)`, failure at the product forces `not Coprime(n,q)`. The Jacobi symbol is then
  zero by `jacobiSym.eq_zero_iff_not_coprime`.

Thus the right side is zero in either branch. This is why `twist_prim` can state its evaluation
identity for every natural number, rather than only the units.

## 7. Downstream use and correction

`QH.ind_drop` applies this theorem to `xi.primitiveCharacter`, with
`f=xi.conductor`. It uses the returned primitivity and evaluation formula to identify the unknown
primitive character through `QH.ind_unique`. It discards only the nonprincipality field there.

This corrects a possible oversimplification of the earlier conductor-descent narrative: the
canonical twist is not primitive merely because its formal level is `f*q`. Its conductor is proved
equal to that level through the two inverse-product/lcm arguments above. Conversely, the evaluation
formula is not a unit-only identity silently generalized; both nonunit branches are proved.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_twist_prim_jacobi_conductor.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_twist_prim_jacobi_conductor.py

Observed output:

    twist_prim Jacobi/conductor regression: OK; report_checks=18, evaluation_checks=21610, square_checks=18856, conductor_checks=180, nonunit_checks=2754, negative_controls=3

The standard-library certificate checks the source ledger and report anchors. For every ordered pair
of distinct odd primes at most 31 it exhaustively evaluates the product quadratic character on
`ZMod(p*q)`, verifies the global evaluation identity and square-one law on units, and searches every
divisor for the smallest level through which the unit values factor. It also executes the `q=2`
and repeated-prime controls.

This finite model instantiates the conductor argument for quadratic source characters. It does not
prove `prim_mul` for arbitrary complex Dirichlet characters, replay Lean, or audit transitive axioms.

## Failed attempts / limitations

- Treating the formal level `f*q` as the conductor would assume the theorem's difficult step.
- Dropping `q!=2` fails: the quadratic character modulo `2` is principal.
- Dropping `not q|f` fails concretely for `f=q=3`: the product of the two identical quadratic
  factors is principal on units modulo `9`, so its conductor is `1`, not `9`.
- Proving the evaluation formula only on units leaves the exact nonunit statement used downstream
  unjustified; both vanishing branches are necessary.
- No Lean or Lake executable is installed locally. Status remains SOURCE-MATCHED, not ELABORATED.

## RESUME HERE

Trace pinned Mathlib `conductor_mul_dvd_lcm_conductor`, the remaining imported conductor inequality
inside `prim_mul`. Preserve its exact hypotheses and prove why multiplying by the inverse recovers
the first factor without silently assuming cancellation of nonunits. Do not repeat `twist_prim`,
`ind_drop`, `ind_unique`, or generic unit extensionality.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
