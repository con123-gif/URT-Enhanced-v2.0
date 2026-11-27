import Lib.PadicHodge.WachKisin.PeriodMatrixBasis
import Mathlib.Tactic

/-!
RUN76 — integral basis contraction at the actual C1 interface, 27 Nov 2026.
Status: human source-matched derivation with primitive chart/period-ring
premises retained; Lean certificates PREPARED, not replayed or audited.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission 4aed2e68e6bd724826bc1e669c07a48e0b95eddd; live spine
45686f0eb1283d4f0025e4eb1def8dcad03bf7ef; ledger
ca6d4c0e37e0c4a7c33a050ee0e6ee4d87da5288, C1. Read AGENTS,
continuity, protocol, queue, expansion and current peer commit subjects
(head f93cf29c; peers e5803774, dd97e28a address B2, not C1).
RUN75 2f004f32 / 77bcf6f3654a5f0563f3f8cbb87a0aa8ac153e3f
is the consumer; do not duplicate its determinant argument.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed
7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc, not adopted.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Paths relative to grh-compact/src:
 Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean cd91a46eb5624b88af20a96d0450bdf059994b93
 (exists_basis, lines 91-153; exists_p_pow_mul_mem_amaxImage).
 Lib/PadicHodge/WachKisin/ChartScalars.lean 8dc59315a323816ecb0eedf46b5aae0a8c714fc5
 Lib/PadicHodge/PeriodRings/BdR.lean 326d41233ac7638a50194f3ade22350c9b038ad5
 (exists_Ainf_eq_of_contraction).
 Lib/PadicHodge/PeriodRings/BdRPlus.lean f828ee87f4914572d457b364b38c6c6b0fbc8372
 Lib/PadicHodge/PeriodRings/AmaxStructure.lean 1be9736d2c48bece6dd038c72d14b6f807cff9df
 Lib/PadicHodge/PeriodRings/ThetaKernel.lean ab5766dd9ea95412ad15247cef74b9b701250797
 Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean cf83fda104fb44177d374d62f06b4d6e68e3db08

1. Exact contraction, rather than estimating each coefficient separately.
Write A=Ainf, M=Amax, B=BPlus, phi=Frobenius, X=xi/p in M.
Suppress injective inclusions. Retain the native facts: phi(A) is A,
phi(M) is contained in M, phi fixes p, phi(tau)=xi*tau;
xi is prime in A and kernel(theta:B->Cp)=(xi), with theta on
A having kernel (xi). In particular xi^h divisibility in B of an
element in A descends to A by h iterations of the kernel identity
and cancellation. Retain completeness of A for I=(p,xi),
p-adic separation of M and both directions of I^m A = A intersect p^m M
(AmaxStructure). Also tau divides xi-p.

Let V be ANY subset of M inside B, and for each v0 in V suppose
xi^h v0=u phi(w0) for some w0 in V, with fixed u in A.
For every k>=0 prove for ALL v0 in V
    p^(h+1) v0 = a_k + tau^(h+1) p^k z_k,  a_k in A, z_k in M.
At k=0 use Amax.exists_p_pow_mul_eq_add with nu=tau, h+1.
For the step apply the previous k to the chosen w0, not to v0:
p^(h+1) w0=c+tau^(h+1)p^k z.
Then
    xi^h p^(h+1) v0
       = u phi(c) + u xi^(h+1) tau^(h+1)p^k phi(z).
Hence xi^h divides u phi(c) in B, and so in A. Write
u phi(c)=xi^h a. Cancel xi^h in B BEFORE estimating:
    p^(h+1) v0 = a + tau^(h+1) p^(k+1) u X phi(z).
This is the entire contraction mechanism, one additional p for each
iteration. For fixed v0, differences a_k-a_j lie in I^min(k,j)
by the pullback equality. Completeness gives a in A, and p-adic
separation in M gives a=p^(h+1)v0. No need for V to be a module,
closed, finite, or for the choice of w0 to be unique. The same
exponent applies to every element of V, irrespective of its size.
The native primitive ring facts are not discharged by this argument.

2. Verify the contraction premise on the actual set in exists_basis.
Use U W=(E tau)^h I, phi(U)=v U F with F' F=I, F entries in S_B,
v unit in A, xi=epsilon E, and U injective on B^d. The letters
v (unit) and w (vector) below are distinct from the scalar in section 1.
Let U y=E^h x, x in A^d; U fhat(y)=E^h w, where f:A->A is
S-linear, fhat its native extension. Write psi=phi^-1 on A.
Use the native denominator lemmas, choosing n,k once per U,W,h:
    y0 in M^d, W y0=tau^h z0 => p^n z0 in M^d;
    y0 in M^d, U y0=E^h z0 => p^k z0 in M^d.
They follow by clearing the finitely many denominators of W or U
and applying amaxImage.p_pow_mul_mem_of_dvd_mu with tau or E.
Since W x=tau^h y, p^n y is in M^d. The extension preserves M,
so p^n fhat(y) is in M^d and p^(n+k) w is in M^d.
These n,k may depend on U,W (and hence on rank or lattice);
do NOT claim uniformity across representations here.

Construct t=W psi(v E^h x). Then U t=(E tau)^h psi(v E^h x).
Applying phi and cancelling v and U gives
    F phi(t) = phi(E tau)^h y.
Left-multiply by F'. Since phi(tau)=mu, mu^h divides every phi(t)_i.
The native all-positive-Frobenius theta kernel divisibility criterion
(BPlus.dvd_of_thetaBPlus_frobEnd_eq_zero, tau_dvd_of_theta_frobEnd)
descends this to tau^h | t_i, by induction on h and cancellation:
if mu divides phi(t_i), theta(phi^j t_i)=0 for every j>=1;
after t_i=tau r, cancel mu in phi(t_i). Thus t=tau^h y' with
    U y'=E^h psi(v E^h x),
    F phi(y')=phi(E)^h y.
These are exact, no surjectivity of phi on B asserted.
Put f'=psi o f o phi on A. It is S-linear since phi(S) subset S.
The two maps phi o f'hat and fhat o phi agree on A and preserve M;
their difference is zero on B by Chart.eq_zero_of_ainfToBPlus.
By hat_stable applied to f', choose w' with U f'hat(y')=E^h w'.
Apply fhat to the preceding F equation, using S_B-linearity of
fhat and phi(E) in S_B. Applying phi to the equation for w'
and cancelling phi(E)^h yields
    phi(w') = v U fhat(y) = v E^h w.
Therefore
    xi^h p^(n+k) w_i = epsilon^h v^-1 phi(p^(n+k) w'_i).
For V={p^(n+k) w_i from all such x,y,f,w,i}, section 1 now
gives p^N w_i in A, N=h+1+n+k, for all coordinate choices.
This is the actual native contraction input, not an assumed lattice
saturation lemma. No rank accumulation across individual coordinates.

Candidate premise weakening ONLY at this consumer:
one needs hat_stable for the orbit f_(j,r)=psi^r lambda_j phi^r,
where lambda_j:A->S->A are the adic basis coordinates, r>=0.
The set is closed under f->f' and includes r=0, which suffices for
the approximation below. Retain the extension construction and
S_B-linearity for all the maps involved. All other period-matrix
fields remain. No proof that checking this orbit is cheaper in
exists_isPeriodMatrix, which establishes hat_stable for all f;
no native dependency pruned globally.

3. The actual hN and hA outputs, and why no final denominator survives.
Let P={x in A^d | U y=E^h x for y in S_B^d}. It is an S-module,
separated for the chart max ideal (p,z). If z x=p x' with x,x' in P,
primality of p and p not dividing z give x=p t in A^d.
The associated y can be divided by p in S_B, so t in P.
For any S-linearly independent x_j in P with chosen y_j, an A-linear
relation sum a_j x_j=0 implies sum a_j y_j=0 by injectivity of U.
Apply each extended coordinate, which is S_B-linear, and multiply
by U; cancellation of E^h gives sum lambda_i(a_j)x_j=0.
Independence over S gives all lambda_i(a_j)=0, hence all a_j=0
by native adic-coordinate separation. Thus every S-independent
family is A-independent in A^d, rank_S(P)<=d. Native
free_finite_of_rank_le gives a finite free S-basis. For d>0 the
rank-zero case can be excluded after the hA argument below using
x=tau^h e_i; alternatively pad the basis with zero columns to get
d columns Q, chosen preimages Z, UZ=E^h Q. This gives hN:
x=Q s for any x in P. No determinant claim needed yet.

For ANY x in A^d and y in B^d with Uy=E^h x, apply section 2 to
the actual coordinate extensions. Each p^N w_j lies in A^d, and
p^N lambdaHat_j(y) lies in S_B^d. Thus hN gives
    Q s_j=p^N w_j, s_j in S^d.
Fix arbitrary m>=0. The native simultaneous finite-coordinate
approximation gives a finite G with y-sum_G b_j lambdaHat_j(y)
in p^(m+k) M^d. Set D=p^N x-sum_G b_j Q s_j in A^d.
Apply U to the scaled approximation and use its equation:
    U[p^(N-m-k)(y-sum_G b_j lambdaHat_j(y))]
       = E^h p^(-m-k) D .
The left input belongs to M^d, even if N-m-k is negative (p is
a unit in B). The uniform-in-input k bound implies p^(-m)D in M^d.
Consequently D lies in I^m A^d by the exact native pullback.
If l Q=delta*g, with p not dividing delta in A, then
    l dot p^N x - delta*(g dot sum_G b_j s_j) in I^m A.
The same l,delta,g,x,y,N are fixed BEFORE all m.
By native dvd_of_approx, delta divides l dot p^N x.
Cancel the p^N factor using primality of p (not of delta):
if p a=delta b, then p|b since p does not divide delta; cancel
p in the domain and iterate. We obtain precisely
    delta | l dot x .
No p-power survives in this actual hA output, even though N
depends on the input period matrix. No additional rank hypothesis
or assumption of the conclusion.

To establish det Q != 0, a hypothetical nonzero l with lQ=0
would give hA with delta=z^m for ALL m and x=tau^h e_i,
y=W e_i (since U W=(E tau)^h I). Thus z^m|tau^h l_i for every m.
Native z-adic separation in B and tau!=0 give every l_i=0,
contradiction. For d=0 determinant=1. This closes the basis
argument at the human level under the retained period/chart
foundations. Inserting hN,hA into RUN75 gives QL=tau^h I
with no rank-dependent exponent. The final frame bound does
not depend on N, which is only an approximation device.

4. Scope and native status.
Original local graph: period matrix + chart/adic approximation +
contraction -> exists_basis -> exists_frame -> frame_theorem /
uniform_period_bound. Proposed human graph: exact scalar contraction
-> Frobenius orbit of coordinates -> finite free P and hN ->
adic pullback and p cancellation -> hA and det Q!=0 -> RUN75.
No native graph/axiom evidence edited. Context key includes pin,
chart, U,W,h,v, S, actual consumer and coordinate orbit. No
inference of uniform CountI, weighted-prime bound or RH.
The chart extensions and complete adic basis, period matrix
construction (notably hat_stable), native theta-divisor laws,
Amax denominator and pullback lemmas, and Ax/tilt approximation
in RUN75 remain explicit dependencies. Next connect the actual
CrystallinePeriodMatrix.exists_isPeriodMatrix hat_stable to the
finite Hodge frame and chart coefficient divisor preservation.

Executed locally with Python/SymPy, exactly two symbolic identities:
  simplify((u*xi*tau**(h+1)*p**k*z -
      tau**(h+1)*p**(k+1)*u*X*z).subs(xi,p*X)) == 0
  simplify(eps**h/v*(v*E**h*W)-(eps*E)**h*W) == 0
Both returned true for symbolic nonnegative integers h,k.
These do not validate the actual period-ring input laws.
Local lean/lake absent; native certificates below not run.
No native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier
and no new CI dispatch. Read actual current receipt
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
on cathedral-research-state, blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six prior named checks with classical axioms, module_1_build timeout
124 at 2700.11s, full_RH_replay=false, all_requested_checks_ok=false.
Not validation of this replacement.

RESUME HERE: audit sections 1-3 and RUN75 together, then derive the
actual hat_stable supplier in CrystallinePeriodMatrix.exists_isPeriodMatrix
from IsChartOf.dvd_extendToBPlus and the adjugate Hodge frame;
retain exact Frobenius and local-to-global hypotheses. Send the small
C1 delta to the integration/editor ledger, not another full proof draft.
HANDOFF TO Galois, integration, editor, independent audit, native replay.
-/

namespace RHGaloisRun76

theorem contraction_error_step {R : Type*} [CommRing R]
    (xi p X u t a z : R) (k : ℕ) (hx : xi = p*X) :
    a+u*xi*t*p^k*z = a+t*p^(k+1)*u*X*z := by
  rw [hx, pow_succ]
  ring

theorem frobenius_coefficient_cancel {R : Type*} [CommRing R]
    (eps E xi v vinv w : R) (h : ℕ)
    (hx : xi=eps*E) (hv : vinv*v=1) :
    eps^h*vinv*(v*E^h*w)=xi^h*w := by
  rw [hx, mul_pow]
  calc
    eps^h*vinv*(v*E^h*w) = eps^h*(vinv*v)*E^h*w := by ring
    _ = eps^h*E^h*w := by rw [hv, mul_one]

#check Lift.Chart.IsPeriodMatrix.exists_basis
#check Lift.Chart.extendToBPlus
#check Lift.Chart.eventually_approx_sum_extendedCoord
#print axioms contraction_error_step
#print axioms frobenius_coefficient_cancel

end RHGaloisRun76
