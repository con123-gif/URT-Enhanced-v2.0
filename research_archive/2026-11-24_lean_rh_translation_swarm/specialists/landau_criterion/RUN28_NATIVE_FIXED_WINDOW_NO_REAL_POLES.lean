import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.landauWindow

/-!
# Run 28: native modulus-one Landau argument, fixed 3/2 window
25 Nov 2026. Human source-matched; Lean candidate PREPARED, not compiled.
Return from RUN27's independent Gaussian route to the actual canonical ramp [E].
Do not replace or delete any previous checkpoint.

Preflight: current ONE_EQUATION_MISSION.md blob 22018a6dceabd8f43dec13d548c22f3c237729ae
(includes mandatory unified engine and ten-page cap); HANDOFF_QUEUE bbc46df7d7716a6d8863275b5271801eacfaad0d;
SWARM_PROTOCOL 4b77b161d6876915c15cea5a4d4a519beaf5de74; EXPANSION_15_LANES c8152d0751072ed693046ada46f8dbcc93d24aab;
AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972; CONTINUITY 61459cfddab270c187cf628ed60b84749d290a0c.
Peer manuscript ff5f42b9381c422e1109253e7492987892a6b900 blob f83561eab2dfc216a002eb63a1a0fd5ad559882a;
native principal window adapter d131f2087e350993ac8329fddde79aec705625b0 blob c258bec00bd1fca7a2a42df88a62350d835af6b3.
The latter prepares the singleton TopG -> G window -> formB adapter. This run
does NOT duplicate it; it supplies the actual tail/nearest-pole details
missing from manuscript section 3, with the exceptional real-pole branch removed
only in the singleton context.

Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Paths below relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 (G, Gm)
LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 (PoleData, WindowHypU)
LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a
LandauTheorems/landauTails.lean 0e55797bac5320acf02d9acc832ca53df716e436
LandauTheorems/landauWindowIneq.lean cda93b0185260d72395d2ef2c90314e0fa7128ef
LandauTheorems/LandauKernelMax.lean b230a9e40c3710eac205f32ceb8a44f2d003b647
LandauTheorems/LandauDichotomy.lean 947dae363ce629febcba27b1b70355438f8639a0
LandauTheorems/LandauNearest.lean 6a177498987e1ef453727131bf2004bc797a01a2
LandauTheorems/LandauFinite.lean 46a0dc63f21009582a2dda61c1267e9aad88bde5
LandauTheorems/LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002
LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f.
Upstream observed head a85077714ca7b298f69e48798497519ed5326a89 (merge #2456,
AGENTS.md only in that commit; intervening changes not audited). No source mixing.

## Compact proof block for the editor (ordinary mathematics)

Let g(u)=G(exp u), with G the modulus-one centered Mangoldt ramp in [E].
Its Laplace transform for Re(s)>2 is
 F(s)=-zeta'(s)/(s(s-1)zeta(s))-1/(s-1)^2+(1+gamma)/(s-1).
Absolute Fubini follows from Lambda(n)<=log n, and the same bound gives
 |g(u)|=O(exp(2u)) for u>=0. The Laurent expansion at 1 cancels both
 negative powers exactly. Each zeta zero rho in Re(s)>0 is an isolated
 simple pole of F, with nonzero residue -m/[rho(rho-1)] where m is its
 multiplicity. Conjugation adds no different poles. Crucial specialization:
 there are NO real poles in Re(s)>0. For real 0<s<1, the alternating eta
 series is strictly positive (group successive pairs), and
 eta(s)=(1-2^(1-s))zeta(s); for s>1 use Euler product and at s=1 use
 the cancellation just proved. Thus the generic exceptional-real-pole
 alternative is impossible. No RH premise.

Suppose [E] holds on arbitrarily distant [Y,Y^(3/2)] with
 theta=1/2+9eps<1. Then on [U,3U/2], U=log Y, we have g<=exp(theta u).
 Fix sigma=336, k=ceil(420U), U>=1, E=sigma-theta. Let
 A_k(z)=(-1)^k F^(k)(z)/k!. Differentiation under the absolutely
 convergent Laplace integral is justified by the exponential growth bound.
 Set w(u)=u^k exp(-sigma u)/k!. Exact signed cancellation gives
 |A_k(sigma+it)|+Re A_k(sigma)<=2 integral_0^infty max(g,0)w.
 On the window, exp(theta u)w<=E^(-k) by the exponential series.
 Off it, use |g|<=C0 exp(2u). For any 0<l<sigma-2,
 multiply the upper-tail integrand by exp(l(u-3U/2))>=1 and the
 lower-tail integrand by exp(l(U-u))>=1; integrate both on (0,infty)
 using integral u^k exp(-a u)/k! = a^(-k-1). With l=14 this gives
 T_k <= exp(-21U)/320^(k+1) + exp(14U)/348^(k+1).
 Multiplying by 336^k and using log(21/20)<=1/20,
 log(28/29)<=-1/29 yields
 336^k T_k <= exp(-21U+k/20)/320 + exp(14U-k/29)/348
            <= exp(1/20)/320 + 1/348 = C_tail.
 Hence the native coefficient inequality becomes the single bound
 |A_k(sigma+it)|+Re A_k(sigma)
 <= (U + 2 C0 C_tail) E^(-k) for ALL real t, on the same sequence
 U->infty, k>=U. No need to introduce an independent eta parameter in
 the human proof; the native WindowHypU version allows exp(eta U).

If rho0 has Re(rho0)>theta, set D to min(E, distance from sigma to Z),
 with D=E if no pole is nearer than E. Compact disks contained in Re>0
 contain finitely many poles, so a minimum below E is attained.
 If D=E take rho1=rho0; otherwise take a nearest pole rho1 to sigma.
 Since rho1 is not real, its horizontal distance sigma-Re(rho1)<D.
 Shift the center to sigma+i Im(rho1). Its distance to rho1 is <D.
 A sufficiently small vertical perturbation gives a unique nearest pole
 rho at distance d<D: only finitely many poles lie in a slightly enlarged
 D-disk (still in Re>0); distinct points to the left of sigma tie in
 distance on the vertical line at at most one height, unless they are
 identical. Avoid the finitely many tie heights. Choose d<r<=D below
 all other pole distances and set e=(d+r)/2. F is holomorphic on the
 real-centered D-disk; at the shifted center z it is holomorphic on the
 r-disk after subtracting c/(s-rho), c!=0, using the removable singularity.
 Cauchy's estimates and the reverse triangle inequality give
 |A_k(z)|+Re A_k(sigma)>= (|c|/d)d^(-k)-M e^(-k).
 Combining with the coefficient upper bound and multiplying by d^k gives
   |c|/d <= M(d/e)^k + (U+2 C0 C_tail)(d/E)^k -> 0,
 a contradiction because 0<d<e<=E and k>=U->infty.
 This is the desired Landau implication at the actual native window length.
 Select eps sufficiently small for each rho, then apply the already
 checked conditional half-strip endpoint and functional equation.

Exact quantifiers: 0<eps<eps0, theta=1/2+9eps<1; delta=1/2>0;
 all sufficiently distant *chosen* windows, not all Y; same U and k
 work for every t. The only substantive missing premise is the native
 arithmetic window supplier [E], with its shared family data, not
 a new estimate on independent prime sums. This is a replacement proof
 of the analytic implication, not a proof of [E].
 Negative control: g(u)=-exp(beta*u), theta<beta<1, has g<=0 on every
 window but transform -1/(s-beta). Thus generic real-pole exclusion
 cannot be obtained without positive residues or absence of real poles.
 No positivity assumption about g itself.

## Audit / actual execution

CPython exact Fraction regression, exit 0, 16000 ceiling/exponent cases.
Reproduce:
 from fractions import Fraction as F
 from math import ceil
 for den in range(1,41):
   for num in range(den,den+400):
     U=F(num,den); k=ceil(420*U)
     assert U<=k and 420*U<=k<420*U+1
     assert -21*U+F(k,20)<=F(1,20)
     assert 14*U-F(k,29)<=0
 assert -21*F(1)+F(421,20)>0
No finite test certifies a zeta zero theorem. The final assert tests the
necessity of allowing upper ceiling slack in the rational upper estimate.

No lean or lake found on local PATH. Fetched actual CI status JSON tails:
compute/rh-recursive-reduction-strip-root-20261125/status.json blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc, run 45577239749,
reduced_strip_root axioms propext, Classical.choice, Quot.sound.
compute/rh-proof-term-prune-native-20261125/status.json blob
7da354941e402b6f8b364ed03d8c5c82d27b7717, run 45576756833,
rh_of_right scan visited 2000 / pending 324; no binder reduction.
These are existing engine results ONLY, not validation of this file.
Original graph preserved: formB -> zeroFree_of_rpow_window -> lemmaL ->
poleData and landau_window -> landau_window_key, landau_dichotomy (two
branches), landau_nearest, landau_pole_asym, landau_cauchy, growth_contra.
Proposed local graph: singleton pole data + no real poles + WindowHypU
-> landau_window_key + nonreal_dichotomy + landau_nearest + pole_asym +
Cauchy + growth_contra. Below is a source-matched candidate using the
native key; the more concise fixed-window tail proof above is human-only.
The original field for positive real residues is not consumed in the
new branch; it remains in PoleData's type. No global pruning claim.
Cache key = pin, singleton g/F/Z, theta, delta=1/2, absence of real poles.
No claimed axiom ledger for new theorem; pending native checks and audit.
No imported RH theorem used; all arithmetic suppliers remain open.
No URT use or improvement.
-/

open Complex MeasureTheory Set Filter Topology
noncomputable section
namespace Deduction

/-- Specialized dichotomy: the second branch is impossible for zeta. -/
theorem rh_no_real_dichotomy {Z : Set ℂ}
    (hiso : ∀ z : ℂ, 0 < z.re → ∀ᶠ w in 𝓝[≠] z, w ∉ Z)
    {σ θ : ℝ} (hle : ∀ ρ ∈ Z, ρ.re < σ) (hθ : 0 < θ)
    (hθσ : θ < σ) (hno : ∀ β : ℝ, (β : ℂ) ∉ Z)
    {ρ₀ : ℂ} (h₀ : ρ₀ ∈ Z) (hρ₀ : θ < ρ₀.re) :
    ∃ D : ℝ, D ≤ σ - θ ∧ (∀ w ∈ Z, w ∉ Metric.ball (σ : ℂ) D) ∧
      ∃ ρ₁ ∈ Z, σ - ρ₁.re < D := by
  rcases landau_dichotomy hiso hle hθ hθσ h₀ hρ₀ with h | h
  · exact h
  · obtain ⟨β, hβ, -⟩ := h
    exact (hno β hβ).elim

/-- Actual native first-branch proof, without the exceptional real-pole branch.
   hno is proved for the singleton zeta zero set in the human block above. -/
theorem rh_landau_no_real {g : ℝ → ℝ} {Φ : ℂ → ℂ} {Z : Set ℂ}
    (hP : PoleData g Φ Z) {θ δ : ℝ}
    (hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)
    (hW : WindowHypU g θ δ) (hno : ∀ β : ℝ, (β : ℂ) ∉ Z) :
    ∀ ρ ∈ Z, ρ.re ≤ θ := by
  intro ρ₀ h₀
  by_contra hρ₀
  rw [not_le] at hρ₀
  obtain ⟨σ, hσ, C, hkey⟩ := landau_window_key hP hθ hθ1 hδ hW
  have hle : ∀ ρ ∈ Z, ρ.re < σ := fun ρ hρ => (landau_pole_re_le hP ρ hρ).trans_lt hσ
  obtain ⟨D, hD, hfree, ρ₁, h₁, hρ₁⟩ :=
    rh_no_real_dichotomy hP.iso hle hθ (by linarith) hno h₀ hρ₀
  obtain ⟨γ, ρ, hρ, r, hr1, hr2, huniq⟩ :=
    landau_nearest hP.iso hle (by linarith : D < σ) h₁ hρ₁
  obtain ⟨c, hc, -, hp⟩ := hP.pole ρ hρ
  set z : ℂ := (σ : ℂ) + γ * I with hz
  have hzre : z.re = σ := by simp [hz]
  have hne : ρ ≠ z := by
    intro h
    have hh := hle ρ hρ
    rw [h, hzre] at hh
    exact lt_irrefl _ hh
  have hd : 0 < ‖z - ρ‖ := norm_pos_iff.2 (sub_ne_zero.2 hne.symm)
  set d := ‖z - ρ‖ with hddef
  have hball : ρ ∈ Metric.ball z r := by
    rw [Metric.mem_ball, dist_comm, dist_eq_norm]; exact hr1
  have hdiff : DifferentiableOn ℂ Φ (Metric.ball z r \ {ρ}) := by
    refine hP.diff.mono ?_
    rintro w ⟨hw, hw'⟩
    exact ⟨landau_window_re_pos (by rw [hzre]; linarith) hw,
      fun hZ => hw' (huniq w hZ hw)⟩
  have hdiff' : DifferentiableOn ℂ Φ (Metric.ball (σ : ℂ) D) := by
    refine hP.diff.mono ?_
    intro w hw
    exact ⟨landau_window_re_pos (by rw [Complex.ofReal_re]; linarith) hw,
      fun hZ => hfree w hZ hw⟩
  obtain ⟨M, hM⟩ := landau_pole_asym (r' := (d + r) / 2) hball hne hdiff hp
    (by linarith) (by linarith)
  obtain ⟨M', hM'⟩ := landau_cauchy (r' := (d + r) / 2) hdiff'
    (by linarith) (by linarith)
  refine landau_window_contra (c := ‖c‖ / d) (d := d) (e := (d + r) / 2)
    (E := σ - θ) (M := M + M') (C := C)
    (div_pos (norm_pos_iff.2 hc) hd) hd (by linarith) (by linarith) fun η hη U₀ => ?_
  obtain ⟨U, hU, k, hk, hb⟩ := hkey η hη U₀
  refine ⟨U, hU, k, hk, ?_⟩
  have h1 := hb γ
  have h2 := hM k
  have h3 := hM' k
  have h4 : ‖c / (z - ρ) ^ (k + 1)‖ = ‖c‖ / d / d ^ k := by
    rw [norm_div, norm_pow, pow_succ', div_div]
  have h5 : ‖(-1) ^ k * iteratedDeriv k Φ (σ : ℂ) / (k.factorial : ℂ)‖ =
      ‖iteratedDeriv k Φ (σ : ℂ) / (k.factorial : ℂ)‖ := by
    rw [mul_div_assoc, norm_mul, norm_pow, norm_neg, norm_one, one_pow, one_mul]
  have h6 := (abs_le.mp (Complex.abs_re_le_norm
    ((-1) ^ k * iteratedDeriv k Φ (σ : ℂ) / (k.factorial : ℂ)))).1
  have h7 := norm_sub_norm_le (c / (z - ρ) ^ (k + 1))
    ((-1) ^ k * iteratedDeriv k Φ z / (k.factorial : ℂ))
  rw [norm_sub_rev] at h7
  rw [add_div]
  linarith

#print axioms rh_no_real_dichotomy
#print axioms rh_landau_no_real
end Deduction

/-
RESUME HERE: editor replace section 3's abbreviated tails and dichotomy
paragraph with the compact human block above, after independent audit;
do NOT remove the arithmetic prerequisites in section 5.
Kernel lane: in pinned Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474 compile this file, instantiate
hno for the actual singleton zeroSet using the Mathlib real-zeta facts,
then authenticate caller-level replacement. Use the existing engine olean
files; add imports RHProofTermPrune, RHRecursiveReductionFixed,
RHRecursiveReductionAutoV3 at the TOP of a scratch copy. Then append
rh_scan Deduction.landau_window limit 2000
rh_scan Deduction.rh_landau_no_real limit 2000
rh_prune Deduction.rh_landau_no_real as RHLandauNoRealPruned
rh_scan RHLandauNoRealPruned limit 2000
and #print axioms on candidate and original bridge, preserving all pending
nodes; run rh_reduce/rh_auto/rh_auto_frontier on the actual caller with
the new singleton premise (bounded search, no admissions, fall back to
original native theorem if needed). No native PASS claimed.
HANDOFF TO editor, integration, audit, kernel_extractor.
RH OPEN; VWinAt and actual geometric/cohomological suppliers still open.
-/
