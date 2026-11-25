# `countQ_alt`: the exact `LevelAway` twist-support separator

**Lane:** MATH / mandatory unified reduction, run 34
**Status:** SOURCE-MATCHED CONDITIONAL THEOREM + executable exact certificate; native Lean CI pending
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The remaining quadratic-twist ambiguity in `countQ_alt` has a sharper separator than the previous split/inert Frobenius test.  For a rank-two representation (W), a character δ, and the *same* level modulus (M), the pinned definitions give

\[
\boxed{
  \operatorname{KillsMu}(M,\delta)\;\land\;
  \operatorname{LevelAway}(l,M,W)
  \;\Longrightarrow\;
  \operatorname{LevelAway}(l,M,W\otimes\delta).
}
\tag{L}
\]

This is the decisive equation for this run.  It is exact algebra, not a norm estimate: at each place away from (l), replace the diagonal inertia characters χᵢ by χᵢδ.  `KillsMu` is closed under multiplication and `diag_twist` identifies the twisted diagonal action.

The converse local obstruction is equally precise.  Suppose (M\ne0), a rational prime (q\nmid lM) ramifies in the quadratic field cut out by δ, and both (W) and (W\otimes\delta) satisfy `LevelAway l M`.  At a place above (q), `st_mu` makes every level character trivial on inertia, hence both representations are unramified.  After transporting between the two choices of algebraic place using `ineConj`,

\[
  1=(W\otimes\delta)(s)=\delta(s)W(s)=\delta(s)
\]

for every inertia element (s).  This contradicts ramification, which supplies an inertia element with δ(s) = −1.  Therefore

\[
q\nmid lM\ \text{and}\ q\ \text{ramified in }K_\delta
\quad\Longrightarrow\quad
\neg\bigl(\operatorname{LevelAway}(l,M,W)\land
           \operatorname{LevelAway}(l,M,W\otimes\delta)\bigr).
\tag{R}
\]

For the actual `quadFam`, (K_i) has discriminant (-q_i) with distinct primes (q_i\equiv3\pmod4).  Hence the Boolean partner can survive the `LevelAway` field only in the conductor-supported branch

\[
\boxed{q_i\mid lM.}
\tag{S}
\]

This removes the quadratic alternative for every selected index outside the finite prime support of (lM).  It does **not** remove the uniform factor two in `CountQAlt`: the theorem quantifies over arbitrary (M), and (M) may contain every fixed (q_i) in the family.

## Source audit

All source statements below are from the pinned upstream revision.

| Role | Source path | Blob |
|---|---|---|
| `KillsMu`, `LevelAway`, `Level` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BlochKatoSelmerVanishes.lean` | `f342e0eb41bf3129145addd7b04d3f3ed303050b` |
| `killsMu_mul`, `diag_twist` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/KatoQuadraticCharacters/NewformTwistNorms/PowEqOneOfKills.lean` | `2e013dff853287fc6cff07b7b475f9af0c481970` |
| inertia triviality away from (M) | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/StMu.lean` | `27ad38a37d63d39aa04e986b9dc8f5d9b1bb3043` |
| inertia conjugation between algebraic places | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/QuadraticExtensions/IneConj.lean` | `cc62c66f54db023f23fe2b869ad363b46daa5c89` |
| discriminants (-q_i), (q_i\equiv3\pmod4) | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/CrystallineBaseChange/QuadFam.lean` | `cb75bc09b3065d1f24e341f271a97c38a739114e` |
| sign-character constructor | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/BuildingsResidueChars/ExistsQuadraticSignCharacter.lean` | `2f88a58801b17ae7fc3a5c392b624d5a16b960de` |
| actual `countQ_alt` caller | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |

The crucial negative source fact is now checked rather than inferred: `exists_quadratic_sign_character` returns continuity, nontriviality, the sign/kernel description, and eventual unramifiedness.  It does **not** return `KillsMu M delta` for the caller's arbitrary (M).  Thus (L) cannot be applied silently to the `countQ_alt` character.

## Root-reachable reduction

- **Original graph:** `countQ_alt -> bit_of_fibre -> resTwo -> {same, quadratic twist}`; `AdmRNAlt.level -> Level.away -> LevelAway`.
- **Reduced graph:** if (q_i\nmid lM), (R) kills the quadratic-twist branch before `bit_of_fibre`; if (q_i\mid lM), retain the branch and inspect `LevelAt`, `IsAutQA`, and duality.
- **Exact cancellation before norms:** on inertia, (W(s)=1) and ((W\otimes\delta)(s)=1), so multiplication cancels (W(s)) and forces δ(s)=1.
- **Symmetry:** the residual `Bool` is exactly the order-two twist symmetry; (R) breaks it off the conductor support.
- **Aggregate bound:** at most ω(ℓM) family primes can lie in the supported branch, where ω is the number of distinct prime divisors.  This is useful only if a downstream bound controls ω(ℓM); none is assumed here.
- **Context cache/backtracking:** cache `(countQ_alt, q_i, l, M, q_i | lM)`.  Do not retry automorphy or `LevelAt` on the excluded branch.  Backtrack to those fields only when (q_i\mid lM).
- **Premise weakening:** (L) needs only `LevelAway`, not full `Level`, automorphy, duality, safety, Frobenius traces, or RH.
- **Axiom evidence:** the prepared Lean theorem prints its axioms and scans the actual caller.  No theorem asserting RH is imported as a proof premise.

This is root-reachable but does not yet improve the weighted-prime lower bound in mission lane 2.  It strictly narrows one arithmetic classifier obligation used downstream; RH remains open.

## Executed tests

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_levelaway_twist_support.py
COUNTQ LEVELAWAY TWIST-SUPPORT CERTIFICATE
KillsMu closure cases=4
GL(2,F_5) conjugators checked=480
ramified sign twist differs from unramified identity=True
prepared Lean hygiene=True
RESULT: same-level preservation needs same-modulus KillsMu;
        ramification outside lM excludes the twisted partner
```

The finite certificate exhausts the `KillsMu` product law on a two-element model and all 480 elements of `GL(2,F_5)` for the ramified scalar obstruction.  It also rejects `sorry`/`admit` and checks that the prepared native file includes the actual caller scan and reduction tactics.

Local Lean/Lake is unavailable, so **no native Lean PASS is claimed**.  The companion `.lean` file is executable in the pinned environment and contains a direct proof of (L), `rh_reduce` / `rh_auto` / `rh_auto_frontier` replay, `rh_scan` of `countQ_alt`, and axiom queries.  `rh_prune` is not reported as run because no local elaborated proof term exists to prune.

## Failed attempts and unresolved obligations

1. **Uniform level preservation failed:** the source sign constructor lacks `KillsMu M delta`.
2. **Uniform level exclusion failed:** arbitrary (M) can contain all fixed discriminant primes (q_i).
3. **Full admissibility remains unresolved on (S):** `LevelAt` at primes over (l), `IsAutQA`, and duality have not been proved twist-stable or twist-incompatible.
4. The previous native CI job for the predecessor certificate was cancelled by a newer push; it is not counted as a pass.

## RESUME HERE

Work only in the supported branch (q_i\mid lM).  First split (q_i=l) from (q_i\mid M).  For (q_i\ne l), test whether the caller's construction gives any bound on how many distinct `quadFam` primes may divide (M); if yes, replace the uniform `Bool` by a supported-index count.  If not, inspect `AdmRNAlt.aut : IsAutQA` under the same quadratic twist.  Preserve (S) as an explicit hypothesis and do not re-open the already excluded (q_i\nmid lM) branch.

**HANDOFF:** kernel/audit should compile the prepared theorem and publish actual CI output; arithmetic/Galois should verify the ramification-to-inertia bridge at the pinned source; integration should use only the conditional support reduction (S), not claim removal of the factor two.  RH remains open.
