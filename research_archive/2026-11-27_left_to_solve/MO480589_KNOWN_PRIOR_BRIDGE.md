# MO480589: known-prior bridge for the literal triangle

Research for Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex, GPT-6 (exact serving variant not exposed), 2026-11-27. This is an AI-generated informal derivation, without human review or Lean verification. The independent primary-literature audit found an exact October 2026 prior family, described below. **Excluded from the genuine-open count. No lease, verifier run, official submission, acceptance, novelty or priority is asserted.**

Source: https://mathoverflow.net/questions/480589 . Full current question, answers (none) and comments (none) were read through the official Stack Exchange API. The source also asks whether a closed form or generating function can be obtained from its polynomial triangle. The generating function below concerns the **polynomials**, not an ordinary generating function for the number of distinct exponents.

Let P(n,k) be exactly the source array, with coefficients in the nonnegative integers:

* P(n,k)=0 for k>n;
* P(n,0)=1;
* for 1<=k<=n, P(n,k)=z^(n-k+1) P(n,k-1)+P(k-1,k-1).

Let a(n) be OEIS A069999. Its fully inspected revision 91 explicitly gives the alternative definition: the number of distinct values of the sum of squares of the parts of a partition of n. This is an existing source definition, not a conjectured matrix-classification assumption. Ordering the parts does not change this set of values, since sorting any positive composition gives a partition and every partition is itself a positive composition.

## Exact complete polynomial identity

Define Q(0)=1 and Q(r)=P(r-1,r-1) for r>=1. Then for every n>=1,

\[
 Q(n)=\sum_{(c_1,\ldots,c_l)\vDash n}
       z^{\sum_{i=1}^l\binom{c_i}{2}},
\]

where the sum is over all positive compositions of n. The initial empty composition supplies Q(0)=1. In particular all nonzero coefficients are positive, and multiplicities of an exponent count compositions, without any cancellation.

To derive this identity from the literal triangle, fix n>=0 and expand P(n,n) backwards in k. The contribution of the initial value P(n,0)=1 is z^binom(n+1,2). The contribution inserted at step j, 1<=j<=n, is

\[
 P(j-1,j-1)\prod_{t=j+1}^{n}z^{n-t+1}
 = Q(j) z^{\binom{n-j+1}{2}}.
\]

The initial contribution is the same expression with j=0. Consequently

\[
 Q(n+1)=\sum_{j=0}^{n}Q(j)z^{\binom{n-j+1}{2}}
       =\sum_{p=1}^{n+1}z^{\binom p2}Q(n+1-p).
\]

For every positive composition of n+1, its first part p is uniquely in {1,...,n+1}, and its remaining parts form a composition of n+1-p (empty when p=n+1). Its exponent is binom(p,2) plus the exponent of that tail. Thus the composition enumerator satisfies precisely this recurrence and initial value. Strong induction on n proves the displayed polynomial identity, with no analytic convergence assumption.

## Complete support bijection

For a composition c of n, put e(c)=sum binom(c_i,2) and s(c)=sum c_i^2. The elementary identity

\[
 2e(c)+n=\sum_i(c_i(c_i-1)+c_i)=s(c)
\]

shows that e->2e+n is a bijection from the positive support of Q(n) to the distinct square-sum values of compositions of n. It is injective because multiplication by 2 is injective on the natural numbers. It is onto because every composition contributes a positive monomial to Q(n). Sorting parts identifies this square-sum set with the partition square-sum set defining a(n). Hence for every n>=1,

\[
 \#\{e:[z^e]P(n-1,n-1)>0\}=a(n),
\]

which is the full source's conjectured equality. No finite computational bound is used.

## Formal polynomial generating function

In the formal series ring Z[z][[t]], set

\[
 W(t,z)=\sum_{p\ge1}t^p z^{\binom p2}.
\]

Because W has zero constant term, its geometric inverse is well-defined coefficient by coefficient. The same recurrence gives

\[
 \sum_{n\ge0}Q(n)t^n
 =\frac1{1-W(t,z)}.
\]

This supplies a closed description of the diagonal polynomials. It does not provide an ordinary generating function for a(n), since counting distinct nonzero exponents is not a linear coefficient operation. A finite, nonrecursive formula is also immediate: Q(n) is the sum over positive compositions above, equivalently a sum over multiplicity profiles (r_1,...,r_n) with sum p*r_p=n, with monomial exponent sum r_p*binom(p,2) and coefficient multinomial(sum r_p;r_1,...,r_n).

## Primary prior scope

* OEIS A069999 revision 91 already supplies the partition-square-sum definition, the bivariate product encoding of that set, classical dimension context, and algorithms. These are credited prerequisites. The literal P triangle is not in that fetched source.
* Brouder–Keith–Mestre, *Several graph sequences as solutions of a double recurrence*, arXiv:1301.0874v2 (2015), Theorem 2, uses compositions and sums of squares for a different signed, factorially weighted rational-function expansion. The actual PDF and complete extracted text are saved locally. A genuine literal-prior comparison is required, not just matching the sequence number.
* Aurzada–Raschel, *Persistence probabilities for MA(1) sequences with uniform innovations* (2025-07-02), Lemma 5 and Corollary 2, counts monomials for an inverse deformed exponential. Its composition weights have varying signs and factorial denominators. The actual PDF and full extracted text are saved locally. This is closely related prior methodology; it is not being silently counted as new here.

The decisive exact positive-weight prior is [OEIS A400756](https://oeis.org/A400756/internal), revision 35, October 7, 2026, created by Geoffrey Critzer on October 5, with programs and related formulas credited to Alois P. Heinz. This entry was independently read in full by two campaign AI agents and the campaign coordinator. It counts compositions by

\[
 f(c)=\sum_{i<j}c_i c_j=\binom n2-\sum_i\binom{c_i}{2}.
\]

Therefore the **entire** diagonal Q(n), including coefficient multiplicities, is the reversed row polynomial of A400756:

\[
 Q(n;z)=\sum_{k=0}^{\binom n2}T(n,k)z^{\binom n2-k}.
\]

That primary entry already explicitly identifies A069999 as the number of positive entries in its rows and supplies the same bivariate generating function after substituting q=1/z. This is an unmarked source fact. The literal two-index P recurrence is not printed there; its connection is the short row-unrolling argument above. We consequently preserve this valid bridge as a routine consequence of the published exact enumerator, and **do not count it as a new open-problem solution**. The narrower signed-weight priors above are not needed to justify this exclusion.

The independent audit is durably preserved in the campaign fork, commit e2000c566c990661d3a2fc9775828e5014dc12c6, with receipt commit 81a03c868eb0b120f38d6d77ccf5a2ae836148b6. No worldwide priority assertion is made. No lease, Lean certificate, verifier submission or official PR was created for this target.
