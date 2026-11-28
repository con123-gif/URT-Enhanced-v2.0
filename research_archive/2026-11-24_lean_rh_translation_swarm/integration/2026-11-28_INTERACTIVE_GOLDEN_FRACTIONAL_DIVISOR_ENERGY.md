# Independent RH route — golden-dilation cancellation of the small-divisor fractional-part block
28 November 2026. Continuation of 3af9809c0a10731fb8d7518552e1a9401bafb6d5 (exact source retrieved) and the explicit Mobius inverse 85376a1f. Partial unconditional estimate at the square-root mean-square scale, not an RH proof, new zero-free region, or claim of priority. Switch from log-ratio frequency averages to real-variable fractional-part averages of the actual Mobius inverse. No worker or schedule changes, no native Lean replay or numerical computation claimed.

## 1. Exact arithmetic and one dilation
Let m(x)=sum_{n<=x} mu(n)/n and S(x)=sum_{n<=x} mu(n){x/n}, x>=1, where braces denote fractional part. The exact divisor identity gives S(x)=x m(x)-1. Put D(x)=S(phi x)-S(x), phi=(1+sqrt(5))/2.
It suffices for RH to establish, for every epsilon>0,
  integral_X^(2X) |D(x)|^2 dx = O_epsilon(X^(2+epsilon)).
Proof: Cauchy-Schwarz on dyadic intervals then gives absolute convergence of integral_1^infty D(x)x^(-s-1)dx for Re s>1/2, locally uniform there (choose epsilon<2Re s-1 on each compact set). For Re s>1,
 integral S(x)x^(-s-1)dx = 1/((s-1) zeta(s))-1/s,
by absolute interchange of the Mobius Dirichlet series. Changing variable in the dilated term gives
 integral D(x)x^(-s-1)dx = (phi^s-1)[1/((s-1)zeta(s))-1/s] - phi^s integral_1^phi S(x)x^(-s-1)dx.
The finite-interval term is entire. The factor phi^s-1 is nonzero in Re s>0. Consequently the assumed bound provides a holomorphic continuation of 1/((s-1)zeta(s)) to Re s>1/2, which is an inverse of the holomorphic function (s-1)zeta(s) by the identity theorem. This excludes zeros there, and symmetry yields RH. This is a sufficient criterion using a classical Mobius identity; no claim that the dilation or criterion is new. The classical full Mobius summatory bound is well known. The next section is the actual unconditional cancellation estimate, not an assumption of the criterion.

## 2. Prove the low-denominator block bound
For any finite real coefficients a_n with |a_n|<=1 and integer Y>=1 define
 P_Y(x)=sum_{n<=Y} a_n ({x/n}-1/2).
At noninteger arguments the sawtooth has Fourier series -sum_{h!=0} exp(2pi i h x/n)/(2pi i h), with convergence also in local L2; its midpoint value at jumps is irrelevant to the integral.
Group equal frequencies h/n=A/B in reduced form (B>=1, A a nonzero integer, gcd(|A|,B)=1). Their coefficient is
 c_(A,B)=-1/(2pi i A) sum_{d<=Y/B} a_(Bd)/d.
In particular |c_(A,B)| <= [1+log(Y/B)]/(2pi |A|).
Summing squares over all A!=0 and B<=Y gives O(Y), since sum_A A^-2<infty and sum_{B<=Y}(1+log(Y/B))^2=O(Y) by the integral test (the first term also O(Y)). No statistical independence or Mobius cancellation assumption is used.
Distinct reduced frequencies have spacing >=1/Y^2. For a finite frequency truncation, majorize the indicator of [X,2X] by e^(1/4) exp(-(x-3X/2)^2/L^2), L=max(X,Y^2). Gaussian integration gives
 integral_X^(2X) |sum c_lambda exp(2pi i lambda x)|^2 dx
 <= C L sum_(lambda,eta) |c_lambda c_eta| exp(-pi^2 L^2(lambda-eta)^2).
For each lambda the row sum of the Gaussian matrix is <= 1+2 sum_{j>=1} exp(-pi^2 j^2), by spacing and L>=Y^2. The inequality 2|c_lambda c_eta|<=|c_lambda|^2+|c_eta|^2 yields an upper bound C L sum |c_lambda|^2. This is an elementary continuous large-sieve argument, compatible with Montgomery-Vaughan mean-value estimates; no sharp constant claimed.
To pass to the full sawtooth, truncate common frequency |lambda|<=R; for each fixed n<=Y this corresponds to a symmetric harmonic truncation at floor(R n) and converges in L2 on any finite interval. Finite n-sum convergence and the uniform squared coefficient bound give the exact all-harmonic inequality
  integral_X^(2X) |P_Y(x)|^2 dx <= C (X+Y^2)Y.

## 3. Use the golden dilation to cancel the unknown constant
Take a_n=mu(n), Y=floor(X^(2/3))<=X for X>=1. In D(x), the portion n<=Y appears at both scales and equals P_Y(phi x)-P_Y(x); the unknown constant (1/2)sum_{n<=Y}mu(n) cancels exactly.
By change of variable and the proven estimate on [phi X,2phi X] and [X,2X],
 integral_X^(2X) |sum_{n<=Y}mu(n)({phi x/n}-{x/n})|^2 dx
 <= C_phi (X+Y^2)Y = O(X^2).
This controls the entire small-divisor block at the sufficient mean-square scale WITHOUT RH, including common rational frequencies. In fact the same result works for any fixed dilation >1; phi is not shown necessary.

## 4. Remaining large-divisor block (unproved)
The exact remaining part is
 R_Y(x)=sum_{Y<n<=phi x} mu(n){phi x/n} - sum_{Y<n<=x}mu(n){x/n}.
If integral_X^(2X)|R_Y(x)|^2 dx = O_epsilon(X^(2+epsilon)) for every epsilon>0, the preceding block estimate and the first section would finish RH. This estimate has NOT been derived. The large-sieve bound for all denominators of order X gives O(X^3), not O(X^(2+epsilon)). Known cancellation of Mobius over long/short intervals or the prime number theorem does not give the missing square-root bound. Sources checked include Matomaki's exposition On primes, almost primes, and the Mobius function in short intervals (2021 ECM, section 4), and Matomaki–Teravainen, On the Mobius function in all short intervals, https://ora.ox.ac.uk/objects/uuid%3Aecbfc55c-4210-4b04-8c9a-3dddc01db576/files/spk02cb24r, Theorem 1.1. Their log-saving short-interval estimate is not a square-root estimate. Montgomery–Vaughan mean-value reference https://people.math.harvard.edu/~elkies/M229.22/kmv.pdf (the Gaussian proof above is self-contained).
For u near X and n>Y the quotient floor(u/n) is <=O(X^(1/3)); grouping by quotient may expose further cancellation, but exact divisor identities by themselves do not bound the remaining block. Do not claim a solved RH step from the size of the small-divisor cutoff, which is a scale threshold, not a fraction of the proof. No change to main compact reconstruction, no new solved theorem beyond the local partial estimate.

RESUME: either obtain an independent signed mean-square estimate for the large-denominator block or retain this as incomplete. Do not substitute another equivalent criterion for that missing estimate.