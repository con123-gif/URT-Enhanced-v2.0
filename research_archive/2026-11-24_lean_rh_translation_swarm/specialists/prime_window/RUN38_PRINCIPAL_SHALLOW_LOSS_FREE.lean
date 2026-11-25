import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CountVs
import Development.AutomorphicArithmetic.AutomorphicVarieties.CharacterLevelBounds.EigV
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.SelmerTransport.SelUnit
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.HostComp

noncomputable section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV UpperTheory.V.Chr

/- RUN38, 25 Nov 2026, lane prime_window. SOURCE-MATCHED / PREPARED; not kernel checked.
Mission blob d876dd144c13a327429f7ac651ccfac619311469; pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Actual sources under src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
HeightAndVanishing/VsField.lean b6ce23de6b5c75a4e25b22df26dbb5cbecde343f
CharacterLevelBounds/LiftGens.lean 41897884461cf6ab6317ee62923390c28078465f
HeightAndVanishing/CountVs.lean 3b29717c74e14806d898cbbf9f96417396a2d37d
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
HeightAndVanishing/HostIndex.lean ccc755aa50d8c7e732d74d5d6bd211f7d903c419
Other pinned inputs SelUnit fb013cdac79644f020dea8ba70662f8c7f9698d1,
EigV 603567dbef99f94ffdf671f2c6a8a8e91ac45a6a, GalEmbTop 0df0aefe7d44997e7e1c87a6bad556c271d1aeed,
QoBase 0a190a40d2e39561f26a2a72a552e61c971ae4e8, ShaLenEq 8bef927eacdc8feddaa2c8bf31e7818f893070e8.
Peer 7ba7bcab mission, 6c92b85b CountII TypeII Kato alternative, 47b619fd normalized residual, 29c54b4f sign-safe height bridge, living manuscript blob 10e3d636b345adbcae9ddb91820a3a93f59c93bc. Prior RUN37 remains fallback.
Human proof: the principal host H has 2-power index by hostIndex and o=1.
Every psi in X has H <= ker psi; hence [units:ker psi] divides [units:H].
The SAME vsField construction takes L fixed by ker(psi o phi_N) intersect ker(phi_l).
The finite quotient by that intersection embeds in the product of the two images.
Thus [L:Q] divides [units:ker psi]*(l-1), not just <= l*orderOf psi.
For every odd l, [L:Q] is prime to l. Do not infer prime-to-l from the previous
degree inequality alone. Restriction on H1 with l-primary coefficients is injective:
corestriction times restriction is multiplication by [L:Q], a unit on QO.
Native selUnit proves this for the actual LocSel family, not a changed local condition.
On G_L the character is trivial, so selTwist, qoBase, shaLenEq give the same
untwisted length. This yields V'_l(1,psi) <= V_l(1,psi) <= shaLen(D,1)*eO.
Retaining the original Poitou-Tate, local finiteness, local duality and LemmaK,
shaLeV and klen yield Vn<=2*(l*N)^A, A=(2*n0)^ceil(CK)*(n0+1).
Since log l <= l <= l*N=x and x>=2, Vn*log l <= x^(A+2).
No local generator/H0 loss at this caller. Original CountVs general theorem
remains untouched. No claim of proving LemmaK, CountI/II/V, 2-primary, minus,
same-host geometric suppliers or VWinAt. Proposed specialization only.
Original source-visible graph: countVs -> vsField + upV + shaLeV + klen +
vsOrd + lossLe + H0_local_card_bounded + nrm_le + final_le;
upV -> kerResAb + lift_gens + selUp + selTwist + qoBase + shaLenEq.
Candidate graph: countVsPrime38 -> vsFieldPrime38 + upVPrime38 + hostIndex +
shaLeV + klen + vsOrd + nrm_le; upVPrime38 -> selUnit + selTwist + qoBase + shaLenEq.
These are local source edges, not elaborated closure; original all pending nodes retained.
Cache key pin, actual h, principal conductor, l, psi, e=1, L, D, coefficient ring,
local Selmer family, CK, and source/toolchain hashes. No URT value established.
Executed connector arithmetic: 34760 exact divisibility checks on actual prime
values and allowed 2-power orders; 790 negative controls (l factor).
These are finite scalar checks only, not computations of field degrees or cohomology.
Native environment: lean/lake unavailable; baseline CI status files 45577239749 and
45576756833 retrieved pass, NOT evidence for new file. No new axioms certified.
RESUME HERE: replay these declarations with existing pinned runner; audit actual
relative-index identity, finite field witness, and selUnit local-family transport;
replace CountVs only at principal caller after checks. Then address actual
LemmaK e=1 supplier (H2(Z_l(2))) and full-length CountII/V on same host.
HANDOFF TO integration, kernel, formal audit, Galois. RH OPEN.
-/
private theorem index_inf_dvd_index_mul_index_of_commGroup {G : Type*} [CommGroup G] (A B : Subgroup G) :
    (A ⊓ B).index ∣ A.index * B.index := by
  have h := Subgroup.relIndex_inf_mul_relIndex A B ⊤
  rw [inf_top_eq, Subgroup.relIndex_top_right, Subgroup.relIndex_top_right] at h
  rw [← h]
  exact Nat.mul_dvd_mul_right (Subgroup.relIndex_dvd_index_of_normal _ _) _

private theorem index_comap_dvd_index_of_commGroup {G G' : Type*} [CommGroup G] [Group G'] (A : Subgroup G) (f : G' →* G) :
    (A.comap f).index ∣ A.index := by
  rw [Subgroup.index_comap]
  exact Subgroup.relIndex_dvd_index_of_normal _ _


private theorem idx_le (O : Type) [CommRing O] [IsDomain O] (N : ℕ) [NeZero N] (ψ : DirichletCharacter O N) :
    ψ.toUnitHom.ker.index ≤ orderOf ψ := by
  have hpos := MulChar.orderOf_pos ψ
  haveI : NeZero (orderOf ψ) := ⟨hpos.ne'⟩
  rw [Subgroup.index_ker]
  calc Nat.card ψ.toUnitHom.range ≤ Nat.card (rootsOfUnity (orderOf ψ) O) := by
        apply Subgroup.card_le_of_le
        rintro _ ⟨u, rfl⟩
        rw [mem_rootsOfUnity]
        ext
        rw [Units.val_pow_eq_pow_val, MulChar.coe_toUnitHom, ← MulChar.pow_apply' ψ hpos.ne',
          pow_orderOf_eq_one, MulChar.one_apply_coe, Units.val_one]
    _ ≤ orderOf ψ := card_rootsOfUnity O _

theorem UpperTheory.V.HV.vsFieldPrime38 :
    ∀ (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ (O : Type) [CommRing O] [IsDomain O] (N : ℕ) [NeZero N] (ψ : DirichletCharacter O N), ¬ l ∣ ψ.toUnitHom.ker.index →
      ∃ (L : Type) (_ : Field L) (_ : NumberField L) (_ : Algebra L Ω) (_ : IsAlgClosure L Ω) (_ : IsAbelianGalois ℚ L), HasMuQ l L ∧
        Module.finrank ℚ L ≤ orderOf ψ * l ∧ Nonempty (L →ₐ[ℚ] CyclotomicField (l * N) ℚ) ∧ galOf ℚ L Ω ≤ (Chr.dirG ℚ Ω ψ).ker ∧ ¬ l ∣ Module.finrank ℚ L := by
  intro Ω _ _ _ l hl hl2 O _ _ N _ ψ hidx
  have hlp : l.Prime := hl.out
  haveI : NeZero l := ⟨hlp.ne_zero⟩
  haveI hMz : NeZero (l * N) := ⟨mul_ne_zero hlp.ne_zero (NeZero.ne N)⟩
  let φN : (ZMod (l * N))ˣ →* (ZMod N)ˣ := ZMod.unitsMap (dvd_mul_left N l)
  let φl : (ZMod (l * N))ˣ →* (ZMod l)ˣ := ZMod.unitsMap (dvd_mul_right l N)
  let H : Subgroup (ZMod (l * N))ˣ := (ψ.toUnitHom.comp φN).ker ⊓ φl.ker
  let A : AbF := ⟨l * N, Nat.pos_of_ne_zero (NeZero.ne (l * N)), H⟩
  obtain ⟨L, fL, nfL, hab, -⟩ := exists_numberField_isAbField_finrank_eq_deg A
  have hlev : Chr.HasLevel L (l * N) H := Chr.abLevel.1 A L hab
  obtain ⟨hgal, hfin, hΩ⟩ := Chr.levGal L (l * N) H hlev
  haveI : IsAlgClosed Ω := IsAlgClosure.isAlgClosed ℚ
  haveI : Algebra.IsAlgebraic ℚ Ω := IsAlgClosure.isAlgebraic
  let f : L →ₐ[ℚ] Ω := IsAlgClosed.lift
  letI : Algebra L Ω := f.toRingHom.toAlgebra
  haveI : IsScalarTower ℚ L Ω := inferInstance
  haveI : Algebra.IsAlgebraic L Ω := Algebra.IsAlgebraic.tower_top (K := ℚ) L
  haveI hcl : IsAlgClosure L Ω := ⟨IsAlgClosure.isAlgClosed ℚ, inferInstance⟩
  refine ⟨L, fL, nfL, inferInstance, hcl, hgal, ?_, ?_, ?_, ?_, ?_⟩
  · have hmu : A.HasMu l := by
      unfold AbF.HasMu
      refine ⟨dvd_mul_right l N, ?_⟩
      intro a ha
      unfold AbF.ker at ha
      obtain ⟨u, hu, hua⟩ := ha
      have h1 : φl u = 1 := MonoidHom.mem_ker.mp hu.2
      have h2 : ((φl u : (ZMod l)ˣ) : ZMod l) = (a : ZMod l) := by
        simp only [φl, ZMod.unitsMap_def, Units.coe_map, MonoidHom.coe_coe, ZMod.castHom_apply]
        rw [hua, ZMod.cast_natCast (dvd_mul_right l N)]
      rw [h1, Units.val_one] at h2
      exact (ZMod.natCast_eq_natCast_iff a 1 l).mp (by rw [← h2, Nat.cast_one])
    obtain ⟨z, hz⟩ := (abelianField_hasMu_iff_exists_primitiveRoot A l hlp hl2 L hab).mp hmu
    unfold HasMuQ
    rw [if_neg hl2]
    exact ⟨z, hz⟩
  · rw [hfin]
    refine (Subgroup.index_inf_le).trans (Nat.mul_le_mul ?_ ?_)
    · rw [← MonoidHom.comap_ker, Subgroup.index_comap_of_surjective _ (ZMod.unitsMap_surjective _)]
      exact idx_le O N ψ
    · rw [Subgroup.index_ker]
      refine (Subgroup.card_le_card_group _).trans ?_
      rw [Nat.card_eq_fintype_card, ZMod.card_units_eq_totient]
      exact Nat.totient_le l
  · have hab' := hab
    unfold IsAbField at hab'
    obtain ⟨N', hN', j, ζ, hmN, hζ, h3⟩ := hab'
    haveI : NeZero N' := hN'
    haveI : NeZero ((N' : ℕ) : ℚ) := ⟨Nat.cast_ne_zero.mpr (NeZero.ne N')⟩
    haveI : IsCyclotomicExtension {N'} ℚ (CyclotomicField N' ℚ) := CyclotomicField.isCyclotomicExtension N' ℚ
    haveI : IsGalois ℚ (CyclotomicField N' ℚ) := IsCyclotomicExtension.isGalois {N'} ℚ _
    haveI : FiniteDimensional ℚ (CyclotomicField N' ℚ) := IsCyclotomicExtension.finiteDimensional {N'} ℚ _
    haveI : NeZero ((l * N : ℕ) : ℚ) := ⟨Nat.cast_ne_zero.mpr (NeZero.ne (l * N))⟩
    haveI : IsCyclotomicExtension {l * N} ℚ (CyclotomicField (l * N) ℚ) :=
      CyclotomicField.isCyclotomicExtension (l * N) ℚ
    have hmN' : l * N ∣ N' := hmN
    have hdpos : N' / (l * N) ≠ 0 :=
      (Nat.div_pos (Nat.le_of_dvd (Nat.pos_of_ne_zero (NeZero.ne N')) hmN')
        (Nat.pos_of_ne_zero (NeZero.ne (l * N)))).ne'
    have hη : IsPrimitiveRoot (ζ ^ (N' / (l * N))) (l * N) := by
      have := hζ.pow_of_dvd hdpos (Nat.div_dvd_of_dvd hmN')
      rwa [Nat.div_div_self hmN' (NeZero.ne N')] at this
    let F : IntermediateField ℚ (CyclotomicField N' ℚ) := IntermediateField.adjoin ℚ {ζ ^ (N' / (l * N))}
    haveI : IsCyclotomicExtension {l * N} ℚ F := hη.intermediateField_adjoin_isCyclotomicExtension ℚ
    have hmem : ∀ x, j x ∈ F := by
      intro x
      rw [← IsGalois.fixedField_fixingSubgroup F, IntermediateField.mem_fixedField_iff]
      intro τ hτ
      have hτη : τ (ζ ^ (N' / (l * N))) = ζ ^ (N' / (l * N)) :=
        (IntermediateField.mem_fixingSubgroup_iff F τ).mp hτ _
          (IntermediateField.mem_adjoin_simple_self ℚ _)
      have hτζ : τ ζ = ζ ^ ((hζ.autToPow ℚ τ : ZMod N')).val := (hζ.autToPow_spec ℚ τ).symm
      have hpow : (ζ ^ (N' / (l * N))) ^ ((hζ.autToPow ℚ τ : ZMod N')).val = ζ ^ (N' / (l * N)) := by
        calc (ζ ^ (N' / (l * N))) ^ ((hζ.autToPow ℚ τ : ZMod N')).val
            = (ζ ^ ((hζ.autToPow ℚ τ : ZMod N')).val) ^ (N' / (l * N)) := by
              rw [← pow_mul, ← pow_mul, mul_comm]
          _ = (τ ζ) ^ (N' / (l * N)) := by rw [hτζ]
          _ = τ (ζ ^ (N' / (l * N))) := (map_pow τ ζ _).symm
          _ = ζ ^ (N' / (l * N)) := hτη
      have hne : ζ ^ (N' / (l * N)) ≠ 0 := hη.ne_zero (NeZero.ne (l * N))
      have hz : (ζ ^ (N' / (l * N))) ^ ((((hζ.autToPow ℚ τ : ZMod N')).val : ℤ) - 1) = 1 := by
        rw [zpow_sub₀ hne, zpow_natCast, zpow_one, hpow, div_self hne]
      have hd := (hη.zpow_eq_one_iff_dvd _).mp hz
      have hc : ((((((hζ.autToPow ℚ τ : ZMod N')).val : ℤ) - 1 : ℤ)) : ZMod (l * N)) = 0 :=
        (ZMod.intCast_zmod_eq_zero_iff_dvd _ (l * N)).mpr hd
      push_cast at hc
      have hker : A.ker ((hζ.autToPow ℚ τ : ZMod N')).val := by
        unfold AbF.ker
        exact ⟨1, Subgroup.one_mem _, by rw [Units.val_one]; exact (sub_eq_zero.mp hc).symm⟩
      exact ((h3 τ _ hτζ).mpr hker) x
    exact ⟨(IsCyclotomicExtension.algEquiv {l * N} ℚ F (CyclotomicField (l * N) ℚ)).toAlgHom.comp
      (j.codRestrict F.toSubalgebra hmem)⟩
  · intro σ hσ
    rw [(hΩ Ω).1] at hσ
    unfold Chr.levH at hσ
    rw [Subgroup.mem_comap] at hσ
    rw [MonoidHom.mem_ker]
    unfold Chr.dirG
    rw [← (Chr.clsFacts ℚ Ω (l * N)).2.1 N (dvd_mul_left N l)]
    exact MonoidHom.mem_ker.mp hσ.1

  · rw [hfin]
    have hA : (ψ.toUnitHom.comp φN).ker.index ∣ ψ.toUnitHom.ker.index := by
      rw [← MonoidHom.comap_ker]
      exact index_comap_dvd_index_of_commGroup _ _
    have hB : φl.ker.index ∣ l - 1 := by
      rw [Subgroup.index_ker]
      have hr : φl.range = ⊤ := MonoidHom.range_eq_top.mpr (ZMod.unitsMap_surjective _)
      rw [hr]
      have hcard : Nat.card (⊤ : Subgroup (ZMod l)ˣ) = Nat.card (ZMod l)ˣ :=
        Nat.card_congr (Subgroup.topEquiv.toEquiv)
      rw [hcard, Nat.card_eq_fintype_card, ZMod.card_units_eq_totient, Nat.totient_prime hlp]
    intro hd
    have hprod := (index_inf_dvd_index_mul_index_of_commGroup (ψ.toUnitHom.comp φN).ker φl.ker).trans
      (Nat.mul_dvd_mul hA hB)
    rcases hlp.dvd_mul.mp (hd.trans hprod) with ha | hb
    · exact hidx ha
    · have hpos : 0 < l - 1 := by omega
      have hle := Nat.le_of_dvd hpos hb
      omega

theorem UpperTheory.V.Chr.upVPrime38 :
    ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (L : Type) [Field L] [NumberField L] [Algebra k L] [Algebra L Ω] [IsScalarTower k L Ω] [IsAlgClosure L Ω] [IsAbelianGalois k L]
          (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Algebra ℤ_[l] O] [Module.Finite ℤ_[l] O] (D : LData L Ω l) (e : ℕ) (ψ : G k Ω →* Oˣ), galOf k L Ω ≤ ψ.ker →
          ¬ l ∣ Module.finrank k L →
          V l e ψ ≤ shaLen D (e : ℤ) * eO l O := by
  intro k Ω _ _ _ _ _ L _ _ _ _ _ _ _ l _ O _ _ _ _ _ D e ψ hψ hdeg
  have hnormal : (galOf k L Ω).Normal := by
    rw [← (galQuot k L Ω).2.1]
    infer_instance
  letI := hnormal
  have hopen : IsOpen ((ψ⁻¹ : G k Ω →* Oˣ).ker : Set (G k Ω)) :=
    Subgroup.isOpen_mono (H₁ := galOf k L Ω) (fun g hg => by
      rw [MonoidHom.mem_ker, MonoidHom.inv_apply, MonoidHom.mem_ker.1 (hψ hg), inv_one]) (galEmbTop k L Ω).2.1
  have hunit : IsUnit ((galOf k L Ω).relIndex (⊤ : Subgroup (G k Ω)) : O) := by
    rw [Subgroup.relIndex_top_right, (galEmbTop k L Ω).2.2]
    exact (dvrFacts l O).2.2.2.2.2.2.2.2 hdeg
  have hcont := (contTw k Ω l).2.2 O ψ⁻¹ (-(e : ℤ)) hopen
  have hres := (selUnit O (G k Ω) (QO l O) (rho l e ψ) hcont
    (galOf k L Ω) ⊤ le_top ((galEmbTop k L Ω).2.1.preimage continuous_subtype_val)
    hunit _ (conjStable_shaFam k Ω l)).1
  obtain ⟨⟨Φ, -⟩, -⟩ := selTwist O (G k Ω) (QO l O) _ (rho l e ψ) ψ (tw_apply l e ψ) (galOf k L Ω)
    (fun u hu => hψ hu) _ (conjStable_shaFam k Ω l)
  have hχ : chiO k Ω l O ^ (-(e : ℤ)) =
      (Units.map (algebraMap ℤ_[l] O).toMonoidHom).comp (cycZ k Ω l ^ (-(e : ℤ))) :=
    MonoidHom.ext fun g => (map_zpow (Units.map (algebraMap ℤ_[l] O).toMonoidHom) (cycZ k Ω l g) _).symm
  have hb := (qoBase l (G k Ω) O (cycZ k Ω l ^ (-(e : ℤ))) (galOf k L Ω) (shaFam k Ω l)).1
  rw [← hχ, Φ.length_eq] at hb
  have hs : shaLen D (e : ℤ) = _ := (shaLenEq k L Ω l D e).1
  calc V l e ψ ≤ Module.length O (LocSel (rho l e ψ) (galOf k L Ω) (shaFam k Ω l)) :=
          Module.length_le_of_injective _ hres
    _ = shaLen D (e : ℤ) * eO l O := by rw [hs]; exact hb

def UpperTheory.V.HV.PrincipalCountShape38 (P : ∀ (h : Host) (l : ℕ) [Fact l.Prime] (c : Coef l) (_ : ℕ), DirichletCharacter c.O h.N → Prop) : Prop :=
  ∀ χ : PChar, χ.N = 1 → ∃ C : ℕ, ∀ h : Host, h.chi = χ → ∀ t : ℕ, h.Big t →
    ∀ (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] (l : ℕ) [Fact l.Prime] (c : Coef l) (e : ℕ),
      l ≠ 2 → 0 < e → e < t → ∀ ψ ∈ h.X c e, P h l c e ψ → VLe Ω c e ψ (((l : ℝ) * h.N * e) ^ C)


def UpperTheory.V.HV.PrincipalCountVs38 : Prop := PrincipalCountShape38 fun h l _ _ e ψ => h.CaseV l e ∧ 2 ^ c2 ψ < h.R1 l ψ

private theorem kBound_le (K n n0 D : ℕ) (x : ℝ) (hx : 2 ≤ x) (hn : n ≤ n0) (hD : 0 < D)
    (hl : Real.log (D : ℝ) ≤ (n : ℝ) * Real.log x) :
    kBound (K : ℝ) 1 n D ≤ x ^ ((2 * n0) ^ K * (n0 + 1)) := by
  have hx0 : 0 < x := by linarith
  have hn' : (n : ℝ) ≤ n0 := by exact_mod_cast hn
  have hD' : (1 : ℝ) ≤ D := by exact_mod_cast hD
  have h2 : Real.log 2 ≤ Real.log x := Real.log_le_log (by norm_num) hx
  have hx1 : 0 ≤ Real.log x := Real.log_nonneg (by linarith)
  have h3 : Real.log (2 * (D : ℝ)) ≤ ((n0 : ℝ) + 1) * Real.log x := by
    rw [Real.log_mul (by norm_num) (by linarith)]
    nlinarith [mul_le_mul_of_nonneg_right hn' hx1]
  have h4 : 0 ≤ Real.log (2 * (D : ℝ)) := Real.log_nonneg (by linarith)
  unfold kBound
  rw [← Real.exp_log (pow_pos hx0 _), Real.exp_le_exp, Real.log_pow, Real.rpow_natCast]
  push_cast
  rw [mul_assoc ((2 * (n0 : ℝ)) ^ K)]
  refine mul_le_mul ?_ h3 h4 (by positivity)
  rw [mul_one]
  gcongr

private theorem nrm_le (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O] [Algebra ℤ_[l] O] (hT : eO l O ≠ ⊤)
    (a : ℕ∞) (m : ℕ) (h : a ≤ (m : ℕ∞) * eO l O) : a ≠ ⊤ ∧ Chr.nrm l O a ≤ m := by
  obtain ⟨k, hk⟩ := ENat.ne_top_iff_exists.1 hT
  rw [← hk] at h
  have hmk : (m : ℕ∞) * (k : ℕ∞) = ((m * k : ℕ) : ℕ∞) := by push_cast; rfl
  rw [hmk] at h
  have ha : a ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) h
  refine ⟨ha, ?_⟩
  lift a to ℕ using ha
  have h' : a ≤ m * k := by exact_mod_cast h
  unfold Chr.nrm
  rw [← hk]
  simp only [ENat.toNat_coe]
  rcases Nat.eq_zero_or_pos k with hk0 | hk0
  · simp [hk0]
  · rw [div_le_iff₀ (by exact_mod_cast hk0)]
    exact_mod_cast h'

theorem UpperTheory.V.HV.countVsPrime38 :
    GlobalTheory.Published.PoitouTateDuality → LocalFinitenessK → LocalTateDualityK → ∀ CK : ℝ, LemmaK CK → PrincipalCountVs38 := by
  intro hPT hLF hLT CK hK χ hprincipal
  obtain ⟨M, hM⟩ : ∃ M : ℕ, M = (Bchi χ).sup id := ⟨_, rfl⟩
  obtain ⟨n0, hn0⟩ : ∃ n0 : ℕ, n0 = 2 * ordC χ * (16 * ordC χ * (M * χ.N) ^ 2 * M ^ (2 * (4 * ordC χ).totient)) * M :=
    ⟨_, rfl⟩
  have hK' : LemmaK (⌈CK⌉₊ : ℝ) := Win.kmono CK _ (Nat.le_ceil CK) hK
  refine ⟨(2 * n0) ^ ⌈CK⌉₊ * (n0 + 1) + 2, ?_⟩
  intro h hχ t hbig Ω _ _ _ l _ c e hl2 he0 het ψ hψX hP
  obtain ⟨⟨hlB, he1⟩, hR⟩ := hP
  subst he1
  subst hχ
  haveI := c.dvr
  haveI := c.fin
  have hlp : l.Prime := Fact.out
  have hl2' : 2 ≤ l := hlp.two_le
  obtain ⟨hIs, -⟩ := (Host.mem_X h).1 hψX
  have hNpos : 0 < h.N := Host.N_pos h
  have hN2 : 2 ≤ h.N := le_trans (by norm_num) (Nat.le_of_dvd hNpos (hostIndex h).2.2.1)
  have hlM : l ≤ M := by rw [hM]; exact Finset.le_sup (f := id) hlB
  have hord := vsOrd h c.O ψ hIs l hlp hl2 hR
  have hordM : orderOf ψ * l ≤ n0 := by
    rw [hn0]
    refine Nat.mul_le_mul (le_trans hord ?_) hlM
    show 2 * ordC h.chi * (16 * ordC h.chi * (l * h.chi.N) ^ 2 * l ^ (2 * (4 * ordC h.chi).totient)) ≤ _
    gcongr
  have hq : h.q = 1 := hprincipal
  have hi := hostIndex h
  have ho : h.o = 1 := by have := hi.2.2.2.1; have := hi.2.2.2.2.1; omega
  have hHidx : ¬ l ∣ h.H.index := by
    intro hdiv
    have hh := hdiv.trans hi.1
    rw [ho, mul_one] at hh
    exact hl2 ((Nat.prime_dvd_prime_iff_eq hlp Nat.prime_two).mp (hlp.dvd_of_dvd_pow hh))
  have hkidx : ψ.toUnitHom.ker.index ∣ h.H.index := by
    have hsub : h.H ≤ ψ.toUnitHom.ker := hIs
    have hx := Subgroup.relIndex_inf_mul_relIndex h.H ψ.toUnitHom.ker ⊤
    rw [inf_top_eq, Subgroup.relIndex_top_right, Subgroup.relIndex_top_right, inf_eq_left.mpr hsub] at hx
    rw [← hx]
    exact dvd_mul_left _ _
  have hpidx : ¬ l ∣ ψ.toUnitHom.ker.index := fun hd => hHidx (hd.trans hkidx)
  obtain ⟨L, _, _, _, _, _, hMu, hdeg, hcyc, hgal, hLprime⟩ := vsFieldPrime38 Ω l hl2 c.O h.N ψ hpidx
  obtain ⟨D⟩ := ldata_nonempty (F := L) (Ω := Ω) l
  have hdegn : Module.finrank ℚ L ≤ n0 := le_trans hdeg hordM
  have hsha : shaLen D ((1 : ℕ) : ℤ) ≤ VLen D ((1 : ℕ) : ℤ) := PropA.shaLeV hPT hLF hLT L Ω l (Or.inl hl2) D _
  have hkl := Win.klen _ hK' l L Ω D hMu 1 le_rfl
  obtain ⟨m1, hm1⟩ : ∃ m1 : ℕ, VLen D ((1 : ℕ) : ℤ) = m1 := ⟨_, (ENat.coe_toNat hkl.1).symm⟩
  have hup := Chr.upVPrime38 ℚ Ω L l c.O D 1 (Chr.dirG ℚ Ω ψ) hgal hLprime
  have heO : eO l c.O ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) (dvrFacts l c.O).2.2.2.2.2.2.1
  have hV : Vlen Ω c 1 ψ ≤ (m1 : ℕ∞) * eO l c.O := by
    calc Vlen Ω c 1 ψ ≤ Chr.V l 1 (Chr.dirG ℚ Ω ψ) := Chr.V'_le_V (k := ℚ) (Ω := Ω) l h.N 1 (Chr.dirG ℚ Ω ψ)
      _ ≤ shaLen D ((1 : ℕ) : ℤ) * eO l c.O := hup
      _ ≤ VLen D ((1 : ℕ) : ℤ) * eO l c.O := by gcongr
      _ = _ := by rw [hm1]
  obtain ⟨hne, hnrm⟩ := nrm_le l c.O heO _ _ hV
  refine ⟨hne, ?_⟩
  have hD : 0 < (discr L).natAbs := Int.natAbs_pos.2 (discr_ne_zero L)
  have hx2 : (2 : ℝ) ≤ (l : ℝ) * h.N := by
    have : (2 : ℝ) ≤ l := by exact_mod_cast hl2'
    have : (2 : ℝ) ≤ h.N := by exact_mod_cast hN2
    nlinarith
  have hlogD : Real.log ((discr L).natAbs : ℝ) ≤ (Module.finrank ℚ L : ℝ) * Real.log ((l : ℝ) * h.N) := by
    have := Win.disc L (l * h.N) (Nat.mul_pos (by omega) hNpos) hcyc
    push_cast at this
    exact this
  have hkb := kBound_le ⌈CK⌉₊ (Module.finrank ℚ L) n0 (discr L).natAbs ((l : ℝ) * h.N) hx2 hdegn hD hlogD
  set x : ℝ := (l : ℝ) * h.N with hx
  set A : ℕ := (2 * n0) ^ ⌈CK⌉₊ * (n0 + 1) with hA
  have hx' : 2 ≤ x := hx2
  have hv : Vn Ω c 1 ψ ≤ 2 * x ^ A := by
    have hk := hkl.2
    rw [hm1, ENat.toNat_coe] at hk
    exact hnrm.trans (hk.trans (mul_le_mul_of_nonneg_left hkb (by norm_num)))
  have hl1 : (1 : ℝ) ≤ l := by exact_mod_cast hlp.one_lt.le
  have hy0 : 0 ≤ Real.log (l : ℝ) := Real.log_nonneg hl1
  have hyl : Real.log (l : ℝ) ≤ l := (Real.log_le_sub_one_of_pos (by linarith)).trans (by linarith)
  have hN2' : (2:ℝ) ≤ h.N := by exact_mod_cast hN2
  have hlx : (l : ℝ) ≤ x := by rw [hx]; nlinarith
  change Vn Ω c 1 ψ * Real.log (l : ℝ) ≤ x ^ (A + 2)
  calc _ ≤ 2 * x ^ A * Real.log (l : ℝ) := mul_le_mul_of_nonneg_right hv hy0
    _ ≤ 2 * x ^ A * x := mul_le_mul_of_nonneg_left (hyl.trans hlx) (by positivity)
    _ ≤ x ^ (A + 2) := by
      rw [pow_add]
      have hpos : 0 ≤ x ^ A * x := by positivity
      nlinarith [mul_nonneg (sub_nonneg.mpr hx') hpos]


theorem UpperTheory.V.HV.countVsPrimeReplay38
    (hPT : GlobalTheory.Published.PoitouTateDuality) (hLF : LocalFinitenessK)
    (hLT : LocalTateDualityK) (CK : ℝ) (hK : LemmaK CK) : PrincipalCountVs38 := by
  first
  | (rh_reduce 2 using [countVsPrime38]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countVsPrime38 hPT hLF hLT CK hK

rh_scan UpperTheory.V.HV.countVs limit 2000
rh_scan UpperTheory.V.HV.countVsPrime38 limit 2000
rh_scan UpperTheory.V.Chr.upVPrime38 limit 2000
rh_prune UpperTheory.V.HV.countVsPrimeReplay38 as RH38CountVsPruned
#print axioms UpperTheory.V.HV.countVs
#print axioms UpperTheory.V.HV.vsFieldPrime38
#print axioms UpperTheory.V.Chr.upVPrime38
#print axioms UpperTheory.V.HV.countVsPrime38
end
