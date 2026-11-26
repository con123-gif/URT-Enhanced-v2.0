import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
RUN58, O(N) lane — 26 November 2026.
Human source-matched derivation of the Frobenius factor primitive at the
actual approximate-projector caller. Native replacement certificates
PREPARED, NOT COMPILED. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, latest manuscript
2eea9dc47d0e037627e4f4c1894f0bc86426454e read; protocol, handoff,
expansion and AGENTS inspected. Peer theta c22bb6a0 already reconstructs
pairing and depth factorization, 1300ab28 level Fourier; prime 747e9219
stage support; kernel 5c9704e4 depth mass; editor 9a920a1a. Own RUN57
03380f28 orbit budget. Avoid duplicating those.

Source ledger, relative to grh-compact/src:
New/TwistedHecke/FrobeniusFactors.lean c6cb25c36279a298cf4de03a6b788786354e00f3
  frobOperator_map, frobOperator_mem, p_dvd_cj_frobenius_sub,
  pow_dvd_coeff_conj_frobOperator, degree_le_of_coeff_frobOperator.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  exists_projector (key, hz), hasType_twisted_hecke.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  deepIndicator, letterRep, excessWeight, w_sq, frobenius_congr.
New/TwistedHecke/RootLemma.lean 0b933c458f7ccf3ee856dfda11a145a846d667b7
  adicFiltration, gaussFiltration, IsRealFiltration, root_lemma.

1. Covariance with unequal row lengths (frobOperator_map).
At letter s put H=ι_s(h). For each m the reversed product of factors
conjugated by H is H M_m H^-1, with all interior H^-1 H cancelled.
For odd letters apply adjugate transpose; its conjugation is
adj(H M_m H^-1)^T = H^-T adj(M_m)^T H^T, by the polynomial adjugate
product identity and invertibility of H, not invertibility of M_m.
The row length m(b)=ell+deepIndicator(r,b,s) is constant within each
block. Since h is block diagonal for that same split, taking row b
of the conjugated m(b)-product commutes with the row selection.
Thus the assembled matrices intertwine by letterMatrix(s,h), including
odd inverse transpose. Symmetric powers and the Kronecker product
preserve this exact conjugation. Applying the coefficient ring map
commutes with all products and minors. This is precisely frobOperator_map;
no added assumption that all row lengths are equal or the generic
matrices are invertible.

2. Filtration transport (frobOperator_mem).
Retain the native decreasing multiplicative filtration G. Write
A_{s,d}(b) for alpha(s,d,b), |A_{s,0}(b)|<=u, sum_b A_{s,d}(b)=0.
Factor ψ(s,d)_{bc} lies in G(A_{s,d+1}(b)-A_{s,d}(c)-u).
In a matrix-product path with row b and final column c, all internal
A values cancel BEFORE the filtration estimate. Every summand of
M_m(b,c) is therefore in G(A_{s,m}(b)-A_{s,0}(c)-m u),
hence G(A_{s,m}(b)-(m+1)u). The identity matrix is the m=0
case (zero coefficients unrestricted). For odd s, adj(M_m)^T(b,c)
is the cofactor deleting row b and column c. In each determinant
summand each other row occurs once. Zero sum of A gives the bound
G(-A_{s,m}(b)-(k-1)(m+1)u). This also works for the empty minor k=1.
Even rows use +A; odd rows use -A. Since m<=ell+1, both satisfy the
common row loss k(ell+2)u. Degree-n symmetric powers multiply n
factors, where multiplicity of output row b is the exponent β(b,s).
All terms in the Kronecker product across N letters consequently
lie in G(sum_{s,b} x(b,s)β(b,s)-N n k(ell+2)u), with exactly
x(b,s)=sign(s)A_{s,ell+deepIndicator}(b).
This proof uses sum closure and multiplicative grading, no norm,
no inversion of generic matrices and no enumeration of paths.
It gives the source's same statement rather than a different bound.

3. Frobenius error in the actual generic factors
(p_dvd_cj_frobenius_sub and pow_dvd_coeff_conj_frobOperator).
Keep a'=a+1, ell<=N, N n k(ell+2)<=P^ell, P=p^o0>=5, q=P^N,
w²=p. Let I_b=(1_{b=a'}-1_{b=a})/P^ell and pick eps=+1 or -1
so eps times the source excess discrepancy equals its absolute value.
Set u=1/(2P^ell), A_m(b)=(eps/2)P^m I_b/q,
and for j=s-d (cyclic letters)
  alpha(s,d,b)=A_{d+(j-i mod N)}(b),
  omega(j,b,c)=A_N(b) if j=i,
                 A_{(j-i mod N)}(b)-A_{(j-i mod N)}(c) otherwise.
Here j-i mod N denotes the representative 0,...,N-1, not an
unbounded integer difference. Each A_m has zero sum over b.
For m<=N, |A_m(b)|<=u; thus the initial alpha satisfies section 2.
The weighted polynomial Gauss filtration assigns a term with
coefficient divisible by w^l and exponent ν a lower order
l+sum omega(j,b,c)ν(j,b,c).

The generic input is Y_j=(X_{j,b,c}); let ψ(s,d) be
  H_s (H_j^-1 Y_j H_j)^{[P^d]} H_s^-1
where [P^d] means entrywise powers, NOT a matrix power.
Modulo the ideal (p), Frobenius is a ring endomorphism and
ι_s(h)=ι_j(h)^{[P^d]}, likewise for h^-1, by the native iterate
congruence. Hence ψ(s,d) is entrywise congruent to
Y_j^{[P^d]} modulo p=w². This holds over arbitrary coefficient
rings in the source, not only fields or reduced rings.

Check the required filtration bound for this factor:
- If j≠i, its cyclic representative decreases by one when d
  increases, so alpha(s,d+1,b)-alpha(s,d,c)=P^d omega(j,b,c).
- If j=i, wrap gives exactly alpha(s,d+1,b)-alpha(s,d,c)
  =P^d A_N(b)-A_d(c), and |A_d(c)|<=u since d<=ell<=N.
Thus the unperturbed monomial X_{j,b,c}^{P^d} satisfies the
required alpha difference minus u in both cases.
Every error monomial is homogeneous of total degree P^d with
coefficient in (w²); |omega|<=2u=1/P^ell<=1/P^d. Its Gauss
order is at least 2-1=1. Both endpoint alpha values have magnitude
<=P^d u<=1/2 (the maximum index is N+d), so the required
difference minus u is <=1. Error terms also satisfy it.
No termwise cancellation estimate after taking absolute values.

For the final rows, sign(s)A_{ell+deepIndicator+(s-ell-
deepIndicator-i mod N)}(b) equals exactly
(eps/2) excessWeight(i+ell,a,a')(b,s). Verify directly:
a' is deep at even letters, a at odd letters; the root's
positive exponent has the extra step 1 and the other root
has no extra step; all other b give zero.
At each j≠i the assumed equality of row and column I-weight
of ν_j cancels that letter's contribution to weight omega ν.
At j=i the weight is (eps/2) times the row I-weight.
Apply section 2 to the Gauss filtration, with total loss
E=N n k(ell+2)u<=1/2. The coefficient of the ACTUAL row β
and monomial ν is divisible by w to the nonnegative ceiling of
  (eps/2)(excess(β) - rowWeight(ν_i)) - E.
If the absolute discrepancy exceeds 2c+1, this number is
strictly larger than c before rounding. Thus w^c divides it
(in fact the displayed estimate is stronger). Keep native c.
This is the exact pow_dvd_coeff_conj_frobOperator conclusion
used by exists_projector/key; no independent generic witness.

4. Degree bound used by the SAME projector (hz).
Each generic matrix factor is homogeneous of degree P^d.
A row with m<=ell+1 has degree <=sum_{d<m} P^d
<= (ell+1)P^ell. An odd cofactor has degree at most
(k-1) times that; use k in both cases. Degree-n symmetric
powers, then N-letter product, have total degree at most
N n k(ell+1)P^ell. The degree of any individual letter j
of any nonzero coefficient is no larger. This directly supplies
the native (looser) N n k(ell+2)P^ell bound, preserving the
original class-mean cutoff. No new optimization of constants.

5. Caller and remaining frontier.
In exists_projector the coefficient functional S is tensorized
over all letters, the source class means κ False and κ True
supply the required invariance and support, and the coefficient
divisibility above kills each bad monomial in key. The source
degree cutoff in hz is supplied by section 4. These lemmas
are exactly reused by the source projector, which then feeds
of_pairing in hasType_twisted_hecke and Columns.hasType_markOperator.
Still required: independent human reconstruction of the actual
class-mean existence/support, diagonal form b and tensor dual
projector assembly, root_lemma (for depth and cone), and cone
volume. Do not infer those from covariance or the filtration alone.
No global obligation removal, no claimed native graph modification.
Original/reduced graph: same source nodes/edges above; candidate
replaces internal proofs of five factor lemmas by sections 1–4;
preserve the original proof, all type/value/axiom edges, and the
open class means/root/cone suppliers until replacement replay.

Complexity: additive path budget is computed from endpoints and
row multiplicities; the proof need not enumerate exponentially
many paths. This is a symbolic invariant, not a measured Lean
speedup. Context cache key includes pin, s,d,i,ell,r,a,a',eps,
and twisting data; never cache across coefficient rings or
different valuation/weight premises. No URT.

Execution this run: exact blob + text checks, 28/28 on four
actual pinned source bodies, four negative controls removing
the first declaration guard detected. These are source consistency
checks, not native proof tests. Local lean/lake absent (command -v
both returned no path). Actual prior RUN29 status a56e2d3a,
run 45803534769, state JSON status=error, returncode=1;
outer Actions job success is NOT a mathematical PASS. Registry
contains no separate A-only retry entry at time inspected.
No new rh_scan/prune/auto/frontier or native axiom output.
The probes and scalar certificates below are prepared only.
Use the already authorized shared compact native runner; do not
modify protected workflows or import Main/RH. Preserve prior
graphs and axioms. Native engine versions must match compact pin.

RESUME HERE: integrate sections 1–4 at projector key/hz, then
derive ClassMeans.exists_mean (support and invariant diagonal)
and exact projector assembly, or coordinate with theta if claimed.
Replay this file using lake env lean from pinned grh-compact,
inspect actual output and audit the source-matched derivation.
HANDOFF TO theta, kernel, audit and integration.
Human RH reconstruction remains incomplete.
-/

namespace AccelerationRun58

theorem coefficient_margin (d E c : ℝ) (h : 2*c+1 < d)
    (hE : E ≤ 1/2) : c < d/2-E := by linarith

theorem cyclic_wrap_margin (v u t : ℝ) (hv : |v| ≤ u) :
    t-u ≤ t-v := by
  have := (abs_le.mp hv).2
  linarith

theorem generic_error_margin (a b u : ℝ)
    (ha : |a| ≤ 1/2) (hb : |b| ≤ 1/2) (hu : 0 ≤ u) :
    a-b-u ≤ 1 := by
  have ha' := (abs_le.mp ha).2
  have hb' := (abs_le.mp hb).1
  linarith

theorem row_path_cancel (a b c u v : ℝ) :
    (a-b-u)+(b-c-v) = a-c-(u+v) := by ring

end AccelerationRun58

#check TwistingData.frobOperator_map
#check TwistingData.frobOperator_mem
#check TwistingData.p_dvd_cj_frobenius_sub
#check TwistingData.pow_dvd_coeff_conj_frobOperator
#check TwistingData.degree_le_of_coeff_frobOperator
#check TwistingData.exists_projector
#print axioms AccelerationRun58.coefficient_margin
#print axioms AccelerationRun58.cyclic_wrap_margin
#print axioms AccelerationRun58.generic_error_margin
#print axioms AccelerationRun58.row_path_cancel
#print axioms TwistingData.pow_dvd_coeff_conj_frobOperator
#print axioms TwistingData.degree_le_of_coeff_frobOperator
#print axioms TwistingData.exists_projector
#print axioms TwistingData.hasType_twisted_hecke
