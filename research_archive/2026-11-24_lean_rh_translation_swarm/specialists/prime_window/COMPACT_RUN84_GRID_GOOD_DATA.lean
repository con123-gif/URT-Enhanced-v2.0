import New.Endgame.PrimeError

/-!
# RUN84 — compact signed-error caller on a quartic good-data grid
27 November 2026. Human source-matched conditional reduction; Lean PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read latest mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87e949a9ea899dd09d297aa30f59df4d1b533fc4, 261b9e8bf027af37e6abe6920deb544b23352d48,
AGENTS, SWARM, HANDOFF, EXPANSION, and RUN83 465cacb7. Recent peer head
4f10d09e, B2/C2 graph audit 8ca5ebf9, A1 strict graph f08cdf6b,
A2 stage isolation 2e18ca4e, B4 weighted deficit 4cc35bab/40091ec1.
Prior art in this lane: old-pin RUN43 c8cb579a (quartic interpolation of
singleton Deduction.G); RUN53 bfb8f02bca23bc449aca266389ca46e7e03008ea
(compact exact remainder, proper powers). This is a transfer of RUN43's
method to the DIFFERENT compact weighted quadratic-twist primeError and
the RUN83 existential good-data consumer, not a rediscovery of the
old interpolation or a proof of the arithmetic estimate.

## Actual obstruction and reduction
RUN83 requires good data for EVERY sufficiently large real x; its warning
about arbitrary cofinal sequences is correct. But a sufficiently dense
specified sequence with a proved interpolation bound is enough.

Fix P and epsilon before any scale, M=P.N0=18480, d=P.d, and put
phi=totient(M), K=Re logDerivMean(d,M,1). Source New/Endgame/PrimeError.lean
63eb3d79d95ad815878e623b96f237240058c8e2, declarations lambdaClass,
lambdaClass_nonneg_and_abs_le, primeError_eq_sum; New/Main.lean
198ed5bf26aa294898931e0649bc2b88f1389f65, eventually_primeError_le_rpow,
New.grh, New.zeta_zeros_on_line. Same compact RUN83 premise with
eta=epsilon/2, but require it only at x=k^4 for every sufficiently large
natural k. Explicitly, for each fixed P and eta there exists K0 such that
for every k>=K0 there exists ONE D : Data P satisfying all five conditions
of RUN83 hgood at x=k^4. Keep the SAME D for A/B/C and remainder_eq.
No common D across different k is required. No varying P or twist.

Let 1<=a<=x<=b, choose any natural A>=b, and choose 0<=t<=1 such that
1/x=(1-t)/a+t/b. For a=b=x choose t=0. By primeError_eq_sum,
 R(z)=sum_{1<=n<=A} lambda(n) max(1/n-1/z,0)-log(z)/phi-K.
Each hinge is convex in 1/z and lambda(n)>=0 (including proper
powers and ramified primes). Use the same A for all three sums.
Therefore, by exact cancellation of K,
 R(x) <= (1-t)R(a)+tR(b)+[(1-t)log(a)+t log(b)-log(x)]/phi.
The bracket is <= ((1-t)a+t b)/x-1 by log u<=u-1 applied to a/x,b/x.
For a<b the reciprocal interpolation identity gives exactly
 ((1-t)a+t b)/x-1=(x-a)(b-x)/x^2.
This yields the compact native envelope, valid for every fixed d,M:
 R(x) <= (1-t)R(a)+tR(b)+(x-a)(b-x)/(phi*x^2).
No analytic hypothesis, no prime gap estimates and no change of
normalization. This is not a bound on R at the endpoints.

For a=k^4,b=(k+1)^4,k>=1, b-a<=15k^3 and b<=16a.
Hence correction <=225/(4 phi sqrt(x)); here k^6=a^(3/2)<=x^(3/2).
The same fixed-P PNT tail used in RUN83 is eventual on all real x
and in particular at these fourth powers. Restrict its filter to
the cofinal grid; RUN83's pointwise cancellation and HasLogBound
comparison give R(k^4)<= (k^4)^(8eta-1/2) for every sufficiently large k.
Since eta=epsilon/2, exponent 4epsilon-1/2 lies in (-1/2,0).
Both endpoint powers are <=4*x^(4epsilon-1/2), since a>=x/16 and b>=x.
Thus R(x)<=4*x^(4epsilon-1/2)+225/(4 phi sqrt(x))
         <=x^(8epsilon-1/2) eventually (epsilon fixed positive).
Now use exactly RUN83 principal_right_run83 and zeta_line_run83's
reflection, not New.grh or a claimed RH theorem. This supplies the
actual eventual bound consumed by Landau; every sufficiently large x
is bracketed, not merely a cofinal subsequence. Source pin exact
remainder_eq: New/Endgame/ShortAndEnough.lean
b99eea0689be372d84362c58272b705e104b6a3a.

The new sufficient star target is only one good D per fourth power,
with arbitrary small eta and fixed P, not all scales or all D.
There are floor(X^(1/4)) fourth-power scales up to X, not a claim of
algorithmic complexity for solving their arithmetic obligations.
Existence of these good witnesses is UNPROVED; D1 supplies admissible
data, not good data. All A/B/C suppliers, fixed-P tail, twist density,
real-residue sign and Landau remain. Do not reopen D1/E1's already
audited analytic arguments. No weakening to arbitrary sparse points.
Negative control: for M=18480, a=2,b=4,x=8/3,t=1/2, no eligible nonzero
prime-power terms. The log correction before bounding is exactly
log(3*sqrt(2)/4)/phi>0; the zero-correction chord is false even for
actual compact primeError.

Original occurrence graph: RUN83 hgood at all x + fixed-P tail +
remainder_eq + HasLogBound -> eventual -> principal -> reflection.
Candidate: grid hgood + same tail/remainder/HasLogBound -> grid endpoint
bounds + native finite ramp chord + quartic cover -> same eventual
consumer -> same principal/reflection. Preserve old-pin graph, RUN83
and all root frontier/axiom records; no transitive dependency deletion.
Cache key: compact pin, P,d,M,eta,x,D, fixed cutoff A, endpoints,t.
Backtrack to RUN83 if compact finite-ramp or cover replay fails.

## Actual verification this run
Local CPython (not Lean), sieve through 32^4=1048576, d=9239 confirmed
prime, 82025 primes, actual weighted prime powers in M=1 and M=18480
(41064 and 4 respectively). On 31 quartic cells, 19 reciprocal interior
points each, exact Fraction checks of the rational curvature identity
and product bound, and floating point ramp-envelope checks for both
moduli: 1178 of each check type passed; maximum gap minus bound
-0.0007629034693246937 and -9.611886645062278e-08 respectively.
K cancels, so finite numerical evaluations omit this same additive
constant. Exact proof above, not extrapolation from finite results.
Reproduce: sieve primes p<=32^4; chi=0 if p=d else Euler criterion
pow(p,(d-1)//2,d); enumerate p^j<=32^4 with weight (1-chi^j) log p
and p^j mod M=1 mod M. For k=1..31 and i=1..19 use Fraction t=i/20,
a=k^4,b=(k+1)^4,x=1/((1-t)/a+t/b). Compare
((1-t)*a+t*b)/x-1 exactly with (x-a)*(b-x)/x^2; verify
(x-a)*(b-x)<=225*k^6/4. Evaluate R without K using cumulative
sums of lambda/n,lambda and subtract log(x)/phi; compare with chord
and curvature to 1e-11. No finite sample establishes star.

Actual shared A1/A2 compute receipt, run 46023465491, just fetched:
cathedral-research-state/compute/rh-compact-a1-a2-transport-20261127/
status.json blob 07a2b14930c38095e6771ae9ed1a10a3cf1bf678,
status=error, returncode=1, wall 3376.82s, despite green Actions jobs.
a1_transport.json a836b217995972d757d2b82163d86c78adb4fd2c:
transport rc=1, no leaf/transport markers or axiom audit.
Actual log ba683f34264daaa9c633314558cbee36916dba78:
line 26 IsOpen.matrix type mismatch, line 82 CommRing Nat instance
failure, line 83 markOperator ring mismatch, then unknown new theorem.
A2 replay 566a91c8625dd1f17e13f7722b9286c0bd1b3402:
original probe rc=0, splice rc=0, patched build rc=1 at
ConjugatesOfJets.lean:60:5 unsolved goals. No A1/A2 new PASS.
Original LocalStatement build rc=0, 3199.21s; targeted_results
01b71a484e2e8c0236ff7d429d4809a5e687fb7d has all_requested_checks_ok=false.
Peer kernel/theta own these repairs; avoid duplicate cold build.
B2/C2 successful graph evidence stays separate. Local lean/lake absent;
no native engine execution, axiom audit or new kernel PASS for RUN84.
The following compact native finite-ramp and caller-cover certificate
is PREPARED; exact quartic cover and grid good-data composition have
the human proof above, not a claimed compiled theorem. No Main import.

RESUME HERE: replay this file at New.Endgame.PrimeError in the shared
compact environment (independently of heavy A1/A2 build), inspect first
elaboration error or exact axiom/direct-edge reports, and then connect
its quartic cover to RUN83's pointwise same-data calculation. Do not
claim the grid star premise or drop the full eventual Landau premise.
HANDOFF TO integration, editor, kernel, audit. RH remains OPEN.
-/

open ArithmeticFunction DirichletCharacter Complex Finset Filter
  MeasureTheory Nat Real vonMangoldt

namespace RHPrimeWindow84

theorem hinge (u v t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    max ((1-t)*u+t*v) 0 ≤ (1-t)*max u 0+t*max v 0 := by
  apply max_le
  · exact add_le_add
      (mul_le_mul_of_nonneg_left (le_max_left _ _) (sub_nonneg.mpr ht1))
      (mul_le_mul_of_nonneg_left (le_max_left _ _) ht)
  · positivity

theorem log_correction (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b)
    (hx : 0 < x) (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    (1-t)*Real.log a+t*Real.log b-Real.log x ≤ ((1-t)*a+t*b)/x-1 := by
  calc
    _ = (1-t)*Real.log (a/x)+t*Real.log (b/x) := by
      rw [Real.log_div ha.ne' hx.ne', Real.log_div hb.ne' hx.ne']
      ring
    _ ≤ (1-t)*(a/x-1)+t*(b/x-1) := add_le_add
      (mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos ha hx))
        (sub_nonneg.mpr ht1))
      (mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos hb hx)) ht)
    _ = _ := by ring

theorem reciprocal_curvature (a b x t : ℝ) (ha : a ≠ 0) (hb : b ≠ 0)
    (hx0 : x ≠ 0) (hx : 1/x = (1-t)/a+t/b) :
    ((1-t)*a+t*b)/x-1 = (x-a)*(b-x)/x^2 := by
  have h := hx
  field_simp [ha,hb,hx0] at h
  field_simp [hx0]
  nlinarith [h]

/-- Exact compact prime-error chord on a COMMON finite cutoff. -/
theorem primeError_chord (d M : ℕ) [Fact d.Prime] [NeZero M]
    (A : ℕ) (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b) (hx0 : 0 < x)
    (hA : a ≤ A) (hB : b ≤ A) (hX : x ≤ A)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) (hx : 1/x = (1-t)/a+t/b) :
    primeError d M x ≤ (1-t)*primeError d M a+t*primeError d M b+
      ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) := by
  let S (z : ℝ) := ∑ n ∈ Finset.Icc 1 A,
    lambdaClass d M n * ((A : ℝ)/n-(A : ℝ)/z)⁺ / (A : ℝ)
  let K := (logDerivMean d M 1).re
  have hRa : primeError d M a = S a-Real.log a/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A ha hA)
  have hRb : primeError d M b = S b-Real.log b/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A hb hB)
  have hRx : primeError d M x = S x-Real.log x/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A hx0 hX)
  have hS : S x ≤ (1-t)*S a+t*S b := by
    dsimp [S]
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_le_sum
    intro n hn
    have hn0 := (lambdaClass_nonneg_and_abs_le d M n).1
    have hid : (A : ℝ)/n-(A : ℝ)/x =
        (1-t)*((A : ℝ)/n-(A : ℝ)/a)+t*((A : ℝ)/n-(A : ℝ)/b) := by
      calc
        _ = (A : ℝ)/n-(A : ℝ)*(1/x) := by ring
        _ = _ := by rw [hx]; ring
    have hh : ((A : ℝ)/n-(A : ℝ)/x)⁺ ≤
        (1-t)*((A : ℝ)/n-(A : ℝ)/a)⁺+t*((A : ℝ)/n-(A : ℝ)/b)⁺ := by
      change max _ 0 ≤ (1-t)*max _ 0+t*max _ 0
      rw [hid]
      exact hinge _ _ t ht ht1
    calc
      _ ≤ lambdaClass d M n *
          ((1-t)*((A : ℝ)/n-(A : ℝ)/a)⁺+
            t*((A : ℝ)/n-(A : ℝ)/b)⁺)/(A : ℝ) :=
        div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hh hn0)
          (Nat.cast_nonneg A)
      _ = _ := by ring
  have hL := log_correction a b x t ha hb hx0 ht ht1
  have hL' : (1-t)*Real.log a+t*Real.log b-Real.log x ≤
      ((1-t)*a+t*b-x)/x := by
    calc
      _ ≤ ((1-t)*a+t*b)/x-1 := hL
      _ = _ := by field_simp [hx0.ne']
  have hLd := div_le_div_of_nonneg_right hL'
    (Nat.cast_nonneg (α := ℝ) (Nat.totient M))
  calc
    _ = S x-Real.log x/(Nat.totient M : ℝ)-K := hRx
    _ ≤ ((1-t)*S a+t*S b)-Real.log x/(Nat.totient M : ℝ)-K :=
      sub_le_sub_right (sub_le_sub_right hS _) _
    _ = (1-t)*primeError d M a+t*primeError d M b+
        ((1-t)*Real.log a+t*Real.log b-Real.log x)/(Nat.totient M : ℝ) := by
      rw [hRa,hRb]; ring
    _ ≤ _ := add_le_add_left hLd _

/-- Explicit cover interface; the quartic arithmetic and same-D supplier
are proved conditionally in the human argument, not hidden in this lemma. -/
theorem eventual_from_cover (d M : ℕ) [Fact d.Prime] [NeZero M]
    (U V W : ℝ → ℝ)
    (hcover : ∀ᶠ x in atTop, ∃ (A : ℕ) (a b t : ℝ),
      0 < a ∧ 0 < b ∧ 0 < x ∧ a ≤ A ∧ b ≤ A ∧ x ≤ A ∧
      0 ≤ t ∧ t ≤ 1 ∧ 1/x = (1-t)/a+t/b ∧
      primeError d M a ≤ U x ∧ primeError d M b ≤ U x ∧
      ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) ≤ V x)
    (hbudget : ∀ᶠ x in atTop, U x + V x ≤ W x) :
    ∀ᶠ x in atTop, primeError d M x ≤ W x := by
  filter_upwards [hcover,hbudget] with x hc hW
  obtain ⟨A,a,b,t,ha,hb,hx,hA,hB,hX,ht,ht1,hr,haU,hbU,hV⟩ := hc
  calc
    _ ≤ (1-t)*primeError d M a+t*primeError d M b+
        ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) :=
      primeError_chord d M A a b x t ha hb hx hA hB hX ht ht1 hr
    _ ≤ (1-t)*U x+t*U x+V x := add_le_add
      (add_le_add (mul_le_mul_of_nonneg_left haU (sub_nonneg.mpr ht1))
        (mul_le_mul_of_nonneg_left hbU ht)) hV
    _ = U x+V x := by ring
    _ ≤ W x := hW

end RHPrimeWindow84

#print axioms RHPrimeWindow84.hinge
#print axioms RHPrimeWindow84.log_correction
#print axioms RHPrimeWindow84.reciprocal_curvature
#print axioms RHPrimeWindow84.primeError_chord
#print axioms RHPrimeWindow84.eventual_from_cover
