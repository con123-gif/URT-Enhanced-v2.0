# Independent RH route: unconditional localization of the remaining prime integral
28 November 2026. Continuation of ecd24ac3bed68b977e52fd74180d86e1914423ca (exact note read). Scope: remove the small-prime and distant-prime tails uniformly, without RH. This is a partial estimate, not a proof of RH, new zero-free region, or novelty claim. No worker or schedule changes.

Use the previous exact centered measure mu and kernel K_k:
 dmu(u)=sum_{n>=2} Lambda(n)/sqrt(n) delta_{log n}(du)-exp(u/2)du,
 f_k(y)=sum_{d in {1,phi},m>=1} x(1-x)^k, x=exp(-md(1+y^2)),
 K_k(u)=1/pi integral_0^infty cos(uy) f_k(y)dy.
For every fixed epsilon in (0,2), put L=(2-epsilon)log k and U=4k (integer k>=2).
We prove
 I_k=integral_[L,U] K_k dmu + O((1+log k)^(3/2) k^(-epsilon/2))
       + O((1+k)exp(-(2 sqrt(2)-2-log 2)k)).
Endpoint conventions can be fixed by taking the lower discarded region [0,L) and upper (U,infinity); estimates include possible boundary atoms. Constants independent of k. The exponent 2sqrt(2)-2-log2 is strictly positive (2sqrt2-2>0.8, log2<0.7).

## 1. Uniform real-axis kernel bound with rate
Fix d>=1 and y real; q=exp(-d(1+y^2))<=exp(-1). Let v_m=k q^m. Since (1-q^m)^k<=exp(-v_m),
 k sum_{m>=1} q^m(1-q^m)^k <= sum v_m exp(-v_m).
For v_m<=1 the sum is at most 1/(1-q)<=1/(1-exp(-1)), by geometric series. For v_m>1 there is at most one v_m in each half-open interval [exp(j),exp(j+1)), j>=0, because successive log v_m differ by at least 1. The sum is therefore bounded by sum_{j>=0} exp(j+1-exp(j)), an absolute finite constant. Consequently f_k(y)<=C/k uniformly. Also f_k(y)<=sum_{d,m}exp(-md(1+y^2))<=C exp(-y^2). Split the y integral at sqrt(log k). Gaussian tail estimate integral_R^infty exp(-y^2)dy<=exp(-R^2)/(2R) proves
 sup_{u real}|K_k(u)| <= C sqrt(log k)/k.
This improves the earlier qualitative Schwartz convergence to an explicit zeroth-order bound. No need for any prime input.

## 2. Remove the near prime region
From Lambda(n)<=log n and sum_{n<=X} n^(-1/2)<=2sqrt(X), the total variation of mu on [0,L] is <=C(1+L)exp(L/2). Hence
 |integral_[0,L) K_k dmu| <= C (1+log k)^(3/2) k^(-epsilon/2).
This tends to zero for each fixed epsilon>0. Uses only trivial arithmetic estimates.

## 3. Remove the very distant region
The exact Gaussian binomial series in the previous note writes K_k as sum_{d,m,r} (-1)^r binom(k,r) exp(-t-u^2/(4t))/(2sqrt(pi t)), t=(r+1)md>=1.
For u>=0, t/2+u^2/(4t)>=u/sqrt(2). Thus |exp(-t-u^2/(4t))|<=exp(-t/2-u/sqrt(2)). Sum over m,d with t>=md, then over r, giving |K_k(u)|<=C 2^k exp(-u/sqrt(2)).
Let eta=1/sqrt(2)-1/2>0. Continuous density gives integral_U^infty exp(-u/sqrt(2))exp(u/2)du=eta^-1 exp(-eta U). For the prime atoms partition u into [U+j,U+j+1), j>=0. The number of integers is <=exp(U+j+1), Lambda<=U+j+1, and each weight after including the exponential kernel is <=exp(-(1/2+1/sqrt(2))(U+j)); sum gives C(1+U)exp(-eta U). Therefore
 |integral_(U,infty) K_k dmu|<=C(1+U)exp(k log2-eta U).
Take U=4k to obtain the claimed bound.

## 4. Precise surviving arithmetic problem
Since both discarded pieces tend to zero, the prior RH criterion I_k->0 is now equivalent to
 integral_[(2-epsilon)log k,4k] K_k(u)dmu(u)->0.
For example epsilon=1 leaves log k<=u<=4k, or prime arguments k<=n<=exp(4k). The estimates are unconditional and are actual bounds on parts of the original integral, not only a change of its notation. However this window grows with k and the centered prime discrepancy inside it has NOT been controlled. The bound is not a computation of primes throughout that range. No native Lean execution, numerical testing, or improvement of known RH zero-height verification claimed. No argument from finite-range sign checks.

RESUME: attack cancellation in the middle window using a genuinely arithmetic estimate for the signed prime discrepancy; if no such estimate is obtained, retain as an open partial result and avoid more equivalent reformulations. Main RH reconstruction workers remain unchanged.