import New.Endgame.OneSidedCriterion

/-!
# Compact RUN52 — signed cumulative determinant budget at actual Landau consumer
2026-11-26. Human conditional reduction and prepared scalar caller adapter,
NOT COMPILED. Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 0abe4d55e789dd229081d1161cb7736895fe9885. Read updated unified
determinant witness (7ad9c7c64f53c621ad20422226ad9d0b756ee28e), manuscript
69030b2d01e9f0e786a004a21b6f0043ef84bc64, AGENTS, protocol, queue, expansion.
Peer checkpoints 4bf307880263632fba918a9ad9fb82a8081488a1 (comparison),
95a78062f9edb3256844a71686eb6b859a5f658c (unified determinant),
5441bebcfcdc978a46a39aedb1c24f3de8d3fb6d (data/height),
20af1d26d5ffcef30e0deabfaafe30c89540c61b (frequency).
Do not duplicate manuscript's completed pointwise Landau, density or Data
construction. This fallback removes the need for a uniform determinant
budget at EVERY scale, if the remaining suppliers can provide a signed
integrated budget instead. No new arithmetic estimate is asserted.

Source anchors:
New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2
New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3
Lib/Analytic/Landau/PolarLandau.lean 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9
Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185
No import of New.Main or Main.

1. Independent source-level audit of manuscript §§6a–c.
The exact logDerivMean normalization uses F(s)=s/[phi(M)(s-1)]+D(s).
The ramp integral is F(s)/[s(s-1)], so subtracting log and constant gives
Phi(s)=(D(s)/s-Re D(1))/(s-1). D(1) real by conjugate pairing; s=1
removable. The fixed-modulus tail estimate follows from the centered
weighted PNT with M,d fixed BEFORE x tends to infinity. At x1 with
log x1=x^(epsilon/6), this is o(x^-A) for every fixed A, even after
multiplication by #tops/#thick <= x^epsilon.
Data record checked: m=2^ceil(log_2 sqrt x), r=3^ceil(log_3 x^5),
s=22 log_2 m. H=N0*3^(floor(log_3 s)+5), Q=(N0*d)^(2(s+6)).
Since s<=32 log x, log Q<= (64 log x+12) log(N0*d), hence
Q<=W^A for fixed A>384 log(N0*d)/epsilon, W=x^(epsilon/6), eventually.
Siegel–Walfisz with error exponent D>A+2 applied at exp U and 2 exp U
is uniform for U>=W. Prime-power contribution O(exp(U/2)(U+1)^2)
is negligible uniformly; intervals of width log 2 suffice. The native
special primes require b^10<=g_i<=b^11, not log g_i in an interval
of length sqrt(log b) specifically; the class-group pair constructed
in §6c satisfies this. Native norm_piG is alpha*star(alpha)=g0*g1
in O_K, which follows from the positive quadratic field norm.
The Behrend count and order calculation in §6c keep the actual
two_pow_dvd_N1 reduction modulus 2^(s+1). No growing-modulus fixed-PNT
shortcut. These are source-level checks, not an independent native replay.

2. New integrated criterion, exact normalization.
Fix M,d with the native guards, let R(x)=primeError d M x, and
E(v)=R(exp v). Let A(v)=exp(-v)*int_0^v E(u)exp(u)du for v>=0
(and 0 for v<0). Equivalently A(log X)=X^-1 int_1^X R(y)dy.
The actual E is continuous (each finite ramp is continuous across
integer cutoffs); E=O(exp v) from IsPolar. Consequently A is continuous,
measurable and O(exp v). For Re s>2, absolute Fubini gives
  integral_0^infty A(v) exp((1-s)v)dv
  = integral_0^infty E(u)exp(u) [integral_u^infty exp(-s v)dv]du
  = Phi(s)/s.
This uses absolute domination by C exp((2-Re s)u)/Re s.
Phi/s is meromorphic globally (s=0 is outside the required positive
half-plane). (s-1)Phi(s)/s is analytic on Re s>=1. For every rho with
Re rho>0 its punctured limit is exactly r(rho)/rho. Thus the actual
A satisfies IsPolar with divided residue, mathematically. At every real
a>beta>0, Re(r(a)/a)=Re(r(a))/a, so the sign in Landau is unchanged.
At the candidate zero rho the multiplier 1/rho is nonzero. Hence the
native quadratic-twist witness selection and the Landau proof apply
unchanged if, instead of R(X)<=X^(beta-1), one has
  integral_1^X R(y)dy <= C X^beta eventually, C finite positive.
To absorb C into the native coefficient one, choose beta<beta'<Re rho;
the twist witness can still be selected zero-free from beta (and hence
beta'). No exceptional real pole or cancellation is introduced.

The exact single weighted-prime-power equation is, writing K=Re D(1):
  A(log X) =
    sum_{n<=X} lambdaClass(d,M,n) *
       [1/n - (1+log(X/n))/X]
    - (log X-1+1/X)/phi(M) - K*(1-1/X).
The formula follows by integrating each ramp from n to X; lambda(1)=0.
There is no change of centering or residual O(1) term. The Run51
proper-prime-power correction T(y)=O(y^(-2/3) log^2 y) yields
X^-1 int_1^X T(y)dy=O(X^(-2/3)log^2 X), so the prime-only criterion
with its exact Run51 centering also works. This new equation is a
conditional sufficient criterion, not an established prime inequality.

3. Exact connection to the unified determinant contract (U),(W),(S).
For a Data witness at each sufficiently large x, let
 S(D)=m*remainder-logB^2*budget; Z(D)=m*a*#thick>0.
Using the manuscript's original-scale data and exact remainder_eq:
 R_M(x) = S(D)/Z(D) + logB^2*budget/Z(D)
           + R_M(x1)-(#tops/#thick)*R_1(x1).
The second term <=phi(M)*x^(6epsilon-1/2) and the last is O(x^-1)
by fixed-modulus PNT, uniformly over those original-scale Data witnesses.
Suppose some locally integrable REAL slack function h(x) has, for each
large x, ONE original-scale admissible Data witness with S(D)/Z(D)<=h(x)
and integral_{x0}^X h(x)dx <= C X^(1/2+8epsilon) eventually.
No measurable choice of D is necessary: the scalar domination by h is
pointwise. Do not replace h by |h| or h_+ before summing. Integrating
the displayed exact identity yields integral_1^X R_M <=
 O(X^(1/2+8epsilon)), because epsilon>0, and the lower range is compact.
Then the new criterion supplies the same RH-only contradiction with
1/2+8epsilon<beta'<Re rho. Thus the uniform S(D)<=0 requirement may
be replaced by one signed integrated bound, if a proof of that bound
exists from actual A/B/C suppliers. It neither assumes independent
row/twist choices within D nor proves the required bound. Retain
same-row and same-fit-twist witnesses in each determinant calculation.
Do not replace the current pointwise path unless a supplier can
actually establish this weaker integrated premise.

Original source-level graph (unchanged):
 A+B+C -> star; DataExist + star + second-scale -> primeError bound
 -> twist selection + polar identity + IsPolar.landau -> right strip -> RH.
Current manuscript alternative: fixed-modulus PNT replaces second-scale.
Candidate graph: same DataExist + same-witness normalized determinant slack
 -> signed integral budget -> A bound; polar identity -> A polar;
 twist selection + A polar + A bound -> IsPolar.landau -> same strip.
No pruning of shared source nodes claimed. Unresolved: A local Schur/marked/
Fourier stage inputs, B coherent energy and local geometry, C fit/Selmer
and comparison/Rallis inputs, and (if using this alternative) integrated
slack itself. No root-reaching new closure. Native original run jobs
45577239749 and 45576756833 both reported success on query 26 Nov;
not evidence for this compact certificate. Lean/lake absent locally.
Current compact replay is not claimed successful; no axiom export for
new adapter. Expected foundations are classical, but use actual #print
axioms before reporting any new kernel result.
RESUME HERE: integration retain the pointwise manuscript route unless a
geometry supplier yields signed cumulative slack with the displayed
normalization; no need for further Landau endpoint optimization. Audit
the exact A/B/C quantitative suppliers against (U),(W),(S), concentrating
on missing local Bessel energy and denominator/Schur estimates.
HANDOFF TO: integration, audit, positivity geometry, kernel (prepared
adapter only; the Fubini/IsPolar lift is human-derived and not formalized).
-/

open Complex Filter Real

namespace CompactRun52

-- Actual native Landau consumer, with explicit transported polar premise.
-- This proves the residue implication only, not the Fubini construction.
theorem landau_divided_residue {A : ℝ → ℝ} {r : ℂ → ℂ} {β : ℝ}
    (hA : IsPolar A (fun z ↦ r z / z)) (hβ : 0 < β)
    (hr : ∀ x : ℝ, β < x → 0 ≤ (r (x : ℂ) / (x : ℂ)).re)
    (hw : ∀ᶠ v in atTop, A v ≤ ((β - 1) * v).exp)
    {ρ : ℂ} (hρ : β < ρ.re) : r ρ = 0 := by
  have h := hA.landau hβ hr hw hρ
  have hne : ρ ≠ 0 := by
    intro e
    subst ρ
    simp at hρ
    linarith
  exact (div_eq_zero_iff.mp h).resolve_right hne

#print axioms landau_divided_residue

end CompactRun52
