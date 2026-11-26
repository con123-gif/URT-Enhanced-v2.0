import Formalism.SizeWindowBrackets.ChainSlopeWindows.LevelOfCongruence

/-!
26 Nov 2026 — principal identity-translation joint mean.
Status: SOURCE-MATCHED HUMAN DERIVATION / PREPARED certificate, NOT compiled.
Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005.

Native caller discovery:
LevelGmLeOnFamilyScales.lean (de994949e6fd2d7238cfcb1c19d361ccdfe904fc)
tiedCore_of_chainTied constructs U0 = frame.A and tr = id, explicitly
passing coverage fun s _ => ⟨s, rfl⟩. TieGlobal.lean
(00acf811793877fe42d18c0d69f2d5833f75bf94) defines the same Data index.
For the principal Level, existing index = order = 1 implies A0 = H.
Thus the uniform mean in native geometry is exactly the uniform mean
over the Fourier translations; no quotient selection/equal-fibre premise.
Not valid for arbitrary CoreAtH or nonprincipal levels.

Write q=(1-delBar)^(-1)*4 log(1+x^cHH), c=(1+q)cSl1,
K=K0v5+(1+q)K7v5+q*(K3+b)+(1-delBar)^(-1)*
((etaBar+4 sqrt(eBar))*(x^cHH*b)).
The existing Ga_bound5 and weighted_mean_lower_bound_le give
ASK(u)-Main(u) <= K + log|W(u)| + ASK(u)-Ga(u) + c*IO(u).
Thus the two pointwise fields LossBounds may be replaced, at this
principal consumer only, by the SINGLE signed budget
mean(ASK-Ga+c*IO) <= (1+c)*LoP.
It is weaker than Data.Losses, which itself is weaker than LossBounds:
the two mean bounds imply the combined one by c>=0. The converse
fails for unconstrained real functions (e.g. c=1, LoP=1, means 2 and 0).
This example is only a logical guard, not an admissible native host.

ChTop.ch_top_main_eq and IdentU give pointwise arithmetic equality
gapA(u)=ASK(u)-Main(u). Because tr=id and A0=H, average it directly.
errorTermWith equals mean ErrX5at (only log|W| depends on u), and
errX5at_le with ErrWindows and LargeX bounds each ErrX5at by the
same scalar independently of LossBounds. BNBoundsU then supplies B.
Hence the signed mean premise suffices for the original scalar
x^(CErr*epsilon)*B. Even if some individual translations violate
LossBounds, CharacterBalanceMoves.core needs only this mean:
sum the inequality BEFORE invoking hTop, then apply sum_Th.
Retain all other geometric and arithmetic guards and same-host witnesses.
No change to the analytic endpoint or window quantifiers.

The executable lemma below isolates the native mean bridge; the
caller substitution (SizeData₂, ChainTied, CoreAtH, core/ch_core)
and actual joint budget producer are NOT yet implemented or proved.
Original native files unchanged. No root obligation retired, no
claim of novel math or proof of RH. No Lean compiler available in
this session. Exact source guards checked in five files plus
ErrorFormsWeakWindowsFalse (1d1d179d111b5aa668893327264648558f30fdb6).

RESUME HERE: prove the combined mean from the actual local place sum
TieLocal.IO and ASK-Ga on the same full translation family, not from
separate existential witnesses. Reuse native weighted_mean_bound_statement
if two mean bounds already available; otherwise replay the lemma below
with the native Ga_bound5 estimate. Integrate principal-only average
core and audit remaining users of pointwise SizeData₂.
-/

open Formalism.RankGapBounds.WeightedMeanData
open Formalism.LFunctionChainParameters.WeightedSlopeBounds

noncomputable section

namespace RHPrincipalIdentityJointMean

variable {H : Type} [Fintype H] [Nonempty H]

-- The general finite averaging step; coefficient c and K fixed on one host.
theorem signed_budget
    (ASK Main Ga IO wordLog : H → ℝ) (c K L : ℝ)
    (h : ∀ u, ASK u - Main u ≤ K + wordLog u + (ASK u - Ga u + c * IO u))
    (hJ : umean (fun u => ASK u - Ga u + c * IO u) ≤ (1+c)*L) :
    umean (fun u => ASK u - Main u) ≤
      K + umean wordLog + (1+c)*L := by
  have hm := umean_mono (X := fun u => ASK u - Main u)
    (Y := fun u => (K + wordLog u) + (ASK u - Ga u + c * IO u)) h
  have h1 := umean_add (fun u : H => K + wordLog u)
    (fun u => ASK u - Ga u + c * IO u)
  have h2 := umean_add (fun _ : H => K) wordLog
  have h3 := umean_const (ι := H) K
  linarith

theorem signed_budget_of_separate
    (ASK Ga IO : H → ℝ) (c L : ℝ) (hc : 0 ≤ c)
    (hA : umean (fun u => ASK u - Ga u) ≤ L)
    (hI : umean IO ≤ L) :
    umean (fun u => ASK u - Ga u + c * IO u) ≤ (1+c)*L := by
  rw [umean_add (fun u => ASK u - Ga u) (fun u => c * IO u), umean_mul]
  nlinarith [mul_le_mul_of_nonneg_left hI hc]

end RHPrincipalIdentityJointMean
