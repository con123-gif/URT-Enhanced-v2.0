import Formalism.LocalToGlobal.GlobalTheory.GL5.PNamed
import Formalism.SharpRestriction.GlobalSchurBounds.MassRatioUnfoldedOfTheoremTwo
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.VolumeRatioOfUnfolding
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.MassRatioRankFactor
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Editor lane 15; 25 Nov 2026. HUMAN DERIVATION / NATIVE ADAPTER PREPARED.
Exact cross-rank normalization, not another prime criterion.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; exact toolchain and Mathlib pin are those in the existing native runner.
Mission blob cd0a176134d46b5b624896e56843a24915c14477 read first.
AGENTS, SWARM, HANDOFF, EXPANSION and living proof consulted.
Peer geometry RUN36 ba80c3a51253e7d4610e58ae416abf9b5661af32,
RUN33 0e1b92ab, RUN35 04a29a86, integration 95545ee1,
theta RUN35 bcaeec5cd5c3e4bdb628f52d736d2afead6f1326,
editor 1656 Landherr f5cc7b7b. Peer head report 91b273530883b723ef4422436e0dc3557749325a
is not substituted for pin. No independent upstream head check here.

Human proof for insertion into the living proof (pending independent audit).
Fix the SAME totally real F and CM E/F, finite-unramified at every
finite place, and full self-dual lattices in spaces of ranks n and n-1
(n >= 3). Retain native CM/embedding, lattice, HA/HFinIn, VolTie and
IsVolMeas transport premises as in RUN33/RUN36; no rational isometry
between different signatures is assumed. Write d=abs(disc F), f=[F:Q],
eta the quadratic character of E/F, and C_j the compact U(j) volume
for the invariant trace-pairing density.

On each unitary Lie algebra B(X,Y)=tr_E(XY) lies in F. The induced
absolute density is defined in any rational basis by sqrt(abs(det B)).
At each place this means |det B|_v^(1/2) times the coordinate density;
the product formula cancels these factors globally. At real places the
native IsOmegaLeb normalization is exactly this density: for a real
basis of u(p,q), complexification gives matrix columns A, and
det(B)=det(A)^2 times the determinant of the matrix trace permutation
pairing, of absolute value one. The real Jacobian of (X,Y)->X+iY is
|det(A)|^2; taking the positive square root proves the claim.
OmegaDensity and compact probability therefore normalize by C_j
independently of signature. This reuses the same-rank argument,
but the C_j factors MUST NOT be cancelled between different ranks.

Compute C_j/C_(j-1) directly. Under the metric -tr(XY) on compact
u(j), the first-column map to the unit sphere has isotropy U(j-1).
At the identity the orthogonal complement has matrices with top-left
it, off-diagonal z and -z*, and zero lower-right block. The horizontal
metric is t^2+2||z||^2; the round metric is t^2+||z||^2.
The quotient volume density is consequently 2^(j-1) times the
round sphere density. The sphere has volume 2*pi^j/(j-1)!.
By invariance and the Riemannian submersion volume formula,
C_j/C_(j-1)=(2*pi)^j/(j-1)!, precisely native volU_succ_eq_mul.
There is no missing factor of two for off-diagonal coordinates.

At finite v, a perfect Hermitian lattice over the finite etale
quadratic algebra gives the smooth reductive unitary model: after
etale splitting it is GL_j. Its integral trace pairing is perfect
by the same descent. Counting the residue group and using smooth
lifting shows its trace-density volume is
P_j(v)=prod_(i=1)^j (1-eta_v^i q_v^(-i)),
including split places and residue characteristic two. This is
the usual GL_j(q) or U_j(q) order divided by q^(j*j). Compare
P_j/P_(j-1) BEFORE taking infinite products.

For j>0 use the classical Tamagawa number 2 for U(j) over F,
independent of signature and rank. For the simply connected derived
SU(j) the number is 1 (Kottwitz); the determinant quotient is the
norm-one torus of E/F. The latter has Tamagawa number 2 by Ono:
the sign character lattice has H^1(C2,Z_sign)=Z/2 and the quadratic
Hasse norm theorem gives the vanishing norm obstruction. The
determinant has a rational section from scaling a nonisotropic
orthogonal line; equivalently use the relative Tamagawa formula.
All rational characters are trivial, so the full adelic quotient
is used. Inner-twist invariance alone would NOT justify the
cross-rank cancellation.

With local trace densities the global discriminant factor is
d^(-j*j/2). The determinant convergence factor at finite v is
L_v(1,eta_v), with inverse global L(1,eta) factor. Thus there
is no assumption of absolute convergence of an unregularized
Euler product at i=1. For the native Haar volume V_j (finite
stabilizer measure one, real compact-dual measure), the standard
normalization is
2 = d^(-j*j/2) C_j^f V_j / prod_(i=1)^j L_F(i,eta^i).
Both ranks are positive and all constants are nonzero.
Cancel identical factors first:
V_(n-1)/V_n =
 ((2*pi)^n/(n-1)!)^f * d^(1/2-n) / L_F(n,eta^n).
No bound, approximation, RH, or prime-distribution hypothesis.

As E/F is finite-unramified, abs(disc E)=d^2 and [E:Q]=2f;
hence (2*D.host.v)^D.R.f=d under the existing host degree dictionary.
The native lValEta at n is exactly L_F(n,eta^n): at split v the
two half-powers on primes of E combine, and at inert v the norm
is q_v^2, so its square root is q_v. There is no ramified term.
For n>=3 the factors converge absolutely. Substituting these two
equalities gives the exact RHS of ratio_of_setting, not just a
rank-only inequality. This produces an alternate human derivation
of the volume ratio using standard theorems; exact native Haar/
Tamagawa dictionaries are still to be certified. The global
normalization formula is not formalized by the scalar lemma below.

References: Kottwitz, Tamagawa numbers, Ann. Math. 127 (1988),
629-646, DOI 10.2307/2007007; Ono, On the Tamagawa number of
algebraic tori, Ann. Math. 78 (1963), 47-73; Ono, On the relative
theory of Tamagawa numbers, Ann. Math. 82 (1965), 88-111;
Gan-Yu, Group schemes and local densities (unramified case).
Bibliographic references checked; no claim of a full independent
replay of these standard results.

Original source-visible graph:
MassRatioUnderVolume -> VolumeRatio₂ -> volumeRatio_of_unfolding ->
ratio_of_setting -> local densities / archimedean density / SW1b2 /
unfolding / VolTie; parallel UnitVectorPerp and isometry transport.
Candidate graph:
MassRatioUnderVolume -> VolumeRatio₂ -> UnitSplit + RankQuotient;
RankQuotient <- native transport + trace densities + classical
Tamagawa normalization + exact Euler/discriminant identification.
Keep UnitSplit (or original stronger geometric witness at any other
consumer) and all independent SW1b2 uses. No global deletion.
Context key (pin, exact toolchain, D, F,E, ranks, signatures, lattices,
measure conventions, consumer). Backtrack to original rank-one
supplier if dictionary or actual caller fails. No new kernel graph
or new axiom evidence; original ledgers preserved.

Pinned source blobs:
PNamed fcfd96e6e8385ec5e1de13f41d5706803d565c5d
StandardLattice cb758a6c5f78e610b8f946d4b733d07902b15f5d
MassRatioUnfoldedOfTheoremTwo 1c676e46fcda50cdbc82597cacbf8ea526c6871a
VolumeRatioOfUnfolding bf534d0467940a3315375b49ab216a548170c422
MassRatioRankFactor 7ab7981637d6ed6f39e65cea95e69571c851300c
StatementMass 33a3ea93298eff7969409462ddfc1ed22f173939
DataHost 7e9af8ab364965c62be250ae93974098141598c0
DataCD 449d5479b4d8ec9baeaebd3459f95232094ae222.
Baseline status JSON actually retrieved: runs 45577239749 and
45576756833 returncode 0, older engine only. Separately run
45652878741 returncode 1 for analytic candidate, not this branch.
Local Lean/Lake unavailable, no new native replay or PASS, no
URT comparison, no synthetic tests, no kernel-level retirement.
One source-matched human derivation; conditional caller adapter below.

RESUME HERE: integration/audit verify the absolute trace-density
normalization across ranks, especially the common determinant
convergence factor and native host discriminant dictionary; insert
the preceding compact argument into the living proof after audit.
Kernel lane compile this file against exact-pin engine/toolchain,
inspect scans, prune bridges and axiom output. Do not treat the
conditional RankQuotient parameter as proved by its adapter.
Keep VWinAt(1,401), same-host arithmetic, rank/count/entropy/local
gain and every other unresolved supplier. The weighted prime
window inequality is not established. RH OPEN.
HANDOFF TO geometry, theta, integration, literature, kernel, audit.
-/

noncomputable section
namespace RHEditorAdjacentRank
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem cancel_normalizations (v w c a b d e : ℝ)
    (hv : v = c*d*e/(a*b)) (hw : w = c/a)
    (hc : c ≠ 0) (ha : a ≠ 0) (hb : b ≠ 0)
    (hd : d ≠ 0) (he : e ≠ 0) : w/v = b/(d*e) := by
  rw [hv, hw]
  field_simp
  <;> ring

def RankQuotient (D : D7) : Prop :=
  ∀ (W W' : HSpace D.host.E) (P Q P' Q' : ℕ),
    W.SigOK → W'.SigOK →
    (∀ τ, W.sig τ = (P,Q)) → (∀ τ, W'.sig τ = (P',Q')) →
    3 ≤ W.rank → W'.rank = W.rank - 1 →
    D.vol W' / D.vol W =
      ((2 * Real.pi) ^ W.rank / ((W.rank - 1).factorial : ℝ)) ^ D.R.f *
        ((2 * D.host.v) ^ D.R.f) ^ ((1 : ℝ) / 2 - W.rank) /
          Formalism.HermitianLatticesTheory.lValEta D.host.E W.rank

theorem volumeRatio_of_rankQuotient (D : D7) (hU : UnitSplit D)
    (hR : RankQuotient D) : VolumeRatio₂ D := by
  intro W P Q hW hs hM s hsP
  obtain ⟨x, hx, W', ι, h1, h2, hW', hs'⟩ := hU W P Q hW hs hM s hsP
  refine ⟨x, hx, W', ι, h1, h2, hW', hs', ?_⟩
  have hrk : W.rank = P + Q := by
    have := Formalism.BasicNotions.sig_sum W hW D.host.φ₀
    rw [hs D.host.φ₀] at this
    omega
  have hs'' : ∀ τ, W'.sig τ = (if s then P - 1 else P, if s then Q else Q - 1) := by
    intro τ; rw [hs' τ]; cases s <;> simp
  have hrk' : W'.rank = W.rank - 1 := by
    have := Formalism.BasicNotions.sig_sum W' hW' D.host.φ₀
    rw [hs'' D.host.φ₀] at this
    cases s <;> simp at this hsP <;> omega
  exact hR W W' P Q _ _ hW hW' hs hs'' hM hrk'

theorem massRatioUnderVolume_of_rank (D : D7) (hU : UnitSplit D)
    (hR : VolTie D → RankQuotient D) :
    Formalism.MainNotions.RT.MassRatioUnderVolume D := by
  intro hT
  first
  | (rh_reduce 2 using [volumeRatio_of_rankQuotient]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact volumeRatio_of_rankQuotient D hU (hR hT)

rh_scan GlobalTheory.VolRatioUnfold.ratio_of_setting limit 2000
rh_scan RHEditorAdjacentRank.massRatioUnderVolume_of_rank limit 2000
rh_prune RHEditorAdjacentRank.massRatioUnderVolume_of_rank as RHEditorAdjacentRankPruned
#print axioms RHEditorAdjacentRank.cancel_normalizations
#print axioms RHEditorAdjacentRank.volumeRatio_of_rankQuotient
#print axioms RHEditorAdjacentRank.massRatioUnderVolume_of_rank
end RHEditorAdjacentRank
