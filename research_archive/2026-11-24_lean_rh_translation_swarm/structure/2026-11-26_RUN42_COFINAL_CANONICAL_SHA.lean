import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.RingEquivalences.OrderOfOneAddPrimePowZmodPrimePow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 13 RUN42, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Native ShaAsm_holds only needs a cardinal bound on an arbitrarily late
canonical cyclotomic layer and ONE compatible automorphism/lift there,
not all extensions F, all nu, all roots zeta, or all generators.
Lay is not needed at the reduced consumer: ClInj consumes the lift
and prescribed cyclotomic multiplier, not the Lay record.

Fix L,l,c,E,B, Omega=AlgebraicClosure L, K_nu=Kum.Fn L Omega l nu.
For every N assume there exist nu>=N and gamma,g with IsLift gamma g,
cycR_nu(g)=1+l^c, finite EqHom(gamma,(1+l^c)^E,l^nu) of cardinal <= B.
Then shaInv L l E is finite s and l^s<=B.
Proof: native good_of gives each image element phi a threshold N_phi
above which Good holds at EVERY nu. For finite T of image elements
choose nu>=max(c,2,max_{phi in T}N_phi) from the cofinal supplier.
The original card_le injection maps the entire T into ONE EqHom;
gamma,g,theta,coefficients remain tied. Thus |T|<=B. An infinite
image would contain B+1 elements. Original resInfInj and lenOfCard
conclude. B must remain uniform across chosen levels; cannot depend
on T or nu. Unbounded N essential. Negative controls: a single
bounded level cannot cover higher thresholds; growing bounds on
{0,...,nu} do not bound their union. No uniform B proved here.

Actual VWin -> LemmaK/ShaK -> sNum (NumThree) -> hSha at L',l,c,k+1,
B,hTop,hE. Native ShaAsm_holds -> good_of, card_le -> LayEx, ClInj,
all-F/all-nu hB. Candidate shaCofinal42 -> same good_of, card_le42 ->
ClInj and one canonical chosen EqHom bound. Original ShaAsm_bridge42
uses LayEx at max(c,N) and the original hB to recover the old interface.
Actual NumThree caller substitution next; no global deletion of LayEx,
Lay, STors, SCount, SFew, SLayer, other consumers or axiom evidence.
Original and reduced selected graphs above, retain prior RUN40/41
and type/value/constructor graphs. Cache source/toolchain,L,Omega,l,c,E,B,
gamma,g,nu,Good thresholds,role. Backtrack to original on failed replay.
Direct cofinality, not URT advantage. RH OPEN.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native OrderOfOneAddPrimePowZmodPrimePow 1461d8636ef74a1ad316dd7a1b81102065d7ac69;
NumThree 900c8e3fca10cdf9256061213dcc9453bf98f3d2; LemmaKOfSteps 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10;
LemmaKOfLitN 2b1e21f70e69ace53b5219e9e0807b6de0d1920e.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine, SWARM, HANDOFF, AGENTS, state/log/protocol/continuity openings.
Peers f304da1a,57df69df,b0fd82e7,72787a07e and own 7f95819c read;
recent peer titles surveyed. Commit search cofinal found RUN30
90ea4293 (different PairEx). Not exhaustive archive search.
Executed 18 source/guarded edit/reverse/consumer assertions,
16807 exact cofinal threshold checks (three thresholds, anchor 0..6,
stride 1..7). Reproduce JS:
for(let a=0;a<=6;a++)for(let b=0;b<=6;b++)for(let c=0;c<=6;c++)
for(let anchor=0;anchor<=6;anchor++)for(let step=1;step<=7;step++){
let N=Math.max(a,b,c,anchor,2),v=step*Math.ceil(N/step);
if(!(v>=a&&v>=b&&v>=c&&v>=anchor&&v>=2))throw Error("cofinal");}
These are logic controls, not class-group computations. First source
edit attempt failed reverse check for empty replacement; fixed by
positional reverse insertion; no write on failure.
Local lean/lake/elan absent. Actual Actions jobs 45577239749 and
45576756833 pick/run/record success; baseline only. No new CI, axiom
audit, or root closure. Candidate below uncompiled.
RESUME HERE: compile this overlay in pinned warmed runner with existing
engines, compare original/candidate scans and axioms; then replace actual
NumThree hSha call with shaCofinal42 and prove uniform B on chosen
canonical towers. Do not derive more constants without a supplier.
HANDOFF TO arithmetic, kernel, integration, audit.
-/
noncomputable section
open NumberField NumberField.InfinitePlace IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Base
open UpperTheory.V.ZK

namespace PositivityTheory.QuaternionShaBounds
def CofinalBound42 (L Ω : Type) [Field L] [NumberField L] [Field Ω]
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
theorem card_le42 (hCl : ClInj) (c E B ν : ℕ) (h2ν : 2 ≤ ν)
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

theorem PositivityTheory.QuaternionShaBounds.shaCofinal42 (hCl : PositivityTheory.QuaternionShaBounds.ClInj)
    (L : Type) [Field L] [NumberField L] (l c E B : ℕ) [Fact l.Prime]
    (hTop : TopRoot l c L) (hE : 1 ≤ E)
    (hB : PositivityTheory.QuaternionShaBounds.CofinalBound42 L (AlgebraicClosure L) l c E B) :
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
    exact PositivityTheory.QuaternionShaBounds.ShaAssumptions.card_le42 hCl c E B ν h2ν
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

theorem PositivityTheory.QuaternionShaBounds.ShaAsm_bridge42 :
    PositivityTheory.QuaternionShaBounds.ShaAsm := by
  intro hLay hCl L _ _ _ l c E B _ hTop hE hB
  apply PositivityTheory.QuaternionShaBounds.shaCofinal42 hCl L l c E B hTop hE
  intro N
  let ν := max c N
  obtain ⟨ζ, γ, hL, g, hlift, hcyc⟩ := hLay L (AlgebraicClosure L) l c ν hTop (le_max_left _ _)
  obtain ⟨hf, hb⟩ := hB (Kum.Fn L (AlgebraicClosure L) l ν) ν ζ γ hL
  exact ⟨ν, le_max_right _ _, γ, g, hlift, hcyc, hf, hb⟩

theorem PositivityTheory.QuaternionShaBounds.sSha42 : SSha := by
  first
  | (rh_reduce 2 using [PositivityTheory.QuaternionShaBounds.ShaAsm_bridge42,
      PositivityTheory.QuaternionShaBounds.LayEx_holds,
      PositivityTheory.QuaternionShaBounds.ClInj_holds]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact PositivityTheory.QuaternionShaBounds.ShaAsm_bridge42
      PositivityTheory.QuaternionShaBounds.LayEx_holds PositivityTheory.QuaternionShaBounds.ClInj_holds

rh_prune PositivityTheory.QuaternionShaBounds.ShaAsm_holds as RHShaAsmNative42Pruned
rh_scan PositivityTheory.QuaternionShaBounds.ShaAsm_holds limit 2000
rh_scan PositivityTheory.QuaternionShaBounds.shaCofinal42 limit 2000
rh_scan PositivityTheory.QuaternionShaBounds.sSha42 limit 2000
#print axioms PositivityTheory.QuaternionShaBounds.ShaAsm_holds
#print axioms PositivityTheory.QuaternionShaBounds.shaCofinal42
#print axioms PositivityTheory.QuaternionShaBounds.sSha42
end
