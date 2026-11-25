import Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.SoLocTors
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-! RUN40 audit: algebraic core of direct tame-inertia route.
PREPARED, not compiled. The local-field comparison and density
transport are separate obligations; see companion note. -/

open UpperTheory.V.X
namespace RHAuditTame40

theorem coc_pow_trivial {O G : Type} [CommRing O] [Group G]
    (θ : G →* Oˣ) (z : G → O) (hz : Coc θ z)
    (t : G) (ht : θ t = 1) (q : ℕ) :
    z (t ^ q) = (q : O) * z t := by
  have hzero : z 1 = 0 := by
    have h := hz 1 1
    simp only [one_mul, map_one, Units.val_one] at h
    linear_combination -h
  induction q with
  | zero => simp [hzero]
  | succ q ih =>
    rw [pow_succ, hz (t ^ q) t, ih, map_pow, ht, one_pow, Units.val_one]
    push_cast
    ring

theorem tame_cancel {O G : Type} [CommRing O] [IsDomain O] [Group G]
    (θ : G →* Oˣ) (z : G → O) (hz : Coc θ z)
    (F t : G) (q : ℕ) (ht : θ t = 1)
    (hrel : F * t = t ^ q * F)
    (hne : (θ F : O) ≠ (q : O)) : z t = 0 := by
  have h := congrArg z hrel
  rw [hz F t, hz (t ^ q) F, coc_pow_trivial θ z hz t ht q,
    map_pow, ht, one_pow, Units.val_one] at h
  have hmul : ((θ F : O) - (q : O)) * z t = 0 := by
    linear_combination h
  exact (mul_eq_zero.mp hmul).resolve_left (sub_ne_zero.mpr hne)

theorem normal_descend {O G : Type} [CommRing O] [IsDomain O] [Group G]
    (θ : G →* Oˣ) (z : G → O) (hz : Coc θ z)
    (H : Subgroup G)
    (hn : ∀ g h : G, h ∈ H → g * h * g⁻¹ ∈ H)
    (h0 : G) (hh0 : h0 ∈ H) (hθ : θ h0 ≠ 1)
    (hc : CobOn θ z H) : CobOn θ z ⊤ := by
  obtain ⟨a, ha, m, hm⟩ := hc
  let w : G → O := fun g => a * z g - ((θ g : O) * m - m)
  have hw : Coc θ w := by
    intro g h
    dsimp [w]
    rw [hz g h, map_mul, Units.val_mul]
    ring
  have hwH : ∀ h ∈ H, w h = 0 := by
    intro h hh
    exact sub_eq_zero.mpr (hm h hh)
  refine ⟨a, ha, m, ?_⟩
  intro g _
  let h' := g * h0 * g⁻¹
  have hh' : h' ∈ H := hn g h0 hh0
  have hprod : h' * g = g * h0 := by
    dsimp [h']
    group
  have hval : θ h' = θ h0 := by
    dsimp [h']
    simp [mul_comm, mul_left_comm, mul_assoc]
  have he : w g = (θ h0 : O) * w g := by
    calc
      w g = w (g * h0) := by rw [hw g h0, hwH h0 hh0, mul_zero, add_zero]
      _ = w (h' * g) := congrArg w hprod.symm
      _ = (θ h0 : O) * w g := by rw [hw h' g, hwH h' hh', zero_add, hval]
  have hnz : (θ h0 : O) - 1 ≠ 0 :=
    sub_ne_zero.mpr (fun h => hθ (Units.val_eq_one.1 h))
  have he' : ((θ h0 : O) - 1) * w g = 0 := by
    rw [sub_mul, one_mul, ← he, sub_self]
  exact sub_eq_zero.mp ((mul_eq_zero.mp he').resolve_left hnz)

theorem replay {O G : Type} [CommRing O] [IsDomain O] [Group G]
    (θ : G →* Oˣ) (z : G → O) (hz : Coc θ z)
    (F t : G) (q : ℕ) (ht : θ t = 1)
    (hrel : F * t = t ^ q * F)
    (hne : (θ F : O) ≠ (q : O)) : z t = 0 := by
  first
  | (rh_reduce 2 using [tame_cancel θ z hz F t q ht hrel hne]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact tame_cancel θ z hz F t q ht hrel hne

end RHAuditTame40

rh_scan UpperTheory.V.X.So.locTors limit 2000
rh_scan RHAuditTame40.tame_cancel limit 2000
rh_scan RHAuditTame40.normal_descend limit 2000
rh_prune RHAuditTame40.replay as RHAuditTame40.ReplayPruned
#print axioms UpperTheory.V.X.So.locTors
#print axioms RHAuditTame40.tame_cancel
#print axioms RHAuditTame40.normal_descend
#print axioms RHAuditTame40.replay
