# `countQ_alt`: exact Boolean-fibre reduction and split-prime obstruction

**Lane:** MATH / mandatory unified reduction, run 33  
**Status:** SOURCE-MATCHED CALLER REDUCTION plus exact finite countermodel; full admissible Galois collision not claimed  
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The extra `Bool` in the rank-two `countQ_alt` classifier can be deleted on a precisely identified subfamily, but **cannot be deleted uniformly using the restriction, determinant, and local Frobenius information currently visible in the caller**.

For a chosen quadratic sign character `delta_i`, Clifford theory (`resTwo`) says that two irreducible global representations with the same restriction to `K_i` satisfy

\[
 r'\simeq r\qquad\text{or}\qquad r'\simeq r\otimes\delta_i .
\tag{1}
\]

At an unramified rational prime `p`, write `Frob_p` for Frobenius and `t_p=tr(r(Frob_p))`.  In rank two,

\[
 \boxed{\operatorname{tr}((r\otimes\delta_i)(\operatorname{Frob}_p))
       =\delta_i(\operatorname{Frob}_p)t_p.}
\tag{2}
\]

Because the coefficient prime `l` is assumed different from `2`, (2) proves the useful caller-specialized reduction

\[
 \delta_i(\operatorname{Frob}_p)=-1\quad\text{and}\quad t_p\ne0
 \quad\Longrightarrow\quad
 \text{the common `Q`-fibre contains only one isomorphism class.}
\tag{3}
\]

Thus the `Bool` is unnecessary on the inert, nonzero-trace fibres.  This is a real premise weakening of `bit_of_fibre`: on those fibres its two-class hypothesis strengthens to direct uniqueness.

It does **not** improve the uniform `CountQAlt` constant.  The source assumes only that `p` is unramified in each selected quadratic field, not that it is inert.  When `p` splits, `delta_i(Frob_p)=1`, so (2) gives the same trace and in fact the same local Frobenius matrix after twisting.  The determinant also cannot help in rank two:

\[
 \det(r\otimes\delta_i)=\delta_i^2\det r=\det r.
\tag{4}
\]

The surviving issue is therefore exact: prove from the full `AdmRNAlt` predicate that the twisted partner cannot also be admissible in a split/trace-zero fibre, or retain the Boolean factor.

## Actual source-body reduction

Pinned file:

`src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean`

blob `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40`.

The relevant proof is not inferred from names:

1. `countQ_alt` constructs `n^2+2` quadratic CM fields using `quadFam`, then `exists_avoid` selects `n^2+1` fields for which `p` does not divide the discriminant.  No Frobenius-sign condition is imposed.
2. In `case ex`, `twCard` proves that among the `n^2+1` injectively chosen quadratic characters there is an index `i` with
   `not RepIso r (tw r (delta i))`.
3. `resTwo` then proves irreducibility after restriction to `K_i` and the dichotomy (1).
4. `bit_of_fibre` sends a representation to `U x Bool`.  The proof's `case two` uses the second half of `resTwo` to show only that any two classes different from a fixed class are isomorphic.  It proves **at most two classes**, not one.
5. `case main` passes that Boolean unchanged into the injected carrier supplied by `rootSum`.  No determinant, conjugate-self-duality, or Frobenius-sign identity is invoked there to identify the two classes.

Supporting pinned bodies:

- `.../CrystallineBaseChange/ResTwo.lean`, blob `cbdc8b31415f56ea47e29a317c598534848ce71c`: exact restriction dichotomy.
- `.../CrystallineBaseChange/TwCard.lean`, blob `b68d8fe98a575e5f111442842e699ecb8bfab638`: at most `n^2` self-twist characters, hence the non-self-twist selected above.
- `.../CrystallineBaseChange/QuadFam.lean`, blob `cb75bc09b3065d1f24e341f271a97c38a739114e`: the fields have discriminants `-q_i`, where distinct primes `q_i` satisfy `q_i = 3 mod 4`; the source proves only pairwise coprimality.
- `.../BuildingsResidueChars/ExistsQuadraticSignCharacter.lean`, blob `2f88a58801b17ae7fc3a5c392b624d5a16b960de`: constructs `delta_i` with kernel equal to the restriction image and values `+/-1`.

## Why split primes cannot be excluded by this fixed family

For any finite source family `q_1,...,q_s`, Dirichlet's theorem supplies infinitely many primes

\[
 p\equiv1\pmod{4\prod_iq_i}.
\tag{5}
\]

For such `p`, quadratic reciprocity gives `(-q_i/p)=1` for every `i`; hence `p` splits in every `Q(sqrt(-q_i))`.  It is also prime to every discriminant.  Therefore replacing the source's unramified selection by an inert selection cannot work for all `p` with any fixed finite family.

The executable certificate gives one exact six-field instance (the number required when `n=2`):

\[
(q_i)=(3,7,11,19,23,31),\quad
M=3{,}129{,}357,\quad
p=25{,}034{,}857=1+2(4M),
\]

and verifies `(-q_i/p)=1` for all six fields and `gcd(p,M)=1`.  Taking `M` divisible by all `q_i` also shows that the mere location of quadratic ramification cannot yield a uniform contradiction from the source's arbitrary-level quantifier; the precise `Level`/`AdmRNAlt` fields still require inspection.

## Exact rank-two countermodel for the used structural premises

Let `Gamma=S3 x C2`, let `Gamma'=S3 x {0}`, and let `delta` be the sign of the `C2` factor.  If `rho` is the two-dimensional standard irreducible representation of `S3`, set

\[
r_0=\rho\otimes1,\qquad r_1=\rho\otimes\delta.
\]

Both are irreducible, their restrictions to `Gamma'` are identical, and they are not isomorphic because the central element `(1,1)` has traces `2` and `-2`.  At every split element `(s,0)` their matrices are identical.  This exactly realizes the two alternatives in (1) and a split local observation that cannot distinguish them.

Separately, the abstract `bit_of_fibre` hypotheses are sharp on `X=Bool`, singleton `U`, equality relation `R`, and always-true `Q`: the `h2` condition holds because a two-point fibre has at most two equivalence classes, but no `U`-only label separates them.  `U x Bool` does.

This finite countermodel does **not** assert that `r_0,r_1` satisfy the source's number-field `AdmRNAlt` predicate.  Its role is narrower and exact: the structural inputs actually consumed by `resTwo`, the common restriction label, determinant, and split Frobenius data cannot prove uniqueness.  Any successful deletion must use an additional admissibility field not used by the current `case two` proof.

## Unified-reduction ledger

- **Specialisation:** rank two, exactly the downstream RH caller.
- **Exact cancellation before bounds:** equations (2) and (4); determinant data cancel completely under a quadratic rank-two twist.
- **Symmetry:** quadratic twisting is the residual two-element symmetry represented by `Bool`.
- **Premise weakening:** delete `Bool` on inert nonzero-trace fibres by (3).
- **Backtracking:** the hoped-for uniform deletion is rejected because of (5) and the exact finite countermodel.
- **Context cache:** `(pin, countQ_alt, bit_of_fibre, rank=2, split/inert Frobenius, trace-zero flag)`; do not retry generic or determinant-only deletion.
- **Original graph:** `countQ_alt -> bit_of_fibre -> resTwo, twCard, rootSum`.
- **Reduced graph:** the inert/nonzero-trace branch bypasses `bit_of_fibre`'s `Bool`; split or trace-zero branches retain it and the full admissibility obligation.
- **Axiom evidence:** no RH theorem imported; source bodies inspected at the pinned blobs above.  Dirichlet and quadratic reciprocity are standard mathematical inputs, already consistent with `QuadFam.lean`'s use of primes in progressions, but no new Lean theorem was compiled here.

## Executed tests

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_bool_split_obstruction.py
COUNTQ BOOL SPLIT-PRIME OBSTRUCTION CERTIFICATE
rank-two group homomorphism checks=288
quadratic-character checks=144
restriction-kernel size=6
restricted standard-representation commutant dimension=1
global central traces=2,-2
split local matrices equal=True
bit_of_fibre nontrivial h2 cases=2
sample discriminant primes=[3, 7, 11, 19, 23, 31]
M=3129357, modulus=12517428, split prime=25034857
Kronecker/Legendre residues=[1, 1, 1, 1, 1, 1]
RESULT: restriction plus split Frobenius data do not remove the Boolean class
```

The script uses integer matrices and exact modular exponentiation.  It also performs exhaustive multiplication checks for both rank-two representations.  Native Lean/Lake is unavailable locally, so no Lean PASS is claimed.

The companion `2026-11-25_COUNTQ_BOOL_SPLIT_OBSTRUCTION.lean` prepares `rh_scan` of the actual `countQ_alt`, a negative control proving that a singleton label cannot classify the two-point equality fibre, a positive `PUnit x Bool` classifier, `rh_reduce`/`rh_auto`/`rh_auto_frontier` replay, and axiom queries.  It contains no `sorry` or `admit`, but remains **PREPARED / NOT COMPILED** until run in the pinned native environment.

## Failed attempt and limitation

The attempted uniform factor-two reduction fails: neither determinant nor a fixed finite quadratic-field family forces the local sign needed in (3).  This does not prove an actual pair of nonisomorphic `AdmRNAlt` representations occupies one source fibre.  The remaining possible separator is inside the full admissibility/level/automorphic predicate, which the current `case two` does not inspect.

## RESUME HERE

Expand the pinned definition and consumers of `AdmRNAlt`, especially its `level` and `aut` fields, and test whether quadratic twisting by `delta_i` preserves them when `p` splits and `M` is divisible by `discr(K_i)`.  If preservation is source-provable, the Boolean factor is genuinely necessary for the actual caller; if a field forbids the twist, replace `bit_of_fibre` by direct uniqueness and remove the factor two.

**HANDOFF TO:** kernel/audit for a native version of the conditional uniqueness lemma (3); Galois for the `AdmRNAlt` twist-preservation test; integration/editor for the precise split/trace-zero obstruction only.  RH remains open.
