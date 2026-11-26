import Lib.PadicHodge.WachKisin.PeriodMatrixFrame

/-!
Editor RUN64, 26 Nov 2026. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
Source-matched human argument in HUMAN_PROOF_COMPACT.md, section Editor RUN64.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Native declaration and axiom probes only; NOT compiled. No RH theorem imported.
The new human argument uses the coordinate determinant, minimal support,
Frobenius determinant divisibility and fixed-coefficient contradiction.
RESUME HERE: audit Frame.exists_frame lines 66–109 and quantitative safety.
-/

#check Lift.Chart.exists_det_ne_zero
#check exists_fixed_ker
#check Lift.Chart.eventually_exists_coeff_eq_of_fixed
#check Lift.Chart.exists_frobE_dvd_sub_of_dvd
#check Lift.Chart.IsPeriodMatrix.exists_basis
#check Lift.Chart.IsPeriodMatrix.exists_frame
#print axioms Lift.Chart.IsPeriodMatrix.exists_basis
#print axioms Lift.Chart.IsPeriodMatrix.exists_frame
