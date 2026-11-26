# RH from the compact proof: human reconstruction
26 November 2026 — first working manuscript, INCOMPLETE. This is a translation of the externally machine-checked compact RH/GRH proof, not an independent proof or a completed ten-page paper. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude per the compact repository. Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Original long-archive manuscript retained separately. Mission blob 3731f12ed73e738313fd7f93a30759d9086141e9.

The following gives the exact compact scalar argument and translates the central mechanisms of A/B/C, with the deep native input theorems explicitly separated. A proof body in the source is not by itself our human proof of it. No compact Lean build performed in this session.

## 1. The central inequality

Fix Parameters P and admissible Data D as in the compact source. Write x,x1,b,a for scales, m for number of lifts, k for column rank, f for the number of archimedean places, and d_R=dim_C(rows)>0. Distinguish d_R from the quadratic-field prime d. Let
  B = f a (log b)^3,
  L = (log b) B,
  H = m k dirCost,
  R = remainder.
Use the exact source definitions of mainHeight, mainAsk and remainder. The central theorem is
  [star] m R <= (log b)^2 B.
It is proved by comparing upper and lower volume bounds for the SAME independent family of rows, at the SAME D and all the required embeddings/twists. No independent optimization of either bound.

## 2. Theorem A: short forms — normalization and height arithmetic

Let T be the actual finite set of non-split primes plus the level prime N. For a prime l put g_l=floor(allowedLoss(l) - 1_{non-split}(l) gain(l)), zero off T. A single rational number q=prod_{l in T} l^{g_l}>0 satisfies log q=sum g_l log l and |q|_l=l^{-g_l}. This simultaneously controls the size at infinity and the local divisibility at all primes; there is no independent local choice of q. For the native projected Poincare maps P_s, put B_s=q P_s. These are exactly the maps chosen in Data.short_forms.

The source's height computation has a separate simple cancellation. Write wbar=mean log(nominalWeight), G=log(gProd rootDisc/(2pi)), and ell=chowlaSelbergConst. The definition of mainAsk is a(log a-1-ell-wbar). The source jet-size formula and Stirling give
  jetSize(a)-mainAsk <= a(wbar+G)+1+(log a)/2.
The level-prime choice gives
  log N >= m(wbar+G) - G -(15/2)log b.
The exact heightPerRow identity is
  heightPerRow = H-mR + #tops [m(jetSize(a)-mainAsk)-a log N].
Substitute both inequalities BEFORE bounding terms. The common m a(wbar+G) cancels. Hence
  heightPerRow <= H-mR + #tops [m(1+(log a)/2)+a(G+(15/2)log b)]
              <= H-mR+B,
where the last inequality is the native HasLogBound scale estimate.

The deep remaining A inputs are the native seesaw identity, spanning by short ramified columns, the norm estimate of the composite lift, the uniform local index-divisibility supplier exists_indexDvd_Bmu_divisible, and sum_allowedLoss_mul_log_le, together with their precise prime/twist and scale guards. Given these, rational normalization and summing the local index bounds give the native A output:
- a spanning set S of integral ramified columns, such that ||Theta_1 B_s phi||_sigma^2 <= exp(h), h=H-mR+L, for all phi in S, s and sigma;
- any finite row family in the images of integral ramified columns under B_s for s in t has IndexLe at most |t| dim(columns) B.
The local bound supplies the needed integer exponent because -g_l=ceil(1_{non-split} gain-allowedLoss), strictly below that quantity plus 1. All twist-coprimality conditions in IndexLe remain. This paragraph is the native A assembly, not yet a human derivation of its deep inputs.

## 3. Theorem B: enough forms — direct rank-deficit proof of the greedy lemma

Here is a compact human derivation of the actual abstract exists_few_translates from New/Heights/OneDeterminant. Let V,W be the finite-dimensional column and row spaces, v=dim V>0, d_R=dim W>0, and let B_s:V->W satisfy IsSpread(B,eta), eta=b^{-2}>0: for every subspace F of W, some s satisfies
  dim B_s^{-1}(F) <= [(1+dim F/d_R)/2+eta]v.
The native filling theorem gives exactly this property on the full column space using its ramifying operator; its maps have the same ranges as the projected Poincare maps on ramified columns (surjectivity onto ramified columns must be kept). Nonzero scalar normalization q does not change those ranges.

For a selected set t let F_t=sum_{s in t} range B_s and r=d_R-dim F_t. By rank-nullity for V -> W/F_t, if r>4eta d_R there exists s whose new dimension g satisfies
  g >= v(r/(2d_R)-eta)>0.
Thus s was not already selected and r drops to r-g. Define a nonnegative potential
  P(r)=5 d_R log(1+r/(eta d_R)).
For r>4eta d_R,
  P(r)-P(r-g) >= 5 d_R g/(eta d_R+r)
                >= v * 5(r/2-eta d_R)/(r+eta d_R) >= v.
The first inequality is log(1-u)<=-u applied to u=g/(r+eta d_R)<1. The last follows from 3r/2>=6eta d_R. Start at r=d_R, and select such s until r<=4eta d_R; termination follows because r is a nonnegative integer strictly decreasing. If the starting r already meets the threshold choose t empty. Telescoping proves
  |t| v <= 5 d_R log(1+eta^{-1}),
  dim F_t >= (1-4eta)d_R.
No basis or translate multiplicity is counted twice. This is an elementary human proof of the native constant 5 and deficit 4, not a new asymptotic estimate. For W=0 the native abstract lemma is immediate with empty t; actual B uses positive d_R.

The actual missing B supplier is Data.ramifiedColumns_fill_rows, whose body invokes Fits.exists_translate_finrank_comap_le, Petersson second moment, central projection, bad_share_le and ramifyingOp_finrank_comap_and_short. Its positivity proof also gives finrank_rows_ne_zero. Translate these actual named inputs rather than assume that the Poincare family spans or is a tight frame without the native error. FillingTheorem.lean is already retrieved; its deeper moment and local rank proofs still require human reconstruction.

## 4. A and B use one family; Theorem C uses one reciprocal identity

Since S spans the ramified columns, Y=union_{s in t} B_s(S) spans F_t. Choose an independent basis y of F_t from Y. Let n=|y|. Then (1-4/b²)d_R<=n<=d_R. A applies to this SAME y and t, giving some delta<=5 d_R log(1+b²)B with IndexLe(y,delta). For each sigma Hadamard's Gram determinant inequality gives covolumeSq(Theta_1 y)_sigma<=exp(n h), since every squared norm is <=exp(h). Thus take V=n h. This is the full finite-dimensional A+B assembly; it does not assume a full basis or use a different family for the lower bound.

C starts with ANY independent such y, IndexLe(y,delta), and all-conjugate squared-covolume bound exp(V). The source picks ONE fit-twist family theta indexed by p-adic embeddings. For its nonzero chain volumes z(theta) and z(1), the two source height estimates are
  HeightLe(V+2delta+d_R b, z(theta)/z(1)),
  HeightLe(2d_R(2L-H), z(1)^2/z(theta)^2).
They are not conventional nonnegative heights: native HeightLe allows signed upper budgets for embedding-dependent families. Its product rule holds by multiplying the same auxiliary numbers, adding archimedean exponents and adding finite-prime bounds. The product formula gives HeightLe(c,1) => c>=0. For the latter, the archimedean and p-adic bounds for the auxiliary nonzero number A imply the corresponding bounds for log absolute norm divided by the field degree, via all conjugate embeddings; sum the logarithmic rational product formula over a sufficiently large prime cutoff. The needed algebraicity of A and extension-of-embedding facts are from the actual HeightLe.nonneg body and remain referenced prerequisites.

Square the first ratio and multiply by the second ratio pointwise on the SAME theta:
  (z(theta)/z(1))^2 [z(1)^2/z(theta)^2]=1.
Therefore
  0 <= 2(V+2delta+d_R b)+2d_R(2L-H),
so V+2delta >= d_R(H-2L-b) >= d_R(H-3L), since b<=L by the retained size estimates. This proves the exact C scalar consequence from those two height inputs, with no absolute-value expansion of the reciprocal ratios.

The first height estimate uses a completion of y to a full basis by crude rows, the actual OneDeterminant theorem and the index matrices at conjugate p-adic embeddings. The Gram determinant identity det(Mbar G M^T)=det(Mbar)det(G)det(M) explains the two index contributions; the auxiliary rows cost d_R b in the source. Need reconstruct crude_rows, their size and integral pairing/denominator guards. The second height estimate uses the exact chain factorization z(v)=|c(v)|^{d_R} prod_j liftVolume(v,j), the fit family, and the individual lift ratio estimate HeightLe(d_R k[(log b)B0-dirCost],lambda_j(1)/lambda_j(theta)). Here m k B0=B. Sum over m lifts and square to obtain 2d_R(L-H); the constant ratio contributes at most 2d_R L. This gives the stated second bound. The deep remaining C suppliers are exists_isFitFamily (Selmer and Galois), volume_iota_eq_prod_liftVolume, heightLe_liftVolume_ratio (comparison operator, Hecke values, integral and archimedean determinant bounds), and the completion cost. They must be supplied for the identical D and theta; no independent optimizations. Actual source bodies of the immediate C estimates were read, but no native replay or full human reconstruction of these deep suppliers.

## 5. The common main term cancels

Use the crude bound |H|+m|R|<=b² x^99 from native abs_mainHeight_add_remainder_le and L>=0, hence -h<=b² x^99. Apply C to the y of §4 and V=n h:
  d_R(H-3L)<= n h +2delta
    = d_R h+(d_R-n)(-h)+2delta
    <= d_R[h+4x^99+10 log(1+b²)B].
The missing dimension term uses 0<=d_R-n<=4d_R/b²; signs matter if h is negative. Divide by d_R>0 and substitute h=H-mR+L. H cancels:
  mR <= 4L+4x^99+10log(1+b²)B <= (log b)^2 B.
Last inequality is native HasLogBound, not an arbitrary numerical assumption. This is the exact compact star_inequality. No conditional deep input has been deleted.

## 6. From star to RH: keep the compact route, not the old G window

For the compact R_M(x)=primeError(d,M,x), lambda_M(n)=Lambda(n)(1-chi_d(n)) when n=1 mod M and zero otherwise. R_M(x)=sum_{n<=x}lambda_M(n)(1/n-1/x)-log x/phi(M)-Re logDerivMean(d,M,1). The actual prime-sum identity is
  R=a[#thick(R_N0(x)-R_N0(x1))+#tops R_1(x1)].
Each top translation contributes all thick places when the class condition holds, none otherwise. The main log x/log x1 and Chowla-Selberg constants cancel by the actual nominal-weight average and f=phi(N0)#tops. See remainder_eq. This is not the old G(x)/x.

For fixed P and 0<epsilon<1/100, exists_data gives D at every sufficiently large x with log b=x^epsilon, log x1=x^(epsilon/6), (10^6 log x)^2<=log x1, #thick>=#tops/log b and m>=sqrt x. Let t=10^6 log x. The actual IsPolar.exists_window_sub_mul_le supplies u in [t,t²] with
  R_N0(exp u) - (#tops/#thick) R_1(exp u)<=exp(-t)
because the ratio is nonnegative and at most exp(t). The native D' changes only logX1 to u and proves its scale condition, preserving the other data. Apply star on D':
  R_N0(x)<= f(log b)^5/(m #thick)+x^(-10^6)
          <= phi(N0) x^(6epsilon-1/2)+x^(-10^6)
          <= x^(8epsilon-1/2) eventually.
Here the eventual threshold may depend on P and epsilon. All scales and their existence are retained; no intersection of sparse windows is taken.

The native analytic criterion uses the polar Laplace transform of R_M(exp v) and its residue at s, given by (sum_xi [ord_s Ltilde(xi)-ord_s Ltilde(xi chi_d)])/[phi(M)s(1-s)]. It selects a prime d in the specified unit class whose quadratic twists do not vanish at the relevant ordinate, then applies its Landau lemma. At modulus q lift to N0=18480 q and class N0/2-1; for a hypothetical zero with Re rho>1/2 choose epsilon=(min(Re rho,1)-1/2)/51, so 0<epsilon<1/100 and 1/2+8epsilon<Re rho. This leads to New.grh and, at modulus 1, the functional equation gives RH. The compact analytic suppliers (polar identity, nonvanishing twist, good second scale, Landau and DataExist) are not independently fully derived here; they are explicit required modules for the editor and analytic lane. Do not claim our earlier old-pin conditional Landau replay verifies these compact declarations.

## 6a. Direct second-scale elimination by the classical fixed-modulus prime number theorem (interactive)

This is a human-proof shortcut replacing the special high-moment selection of the second scale, not a new RH criterion. Keep P=(N0,d,...) FIXED while x grows, as in exists_data. We use the unconditional classical prime number theorem for each fixed progression (e.g. Davenport, Multiplicative Number Theory, ch. 20; Montgomery–Vaughan, Multiplicative Number Theory I, ch. 11; explicit form in A. Strömbergsson, analytic number theory notes, Thm 15.1, https://www2.math.uu.se/~ast10761/analtalt08/www_notes.pdf). For fixed modulus Q and unit residue class a it gives psi(y;Q,a)=y/phi(Q)+O_Q(y exp(-c_Q sqrt(log y))) for some c_Q>0. A possible exceptional real zero beta_Q<1 contributes O_Q(y^beta_Q), absorbed in this estimate for fixed Q. No RH/GRH hypothesis and no uniformity in growing moduli is required. The theorem is a conventional external cited result for the human proof; this shortcut has not been replayed in compact Lean.

Fix either M=N0 or M=1 and put Q=Md, coprime M,d. Let lambda_M(n) denote the actual weighted Mangoldt function of PrimeError, and A_M(y)=sum_{n<=y}lambda_M(n). Split into the reduced classes mod Q. The nonzero character chi_d sums to zero over units modulo d; CRT gives sum_{a mod Q, (a,Q)=1, a=1 mod M}(1-chi_d(a))=phi(d). The nonunit terms occur only at powers of the finitely many primes dividing Q and contribute O_Q(log y) (and M divisors are excluded by the class condition). Thus the fixed-modulus theorem yields A_M(y)=y/phi(M)+E_M(y), with |E_M(y)|<=C y exp(-c sqrt(log y)) for y>=2; enlarge C on [1,2]. All constants may depend on the fixed P. The same c can be used for M=1,N0 by taking their minimum.

The exact ramp sum is
  sum_{n<=y}lambda_M(n)(1/n-1/y)=integral_1^y A_M(v)/v² dv.
This follows by integrating each summand over v>=n (lambda_M(1)=0). Therefore the ramp minus log y/phi(M) tends to K_M=integral_1^infty E_M(v)/v² dv. Identify this constant, rather than silently choose a new normalization. For real s>1, by absolute convergence and the character Euler products used in native PrimeError,
  F_M(s)=sum_{n>=1}lambda_M(n)n^-s
        = [1/(s-1)+sum_xi(logDeriv(entireL(quadTwist xi d))(s)-logDeriv(entireL(xi))(s))]/phi(M)
        = s/[phi(M)(s-1)]+logDerivMean(d,M,s).
Partial summation also gives
  F_M(s)=s integral_1^infty A_M(v)v^(-s-1)dv
        = s/[phi(M)(s-1)]+s integral_1^infty E_M(v)v^(-s-1)dv.
Subtract the same singular term and take s down to 1. Dominated convergence follows from the integrable exponential-square-root bound; entireL for the principal character is regularized by (s-1), and every relevant entireL is nonzero at 1 (native PolarLandau.entireL_ne_zero). Hence K_M=Re logDerivMean(d,M,1), the exact native normalization. In particular
  R_M(y)= -integral_y^infty E_M(v)/v² dv,
  |R_M(y)|<= 2 C (sqrt(log y)/c+1/c²) exp(-c sqrt(log y)),
using u=sqrt(log v), dv/v=2u du. This proves the claimed error without any unknown constant offset.

Now use the ORIGINAL D supplied by exists_data, NOT D' with logX1 replaced. It has log x1=x^(epsilon/6), log b=x^epsilon, #tops/#thick<=log b=x^epsilon, m>=sqrt x. Apply star and the exact remainder_eq to this D:
  R_N0(x)<= f(log b)^5/(m #thick)+R_N0(x1)-(#tops/#thick)R_1(x1)
         <= phi(N0) x^(6epsilon-1/2)+(1+x^epsilon) O_P((1+x^(epsilon/12)) exp(-c x^(epsilon/12))).
For every fixed epsilon>0, the final term is O_P,epsilon(x^-A) for every fixed A>0 (x^(epsilon/12)/log x tends to infinity). Take A=1, absorb the fixed phi(N0) and error into x^(2epsilon), and recover exactly the native eventual bound R_N0(x)<=x^(8epsilon-1/2).

This removes the need, in the human proof, to reconstruct IsPolar.eventually_moment_le, IsPolar.exists_window_sub_mul_le, the special D' scale substitution, or its quantitative moment machinery. It does NOT remove the polar Mellin identity for the final Landau criterion, the zero-density/nonvanishing quadratic-twist theorem, DataExist, or A/B/C. The classical fixed-modulus theorem is unconditional and does not depend on the RH being proved. The order of quantifiers is essential: fix P before x→∞, including d; do not apply this argument if d or N0 is allowed to grow with x. The peer RUN50 fixed-modulus reduction (284991cdd00955a2c72a6421a0ae5bc25eba1b20) is compatible; the peer linear-log window (3e627c9ba1a8367044293f16015bde7e656ba0da) is a fallback rather than needed for this human route. No claim of a new general PNT theorem.

Source anchors compact pin: New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2; New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3; Lib/Analytic/Landau/PolarLandau.lean 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9; Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11; original New/Main and DataExist as above. Standard PNT source checked via public theorem text. No native replay, no whole proof closure. For editor: use this short subsection in place of the special second-scale paragraph in final manuscript; preserve original path as formal fallback. Landau and prime-window workers should proceed to actual residue/zero-density and remaining data arguments, not further optimize the second-scale window.

## 6b. Complete human analytic endgame from the native star bound and data existence

26 November 2026, interactive derivation. This section replaces the analytic gaps listed in the previous draft: exact polar transform, quadratic-twist nonvanishing selection and Landau implication. It uses conventional Pólya–Vinogradov, Poisson summation for a primitive Dirichlet character, Hadamard three-lines, the classical fixed-modulus PNT and the standard analytic continuation/functional equation of Dirichlet L-functions. These are unconditional classical theorems; no RH/GRH premise. The deep compact geometric star inequality and admissible data existence remain necessary. The derivation follows the actual compact source, with the fixed-modulus PNT shortcut of §6a; no claim of independently compiling it.

### Weighted Mellin transform and residue

For fixed M,d in §6a put a_M=1/phi(M), K_M=Re logDerivMean(d,M,1), F_M(s)=sum lambda_M(n)n^-s. In Re s>1, Euler products give F_M(s)=s a_M/(s-1)+logDerivMean(d,M,s), with the same entireL regularization as the compact source. For Re s>2, absolute convergence permits integration term by term:
  integral_n^infinity (1/n-1/x)x^-s dx
       = n^-s/[s(s-1)].
Thus the transform of R_M is
  Phi_M(s)=integral_1^infinity R_M(x)x^-s dx
       = [logDerivMean(d,M,s)/s-K_M]/(s-1).
In logarithmic coordinates x=exp v this is exactly integral_0^infinity R_M(exp v) exp((1-s)v)dv. The expression on the right is meromorphic. The sum defining logDerivMean is real at real s>1 by conjugate pairing of characters (the twisting character is real), hence is real at 1 by continuity. All entireL are nonzero at 1, so the apparent pole at 1 is removable. At any rho with Re rho>0 and rho!=1, the logarithmic derivatives have simple poles, with residue the zero order. Therefore
  Res_rho Phi_M =
    [sum_xi ord_rho entireL(xi)-sum_xi ord_rho entireL(xi chi_d)]
       /[phi(M) rho(1-rho)].
EntireL denotes (s-1)L(s,xi) for principal xi and L(s,xi) otherwise. All relevant poles are at most simple. The classical zero-free line Re s>=1 (after principal regularization) holds unconditionally; no claim of zero-free critical strip. This proves the native IsPolar facts actually needed, with the crude O(exp v) bound coming from 0<=lambda(n)<=2n (or the sharper §6a).

### Quadratic-twist selection: short derivation of the actual density input

Fix a character xi modulo M, induced from primitive psi of conductor h|M, and fix eta>0 and height Y>=0. For primes d=7 mod 8, d prime to M, the twist psi*(./d) is primitive of conductor q=hd (CRT of coprime primitive factors) and nonprincipal. Its parity j in {0,1} depends only on psi, since (−1/d)=−1. The imprimitive twist xi*(./d) differs from this primitive L-function by finitely many Euler factors nonzero when Re s>0. Quadratic reciprocity, including (2/d)=1, gives (n/d)=J(−d|n), where J is the native Jacobi symbol with the principal-character convention at 2; for odd d this agrees at 2. This is the exact convention in native ZeroFreeTwist.

For g_j(u)=u^j exp(−pi u²), and |c(n)|<=1, define theta_{c,v}(t)=sum_{n>=1} c(n)J(−v|n)g_j(nt), and I_{c,v}(T)=integral_(1/T)^infinity |theta_{c,v}(t)| dt/sqrt(t). We show, for X<=T² and t>=1/T>0,
  sum_{v<=X}|theta_{c,v}(t)|² <= C_eta T² t^(-1-2eta).
Expand the square (absolute convergence of the Gaussian series) and combine the Jacobi symbols into J(−v|nm). For pairs for which knm is square for k=1 or 2, use the trivial bound X on the sum over v and |g_j(nt)|<=C_eta (nt)^(-1/2-eta). In this square sector write kn=a b², m=a u², a squarefree, b,u positive. The product of the majorants sums to at most a constant times
  t^(-1-2eta) sum_{k=1,2} k^(1/2+eta)
    sum_{a,b,u>=1} (abu)^(-1-2eta),
which converges. (Dropping squarefree and divisibility restrictions only enlarges the positive sum.) For every other pair, the Jacobi symbol as a character of v is nonprincipal: some odd prime in nm has odd valuation. Pólya–Vinogradov for the possibly imprimitive character bounds the sum over v by 2 sqrt(nm)(1+log(nm)), as in the native lemma. With |g_j(nt)|<=C_eta (nt)^(-3/2-eta), the remaining double sum is bounded by a constant times t^(-3-2eta) times sum_{n,m}(nm)^(-1-eta)(1+log(nm)), finite. Since t^-2<=T², this proves the displayed estimate uniformly in c. The Gaussian bounds follow because u^A g_j(u) is bounded for every A>0.

Cauchy–Schwarz in v and integration give
  sum_{v<=X} I_{c,v}(T) <= C_eta T² integral_(1/T)^infinity t^(-1-eta)dt
                           = O_eta(T^(2+eta)).
Use this for c=psi and c=mu*psi; both have modulus<=1. This is the native sum_thetaTailIntegral_le in human form.

Now let chi be any primitive nonprincipal character of parity j, conductor q<=T², and suppose the sum of its two tails (with coefficients chi and mu*chi) is <=T^(2eta). Define the theta functions theta_chi(t) and theta_muchi(t) using g_j, and the Mellin gamma factor G_j(s)=pi^(-(s+j)/2)Gamma((s+j)/2)/2, which is nonzero for Re s>0. Poisson summation for the primitive character gives |theta_chi(t)|=(sqrt(q)t)^-1 |theta_chi(1/(qt))|; conjugation does not change the norm because g_j is real. Under t->1/(qt), the measure |theta_chi(t)|dt/sqrt(t) is transported exactly to the same measure. Since q<=T², the small range t<1/T maps inside t'>1/T. Hence the full theta_chi integral on the critical line is at most twice its tail.

Define the holomorphic bounded function on the strip 1/2<=Re s<=2
  H_chi(s)=G_j(s)^2 - G_j(s)L(s,chi) J_chi(s),
  J_chi(s)=integral_(1/T)^infinity theta_muchi(t)t^(s-1)dt.
The Mellin identity G_j L=integral_0^infinity theta_chi(t)t^(s-1)dt holds on Re s>0 by Poisson summation and analytic continuation of the absolutely convergent identity for Re s>1. The functions are bounded on this strip for each fixed chi,T, by the Gaussian decay at infinity and at zero for the primitive nonprincipal theta, and the cutoff for J_chi. On Re s=1/2 the tail hypothesis and the preceding norm identity give |G_j L|<=2T^(2eta), |J_chi|<=T^(2eta); G_j is bounded uniformly on the strip by its defining integral. Therefore |H_chi|<=C T^(4eta). On Re s=2, the absolutely convergent Dirichlet series of mu*chi is 1/L(s,chi); subtracting its truncated Mellin transform gives
  H_chi(s)=G_j(s)L(s,chi) integral_0^(1/T) theta_muchi(t)t^(s-1)dt.
Use |theta_muchi(t)|<=3e^-t/t, from summing the Gaussian majorant, and |L(2+i tau,chi)|<=zeta(2). Thus |H_chi|<=C/T, in particular <=C T^(4eta-1) for T>=1. Hadamard three-lines gives, at sigma=Re s,
  |H_chi(s)|<=C T^[4eta-(sigma-1/2)/(3/2)].
At a zero with sigma>=1/2+9eta this is at most C T^(-2eta). But there H_chi(s)=G_j(s)^2, whose norm has a positive lower bound on the compact rectangle 1/2<=sigma<=1, |Im s|<=Y, independently of chi. For large T this is impossible. Hence any such zero requires the combined two tails to exceed T^(2eta).

For primes d<=X in the required class take T=sqrt(hX). The two-tail sum estimate now gives at most O(T^(2+eta)/T^(2eta))=O_{M,eta,Y}(X^(1-eta/2)) bad primes for the fixed xi. Summing over the finite character group modulo M preserves the exponent. If beta>1/2 choose 0<9eta<min(1,beta-1/2). By the ordinary PNT in any fixed unit class a mod M, the number of primes in that class up to X is asymptotic to X/[phi(M)log X]; it exceeds the exceptional count for large X. Thus one prime d=a mod M simultaneously has all its twisted L-functions nonzero on Re s>=beta, |Im s|<=Y (Re s>=1 handled by the standard unconditional nonvanishing). All constants allowed to depend on M,beta,Y. This is the needed native exists_entireL_quadTwist_ne_zero; no estimate uniform in a growing modulus is required. In particular, ordinary RH only needs M=18480 and a=9239, a unit class with d=7 mod 8. Do not infer this simultaneous nonvanishing from Dirichlet's theorem alone.

### Landau and the final contradiction

For clarity the exact one-sided Landau principle used here can be proved directly. Suppose E(v) real, continuous or measurable with local integrability, |E(v)|=O(e^v), with its transform Phi(s)=integral_0^infinity E(v)e^((1-s)v)dv initially for Re s>2 and meromorphic on Re s>0 with at most simple poles, and suppose E(v)<=e^((beta-1)v) eventually for beta>0. If residues of Phi at real a>beta are nonnegative, Phi has no poles in Re s>beta. Indeed choose K>=1 so K e^(beta v)-E(v)e^v is nonnegative for all v>=0 (our E is continuous). Its Laplace transform is Psi(s)=K/(s-beta)-Phi(s). A nonnegative Laplace integral has a real singularity at any finite abscissa of convergence a: if analytic across a, choose c>a close enough to a that the Taylor series at c converges at some c-h<a. Its coefficients after replacing s by c-h are nonnegative moments integral v^j e^-cv [density] dv /j!, justified by exponential convergence on a neighborhood of c. Monotone convergence then sums to the integral at c-h, finite, contradicting the abscissa. If a>beta, meromorphic Psi has at most a simple pole there, of residue minus Res_a Phi<=0. A negative residue is impossible because Psi(s)>=0 for real s>a; a zero residue makes the singularity removable. Therefore a<=beta (including the possibility of convergence everywhere); the nonnegative Laplace integral is holomorphic on Re s>beta by dominated convergence on smaller right half-planes. Its analytic continuation identity with Psi gives the result. This is the ordinary Landau argument, not the compact special-window moment theorem.

Assume a nontrivial zeta zero rho with sigma=Re rho>1/2; classical nonvanishing for Re s>=1 gives sigma<1. Choose 1/2<beta<sigma and epsilon>0 with epsilon<1/100, 1/2+8epsilon<=beta. Fix M=18480, a=9239. By the density argument choose a prime d=a mod M simultaneously good for every twist at Re s>=beta, |Im s|<=|Im rho|. This d is fixed BEFORE letting x tend to infinity. It meets the actual Parameters guards of New.grh for q=1 (a²=1 mod M, gcd(a,M)=1, a=7 mod 8). By the compact geometric star inequality, data existence and §6a, E(v)=R_M(exp v)<=e^((beta-1)v) eventually. All real poles a' in (beta,1) of its transform have nonnegative residues, because the twisted zero orders vanish and the denominator phi(M)a'(1-a') is positive. There are no poles on [1,infinity). Apply Landau. At rho the induced principal character mod M has L(s,1_M)=zeta(s)prod_{p|M}(1-p^-s), whose Euler factors are nonzero in Re s>0. Thus its entireL has a positive zero order at rho; all other untwisted orders are nonnegative and all twisted orders vanish. The residue formula gives a nonzero residue, contradicting Landau. So no nontrivial zeta zero lies right of 1/2; the functional equation reflects every left-hand zero to the right, yielding RH.

This completes the human analytic IMPLICATION from the actual compact star inequality and admissible data existence using conventional mathematical results. It removes the prior special-scale moment construction and translates the quadratic-twist and Landau suppliers in full, rather than leaving the latter as unexamined black boxes. It does not establish the deep A/B/C geometric and arithmetic arguments or prove DataExist. Native replay not performed. No claim of a new result on RH itself or novelty of the classical analytic estimates.

Source anchors compact pin: New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2; OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3; Lib/Analytic/Landau/PolarLandau.lean 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9; Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11; Lib/Analytic/DirichletTheta/MellinTheta.lean 4183fcfb698ce3d76e5de2ead22ccbef36d58fc0; New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65; New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41. All actual statements and proof bodies inspected. Standard PV and three-lines, Poisson and Dirichlet L-function facts used in exactly their classical domains. For final manuscript replace §6 with §§6a–b shortened; preserve this complete derivation as appendix material for checking. Remaining priority DataExist and actual A/B/C, not further reductions of analytic implication.

## 7. Exact current frontier and source ledger

This manuscript has reconstructed the scalar cancellation, the abstract greedy spanning lemma, the common-family selection and the reciprocal height assembly. The analytic implication is now derived in §§6a–b from star and DataExist with explicit classical cited inputs; independent audit remains. The actual A/B/C suppliers and DataExist still need concise human derivations and transitive reference checks. The external proof certification is separate from our manuscript's completeness. No claim of ten-page completion, mathematical novelty of the native argument, measured runtime improvement, or new formal proof.

Sources at compact pin, relative to grh-compact/src:
- New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65; Main.lean a5d8389131c985a0b54ce5b0e778ee5c8126a997.
- New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a.
- New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05.
- New/Heights/Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518.
- New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6.
- New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76; New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444.
- New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547.
- New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88; New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1.
- New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41; New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2; OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3 (retrieved in preceding migration turn).
- New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14 (preceding migration).
RESUME: editor/integration use this as compact primary manuscript; next translate actual spread supplier Fits.exists_translate_finrank_comap_le and A local loss/index and C fit-family/height suppliers in parallel. Preserve old manuscript and exact source contexts. Avoid treating A/B/C as unexplained axioms in the final ten-page proof. No new compilation or numerical surrogate run.
