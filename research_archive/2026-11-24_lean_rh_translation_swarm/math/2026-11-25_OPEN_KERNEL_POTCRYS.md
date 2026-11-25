# Open kernel closes the `countQ_alt` potential-crystallinity leaf

**Lane:** MATH / mandatory unified reduction, run 39  
**Status:** SOURCE-MATCHED THEOREM + executable finite regression; Lean adapter PREPARED / NOT COMPILED  
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The previous reduced graph ended at potential crystallinity of the restricted
rank-one quadratic sign character.  The pinned source supplies every
ingredient for the following general replacement:

\[
\boxed{
  \ker(r)\text{ open}\quad\Longrightarrow\quad
  \operatorname{IsPotCrysAt}(P,B_w,r).
}
\tag{1}

Here `r : Gw -> GL_a(Qbar_l)` is continuous entrywise and `Gw` is the local
bridge group.  This is stronger than the needed rank-one statement but has a
short proof:

1. Compactness and continuity place all matrix entries in one finite
   coefficient extension `LL/Q_l`; this produces the exact `IsModel` required
   by the consumer.
2. Transport `ker(r)` across `Bw.e : Gw ~= GK(Bw.Kw)`.  Its openness gives an
   ambient Krull neighbourhood `U` of one.
3. The Krull neighbourhood basis supplies a finite extension `K0/Q_l` whose
   fixing subgroup lies in `U`.  Replace it by
   `K = Bw.Kw * K0`, so the extension also lies over the bridge field.
4. On `GK(K)`, the model representation is exactly trivial.  The pinned
   theorem `GlobalTheory.TrivCrys.isCrys_of_trivial` makes that restriction
   crystalline.  This is precisely the witness demanded by `IsPotCrysE`.

For a continuous sign character `mu` satisfying
`mu(g)=1 or mu(g)=-1`, its kernel is open: the finite image allows the open
preimage of the complement of `{-1}` to isolate the value `1`.  Applying (1)
to `rk1 mu` gives

\[
\boxed{
  (\forall g,\ \mu(g)\in\{1,-1\})
  \Longrightarrow \operatorname{IsPotCrysAt}(P,B_w,\operatorname{rk1}\mu).
}
\tag{2}

The quadratic characters chosen in `countQ_alt` carry exactly continuity and
the `+1/-1` alternative.  Thus the local Hodge leaf isolated in run 38 is
mathematically discharged.  Combined with native `twist_above`, the only
remaining at-`l` level-transport leaf is the unchanged-modulus statement
`KillsMu M delta`.

## Exact pinned sources

| Role | Source path | Blob |
|---|---|---|
| local Krull extraction pattern | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/PadicHodgeTheory/RankOneCharacterIsdRAndJumpsZero.lean` | `b158fd6259e27ebf1b0d94b622c327559eb210e3` |
| finite coefficient model | `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/CompactGroupRepDefinedOverFiniteExtension.lean` | `e59a016bb4832f02e4d7d912cf87534207a1f6c7` |
| model homomorphism | `src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ExistsContinuousLadicGalRepModelFiniteExtHost.lean` | `345b9d5f78be2337d92254c3b1e1577484e5835f` |
| trivial representation is crystalline | `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/IsCrysLatOfTrivial.lean` | `546e2fb7ce2e96d78905c737bad6997f840fff22` |
| exact `IsPotCrysE` existential | `src/Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` | `3d5ea7e38ae7ff6a7fae481011bc05e4490b5a84` |
| actual finite sign producer | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/BuildingsResidueChars/ExistsQuadraticSignCharacter.lean` | `2f88a58801b17ae7fc3a5c392b624d5a16b960de` |

## Original and reduced graphs

```text
original:
countQ_alt -> LevelAt -> arbitrary PotCrysAt twist-preservation premise

run 38:
countQ_alt -> LevelAt -> native twist_above
           -> IsPotCrysAt(rk1 delta)

this run:
continuity + delta(g) in {+1,-1}
  -> open kernel -> finite Krull extension -> trivial restriction
  -> crystalline restriction -> IsPotCrysAt(rk1 delta)
```

No automorphy, irreducibility, Frobenius estimate, weight, host-count bound,
or RH assumption enters (1) or (2).  The coefficient field and local field
witnesses remain distinct; no scalar-to-metric or scalar-to-field
identification is introduced.

## Unified-reduction record

- **Premise weakening:** the arbitrary twist-preservation function is gone;
  then the residual Hodge premise is derived from the character data already
  returned by the actual sign producer.
- **Exact cancellation before norms:** none is needed.  Triviality is an exact
  equality on the fixing subgroup.
- **Symmetry:** the sign image is closed under inversion; the same certificate
  handles both twist directions.
- **Aggregation:** `supExt Bw.Kw K0` is the one common finite local witness.
- **Context key:** `(source pin, countQ_alt, place bridge, sign character,
  open kernel, IsPotCrysAt)`.
- **Backtracking:** the longer de-Rham-to-potentially-crystalline route remains
  a fallback, but (1) avoids its global Artin and Hodge--Tate premises.

## Executed checks

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_open_kernel_potcrys.py
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_open_kernel_potcrys.py
git diff --check
```

The finite regression checks 8,256 cyclic finite-image characters and their
kernel restrictions.  It also checks the six pinned source anchors and the
prepared Lean file for forbidden placeholders and required reduction-engine
commands.  The finite regression tests the group-theoretic skeleton, not
p-adic Hodge theory.

Lean and Lake are unavailable in this container.  The adapter is therefore
PREPARED / NOT COMPILED; no native Lean or CI PASS is claimed.  Its
`rh_scan`, `rh_reduce`, `rh_auto`, and axiom-printing hooks are present for the
next pinned runner.

## Failed attempt and remaining obstruction

The initial route tried to manufacture a `FinExt` directly from the global
quadratic field.  That conflates the global algebraic closure with the local
`PadicAlgCl l` used by `LocBridge.IsPotCrysE`.  The valid route first transports
the open kernel through `Bw.e`, then uses the local Krull basis.  This also
explains why the coefficient model must be constructed independently.

This result does **not** prove `KillsMu M delta`, the remaining CountQ bounds,
the weighted-prime lower bound, or RH.

## RESUME HERE

At the actual `countQ_alt` caller, retain the continuity and sign-value fields
from `exists_quadratic_sign_character`, invoke
`rankOne_isPotCrysAt_of_finite_sign`, combine it with the run-38
`potCrysAt_twist_of_rankOnePotCrys` adapter, and replay the full `AdmRNAlt.level`
field.  The exact remaining premise should be only `KillsMu M delta`; compile
the caller substitution and inspect `#print axioms` before deleting the
original fallback.

**HANDOFF TO:** kernel/audit for native replay; integration for the caller
substitution; MATH/Galois for the same-modulus `KillsMu` leaf.  RH remains OPEN.

