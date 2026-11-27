# Algebra bot RUN22 — A116150 exact parity and modular reduction

Date: 2026-11-27 UTC  
Owner/credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT (Codex, GPT-5-series model).  
Status: **substantive exact reduction only; not a solution of the least-next-prime question; no count change.**

## Run preflight

- Latest Cathedral coordination base read: `5f2e807304cfd466d5a3e0b4ff99f6730b3af9c0` on `newtons-cathedral`.
- Latest official OMA main read: `0e34bb31d1729b0f92f6543287840f23e83e5432`.
- `join.txt` was read after one transient HTTP 503; SHA-256
  `d6dc28d80b6a5efeb61b0c6277513e14bd5e6d47487a9d41b18a11c1ad0af0b2`.
- Official `tools/oma.sh` was read at the current official checkout; SHA-256
  `daaa877c54da912b8525a7ecf2946579842d7778e981966a0a495e529e7db602`.
- `AGENTS.md`, the current `CAMPAIGN_LEDGER.md`, `VERIFIED_PROOFS.json`, recent source/prior audits,
  and algebra resume files were read before selecting a target.
- Current master checkpoint at run start: 34 whole Lean-checked archived certificates, five official
  full-proof submissions, four actual upstream checker acceptances, three merged/publicly credited
  full proofs, and zero certified genuinely original discoveries.  None of those numbers changes here.
- A113257 was deliberately left at its recorded partial modular reductions, per the owner's instruction
  to switch when no general solution was emerging.

## Exact source and eligibility gate

Formal source at pinned formal-conjectures commit
`9097e2f90e66d2f6244209cb1c07f7120d17ec53`:

```lean
def a (n : ℕ) : ℕ :=
  (∑ j ∈ Finset.Icc 1 n, ((3 : ℤ) ^ j + ((-2) : ℤ) ^ j)).toNat

theorem conjecture :
  conjecture.answer = a (sInf {n : ℕ | 431 < n ∧ (a n).Prime}) := by sorry
```

Thus the official problem asks for the **least** prime-valued index after 431, not merely a prime
witness and not merely a congruence restriction.

The live catalog entry had no recorded agent, solution, or reduction steps when screened.  Two
all-state upstream GitHub searches, explicitly qualified with `is:pr`, for `A116150` and `116150`
both returned `total_count = 0`.  This is only a duplicate gate; zero search hits are not a novelty
claim.  The current OEIS entry and its displayed history/comments/formulas were read.  It credits
Zak Seidov (sequence), Harvey P. Dale (prime observations/table), and G. C. Greubel (2019 recurrence,
generating functions, and closed form).  The entry gives

\[
  a_n=\sum_{j=1}^{n}(3^j+(-2)^j)
      =\frac{9\,3^n+4(-2)^n-13}{6},
  \qquad
  a_{n+3}=2a_{n+2}+5a_{n+1}-6a_n,
\]

and lists prime indices 11, 17, 71, 91, and 431, followed by the open question.

## Exact mathematical reduction

Let

\[
S_n=\sum_{j=1}^{n}(3^j+(-2)^j)\in\mathbb Z.
\]

For every `j ≥ 1`, `3^j` is odd and `(-2)^j` is even, so their sum is odd.  The interval
`{1,…,n}` has exactly `n` terms.  Equivalently, using the source recurrence one term at a time,

\[
S_{n+1}=S_n+3^{n+1}+(-2)^{n+1}
       \equiv S_n+1\pmod 2.
\]

Since `S_0 = 0`, induction gives the decisive invariant

\[
\boxed{\quad S_n\equiv n\pmod 2.\quad}
\]

The source's `Int.toNat` wrapper does not change this value: for every `j`,

\[
-|(-2)^j|\le(-2)^j,
\qquad |(-2)^j|=2^j\le3^j,
\]

so every summand and hence `S_n` is nonnegative.  Therefore `a(n)=S_n` in `ℕ`, and

\[
\boxed{\quad \operatorname{Even}(a(n))\iff\operatorname{Even}(n).\quad}
\]

In particular every even index after 431 is excluded from being a new odd prime.  This preserves
the exact source quantifier and definition but does **not** determine the least surviving odd index.

For any modulus `q`, the complete state

\[
X_n=(a_n\bmod q,\;3^n\bmod q,\;(-2)^n\bmod q)
\]

has deterministic transition

\[
(A,P,Q)\longmapsto(A+3P-2Q,\;3P,\;-2Q)\pmod q.
\]

Returning to a previous complete state therefore proves an infinite periodic filter, rather than
merely checking a finite prefix.  The executable certificate established these cycles and zero
classes (entries are the representatives in one certified cycle):

| q | cycle start | period | indices with `a(n) ≡ 0 (mod q)` |
|---:|---:|---:|---|
| 2 | 1 | 2 | 2 |
| 3 | 1 | 3 | 3 |
| 5 | 0 | 4 | 0 |
| 7 | 0 | 6 | 0, 2 |
| 11 | 0 | 5 | 0, 3 |
| 13 | 0 | 12 | 0, 4, 8 |
| 17 | 0 | 16 | 0 |
| 19 | 0 | 18 | 0 |
| 23 | 0 | 22 | 0 |
| 29 | 0 | 28 | 0 |
| 31 | 0 | 30 | 0, 5, 7, 19 |
| 37 | 0 | 36 | 0 |
| 41 | 0 | 40 | 0 |
| 43 | 0 | 42 | 0 |
| 47 | 0 | 46 | 0, 15, 18 |

These filters are necessary conditions only.  If `a(n)=q` itself, divisibility by `q` would not
prove compositeness; that small-value exception must be checked whenever a residue class is used.
For the sought range `n>431` the displayed values are vastly larger than these moduli, but a final
leastness proof must state that comparison explicitly.

## Executed verification and false-green guard

Executable finite-state certificate:

```text
python3 research_archive/2026-11-27_left_to_solve/workers/algebra/A116150_modular_certificate_run22.py
process exit: 0
```

It checked the defining sum against the cited closed form for `0 ≤ n ≤ 100`, checked the exact
order-three recurrence for `0 ≤ n < 98`, proved each modular cycle by a return of the complete
transition state, and independently stepped the parity state through index 10,000.

The first pinned Lean attempt is an important **failure**, not a pass:

- verifier commit: `e74a0d293ac4477985defce04319b998fe29ce9f`
- run: `46080453442`
- job: `140777948896`
- artifact: `15236552625`, ZIP SHA-256
  `ae32741030d797ebaec99ec659f4aee446b932f7cef764e9822995c8a45c1a74`
- actual compiler output: `CampaignProbe.lean:1:0: error: unknown module prefix 'FormalConjectures'`

The wrapper run was green because probe exit codes are archived rather than propagated.  Therefore
this run is explicitly rejected as a Lean pass.

The repaired file `A116150_PARITY_PROBE_RUN22.lean` copies the official independent definition
verbatim and proves the nonnegativity bridge, exact parity equivalence, and even-index corollary.
At checkpoint creation its strict pinned replay is pending because the single shared verifier ref is
occupied by the earlier A385478 whole-source run `46080633435`; no ref was overwritten or forced.

## Unresolved obligation and single next action

The actual source question remains unresolved: determine and prove the least `n>431` for which
`a(n)` is prime.  This reduction removes all even indices and the listed periodic divisor classes,
but it neither supplies a surviving prime nor proves leastness.

**RESUME HERE:** when the coordinated verifier slot is free, upload the repaired probe with a fresh
expected-head guard, require the per-probe `.exit` file to be `0`, scan the full log for every Lean
error form, and confirm that both selected theorem axiom prints contain only the permitted standard
axioms.  Only then mark this parity reduction Lean-verified; do not add it to the whole-problem or
accepted-proof counts.
