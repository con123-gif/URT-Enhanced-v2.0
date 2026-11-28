import New.Endgame.OneSidedCriterion
import Lean

/-!
# Dependency RUN84 — pair-mean endpoint and degree-normalized selector

28 November 2026. HUMAN SOURCE-MATCHED / PREPARED; NOT compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Head inspected 7d5dd9861184b185d2d3add1e295de3c992dd91b.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,
579ecc1cafdb28eae7d1c97565700c571dfa7484; SWARM/AGENTS/HANDOFF
and continuity/state/protocol inspected.
Native PolarLandau blob 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9,
PrimeError 63eb3d79d95ad815878e623b96f237240058c8e2,
OneSidedCriterion 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3,
ZeroFreeTwist 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11.
Peer 108e8dac fixed-fiber audit, d6d56f3d joint witness,
265ffc21 selected reciprocal supplier. RUN82/83 preserved.
This is not a new refinement of the same count exponent.

## New exact alternative arithmetic interface

Fix M=18480 (or any fixed M>0), 1/2<beta<1 and
eta=(beta-1/2)/9. Let G_X be a finite simple undirected graph
on admissible primes d<=X, each d=7 mod 8, gcd(d,M)=1.
Each edge {d,e} is required to satisfy only the following eventual
bound on the SAME fixed pair:
       (primeError d M x + primeError e M x)/2 <= x^(beta-1).
No individual one-sided bound is required. Each pair may have its
own threshold, which is allowed because the pair is selected
before x grows. Put D_X=max(1,max vertex degree G_X).
The single alternative sufficient arithmetic criterion is
       limsup_X |E(G_X)| / (D_X * X^(1-eta/2)) = infinity
for beta cofinal from above at 1/2. A fractional packing of arbitrary
finite nonempty blocks with vertex load <=1 also works: replace
|E|/D by total block weight, and pair mean by normalized block mean.

Proof of selection: for a hypothetical zero rho with beta<Re rho,
fix y=|Im rho|. Native zero_density_quadTwist and the finite-character
union bound say that the bad prime set B_X has O(X^(1-eta/2))
vertices, where bad means some twisted character has a zero in
Re s>=beta, |Im s|<=y. If every edge touches B_X, then counting
incidences gives |E|<=sum_{d in B_X} deg(d)<=D_X*|B_X|.
Contradiction at one sufficiently large X. Thus select a fixed
edge {d,e} whose BOTH ends avoid the native zero rectangle.
No graph is allowed to change with the outer analytic variable x
after selection. The new weighted finite hitting lemma below
certifies precisely the incidence inequality, with no independence.

Proof of analytic step: IsPolar is closed under the arithmetic
mean of TWO functions, using the arithmetic mean of their
meromorphic witnesses and residues. The closure is proved directly
from the actual definition (not an extra analytic axiom).
By the exact native isPolar_primeError formula, put
U(s)=sum_xi ord_s entireL(xi), T_d(s)=sum_xi ord_s entireL(quadTwist xi d).
The mean residue is
       [U(s)-(T_d(s)+T_e(s))/2] / [phi(M)*s*(1-s)].
At every real z>beta with z<1 the two T's are zero, U>=0 and the
denominator is positive. For z>=1 all orders are zero by native
entireL_ne_zero (including z=1 where Lean total division gives 0).
At the hypothetical zero rho (necessarily Re rho<1), both T's
are zero and U(rho)>0, so the mean residue is nonzero since
rho is neither 0 nor 1 and phi(M)>0. But IsPolar.landau on the
pair mean and the stipulated eventual inequality forces this
residue to be zero. This contradiction gives the same right
half-strip conclusion and the existing reflection consumer.

The old singleton endpoint count supplies this pair criterion:
on the individually good primes <=X take disjoint arbitrary pairs;
at least floor(N/2) edges, D_X=1, and their mean bound follows by
adding the individual bounds. A pair mean alone does not imply
either individual one-sided bound by real-order algebra (take
opposite large deviations). No claim that this strictness example
is realized by actual primeError, or that mean bounds are easier
arithmetically. No assertion that the new count condition holds.
The full-upper-count all-tolerance obstruction in earlier audit
still applies to the singleton formulation; this new alternative
is not a proof that its arithmetic premise can be discharged.
Native RUN83 density slack, if eventually accepted, can substitute
1-eta+alpha/2 for the exponent; not necessary for this result.

Original graph: individual endpoint count -> density selection
-> one polar function -> signed Landau -> reflection.
Alternative graph: degree-normalized pair-mean count -> incidence
selection against SAME bad set -> mean IsPolar (two exact native
residues) -> SAME signed Landau -> reflection.
No global graph deletion, no Main import or assumed RH.
Preserve previous source graphs and all open arithmetic premises.

## Actual execution / limitations

Connector JS enumerated all 1024 simple graphs on 5 vertices and
all 32 possible bad vertex sets. 32768 exact integer tests,
12625 covering configurations, 6343 strict edge-count cases,
zero failures. Reproduce: enumerate all 10 unordered edges as a
bitmask, compute degrees, for each bad mask test implication
all edges touch bad => edge count <= max(1,maxdegree)*popcount(mask)
and its contrapositive. 456 integer pairs in [-20,20]^2 satisfy
a+b<=2 but violate at least one of a<=1, b<=1 (scalar only).
These are finite logical regression controls, NOT prime data.
Mathlib Meromorphic/Basic, Analytic/Constructions and integral_div
declarations inspected at pin; the candidate below is not Lean checked.
Local lean/lake absent. Shared native 46108846902 and 46114460776
both workflow-green but actual research ERROR: first failed phase
run92 (status blob 331a41d47b9ce746f010214e0614fee5716845c0);
RUN70 leaf or graph/prune incomplete
(status blob 646179c86d7e8ac4e7c02914db4693ff40aaee7b).
Correct RUN99 queue id rh-compact-prime-count-budget-20261128
exists in registry; no accepted receipt observed in this run.
No native rh_scan/prune/reduce/auto/frontier or new axiom PASS.
Do not launch another cold build or duplicate peer repairs.

RESUME HERE: stage this file as DepPairMean84 in the same pinned
endpoint workspace after the already queued RUN99 result; compile
with normal kernel, repair first actual diagnostic, require axiom
and exact supplier guards and then connect the finite hitting lemma
to the native bad-prime cardinality. No premature root closure.
HANDOFF prime/math/integration/audit/kernel. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Complex Filter Set MeasureTheory Finset Nat Topology DirichletCharacter

namespace RHDepPairMean84

/-- The incidence inequality in fractional form. Each block hits bad,
and each bad vertex has load at most one. No disjointness is assumed. -/
theorem weighted_hit_bound {ι V : Type*} [DecidableEq V]
    (I : Finset ι) (bad : Finset V) (B : ι → Finset V) (w : ι → ℝ)
    (hw : ∀ i ∈ I, 0 ≤ w i)
    (hhit : ∀ i ∈ I, ∃ v ∈ bad, v ∈ B i)
    (hcap : ∀ v ∈ bad, ∑ i ∈ I, (if v ∈ B i then w i else 0) ≤ 1) :
    ∑ i ∈ I, w i ≤ (bad.card : ℝ) := by
  classical
  calc
    ∑ i ∈ I, w i ≤ ∑ i ∈ I, ∑ v ∈ bad, (if v ∈ B i then w i else 0) := by
      apply Finset.sum_le_sum
      intro i hi
      obtain ⟨v,hv,hvb⟩ := hhit i hi
      have h := Finset.single_le_sum
        (f := fun v => if v ∈ B i then w i else 0)
        (fun u _ => by split <;> simp [hw i hi]) hv
      simpa only [if_pos hvb] using h
    _ = ∑ v ∈ bad, ∑ i ∈ I, (if v ∈ B i then w i else 0) := Finset.sum_comm
    _ ≤ ∑ v ∈ bad, (1 : ℝ) := Finset.sum_le_sum hcap
    _ = (bad.card : ℝ) := by simp

theorem polar_pair_mean {E F : ℝ → ℝ} {r t : ℂ → ℂ}
    (hE : IsPolar E r) (hF : IsPolar F t) :
    IsPolar (fun v => (E v + F v)/2) (fun z => (r z + t z)/2) := by
  rcases hE with ⟨m,C,Φ,hΦ,hC,hI,hA,hR⟩
  rcases hF with ⟨n,D,Ψ,hΨ,hD,hJ,hB,hS⟩
  refine ⟨by fun_prop, (C+D)/2, fun z => (Φ z+Ψ z)/2, ?_, ?_, ?_, ?_, ?_⟩
  · intro z
    exact ((hΦ z).add (hΨ z)).div (by fun_prop)
  · intro v hv
    rw [abs_div, abs_of_nonneg (by norm_num : (0:ℝ) ≤ 2)]
    apply div_le_div_of_nonneg_right _ (by norm_num)
    calc
      |E v + F v| ≤ |E v| + |F v| := abs_add_le _ _
      _ ≤ C * Real.exp v + D * Real.exp v := add_le_add (hC v hv) (hD v hv)
      _ = (C+D) * Real.exp v := by ring
  · intro s hs
    rw [hI s hs, hJ s hs]
    have i := integrableOn_laplace_of_abs_le m hC hs
    have j := integrableOn_laplace_of_abs_le n hD hs
    have heq : (fun v : ℝ => ((↑((E v+F v)/2) : ℂ) * Complex.exp ((1-s)*v))) =
        (fun v : ℝ => (((E v : ℂ)*Complex.exp ((1-s)*v)) +
          ((F v : ℂ)*Complex.exp ((1-s)*v)))/2) := by
      funext v
      push_cast
      ring
    rw [heq, integral_div, integral_add i j]
  · intro z hz
    have h := ((hA z hz).add (hB z hz)).div_const (c := (2:ℂ))
    convert h using 1 <;> try { funext u; ring }
  · intro ρ hρ
    have h := ((hR ρ hρ).add (hS ρ hρ)).div_const (2:ℂ)
    convert h using 1 <;> try { funext u; ring }

noncomputable def primeResidue (d M : ℕ) [Fact d.Prime] [NeZero M] (s : ℂ) : ℂ :=
  (∑ ξ, (analyticOrderNatAt (@entireL M _ ξ) s -
    analyticOrderNatAt (entireL (quadTwist ξ d)) s : ℂ)) / Nat.totient M / (s*(1-s))

/-- Exact actual signed-Landau consumer. The real-residue guard and
the contradiction at rho are discharged by the two avoidance
conditions in the human proof above. -/
theorem pair_primeError_landau {M d e : ℕ} [NeZero M]
    [Fact d.Prime] [Fact e.Prime]
    (hd : d % 8 = 7) (he : e % 8 = 7) (hdM : M.Coprime d) (heM : M.Coprime e)
    {β : ℝ} (hβ : 0 < β)
    (hr : ∀ x : ℝ, β < x →
      0 ≤ ((primeResidue d M x + primeResidue e M x)/2).re)
    (hw : ∀ᶠ v : ℝ in atTop,
      (primeError d M (Real.exp v)+primeError e M (Real.exp v))/2 ≤
        Real.exp ((β-1)*v))
    {ρ : ℂ} (hρ : β < ρ.re) :
    (primeResidue d M ρ + primeResidue e M ρ)/2 = 0 := by
  have p : IsPolar (fun v => primeError d M (Real.exp v)) (primeResidue d M) :=
    isPolar_primeError hd hdM
  have q : IsPolar (fun v => primeError e M (Real.exp v)) (primeResidue e M) :=
    isPolar_primeError he heM
  exact (polar_pair_mean p q).landau hβ hr hw hρ

end RHDepPairMean84

#print axioms RHDepPairMean84.weighted_hit_bound
#print axioms RHDepPairMean84.polar_pair_mean
#print axioms RHDepPairMean84.pair_primeError_landau

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHDepPairMean84.weighted_hit_bound, #[]),
      (``RHDepPairMean84.polar_pair_mean, #[``integrableOn_laplace_of_abs_le]),
      (``RHDepPairMean84.pair_primeError_landau,
        #[``RHDepPairMean84.polar_pair_mean, ``isPolar_primeError, ``IsPolar.landau])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN84 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN84 missing proof {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN84 missing direct supplier {n}"
  logInfo "RUN84_PAIR_MEAN_PACKING_GUARDS_OK"
