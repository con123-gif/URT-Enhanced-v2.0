import New.Rows.MemberKernels
import New.Data.Magnitudes
import Mathlib.Tactic

/-!
# RUN38 — exact Schur dual bound and scale guard at the A caller
26 November 2026. Human source-matched audit and derivation; not a new native
replay. Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission latest read blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
peer 11b88ad1 (RUN64 archimedean chain) and 10d4fd45 (theta dimensions).
The prior RESUME target is already supplied at aggregate level by RUN64;
this note fills its explicitly retained Schur-dual bridge and scale guard,
rather than duplicating the chain or scalar endgame.

## Source ledger (relative to grh-compact/src)
New/Rows/MemberKernels.lean be36c0175fe559376780b105052249fc0c9f1f4f:
 Parameters.norm_jet_le_of_isAdmissibleComb, both conjuncts.
Lib/Adelic/CuspForms/DeltaForms.lean b3c533af615370f34f2303823732b8935c6bfbef:
 weylNormSq_schur_le.
Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33:
 sqrt_weylNormSq_le_of_dual, sqrt_weylNormSq_sum_le.
Lib/Weil/CompactLift/BranchingPeriod.lean 9ed09fe6527b822004076503163d1a9cb8859d91:
 dotProduct_schurJet_mulVec, eval_schurCoeffPoly, map_schurJet.
Lib/General/LinearAlgebra/HuaIntegral.lean d62ceebe4b3b49aae6bc6eb3d247280abbbd8a37:
 pow_le_exp_log_factorial_add.
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0:
 exists_semilinear_isJetConjugate.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
 Data.weylNormSq_Bmu_le.
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473:
 jetSize_le_add, norm_map_star_piG_sq.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e:
 c_ge, HasLogBound, bounds for a, m, gProd, towerDeg.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834:
 Data.scale, g_mem, m_mem, budget and jetSize.
New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185:
 bigOmega, cycloConductor_mem_different.

## 1. Gram operator bound, including zero singular values
Write G for the positive definite native Gram matrix on each Weyl
space; ||xi||_G^2=xi*G xi. The native functoriality, adjoint
identity S(Z)*G' S(Z)=G S(Z*Z), and positive definiteness are
retained as the ordinary Schur construction inputs, not inferred
from entrywise estimates. For each tau diagonalize the positive
semidefinite Z_tau*Z_tau by a unitary, and arrange eigenvalues
rho_(tau,0)>=...>=rho_(tau,n-1)>=0. Their sum is the squared
Frobenius norm of Z_tau. For a tableau, each column of height h
uses h DISTINCT row indices. Thus its diagonal weight is bounded
by the product of the largest h eigenvalues. Multiply across columns
and places: the exponent of rho_(tau,i) is exactly
r_(tau,i)=sum_(i<h<n') kappa_tau(h), the native diagramWeight,
using FitsRanks to exclude unsupported heights. This gives
M=prod_(tau,i) rho_(tau,i)^r_(tau,i).
The diagonal Schur matrix commutes with the Gram matrix (native
Gram-Schur identity for a real diagonal); hence G(M I-S(diag rho))
is positive semidefinite, e.g. diagonalize the two commuting
Hermitian matrices. Conjugate back by the Schur representation of
the unitary (Gram isometry). Therefore
 ||S(Z)xi||_G'^2 <= M ||xi||_G^2.
No division by rho, so zero eigenvalues and degree-zero factors
(0^0=1) are included. This is exactly the native existential rho
bound, with rho extended by zero outside the source row range.

## 2. The missing Schur polynomial estimate in RUN64
Fix the native sigma, L positive integer, u=log(|sigma c|^2/Omega).
For any bilinear dual row A with
 |sigma(A dot w)| <= ||sigma w||_G' for every w,
take the actual polynomial Q=schurCoeffPoly A xi, not a generic
matrix coefficient. Its evaluation is A dot S(Z)xi, and the
jet functional on Q equals A dot (schurJet F)xi. Entrywise
sigma maps the polynomial evaluation and Schur representation
exactly; do NOT move sigma across conjugation or Gram coefficients.
Use section 1 on sigma Z and sigma xi. For every Z in the native
ball sum|sigma z_i|^2<=exp(u)(2L+2)R we obtain
 |sigma Q(Z)| <= ||sigma xi||_G * sqrt(prod rho^r).
The ball implies R>=0. Put v=u+1/L and J=sum(r/L+log(r!)+r*u).
The nonnegative exponential series gives, for every rho>=0,
 rho^r <= r! exp(r v + rho exp(-v)).
No logs of rho and no inverse of rho. Multiply before taking the
square root:
 prod rho^r <= exp(J + exp(-v) sum rho)
             <= exp(J + 2 L R).
The last step is exact at the required constant because
 (2L+2) exp(-1/L) <= 2L
by 1+1/L <= exp(1/L). It is essential to apply the bound to the
SUM of eigenvalues, not repeat the ball radius for each row.
Consequently the first (polynomial-jet) conjunct of MemberKernels
applies with A0=||sigma xi||_G, w=J/2 and the same L.
This gives
 |sigma(A dot (schurJet F)xi)|
 <= B exp(C+d log(2L+2)+J/2) ||sigma xi||_G.
The bound holds for all dual rows. For a nonzero target vector v0,
the row conj(sigma v0)^T G'/||sigma v0||_G' realizes equality
in the dual norm by Cauchy-Schwarz; take the entrywise sigma inverse
to obtain an allowed A. For v0=0 use nonnegativity instead. This
proves the second conjunct from the first with the exact original
constant and no additional assumptions. The first conjunct itself
uses the CM semilinear conjugate and integrated Gaussian formula;
the RUN64 proof retains those actual suppliers. This is not a proof
of the global CM theorem.

## 3. Discharge the particular retained numerical guard
Let X=log x, V=log b, ell=chowlaSelbergConst d, rd=rootDiscr E.
Data.scale gives V>=10^12 X, log V<=X/100,
P.c<=log V/10^12; c_ge gives P.c>=64 and P.d,P.N0<=P.c.
In particular X,V>100, and m>=exp(X/2)>=V^50.
By Magnitudes a<=exp(V+X+1), gProd<=exp(22V),
towerDeg<=exp(11X+(log V)/5). Hence log N1<=12X (N1=N0*towerDeg)
and log d<=X; log rd<=13X. For the last inequality use the
native cycloConductor_mem_different: N1*d belongs to the
absolute different, so (N1*d)O_E subset different; ideal norm
and discriminant-different formula give rd<=N1*d. Also rd>=1.
The constant definition gives |ell|<=P.c<=X.
For the actual integer baseline r and error e, the native
diagramWeight proof uses r+e<=2a. Thus
 log(r+e+1) <= log(3a)<=V+X+1+log 3,
 log(gProd/Omega)=log gProd-ell-log(2pi)+log rd<=22V+14X.
Their sum <=23V+15X+3<=24V<=m.
The last inequality uses V>100 and m>=V^50.
This establishes the precise guard retained by RUN64 under the
actual admissible data, using the standard different/discriminant
identity explicitly. Also log(Omega/gProd)<=P.c+log(2pi)-20V<0
since gProd>=exp(20V), rd>=1. This checks the monotonicity used
for the baseline factorial budget. No new numerical hypothesis.
Native base+error<=2a and the remaining HasLogBound branches
are not dropped or claimed recompiled.

## Caller and evidence
The actual local caller invokes the second conjunct with a
single translated intVacuum, B=1, L=a+1, and c=star piG.
Section 2 supplies its Schur-norm step; section 3 supplies the
specific log budget in jetSize_le_add. RUN64's chain expansion
and exact gain cancellation now use these two source-matched
bridges. Preserve same D, sigma, stage, kappa and datum.
Original graph: short_forms -> weylNormSq_Bmu_le ->
norm_jet_le_of_isAdmissibleComb -> {Schur Gram estimate,
dual norm, polynomial jet, CM conjugacy, factorial bound};
jetSize_le_add -> HasLogBound.
Reduced human chain: Gram spectral order -> aggregate factorial
bound -> dual evaluation -> same norm; actual data -> log guard.
Retain original and reduced graph archives, no global edge deleted,
all other unresolved A/B/C suppliers unchanged. No claimed RH
theorem imported as proof. No URT.

Native environment: command -v lean/lake/elan returned no paths.
Actual receipts reread on cathedral-research-state:
compute/rh-compact-primitives-replay-20261126/status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f and outputs/targeted_results.json
088cd2ec0e935ee1a282f10096949bcf671cc804, Actions 45803534769.
Six B/C checks with propext, Classical.choice, Quot.sound;
A build timeout 124, 2700.11 seconds, overall error.
No native engine run or fresh PASS; no finite test used as proof.
Prepared actual declaration probes and an executable scalar bridge below,
to run with lake env lean in the compact project. The source probes are
not verification of the new human argument.

RESUME HERE: independent audit of sections 1–3 and integration into
RUN64/actual short_forms. Next distinct A supplier: the global
theta-functional Poisson normalization if integration has not already
closed it, otherwise CM conjugate-vacuum uniform bound and the exact
finite-part generator caller. Replay smaller MemberKernels dependency
module in existing shared runner when capacity permits, no protected
workflow edits. HANDOFF TO theta, integration, audit, shared native
verification. Full human RH reconstruction remains incomplete.
-/

namespace CompactKernelRun38

theorem radius_budget (L : ℝ) (hL : 0 < L) :
    (2 * L + 2) ≤ 2 * L * Real.exp (1 / L) := by
  have h := Real.add_one_le_exp (1 / L)
  have hh := mul_le_mul_of_nonneg_left h (show 0 ≤ 2 * L by positivity)
  calc
    2 * L + 2 = 2 * L * (1 / L + 1) := by field_simp <;> ring
    _ ≤ 2 * L * Real.exp (1 / L) := hh

end CompactKernelRun38

#print axioms CompactKernelRun38.radius_budget
#print axioms weylNormSq_schur_le
#print axioms sqrt_weylNormSq_le_of_dual
#print axioms eval_schurCoeffPoly
#print axioms dotProduct_schurJet_mulVec
#print axioms pow_le_exp_log_factorial_add
#print axioms Parameters.norm_jet_le_of_isAdmissibleComb
#print axioms Parameters.cycloConductor_mem_different
