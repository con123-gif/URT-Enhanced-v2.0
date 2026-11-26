import RUN41_NATIVE_COVOL_TAMAGAWA_PAIR
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.AdelicUnitaryHaarBiInvariant

/-!
Lane 8 RUN42, 26 Nov 2026. HUMAN / SOURCE-MATCHED; PREPARED Lean
certificate, NOT compiled. RH OPEN.

Read current mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory engine, original requested mission e0dc8f7f (blob 4a45e612),
SWARM/HANDOFF/EXPANSION, AGENTS, state/continuity/log/protocol openings.
Latest 25 peer commits surveyed; geometry 706da3bb (single Gram SW),
editor c9fdbd77 (signed mass defect), prior theta 20450987 (paired covol)
read in detail. Integration f304da1a and Landau 65a89b19 noted.
Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Current upstream
HEAD reported by GitHub 843cb9db91a39362b8d3b9f0de7a98bb651660e2;
not migrated or semantically compared.

NEW: exact calibration by ONE finite positive test rectangle, not
an all-measurable-set transport assertion. On each canonical native
AutInst group let mu=I.muA w.mu, g=gaugeScale41 I w.c w.mu.
Let nu be the transported classical Tamagawa Haar. For a single
measurable B with 0<mu(B)<infinity, establish
       nu(B) = (a*g)*mu(B).
Native Haar uniqueness (the same theorem used in gaugeVol_transport)
gives nu=b*mu. Evaluate at B and cancel mu(B) BEFORE quotient
integration. Consequently b=a*g and covol(Gamma,nu,univ)=a*C.
This identity holds even for infinite quotient volume. The two test
rectangles may be chosen independently at adjacent ranks; they are
normalization probes, NOT independent geometric witnesses replacing
the same host. No quotient-volume division, no need to compare two
different rank groups by isomorphism, no need to compute tau(T).
Take B = compact identity neighbourhood in the real product times
the native Kset. The remaining premises are the pushed Haar property,
rational subgroup compatibility and common covolume from Tamagawa,
plus the explicit scalar test value per endpoint. These have not
been kernel checked. The candidate removes global measure equality
from the proposed interface; does not declare any root obligation
closed. Native covol_map can still handle the measurable group
equivalence when comparing standard to native groups.

Independent archimedean calibration detail (general proof):
Let J=diag(s_i), s_i=+/-1 and e=s_i*s_j. A real basis of
X*J+JX=0 is i E_ii and, for i<j,
    A_ij=E_ij-e E_ji, B_ij=i(E_ij+e E_ji).
The Frobenius real Gram is diagonal with n entries 1 and
n(n-1) entries 2. The trace bilinear form Re tr(XY) is diagonal
with n entries -1 and two entries -2e per unordered pair.
This follows by multiplying matrix units E_ab E_cd=delta_bc E_ad.
Hence
       |det Gram_trace| = det Gram_Frob = 2^(n(n-1)).
Absolute determinant densities, not positive inner products, agree
exactly for every signature, no extra factor of 2. In an exponential
chart the derivative at zero is identity and the ambient Frobenius
distance to 1 is the tangent Frobenius norm to first order.
Thus the Haar density normalized by the native small-ball condition
IsGauge equals the absolute trace density at identity and therefore
everywhere by left invariance. At indefinite signature trace is NOT
a positive metric: the (+,-) pair has +2 while diagonal terms are -1.
This verifies the real-density factor in RUN40's HUMAN calculation,
not the finite restricted-product/Tamagawa transport.

Executed exact integer Gaussian-pair regression: 62 signatures for
n=1..5, 24,810 Gram entry comparisons; 510 determinant comparisons
for all signatures n=1..8; one indefinite-sign negative control.
Reproduce in Python stdlib with integer real/imag pairs or exact
small Gaussian matrices:
  for n in range(1,9):
    for mask in range(2**n):
      s=[-1 if mask>>i&1 else 1 for i in range(n)]
      trace=[-1]*n+[-2*s[i]*s[j] for i in range(n) for j in range(i+1,n) for _ in range(2)]
      frob=[1]*n+[2]*(n*(n-1))
      assert abs(math.prod(trace))==math.prod(frob)==2**(n*(n-1))
  assert -2*1*(-1)>0 and -1<0
Full entry comparison used sparse matrix-unit products and exact
integer complex multiplication, no floating point. These checks
regress the general algebra; do not establish global quotient volume.

Original graph retained:
 CountTyped -> countingTheorem_of_volumeStep -> VolumeStep;
 RUN36 -> CanonicalRank36; RUN41 -> CanonicalTamagawaPair41.
Candidate:
 one test per rank + classical transported Haar + actual covol equality
 -> CanonicalTamagawaPair41 -> canonical_of_pair41 -> countingTheorem.
Keep old graph, all unexpanded type/value/constructor roles and axiom
evidence. Cache key source/toolchain, F/E/CM, signature/rank, canonical
I, w.c/w.mu, exact test rectangle and measure nu, rational subgroup,
a and consumer. Do not identify contexts just by equal dimension.
Backtrack to original VolumeStep or geometry's independent single-Gram
SW supplier if transport/replay fails. Editor signed interval survives
as weaker independent caller; do not remove independent mass errors.

Pinned native source checked:
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 GaugeVolumeEqOfSemilinearIsometryGenus.lean d8e911ba588e91954a6b50bf044fd455e8715376
 (covol_map, covol_smul, gaugeVol_transport, lines 116-140, 621-699)
 AdelicUnitaryHaarBiInvariant.lean 8d3cfafd1ab9d5803d48c4a61ce3e3487602b741
 (smul_inj, adelic_unimodular)
 FiniteAdelicUnitaryCongruenceTopology.lean 3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba
 RiemannianHaarGaugeExistsPosUniqueStatement.lean 4d6d1caa50c5acd1a81f5e49d29ec0766ac8b766
src/Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
 DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
 IsGaugeAll.lean 5abc045266b05be6cd3f3fcc67b369ddd167f92b
src/Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
 2103e49fe83fce42d4962f85acd9d4f6a589d645.
All read at pin, no imports of claimed RH theorem.
Local command -v lean/lake returned no path. Actual baseline CI
status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved, pass/exit 0
for 45577239749 and 45576756833 respectively. Baseline only.
No new Lean compilation, CI queue claim or axiom output. Prior
conditional root axioms propext, Classical.choice, Quot.sound;
324 scan nodes pending. No URT test warranted.

RESUME HERE: use standard-to-native finite adele ring equivalence
from RUN37 and editor lattice stabilizer identification to establish
the single rectangle value, with the rank-dependent discriminant
factor and rank-one Euler factor cancellation from RUN40; match
diagonal rational subgroup and apply classical quotient integration.
Replay RUN36/41/42 on pinned runner, inspect actual compiler and
constructor-inclusive scans/axioms, then propagate verified count
supplier to TopG/Green. Do not repeat downstream scalar identities.
All independent arithmetic, same-host joint J, TopG/VWin and
weighted prime-window obligations remain unresolved.
HANDOFF TO geometry, editor, literature, integration, kernel, audit.
-/

open MeasureTheory NumberField Finset Formalism.MainNotions.S
open GlobalTheory.Count GlobalTheory.FlagMeas
open scoped ENNReal NNReal

noncomputable section
namespace GlobalTheory.FlagMeas.VolRatio

section Haar
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [SecondCountableTopology G]
  [MeasurableSpace G] [BorelSpace G]

theorem haar_eq_one_test42 (mu nu : Measure G) [mu.IsHaarMeasure]
    [nu.IsHaarMeasure] (B : Set G) (h0 : mu B ≠ 0) (ht : mu B ≠ ⊤)
    (t : ENNReal) (h : nu B = t * mu B) : nu = t • mu := by
  have ha := Measure.isMulLeftInvariant_eq_smul nu mu
  have he := congrArg (fun m : Measure G => m B) ha
  rw [Measure.coe_nnreal_smul_apply, h] at he
  have hc : t = (Measure.haarScalarFactor nu mu : ENNReal) :=
    (ENNReal.mul_left_inj h0 ht).1 he
  calc
    nu = Measure.haarScalarFactor nu mu • mu := ha
    _ = t • mu := by
      ext s hs
      rw [Measure.coe_nnreal_smul_apply, Measure.smul_apply, smul_eq_mul, hc]

end Haar

def rawMu42 {I : AutInst} (w : GaugeWitness36 I) : Measure I.GA :=
  letI : SigmaFinite w.mu := w.sf
  I.muA w.mu

def RectCal42 {I : AutInst} (w : GaugeWitness36 I)
    (a : ENNReal) (nu : Measure I.GA) : Prop :=
  nu.IsHaarMeasure ∧ ∃ B : Set I.GA, MeasurableSet B ∧
    rawMu42 w B ≠ 0 ∧ rawMu42 w B ≠ ⊤ ∧
    nu B = (a * gaugeScale41 I w.c w.mu) * rawMu42 w B

theorem rect_scaled_eq42 {I : AutInst} (w : GaugeWitness36 I)
    (a : ENNReal) (nu : Measure I.GA) (h : RectCal42 w a nu) :
    covol I.GFset nu Set.univ = scaledCovol41 w a := by
  obtain ⟨hH, B, hB, h0, ht, he⟩ := h
  letI : SigmaFinite w.mu := w.sf
  letI : w.mu.IsHaarMeasure := w.haar
  letI : nu.IsHaarMeasure := hH
  obtain ⟨_, _, _, -⟩ := GlobalTheory.CongTop.adelic_topology I
  haveI : ∀ v, (Formalism.REAL.muG (I.ε v)).IsHaarMeasure :=
    fun v => by unfold Formalism.REAL.muG; infer_instance
  haveI : (Measure.pi fun v => Formalism.REAL.muG (I.ε v)).IsHaarMeasure :=
    Measure.pi.isHaarMeasure _
  haveI : (I.muA w.mu).IsHaarMeasure := Measure.prod.instIsHaarMeasure _ _
  haveI : (rawMu42 w).IsHaarMeasure := by
    unfold rawMu42
    infer_instance
  have hh := haar_eq_one_test42 (rawMu42 w) nu B h0 ht _ he
  rw [hh]
  rfl

def CanonicalRectanglePair42 : Prop :=
  ∀ (I : AutInst) (p q : ℕ), 3 ≤ p + q → ∀ s : Bool,
    (if s then 1 ≤ p else 1 ≤ q) →
    ∃ (a : ENNReal) (nu : Measure (canonical36 I p q).GA)
      (nu' : Measure (canonical36 I
        (if s then p-1 else p) (if s then q else q-1)).GA),
      a ≠ 0 ∧ a ≠ ⊤ ∧ ENNReal.ofReal (rankFac I.E (p+q)) ≠ 0 ∧
      RectCal42 (witness36 (canonical36 I p q)) a nu ∧
      RectCal42 (witness36 (canonical36 I
        (if s then p-1 else p) (if s then q else q-1)))
        (a * ENNReal.ofReal (rankFac I.E (p+q))) nu' ∧
      covol (canonical36 I p q).GFset nu Set.univ =
      covol (canonical36 I (if s then p-1 else p)
        (if s then q else q-1)).GFset nu' Set.univ

theorem pair_of_rect42 (h : CanonicalRectanglePair42) :
    CanonicalTamagawaPair41 := by
  intro I p q hn s hs
  obtain ⟨a, nu, nu', ha0, hat, hR, h1, h2, he⟩ := h I p q hn s hs
  refine ⟨a, ha0, hat, hR, ?_⟩
  exact (rect_scaled_eq42 _ _ _ h1).symm.trans
    (he.trans (rect_scaled_eq42 _ _ _ h2))

end GlobalTheory.FlagMeas.VolRatio

namespace GlobalTheory.CountFinal
open GlobalTheory.FlagMeas.VolRatio
theorem countingTheorem_of_rect42 (h : CanonicalRectanglePair42) :
    GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  have hp := pair_of_rect42 h
  first
  | (rh_reduce 2 using [countingTheorem_of_pair41]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countingTheorem_of_pair41 hp
end GlobalTheory.CountFinal

rh_scan GlobalTheory.GaugeTransport.gaugeVol_transport limit 2000
rh_scan GlobalTheory.AdelicUnimod.adelic_unimodular limit 2000
rh_prune GlobalTheory.FlagMeas.VolRatio.haar_eq_one_test42 as RHThetaHaar42Pruned
rh_scan GlobalTheory.FlagMeas.VolRatio.pair_of_rect42 limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_rect42 limit 2000
#print axioms GlobalTheory.FlagMeas.VolRatio.haar_eq_one_test42
#print axioms GlobalTheory.FlagMeas.VolRatio.rect_scaled_eq42
#print axioms GlobalTheory.FlagMeas.VolRatio.pair_of_rect42
#print axioms GlobalTheory.CountFinal.countingTheorem_of_rect42

end
