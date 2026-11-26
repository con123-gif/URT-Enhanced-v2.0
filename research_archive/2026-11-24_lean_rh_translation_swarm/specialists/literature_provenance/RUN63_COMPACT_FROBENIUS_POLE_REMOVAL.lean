import Lib.PadicHodge.PeriodRings.FundamentalKernel
import Mathlib.Tactic

/-!
RUN63, 26 November 2026. Human source-matched derivation and exact
external theorem audit; native probes prepared, NOT compiled.
Credit Levent Alpoge, Luke Sernau, Anthropic collaborators and Claude.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first).
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Source ledger:
* Lib/PadicHodge/PeriodRings/ThetaKernel.lean ab5766dd9ea95412ad15247cef74b9b701250797
  theta_eq_zero_iff_xi_dvd, mu_dvd_of_theta_frobEnd, tau_dvd_of_theta_frobEnd.
* Lib/PadicHodge/PeriodRings/AmaxStructure.lean 1be9736d2c48bece6dd038c72d14b6f807cff9df
  p_mem_nonZeroDivisors, exists_reduction_mod_p, p_pow_dvd_of_monic_mul,
  exists_p_pow_mul_eq_add, mem_span_pow_of_p_pow_dvd.
* Lib/PadicHodge/PeriodRings/BdRPlus.lean f828ee87f4914572d457b364b38c6c6b0fbc8372
  tau_dvd_xi_sub_p, amaxImage.p_pow_mul_mem_of_dvd_mu, exists_Ainf_approx,
  dvd_of_thetaBPlus_frobEnd_eq_zero, xi_pow_dvd_iff.
* Lib/PadicHodge/PeriodRings/FundamentalKernel.lean 7d78ffa669acc35996f315cfe18ac1dc43649fb9
  pow_smul_mem_range_BPlus, Bcris.exists_padic_eq_of_frobEnd_fixed.
* Lib/PadicHodge/PeriodRings/BdR.lean 326d41233ac7638a50194f3ade22350c9b038ad5
  exists_tPeriod, exists_Ainf_eq_of_contraction.
* Lib/PadicHodge/TateSen/DeRhamFiltration.lean dc4c23217762fe5c0da0a7c70a3d3f7bf297c84b
  algebraMap_mem_hodgeFil_iff_xi_pow_dvd, algebraMap_mem_hodgeFil_one_iff.
* Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean cf83fda104fb44177d374d62f06b4d6e68e3db08
  IsChartOf.exists_isPeriodMatrix (actual caller, integration RUN65).
* PeriodMatrixFrame.lean 348d083320f3e9f59100db1a2f96f5a3f8e92923
  exists_frame, already human-derived by editor RUN64 e1d32e040626b0134c2614a14df62a869cc8a0ad.
* RUN62 basis contraction 34b19e8c036dd14d65c4a2066e7430c8ba4bd541.
* RUN61 coordinate extension and approximation.
Latest peer head search: f58fbee1, 708be3d5, a2f5cd69, 917cdb64,
b11d25a0, c5a8c340, e1e5b353, 8f02772b, e1c6215b, f2750806,
059f9ed6, e1d32e04, fcb667ea, 4b7508c2. Integration RUN65
059f9ed689e4e62a89a26a31a299966227968c25 derived period U from
the retained all-Frobenius range lemma. Do not duplicate the frame
determinant now finished by RUN64; discharge that retained range
and the integral ring premises used in RUN61--62 instead.

1. Exact published theorem bridge (not a blanket Kisin citation).

Xavier Caruso, An introduction to p-adic period rings,
arXiv:1908.08424, author PDF:
https://xavier.caruso.ovh/papers/publis/periods.pdf
Prop 3.1.7 pp.34--35, Prop 3.1.3(i) and 3.1.5 pp.33--34,
Prop 3.3.1 and (29) p.39, Prop 3.4.4 p.45.
Page images 34,35,39,45 inspected; actual theorem statements and
proof text retrieved. In his notation omega is our xi, and
[epsilon]-1 our mu. His A_inf and theta are the same Witt ring of
the tilt of O_C and Fontaine map. Prop 3.1.7 proves exactly
intersection_{n>=0} ker(theta phi^n)=(mu) in A_inf, not merely
an equality after inverting p. This is a legitimate external
discharge of mu_dvd_of_theta_frobEnd. Prop 3.1.3/5 supplies the
xi generator. No stronger claim on integral chart lattices follows.

Caruso uses the generator z=[p^flat]-p for A_max. Since z and xi
generate ker(theta), their ratio is a unit in A_inf; hence
A_inf[z/p]=A_inf[xi/p]=A_inf[[p^flat]/p], with same completion.
The variable in his (29) is [p^flat]/p, whereas native X=xi/p.
The variable change is affine with unit linear coefficient in
A_inf modulo (p,xi): if xi=u z, X=u([p^flat]/p-1).
Thus the polynomial reduction and kernel statement match the
native normalization. In B^+=A_max[1/p], (xi) is ker theta.
Do not identify the different unlocalized integral theta kernels:
in A_max the generator is xi/p. Prop 3.4.4 includes the max
case (proof last paragraph), and proves (Fil^0 B_max)^{phi=1}=Q_p.
Native Bcris denotes B_max^+[1/mu], not the usual B_cris:
native t is associated to p mu in A_max, so after inverting p,
inverting t or mu gives the same ring. The Frobenius/filtration
identification uses the native period t and standard compatible
embeddings; the direct proof below avoids requiring equality of
the two chosen cyclotomic periods. The range lemma for all
iterates and the actual uniform denominators are not assumed as
part of Prop 3.4.4.

2. Integral A_max facts used in the exact caller.

Let R=W(O_flat), p regular, xi the above generator, A0=R[X]/(pX-xi),
A=lim A0/p^j, B+=A[1/p], B=B+[1/mu], D+=B_dR^+.
p is regular in A0: if pF=(pX-xi)G, reduction mod p in the domain
O_flat[X] gives xi_bar G_bar=0; xi_bar!=0, hence G=pG1 and
F=(pX-xi)G1 by cancellation in R[X].
Regularity passes to A: if p a=0, at level j+1 a representative
a_j satisfies p a_j in p^(j+1) A0, so a_j in p^j A0. Every
component is zero. Moreover A/pA=A0/pA0=(R/(p,xi))[X]:
for any compatible system with first component zero, divide
representatives at level j+1 by p, giving a compatible system
mod p^j using the same cancellation. This proves the kernel;
surjectivity is given by constant polynomial lifts. Completeness
and separation follow from the inverse limit. No Noetherian
hypothesis on R or domain claim about R/(p,xi) is needed.

If P monic, multiplication by P(X) mod p is injective, since
the highest nonzero coefficient of a polynomial survives.
Consequently P(X)a in p^m A implies a in p^m A, by induction
and cancellation of p. This also proves the native uniform
denominator bound: tau divides xi-p (see section 3), so mu=xi tau
divides xi(xi-p). For e|mu, e^n y in A implies
[X(X-1)]^n p^(2n) y in A. Clear a denominator of p^(2n)y,
apply the monic cancellation to that integral numerator,
and conclude p^(2n)y in A. All exponents are independent of y.

The exact intersection R intersect p^m A=(p,xi)^m R follows
inductively without assuming R is Noetherian. The easy inclusion
uses xi=pX. For the converse, theta(a) in p^m O_C if a in
p^m A; choose c in R with theta(a)=p^m theta(c), using
theta surjective. Then a-p^m c=xi b in R, and in A, pX b
is divisible by p^m. For m>=1, regularity and monic cancellation
give b in p^(m-1)A; induction gives b in (p,xi)^(m-1)R.
This also proves injectivity R->A using (p,xi)-separation of R.
This is the previously retained intersection fact of RUN61--62.

3. Frobenius kernel, exact approximation, reflection.

For completeness an elementary version of the external Prop
3.1.7 argument: write mu=xi tau, phi(tau)=mu, phi^n(xi) under
theta equals p for n>=1. Then theta(phi^n(mu))=0 all n>=0.
For a in I=intersection ker(theta phi^n), successively divide
by phi^(-j)(xi). Indeed at the j-th theta map all earlier
factors have theta equal to p, so the remaining factor has
theta(phi^j(b))=0; automorphism phi of R permits division.
For every N, a is divisible by product_{j=0}^N phi^(-j)(xi).
In O_flat=R/p the valuation of this product is
v(xi_bar) sum_{j=0}^N p^(-j), tending to v(mu_bar), since
phi(tau)=mu and mu=xi tau. The valuations are finite for
nonzero reductions, and the rank-one valuation order implies
mu_bar divides a_bar, also if a_bar=0. Choose a lift of the
quotient to R. Write a=mu b0+p a1 with a1 in I (I is p-saturated
because O_C has characteristic zero). Repeat and take the
p-adic limit of b0+p b1+..., obtaining I=(mu).
This recovers the exact theorem at the native caller including
p=2; does not rely on multiplying infinitely many ideals or
claiming distinct primes are comaximal. Applying phi to a
gives the shifted intersection from n>=1 equal to (tau).
Since theta(phi^n(xi-p))=0 for n>=1, tau|xi-p.

If nu|xi-pb for b in R, use the finite polynomial expansion
of a in A modulo p^m, iterated, to write a=sum_j p^j P_j(X).
Divide each P_j by X-b, so p a=r+nu w with r in R,w in A,
as p(X-b)=xi-pb. Iterating on w gives p^n a=r_n+nu^n w_n.
The two series converge by p-completeness of R and A.

For arbitrary y in B+ and k,n>=0, clear p^m y=b in A.
Approximate b by a polynomial modulo p^(m+k+2n)A and clear
its degree denominator p^d. Then
p^(m+d)y=c+p^(m+d+k+2n)w, c in R,w in A.
Apply the preceding decomposition first with nu=tau (b=1),
then with nu=xi (b=0):
p^n w=a1+tau^n z, p^n z=a2+xi^n x.
Consequently p^(2n)w=p^n a1+tau^n a2+mu^n x.
Absorb the first two terms into c to obtain exactly
p^M y=a+p^(M+k) mu^n x, a in R,x in A,M=m+d.
This is the actual exists_Ainf_approx with the original
integral error bound, not just density in D+.

Suppose theta_B+(phi^j(y))=0 for every j>=0. Use n=1,k=0
in that approximation. Since phi^j(mu) vanishes under theta,
the approximant a has theta(phi^j(a))=0 for every j, hence
mu|a in R. Divide the approximation by the unit p^M:
mu|y in B+. For j>=1 the same argument gives tau|y.
For j=0 alone it gives xi|y. The latter is the theta kernel
of B+, and reflection of all xi powers to B+ follows from
the definition of the xi-adic completion D+ (or the exact
quotient isomorphisms in Caruso 3.3.4). Thus no assumption
of inverse Frobenius on B+ is needed.

4. Remove every pole from the actual crystalline period matrix.

Let y in B and a>=0, nu in R with mu|nu, and assume
phi^j(y) belongs to t^(-a)D+ for EVERY j>=0. Let q=nu^a y.
Since B=B+[1/mu], write mu^N q=c in B+ for some N>=0.
For N>0 and every j, phi^j(c)=phi^j(mu^N nu^a) phi^j(y).
The image of phi^j(mu) is divisible by xi in D+ (theta
vanishes), and the same holds for phi^j(nu) since mu|nu.
The product is in t^(N+a)D+ times t^(-a)D+, hence in
t^N D+, contained in t D+ (N>=1). Thus theta(phi^j(c))=0
for all j, where theta agrees with the B+ theta. By section 3
c=mu c1 with c1 in B+. Cancel mu in the localization:
mu^(N-1) q=c1. Induction reduces N to zero and gives

    [forall j>=0, phi^j(y) in t^(-a)D+] => nu^a y in B+.

This is exactly pow_smul_mem_range_BPlus; the assumption at
j=0 alone would not suffice. For the caller take nu=E tau,
associated to mu, a and b the actual Hodge jump bounds.
Apply the result to entries of M and M^-1 separately to
obtain U=(E tau)^a M and W=(E tau)^b M^-1 over B+ with
UW=(E tau)^(a+b)I (the equality holds by injectivity).
The same U feeds RUN65 hat_stable and RUN64 frame.
This closes that retained range premise in the human proof
using the explicit integral ring construction above.

5. Fixed Frobenius kernel: direct published or native proof.

If phi(y)=y and y in D+, all its iterates are in D+.
Section 4 with a=0 gives c in B+ representing y. Injectivity
implies phi(c)=c. Pick m with p^m c in A; the contraction
lemma of RUN62, with singleton V={p^m c}, h=0,u=1, shows
p^(m+1)c in R. Since phi fixes it and the Frobenius on R is
the Witt Frobenius, all Witt coordinates are fixed by x->x^p
in the characteristic-p domain O_flat. They belong to F_p,
so p^(m+1)c in W(F_p)=Z_p, and c in Q_p.
Conversely Q_p has these two properties. This is precisely
Bcris.exists_padic_eq_of_frobEnd_fixed. It is also covered
by Caruso 3.4.4 after the ring and filtration identification
in section 1. No assumption of the full fundamental exact
sequence or a general crystalline comparison is needed for
these two kernel results; surjectivity of that sequence is
a separate retained obligation wherever actually used.

6. Audit of integration and retained frontier.

Editor RUN64's prime-to-p determinant proof uses the finite
Frobenius product C_n and coefficient shift, not an inverse in
the non-domain O_C/p. Its adjugate cancellation is valid.
The earlier local proof now has the exact A_max denominator,
intersection and kernel reflection premises justified above.
Keep theta surjectivity, rank-one complete tilt/Witt basics,
(p,xi)-separation of R, compatible Frobenius/embeddings and
the association of the native t with p mu as standard/source
foundations. This note does not independently derive all those
constructions, the remaining Hodge/jump, chart divisibility
and quantitative radius or balanced-row/reciprocity suppliers.
No RH assumption or URT premise. Do not count a locally removed
premise as globally eliminated when another caller uses it.
Original/reduced native graphs and axiom evidence preserved;
local human graph: C -> frame_theorem -> exists_isPeriodMatrix
 -> pow_smul_mem_range_BPlus -> all-theta mu kernel + integral
 approximation + localization cancellation. RUN62 uses the same
 monic denominator and intersection facts. Context key compact pin,
 R,A,theta,phi,nu and all-Frobenius jump bound.

Actual state branch receipts reread: run 45803534769,
compute/rh-compact-primitives-replay-20261126/status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f = error,
outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804:
six native named checks in Selmer.TiltingLemma and Filling.Moments
with propext, Classical.choice, Quot.sound; module_1_build exit
124, full_RH_replay=false. No coverage of current period-ring
declarations. Local command -v lean/lake/elan found no executables.
The old-pin native engine is not silently transplanted; no actual
compact rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier invocation
or new native PASS. Actual original-declaration probes and a scalar
cancellation certificate below are prepared, not compiled.
No synthetic finite diagnostics in this run.

RESUME HERE: audit actual Hodge/jump and chart-divisibility premises
of CrystallinePeriodMatrix.exists_isPeriodMatrix if still retained;
coordinate with integration on FrameTheorem.radius_lemma and actual
value-field safety, or move to still-open external Siegel--Weil/Rallis
hypothesis bridges if C is fully assigned. Do not redo frame determinant
or scalar endgame. HANDOFF TO editor, integration, formal audit,
shared native runner. Human RH reconstruction incomplete.
-/

namespace CompactLiteratureRun63

theorem pole_removal_step {R : Type*} [CommRing R] [IsDomain R]
    (mu q c : R) (N : Nat) (hmu : mu ≠ 0)
    (h : mu ^ (N + 1) * q = mu * c) : mu ^ N * q = c := by
  apply mul_left_cancel₀ hmu
  calc
    mu * (mu ^ N * q) = mu ^ (N + 1) * q := by rw [pow_succ]; ring
    _ = mu * c := h

#print axioms pole_removal_step

end CompactLiteratureRun63

#check theta_eq_zero_iff_xi_dvd
#check mu_dvd_of_theta_frobEnd
#check tau_dvd_of_theta_frobEnd
#check Amax.p_mem_nonZeroDivisors
#check Amax.exists_reduction_mod_p
#check Amax.p_pow_dvd_of_monic_mul
#check Amax.mem_span_pow_of_p_pow_dvd
#check amaxImage.p_pow_mul_mem_of_dvd_mu
#check BPlus.exists_Ainf_approx
#check BPlus.dvd_of_thetaBPlus_frobEnd_eq_zero
#check BdRPlus.xi_pow_dvd_iff
#check pow_smul_mem_range_BPlus
#check Bcris.exists_padic_eq_of_frobEnd_fixed
#print axioms mu_dvd_of_theta_frobEnd
#print axioms Amax.mem_span_pow_of_p_pow_dvd
#print axioms BPlus.exists_Ainf_approx
#print axioms pow_smul_mem_range_BPlus
#print axioms Bcris.exists_padic_eq_of_frobEnd_fixed
