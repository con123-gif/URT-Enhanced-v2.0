import RHKernelRank3Witness21
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 12 RUN45 — 26 November 2026. HUMAN PROOF / SOURCE-MATCHED; conditional Lean adapter PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory unified engine read first; SWARM/HANDOFF/AGENTS/state/continuity and runner protocol consulted. Peer 27896ee5 (actual rank3 witness), 5744b095 (shared VWin rank slices), 2b75bc4a (two cohomology fields), 4daf9080 (Clozel) read; no duplicate unused-premise result. Previous own 054230d9 max exponent retained. Stage peer 27896ee5 file under RHKernelRank3Witness21. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: actual rank-three CM coefficient family m=(e-1,-1,-e-1), e>=1, admits dimension <= e^3 at the native polynomial Pre stage, and <= e^(3*[K:Q]) after the native exists_tens, rather than the generic ninth power per embedding. For quadratic K this is e^6. Proof is elementary and does not assume an irreducibility theorem or Weyl dimension formula.

Put t=e-1. The native TWeylC uses N=3+H=e+4 and nu=(2e+3,e+4,5) at H=e+1. Cancel common shift 5 exactly in N and every nu: use N=t and nu=(2t,t,0); the qdet factors u-N-k+nu_k are unchanged for all three k. No change in the central character or chosen m. For the native right translation rtr(g) on the polynomial ring in matrix entries X, let x be row 0 and y the cross product of rows 0,1 (signed minors). Take f=x_0^t y_2^t = minor(0)^t minor(1)^t. This is a nonzero polynomial, degree 3t. For upper triangular b, rtr(b)f=b00^(2t)b11^t f (minorRtr), hence is the native top vector of weight nu. For ANY matrix g, even singular, rtr(g)x=xg and the minors y transform linearly by the second exterior power of g (Cauchy–Binet). Thus every rtr(g)f lies in the image of the bidegree (t,t) part of C[a0,a1,a2,b0,b1,b2] under a->x,b->y. The relation a0*b0+a1*b1+a2*b2 maps to zero exactly (x dot cross(x,row1)=0). For t>=1 multiplication by that nonzero polynomial injects the bidegree (t-1,t-1) space into degree (t,t), since the polynomial ring is a domain. Consequently the image dimension is at most
   binom(t+2,2)^2 - binom(t+1,2)^2 = (t+1)^3 = e^3.
At t=0 the span is the constants, dimension 1. No need to prove the relation generates the whole kernel; additional relations only strengthen the upper bound. In native polPre 3 (3*t), map this orbit through its linear equivalence. In Scalar.lean the submodule S is exactly the span of these vectors, preSub gives d'=finrank S, and the rest of scalar proves HasWt nu on that same S. Replace only its coarse finrank_le estimate by the bound above. This proves the human Rank3SmallPre45 interface; formalization of the graded-polynomial image/kernel and copying scalar with the strengthened rank conclusion remain open. Native existsScalar also gives the independent coarse fallback dimension (6t+1)^9 after exact common shift (not e^3). The prepared downstream adapter below deliberately takes Rank3SmallPre45 as an explicit premise until the native bridge is checked.

Then at original TCardK: cohBoundFree's actual witness exponent is [K:Q]*3^2, from cohBound_of. For quadratic K this is 18. With original Clozel and Borel hypotheses the same catalogue therefore obeys |S| <= C_K M^18 e^6 <= C_K (M*(e+2))^18. The public native cohBoundFree existential hides exponent; Lean adapter keeps A2 and max(A2,3*card embeddings) rather than falsely extracting the explicit 18 from an opaque existential. The original generic coefficient bound is order e^18 over a quadratic K. The improved exact bivariate bound does NOT by itself improve the best homogenized exponent 18, prove uniformity in varying K, or close any prime-window obligation.

Original graph: KeepNumU -> countK_alt -> TCardK -> TWeylC -> existsScalar -> topPol + polPre + scalar + degRank; exists_tens; cohBoundFree, Borel, Clozel. Peer graph: rank3 witness21 -> countK_rank3_of_witness21 -> general CardK. Candidate: countK_rank3_small45 -> rank3_card45 -> rank3_alg45 -> Rank3SmallPre45 (human argument above, native bridge OPEN), same exists_tens/cohBoundFree/Borel/Clozel and all catalogue, Galois classification, same-host witnesses and original hypotheses retained. All original type/value/constructor/axiom graphs survive; no globally retired edges. Cache by source, toolchain, K, e,t, M, pi, Xi, p,w,l,Omega,iota, actual role; no merging of different weights/hosts. Backtrack to original native count on failed verification.

Source ledger relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
ModularityArgument/ThresholdArguments/DenseThresholdCases/TCardK.lean c6eb1d67f72c45007e3330ea65b0966f3f27cd96
ModularityArgument/ThresholdArguments/DenseThresholdCases/TWeylC.lean d716d26265f83c1266a7f10f76c3fedc914bfb66
GaloisLibrary/WeylAlgebraQuantumDet/Scalar.lean 455c29847b54751a60460060c8b0446276429706
GaloisLibrary/WeylAlgebraQuantumDet/IsTop.lean 3559a91ec13a29e3c6651d7a94840695dd448b84
GaloisLibrary/WeylCharacterRegularity/ExistsTens.lean 66a759fcbc23274989542bff7fcb257deab4c4ef
AutomorphicForms/TemperedLocalComponents/CohBoundFree.lean 3eb3da1c74e98bfa35f2b86c0942f380bf4748b0
AutomorphicForms/IsoOfFrob.lean ca66d1cfa22126abae28e82f58ce073dcde6ad34
GaloisLibrary/WeylAlgebraQuantumDet/PolPre.lean 82cf840552c469825267f7a9082fc71dc875152d
Peer blob e638a13b5d650ffc4bf167bafc83b364b0c8630b. Executed 25 source and reversible substitution checks: pin ModularityArgument/ThresholdArguments/DenseThresholdCases/TCardK.lean; pin ModularityArgument/ThresholdArguments/DenseThresholdCases/TWeylC.lean; pin GaloisLibrary/WeylAlgebraQuantumDet/Scalar.lean; pin GaloisLibrary/WeylAlgebraQuantumDet/IsTop.lean; pin GaloisLibrary/WeylCharacterRegularity/ExistsTens.lean; pin AutomorphicForms/TemperedLocalComponents/CohBoundFree.lean; pin AutomorphicForms/IsoOfFrob.lean; pin GaloisLibrary/WeylAlgebraQuantumDet/PolPre.lean; peer pin; actual orbit span; right translation fixes row; tensor exponent; cohomology explicit exponent; actual card uses two fields; extract actual peer caller; unique substitution countK_rank3_of_witness21 :; reverse substitution countK_rank3_of_witness21 :; unique substitution _root_.UpperTheory.V.Af.Hypotheses' → Rank3LevelWitness21 → CountK3Sli; reverse substitution _root_.UpperTheory.V.Af.Hypotheses' → Rank3LevelWitness21 → CountK3Sli; unique substitution intro hP hW K _ _ _ hK; reverse substitution intro hP hW K _ _ _ hK; unique substitution _root_.UpperTheory.V.Af.card_k_of_printed_results hP K 3 (by norm_num); reverse substitution _root_.UpperTheory.V.Af.card_k_of_printed_results hP K 3 (by norm_num); unique substitution hcard m hm H hH M hM; reverse substitution hcard m hm H hH M hM. Executed 1000 exact BigInt checks of the dimension identity at e=1..1000 (regression only). Local Lean/Lake/elan absent; actual status.json for existing 45577239749 and 45576756833 read, both pass for OLD baseline only. No new Lean run/axiom audit; not queued here. No RH or URT speed claim.

RESUME HERE: formalize the bidegree quotient dimension using polynomial monomial bases and multiplication injection, then replay the native scalar proof with the orbit-span bound in place of finrank_le. Compile peer witness21 and this adapter on the warmed pinned engine; verify actual caller and axiom/constructor roles. Preserve all original fallbacks, unresolved VWin uniform arithmetic/geometry and prime-window target.
HANDOFF TO kernel extractor, Galois, literature, integration and audit. RH OPEN.
-/

noncomputable section
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
open NumberField GlobalTheory.CuspRep GlobalTheory.GKCoh UpperTheory.V.Af
open UpperTheory.V.Weyl

def Rank3SmallPre45 : Prop :=
  ∀ e : ℕ, 1 ≤ e →
    ∃ P : Pre 3, 0 < P.d ∧ P.d ≤ e ^ 3 ∧
      P.HasWt (fun k => ((![2 * (e - 1), e - 1, 0] : Fin 3 → ℕ) k : ℂ))

theorem rank3_alg45 (hsmall : Rank3SmallPre45)
    (K : Type) [Field K] [NumberField K] [IsTotallyComplex K]
    (e : ℕ) (he : 1 ≤ e) :
    ∃ Ξ : AlgRep K 3,
      (∀ τ, AlgInfChar Ξ τ ((infOf (![ (e : ℤ) - 1, -1, -(e : ℤ) - 1 ] : Fin 3 → ℤ)).map Neg.neg)) ∧
      Ξ.d ≤ e ^ (3 * Fintype.card (K →+* ℂ)) := by
  let t : ℕ := e - 1
  let ν : Fin 3 → ℕ := ![2 * t, t, 0]
  let m : Fin 3 → ℤ := ![(e : ℤ) - 1, -1, -(e : ℤ) - 1]
  obtain ⟨P, hP, hd, hw⟩ := hsmall e he
  have ht : t + 1 = e := by dsimp [t]; omega
  have hν : ∀ k, (ν k : ℤ) = (t : ℤ) + (k : ℕ) - 2 - m k.rev := by
    intro k
    fin_cases k <;> simp [ν, m, Fin.rev] <;> omega
  obtain ⟨Ξ, h1, h2⟩ := UpperTheory.V.WeylC.exists_tens (E := K) P hP (fun k => (ν k : ℂ)) hw t
  refine ⟨Ξ, fun τ => (UpperTheory.V.WeylC.algInfChar_iff _ _ _).2 ⟨by simp [UpperTheory.V.Af.infOf], fun u => ?_⟩, ?_⟩
  · rw [h2, UpperTheory.V.Af.infOf, Multiset.map_map, Multiset.map_map]
    congr 1
    refine (Fintype.prod_equiv Fin.revPerm _ _ fun k => ?_)
    have h3 : ((ν k : ℕ) : ℂ) = (t : ℂ) + (k : ℂ) - 2 - (m k.rev : ℂ) := by
      exact_mod_cast congrArg (Int.cast : ℤ → ℂ) (hν k)
    simp only [Function.comp_apply, Fin.revPerm_apply, h3]
    push_cast
    ring
  · rw [pow_mul]
    exact h1.trans (Nat.pow_le_pow_left hd _)

private theorem rank3_card45 (hs : Rank3SmallPre45)
    (P : UpperTheory.V.Af.Hypotheses') (K : Type) [Field K] [NumberField K] [IsCMField K] :
    ∃ c A : ℕ, ∀ e : ℕ, 1 ≤ e → ∀ M : ℕ, 1 ≤ M →
      ∀ S : Finset (CuspSub K 3), (∀ π ∈ S, π ∈ SigK K (![ (e : ℤ) - 1, -1, -(e : ℤ) - 1 ] : Fin 3 → ℤ) M) →
      (∀ π ∈ S, ∀ π' ∈ S, π.Iso π' → π = π') →
      S.card ≤ c * (M * (e + 2)) ^ A := by
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) 3 ⊤ inferInstance
  let a := 3 * Fintype.card (K →+* ℂ)
  refine ⟨c₂, max A₂ a, fun e he M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := rank3_alg45 hs K e he
  have h3 : 1 ≤ 3 * M := by omega
  have hB := P.borelC K 3 (by norm_num) (UpperTheory.V.Af.KLev K 3 (3 * M))
    (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨P.cohC K 3 (by norm_num) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (UpperTheory.V.Af.KLev_le_of_dvd (dvd_mul_left M 3) hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (max A₂ a) := Nat.pow_le_pow_right hM (le_max_left _ _)
  have h4 : e ^ a ≤ (e + 2) ^ (max A₂ a) :=
    (Nat.pow_le_pow_left (by omega) _).trans (Nat.pow_le_pow_right (by omega) (le_max_right _ _))
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (max A₂ a) * (e + 2) ^ (max A₂ a) :=
      Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans h4)
    _ = c₂ * (M * (e + 2)) ^ (max A₂ a) := by rw [mul_pow, mul_assoc]

open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.GalOfCusp GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.LocGL UpperTheory.V.Published UpperTheory.V.Af.Bc
open scoped Matrix
namespace UpperTheory.GalN.V.Win.N
private theorem strict_rank3_45 (e : ℕ) (he : 1 ≤ e) :
    StrictAnti (![ (e : ℤ) - 1, -1, -(e : ℤ) - 1 ] : Fin 3 → ℤ) := by
  refine Fin.strictAnti_iff_succ_lt.2 fun i => ?_
  fin_cases i <;> simp <;> omega

theorem countK_rank3_small45 :
    Rank3SmallPre45 → _root_.UpperTheory.V.Af.Hypotheses' → Rank3LevelWitness21 → CountK3Slice21 := by
  intro hsmall hP hW K _ _ _ hK
  classical
  obtain ⟨c, A, hcard⟩ := rank3_card45 hsmall hP K
  refine ⟨c, A, fun e he M hM p w hp hw hpM hpd => ?_⟩
  let n : ℕ := 3
  let m : Fin n → ℤ := ![(e : ℤ) - 1, -1, -(e : ℤ) - 1]
  let H : ℕ := e + 1
  have hn : 2 ≤ n := by decide
  have hm : StrictAnti m := strict_rank3_45 e he
  have hwt : ∀ i, m i + m i.rev = 1 - (n : ℤ) := by
    intro i
    fin_cases i <;> simp [m, n, Fin.rev] <;> ring
  have hH : ∀ i, |m i| ≤ (H : ℤ) := by
    intro i
    rw [abs_le]
    fin_cases i <;> simp [m, n, H] <;> omega
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigK K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigK K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard e he M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.V.Af.conjK_alt hP K n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := 1 - n)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB, algSat, Multiset.card_map, ← hB.card]
      simp)
    (by exact zero_lt_one.trans (NumberField.HeightOneSpectrum.one_lt_absNorm w))
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact win_algSat (by omega) π m _ hwt hπ.1 hB)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact _root_.UpperTheory.V.Z.Int.intK_of_prints hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmKNAlt ι M m r}, ∃ π : ↥(SigK K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, hπ, hss, hF⟩ := hW K hK e he M hM l hl2 Ω ι r.1 r.2
    refine ⟨⟨π, hπ⟩, hss, fun v hv => ?_⟩
    obtain ⟨B, hB⟩ := hsat π hπ v
    rw [hsys π v B hB]
    exact hF v.1 hv B hB
  choose f hss hf using hform
  refine ⟨fun r => cl (f r), fun r r' h => ?_, fun r => ?_⟩
  · refine _root_.UpperTheory.V.Af.iso_of_frobenius_of_printed_results hP K Ω l ι n r.1 r'.1 r.2.level.cont r'.2.level.cont (hss r) (hss r') ?_
    filter_upwards [eventually_natCast_notMem (F := K) (M := M) (by omega),
      eventually_natCast_notMem (F := K) hl.out.ne_zero] with v hvM hvl
    refine ⟨sys (f r) ⟨v, hvM⟩, hf r ⟨v, hvM⟩ hvl, ?_⟩
    rw [hcl _ _ h]
    exact hf r' ⟨v, hvM⟩ hvl
  · rw [hβ]
    refine hf r ⟨w, hwM⟩ (natCast_notMem_of_not_dvd hp hw fun h => hlp ?_)
    exact ((Nat.prime_dvd_prime_iff_eq hp hl.out).1 h).symm

theorem countK_rank3_small_bridge45 (hs : Rank3SmallPre45)
    (hP : UpperTheory.V.Af.Hypotheses') (hL : UpperTheory.GalN.V.LevelKNAlt) : CountK3Slice21 := by
  first
  | rh_reduce 3 using [countK_rank3_small45, rank3_witness_of_level21]
  | rh_auto 2
  | solve
    | rh_auto_frontier 2
  | exact countK_rank3_small45 hs hP (rank3_witness_of_level21 hL)
end UpperTheory.GalN.V.Win.N

rh_prune UpperTheory.V.Af.weyl_complex_of_printed_results as RHWeylOriginal45
rh_scan UpperTheory.V.Af.card_k_of_printed_results limit 2000
rh_scan rank3_alg45 limit 2000
rh_scan rank3_card45 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_rank3_small45 limit 2000
#print axioms UpperTheory.V.Af.card_k_of_printed_results
#print axioms rank3_alg45
#print axioms rank3_card45
#print axioms UpperTheory.GalN.V.Win.N.countK_rank3_small45
