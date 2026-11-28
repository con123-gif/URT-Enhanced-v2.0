# Golden anchored Hankel — explicit prime-side heat bridge and finite-difference criterion
28 November 2026. Conditional equivalences and numerical checks only; no RH closure. Continuation of 5e780eaf9da4189cb6b90928188246ef175aff87. Prior literature: Polson and Sokolov, Computing the Riemann Hypothesis, https://vsokolov.org/books/computing_rh/ (heat trace complete monotonicity and Thorin/GGC criteria; the present heat criterion is not claimed new). No worker or schedule changes.

Write a=5/4=(phi-1/2)^2, lambda_j=-(rho_j-1/2)^2, one representative per reflection pair with multiplicity, and h(t)=sum_j exp(-t lambda_j), t>0. The critical-strip bound and classical zero counting ensure absolute convergence and real h by conjugation. For p>1/4,
 R(p)=xi'(1/2+sqrt(p))/(2 sqrt(p) xi(1/2+sqrt(p)))=sum_j 1/(p+lambda_j)=integral_0^infty e^(-pt) h(t) dt.
This is the genus-zero product from the previous note, not a use of RH. Absolute interchange follows from sum 1/(p+Re lambda_j)<infty. The golden moments m_k=1/(k-1)! integral t^(k-1)e^(-at) h(t) dt.

## Exact prime-side formula
Logarithmic differentiation at s=1/2+sqrt(p)>1 gives
 xi'/xi(s)=1/s+1/(s-1)-log(pi)/2+psi(s/2)/2-sum_{n>=2} Lambda(n)n^(-s).
Use psi(z)=-EulerGamma+integral_0^infty [e^-u-e^(-zu)]/(1-e^-u)du, and the Gaussian Laplace identity integral_0^infty e^(-pt) exp(-v^2/(4t))/sqrt(pi*t) dt = exp(-v sqrt(p))/sqrt(p).
Thus
 h(t)=exp(t/4) - (log(pi)+EulerGamma)/(4 sqrt(pi*t))
    + 1/(4 sqrt(pi*t)) integral_0^infty [exp(-u)-exp(-u/4-u^2/(16t))]/(1-exp(-u)) du
    - 1/(2 sqrt(pi*t)) sum_{n>=2} Lambda(n)/sqrt(n) exp(-log(n)^2/(4t)).
The gamma-integral difference is integrable at zero (limit -3/4). To exchange integrals, use the triangle inequality with cancellation at zero: the integral in t of the absolute difference of the two Gaussian Laplace kernels is bounded by splitting the difference at exp(-u/4) times the constant kernel; each resulting difference is of fixed sign and integrates to O(u) as u approaches 0. At infinity the resulting Laplace-transformed terms decay exponentially. The prime term is nonnegative before subtraction, so Tonelli applies for p>1/4 via the convergent Euler series. Uniqueness of Laplace transforms of continuous functions gives the formula. This is a form of the classical Gaussian explicit formula, not a claim of novel prime mathematics.

## Why positivity of h is not enough
Synthetic reflection-symmetric spectrum with ordinates 14 and 30, off-line displacement +/-1/4 at 30. Its h(t)=exp(-196t)+2exp(-(900-1/16)t) cos(15t). For t>=1/1000 the first term exceeds the amplitude of the other two, since (704-1/16)/1000>log 2. For 0<t<1/1000 the cosine is positive. Thus h(t)>0 for every t despite complex lambda. Also the pointwise Hankel integrand from the golden moment formula has leading 2x2 determinant t^2/2-t^2=-t^2/2, so simply integrating a positive heat trace does NOT automatically give a Gram matrix. The complete-monotonicity or all-order Hankel obligation is essential.

## Exact two-clock finite-difference criterion (golden ratio as incommensurate clock)
For h-step d>0 define S_n(d)=h((n+1)d), n>=0. Claim RH iff for d=1 and d=phi, all Hausdorff differences (-1)^k Delta^k S_n(d)>=0 (every n,k>=0).
Forward: under RH, lambda_j>0, hence S_n=sum_j x_j^(n+1) with x_j=exp(-d lambda_j) in (0,1), giving each difference sum_j x_j^(n+1)(1-x_j)^k>=0.
Converse: Hausdorff's theorem gives a finite positive measure on [0,1] for each clock. Its moment generating function integral 1/(1-zx)dnu(x) is analytic off [1,infty). The same germ is sum_j x_j/(1-zx_j), since sum_j |x_j|<infty. This series extends meromorphically to C by uniform convergence on compact sets away from poles; x_j->0, poles at 1/x_j, and repeated nodes contribute equal residues -1 each, so none cancel. Therefore each x_j in (0,1] for each clock. In particular d Im(lambda_j) in 2pi Z for d=1 and phi. Irrationality of phi forces Im(lambda_j)=0, hence Re rho_j=1/2 (nonreal rho_j). This is a discrete alternative to complete monotonicity; it avoids differentiation but is an equivalent unproved infinite family. Any two positive irrationally related clocks work; no uniquely golden mechanism has been demonstrated.

## Actual executed checks
CPython mpmath at 80 digits reproduced all six ordinary and six shifted leading determinant signs and values from the earlier 100-digit run. SciPy quad (epsabs=epsrel=1e-12, u from 0 to 60), sympy primerange through 100000 including all prime powers through that cutoff, and the first 25 numerical mpmath zeta zeros at 25 digits provided the following approximate heat cross-check:
t, explicit prime-gamma heat, first 25 zeros heat
0.001 3.70458490912 3.70400989985 (truncation visible)
0.003 1.09522012145 1.09522012144
0.010 0.149698011254 0.149698011254
0.020 0.0185412917313 0.0185412917313
0.040 0.000338307276974 0.000338307276974
The latter three agree within 2.2e-16 absolute error in double precision. Not certified error bounds or proof of RH; only the numerical verification of explicit formula at these scales. The 0.001 discrepancy is consistent with missing high ordinates. The underlying explicit formula and two-clock proof are analytic derivations, not inferred from tests.
RESUME: to obtain unconditional RH from this route, prove every Hausdorff difference on both clocks directly from the prime-side formula, including arbitrarily high order; do not infer this from a positive h, a finite matrix, or finite numerical samples. Existing compact arithmetic route remains preferred for actual missing root obligations. No native Lean replay.