# A401715: complete elementary mathematical proof, not yet Lean checked

Date: 2026-11-27. Prepared for Cornelius Lytollis (@con123-gif), assisted by ChatGPT (Codex), with source conjecture attributed to Antti Karttunen. The harmonic sum and squarefree-times-square arguments below are standard prior mathematics. This file does not claim an official submission or acceptance.

**PRIOR-RESOLUTION AUDIT UPDATE:** After obtaining this independent argument, stronger live literature search found an earlier full Lean implementation of the identical A401714/A401715 assertion: <https://www.trureturing.org/research/oeis-a401714-unitary-squarefree-divisor-sum/>, with theorem `D5.S3.Arith.Divisors.KarttunenA401714.result`, source snapshot `1db42442f465d1fd947768d30d312c60b89f18f2`, first recorded merged 2026-11-19. The exact theorem's positive-integer scope and divisor-sum conclusion were inspected in the primary Lean source. The public repository says its separate source audit is still pending; this is not evidence that the proof is missing. Consequently this target must not be represented as a genuinely unresolved new solve. Our elementary proof is retained as an independent simplification, excluded from the user's accepted-open-problem count. No A401715 lease was acquired or submission made by this child agent.

## Exact source statement

OEIS A401715, revision 13, 2026-11-07, defines the indicator of

\[
\sigma^*(n)+\sigma(\operatorname{rad}n)\ge 2n,
\]

where \(\sigma^*\) sums unitary divisors. Its conjecture is `a(n) >= A401714(n)`. A401714, revision 12 of the same date, is the indicator of

\[
t= n/\operatorname{rad}n < \min\{p:p\text{ prime},\ p\nmid n\}.
\]

Thus the full claim is that every positive integer satisfying this latter condition satisfies the divisor-sum inequality. Sources: <https://oeis.org/A401715> and <https://oeis.org/A401714>. The cached complete OEIS JSON responses are `a401715.json` and `a401714.json` in this directory. Eligibility and literature must be freshly checked before claiming/submitting.

## Reduction to one integer

For an integer \(t\ge1\), put

\[
B(t)=\prod_{p\le t}(1+1/p),\qquad
D(t)=\prod_{p\mid t}(1+1/p),\qquad
A(t)=\prod_{p\le t}(1+p^{-v_p(t)-1}).
\]

Products are over primes. The hypothesis ensures every prime at most \(t\) divides \(n\). If a prime \(p>t\) divides \(n\), its exponent in \(n\) is one: otherwise \(p\mid t\), impossible. Write \(Q\) for these extra primes. The usual multiplicative divisor formulas give the exact identity

\[
\frac{\sigma^*(n)+\sigma(\operatorname{rad}n)}n
=\prod_{p\in Q}(1+1/p)\left(A(t)+\frac{B(t)}t\right).
\]

The outer product is at least one. It therefore suffices to prove

\[
F(t):=A(t)+B(t)/t\ge2 \quad(t\ge1).
\tag{1}
\]

In particular, primes not dividing \(t\) supply their full factor \(1+1/p\) to \(A(t)\), and all remaining factors of \(A(t)\) are at least one. Hence

\[
A(t)\ge B(t)/D(t).
\tag{2}
\]

Let \(k=\omega(t)\) be the number of distinct prime divisors, and write them increasingly as \(q_1<\cdots<q_k\). If \(p_i\) is the \(i\)-th prime, then \(q_i\ge p_i\ge i+1\). Consequently

\[
D(t)\le D_k:=\prod_{i=1}^k(1+1/p_i),\qquad
D(t)\le\prod_{i=1}^k\frac{i+2}{i+1}=\frac{k+2}{2},\qquad
t\ge P_k:=\prod_{i=1}^k p_i.
\tag{3}
\]

## A finite harmonic bound

Let \(H_N=\sum_{j=1}^N1/j\). Each positive integer \(j\le N\) has a unique representation \(j=a b^2\), with \(a\) squarefree and all prime factors of \(a\) at most \(N\). Taking the larger finite rectangle of all squarefree \(a\) formed from primes at most \(N\) and all \(1\le b\le N\) yields

\[
H_N\le\left(\sum_{a\mid\prod_{p\le N}p}\frac1a\right)
          \left(\sum_{b=1}^N\frac1{b^2}\right)
=B(N)\sum_{b=1}^N\frac1{b^2}<\frac53 B(N).
\tag{4}
\]

For the last strict bound, terms through five together with the telescoping tail satisfy

\[
\sum_{b=1}^N b^{-2}
\le\sum_{b=1}^5 b^{-2}+\frac15
=\frac{5989}{3600}<\frac53.
\]

For \(N\le5\), simply omit missing positive terms. For \(N>5\), use \(b^{-2}<1/[b(b-1)]\) for \(b\ge6\). This argument uses only finite sums.

Moreover, \(2^m\le N\) implies

\[
H_N\ge1+\frac m2,
\tag{5}
\]

because each dyadic block \(2^j<b\le2^{j+1}\) has \(2^j\) terms, each at least \(2^{-j-1}\). Combining (4) and (5),

\[
2^m\le N\quad\Longrightarrow\quad
B(N)>\frac35\left(1+\frac m2\right).
\tag{6}
\]

## Exhaustive infinite case split

First suppose \(t\ge100\).

* If \(k\le3\), then \(D(t)\le5/2\). The exact inequality \(B(100)>5\) gives \(B(t)>2D(t)\).
* If \(k=4\), then \(t\ge P_4=210\) and \(D(t)\le D_4=B(7)\). The exact inequality \(B(210)>2B(7)\) again gives \(B(t)>2D(t)\).
* If \(5\le k\le7\), then \(t\ge P_5=2310>1000\), and \(D(t)\le D_8=B(19)\). The exact inequality \(B(1000)>2B(19)\) gives the same conclusion.
* If \(8\le k\le12\), use the following table and (6). Each row certifies \(2^m\le P_k\le t\) and the last column is strictly positive, so \(B(t)>2D_k\ge2D(t)\).

| \(k\) | \(P_k\) | \(m\) | \(D_k\) | \(\frac35(1+m/2)-2D_k\) |
|---:|---:|---:|---:|---:|
|8|9699690|23|165888/46189|29283/92378|
|9|223092870|27|3981312/1062347|12797949/10623470|
|10|6469693230|32|119439360/30808063|376817613/154040315|
|11|200560490130|37|3822059520/955049953|35299654101/9550499530|
|12|7420738134810|42|7644119040/1859834119|46307861454/9299170595|

Finally, if \(k\ge13\),

\[
P_{13}=304250263527210>2^{48}.
\]

Every later prime is greater than 41 and hence at least 16. Therefore

\[
t\ge P_k\ge P_{13}16^{k-13}\ge2^{4k-4}.
\]

Equation (6) and \(k\ge13\) give

\[
B(t)>\frac35(2k-1)\ge k+2\ge2D(t).
\]

These cases cover every \(t\ge100\). Together with (2), they in fact show \(A(t)>2\), and hence (1), throughout this range.

For the remaining \(1\le t<100\), compute the finite rational products in (1) exactly. The attached deterministic Python certificate does this using `fractions.Fraction`, integer `isqrt` trial primality, and integer valuations. All 99 inequalities pass. Equality occurs exactly at \(t=1,2,4\); their values can also be verified by hand. Thus (1) holds for every positive integer, completing the source conjecture.

## Verification status and formalization aids

On 2026-11-27, `python reversal_work/fresh/a401715_exact_reduction_certificate.py` exited 0. It checks all finite product inequalities, the dyadic table, the infinite-case base \(P_{13}>2^{48}\), and all remaining values \(t=1,\ldots,99\). This computational check supplies only the finite remainder and constants in an independently proved infinite argument. It is not by itself an infinite proof or a Lean verification.

Relevant exact Mathlib source: `Mathlib/NumberTheory/SmoothNumbers.lean` contains `Nat.eq_prod_primes_mul_sq_of_mem_smoothNumbers` and `Nat.smoothNumbersUpTo_subset_image`, already proving the finite squarefree-times-square cover underlying (4). `Mathlib/NumberTheory/Primorial.lean` provides `primeFactors_primorial` and related divisibility lemmas.

No Lean kernel check of this full theorem has been executed yet. No lease for A401715 is held by this child agent. Eligibility, prior-submission audit, formalization, actual verification, official submission, checker feedback and final acceptance remain required.
