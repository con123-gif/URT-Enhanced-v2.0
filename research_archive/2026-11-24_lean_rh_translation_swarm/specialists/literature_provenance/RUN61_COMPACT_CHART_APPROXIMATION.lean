import Lib.PadicHodge.WachKisin.KummerChart
import Lib.PadicHodge.WachKisin.PeriodMatrixFrame

/-!
# RUN61 — chart approximation, extension and separation (26 Nov 2026)

Status HUMAN-DERIVED from actual compact source, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first).
Read AGENTS, protocol, queue, expansion, HUMAN_PROOF_COMPACT blob
bd4fd350d614e72f9e39fcc71596857737940c5c and RUN60.
Peer 825590bb finite vacuum, 6843df9f level Fourier, 3d547f6d Bessel
group are distinct. This note supplies chart primitives retained by
RUN59–60 and the actual C frame basis/inverse, not a new RH criterion.

Source ledger, relative to grh-compact/src:
Lib/PadicHodge/WachKisin/ChartScalars.lean 8dc59315a323816ecb0eedf46b5aae0a8c714fc5
  exists_frobE_dvd_sub_of_dvd, mem_of_fixed_thetaPhiInvS,
  eventually_exists_coeff_eq_of_fixed, exists_extendToBPlus,
  eq_zero_of_ainfToBPlus, extendedCoord_mem_bicommutant,
  eventually_approx_sum_extendedCoord, eventually_exists_pow_mul_eq_add_z_mul,
  eq_zero_of_z_pow_dvd.
Lib/PadicHodge/PeriodRings/AmaxStructure.lean 1be9736d2c48bece6dd038c72d14b6f807cff9df
  exists_adic_extension, exists_algebraMap_eq_p_pow_mul_sub,
  exists_reduction_mod_p, p_pow_dvd_of_monic_mul,
  exists_p_pow_mul_eq_add, mem_span_pow_of_p_pow_dvd.
Lib/PadicHodge/PeriodRings/BdRPlus.lean f828ee87f4914572d457b364b38c6c6b0fbc8372
  BPlus.exists_Ainf_approx, BPlus.eq_zero_of_forall_pow_dvd.
Lib/PadicHodge/WachKisin/HodgeFrame.lean 158f4df424f222f593b6f2baee57a294ab221f03
  Chart, associated_E_xi, seriesEquiv, xi_mem_span_p_z.
Lib/PadicHodge/WachKisin/KummerChartExists.lean f90f19a17f77be0aff920a5db18ae389d5898561
  exists_kummer_chart.
Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean cd91a46eb5624b88af20a96d0450bdf059994b93
  IsPeriodMatrix.exists_basis.
Lib/PadicHodge/WachKisin/KummerChart.lean 8c3d7ca027e653f9a125e0cec6fd477c5ce6f791
  dvd_extendToBPlus, exists_witt_coeff_of_isChartOf.

## 1. Extend the actual coordinate map, with its integral bound

Write R=A_inf, A=A_max, B+=A[1/p], S=Lambda[[z]] inside R.
Use the native integral period-ring facts: p is regular in A;
R injects into A; A is p-complete and separated;
R intersect p^m A = (p,xi)^m R (Amax.mem_span_pow_of_p_pow_dvd
and its converse). These are explicit foundational inputs, not
consequences of ordinary rational Kisin modules.

For any S-linear f:R->R, f preserves (p,E)^m R because E,p in S,
and (p,E)R=(p,xi)R. Consequently, for a in R,
  a in p^m A => f(a) in p^m A.
Set D=R[1/p] intersect A. For a/p^k in D define F(a/p^k)=f(a)/p^k.
Equality of fractions, p-regularity and p-linearity make this
well defined, S-linear and integral. If a/p^k in p^m A, then
a in p^(m+k) A, so F(a/p^k) in p^m A. Thus F is nonexpanding on D.
D is p-adically dense in A: every element is approximated mod p^m
by a finite polynomial P(X), X=xi/p; clearing its degree denominator
puts P(X) in D. This is the same native approximation
exists_algebraMap_eq_p_pow_mul_sub. Extend F by Cauchy limits
uniquely to A, preserving each p^m A, and localize at p.
This yields precisely exists_extendToBPlus, including its integral
image condition. It also proves uniqueness: any additive map of
B+ preserving A and vanishing on R vanishes on D by p-linearity,
then on A by continuity, then on B+ by clearing a denominator.
The same conclusion holds if a difference of two such maps is used.

## 2. Bicommutant and coordinate reconstruction at the actual caller

Let T be the native bicommutant in B+: multiplication commutes
with every S-linear G:B+->B+ carrying A to A.
For an S-valued coordinate lambda on R, its extension F above
has F(y) in T for every y. Indeed fix w in A and G as above.
The additive map x -> G(w F(x))-G(w) F(x) carries A into A.
It vanishes for x in R, since F(x)=lambda(x) in S. By uniqueness
in section 1 it vanishes on B+. Scale arbitrary w in B+ by a
power of p to put it in A and cancel that power. This proves
extendedCoord_mem_bicommutant, without assuming T is a field.
The distinguished lambda_0 has lambda_0(1)=1, so for y in T
the commutation of multiplication by y with its extension
gives F_0(y)=y. Also if v,vu in T and v nonzero, multiply the
commutator of u by v and use the domain property to obtain u in T.

For y in B+, choose k and a in R with p^k y=a+p^(m+k) w,
w in A (exists_Ainf_approx, n=0; alternatively polynomial density
in A after clearing the denominator of y). For all sufficiently
large finite sets J the basis approximation of a has residual
a-sum_(i in J) b_i lambda_i(a) in (p,z)^N R for an N with
(p,z)^N contained in (p,E)^(m+k) R; use z^e in (p,E)S.
Hence that residual is in p^(m+k) A. Each b_i is integral and
F_i preserves A. Applying 1-sum b_i F_i to the equation and
cancelling p^k yields
  y - sum_(i in J) b_i F_i(y) in p^m A.
This proves the actual eventual finite-set approximation, including
uniformity in all supersets J of the selected finite set. If all
coordinates vanish, then y belongs to every p^m A, hence y=0.
Thus a nonzero denominator has a nonzero coordinate as required
by RUN60, and the same approximation applies to the vector
in PeriodMatrixBasis.exists_basis by a finite intersection.

## 3. Exact mod-z decomposition, no completeness claim for T

The polynomial quotient A is p-complete and R=W(Oflat) is
p-complete. If xi=p b+nu g in R, write an arbitrary a in A as
a=sum_(j>=0) p^j P_j(X), P_j in R[X], by repeated polynomial
approximation modulo p (not a unique expansion). Divide each
P_j by the monic linear X-b:
  P_j(X)=P_j(b)+(X-b)Q_j(X).
The two series of polynomial evaluations converge in R and A
respectively, because their terms are integral. Since p(X-b)=nu g,
  p a = p sum_j p^j P_j(b) + nu g sum_j p^j Q_j(X).
Iterating this exact identity on the remaining A term gives
p^M a=r+nu^M w with r in R, w in A (M=0 trivial).
In the chart take nu=z, using xi in (p,z)R, and apply F_0.
Since F_0 is S-linear, F_0(a) is in T, and F_0(r) in S.
For y in T take p^k y in A, use F_0(y)=y, M=1:
  p^(k+1) y=s+z u,  s in S, u in T.
Write s=w+z s' with w in Lambda and s' in S by its constant
coefficient. This proves the exact native eventual statement for
every m>=k+1, multiplying both coefficients by p^(m-k-1).
There is no assumption that T itself is complete, or that z is a
uniformizer of B+.

## 4. z-adic separation in the localized ring

The native Amax.exists_reduction_mod_p identifies
A/pA=(R/(p,xi))[X], with X=xi/p. For any monic P in R[X],
multiplication by its reduction is injective on this polynomial
ring even if the coefficient ring has zero divisors (degree of
a nonzero polynomial increases by deg P). By induction and
p-regularity, P(X)c in p^m A implies c in p^m A.
For y nonzero in B+, multiply by a power of p to give a primitive
c in A not in pA; existence uses p-separation and regularity.
If (xi-p b)^n divides y in B+ for every n, then (X-b)^n divides
c in B+ since p is invertible there. Clear the denominator of
the quotient, and use the preceding monic cancellation to get
(X-b)^n dividing c already in A for every n. Reduction modulo p
contradicts the finite degree of the nonzero polynomial c mod p.
Now choose the unit v of R with xi=vE=v(z^e u+p); e>0 and u unit.
Then xi-pv=v u z^e, so z^N dividing y for all N implies
(xi-pv)^n dividing y for all n. Therefore y=0. This is the
actual eq_zero_of_z_pow_dvd used in RUN60, not a Krull-intersection
assertion on a possibly non-Noetherian localization. It also
implies z is not a unit because B+ is nonzero.

## 5. Exact external Ax theorem and chart coefficient approximation

Verified external source: Denis Benois, An introduction to p-adic
Hodge theory, Theorem 1.1.8(iii), printed p.6 (PDF page index 5);
text and page image inspected:
https://www.math.u-bordeaux.fr/~dbenoua/Documents/p-adic-Hodge-final.pdf
For a complete nonarchimedean field K and any closed H in its
absolute Galois group, fixed elements in the completed algebraic
closure are the completion of the purely inseparable closure of
the algebraic fixed field. Here K=Q_p has characteristic zero,
so the latter closure is just the algebraic fixed field.
In contrast, the finite-local-field-only form C_p^(G_K)=K is
not enough for this caller. No quantitative Ax constant needed.

Set theta_n=theta phi^(-n). By Weierstrass division for the
native phi^n(E) (unit times distinguished polynomial of degree
e*p^n), each theta_n(S) is a finite Z_p-module; its elements
are algebraic and its p-localization a field (finite dimensional
domain over Q_p). This uses the existing Chart.weierstrass_division,
not a new theorem of the literature. The fields are increasing
since theta_(n+1)(phi(s))=theta_n(s). Let K_infty be their union.
The fixer H of S in G_p equals Gal(Qpbar/K_infty): if g fixes S,
equivariance fixes every theta_n(S); conversely if every theta_n
annihilates gs-s, the equality of all tilt coordinates of the
constant Witt coefficient gives p | gs-s. Divide by p and repeat
to obtain arbitrary p-divisibility in R, hence gs=s. This
also proves the closedness of H, as intersection of stabilizers
of algebraic elements. For a Q_p-subalgebra K of C_p, all
theta_n(S) elements in K are algebraic; their fixer contains
the fixer of K intersect Qpbar. The Galois correspondence
then gives the exact mem_of_fixed_thetaPhiInvS implication.

If y in Oflat is H-fixed, then theta_N([y]) in O_C is H-fixed.
Ax–Sen–Tate gives x in K_infty with |theta_N([y])-x|<|p|;
in particular x in O_C. Choose n0 and a fixed k with
x=theta_(n0)(s)/p^k. For each n>=n0 use phi^(n-n0)(s) in S
to give the same x. Since theta_n(s_n) is divisible by p^k
in O_C, surjectivity of theta_n:R->O_C gives r in R such that
s_n-p^k r in phi^n(E)R. Apply the S-linear coordinate lambda_0
to this equality, using lambda_0|S=id, to deduce
s_n-p^k lambda_0(r) in phi^n(E)S. Hence x is the image under
theta_n of an element of S without a denominator. Reduction
modulo p gives the equality of the N-th tilt component of y
and n-th component of that element of S for EVERY n>=n0.
This supplies eventually_exists_coeff_eq_of_fixed, including
its eventual quantifier, and identifies the exact external
theorem and hypothesis bridge. For arbitrary alpha in S the
same lift-and-project proves exists_frobE_dvd_sub_of_dvd for
any S-linear f by applying f to r-alpha*a in phi^n(E)R.

## Handoff and retained dependency evidence

Candidate human reduction (not a new extracted DAG):
C -> exists_frame -> exists_basis -> coordinate extension,
coordinate approximation, mod-z decomposition, separation;
C -> exists_isPeriodMatrix -> Witt ratio -> same four plus
fixed-field/Ax chart coefficient approximation. The original
native graph and all older axiom evidence are unchanged.
Keep native Amax regularity, exact reduction mod p, intersection
filtration, Chart.adicBasis, Weierstrass division and chart
construction (exists_kummer_chart) as explicit prerequisites.
Do not replace chart existence by a generic rational crystalline
comparison. No new assumption of Kisin module equivalence.
Cache by source pin, chart, chosen coordinates, p, ring and
actual caller; no global graph deletion or circular RH import.

Actual CI read this run: run 45803534769, state branch
compute/rh-compact-primitives-replay-20261126/status.json
blob a56e2d3afb99ed8275e81fd63c8494306e57c43f = error;
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named checks in New.Selmer.TiltingLemma and New.Filling.Moments
with propext, Classical.choice, Quot.sound; module_1_build exit
124; full_RH_replay=false. Workflow jobs success is not the
mathematical payload success. No result here for ChartScalars.
Local command -v lean and -v lake yielded no executable.
Prepared executable native probes below, not compiled; no claim
of fresh native pruning, axiom audit or PASS for this file.
No synthetic scalar diagnostics; exact mathematical derivations.

RESUME HERE: integrate sections 1–5 into RUN59–60, audit
Chart.weierstrass_division finite-image and Amax intersection
filtration at the precise source, then close PeriodMatrixBasis
contraction and free S-lattice/divisibility clause, preserving
the original and reduced graphs. Chart existence remains a
separate retained supplier; inspect exists_kummer_chart rather
than assume it from ordinary crystalline admissibility.
HANDOFF TO editor/integration, formal audit and native runner.
-/

#check Lift.Chart.exists_extendToBPlus
#check Lift.Chart.eq_zero_of_ainfToBPlus
#check Lift.Chart.extendedCoord_mem_bicommutant
#check Lift.Chart.eventually_approx_sum_extendedCoord
#check Lift.Chart.eventually_exists_pow_mul_eq_add_z_mul
#check Lift.Chart.eq_zero_of_z_pow_dvd
#check Lift.Chart.eventually_exists_coeff_eq_of_fixed
#check Lift.Chart.mem_of_fixed_thetaPhiInvS
#check Amax.exists_p_pow_mul_eq_add
#check Amax.mem_span_pow_of_p_pow_dvd
#check Lift.Chart.IsPeriodMatrix.exists_basis
#print axioms Lift.Chart.exists_extendToBPlus
#print axioms Lift.Chart.eventually_approx_sum_extendedCoord
#print axioms Lift.Chart.eventually_exists_pow_mul_eq_add_z_mul
#print axioms Lift.Chart.eq_zero_of_z_pow_dvd
#print axioms Lift.Chart.eventually_exists_coeff_eq_of_fixed
