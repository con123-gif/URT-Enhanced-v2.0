import Lib.DiscreteSeries.CuspKernel.SchurOrthogonality
import Lib.DiscreteSeries.Rigidity.CasimirGrowth
import New.RealPlace.BesselCut
import Mathlib.Tactic

/-!
# RUN69 — smearing, generator and Casimir word bound at actual Theorem B
27 Nov 2026. Human source-matched derivation; independent audit and native
replay pending. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude. lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first),
manuscript 52c0ccfd0dc525f446dd8bc935a7df71912c8709. AGENTS, swarm,
handoff, expansion inspected. RUN68 41c63681, integration d0a3d115,
dependency dfa8fce2 and latest peer commit list through a824788a inspected.
Actual caller New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278:
Data.exists_besselSystem invokes IsBesselFunction.hasSchurBound_of_convolve_eq
in New/RealPlace/BesselCut.lean c9e66fa71ab3aff125e672b9fc93caac9f03fa5d.
The latter needs all words up to 2(shape.n)^2, not just a first derivative.
Here complete the smearing and growth suppliers retained in RUN68.

## 1. Fixed-splitting highest vector and exact Casimir
SchurOrthogonality.lean 7be5411c2c4c3662db6f10be4c7fda7f63c27287:
isKHighest_dsGenerator. CasimirOnPsi.lean cab16656f94119a04d3e39249c16b3ef17f5316c:
casimir_dsCoeffSmooth. RepresentationDefs.lean 94fea15fbc65ed74c2a44e83dda2cd423d39fbea,
PsiBasic.lean d888fafb9db9b1a5e78aa2551a1480f0cf057d20.
Let N=card n>=1, l=2lambda, r=twoRho(l,all), w=(l+r)/2,
Lambda=w-twoRho(l,compact). Parity ensures exact integral w.
Write m_v for weightMinors. On the group psi_l(g)=psi_{-l}(g^-1)
by the polar formula (both equal conjugate psi_l(g)).
For gB near g, B in the complexified compact triangular group of
order l (lower triangular, entries l_a>l_b allowed), evaluate the
inverse formula with splitting B^-1 a, where a is the admissible
block diagonal splitting of g^-1. Its quotient is unchanged:
(B^-1 a)^-1 B^-1 g^-1=a^-1g^-1. Left lower triangular
equivariance of m_{-Lambda}, in order l, gives the multiplier
diagChar_{-Lambda}(B^-1)=diagChar_Lambda(B). This is an identity
of local holomorphic extensions: for unitary B near I splitting
independence is RUN68, then extend by the totally real compact
Lie algebra in its complexification. More explicitly the fixed
splitting expression with B^-1 a has the same rational denominator
and holomorphic numerator; on the compact group equality follows
from the same accretive split, hence equality of germs in that block.
Differentiate B=I+tE_ab for same-sign l_a>l_b, and diagonal B.
Thus E_ab psi=0 for compact raising operators, E_aa psi=Lambda_a psi.
No global discrete-series existence assumption.

For full Casimir, fix a=blockDiagPart g. Near g the splitting a
remains admissible, and RUN68 permits a fixed-splitting integral
with integrand a constant numerator (in g) divided by
m_{-w}(k^-1 a^-1 g k). For fixed k, use right operators conjugated
by k; the function is right triangular equivariant of weight w
for order l (upper triangular: l_a<l_b). This follows by exact
minor equivariance and reciprocal; no extension through a zero
minor. Its raising order is -l. The standard gl_N commutator
[E_ab,E_ba]=E_aa-E_bb yields, on this germ, the full Casimir
eigenvalue sum_i w_i(w_i-r_i). Conjugation preserves
Omega=sum_ab E_ab E_ba by the trace-dual basis identity; the
Casimir is therefore the same operator for every k. Compactness
and uniform nonzero denominators near g justify differentiating
twice under the integral. Now cancel algebraically:
    sum_i w_i(w_i-r_i)=sum_i (l_i^2-r_i^2)/4=c(lambda).
Consequently Omega psi=c(lambda) psi. Since Omega commutes
with all E_ab (expand commutators, relabel the cancelling sums),
it acts by the same scalar on D=U(gl_N)psi. This is the exact
eigenvalue, not a generic elliptic estimate.

## 2. Compact smearing gives decay of every word
BumpConvolution.lean b62172c4d3b2e75c7466ecfd73ed40c080ad062f,
hasDerivAt_smear, rightDeriv_smear; SchurOrthogonality
exists_smear_dsCoeffSmooth_eq, exists_decay_bound, integrable_norm_pow_smul.
Let S(beta)(g)=int beta(y^-1) psi(gy)dy=int beta(z^-1 g) psi(z)dz.
For any compactly supported smooth beta, differentiating the
second expression gives R_X S(beta)=S(R_X beta). For g in a
compact neighbourhood the relevant z lie in a fixed compact
set; psi and all required bump derivatives are bounded there.
Dominated differentiation for each real Lie direction followed
by complex linearity proves the statement for every X and word.
Same proof works for continuous Banach-valued F replacing psi.
Derivatives of the bump retain compact support.

Choose beta(y)=b(yy*)^2 psi(y), where b is a real smooth
radial bump about I, b(I)=1, and compact support in the ambient
matrix space. On G its support is compact by the bound on ||y||^2
and closedness of G. The factor b(yy*) is invariant under both
left and right K (unitary conjugation and right cancellation).
Let W(y)=beta(y^-1)=b(y^-1(y^-1)*)^2 psi(y^-1).
RUN68 lowest-K projection with x=y^-1, a=1 gives exactly
int_K conj(m_Lambda(k)) W(k^-1 y) dk=C W(y), C=||m_Lambda||_K²>0.
For integrable W, compact Fubini, left Haar substitution and
that projection give
    int W(y)psi(gy)dy=psi(g) int W(y)psi(y)dy.
Indeed insert W=C^-1 integral of its K translates, then use
the lowest-K projection on psi(g k y). The scalar on the right
is int b(y^-1(y^-1)*)² |psi(y)|² dy>0 by continuity at I.
Divide beta by that scalar. Thus S(beta)=psi and the image of
S is stable under all right derivatives: D is contained in it.
For f=S(alpha) and integer 0<=c<=gapThreshold:
    |f(g)| <= K_alpha,c (2/||g||)^c,
    K_alpha,c=int |alpha(y^-1)| ||y||^c dy < infinity.
Use ||g||<=||gy||||y^-1|| and ||y^-1||=||y||; use RUN68
pointwise decay before integrating. No pointwise differentiation
of an asymptotic bound. For exponent C<=A+1 choose
c=C+8N²+1<=500N³+A; N>=1 gives the native Haar decay
integral and weighted L1. Boundedness (c=0) also gives L2.
In particular d=(int |psi|²)^-1 exists and is positive.

## 3. Unitary derived action without irreducibility
SchurOrthogonality toL2_spec, isUnitaryCasimirGe_dsAction.
Embed D in L2(G) by i(f)=sqrt(d) f, injective by continuity
and positivity of Haar on open sets. Schur identity from the
K projection of RUN68 gives for f=S(alpha):
    <i(psi), R(g)i(f)> = f(g).
To see it, substitute the bump integral in the L2 inner
product and use d int conj(psi(z)) psi(zgy) dz=psi(gy).
Fubini is justified by compact bump support and Cauchy-Schwarz
on L2, not by an unproved pointwise integrable derivative.
Smearing with F=R(.)i(psi), a continuous L2-valued function,
gives R(g)i(f); the preceding Banach differentiation proves
the derived-action equality. Right translations are unitary
for the unimodular matrix group. Differentiating unitarity
along the real unitary Lie algebra and complexifying yields
E_ab^*=epsilon_a epsilon_b E_ba on D (use real directions
E_ab-epsilon_a epsilon_b E_ba and i(E_ab+epsilon_a epsilon_b E_ba)).
It follows from section 1 that IsUnitaryCasimirGe holds, in fact
with equality in the full Casimir form. Norm i(psi)=1 and
|f(g)|<=||i(f)|| by Cauchy-Schwarz. No assumption of irreducibility
or analytic-vector uniqueness in this branch.

## 4. Direct spectral bound for the actual finite word consumer
CasimirBound.lean f47bbb602c8e77086cbc4506f6580739716dd2b7;
HighestVectors.lean 05e2716ad17f0ae4dc6043a359ff16f22687e7cb;
CasimirGrowth.lean 46e437f11a82ea966051cc0edec3d6eaa2f9496b:
norm_apply_le_of_mem_filtration. Only the J=identity spectral
bound is needed here, not the full weighted form used in rigidity.

Let x be K-highest with integral weight nu, |nu_i|<=L0, and
M_s the native filtration. On M_0=U(k)x the compact Casimir is
the scalar C0=sum nu_i(nu_i+twoRho_c(i)); it commutes with k.
Since E_ab^*=E_ba on k, its quadratic form is the sum of all
compact generator squared norms. In particular a nonzero
weight vector of weight mu in M_0 has sum mu_i²<=C0.
PBW orders compact lowering operators left, diagonals next,
raising right; hence M_0 spanned by lowering words on x.
Every such lowering step decreases l dot mu by a positive
integer, so the bound on sum mu² gives a finite maximum
length for a nonzero lowering word. Thus M_0 finite-dimensional.
Inductively M_{s+1}=M_s+sum E_ab M_s finite-dimensional and
compact-stable by the commutator formula.

Commuting compact lowering operators to the left past words
of length <=s never increases the number of general generators:
[E_ab,E_cd]=delta_bc E_ad-delta_da E_cb. Consequently M_s
is spanned by compact lowering words applied to general words
of length <=s on x (the native filtration_le_of_word_mem;
can also induct using that the span's compact-lowering closure
contains x and is stable under E by this commutation).
The compact Casimir is selfadjoint on M_s and commutes with k.
Each nonzero eigenspace has a joint diagonal weight eigenvector
z maximizing l dot mu; it is compact-highest, as a raising
operator would strictly increase the maximum. Since z is killed
by compact raising, it is orthogonal to every word with a
nonempty compact-lowering prefix. It therefore pairs nontrivially
with some general word of length <=s on x. Selfadjoint diagonals
force its weight to equal the word weight nu+sum(e_a-e_b).
Thus |mu_i|<=L0+s, and its compact Casimir eigenvalue is
    C(mu)=sum_i mu_i(mu_i+twoRho_c(i))
           <= N(L0+s)(L0+s+N).
By the finite-dimensional spectral theorem, the same upper
bound holds for the quadratic form on every y in M_s.

Write A_c=sum_same ||E_ab y||², A_p=sum_opposite ||E_ab y||².
The signed adjoint gives EXACTLY
    A_c-A_p=Re<y,Omega y> >= c(lambda)||y||².
Hence A_c+A_p<=2 A_c-c(lambda)||y||²; here
c(lambda)>=-N³/4 since |twoRho_i|<=N. With T=L0+s+1>=1,
    sum_ab ||E_ab y||²
      <= [2N(L0+s)(L0+s+N)+N³/4]||y||²
      <= (N+1)^4 T² ||y||².
For the last step, L0+s+N<= (N+1)T and
2N(N+1)+N³/4 <=(N+1)^4 by expansion for N>=1.
Cauchy-Schwarz over the N² matrix entries, |X_ab|<=||X||op,
therefore gives ||rho(X)y||² <= N²||X||op²(N+1)^4T²||y||².
Since N²(N+1)^4<=(N+1)^8, take nonnegative square roots:
    ||rho(X)y|| <= (N+1)^4(L0+1+s)||X||op||y||.
Membership in M_{s+1} follows by its definition. This matches
the exact native generator norm bound with no extra hypotheses.
The stronger weighted-J spectral lemma and rigidity's separate
orthogonal-filtration theorem remain in the original graph.

## 5. Actual BesselCut derivative and energy interface
For Data's l with |l_i|<=L, use L0=L+N by the native lowest
weight bound. The actual frame p is unitary, so X=p^-1 E_ab p
has operator norm 1. Starting at x=psi with norm 1, iterate
section 4 with s=0,...,j-1. For each word w of length j,
    ||x_w|| <= [(N+1)^4(L+N+1+j)]^j.
The same x_w is obtained by applying the twisted bump derivatives
to normalized beta then smearing (section 2). Let e=d psi in
the frame and X_w=d S(gamma_w) in that same frame.
It is integrable and e*X_w=X_w by the projector identity and
associativity, using compact bump support and weighted L1.
For the actual F fixed by e, F*X_w is the corresponding
continuous iterated derivative of F; derivatives fall on the
bump. Both equations use the native inverse convolution
(F*K)(g)=int K(y^-1)F(gy)dy.
With the SAME Haar measure and d, the exact normalization is
    int_G |X_w(g)|² dg / d = ||x_w||².
This follows from i(f)=sqrt(d) f and the unitary frame's
measure preservation. For j<=2(shape.n)^2, choose B>=
(N+1)^4(L+N+1+2(shape.n)^2), as in BesselCut.
Thus the energy factor on the right is <=B^(2j).
Insert this in the existing quotient Schur convolution bound
hW.lintegral_sq_convolve_convolve_le at BesselCut, keeping its
integrability and Bessel equivariance hypotheses and the same
component functions. It supplies HasSchurBound with the native
constant d^-1 int_Q ||F||². The detailed quotient Schur
inequality itself is retained (RUN63); no independent replay
or fresh proof of that inequality claimed here. This is the
derivative input to Data.exists_besselSystem, not a proof
of the distinct band-limit or global Siegel-Weil suppliers.

## Evidence and frontier
Original source-visible: Data.exists_besselSystem -> BesselCut
-> SchurOrthogonality, BumpConvolution, CasimirOnPsi,
CasimirGrowth, HighestVectors, CasimirBound, PsiBasic.
Local reduced derivation uses fixed-split triangular equivariance,
smear with a positive scalar, signed adjoint and compact
spectral theorem (J=identity). Context key includes compact pin,
actual frame, l, epsilon, Haar d, derivative order, actual F,
and same Bessel caller. Other consumers/graphs/axiom evidence
preserved; no kernel dependency deletion. Retain distinct
Orbital degree, band limits, Siegel-Weil/Rallis and exact
quotient Schur majorant. No RH theorem assumed; no URT.
Actual command -v lean/lake returned none. No native
rh_scan/prune/reduce/auto/frontier executed. Below scalar
certificate and exact native probes prepared, not compiled.
Fresh API reads: runs 45799225653,45577239749,45576756833
completed success on their respective historical heads. Not
a native check of this file. Latest integration/dependency
notes record six compact checks and module timeout in
45803534769; not counted as a new PASS here.
No synthetic samples or invented execution.
RESUME HERE: inspect exact Orbital.harish_chandra_degree_and_orbital
and band-limit derivative consumer (separate from Schur), then
distinct SiegelWeil/Rallis unfolding hypotheses at actual B.
Audit triangular orientations in section 1 and quotient Schur
constant in section 5. Integrate RUN67-69 without repeating
the generator or compact projection. Human RH proof incomplete.
HANDOFF TO integration/editor, independent audit, native runner.
-/

namespace RHPositivityRun69

theorem casimir_scalar (l r w : ℝ) (h : 2*w = l+r) :
    w*(w-r) = (l^2-r^2)/4 := by
  have hw : w = (l+r)/2 := by linarith
  rw [hw]
  ring

theorem signed_energy (a b c q : ℝ) (h : c*q ≤ a-b) :
    a+b ≤ 2*a-c*q := by linarith

end RHPositivityRun69

#check isKHighest_dsGenerator
#check casimir_dsCoeffSmooth
#check exists_smear_dsCoeffSmooth_eq
#check HCParam.HasLargeGap.exists_decay_bound
#check HCParam.HasLargeGap.toL2_spec
#check HCParam.HasLargeGap.isUnitaryCasimirGe_dsAction
#check HCParam.IsKHighest.norm_apply_le_of_mem_filtration
#check IsBesselFunction.hasSchurBound_of_convolve_eq
#print axioms RHPositivityRun69.casimir_scalar
#print axioms RHPositivityRun69.signed_energy
#print axioms casimir_dsCoeffSmooth
#print axioms exists_smear_dsCoeffSmooth_eq
#print axioms HCParam.IsKHighest.norm_apply_le_of_mem_filtration
#print axioms IsBesselFunction.hasSchurBound_of_convolve_eq
