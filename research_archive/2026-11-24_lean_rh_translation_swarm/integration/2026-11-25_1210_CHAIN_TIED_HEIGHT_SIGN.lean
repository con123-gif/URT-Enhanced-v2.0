import Development.AutomorphicArithmetic.PrimitiveCosets.LevelGmLeOnFamilyScales
import Formalism.SharpRestriction.GlobalSchurBounds.QuadraticLogDerivCongr
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChCore
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Integration: recover one-sided heights from existing ChainTied witness
2026-11-25, RH OPEN. Human source-matched implication; Lean PREPARED, not compiled.
One contribution: close the missing *human* transport of the height sign in
peer lane 14 RUN30, without changing the native geometric producer.
Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; SWARM, AGENTS,
research state/log/protocol, continuity, handoff and latest principal peer
checkpoints consulted. Manuscript base blob f6922c1f169399cdccf86f07809b5e1fd664b469; parent 7175da1150aacdff151fca28ca2d4f1b46e13124.
Relevant recent commits: 7eb242b7 (one-sided normalized ramp),
db618414 (mean-bias audit), 9fab6791 (normalized two-sided ramp),
70732176 (same-host transport), 9e7a5f49, 5ea960de (count geometry),
91754a9c (common arithmetic integers), f7f5779b (NumberU exponent).
No separate arithmetic result claimed.

Actual proof:
For t∈TT, TieArith's first conjunct yields hval(t)∈Fm.TTn(x).
Fm.TT_eq x (pt 0) gives s in the actual host TT of pt(0) with the
same numeric value. TiePts(0) identifies the integer height aT(s)
with av of this value; TieArith's third conjunct identifies a(t)
with that same integer coerced to real. TieGlobal(0) identifies
Dd.b with the scale b of this actual record. Fm.L_x x (pt 0) gives
its scale x=x when x>Fm.x1. The native aT_win lower endpoint is
sc.a≤aT(s), and sc.a=sc.x*sc.b, sc.b>0. Consequently x≤a(t)/Dd.b.
The native two-sided SizesA bound supplies the upper endpoint ≤x+1.
No new existential witness is chosen. The original tiedCore_of_chainTied
passes the exact same a, Dd, TT (after equality) into CoreAtH. Recover
the inequality while unpacking ChainTied, before the tie fields are
discarded. The threshold x>Fm.x1 is obtained by increasing the same
eventual threshold, not reselecting windows. Generic CoreAtH and
ErrWindows alone do NOT imply it: ErrWindows only has 0≤aT≤2a
and x*b≤a; no lower aT≥a. Backtrack to the original shift proof
when those ties are not available.

On the principal quotient let F(y)=G(y)+J(y), with a_n≥0 the
actual projected inertia-coset coefficients times Lambda(n).
Then F(y)/y+log y=L+sum_n a_n max(1/n−1/y,0) is nondecreasing.
For x≤y≤x+1, F(y)≥(y/x)(F(x)−1).
If sum_t F(y_t)≤|TT| E, E≥0, then F(x)≤
x |TT| E/(sum_t y_t)+1≤E+1. Keep -J(x)≤3x^(1/2+eps).
No bound on ell needed locally; no derivative estimate, mean-zero
assumption or removal of other consumers. Retain actual same-host
quantifiers, positive projected coefficients, all geometric and
arithmetic obligations. No independent RH route or URT claim.

Pinned source anchors (all six blob hashes verified; 21 text anchors matched
in this run):
src/Formalism/SharpRestriction/GlobalSchurBounds/TieGlobal.lean
00acf811793877fe42d18c0d69f2d5833f75bf94 L39–61 TiePts, TieGlobal;
L84–114 TieArith, ChainTied.
src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean
7828c8b1060818fe158e23f87f1ad9e2efcf79eb L814–824 av_facts,
L925–939 scale identity, L1111–1117 original witness,
L1461–1483 winO uses sign before weakening to abs bound.
src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean
de994949e6fd2d7238cfcb1c19d361ccdfe904fc L13–26 actual adapter.
src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreAtH.lean
0ba3621036f19146e7e67fa9c0e8a1c38661a097 L29–41 generic package.
src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean
878f5077bc382426c7da988e5a375b85deeaa7de L283–338 actual sum hY.
src/Development/AutomorphicArithmetic/PrimitiveCosets/WindowInequalityOfArtinInputs.lean
c349e34925ac26b8bc76bd36e9b91562f86d6b8d L17–25 eventual threshold.

Original graph and all role/axiom evidence preserved; local source-visible
overlay (not kernel-extracted): core_gm -> core(hY) -> principal normalized
ramp -> same ChainTied witness -> TieArith, TiePts, TieGlobal,
Fm.TT_eq, Fm.L_x, aT_win. Keep original ch_core / DerivInt edges in
original graph and elsewhere; no global removal. Context key:
(pin,Fm,x,i0,pt,av,bv,Dd,TT,a,ell,principal level). The original
root, upstream arithmetic, geometry, character bounds, and full axiom
audit remain open. This update shortens live manuscript §2 only.

Execution record: six pinned blobs and 21 anchors checked via connector
(success), actual old CI statuses read at cathedral-research-state:
45577239749 status blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
pass/98.87 s (conditional half-strip root only);
45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717
pass/77.94 s (rh_of_right bounded scan, 324 pending).
General regression run 45606030273 passed 12:00 UTC, unrelated to this
new theorem. command -v lean/lake found neither, so no new CI PASS,
no native scan/prune execution, and no new axiom evidence claimed.
Failed attempt: default-branch symbol search for tiedCore_of_chainTied
returned no hits; recovered actual pinned import path from ZeroFreeAllOfTopG.
One peer fetch transiently disconnected, then succeeded on retry.
No synthetic tests or reruns of other lanes' arithmetic benchmarks.

RESUME HERE: compile same_witness_height and average_budget, apply the
prepared hY bridge while unpacking the actual ChainTied caller; if native
replay fails preserve original and repair exact types. Then return to
unproved arithmetic/geometric suppliers, not further height reductions.
HANDOFF TO kernel, audit, editor, geometry. Full RH remains OPEN.
-/

noncomputable section

namespace RHIntegrationHeightSign

open Formalism.BasicNotions Formalism.D5 Formalism.HC Formalism.MainNotions
  Formalism.RankGapBounds.WeightedMeanData
  Formalism.LFunctionChainParameters.WeightedSlopeBounds
  Formalism.LFunctionChainParameters.characterSumData
  Formalism.LFunctionChainParameters.ThickSetMeanBounds
  Formalism.LFunctionChainParameters.LErr
  Formalism.LFunctionChainParameters.LChain
  Formalism.LFunctionChainParameters.LHost

-- Reuse all ties from the very same ChainTied witness.
theorem same_witness_height {eps : ℝ} (Fm : FamP eps) (x : ℝ)
    {φ : Frame} {m f q d : ℕ}
    (pt : φ.A → Fm.Ix x) (av bv : ℕ → ℤ)
    {Top : Type}
    (Dd : Data φ.A (fun u0 => (Fm.D x (pt u0)).what₂.Word) Top m f)
    (Xpp η X' : ℝ)
    (D : ArithData φ.A) (ell : AddChar (E0 × φ.A) ℂ → ℂ)
    (TT T2 : Finset φ.A) (a : φ.A → ℝ)
    (w : φ.A → Fin m → E0 × φ.A → ℝ)
    (hx : Fm.x1 < x)
    (hp : TiePts Fm x φ m f q d pt av bv)
    (hg : TieGlobal Fm x pt Dd Xpp η X')
    (ha : TieArith Fm x pt av D ell TT T2 a w)
    (t : φ.A) (ht : t ∈ TT) :
    x ≤ a t / Dd.b := by
  obtain ⟨hTT, -, hav, -, -⟩ := ha
  obtain ⟨-, -, -, -, -, -, hpT⟩ := hp 0
  have hnum : hval φ t ∈ Fm.TTn x := (hTT t).mp ht
  have hmem : hval φ t ∈
      (Fm.D x (pt 0)).host.TT.image Frame.A.val := by
    rw [Fm.TT_eq x (pt 0)]
    exact hnum
  obtain ⟨s, hs, heq⟩ := Finset.mem_image.mp hmem
  have hread : a t = ((Fm.L x (pt 0)).aT ⟨s, hs⟩ : ℝ) := by
    rw [hav t, (hpT ⟨s, hs⟩).1, heq]
  have hB := (hg 0).2.1
  have hX := Fm.L_x x (pt 0) hx
  have hb : 0 < Dd.b := by
    rw [hB]
    exact Real.exp_pos _
  apply (le_div_iff₀ hb).2
  calc
    x * Dd.b = (Fm.L x (pt 0)).sc.x * (Fm.L x (pt 0)).sc.b := by
      rw [hB, hX]
    _ = (Fm.L x (pt 0)).sc.a := rfl
    _ ≤ ((Fm.L x (pt 0)).aT ⟨s, hs⟩ : ℝ) :=
      ((Fm.L x (pt 0)).aT_win ⟨s, hs⟩).1
    _ = a t := hread.symm

-- The averaged signed bound, after the positive ramp projection.
theorem average_budget (x S T F E : ℝ) (hx : 0 < x) (hT : 0 < T)
    (hE : 0 ≤ E) (hS : x*T ≤ S) (h : S*(F-1) ≤ x*T*E) :
    F ≤ E+1 := by
  have hs : 0 < S := (mul_pos hx hT).trans_le hS
  have h1 : S*(F-1) ≤ S*E :=
    h.trans (mul_le_mul_of_nonneg_right hS hE)
  have h2 := (mul_le_mul_left hs).mp h1
  linarith

theorem average_replay (x S T F E : ℝ) (hx : 0 < x) (hT : 0 < T)
    (hE : 0 ≤ E) (hS : x*T ≤ S) (h : S*(F-1) ≤ x*T*E) :
    F ≤ E+1 := by
  first | (rh_reduce 2 using [average_budget]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact average_budget x S T F E hx hT hE hS h

rh_scan UpperTheory.Comparison₂.tiedCore_of_chainTied limit 2000
rh_prune UpperTheory.Comparison₂.tiedCore_of_chainTied as RHIntegrationHeightSign.tied_core_candidate
#print axioms same_witness_height
#print axioms average_budget
end RHIntegrationHeightSign
end
