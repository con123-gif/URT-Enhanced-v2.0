# RUN97 — Quotient determinant and uniform Schur kernel (B2)
28 November 2026. PARTIAL / independent human source audit, no fresh native replay.
Resume RUN96 (05b38eb6396d46827a70149f61542e854138fa23), not a new root.
Read current ONE_EQUATION_MISSION (3adc76221a978016e3505cdf3e36ad688354d7d7),
LIVE_PROOF_SPINE (1c4608f2190154fd4bc4b38fc77db10ec5e60e64),
LIVE_OBLIGATIONS (579ecc1cafdb28eae7d1c97565700c571dfa7484),
HUMAN_PROOF_COMPACT (619ae01be98c32e053eef1c8bcd44ccddd0664e7, relevant
matches), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS,
continuity and physical protocol/state excerpts; binding amendment
99cfbd1f04c3a4c6d02c21a8fde207f2121aef20 read from commit diff.
Latest peer commits through d3fcfc010bcd106bacbfdaa6a79909a849180ad4
inspected for overlap. Physical CI summary run 46100401061 not RH evidence.
Existing integration/2026-11-26_COMPACT_THIN_CLASS_VOLUME_KERNEL.md
(blob 06f07be1986616e2068cfa1bdb5641e075da450b), V1–V7, is the
preferred existing proof of this interface; audit it rather than add
a second manuscript. The 27-Nov restricted-volume alternative is
a distinct C candidate, not this kernel.

## Exact native anchors and assumptions
Alpöge–Sernau and collaborators, lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- New/RealPlace/VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0,
  frameVolume 129–144, exists_kernel_frameVolume_le 160–235.
- Lib/Adelic/Witt/FrameAction.lean cd3f13d59a5f2351c2fa22267765c723bd3b6001,
  frameMatrix_unitriangular 159–160.
- New/RealPlace/FrameNorm.lean 06a65cfd754f2688b899d08320f627fdea415db0,
  frameVector_eq_sum 19–23, exists_norm_le_of_besselSize_le 38–42.
- Lib/General/Analysis/OstrowskiTaussky.lean 9f49846bb185855398ab25b33211b61a680aed77,
  ostrowski_taussky 95–106.
- Lib/General/LinearAlgebra/HuaIntegral.lean d62ceebe4b3b49aae6bc6eb3d247280abbbd8a37,
  hua_integral_le 192–206.
- New/Filling/ThinClasses.lean 6ae40a38e407331b9954067c833c34a62277b2e5,
  actual restricted-column caller 54–77, 100–107; retain subsequent counting.
Keep actual shape (n=rho+1), complex unitary y,gamma, besselSize(y)<=theta,
j<=n, leading embedding i, invertible j-by-j z=Z[i,i], selected
embedding e:sigma->Fin j, invertible R, fixed V, same Z and normal
form j for every gamma, and affine frameX0Part premise at 170.
All dimensions including j=0 and sigma empty are allowed.

## 1. Exact quotient determinant (short delta to V4)
Use the existing V4 notation, with E_i and E_e the coordinate
inclusion matrices (to distinguish them from index maps).
F=frameCols, J=J1, U=(1-J)F, Delta(y)=|det(U* y^-1 F)|,
B=(U* y^-1 F)^-1 U* y^-1, so BF=I_n. Invertibility follows
from native frameVolume_pos; keep its nonpositive frame / negative
projection argument. Put
    p=Z[:,i] z^-1,       P=p*,       P E_i=I_j,
    t=gamma F E_i z^-1, F*J t=p,
    T=theta frameMatrix(omega)[i,i], C=T P B,
    H=B gamma F, M=B t z-E_i, L=I_n+M P.
The same omega in besselU satisfies ||omega y||<=theta; theta>0
and T is invertible with det T=theta^j.

Native 196–204 supplies columns x_b,y_b with H y_b=L x_b,
y_b[b]=1, |x_b[b]|=1 and both zero on indices a>b. For b<j use
x_b=y_b=e_b: L E_i=B t z=H E_i. For b>=j use the actual normal
form shared-frame relation gamma F y_b=F x_b. Multiplying by
B+M t*J gives the desired equation: t*J gamma F=0 since a tail
index exists only when j<n (so F E_i consists of isotropic
columns perpendicular to the entire frame), and t*J F=P.
No such vanishing is asserted in full level j=n.
Let X,Y have these columns. They are upper triangular,
det Y=1 and det X=prod_b x_b[b]=:epsilon, |epsilon|=1.
Therefore H Y=L X gives the exact complex identity
    det H=epsilon det L.                              (97.1)
The native argument then applies Sylvester's identity. A shorter
structural explanation of that cancellation is to use the split
space C^n=im E_i (+) ker P (not necessarily orthogonal).
L fixes ker P pointwise, and on the quotient identified by P,
    P L=(I_j+P M)P=(P B t z)P.
Consequently its determinant is the quotient determinant
    det L=det(P B t z),                               (97.2)
with no invertibility assumption on M or L or the quotient
matrix required in this step. Combining and preserving phase,
    det(B gamma F)=epsilon det(z) det(C t T*)/theta^(2j).
                                                         (97.3)
This is a source-matched strengthening of the presentation
of V4, not a new bound needed by the caller. Both approaches
(Sylvester and split quotient) have the SAME assumptions; the
quotient form explains the discarded n-j dimensions exactly.
When j=0 the quotient determinant is the empty determinant 1;
when j=n its complement is zero. It follows from (97.3) that
    Delta(y)/Delta(gamma^-1 y)
      = theta^(2j)/(|det z| |det(C t T*)|).             (97.4)
The denominator is nonzero by frameVolume_pos for gamma^-1 y.
Neither det X=1 nor Hermitian positive B gamma F is needed.

## 2. Independent sign and uniformity audit of V5–V7
Let A range over k-by-|sigma| complex matrices. Use the SAME
fixed B,T,C and define
    Y0=J t T*-C*, W=definiteCols* Y0,
    D=C y, Q=theta^-1 (omega y)^-1 F E_i,
    Theta=-C t T*, r0=zCol* F E_i z^-1 T*.
The frame-vector sum 19–23, restricted using upper triangularity,
gives y^-1 F E_i=Q T. Hence D Q=C F E_i T^-1=I_j,
since CF=T P and P E_i=I. The native operator norm condition,
unitary inverse norm identity and coordinate inclusion norm give
||Q||<=1. Thus DD*>=D QQ* D*=I.
The rows of B y lie in the negative eigenspace of J because
B y=(U* y^-1 F)^-1 U*, J U=-U; unitary covariance y J y*=J
gives DD*=-C J C*. Also F*Y0=0 since CF=T P. In the actual
split J geometry the orthogonal complement of the Euclidean
frame span consists of the other isotropic-dual rows and the
definite X0 rows, so Y0* J Y0=W*W, not a positivity assertion
for an arbitrary indefinite ambient space.
Since (F E_i)* J F E_i has only the possible negative top
diagonal entry, T t* J t T*=-r0*r0. Direct expansion now yields
    Theta+Theta*-(I_j+W*W)=DD*-I_j+r0*r0 >=0.           (97.5)
This confirms the exact plus sign on the top correction in V5.
Ostrowski–Taussky applies to I_j+W*W, which is positive definite.
With (97.4), it gives the bound (2 theta^2)^j/
(|det z| det(I_j+W*W)) on the volume ratio. Its factor 2^j
is retained, not silently replaced by one.

Put S0=R E_e* T* E_e and a=(V z^-1 T*-definiteCols* C*)E_e.
Using the affine X0 premise (and the identity action of J on X0),
    G:=W E_e=A S0+a,   |det S0|=|det R| theta^|sigma|.
A selected principal submatrix of an upper unitriangular
matrix is unitriangular in induced order (or after simultaneous
row and column permutation). Thus the determinant formula holds
even when e is not order preserving; no determinant of a
rectangular inclusion is taken.
Since E_e E_e* is an orthogonal projection,
G G*<=W W*. The positive-definite determinant monotonicity
and Sylvester's identity give
    det(I_sigma+G*G)<=det(I_j+W*W).                    (97.6)
This matches native 209–216, 234–235 and is equivalent to the
existing Cauchy–Binet proof of V6. Therefore a SINGLE kernel,
chosen before gamma and A, is
    K(A)= [(2 theta^2)^j/|det z|]^(k+n)
           det(I_sigma+(A S0+a)*(A S0+a))^(-k-n),
where the star on the first factor in the Gram product denotes
adjoint (i.e. G*G). It is continuous, nonnegative and well-defined
everywhere; no measurable selection over gamma is required.
HuaIntegral.192–206 with M=I_sigma, r=n>=|sigma|, k rows and
invertible S0 gives exactly V7:
    integral K <= [(2 theta^2)^j/|det z|]^(k+n)
             [pi^|sigma|/(|sigma|! theta^(2|sigma|)|det R|^2)]^k.
The complex Jacobian is |det S0|^2, not |det S0|; the zero
dimensional case has measure one. This audits the actual theorem
statement, retaining the native Hua and positive-matrix suppliers.

## 3. Actual restricted-column caller and negative controls
ThinClasses.54–77 fixes e=IndexBelow j -> Fin j, R_v diagonal
pi*g/(b*basisScale_v), invertible by the native scale guards,
and the common V from the representative p0 after u_v^-1.
The alignment of RUN96 supplies l with the SAME selected
leading rows; the shift L(l)_v=(b/pi) Phi_v(l) is the one used
in lines 100–107. The source uses A'=a-L(l)_v and unipotentOf
in inverse orientation; this yields the affine premise at
VolumeKernel.170, not the premise for A'=a+L(l)_v. The common
K_v depends on fixed y_v,Z_v,R_v,V_v, not on the term chosen
inside that colour. Retain the actual normal-form transport,
leading determinant nonvanishing, integrality and Haar input.
The distinct disjointness/fibre/tail argument at ThinClasses.78–123
is not certified by the present kernel audit alone.

Rejected routes:
- Replace det X by 1: diag(i,1) with i=sqrt(-1) satisfies the
  modulus-one condition but has nontrivial phase.
- Treat P as orthogonal projection: P=(1,2), E_i=(1,0)^T
  gives P E_i=1 but E_i P is not self-adjoint. Use split
  quotient only, not an orthogonal splitting there.
- Assume t*J gamma F=0 at full j=n: the z-column gives the
  retained negative top Gram term. Use no tail relation there.
- Reverse the sign of r0*r0 in (97.5): expansion gives
  -T t*J t T*=+r0*r0; dropping it before establishing positivity
  or changing sign is unjustified.
- Compress via arbitrary coordinate maps: for W=[1], E=[2],
  det(I+(WE)*(WE))=5>2; use E_e*E_e=I and orthogonal projection.
- Pick K after gamma, or use a fixed W instead of W E_e:
  W can depend on gamma in unselected columns; G is exactly
  the affine function of A, and only G belongs in the common kernel.

Verification actually performed: read pinned source bodies and
actual caller; independent hand derivation (97.1)–(97.6) and
comparison against existing V1–V7. No fresh Lean execution,
native replacement proof-term audit, rh_scan/prune/auto, or
numerical benchmark. Existing B2 fused eleven-declaration and
eight-root receipts are separate and not evidence for this new
presentation. URT structural separation isolates the quotient
and selected columns; ordinary determinant and positivity
arguments validate it. No assumed URT premise or complexity claim.
B2 human assembly and full RH remain OPEN.

RESUME HERE: independently audit ThinClasses.tsum_schurIntegral_le
78–107, the disjoint translated unit-polydisc supports and
same-lattice-shift boxed-frame fibre bound, using RUN96 and
V3–V7/97.1–97.6, including the exact shift orientation and
cutoff measure. Read existing integration V8–V9 first; retain
the subsequent scalar budget 108–123 for its actual consumer.
HANDOFF TO integration/audit: confirm V4–V7 under these native
premises; optionally replace its Sylvester explanation with
(97.1)–(97.3), no new root closure.
