# Universal finite-step descent for the multiplicative geometric update

28 November 2026. Continuation of 9d67e80a7281373ba34029f1ae1bb64200e6325c, whose exact source was retrieved. The prior note supplies a reported rational comparison for one selected witness; this note does not rerun that calculation. The result here is an analytical proof that every nontrivial finite real witness admits a strictly improving one-monomial multiplicative update. It does NOT establish a uniform descent rate or RH. No numerical experiment, native Lean execution, literature-priority claim, or worker/schedule changes.

## 1. Statement

Use t=1/x and the real Hilbert norm ||h||^2 = integral_0^infinity |h(t)|^2 dt/t^2. Write chi(t)=1_{t>=1}, b_n(t)={t/n}-{t}/n, r=chi+g, g=sum_{n=2}^N c_n b_n, with finite real coefficients and g not identically zero. Set T_k g(t)=g(t/k) for integer k>=1. We prove that for all sufficiently large integer multiples k of L=lcm(1,...,N), the correlation C_k=<r,T_k g> is nonzero. Hence the exact real coefficient
 a_k=-C_k/||T_k g||^2
 gives an admissible residual r_new=r+a_k T_k g with
 ||r_new||^2=||r||^2-C_k^2/||T_k g||^2 < ||r||^2.
The identity T_k b_n=b_(kn)-b_k/n makes the correction admissible, and in Mellin variables the polynomial is P_new=P(1+a_k k^(-s)), preserving P(1)=0. Also ||T_k g||^2=||g||^2/k by substitution. This generalizes the finite descent test from one selected vector to every nontrivial finite witness. The exceptional g=0 yields r=chi, for which a negative small multiple of b_2 gives strict additive descent since <chi,b_2>>0; multiplication of P=0 alone cannot move it.

## 2. Periodic correlation expansion

For t>=1 and j=floor(t), g(t)=g_j=sum c_n (j mod n)/n. This sequence is periodic with period L and g_j=0 at multiples of L. Both r and g vanish below 1. Let p(u)=1+g_(floor(L*u) mod L), where g_0=0 is the periodic extension (not the value of r below 1). The real bounded function p has period 1. Since g is not zero and g_0=0, p is nonconstant. For k=L*m, m a positive integer, substitution gives
 k C_k = integral_1^infinity g(t) p(m*t) dt/t^2.
Write pbar=integral_0^1 p(u)du, and define P_0=p-pbar. Recursively choose P_h as the unique periodic mean-zero primitive of P_(h-1), h>=1. These are bounded periodic functions, absolutely continuous, and satisfy P_h'=P_(h-1) almost everywhere.

For f(t)=t^(-2), integration by parts separately on [j,j+1] gives, for any fixed H>=1,
 k C_k = pbar*S_0 + sum_{h=1}^H h! P_h(0) S_h / m^h + O_H(m^(-H-1)),
 where S_0=sum_{j>=1} g_j(1/j-1/(j+1)),
 S_h=sum_{j>=1} g_j[(j+1)^(-h-1)-j^(-h-1)] for h>=1.
Proof: the h-th boundary term before multiplying by g_j is (-1)^(h-1) m^(-h) P_h(0)[f^(h-1)(j+1)-f^(h-1)(j)], because m is an integer and both endpoints have phase 0. Since f^(h-1)(t)=(-1)^(h-1)h! t^(-h-1), the signs cancel as shown. Integrating one extra time bounds both the (H+1)-th boundary sum and remaining integral by constants times m^(-H-1); absolute convergence follows from bounded g_j and integrability of all derivatives of f on [1,infinity). This is an asymptotic expansion for each fixed witness; no uniformity as L or its coefficients vary is asserted.

## 3. A nonzero coefficient must occur

Let j0>=1 be the first index with g_j0 !=0. Then as h tends to infinity,
 S_h=-g_j0*j0^(-h-1)+O(||g||_infty*(j0+1)^(-h-1)).
This follows by isolating the first term and telescoping the absolute upper bound for the later differences. Hence S_h is nonzero for every sufficiently large h.

For p, write its Fourier coefficients p_hat(n)=integral_0^1 p(u)exp(-2pi i n u)du. Nonconstancy implies some p_hat(n) !=0 at n>=1 (uniqueness of Fourier coefficients in L2 and real-valuedness). Let n0 be the least such positive n. For h>=2 the absolutely and uniformly convergent Fourier series of P_h gives
 P_h(0) = 2 Re sum_{n>=1} p_hat(n)/(2pi i n)^h.
Choose a parity of h for which Re(p_hat(n0)*i^(-h)) has nonzero absolute value: even h if the real part of p_hat(n0) is nonzero, otherwise odd h. Along this parity the contribution at n0 dominates the rest for sufficiently large h. Indeed the ratio of the absolute remainder to (2pi n0)^(-h) is bounded by 2||p||_1 sum_{n>n0}(n0/n)^h, tending to zero by dominated convergence with h>=2. Thus P_h(0) is nonzero at arbitrarily large h, and P_h(0)*S_h is nonzero for some h.

If the constant coefficient pbar*S_0 is nonzero we already have C_(Lm) nonzero for all sufficiently large m. Otherwise choose the first h with h! P_h(0)S_h !=0 and apply the expansion with H=h. The nonzero leading term dominates its O(m^(-h-1)) remainder. In either case the claimed universal finite descent holds.

## 4. Scope: why this does not yet yield RH

This theorem eliminates exact finite stationary points for the multiplicative search (apart from the trivial start, handled separately). Iterating it constructs a strictly decreasing sequence of full squared norms by finite admissible updates. It does NOT show that the infimum or the limit is zero. In the case where the first nonzero coefficient in the expansion has index h>=0, C_(Lm) is of order m^(-h-1) for fixed input, and the norm decrease is of order m^(-2h-1). In particular merely taking larger k can make the improvement arbitrarily small. L and the first useful correlation scale may be huge, and there is no uniform estimate in terms of the current norm alone. No strict O(N) complexity claim for finding k or evaluating the infinite weighted correlation.

An independent bound of the form sup_k C_k^2/||T_k g||^2 >= f(||r||^2) for a function f bounded away from zero on every compact positive norm interval (for the selected iteration states), or another genuinely quantitative convergence argument, would be needed. A hypothetical off-critical-line zero would supply a positive lower bound on the norm of every admissible residual, so even the proved strict finite descent is compatible with a positive limiting floor. Do not report universal convergence, a new zero-free region, a solved RH root, or an estimate of proximity to proof. The main compact reconstruction remains separate.
