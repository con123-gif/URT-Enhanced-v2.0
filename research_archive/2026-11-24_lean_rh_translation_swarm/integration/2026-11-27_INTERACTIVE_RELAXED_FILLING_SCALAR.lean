import New.Endgame.LongForms
import Mathlib.Tactic

/- Source-matched scalar certificate, PREPARED / not native-replayed.
   See integration/2026-11-27_INTERACTIVE_RELAXED_FILLING_BUDGET.md.
   No Main import, no original star_inequality invocation. The positive height
   supplier is explicit; prove it separately using ArithmeticFunction.vonMangoldt_sum.
   The actual relaxed determinant/moment replacements remain to be compiled. -/
namespace RHRelaxedFilling

theorem scalar {d n H R L J : ℝ}
    (hd : 0 < d) (hn : d/2 ≤ n) (hnd : n ≤ d)
    (hH : 0 ≤ H) (hL : 0 ≤ L) (hJ : 0 ≤ J)
    (hAC : d*(H-3*L) ≤ n*(H-R+L)+2*d*J) :
    R ≤ 7*L+4*J := by
  have hnon : 0 ≤ (d-n)*H := mul_nonneg (sub_nonneg.mpr hnd) hH
  have hstep : n*(R-L) ≤ d*(3*L+2*J) := by
    nlinarith only [hAC, hnon]
  have hpos : 0 ≤ 3*L+2*J := by positivity
  have hmul := mul_le_mul_of_nonneg_right hn hpos
  have hn0 : 0 < n := by linarith
  by_contra! hb
  have hbad := mul_pos hn0 (sub_pos.mpr hb)
  nlinarith only [hstep, hmul, hbad]

theorem completion_budget {d n H L V delta K eta : ℝ}
    (hd : 0 ≤ d) (hK : 0 ≤ K)
    (hmiss : d-n ≤ 4*eta*d)
    (hbudget : 4*eta*K ≤ L)
    (hC : d*(H-2*L) ≤ V+2*delta+(d-n)*K) :
    d*(H-3*L) ≤ V+2*delta := by
  have h1 := mul_le_mul_of_nonneg_right hmiss hK
  have h2 := mul_le_mul_of_nonneg_left hbudget hd
  nlinarith only [h1,h2,hC]

#print axioms scalar
#print axioms completion_budget
end RHRelaxedFilling
