import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN40 literature lane 9, 25 November 2026. SOURCE-MATCHED human proof of
a classical mod-l estimate; PREPARED Lean adapter, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, original mission
4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d; mandatory engine read.
SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS
8db0201d, continuity 61459cfd; relevant portions of state/handoff read.
Peers integration a5f9e0570 (RUN41), Galois 51654a1e, theta f1f5fe71,
structure 24d47ed6, Landau 96f96c3c inspected; RUN39 retained.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed newer upstream
686902ae1da717a63faf52d2dc6a50e5722942cd (not substituted).
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: replace the three duality/finiteness premises of the actual
K.lemmaK_of (alternative arithmetic branch) by its single mod-l
cardinality input, with an independent classical derivation even
sharper than the consumed bound. This is NOT a proof of the native
KBridge, nor a global elimination of PT/LF/LT (Sha, CountIV and
other consumers keep them).

Same field L, l prime, L totally imaginary, HasMuQ l L, D native
LData, e any integer. Put S={v|l}, s=|S|>=1, n=[L:Q], R=O_L[1/l],
X=H^2(G_{L,S},Z_l(e+1)). Native D.hS and hchi fix these data;
native chiTriv identifies the residual action as trivial.
Then Z_l(e+1)/l is isomorphic to mu_l as G_{L,S}-module.
The continuous cochain complexes give an exact coefficient sequence:
reduction surjects degreewise by choosing a finite set section of
Z_l -> F_l (continuous because F_l is discrete), and division by l
on l Z_l is continuous. In particular X/lX injects into
H^2(G_{L,S},mu_l). No H^3 vanishing or local duality is needed for
this injection. More elementarily, if a reduced cocycle is a
coboundary, lift its degree-one primitive, subtract its coboundary
and divide the resulting l-divisible cocycle by l; the resulting
class gives the required preimage in X.

Conrad–Masullo, Etale cohomology of algebraic number fields,
https://math.stanford.edu/~conrad/BSDseminar/Notes/L4.pdf,
Theorem 6.1.1 p44 and Appendix A pp47-49, directly compare the
finite coefficient group with H^2_et(R,mu_l) (order l invertible).
Their p48 Kummer exact sequence and Dedekind-scheme Brauer
description give
  0 -> Pic(R)/l -> H^2_et(R,mu_l) -> Br(R)[l] -> 0.
The quotient Pic(R) of Cl(O_L) is finite. The Brauer group of
R consists of classes locally trivial outside S; complex places
contribute zero. Albert–Brauer–Hasse–Noether plus the local
invariant isomorphism gives Br(R)[l] ~= ker(F_l^s -> F_l, sum),
so card = l^(s-1). Thus the strongest local statement is
  card(X/lX) <= card(Pic(R)/l) * l^(s-1)
             <= classNumber L * l^(n-1).
Here s<=n by sum of local degrees, s>=1 by lying over.
For the consumed interface weaken to classNumber L * l^n.
No assumed RH, no growth limit from finite tests. No additional
conjectural premise in the human argument. The native comparison
from continuous cocycles and lpow to this classical formula is
still an explicit formal premise ModCard40, not an axiom admitted
as a theorem. The external comparison's proof uses class field
theory; it is not being treated as kernel evidence.
Alternative literature reference: Colliot-Thélène–Skorobogatov,
The Brauer–Grothendieck Group, Ch 3 (local invariants and residues).
Negative control: s=1 gives no Brauer l-torsion; dropping the sum
relation gives l instead of 1. With real places and l=2 the formula
may fail; retain native totally complex condition.

Native source ledger (relative to AutomorphicVarieties):
GeneratorCountTuples/Reduction.lean 1cfb92c81ec5c4ed77aac5a7cce457add1e55721
GeneratorCountTuples/ChiTriv.lean 6aa3b87fd39127a7a5bf2162dff1fa6a43ff2444
GeneratorCountTuples/CardRed.lean 687dc64db008616c2c378cf471f7d233db5ff9ec
GeneratorCountTuples/NumGens.lean 4589c64172fee203f70d695109ed823dc7e1df0a
GeneratorCountTuples/NumFin.lean cdea1fa3945aef9d27013aa240a06c273901a28c
GeneratorCountTuples/CardH2QuotientLeSha.lean d0fb6c38a5b1c692fc1152ae78c479e9ba38345e
GeneratorCountTuples/LemmaK.lean 8726ea4259cd1f0fcb350eca97a3be2478261c87
GeneratorCountTuples/Bridge.lean c995485ab93aa56e1eabbdd1900429075fb4c65b
HermiteNormalForms/TorsMain.lean b1f243a54bfcf9e7c9f01a6cb6afb726c961a92c
HermiteNormalForms/Assembly.lean 2170a3e28188b4e75f62aade0ae9e7890155076c
src/Formalism/GaloisCohomology/Statement.lean 0799e9bcd8aa191ffaa90ab005453a53381bacea
Note correct native kBound C e n D = (2D)^((2en)^C), not (2Dn)^(Ce).

Original alternative graph: lemmaK -> lemmaK_of -> reduction ->
generators -> card_mod_le -> card_H2_quotient_le_sha(PT,LF,LT),
shaDualCard, chiTriv, shaZmCard. Also cardRed,tensCard,numFin,torsMain.
Candidate: lemmaK40 -> lemmaK_of40 -> reduction40 -> numGens(ModCard40),
same cardRed,tensCard,numFin,torsMain and KBridge. All quantifiers and
same-field contexts retained. Shared RUN39 route can feed this LemmaK
into ShaK using PT/LF/LT where those are still needed, and integration
RUN41 can use both in its actual siblings. No global graph deletion.
Native torsMain is a proved wrapper of torsBoundPow -> torsBound ->
tors_le, sx_exact, orb, stab, and numeric absorption. This is source
evidence only, not a transitive axiom audit. Keep all original graphs,
unresolved nodes and prior axiom evidence. Cache by pin, toolchain,
D,L,Omega,l,e, exact hypotheses, role and consumer. No URT test needed.

Execution: 10 fail-on-error source transformation checks in connector
JS; exact native reduction body preserved except local supplier.
Local lean/lake absent. Historical CI status files for 45577239749
and 45576756833 read, returncode 0 (blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717); no new native
verification. This overlay has not been queued or compiled. No
new axiom result. Backtrack to original card_mod_le if comparison
fails. Native baseline ModCard40 is directly supplied by card_mod_le,
so original-statement bridge also provided, not a shortcut through RH.

RESUME HERE: compile this independent overlay with native engines;
audit axiom/constructor graphs, then implement the finite-coefficient
Kummer comparison or use the existing native baseline bridge.
Connect to RUN39/peer RUN41 only after checking this local replacement.
Do not claim removal of duality from the whole VWin. Continue
independent KBridge and torsMain authentication.
HANDOFF TO kernel, integration, audit, Galois.
-/

noncomputable section

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology GlobalTheory.TateLimit
open scoped TensorProduct
open UpperTheory.V UpperTheory.V.K
namespace RHLiterature40

def ModCard40 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω l),
    IsTotallyComplex L → HasMuQ l L → ∀ e : ℤ,
      Nat.card (H2 (zlTw D (e + 1)) ⧸ lpow l (H2 (zlTw D (e + 1))) 1)
        ≤ classNumber L * l ^ Module.finrank ℚ L

theorem native_mod40
    (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) : ModCard40 := by
  intro l _ L Ω _ _ _ _ _ D hL hμ e
  exact UpperTheory.V.K.card_mod_le hP hF hT D hL hμ e

private theorem tensCard' (l : ℕ) [Fact l.Prime] (H : Type) [AddCommGroup H] [inst : Module ℤ H]
    [Finite (AddCommGroup.torsion H)] (Y : Submodule ℤ_[l] (ℤ_[l] ⊗[ℤ] H)) [Finite Y] :
    Nat.card Y ≤ Nat.card (AddCommGroup.torsion H) := by
  obtain rfl : inst = AddCommGroup.toIntModule H := Subsingleton.elim _ _
  exact tensCard l H Y

section

variable {l : ℕ} [Fact l.Prime] {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
  (D : LData L Ω l) (hL : IsTotallyComplex L) (hμ : HasMuQ l L)

include hL hμ

theorem reduction40 (hM : ModCard40) (hK : KBridge) (e : ℕ) (he : 1 ≤ e) [Finite (torsHGL L (4 * e + 4) (2 * e))] :
    Finite (H2 (zlTw D ((e : ℤ) + 1))) ∧
      Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤
        4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) * ((2 * (e : ℝ)) * (2 * (e : ℝ) + 3)) *
          Real.log ((Module.finrank ℚ L : ℝ) + 1) + Real.log (Nat.card (torsHGL L (4 * e + 4) (2 * e))) := by
  obtain ⟨K, _, _, _, p, h, hp, hh⟩ := hK l L Ω D hL hμ e he
  have hfin : Finite (H2 (zlTw D ((e : ℤ) + 1))) := Finite.of_surjective p hp
  refine ⟨hfin, ?_⟩
  have hr : Finite (LinearMap.range h) := Finite.of_surjective h.rangeRestrict h.surjective_rangeRestrict
  have h1 := (cardRed l K _ _ p h _ hp hh).trans
    (Nat.mul_le_mul_left _ (tensCard' l (HGL L (4 * e + 4) (2 * e)) (LinearMap.range h)))
  have hg := numGens l L _ (hM l L Ω D hL hμ (e : ℤ))
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

theorem lemmaK_of40 (hM : ModCard40) (hK : KBridge)
    (h : ∃ C, TorsBoundPow C) : ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  obtain ⟨C, h⟩ := h
  obtain ⟨CK, h0, H⟩ := numFin C
  refine ⟨CK, h0, fun l _ L Ω _ _ _ _ _ D hL hμ e he => ?_⟩
  obtain ⟨hf, hb⟩ := h L hL e he
  obtain ⟨h1, h2⟩ := reduction40 D hL hμ hM hK e he
  refine ⟨h1, h2.trans (le_trans ?_ (H e _ _ he Module.finrank_pos (Int.natAbs_pos.2 (discr_ne_zero L))))⟩
  gcongr

theorem lemmaK40 (hM : ModCard40) (hK : KBridge) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK :=
  lemmaK_of40 hM hK UpperTheory.V.KT.torsMain

theorem replay40 (hM : ModCard40) (hK : KBridge) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  first
  | (rh_reduce 2 using [lemmaK40]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact lemmaK40 hM hK

theorem original_bridge40
    (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) (hK : KBridge) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK :=
  replay40 (native_mod40 hP hF hT) hK

end RHLiterature40

rh_scan UpperTheory.V.K.lemmaK limit 2000
rh_scan UpperTheory.V.KT.torsMain limit 2000
rh_scan RHLiterature40.lemmaK40 limit 2000
rh_prune RHLiterature40.replay40 as RHLiterature40.ReplayPruned40
#print axioms UpperTheory.V.KT.torsMain
#print axioms RHLiterature40.native_mod40
#print axioms RHLiterature40.reduction40
#print axioms RHLiterature40.lemmaK40
#print axioms RHLiterature40.original_bridge40
