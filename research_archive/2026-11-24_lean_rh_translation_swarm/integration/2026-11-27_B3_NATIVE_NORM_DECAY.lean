import New.Filling.GlobalSieve

/-!
# B3: actual admissible-data norm controls the Poisson pivot decay
27 November 2026. SOURCE-MATCHED HUMAN DERIVATION; Lean candidate UNCOMPILED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read live mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Native Setup.lean blob 622e7eebe5c04b7ae87652e460762da7fb2e40727:
abs_kappa_eq, varpi_ne_zero, le_g, thousand_le_b, pow_le_k, k_le_f, ϱ_le.
Lib/Adelic/Adeles/AdditiveCharBasic.lean blob b06d14a9dc6bfe9d3cefa43f038fb54d72de698e:
one_le_prod_norm_Φ, abs_norm_eq_prod_norm_sq.
GlobalSieve.lean blob 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372.
Use corrected adjacent-pivot certificate blob 8b9a9e4f89cf4a344daf3097728307dae2d60320
and actual-pivot supplier b0ab9e5ec7ebfdba85101b50d9c33e73581b756a.
Do NOT use the earlier same-pivot accumulation.
Latest editor dc05f5650 extracts the original coherent link supplier;
character boxes 3d971d9bf fuses C2 to star; separate routes, not duplicated.
Shared C1 run 46055305146 actually in_progress; registry has shared B3
direct-chart replay but not these Poisson replacements. No native B3 receipt.

RESULT: Q is strictly tiny on the SAME native admissible data, not merely
<= 1 and not an illustrative choice of kappa. Let f=numInfPlaces E,
K=k-n^7, n=rho+1, P=prod_v |kappa_v|. Setup gives
  |kappa_v|=g*||Phi_v(varpi)||/(2*pi).
Use native one_le_prod_norm_Φ for the nonzero integral varpi to get
  P=(g/(2*pi))^f * prod_v ||Phi_v(varpi)||
   >= (g/(2*pi))^f >= b^(18*f),
because g>=b^19, b>=1000>2*pi. This is an aggregate norm identity,
NOT a claim that each individual |kappa_v| is >= b^18. The latter
would not follow from a field norm alone.
The native k>=1000*(2*rho+2)^9 and rho>=10^5 imply K>=1;
k<=f implies f>=1. Consequently the actual previous decay ratio is
  Q=prod_v |kappa_v|^(-2*K)=P^(-2*K)
   <= b^(-36*f*K) <= b^(-36) <= 10^(-108).
All powers are of positive real bases, K is natural subtraction,
and the conclusion is uniform in admissible S. No arbitrary field
or independent normalization is chosen.

For the corrected adjacent-pivot recurrence and the SAME uniform
head bound Gamma and initial error eps0, the coefficient is
  L_rho=1+sum_(i=1)^rho (Q^i+Q^(i-1))
        =[2-(1+Q)Q^rho]/(1-Q)
        <= 2/(1-Q) <= 2+3Q <= 2+3*b^(-36).
The penultimate inequality uses Q<=1/3 and multiplication by
1-Q>0: (2+3Q)(1-Q)-2=Q*(1-3Q)>=0.
This is a >100000-fold reduction of the ORIGINAL coefficient
2*rho+1 >=200001 at the smallest allowed b and rho, and uniformly
thereafter. It is a mathematical error-budget comparison, not a
runtime benchmark or an unconditional sieve/energy proof. The leading
epsilon_0 and Gamma, positivity, frequency sums, Bessel/head/packet
inputs and all original arithmetic premises remain unchanged.
The bound only applies to the alternative adjacent-pivot proof once
that actual caller is verified. It does not retire any root obligation.

Failed route: trying to bound every embedding of varpi separately is
unnecessary and not implied by the norm. Use the existing product lemma.
Executed local Python 3 Fraction boundary checks:
  b=1000; rho=100000; q=Fraction(1,b**36)
  assert 2/(1-q)<=2+3*q
  assert Fraction(2*rho+1,1)/(2+3*q)>100000
Actual output: both exact inequalities hold. These scalar checks
are not Lean or tests of the original arithmetic proof.
Local command -v lean / lake returned no executable.
Prepared candidate below has explicit hK,hf in the second lemma;
their native premises are discharged in the human argument above,
but the Lean caller adapter is still to be elaborated.
No new rh_scan/prune/reduce/auto/frontier execution or axiom audit.
Original dependency graph preserved; proposed added supplier is
Setup.abs_kappa_eq + one_le_prod_norm_Φ -> Q bound -> corrected budget.
No Main import, no workflow edits, no repeated cold build.

RESUME HERE: compile the adjacent-pivot and actual-frequency candidates
with this norm bound in the existing authenticated B3 workspace; inspect
the successor branch and hK,hf adapter, then attach the exact result to
GlobalSieve.sieve. Require actual compiler and axiom/graph receipts.
HANDOFF TO integration / B3 / native runner. RH remains OPEN.
-/

namespace Filling
open NumberField Real Finset Fintype
variable {E} [Field E] [CMType E] {𝔰} (S : Filling E 𝔰)

lemma integration_prod_abs_kappa_ge_b18
    (hf : 1 ≤ Fintype.card (InfinitePlace E)) :
    (S.b : ℝ)^18 ≤ ∏ v, |S.kappa v| := by
  have hb : (1000 : ℝ) ≤ S.b := by exact_mod_cast S.thousand_le_b
  have hg : (S.b : ℝ)^19 ≤ S.g := by exact_mod_cast S.le_g
  have hp : 0 < 2 * Real.pi := by positivity
  have hpi : 2 * Real.pi ≤ (S.b : ℝ) := by linarith [Real.pi_lt_four]
  have h1 : (S.b : ℝ)^18 ≤ (S.g : ℝ)/(2*Real.pi) := by
    apply (le_div_iff₀ hp).2
    calc
      _ ≤ (S.b : ℝ)^18 * S.b :=
        mul_le_mul_of_nonneg_left hpi (by positivity)
      _ = (S.b : ℝ)^19 := by ring
      _ ≤ _ := hg
  have hb1 : (1 : ℝ) ≤ S.b := by linarith
  have hbase : 1 ≤ (S.g : ℝ)/(2*Real.pi) :=
    (one_le_pow₀ hb1).trans h1
  have hn : 1 ≤ ∏ v, ‖Φ v S.ϖ.val‖ :=
    one_le_prod_norm_Φ S.ϖ.2 S.varpi_ne_zero
  calc
    _ ≤ (S.g : ℝ)/(2*Real.pi) := h1
    _ ≤ ((S.g : ℝ)/(2*Real.pi)) ^ Fintype.card (InfinitePlace E) := by
      simpa using pow_le_pow_right₀ hbase hf
    _ ≤ ((S.g : ℝ)/(2*Real.pi)) ^ Fintype.card (InfinitePlace E) *
        (∏ v, ‖Φ v S.ϖ.val‖) :=
      le_mul_of_one_le_right (by positivity) hn
    _ = ∏ v, |S.kappa v| := by
      rw [← Finset.prod_const, ← Finset.prod_mul_distrib]
      apply Finset.prod_congr rfl
      intro v hv
      rw [S.abs_kappa_eq]
      ring

lemma integration_pivot_ratio_le_b36 (K : ℕ) (hK : 1 ≤ K)
    (hf : 1 ≤ Fintype.card (InfinitePlace E)) :
    ((∏ v, |S.kappa v|)^(2*K))⁻¹ ≤ ((S.b : ℝ)^36)⁻¹ := by
  let P : ℝ := ∏ v, |S.kappa v|
  have hb : (1 : ℝ) ≤ S.b := by
    have h : (1000 : ℝ) ≤ S.b := by exact_mod_cast S.thousand_le_b
    linarith
  have h := S.integration_prod_abs_kappa_ge_b18 hf
  have hP : 1 ≤ P := (one_le_pow₀ hb).trans h
  have hp : (S.b : ℝ)^36 ≤ P^(2*K) := calc
    _ = ((S.b : ℝ)^18)^2 := by ring
    _ ≤ P^2 := pow_le_pow_left₀ (by positivity) h _
    _ ≤ _ := pow_le_pow_right₀ hP (by omega)
  change (P^(2*K))⁻¹ ≤ ((S.b : ℝ)^36)⁻¹
  simpa only [one_div] using one_div_le_one_div_of_le (by positivity) hp

lemma integration_adjacent_factor_bound (q : ℝ) (hq : 0 ≤ q)
    (hsmall : q ≤ 1/3) : 2/(1-q) ≤ 2+3*q := by
  apply (div_le_iff₀ (by linarith)).2
  nlinarith [mul_nonneg hq (show 0 ≤ 1-3*q by linarith)]

#print axioms integration_prod_abs_kappa_ge_b18
#print axioms integration_pivot_ratio_le_b36
#print axioms integration_adjacent_factor_bound
end Filling
