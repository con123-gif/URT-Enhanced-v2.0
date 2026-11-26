import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
RUN57 theta lane — 26 November 2026. Human source-matched reconstruction
of the level-N Fourier index, ramifying rank loss and exact A caller.
Native replacement certificates PREPARED, NOT COMPILED.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
d185408f9b17703c84b1584444bfde1f65d57e74. Protocol, handoff, expansion,
AGENTS, continuity and research state/log excerpts inspected.
Previous theta 663c88ca: zero-exponent term and same-module transport.
Prime RUN59 747e9219: exact stage support and low-column charge;
acceleration 03380f28: marked orbit mass; kernel 5c9704e4:
depth-layer mass. Do not duplicate those branches.

Pinned source ledger (relative to grh-compact/src):
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45
  57-101 conjugate level and mirabolic; 103-123 ramified bridge and F
  preserves columns; 125-169 exists_indexDvd_fourierOp_pow.
New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7
  exists_GL_last_col_and_row, fourierOp, mirabolic,
  lastRowDatum_conj_u₀, mirabolic_fix_fourierOp.
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
  165-257 central generators, ramifyingOp, rank and short span.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  31-80 detChar and datum raise bounds; 82-109 chain pairing;
  113-138 gaugeLe_Bmu_at_N.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  285-307 exists_indexDvd_Bmu_divisible, p=N branch.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
  IndexDvd.of_det_dvd, comap, trans.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
  143 k size, 177 a size, 195-201 k,m guards.

1. Exact permutation in the Fourier operator, not a norm estimate.
Write S=nonInducedPlaces, R=prod_(w in S) F_N and u0=diag(1,...,1,N^-1)
at every w in S. Let d0=diagPointN 0 and let pi be nonInducedRep 0
(translation through conjugation by d0). For y with unit last coordinate
z choose the native integral invertible lift k_y of a matrix with both
last row and column y. Over R the explicit formula in the source is
C=identity with last column replaced by y, k_y=z^-1 C C^T.
Indeed det C=z, so k_y invertible, and its last column is y since
C^T e_last=z e_last. Symmetry gives its last row too.
The Fourier operator is
    F=pi(u0) sum_(y_last unit) psiN(y_last) pi(k_y).
For any g in the mirabolic, A=u0^-1 g u0 is integral invertible:
both g and g^-1 have last column e_last modulo N, so multiplication
by u0 only divides the off-diagonal last column, which is divisible
by N. A and A^-1 have last row e_last modulo N.
Hence y -> Abar y permutes the summation set, preserving y_last and
the exact additive-character coefficient. Put
    h_y = k_(Abar y)^-1 A k_y.
This integral invertible matrix has reduction fixing e_last, since
k_(Abar y)e_last=Abar y. It is mirabolic and
    g u0 k_y = u0 k_(Abar y) h_y.
This is the exact termwise reindexing behind mirabolic_fix_fourierOp.
For a native column-level element k, g=d0^-1 k d0 at S is mirabolic
by atPlaces_conj_mem_mirabolic. Conjugating a supported mirabolic h_y
back by d0 gives a column-level element: at a place of S in piPlaces
d0=diag(1,...,1,N), and the upper off-diagonal last column is divisible
by N, while the lower off-diagonal row is multiplied by N; the
resulting last row is e_last mod N. Both h_y and its inverse meet
the same integrality test. At a place of S whose star is in piPlaces,
d0=1 and the inverse conjugate-transpose component has last row
e_last mod N, from the last-column condition on h_y^-1.
Away from S union star S all components are identity. The native
chosen-level inclusion for integral matrices supported above N
(mem_chosenLevel_of_supportedOn) pays the remaining level condition.
Thus the h_y factor fixes the original column. The reindexing proves
F preserves columns; no new spherical-vector assumption.
This uses the native split-level identification and liftGL reduction,
not a claim that an arbitrary Fourier transform preserves the level.

2. One diagonal index budget, used at every Fourier stage.
Use O=embValRing, V=Column, and M(d)=integralFormsAt V d, inside
the smooth forms (so membership includes the column condition).
For a subset b of the split places write d_b=(embedGL diagN(b))^-1.
For each coordinate a of X_0 define
    t_a=sum_(c,i) sum_tau tableauWeight(i,tau,a),
where c runs over the native standard classes and i over WeylIndex.
The actual diagonal index comparison in LiftCharacters 134-151 is
    IndexDvd(M(d0*d_b), M(d0), N^t_last).
Its coordinate certificate: use the SAME representatives c and
rational moves gamma(c) supplied by exists_mul_mem_integralAbove
for (c*d0*d_b,d_b). Trivial class stabilizers give the free form
coordinate chart. Evaluate at stdEmbFin(gamma(c))*c, taking Weyl
coordinates. The source's gauge dictionary identifies the incoming
coordinate values as O-valued at these integral-above-N frames.
Multiply these coordinates by the diagonal matrix with entries
N^(sum_tau tableauWeight(i,tau,last)). Its determinant is N^t_last,
by multiplying before taking valuations. The outgoing coordinates
are exactly the Schur action on diagonal(1,...,1,N) of the O-vector,
with any embedding factors not in b equal to 1 in the corresponding
gauge. The entries have norm <=1; Schur action preserves the integral
coordinate bound. Gauge transport to arbitrary g uses the native
rational/class/column-level decomposition of g and the integral
conjugated mirabolic condition from section 1. Thus the image lies
in M(d0). Apply IndexDvd.of_det_dvd in the chart, then map and comap
back (no finite freeness of a new p-adic lattice is assumed).
Keep the exact native frame-existence and gauge dictionary
(especially the Weyl gauge at g*d0, not g) in the foundation ledger;
this paragraph is the source's coordinate proof, not a new native
proof term for that dictionary.

3. Actual transport F M(d0) subset M(d0*d_S).
For every y in the actual Fourier sum, write r_y for its embedded
integral lift. In the conjugated representation the term
pi(u0*k_y) is translation through d0*(u0*r_y)*d0^-1.
At output gauge point d0*d_S, where d_S is the embedded u0,
the u0 shift cancels from the frame, leaving the integral lift
r_y. In the source this is the identity from weylGauge_mul and
mem_integralAbove_of_inclGL_eq at LiftCharacters 159-161, with
the input bound H.2 evaluated at g/d0 after rewriting.
The coefficient psiN(y_last) has norm 1 (P.norm_map_psi₀).
The ultrametric triangle inequality adds no term-count factor.
Retain the exact native gauge transport identity as a supplier
pending independent reconstruction of the full argument change;
do not assume all conjugates of r_y by u0 are integral.
This is the direction required in the subsequent comap, NOT
F M(d0*d_S) subset M(d0).

4. One recurrence replaces a separate index calculation per power.
Let M0=M(d0), U=M(d0*d_S) and V0=M(1). As d_piPlaces=d0^-1,
section 2 applies to V0->M0 and U->M0, with the same t=t_last.
For the induction the actual transport in section 3 is F(M0)
subset U (direction matters; this is exactly the premise
M0 <= U.comap F in the source comap at 155-161).
The reverse inclusion is not needed. This uses the native gauge
identity of section 3, retained as a source dependency.
Pull U->M0 back along F, so IndexDvd(M0,F^-1 M0,N^t).
Iterating (or pulling the last comparison back along F^j) yields
    IndexDvd(V0,(F^q)^-1 M0,N^((q+1)t))
for every q>=0, with same F and same final module. This is the
exact recurrence of 152-161. All powers are endomorphisms of
smooth forms preserving Column by section 1. No inversion of F,
no multiplication by the number of Fourier terms, no choice of a
different subspace for each twist. The determinant-composition
proof of IndexDvd.trans applies to arbitrary finite tuples.

5. Exact aggregate of the diagonal exponents.
For each coordinate a the matrix diag(1,...,2,...,1) acts in the
Weyl representation with diagonal eigenvalues 2^(sum_tau
tableauWeight(i,tau,a)). Permutation matrices conjugate these
diagonals for any a,b. Taking determinants gives equality of
the exponents, since powers of 2 are injective over Z.
Sum over classes: all t_a equal, and the native box identity
sum_a tableauWeight(i,tau,a)<=a_D gives
    k*t_last = sum_a t_a <= f*a_D*dim(Column).
The degree bound is sum_height_mul_kappa_le (ChainValuation);
the count of chart coordinates is exactly dim(Column) from
the free level equivalence. No assumption of equal weights at
different tau. The scalar guards from Magnitudes give a_D<=e*x*b,
k>=e^-2*x^5, so a_D/k<=e^3*b/x^4<=b, using the actual huge x.
For q=varrho+1=m/2 and m>=2, q+1<=m. Therefore
    e=(q+1)t_last <= m*f*b*dim(Column)
                         <=4*m*f*b*dim(Column).
The original 4mfb budget is retained. This is the exact exponent
used in exists_indexDvd_fourierOp_pow, not a new sharper budget
in the endgame.

6. Ramified domain and actual local consumer.
For each w dividing pi, z_w is translation by the native norm-one
central unit with residue order N-1. The z_w commute. Thus image
of product(1-z_w) lies in the image of each factor, by moving that
factor to the left. Every ramified column is psi-z_w psi.
The support is exactly w and star w; choose the corresponding
coordinate of S and embed the scalar unit there, conjugating if
necessary. Other residue coordinates are 1; d0 commutes with
scalars. Hence the same difference supplies membership in the
native ramified(nonInducedRep) at each coordinate. No projection
with a denominator or new twist-dependent ramification condition.

For the rank bound, fixed vectors of z_w are precisely level
K'=K join <z_w>. K is normal in K' since z_w is central; the
relative index is the least positive i with z_w^i in K, and i
is divisible by N-1 by the residue condition in exists_centralGen.
Both levels lie in the chosen level with trivial class stabilizers
(the actual supported-on-N inclusion). Free class counts and
the same coefficient rank therefore give dim ker(1-z_w)
=dim(V)/[K':K]<=dim(V)/(N-1). For any linear map T and subspace
W, dim T^-1 W=dim ker T+dim(W intersect im T). Induct over the
commuting factors, obtaining the native ramifyingOp rank-loss
bound for every W, and use the triangle inequality on each
conjugate squared norm: ||psi-z_w psi||^2<=4 B for B-short psi.
The integral property survives subtraction and compact translation.
The product multiplies B by at most 4^#piPlaces=4^f. Thus the
existing short spanning set maps onto the ramified column range
with the native original budget, subject to the already required
short-basis span theorem. No assumption of an idempotent projection.

At p=N, LocalStatement.exists_indexDvd_Bmu_divisible uses exactly
S_N=(F^q)^-1 M0 pulled back to integral columns, index N^e as above,
with e<=4mfb dim(Column). For every twist and its good datum,
and every ramified phi in that SAME S_N, TwistedHeckeType
chain₂_pairTranslates_eq_smul_chain yields scalar norm <=N^(2mfb),
and m single raised gauges each <=N^(fb) give total <=N^(3mfb).
The same S_N works independently of twist/datum because F and d0
depend only on D and the chosen N-adic embedding. Use the native
integer threshold beta and allowedLoss (4mfb ceiling); no new
integer slack needed. The paired chain identity, individual
datum raise bounds, actual integral-frame/gauge dictionaries
and archimedean restriction remain source dependencies, not
discharged by the scalar recurrence. This closes the explicit
index bookkeeping and rank argument in the human A branch.

Evidence: V8 exact regression, 14304 2x2 residue reindexing cases
over p=2,3,5,7,11, 5 negative controls (non-mirabolic A changes
last coordinate), 49952 scalar budget cases with m even >=2.
Reproduce: for p, a=1..p-1,b,x=0..p-1,z=1..p-1,
A=[[a,b],[0,1]], K(x,z)=[[z^-1(1+x^2),x],[x,z]], test the last
column of K(ax+bz,z)^-1 A K(x,z) is (0,1).
For k=1..10,a=0..40,b=1..20,m=2,4,..16 with a<=kb test
(m/2+1)*a<=4*m*k*b. These are regression checks only.
Local command -v lean/lake returned no executable. Actual
RUN29 status a56e2d3a and output 088cd2ec read (run 45803534769):
six B/C checks, standard axioms, A build timed out at 2700.11s,
all_requested_checks_ok=false. No new rh_scan/prune/reduce/auto
execution, no replacement certificate PASS.
Static chain retained:
native integral frame + diagonal chart + F transport ->
exists_indexDvd_fourierOp_pow; central difference -> ramified bridge;
paired chain + raises -> gaugeLe_Bmu_at_N;
all three -> exists_indexDvd_Bmu_divisible -> short_forms -> star.
Original/reduced graphs and axiom evidence unchanged. No assertion
of kernel deletion or closure of the full A proof.

RESUME HERE: independently check the exact gauge direction
M(d0) -> M(d0*d_S) under F against LiftCharacters 155-161,
including the argument reindexing; complete human proof of
exists_mul_mem_integralAbove and the free gauge coordinate bridge
if not already supplied. Then audit NamesAtSplitLevel's paired
Fourier lift law and its native application at N, rather than
refine the index constant. Integrate sections 1, 4-6 with editor.
HANDOFF TO theta, kernel, audit, integration.
Human reconstruction incomplete.
-/

namespace ThetaRun57

theorem level_fourier_index_budget (t a k m f b D : ℝ)
    (hk : 0 < k) (hm : 2 ≤ m) (ht : 0 ≤ t)
    (hf : 0 ≤ f) (hD : 0 ≤ D) (ha : a ≤ k*b)
    (hweight : k*t ≤ f*a*D) :
    (m/2+1)*t ≤ m*f*b*D := by
  have hmul := mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_left ha hf) hD
  have hprod : k*t ≤ k*(f*b*D) := hweight.trans (by
    calc
      f*a*D ≤ f*(k*b)*D := hmul
      _ = k*(f*b*D) := by ring)
  have h1 : t ≤ f*b*D := (mul_le_mul_left hk).1 hprod
  calc
    (m/2+1)*t ≤ m*t := mul_le_mul_of_nonneg_right (by linarith) ht
    _ ≤ m*(f*b*D) := mul_le_mul_of_nonneg_left h1 (by linarith)
    _ = m*f*b*D := by ring

theorem level_gauge_budget (m f b : ℝ) :
    2*m*f*b + m*(f*b) = 3*m*f*b := by ring

end ThetaRun57

#print axioms ThetaRun57.level_fourier_index_budget
#print axioms ThetaRun57.level_gauge_budget
#print axioms Data.fourierOp_mem_column
#print axioms Data.exists_indexDvd_fourierOp_pow
#print axioms Data.ramifyingOp_finrank_comap_and_short
#print axioms Data.gaugeLe_Bmu_at_N
#print axioms Data.exists_indexDvd_Bmu_divisible
