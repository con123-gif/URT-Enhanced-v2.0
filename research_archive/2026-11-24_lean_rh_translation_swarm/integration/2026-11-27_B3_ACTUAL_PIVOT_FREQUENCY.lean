import New.Filling.GlobalSieve

/-!
# B3: actual pivot-frequency decay, not a new uniform estimate
27 November 2026. SOURCE-MATCHED HUMAN DERIVATION; native candidate uncompiled.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/New/Filling/GlobalSieve.lean blob
0ad01a3eec4c5dcd2a51bb1d9773f7834970e372, sum_frequencies_le and sieve;
New/Filling/Setup.lean blob 622e7ebe5c04b7ae87652e460762da7fb2e40727
(frameScaleSq, one_le_abs_kappa); New/Filling/EichlerFlag.lean blob
3da2606a049a092719b779802cb8ead3af7141ce (dampedPower, SieveSystem.pi);
New/Filling/BesselSystem.lean blob 847e2869ed2c189c30f6efef85e7c1c1f2451058
(HasBandLimits); New/Filling/Moments.lean blob ec2cb964ede0d5eeae41a077dc6dbfface9c0444
(energy_fixingSet_le). Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87c621d0d18103ec2eb9be14bf774b8bff2a747d, 2c9e5148a947ff4b28482afd18c4d7c810af97d5.
Previous integration 9dfa0dc9 (pivot budget) and 5bb32ae1 (relaxed link energy)
are not assumed kernel-verified. Latest peer C2 fit-to-star ece1c4fa6 and
explicit-unit reference 1d6e453b are separate, as is editor bd7dce3c.
Shared C1 run 46055305146 actually in_progress at lookup; not a B3 receipt.
No protected workflow edits and no duplicated cold builds.

RESULT. The frequency supplier of the previous pivot-budget candidate
can be derived from the ORIGINAL native sum_frequencies_le without a
new number-theoretic estimate. Keep the same admissible data, same
T, same real/finite Bessel systems, same arbitrary c and finite X
satisfying the original hP hypotheses, and same upper bound B>=1.
Write rho=𝔰.ϱ, K=𝔰.k-𝔰.n^7 (natural subtraction), t_v=|S.kappa v|>=1,
G=S.g>0, N=S.N>0. The real scale is exactly
  l_a(v)=t_v^(2*(rho-a))/N (natural subtraction).
Set
  x_a(v)= t_v^(2*(rho-a)+1)/(G*N).
The original sieve uses x_0 at EVERY pivot, applying Nat.sub_le
before the frequency lemma. Instead,
  ||c_v/l_a(v)||^(-1) = ||c_v||^(-1)*l_a(v) <= x_a(v) <= x_0(v) <= B.
This is also true for the totalized inverse when c_v=0. For each a,
apply sum_frequencies_le with that x_a, c'=c/l_a and the SAME B.
It bounds the precise finite sum in the candidate lemma below by
  F_a = prod_v[x_a(v)^K * (b*B^2)^3] * (b*rootDiscr(E))^(3f).
All constants are positive; retain the original upper-bound B and
the nonzero, T-integral conditions on EVERY y in X. No lattice/measure
change. The beta of (h'.pi h) multiplies this sum by the a-independent
factor C = prod_v(𝔰.bandConst*b^(2000*𝔰.n^9)) * b^(𝔰.n^9*f).
By exact cancellation before taking any new norms,
  F_a = F_0 * Q^min(a,rho),
  Q = prod_v t_v^(-2*K) in (0,1].
Indeed 2*(rho-a)+1+2*min(a,rho)=2*rho+1.
Therefore the actual hP premise for all natural a is supplied by
  eps_a = eps_0 * Q^min(a,rho), eps_0=C*F_0.
IMPORTANT: using Q^a for ALL natural a is false when a>rho and Q<1;
the native theorem quantifies over all a, even though its caller uses
only a<=rho. Use min or retain the original all-a quantifier.

With the ORIGINAL uniform head bound Gamma from GlobalSieve.sieve,
the PREVIOUS (not yet replayed) pivot-budget lemma would give
  error <= Gamma*eps_0*(1+2*sum_{a=1}^rho Q^a)
rather than (2*rho+1)*Gamma*eps_0. This is no larger; if Q<1 the
parenthesis is at most (1+Q)/(1-Q), independent of rho as a bound
for the fixed Q. If Q=1 keep the original factor. No strict
quantitative saving on the actual data is claimed without a
source-bound lower bound on prod_v t_v and the native replay.
In particular this does not delete sum_frequencies_le or its
arithmetic/lattice suppliers, the head estimate, the packet bound,
or B1-B4. It is an actual frequency supplier for the alternate
B3 caller; not a closed energy bound or RH.

Failed route: extrapolating Q^a beyond rho would strengthen hP
without justification; the frame scale saturates. Also no need to
assume kappa positive (only its absolute value matters).
Executed local Python 3 stdlib Fraction check:
  kap=(F(-2),F(3,2)); rho=3; g=5; N=7; k=4
  x=lambda a,v: abs(kap[v])**(2*max(rho-a,0)+1)/(g*N)
  frame=lambda a,v: kap[v]**(2*max(rho-a,0))/N
  base=prod(x(0,v)**k for v in range(len(kap)))
  Q=prod(abs(t)**(-2*k) for t in kap)
  for a in range(rho+3):
      assert all(x(a,v)==abs(kap[v])*frame(a,v)/g for v in range(len(kap)))
      assert prod(x(a,v)**k for v in range(len(kap)))==base*Q**min(a,rho)
      assert all(x(a,v)<=x(0,v) for v in range(len(kap)))
  assert prod(x(rho+1,v)**k for v in range(len(kap)))!=base*Q**(rho+1)
Actual output: six pivots (including two saturated), exact identities
and monotonicity; unsaturated formula at rho+1 rejected; Q=1/6561.
Scalar controls only, not arithmetic data of an admissible CM field.
Local command -v lean/lake yielded no executable. Native code below
PREPARED, not compiled. No rh_scan/prune/reduce/auto/frontier or
new axiom/dependency results. Original graph unchanged; proposed
supplier path: sieve -> pivot-budget candidate -> pivot-frequency
supplier -> sum_frequencies_le. Root still open. Do not import Main.

RESUME HERE: on the shared authenticated compact GlobalSieve cache,
compile the previous pivot-budget file together with the new
sum_frequencies_le_actual_pivot candidate below; inspect actual
Lean output, then use this supplier in the actual sieve caller with
eps_a defined by the saturated formula. Retain all original head and
packet premises. No PASS until actual replay.
HANDOFF TO integration / B3 / native runner.
-/

namespace Filling
open NumberField ENNReal Finset Fintype MeasureTheory Measure Real AddSubgroup Matrix ComplexOrder
  SemilocalField Complex
variable {E} [Field E] [CMType E] {𝔰} (S : Filling E 𝔰) (T : Finset (FinPlace E))

/-- Actual pivot specialization of the native frequency estimate. The bound
B on the pivot-zero scales suffices uniformly for every natural pivot. -/
lemma sum_frequencies_le_actual_pivot [WeilData E] [T.StarStable] [S.IsAdmissible]
    (a k : ℕ) (B : ℝ) (X : Finset E) (c : InfinitePlace E → ℂ)
    (hB : 1 ≤ B)
    (hc : ∀ v, ‖c v‖⁻¹ ≤ |S.kappa v| / S.g)
    (hmax : ∀ v, |S.kappa v| ^ (2 * 𝔰.ϱ + 1) / (S.g * S.N) ≤ B)
    (hy : ∀ y ∈ X, y ≠ 0 ∧ y ∈ ratIntegralOff T) :
    ∑ y ∈ X, (∏ v, dampedPower k ‖(c v / S.frameScaleSq v a) * Φ v y‖⁻¹) *
      (√(genIndex (ratToPlaces T y)) ^ k / denomIndex O (ratToPlaces T y) ^ 6) ≤
      (∏ v, (|S.kappa v| ^ (2 * (𝔰.ϱ - a) + 1) / (S.g * S.N)) ^ k *
        (S.b * B ^ 2) ^ 3) * (S.b * rootDiscr E) ^ (numInfPlaces E * 3) := by
  let x (v : InfinitePlace E) : ℝ :=
    |S.kappa v| ^ (2 * (𝔰.ϱ - a) + 1) / (S.g * S.N)
  have hx0 (v : InfinitePlace E) : 0 ≤ x v := by
    dsimp [x]
    positivity
  have hx (v : InfinitePlace E) :
      ‖c v / S.frameScaleSq v a‖⁻¹ ≤ |x v| ∧ |x v| ≤ B := by
    rw [abs_of_nonneg (hx0 v)]
    constructor
    · calc
        _ = ‖c v‖⁻¹ * S.frameScaleSq v a := by
          simp [div_eq_mul_inv, norm_mul, norm_inv, abs_of_pos (S.frameScaleSq_pos v a),
            mul_comm]
        _ ≤ (|S.kappa v| / S.g) * S.frameScaleSq v a :=
          mul_le_mul_of_nonneg_right (hc v) (S.frameScaleSq_pos v a).le
        _ = x v := by
          dsimp [x, frameScaleSq]
          rw [← pow_abs_two_mul, pow_succ]
          simp only [div_eq_mul_inv, mul_inv]
          ring
    · dsimp [x]
      exact (div_le_div_of_nonneg_right
        (pow_le_pow_right₀ (S.one_le_abs_kappa v) (by omega)) (by positivity)).trans (hmax v)
  have habs : ∀ v, |x v| = x v := fun v ↦ abs_of_nonneg (hx0 v)
  simpa only [habs, x] using
    S.sum_frequencies_le T B k X (fun v ↦ c v / S.frameScaleSq v a) x hB hx hy

#print axioms sum_frequencies_le_actual_pivot

end Filling
