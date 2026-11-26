import Mathlib

/-!
# Compact audit RUN51: the actual Mellin–Landau–common-twist chain
26 November 2026. Human source-matched proof block, scalar Lean certificates
PREPARED (not compiled). Credit Levent Alpöge, Luke Sernau, Claude and collaborators.
Primary source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission current blob 23f64d503b7d64bb13b9667156b499021038d742, including
expanded connected workloads; original mission pin e0dc8f7f read separately.
Read protocol, AGENTS, research state, handoff, manuscript b46a4489 and
peer 3e627c9b (linear window), ec7f131f (normalization), da61f448 (thick places),
latest peer commit list. Keep old source pin and all prior work separate.

## 1. Exact polar transform, including the constant -1
Actual New/Endgame/PrimeError.lean blob 63eb3d79d95ad815878e623b96f237240058c8e2:
lambdaClass, lambdaSum, logDerivMean, primeError, isPolar_primeError.
Fix M>0 and prime d≡7 mod 8 coprime to M. Let p=phi(M) (NOT a prime),
lambda(n)=Lambda(n)(1-chi_d(n)) 1_{n≡1 mod M}; 0≤lambda(n)≤2 log n for n≥1.
Let Ltilde be the native entire L-function (principal pole regularized).
Write T(s)=sum over ALL characters xi mod M of
  [Ltilde'/Ltilde(s,xi chi_d)-Ltilde'/Ltilde(s,xi)].
F(s)=(T(s)-1)/p is exactly logDerivMean, with the -1 OUTSIDE the sum.
For Re s>1, orthogonality and the Euler product give
  A(s)=sum lambda(n)n^(-s)=(1/(s-1)+T(s))/p.
The only principal pole is the untwisted principal character; all twists
are nonprincipal because d is odd and coprime to M (CRT).
With kappa=Re F(1), E(v)=R_M(exp v), the Laplace integral for Re s>2 is
  Phi(s)=integral_1^infty R_M(x)x^(-s) dx.
For each n the kernel integral from n to infinity is
  integral (1/n-1/x)x^(-s) dx = n^(-s)/(s(s-1)).
Absolute Fubini follows from lambda(n)≤2 log n and Re s>1.
The centering terms integrate to 1/[p(s-1)^2] and kappa/(s-1).
Cancel BEFORE norms:
  Phi=A/[s(s-1)]-1/[p(s-1)^2]-kappa/(s-1)
     =(F(s)/s-kappa)/(s-1).
This is the native continuation. Meromorphicity follows from the entire
nonidentically-zero Ltilde functions and logarithmic derivatives.
F is analytic at and near every point with Re≥1 by native entireL_ne_zero.
F is real on real s>1 by the Dirichlet series identity; continuity gives
F(1)=kappa. Thus s=1 is removable (do not treat it as a pole of residue 1).
For Re rho>0, rho≠1, the residue is exactly
  (sum ord_rho Ltilde(xi)-sum ord_rho Ltilde(xi chi_d))
     /[p rho(1-rho)].
Indeed a logarithmic derivative has residue the vanishing order; the
minus sign in the denominator reverses the twist-minus-base numerator.
At s=1 the residue is zero. E is measurable by its finite cutoff sums;
for v≥0 its magnitude is O(exp v), even using only lambda(n)≤2n:
the weighted sum ≤2 floor(exp v) and the centering terms are O(1+v).
All native IsPolar fields are accounted for in this human derivation.

## 2. Landau, in the exact one-sided sign convention
Lib/Analytic/Landau/PolarLandau.lean blob 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9,
IsPolar.landau. Let beta>0, E(v)≤exp((beta-1)v) eventually, and suppose
Re res Phi(r)≥0 for every real r>beta. By the growth bound on a bounded
initial interval choose K≥1 with H(v)=K exp(beta v)-exp(v)E(v)≥0
for all v≥0. H is measurable and exponentially bounded. Its Laplace
transform Psi(s)=K/(s-beta)-Phi(s) initially for Re s sufficiently large.
Let a be the maximum of beta and the abscissa of convergence of the
nonnegative integral (if the abscissa is -infinity use beta). For real
z>a the integral converges, and defines an analytic function on Re s>a:
on compact subsets derivatives are dominated by an integrable exponential
with slightly smaller real exponent. The identity theorem for meromorphic
functions identifies this function with Psi there.
If a>beta, the meromorphic Psi has at most a simple pole at a, since
(z-a)Phi(z) has a finite limit. Its residue is -res Phi(a), and positivity
of Psi(z) for real z>a implies that this real residue is ≥0. The input
sign condition implies it is ≤0, so the singularity is removable.
Choose a small disk about a of analyticity, and z>a sufficiently close
to a so its Taylor disk extends to a real sigma<a, sigma>beta.
At z each (-1)^k Psi^(k)(z)=integral v^k exp(-zv)H(v)dv≥0.
Taylor convergence at sigma and monotone convergence of the nonnegative
exponential series imply integral exp(-sigma v)H(v)dv<infinity.
Contradiction to the abscissa. Hence a=beta; Psi is analytic for Re>beta,
and so Phi has zero residues there. No assertion of positivity for E
itself, no two-sided prime bound, no RH premise.
Negative control: E(v)=-exp((r-1)v) for beta<r<1 satisfies the upper
bound everywhere but has Phi(s)=-1/(s-r). Real-residue sign is essential.

## 3. One common auxiliary d, not separate witnesses
Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean
1d873bd3fef2c4ba301ce38e0469cc1817e6aa11:
zero_density_quadTwist, exists_entireL_quadTwist_ne_zero.
Fix beta>1/2, height y≥0 and unit class a mod M whose primes are
7 mod 8 and coprime to M. Choose eta>0 with 9eta<min(1,beta-1/2).
For each xi, the native zero-density theorem bounds the number of bad
primes d≤X by O_{xi,eta,y}(X^(1-eta/2)) (using the larger bad region
Re≥1/2+9eta). There are finitely many xi for FIXED M. Their union has
the same power-saving bound with a fixed constant. Dyadic decomposition
shows the sum of 1/d over this union converges, bounded on the jth shell
by O(2^(-j eta/2)). But the sum of reciprocal primes in any reduced
class mod M diverges, by Dirichlet's theorem in its harmonic form
(the exact native supplier is not_summable_residueClass_prime_div).
Thus one d in the class avoids the union: all twists are simultaneously
nonzero on Re≥beta, |Im|≤y. This derives selection from the actual
zero-density input; the latter still needs human proof from
three_lines_bound_of_LFunction_eq_zero and sum_thetaTailIntegral_le,
not inferred from a finite computation.

## 4. Actual one-sided criterion and RH-only consumer
New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3:
entireL_ne_zero_of_primeError_le; New/Main.lean
198ed5bf26aa294898931e0649bc2b88f1389f65: eventually_primeError_le_rpow,
New.grh, New.zeta_zeros_on_line. Main.lean a5d8389131c985a0b54ce5b0e778ee5c8126a997.
Suppose there is an original zero rho with beta<Re rho<1.
Choose the common d in §3 at height y=|Im rho| BEFORE invoking the
eventual prime bound for this d. At every real r in (beta,1) all twist
orders vanish, all untwisted orders are nonnegative, and p r(1-r)>0.
Thus Re res Phi(r)≥0. At r≥1 there are no poles by §1. Landau forces
res Phi(rho)=0, whereas its numerator is a strictly positive integer
(one original order is ≥1, none negative and all twist orders zero)
and its denominator is nonzero. Contradiction.
The decisive equation is the native residue with twist orders removed:
  0 = res Phi(rho) = (sum ord_rho Ltilde(xi)) / [phi(M) rho(1-rho)] != 0.
Dropping any of the other untwisted orders is unnecessary; replacing the
common d by independent per-character choices would not justify the sign.

For RH-only choose q=1 in New.grh. M=18480 and a=9239: a is a unit,
a²=1 mod M, and every prime in the class is 7 mod 8 and coprime to M.
At an alleged zeta zero rho in 1/2<sigma<1, choose epsilon=(sigma-1/2)/51;
0<epsilon<1/100 and beta=1/2+8epsilon<sigma. The induced principal
Ltilde mod M is (s-1)zeta(s) product_{p|M}(1-p^(-s)), so it vanishes at
rho. Native Parameters.mk in New.grh supplies the fixed P for each
chosen d. Assume the ACTUAL eventually_primeError_le_rpow at each such
P (proved by native star/data/scale chain, not derived in this audit).
Then R_M(x)≤x^(beta-1) eventually; thresholds may depend on P and epsilon.
No need for a uniform threshold over primes d because selection precedes
application of the estimate. Landau contradiction gives right half-strip
nonvanishing; the standard zeta functional equation, Re≥1 nonvanishing
and trivial-zero guards give the RH statement. This is only the analytic
consumer, not an independent proof of the arithmetic premise.

Peer cross-checks: 3e627c9b linear second-scale window has a valid uniform
X budget: t+tX+1≤(1+t)exp(t)≤exp(2t) for t≥0 and X≤exp(t).
Its fixed C depends on fixed P; once t≥C, Ct≤t², so the native caller's
original scale guards are unchanged. The three normalized upper terms
exp(-t),9 exp(-2t),3 exp(-3t) tend to zero; no need to replace the verified
native window in the manuscript. AGREE with ec7f131f scalar normalization:
same D and all positive a,m,#thick are required before division.
Keep actual D' update (only logX1 changes), common family A+B+C, all
DataExist and scale premises. No conclusion from sparse numerical windows.

## Evidence and graph
Original selected source graph (not kernel-elaborated):
Main -> New.grh -> [eventually_primeError_le_rpow, entireL_ne_zero_of_primeError_le]
 -> [star_inequality + exists_data + remainder_eq + polar window,
     isPolar_primeError + exists_entireL_quadTwist_ne_zero + IsPolar.landau].
Candidate human graph: identical suppliers; §§1-4 expand polar transform,
Landau and common twist selection and specialize conclusion to q=1.
Only the full GRH conclusion need not be separately reconstructed; its
auxiliary character family remains. No transitive global edge deletion.
Still open HUMAN inputs: native A/B/C deep chains, full DataExist,
zero-density quantitative proof, polar-window moment estimate, standard
analytic and arithmetic references. Prior source and graph evidence retained.
Cache key: compact pin, fixed M=18480, common d, beta, y and actual P;
never reuse a bound with a different modulus, field, height or d.

Actual local command -v lean/lake/elan: none. Compact CI
45781154005 status blob ea44d71556e0d21703e72fcd61bbaf2bee0ec563:
RESOURCE_BLOCKED before build, returncode 1. No new native proof graph,
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier run or axiom evidence
on compact pin. Old status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 reconfirm the prior engine
and conditional strip-root passes only. No new native PASS. Do not import
the upstream claimed RH theorem. Below only scalar certificates are prepared.
Actual CPython SymPy exact checks (exit 0), reproducible:
  import sympy as S
  from math import gcd
  s,T,p,k,n=S.symbols('s T p k n', nonzero=True)
  raw=(1/(s-1)+T)/p/(s*(s-1))-1/p/(s-1)**2-k/(s-1)
  assert S.cancel(raw-((T-1)/p/s-k)/(s-1))==0
  B=S.symbols('B', positive=True)
  primitive=-B**(1-s)/(n*(s-1))+B**(-s)/s
  assert S.simplify(S.diff(primitive,B)-(1/n-1/B)*B**(-s))==0
  assert S.simplify(-primitive.subs(B,n)-n**(-s)/(s*(s-1)))==0
  assert gcd(9239,18480)==1 and 9239%8==7 and 18480%8==0
  assert 9239**2%18480==1
  assert (1-1)==0 and (0-1)<0
  assert S.residue(-1/(s-S.Rational(3,4)),s,S.Rational(3,4))==-1
These check algebra and adverse signs, not analytic hypotheses or RH.
Verdict AGREE/PARTIAL: four connected source-matched human proof steps;
0 new kernel-verified closures, no URT or physical assumptions.
RESUME HERE: integrate §§1-4 into HUMAN_PROOF_COMPACT §6 with the fixed
modulus and exact signs; audit the actual quantitative zero-density
three-lines and theta mean-square suppliers next, preserving all hypotheses.
HANDOFF TO: integration, editor, Landau, kernel; compact pin only.
-/

namespace CompactAuditRun51

theorem mellin_cancel (s T p k : ℂ)
    (hs : s ≠ 0) (h1 : s - 1 ≠ 0) (hp : p ≠ 0) :
    (1 / (s - 1) + T) / p / (s * (s - 1)) -
      1 / p / (s - 1)^2 - k / (s - 1) =
      ((T - 1) / p / s - k) / (s - 1) := by
  field_simp [hs, h1, hp] <;> ring

theorem residue_ne_zero (m p rho : ℂ)
    (hm : m ≠ 0) (hp : p ≠ 0) (hr : rho ≠ 0)
    (h1 : 1 - rho ≠ 0) :
    m / (p * (rho * (1 - rho))) ≠ 0 :=
  div_ne_zero hm (mul_ne_zero hp (mul_ne_zero hr h1))

theorem real_residue_nonneg (m p r : ℝ)
    (hm : 0 ≤ m) (hp : 0 < p) (hr : 0 < r) (h1 : r < 1) :
    0 ≤ m / (p * (r * (1-r))) := by
  exact div_nonneg hm (mul_nonneg hp.le (mul_nonneg hr.le (sub_nonneg.mpr h1.le)))

theorem epsilon_guards (sigma : ℝ) (hl : 1/2 < sigma) (hu : sigma < 1) :
    0 < (sigma-1/2)/51 ∧ (sigma-1/2)/51 < 1/100 ∧
      1/2 + 8*((sigma-1/2)/51) < sigma := by
  constructor
  · linarith
  constructor <;> linarith

example : Nat.Coprime 9239 18480 := by decide
example : 9239 % 8 = 7 := by decide
example : 9239 ^ 2 % 18480 = 1 := by decide

#print axioms mellin_cancel
#print axioms residue_ne_zero
#print axioms real_residue_nonneg
#print axioms epsilon_guards
end CompactAuditRun51
