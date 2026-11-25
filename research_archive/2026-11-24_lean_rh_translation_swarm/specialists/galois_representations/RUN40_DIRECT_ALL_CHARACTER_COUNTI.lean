/-!
RUN40 lane 5, 25 Nov 2026. SOURCE-MATCHED human derivation / PREPARED,
NOT COMPILED. A simpler alternative to RUN34–39 for the original CountI.
NumberU3U_s accepts ANY finite Galois-stable slot set, with uniqueness
only WITHIN each slot. Take all complex Dirichlet characters mod N,
z(chi)=chi(normV w)^-1. Complex automorphisms act by coefficient
conjugation; normV(w) is coprime to N. Slot count phi(N)<=N by
Mathlib DirichletCharacter.card_eq_totient_of_hasEnoughRootsOfUnity.
At each l embed actual S=h.X(c l)e via iota∘algebraMap (native
comp_inj), and pad unused slots with empty representation sets.
No surjectivity, orbit transport, cross-character representation
separation or strengthened residual supplier needed. Repeated
representations across slots are allowed by the original premise;
do NOT merge distinct slots merely because their trace values agree.
Use hD on a singleton for the required nonvanishing; original
OneCharU_s then provides X_psi. Apply hD and native vl_bound to
the padded family to get Vlen finite for psi in S and
    sum_{psi in S} Vn(psi) <= 2 v_l(n_p).
The integer n_p is chosen before l,S,iota,witness choices (w itself
is chosen before n_p). Log size <= c*N*(N*(e+1))^A*log p.
Keep native fixed r1,r2 and host guards; use r1 except at l=r1.
Native corG_sum_log applied twice gives exactly the original
CountI bound 2 c N (N(e+1))^A (log r1+log r2), then original absorb.
No Linnik, no additional premises, no improved exponent claim.
Original selected graph CountI -> CorGK -> PropGK -> NumberU3U_s,
OneCharU_s, orb_equiv, orbital GD transport, partition and orbSum.
Candidate direct_countI -> whole_prime -> NumberU3U_s, OneCharU_s,
injective padding, native Frobenius/valuation helpers, Mathlib card.
RUN34–39 may still be useful for stronger quantitative bounds;
preserve original fallback, all original type/value/constructor
edges, axiom evidence, unresolved nodes. Context keys: pin/toolchain,
h,K,N,e,p,w,l,c,Omega,iota,B,sigma,S,role. No URT used.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Mathlib Orthogonality.lean blob 18d2f9c69192ed3415716487164744b36d4a4e9f.
Latest upstream observed 756a70250dcba9162b99d4ea35c186558434c17e.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4; SWARM 4b77b161,
HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS 8db0201d.
Peer commit titles 24d47ed6,96f96c3c,2f96ecf8,3e19ae4d,20e156a7;
joint-loss note 65d3dafb read. No peer verification claimed.
Source blobs relative src/Development/AutomorphicArithmetic/AutomorphicVarieties:
UnitaryThreeGroups/CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674
UnitaryThreeGroups/CorGSumLog.lean 39005a0a8594b8cd96d19794ee58dd04cdd35f52
ModularityArgument/ThresholdArguments/DenseThresholdCases/FPropGKU.lean 4887bdf435a54a8ab856102e15d60da39d041970
ModularityArgument/ThresholdArguments/DenseThresholdCases/NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258
HeightAndVanishing/SplittingFieldIsoQuadratic.lean 184aa8b8bf1980b955fb36ff107d9c579137c76e
Executed five pinned native hash checks, twelve anchor checks,
and exact CountI prefix rewrite. Lean/lake not installed.
Existing CI statuses 45577239749,45576756833 retrieved PASS
(blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717); not evidence for this file.
Orchestrator 45708321426 PASS is not this overlay. No new kernel
closure, axiom audit, or caller verification. No protected workflow
changed. Replay in warmed pinned environment with existing engines,
no RUN34–39 dependency. Record compiler failures and original/reduced
role graphs; independent audit of padding, private imports, tower
instances and exact actual CountI caller required.
RESUME HERE: compile whole_prime/direct_countI before additional
residual-trace certificates. If checked, substitute at the actual
CountI caller; prove/authenticate retained NumberU3U_s and OneCharU_s.
Do not retire other consumers of CorGK. HANDOFF TO kernel, formal
audit, integration, arithmetic. RH OPEN.
-/
import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.CountI
import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.CorGSumLog
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FPropGKU
import Mathlib.NumberTheory.DirichletCharacter.Orthogonality
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Formalism.BasicNotions Formalism.BasicNotions.Loc GlobalTheory.GalOfCusp Matrix IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.U3 UpperTheory.V.Z.J
open private isCM exists_w cop_norm frob_val vl_bound t_eq comp_inj from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FPropGKU
open private corG_sum_log from Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.CorGSumLog
open private absorb from Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.CountI
namespace RHGalois40
noncomputable section

theorem whole_prime (hNum : NumberU3U_s) (hOne : OneCharU_s)
    (K : Type) [Field K] [NumberField K] [IsCMField K]
    (hK : Module.finrank ℚ K = 2) :
    ∃ c₅ A : ℕ, ∀ (e N : ℕ) [NeZero N] (p : ℕ),
      1 ≤ e → p.Prime → ¬ p ∣ 30 * N * (discr K).natAbs →
      ∃ n : ℤ, n ≠ 0 ∧
        Real.log |(n : ℝ)| ≤ c₅ * N * ((N : ℝ) * (e+1))^A * Real.log p ∧
      ∀ (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
        [Algebra K Ω] (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p →
        ∀ (c : Coef l) (S : Finset (DirichletCharacter c.O N)),
        (∀ ψ ∈ S, GD Ω K l e ψ) →
        (∀ ψ ∈ S, Vlen Ω c e ψ ≠ ⊤) ∧
        ∑ ψ ∈ S, Vn Ω c e ψ ≤ 2 * (padicValInt l n : ℝ) := by
  classical
  obtain ⟨c₅,A,hC⟩ := hNum K hK
  refine ⟨c₅,A,?_⟩
  intro e N _ p he hp hnd
  have hN : ¬ p ∣ N := fun h => hnd ((h.mul_left 30).mul_right _)
  have hd : ¬ (p : ℤ) ∣ discr K := fun h => hnd ((Int.natCast_dvd.1 h).mul_left _)
  have h7 : 7 ≤ p := by
    have h30 : ¬ p ∣ 30 := fun h => hnd ((h.mul_right N).mul_right _)
    by_contra h
    push Not at h
    clear hnd hN hd
    revert hp h30
    interval_cases p <;> decide
  obtain ⟨w, hw⟩ := exists_w K hp
  let T := DirichletCharacter ℂ N
  obtain ⟨NN,h0,hsz,hdiv⟩ := hC e he N (NeZero.pos N) p w hp hw h7 hN hd
    T (fun χ => (χ (normV w))⁻¹)
    (fun χ => ⟨orderOf χ, orderOf_pos _, by
      rw [inv_pow, ← ZMod.coe_unitOfCoprime _ (cop_norm hp hN hw),
        ← MulChar.pow_apply_coe, pow_orderOf_eq_one, MulChar.one_apply_coe, inv_one]⟩)
    (fun σ => ⟨⟨fun χ => χ.ringHomComp σ.toRingHom,
      fun χ => χ.ringHomComp σ.symm.toRingHom,
      fun χ => MulChar.ext' fun a => σ.symm_apply_apply _,
      fun χ => MulChar.ext' fun a => σ.apply_symm_apply _⟩,
      fun χ => (map_inv₀ σ _).symm⟩)
  refine ⟨NN,h0,hsz.trans ?_,?_⟩
  · have hcard : Fintype.card T ≤ N := by
      rw [← Nat.card_eq_fintype_card]
      exact (DirichletCharacter.card_eq_totient_of_hasEnoughRootsOfUnity ℂ N).le.trans
        (Nat.totient_le N)
    have hl := Real.log_natCast_nonneg p
    gcongr
  intro Ω _ _ _ _ l _ hl2 hlp c S hG
  haveI : IsAlgClosed Ω := IsAlgClosure.isAlgClosed ℚ
  haveI : Algebra.IsAlgebraic K Ω := Algebra.IsAlgebraic.tower_top (K := ℚ) K
  haveI : IsAlgClosure K Ω := ⟨inferInstance, inferInstance⟩
  obtain ⟨ι⟩ : Nonempty (Qbar l ≃+* ℂ) := GlobalTheory.nonempty_padicAlgCl_ringEquiv_complex l
  obtain ⟨B,hB⟩ := ReciprocityTheory.Gal.exists_isPlaceOver Ω w
  obtain ⟨σ,hσ⟩ := ReciprocityTheory.Gal.exists_isFrob hB
  have hD := hdiv l hl2 hlp Ω ι B hB σ hσ
  obtain ⟨f1,f2⟩ := frob_val hp hN hlp hw hB hσ
  let j := ι.toRingHom.comp (algebraMap c.O (PadicAlgCl l))
  let E : S ↪ T := ⟨fun ψ => ψ.1.ringHomComp j,
    fun a b hab => Subtype.ext (comp_inj j (ι.injective.comp Subtype.val_injective) hab)⟩
  let t : T → Qbar l := fun χ => ι.symm (Af.eis3 (normV w) e (χ (normV w))⁻¹)
  have key := fun ψ : S => hOne Ω K l c N e ψ.1 (hG _ ψ.2) ι σ⁻¹ (t (E ψ))
    (by dsimp only [t,E,j,MulChar.ringHomComp_apply,RingHom.comp_apply]
        rw [map_inv (galEmb ℚ K Ω)]
        exact t_eq c e _ ψ.1 ι _ f1 f2)
    (fun ρ hρ => (hD (fun _ => {ρ}) (fun _ ρ' h => by rwa [Finset.mem_singleton.1 h])
      (fun _ a ha b hb _ => (Finset.mem_singleton.1 ha).trans (Finset.mem_singleton.1 hb).symm)).1
        (E ψ) ρ (Finset.mem_singleton_self ρ))
  refine ⟨fun ψ hψ => (key ⟨ψ,hψ⟩).1,?_⟩
  choose X hX1 hX2 hX3 using fun ψ => (key ψ).2
  let Y : T → Finset (G K Ω →* GL (Fin 3) (Qbar l)) := fun χ =>
    if h : ∃ ψ : S, E ψ = χ then X (Classical.choose h) else ∅
  have hY (ψ : S) : Y (E ψ) = X ψ := by
    dsimp only [Y]
    rw [dif_pos (show ∃ a : S, E a = E ψ from ⟨ψ,rfl⟩)]
    congr 1
    exact E.injective (Classical.choose_spec (show ∃ a : S, E a = E ψ from ⟨ψ,rfl⟩))
  have hY1 : ∀ χ, ∀ ρ ∈ Y χ, Adm3U_s ι e N ρ ∨
      _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ := by
    intro χ ρ hρ
    by_cases h : ∃ ψ : S, E ψ = χ
    · rw [← Classical.choose_spec h,hY] at hρ
      exact hX1 _ ρ hρ
    · simp [Y,h] at hρ
  have hY2 : ∀ χ, ∀ ρ ∈ Y χ, ∀ ρ' ∈ Y χ, Af.RepIso ρ ρ' → ρ = ρ' := by
    intro χ ρ hρ ρ' hρ' hi
    by_cases h : ∃ ψ : S, E ψ = χ
    · rw [← Classical.choose_spec h,hY] at hρ hρ'
      exact hX2 _ ρ hρ ρ' hρ' hi
    · simp [Y,h] at hρ
  obtain ⟨hne,hle⟩ := hD Y hY1 hY2
  have hb := vl_bound Y (fun χ ρ => (ρ σ⁻¹ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - t χ)
    NN h0 (fun χ ρ hρ => sub_ne_zero.2 (hne χ ρ hρ)) hle
  let F : T → ℝ := fun χ => ∑ ρ ∈ Y χ, vl l
    ((ρ σ⁻¹ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - t χ)
  have hpad : ∑ ψ : S, F (E ψ) = ∑ χ : T, F χ := by
    calc
      _ = ∑ χ ∈ Finset.univ.map E, F χ := by rw [Finset.sum_map]
      _ = ∑ χ : T, F χ := by
        apply Finset.sum_subset (Finset.subset_univ _)
        intro χ _ hχ
        have hh : ¬ ∃ ψ : S, E ψ = χ := by
          rintro ⟨ψ,rfl⟩
          exact hχ (Finset.mem_map.2 ⟨ψ,Finset.mem_univ _,rfl⟩)
        simp [F,Y,hh]
  rw [← Finset.sum_coe_sort]
  refine (Finset.sum_le_sum fun ψ _ => hX3 ψ).trans ?_
  rw [← Finset.mul_sum]
  apply mul_le_mul_of_nonneg_left _ zero_le_two
  calc
    _ = ∑ ψ : S, F (E ψ) := by
      apply Finset.sum_congr rfl
      intro ψ _
      simp only [F,hY]
    _ = ∑ χ : T, F χ := hpad
    _ ≤ _ := hb

theorem direct_countI : NumberU3U_s → OneCharU_s → CountI := by
  intro hNum hOne χ
  classical
  obtain ⟨hpK, hpK4, hpK7, hpKcop⟩ := (pK_pOne_prime_conditions χ).1
  obtain ⟨hdisc, htot, hquad, -⟩ := kstar (pK χ) hpK hpK4
  haveI : IsCMField (Kstar (pK χ)) := isCM _ hquad htot
  obtain ⟨c₅, A, hcor⟩ := whole_prime hNum hOne (Kstar (pK χ)) hquad
  obtain ⟨r₁, hr₁B, hr₁⟩ := Nat.exists_infinite_primes (30 * χ.N * pK χ + 1)
  obtain ⟨r₂, hr₂B, hr₂⟩ := Nat.exists_infinite_primes (r₁ + 1)
  obtain ⟨k, hk⟩ := pow_unbounded_of_one_lt (2 * (c₅ : ℝ) * (Real.log r₁ + Real.log r₂)) (by norm_num : (1 : ℝ) < 16)
  refine ⟨k + 1 + A, r₁, r₂, hr₁, hr₂, ?_⟩
  intro h hχ h1q h1d h2q h2d t hBig e he het Ω _ _ _ c Ls hLs
  subst hχ
  haveI : IsAlgClosed Ω := IsAlgClosure.isAlgClosed ℚ
  letI : Algebra (Kstar (pK h.chi)) Ω :=
    (IsAlgClosed.lift (M := Ω) (R := ℚ) (S := Kstar (pK h.chi))).toRingHom.toAlgebra
  obtain ⟨-, -, h16, -, -, hprimeN, -⟩ := hostIndex h
  have hN0 := h.N_pos
  have hqpos : 0 < h.chi.N := Nat.pos_of_ne_zero (h.chi.ne.out)
  have hnd : ∀ p : ℕ, p.Prime → 30 * h.chi.N * pK h.chi + 1 ≤ p → p < h.q1 → p < h.d →
      ¬ p ∣ 30 * h.N * (NumberField.discr (Kstar (pK h.chi))).natAbs := by
    intro p hp hpB hpq hpd hdiv
    rw [hdisc, Int.natAbs_neg, Int.natAbs_natCast] at hdiv
    have hp30 : 30 < p := by nlinarith [hpK7]
    rcases (Nat.Prime.dvd_mul hp).1 hdiv with h1 | h1
    · rcases (Nat.Prime.dvd_mul hp).1 h1 with h2 | h2
      · have := Nat.le_of_dvd (by norm_num) h2
        omega
      · rcases (hprimeN p hp).1 h2 with h3 | h3 | h3 | h3
        · omega
        · have := Nat.le_of_dvd hqpos h3
          nlinarith [hpK7]
        · omega
        · omega
    · have := Nat.le_of_dvd (by omega) h1
      nlinarith [hqpos]
  have hnd1 := hnd r₁ hr₁ hr₁B h1q h1d
  have hnd2 := hnd r₂ hr₂ (by omega) h2q h2d
  have hne : r₁ ≠ r₂ := by omega
  obtain ⟨n,hn,hb,hp⟩ := hcor e h.N r₁ he hr₁ hnd1
  obtain ⟨n',hn',hb',hp'⟩ := hcor e h.N r₂ he hr₂ hnd2
  have key : ∀ l ∈ Ls,
      (∀ ψ ∈ h.X (c l) e, Vlen Ω (c l) e ψ ≠ ⊤) ∧
      ∑ ψ ∈ h.X (c l) e, Vn Ω (c l) e ψ ≤
        2 * (padicValInt l n : ℝ) + 2 * (padicValInt l n' : ℝ) := by
    intro l hl
    have hG : ∀ ψ ∈ h.X (c l) e, GD Ω (Kstar (pK h.chi)) l e ψ := by
      intro ψ hψ
      obtain ⟨hchar,hpar⟩ := (Host.mem_X h).1 hψ
      exact gdOfHost h t hBig Ω l e (hLs l hl).1 he het (hLs l hl).2 _ ψ hchar hpar
    have a1 : (0 : ℝ) ≤ (padicValInt l n : ℝ) := Nat.cast_nonneg _
    have a2 : (0 : ℝ) ≤ (padicValInt l n' : ℝ) := Nat.cast_nonneg _
    by_cases hlp : (l : ℕ) = r₁
    · have hlp' : (l : ℕ) ≠ r₂ := fun x => hne (hlp.symm.trans x)
      obtain ⟨b1,b2⟩ := hp' Ω l (hLs l hl).1 hlp' (c l) _ hG
      exact ⟨b1,by linarith⟩
    · obtain ⟨b1,b2⟩ := hp Ω l (hLs l hl).1 hlp (c l) _ hG
      exact ⟨b1,by linarith⟩
  refine ⟨fun l hl => (key l hl).1,?_⟩
  have s1 := corG_sum_log n hn Ls
  have s2 := corG_sum_log n' hn' Ls
  have hN16 : (16 : ℝ) ≤ h.N := by exact_mod_cast Nat.le_of_dvd hN0 h16
  have het' : (e : ℝ) + 1 ≤ t := by exact_mod_cast Nat.succ_le_of_lt het
  calc
    _ ≤ ∑ l ∈ Ls, Real.log (l : ℕ) *
        (2 * (padicValInt l n : ℝ) + 2 * (padicValInt l n' : ℝ)) :=
        Finset.sum_le_sum fun l hl => mul_le_mul_of_nonneg_left (key l hl).2 (Real.log_natCast_nonneg _)
    _ = 2 * ∑ l ∈ Ls, Real.log (l : ℕ) * (padicValInt l n : ℝ) +
        2 * ∑ l ∈ Ls, Real.log (l : ℕ) * (padicValInt l n' : ℝ) := by
        rw [Finset.mul_sum,Finset.mul_sum,← Finset.sum_add_distrib]
        exact Finset.sum_congr rfl fun l _ => by ring
    _ ≤ (2 * (c₅ : ℝ) * (Real.log r₁ + Real.log r₂)) * (h.N : ℝ) *
        ((h.N : ℝ) * ((e : ℝ) + 1)) ^ A := by nlinarith
    _ ≤ ((h.N : ℝ) * (t : ℝ)) ^ (k + 1 + A) :=
        absorb _ _ _ _ k A hk.le hN16 (Nat.cast_nonneg e) het'

end
end RHGalois40

rh_scan UpperTheory.V.U3.countI limit 2000
rh_scan RHGalois40.direct_countI limit 2000
rh_prune RHGalois40.direct_countI as RH40CountIPruned
#print axioms RHGalois40.whole_prime
#print axioms RHGalois40.direct_countI

open UpperTheory.V.Z.J UpperTheory.V.U3 in
example (hNum : NumberU3U_s) (hOne : OneCharU_s) : CountI := by
  first | (rh_reduce 2 using [RHGalois40.direct_countI]; done)
        | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact RHGalois40.direct_countI hNum hOne
