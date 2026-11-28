# Geometric residual multiplication: admissible finite repair and fourth-moment descent test

28 November 2026. Continuation of e2d8abcab1a5e45cbec9575d7317c41577d99f20 (exact note retrieved). This proves a constructive approximation of the squared residual by admissible finite witnesses, without RH. It repairs the admissibility issue for a different (nonlinear) update; it does not prove norm contraction, all-scale convergence, or RH. No new numerical optimization, native Lean replay, worker/schedule changes, or claim of literature priority.

## 1. Boundary norm and periodic Dirichlet coefficients

Use the prior Mellin notation P(s)=sum_{n<=N} p_n n^(-s), with real p_n and P(1)=0, F(s)=zeta(s)P(s), R(s)=1-F(s). On s=1/2+it define the probability measure dw(t)=dt/[2pi(1/4+t^2)]. The geometric squared norm is W(P)=integral |R|^2 dw. Every finite real P with P(1)=0 can be written as sum_{n>=2} p_n(n^(-s)-1/n), so this is exactly the admissible space, not a relaxed approximation problem.

The Dirichlet coefficients a_k=sum_{n|k} p_n (with n<=N) are periodic, with period dividing lcm(1,...,N). Their mean over a period is sum p_n/n=P(1)=0. Thus their partial sums are bounded by a constant depending on the fixed P. By Abel summation, sum a_k k^(-s) converges locally uniformly for Re s>0 and equals F(s) there, since both agree in Re s>1 and the pole at 1 is removable. On the critical line the tail after M is bounded by C_P (1+|t|) M^(-1/2), with no RH assumption. In particular the finite partial sums converge to F(1/2+it) as tempered distributions in t, since Schwartz test functions absorb the linear bound.

The classical unconditional fourth moment (Ingham) integral_0^T |zeta(1/2+it)|^4 dt=O(T log^4(2T)) implies F and R belong to L^4(dw): P is bounded on the critical line, and dyadic summation gives convergence of sum_{j>=1} 2^(-j)(1+j)^4. Reference: Matthew P. Young, Annals of Mathematics 173 (2011), 1–50, introduction, equation (1.1) and preceding paragraph, https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n1-p01-p.pdf. Only the classical fourth-moment upper bound is used.

## 2. Explicit finite approximation in weighted L4

Choose a real even smooth function chi supported in [-1,1] with chi(0)=1. Use Fourier convention K(t)=(1/2pi) integral chi(v)e^(itv)dv, so K is Schwartz and integral K=1. Put K_U(t)=U K(Ut), U>=1. Convolution by K_U acts on exp(-it log k) as multiplication by chi(log k/U). From the distributional convergence above (or by applying each Schwartz translate to the bounded tail), exactly
 F_U(1/2+it)=(K_U*F)(t)=sum_{k<=exp U} a_k chi(log k/U) k^(-1/2-it).
Thus F_U is a real-coefficient finite Dirichlet polynomial, defined on the whole complex plane. This avoids truncating the conditionally convergent series without control of its high-frequency error.

For a translation by h, the ratio of the weights at t+h and t is at most C(1+|h|)^2 by elementary quadratic comparison. Consequently the L4(dw) norm of a translated f is at most C'(1+|h|)^(1/2)||f||_4. Translations are continuous at zero in this norm: approximate f by continuous compactly supported functions, which are dense in the weighted space, then use the uniform translation bound for |h|<=1. Minkowski's integral inequality gives
 ||K_U*f-f||_4 <= integral |K(v)| ||f(. - v/U)-f||_4 dv ->0
by dominated convergence with majorant C''|K(v)|(1+|v|)^(1/2)||f||_4. Thus F_U -> F in L4(dw). This is an all-frequency assertion for each fixed finite P, not an estimate uniform in P or in its length N.

## 3. The nonlinear finite admissibility repair

Define the new polynomial
 P_U(s)=P(s)(2-F_U(s)).
It has finite support in integers <=N floor(exp U) and P_U(1)=0 exactly; unlike direct dilation of an affine residual, it is admissible. Its residual R_U satisfies the exact equation
 R_U=R^2+F(F_U-F).
By Holder, ||R_U-R^2||_2 <= ||F||_4 ||F_U-F||_4 ->0.
Therefore the square of every finite admissible residual belongs to the L2 closure of the admissible affine residuals, by an explicit sequence of finite arithmetic coefficient updates. No reciprocal of zeta was used. More generally, any real affine mixture (1-lambda)R+lambda R^2 is approximated by admissible polynomials (1-lambda)P+lambda P_U.

This supplies the rigorous one-step test
 lim_U W(P_U)=integral |R|^4 dw.
Let V=R^2-R in L2(dw). If V!=0, minimizing over real lambda gives lambda*=-Re <R,V>/||V||^2 and the squared norm improvement (Re <R,V>)^2/||V||^2, with <R,V>=integral conj(R)V dw. If this improvement is positive, sufficiently large but finite U produces a strictly better witness, by the proved norm convergence. If lambda*=0 this test gives no improvement. This conclusion is conditional on the actual correlation, not an all-scale descent theorem.

## 4. The exact missing estimate

Small W=integral |R|^2 dw alone is not sufficient for integral |R|^4 dw < W. Even on a probability space a rare large value of a function can make the fourth moment arbitrarily large at fixed second moment. This observation does not assert that every such function is an admissible zeta residual; it explains why a separate bound specific to the arithmetic residual is essential. A hypothetical off-critical-line zero remains a bounded evaluation obstruction to ALL admissible residual sequences, including the nonlinear update. The new construction does not exclude it.

To prove RH using this direction would require an independent uniform descent estimate (or another proof of convergence to zero) for actual selected P, controlling their fourth moments or signed correlations under repeated updates. The constants in the weighted L4 approximation are only for fixed P, and no support/iteration bound yielding W_N=O(1/log N) has been obtained. No new computation of W or fourth moments is claimed. The O(N) sieve can calculate the underlying periodic coefficients by divisor accumulation, but the finite product/update and smoothing at length exp U are not claimed linear time. No solved root or independent RH proof.

The mathematical result is a valid nonlinear multiplication mechanism, not the sought global convergence theorem.