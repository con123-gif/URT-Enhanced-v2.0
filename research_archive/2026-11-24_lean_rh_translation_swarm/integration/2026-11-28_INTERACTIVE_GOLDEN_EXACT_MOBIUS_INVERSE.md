# Independent RH route — exact causal inverse and sharp absolute-stability obstruction
28 November 2026. Continuation of f4d07d80ea84d8249178211cfd513e8ffc913e6b (exact note retrieved). This is an actual algebraic inversion of the previously convolved prime identity, plus a rigorous limitation of absolute-norm stability. It is NOT a proof of signed inverse stability, RH, or a new zero-free region. No schedule/worker changes, no native Lean replay, no originality claim for classical Möbius inversion.

## 1. The inverse exists algebraically, without RH

Use the notation of the prior note: A=sum_{n>=1}n^(-1/2)delta_(log n), E_+ = e^(u/2)du, E_- = e^(-u/2)du, V=A*(delta_0-E_-), and centered prime measure P-E_+. All convolutions are on the nonnegative half-line. Write mob(n) for the arithmetic Möbius function, not the centered prime measure. Set B=sum_{n>=1}mob(n)n^(-1/2)delta_(log n).

By the actual divisor identity sum_{d|n}mob(d)=1_{n=1}, B*A=delta_0. The elementary identity E_+*E_-=E_+-E_- gives (delta_0+E_+)*(delta_0-E_-)=delta_0. Hence
  U = B*(delta_0+E_+)
  V*U = U*V = delta_0.
Every convolution is locally finite and associativity is valid on compact intervals. This is a genuine causal inverse, not division by zeta in a half-plane.

The inverse has the explicit measure formula
  U = sum_n mob(n)n^(-1/2)delta_(log n)
      + e^(u/2) [sum_{n<=exp u}mob(n)/n]du.
Writing X=exp u, its cumulative signed mass is exactly
  W(u)=2 sqrt(X) sum_{n<=X} mob(n)/n - sum_{n<=X} mob(n)/sqrt(n).
Derivation: integrate the continuous term and use the finite identity integral_(log n)^u e^(v/2)dv=2(sqrt X-sqrt n).

Convolving the previously established identity V*(P-E_+)=uV-V*E_- with U now gives P-E_+=U*(uV)-E_-. This is exact, including endpoints. The missing step is a uniform SIGNED bound for the contribution of U*(uV) to the existing Schwartz kernels. Algebraic inversion alone supplies no such bound.

## 2. Absolute inverse stability is impossible at the required exponent

The atomic and continuous terms of U are mutually singular. The atomic total variation on [0,log X] is sum_{n<=X}|mob(n)|/sqrt(n). For integer X, the number of nonsquarefree integers <=X is <=sum_{d=2}^{floor(sqrt X)}floor(X/d^2) <=3X/4, since sum_{d>=2}1/d^2<=1/4+integral_2^infinity dx/x^2=3/4. Hence the atomic variation alone is >=sqrt(X)/4 (using X integer, and every squarefree n<=X contributes >=1/sqrt X). This extends to real X with a harmless absolute constant for large X.

There is also a matching upper growth order without using the PNT. The same exact divisor identity gives sum_{n<=X}mob(n)floor(X/n)=1 for X>=1. Thus |sum mob(n)/n|<=1+1/X, by replacing floor(X/n) by X/n-{X/n} and bounding |mob(n)|<=1. The continuous variation is <=integral_0^u (e^(v/2)+e^(-v/2))dv=O(e^(u/2)). The atomic variation is <=sum_{n<=X}n^(-1/2)<=2sqrt X. Together:
  |U|([0,u]) = Theta(e^(u/2)).
More sharply, integral_0^infinity e^(-sigma u)d|U|(u) is finite iff sigma>1/2. Upper bound follows from the above elementary estimates. At sigma<=1/2 the atomic series sum_{squarefree n} n^(-1/2-sigma) diverges: for exponent 1, Abel partial summation with squarefree counting lower bound X/4 gives logarithmic divergence; all smaller exponents dominate that series.

Therefore an absolute total variation estimate on the inverse cannot close RH, even hypothetically assuming RH. The obstruction is intrinsic to its arithmetic atoms, not the gamma factors or the choice of golden clock. A successful inverse estimate has to use signed cancellations.

## 3. Exact relationship to the remaining arithmetic difficulty

For clarity, no growth claim for W has been proved at exponent zero. An estimate W(u)=O_epsilon(exp(epsilon u)) for every epsilon>0 would suffice for RH: integrate by parts to continue the Laplace transform of U holomorphically to Re s>0. There Vhat(s) is analytic by the prior bounded-primitive argument and Uhat(s)Vhat(s)=1 for Re s>1/2 by absolute convolution; the identity theorem then gives 1 throughout Re s>0. Thus Vhat has no zero there. Equivalently B=U*(delta_0-E_-) implies that same subexponential primitive bound for B, since convolution of W with e^(-u/2) is O_epsilon(e^(epsilon u)). Abel partial summation with e^(u/2) yields sum_{n<=X}mob(n)=O_epsilon(X^(1/2+epsilon)). This identifies precisely the signed arithmetic estimate still lacking; it does not make that estimate an assumption in a purported proof.

## 4. Actual exact control
JavaScript in this turn: smallest-prime-factor sieve through N=65536; mob(1)=1, mob(n)=0 if the smallest prime divides n/p, otherwise mob(n)=-mob(n/p); accumulate sum_{d|n}mob(d) by integer multiples. All 65536 integer inverse identities passed; 39844 squarefree values counted, no failures. This is a finite check of the implementation of the exact divisor identity, not of any RH or signed-stability bound. The algebraic proof is independent of the checks.

RESUME: the causal inverse is now completely explicit, and its absolute variation barrier is proved. Do not attempt to remove V using unsigned norm or boundedness arguments. A genuinely new signed Möbius estimate (or an independent noncircular cancellation mechanism) is still required. No such estimate has been found here. Preserve this as a partial result, and do not report an independently solved RH.