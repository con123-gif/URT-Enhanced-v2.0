import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.AdmissibleLabelWeightsOfGreenCuspidalParametrisa
import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.HarishChandraSeriesWeightLowerComparison
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Lane 8 RUN28: remove native-to-literature full series transport at the coefficient level
25 Nov 2026. HUMAN SOURCE-MATCHED DERIVATION; Lean candidate PREPARED, NOT compiled.
Canonical RH equation: G(x) <= x^(1/2+9ε) on arbitrarily distant [Y,Y^(3/2)].
This local result is a supplier of the preceding RUN26/27 squarefree minorant,
not a proof of the equation. All actual host, row, Green, trace and geometric
hypotheses survive unless explicitly weakened below.

Preflight: latest mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
(including unified engine and pyramid/ten-page cap); AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972;
SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74;
HANDOFF bbc46df7d7716a6d8863275b5271801eacfaad0d; expansion c8152d0751072ed693046ada46f8dbcc93d24aab.
State/log/runner/continuity and CI excerpts inspected; RUN27 affaca49ecac7afeb78f804bafb1467170cb4151
read in full; recent peer 9a27b43f (arithmetic 2-group), 1f91435b and c063b20c
(signed principal average), 5dc8ff3a (Landau), live manuscript blob
3c62f55c12c6a9dbe3054143e6b1635baf381356 inspected.
No duplicate global-count or Landau work. Not an exhaustive archive audit.

Exact source pin: leanprover-community/riemann-hypothesis @
40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed
a85077714ca7b298f69e48798497519ed5326a89, unchanged since RUN27.
Selective current files below have changed blobs; use pinned source only.
Executed connector checks: 9/9 exact blob IDs and 17/17 textual declaration/body
anchors matched. No Lean or Lake executable found locally. Previously published
CI status files rh-recursive-reduction-strip-root-20261125 (blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc)
and rh-proof-term-prune-native-20261125 (7da354941e402b6f8b364ed03d8c5c82d27b7717)
read: both status pass / returncode 0. Latest orchestrator run 45591322488
at 10:24 UTC predates this artifact. None validates this new candidate.
No synthetic matrices, new URT claim or use of RH.

## Compact proof block for integration

Let S_f be the set of irreducible characters χ of GL_N(F_g) for which SOME
simple representation V of character χ has native label f. The precise
zOf_character theorem says zOf(V.character)=zIdem(V), so the central idempotent
depends only on the character, not its chosen representative. Apply the
native finsum_zOf_eq_finsum_zIdem to this existential predicate:
eSerO(O,N,f) = sum_{χ∈S_f} zOf(χ). In the reverse direction choose the
representation witnessing the label, not the unrelated representation
witnessing the same character. This does not require any label uniqueness.
S_f is finite by irr_finite_and_finsum_zOf_eq_one.

For any native idempotent a and any simple V with native label f,
    Re (a eSerO(O,N,f))[1] >= (dim V / |GL_N|) Re tr(a,V.character) >= 0.
Proof: expand the finite sum using trIdem, all terms are nonnegative by
the exact integral degree and idempotent trace assertions; keep just V's
character. Positive identity coefficient of a then allows division.
This makes the earlier RUN27 coefficient-selection bridge independent of
eSerC, Green permutations, eSer_eq, reverse singleton exclusion and
any assumption that all reps with equal characters satisfy HasLabelO.

Furthermore the actual first half of exists_perm_deg proves a weaker and
sufficient statement directly: for every native degree-d prime label P,
there exists a simple cuspidal V with O.lab d V=P and
V.character(1)=prod_{i=1}^{d-1}(g^i-1).
Indeed choose the Green reps of each valid label; the map from the finite
label set to itself induced by O.lab is injective by O.lab_inj and Green
injectivity. Hence surjective. The third Green exhaustion clause is not
needed. This theorem below reconstructs the first half without even
constructing σ,π or asking for the reverse dictionary.

Remaining block witness: let Q be the list of chosen native cuspidal
characters with rank attached. A concise way to handle dependent rank
transport is to define a function ℓ on Pc(g) by choosing a simple
cuspidal representative if one exists (arbitrary value otherwise).
For positive ranks ℓ(d,χ) is independent of the choice by iso_of_char
and O.lab_iso. Hence ℓ applied to each chosen character is its factor
P_i, and ℓ applied to each transported block of canonList b lam is
labO O (lam c) by simple_transp/isCuspidal_transp and the definition
of labO. Apply List.map ℓ to canonList b lam=Q, then take products.
This proves the exact native product-label field without index-by-index
dependent casts or a global permutation. The native Mackey norm-one,
constituent, Whittaker and dimension suppliers from RUN27 then give
one simple V at f, and the coefficient bridge yields
    wt_J(f) >= (1-1/g) / prod_i(g^{d_i}-1) >= (1-1/g)g^{-N}.
The two native candidate declarations for coefficient and cusp witnesses
are below; the dependent list-map argument and full producer/caller
composition are still human-only. Do not claim the whole admLq bundle:
its equality/comparison/upper fields are stronger than this target.
Existing native sum_eSer, zero weight, normalization, row identities,
Green existence, actual GoodAt complement, CountAllRows, host existence
and geometric estimates are not discharged here. No new published
mathematical result claimed; this is a local restructuring of the source.

Original branch (preserved RUN25/26/27 and pinned code):
admissibleLabelWeights -> exists_perm -> exists_perm_deg (three Green clauses),
eSer_eq -> both dictionary directions + label uniqueness + ext_back;
squarefree_series -> both directions; exact weights -> locShare -> TopG.
Candidate replacement (NOT authenticated elaborated graph):
native_cusp_degree_exists -> first two Green clauses + native lab_inj + finite
injection; native_series -> Q witness and zOf_character; native_coeff ->
trIdem + finite irreducibles; native_witness_coefficient -> one witness +
positivity; then RUN27 block/degree/trace -> RUN26 minorant -> reduced consumer.
No dependency removed globally without caller replay; all prior pending nodes,
constructor/type/value edges and axiom evidence retained.
Context cache key (pin, D, actual k, O, f, d, χ, a, nonzero identity coefficient,
factor list and rank context). If the list-map transport or caller fails native
checking, backtrack to original eSer_eq and RUN26 exact weight path.

Pinned source hashes checked (paths relative to src/):
Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/FinsumCentralIdempotentOfIrrCharacterEqSimple.lean
  7c739d7127e519691f6122722a5872f604dd7164 (zOf_character, finsum_zOf_eq_finsum_zIdem)
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/AdmissibleLabelWeightsOfGreenCuspidalParametrisa.lean
  d240897ba7b7ac9327ad66e045a24522d8ab2ed0 (exists_perm_deg, primeLab_lab)
Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/HarishChandraSeriesWeightLowerComparison.lean
  cc3c4217b7657cce90c2b6c6a4246b2275a5d8aa (coefficient expansion pattern)
Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsBlocksOfCuspidalCharacterList.lean
  3bc7340a0d2be3c2eb2a19f10b61d799bd7d1a43 (entry_eq, canonList_of_cuspidal_list)
Formalism/LocalToGlobal/NormalizedHeckeFactors/CoeffZeroNeOfMonicIrr.lean
  27290affacffacc73db3fdd250c03cbe82c904f8 (eSerO, hasLabelO_spec)
Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GroupAlgebraTraceIdempotentAndIrreducibleDegree.lean
  540b48779cba016ebaaba2d29a4180a4b39da700 (trIdem, tr_idem_nat)
Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/FiniteIrrCharactersAndFinsumCentralIdempotentsEq.lean
  4292f9b2757901ced80e4cb52a4003794277934c (irr_finite_and_finsum_zOf_eq_one)
Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/LabelDatum.lean
  8b45fadba6baf9bf7bb49b9c18dac0fb497f00ff (Green, IsIrr)
Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/CanonListLength.lean
  3f38f1bc029f8887cd165fe974ce140e43f47309 (canonList)
At observed current main first two file blobs are fe0eb123e5d82cd0fa939c69434450c8bdfd8aa4
and 7bea210c288d328cafaa076e056750618dbc9dd2. Present, not byte-identical.
Do not mix revisions.

RESUME HERE: compile this file in the pinned native environment using the
existing engine modules, correct elaboration failures, implement the list-map
transport and full actual squarefree minorant caller; inspect original/reduced
typed graph and axiom evidence. If the certificate has been checked by a peer,
go directly to the exact CountAllRows/irrC producer. HANDOFF TO kernel, audit,
integration/editor. RH OPEN.
-/

open CategoryTheory Polynomial GlobalTheory.GLq
open Formalism.IrreducibleCountingLemmas.TYPES
open scoped Classical BigOperators

namespace RHTheta28
noncomputable section

variable {g : ℕ} [Fact g.Prime]
variable {C : LabelConv (ZMod g)} (O : LabelMap (ZMod g) C)

def nativePred {r : ℕ} (f : (ZMod g)[X]) (χ : Gn g r → ℂ) : Prop :=
  ∃ V : FDRep ℂ (Gn g r), Simple V ∧ V.character = χ ∧ HasLabelO O V f

theorem native_series (r : ℕ) (f : (ZMod g)[X]) :
    Formalism.L2.NT.eSerO O r f =
      ∑ᶠ χ ∈ {χ : Gn g r → ℂ | IsIrr χ ∧ nativePred O f χ}, zOf χ := by
  unfold Formalism.L2.NT.eSerO
  rw [GlobalTheory.SerCmp.finsum_zOf_eq_finsum_zIdem]
  refine finsum_congr fun z => finsum_congr_Prop (propext ?_) fun _ => rfl
  constructor
  · rintro ⟨V, hV, hz, hL⟩
    exact ⟨V, hV, hz, V, hV, rfl, hL⟩
  · rintro ⟨V, hV, hz, W, hW, hch, hL⟩
    refine ⟨W, hW, ?_, hL⟩
    rw [← GlobalTheory.SerCmp.zOf_character W, hch,
      GlobalTheory.SerCmp.zOf_character V]
    exact hz

theorem native_finite (r : ℕ) (f : (ZMod g)[X]) :
    {χ : Gn g r → ℂ | IsIrr χ ∧ nativePred O f χ}.Finite :=
  (irr_finite_and_finsum_zOf_eq_one (Gn g r)).1.subset fun _ h => h.1

theorem native_coeff {r : ℕ} (f : (ZMod g)[X])
    (a : MonoidAlgebra ℂ (Gn g r)) :
    ((a * Formalism.L2.NT.eSerO O r f).coeff 1).re =
      ∑ χ ∈ (native_finite O r f).toFinset,
        (χ 1).re / (Fintype.card (Gn g r) : ℝ) * (tr a χ).re := by
  rw [native_series O r f, finsum_mem_eq_finite_toFinset_sum _ (native_finite O r f),
      Finset.mul_sum]
  simp only [MonoidAlgebra.coeff_sum, Finsupp.finset_sum_apply, Complex.re_sum]
  refine Finset.sum_congr rfl fun χ hχ => ?_
  rw [(trIdem (Gn g r) a χ).2.2]
  have hi : IsIrr χ := ((Set.Finite.mem_toFinset (native_finite O r f)).1 hχ).1
  obtain ⟨d, -, hd⟩ := (trIdem (Gn g r) a χ).2.1 hi
  rw [hd]
  have hcast : (d : ℂ) / (Fintype.card (Gn g r) : ℂ) =
      (((d : ℝ) / (Fintype.card (Gn g r) : ℝ) : ℝ) : ℂ) := by push_cast; rfl
  rw [hcast, Complex.re_ofReal_mul]
  simp

theorem native_witness_coefficient {r : ℕ} (f : (ZMod g)[X])
    (a : MonoidAlgebra ℂ (Gn g r)) (ha : a * a = a)
    (V : FDRep ℂ (Gn g r)) (hV : Simple V) (hL : HasLabelO O V f) :
    (V.character 1).re / (Fintype.card (Gn g r) : ℝ) * (tr a V.character).re ≤
      ((a * Formalism.L2.NT.eSerO O r f).coeff 1).re := by
  rw [native_coeff O f a]
  have hv : V.character ∈ (native_finite O r f).toFinset :=
    (Set.Finite.mem_toFinset _).2 ⟨⟨V,hV,fun _ => rfl⟩,V,hV,rfl,hL⟩
  apply Finset.single_le_sum _ hv
  intro χ hχ
  have hi : IsIrr χ := ((Set.Finite.mem_toFinset (native_finite O r f)).1 hχ).1
  have hchar : IsChar χ := by
    obtain ⟨W, -, hw⟩ := hi
    exact ⟨W, hw⟩
  obtain ⟨d, -, hd⟩ := (trIdem (Gn g r) a χ).2.1 hi
  have ht : ∃ m : ℕ, tr a χ = m := by
    first | rh_reduce 2 using [GlobalTheory.GLq.TrIdem.tr_idem_nat]
          | exact (trIdem (Gn g r) a χ).1 ha hchar
  obtain ⟨m, hm⟩ := ht
  rw [hd, hm]
  first | (rh_auto_frontier 1; done) | (rh_auto 1; done) | positivity

-- This is the first half of the actual exists_perm_deg body, retaining
-- only the existence and injection clauses of the Green input.
theorem native_cusp_degree_exists (hG : Green) (L : LabelDatum g)
    (d : ℕ) (hd : 0 < d) (P : (ZMod g)[X]) (hP : IsPrimeLab d P) :
    ∃ V : FDRep ℂ (Gn g d), Simple V ∧ IsCuspidal (ZMod g) V ∧
      O.lab d V = P ∧ V.character 1 = ∏ i ∈ Finset.Ico 1 d, ((g : ℂ)^i-1) := by
  obtain ⟨τ, h1, h2, _⟩ := hG g L d hd
  have hV : ∀ Q : {P : (ZMod g)[X] // IsPrimeLab d P},
      ∃ V : FDRep ℂ (Gn g d), Simple V ∧ IsCuspidal (ZMod g) V ∧
        ∀ x, V.character x = τ Q.1 x := fun Q => by
    have hc := (h1 Q.1 Q.2).1.2.1
    obtain ⟨V, hs, hx⟩ := hc.2.1
    have e : (fun x => V.character x) = τ Q.1 := funext hx
    exact ⟨V, hs,
      (GlobalTheory.T.isCuspidalCharacter_iff_isCuspidal_GLnFiniteField g d V hd hs).1 (e ▸ hc), hx⟩
  choose W hWs hWc hWx using hV
  let p : {P : (ZMod g)[X] // IsPrimeLab d P} →
      {P : (ZMod g)[X] // IsPrimeLab d P} :=
    fun Q => ⟨O.lab d (W Q), GlobalTheory.Top.Lq.primeLab_lab O _ hd (hWs Q) (hWc Q)⟩
  have hinj : Function.Injective p := fun Q R h => by
    obtain ⟨i⟩ := O.lab_inj d (W Q) (W R) hd (hWs Q) (hWc Q)
      (hWs R) (hWc R) (congrArg Subtype.val h)
    refine Subtype.ext (h2 _ _ Q.2 R.2 (funext fun x => ?_))
    rw [← hWx, ← hWx, FDRep.char_iso i]
  haveI : Finite {P : (ZMod g)[X] // IsPrimeLab d P} :=
    (GlobalTheory.Top.Lq.finite_primeLab (g := g) d).to_subtype
  obtain ⟨Q,hQ⟩ := (Finite.injective_iff_bijective.1 hinj).2 ⟨P,hP⟩
  refine ⟨W Q,hWs Q,hWc Q, congrArg Subtype.val hQ, ?_⟩
  rw [hWx Q 1]
  exact (h1 Q.1 Q.2).2

#print axioms native_series
#print axioms native_coeff
#print axioms native_witness_coefficient
#print axioms native_cusp_degree_exists
end
end RHTheta28

rh_scan GlobalTheory.Top.Lq.exists_perm_deg limit 2000
rh_scan GlobalTheory.Top.Lq.admissibleLabelWeights_of_greenCuspidalParametrisation limit 2000
rh_scan RHTheta28.native_witness_coefficient limit 2000
rh_prune GlobalTheory.Top.Lq.exists_perm_deg as RHTheta28OriginalPermPruned
rh_prune RHTheta28.native_witness_coefficient as RHTheta28WitnessPruned
#print axioms GlobalTheory.Top.Lq.exists_perm_deg
#print axioms GlobalTheory.Top.Lq.admissibleLabelWeights_of_greenCuspidalParametrisation
