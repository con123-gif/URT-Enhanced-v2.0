import RHDependencyCompat47
import Development.AbelianVarietyTheory.Proofs.SatakeParameters.PlainTorExistsChars
import Development.AbelianVarietyTheory.Proofs.SatakeParameters.RcUnlinkedChars
import Development.AbelianVarietyTheory.Proofs.SatakeParameters.SupercuspidalSupportTwistNuCharacters
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 12 RUN48, 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine; AGENTS, SWARM, HANDOFF, state/log/protocol/continuity openings and latest CI read. Peer integration fccd0f04452988a6fc523b48611e317295decc98 (joint row), kernel 04b054aade7ce8ebfe99214678b2b837494d5e00 (shared flag), acceleration 7f45ab3c and recent peer commit summaries read; do not duplicate their splices. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Previous dependency source 8144e2875f80bfe451f70b17221641c1db85fab1 at f3faec215418def62587aafabecca003d595c533.
RESULT: the Hodge branch of the proposed same-interface compatT supplier does not need PlainRec, global WinAt witness, plain_all, plainIff, gd_of or unlFull. Native UpperTheory.Gal.SV.GdOf (GaloisRepExistsTotallyRealGL2.lean d1144d25c89f8c48c2a3bcc77fb94616da92d8a4) already names precisely the weaker local requirement. PlainTor(x) supplies a multiset of rank-one characters with no pair differing by nu 1. Common twist preserves this nonlinkage. In the Langlands multisegment, every segment has length one: otherwise its terms 1 and 0 violate nonlinkage. By the reciprocity laws, the normalized Weil-Deligne parameter is a sum of rank-one characters, hence monodromy zero. On a commutator each character is 1, so its exact characteristic polynomial is (X-1)^n; the dimension law identifies n. This proves Gd locally from PlainTor, without global pi/t/WinAt. This is a human mathematical proof using existing native Langlands exhaustion, support uniqueness and reciprocity laws; not an independent proof of those suppliers. In code rc_unlinked_chars48 is the exact local proof from RcUnlinkedChars d6c9128f7f9f6680edbbef6512a8d8e3ecbf1e01, replacing hI.exh/hI.zel with the native Pr.exh/Pr.zel already used in CompatTOf; no other Inputs projections are used. PlainTor enumeration 0b98ae5a1ee13abf631aaf8c5c32f7b164dc9369, twist cfae97bb88ede38b0a6c7041840f23daf1b1732a, PlainRec df16f0109be344f232695ac1c223672ae3624c53. 
Original selected source graph: levelCore_alt -> compatT(rowOf' P.litN.aut.gal); rowOf' is an identity at the pinned source, not a proof of RowT. RUN47 candidate compatTOf_sharedSat47 -> Hodge gd_of -> plain_all + plainIff + winOf + H (PlainRec) -> winUnl/unlFull/isL_chars. Candidate compatT_directGd48 : RowT -> CompatT -> same Hodge transport from P.above.nice, with guard gdDirect48 -> plainTor_exists_chars + supp_nu_chars + local multisegment + L.dim. This removes PlainRec as argument of the compatibility supplier only; actual levelCore still needs guard_of plainRec in three branches. The same R, r, pi, HT, place, rc and local bridge and all quantifiers are retained. The original P.away.tor, P.above.nice, cofinite semisimple isomorphism and conjugation transports remain substantive and open in our reconstruction. No global dependency retirement. Actual rank3/count replacement and bounded native scans included. Do not infer that original compatT calls compatTOf; this is a proposed same-interface replacement. Cache exact source+toolchain, theorem/context/role, R,r,pi,HT,w,A,h,rc,σ,ξ,twist, O,Bw,hj; preserve old graphs/axiom ledgers. Negative control: dropping Unlinked allows a length-two segment, and its nonzero monodromy invalidates Gd; dropping rank-one support invalidates commutator argument. No URT ranking or synthetic tests.
Executed 37 fail-on-error V8 static checks: unlinked source pin; previous source pin; GdOf source pin; PlainRec source pin; twist source pin; plain support source pin; native GdOf statement; actual row adapter identity; global extra detour; native local theorem extracted; local helper name/input unique; local helper name/input reversible; input binder unique; input binder reversible; existing exhaustion unique; existing exhaustion reversible; two zelevinsky projections; no remaining global Inputs; actual old core and caller included; weaken compat interface unique; weaken compat interface reversible; replace Hodge guard unique; replace Hodge guard reversible; actual level consumer unique; actual level consumer reversible; compatTOf_sharedSat47 occurrences; compatTOf_sharedSat47 rename reversible; levelCore_sharedSat47 occurrences; levelCore_sharedSat47 rename reversible; rank3_witness_sharedSat47 occurrences; rank3_witness_sharedSat47 rename reversible; countK_rank3_sharedSat47 occurrences; countK_rank3_sharedSat47 rename reversible; remaining guard calls preserved; both same Satake routes retained; P.away and P.above remain; native twist theorem verified source. Local command -v lean/lake/elan returned no paths. Actual previous engine CI status JSON blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and 7da354941e402b6f8b364ed03d8c5c82d27b7717 both status pass / returncode 0; baseline only. New candidate not compiled or queued; no new kernel axiom evidence. Stage RUN47 as RHDependencyCompat47 (with prior aliases); then this file. Potential elaboration risks: algNorm/nu normalization, GdOf implicit instance order, simp of Tor charpoly, and Pr namespace aliases. Preserve original fallback. 
RESUME HERE: compile gdDirect48 first in pinned environment, then compatT_directGd48 and actual rank3/count callers; check scan/prune/axiom roles and compare to RUN47. If checked, offer single Hodge guard splice to integration joint48; otherwise repair or backtrack. Trace actual RowT=P.litN.aut.gal source to P.away.tor and P.above.nice, no assumed global removal. Quantitative cohomology and RH prime-window inequality remain open.
HANDOFF TO kernel, integration, Galois, audit.
-/
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open NumberField IsDedekindDomain Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.HeckeGal GlobalTheory.LocGL GlobalTheory.GalOfCusp GlobalTheory.GLq GlobalTheory.GalCut
open GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.RoadU GlobalTheory.AboveL GlobalTheory.SplitWeil UpperTheory.V UpperTheory.V.Af UpperTheory.Zero.LLC GlobalTheory.UnitaryBC UpperTheory.V.Z.Win UpperTheory.V.Lev
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField
open scoped Matrix commutatorElement
open private infOf_of_weights not_mem_of_not_dvd from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.SemisimpleLevels.LevelKO
namespace RHLane12LocalGd48
theorem rc_unlinked_chars48 : ∀ (Ω : Type) [Field Ω] (E : Type) [Field E] [NumberField E] [Algebra E Ω] [IsAlgClosure E Ω] (w : HeightOneSpectrum (𝓞 E)) (A : ValuationSubring Ω) (h : IsPlaceOver A w), ∀ (a : Weil h →* (w.adicCompletion E)ˣ) (ha : IsLocalArtin h a) (rc : IrrGL (w.adicCompletion E) → WD h), UpperTheory.Zero.LLC.LawsT a ha rc → ∀ (x : IrrGL (w.adicCompletion E)) (n : ℕ), ∀ (ξ : Fin n → ((w.adicCompletion E)ˣ →* ℂˣ)) (hξ : ∀ j, IsSmoothChar (ξ j)), HasSupport x.rep (chars ξ hξ) → Unlinked (chars ξ hξ) → (rc x).mono0 ∧ ∀ g : Weil h, (rc x).charPol g = ∏ j, (X - C ((ξ j (a g) : ℂˣ) : ℂ)) := by
  intro Ω _ E _ _ _ _ w A h a ha rc H x n ξ hξ hs hu
  haveI : CharZero (w.adicCompletion E) := charZero_of_injective_algebraMap (algebraMap E _).injective
  obtain ⟨𝔪, hm⟩ := Pr.exh (w.adicCompletion E) x
  have hs' : HasSupport x.rep (msupp 𝔪) := GlobalTheory.LocGL.hasSupport_msupp_of_isL Pr.zel _ 𝔪 x hm
  have he : chars ξ hξ = msupp 𝔪 :=
    GlobalTheory.LocGL.SupportUnique.hasSupport_unique GlobalTheory.RecT.geometricLemma_holds GlobalTheory.bernsteinZelevinskyFiniteness_holds
      Pr.zel _ x _ _ hs hs'
  have hL := H.langlands 𝔪.toList x (by rw [Multiset.coe_toList]; exact hm)
  have hmem : ∀ Δ ∈ 𝔪, ∀ i : Fin Δ.len, Δ.term i ∈ chars ξ hξ := fun Δ hΔ i => by
    rw [he, msupp]
    exact Multiset.mem_bind.2 ⟨Δ, hΔ, Multiset.mem_map.2 ⟨i, Finset.mem_univ_val _, rfl⟩⟩

  have hlen : ∀ Δ ∈ 𝔪, Δ.len = 1 := by
    intro Δ hΔ
    by_contra hne
    have h2 : 1 < Δ.len := lt_of_le_of_ne Δ.len_pos (Ne.symm hne)
    refine hu _ (hmem Δ hΔ ⟨1, h2⟩) _ (hmem Δ hΔ ⟨0, Δ.len_pos⟩) ?_
    simp only [Segment.term, IrrGL.nu_nu]
    norm_num
  have hms : ∀ Δ ∈ 𝔪, Δ.ms = {Δ.first} := by
    intro Δ hΔ
    have e : Δ = Segment.single Δ.first Δ.isCusp_first := Segment.ext_first rfl (by rw [hlen Δ hΔ]; rfl)
    rw [e, Segment.ms_single]
    rfl
  have hsupp : msupp 𝔪 = 𝔪.map Segment.first := by
    rw [msupp, ← Multiset.bind_singleton]
    exact Multiset.bind_congr hms
  have hchar : ∀ y ∈ chars ξ hξ, ∃ j, y = IrrGL.ofChar (ξ j) (hξ j) := fun y hy => by
    obtain ⟨j, -, rfl⟩ := Multiset.mem_map.1 hy
    exact ⟨j, rfl⟩
  have hfirst : ∀ Δ ∈ 𝔪, ∃ j, Δ.first = IrrGL.ofChar (ξ j) (hξ j) := fun Δ hΔ =>
    hchar _ (by rw [he, hsupp]; exact Multiset.mem_map_of_mem _ hΔ)
  have hsum : rc x = sumList (𝔪.toList.map fun Δ => rc Δ.first) := by
    rw [hL, segSum]
    congr 1
    apply List.map_congr_left
    intro Δ hΔ
    rw [hlen Δ (Multiset.mem_toList.1 hΔ)]
    simp only [Nat.cast_one, sub_self, zero_div]
    exact (GlobalTheory.WeilDeligne.charPol_lpTw_lpChar_lpSp E Ω A w h _).1
  have hpol1 : ∀ j (g : Weil h), (rc (IrrGL.ofChar (ξ j) (hξ j))).charPol g = X - C ((ξ j (a g) : ℂˣ) : ℂ) := by
    intro j g
    rw [H.one, WD.lpOfChar, WD.charPol_mk, WDRep.ofChars_ρ, charpoly_diagEnd]
    simp
  refine ⟨?_, fun g => ?_⟩
  · rw [hsum]
    have key : ∀ L : List (Segment (w.adicCompletion E)), (∀ Δ ∈ L, Δ ∈ 𝔪) →
        (sumList (L.map fun Δ => rc Δ.first)).mono0 := by
      intro L
      induction L with
      | nil =>
        intro _
        show (WD.lpZero h).mono0
        exact (WD.monodromyZero_ofWeilDeligneRepClass_iff _).2 rfl
      | cons Δ L ih =>
        intro hL'
        obtain ⟨j, hj⟩ := hfirst Δ (hL' Δ List.mem_cons_self)
        show (WD.lpSum _ _).mono0
        refine (WD.monomial_sum_iff _ _).2 ⟨?_, ih fun Δ' h' => hL' Δ' (List.mem_cons_of_mem _ h')⟩
        change (rc Δ.first).mono0
        rw [hj]
        exact WD.mono0_of_lpDim_eq_one (by rw [H.dim]; rfl)
    exact key _ fun Δ hΔ => Multiset.mem_toList.1 hΔ
  · rw [hsum, GlobalTheory.LocLanglands.CuspExt.charPol_sumList, List.map_map]
    have r1 : (∏ j, (X - C ((ξ j (a g) : ℂˣ) : ℂ))) = ((chars ξ hξ).map fun y => (rc y).charPol g).prod := by
      rw [chars, Multiset.map_map, Finset.prod_eq_multiset_prod]
      exact congrArg Multiset.prod (Multiset.map_congr rfl fun j _ => (hpol1 j g).symm)
    rw [r1, he, hsupp, Multiset.map_map, ← Multiset.prod_coe, ← Multiset.map_coe, Multiset.coe_toList]
    rfl


theorem gdDirect48 : UpperTheory.Gal.SV.GdOf := by
  intro E Ω _ _ _ _ _ A w h rc hrc n σ hP
  haveI : CharZero (w.adicCompletion E) := charZero_of_injective_algebraMap (algebraMap E _).injective
  obtain ⟨a, ha, L⟩ := hrc
  obtain ⟨ξ, hξ, hs, hu⟩ := GlobalTheory.RoadU.plainTor_exists_chars _ _ hP
  let s : ℂ := (((1 - (n : ℝ)) / 2 : ℝ) : ℂ)
  let ξ' : Fin n → ((w.adicCompletion E)ˣ →* ℂˣ) := fun j => ξ j * absPow _ s
  have hξ' : ∀ j, IsSmoothChar (ξ' j) := fun j => (hξ j).mul (GlobalTheory.LocGL.isSmoothChar_absPow _)
  have hnu := GlobalTheory.RoadU.TwistSupp.supp_nu_chars (w.adicCompletion E)
    (IrrGL.of σ.ρ σ.smooth σ.irred) n ξ ξ' hξ hξ' s (fun _ => rfl)
  have hsup : HasSupport (algNorm σ).rep (chars ξ' hξ') := by
    simpa only [algNorm] using hnu.1.1 hs
  obtain ⟨hm, hpol⟩ := rc_unlinked_chars48 Ω E w A h a ha rc L (algNorm σ) n ξ' hξ' hsup (hnu.2.1 hu)
  refine ⟨?_, hm⟩
  have hdim : (rc (algNorm σ)).lpDim = n := by rw [L.dim]; rfl
  intro u v
  have hc (i : Fin n) : ξ' i (a ⁅u, v⁆) = 1 := by
    change ((ξ' i).comp a) ⁅u, v⁆ = 1
    rw [map_commutatorElement]
    exact (Commute.all _ _).commutator_eq
  rw [hpol, hdim]
  simp [hc]

end RHLane12LocalGd48

theorem UpperTheory.V.Z.Win.compatT_directGd48 :
    UpperTheory.V.Z.Win.RowT → UpperTheory.V.Z.Win.CompatT := by
  intro hRow F Ω _ _ _ _ _ _ l _ ι n hn r π hr hreg ⟨χ, hχ⟩ ha
  obtain ⟨R, wt, HT, P⟩ := hRow F Ω l ι n hn π χ hreg hχ
  have hRc : Continuous fun g => (R g : Matrix (Fin n) (Fin n) (Qbar l)) := Units.continuous_val.comp P.cont
  obtain ⟨p, hp⟩ : RepIso R r := by
    refine GlobalTheory.IsoOfFrobFree.main F Ω l ι n R r P.cont hr P.ss ha.1 ?_
    filter_upwards [ha.2, eventually_not_mem F l] with w ⟨B, hB, hf⟩ hw
    obtain ⟨⟨s, σ, hσ, -⟩, -⟩ := UpperTheory.V.Z.Gam.suppFacts F n hn π w
    obtain ⟨α, hα, hS⟩ := GlobalTheory.LFun.SphComp.hasSatake_of_isLocComp π ((CG.hasSat_mk π w B).1 hB) hσ
    have hBσ : GlobalTheory.LFun.HasSatGL w σ.ρ B := hα ▸ GlobalTheory.T.hasSatakeGL_of_hasSatakeParameters_principalSeries F w n _ σ.ρ α hS
    refine ⟨_, UpperTheory.V.Z.Desc.W.satFrob_oneRec46 F Ω l ι n R w hw σ B hBσ (fun A h => ?_), hf⟩
    obtain ⟨rc, hrc⟩ := UpperTheory.Zero.LLC.recTExists F Ω A w h
    exact ⟨rc, hrc, ⟨wdOf h hw ι R, isWDOf_wdOf hw ι hRc,
      fun g => (P.away w hw A h rc hrc σ hσ).tor g.1 g.2⟩⟩
  refine ⟨HT, P.weights, fun w σ hσ => ⟨fun A h rc hrc => ⟨fun hw => ?_, fun O _ _ _ Bw hj hg => ?_⟩, fun hT A h O _ _ _ Bw hj => ?_⟩⟩
  · exact WDT.of_conj ⟨wdOf h hw ι R, isWDOf_wdOf hw ι hRc, fun g => (P.away w hw A h rc hrc σ hσ).tor g.1 g.2⟩ hw p
      fun g => by rw [hp, inv_mul_cancel_right]
  · obtain ⟨-, k2, -, k4⟩ := (P.above (Loc.PP l) _ (Loc.tiedP l) w A h O Bw hj).nice σ hσ rc hrc (Or.inr hg.1) hg.2
    have h3 := GlobalTheory.PstConj.main F Ω l ι n _ _ (Loc.tiedP l) w A h O Bw hj (R.comp (Dec (F := F) A).subtype)
      (r.comp (Dec (F := F) A).subtype) p (fun g => hp g.1) k2
    exact ⟨h3.1, by rw [h3.2]; exact k4.tor hg.1 hg.2⟩
  · obtain ⟨rc, hrc⟩ := UpperTheory.Zero.LLC.recTExists F Ω A w h
    obtain ⟨g1, g2⟩ := _root_.RHLane12LocalGd48.gdDirect48 F Ω A w h rc hrc n σ hT
    obtain ⟨k1, -, k3, -⟩ := (P.above (Loc.PP l) _ (Loc.tiedP l) w A h O Bw hj).nice σ hσ rc hrc (Or.inr g1) g2
    obtain ⟨d1, -, -, d4⟩ := GlobalTheory.ConjLocal.local_conj l (Loc.PP l) F Ω O _ Bw n (R.comp (Dec (F := F) A).subtype)
      (r.comp (Dec (F := F) A).subtype) p fun g => hp g.1
    exact ⟨d1 k1, fun τ LL' τ' hi => d4 τ _ (k3 τ LL' τ' hi)⟩

namespace UpperTheory.V.Keep
theorem levelCore_directGd48 (P : _root_.UpperTheory.V.Af.Hypotheses') (K : Type) [Field K] [NumberField K] [IsCMField K] (n : ℕ) (hn : 2 ≤ n) (m : Fin n → ℤ)
    (M : ℕ) (hM : 1 ≤ M) (l : ℕ) [Fact l.Prime] (hl : l ≠ 2) (Ω : Type) [Field Ω] [Algebra K Ω] [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ)
    (r : G K Ω →* GL (Fin n) (Qbar l)) (π : CuspSub K n) (hL : LevelF l M m r)
    (hU : ∀ w : HeightOneSpectrum (𝓞 K), ((l : ℕ) : 𝓞 K) ∈ w.asIdeal → Unl1 r w ∨ PotUnl r w) (hW : WitA ι r)
    (hreg : (CG.mk π).IsRegAlg) (hpol : ∃ χ, GlobalTheory.ContraPair.PolarizedPair π χ) (ha : AttC ι r π) :
    (∀ τ, π.HasInfChar τ (infOf m)) ∧ HasFixed π.finPart (KLev K n M) ∧
      ∀ w : HeightOneSpectrum (𝓞 K), (l : 𝓞 K) ∉ w.asIdeal → ∀ B, (CG.mk π).HasSat w B → FrobEig ι r w (algSat n (normV w) B) := by
  obtain ⟨HT, hwt, hC⟩ := _root_.UpperTheory.V.Z.Win.compatT_directGd48 (_root_.UpperTheory.Gal.SV.rowOf' P.litN.aut.gal) K Ω l ι n (by omega) r π hL.cont hreg hpol ha
  have hw' : ∀ w : HeightOneSpectrum (𝓞 K), ((l : ℕ) : 𝓞 K) ∉ w.asIdeal ∨ Unl1 r w ∨ PotUnl r w := fun w =>
    (em _).elim (fun e => Or.inr (hU w e)) Or.inl
  refine ⟨fun φ => ?_, ?_, fun w hw B hB => ?_⟩
  · let τ : K →+* Qbar l := ι.symm.toRingHom.comp φ
    have hφ : ι.toRingHom.comp τ = φ := RingHom.ext fun x => ι.apply_symm_apply _
    obtain ⟨w, hw, hτ⟩ := GlobalTheory.GalFirstClause.existsIsInduced l K Ω τ
    obtain ⟨A, hA, κ, hκ⟩ := hL.above w hw
    obtain ⟨O, _, _, _, Bw, hj⟩ := exists_bridge (l := l) hA hw
    obtain ⟨τ', hτ'⟩ := hτ A hA O Bw hj
    obtain ⟨⟨σ, hσ⟩, -⟩ := _root_.UpperTheory.V.Af.local_comp_complex_of_printed_results P K n π w
    obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense hA
    have g := guard_of plainRec hreg ha hW (hw' w) (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc) hσ
    have hJ := _root_.UpperTheory.V.Af.jumps_above_of_printed_results P K Ω l hl n M hM m r hL.cont w A hA O Bw hj κ hκ τ _
      (((hC w σ hσ).2 g.1 A hA O Bw hj).2 τ _ τ' hτ')
    have hw := hwt τ
    rw [hJ, hφ] at hw
    rw [← infOf_of_weights hw]
    exact ParLaws.hasInfChar_infChar (CG.mk π) φ
  · refine _root_.UpperTheory.V.Af.globFixed_alt P K n M hM _ π.finPart π.isSmooth_finPart fun w => ?_
    obtain ⟨⟨σ, hσ⟩, hi⟩ := _root_.UpperTheory.V.Af.local_comp_complex_of_printed_results P K n π w
    refine ⟨σ, hi σ hσ, ?_⟩
    by_cases hw : ((l : ℕ) : 𝓞 K) ∈ w.asIdeal
    · obtain ⟨A, hA, κ, hκ⟩ := hL.above w hw
      obtain ⟨O, _, _, _, Bw, hj⟩ := exists_bridge (l := l) hA hw
      obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense hA
      have g := guard_of plainRec hreg ha hW (hw' w) (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc) hσ
      obtain ⟨hp, he⟩ := ((hC w σ hσ).1 A hA rc (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc)).2 O Bw hj g.2
      refine _root_.UpperTheory.V.Lev.fixedSs_of_prints P K Ω l ι n M hM m r hL.cont w A hA O Bw hj κ hκ hp rc hrc σ (fun _ s => by rw [he]) ?_
      by_cases hlM : l ∣ M
      · exact Or.inl hlM
      refine Or.inr (Or.inr fun _ => ?_)
      obtain ⟨μ, m1, m2, -⟩ := flagPol K Ω l ι n M hM m r hL.cont w A hA O Bw hj κ hκ hp
      refine sphV (_root_.UpperTheory.V.Z.Win.toV' hrc) σ g.2.2 n fun s => ?_
      rw [← he, m1]
      simp only [fun i => m2 i s (UpperTheory.inertia_fixes_roots_of_unity_prime_to_residue_char K Ω w A hA M (not_mem_of_not_dvd hw hlM) s s.2), Units.val_one, C_1,
        Finset.prod_const, Finset.card_univ, Fintype.card_fin]
    · obtain ⟨A, hA, χ, h1, h2⟩ := hL.away w hw
      obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense hA
      have g := guard_of plainRec hreg ha hW (hw' w) (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc) hσ
      exact _root_.UpperTheory.V.Z.Win.T2.local_fixed_vectors_statement P K Ω n M hM w A hA rc hrc σ
        (_root_.UpperTheory.V.Af.weil_deligne_away_of_printed_results P K Ω l ι n M hM r hL.cont w hw A hA χ h1 h2 _
          ((((hC w σ hσ).1 A hA rc (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc)).1 hw).isWDOf g.2))
  · obtain ⟨⟨σ, hσ⟩, hi⟩ := _root_.UpperTheory.V.Af.local_comp_complex_of_printed_results P K n π w
    have hBs := (((_root_.UpperTheory.V.Af.satake_local_of_printed_results P K n w σ).2 _ π.finPart (hi σ hσ) B).1 hB)
    refine _root_.UpperTheory.V.Z.Desc.W.satFrob_oneRec46 K Ω l ι n r w hw σ B hBs ?_
    intro A h
    obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense h
    have ht := _root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc
    exact ⟨rc, ht, ((hC w σ hσ).1 A h rc ht).1 hw⟩

end UpperTheory.V.Keep

namespace UpperTheory.GalN.V.Win.N
theorem rank3_witness_directGd48
    (P : _root_.UpperTheory.V.Af.Hypotheses') : Rank3LevelWitness21 := by
  intro K _ _ _ _ e _ M hM l _ hl2 Ω _ _ _ ι r hr
  obtain ⟨π, hreg, hd, ha⟩ := hr.aut.1
  have hpol : GlobalTheory.ContraPair.PolarizedPair π (quadChar K ^ (3 : ℕ)) :=
    ⟨fun v => by rw [locInf_pow, quadChar_locInf], by
      rw [map_pow, compNorm_quadChar, one_pow]; exact (GlobalTheory.ContraPair.dualIsConjBy_one π).2 hd⟩
  have h := _root_.UpperTheory.V.Keep.levelCore_directGd48 P K 3 (by norm_num)
    ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] M hM l hl2 Ω ι r π
    (LevelF.of_level hr.level) hr.odd (hr.aut.2 hr.level.cont) hreg ⟨_, hpol⟩ ha
  exact ⟨π, ⟨h.1, hd, h.2.1⟩, ha.1, h.2.2⟩


theorem countK_rank3_directGd48 (P : _root_.UpperTheory.V.Af.Hypotheses') : CountK3Slice21 := by
  first
  | (rh_reduce 3 using [countK_rank3_of_witness21, rank3_witness_directGd48]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact countK_rank3_of_witness21 P (rank3_witness_directGd48 P)

end UpperTheory.GalN.V.Win.N

rh_scan UpperTheory.V.Z.Win.compatTOf limit 2000
rh_scan RHLane12LocalGd48.gdDirect48 limit 2000
rh_scan UpperTheory.V.Z.Win.compatT_directGd48 limit 2000
rh_scan UpperTheory.V.Keep.levelCore_directGd48 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.rank3_witness_directGd48 limit 2000
rh_prune UpperTheory.V.Z.Win.compatT_directGd48 as RHCompatDirectGdPruned48
#print axioms RHLane12LocalGd48.gdDirect48
#print axioms UpperTheory.V.Z.Win.compatTOf
#print axioms UpperTheory.V.Z.Win.compatT_directGd48
#print axioms UpperTheory.V.Keep.levelCore_directGd48
#print axioms UpperTheory.GalN.V.Win.N.countK_rank3_directGd48
