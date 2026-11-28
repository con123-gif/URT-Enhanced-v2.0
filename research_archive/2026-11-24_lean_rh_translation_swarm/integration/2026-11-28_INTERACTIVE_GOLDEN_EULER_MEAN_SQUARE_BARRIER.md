# Independent RH route — signed mean-square control and finite Euler-cutoff instability
28 November 2026. Continuation of e9a9a9560b3cab428879ea84c23234ef815c14cf (exact note retrieved), 85376a1faf464a3ae86bf1927a575023d361140e and earlier golden-kernel work. Scope: examine a genuine signed-stability approach, using unique factorization and the PNT. Analytic derivation, not a proof of RH, a new zero-free region, or a claim of literature priority. No numerical checks or native Lean replay claimed; no workers/schedules changed.

Use z=s+1/2, so the required right half-plane Re s>0 corresponds to Re z>1/2. Away from the removable point z=1 the algebraic inverse in the prior notes has transform z/((z-1)zeta(z)). The unresolved part is the reciprocal of zeta.

## 1. Exact signed mean-square cancellation
For a finite prime cutoff P define F_P(z)=prod_{p<=P}(1-p^(-z)). Unique factorization expands this as the finite Dirichlet polynomial sum mob(n)n^(-z) over squarefree n whose prime factors are <=P. For fixed sigma>1/2, integrate |F_P(sigma+it)|^2 over [-T,T] and divide by 2T. Off-diagonal terms tend to zero as T->infinity by the exact exponential integral sin(T log(m/n))/(T log(m/n)); diagonal terms survive. Thus
 lim_{T->infinity} (1/(2T)) integral_{-T}^T |F_P(sigma+it)|^2 dt
 = prod_{p<=P}(1+p^(-2sigma)) <= zeta(2sigma)/zeta(4sigma).
The bound is uniform in P AFTER taking the infinite-time mean. This is exact multiplicative signed cancellation and requires no RH. The corresponding identity for the natural integer cutoff sum_{n<=N}mob(n)n^(-z) has diagonal sum <= the same constant. Neither provides a bound on a fixed compact frequency interval as the arithmetic cutoff increases.

## 2. Exact failure of naive prime-cutoff pointwise stability
For every fixed z=sigma+it with 1/2<sigma<1 and t != 0, we prove
 log |F_P(z)| = -Re[P^(1-z)/((1-z)log P)] + o(P^(1-sigma)/log P).
The logarithm here is the real logarithm of a positive modulus, not a choice of complex branch. Each factor is nonzero since p^(-sigma)<1. Expand log|1-p^(-z)|=-Re sum_{j>=1}p^(-jz)/j. The j>=2 contributions converge absolutely over all primes by comparison with sum_{n>=2} n^(-2sigma), so they contribute O_z(1).
The PNT pi(x)~x/log x and partial summation give
 sum_{p<=P} p^(-z) = P^(-z)pi(P)+z integral_2^P pi(x)x^(-z-1)dx.
Replacing pi(x) by x/log x creates error o(P^(1-sigma)/log P): for every epsilon>0 bound the tail discrepancy by epsilon*x/log x and integrate its absolute value, keeping the bounded initial interval separately. Since 1-sigma>0, the elementary integral of x^(-sigma)/log x is O(P^(1-sigma)/log P). Integration by parts with derivative of x^(1-z)/(1-z) shows integral_2^P x^(-z)/log x dx=P^(1-z)/((1-z)log P)+O_z(P^(1-sigma)/(log P)^2+1). Combining the boundary term with z times the integral produces coefficient 1+z/(1-z)=1/(1-z). This proves the displayed asymptotic.
Write 1/(1-z)=r exp(i theta), r>0. Along P tending to infinity with theta-t log P congruent to 0 mod 2pi the leading real term is positive; along the opposite phase it is negative. Both subsequences exist for real cutoffs P, with magnitude P^(1-sigma)/log P diverging. Therefore
 liminf_{P->infinity}|F_P(z)|=0, limsup_{P->infinity}|F_P(z)|=infinity.
For t=0 and 1/2<sigma<1 the same formula implies F_P(sigma)->0. Real cutoffs are legitimate because the finite product is constant between consecutive primes.
Thus the global mean-square bound cannot be upgraded to pointwise stability of these actual finite prime inverses. It fails regardless of RH, not because an off-line zeta zero was exhibited. A rational prefactor z/(z-1) does not cure this at any fixed z with nonzero ordinate.

## 3. What a viable signed-energy proof would actually require
Do not replace the natural integer cutoff M_N(z)=sum_{n<=N}mob(n)n^(-z) with the unstable smooth-number cutoff F_P. For M_N the exact fixed-interval energy is
 integral_{-T}^T |M_N(sigma+it)|^2 dt
 = 2T sum_{n<=N}mob(n)^2 n^(-2sigma)
 +4 sum_{m<n<=N} mob(m)mob(n)/(mn)^sigma * sin(T log(n/m))/log(n/m).
The diagonal part is bounded uniformly in N for sigma>1/2. The second part is a signed correlation, not an unsigned norm; frequency separations can shrink to zero as N increases. No uniform local bound for it follows from the infinite-time average above.
An upper bound on this full local energy uniformly in N and sigma on every compact subinterval of (1/2,infinity) and for each fixed T>0 would suffice for RH. Indeed integrate in sigma to bound the area integral on any compact rectangle. The holomorphic mean-value inequality on small disks then bounds M_N uniformly on compact subsets of Re z>1/2. Montel gives a locally uniformly convergent subsequence with holomorphic limit F. In Re z>1 the absolute Euler series yields F=1/zeta(z). The identity theorem applied to (z-1)zeta(z)F(z)=z-1 throughout the half-plane excludes zeros of zeta there. This argument does not assume any nonvanishing to prove the limit; its local-energy premise is the missing theorem. Classical equivalence to square-root Möbius bounds is already known, not a new RH criterion claimed here.
The global cancellation is proved, and the obstruction for finite Euler-cutoff stability is proved on the actual primes, not synthetic data. The needed local signed correlations for the natural cutoff have not been established. This is a negative result for an attempted completion, not a positive measure of distance to RH.

RESUME: only pursue this route if a genuinely new bound on the natural-cutoff off-diagonal Möbius correlations is available; neither random-prime-phase averaging nor a finite Euler product may stand in for it. Otherwise retain the independent route as open and prioritize the compact reconstruction's actual unresolved arithmetic suppliers. No changes to other workers.