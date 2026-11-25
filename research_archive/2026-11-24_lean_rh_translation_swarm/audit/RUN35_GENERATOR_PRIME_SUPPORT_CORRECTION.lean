/-!
RUN35 (2026-11-25), lane 10 AUDIT. AGREE finite support; DISAGREE generator deletion;
PARTIAL. New root-reachable kernel closures: 0. This is a source-matched correction
and prepared branch-specific native certificate, NOT compiled or queued.

Mission blob cd0a176134d46b5b624896e56843a24915c14477. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Peer 22dbf3752318e5e6e43d40eacbd8c04120dbe429:
integration/2026-11-25_FINITE_SUPPORT_COHOMOLOGY.md blob f585d84d8397a2694c2064ca928abb8855db0af6
suggests excluding generator primes because etaAt_le_g supposedly has no VVr.
This is false: pinned MemPrimesOverOfMem.lean etaAt_le_g explicitly includes
VVr D l and vhE D l, and GeneratorPrimeEtaBound itself contains VVr D l.
The original hH1 and hH2 and adm6.2 leave VVr unchanged. The non-generator
ArchimedeanSignatureMatching also contains VVr. No premise supplies its
vanishing. Retain the full arithmetic support S, including S intersect gset.

Exact corrected sharper local budget:
  S = resChar image of nontrivial twisted places in L.supp;
  gset = {D.host.g 0, D.host.g 1};
  B(l) = lamG(l) + 2/l^2 + VVr(l) + vhE(l)
       + 1_{l notin gset}(nuL(l)+vG(l)), with vG=padicValNat of restRowsFiniteGroupCard.
Then etaSum(L,j) <= dZ0_j * sum_{l in S} log(l) B(l).
This follows by the actual generator bound, the unchanged non-generator
branch and etaSum_eq_sum. The generator savings are nuL and vG, NOT VVr.
Compared with native U, the exact nonnegative difference is
  dZ0_j * sum_{l in S intersect gset} log(l)(nuL(l)+vG(l)).
The finite cohomology term still equals sum_{l in S} vvTerm(D,l)
by primality and the original vvTerm definition. The two generator
primes can be budgeted separately (cardinality <=2), but a bound on their
number alone does not bound their lengths. A budget for S minus gset
does not imply a budget for S without controlling the other summand.

Scalar negative control: eta=1, other allowance=0, cohomology allowance=1
satisfies eta <= other + cohomology but not eta <= other. This is a
countermodel to the proposed algebraic deletion, not a constructed native D7.
Executed JS 12 source-pin/anchor and negative-control checks,
6144 exact small nonnegative integer budget configurations,
2160 strict savings. Reproduce by looping g in {false,true},
rank,nu,idx,core,vv in {0,1,2,3}, h in {0,1,2} and comparing
old=rank*(core+vv+h+nu+idx) and
new=rank*(core+vv+h+(g?0:nu+idx)).
These checks only exercise the identity, not arithmetic estimates.

Original source-visible graph (no new kernel edges):
topDesWin -> divinN_of_hypV -> LinkN_at <- native export_bound_of_admissible
-> etaSum_le -> etaAt_le_g / etaAt_le -> GeneratorPrimeEtaBound /
ArchimedeanSignatureMatching + original admission.
Reduced candidate graph: same two branches -> rh_etaSum_branch_support
-> finite support aggregation -> proposed finite-support export and
same-family division adapter. Retain original etaSum_le, global VVle,
all-prime ShaFinOdd D and all same-host quantifiers pending verified bridges.
Do not mark any of these dependencies closed or globally unreachable.
The only prospective removable arithmetic hypothesis at this local
consumer is summability in the final enlargement to tsum, not finiteness
or a uniform cohomology estimate for the actual support.

Exact native files:
src/Formalism/SharpRestriction/LevelLetterCocycles/MemPrimesOverOfMem.lean a85df2fdf8a763b30b3e7feca66b0504c43e1cec
src/Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean f081fae4c63b50b55ded73f12f55732580e4c65e
src/Formalism/SharpRestriction/LevelLetterCocycles/ExportBoundOfAdmissible.lean 18cfead342c13ce1dca9be62499fbf0dfcfcf316
Original etaSum_le lines 558-647; TwistedPlaces lines 123,143-146,
154-157,218-222,323; export_bound_of_admissible actual caller.
CI status records on cathedral-research-state re-read:
rh-recursive-reduction-strip-root-20261125 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc PASS (45577239749);
rh-proof-term-prune-native-20261125 7da354941e402b6f8b364ed03d8c5c82d27b7717 PASS (45576756833).
These are old engine baselines only. Actual Landau header-fix job
45652878741 GitHub workflow success but compute status ERROR
(blob 3b96d6794eccfcc6a96c35ca97c7cf0c270e7f83): missing
unqualified scans, elaboration errors and sorryAx in the new adapter.
Do not count it as Lean PASS. Native lean/lake absent locally.
No candidate axiom output, no native reduction-engine run on this theorem.
No changed protected workflow or frozen source. No URT benefit asserted.

RESUME HERE: correct the generator-prime suggestion in the living
cohomology bridge; replay this theorem and finite-support export together
in the existing pinned native batch; use the two actual branches as
rules for rh_reduce/rh_auto/rh_auto_frontier and scan/prune with fully
qualified names, compare original and replacement caller edges and axioms.
Prove the remaining finite support length budget including both generator
primes on the SAME record; do not advance verification state without logs.
HANDOFF TO integration, geometry, Galois, kernel. RH OPEN.
-/
import Formalism.SharpRestriction.LevelLetterCocycles.ExportBoundOfAdmissible

noncomputable section
namespace Formalism.MainNotions.TwistedPlaces
open Formalism.BasicNotions Formalism.MainNotions NumberField IsDedekindDomain
variable {D : D7}

open Classical in
def rhBranchBudget (L : SizeData₂ D) (tb : Tab L) (C : ℝ) (l : ℕ) : ℝ :=
  if l ∈ gset D then
    lamG L tb C l + 2 / (l : ℝ)^2 + VVr D l + vhE D l
  else
    nuL D l + 2 / (l : ℝ)^2 + lamG L tb C l + VVr D l + vhE D l +
      (padicValNat l D.what₂.restRowsFiniteGroupCard : ℝ)

open Classical in
theorem rh_etaSum_branch_support (L : SizeData₂ D) (tb : Tab L) (C : ℝ)
    (P : ParameterChoice' D L) (hA : AdmT L tb C P)
    {j : ℕ} (hj : j ∈ SizeData₂.lifts D) :
    etaSum L j ≤ (L.dZ0 j : ℝ) *
      ∑ l ∈ (L.supp.filter (fun w => D.what₂.muAt w ≠ D.what₂.mu0)).image
        (fun w => D.what₂.places.resChar w),
          Real.log l * rhBranchBudget L tb C l := by
  classical
  obtain ⟨h1, h2, h3, h4, h5, h6, hRa, hRb, hRc, hRd, hBand, hRe, hExc, hRf, hRg, hRh, hPar⟩ := hA
  have hC : 0 < C := lt_of_lt_of_le P.CLw_pos hPar.1
  set S := (L.supp.filter (fun w => D.what₂.muAt w ≠ D.what₂.mu0)).image
    (fun w => D.what₂.places.resChar w) with hSdef
  have hSp : ∀ l ∈ S, l.Prime := by
    intro l hl
    obtain ⟨w, _, rfl⟩ := Finset.mem_image.1 hl
    exact D.what₂.places.resChar_prime w
  have hper : ∀ l ∈ S, etaAt L j l ≤
      Real.log l * ((L.dZ0 j : ℝ) * rhBranchBudget L tb C l) := by
    intro l hl
    have hp := hSp l hl
    by_cases hlg : l ∈ gset D
    · simpa only [rhBranchBudget, lamG, if_pos hlg] using
        (etaAt_le_g L tb C hRh h6 hj hlg)
    · have hsig0 : 0 ≤ nuL D l + 2 / (l : ℝ)^2 := by
        have := nuL_nonneg D l
        positivity
      have hVVo0 := VVr_nonneg D l
      have hvG0 : 0 ≤ (padicValNat l D.what₂.restRowsFiniteGroupCard : ℝ) := by positivity
      have hvh := vhE_nonneg D l
      have hlam0 : 0 ≤ lamG L tb C l := by
        simp only [lamG, if_neg hlg]
        exact lamB_nonneg L tb hC hp.two_le
      have hU0 : 0 ≤ rhBranchBudget L tb C l := by
        simp only [rhBranchBudget, if_neg hlg]
        linarith
      refine etaAt_le L hj hlg hU0 h1 h2 h3 ?_
      intro i hti hli π hπ
      have hl' : D.nd.l i ∉ gset D := hli ▸ hlg
      have hloc := loc_le_lamB L tb C hC h5 hRa hRb hRc hRd hBand hRe hRf hRg i hti hl'
      have h4' := h4 i hti hl' π hπ
      have h6' := h6.1 i hti π hπ
      rw [hli] at hloc h4' h6'
      simp only [rhBranchBudget, lamG, if_neg hlg]
      linarith
  rw [etaSum_eq_sum, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro l hl
  refine (hper l hl).trans (le_of_eq (by ring))

#print axioms rh_etaSum_branch_support
end Formalism.MainNotions.TwistedPlaces

-- Native engine replay target:
-- Formalism.MainNotions.TwistedPlaces.rh_etaSum_branch_support
-- Formalism.MainNotions.TwistedPlaces.etaSum_le
-- Formalism.MainNotions.TwistedPlaces.etaAt_le_g
-- Formalism.MainNotions.TwistedPlaces.export_bound_of_admissible

-- Executable scalar negative control; not a native D7 counterexample.
example : ∃ a v eta : ℝ, 0 ≤ a ∧ 0 ≤ v ∧ eta ≤ a + v ∧ ¬ eta ≤ a := by
  exact ⟨0, 1, 1, by norm_num, by norm_num, by norm_num, by norm_num⟩
