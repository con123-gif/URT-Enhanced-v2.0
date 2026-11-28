# Independent RH route — exact divisor convolution cancellation and inversion obstruction
28 November 2026. Continuation of 86ecea08a18e1a23fc46c5dabfc8581158930b37 (exact note retrieved) and ecd24ac3bed68b977e52fd74180d86e1914423ca. This uses the actual integer divisor structure rather than PNT estimates. It proves an unconditional all-orders cancellation of a convolved prime discrepancy; it does NOT prove the unconvolved limit, a zero-free region, or RH. No new literature-priority claim, no native Lean replay, no schedules or other workers changed.

## 1. Construct a signed integer measure with bounded primitive
All measures below supported on [0,infinity), convolution is additive in log coordinates (multiplication in integer coordinates). Put a=1/2 and
 A=sum_{n>=1} n^(-1/2) delta_{log n},
 P=sum_{n>=2} Lambda(n)n^(-1/2) delta_{log n},
 E_+=(exp(u/2))du, E_-=(exp(-u/2))du,
 mu=P-E_+,
 F=A*E_-=exp(-u/2)floor(exp u)du,
 V=A-F.
The measures are locally finite. F identity follows from n^(-1/2)exp(-(u-log n)/2)=exp(-u/2) for n<=exp u. By the elementary integral comparison sum_{n<=X} n^(-1/2)=2sqrt(X)+O(1), the primitive of A-E_+ is bounded. Also E_+-F=exp(-u/2){exp u}du has finite total mass <=2. Hence V([0,U]) is uniformly bounded for all U>=0. No prime number theorem or RH needed. V is a signed measure with bounded primitive, not a measure of finite total variation on the whole half-line.

## 2. Exact multiplicative cancellation
The divisor identity sum_{d|n} Lambda(d)=log n gives A*P=u A, where u A denotes multiplication of the measure by the coordinate u. Also E_+-E_- = E_+*E_- (check the elementary exponential integral); hence
 V*E_+ = A*(E_+-E_-*E_+)=A*E_-=F.
Since F*P=E_-*(u A), and u(A*E_-)=(u A)*E_-+A*(u E_-), with u E_-=E_-*E_-, it follows that
  V*P = u A - u F + F*E_- = u V + F*E_-.
Subtract V*E_+=F and use V*E_-=F-F*E_- to obtain
  BOXED: V*mu = u V - V*E_-.
Every identity is one of locally finite signed measures, so the associativity and multiplication rule require only finite total variation on compact intervals. No unverified analytic continuation or inverse Euler product is used. The same result can be checked directly at integer X through sum_{n<=X}Lambda(n)floor(X/n)=log(X!), from the prime exponents of factorial.

## 3. Unconditional limit with the ACTUAL golden kernels
Let K_k be the exact real even kernel in ecd24ac3 (not a substitute). That note proves K_k->0 in Schwartz topology. The primitive of u V is u V([0,u])-integral_0^u V([0,t])dt=O(1+u), and the primitive of V*E_- is integral_0^u exp(-t/2)V([0,u-t])dt=O(1). Thus the primitive S(u) of V*mu is O(1+u). Integration by parts, including any atom at u=0 by taking S(0-)=0, gives
  |integral_0^infty K_k(u) d(V*mu)(u)|
     <= C integral_0^infty (1+u)|K'_k(u)|du ->0.
The weighted derivative integral tends to zero by Schwartz convergence, e.g. bound it by sup (1+u)^3|K'_k(u)| times the finite integral of (1+u)^(-2). The integral itself exists absolutely for each k: the variation of the convolution on [0,u] is at most O((1+u)^C exp(u/2)) using elementary atom bounds and unit-interval summation, whereas the previous fixed-k Gaussian tail is O_k(exp(-u/sqrt(2))). Alternatively use the explicit identity uV-V*E_- directly to see this. This is an unconditional cancellation involving the actual von Mangoldt weights at ALL orders, not a finite numerical check.

## 4. Why we cannot simply cancel V
Its Laplace transform for Re s>1/2 is
  Vhat(s)=[1-1/(s+1/2)] zeta(s+1/2)
         = (s-1/2)/(s+1/2) zeta(s+1/2).
Bounded primitive extends the transform by integration by parts to Re s>0; it equals the displayed analytic function there, with removable pole at s=1/2 and value 1 at that point. An unrestricted stable inversion cannot be assumed: absence of zeros of Vhat in Re s>0 is exactly the RH right-half condition.

Precise mode-loss argument: if Vhat(s0)=0 for Re s0=sigma>0, convolve V with the locally finite complex density h(u)=exp(s0 u)du. Its convolution density at u is exp(s0 u)integral_[0,u]exp(-s0 v)dV(v). Since the full transform is zero, the integral equals minus the tail over (u,infinity). Integration by parts with bounded primitive V([0,v]) bounds that tail in modulus by C exp(-sigma u)(1+|s0|/sigma). Thus the convolution density is uniformly bounded even though h grows exponentially. Hence a bounded-primitive inverse estimate capable of recovering all such modes would itself have to exclude exactly those zeros. This is a structural reason that the new exact arithmetic cancellation cannot yet be converted to the original unconvolved criterion. No division by Vhat on the target half-plane is justified.

## 5. Actual finite exact control
JavaScript sieve computed smallest prime factors up to N=4096, then for every prime p<=4096 and every integer X=1,...,4096 checked equality of the two integer exponents
  sum_{j>=1} floor(X/p^j) = sum_{n<=X} ord_p(n).
All 2,310,144 checks passed. These test the integer identity underpinning the convolution; they are not tests of RH or of inversion. The universal divisor proof is elementary and does not rely on the finite checks. No native Lean execution.

RESUME: exploit any further specific multiplicative property of the actual V to establish an inverse estimate that does not assume nonvanishing of zeta. The present exact cancellation is not sufficient: it suppresses possible off-line modes. If no independent inversion argument is obtained, retain this as a partial result, not a completed proof; avoid accumulating redundant equivalent criteria. Main compact proof workers remain in their own lanes.