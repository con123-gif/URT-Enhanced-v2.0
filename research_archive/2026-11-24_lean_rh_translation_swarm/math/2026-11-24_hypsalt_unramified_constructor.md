# MATH lane: constructing `HypsAlt` from unramified-exponent data

## RESULT

This run reconstructs the exact theorem immediately behind the seven-input `EveryCharacter`
adapter:

`GlobalTheory.Fc.S0.StageU.hypotheses_nonempty_of_unramified_exponents_alt`.

At upstream revision `40e56bab026552e089d7afcfeff08d2defb9c005`, the theorem turns one
unitary/global package, one rational-row premise, a recursive local-Langlands parameter, a real
dependence parameter, a retwisting point, and four late row/link conditions into an inhabited
`HypsAlt S0.NL DefiniteSideCondition` bundle.  The late inputs do not fill four independent final
fields: the prime bound becomes `nRest`; the functional and covolume links jointly enter `rRows`;
and the evaluation premise first constructs the member/existence data used by the class-selection
step.

Status: **SOURCE-MATCHED**.  This is a human derivation of the pinned Lean source, not a replacement
proof, not a transitive axiom audit, and not a local Lean elaboration.

## Source ledger

| ID | Pinned source path | Git blob | Declaration |
|---|---|---|---|
| `HA-S1` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean` | `c0ce994aa86f737b707b5617fb10bcfb35c0117e` | line 41, `hypotheses_nonempty_of_unramified_exponents_alt` |
| `HA-S2` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/MemberBundlesLargeUnramifiedExponents.lean` | `18ce45e0cb7d9555897580f6c5565217bea190a6` | lines 34, 69, member/existence constructor and exported alias |
| `HA-S3` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LinkROfIsLinked.lean` | `66e5fddcb389f78669cef5787ef2c648d537bf4d` | line 50, `allRows_of_open0_alt` |
| `HA-S4` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/AllRows.lean` | `be24ab5328945e90d2b981ff43ed9f20bb8b86ac` | line 12, `AllRowsAlt` |
| `HA-S5` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/NonemptyHypsOfAllRows.lean` | `6a09205dfc3e57486ecbc27517072f3c27f09a51` | line 19, `nonempty_hyps_of_allRows_alt` |
| `HA-S6` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/Hyps.lean` | `7e51220c82d43cf3a9345e87a9aa8751b38a5a25` | line 22, `HypsAlt` |
| `HA-S7` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/CFinal.lean` | `4a29a074e7b79272cca68b0e34b7191d282b9136` | line 19, `final_alt_alt` |

All paths and blob identities are for the pinned upstream commit above.

## Exact theorem boundary

Write

\[
p_0=\operatorname{parametersOfDependence}(h_L,c),
\]

and, for `A : GroupRetwisting.AtP`,

\[
N_A=\operatorname{extensionWithAtProperty}
  (h_L,\operatorname{extensionWithOrigin}(h_L,c),A),
\qquad
p_A=\operatorname{parametersOfExtension}(N_A,\mathrm{SExt.none},
\operatorname{geoCl}(\mathrm{anyGeometry})).
\]

`HA-S1:41` has the following quantifier order and premises:

1. `P : GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses`;
2. `hR : S0.RowRat`;
3. `hL : UpperTheory.Zero.LLC.RecTExists`;
4. `cDep : ℝ`;
5. `A : GroupRetwisting.AtP`;
6. `hEv : EvLgG A`;
7. `hN : RL.LinkedAt p₀ (...)`, where the predicate is

   ```
   fun Q L => R1.SlotNormCondition Q L
     fun 𝒞 => Closed 𝒞
       fun Fm _ => NLink.BoundAtTwoThreeFamilyFonAlt Fm
   ```

8. `hF : RL.LinkedAt p_A S0.FunctionalCondition`;
9. `hL3 : RL.LinkedAt p_A S0.CovolumeBoundThirdPlaceSeries`.

The conclusion is exactly

```
Nonempty (GlobalTheory.Fc.HypsAlt S0.NL
  GlobalTheory.Fc.DefiniteSideCondition)
```

The nesting matters.  `hN` lives initially at `p₀`, while `hF` and `hL3` already live at the
stronger extension `p_A`.  Replacing all three by predicates at one unnamed parameter erases the
transport obligation in the proof.

## Step 1 — evaluation produces the class-selection inputs

The first proof line is

```
obtain ⟨hP, hMem, hEx⟩ :=
  large_unramified_exponent_bundles_exist_alt P hR hL cDep A hEv
```

By `HA-S2`, these outputs have the exact types

\[
\begin{aligned}
h_P &: \mathrm{StandardLattice.SiegelMassRatioCM},\\
h_{Mem} &: \mathrm{MemberE}(p_A.s),\\
h_{Ex} &: \mathrm{ExBL}\bigl(
  KPx,\mathrm{IsBuiltE}(p_A.s),\mathrm{IsGoodE}(p_A.s),
  \mathrm{BundleLinkage}(p_A)\bigr).
\end{aligned}
\tag{1}
\]

Thus `hEv` is not copied into `HypsAlt`.  It is consumed inside the member-bundle theorem.  That
theorem builds compatible-system membership and rational weights from fields of `P` and `hR`,
constructs multiplicative closure, and uses `hEv` in
`memberE_extensionWithAtProperty_of_evLgG`.  Its final Weil-block existence statement supplies
`hEx`.  In the last constructor (`HA-S5`), `hP`, `hMem`, and `hEx` are precisely the inputs that
permit `classSel` to choose a family class and raw selection.

## Step 2 — the prime bound is converted and transported

The theorem next obtains `prN` and `serN` from

```
hyps_e_third_layer_ser_n_of_geometric_galois P.litN P.toHypothesesX
```

and forms

```
hNrow := UpperTheory.GalC.final_alt_alt
  P.nLink prN P.toHypothesesX serN P.depthZeroSupport'
  P.localFiniteness P.localTateDuality P.localEulerChar
  hL cDep hN
```

The final argument remains the original two/three-prime linked condition `hN`; it is not dropped.
`final_alt_alt` (`HA-S7`) delegates to `final_of_alt`, adding the good-cut facts and Galois
preconditions constructed from the displayed local and geometric hypotheses.  The resulting
`hNrow` is the `S0.NL` norm row at the dependence parameters `p₀` (its exact type is forced by the
subsequent typed transport).

The transport theorem

```
open_and_linked_of_stronger_extension_alt ...
```

returns `hmono`.  Its second projection sends the open assertion from `p₀` to `p_A`; its first
projection transports a linked row.  Therefore

```
hN' : RL.LinkedAt p_A
  (fun Q L => R1.SlotNormCondition Q L S0.NL)
```

is defined by

```
hmono.1 (fun 𝒜 _ => S0.NL (Cp.D3 3 𝒜)) hNrow.
```

This explains why the original prime estimate does not appear verbatim in the final record: it is
used to manufacture the stronger-extension `S0.NL` row, and that row later becomes `nRest`.

## Step 3 — build all 26 row obligations

Let `hO` be the open-parameter statement at `p₀`, constructed from `P`, and let
`hO' := hmono.2 hO` be its transported version at `p_A`.  The proof calls
`allRows_of_open0_alt` (`HA-S3`) with:

- seven published inputs from `P` (Artin reciprocity, Siegel–Weil convergence, discrete-series
  cover/classification, Harish–Chandra modules, rapid decay, Casselman–Wallach);
- the two components of `ontoX_and_lamLow_of_unitaryGroupHypotheses' P`;
- `hL`, the extension `N_A`, `SExt.none`, `geoCl anyGeometry`, and the family predicate `S0.NL`;
- the four row premises `hO'`, `hL3`, `hF`, and `hN'`.

The result is

\[
h_{All}:\mathrm{AllRowsAlt}
  (KPx,\mathrm{IsBuiltE}(p_A.s),\mathrm{IsGoodE}(p_A.s),
   \mathrm{BundleLinkage}(p_A),S0.NL,\mathrm{DefiniteSideCondition}).
\tag{2}
\]

`AllRowsAlt` (`HA-S4`) has 26 named fields.  `allRows_of_open0_alt` fills them as follows:

| Source | Fields of `AllRowsAlt` |
|---|---|
| transported open record `hO'` | `jOn`, `hPA`, `hLamP`, `hDivG`, `hDcPtG`, `selJ`, and the open subfields used to derive `hTw`, `zL`, and `rRows` |
| fixed/constructive row theorems | `hn4`, `hInstR`, `aC2`, `aP10`, `aAtG`, `aPt0`, `aPtTw`, `aPer0`, `aPerTw`, `tie`, `hRB`, `sLp`, `sO`, `hServ`, `hTF`, `c30` |
| `hL3` and `hF` | used together, with open fields, inside the proof of `rRows` |
| transported prime row `hN'` | copied exactly as `nRest` |

The key exact code is `nRest := hN`.  Here the local parameter name `hN` in `HA-S3` denotes the
already transported `hN'` supplied by `HA-S1`, not the original `BoundAtTwoThreeFamilyFonAlt`
premise at `p₀`.

The functional and covolume rows are not standalone fields of `HypsAlt`.  In `HA-S3` they are
conjoined with `hPA`, `hDivG`, `good`, `geo`, `mi`, `kap`, and `df`; the combined row is passed to
`row_rRows_stage0_alt`, producing `AllRowsAlt.rRows`.  Any summary that says “`hF` fills a
functional field and `hL3` fills a covolume field” is false for this record layout.

## Step 4 — simultaneous class selection constructs `HypsAlt`

The final call is `nonempty_hyps_of_allRows_alt` (`HA-S5`).  Its complete theorem boundary is:

\[
\begin{aligned}
&\mathrm{SiegelMassRatioCM}\to\mathrm{LitThin}\to\mathrm{WuDecayOfGap}
\to\mathrm{RowsFinDim}\to\mathrm{TypeP}\to\mathrm{RowNGP}\to\mathrm{RowMainEqP}\\
&\to(\forall D,\mathrm{MassRatioUnderVolume}(D))
\to(\forall D,\mathrm{GenusMassAt}(D,2))\\
&\to\forall KP,Q,Q',Lk,N,DR,\\
&\quad(\mathrm{MinkDiv}\to\mathrm{BaseCond}\land\mathrm{FirstG}
      \land\mathrm{ExportF}\land\mathrm{SecondG})\\
&\quad\to\mathrm{ExBL}(KP,Q,Q',Lk)
\to\mathrm{AllRowsAlt}(KP,Q,Q',Lk,N,DR)
\to\mathrm{Nonempty}(\mathrm{HypsAlt}(N,DR)).
\end{aligned}
\tag{3}

In `HA-S1`, (3) is instantiated with `KPx`, the inferred built/good slots and bundle linkage,
`N := S0.NL`, and `DR := DefiniteSideCondition`.  Its remaining inputs are:

- `hP` from (1);
- fixed literature/row constants (`litThin`, `wuDecayOfGap`, `rowsFinDim_link`, `rowsPos_typeP`);
- `rowNGP` and `rowMainEqP` derived from `P.siegelWeilUnitaryConvergent2`;
- the volume ratio from the same Siegel–Weil premise and `genusMassAt_two`;
- `(fun _ => hMem)`, `hEx`, and `hAll` from (1)–(2).

The difficult operation in `HA-S5` is not fieldwise copying.  It first obtains counting constants
from `hAll.c30`, appends all 26 row predicates (plus the `hTu` row) with repeated `RowL.and`, and
calls `UpperTheory.Top.classSel`.  This single selection returns one common family class `𝒜`, one
raw selection `σ`, existence/duty witnesses, and all row conclusions for that same choice.  Only
after that simultaneous choice does the proof construct the `HypsAlt` record.

The final 46 fields fall into four auditable groups:

1. **Chosen data:** `𝒜`, `σ`, `cT`, `hEx`, `hduty`, `hMt`.
2. **Rows selected from `hAll`:** `hRB`, `hTw`, `hPA`, `hLamP`, `hDivG`, `hDcPtG`, `hTF`,
   `sLp`, `sO`, `h30`, `hInstR`, `selJ`, `jOn`, `rRows`, `aPt0`, `aPtTw`, `aPer0`, `aPerTw`,
   `aP10`, `aAtG`, `aC2`, `hServ`, `irrC`, `zL`, `tie`, and `nRest`.
3. **Fixed structural/literature inputs:** `hLit`, `hWu`, `hRF`, `sTy`, `sNG`, `sM`, `hU`, `hG`.
4. **Counting and transfer data:** `hTu`, `hn4`, `c30`, `hc30`, `cIc`, `hcI`.

Several selected rows are restricted from the working class to the final closed class using
`Closed.sub` and the two inclusions `s1`/`s3`; `selJ` uses `Classical.choice`.  Those operations are
part of the proof and prevent the construction from being described as a purely constructive
record literal.

## Exact dependency map of the four late inputs

| Input to `HA-S1` | Consumed by | Exact downstream effect |
|---|---|---|
| `hEv : EvLgG A` | `large_unramified_exponent_bundles_exist_alt` | produces the member/existence package enabling `classSel`; no direct `HypsAlt` field |
| original `hN` at `p₀` | `final_alt_alt`, then `hmono.1` | becomes `hN'` at `p_A`, then `AllRowsAlt.nRest`, finally `HypsAlt.nRest` |
| `hF : LinkedAt p_A FunctionalCondition` | `allRows_of_open0_alt` | one conjunct used to prove `AllRowsAlt.rRows`, finally `HypsAlt.rRows` |
| `hL3 : LinkedAt p_A CovolumeBoundThirdPlaceSeries` | `allRows_of_open0_alt` | one conjunct used to prove the same `rRows`; not a separate final field |

This completes the unresolved mapping left by the preceding adapter chapter.

## Downstream link and scope

`nonempty_hyps_definite_side_of_closed_bound` supplies the nine inputs above at
`cDep = max CF0 CF1` and `A = GridA (max CF0 CF1)`.  Its output is passed unchanged to
`every_character_of_green_v_win`, which uses the `HypsAlt` witness in the zero-free character-box
theorem.  The present chapter therefore explains the record-construction bridge; it does not prove
the analytic zero-free theorem, the local/global Galois inputs, or any premise record.

No hypothesis has been discarded.  No URT scheduling or mathematical advantage is claimed.

## Executed tests

- `python3 verify_hypsalt_constructor.py --self-test`
- `python3 verify_hypsalt_constructor.py --report 2026-11-24_hypsalt_unramified_constructor.md`
- `python3 -m py_compile verify_hypsalt_constructor.py`

The verifier also supports

```
python3 verify_hypsalt_constructor.py --source-root /path/to/riemann-hypothesis
```

which checks all seven upstream Git blobs and the exact source tokens.  That mode was not executed
here because the pinned upstream repository was available through the GitHub connector but was not
materialized as a local checkout.

## Failed attempts and limitations

- Direct code search was not relied on: the relevant declaration is in a very large generated
  module tree.  It was located from the exact import list of the already-audited adapter file.
- The first likely file, `AllRows.lean`, defines only the 26-field record.  The constructor is in
  `LinkROfIsLinked.lean`; assuming a filename-to-theorem match would have missed the actual proof.
- Lean, Lake, and the upstream checkout were unavailable locally.  No kernel elaboration,
  `#print axioms`, or transitive trust audit was run.
- The types of intermediate `hNrow` and the inferred slots passed to the final constructor are
  source-forced by their subsequent typed uses, but were not independently printed by Lean in this
  run.
- This does not unpack `final_of_alt`, `row_rRows_stage0_alt`, `classSel`, or
  `zeroFreeAll_of_topG`; each remains a separate proof obligation.

## RESUME HERE

Trace `UpperTheory.Top.zeroFreeAll_of_topG` at the pinned revision.  Record its full quantifier
boundary, then show exactly how `forall_goal_of_shape_of_hyps`, the fixed `la = 3/2`,
`supplyChi`, and `VWin` discharge its hypotheses.  Preserve the primitive/imprimitive boundary and
do not repeat the already completed `HypsAlt` construction.

HANDOFF TO: MATH, character-box audit, integration, proof editor.
