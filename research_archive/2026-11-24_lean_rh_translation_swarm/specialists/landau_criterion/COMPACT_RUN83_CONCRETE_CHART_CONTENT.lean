import New.RealPlace.ComplexGauge
import New.Filling.StandardLevel
import Mathlib.Tactic

/-!
# RUN83 — concrete chart-majorant suppliers, real and finite
27 November 2026. HUMAN SOURCE-MATCHED derivation; Lean helpers PREPARED,
not compiled. RH remains OPEN. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
24b10d71aff1d6d8075e7629a1710c1b0cc7a969, c40f1debc6872fb9e1f080a90c39d94e0b1caffe.
Prior RUN82 blob 825fdbd3a430c06a1253bc29d98ffdaf5e49af2d.
Read current protocols, AGENTS and continuity. B2/C2 accepted local graph
audit blob 4303ef5504e7b83bcc7bad6cc00519827447d90e. Do not reopen E1 or
claim local B3 closure of star.

## Actual caller and source identities
Gauge.com (LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e,
lines 296–301) supplies direct and reciprocal chart volume bounds.
RUN82 uses direct half at zero v; LocalTheorem.lean
671350f97491467f09b80eafa0df13685dd8ddc6, 117–176,
lintegral_selfNorm_le calls lintegral_floorWeight_le. The concrete real
gauge is RealPlaceSizes.gauge, ComplexGauge.lean
86c2d26bfaf34292de7d1e79c1634b020b26c1f3, 123–152 and 157–214;
ComplexShells.lean 351cfdf7fa54238f79b1b950c3532feef1f74f53,
38–45, 58–101, 118–128 uses that same gauge in the shell/frequency estimate.
The finite gauge is IntegralPlace.IsStdLevel.gauge, StandardLevel.lean
ec149f4a38c54931f75c7e106ce94d1d6e65c5a4, 147–198; TopFloor.lean
9762970967aef90b3a4e025b7f2891d892c70111, 447–454 selects one depth
alpha=star(a)*a simultaneously for both heads. FiniteSystem.lean
1c169e04852f767f1d1a0140448d902c16dd04e7, 243–258 consumes the finite
level estimate. These are source-level links, not a new elaborated graph.

## Real chart: one positive common kernel, one polar integral
Let F=hF.complexLevel, n=varrho+1, s=F.volumeExponent, D=card iota
=s+1+3n, L>=rho>=4, Lambda=L^2. Use the actual matrix
C=stack(v,N*x^-1*e,N*(xy)^-1*e), N the negative-row selector of 1-J1,
e=F.orthonormalPart. Its rank is <=3 varrho<=3n. The kernel contains
an orthonormal (s+1)-frame O, selected from the zero eigenspace of C* C.
On that frame both transported vectors have positive J1 norm, which is
their Euclidean norm: ||g^-1 e O z||=||z|| for g=x or xy. This is the
actual source form_mulVec_mulVec and e*J1 e=1 calculation, not an
assumption that x and xy are Euclidean isometries on the whole space.

Put r=||O* u||^2 and phi(u)=36/r (ENNReal infinity when r=0).
For r>0 and |t|<=sqrt(r)/9 choose w=O (t/r) O* u.
Then <u,w>=t, each of the two transported norms is <=1/9, and their
difference has norm <=2/9<1/4. Hence w belongs to the SAME W in Gauge.com.
The image of W contains the disk of radius sqrt(r)/9, so its inverse
volume is <=81/(pi*r)<=36/r.

For the direct half write the two close pairs as (a,a-b) and (c,c-d).
All four a,b,c,d have Euclidean norm <1/4, since the level unit g=1.
Exact Hermitian cancellation before estimating gives
    H(a,c)-H(a-b,c-d)=H(a,d)+H(b,c)-H(b,d).
J1 is a Hermitian involution, so each term has magnitude <=1/16.
For any admissible scalar q, test at t=sqrt(r)/9 to obtain
    |q|sqrt(r)/9 <= 3/16, hence |q| <=27/(16 sqrt(r)).
The scalar set is contained in that disk. Its volume is at most
pi*(27/16)^2/r <=36/r. At r=0 both volume bounds are trivial.
Thus the same phi proves both halves, including v=0, without invoking
a separate estimate of each transported form. Keep measurability:
norm-square and ENNReal reciprocal are measurable.

For the shell bound use the full unitary extension of O, with rotated
coordinates each bounded by M=L^(j+1) (D<=L). The projected d=s+1
complex coordinates lie in ball radius R with R^2<=L*M^2;
the remaining k=3n coordinates lie in disks of radius M.
The unitary change preserves product Lebesgue measure. The integral on
the product containing the rotated size shell is bounded by
    (pi*M^2)^k * 36^s * pi^(s+1)/s! * R^2.
Indeed the pushforward of Lebesgue under squared radius in C^d has
density pi^d t^(d-1)/(d-1)!; d-1=s cancels the inverse power t^-s.
The singleton at zero is null; s=0 works as well.
Since 36^s*pi^s/s! <= exp(36*pi), pi<4, e<3,
    pi*exp(36*pi) <= 4*3^144 <= L^145.
Use pi^k<=L^k, R^2<=L*M^2. The resulting exponent
    E=146+3n+2(j+1)(3n+1)
satisfies 198n(j+1)-E = 192j(n-1)+190j+189(n-1)+41 >=0.
This is exactly the required Lambda^(99n(j+1)). This gives a concise
human proof of the actual radial supplier with the original rank and
cardinality conditions, not a new global dependence deletion.

## Finite chart: one integral frame and one content-ideal sum
StandardLevel.lean lines 160–183 chooses the SAME integral invertible V
using valPair.exists_mul_clear_cols, with selected columns Y, by clearing
the stacked v and two constrained transport blocks. The source proves
Y*t in W for every integral t. Retain this native integral-column
construction (not an arbitrary rational change of basis), standard
level box condition, and integral Gram and unit g=F.g.

For close pairs write (a,a-g*b),(c,c-g*d), a,b,c,d integral.
Since star(g)=g, there is an exact identity
    g^-1[H(a,c)-H(a-g*b,c-g*d)]
      = H(a,d)+H(b,c)-g H(b,d) in R.
Test the direct-volume constraint on Y*e_i for each integral standard
basis vector e_i. Thus q*(Y* u)_i belongs to R (using star stability)
for each selected coordinate. Therefore the direct scalar set is
contained in the content set, and phi=P.contentIndex 0(Y* u) bounds it.
For the inverse-volume half, the source's exists_content writes
p=Y* u with content t=r dot p and integral r, so the image contains
star(t)*R by testing Y*(x star(r)), x integral; inverse volume is
bounded by md(t)^-1, precisely the same phi. This works a.e. at the
chosen unit coordinate, and pointwise the definition gives infinity
if that coordinate is not a unit.

The quantitative supplier is FinitePlaceDensity.lean
d53185b90cb994c0af5ed56e7cf23aba91230271, 195–235:
IntegralPlace.exists_content, contentIndex,
lintegral_contentIndex_pow_le. Derive its inequality directly.
Write ambient dimension D, selected dimension s+k, k>=mu, scale beta
a unit, and transform w to w'=beta V* w. The integral change of
coordinates V* has modulus 1; dilation costs md(beta)^(-D).
At almost every w' the designated coordinate is a unit of A.
The content ideal I of the selected coordinates of w' is principal
(t beta) by exists_content, has finite index N(I), and
    contentIndex(Y* w) = md(beta) N(I).
The stratum with that content is contained in the integral product
where all s+k selected coordinates lie in I; its measure after scaling
is <=N(I)^(-(s+k)). Sum over nonzero finite-index ideals, using the
native lintegral_le_idealZeta_mul measurable ideal stratification.
After exact cancellation before summation,
    integral <= md(beta)^(s-D) SUM_I N(I)^(-k)
             <= md(beta)^(-(D-s)) idealZeta(R,mu).
No number of ideal classes, probability independence, or field-only
assumption on A was inserted: native valPair and normalized product
Haar supply the principal content a.e. and ideal index volume.
The native size substitution beta=alpha^j and the existing Z budget
in StandardLevel gives Lambda^(99n(j+1)). Keep the source k=m+5,
mu<=k, full integral-frame and zeta-rank hypotheses. The chart
construction and ideal-sum primitives need independent audit/replay;
this is a human derivation of their actual quantitative combination.

## Status / reduction pipeline
Original visible edges:
selfNorm -> floorWeight -> Gauge.com -> concrete gauge ->
  real: common kernel, unitary volume, sphere-density;
  finite: valPair clearing, integral content, ideal zeta.
Reduced human presentation: common projection test + exact Hermitian
difference + one polar integral or one ideal sum. No kernel edge
deletion claimed, all prior original/reduced graphs retained. Cache by
pin, concrete level, depth, both chart centres, v and selected frame.
Rejected routes: treat arbitrary unitary group element as Euclidean
isometry; choose d=s rather than s+1 (log singularity); assume uniform
finite measure on the whole local ring; discard nonunit exceptional
set without the native a.e. law; use arbitrary Q-basis in finite chart.
No URT claim; no import of RH root.

Actual verification in local sandbox: command -v lean/lake and toolchain
directory checks gave no installation. SymPy expanded finite scalar
cancellation to 0 and exponent slack with n=m+1 to
192*j*m+190*j+189*m+41. These are symbolic algebra checks only.
Native rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier not runnable
locally. Prepared helpers below and source probes are NOT compiled.
Historical status JSONs for 45577239749 / 45576756833 were fetched
again (blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717) report pass on old pin,
not this compact file. No new compact kernel/axiom receipt.
B2/C2 audit remains local. No protected workflow edits or duplicate CI.

RESUME HERE: independently audit the concrete finite integral-column
supplier valPair.exists_mul_clear_cols in StandardLevel (including
the exact shape and integral inverse), then attach both concrete chart
derivations to RUN82's directChart and the actual selfNorm caller.
HANDOFF TO integration/editor/audit/shared native runner: replay
RUN82 directChart original-output bridge and RUN83 helpers on compact pin;
retain native com, source structural/type/value edges and axiom evidence.
-/

namespace RHRun83

lemma hermitian_scalar_difference {A : Type*} [CommRing A] [StarRing A]
    (a b c d g : A) (hg : star g = g) :
    star a * c - star (a - g * b) * (c - g * d) =
      g * (star a * d + star b * c - g * star b * d) := by
  simp only [star_sub, star_mul, hg]
  ring

lemma complex_shell_exponent (n j : ℕ) (hn : 1 ≤ n) :
    146 + 3*n + 2*(j+1)*(3*n+1) ≤ 198*n*(j+1) := by
  obtain ⟨m, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : n ≠ 0)
  have e : 198*(m+1)*(j+1) =
      (146 + 3*(m+1) + 2*(j+1)*(3*(m+1)+1)) +
      (192*j*m + 190*j + 189*m + 41) := by ring
  simp only [Nat.succ_eq_add_one]
  omega

end RHRun83

#check RealPlaceSizes.gauge
#check exists_orthonormal_ker_lintegral_le
#check IntegralPlace.IsStdLevel.gauge
#check IntegralPlace.lintegral_contentIndex_pow_le
#print axioms RHRun83.hermitian_scalar_difference
#print axioms RHRun83.complex_shell_exponent
