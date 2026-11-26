import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.RingEquivalences.OrderOfOneAddPrimePowZmodPrimePow
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.NumThree
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 13 RUN43, 26 Nov 2026 — SOURCE-MATCHED / PREPARED / NOT COMPILED.
Actual caller propagation of RUN42 ad6e9dab (cofinal Sha). One exact
canonical budget now replaces the three separate SFew, SCount, SSha
inputs at NumThree.sNum and lemmaK_of_steps' final consumer.
For each fixed L', l, c, k from SLayer, require for every N ONE
canonical cyclotomic level nu>=N with compatible gamma,g and finite
EqHom of cardinal <= T1*T2*l^X, with T1,T2,X exactly as in native
NumThree. Retain E=k+1, TopRoot, complex-place and root-order bounds.
No separate choices of layers for hFew and hCount. The original proof
supplies this budget by taking nu=max(c,N), LayEx at that level,
then hFew and hCount on the identical F, zeta, gamma and Lay.
Exact cancellation of positive (l^nu)^r is the original native step;
not claimed novel. The source's entire logarithmic descent, STors,
SLayer, ClInj and SFinal are unchanged. No new bound is proved.
The canonical interface also permits a different joint proof without
the separate universal SFew and SCount. Separate cofinal sets (even
and odd levels) can be disjoint, so no independent-witness shortcut.
Original selected graph: VWin -> LemmaK -> lemmaK_of_steps -> SNum
-> SFew,SCount,SSha,SLayer,STors; SSha -> LayEx,ClInj.
Candidate: same final consumer -> sNum_cofinal43 -> CanonicalBudget43,
ClInj,SLayer,STors -> same native numerical descent and RUN42
good_of/injection. The original adapter preserves original fallback;
new interface is conditional, does not retire SFew/SCount globally.
Keep original graph and all type/value/constructor roles and axioms;
no new native ledger. Cache by pin/toolchain, L', l,c,k, host,
nu,gamma,g, coefficient, B and local context; reverse invalidation
at sNum/lemmaK; fallback to original upon replay failure.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Paths under src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClassCounting/:
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2; LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10;
RingEquivalences/OrderOfOneAddPrimePowZmodPrimePow.lean 1461d8636ef74a1ad316dd7a1b81102065d7ac69.
Prior RUN42 blob 65c60d883c8892e751ed258ab286df3557b31c3d, copied conditional proof under fresh names.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (including mandatory pipeline),
SWARM, HANDOFF, AGENTS, research state/log/protocol/continuity openings and
peer commits 6615a312, edb25260, ce4476bd, 31ac8a222 (title), cd8a9fa9 (title)
consulted; not exhaustive archive review. No URT used.
Executed 12 fail-on-error V8 checks: NumThree pin; Steps pin; Sha pin; actual budget block; actual hSha single caller; native supplier header; new caller only direct budget; byte-for-byte reverse of source body; actual previous conditional proof retained; original exact positive-factor cancellation preserved; actual final consumer; disjoint cofinal control.
Executed 101 exact disjoint-cofinal-set controls, N=0..100:
a=N+N%2, b=N+1-N%2; a>=N,b>=N,a even,b odd,a!=b.
These are logic and source checks, not class-group tests.
Initial NumThree lookup under RingEquivalences returned 404; corrected.
Local lean/lake/elan absent; git DNS failure. Actual published CI
status JSON 45577239749 and 45576756833 read, pass for BASELINE only.
New overlay not compiled or queued; no new native closures.
RESUME HERE: kernel-check RUN42/43 in existing pinned warmed runner;
if errors preserve original and repair. Then prove CanonicalBudget43
on same canonical layers (or directly bound Sha), not more constants.
HANDOFF TO arithmetic, kernel, integration, audit. RH OPEN.
-/
noncomputable section
open NumberField NumberField.InfinitePlace IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Base
open UpperTheory.V.ZK

namespace PositivityTheory.QuaternionShaBounds
def CofinalBound43 (L Ω : Type) [Field L] [NumberField L] [Field Ω]
    [Algebra L Ω] [IsAlgClosure L Ω] (l c E B : ℕ) [Fact l.Prime] : Prop :=
  ∀ N : ℕ, ∃ ν : ℕ, N ≤ ν ∧
    ∃ (γ : Kum.Fn L Ω l ν ≃ₐ[L] Kum.Fn L Ω l ν) (g : G L Ω),
      IsLift γ.toRingEquiv g.toRingEquiv ∧
      ((Kum.cycR L Ω l ν g : (ZMod (l ^ ν))ˣ) : ZMod (l ^ ν)) = 1 + (l : ZMod (l ^ ν)) ^ c ∧
      Finite (ZK.EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ∧
      Nat.card (ZK.EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ≤ B
end PositivityTheory.QuaternionShaBounds

namespace PositivityTheory.QuaternionShaBounds.ShaAssumptions
variable {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] {l : ℕ} [Fact l.Prime]
theorem card_le43 (hCl : ClInj) (c E B ν : ℕ) (h2ν : 2 ≤ ν)
    (γ : Kum.Fn L Ω l ν ≃ₐ[L] Kum.Fn L Ω l ν) (g : G L Ω)
    (hlift : IsLift γ.toRingEquiv g.toRingEquiv)
    (hcyc : ((Kum.cycR L Ω l ν g : (ZMod (l ^ ν))ˣ) : ZMod (l ^ ν)) = 1 + (l : ZMod (l ^ ν)) ^ c)
    (hfin : Finite (ZK.EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)))
    (hcard : Nat.card (ZK.EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ≤ B)
    (T : Finset (Kum.Uinf L Ω l → QZ l))
    (hT : ∀ φ ∈ T, Good (L := L) (Ω := Ω) E ν φ) : T.card ≤ B := by
  have hl0 : l ≠ 0 := (Fact.out : l.Prime).ne_zero
  obtain ⟨f, hf⟩ := hCl L Ω l c ν E (Kum.Fn L Ω l ν) γ g hlift hcyc
  have hpe := (Kum.pullEq L Ω (Kum.Fn L Ω l ν) _ (Kum.galOf_Fn ν).ge l ℤ_[l] (QZ l) (qzG L Ω l (E : ℤ)) hl0
    (Kum.galOf_Fn ν).le (Or.inl ((Kum.fnCyc L Ω l ν).2.2 h2ν))).1
  have hinj := (Kum.pullMem L Ω (Kum.Fn L Ω l ν) _ (Kum.galOf_Fn ν).ge l ℤ_[l] (QZ l) hl0).2
    (Kum.galOf_Fn ν).le
  have hpick : ∀ φ : T, ∃ θ : {θ : Kum.ClEq (Kum.Fn L Ω l ν) l (qzG L Ω l (E : ℤ)) //
      ∀ x, (l : ℤ_[l]) ^ ν • θ.1 x = 0},
      Kum.restr ℤ_[l] (QZ l) (cycU_le_levU l ⊤ ν)
        (Kum.clPull (Kum.Fn L Ω l ν) (Kum.galOf_Fn ν).ge ℤ_[l] (QZ l) θ.1.1) = φ.1 := by
    intro φ
    obtain ⟨ψ, hψ, hψφ, hψt⟩ := hT φ.1 φ.2
    have hm := hψ
    rw [← hpe] at hm
    obtain ⟨θ, hθ, rfl⟩ := hm
    refine ⟨⟨⟨θ, hθ⟩, fun x => ?_⟩, hψφ⟩
    have h0 : Kum.clPull (Kum.Fn L Ω l ν) (Kum.galOf_Fn ν).ge ℤ_[l] (QZ l) ((l : ℤ_[l]) ^ ν • θ) =
        Kum.clPull (Kum.Fn L Ω l ν) (Kum.galOf_Fn ν).ge ℤ_[l] (QZ l) 0 := by
      rw [map_smul, hψt, map_zero]
    exact congrFun (hinj h0) x
  choose pick hpick using hpick
  have hinj2 : Function.Injective (fun φ : T => f (pick φ)) := by
    intro a b hab
    have h1 : pick a = pick b := hf hab
    apply Subtype.ext
    rw [← hpick a, ← hpick b, h1]
  calc T.card = Nat.card T := (Nat.card_eq_finsetCard T).symm
    _ ≤ Nat.card (ZK.EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) := Nat.card_le_card_of_injective _ hinj2
    _ ≤ B := hcard
end PositivityTheory.QuaternionShaBounds.ShaAssumptions

theorem PositivityTheory.QuaternionShaBounds.shaCofinal43 (hCl : PositivityTheory.QuaternionShaBounds.ClInj)
    (L : Type) [Field L] [NumberField L] (l c E B : ℕ) [Fact l.Prime]
    (hTop : TopRoot l c L) (hE : 1 ≤ E)
    (hB : PositivityTheory.QuaternionShaBounds.CofinalBound43 L (AlgebraicClosure L) l c E B) :
    ∃ s : ℕ, shaInv L l E = s ∧ l ^ s ≤ B := by
  let Ω := AlgebraicClosure L
  obtain ⟨D⟩ := ldata_nonempty (F := L) (Ω := Ω) l
  have he : (E : ℤ) ≠ 0 := by exact_mod_cast (show E ≠ 0 by omega)
  have hinj := Kum.resInfInj L Ω l D (E : ℤ) he (PositivityTheory.QuaternionShaBounds.ShaAssumptions.procyc_of_top L Ω l c hTop)
  have hW : (Formalism.GaloisCohomology.Sha D (E : ℤ)).map (Kum.resInf D (E : ℤ)) ≤
      Kum.EqHom l (Kum.Uinf L Ω l) (qzG L Ω l (E : ℤ)) :=
    Kum.resInfMem L Ω l D (E : ℤ)
  have key : ∀ T : Finset (Kum.Uinf L Ω l → QZ l),
      (↑T : Set (Kum.Uinf L Ω l → QZ l)) ⊆ ((Formalism.GaloisCohomology.Sha D (E : ℤ)).map (Kum.resInf D (E : ℤ)) : Set _) →
      T.card ≤ B := by
    intro T hT
    have ha : ∀ φ : T, ∃ n, ∀ ν, n ≤ ν → PositivityTheory.QuaternionShaBounds.ShaAssumptions.Good (L := L) (Ω := Ω) E ν φ.1 :=
      fun φ => PositivityTheory.QuaternionShaBounds.ShaAssumptions.good_of E φ.1 (hW (hT φ.2))
    choose N hN using ha
    obtain ⟨ν, hν, γ, g, hlift, hcyc, hfin, hcard⟩ :=
      hB (max (max c 2) (Finset.univ.sup N))
    have h2ν : 2 ≤ ν := (le_max_right c 2).trans ((le_max_left _ _).trans hν)
    exact PositivityTheory.QuaternionShaBounds.ShaAssumptions.card_le43 hCl c E B ν h2ν
      γ g hlift hcyc hfin hcard T
      fun φ hφ => hN ⟨φ, hφ⟩ _ ((Finset.le_sup (Finset.mem_univ _)).trans ((le_max_right _ _).trans hν))
  set W := (Formalism.GaloisCohomology.Sha D (E : ℤ)).map (Kum.resInf D (E : ℤ)) with hWdef
  have hfin : (W : Set (Kum.Uinf L Ω l → QZ l)).Finite := by
    by_contra hinf
    obtain ⟨T, hT, hcard⟩ := Set.Infinite.exists_subset_card_eq hinf (B + 1)
    have := key T hT
    omega
  have : Finite W := hfin.to_subtype
  obtain ⟨k, hk, hcard⟩ := Kum.lenOfCard l W
  refine ⟨k, ?_, ?_⟩
  · rw [← shaLen_eq_shaInv D, Formalism.GaloisCohomology.shaLen, ← hk]
    exact (Submodule.equivMapOfInjective _ hinj _).length_eq
  · rw [← hcard]
    have h1 := key hfin.toFinset (by simp)
    rwa [← Set.ncard_eq_toFinset_card _ hfin, ← Nat.card_coe_set_eq] at h1

namespace RHStructure43
open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK

def CanonicalBudget43 : Prop :=
  ∀ (L' : Type) [Field L'] [NumberField L'], IsTotallyComplex L' →
    ∀ (l c k : ℕ) [Fact l.Prime], TopRoot l c L' →
      2 * k + 3 < l ^ c → 2 * k + 3 < nrComplexPlaces L' →
      PositivityTheory.QuaternionShaBounds.CofinalBound43 L' (AlgebraicClosure L') l c (k + 1)
        (tc L' (4 * k + 10) (2 * k + 3) * tc L' (4 * k + 10) (2 * k + 2) *
          l ^ ((2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) + (k + 1).factorization l) * gens L' +
            c + (k + 1).factorization l))

theorem canonical_of_few_count43
    (hLayEx : PositivityTheory.QuaternionShaBounds.LayEx)
    (hFew : SFew) (hCount : SCount) : CanonicalBudget43 := by
  intro L' _ _ hTC' l c k _ hTop hlc hcp
  have hB : ∀ (F : Type) [Field F] [NumberField F] [Algebra L' F] (ν : ℕ) (ζ : (𝓞 F)ˣ)
      (γ : Gal(F/L')), Lay l c ν ζ γ →
      Finite ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) ∧
        Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) ≤
          tc L' (4 * k + 10) (2 * k + 3) * tc L' (4 * k + 10) (2 * k + 2) *
            l ^ ((2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) + (k + 1).factorization l) * gens L' +
              c + (k + 1).factorization l) := by
    intro F i5 i6 i7 ν ζ γ hLay
    have hfew := hFew L' F hTC' l c ν k ζ γ hLay (by omega) (by omega)
    have hcnt := hCount L' F hTC' l c ν (k + 1) _ _ ζ γ hLay (by omega) hfew
    refine ⟨hcnt.1, ?_⟩
    have hP : 0 < (l ^ ν) ^ InfinitePlace.nrComplexPlaces L' := pow_pos (pow_pos (by omega) _) _
    have h2 := hcnt.2
    apply le_of_mul_le_mul_left _ hP
    calc _ = Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) *
          (l ^ ν) ^ InfinitePlace.nrComplexPlaces L' := mul_comm _ _
      _ ≤ _ := h2
      _ = _ := by ring
  intro N
  let ν := max c N
  obtain ⟨ζ, γ, hLay, g, hlift, hcyc⟩ :=
    hLayEx L' (AlgebraicClosure L') l c ν hTop (le_max_left _ _)
  obtain ⟨hfin, hcard⟩ := hB (Kum.Fn L' (AlgebraicClosure L') l ν) ν ζ γ hLay
  exact ⟨ν, le_max_right _ _, γ, g, hlift, hcyc, hfin, hcard⟩

private theorem num_three (C u Y t : ℝ) (hu : 2 ≤ u) (hY : 1 / 2 ≤ Y) (P : ℝ) (hP : P ≤ u ^ 9 * Y)
    (ht : t ≤ 2 * Real.exp (u ^ C * Y) + P) : t ≤ Real.exp (u ^ (max C 9 + 2) * Y) := by
  have hu1 : (1:ℝ) ≤ u := by linarith
  have hu0 : (0:ℝ) < u := by linarith
  have hY0 : (0:ℝ) < Y := by linarith
  have hA1 : u ^ C ≤ u ^ (max C 9) := Real.rpow_le_rpow_of_exponent_le hu1 (le_max_left _ _)
  have hA2 : u ^ (9:ℕ) ≤ u ^ (max C 9) := by
    rw [← Real.rpow_natCast]
    exact Real.rpow_le_rpow_of_exponent_le hu1 (by push_cast; exact le_max_right _ _)
  have h2 : u ^ (max C 9 + 2) = u ^ (max C 9) * u ^ (2:ℕ) := by
    rw [Real.rpow_add hu0, Real.rpow_two]
  have hu9 : (256:ℝ) ≤ u ^ (9:ℕ) := by
    calc (256:ℝ) ≤ 2 ^ 9 := by norm_num
      _ ≤ u ^ 9 := pow_le_pow_left₀ (by norm_num) hu 9
  have hAC : u ^ C * Y ≤ u ^ (max C 9) * Y := mul_le_mul_of_nonneg_right hA1 hY0.le
  have hPA : P ≤ u ^ (max C 9) * Y := le_trans hP (mul_le_mul_of_nonneg_right hA2 hY0.le)
  have hA9 : u ^ (9:ℕ) * Y ≤ u ^ (max C 9) * Y := mul_le_mul_of_nonneg_right hA2 hY0.le
  have hApos : 1 ≤ u ^ (max C 9) * Y := by nlinarith
  have hu2 : (4:ℝ) ≤ u ^ (2:ℕ) := by nlinarith
  have h4A : 4 * (u ^ (max C 9) * Y) ≤ u ^ (max C 9 + 2) * Y := by
    rw [h2]
    have : u ^ (max C 9) * u ^ (2:ℕ) * Y = u ^ (2:ℕ) * (u ^ (max C 9) * Y) := by ring
    rw [this]
    exact mul_le_mul_of_nonneg_right hu2 (by linarith)
  have e1 : Real.exp (u ^ C * Y) ≤ Real.exp (u ^ (max C 9) * Y) := Real.exp_le_exp.mpr hAC
  have e3 : 3 * (u ^ (max C 9) * Y) + 1 ≤ Real.exp (3 * (u ^ (max C 9) * Y)) := by
    have := Real.add_one_le_exp (3 * (u ^ (max C 9) * Y))
    linarith
  have e4 : Real.exp (4 * (u ^ (max C 9) * Y)) =
      Real.exp (u ^ (max C 9) * Y) * Real.exp (3 * (u ^ (max C 9) * Y)) := by
    rw [← Real.exp_add]
    ring_nf
  have eA := Real.add_one_le_exp (u ^ (max C 9) * Y)
  have ep := Real.exp_pos (u ^ (max C 9) * Y)
  have e5 : Real.exp (u ^ (max C 9) * Y) * (3 * (u ^ (max C 9) * Y) + 1) ≤
      Real.exp (u ^ (max C 9) * Y) * Real.exp (3 * (u ^ (max C 9) * Y)) :=
    mul_le_mul_of_nonneg_left e3 ep.le
  calc t ≤ 2 * Real.exp (u ^ (max C 9) * Y) + u ^ (max C 9) * Y := by linarith
    _ ≤ Real.exp (4 * (u ^ (max C 9) * Y)) := by rw [e4]; nlinarith
    _ ≤ Real.exp (u ^ (max C 9 + 2) * Y) := Real.exp_le_exp.mpr h4A

private theorem num_poly (u Y t b g c v : ℝ) (hu : 2 ≤ u) (hY : 1 / 2 ≤ Y) (ht : t ≤ u)
    (hb0 : 0 ≤ b) (hb : b ≤ u + 2 * u ^ 2) (hg0 : 0 ≤ g) (hg : g ≤ u + 2 * u * Y + 2) (hc0 : 0 ≤ c) (hc : c ≤ u)
    (hv0 : 0 ≤ v) (hv : v ≤ u) : ((b + v) * g + c + v) * t ≤ u ^ 9 * Y := by
  have hu0 : (0:ℝ) ≤ u := by linarith
  have hY0 : (0:ℝ) < Y := by linarith
  have huY : 1 ≤ u * Y := by nlinarith
  have hu2 : 2 * u ≤ u ^ 2 := by nlinarith
  have hbv : b + v ≤ 3 * u ^ 2 := by nlinarith
  have hg' : g ≤ 6 * (u * Y) := by nlinarith
  have h1 : (b + v) * g ≤ 3 * u ^ 2 * (6 * (u * Y)) :=
    mul_le_mul hbv hg' hg0 (by positivity)
  have h4 : (4:ℝ) ≤ u ^ 2 := by nlinarith
  have h4' : 4 * (u * Y) ≤ u ^ 2 * (u * Y) := mul_le_mul_of_nonneg_right h4 (by positivity)
  have hcv : c + v ≤ 4 * (u * Y) := by nlinarith
  have hS0 : 0 ≤ (b + v) * g + c + v := by positivity
  have hsum : (b + v) * g + c + v ≤ 19 * (u ^ 3 * Y) := by nlinarith
  have hst : ((b + v) * g + c + v) * t ≤ ((b + v) * g + c + v) * u :=
    mul_le_mul_of_nonneg_left ht hS0
  have hsu : ((b + v) * g + c + v) * u ≤ 19 * (u ^ 3 * Y) * u :=
    mul_le_mul_of_nonneg_right hsum hu0
  have h5 : (32:ℝ) ≤ u ^ 5 := by
    calc (32:ℝ) = 2 ^ 5 := by norm_num
      _ ≤ u ^ 5 := pow_le_pow_left₀ (by norm_num) hu 5
  have h4Y : 0 ≤ u ^ 4 * Y := by positivity
  have hfin : 19 * (u ^ 3 * Y) * u ≤ u ^ 9 * Y := by
    have e : 19 * (u ^ 3 * Y) * u = 19 * (u ^ 4 * Y) := by ring
    have e' : u ^ 9 * Y = u ^ 5 * (u ^ 4 * Y) := by ring
    rw [e, e']
    exact mul_le_mul_of_nonneg_right (by linarith) h4Y
  linarith

set_option maxHeartbeats 800000 in
private theorem num_down (C : ℝ) (hC : 0 ≤ C) (E n D n' D' d w : ℕ) (hE : 1 ≤ E) (hn : 1 ≤ n) (hD : 1 ≤ D)
    (hD' : 1 ≤ D') (h1 : n' = d * n) (hn' : 1 ≤ n') (h2 : d ≤ (n + 1) * (4 * E + 4)) (hw : w ≤ 2 * n')
    (h3 : D' ≤ D ^ d * w ^ n') : kBound C E n' D' ≤ kBound (5 * C + 11) E n D := by
  have hw1 : 1 ≤ w := by
    rcases Nat.eq_zero_or_pos w with h | h
    · subst h
      rw [zero_pow (by omega), mul_zero] at h3
      omega
    · exact h
  unfold kBound
  apply Real.exp_le_exp.mpr
  have hE' : (1:ℝ) ≤ E := by exact_mod_cast hE
  have hn1 : (1:ℝ) ≤ n := by exact_mod_cast hn
  have hD1 : (1:ℝ) ≤ D := by exact_mod_cast hD
  have hD'1 : (1:ℝ) ≤ D' := by exact_mod_cast hD'
  have hn'1 : (1:ℝ) ≤ n' := by exact_mod_cast hn'
  have hw1R : (1:ℝ) ≤ w := by exact_mod_cast hw1
  have h1R : (n':ℝ) = d * n := by exact_mod_cast h1
  have h2R : (d:ℝ) ≤ (n + 1) * (4 * E + 4) := by exact_mod_cast h2
  have hwR : (w:ℝ) ≤ 2 * n' := by exact_mod_cast hw
  have h3R : (D':ℝ) ≤ D ^ d * w ^ n' := by exact_mod_cast h3
  have hd0 : (0:ℝ) ≤ d := Nat.cast_nonneg d
  have hd16 : (d:ℝ) ≤ 16 * E * n := by
    have : ((n:ℝ) + 1) * (4 * E + 4) ≤ (2 * n) * (8 * E) :=
      mul_le_mul (by linarith) (by linarith) (by positivity) (by positivity)
    nlinarith
  have hn'16 : (n':ℝ) ≤ 16 * E * n ^ 2 := by
    rw [h1R]
    have := mul_le_mul_of_nonneg_right hd16 (by linarith : (0:ℝ) ≤ n)
    nlinarith
  set x : ℝ := 2 * E * n with hx
  have hx2 : 2 ≤ x := by nlinarith
  have hx0 : 0 < x := by linarith
  have hEn : (E:ℝ) * n ^ 2 ≤ E ^ 2 * n ^ 2 := by
    have : (E:ℝ) ≤ E ^ 2 := by nlinarith
    exact mul_le_mul_of_nonneg_right this (by positivity)
  have hn'x : (n':ℝ) ≤ 4 * x ^ 2 := by
    have : x ^ 2 = 4 * E ^ 2 * n ^ 2 := by rw [hx]; ring
    nlinarith
  have hd8 : (d:ℝ) ≤ 8 * x := by rw [hx]; linarith
  have hx3 : 8 ≤ x ^ 3 := by nlinarith
  have hbase : 2 * (E:ℝ) * n' ≤ x ^ 5 := by
    have a1 : 2 * (E:ℝ) * n' ≤ 2 * E * (16 * E * n ^ 2) :=
      mul_le_mul_of_nonneg_left hn'16 (by positivity)
    have a2 : 2 * (E:ℝ) * (16 * E * n ^ 2) = 8 * x ^ 2 := by rw [hx]; ring
    have a3 : 8 * x ^ 2 ≤ x ^ 3 * x ^ 2 := mul_le_mul_of_nonneg_right hx3 (by positivity)
    have a4 : x ^ 3 * x ^ 2 = x ^ 5 := by ring
    linarith
  have hbase0 : (0:ℝ) ≤ 2 * E * n' := by positivity
  have hpowC : (2 * (E:ℝ) * n') ^ C ≤ (x ^ 5) ^ C := Real.rpow_le_rpow hbase0 hbase hC
  have hx5C : (x ^ 5) ^ C = x ^ (5 * C) := by
    rw [← Real.rpow_natCast, ← Real.rpow_mul hx0.le]
    norm_num
  have hxadd : x ^ (5 * C + 11) = x ^ (5 * C) * x ^ (11:ℕ) := by
    rw [Real.rpow_add hx0, ← Real.rpow_natCast]
    norm_num
  have hL2 : (0.6931471803:ℝ) < Real.log 2 := Real.log_two_gt_d9
  have hLD : Real.log 2 ≤ Real.log (2 * (D:ℝ)) := Real.log_le_log (by norm_num) (by linarith)
  have hlogD : Real.log D ≤ Real.log (2 * (D:ℝ)) := Real.log_le_log (by linarith) (by linarith)
  have hlogD0 : 0 ≤ Real.log (D:ℝ) := Real.log_nonneg hD1
  have hlogw0 : 0 ≤ Real.log (w:ℝ) := Real.log_nonneg hw1R
  have hlogw : Real.log (w:ℝ) ≤ 8 * x ^ 2 := by
    have := Real.log_le_sub_one_of_pos (by linarith : (0:ℝ) < w)
    linarith
  have hlogD' : Real.log (2 * (D':ℝ)) ≤ Real.log 2 + d * Real.log D + n' * Real.log w := by
    have hDd : (0:ℝ) < (D:ℝ) ^ d := pow_pos (by linarith) _
    have hwn : (0:ℝ) < (w:ℝ) ^ n' := pow_pos (by linarith) _
    calc Real.log (2 * (D':ℝ)) ≤ Real.log (2 * ((D:ℝ) ^ d * (w:ℝ) ^ n')) :=
          Real.log_le_log (by linarith) (by linarith)
      _ = Real.log 2 + d * Real.log D + n' * Real.log w := by
          rw [Real.log_mul (by norm_num) (by positivity), Real.log_mul hDd.ne' hwn.ne',
            Real.log_pow, Real.log_pow]
          ring
  have hlogD'0 : 0 ≤ Real.log (2 * (D':ℝ)) := Real.log_nonneg (by linarith)
  set LD := Real.log (2 * (D:ℝ)) with hLDdef
  have t1 : (d:ℝ) * Real.log D ≤ 8 * x * LD :=
    mul_le_mul hd8 hlogD hlogD0 (by positivity)
  have t2 : (n':ℝ) * Real.log w ≤ 4 * x ^ 2 * (8 * x ^ 2) :=
    mul_le_mul hn'x hlogw hlogw0 (by positivity)
  have t2' : 4 * x ^ 2 * (8 * x ^ 2) = 32 * x ^ 4 := by ring
  have hLD1 : 1 ≤ 2 * LD := by linarith
  have hx40 : 0 ≤ 32 * x ^ 4 := by positivity
  have t3 : 32 * x ^ 4 * 1 ≤ 32 * x ^ 4 * (2 * LD) := mul_le_mul_of_nonneg_left hLD1 hx40
  have hx4 : 1 ≤ x ^ 4 := by nlinarith
  have hxx4 : x ≤ x ^ 4 := by nlinarith
  have hx7 : 128 ≤ x ^ 7 := by
    calc (128:ℝ) = 2 ^ 7 := by norm_num
      _ ≤ x ^ 7 := pow_le_pow_left₀ (by norm_num) hx2 7
  have hLD0 : 0 ≤ LD := by linarith
  have s1 : 1 * LD ≤ x ^ 4 * LD := mul_le_mul_of_nonneg_right hx4 hLD0
  have s2 : x * LD ≤ x ^ 4 * LD := mul_le_mul_of_nonneg_right hxx4 hLD0
  have tsum : Real.log (2 * (D':ℝ)) ≤ 73 * (x ^ 4 * LD) := by
    have e1 : 8 * x * LD = 8 * (x * LD) := by ring
    have e2 : 32 * x ^ 4 * (2 * LD) = 64 * (x ^ 4 * LD) := by ring
    linarith
  have tfin : Real.log (2 * (D':ℝ)) ≤ x ^ (11:ℕ) * LD := by
    have e : x ^ (11:ℕ) * LD = x ^ 7 * (x ^ 4 * LD) := by ring
    have h0 : 0 ≤ x ^ 4 * LD := by positivity
    have : 73 * (x ^ 4 * LD) ≤ x ^ 7 * (x ^ 4 * LD) :=
      mul_le_mul_of_nonneg_right (by linarith) h0
    rw [e]
    linarith
  rw [hxadd, ← hx5C]
  calc (2 * (E:ℝ) * n') ^ C * Real.log (2 * (D':ℝ)) ≤ (x ^ 5) ^ C * (x ^ (11:ℕ) * LD) :=
        mul_le_mul hpowC tfin hlogD'0 (by positivity)
    _ = (x ^ 5) ^ C * x ^ (11:ℕ) * LD := by ring

private theorem gens_le (L : Type) [Field L] [NumberField L] :
    (gens L : ℝ) ≤ 2 * (Module.finrank ℚ L : ℝ) +
      2 * (2 * (Module.finrank ℚ L : ℝ)) * Real.log (2 * ((discr L).natAbs : ℝ)) + 2 := by
  have key := K.numGens 2 L (classNumber L) (by apply Nat.le_mul_of_pos_right; positivity)
  have key0 := K.numGens 2 L 0 (Nat.zero_le _)
  simp only [Nat.cast_zero, Real.log_zero, Nat.cast_ofNat] at key key0
  have hl2 : 0 < Real.log 2 := Real.log_pos (by norm_num)
  have hnD : 0 ≤ 4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) := by
    nlinarith
  have hk : (Nat.log 2 (classNumber L) : ℝ) ≤
      4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) := by
    rcases Nat.eq_zero_or_pos (classNumber L) with h0 | hpos
    · rw [h0, Nat.log_zero_right, Nat.cast_zero]
      exact hnD
    · have hp : 2 ^ Nat.log 2 (classNumber L) ≤ classNumber L := Nat.pow_log_le_self 2 hpos.ne'
      have hpR : (2:ℝ) ^ Nat.log 2 (classNumber L) ≤ (classNumber L : ℝ) := by exact_mod_cast hp
      have hlog : (Nat.log 2 (classNumber L) : ℝ) * Real.log 2 ≤ Real.log (classNumber L) := by
        rw [← Real.log_pow]
        exact Real.log_le_log (by positivity) hpR
      nlinarith
  show ((2 * Module.finrank ℚ L + Nat.log 2 (classNumber L) + 2 : ℕ) : ℝ) ≤ _
  push_cast
  linarith

set_option maxHeartbeats 800000 in
theorem sNum_cofinal43
    (hCl : PositivityTheory.QuaternionShaBounds.ClInj)
    (hBudget : CanonicalBudget43) (hLayer : SLayer) (hTors : STors) : ∃ C, ShaK C := by
  obtain ⟨C0, hC0⟩ := hTors
  refine ⟨5 * (max C0 9 + 2) + 11, ?_⟩
  unfold UpperTheory.V.ZK.ShaK
  intro l hl L i1 i2 hTC hMu E hE
  obtain ⟨k, rfl⟩ : ∃ k, E = k + 1 := ⟨E - 1, by omega⟩
  obtain ⟨L', i3, i4, c, d, hTC', hTop, hlc, hcp, hdeg, hd, hlc2, hdisc, hsha⟩ :=
    hLayer L l (k + 1) hMu hE
  have hl1 : 1 < l := hl.out.one_lt
  have hB := hBudget L' hTC' l c k hTop hlc hcp
  obtain ⟨s, hs, hlsB⟩ := PositivityTheory.QuaternionShaBounds.shaCofinal43 hCl L' l c (k + 1) _ hTop hE hB
  have hne : LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ) ≠ ⊤ := by
    intro htop
    rw [htop, hs] at hsha
    exact ENat.coe_ne_top s (top_le_iff.mp hsha)
  refine ⟨(LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat, (ENat.coe_toNat hne).symm, ?_⟩
  have hs0 : (LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat ≤ s := by
    have h := hsha
    rw [← ENat.coe_toNat hne, hs] at h
    exact_mod_cast h
  set s0 := (LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat with hs0def
  set T1 := tc L' (4 * k + 10) (2 * k + 3) with hT1
  set T2 := tc L' (4 * k + 10) (2 * k + 2) with hT2
  set bN := 2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) with hbN
  set fN := (k + 1).factorization l with hfN
  set g := gens L' with hg
  set X := (bN + fN) * g + c + fN with hX
  have hlsB' : l ^ s ≤ T1 * T2 * l ^ X := hlsB
  have hBpos : 1 ≤ T1 * T2 * l ^ X := le_trans (Nat.one_le_pow _ _ (by omega)) hlsB'
  have hT1ne : T1 ≠ 0 := by
    intro h
    rw [h] at hBpos
    simp at hBpos
  have hT2ne : T2 ≠ 0 := by
    intro h
    rw [h] at hBpos
    simp at hBpos
  have hlR : (1:ℝ) < l := by exact_mod_cast hl1
  have hl0R : (0:ℝ) < l := by linarith
  have hlog0 : 0 < Real.log (l:ℝ) := Real.log_pos hlR
  have hlogs : (s:ℝ) * Real.log l ≤ Real.log T1 + Real.log T2 + (X:ℝ) * Real.log l := by
    have hT1R : (0:ℝ) < T1 := by exact_mod_cast Nat.pos_of_ne_zero hT1ne
    have hT2R : (0:ℝ) < T2 := by exact_mod_cast Nat.pos_of_ne_zero hT2ne
    calc (s:ℝ) * Real.log l = Real.log ((l:ℝ) ^ s) := by rw [Real.log_pow]
      _ ≤ Real.log ((T1:ℝ) * T2 * (l:ℝ) ^ X) := by
          apply Real.log_le_log (pow_pos hl0R _)
          exact_mod_cast hlsB'
      _ = Real.log T1 + Real.log T2 + (X:ℝ) * Real.log l := by
          rw [Real.log_mul (by positivity) (pow_pos hl0R _).ne', Real.log_mul hT1R.ne' hT2R.ne',
            Real.log_pow]
  have hT1b := hC0 L' hTC' (k + 1) hE (2 * k + 3) (by omega)
  have hT2b := hC0 L' hTC' (k + 1) hE (2 * k + 2) (by omega)
  rw [show 4 * (k + 1) + 6 = 4 * k + 10 by ring] at hT1b hT2b
  unfold kBound at hT1b hT2b
  have hcard := InfinitePlace.card_add_two_mul_card_eq_rank L'
  have hn'big : 2 * k + 4 ≤ Module.finrank ℚ L' := by omega
  have hc0 : c ≠ 0 := by
    intro h
    rw [h, pow_zero] at hlc
    omega
  have hcl : c < l ^ c := Nat.lt_pow_self hl1
  have hll : l ≤ l ^ c := Nat.le_self_pow hc0 l
  have hf : fN < k + 1 := Nat.factorization_lt l (by omega)
  have hDne := NumberField.discr_ne_zero L'
  have hD'1 : 1 ≤ (discr L').natAbs := Int.natAbs_pos.mpr hDne
  have hD'1R : (1:ℝ) ≤ ((discr L').natAbs : ℝ) := by exact_mod_cast hD'1
  have hgl := gens_le L'
  set n' : ℝ := (Module.finrank ℚ L' : ℝ) with hn'
  set Y := Real.log (2 * ((discr L').natAbs : ℝ)) with hY
  set u : ℝ := 2 * ((k + 1 : ℕ) : ℝ) * n' with hu
  have hkR : (0:ℝ) ≤ k := Nat.cast_nonneg k
  have hn'bigR : 2 * (k:ℝ) + 4 ≤ n' := by rw [hn']; exact_mod_cast hn'big
  have hk1 : ((k + 1 : ℕ) : ℝ) = k + 1 := by push_cast; ring
  have hu' : u = 2 * ((k:ℝ) + 1) * n' := by rw [hu, hk1]
  have hn'0 : (0:ℝ) ≤ n' := by linarith
  have hn'u : 2 * n' ≤ u := by
    rw [hu']
    have := mul_le_mul_of_nonneg_right (show (2:ℝ) ≤ 2 * ((k:ℝ) + 1) by linarith) hn'0
    linarith
  have hku : 2 * ((k:ℝ) + 1) ≤ u := by
    rw [hu']
    have := mul_le_mul_of_nonneg_left (show (1:ℝ) ≤ n' by linarith)
      (show (0:ℝ) ≤ 2 * ((k:ℝ) + 1) by positivity)
    linarith
  have hu2 : 2 ≤ u := by linarith
  have hL2 : (0.6931471803:ℝ) < Real.log 2 := Real.log_two_gt_d9
  have hY2 : Real.log 2 ≤ Y := Real.log_le_log (by norm_num) (by linarith)
  have hYh : 1 / 2 ≤ Y := by linarith
  have hcR : (c:ℝ) ≤ 2 * n' := by
    have : c ≤ 2 * Module.finrank ℚ L' := by omega
    rw [hn']; exact_mod_cast this
  have hlR2 : (l:ℝ) ≤ 2 * n' := by
    have : l ≤ 2 * Module.finrank ℚ L' := le_trans hll hlc2
    rw [hn']; exact_mod_cast this
  have hfR : (fN:ℝ) ≤ k + 1 := by
    have : fN ≤ k + 1 := hf.le
    exact_mod_cast this
  have htl : Real.log l ≤ u := by
    have := Real.log_le_sub_one_of_pos hl0R
    linarith
  have hbR : (bN:ℝ) = 2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) := by rw [hbN]; push_cast; ring
  have hb0 : (0:ℝ) ≤ bN := Nat.cast_nonneg _
  have hbb : (bN:ℝ) ≤ u + 2 * u ^ 2 := by
    rw [hbR]
    have a1 : (2 * (k:ℝ) + 3) * (c + (2 * k + 3)) ≤ n' * (3 * n') :=
      mul_le_mul (by linarith) (by linarith) (by positivity) (by linarith)
    have a2 : 2 * (k:ℝ) + 2 ≤ u := by linarith
    have a3 : n' * (3 * n') ≤ 2 * u ^ 2 := by
      have h4 : (2 * n') ^ 2 ≤ u ^ 2 := pow_le_pow_left₀ (by positivity) hn'u 2
      have e1 : (2 * n') ^ 2 = 4 * n' ^ 2 := by ring
      have e2 : n' * (3 * n') = 3 * n' ^ 2 := by ring
      have h5 : 0 ≤ n' ^ 2 := by positivity
      linarith
    linarith
  have hg0 : (0:ℝ) ≤ g := Nat.cast_nonneg _
  have hgg : (g:ℝ) ≤ u + 2 * u * Y + 2 := by
    have hY0 : 0 ≤ Y := by linarith
    have : 2 * (2 * n') * Y ≤ 2 * u * Y := by
      have := mul_le_mul_of_nonneg_right hn'u hY0
      linarith
    have hgl' : (g:ℝ) ≤ 2 * n' + 2 * (2 * n') * Y + 2 := hgl
    linarith
  have hc0R : (0:ℝ) ≤ c := Nat.cast_nonneg _
  have hcu : (c:ℝ) ≤ u := by linarith
  have hf0 : (0:ℝ) ≤ fN := Nat.cast_nonneg _
  have hfu : (fN:ℝ) ≤ u := by linarith
  have hP := num_poly u Y (Real.log l) bN g c fN hu2 hYh htl hb0 hbb hg0 hgg hc0R hcu hf0 hfu
  have hXR : (X:ℝ) = ((bN:ℝ) + fN) * g + c + fN := by rw [hX]; push_cast; ring
  have hP' : (X:ℝ) * Real.log l ≤ u ^ 9 * Y := by rw [hXR]; exact hP
  have ht : (s:ℝ) * Real.log l ≤ 2 * Real.exp (u ^ C0 * Y) + (X:ℝ) * Real.log l := by
    have e1 : Real.log (T1:ℝ) ≤ Real.exp (u ^ C0 * Y) := hT1b
    have e2 : Real.log (T2:ℝ) ≤ Real.exp (u ^ C0 * Y) := hT2b
    linarith
  have h3 := num_three C0 u Y ((s:ℝ) * Real.log l) hu2 hYh _ hP' ht
  have hs0R : (s0:ℝ) * Real.log l ≤ (s:ℝ) * Real.log l :=
    mul_le_mul_of_nonneg_right (by exact_mod_cast hs0) hlog0.le
  have hC : 0 ≤ max C0 9 + 2 := by
    have := le_max_right C0 9
    linarith
  have hn1 : 1 ≤ Module.finrank ℚ L := Module.finrank_pos
  have hD1 : 1 ≤ (discr L).natAbs := Int.natAbs_pos.mpr (NumberField.discr_ne_zero L)
  have hdown := num_down (max C0 9 + 2) hC (k + 1) (Module.finrank ℚ L) (discr L).natAbs
    (Module.finrank ℚ L') (discr L').natAbs d (l ^ c) hE hn1 hD1 hD'1 hdeg (by omega) hd hlc2 hdisc
  have hmid : Real.exp (u ^ (max C0 9 + 2) * Y) =
      kBound (max C0 9 + 2) (k + 1) (Module.finrank ℚ L') (discr L').natAbs := by
    unfold kBound
    rfl
  linarith

-- Native SNum signature recovered from original concrete suppliers.
theorem sNum_original43 : SNum := by
  intro hFew hCount hSha hLayer hTors
  have hBudget := canonical_of_few_count43 PositivityTheory.QuaternionShaBounds.LayEx_holds hFew hCount
  first
  | (rh_reduce 2 using [sNum_cofinal43, PositivityTheory.QuaternionShaBounds.ClInj_holds]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact sNum_cofinal43 PositivityTheory.QuaternionShaBounds.ClInj_holds hBudget hLayer hTors

-- Same final native consumer, but the canonical budget replaces SFew/SCount/SSha.
theorem lemmaK_of_cofinal43
    (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK)
    (hCl : PositivityTheory.QuaternionShaBounds.ClInj)
    (hBudget : CanonicalBudget43) (hLayer : SLayer) (hTors : STors)
    (hFinal : SFinal) : ∃ CK, LemmaK CK :=
  hFinal hP hF hT (sNum_cofinal43 hCl hBudget hLayer hTors)

end RHStructure43
rh_prune UpperTheory.V.ZK.sNum as RHSNumNative43Pruned
rh_scan UpperTheory.V.ZK.sNum limit 2000
rh_scan RHStructure43.sNum_cofinal43 limit 2000
rh_scan RHStructure43.lemmaK_of_cofinal43 limit 2000
#print axioms UpperTheory.V.ZK.sNum
#print axioms RHStructure43.sNum_cofinal43
#print axioms RHStructure43.sNum_original43
#print axioms RHStructure43.lemmaK_of_cofinal43
end
