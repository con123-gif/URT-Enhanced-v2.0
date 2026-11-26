import New.RealPlace.OpenCellBound
import New.Filling.BlockBound
import Mathlib.Tactic

/-!
RUN56 — 26 November 2026. Independent human audit and shorter source-matched
support proof, prepared Lean scalar probes (NOT compiled). Attribution:
Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
957e9d109bd96476c701a00e872e7a0e0f853aa1; lead WIP
55e2b18c0c181083467fdabfb83c834ed73d9383 and lead open-cell note
6b9354c5ffcc4b80b18b1dfdfb2d7c117bcf437d read before selecting this
independent audit. RUN55 7ce0b84e37e0834066d4cda0e73bf9790d2c6044.
Latest C/arithmetic peers 77a7f2fc,129d788f,248ac90f,67ab9478,7cc78b2f
are distinct. Do not repeat the lead's larger-tube construction.

Pinned actual source blobs retrieved:
New/RealPlace/OpenCellBound.lean 054e3375d3ef6c96633ab3c2e44b38df52a94755
New/RealPlace/FrameNorm.lean 06a65cfd754f2688b899d08320f627fdea415db0
New/RealPlace/GramSectionBounds.lean 5044a4a899b36f1f42d538968eeb0c733c181a2d
New/RealPlace/CellNeighbourhood.lean 6930631979c8d744667e5e3f832e35cf8477e8c6
New/Filling/StableCells.lean 236a41919b3697e1e30c4be840140f6452642599
New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727
New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce
New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18
New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea
New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd
New/Filling/FillingAdmissible.lean b52e37db6879e90b3592d2bc5d2a78140c79c86d
Lib/Adelic/Adeles/RationalPoints.lean aebdd974ccdf94b1d9b9ea4ead153261ee1717cd
Readable companion grh/src/New/Spanning/Bessel/OpenCellBound.lean
83e8a6ca952265cb8689a735e7c9ff9347f7f0fd gives the expanded column
calculation; below it is mapped to the actual compact section definitions.
No import of Main or RH.

1. Native smaller tube: exact cancellation in the actual final proof block.
Let n=h+1, h=varrho, F=frameCols, F'=dualFrameCols, e*_a the a<h
column of F', Z=realFrameGram gamma, g0=gramDiscReal Z>0.
Use M=rho^(9n)/g0, R=M^(9n), T=R^5, P=T^n as in the compact
source and RUN55. Thus M>=rho>=B>=8r, R>=M, g0>=1/M.
The local neighborhood theorem applied at its center supplies
||Z^-1||<=R. Keep its exact premises. The source chooses the
tube A,Omega for T, NOT an unrelated tube for a larger radius.

For the actual double coset decomposition gamma=s gamma_Z (v h0)^-1,
s in U0 H, fix the same pair (a,u) of the probability law and define
t=(v h0)a^-1 u^-1. Write z=(u a)^-1 y. The compact H factor is
embedded in G and acts isometrically. The frame of z equals that
of y; besselSize(gamma_Z z)=besselSize(gamma t y) by left Bessel
invariance. Suppose y in frameBox rho and the latter size <=rho.
Choose w in U with ||w gamma_Z z||<=rho by FrameNorm.
Put L=(w gamma_Z z)^-1, V=z^-1, N=(gamma_Z z)^-1,
Z'=realFrameGram(w gamma_Z), C=frameMatrix(w).
Then Z=C* Z', det C=1; both moved frames V F and L F have each
column length <=M. Their pairings give |Z'_ij|<=M^2.
The native discriminant invariance gives gramDiscReal Z'=g0.
Apply the SAME neighborhood bound to Z' at its center:
||Z'^-1||<=R. No bound on ||w|| is assumed.

Exact cancellation before taking norms:
    N F (Z*)^-1 = L w F (Z*)^-1
                 = L F C (Z*)^-1 = L F (Z'*)^-1.       (S1)
Here Z*=conjugate transpose; C invertible by unitriangularity.
Use N gamma_Z=V and the actual compact sectionMatrix formula:
 V = N + (VF-NF)F* +
     [(NF (Z*)^-1 - VF sectionCoeff(Z*,Z)) diagLast(sqrt(delta)^-1)
       - NF']F'* .
The a<h dual column selects F' column a, and kills the term
ending in F*. Its diagonal factor is one, NOT delta^-1/2.
The N e*_a terms cancel exactly. In sectionCoeff(Z*,Z)
the last row is zero at column a; the other entries are
-(Z^-1)_(i,h) ((Z*)^-1)_(h,a)/2. Thus
 V e*_a = sum_(i<n) ((Z'*)^-1)_(i,a) L f_i
        + sum_(i<h) (Z^-1)_(i,h) ((Z*)^-1)_(h,a) V f_i /2. (S2)
This is the compact last-block cancellation (this,K), also
expanded in the same-pin readable companion. No arbitrary norm
bound on gamma_Z^-1 or its inverse-section B0 block is needed.

Since M<=R, n<=R/8 and R>=1, the norm in (S2) is <=
 R^2 [n+(n-1)R/2] <= R^4.
All original frame columns also have norm <=R^4.
For clarity, the elementary norm estimate in FrameNorm follows
from the negative projection Q of the signature matrix J=I-2Q:
for V preserving J, VV*=J+2VQV*, hence
 ||V||^2 <=1+2||VQ||_HS^2 <=1+(4n-2)R^8.
The negative orthonormal vectors are (e_i-e*_i)/sqrt(2)
and the final negative frame vector. Each squared image norm
is at most 2R^8, respectively R^8. Therefore ||V||+1<=8n R^4.
Since ||z||=||z^-1|| and 8n<=R, ||z||<=R^5.
Finally ||u^-1 y||=||a z||=||z||<=T, so y lies in A by
the native tube property, FOR EVERY (a,u) with u in Omega.
This is the required common-shift support, not an assertion
about separate marginal laws.

This recovers the smaller native tube and hence permits the
ORIGINAL P^(2000n^2) Sobolev inequality at P=T^n. Combined
with RUN55's mass computation, the local exponent remains
93600n^4+45n+2n^2 <=100000n^4. Thus the lead's enlarged tube
T=R^18 and sharper P^(500n^2) inequality are not necessary
premises of this human path. The tube existence, Haar and Schur
bounds themselves are retained; no global native dependency is
removed merely by this human replacement.

2. Independent audit of the packet comparison at SchurTest.
Set H=100000n^4, X=termDiscNorm>=1, f=#infinite places,
d=card BesselCoord>0, D=mainEnergy, Deg=besselDegree,
nu=unipCovolume, rho=boxSize=b^(2n^2), tau^4=b^(kf).
Let l_(v,i)=frameScaleSq(v,i)=kappa_v^(2(h-i))/N,
L0=product l_(v,i), F0=frameScaleProd=product l_(v,i)^(k+2(h-i)).
Let C0=countWeight(0)=|Sbar|#Classes/N^(kf), a=classSize(top,X).
All positive divisions are legal: Classes derives Nonempty,
BesselCoord has NeZero cardinal in the actual caller, formal
degree, mass, c_G, nu, N and all l are positive. X>=1 comes
from the algebraic integer norm in BlockBound, not from arbitrary
near real matrices.

The actual normalization NearTerms gives product g_v=L0^2 X.
Before bounding any powers, divide the product of native cellMass
by (nu*a/2)^2, obtaining exactly
  4 rho^(9nHf) 2^((k-1)f) L0^(-2(H+k-1)) X^(2-H)
       * [d^2 C0 g^(2hkf)/(Deg c_G^f nu^2 tau^4 D)].
Apply the standing packetConst inequality to the bracket.
The factors C0/packetConst cancel the finite group order and
class count; the remaining g exponent is -f*h*(2h+1).
The N^(-kf) in siegelConst cancels C0's level factor.
The result is <=
  4(1+b^-9) rho^(9nHf) 2^((k-1)f) F0^2/L0^(2(H+k-1))
   / [tau^4 g^(f*h*(2h+1)) (pi^k/(k-1)!)^f
      |disc E|^(1/4) volO^(k+n)].                       (P1)
Here X^(2-H)<=1 exactly because X>=1. This independently
confirms the lead's O11 and matches actual SchurTest definitions.
For each v the exponent of l_(v,i) is 4(h-i)-2H+2<0.
Since |kappa_v|>=1, l>=1/N; summing these exponents exactly gives
 F0^2/L0^(2(H+k-1)) <= N^(2nf(H-n)).
No upper bound for kappa is needed in this route.
Use N<=b^(60n), g>=1, b>=1000, (200fk rd)^1000<=b,
rd>=1 (nonzero integer discriminant), volO=(rd/2)^(-f).
Then factorial<=k^k<=b^(k/1000), pi>=1,
|disc E|^(1/4) volO^(k+n)=2^(f(k+n)) rd^(-f(k+n-1/2))
 >=b^(-f(k+n)/1000).
Also 2<=b^(1/8) actually needs b>=256, supplied by b>=1000.
And 4(1+b^-9)<=b. Thus (P1)<=1 follows from the exact
sufficient exponent guard
  4k >=5*(n+1+18n^3 H+120n^2 H),
with k>=1000(2n)^9=512000n^9, n>=100001.
This is the same sufficient condition as lead O12, independently
audited. We do not claim the packet premise itself proved.

For the lower cutoff floor use the ACTUAL sharper compact
IsNear.norm_map_leadingMinor_le instead of a new Hadamard
estimate. Positivity of the termDisc at each place and its
definition give |Phi_v(termDisc)| <= |Phi_v(D_n)|^2
<= b^(11n^3). Hence X<=b^(11n^3 f). The native
D>=tau^44 besselEnergy and besselEnergy=|Sbar|#Classes d
give a^2>=1/(g^(2hkf) X^(k+1)); discard only positive
factors >=1. Since g<=b^23 it suffices that
  46(n-1)k+11n^3(k+1) <=2k^3.
This proves the original a>=b^(-k^3 f). The actual compact
minor bound removes the need for the lead's separate raw-scale
Hadamard estimate, but retains its native source dependencies.

3. Caller and remaining primitive ledger.
The audited local support S1-S2 uses the SAME t, A, and law as
RUN55, so tensor contraction and cut restriction in BlockBound
apply. The actual full-minus-cut bound and positivity of all
normalizations remain required. The lead section 6 argument
takes a joint random point outside the null support set, then
uses the tail half-budget and the global cutoff floor. No
independent marginal choices or changing the witness.
Original SOURCE graph retained: FrameNorm + GramSectionBounds +
StableCells + CellNeighbourhood + RealMeasures + SobolevCell ->
OpenCellBound -> SchurTest/BlockBound -> Moments -> enough_forms
-> star_inequality. Reduced HUMAN graph replaces the enlarged
tube/stronger Sobolev path by (S1,S2) -> native T=R^5 and the
original Schur trace bound; packet arithmetic (P1) retains the
exact same normalization, class family and comparison theorem.
No kernel graph modification and no root-level theorem import.

Remaining B primitives: actual BesselSystem derivative, band
and peak suppliers (same W, no independent peak normalization),
and FillingAdmissible's packet bound: exact class count, degree,
mass ratio, local level and global scale guards. The source
FillingAdmissible instance explicitly calls
abs_log_mass_ratio_sub_le, log_filling_besselDegree_mem_Icc,
card_besselCoord_mul_factorial_le and the exact class/level
indices. Those are not consequences of the audited cancellation.
Do not repeat the completed classSize arithmetic next run.

Actual execution: SymPy expanded the first guard margin after
k=512000n^9+t, n=u+100001: 11 strictly positive coefficients,
minimum 4; second guard margin: 58 strictly positive coefficients,
minimum 2. Exact symbolic summation verified
sum_(i=0..n-1) (2(H+k-1)-2(k+2i)) =2n(H-n).
These are scalar polynomial checks, NOT formal verification of
the analytic proof. Native Lean/Lake absent in container.
Read actual state JSON for runs 45577239749 and 45576756833:
both status pass/returncode 0 and expected standard axiom ledger;
old pin only, not a compact check. Native engines not ported or
executed here. All old graphs and axioms retained. New #checks
and scalar proofs below are PREPARED ONLY.

RESUME HERE: take the actual FillingAdmissible packet/mass
primitive at the exact instance caller; map the degree and
mass-ratio inequalities before logs, coordinating with lead
and latest Bessel peak/graph work. Avoid redoing already
audited support and classSize arithmetic. HANDOFF TO
integration/editor/audit and shared compact native replay lane.
-/

namespace RHPositivityCompactSupport

theorem dual_count (n R : ℝ) (hn : 1 ≤ n) (hR : 8*n ≤ R) :
    n + (n-1)*R/2 ≤ R^2 := by
  have hpos : 0 ≤ R := by linarith
  have hmul := mul_le_mul_of_nonneg_right hR hpos
  nlinarith

theorem frame_exponent_term (H k j : ℤ) :
    2*(H+k-1)-2*(k+2*j) = 2*H-2-4*j := by ring

theorem scalar_guard (n k : ℕ) (hn : 100001 ≤ n)
    (hk : 512000*n^9 ≤ k) :
    5*(n+1+18*n^3*(100000*n^4)+120*n^2*(100000*n^4)) ≤ 4*k := by
  have h2 : 100 ≤ n^2 := by nlinarith
  have h3 : 1000 ≤ n^3 := by nlinarith
  have h7 : 100*n^7 ≤ n^9 := by
    calc
      _ ≤ n^2*n^7 := Nat.mul_le_mul_right _ h2
      _ = _ := by ring
  have h6 : 1000*n^6 ≤ n^9 := by
    calc
      _ ≤ n^3*n^6 := Nat.mul_le_mul_right _ h3
      _ = _ := by ring
  have h1 : n ≤ n^9 := Nat.le_self_pow (by decide) n
  have h0 : 1 ≤ n^9 := by positivity
  have E : 5*(n+1+18*n^3*(100000*n^4)+120*n^2*(100000*n^4)) =
      5*n+5+9000000*n^7+60000000*n^6 := by ring
  rw [E]
  omega

#print axioms dual_count
#print axioms frame_exponent_term
#print axioms scalar_guard
#check norm_le_of_mem_frameBox
#check realFrameGram_eq_frameMatrix_mul
#check mem_openCell_and_bounds_of_near
#check BesselSystem.open_cell
#check Filling.IsNear.norm_map_leadingMinor_le
#check Filling.IsNear.le_classSize_and_cellMass_le
#check Filling.enorm_amplitudeSum_le_classSize_top
#print axioms BesselSystem.open_cell
#print axioms Filling.IsNear.le_classSize_and_cellMass_le

end RHPositivityCompactSupport
