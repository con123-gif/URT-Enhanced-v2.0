import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN49 — independent marked HasType audit at the uniform local caller
27 November 2026. SOURCE-MATCHED human audit; replacement scalar and native
axiom probes PREPARED, not compiled. Compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207 (HEAD checked
unchanged); Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original long source pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained;
its repository HEAD observed 7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc.
Do not mix toolchains or infer compatibility. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.

Read latest mission blob 9554a3f6c54f409d60d7e98e8944d6128a399f34 first,
including mandatory reduction and completion-first. Current manuscript
d3d4b13233d81e40b5aad8ed8df79be69f367181 and head 0dcbf571. Prior peer
a599aa5c (theta RUN63) already supplies actual marked class injection/hY;
403556a7 supplies orbit and all ten HeckeSizes guards. Prime RUN61
76a10b40 already supplies the uniform index composition. These must
not be restarted as new discoveries. Current task: audit these actual
interfaces, particularly the nonreduced Frobenius quotient, and attach
their strongest elementary aggregate bound. Retain RUN36 pairing and
RUN48 level-prime branch; no RH root import. No URT necessary.

Pinned source ledger (grh-compact/src):
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
New/Data/WeilDataOfE.lean 8baa0621fbd228428a1226da1a8e98aa1251740d
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
Lib/Adelic/Hecke/HeckeBasic.lean d166991c495c40b0b5c2280a8822bcbb6806f41b
Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33

## 1. Independent exact guard audit: congruence modulo (p), not merely
modulo the maximal ideal

Let J denote complex conjugation on E, h the class of -p in Phi,
d=order(h mod N0), N=order(h^d), and t_s=h^(ds) tau. Markedness
gives d odd and positive, m | order(h)=dN, m a power of two.
Consequently m|N. The native inducedPlace_eq_or_star_iff and
placeOfInt_mul_mem_tops_iff identify range(t) with the tops over
{l,star l}; parity toggles, and t is injective. Thus N/2 letters
induce l and N/2 induce star l. The actual residue exponent
lcm(order(h),2)=dN, so the cardinal is (p^d)^N.

Let W=valuationSubring_l(E), O=embValRing, R=O/(p). IMPORTANT:
R need not be reduced or a field. Equality in the residue field
of O would be strictly insufficient. The compact frob_ext lemma
in WeilDataOfE works for arbitrary characteristic-p R: only the
subsequent frob_iff_eq_frobElem_pow requires IsDomain R.
For phi:O_E -> R given by any chosen iota_s on integral elements,
take v=h^d, conjugation sign e=-1, and exponent n=d in frob_ext.
Its cyclotomic equality follows from v=placeOfInt(-p^d), and
its quadratic equality from chiK(p)^d*(-1)=1. Therefore
    phi(v u)=phi(J u)^(p^d)       for every u in O_E.
Replace u by Ju to obtain phi(v J u)=phi(u)^(p^d).
Here v and J commute. Since the embedding choice toggles at each
successor, the actual map iota_(s+1) on O_E equals iota_s
precomposed with v J. This proves the required identity in R
without ever inferring equality modulo p from equality modulo
the maximal ideal. The step also applies at the cyclic wrap:
order(v)=N even, hence v^N J^N=1.

For x=a/b in W, b outside l, both images of b are units in O,
and thus units in R. Inverting their already established
congruence in R and multiplying proves the identity for x.
The fraction description is the actual prime-localization
of O_E. This is the correct interpretation of the source's
ringHom_ext l.1.primeCompl, not an arbitrary fraction with
nonzero denominator. No new assumption that p is a uniformizer
in O (it is not) is used. Retain p-unramified at l and the
actual cyclotomic and localization lemmas. This audit supports
the peer's exact TwistingData construction including nilpotents.

## 2. Independent caller audit: orientation and scaling

Use the SAME class reps rho_x, q: X_0 -> Fin k, rational
d0=diag(p I_r,I), P0={b in GL_k(W): d0^-1 b d0 integral},
and gamma_e=b d0 g_e, e=(x,bP0), from theta RUN63.
The finite Hecke cosets have delta_x(b)^-1 delta_x(b')
integral iff d0^-1 b^-1 b' d0 integral: rho_x cancels.
Surjectivity retains exists_mul_mem_integralAbove, not an
assumption that local matrices are rational. The actual caller
takes g_e^-1, so its input label is (src(e),g_e^T P0).
If labels agree, inverse-transpose of
d0^-1 (g_e^T)^-1 g_e'^T d0 is d0 g_e g_e'^-1 d0^-1,
which is integral. Hence gamma_e gamma_e'^-1 is integral
at l, and at star(l) by the unitary identity. The remaining
adelic comparison is
 rho_x^-1 gamma_e gamma_e'^-1 rho_x'
     = atSplit(delta_x(b)) u_e^-1 u_e' atSplit(delta_x'(b'))^-1.
Outside the split pair this is u_e^-1 u_e'. After multiplying
by its inverse, the result is supported on the split pair
and integral there. The actual marked maxCompact premise puts
it in K; trivial class automorphisms then force x=x' and
gamma_e=gamma_e'. Cancel b d0 g_e=b' d0 g_e' to get
 g_e g_e'^-1=d0^-1 b^-1 b' d0.
Thus bP0=b'P0. No generic product-level assumption.

At each even top, p conj(gamma_e)^T =
g_e^-1 (p d0^-1) b^-1, after applying Phi. At each odd top,
use the conjugate embedding and g_e^T d0 b^T instead.
Both are the exact deep diagonal with the native parity.
The Hook identity reverses BOTH monomial indices; the top
Schur factor uses height < rank, and lastEntry(0)=0.
The scalar is p^(a N/2)=p^markExponent, not p^(a N).
All unmarked tops have integral invertible matrices in the
other weight factors and nontops have degree zero. This
supplies hY with exactly the labels above and the same f.range
= integralColumns. Independent orientation/scale audit of
RUN63, not new kernel extraction; the native class-freeness,
Schur identity, weak approximation and primitive pairing
suppliers remain.

## 3. Aggregate the actual marked index with orbit disjointness
(the only new quantitative strengthening)

For each marked l let Q_l be the native orbit in section 1.
The Q_l are disjoint for distinct marked primes: otherwise
the induced prime of a common top belongs to both unordered
pairs {l,star l}; star-disjointness implies l=l'. Each orbit
has N_l >= m, exactly half its elements induce l, and all are
subsets of the same f-element infinite-place set. Thus
    m |Lambda| <= sum_l N_l <= f,
    sum_l A_l = (a/2) sum_l N_l <= fa/2.
These replace the looser |Lambda|<=f and sum A_l<=fa in the
actual uniform index calculation. This proof does not assume
Lambda full, and includes the empty mark.

Set B=log b, Jp=jetCeil(p)=ceil(2mfa/p), n=dim_C Column.
Use the native individual HasType on the same integral
lattice M, same p, same Jp. HasType.prod applies to the list
of marks repeated m times. It composes the IndexDvd witnesses,
not cardinal indices (O need not be a DVR and the quotient
need not have finite cardinality). The exponent c satisfies
    c <= [128 B/p sum_l A_l
             + m |Lambda| (Jp/x^14+x^40)] n
      <= [64 B f a/p + f( (2mfa/p+1)/x^14+x^40)] n.
By the already established native scale envelope in 403556a7,
x>=1, m<=x, f<=x^12, a>=exp(B+log x), p<x1,
log x1>=10^6 log x, B>=10^6 log x1.
Therefore mf/x^14<=1, and a/p>=x^40 (indeed
B+log x-log p >=40 log x). So
    f*2mfa/(p*x^14) <= 2fa/p,
    f/x^14 <= fa/p,   f*x^40 <= fa/p.
Since B>=65 by the actual scale,
    c <= (64B+4) (fa/p) n <= B^2 (fa/p) n <= loss(p) n.
This is strictly stronger than the source's 3 loss(p) n
budget, but only for the index branch, NOT the gauge.
It avoids dividing by n, f, or |Lambda|. No need to use
the stronger estimate in the final proof, since the native
allowedLoss=3loss remains sufficient. The actual local
submodule is still S=Y^m M+p^Jp M, independent of every
twist and good datum. The gauge bound 2loss-gain for the
first summand and loss-gain for the second remains unchanged;
apply the native k to each summand under the original strict
integer beta guard. No weakening of that guard or claim of
a global smaller budget.

Original human dependency chain preserved:
HasType individual -> HasType.prod -> uniform local index ->
exists_indexDvd_Bmu_divisible -> short_forms -> star_inequality.
Candidate reduced index bound uses same individual theorem plus
orbit disjointness and scale. Original marked-gauge, Fourier,
nonmarked, B/C and analytic obligations remain. No kernel edge
retired. Cache context includes source pin, p,l,Lambda,d,N_l,m,
a,f,representatives,r,parity,twist, Jp and lattice M.
No changed assumption in original caller; explicit hypotheses
used in the scalar certificate below.

## Verification boundary
Actual local PATH checked: no lean/lake/elan. Native engine
rh_scan/prune/reduce/auto/frontier not run on compact. Old-pin
engine receipts preserved, not treated as compact validation.
Re-read published RUN29 status a56e2d3afb99ed8275e81fd63c8494306e57c43f
and targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804,
run 45803534769: 6 named B/C theorem checks only standard
propext, Classical.choice, Quot.sound; A build timeout 124
after 2700.11s; all_requested_checks_ok=false. No new native PASS.
General orchestrator run 45952430780 is not proof replay.
Original/reduced graphs and all open obligations unchanged.
No redundant numeric diagnostic or protected workflow modification.
The below scalar and native probes are prepared, not executed.

RESUME HERE: editor/integration attach this independent audit to the
existing marked HasType and uniform local index entries (not another
OPEN duplicate). Use RUN63 jet numerical suppliers with RUN75 marked
gauge and retain the exact native scope. Next kernel task: audit the
remaining representation-theoretic primitive in exists_depth_factorization
and of_pairing against the actual Smith pivot and residue-field
independence maps; prefer a genuine missing bridge over more budget
polish. Shared runner replay of A still outstanding.
HANDOFF TO theta, acceleration, editor, integration, formal audit.
-/

namespace KernelRun49

theorem exact_label_cancel {G : Type*} [Group G] (b d g b' g' : G)
    (h : b * d * g = b' * d * g') :
    g * g'⁻¹ = d⁻¹ * (b⁻¹ * b') * d := by
  calc
    g * g'⁻¹ = (b * d)⁻¹ * (b * d * g) * g'⁻¹ := by group
    _ = (b * d)⁻¹ * (b' * d * g') * g'⁻¹ := by rw [h]
    _ = d⁻¹ * (b⁻¹ * b') * d := by group

theorem orbit_budget (B A cost t1 t2 t3 : ℝ)
    (hB : 65 ≤ B) (hA : 0 ≤ A)
    (ht1 : t1 ≤ 2*A) (ht2 : t2 ≤ A) (ht3 : t3 ≤ A)
    (hc : cost ≤ 64*B*A+t1+t2+t3) :
    cost ≤ B^2*A := by
  have h : 0 ≤ B^2-64*B-4 := by nlinarith [sq_nonneg (B-65)]
  nlinarith [mul_nonneg h hA]

#print axioms exact_label_cancel
#print axioms orbit_budget
end KernelRun49

#check frob_ext
#check TwistingData.hasType_twisted_hecke
#check Columns.hasType_markOperator
#check Data.IsMarked.hasType_markOperator
#check HasType.prod
#check Data.IsMarked.hasType_prod_markOperator_pow
#print axioms Columns.hasType_markOperator
#print axioms Data.IsMarked.hasType_markOperator
#print axioms Data.IsMarked.hasType_prod_markOperator_pow
