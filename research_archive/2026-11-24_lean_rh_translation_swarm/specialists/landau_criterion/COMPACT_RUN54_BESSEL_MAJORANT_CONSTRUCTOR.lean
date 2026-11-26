import New.RealPlace.BesselCut
import New.Filling.FillingData

/-!
# Compact RUN54 — actual Bessel majorant constructor, at the B caller
26 Nov 2026. HUMAN SOURCE-MATCHED, scalar Lean candidates NOT COMPILED.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript read
b2f589b5fe6c96a650f3fd30c654e0d0bbdc05c3. Previous own RUN53 blob
0109cae18c46067660035f6220128dba70844775.
Latest peer heads d0f9a536 (weighted tower), 11745699 (Haar/shell),
266421eb (formal-degree tails), f4015a87 (native partial checks),
8db7b5c8 (definite theta). Their B integration explicitly retains this
majorant constructor; the tail integral input is already covered by
266421eb, not duplicated here.

Source anchors (relative to grh-compact/src):
New/RealPlace/BesselCut.lean c9e66fa71ab3aff125e672b9fc93caac9f03fa5d
  HasPeakAt.exists_cut_isCutPair lines 72-158.
New/DiscreteSeries/BesselExistence.lean d24e51a59e3048dfa5279c6e39055f4c2cea38ad
  HasPeakAt lines 98-104.
New/RealPlace/FrameNorm.lean 06a65cfd754f2688b899d08320f627fdea415db0
  besselSize_le_norm_mul, besselSize_besselS_mul, continuous_besselSize.
New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058
  IsCutPair, HasSchurBound, InCut.
New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278
  Data.exists_besselSystem and Data.filling (actual consumers).
Lib/DiscreteSeries/FlenstedJensen/TailBounds.lean 3c13565c8bfecf91497747b0fe7cd7e39e50369c
  integral_tail_le.
Lib/DiscreteSeries/FlenstedJensen/PsiDecay.lean 2ca9efe4949fe0b10512153a3562daf2b97d2edf
  norm_dsCoeff_le_pow (also sourced by peer 266421eb).
New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641
  tsum_classCutoff_box_le, still separate.
New/Filling/AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1
  amplitudeAbs_lt_top_and_cut_le (RUN53 consumer).
Do not import the RH root, do not replace the actual Y or graph measure.

## 1. Quantitative localized majorant — same native witness
Fix the exact HasPeakAt input Y,x,P=b^a, a=n in BesselCut (not
the shape n). Write N=shape.n, r=shape.r, f>=1, d=formalDegree>0,
H=||Y(x)||>0, M=8r²+1, C=16^M, R=b^(6N+2).
Native guards: b>=2000, besselSize(x)<=b^(5N),
a+99r²<=r³, r+L+1<=b^4, 3r³f<=A (gap parameter).
The norm is the native operator norm and ||t^-1||=||t||.
Use actual Haar dg and bessel graph ds. Write
 omega(t)=(2/||t||)^M, phi=omega², J=int_G phi,
 t_s=x^-1 s_1 y, Phi(y)=int_graph phi(t_s) ds.
HasPeakAt gives int_graph omega(t_s) ds<=PH, and coefficient
decay gives ||Y(y)||<=Phi(y). Native graph disintegration yields
 int_quot Phi=J. No pointwise finite measure is assumed:
the coefficient tail theorem makes J finite, and the construction
below proves Phi uniformly finite.

For B={g:||g-1||<=1} Haar 0<vol B<infty and ||g||<=16 on B.
Set mu=(C PH/vol B) omega(g) dg, exactly BesselCut's measure.
The native tail-volume estimate lintegral_decay_le at exponent M
gives int omega<=C vol B, hence mu(G)<=C²PH.
This estimate is distinct from formal-degree tail estimate at 2M.

Fix y and O_y={g:besselSize(yg)<=R}. For each s, t_s^-1 B is
contained in O_y. Indeed t_s g in B and
 ||x^-1 s_1 y g||<=16<=2b; the size invariance and multiplication
 bound yield besselSize(yg)+1<=R. On t_s^-1 B,
 ||g||<=16||t_s||, so omega(g)>=C^-1 omega(t_s).
Left Haar invariance and the definition of mu yield
 mu(O_y)>= PH omega(t_s).
Multiply this inequality by omega(t_s), integrate over s, and
use int omega<=PH and PH>0. We obtain
                  Phi(y)<=mu(O_y)<=C²PH.
All integrands are nonnegative; no division by an infinite mass.
This derives the local controlling measure rather than assuming the
IsCutPair.exists_majorant record. The same Phi is invariant under left
besselU by right translation in the graph group, exactly the native
graph chart action. Measurability follows from measurable norm and
Tonelli; Haar measure is not rescaled.

## 2. Peak reproduction removes the unknown normalization H
From Y = Y*(d psi), at x, coefficient norm <=phi,
and weighted Cauchy-Schwarz,
 H² <= d² J int_G phi(g)||Y(xg)||² dg.
Disintegrate on the same bessel graph using Bessel covariance
of the norm, obtaining the last integral as
 int_quot Phi(y)||Y(y)||² dy.
Let q=int_quot ||Y||². It is finite because Y is bounded and
integrable: HasPeakAt bounds its L1 by the integrable coefficient,
using the same graph unfolding. Thus
 H² <= d² J q mu(G) <= d² J q C²PH.
Since H>0, q>0 and
 H <= d² J q C²P.
Normalize F=cY, c=sqrt(card I/q)>0; then ||F||_2²=card I.
Define A0=c Phi and m0=c mu, so
 m0(G) int A0 = c² mu(G) J
              <= c² C²P H J
              <= card I (d J C² P)².
This is the exact signed/positive cancellation of the peak H
and the unknown q before taking bounds. No dependence on H remains.

The native formal-degree tail at exponent 2M gives
 d J <= 8(2000(r+L+1)^6)^(2r²) 2^(2M).
Multiplying by C² and using b>=2000, r+L+1<=b^4,
 d J C² <= b^(50r²+4M+1) <= b^(99r²)
since 99r²-(50r²+4M+1)=17r²-5>=0 (r>=1).
Use P=b^a and a+99r²<=r³ to conclude
                  m0(G) int A0 <= card I b^(2r³).
This is exactly the native IsCutPair mass-times-integral field,
with one measure and one majorant. No extra power of f is introduced.

## 3. The same majorant gives the mismatch multiplier and L² cut
Define chi(u)=max(0,min(1,R-u)) and V(y)=chi(besselSize(y))F(y).
By size continuity and left Bessel subgroup invariance, V is
continuous and has the same Bessel covariance; 0<=chi<=1,
||V||<=||F||, and V nonzero implies y is InCut. Both norms
are bounded by A0; F inherits reproduction and integrability.

If F(y)!=V(y), then besselSize(y)+1>R. For every graph s the
native implication ||t_s||<=2b => besselSize(y)+1<=R now gives
||t_s||>2b. Write K=3r³f<=A. The stronger coefficient estimate
|psi(t_s)| <= (2/||t_s||)^(2M+K) <= b^(-K) phi(t_s)
proves b^K ||F(y)||<=A0(y), and the same bound for V.
When F=V no such multiplier is needed. This is the precise ite
condition used at the amplitude cutoff comparison in RUN53.
Also A0(y)<=m0(O_y), m0 finite, and
 int A0²<=m0(G) int A0<=card I b^(2r³).
Pointwise ||F-V||<=||F|| on the mismatch set, zero elsewhere.
Therefore
 int ||F-V||² <= card I b^(2r³-6r³f)
               <= card I b^(-10r²).
For the last inequality r>=99 follows from a>=0 and a+99r²<=r³,
and f>=1, so (6f-2)r>=10. This is the original required
(b^-5r²)^2, not a relaxation. All IsCutPair fields now have a
human derivation from the native peak, tail and graph suppliers.
The peak existence theorem itself remains a separate deep input.

## 4. Actual caller and remaining obligations
Data.exists_besselSystem calls exists_cut_isCutPair with a fixed
chosen peak and the native HasLogBound scale inequalities; it uses
the returned t for its actual W=(F,V), for hasBandLimits_of_isCutBessel,
and for hasSchurBound_of_convolve_eq using fx and t.integrable.
Data.filling chooses this same BesselSystem; RUN53 then consumes
tail.exists_majorant at every infinite place. The reconstructed field
has the exact scale and witnesses of that consumer.

Original source-level dependency graph retained:
 B -> Data.filling -> Data.exists_besselSystem ->
 {peak existence, exists_cut_isCutPair, Schur bound, local bands};
 exists_cut_isCutPair -> {HasPeakAt, graph disintegration, Haar tail
 bounds, coefficient decay, frame norm bounds}.
 B -> Moments -> amplitudeAbs_lt_top_and_cut_le ->
 {tail.exists_majorant, boxed-frame count, quotient normalization}.
Expanded graph (not a kernel edge deletion):
 peak bound + near-ball Haar estimate -> finite mu and Phi domination
 -> reproduction/CS -> peak cancellation -> normalized mass budget
 -> native mismatch decay -> exact L² error and IsCutPair
 -> RUN53 absolute convergence.
Retain peak existence/graph disintegration, tail-volume at M and
decay coefficient results as actual source inputs; do not identify
these with a proof of the whole B root. No changes to A/C, no deletion
of source terms, no claimed minimal elaborated dependency graph.

## 5. Next box-frame step: exact packing exponent, no new gap hidden
The source BoxPartition.lean lines 513-557 chooses one representative
per frameImage and proves distinct representatives separated by
epsilon=(N_level boxSize)^-1, radius 2 boxSize about one representative.
For dV=dim_R V, disjoint open balls of radius epsilon/2 imply
 #(representatives) <= (1+4 N_level boxSize²)^dV.
The original source scale estimates bound this by b^(6 N² dV).
Equal-frame fibers are precisely same class and classUnip0 relations
by NearTerms.termsOver.eq_and_mem_classUnip₀. Within each fiber the
injective (class,delta) labels map to classUnip and the exact partition
sum of beta gives sum <=x. No unweighted count of the infinite fiber.
This does not supply the preceding separation implication; retain
integrality of frameProducts, descent through termPosition entries,
and definite middle-form rigidity as the next actual tasks.

## Evidence and tests
Lean/lake absent in this run. Native rh_scan/prune/reduce/auto not
executed on compact source; no transfer of old kernel evidence.
Direct GitHub state status records fetched:
45577239749 pass (b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc),
45576756833 pass (7da354941e402b6f8b364ed03d8c5c82d27b7717),
45799225653 pass (77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35).
45803534769 error (a56e2d3afb99ed8275e81fd63c8494306e57c43f);
peer f4015a87 reports six successful native B/C probes with three
standard axioms, A module timed out. No PASS for this new candidate.
Actual JS integer regression: 1000 ranks for exponent 99r²-(50r²+4M+1)
minimum 12; 18040 (r,f) cases for 99<=r<=1000, 1<=f<=20,
minimum tail slack 3783186; zero violations. These are scalar controls,
not tests of Haar geometry or proof of RH. Full-domain exponent
proofs are displayed above. New axiom audit requested, not executed.

RESUME HERE: integration/editor can insert sections 1-3 into the
existing §8 B convergence block immediately before RUN53. Independently
audit the graph disintegration normalization and the same-measure
mass comparison. Next reconstruct BoxPartition.tsum_classCutoff_box_le
separation: derive the strict <1 bounds on every conjugate of the
integral differences using the actual frame norm and termPosition,
then descending frame column equality and definite rigidity. Do not
repeat the analytic endpoint or the weighted tower/shell argument.
HANDOFF TO: integration, editor, positivity geometry, audit, kernel.
-/

namespace CompactRun54

-- Scalar part of the mass budget after the actual convolution CS step.
-- Prepared only: run with the pinned compact toolchain.
theorem normalized_mass (H d J q K m c cardI : ℝ)
    (hH : 0 < H) (hd : 0 ≤ d) (hJ : 0 ≤ J) (hq : 0 ≤ q)
    (hK : 0 ≤ K) (hm : m ≤ K * H)
    (hcs : H^2 ≤ d^2 * J * q * m)
    (hnorm : c^2 * q = cardI) :
    c^2 * m * J ≤ cardI * (d * J * K)^2 := by
  have hp : 0 ≤ d^2 * J * q := by positivity
  have h1 : H^2 ≤ d^2 * J * q * (K * H) :=
    hcs.trans (mul_le_mul_of_nonneg_left hm hp)
  have h2 : H ≤ d^2 * J * q * K := by
    by_contra! hn
    have hpos := mul_pos (sub_pos.mpr hn) hH
    nlinarith only [h1, hpos]
  have h3 : m ≤ K * (d^2 * J * q * K) :=
    hm.trans (mul_le_mul_of_nonneg_left h2 hK)
  calc
    c^2 * m * J ≤ c^2 * (K * (d^2 * J * q * K)) * J :=
      mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_left h3 (sq_nonneg c)) hJ
    _ = (c^2 * q) * (d * J * K)^2 := by ring
    _ = cardI * (d * J * K)^2 := by rw [hnorm]

theorem degree_exponent (r : ℝ) (hr : 1 ≤ r) :
    50*r^2 + 4*(8*r^2+1) + 1 ≤ 99*r^2 := by
  have h := mul_nonneg (sub_nonneg.mpr hr) (show 0 ≤ r+1 by linarith)
  nlinarith

theorem cut_exponent (r f : ℝ) (hr : 99 ≤ r) (hf : 1 ≤ f) :
    10*r^2 ≤ (6*f-2)*r^3 := by
  have hr0 : 0 ≤ r := by linarith
  have h1 : 10 ≤ (6*f-2)*r := by
    have h := mul_nonneg (sub_nonneg.mpr hf) hr0
    nlinarith
  have h := mul_le_mul_of_nonneg_right h1 (sq_nonneg r)
  nlinarith only [h]

#print axioms normalized_mass
#print axioms degree_exponent
#print axioms cut_exponent
#check HasPeakAt.exists_cut_isCutPair
#check Data.exists_besselSystem
#check Filling.tsum_classCutoff_box_le
#check Filling.amplitudeAbs_lt_top_and_cut_le
end CompactRun54
