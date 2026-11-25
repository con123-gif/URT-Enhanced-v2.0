import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ZeroFreeOfRpowWindow
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import RHProofTermPrune

/-!
RUN29 — real-center derivative block; 25 November 2026.
SOURCE-MATCHED human replacement, scalar native certificate PREPARED (not compiled).
This is the analytic implication of the existing canonical equation, not an
independent RH criterion or proof of the missing arithmetic window.

Preflight: latest mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
(mandatory unified engine and simultaneous pyramid); manuscript
4f571d3bfce24fbaef352cd403666872a8981175; RUN28 c3dca9942e89844bc9828b2f6cab59ae6cb441d3;
SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74; HANDOFF bbc46df7d7716a6d8863275b5271801eacfaad0d;
EXPANSION c8152d0751072ed693046ada46f8dbcc93d24aab; AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972; continuity
61459cfddab270c187cf628ed60b84749d290a0c; research state/log/protocol inspected.
Latest peer commits 9fab6791 (normalized four-ramp shift), d4c1ff4
(CountV), 604f95bc (interval audit), 0e9468bc (geometry anchor),
75a05320 (Hilbert cancellation) and recent lane commit list read.
None supplies this real-center Landau replacement.

Pinned source leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Below paths relative to
src/Development/AutomorphicArithmetic/DedekindLFunctions/:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96;
LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872;
LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a;
LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f;
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002;
LandauTheorems/LandauCoeff.lean dc8287f2dbe7c767dcb77893eaf53d07092ed1f3;
LandauTheorems/LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7;
LandauTheorems/LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b.
Source bodies inspected. Latest upstream head 251c7b05dd869ceba1aa42c6001c00b4010f23f9
(25 Nov 10:33:41Z); landauWindow blob c3ef70f724a72f916a4f17e1f3c52d73870e862a
now clumps LandauCoeff, LandauPoleAsym and ten other old members.
Old separate paths for these and ZeroFreeOfRpowWindow returned 404.
LandauZeroFreeCriterion f4c5124f8a0188f85b60b2687864d531f9c0a3d8,
LandauCauchy d9521f07281fa1f576779f6d68c21aa7c3de2f70 changed.
No claim of complete new-head equivalence; use original pin only.

## Editor-ready alternative for section 3 (after the Mellin formula)

The canonical input remains [E]: for every sufficiently small eps>0 and
every Y0 there exists Y>=Y0 such that G(x)<=x^(1/2+9eps) for ALL
x in [Y,Y^(3/2)]. Fix theta=1/2+9eps<1, U=log Y; let g(u)=G(exp u).
As in RUN28, |g(u)|<=C0 exp(2u); the transform Phi has no real positive
poles, each zero rho in Re>0 gives the nonzero residue
c_rho=-mult(rho)/(rho(rho-1)), and conjugation pairs poles/residues.
Phi is real on real s>2 and analytic at 1. No RH assumption.

Suppose an off-line zero rho0=beta+it with beta>theta exists. Choose
a REAL sigma>=336 so large that
   2 sigma (beta-theta) > |rho0|^2-theta^2.
Then |sigma-rho0|<E:=sigma-theta. This allows us to stay at ONE real
center instead of the native vertical-center nearest-pole search.

Let A_k=(-1)^k Phi^(k)(sigma)/k! (real). On each chosen window, use ALL
integer k in the growing block
   (29/24) sigma U <= k <= (5/4) sigma U.                       (B)
The block length tends to infinity (at least sigma U/24-1 integers).
By landau_coeff and exact signed cancellation, A_k is no greater than
the integral of the positive part of g against u^k exp(-sigma u)/k!.
On the window its contribution is <= E^(-k-1), by extending the
positive majorant exp(theta u) to the whole half-line and integrating.
Thus no separate maximum-kernel bound or polynomial U factor is needed.
For the two tails, put l=sigma/24. The same elementary exponential
tilts as in RUN28 give an upper bound C0 times
   exp(-sigma U/16)/(23 sigma/24-2)^(k+1)
       + exp(sigma U/24)/(25 sigma/24-2)^(k+1).
For sigma>=336 the denominators' bases are respectively >=20 sigma/21
and >=29 sigma/28. Since log(21/20)<=1/20 and log(28/29)<=-1/29,
(B) makes both exponents -sigma U/16+k/20 and sigma U/24-k/29
nonpositive. Therefore
   A_k <= E^(-k-1) + C0 sigma^(-k)*(21/(20 sigma)+28/(29 sigma))
       <= C E^(-k),                                          (1)
where C=1/E+C0*(21/20+28/29)/sigma is independent of U and k.
In contrast to RUN28, the real-only bound holds for a contiguous
growing block, not merely one derivative order. It is one-sided;
taking |A_k| here would be invalid.

Let d<E be the distance from sigma to the nearest pole and J the
finite nonempty set of all poles at exactly that distance. Compact
disks of radius E are contained in Re>0 and have finitely many poles.
Choose r with d<r<E and below any other pole distance. Subtract ALL
their principal parts before taking norms; the difference is
holomorphic on a slightly larger disk, so Cauchy's estimate gives
   d^k A_k = P_k + O((d/r)^k),
   P_k = sum_{j in J} b_j lambda_j^k,
   b_j=c_j/(sigma-rho_j), lambda_j=d/(sigma-rho_j).
All lambda_j have modulus 1, are pairwise distinct and are not 1
(no real positive poles). The conjugate pairing makes P_k real;
B0=sum|b_j|>0 and S=sum|b_j|^2>0. No tie-breaking or unique nearest
pole is required.

On ANY consecutive block of L integers starting at K,
the average of lambda^k is lambda^K(1-lambda^L)/(L(1-lambda))
for lambda!=1, hence O(1/L) uniformly in K. Apply this first to P_k
and then to the expansion of |P_k|^2, cancelling the diagonal exactly:
   mean P_k=O(1/L),     mean P_k^2=S+O(1/L).
These estimates use only fixed poles and finite geometric sums, not
equidistribution or an unproved prime-correlation hypothesis.
But (1) and the Cauchy remainder imply P_k<=a_U uniformly on (B),
where a_U=max_{k in (B)}[C(d/E)^k+M(d/r)^k] tends to zero.
Since |P_k|<=B0, the exact scalar inequality
   P_k^2 <= B0*(2 max(P_k,0)-P_k)
gives the decisive contradiction
   0<S=lim mean P_k^2 <= lim B0*(2a_U-mean P_k)=0.              (2)
This excludes rho0. Take eps small enough for each proposed zero
and use the already compiled conditional half-strip endpoint.

This is an alternative simplification of the SAME native analytic
branch, not a new arithmetic target. It replaces the complex-center
coefficient comparison, real-pole dichotomy, tie perturbation and
single-pole asymptotic by a real-only coefficient block and elementary
finite-sum orthogonality. It does not claim fewer formal declarations
or a measured page-count improvement. Retain RUN28 if editor/audit
prefers its length. The complete arithmetic/geometric suppliers of
[E] remain exactly as in the live manuscript. For a general CharFamily,
a real pole could give a nonzero mean, so the singleton assumption
(or a separately proved positive constant contribution) is essential.
Negative control: a single constant negative power sum has positive
second moment but cannot yield positive oscillation. Also one isolated
k per window is insufficient for the uniform block averages.

## Evidence / execution

Local CPython exact Fraction regression (exit 0):
tail/block exact cases: 42000 signed scalar exact cases: 10200.
Reproduce:
 from fractions import Fraction as F
 from math import ceil,floor
 n=0
 for sigma in [336,337,400,500,1000,5000,10000]:
   a=F(23*sigma,24)-2;b=F(25*sigma,24)-2
   assert a>=F(20*sigma,21) and b>=F(29*sigma,28)
   for den in range(1,21):
     for num in range(den,den+100):
       v=sigma*F(num,den)
       lo=ceil(29*v/24);hi=floor(5*v/4)
       assert hi-lo+1>=v/24-1
       for k in (lo,(lo+hi)//2,hi):
         assert -v/16+F(k,20)<=0 and v/24-F(k,29)<=0
         n+=1
 m=0
 for b in range(1,101):
   for i in range(-b,b+1):
     p=F(i,7); B=F(b,7)
     assert p*p<=B*(2*max(p,0)-p)
     m+=1
 assert -1<=0 and (-1)**2==1
 print('tail/block exact cases:',n,'signed scalar exact cases:',m)

These are exact algebra checks, not simulated zeros or evidence of RH.
Local command -v lean/lake/elan returned no paths.
Actual CI status.json read: 45577239749 blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc (pass,98.87s);
45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717 (pass,77.94s).
Previous conditional strip root only uses propext, Classical.choice,
Quot.sound; rh_of_right bounded scan visited 2000, pending 324.
No new native execution or axiom evidence for this replacement.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
The below scalar candidate and native reference replay are prepared
for the established runner with the native engine imports. Reference
replay deliberately uses the old conditional theorem, not the claimed
RH theorem, and does NOT validate (1)-(2). No new CI job submitted.

Original local dependency graph: formB -> zeroFree_of_rpow_window ->
lemmaL -> poleData + windowHypU_of_windowHyp + landau_window ->
landau_window_key + landau_dichotomy + landau_nearest +
landau_pole_asym + landau_cauchy + landau_window_contra.
Candidate local graph (mathematical): same singleton poleData + [E]
-> landau_coeff + elementary kernelIntegral/tail block -> (1);
finite pole set + all-pole subtraction + landau_cauchy + finite
geometric sums + signed_square -> (2) -> half-strip endpoint.
Preserve original graph and all type/value/constructor edges; no
global removal until caller bridge and independent native audit.
Context cache key=(pin, singleton G/Phi/Z, theta, delta=1/2, rho0,
real sigma chosen after rho0, block B); backtrack to RUN28 if audit
or native formalization fails. No URT test or speed claim.

RESUME HERE: independently audit (1)-(2), formalize finite principal-
part subtraction and uniform block means using the actual pinned
landau_coeff and landau_cauchy, then replay the singleton caller.
Do not expand elementary supporting libraries. The hard frontier
remains arithmetic/geometric [E], not another analytic criterion.
HANDOFF TO editor/integration, kernel and audit. RH OPEN.
-/

noncomputable section
namespace RHRealLandauBlock

-- Exact squared-distance capture at a sufficiently large real center.
theorem capture_pole (sigma beta t theta : ℝ)
    (h : beta^2+t^2-theta^2 < 2*sigma*(beta-theta)) :
    (sigma-beta)^2+t^2 < (sigma-theta)^2 := by
  nlinarith only [h]

-- The two tilted exponential budgets on the same contiguous block.
theorem block_tail (v k : ℝ) (hl : 29*v/24 ≤ k) (hu : k ≤ 5*v/4) :
    -v/16+k/20 ≤ 0 ∧ v/24-k/29 ≤ 0 := by
  constructor <;> linarith

theorem tail_bases (sigma : ℝ) (h : 336 ≤ sigma) :
    20*sigma/21 ≤ 23*sigma/24-2 ∧
    29*sigma/28 ≤ 25*sigma/24-2 := by
  constructor <;> linarith

theorem signed_square (p B : ℝ) (h : |p| ≤ B) :
    p^2 ≤ B*(2*max p 0-p) := by
  obtain ⟨hlo,hhi⟩ := abs_le.mp h
  by_cases hp : 0 ≤ p
  · rw [max_eq_left hp]
    nlinarith only [mul_nonneg hp (sub_nonneg.mpr hhi)]
  · have hp' : p ≤ 0 := le_of_not_ge hp
    rw [max_eq_right hp']
    have hsum : 0 ≤ B + p := by linarith
    nlinarith only [mul_nonneg (neg_nonneg.mpr hp') hsum]

-- Source reference replay only, preserving every original premise.
theorem reference_window (F : Deduction.CharFamily) {theta delta C : ℝ}
    (ht : 0 < theta) (ht1 : theta < 1) (hd : 0 < delta)
    (h : ∀ Y0 : ℝ, ∃ Y : ℝ, Y0 ≤ Y ∧
      ∀ y ∈ Set.Icc Y (Y ^ (1 + delta)),
        Deduction.Gm F y ≤ C * y ^ theta) : Deduction.ZeroFree F theta := by
  first | rh_reduce 2 using [Deduction.zeroFree_of_rpow_window] |
    exact Deduction.zeroFree_of_rpow_window F ht ht1 hd h

theorem reference_frontier (F : Deduction.CharFamily) {theta delta C : ℝ}
    (ht : 0 < theta) (ht1 : theta < 1) (hd : 0 < delta)
    (h : ∀ Y0 : ℝ, ∃ Y : ℝ, Y0 ≤ Y ∧
      ∀ y ∈ Set.Icc Y (Y ^ (1 + delta)),
        Deduction.Gm F y ≤ C * y ^ theta) : Deduction.ZeroFree F theta := by
  rh_auto_frontier 2
  all_goals first | exact reference_window F ht ht1 hd h | rh_auto 3

rh_scan Deduction.landau_window limit 2000
rh_scan Deduction.landau_coeff limit 2000
rh_prune Deduction.landau_window_key as landau_window_key_pruned29
rh_prune Deduction.zeroFree_of_rpow_window as window_pruned29
#print axioms Deduction.landau_window
#print axioms capture_pole
#print axioms block_tail
#print axioms tail_bases
#print axioms signed_square
#print axioms reference_window
end RHRealLandauBlock
