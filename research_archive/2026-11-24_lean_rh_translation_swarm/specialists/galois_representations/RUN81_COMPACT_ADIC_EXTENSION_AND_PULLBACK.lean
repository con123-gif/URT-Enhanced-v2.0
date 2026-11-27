import Lib.PadicHodge.WachKisin.PeriodMatrixBasis
import Mathlib.Tactic

/-!
RUN81 — C1: direct adic extension and finite-coordinate pullback
27 November 2026. Source-matched human reduction; native replay PREPARED,
not executed. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission/spine/ledger read; peer head 1c4f42ac, joint B2 fusion
(not a C1 replacement). RUN80 c61bd4dd explicitly requests this step.
Read AGENTS, swarm protocol, handoff, expansion and RUN76. No mixing
of old pin or import of Main/RH. Preserve the original source graph.

Sources relative to grh-compact/src:
  Lib/PadicHodge/PeriodRings/AmaxStructure.lean
    blob 1be9736d2c48bece6dd038c72d14b6f807cff9df:
    Amax, BPlus, amaxImage, exists_adic_extension, AdicBasis,
    Lift.AdicBasis.eventually_sub_sum_mem,
    Amax.exists_algebraMap_eq_p_pow_mul_sub,
    Amax.mem_span_pow_of_p_pow_dvd, Amax.p_pow_dvd_of_mem_pow.
  Lib/PadicHodge/WachKisin/ChartScalars.lean
    blob 8dc59315a323816ecb0eedf46b5aae0a8c714fc5:
    exists_extendToBPlus, extendToBPlus, eq_zero_of_ainfToBPlus,
    extendedCoord, extendedCoord_mem_bicommutant,
    eventually_approx_sum_extendedCoord.
  Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean
    blob cd91a46eb5624b88af20a96d0450bdf059994b93:
    IsPeriodMatrix.exists_basis, hA branch using
    Filter.eventually_all.2 and mem_span_pow_of_p_pow_dvd.

1. Direct extension by compatible finite quotients, not the general
adic graph-extension theorem. Write A=Ainf, M=Amax, B=M[1/p],
J=(p,xi)A, S=chart coefficient ring. Suppress injective embeddings.
Keep exactly these source primitives:
  M is p-adically complete and separated; p is a nonzero divisor;
  for every r>=0, A intersect p^r M = J^r A;
  E in S is associated to xi in A;
  for b in M and r>=0, there are k>=0, a in A and w in M with
        a=p^k(b-p^r w)
  (Amax.exists_algebraMap_eq_p_pow_mul_sub).
The pullback equality is the pair of Amax divisibility lemmas above,
not an assertion that arbitrary adic topologies agree. In particular
J=(p,E)A, so any S-linear f:A->A preserves J^r A.

Let D=A[1/p] intersect M inside B. It is an S-submodule. Extend f
algebraically to A[1/p] by f_p(a/p^k)=f(a)/p^k. This is independent
of the representation since cross multiplication and S-linearity
give equal numerators (p in S). If d=a/p^k belongs to p^r M,
then a belongs to A intersect p^(k+r) M=J^(k+r) A; hence
f(a) also belongs to J^(k+r) A and f_p(d) belongs to p^r M.
Thus f_p maps D to M (r=0), and preserves ALL precisions r, not
only a doubled precision. For each r, every b in M has an
approximant d_r=a/p^k=b-p^r w in D. This is the actual polynomial
denominator approximation primitive, with k depending on b,r.

Define F_r(b mod p^r M)=f_p(d_r) mod p^r M.
If b changes within p^r M, or a different approximant is used,
the two approximants differ by an element of D intersect p^r M.
The preceding preservation proves well-definedness. Addition and
S-linearity follow by taking sums and S-multiples of approximants;
compatibility for r<=s follows by comparing approximants modulo p^r.
Completeness gives a unique S-linear F:M->M with these residues.
For a in A choose the same approximant a at every r; separation
gives F(a)=f(a). Localize F at p to obtain G:B->B via
G(b/p^k)=F(b)/p^k, which is S-linear, agrees with f on A, and
preserves M. This gives the actual exists_extendToBPlus conclusion.

Uniqueness even among additive maps preserving M and agreeing on A:
if G1,G2 are two such maps, additivity gives commutation with
integer powers of p and with p^{-1} since p is invertible in B.
For b in M, the difference vanishes on D, and hence its value at
b lies in p^r M for all r by the approximants; separation kills
it. Localize to all B. Thus the direct construction equals the
native chosen extension. No assumed continuity of an arbitrary
extension is needed; preservation of M plus additivity supplies it.
This is a candidate replacement of the graph/primary-component
construction only at this caller. No global removal of
exists_adic_extension: it also supplies the actual adic basis.

2. One exact residual identity controls the finite-coordinate error.
For finite index set T, let L_T=1-sum_{i in T} b_i lambdaHat_i
as an additive S-linear map on B. It preserves M since every b_i
lies in A, every lambdaHat_i preserves M, and M is a ring.
Its restriction to A is the native adic-basis residual. For given
y in B and m>=0 choose k,a,w such that
  y=p^{-k} a+p^m w, a in A, w in M.
This follows either from the native y.exists_Ainf_approx m 0,
or by clearing the denominator of y and using the preceding M
approximation at precision m+that denominator. Fix k BEFORE
choosing T. The actual chart cofinality c.exists_maxIdeal_pow_le
and AdicBasis.eventually_sub_sum_mem give, eventually in T,
  L_T(a) in J^(k+m) A.
Therefore L_T(a)=p^(k+m) z_T in M for some z_T in M. Apply L_T
to p^k y=a+p^(k+m) w and cancel p^k exactly in B:
  L_T(y)=p^m(z_T+L_T(w)) in p^m M.
This proves precisely eventually_approx_sum_extendedCoord with
the native coordinate extensions. The exponent k+m, not just m,
is essential. No uniform denominator over arbitrary y assumed.
This proof does not require the general bicommutant property;
retain extendedCoord_mem_bicommutant for the next caller.

3. Actual simultaneous finite-rank use and hA pullback.
For the SAME y in B^d of RUN76, d finite, fix m and the single
native denominator bound k0 for U. Apply section 2 to each y_i
at precision m+k0. Each coordinate yields a threshold finite
set T_i. Their finite union T0 is a threshold for ALL i:
for every T containing T0, all residual coordinates lie in
p^(m+k0) M. This is the exact Filter.eventually_all.2 use;
no countable intersection or change of y_i. In rank zero use
the empty union. No uniform claim for infinite rank.

Use the already derived RUN76 contraction and hN, not a new
basis: U y=E^h x, Q s_j=p^N w_j, and
U lambdaHat_j(y)=E^h w_j. Fix the SAME N and all other data
before m; s_j may be chosen once per j. Define
  D_T=p^N x-sum_{j in T} b_j Q s_j in A^d.
Let e_T=y-sum_{j in T} b_j lambdaHat_j(y).
Then U(p^(N-m-k0) e_T)=E^h p^(-m-k0) D_T.
The input lies in M^d because e_T is p^(m+k0) times an
integral vector. Even if N-m-k0 is negative, this is an exact
identity in B with invertible p. The uniform native denominator
lemma for U now gives p^(-m) D_T in M^d. Applying the exact
pullback coordinatewise gives D_T in J^m A^d.

If lQ=delta*g and p does not divide delta, this provides
  l dot p^N x - delta*(g dot sum_{j in T} b_j s_j) in J^m A.
Use the native dvd_of_approx at every m (fixed l,delta,x,N)
and cancel p^N by primality of p, as already proved in RUN76.
Thus no new loss or denominator survives in hA. This fills the
specific simultaneous approximation justification in RUN76,
not the freeness or determinant argument already recorded there.

4. Evidence and limits.
Original local source chain: Amax pullback and polynomial
approximation -> general exists_adic_extension/primary component
-> exists_extendToBPlus -> eventual residual -> exists_basis hA.
Candidate chain: same Amax primitives -> D and compatible
quotients -> unique extension -> residual identity -> finite
union -> existing hA. Retain source graph, adic basis theorem,
bicommutant proofs, contraction and all crystalline/fit inputs.
Context key: compact pin, chart S,E, J, actual M,B, f, y, U,
native k0,N, finite d and caller. No change to global graph.
This is C1 human derivation conditional on named ring primitives,
not native C1 closure or RH. No claim of lower proof-term count
or faster execution without replay.

Actual local Python/SymPy execution:
  simplify((p**(k+m)*z+p**(k+m)*w)/p**k-p**m*(z+w)) == 0
  with p nonzero and k,m nonnegative integer: true.
  Polynomial model Z[pX] inside Z[X]: for p=2,3,5, m=0..4,
  all coefficient vectors in {-2,-1,0,1,2}^4, check
  all(p^m divides a_i*p^i) iff
  all(p^max(0,m-i) divides a_i): 9375 exact checks passed.
  This is a regression model only, not the Fontaine pullback proof.
  Missing-denominator negative control p=2,k=1,m=1,P=id,
  y=1,a=2,w=0: a divisible by p^m but y is not in p^m Z.
  It rejects using only m in section 2.
lean/lake absent on local PATH. The helper below is PREPARED only.
Native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier not
available locally; no shared CI dispatch or inferred pass.
Existing ledger's B2 receipts do not validate C1.

RESUME HERE: audit the actual C1 primitive pullback proof
Amax.mem_span_pow_of_p_pow_dvd (especially p_pow_dvd_of_monic_mul
and thetaAmax) and its use in the chart's max-ideal cofinality;
then deliver the RUN75–81 replacement family to the shared native
runner with actual caller-type and axiom guards. Do not duplicate
the B2 batch or edit protected workflows.
HANDOFF TO: Galois, mathematics, integration/editor, kernel/audit.
-/

namespace RHGaloisRun81

/-- Exact denominator cancellation at the residual map interface.
The actual M-membership of z and P(w) is retained separately. -/
theorem scaled_residual_transfer {R : Type*} [CommRing R] [IsDomain R]
    (P : R →+ R) (p y a w z : R) (k m : ℕ) (hp : p ≠ 0)
    (hP : ∀ (n : ℕ) (x : R), P (p^n*x) = p^n*P x)
    (h : p^k*y = a+p^(k+m)*w)
    (ha : P a = p^(k+m)*z) :
    P y = p^m*(z+P w) := by
  apply mul_left_cancel₀ (pow_ne_zero k hp)
  calc
    p^k * P y = P (p^k*y) := (hP k y).symm
    _ = P (a+p^(k+m)*w) := congrArg P h
    _ = p^(k+m)*z+p^(k+m)*P w := by rw [map_add, ha, hP]
    _ = p^k*(p^m*(z+P w)) := by rw [pow_add]; ring

#check Lift.Chart.exists_extendToBPlus
#check Lift.Chart.eventually_approx_sum_extendedCoord
#check Lift.Chart.IsPeriodMatrix.exists_basis
#check Amax.mem_span_pow_of_p_pow_dvd
#print axioms scaled_residual_transfer
#print axioms Lift.Chart.eventually_approx_sum_extendedCoord

end RHGaloisRun81
