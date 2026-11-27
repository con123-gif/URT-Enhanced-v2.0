# Compact C: Kummer finite-index square audit

**Result:** SOURCE-MATCHED reconstruction of the cardinal argument in
`exists_kummer_chars`, plus an independent audit of integration RUN11's
standard-class-field-theory replacement.  Audit verdict: **AGREE**, with the
native counting route and the shorter external-theorem route kept as distinct
proofs.  Native Lean replay of the companion remains pending.

This closes the specific finite-cardinality bridge left by the previous MATH
checkpoint.  It does not prove RH, balanced rows, comparison forms, or the
compact determinant estimate.

## Source pin and actual consumer

Primary source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src`; Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

| declaration | path | blob | lines |
|---|---|---|---:|
| `exists_kummer_chars` | `Lib/ClassField/Global/Avatars.lean` | `dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa` | 116–154 |
| `index_pow_at_places_le` | same | same | 44–51 |
| `SUnit.dirichlet_unit_theorem` | `Lib/ClassField/Places/AdeleNorm.lean` | source pin above | 97–112 |
| `relIndex_mul_index_sup` | `Lib/ClassField/Global/AlbertBrauerHasseNoether.lean` | source pin above | 215–221 |
| `cokerKerIndex_eq_pow_finrank` | `Lib/ClassField/GreenbergWiles/ExtendCharacter.lean` | source pin above | 48–59 |

Actual consumer:
`exists_kummer_chars` -> converse of
`SplitPlaces.power_residue_reciprocity` ->
`exists_split_primes_relations` -> compact C.  The previous checkpoint already
expanded the converse after this idele-decomposition output.

## Groups and exact indices

Let `K` be totally complex, let `S` be a finite set of finite places containing
every place over `n`, and assume

    principalIdele.range ⊔ idelesUnitOff S = top.               (G)

Write

- `J` for the finite idele group;
- `N = idelesPowAt S n`;
- `J_0 = idelesUnitOff S`;
- `H = principalIdele.range ⊔ (N ∩ J_0)`;
- `U = S.unit K` and `U^n = (powMonoidHom n).range`.

Set the finite indices

    A = [J : N],   B = [U : U^n],   D = [J : H].               (1)

The target of the Kummer evaluation map is the character group of `J/H`, so
its cardinal is `D` by `card_hom_QZ`.  Its source is `U/U^n`, of cardinal `B`.

## Step 1: the local-global kernel is exactly `U^n`

For an `S`-unit `u`, suppose its principal idele lies in `N`, i.e. `u` is an
`n`th power in every completion at `S`.  Its Kummer cocycle is:

- zero on decomposition groups at `S`, by
  `IsPlaceOver.smul_root_eq_of_local_pow`;
- zero on inertia outside `S`, because `u` is an `S`-unit and `S` contains the
  residue-characteristic divisors of `n`;
- zero on complex conjugations, vacuously because `K` is totally complex.

Under (G), `QZChar.eq_zero_of_unramified_off` makes the global Kummer cocycle
zero.  The source's root-detection equivalence `F`, followed by `Y`, then says
`u` is a global `n`th power in `U`.  The reverse inclusion is immediate.
Thus

    U ∩ principalIdele^(-1)(N) = U^n.                           (2)

This is the substantive arithmetic input in `index_dvd_of_le` at source lines
139–142; it is not merely a cardinal estimate.

## Step 2: exact subgroup multiplication before inequalities

Apply `relIndex_mul_index_sup` to the principal-idele map, `J_0`, and `N`.
Using (G) and (2), it gives the exact relative-index identity

    [U : U ∩ principalIdele^(-1)(N)] * D
      = [J_0 : N ∩ J_0].                                      (3)

The first factor in (3) is `B`.  The right side divides `[J:N]=A`; this is
`relIndex_dvd_index_of_normal` in the source.  Therefore

    B D divides A.                                             (4)

The direction of (4) matters.  Reversing it would provide no upper bound on
`D`; the source does not make that error.

## Step 3: local and Dirichlet bounds form a square

`index_pow_at_places_le` supplies

    0 < A <= n^(2 |S| + [K:Q]).                                (5)

Put `t = # InfinitePlace(K)` and `r = rank_Z U`.  Dirichlet's S-unit theorem
is used in its exact source form

    r + 1 = |S| + t.                                           (6)

Since `K` is totally complex, every infinite place has multiplicity two, so

    [K:Q] = 2t.                                                (7)

The source formula `index_range_pow_eq`, combined with
`cokerKerIndex_eq_pow_finrank`, gives

    B = n^r |U[n]|.                                            (8)

The primitive `n`th root of unity lies in `K` and is exhibited inside `U[n]`
by source objects `x`, `hx`, `k`; hence `n` divides `|U[n]|`.  Consequently

    n^(r+1) <= B.                                              (9)

Substitute (6) and (7) into (5), then use (9):

    A <= n^(2(|S|+t)) = n^(2(r+1)) <= B^2.                    (10)

This explains the otherwise opaque final `trans_eq (sq _)` at source line
154: the local index has exactly twice the Dirichlet-plus-root budget.

## Decisive inequality and surjectivity

Combine exact divisibility (4) with (10).  Since `B>0`,

    boxed:  B D <= A <= B^2  implies  D <= B.                  (11)

The source map

    Phi : U/U^n -> Hom(J/H, Q/Z)

sends an `S`-unit class to its Kummer character composed with global Artin.
It is injective: equality of characters, Artin surjectivity, root detection,
and (2) force the quotient of the units to be an `n`th power.  Equation (11)
says the codomain cardinal `D` is at most the domain cardinal `B`.  For finite
types, injection plus this reverse cardinal inequality makes `Phi` bijective;
this is exactly `Injective.bijective_of_nat_card_le` at source lines 145–154.

If an idele `a` is killed by every `S`-unit Kummer character, bijectivity says
every character of `J/H` kills its class.  Finite character separation
(`eq_zero_of_forall_hom_eq_zero`) gives `[a]=1`, hence `a in H`, which is the
second conclusion of `exists_kummer_chars`.

## Independent audit of integration RUN11

Integration RUN11 replaces the native counting proof by the standard global
CFT existence theorem: every finite character of the open quotient `J/H`
comes from an abelian Galois character; because `mu_n` is contained in `K`,
Kummer theory represents it by `x in K*/K*^n`; unramifiedness outside `S`
makes all outside valuations divisible by `n`; and (G), equivalently the
trivial `S`-ideal class obstruction, lets one divide by an `n`th power and
choose an `S`-unit representative.

The guards match the caller:

1. `H` is open: local `n`th powers have finite index and are open at the
   finitely many selected characteristic-zero completions.
2. `J/H` has exponent dividing `n`: write any idele as a principal idele times
   an element of `J_0` using (G), then its `n`th power lies in `H`.
3. Adding all archimedean components converts the finite-idele quotient to the
   standard full-idele CFT quotient.  Total complexity introduces no real sign
   condition.
4. `S` contains all places over `n`, so the outside local Kummer criterion is
   tame; no wild-prime assertion is smuggled in.
5. The proof uses global CFT existence as an external established theorem,
   not the later native `exists_comp_artinMap`, avoiding circularity.

Therefore the shorter replacement entails the same annihilator conclusion as
the native proof.  It is not a term-level pruning of the Lean theorem, and its
external CFT/Kummer hypotheses remain in the reduced frontier.  The audit
finds no changed quantifier, prime-only restriction, or lost dyadic case.

## Evidence and limits

- Read the complete native `exists_kummer_chars` body and the exact statements
  of the four index lemmas cited above.
- Executed `verify_kummer_index_square.py`: exhaustive arithmetic checks for
  `n=1..16`, `|S|,t=0..6` with valid nonnegative Dirichlet rank, multiple
  torsion multiples; plus every `A,B,D` in the bounded box `B<=40`,
  `A<=B^2`, `D<=60`, and negative controls reversing (4).
- Executed `python3 -m py_compile` and `git diff --check`.
- Local `lean`, `lake`, and `elan` are absent.  The Lean companion is PREPARED,
  not compiled.  Prior PR #109 CI run `45929552234` was cancelled, not passed;
  none of its status is reused here.
- The old-pin reduction executables are unavailable in the compact checkout.
  Original and reduced dependency routes are retained above instead of
  claiming a native `rh_prune` or `rh_auto` run.

## RESUME HERE

Send equations (2), (4), and (11) to integration/audit as the native proof of
the Kummer annihilator bridge.  Next MATH run should leave this completed
index argument alone and return to the first still-open arithmetic C primitive
in the live ledger—currently the normalized RowBalanced length supplier or,
if peers close it first, its exact reciprocity-to-isotropy consumer.  Native
verification should compile the companion at compact Lean 4.35.0 and print
axioms for `exists_kummer_chars` without importing `Main`.
