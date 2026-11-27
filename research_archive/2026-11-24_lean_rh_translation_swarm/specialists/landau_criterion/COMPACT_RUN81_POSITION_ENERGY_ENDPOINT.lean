import New.RealPlace.LocalTheorem
import Mathlib.Tactic

/-!
# RUN81 — positions energy, one exact endpoint modulus
27 November 2026. B3 actual caller reduction, human source-matched,
native replacement candidate PREPARED, NOT compiled. RH OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine
4878ea106b791c42b5f5a45810162de59701c4d9, ledger
01fa22a6b12abad5ccf580d2621f82be3bf70c13, AGENTS and continuity read.
Reviewed swarm/handoff/expansion, RUN67 bc57e009bf172e674db67f361f593f132ddf0fc0,
RUN78 dbcd1a688baab80f193924d0a091d1d731d7b37e,
RUN79 1b7b709e08397f7672dc1367b8e6896f31711c81,
RUN80 14fb51714675c109cfe24965e0fc768073607e05 and peer first-hit
6c89e37200988fbe2ceae312106d09cd65433494. E1 already audited;
do not reopen. This is NOT another capped-pivot or content-shell proof.

## Actual shared supplier and its finite floor sum
LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6,
117–176 lintegral_selfNorm_le and 323–343 lintegral_positions_le.
Fix SAME F,T,j,p,q,W,W',Gamma,Gamma', measures; n=rho+1,
j<=rho. W cut, W' Bessel; k=<W,W>, k'=<W,W'(w_q^-1 w_p .)>.
Let S'=Gamma'.positionsOfSize, and put
 C=prod_{a<rho} floorConst(Gamma',a)
  = (prod_{a<rho} fl_a(g)) c^(card(iota)*rho) Lambda'^(4600*n*rho).
A=pairingNorm(W,W), B=pairingNorm(W,W'). Keep all native
measurability, Haar and kernel hypotheses; do not replace the
cutoff by an unrestricted volume integral.

The native selfNorm bound is int_{S'} Z_l <= n C N(k),
where N(k) is the upperMeasure(0) double integral of |k|^2.
The source proof uses the backward invariant
 l C N(k) + int_{S'} Z_l <= n C N(k).
Its other invariant is the scaled energy Q_l E_l <= C N(k)
for the same suffix measure rho_l of groupMeasure =
 ascConv(heisenbergMeasure,l) * rho_l,
 Q_l=prod_{a<l} (if a<rho then floorConst(a) else 1).
Here E_l is the native integral of Phi_l(g,y) against rho_l
and descConv(floorMeasure,0,l+1);
 W_l(g,y)=int 1_{S'}(g^-1 nu y) d(ascConv heisenbergMeasure l)(nu),
 Phi_l=min(infinity*W_l, |upperPairing(l+1,k,g,y)|^2).
At l=n the remaining selfNorm is zero and the cutoff energy
is at most the full N(k). The backward step applies
parseval_heisenbergMeasure_of_box with frequency F.g^-1
and scaling F.g, whose PRODUCT is 1. Thus the gain is c^card(iota)
rather than (c/md(g))^card(iota); floorConst already includes
the floor modulus and the chart bound. At the last floor use
heisenbergMeasure_eq_dirac_one, the native measureH and
pivotModulus_sq_le. The new suffix measure is the convolution
of that Heisenberg measure with the old suffix measure.
The selfNorm_eq_add_succ increment is bounded by C N(k)
using the same E_l invariant, Haar transport x -> g^-1 nu y,
and lintegral_floorWeight_le. This explains the existing
aggregate budget, not a new proof of the two quantitative
chart estimates. In finite values it is simply a sum of
at most n-l contributions each <= C N(k); do not subtract
infinite ENNReal quantities. Keep native invariant for
the general extended-real case.

## Exact cancellation before the global norm
LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e
89 floorModulus and 144–155 lintegral_weylRatio_mul.
LocalTheorem 32 headDensity, 80 selfNormProduct.
For a<j define d_a=k+1+2(rho-(a+1)) and
 P_a=md(p_a), Q_a=md(q_a), all positive finite.
Since a<j<=rho, d_a+1=k+2(rho-a) EXACTLY.
Define D=headDensity(j,p,q), U=prod_{a<j} fl_a(p_a^-1),
 R=prod_{a<j}(P_a/Q_a)^(d_a+1).
R is the precise change of the second upperMeasure energy,
so N(k')=R B (not its reciprocal).
Cauchy–Schwarz in positions, applying the two native selfNorm
bounds, yields, in squared form,
 (D int_S f)^2 <= e^2 globalConst^3 (n C)^2 A B D^2 U^2 R
when S subset S' and f^2<=e^2 selfNormProduct on S.
All factors in D,U,R are finite positive; no division by
A,B,Theta or an integral. Zero and infinity branches follow
the native ENNReal inequality and Cauchy-Schwarz. For each a,
 (P_a Q_a)^d_a P_a^(-2d_a-1) (P_a/Q_a)^(d_a+1) = Q_a^-1.
Consequently, the EXACT global identity is
 D^2 U^2 R = md((prod_{a<j} q_a)^-1).
All p factors cancel, all d_a disappear, and ONLY the
endpoint modulus of q survives. For j=0 every product is
empty and the identity equals 1. This is why bounding each
individual p or q separately would produce a spurious cost.
With A B<=Theta^2, write M=md((prod q)^-1). The bound before
the gauge budget is e*globalConst^(3/2)*n*C*Theta*sqrt(M).
The native hq implies M<=Lambda already by md_le at size 1
(Size.lean 3b57ba677471f6d26fceca1a7990eaac9bffa3db, 54).
For the ORIGINAL output it is sufficient to assume only
 M<=Lambda^2; this also covers sequences q that are not
heads at every prefix. n<=2^n<=Lambda'^n, and
 4600*n*rho+n<=50000*n^2, so the original output follows.
No head assumption on p is needed at THIS theorem.
Do not remove the full two-head hypotheses in Fourier,
near-chart or TopFloor.lintegral_shells_le: they have other
consumers. The endpoint weakening is local, not global.

## Actual caller replacement, not an illustrative scalar lemma
Below is the native positions theorem with only the hq binder
and its sole explicit proof use replaced. Automated source
text guard checked that hq occurs exactly twice in the
pinned excerpt: declaration binder and md_le call. The
original-statement bridge uses the same md_le 2 witness.
This is an executable candidate for the shared compact runner;
not a claim the kernel has elaborated it, or that no implicit
tactic dependence on hq exists. The helper below captures
the exact scalar identity independently of the gauge.

Attach to TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111,
275–333 lintegral_shells_le at the SAME shell gauge Gamma',
same Gamma,p,q and f. RUN67 already supplies the content
partition, cap and zeta budget under retained primitives;
the actual positions inequality is its missing local
assembly. RUN79/80 supply either Fourier square gain on
positions; RUN78 uses it at t+12 with one denominator ideal.
Thus the original finite Fourier bound at TopFloor 349–382
is recovered conditionally, with no additional modulus loss.
The remaining actual geometric supplier to prove/audit is
the floor-weight integral lintegral_floorWeight_le, including
the common-chart support and measure invariance; it is not
implied by the endpoint identity.

Original visible graph:
 TopFloor.enorm_floorForm_le -> lintegral_shells_le ->
 Gauge.lintegral_positions_le -> {lintegral_selfNorm_le,
 lintegral_weylRatio_mul, sq_lintegral_le, md_le, IsHead}.
 lintegral_selfNorm_le -> {selfNorm_eq_add_succ,
 lintegral_floorWeight_le, parseval_heisenbergMeasure_of_box,
 lintegral_floorMeasure_congr, pivotModulus_sq_le}.
Reduced candidate: same graph except replace local full q-head
binder by endpoint M<=Lambda^2, retaining original bridge.
No kernel edge removal certified; original and reduced graphs,
unresolved B1–B4, A/C, star and E1 evidence untouched.
Cache key pin,F,T,j,p,q,W,W',Gamma,Gamma',S,f,e,Theta,
same measures, and actual endpoint modulus; no cache across
different shells. Rejected route: dropping head constraints
globally or bounding the two head products independently.

Verification: local command -v lean/lake and ~/.elan/toolchains
found no toolchain. Native rh_scan/prune/reduce/auto/frontier
not executed. Source-match and exact source transformation
guard executed; all Lean code below is UNCOMPILED.
Re-read old-pin status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717, actual pass for
45577239749 and 45576756833 only. Shared B2 receipt
3e895c6d07f50b3b18e3591d288de51c896deef7 confirms seven
declarations and separate counting module passed; aggregate
graph ERROR in 46006832164. No new B3 CI PASS, no URT claim,
no shortcut via RH. Do not launch duplicate shared runner.

RESUME HERE: derive Gauge.lintegral_floorWeight_le
(WeightPlancherel.lean 62–90) at the actual selfNorm consumer,
using the single transported chart and exact floor-weight
recurrence; preserve its support and fibre hypotheses.
HANDOFF TO integration/editor/positivity/audit/shared runner:
replay the endpoint replacement and original-type bridge in
existing compact batch; no protected workflow edit.
-/

open Matrix MeasureTheory Measure ENNReal Fintype ComplexConjugate InnerProductSpace Level Finset
  Function RCLike Place
attribute [-simp] Subtype.forall Subtype.exists inv_mul_cancel₀
noncomputable section
variable {A} [CommRing A] [StarRing A] [TopologicalSpace A] [MeasureSpace A] [P : Place A] {ι}
  [Fintype ι] {m} {𝔰 : Shape} (j : ℕ) {T : 𝔰.Form A} [IsHermUnit T.splitGram] {F :
  Level ι T m} (p q : ℕ → Aˣ)
  {ξ : Aˣ} {I : Type} [Fintype I] (W W' : T.G → EuclideanSpace ℂ I) (x : T.G) (Γ Γ' : Gauge F)
attribute [local simp] mul_assoc div_eq_mul_inv formIntegrand formIntegrandOne
  Fin.prod_univ_castSucc floorModulus floorForm lintegral_prod lintegral_mconv_symm
  ENNReal.inv_mul_cancel_left ENNReal.mul_inv_cancel prod_range coe_weylRatio weylRatio_inv
variable {j p q W W' x} (hk : F.IsCut W) (hk' : IsBessel W' F.g⁻¹) (hj : j ≤ 𝔰.ϱ)
  (hp : Γ.IsHead j p) (hx : x ∈ F.positions)
variable [F.groupMeasure.IsHaarMeasure]
include Γ hk' hj

lemma Gauge.lintegral_positions_le_endpoint (hQ : P.md ((∏ a ∈ .range j, q a)⁻¹ : Aˣ) ≤ Γ.Λ ^ 2) {Θ S e} {f : _ → _} (hΘ :
  F.pairingNorm W W * F.pairingNorm W W' ≤ Θ ^ 2)
  (hS : S ⊆ Γ'.positionsOfSize) (h : ∀ x ∈ S, f x ^ 2 ≤ e ^ 2 * selfNormProduct j p q W W' x Γ) :
  F.headDensity j p q * ∫⁻ x in S, f x ∂F.groupMeasure ≤ (e * ∏ l ∈ range 𝔰.ϱ, F.floorModulus l) *
  P.c ^ (card ι * 𝔰.ϱ) * Γ.Λ ^ (1500000 * 𝔰.n ^ 3) * Γ'.Λ ^ (50000 * 𝔰.n ^ 2) * Θ * Γ.Λ := by
  obtain ⟨k, k', _, _⟩ := Γ.isPairingKernel_self hk _, Γ.isPairingKernel_translatePairing hk hk' ..,
    hk.stronglyMeasurable, hk'.stronglyMeasurable
  grw [← ENNReal.pow_le_pow_left_iff two_ne_zero, mul_pow, mul_pow, mul_pow, ← hΘ, ← hQ, setLIntegral_mono _ fun x m ↦ (le_rpow_inv_iff two_pos).2
    (mod_cast h x m), lintegral_mono_set hS, sq_lintegral_le _ _ fun x ↦ by exact
    ((rpow_inv_natCast_pow two_ne_zero _).trans_le (mul_assoc ..).ge), lintegral_const_mul,
    lintegral_const_mul, Γ'.lintegral_selfNorm_le k zero_le rfl, Γ'.lintegral_selfNorm_le k'
    hj congr(_ * ∫⁻ g, $(lintegral_weylRatio_mul (Φ := (‖⟪W g, W' ·⟫_ℂ‖ₑ ^ 2)) hj ?_) ∂_),
    lintegral_const_mul, 𝔰.n.lt_two_pow_self] <;> try fun_prop [selfNormProduct, selfNorm]
  simp [Level.pairingNorm, -md_inv]; grw [Γ'.two_le_and_pairs_le.1, ← ge_iff_le]; ring_nf
  simp_rw [mul_assoc]; gcongr <;> simp [headDensity, ← map_mul, ← prod_pow, ← prod_mul_distrib,
    ← map_pow, pow_right_comm _ _ 2, ← Finset.prod_inv_distrib, ← rpow_two, -md_inv, -rpow_ofNat]
  convert le_rfl; norm_cast; apply Additive.ofMul.injective; simp; match_scalars <;> grind

lemma Gauge.lintegral_positions_le_endpoint_bridge (hq : Γ.IsHead j q) {Θ S e} {f : _ → _} (hΘ :
  F.pairingNorm W W * F.pairingNorm W W' ≤ Θ ^ 2)
  (hS : S ⊆ Γ'.positionsOfSize) (h : ∀ x ∈ S, f x ^ 2 ≤ e ^ 2 * selfNormProduct j p q W W' x Γ) :
  F.headDensity j p q * ∫⁻ x in S, f x ∂F.groupMeasure ≤ (e * ∏ l ∈ range 𝔰.ϱ, F.floorModulus l) *
  P.c ^ (card ι * 𝔰.ϱ) * Γ.Λ ^ (1500000 * 𝔰.n ^ 3) * Γ'.Λ ^ (50000 * 𝔰.n ^ 2) * Θ * Γ.Λ := by
  exact Γ.lintegral_positions_le_endpoint Γ' hk hk' hj
    (Γ.md_le 2 _ (Γ.mem_ofSize_mono (hq j .refl))) hΘ hS h


namespace CompactRun81

theorem density_factor {G : Type*} [CommGroup G] (p q s : G) (d : ℕ)
    (hs : s^2 = p) :
    (p*q)^d * ((p^d*s)⁻¹)^2 * (p/q)^(d+1) = q⁻¹ := by
  have hA : ((p^d*s)⁻¹)^2 = ((p^d)^2*p)⁻¹ := by
    rw [← inv_pow, mul_pow, hs]
  rw [hA, mul_pow, pow_succ (p/q), div_pow]
  group

#print axioms density_factor
#print axioms Gauge.lintegral_positions_le_endpoint
#print axioms Gauge.lintegral_positions_le_endpoint_bridge
#print axioms Gauge.lintegral_positions_le
#check Gauge.lintegral_selfNorm_le
#check Gauge.lintegral_floorWeight_le
#check IntegralPlace.IsStdLevel.lintegral_shells_le
end CompactRun81
