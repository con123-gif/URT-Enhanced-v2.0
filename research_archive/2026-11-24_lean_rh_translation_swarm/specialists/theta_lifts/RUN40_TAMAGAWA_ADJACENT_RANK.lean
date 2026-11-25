import RUN36_CANONICAL_GAUGE_RANK
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.MassRatioRankFactor

/-!
Lane 8 RUN40, 25 Nov 2026. HUMAN derivation using classical Tamagawa
theorem, native calibration still PREPARED / not compiled. RH OPEN.
Read current mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 first,
including mandatory engine, AGENTS 8db0201d, SWARM 4b77b161,
HANDOFF bbc46df7, EXPANSION c8152d07, continuity/state/log/protocol
and living proof fd2d51ae41d5a18a548f009918f298f1bf0e222c (long
records inspected in part). Latest 22 commits surveyed; geometry
9530ff09, editor a5db7249, integration a5f9e0570 and prior theta
5a05ee9c read in detail. This calculation compares DIFFERENT ranks,
not just signatures at fixed rank. Prior canonical interface
410fcbc20712f9f51032960ea07b0b14f2f65e8b retained.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream
HEAD 756a70250dcba9162b99d4ea35c186558434c17e not substituted.
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: derive the exact native rankFac from the regularized
Tamagawa measure, with no separate definite mass formula, no
compact-dual rank scalar and no rank-one Euler product evaluation.
The remaining source-level task is to replay the native calibration,
not to find an additional unknown numerical factor.

Fix the SAME totally real F and everywhere finite-unramified CM E/F,
canonical diagonal Hermitian hosts of ranks n and n-1 (n>=3),
coordinate self-dual lattices, any allowed signatures. Let d=|D_F|,
f=[F:Q]=fDeg E, chi the quadratic character of E/F, and
L_j=L(j,chi^j) for j>=2. At each finite place v let q_v be the residue
cardinality and chi_v in {+1,-1} be split/inert. The preceding
theta and geometry local computations give trace-density stabilizer
mass prod_{j=1}^n (1-chi_v^j/q_v^j). At infinity the native c*muG
gauge has the Frobenius tangent Lebesgue density, which in a diagonal
signature frame equals the absolute determinant density of tr(XY)
(the signs change but the absolute determinants do not). This is
the gauge convention, NOT the CDHaar probability convention.
For each rank separately the rational trace Gram determinant's
absolute square root multiplies to 1 over all places. The
regularized Tamagawa measure, with finite additive O_v volume 1,
real Lebesgue and the common determinant character, is therefore

  T_n = d^(-n^2/2) L(1,chi)^(-1)
           [prod_real d_n,v] [prod_finite L_v(1,chi) d_n,v].

Here the notation for the product denotes the restricted product
defined by its convergent rectangle values, not a raw unregularized
infinite product. The d^(-n^2/2) is the additive adele normalization
in dimension n^2; it MUST change with rank. The character module
and L(1,chi) are common at both ranks. Evaluate the measure on
an archimedean finite positive rectangle times the coordinate
integral stabilizer. Cancel the j=1 factor locally first:
  L_v(1,chi) d_n,v(K_v)=prod_{j=2}^n(1-chi_v^j/q_v^j).
The remaining product converges absolutely and is positive,
using sum_v q_v^(-2)<infinity. Thus, relative to real trace
Haar times finite Haar with stabilizer volume 1, the global
Tamagawa scalar is exactly
  a_n=d^(-n^2/2) / (L(1,chi)*prod_{j=2}^n L_j).
The native gaugeVol equals the quotient volume for that normalized
Haar: this uses the editor's finite stabilizer membership,
native covol_map/covol_smul, lattice coordinate comparison, and
the real gauge calibration, not a compact-dual probability Haar.
These mathematical transport steps are retained for native replay.

Classical global theorem: SU(J) is simply connected semisimple
for n>=2, so tau(SU(J))=1 (Kottwitz 1988, or classical unitary
case). The determinant map to T=Res^1_{E/F} G_m has an F-rational
section z -> diag(1,...,1,z) for these diagonal hosts. Hence
U(J)=SU(J) semidirect T, over F and over all local/adelic points.
Use compatible invariant top densities in this splitting; the
conjugation action preserves the SU Haar (its determinant character
on the semisimple Lie algebra is trivial). The dimensions add
and the rational character module is exactly that of T. Thus the
Tamagawa measure disintegrates with the same torus measure at
every rank. The rational quotient fibres are copies of
SU(F)\SU(A_F), with monodromy by Haar-preserving conjugation
and no index from determinant image (the section is rational).
Quotient integration gives tau(U(J))=tau(T)*tau(SU(J))=tau(T).
One does not need the value of tau(T); it is finite positive
by the usual anisotropic torus volume theorem. This argument
uses established Tamagawa theory as a mathematical foundation,
not any asserted RH theorem. References (metadata checked):
Kottwitz, Tamagawa numbers, Ann. Math. 127 (1988), 629-646,
https://annals.math.princeton.edu/1988/127-3/p05 ;
Weil, Sur certains groupes d'operateurs unitaires, Acta Math.
111 (1964), 143-211, https://doi.org/10.1007/BF02391012 ;
https://encyclopediaofmath.org/wiki/Tamagawa_measure .
Full primary texts not independently reread this run; the standard
simply-connected Tamagawa theorem and quotient integration remain
explicit external foundations. No reliance on the RH exposition.

Combining the calibration with the global theorem yields, in human
mathematics, for every canonical signature of rank n>=2,
  C_n = tau(T) L(1,chi) d^(n^2/2) prod_{j=2}^n L_j.
Taking adjacent ranks CANCELS the entire common torus constant
and all lower-rank L-values:
  C_n / C_(n-1) = d^(n-1/2) L_n.
Now |D_E|=d^2 by the relative discriminant formula (unramified at
all finite places) and fDeg E=f. Thus 2*vInv E=d^(1/f).
The native lValEta E n equals L_n: at an inert v the single
prime of E has norm q_v^2 and sqrt(norm)=q_v; at a split v
two conjugate primes each have norm q_v and contribute
(1-q_v^(-n))^(-1/2) each. Group conjugate primes before the
product; n>=2 gives absolute convergence and positive factors.
Therefore
  d^(n-1/2) L_n
    = (2*vInv E)^(fDeg E*(n-1/2))*lValEta E n
    = rankFac E n,
exactly the native IsGaugeAll definition. In particular
  C36(I,p,q)=C36(I,p-1,q)*ofReal(rankFac E (p+q))
and likewise for q decrement, subject to the stated transport.
No division by zero/infinite ENNReal: at the human level all
factors are finite positive, and the Lean adapter below uses
multiplication only. This is a source-matched mathematical
supplier of the scalar recurrence, NOT yet a kernel-checked
proof of native CanonicalRank36. The earlier peer's rank-fixed
regularized scalar C(F,E,n) has now been computed with its
rank dependence rather than assumed common across ranks.

Native graph BEFORE (source-visible):
 CountTypedOfVolumeStep.count_typed_of_volumeStep ->
 unitaryAutomorphicCounting_of_compactDualVolumeRatio ->
 VolumeStep -> rank-only step, VolRatio.volumeRatio_of_volumeStep.
 Candidate from RUN36:
 countingTheorem_of_canonical36 -> CanonicalRank36 ->
 canonical host, VolumeInvariant, gauge witnesses.
 New candidate:
 standard canonical transport + local trace determinants +
 finite Euler grouping + determinant split + tau(SU)=1 ->
 calibrated rank formula -> rankFac recurrence ->
 CanonicalRank36 -> actual countingTheorem_of_canonical36.
 Original and candidate graphs remain separate. Other consumers
 of VolumeStep, CDHaar, D.vol, exact mass and flag bounds survive.
 No globally retired edge; preserve original type/value/constructor
 and axiom ledger, all pending nodes and same-host joint losses,
 arithmetic/Sha/CountI/II/V/Vs, TopG, ASK-MAIN, VWin and prime
 window obligations. Context key: pin, F,E,cm,rank,signature,
 lattice,gauge,finite measure,character,module,consumer. Rank
 changes invalidate the discriminant and finite product parts,
 not the common torus constant. Backtrack to original VolumeStep
 if any measure bridge or native replay fails.

Pinned source ledger (relative to src):
 Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
 IsGaugeAll.lean 5abc045266b05be6cd3f3fcc67b369ddd167f92b
 DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
 LayerProd.lean 2a92b374b78661403dde107fa5a46ad5c4f92108
 Formalism/HermitianLattices/StatementMass.lean
 33a3ea93298eff7969409462ddfc1ed22f173939
 Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 MassRatioRankFactor.lean 7ab7981637d6ed6f39e65cea95e69571c851300c
 AutInstDegreeRootDiscriminantRank.lean df04116cce36862666e015d69b4bffc8a7c3deda
 HermVolumeRatioSameKindOfVolumeRatioInduction.lean cac12fba955e10e2eb7ccc24b94bfe053987a9e7
 CountTypedOfVolumeStep.lean 51eec4beb9bed7964345b1fc40a14541dd643cd1
 ExistsLimitOfChart.lean 292c8fd5816eac7503c45c9b2a422b4c0bac2587
 GaugeVolumeEqOfSemilinearIsometryGenus.lean d8e911ba588e91954a6b50bf044fd455e8715376
 All fetched at the pin, source definitions and relevant callers read.

Executed connector V8 exact arithmetic regression (not a proof
of global Haar transport): 672 local product recurrence checks,
3920 doubled exponent identity checks and one omitted-discriminant
negative control. Reproduce:
 let count=0, exponent=0;
 for(const q of [2n,3n,4n,5n,7n,8n,9n,11n,16n,25n,27n,32n,49n,64n])
 for(const c of [-1n,1n]) {
   let A=1n,B=1n;
   for(let n=1n;n<=24n;n++){
     let qn=q**n,cn=c**n,oldA=A,oldB=B;
     A*=qn-cn; B*=qn;
     if(A*oldB*qn!==oldA*B*(qn-cn)) throw Error("rank");
     if(c===1n && (qn-cn)**2n!==(qn-1n)**2n) throw Error("split");
     if(c===-1n && (q*q)**n!==qn*qn) throw Error("inert");
     count++;
   }
 }
 for(let f=1n;f<=40n;f++)for(let n=3n;n<=100n;n++){
   if(f*n*n-f*(n-1n)**2n!==f*(2n*n-1n)) throw Error("exponent");
   exponent++;
 }
 if(3n**(3n*3n-2n*2n)===1n) throw Error("negative control");
 Local command -v lean/lake returned no path. Actual earlier CI
 status files fetched b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
 7da354941e402b6f8b364ed03d8c5c82d27b7717, both returncode 0.
 Runs 45577239749, 45576756833 baseline only, not this adapter.
 New native compilation and axiom scan unavailable; no queue claim,
 no new root obligation formally closed, no URT comparison.

RESUME HERE: independently audit determinant quotient integration
and the explicit discriminant normalization across ranks; batch
RUN36 + this adapter and peer trace/stabilizer transport in the
existing pinned runner. Supply the actual native C36 calibration
(rational quotient and invariant measure) and audit Euler grouping.
Do not introduce an independent scalar recurrence after this
calculation; if transport checks fail, preserve original VolumeStep.
Then propagate verified counting supplier to actual TopG/Green
consumer; all other VWin and joint-loss obligations remain open.
HANDOFF TO geometry, editor, literature, kernel extractor,
integration and audit.
-/

open MeasureTheory NumberField Matrix Finset Formalism.MainNotions.S
open GlobalTheory.FlagMeas GlobalTheory.Count
open scoped ENNReal BigOperators

noncomputable section
namespace GlobalTheory.FlagMeas.VolRatio

def calibrated40 (b f a : ℝ) (L : ℕ → ℝ) (n : ℕ) : ℝ :=
  a * b ^ (f * (n : ℝ)^2 / 2) * ∏ j ∈ Finset.Icc 2 n, L j

theorem calibrated_succ40 (b f a : ℝ) (L : ℕ → ℝ) (m : ℕ)
    (hb : 0 < b) (hm : 2 ≤ m) :
    calibrated40 b f a L (m+1) =
      calibrated40 b f a L m * (b ^ (f * ((m+1 : ℕ) - (1/2 : ℝ))) * L (m+1)) := by
  have hp : b ^ (f * ((m+1 : ℕ) : ℝ)^2 / 2) =
      b ^ (f * (m : ℝ)^2 / 2) *
      b ^ (f * (((m+1 : ℕ) : ℝ) - 1/2)) := by
    rw [← Real.rpow_add hb]
    congr 1
    push_cast
    ring
  unfold calibrated40
  rw [hp, Finset.prod_Icc_succ_top (by omega : 2 ≤ m+1)]
  ring

def rankCalibration40 : Prop :=
  ∀ I : AutInst, ∃ a : ℝ, 0 < a ∧ ∀ p q : ℕ, 2 ≤ p+q →
    C36 I p q = ENNReal.ofReal
      (calibrated40 (2 * Formalism.HermitianLatticesTheory.vInv I.E)
        (Formalism.HermitianLatticesTheory.fDeg I.E : ℝ) a
        (Formalism.HermitianLatticesTheory.lValEta I.E) (p+q))

theorem canonical_of_calibration40 (h : rankCalibration40) : CanonicalRank36 := by
  intro I p q hn s hs
  obtain ⟨c, hc, hcal⟩ := h I
  let a := if s then p-1 else p
  let b := if s then q else q-1
  have hs' : a+b+1=p+q := by
    dsimp [a,b]
    cases s <;> simp_all <;> omega
  have hm : 2 ≤ a+b := by omega
  change C36 I p q = C36 I a b * ENNReal.ofReal (rankFac I.E (p+q))
  rw [hcal p q (by omega), hcal a b hm]
  have hb : 0 < 2 * Formalism.HermitianLatticesTheory.vInv I.E := by
    have hv := GlobalTheory.FlagMeas.vInv_pos_of_numberField I.E
    positivity
  have he := calibrated_succ40 _ (Formalism.HermitianLatticesTheory.fDeg I.E : ℝ)
    c (Formalism.HermitianLatticesTheory.lValEta I.E) (a+b) hb hm
  rw [hs'] at he
  have he' : calibrated40 (2 * Formalism.HermitianLatticesTheory.vInv I.E)
      (Formalism.HermitianLatticesTheory.fDeg I.E : ℝ) c
      (Formalism.HermitianLatticesTheory.lValEta I.E) (p+q) =
      calibrated40 (2 * Formalism.HermitianLatticesTheory.vInv I.E)
      (Formalism.HermitianLatticesTheory.fDeg I.E : ℝ) c
      (Formalism.HermitianLatticesTheory.lValEta I.E) (a+b) *
      rankFac I.E (p+q) := by
    simpa [rankFac] using he
  rw [he']
  rw [mul_comm _ (rankFac I.E (p+q)),
    ENNReal.ofReal_mul (rankFac_nonneg (p+q)), mul_comm]

end GlobalTheory.FlagMeas.VolRatio

namespace GlobalTheory.CountFinal
theorem countingTheorem_of_calibration40
    (h : GlobalTheory.FlagMeas.VolRatio.rankCalibration40) :
    GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  have hC := GlobalTheory.FlagMeas.VolRatio.canonical_of_calibration40 h
  first
  | (rh_reduce 2 using [countingTheorem_of_canonical36]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countingTheorem_of_canonical36 hC
end GlobalTheory.CountFinal

rh_prune GlobalTheory.FlagMeas.VolRatio.canonical_of_calibration40 as RHThetaRank40Pruned
rh_scan GlobalTheory.FlagMeas.VolRatio.step limit 2000
rh_scan GlobalTheory.FlagMeas.VolRatio.canonical_of_calibration40 limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_calibration40 limit 2000
#print axioms GlobalTheory.FlagMeas.VolRatio.calibrated_succ40
#print axioms GlobalTheory.FlagMeas.VolRatio.canonical_of_calibration40
#print axioms GlobalTheory.CountFinal.countingTheorem_of_calibration40
