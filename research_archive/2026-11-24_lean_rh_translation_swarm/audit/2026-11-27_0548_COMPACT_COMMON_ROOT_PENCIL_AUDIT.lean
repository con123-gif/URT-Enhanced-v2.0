import New.Selmer.TwistForRows
import New.Selmer.FitTwistsExist

/-!
# 2026-11-27 audit: degree-free common-root selection, sharp Fitting polynomial and pencil minimum

AGREE/PARTIAL — human source-matched derivation, no new native closure. Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Mission latest blob 9f4a2272265e847b3a46422b02d4b37e976bee10, compact manuscript ea51739eda55a41749858377bc5635f7e9c49d41; previous own checkpoint 21ccc35d. Latest peers observed through 09c0f4ff. Primary compact migration and completion-first directives apply; old pin not mixed. Actual root chain: Main -> New.grh -> star_inequality -> C -> exists_isFitFamily -> exists_mFoldTwist_selmerLengthLe -> exists_anticyclotomic_twist. No RH conclusion imported or used. Earlier graph and axiom ledgers unchanged.

## 1. Degree-free simultaneous one-variable selector
RootsOfUnityPoints.lean blob 7c07be15e6c410124a9bc5ecb470e7750ac67074, exists_root_of_unity_eval_large.

Let p=ell, normalized |p|<1. All F_k integral polynomials, finite family, Gauss norm g_r(F_k)>=y_k>0 at fixed 0<r<1 with |p|<r^(p-1). Want one p^N-th root ζ with |F_k(ζ-1)|>=r y_k simultaneously, uniformly in the degrees. Empty family trivial. Choose a positive integer A0 with r^A0<|p|. Choose N large so the harmonic sum below contradicts g_1(P)<=1, independently of polynomials and coefficient rings. Work over any sufficiently large coefficient DVR containing all the p^N-th roots. Put P=product F_k, r_j=r^(1/p^j), g_j the multiplicative Gauss norm at r_j.

Suppose every p^N-th root fails some k. For each j=0,...,N-1 use all n=p^(j+1) roots ζ_i, nodes x_i=ζ_i-1. Choose k_i with |F_{k_i}(x_i)|<r y_{k_i}. Set Q=(1+X)^n-1=product(X-x_i), A=A0(j+1), P_i=product of F_k for k!=k_i. Exact polynomial identity BEFORE norms:
    P^A Q' = Q S + E,
    S=sum_i [(F_{k_i}^A-F_{k_i}(x_i)^A)/(X-x_i)] P_i^A,
    E=sum_i F_{k_i}(x_i)^A P_i^A product_{h!=i}(X-x_h).
Each quotient is a polynomial by the factor theorem. No division by a nonunit coefficient or derivative. All node norms <= |p|^(1/((p-1)p^j))<r_j. For t>=j, g_t(Q)=r_t^n and g_t(Q')=|p|^(j+1) (since g_t(1+X)=1). Each term of E has Gauss norm <=r^A g_t(P)^A r_t^(n-1) < |p|^(j+1) g_t(P)^A. Ultrametric strict dominance yields
    g_t(S)= |p|^(j+1) g_t(P)^A / r_t^n.
Monotonicity g_{j+1}(S)>=g_j(S) hence
    A0(j+1) [log g_{j+1}(P)-log g_j(P)] >= (1-p)log r.
Summing forces
    0 >= log g_N(P) >= sum_k log y_k + ((1-p)log r/A0) sum_{j<N}1/(j+1),
contradiction for N sufficiently large. This is the native uniform-in-degree quantifier, not a root-count bound depending on degree. Essential strict dominance; at equality ultrametric cancellation may be total (1+(-1)=0). Exact identity regression executed in the cyclotomic quotient Q[z]/Phi_n(z), n=2,3,4,5,8,9, A=1,2: 80 identities; this checks algebra only, not p-adic norm estimates or Lean.

## 2. Simultaneous multivariable, all powers and monic exclusions
Same blob, exists_roots_of_unity_ellVal_le. Fix δ>0, m,L,a,q,B_k before N; choose r close enough to 1 that |p|<r^(p-1), |p|<r^(ma) (when ma>0), and r^(q+L+1)>=|p|^δ. Use all pairs (k,d), 1<=d<=m, and all monic D_n of total degree <=L, over a common sufficiently large coefficient ring. At initial tuple u_{k,d}, |F_{k,d}(u)|>=|p|^B_k and p divides (u_j-1)^a. For a=0 and nonempty input coordinates this divisibility is impossible; empty families or coordinates require no interpolation.

Induct on chosen coordinates S, keeping |F_{k,d}(partially specialized tuple)|>=|p|^B_k r^|S|. For next j specialize the remaining coordinates at their current values and form H_{k,d}(X)=F_{k,d}(...,(1+X)^d,...). Over the algebraic closure at least one d-th root of u_j is 1+w with |w|<r: the product of the d roots w of (1+X)^d-u_j has absolute value |1-u_j|<=|p|^(1/a)<r^d. (No need for that root to belong to coefficient ring.) Thus the Gauss norm of H at r dominates its known evaluation at w. Add H_*=product D_n(1+X), monic degree <=L and g_r(H_*)>=r^L. Apply section 1 jointly to H_* and all H_{k,d}, with thresholds r^L and |p|^B_k r^|S|. One ζ_j then advances every power d and every family; and |D_n(ζ_j)|>=r^(L+1) since all other factors have norm<=1. Continue q coordinates. Final v(F_{k,d}(ζ^d))<=B_k+δ and v(D_n(ζ_j))<=δ. Choose N uniformly for the finitely many possible values |S|<=q, and O afterwards containing roots. No unjustified sequential independent choice of twists. All prime-power orders and powers retained.

## 3. Sharp determinant polynomial (all coefficient specializations)
LinePointPowers.lean blob 654567bac00341a29102ee3b83266bda10ab22a9, exists_sharp_fitting_poly; Corepresentable.lean blob 3e401695d96b8ea826d60dadf0174d366f85d37c, exists_corepresenting_coords.

Use precisely the finite coordinate bijection there, over Λ=O[X_j]. The relation module R is in Λ^t and contains p^M Λ^t. For any DVR specialization Λ->O' with coefficient homomorphism e and point y, the Selmer module equals solutions in (O'/p^M)^t annihilated by the image of R. This is the actual source's continuous cocycle coordinate bijection, not a new finiteness assertion. At selected point y0, the specialized relation row span contains p^M O^t, hence full rank. A DVR basis of this span lifts to t rows of R (coefficients lift as constants in Λ). Let F be determinant of those polynomial rows. Smith normal form of that basis at y0 has diagonal π^e_i with e_i<=v(p^M), so Selmer length is sum e_i=v(F(y0)). For every other specialization, the t chosen rows impose only some of the original relations. Thus actual Selmer length <= kernel length of their matrix on (O'/p^M)^t <= v(det)=v(F(y)); singular case is the extended infinity bound. If p^M is a unit at specialization quotient is zero and bound automatic. No base-change equality of arbitrary Selmer groups assumed. Retain the universal coordinate theorem, continuity and actual relations. This gives the two inequalities (sharp at y0, upper elsewhere) required by the caller.

## 4. Uniform pencil minimum, not merely a local greedy step
TwistTheorem.lean blob bdf0bed65edefd067b584695b1fac0b6acbbd754, exists_isPencil; TiltingLemma.lean blob 62784266136a2936dd6f8d662b79fa051d28c470, tilting, length_le_of_unseen_class, length_le_of_drop_ties. Corepresentable IsBalanced gives residue cardinal >4n_i+2.

Induct on DVR divisor a of p^M by multiplying by uniformizer π. Unit divisor gives zero module and a helper pencil from exists_isAnticyclotomicAt. At level a let J1 be uniform previous bound, at every N choose helper P0 and pencil J with |J|<=J1 and X_i(a) length<=β_i. Write X_i(k) for tied cocycles zero at γ_i, at k=a or πa. All finite by the coordinate theorem. Vanishing of tame pairs at all J removes J by the actual conjugate-side detection lemma, so
    length X_i(πa) <= C_i + 2 n_i J1 length(O/πa),
where C_i is length of the fixed finite Selmer module at S with original L_i and γ_i condition (no varying primes). Consequently some pencil has potential |J|+sum_i length X_i(πa)<=K independent of N, with K=J1+sum_i(C_i+2n_i J1 length(O/πa)). Minimize sum length X_i(πa) among pencils with same helper, old a bounds, and potential<=K; nonempty, natural lengths finite.

If X_i(πa) has no unit coordinate, all values lie in π(O/πa); divide by π via the module isomorphism O/a -> π(O/πa), not field division, preserving linear relations and continuity. Then its length <=β_i. Otherwise, if it exceeds β_i, the contrapositive of the actual unseen-class theorem yields a new prime P and datum admitting all i-slopes with
    X_i(πa) not contained in φ^{-1}(γ(Y_i(πa))),
where Y_i(k) relaxes ramification at P,Pbar before the new tie. In this notation γ,φ are evaluation PAIRS (both conjugate-inverse coordinates). The kernel of γ in Y_i(k) lies in X_i(k) by detection, and conversely old unramified classes give kernel. Apply tilting to γ,φ on Y_i(k) for BOTH k=a and k=πa. The bad residue list for each has length<=2n_i. Since residue field size>4n_i+2, avoid both lists and zero; choose a unit t. Use slope t^{-1} at i, zero at all other rows. The new X_i(k) lies in ker(tγ−φ) in Y_i(k), so at k=a length<=old; at πa strict decrease by the proper preimage intersection above. Other rows have zero new slope, so their new classes lie in old modules by the same tame detection. Existing pencil conditions preserved by the unseen-class witness for every slope. Adding P costs at most one, total length drops at least one, potential remains <=K, old bounds persist. Contradiction to minimum. Thus all new level lengths <=β_i and |J|<=K, uniformly in N. Retain actual unseen-class and tilting suppliers, not just a formal minimization. The strict decrease is integer length, not normalized real length.

## 5. Exact anticyclotomic caller and common budget
TwistTheorem.exists_anticyclotomic_twist lines 103-196. Choose δ with (8J0+2)δ<η; choose first depth k before second N, with k+2M<=N. Let θ_j auxiliary characters, t_{i,j} row slopes, helper slope 1; family-value slopes 0 elsewhere. First interpolate G_i with ties at J erase helper, sharp at all-ones, plus value polynomials for {P0}. For initial helper-only value point, insertion raises value valuation <=8c via the supplied IsFamily bound and actual Frobenius near z. For row G_i, dropping helper tie costs the determinant pair at z,z^{-c}; use hβ. Apply section 2 in ONE variable along lines 1+t_{i,j}(u-1), all inverse-Frobenius monic characteristic polynomials and X minus the character values. Obtain common u of order dividing p^k: row and family line bounds b_i+δ and b_k+δ respectively, every auxiliary characteristic polynomial and linear factor cost <=δ.

Second use F_i with no ties, sharp at its own first-stage line point. Removing remaining ties adds <=2|J|δ: exact det(uρ(w)-I)=det(ρ(w)) det(uI-ρ(w)^{-1}), determinant of invertible integral representation is a unit; use the actual congruence and drop-ties theorem. For family values add all remaining auxiliary primes at cost <=8δ each by IsFamily and the linear factors, using unit character values to handle inverse powers. Thus all line bounds <= b+δ+8J0δ. The line-power lemma dvd_one_add_mul_pow_sub_one gives p | (y_j-1)^(p^k) and p^M | y_j^(p^N)-1, with k+2M<=N retained for the local tie-drop. Apply section 2 again to F_i and all full-J value polynomials simultaneously for d=1,...,m, using these line points as inputs; include monic X^d−1 factors to ensure sum tame valuations <=|J|δ. Final bounds <=b+(8J0+2)δ<b+η. Actual pointChar uses the common tuple of p^N-th roots; all powers come from the same character, not separate choices. Universal upper bound of section 3 transports to every larger coefficient DVR, so the eventual coefficient-ring quantifier survives. IsFromU1 and auxiliary conditions use the source point character construction, not an arbitrary tuple of local scalars. At TwistForRows (802242498ad4530e7f52cc4f14e0a03be2c59f4d), η=crudeUnit, so the existing 9*crudeUnit value budget, same selected rows and all permitted powers remain unchanged; FitTwistsExist da769eba595af2f883eed9b82dbd322a521aea14 consumes this once per PrimePadicIso. No new claim of uniform odd-Sha, RowBalanced local-length or denominator suppliers; they remain explicit premises.

## Evidence and handoff
Read above actual bodies, compact manuscript, mission and peer checkpoint. Native lean/lake/elan unavailable (command -v). rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier not run; old-pin checks not attributed to compact. Reread actual compact CI receipt compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json on state branch, blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six native named checks with standard three axioms, including the three TiltingLemma suppliers; module_1 timeout 124, all_requested_checks_ok=false, full_RH_replay=false. No new kernel PASS. Prepared named probes and exact scalar certificate below; uncompiled. Context keys compact pin, p,M,O, fixed row i, actual S,L,γ, J/P0, N, both levels a,πa, fixed common tuple. Preserve original/reduced graphs separately; no global edge deletion claimed. New human local DAG: coordinate theorem -> sharp determinant; exact interpolation -> uniform common root -> all powers; unseen class + tilting + tame detection -> finite minimum; both chains -> actual two-stage twist caller. Negative controls: no strict dominance at equality; one slope selected at one depth need not avoid other depth's bad residues. No URT or synthetic proof evidence.

RESUME HERE: independently audit the determinant-row and Cramer first-order consumer in RibetFirstOrder and BlockFittingBound, especially extraction of the coefficient of the squarefree product at the actual π, and finite-support lower-set cancellation; use this completed common-twist bridge rather than redoing it. HANDOFF TO integration/editor/Galois/kernel. AGREE/PARTIAL, human RH reconstruction incomplete.
-/

namespace AuditCommonRoot
theorem min_budget (j s s' K : ℕ) (h : j+s ≤ K) (hs : s' < s) :
    j+1+s' ≤ K := by omega

theorem interpolation_one_node {R : Type*} [CommRing R] (P F Q E S : R)
    (h : P = F*Q) (hS : S = F-E) : P = S*Q+E*Q := by
  rw [h, hS]
  ring

#check exists_root_of_unity_eval_large
#check exists_roots_of_unity_ellVal_le
#check exists_sharp_fitting_poly
#check exists_isPencil
#check exists_anticyclotomic_twist
#check dvd_one_add_mul_pow_sub_one
#print axioms min_budget
#print axioms interpolation_one_node
#print axioms exists_roots_of_unity_ellVal_le
#print axioms exists_sharp_fitting_poly
#print axioms exists_isPencil
#print axioms exists_anticyclotomic_twist
end AuditCommonRoot
