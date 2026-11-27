import Lib.PadicHodge.WachKisin.KummerChart
import Mathlib.Tactic

/-!
RUN78 — C1 invariant fractions via a primitive coordinate pair, 27 Nov 2026.
Source-matched human derivation, conditional on the named primitive ring,
chart and Ax–Sen–Tate laws. Lean helpers PREPARED only. Credit Alpöge,
Sernau, Anthropic collaborators and Claude.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine
f62d03bdcd987268e70657298702a238335fb3e6, ledger
b24ae883acc131f657241e944d523013ac5432a9, prior RUN77
105f328cd9f4167888059edfe0657a0cc687c721. Read lane protocols and AGENTS
and latest peer subjects through 440d4d62 (completion budget, B2, local
columns; no duplicate C1 invariant fraction). Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 not mixed into proof.

Actual sources, paths relative to grh-compact/src:
 Lib/PadicHodge/WachKisin/KummerChart.lean
  8c3d7ca027e653f9a125e0cec6fd477c5ce6f791
  exists_witt_coeff_of_isChartOf (proof body), Bcris.exists_witt_ratio.
 Lib/PadicHodge/WachKisin/ChartScalars.lean
  8dc59315a323816ecb0eedf46b5aae0a8c714fc5
  extendedCoord_mem_bicommutant, eventually_approx_sum_extendedCoord,
  eq_zero_of_p_pow_amaxImage, eq_zero_of_z_pow_dvd,
  mem_bicommutant_of_mul, eventually_exists_pow_mul_eq_add_z_mul.
 Lib/PadicHodge/TateSen/DeRhamFiltration.lean
  dc4c23217762fe5c0da0a7c70a3d3f7bf297c84b
  BdR.exists_sub_mem_of_smul_sub_mem, forall_smul_eq_iff_mem_localFieldOf.
 Lib/PadicHodge/TateSen/NearOne.lean
  90cdd38ccf750df2458c39e947f56ffb1b0cdcf5
  tate_eq_zero_of_chi_twist and near-one image.
 Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean
  cf83fda104fb44177d374d62f06b4d6e68e3db08 actual exists_frob consumer
  (authenticated in RUN77).

1. Quotient invariant supplier, not just invariants of the full field.
Write D=BdRPlus, F=BdR, t=tPeriod, K=localFieldOf Gamma.
Use the native embeddings and DVR valuation v_t, t uniformizer,
g(t)=chi(g)t, and fixed-field and nonzero-twist vanishing theorems
from Ax–Sen–Tate (retained, not re-proved). Let S be ANY D-submodule
of F and let g x-x belong to S for every g in the open image.
Suppose no a in K has x-a in S. For every such a, y=x-a is nonzero
and not in S. Write y=t^n u, u in D^x, n in Z. Every nonzero s in S
must have v_t(s)>n: otherwise y/s in D would put y in S. Thus
g y-y in S implies
  chi(g)^n theta(g u) = theta(u).
The residue theta(u) is nonzero. Tate vanishing for n != 0 applies
because the image is open, so n=0 for EVERY a. At a=0, x is a unit
of D and its residue is fixed; Ax–Sen–Tate identifies it with
some a_0 in K, embedded compatibly in D. Then x-a_0 is zero or
has positive valuation, contradicting the conclusion n=0.
This proves the full quotient statement with arbitrary S, including
S=0 and S=F. No classification of submodules, finite generation,
or extra boundedness of S. In the following caller set S=0, hence
the invariant ratio in F equals an ALGEBRAIC a in K.

2. Nonzero denominator detected by one coordinate.
Let b,b' in Bcris with b' != 0 and
b' g(b)=g(b') b for all g. The fraction field F contains both
injectively; section 1 gives b/b'=a in K. Simultaneous clearing
of powers of mu in the localization Bcris of R=BPlus gives
B,C in R with C != 0 and B=a C in F. The finite coordinate
approximation law states for every m that for sufficiently
large finite index sets I,
  C-sum_(i in I) basis_i lambda_i(C) in p^m AmaxImage.
If all lambda_i(C)=0, p-adic separation gives C=0. Fix one i
with C_i=lambda_i(C) != 0. Put B_i=lambda_i(B).
RUN77 section 1 / native dvd_extendToBPlus at the two-term
coefficient list (1,-a), vector (B,C), map extendedCoord_i:
zero divides the transformed sum in D, so B_i=a C_i in F.
This uses coefficient algebraicity and fixedness, not a false
claim that the coordinate map is K-linear on all Bcris.

3. Primitive pair and algebraic unit obstruction.
By z-adic separation there is a maximal common finite power z^n
dividing B_i and C_i in R. Write B_i=z^n r_0, C_i=z^n r_1.
z != 0; r_1 != 0; r_0=a r_1 in F; not both r_j divisible by z
in R. Coordinate values lie in S_B, the bicommutant; z^n is in
S_B, so the native cancellation law puts both r_j in S_B.
For one common sufficiently large m (intersection of two eventual
conditions, not independent incompatible choices), native coefficient
approximation gives
  p^m r_0 = w_0 + z u_0,   p^m r_1 = w_1 + z u_1,
w_j in Lambda=WittFq c.f, u_j in S_B subset R. Cancel BEFORE
taking divisibility or any norm:
  d := a w_1-w_0 = z (u_0-a u_1).
If d != 0, both a and d^-1 are integral over R: they are algebraic
over the subfield Q_p of R, hence have monic polynomials over R.
Consequently v=d^-1 (u_0-a u_1) is integral over R and z v=1
in F. Multiplying a monic equation of v by z^degree gives
1 in z R (degree zero impossible in nontrivial R). Equivalently
use the native integral-closure local hom. Thus z would be a unit
of R, contradicting primitive pair choice. Therefore d=0 exactly.
If w_1=0, then w_0=0, and p invertible in R makes both r_j
divisible by z, again impossible. Hence w_1 != 0.
Write w_1=p^k e with e a unit of Lambda (its DVR property).
Then p^k a=e^-1 w_0=:w in Lambda. Multiplying by b' in F and
using injectivity gives the actual native output
  p^k b = w b' in Bcris.
No uniform k claim; k depends on the input pair, as in the source.
For b'=1, p invertible in S_B supplies the unique representative
p^-k w in S_B. Apply this to each entry of the actual invariant
M^-1 phi(M) and its inverse in RUN77; the existing finite matrix
assembly needs no uniform coefficient denominator, only existence
and S_B membership. Do not confuse this with the distinct uniform
period bound on representation lattices from RUN74.

This is a scalar proof of the actual native fraction supplier and
its quotient fixed-field prerequisite, with one coordinate, one
primitive common factor and one algebraic unit contradiction. Not
a new RH inequality and not a claim that all Bcris elements lie in
S_B. The named chart extension, coordinate approximation, both
separation properties, DVR/embedding/localization laws, Ax–Sen–Tate
and Tate twist vanishing remain premises. Candidate local edges:
Tate residue + DVR -> quotient invariant -> fixed fraction;
RUN77 zero-divisor transport + coordinate detection -> primitive
pair -> coefficient comparison -> Witt ratio -> exists_frob.
Original and reduced global dependency graphs/axioms unchanged.
Cache key compact pin, chart, open image, input b,b', same fixed
a, common coordinate, common m and actual exists_frob consumer.
No URT or RH assumptions. No alternative literature theorem used.

Execution (local Python/SymPy, not Lean): 2 exact identities:
 expand(a*w1-w0-z*(u0-a*u1)+(w0+z*u0-a*(w1+z*u1)))=0;
 expand(g*(w0-a*w1)-(g*w0-a*g*w1))=0.
Two exact abstract negative controls over Q[z] in Q(z):
 (z,z) has both constant coefficients zero before common-factor
 normalization, whereas (1,1) has both nonzero; for a=z (not
 algebraic over Q), primitive (z,1) has w0=0,w1=1,u0=1,u1=0
 and nonzero d=z, so no forced coefficient equality without
 algebraicity. These are checks of the algebra, not native operators.
lean, lake and elan absent on local PATH, so no native rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier execution.
Actual shared receipt 088cd2ec0e935ee1a282f10096949bcf671cc804
still has module_1_build exit124 and full_RH_replay=false.
B2 caller run 45994173721 is ERROR, not a C1 check; repaired
B2 energy status not found at read time. No new CI dispatch,
no replacement proof replay or audit claim. Helpers below prepared
for shared C1 verification, not original-statement replacements.

RESUME HERE: prove the actual all-Frobenius pole-bound supplier
pow_smul_mem_range_BPlus in PeriodRings/FundamentalKernel.lean
at RUN77 exists_inv consumer (same M and inverse, fixed jump
interval), with exact unit/denominator prerequisites; retain
Ax–Sen–Tate and chart foundations for independent audit and
coordinate C1 replay with integration. Do not redo the invariant
fraction argument absent a concrete discrepancy.
HANDOFF TO Galois, integration/editor, independent audit, kernel.
-/

namespace RHGaloisRun78

theorem cancel_common_factor {F : Type*} [Field F]
    (g a r s : F) (hg : g ≠ 0)
    (h : g*r = a*(g*s)) : r = a*s := by
  apply mul_left_cancel₀ hg
  calc
    g*r = a*(g*s) := h
    _ = g*(a*s) := by ring

theorem residue_discrepancy {R : Type*} [CommRing R]
    (a z w0 w1 u0 u1 : R)
    (h : w0+z*u0 = a*(w1+z*u1)) :
    a*w1-w0 = z*(u0-a*u1) := by
  linear_combination -h

#check exists_witt_coeff_of_isChartOf
#check Bcris.exists_witt_ratio
#check BdR.exists_sub_mem_of_smul_sub_mem
#check Lift.Chart.IsChartOf.dvd_extendToBPlus
#print axioms cancel_common_factor
#print axioms residue_discrepancy
#print axioms exists_witt_coeff_of_isChartOf
#print axioms BdR.exists_sub_mem_of_smul_sub_mem

end RHGaloisRun78
