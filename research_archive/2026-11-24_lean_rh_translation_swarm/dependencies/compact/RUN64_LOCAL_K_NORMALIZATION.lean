import New.Rows.HeckeValueHeight
import Mathlib.Tactic

/-!
# RUN64 — exact local K bridge at the rank-one height consumer
2026-11-26. Dependency lane 12. Human source-matched argument; Lean candidates
uncompiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, latest compact
completion instructions. Prior lane commit 8f02772b07ec68de2e9cf7bce464abb258d0981c.
Pinned source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, HUMAN_PROOF_COMPACT and
continuity files. Peer kernel baf9dee1, acceleration 8c8ccef6, editor
add4eea, integration f775ec50, audit 257d027. Character boxes RUN51,52,53,
54,62,63 and structure RUN52_RANK_ONE_THREE_BLOCK_CONTRACTION already
cover depth suppliers, common frame, Fourier selection, three-block test
construction and paired local height. Do not duplicate their derivations.
Here splice their actual output into the still-retained K witness in
heightLe_inv_ratio, removing a separate normalization premise in the
human presentation, not deleting a kernel dependency.

Native ledger (actual bodies inspected at pin; static/contextual only):
 New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84:
  exists_twisted_classSum_ge, Data.exists_factorisation_le,
  Data.exists_test_form_inner_kernelForm, Data.heightLe_inv_ratio.
 New/Rows/GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e:
  Data.depth_indicator_jet.
 Lib/Weil/Construction/DataProduct.lean 6f4d0c2b91bf3fb0f9fc20e81c606d3d2ebe8bab:
  Space.jetSeries_apply.
 Lib/Weil/MixedModel/NameModulus.lean f382771e76b0624e7b10d523ce9d854737be00ec:
  modDatum, modKernel.
 Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1:
  pairChar, pairWeil, pairTheta.
 Lib/Weil/DualPair/TwoLineTerms.lean 06a335214712d21667b42fb333de2b087a9c3f1d:
  modKernelI_block.
 Lib/Weil/DualPair/PairSumNegation.lean d2f45383d2e972574a7e749da0f2b4bb9283c6da:
  pairWeil_boxProd_target.
 New/Exchange/AlgebraicPartDefs.lean 7d791291bd2f9b6e9bd1a21b20254632c3a3606c:
  LValueData.trivialLift_eq_stdClassSum_translate, inner_trivialLift,
  theta_eq_inner_kernelForm, Data.Pair.trivialLift.
 New/Exchange/TriangleLevelExponent.lean e1b3a17423c1f003c1d5311ef484638973750ac4:
  ratio_eq_intAlgPart_div, intAlgPart_ne_zero.
 New/Rows/MemberOrthogonality.lean aca8828d477a4510ab80964e1572f34ef220a2c1:
  descentsVanish_hypSum, stdClassSum_period_eq_zero (retained).

## 1. Same datum, degree, scale and factorials

At the actual rank-one p, fixed lift index j, fixed fit twist family,
prime l and embedding iota, write X=lValueData H theta,
n=2*p.z, m_tau=p.c(tau)-p.z, d=sum_tau m_tau,
N=card StdClasses D.chosenLevel>0, kappa=P.vacuumScale D.s,
lambda=conj(D.piG)*P.jetScale D.s, B=prod_tau m_tau!,
F=D.forcedPart l. The depth theorem supplies a common t != 0 before
the choice of l and modulus; choose its alpha,x0 for the actual
modulus D.M(theta,1,false) with ideal span(piGBar).
Keep its row sums sum_i alpha(tau,i,())=m_tau. Hence degree(alpha)=d.
Let A_alpha=prod_(tau,i) alpha(tau,i,())!, a positive integer.
Define s(g)=modKernel for rank 12, characters (1,b), this indicator,
monomial alpha, source (1,g), target (1,1), b=X.auxPair.b/b2(theta).

By Space.jetSeries_apply and modDatum, at identity the exact coefficient
of the *same* indicator vacuum datum is lambda^d*s(1)/A_alpha.
At identity both group factors and characters act trivially. The
iterated integrated maps insert the real polynomial vector in place
of the real vacuum; no extra factorial appears. Thus the depth
conclusion is

 l^(-F) <= |iota(C*s(1)/t)|,  C=kappa^12*lambda^d*B/A_alpha.   (D)

Do not switch to unscaled Taylor series, discard factorials, or
assume lambda or t is an l-adic unit.

## 2. Exact block factor and character orientation

The native pairChar(a,b)(g,h)=a(det h)/b(det g) gives, for the same
datum and P, s_psi(g)=modKernel(1,b/psi)(g,1)=psi(det g)*s(g).
The inverse in pairChar is essential: b*psi would yield psi^-1.
The Fourier selector from RUN51 gives z,psi and

 |iota(s(1))| <= |iota(S/N)|, S=classSum_g s_psi(g*z).           (F)

The chosen level has trivial class stabilizers, so classSum 1=N.
The sum is evaluated on the actual translated representatives; s need
not descend independently to the quotient.

For the selected three flat blocks, the native block identity
modKernelI_block is exact: split the finite indicator into its two
row-restriction functions, use boxProd_name and boxProd_integrated
for the finite datum and realBoxProd_polyVector for the product of
renamed polynomials. The block determinant is det(h1)*det(h2),
so pairWeil_boxProd_target splits the twisted scalar as well as
the Weil operator (omega_boxProd). theta_boxProd_target evaluates
the product. Repeat twice for the four blocks of ranks 12,4,4,n-20.
The native chosen-column indicator identity at levelModulus 2 and
all test-form orthogonality/integrality guards are retained; the
factorization is NOT a statement for arbitrary non-product data.

By Data.exists_factorisation_le applied to the *common* root V,
select psi3,psi1 with psi3*psi1=psi and

 |iota(V)| <= |iota(I3*I1*t*I20)|,                             (P)

where I1,I3 are the untwisted normalized values of the selected flat
pairs, I20=q2.intAlgPart H2 .one and I2t=q2.intAlgPart H2 theta.
The depth and product selections are compatible: the three character
products give exactly X.auxPair.b, not a separately chosen b.
Native test form Xi from exists_test_form_inner_kernelForm satisfies
IsTestForm l Xi and for EVERY g:

 <Xi,K_g> * N^3 * kappa^(n-12)
   = (B/A_alpha)*I1*I3*I2t*s_psi(g).                          (E)

Here n-12=(2*p.z-20)+8 by the retained rank guard n>=20.
This equality is the peer structure RUN52 output with the exact
factorial ratio, not just a bound on the kernel.

## 3. Remove all normalizations BEFORE norms

Use the actual translated class sum and adjointness from
AlgebraicPartDefs; the inner product is linear in its second argument.
With W=Data.Pair.trivialLift H theta, its scalar is
kappa^n*lambda^d multiplying the unscaled class sum of K_g.
Sum E over g*z and multiply by kappa^12*lambda^d. This yields

 N^3 * <Xi,W> = C*I1*I3*I2t*S.

No division by kappa is needed. By ratio_eq_intAlgPart_div the
native rho=q2.ratio theta=I2t/I20; both normalized values are nonzero.
Divide algebraically, using N>0, to obtain the decisive local bridge

 N^2 * <Xi,W> / rho = C*I1*I3*I20*(S/N).                      (K-exact)

This is an identity of complex numbers, before applying iota or a
norm. In particular there is no extra N, lambda, kappa or factorial
penalty. Multiply the two nonnegative inequalities D and P and use F.
The t cancels exactly since t != 0, giving

 |iota(V)| * l^(-F) <= |iota(C*I1*I3*I20*S/N)|
                    = |iota(N^2*<Xi,W>/rho)|.

This supplies the actual local K in heightLe_inv_ratio with its
unchanged Xi, not another independently chosen witness. At primes
dividing N the normalization remains exact; no assertion |N|_l=1.
At the conjugate embedding repeat the native witness selection with
the same V, W, rho and theta but potentially different Xi. RUN63 and
character boxes RUN51 then give the paired height inequality with the
same rank-one projection bound. This run does not close that bound's
remaining arithmetic suppliers, nor any global A/B/C primitive.

Contextual reduction (retain originals and all previous graphs):
 depth_indicator_jet -> D (exact Taylor coefficient)
 exists_twisted_classSum_ge -> F (same shifted class sum)
 exists_factorisation_le -> P (same root V and compatible characters)
 exists_test_form_inner_kernelForm -> E plus IsTestForm
 E + translated class sum + ratio_eq_intAlgPart_div -> K-exact
 D,F,P,K-exact -> native K -> paired local height -> heightLe_inv_ratio
 -> heightLe_inv_heckeValueProd_div -> heightLe_liftVolume_ratio.
Cache key (pin,D,j,p,theta,l,iota,modulus,alpha,x0,z,psi,psi1,psi3,
q1,q2,q3,t,V,Xi); shared t and V are not embedding-dependent.
No global edge deletion, no imported claimed RH theorem, no new axioms.
The depth proof, integral test form, period vanishing, rank-one
denominator budget and upstream C dependencies remain explicit; all
A/B and arithmetic root obligations unchanged.

Verification: retrieved actual pinned source and actual CI results
cathedral-research-state:compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
and status.json blob a56e2d3afb99ed8275e81fd63c8494306e57c43f,
run 45803534769: six native declarations in TiltingLemma and
Filling.Moments with only propext, Classical.choice, Quot.sound;
module_1 build timeout code 124, all_requested_checks_ok=false,
full_RH_replay=false. Neither this nor old-pin engine passes is a
verification of the new bridge. Local command -v lean/lake/elan
returned no executables. Below are prepared scalar certificates and
native axiom queries; no kernel PASS, no fresh rh_scan/prune/reduce/
auto/frontier measurements. The old toolchain is incompatible with
the compact pin; no claimed O(N) gain. No URT or synthetic tests.

RESUME HERE: audit actual MemberOrthogonality period bridge at
stdClassSum_period_eq_zero (test form and comparison form share it):
inspect Lib/Shimura/ComplexTheta/PeriodVanishing.lean and native
descentsVanish_add_planes and descentsVanish_of_reflectionSum.
Track the nonzero complementary kernel, its exact block character,
away-level vacuum projection and class integral conversion. Coordinate
with theta/geometry lanes and skip any already-completed supplier.
Replay these exact native declarations and scalar certificates at the
compact pin, collect axioms and preserve both dependency graphs.
HANDOFF TO integration/editor, character boxes, geometry, theta, kernel.
-/

namespace CompactLocalK64

/-- Exact normalization, with no condition on the norm of N or t. -/
theorem cancel_class_ratio (N W C I1 I3 I20 I2t S : ℂ)
    (hN : N ≠ 0) (h20 : I20 ≠ 0) (h2t : I2t ≠ 0)
    (h : W * N^3 = C * I1 * I3 * I2t * S) :
    N^2 * W / (I2t / I20) = C * I1 * I3 * I20 * (S/N) := by
  calc
    _ = (W*N^3) * (I20/(N*I2t)) := by
      field_simp [hN,h20,h2t] <;> ring
    _ = _ := by rw [h]; field_simp [hN,h2t] <;> ring

theorem cancel_depth_witness (C s I1 I3 I20 t : ℂ) (ht : t ≠ 0) :
    (C*s/t)*(I1*I3*t*I20) = C*I1*I3*I20*s := by
  field_simp [ht] <;> ring

/-- Norm comparison only after the exact complex cancellations. -/
theorem local_bound (a v c b s f : ℝ)
    (ha : 0 ≤ a) (hv : 0 ≤ v) (hc : 0 ≤ c) (hb : 0 ≤ b)
    (hs : 0 ≤ s) (hd : a ≤ c*s) (hp : v ≤ b)
    (hf : s ≤ f) : v*a ≤ c*b*f := by
  calc
    v*a ≤ b*(c*s) := mul_le_mul hp hd ha hb
    _ = (c*b)*s := by ring
    _ ≤ (c*b)*f := mul_le_mul_of_nonneg_left hf (mul_nonneg hc hb)

#print axioms cancel_class_ratio
#print axioms cancel_depth_witness
#print axioms local_bound
end CompactLocalK64

#check Data.depth_indicator_jet
#check exists_twisted_classSum_ge
#check Data.exists_factorisation_le
#check Data.exists_test_form_inner_kernelForm
#check Data.Pair.ratio_eq_intAlgPart_div
#check LValueData.inner_trivialLift
#check Data.heightLe_inv_ratio
#print axioms Data.depth_indicator_jet
#print axioms Data.exists_test_form_inner_kernelForm
#print axioms Data.heightLe_inv_ratio
