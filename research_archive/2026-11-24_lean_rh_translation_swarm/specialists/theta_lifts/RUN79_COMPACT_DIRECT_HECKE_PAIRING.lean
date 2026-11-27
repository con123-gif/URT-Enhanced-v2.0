import Lib.Weil.Unramified.HeckeTransfer
import Mathlib.Tactic

/-!
# RUN79 — direct finite theta/Hecke pairing, without a global extension
27 November 2026. HUMAN SOURCE-MATCHED candidate replacement for the actual
single-stage pairing supplier A2; mathematical derivation below, native
helper certificates PREPARED, not compiled. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. No claim of new RH proof.

Read current ONE_EQUATION_MISSION.md blob 4aed2e68e6bd724826bc1e669c07a48e0b95eddd
(including mandatory engine), LIVE_PROOF_SPINE, LIVE_OBLIGATIONS (A1/A2),
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION and continuity.
Latest cleanup b87bfdd4, prime 93f1fe32 and kernel 6a47079d inspected;
RUN78 f1abc81e retained; no reoptimization of its fixed exponents.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005; upstream latest
7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc; compact latest still pinned.

Exact source ledger, relative to grh-compact/src:
- Lib/Weil/Unramified/HeckeTransfer.lean 9145e115beff2378fb879e699ce56a40149f62cd:
  heckePolyOp_eq_sum, CharUnramifiedAt.det_maxCompactAt_eq_one,
  sum_heckePolyCoeff_smul_pairWeil, hecke_transfer_of_equivariant,
  hecke_transfer_of_pairing.
- Lib/Weil/Unramified/HeckeGL.lean 923db13430eeb318ab80421c84b9a18a3d021ad3:
  v_mul_inv_le_one_iff, basicCosetRep_spec, basicDoubleCoset_eq,
  transposeGL_mem_basicDoubleCoset, heckeGL_eq_sum,
  heckeFun_basicDoubleCoset_inv.
- Lib/Weil/Unramified/SphericalHecke.lean 37493fc793c98f8e31d1d2e101e77a4ac2a4023b:
  heckePolyOp_adjoint, heckePolyOp, sphericalAt.
- New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
  Data.IsGoodDatum.exists_hecke_transfer, induction S e explicitly
  calls hecke_transfer_of_pairing with k=D.t+1, the actual two
  rank-twisted unramified chars, vacuum z, lift and lift_equivariant.
- Same-pin readable grh/src/Lib/Weil/Unramified/HeckeTransfer.lean
  a8150176564ae56d5db55f266983019b70a10c4e gives the explicit
  local action and q-binomial proof. Do not confuse this readable
  sibling with an independent replay of compact.

## 1. The kernel relation is one rank-defect identity

Keep the exact native premises: split place w, q=|k_w|, source rank n,
target rank m=n+k, base changes of a and b unramified at w, and
f fixed by projOn {w} in the actual Weil model. Let
alpha=a.frobValue n w, beta=b.frobValue m w, both nonzero (characters
and sqrt(q)>0). Put P_d(Y)=prod_{0<=j<d}(1-q^j Y).

For a local matrix x of size m by n, fix r=rank(x mod w) only when x
is integral. For each subspace U of dimension i, let gamma_U be the
actual basicCosetRep with residual kernel U in the minuscule double
coset. Over the local DVR, y gamma_U^-1 integral iff y integral and
U contained in ker(y mod w). Forward: multiply by gamma_U and reduce.
Reverse: gamma_U=k1 diag(varpi I_i,I) k2; the condition says the first
i columns of y k2^-1 are divisible by varpi, so multiplying by the
inverse diagonal and k1^-1 preserves integrality. This proves the
criterion used at the actual residue-space count, including i=0
and full i. Smith form / minuscule coset classification retained.

The target transpose representative contributes alpha^i times the
indicator of x^t gamma_U^-1 integral, and source inverse representative
contributes beta^i times the indicator of x gamma_U^-1 integral.
These are the exact split Weil action formulas in the readable sibling;
retain the underlying local action, vacuum projection and modulus/
character normalization. For nonintegral x both sums vanish.

For an integral x the admissible subspaces are contained in kernels
of dimensions m-r and n-r. If N(d,i) counts i-planes in k_w^d, a fixed
hyperplane gives N(d,i)=N(d-1,i)+q^(d-i)N(d-1,i-1): planes not contained
intersect in dimension i-1 and each such intersection has q^(d-i)
lifts. Weighted by (-Y)^i q^(i(i-1)/2), the two terms give the
recurrence P_d(Y)=(1-q^(d-1)Y)P_(d-1)(Y), starting at P_0=1.
This is precisely the finite q-binomial sum used by the native
sum_heckePolyCoeff_smul_pairWeil. Therefore the target and source
Weil polynomial sums are named local data with residue functions
P_(m-r)(alpha X) and P_(n-r)(beta Y).

Take Y=q^k alpha X/beta. At every integral x the decisive equation is
    P_(m-r)(alpha X)
       = P_k(alpha X) P_(n-r)(q^k alpha X).               (1)
It follows by splitting the product at k since m-r=k+(n-r).
Nonintegral x yields zero on both sides. Apply the same linear name
operation to f. Thus the two finite Weil sums are equal with multiplier
P_k(alpha X). This is the known unramified identity, reconstructed from
the actual local action, not an independent new automorphic theorem.

## 2. Eliminate the global extension from the bilinear supplier

Native hecke_transfer_of_pairing takes a submodule M of the Weil datum
space containing f, a bilinear B:M x W -> Z, source representation pi,
target rho, and for all g,h,z the exact hypothesis
    rho(h) B(f,z) = B(f_(g,h), pi(g)z),                  (2)
with existence of f_(g,h) in M whose underlying datum is omega(g,h) f.
Also v is source K_w-fixed. Write F=B(f,v), lambda(z)=B(f,z).
Notation suppresses subtype proofs, which are unique by coercion
injectivity.

Because f is fixed by source and target local compact groups
(native pairWeil_eq_smul_of_projOn_eq and det_maxCompactAt_eq_one),
(2) with g=1, h compact gives rho(h)F=F. With h=1 and g compact,
(2) for arbitrary z gives lambda(pi(g)z)=lambda(z).
Hence the matrix coefficient
    c(s)=lambda(pi(s)v)
is bi-invariant under the source compact group K, since v is K-fixed.
This is a consequence of (2), not an extra assumption.

For each target U use t_U=atSplit(hw, transpose gamma_U).
Equation (2) with g=1 gives rho(t_U)F=B(f_(1,t_U),v).
For each source U use s_U=atSplit(hw,gamma_U).
Equation (2) with h=1, g=s_U^-1 and z=pi(s_U)v gives
    B(f_(s_U^-1,1),v)=lambda(pi(s_U)v).
IMPORTANT: s_U is not the transpose representative for the source
Hecke sum. Do not replace it at vector level. Both gamma_U and
transpose gamma_U lie in the SAME minuscule double coset
(basicCosetRep_spec, transposeGL_mem_basicDoubleCoset,
basicDoubleCoset_eq), hence there are k1,k2 in K with
s_U=k1 atSplit(hw,transpose gamma_U) k2. Bi-invariance gives exactly
    lambda(pi(s_U)v)
      = lambda(pi(atSplit(hw,transpose gamma_U))v).      (3)
No Haar normalization, compact averaging, choice of eigenvectors,
or division by a possibly zero matrix coefficient. The equality
holds term-by-term for every U, including endpoints.

All f_(1,t_U), f_(s_U^-1,1) lie in M by (2). The equality of the
two finite datum sums from (1) is consequently an equality IN M,
by injectivity of its inclusion. Apply the linear evaluation
B(-,v) only on M. Substitute (2),(3), and heckePolyOp_eq_sum
(the output spherical condition was just established). The result is
    H_target,w(X) F
      = P_k(alpha X) B(f,H_source,w(q^k alpha X/beta) v). (4)
This is the exact original conclusion of hecke_transfer_of_pairing,
with the same premises. It does not use B.exists_extend,
the Hom-space representations or heckePolyOp_adjoint. It only needs
the separate local compact and finite Hecke translates in (2);
the original all-g,h,z hypothesis implies those. Thus no need to
extend B to arbitrary non-admissible theta data.

## 3. Actual caller and dependency accounting

Use (4) at the induction S e in Data.IsGoodDatum.exists_hecke_transfer
with f=D.translateDatum x e, B=(D.liftKernel theta e).lift,
M=the actual admissible-datum submodule, v=chain ... e phi.
The original lambda witness is exactly the supplied lift_equivariant
and subtype membership; source spherical v is ih.1, rank equality,
unramified chars and vacuum supplied in the original call. The scalar
and argument in (4) are IDENTICAL to the native conclusion, so the
existing rank-twist simplification and induction are unchanged.
RUN76 coefficient extraction then applies without changing any
marked or gauge premise. This provides a human route for the A2
single-stage pairing; it does not prove the independent integral
frame, global theta norm/height, marked elementary-divisor or any
prime-window supplier.

Original source graph (not exhaustive kernel graph):
  local Weil action + minuscule cosets + q-binomial
  -> sum_heckePolyCoeff_smul_pairWeil
  -> hecke_transfer_of_equivariant
  -> [B.exists_extend, Hom actions, map_heckePolyOp,
      heckePolyOp_adjoint] -> hecke_transfer_of_pairing
  -> exists_hecke_transfer -> exists_move_markOperator
  -> gaugeLe_markOperator_pow -> gaugeLe_Bmu_of_isMarked
  -> exists_indexDvd_Bmu_divisible -> A.
Candidate human graph:
  same local action/count -> rank-defect identity (1)
  + local compact invariance + original lift equivariance (2)
  -> bi-invariant coefficient (3) + finite sums in M -> (4)
  -> same native caller and all later obligations.
No actual kernel nodes removed or axiom ledger changed. Preserve
both graphs and the native theorem until caller replay and audit.
Context key: compact pin, S,T,w,hw,k,n,m,a,b,f,hf,ha,hb,M,B,pi,rho,v,
same datum, same coset reps and same original hB; reuse only within
that context. Source proof algebra reviewed; no URT comparison.

## 4. Verification
Local command -v lean/lake found neither. Read actual older CI state
receipts: 45577239749 blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717 report
pass for the old-pin conditional root/engines only. Compact receipt
targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named original declarations checked in TiltingLemma and
Filling.Moments with standard three axioms, A module build timed
out (124), full_RH_replay=false, all_requested_checks_ok=false.
No fresh native engine or caller replay possible here; below are
generic helper certificates for the direct finite proof, NOT an
implemented replacement of the actual source theorem. No sampling
test claimed; all-index mathematical proof above. Request shared
compact runner for helper + actual original-statement bridge; do not
edit protected workflow or duplicate the compute engine.

RESUME HERE: independently audit (2)->(3), especially both left and
right compact invariance and transpose-vs-inverse convention. Native
replay of direct_pair_transfer at actual hecke_transfer_of_pairing
and original LocalStatement caller is pending. With A2 pairing
human route recorded, prioritize remaining actual integral frame /
short-column span and all-conjugate height supplier, not further
local constant optimization. Preserve A1, A3, B/C, D1, E1, V1/V2
ledger and actual weighted prime lower-bound obligation.
HANDOFF TO integration/editor, kernel, independent audit, acceleration.
RH remains OPEN.
-/

namespace ThetaRun79

theorem double_coset_coefficient {G V Z : Type*} [Group G]
    (K : Subgroup G) (act : G → V → V) (L : V → Z) (v : V)
    (hmul : ∀ g h x, act (g*h) x = act g (act h x))
    (hleft : ∀ g ∈ K, ∀ x, L (act g x) = L x)
    (hright : ∀ g ∈ K, act g v = v)
    {s t : G} (h : ∃ k₁ ∈ K, ∃ k₂ ∈ K, s = k₁*t*k₂) :
    L (act s v) = L (act t v) := by
  rcases h with ⟨k₁,h₁,k₂,h₂,rfl⟩
  rw [hmul, hmul, hright k₂ h₂, hleft k₁ h₁]

theorem inverse_pair_coefficient {G V Z F : Type*} [Group G]
    (act : G → V → V) (f : F) (B : F → V → Z)
    (v : V) (s : G) (fs : F)
    (hmul : ∀ g h x, act (g*h) x = act g (act h x))
    (hone : ∀ x, act 1 x = x)
    (hB : ∀ z, B f z = B fs (act s⁻¹ z)) :
    B fs v = B f (act s v) := by
  have h := hB (act s v)
  rw [← hmul, inv_mul_cancel, hone] at h
  exact h.symm

theorem direct_pair_transfer {I J F Z : Type*}
    [Fintype I] [Fintype J] [AddCommGroup F] [Module ℂ F]
    [AddCommGroup Z] [Module ℂ Z]
    (L : F →ₗ[ℂ] Z) (fT : I → F) (fS : J → F)
    (cT : I → ℂ) (cS : J → ℂ) (z : ℂ)
    (t : I → Z) (s : J → Z)
    (hT : ∀ i, L (fT i) = t i)
    (hS : ∀ j, L (fS j) = s j)
    (h : (∑ i, cT i • fT i) = z • ∑ j, cS j • fS j) :
    (∑ i, cT i • t i) = z • ∑ j, cS j • s j := by
  simpa only [map_sum, map_smul, hT, hS] using congrArg L h

#print axioms double_coset_coefficient
#print axioms inverse_pair_coefficient
#print axioms direct_pair_transfer
end ThetaRun79

#check hecke_transfer_of_pairing
#check hecke_transfer_of_equivariant
#check sum_heckePolyCoeff_smul_pairWeil
#check heckePolyOp_eq_sum
#check basicCosetRep_spec
#check basicDoubleCoset_eq
#check transposeGL_mem_basicDoubleCoset
#print axioms hecke_transfer_of_pairing
