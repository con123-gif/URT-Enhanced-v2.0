# Independent golden-clock route — exact background cancellation and Schwartz-kernel bound
28 November 2026. Continuation of a6e36f61b8cc045fa0aa0ab8b37599c730a86125 and 3b039f5943b15bd6a33ab789a51e2fb469afa09f. Retrieved exact previous thermal-growth note. Scope: prove the all-orders background estimate and identify the precise remaining centered prime term. NOT an unconditional RH proof or new zero-free region; not a novelty claim for the classical explicit formula or prime-error criterion. No reliance on the compact formal RH proof, no worker schedule changes.

## 1. Remove the continuous prime background before estimating

Put a positive locally finite measure on u>=0:
  dM(u)=sum_{n>=2} Lambda(n)/sqrt(n) delta_{log n}(du).
Define the centered signed measure dmu(u)=dM(u)-e^(u/2)du on [0,infty).
The prior explicit formula reads
  H(t)=e^(t/4)+ integral_0^infty e^(-t y^2) g(y)dy
        -1/(2 sqrt(pi*t)) integral_0^infty e^(-u^2/(4t))dM(u),
where
  g(y)=[Re psi(1/4+iy/2)-log pi]/(2 pi).
Here psi is digamma. This follows by Fourier-transforming the Gaussian in the preceding gamma-integral formula:
  e^(-u^2/(16t))/sqrt(pi*t)=(2/pi) integral_0^infty e^(-t y^2)cos(uy/2)dy.
For small u the cancellation in the numerator of the digamma representation is bounded by O(u)+O(min(2,y^2 u^2)); the Gaussian y integral justifies Fubini. The large u tail decays exponentially. Splitting the digamma integral at 1/(1+y) and 1 gives |g(y)|<=C(1+log(2+y)).

The continuous part of M is evaluated exactly by completing a square:
  1/(2 sqrt(pi*t)) integral_0^infty e^(u/2-u^2/(4t))du
      = (1/2)e^(t/4)(1+erf(sqrt(t)/2)).
Its difference from the elementary e^(t/4) term is
  (1/2)e^(t/4)erfc(sqrt(t)/2)
      = 1/(2pi) integral_0^infty e^(-t y^2)/(y^2+1/4)dy.
For the last equality use 1/(y^2+1/4)=integral_0^infty e^(-s(y^2+1/4))ds and Gaussian integration. Thus exactly
  H(t)= integral_0^infty e^(-t y^2) A(y)dy
        -1/(2 sqrt(pi*t)) integral_0^infty e^(-u^2/(4t))dmu(u),
  A(y)=(Re psi(1/4+iy/2)-log pi+1/(y^2+1/4))/(2pi).
This removes the exponentially growing continuous prime-density term and the elementary pole contribution together. The remaining archimedean signed density has logarithmic growth.

## 2. Exact all-orders kernel

Use d in {1,phi}, m>=1, c=md, x_c(y)=exp(-c(1+y^2)), and define
  f_k(y)=sum_c x_c(y)(1-x_c(y))^k,
  K_k(u)= (1/pi) integral_0^infty cos(uy) f_k(y)dy.
The sum over c counts both clocks, including multiplicities if applicable. It is a real even smooth function of real y. With the previous thermal sequence D_k, binomial expansion gives exactly
  D_k= integral_0^infty A(y) f_k(y)dy - integral_0^infty K_k(u)dmu(u).
Justification: for fixed k expand the finite binomial sum; the Fourier transform of each Gaussian is explicit, giving
  K_k(u)=sum_c sum_{r=0}^k (-1)^r binom(k,r)
          exp(-(r+1)c-u^2/(4(r+1)c))/(2 sqrt(pi*(r+1)c)).
The earlier absolute prime-Gaussian bound O(t exp(t/4)) after the damping shift ensures integrability against total variation of mu and absolute convergence of the outer c sum for every fixed k. No illegal interchange of the full uncentered prime series with the Fourier integral is used.

## 3. New uniform estimate: K_k tends to zero in the Schwartz topology

For every fixed derivative order j, uniformly for integer k>=0 and 0<x<=e^-1,
  |(x d/dx)^j [x(1-x)^k]| <= C_j x.
Proof by expanding the Euler derivatives as finite sums of ordinary derivatives: after product differentiation the terms are constants times x * (k)_h x^h(1-x)^(k-h), 0<=h<=j, with terms h>k zero. For k>=2j, use (k)_h x^h <= (kx)^h and (1-x)^(k-h)<=exp(-kx/2). Polynomial times exponential is bounded. The finitely many smaller k are harmless. For each fixed x in (0,1) these derivatives tend to zero as k increases.
Repeated chain differentiation of x_c(y) yields
  |d_y^j[x_c(y)(1-x_c(y))^k]|
       <= C'_j (1+c)^j (1+|y|)^j exp(-c(1+y^2)).
Indeed d_y=-2cy x d/dx on the scalar function, and repeated differentiation only introduces polynomial factors in c,y. For any fixed polynomial weight in y the sum of these majorants over c=md, m>=1, d in {1,phi} is integrable on R and independent of k. The same majorant justifies termwise differentiation (uniform on compact sets). Dominated convergence gives convergence to zero of all polynomially weighted L1 derivative norms of f_k. By Fourier differentiation and integration by parts, K_k ->0 in every Schwartz seminorm (in particular sup_u |u^p K_k^(q)(u)| ->0 for every p,q). This holds unconditionally; it does not assume any zeta zero location.
Also 0<=f_k<=sum_c exp(-c(1+y^2)), f_k->0 pointwise, hence the entire archimedean integral against A tends to zero by dominated convergence. All-orders archimedean obstruction is removed.

## 4. What still has to be proved about primes

The remaining exact independent RH target is boundedness, or convergence to zero, of the single real integral
  I_k=integral_0^infty K_k(u)dmu(u)
      =sum_{n>=2} Lambda(n)/sqrt(n) K_k(log n)-integral_0^infty e^(u/2)K_k(u)du.
Use the Gaussian series at fixed k for absolute convergence. Schwartz convergence alone does NOT prove this: the total variation of mu grows exponentially, not polynomially. It only proves I_k->0 if the centered measure defines a tempered distribution, e.g. its signed primitive has polynomial growth. This sufficient condition is not established.

Explicitly let E(X)=psi_Cheb(X)-X, psi_Cheb(X)=sum_{n<=X}Lambda(n). With E(1-)=-1, partial summation gives
  mu([0,U])= e^(-U/2) E(e^U) + 1 + (1/2) integral_0^U e^(-v/2) E(e^v)dv.
The +1 arises from the lower endpoint of the continuous integral (Lebesgue mass starts at u=0). Therefore a square-root Chebyshev error with polynomial log factor would give polynomial growth of the signed primitive; this is of RH strength. Conversely a polynomially bounded signed primitive yields E(X)=O(sqrt(X)(1+log X)^B) by integrating e^(u/2)dmu(u), with an additive endpoint constant, hence RH by the usual Mellin continuation. No proof of that bound has been found. The known classical zero-free-region estimates do not establish it. Do not use this sufficient condition as if it were an unconditional input.

## 5. Numerical identity control actually executed

Local container CPython mpmath, 35 digits: compute p=integral_0^infty exp(u/2-u^2/(4t))du/(2 sqrt(pi*t)), r=integral_0^infty exp(-t y^2)/(y^2+1/4)dy/(2pi), residual exp(t/4)-p-r. Output:
  t=.1  residual -3.7615819e-37
  t=1   residual  3.7615819e-37
  t=4   residual  9.4039548e-37
These approximate controls concern the elementary cancellation only, not RH, prime discrepancy, or the all-orders estimate. The analytic proof above does not rely on them. No native Lean replay.

RESUME: the kernel side is now rigorously controlled at all orders; the actual missing step is a bound for the centered prime integral I_k uniform as k grows. Seek a direct arithmetic cancellation estimate strictly weaker in required work than the classical square-root Chebyshev bound; do not mistake distributional convergence on Schwartz tests for convergence against an unproved tempered prime distribution. If unable, retain this independent route as open and focus the compact proof on actual arithmetic suppliers rather than accumulating equivalent formulations.