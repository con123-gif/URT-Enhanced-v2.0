import New.RealPlace.LocalTheorem
import Mathlib.Tactic

/-!
# RUN79 — one common chart, one Fourier energy bound
27 November 2026. SOURCE-MATCHED conditional human derivation; new helper
certificates PREPARED, not compiled. RH OPEN. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read latest mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 33861bf3d18e22477f4f64693b91993fbf06b97b, ledger
d9a79b815446e5de21e207f6149432d9b478f7f7, AGENTS, continuity,
lane protocol and RUN78 dbcd1a688baab80f193924d0a091d1d731d7b37e.
E1 already has editorial audit; B2 replay is another active job.
No duplication of rational-frequency summation, B2 or final Landau criterion.
HUMAN_PROOF_COMPACT 619ae01be98c32e053eef1c8bcd44ccddd0664e7
does not name the actual character lemma or sliced Plancherel supplier.

## Actual B3 interface
LocalTheorem.lean blob 671350f97491467f09b80eafa0df13685dd8ddc6,
389–417 Gauge.formModulus_sq_le_of_char.
Keep native place A, additive character psi with modulus 1, Haar
normalizations, T.splitGram hermitian unit, n=rho+1>=1, heads p,q,
position x, cut W, gauge Gamma with Lambda>=2, unit xi and
psi(eta z)=psi(xi z) on Gamma.ofSize(200 n^2).
Do not assume the input pairing integral or that psi is pointwise
zero at nonintegral arguments. The gain is L2 Fourier cancellation.

For a fixed g in the outer stack let w_p=weylElem j p, and
f(sigma)=upperPairing(j+1,k)(sigma*g,sigma*g*x),
f'(tau)=upperPairing(j+1,k')(tau*w_p^-1*g,tau*w_p^-1*g*x),
with k=translatePairing W W 1 and k'=translatePairing W W
(weylRatio j p q). Use EXACT same position and floor j in both.
The double formIntegrand is integral of
psi(eta h(orbitPoint sigma,orbitPoint tau)) f(sigma) conj(f'(tau)),
where h(v,w)=star(v) dot (splitGram*w) by the frameGram diagonal
identity. Source explicitly rewrites to this with U.form_mulVec_mulVec.
Both f and f' integrable by FloorKernels.lean
594b1553ed02ba5c074180fb32d0f5215918ad52
IsPairingKernel.upperPairing_eq_integral_succ; boundedness gives L2
when the corresponding L1 integral is finite. The product with unit
character is absolutely integrable, so the iterated form is legitimate.

If it is zero the required pointwise inequality is trivial. Otherwise
there is a nonzero support pair on the actual floor subgroup
(use ae_floorMeasure_mem and integral_eq_zero_of_ae twice, not a
pointwise nonzero assertion). The near conditions and
FlatCharts.lean cc98bd4c6c1bf499ec8298a4476f0715e9c3b2f4
203–210 exists_hasMatSize_of_isNear give ONE t in GT j with
t*g of matrix size 60 n^2 and t*w_p^-1*g of size 99 n^2.
The amplitude_support_and_plancherel support conclusion applied
twice (WeightPlancherel.lean 65619443ca5867bf45af038448a16dc1262103fd
141–151) puts
v=t*orbitPoint sigma in size a=60n^2+6 on f !=0,
w=t*orbitPoint tau in size b=99n^2+6 on f' !=0, a.e.
These are not independently chosen charts. Since t is an isometry,
h(v,w) is EXACTLY the original pairing. Gram entries have size 1;
Size.lean 3b57ba677471f6d26fceca1a7990eaac9bffa3db 75–80
gives size b+2 for splitGram*w and size a+b+3 for h(v,w).
Thus 159n^2+15 <= 200n^2. Star preserves size. On product support
the character hypothesis applies; elsewhere the product vanishes.
No condition on eta being a unit and no global equality of characters
is required. This local support argument is the valid weakening.

Define H(v)=int psi(-xi h(v,w(tau))) f'(tau) dtheta_j(tau).
Because conjugation inverts the unitary additive character, the
double integral is EXACTLY int f(sigma) conj(H(v(sigma))) dtheta_j.
Cauchy–Schwarz on the support of f gives
|formIntegrand|^2 <= (int |f|^2) (int_{v of size a}|H(v)|^2 ddelta_j).
Here the second integral uses measurePreserving_mulVec_orbitPoint
j ht, NOT Lebesgue volume on the full ambient space and not separate
integration measures for the two heads.

## Exact local gain and exponent
Apply WeightPlancherel amplitude_support_and_plancherel to the
SECOND kernel, chart matrix size 99n^2, unit -xi, translation y=0
and output measure delta_j = F.floorQuadric j restricted to size a.
FlatCharts 133–136 hasFibreBound_floorQuadric gives its M_out as
Lambda^(99n(a+6)). The input support coefficient in the Plancherel
lemma is Lambda^(99n(99n^2+12)).
Consequently
 int_{size a}|H|^2 <= Lambda^[99n(159n^2+24)]
                       (c/md xi)^card(iota) int |f'|^2.
md(-xi)=md(xi); retain P's actual Plancherel constant c.
Since 99n(159n^2+24) <= 18117 n^3 <= 10^6 n^3,
this is bounded by globalConst*(c/md xi)^card(iota) int |f'|^2.
(The 18117 bound is just a readable check of the native budget,
not a proposed extra global strengthening.)
FloorKernels.lintegral_upperPairing_sq_le bounds the two L2 integrals
by their respective weightedSquareSum/floorWeight. Thus the exact
pointwise hypothesis of Gauge.sq_lintegral_le_selfNormProduct
(LocalTheorem 350–370) is obtained with K=(c/md xi)^card(iota).
Apply that native weighted stack lemma once to get
 formModulus^2 <= (c/md xi)^card(iota) * selfNormProduct.
The stack lemma already includes all previous-floor costs; do not
multiply the dimension by the number of floors a second time.
This attaches directly to RUN78 section 3; exponent is card(iota),
NOT 2*card(iota) or the full dimension of the quadric chart.

## Sliced Fourier supplier — human analytic assembly
WeightPlancherel 141–187, FlatCharts 103–120.
Retain actual HasFibreBound witnesses, measure-preserving chart K,
factorization of f' through orbitPoint, source/target measures,
integrability and measurable support. Write r for fixed source chart
coordinates, u for the orthonormal/free Fourier coordinates, z for
fibre, with source law dr du dzeta. The basis identity gram_floorBasis
splits the phase: at fixed output coordinates p, the free output w
pairs with source u by star(w) dot u, while the other terms are a
unit-modulus multiplier depending on p,r and possibly (u,z), but
not on w after factoring out an irrelevant unit phase. This is the
last congruence in native proof (fromBlocks_mulVec, dotProduct).
After restricting to the support of the source amplitude, define
A_(p,r)(u)=int_z phase(p,r,u,z)*amplitude(r,u,z) dzeta.
The source support condition bounds its fibre measure by mu(r),
uniformly in u. Cauchy–Schwarz in z therefore gives
  |A_(p,r)(u)|^2 <= mu(r) int_z |amplitude(r,u,z)|^2 dzeta.
Plancherel in u (one transform, scalar xi acting on each of the
card(iota) coordinates) gives
  ||Fourier_xi A_(p,r)||_2^2 <= Cxi*mu(r)*E(r),
  E(r)=int_{u,z}|amplitude|^2, Cxi=(c/md xi)^card(iota).
Using the integral triangle inequality in L2 in the r variable
(or expanding the positive square and applying Cauchy–Schwarz to
each pair r,r'), then weighted Cauchy–Schwarz in r gives
  ||int_r |Fourier_xi A_(p,r)| dr||_2^2
       <= Cxi (int mu(r)dr)(int E(r)dr).
This avoids dividing by mu(r) on zero-mass fibres. For finite energy
the bound also supplies the required Bochner/L2 integrability by
Cauchy–Schwarz; for infinite energy use the native extended
nonnegative formulation, with the zero-mass branch separately.
The source factorization and measure transport give int E= int|f'|^2
and int mu<=Lambda^(99n(99n^2+12)) at the size a priori in this
caller. The exact target chart HasFibreBound (uniform bound for
each fixed output p, followed by integrating its fibre weight)
then multiplies by M_out ONCE. This is the actual native sliced
Plancherel proof reorganized as one energy calculation; no
unweighted Fourier transform on the entire isotropic quadric is
assumed. The remaining geometric input is hasFibreBound_floorQuadric
and its cone bound fib, with their exact measure constants; keep
that and the place-specific plancerel theorem as independent
suppliers. General ENNReal measure/AE details follow the source;
no native replacement body has been compiled.

## Dependency delta and verification
Original source-visible graph:
B -> Moments -> FiniteSystem.exists_finite_sieveSystem ->
TopFloor.enorm_floorForm_le -> Gauge.formModulus_sq_le_of_char ->
{Gauge.sq_lintegral_le_selfNormProduct, exists_hasMatSize_of_isNear,
 amplitude_support_and_plancherel, hasFibreBound_floorQuadric,
 measurePreserving_mulVec_orbitPoint, lintegral_upperPairing_sq_le}.
Reduced exposition: common chart -> on-support phase match -> one
Cauchy–Schwarz -> one sliced Fourier energy -> weighted stack.
Within sliced Fourier: retain source/target chart, fibre bounds,
unit phase, coordinate Plancherel, support and measure transport.
Context key pin,F,T,Gamma,j,p,q,W,x,g,t,eta,xi,theta,delta; never
cache across distinct measure or gauge. No graph nodes retired.
Backtracking: rejected pointwise nonintegral-character vanishing
and an ambient-quadric Lebesgue substitution (not true in general);
retain actual sliced bound. Unequal-head native proof is separate.
Lean/lake unavailable locally (PATH and ~/.elan/toolchains checked).
No native rh_scan/prune/reduce/auto/frontier or certificate replay.
Read actual CI receipts: old-pin 45577239749 and 45576756833 pass
(blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717).
Compact B2 helper receipt 45986308748 pass, eight helpers and six
original probes, not replacements. B2 energy repair 45998845682
status ERROR exit 1, blob c2bedaa5acd2a8d68d42a49a461675d3f3ed417b;
source build 0, energy step 1; do not claim new PASS. Active peer
cached replay remains separate. No use of claimed RH root or URT.
Two elementary Lean helpers below and actual axiom probes prepared,
not executed. No new CI or full graph claim.

RESUME HERE: reconstruct the remaining unequal-head consumer
Gauge.formModulus_sq_le_of_heads via the exact conjugation/simpleRootSum
identity in Gauge.parseval_heisenbergMeasure_of_box, including the
md(xi*u) and floorModulus(u) scaling, without duplicating this sliced
Fourier proof. HANDOFF TO positivity/integration/editor/audit and
shared native runner. Preserve all A/C, B2/B4, star and E1 obligations.
-/

namespace CompactRun79

theorem phase_size (N : ℕ) (hN : 1 ≤ N) :
    (60*N+6)+(99*N+6)+3 ≤ 200*N := by omega

theorem pl_factor_budget (n : ℕ) (hn : 1 ≤ n) :
    99*n*(60*n^2+12) + 99*n*(99*n^2+12) ≤ 1000000*n^3 := by
  have hN : 1 ≤ n^2 := by
    have hp : 0 < n := by omega
    exact Nat.one_le_iff_ne_zero.mpr (pow_ne_zero _ (by omega))
  have h : 99*(159*n^2+24) ≤ 1000000*n^2 := by omega
  calc
    _ = n*(99*(159*n^2+24)) := by ring
    _ ≤ n*(1000000*n^2) := Nat.mul_le_mul_left n h
    _ = 1000000*n^3 := by ring

#print axioms phase_size
#print axioms pl_factor_budget
#check Gauge.formModulus_sq_le_of_char
#check Gauge.amplitude_support_and_plancherel
#check Gauge.hasFibreBound_floorQuadric
#check Gauge.formModulus_sq_le_of_heads
#print axioms Gauge.formModulus_sq_le_of_char
#print axioms Gauge.amplitude_support_and_plancherel

end CompactRun79
