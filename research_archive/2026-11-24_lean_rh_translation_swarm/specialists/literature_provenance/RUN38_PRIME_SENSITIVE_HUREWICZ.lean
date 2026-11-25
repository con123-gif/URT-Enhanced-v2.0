import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WindowBoundOfLiteratureLevel
import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN38 literature, 25 Nov 2026. SOURCE-MATCHED human argument and PREPARED
adapter, NOT COMPILED, RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4,
SWARM, HANDOFF, EXPANSION, AGENTS and continuity consulted. Latest peer
de1f67ea (actual LemmaK fork), 2c98bf97 (direct Sha anchor), 4ff04116
(projected odd rank) read. Latest upstream observed 07be9a52ebbee066d706195cad0f6863880f9284,
not substituted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: prime-sensitive annihilation exponent c(l,e) = 0 if l>e+1,
1 if l=e+1, and e+3 otherwise. Under all RUN37 comparison hypotheses,
X=H2(GS,Z_l(e+1)) finite, T=tors H_(2e)(GL_(4e+4)(O_L),Z):
    log |X| <= c(l,e) log |X/lX| + log |T_l|.
In particular, for l>e+1 the entire generator/quotient loss disappears;
for e=1 all odd primes have c=0 and the dyadic prime has c=1.
This is a stronger local inequality for the alternative KBridge route,
not a bound on the actual prime window. No new conjectural hypothesis.

Proof: use the finite K-group comparison p:K -> X of RUN37, with
all its GS/etale, QL, finiteness and localization premises retained.
Mathew, Torsion exponents in stable homotopy and the Hurewicz
homomorphism, Thm 6.3, p10, https://arxiv.org/pdf/1501.07561 ,
gives the exact annihilator of the kernel via exp(tau_[1,2e-1] S^0)
for the connected infinite loop space BGL(O_L)^+.
Hatcher, Spectral Sequences, ch1 Thm 1.28 p40,
https://pi.math.cornell.edu/~hatcher/SSAT/SSch1.pdf ,
states Serre's first p-torsion result. Take sphere dimension large
relative to the fixed stem; stable stems are finite in positive degree.
Thus the l-local Postnikov interval is zero if 2e-1<2l-3, and is
a single shifted H(Z/l) if 2e-1=2l-3; the latter is killed by l.
Localization of the finite torsion Postnikov interval splits its
prime components, so the corresponding prime exponent of its
annihilator is 0 or 1. Multiplication by other prime factors is
invertible on K. Otherwise the uniform RUN37 estimate e+3 applies.
Consequently |l^c X| <= |im h| <= |T_l| by factorization through h,
and |X/l^c X| <= |X/lX|^c via its successive quotient filtration.
No norm loss or division by a zero factor. The Lean cardRed theorem
proves the analogous cardinality estimate even for a merely surjective
p, with total torsion |T| rather than primary |T_l|. That weaker bound
is the certificate below; primary refinement remains to formalize.

Independent primary-source audit of RUN37 stability prerequisite:
van der Kallen, Homology stability for linear groups (1980),
https://webspace.science.uu.nl/~kalle101/homstab1980.pdf ,
p273 section 2.2 and p289 theorem 4.11 inspected as page images.
Ring O_L is a commutative noetherian ring of dimension 1, so sdim=1
is allowed (Bass stable range). Thm 4.11 yields integral GL homology
isomorphisms for n>=2i+1. Therefore native n=4e+4 in degree 2e
suffices; even 4e+1 is enough. Tensor with Z_l is flat. This also
authenticates the classical stabilization range for the actual odd
rank branch in degree k+1 at n>=2(k+1)+4 (real coefficients by UCT).
No substitution of the source's explicit bar-chain SStab yet.

ROUTE CORRECTION (peer lane14): original actual caller uses
ZK.lemmaK_litN_alt, then ZK.lemmaK -> SNum/SFinal and BOdd,
NOT K.lemmaK from GeneratorCountTuples. RUN37/38 concern an
alternative supplier of the same LemmaK. Below window_sharp38 is
the exact actual caller body with only the hK producer replaced,
using the same hH, hK, hE, h4 and count consumers. No global node
retirement or claim that the original native theorem used KBridge.
Original graph retained: VWin -> ZK.lemmaK_litN_alt -> SNum/SFinal,
BOdd, sibling counts. Candidate VWin -> SharpBridge38 ->
K.lemmaK, PT/LF/LT/torsMain -> same LemmaK, sibling counts.
External comparison, stable homotopy and homology, torsion bounds,
full quantifiers and all original obligations stay in ledger.
Backtrack to original branch if candidate fails native replay.
Cache: pin/toolchain,L,l,e,D,GS,S,coefficient topology,rank,degree,
same hH/hK packet and proof branch. No URT advantage asserted.

Pinned source blobs relative to AutomorphicVarieties:
GeneratorCountTuples/Bridge.lean c995485ab93aa56e1eabbdd1900429075fb4c65b
GeneratorCountTuples/Reduction.lean 1cfb92c81ec5c4ed77aac5a7cce457add1e55721
GeneratorCountTuples/CardRed.lean 687dc64db008616c2c378cf471f7d233db5ff9ec
GeneratorCountTuples/TensCard.lean 674a872e24da91062c9d648b683a7a7502d37367
GeneratorCountTuples/LemmaKOfPublished.lean 82044f2422c5b48970bd94223e33087a7896fc40
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
ModularityArgument/ClassCounting/SFinal.lean a960a48653fa69c34f72f5f8ed434135ff1163a6
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/SBStarOdd.lean 3d2dd76f9cec2a817ba0788135969b561c1555fc
Actual execution: 6 fail-on-error literal source anchor checks, 9900
integer exponent comparisons in connector JS (not mathematical proof
or native execution); primary theorem pages inspected. Local Lean/Lake
absent on PATH. Baseline status JSON blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched; returncode 0 for
runs 45577239749 and 45576756833 only. New certificate not compiled or
queued. Axiom/scan commands are requests, not results.

RESUME HERE: batch replay this with peer actual caller cut and RUN37;
formalize the external GS/etale, QL and Hurewicz comparison in the
actual host, then sharpen native torsion cardinality to primary part.
Continue native ShaK/BOdd route independently; do not add both alternatives
as mandatory premises. Keep CountI/II/III/V/Vs, TopG and joint losses open.
HANDOFF TO integration, Galois, kernel, formal audit, acceleration.
-/

noncomputable section
open NumberField IsDedekindDomain ReciprocityTheory.Gal Formalism.ConjugateSelfDual Formalism.GaloisCohomology GlobalTheory.TateLimit
open scoped TensorProduct
namespace UpperTheory.V.K

def hurewiczExponent38 (l e : ℕ) : ℕ :=
  if e + 1 < l then 0 else if e + 1 = l then 1 else e + 3

theorem exponent_le38 (l e : ℕ) : hurewiczExponent38 l e ≤ e + 3 := by
  unfold hurewiczExponent38
  split_ifs <;> omega

def SharpBridge38 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (D : LData L Ω l), IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, 1 ≤ e →
      ∃ (K : Type) (_ : AddCommGroup K) (_ : Module ℤ_[l] K) (_ : Finite K)
        (p : K →ₗ[ℤ_[l]] H2 (zlTw D ((e : ℤ) + 1)))
        (h : K →ₗ[ℤ_[l]] ℤ_[l] ⊗[ℤ] HGL L (4 * e + 4) (2 * e)),
        Function.Surjective p ∧ ∀ x, h x = 0 → (l : ℤ_[l]) ^ hurewiczExponent38 l e • x = 0

theorem bridge_of_sharp38 (hK : SharpBridge38) : KBridge := by
  intro l _ L Ω _ _ _ _ _ D hL hμ e he
  obtain ⟨K, _, _, _, p, h, hp, hh⟩ := hK l L Ω D hL hμ e he
  refine ⟨K, _, _, _, p, h, hp, ?_⟩
  intro x hx
  have hc : e + 3 ≤ cOne (2 * e) := by
    have H := two_mul_cOne (2 * e)
    nlinarith [Nat.mul_le_mul_left e he]
  have hb := (exponent_le38 l e).trans hc
  obtain ⟨d, hd⟩ := Nat.exists_eq_add_of_le hb
  rw [hd, Nat.add_comm (hurewiczExponent38 l e) d, pow_add, mul_smul, hh x hx, smul_zero]

private theorem tensCard38 (l : ℕ) [Fact l.Prime] (H : Type) [AddCommGroup H] [inst : Module ℤ H]
    [Finite (AddCommGroup.torsion H)] (Y : Submodule ℤ_[l] (ℤ_[l] ⊗[ℤ] H)) [Finite Y] :
    Nat.card Y ≤ Nat.card (AddCommGroup.torsion H) := by
  obtain rfl : inst = AddCommGroup.toIntModule H := Subsingleton.elim _ _
  exact tensCard l H Y


theorem sharp_card38 (hK : SharpBridge38) {l : ℕ} [Fact l.Prime]
    {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω]
    [IsAlgClosure L Ω] (D : LData L Ω l) (hL : IsTotallyComplex L)
    (hμ : HasMuQ l L) (e : ℕ) (he : 1 ≤ e)
    [Finite (torsHGL L (4 * e + 4) (2 * e))] :
    Finite (H2 (zlTw D ((e : ℤ) + 1))) ∧
      Nat.card (H2 (zlTw D ((e : ℤ) + 1))) ≤
        Nat.card (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1) ^
          hurewiczExponent38 l e * Nat.card (torsHGL L (4 * e + 4) (2 * e)) := by
  obtain ⟨K, _, _, _, p, h, hp, hh⟩ := hK l L Ω D hL hμ e he
  have hfin : Finite (H2 (zlTw D ((e : ℤ) + 1))) := Finite.of_surjective p hp
  have hr : Finite (LinearMap.range h) := Finite.of_surjective h.rangeRestrict h.surjective_rangeRestrict
  exact ⟨hfin, (cardRed l K _ _ p h _ hp hh).trans
    (Nat.mul_le_mul_left _ (tensCard38 l (HGL L (4 * e + 4) (2 * e)) (LinearMap.range h)))⟩

theorem sharp_card_large38 (hK : SharpBridge38) {l : ℕ} [Fact l.Prime]
    {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω]
    [IsAlgClosure L Ω] (D : LData L Ω l) (hL : IsTotallyComplex L)
    (hμ : HasMuQ l L) (e : ℕ) (he : 1 ≤ e)
    [Finite (torsHGL L (4 * e + 4) (2 * e))] (hl : e + 1 < l) :
    Nat.card (H2 (zlTw D ((e : ℤ) + 1))) ≤ Nat.card (torsHGL L (4 * e + 4) (2 * e)) := by
  have h := (sharp_card38 hK D hL hμ e he).2
  simpa [hurewiczExponent38, hl] using h

end UpperTheory.V.K

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
open UpperTheory.Top
namespace UpperTheory.V.HV.DescentVanishingReductions
theorem window_sharp38 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hB : _root_.UpperTheory.V.K.SharpBridge38) : VWin :=
  have hK : ∃ CK : ℝ, UpperTheory.V.LemmaK CK := by
    obtain ⟨CK, _, hK⟩ := _root_.UpperTheory.V.K.lemmaK
      (_root_.UpperTheory.V.HV.U.pt_s hH.litN) hH.litN.coh.lfK hH.litN.coh.ltK
      (_root_.UpperTheory.V.K.bridge_of_sharp38 hB)
    exact ⟨CK, hK⟩
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.of_four_alt hH.litN hK (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

theorem replay_sharp38 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hB : _root_.UpperTheory.V.K.SharpBridge38) : VWin := by
  first
  | (rh_reduce 2 using [window_sharp38]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact window_sharp38 hH hB
end UpperTheory.V.HV.DescentVanishingReductions

rh_scan UpperTheory.V.K.sharp_card38 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_sharp38 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
rh_prune UpperTheory.V.HV.DescentVanishingReductions.replay_sharp38 as RH38SharpWindowPruned
#print axioms UpperTheory.V.K.bridge_of_sharp38
#print axioms UpperTheory.V.K.sharp_card38
#print axioms UpperTheory.V.K.sharp_card_large38
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_sharp38
end
