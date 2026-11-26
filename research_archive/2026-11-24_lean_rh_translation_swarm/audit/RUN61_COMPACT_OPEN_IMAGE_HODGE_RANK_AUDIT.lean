import Lib.PadicHodge.WachKisin.CrystallinePeriodMatrix
import Lib.PadicHodge.BlochKato.BlochKato
import Lib.ClassField.LocalDuality.CrystallineDuality

/-!
# RUN61 — independent audit of the Hodge frame, fixed fractions, and cocycle rank
26 November 2026. AGREE with Hodge frame and fixed coefficient arguments;
PARTIAL for full C. Correct scope of the rational-to-integral rank step.
SOURCE-MATCHED HUMAN PROOF, not a fresh kernel replay.

Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
completion-first; manuscript a78c38a72d502bd41ee9081aee5aa42a054ed02e.
Read SWARM_PROTOCOL, AGENTS, handoff, research state/log/protocol and
continuity rules. Peers: Hodge appendix f400129e, chart appendix 3be09a0a,
max-period appendix 31363ce4 (commit c3b2fad4), literature RUN60
2bd8f96d / blob 4a478122; prior audit eec17037. The latter two overlap
the Hodge proof, so no independent novelty claimed. New correction:
the rank theorem needs only OPEN IMAGE, not a topological open embedding.

## 1. Filter, sign, determinant and jump audit

Let F be the native filter with nearOne Γ ≤ F. For every F-eventual
predicate depending only on j(g), nhds(1) ≤ map j F implies that
predicate holds on a Galois neighborhood; this is the direction of
filter inclusion required. Finite intersections are F-eventual.
No inverse image of an arbitrary eventual predicate is asserted.
For a stable subspace W of C_p^d, choose a nonzero vector with
inclusion-minimal support among those supported within a specified
nonzero vector. The vectors supported there span exactly one line:
otherwise subtract a multiple to cancel a nonzero coordinate.
Normalize by a maximal-norm coordinate nu. Its twisted Galois
translates have the same support and belong to W eventually, so
are proportional; their nu-coordinate fixes the proportionality.
Tate's nonzero-twist vanishing implies unequal-weight coordinates
zero; zero-twist invariants put the other coordinates in Qpbar.
Equal weights give fixedness along the ORIGINAL F, not merely
near 1. The resulting normalized algebraic vector has sup norm ≤1.
Subtract its multiple from the specified vector and induct on support.
This proves the full spanning assertion without a continuity premise.

For UY=P diag(t^k), reduce N(g)g(P)diag(chi^k)=P mod t.
On the kernel the action is diag(chi^(-k))g, with a MINUS sign.
Replacing column nu of I by the above a gives determinant 1 and
commutes with diag(t^k), since a is supported in the same weight.
Hence Y E is an allowed integral algebraic almost-fixed matrix.
Replacing column nu of P by P a / t gives another integral P'
and k'=k+e_nu. Exactly det(P')=det(P)/t, so minimal nonnegative
t-valuation contradicts singular residue. This applies also at
F=top, when all predicates hold for every group element.
d=0 is immediate.

Explicit jump dictionary (the columns of residue P are not themselves
the native dual functionals): put R=theta(P). The matrix identity gives
    R^(-1) N(g) = diag(chi^(-k)) g(R^(-1)).
The i-th ROW f_i of R^(-1) thus satisfies
    f_i(N(g)v)=chi(g)^(-k_i) g(f_i(v))
for rational lattice-basis coordinates v. For a weight-u functional
sum_i c_i f_i, independence of the g(f_i) on these coordinates yields
    c_i = chi(g)^(k_i-u) g(c_i)
near 1. Tate gives c_i=0 if k_i!=u; otherwise c_i is algebraic.
Conversely algebraic equal-weight combinations are fixed as required
on a common sufficiently small open subgroup. Hence the dimension
over Qpbar is exactly #{i:k_i=u}, not a C_p dimension of the
eventually fixed space. The jump convention is k_i, not -k_i.
Apply to EACH Frobenius translate M_n, whose invariant-basis identity
uses the same Z_p-valued N and commuting Frobenius. This checks the
all-n pole bound at exists_isPeriodMatrix, not just n=0.
H=a+b for that caller and H=2a for the symmetric frame caller.

The continuity claim is acyclic: from a near-one Hodge frame,
N(g)=R diag(chi^(-k))g(R)^(-1) near 1. Natural scalar Galois action
and cyclotomic character are continuous, so this supplies continuity
at identity (on the image group after descent), not an input to
the Hodge frame. A continuous-representation comparison theorem
cannot be substituted before this argument.

## 2. Fixed fractions, depth, and exact ring identity

Checked Fontaine, Astérisque 223, Exposé II §1.5.7 printed p.74
(PDF page 16 zero-based), primary page image opened in this run:
https://www.numdam.org/item/AST_1994__223__59_0.pdf .
For open H=G_K, the graded scalar invariants C_p(q)^H vanish for
q!=0 and are K at q=0; B_dR^H=K. Here is the useful direct
filtration lifting, also matching DeRhamFiltration:
if g(x)-x in Fil^m for every g and v_t(x)=r<m, the nonzero
leading coefficient has twist r fixed. Thus r=0. Its residue
a belongs to K. Subtract that canonical algebraic lift; if the
new value has order r'<m, then r'>0, a contradiction by Tate.
If x already in Fil^m choose a=0. For S=0 use the same argument
with no truncation (or B_dR^H=K). So every invariant class
has a representative a in K. This uses no infinite averaging.

Checked the chart appendix's use of Fontaine: the source B_dR
is identified via A_inf[1/p]/xi^n ≅ BPlus/xi^n using the actual
approximation and repeated theta-divisibility reflection. Both
maps are natural. The subgroup condition contains the fixer of
Lambda and theta(z), giving K⊂theta(S_B). Newton iteration
b -> b-gP(b), with theta(g)=1/P'(a), raises filtration by at
least one and stays in S_B. No inverse of P'(b) is used.
Depth of a finite K-linear form is preserved by the actual
S-linear coordinate map by approximation and exact commuting
with E^m; the zero relation follows by separation for every m.

For the fixed fraction b/b', first b'!=0, then b/b' in K
by the fixed-field result; use one common mu denominator.
There is a nonzero extended coordinate of the denominator by
the actual approximation/separation theorem. The exact linear
relation is preserved by that SAME coordinate. Divide out the
largest common z-power by bicommutant division; the two resulting
coordinates are not both z-divisible. Write u=alpha+z u1,
v=beta+z v1 with alpha,beta in Lambda[1/p]. If a=u/v in K,
then alpha-a beta=z(a v1-u1). If d=alpha-a beta!=0, the algebraic
a,d^(-1) are integral over S_B, which contains Q_p. Hence z is a
unit in an integral extension. Multiplying a monic equation
for z^(-1) by z^(n-1) shows z^(-1) belongs to S_B itself,
contrary to z-adic separation. Therefore alpha=a beta; beta!=0
by the primitive common-z choice. This yields a in the exact
Lambda[1/p] and p^m b=w b', not merely some larger unramified field.
The zero numerator and arbitrary fixed fraction cases are included.
For valueField(a) retain both S_B and phi^(-a)S generators;
cancel a common nonzero denominator only in B_dR. No unit
claim about that denominator in B_dR^+ is needed.
The arbitrary-BPlus-vector hat_stable test follows by the exact
filtered factorization, with Y^-1 coefficients in K and
b-k_i>=0. This audit keeps the chart extension, approximation,
separation, mod-z decomposition and existence as actual source
dependencies, not as established external theorem substitutions.

Checked Colmez primary page images, printed pp.24,26
(PDF pages 23,25) at
https://webusers.imj-prg.fr/~pierre.colmez/iwasawa-deRham.pdf .
Definition of A_max is restricted series in (omega/p) with A_inf
coefficients tending to zero p-adically; changing the generator
of ker theta is explicitly allowed. Native Amax is the p-completion
of A_inf[X]/(pX-xi), which has exactly these restricted series:
lift successively modulo p^n and collect finite polynomial
corrections; conversely each such series converges. Identify the
natural injection into B_dR. Native t_s ~ p mu is a uniformizer,
g(t_s)=chi(g)t_s; Colmez t_c=log[epsilon] is also in B_max^+
with that character. Their ratio in B_dR is G_Qp-fixed and so in
Q_p^*. Hence the two localizations agree. No divided-power
B_cris equality has been asserted. Colmez III.3.1 gives the
exact sequence with map (1-phi, class); changing the sign gives
the native (phi-1, class) map, including p=2.

## 3. Scope correction and a direct uniform denominator (new audit result)

The max-period appendix section 2 assumes j is an open EMBEDDING
and uses compactness of Γ to obtain one integral denominator.
This is fine at the actual local duality consumer, but
crysCocycles.finrank_eq is stated for an arbitrary group with
j of OPEN IMAGE. No topology/compactness of Γ is a hypothesis.
Do not promote the narrower proof to the general rank theorem
without a bridge. The following avoids continuity entirely,
and is the direct bound in the actual BlochKato.lean proof.

Let T be finite free Z_p, V=T[1/p], and y in B⊗V a primitive
of a rational crystalline cocycle c(g)=g y-y in V.
Use the native filtered de Rham frame N from exists_hodge_basis;
N is an equivariant linear isomorphism onto scalar coordinates.
The image of y in Q=(B_dR⊗V)/(B_dR^+⊗V) is fixed because c(g)
lies in V⊂B_dR^+⊗V. By §2 (applied to the finite filtration
coordinates N), its class has a fixed representative a with
coordinates in K. Thus y=N^(-1)a+x with x∈B_dR^+⊗T.
The first term is Γ-fixed, even for noninjective j. Hence
    c(g)=g x-x in B_dR⊗V.
In a fixed integral basis e of T, write X_i=theta(x_i)∈C_p.
Apply theta before any norms (theta commutes with Galois and
is identity on rational constants):
    c_i(g)=sum_j rho(g)_ij j(g)(X_j)-X_i.
Every rho(g)_ij is in Z_p; scalar Galois acts isometrically.
By the nonarchimedean triangle inequality, uniformly in g and i,
    |c_i(g)|_p ≤ max_j |X_j|_p.
For d=0 there is nothing to bound. Otherwise choose N0>=0 with
p^(N0) >= max_j |X_j|_p. Then p^N0 c(g)∈T for ALL g.
The finite basis ensures a finite bound and p>1 ensures such
N0 exists. No topological assumption, compactness, or rational
extension continuity is needed for the rank theorem. This
supplies precisely the native all-group quantifier, and the
coarser bound (d+1)max is also sufficient.

For the actual full de Rham frame used here: potential
admissibility supplies a basis fixed on a near-one set, hence
on a subgroup j^(-1)(H1) for H1 normal open in H=j(Γ).
In particular ker j acts trivially on the period basis and,
because it acts trivially on B, on V. Finite semilinear descent
from the H1-fixed de Rham space over K1 to the H-fixed space
over K now applies even for noninjective j. Hodge determinant
descent gives the full filtered N as in CocycleContinuity.
No proof that Γ itself is compact or Hausdorff was used.

Let F(y)=((phi-1)y,class(y)) and D=(B⊗V)^Γ, t=Q^Γ.
The exact sequence just audited shows E=F^(-1)(D⊕t) sits in
    0 -> V -> E -> D⊕t -> 0
    0 -> D -> E -> Z_f(V) -> 0.
The second exactness is precisely F(g y-y)=0 iff g y-y∈V.
D injects via N into K^d. By scalar filtration lifting,
dim_Qp t=[K:Q_p] #{i:k_i<0}. All dimensions finite, so D cancels:
    dim_Qp Z_f(V)=d+[G_p:j(Γ)] #{i:k_i<0}.
Uniform denominator above proves the rational span of Z_f(T)
equals Z_f(V); finite coordinate evaluations separate its
finite-dimensional function space, giving integral finite
freeness over Z_p. Saturation follows by dividing the period
primitive by p^m whenever the function is p^m-integral.
Thus the rank formula is supplied at its original open-image
generality, not only the narrower local duality setting.

## 4. Actual duality caller

Here and ONLY here retain the native IsOpenEmbedding hypothesis
and topological group, continuous finite-module action, perfect
equivariant Z_p pairing with Tate twist. Continuity of integral
cocycles follows from the Hodge frame applied to the extension
representation, as in CocycleContinuity. The argument for the
rank theorem did not require this. Dual jumps -k_i-1 are negative
on exactly one side. With N=|T/p^m| and n=[K:Q_p], the audited rank
and saturation give |A||A'|=N^(n+2).
Finite local Tate duality/Euler with the actual Cartier dual
M'=Hom(M,mu_{p^m}) gives |Z^1(K,M)||B^1(K,M')|=N^(n+2).
For T_H the image of H∩Z_f(T'), and A+S in Ann(T_H), perfectness
on H^1 gives
    [Ann(T_H):A]=[A':T_H+B^1(K,M')].
Therefore [S:S∩A] divides [Z_f(T'):H∩Z_f(T')].
Coboundaries lift and H itself need not be cocyclic; the
native continuous B2 boundary in algebraic units must be retained.
The prior appendix's finite Tate argument is accepted with its
published Milne theorem as an explicit dependency, not an
assumption of integral Bloch–Kato self-duality. This is the actual
RowBalanced relative-index supplier; local exponent estimates
and global Selmer/period inputs remain distinct.

## Source and verification ledger

Seven source blobs fetched at pin and 20 exact anchor substring
assertions executed successfully (static only):
- HodgeFrame.lean 158f4df424f222f593b6f2baee57a294ab221f03
  (nearOne Γ ≤ F, k + Pi.single i 1, updateCol 1 i a)
- KummerChart.lean 8c3d7ca027e653f9a125e0cec6fd477c5ce6f791
  (exists_witt_coeff_of_isChartOf, dvd_extendToBPlus, extendedCoord i C ≠ 0)
- CrystallinePeriodMatrix.lean cf83fda104fb44177d374d62f06b4d6e68e3db08
  (exists_isPeriodMatrix, height a+b, hc.dvd_extendToBPlus)
- TateSen/DeRhamFiltration.lean dc4c23217762fe5c0da0a7c70a3d3f7bf297c84b
  (exists_sub_mem_of_smul_sub_mem, qpBar_mem_hodgeFil_iff)
- BlochKato/BlochKato.lean 473db3c6fdc1933e64363113b083af69340b648b
  (finrank_eq, range.index, pow_unbounded_of_one_lt, norm_sub_le/norm_sum_le)
- BlochKato/CocycleContinuity.lean 5eff1d2845333289d7cb4dfb130c86630b92641d
  (exists_hodge_basis, eventually_eq_pow_smul)
- Lib/ClassField/LocalDuality/CrystallineDuality.lean
  85cabaf4fb3b68704ccdc040c34a6b4339ca9cc1
  (IsOpenEmbedding, relIndex_dvd_of_orthogonal, index_mul_index_dual).
All the PadicHodge paths are under Lib/PadicHodge; HodgeFrame,
KummerChart, CrystallinePeriodMatrix under WachKisin.
Also inspected AmaxStructure.lean 1be9736d2c48bece6dd038c72d14b6f807cff9df,
BdR.lean 326d41233ac7638a50194f3ade22350c9b038ad5,
FundamentalKernel.lean 7d78ffa669acc35996f315cfe18ac1dc43649fb9,
NearOne.lean 90cdd38ccf750df2458c39e947f56ffb1b0cdcf5,
DeRhamValues.lean 046db09193b89610f16c21c10f28d8505c304711.

CI actual state reread: RUN29 / 45803534769, status blob
a56e2d3afb99ed8275e81fd63c8494306e57c43f and results blob
088cd2ec0e935ee1a282f10096949bcf671cc804: six named native
checks with propext, Classical.choice, Quot.sound; A module timed
out 124, overall compute status ERROR despite successful workflow
record job. RUN28 / 45799225653 job conclusions success, not proof
of this audit. Local lean/lake absent. Prepared probes below are
UNCOMPILED, not a replacement for elaborated root-graph extraction.
No new kernel closure, no synthetic finite tests, no URT assumption.
Rejected route: narrowing general rank to open embedding without
a bridge; using continuous comparison to prove the frame itself;
identifying source Bcris with the ordinary divided-power ring.
Original graph retained: C -> RowBalanced -> relative index ->
rank/dual jumps/continuous cocycles -> max ring exact sequence,
filtered frame, scalar invariants. Reduced local edge for uniform
denominator: exact scalar filtration lift -> residue norm bound;
does not require continuity or compactness. Chart-specific ring
and frame inputs remain. No global dependency removal asserted.

RESUME HERE: audit the concrete Kummer quotient/corestriction
and reciprocity-to-isotropy bridges at the actual unseen-class
and RowBalanced consumers, retaining the remaining quantitative
local exponents and common twist witnesses. Integrate the open
image uniform denominator and explicit jump-row sign now.
HANDOFF TO integration/editor and kernel runner. AGREE/PARTIAL.
-/

section
open scoped BigOperators
variable {I K : Type*} [Fintype I] [NormedField K]

-- Coarser ordinary triangle bound suffices for the native uniform
-- p-denominator. This is not a simulated test or a full rank proof.
theorem run61_uniform_residue_bound (A : Matrix I I K) (u v : I → K)
    (M : ℝ) (hA : ∀ i j, ‖A i j‖ ≤ 1)
    (hu : ∀ i, ‖u i‖ ≤ M) (hv : ∀ i, ‖v i‖ ≤ M) (i : I) :
    ‖(∑ j, A i j * u j) - v i‖ ≤ ((Fintype.card I : ℝ) + 1) * M := by
  calc
    ‖(∑ j, A i j * u j) - v i‖ ≤ ‖∑ j, A i j * u j‖ + ‖v i‖ :=
      norm_sub_le _ _
    _ ≤ (∑ j, ‖A i j * u j‖) + ‖v i‖ :=
      add_le_add_right (norm_sum_le _ _) _
    _ ≤ (∑ _j : I, M) + M := by
      apply add_le_add _ (hv i)
      apply Finset.sum_le_sum
      intro j _
      rw [norm_mul]
      calc
        ‖A i j‖ * ‖u j‖ ≤ 1 * ‖u j‖ :=
          mul_le_mul_of_nonneg_right (hA i j) (norm_nonneg _)
        _ = ‖u j‖ := one_mul _
        _ ≤ M := hu j
    _ = ((Fintype.card I : ℝ) + 1) * M := by simp [add_mul]
end

#check exists_hodge_frame
#check Lift.Chart.IsChartOf.dvd_extendToBPlus
#check exists_witt_coeff_of_isChartOf
#check Lift.Chart.IsChartOf.exists_isPeriodMatrix
#check BdR.exists_sub_mem_of_smul_sub_mem
#check IsPotCrys.exists_hodge_basis
#check crysCocycles.finrank_eq
#check IsPotCrys.relIndex_dvd_of_orthogonal
#print axioms run61_uniform_residue_bound
#print axioms exists_hodge_frame
#print axioms exists_witt_coeff_of_isChartOf
#print axioms crysCocycles.finrank_eq
#print axioms IsPotCrys.relIndex_dvd_of_orthogonal
