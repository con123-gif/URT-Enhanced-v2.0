import New.Lift.HodgeExpansion
import Mathlib.Tactic

/-!
RUN73 — full signed depth and integral frame cancellation, 27 Nov 2026.
Human source-matched derivation, scalar Lean certificates prepared, NOT
kernel-replayed. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original source leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005,
Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc re-read; recent upstream
commit search reports 7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc, not adopted.
Current compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
paths relative to grh-compact/src. Mission blob a3a94fad4da3c431c92d3f8ddaf35db013d83209,
latest peer head a4bb5084e; peer 5b49b9b and 19a5089a concern different
Theorem B and class-count suppliers. Prior own RUN72 08451434.
No imported RH conclusion or URT. Actual Theorem C HodgeExpansion/ExponentLattices
consumer context retained, not a fresh elaborated reachability proof.

Source ledger:
Lib/PadicHodge/WachKisin/KummerChartExists.lean f90f19a17f77be0aff920a5db18ae389d5898561
  147–165 actual compatible choice g_l, cost d.
Lib/PadicHodge/WachKisin/KummerChart.lean 8c3d7ca027e653f9a125e0cec6fd477c5ce6f791
  127–143 polynomial derivative; 168–183 delta divides Frobenius,
  prime-to-E_a and chart congruence.
Lib/PadicHodge/WachKisin/ChartScalars.lean 8dc59315a323816ecb0eedf46b5aae0a8c714fc5
  24–29 theta_a kernel; 131–149 coordinate extensions; 192–241
  bicommutant Frobenius, approximations and z cancellation.
Lib/PadicHodge/Comparison/CrystallineLimit.lean e3cf139874cd85a9e5642c277e8b51b9343add9a
  28–53 tau*z^n cancellation and bicommutant congruence.
Lib/PadicHodge/WachGamma/GaloisOnFrames.lean c88531fa544900040d5d504dda3e1d352087c5ba
  14–22 denominator identity; 29–35 stability.
Lib/PadicHodge/WachKisin/FrameTheorem.lean 57d6daa6060f9f00eb27be6525460ba942a73f08
  52–61 frame supplier/divisibility test.
New/Lift/ExponentLattices.lean 0549f09387b53f33790c7af7fc923fa71ca347dd
  22–81 signed and zero depth; 176–186 derivative on localized module.
New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046
  exists_reaches_depth_succ, both signed and zero consumers.

1. Exact all-level signed depth, with the ORIGINAL d+3a budget.
Let A=A_inf, E=E_0, E_a=phi^a E, delta=z*tau, q=[epsilon],
theta_a=theta phi^-a. The native compatible root choice gives
g=g_(p^a) in Gamma' with gz=q^(p^a)z. Put omega=gE/E in A^units,
Omega=phi^a(omega), so gE_a=Omega E_a. Chart congruence and domain
cancellation of E give omega-1 in delta A. Also theta_a(q) has
order p^a (order 1 when a=0); g fixes theta_a(z) and theta_a(Lambda).
Thus g fixes theta_a(S), either by the native Weierstrass remainder
or by dvd_smul_sub_of_fixesLambda. Hence E_a | gs-s for all s in S.

Use the actual monic polynomial F=Z^e-R with deg R<e and
F(z)=E G, theta(F'(z)) dividing p^d (RUN72/source). Write v=v_p
normalized v(p)=1, and v0=v(theta(delta))=1/e+1/(p-1) <= 2.
Since mu=q-1=u E tau, geometric summation gives
(q^(p^a)-1)/E=u*tau*(1+q+...+q^(p^a-1)),
whose theta image is theta(u*tau)*p^a, nonzero. Taylor expansion
of F at z BEFORE valuation, cancellation of E in A, and theta(gG)
=theta(G) give the exact equation
 theta(omega-1)*theta(G)
   = theta(z*u*tau)*p^a*theta(F'(z)).
All right factors nonzero, theta(u) a unit. Therefore
 v0 <= v(theta(omega-1)) <= v0+a+d.
The lower bound follows from omega-1 divisible by delta, and is
strictly above 1/(p-1). Ordinary binomial LTE then gives exactly
 v(theta(omega^n-1))=v(theta(omega-1))+v_p(|n|)
for ALL nonzero signed integers n: for n<0 use
 omega^(-m)-1= -omega^(-m)*(omega^m-1), a unit factor.
No diagonalization or root counting estimate.

The numerator Omega^n-1 is divisible by delta in A by applying
phi^a to omega^n-1 and delta | phi^a(delta). Put X=(Omega^n-1)/delta.
The compatible roots give
 v(theta_a(delta))=v0/p^a,
so theta_a(X) is nonzero and
 v(theta_a X) <= d+v_p(|n|)+a+v0(1-p^(-a))
              <= d+v_p(|n|)+3a.
For a=0 last extra term is exactly 0; a>=1 uses v0<=2.
In O_C choose theta_a(upsilon) with theta_a(upsilon X)=p^cost;
lift by surjectivity of theta_a. Its kernel is (E_a), so
 E_a | upsilon X-p^cost, delta X=Omega^n-1.
This supplies ALL native exists_depth_step premises, with same
chosen g and same coefficient for every vector/form. Retain
the actual root system, chart and period-ring homomorphisms,
valuation on O_C, and polynomial supplier. Not a new proof of
the existence of the native chart itself.

2. Zero depth requires no signed division: exact root-of-unity trace.
Let M=p^(d+3a) and choose g_l for l=0,...,M-1 using the native
Kummer chart, with g_l z=q^l z and coefficient ring fixed.
Let z_a=theta_a(z), eta=theta_a(q), of exact order p^a.
For s in S, reduce mod E_a by Weierstrass to polynomial of degree
<p^a e, with coefficients in Lambda. E_a is stable up to an A-unit
under each g_l (Galois and Frobenius commute), so the reduction
continues to hold after g_l. Each monomial of degree m gives
 sum_l theta_a(g_l z^m)=z_a^m sum_l eta^(lm)
   = M*z_a^m if p^a|m, else 0.
M is a multiple of p^a, including a=0. The surviving terms are
fixed by EVERY g in Gamma' since z_a^(p^a)=theta(z) and theta_a
maps Lambda to itself with coefficient Frobenius permutation.
Thus theta_a((g-1) sum_l g_l s)=0 and E_a divides this difference.
This is precisely exists_depth_step_zero, not invariance of the
unreduced vector or of arbitrary coefficients outside Lambda.

For the HodgeExpansion caller, write y=valueAt(a,mu,x), c fixed
in localFieldOf Gamma', w=phiInvToBdR(a,E_a), D=phiInvToBdR(a,delta)
(a t-adic unit), U=(y-c)/w^n of nonnegative Hodge depth in valueField.
With omega now its image Omega and v the image of upsilon,
the exact correction identity, valid for signed n, is
 P*y-v*(gy-y)/D-P*c =
 w^n*((P-v*Xbar)*U - (v/D)*omega^n*(gU-U)).
Here Xbar is image of X, P=p^cost. The first summand in brackets
has depth >=1 by section 1; the second by the EXISTING
smul_sub_mem_hodgeFil_of_valueField (one-element family), using
the exact congruence from section 1. This proves the signed
step at the actual consumer without splitting the sign of n.
For zero use the EXISTING valueField trace lemma with the
family from section 2 and the EXISTING BdR approximation by
localFieldOf Gamma' (as in HodgeExpansion). No claim to have
reconstructed these two value-field comparison foundations here.

3. Bicommutant congruence and integral cancellation through E powers.
All B^+ expressions use the native embeddings; set S_B=bicommutant.
For y in S_B, the coordinate approximation (ChartScalars 209–217)
writes p^k y=lambda+z b, lambda in Lambda; p is a unit in B^+.
As g fixes Lambda and z | gz in A (tilt valuation), z | gy-y
in B^+, say gy-y=z b1. For every j>=1, phi^j y is again in S_B;
take p^k phi^j y in A_max and apply the distinguished-coordinate
approximation with nu=E, M=1 (allowed since E associated to xi).
It writes p^(k+1) phi^j y=s+E w, s in S, w in S_B.
Applying theta_B and then g, using theta(E)=0, g fixes theta(S),
and commutation of g and phi, shows theta_B phi^j(gy-y)=0.
Since theta_B phi^j z nonzero, theta_B phi^j b1=0. The retained
native all-Frobenius tau-kernel criterion in B^+ gives tau|b1.
Hence delta | gy-y. This argument is uniform in y and needs no
archimedean estimate or extra p cost.

For integral z cancellation, put I={b in A : z divides b in B^+}.
It is an ideal containing zA and p-saturated because p is a unit
in B^+. For b in I, the S-linear extended coordinates imply
z divides lambda_i(b) in B^+. z is NOT a unit there (the actual
z-adic separation eq_zero_of_z_pow_dvd, applied to 1). Therefore
each lambda_i(b) is in the maximal ideal (p,z) of S. The actual
adic basis gives I contained in (p,z)A. Now b=z b0+p b1 with
b1 in I; iterate, use p-adic completeness of A and p-adic
separation to obtain b in zA. This proves I=zA. Furthermore
A/zA has no p-torsion: p b=z c implies mod p that zbar*cbar=0
in the domain A/p, and zbar nonzero, hence c=p c', and b=z c'
by domain cancellation. E mod z equals p, so z | E^h b in B^+
implies z | b IN A. Repeating after division by z in B^+ (domain)
proves the same for z^n. No inference from rational divisibility
alone without p-saturation and complete coordinate lattice.

If tau*z^n divides E^h b in B^+, evaluate theta phi^j for j>=1:
theta phi^j tau=0 and theta phi^j E nonzero. Thus theta phi^j b=0
for all j>=1, and the native integral tau-kernel criterion gives
b=tau b'. Cancel tau in B^+ and apply preceding z^n argument.
Consequently tau*z^n | b in A, the exact frame divisibility guard
of CrystallineLimit.28–35. Retain the native coordinate extension,
adic basis, z-adic separation and both tau-kernel theorems as
primitive foundations, rather than claiming unconditional closure.

4. Transfer the exact scalar guard to the lattice and localization.
For x in Kisin module and any crystalline form mu, the actual frame
theorem gives E^h mu(x)=s in S_B. Put W=E^h, gW=uW,
gW-W=delta*r, gs-s=delta*t, u a unit of A. Then
 u W^2 (g(mu(x))-mu(x))=W*gs-gW*s=delta*(W*t-r*s).
Since u is a unit in B^+, the RHS proves W^2 times the difference
in delta B^+. Galois-equivariance of crystalline forms and the
retained frame divisibility test (FrameTheorem 57–59) now give
gx-x in delta M for x in the Kisin module (M=kisinAinf).
This extends to the required x in kisinLoc at the base by
using the exact forms-in-value-field part of frame_theorem and
the native kisinLoc definition: x in M and in valueFieldPoints
is in kisinModule, by frame_theorem's span description/definition
of kisinLoc at level zero; alternatively use the precise
saturateBy_induction of ExponentLattices 177–181 whose base
explicitly supplies x in kisinModule. For a localization generator
E_a, the exact identity in the ambient module is
 delta^-1(g(E_a*x)-E_a*x)
 = E_a*delta^-1(gx-x) + ((gE_a-E_a)/delta)*gx.
Second term is in the localized A-module by chart congruence
for s=E_a and Galois stability. Saturation by E_a then removes
E_a from the first term. Thus the native derivative on kisinLoc
costs no extra p factor; retain all module stability, form
equivariance and frame existence premises explicitly.

Local source graph, not native dependency export:
original signed/zero depth -> HodgeExpansion.exists_reaches_depth_succ;
CrystallineLimit congruences -> GaloisOnFrames -> frame divisibility
-> ExponentLattices.smul_sub_mem_zTau_kisinLocAinf -> common correction.
Reduced human edges: polynomial Taylor + LTE + exact theta_a
valuation -> signed cost; root-of-unity trace -> zero cost;
coordinate approximation + p-saturated ideal + tau-kernel ->
frame congruence and derivative. No original graph/axiom file
deleted; no claim these nodes are globally pruned. Cache context
by source pin, actual chart, level a, n=0 or signed n, and caller.
Unresolved: actual native frame existence, adic basis/period
comparison, value-field approximation, radius lemma and surviving
Theorem C rowBudget/local-global prerequisites. Do not count
scalar algebra as kernel closure.

Execution: local Python SymPy expanded two denominator/correction
identities to zero; exact Fraction budget inequality on 6400
(p,e,a) tuples with p in {2,3,5,7,11,13,17,19}, 1<=e<=50,
0<=a<=15, and 104 exact cyclotomic polynomial remainder checks
(p in {2,3,5,7}, a=1,2, m=0,...,p^a-1). Finite regressions are
NOT proofs of native period-ring facts. Lean/lake/elan unavailable.
Current published compact runner receipt on cathedral-research-state
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named older checks
with propext, Classical.choice, Quot.sound; module_1_build timeout
124 at 2700.11s, all_requested_checks_ok=false, full_RH_replay=false.
No new native PASS, no fresh rh_scan/rh_prune/rh_auto execution,
no new compute job dispatched; hand to shared native runner.

RESUME HERE: audit exact signed and zero depth at HodgeExpansion;
check the remaining radius_lemma approximation induction in
CrystallineLimit.55–155 and actual rank-independent frame existence,
rather than redo scalar congruences or LTE. Integration/editor:
retain primitive frame and local-value-field comparison obligations
and reconcile against existing RUN63/RUN66/452515bd row suppliers.
HANDOFF TO integration, editor, Galois arithmetic, audit and native
replay. RH and the weighted-prime lower bound remain open.
-/

namespace RHGaloisRun73

theorem frame_cancel_identity {R : Type*} [CommRing R]
    (W s delta r t : R) :
    W*(s+delta*t)-(W+delta*r)*s = delta*(W*t-r*s) := by ring

theorem depth_correction_identity {R : Type*} [CommRing R]
    (D P W Y v omega gU : R) :
    D*P*W*Y-v*W*((omega-1)*Y+omega*(gU-Y)) =
    W*((D*P-v*(omega-1))*Y-v*omega*(gU-Y)) := by ring

#print axioms frame_cancel_identity
#print axioms depth_correction_identity
#check Lift.KummerChart.exists_depth_step
#check Lift.KummerChart.exists_depth_step_zero
#check Lift.Chart.tau_mul_z_pow_dvd
#check Lift.Chart.tau_mul_z_dvd_smul_sub
#check Lift.KummerChart.JumpLattice.smul_sub_mem_zTau_kisinLocAinf
#check Lift.KummerChart.JumpLattice.exists_reaches_depth_succ
#print axioms Lift.KummerChart.exists_depth_step
#print axioms Lift.KummerChart.exists_depth_step_zero

end RHGaloisRun73
