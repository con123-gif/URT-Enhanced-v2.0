import RUN37_RESIDUAL_PARITY_DESCENT
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.EqOfIndexTwo
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CompIne
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CompAlg
import RHProofTermPrune
import RHRecursiveReductionAutoV3

/-!
RUN38 lane 5, 25 Nov 2026. SOURCE-MATCHED HUMAN PROOF; LEAN PREPARED,
NOT COMPILED. RH OPEN. Latest mission f8b4b837301f8cf43d673be4979f04c4e4b415a4
including unified engine, SWARM, HANDOFF, EXPANSION, AGENTS, continuity,
research state and research protocol consulted. Native pin
40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream observed
07be9a52ebbee066d706195cad0f6863880f9284, not substituted.
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Peers: audit 215742774c39d40841de648572c82d21ed7098eb, shared
ramification 32ae80bb, four-count VWin core f26f77b4, tower image c28ee336.
The audit excludes exceptional CaseI primes but leaves explicit common
inertia-generator and square hypotheses. Here these are replaced by
the already-native inertia exponent detector, without choosing a generator.

Fix the actual GD data for two characters psi, psi' with identical
Omega,K,l,c,N,e. Put U = reduction on units of c.O, P = Psi_e(psi),
Q = Psi_e(psi'). Their restricted residual traces are equal.
RUN34 implies either U(P)=U(Q) on G_K or U(P)U(Q)=1 there.
The equality alternative is handled by RUN37 parity descent.

For the inverse alternative, choose any place A over l by Chr.placesQ.
gdIff supplies GDlit, and gdLoc gives I_A <= G_K.
The native Teichmuller character w has order l-1 and reduces to chiO.
The two dirG characters on I_A are powers w^a and w^b, with
(l-1)|2a and (l-1)|2b, by GDlit; the two choices of w coincide by omT.
Consequently the inverse equation on all of I_A reads
    U(w(g))^(2e+a+b)=1.
If l does not divide N, compAlg/compIne give both dirG characters
equal to one on inertia, so U(w(g))^(2e)=1 instead.
In the general branch square the inverse equation and cancel the
two torsion factors w^(2a)=w^(2b)=1, yielding U(w(g))^(4e)=1.
For either exponent j=2e or 4e, x=w(g)^j has x^(l-1)=1;
congrFacts lifts U(x)=1 to x=1 because l does not divide l-1.
Native omT inertia detection now implies (l-1)|j.
The unramified case contradicts GD.gen; the other contradicts the
audit's native CaseI guard (l-1) not dividing 4e when l|N.
No residue field extension, primitive inertia element, or explicit
nontrivial square witness is required. The inverse alternative is
impossible, and parity descent gives psi=psi'.

This supplies the native local bridge for cross-character separation
at the principal-host singleton consumer. It does not yet supply
the actual isomorphic-representation trace equality or instantiate
RUN37's coefficient norm bound. The singleton integer is still
chosen before coefficient prime l, at reference p=1 mod 210N;
do NOT replace native CountI's distinct fixed r_i<q1,d guards
by this host-dependent reference. Retain original orbit route.
The two-prime aggregate <=2 log B remains conditional on replay
of RUN34-38, the native NumberU3U_s supplier, Linnik and actual
same-host integration. No new root obligation kernel-closed.

Pinned sources (relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties):
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
HeightAndVanishing/EtaKer.lean 7b951e490ab942b2730697ba2f5faa598ff2ca7c
HeightAndVanishing/GdIffIndex.lean c28e5e251291dc9e8944b2ea384e93c67c79830b
HeightAndVanishing/EqOfIndexTwo.lean 166bb73950688146c0fe636a620efeef6ce68da2
HeightAndVanishing/ExistsStrictHenselianAbsolutelyClosedLocalRing.lean d9b054feb921717a3348200bb414fb746b63a8e7
HeightAndVanishing/CompIne.lean 1fccdb32c84268d3197dc522ff99eaa6cee1f3e7
HeightAndVanishing/CompAlg.lean d6a22e7b9546d5fd524c816a07c17de4b6348f0a
HeightAndVanishing/CongrFacts.lean d1f46a193c0ee5bd6a291b6180dc774703fa2d58
Previous RUN37 blob ba86527771dc0e302a1f7c6520d3ffd36329fb17.

Original graph (source-level): countI <- CorGK <- PropGK <-
NumberU3U_s, OneCharU_s, orbitwise bound.
Reduced graph: OneCharU residual witness -> common trace reduction ->
inversion_global -> native inertia exponent exclusion (this file)
or direct equality -> RUN37 parity descent -> hsep -> singleton
budget -> two-prime patch -> principal-host candidate.
Cache context: source/toolchain/h,N,e,l,c,Omega,K,psi,psi',place A;
reference p, sigma, integer witness remain fixed at the consumer.
No deletion of source, graph, or earlier axiom evidence. The
explicit-generator route is retained for backtracking. No URT
performance evidence; exact cancellation suffices.

Executed: retrieved and inspected pinned declarations above.
No local lean/lake. Baseline CI status JSON b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 both status pass,
returncode 0 (45577239749,45576756833). Latest 45695921443 pending;
45695678498 cancelled. Neither validates this certificate. Native
scan/prune and search commands below prepared only. No synthetic
substitute or claimed kernel validation.

RESUME HERE: compile RUN34-38 with peer audit in shared pinned
runner. Finish actual trace equality from RepIso and integral
coefficient norm specialization, then instantiate the native
CaseI guard and full h.X singleton budget at principal consumer.
Check both auxiliary-prime quantifier orders and Linnik separately.
Keep all actual VWinAt same-host and analytic leaves; do not
import claimed RH. HANDOFF TO integration, kernel, formal audit.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual
open Formalism.HC ReciprocityTheory.Gal Formalism.GaloisCohomology
open UpperTheory.V UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV
open IsLocalRing

namespace RHGalois38
noncomputable section

theorem native_inertia_exponent
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l)
    (w : G ℚ Ω →* c.Oˣ) (hw : IsOmT c w)
    (A : ValuationSubring Ω) (hA : A.valuation (l : Ω) < 1)
    (j : ℕ)
    (hr : ∀ g ∈ Ine (F := ℚ) A,
      (Units.map (residue c.O).toMonoidHom (w g)) ^ j = 1) :
    l - 1 ∣ j := by
  haveI := c.dvr
  haveI := c.fin
  have hp : l.Prime := Fact.out
  have hn : ¬ l ∣ l - 1 := Nat.not_dvd_of_pos_of_lt (by have := hp.two_le; omega) (by have := hp.two_le; omega)
  apply (omT Ω l c).2 w hw |>.2.2.2.2.2.2.1 A hA j
  intro g hg
  rw [MonoidHom.mem_ker, MonoidHom.pow_apply]
  have hpow : w g ^ (l - 1) = 1 := by
    rw [← MonoidHom.pow_apply, hw.1, MonoidHom.one_apply]
  have hxpow : (w g ^ j) ^ (l - 1) = 1 := by
    rw [← pow_mul, Nat.mul_comm j (l - 1), pow_mul, hpow, one_pow]
  have hred : Units.map (residue c.O).toMonoidHom (w g ^ j) = 1 := by
    rw [map_pow]
    exact hr g hg
  have hm : ((w g ^ j : c.Oˣ) : c.O) - ((1 : c.Oˣ) : c.O) ∈ maximalIdeal c.O := by
    apply (Ideal.Quotient.eq).mp
    exact congrArg Units.val hred
  exact (congrFacts Ω l c).2.2.2.1 _ _ (l - 1) hn hxpow (one_pow _) hm

theorem native_inverse_excluded
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (K : Type) [Field K] [NumberField K] [Algebra K Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l)
    (N : ℕ) [NeZero N] (e : ℕ) (ψ ψ' : DirichletCharacter c.O N)
    (hG : GD Ω K l e ψ) (hG' : GD Ω K l e ψ')
    (hguard : ¬ l ∣ N ∨ ¬ l - 1 ∣ 4 * e)
    (hinv : ∀ g ∈ galOf ℚ K Ω,
      Units.map (residue c.O).toMonoidHom (Chr.Psi l e (Chr.dirG ℚ Ω ψ) g) *
      Units.map (residue c.O).toMonoidHom (Chr.Psi l e (Chr.dirG ℚ Ω ψ') g) = 1) :
    False := by
  classical
  haveI := c.dvr
  haveI := c.fin
  have hp : l.Prime := Fact.out
  obtain ⟨w, η, a, hL⟩ := (gdIff Ω K l c e N ψ).1.mp hG
  obtain ⟨w', η', b, hL'⟩ := (gdIff Ω K l c e N ψ').1.mp hG'
  obtain ⟨w0, hw0, hu⟩ := (omT Ω l c).1
  have hww : w' = w := (hu w' hL'.om).trans (hu w hL.om).symm
  subst w'
  obtain ⟨A, hA⟩ := (Chr.placesQ Ω).1 l hp
  have hI := ((gdLoc Ω K l c e N ψ w η a hL).1 A hA).1
  let U := Units.map (residue c.O).toMonoidHom
  have hc : ∀ g : G ℚ Ω, U (chiO ℚ Ω l c.O g) = U (w g) := by
    intro g
    apply Units.ext
    exact ((Ideal.Quotient.eq).mp (hL.om.2 g)).symm
  have hP (χ : DirichletCharacter c.O N) (g : G ℚ Ω) :
      U (Chr.Psi l e (Chr.dirG ℚ Ω χ) g) =
        U (w g) ^ e * U (Chr.dirG ℚ Ω χ g) := by
    have he : Chr.Psi l e (Chr.dirG ℚ Ω χ) =
        chiO ℚ Ω l c.O ^ e * Chr.dirG ℚ Ω χ := by simp [Chr.Psi]
    rw [he, MonoidHom.mul_apply, MonoidHom.pow_apply, map_mul, map_pow, hc]
  rcases hguard with hN | h4
  · have htriv (χ : DirichletCharacter c.O N) :
        Ine (F := ℚ) A ≤ (Chr.dirG ℚ Ω χ).ker := by
      apply ((compIne Ω N l hp A hA).2 c.O χ).2.mpr
      exact ((compAlg c.O N l hp).2.2.2.2.2.1 χ).2.2.1 hN
    apply hG.gen
    apply native_inertia_exponent Ω l c w hL.om A hA (2 * e)
    intro g hg
    have hh := hinv g (hI hg)
    change U (Chr.Psi l e (Chr.dirG ℚ Ω ψ) g) *
      U (Chr.Psi l e (Chr.dirG ℚ Ω ψ') g) = 1 at hh
    rw [hP, hP, MonoidHom.mem_ker.mp (htriv ψ hg),
      MonoidHom.mem_ker.mp (htriv ψ' hg), map_one, mul_one, mul_one,
      ← pow_add, ← two_mul] at hh
    exact hh
  · have ha2 : w ^ (2 * a) = 1 := by
      obtain ⟨k, hk⟩ := hL.two_a
      rw [hk, pow_mul, hL.om.1, one_pow]
    have hb2 : w ^ (2 * b) = 1 := by
      obtain ⟨k, hk⟩ := hL'.two_a
      rw [hk, pow_mul, hL.om.1, one_pow]
    apply h4
    apply native_inertia_exponent Ω l c w hL.om A hA (4 * e)
    intro g hg
    have hda : Chr.dirG ℚ Ω ψ g ^ 2 = 1 := by
      rw [hL.ine A hA g hg, ← pow_mul, Nat.mul_comm a 2,
        ← MonoidHom.pow_apply, ha2, MonoidHom.one_apply]
    have hdb : Chr.dirG ℚ Ω ψ' g ^ 2 = 1 := by
      rw [hL'.ine A hA g hg, ← pow_mul, Nat.mul_comm b 2,
        ← MonoidHom.pow_apply, hb2, MonoidHom.one_apply]
    have hsa : (U (Chr.dirG ℚ Ω ψ g)) ^ 2 = 1 := by
      rw [← map_pow, hda, map_one]
    have hsb : (U (Chr.dirG ℚ Ω ψ' g)) ^ 2 = 1 := by
      rw [← map_pow, hdb, map_one]
    have hh := hinv g (hI hg)
    change U (Chr.Psi l e (Chr.dirG ℚ Ω ψ) g) *
      U (Chr.Psi l e (Chr.dirG ℚ Ω ψ') g) = 1 at hh
    have hh2 := congrArg (fun z : (ResidueField c.O)ˣ => z ^ 2) hh
    dsimp only at hh2
    rw [mul_pow, hP, hP, mul_pow, mul_pow, hsa, hsb,
      mul_one, mul_one, ← pow_mul, ← pow_mul, ← pow_add,
      show e * 2 + e * 2 = 4 * e by omega, one_pow] at hh2
    exact hh2

theorem character_of_residual_traces
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (K : Type) [Field K] [NumberField K] [Algebra K Ω] [IsAlgClosure K Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l)
    (N : ℕ) [NeZero N] (e : ℕ) (ψ ψ' : DirichletCharacter c.O N)
    (hG : GD Ω K l e ψ) (hG' : GD Ω K l e ψ')
    (hguard : ¬ l ∣ N ∨ ¬ l - 1 ∣ 4 * e)
    (a b : G K Ω →* (ResidueField c.O)ˣ)
    (ha : ∀ g, a g = Units.map (residue c.O).toMonoidHom
       (Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω g)))
    (hb : ∀ g, b g = Units.map (residue c.O).toMonoidHom
       (Chr.Psi l e (Chr.dirG ℚ Ω ψ') (galEmb ℚ K Ω g)))
    (ht : ∀ g, (a g : ResidueField c.O) + (a g : ResidueField c.O)⁻¹ =
       (b g : ResidueField c.O) + (b g : ResidueField c.O)⁻¹) :
    ψ = ψ' := by
  haveI := c.dvr
  haveI := c.fin
  rcases RHGalois34.inversion_global a b ht with he | hi
  · apply RHGalois37.character_from_restricted_residue Ω K l c N e ψ ψ' hG hG'
    intro g
    exact congrArg Units.val ((ha g).symm.trans ((he g).trans (hb g)))
  · exfalso
    apply native_inverse_excluded Ω K l c N e ψ ψ' hG hG' hguard
    intro g hg
    rw [← range_galEmb] at hg
    obtain ⟨v,rfl⟩ := hg
    rw [← ha v, ← hb v]
    exact hi v

end
end RHGalois38

rh_scan UpperTheory.V.U3.countI limit 2000
rh_scan RHGalois38.native_inverse_excluded limit 2000
rh_scan RHGalois38.character_of_residual_traces limit 2000
rh_prune RHGalois38.native_inverse_excluded as RH38InertiaPruned
#print axioms RHGalois38.native_inertia_exponent
#print axioms RHGalois38.native_inverse_excluded
#print axioms RHGalois38.character_of_residual_traces

-- Replay search with exact theorem as backtracking fallback.
example (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l)
    (w : G ℚ Ω →* c.Oˣ) (hw : IsOmT c w)
    (A : ValuationSubring Ω) (hA : A.valuation (l : Ω) < 1)
    (j : ℕ)
    (hr : ∀ g ∈ Ine (F := ℚ) A,
      (Units.map (residue c.O).toMonoidHom (w g)) ^ j = 1) :
    l - 1 ∣ j := by
  first
  | (rh_reduce 2 using [RHGalois38.native_inertia_exponent]; done)
  | (rh_auto 2; done)
  | (rh_auto_frontier 2; done)
  | exact RHGalois38.native_inertia_exponent Ω l c w hw A hA j hr
