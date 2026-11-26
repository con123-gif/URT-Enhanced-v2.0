import Lib.PadicHodge.WachKisin.CrystallinePeriodMatrix
import Mathlib.Tactic

/-!
# Integration RUN65 — crystalline period matrix, including chart stability
2026-11-26. Human source-matched derivation; new Lean probes prepared, NOT compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; editor RUN64
e1d32e040626b0134c2614a14df62a869cc8a0ad; manuscript
324ee6415fe8e4747e57fb6f3c218128eb4daae9. No upstream theorem RH imported.

Source ledger (relative grh-compact/src):
* Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean
  cf83fda104fb44177d374d62f06b4d6e68e3db08, IsChartOf.exists_isPeriodMatrix.
* Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean
  cd91a46eb5624b88af20a96d0450bdf059994b93, IsPeriodMatrix, four clauses.
* Lib/PadicHodge/WachKisin/HodgeFrame.lean
  158f4df424f222f593b6f2baee57a294ab221f03, exists_hodge_frame and
  isHodgeTateFrame_of_hodgeMatrix.
* Lib/PadicHodge/Crystalline/RegularityFrobenius.lean
  2cf7f7ee07b73f475818198db19ee7f65aec7a06, IsAdmissible.exists_basis.
* Lib/PadicHodge/PeriodRings/FundamentalKernel.lean
  7d78ffa669acc35996f315cfe18ac1dc43649fb9, pow_smul_mem_range_BPlus.
* Lib/PadicHodge/WachKisin/KummerChart.lean
  8c3d7ca027e653f9a125e0cec6fd477c5ce6f791, dvd_extendToBPlus and
  exists_witt_coeff_of_isChartOf.
* Lib/PadicHodge/WachKisin/FrameTheorem.lean
  57d6daa6060f9f00eb27be6525460ba942a73f08, frame_theorem actual consumer.

Write B=Bcris, B+=BPlus, D+=BdRPlus. Suppress injective ring embeddings
in the formulas only. Retain the chart-of-image hypothesis, crystalline
representation on a finite free Z_p lattice, basis e and actual jumps
in [-a,b], a,b natural. Put h=a+b. E tau v=mu, v an A_inf unit.

1. Crystalline basis gives M invertible over B, rho(g)g(M)=M.
For each n>=0, N_n=phi^n(M) is also invariant (phi commutes with
Galois and fixes the integral representation coefficients).
The native Hodge frame gives N_n Y_n=W_n diag(t^k_ni) with W_n
invertible over D+, Y_n in SL over the algebraic fixed field
and k_ni the actual jumps, as read by the inverse reduced frame
and hasJumps_of_rows. Y_n and Y_n^-1 belong to D+. Thus
all entries of N_n lie in Fil^(-a), all entries of N_n^-1
in Fil^(-b). The latter uses Y_n diag(t^(-k_ni)) W_n^-1.
It is necessary to do this for EVERY nonnegative n, not merely n=0.
Apply pow_smul_mem_range_BPlus entrywise with nu=E tau
(associated to mu). It yields U=(E tau)^a M and
W_*=(E tau)^b M^-1 over B+. Injectivity gives
U W_*=(E tau)^(a+b) I, the first clause.

2. C=M^-1 phi(M) and C^-1 are invariant entrywise: the rho(g)
factors cancel exactly. The invariant scalar lemma
exists_mem_bicommutant_of_fixed, using exists_witt_coeff_of_isChartOf
with b'=1 and the bicommutant inverse of p, represents their
entries by R and R' in the chart bicommutant. Injectivity gives
R'R=RR'=I. The native phi(E) has a bicommutant inverse.
Set F=phi(E)^a R, F'=phi(E)^(-a) R'.
Using phi(tau)=mu and E tau v=mu, exact multiplication gives
phi(U)=phi(E)^a mu^a phi(M)=v^a U F, F'F=I.
Thus no estimate or extra scalar loss is needed.

3. If g fixes Lambda and theta(z), chart-of-image gives a gamma
in the original group mapping to g. Association yields
g(E tau)=u_g E tau for an A_inf unit u_g. Set
rho'_g=u_g^(-a)rho(gamma), an integral matrix. Then rho'_g g(U)=U.
No arbitrary extension of the representation outside the image.

4. The crucial stability under the chart extension fhat is not
formal commutation with arbitrary period coefficients. Use n=0:
M Y=W diag(t^k). Each row of Y^-1 consists of algebraic fixed
scalars (adjugate, determinant one). Since E is a uniformizer
in D+ and tau is a unit there, for any y over B+,
U y in E^h (D+)^d iff for each i,
 (Y^-1 y)_i in t^(b-k_i) D+.
Here b-k_i>=0. Apply the exact native chart divisibility lemma
dvd_extendToBPlus to each row of Y^-1, with the SAME f and y:
 (Y^-1 y)_i divides (Y^-1 fhat(y))_i in D+.
Transitivity gives the same t^(b-k_i) divisibility of the
transformed vector, including zero coordinates. Consequently
U fhat(y) in E^h (D+)^d. Reflect via the native xi_pow_dvd_iff
and E associated to xi to obtain E^h divisibility in B+ itself.
This proves the actual fourth clause hat_stable without assuming
that fhat is B-linear or that Y^-1 has entries in S.
The chart divisibility lemma remains an explicit prerequisite:
its proof approximates fixed algebraic scalars by bicommutant
elements modulo every xi^m, using fixed theta and Newton lifting,
then transports the divisibility via the chart extension.
Do not replace it by a general unsupported linearity assertion.

At FrameTheorem.frame_theorem, a=b=L.jumpBound, and the crystalline
restriction is the actual L.inClass input. Hence the above supplies
the period matrix required by the previously integrated exists_frame
argument, with exactly the same U, h, v^a; no new hypothesis added.
It does not by itself supply the quantitative radius_lemma, all
value-field tests, or arithmetic balanced-row bounds.

Peer integrations recorded in manuscript: RUN65 conjugate Gaussian
vacuum estimate, RUN38 Schur-dual bound, RUN62 exact local Haar
normalization; RUN64 editor already integrated period basis/frame
and Cartan/peak/Fitting suppliers. All remain human status unless
native receipts explicitly establish them.

Verification: local command -v lean/lake/elan unavailable.
Prepared scalar executable certificates and actual declaration probes
below, not run. No compact invocation of rh_scan/rh_prune/rh_reduce/
rh_auto/rh_auto_frontier; old-pin engine not silently transplanted.
Checked state receipts: 45577239749 conditional strip root and
45576756833 bounded prune scan passed on old pin, not compact root.
Compact RUN29 45803534769 status a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804:
six B/C named checks standard axioms; A timed out (124, 2700.11s),
overall false and full_RH_replay=false. No new native PASS.
Original/reduced graph and axiom evidence retained unchanged.
Human local graph: frame_theorem -> exists_isPeriodMatrix ->
{invariant basis, all-Frobenius jump bounds, range lemma,
fixed scalar, chart divisibility, xi reflection} -> exists_frame.
Context key: compact pin, L, chart c, representation, a,b, M.
Failed alternative: general Kisin theorem does not supply the chart
endomorphism stability clause without an additional bridge.
RESUME HERE: reconstruct the quantitative radius_lemma caller
and its use in frame_theorem; retain Galois congruence conditions,
value-field and divisibility hypotheses. Coordinate with Galois
lane on the actual local safety/triangle consumer; no repeat of
period-frame determinant or scalar endgame. HANDOFF TO editor,
literature, formal audit and shared compact native runner.
Human RH reconstruction remains incomplete.
-/

namespace CompactIntegrationRun65

theorem frob_scalar_factor {R : Type*} [CommRing R]
    (e t v ep mu : R) (a : ℕ) (h : e*t*v = mu) :
    ep^a * mu^a = v^a * ((e*t)^a * ep^a) := by
  rw [← h]
  simp only [mul_pow]
  ring

theorem divisibility_transfer {R : Type*} [CommRing R]
    {t x y : R} {k : ℕ} (hx : t^k ∣ x) (hxy : x ∣ y) :
    t^k ∣ y := dvd_trans hx hxy

#print axioms frob_scalar_factor
#print axioms divisibility_transfer
#check Lift.Chart.IsChartOf.exists_isPeriodMatrix
#check Lift.Chart.IsChartOf.dvd_extendToBPlus
#check Lift.Chart.IsChartOf.exists_mem_bicommutant_of_fixed
#check pow_smul_mem_range_BPlus
#check Lift.Chart.IsPeriodMatrix.exists_frame
#print axioms Lift.Chart.IsChartOf.exists_isPeriodMatrix

end CompactIntegrationRun65
