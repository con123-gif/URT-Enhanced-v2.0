import New.Columns.LocalStatement
import Lib.Weil.Unramified.HeckeTransfer
import Mathlib.Tactic

/-!
# RUN68 — finite spherical adjoint and the actual uniform marked-column caller
27 November 2026. Human source-matched derivation, conditional on retained
native suppliers; independent mathematical audit and replacement compilation
outstanding. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
52c0ccfd0dc525f446dd8bc935a7df71912c8709, integration d0a3d115,
editor 5ddf30c7, kernel 9f17e441, prime 6de4f9d9, URT specialist 47701c80
and prior acceleration 8b6f39e9 inspected. Do not repeat canonical CM
pullback or branching hook construction already assigned to peers.

Source ledger:
Lib/Weil/Unramified/HeckeGL.lean 923db13430eeb318ab80421c84b9a18a3d021ad3
  143–185 (double coset, transpose, inverse sums).
Lib/Weil/Unramified/SphericalHecke.lean 37493fc793c98f8e31d1d2e101e77a4ac2a4023b
  heckeSplit_star, heckeSplit_comm_of_atPlace_mem, heckeSplit_adjoint,
  heckePolyOp_adjoint (232–235).
Lib/Weil/Unramified/HeckeTransfer.lean 9145e115beff2378fb879e699ce56a40149f62cd
  32–37, 49–51, 61–110.
Lib/Weil/MixedModel/NameWeilAction.lean a8bee0d694dc7891bb451bc6503f45aed919d2d3
  Space.omega_name, Space.ω_name_on.
Lib/Weil/DualPair/PairSumNegation.lean d2f45383d2e972574a7e749da0f2b4bb9283c6da
  pairWeil_eq_smul_of_projOn_eq, pairWeil_name_of_mem, pairWeil_name_on.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  exists_hecke_transfer, exists_move_markOperator, gaugeLe_markOperator_pow,
  hasType_prod_markOperator_pow, gaugeLe_Bmu_of_isMarked,
  gaugeLe_collisionSum, gaugeLe_pow_jetCeil_smul,
  exists_indexDvd_Bmu_divisible.
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
  IsMarked.hasType_markOperator.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
  IndexDvd, IndexDvd.comp, HasType.prod.
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473
  allowedLoss, sum_allowedLoss_mul_log_le.

## 1. Finite termwise spherical adjoint (retained RUN69 supplier)

Let K=GL_n(O_w), D_i=K diag(varpi I_i,I) K. Work at the
actual split w, and write the two representations in the same
w-coordinate. Let B be invariant under simultaneous actions,
semilinear via sigma in the first argument and linear in the second.
Both x and y are K-fixed. For k1,k2 in K and g in D_i,

 B(pi(k1 g k2)x,y) = B(pi(g)x,pi'(k1^-1)y) = B(pi(g)x,y).

So this scalar pairing is constant on the whole double coset,
not merely on each right coset. For each actual residual subspace U
of dimension i, the native gamma_U and gamma_U^t both belong to D_i.
Consequently the native forward representative and reverse representative
pay the following exact equality, TERM BY TERM on the same U:

 B(pi(gamma_U^t)x,y)
   = B(pi(gamma_U)x,y)
   = B(x,pi'(gamma_U^-1)y).

The second step uses invariance with simultaneous gamma_U^-1,
not a Hermitian adjoint or a change of measure. HeckeGL_eq_sum
and heckeFun_basicDoubleCoset_inv use the same residual subspaces;
heckeSplit_star identifies the conjugate place with the inverse
coset function. Hence summing gives heckeSplit_adjoint without
a Haar measure comparison or any count of inverse coset volumes.
The empty sum (i>n) gives zero on both sides. Summing weighted
terms (-X)^i q^binom(i,2) gives the exact heckePolyOp_adjoint
with sigma(X) on the second side, since sigma fixes integers.
At the actual bilinear Hom evaluation caller sigma=id, so no
conjugation of X or rank factor. This discharges the human
adjoint step retained by prime RUN69 section 3; keep the native
coset decomposition and inverse coordinate identification explicit.

## 2. Compact Weil action on the same name and datum

Use the general mixed-model omega_name from 47701c80 with the
S-conjugate-disjoint box B, projection P, and name operator N.
For a pair (g,h) whose finite parts are integral everywhere
(in Kf), the corresponding Hom action A:z -> h z g^-1
and its inverse preserve the integral box at S. Hence B o A=B.
In the general omega_name formula the intermediate datum is
u=omega(g,h)N(B)f=omega(g,h)P f. The native compact commutation
omega_projOn gives u=P omega(g,h)f. Then
 N(Psi o A^-1)u=N(Psi o A^-1)omega(g,h)f
by name_projOn. Multiply the external determinant twist into
the last datum by linearity. The result is exactly
pairWeil_name_of_mem, with Psi'(z)=Psi(h^-1 z g).
No supported-element scalar formula used for a general adelic
element, and no change of variables in a Haar integral.

At one split place w, if g,h are both in maxCompactAt(w),
their support is {w,bar w}. The exact peer supported name formula
has determinant characters evaluated on local units and norm
factors one. For the actual unramified rank-twisted characters
the unit values are one (apply_locFullIdele and
det_maxCompactAt_eq_one); if P f=f then N(B)f=f, and the
box is unchanged. Thus pairWeil(g,h)f=f. In LocalStatement
use precisely projOn_translateDatum supplied by H.support_subset
and D.mem_integralAfter, the same stage x,j,l and unramified
characters hu. This is the spherical input required for the
actual hecke transfer, not a claim that all data are spherical
at every place. Retain finite Weil construction, P commutation,
name identities and the supported scalar proof from 47701c80.

## 3. Commutation and exact moved-mark induction

At a split place l, on a spherical vector v, a compact element
of the local K fixes v and fixes T_{l,i}v: left multiplication
permutes the right cosets in the native double coset sum.
For an arbitrary integral adelic k, write k=k_out k_l with
k_l=atSplit(k.atPlace l) in local K and k_out trivial on l,bar l.
Then k_out commutes with every local coset representative, so
T_{l,i} pi(k)v=pi(k)T_{l,i}v. This also proves preservation
of compact-character level spaces contained in Kf.
It does NOT assert commutation on nonspherical inputs.

Fix the actual D,p,Lambda,l,j and good datum H and retain the
common coefficients c_i from exists_hecke_transfer (same for all
x in support), |iota(c_i)|<=1 when j<m. With A_l=markExponent(l),
delta=deltaP(p), let s_l=p^A_l/p^delta and
 M_l=p^A_l T_{l,r}, r=ceilLogM(p).
The transfer identity for C_j+1 is
 sum_{i<=r} c_i T_{l,i} C_{j+1}(v)=p^delta C_{j+1}(T_{l,r}v).

For a list L of distinct marked places suppose t_L has the
three native properties in exists_move_markOperator, with
Y_L=product of markOperator(l) in native list order. In the
empty case t_empty=1, the gauge bound is mem_raises. For a new
l not in L define
 t_(l::L)=(sum_{i<=r} s_l c_i T^datum_{l,i}) t_L.

Because the original datum is spherical at l and t_L intertwines
the target Kf action, t_L datum is spherical there. The preceding
commutation establishes the new target compact equivariance;
the independent source action commutes with target Hecke operators.
For the pairing property evaluate at any column y: linearity
and lift_equivariant move the new target T through the last
lift, then the actual transfer identity gives
 s_l p^delta C_{j+1}(T_{l,r}Y_L y)
 = C_{j+1}(M_l Y_L y).
All scalars and ordered factors use the original v/y;
no simultaneous eigenbasis needed. The earlier operator's
formula applies at y and the transfer at Y_L y (level preserved).
The result is the native chain property at l::L.

For the gauge property the original tuple g has g_l=1 at the
newly moved place. Each summand inserts exactly one local
basic-double-coset element at l, preserves the conditions at
the earlier L and all other places by disjoint support, and
is admissible for the old gauge estimate. Its coefficient
has norm <=p^(delta-A_l). Since the gauge sublevel is an
O_iota-module after rescaling and the norm is ultrametric,
the whole sum costs this same factor, NOT the number of
cosets or number of i's. The resulting exponent is exactly
 G(L)=sum_{l in L}(delta-A_l)+sum_{l in Lambda} A_l+liftLoss(Lambda,j).
This closes the list induction conditionally on the native
gauge and transfer suppliers. At L=all Lambda exact cancellation
gives G(L)=#Lambda*delta+liftLoss. Iterate j on the same
Y=product over Lambda; at stage j the modified chain equals
C_j(Y^j v), by substituting Y^j v into the just-proved last
lift property. Use H.gaugeLe_chain and GaugeLe.restrictToY,
keeping the actual support and ramified-column level.
The full exponent is sum_{j<m} (#Lambda*delta+liftLoss_j),
as in gaugeLe_markOperator_pow. No summand-count factor.

## 4. Uniform module witness at the actual index/divisibility consumer

Here IndexDvd is the native determinant condition on every
finite family in M; do not assume M is a discrete free Z_p
lattice or identify IndexDvd with a cardinality. For linear
T,S preserving M, let a=p^s and suppose IndexDvd(M,TM+aM,p^u)
and IndexDvd(M,SM+aM,p^v). Apply the first matrix R to an
arbitrary family in M. For each row r_i of the resulting
family, choose x_i in M and z_i in M with r_i=T x_i+a z_i.
Apply the second IndexDvd witness Q to the SAME family (x_i).
Then the new row combination lies in TS M+aM, since T(M)
is contained in M and the a z_i terms stay in aM.
The single witness matrix is Q R, determinant det Q det R
dividing p^(u+v). This proves the actual IndexDvd.comp
case needed for HasType.prod, with no quotient cardinal
argument and no assumption of commutativity of T,S.
Induct over the list repeated m times to recover the
common submodule Y^m M+p^s M. Retain the per-mark quantitative
HasType and its aggregate 3 loss(p) dim bound in
hasType_prod_markOperator_pow; do not claim these from
determinant multiplicativity alone.

At a full marked nonsplit p use the actual s=jetCeil(p),
M=integralColumns and S=Y^m M+p^s M. It depends on D,p,Lambda,
not on twist, good datum or column. For every phi in S
choose u,v in M with phi=Y^m u+p^s v. The native full-mark
numerical suppliers give gauge exponents 2 loss-gain and
loss-gain respectively (RUN62–63). With loss>=1,
both gauges <=p^(2 loss-gain), and the ultrametric gauge
of the sum satisfies the same estimate. For an integer beta
with beta<gain-3 loss+1 we have
 beta+2 loss-gain < 1-loss <=0.
Since multiplying by p^-beta multiplies the gauge by
p^beta, the scaled Bmu(phi) is integral. This is the
slack actually used by the native final caller: no rounding
of a real loss to an integer and no unjustified beta<=gain-err.

At nonsplit p without a full mark, the alternative source
mul_collisionSum_le_loss gives m collisionSum<=loss, so
gaugeLe_collisionSum implies the SAME 2 loss-gain budget
on all M. Choose S=M, index witness identity, exponent 0.
For the level prime N branch (only when not in nonsplitPrimes),
retain exists_indexDvd_fourierOp_pow and gaugeLe_Bmu_at_N
with the original 3mfb exponent; allowedLoss=4mfb.
The exact slack is beta+3mfb<1-mfb<=0 when mfb>=1.
All other primes have allowedLoss=0 and integral gauge
by gaugeLe_one; the native hN and hd guard includes
p != P.d (a nonsplit small prime), so beta integer <1
implies beta<=0. This gives the required common S for all
twists coprime to p and all good Psi with original level
restrictions. No switching S according to which datum is used.
The global sum_allowedLoss_mul_log_le remains a separate
source supplier. This is an actual caller integration and
not a closure of every quantitative input in Theorem A.

## Dependency ledger and independent replay boundary

Source-visible path:
HeckeGL coset + PairSumNegation name action -> spherical adjoint
and transfer -> exists_move_markOperator -> gaugeLe_markOperator_pow
-> full-mark numerical estimates and uniform IndexDvd witness
-> exists_indexDvd_Bmu_divisible -> short_forms -> star_inequality.
Reduced human route uses termwise double-coset invariance instead
of a general adjoint convolution theorem at this caller, compact
projection on the same datum, exact marked list cancellation and
one determinant witness with a uniform twist-independent module.
No native edge removed; original/reduced global graphs and axiom
ledgers unchanged. Retain all other consumers, per-mark type
quantitative aggregate, CM/jet support, level-N supplier and
archimedean shortness/branching, B/C and data/analytic obligations.
Context key: compact pin, l, conjugate place, K, actual U, pi,
pi', B, x,y, S name support, same f, j, Lambda, ordered L, D,
p, Y, module M, s, beta. No URT or imported RH theorem.
No speed claim or synthetic tests.

Local command -v lean/lake/elan returned empty. Actual published
CI outputs re-read from cathedral-research-state
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804, run 45803534769:
six named TiltingLemma/Filling.Moments checks, three standard
axioms propext, Classical.choice, Quot.sound; A module build
timed out (124, 2700.11s), all_requested_checks_ok=false and
full_RH_replay=false. No native rh_scan/prune/reduce/auto/frontier
executed on compact context. Prepared scalar bridges and actual
named declaration probes below, uncompiled. Do not import Main.
No new native PASS. Independent audit requested.

RESUME HERE: integration/editor splice section 1 into the
actual RUN69 bilinear pairing, section 2 into its local datum
guard, and sections 3–4 into LocalStatement uniform index
argument. Next verify the quantitative sum of per-mark HasType
costs in LocalStatement.hasType_prod_markOperator_pow against
MarkedPrimeType and TwistedHeckeType, and the separate
archimedean weylNormSq_Bmu_le caller. Preserve existing
branching hook and canonical CM pullback peer work.
HANDOFF TO integration, editor, theta, formal audit, kernel runner.
Human RH reconstruction incomplete.
-/

namespace AccelerationRun68

/-- Exact termwise transfer, once the native double-coset
invariance and simultaneous-action identity have been supplied. -/
theorem adjoint_term {A : Type*} (a b c : A)
    (h₁ : a = b) (h₂ : b = c) : a = c := h₁.trans h₂

theorem marked_exponent_cancel (delta A E : ℝ) :
    (delta-A)+A+E=delta+E := by ring

theorem full_mark_slack (beta gain loss : ℝ) (hl : 1 ≤ loss)
    (hb : beta < gain-3*loss+1) : beta+2*loss-gain ≤ 0 := by
  linarith

theorem level_slack (beta cost : ℝ) (hc : 1 ≤ cost)
    (hb : beta < -4*cost+1) : beta+3*cost ≤ 0 := by
  linarith

theorem two_gauge_bounds (beta gain loss c d : ℝ)
    (hl : 1 ≤ loss) (hb : beta < gain-3*loss+1)
    (hc : c ≤ 2*loss-gain) (hd : d ≤ loss-gain) :
    beta+max c d ≤ 0 := by
  have h : max c d ≤ 2*loss-gain := max_le hc (by linarith)
  linarith

#print axioms adjoint_term
#print axioms marked_exponent_cancel
#print axioms full_mark_slack
#print axioms level_slack
#print axioms two_gauge_bounds
end AccelerationRun68

#check heckeSplit_adjoint
#print axioms heckeSplit_adjoint
#check heckePolyOp_adjoint
#check pairWeil_name_of_mem
#check Data.IsGoodDatum.exists_move_markOperator
#check Data.IsGoodDatum.gaugeLe_markOperator_pow
#check IndexDvd.comp
#check HasType.prod
#check Data.exists_indexDvd_Bmu_divisible
#print axioms Data.exists_indexDvd_Bmu_divisible
