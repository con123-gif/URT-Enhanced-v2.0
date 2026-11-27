import Lib.GLn.Branching.Branching
import New.Seesaw.LiftCharacters
import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN43 — common branching restriction at the actual A caller (2026-11-27)

SOURCE-MATCHED HUMAN DERIVATION; prepared scalar certificates, NOT native-replayed.
Mission read first: ONE_EQUATION_MISSION.md blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Manuscript HUMAN_PROOF_COMPACT.md blob 944957c6f43b63df7a845472b31492dc0ca1cb8f.
Head observed dc78b895dff1e67e6f1b76771f5c6b884c3e6cb0.
Current compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original 40e56bab026552e089d7afcfeff08d2defb9c005 source and engines remain separate.

Nonduplicate continuation of RUN42 (67dc9549), RUN38 Schur-jet norm and
RUN31 local Hecke. Latest peer results consulted: 8b6f39e9 simultaneous
Teichmuller lift/log derivative; 3af9c4a3 homogeneous conjugation;
7fbfc4ba section basis; 570210d3 isogeny integrality; b11d25a0
level Fourier index. This note treats the FINAL branching restriction,
not those earlier stages, and does not claim new results for them.

Source anchors (relative to grh-compact/src):
* Lib/GLn/Branching/Branching.lean 669d2de08c3fa16386120153629ca6cde94e5dde:
  scalar_of_commute_schur, PolyRep.exists_int_branching_of_weylKernel,
  exists_branching_matrix.
* Lib/GLn/Branching/BranchingVector.lean aafa94d0795e07118c3133817e4afa4ec795c93b:
  PolyRep.exists_smul_weylKernel_mul_eq_toPoly,
  PolyRep.weylNormSq_weylEval_permArray, weylNormSq_le_mul_of_toPoly_eq,
  comulMatrix_isometry_and_equivariant, hasLeftInv_comulMatrix.
* New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65,
  lines 56-101: Data.branching, branchExp, le_branchExp, restrictToY.
* New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45,
  lines 20-51: Data.GaugeLe.restrictToY_of_diag, restrictToY,
  Data.weylNormSq_restrictToY_le.
* New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48:
  Data.gaugeLe_Bmu_at_N (actual caller).
* New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547,
  lines 201-226 and 293-307 (actual A norm and divisibility callers).
* New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a,
  Data.short_forms.

## 1. One integer branching matrix, not independent local choices

For each infinite place use the actual source interlacing data:
kappa=gamma+kappa', kappa0(h)=kappa'(h)+gamma(h+1)
for 0<h<n, kappa'(i)=0 for i<q, e0=e+kappa'(n).
The source constructs an integer B satisfying

 B rho_{kappa,e}(diag(g,s))
   = (prod_tau s_tau ^ E_tau) rho_{kappa0,e0}(g) B,
 E_tau=e_tau+sum_{1<=h<=n_tau} gamma_tau(h).

The witness B is over Z, hence is unchanged by any field embedding.
Retain the integral construction, not merely a complex branching
multiplicity theorem: the latter does not supply the required
integral map or its quantitative norm.

The source construction of B uses the hook-cleared product of two
highest-weight kernel polynomials. The small-height part beta of
gamma shifted to target rank is removed from the hook count;
alpha=kappa0-beta. Because kappa' vanishes below q, the box budget
for alpha is at most L=sum_tau sum_{q<=h<n_tau} h*kappa0_tau(h).
The integral coefficient lemma gives one positive integer
c=hookNumber(alpha) <= L^(3L) and the integral vector eta.
Use precisely that lemma (including the order condition on the
cyclic row permutation); it is not inferred solely from the weight
identity. Its proof uses the integral Cartan left inverse and the
weight support to isolate the beta factor. The subsequent native
exists_int_branching_of_weylKernel constructs B from eta by
coefficient extraction in the same integral polynomial ring.
Its full coefficient-membership, equivariance and uniqueness
obligations are retained in this run.

## 2. Exact Gram-adjoint reduction for the operator estimate

Write G_X,G_Y for the source and target positive-definite Gram
matrices and B^dagger=G_X^(-1) B* G_Y for the Gram adjoint.
For g unitary, the representations preserve these Gram forms.
The determinant twists are of modulus one. Taking adjoints of
B rho_X(g)=rho_Y(g) B and using unitarity gives the reverse
intertwiner B^dagger rho_Y(g)=rho_X(g) B^dagger.
Hence B B^dagger commutes with the target representation. By the
native scalar_of_commute_schur (determinant character cancels),
B B^dagger=lambda I. Let v be the target Weyl evaluation at its
permutation array, of Gram norm exactly one. Then

 lambda=||B^dagger v||_X^2 >= 0.

For arbitrary xi, put a=||B xi||_Y^2 and b=||xi||_X^2.
The adjoint gives a=<xi,B^dagger B xi>_X and
||B^dagger B xi||_X^2=lambda a. Cauchy-Schwarz therefore gives
a^2 <= lambda*a*b; if a=0 the bound is immediate, otherwise
cancel a>0. Thus a<=lambda*b. If lambda>0 equality is attained
on B^dagger v; if lambda=0 B is zero. This reduces the full
operator estimate to one normalized evaluation vector and
does not assume injectivity or invertibility of B.

For the constructed B, the native branch-vector identity identifies
toPoly(B^dagger v) with c times the product of two Weyl kernel
polynomials evaluated at the two row orders. The two evaluation
vectors have Gram norm one; Cartan multiplication is contractive
by weylNormSq_le_mul_of_toPoly_eq. Hence lambda<=c^2<=L^(6L).
For Data.branching, selected by indefiniteDescription from
exists_branching_matrix, use its guaranteed L^(6L) bound; do not
identify the selected witness with a separately chosen B.

## 3. Same restriction cancels the p-adic cost exactly

At Data.branching put q=D.k, kappa'=D.keptColumns,
kappa0=D.columnsY, e=e0=D.lastEntry D.m, and use the actual
lastIndexEquiv. Write E_tau=D.branchExp tau and

 C=prod_tau Phi_tau(star pi)^(-E_tau),
 R(phi)(h)=C B phi(borderU h).

This is literally Data.restrictToY. Its input to the source
gauge is at borderU h, not at h in the smaller group.

For the diagonal d of GaugeLe.restrictToY_of_diag, let
s_tau=N if star(inducedPlace tau) is in piPlaces, 1 otherwise.
Write z for the source vector in its d-adjusted lattice
coordinates. The unadjusted vector is rho_X(diag(1,s_tau)) z,
after applying the embeddings. By the same B equivariance,

 R in target gauge coordinates = C_p (prod_tau s_tau^E_tau) B z.

Here C_p is the embedded C. The source local valuation lemma,
intValuation_pi and split-level property give exactly
|Phi_tau(star pi)|_p=|s_tau|_p, including the unit case. Therefore

 |C_p prod_tau s_tau^E_tau|_p = 1.

This is norm equality, not an assertion of scalar equality in
the field. It works for signed E_tau since all factors are
nonzero. The integer entries of B have p-adic norm <=1 and
ultrametricity gives ||B z||_infty<=||z||_infty. This proves
the gauge inequality with NO extra restriction loss.

For p!=N the diagonal is identity and all normalization
factors are units. For p=N retain the actual diagonal and
its valuation formula; the same argument is used in
Data.gaugeLe_Bmu_at_N after the chain/Fourier comparison, which
still has its original 3*m*f*b budget. Thus the local restriction
step itself costs zero, not an additional marked-prime loss.

## 4. Exact archimedean gain from the same C

For every complex field embedding sigma in the actual caller,
the restriction of sigma composed with Phi_tau to the CM field
commutes with CM conjugation in the sense of complex embeddings.
Use D.pi_mul_star=N. Consequently
|sigma(Phi_tau(star pi))|^2=N, and

 |sigma(C)|^2=N^(-sum_tau E_tau).

Do not invoke norm preservation of an arbitrary automorphism
of C. This equality concerns this specific CM algebraic number.
B is integral and sigma fixes it, so the exact identity is

 ||sigma(R(phi)(h))||_Y^2
  = N^(-sum E_tau) || B sigma(phi(borderU h)) ||_Y^2.

Apply the Gram bound to B only after this equality. The original
scale proof in LiftCharacters uses the high-column sum
sum_tau sum_{q<=h<n_tau} h*kappa0_tau(h)
and bounds kappa0_tau(h) there by D.n D.m * D.h,
then bounds the resulting aggregate by the source size parameter
L. Retain its D.le_of_hasLogBound proof that
6*L*log L <= D.x^70 (equivalently L^(6L)<=exp(D.x^70);
for L=0 the power bound is 1). This yields exactly
exp(D.x^70 - (sum E_tau)*log N) in weylNormSq_restrictToY_le.
The original le_branchExp (kappa_tau(1)-2*b<=E_tau) is a
separate source supplier, applied only after log N>=0.
Substitution at LocalStatement.lean:204 before estimating
the remaining chain factors preserves the negative sign.
No extra factor for the branching Gram matrix or norm of B^dagger.

## 5. Dependency and verification ledger

Original source-level DAG:
star_inequality -> short_forms ->
  weylNormSq_Bmu_le -> weylNormSq_restrictToY_le
  -> Data.branching / restrictToY -> exists_branching_matrix
  -> integral coefficient construction / Gram norm / uniqueness;
  exists_indexDvd_Bmu_divisible -> gaugeLe_Bmu_at_N
  -> GaugeLe.restrictToY_of_diag -> same Data.branching / restrictToY;
  nonlevel branches -> GaugeLe.restrictToY -> same diagonal lemma.

Reduced human DAG: merge only the COMMON B,C,E witness in the
last restriction; one exact archimedean scalar and one exact
p-adic unit factor. Gram bound reduced to the normalized
evaluation vector. Retain the original graph, all remaining
chain factors, Fourier and marked Hecke inputs, original
branching integrality/uniqueness hypotheses, hook coefficient
proof, Gram positivity, Schur irreducibility, local valuation
and CM conjugation, scale conditions. No global kernel graph
pruning or theorem deletion asserted. Context key is compact
source pin, D, lastIndexEquiv, kappa/kappa0/e/e0, actual chosen
integer B, pi, N, p, embedding sigma or iota, and d. Never cache
a gauge conclusion across differing p or diagonals merely by
the declaration name.

Local command -v lean/lake/elan returned no executables. The
native output was re-read at cathedral-research-state:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804. Six named B/C
checks had only propext, Classical.choice, Quot.sound; the
A module build timed out (returncode 124, 2700.11 seconds);
all_requested_checks_ok=false, full_RH_replay=false. This is
not evidence of a failed mathematical statement. Old-pin
rh_prune/rh_scan/rh_reduce/rh_auto CI results are preserved,
not treated as a replay of this compact caller. No synthetic
finite diagnostics, no imported RH, no native PASS claimed.
The scalar certificates and source declaration/axiom probes
below are executable inputs, not executed results.

RESUME HERE: independently audit this caller splice and then
expand exists_int_branching_of_weylKernel's integral
coefficient-membership proof and its hook bound, or integrate
the latest peer proof if it already supplies that exact
obligation. Replay this module in the existing native CI
environment after the compact A build is available, recording
axioms and original/reduced dependencies. Do not advance any
A/B/C closure status solely on this note.
HANDOFF TO integration, editor, formal audit, shared native runner.
-/

namespace KernelRun43

/-- The zero-safe scalar cancellation in the Gram-adjoint argument. -/
theorem gram_adjoint_scalar_bound (a b lam : ℝ)
    (ha : 0 ≤ a) (hb : 0 ≤ b) (hl : 0 ≤ lam)
    (h : a ^ 2 ≤ lam * a * b) : a ≤ lam * b := by
  by_cases hz : a = 0
  · rw [hz]
    exact mul_nonneg hl hb
  · have hp : 0 < a := lt_of_le_of_ne ha (Ne.symm hz)
    apply (mul_le_mul_left₀ hp).mp
    nlinarith only [h]

/-- Cancellation of the local norm factors requires equality of positive
norms, not equality of the underlying field elements. -/
theorem local_norm_cancellation (a b : ℝ) (ha : a ≠ 0) (h : a = b) :
    a⁻¹ * b = 1 := by
  rw [← h]
  exact inv_mul_cancel₀ ha

/-- Multiplication by the exact archimedean scalar, before bounding
the branching contribution, preserves its signed exponent. -/
theorem signed_arch_factor (u v x y : ℝ) (hxy : x ≤ Real.exp u * y) :
    Real.exp (-v) * x ≤ Real.exp (u - v) * y := by
  calc
    Real.exp (-v) * x ≤ Real.exp (-v) * (Real.exp u * y) :=
      mul_le_mul_of_nonneg_left hxy (Real.exp_pos _).le
    _ = Real.exp (u - v) * y := by
      rw [← mul_assoc, ← Real.exp_add]
      congr 2
      ring

end KernelRun43

#check exists_branching_matrix
#check Data.branching
#check Data.weylNormSq_restrictToY_le
#check Data.GaugeLe.restrictToY_of_diag
#check Data.gaugeLe_Bmu_at_N
#check Data.weylNormSq_Bmu_le
#print axioms exists_branching_matrix
#print axioms Data.weylNormSq_restrictToY_le
#print axioms Data.GaugeLe.restrictToY_of_diag
#print axioms Data.gaugeLe_Bmu_at_N
#print axioms Data.weylNormSq_Bmu_le
#print axioms KernelRun43.gram_adjoint_scalar_bound
#print axioms KernelRun43.local_norm_cancellation
#print axioms KernelRun43.signed_arch_factor
