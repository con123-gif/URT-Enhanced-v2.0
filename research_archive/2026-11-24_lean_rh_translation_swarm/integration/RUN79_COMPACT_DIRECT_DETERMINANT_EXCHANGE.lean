import New.Exchange.EqualRankValue
import New.Rows.Carrier
import Mathlib.Tactic

/-!
# Integration RUN79 — stop exchange at StdExchange for the critical determinant period
27 November 2026. SOURCE-MATCHED proposed human caller replacement, scalar
certificate PREPARED, not native replay. Credit Alpöge, Sernau, Anthropic
collaborators and Claude.

Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005;
compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission a69122b6ad568910a45d2bc13961ab9da4855143 incl mandatory engine,
SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, continuity, research state/log/protocol
and latest CI summary inspected. Recent peers through 80f4ff6e checked;
788d56c5 finite phase, 982eed1c real period, 446c68f9 level sum, 38cee09b
orbit cancellation, c8d08359 independent finite cutoff review. Preserve
RUN78 42bc7348 nonzero determinant contraction and RUN66 0eea741e
rank-two compact fixed-line proof. New contribution: remove the SECOND
all-partners/flip exchange step specifically at Carrier's determinant-only
consumer; do not remove it at the top StdExchange construction or the
equal-rank nonvanishing supplier.

## 1. Actual source anchors
New/Rows/Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40:
stdClassSum_det_modKernel_eq, explicit_matching.
New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d:
exists_stdExchange_removing_planes, exchange_of_partners, exists_equalRankThetaRatio_value.
New/Exchange/ExchangeTheorem.lean 608b4f61af27d780e24f799937a836ecd3c1d50a:
exchange_theorem (retain its finite reduction/lift compatibility).
New/Exchange/RealPair.lean f2a4ed6190f46b592334117dda62a72b3e6d4704:
exists_rapid_with_realSlice, exists_stdExchange_top.
New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c:
StdExchange, stdExchange_of_periods.
New/Exchange/ExchangeDifference.lean 05f961bbec79dda9700a60484436878c0205ad96:
thetaSmall.
Lib/Weil/DualPair/ThetaIntegralLaws.lean a3d838ed0696e8fd4f47bd2c97a76c35d05a4246:
thetaLarge, thetaIntegral_pairWeil.
Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1:
pairChar, rankTwist.
Lib/Weil/GaussSum/ShearInvariance.lean 1fe3a70f51455d1bfd976a4ad11661810ba91c7a:
stdRowDatum, stdColDatum.
Lib/SiegelWeil/Tower/LargeSideConstantTerm.lean
5f229d7bec78a4d167b9f0feed9a1a44cd52d9d9:
exists_constant_term_thetaLarge, lValueProdInt_pos.

## 2. Stop the original proof at the actual intermediate witness
In the critical z=1 determinant-period caller (RUN65/RUN66), let W=V
be the positive standard space of rank 2, U the zero space, and fix the
weight -c_tau of alpha. Put nu=alpha^(-1) upsilonU1, mu_tau=c_tau+1.
The canonical e: Empty + Fin 2 -> Fin 2 is the same as in Carrier.
Then rankTwist(nu^(-1),Fin 2)=alpha. If no admissible datum exists,
the conclusion is vacuous; otherwise lValueProdInt positivity is available.

Apply the retained exists_equalRankThetaRatio_value with k=1,
q=negCount W=0. It gives ONE rapid z and nonzero R0, independent of
the tame datum, with equalRankThetaRatio(hypSum Unit W, character,z)=R0.
Nonnegativity of that ratio implies R0>0 on the nonempty branch.
This supplier is NOT being proved by the following simplification.

Read exchange_of_partners through the choose rv _ C c _ K line.
Use EXACTLY its first construction: flipCoords of the prescribed
rank-zero vacuum y, opposite-slice lift w with exists_rapid_with_realSlice,
exists_stdExchange_top and exists_stdExchange_removing_planes with
the adapted splittings and its slice_zero_comp identity. Here
A=removePlanes Unit W and p=Unit, so the last lemma uses only its
one-plane branch; all matrices and data are the same as the source.
The real map of the zero-space flip is the identity (or use its native
preservation of the normalized vacuum); its action on the empty
coordinate space is identity. Thus the final small real datum is the
original normalized zero-space vacuum. We obtain directly

    StdExchange W V U mu e v vac (fun _ => R0)

with v rapid, a real T independent of the character, and a complex b_chi
such that T |b_chi|^2 = P_chi(1) R0. All these are exactly the witnesses
before the final choose/exists_isEquivariantLift/exists_pairTheta_flip
in exchange_of_partners. One may keep the flipCoords implementation
in the initial lift; the final nonzero-complement flip theorem is not needed.
The determinant-only caller takes just the unique empty z in StdExchange;
its integrality is vacuous. No arbitrary partner extension is needed.

Indeed stdRowDatum e chi' z = 1_O(X) invOnUnits chi'(det X) in this
canonical ordering. stdColDatum chi' z on the zero-column matrix is 1.
Here chi' is the tame character for nu, i.e. inverse of the finite
character for alpha. After the integral reduction map in exchange_theorem,
the row datum is exactly the original finite chi(det X) lifted by the
modulus: nonunit or nonintegral cases give zero. Preserve this equality
of lifted functions (the native pi construction and liftFn_apply identity);
do not equate different moduli or assume that an arbitrary reduction map
commutes with star. This uses only the function-level part of that
proof, not IsPartner.lift_of_reduction for arbitrary partners.

The decisive additional observation is that thetaLarge already has
BOTH characters alpha,alpha, while thetaSmall at rank zero has second
character upsilonU1^0=1. By pairChar, its first character is evaluated at
the determinant of the trivial group, hence 1. Its Hom space is zero,
the normalized vacuum and theta are 1, and its integral is the positive
rank-zero Haar volume V0 (do NOT assert V0=1). Consequently the direct
standard-pair equality, for every g, is

    L_{chi,g}(v) = b_chi V0,                  (D)

where L is the native thetaIntegral W V alpha alpha with the actual
determinant finite datum. This skips the final arbitrary partner
generation, its second equivariant difference map and flip-phase
calculation in exchange_of_partners at THIS consumer only. It even
avoids twisting alpha,1 to alpha,alpha after the period. The initial
top StdExchange proof still needs its own equivariant coefficients and
standard datum generation; the equal-rank supplier still needs its
own exchanges. Do not remove shared declarations globally.

## 3. Exact normalization and uniformity
Use RUN66's compact invariant line, now directly for L with second
character alpha rather than 1. Changing that second character only
multiplies the integrand by a scalar depending on g, not the variable
in U(V), so right invariance, continuity and the polynomial argument
are unchanged. With D(X)=prod_tau det(X_tau)^c_tau, average over the
same compact real U(2) factors. For all P, L(v_P)=a(P)L(v_D)
with a(P) independent of L. Polynomial density and continuity give
L0(v_D)L(v)=L(v_D)L0(v) for every L. Choose ONE actual datum/g as L0.
Equation (D) has nonzero right side: P_chi(1)>0,R0>0 imply b_chi!=0
and T>0 (T need not have been assumed nonzero beforehand).
Thus L0(v_D)!=0 and kappa=L0(v)/L0(v_D)!=0.
It is independent of all tied modulus, character and g, at this fixed
field, weight and source geometry. Equation (D) becomes

    kappa S_{alpha,alpha}(g) = b_chi V0
    |gamma_chi|^2 = (|kappa|^2 T/(V0^2 R0))/P_chi(1),
    gamma_chi = kappa/(b_chi V0).

Here S is the original weighted class sum by the native right Kf
tame determinant law, compact real invariance and rational-left
invariance, using the exact quotient integral/class-sum measure
normalization. Retain these facts; no new volume or character factor.
This proves precisely the conditional normalization at
stdClassSum_det_modKernel_eq rank 2 and hence its critical interpolation
consumer, without proving general explicit_matching at this call.
The common scalar is chosen before the tied family, as required.
No extra assertion that kappa is independent of field or weight.

The one-plane scalar payment can also be read without recursion:
for signed P(e)=lValueProdInt(chi,e)>0, upper C and b,
C |b|²=P(e+1)R0; the tower supplier gives
|g|² P(e)=K P(e+1). The source descent chooses C'=C K/|v0|²
and b'=b v0 a/g, |a|=1. Cancel exactly:
    C' |b'|² = C |b|² K/|g|² = P(e) R0.
Only divide by |g|² and |v0|², known nonzero; not by R0 or b.
It holds even in the zero-ratio branch of equal-rank proof. For two
planes the scalar telescopes. At the critical rank-two final exchange,
only one plane (e=1); in the auxiliary equal-rank proof with q=0,
Q has one plane and the all-zero fallback has two planes.
Thus this particular C caller needs no general unbounded induction
for the scalar bookkeeping. The underlying single-plane constant term,
real cone, small-side zero term, determinant-vector surjection (for
the separate fallback), and equal-rank proof remain required.

## 4. Original/reduced graph and verification
Original local path: Carrier determinant -> explicit_matching ->
exchange_theorem -> exchange_of_partners -> {top StdExchange, descent,
flip, arbitrary partner extension, equal-rank ratio}, real_matching,
classSum, modulus conversion.
Proposed local human path: Carrier determinant -> {equal-rank ratio,
top StdExchange, one-plane descent, unique empty standard pair,
fixed-line projection, determinant function reduction, classSum}.
Retain all original edges and axiom evidence. No claimed global
pruning: equalRankThetaRatio_value and other B/C callers still use
general exchanges. No change to nonzero-complement Separation.
Context key: pin, rank 2, all positive, rank-zero complement, canonical
reindex, fixed weight, actual tame inverse pair and moduli, same z,v,V0.
No URT heuristic needed for exact cancellation.

Local command -v lean and lake gave no paths. Native engine not
executed on this context; prepared scalar lemmas below and source
checks only. Exact stdlib Fraction regression executed:
    from fractions import Fraction as Q
    from itertools import product
    n=0
    for C0,Ct,V,k,L in product(map(Q,range(1,6)),repeat=5):
        c2=C0*L/Ct
        g2=k/(V*c2)
        assert g2 == k*Ct/(V*C0)/L
        n+=1
    m=0
    for Lm,Lp,C1,C2,v1,v2,c in product(map(Q,range(1,5)),repeat=7):
        P=[1/Lm,Q(1),Lp]
        T=Q(3); ell=T*c/P[2]
        for i,(C,v) in enumerate([(C2,v2),(C1,v1)],1):
            j=2-i; gam2=C*P[j+1]/P[j]
            T=T*C/v; c=c*v/gam2
            assert T*c==P[j]*ell
            m+=1
    assert Q(1,4)!=Q(1)
    assert Q(2,3)!=Q(2,5)
    print(n,m,2)
Output 3125 32768 2. First control drops the rank-zero volume square,
second changes the supposedly common normalization. Tests only
scalar sanity, not a test of actual theta models or native caller.

Actual earlier CI receipts reread: strip-root status b1c96f58 and
prune-native status 7da35494 both returncode 0. Compact targeted_results
088cd2ec0e935ee1a282f10096949bcf671cc804: six named checks, standard
three axioms, module_1_build timeout124, full_RH_replay=false,
all_requested_checks_ok=false. Latest orchestrator summary 66f9044c
run 45974840668 is not a Lean caller verification.
No new native PASS. No new root retirement. Prime-window target OPEN.

RESUME HERE: audit the exact rank-zero realSlice/flip vacuum and
stdRowDatum liftFn equality using the above source anchors. Replay the
prefix of exchange_of_partners as a separate StdExchange supplier
returning v, C and witnesses, and attach the direct determinant
consumer to Carrier (rank two only). Reuse the existing native queue;
do not re-prove all-partner generation at this call. Continue independent
equal-rank nonvanishing and the quantitative row budget. HANDOFF TO
integration/editor, character boxes, formal audit and native runner.
-/

namespace RHIntegration79

theorem direct_norm (T R P V K B : ℝ)
    (hT : 0 < T) (hR : 0 < R) (hP : 0 < P) (hV : 0 < V)
    (hB : T * B = P * R) :
    K / (B * V) = (K * T / (V * R)) / P := by
  have h : B = P * R / T := (eq_div_iff (ne_of_gt hT)).2 (by linarith)
  rw [h]
  field_simp
  <;> ring

theorem descend_norm (T K V B G P Q R : ℝ)
    (hV : V ≠ 0) (hG : G ≠ 0) (hQ : Q ≠ 0)
    (hu : T * B = Q * R) (hg : G * P = K * Q) :
    (T * K / V) * (B * V / G) = P * R := by
  calc
    (T * K / V) * (B * V / G) = (T * B) * K / G := by
      field_simp
      <;> ring
    _ = R * (K * Q) / G := by rw [hu]; ring
    _ = P * R := by rw [← hg]; field_simp <;> ring

end RHIntegration79

#check StdExchange
#check exists_stdExchange_removing_planes
#check exists_equalRankThetaRatio_value
#print axioms RHIntegration79.direct_norm
#print axioms RHIntegration79.descend_norm
