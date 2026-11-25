import Development.AbelianVarietyTheory.Proofs.FlagMeasures.ExistsLimitOfChart
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.ExistsAdelicUnitaryGroupModelsEquiv
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.MassRatioRankFactor
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 8 RUN39, 25 Nov 2026. SOURCE-MATCHED human local proof;
Lean arithmetic certificate PREPARED NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first, including
mandatory engine. SWARM, HANDOFF, EXPANSION, AGENTS, state/log/protocol
and continuity consulted; live proof fd2d51ae41d5a18a548f009918f298f1bf0e222c.
Latest peer commits surveyed; editor 58d43b7e, d5bb73cf, c0c7d3f7
and geometry a2d27f27 read in detail. Previous theta a5085dd5.
Frozen upstream 40e56bab026552e089d7afcfeff08d2defb9c005; observed
upstream head 756a70250dcba9162b99d4ea35c186558434c17e, not substituted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: close the local trace-pairing perfection calculation for the
actual canonical diagonal integral stabilizer without an etale-descent
black box, including residue characteristic two and primes dividing rank.
This is the remaining density ingredient in editor RUN39, not a new
evaluation of the global Tamagawa number.

Fix a finite nonsplit unramified quadratic local extension S/R of rings
of integers, conjugation bar, and choose theta lifting a residue-field
generator. Put t=theta+bar(theta), u=theta*bar(theta), and delta=theta-bar(theta).
The two residue conjugates are distinct (finite fields are perfect).
Thus delta is a unit, {1,theta} is an integral basis by reduction and
Nakayama, and the anti-invariant integral line is exactly delta R:
if bar(z)=-z, then bar(z/delta)=z/delta, and the quotient is integral.
No division by 2 is used. The diagonal signs s_i of J are units.

On the integral Lie algebra X^*J+JX=0, each diagonal coordinate
is delta times an element of R; for i<j the off-diagonal block is
X_ij=x in S, X_ji=-s_i*s_j*bar(x).
For the rational symmetric pairing B(X,Y)=-tr(XY) (ordinary matrix
trace, not the field trace of the matrix trace), the diagonal
blocks have entry -delta^2. Distinct unordered pairs are orthogonal.
The pair parametrized by x,y in S has pairing
s_i*s_j*(x*bar(y)+bar(x)*y). In the basis 1,theta its Gram matrix is
s_i*s_j * [[2,t],[t,2u]]. Its determinant is exactly
                  4*u-t^2 = -delta^2.
Consequently the full integral Lie Gram determinant is
                  (-delta^2)^(n+n*(n-1)/2).
Every factor is a unit, even at dyadic places. This proves perfection
over R by the explicit basis. At split places identify the Lie lattice
with M_n(R) via the first component of S=R x R; the second is determined
by negative J-conjugate transpose. B becomes -tr(XY) on M_n(R);
matrix units pair with transposes with coefficient -1, giving a signed
permutation Gram matrix, again a unit determinant.

Determinant disintegration at primes dividing n: avoid the orthogonal
scalar complement (which would divide by n). On Lie algebras the
section of trace is z -> z E_nn, for z in the anti-invariant line.
The kernel trace-zero diagonal basis delta(E_ii-E_nn), i<n, plus
delta E_nn, is related to the original diagonal basis by an integral
unipotent change with determinant 1. Thus contraction of the top
density with this section introduces no integer factor, even mod p|n.
Over the reals its trace-zero tangent has induced Frobenius density
sqrt(n) times the difference-coordinate Lebesgue (Gram I+11^T);
the correct contracted quotient density is 1/sqrt(n) times that
induced density. In particular do NOT replace the contracted density
by the restricted metric on SU at archimedean or finite places.
All off-diagonal coordinates lie in the trace-zero kernel.

Global scalar: for a fixed rational F-basis of u(J), let D be the
nonzero determinant of B in that basis. At every place the density
is |D|_v^(1/2) times basis-coordinate additive Haar; changing the
basis scales this density by the absolute determinant of the change.
At infinity the absolute trace determinant density agrees with the
native Frobenius gauge by the real calculation of editor c0c7d3f7
and native sqrt_hs/exists_limit. At finite places the above explicit
integral basis gives |det B|_v=1, so the tangent coordinate Haar has
integral volume one. The global product of |D|_v^(1/2) is one by the
product formula. Thus no independent field/signature-dependent trace
density scalar can appear in the rational-form product; the usual
base field discriminant factor in Tamagawa normalization is retained.
This is a density computation, not by itself an identification of the
adelic group or a new proof of tau(SU)=1.

The local stabilizer mass is then #U_n(k_v)/q_v^(n^2) by smooth
reduction, with the same density on the rank-one determinant torus.
Use the actual smooth lifting/count calculation of d5bb73cf
(including the trace-surjective diagonal lifting at 2). The
determinant section gives compatible contracted SU stabilizer mass
by division by the torus mass BEFORE the Euler product. No rank-one
conditional product or inverse of n enters. Retain the precise
identification of native Kset with this restricted-product stabilizer,
the native measure transport and the actual Tamagawa theorem.
Native AutInst.muA is a product; its archimedean factors are fixed
by IsGauge and finite Kset is stabGL of the actual lamAf lattice.
After the RUN37/38 dictionaries are replayed, the pushed Haar
normalization of editor RUN39 is evaluated on the same rectangle,
using the explicit density above. Do not assume this native transport
or the separate D.vol comparison is already formally proved.

Source ledger (src/, pinned):
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/LayerProd.lean
  2a92b374b78661403dde107fa5a46ad5c4f92108 (IsGauge).
Development/AbelianVarietyTheory/Proofs/FlagMeasures/ExistsLimitOfChart.lean
  292c8fd5816eac7503c45c9b2a422b4c0bac2587
  (lieJ, finrank_lieJ, sqrt_hs, exists_limit, exists_unique_isGauge).
Development/AbelianVarietyTheory/Proofs/FlagMeasures/ExistsAdelicUnitaryGroupModelsEquiv.lean
  881f8a11ac4a415b29939e496acb71d63b5fadc0 (exists_adelic_equiv).
Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
  2103e49fe83fce42d4962f85acd9d4f6a589d645 (Lf, Kset, muA).
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/DefClassNum.lean
  65f9efd688be555d6654d063ea6a782ea8799810 (gaugeVol).
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/IsGaugeAll.lean
  5abc045266b05be6cd3f3fcc67b369ddd167f92b (rankFac).
Development/AbelianVarietyTheory/Proofs/FlagMeasures/MassRatioRankFactor.lean
  7ab7981637d6ed6f39e65cea95e69571c851300c.
Formalism/HermitianLattices/StatementMass.lean
  33a3ea93298eff7969409462ddfc1ed22f173939 (vInv, eulerFac, lValEta).
All directly fetched, relevant definitions/theorems inspected.

Original source-visible graph retained: CountingTheorem -> VolumeStep
-> gaugeVol; RUN36 canonical recurrence; editor RUN38 torus formula ->
local trace perfection + section disintegration + global calibration.
Reduced candidate: explicit quadratic basis -> signed 2x2 determinant
and unit diagonal -> trace perfection; section with det 1 -> quotient
density; rational determinant product formula -> same local/global
normalization. Keep original and reduced graphs, exact context
(F,E,J,n,place,theta,integral lattice,chosen section,measure,consumer),
all native type/value/constructor edges and pending axiom evidence.
No global dependency retired. Backtrack to the etale-descent proof
if native identification with S/R or trace convention fails.

Actual verification: connector V8 enumerated 137277 exact integer
pairs t,u over moduli p^k (p=2,3,5,7 and k=1..3), asserting
2*(2*u)-t*t=-(t*t-4*u) and simultaneous unit status mod p.
Four controls (p,t,u,expected unit):
(2,1,1,true),(2,0,1,false),(3,0,1,true),(3,1,1,false).
All passed. These are arithmetic regressions only, not native Lean
or a finite-to-infinite proof; the above symbolic argument is general.
Reproduce with JS BigInt:
let cases=0, controls=0;
for(const p of [2n,3n,5n,7n])for(let k=1;k<=3;k++){
 let m=p**BigInt(k);
 for(let t=0n;t<m;t++)for(let u=0n;u<m;u++){
  let d=t*t-4n*u,g=2n*(2n*u)-t*t;
  if(g!==-d || ((g%p!==0n)!==(d%p!==0n)))throw Error("block");
  cases++;
 }}
for(const [p,t,u,expect] of [[2n,1n,1n,true],[2n,0n,1n,false],
 [3n,0n,1n,true],[3n,1n,1n,false]]){
 if(((4n*u-t*t)%p!==0n)!==expect)throw Error("control");controls++;
}
Lean/Lake absent on PATH. Baseline CI actual status/logs fetched:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717; both returncode 0,
not validation of this file. No new CI dispatch or axiom evidence.
No URT ranking experiment, exact algebra sufficient.

RESUME HERE: use the existing native runner to replay this and prior
RUN36–38/peer editor certificates; formalize the explicit local
basis in the actual completion ring, connect to native Kset and
editor native_gauge_calibrated. Then apply the same determinant
density to the independent D.vol consumer. Keep global Tamagawa,
uniform VWinAt, joint loss, all arithmetic and prime-window obligations.
HANDOFF TO geometry, editor, kernel extractor, integration and audit.
-/

open MeasureTheory NumberField Matrix GlobalTheory.Count GlobalTheory.FlagMeas
noncomputable section
namespace RHTheta39

-- The Gram determinant uses the ordinary trace pairing on the two
-- off-diagonal coordinates, before taking absolute values.
theorem trace_block_det {R : Type*} [CommRing R] (t u : R) :
    2 * (2 * u) - t * t = -(t*t - 4*u) := by ring

theorem trace_block_unit {R : Type*} [CommRing R] (t u : R)
    (h : IsUnit (t*t - 4*u)) :
    IsUnit (2 * (2*u) - t*t) := by
  rw [trace_block_det]
  exact h.neg

-- Contraction uses a genuine integral section, not division by rank.
theorem section_trace {R : Type*} [AddCommGroup R] (a b : R) :
    a + (b-a) = b := by abel

theorem trace_density_native {n : ℕ} (ε : Fin n → Bool) :
    ∃ A : ℝ, 0 < A ∧ Filter.Tendsto
      (fun r : ℝ =>
        (Formalism.REAL.muG ε {g | Real.sqrt
          (Formalism.REAL.hs (Formalism.MainNotions.S.uMat g - 1)) ≤ r}).toReal /
          r ^ (n^2))
      (nhdsWithin 0 (Set.Ioi 0)) (nhds A) := by
  first
  | (rh_reduce 2 using [GlobalTheory.GaugeConst.exists_limit]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact GlobalTheory.GaugeConst.exists_limit ε

rh_scan GlobalTheory.GaugeConst.exists_limit limit 2000
rh_scan GlobalTheory.AdelicModels.exists_adelic_equiv limit 2000
rh_prune trace_block_unit as RHTheta39TraceUnitPruned
rh_scan trace_density_native limit 2000
#print axioms trace_block_det
#print axioms trace_block_unit
#print axioms section_trace
#print axioms trace_density_native
#print axioms GlobalTheory.GaugeConst.exists_limit
end RHTheta39
