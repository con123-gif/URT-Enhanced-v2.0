import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
RUN56 theta lane — 26 November 2026. Independent completion of the
ramified zero-exponent term missing from prime-window RUN55's human
summation, and direct same-module transport audit. Source-matched
human argument; new Lean declarations prepared, NOT compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, current manuscript
57e7f36aa8032da2dd16f54a539e23d992a7cf96; protocol, handoff, expansion,
AGENTS and continuity inspected. Latest peer RUN58 efbbc42e covers
both dimension suppliers, kernel 2e27597e covers root lemma,
c561038c covers normalized inverse prefix. Do not duplicate them.
Previous theta RUN55 1cc71623 supplies projector.
Prime peer 5b79a6d9 supplies positive-e summation, 36a56d6c supplies
Schur jet frames. Here close their omitted e=0 case; then check the
same-module transport. Not a new proof of the whole A theorem.

Source ledger (relative to grh-compact/src):
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
  115-120 jetExponent; 155-163 lowColumns_lowBoxes_bounds;
  168-204 le_jetExponent, specifically cases e=0 and h6.
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
  19-21 localAsk (strictly positive exponent); 69-73 couplingCount;
  96-102 hasSum_live_inv_pow.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
  Data.scale, m_mem, r_mem; k, tops, nominalWeight, a.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
  c_ge, placeClass_of_thick.
New/Data/Weights.lean 8749d68da003347685ca36817b32cafda51a3a6a
  nominalWeight_mem_Icc.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
  IndexDvd.trans/map/comp; HasType.prod.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  184-194 gaugeLe_markOperator_pow; 233-240 hasType_prod_markOperator_pow;
  255-276 gauge bounds; 285-307 actual local index consumer.

1. Zero-exponent term must be accounted for, not dropped.
The native jetExponent subtracts a finite coupling sum over e <= log_p N
with Odd e OR p=d, but the positive geometric series and local asks
start at e>0. Thus e=0 appears precisely at the ramified prime p=d.
The peer positive-exponent proof cannot by itself pay this term.

Fix admissible D, j<m, any ev, p=d, u=a/(pm). Write s'=placeOfInt(-1)*s.
With t_s=a*1_(s top outside ev), r_s=lowColumns(j,s), B_s=lowBoxes(j,s),
the e=0 coupling is exactly
    C_0(s)=min(t_s,r_s'+t_s') + r_s + min(B_s,B_s').
The modulo-N0 class of placeOfInt(-1) is -1, not 1 (native N0>2).
Tops have class 1; thick places have class -1. Hence s and s'
cannot both be tops; nor can both be thick. These statements hold
for arbitrary ev, without any marking hypothesis. Therefore at least
one of t_s,t_s' is zero, and at least one endpoint is not thick.

The native low-column bounds give r_s <= a/x + x^60 at every s,
and B_s <= k*a/x1 + x^60 when s is not thick. For the ramified p=d
these are each <=u. To make the scale use explicit: m<=2 sqrt(x),
k<=r<=3 x^5, d<=P.c. Data.scale gives log x>=100 log log b
>=10^14 P.c; log x1>=10^6 log x and log b>=10^6 log x1.
Since a>=xb, these imply separately
    2 d m <= x,
    2 d m x^60 <= a,
    2 d m k <= x1.
For example 2 d m <=4 d sqrt(x) <= x since log x/2 >= log(4d);
2dm x^60<=4d x^60.5<=xb by log b>=10^12 log x;
2dmk<=12d x^5.5<=x1. All factors are positive.
Consequently both r's <=u and at least one B<=u.
If t_s=0, first min <=0. Otherwise t_s'=0 and first min <=r_s'<=u.
The middle term and the final min are each <=u. Thus
    C_0(s) <= 3u <= 4u.
This is the exact native zero-branch estimate needed in
le_jetExponent. It requires neither positive-exponent collision
support nor a positive-exponent geometric bound at e=0.

2. Combine once with positive-exponent peer, not a fresh estimate.
Use RUN55 (5b79a6d9) for e>0, keeping the correction term at e=1,
and its exact min/positive-part cancellation. Sum only over the
finite 0<=e<=log_p N for the additive errors; the tail has no
coupling error. At e=0 the asks, collision sum and e=1 correction
are zero and the inequality just proved pays the entire coupling.
At chi=-1 the e=0 coupling is absent; no charge needed.
The weight omega=(1-chi)/2 is at most 1, and n_(j+1)^3<=u.
Thus the SAME native finite error <=5 f u(log_p N+1)<=f u logB^2.
This completes the previously unstated endpoint in the human
arithmetic derivation of le_jetExponent. No improved numerical
constant is needed. The actual Schur-jet valuation and the
native source binding of the scale estimates remain separate
from the scalar certificates below.

3. Direct same-witness index transport, independent check of caller.
Fix O=embValRing, the native integral column module M, a=p^s,
and two endomorphisms A,B preserving M. No finite freeness or
discrete valuation hypothesis needed for IndexDvd.
For any finite tuple v in M choose a matrix U by IndexDvd
for AM+aM, with det U|p^lA; write (Uv)_i=A x_i+a y_i,
x_i,y_i in M. Apply the B bound to the SAME x_i, obtaining V,
det V|p^lB, (Vx)_i=B z_i+a w_i. O-linearity gives
    (VUv)_i=AB z_i + a(A w_i+(Vy)_i).
Both terms in parentheses are in M. Hence det(VU)|p^(lA+lB)
and every combination belongs to ABM+aM. This proves the
composition in ModuleIndex.HasType.prod at actual order AB;
no need to commute A and B, divide by a, or replace the image by
an intersection. Iterate over the native ordered list repeated m
times. The chosen index exponent is independent of the finite
tuple by the native HasType hypotheses; matrices may depend on tuple.
The module S=Y^m M+p^jetCeil M is therefore the SAME module
whose two summands have the separate gauge bounds, both uniform
in every good datum and coprime twist. O-linearity and the
nonarchimedean triangle inequality preserve the common bound.
This audits the original caller without introducing any new
pointwise independence or finite-lattice assumption.
No assertion that the marked Hecke type is proved by this
transport alone. Retain all source hypotheses and error budgets.

Evidence: executed integer regression of the exact scalar
zero-exponent lemma in V8, 52,207 cases, 2 negative controls:
for u=0..4,r,s=0..u,t,v,B,C=0..8, restrict t*v=0 and
min(B,C)<=u, check min(t,s+v)+r+min(B,C)<=3*u.
Both-top control t=v=10,r=s=B=C=0,u=1 fails; both-large-box
control B=C=10,t=v=r=s=0,u=1 fails. These are scalar regression
only, not native data or proof of RH; the proof above is universal.
No local lean/lake executable. Re-read actual old engine receipts
b1c96f58 and 7da35494 (pass, old source pin). Latest compact RUN29
receipt 088cd2ec / status a56e2d3a (run 45803534769) reports
six B/C native axiom checks, A build timeout after 2700.11s,
all_requested_checks_ok=false. Orchestrator run 45836072831
success is NOT new A certificate replay. No rh_scan/prune or
rh_auto on compact declarations available locally. Below are
prepared scalar certificates and native axiom probes, NOT verified
replacement terms. Original and reduced graphs and axiom ledger
unchanged; no global dependency deleted. Static source chain:
zero-exponent term + positive-e peer + scale -> le_jetExponent
-> gaugeLe_Bmu_of_isMarked -> exists_indexDvd_Bmu_divisible -> A.
HasType.prod chain audited, all other deep suppliers retained.

RESUME HERE: Integration/editor incorporate the ramified e=0
paragraph into RUN55 positive-exponent derivation; audit exact
scale/negative-one class bridge and native A replay when possible.
Theta next: actual level-N Fourier operator small-index supplier
and uniform projection onto ramified columns; avoid reopening the
peer-completed dimension suppliers except for concrete audit gaps.
HANDOFF TO prime-window, kernel, audit, editor, integration.
Human proof reconstruction incomplete.
-/

namespace ThetaRun56

theorem ramified_zero_coupling (u t t' r r' B B' : ℝ)
    (hu : 0 ≤ u) (hr : r ≤ u) (hr' : r' ≤ u)
    (ht : t = 0 ∨ t' = 0) (hB : B ≤ u ∨ B' ≤ u) :
    min t (r' + t') + r + min B B' ≤ 3 * u := by
  have h1 : min t (r' + t') ≤ u := by
    rcases ht with h | h
    · exact (min_le_left _ _).trans (h.symm ▸ hu)
    · rw [h, add_zero]
      exact (min_le_right _ _).trans hr'
  have h2 : min B B' ≤ u := by
    rcases hB with h | h
    · exact (min_le_left _ _).trans h
    · exact (min_le_right _ _).trans h
  linarith

theorem ramified_scale_split (a x m p w err : ℝ)
    (hm : 0 < m) (hp : 0 < p) (hx : 0 < x)
    (ha : 0 ≤ a) (h₁ : 2 * p * m ≤ x)
    (h₂ : 2 * p * m * err ≤ a) (hw : w ≤ a / x) :
    w + err ≤ a / (p * m) := by
  have hpm : 0 < p * m := mul_pos hp hm
  have htwo : 0 < 2 * (p * m) := by positivity
  have h₃ : a / x ≤ a / (2 * (p * m)) := by
    apply div_le_div_of_nonneg_left ha htwo
    linarith only [h₁]
  have h₄ : err ≤ a / (2 * (p * m)) := by
    apply (le_div_iff₀ htwo).2
    calc
      err * (2 * (p * m)) = 2 * p * m * err := by ring
      _ ≤ a := h₂
  have he : a / (2 * (p * m)) + a / (2 * (p * m)) =
      a / (p * m) := by field_simp
  linarith

end ThetaRun56

#print axioms ThetaRun56.ramified_zero_coupling
#print axioms ThetaRun56.ramified_scale_split
#print axioms Data.le_jetExponent
#print axioms Data.IsMarked.hasType_prod_markOperator_pow
#print axioms Data.exists_indexDvd_Bmu_divisible
