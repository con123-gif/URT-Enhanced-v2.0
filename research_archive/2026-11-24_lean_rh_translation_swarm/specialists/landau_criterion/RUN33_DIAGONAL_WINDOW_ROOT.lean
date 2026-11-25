import RH32SingletonPoleData
import RH33DirectLogWindow
import Formalism.GammaFactorNonvanishing.RhOfRight

/-!
RUN33 (Landau lane), 25 Nov 2026. DIAGONAL WINDOW AND ACTUAL CALLER REPLAY.
Human implication proved below; native Lean candidate and CI runner prepared.
No assertion of the arithmetic premise or RH.

Latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; SWARM 4b77b161d,
HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS 8db0201d, continuity 61459cfd,
state/log/protocol openings, manuscript 464e82f81f646d4af85e1f5f70d379026df46261.
Recent 25 commits reviewed by message; relevant actual peer bodies/patches
a910af41 (audit direct log-window), 0cf4b3fb (direct 400 host),
88aa566b (coset mass), 141537e1 (our singleton PoleData) inspected.
Not an exhaustive review of all peer files or external blueprint.
Original pin 40e56bab026552e089d7afcfeff08d2defb9c005;
upstream head observed d91ae2678eea19a0c3045ffca37f1da757c2e719
(25 Nov 13:24:11Z); no mixing of latest and pinned source.

RESULT: the native tolerance eps need not be fixed across distant
windows. It suffices to construct ONE sequence (Y_j, eps_j) with
Y_j -> infinity, eps_j > 0, eps_j -> 0, satisfying the actual same-host
canonical equation G(x) <= x^(1/2+9 eps_j) throughout [Y_j,Y_j^(3/2)].
Equivalently for every b>0 and M>=1 one can choose eps in (0,b) and
Y>=M with that inequality on the entire window. This is a weaker
input interface than constructing arbitrarily distant windows at
every fixed sufficiently small real eps. In particular, discrete
arithmetic scales and tolerances may be chosen jointly. No need for
a universal fixed eps0 in the consumer. The existing fixed-eps input
implies the new one by selecting eps=min(b/2,eps0/2).
The native arithmetic supplier itself has not been changed/proved.

Proof: for a hypothetical zero rho with 1/2 < beta=Re rho < 1 put
b=(beta-1/2)/18 and theta=1/2+9b. Then 0<theta<beta<1.
For arbitrary Y0 choose a diagonal window at M=max(1,Y0), eps<b.
Since every x in the SAME window satisfies x>=1, exponent monotonicity
gives the single fixed-theta bound G(x)<=x^(1/2+9eps)<=x^theta.
Thus the exact arbitrary-Y0 hypothesis of peer rh33_principal_interface
holds with delta=1/2,C=1. Apply singleton PoleData (our RUN32) and
unchanged native landau_window; rho is excluded. Re>=1 is Mathlib
nonvanishing. The exact pinned rh_of_right gives the conditional RH
conclusion. The fixed positive window length and all x quantifier
remain essential. No inference from a sequence of individual good
points, nor from a sequence with bounded Y, nor from eps not tending
to zero. No new analytic pole assumptions: real pole residue has the
native positive sign as proved in RUN32, nonreal residues nonzero;
the native Landau theorem handles the real branch.
No claims of independence of auxiliary host/character data inside
one window. This is an endpoint weakening, not a proof of cancellation.

Original local graph (source-visible):
TopG -> level_of_tiedWin -> formB -> zeroFree_of_rpow_window ->
lemmaL -> poleData + windowHypU_of_windowHyp + landau_window;
rh_of_right handles functional equation.
Prior proposed branch: fixed-eps window -> singleton PoleData ->
direct log-window -> landau_window -> half-strip.
Current proposed branch: diagonal window -> fixed_window_of_diagonal
-> same singleton/direct analytic branch -> rh_of_right.
All original graph nodes, constructor/type/value roles, pending
upstream geometry, VWinAt/CountQ and all-prime/full-length obligations
remain; no global deletion claimed. Cache context: source pin,
same canonical G, eps,b,Y and whole window, theta=1/2+9b, delta=1/2.
Fallback: native original conditional formB path if replay fails.

Source ledger (pin, paths relative to src):
Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean
81c8dfd66d910d083d5bc88c664c7917fdbdfe96;
LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872;
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002;
lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f;
poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1;
landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a;
Formalism/GammaFactorNonvanishing/RhOfRight.lean
3604637147a33e72248faddd775ea750e7846ead.
Actual root consumer sources ZeroFreeAllOfTopG 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1
and WindowInequalityOfArtinInputs c349e34925ac26b8bc76bd36e9b91562f86d6b8d read.

Actual local Python Fraction regression (exit 0, 58,800 exact checks):
from fractions import Fraction as Q
n=0
for den in range(3,101):
 for i in range(den//2+1,den):
  beta=Q(i,den); b=(beta-Q(1,2))/18; theta=Q(1,2)+9*b
  assert 0<b and Q(1,2)<theta<beta<1
  for j in range(1,9):
   eps=b*Q(j,9)
   assert 0<eps<b and Q(1,2)+9*eps<theta
   for eps0 in (Q(1,52),Q(1,1000),Q(1,3)):
    e=min(b/2,eps0/2)
    assert 0<e<b and e<eps0
    n+=1
print('exact exponent and original-to-diagonal checks:',n)
These check arithmetic only, not RH or any Lean declaration.

Native lean/lake not installed locally. Retrieved actual prior status
45577239749 pass 98.87s blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 pass 77.94s blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Their conditional root axioms are propext, Classical.choice, Quot.sound;
prior rh_of_right scan 2000 visited, 324 pending, no binder reduction.
These are not this file's validation. New compute job uses exact pinned
source import closure, compiles both previous candidate modules and
this root bridge, scans/prunes actual consumers and checks axiom ledger.
No new native PASS until published CI output. No URT benefit claimed.
No claimed Main/RH theorem imported. No physical gates changed.

RESUME HERE: read compute/rh-landau-diagonal-root-20261125/status.json
on cathedral-research-state; inspect exact logs, repair the first real
elaboration failure if any, audit actual caller axioms and retained
dependencies. If replay succeeds, send diagonal interface to arithmetic
and editor; prove same-host diagonal construction, not independent
reformulations of RH. HANDOFF TO kernel, audit, integration, editor.
-/

open Complex Set
noncomputable section
namespace Deduction

def RHDiagonalWindow : Prop :=
  ∀ b : ℝ, 0 < b → ∀ M : ℝ, 1 ≤ M →
    ∃ eps Y : ℝ, 0 < eps ∧ eps < b ∧ M ≤ Y ∧
      ∀ x ∈ Icc Y (Y ^ ((3 : ℝ)/2)), G x ≤ x ^ (1/2 + 9*eps)

def RHOriginalWindow : Prop :=
  ∃ eps0 : ℝ, 0 < eps0 ∧ ∀ eps : ℝ, 0 < eps → eps < eps0 →
    ∀ M : ℝ, 1 ≤ M → ∃ Y : ℝ, M ≤ Y ∧
      ∀ x ∈ Icc Y (Y ^ ((3 : ℝ)/2)), G x ≤ x ^ (1/2 + 9*eps)

theorem rh33_diagonal_of_original (h : RHOriginalWindow) : RHDiagonalWindow := by
  obtain ⟨eps0, he0, hw⟩ := h
  intro b hb M hM
  let eps : ℝ := min (b/2) (eps0/2)
  have he : 0 < eps := lt_min (by linarith) (by linarith)
  have heb : eps < b := (min_le_left _ _).trans_lt (by linarith)
  have heo : eps < eps0 := (min_le_right _ _).trans_lt (by linarith)
  obtain ⟨Y, hY, hwin⟩ := hw eps he heo M hM
  exact ⟨eps, Y, he, heb, hY, hwin⟩

theorem rh33_fixed_window_of_diagonal (h : RHDiagonalWindow) {b : ℝ} (hb : 0 < b) :
    ∀ Y0 : ℝ, ∃ Y : ℝ, Y0 ≤ Y ∧
      ∀ x ∈ Icc Y (Y ^ (1+(1/2 : ℝ))), G x ≤ (1:ℝ)*x ^ (1/2+9*b) := by
  intro Y0
  obtain ⟨eps,Y,he,heb,hY,hw⟩ := h b hb (max 1 Y0) (le_max_left _ _)
  refine ⟨Y,(le_max_right _ _).trans hY,?_⟩
  intro x hx
  have hx1 : 1 ≤ x := ((le_max_left _ _).trans hY).trans hx.1
  have hx' : x ∈ Icc Y (Y ^ ((3:ℝ)/2)) := by
    simpa only [show (1:ℝ)+1/2=3/2 by norm_num] using hx
  rw [one_mul]
  exact (hw x hx').trans (Real.rpow_le_rpow_of_exponent_le hx1 (by linarith))

theorem rh33_right_of_diagonal (h : RHDiagonalWindow) :
    ∀ s : ℂ, 1/2 < s.re → s ≠ 1 → riemannZeta s ≠ 0 := by
  intro s hs _hs1
  by_cases hlt : s.re < 1
  · let b : ℝ := (s.re-1/2)/18
    have hb : 0 < b := by dsimp [b]; linarith
    have hθ : 0 < (1/2:ℝ)+9*b := by linarith
    have hθ1 : (1/2:ℝ)+9*b < 1 := by dsimp [b]; linarith
    have hθs : (1/2:ℝ)+9*b < s.re := by dsimp [b]; linarith
    obtain ⟨Φ,hP⟩ := rh32_principal_pole_data
    have hP' : PoleData (fun u => G (Real.exp u)) Φ
        {ρ : ℂ | 0 < ρ.re ∧ riemannZeta ρ = 0} := by
      simpa only [rh32_Z] using hP
    exact rh33_principal_interface hP' hθ hθ1 (by norm_num : 0 < (1/2:ℝ))
      (rh33_fixed_window_of_diagonal h hb) s hθs
  · exact riemannZeta_ne_zero_of_one_le_re (le_of_not_gt hlt)

theorem rh33_rh_of_diagonal (h : RHDiagonalWindow) : RiemannHypothesis := by
  first
  | (rh_reduce 3 using [Formalism.VW.rh_of_right, rh33_right_of_diagonal]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact Formalism.VW.rh_of_right (rh33_right_of_diagonal h)

theorem rh33_original_root_bridge (h : RHOriginalWindow) : RiemannHypothesis :=
  rh33_rh_of_diagonal (rh33_diagonal_of_original h)

end Deduction

rh_scan Deduction.zeroFree_of_rpow_window limit 2000
rh_scan Deduction.rh33_rh_of_diagonal limit 2000
rh_scan Deduction.rh33_original_root_bridge limit 2000
rh_prune Deduction.rh33_rh_of_diagonal as RH33DiagonalRootPruned
#print axioms Deduction.rh33_diagonal_of_original
#print axioms Deduction.rh33_fixed_window_of_diagonal
#print axioms Deduction.rh33_right_of_diagonal
#print axioms Deduction.rh33_rh_of_diagonal
#print axioms Deduction.rh33_original_root_bridge
