# Natural cutoff Möbius local energy — remove common-factor and close-pair tails
28 November 2026. Continuation of 873ea1705bcc8476835c5b40502c92ff726bf8a2 (retrieved exact source). Independent exploratory RH route. This is a partial unconditional correlation estimate, not a new zero-free region, proof of RH, or literature priority claim. No native Lean execution or schedules changed.

For fixed 1/2<sigma<1 and T>0 let M_N(z)=sum_{n<=N} mu(n)n^(-z), with arithmetic Möbius mu, and define w_T(x)=sin(Tx)/x for x!=0, w_T(0)=T. The actual off-diagonal in the local energy integral over [-T,T] is
 C_N=4 sum_{m<n<=N} mu(m)mu(n)(mn)^(-sigma) w_T(log(n/m)).
The diagonal is bounded by 2T zeta(2sigma)/zeta(4sigma).

## 1. Unconditional absolute bounds on two portions of the actual sum
The inequality |w_T|<=T is uniform. For any 0<=theta<2sigma-1, the part with 1<=n-m<=m^theta is absolutely summable as N increases:
 sum_{m>=1} sum_{1<=h<=m^theta} (m(m+h))^(-sigma)|w_T(log(1+h/m))|
 <= T sum_{m>=1}m^(theta-2sigma)<infinity.
Its tail with m>=X is O_{sigma,theta,T}(X^(1+theta-2sigma)). In particular no fixed collection of additive shifts can cause unbounded local energy. This does not cover all shifts on a growing proportion of [1,N].

For the portion with g=gcd(m,n)>=G>=2, drop the signs and put m=ga,n=gb. Bound sum_{a<=N/g} a^(-sigma) by O_sigma((N/g)^(1-sigma)). This gives
 sum_{m<n<=N,gcd(m,n)>=G} (mn)^(-sigma)|w_T(log(n/m))|
 <= O_{sigma,T}(N^(2-2sigma) sum_{g>=G}g^(-2))
 = O_{sigma,T}(N^(2-2sigma)/G).
Choosing G=N^(2-2sigma+epsilon) with 0<epsilon<2sigma-1 makes this o(1). Thus the large common-divisor part can be removed at asymptotically zero cost. These estimates are independent of RH, the prime number theorem, or probabilistic assumptions.

## 2. Exact reduction to primitive coprime ratios
Put m=ga,n=gb with (a,b)=1 and a<b. Squarefree factorization gives
 mu(ga)mu(gb)=mu(a)mu(b)mu(g)^2 1_{(g,ab)=1}.
This holds also when a,b or g are not squarefree (both sides vanish whenever relevant).
Therefore C_N is exactly
 4 sum_{a<b<=N,(a,b)=1} mu(a)mu(b)(ab)^(-sigma)
   w_T(log(b/a)) sum_{g<=N/b,(g,ab)=1} mu(g)^2 g^(-2sigma).
For a fixed ratio b/a the inner mass converges to the strictly positive factor
 D(ab)=zeta(2sigma)/zeta(4sigma) prod_{p|ab}(1+p^(-2sigma))^(-1),
by the absolutely convergent squarefree Euler product. The shared-prime signs have disappeared; only primitive coprime signs remain.

Quantitative uniform replacement: for any 1<=R<=N, replace the inner sum by D(ab) in the portion b<=R. The error is bounded by
 O_{sigma,T}(N^(1-2sigma) sum_{b<=R} b^(sigma-1) sum_{a<b} a^(-sigma))
 = O_{sigma,T}(R N^(1-2sigma)).
Here the omitted g-tail is <=O_sigma((N/b)^(1-2sigma)), by the integral test. In particular the replacement error tends to zero if R=o(N^(2sigma-1)). This is an actual uniform approximation on a growing subset of the pair sum; it is NOT an assertion that the sum of D(ab) over all primitive ratios converges absolutely or conditionally.

## 3. Literature comparison / remaining obstacle
Matomaki and Radziwill, Multiplicative functions in short intervals, Annals of Mathematics 183 (2016), 1015–1056, https://annals.math.princeton.edu/2016/183-3/p06, proves cancellation of Möbius averages in almost all growing short intervals. Matomaki and Teravainen, On the Möbius function in all short intervals, JEMS 25 (2023), 1207–1225, gives o(X^theta) for intervals of length X^theta with theta>0.55. Matomaki–Radziwill–Shao–Tao–Teravainen, Higher uniformity of arithmetic functions in short intervals II, Inventiones 244 (2026), https://doi.org/10.1007/s00222-026-01408-6, develops stronger local uniformity results. None of the stated results cited here supplies a uniform square-root-scale cancellation bound for the entire remaining coprime ratio sum; an o(length) short-interval bound alone does not do so. Do not substitute results about almost all starting points or averaged frequency for the fixed compact-frequency inverse estimate.

The diagonal, genuinely close pairs, and very large gcd pairs are now controlled, and the common factor has been summed exactly in the limit for primitive ratios with sufficiently small denominator. The remaining primitive signed correlations across a growing range of ratios have NOT been controlled. In particular this is not a successful completion and does not establish progress on the compact proof's root obligations. No new numerical check was performed for this analytical derivation. The result is a modest partial estimate; do not represent it as a breakthrough.

RESUME: only continue the independent route if a genuinely new bound on the remaining coprime-ratio sum becomes available; otherwise prioritize the compact proof's actual unresolved arithmetic suppliers. No worker changes.