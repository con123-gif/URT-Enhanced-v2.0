# Golden O(N) energy feedback — precise strength audit and correction of the target

Continuation of c336f70dd7fd2e782fd39a58e5488d584ccccbdb and 9b48aa226562be65ddce76d4a4042cb009b63c20. The actual energy balance source was retrieved. This note proves a transfer from the golden dilation energy to the classical weak Mertens problem and identifies an unnecessarily strong proposed feedback target. It does not prove RH or an independent signed correlation bound. No workers or schedules changed; no numerical computation or native Lean execution claimed. No literature-priority claim.

## 1. Exact dilation inversion is contractive in the normalized variable

Let m(x)=sum_{n<=x} mu(n)/n, F(x)=x m(x), D(x)=F(phi*x)-F(x). Set F(x)=0 for 0<x<1, h=log(phi)>0, r=phi^(-1/2)<1, and define on the real line
 f(u)=exp(-u/2)F(exp(u)),
 g(u)=exp(-u/2)D(exp(u)).
The existing exact divisor identity gives the same D as the scan for x>=1. The extension for x<1 is solely an endpoint convention. Then g(u)=sqrt(phi) f(u+h)-f(u) exactly, so
 f(u)=sum_{j>=1} r^j g(u-jh).
For each u the sum is finite, since g(v)=0 for v<-h. Thus there is no assumption about behavior at infinity. On [0,U], U>=0, each shifted g in the sum has L2 norm bounded by the L2 norm of g on [-h,U]. By the triangle inequality in L2,
 ||f||_(L2[0,U]) <= r/(1-r) ||g||_(L2[-h,U]).
The portion [-h,0] is a fixed finite norm independent of U. This is a genuinely proved stable inverse for the DILATION, not an inverse for zeta or for the divisor measure V.

Let M(x)=sum_{n<=x} mu(n), and b(u)=exp(-u/2)M(exp(u)), extended by zero for u<0. Stieltjes partial summation gives
 M(x)=F(x)-integral_1^x m(t)dt,
 b(u)=f(u)-integral_0^u exp(-(u-v)/2)f(v)dv.
The causal convolution kernel has L1 norm 2. Young's inequality on [0,U], after truncating f to [0,U] and extending it by zero, gives ||b||_(L2[0,U])<=3||f||_(L2[0,U]). Combining these estimates:
 integral_1^X M(x)^2/x^2 dx
 <= [3r/(1-r)]^2 (C_endpoint + integral_1^X D(x)^2/x^2 dx), X>=1.
The constant C_endpoint=integral_{-h}^0 |g(u)|^2du is finite. This is an unconditional inequality for the actual arithmetic sums.

## 2. Uniform normalized dyadic energy would imply the weak Mertens conjecture

Suppose the normalized energy measured by the O(N) scan were uniformly bounded:
 integral_X^(2X) D(x)^2 dx <= C X^2 for all dyadic X>=1.
Each full or final partial dyadic interval contributes at most C to integral_1^Y D(x)^2/x^2 dx, since x>=X on that interval. Thus this integral is O(log(2Y)). The proved transfer yields
 integral_1^Y (M(x)/x)^2 dx=O(log(2Y)).
This is exactly the classical weak Mertens conjecture (WMC). Titchmarsh's results imply not only RH but also simplicity of every nontrivial zeta zero and convergence of sum_rho |rho*zeta'(rho)|^(-2). See the published discussion at https://doi.org/10.1112/blms.13092 and Odlyzko–te Riele, Disproof of the Mertens conjecture (1985), https://ir.cwi.nl/pub/1823/1823D.pdf. No claim that RH alone has been shown insufficient logically; rather, WMC has additional consequences not established by RH alone. The finite energy table cannot justify this stronger conjecture.

## 3. The proposed constant feedback bound also overshoots RH

In the actual jump law E(Y)-E(X)=A+J+C, E=D^2/x, the previous note proposed A+C<=C0 for all dyadic X and all prefixes X<=Y<=2X. Together with the proved J=O(1) per block, this would yield E(x)=O(log(2x)), hence |g(u)|=O(sqrt(1+u)). The same finite geometric inversion gives |f(u)|=O(sqrt(1+u)), and the causal convolution formula gives |b(u)|=O(sqrt(1+u)). Consequently M(x)=O(sqrt(x log(2x))).
For Re z>1 the exact identity 1/zeta(z)=z integral_1^infty M(x)x^(-z-1)dx holds. The hypothetical bound continues its right-hand side holomorphically to Re z>1/2 and gives, at z=1/2+delta+i gamma for fixed gamma, O_gamma(delta^(-3/2)) as delta decreases to zero, by the substitution u=log x and the Gamma integral. The identity theorem, after multiplication by (z-1)zeta(z), yields the reciprocal throughout that half-plane. A zero on the critical line of multiplicity >=2 would force a pole of order >=2, contradicting the bound delta^(-3/2). Thus this constant-prefix-feedback target too would imply simplicity, beyond the required location statement.

The relaxed target is sufficient: for every epsilon>0, A(X,Y)+C(X,Y)=O_epsilon(X^epsilon) as an UPPER bound for all dyadic X and prefixes. The exact J bound and dyadic telescoping yield E(x)=O_epsilon(x^epsilon) (geometric series for fixed epsilon), so D(x)=O_epsilon(x^(1/2+epsilon/2)). Stable backward dilation inversion and the formula for M transfer this to M(x)=O_epsilon(x^(1/2+epsilon/2)); the same integral continuation proves RH. Conversely, the classical RH-equivalent M(x)=O_epsilon(x^(1/2+epsilon)) implies m(x)=O_epsilon(x^(-1/2+epsilon)) via partial summation and sum mu(n)/n=0. The latter follows from convergence and the Abel limit of 1/zeta(s) as s decreases to 1. Thus E(x)=O_epsilon(x^epsilon) after adjusting epsilon and the feedback identity gives the relaxed upper bound. The epsilon version is of precisely RH strength, not a proof or known easier theorem.

## 4. Reject a local restoring-sign shortcut exactly

At t=3/phi in (1,2), q(t-)=phi/2-1, and the jump epsilon_t=mu(3)=-1. Hence the individual pre-jump correlation is 2 epsilon_t q(t-)=2-phi>0. No local rule that every jump opposes the current state can hold, even for the actual Möbius sequence. This exact counterexample is distinct from the earlier numerical rejection of monotonic dyadic energy. Do not infer a universal restoring sign from negative correlations on 17 complete scanned blocks.

## Status and next action

The O(N) scan remains useful for arithmetic diagnostics, and the proved dilation inverse clarifies exactly what its finite normalized energy can and cannot show. It has not supplied signed feedback at infinite scale. Remove the stronger constant targets from the preferred RH-only investigation unless there is a separate reason to establish zero simplicity or WMC. The remaining task is an independent bound on the epsilon-level signed feedback, not another scan or rearrangement of the same identity. No new RH root closed; the independent route remains unfinished. Preserve the main compact reconstruction and all worker schedules.