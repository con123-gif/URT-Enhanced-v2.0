import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ZeroFreeOfRpowWindow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN33 — independent audit of singleton pole transfer; remove intermediate window family
25 November 2026. Lane 10. Human/source-matched conditional reduction.
New Lean file PREPARED, NOT kernel checked. No proof of the canonical inequality.

Preflight: latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
(including mandatory engine), SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74,
HANDOFF bbc46df7d7716a6d8863275b5271801eacfaad0d, AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972, state/log/protocol openings,
continuity 61459cfddab270c187cf628ed60b84749d290a0c, live manuscript
464e82f81f646d4af85e1f5f70d379026df46261. Recent 25 commit messages
checked, own d0ca7069 and peer 141537e1 proof blocks read, other recent
peer patches requested (combined output truncated; no full review claimed).
No change to physical gates. Native lean/lake absent (command -v returned
no paths).

Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Actual inspected sources relative to
src/Development/AutomorphicArithmetic/DedekindLFunctions/:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872
LandauTheorems/poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1
LandauTheorems/mellinGchiModOne.lean 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc
LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
LandauTheorems/WindowHypUOfWindowHyp.lean 701f0502ae106ab89e390105cd9c98e6cf881e1a
LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a
LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002.

Audit peer specialists/landau_criterion/RUN32_SINGLETON_POLE_DATA.lean
(141537e1635891b683e68f3a4478a31c97a3a933):
AGREE with scalar transform and residue sign on their stated domains.
The regularized H(s)=(s-1)zeta(s) has H(1)=1, not zeta(1)=1.
At a zero rho with Re rho>0, line-one exclusion implies Re rho<1.
Residue -m/[rho(rho-1)] is nonzero and positive real for real rho.
Native PoleData requires precisely this real-pole sign; do not omit it.
No native replay of peer certificate. Its final power-window theorem
still requires a CharFamily F and a Gm F=G identity merely to build
WindowHypU. These are unnecessary for the analytic endpoint once
the upstream principal discrepancy has already been identified.

## Single proof block for the living manuscript
For any real function f, assume fixed C in R, delta>0, theta in R,
and for every Y0 some Y>=Y0 with f(y)<=C y^theta throughout
[Y,Y^(1+delta)]. Put g(u)=f(exp u). Given eta>0 and U0, choose
B=max(U0,1,4|C|delta/eta^2) and apply the original window hypothesis
at Y0=exp B. Thus U=log Y>=B, Y>0. For every u in [U,(1+delta)U],
exp u lies in that SAME original window; no independently selected
scale or pointwise subsequence. Choose R(u)=|C| exp(theta u).
It is nonnegative, dominates g, and after exact cancellation
    integral_U^((1+delta)U) R(u) exp(-theta u) du = |C|delta U
       <= (eta U/2)^2 <= exp(eta U).
The first bound follows from U>=4|C|delta/eta^2 and U>=1.
The second follows from exp(v)>=1+v>=v, v=eta U/2>=0, squaring.
The integrand is the constant |C|, so integrability is immediate.
This gives the exact native WindowHypU, for arbitrary eta,U0,
with the original fixed delta and theta. No change of variables
for integrals, no intermediate WindowHyp, no family and no
restriction C>=0 or 0<theta<1 for the bridge itself.
The latter theta restrictions are retained for landau_window.

Apply unchanged landau_window to the singleton PoleData from RUN32
and this direct bridge; the principal right-of-window theorem now
needs no F or hF in its interface. The upstream native identification
of Level.Gm with G remains necessary to establish the input inequality.
Original-statement replacement below also works for general F, using
poleData F and same line-one exclusion as lemmaL. No claim of removing
all general-character dependencies globally. No new analytic premise.

## Dependency and audit ledger
Original local source graph:
zeroFree_of_rpow_window -> windowHyp_of_rpow (eventual log/power,
weighted y-integral), lemmaL -> windowHypU_of_windowHyp (exp image,
Jacobian integral), poleData, landau_window, line-one exclusion.
Peer overlay: same two window conversion nodes, F and hF,
principal PoleData, landau_window. This overlay: direct_windowU
(exp interval monotonicity, explicit threshold, constant integral),
same principal PoleData and same landau_window. Full original
graph and all unresolved value/type/constructor/axiom edges remain
intact. Cache key (source pin, f, theta, delta, fixed C, eta,U0,
chosen original window); no cross-context reuse of existence witnesses.
Fallback to the original native window conversion if new Lean code
fails. No new authenticated Main-root reachability: this is a
source-matched local replacement for the documented root consumer,
not an independently elaborated root graph.

Exact finite arithmetic test, executed locally with Python Fraction:
```python
from fractions import Fraction as F
n=0
for C in [F(-3),F(0),F(1,7),F(1),F(100)]:
 for delta in [F(1,100),F(1,2),F(1),F(7)]:
  for eta in [F(1,100),F(1,3),F(1),F(3)]:
   for k in range(1,21):
    U=max(F(1),4*abs(C)*delta/eta**2)*k
    a=eta*U/2
    assert abs(C)*delta*U <= a*a <= (1+a)**2
    n+=1
assert F(1)*F(1)*F(0)==0
assert F(1,2)*F(1)*F(1)>0
print('exact threshold checks:',n,'; endpoint checks: 2')
```
Actual stdout: exact threshold checks: 1600 ; endpoint checks: 2.
The last two checks simply cover zero length and positive length,
not tests of RH or of analytic integrability. The scalar proof
above is independent of these tests. Point-only windows or
delta=0 cannot be substituted: the native Landau theorem requires
a fixed strictly positive delta. No URT advantage claimed.

Existing CI status JSON fetched from cathedral-research-state:
45577239749 pass 98.87s blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 pass 77.94s blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Conditional strip root axioms propext, Classical.choice, Quot.sound;
bounded rh_of_right scan 2000 visited, 324 pending, no binder deletion.
These jobs do not check the new file or peer RUN32. No new CI PASS.
Toolchain target Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
No claimed RH theorem imported as proof. No new CI job submitted;
native replay and axiom evidence pending.

RESUME HERE: compile the direct bridge, original-statement replacement,
and peer singleton PoleData together at the actual formB consumer,
then audit their constructor-inclusive dependency difference.
Do not use the smaller endpoint as proof of the upstream prime window.
HANDOFF TO Landau, kernel, integration and editor.
Verdict AGREE/PARTIAL. Actual pointwise-to-integral conversion simplified;
the decisive prime inequality remains open in the reconstruction.
-/

open Complex MeasureTheory Set Filter Topology
noncomputable section
namespace Deduction

theorem rh33_threshold (K η U : ℝ) (hK : 0 ≤ K) (hη : 0 < η)
    (hU : 0 ≤ U) (hb : 4*K/η^2 ≤ U) :
    K*U ≤ Real.exp (η*U) := by
  have hp : 0 < η^2 := by positivity
  have hmul := mul_le_mul_of_nonneg_right ((div_le_iff₀ hp).mp hb) hU
  have hquad : K*U ≤ (η*U/2)^2 := by nlinarith
  have hv : 0 ≤ η*U/2 := by positivity
  have he : η*U/2 ≤ Real.exp (η*U/2) := by
    linarith [Real.add_one_le_exp (η*U/2)]
  have hs := mul_le_mul he he hv (Real.exp_pos (η*U/2)).le
  rw [← Real.exp_add, show η*U/2+η*U/2 = η*U by ring] at hs
  exact hquad.trans (by simpa only [pow_two] using hs)

theorem rh33_direct_windowU (f : ℝ → ℝ) {θ δ C : ℝ} (hδ : 0 < δ)
    (h : ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧
      ∀ y ∈ Icc Y (Y ^ (1 + δ)), f y ≤ C*y^θ) :
    WindowHypU (fun u => f (Real.exp u)) θ δ := by
  intro η hη U₀
  let B : ℝ := max U₀ (max 1 (4*(|C|*δ)/η^2))
  obtain ⟨Y, hY, hw⟩ := h (Real.exp B)
  have hYpos : 0 < Y := (Real.exp_pos B).trans_le hY
  have hB : B ≤ Real.log Y := by
    apply Real.exp_le_exp.mp
    rwa [Real.exp_log hYpos]
  have hU₀ : U₀ ≤ Real.log Y := (le_max_left _ _).trans hB
  have hU1 : 1 ≤ Real.log Y :=
    (le_max_left _ _).trans ((le_max_right _ _).trans hB)
  have hUb : 4*(|C|*δ)/η^2 ≤ Real.log Y :=
    (le_max_right _ _).trans ((le_max_right _ _).trans hB)
  have hU : 0 ≤ Real.log Y := by linarith
  have hle : Real.log Y ≤ (1+δ)*Real.log Y := by
    nlinarith [mul_nonneg hδ.le hU]
  have heq : (fun u : ℝ => |C|*Real.exp (θ*u)*Real.exp (-θ*u)) =
      fun _ : ℝ => |C| := by
    funext u
    rw [mul_assoc, ← Real.exp_add, show θ*u + -θ*u = 0 by ring,
      Real.exp_zero, mul_one]
  refine ⟨Real.log Y, hU₀, fun u => |C|*Real.exp (θ*u), ?_, ?_, ?_⟩
  · rw [heq]
    exact continuousOn_const.integrableOn_Icc
  · intro u hu
    have hm : Real.exp u ∈ Icc Y (Y^(1+δ)) := by
      constructor
      · calc
          Y = Real.exp (Real.log Y) := (Real.exp_log hYpos).symm
          _ ≤ Real.exp u := Real.exp_le_exp.mpr hu.1
      · calc
          Real.exp u ≤ Real.exp ((1+δ)*Real.log Y) := Real.exp_le_exp.mpr hu.2
          _ = Y^(1+δ) := by rw [Real.rpow_def_of_pos hYpos, mul_comm]
    have hf := hw (Real.exp u) hm
    rw [Real.rpow_def_of_pos (Real.exp_pos u), Real.log_exp, mul_comm u θ] at hf
    exact ⟨by positivity, hf.trans
      (mul_le_mul_of_nonneg_right (le_abs_self C) (Real.exp_pos _).le)⟩
  · rw [heq, integral_Icc_eq_integral_Ioc, ← intervalIntegral.integral_of_le hle,
      intervalIntegral.integral_const, smul_eq_mul]
    calc
      ((1+δ)*Real.log Y-Real.log Y)*|C| = (|C|*δ)*Real.log Y := by ring
      _ ≤ Real.exp (η*Real.log Y) := rh33_threshold _ _ _ (by positivity) hη hU hUb

theorem rh33_original_interface (F : CharFamily) {θ δ C : ℝ}
    (hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)
    (h : ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧
      ∀ y ∈ Icc Y (Y^(1+δ)), Gm F y ≤ C*y^θ) :
    ZeroFree F θ := by
  obtain ⟨Φ,hP⟩ := poleData F
  have hw : WindowHypU (gm F) θ δ := rh33_direct_windowU (Gm F) hδ h
  have hz := landau_window hP hθ hθ1 hδ hw
  intro i s hs hzero
  exact (not_le_of_gt hs) (hz s ⟨hθ.trans hs,i,Or.inl hzero⟩)

theorem rh33_principal_interface {Φ : ℂ → ℂ}
    (hP : PoleData (fun u => G (Real.exp u)) Φ
      {ρ : ℂ | 0 < ρ.re ∧ riemannZeta ρ = 0})
    {θ δ C : ℝ} (hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)
    (h : ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧
      ∀ y ∈ Icc Y (Y^(1+δ)), G y ≤ C*y^θ) :
    ∀ s : ℂ, θ < s.re → riemannZeta s ≠ 0 := by
  have hw : WindowHypU (fun u => G (Real.exp u)) θ δ := by
    first | (rh_reduce 2 using [rh33_direct_windowU]; done)
          | (rh_auto_frontier 2; done)
          | (rh_auto 2; done)
          | exact rh33_direct_windowU G hδ h
  intro s hs hz
  exact (not_le_of_gt hs) (landau_window hP hθ hθ1 hδ hw s ⟨hθ.trans hs,hz⟩)

rh_scan zeroFree_of_rpow_window limit 2000
rh_scan rh33_original_interface limit 2000
rh_scan rh33_principal_interface limit 2000
rh_prune rh33_direct_windowU as RH33DirectWindowPruned
#print axioms zeroFree_of_rpow_window
#print axioms rh33_direct_windowU
#print axioms rh33_original_interface
#print axioms rh33_principal_interface

end Deduction
