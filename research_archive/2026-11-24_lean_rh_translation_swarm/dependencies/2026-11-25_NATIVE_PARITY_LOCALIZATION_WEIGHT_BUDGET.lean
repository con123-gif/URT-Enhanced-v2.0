import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.LocLenQuotientWeightPieceLeOne
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Lane 12: one even/odd localization identity replaces the nilpotent and dehomogenization detour

25 Nov 2026. SOURCE-MATCHED human proof, prepared Lean fragments, NOT
new kernel verification. RH OPEN. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc, observed current
working head 5991ed4b3ac74aab2b1d8ca9299526d0e1c05e91. Prior lane 437f345a06e1f0a3761f6eb9a6e6b7996ee1b8e4;
peer kernel 5991ed4b, integration e02666f2, Galois e70e93e7, audit a543f365,
geometry 188850b1, manuscript blob 7beedb2752d934a81d4c92b5a19c1c48362e0dc9.
Read mission, SWARM, HANDOFF, AGENTS, continuity/state/log/protocol.
Actual older CI statuses retrieved: 45576756833 and 45577239749 both pass
only for the earlier engine/root tests. Orchestrator 45615450664 pass
at e70e93e, not evidence for this new proof. Local lean/lake absent.

## Exact source and original graph
Paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/
CommutativeAlgebra/:
  OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15
  GradedModulesLength/LocLenQuotientWeightPieceLeOne.lean 74f993dd39166d346ca21681890f0deb9f25ed30
  GradedModulesLength/SliceHolds.lean 0f4347bf89016fe7f63ce6aeaed14c849f57d135
  GradedModulesLength/EtHolds.lean e78d982f3f57e2d2e1eec818d883ad2ab9d9f86a
  GradedModulesLength/DehHolds.lean ba585c249b5fbf661ffea7dd0c19b07f59a4fd4c
  GradedModulesLength/TwoSigned.lean c2460a5a728ec42562e60d678237aa4f8051ec53
Original source-visible path: up_holds -> locLen_quotientWeightPiece_le_one
-> slice_holds, deh_holds, nilpotent_modulo_kernel,
localized_length_le_one; slice_holds -> et_holds, ft_holds and M4.
This is an actual consumer of the integral upper-length argument, not a
detour to an independent RH criterion. Original graphs and axiom ledgers
retained. This list is source-visible, not complete elaborated dependencies.

## Replacement mathematical block (for manuscript integration)

Use the exact native O,K,A, grading A_j, B=A_0, homogeneous I,
M2, M4, and sigma:B->K with idD not contained in ker(sigma)=p.
As in the native body, choose f in A_-2, g in A_2 with
tau=fg in B and sigma(tau) nonzero. Let S=B\p and R=S^(-1)(A/I).
Because S has degree zero, the quotient/localization grading survives:
R_j=S^(-1)(image A_j). All nonzero O scalars lie in S by faithful
scalar action; in particular a uniformizer pi lies in S. The images of
f,g are units since fg=tau is a unit. If R=0 the desired lengths are zero.

The slice C0=(A/(I+(f-1)))[1/(pi*g)] is exactly the ring used in
slice_holds. Its proof constructs zero tangent space via M4 and the
Euler derivation, then et_holds proves finite and reduced over Frac(O).
Thus C=R/(f-1)=S^(-1)C0 is reduced. Localization here is valid even if
some elements of S map to zero in C0 (then C=0).
Do not assume generic reducedness of A or omit M4.

Exact parity decomposition: multiplication by f is invertible and
shifts weights by -2. Each r in R has the unique finite expression
    r = sum_k f^k (u_k + v_k),  u_k in R_0, v_k in R_1.
Uniqueness follows from the disjoint weights -2k and 1-2k.
Multiplication by f is Laurent shift. Therefore as R_0-modules
    R/(f-1) = R_0 direct_sum R_1.
Indeed the map is coefficient summation separately in each parity;
kernel equals (f-1)R since a finite Laurent sum of coefficients with
sum zero is a sum of terms (f^k-1)c_k, each divisible by f-1 even for
negative k (f a unit). In particular each R_0,R_1 embeds in C. This is
module decomposition, NOT a claim that C is a direct product of rings.

The degree-zero algebra R_0 is (B/(I intersect B))_p. If I intersect B
is not contained in p then R=0. Otherwise M2 makes B/(I intersect B)
finite as an O-module (it is the image of B in A/I).
Invert nonzero O scalars first: this is a finite-dimensional algebra
over Frac(O), hence Artinian; its localization at p is local Artinian.
Its embedding in the reduced C proves R_0 reduced, hence a field,
canonically the residue field of B_p. This is the exact reason the
maximal ideal annihilates EVERY R_j; no individual nilpotent polynomial
construction is needed.

If R_1=0 all odd components vanish. Otherwise choose nonzero h0 in R_1.
Its image in C is nonzero; because C is reduced its square is nonzero.
Thus b=f*h0^2 belongs to R_0 and is nonzero (f a unit).
For any h in R_1 set a=f*h*h0 in R_0. Associativity gives
    b*h = a*h0,
and division by b in the field R_0 gives h=(a/b)*h0.
This proves dim_(R_0) R_1<=1. Multiplication by powers of f transfers
the same result to every odd component; even components equal R_0
up to the same unit shift. Consequently
    length_(B_p) (S^(-1)(image A_w)) <= 1       for every integer w.
This is precisely native locLen sigma (aPiece grading I w)<=1.
All scalars, host, sigma, grading and point conditions are unchanged.
The proof uses one exact cancellation before any valuation bound.
It does not assert the original ring A/I reduced, nor the slice result
without M4. No change to finite orbit covering or other M4 consumers.

Reduced candidate graph: locLen_quotientWeightPiece_le_one ->
native slice reducedness (et_holds), M2, degree-zero localization,
finite Laurent parity quotient, elementary Artinian field lemma,
one scalar cancellation. Local candidate removes private
nilpotent_modulo_kernel and deh_holds from THIS consumer only;
do not delete them globally. This also bypasses the existing
elementwise cyclic/annihilator witness construction. Keep native
fallback until full bridge checked. Cache key: source pin, O,K,A,I,
grading, sigma,p,f,g,tau,weight and local coefficient field. No URT
ranking needed; no speedup claim.

## Checks and native handoff
Executed 38 exact pinned source checks (6 blob identities plus 32
statement/body anchors). No numeric proxy used. This file prepares
the scalar cancellation fragment and original theorem scan/prune
against the actual native obligation. The parity-localization
isomorphism and transfer to actual locLen still need full Lean
implementation. The original native theorem remains the fallback.
Do not report PASS until actual new CI output exists. Preserve type,
value, structural and axiom evidence from scan. No RH root imported.
RESUME HERE: formalize the graded localization/finite Laurent
quotient isomorphism, expose the existing reduced slice as a
separate native lemma (rather than reprove M4), then replay
locLen_quotientWeightPiece_le_one and up_holds at the original caller.
If the interface fails, keep native proof and investigate the actual
M4 producer; no global deletion or hidden assumption.
HANDOFF TO: integration, Galois, kernel and formal audit.
-/

open IsLocalRing Filter Formalism.MainNotions.V.Pf.V2.Calc UpperTheory.V.Alg UpperTheory.V.Alg.M

namespace RHDependencyParityLocalization

-- Elementary scalar cancellation in the proposed localized coefficient field.
theorem normalized_weight_cancel {F R : Type} [Field F] [CommRing R]
    [Algebra F R] (h h0 e : R) (a b : F) (hb : b ≠ 0)
    (ha : h * h0 * e = algebraMap F R a)
    (hb' : h0 * h0 * e = algebraMap F R b) :
    h = algebraMap F R (b⁻¹ * a) * h0 := by
  have hc : algebraMap F R b * h = algebraMap F R a * h0 := by
    rw [← hb', ← ha]
    ring
  calc
    h = (algebraMap F R b⁻¹ * algebraMap F R b) * h := by
      rw [← map_mul, inv_mul_cancel₀ hb, map_one, one_mul]
    _ = algebraMap F R b⁻¹ * (algebraMap F R b * h) := by ring
    _ = algebraMap F R b⁻¹ * (algebraMap F R a * h0) := by rw [hc]
    _ = algebraMap F R (b⁻¹ * a) * h0 := by rw [map_mul]; ring

-- Original exact fallback; conditional on the native M2/M4 etc, not a proof
-- of the replacement localization argument.
theorem native_weight_budget
    (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (maximalIdeal O) O] [CharZero O]
    (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K]
    (A : Type) [CommRing A] [Algebra O A]
    (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] [IsCO O (𝒜 0)]
    (x : A →ₐ[O] O) (hx : IsWRing 𝒜 x)
    (I : Ideal A) (hI : I.IsHomogeneous 𝒜) (h2 : M2 𝒜 I)
    (h4 : M4 𝒜 K I) (σ : 𝒜 0 →ₐ[O] K)
    (hσ : ¬ idD 𝒜 ≤ RingHom.ker σ) (w : ℤ) :
    locLen σ (aPiece 𝒜 I w) ≤ 1 := by
  first
  | rh_reduce 2 using [UpperTheory.V.Alg.M.locLen_quotientWeightPiece_le_one]
  | exact locLen_quotientWeightPiece_le_one O K A 𝒜 x hx I hI h2 h4 σ hσ w

#print axioms normalized_weight_cancel
#print axioms native_weight_budget
rh_scan UpperTheory.V.Alg.M.locLen_quotientWeightPiece_le_one limit 500
rh_scan UpperTheory.V.Alg.M.up_holds limit 500
rh_prune native_weight_budget as NativeWeightBudgetPruned

end RHDependencyParityLocalization
