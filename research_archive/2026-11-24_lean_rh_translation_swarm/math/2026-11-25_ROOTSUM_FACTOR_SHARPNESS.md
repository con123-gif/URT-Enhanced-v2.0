# `rootSum` factor sharpness at rank two

**Lane:** MATH / mandatory unified reduction, run 32  
**Status:** EXACT MATHEMATICAL OBSTRUCTION; source-matched; executable exact certificate passed; full Lean example not compiled  
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The remaining factor `2^(n+1)` in the pinned generic `RootSum` theorem cannot be reduced by a better cardinality estimate while keeping the theorem's present conclusion.  At `n=2` there is a valid input eigendatum for which the mandated injected carrier has exactly

\[
\boxed{2^2\cdot 2\cdot |S|=4\cdot2\cdot2=16
      =2^{2+1}|S|.}
\tag{1}
\]

The first factor is the exact number of square-root multisets, the second is the theorem's mandatory `Bool`, and `|S|=2` is the Galois orbit of the eigendata.  Since `RootSum` requires an injective map from this carrier into `D'.S`, every valid witness has `|D'.S|>=16`; the source upper bound is also 16.  Thus the coefficient eight at rank two is sharp for the **generic contract**, not merely for its present proof.

This stops the attempted arithmetic reduction of the `rootSum` factor.  Any improvement in the actual `countQ_alt` caller must instead prove additional restrictions on its automorphic eigenvalue multisets, or replace the Boolean fibre-separation contract with a new checked classifier argument.

## Exact tight input

Let

\[
\varphi=\frac{1+\sqrt5}{2},\qquad u=\varphi^{-1}=\varphi-1,
\]

and take

- `n=2`, `p=3`, `f=2`, hence `q=p^f=9`;
- weight vector `m=(1,-1)` and `wt=0`;
- `S={+,-}`;
- `beta(+):={phi,u}` and `beta(-):={-u,-phi}` as multisets.

These data meet the actual `EigData 2 9 m 0` fields:

1. **Cardinality:** both multisets have two elements.
2. **Galois closure:** every automorphism of `C` restricts on `Q(sqrt5)` either to the identity or to `sqrt5 -> -sqrt5`.  The nontrivial action sends `phi -> -u` and `u -> -phi`, interchanging the two states.
3. **Window:** `Win 9 0` has centre `c=1` and scale `sqrt(9)=3`.  From `2<sqrt5<3`,
   `1/3<u<1<phi<2<3`; every entry therefore satisfies `1<3|b|` and `|b|<3`.  In both states the product of absolute values is `phi*u=1=c^2`.
4. **Integrality:** `phi` and `u` satisfy the monic equations `phi^2-phi-1=0` and `u^2+u-1=0`; their negatives and inverses are again among the four displayed algebraic integers.  For `m=(1,-1)`, each premise in either `int` or `intInv` forces the integer exponent `a>=1`, so `9^a b` and `9^a b^{-1}` are integral.
5. **RootSum parameters:** `1<=f<=2` and `q=p^f` hold exactly.

For either state, the two target eigenvalues are distinct, nonzero and have different absolute values.  Each has two square roots, and independently choosing a sign produces four distinct multisets `B` with `B.map (x -> x^2)=beta(s)`.  The fibres for the two states are disjoint because their squared multisets differ.  Hence

\[
\left|\{(s,B):B^2=\beta(s)\}\right|=2\cdot4=8.
\]

The exact `RootSum` conclusion in `WinDefs.lean` requires an injection

\[
\{(s,B):B^2=\beta(s)\}\times\mathrm{Bool}\hookrightarrow D'.S,
\]

so `|D'.S|>=8*2=16`.  The source theorem gives `|D'.S|<=2^(2+1)*2=16`, proving equality.

## Source and root reachability

- `src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/AdmissibleResidues/WinDefs.lean`, blobs:
  - pinned file `05d36e61e5740cf2eef83d75c5882b29eea6d2fa`;
  - `EigData` fields and `RootSum` statement.
- `src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/AdmissibleResidues/SumThree.lean`, blob `17b9f64eeabb09c08b0487991c05296b03c6b396`:
  - definitions `WinC` and `Win`.
- `src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/AdmissibleResidues/FrobeniusTraceCountBoundOfRatEigensystemCount.lean`, blob `fc375ef5c996180c985df22cc3f15655a9765126`:
  - `finite_and_card_map_pow_eq_le_two_pow_of_le_two`;
  - `rootSum`, whose carrier is the sigma of power fibres times `Bool`.
- Actual caller: `.../DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean`, blob `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40`, declaration `countQ_alt`.

Static pinned path:

`Main.riemannHypothesis -> ... -> CountI -> NumberU3U_s -> KeepNumU -> rank-two trace classifier -> countQ_alt -> rootSum`.

## Unified-reduction conclusion

- **Exact cancellation/aggregation:** exhausted at this node; the previous full-family aggregation remains valid, but the internal `2^(n+1)` factor has a matching lower example.
- **Symmetry:** Galois symmetry doubles the state orbit rather than identifying the square-root fibres.
- **Premise weakening:** none is justified for generic `RootSum`; its injected carrier is part of the conclusion and forces the lower bound.
- **Backtracking:** retain the original `rootSum` factor.  Search only for a caller-specialized theorem using extra `countP_alt` structure.
- **Context cache:** key this obstruction by `(pin, RootSum, n=2, p=3, f=2, m=(1,-1), wt=0, golden-unit orbit)`.  It blocks only generic coefficient reductions, not specialized automorphic ones.
- **Original/reduced graph:** no edge is deleted.  The candidate arithmetic-reduction branch is rejected; all `countP_alt`, fibre, `Bool`, classification and root-frontier obligations survive.

## Executed certificate and native status

Executed:

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_rootsum_factor_sharpness.py
ROOTSUM FACTOR SHARPNESS CERTIFICATE
field identities checked=13
square-root fibres per state=4,4
carrier labels=16
source upper bound=16
RESULT: exact rank-two RootSum factor is attained
```

All field arithmetic uses exact rational pairs in `Q(sqrt5)`; no floating-point comparison is used.  The accompanying Lean file prepares `rh_scan` of the actual `rootSum`, the exact factor identity, `rh_reduce/rh_auto` replay, and axiom queries.  No local `lean` or `lake` executable exists, so it is **PREPARED / NOT COMPILED**.  The preceding CountQ commit's orchestrator run `45616849862` was cancelled and is not evidence for this result.

## Limitations

This is a sharpness result for the generic `RootSum` interface.  It does **not** show that eigendata produced by the automorphic `countP_alt` caller attain all square-root fibres, and it does not prove the `Bool` is indispensable after imposing those additional representation-theoretic constraints.  It closes no CountI, TopG, geometric, window, or RH obligation.

## RESUME HERE

Inspect the actual rank-two `countP_alt` output and `bit_of_fibre` consumer for an additional determinant, conjugate-self-duality, or Frobenius constraint that identifies sign choices or the Boolean bit; if none exists, retain coefficient eight permanently and move to the unresolved `P.cohC/P.borelC` quantitative suppliers.

**HANDOFF TO:** audit/kernel for native formalization of the tight eigendatum; Galois for caller-specific fibre constraints; integration/editor for the obstruction line only.
