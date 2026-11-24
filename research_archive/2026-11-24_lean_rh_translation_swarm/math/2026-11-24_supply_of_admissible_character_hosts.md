# MATH lane: admissible character data supply the `GChi` host

## RESULT

At `leanprover-community/riemann-hypothesis` revision
`40e56bab026552e089d7afcfeff08d2defb9c005`, this checkpoint reconstructs the difficult interior of
`UpperTheory.T3.supplyOfAdmOf`: how

\[
\mathrm{VWinAt}(\psi,401)
\quad\text{and}\quad
\text{eventual admissible ranks for }\psi
\]

produce

\[
\mathrm{HostExW}\!left(\frac32,
  \lambda\_\ s\ R\ H\_.\;
  \mathrm{EAtH}(\mathrm{Level.cyc}\ \psi,H, H.TT,s.x,s.\varepsilon,4)
  \wedge \mathrm{VVle}(H.E,R.t,\sqrt{s.b})
\right).
\tag{1}
\]

The source has a precise three-stage cutoff conversion

\[
\lfloor (x')^{401}\rfloor_+
\longrightarrow \lfloor x^{400}\rfloor_+
\longrightarrow R.t,
\tag{2}
\]

not a direct substitution of `401` by `3/2`.  The first arrow is proved in `winPairs` by rescaling
`x=kx'`; the second is the eventual rank estimate `R.t ≤ x^400`.  This fills the exact gap left by the
previous `TopG`/`VWin` chapter.

Status: **SOURCE-MATCHED conditional derivation**.  It is not an independent Lean elaboration, does not prove the
input analytic-prime or admissible-rank theorems, and does not establish RH by itself.

## Pinned source ledger

| ID | Pinned source path | Git blob | Declaration or role |
|---|---|---|---|
| `SA-S1` | `src/Development/AutomorphicArithmetic/ShortNorms/supplyOfAdmOf.lean` | `04ca5068e90544580c7684a316ec79c49d3572fc` | the proof reconstructed here |
| `SA-S2` | `src/Development/AutomorphicArithmetic/CharacterBoxes/SupplyChi.lean` | `339885b77069601fb716a60739369805241e8222` | specializes `supplyOfAdmOf` to the native host theorem and ranks |
| `SA-S3` | `src/Development/AutomorphicArithmetic/CharacterBoxes/HostOfField.lean` | `d98214b25bf84966a5b4e858a35f21ac9193b49f` | specialization of `hostOfFieldOf` |
| `SA-S4` | `src/Development/AutomorphicArithmetic/ShortNorms/hostOfFieldOf.lean` | `261b566b0ea0d155ef1a434889d720c3b439735f` | exact host-construction boundary |
| `SA-S5` | `src/Development/AutomorphicArithmetic/CharacterBoxes/WinPairs.lean` | `4670fec488d1eb59a3cc52dffc8d0eab16e16b0b` | converts `VWinAt 401` into `3/2` windows of `WinDatum` |
| `SA-S6` | `src/Development/AutomorphicArithmetic/CharacterBoxes/TwistForm.lean` | `5e8b1a992a393336dffd3603524526dfccfa1981` | `KerChi`, `TwistForm`, and exact `WinDatum` fields |
| `SA-S7` | `src/Development/AutomorphicArithmetic/CharacterBoxes/PairGood.lean` | `68d04b506355e999c0f6020ee066c4967c1e6939` | analytic prime-pair bounds and zero boxes |
| `SA-S8` | `src/Development/AutomorphicArithmetic/CharacterBoxes/PairHyp.lean` | `d47dbeec05e2463c5882a8a7643dc2bf22059f35` | converts a `WinPair` into host and Jacobi-symbol conditions |
| `SA-S9` | `src/Development/AutomorphicArithmetic/CharacterBoxes/FieldChi.lean` | `f3e2032b133ff64406a87e27438cdf467aa05a1f` | constructs the frame and raw character host |
| `SA-S10` | `src/Development/AutomorphicArithmetic/CharacterBoxes/IsChiField.lean` | `181ab535373fb54af925bfdca6af685f6955ddc5` | turns `KerChi` into the exact number-field predicate |
| `SA-S11` | `src/Development/AutomorphicArithmetic/CharacterBoxes/BoundedTw.lean` | `69e88858735720bd60454c30c64d6380e216613f` | supplies the two bounded-character fields of `EAtH` |
| `SA-S12` | `src/Development/AutomorphicArithmetic/CharacterBoxes/EventuallyRankLeRpowOfLtOneDivFiftytwo.lean` | `d60585aca568591e8192b6fd1ce9a91433c4af2d` | proves `R.t ≤ x^400` for large scales |
| `SA-S13` | `src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean` | `398eb8ed3528aa2666e9d3b2b09a582ad4390dd7` | definitions of `VWinAt`, `VAt`, and `VVle` |
| `SA-S14` | `src/Development/AutomorphicArithmetic/CoprimeRanks/AdmChi.lean` | `15c5451df3e6d1dbd5ab32860dc23f8aa6b5be17` | native admissible-rank producer used by `supplyChi` |

## 1. Complete theorem boundary

`supplyOfAdmOf` takes two higher-order inputs before fixing `ψ`.

The first is a host-construction theorem.  For every `0<eps<1/52` and `C₀≥1`, it returns constants
`CT2,C8,c6,Cb,x₀`, with `C₀≤C8`, `c6>0`, and `Cb>0`, such that a host can be constructed from any

- scale `s` with `s.eps=eps` and `x₀≤s.x`;
- ranks `R` satisfying `RankVal s R`;
- raw host `H₀ : HostAx R.toFrame`;
- positive integer `M` and real `Y`;
- bounds `s.J≤C₀`, `R.o≤C₀`, `H₀.QS≤C₀R.n`, and `M≤C₀`;
- divisibility `H₀.QS ∣ lcm(2^(R.e+2),M)`;
- `PairWin s Y`, `PairGood M eps Y s.x H₀.q H₀.d`;
- `FieldRows H₀.toHostRaw ⌊Y^(eps/5)⌋₊` and `admitted R H₀`.

Its conclusion is a typed `H : Host R` and prime `q₀` with the same raw host, fixed `CT2`, the complete
`HostGood s C8 4 c6 Cb H q₀` record, and the sharing bound

\[
R.toFrame.Shares(H.TT,s.x^{-1+s.\varepsilon}).
\tag{3}
\]

The second input says that for each `0<eps<1/52`, eventually every frame `φ` at the correct scale size

\[
s.x^{2+8\varepsilon}\le |\varphi|\le2s.x^{2+8\varepsilon},
\tag{4}
\]

with `φ.o=(Level.cyc ψ).o` and a raw host satisfying `KerChi ψ`, admits ranks `R` over exactly `φ` with
`RankVal s R` and `admitted R H₀`.

`SupplyChi.lean` supplies these two inputs as

```
hostOfField
admissibleClassesTwistedChar
```

and therefore proves `VWinAt ψ 401 →` (1).  No premise is synthesized by the wrapper itself.

## 2. From `VWinAt 401` to a `3/2` family of `WinDatum`

Fix `ψ` and `0<eps<1/52`.  `fieldChi ψ` first chooses integers `c,e₀`, with `1≤c`, and a constructor valid for
every `e≥e₀`.  Independently, `winPairs ψ eps c` consumes `VWinAt ψ 401` and `PairEx` and returns `J≥1` such that
for every starting point `y`, some `Z≥y` has this property:

\[
Z\le x\le Z^{3/2}
\Longrightarrow
\exists Y,q,d,e,\ \mathrm{WinDatum}(\psi,eps,J,c,x,Y,q,d,e).
\tag{5}
\]

This is the exact source of the `3/2` in (1).  It is a new outer interval assembled from the `VWinAt` data, not
the exponent in the original cohomological bound.

To see the difficult rescaling step, `winPairs` chooses `e(x')` from `PageN`, chooses the `VWinAt` scale `X`, its
prime pair `q,d`, and its interval base `W`, then sets

\[
k:=c^{1/(2+8\varepsilon)},\qquad x=kx'.
\]

Thus

\[
x^{2+8\varepsilon}=c(x')^{2+8\varepsilon},
\]

so the `PageN` inequalities become exactly the two frame-order fields of `WinDatum`:

\[
x^{2+8\varepsilon}\le c2^{e(x')}le2x^{2+8\varepsilon}.
\tag{6}
\]

The construction makes `k^400≤x'`.  Therefore

\[
x^{400}=k^{400}(x')^{400}\le(x')^{401}.
\tag{7}

`VVle.mono` uses (7), after taking floors, to restrict the original `VAt` cutoff
`⌊(x')^401⌋₊` to `⌊x^400⌋₊`.  It also enlarges the bound from
`√exp((x')^eps)` to `√exp(x^eps)`, valid because `x'≤x` and `eps>0`.  The resulting `WinDatum` contains

\[
\forall E,\ \mathrm{IsChiField}(\psi,e,q,d,E)
\Longrightarrow
\mathrm{VVle}(E,\lfloor x^{400}\rfloor_+,\sqrt{\exp(x^\varepsilon)}).
\tag{8}

This proves the first arrow of (2) and explains why the source needs both `401` and `400`.

## 3. Uniform thresholds and the character field

`supplyOfAdmOf` next chooses a single large `x₁` dominating five independent thresholds:

1. the host constructor's threshold;
2. the admissible-rank threshold;
3. the threshold for `R.t≤x^400`;
4. `A^J`, where `A^(eps/5)=K` and `K≥max(5,4ψ.N)`;
5. `c·2^e₀+1`.

The output window family is

\[
\{x\mid\exists Y,q,d,e,\ \mathrm{WinDatum}(\psi,eps,J,c,x,Y,q,d,e)\},
\]

with the `3/2` windows from (5).

Fix a scale `s` in that family and unpack a witness `Y,q,d,e`.  The lower bounds force

\[
Y^{eps/5}\ge K\ge4\psi.N.
\tag{9}
\]

`pairHyp` converts the `WinPair` field of `PairGood` into `HostHyp q d` and the Jacobi condition

\[
p\text{ prime},\ p\ne2,\ p\le Y^{eps/5}
\Longrightarrow \left(\frac{-d}{p}\right)=1.
\tag{10}

The proof also establishes `q≠3`: substituting `q=3` into the strict lower logarithmic bound in `WinPair`, while
`Y^(eps/5)≥5`, contradicts `log 3≤2`.

It proves `e≥e₀` by contradiction.  If `e<e₀`, then `2^e≤2^e₀`; but the lower order bound in (6), the fact
`s.x≤s.x^(2+8eps)`, and the global choice `c2^e₀<s.x` are incompatible.

Now `fieldChi` applies with (9), (10), the coprimality of `ψ.N` with `qd`, and `e≥e₀`.  It constructs a frame
`φ` and raw host `H₀` satisfying all of

\[
\begin{aligned}
&\varphi.e=e,\qquad |\varphi|=c2^e,\qquad H_0.q=q,\qquad H_0.d=d,\\
&\varphi.o=(\mathrm{Level.cyc}\ \psi).o,\\
&\mathrm{FieldRows}(H_0,\lfloor Y^{eps/5}\rfloor_+),\\
&H_0.QS\mid\operatorname{lcm}(2^{e+2},\psi.N),\qquad
H_0.QS\le4\psi.N|\varphi|,\\
&H_0.\mathrm{KeptInXp},\quad H_0.\mathrm{ExceptionalCharacterKept},\quad
\mathrm{KerChi}(\psi,H_0),\quad\mathrm{TwistForm}(\psi,H_0).
\end{aligned}
\tag{11}
\]

The admissible-rank hypothesis applies because (6) is exactly (4), giving `R`, an equality
`R.toFrame=φ`, `RankVal s R`, and `admitted R H₀`.  After transporting along the frame equality, the source derives
`H₀.QS≤C₀R.n` from the conductor bound in (11), the upper side of (6), the lower rank-size inequality, and the
chosen `C₀≥8ψ.N`.

## 4. What `hostOfFieldOf` contributes

The specialization `hostOfField` is

```
hostOfFieldOf shortNorm smallOne
```

so its proof still depends on the named short-norm and primes-in-progressions inputs in `Primes.lean`.  At the
source boundary recorded in `SA-S4`, it combines:

- `levelData`, producing the five auxiliary level primes `g₀,g₁,p,p',q₀` with congruence, norm, size, and
  disjointness conditions;
- `thinH`, `topsChoiceH`, and `pairRows`, producing the real-character, `TT`, and row bounds;
- `hof_thick`, producing the no-relation thick set `T` and its cardinality bounds;
- `hof_log_le_rpow` and `qdBig`, synchronizing the logarithmic and large-`q,d` thresholds;
- `admitted R H₀`, which materializes a `Host R` from the selected `Choices` once `FieldRows` and the lower
  `q,d` inequalities hold.

It then proves all fields of `HostGood`, including box, split, thick-set, logarithmic-derivative, thin-scale, prime
congruence, and `TT` sharing data.  This is why (1) cannot be replaced by “choose any number field having `ψ`”: the
host carries the precise analytic and Frobenius infrastructure used later by `EAtH`.

## 5. Constructing the two conjuncts of `GChi`

After `hostOfField` returns `H`, `q₀`, `HostGood`, and (3), two obligations remain.

### 5.1 `EAtH`

From `H.QS ∣ lcm(2^(e+2),ψ.N)`, every prime `l∣H.QS` divides `2ψ.N`: if `l` divides the power of two then
primality forces `l=2`; otherwise `l∣ψ.N`.  This exact elementary lemma is checked exhaustively by the companion
certificate.

`boundedTw` then consumes `TwistForm`, the conductor divisibility, that prime-divisor lemma, and
`PairGood ψ.N eps Y s.x H.q H.d`.  It supplies

- `H.BoundedCharsPointwise (Level.cyc ψ).KEPT s.x eps`;
- for every bounded primitive character, `‖logDerivativeAtOne χ‖≤4 log s.x`.

Together with the fields in (11), the sharing result (3), and `φ.o=(Level.cyc ψ).o`, these are exactly the six
components assembled by the source into

\[
\mathrm{EAtH}(\mathrm{Level.cyc}\ \psi,H,H.TT,s.x,eps,4).
\tag{12}
\]

### 5.2 `VVle` at the actual host rank

`isChiField` converts `KerChi ψ H` into

\[
\mathrm{IsChiField}(\psi,R.e,H.q,H.d,H.E).
\tag{13}

After rewriting `R.e=e`, `H.q=q`, and `H.d=d`, (8) applied to `H.E` and (13) gives

\[
\mathrm{VVle}(H.E,\lfloor s.x^{400}\rfloor_+,\sqrt{\exp(s.x^{eps})}).
\]

The eventual-rank theorem supplies

\[
R.t\le s.x^{400},
\]

hence `R.t≤⌊s.x^400⌋₊`.  A second application of `VVle.mono` restricts the cutoff to `R.t`.  Finally, the native
definitions `s.L=s.x^eps` and `s.b=exp(s.L)` identify the right-hand bound exactly:

\[
\sqrt{\exp(s.x^{eps})}=\sqrt{s.b}.
\tag{14}

Equations (12) and (14) are the two conjuncts in (1), completing the host supply.

## Downstream link and correction to the existing interpretation

`supplyChi ψ (hV ψ)` is the pointwise host premise passed to `zeroFreeAll_of_topG` in `TopPlug.lean`.  The previous
MATH checkpoint correctly separated exponents `401` and `3/2` but summarized the interior as an arithmetic-rank
and host translation.  The exact source shows an additional, essential intermediate exponent `400` and two
monotonicity steps:

\[
401\xrightarrow[\text{rescale in `winPairs`}]{x=kx'}400
\xrightarrow[\text{eventual rank bound}]{R.t\le x^{400}}R.t.
\]

The `EAtH` half does not follow from `VVle`; it separately uses `FieldChi`, `TwistForm`, `PairGood`, `boundedTw`, and
the full `HostGood` construction.  No premise has been discarded, no scalar-to-object identification is made, and
no URT speed advantage is claimed.

## Executed tests

- `python3 verify_supply_of_admissible_hosts.py --self-test`
- `python3 verify_supply_of_admissible_hosts.py --arithmetic-test`
- `python3 verify_supply_of_admissible_hosts.py --report 2026-11-24_supply_of_admissible_character_hosts.md`
- `python3 -m py_compile verify_supply_of_admissible_hosts.py`

The exact arithmetic regression exhausts `e=0,…,9`, `M=1,…,80`, every divisor
`Q∣lcm(2^(e+2),M)`, and every prime divisor of `Q`, checking that it divides `2M`.  It also runs a negative control
with the divisibility hypothesis removed.

The optional pinned-source mode is:

```
python3 verify_supply_of_admissible_hosts.py --source-root /path/to/riemann-hypothesis
```

It checks the fourteen blob identities and the exact declaration tokens.  This mode was not executed here because
the pinned source was available through the GitHub connector but no local upstream checkout was present.

## Failed attempts and limitations

- GitHub code search did not index `WinDatum` at the pinned revision; it was located by following the literal import
  from `WinPairs.lean` to `TwistForm.lean`.
- The earlier recursive-tree request was too large and closed its transport; discovery used pinned directory and
  file reads instead.
- No Lean executable or upstream checkout was available, so no `lake build`, `#print axioms`, or source-mode test
  was run.
- The finite arithmetic test checks a genuine lemma used in the source but does not simulate number fields,
  Galois cohomology, prime distribution, or Lean elaboration.
- This contribution preserves `PairEx`, `shortNorm`, `smallOne`, `admissibleClassesTwistedChar`, and the internal
  theorems used by `hostOfFieldOf` as named dependencies; it does not establish their truth independently.

## RESUME HERE

Trace the `winPairs` analytic input `QH.pairEx` backwards through the pair-prime construction.  Preserve the
quantifiers of `PairEx`, the dependence of `q,d` on `M,eps,A,Y`, all zero-box and character-sum bounds in
`PairGood`, and the source of the strict limit `eps<1/52`.  Explain how the special congruences
`q≡3 (mod 8)`, `d≡7 (mod 16)`, and `q∣d+1` are jointly produced; do not replace them by a generic “choose large
primes” statement.

