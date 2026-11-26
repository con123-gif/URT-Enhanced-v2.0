import New.Endgame.ShortAndEnough

/-!
RUN53 / 2026-11-26 / prime-window / SOURCE-MATCHED human derivation, native replay outstanding.
Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude per upstream.
Read latest mission blob 23f64d503b7d64bb13b9667156b499021038d742, manuscript,
recent data construction 1c56102f5b8526896eb2a0bfbd337ebd0db91a3e,
second-scale PNT 2b574cee77d540aca6eccda33df7d8927389eb75,
analytic chain 20a967d44880eacaf4e7e8817cd9b02782ef6f17.
No repetition of their Behrend/Siegel-Walfisz or second-scale proof.

Source ledger (line numbers in pinned compact source):
* New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
  25–45 data fields; 100–114 a and placeOfInt; 126–139 tops, nominalWeight, primeSum.
* New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
  placeClass_of_thick (34), actual scale guards.
* New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a,
  mainAsk/remainder (35–42), remainder_eq (86–112).
* New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2,
  lambdaClass, primeError (25–39), re_logDerivMean_one (52), primeError_eq_sum (60–64).
* New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65,
  star_inequality (121–145), eventually_primeError_le_rpow (149–167).
No import of New.Main or final RH. Below star is an explicit premise.

1. Exact fibre transport in remainder_eq.
Write M=N0, G=(Z/N1)^×, pi:G→(Z/M)^×, T=thick,
U=ker pi=tops, h=|T|, t=|U|, f=phi(M)t. Native thick lies in pi^{-1}(-1),
so h≤t (every nonempty fibre of a surjective homomorphism is a coset of U).
N1 has the same prime divisors as M (M divisible by 18480, hence by 6).
For integer nu≥1, if gcd(nu,N1)=1 the native placeOfInt(-nu) is the unit -nu.
Its product with U is the full fibre over -nu mod M. Thus |{tau∈U:
placeOfInt(-nu) tau∈T}|=h when nu≡1 mod M and 0 otherwise.
If nu is not a unit, placeOfInt(-nu) is identity by its definition; this
fibre is U, disjoint from T since -1≠1 mod M. Also nu cannot be 1 mod M.
This handles nonunits, not just unramified primes. The weight and count
are multiplied only after the exact transport.

2. Finite sum and normalization (complete human derivation of remainder_eq).
Let F_z(n)=(1/n-1/z)_+, lambda_M(n)=Lambda(n)(1-chi_d(n)) 1_{n≡1 mod M}.
For each n≤a the sum of ramps across U is t F_x1(n)+h 1_{n≡1 mod M}
(F_x(n)-F_x1(n)), before multiplication by a lambda_1(n). Since
0<x,x1≤a by native scale guards, the sums extend over all n≥1 without
changing them. Define S_M(z)=sum_n lambda_M(n)F_z(n).
The resulting total Ask is a[h(S_M(x)-S_M(x1))+t S_1(x1)].
By primeError_eq_sum, S_M(z)=R_M(z)+log(z)/phi(M)+kappa_M,
kappa_M=Re logDerivMean(d,M,1). The two kappa_M terms cancel exactly.
The mean of log nominalWeight over G is
log a-log x1-(h/f)(log x-log x1). Hence
t mainAsk/a=t(log x1-1-ell)+(h/phi(M))(log x-log x1).
As kappa_1=-1-ell, subtracting t mainAsk cancels all remaining log and
constant terms and proves precisely remainder/a=h(R_M(x)-R_M(x1))+t R_1(x1).
No use of RH, PNT, or independent witnesses in this argument.

3. Proper powers may be eliminated from the arithmetic endgame with a
uniform, explicit error below the native x^(-1/2) scale. This is an optional
human simplification of the actual same-data remainder, not a new RH problem.
For prime d, chi_d(p^k)=chi_d(p)^k. Every nonramified even power has zero
weight. Only odd k≥3 for inert p and powers of p=d with k≥2 remain.
Let c_n=lambda_M(n) for n a proper prime power and 0 otherwise. This is
nonnegative; let A_M(v)=sum_{n≤v} c_n. For v≥2, at most floor(v^(1/3))
possible bases of nonramified powers, at most log(v)/log(2) exponents
per base, each weight ≤2log(v). The ramified terms together have weight
≤log(v), regardless of d. Therefore
  A_M(v) ≤ (3/log 2) v^(1/3) log²(v).
The bound also holds for M=1 and is independent of both M and d.
Consequently H_M=sum_{n≥1} c_n/n converges, by Tonelli:
  H_M=integral_1^infty A_M(v)/v² dv.
Define the genuine-prime-only normalized error
  P_M(z)=sum_{p≤z} lambda_M(p)(1/p-1/z)-log z/phi(M)-(kappa_M-H_M).
The constant shift is mandatory; dropping powers without shifting kappa
would leave an error of order one. For z≥2, exactly
  R_M(z)=P_M(z)-T_M(z),
  T_M(z)=sum_n c_n min(1/n,1/z)=integral_z^infty A_M(v)/v² dv.
Proof: (1/n-1/z)_+ + min(1/n,1/z)=1/n, followed by Tonelli for
nonnegative terms; the last identity is the integral of 1_{v≥n}/v².
Integration by parts twice gives the uniform bound
  0≤T_M(z)≤(3/log 2) z^(-2/3)
      [(3/2)log² z+(9/2)log z+27/4] = o(z^(-1/2)).
In particular 0≤T_M(z)≤T_1(z) and T_M is decreasing.
Every estimate holds unconditionally; no zero-free region invoked.
The ramified prime powers are retained in H_M, not silently discarded.

4. Same-data caller substitution, with exact signs.
The original star inequality on the SAME admissible D implies
  h(P_M(x)-P_M(x1))+t P_1(x1)
  ≤ f (log b)^5/m + h T_M(x)+t T_1(x1)-h T_M(x1).
The correction is nonnegative (h≤t and T_M≤T_1) and is bounded above by
h T_M(x)+t T_1(x1). On the native D' or the original fixed-P PNT D,
t/h≤log b=x^eps, x1≥x^(10^6) and m≥sqrt x. Divide by h>0. The added
error is at most T_M(x)+x^eps T_1(x1)=o(x^(-1/2)), for 0<eps<1/100,
uniformly in the allowed second scale (T_1 decreasing).
Thus the original eventual R_M upper estimate implies an eventual P_M
upper estimate with any arbitrarily small positive exponent slack, and a
P_M bound implies the same R_M bound without slack because T_M≥0.
No assumption or quantifier of A/B/C, exists_data, or Landau is deleted;
the native analytic consumer still uses R_M, recoverable exactly by T_M.
This is not a proof of the prime bound: the volume inequality is still
the substantive source of RH-scale cancellation.

Verification actually executed in JS on genuine primes: sieve to 2,000,000,
148,933 primes, d=9239 prime (native modulus M=18480 class M/2-1),
15 nonzero proper prime powers within this cutoff. 1,015 finite checks
(15 nonramified parity checks plus 250 x × 2 moduli × 2 identity/count
checks); max finite H-S-T residual 2.006e-18. Exact finite fibre arithmetic
for N1=6M, T chosen as three units over -1: checked all 110,880 residues,
6 tops, no violations. This small finite group is a test of the algebra,
NOT an admissible full Data witness. The ramified square d² is outside
the sieve cutoff; the ramified bound above is a mathematical derivation.
Reproduction: for each prime p compute Legendre symbol using pow(p,(d-1)/2,d);
enumerate p^k≤2e6, k≥2; weight (1-chi(p)^k)log p, filter n mod M;
x=2+floor((2e6-2)(i/249)^2), i=0..249. Compare finite H, S and T as
defined above; count bound on A. For fibre use N1=110880, all units t≡1
mod 18480, first three units ≡-1; enumerate n=0..N1-1, multiply t by
(-n mod N1) for unit n and 1 otherwise. No inference of asymptotics from
these checks.

Native Lean executable algebra bridge below, NOT compiled. Local lean/lake
absent. Actual shared CI status compute/rh-compact-union-graph-20261126/status.json
on cathedral-research-state: error RESOURCE_BLOCKED, returncode 1, run
45781154005 (2026-11-26). The workflow job itself reports success because
it persisted the error artifact; this is not a native replay PASS.
Old engine PASS is on a different toolchain. No new kernel graph or axiom
evidence; retain original/reduced graphs, pending nodes and existing axioms.
The following bridge uses the native remainder theorem, explicitly receives
the three exact analytic correction identities and the native star premise.
The human proof of infinite tail convergence above is not formalized here.
-/

noncomputable section

namespace PrimeWindowRun53

theorem ramp_split (u v : ℝ) : max (u-v) 0 + min u v = u := by
  by_cases h : v ≤ u
  · rw [max_eq_left (sub_nonneg.mpr h), min_eq_right h]
    ring
  · have h' : u ≤ v := le_of_not_ge h
    rw [max_eq_right (sub_nonpos.mpr h'), min_eq_left h']
    ring

theorem same_data_remainder {P : Parameters} (D : Data P)
    (pM pM1 p1 tM tM1 t1 : ℝ)
    (hx : primeError P.d P.N₀ D.x = pM - tM)
    (hx1 : primeError P.d P.N₀ D.x₁ = pM1 - tM1)
    (h1 : primeError P.d 1 D.x₁ = p1 - t1) :
    D.remainder = (D.a : ℝ) *
      ((D.thick.card : ℝ) * (pM-pM1) + (D.tops.card : ℝ)*p1 -
        ((D.thick.card : ℝ)*tM + (D.tops.card : ℝ)*t1 -
          (D.thick.card : ℝ)*tM1)) := by
  rw [Data.remainder_eq, hx, hx1, h1]
  ring

theorem same_data_star {P : Parameters} (D : Data P)
    (pM pM1 p1 tM tM1 t1 : ℝ)
    (hx : primeError P.d P.N₀ D.x = pM - tM)
    (hx1 : primeError P.d P.N₀ D.x₁ = pM1 - tM1)
    (h1 : primeError P.d 1 D.x₁ = p1 - t1)
    (star : (D.m : ℝ) * D.remainder ≤ D.logB ^ 2 * D.budget)
    (ha : 0 < (D.a : ℝ)) (hm : 0 < (D.m : ℝ)) :
    (D.thick.card : ℝ) * (pM-pM1) + (D.tops.card : ℝ)*p1 ≤
      (D.logB ^ 2 * D.budget) / ((D.m : ℝ) * (D.a : ℝ)) +
      ((D.thick.card : ℝ)*tM + (D.tops.card : ℝ)*t1 -
        (D.thick.card : ℝ)*tM1) := by
  have hma : 0 < (D.m : ℝ) * (D.a : ℝ) := mul_pos hm ha
  rw [same_data_remainder D pM pM1 p1 tM tM1 t1 hx hx1 h1] at star
  have h := (le_div_iff₀ hma).2 (show
    ((D.thick.card : ℝ) * (pM-pM1) + (D.tops.card : ℝ)*p1 -
        ((D.thick.card : ℝ)*tM + (D.tops.card : ℝ)*t1 -
          (D.thick.card : ℝ)*tM1)) * ((D.m : ℝ) * (D.a : ℝ)) ≤
        D.logB ^ 2 * D.budget by
          convert star using 1 <;> ring)
  linarith

theorem correction_sign (h t tx ty uy : ℝ)
    (hh : 0 ≤ h) (ht : h ≤ t) (hx : 0 ≤ tx)
    (hy : 0 ≤ ty) (hu : ty ≤ uy) :
    0 ≤ h*tx + t*uy - h*ty ∧ h*tx + t*uy - h*ty ≤ h*tx + t*uy := by
  constructor
  · have h1 := mul_nonneg hh hx
    have h2 := mul_le_mul_of_nonneg_left hu hh
    have h3 := mul_le_mul_of_nonneg_right ht (hy.trans hu)
    linarith
  · have h1 := mul_nonneg hh hy
    linarith

#print axioms ramp_split
#print axioms same_data_remainder
#print axioms same_data_star
#print axioms correction_sign

end PrimeWindowRun53

/-!
RESUME HERE: Integrate sections 1–2 as the full proof of remainder_eq in
HUMAN_PROOF_COMPACT.md, and sections 3–4 only if they shorten the final
arithmetic exposition. Ask formal audit to check ramified-power constant
shift, signs and native caller. Do not spend another run improving the
already subcritical tail: coordinate with A/B/C lanes on a genuinely
missing root supplier, e.g. native scale-dependent local index loss.
No independent RH proof, no native PASS, no URT assumption, no change
to schedules, protected workflows, or old-pin artifacts.
HANDOFF TO: integration, human editor, formal audit, kernel extractor.
-/
