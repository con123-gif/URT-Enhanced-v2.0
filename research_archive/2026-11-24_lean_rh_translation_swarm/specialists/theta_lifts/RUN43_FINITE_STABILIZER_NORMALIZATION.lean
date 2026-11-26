import RUN42_ONE_RECTANGLE_TAMAGAWA_TRANSPORT

/-!
Lane 8 RUN43, 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED Lean,
not compiled. RH OPEN.

Current mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory engine; original mission e0dc8f7f blob 4a45e612; AGENTS,
SWARM, HANDOFF, EXPANSION, continuity/state/log/protocol openings,
living proof fd2d51ae41d5a18a548f009918f298f1bf0e222c read.
Latest 22 branch commits surveyed; previous theta cdd5e8d1, editor
8c83c632 and geometry 75e75229 read in detail. Editor now propagates
the signed mass defect through both count callers, geometry selects
the SW mean; neither is assumed verified. Integration ce4476bd and
kernel 86de3c73 noted. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream HEAD separately observed e063a923620ee7787b4a1270421478645bf66bdb;
not migrated or semantically compared.

NEW: factor the transported global Haar BEFORE the RUN42 rectangle
test. It suffices to normalize the FINITE Haar on the native Kset.
No extra real rectangle, unknown global Haar scalar or proof of
global Haar uniqueness is needed for this adapter.

Fix one native canonical host I, gauge witness w, write
  H = product of native real muG, c = ofReal(product_v w.c v),
  m = w.mu, k = m(Kset) in (0,infinity).
Let v be the transported regularized finite Haar, including ALL
global Tamagawa scalar factors, with v(Kset)=a. Uniqueness on I.Gf
gives v=(a/k)m, by evaluating at Kset. The exact native product
measure (archimedean density c H, already derived in RUN42) is
  nu = c*(H tensor v) = (a*c/k)*(H tensor m).
Hence
  covol(GFset,nu,univ) = scaledCovol41(w,a).
This uses only finite Haar uniqueness and native product scaling.
It works for every raw w, with no assumption on its arbitrary
normalization; no division by covol or by real-rectangle mass.
The native source gaugeVol_transport itself uses finite Haar
uniqueness and product-scalar transport, but for a different
same-rank lattice comparison. Here the target is calibration of
each rank separately, not an isomorphism between adjacent ranks.

Explicit human standard finite construction, using RUN37/38
dictionary and RUN39 local trace calculation:
  Kset corresponds to product_v K_v, K_v=integral stabilizer.
  h_v=trace-density Haar / trace-density Haar(K_v).
These are genuine Haar with K_v mass 1. Their restricted product
h_f exists: on each open subgroup (prod_{v in S} U_v) times
(prod_{v not in S} K_v) take the product of h_v at S and the
compact probability measures outside S. The restrictions agree
as S grows because every additional factor K_v has mass one.
Countably many places give a countable open cover and a
sigma-finite left Haar on the whole group. For any left
translation, enlarge S to contain the finitely many nonintegral
components; invariance follows there from local invariance.
Therefore h_f(product K_v)=1 exactly, no raw conditional product.

For unramified CM hosts, q_v residue size, chi_v=+/-1, and
n=p+q, put P_n(v)=prod_{j=2}^n(1-chi_v^j/q_v^j).
The RUN39 stabilizer density multiplied by L_v(1,chi) is P_n(v).
Set a_n=d^(-n^2/2)/L(1,chi) * prod_v P_n(v) as in RUN40.
The standard regularized finite Haar, with the field-discriminant
and L(1) scalar assigned to the finite factor, is a_n h_f.
This can be checked on the generating finite-place rectangles,
NOT by interchanging two conditionally convergent products.
At every v regularize j=1 first. For any finite S,
prod_{v in S} P_(n-1)(v)/P_n(v)
 = prod_{v in S}(1-chi_v^n/q_v^n)^(-1).
For rational-prime cutoff B>=2, f=[F:Q], n>=3, the log tail of
this last product is bounded absolutely by
  f * B^(1-n)/((n-1)*(1-2^(-n))).
Indeed there are at most f places over each rational prime l,
q_v>=l, and |log(1-u)|<=|u|/(1-|u|); majorize the sum over
l>B by all integers>B and integrate t^(-n) from B to infinity.
For the full P_n tail, sum the same geometric majorant over
j>=2 (bounded by a constant times f/B uniformly in n).
These are unconditional convergent products; the rank ratio
a_(n-1)/a_n=d^(n-1/2)L(n,chi^n) follows as RUN40, without
evaluating the common rank-one constant. The finite pushforward
to I.Gf uses the actual canonical lattice and continuous group
equivalence from RUN37/38, hence Haar and Kset mass a_n.
This human construction supplies the scalar of the proposed finite
witness, conditional on native transport; it does not itself
check the equivalence in Lean or the classical quotient theorem.
The remaining global premise is equality of covolumes for the
two EXPLICIT product measures via tau(SU)=1 and the rational
determinant section (RUN40); do not assume that equality as a proof.
Rank changes retain F,E,CM and the common determinant torus,
not an unrelated host. The independent SW/D.vol and signed
mass budget are not discharged by the finite adapter.

Pinned native source consulted:
 src/Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
 2103e49fe83fce42d4962f85acd9d4f6a589d645 (Kset, Kg, GFset, muA)
 src/Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
 DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
 IsGaugeAll.lean 5abc045266b05be6cd3f3fcc67b369ddd167f92b
 src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 FiniteAdelicUnitaryCongruenceTopology.lean 3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba
 GaugeVolumeEqOfSemilinearIsometryGenus.lean d8e911ba588e91954a6b50bf044fd455e8715376
 MassRatioRankFactor.lean 7ab7981637d6ed6f39e65cea95e69571c851300c
 src/Formalism/HermitianLattices/StatementMass.lean
 33a3ea93298eff7969409462ddfc1ed22f173939.
All read at pin. No import of claimed RH theorem.
Original graph: CountingTheorem -> VolumeStep; RUN36 CanonicalRank36,
RUN41 CanonicalTamagawaPair41, RUN42 CanonicalRectanglePair42.
Candidate: finite regularized Haar pushforward, Kset mass,
real gauge and actual covol equality -> FiniteProductPair43
-> CanonicalTamagawaPair41 -> actual countingTheorem_of_pair41.
Preserve original and reduced graph separately and unexpanded
type/value/constructor edges, all unresolved axioms. Context key:
pin,toolchain,F/E/CM,canonical rank/signature, actual w, Kset, local
density, finite restricted-product Haar, scalar convention, GFset,
consumer. Backtrack to RUN42 or original VolumeStep if replay fails.

Executed exact rational regression in connector V8: 448 local
rank-product ratios, 1792 rectangle-mass cancellation checks,
two negative controls (omit raw K normalization or rank-one
regularization), all completed. Reproduce:
 const qs=[2n,3n,4n,5n,7n,8n,9n,11n,16n,25n,27n,32n,49n,64n];
 const mul=(a,b)=>[a[0]*b[0],a[1]*b[1]],
 div=(a,b)=>[a[0]*b[1],a[1]*b[0]],
 eq=(a,b)=>a[0]*b[1]===b[0]*a[1];
 for(const q of qs)for(const c of [-1n,1n])
 for(let n=3n;n<=18n;n++){
   let P=[1n,1n];
   for(let j=2n;j<=n-1n;j++)P=mul(P,[q**j-c**j,q**j]);
   let Pn=mul(P,[q**n-c**n,q**n]);
   if(!eq(div(P,Pn),[q**n,q**n-c**n]))throw Error("ratio");
   for(const k of [[1n,3n],[2n,1n],[7n,5n],[11n,2n]]){
     let a=Pn,arch=[5n,3n],raw=[13n,11n];
     if(!eq(mul(mul(arch,div(a,k)),mul(raw,k)),
       mul(mul(arch,raw),a)))throw Error("calibration");
   }
 }
 if(eq(mul([5n,3n],[2n,1n]),[5n,3n]))throw Error("omit normalization");
 if(eq([1n,2n],[1n,1n]))throw Error("rank-one");
These are arithmetic regressions, not native measure tests.
Local command -v lean/lake absent. Retrieved actual baseline status
JSON blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717: returncode 0, runs
45577239749 and 45576756833. Baseline only; new file uncompiled,
no CI queue submission or fresh axiom evidence. Earlier conditional
root axioms propext, Classical.choice, Quot.sound; 324 nodes pending.
No URT claim or experiment (exact algebra sufficient).

RESUME HERE: replay RUN36/41/42/43 in pinned runner; check actual
canonical finite dictionary pushforward for v_f and native GFset
rational quotient transport. Apply the classical determinant-split
quotient theorem to the explicit native product pair, not another
scalar rewrite. Check actual counting caller, then TopG/Green.
Retain editor signed mass defect, geometry SW, uniform same-host
CountI/II/V/Vs, J/VWin and prime-window obligations.
HANDOFF TO kernel, audit, geometry, editor, integration, literature.
-/

open MeasureTheory NumberField Finset Formalism.MainNotions.S
open GlobalTheory.Count GlobalTheory.FlagMeas
open scoped ENNReal NNReal

noncomputable section
namespace GlobalTheory.FlagMeas.VolRatio

structure FiniteWitness43 (I : AutInst) (a : ENNReal) where
  mu : Measure I.Gf
  sf : SigmaFinite mu
  haar : mu.IsHaarMeasure
  norm : mu I.Kset = a

def nativeProduct43 {I : AutInst} (w : GaugeWitness36 I)
    {a : ENNReal} (v : FiniteWitness43 I a) : Measure I.GA :=
  letI : SigmaFinite v.mu := v.sf
  ENNReal.ofReal (∏ t, w.c t) • I.muA v.mu

theorem finite_scale43 {I : AutInst} (w : GaugeWitness36 I)
    {a : ENNReal} (v : FiniteWitness43 I a) :
    v.mu = (a / w.mu I.Kset) • w.mu := by
  letI : SigmaFinite w.mu := w.sf
  letI : w.mu.IsHaarMeasure := w.haar
  letI : v.mu.IsHaarMeasure := v.haar
  obtain ⟨_, _, _, hKc, hKo, ⟨K,hK⟩, _⟩ :=
    GlobalTheory.CongTop.adelic_topology I
  have h0 : w.mu I.Kset ≠ 0 :=
    (hKo.measure_pos w.mu ⟨1, by rw [← hK]; exact K.one_mem⟩).ne'
  have ht : w.mu I.Kset ≠ ⊤ := hKc.measure_lt_top.ne
  apply haar_eq_one_test42 w.mu v.mu I.Kset h0 ht
  rw [v.norm]
  first
  | exact (ENNReal.div_mul_cancel h0 ht).symm
  | rw [div_eq_mul_inv, mul_assoc, ENNReal.inv_mul_cancel h0 ht, mul_one]

theorem nativeProduct_eq43 {I : AutInst} (w : GaugeWitness36 I)
    {a : ENNReal} (v : FiniteWitness43 I a) :
    nativeProduct43 w v = (a * gaugeScale41 I w.c w.mu) • rawMu42 w := by
  letI : SigmaFinite w.mu := w.sf
  letI : SigmaFinite v.mu := v.sf
  unfold nativeProduct43 rawMu42 AutInst.muA
  rw [finite_scale43 w v, Measure.prod_smul_right, ← mul_smul]
  unfold gaugeScale41
  congr 1
  simp only [div_eq_mul_inv]
  ac_rfl

theorem nativeProduct_covol43 {I : AutInst} (w : GaugeWitness36 I)
    {a : ENNReal} (v : FiniteWitness43 I a) :
    covol I.GFset (nativeProduct43 w v) Set.univ = scaledCovol41 w a := by
  rw [nativeProduct_eq43]
  rfl

def FiniteProductPair43 : Prop :=
  ∀ (I : AutInst) (p q : ℕ), 3 ≤ p + q → ∀ s : Bool,
    (if s then 1 ≤ p else 1 ≤ q) →
    ∃ (a : ENNReal)
      (v : FiniteWitness43 (canonical36 I p q) a)
      (v' : FiniteWitness43 (canonical36 I
        (if s then p-1 else p) (if s then q else q-1))
        (a * ENNReal.ofReal (rankFac I.E (p+q)))),
      a ≠ 0 ∧ a ≠ ⊤ ∧ ENNReal.ofReal (rankFac I.E (p+q)) ≠ 0 ∧
      covol (canonical36 I p q).GFset
        (nativeProduct43 (witness36 (canonical36 I p q)) v) Set.univ =
      covol (canonical36 I (if s then p-1 else p)
        (if s then q else q-1)).GFset
        (nativeProduct43 (witness36 (canonical36 I
          (if s then p-1 else p) (if s then q else q-1))) v') Set.univ

theorem pair_of_finite43 (h : FiniteProductPair43) : CanonicalTamagawaPair41 := by
  intro I p q hn s hs
  obtain ⟨a,v,v',ha0,hat,hR,he⟩ := h I p q hn s hs
  refine ⟨a,ha0,hat,hR,?_⟩
  exact (nativeProduct_covol43 _ v).symm.trans
    (he.trans (nativeProduct_covol43 _ v'))

end GlobalTheory.FlagMeas.VolRatio

namespace GlobalTheory.CountFinal
open GlobalTheory.FlagMeas.VolRatio
theorem countingTheorem_of_finite43 (h : FiniteProductPair43) :
    GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  have hp := pair_of_finite43 h
  first
  | (rh_reduce 2 using [countingTheorem_of_pair41]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countingTheorem_of_pair41 hp
end GlobalTheory.CountFinal

rh_scan GlobalTheory.GaugeTransport.gaugeVol_transport limit 2000
rh_scan GlobalTheory.CongTop.adelic_topology limit 2000
rh_prune GlobalTheory.FlagMeas.VolRatio.finite_scale43 as RHThetaFiniteScale43Pruned
rh_scan GlobalTheory.FlagMeas.VolRatio.pair_of_finite43 limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_finite43 limit 2000
#print axioms GlobalTheory.FlagMeas.VolRatio.finite_scale43
#print axioms GlobalTheory.FlagMeas.VolRatio.nativeProduct_eq43
#print axioms GlobalTheory.FlagMeas.VolRatio.pair_of_finite43
#print axioms GlobalTheory.CountFinal.countingTheorem_of_finite43
end
