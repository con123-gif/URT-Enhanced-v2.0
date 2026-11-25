import Formalism.LocalToGlobal.SiegelLatticeTheory.CokernelGLCounts.RankPointCounts.DualFamilyCounting.FormulaCOf
import Formalism.LocalToGlobal.SiegelLatticeTheory.FlagStabilizerTensors.TheoremSClosedP
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN32 — exact row count before local density decomposition; actual positivity
consumer separated. 25 Nov 2026, lane 14. SOURCE-MATCHED HUMAN DERIVATION;
native executable candidate PREPARED, NOT compiled. RH OPEN.

Preflight: current ONE_EQUATION_MISSION b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
including mandatory engine and latest pyramid, SWARM, HANDOFF, EXPANSION,
AGENTS, live HUMAN_PROOF_ONE_EQUATION, research state/log/protocol/continuity,
RUN31 c11635a0, peer 0e5b40dc (uniform count), bc38f13b (Gram obstruction),
38b6cc25 (covolume one-sided bound), 56f51000 (terminal mass), a987e3f9
(level-one cohomology), 57f243bc/088245be (editor genus bridge), latest peer
commit list. This develops the actual caller certificate for 0e5b40dc,
not another height-shift optimization or independent RH route.

Compact human proof for the upstream row branch:
Fix the same D,u,u',F0,what2,Z and actual rational pair F' satisfying
the native flags, Gram positivity, congruence and row conditions. Set
U=UPair, M=MMof, h=(VS D).hT, n=k-1, A=massRows, q=nM(F,h,U,M).
If M is integral, GlueExists follows using cJ<=m<n. GlueMass at
cMass(E,F,n), then RowsGroupoid, directly gives the exact weighted identity
   nu(Z) A = cMass(E,F,n) q^n
       prod'_p alphaStd(E,p,n)/alphaStd(E,p,n-cJ(h,U,M,p)).
If M is nonintegral, no unimodular lattice can glue to it. The empty
representative set gives nu A=0; if A=0 native nu is zero by division
convention, otherwise cancel A. Thus nu=0, without invoking NotIntDens.
For A>0 divide; apply NormMM only to convert q to the scaled determinant.
This is exactly the count in peer 0e5b40dc BEFORE hT1; its uniform
Euler-tail bound can consume this identity without a local density
factorization. No individual local density, local uniformizer or
agreement data appear in the raw equality. RatPair is still required
to supply F' when not already fixed; NormMM is still needed for the
determinant form; GlueMass and all its upstream hypotheses survive.
The exact native FormulaExplicit remains necessary where densP is
actually used. Reconstruct it by the original hT1 and NormMM;
rh32_density_formula_of preserves that original statement. No claim
that the full weighted row sum, near-Welch bound, or RH is established.

A second real consumer is rowFormAllP_of: the only use of FormulaC
is (hFC D T u u' Lsp hLT hSt hcong).1, i.e. cExpl>0. The native
formulaC_of already proves this independently: RowLatExists provides
a lattice, rowsOK supplies a representative, and cExpl_pos' supplies
strict positivity. The replacement takes just that positive projection,
using the same host and row. All other caller inputs are unchanged.
The original statement follows by projection. Do NOT remove FormulaC
from theoremS_closedP: it has the distinct actual use hFm and passes
the full formula into theoremS_rec. In particular the full pair
spectral estimate and supDens/RowsSumC remain open.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Exact files under
src/Formalism/LocalToGlobal/SiegelLatticeTheory/:
  CokernelGLCounts/RankPointCounts/DualFamilyCounting/Assemble.lean db42734063141ba2d165174bb40a4f086a7cdd98
  CokernelGLCounts/RankPointCounts/DualFamilyCounting/StepsR.lean ec4f4d5d8e82a6e53c03d18bedf8eec77b91492d
  CokernelGLCounts/RankPointCounts/DualFamilyCounting/FormulaCOf.lean 2253304996dfb8e7629b8eb0d9b0ab80d1f6d601
  FlagStabilizerTensors/TheoremSClosedP.lean 4c972cbc1993322d79dadc9674133fa63c0fe097
  CokernelGLCounts/RankPointCounts/DualFamilyCounting/JordanExists.lean 725f5b7378e0393056a8b9cd6e14ebeacac70a8b
Additional source-visible root chain from peer 0e5b40dc:
TheoremSSelected -> theoremS_selected_of_loops (ThmSOwn a38627e2)
-> theoremS_closedP (TheoremSClosedP) -> theoremS_rec.
TheoremSClosedP at lines 231–256 uses only positivity in rowFormAllP_of,
at line 291 uses the stronger FormulaC. These are source-visible edges,
not a complete elaborated reachability certificate. RUN25 evidence stays.

Original local graph:
{"formulaExplicit_of":["HostDict","RatPair","PerpDef","MMChar","RowsGroupoid","DensAll","NormMM","GlueExists","GlueMass"],"formulaC_of":["formulaExplicit_of","DensMultInt","NotIntDens","OrbitFiniteR","RowLatExists","cExpl_pos'"],"rowFormAllP_of":["FormulaC","VolumeOddGeneric","VIndepAtAllP","NormalizingConstantPositiveAll"],"theoremS_closedP":["FormulaC","RowsSumC","RowFormAllP","other original premises"]}
Reduced overlay:
{"rh32_raw_count_of":["HostDict","PerpDef","MMChar","RowsGroupoid","GlueExists","GlueMass","fixed F'"],"rh32_density_formula_of":["RH32RawCount","HostDict","RatPair","DensAll","NormMM"],"rh32_pos_of_rows":["RowLatExists","rowsOK","cExpl_pos'","HermRepUnram"],"rh32_rowFormAllP_pos_of":["RH32CExplPos","VolumeOddGeneric","VIndepAtAllP","NormalizingConstantPositiveAll"]}
Only the count-only and positivity consumers are weakened; preserve
all original type/value/constructor/axiom edges, unresolved suppliers,
and original full-caller fallbacks. Cache key pin,D,u,u',F0,what2,Z,F',
integrality,actual caller; backtrack on mismatched row or failed replay.

Executed 33 fail-on-error connector JS source/blob/transformation checks
(five pinned blob matches; exact copied proof sections; one actual
positivity use; separate strong use retained; both integrality branches,
no density tokens in raw proof, no placeholders). These are STATIC
checks, not kernel checks. No synthetic data, no runtime benchmark or
URT superiority claimed: this is a premise/consumer split, not a
measured end-to-end speedup. No native lean/lake on local PATH.
Retrieved actual earlier CI status JSON for 45577239749 and 45576756833,
returncode 0, blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717. Only earlier engines and
conditional half-strip root checked. New axiom evidence pending.
Native command in pinned built environment with engine modules:
  lake env lean RUN32_DENSITY_FREE_COUNT.lean
Do not report new PASS until actual CI/native output is inspected.

RESUME HERE: native replay the raw-count/FormulaExplicit bridge and
actual rowFormAllP positive projection; pass the raw count with
0e5b40dc's Euler-tail bound to the nondegenerate weighted pair sum.
Determine whether theoremS_rec only needs its upper majorant or exact
densP/RowsSum identities; preserve strong consumers if needed.
HANDOFF TO integration/editor, geometry, theta, dependency, kernel
and independent audit. PARTIAL, no RH closure.
-/

noncomputable section
open NumberField Module Formalism.MainNotions.S Formalism.MainNotions.S.Lat Formalism.MainNotions.S.LocalSplitGroups Formalism.L2.SG.CntLocal
open Classical ValuativeRel

namespace Formalism.L2.SG.Pf
open Formalism.HermitianLattices.Ext.L3 Formalism.L2.SG.Pf.Cnt Formalism.L2.SG.Pf.Asm
attribute [local instance] Formalism.BasicNotions.Host.cmStar

def RH32RawCount : Prop :=
  ∀ (D : Formalism.BasicNotions.D7) (u u' : D.what₂.Word),
    (D.mem u).A.T ≡ (D.mem u').A.T [MOD (Lat.gS D) ^ 2] →
    ∀ (F0 : FlagG (VS D) D.R.rS (Tn u)) (what₂ : Finset (Submodule (𝓞 D.host.E) (VS D).V)),
      IsRowReps D F0 what₂ → ∀ (Z : MatZ D) (F' : LFlag (VS D) D.R.rS (Tn u')), F'.zt = F'.fl.z → ZhatL (lf D F0) F' = Z →
        Formalism.MainNotions.S.LocalSplitGroups.TotPos (GZ (Tn u) (Tn u') Z) →
        (Formalism.HermitianLatticesTheory.IsIntegralLat (VS D).hT (MMof D F0 F') →
          nu (Tn u') F0 what₂ Z * Formalism.MainNotions.S.Cnt.massRows D F0 what₂ =
            cMass D.host.E D.host.F (D.R.k - 1) *
              nM D.host.F (VS D).hT (UPair D F0 F') (MMof D F0 F') ^ (D.R.k - 1) *
              ∏' 𝔭 : {𝔭 : Ideal (𝓞 D.host.F) // 𝔭.IsMaximal},
                alphaStd D.host.E 𝔭.1 (D.R.k - 1) /
                alphaStd D.host.E 𝔭.1 (D.R.k - 1 - cJ (VS D).hT (UPair D F0 F') (MMof D F0 F') 𝔭.1)) ∧
        (¬ Formalism.HermitianLatticesTheory.IsIntegralLat (VS D).hT (MMof D F0 F') →
          nu (Tn u') F0 what₂ Z = 0)

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in
theorem rh32_raw_count_of (h0 : HostDict) (h2 : PerpDef) (h3 : MMChar)
    (h4 : RowsGroupoid) (g7 : GlueExists) (g9 : GlueMass) : RH32RawCount := by
  intro D u u' hT F0 what₂ hR Z F' hz hZ hP
  obtain ⟨hK, hF, hN⟩ := h0 D
  obtain ⟨hC, hPD, hUr, hWr⟩ := h2 D u u' hT F0 what₂ hR Z F' hz hZ hP
  obtain ⟨hLat, -⟩ := h3 D u u' hT F0 what₂ hR Z F' hz hZ hP
  have e4 := h4 D u u' hT F0 what₂ hR Z F' hz hZ hP
  have hnu0 : Formalism.MainNotions.S.Cnt.massRows D F0 what₂ = 0 → Formalism.L2.SG.CntLocal.nu (Tn u') F0 what₂ Z = 0 := by
    intro h0
    unfold Formalism.L2.SG.CntLocal.nu
    rw [show (∑ Λ ∈ what₂, wRow D F0 Λ) = Formalism.MainNotions.S.Cnt.massRows D F0 what₂ from rfl, h0, div_zero]
  constructor
  · intro hI
    have hcJ : ∀ 𝔭 : Ideal (𝓞 D.host.F), 𝔭.IsMaximal →
        cJ (VS D).hT (UPair D F0 F') (MMof D F0 F') 𝔭 <
          finrank D.host.E (orthK (VS D).hT (UPair D F0 F')) := by
      intro 𝔭 _
      have := cJ_le (VS D).hT (UPair D F0 F') (MMof D F0 F') 𝔭
      rw [hWr]
      omega
    have hne := g7 D.host.E D.host.F (VS D).V hK hF (VS D).hT (VS D).herm hN (UPair D F0 F') hC hPD
      ⟨(VS D).L0, (VS D).standardTuple_isLattice, (VS D).baseLattice_isUnimodular⟩ (MMof D F0 F') hLat hI hcJ
    have hMC : MassConst D.host.E D.host.F (finrank D.host.E (orthK (VS D).hT (UPair D F0 F')))
        (cMass D.host.E D.host.F (D.R.k - 1)) := by
      rw [hWr]
      exact (cMass_spec hK hF (D.R.k - 1) (by omega)).2
    obtain ⟨s, hs1, hs2, hs3, hsum⟩ := g9 D.host.E D.host.F (VS D).V hK hF (VS D).hT (VS D).herm hN
      (UPair D F0 F') hC hPD (MMof D F0 F') hLat hI hne _ hMC
    have e4' := e4 s ⟨hs1, hs2, hs3⟩
    rw [hsum, hWr] at e4'
    exact e4'
  · intro hI
    have hE := glueSet_eq_empty (U := UPair D F0 F') hI
    have e4' := e4 ∅ (isGlueReps_empty hE)
    rw [Finset.sum_empty] at e4'
    by_cases hm0 : Formalism.MainNotions.S.Cnt.massRows D F0 what₂ = 0
    · exact hnu0 hm0
    · exact (mul_eq_zero.mp e4').resolve_right hm0


theorem rh32_density_formula_of (h0 : HostDict) (h1 : RatPair)
    (h5 : DensAll) (h6 : NormMM) (hR32 : RH32RawCount) : FormulaExplicit := by
  intro D δ M hA L u u' hT F0 what₂ hR ϖ hϖ Z hP
  obtain ⟨hK, hF, hN⟩ := h0 D
  obtain ⟨F', hz, hZ⟩ := h1 D u u' hT F0 what₂ hR Z hP
  have hraw := hR32 D u u' hT F0 what₂ hR Z F' hz hZ hP
  obtain ⟨h5i, h5n⟩ := h5 D δ M hA L u u' hT F0 what₂ hR ϖ hϖ Z F' hz hZ hP
  have hnu0 : Formalism.MainNotions.S.Cnt.massRows D F0 what₂ = 0 → Formalism.L2.SG.CntLocal.nu (Tn u') F0 what₂ Z = 0 := by
    intro h0
    unfold Formalism.L2.SG.CntLocal.nu
    rw [show (∑ Λ ∈ what₂, wRow D F0 Λ) = Formalism.MainNotions.S.Cnt.massRows D F0 what₂ from rfl, h0, div_zero]
  by_cases hI : Formalism.HermitianLatticesTheory.IsIntegralLat (VS D).hT (MMof D F0 F')
  · have e4' := hraw.1 hI
    obtain ⟨hd, hmult⟩ := h5i hI
    have h6' := h6 D u u' hT F0 what₂ hR Z F' hz hZ hP hI

    have hg : HasProd (fun 𝔭 : {𝔭 : Ideal (𝓞 D.host.F) // 𝔭.IsMaximal} =>
        alphaStd D.host.E 𝔭.1 D.R.r /
          alphaStd D.host.E 𝔭.1 (D.R.k - 1 - cJ (VS D).hT (UPair D F0 F') (MMof D F0 F') 𝔭.1))
        (∏' p, densP L δ ϖ (Tn u) (Tn u') Z p) := by
      refine (plEquiv (F := D.host.F)).hasProd_iff.mp ?_
      have hh := hmult.hasProd
      convert hh using 1
      funext p
      exact (hd p).symm
    have hl : HasProd (fun 𝔭 : {𝔭 : Ideal (𝓞 D.host.F) // 𝔭.IsMaximal} =>
        ∏ i ∈ Finset.Icc D.R.k D.R.r,
          (1 - etaF D.host.E D.host.F 𝔭.1 ^ i * (Ideal.absNorm 𝔭.1 : ℝ) ^ (-(i : ℤ)))⁻¹)
        (∏ i ∈ Finset.Icc D.R.k D.R.r, lValEtaF D.host.E D.host.F i) :=
      hasProd_prod fun i hi => hasProd_lF hK hF i (by simp only [Finset.mem_Icc] at hi; omega)
    have hrk : D.R.k - 1 ≤ D.R.r := by
      show D.R.k - 1 ≤ D.R.k + D.R.m - 1
      omega
    have hT1 : (∏' 𝔭 : {𝔭 : Ideal (𝓞 D.host.F) // 𝔭.IsMaximal},
        alphaStd D.host.E 𝔭.1 (D.R.k - 1) /
          alphaStd D.host.E 𝔭.1 (D.R.k - 1 - cJ (VS D).hT (UPair D F0 F') (MMof D F0 F') 𝔭.1)) =
        (∏ i ∈ Finset.Icc D.R.k D.R.r, lValEtaF D.host.E D.host.F i) *
          ∏' p, densP L δ ϖ (Tn u) (Tn u') Z p := by
      refine HasProd.tprod_eq ?_
      convert hl.mul hg using 1
      funext 𝔭
      rw [alpha_split hK hF 𝔭.2 (by omega) hrk]
      ring
    rw [hT1, h6'] at e4'
    by_cases hm0 : Formalism.MainNotions.S.Cnt.massRows D F0 what₂ = 0
    · rw [hnu0 hm0]
      unfold cExpl
      rw [hm0, div_zero, zero_mul, zero_mul]
    · have e1 : (|(NumberField.discr D.host.F : ℝ)| ^ (-((2 * D.R.rS * (D.R.rS + 1) : ℕ) : ℤ))) ^ (D.R.k - 1) =
          |(NumberField.discr D.host.F : ℝ)| ^ (-((2 * D.R.rS * (D.R.rS + 1) * (D.R.k - 1) : ℕ) : ℤ)) := by
        rw [← zpow_natCast, ← zpow_mul]
        congr 1
        push_cast
        ring
      rw [mul_pow, e1] at e4'
      unfold cExpl
      field_simp
      linear_combination e4'
  · obtain ⟨p, hp⟩ := h5n hI
    have hz0 : ∏' p, densP L δ ϖ (Tn u) (Tn u') Z p = 0 :=
      (hasProd_zero_of_exists_eq_zero ⟨p, hp⟩).tprod_eq
    rw [hz0, mul_zero]
    exact hraw.2 hI

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in
theorem rh32_replay_original (h0 : HostDict) (h1 : RatPair) (h2 : PerpDef)
    (h3 : MMChar) (h4 : RowsGroupoid) (h5 : DensAll) (h6 : NormMM)
    (g7 : GlueExists) (g9 : GlueMass) : FormulaExplicit := by
  have hr := rh32_raw_count_of h0 h2 h3 h4 g7 g9
  first
  | (rh_reduce 3 using [rh32_density_formula_of]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact rh32_density_formula_of h0 h1 h5 h6 hr


rh_scan formulaExplicit_of limit 2000
rh_scan rh32_raw_count_of limit 2000
rh_prune rh32_raw_count_of as RH32RawCountPruned
rh_prune rh32_density_formula_of as RH32FormulaBridgePruned
#print axioms formulaExplicit_of
#print axioms rh32_raw_count_of
#print axioms rh32_replay_original
end Formalism.L2.SG.Pf

open scoped Classical
open MeasureTheory NumberField Formalism.BasicNotions Formalism.MainNotions.S Formalism.FourierDecayAlt Formalism.L2.SG.HidaSetting Formalism.L2.SG.Full Formalism.L2.SG.PackageTie2
open Formalism.MainNotions.S.Lat Formalism.MainNotions.S.LocalSplitGroups ValuativeRel Formalism.L2.SG.SpectralTiesReal

namespace Formalism.L2.SG.PoincareAmplitudeLowerBounds

attribute [local instance] Formalism.BasicNotions.Host.cmStar

open Formalism.L2.SG.DataInst Formalism.L2.SG.CntLocal Formalism.L2.SG.RowsConc Formalism.L2.SG.RealObj


def RH32CExplPos : Prop :=
  ∀ (D : D7) (T : STies D) (u u' : D.what₂.Word) (Lsp : LocSp D T.Y.M),
    Formalism.L2.SG.Pf.LocCP.LocTied D →
    Formalism.MainNotions.S.Cnt.Stand D u u' →
    (D.mem u).A.T ≡ (D.mem u').A.T [MOD (Formalism.MainNotions.S.Lat.gS D) ^ 2] →
    0 < Formalism.L2.SG.Pf.Cnt.cExpl D (T.X.Fu u) (T.Y.what₂ u)

theorem rh32_pos_of_formula (hFC : FormulaC) : RH32CExplPos := by
  intro D T u u' Lsp hLT hSt hcong
  exact (hFC D T u u' Lsp hLT hSt hcong).1

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in
theorem rh32_pos_of_rows (hEx : Formalism.L2.SG.Pf.Cnt.RowLatExists) : RH32CExplPos := by
  intro D T u u' Lsp hLT hSt hcong
  have hR := T.Y.rowsOK u
  obtain ⟨Λ0, hΛ0⟩ := hEx D T u
  have hne : (T.Y.what₂ u).Nonempty := by
    obtain ⟨Λ', ⟨hΛ', -⟩, -⟩ := hR.2 Λ0 hΛ0
    exact ⟨Λ', hΛ'⟩
  exact Formalism.L2.SG.Pf.Cnt.cExpl_pos' D u (T.X.Fu u) (T.Y.what₂ u) hR hne

theorem rh32_rowFormAllP_pos_of (hFC : RH32CExplPos) (hVP : Formalism.L2.SG.VolPin.VolumeOddGeneric) (hVA : VIndepAtAllP) (hNc : NormalizingConstantPositiveAll) :
    RowFormAllP := by
  intro Cg cb Cw cTf CT C0f hcb hcT
  obtain ⟨C'₀, Cl₀, hV⟩ := hVA Cg cb Cw cTf CT C0f hcb hcT
  refine ⟨C'₀, Cl₀, fun C' Cl h1 h2 => ?_⟩
  intro D L T u u' X0 C Th Q i0 i0' νq Lsp ϖ κ hTies hH0 hne hSt hCT hg3 hdet hk hcong hi hPR hNu hRL hϖ
  have hWD : Formalism.L2.SG.WuDecay.WuDecay T.X := hCT.2.2.2.2.1
  have hAbs : Formalism.L2.SG.TermOp.AbsConvT (T.X.Fu u) (T.X.Fu u') T.Y.TR (T.Y.cs u) (T.Y.cs u') (T.Y.FN u) (T.Y.FN u') :=
    Formalism.L2.SG.Pf.absConvC_outright D T.X T.Y u u'
      (Formalism.L2.SG.Closed.FoldOKC_outright D T.X T.Y u (Formalism.L2.SG.Closed.level_subgroup_properties T.X) hWD)
      (Formalism.L2.SG.Closed.FoldOKC_outright D T.X T.Y u' (Formalism.L2.SG.Closed.level_subgroup_properties T.X) hWD)
      (Formalism.L2.SG.Pf.fundExistsC_holds D T.X T.Y u u')
      (Formalism.L2.SG.Pf.KernelOfEmbedding.ooIntAll_of (Y := T.Y) hWD u u')
  obtain ⟨hN, hc0⟩ := hNc D T u u' X0 C Th Q i0 i0' νq Lsp ϖ hne hSt hCT hdet hk hcong hi hPR hNu hϖ
  have hP := Formalism.MainNotions.VanishingOnXAndXPlus.primeHyp_of_stand D u u' hSt
  have hK2 := Formalism.L2.SG.Closed.level_subgroup_properties T.X
  have hV0 : 0 < T.X.volK2 := ENNReal.toReal_pos (ne_of_gt hK2.2.2.1) (ne_of_lt hK2.2.2.2)
  have hLT : Formalism.L2.SG.Pf.LocCP.LocTied D := by
    obtain ⟨_, _, _, _, _, _, _, hL⟩ := hCT.2.2.2.2.2.2.1
    exact hL
  exact Formalism.L2.SG.Pf.rowFormC_of_leaves3 T.X T.hb T.Y u u' X0 T.ψ _ C Th Q i0 i0' νq κ _ hRL hi hPR hNu hk hAbs
    (fun i => ⟨hg3 i, gUnramAll D u u' hSt i⟩) (Formalism.L2.SG.Pf.LiftedPhaseAgreement.phaseTieC_holds T.X T.Y u u' κ hP) hVP hP
    (Formalism.L2.SG.Pf.normRepExists_of (Formalism.L2.SG.Pf.NormRepX.norm_representative_holds D u u' hP)
      (Formalism.L2.SG.Closed.TermFun_holds D u u') (T.Y.rowsOK u))
    (hV C' Cl h1 h2 D L T u u' i0 i0' νq hTies hne hSt hCT hi hNu hPR hH0)
    hN hLT hV0 hc0 (hFC D T u u' Lsp hLT hSt hcong) (tprod_alpD_pos D hk u u')

theorem rh32_rowForm_original (hFC : FormulaC) (hVP : Formalism.L2.SG.VolPin.VolumeOddGeneric)
    (hVA : VIndepAtAllP) (hNc : NormalizingConstantPositiveAll) : RowFormAllP := by
  have hp := rh32_pos_of_formula hFC
  first
  | (rh_reduce 3 using [rh32_rowFormAllP_pos_of]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact rh32_rowFormAllP_pos_of hp hVP hVA hNc


rh_scan rowFormAllP_of limit 2000
rh_scan rh32_rowFormAllP_pos_of limit 2000
rh_prune rh32_rowFormAllP_pos_of as RH32RowFormPruned
#print axioms rowFormAllP_of
#print axioms rh32_pos_of_rows
#print axioms rh32_rowFormAllP_pos_of
#print axioms rh32_rowForm_original

end Formalism.L2.SG.PoincareAmplitudeLowerBounds
