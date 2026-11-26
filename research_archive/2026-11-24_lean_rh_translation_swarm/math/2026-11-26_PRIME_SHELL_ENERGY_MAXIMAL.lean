import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026. PREPARED / NOT COMPILED locally.

Scalar closure for the prime-shell energy maximal inequality.  The companion
note proves the analytic spike estimate from the actual affine shell and its
one-sided prime jumps.  This file imports no RH theorem.
-/

namespace RHMathPrimeShellEnergyMaximal

/-- Once the analytic spike estimate and the host-energy estimate are in
place, their cubic closure gives the terminal bound. -/
theorem cubic_energy_closure
    (h L I B : ℝ)
    (hh : 0 ≤ h) (hB : 0 ≤ B)
    (hspike : h^3 ≤ 3 * L * I)
    (henergy : 3 * L * I ≤ B^3) :
    h ≤ B := by
  have hcubes : h^3 ≤ B^3 := hspike.trans henergy
  by_contra hn
  have hlt : B < h := lt_of_not_ge hn
  have hhpos : 0 < h := hB.trans_lt hlt
  have hfac : 0 < h^2 + h * B + B^2 := by
    have hh2 : 0 < h * h := mul_pos hhpos hhpos
    have hhB : 0 ≤ h * B := mul_nonneg hh hB
    nlinarith [sq_nonneg B]
  have hcube : B^3 < h^3 := by
    have hprod : 0 < (h - B) * (h^2 + h * B + B^2) :=
      mul_pos (sub_pos.mpr hlt) hfac
    nlinarith
  exact hcube.not_le hcubes

/-- A common host integral and monotone slope bound serve every terminal. -/
theorem common_host_to_terminal
    (h L localEnergy globalEnergy B : ℝ)
    (hh : 0 ≤ h) (hL : 0 ≤ L) (hB : 0 ≤ B)
    (hloc : localEnergy ≤ globalEnergy)
    (hspike : h^3 ≤ 3 * L * localEnergy)
    (hglobal : 3 * L * globalEnergy ≤ B^3) :
    h ≤ B := by
  apply cubic_energy_closure h L localEnergy B hh hB hspike
  exact (mul_le_mul_of_nonneg_left hloc (mul_nonneg (by norm_num) hL)).trans hglobal

example
    (h L localEnergy globalEnergy B : ℝ)
    (hh : 0 ≤ h) (hL : 0 ≤ L) (hB : 0 ≤ B)
    (hloc : localEnergy ≤ globalEnergy)
    (hspike : h^3 ≤ 3 * L * localEnergy)
    (hglobal : 3 * L * globalEnergy ≤ B^3) :
    h ≤ B := by
  first
  | (rh_reduce 2 using [common_host_to_terminal]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact common_host_to_terminal h L localEnergy globalEnergy B
      hh hL hB hloc hspike hglobal

end RHMathPrimeShellEnergyMaximal

rh_scan RHMathPrimeShellEnergyMaximal.cubic_energy_closure limit 2000
rh_scan RHMathPrimeShellEnergyMaximal.common_host_to_terminal limit 2000
rh_prune RHMathPrimeShellEnergyMaximal.cubic_energy_closure as RHPrimeEnergyCubicPruned
rh_prune RHMathPrimeShellEnergyMaximal.common_host_to_terminal as RHPrimeEnergyHostPruned
#print axioms RHMathPrimeShellEnergyMaximal.cubic_energy_closure
#print axioms RHMathPrimeShellEnergyMaximal.common_host_to_terminal
