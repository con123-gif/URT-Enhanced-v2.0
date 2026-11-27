import Lib.PadicHodge.WachKisin.PeriodMatrixBasis
import Mathlib.Tactic

/-!
RUN82 — C1 exact Amax pullback and explicit chart precision, 27 Nov 2026.
Independent human source audit and candidate reduction; native replay PREPARED,
not executed. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read latest mission/spine/ledger, AGENTS/continuity, lane protocols, RUN79–81.
Latest inspected peer head ab77f9f9 (theta RUN85); no duplicate Galois RUN82
at directory inspection. Old pin and old native engine receipts not transferred.

Source locations relative to grh-compact/src:
 Lib/PadicHodge/PeriodRings/AmaxStructure.lean
  blob 1be9736d2c48bece6dd038c72d14b6f807cff9df, lines 141–210,
  259–269, 285–324: p_mul_X, p_mem_nonZeroDivisors, exists_lift,
  exists_p_pow_dvd_sub_aeval, exists_reduction_mod_p,
  p_pow_dvd_of_monic_mul, mem_span_pow_of_p_pow_dvd.
 Lib/PadicHodge/PeriodRings/ThetaKernel.lean
  blob ab5766dd9ea95412ad15247cef74b9b701250797:
  theta_surjective, theta_eq_zero_iff_xi_dvd.
 Lib/PadicHodge/WachKisin/HodgeFrame.lean
  blob 158f4df424f222f593b6f2baee57a294ab221f03, lines 107–117,
  155–180, 189–220: Chart, maxIdeal, NeZero c.e, associated_E_xi,
  z_pow_mem_span, exists_maxIdeal_pow_le.
 Lib/PadicHodge/WachKisin/ChartScalars.lean
  blob 8dc59315a323816ecb0eedf46b5aae0a8c714fc5:
  exists_extendToBPlus (local K), eventually_approx_sum_extendedCoord.
 Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean
  blob cd91a46eb5624b88af20a96d0450bdf059994b93, lines 85–128:
  IsPeriodMatrix.exists_basis (hA branch, native pullback).

1. Audit of the primitive reduction, with no domain assumption on Amax/p.
Let A=Ainf, M=Amax, X=xi/p in M, J=(p,xi) in A.
Retain p-regularity of M, its defining p-adic completion of
A[T]/(pT-xi), polynomial approximation mod p, and the universal
property exists_lift. The map A -> A/J -> (A/J)[T], sending X to T,
satisfies pT=xi=0 in the target. The target is p-adically complete
because p acts as zero. Thus the actual exists_lift gives F:M -> (A/J)[T].
For any y in M choose P in A[T] and w in M with y=P(X)+p w.
Then F(y)=P mod J. If F(y)=0, EVERY coefficient of P is in J.
Write each coefficient a_i=p b_i+xi c_i. Evaluation gives
   P(X)=p sum_i (b_i+X c_i) X^i.
Hence y in pM; converse is immediate. This proves ker F=pM, and
surjectivity follows by lifting finitely many coefficients of a polynomial.
No assumption that A/J is a domain or reduced: it need not be.
This is the exact native exists_reduction_mod_p, not a new ring model.

For monic f in A[T], its reduction is monic (including constant
monic 1; if target is the zero ring the injectivity claim is trivial).
Multiplication by a monic polynomial is injective over ANY commutative
coefficient ring: for a nonzero polynomial g the highest nonzero
coefficient survives in the leading product coefficient. Thus
p | f(X)y implies p | y by F. To lift to p^m, induct: if
f(X)y=p^(m+1)w, the mod-p step gives y=pz. Cancel p using its
regularity in M to obtain f(X)z=p^m w. Apply induction, then multiply
by p. Base m=0 immediate. This proves p_pow_dvd_of_monic_mul.
Neither primality of p in M nor inversion of X in M is needed.

2. Exact pullback, independent expansion of the compressed native proof.
Keep theta:A -> O_C surjective, ker theta=(xi), and theta_M:M -> O_C
extending theta (thetaAmax_algebraMap). If the image of a in A lies
in p^(m+1)M, apply theta_M to obtain theta(a)=p^(m+1) d, d in O_C.
Lift d to c in A. The kernel identity gives
   a = p^(m+1)c + xi b, b in A.
In M substitute xi=pX. Subtract the first term, then cancel p:
   X b in p^m M.
Since T is monic, section 1 implies b in p^m M. The induction
hypothesis gives b in J^m. Therefore xi b in J^(m+1), and
p^(m+1)c in J^(m+1), proving a in J^(m+1). The case m=0 is
the unit ideal. Conversely both p and xi map to pM, hence J^m
maps into p^m M. This yields the EXACT native filtration pullback:
   (A -> M)^(-1)(p^m M) = (p,xi)^m A   for all m>=0.
No theta of BPlus needed, no inversion of p before cancellation,
no changed premise or additional uniform denominator.
This audits RUN81's first retained ring law and its actual two callers.
The underlying Fontaine kernel and p-regularity proofs are retained.

3. Replace existential radical cofinality by explicit chart exponent.
At the SAME native chart c, write e=c.e>=1 (native NeZero instance),
I=(p,z)A, and J as above. Since E=z^e U+p with U a unit and E
associated to xi, z^e belongs to J, and p belongs to J.
Every generator p^i z^(e-i) of I^e lies in J: if i>=1 it has a
p factor, and if i=0 it is z^e. Consequently
   I^(e n)=(I^e)^n <= J^n   for every n>=0.
For n>=1 a sharper uniform sufficient exponent is e(n-1)+1:
for i+j=e(n-1)+1, i+floor(j/e)>=n, because otherwise
i+j <= i+e(n-i)-1 <= e(n-1)+e-1? More directly if
i+floor(j/e)<=n-1 then j<=e(n-1-i)+e-1, so i+j<=en-1.
This latter bound does NOT prove the sharper exponent stated above.
REJECT the sharper exponent; indeed e(n-1)+1 < en for e>1,
and z^(en-1) need not lie in J^n. Keep N=en only.
The ideal inclusion proof for N=en is independent of sharpness.
This replaces the radical finite-generation extraction at the
specific exists_maxIdeal_pow_le caller; no global dependency
removal claimed. I is the extension of c.maxIdeal to A,
so I^N=c.maxIdeal^N A, by compatibility of ideal extension and
powers. Restrict scalars to c.S to get the original statement.
At RUN81's approximation fix k,m first and take the topological
basis approximation at chart precision e(k+m). Then its
residual in A lies in J^(k+m), maps to p^(k+m)M, and the previous
exact denominator cancellation applies. No change in the resulting
p^m precision, no new loss in the C1 height budget.
At exists_basis, use the same pullback coordinatewise on D_T
from RUN81; it is not enough that D_T is divisible by p^m in
BPlus, where p is a unit. The native proof explicitly uses
injective_Amax_BPlus to bring the equality back into M.

4. Scope and evidence.
Local source edges (not kernel graph):
exists_lift + polynomial approximation -> exists_reduction_mod_p
 -> p_pow_dvd_of_monic_mul -> mem_span_pow_of_p_pow_dvd
 -> ChartScalars.local K / PeriodMatrixBasis.hA.
Alternative chart cofinality:
z_pow_mem_span + associated_E_xi + p generator -> I^e <= J
 -> power monotonicity -> exists_maxIdeal_pow_le -> residual.
Keep original graph, all primitives, and existing downstream
axiom evidence. Only candidate local proof changes.
Context key: compact pin, actual chart c, e, A,M,X,theta_M,
p-regularity, n, same RUN81 k,m and hA. No URT claim.
Native lean/lake/elan absent from local PATH (checked in container).
No native rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier or
CI replay executed in this run; no PASS. Helpers below are
prepared executable candidates, not original-statement replacements
yet. The live B2/C2 graph receipts are not C1 evidence.
No protected workflows or shared registry changed. The existing
RUN75–82 family still needs native original-type and caller replay.
No numerical regression substituted for actual ring proof.

RESUME HERE: integration/kernel shared native runner should replay
RUN75–82 at the compact pin, starting with actual Amax pullback and
ChartScalars cofinality consumers; obtain complete original-type,
direct/transitive caller guards and #print axioms, then proceed to
the remaining C1 odd-Sha/fit witness. No C1 or RH closure claimed.
HANDOFF TO: Galois, integration/editor, kernel/audit.
-/

namespace RHGaloisRun82

/-- Lift a modulo-p regularity test through finite p-power divisibility.
The monic reduction and p-regularity are supplied by the actual ring. -/
theorem lift_regular_divisibility {R : Type*} [CommRing R] (p u : R)
    (hc : ∀ x y : R, p*x = p*y → x=y)
    (hm : ∀ x : R, p ∣ u*x → p ∣ x)
    (n : ℕ) (x : R) (h : p^n ∣ u*x) : p^n ∣ x := by
  induction n generalizing x with
  | zero => simp
  | succ n ih =>
    obtain ⟨w, hw⟩ := h
    have h1 : p ∣ u*x := ⟨p^n*w, by rw [hw, pow_succ']; ring⟩
    obtain ⟨z, hz⟩ := hm x h1
    have hz' : u*z = p^n*w := hc _ _ (by
      calc
        p*(u*z) = u*x := by rw [hz]; ring
        _ = p^(n+1)*w := hw
        _ = p*(p^n*w) := by rw [pow_succ']; ring)
    obtain ⟨t, ht⟩ := ih z ⟨w, hz'⟩
    exact ⟨t, by rw [hz, ht, pow_succ']; ring⟩

/-- The explicit cofinality bound after the single generator inclusion. -/
theorem explicit_cofinality {R : Type*} [CommRing R]
    (I J : Ideal R) (e n : ℕ) (h : I^e ≤ J) :
    I^(e*n) ≤ J^n := by
  rw [pow_mul]
  exact pow_right_mono h n

#check Amax.exists_reduction_mod_p
#check Amax.p_pow_dvd_of_monic_mul
#check Amax.mem_span_pow_of_p_pow_dvd
#check Lift.Chart.exists_maxIdeal_pow_le
#check Lift.Chart.exists_extendToBPlus
#check Lift.Chart.eventually_approx_sum_extendedCoord
#check Lift.Chart.IsPeriodMatrix.exists_basis
#print axioms lift_regular_divisibility
#print axioms explicit_cofinality

end RHGaloisRun82
