# Exact smaller-scale recursion: spurious dyadic growth modes and how to eliminate them

28 November 2026. Continuation of 34babf5e4cc0a4250b092f232f834f89820739ef (exact source retrieved). This proves a limitation of any induction that uses just the single alternating recursion, a compact seed, linear variation and a square-root tail. It also proves the two-radix elimination of the extraneous dyadic modes. It does NOT exhibit a bad mode of the actual golden divisor sum, prove RH, or close the signed cancellation. No numerical experiments, native Lean replay, worker/schedule changes or novelty claim.

## 1. What the actual recursion gives

Let F(x)=x sum_{n<=x}mu(n)/n (zero below 1), D(x)=F(phi*x)-F(x). Then L D(x):=sum_{n>=1}D(x/n)=(phi-1)x for x>=1. For integer b>=2 define T_b f(x)=f(x/b). For x>=b the identity (I-b T_b)L D(x)=0 holds, equivalently sum_{n>=1}(1-b 1_{b|n})D(x/n)=0. The b=2 case is exactly the previously proved pair recursion. The multiplier is eta_b(s)=(1-b^(1-s))zeta(s), initially from absolute convergence in Re s>1, continued to Re s>0. The extra roots s=1+2pi i k/log b, k nonzero, do not belong to zeta (classical PNT nonvanishing on Re s=1). Hence the b=2 recurrence has artificial spectral modes. The actual D has a prescribed seed and an additional full divisor identity, so this observation alone does not imply instability of D.

## 2. Exact counterexample to a generic induction from the one-radix recurrence and variation alone

Choose any nonzero smooth nonnegative real bump H supported in (1,2^(1/4)), and set
 h(x)=sum_{n>=1}mu(n) H(x/n),
 G(x)=sum_{j>=0}2^j h(x/2^j).
Both sums are finite at every x and vanish below 1. Local finite smoothness holds since the bump is smooth and zero outside its support. The divisor identity gives L h=H, and telescoping gives (I-2 T_2)G=h. All operators commute as locally finite dilation sums. Thus
 (I-2 T_2)L G=H.
For every x>=2, G obeys exactly the same homogeneous pair recursion as D:
 G(x)=sum_{j>=1}[G(x/(2j))-G(x/(2j+1))].
Its seed differs from D; this is a counterexample to generic sufficient premises, not to the actual D.

To prove a linear variation bound for G use the unconditional classical estimate M(y)=sum_{n<=y}mu(n)=O(y exp(-c sqrt(log y))) for y>=2 and some c>0. Reference: On some effective results involving zeros of the Riemann zeta function, Bulletin of the Australian Mathematical Society, https://www.cambridge.org/core/journals/bulletin-of-the-australian-mathematical-society/article/on-some-effective-results-involving-zeros-of-the-riemann-zeta-function/8D885EAF542CEA62250CDF37719DC7B0 (section preceding references; the classical bound is stated explicitly). By Abel summation, h(x)=O(x exp(-c' sqrt(log x))), h'(x)=O(exp(-c' sqrt(log x))) for large x, c'>0. Indeed both sums are supported on n comparable to x; the weight H(x/n) has sup O(1), derivative in n O(1/x), while H'(x/n)/n has sup O(1/x), derivative in n O(1/x^2). Multiply these variation bounds by the maximum of |M| on the supporting interval. The finite small-x range is bounded separately.

Now G'(x)=sum_{j>=0} h'(x/2^j); for each dyadic scale there is at most one term with argument in it, so the sum of absolute bounds is uniformly finite by convergence of sum_{k>=0}exp(-c'' sqrt(k)). Thus |G'(x)|=O(1) and Var_[0,Y] G=O(Y). In particular G admits the same O(sqrt(x)) discarded-tail estimate in the pair recurrence as D, by the same disjoint-interval variation proof.

Nevertheless G has linear growth along a sequence. Write tau=2pi/log 2. For 1<=y<=2,
 lim_{k->infinity} G(2^k y)/(2^k y) = P(y)=sum_{l in Z} h(2^l y)/(2^l y).
The limit is uniform, by the bound on h and its vanishing below 1. This is a continuous multiplicatively 2-periodic function. Its Fourier coefficient in log y at frequency tau is
 integral_1^2 P(y)y^(-i tau) dy/y = integral_1^infty h(t)t^(-2-i tau)dt.
Unfolding the dyadic intervals is justified by uniform absolute convergence, and exp(i tau l log 2)=1. With Hhat(s)=integral H(t)t^(-s-1)dt, absolute sum-integral interchange in Re s>1 gives hhat(s)=Hhat(s)/zeta(s). The unconditional bound on h permits the limit from Re s>1 to s0=1+i tau by dominated convergence. Since zeta(s0) is finite and nonzero, the displayed Fourier coefficient is Hhat(s0)/zeta(s0) !=0. Indeed the real part of Hhat(s0) is strictly positive because the bump is nonnegative and supported where 0<tau log t<pi/2.

Therefore P is not identically zero. Choose y with P(y)!=0. Along x_k=2^k y, G(x_k)/x_k converges to a nonzero number, so |G(x_k)|/sqrt(x_k) grows on the order of sqrt(x_k). This disproves a generic subpower induction from the one-radix recurrence, compact seed and O(Y) variation (even for smooth bounded-derivative functions with the same square-root tail). It does NOT disprove the specific estimate for the prescribed Mobius seed D. In particular the stronger jump data, seed-specific cancellations or full divisor law cannot be discarded.

## 3. Remove the artificial modes without assuming RH

The actual D obeys both b=2 and b=3 recursions (indeed all b). On Re s>0 their common zeros are precisely the zeros of zeta: for s!=1, if zeta(s)!=0, both factors could vanish only if Re s=1 and Im(s)*log 2 and Im(s)*log 3 were both integer multiples of 2pi. For nonzero ordinate this implies log 2/log 3 rational, contrary to unique prime factorization. At s=1 the product has removable nonzero values log b. Thus the intersection removes the artificial modes at Re s=1 unconditionally.
An additional exact observation: if a function G supported on [a,infinity), a>0, satisfies both homogeneous recursions for x>=3, then L G(x)/x is invariant under dividing by 2 and 3 wherever the respective homogeneous equations hold. If continuous for x>=3, it is constant there: for any x,y>=3, approximate log(y/x) by integer combinations of log 2 and log 3, arranging all positive shifts before negative shifts to keep intermediate arguments >=3. Continuity and density then give equality. This applies to the smooth countermodel if it were to obey the ternary recursion, and explains why the actual divisor law is stronger than the dyadic recursion. It does not control possible zeta modes off the critical line.

## Status

A universal proof by the one-radix recursive norm and tail estimates is insufficient, even with a finite seed and linear regularity. Retain the actual seed or simultaneous divisor identities to exclude alias growth. No bound on the remaining genuine zeta modes or RH-strength signed arithmetic correlations has been derived. The O(N) finite certificate remains evidence for a finite range, not an estimate beyond it. Do not report this as a completed induction or a measure of closeness to RH.