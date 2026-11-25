import Mathlib
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.PartA
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.GaloisCohomologyLength.ShaLenEqShaInv
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN36 lane 6, 25 Nov 2026 — aggregate exceptional dyadic length on the actual PartA consumer.
SOURCE-MATCHED HUMAN / PREPARED Lean; NOT compiled. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4; live proof
10e3d636b345adbcae9ddb91820a3a93f59c93bc. Read AGENTS, SWARM, HANDOFF,
EXPANSION, state/continuity/log openings, latest peers e9256be1 (inertia signs),
9f9a5e0e (odd fixed-layer canonical exceptions and PT), 410fcbc2 (same-host gauge),
31cc317d (CountVs) and mission 18c47fab. Prior lane RUN35 6b66fdef.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream observed
98d36aafeeb30c1f40fdda96c3574faa34dfa413, not substituted.

SOURCE LEDGER (prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
LayeredIsomorphisms/PartA.lean c41983a3d9483591b7d7eedfb3b672d72cde101a
LayeredIsomorphisms/ImportsAlt.lean ef9122254fb295f15e9f01d9512d70a26e6f6884
LayeredIsomorphisms/SecondBound.lean a2e12927214cad3ce637b33adb435f42992c1c65
LayeredIsomorphisms/ThmBabOf.lean d4b0c37c79996fca0b0d30fb53fe798eceb90cff
LayeredIsomorphisms/Vvat.lean a951bf639d41e5638a196041e22f73e186b2767c
LengthEqAddEigen.lean 0ab757164d73378933cd4c261b4bf0f670f2461e
PrimeSetBoundDataOfPrimitiveChar.lean 52224122dd8f9deefef473151d716984f3e1f1ff
GaloisLibrary/GaloisCohomologyLength/ShaLenEqShaInv.lean 19302758658356ff85c5540681e53e79579ab975

EDITOR BLOCK. This is the variable DYADIC layer in PartA, NOT the
odd fixed layer addressed by structure RUN36. The actual PartA consumes
VVat 2 E t B, i.e. a SUM of finite lengths, not a uniform pointwise bound.
Fix the same L0, R, c, Z, Exc, L2 at j0=jZero 2 R, and LData D on L2
BEFORE the host layer is chosen. Let page e0>=2, I=Ico(1,t) subset [1,Z],
n=t-1, r=|I intersect Exc| <= R, m<=e0+2 as supplied by TwoBase.
A=R*(max(e0+2,j0)+c+floor(log_2 Z)), C=R*max(e0+2-j0,0).
TwoBase gives shaInv E 2 k <= 1+shaInv L1 2 k on the SAME L1.
FirstBound gives length L1 <= A off Exc; SecondBound gives length
L1 <= VLen D k + C on Exc. C<=A. Require VLen D k finite on I intersect
Exc, not merely its toNat bound. Then every shaInv E 2 k is finite and
   sum_I shaInv(E,2,k) <= n + (n-r)A + r*C + sum_(I intersect Exc) VLen(D,k)
                       <= n*(1+A) + sum_(I intersect Exc) VLen(D,k).
The latter is exactly the prepared BaAt local consumer below.
This avoids paying the exceptional K/cohomology term at EVERY twist.
Native point already calls klen ONLY on exceptions; we do not claim
otherwise. The loss is in point2 -> vvat, which multiplies the shared
pointwise bound by t. The new aggregate interface can accept nonuniform
exceptional lengths; no need for uniform pointwise kBound on those
twists, or on unrelated fields. With Good and retained klen/kexp,
the exceptional term is at most 2R exp((2n0)^CK c0*x^(3eps/4)),
instead of 2*t times that exponential. The original polynomial term
and eventual thresholds remain: A=O(log x) for fixed R,c,J,Ct,A1,
n<=x^Ct; c is uniformly bounded by PartA's rootdeg and fixed-layer
discriminant estimates. No asymptotic arithmetic supplier proved here.
If a direct sum estimate n(1+A)+exceptionCost<=exp(x^(4eps/5))
holds on the native common window, the existing BaAt holds exactly.
Good still restricts the exceptions to SMALL twists and window remains
chosen from the union with odd exceptions; do NOT select separate windows
or change q,d. No removal of global LemmaK: it has other consumers;
only this local replacement may bypass the uniform pointwise interface.
FirstBound, SecondBound and the aggregate exceptional budget remain
open in the independent reconstruction. Also retain all odd-prime,
minus and TopG/ASK-MAIN branches. No RH claim.

Source-visible original local graph:
thmBab_of -> partA -> exc/ABound.1, layerex, layerdisc, point2 -> point ->
FirstBound (far), SecondBound + klen/kexp (exception), vvat -> VVat.
TwoBase supplies the same m,L1 and transfer <=1+shaInv.
Candidate graph: BaAt -> twoBase_aggregate36 -> aggregate36 -> FirstBound
(far), SecondBound (exception), same LData exceptional sum + finiteness,
shaLen_eq_shaInv, TwoBase transfer. Existing union window and full
fallback unchanged; no global graph deletion. Cache key: pin/toolchain,
M,q,d,page,t,L0,R,c,Z,Exc,L2,D,E,L1,m,x,actual instances and hypotheses.
No context merging across field/layer/cutoff. No URT used.

Actual verification: connector fetched 8 pinned source files and
executed 39 exact hash/literal anchor checks, all satisfied. Lean/Lake
not on local PATH. Retrieved actual baseline status.json blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717, runs 45577239749 and
45576756833, both returncode 0; only those prior engine checks verified.
New native certificate and scan/prune/reduction commands PREPARED,
not run or queued. Native axiom/constructor edges remain unresolved.
No finite simulation or synthetic cohomology used. Guard: a bound on
toNat alone would allow infinite length (top.toNat=0), so the explicit
exception finiteness clause is essential. R=0 or t<=1 is handled by
empty sums, no division by R or t. Do not turn a fixed-scale estimate
into a uniform window by changing D or q,d with an individual twist.

RESUME HERE: batch replay this with the existing pinned warmed runner
(engine modules imported); inspect actual BaAt caller substitution,
and obtain a direct aggregate exceptional sum bound at the fixed dyadic
L2 from the quantitative K/etale supplier or a weaker theorem. Retain
the same exception union, x window, q,d and both cohomological guards.
Audit independently with structure/Galois/integration/kernel; no
duplicate odd fixed-layer PT derivation. HANDOFF TO those lanes/editor.
-/

open NumberField Formalism.GaloisCohomology UpperTheory.Top UpperTheory.V
  UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Win
noncomputable section
namespace RHCharacter36

private theorem finite_le_nat (s : ℕ∞) (a : ℕ) (h : s ≤ (a : ℕ∞)) :
    s ≠ ⊤ ∧ s.toNat ≤ a := by
  have hs : s ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) h
  obtain ⟨n, rfl⟩ := ENat.ne_top_iff_exists.mp hs
  exact ⟨ENat.coe_ne_top _, by simpa using h⟩

def cap36 (R page c Z : ℕ) : ℕ :=
  R * (max (page + 2) (jZero 2 R) + c + Nat.log 2 Z)

def exceptional36 {L₂ Ω : Type} [Field L₂] [NumberField L₂] [Field Ω]
    [Algebra L₂ Ω] [IsAlgClosure L₂ Ω] (D : LData L₂ Ω 2)
    (Exc : Finset ℕ) (t : ℕ) : ℝ := by
  classical
  exact ∑ k ∈ Finset.Ico 1 t,
    (if k ∈ Exc then ((VLen D (k : ℤ)).toNat : ℝ) else 0)

theorem aggregate36 {E L₀ L₁ L₂ Ω : Type} [Field E] [NumberField E]
    [Field L₀] [Field L₁] [NumberField L₁] [Algebra L₀ L₁]
    [Field L₂] [NumberField L₂] [Algebra L₀ L₂] [Field Ω]
    [Algebra L₂ Ω] [IsAlgClosure L₂ Ω]
    (D : LData L₂ Ω 2) (R page c Z t m : ℕ) (Exc : Finset ℕ)
    (hF : FirstBound 2 R c L₀ Z Exc) (hS : SecondBound 2 R L₀)
    (hL1 : IsLayer 2 m L₀ L₁) (hL2 : IsLayer 2 (jZero 2 R) L₀ L₂)
    (hm : m ≤ page + 2)
    (hZ : ∀ k : ℕ, 1 ≤ k → k < t → k ≤ Z)
    (hE : ∀ k : ℕ, 1 ≤ k → shaInv E 2 k ≤ 1 + shaInv L₁ 2 k)
    (hfin : ∀ k : ℕ, 1 ≤ k → k < t → k ∈ Exc → VLen D (k : ℤ) ≠ ⊤)
    (B : ℝ)
    (hB : ((t - 1 : ℕ) : ℝ) * (1 + (cap36 R page c Z : ℝ)) +
      exceptional36 D Exc t ≤ B) :
    VVat 2 E t B := by
  classical
  let A := cap36 R page c Z
  have hfar : R * (max m (jZero 2 R) + c + Nat.log 2 Z) ≤ A := by
    dsimp [A, cap36]
    gcongr
  have hnear : R * (m - jZero 2 R) ≤ A := by
    dsimp [A, cap36]
    apply Nat.mul_le_mul_left
    omega
  have hpoint : ∀ k : ℕ, 1 ≤ k → k < t →
      shaInv E 2 k ≠ ⊤ ∧
      ((shaInv E 2 k).toNat : ℝ) ≤
        1 + (A : ℝ) + (if k ∈ Exc then ((VLen D (k : ℤ)).toNat : ℝ) else 0) := by
    intro k hk ht
    by_cases he : k ∈ Exc
    · have hv := hfin k hk ht he
      have hs := hS k hk m L₁ hL1 L₂ hL2 Ω D
      obtain ⟨v, hv_eq⟩ := ENat.ne_top_iff_exists.mp hv
      have hv_eq' : VLen D (k : ℤ) = (v : ℕ∞) := by
        first | exact hv_eq | exact hv_eq.symm
      rw [hv_eq'] at hs
      have hs' : shaInv L₁ 2 k ≤ ((v + A : ℕ) : ℕ∞) := by
        refine hs.trans ?_
        push_cast
        exact add_le_add_left (by exact_mod_cast hnear) _
      have h' : shaInv E 2 k ≤ ((1 + (v + A) : ℕ) : ℕ∞) := by
        refine (hE k hk).trans ?_
        push_cast
        exact add_le_add_left hs' _
      obtain ⟨hn, hle⟩ := finite_le_nat _ _ h'
      refine ⟨hn, ?_⟩
      rw [if_pos he, hv_eq', ENat.toNat_coe]
      have hh : ((shaInv E 2 k).toNat : ℝ) ≤ ((1 + (v + A) : ℕ) : ℝ) := by
        exact_mod_cast hle
      push_cast at hh
      linarith
    · have hs := hF.2 k hk (hZ k hk ht) he m L₁ hL1
      have hs' : shaInv L₁ 2 k ≤ (A : ℕ∞) := hs.trans (by exact_mod_cast hfar)
      have h' : shaInv E 2 k ≤ ((1 + A : ℕ) : ℕ∞) := by
        refine (hE k hk).trans ?_
        push_cast
        exact add_le_add_left hs' _
      obtain ⟨hn, hle⟩ := finite_le_nat _ _ h'
      refine ⟨hn, ?_⟩
      rw [if_neg he, add_zero]
      exact_mod_cast hle
  intro Ω' _ _ _ D'
  refine ⟨fun k hk ht => ?_, ?_⟩
  · rw [shaLen_eq_shaInv]
    exact (hpoint k hk ht).1
  · calc
      ∑ k ∈ Finset.Ico 1 t, ((shaLen D' (k : ℤ)).toNat : ℝ) ≤
        ∑ k ∈ Finset.Ico 1 t, (1 + (A : ℝ) +
          (if k ∈ Exc then ((VLen D (k : ℤ)).toNat : ℝ) else 0)) := by
            apply Finset.sum_le_sum
            intro k hk
            rw [Finset.mem_Ico] at hk
            rw [shaLen_eq_shaInv]
            exact (hpoint k hk.1 hk.2).2
      _ = ((t - 1 : ℕ) : ℝ) * (1 + (A : ℝ)) + exceptional36 D Exc t := by
            rw [Finset.sum_add_distrib, Finset.sum_const, Nat.card_Ico, nsmul_eq_mul]
            rfl
      _ ≤ B := hB

/-- Actual BaAt-shaped output, without a uniform pointwise exceptional bound. -/
theorem twoBase_aggregate36 {L₀ L₂ Ω : Type} [Field L₀] [NumberField L₀]
    [Field L₂] [NumberField L₂] [Algebra L₀ L₂] [Field Ω]
    [Algebra L₂ Ω] [IsAlgClosure L₂ Ω]
    (D : LData L₂ Ω 2) (M : AbF) (q d R c Z t page : ℕ) (Exc : Finset ℕ)
    (hTB : TwoBase M q d L₀) (hpage : 2 ≤ page)
    (hF : FirstBound 2 R c L₀ Z Exc) (hS : SecondBound 2 R L₀)
    (hL2 : IsLayer 2 (jZero 2 R) L₀ L₂)
    (hZ : ∀ k : ℕ, 1 ≤ k → k < t → k ≤ Z)
    (hfin : ∀ k : ℕ, 1 ≤ k → k < t → k ∈ Exc → VLen D (k : ℤ) ≠ ⊤)
    (B : ℝ)
    (hB : ((t - 1 : ℕ) : ℝ) * (1 + (cap36 R page c Z : ℝ)) +
      exceptional36 D Exc t ≤ B) :
    ∀ (E : Type) [Field E] [NumberField E], IsCompField M page q d E →
      BoundedHeightTwoPlaceCondition E t B := by
  obtain ⟨_, _, _, hE⟩ := hTB
  intro E _ _ hEc
  obtain ⟨m, L₁, _, _, _, hL1, hm, hs⟩ := hE page hpage E hEc
  exact aggregate36 D R page c Z t m Exc hF hS hL1 hL2 hm hZ hs hfin B hB

end RHCharacter36

#print axioms RHCharacter36.aggregate36
#print axioms RHCharacter36.twoBase_aggregate36
rh_scan UpperTheory.V.Win.partA limit 2000
rh_scan RHCharacter36.twoBase_aggregate36 limit 2000
rh_prune RHCharacter36.twoBase_aggregate36 as RHCharacter36TwoBasePruned

-- Try the native recursive engines on the actual dyadic transfer.
open RHCharacter36 in
example {L₀ L₂ Ω : Type} [Field L₀] [NumberField L₀]
    [Field L₂] [NumberField L₂] [Algebra L₀ L₂] [Field Ω]
    [Algebra L₂ Ω] [IsAlgClosure L₂ Ω]
    (D : LData L₂ Ω 2) (M : AbF) (q d R c Z t page : ℕ) (Exc : Finset ℕ)
    (hTB : TwoBase M q d L₀) (hp : 2 ≤ page)
    (hF : FirstBound 2 R c L₀ Z Exc) (hS : SecondBound 2 R L₀)
    (hL : IsLayer 2 (jZero 2 R) L₀ L₂)
    (hZ : ∀ k : ℕ, 1 ≤ k → k < t → k ≤ Z)
    (hf : ∀ k : ℕ, 1 ≤ k → k < t → k ∈ Exc → VLen D (k : ℤ) ≠ ⊤)
    (B : ℝ)
    (hb : ((t - 1 : ℕ) : ℝ) * (1 + (cap36 R page c Z : ℝ)) +
      exceptional36 D Exc t ≤ B)
    (E : Type) [Field E] [NumberField E] (hE : IsCompField M page q d E) :
    BoundedHeightTwoPlaceCondition E t B := by
  first
  | rh_reduce 3 using [twoBase_aggregate36]
  | rh_auto 3
  | rh_auto_frontier 2
    all_goals exact twoBase_aggregate36 D M q d R c Z t page Exc hTB hp hF hS hL hZ hf B hb E hE
