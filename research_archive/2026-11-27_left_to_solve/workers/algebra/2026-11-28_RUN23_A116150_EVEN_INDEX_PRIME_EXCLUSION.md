# Algebra bot RUN23 — A116150 positive-even-index prime exclusion

Date: 2026-11-28 UTC  
Owner/credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (base model GPT-6; serving variant not exposed).  
Status: **source-faithful, whole-file Lean-verified reduction; not a solution of A116150; no campaign count change.**

## Preflight and coordination

- Read current `https://lefttosolve.com/join.txt`; SHA-256
  `dcfb7ba1c549a37d5ce327c4e1d4eff5fe9c487dcf898342a9f2acaa24497169`.
- Read the current official `tools/oma.sh` from upstream main
  `88c89e240fbbc12adcb4c851e6bf41ea7f3a080c`.
- Read `AGENTS.md`, the latest campaign ledger, `VERIFIED_PROOFS.json`, source/prior audits and
  Algebra resume records.  The Cathedral base advanced during the run from
  `15b58ab5124c211a2efe60c9cc1cd707c52c75e2` to
  `7ab99c3809495ff39f30fa3da1a3e1198050ad39`; this checkpoint is based on the latter and preserves
  all intervening RH and Left-to-Solve work.
- Authoritative counts at checkpoint: **37** complete public kernel certificates, **5** own official
  full-proof/disproof PRs, **5** actual upstream full-checker acceptances, **3** actual merged/publicly
  credited full proofs, and **0** ledger-certified genuinely original accepted discoveries.  This
  reduction changes none of those numbers.

## Exact source and theorem proved

At formal-conjectures commit `9097e2f90e66d2f6244209cb1c07f7120d17ec53`, the independently
defined sequence is

```lean
def a (n : ℕ) : ℕ :=
  (∑ j ∈ Finset.Icc 1 n, ((3 : ℤ) ^ j + ((-2) : ℤ) ^ j)).toNat
```

The official conjecture asks for the least prime-valued index greater than 431.  RUN22 established
the exact parity invariant `Even (a n) ↔ Even n`.  RUN23 strengthens this to the directly usable
prime exclusion

```lean
theorem a_two_mul_not_prime (k : ℕ) (hk : 1 ≤ k) :
    ¬ Nat.Prime (a (2 * k))
```

No recurrence being proved is used as the definition.  The proof starts from the literal finite sum.

## Mathematical derivation

For `j ≥ 1`,

\[
3^j+(-2)^j \ge 3^j-2^j\ge0.
\]

Hence the integer partial sums `S_n` are nonnegative and monotone, and the source `Int.toNat`
wrapper satisfies `a(n)=S_n`.  The exact first two terms give

\[
S_2=(3-2)+(9+4)=14.
\]

If `k≥1`, then `2≤2k`, so monotonicity gives `a(2k)=S_{2k}≥S_2=14`; in particular
`a(2k)≠2`.  RUN22's exact parity theorem makes `a(2k)` even.  A prime natural number is even only
when it equals 2, so `a(2k)` cannot be prime.

This excludes every positive even index, including every even candidate after 431.  It does **not**
identify a surviving odd prime index or prove leastness.

## Strict pinned verification

Pinned environment:

- formal-conjectures `9097e2f90e66d2f6244209cb1c07f7120d17ec53`
- Lean `4.33.1`
- Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`
- unchanged workflow SHA-256
  `d1099c4157d07c99be8c23a2d0faec9a865736137f3a71098a89199e8390681f`

Passing strengthened replay:

- verifier commit: `f76ab795148eaa44949a089dfa6d8332563bb6c2`
- complete probe Git blob: `55bfbf793ae1e1eefc1b367aedaac9447f3d41aa`
- complete probe SHA-256: `0f6af8f31b8a32da3b8e5131fe9f95af7fda62cb6f4bd6ab1692fc5446b35be1`
- run: `46085414165`
- job: `140793734107`
- artifact: `15238702956`
- downloaded ZIP SHA-256: `8af1f7bbf8f196323d43fbc55a4f54052b783b38a1dd2e71a9cfb906a74a1900`
- explicit `ProbeA116150ParityRun22.lean.exit`: `0`
- independent scan for `error:`, `error(...)`, `unsolved goals`, `sorryAx`, and `native_decide`: zero
- selected theorem dependencies:
  `[propext, Classical.choice, Quot.sound]`

The successful workflow and artifact are public at:
`https://github.com/con123-gif/open-math-agents/actions/runs/46085414165`.

### Rejected false-green attempt

Commit `655736315bd4803cf5e1f48822058ce8b9a5964e`, run `46084906059`, job
`140792099575`, artifact `15238960709` was **not** a pass.  The wrapper was green, but the raw Lean
log contained an unsolved goal while evaluating `sourceSum 2 = 14`, and the target axiom print
contained `sorryAx`.  RUN23 replaced the opaque `norm_num` call with two explicit applications of
the proved `sourceSum_succ` identity before rerunning.  The earlier RUN22 repair failures
`46083636384` and `46083925997` likewise remain failures; the earlier parity-only pass
`46084266348` remains valid but weaker than the theorem verified here.

## Submission and unresolved obligation

There is no official claim or PR for this reduction.  A116150 remains unsolved: one must determine
the least odd `n>431` with prime `a(n)`, prove that value prime, and exclude every smaller surviving
odd index.  The RUN22 exact finite-state congruence filters remain necessary conditions only.

**RESUME HERE:** combine the verified parity theorem with the already certified modular state cycles
to enumerate the first surviving odd indices after 431, then seek a rigorous prime certificate and
leastness proof.  If that route does not produce a complete source answer promptly, switch to a
fresh unreserved algebra/combinatorics target after the full live source/prior/PR gate.  Do not count
this reduction as a 38th certificate, an official acceptance, or a new discovery.
