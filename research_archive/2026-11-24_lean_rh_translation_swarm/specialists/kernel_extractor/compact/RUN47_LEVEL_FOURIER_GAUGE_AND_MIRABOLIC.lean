import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN47 — level Fourier gauge and mirabolic bridge
27 November 2026. Static source-matched human derivation; executable
algebra certificates and native axiom probes prepared, not replayed.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau and collaborators. No Main or claimed RH imported.

Actual caller: New/Columns/LocalStatement.lean
9d5bd0d698b0db2850cbd306d8d400d7e99a3547, p=N branch.
LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45:
Data.fourierOp_mem_column, Data.exists_indexDvd_fourierOp_pow.
NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7:
mirabolic_fix_fourierOp, lastRowDatum_conj_u₀, fourierOp,
mem_integralAbove_of_inclGL_eq. This closes the retained human
gauge direction in RUN46, without retiring any native dependency.

## 1. Exact mirabolic averaging
Let P be the integral invertible matrices fixing e_last modulo N
in each component over S=nonInducedPlaces. Put u0=diag(I,N^-1).
For g in P, k=u0^-1 g u0 is integral invertible, with last ROW
e_last modulo N: apply lastRowDatum_conj_u₀ to g and g^-1.
For y with unit last coordinate, choose the native k_y with last
column and row y modulo N. Put y'=bar(k)y. This permutes exactly
the indexing set of the Fourier sum, preserves y_last, hence the
coefficient psiN(y_last). The matrix k_y'^-1 k k_y belongs to P
since its reduction fixes e_last. Set a=(u0 k_y')^-1, b=u0 k_y.
Then a g b=k_y'^-1 k k_y belongs to P. The actual hypothesis of
mirabolic_fix_fourierOp is pi(a) T pi(b) phi=phi for all such a,b.
Multiplication by pi(u0 k_y') gives
    T pi(u0 k_y) phi = pi(u0 k_y') phi.
Reindex the finite sum before any norm. Thus T F phi=F phi.
No extra commuting assumption on T, no division by number of terms.

## 2. Apply at actual column level
Let d=diagPointN 0, J(a)=d embedGL(a) d^-1.
For k in columnLevel, g=atPlaces S(d^-1 k d) is in P by
atPlaces_conj_mem_mirabolic. For a,b with a g b in P set
k'=J(a) k J(b). At S its d-conjugate equals a g b, and outside
S and star S its components agree with k. Apply
lastColDatum_conj_ne_zero_iff to k' and its inverse: both have
integral components above N (use unitary inverse-transpose at
the paired places) and the required last-row congruence at
piPlaces. In particular k' k^-1 is integral and supported
above N. The native mem_chosenLevel_of_supportedOn gives
k' k^-1 in chosenLevel; hence k' in chosenLevel. At other primes
the original column congruence is unchanged, and above N the
congruence just established gives k' in columnLevel via
mem_columnLevel. Retain these exact native subgroup and
local-congruence premises; no claim they follow from arbitrary
mirabolicity without the adelic support conditions.
For T=smoothFormRep(k), pi(a) T pi(b) phi=phi by level invariance
of phi. Step 1 gives F phi in Column, without assuming integrality.

## 3. Exact gauge shift (the RUN46 outstanding inclusion)
WeightRepBasic.lean 7417d8c31f21090bfa515568339b768290093d02
and ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33:
G(g,v)=||rho(g^-1)iota(v)||; G(gK,v)=G(g,v) for K integral
invertible above N. The latter follows by applying the integral
representation norm bound to K AND K^-1. IntegralFormsAt(C,d)
means phi in C and G(g d,phi(g))<=1 at every g.
Set A=embedGL(u0)=d(S), K_y=embedGL(k_y). Each K_y is integral
above N by mem_integralAbove_of_inclGL_eq, including star S.
The actual conjugated representation evaluates F phi at g as
sum_y psi_y phi(h_y), h_y=g d A K_y d^-1.
Exact identity: h_y d=(g d A) K_y.
Consequently G(g d A,phi(h_y))=G(h_y d,phi(h_y))<=1 if
phi is integral at d. The native P.norm_map_psi₀ gives norm one
for every coefficient psi_y; equivalently these values are roots
of unity. Ultrametric triangle inequality gives
    G(g d A,(F phi)(g)) <= 1
with NO cardinality factor and no need for ramification.
Thus F(M) subset M_S, where M=integralFormsAt Column d and
M_S=integralFormsAt Column(d A). This is the precise direction
needed by the native comap, not the inverse inclusion.

## 4. Caller iteration
Write t=t(last) as in RUN46. Retain the native determinant
statement IndexDvd(M_B,M,N^t) for B=piPlaces and S;
M_piPlaces=integralFormsAt Column 1. Start with that cost t.
For each extra F application, comap the S inclusion and its
IndexDvd along F, then compose. This multiplies the scalar
index bound by N^t each time, so for q=varrho+1 the exponent
is (q+1)t, not qt. Use the established RUN46 symmetric
bound t<=f*b*dim and q+1<=m (m=2(varrho+1), q>=1);
the published weaker 4mfb*dim bound follows.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
defines IndexDvd using arbitrary finite families, not a claim
about cardinality of a quotient over a nondiscrete valuation ring.

## Dependency audit and execution
Original root-reachable local chain:
short_forms -> LocalStatement p=N -> exists_indexDvd_fourierOp_pow
-> fourierOp_mem_column + determinant estimate + comap/trans
-> mirabolic_fix_fourierOp + conjugated-level bridge + gauge covariance.
Reduced human chain uses finite permutation and exact group cancellation
as above; retains original declarations, type/value edges and all native
axiom evidence. Cache context must include stage, d, S, piPlaces, N,
representation and gauge, not just theorem name. No deletion of other
prime branches, scalar t bounds, or data assumptions. No URT claimed.
Local command -v lean/lake/elan returned no paths. Existing CI run
45803534769 completed at workflow level and has artifact
15116086842; job-log retrieval disconnected. Prior RUN46 reports
the compact A timeout; workflow success is not a proof replay PASS.
The following probes and algebra certificates are unexecuted.
No rh_scan/rh_prune or rh_reduce/rh_auto replay on this compact pin;
old-pin receipts do not establish new-pin kernel evidence.

RESUME HERE: reconstruct the actual chain₂_pairTranslates_eq_smul_chain
character product and name_lastColDatum_mem_raises standard-data gauge
at N, then connect to the p=N divisibility caller. Independently audit
steps 1–4, particularly chosen-level support and the determinant witness
from RUN46. All other A/B/C and analytic prime-window obligations remain.
-/

namespace RUN47
theorem gauge_shift_identity {G : Type*} [Group G] (g d a k : G) :
    (g * d * a * k * d⁻¹) * d = (g * d * a) * k := by
  simp [mul_assoc]

theorem conjugated_permutation_identity {G : Type*} [Group G]
    (u g k y z : G) (h : k = u⁻¹ * g * u) :
    (u * z)⁻¹ * g * (u * y) = z⁻¹ * k * y := by
  rw [h]
  simp [mul_assoc]

theorem cost_budget (q m t f b dim : ℝ)
    (hqm : q + 1 ≤ m) (ht : 0 ≤ t) (hm : 0 ≤ m)
    (hb : t ≤ f*b*dim) : (q+1)*t ≤ m*(f*b*dim) :=
  (mul_le_mul_of_nonneg_right hqm ht).trans
    (mul_le_mul_of_nonneg_left hb hm)

#print axioms gauge_shift_identity
#print axioms conjugated_permutation_identity
#print axioms cost_budget
#check Data.fourierOp_mem_column
#print axioms Data.fourierOp_mem_column
#check Data.exists_indexDvd_fourierOp_pow
#print axioms Data.exists_indexDvd_fourierOp_pow
end RUN47
