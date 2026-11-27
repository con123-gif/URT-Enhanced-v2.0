import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
# RUN66 — off-congruence shell cap and the actual fixed-lines bottom caller
27 November 2026. Human source-matched derivation, not a new kernel replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 preserved separately.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, protocols and
RUN65 a1532be3c9df6dc651281e28a1ef9097c3b2c3a1 read. Peer heads
7fbfc4ba, 67dc9549, aaf2100d, 570210d3, b1451de3, f90ecb3 checked.
Do not repeat the completed cone and fibre majorants.

## 1. The cap at a noncongruence position
Source New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111,
exists_unit_mem_floorValues, exists_close_of_inner_ne_zero,
floorZeroForm_le_main_term; New/Filling/StandardLevel.lean
ec149f4a38c54931f75c7e106ce94d1d6e65c5a4 (gauge at alpha=1).
Write K0=F.congGroup, K=integral unitary group, K0<=Z<=K,
n=Shape.n=rho+1, s=F.volumeExponent, w=vol(R minus R^x),
e=min(w,1/2), Gamma=h.gauge at alpha=1, so Lambda=2.
Let x be in F.positions but outside K0. For any y with the
native W_Z(y), W_Z(yx) inner product nonzero, there are u,v in
BesselU such that uy,v(yx) are in the integral box and their
difference divided by the level g is of size 2.
At each floor i<rho the primitive-matrix lemma
exists_unit_mem_floorValues gives c_i in A^x intersect R, in
floorValues(i,y,x), with vol(floorValues)<=md(c_i).
Here A^x does NOT imply that c_i is a unit of R.

If c_i is not a unit of R, c_i R is contained in R minus R^x
(a product in R cannot be invertible unless each factor is).
Its Haar measure is md(c_i) since vol(R)=1. The native
exists_ideal_cardQuot_eq also realizes md(c_i) as reciprocal
of the finite index of the principal ideal c_i R. Since 1
does not belong to this ideal its index is >=2. Consequently
vol(floorValues(i,y,x)) <= md(c_i) <= min(w,1/2)=e.
This handles all local places simultaneously, not just a DVR.

If no floor is capped, every c_i is therefore an R-unit.
These SAME floor witnesses then meet the integral-gauge
premises of hasMatSize_sub_one_of_floorValues at j=0,
p=q=1: they are in floorValues and c_i lies in size 1;
all auxiliary near-0 assertions are automatic (the group
element can be moved to the box by its inverse).
The close-pair witnesses above supply the remaining premise.
That lemma gives g^-1(x-I) integral entrywise. Since x is
unitary, the native mem_unitaryLevel criterion gives x in
K0, a contradiction. Thus one capped floor exists at every
nonzero inner-pair encountered in pivot descent. Retain the
primitive-matrix and frame/gauge lemmas, not a claim that
the cap follows from abstract Haar alone. No choice of
independent level or comparison matrix has been made.

## 2. From the cap to the complement bound
Source New/RealPlace/LocalTheorem.lean
671350f97491467f09b80eafa0df13685dd8ddc6:
Gauge.pivotModulus_sq_le_of_capped; Level.formMajorant,
Gauge.selfNormProduct; Level.IsCut.formModulus_le_formMajorant.
New/RealPlace/LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e
and FloorKernels.lean 594b1553ed02ba5c074180fb32d0f5215918ad52.
At j=0 the empty head has density one, weyl element and ratio
are identity, descConv of zero floors is dirac(1), and
floorWeight(0)=1. Let B(x) be pivotModulus(0,k,1,x)^2,
where k is the self-translate pairing of W_Z. Then
formMajorant(0,1,1,W_Z,W_Z,x)=B(x). The nonnegative
f=1_(G minus K0) B is pointwise <= formMajorant.
For x in the positions outside K0 the cap lemma supplies
  B(x) <= e^s Lambda^(10000 n rho) selfNorm(0,k,x).
For x in K0 the function f is zero. Squaring and using the
actual globalConst allowance (3*10^6 n^3 in selfNormProduct)
absorbs 20000*n*rho, since rho<n. This gives precisely
  f(x)^2 <= e^(2s) Gamma.selfNormProduct(0,1,1,W_Z,W_Z,x).
The native inequality is interpreted in nonnegative extended
reals, including e=0 and zero kernels; no division by e.
The norm of the upper pairing is bounded by its pivot modulus.
By enorm_integral_phase_eq_upperPairing the complement of
floorZeroForm is at most v^2 * integral f, v=unipotentMass.

Apply the actual lintegral_shells_le with exponent
  T=t+1+n+A, A=10^9*n^4,
not t. Original rank guard t+10^10*n^4 <= Shape.k implies
T+10^8*n^4<=Shape.k because n>=1 and n+1<=2*n^4.
The shell theorem gives integral f <= e^T*r*2^A,
r=M(Z)*M(K0)/v^2. The cancellation is exact:
  e^T*2^A = e^(t+1)*e^n*(2e)^A <= w^(t+1)*2^(-n).
No further zeta loss, and no inverse e used. Multiply by v^2
to cancel the mass ratio and add the K0 contribution
M(Z)^2*M(K0) from RUN65. Therefore
  kappa(Z) <= M(Z)*M(K0)*(M(Z)+w^(t+1)*2^(-n)).
This reconstructs the bottom shell consumer CONDITIONAL ON
the general lintegral_shells_le theorem, not a proof of that
theorem's entire content-ideal partition estimate.

## 3. The actual caller uses K, not merely Z
Source New/Filling/FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9
IsFillingLevel.exists_intermediateGroup_lines and
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
Filling.IsFillingLevel.exists_finite_sieveSystem.
This corrects the incomplete caller description in RUN65:
the Z selected by fixed lines is essential for the saving,
but the bound floorZeroForm_le_main_term is called on K at t=0.
Set B0=(b^(6*Shape.k))^#Sg. The SAME Z from FixedLines satisfies
  kappa(Z)*M(K)*B0 <= kappa(K)*M(Z).
This is not a monotonicity inequality for arbitrary Z; it
is the quantitative fixed-line construction. All M(K), M(Z),
M(K0), v, B0 are positive finite. Both r and B0 are nonzero.
At floor zero, the integral bound Level.enorm_floorForm_le
and the phase/upper-pairing identity give
  norm(floorForm(0,1,1,W_Z,1)) <= kappa(Z)/v^2.
In fact this is the source comparison used in the final field
of exists_finite_sieveSystem. Hence with r(Z)=M(Z)*M(K0)/v^2:
  norm(floorForm/r(Z)) <= kappa(Z)/(M(Z)*M(K0))
    <= kappa(K)/(M(K)*M(K0)*B0)
    <= (M(K)+w*2^(-n))/B0
    <= (1+2*2^(-n))/B0
    <= (1+b^(-6))/B0.
Here w<=1, M(K)<=1+2^(-n) (RUN64/65), and the final
2*2^(-n)<=b^(-6) is the native scale supplier pow_six_le
used at this caller. The saved factor B0 comes ONLY from
FixedLines, not from the cap or the Haar normalization.
This is exactly the bottom-bound field of the SieveSystem.
Retain the separate frequency bounds, top kernel PSD,
local constancy, integrability and every SieveSystem premise.

## 4. Frontier / evidence
Original source-visible local graph:
primitiveMatrix+close pair+frame reconstruction -> cap ->
pivotModulus_sq_le_of_capped -> complement estimate via
lintegral_shells_le -> floorZeroForm_le_main_term(K) ->
exists_intermediateGroup_lines+groupMeasure_boxSet_le+
pow_six_le -> exists_finite_sieveSystem -> Filling.Moments -> B.
Reduced local human graph: principal ideal dichotomy -> capped
floor -> same kernel at j=0 -> aggregate shell exponent ->
exact fixed-lines mass cancellation -> same bottom field.
Do not delete general lintegral_shells_le or FixedLines:
they are retained as distinct substantive suppliers, plus
frame/gauge and primitive matrix hypotheses. No global edge
removed. Context key (compact pin,F,g,Z,K0,K,Sg,d,t,rank,
integral gauge,actual same W_Z). No old graph/axiom file altered.
No URT premise or RH theorem imported. No finite simulation.

Local command -v lean/lake/elan found none. Actual old-pin
status files b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 read: runs
45577239749 and 45576756833 pass, not this compact derivation.
Compact status a56e2d3afb99ed8275e81fd63c8494306e57c43f
and targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804
read: run 45803534769, six named checks in TiltingLemma and
Filling.Moments, standard three axioms; A module timeout 124;
all_requested_checks_ok=false, full_RH_replay=false.
New certificates below prepared, uncompiled. No fresh
rh_scan/prune/reduce/auto/frontier on the compact toolchain.
Request shared native runner only, no protected workflow change.
Independent audit required (especially use of integral frame
witnesses and the FixedLines supplier).

RESUME HERE: reconstruct the actual general lintegral_shells_le
content-ideal partition and the fixed-line one-prime saving,
using RUN64's ideal-shell moment only after matching exact
exponents and context. Integrate bottom consumer with positivity
and editor; retain all other A/B/C, Landau and Rallis/Siegel-Weil
obligations. HANDOFF TO integration, positivity, audit, kernel.
-/

namespace CompactRun66

theorem shell_power_split (e : ℝ) (t n A : ℕ) :
    e^(t+1+n+A)*2^A = e^(t+1)*e^n*(2*e)^A := by
  rw [pow_add, pow_add, mul_pow]
  ring

theorem rank_room (n t k : ℕ) (hn : n + 1 ≤ 2*n^4)
    (h : t + 10^10*n^4 ≤ k) :
    t+1+n+10^9*n^4+10^8*n^4 ≤ k := by omega

theorem fixed_lines_cancellation (z k c v b kz kk : ℝ)
    (hz : 0 < z) (hk : 0 < k) (hc : 0 < c)
    (hv : 0 < v) (hb : 0 < b)
    (h : kz*k*b ≤ kk*z) :
    (kz/v^2)/(z*c/v^2) ≤ kk/(k*c*b) := by
  have he : (kz/v^2)/(z*c/v^2) = kz/(z*c) := by
    field_simp <;> ring
  rw [he]
  apply (div_le_div_iff₀ (mul_pos hz hc) (mul_pos (mul_pos hk hc) hb)).2
  calc
    kz*(k*c*b) = (kz*k*b)*c := by ring
    _ ≤ (kk*z)*c := mul_le_mul_of_nonneg_right h hc.le
    _ = kk*(z*c) := by ring

#print axioms shell_power_split
#print axioms rank_room
#print axioms fixed_lines_cancellation
#check IntegralPlace.IsStdLevel.exists_unit_mem_floorValues
#check IntegralPlace.IsStdLevel.exists_close_of_inner_ne_zero
#check Gauge.pivotModulus_sq_le_of_capped
#check IntegralPlace.IsStdLevel.lintegral_shells_le
#check IntegralPlace.IsStdLevel.floorZeroForm_le_main_term
#check Filling.IsFillingLevel.exists_intermediateGroup_lines
#check Filling.IsFillingLevel.exists_finite_sieveSystem
#print axioms IntegralPlace.IsStdLevel.lintegral_shells_le
#print axioms IntegralPlace.IsStdLevel.floorZeroForm_le_main_term
#print axioms Filling.IsFillingLevel.exists_intermediateGroup_lines
#print axioms Filling.IsFillingLevel.exists_finite_sieveSystem
end CompactRun66
