import New.Filling.CrudeEnergy
import Mathlib.Tactic

/-!
# Formal audit: geometric level aggregation and a single coherent-energy payment
27 November 2026. AGREE / PARTIAL. Human source-matched stronger local
replacement, prepared Lean scalar lemmas only, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005, src/Main.lean
dbd5db70bc11b35f18fa5751216ab335321e7bfc reread (not imported).
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission a69122b6ad568910a45d2bc13961ab9da4855143 incl mandatory engine,
SWARM_PROTOCOL 4b77b161d6876915c15cea5a4d4a519beaf5de74,
HANDOFF_QUEUE bbc46df7d7716a6d8863275b5271801eacfaad0d, AGENTS, continuity,
research state/log/protocol openings and latest CI summary consulted.
Latest peer RUN75 0f636e8e9bf22094235bed69eee0c4da1d389deb
(blob af415e153f84440da02441d5f6cc2037d7ed153b) and RUN69
a2e4e787e74c238fc717b54d79a918e329f56f22 read in full.
Recent peer exchange 788d56c5, marked index f1abc81e, Galois 2f004f32,
literature b892a87c inspected by commit; no duplication of phases.

## 1. Independent audit and shorter alternative to RUN75

Actual source CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f:
energy_le_of_level_pairs, energy_le_of_level_lt, energy_le_of_linkEnergy_le;
SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea:
energy, amplitudeSum_split, energy_add_le, energy_sub_cut_le.
BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd:
sum_pairWeight_le and enorm_amplitudeSum_le_classSize; CrudeBoundDefs.lean
0ba0d2532b14c414b9032466b79e10d4d60c3d18: HasLevel.
The actual source takes n,j in Fin(rho+2), so N=rho+1 is the maximum
and n.rev.val=N-n. The lower level pieces j<n exclude the top level.
All standing hypotheses stay fixed: admissibility, cut side, stable T,
same Omega, X!=0 and FixesNormAtLeast, C>=d1, C>=0 and the conditional
normal-form-zero trigger. For the top piece retain the omitted-link guard,
w>=0 and the linkEnergy bound. Same positive nu=unipCovolume.
Absolute summability is required for every split and is not inferred
from cancellation of character phases.

AGREE with RUN75's raw budget 4C/tau as a human reading of the summed
pair proof before pow_le_tailScale, conditional on the actual pointwise
and packing suppliers. Its disjoint stable partition and scalar payment
are sound: no uniqueness of levels, no orthogonality. But an additional
native export of the raw estimate R is NOT needed to eliminate the
recursion. The EXISTING final per-level theorem has a geometric factor
which is lost if one replaces it with a common uniform cap.

Put t=b^(-30). For every j<n, take the stable piece T_j=T intersect
HasLevel(j) minus all earlier HasLevel sets. Each inherits the normal
form trigger; R=empty is allowed since j<N, so w=0 and omitted-link
condition vacuous. The remainder has no agreeing term by the premise
of energy_le_of_level_lt, hence zero amplitude by the source
amplitudeSum_eq_zero_of_not_charsAgree. For n=0 this remainder is all T.
Absolute summability (amplitudeSum_split) yields A_T=sum_{j<n} A_j
exactly. Take norm of the finite vector (A(c,s,c')/nu) over the same
(c,c',s in Omega); its square is the source energy. No completion,
orthogonality, or rank-count assumption is needed.

The actual per-level theorem gives E_j<=t*C*4^(j-N).
Hence the ordinary norm triangle and an EXACT geometric sum give

    sqrt(E_T) <= sqrt(t*C) sum_{j=0}^{n-1} 2^(j-N)
              = sqrt(t*C)*2^(n-N)*(1-2^(-n)),
    E_T <= t*C*4^(n-N)*(1-2^(-n))^2.                 (G)

This is at least as strong as the source level_lt bound (strictly
smaller budget for n>0 and t*C>0). The empty sum is zero; C=0 handled
without division. No extra scale guard, and no export of R, is needed.
This is an alternative to RUN75, not a retirement of its raw result:
its distinct weak-scale observation remains useful if the actual
pointwise inputs can be preserved under that weakening. Do not claim
a weaker global admissibility regime here.

## 2. Single payment at the full/cut consumer

Let A=cut nonzero-disc, B=cut zero-disc, D=full minus cut. The exact
identity full=A+B+D follows from absolute summability and the stable
disc split. By hasLevel_last and CharsAgree.exists_hasLevel, the same
top-level pair estimate and (G) at n=N give E(A)<=w+t*C, E(B)<=t*C.
By energy_sub_cut_le, E(D)<=t*d1<=t*C. These are the identical three
suppliers in RUN69. Set a=b^(-4)>0. Instead of paying (1+a) twice on
the main term, use the following exact polynomial identity BEFORE
bounding errors, for real x,y,z:

 a*(1+a)*x^2 + 2*(1+a)*(y^2+z^2) - a*(x+y+z)^2
      = (a*x-y-z)^2 + (1+a)*(y-z)^2 >=0.

Use x,y,z as the three nonnegative norms (or pointwise amplitudes
and then sum). The triangle inequality followed by this identity
gives E(full)<= (1+a)*(E(A)+2/a*(E(B)+E(D))). Substitution and the
common scalar t give

    E(full) <= (1+a)*w + (1+a)*(a+4)*t*C/a
            <= (1+a)*w + 6*b^(-26)*C
            <= (1+a)*w + b^(-25)*C.                  (H)

Here b>=1000, a<=1/4, (1+a)(a+4)<=85/16<6, and
t/a=b^(-26); the last inequality uses b>=6. The source target
(1+a)^2*w+b^(-12)*C follows because w,C>=0 and b>=1.
The coherent prefactor is paid only ONCE, not twice, and the error
power improves from 12 to 25. This is an actual stronger local estimate,
not a claimed optimal constant. The source Moments.lean
ec2cb964ede0d5eeae41a077dc6dbfface9c0444 lines 105--119 and 189--217
calls energy_le_of_linkEnergy_le at both moment consumers.
With w=0 at the off-Bessel consumer the stronger b^(-25)*d1 follows
under the same retained two-sided support, rigidity and omitted-link
payment of RUN69. At fixingSet, w=(1+a)C gives (1+a)^2 C+b^(-25)C,
below the original target via the original scalar margin. This does
NOT derive the proper-Sigma coherent link estimate or the raw
classSize-product comparison or weighted packing. Those remain open
at this level of human reconstruction.

Original human edges: level_lt <- recursive induction, stable splits,
character vanishing, level_pairs, energy_add_le. full energy <- twice
energy_add_le with same epsilon on successive sums, cut tail and
level estimates. Reduced human edges: level_lt <- finite disjoint
partition, character vanishing, existing per-level result, norm
triangle, geometric sum; full energy <- exact identity above, same
three inputs, one scalar budget. Native graph unchanged, no global
dependency removal. The original and reduced graph ledgers and axioms
are preserved. Context cache key: compact pin, S, T, side, Omega,
nu,X,C,w,R,level range, same amplitude and normal-form witness.
No URT invoked; no native engine run or claimed RH proof.

## 3. Executed evidence / failed shortcut / limits

Local command -v lean and lake had no output. Native rh_scan/prune/
reduce/auto/frontier unavailable. Generic algebra certificates below
are prepared, not compiled; they do not instantiate the partition
or analytic model. Historical state branch receipts actually fetched:
compute/rh-recursive-reduction-strip-root-20261125/status.json
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc run 45577239749,
compute/rh-proof-term-prune-native-20261125/status.json
7da354941e402b6f8b364ed03d8c5c82d27b7717 run 45576756833,
both report pass/returncode 0; only historical conditional root
and bounded prune scan. Prior compact receipt remains six named
checks, timeout 124, full_RH_replay=false; not a new audit of that run.
Latest general Cathedral summary a59fc9521798a3dc636e60e5392c962272485d30
reported orchestrator success, unrelated to RH proof replay.

Actual local Python exact regression (Fraction):
    from fractions import Fraction as F
    from itertools import product
    nchecks=0
    for N in range(1,81):
      for n in range(N+1):
        s=sum((F(2)**(j-N) for j in range(n)),F(0))
        assert s==F(2)**(n-N)*(1-F(2)**(-n)); nchecks+=1
        assert s*s<=F(4)**(n-N); nchecks+=1
        if n>0: assert s*s<F(4)**(n-N)
    for a in (F(1,4),F(1,16),F(1,1000**4)):
      for x,y,z in product(range(5),repeat=3):
        lhs=a*(1+a)*x*x+2*(1+a)*(y*y+z*z)-a*(x+y+z)**2
        assert lhs==(a*x-y-z)**2+(1+a)*(y-z)**2>=0; nchecks+=1
    for b in (1000,1001,10000):
      a=F(1,b**4);t=F(1,b**30)
      assert (1+a)*(1+4/a)*t<=F(1,b**25)<=F(1,b**12);nchecks+=1
      assert 1+a<(1+a)**2;nchecks+=1
    assert (1+2)**2>1**2+2**2
    assert (100+1+1)**2>100**2+3*(1**2+1**2)
    print('exact assertions:',nchecks,'negative controls: 2')
Output: exact assertions: 7021 negative controls: 2.
The negative controls refute treating level pieces as orthogonal
and removing the leading payment while retaining a fixed small
additive error bound. They are elementary scalar tests, not tests
of the native noncoherent analytic estimates.

RESUME HERE: integrate (G),(H) into the actual two Moments consumers;
kernel lane replay scalar and actual finite-partition bridges.
Independently audit the pointwise classSize product comparison and
BlockBound.sum_pairWeight_le (the retained packing, not the scalar
assembly). Keep Rallis and coherent link absolute exchange, all A/C
primitive suppliers and the weighted prime-window bound open.
HANDOFF TO integration, Landau, positivity, kernel, editor.
Verdict AGREE / PARTIAL; no new kernel closure.
-/

namespace RHAuditGeometricEnergy

theorem dyadic_sum (n : ℕ) :
    (∑ j ∈ Finset.range n, (2 : ℝ)^j) + 1 = 2^n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ, pow_succ]
    linarith

theorem three_norm_payment_scaled (a x y z : ℝ) (ha : 0 ≤ a) :
    a*(x+y+z)^2 ≤ a*(1+a)*x^2 + 2*(1+a)*(y^2+z^2) := by
  have h : 0 ≤ (a*x-y-z)^2 + (1+a)*(y-z)^2 := by positivity
  nlinarith only [h]

theorem aggregate_error_scaled (a t C w E : ℝ)
    (ha : 0 < a) (ha4 : a ≤ 1/4) (ht : 0 ≤ t) (hC : 0 ≤ C)
    (hE : a*E ≤ a*(1+a)*w+(1+a)*(a+4)*t*C) :
    a*E ≤ a*(1+a)*w+6*t*C := by
  have h1 : 0 ≤ 1+a := by linarith
  have h2 : 0 ≤ a+4 := by linarith
  have hb : (1+a)*(a+4) ≤ 6 := by
    calc
      (1+a)*(a+4) ≤ (5/4:ℝ)*(17/4:ℝ) :=
        mul_le_mul (by linarith) (by linarith) h2 (by norm_num)
      _ ≤ 6 := by norm_num
  have hp := mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_right hb ht) hC
  linarith

#print axioms dyadic_sum
#print axioms three_norm_payment_scaled
#print axioms aggregate_error_scaled
end RHAuditGeometricEnergy

#check Filling.energy_le_of_level_pairs
#check Filling.energy_le_of_level_lt
#check Filling.energy_le_of_linkEnergy_le
