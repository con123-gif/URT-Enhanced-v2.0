# MATH lane: the `TopG` / `VWin` bridge to primitive zero-freeness

## RESULT

At upstream revision `40e56bab026552e089d7afcfeff08d2defb9c005`, this checkpoint reconstructs the exact quantified proof of
`UpperTheory.Top.zero_free_all_of_green_v_win` through `zeroFreeAll_of_topG`.  The proof has **two distinct numerical
scales**:

- `la = 3 / 2` is the family-window/host-existence exponent used by `TopG`, `HostExW`, and
  `FamCore.Windows la`;
- `Ct = 401` is the exponent in `VWinAt ψ 401`, controlling the cohomological cutoff
  `⌊x^401⌋₊` in `VVle`.

`supplyChi` converts the latter hypothesis into the former host-existence statement; the source never equates the
two constants.  This corrects the compressed phrase “the `3/2` window supplied by `VWin`.”

This is a source-matched human derivation, not a new Lean proof, a re-elaboration of the upstream project, or a full
proof claim.  All premises and the later principal-character guard are preserved.

## Pinned source ledger

All paths below are in `leanprover-community/riemann-hypothesis` at the pinned revision.

| ID | Source path | Git blob | Role |
|---|---|---|---|
| `TG-S1` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean` | `c51cb6b5bd4bf2944ace89e00a2990da16bd519a` | final `HypsAlt`/Green/`VWin` wrapper |
| `TG-S2` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/ShapeOf.lean` | `236d0eadd60b292bd0a832114f8c4a6253131250` | turns the exact `HypsAlt` witness into a shape goal |
| `TG-S3` | `src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopShape.lean` | `3f791ca182db235c4a8ff582d3f038019320d5cd` | `Green`-dependent shape theorem with conclusion `TopG` |
| `TG-S4` | `src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean` | `54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1` | quantified `TopG` and the primitive zero-free bridge |
| `TG-S5` | `src/Development/AutomorphicArithmetic/CharacterBoxes/Supply.lean` | `b104f034fc9c13758e280d1b7d33ac1ea370663a` | `FReq`, its family class, and `GChi` |
| `TG-S6` | `src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean` | `398eb8ed3528aa2666e9d3b2b09a582ad4390dd7` | exact `VVle`, `VAt`, `VWinAt`, and `VWin` quantifiers |
| `TG-S7` | `src/Development/AutomorphicArithmetic/CharacterBoxes/SupplyChi.lean` | `339885b77069601fb716a60739369805241e8222` | `VWinAt ψ 401 → HostExW (3/2) ...` |
| `TG-S8` | `src/Development/AutomorphicArithmetic/CharacterBoxes/HostOfField.lean` | `d98214b25bf84966a5b4e858a35f21ac9193b49f` | arithmetic-rank premise consumed by `supplyOfAdm` |
| `TG-S9` | `src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean` | `15c5451df3e6d1dbd5ab32860dc23f8aa6b5be17` | `admissibleClassesTwistedChar`, supplying those ranks |
| `TG-S10` | `src/Development/AutomorphicArithmetic/CharacterBoxes/DivinNOfHypV.lean` | `5321920359316653b7627951429a6d7555c311b0` | `HypV` and `FamilyClassConnected` |
| `TG-S11` | `src/Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean` | `2dc9b4e690951c66ffe443e279fcada259bcce13` | derives `Level.FormB` from the r-power window theorem |
| `TG-S12` | `src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean` | `ed60b4b997cd4703713660b185b9e43fd95559a1` | exact meanings of `ZeroFreeAll` and `ZeroFreeOn` |
| `TG-S13` | `src/Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean` | `97cbdce9fcc91c4f0dcc25fef62daf4c95724afa` | separate primitive-to-arbitrary-character transfer |

## 1. Exact input theorem and shape discharge

The wrapper in `TG-S1` has the complete input boundary

\[
h_G:\mathrm{GlobalTheory.GLq.Green},\qquad
h_V:\mathrm{VWin},\qquad
h:\mathrm{Nonempty}(\mathrm{HypsAlt}(N,\mathrm{DefiniteSideCondition})),
\]

where

\[
N(\mathcal C):=\mathrm{Closed}(\mathcal C,\lambda Fm\;\_,\ \mathrm{LinkN}(Fm)).
\]

Eliminating `Nonempty` produces one witness `h₀ : HypsAlt N DefiniteSideCondition`; it does not prove that this record
exists without the upstream premises that constructed it.  The wrapper then applies

```
zeroFreeAll_of_topG (la := 3 / 2) (by norm_num) hTopG hSupply
```

with the following two independently derived inputs.

First, `hTopG : TopG` is

```
forall_goal_of_shape_of_hyps True True N TopG
  (shape_closed_link_n_of_green hG) trivial trivial h₀
```

`forall_goal_of_shape_of_hyps` in `TG-S2` is not a premise eraser: it projects every field of the actual `HypsAlt`
witness into the argument list of `TopShapeAlt`.  In particular it transports `hDivG` through `divRows3G_iff`,
repackages the nested `rRows` witness without changing its constants or quantifiers, and transports `hServ` through
`serv_t_iff_formalism_serv_t`.  The two `trivial` terms discharge only the explicit propositions `True` and `True`.

`shape_closed_link_n_of_green hG` in `TG-S3` has conclusion

\[
\mathrm{TopShapeAlt}(\mathrm{True},\mathrm{True},N,\mathrm{TopG}).
\]

Its proof constructs the closed LinkDIV, LinkEta, LinkIRR, LinkG, LinkS, selection, rank, and design inputs and then
calls `topDesWin`.  Therefore this step remains conditional on the full `HypsAlt` record plus `Green`; it is not a
deduction from `Green` alone.

Second, the supply term is pointwise in primitive characters:

\[
h_{\rm supply}:\forall\psi:\mathrm{PChar},\ 
\mathrm{HostExW}(3/2,(\mathrm{GChi}\ \psi).\mathrm{req}),
\]

and is exactly `fun ψ => supplyChi ψ (hV ψ)`.

## 2. What `VWin` supplies—and what it does not

`TG-S6` defines

\[
\mathrm{VWin}:=\forall\psi:\mathrm{PChar},\ \mathrm{VWinAt}(\psi,401).
\]

For fixed `ψ`, `VWinAt ψ Ct` means: for every real `eps` with

\[
0<\varepsilon<1/52,
\]

and every exponent selector `e : ℝ → ℕ` satisfying `PageN eps x (e x)` for every `x ≥ 1`, there exist
`J ≥ 1` and `X₀` such that, for every `X ≥ X₀` and every pair of primes `q,d` satisfying
`WinPair eps (X^(1/J)) q d`, there is `Y` with

\[
X^{1/J}\le Y,\qquad Y^2\le X,
\]

and for every `x ∈ [Y,Y²]`, every number field `E` satisfying
`IsChiField ψ (e x) q d E` satisfies

\[
\mathrm{VVle}\!left(E,\left\lfloor x^{Ct}\right\rfloor_+,
\sqrt{\exp(x^\varepsilon)}\right).
\tag{1}
\]

At `Ct=401`, (1) gives finiteness of the relevant `shaLen` terms for all integer degrees
`0<e<⌊x^401⌋₊`, plus a uniform upper bound on every finite prime-set sum.  It is a quantified
Galois-cohomology estimate, not itself a statement that a Dirichlet L-function has no zero.

## 3. The nontrivial `401 → 3/2` supply bridge

`TG-S7` proves exactly

\[
\forall\psi,\ \mathrm{VWinAt}(\psi,401)
\Longrightarrow \mathrm{HostExW}(3/2,(\mathrm{GChi}\ \psi).\mathrm{req}).
\tag{2}
\]

The proof delegates to `supplyOfAdm ψ hψ`; its remaining premise is discharged by
`admissibleClassesTwistedChar`.  Written without Lean packaging, for every
`0<eps<1/52` it supplies a threshold `x₀` such that, whenever

\[
x_0\le s.x,\qquad
s.x^{2+8\varepsilon}\le |\varphi|\le 2s.x^{2+8\varepsilon},
\]

the frame has the same `o` as `Level.cyc ψ`, and the host satisfies `KerChi ψ`, there are ranks `R` over exactly
that frame satisfying both `RankVal s R` and `admitted R H₀`.  `supplyOfAdm` passes those ranks, together with
`VWinAt ψ 401`, to `hostOfField`; its conclusion is the host-existence assertion at exponent `3/2`.

The requested family property is encoded by

\[
\mathrm{GChi}(\psi)(s,\_,H,TT,t)
:=\mathrm{EAtH}(\mathrm{Level.cyc}\ \psi,H,TT,s.x,s.\varepsilon,4)
\ \wedge\
\mathrm{VVle}(H.E,t,\sqrt{s.b}).
\tag{3}
\]

Thus (2) has substantial content: the arithmetic rank construction and field-host theorem translate the
cohomological `VWinAt` estimate into hosts satisfying both conjuncts of (3).  The exponent `401` remains inside the
input estimate, and `3/2` remains the output window exponent.  No identity `401 = 3/2`, fitted constant, or monotone
replacement is used.

## 4. Unpacking `zeroFreeAll_of_topG`

`TG-S4` defines

\[
\mathrm{TopG}:=\forall la\ G,\ 1<la\to\mathrm{HostExW}(la,G.\mathrm{req})\to
\left(\forall_{\varepsilon,Fm},G.\mathrm{cls}(la,Fm)\to\mathrm{HypV}(Fm.\mathrm{toFamCore})\right)
\to\mathrm{FamilyClassConnected}(G.\mathrm{cls}(la)).
\tag{4}
\]

For an arbitrary primitive character `ψ`, instantiate (4) with `la=3/2` and `G=GChi ψ`.  The class predicate is

\[
(GChi\ \psi).cls(la,Fm)
\equiv Fm.toFamCore.Windows(la)\ \wedge\
\forall x>Fm.x1\ \forall i:Fm.Ix(x),\ GChi(\psi)(Fm.L(x,i)).
\tag{5}
\]

The two conjuncts inside (3) are used at different stages:

1. `hypV_of_cls` uses the **second** conjunct of (5), and then the `VVle` half of (3), to give
   `HypV Fm.toFamCore` after the threshold `Fm.x1+1`.
2. After `TopG` returns `FamilyClassConnected`, `eFamC_of_cls` uses the same second conjunct of (5), now taking the
   `EAtH` half of (3), to construct `EFamC (Level.cyc ψ) Fm.toFamCore` with constants `4` and `Fm.x1+1`.
3. The **first** conjunct of (5) is passed unchanged as `Fm.toFamCore.Windows la`.

More explicitly, `FamilyClassConnected` supplies real constants `eD,eL,eps₁`, with `0<eps₁`, such that for every
`0<eps<eps₁` there is a family `Fm` in the class and constants `K,cHH,eK,CL,x₀` for which `ChainTied Fm ... x` holds
at every sufficiently large `x` in `Fm.Win`.  The proof repackages that witness as

\[
\exists Fm,\ \mathrm{EFamC}(\mathrm{Level.cyc}\ \psi,Fm.core)
\wedge Fm.core.Windows(la)
\wedge \exists K,cHH,eK,CL,x_0,\ \forall x\ge x_0,\ x\in Fm.Win\to\mathrm{ChainTied}(Fm,\ldots,x).
\tag{6}
\]

The other two inputs to `zeroFreeOn_of_tiedWin_cyc` are not generated by (4):

- `level_gm_le_on_family_scales (Level.cyc ψ)` supplies the Chebyshev inequality on the same family scales;
- `Comparison₂.formB (Level.cyc ψ)` is proved in `TG-S11` by choosing the level family and applying
  `zeroFree_of_rpow_window` with `δ=la-1` and `C=1`.

With (6), those two analytic inputs, and `1<la`, `zeroFreeOn_of_tiedWin_cyc` concludes

\[
\forall\psi:\mathrm{PChar},\ \forall s:\mathbb C,
\quad \tfrac12<\Re(s)\Longrightarrow L(\psi.\chi,s)\ne0.
\tag{7}
\]

The epsilon/zero-exclusion calculation inside that theorem was independently reconstructed in the earlier MATH
chapter `2026-11-24_window_exponent_and_character_projection.md`; this checkpoint supplies the missing upstream
`TopG` and `GChi` witnesses rather than repeating that calculation.

## 5. Primitive boundary and downstream guard

By `TG-S12`, the conclusion named `ZeroFreeAll` is precisely `ZeroFreeOn (fun _ => True)` over `PChar`, so (7) is an
**unguarded primitive-character** nonvanishing statement.  It is not yet the proposition over every Dirichlet
character, and it makes no new assertion that the trivial imprimitive L-function is holomorphic at `s=1`.

`TG-S13` is a separate theorem.  Given (7), it factors an arbitrary character's L-function into its primitive
L-function times the finite Euler correction.  Under

\[
\chi\ne 1\ \lor\ s\ne1,
\]

the source proves the primitive character is nontrivial or `s ≠ 1`, invokes `LFunction_changeLevel`, and shows each
finite Euler factor is nonzero using `Re(s)>1/2`, hence `|p^{-s}|<1`.  Only after this step does `TopPlug.lean` obtain
`UpperTheory.EveryCharacter`.

## Comparison with earlier interpretation

The earlier adapter checkpoint correctly recorded the high-level call
`zeroFreeAll_of_topG (la := 3/2) ... fun ψ => supplyChi ψ (hV ψ)`, but left its internal proof open.  The earlier
window-exponent chapter correctly reconstructed the analytic zero-exclusion calculation after the tied family had
been supplied.  This contribution closes the gap between them and corrects three possible misreadings:

1. `VWin` does not directly state a `3/2` window: it states `VWinAt ψ 401` for every primitive `ψ`.
2. `TopG` is not a consequence of `Green` alone: it consumes the full `HypsAlt` witness through the shape theorem.
3. `ZeroFreeAll` is the primitive statement; the `(χ ≠ 1 ∨ s ≠ 1)` guard appears only in the subsequent
   `imprimitive` transfer.

No premise or axiom dependency has been removed, and no URT advantage is claimed.

## Executed tests

- `python3 verify_topg_vwin_bridge.py --self-test`
- `python3 verify_topg_vwin_bridge.py --report 2026-11-24_topg_vwin_zero_free_bridge.md`
- `python3 -m py_compile verify_topg_vwin_bridge.py`

The optional source mode is:

```
python3 verify_topg_vwin_bridge.py --source-root /path/to/riemann-hypothesis
```

It requires an upstream checkout at the pinned revision and checks all thirteen blob identities plus exact theorem
and definition tokens.  That mode was not executed here because the upstream source was available through the
GitHub connector but no local upstream checkout was present.

## Failed attempts and limitations

- GitHub code search returned no indexed result for `zeroFreeOn_of_tiedWin_cyc`; the exact call and instantiated
  premises were instead verified from `ZeroFreeAllOfTopG.lean`, while its epsilon calculation was cross-checked
  against the pinned source ledger already recorded in the prior MATH window chapter.
- The recursive Git-tree endpoint closed during an oversized response, so source discovery proceeded through
  pinned directory and file fetches.
- No Lean executable or upstream checkout was available, so no `lake build` or kernel elaboration was performed.
- This does not reconstruct the internals of `shape_closed_link_n_of_green`, `hostOfField`, or
  `admissibleClassesTwistedChar`; it preserves them as explicit named dependencies with exact boundaries.
- This is not a proof that the `HypsAlt`, `Green`, or `VWin` premises are mathematically true.

## RESUME HERE

Trace `supplyOfAdmOf` and `hostOfFieldOf` backwards far enough to identify exactly where the `WinPair` primes and
the `IsChiField` embedding data discharge `EAtH` and where the `VVle` term is transported from cutoff `⌊x^401⌋₊`
to the host rank `R.t`.  Preserve every inequality, divisibility condition, and field quantifier.  If another lane
has already reconstructed that supply internals path, instead trace the construction of `FamilyClassConnected`
inside `topDesWin`, especially the common-family synchronization of `EFamC`, `Windows`, and `ChainTied`.

