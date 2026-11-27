# Compact C: Kummer converse and prescribed tame values

**Status:** SOURCE-MATCHED human reconstruction of the converse direction of
`SplitPlaces.power_residue_reciprocity`; finite algebraic certificate executed,
native Lean replay pending.  This is a class-field-theoretic input to compact C,
not RH and not a replacement for the unresolved balanced-row and comparison
inputs.

## Pin, source, and consumer

Primary source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`
(`grh-compact/src`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`).

| declaration | path | blob | lines |
|---|---|---|---:|
| `SplitPlaces.power_residue_reciprocity` | `Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean` | `fbfa4f703035c833491594169f2089c01fda3d03` | 47–124 |
| `exists_kummer_chars` | `Lib/ClassField/Global/Avatars.lean` | `dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa` | 116–154 |
| `trivialisedCocycles.exists_mem_of_orbit_reps` | `Lib/ClassField/GaloisCohomology/DiscreteUnits.lean` | `8f36777d8514e71b861507c96eee9d56f6d8fa61` | 187–197 |
| `trivialisedCocycles.corestrict_mem` | same | same | 199–211 |

The downstream route is unchanged:
`power_residue_reciprocity` -> `exists_split_primes_relations` ->
`IsPencil.length_le_of_unseen_class` -> `exists_anticyclotomic_twist` ->
compact C.  The preceding checkpoint derived the other implication, the
principal-Artin residue sum.  This note does not redo it.

## Exact statement being reconstructed

Write `Q = U.1.1`, and let `S` be the lifted split-place datum over the fixed
field of `Q`.  Assume the source hypotheses: `m` and `N` are nonzero; `U`
fixes `V`; `V` is a `ZMod m`-module; the chosen `gamma_i` are tame generators;
the fixed field of `Q` is totally complex; the selected places satisfy the
split/Frobenius/distinctness data; and `S` contains every place over `m` and
satisfies

    principalIdele.range ⊔ idelesUnitOff S = top.              (D)

Let `b` be the Kummer power-residue map constructed in source lines 56–79.
For every scalar function

    f : iota × (G/Q) -> ZMod m

satisfying, for every fixed-field `S`-unit `y`,

    sum_(i,delta) b(fixedSUnitsRep_delta(y))_i f(i,delta) = 0,  (O)

and every `a : V`, there is a trivialised cocycle `P` with

    P(gamma_i) = sum_delta rho(delta.out)(f(i,delta) • a).       (T)

All quantifiers in (O) are universal.  In particular it is not enough to test
a basis chosen after seeing `f` unless that basis is independently proved to
span the full source `S`-unit group.

## Construction

### 1. Encode `f` in one finite idele

For every selected place `theta=(i,delta)`, choose a local element `xi_theta`
whose local Artin image is the prescribed Frobenius representative.  Form

    A_f = product_theta locIdele(S.v theta, xi_theta)
          ^ ((cycCharMod(delta.out) * f(theta)).val).           (1)

The exponent is the actual natural representative used by Lean.  Replacing it
by an arbitrary integer lift is not definitionally harmless before the
`m`-torsion argument is made.

For an `S`-unit `y`, evaluate its Kummer character on `Art(A_f)`.  Local Artin
at `xi_theta`, the definition of `b`, and commutativity in `ZMod m` turn this
value into exactly the left side of (O).  Hence every `S`-unit Kummer character
annihilates `Art(A_f)`.

### 2. Use the totally-complex idele decomposition

The second clause of `exists_kummer_chars` applies using total complexity,
finiteness of `S`, (D), and inclusion of all places over `m`.  It gives

    A_f in principalIdele.range ⊔
           (idelesPowAt S m ∩ idelesUnitOff S).                 (2)

Unpacking (2), choose `x` in the fixed field and `q` such that

    A_f = principalIdele(x) q,                                 (3)

    q_v is an m-th power for every v in S,                     (4)
    q_v is a unit for every v outside S.                       (5)

These are the source objects `E`, `hx`, and `H` at lines 86–89.  Neither (4)
nor (5) can be dropped: (4) controls the selected decomposition groups, while
(5) controls inertia away from `S`.

Let `X = ofBase(Q,Omega)(x)` and let `kappa_X` be its Kummer cocycle.  Multiplying
the cocycle values by the chosen `a : V` gives a `V`-valued cocycle on `Q`.

### 3. Supply the two local trivialisation conditions

At a finite selected orbit representative, (4) and
`IsPlaceOver.smul_root_eq_of_local_pow` show that every element of the local
decomposition group fixes an m-th root of `x`; thus the Kummer cocycle is zero
there.  At an infinite representative, an element stabilising the place is
either `1` or a complex conjugation by `eq_one_or_isComplexConj`.  Total
complexity excludes the second case, so the cocycle is again zero.

Away from the selected set, (5), the source root-detection map `J`, and the
unit-root inertia lemma show that the cocycle vanishes on the required
inertia.  Therefore `trivialisedCocycles.exists_mem_of_orbit_reps` constructs a
trivialisation over `Q`; the supplied representative values are zero, not an
unrecorded choice.  Then `trivialisedCocycles.corestrict_mem` sums over `G/Q`
and produces a cocycle `P` in the original `G`-module, preserving vanishing on
the original inertia set.

### 4. Compute the tame values before taking any bound

Fix `i`.  In the corestriction sum, the `delta`-summand is the action of
`delta.out` on the restricted Kummer value at the conjugate of `gamma_i`.
The source identity `n` converts that Kummer value to

    cycCharMod(delta.out^-1)
      * ( - ord_(S.v(i,delta))(x) ).                            (6)

Now use (3) at the single component `S.v(i,delta)`.  Injectivity of `S.v` makes
every other factor in (1) equal to one there; `Finset.prod_eq_single` is the
exact cancellation performed at source lines 97–100.  The remaining local
Artin choice and (6) cancel the cyclotomic factor and leave
`f(i,delta) • a`.  Only after this componentwise equality may one sum over
`delta`.  The decisive equation is therefore

    boxed: P(gamma_i)
           = sum_delta rho(delta.out)(f(i,delta) • a).          (7)

Equation (7) is (T), with the action and inverse conventions fixed by the
actual source.  Omitting the action is false whenever the quotient acts
nontrivially on `V`; the executable certificate includes that negative
control.

## Reduction ledger and boundary

This expands the root-reachable converse node as

`compatible f` -> exact idele (1) -> Kummer annihilation -> decomposition
(2)--(5) -> local root fixing + total-complex infinite-place exclusion ->
orbit-representative cocycle -> corestriction -> single-component cancellation
-> (7).

The construction uses rather than proves `exists_kummer_chars`.  That theorem
in turn retains Dirichlet's unit theorem, local power-index bounds, global
Artin surjectivity, and the totally-complex exclusion of complex
conjugations.  It also uses the native orbit-representative and corestriction
lemmas.  No axiom or premise is pruned, and no RH conclusion is imported.
The old-pin `rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier` executables
are absent from the compact checkout; manual source reachability is recorded
instead of claiming a native reduction run.

## Executed checks and rejected shortcuts

- Source pin and the three file blobs above were checked locally.
- The Python certificate exhausts finite cyclic quotient actions of orders
  `1..4`, moduli `2..11`, all compatible action units, every coefficient
  tuple on the whole quotient, and all scalars.  It checks (7) after exact
  componentwise substitution and finds nontrivial-action counterexamples to
  the action-deletion shortcut.
- `python3 -m py_compile` and `git diff --check` were executed.
- Local `lean`, `lake`, and `elan` are unavailable.  The companion Lean file
  is PREPARED, not claimed compiled.  The previous principal-Artin checkpoint
  passed repository CI run `45924132981`; that does not compile or certify
  this new companion automatically.
- Rejected: applying idele decomposition without proving all Kummer pairings
  vanish.  That would assume (O)'s consequence.
- Rejected: using units-off-`S` in place of local m-th powers at `S`; the two
  subgroup factors discharge different stabilisers.
- Rejected: deleting total complexity.  It is exactly what removes the
  complex-conjugation branch at infinite orbit representatives.

## RESUME HERE

Audit the upstream proof of `exists_kummer_chars` at
`Lib/ClassField/Global/Avatars.lean:116–154`, beginning with the finite-index
comparison at lines 139–153.  Match its use of Dirichlet units and
`index_pow_at_places_le` to the exact annihilator-surjectivity conclusion;
do not revisit equations (1)–(7).  Separately, native-compile the companion
under compact Lean 4.35.0 when that toolchain is available.
