import New.SiegelWeil.DescentsVanishPlanes
import New.Rows.SparseThetaSum

/-!
# RUN53 — analytic isolation and the theta tower's actual Hecke-root guard
26 November 2026. HUMAN SOURCE-MATCHED reconstruction; native candidate NOT COMPILED.
Dependency lane 13 in compact mission; historical lane 12.
Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Parent dependency checkpoint 4bf307880263632fba918a9ad9fb82a8081488a1.
Branch head observed c0a35b567d91 (kernel reciprocity); reviewed current
HUMAN_PROOF_COMPACT, unified determinant, math reciprocity note, and recent
peer commit summaries (B energy, B skew correction, C reciprocity audit,
RUN53 acceleration). No new assembly of final determinant. Current mission's
primitive-closure section takes precedence over old prime-window route.

## Exact source ledger
New/Rows/SparseThetaSum.lean 7c3ab33ebfb2e34b81e79db63a2decc029146d53:
 integral_mul_holMinorsPi_le, isolation, firstMinimum_mul_le_hom,
 norm_modKernel_sub_realInner_le.
New/Rows/Separation.lean cbd60ebb20b771dc6107f3d54df0397ee7707e4d:
 Data.eq_zero_of_integral_fNatural_tableTheta (actual isolation caller).
New/Rows/NaturalFormNear.lean 2393479c4efe2c146f1251298992c00021cba4c8:
 Data.exists_fNatural_approx (actual sparse-theta caller).
New/SiegelWeil/DescentsVanishPlanes.lean 837e8a95ebb14d58a1e379cbba0426fc79b652b3:
 eq_zero_of_heckePolyOp_eq_zero, DescentsVanish.integral_sourceTerm_eq_zero,
 descentsVanish_add_planes.
Lib/Weil/Unramified/HeckeTransfer.lean 9145e115beff2378fb879e699ce56a40149f62cd:
 maximum_principle, heckePolyOp_eq_sum, hecke_transfer_of_equivariant.
Lib/Weil/Unramified/UniformiserScalar.lean 51969de5cd90a47fac42404faf1a7b4fcce39645:
 AutChar.frobValue.
New/SiegelWeil/AuxPairVanishing.lean 8613d2aaed78ee56e6866907ddda2d7a8e951eee:
 initial reflection descent.
Lib/Shimura/ComplexTheta/PeriodVanishing.lean 0cdc82478a980a49506166275445304b76fdb530:
 period_eq_zero (unfolding; not replaced).

## 1. Analytic isolation: one fixed holomorphic test, no measurable selection
Write mu=m in SparseThetaSum (not the tower rank m), B=5b at the
Separation caller, and M_w,M_k for the native holMinorsPi coefficients.
The source assumptions are 2 f card(n)^3<=mu<=B, B>=10^13, positive
first order o, dominant weights w,k with gaps >=300mu, |k_i|<=B.
The formal-degree/tail estimate gives J=int |M_k|^2>0 and, for any
continuous A with |A(h)|<=C_A maxOpNorm(h)^N and N<=6mu,
 integrable A M_w; |int A M_w|<=C_A B^(7mu) J.
This is an essential analytic input, not inferred from a dimension count.

Let F,z,K_0,C,eps satisfy the native isolation hypothesis (in particular
F(z) nonzero and |F|<=2|F(z)|). Write d(theta) for the weight torus
diag(s^o) and chi_k(theta) for its unit-modulus weight character.
All z d(theta) are at least as large as z in absolute value, since
F transforms by that character. At each such centre choose K_theta
of weight k-w with error <=eps maxOpNorm(h)^(6mu) from K_0
and vanishing period. Fix K_* = K_(theta=0). Define
 W_theta(h)=conj(F(z d(theta) h)/chi_k(theta)).
Then int W_theta K_theta M_w=0, exactly, by multiplying the native
zero period by a unit scalar. Subtract BEFORE bounding:
 int W_theta K_* M_w = int W_theta (K_* - K_theta) M_w.
By the two approximation bounds, |K_*-K_theta|<=2eps maxOpNorm^6mu;
by the near-maximum bound, |W_theta|<=2|F(z)|.
The preceding formal-degree estimate yields
 |int W_theta K_* M_w| <= 4 eps |F(z)| B^(7mu) J.
This estimate is pointwise in theta; the family K_theta is NOT
integrated, so neither continuity nor measurable selection of it
is required. The fixed K_* is continuous and
|K_*| <= (C+eps) maxOpNorm^6mu (maxOpNorm>=1), giving an integrable
dominating function for W_theta K_* M_w on circle x group.
Fubini and the native holomorphic circle mean give
 int_theta W_theta(h) = conj(F(z)) conj(M_k(h)).
The native reproducing identity for K_* M_w of weight k now yields
 int_theta int_h W_theta K_* M_w
    = conj(F(z)) K_*(1) J.
Cancel the strictly positive |F(z)| J from the estimate before
the triangle inequality at 1:
 |K_*(1)|<=4eps B^(7mu), |K_0(1)|<=4eps B^(7mu)+eps.
This is precisely isolation with its native sufficient constant.
The actual Data.exists_fNatural_approx supplies the STRICT opposite
inequality. Thus the period detector from RUN52 is a contradiction.
No new regularity assumption and no changed quantifiers.
Remaining analytic primitives: integral_tail_le, dsCoeff_eq_holMinors,
formalDegree identity, circle_mean_holMinorsPi, carrier approximation.
The argument does not prove those inputs by citing isolation itself.

## 2. The exact Hecke maximum principle at the descent caller
At a split place of residue cardinal q>=2 and current rank M,
sphericity gives H(X)F=sum_U a_U F(g r_U), with U all residue
subspaces and a_bottom=1. If H(X)F=0, translating g by
r_bottom^-1 and isolating its term gives
 2 |F(g)| <= sum_U |a_U| |F(g r_bottom^-1 r_U)|.
The source q-binomial identity gives sum_U |a_U|
= product_(i=0..M-1)(1+q^i |X|). Consequently the real sufficient
guard is total coefficient mass <2 (not a spectral assumption).
For q^(M+1)|X|<=1, sum_i q^i |X| <=
 (q^M-1)/(q^(M+1)(q-1)) < 1/(q(q-1)) <= 1/2,
so mass <= exp(sum_i q^i |X|) <2, including rank zero.
For bounded F, take S=sup_g |F(g)|>=0 and get 2S<=mass*S.
Thus S=0. This proves the actual native theorem from its finite
Hecke sum and boundedness, without using RH or any zero-free theorem.
The candidate below factors the proof at the mass premise; the old
theorem supplies the original root-size interface. Do not delete
sphericity or boundedness. No claimed global dependency removal.

## 3. Added hyperbolic planes: cancel every nonzero transfer factor
Use original rank r, p added planes, M=r+2p, definite rank N
and k=N-M. Native rank guard N>2r+2p+3. For p>0 the original root
has |X|=q^(1+r/2-N). FrobValue(a,M) has modulus q^(M/2)
since the character at the uniformiser is unitary; analogous
FrobValue(b,N) has modulus q^(N/2). The adjoint transfer identity
from HeckeTransfer gives scalar product
 T=prod_(i<k)(1-q^i FrobValue(a,M) X)
 times the smaller-rank Hecke operator at X' of modulus
 q^(k/2)|X|=q^(1-N/2-p), on the SAME integrated theta lift.
The source works at the conjugate split place for the vacuum,
then uses Hecke adjunction; the conjugation changes no modulus.
For every i<k, the modulus of q^i FrobValue(a,M) X is
 q^(i+r+p+1-N) <= q^(-p) <1. Hence every factor is nonzero
and T cancels as a unit before any norm. The transferred guard:
 q^(M+1)|X'|=q^(r+p+2-N/2)<=1.
The last inequality is EXACT at N=2r+2p+4. The integer
doubled-exponent lemmas below encode both conditions with no
rounding of half-integers. The p=0 case is separate; do not
apply strict factor nonvanishing there (the maximal exponent
could be zero). Transfer alone does NOT give boundedness of
the higher-rank lift, so keep the actual zero-term induction.

## 4. The zero-term induction at the same theta lift
For p=0 use DescentsVanish.integral_sourceTerm_eq_zero. For the
inductive step the native adapted splitting D' removes one plane.
By Iwasawa decomposition g=radical*Levi*kappa^-1, the zero source
term of the Weil vector becomes the theta kernel on the lower
space times a scalar independent of the integration variable.
Compact covariance of the projection and the mixed-term identity
transport projOn S f=f to its lower vector. Thus the lower zero-term
period vanishes by the induction hypothesis, for the SAME Y.
In the actual proof the functional ell=theta-theta composed with
(D'.homSource V).zeroTerm is controlled by its radical average:
 |ell(phi)| <= B_bound if
 forall b, |theta(phi)-theta(rho(kAdelic b)phi)|<=B_bound.
This follows by the integral triangle inequality for the quotient
mean defining zeroTerm; it does not assert theta(phi)=zeroTerm(phi).
Short isotropic vectors, Witt extension and exists_norm_name_le
are then used in the source to bound ell uniformly after rational
translation; integrating against the bounded automorphic Y on
the definite space and subtracting the zero term gives bounded
higher-rank lift. The previous Hecke contraction applies and
closes this induction from the initial reflection descent.
Keep adapted splitting, definite V, charUnramified at conjugate
w, star w in S, spherical Y, original root and automorphy.
The quantitative exists_norm_name_le and adapted local mixed-term
identities remain actual primitive suppliers. This is a human
reconstruction of their consumption, not their independent proof.

## Graph and audit boundary
C -> exists_comparison_forms -> singleton detector -> isolation
 -> formal degree/tail + circle mean + carrier approximation.
C -> tableTheta_adjoint_eq_zero -> descentsVanish_hypSum
 -> descentsVanish_add_planes -> sourceTerm induction + local
    Hecke transfer -> coefficient mass maximum principle
    + quantitative boundedness.
Candidate local edge root-size -> coefficient mass -> contraction;
retain old size interface and all other edges. Context keys
(pin, E, ranks r,p,M,N, place w, conjugate w, a,Y,f,S, role)
and (pin,D,j,F,z,o,k,w,mu,B, role) prevent sharing across unequal
guards. No kernel DAG/axiom replacement claimed.
RUN52, original role graph, all unresolved primitive and axiom
evidence untouched. No URT or final RH import.

## Executed checks
5 exact one-occurrence source substitutions of the actual Hecke lemma.
Exact integer rank-transfer tests 17220; strict-factor tests 585480;
boundary-rank tests 820; exact rational q-binomial product tests 210
(q=2..11, rank 0..20), all no violations. These test only scalar guards.
Local command -v lean/lake no executable. Actual GitHub API verified
runs 45577239749,45576756833 success (original engine); 45799225653
success with run job 139837856843 and successful artifact/record jobs
(compact RUN28, head 4c55b565). This does NOT check RUN53 declarations.
No new Lean PASS, no new native axiom output, no competing workflow.
-/

noncomputable section
open Matrix MeasureTheory WeilData Space Splitting Finset Fintype Real G MatMul
namespace DependencyRun53

lemma tower_transfer_guard (r p N : ℤ) (h : 2*r+2*p+3 < N) :
    (2+r-2*N)+(N-(r+2*p))+2*(r+2*p+1) ≤ 0 := by omega

lemma tower_factor_guard (r p N i : ℤ) (hp : 0 < p)
    (hi : i < N-(r+2*p)) :
    (2+r-2*N)+(r+2*p)+2*i < 0 := by omega

lemma isolation_cancel (f J u A : ℝ) (hf : 0 < f) (hJ : 0 < J)
    (h : f*J*u ≤ f*J*A) : u ≤ A := by
  exact le_of_mul_le_mul_left h (mul_pos hf hJ)

section Hecke
variable {E n m} [Field E] [CMType E] [Fintype n] [Fintype m] {t : m → ℤˣ}
lemma eq_zero_of_heckePolyOp_eq_zero_mass_run53 {F w X} (hw : w.IsSplit) (hK : F ∈ sphericalAt (finRightRep E
  t) w) (h : heckePolyOp (finRightRep ..) hw X F = 0) (hMass : ∑ U : Submodule (ResField w) (m → ResField w), ‖heckePolyCoeff X U‖ < 2) (b :
  BddAbove (.range (‖F ·‖))) : F = 0 := by
  let r U : G E t := (1, atSplit hw (transposeGL (basicCosetRep U)))
  refine' funext (norm_le_zero_iff.1 <|
    maximum_principle b (heckePolyCoeff X) (· / r ⊥ * r ·) (l := 2) _ (fun g
    ↦ _) ·) <;> simp [funext_iff, heckePolyCoeff, heckePolyOp_eq_sum hw hK, -Prod.forall] at *
  · exact hMass
  · simpa [h, r, two_mul, le_sub_iff_add_le] using norm_sum_le (univ.erase ⊥) fun U ↦
      heckePolyCoeff X U * F (g / r ⊥ * r U)
end Hecke

#print axioms tower_transfer_guard
#print axioms tower_factor_guard
#print axioms isolation_cancel
#print axioms eq_zero_of_heckePolyOp_eq_zero_mass_run53
end DependencyRun53

/-!
RESUME HERE: native replay of the four declarations in the shared compact
runner; at the actual descentsVanish_add_planes caller test the mass
variant using the original q-binomial bound, preserving both source
interfaces. Then reconstruct exists_norm_name_le and the formal-degree
tail / sparse-carrier primitives; do not treat the induction's
boundedness input as discharged. Integration: insert the fixed-test
isolation and the doubled-exponent transfer guard in the C primitive
ledger; audit the local cancellation and the precise zero-term premise.
No independent essential root obligation newly closed.
HANDOFF TO: integration, human editor, theta, formal audit, kernel.
-/
