import RHOddFixedLayerBudget
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.GaloisCohomologyLength.VFormula
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.GaloisCohomologyLength.ShaLenEqShaInv

open NumberField Formalism.GaloisCohomology UpperTheory.Top UpperTheory.V UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Win

/-!
RUN36, lane 13 structure, 25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT compiled.
One result: canonical exceptional-count interface for the odd-prime fixed layer.
No new proof of the count or PTSha, no RH closure. Same witness throughout.

Mission blob e536e5e30aa458a90343b65c87cbe105f2485abb (including native engine
and external graph updates), upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005,
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Read SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74, HANDOFF
bbc46df7d7716a6d8863275b5271801eacfaad0d, AGENTS, state, log,
continuity and protocol openings. Peers: 31cc317d (CountVs shallow),
746b39e7 (exceptional vanishing), 6c92b85b (Kato conductor), 0810c534
(same-host joint loss), 29c54b4f (signed transfer / endpoint repair).
Prior structure RUN35 bb0948b02a1972faa5a35861df2b3548517bcebf,
blob bc602e74f64014d31e75e88db160e9343237f887, is PREPARED not compiled.

Actual source blobs:
src/Formalism/GaloisCohomology/Statement.lean 0799e9bcd8aa191ffaa90ab005453a53381bacea
  PTShaAt, PTSha, PTCase, Sha2Zl, VLen.
src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/GaloisCohomologyLength/
  ShaLenEqShaInv.lean 19302758658356ff85c5540681e53e79579ab975 (shaLen_eq_shaInv)
  VFormula.lean 3904e855838d38d1c22af7034a9ed8e3cc41d434 (length exact-sequence pattern)
  LevelInertiaLeLevelDec.lean 497c591dbb6981c12b4e99d280ed1c81d356adaf (shaInv)
  VLenIndep.lean a4ea4ae9c53aac7a8c327fdc021dcb86c9ccda53
  ShaInfl.lean e6fafb7f559d65c62c4b725d4bc2d36ea80f7f6f
src/Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/
  SecondBound.lean a2e12927214cad3ce637b33adb435f42992c1c65
  Exc.lean d0d49933faebf73a8162c153b8115139e36efa82
  PartB.lean cd8a7cae15738f4054f543cddf4af595a6d1f7dc
  Klen.lean 8d11cf66702190df2c12069a790cd8c29e43a37f
  ThmBabOf.lean d4b0c37c79996fca0b0d30fb53fe798eceb90cff

EDITOR BLOCK (human exact derivation).
Fix odd l, same L2 at j0=log_l R+3, c and R BEFORE cutoff Z. Write
B_Z=R*(j0+c+floor(log_l Z)) and E_Z={e in [1,Z]: shaInv(L2,l,e)>B_Z}.
The nonexceptional clause of OddFixedBudget13 is exactly |E_Z|<=R:
every admissible exception set must contain E_Z, and E_Z itself suffices.
This is valid also for ENat top; no truncation by toNat.
The exceptional clause follows on the same field, without any layer
transfer, from the single local PTShaAt identity:
 VLen D e = length(Sha2Zl D e) + length(H2 / Sha2Zl D e)
          = shaInv L2 l e + length(H2 / Sha2Zl D e).
First equality is the exact sequence for the subtype and quotient;
second is PTShaAt (PTCase is automatic for odd l) and shaLen_eq_shaInv.
Thus shaInv<=VLen for ALL positive e where local PTShaAt holds.
No PTCokerAt, TateLocalDualityH2AtPlaces, or global VFormula is
needed for this local exceptional transfer. Do not assume PTShaAt from
the definition, or claim it is kernel checked. PTSha global is merely
a sufficient supplier, not proved here. Same D chosen once using
ldata_nonempty. Can instead assume PTShaAt just for e in E_Z.
This establishes a conditional count-only supplier for the actual
RUN35 partB_fixed13/thmBab_of_fixed13 consumer. Original FixedIn
implies the count condition via RUN35, independently of PT; reverse
transfer uses PT. No equivalence asserted between new global premises
and original ABound. Count remains uniform in all Z and all A/l/L0,
and the selected R still controls layer j0; do not change R afterward.
Other consumers of SecondBound/ABound and PartA remain untouched.

Original local graph partB -> exc -> ABound.1 ; partB -> point2 ->
SecondBound ; partB -> vvat/klen/kexp/transport. RUN35 reduced graph
partB_fixed13 -> OddFixedBudget13 -> fixed nonexceptional and exceptional
clauses. New conditional graph thmBab_of_count13 -> thmBab_of_fixed13
-> odd_fixed_of_count13 -> canonical count + PTShaAt + shaLen_eq_shaInv
+ exact sequence + ldata_nonempty. Retain all original graphs, pending
constructor/type/value roles, and unresolved axiom evidence.
Cache key pin/toolchain, l,R,L0,L2, actual algebra and layer, c,Z,
D, twist e, threshold and PT proof. No cache sharing across fields.
Canonical set construction O(Z) given evaluated lengths, NOT a
complexity claim for computing lengths or proof search. No URT used:
direct subset and exact sequence eliminate ranking; no measured gain.

Executed in connector JS (finite logic controls only, not number fields):
109227 equivalence checks over all vectors length 0..6 with entries
0..3 (3 stands for top relative to thresholds 0..2), all budgets
0..n and all subsets; 15156 nonempty bad-set controls (empty set fails);
441 finite integer exact-sequence controls (a,b in 0..20, a<=a+b).
Reproduction:
 for n=0..6, s=0..4^n-1, decode n base-4 digits v;
 for b=0..2, B={i:v_i>b}; enumerate all subsets T of {0..n-1};
 assert min(|T|: B subset T)=|B|;
 for R=0..n assert (exists T containing B, |T|<=R) iff |B|<=R.
Negative mathematical guard: without PT, no relation between length
of the H1 Selmer submodule and length of H2 follows from module-length
monotonicity alone. No such relation claimed from finite controls.
GitHub code search PTShaAt/PTSha/shaLen_le returned no matches;
guessed Formalism/.../VFormula and GaloisCohomologyLength/SecondBound
paths 404; actual Statement and VFormula located via imports.
Local command -v lean and lake both absent. No native check run.
Baseline CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved PASS for
previous engines only. New endpoint repair status blob
0669c532840ad3a26459a9ac71be41d6f4bc9fb1 retrieved independently,
run 45670987597 returncode 0, explicit conditional diagonal bridge
checked; arithmetic premise not proved. New candidate NOT queued
or compiled. No new kernel/caller closures; no claim about axioms.

Native replay in existing pinned warmed runner: copy RUN35 file as
RHOddFixedLayerBudget.lean (module filename alias), build its olean
after engine modules and original imports, then copy this file as
RHCanonicalOddCount.lean and run lean --root=<overlay root> on it.
Check the original statement bridges and actual caller; capture
#print axioms and rh_scan/prune outputs, fail on errors/sorryAx.
No import of Main or claimed RH. Preserve any failed compiler output.
RESUME HERE: batch RUN35 and this file; locate the actual PTSha
supplier (or prove local PTShaAt for canonical bad twists), and establish
uniform |E_Z|<=R from the same-field arithmetic. Do not infer uniformity
from fixed-cutoff tests or peer CountZ/CountVs vanishing.
HANDOFF TO kernel, Galois, audit, integration. RH OPEN.
-/

namespace UpperTheory.V.Win

noncomputable def canonicalBad13 (l R c : ℕ) [Fact l.Prime]
    (L : Type) [Field L] [NumberField L] (Z : ℕ) : Finset ℕ := by
  classical
  exact (Finset.Icc 1 Z).filter fun e =>
    ((R * (jZero l R + c + Nat.log l Z) : ℕ) : ℕ∞) < shaInv L l (e : ℤ)

theorem canonicalBad13_card_of_exception (l R c : ℕ) [Fact l.Prime]
    (L : Type) [Field L] [NumberField L] (Z : ℕ) (Exc : Finset ℕ)
    (hcard : Exc.card ≤ R)
    (hfar : ∀ e : ℕ, 1 ≤ e → e ≤ Z → e ∉ Exc →
      shaInv L l (e : ℤ) ≤ ((R * (jZero l R + c + Nat.log l Z) : ℕ) : ℕ∞)) :
    (canonicalBad13 l R c L Z).card ≤ R := by
  classical
  apply (Finset.card_le_card (s := canonicalBad13 l R c L Z) (t := Exc) ?_).trans hcard
  intro e he
  unfold canonicalBad13 at he
  simp only [Finset.mem_filter, Finset.mem_Icc] at he
  by_contra hn
  exact (not_lt_of_ge (hfar e he.1.1 he.1.2 hn)) he.2

theorem canonicalBad13_far (l R c : ℕ) [Fact l.Prime]
    (L : Type) [Field L] [NumberField L] (Z e : ℕ) (he : 1 ≤ e)
    (heZ : e ≤ Z) (hn : e ∉ canonicalBad13 l R c L Z) :
    shaInv L l (e : ℤ) ≤ ((R * (jZero l R + c + Nat.log l Z) : ℕ) : ℕ∞) := by
  classical
  apply le_of_not_gt
  intro h
  apply hn
  unfold canonicalBad13
  exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨he, heZ⟩, h⟩

theorem shaInv_le_VLen_of_localPT13 {L Ω : Type} [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] {l : ℕ} [Fact l.Prime]
    (D : LData L Ω l) (e : ℤ) (hl2 : l ≠ 2) (hPT : PTShaAt D e) :
    shaInv L l e ≤ VLen D e := by
  let S := Sha2Zl D e
  have hX := Module.length_eq_add_of_exact S.subtype S.mkQ
    (Submodule.injective_subtype _) (Submodule.mkQ_surjective _)
    (LinearMap.exact_subtype_mkQ _)
  have hS : Module.length ℤ_[l] S = shaInv L l e := by
    change Module.length ℤ_[l] (Sha2Zl D e) = shaInv L l e
    exact (hPT (Or.inl hl2)).trans (shaLen_eq_shaInv D e)
  unfold VLen
  rw [hX, hS]
  exact le_add_of_nonneg_right (zero_le _)

def OddFixedCount13 (l R : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀] : Prop :=
  ∃ (L₂ : Type) (_ : Field L₂) (_ : NumberField L₂) (_ : Algebra L₀ L₂),
    IsLayer l (jZero l R) L₀ L₂ ∧ HasMuQ l L₂ ∧
    ∃ c : ℕ, ∀ Z : ℕ, (canonicalBad13 l R c L₂ Z).card ≤ R

def OddCountIn13 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ A : AbF, A.HasMu l →
    ∀ (L₀ : Type) [Field L₀] [NumberField L₀], IsAbField A L₀ →
      ∃ R : ℕ, OddFixedCount13 l R L₀

theorem count_of_odd_fixed13 (l R : ℕ) [Fact l.Prime]
    (L₀ : Type) [Field L₀] (h : OddFixedBudget13 l R L₀) :
    OddFixedCount13 l R L₀ := by
  obtain ⟨L₂, _, _, _, hL, hmu, D, c, hc⟩ := h
  refine ⟨L₂, inferInstance, inferInstance, inferInstance, hL, hmu, c, ?_⟩
  intro Z
  obtain ⟨Exc, hcard, hfar, _⟩ := hc Z
  exact canonicalBad13_card_of_exception l R c L₂ Z Exc hcard hfar

theorem odd_fixed_of_count13 (l R : ℕ) [Fact l.Prime]
    (L₀ : Type) [Field L₀] (hl2 : l ≠ 2) (hPT : PTSha)
    (h : OddFixedCount13 l R L₀) : OddFixedBudget13 l R L₀ := by
  obtain ⟨L₂, _, _, _, hL, hmu, c, hc⟩ := h
  obtain ⟨D⟩ := ldata_nonempty (F := L₂) (Ω := AlgebraicClosure L₂) l
  refine ⟨L₂, inferInstance, inferInstance, inferInstance, hL, hmu, D, c, ?_⟩
  intro Z
  refine ⟨canonicalBad13 l R c L₂ Z, hc Z, ?_, ?_⟩
  · intro e he heZ hn
    exact canonicalBad13_far l R c L₂ Z e he heZ hn
  · intro e _ _ _
    exact shaInv_le_VLen_of_localPT13 D (e : ℤ) hl2
      (hPT L₂ (AlgebraicClosure L₂) l D (e : ℤ))

theorem fixedIn_to_count13 (h : FixedIn) : OddCountIn13 := by
  intro l _ hl2 A hA L₀ _ _ hL
  obtain ⟨R, hR⟩ := fixedIn_to_odd_fixed13 h l hl2 A hA L₀ hL
  exact ⟨R, count_of_odd_fixed13 l R L₀ hR⟩

theorem oddCount_to_fixed13 (hPT : PTSha) (h : OddCountIn13) : OddFixedIn13 := by
  intro l _ hl2 A hA L₀ _ _ hL
  obtain ⟨R, hR⟩ := h l hl2 A hA L₀ hL
  exact ⟨R, odd_fixed_of_count13 l R L₀ hl2 hPT hR⟩

theorem thmBab_of_count13 (hK : ∃ CK : ℝ, LemmaK CK)
    (hPT : PTSha) (h : OddCountIn13) (hT : TwoIn) :
    ∃ K : BConst, ∀ Ct : ℝ, 1 ≤ Ct → ThmBab K Ct :=
  thmBab_of_fixed13 hK (oddCount_to_fixed13 hPT h) hT

end UpperTheory.V.Win

example (hPT : PTSha) (h : OddCountIn13) : OddFixedIn13 := by
  first | rh_reduce 3 using [oddCount_to_fixed13] | exact oddCount_to_fixed13 hPT h

example (hPT : PTSha) (h : OddCountIn13) : OddFixedIn13 := by
  first | rh_auto 3 | exact oddCount_to_fixed13 hPT h

example (hPT : PTSha) (h : OddCountIn13) : OddFixedIn13 := by
  rh_auto_frontier 2
  all_goals exact oddCount_to_fixed13 hPT h

#print axioms UpperTheory.V.Win.canonicalBad13_card_of_exception
#print axioms UpperTheory.V.Win.shaInv_le_VLen_of_localPT13
#print axioms UpperTheory.V.Win.odd_fixed_of_count13
#print axioms UpperTheory.V.Win.thmBab_of_count13
rh_scan UpperTheory.V.Win.shaInv_le_VLen_of_localPT13 limit 2000
rh_scan UpperTheory.V.Win.thmBab_of_count13 limit 2000
rh_prune UpperTheory.V.Win.thmBab_of_count13 as RH13ThmBabCountPruned
