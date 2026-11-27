import New.Lift.CokernelKillers

/-!
RUN72 — scalar monomial and E-power descent, actual level-one lift ideal.
27 Nov 2026. Human source-matched derivations; scalar certificates prepared,
not kernel-executed. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, completion-first.
Prior own 15bf637f; latest peer 392d881d and 30a40eef explicitly request this
supplier; literature 30859704 already covers cut safety, not repeated.
Latest branch commit list observed at 6c46fb6e; no competing scalar result
in the latest 20 commit titles. No URT or imported RH conclusion.

Source ledger, paths relative to grh-compact/src:
Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean cd91a46eb5624b88af20a96d0450bdf059994b93
  18–30 lifting_the_exponent, 34–46 associated_E_mul_tau_mu and
  Chart.exists_tau_mul_E_eq_mul_epsTilt_pow_sub.
Lib/PadicHodge/WachKisin/HodgeFrame.lean 158f4df424f222f593b6f2baee57a294ab221f03
  175–200 xi_mem_span_p_z, E, associated_E_xi; 263–294
  dvd_smul_sub_of_fixesLambda and weierstrass_division.
Lib/PadicHodge/WachKisin/KummerChart.lean 8c3d7ca027e653f9a125e0cec6fd477c5ce6f791
  127–143 exists_derivative_dvd_p_pow, 168–183 zTau_dvd_phi_pow_smul,
  not_frobE_dvd_zTau, zTau_mul_E_dvd_smul_sub.
Lib/PadicHodge/WachKisin/KummerChartExists.lean f90f19a17f77be0aff920a5db18ae389d5898561
  151–165 exists_smul_z, differentExp, IsUnramified.
Lib/PadicHodge/PeriodRings/ThetaKernel.lean ab5766dd9ea95412ad15247cef74b9b701250797
  150–164 theta kernel; 184–201 mu_dvd_of_theta_frobEnd, tau variant.
New/Lift/ExponentLattices.lean 0549f09387b53f33790c7af7fc923fa71ca347dd
  22–64 cost, exists_depth_step; 176–186 smul_sub_mem_zTau_kisinLocAinf.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487
  132–174 common derivative, level-one to level-zero, E-power descent.

1. Exact integral scalar monomial supplier, avoiding division by a zero
divisor in a quotient.
Let A=A_inf, q=[epsilon], mu=q-1=xi*tau, E*tau associated to mu.
Use the native xi=p b+z s and p>=2. In the local quotient
R=A/(z mu) we have
  mu^p=mu*xi^(p-1)*tau^(p-1)
      =p*mu*tau*(b*xi^(p-2)*tau^(p-2)).
This is an equality in R, not cancellation of mu there.
For any y in a local ring of residue characteristic p with v in the
maximal ideal, y divisible by v, and y^p=p*y*v*h, binomial expansion
gives
  (1+y)^p-1=p*y*(1+v H)
for some H: middle binomial coefficients are multiples of p, and
each middle term after the common p*y has at least one factor y.
The last term is handled by the GIVEN equality, not by cancelling y.
The factor 1+v H is a unit. If y'=p*y*U, then y' is divisible by v and
(y')^p=p*y'*v*(p^(p-1)*U^(p-1)*h); hence the same argument iterates.
Apply with y=mu, v=tau, in R. For N=p^k m>0 with p not dividing m,
q^(p^k)-1=p^k*mu*U_k for a unit U_k; the geometric sum of m powers
is a unit because q=1 mod the maximal ideal. Therefore
q^N-1 divides p^k mu in R. This proof uses only local units and
the exact binomial factor, no cancellation in R.
Lift the divisibility to A:
  p^k mu = alpha0*(q^N-1)+z*mu*h.
As mu=u*tau*E for an A-unit u, rearrange with beta=-h,
alpha=u^(-1)*alpha0 to get
  tau*E*(p^k+beta*z)=alpha*(q^N-1).
This is the precise Chart.exists_tau_mul_E_eq_mul_epsTilt_pow_sub
statement. A is local by its Witt constant-coefficient criterion;
z and tau are nonunits (chart and period facts), so R is local
with residue characteristic p. All N>0, including p=2.
For the actual g with gz=qz and f=p^c z^N, multiply by p^c z^N:
  (z*tau*E)*(p^(c+k)*z^(N-1)+beta*f)=alpha*(gf-f).
RUN71 common derivative now gives the monomial step at the same
r, letter, and level 1. No new factor. Iteration gives precisely
the already reconstructed factorial cost and level-zero transport.

2. Chart congruence and prime-to-E division for the actual scalar ring S.
Write z=[z_flat], let g in the chart group fixing Lambda and theta(z).
The tilted ratio r=g(z_flat)/z_flat is a unit of O_flat (the tilt
valuation is Galois invariant); its untilt equals 1 by multiplicativity
and theta(z) nonzero. Then theta(phi^j([r]-1))=1^(p^j)-1=0 for all
j>=0. The native mu_dvd_of_theta_frobEnd gives mu | [r]-1 in A.
Consequently z*mu | gz-z. Since mu is associated to tau*E,
delta*E | gz-z with delta=z*tau. For s in S=Lambda[[z]],
each monomial difference (gz)^j-z^j is divisible by gz-z and the
common quotient is the geometric sum. The series of these quotients
converges z-adically (gz=z times an A-unit, its j-th term is in
z^(j-1)A); use the native z-adic completeness and series-map
continuity in dvd_smul_sub_of_fixesLambda. Thus delta*E | gs-s.
This is an integral assertion in A, not only in a period field.
Also theta(phi^-a(z)) is a nonzero compatible root of theta(z),
and theta(phi^-a(tau)) is a primitive p^(a+1)-th root minus 1,
nonzero for every a>=0. Their product is nonzero; the exact
frobE_dvd_iff thus gives E_a not dividing delta. This establishes
the scalar congruence and no Hodge-depth cost of dividing delta;
it does NOT establish the stronger congruence in the bicommutant
S_B or the integral frame divisibility test for lattice vectors.

3. Positive level-zero depth step, the exact consumer of E-power descent.
We need only a=0 in CokernelKillers.162–174 (positive N).
Let F(X) be the monic polynomial X^e-R(X) obtained by Weierstrass
division of z^e by E, deg R<e. Then F(z)=E G, G in S.
Normalize v_p(p)=1. Since E=z^e times a chart unit plus p,
v_p(theta z)=1/e. Each nonzero coefficient of F' is in Lambda,
so the valuations of its distinct evaluated monomials are integers
plus j/e, 0<=j<e. No two are equal; the least term therefore
determines the valuation of theta(F'(z)). The leading term gives
  v_p(theta F'(z)) <= v_p(e)+(e-1)/e <= d,
with d=0 when e=1 (F'=1), and d=v_p(e)+1 otherwise.
Thus theta(F'(z)) nonzero and divides p^d in O_C.
This is a direct human argument for the native polynomial supplier,
retaining actual Weierstrass division and chart coefficient embedding.

Choose the same actual g with gz=qz, and gE=omega E for an A-unit
omega. This association follows from the theta kernel and Galois
equivariance as in associated_smul_E. By section 2,
omega-1=delta h in A (cancel E in the DOMAIN A).
Use polynomial Taylor expansion before taking valuations:
  gF(z)-F(z)=z*mu*(F'(z)+z*mu*R1)
             =E*(omega*gG-G).
Since mu=u*E*tau, cancel E in A, then apply theta, noting
theta(gG)=theta(G), theta(E)=0. Exactly
  theta(omega-1)*theta(G)=theta(u)*theta(delta)*theta(F'(z)).
All factors on the right are nonzero and theta(u) a unit.
Consequently v_p(theta(omega)-1) <= v_p(theta(delta))+d.
Also by the integral delta divisibility it is at least
v_p(theta(delta))=1/e+1/(p-1)>1/(p-1), using the primitive
p-th root valuation for theta(tau). For any such x=1+y in O_C,
the binomial expansion gives v_p(x^p-1)=v_p(y)+1:
the p*y term is uniquely minimal, since the last y^p has
valuation p*v_p(y)>1+v_p(y); middle terms have larger valuation.
For m coprime to p, v_p(x^m-1)=v_p(y), by the same first-term
argument. Iterating gives for every positive N:
  v_p(theta(omega^N-1))=v_p(theta(omega-1))+v_p(N).
Let X=(omega^N-1)/delta in A, using geometric factorization
and omega-1=delta*h. Hence theta(X) is nonzero and
v_p(theta X) <= d+v_p(N). In O_C choose u0 with
u0*theta(X)=p^(d+v_p(N)); lift u0 to upsilon in A via theta
surjectivity. Then
  omega^N-1=delta*X, upsilon*X=p^(d+v_p(N))+E*b
for b in A (theta kernel E). These are EXACT native positive,
a=0 depth-step premises. No claim for general a>0 or N<0;
those are needed at other callers and remain in the graph.

4. Remove the entire E-power, preserving the native budget.
For N>=1, f=p^c z^a E^N, put F0=p^c z^a E^(N-1),
P=p^(d+v_p(N)), so f=E F0. By section 2 write
gz=z*(1+tau*E*v); by the geometric sum let
(1+tau*E*v)^a=1+tau*E*v*t (valid for a=0 with t=0).
Set w=omega^N, then gf=f*(1+tau*E*v*t)*w.
With X,upsilon,b from section 3 the exact pre-valuation identity is
  z*upsilon*(gf-f)
   = delta*E*[z*P*F0+(z*b+upsilon*v*t*w)*f].
Thus the native derivative lemma applied with
alpha=z*upsilon and beta=z*b+upsilon*v*t*w gives
p^(c+d+v_p(N))*z^(a+1)*E^(N-1) in the SAME J_1(r,i).
This is the actual CokernelKillers.172 identity, not a comparison
between different ideals or moduli. Descend N to 0, each step
adds d+v_p(N) to the p-exponent and 1 to the z-exponent.
The total charge is dn+v_p(n!), and multiplying the final monomial
by remaining nonnegative p and z powers gives the exact source:
  p^c z^a E^n in J_1(r,i), b>=c+dn+v_p(n!), kappa>=a+n
  => p^b z^kappa in J_1(r,i).
For n=0 the step cost is zero. This removes the previously open
scalar E-power argument conditional on RUN71 derivative and the
explicit native ring/chart foundations, without altering constants.

Source-visible local graph (not elaborated):
original: CokernelKillers two descents -> scalar LTE / depth_step
(positive a=0), common derivative -> chart/frame/value field.
reduced: quotient binomial unit factor -> monomial derivative;
Weierstrass polynomial + distinct valuation + scalar congruence
-> positive depth at a=0 -> exact E derivative -> factorial cost.
Retain general depth_step (all a and signed n) for HodgeExpansion,
bicommutant congruence, tau*z^m cancellation across E powers,
frame/adic-basis and actual local/global row suppliers. No global
dependency deletion, no changes to original/reduced graph files or
axiom ledger. Context keys pin, chart, chosen g, a=0, N>0, r, i,
and source level. General depth step must not be pruned globally.
No external theorem assumed beyond explicitly retained source
foundations; ordinary valuation and binomial arguments supplied.
Independent audit requested, especially source coefficient embeddings
and the z-adic series continuity. No native Lean/lake/elan executable
in local sandbox. Existing compact replay state artifact
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804 actually retrieved:
six existing checks with only propext, Classical.choice, Quot.sound;
module_1_build timeout 124, 2700.11s; all_requested_checks_ok=false,
full_RH_replay=false. Not validation of this certificate; no fresh
native pass. No old-pin engine pass attributed to compact.
No new compute job dispatched; hand off to existing shared runner.

RESUME HERE: use actual GaloisOnFrames and frame theorem consumer
to reconstruct bicommutant tau*z congruence and integral cancellation
through E powers; then general signed n, a>0 depth supplier if needed
by the exact HodgeExpansion caller. Do not repeat scalar level-zero
depth, E-power descent, quotient LTE or common correction. Coordinate
with editor/audit on final Ribet rowBudget and balanced-row suppliers.
HANDOFF TO integration/editor, Galois arithmetic, literature, audit
and compact native replay. Human RH reconstruction incomplete.
-/

namespace RHGaloisRun72

theorem monomial_derivative_identity {R : Type*} [CommRing R]
    (z tau E P beta alpha q F : R)
    (h : tau*E*(P+beta*z)=alpha*(q-1)) :
    (z*tau*E)*(F*P+beta*(F*z)) = alpha*(F*z*q-F*z) := by
  calc
    _ = F*z*(tau*E*(P+beta*z)) := by ring
    _ = F*z*(alpha*(q-1)) := by rw [h]
    _ = _ := by ring

theorem E_descent_identity {R : Type*} [CommRing R]
    (z tau E P b upsilon v t w X F : R)
    (hw : w-1=z*tau*X) (hX : upsilon*X=P+E*b) :
    z*upsilon*(E*F*(1+tau*E*v*t)*w-E*F) =
    (z*tau*E)*(z*P*F+(z*b+upsilon*v*t*w)*(E*F)) := by
  calc
    _ = z*upsilon*E*F*((w-1)+tau*E*v*t*w) := by ring
    _ = z*upsilon*E*F*(z*tau*X+tau*E*v*t*w) := by rw [hw]
    _ = z*tau*E*F*(z*(upsilon*X)+upsilon*E*v*t*w) := by ring
    _ = z*tau*E*F*(z*(P+E*b)+upsilon*E*v*t*w) := by rw [hX]
    _ = _ := by ring

#print axioms monomial_derivative_identity
#print axioms E_descent_identity
#check Lift.Chart.exists_tau_mul_E_eq_mul_epsTilt_pow_sub
#check Lift.KummerChart.exists_derivative_dvd_p_pow
#check Lift.KummerChart.exists_depth_step
#check Lift.KummerChart.PairingSide.mem_liftIdeal_of_mul_E_pow
#check Lift.KummerChart.PairingSide.mem_liftIdeal_zero_of_mem_one
#print axioms Lift.KummerChart.PairingSide.mem_liftIdeal_of_mul_E_pow
#print axioms Lift.KummerChart.PairingSide.mem_liftIdeal_zero_of_mem_one

end RHGaloisRun72
