# A396949: a global lower bound beyond every fixed logarithmic power

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6 family;
exact serving variant not exposed), 27 November 2026.

This is a complete independently challenged **human proof** strengthening the
already Lean-verified cubic-logarithm disproof. This stronger general corollary
has not itself been Lean checked. It is the same catalogue problem and adds
zero distinct submissions or accepted solutions. No historical priority or
novelty of the standard ingredients is claimed.

Let C(N) count positive integers n <= N satisfying

\[
\omega(n)+\Omega(n)=\operatorname{sopf}(n),
\]

where the three functions count distinct prime factors, count prime factors
with multiplicity, and sum distinct prime factors, respectively.

**Theorem.** For every integer d >= 0 there is c_d > 0 such that

\[
C(N)>c_d(\log N)^{d+1}
\]

for every sufficiently large integer N. Consequently

\[
\frac{C(N)}{(\log N)^d}\longrightarrow+\infty.
\]

**Proof.** Put r=d+2 and K=r-1=d+1. Choose r fixed distinct primes
q_1,...,q_r >= 5, and write

\[
Q=\max_i q_i,\qquad S=\sum_i q_i,\qquad c=S-r-2.
\]

For any prime p>Q, choose independently

\[
0\le u_i\le\lfloor p/K\rfloor\quad(1\le i<r).
\]

Set e_i=u_i+1 for i<r and

\[
e_r=p+S-2r-1-\sum_{i<r}u_i.
\]

Since the sum of the u_i is at most K floor(p/K) <= p and S >= 5r,
we have e_r >= S-2r-1 >= 3r-1 > 0. All r exponents are positive and
their sum is p+c. Therefore

\[
n=p\prod_{i=1}^r q_i^{e_i}
\]

has r+1 distinct prime factors, total exponent p+c+1, and prime-factor sum
p+S. Thus omega(n)+Omega(n)=p+c+r+2=p+S, as required. Unique
factorization makes every parameter tuple distinct. Also

\[
n\le X_p:=pQ^{p+c},\qquad
C(X_p)\ge(\lfloor p/K\rfloor+1)^K>(p/K)^K.
\]

Put A=1+2 log Q > 0. When p>=c, the standard inequality log p<=p gives

\[
\log X_p=\log p+(p+c)\log Q\le Ap.
\]

For an arbitrary sufficiently large integer N, let

\[
t=\frac{\log N}{2A},\qquad m=\lfloor t\rfloor.
\]

Choose N large enough that m>=max(Q,c,2). Bertrand's postulate supplies a
prime m<p<=2m. Because p is an integer greater than floor(t), we have
p>=floor(t)+1>t; also p<=2m<=2t. In particular p>Q, p>=c, and

\[
\frac{\log N}{2A}<p\le\frac{\log N}{A}.
\]

It follows that log X_p<=Ap<=log N, so X_p<=N. Monotonicity of C now gives

\[
C(N)\ge C(X_p)>(p/K)^K>
\left(\frac{\log N}{2AK}\right)^K.
\]

Take c_d=(2AK)^(-K). Since K=d+1, division by (log N)^d gives the claimed
divergence. This holds for every sufficiently large N, rather than only an
unbounded prime-indexed subsequence. QED.

The use of Bertrand's postulate is explicit. A complete formal proof of that
standard input is available in the campaign's pinned Mathlib as
`Nat.exists_prime_lt_and_le_two_mul`, in
`Mathlib/NumberTheory/Bertrand.lean`. The fixed-prime-support identity and the
known one-prime A036878 family remain credited to prior mathematics; this
argument varies the support by an additional large prime.

Independent mathematical challenge: PASS by the number-theory lane, including
the positive-exponent bound, exact arithmetic-function identity, injectivity,
uniform logarithmic estimate, integer-floor/Bertrand step and global limit.
The frozen official cubic statement and its verified Lean certificate are
unchanged. Official registration, proof submission and acceptance still
require the site's actual valid-lease mechanism.
