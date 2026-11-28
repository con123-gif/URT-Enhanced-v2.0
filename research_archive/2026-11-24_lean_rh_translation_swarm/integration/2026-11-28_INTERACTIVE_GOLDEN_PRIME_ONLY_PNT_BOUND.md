# Independent golden-clock RH route — prime-only reduction and unconditional signed cancellation
28 November 2026. Continuation of e95d07fc91851e70d541311eaf1ea1157a54e1e3 (read exact source) and ecd24ac3bed68b977e52fd74180d86e1914423ca. No RH assumption, no proof of RH, no novelty claim, no native Lean execution. No schedules or existing RH workers changed.

## 1. Remove every higher prime power at once
Retain the same kernel K_k and centered measure from the previous notes. Write mu=mu_1+nu_2+nu_3, where
  mu_1=sum_p log(p)/sqrt(p) delta_(log p) - exp(u/2)du,
  nu_2=sum_p log(p)/p delta_(2 log p),
  nu_3=sum_p sum_(a>=3) log(p)/p^(a/2) delta_(a log p).
The total mass of nu_3 is finite: bound by sum_(n>=2) log(n) n^(-3/2)/(1-n^(-1/2)).
The cumulative mass of nu_2 on [0,U] is at most sum_(2<=n<=exp(U/2)) log(n)/n = O((1+U)^2), by elementary harmonic sums. Hence integral (1+u)^(-4) dnu_2 is finite (partition into unit intervals and bound each by cumulative mass). By the established Schwartz convergence of K_k, both integrals against nu_2 and nu_3 tend to zero: use sup (1+u)^4 |K_k| ->0 for nu_2, and sup |K_k| ->0 for nu_3. This eliminates all prime powers unconditionally over the ENTIRE half-line, not merely over a finite window. Therefore RH iff the remaining prime-only integral J_k=integral K_k dmu_1 tends to zero.

## 2. Direct signed arithmetic cancellation using the PNT
Input: the unconditional Vinogradov–Korobov PNT error for theta(X)=sum_(p<=X)log p. The explicit form in Theorem 1.4 of Some explicit estimates for the error term in the prime number theorem (2023), https://www.sciencedirect.com/science/article/abs/pii/S0022247X23004638, is
 |theta(X)-X| <= .027 X (log X)^1.801 exp(-.1853 (log X)^(3/5)/(log log X)^(1/5)) for X>=23.
It implies, with absolute constants and u sufficiently large,
 |theta(exp(u))-exp(u)| <= C exp(u-.1 V(u)), V(u)=u^(3/5)/(log u)^(1/5).
Absorb the polynomial factor since log u=o(V(u)). This is a known external theorem, not a claimed new zero-free region or an improvement of PNT.

Let M(u)=mu_1([0,u]) and E(X)=theta(X)-X. Stieltjes partial summation (including the endpoint X=1) gives
 M(u)=exp(-u/2)E(exp(u))+1+(1/2)integral_0^u exp(-v/2)E(exp(v))dv.
Thus |M(u)|=O(exp(u/2-.1 V(u))) for large u. Indeed g(u)=u/2-.1 V(u) has g'(u)>=1/4 for sufficiently large u; so integral of exp(g(v)) from a fixed sufficiently large point to u is <=4 exp(g(u)), and all earlier contributions are bounded. No RH-strength estimate is inserted here.

The prior uniform f_k(y)<=C min(1/k,exp(-y^2)) gives both
 sup|K_k|=O(sqrt(log k)/k),
 sup|K'_k|=O((1+log k)/k).
For the derivative differentiate the cosine transform (dominated by |y| exp(-y^2)); split at sqrt(log k), using integral_0^R y dy=R^2/2 and integral_R^infty y exp(-y^2)dy=exp(-R^2)/2.
For L sufficiently large, signed Stieltjes integration by parts and the same endpoint domination now yield
 |integral_[0,L] K_k dmu_1| <= |K_k(L)M(L)|+integral_0^L |K'_k(u)M(u)|du
 = O((1+log k)/k * exp(L/2-.1 V(L))).
For k sufficiently large set L_k=2 log k+.1 V(log k). Since V is increasing eventually and L_k>=log k, the exponent after division by k is at most -.05 V(log k). Thus the entire interval [0,L_k] contributes
 O((1+log k) exp(-.05 V(log k)))=o(1).
This is an actual signed-prime cancellation estimate, extending beyond the prior elementary 2 log k threshold by an unbounded additive amount. Endpoint atoms are included by the right-continuous cumulative measure; discarded lower range includes L_k.

## 3. Remaining window and actual limitation
The previous far-tail estimate applies unchanged to mu_1 because its total variation is bounded by that of the separate uncentered prime and continuous measures used there. Therefore the exact surviving criterion is
 RH iff integral_(L_k,4k] K_k dmu_1 ->0.
This removes prime powers and both tails with explicit unconditional bounds. The PNT estimate is not uniform enough to control the full middle window: applying the same integration-by-parts bound at 4k would permit growth of order exp(2k-o(k))/k. No further justified cancellation over that interval was found. In particular the result is not an independent proof and no mathematical root of the compact reconstruction is closed. No numerical tests were run for this analytic derivation.

RESUME: actual new input would be a bound on the centered prime contribution in this remaining window, not another equivalent criterion or a larger finite sign check. Preserve independent route as incomplete and retain existing compact proof priority.