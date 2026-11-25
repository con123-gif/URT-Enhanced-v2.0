import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.CrystallineBaseChange.TwCard
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN29, 25 Nov 2026, lane 5. RESULT: source-matched human reduction of
the rank-two CountI trace classifier, not an unconditional RH proof.
Prepared native bridge below; NOT compiled. No new CI pass.

Actual native call: KeepNumU.numberU3U_of_adm2A_imp_adm2B invokes
frobenius_trace_count_bound_of_rat_eigensystem_count_alt
(countQ_alt hP hLP hA) hN. The callee invokes hQ 2 le_rfl, so this
consumer needs ONLY rank two. The other classifier (countK_alt rank 3)
is unchanged. General countQ_alt chooses n^2+2 quadratic CM fields,
discards at most one at p, and uses n^2+1 distinct twists. At rank 2
this means six candidates, five retained.

Human proof block (use directly in the manuscript):
Fix four imaginary quadratic fields with pairwise coprime prime
discriminants -3,-7,-11,-19 (all are negative fundamental discriminants).
At most one is ramified at the chosen rational prime p. Retain three
unramified fields, selected BEFORE l, Omega, iota or r. Their sign
characters d1,d2,d3 on the absolute rational Galois group are distinct
nontrivial quadratic characters, by the distinct fixed fields (native
signNe); all send complex conjugation c to -1, since all three fields
are imaginary. This property holds in Qbar_l, of characteristic zero.

For an irreducible rank-two representation r, the self-twists
T={d | r isomorphic to d*r} contain 1 and are closed under products:
if A r(g) A^-1=d(g)r(g) and B r(g) B^-1=e(g)r(g), then
AB r(g) (AB)^-1=d(g)e(g)r(g). If all three selected odd characters
were self-twists, T would contain five distinct elements
{1,d1,d2,d3,d1*d2}. The product is nontrivial since the distinct
quadratic signs are involutions. Its value at c is +1, whereas each
d_i(c)=-1. Native twCard bounds any finite set of distinct self-twists
by dim End(r)=4, contradiction. Thus one of the THREE fields gives
irreducible restriction, by the original resTwo. No condition on the
weight, determinant, conductor, or coefficient prime beyond the native
premises is added. This also shows why merely using two fields is not
justified by this argument: two odd self-twists and their even product,
with identity, are compatible with the dimension bound 4.

Keep the rest of countQ_alt literally: countP_alt on each selected
field; admissible restriction hA; rootSum with f_i in {1,2};
the Bool bit_of_fibre (the two possible quadratic extensions of an
irreducible restriction), Frobenius inverse convention, purity and
integrality, and classification up to representation isomorphism.
The bit must not be dropped. rootSum bounds card(D') by
2^(n+1) times the sum of the selected label cardinalities.

For Y=M*(H+1)>=1 and fixed constants c_i,A_i from the four
countP_alt instances, A=max_i A_i, use
    card(D') <= 8 * sum_(i selected) card(D_i)
             <= 8 * sum_(i=1..4) c_i * Y^A.
This avoids the native extra factor five and the sum of exponents.
The sum is directly dominated by the full fixed family (selection
injective); no cardinality times maximum estimate needed. In the
RUN25 selected-prime context p,r>=211, three fixed fields suffice
with no deletion at all; retain FOUR for the unmodified NumberU
statement with arbitrary p>=7. Constants are fixed before p and l.

As in RUN25 combine the rank-two and rank-three classifiers by
a disjoint sum with exponent max(A_rank2,A_rank3)+1.
This reduces classifier construction and exponent, not the still
unproved quantitative suppliers countP_alt/cardP_of_prints and
countK_alt/card_k_of_printed_results, or OneCharU / CorG.
No strict improvement of the unknown numerical exponents is asserted.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties:
ModularityArgument/ThresholdArguments/DenseThresholdCases/
  FrobeniusTraceCountBoundOfCmEigensystemCount.lean
  1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
  KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7
  AutQN.lean d626de1e423ebf58d4b7357f69905fd98829ff51
  NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258
GaloisLibrary/CrystallineBaseChange/
  TwCard.lean b68d8fe98a575e5f111442842e699ecb8bfab638
  QuadFam.lean cb75bc09b3065d1f24e341f271a97c38a739114e
  ResTwo.lean cbdc8b31415f56ea47e29a317c598534848ce71c
  CqStmt.lean 13f9ae82d949d70758bdf3fc7c579eac88d41bbd
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/
AdmissibleResidues/FrobeniusTraceCountBoundOfRatEigensystemCount.lean
  fc375ef5c996180c985df22cc3f15655a9765126 (rootSum).

Continuity: mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
SWARM, HANDOFF, EXPANSION, AGENTS, continuity/state/log/protocol excerpts,
RUN25 and RUN28; live manuscript 4f571d3bfce24fbaef352cd403666872a8981175.
Read recent peer commit handoffs (6c4bfc68, a373ce92, ebe13020,
9fab6791, 75a05320, 82c81900, 6bac1f3c, d4c1ff4b, 65c381c4,
0e9468bc, 87f08381, 604f95bc, 9211eae7, 7232e7b5). No duplicate
rank-two CM-field reduction identified; peers' CountV reduction is
a separate branch. Upstream observed head 251c7b05dd869ceba1aa42c6001c00b4010f23f9
unchanged since RUN28. Four same-path head blobs differ:
classifier 2721f95f4f08f3f443fd24575d2cea0e31eef80e,
TwCard 887d6cac4cf532eff22d0b35fd663a7e729701b2,
QuadFam e098d4aee1a0a0c8f3fb9cdd2798c72f3e017872,
ResTwo d47a3d08b1b9b21bd5f04925f85572e8abee38f6;
KeepNumU same path 404. No cross-version proof equivalence assumed.

Original source call graph (NOT elaborated):
Main -> ... -> CountI -> NumberU3U_s -> KeepNumU
 -> rank2 trace count -> countQ_alt
 -> quadFam(6), exists_avoid(5), countP_alt, rootSum, twCard, resTwo.
Candidate: specialize rank2 caller, fixed four fields -> three good
 -> odd self-twist exclusion using twCard -> resTwo; same countP_alt,
 rootSum, bit_of_fibre and all arithmetic hypotheses. Other callers of
 countQ_alt remain on original graph. Cache context (pin, rank=2,
 p, w, M, H, m, wt, chosen fixed fields, coefficient-independent D,
 l, Omega, iota, caller). Backtrack to original supplier if replay fails.
Axiom evidence: previous baseline CI only. No newly authenticated
value/type/package edges or removed axioms. Retain pending root frontier.

Executed: GitHub fetched/compared five exact pinned blobs, all 15
literal source anchors matched. Inspected rootSum actual body and
native twCard proof. Re-read published status.json for engine runs
45577239749 (98.87s) and 45576756833 (77.94s), both pass; not evidence
for this file. Local command -v lean and -v lake returned no executable.
No synthetic experiments or URT benefit claimed.

RESUME HERE: formalize the native self-twist product and identity
bridges plus the odd sign of complex conjugation for fixed quadratic
fields, replay countQ_alt specialized to rank two with the three-field
selector, then attack cardP_of_prints polynomial dimension supplier.
The certificate below proves the finite-set implication conditional on
the stated exact bridge hypotheses, not the whole rank-two replacement.
HANDOFF TO integration/editor, kernel, audit, dependency, Galois.
-/

open UpperTheory.V.Af

-- Exact native self-twist obstruction. hprod and hone are supplied
-- by the conjugacy calculation above, pending formalization.
theorem rh_rank_two_odd_twists {Γ k : Type} [Group Γ] [Field k]
    (r : Γ →* GL (Fin 2) k) (hirr : IsIrr r)
    (d₁ d₂ d₃ : Γ →* kˣ) (c : Γ)
    (h₁ : d₁ c = -1) (h₂ : d₂ c = -1) (h₃ : d₃ c = -1)
    (hneg : (-1 : kˣ) ≠ 1)
    (h12 : d₁ ≠ d₂) (h13 : d₁ ≠ d₃) (h23 : d₂ ≠ d₃)
    (hpn : d₁ * d₂ ≠ 1)
    (hpe : (d₁ * d₂) c = 1)
    (hone : RepIso r (tw r 1))
    (hprod : RepIso r (tw r d₁) → RepIso r (tw r d₂) →
      RepIso r (tw r (d₁ * d₂))) :
    ¬ (RepIso r (tw r d₁) ∧ RepIso r (tw r d₂) ∧ RepIso r (tw r d₃)) := by
  classical
  rintro ⟨ha,hb,hc⟩
  have hn (d : Γ →* kˣ) (hd : d c = -1) : d ≠ 1 := by
    intro e
    rw [e] at hd
    exact hneg (by simpa using hd.symm)
  have hnp (d : Γ →* kˣ) (hd : d c = -1) : d ≠ d₁ * d₂ := by
    intro e
    rw [e, hpe] at hd
    exact hneg hd.symm
  have hn1 := hn d₁ h₁
  have hn2 := hn d₂ h₂
  have hn3 := hn d₃ h₃
  have hp1 := hnp d₁ h₁
  have hp2 := hnp d₂ h₂
  have hp3 := hnp d₃ h₃
  let S : Finset (Γ →* kˣ) := {d₁,d₂,d₃,d₁*d₂,1}
  have hs : ∀ d ∈ S, RepIso r (tw r d) := by
    intro d hd
    simp only [S, Finset.mem_insert, Finset.mem_singleton] at hd
    rcases hd with h|h|h|h|h
    · exact h ▸ ha
    · exact h ▸ hb
    · exact h ▸ hc
    · exact h ▸ hprod ha hb
    · exact h ▸ hone
  have hcard : S.card = 5 := by
    simp [S, h12, h13, h23, hn1, hn2, hn3, hp1, hp2, hp3, hpn]
  have H := UpperTheory.V.Br.twCard Γ k 2 r hirr S hs
  rw [hcard] at H
  norm_num at H

-- Actual native proof-term scans; execute in a built source environment,
-- not via textual reconstruction. Retain diagnostics and pending nodes.
rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan UpperTheory.V.Br.twCard limit 2000
rh_prune UpperTheory.GalN.V.csdN'_alt as rh_csdN_alt_reduced
#print axioms rh_rank_two_odd_twists
#print axioms rh_csdN_alt_reduced
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt
