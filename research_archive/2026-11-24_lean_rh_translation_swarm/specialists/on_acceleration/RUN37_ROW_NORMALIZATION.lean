import Formalism.LocalToGlobal.SiegelLatticeTheory.FlagStabilizerTensors.TheoremSConclusion
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN37, lane 14, 25 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION / PREPARED
LEAN CANDIDATE (not compiled). RH OPEN.
Upstream 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4,
SWARM, HANDOFF, EXPANSION, AGENTS, joint-loss note 0810c534 and
peer commits 678de808, c0c7d3f7, 3232ac0e, previous lane dcf3192e read.
Do not duplicate peers' signed translation sum or gauge calibration.

RESULT 1: RUN36's fixed-D construction is already a native theorem.
ClosedVolumeStatements/CutLeavesDeepOutright.lean proves
CutLeavesDeep_outright D using cutLeavesDeep_of_betaInt D and
betaInt_holds at exactly the same D. No new proof of this supplier
is needed. CoefCutDeep.lattice_input_of_open_leaves then gives
DataCut.RowsInputP D via Closed.NormProd_holds D.
TheoremSConclusion.rowsInputP_of_dataCut converts to the DISTINCT
SpectralTiesReal.RowsInputP D type expected by theoremS_closedP;
the adapter changes the order of PrimeHyp and Compat only.
This supplies the actual third premise hRIA of theoremS_closedP,
uniformly in D, with the original hypotheses internal to the native
theorems. The previous RUN36 replay overlay is unnecessary as a
separate mathematical premise. The precise higher caller assembling
TheoremSClosedHypotheses is still to be traced; this is a local source
supplier and consumer, not a native root-to-leaf reachability audit.

RESULT 2: remove the positive normalisation parameter from the
RowsPSD proof search by exact homogeneity, not an approximation.
For fixed D, F0, what2, u,u', vR, label kappa and point x,
n0(c,T,T',w)=c * (sqrt |Norm(...)|)^(k-1) (native definition).
Hence n0(nc*alpha)=alpha*n0(nc).
Real.sqrt_mul' with alpha>0 proves rowVec(nc*alpha,x)
= rowVec(nc,x)/sqrt(alpha), even for nonpositive n0 or zero phi:
Lean's total division by zero agrees on both sides. A missing
ptOfList gives zero on both sides. All numerators are unchanged.
Conjugation of the real scale then gives each product
r_alpha(p) conjugate(r_alpha(q)) = r_1(p) conjugate(r_1(q))/alpha.
No estimate, absolute-value inequality or separate geometric witness.
It follows both for the tsum rowKer and for EVERY finite subset R
in the actual DataInst.RowsPSD consumer:
  (sd/alpha) K - sum_R r_alpha r_alpha* =
  (sd K - sum_R r_1 r_1*)/alpha.
Positive scalar multiplication preserves and reflects PSD.
Thus RowsPSD(nc,alpha) iff RowsPSD(nc,1) for alpha>0.
The matrix on the right is the only one requiring a substantive
positivity proof. The scalar label, nc, all row counts, exact
complex phases, point guards, Finiteness and original host data
are retained. Alpha is not removed globally from RowsSum,
DensInput, RowsInput, or subsequent normalization-sensitive consumers.
Neither establishes a uniform quantitative bound on sd or the actual
same-host rank/count/entropy/local-gain/prime-window conditions.
Negative control: alpha=0 makes the scaled matrix zero even if the
original 1x1 matrix is [-1]; so strict positivity is indispensable.

Original source-reference graph (not a complete kernel graph):
theoremS_closedP -> hRIA (SpectralTiesReal.RowsInputP for every D)
theoremS_of_conj -> theoremS_closedP + remaining 18 hypotheses
rowsInputP_of_dataCut -> DataCut.RowsInputP
lattice_input_of_open_leaves -> rowsInputP_of_deep, NormProd_holds
CutLeavesDeep_outright -> cutLeavesDeep_of_betaInt, betaInt_holds
rowsInputP_of -> rowsFinAt, rowsDomAtP, rowLabelExists_of, psdOn_of_full
rowsDomAtP_of -> hRD, hTU, density bound, normalized FiberCntC, dom_points
RowsPSD -> PSDOn, rowVec, n0, finite Gram sum, supDens, Kr.
Proposed overlay:
rh37_rowsInputP_closed -> existing CutLeavesDeep_outright,
  lattice_input_of_open_leaves, rowsInputP_of_dataCut
rh37_rowsPSD_iff_one -> finite_psd_scale -> finite_kernel_scale,
  psd_div_iff -> rowVec_scale, gram_scale, n0, sqrt_mul', PSD.smul.
Original edges/axiom ledgers retained; no globally retired premise.
Cache key includes source/toolchain pins, declaration, all instantiated
D/host/model, u,u', F0, what2, vR, kappa, nc, point and finite R.
Only alpha is normalized, never cache across different hosts.
Backtrack to original rowsDomAtP_of / rowsInputP_of if any replay fails.

Executed source validation: 34 fail-on-error checks across nine exact
upstream blobs (one SHA plus literal anchors per file):
ClosedVolumeStatements/CutLeavesDeepOutright ea0290ca52422042d56510e8c7dfb48a31675439
RankPointCounts/CoefCutDeep 0c363dee7fb1ff22e2a73205eb007141aaf8b6c2
FlagStabilizerTensors/TheoremSConclusion bb73664285bb9e46cd5a597713d21294008be5f1
FlagStabilizerTensors/TheoremSClosedP 4c972cbc1993322d79dadc9674133fa63c0fe097
CokernelGLCounts/DataInst 0faa5aa11af43f784043da332f8075db9b8cf734
RankPointCounts/DataCut ba94a5f0910644b63687222a7a3a3affcff8fe82
RankPointCounts/RowsInputPOfTermsFiniteSig c01da1ef958071738274486ac807f2ed21c85ce5
SharpRestriction/CuspSpanNormBounds/LocalGroupInFamilyNontrivial 7ce78377488099097b75282e1d6725d16dde1138
HermitianCurvature/StatementTB efd4098464e9d294953ffc1c3e47ae3941ee9f3f
Mathlib pinned sqrt_mul' and PosSemidef.smul separately inspected.
No runtime benchmark: mathematical proof simplification, not measured
speedup. No synthetic geometric data. Local lean/lake unavailable.
CI status.json for runs 45577239749 and 45576756833 reread, both
returncode 0 (blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717).
They do not verify THIS file. No native replay or new axiom evidence.
No new root obligation discharged, no URT claim.

RESUME HERE: run this exact certificate in existing pinned native
runner, especially rh37_rowsPSD_iff_one and the typed hRIA adapter.
If checked, use alpha=1 in rowsDomAtP_of/rowsInputP_of, propagate the
original interface by homogeneity, then locate the actual caller
assembling TheoremSClosedHypotheses and audit transitive roles.
Prioritize same-host VWinAt and signed loss, not more normalization.
HANDOFF TO: dependency, kernel, integration, audit and human editor.
-/

noncomputable section
open NumberField Formalism.BasicNotions Formalism.MainNotions.S
open Formalism.MainNotions.S.Lat Formalism.MainNotions.S.LocalSplitGroups
open Formalism.FourierDecayAlt Formalism.L2.SG.DataInst
open Formalism.L2.SG.DataCut Formalism.L2.SG.TermDef
open scoped Classical ComplexOrder

namespace RH37

theorem rh37_rowsInputP_closed (D : D7) : Formalism.L2.SG.SpectralTiesReal.RowsInputP D := by
  apply Formalism.L2.SG.TheoremSConclusion.rowsInputP_of_dataCut
  first
  | (rh_reduce 2 using [Formalism.L2.SG.Pf.Coef.lattice_input_of_open_leaves,
        Formalism.L2.SG.Closed.CutLeavesDeep_outright]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact Formalism.L2.SG.Pf.Coef.lattice_input_of_open_leaves
      (Formalism.L2.SG.Closed.CutLeavesDeep_outright D)

section Rows

variable {D : D7} {u u' : D.what₂.Word}
  {F0 : FlagG (VS D) D.R.rS (CntLocal.Tn u)}
  {what₂ : Finset (Submodule (𝓞 D.host.E) (VS D).V)}
variable (vR : TermDef.Term D u u' F0 what₂ → ℝ)
  (κ : TermDef.Term D u u' F0 what₂ → ℕ)

theorem rowVec_scale (nc α : ℝ) (hα : 0 < α) (ρ : ℕ) (x : TB.Pt D.host.E) :
    rowVec vR κ (nc * α) ρ x =
      rowVec vR κ nc ρ x / (Real.sqrt α : ℂ) := by
  rcases hx : ptOfList (D.R.rS + 1) x with _ | w
  · simp [rowVec, hx]
  · have hN : n0 (nc * α) (D.mem u).A.T (D.mem u').A.T w =
        n0 nc (D.mem u).A.T (D.mem u').A.T w * α := by
      unfold n0
      ring
    simp only [rowVec, hx, hN, Real.sqrt_mul' _ hα.le]
    push_cast
    rw [div_div]
    congr 1 <;> ring

theorem gram_scale (a b : ℂ) (α : ℝ) (hα : 0 < α) :
    (a / (Real.sqrt α : ℂ)) * star (b / (Real.sqrt α : ℂ)) =
      (a * star b) / (α : ℂ) := by
  simp only [Complex.star_def, map_div₀, Complex.conj_ofReal]
  rw [div_mul_div_comm, ← Complex.ofReal_mul, Real.mul_self_sqrt hα.le]

theorem rowKer_scale (nc α : ℝ) (hα : 0 < α) (x y : TB.Pt D.host.E) :
    rowKer vR κ (nc * α) x y = rowKer vR κ nc x y / (α : ℂ) := by
  unfold rowKer
  rw [← tsum_div_const]
  apply tsum_congr
  intro ρ
  rw [rowVec_scale vR κ nc α hα ρ x, rowVec_scale vR κ nc α hα ρ y]
  exact gram_scale _ _ α hα

theorem finite_kernel_scale (nc α sd : ℝ) (hα : 0 < α)
    (K : TB.Pt D.host.E → TB.Pt D.host.E → ℂ) (R : Finset ℕ)
    (p q : TB.Pt D.host.E) :
    ((sd / α : ℝ) : ℂ) * K p q -
      ∑ ρ ∈ R, rowVec vR κ (nc * α) ρ p * (starRingEnd ℂ) (rowVec vR κ (nc * α) ρ q) =
    ((sd : ℂ) * K p q -
      ∑ ρ ∈ R, rowVec vR κ nc ρ p * (starRingEnd ℂ) (rowVec vR κ nc ρ q)) / (α : ℂ) := by
  have hs : (∑ ρ ∈ R, rowVec vR κ (nc * α) ρ p *
      (starRingEnd ℂ) (rowVec vR κ (nc * α) ρ q)) =
      (∑ ρ ∈ R, rowVec vR κ nc ρ p * (starRingEnd ℂ) (rowVec vR κ nc ρ q)) / (α : ℂ) := by
    rw [Finset.sum_div]
    apply Finset.sum_congr rfl
    intro ρ hρ
    rw [rowVec_scale vR κ nc α hα ρ p, rowVec_scale vR κ nc α hα ρ q]
    exact gram_scale _ _ α hα
  rw [hs, Complex.ofReal_div]
  ring

theorem psd_div_iff {ι : Type} (Y : Finset ι) (K : ι → ι → ℂ)
    (α : ℝ) (hα : 0 < α) :
    TB.PSDOn Y (fun p q => K p q / (α : ℂ)) ↔ TB.PSDOn Y K := by
  unfold TB.PSDOn
  have hE : (Matrix.of fun x y : Y => K x y / (α : ℂ)) =
      α⁻¹ • (Matrix.of fun x y : Y => K x y) := by
    ext i j
    simp [Matrix.smul_apply, Algebra.smul_def, Complex.ofReal_inv,
      div_eq_mul_inv, mul_comm]
  rw [hE]
  constructor
  · intro h
    have h' := h.smul hα.le
    rw [smul_smul, mul_inv_cancel₀ hα.ne', one_smul] at h'
    exact h'
  · intro h
    exact h.smul (inv_nonneg.mpr hα.le)

theorem finite_psd_scale (nc α sd : ℝ) (hα : 0 < α)
    (K : TB.Pt D.host.E → TB.Pt D.host.E → ℂ)
    (Y : Finset (TB.Pt D.host.E)) (R : Finset ℕ) :
    TB.PSDOn Y (fun p q => ((sd / α : ℝ) : ℂ) * K p q -
      ∑ ρ ∈ R, rowVec vR κ (nc * α) ρ p * (starRingEnd ℂ) (rowVec vR κ (nc * α) ρ q)) ↔
    TB.PSDOn Y (fun p q => (sd : ℂ) * K p q -
      ∑ ρ ∈ R, rowVec vR κ nc ρ p * (starRingEnd ℂ) (rowVec vR κ nc ρ q)) := by
  simp_rw [finite_kernel_scale vR κ nc α sd hα K R]
  exact psd_div_iff Y _ α hα

end Rows

section RowsPSD

variable {D : D7} {u u' : D.what₂.Word}
  {F0 : FlagG (VS D) D.R.rS (CntLocal.Tn u)}
  {what₂ : Finset (Submodule (𝓞 D.host.E) (VS D).V)}
  {Wp Wq : InfinitePlace D.host.E → Type}
  [∀ x, NormedAddCommGroup (Wp x)] [∀ x, InnerProductSpace ℂ (Wp x)]
  [∀ x, NormedAddCommGroup (Wq x)] [∀ x, InnerProductSpace ℂ (Wq x)]

theorem rh37_rowsPSD_iff_one (S : C.HidaSetting D.host.E Wp Wq)
    (δ : ∀ p : PlF D, (D.s.atP p).Fp)
    (M : ∀ p : PlF D, Loc.Model (D.s.atP p).Fp (D.s.atP p).Ep)
    (L : CntLocal.LocSp D M) (ϖ : ∀ p : PlF D, 𝒪[(D.s.atP p).Fp])
    (vR : TermDef.Term D u u' F0 what₂ → ℝ)
    (κ : TermDef.Term D u u' F0 what₂ → ℕ) (nc α : ℝ) (hα : 0 < α) :
    RowsPSD S δ M L u u' F0 what₂ ϖ vR κ nc α ↔
    RowsPSD S δ M L u u' F0 what₂ ϖ vR κ nc 1 := by
  unfold RowsPSD
  simp only [div_one, mul_one]
  constructor
  · intro h Y hY R
    exact (finite_psd_scale vR κ nc α _ hα _ Y R).mp (h Y hY R)
  · intro h Y hY R
    exact (finite_psd_scale vR κ nc α _ hα _ Y R).mpr (h Y hY R)

end RowsPSD
end RH37

rh_scan Formalism.L2.SG.Closed.CutLeavesDeep_outright limit 2000
rh_scan Formalism.L2.SG.PoincareAmplitudeLowerBounds.theoremS_closedP limit 2000
rh_scan RH37.rh37_rowsInputP_closed limit 2000
rh_scan RH37.rh37_rowsPSD_iff_one limit 2000
rh_prune RH37.rh37_rowsInputP_closed as RH37RowsInputPruned
#print axioms Formalism.L2.SG.Closed.CutLeavesDeep_outright
#print axioms RH37.rh37_rowsInputP_closed
#print axioms RH37.rowKer_scale
#print axioms RH37.rh37_rowsPSD_iff_one
