# MATH lane — the short `uF` and logarithmic envelope inside the window bound

**Date:** 2026-11-25  
**Result:** SOURCE-MATCHED reconstruction of pinned `u_function_le_mean` and `phi_bound`, including
their exact composition in `Ga_bound5`.  
**Status:** PARTIAL. This isolates an elementary adapter in the prime-window argument; it does not
prove the required window estimate, its eleven premises, RH, or any URT advantage.

## Source ledger

Required RH revision: `40e56bab026552e089d7afcfeff08d2defb9c005`. Its manifest blob
`b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `src/Formalism/RankGapBounds/MeanBoundSecondForm.lean` | `e4332fd8680d2b2f82e0a1e44a276453e03e2109` | definitions of `s`, `uF`, `HidaSetting`, `SlopeIneq`, `HHBound` and `Vvar` |
| `src/Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean` | `9172d2d30c5cec478b08c10a4b34e39fa16ab981` | elementary real inequality `phi_bound`, `K3`, and nonnegativity of `uF` |
| `src/Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean` | `f9f34a9147750e215a6b2f206eb6f9889aa726b6` | `Lo5`, the two quotient-slope inequalities, and the pointwise target |
| `src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean` | `e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef` | `Vvar_bound5`, `u_function_le_mean`, `Ga_bound5`, final assembly |
| `src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean` | `ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5` | local consumer of `each_unit_bound_statement` |

Fresh upstream HEAD on 25 November was `a18a350c3e5aad997766cff2670b292313e46574`.
Several corresponding files have changed or moved there. This reconstruction remains pinned to the
user-specified revision; no cross-revision equivalence or kernel claim is made.

## 1. Exact inputs and notation

Fix finite `U0`, nonempty finite fibres `W(u0)`, finite `Top`, naturals `m,f`, data `D`, constants
`C`, and real `Xpp`. Fix `u0:U0`. Define

    s = weighted_mean_d (muN(u)-h(u)),
    uF = max_u (muMaxN(u)-h(u)) - s.                    (1)

`HidaSetting` supplies strictly positive weights `d(u)`, `muN(u)<=muMaxN(u)`, positive `b`, and
the remaining sign conditions. Hence the weighted mean in (1) cannot exceed the maximum, so

    0 <= uF.                                             (2)

Write

    P+ = cSlope*nT*a*La,
    P- = cSlope*nT*a*La*(1+m/k),
    C0 = cSl1*m*B0,
    V  = Vvar,
    K3 = P+ + P- + V + C0.                              (3)

The equality in (3) is the source definition
`cSlope*nT*a*La*(2+m/k)+Vvar+cSl1*m*B0` expanded once.

## 2. Short derivation of the `uF` envelope

Set

    q(u) = -Ee(u)-h(u).                                  (4)

`Vvar_bound5`, derived from `EComp5`, `HComp` and the within-fibre `Count5` comparison, says

    q(u)-q(u') <= V                                      (5)

for every pair `u,u'` in the same fibre. The two `QuotientSlopeBoundsWith` inequalities and the
upper/lower `Slopes` bounds give

    muMaxN(u)-h(u) <= P+ + Ga+Fo+C0+q(u),                (6)
    muN(u')-h(u')   >= -P-+Ga+Fo+q(u')-Lo5(u').          (7)

Subtract (7) from (6), use (5), and cancel `Ga+Fo`. Exactly

    muMaxN(u)-h(u)-K3-Lo5(u') <= muN(u')-h(u').          (8)

No positivity of `Lo5` is used. Average (8) over `u'` with the positive weights `d(u')`:

    muMaxN(u)-h(u)-K3-weighted_mean_d(Lo5) <= s.         (9)

Now take the finite maximum over `u` and use (1). This proves the exact source conclusion

    uF <= K3 + weighted_mean_d(Lo5).                     (10)

The apparent complexity of `u_function_le_mean` is therefore one pairwise transport, one weighted
average and one finite maximum. The substantive inputs are (5)–(7); the supremum manipulation is
an adapter, not new cancellation.

## 3. The logarithmic `phi_bound`

The pinned general lemma takes real numbers `u,H,X,b,U` with

    0<=u, 0<H, H<=X*b, 0<b, 0<X, u<=U,                 (11)

and concludes

    u*log(1+H/u) <= log(1+X)*(U+b).                     (12)

Lean uses total division. If `u=0`, the left side is zero. Suppose `u>0`. Apply

    log z <= log A + z/A - 1                            (13)

to `z=1+H/u` and `A=1+X`. Multiplying by nonnegative `u` and simplifying gives

    u*log(1+H/u)
      <= u*log(1+X) - u*X/(1+X) + H/(1+X).              (14)

By (11), the first term is at most `U*log(1+X)`, the negative middle term may be discarded, and
`H/(1+X)<=b*X/(1+X)`. Finally

    X/(1+X) <= log(1+X),                                (15)

which is the source consequence of `log t <= t-1` applied at `t=(1+X)^-1`. Equations (14)–(15)
give (12). The difficult-looking logarithmic expression is controlled without a series expansion,
asymptotics or a tuned constant.

## 4. Exact application in `Ga_bound5`

The source substitutes

    u = uF,
    H = HH,
    X = x^cHH,
    b = D.b,
    U = K3 + weighted_mean_d(Lo5).                       (16)

Premise (2) supplies `u>=0`; `HHBound` supplies `0<HH<=x^cHH*b`; `HidaSetting` supplies `b>0`
and `x>0`; real powers give `x^cHH>0`; and (10) supplies `u<=U`. Hence

    uF*log(1+HH/uF)
      <= log(1+x^cHH)*(K3+weighted_mean_d(Lo5)+b).        (17)

`Ga_bound5` multiplies (17) by four, bounds the separate
`(eta+4*sqrt(e))*HH` term, and uses `del<=delBar<1` to enlarge the inverse factor. The preceding
`key_identity5` changes `K5v5` to `Main+K0v5`; it is independent of the logarithmic argument here.

## 5. What this simplifies—and what remains genuinely unresolved

This reconstruction compresses the `uF`/logarithm block to (5)–(17). It does **not** supply a new
square-root cancellation estimate. In particular, positivity alone does not prove the required
window bound. The non-adapter obligations are the actual source proofs of:

- the variation estimate behind (5), especially `HComp` and the within-fibre `Count5` bound;
- both quotient-slope comparisons (6)–(7);
- `SlopeIneq`, `HHBound`, `LossBounds`, and the arithmetic bound on the resulting error term.

Thus `phi_bound`, averaging and maximisation should not be treated as the hidden RH mechanism. The
shortest unresolved mathematical obstruction is upstream: obtain the quantitative `Count5` and
quotient-slope inputs uniformly for the character family strongly enough that the final error is
below the square-root-scale main window.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_uf_phi_envelope.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_uf_phi_envelope.py

The exact rational part enumerates deterministic three-point fibres, verifies every pairwise form
of (8), and then verifies (10) for positive weights. A 70-digit Decimal grid checks (12), including
the `u=0` branch. Negative controls remove `u<=U`, `H<=X*b`, and the variation bound separately.
These finite checks are regressions of the reconstructed skeleton, not universal proofs.

Observed output:

    uF/phi envelope regression: OK; report_checks=6, pairwise_bounds=129120,
    weighted_envelopes=15072, phi_grid=540, zero_branches=108,
    negative_controls=3

## Failed attempts / limitations

- Dropping `u<=U` makes (12) false; `u=100,H=X=b=1,U=0` is a counterexample.
- Dropping `H<=X*b` makes (12) false; `u=U=X=b=1,H=100` is a counterexample.
- Omitting the variation bound (5) breaks pairwise transport in (8).
- Positivity of the family weights does not itself supply (5)–(7) or a square-root window bound.
- Decimal checks supplement the exact human derivation; they are not exact real arithmetic or a
  Lean elaboration.
- No Lean, Lake or Elan executable was available locally. Imported premises and transitive axioms
  remain unaudited.

## RESUME HERE

Trace the pinned `PChain.lean` calls that construct `Count5` and `QuotientSlopeBoundsWith` for the
actual `ChTop` data. Classify each call as algebraic adapter or genuine cancellation/sign input, and
isolate the first single quantitative inequality that still carries the square-root window burden.
Do not expand unrelated manuscript branches.

**HANDOFF TO:** MATH, dependency, audit, integration, prime-window.
