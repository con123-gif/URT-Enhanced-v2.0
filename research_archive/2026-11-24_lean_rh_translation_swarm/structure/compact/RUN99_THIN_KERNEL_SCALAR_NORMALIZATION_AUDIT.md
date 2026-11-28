# RUN99 — Thin-class kernel normalization (B2)
28 November 2026. PARTIAL / independent human source audit; no fresh Lean replay.
Resume RUN98 (3a590261d13b445b3547d400453102a47f8daa43) at
ThinClasses.tsum_schurIntegral_le 108–123. Audit the existing V10–V11
rather than optimize unrelated constants. Use the preferred derivation
integration/2026-11-26_COMPACT_THIN_CLASS_VOLUME_KERNEL.md
(blob 06f07be1986616e2068cfa1bdb5641e075da450b), V7–V11.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484, manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 (B2), SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS and relevant physical
state/protocol/log excerpts read. Allocation amendment
99cfbd1f04c3a4c6d02c21a8fde207f2121aef20 checked. Recent commit
metadata and RUN98 retrieved; no RUN99 result in commit search.
Physical CI 46109263335 is not evidence of RH replay.

## 1. Exact source and retained hypotheses
Alpöge–Sernau and collaborators, lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- New/Filling/ThinClasses.lean blob 6ae40a38e407331b9954067c833c34a62277b2e5,
  tsum_schurIntegral_le 48–123, scalar comparison 108–123.
- New/RealPlace/VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0,
  exists_kernel_frameVolume_le 164–171 (actual upper bound).
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  size bounds 42–58, frameScaleSq 148, basisScale_besselFrame 169–170,
  tailScale 292, one_le_abs_kappa and N_le 305–307,
  det_submatrix_realFrameGram_ratToInf 379–382.
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
  minorNorm and classGauge 360–367, HasLevel.minorNorm_pos 401.
- New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
  pow_le_tailScale 281–283, of_size_bounds 288–293,
  isIntegral_frameProducts 315–317.
- New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18,
  boxedPoints 104–107 (native InCut size).

Keep the SAME admissible S, StablyUnram E, CMType E, term hk over
(c,s,c'), and level h_level: S.HasLevel j gamma. Retain the previous
actual kernel/alignment/cutoff/covolume/counting suppliers (RUN96–98).
Write h=varrho, n=h+1, 0<=j<=n, m=min(h,j), e=j-m (natural subtraction).
Thus e in {0,1}, e(h)=e(n-1)<=m, and j<=2m (h>=100000).
Use b>=1000, g>=b^19, 5<=N<=b^(60n), |kappa_v|>=1,
k>=512000 n^9, f=#infinite places, theta=b^(6n+2), tau=b^(kf/4).
Define A=leadingMinor(frameProducts gamma,j), a_v=|Phi_v(A)|,
P=prod_v a_v>0, D=minorNorm(j,gamma).
All powers below are positive real quantities except the original
nonnegative integrals. From the exact native minorNorm and CM norm,
D=P^2/N^(2fe), hence P=sqrt(D) N^(fe). Also P>=1:
A is a NONZERO algebraic integer by HasLevel and
isIntegral_frameProducts, so its absolute rational norm is an integer
at least one. This does not assert D>=1 at the top level.

## 2. Cancel the N factors before estimating
Let alpha_(v,i)=kappa_v^(h-i)/sqrt(N) for 0<=i<j. These are
nonzero real scales, possibly signed; only their absolute squares
occur in the determinant. Set
Q_v=prod_(0<=i<m)|alpha_(v,i)|^2
    = |kappa_v|^(2 sum_(i<m)(h-i))/N^m.
The leading normalized determinant has modulus
    |det z_v|=a_v Q_v N^(-e),
and the actual R_v has
    |det R_v|^2=(pi g/b)^(2m)/Q_v.
These identities follow directly from Setup.148,169,379;
at j=n exactly one additional scale is alpha_(v,h)=1/sqrt(N).
Do not use the scale product over all n rows at a smaller j.

The upper bound J_v on the nonnegative kernel integral in V7 is
    [(2 theta^2)^j/|det z_v|]^(k+n)
      [pi^m/(m! theta^(2m)|det R_v|^2)]^k.
Substitution and multiplication over v gives the EXACT identity
    prod_v J_v =
      D^(-(k+n)/2) *
      [2^(j(k+n)) theta^(2(j n+e k))
       (b^2/g^2)^(mk) / (pi^m m!)^k]^f *
      prod_v Q_v^(-n).                               (99.1)
Indeed the product of a_v^(-k-n) is
D^(-(k+n)/2) N^(-fe(k+n)); the top scale factors
N^(fe(k+n)) cancel it identically. For selected rows Q_v
the powers -(k+n) and +k combine to -n.
There is no lost factor of N or square root and no dependence
on a choice of frame sign.

Normalize by the desired native kernel factor
    T=(b^4 g)^(-mkf) D^(-(k+1)/2)>0.
Then (99.1) yields
    prod J_v / T =
      D^(-(n-1)/2) *
      [2^(j(k+n)) theta^(2(j n+e k))
       (b^6/g)^(mk)/(pi^m m!)^k]^f *
      prod_v Q_v^(-n).                                (99.2)
Since P>=1, D^(-(n-1)/2)=(N^(fe)/P)^(n-1)
<=N^(fe(n-1)). Also prod Q_v^(-n)<=N^(fmn)
because |kappa_v|>=1 and h-i>=0. pi>=2, m!>=1.
It follows that the ratio is at most
    [2^(j(k+n)) b^((12n+4)(j n+e k)-13mk)
       N^(mn+e(n-1))]^f.                              (99.3)

## 3. One uniform exponent inequality, including the empty level
The archive V10 separately estimates j<=h and j=n. Both follow
from the SAME inequalities e(n-1)<=m and j<=2m, so there is
no need to present a separate top-level exponent expansion.
Because n>=100001,
    (12n+4)e <= (12+16/(n-1))m <= (49/4)m,
    j/8 <= m/4,
    mn+e(n-1)<=m(n+1).
Also 2<=b^(1/8) follows from b>=1000>=256. Replace N by
b^(60n) in (99.3) only after establishing that its exponent
is nonnegative. The resulting b-exponent per infinite place
is bounded as follows:
    j(k+n)/8+(12n+4)(j n+e k)-13mk
       +60n(mn+e(n-1))
    <= m[-k/2+84n^2+(273/4)n]
    <= m[-k/2+85n^2]
    <= 0.                                             (99.4)
The penultimate inequality uses n>=273/4 and the final one
uses k>=512000 n^9>=170n^2. This is a full-domain symbolic
bound, not a finite parameter sweep. At j=0, m=e=0, A=1 by
the empty determinant convention, all factors in (99.2) are
one, and (99.4) remains valid without division by m.

Consequently prod J_v <= T. This independently audits V10
and removes the explanatory two-case exponent calculation;
the exact same retained hypotheses suffice. The extra tau
used by the native scalar comparison is NOT needed in this
human upper bound, but is retained in the theorem interface.
RUN98 (98.5), or V9, gives
    sum_(delta in double class) schurIntegral(delta)
    <= nu d_B tau I_gamma^(k+1) prod_v J_v
    <= nu d_B tau^2 (b^4 g)^(-mkf)
                    (I_gamma/sqrt(D))^(k+1).           (99.5)
Here nu=unipCovolume>0, d_B=card BesselCoord>=0,
I_gamma=xRowsIndex positive from the actual level witness.
The final enlargement uses tau>=1, so does not need division
by d_B or any cancellation of a potentially zero measure.
All finite sums and kernel integrals are compared in ENNReal;
the upper bounds are nonnegative finite reals converted
by ofReal. This is exactly the V11 / ThinClasses original
statement, not an asserted new native result. The separate
opposite-Schur-weight consumer at 131–149 still requires audit.

## 4. Rejected routes and actual verification
- D>=1 uniformly: at the top the native integral norm is
  divided by N^(2f); only P>=1 is justified by this argument.
- Use raw leading minor instead of normalized minor in target:
  loses the exact cancellation N^(fe(k+n)).
- Cancel every alpha factor between numerator and denominator:
  Q_v^(-n) survives; dropping it would discard N^(fmn).
- Put theta^(2j) instead of theta^(2jn+2ek) after normalization:
  misses the k contribution when e=1.
- Assume a_v>=1 individually: an algebraic unit can have
  individual conjugates below one; the product P is the bound.
- Divide by m in a uniform exponent estimate: j=0 is legal.
  The inequalities e(n-1)<=m, j<=2m avoid this issue.
- Remove tau^2 at downstream callers automatically: the human
  stronger kernel bound does not constitute a compiled
  replacement or prove that any native dependency disappears.

Actual verification: retrieved pinned definitions, theorem bodies,
prior V7–V11 and RUN98; independently derived (99.1)–(99.5)
by symbolic algebra and full-domain inequalities. No fresh Lean
execution, proof-term extraction, numerical performance test,
or new root closure. The existing joint eleven-declaration
B2 replay and graph are separate evidence. URT structural
grouping motivated factoring out the exact target and eliminating
the top-level split; ordinary algebra, CM norm integrality and
the retained source hypotheses establish validity. No benchmark
or O(N) claim. B2 human assembly and full RH remain OPEN.

RESUME HERE: independently audit ThinClasses.tsum_amplitudeAbs_class_le
131–149 (V12–V13), using (99.5) unchanged: opposite weight
Cauchy–Schwarz, inversion and the exact besselEnergy/countWeight
normalization at the top and lower levels.
HANDOFF TO integration/audit: use (99.1)–(99.5) as independent
audit of V10–V11; preserve V9, native original constant and all
primitive/replay obligations.
