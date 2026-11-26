import New.Seesaw.GoodDatumExists

/-!
# RUN52 compact theta: exact split neighbour and glued-lattice suppliers
26 Nov 2026. Human source-matched reconstruction; Lean certificate prepared,
not compiled. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude per upstream.
Mission blob 0abe4d55e789dd229081d1161cb7736895fe9885; latest unified witness
7ad9c7c64f53c621ad20422226ad9d0b756ee28e; manuscript
69030b2d01e9f0e786a004a21b6f0043ef84bc64. Prior theta RUN51 3180f6da.
Recent peers 0ce8bcf6 (rank-one test forms), 8cfd3a3e (C cost cutoff),
2021e57b (Landau), 77bbebba (C determinant). No duplicate work.

Source ledger (all relative to grh-compact/src):
New/Seesaw/AdmissibleEvaluation.lean 4a0070f1658927e4faf4e596cceb0009478b6c2d
New/Seesaw/EdgePair.lean 02588c1ebc8eed128efaa107d9a9e1b5863d4d02
New/Seesaw/GoodDatumExists.lean cc6f93272fb65dd22d8079236a66454b034182b9
New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7
New/Seesaw/LatticeAndTorsionDefs.lean d92de3b66fe1dc9c9a356de9a50779dc36289ac0
New/Seesaw/GradingsOfY.lean 9a0ce95531f7ef503b23167e9d90ef3d417f1bf8
New/Trace/GoodIdempotent.lean 638eaebb14d06d09a7e028258d4ecd84716ccf1f
New/Seesaw/PairTensorData.lean ade3783be65d0ac72f29b46220354147ffdca110
New/Seesaw/LinesStep.lean 017ac7b96f33f4a41462aaef726ed1d26dec6767
New/Seesaw/UnfoldingStages.lean 5e6b4189ad78c708ce8f30888678b4467672b850
Lib/Weil/MixedModel/AdelicSum.lean 49baa2583b79e2ffc4fff7dc791415866c03071d.

## 1. Explicit local neighbour construction in exists_isAdmissibleEval_std
Use native split-squarefree pi, P disjoint from conjugate S=bar P, pi
a uniformizer on P and a unit elsewhere, p=bar pi, pi*p=N. Write
c=normNegOne, c*bar c=-1; c,bar c integral units. Write j=1_P, l=c*j.
The source gamma is identity off the special two rows e,e', and off
P union S. Substitute A=p^(-1)[p(j*bar p-j-bar j)+bar j] and
rho=e+bar l e' into gamma=I+A rho(e^T+l e'^T). The actual two blocks:
   at P: G_P = [[pi,(pi-1)c],[0,1]],
   at S: G_S = [[1/p,0],[(1/p-1)bar c,1]].
The conjugate transpose of the S block at P is
[[1/pi,(1/pi-1)c],[0,1]], so G_P G_S^*=I exactly, and conversely.
This reconstructs the finite unitary matrix in the native frame;
the off-block identity handles all other coordinates. No arbitrary
rank-one perturbation or approximate inverse.

For the scalar row of neighbour data b, substitute the source formula
b_m=A*pi^-1*(l*1_(m=e')+bar j*1_(m=e)).
On the two columns it gives
 b_P=(0,(1-pi^-1)c), b_S=((p^-1-1)pi^-1,0).
At P:
 b_P - pi^-1 row_e(G_P)=(-1,0),
 bar c b_P - pi^-1 row_e'(G_P)=(0,-1).
At S:
 b_S - pi^-1 row_e(G_S)=(-pi^-1,0),
 bar c b_S - pi^-1 row_e'(G_S)=(0,-pi^-1).
All these are integral on their indicated local rings. The other
entries are ordinary basis entries. Multiplication of G by p makes
every entry integral: p is a unit on P, and p G_S has integral
entries. The off-special rows are integral without p. Off P union S,
b=0 and pi is a unit. Finally delta=1 on P union S and b=0 elsewhere,
so delta*b=b. These are precisely all five IsNeighbourVector clauses,
columnwise, not only the Gram identity. The diagonal kappa is kept
with its native unitary and denominator hypotheses.

## 2. Exact residue partition before any norm
integralBox(S) constrains ONLY places S (AdelicSum.mem_integralBox).
Fix one column at a place in S. Let x,y be its two exceptional
coordinates, and let r=bar(residueOverN(label)) at that place.
The source n has these entries c*r, c*bar c*r; hence after gamma
and n the two coordinates are
 z=x/p+c*r,
 w=y+(1/p-1)*bar c*x+c*bar c*r.
They satisfy the exact cancellation
       w-bar c*z=y-bar c*x.
Since p*r is integral (N=pi*p, pi a unit at S), integrality of z
implies integrality of x. Integrality of w then implies integrality
of y. All other coordinates are unchanged. Conversely, for integral
x,y the single condition z integral forces w integral.
Conjugating bar c*z at the paired place P gives
       c*bar x/pi - residueOverN(label),
using c*bar c=-1. Thus z integral is precisely that the unique
residue label matches c*bar x/pi modulo the integral ring.
Indeed multiplying by N turns this into reduction of the integral
element (N/pi)c*bar x at P, and IsSplitLevel.reduction_eq_iff
identifies that reduction with ZMod N. This is a bijective residue
choice for every integral x, independently for each column and each
w in P. For a nonintegral column no label works by the forward
implication. Therefore the native sum of shifted box indicators
equals the original box indicator pointwise, with coefficient 1
and not N^f. The source chooses its label function even on
nonintegral inputs; the equivalence is vacuous there.
This completes the integrality equivalence used under omega_name_on
in exists_isAdmissibleEval_std. The name/Weil covariance, multiplier
denominator formula and phase laws remain native input, not inferred
from the residue partition.

## 3. Explicit hA and hM in the actual pairEvalY caller
Use beta=piGBar as in GoodDatumExists, v(chosenIdele)=v(beta),
delta=chosenIdele/bar(chosenIdele), a=ideleA, U=a/bar a. Thus
 v(bar beta*delta)=v(beta) at EVERY finite place. Also delta is a
unitary adele equal to 1 above N. The middlePair inclusion on the
non-hyperbolic columns is just the coordinate inclusion in the same
half, so hA follows from equality of the corresponding selfOrConj
weights; kappa=1. For lastPair the additional right-hand column
maps to the left string midpoint with rational factor pi^-1; its
kappa=delta, so the displayed valuation identity supplies the only
cross-half hA clause. Every other nonzero inclusion entry is in
its own half. Hyperbolic columns are not included in hA's quantifier.

To derive hM, use gradedLatticeBasis and SpansLattice exactly.
At an odd string of length q the local frame has standard coordinates
x_other integral, special coordinate x_e with p*x_e integral, and
midpoint coordinate u_q*(pi^-1*x_e+d) for integral d, other string
coordinates zero. This follows by multiplying the displayed
gradedLatticeBasis by the integral vector with special entry p*x_e
and midpoint entry d; the change from this frame to xFin is in
GL(Ohat). It is the actual inv_xFin_mulVec_mem_of_spansLattice lemma.

Write C for a neighbour scalar (not the common Weil multiplier);
hM gives s*U=bar c*delta, t*s=1, and delta*C=C.
In a middle pair i<rho, u_left=U^(rho-i+1), u_right=U^(rho-i),
so s*u_left*C=bar c*u_right*C. The hyperbolic component in hM
is (0,s*u_left*C); middlePair maps its second component to the
sum of the two string midpoints. After left scaling by t the
left midpoint is u_left*C and right midpoint is bar c*u_right*C.
The non-hyperbolic standard coordinates are x restricted to the
left and right halves, since t*s=1. Hence the two required integral
midpoint corrections are exactly
 d_left=C-pi^-1*x_e,
 d_right=bar c*C-pi^-1*x_e'.
Both are in Ohat by IsNeighbourVector. The remaining entries use
its other-coordinate and p*x clauses. This proves hM for the middle
pair, with no independent isometry or denominator.

In the last pair i=rho the hyperbolic part is empty. The right
special column maps to the left midpoint with factor pi^-1 and
kappa=delta. The left u_left=U, and t*delta=U/bar c=-c*U.
Consequently the left midpoint is -c*U*pi^-1*x_e', with the left
standard coordinates still x restricted to the left half. Its
required integral correction is
 d_last= -pi^-1*x_e - c*pi^-1*x_e'
       = (C-pi^-1*x_e) + c*(bar c*C-pi^-1*x_e').
This exact cancellation eliminates the unbounded C BEFORE any
valuation estimate. Both summands are integral. The last right
space is standard and its remaining coordinates already integral,
since the only exceptional right coordinate has been transferred
to the left midpoint. This proves hM for lastPair as well.
All powers here are those of latticeScale in GoodIdempotent;
no assumed compatibility of two unrelated lattice frames.

Together these are the explicit geometric hypotheses of
isAdmissibleEval_finEval at Data.isAdmissibleEval_pairEvalY, feeding
RUN51's same C, common K^(2m) denominator and good-datum chain.
This does not establish the separate multiplier integrality or
the local marked Schur/Fourier divisibility supplier of A.

## 4. Next support chain: exact obstruction, not yet closed
Read LinesStep.HasNearLines.step and actual
hasNearLines_of_unfoldStage_ne_zero. The nonzero integral gives
one predecessor at which both predecessor coefficient and constant
term are nonzero; use induction with the SAME predecessor.
zeroTermFin_support supplies l integral with k^*(y-M'l)=0 under
the native dual-frame MM'^*=1 and stabilizer invariance. Applying
the inverse Gram frame gives agreement of the strictly lowering
grade entries with the integral matrix. In adapted bases B,B',
the native proof then isolates the single graded string pair
(i.castSucc,i) in the entry (i,i.rev.succ) of
 B'^(-1) W J^(-1) B^(-*) .
The two triangular flags and string-reversal pairing are essential;
we have not yet independently reconstructed all index inequalities
in that singleton-sum argument or the exceptional central
translation contradiction proving the reverse-valuation premise.
Retain both, as well as the tame-place valuation bound and
zeroTermFin_support's primitive-matrix argument. Do not claim
HasNearLines.step or the finite cut closed on this basis.

## Evidence and handoff
Original selected graph: Main <- New.grh <- star_inequality
<- exists_family_covolumeSq_le <- Data.short_forms <- Data.seesaw
<- exists_isAdmissibleComb_reducedVacuum <- isAdmissibleEval_pairEvalY
<- isAdmissibleEval_finEval <- exists_isAdmissibleEval_std.
Reduced HUMAN exposition replaces hA/hM and residue equivalence
with sections 1--3; preserve all other native edges, all original
graphs, and all axiom uncertainty. No global deletion or new axiom.
Context key: (compact pin, Data P, pair index, piPlaces, actual
beta, a,U,delta,kappa, same neighbour column and label).
This feeds the A supplier for unified (U),(W),(S), not a new
determinant family. Theorem A full local repair, B, C and analytic
dependencies remain; no independent RH proof or completed translation.

Executed exact symbolic checks in local Python/SymPy (8 identities):
G_P times G_S^* minus identity; both neighbour residual rows on
P and S; w-bar c*z cancellation; x recovery; last-pair correction.
Each simplified to exact zero with bar c=-1/c. Reproducer:
  import sympy as S
  p,pi,c,a,u,x,y,r,z=S.symbols('p pi c a u x y r z', nonzero=True)
  cb=-1/c
  P=S.Matrix([[pi,(pi-1)*c],[0,1]])
  Q=S.Matrix([[1/p,0],[(1/p-1)*cb,1]])
  assert (P*S.Matrix([[1/pi,(1/pi-1)*c],[0,1]])-S.eye(2)).applyfunc(S.cancel)==S.zeros(2)
  for G,b,R,T in [(P,S.Matrix([[0,(1-1/pi)*c]]),S.Matrix([[-1,0]]),S.Matrix([[0,-1]])),(Q,S.Matrix([[(1/p-1)/pi,0]]),S.Matrix([[-1/pi,0]]),S.Matrix([[0,-1/pi]]))]:
      assert (b-G[0,:]/pi-R).applyfunc(S.cancel)==S.zeros(1,2)
      assert (cb*b-G[1,:]/pi-T).applyfunc(S.cancel)==S.zeros(1,2)
  we=x/p+c*r; wf=y+(1/p-1)*cb*x+c*cb*r
  assert S.cancel(wf-cb*we-(y-cb*x))==0
  assert S.cancel(p*(we-c*r)-x)==0
  assert S.cancel((z-x/pi)+c*(cb*z-y/pi)-(-x/pi-c*y/pi))==0
These are algebraic regression checks only, not adelic or kernel validation.
Lean/lake not present in local runtime. Actual shared CI run 45781154005
jobs retrieved; orchestration completed but the task status JSON
ea44d71556e0d21703e72fcd61bbaf2bee0ec563 records error returncode 1
RESOURCE_BLOCKED before compilation, 26 Nov 08:12:49 UTC.
No compact rh_scan/rh_prune/rh_reduce/rh_auto or fresh axiom audit;
do not import old-engine PASS across versions. Certificate below
prepared, not executed; caller adapter explicitly relies on native
theorem, not an independent formalization of the human proof.

RESUME HERE: close the singleton adapted-frame entry in
Grading.HasNearLines.step and the no-central-fixed-vector argument
in hasNearLines_of_unfoldStage_ne_zero, then connect to exists_stage_cut.
Use the actual finite predecessor and twist quantifiers. Review the
marked Schur/Fourier divisibility gap in A next; do not repeat
already sufficient constants. Replay the certificate only on the
shared compact environment when available.
HANDOFF TO integration/editor/audit/kernel: sections 1--3 fill the
specific RUN51 neighbour/gluing prerequisites in A; retain remaining
Weil covariance, support, finite cut and divisibility proof leaves.
-/

namespace RHTheta52

/-- The exact residual cancellation in the two exceptional coordinates. -/
lemma residue_cancel {F : Type*} [Field F] (p c cb x y r : F) :
    (y + (p⁻¹ - 1) * cb * x + c * cb * r) -
      cb * (p⁻¹ * x + c * r) = y - cb * x := by
  ring

/-- Last-pair midpoint correction, without bounding the neighbour scalar. -/
lemma last_pair_correction {F : Type*} [Field F] (c cb C x y : F)
    (h : c * cb = -1) :
    (C - x) + c * (cb * C - y) = -x - c * y := by
  calc
    _ = (1 + c * cb) * C - x - c * y := by ring
    _ = _ := by rw [h]; ring

/-- The upper off-diagonal entry of the two split conjugate blocks cancels. -/
lemma neighbour_inverse_offdiag {F : Type*} [Field F] (p c : F) (hp : p ≠ 0) :
    p * ((p⁻¹ - 1) * c) + (p - 1) * c = 0 := by
  calc
    _ = (p * p⁻¹ - 1) * c := by ring
    _ = 0 := by rw [mul_inv_cancel₀ hp]; ring

end RHTheta52

open Finset Ideal Matrix Modulus Space TensorProduct TensorChain Weil
namespace Data
variable {P} (D : Data P)

/-- Exact native evaluated-pair caller; not a proof-term replacement. -/
lemma isAdmissibleEval_pairEvalY_RHTheta52 i (hi : i ≤ D.ϱ) :
    IsAdmissibleEval D.N D.piPlaces (algebraMap _ _ D.piGBar) (D.pairEvalY i) :=
  D.isAdmissibleEval_pairEvalY i hi

end Data

#print axioms RHTheta52.residue_cancel
#print axioms RHTheta52.last_pair_correction
#print axioms RHTheta52.neighbour_inverse_offdiag
#print axioms Data.isAdmissibleEval_pairEvalY_RHTheta52
