import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN39 prime_window, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED.
RH OPEN. One local full-weight premise weakening at the actual LemmaK consumer,
not a repetition of the weight-one K2 literature lane.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine;
SWARM, HANDOFF, EXPANSION, AGENTS, continuity, state, living proof
10e3d636b345adbcae9ddb91820a3a93f59c93bc consulted.
Peers 8eef4b8a (native PropZ recovered), 678de808 (signed mean consumer),
2a39654b (K2 at e=1), e9256be1 and 21574277 (CountI), RUN38 31cc317d.
Upstream 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed
98d36aafeeb30c1f40fdda96c3574faa34dfa413 (25 Nov 18:21:56 UTC), not substituted.
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

SOURCE RECOVERY. GeneratorCountTuples/LemmaKOfPublished.lean
82044f2422c5b48970bd94223e33087a7896fc40 has actual theorem K.lemmaK,
calling lemmaK_of with KT.torsMain. The latter is not an extra hypothesis:
HermiteNormalForms/TorsMain.lean b1f243a54bfcf9e7c9f01a6cb6afb726c961a92c
and Assembly.lean 2170a3e28188b4e75f62aade0ae9e7890155076c give
torsBoundPow via sx_exact, orb, stab, torsBound_of and numT.
Do not infer independent verification of those premises from source recovery.

NEW WEAKER INTERFACE, all positive e, all original fields/coefficient primes.
Write X=H^2(zlTw D(e+1)), c=cOne(2e)=e(2e+5),
T=tors H_{2e}(GL_{4e+4}(O_L),Z).
KBridge demands a finite Z_l module K with surjection p:K->X and map
h:K->Z_l tensor H_GL whose entire kernel is killed by l^c.
The only cardinal input needed is:
             X finite AND |l^c X| <= |T|.
Proof of sufficiency: |X|=|X/l^c X|*|l^c X|
 <= |X/l X|^c*|T| by the native cardQuotPow filtration.
Taking logarithms yields exactly the input to native reduction, so existing
generators, numFin and torsMain give the original LemmaK for ALL e.
No separate module witness K, maps p,h, or ker h annihilation is required
from a replacement supplier; finiteness of X must NOT be dropped.
For compatibility, the original KBridge yields the weaker input: l^c p
kills ker h and descends to K/ker h, surjectively onto l^c X. Thus
|l^c X| <= |im h| <= |T| by the native tensCard (finite T supplied
by torsMain). The same argument even needs only l^c p(ker h)=0, not
l^c ker h=0. No division or norm bounds before exact quotient identity.
This is a genuine logical weakening of the finite-module interface:
for c=7, X=Z/l^9 and T=(Z/l)^2, |l^7 X|=l^2=|T|,
but there is no map from any subgroup of T onto cyclic l^7 X=Z/l^2.
This is a generic algebra negative control, not an actual number field
counterexample or simulation. No claim that the actual KBridge is false.
The power-image estimate itself remains OPEN for actual cohomology.

Other source anchors in GeneratorCountTuples:
Bridge.lean c995485ab93aa56e1eabbdd1900429075fb4c65b
Reduction.lean 1cfb92c81ec5c4ed77aac5a7cce457add1e55721
CardRed.lean 687dc64db008616c2c378cf471f7d233db5ff9ec
CardQuotPow.lean 64a6ba6ce19fb69f85e78cbf57d7d817afa72c84
TensCard.lean 674a872e24da91062c9d648b683a7a7502d37367
LemmaK.lean 8726ea4259cd1f0fcb350eca97a3be2478261c87
NumFin.lean cdea1fa3945aef9d27013aa240a06c273901a28c.
Original source-visible local graph: K.lemmaK -> lemmaK_of -> reduction
-> KBridge + cardRed -> cardKill -> cardQuotPow; reduction also -> tensCard,
generators, cOne_le, primeLe; lemmaK_of -> numFin; KT.torsMain retained.
Candidate: lemmaK_power39 -> lemmaK_of_power39 -> reductionPower39
-> PowerBridge39 + cardPower39 -> cardQuotPow; other suppliers unchanged.
Compatibility bridge uses original KBridge and tensCard separately.
Original graph, all remaining root obligations and axiom evidence retained;
this is not a native graph closure. Cache key source+toolchain, l,L,Omega,D,
e, actual cohomology module, torsion target, PT/LF/LT, and uniform constants.
No URT claim. Actual JS source transformation 5 unique replacements
executed on pinned reduction/lemmaK_of, not a Lean check.
Lean/Lake unavailable. Re-read actual baseline CI status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 (returncode 0),
runs 45577239749 and 45576756833. No new native verification or axiom result.
RESUME HERE: use the existing pinned native runner for this candidate,
then find actual KBridge producer and prove the power-image estimate
directly from its comparison construction, checking all e and l uniformly.
Do not replace the original witness unless checked. Audit and integrate the
actual LemmaK caller; CountII/V, same-host geometry and RH remain open.
HANDOFF TO integration, Galois, literature, kernel, formal audit.
-/

noncomputable section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology GlobalTheory.TateLimit
open scoped TensorProduct

namespace UpperTheory.V.K

theorem powerImage39 (l : ℕ) [Fact l.Prime]
    (K X W : Type) [AddCommGroup K] [Module ℤ_[l] K] [Finite K]
    [AddCommGroup X] [Module ℤ_[l] X] [AddCommGroup W] [Module ℤ_[l] W]
    (p : K →ₗ[ℤ_[l]] X) (h : K →ₗ[ℤ_[l]] W) (c : ℕ)
    (hp : Function.Surjective p)
    (hk : ∀ x, h x = 0 → (l : ℤ_[l]) ^ c • p x = 0) :
    Finite X ∧ Nat.card (lpow l X c) ≤ Nat.card (LinearMap.range h) := by
  have hfin : Finite X := Finite.of_surjective p hp
  let f : K →ₗ[ℤ_[l]] X := (LinearMap.lsmul ℤ_[l] X ((l : ℤ_[l]) ^ c)) ∘ₗ p
  let g : K →ₗ[ℤ_[l]] lpow l X c := f.codRestrict (lpow l X c) (fun x => ⟨p x, rfl⟩)
  have hker : LinearMap.ker h ≤ LinearMap.ker g := by
    intro x hx
    apply LinearMap.mem_ker.mpr
    apply Subtype.ext
    exact hk x (LinearMap.mem_ker.mp hx)
  have hs : Function.Surjective g := by
    rintro ⟨y, hy⟩
    obtain ⟨z, hz⟩ := hy
    obtain ⟨k, rfl⟩ := hp z
    exact ⟨k, Subtype.ext hz⟩
  haveI : Finite (K ⧸ LinearMap.ker h) :=
    Finite.of_surjective _ (LinearMap.ker h).mkQ_surjective
  have hq : Nat.card (lpow l X c) ≤ Nat.card (K ⧸ LinearMap.ker h) := by
    refine Nat.card_le_card_of_surjective ((LinearMap.ker h).liftQ g hker) ?_
    intro y
    obtain ⟨k, rfl⟩ := hs y
    exact ⟨Submodule.Quotient.mk k, rfl⟩
  exact ⟨hfin, hq.trans_eq (Nat.card_congr h.quotKerEquivRange.toEquiv)⟩

theorem cardPower39 (l : ℕ) [Fact l.Prime] (X : Type)
    [AddCommGroup X] [Module ℤ_[l] X] [Finite X] (c b : ℕ)
    (hb : Nat.card (lpow l X c) ≤ b) :
    Nat.card X ≤ Nat.card (X ⧸ lpow l X 1) ^ c * b := by
  have hq := cardQuotPow l X c
  rw [Submodule.card_eq_card_quotient_mul_card (lpow l X c)]
  first
  | exact Nat.mul_le_mul hq hb
  | exact (Nat.mul_le_mul hb hq).trans_eq (mul_comm _ _)

def PowerBridge39 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (D : LData L Ω l), IsTotallyComplex L → HasMuQ l L →
    ∀ e : ℕ, 1 ≤ e →
      Finite (H2 (zlTw D ((e : ℤ) + 1))) ∧
      Nat.card (lpow l (H2 (zlTw D ((e : ℤ) + 1))) (cOne (2 * e))) ≤
        Nat.card (torsHGL L (4 * e + 4) (2 * e))

private theorem tensCard39 (l : ℕ) [Fact l.Prime] (H : Type)
    [AddCommGroup H] [inst : Module ℤ H]
    [Finite (AddCommGroup.torsion H)]
    (Y : Submodule ℤ_[l] (ℤ_[l] ⊗[ℤ] H)) [Finite Y] :
    Nat.card Y ≤ Nat.card (AddCommGroup.torsion H) := by
  obtain rfl : inst = AddCommGroup.toIntModule H := Subsingleton.elim _ _
  exact tensCard l H Y

theorem powerBridge_of_KBridge39 (hK : KBridge) : PowerBridge39 := by
  intro l _ L Ω _ _ _ _ _ D hL hμ e he
  obtain ⟨C, hT⟩ := UpperTheory.V.KT.torsMain
  haveI : Finite (torsHGL L (4 * e + 4) (2 * e)) := (hT L hL e he).1
  obtain ⟨K, _, _, _, p, h, hp, hh⟩ := hK l L Ω D hL hμ e he
  haveI : Finite (LinearMap.range h) := Finite.of_surjective h.rangeRestrict h.surjective_rangeRestrict
  have H := powerImage39 l K _ _ p h _ hp (fun x hx => by rw [← map_smul, hh x hx, map_zero])
  exact ⟨H.1, H.2.trans (tensCard39 l _ (LinearMap.range h))⟩

section
variable (hP : GlobalTheory.Published.PoitouTateDuality) (hF : LocalFinitenessK) (hT : LocalTateDualityK)
  {l : ℕ} [Fact l.Prime] {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
  (D : LData L Ω l) (hL : IsTotallyComplex L) (hμ : HasMuQ l L)

include hP hF hT hL hμ

theorem reductionPower39 (hK : PowerBridge39) (e : ℕ) (he : 1 ≤ e) [Finite (torsHGL L (4 * e + 4) (2 * e))] :
    Finite (H2 (zlTw D ((e : ℤ) + 1))) ∧
      Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤
        4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) * ((2 * (e : ℝ)) * (2 * (e : ℝ) + 3)) *
          Real.log ((Module.finrank ℚ L : ℝ) + 1) + Real.log (Nat.card (torsHGL L (4 * e + 4) (2 * e))) := by
  obtain ⟨hfin, hpow⟩ := hK l L Ω D hL hμ e he
  letI : Finite (H2 (zlTw D ((e : ℤ) + 1))) := hfin
  refine ⟨hfin, ?_⟩
  have h1 := cardPower39 l (H2 (zlTw D ((e : ℤ) + 1))) (cOne (2 * e))
    (Nat.card (torsHGL L (4 * e + 4) (2 * e))) hpow
  have hg := generators hP hF hT D hL hμ (e : ℤ)
  have hq : Finite (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1) :=
    Finite.of_surjective _ (Submodule.mkQ_surjective _)
  set a := Nat.card (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1) with ha
  set b := Nat.card (torsHGL L (4 * e + 4) (2 * e)) with hb
  have ha0 : (0 : ℝ) < a := by exact_mod_cast (Nat.card_pos : 0 < a)
  have hb0 : (0 : ℝ) < b := by exact_mod_cast (Nat.card_pos : 0 < b)
  have hx0 : (0 : ℝ) < Nat.card (H2 (zlTw D ((e : ℤ) + 1))) := Nat.cast_pos.2 Nat.card_pos
  have h2 : Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤ cOne (2 * e) * Real.log a + Real.log b := by
    rw [← Real.log_pow, ← Real.log_mul (by positivity) hb0.ne']
    exact Real.log_le_log hx0 (by exact_mod_cast h1)
  have hc : (cOne (2 * e) : ℝ) ≤ (2 * (e : ℝ)) * (2 * (e : ℝ) + 3) := by exact_mod_cast cOne_le (2 * e)
  have hl : Real.log l ≤ Real.log ((Module.finrank ℚ L : ℝ) + 1) :=
    Real.log_le_log (by exact_mod_cast (Fact.out : l.Prime).pos) (by exact_mod_cast primeLe l L hμ)
  have hD : (1 : ℝ) ≤ ((discr L).natAbs : ℝ) := by exact_mod_cast Int.natAbs_pos.2 (discr_ne_zero L)
  have hlog : 0 ≤ Real.log (2 * ((discr L).natAbs : ℝ)) := Real.log_nonneg (by linarith)
  have hn : 0 ≤ Real.log ((Module.finrank ℚ L : ℝ) + 1) :=
    Real.log_nonneg (le_add_of_nonneg_left (Nat.cast_nonneg _))
  have h3 : Real.log a ≤ 4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) *
      Real.log ((Module.finrank ℚ L : ℝ) + 1) := hg.trans (mul_le_mul_of_nonneg_left hl (by positivity))
  have h4 := mul_le_mul hc h3 (Real.log_natCast_nonneg a) (by positivity)
  linarith

end

theorem lemmaK_of_power39 (hP : GlobalTheory.Published.PoitouTateDuality) (hF : LocalFinitenessK) (hT : LocalTateDualityK) (hK : PowerBridge39)
    (h : ∃ C, TorsBoundPow C) : ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  obtain ⟨C, h⟩ := h
  obtain ⟨CK, h0, H⟩ := numFin C
  refine ⟨CK, h0, fun l _ L Ω _ _ _ _ _ D hL hμ e he => ?_⟩
  obtain ⟨hf, hb⟩ := h L hL e he
  obtain ⟨h1, h2⟩ := reductionPower39 hP hF hT D hL hμ hK e he
  refine ⟨h1, h2.trans (le_trans ?_ (H e _ _ he Module.finrank_pos (Int.natAbs_pos.2 (discr_ne_zero L))))⟩
  gcongr


theorem lemmaK_power39 (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) (hK : PowerBridge39) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK :=
  lemmaK_of_power39 hP hF hT hK UpperTheory.V.KT.torsMain

theorem lemmaK_replay39 (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) (hK : KBridge) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  have hpow := powerBridge_of_KBridge39 hK
  first
  | (rh_reduce 2 using [lemmaK_power39]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact lemmaK_power39 hP hF hT hpow

end UpperTheory.V.K

rh_scan UpperTheory.V.K.lemmaK limit 2000
rh_scan UpperTheory.V.K.reduction limit 2000
rh_scan UpperTheory.V.K.lemmaK_power39 limit 2000
rh_prune UpperTheory.V.K.lemmaK_replay39 as RH39LemmaKPruned
#print axioms UpperTheory.V.K.lemmaK
#print axioms UpperTheory.V.KT.torsMain
#print axioms UpperTheory.V.K.powerImage39
#print axioms UpperTheory.V.K.cardPower39
#print axioms UpperTheory.V.K.powerBridge_of_KBridge39
#print axioms UpperTheory.V.K.lemmaK_power39
#print axioms UpperTheory.V.K.lemmaK_replay39
end
