import New.RealPlace.OpenCellBound
import New.Filling.BlockBound
import Mathlib.Tactic

/-!
RUN55 — 26 Nov 2026 — human reconstruction / prepared Lean certificate, NOT compiled.
Primary compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb.
Credit the compact source authors. Not an independent RH proof.
Read lead d05b7f48041531bae057d56291f64889d0316efb and preceding peer
thin/frame/link/tower/Haar results; do not duplicate those. Focus the
remaining thick open-cell branch. Preserve original root and all graphs.

Pinned compact paths relative to grh-compact/src (nine blob comparisons executed):
New/RealPlace/OpenCellBound.lean 054e3375d3ef6c96633ab3c2e44b38df52a94755
New/RealPlace/SobolevCell.lean e17e4a553395ce74293990336836cafe0b60d519
New/RealPlace/CellNeighbourhood.lean 6930631979c8d744667e5e3f832e35cf8477e8c6
New/RealPlace/GramSectionBounds.lean 5044a4a899b36f1f42d538968eeb0c733c181a2d
New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058
New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd
New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea
Lib/General/Analysis/ZpowSum.lean f9ea2609ce9a92ddfda2afe48f28d1437257808f
Lib/DiscreteSeries/Bessel/RealMeasures.lean 4978795502441b9137a2caf7234b7b0beef8db34
Readable companion grh/src/New/Spanning/Bessel/OpenCellBound.lean
83e8a6ca952265cb8689a735e7c9ff9347f7f0fd clarifies scales and witnesses;
not an interchangeable proof.

1. Trace at the actual Gram-section caller.
Set n=varrho+1, r=rank, P>=8r, c>0. Assume the exact B premise of
lintegral_gramSection_integral_le: on the P^-6 ball about Z the Gram
discriminant is >=c and the inverse, norm and inverse square root of
corner defect are <=P. The support of the same integrable test phi
lies in ||y||<=P^20. The HasSchurBound hypothesis supplies continuous
right-derivative words V_w, with quotient Schur constant
P^(2|w|)D for |w|<=2n^2.

For a continuously differentiable Hilbert-valued coordinate curve g,
||g(0)||^2 <=2||g(t)||^2+2t integral_0^t ||g'(s)||^2 ds.
Integrate in t and divide by epsilon<=1 to obtain
||g(0)||^2 <= (2/epsilon) integral_0^epsilon(||g||^2+||g'||^2).
At this caller derivatives are continuous from the analytic section and
continuous V_w and dominated by |phi| times finite constants on the
compact coordinate box. For the more general differentiable-only native
sobolev_trace retain its area-formula proof, not a blanket FTC claim.

For a derivative-letter set L with cardinal r^4 (two matrix-index
pairs), Cauchy--Schwarz bounds the squared derivative by
|L| Lambda^2 sum_l ||f_(l w)||^2. Iterating the trace along all
d=2n^2 real coordinates, without repeating a coordinate, gives
(2/epsilon*(1+(|L|Lambda)^2))^d K when EVERY word of length <=d
has cube-integrated squared norm <=K. This is the native sobolev_chain
estimate: the recursion accumulates a sum of weights, not a supremum
over independently chosen test functions. Use epsilon=P^-8.
Correct the rough |L|<=P^4 (not P^2); this reflects the four
matrix indices in SobolevCell's psi. For Lambda=P^112 the trace
factor is <=P^(242d), since 2P^8(1+P^232)<=4P^240<=P^242.
This is within the source's P^(2000n^2) bound.

2. The derivative words really are the source's words.
Use the measure-preserving real coordinate identification of
SobolevCell, Z+e x, with x in [0,P^-8]^(2n^2). The source's norm
bound for e puts this cube inside the half P^-6 ball. At a point
p(t) of this cube, the section bound gives ||gamma_p||<=P^12 and
||D gamma_p||<=4P^18 (use radius P^-6/2). The derivative along
one real matrix coordinate has direction norm <=2.
For omega=(h,u), ||u||<=P^20, let
g(t)=gamma_p(t) (u embedH h)^-1, A=g^-1 g'.
Compact H acts isometrically and U.norm_inv gives
||g^-1||<=P^32, ||g'||<=8P^38, hence ||P^40 A||<=8P^110<=P^112.
The logarithmic derivative at g(t)y is y^-1 A y. Expand its entries
BEFORE estimating. Each new letter ((a,b),c,d) contributes
(P^40 A_cd) times y^-1_ac y_db / P^40 to the derivative of the
integrand. In the source indexing this is y^-1_ad y_cb, with
the corresponding transposed A index; no change of operator.
Define psi_word by multiplying the SAME phi by these normalized
factors. On its support each has modulus <=1, so
|psi_word|<=|phi|; integrability and support persist for every word.
Bounded continuous Bessel derivative words allow differentiation
under the integral on each coordinate neighbourhood. Then
||partial f_word|| <= P^112 sum_l ||f_(l word)||.
All tests in this estimate are actual derivatives of the same
initial function; no independent pointwise test selection.

3. Supply K by chart and orbit integration.
For each word, the injective open-cell chart, with its native
Haar Jacobian c_G g(Z')^(k-1), dominates the integral over the
coordinate cube with weight c_G c^(k-1). The chart lower bound
le_lintegral_of_gramSection is applied for every compact left H
rotation; left besselS invariance of the vector norm removes this
rotation. Its proof is the existing chart Jacobian and one-column
Cayley integral, reconstructed in peer 11745699. Keep those
dependencies and the positive finite normalizations.
The integrand is restricted to realFrameGram^-1(Q), Q the half
ball. The compact fibre cutoff chi in SobolevCell has orbit
integral one on U0; multiplying by the indicator of that preimage
does not increase it. On pairs of nonzero points in the same U
orbit, frameMatrix(s)=Z_2 Z_1^-1 (up to the native order),
so entries <=P^2. Quotient disintegration and free unitriangular
coordinates then give the orbit multiplier (2P^2)^(2n^2)<=P^(6n^2).
Indeed translate one nonzero orbit point to identity, integrate
the U0 factor first (at most 1), and restrict the remaining frame
coordinates to complex disks radius P^2, each area <=(2P^2)^2;
at most n^2 coordinates are needed. This is the actual proof
mechanism of lintegral_mul_le_of_frameMatrix_le, not an estimate
using total group volume.
The Schur word bound contributes P^(4n^2)D; |psi_word|<=|phi|
gives the SAME K=P^(10n^2)D integral|phi|^2 for every word
of length<=2n^2. Combining gives a sufficient exponent
494n^2 <=2000n^2. Retain the original native constant.
Thus the source Gram-section estimate is reconstructed conditional
on the section analytic bound, Haar chart and fibre-cutoff suppliers.
No claim of independent verification of those previous suppliers.

4. Open-cell probability and mass at the actual BlockBound caller.
Let g=gramDiscReal Z>0, Z=realFrameGram gamma. Near box witnesses
give entries <=rho^2. Take M=rho^(9n)/g, R=M^(9n), T=R^5,
P=T^n=M^(45n^2). Hadamard and g<=|det Z|^2<=rho^(8n)
(using n<=rho) yield M>=rho; M^-1<=g. Hence the native
neighbourhood and Schur hypotheses hold. The compact source
exists_tube at T supplies compact A, measurable Omega subset U0
with 0<vol(Omega)<infty, Omega*{||z||<=T} subset A,
||A||<=P^20 and orbit cutoff integral <=T vol(Omega).
The primitive tube existence uses dilation/covering; retained.
Use gamma=s gamma_Z (u0 h0)^-1 from the actual double-cell
decomposition. For x=(h,v) put t(x)=u0 embedH(h0 h^-1)v^-1;
then gamma t(x)=s gamma_Z(v embedH h)^-1 and t is measurable,
in U0 H. Use m=Haar(H)xHaar(U0) conditioned on HxOmega;
Haar(H) has mass one. Neither m nor A depends on phi.
For bounded measurable phi on A apply step 3 to the coordinate
tests phi(y) conj(W(y)_j) 1_A(y) and sum over j. Compactness
and bounded continuous W ensure integrability. The Bessel
unitary transformations for s and t(x) cancel in the squared
Hilbert--Schmidt norm, AFTER summing both indices. Thus the
same joint law, not independent marginals, yields
 E_m ||integral_A phi(y) W(gamma t(x)y) tensor conj(W(t(x)y))dy||^2
 <= integral |phi|^2 dn,
 dn = P^(2000 n^2) (d/deg)/(C vol(Omega))
      * 1_A(y)||W(y)||^2 dy,
 C=c_G(g/2)^(k-1), d=card I.
All scalars C,deg,vol(Omega) positive finite.
The orbit estimate applied to 1_A with cutoff <=T vol(Omega)
and R_frame=P^40 (norms of both matrices <=P^20) gives
 integral_A ||W||^2 <= T vol(Omega)(2P^40)^(2n^2)d,
using native quotient norm d. Cancel vol(Omega) exactly.
Since 2<=M the resulting n(G) is at most
 M^(93600 n^4+45n+2n^2) d^2/(deg C)
 <= M^(100000 n^4) d^2/(deg C) = cellMass.
Here 93600=45*(2000+80), no extra factors of d or vol(Omega).
Finiteness follows from this bound, not from division by infinity.
This supplies the measure/contraction portion of BesselSystem.open_cell
conditional on the retained compact tube, decomposition and local
geometry. The support implication must use the SAME t(x):
||v^-1 y||<=R^5 for y in frameBox rho and besselSize(gamma t(x)y)<=rho.
The last matrix calculation in OpenCellBound supplies it; not fully
reconstructed here. No assertion that the full theorem is closed.

5. Actual thick caller and outstanding dependencies.
BlockBound.enorm_amplitudeSum_le_classSize_top applies this at all
archimedean places, tensorizes the laws and chooses ONE joint shift
with the support condition. Retain the native cut-vs-full tail
error, its half-budget, and SchurTest.IsNear.le_classSize_and_cellMass_le:
b^(-k^3 f)<=classSize_top and product cellMass <=(nu classSize_top/2)^2.
The latter is a separate quantitative comparison, not proved by the
mass cancellation alone. No claim of whole B or star closure.
Original path: GramSectionBounds + CellNeighbourhood + ZpowSum +
RealMeasures + BesselSystem -> SobolevCell -> OpenCellBound ->
BlockBound -> Moments -> Data.enough_forms -> star_inequality.
Reduced human path: coordinate trace + word domination + Haar/quotient
bound -> same-joint-law cancellation -> actual cellMass; all remaining
dependencies visible. No global native edge removed.
Nine pinned source blob checks executed. Integer polynomial expansion
of 100000n^4-(93600n^4+45n+2n^2), n=1+u, has coefficients
6353,25551,38398,25600,6400; four independent evaluations at
n=1,2,7,100001 executed. The rough trace bound computed here
uses r^4 letters and gives 494, NOT the 486 intermediate computed
using r^2; corrected before commit. No native Lean available;
the certificate below and #check/#print axioms are prepared only.
Prior native run evidence is unchanged; no new PASS. Native reduction
engine is on the old pin and not run against this compact branch.

RESUME HERE: prove the remaining SAME-shift matrix support bound in
OpenCellBound (last proof block), compare with lead's latest progress
to avoid duplication; then derive SchurTest.IsNear.le_classSize_and_cellMass_le
at its exact caller with packetConst and formal-degree normalizations.
HANDOFF TO integration/editor/audit and shared compact replay lane.
-/

namespace RHPositivityCompactOpenCell

theorem mass_exponent (n : ℕ) (hn : 1 ≤ n) :
    93600*n^4 + 45*n + 2*n^2 ≤ 100000*n^4 := by
  have h2 : n ≤ n^2 := by
    calc
      n = n*1 := by simp
      _ ≤ n*n := Nat.mul_le_mul_left n hn
      _ = n^2 := by ring
  have h3 : n^2 ≤ n^3 := by
    calc
      n^2 = n^2*1 := by simp
      _ ≤ n^2*n := Nat.mul_le_mul_left (n^2) hn
      _ = n^3 := by ring
  have h4 : n^3 ≤ n^4 := by
    calc
      n^3 = n^3*1 := by simp
      _ ≤ n^3*n := Nat.mul_le_mul_left (n^3) hn
      _ = n^4 := by ring
  omega

theorem trace_exponent (n : ℕ) :
    242*(2*n^2)+6*n^2+4*n^2 ≤ 2000*n^2 := by omega

#print axioms mass_exponent
#print axioms trace_exponent
#check sobolev_chain
#check lintegral_mul_le_of_frameMatrix_le
#check lintegral_gramSection_integral_le
#check BesselSystem.open_cell
#check Filling.IsNear.le_classSize_and_cellMass_le
#check Filling.enorm_amplitudeSum_le_classSize_top
#print axioms BesselSystem.open_cell

end RHPositivityCompactOpenCell
