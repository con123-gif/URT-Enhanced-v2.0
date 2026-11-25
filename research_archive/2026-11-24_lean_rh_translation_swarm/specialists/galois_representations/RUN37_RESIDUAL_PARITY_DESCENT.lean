import RUN36_INERTIA_SEPARATED_SINGLETON
import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.ExistsDat
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.PsiBar
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CongrFacts
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CoefSup
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.SelmerTransport.GalEmbTop
import RHProofTermPrune
import RHRecursiveReductionAutoV3

/-!
Lane 5 RUN37, 25 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION / PREPARED
Lean, not compiled. RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4
(including unified engine), SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION
c8152d07, AGENTS 8db0201d, continuity and state/log/protocol read.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream observed
2caf4fd16ee59eb56ad8b6a605461837969900c4, not substituted.
Peer audit 215742774c39d40841de648572c82d21ed7098eb eliminates E_e
by q1,d=3 mod 4. Peer native PropZ 8eef4b8a and Kato W 2235982d,
CountVs 2a39654b, mean consumer 678de808 read. This result addresses
the separate restriction and coefficient-residue transport, not
the already proved generic empty-exception argument.

SOURCE LEDGER (relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties):
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
  GD.par, GD.ord, GD.quad, GD.imag.
HeightAndVanishing/PsiBar.lean 1ba0427cab931c1ba3da74ff2e8f4a5d2616678a
  psiBar: common parity gives Psi(cc)=1; order and injectivity of dirG.
HeightAndVanishing/CongrFacts.lean d1f46a193c0ee5bd6a291b6180dc774703fa2d58
  congrFacts.2.2.2.2 lifts equality of prime-to-l torsion characters.
HeightAndVanishing/GdIffIndex.lean c28e5e251291dc9e8944b2ea384e93c67c79830b
  omT and index-two supplier usage.
UnitaryThreeGroups/ExistsDat.lean d4c6c5ef5aae040f31f84e20aba841e5bc2f4bf5
  exists_dat.
UnitaryThreeGroups/DatFacts.lean f04c55abe16956e3d4458c410131568df631149f
  D.cc outside galOf from D.eta_ker and dat_facts.2.1.
GaloisLibrary/SelmerTransport/GalEmbTop.lean 0df0aefe7d44997e7e1c87a6bad556c271d1aeed
  galEmbTop.2.2, index = finrank.
HeightAndVanishing/CoefSup.lean daaed06c2460af631add11b07bd3914391f8ef30
  c.O is finite subalgebra of PadicAlgCl, not whole ambient field.
UnitaryThreeGroups/CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674
  countI -> CorGK; h.X supplies same GD.
FPropGKU.lean (DenseThresholdCases) 4887bdf435a54a8ab856102e15d60da39d041970
  actual integer consumer. Preserve the original orbit proof.

RESULT. In RUN36 the final equality after inversion exclusion was
obtained by cyclotomic disjointness. This is unnecessary. In the
same coefficient ring O=c.O, put r=O->k_O (residue field),
A=bar(Psi_e,psi), B=bar(Psi_e,psi'). Both GD have the SAME e.
They are even characters of G_Q: A(cc)=B(cc)=1 by psiBar and GD.par.
H=G_K has index two and cc outside H since K totally imaginary.
If A=B on H then for g outside H, g*cc is in H, and
A(g)=A(g*cc)=B(g*cc)=B(g). Thus A=B globally. Cancel the common
cyclotomic twist in k_O BEFORE any norm; bar(dirG psi)=bar(dirG psi').
Both are of prime-to-l order by GD.ord and psiBar. With
m=orderOf psi * orderOf psi', native congrFacts lifts the congruence
to exact equality of dirG and native psiBar gives psi=psi'.
No new disjointness, conductor or extension-of-residue-field
assumption. Parity is essential: a nontrivial quadratic character
of G_Q/H and the trivial character agree on H but not cc.

The other bridge: in RUN35-36 traces live in Qbar_l. If j:O->Qbar_l
and norm(j(z))<1, then z is a nonunit of O. Indeed all O elements
have norm <=1 because O finite over Z_l; a root of a monic integral
polynomial cannot have norm >1 (leading term would strictly
dominate every lower term). Were z a unit, the same bound on z^-1
contradicts norm(j(z))*norm(j(z^-1))=1. Thus r(z)=0. Apply this
to differences of integral reference traces using the ultrametric
bound from the two residual errors with their common actual trace.
Both reference traces reduce in the SAME k_O; no integral model of
the selected rho or choice of extension residue field is necessary.
The generic norm lemma below takes the coefficient norm bound
explicitly; its native finite-integral specialization still needs
Lean replay. Equality of actual traces under RepIso, native inertia
transport and actual FPropGKU caller are also still to replay. With
those and RUN35/36 plus peer 21574277, singleton_block_budget can
use the full h.X with multiplicity one, giving sum_l log(l) A_l
<=2 log B for the patched integer. No CountI or RH closure claimed.

Original graph: CountI <- CorGK <- PropGK <- NumberU3U_s and
OneCharU_s, per-orbit budget. Candidate: RUN35 residual errors ->
norm reflection in c.O -> equality of residual trace functions in
k_O -> RUN34 and peer inverse exclusion -> equality on G_K ->
this parity descent and congrFacts -> hsep -> RUN36 full singleton
budget -> patched B. Keep original and all pending nodes. Context
key pin/toolchain/h,t,N,e,l,c,Omega,K,psi,psi',rho,rho',cc,
same reference prime and integer witness. No URT needed.

Actual local command -v lean/lake returned no paths. Fetched
baseline CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717, returncode 0,
runs 45577239749/45576756833. Recent completed compute run
45670987597 belongs to another overlay, not RUN34-37.
No new axiom evidence or kernel closures. Native commands below
are prepared, not executed. No changes to protected workflows.

RESUME HERE: batch compile RUN34-37 and peer audit 21574277
with existing pinned warmed runner; instantiate norm bound using
finite-integral coefficients, trace equality from RepIso, and
native CaseI inertia; then pass resulting hsep into singleton_block_budget
on actual h.X and propagate to countI (or principal caller).
Retain all original supplier hypotheses and full same-host window
obligations. HANDOFF TO integration, kernel, formal audit, arithmetic.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual
open ReciprocityTheory.Gal Formalism.GaloisCohomology
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.U3
open IsLocalRing

namespace RHGalois37

theorem eq_on_index_two {G U : Type*} [Group G] [Group U]
    (H : Subgroup G) (hi : H.index = 2) (a b : G →* U)
    (s : G) (hs : s ∉ H) (he : a s = b s)
    (hh : ∀ g ∈ H, a g = b g) : a = b := by
  ext g
  by_cases hg : g ∈ H
  · exact hh g hg
  · have hgs : g * s ∈ H :=
      (Subgroup.mul_mem_iff_of_index_two hi).mpr (iff_of_false hg hs)
    have heq := hh (g * s) hgs
    rw [map_mul, map_mul, he] at heq
    exact mul_right_cancel heq

theorem residue_of_small {O F : Type*} [CommRing O] [IsLocalRing O]
    [NormedField F] (j : O →+* F) (hbd : ∀ z : O, ‖j z‖ ≤ 1)
    (z : O) (hz : ‖j z‖ < 1) : IsLocalRing.residue O z = 0 := by
  rw [IsLocalRing.residue_eq_zero_iff]
  rintro ⟨u, hu⟩
  have hp : j z * j ((u⁻¹ : Oˣ) : O) = 1 := by
    rw [← hu, ← map_mul, ← Units.val_mul, mul_inv_cancel, Units.val_one, map_one]
  have h := calc
    ‖j z‖ * ‖j ((u⁻¹ : Oˣ) : O)‖ ≤ ‖j z‖ * 1 :=
      mul_le_mul_of_nonneg_left (hbd _) (norm_nonneg _)
    _ < 1 := by simpa using hz
  rw [← norm_mul, hp, norm_one] at h
  exact (lt_irrefl _ h)

theorem residue_reference_trace_eq {O F : Type*} [CommRing O] [IsLocalRing O]
    [NormedField F] [IsUltrametricDist F] (j : O →+* F)
    (hbd : ∀ z : O, ‖j z‖ ≤ 1) (x y : O) (t : F)
    (hx : ‖t - j x‖ < 1) (hy : ‖t - j y‖ < 1) :
    IsLocalRing.residue O x = IsLocalRing.residue O y := by
  have hd : ‖j (x-y)‖ < 1 := by
    rw [map_sub, show j x - j y = -(t-j x)+(t-j y) by ring]
    apply (IsUltrametricDist.norm_add_le_max _ _).trans_lt
    rw [norm_neg]
    exact max_lt hx hy
  have h := residue_of_small j hbd (x-y) hd
  rwa [map_sub, sub_eq_zero] at h

noncomputable section

theorem character_from_restricted_residue
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (K : Type) [Field K] [NumberField K] [Algebra K Ω]
    [IsAlgClosure K Ω] (l : ℕ) [Fact l.Prime] (c : Coef l)
    (N : ℕ) [NeZero N] (e : ℕ) (ψ ψ' : DirichletCharacter c.O N)
    (hG : GD Ω K l e ψ) (hG' : GD Ω K l e ψ')
    (hr : ∀ g : G K Ω,
      IsLocalRing.residue c.O (Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω g) : c.O) =
      IsLocalRing.residue c.O (Chr.Psi l e (Chr.dirG ℚ Ω ψ') (galEmb ℚ K Ω g) : c.O)) :
    ψ = ψ' := by
  classical
  haveI := c.dvr
  haveI := c.fin
  obtain ⟨D⟩ := exists_dat hG
  obtain ⟨⟨w, hw, -⟩, -⟩ := omT Ω l c
  have hcc : IsCC D.cc := by
    obtain ⟨φ, hφ⟩ := D.conj
    exact ⟨φ, hφ⟩
  have hcc1 := ((psiBar Ω l c w hw N ψ).2.1 e).mp hG.par D.cc hcc
  have hcc2 := ((psiBar Ω l c w hw N ψ').2.1 e).mp hG'.par D.cc hcc
  let R := IsLocalRing.residue c.O
  let a := (Units.map R.toMonoidHom).comp (Chr.Psi l e (Chr.dirG ℚ Ω ψ))
  let b := (Units.map R.toMonoidHom).comp (Chr.Psi l e (Chr.dirG ℚ Ω ψ'))
  have hidx : (galOf ℚ K Ω).index = 2 := (galEmbTop ℚ K Ω).2.2.trans hG.quad
  have hnot : D.cc ∉ galOf ℚ K Ω := by
    intro hc
    rw [← D.η_ker, MonoidHom.mem_ker] at hc
    have hn := (dat_facts D).2.1
    rw [hn] at hc
    norm_num at hc
  have hs : a D.cc = b D.cc := by
    dsimp [a,b]
    rw [hcc1,hcc2]
  have hh : ∀ g ∈ galOf ℚ K Ω, a g = b g := by
    intro g hg
    rw [← range_galEmb] at hg
    obtain ⟨v,rfl⟩ := hg
    apply Units.ext
    exact hr v
  have hab : a = b := by
    first | (rh_reduce 2 using [eq_on_index_two]; done)
          | exact eq_on_index_two _ hidx a b D.cc hnot hs hh
  have hc : Congr c (Chr.dirG ℚ Ω ψ) (Chr.dirG ℚ Ω ψ') := by
    intro g
    have h := DFunLike.congr_fun hab g
    change Units.map R.toMonoidHom (Chr.Psi l e (Chr.dirG ℚ Ω ψ) g) =
      Units.map R.toMonoidHom (Chr.Psi l e (Chr.dirG ℚ Ω ψ') g) at h
    simp only [Chr.Psi, MonoidHom.mul_apply, map_mul] at h
    have h' := congrArg Units.val (mul_left_cancel h)
    exact (Ideal.Quotient.eq).mp h'
  have ho := (psiBar Ω l c w hw N ψ).2.2.1
  have ho' := (psiBar Ω l c w hw N ψ').2.2.1
  let m := orderOf ψ * orderOf ψ'
  have hm : ¬ l ∣ m := fun h => ((Nat.Prime.dvd_mul (Fact.out : l.Prime)).mp h).elim hG.ord hG'.ord
  have hp : (Chr.dirG ℚ Ω ψ) ^ m = 1 := by
    rw [show m = orderOf ψ * orderOf ψ' from rfl, ← ho, pow_mul, pow_orderOf_eq_one, one_pow]
  have hp' : (Chr.dirG ℚ Ω ψ') ^ m = 1 := by
    rw [show m = orderOf ψ' * orderOf ψ from Nat.mul_comm .., ← ho', pow_mul, pow_orderOf_eq_one, one_pow]
  have hdir := (congrFacts Ω l c).2.2.2.2 _ _ m hm hp hp' hc
  exact ((psiBar Ω l c w hw N ψ).2.2.2 ψ').2 hdir

end
end RHGalois37

rh_scan UpperTheory.V.U3.countI limit 2000
rh_scan RHGalois37.character_from_restricted_residue limit 2000
rh_prune RHGalois37.character_from_restricted_residue as RH37ParityDescentPruned
#print axioms RHGalois37.eq_on_index_two
#print axioms RHGalois37.residue_of_small
#print axioms RHGalois37.residue_reference_trace_eq
#print axioms RHGalois37.character_from_restricted_residue

-- Search/backtracking on the actual remaining restriction bridge, not RH.
example (G U : Type*) [Group G] [Group U] (H : Subgroup G)
    (hi : H.index = 2) (a b : G →* U) (s : G) (hs : s ∉ H)
    (he : a s = b s) (hh : ∀ g ∈ H, a g = b g) : a = b := by
  first | (rh_auto 2; done) | exact RHGalois37.eq_on_index_two H hi a b s hs he hh

example (G U : Type*) [Group G] [Group U] (H : Subgroup G)
    (hi : H.index = 2) (a b : G →* U) (s : G) (hs : s ∉ H)
    (he : a s = b s) (hh : ∀ g ∈ H, a g = b g) : a = b := by
  first | (rh_auto_frontier 2; done) | exact RHGalois37.eq_on_index_two H hi a b s hs he hh
