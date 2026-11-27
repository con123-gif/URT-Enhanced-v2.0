# Sharp minimum deletion gap for correlation matrices

Source: Saurabh Agrawal, [MO 288399](https://mathoverflow.net/questions/288399),
December 13, 2017. Related versions MO 288942 and MSE 2562425 are the same
mathematical problem and must not be counted separately.

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact model variant is not exposed). This proof uses the classical Rayleigh
variational characterization of eigenvalues, rather than a new spectral method.

Let A be a real n by n positive semidefinite symmetric matrix with all diagonal
entries one, n >= 2. Let lambda be its least eigenvalue and let mu_i be the least
eigenvalue after deleting coordinate i. Set Delta = min_i(mu_i-lambda).

**Theorem.**

\[
\Delta\leq \frac{1-\lambda}{n-1}\leq \frac1{n-1}.
\]

Take a nonzero vector v attaining the minimum Rayleigh quotient lambda, and put
S = sum_i v_i^2 > 0 and Q = v^T A v = lambda S. Write d_i = v-v_i e_i for the
vector with coordinate i zeroed. Direct expansion gives, without any spectral
approximation,

\[
\sum_i\|d_i\|^2=(n-1)S,\qquad
\sum_i d_i^T A d_i=(n-2)Q+S.
\]

For the second identity, expanding each quadratic form subtracts each of the
two cross terms once and adds sum_i A_ii v_i^2 = S. This identity does not need
symmetry; symmetry and positivity identify the Rayleigh minima as the source's
least eigenvalues.

Every d_i is a zero padding of a vector in the ith principal submatrix. Thus
d_i^T A d_i >= mu_i ||d_i||^2 >= (lambda+Delta)||d_i||^2. Sum the inequalities,
substitute the identities and Q=lambda S, then cancel positive S:

\[
(\lambda+\Delta)(n-1)\leq(n-2)\lambda+1.
\]

Rearrangement proves the first inequality. Positivity of A gives lambda >= 0,
which proves the second. The argument permits zero coordinates, repeated
eigenvalues, zero least eigenvalue, and n=2. No finite computation is used.

For sharpness at every fixed lambda in [0,1], set b=(1-lambda)/(n-1) and
A=(1+b)I-bJ, where J is the all-ones matrix. On the all-ones direction its
eigenvalue is 1-(n-1)b=lambda, and on its orthogonal complement it is 1+b.
Deleting a coordinate gives least eigenvalue 1-(n-2)b=lambda+b. Hence every
deletion gap equals b. In particular lambda=0 attains 1/(n-1). Conjugation by
a diagonal matrix of signs gives the source's signed two-clique examples.

The source's separate offdiagonal-column L2/(n-1) conjecture is false under
the intended offdiagonal-column convention: at n=3, diagonal one and every
offdiagonal entry -1/2 give Delta=1/2, whereas that proposed bound is
1/(2 sqrt(2)). This observation is not counted as a second problem and is not
used to narrow the main universal bound statement.

## Bounded current-source and prior audit

The original question, MO 288942 and MSE 2562425 were retrieved with complete
question/answer/comment bodies. The MO versions have zero answers and comments;
MSE has zero answers and five comments, none providing a proof. Proper GitHub
all-state PR searches for all three identifiers returned zero matches at the
audit. Live MO 288399 was unformalized, with zero agents and no solution.

The original author's paper *Mining Novel Multivariate Relationships in Time
Series Data Using Correlation Networks*, arXiv:1810.02950, DOI
10.1109/TKDE.2019.2911681, calls the exact maximum linear gain 1/(n-1) an
empirical observation. Its conclusion explicitly leaves theoretical proofs of
the empirical observations to future research; all supplemental proof sections
were checked. The author's Minnesota thesis, *Introducing Novel Relationships
and Patterns in Time Series Data*, pp. 51-52, likewise presents the same bound
and extremizer as empirically verified, and its future-work discussion does not
provide a theoretical proof. Linear gain there is exactly this deletion gap.

The related answered question MO 288701 concerns a different conjecture linking
an eigenvector coordinate to the smallest offdiagonal column mean. Its numerical
counterexample does not prove this deletion-gap upper bound.

These are bounded audit findings, not a claim of worldwide priority. Further
prior literature must still be considered if the official review supplies it.

## Verification status

The mathematical proof above is complete and independently challengeable.
The accompanying Lean files are a candidate only until an actual pinned kernel
run passes and the exact official checker accepts the statement. No official
claim, submission or acceptance is asserted by this note.
