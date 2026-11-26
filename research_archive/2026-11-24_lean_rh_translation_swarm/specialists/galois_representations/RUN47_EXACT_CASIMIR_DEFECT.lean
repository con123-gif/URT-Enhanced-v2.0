import Development.WeilBound.RepresentationTheoryGL.CasimirAlgebra.KugaCoordinates.ClozelCohomological
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN47 lane 5 — 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED.
RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine; upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream 90b857677a044ffb6742467c33841874a93b254d,
not migrated. Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest peers de7fd645,8ebb60f6,03d8a69f,088776f3,f3faec21,98267b5b,
2c6af8dc,8d7348e7,58dbb472,14448eec,d3079b63,5fb90283,05da337a,ff996d30
examined by commit index; integration, literature and character patches read.
RUN46 isolated C_omega <= T_omega. Here work UPSTREAM at the native
CasBound -> CoefGlue -> Clozel -> CardK/P supplier, not another downstream
Kuga reformulation.

For one actual tableau fibre S=fib lab tau let S_c be a colour column,
N=||f||^2 for the SAME f=J*v in colAnti, R(p,q)=Re <f,swap(p,q) f>.
Set Y_{p,B}=sum_{q in B} swap(p,q), g=f-Y_{p,B}f.
Source ReSwapSumLe already derives Yg=-|B|g and
<g,g>=(1+|B|)<f,g>. Retain the exact real identity (below) instead of
discarding its remainder in a pointwise upper bound:
   sum_{q in B} R(p,q) = N - ||g||^2/(1+|B|).
No new assumption. Identity is implicit in original proof, not a new
representation-theoretic theorem. It gives an exact aggregate defect.

For each UNORDERED pair of distinct nonempty columns A,B choose A to
be the shorter (ties arbitrary). IsTab.1/2 and S colour-closure identify
each column's row labels with a terminal segment of Fin n, so their
intersection has size min(|A|,|B|). R is symmetric. Thus directed cross
sum for A,B is twice the sum over p in A. Within a column all off-diagonal
terms are -N by alternation. Write nu_i=number of boxes at row i.
Using the exact expansion cas_expand' and the same count_up/count_eqb
identities as cas_count, we obtain the human-derived equality

  Re <f,Cas(S) f> =
    N * sum_i nu_i*(nu_i+2*i+1-n)
     - 2 * sum_{unordered {A,B}, |A|<=|B|} sum_{p in A}
           ||f-Y_{p,B} f||^2/(1+|B|).

Indeed the baseline after within-column subtraction is
n*|S| - sum_c |S_c|*(|S_c|-1) + 2*sum_{A<B} min(|A|,|B|).
The first two terms equal sum_i nu_i*(2*i+2-n);
the last term is sum_i nu_i*(nu_i-1), since the terminal intervals
share exactly min(|A|,|B|) labels. Empty S gives zero; no zero divisor,
since 1+|B|>0. Ties are counted only once; the exact sum is independent
of which equal-size column is selected by symmetry of R.
The deficit is zero iff each selected g is zero. This is stronger
information than separate cross bounds; no claim of strict positivity
for all native f or of a uniform positive gap. For f=0 equality holds.
In CoefGlue the determinant twist scalar is then cancelled by CGlue.arith
and the same isometric embedding J (hJJ); no per-embedding independent
choice of coefficient allowed. This gives exact slack at the actual
coefficient quadratic-form level. The aggregate identity is a human
derivation; the certificate below implements the local exact identity
and substitutes its corollary at actual casBound and Clozel callers.
The old CasBound proof remains valid and retained; this is not independent
proof of all cohomology or a quantitative Frobenius/class-group bound.

Source blobs under src/Development/WeilBound/RepresentationTheoryGL/CasimirAlgebra/KugaCoordinates/:
ReSwapSumLe.lean 00462ce8ebb9857c9de0806f55c4472bbbe80f7b
CasBoundHolds.lean 770ed01a2e5609830a3977e169507923b211bb1b
CountCross.lean cbef1876b5898ffcddd3354dcadb0a1eac589081
CountSame.lean 7a49a36df137e67caa3c0ed8ded7472a96b69172
CoefficientGluing/CoefGlueHolds.lean 3669b45f99cef3d2e62315ae483b33d1ada2af03
ClozelCohomologicalOfRest.lean d99709046a6bb8de2c6b746191ad56cdfe75c6da
Executed 17 fail-on-error source hash / anchor / transformation checks in V8.
No numerical model used. Lean/lake/elan unavailable locally; actual baseline
status.json for runs 45577239749 and 45576756833 fetched, success only for
those historic jobs. No candidate CI result. New kernel-closed nodes: 0.
Old graph: clozelCohomological_of_three -> of_rest -> coefGlue_holds
 -> casBound_holds -> cas_count, re_swapSum_le', cas_expand'.
Candidate: clozelCohomological47 -> of_rest -> coefGlue_holds
 -> casBound47 -> cas_count, re_swapSum_le47 -> swap_defect47, cas_expand'.
All other exact type, value, constructor and axiom dependencies retained;
unexpanded nodes remain open. Cache key pin/toolchain/E,a,pi,Xi,lab,tau,
J,v,col,b,S, actual f. No URT ranking or claimed speedup.
RESUME HERE: compile exact identity and actual caller in pinned overlay with
the three existing reducer modules, compare graph and axiom evidence; then
formalize aggregate defect using the native unordered-column orientation
and test whether same-cochain contraction or rank-three/count consumer
uses the slack. If not, retain the original fallback and prioritize actual
uniform CountI/CountV Frobenius or class-group supplier over more equivalent
energy rewrites. No closure until independently checked.
HANDOFF TO kernel, literature, integration, audit.
-/

noncomputable section
open Finset Matrix
namespace PositivityTheory.Rg.Cz
section
variable {n : ℕ} {Q : Type} [Fintype Q] [DecidableEq Q]

theorem swap_defect47 (f : TV n ℂ Q) (B : Finset Q) (p : Q)
    (hp : p ∉ B) (hf : ∀ q ∈ B, ∀ q' ∈ B, q ≠ q' → pm (Equiv.swap q q') f = -f) :
    (star (f - ∑ q ∈ B, pm (Equiv.swap p q) f) ⬝ᵥ (f - ∑ q ∈ B, pm (Equiv.swap p q) f)).re =
      (1 + (B.card : ℝ)) * ((star f ⬝ᵥ f).re -
        (∑ q ∈ B, star f ⬝ᵥ pm (Equiv.swap p q) f).re) := by
  set Y : Module.End ℂ (TV n ℂ Q) := ∑ q ∈ B, pm (Equiv.swap p q) with hY
  have hYf : Y f = ∑ q ∈ B, pm (Equiv.swap p q) f := by simp [hY, LinearMap.sum_apply]
  have hsa : ∀ u v : TV n ℂ Q, star u ⬝ᵥ Y v = star (Y u) ⬝ᵥ v := by
    intro u v
    simp only [hY, LinearMap.sum_apply, dotProduct_sum, star_sum, sum_dotProduct, dot_pm_swap]
  have hq : ∀ q ∈ B, (pm (Equiv.swap p q) : Module.End ℂ (TV n ℂ Q)) (Y f) =
      f - Y f + pm (Equiv.swap p q) f := by
    intro q hqB
    have hpq : p ≠ q := fun h => hp (h ▸ hqB)
    rw [hYf, ← Finset.add_sum_erase B _ hqB, map_add, map_sum, pm_pm, Equiv.swap_mul_self]
    have : ∀ q' ∈ B.erase q, (pm (Equiv.swap p q) : Module.End ℂ (TV n ℂ Q)) (pm (Equiv.swap p q') f) =
        -(pm (Equiv.swap p q') f) := by
      intro q' hq'
      obtain ⟨hne, hq'B⟩ := Finset.mem_erase.mp hq'
      have hpq' : p ≠ q' := fun h => hp (h ▸ hq'B)
      have hperm : Equiv.swap p q * Equiv.swap p q' = Equiv.swap p q' * Equiv.swap q q' := by
        ext x
        simp only [Equiv.Perm.coe_mul, Function.comp_apply, Equiv.swap_apply_def]
        split_ifs <;> simp_all
      rw [pm_pm, hperm, ← pm_pm, hf q hqB q' hq'B (Ne.symm hne), map_neg]
    rw [Finset.sum_congr rfl this, Finset.sum_neg_distrib]
    have h1 : (pm 1 : Module.End ℂ (TV n ℂ Q)) f = f := rfl
    rw [h1]
    abel
  have hYY : Y (Y f) = (B.card : ℂ) • f - (B.card : ℂ) • Y f + Y f := by
    conv_lhs => rw [hY, LinearMap.sum_apply]
    rw [Finset.sum_congr rfl hq, Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
      Finset.sum_const, ← hYf]
    simp [Nat.cast_smul_eq_nsmul]
  set g := f - Y f with hg
  have hYg : Y g = -((B.card : ℂ) • g) := by
    rw [hg, map_sub, hYY, smul_sub]
    abel
  have hgg : star g ⬝ᵥ g = (1 + (B.card : ℂ)) * (star f ⬝ᵥ g) := by
    conv_lhs => rw [hg]
    rw [star_sub, sub_dotProduct, ← hsa, ← hg, hYg, dotProduct_neg, dotProduct_smul, smul_eq_mul]
    ring
  have hre : (star g ⬝ᵥ g).re = (1 + (B.card : ℝ)) * (star f ⬝ᵥ g).re := by
    rw [hgg]
    simp [Complex.mul_re]
  have hfg : star f ⬝ᵥ g = star f ⬝ᵥ f - ∑ q ∈ B, star f ⬝ᵥ pm (Equiv.swap p q) f := by
    rw [hg, dotProduct_sub, hYf, dotProduct_sum]
  rw [hfg, Complex.sub_re] at hre
  simpa only [hg, hYf] using hre

theorem re_swapSum_le47 (f : TV n ℂ Q) (B : Finset Q) (p : Q)
    (hp : p ∉ B) (hf : ∀ q ∈ B, ∀ q' ∈ B, q ≠ q' → pm (Equiv.swap q q') f = -f) :
    (∑ q ∈ B, star f ⬝ᵥ pm (Equiv.swap p q) f).re ≤ (star f ⬝ᵥ f).re := by
  let g : TV n ℂ Q := f - ∑ q ∈ B, pm (Equiv.swap p q) f
  have hnn : 0 ≤ (star g ⬝ᵥ g).re := by
    simp only [dotProduct, Pi.star_apply, Complex.re_sum]
    refine Finset.sum_nonneg fun I _ => ?_
    simp only [Complex.mul_re, Complex.star_def, Complex.conj_re, Complex.conj_im]
    nlinarith [sq_nonneg (g I).re, sq_nonneg (g I).im]
  have hd := swap_defect47 f B p hp hf
  change (star g ⬝ᵥ g).re = _ at hd
  have hpos : 0 < (1 + (B.card : ℝ)) := by positivity
  have hnon : 0 ≤ (1 + (B.card : ℝ)) * ((star f ⬝ᵥ f).re -
      (∑ q ∈ B, star f ⬝ᵥ pm (Equiv.swap p q) f).re) := hd ▸ hnn
  by_contra h
  have hneg : (star f ⬝ᵥ f).re - (∑ q ∈ B, star f ⬝ᵥ pm (Equiv.swap p q) f).re < 0 :=
    sub_neg.mpr (lt_of_not_ge h)
  exact (not_lt_of_ge hnon) (mul_neg_of_pos_of_neg hpos hneg)

end

theorem casBound47 : CasBound := by
  intro n Q _ _ C _ col b S hT hS f hf
  rw [cas_expand']
  have key : (star f ⬝ᵥ ((((n * S.card : ℕ) : ℂ) • (1 : Module.End ℂ (TV n ℂ Q)) +
      ∑ p ∈ S, ∑ q ∈ S.erase p, pm (Equiv.swap p q) : Module.End ℂ (TV n ℂ Q)) f)).re =
      ((n * S.card : ℕ) : ℝ) * (star f ⬝ᵥ f).re +
        ∑ p ∈ S, ∑ q ∈ S.erase p, (star f ⬝ᵥ pm (Equiv.swap p q) f).re := by
    simp only [LinearMap.add_apply, LinearMap.smul_apply, Module.End.one_apply, LinearMap.sum_apply,
      dotProduct_add, dotProduct_smul, dotProduct_sum, Complex.add_re, Complex.re_sum, smul_eq_mul]
    simp
  rw [key]
  refine cas_count hT hS (fun p q => (star f ⬝ᵥ pm (Equiv.swap p q) f).re) _ ?_ ?_ ?_
  · intro p q
    simp only [Equiv.swap_comm]
  · intro p q hpq hne
    simp [hf p q hpq hne]
  · intro p _ c hc
    have h1 := re_swapSum_le47 f (S.filter fun q => col q = c) p
      (by simp only [Finset.mem_filter, not_and]; exact fun _ h => hc h.symm)
      (by
        intro q hq q' hq' hne
        simp only [Finset.mem_filter] at hq hq'
        exact hf q q' (hq.2.trans hq'.2.symm) hne)
    simpa only [Complex.re_sum] using h1


theorem clozelCohomological47 : GlobalTheory.Published.ClozelCohomological :=
  clozelCohomological_of_rest kType_holds GK.gkData_holds whitLie_holds
    kugaAbs_holds kugaGlue_holds coefGlue_holds Coch.cochain_holds casBound47

example : CasBound := by
  first | (rh_reduce 2 using [casBound47]; done)
        | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact casBound47

end PositivityTheory.Rg.Cz

rh_prune PositivityTheory.Rg.Cz.re_swapSum_le' as RH47NativeSwapPruned
rh_scan PositivityTheory.Rg.Cz.casBound_holds limit 2000
rh_scan PositivityTheory.Rg.Cz.swap_defect47 limit 2000
rh_scan PositivityTheory.Rg.Cz.casBound47 limit 2000
rh_scan PositivityTheory.Rg.Cz.clozelCohomological47 limit 2000
#print axioms PositivityTheory.Rg.Cz.swap_defect47
#print axioms PositivityTheory.Rg.Cz.re_swapSum_le47
#print axioms PositivityTheory.Rg.Cz.casBound47
#print axioms PositivityTheory.Rg.Cz.clozelCohomological47
