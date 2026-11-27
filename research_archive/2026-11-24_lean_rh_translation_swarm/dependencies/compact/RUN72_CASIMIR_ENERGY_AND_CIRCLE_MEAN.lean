import Lib.DiscreteSeries.Rigidity.CasimirGrowth
import Lib.DiscreteSeries.Rigidity.KernelFixes
import Lib.DiscreteSeries.FlenstedJensen.KTypeProjection
import Mathlib.Tactic

/-!
# RUN72 — compact Casimir separation and the exact torus circle mean
27 November 2026. Human source-matched proof; not newly kernel-verified.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, manuscript
29820c25acc91450aa8ec712774b57b3d0051c41, observed working head
72775cce00a61e18d581fe0bef7cfdaa983550c5. Read mission including unified
engine, AGENTS, swarm, handoff, continuity, latest manuscript and RUN71
b66c0b19cc910c52c15fac015173eeb017898b8e. Continue C local theta, not
the independent B filling branch. No URT premise.

## 1. Finite filtration without a weight-search enumeration

Actual source Rigidity/HighestVectors.lean
05e2716ad17f0ae4dc6043a359ff16f22687e7cb, IsKHighest.finite_filtration
and filtration_le_of_word_mem. Rigidity/CasimirBound.lean
f47bbb602c8e77086cbc4506f6580739716dd2b7.
Let x be K-highest of weight nu, M_j the native filtration, and
kappa=casimirKValue(nu). Compact Casimir commutes with each compact
E_ab and hence is exactly kappa on M_0, by the invariant kernel of
Omega_K-kappa. This does not require finite dimensionality yet.
Compact adjoints E_ab*=E_ba give sum_{compact ab}||E_ab y||^2
=kappa||y||^2. In particular every nonzero compact lowering word y
on x of weight mu satisfies sum_a mu_a^2<=kappa. Its length L is
at most l dot (nu-mu), because each lowering decreases this
integer weight pairing by at least one (l entries distinct).
Cauchy-Schwarz bounds this by l dot nu+||l||sqrt(kappa), independent
of the word. If x=0 then all M_j are zero; otherwise kappa>=0.
Only finitely many lowering words of this bounded length exist.
Their span is lowering-invariant and contains x, so the actual
filtration_le_of_word_mem at s=0 puts M_0 in the span. The reverse
inclusion follows from compact stability. Recursively M_{j+1}=
M_j+sum_E E M_j is finite. This is a human proof of the required
finiteness with a different explicit word-length bound; it uses
no classification of discrete series.

## 2. The first-step compact spectral gap at the actual consumer

Source Rigidity/CasimirGrowth.lean
46e437f11a82ea966051cc0edec3d6eaa2f9496b:
mem_orthogonal_filtration_of_casimirK; its only presently traced
rigidity consumer is coeff_eq_dsCoeff_of_isKHighest in
Rigidity/KernelFixes.lean b7c9218680d4848f11347c91dd6a952ee9b1a0ca
at s=0. Keep general s in this proof. Let Lambda=lowestKType,
kappa=casimirKValue(Lambda), n=card index. Assume precisely the
native HasLargeGap A (gap 500 n^3+A, A natural), IsUnitaryCasimirGe,
and x K-highest Lambda. Empty n or x=0 is immediate.

Put U=M_1 intersect M_0^perp. It is finite and compact-invariant
by sign adjoints, and decomposes orthogonally into irreducible
compact modules (finite-dimensional invariant subspaces have
invariant orthogonal complements). Any nonzero highest z of
one such summand pairs with some word of length <=1 on x:
otherwise z^perp is compact-lowering stable by the raising
condition and would contain M_1 by filtration_le_of_word_mem.
The length-zero and compact E words lie in M_0 and cannot pair.
So the word is E_ab with opposite signs, and its weight is
Lambda+e_a-e_b (selfadjoint diagonals imply equality of weights
when the inner product is nonzero).
The retained native IsKHighest.casimir_bound on z says
    0 <= n^3+2+l_a-l_b.
The opposite-sign gap |l_a-l_b|>=1000 n^3+2A rules out l_a<l_b.
Consequently l_a-l_b>=1000 n^3. By two_mul_lowestKType,
with r^nc=twoRho(l,unequal signs), the EXACT difference is
    casimirKValue(Lambda+e_a-e_b)-kappa
      = l_a-l_b+r^nc_a-r^nc_b+2
      >= 1000 n^3-2n+2 >= 4n+2.
Here |r^nc_i|<=n and n>=1. Compact Casimir is central, hence
each compact irreducible summand has this scalar lower bound.

Let P be the orthogonal projection to M_0; P commutes with
compact operators and has range on which Omega_K=kappa.
For any a perpendicular to M_0 put A_1=sum_E ||P E a||^2,
where E runs over all n^2 matrix units. If a=y+z is its
orthogonal decomposition with y in M_1, z perpendicular to
M_1, then P E z=0 by the sign adjoints. Also y in U.
The weighted energy D_1=sum_E E^* P E commutes with compact
operators by commute_E_sum_E_mul_mul_E (or expanding the
matrix-unit brackets, preserving the sign factors). Thus
    sum_{E,C compact}||P E C a||^2 >= (kappa+4n+2) A_1.
Indeed the LHS is <y,D_1 Omega_K y> (sum_inner_casimirK),
and D_1 is positive and commutes with the finite compact
Casimir, so sum over its orthogonal eigenspaces on U.
No claim that D_1 maps U into itself is required: commute
with Casimir suffices for the cross terms to vanish.

For each compact C and arbitrary E,
    P E C a = C P E a + P[E,C]a.
By [E_ab,E_cd]=delta_bc E_ad-delta_da E_cb, each of the
two sums of squared individual terms over all E,C (dropping
the compact restriction only in this nonnegative bound)
equals n A_1. The elementary square-of-difference bound gives
    B_1=sum_{E,C compact}||P[E,C]a||^2 <=4n A_1.
Also sum||C P E a||^2=kappa A_1. Expand the first energy
BEFORE applying this bound. Subtraction gives the crucial
base cross term
    2 Re sum_{E,C compact}<C P E a,P[E,C]a> >= 2 A_1.
This is exactly the base h2 of the native recursion; retaining
the positive cross term is essential.

## 3. Word-energy recursion and spectral exclusion

For k>=0 use the family J_w=P E_w over all matrix-unit words
of length k (J_empty=P); A_k(a)=sum_w||J_w a||^2.
Let B_k(a)=sum_{w,C compact}||[C,J_w]a||^2 and
T_k(a)=sum_{w,C compact}||J_w C a||^2.
The energy form D_k=sum J_w^*J_w is compact-invariant:
D_0=P, D_{k+1}=sum_E E^* D_k E and the same signed
commutator cancellation applies. Consequently
    T_k(a)=Re sum_w <J_w a,J_w Omega_K a>.
This is native IsKInvariantForm.mul_E and sum_inner_casimirK.
If a perpendicular to M_k then J_w a=0 by adjoints. If
a perpendicular to all M_j for j<k and A_k(a)=0 then
a perpendicular to M_k, because M_k is spanned by words
of length <=k applied to M_0. This uses the actual filtration
definition, not an unproved equality of arbitrary imported graphs.

We prove the following two simultaneous assertions:
(C_k) for a perpendicular to M_k and each J_w, the native h2
summed over w is
    2 sum_{w,E} ||J_w E a||^2
      <=2 Re sum_{w,E,C} <C J_w E a,J_w[E,C]a>.
The base k=0 is section 2. The stronger individual-word form
also propagates: for J'=J_w E' and a perpendicular to M_{k+1},
apply the individual assertion for J_w to E'a, which is
perpendicular to M_k. The differences in moving E' past E
and past [E,C] are J_w times a Lie bracket (a linear
combination of single E's), and vanish because such vectors
are perpendicular to M_k. Thus each term has exactly the
required form for J'. Sum over words only afterward.

(S_k) for a perpendicular to all M_j with j<k,
    (kappa+2k) A_k(a) <= T_k(a)-B_k(a).
At k=0, P commutes with compact C, so B_0=0 and T_0=kappa A_0.
For induction take a perpendicular to all M_j, j<k+1.
Then E a perpendicular to M_j for j<k. Apply S_k to E a,
sum over E. With U=J_w E C a, V=J_w[C,E]a,
Z=[C,J_w]E a, W=C J_w E a, we have W=U+V+Z.
The increase of the right side from the old sum to the new
one is EXACTLY
    ||U||^2-||Z+V||^2-||U+V||^2+||Z||^2
       = -2 Re <W,V>
       = 2 Re <C J_w E a,J_w[E,C]a>.
Sum; C_k supplies at least 2 A_{k+1}. This proves S_{k+1}
without norm bounds on the long commutator words. No loss of
a factor n^k, and no extra assumption on the representation.

Finally let Omega_K a=theta a, theta real, theta-kappa<=s,
and a perpendicular to M_s. By induction for t>s, assume
a perpendicular to all earlier M_j. If A_t=0 we are done by
the word detection above. Otherwise T_t=theta A_t,
B_t>=0, and S_t implies theta>=kappa+2t, contradicting
theta<=kappa+s. This proves the exact native theorem for all t.
In particular at s=0 the same highest compact Casimir cannot
reappear orthogonally to the original lowest K-type in the
Lie-generated module. RUN71 section 3's missing supplier
is now human-derived, conditional on the retained native
Parthasarathy-type inequality and invariant sign adjoints.
No assumption of irreducibility or a pre-existing discrete
series is used. The source's casimir_bound itself is not
replaced by the scalar gap certificates below.

## 4. Replace local inverse-chart construction by explicit LU

Source Holomorphic/HolomorphicExtension.lean
2cfbf29e001ad5906736dcadbecc9a3cde9b538d:
eventually_exists_torus_entire_factor and circle_mean_weightMinors.
Order indices by increasing injective integer o, within each
required block. Any block diagonal matrix X sufficiently
near I admits X=L B with L lower unitriangular in this order,
B upper triangular invertible. This follows by ordinary
Gaussian elimination without pivoting: the successive
leading principal minors at I equal one and remain nonzero
near I; elimination uses divisions by these nonzero pivots.
Both factors depend continuously on X and equal I at I.
For |s|=1 set d(s)=diag(s^{o_i}) and
    A(s)=I+sum_{o_i>o_j} L_ij s^{o_i-o_j} E_ij.
Then d(s)X=A(s)d(s)B. A is entire, A(0)=I, and all A(s),
|s|<=1, are uniformly near I as X tends to I: entries are
bounded by |L_ij| off diagonal. For any neighborhood P of I
this puts the entire disc in P. For dominant weight w, the
upper-triangular and opposite-unitriangular minor rules give
m_w(X)=diagChar(w)(B); alternatively each relevant leading
minor of L B is the product of the corresponding B diagonals,
including the determinant factors for negative weights.
This proves the native local factorization without the real
inverse function chart at this consumer only; other chart
consumers remain untouched.

For the native IsHolOfWeight F of weights u_tau with analytic
extension F', use the above factor separately for each g_tau
near I in the allowed blocks. On |s|=1,
    F(d(s)g_tau) s^{-sum_tau o dot u_tau} q(s)
      = [prod_tau m_{u_tau}(g_tau)] F'(A_tau(s)) q(s).
All denominators are nonzero in the chosen uniform neighborhood.
The right side is holomorphic on the closed disc. Its circle
mean is its value at 0, giving exactly
    q(0) prod_tau m_{u_tau}(g_tau) F(1).
For arbitrary allowed g_tau, choose the native analytic paths
from I to g_tau (one exponential for compact, two for full
U(p,q)). Both sides are real analytic along these paths:
the integrands are jointly locally analytic in the path
parameter with a compact circle index, so the native
IsAnalyticFamily.analyticAt_integral applies. By the real
analytic identity theorem extend the near-I equality to
the entire connected real parameter line. This retains
IsHolOfWeight's exact extension hypothesis; no holomorphic
extension of arbitrary continuous coefficients is presumed.

For compact k and one weight w take q=1. Right Borel
equivariance gives m_w(d(s)k)? We use the circle mean on F
and the companion F=m_w with left multiplication by d(s).
Principal minors under LEFT diagonal multiplication transform
exactly by s^{o dot w}, so conjugate m_w(d(s)k) contributes
s^{-o dot w}. Haar invariance under left multiplication by
d(s) and circle mean prove
    integral_K F(k) conj(m_w(k)) = c_w F(1),
c_w=integral_K |m_w|^2>0 by continuity and m_w(1)=1.
This is the actual IsHolOfWeight.integral_mul_conj_weightMinors,
hence HCParam.IsKHighest.integral_conj_weightMinors_smul when
the native isHolOfWeight_coeffMap supplies the extension.
Its derivation of that extension (not just a formal Taylor
series) is retained.

## 5. Flensted–Jensen projection: one circle kills the off-cone terms

Source FlenstedJensen/KTypeProjection.lean
f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a;
FlenstedJensenInvariance.lean 46f4a4931a139742e73fc43f519da651ed680233;
PsiBasic.lean d888fafb9db9b1a5e78aa2551a1480f0cf057d20.
Keep native HasGap, hnu compact dominant for -l, and
nu=Lambda or nu-Lambda outside rootCone. Choose integral o
reversing the l order with N=o dot(nu-Lambda)>0 in the
off-cone case, by the DEFINITION of rootCone; in the equal
case choose o=-l and N=0. Thus o is injective, nu and Lambda
are compact dominant for o, and -mu=-paramAddRho(l) is fully
dominant for -o, using paramAddRho_lt_iff. The compact
coefficient weight norm c=c_Lambda is positive.

Fix x in G, let a=blockDiagPart x, Z=a^-1 x accretive.
Write S(Y)j=j^-1 Y j for compact j. For b sufficiently near I,
S(Z)j S(b)k stays accretive uniformly in j,k, by compactness.
The source splitting-independence theorem allows us to
use a h as the block diagonal part when expanding psi(x h b),
h in K; it need not be the actual block diagonal part.
After Haar change j=h k, the integral of conj(m_nu(h)) psi(x h b)
equals EXACTLY
    (1/c) integral_{j,k in K} m_nu(k j^-1) G(j,k,S(b)k),
where
    G(j,k,Y)=m_Lambda(a j) conj(m_Lambda(k))
                  / m_{-mu}(S(Z)j Y).
The equality uses conj(m_nu(h))=m_nu(h^-1) on K and the
correct order S(Z)j S(b)k. All integrands continuous on
compact K^2 here; Fubini justified before circle averaging.

Apply right translation k -> k d(s), |s|=1. Factor X=S(b)k
by section 4 for order -o and one full block. We obtain
    d(s)^-1 X d(s)=A_k(s) d(s)^-1 B_k d(s),
A_k(0)=I and A_k(s) uniformly near I. The triangular
minor rule for -mu removes the last conjugated Borel factor
with character diagChar(-mu)(B_k), unchanged by conjugation.
The numerator conj(m_Lambda(k d(s))) supplies
s^{-o dot Lambda}. Consequently the translated integrand
is
    m_nu(k d(s) j^-1) s^{-o dot nu}
        [s^N G(j,k,A_k(s))/diagChar(-mu)(B_k)].
The bracket is holomorphic on the closed disc because all
denominator matrices S(Z)j A_k(s) remain accretive and
B_k invertible. Apply section 4 circle mean with F(h)=
m_nu(k h), g=j^-1, this bracket as q, and order o.
Its exact value is
    m_nu(k) m_nu(j^-1) q(0).
If N>0 it is zero. No cancellations across different Haar
points or bound on high K-types is needed.
If N=0 and nu=Lambda, the triangular factor identity gives
diagChar(-mu)(B_k)=m_{-mu}(S(b)k). The two compact integrals
separate as
    integral_j m_Lambda(a j) conj(m_Lambda(j))/m_{-mu}(S(Z)j)
       = c psi(x),
    integral_k |m_Lambda(k)|^2/m_{-mu}(S(b)k)
       = c psi(b).
The second uses the native splitting theorem with block
diagonal a=I and b accretive near I. Restoring the prefactor
1/c yields c psi(x)psi(b). Analytic continuation in b along
the native two-exponential path extends either equality from
near I to every b, using analyticAt_dsCoeff and compact
parameter integration. This proves the actual projection
identity including its normalization, and supplies RUN71's
off-cone consumer. Remaining independent inputs include
splitting-independence flenstedJensen_eq_of_accretive,
the analytic family theorem, weight-minor equivariance,
and highest coefficient holomorphic extension. We do not
cite the existence/classification of the very discrete series
being constructed as a substitute.

## Frontier and independent evidence

Source-visible root chain (not elaborated DAG):
star_inequality -> C integral_forms_long -> comparison/Hecke
forms -> MemberOrthogonality -> half edge -> local theta
generation -> partner rigidity and off-cone projector.
RUN72 supplies finite filtration, compact spectral separation,
torus factor, circle mean, and Flensted–Jensen projection at
the actual native consumers. Candidate local replacement:
explicit LU replaces inverse chart only in torus factor;
word-energy cancellation reconstructs rather than deletes
the native spectral recursion. Original and reduced dependency
records retained; no global elimination or proof of RH.
Remaining leaves: native Casimir inequality on highest weights
(casimir_bound), accretive splitting-invariance and its
differentiation, isHolOfWeight_coeffMap, normalized L2
realization, actual oscillator and global period callers.
The older formal source pin and original-pinned axiom evidence
are not modified.

Native lean/lake absent on local PATH; rh_scan, rh_prune,
rh_reduce, rh_auto and rh_auto_frontier not run on compact pin.
Prepared scalar certificates and native declaration probes below,
not compiled. Read actual CI output
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
state branch blob 23de197bd48f404ca2074c69676de289c4f7934e,
run 45799225653: 10 native named checks and 4 scalar checks,
all_requested_checks_ok=true, standard three axioms only,
full_RH_replay=false. The checked native modules were
RootsOfUnityPoints, ModuleIndex, Heights, NOT these declarations.
No new PASS, no new kernel verification, no full proof.

RESUME HERE: derive the retained exact accretive splitting-invariance
flenstedJensen_eq_of_accretive (FlenstedJensenInvariance),
using its infinitesimal Borel-equivariance and compact Haar
derivative cancellation; simultaneously audit the CasimirBound
casimir_bound inequality at the very first-step gap consumer.
Then connect the now reconstructed projection identity to
SchurOrthogonality.toL2_spec and the compact highest-coefficient
extension. Submit RUN72 probes and scalar checks together with
RUN69–71 in the existing compact runner, resources permitting.
HANDOFF TO integration/editor, independent audit, kernel runner.
-/

namespace RHDependencyRun72

theorem opposite_gap (n d : ℝ) (hn : 1 ≤ n) (hgap : 1000*n^3 ≤ |d|)
    (hbound : 0 ≤ n^3+2+d) : 1000*n^3 ≤ d := by
  have hn3 : 1 ≤ n^3 := by
    nlinarith [mul_nonneg (sq_nonneg n) (sub_nonneg.mpr hn),
      sq_nonneg (n-1)]
  by_cases hd : 0 ≤ d
  · rwa [abs_of_nonneg hd] at hgap
  · rw [abs_of_neg (lt_of_not_ge hd)] at hgap
    linarith

theorem compact_gap (n d r : ℝ) (hn : 1 ≤ n) (hd : 1000*n^3 ≤ d)
    (hr : -2*n ≤ r) : 4*n+2 ≤ d+r+2 := by
  have h : n ≤ n^3 := by
    nlinarith [mul_nonneg (show 0 ≤ n by linarith) (sub_nonneg.mpr
      (show 1 ≤ n^2 by nlinarith [sq_nonneg (n-1)]))]
  linarith

theorem energy_step (k a t b cross : ℝ)
    (h : k*a ≤ t-b) (hc : 2*a ≤ cross) :
    (k+2)*a ≤ t-b+cross := by nlinarith

theorem eigen_exclusion (k s t theta a b : ℝ)
    (hs : 0 ≤ s) (ht : s < t) (ha : 0 < a) (hb : 0 ≤ b)
    (hθ : theta ≤ k+s) (henergy : (k+2*t)*a ≤ theta*a-b) : False := by
  have h : theta < k+2*t := by linarith
  have := mul_lt_mul_of_pos_right h ha
  linarith

end RHDependencyRun72

#check HCParam.IsKHighest.finite_filtration
#check HCParam.IsKHighest.casimir_bound
#check mem_orthogonal_filtration_of_casimirK
#check IsKInvariantForm.mul_E
#check IsKInvariantForm.sum_inner_casimirK
#check eventually_exists_torus_entire_factor
#check IsHolOfWeight.circle_mean_weightMinors
#check IsHolOfWeight.integral_mul_conj_weightMinors
#check HCParam.IsKHighest.integral_conj_weightMinors_smul
#check integral_conj_weightMinors_mul_dsCoeff
#print axioms RHDependencyRun72.opposite_gap
#print axioms RHDependencyRun72.compact_gap
#print axioms RHDependencyRun72.energy_step
#print axioms RHDependencyRun72.eigen_exclusion
