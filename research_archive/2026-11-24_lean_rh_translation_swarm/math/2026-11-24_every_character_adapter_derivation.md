# MATH lane: the exact seven-input `EveryCharacter` adapter

## RESULT

At upstream revision `40e56bab026552e089d7afcfeff08d2defb9c005`, the theorem
`UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin` is now traced through the
exact adapter that it invokes.  The decisive source declaration is
`UpperTheory.Lit.every_character_of_theta_integrals_local_matching`, not `everyE₂`.

This is a **source-matched mathematical derivation**, not a new Lean proof and not a claim that the
upstream project has been re-elaborated here.  All theorem names, argument order, and intermediate
types below were read at the pinned revision.  The companion verifier checks the pinned Git blob
identities when run against a checkout of that revision and checks this checkpoint's required
provenance fields locally.

## Source ledger

| ID | Pinned source path | Git blob | Declaration(s) used |
|---|---|---|---|
| `EC-S1` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean` | `a13ba1f8c38d4dbf2ddd809fbf9610a007936c24` | lines 565, 666, 727, 810: theta pair, `published_results_eigen`, `published_results_first`, literature wrapper |
| `EC-S2` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/SiegelEisensteinSecondTermHypotheses.lean` | `42abe20ee235820aaa924dbabce5e1d2c2540380` | lines 44, 69: hypothesis-bundle constructor and seven-input adapter |
| `EC-S3` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/At23OfAll.lean` | `e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d` | lines 19, 21, 24: two/three-prime family bound and linked packaging |
| `EC-S4` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean` | `c51cb6b5bd4bf2944ace89e00a2990da16bd519a` | lines 12, 16: `ZeroFreeAll` and `EveryCharacter` discharge |
| `EC-S5` | `src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean` | `6ac769568b67f85f33565ba3e1eef7b91f53c55f` | line 13: exact definition of `UpperTheory.EveryCharacter` |
| `EC-S6` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean` | `0e1bad41f4b165c0d9b1693f419530309e1da5ba` | line 16: fifteen-premise construction of `CovolumeBoundOfX` |
| `EC-S7` | `src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean` | `ee340012ab19713a8acfecf8adc6a331cbc2f1a4` | final row-to-character and character-to-RH links |

## Correction to the existing interpretation

The earlier MATH/integration checkpoint treated `FockModels/EveryCharacterE.lean` as if the final
wrapper called `everyE₂` and `hypsE₂`.  That file is imported, and its proof has a parallel shape,
but it is **not the declaration called by the final literature wrapper**.

The actual call graph is:

1. `every_character_of_literature_of_vWin` (`EC-S1`);
2. `every_character_of_theta_integrals_local_matching` (`EC-S2`);
3. `nonempty_hyps_definite_side_of_closed_bound` (`EC-S2`), producing
   `Nonempty (GlobalTheory.Fc.HypsAlt S0.NL GlobalTheory.Fc.DefiniteSideCondition)`;
4. `every_character_of_green_v_win` (`EC-S4`);
5. `zero_free_all_of_green_v_win` followed by `UpperTheory.Top.imprimitive` (`EC-S4`);
6. the proposition `UpperTheory.EveryCharacter` (`EC-S5`).

Thus the final route uses `HypsAlt`, `DefiniteSideCondition`,
`BoundAtTwoThreeFamilyFonAlt`, and `every_character_of_green_v_win`.  Replacing these by the older
`Hyps`, `DRS`, `BoundAtTwoAndThreeForFamily`, and `plugAll` names loses the exact dependency path.

## The exact seven inputs

At `EC-S2:69`, with all quantification explicit, the theorem is:

\[
\begin{aligned}
&P : \mathrm{UnitaryGroupThirdPlaceHypotheses},\\
&F : \mathrm{ThetaLocalInputs},\\
&h_A : \mathrm{ThetaIntegralsAgree},\\
&h_M : \mathrm{LocalMatching},\\
&h_X : \mathrm{CovolumeBoundOfX},\\
&h_L : \mathrm{RecTExists},\\
&h_V : \mathrm{VWin}
\end{aligned}
\quad\Longrightarrow\quad
\mathrm{UpperTheory.EveryCharacter}.
\]

No argument is implicit in the wrapper call and none may be dropped:

1. `P` supplies the global unitary/Galois/analytic package, including
   `P.greenRegularCharacters`, `P.nLink`, `P.litN`, and the fields used to construct the row and
   interpolation data.
2. `F` supplies theta/local inputs used in functional separation, test-vector assembly, theta
   evaluation, and the grid construction.
3. `hA` is equality of the relevant theta integrals.
4. `hM` is the local matching assertion.  It is a separate premise even though the literature
   theorem constructs `hA ∧ hM` in one theorem.
5. `hX` is the covolume bound required by the linked-bundle `L3` step.
6. `hL` is existence of the local-Langlands recursive parameter package.
7. `hV` supplies the zero-free window for every character input to the character-box argument.

The conclusion means exactly (`EC-S5:13`):

\[
\forall N:\mathbb N,\ [\mathrm{NeZero}\ N],\ \forall \chi:\mathrm{DirichletCharacter}(\mathbb C,N),
\ \forall s:\mathbb C,
\quad \tfrac12<\Re(s)\to(\chi\ne1\lor s\ne1)\to L(\chi,s)\ne0.
\]

The exceptional disjunction is preserved: the theorem does not assert nonvanishing at the pole of
the trivial character.

## Derivation of the missing hypothesis bundle

The hard step is `nonempty_hyps_definite_side_of_closed_bound` (`EC-S2:44`).  Its first six
premises are `P,F,hA,hM,hX,hL`; it additionally requires

\[
\forall c_{\mathrm{dep}}\in\mathbb R,
\ \mathrm{RL.LinkedAt}\bigl(\mathrm{parametersOfDependence}(h_L,c_{\mathrm{dep}})\bigr)
\left(
 (Q,L)\mapsto\mathrm{R1.SlotNormCondition}(Q,L)
 \left(\mathcal C\mapsto\mathrm{Closed}(\mathcal C,
 (Fm\mapsto\mathrm{BoundAtTwoThreeFamilyFonAlt}(Fm)))\right)
\right).
\tag{1}
\]

The adapter discharges (1), without a new premise, by

```
fun cDep =>
  UpperTheory.N.boundAtTwoThree_linked_of_recT
    P.nLink
    (GlobalTheory.Mem.Top.Bl.parametersOfDependence hL cDep)
```

The two steps behind that lambda are explicit in `EC-S3`:

- `at23_family_alt P.nLink Fm` derives `BoundAtTwoThreeFamilyFonAlt Fm` for every family `Fm`
  from the local hypotheses at the primes two and three;
- `boundAtTwoThree_n_linked` packages this familywise statement as `RL.LinkedAt p (...)` by a row
  selected from a property closed for all families.  Instantiating `p` with
  `parametersOfDependence hL cDep` gives (1) for each real `cDep`.

This is the precise prime-window bridge.  It is not a numerical estimate inserted later and it is
not derivable from `VWin`; it is carried by `P.nLink` and universally quantified over the dependence
parameter.

Inside `nonempty_hyps_definite_side_of_closed_bound`, let `C := P.litN`.  The proof constructs:

1. `hS : FunctionalsSeparate` from `F`, the unramified Howe input, and
   `P.siegelWeilUnitaryConvergent`.
2. `hRat : S0.RowRat` from test-vector assembly using `F.siegelSetUnitary`,
   `F.howeDualityReal`, `P.greenCuspidal`, `C.join`, `C.fe`, `hA`, `hM`, and `hS`.
3. `hFit : ConstantFunctionFits` from the alternate Fourier-coefficient fit and the surjectivity/
   low-weight consequence of `P`.
4. A threshold `CF1` with
   `hCF1 : ∀ C ≥ CF1, EvLgG (GridA C)`, obtained from theta evaluation.  Here both `hA` and `hM`
   enter again, together with twisted Weil convergence, local-factor matching, and equality of
   twisted square theta integrals.
5. A threshold `CF0` with the row-function conclusion `hCF0` for all `C ≥ CF0`, obtained from
   `P.discreteSeriesCover`, `P.harishChandraModules`, `P.cuspRapidDecay`,
   `P.casselmanWallach`, `P.rayClassFieldSt`, and `hFit`.

The thresholds are synchronized by the actual choice

\[
C_*:=\max(CF0,CF1).
\]

This choice is logically necessary: `CF1 ≤ C_*` supplies
`hEv : EvLgG (GridA C_*)`, while `CF0 ≤ C_*` allows the row-function theorem to be evaluated at the
same grid.  The proof then constructs:

- `hOpen1`, the open-parameter assertion at
  `parametersOfDependence hL C_*`;
- `hMono`, the stronger-extension open/linked comparison, and `hOpenA := hMono.2 hOpen1`;
- `hFun`, the row function at `C_*`, using `hCF0` and `hOpenA`;
- `hL3`, the linked-bundles `L3` assertion, using the covolume premise `hX`, the same extension, and
  `hOpenA`;
- `hN C_*`, the instance of the universally linked two/three-prime bound (1).

These are exactly the final inputs to
`hypotheses_nonempty_of_unramified_exponents_alt`, which returns

\[
\mathrm{Nonempty}\bigl(
\mathrm{GlobalTheory.Fc.HypsAlt}(S0.NL,
\mathrm{GlobalTheory.Fc.DefiniteSideCondition})
\bigr).
\tag{2}
\]

This explains the difficult step rather than hiding it behind the name “theta correspondence”:
the proof aligns two independently obtained large-parameter thresholds, transports openness to a
linked extension, combines row-function and covolume/L3 data at that single parameter, and adds the
closed two/three-prime bound before constructing the hypothesis bundle.

## From the bundle to `EveryCharacter`

The adapter converts `P.greenRegularCharacters` to
`hG : GlobalTheory.GLq.Green` using `green_of_regular`, and feeds `hG`, `hV`, and (2) to
`every_character_of_green_v_win` (`EC-S4:16`).

The latter first proves `ZeroFreeAll` (`EC-S4:12`).  Given a witness of `HypsAlt`, it calls
`zeroFreeAll_of_topG` at the fixed exponent `la = 3/2`; the required inequality is discharged by
arithmetic.  The shape premise is produced from the witness by
`forall_goal_of_shape_of_hyps` and `shape_closed_link_n_of_green hG`.  For every character object
`ψ`, the remaining window obligation is supplied by `supplyChi ψ (hV ψ)`.

Finally, `UpperTheory.Top.imprimitive` transports the primitive/character-box zero-free statement
to arbitrary Dirichlet characters, yielding the quantified proposition above.  A one-line
summary such as “the window proves RH” would omit the essential uses of the `HypsAlt` witness and
the imprimitive-character transfer.

## How the literature wrapper supplies the seven inputs

At `EC-S1:810`, for
`O : OpenLiteratureStatements` and `hV : VWin`, the wrapper calls the adapter with:

| Adapter input | Exact producer in `EC-S1` | What must remain visible |
|---|---|---|
| `P` | `published_results_eigen O` | the full `UnitaryGroupThirdPlaceHypotheses` record; in particular `greenRegularCharacters` and `nLink` |
| `F` | `published_results_first O` | the full `ThetaLocalInputs` record |
| `hA` | `(theta_integrals_agree_and_local_matching_of_literature O).1` | first projection of one shared conjunction |
| `hM` | `(theta_integrals_agree_and_local_matching_of_literature O).2` | second projection of the same conjunction |
| `hX` | `topCovolSlim2_use_alt_alt` applied to fifteen displayed premises | produces `CovolumeBoundOfX`; it is not an axiom-free scalar estimate |
| `hL` | `local_langlands_gl_recT_exists_of_literature O` | constructed from twelve named local/global representation-theoretic inputs |
| `hV` | the wrapper's second argument | not derived from `O` in this theorem |

The shared theta pair itself is

```
theoremK_head2
  (eis_bl_of_literature O)
  (siegel_weil_std_of_literature O)
```

so the two projections must not be described as independent hypotheses.

The fifteen covolume premises (`EC-S6`) are, in order: resolution in characteristic zero,
principalisation in characteristic zero, inverse Poincaré–Lelong, Hilbert–Samuel use, Moriwaki
bigness, Fargues exactness, Zarhin's statement, nef Riemann–Roch, Siegel toroidal integrality,
toroidal fan `KS`, seminegativity of the semi-abelian Lie bundle, point separation, arithmetic
degree, `PublishedHodgeBundleTheorems`, and Grothendieck deformation.  The theorem constructs
intermediate `HypothesesX` and `HypothesesH`, then calls `topCovolG_alt_alt` with a deep-slim bound.
This dependency must not be collapsed to “volume positivity”.

## Downstream link

`EC-S7` gives the exact final composition:

1. `everyCharacter_of_row h` forms
   `O := ⟨h, recTExists, h⟩` and supplies `vwin_of_row h` to the literature wrapper;
2. `everyCharacter` instantiates `h` with
   `galoisLocalGlobalStrong_recParameter`;
3. `riemannHypothesis` applies `riemannHypothesis_of_everyCharacter`.

This checkpoint therefore establishes the source-accurate adapter chain, not the mathematical truth
of any premise record.  In particular, the fields of `OpenLiteratureStatements`, the covolume
inputs, the Galois row, and `VWin` remain visible dependencies.

## Executed tests

- `python3 verify_every_character_adapter.py --self-test`
- `python3 verify_every_character_adapter.py --report 2026-11-24_every_character_adapter_derivation.md`
- `python3 -m py_compile verify_every_character_adapter.py`

The source-checking mode is:

```
python3 verify_every_character_adapter.py --source-root /path/to/riemann-hypothesis
```

It requires the upstream checkout at the pinned revision and verifies all seven Git blob IDs plus
the exact adapter/wrapper tokens.  That mode was not run here because this lane had GitHub source
access but no local checkout of the upstream Lean repository.

## Failed attempts and limitations

- GitHub code search returned no indexed hit for the adapter identifier.  Scanning the 33 direct
  imports of `EveryCharacterE.lean` also returned no hit.  The declaration was found by scanning
  the 201 direct imports of the final literature wrapper; it is in
  `SiegelEisensteinSecondTermHypotheses.lean`.
- No Lean executable or upstream checkout was available in this workspace, so no `lake build` or
  kernel elaboration was performed.  “Source-matched” must not be upgraded to “independently
  elaborated”.
- This contribution does not audit the internal proof of `hypotheses_nonempty_of_unramified_exponents_alt`,
  `zeroFreeAll_of_topG`, `imprimitive`, or the fifteen-premise covolume theorem.
- No URT comparison or advantage is claimed.

## RESUME HERE

Trace `hypotheses_nonempty_of_unramified_exponents_alt` backwards from its exact source declaration.
Preserve the types of `hEv`, `hN C_*`, `hFun`, and `hL3`, and determine which fields of `HypsAlt`
each one fills.  The next independent check should also locate and unpack
`zeroFreeAll_of_topG` far enough to show precisely how the `la = 3/2` shape and `VWin` character
windows imply `ZeroFreeAll`, without re-summarizing the already audited wrapper.
