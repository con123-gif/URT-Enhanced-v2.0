import New.Rows.HeckeValueHeight
import New.Rows.LiftVolumeHeight
import New.Selmer.FitTwistsExist

/-!
# RUN51 — compact C: class character Fourier selection, rank-one averaging, and paired local height

2026-11-26. HUMAN SOURCE-MATCHED derivation, with a prepared scalar
certificate and native audit commands (not executed). Compact source:
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Latest mission
blob 23f64d503b7d64bb13b9667156b499021038d742, expanded-workload amendment.
Read current manuscript, protocol, handoff, expansion, AGENTS and peer
commits d93adfe1 (pencil descent), fcd5da81 (multivariate roots already
translated), bd1a2355 (general determinant), 898feb42 (odd Sha), a144d8de
(rows). Do not duplicate those. No change to manuscript, old graphs or axioms.

Actual compact source ledger (static caller edges only):
 New/Selmer/RankOneDenominator.lean 18776ac0e6b71a1f66075e9c7276e3aff757f18b
  centralRep, twistedCentralOp, inner_twistedCentralOp,
  twistedCentralOp_kernelForm, twistedCentralOp_trivialLift,
  DenominatorLe.rank_one_bound.
 New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825
  IsTested, IsTestForm, DenominatorLe, Data.IsFitFamily.
 New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14
  exists_isFitFamily gives common fit family, both denominator estimates.
 New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84
  exists_twisted_classSum_ge, exists_factorisation_le,
  exists_test_form_inner_kernelForm, heightLe_inv_ratio,
  heightLe_inv_heckeValueProd_div.
 New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1
  heightLe_liftVolume_ratio consumes the Hecke product estimate.
 New/Heights/Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518
  HeightLe and HeightLe.mul.
 New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05
  heightLe_volume_ratio_sq -> integral_forms_long -> star_inequality.
 Main.lean a5d8389131c985a0b54ce5b0e778ee5c8126a997 and New/Main.lean
 198ed5bf26aa294898931e0649bc2b88f1389f65 are root/assembly anchors.
 No import of Main or root theorem in this certificate.

## 1. Fourier extraction on the actual rank-one class group

In exists_twisted_classSum_ge put A=G_f(U(1))/(Gamma K).
Abelianness gives a finite abelian group (Gamma and K commute), not merely
a double-coset set. Let N=|A|>0. Keep all hypotheses: rational points
contained in Gamma, principal level at the specified places inside K,
and every stabilizer trivial. Fix the native coset representatives g_c,
including g_1, and take z=g_1^-1. No invariance of the arbitrary input s
is needed. Put S(c)=s(g_c z). Then S(1)=s(1).

Every complex character chi of A is realized on these cosets by a
weight-zero tame character at the allowed places: this is the actual
AutChar.exists_mem_tameChars supplier, with the principal-level inclusion
and rational-point triviality. Since the characters separate A and there
are N of them, sum_chi chi(c) is N if c=1 and zero otherwise. Trivial
stabilizers make classSum the unweighted sum and classSum 1=N.
Thus Fourier inversion at 1 gives the exact identity

 s(1) = sum_chi [ (1/N) sum_c chi(c) S(c) ].

The translated representatives have coset c, since z represents identity.
After applying the fixed l-adic embedding the ultrametric inequality
bounds the left norm by the largest norm of one bracket. This proves
exists_twisted_classSum_ge at the exact normalization (not a loss N).
This argument also covers N divisible by l: division occurs BEFORE
applying ultrametric inequality, so no extra |N|_l^-1 arises.

Next, exists_factorisation_le: for the finite group G of characters
and fixed psi, let V^|G|=prod_chi a(chi)b(chi). For every chi set
phi=psi chi^-1. The map chi -> phi is bijective, so the product of
a(phi)b(chi) is exactly V^|G|. Apply the embedding and multiplicativity.
Some factor has norm >= |V| (if V=0 this is immediate). This supplies
the TWO compatible characters psi_3, psi_1 used in the actual
heightLe_inv_ratio proof, without independently maximizing their values.
The same V, chosen as an algebraic root of the fixed untwisted product
in that proof, serves every embedding, not one V_l for each l.

## 2. Exact central averaging on the rank-one line

In RankOneDenominator let T=Y.trivialLift and Z=C T. If T=0 the desired
bound is immediate, because P_Z=0. Otherwise write U(z)=Y.twistedCentralOp z.
The actual inner_twistedCentralOp states U(z)^*=U(z^-1). The
kernel identity is U(z^-1)K(g)=K(gz). Averaging K over the finite class
space (with the specified class weights) gives T. The trivial stabilizer
condition means all weights are 1, and the kernel is invariant under
representative changes at chosen level. Consequently U(z)T=T.
This last equality also has its own native proof, twistedCentralOp_trivialLift.

Choose the N representatives s_i integral above l by
exists_reps_integralAbove. For the second test form X' define

                    A X' = sum_i U(s_i)^-1 X'.

The same integral form condition at the chosen embedding holds for A X':
the central character scalar times the translated form preserves the
Weyl gauge at integral representatives (native weylGauge_smul,
norm_padic_det and weylGauge_mul), and the integral forms are a module.
Do not replace this by complex unitarity, which would not imply local
integrality.

For the tested condition at a split off-level w, take any y in
im e_(X-1) intersect ker H_w(testValue) intersect Z^perp.
Then ybar=sum_i U(s_i)y remains in im e_(X-1) and ker H_w(testValue):
central translations commute with the group algebra action and Hecke
operator, and scalar multiplication preserves the subspaces. For any g,

 <ybar,K(g)> = sum_i <y,U(s_i)^-1 K(g)>
              = sum_i <y,K(g s_i)> = <y,T> = 0.

Here the class sum on g s_i equals that on s_i, by abelianness and
permutation of the finite quotient; use native kernel invariance and
trivial stabilizers. Thus theta(ybar)=0 by theta_eq_inner_kernelForm
(the choice of conjugate convention does not affect zero). As X' is
IsTestForm, it is orthogonal to this tested ybar; adjointness now says
A X' is orthogonal to y. This proves the precise IsTested for Z^perp
required by DenominatorLe, from IsTested for ker theta. It is NOT true
that arbitrary X' is itself tested for Z^perp without the averaging.

Since U(s_i) fixes T, projection P_Z A X'=N P_Z X' by the rank-one
projection formula. Apply the native DenominatorLe with d=1 and r=1,
the unchanged first test form X, and second test form A X'. Hence

                      |iota(N <X,P_Z X'>)| <= exp(beta).

This reconstructs DenominatorLe.rank_one_bound, including its exact
factor N and all test conditions. The actual input in heightLe_inv_ratio
is ((G iota).2 p hE).rank_one_bound from the SAME fit twist family.
The nontrivial arithmetic denominatorLe_rowBudget remains a supplier.

## 3. Pair conjugate local tests BEFORE taking the height

In heightLe_inv_ratio keep its common scalar V from step 1 and
its actual auxiliary rank-four pair q2. At each fixed prime embedding
iota let theta=(theta_iota)^j, W=Pair.trivialLift H theta,
Q=q2.ratio theta (real nonzero), F=D.forcedPart l and
N=card StdClasses D.chosenLevel. W is nonzero by the native norm
identity/ratio_nonzero guard. Its line agrees with C T of step 2,
since Pair.trivialLift is a nonzero scalar multiple of T.

The native statement K (constructed from the depth indicator,
step 1, and exists_test_form_inner_kernelForm) gives a test X at
iota, and a test X' at the embedding iota composed with conjugation.
These may be different test forms, but the twist, W, Q and V remain
unchanged. Conjugate symmetry of the Petersson pairing and reality of
Q give, by multiplication of K's two inequalities,

 |iota(V conjugate(V))| l^(-2F)
 <= |iota(N^4 <X,W><W,X'> / Q^2)|.

The rank-one projection identity cancels the inner products exactly:

 N^4 <X,W><W,X'> / Q^2
   = (N^3 ||W||^2 / Q^2) * (N <X,P_Z X'>).

Use step 2 with beta=gamma_l, the common fit denominator budget
for this rank-one line. Divide only by the nonzero N, Q, ||W|| and
positive l-adic norm factors. The precise witness inequality is

 |iota((V conjugate(V)) (Q/||W||)^2 / N^3)|
                 <= exp(gamma_l + 2 F log l).                  (H)

At archimedean embeddings the same witness V conjugate(V) is bounded
by exp(2B0), since the native norm_conj_intAlgPart_le and depth
indicator bound give |sigma V|<=exp(B0) for EVERY sigma by step 1.
Its nonvanishing is from V^|G| equal to the untwisted product and
nonvanishing of that product (native t0/intAlgPart guards).
This is exactly the HeightLe witness appearing in heightLe_inv_ratio,
with local exponents gamma_l+2F log l, including the sign of F.
Use the native primeSum_eq_sum_localAsk for sufficiently large U and
sum gamma_l<=B0 from the same fit family; retain the source
nominalWeight<=a bound and x^999<=B0. The two other factors in the
height proof are heightLe_norm_trivialLift_sq and the squared inverse
ratio bound of the ramified q2; their multiplication and native
ratio_eq_intAlgPart_div identify the desired inverse ratio (using
integral rational scaling). No claim that the depth indicator,
test-form existence or the full global height inequality is now
independently reconstructed. The cancellation (H), however, is the
actual missing scalar consumer and does not add a new local premise.

Original/reduced graph: retain old graph, no global deletion.
For H the two local K bounds + rank_one_bound + exact projection
identity imply the same local HeightLe inequality. rank_one_bound
uses integral rep choice, commuting actions, kernel transformation
and DenominatorLe. Fourier and factor selection feed K; the test-form
and depth-indicator suppliers remain. All actual fit family, odd-Sha,
balanced rows, denominatorLe_rowBudget, Hecke trace, volume and A/B/C
assumptions remain on frontier. No axiom changes or theorem shortcuts.

Verification: actual source retrieved at stated pin; CI status file
cathedral-research-state:compute/rh-compact-union-graph-20261126/status.json,
run 45781154005, records returncode 1 RESOURCE_BLOCKED before build
despite successful wrapper jobs. Old native reduction toolchain is
different; no fresh rh_scan/rh_prune/rh_reduce or kernel axiom output
on this compact environment. Prepared commands below; no PASS.
No numerical experiment is needed for the exact identities.

RESUME HERE: Reconstruct the actual K construction's
exists_test_form_inner_kernelForm using the three xiSum factors,
depth_indicator_jet and modKernel factorization; keep t != 0,
all rank-one label and twist prime-to-l conditions and the exact
N^3 vacuumScale normalization. Then complete the global
heightLe_inv_ratio budget and feed heightLe_inv_heckeValueProd_div.
HANDOFF TO: integration, editor, math, formal audit and kernel lanes.
-/

namespace CompactRankOneHeightAudit

/-- Abstract positive scalar tail of (H); use after the exact rank-one
projection identity has been substituted in the two local K bounds. -/
theorem paired_local_bound (A B C N W Q E : ℝ)
    (hN : 0 < N) (hW : 0 < W) (hQ : 0 < Q)
    (hE : 0 ≤ E) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hC : A * B ≤ C) (hproj : C ≤ N^3 * W^2 / Q^2 * E) :
    A * B * (Q / W)^2 / N^3 ≤ E := by
  have hpos : 0 < N^3 * W^2 := by positivity
  have hq : 0 < Q^2 := by positivity
  have H := hC.trans hproj
  have H' := (le_div_iff₀ hq).1 (show A * B ≤
      (N^3 * W^2 * E) / Q^2 by convert H using 1 <;> ring)
  apply (div_le_iff₀ (pow_pos hN 3)).2
  rw [div_pow]
  apply (div_le_iff₀ (pow_pos hW 2)).2
  convert H' using 1 <;> ring

#check exists_twisted_classSum_ge
#check Data.exists_factorisation_le
#check LValueData.inner_twistedCentralOp
#check LValueData.twistedCentralOp_kernelForm
#check LValueData.twistedCentralOp_trivialLift
#check DenominatorLe.rank_one_bound
#check exists_test_form_inner_kernelForm
#check heightLe_inv_ratio
#check heightLe_inv_heckeValueProd_div
#check Data.heightLe_liftVolume_ratio
#check exists_isFitFamily
#print axioms paired_local_bound
#print axioms DenominatorLe.rank_one_bound
#print axioms heightLe_inv_ratio

end CompactRankOneHeightAudit
