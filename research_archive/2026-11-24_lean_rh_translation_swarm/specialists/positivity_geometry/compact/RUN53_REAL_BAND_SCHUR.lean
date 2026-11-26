import New.RealPlace.BandLimits

/-!
RUN53 — real-place B primitive: bottom Schur estimate, explicit damped
band exponent, top Gram and continuity. 2026-11-26. HUMAN SOURCE-MATCHED,
conditional on the explicitly identified native analytic/geometric
suppliers. Not a new native PASS, not a complete B proof.

Read current mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb,
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION and unified determinant
contract 7ad9c7c64f53c621ad20422226ad9d0b756ee28e. Latest B peers
20af1d26 (sieve exponents), e3228b19 (coherent moment), 3b50a390
(orbital transport), 99802a3d (quadric mass) already cover RUN52's
old next target. Do not duplicate them. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.
Source bodies retrieved:
 New/RealPlace/BandLimits.lean 20ff4e65c2599fc8b752dbb93673ed65053e2216
 New/RealPlace/ComplexShells.lean 351cfdf7fa54238f79b1b950c3532feef1f74f53
 New/RealPlace/LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6
 New/RealPlace/ComplexGauge.lean 86c2d26bfaf34292de7d1e79c1634b020b26c1f3
 New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1f2451058
 Lib/DiscreteSeries/Bruhat/ComplexPlace.lean 74d2fd4581e30ba76a2c6dbd7604848bf7e6f3d0
 New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f
 New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd.

1. Actual bottom energy in hasBandLimits_of_isCutBessel.

Write F=cut, W=full, I0=card I>0, lambda=haarRatio (finite positive),
mu=Haar, nu=besselQuotMeasure, M=lambda mu. Write C0=volU(k)/volU(r),
A=C0/(lambda I0)^2=formConst. Both F,W have the SAME left Bessel
phase; their mixed scalar pairing is left invariant. Define
 delta(x)=lambda integral_<nu> <F(y),W(yx)> dy,
 a(x)=lambda integral_<nu> <F(y),F(yx)> dy.
These equal the actual upperPairing 0 terms by haarRatio_spec. At floor
0, the unweighted double integral equals |a(x)|^2 (use
formIntegrandOne_eq, upperPairing and empty stack/head). Hence
 J_0=A lambda integral_mu |a|^2.

For a finite-measure measurable set S, let phi=1_S conjugate(delta),
E_S=integral_S |delta|^2. The uniform upperPairing bound from the
actual IsPairingKernel gives phi in L1 and L2. Then, using inner linear
in the second argument and Fubini,
 E_S=lambda integral_nu <F(y), integral_mu phi(x) W(yx) dx> dy.
Interchange justified by bounded W, integrable phi and the native
upperPairing absolute majorant on S (the source uses k'.exists_lintegral_le);
one does not infer F in L1 from its L2 norm on an infinite quotient.
Cauchy-Schwarz and SchurLe W(I0/deg) give
 E_S <= lambda sqrt(I0) sqrt((I0/deg) E_S).
If E_S=0 nothing to divide; otherwise square and cancel E_S.
Thus E_S <= lambda^2 I0^2/deg. Exhaust by finite-measure sets using
sigma-finiteness of Haar and monotone convergence; this proves the
same global bound for delta. Multiplication by A lambda gives at most
C0 lambda/deg <= 1/deg (exact haarRatio_spec). No use of Schur for F.

Use exact cancellation BEFORE norms: with e=a-delta,
 |a|^2-|delta|^2=2 Re(conj(a)e)-|e|^2 <= 2 |a| |e|.
The actual product of the two upper pairings in the RHS is at most
formMajorant 0 ... F (F-W), by the pivot triangle inequalities
in LocalTheorem. W and F-W share the phase, are bounded, and at floor
0 are near (the full positions). Their L2 bounds are precisely
||F||^2<=I0, ||F-W||^2<=epsilon^2 I0 with epsilon=b^(-5r^2).
Use formConst_mul_lintegral_le at j=0, L=rho, p=q=1, t=1,
f=formMajorant. No oscillatory hypothesis required since t=1.
It yields
 J_0 <= 1/deg + 2 Theta rho^(10^9 n^4+24k) b^(-5r^2).
Here Theta=bandConst, n=varrho+1. The native hypothesis deg Theta
<=b^(4r^2) is exactly sufficient. Indeed rho=b^(6n+2),
n>=10^8, r>=k>=n^7. If Aexp=(6n+2)(10^9 n^4+24k), then
 Aexp <= 8*10^9 n^5 +192 n k <= r^2/2
(each term <=r^2/4 since n^9>=32*10^9 and r>=768n).
As r^2/2>=11 and b>=2, 2 b^(Aexp-r^2)<=b^-10.
Therefore the actual bottom clause is J_0 <= (1+b^-10)/deg.
All factors lambda, I0, and formal degree are retained. This is the
native source bottom Schur argument without the opaque tactic chain;
it is conditional on the shell majorant lemma, not on RH.

2. Explicit band damping in norm_floorForm_le.

For j<=varrho, let y be the nonzero complex frequency, u=|y|>0,
K=n^6, h=headWeight K j p * headWeight K j q.
The local modulus hypothesis is
 f(x)^2 <= (pi/u)^(2(k-1)) D_j(x),
where f=formModulus, D_j=selfNormProduct; complexPlace has md=|.|^2,
c=pi^2 and its coordinate count is k-1. Also f<=formMajorant.
For the bounded-head branch all partial products of p,q have norm
<=R=rho^(9n). exists_gauge_isHead gives ONE L>=rho for both heads
with L^K<=R^((K+6)(2j+1)) h. Since n>=10^8,
10^9 n^4<=K. Put t=max(1,rho^24*u). If t>1, then u>rho^-24.
Because k=s+3n+2, k-1>=s and pi>=1,
 (pi/u)^(k-1) <= (pi*rho^24)^k/t^s.
Indeed after multiplying by t^s the left side is
 pi^(k-1) rho^(24s) u^(-(k-1-s))
 <=pi^(k-1) rho^(24(k-1)) <=(pi*rho^24)^k.
Thus the exact native shell lemma with epsilon=1 applies, and
 |A floorForm| <= Theta L^(10^9 n^4) rho^(24k)
                        t^(-(s-9900000 n^3)).
Set l=k-n^7>=0. Then s-9900000 n^3-l>=6, since
 n^7>=9900000 n^3+3n+8 (n>=10^8).
Factor before estimating:
 rho^(24k) t^(-(s-9900000 n^3))
 <= rho^(24 n^7) (rho^24/t)^l t^-6
 <= rho^(24 n^7) u^-l min(1,u^-1)^6.
The last expression is exactly rho^(24 n^7) dampedPower l u^-1,
not a frequency bound that drops its small-frequency behavior.
The remaining power of b from L and rho is bounded by
 (6n+2)[9n(n^6+6)(2j+1)+24n^7]
 <= 8n[36 n^8+24 n^7] <=480 n^9 <=2000 n^9.
Hence the exact source band bound follows with its original constant:
 |A floorForm| <= Theta b^(2000 n^9) dampedPower (k-n^7) u^-1 h.
No optimize-constant objective.

In the complementary branch at least one partial product has norm
>rho^(9n). The native minors_mem_ofSize, applied to the two near
points in formMajorant_sq_le with sigma=0, forces the requisite
zero-volume floor; as s>0 the majorant vanishes. This is the
geometric support premise used in the actual norm_floorForm_le.
It is NOT inferred merely from the head gauge bound; keep this
minor/near-point geometry as an outstanding proof supplier.
In particular the shell lemma formConst_mul_lintegral_le and the
two LocalTheorem frequency estimates (char/unequal-head) are still
needed for the actual arbitrary p,q case. Neither is supplied by
the scalar exponent calculation.

3. Top Gram, continuity and descent interface.

Define J_i=A floorForm_i(p,q;1) for i<=varrho and
J_n=<Xi(p),Xi(q)> for n=varrho+1, where Xi=sieveVector F.
For a finite family p_i and coefficients z_i, its top quadratic
form is ||sum_i z_i Xi(p_i)||^2>=0, exactly the PSD clause, with
no coordinate multiplicity. On a neighborhood of a fixed nonzero
unit tuple p, choose one larger gauge via exists_gauge_isHead
and continuity of finitely many prefix norms and inverse norms.
The integrand of besselCorrelation at w_p cellChart(p_last)
vanishes outside a COMMON compact gauge set by hasMatSize_of_ne_zero
and isCompact_hasMatSize. All integrand entries are continuous,
uniformly bounded there since F is bounded; dominated convergence
gives continuity of each finite-dimensional component. The scalar
normalization is continuous: the chart uses a=p_last/min(1,|p_last|),
and sqrt(max(|a|^2-1,0)); the positive exponent k-1 makes Xi zero
at and below |p_last|=1. Hence the top kernel is continuous.

For equal last coordinates c with |c|>1, cartan_decomposition of
the actual last-floor sigma into the two compact embedded H factors
and cellChart(c), and commutation with the prefix Weyl elements,
give the same tensor inner product by Haar invariance and the
unitary action rep. This uses the SAME F and rep on both factors.
At |c|<=1 the normCorrelation scalar is zero (k>1). Thus the
top chart choice is harmless, conditional on the native Cartan
decomposition and compact support theorem. Keep those premises.

The native descent integral_succ_floor_eq uses a floor law
theta_i=(c -> v(c)^-1)_*(density(c)dc) * zeta, with zeta
supported on the indicated floor-unipotent subgroup. Its integrability
uses formMajorant; the change of variables identifies the joint
measure in the double integral with the floor law, and the Fourier
weight is psi(eta * frameGram(v(c))_ii). For the top floor the
density is sphereDensity(k,|c|^2-1); the exact normalization
A lambda^2 density = openCellConst/I0^2 *
max(|c|^2-1,0)^(k-1) agrees with the product of the Xi scalar
factors after multiplying by headDensity. This records the actual
consumer interface; a complete reconstruction of the joint-law
identity and the lower-floor Heisenberg/Plancherel estimates is
still required. In particular the Fourier transform identity
in SieveSystem and the unequal-head decay cannot be deduced from PSD.

4. Graph / scope.

Original source path retained:
 complex gauge + near-point/minor support + floor measure
 -> LocalTheorem (formMajorant, two frequency modulus estimates,
    integral_succ_floor_eq, compact support)
 -> ComplexShells (shell sum, norm_floorForm_le)
 -> BandLimits (J family, bottom Schur, top Gram)
 -> BesselSystem.HasBandLimits
 -> Filling.Moments.energy_fixingSet_le
 -> Filling.FillingTheorem -> Data.enough_forms -> star_inequality.
Candidate reduced human bottom and exponent arguments above;
no native deletion, no new axiom evidence, no new root discharge.
Remaining primitive suppliers: shell cap/geometry and both local
Fourier bounds; full joint-law descent; CrudeEnergy.sum_pairWeight_le
via BlockBound (actual total <=2 tailScale^2) and amplitude
absolute convergence. Preserve peers' exact normalizations and
original/reduced graphs. The earlier 4.33 rh_prune/rh_scan/rh_auto
engines are not executable against this 4.35 source in this
container (command -v lean/lake returned no path). Existing bounded
compact run 45799225653 was fetched from GitHub Actions and has
status completed/conclusion success; it is not a replay of this file.
Below is a prepared scalar certificate and native theorem/axiom
audit, NOT executed. No full-build/workflow modification.

RESUME HERE: derive the actual shell geometric cap argument and
the two Fourier modulus inequalities in LocalTheorem (char and
unequal heads) from the named floor Parseval/quadric bounds; use
BlockBound.sum_pairWeight_le as the parallel remaining crude
energy supplier. Do not redo the Schur/exponent calculations or
the peer Siegel normalization. HANDOFF TO integration, editor,
audit, shared compact kernel runner.
-/

namespace RHPositivityCompact

/-- Exact squared-norm error cancellation used in the bottom band. -/
theorem bottom_cut_error (a d e : ℝ) (ha : 0 ≤ a)
    (h : a ≤ d + e) : a^2 ≤ d^2 + 2*a*e := by
  have hmul : 0 ≤ a * (d + e - a) :=
    mul_nonneg ha (sub_nonneg.mpr h)
  nlinarith [sq_nonneg (a-d)]

/-- Cancel the test-set energy only in the positive case. -/
theorem schur_energy_cancel (E Q : ℝ) (hE : 0 ≤ E)
    (hQ : 0 ≤ Q) (h : E^2 ≤ Q*E) : E ≤ Q := by
  by_cases h0 : E = 0
  · simpa [h0] using hQ
  have hp : 0 < E := lt_of_le_of_ne hE (Ne.symm h0)
  exact le_of_not_gt fun hn => by
    have hh : 0 < (E-Q)*E := mul_pos (sub_pos.mpr hn) hp
    nlinarith

#print axioms bottom_cut_error
#print axioms schur_energy_cancel
#check IsCutBessel.formConst_mul_lintegral_le
#check IsCutBessel.norm_floorForm_le
#check IsCutBessel.continuous_sieveVector
#check hasBandLimits_of_isCutBessel
#check Gauge.formModulus_sq_le_of_char
#check Gauge.formModulus_sq_le_of_heads
#print axioms IsCutBessel.norm_floorForm_le
#print axioms hasBandLimits_of_isCutBessel

end RHPositivityCompact
