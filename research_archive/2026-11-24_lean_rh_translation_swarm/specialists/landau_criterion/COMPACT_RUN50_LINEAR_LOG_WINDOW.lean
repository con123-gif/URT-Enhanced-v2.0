import New.Endgame.OneSidedCriterion

/-!
# COMPACT RUN50 — linear logarithmic second-scale window
26 Nov 2026. HUMAN SOURCE-MATCHED derivation, scalar Lean certificate PREPARED,
not compiled. This is a strengthening of an actual compact analytic supplier,
not an independent RH conjecture or new unconditional RH proof.

Latest ONE_EQUATION_MISSION blob 3731f12ed73e738313fd7f93a30759d9086141e9
migrates primary work to lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge with Claude and compact collaborators, including Anthropic.
Original pin 40e56bab026552e089d7afcfeff08d2defb9c005 and RUN49 preserved.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity,
research state and queue excerpts, shared compact manuscript b46a4489,
peers da61f448 (thick places), 284991cd (fixed modulus), 5fb8da26 (centered B),
de382b26 (shared kernel job), 03751400 (volume factor). No duplicate build.

## Source anchors (actual bodies retrieved)
New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3:
IsPolar.eventually_moment_le, IsPolar.exists_window_sub_mul_le,
entireL_ne_zero_of_primeError_le.
Lib/Analytic/Landau/PolarLandau.lean 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9:
IsPolar, laplace_pow, IsPolar.landau.
New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2:
isPolar_primeError, primeError_eq_sum.
Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11:
exists_entireL_quadTwist_ne_zero and zero_density_quadTwist.
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65:
eventually_primeError_le_rpow uses the second-scale window at t=10^6 log x,
X=towerDeg D.s / #D.thick, before updating logX1 in the SAME D.

## Strengthened second-scale lemma (human proof)
For any two native polar E,E', there is a fixed C>1, depending on E,E' only,
such that for all sufficiently large t and every 0<=X<=exp(t), some
u in [t,Ct] has E(u)-X E'(u)<=exp(-t).
The native result has [t,t^2]. This is stronger eventually, not a weaker
hypothesis on E,E'. No hypothesis on zeros other than the native IsPolar
analyticity/residue data is introduced.

By the joint native eventually_moment_le, fix 3<R<=4 in their common
right neighborhood of 3. For all sufficiently large t, for each E and E':
  |E(v)| <= t exp(v) for v>=0;
  I_k(E)=integral_0^infty v^k exp(-3v) E(v) dv,
  |I_k(E)| <= k! t/R^k, for ALL k, with integrability.
The same t works simultaneously for E' and the whole moment sequence.
Set a=log(R/3)>0, K=6/a, C=5+K log 3, k=ceil(Kt). In particular C>1.
For t>=0 and 0<=X<=exp(t),
  t+tX+1 <= (1+t)+t exp(t) <= exp(2t)
since 1+t<=exp(t). Consequently for v>=0
  exp(-3v)(E(v)-XE'(v)-exp(-t)) >= -exp(2t-2v).
Assume the desired inequality fails throughout [t,Ct]. The expression
  Q(v)=exp(4t-Rv)+exp((2-C)t-v)
       +exp(-3v)(E(v)-XE'(v)-exp(-t))
is then nonnegative on (0,infty):
for v<=t, the first term dominates exp(2t-2v), as
4t-Rv-(2t-2v)=2t-(R-2)v>=0;
for v>=Ct, the second term dominates exp(2t-2v), as
(2-C)t-v-(2t-2v)=v-Ct>=0.
In the middle the signed third term is nonnegative. Integrate Q
against v^k>=0. All terms integrable by the native moments and laplace_pow.
Divide the resulting nonnegative integral by the STRICTLY POSITIVE
D_k=exp(-t) k!/3^(k+1). The exact signed subtraction of the constant gives
  0 <= integral(v^k Q)/D_k
     <= exp(5t) (3/R)^(k+1)
        + exp((3-C)t) 3^(k+1)
        + 3 exp(t)(t+tX)(3/R)^k - 1.
Do not apply a norm to the negative baseline. Using Kt<=k<=Kt+1,
the three positive terms are bounded respectively by exp(-t),
9 exp(-2t), and 3 exp(-3t). Their sum tends to zero, uniformly in X.
This contradicts the nonnegative integral for all sufficiently large t.
Thus the stated linear window holds.

## Actual consumer and impact
For P fixed take E(v)=primeError P.d P.N0 (exp v), E'(v)=primeError
P.d 1 (exp v); their IsPolar proofs are the native isPolar_primeError
with the existing coprimality and d=7 mod 8 conditions. With
t=10^6 log x the new point satisfies
  x^(10^6) <= x1 <= x^(10^6 C)
and the same signed correction <= x^(-10^6).
C depends on the fixed P (not on x or X), as permitted by eventually
quantifiers; no uniformity over d is claimed. For t>=C, Ct<=t^2,
so all existing D' admissibility/scale guards follow EXACTLY as in
the original caller. In particular no change to the native A/B/C
same-family witness, remainder_eq, or x^(-1/2+8epsilon) final bound.
The optional restricted second-scale domain is polynomial in x;
this is not a measured computational speedup.

Old selected static graph:
Main -> New.grh -> eventually_primeError_le_rpow -> window_sub_mul_le
 -> eventually_moment_le + laplace_pow + IsPolar.
New candidate:
same caller -> linear_window (human proof above) -> SAME moment and
Laplace suppliers -> original [t,t^2] adapter by t>=C.
Retain also exists_data, star_inequality, remainder_eq, twist nonvanishing,
Landau, changeLevel and functional equation. No global edge deletion.
The real-pole sign in entireL criterion still needs every twist nonzero
on the chosen half-strip; native zero-density supplies one common d
for all characters, and the residue at a hypothetical original zero
rho is a positive integer sum divided by phi(M)rho(1-rho), hence
nonzero for 1/2<Re rho<1. At real points in (beta,1) this is nonnegative;
at >=1 entireL_ne_zero gives no orders, and at 1 the normalized
transform's singularity is removable. All auxiliary characters retained.

## Execution and verification
Local command -v lean / lake returned neither. Shared compact CI status
compute/rh-compact-union-graph-20261126/status.json blob
ea44d71556e0d21703e72fcd61bbaf2bee0ec563, 08:12:49 UTC:
returncode 1, RESOURCE_BLOCKED: runner below publisher build recommendation.
No compact kernel graph, no certificate replay or axiom report obtained.
Do not reuse old-pin CI as new-pin evidence. Publisher README blob
85d43d83a7fa3b496968ce9216f4a7d75e44e84a reports compact build, kernel
replay and Comparator accepted with propext, Classical.choice, Quot.sound;
that is external evidence, not a local run.
No new unconditional root obligation claimed discharged. Scalar proofs
below are candidates for native replay, not the full integral proof.
No synthetic arithmetic tests or URT benchmark; inequalities are exact.
RESUME HERE: kernel-check the scalar lemmas and port the human linear-window
integral proof to the native IsPolar.eventually_moment_le and laplace_pow;
then substitute at the actual eventually_primeError_le_rpow caller without
importing New.Main. If resources remain blocked, integrate the human
second-scale proof and retain original native theorem as fallback.
HANDOFF TO: integration, prime-window, kernel and editor; compact pin only.
-/

namespace CompactLandauRun50
open Real

-- These are the precise two tail exponent comparisons used before integration.
theorem lower_tail_exponent {R t v : ℝ} (hR : R ≤ 4)
    (hv : 0 ≤ v) (hvt : v ≤ t) :
    2*t-2*v ≤ 4*t-R*v := by
  nlinarith [mul_nonneg (sub_nonneg.mpr hR) hv]

theorem upper_tail_exponent {C t v : ℝ} (hv : C*t ≤ v) :
    2*t-2*v ≤ (2-C)*t-v := by
  linarith

-- The logarithms of the three normalized positive terms.
-- a = log(R/3), L = log 3, C = 5 + K*L, k = ceil(K*t).
theorem first_ratio_exponent {a K t k : ℝ} (ha : 0 ≤ a)
    (ht : 0 ≤ t) (hK : 6 ≤ K*a) (hk : K*t ≤ k) :
    5*t-(k+1)*a ≤ -t := by
  nlinarith [mul_nonneg (sub_nonneg.mpr hk) ha,
    mul_nonneg (sub_nonneg.mpr hK) ht]

theorem second_ratio_exponent {K L t k : ℝ} (hL : 0 ≤ L)
    (hk : k ≤ K*t+1) :
    (3-(5+K*L))*t+(k+1)*L ≤ -2*t+2*L := by
  nlinarith [mul_nonneg (sub_nonneg.mpr hk) hL]

theorem third_ratio_exponent {a K t k : ℝ} (ha : 0 ≤ a)
    (ht : 0 ≤ t) (hK : 6 ≤ K*a) (hk : K*t ≤ k) :
    3*t-k*a ≤ -3*t := by
  nlinarith [mul_nonneg (sub_nonneg.mpr hk) ha,
    mul_nonneg (sub_nonneg.mpr hK) ht]

theorem uniform_X_budget {t X : ℝ} (ht : 0 ≤ t) (hX : X ≤ exp t) :
    t+t*X+1 ≤ exp t * exp t := by
  have h := Real.add_one_le_exp t
  have h1 := mul_le_mul_of_nonneg_left hX ht
  have h2 := mul_le_mul_of_nonneg_right h (Real.exp_pos t).le
  nlinarith

-- Exact implication back to the original admissible native window.
theorem window_inclusion {C t u : ℝ} (ht : 0 ≤ t) (hC : C ≤ t)
    (hu : u ≤ C*t) : u ≤ t^2 := by
  calc
    u ≤ C*t := hu
    _ ≤ t*t := mul_le_mul_of_nonneg_right hC ht
    _ = t^2 := by ring

#print axioms lower_tail_exponent
#print axioms upper_tail_exponent
#print axioms first_ratio_exponent
#print axioms second_ratio_exponent
#print axioms third_ratio_exponent
#print axioms uniform_X_budget
#print axioms window_inclusion
end CompactLandauRun50
