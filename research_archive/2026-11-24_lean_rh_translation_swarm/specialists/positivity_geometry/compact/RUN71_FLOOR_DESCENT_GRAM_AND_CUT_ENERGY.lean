import New.RealPlace.BandLimits
import New.Filling.FillingData

/-!
RUN71, 27 Nov 2026 — exact real-place band consumer.
Status: human source-matched partial reconstruction, not native verification.
Credit: Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first);
manuscript 963e42122931b8e534c39765bb2a7422b2c557d7, RUN70 2952c52c.
Actual consumer Data.exists_besselSystem, FillingData.lean
0ef8b0dfe13173b16bd0a8820a4924f10124e278, hasBandLimits_of_isCutBessel.
Keep the actual F=cut, W=full, degree d>0, representation and Haar.
Use I nonempty, m=card I, n=rho_index+1, k=rank X0, r=k+2n-1,
R=b^(6n+2) (native rho), c=volU(k)/volU(r), lambda=haarRatio>0 finite,
Theta=c*pi^((2n-1)k). M=lambda*Haar and c*lambda<=1.
Norm_Q(F)^2<=m; Norm_Q(F-W)^2<=m*b^(-10r²);
Schur bound W with constant m/d; d*Theta<=b^(4r²) (RUN70).
Source ComplexGauge.lean 86c2d26bfaf34292de7d1e79c1634b020b26c1f3,
ComplexShells.lean 351cfdf7fa54238f79b1b950c3532feef1f74f53,
BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058.
The same R, lambda, m and degree must survive all three arguments.

1. Exact floor recursion (LocalTheorem.lean
671350f97491467f09b80eafa0df13685dd8ddc6, lines 261-324).
Write mu_j=floorMeasure j, M_j=stackMeasure 0 j and
K_j(g,y)=upperPairing j of <F(g),F(y)>; K'_j similarly for
the pair with twist d_j=w_q^-1 w_p. Upper convolution
upperMeasure j=upperMeasure(j+1)*mu_j gives, pointwise,
K_j(g,gx)=int K_(j+1)(sigma g,sigma gx) dmu_j(sigma).
For weight omega=1 the product with conjugate K'_j expands exactly
as the double integral in formIntegrand. No independent norms yet.
At the general descent use mu_j=(dc withDensity rho_j).map(v^-1)*zeta,
where zeta is carried by unitriGroup(j+1) intersect GT_j.
In the product measure on x,g,sigma,tau, substitute tau from the
above convolution, move the zeta-factor into the other kernel by
right invariance of mu_j for that subgroup, and use the two
upperPairing invariances. The frameGram diagonal is unchanged by
this unipotent factor (frameGram_diag_mul); the two character factors
are unitary and cancel in the product. This identifies the laws
of the two integrands in integral_succ_floor_eq: one has
phase psi(eta*Z(v(c))_jj), w_p v(c), g distributed according to
(zeta*mu_j)*M_j, and c with density rho_j; the other has
phase psi(eta*Z(sigma tau^-1)_jj), sigma w_p tau^-1, sigma g,
with independent sigma,tau distributed as mu_j and g as M_j.
This is equality of pushforward measures, not an assumption of
pointwise equality before translating g. Retain actual
lintegral_floorMeasure_mul_right, frameGram_diag_mul,
upperPairing_invariant and the chart/group measure laws
(LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e).
The absolute integral on the second side is bounded by
int formMajorant j p q F F dM, finite by
IsCutBessel.lintegral_formMajorant_ne_top. Hence Tonelli then Fubini,
and the identical law transports integrability to the first side.
Density conversion to dc is legitimate since rho_j finite a.e.
At j<rho_index, v(c)=floorWeyl j c a.e. and rho_j(c)=|c|^(2d_j*)
where d_j*=k+1+2(rho_index-j-1). Updating both heads to c
multiplies headDensity by |c|^(2d_j*) exactly. Thus
 int psi(eta c) J_(j+1)(p[j:=c],q[j:=c]) dc
 = formConst * floorForm j p q F (psi(eta Z_jj)).
This recovers the actual recursion with t=formConst. The bound for
the right side is the existing norm_floorForm_le applied to
formModulus_sq_le_of_char (not derived here).

2. Top Gram and normalization.
LocalTheorem lines 209-229, BandLimits.lean
20ff4e65c2599fc8b752dbb93673ed65053e2216, top branch.
Let A_p=w_p cellChart(z) for p_last=q_last=z.
Jraw(A)_ij=int F_i(y) conj(F_j(A^-1 y)) dy.
Because I finite, expanding the Hermitian Gram entry yields exactly
 <Jraw(A_p),Jraw(A_q)>
 = int_(GxG) <F(y),F(y')> conj(<F(A_p^-1 y),F(A_q^-1 y')>) dy dy'.
The product in each coordinate has compact support:
Gauge.hasMatSize_of_ne_zero places y (resp y') in the closed bounded
unitary matrix box for its actual head and GT_rho chart.
The Haar measure is finite on it and F continuous, so Fubini applies.
This is the native inner_besselCorrelation, with inner conjugate-linear
in its first variable. A finite linear combination gives norm-square,
so top Gram PSD without a new positivity hypothesis. Continuity
uses the same compact box locally uniformly in p and q (heads
chosen at the point with the extra gauge margin), continuous charts
and weights, and dominated convergence; keep the native gauge bound.
For |z|>1 the final chart density is
 D(z)=sphereDensity(k,1)*(|z|²-1)^(k-1),
from ComplexPlace.lean 74d2fd4581e30ba76a2c6dbd7604848bf7e6f3d0,
lines 81-123. At |z|<=1 it vanishes (k>1). The product of
the two normalizing weights in normCorrelation is EXACTLY
 c D(z)/m² * headDensity rho_index p q.
In the last floor apply integral_succ_floor_eq with the final
cellLaw and compact H measure. The two Haar group variables are
obtained by stackMeasure_top, descConv_add and M=lambda*Haar;
use compact H invariance of the same Bessel representation and
(g,x) -> (g,gx), Haar preserving. The resulting prefactor
 formConst * lambda² * D(z) * headDensity
 = (c/(lambda*m)²)*lambda²*D(z)*headDensity
 = c*D(z)*headDensity/m²
is precisely the weight above. No extra degree, factorial or Haar
factor. Retain the exact stack convolution law and H-equivariance.
For arbitrary sigma in GT_rho with top diagonal z, the native
Cartan decomposition gives sigma=h cellChart(z) h' with compact
h,h' in U(X0). Both p and q use the SAME h,h'; their Weyl
heads commute with H. Change Haar variables by h and apply the
same unitary representation on both kernel arguments to preserve
the Gram entry. This is the isometry clause of HasBandLimits.
The Cartan bridge follows by sending the X0 component of sigma*z0,
of norm sqrt(|z|²-1), to the chosen coordinate by a unitary; the
remaining transformation fixes z0 and is in H. Keep the exact
negative-vector orbit and stabilizer premises. No claim of
independent reconstruction of all gauge/measure laws.

3. Bottom energy: avoid a triangle bound on the full correlation.
At j=0, headDensity=1, w_p=w_q=1, M_0=delta_identity.
Define a(x)=upperPairing 0 of <F(g),F(gx)> at (1,x);
delta(x)=upperPairing 0 of <F(g),W(gx)> at (1,x).
Then bottom form is formConst*int |a|² dM. For every x,
 |a|² <= |delta|² + 2|a|*|a-delta|
by |delta|>=|a|-|a-delta| or direct complex expansion
(|a|²-|delta|²=2Re(conj(a)(a-delta))-|a-delta|²).
Here a-delta is the upper pairing with F-W; not a second full norm.
The absolute cross product is bounded by formMajorant 0 p q F (F-W)
using the two kernel laws and the upperPairing-to-pivot inequalities.

Exact Schur step: delta(x)=lambda int_Q <F(g),W(gx)> dg_Q.
Both kernels have the same unitary left-unipotent character so their
inner product is quotient invariant. For any measurable s with
finite Haar measure, beta=1_s*conj(delta) is bounded and integrable
by the uniform kernel bound k'.exists_lintegral_le, and in L².
Put E_s=int_s |delta|² dx. Fubini is valid since int |beta| times
the uniform absolute kernel integral is finite. Then
 E_s=lambda int_Q <F(g), int beta(x)W(gx) dx> dg_Q.
Cauchy-Schwarz, Norm_Q(F)^2<=m and Schur(W)<=m/d yield
 E_s² <= lambda² m² E_s/d.
For E_s=0 trivial, otherwise cancel E_s>0. Haar sigma-finite and
monotone convergence give int_G |delta|² <= lambda² m²/d.
Thus formConst*int |delta|² dM <= c lambda/d <= 1/d.
No global L² assumption on delta before truncation.

For the error use formConst_mul_lintegral_le at j=0, L=R,
t=1, W'=F-W, epsilon=b^(-5r²). Its support hypothesis holds
because if F-W nonzero then IsNear at floor 0 with witness y^-1,
as in BandLimits. The actual bound for twice the majorant is
 <=2 Theta R^(10^9 n^4+24k) b^(-5r²).
Use d Theta<=b^(4r²) BEFORE estimating powers. Since
n>=10^8, k>=n^7, r>=k, and 6n+2<=8n,
 (6n+2)(10^9 n^4+24k)
 <=8*10^9 n^5+192 n k <= r²/2.
Indeed n^9>=32*10^9 gives the first term <=n^14/4<=r²/4;
k>=768n gives the second <=k²/4<=r²/4. With b>=2 and
r²/2>=11, 2 b^(-r²/2)<=b^-10. This is more than sufficient,
with no additional numerical guard. Therefore the actual decisive bound
    formConst*int |a|² dM <= (1+b^-10)/d.
This supplies the bottom energy field of SieveSystem at the same
cut/full pair, not a global B theorem. Retain the shell majorant
proof and local Fourier/gauge bounds; their actual consumer is
norm_floorForm_le and the two formModulus_sq_le clauses.
Original and reduced global graphs, all pending obligations and
axiom evidence untouched. Local source edges:
enough_forms -> filling -> exists_besselSystem -> hasBandLimits
-> {floor recursion, top Gram/isometry, energy, Fourier/head bounds}.
Context cache key: compact pin, F/W/rep/d/I/lambda and head p/q.
No global node pruned. No URT or circular imported RH theorem.
Native Lean/Lake/elan unavailable (command -v returned no path).
Native engines not run. Fresh state branch evidence
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named checks
in TiltingLemma/Moments have standard three axioms; module_1 timeout
124 after 2700.11s; all_requested_checks_ok=false, full_RH_replay=false.
No new CI PASS. Below scalar certificates and source probes prepared only.

RESUME HERE: derive actual local Fourier/head bounds
LocalTheorem 368-443 and shell majorant 74-143 as required by
hasBandLimits, then connect the already supplied absolute exchange
to the distinct Siegel-Weil/Rallis consumers. Independent audit:
law substitution in descent, exact two-Haar top factor, finite
truncation of delta, and same F/W. HANDOFF TO integration/editor,
audit and native runner. Human RH reconstruction incomplete.
-/

namespace RHPositivityRun71

theorem cut_energy_scalar (a e : ℝ) :
    a^2 ≤ (a-e)^2 + 2*a*e := by
  nlinarith [sq_nonneg e]

theorem truncated_schur_cancel (E C : ℝ) (hE : 0 ≤ E)
    (hC : 0 ≤ C) (h : E^2 ≤ C*E) : E ≤ C := by
  by_contra hn
  have hp : 0 < E := lt_of_le_of_lt hC (lt_of_not_ge hn)
  have hmul := mul_pos hp (sub_pos.mpr (lt_of_not_ge hn))
  nlinarith

theorem shell_exponent (n k r : ℝ)
    (hA : 8*10^9*n^5 ≤ r^2/4)
    (hB : 192*n*k ≤ r^2/4)
    (hP : (6*n+2)*(10^9*n^4+24*k) ≤ 8*10^9*n^5+192*n*k) :
    (6*n+2)*(10^9*n^4+24*k) ≤ r^2/2 := by linarith

end RHPositivityRun71

#check Level.integral_succ_floor_eq
#check Gauge.integral_floorForm_succ
#check Gauge.inner_besselCorrelation
#check IsCutBessel.formConst_mul_lintegral_le
#check hasBandLimits_of_isCutBessel
#check Data.exists_besselSystem
#print axioms RHPositivityRun71.cut_energy_scalar
#print axioms RHPositivityRun71.truncated_schur_cancel
#print axioms RHPositivityRun71.shell_exponent
#print axioms hasBandLimits_of_isCutBessel
