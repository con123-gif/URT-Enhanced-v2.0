import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
RUN58 theta lane, 26 November 2026. Source-matched human reconstruction
of the exact level-prime gauge transport and paired Fourier lift law.
Prepared group/finite-sum certificates; not compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (primitive closure
priority), manuscript 2eea9dc47d0e037627e4f4c1894f0bc86426454e.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity and
state/log excerpts. Predecessor 1300ab282dcb8cdb260d7be19916af883394f4d4.
Peer 80b36408 (marked tableau charge), 5321cfa7 (C sharp mass),
133ff5b3 (B Casimir), 6b3590ae (C definite kernel) distinct. No URT.

Pinned source bodies (relative to grh-compact/src):
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45
  93-123 level and ramification; 125-169 Fourier index.
New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7
  125-253 LiftLaw, ramified zero, Fourier and paired chain;
  mem_integralAbove_of_inclGL_eq, pairWeilFinite_name,
  detCharAt_inclGL, translateSum_eq_sum_name.
Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33
  exists_mul_mem_integralAbove, weylGauge_embFin, weylGauge_mul,
  GaugeLe, integralFormsAt.
Lib/GLn/SchurModule/WeightRepBasic.lean 7417d8c31f21090bfa515568339b768290093d02
  weylGauge, integralAbove, weylRep_entry_mem.
Lib/Adelic/Landherr/WeakApprox.lean e8816c3371564926a990319105823b644028e9e1
  weak_approximation (standard theorem with a native Cayley proof).
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  82-109 chain₂_pairTranslates_eq_smul_chain; 113-138 gaugeLe_Bmu_at_N.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  285-307 actual level-prime local divisibility caller.

1. Supply the simultaneous integral frame used at every class.
Let Kp be the subgroup integral at every place above N. For any g,d,
Kp intersect d^-1 Kp d is open in the local group at the finite set
of places above N and contains 1. The native unitary weak approximation
theorem provides a rational gamma with gamma*g in this intersection:
apply density to a neighbourhood of the local components of g^-1,
then multiply by g. Thus q=gamma*g and d*q*d^-1 both belong to Kp.
This is precisely exists_mul_mem_integralAbove, not a strong
approximation assertion with arbitrary restrictions away from N.
The native weak_approximation proof uses the Cayley map and rational
matrix approximation; we retain that standard theorem as a foundation.

Write W(g,v)=||rho(g^-1)iota(v)||_infty, with the native weight
embeddings in rho. If k in Kp, rho(k) and rho(k^-1) both have
integral entries by weylRep_entry_mem (determinant powers are units).
Each is a contraction, hence both are isometries. Consequently
W(gk,v)=W(g,v), and for rational gamma,
W(gamma*g,rho(gamma)v)=W(g,v). These two exact identities supply
the frame gauge dictionary, not a comparison of archimedean norms.

For the chart in RUN57, put d0=diagPointN(0),
d_b=embedGL(diagN(b))^-1 and choose gamma_c by the preceding theorem
applied to g=c*d0*d_b,d=d_b. Then q_c=gamma_c*c*d0*d_b and
d_b*q_c*d_b^-1 belong to Kp. At the frame gamma_c*c*d0*d_b,
integralFormsAt forces all coordinates of phi(gamma_c*c) to be
integral. At arbitrary g=delta*c*k (k in columnLevel), equivariance
removes delta and introduces gamma_c; level invariance removes k
from the value, but NOT from the gauge frame. The remaining frame is
 gamma_c*c*k*d0
 = d_b^-1 [(d_b*q_c*d_b^-1)*(d0^-1*k*d0)].
Both factors in brackets belong to Kp: the latter by the actual
atPlaces_conj_mem_mirabolic and mem_integralAbove_of_inclGL_eq.
Hence its gauge is exactly W(d_b^-1,phi(gamma_c*c)). In the
untwisted column weight e=0 this gauge applies the Schur diagonal
of d_b (N^-1 at the selected embeddings) to the coordinate vector.
If each coordinate has been multiplied by N^(sum_tau tableauWeight
(i,tau,last)), this cancels the negative diagonal exponent at the
selected embeddings; the remaining exponents are nonnegative.
This proves the sufficiency of the diagonal coordinate image used
in LiftCharacters 134-151, including the arbitrary g extension.
The determinant N^t and IndexDvd map/comap from RUN57 therefore
use the actual frame, not an extra assumption of global integrality.
Retain free-level chart, Schur diagonal character and index theorem.

2. Exact Fourier gauge transport M(d0) -> M(d0*u).
Let u=embedGL(diagNInv), r_y=embedGL(inclGL(liftGL k_y)).
The native Fourier term acts on phi by right translation by
a_y=d0*u*r_y*d0^-1, with coefficient of N-adic norm one.
Since r_y in Kp by the split-level integral embedding,
   g*a_y*d0 = (g*d0*u)*r_y.
The right-hand frame has the same gauge as g*d0*u.
Thus W(g*d0*u, phi(g*a_y))=W((g*a_y)*d0,phi(g*a_y))<=1
for every phi in M(d0) and every g. Summing with the ultrametric
inequality yields the desired bound with NO summand count.
Together with fourierOp_mem_column (RUN57), this proves exactly
F(M(d0)) subset M(d0*u), not the reverse. It supplies the missing
transport premise of the actual IndexDvd.comap in lines 155-161.
No claim that u*r_y*u^-1 is integral (generally false).

3. Ramification kills the singular residue strata.
Let R=product_(w in P) F_N, e the last basis vector. A LiftLaw L
between representations pi,pi' has the two actual axioms
 pi'(b)L[f(b T a)]pi(a)=L[f],
 pi'(u)L[E_e]=gamma L[B_e]pi(u).
Here a,b are integral invertibles; f denotes its zero-extended
residue function, B_y(T)=1_{T e=y}, E_y(T)=1_{e^T T=y^T},
C_y(T)=psi(e^T T y). The shapes are rectangular as in the source.
The indicator zero extension is part of every datum.
For the second identity, E_e(u_out^-1 T u_in)=B_e(T) follows
blockwise: write T=[[A,b],[c,d]]; conjugation gives
[[A,b/N],[Nc,d]]. Integral and last row=(0,1) mod N are exactly
A,b,c,d integral, b=0 mod N,d=1 mod N. No condition on c mod N.

For any ramified phi, each place w has a central unit x equal
to 1 modulo N at all other places and phi=(1-pi(x))psi_w.
For f invariant under residue multiplication by that scalar,
the integral equivariance with a=x,b=1 gives L[f]pi(x)=L[f],
so L[f]phi=0. In particular B_y kills phi whenever y_w=0
at some w. Likewise the indicator of bottom-right coordinate t
kills phi when t_w=0. Therefore both row and column expansions
of C_e on phi may omit every t with nonunit bottom-right entry.
No division by the order of a residue stabilizer is involved.

4. A single finite Fourier identity, both directions.
For y with unit last coordinate choose k_y having last row and
column y, as in RUN57. All matrices are lifted integrally.
Integral equivariance gives
 L[B_y] = pi'(k_y)L[B_e],
 L[E_y] = L[E_e]pi(k_y).
The first identity uses f=B_y, a=1,b=k_y; the second uses
f=E_y,a=k_y,b=1. In each case the inverse equivalence of the
indicator conditions uses invertibility of k_y.
Expanding C_e first by last columns and then by last rows gives
  pi'(u)L[C_e]phi
   = pi'(u) sum_y psi(y_last) pi'(k_y)L[B_e]phi
   = F' L[B_e]phi,
and
  pi'(u)L[C_e]phi
   = pi'(u)L[E_e] sum_y psi(y_last) pi(k_y)phi
   = gamma L[B_e]F phi.
The sums in both formulas are over unit last coordinate; terms
excluded by ramification vanish before taking norms. This is the
entire algebra of LiftLaw.u₀_charDatum_eq_fourierOp. It does not
require gamma nonzero, since no division is used.

5. Collapse each pair to one orbit and transport all Fourier factors.
Write B_j=L_j[B_e], C_j=L_j[C_e]. If y is primitive at every w
(i.e. y_w is a nonzero vector), choose an integral lift k with
k e=y componentwise; transitivity of GL on nonzero vectors
follows by extending y_w to a basis over each residue field.
Then B_{j,y}=pi_{j+1}(k)B_j and
C_y(T)=C_e(T k). The next lift law with a=k,b=1 shows exactly
 L_{j+1}[C_y] L_j[B_y] phi = C_{j+1} B_j phi.
The other y give zero by section 3. The orbit cardinality is
 o_i=product_w(N^dim(X(2i+1)⊕Unit)-1).
In particular each factor is an N-adic unit; for the original
estimate it suffices that its norm is <=1.
For a central scalar x, apply equivariance with a=x,b=x^-1:
B_j pi_j(x)=pi_{j+1}(x) B_j, since x^-1 T x=T.
Also F_j commutes with pi_j(x) since x central. All the intermediate
B chains and Fourier powers thus preserve the native ramified
condition with the SAME local witness x, so section 4 can be
repeated at every stage.
Define H_j=B_(j-1)...B_0, H_0=id. Induction gives
 F_j H_j F_0^q phi = (prod_(l<j) gamma_l) H_j F_0^(q+1) phi.
At pair i, the native weighted sum d_i pi_(2i+2)(u)
sum_y L_(2i+1)[C_y]L_(2i)[B_y] applied to a previous
H_(2i) chain equals d_i o_i F_(2i+2)H_(2i+2) of its input
before the B-prefix. Apply the displayed identity and induct on
the number p of pairs. The scalar is exactly
 prod_(i<p) (d_i o_i prod_(l<2i+2) gamma_l)
multiplying H_(2p) F_0^p phi. This reconstructs
compUpTo_pairs_eq_smul, including the zero-scalar and p=0 cases.
No new ramification hypothesis at an intermediate lift, no
multiplicity of Fourier expansions beyond the native o_i.

6. Actual A consumer and surviving dependencies.
TwistedHeckeType.chain₂_pairTranslates_eq_smul_chain uses the
above abstract laws on L_j equal to the native lift of the named
finite datum conjugated by diagPointN(j),diagPointN(j+1).
Integral equivariance follows from lift_equivariant,
pairWeilFinite_name, liftIntegralFn_mul and detCharAt_inclGL:
integral determinants are local units and the native splitting
characters are unramified at N. The diagonal law uses the exact
indicator identity in section 3 and the character scalar in
pairWeilFinite_name. Retain the original scalar bound
||iota(t)||<=N^(2mfb) from norm_detCharAt_diagN_le; no alternative
estimate required. The actual paired datum conversion still uses
translateSum_eq_sum_name, whose support/phase proof remains to
be independently reconstructed (do not infer it from LiftLaw).
Then H.gaugeLe_chain and name_lastColDatum_mem_raises give
N^(mfb) on the SAME preimage column from section 2; combine to
N^(3mfb) and restrictToY_of_diag. At p=N, LocalStatement
exists_indexDvd_Bmu_divisible uses the preimage index from RUN57,
and integer beta < -allowedLoss+1; no re-selection of the
column as a function of the twist. This supplies the human
frame and abstract pair-law arguments, not a full proof of
the remaining concrete datum conversion or A.

Evidence: exact local Python fraction regression for p=2,3,5,7,
all 2x2 matrices with entries in the list [i/p for -p<=i<=p]
plus 1/p²,p,1/(p+1) (multiplicities retained). Test integrality
by denominator prime-to-p and residue by numerator times
denominator inverse mod p. Compared the two indicator conditions
in section 3 on 157488 cases; all equal. Four negative controls
reverse the two off-diagonal scalings at [[0,p],[1,1]], causing
nonintegrality. This finite regression is not a proof of the
general block identity, whose proof is given above.
Local lean/lake absent. Native CI run 45803534769, state blobs
a56e2d3afb99ed8275e81fd63c8494306e57c43f and
088cd2ec0e935ee1a282f10096949bcf671cc804, inspected again:
six named B/C axiom checks successful (three standard axioms),
A module build timed out after 2700.11 seconds, overall false.
No new native rh_scan/prune/reduce/auto execution; certificates
below are PREPARED, not a native PASS. Static caller chain:
weak approximation + gauge invariance + split integral embedding
 -> Fourier index; LiftLaw + ramified -> Fourier pair identity;
pair law + named datum conversion + native raises -> level gauge;
index + gauge -> exists_indexDvd_Bmu_divisible -> short_forms
 -> star. Original/reduced graphs and axiom evidence retained;
no global dependency deletion or full proof closure claimed.

RESUME HERE: reconstruct the concrete translateSum_eq_sum_name
support-and-phase equality at conjugate split places, including
the semichar cancellation and residue sign, then
name_lastColDatum_mem_raises and GaugeLe.restrictToY_of_diag
at their exact caller. Audit actual coefficient normalizations.
Integrate sections 1-5 directly into A, not as another architecture.
HANDOFF TO theta, editor, integration, formal audit, kernel.
-/

namespace ThetaRun58

theorem fourier_frame_cancel {G : Type*} [Group G] (g d u r : G) :
    (g * (d * u * r * d⁻¹)) * d = (g * d * u) * r := by group

theorem chart_frame_cancel {G : Type*} [Group G] (q d k : G) :
    q * d⁻¹ * k = d⁻¹ * (d * q * d⁻¹ * k) := by group

theorem finite_orbit_sum {Y V : Type*} [Fintype Y] [AddCommMonoid V]
    (s : Finset Y) (f : Y → V) (v : V)
    (h : ∀ y ∈ s, f y = v) :
    (∑ y ∈ s, f y) = s.card • v := by
  classical
  rw [Finset.sum_congr rfl h, Finset.sum_const]

end ThetaRun58

#print axioms ThetaRun58.fourier_frame_cancel
#print axioms ThetaRun58.chart_frame_cancel
#print axioms ThetaRun58.finite_orbit_sum
#print axioms exists_mul_mem_integralAbove
#print axioms weylGauge_mul
#print axioms IsSplitLevel.LiftLaw.u₀_charDatum_eq_fourierOp
#print axioms IsSplitLevel.compUpTo_pairs_eq_smul
#print axioms Data.exists_indexDvd_fourierOp_pow
#print axioms Data.chain₂_pairTranslates_eq_smul_chain
#print axioms Data.gaugeLe_Bmu_at_N
#print axioms Data.exists_indexDvd_Bmu_divisible
