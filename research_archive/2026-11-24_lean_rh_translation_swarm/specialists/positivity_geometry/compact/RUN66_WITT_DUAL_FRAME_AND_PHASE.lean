import New.Filling.FillingData
import New.RealPlace.FrameNorm
import Mathlib.Tactic

/-!
# RUN66 — Witt dual frame, exact phase, and size at the same Bessel caller
26 November 2026. Human source-matched derivation; independent audit pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
0ef71fd3afc82ac3e5c0fc0e23d5533a9e495dc9. Predecessor RUN65 a0efe5da.
Latest peers: audit 9bd45a52, literature f937bf17, character 0aa56c1f,
Galois e57db995, theta 3a912a78, integration 3d8ec587; distinct consumers.

## 1. Native Witt frame, with an explicit left-inverse witness
Keep every premise of IsSteep.exists_isTwoFactor_besselPairHom:
sign frame p unitary, X positive weight-zero, alternating tail signs,
strictly decreasing integral tail weights Lambda_i in [-3B,-B],
B>=1, a natural, 3B+a<=2b^2, b>=8(rho+1). Compact weight a at
k0=tau(inr unit), zero at tau(X). Write n=rho+1 and M0=2n.
Use RUN64's Lagrange weights for the distinct nodes 0,t_0,...,t_(M0-1),
t_i=Lambda_i-a<0. Index the c's by 0 for node 0 and i+1 for t_i.
The non-X moment columns before p have entries
    c0^(0^j) t_i^j/c_(i+1).
Call their images by p V_j (j>=0), and the X columns E_x.
Signed Gram calculation, valid whenever j+k<=2n:
    h(V_0,V_0)=1;
    h(V_j,V_k)=0 if 0<j+k<2n;
    h(V_j,V_k)=-1 if j+k=2n and j,k>0.
Also h(V_0,V_(2n))=-c0, which is NOT used.
Indeed Lagrange interpolation gives sum_(i=0)^(M0-1)
(-1)^i t_i^d/c_(i+1)^2 = -1_(d=2n)+1_(d=0)/c0^2
for d<=2n. Multiply by the c0 factors. The E_x are orthonormal
and orthogonal to every V_j. No assertion about higher Gram entries.

Map E_x to the standard vector of X0 at tau(x), V_0 to k0,
and V_j (1<=j<=n) to f_j=e_j for j<n, f_n=z.
The target columns are independent. To prove independence of the
source columns, pair against E_x, V_0 and V_(2n-i) for i=1,...,n.
The latter rows paired with V_j have zero for j<i, -1 for j=i,
arbitrary for j>i, and zero in column V_0 since 2n-i<2n.
V_0 paired with V_j (1<=j<=n) is zero. Negate the latter n rows:
the resulting paired matrix is upper unitriangular (with identity
on the E_x,V_0 block), determinant 1, hence provides a left inverse.
The two frames have identical Gram matrices: positive identity on
E_x,V_0, zero cross pairings, and last frame block with only z
having norm -1. The ambient complex Hermitian form J is nonsingular.
Apply Witt's extension theorem for isometries of subspaces of a
nondegenerate Hermitian vector space over C, including degenerate
subspaces. The matched independent columns give an isometry of
their spans, so a single g in U(J) extends it. This is precisely
the native witt application, not an assumption that these isotropic
frame columns themselves form a nonsingular subspace.
Set q=g p. Use THIS SAME g throughout; do not choose a separate
bounded frame or a different phase witness.

## 2. Dual-frame size: direct argument for the actual native supplier
Let v_i=V_(i+1) for 0<=i<=2rho. Then g^-1 f_(i+1)=v_i for
i<=rho, h(v_i,v_j)=-1 if i+j=2rho and zero for i+j<2rho.
All these vectors have Euclidean norm <= M=b^(5rho+3):
unitarity of p, c_(i+1)>=1 and t_i^2<=b^5 give
    ||V_j||^2 <= (2rho+2)b^(5j) <= b^(10rho+6)
for 1<=j<=2rho+1, since 2rho+2<=b and b>=1.
In particular M>=1. Here and below h is the indefinite form and
the ordinary Euclidean inner product is distinct.

Perform Euclidean Gram-Schmidt in frame order v_0,...,v_rho.
The resulting f'_i is v_i plus a combination of v_j, j<i.
Pair with v_(2rho-i): earlier terms vanish and h(f'_i,v_(2rho-i))
=-1. Since J is a unitary involution, Cauchy-Schwarz yields
    1/M <= ||f'_i|| <= ||v_i|| <= M.
Thus no zero denominator in Gram-Schmidt. The change matrix is
upper unitriangular; the native liftUnitri realizes it in besselU,
by choosing the inverse change when needed. Write y=u g so
y^-1 f_(i+1)=f'_i, with u in besselU. The frame Gram is unchanged:
all but the last are isotropic and mutually orthogonal, last has
norm -1 (the triangular change preserves this pattern).
For i<rho let B_i=J f'_i/||f'_i||^2. Then
    h(f'_j,B_i)=delta_ji, h(B_i,B_j)=0, ||B_i||<=M,
using Euclidean orthogonality and the unchanged frame Gram.

The exact unipotent adjustment needed here is elementary. Put s=y^-1,
transport the columns B_i by s^-1, and use standard blocks
(e, X0, z, e*) in that order. The duality gives bottom block I
and z block 0; write remaining blocks H,P. Isotropy gives
H+H*+P*P=0. Choose a0=-P*, K=H+P*P/2 skew Hermitian. In
unipotentOf(a0,skewCoords K) the dual columns are exactly
(H,P,0,I), and the frame is fixed. This is the actual
exists_mul_unipotentOf_dualCols_eq witness. Thus some left translate
of y by besselU0 has inverse A with frame and dual columns of norms
<=M simultaneously (take inverse of the indicated right translate).
Let L,D,Z be the A-images of isotropic, dual and z columns, and W
the remaining positive columns. Since A J A*=J,
    WW*=J-LD*-DL*+ZZ*,
    AA*=J+(L-D)(L-D)*+2ZZ*.
Hence ||A||op^2<=1+4rho M^2+2M^2, from sums of rank-one norms.
Also ||A^-1||op=||A||op as J is a unitary involution.
For M>=1 this yields ||A^-1||op+1<=8(rho+1)M.
Use precisely besselSize_le and its left invariance under besselS,
giving
    besselSize g <= 8(rho+1)M <= b^(5rho+4) <= b^(5n).
This proves the native sufficient bound for the SAME Witt frame.
No estimate on the norm of the initial arbitrary Witt extension
itself is necessary. Handles rho=0 (empty dual columns).

## 3. Exact lower-triangular phase, before any norm
Let D=q diag(Lambda) q^-1. It is J-selfadjoint:
D=J D* J, since Lambda is real diagonal and commutes with sign.
The moment shift is exact:
    D E_std=0 on tau(X);
    D k0=a k0+c0 f_1;
    D f_j=a f_j+f_(j+1) for 1<=j<n.
There is no imposed shift formula for D f_n outside the needed
columns. Define C1=sum_(j=1)^(n-1) E_(f_(j+1),f_j) and
C=C1+J C1* J. Then C is J-selfadjoint. In the native flag
levels e_1,...,e_rho,(X0,z),e*_rho,...,e*_1,
D-C is block upper triangular: for every e_j column, the only
strict lower entry of D is f_(j+1), exactly C1. The J-adjoint
part has no contribution in these columns. For the other strict
lower entries, reflection (i,j)->(opposite(j),opposite(i)) by J
reduces to the e_j column cases, including the z-to-e*_rho entry
with the minus sign from J z=-z. Middle-middle entries have equal
level and impose no condition. This proves the precise triangular
trace cancellation used in BesselExistence, without needing any
control of the remaining high moment entries.

For s=(S,k) in besselGraph let H=embedH(k). Then S=H u, u in
besselU. S-H is strictly block upper triangular, so
    tr(D(S-H))=tr(C(S-H)).
tr(C1 S)=sigma(S), tr(C1 H)=0. Because S,H preserve J,
    tr(J C1* J (S-H))
       = conj tr(C1(S^-1-H^-1))
       = -conj sigma(S),
using the additive simpleRootSum on besselS and its vanishing
on H. Thus tr(D(S-H))=sigma(S)-conj sigma(S).
On the positive X0 block, D is zero on tau(X) and acts with
diagonal a on k0, with an extra term c0 f_1 orthogonal to X0.
As H-I is supported on X0,
    tr(D(H-I))=a(k_(k0,k0)-1)
              =tr(diag(Lambda') (k-I)).
Consequently the exact two-factor phase is
    tr(diag(Lambda)(q^-1 S q-I))
      -tr(diag(Lambda')(k-I)) = sigma(S)-conj sigma(S).
The expression is imaginary and additive. Also tr(S-I)=tr(H-I)
=tr(k-I), by the same strictly triangular difference.
This directly supplies phase_eq, trace_eq, phase_mul, re_phase of
IsTwoFactor, with signs and compact weight retained.

## 4. Diagonal subgroup and exact B consumer
For any unitary U on X, embed it as k on tau(X) in X0, fixing k0.
Take the graph element (embedH k,k), unipotent part identity.
The q-image of the original X block is exactly tau(X) in X0;
it is a positive orthonormal subspace and its J-orthogonal
complement is the q-image of the sign-orthogonal complement.
Thus q^-1 embedH(k) q differs from I only by U-I in that X block,
while k-I has the required tau-supported block. This is exactly
exists_diagonal, even for X empty. The remaining right signs and
weight bounds of IsTwoFactor are immediate: all signs positive,
weight a>=0, zero on tau(X), so opposite-sign implication vacuous.
Together sections 1-4 prove the native existence statement with
the original size b^(5n), no weakening of IsSteep.
Use this g in Data.exists_besselSystem, whose actual call passes
the size witness to exists_cut_isCutPair and the SAME IsTwoFactor
to laplace_method (beta=b^3). RUN65 supplies the Gaussian
comparison, RUN64 the cone and absorption, RUN63 the peak/cut
energy. This is a connected human frame/phase/size supplier,
not a new Bessel system independently selected at each step.
Retain FlenstedJensen representation/shift, exact coefficient
decay, Schur and measure inputs, and distinct Rallis/Siegel-Weil
and global filling/absolute-tail suppliers as previously flagged.
No new claim that Theorem B or the human RH proof is complete.

## 5. Sources, graph and verification
Freshly read compact blobs:
New/DiscreteSeries/BesselExistence.lean d24e51a59e3048dfa5279c6e39055f4c2cea38ad
New/DiscreteSeries/TwoFactorSetup.lean fe2191cfa7eadc8683787a881a5f2fa16a9a0667
New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278
New/RealPlace/FrameNorm.lean 06a65cfd754f2688b899d08320f627fdea415db0
Lib/DiscreteSeries/Bessel/UnipotentCoords.lean 4dbc16d9e327b2b9667b1bb7982e497d5fb6ef78
Lib/Adelic/Poincare/BesselSubgroup.lean 4cfedb82d9c709e48f4c7ada365b284a9e68642d
Lib/DiscreteSeries/Bruhat/FloorGroups.lean ec03810781f335ba1c19f6b818b015f6d4014bac
Lib/Adelic/Witt/FrameAction.lean cd3f13d59a5f2351c2fa22267765c723bd3b6001
Lib/General/LinearAlgebra/FramedCoefficient.lean 301a17ed7f41e384178a00ba28c4545ba6f2c1e3
Original graph untouched: Lagrange/Witt + FrameNorm + flag trace
-> BesselExistence -> FillingData -> BesselCut/BesselSystem/Moments -> B.
Reduced human graph uses reversed triangular moment pairing, GS dual
adjustment, J-selfadjoint strict-lower trace, same frame in caller.
No global edge or axiom deletion. Retain native and prior reduced graphs.
Cache context compact pin, e, tau, p, Lambda, a, B, b, rho, c, g and
same frame throughout. Native lean/lake/elan not found on PATH.
No new rh_scan/prune/reduce/auto/frontier execution; old-pin engines
cannot be asserted run on this pin. Actual CI run 45803534769 jobs
retrieved (pick/run/record completed success at orchestration level);
this is not a full replay: earlier targeted_results.json records
A module timeout 124, all_requested_checks_ok=false and
full_RH_replay=false. No new certificate compilation or native PASS.
Scalar certificate and source probes prepared below; do not infer
the full matrix theorem from these scalar checks.

RESUME HERE: at actual exists_isBesselFunction, finish the
FlenstedJensen projector/absolute decay supplier and precise Haar
integrability swap on the SAME g; coordinate literature on the
distinct one-vector Siegel–Weil and Rallis inputs. Do not rework
Witt/phase or the now sufficient constants unless audit finds an error.
HANDOFF TO integration/editor, positivity, audit, compact replay.
-/

namespace CompactGeometryRun66

/-- Squared-norm budget after the exact AA* identity.
The stronger elementary upper bound avoids a dimension factor
from the remaining positive columns. -/
theorem frame_square_budget (r M : ℝ) (hr : 0 ≤ r) (hM : 1 ≤ M) :
    1 + 4*r*M^2 + 2*M^2 ≤ (4*(r+1)*M)^2 := by
  have hm : 1 ≤ M^2 := by nlinarith
  have h₁ : 0 ≤ r*M^2 := mul_nonneg hr (sq_nonneg M)
  have h₂ : 0 ≤ r^2*M^2 := mul_nonneg (sq_nonneg r) (sq_nonneg M)
  nlinarith

/-- The phase after cancelling the compact weight. -/
theorem phase_cancel (d k sigma : ℂ) (h : d = k + sigma - star sigma) :
    d - k = sigma - star sigma := by rw [h]; ring

#print axioms frame_square_budget
#print axioms phase_cancel
#check exists_lagrange_weights
#check witt
#check besselSize_le_of_dual
#check exists_mul_unipotentOf_dualCols_eq
#check besselGraph_trace_mul_sub_eq_zero
#check IsSteep.exists_isTwoFactor_besselPairHom
#check Data.exists_besselSystem
#print axioms IsSteep.exists_isTwoFactor_besselPairHom

end CompactGeometryRun66
