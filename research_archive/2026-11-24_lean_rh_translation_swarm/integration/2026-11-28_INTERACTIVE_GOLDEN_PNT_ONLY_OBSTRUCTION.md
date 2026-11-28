# Independent golden-clock route — exact obstruction to PNT-only closure
28 November 2026. Continuation of 3d39607779d344912b2dbb2a1ba2aca0c0c2f94b (exact note retrieved), ecd24ac3bed68b977e52fd74180d86e1914423ca and 3b039f5943b15bd6a33ab789a51e2fb469afa09f. This is a rigorous negative control on a proposed METHOD, not a counterexample to RH or a theorem about actual primes. No numeric tests, native Lean replay, worker reallocations, or claims of literature priority.

## 1. Statement
For every fixed 0<a<1/2 there exist nonnegative weights w_n<=log n on integers n>=2, with
  sum_{n<=X} w_n = X + O(X^(1/2+a)),
such that the exact golden kernel of the independent RH route satisfies
  integral_0^infty K_k(u) [sum_{n>=2} w_n/sqrt(n) delta_{log n}(du) - exp(u/2)du] -> -infinity
exponentially in k. Thus a PNT error bound of any fixed power-saving strength short of the square-root exponent, together with nonnegative discrete weights and the pointwise logarithmic bound, does not suffice to prove the remaining kernel limit. This does not exclude a proof using exact arithmetic structure of primes; the constructed weights are NOT von Mangoldt or primes-only weights. The result is a limitation on the information used by a proof, not a limitation on all possible RH approaches.

## 2. Continuous construction and exact transform
Put b=pi/(2a), z=b+ia, C=1+b^2-a^2>0, r=exp(-C) in (0,1). For c=md, d in {1,phi}, m>=1, write
  f_k(z)=sum_c exp(-c(1+z^2))(1-exp(-c(1+z^2)))^k.
For each fixed k this is holomorphic in |Im z|<1, because Re(1+z^2)>0 there and the c sum is locally uniformly convergent. It is the analytic continuation of the actual even real-axis kernel multiplier. From the Gaussian formula in the previous note, K_k is bounded, for fixed k, by C_k exp(-u/sqrt(2)) on u>=0. The even extension has the same bound in |u|. Fourier inversion on real z (Schwartz multiplier) and the identity theorem in |Im z|<1/sqrt(2) yield
  f_k(z)=integral_R K_k(u) exp(i z u)du.
The complex Fourier integral is absolutely convergent on that strip. Hence
  integral_0^infty K_k(u) cosh(a u) cos(bu)du = (1/2) Re f_k(b+ia).
The sign choice in the Fourier exponential is irrelevant because K_k is even.

Now 1+z^2=C+i*pi, so the c=1 node is exactly -r. Its term is -r(1+r)^k. All other c>=phi>1; their node moduli are r^c and
  |sum_{c>1} exp(-c(1+z^2))(1-exp(-c(1+z^2)))^k|
      <= [sum_{c>1} r^c] (1+r^phi)^k.
The constant sum converges by two geometric series. Since 1+r^phi<1+r, we obtain the exact asymptotic
  integral K_k cosh(a u)cos(bu)du = -(r/2)(1+r)^k + O((1+r^phi)^k).
In particular the centered integral diverges negatively. No assumption of spectral zeros or RH is used.

The positive weighted counting density on log scale is
  dM(u)=[exp(u/2)+cosh(a u)cos(bu)]du.
It is nonnegative since cosh(a u)<=exp(a u)<=exp(u/2) for u>=0. Under x=exp(u), its unweighted counting density is
  v(x)=1+x^(-1/2)cosh(a log x)cos(b log x), x>=1.
Thus 0<=v(x)<=2 and integral_1^X v(x)dx = X+O(X^(1/2+a)), simply by bounding the oscillatory term in absolute value. Subtracting the exact continuous background leaves precisely the growing integral above.

## 3. Discretization with the same error and divergence
For each integer n>=2 define w_n=integral_n^(n+1) v(x)dx. Then 0<=w_n<=2, hence w_n<=log n for n>=8. For 2<=n<8 replace w_n by min(w_n,log n); changing finitely many values adds only O(1) to the counting function. The cumulative count differs from integral_1^X v by O(1), even for nonintegral X, since v bounded. Thus the asserted PNT-type bound holds.

Let g_k(x)=x^(-1/2) K_k(log x). By the chain rule,
  |g'_k(x)| <= x^(-3/2)(sup|K'_k| + (1/2)sup|K_k|).
For the unchanged weights, the difference between the discrete weighted integral and the continuous weighted integral on [2,infty) is
  sum_{n>=2} integral_n^(n+1) v(x)[g_k(n)-g_k(x)]dx.
Its absolute value is at most
  2 sum_{n>=2} n^(-3/2)(sup|K'_k|+(1/2)sup|K_k|) -> 0.
This uses precisely the unconditional real-axis kernel convergence previously proved. The finite changes of weights and omitted interval [1,2] also contribute o(1). For fixed k the original integrals and sums exist absolutely, as follows from the previous far-tail Gaussian bound with exponent 1/sqrt(2)>1/2. Consequently discretization changes the centered integral only by o(1) and the explicit exponential divergence survives.

## 4. Interpretation for the actual open proof
The prior PNT-only cancellation on the lower window is valid, but no estimate derived solely from nonnegativity, log-size weights, discreteness at log integers, and a fixed power-saving PNT error can force all-order cancellation on the remaining window. Indeed the present model satisfies even a stronger asymptotic than the Vinogradov–Korobov error used in the previous checkpoint. Its defect is a small oscillatory mode of amplitude exp(a u) in centered log coordinates; the exact kernel transforms it into the negative-node exponential instability. Taking a arbitrarily small demonstrates why a finite error allowance is insufficient. This does not say the actual primes have such a mode.

The next necessary input must exploit information distinguishing the actual prime weights from this model, e.g. an exact Euler-product/multiplicative correlation estimate at square-root strength or a direct positive quadratic-form theorem. No such new arithmetic estimate has been obtained here. Do not use synthetic tests or further equivalent transformations as evidence of RH progress. The independent route remains open; keep this precise obstruction as a stopping checkpoint for PNT-only work. Preserve the main compact arithmetic reconstruction and all schedules.