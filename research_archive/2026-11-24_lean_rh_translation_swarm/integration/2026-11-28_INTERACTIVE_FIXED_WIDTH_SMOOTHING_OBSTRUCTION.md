# Fixed-relative uniform cutoff averaging cannot converge to zero
Continuation of 0446e2b9c7d687e3d1e674f5a8d26512fc90cfbc (exact source retrieved). This is an unconditional negative result for the particular quarter-cutoff uniform averaging construction, even assuming RH. It uses Hardy's classical theorem that at least one zeta zero lies on the critical line (e.g. U.K. Sangale, A note on Hardy's theorem, https://hrj.episciences.org/2634/pdf). No numerical execution or Lean replay claimed. No claim of literature priority or changes to schedules.

Let M(y)=sum_{n<=y}mu(n), m(y)=sum_{n<=y}mu(n)/n, H(y)=y m(y)-M(y), all zero for y<1. For integer K>=2 let r_K(t) be the residual of the previous uniform average of the hard witnesses with integer cutoffs k=K,...,4K. This is the previous N=4K and K/N=1/4 family, extended by zero for t<1 and constant on each cell [j,j+1).
For K<=j<2K the exact formula of the previous note reduces to
 r_K(j)=[(j-K+1)M(j)+sum_{k=K}^j H(k)]/(3K+1).

Theorem: for any fixed 1<b<2,
 limsup_{K->infinity} integral_K^(bK) |r_K(t)|^2 dt/t^2 >0
 (the limsup may be infinite). Hence neither the full squared norm nor the measured partial squared norm through 4N can tend to zero along all K.

Proof. Assume the displayed integral tends to zero. It suffices to work with any smaller fixed b' in (1,b) and a real variable X with K=floor X. Uniformly for 1<=z<=b', t=zX and j=floor t satisfy K<=j<2K for sufficiently large X. By elementary divisor identity sum mu(n)floor(y/n)=1, |m(y)|<=1+1/y for y>=1. Partial summation gives H(y)=integral_1^y m(v)dv, so H is Lipschitz with constant 2 and |H(y)|<=2y. Also |M(y)|<=y. Riemann sum versus integral using Lipschitz continuity, and the O(1) endpoint/denominator changes, give uniformly
 3 r_K(zX) = (z-1)M(zX)+ integral_1^z H(uX)du + O(1).
Indeed (j-K+1)/(3K+1) differs from (z-1)/3 by O(1/X); replacing the finite H sum by integral_X^(zX) H(v)dv costs O(X), and replacing 1/(3K+1) by 1/(3X) costs O(1/X^2) times O(X^2). M(j)=M(zX) exactly.

For sufficiently large X, [X,b'X] is contained in [K,bK]. The hypothesis thus gives integral_1^b' |r_K(zX)|^2 dz/z^2=o(X). For any bounded real weight w on [1,b'] define
 L(X)=integral_1^b' w(z)[(z-1)M(zX)+integral_1^z H(uX)du]dz.
By Cauchy-Schwarz and the uniform O(1) error, L(X)=o(sqrt X). It is locally bounded and zero for X<1/b'.

For Re s>1 absolute convergence and sum-integral interchange give
 integral_0^infinity M(X)X^(-s-1)dX=1/(s zeta(s)),
 integral_0^infinity H(X)X^(-s-1)dX=1/[s(s-1)zeta(s)].
The second follows by subtracting the M transform from that of X*m(X), equal to 1/[(s-1)zeta(s)]. Scaling and Fubini give exactly
 integral_0^infinity L(X)X^(-s-1)dX = A_w(s)/(s zeta(s)),
 A_w(s)=integral_1^b' w(z)[(z-1)z^s+(1/(s-1))integral_1^z u^s du]dz.
This numerator is meromorphic with possible pole only at 1; no issue at any critical-line zero rho.

Choose one known critical-line zero rho. For z approaching 1 from above, the bracket at s=rho divided by z-1 tends to rho/(rho-1), which is nonzero. Take w=1 on [1,1+epsilon], zero elsewhere, for sufficiently small fixed epsilon>0 with 1+epsilon<b'. Then A_w(rho)=rho/(rho-1)*epsilon^2/2+O_rho(epsilon^3) !=0. This choice depends only on one known zero and is fixed for all X.

The assumed L(X)=o(sqrt X) makes its Mellin transform holomorphic in Re s>1/2. The meromorphic identity continues there by the identity theorem (including any removable singularities). Moreover for s=rho+delta, delta real decreasing to zero,
 delta * |integral_0^infinity L(X)X^(-rho-delta-1)dX| ->0.
Proof: the bounded initial interval contributes O(delta); on X>=X0 use |L(X)|<=eta sqrt X for arbitrary eta>0, yielding upper bound eta*X0^(-delta) after multiplying by delta. But A_w(rho)!=0 and zeta has a zero of some integer multiplicity >=1 at rho, so the right side has a pole of order >=1. Its product by delta does not tend to zero. Contradiction.

This proves a genuine limitation of this uniform fixed-relative family, not merely failure of current estimates. It does not rule out other weights, a widening logarithmic averaging range, or a subsequence of K. In particular the theorem does not rule out the full Nyman-Beurling approach, nor does it give a counterexample to RH. A new coefficient construction with control across increasing logarithmic ranges would be needed; no such vanishing estimate is established here. The O(N) finite-band evaluation remains correct, but cannot establish zero convergence for the entire tested family.