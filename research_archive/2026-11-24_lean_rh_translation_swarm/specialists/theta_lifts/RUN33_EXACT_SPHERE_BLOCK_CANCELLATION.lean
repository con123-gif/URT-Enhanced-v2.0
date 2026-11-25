import Development.AbelianVarietyTheory.Proofs.FlagMeasures.FlagExplicitConstantLeExpNegHalf
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN33 — lane 8, 25 November 2026. SOURCE-MATCHED human derivation;
Lean candidate PREPARED, not compiled or queued. No new native PASS.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest observed upstream d91ae2678eea19a0c3045ffca37f1da757c2e719
(merge #3142, 13:24 UTC); no source mixing.
Mission blob cd0a176134d46b5b624896e56843a24915c14477, working head
60892061194daf74d250cd8fa95cb79d04432793, living manuscript blob
464e82f81f646d4af85e1f5f70d379026df46261. Read AGENTS, continuity,
swarm protocol, queue, expansion and RUN32 3c6f175e. Recent peers
3044c307 (up_holds weight), 7e4677d9 (spectral density),
88aa566b (coset mass), 6ee9b256 (diagonal windows) concern distinct
obligations; their RESUME HERE notes inspected.

SOURCE LEDGER (all at pin, src/Development/AbelianVarietyTheory/
Proofs/FlagMeasures/ unless specified):
FlagExplicitConstantLeExpNegHalf.lean 4522eb5477d6470bacad8c3f3782ade21d5bbdd1
LogUnitarySphereVolumeProductRatioLeLargeRank.lean 45d3abe79f9e841e59dde340c96d978a2f62f3e4
LogUnitarySphereVolumeProductRatioLeLargeRankStatement.lean 0b1a3bc95376ed8d43de551ffc317f8c5af31daa
UnitarySphereVolumeProductRatioAndInvBounds.lean 4e8e9cd6aae5d8f32918df0ecdfc09105ce1a670
OneTypeArith.lean e339c69f67e1d2f14b60a13ea946c7a8a3d1601d
NearTermsModeratePointsOneTypeBoundStatement.lean eed052dc3f2006553fb8175d14b784a90f8d5fb2
Statements/CuspFrameWeights/SameKindIsometric.lean (under AbelianVarietyTheory)
c7c7a598be6489574fb7e2ccaad87cb68d1f92dd
NegLogProdLValEtaLeAndPosStatement.lean 4f2de4a0c2547dbd764e1f8c10cd93b824404b7c
DedekindZetaResidueLeSixteenLogRootDiscrPowStatement.lean baee13a3803879829964ac6811da8239a5d47f4a
OneLeDedekindZetaRealValueAndLeZetaPowStatement.lean 282b56019d61fe7ead99f835c4f7246abd99c086

HUMAN BLOCK FOR INTEGRATION (actual supplier constantBound, local T3):
Let S(k)=sphV k, S(0)=1, S(k+1)/S(k)=2*pi^(k+1)/k!.
Let positive blocks j_i sum to J<=q. In native T3 the small
signature and block volumes occur as one quotient, not independent
losses. For m,j>=0 exactly
 S(m+j)/(S(m)S(j)) = product_{k=0}^{j-1} [pi^m k!/(m+k)!].
Since (m+k)!>=m! k!, each factor <= pi^m/m! <= exp(pi)
by the exponential series. Iterating over blocks, starting at q-J,
yields S(q)/(S(q-J)*product_i S(j_i)) <= exp(pi J).
This proof also includes the zero-rank case. No asymptotics, no new
number-field hypothesis, no use of RH or independent host choice.

In constantBound, the native hA controls S(p)/S(p-J) by exp(J*A)
where A=log(2*pi)-(n-2*s)*(log n-(log(2*pi)+1)), n=p+q,
s=sqrt n. Hence the actual T3 left side is <= exp(f*J*(A+pi)).
This is at most its original upper bound
 exp(f*J*(A+3.49+s/2*(log n/2)))
since pi<3.2<3.49 and s,log n>=0. Keep T1,T2,T4,T5 and
FreeQuotientRank unchanged and apply the original numeric lemma:
this directly supplies the original T3 at the actual caller and
retains the native ConstantBound conclusion, hence the rank decay in
RUN32. The separate hB and hC estimates, and ConstBd.inv_sph_le, are
not needed by this candidate T3. The original proof already binds
the final log(fDeg E) hypothesis as an underscore; no global deletion
claimed: log f is still used by moderate_log_factor_absorbed and
possibly other consumers. The CM hypothesis, rank bounds, root
discriminant and residue/L-value inputs are not discharged here.
Prior literature vs new: elementary factorial/exponential identity
is standard; this exact cancellation is a proposed local replacement
in the pinned source, not a claimed new published theorem.

LOCAL SOURCE GRAPH (not elaborated kernel edges):
old constantBound -> T3 -> hA,hB,hC -> large-rank sphere ratio,
 small-rank sphere ratio, inverse sphere bound.
new constantBound candidate -> T3 -> hA, exact block cancellation,
 factorial inequality and exponential series. Keep original graph;
 original proof still retained, including positivity, T1/T2/T4/T5,
 FreeQuotientRank and numeric. Other consumers of removed suppliers
 are not audited. Original root graph, unexpanded nodes, constructor/
 type/value edges and axiom evidence remain untouched.
Context key: source pin/toolchain, actual host E, p,q,f,block j,
 J<=q, native hA, nonnegative s/log n. The block lemma is uniform
 but caller substitution is context dependent. Backtrack to native
 T3 if replay fails. No URT comparison was necessary; no acceleration
 claimed. Root obligations closed independently: zero. Local human
 proof of replacement only; independent caller audit outstanding.

ACTUAL exact Python execution (local container, no Lean/Lake):
from fractions import Fraction as F
from math import factorial,prod
def sph(n):
    return F(2**n,prod(factorial(k) for k in range(n))),n*(n+1)//2
def comps(j):
    if not j:
        yield ()
    else:
        for k in range(1,j+1):
            for tail in comps(j-k):yield (k,)+tail
x=F(16,5); pair=0; many=0
for m in range(31):
    for k in range(31):
        assert factorial(m)*factorial(k)<=factorial(m+k)
        assert F(factorial(k),factorial(m+k))*x**m <= x**m/factorial(m) <= 6
        pair+=1
for q in range(13):
    cq,eq=sph(q)
    for J in range(q+1):
        for js in comps(J):
            c0,e0=sph(q-J)
            C=cq/(c0*prod(sph(j)[0] for j in js)); E=eq-e0-sum(sph(j)[1] for j in js)
            a=q-J; cc=F(1); ee=0
            for j in js:
                for k in range(j):
                    cc*=F(factorial(k),factorial(a+k));ee+=a
                a+=j
            assert (C,E)==(cc,ee)
            assert C*x**E<=6**J
            many+=1
assert F(3**3,factorial(3))>1
print(dict(pair_factor_checks=pair,composition_cancellation_checks=many,negative_controls=1))
Observed: {'pair_factor_checks': 961, 'composition_cancellation_checks': 8191, 'negative_controls': 1}
Exact rational checks of native factorial formula only, not tests of
automorphic measures. The stronger finite bound 6^J is not needed
for the proof; the general bound above follows analytically.

Read actual baseline CI status.json on cathedral-research-state:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc, pass, conditional
half-strip adapter only, propext/Classical.choice/Quot.sound.
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717, pass, bounded
scan 2000 visited, 324 pending. Neither compiles this certificate.
Native batch lane: use pinned 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474,
existing shared engine and pinned source dependencies; compile this
file with the three engine oleans in LEAN_PATH. Record actual
compiler output, original and reduced axiom/constructor graphs and
replay T3 substitution in a copied constantBound proof. No RH import.

RESUME HERE: native batch replay rh33_T3 at constantBound (retain
the original fallback), then trace the actual FlagMeasureBound
producer through relative mass normalization and identify SAME-host
dependencies jointly with geometry; avoid repeating its Tamagawa
comparison. Focus on proving missing premises, not reducing an
already-established scalar coefficient again.
HANDOFF TO: kernel extractor, geometry, integration/editor, audit.
-/

open MeasureTheory NumberField Matrix Finset
open scoped BigOperators
open GlobalTheory.FlagMeas

namespace RHTheta33

theorem factorial_mul_le (m k : ℕ) :
    m.factorial * k.factorial ≤ (m+k).factorial := by
  induction k with
  | zero => simp
  | succ k ih =>
    have hh : k+1 ≤ m+k+1 := by omega
    simpa only [Nat.add_succ, Nat.factorial_succ, mul_assoc, mul_left_comm, mul_comm]
      using Nat.mul_le_mul hh ih

theorem sphere_factor_le (m k : ℕ) :
    2*Real.pi^(m+k+1)/((m+k).factorial:ℝ) ≤
      (2*Real.pi^(k+1)/(k.factorial:ℝ))*Real.exp Real.pi := by
  have hp := Real.pi_pos
  have hm : 0 < (m.factorial:ℝ) := by exact_mod_cast m.factorial_pos
  have hk : 0 < (k.factorial:ℝ) := by exact_mod_cast k.factorial_pos
  have hf : (m.factorial:ℝ)*(k.factorial:ℝ) ≤ ((m+k).factorial:ℝ) := by
    exact_mod_cast factorial_mul_le m k
  have hi := one_div_le_one_div_of_le (mul_pos hm hk) hf
  have he : Real.pi^m/(m.factorial:ℝ) ≤ Real.exp Real.pi :=
    Real.pow_div_factorial_le_exp _ hp.le m
  calc
    _ = (2*Real.pi^(k+1))*Real.pi^m*(1/((m+k).factorial:ℝ)) := by
      rw [show m+k+1=m+(k+1) by omega, pow_add]; ring
    _ ≤ (2*Real.pi^(k+1))*Real.pi^m*(1/((m.factorial:ℝ)*(k.factorial:ℝ))) :=
      mul_le_mul_of_nonneg_left hi (by positivity)
    _ = (2*Real.pi^(k+1)/(k.factorial:ℝ))*(Real.pi^m/(m.factorial:ℝ)) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left he (by positivity)

theorem sphere_block (m j : ℕ) :
    sphV (m+j) ≤ sphV m * sphV j * (Real.exp Real.pi)^j := by
  induction j with
  | zero => simp [sphV]
  | succ j ih =>
    have hp := Real.pi_pos
    have h0 := GlobalTheory.SphRatio.sphV_pos m
    have h1 := GlobalTheory.SphRatio.sphV_pos j
    rw [Nat.add_succ, GlobalTheory.SphRatio.sphV_succ,
      GlobalTheory.SphRatio.sphV_succ j]
    calc
      _ ≤ (sphV m * sphV j * (Real.exp Real.pi)^j) *
          ((2*Real.pi^(j+1)/(j.factorial:ℝ))*Real.exp Real.pi) :=
        mul_le_mul ih (sphere_factor_le m j) (by positivity) (by positivity)
      _ = _ := by rw [pow_succ]; ring

theorem sphere_blocks {ι : Type} (u : Finset ι) (j : ι → ℕ) (m : ℕ) :
    sphV (m+∑ i ∈ u,j i) ≤
      sphV m * (∏ i ∈ u,sphV (j i)) * (Real.exp Real.pi)^(∑ i ∈ u,j i) := by
  classical
  induction u using Finset.induction_on with
  | empty => simp
  | @insert i u hi ih =>
    rw [Finset.sum_insert hi, Finset.prod_insert hi]
    have he : m+(j i+∑ k ∈ u,j k)=(m+∑ k ∈ u,j k)+j i := by omega
    rw [he]
    have hp := GlobalTheory.SphRatio.sphV_pos (j i)
    calc
      _ ≤ sphV (m+∑ k ∈ u,j k)*sphV (j i)*(Real.exp Real.pi)^(j i) :=
        sphere_block _ _
      _ ≤ (sphV m*(∏ k ∈ u,sphV (j k))*(Real.exp Real.pi)^(∑ k ∈ u,j k)) *
           sphV (j i)*(Real.exp Real.pi)^(j i) :=
        mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right ih hp.le) (by positivity)
      _ = _ := by rw [pow_add]; ring

theorem rh33_T3 (p q J f a : ℕ) (j : Fin a → ℕ) (A : ℝ)
    (hJ : ∑ i, j i = J) (hJq : J ≤ q)
    (hA : sphV p / sphV (p-J) ≤ Real.exp (J*A)) :
    (sphV p*sphV q/(sphV (p-J)*sphV (q-J)*∏ i,sphV (j i)))^f ≤
       Real.exp (f*J*(A+Real.pi)) := by
  have hp := GlobalTheory.SphRatio.sphV_pos p
  have hq := GlobalTheory.SphRatio.sphV_pos q
  have hp' := GlobalTheory.SphRatio.sphV_pos (p-J)
  have hq' := GlobalTheory.SphRatio.sphV_pos (q-J)
  have hprod : 0 < ∏ i,sphV (j i) :=
    Finset.prod_pos fun i _ => GlobalTheory.SphRatio.sphV_pos (j i)
  have hb := sphere_blocks Finset.univ j (q-J)
  rw [hJ, Nat.sub_add_cancel hJq] at hb
  have hs : sphV q/(sphV (q-J)*∏ i,sphV (j i)) ≤ (Real.exp Real.pi)^J := by
    apply (div_le_iff₀ (mul_pos hq' hprod)).2
    simpa [mul_comm] using hb
  have he : sphV p*sphV q/(sphV (p-J)*sphV (q-J)*∏ i,sphV (j i)) =
      (sphV p/sphV (p-J))*(sphV q/(sphV (q-J)*∏ i,sphV (j i))) := by
    field_simp
  rw [he]
  calc
    _ ≤ (Real.exp (J*A)*(Real.exp Real.pi)^J)^f :=
      pow_le_pow_left₀ (by positivity) (mul_le_mul hA hs (by positivity) (Real.exp_pos _).le) _
    _ = _ := by
      rw [← Real.exp_nat_mul, ← Real.exp_add, ← Real.exp_nat_mul]
      congr 1
      ring

theorem rh33_restore_T3 (p q J f a : ℕ) (j : Fin a → ℕ) (A s ell : ℝ)
    (hs : 0 ≤ s) (hl : 0 ≤ ell) (hJ : ∑ i, j i = J) (hJq : J ≤ q)
    (hA : sphV p/sphV (p-J) ≤ Real.exp (J*A)) :
    (sphV p*sphV q/(sphV (p-J)*sphV (q-J)*∏ i,sphV (j i)))^f ≤
      Real.exp (f*J*(A+3.49+s/2*(ell/2))) := by
  refine (rh33_T3 p q J f a j A hJ hJq hA).trans (Real.exp_le_exp.mpr ?_)
  have hpi := Real.pi_lt_d2
  have hsl : 0 ≤ s/2*(ell/2) := by positivity
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  linarith

rh_scan GlobalTheory.FlagMeas.constantBound
rh_prune GlobalTheory.SphRatio.log_sphV_ratio_le
rh_scan rh33_T3
rh_reduce rh33_restore_T3
rh_auto rh33_restore_T3
rh_auto_frontier GlobalTheory.FlagMeas.constantBound
#print axioms GlobalTheory.FlagMeas.constantBound
#print axioms rh33_T3
#print axioms rh33_restore_T3

end RHTheta33
