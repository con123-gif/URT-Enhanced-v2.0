import New.Seesaw.GoodDatumExists
import New.Filling.DegreeBounds

/-!
# RUN51 compact theta: reconstruct evaluated-vacuum to good-datum chain
26 Nov 2026. Human source-matched derivation of connected A suppliers.
Lean caller candidates PREPARED, NOT COMPILED. Human RH reconstruction incomplete.
Mission blob 23f64d503b7d64bb13b9667156b499021038d742; latest manuscript
e0cf5402bda7772a8ab2556b61d9d67859b36630. Compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude per upstream.

Source bodies retrieved in this run:
New/Seesaw/AdmissibleEvaluation.lean 4a0070f1658927e4faf4e596cceb0009478b6c2d
New/Seesaw/AdmissibleComb.lean 6519d031bf78b2243efbb71d09f47e500c1bf32c
New/Seesaw/GoodDatumExists.lean cc6f93272fb65dd22d8079236a66454b034182b9
New/Seesaw/UnfoldingStages.lean 5e6b4189ad78c708ce8f30888678b4467672b850
New/Seesaw/SeesawTheorem.lean 0e6f5541f15ddb75c30751d22163bfdbd4194d91
New/Filling/DegreeBounds.lean ce002c043a5f5e1d8f5902fe47eebd7ae03c87ba
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547.
Peer commits examined: fcd5da81 (Hecke transfer), bd1a2355 (finite cut),
93d92f63 (index/assembly), 15c60307 (kernel), latest commit search through
6653e0ac. This extends the finite-cut reconstruction to its actual good-datum
consumer; not another collision bypass or an optimization of sufficient constants.

## 1. Exact neighbour-lattice expansion and its integral transport

Use the actual setting of exists_isAdmissibleEval_std: split level P,N,
idempotent j supported on P, S=star(P), pi with the native split-squarefree
condition; diagonal kappa with entries 1 or delta, delta*star(delta)=1,
delta=1 and beta a unit at N, beta*kappa and its indicated conjugate
products integral. Write e,e' for the two last indices. The source chooses
l=normNegOne*j, rho_i=1_(i=e)+star(l)*1_(i=e'), and
gamma=I+A*rho*(e^T+l e'^T), with A the explicit adele in the source.
Thus gamma x=x+A(x_e+l x_e')rho exactly, independently in each column.
The source supplies unitarity and neighbour-vector relations (these are
not consequences of being a rank-one update alone).

At the split level, the native residue selection gives, for every x
and each column, one b(x) in the finite residue space
J=(X' -> P -> ZMod N). With n(y) the native residue-shift vector, its
integrality calculation is
  gamma x+n(y) in integralBox(S) iff x in integralBox(S) AND b(x)=y.
Sum this indicator identity over y in J BEFORE applying norms.
There is exactly one term for an integral x and zero for any other x.
Since gamma is invertible, replacing gamma x by the free variable z
gives the actual equality of box functions used in
exists_isAdmissibleEval_std. Via the source name/Schrodinger identity
and the fact that the relevant semicharacter on the isotropic
star(j)-supported shifts is 1, this becomes
  omega(h gamma) proj_S f
     = C sum_(y in J) finHeisOp(star(j)*n(y)) proj_S f.
C is independent of f, twist and translations. This derives the
finite residue expansion from the explicit residue-uniqueness
identity, not from an unsupported partition of a lattice.
The nontrivial integrality equivalence for the explicit gamma and
n(y), its unitary proof and the name-to-Weil covariance remain
source prerequisites for this paragraph.

For transport into the actual pair of spaces, let B be the native
Kronecker coordinate matrix in isAdmissibleEval_finEval. Its columns
are integral by hM, the chosen neighbour vectors and SpansLattice.
For d_i,d'_j the weights, the retained zero-pattern premise says
B_ij(star u)=0 whenever v(d_i u) != v(d'_j u). At each u outside
the allowed denominator set, expand (B^H y)_j as a sum. Nonzero
summands have matching weights, and conjugation gives the required
integral matrix entries. Every summand then satisfies the target
weighted integrality bound, and the nonarchimedean triangle
inequality gives it for their sum. This proves the actual
mulVec_mem_weightedTranslations step, not a claim that an arbitrary
integral B preserves a weighted lattice. The other exact cancellation
is B^H*stackedTFin=0 from the graded string-map annihilation of J
in the source. Consequently the adjoint translation introduces no
new nontrivial phase from that pairing. The remaining native
zero-term/Weil evaluation contributes a common C3 and phases that
are zero or roots of unity; these preserve every p-adic integrality
and every conjugate l1 bound. Combined with the residue expansion
this gives the evaluation's denominator and size from the native
index bound. Retain the explicit hA and hM for pairEvalY; their
lattice verification for middlePair and lastPair still needs full
human derivation.

## 2. Assemble the same evaluated tensor with one common denominator

For fixed native D, write r=rho+1, m=2r, K=cutBound, q=theta.levelNorm.
At each pair i<r, the actual isAdmissibleEval_pairEvalY supplies a
constant C_i chosen BEFORE theta and y, and a finite combination of
translated paired vacua with denominator dividing K^4, conditional
conjugate l1 size <=1 when theta.Q=empty. The translatedUpsilon
expansions have the same size guard, and the weighted-translation
condition holds away from q. Bilinear pairing multiplies the
coefficient lists. For the sum over common labels one may group
equal labels, never increasing l1. For a prime l coprime to q,
multiplying a coefficient by the product of its input denominators
makes it integral; sums remain integral. Thus substitution of one
finite combination into another multiplies denominator allowances
and l1 bounds. The same argument applies to pure tensors.
Root-of-unity phases do not change either estimate.
Taking the tensor product over the r pairs gives
  C=prod_i C_i,   d=(K^4)^r=K^(2m),   size<=1.
This is the actual exists_isAdmissibleComb_reducedVacuum witness:
support in admissibleTranslations(q), one constant C for all theta
and y. No tensor rank estimate or independent C_theta is substituted.
In the stage unfolding from peer bd1a2355, coefficients are integral
away from q and have conjugate l1 size <=K^m for the trivial twist.
Substitute the tensor combinations into that single unfolding
combination. The result z_theta has common C, denominator d,
size <=K^m, and is fixed by the joint level action (the latter is
the native unfolding covariance, not termwise invariance).

Let a be the scalar chosen before theta in that unfolding. Clearing
d is exact even if aC vanishes: u=normUnit(a*C/d) is a unit,
u*a*C=d*normalize(a*C/d). In a field normalize is 0 or 1.
Consequently the coefficients of u*a*z_theta are d times the old
coefficients, multiplied by 0 or 1. They are integral away from q
and have conjugate l1 size <=d*K^m=K^(3m). The scalar u remains
nonzero in both cases, and is common across all twists.
This proves the normalization mechanism of normUnit_smul in the
actual consumer. Do NOT divide by C or a.

## 3. Exact paired projection, expansion, and actual good-datum fields

For an admissible t at q coprime to N, the translated vacuum is
integral on the required conjugation-closed places above N
(the native mem_integralAfter and projOn_translateDatum).
Write v_i=translateDatum(t)_i, P_i=projOnFinPart at the selected
split places and T_i=translateSum. In T_i(v_2i tensor v_(2i+1)),
index each shift by y in X' -> P -> ZMod N. Applying P_2i tensor
P_(2i+1) termwise gives the box indicator of the corresponding
shift times the translated tensor. The reduction equivalence at
split level says that for y!=0 at least one required box indicator
is zero; y=0 leaves both original vacua unchanged. Hence exactly
  (P_2i tensor P_(2i+1)) T_i(v_2i tensor v_(2i+1))
       = v_2i tensor v_(2i+1).
This is projOnFinPart_pairTranslates (no cardinality factor).
Expansion of T_i before projecting instead gives a finite sum of
ordinary translated vacua, at most N^(f*n_m) summands for each pair,
with coefficients roots of unity and translations admissible at qN.
The product over r pairs has denominator 1, conjugate l1 cost at
most N^(f*n_m*r). Hence the normalized z has an ordinary pure-tensor
expansion with a single finite coefficient function Psi supported
at qN, integral away from q (not merely qN), and for trivial twist
  sum |sigma Psi| <= K^(3m) N^(f*n_m*r) <= exp(x^60).
The final inequality is the native HasLogBound magnitude used in
GoodDatumExists; retain this size guard, don't rederive constants.

For every generator at q, the projection identity implies that
apply (T_i composed with P_i tensor P'_i) to each pair leaves its
reduced tensor unchanged. Extend linearly to the SAME normalized
w. Thus w equals that common linear operator applied to w, even
after its ordinary expansion uses qN translations. This is crucial:
the pointwise projection lemma is only for q-admissible
generators; do not apply it separately to the new qN support.
Apply the common linear paired-lift map with input phi to both
expressions. The ordinary tensor expansion gives chainComb; the
projected/glued expansion gives chain_at_N. Joint level invariance
of w transfers to the ordinary tensor combination by the
intertwining of the twoKernelAction and pure-tensor map.
These give precisely both extra fields of IsGoodDatum, not just
its coefficient-size field. They hold for every column phi and
one Psi per twist. This is the core proof of
exists_isGoodDatum_of_invariant.

## 4. Actual seesaw caller and last-stage map

Use DegreeBounds.exists_last_stage_map: R=toAlgForm composed with
restrictToY at M=m. Its first implication is the defining
identification of iota and Bmu through this restriction. Its
second follows from integral_algFormCoeff_blockEmb and the
class-integral-to-inner-product identity, with scalar
C_t times card(standard classes) times the native product over
archimedean places. The scalar can depend on t, not on the
column/test form. Retain the branching integral theorem and the
nonzero local dimension factors in this conversion.
Apply the actual unfolded period identity with the evaluated
tensor and functional L=inner(Xi,R(lift(phi,-))). The previous
normalization makes its left side the liftChainY of Poincare(u phi),
and its right side the inner product with R(chainComb(Psi,phi)).
This equality holds for every Xi in the same target space. By
nondegeneracy (test with the difference itself), the two vectors
are equal. Apply the first implication of R to obtain
  iota_theta(Poincare(u phi))=Bmu_theta^Psi(phi).
This identifies the exact common u and the same Psi used in the
archimedean norm and finite index of Data.short_forms. It is not
an argument using a separately chosen Psi for each phi or test Xi.

## Status, selected source graph and verification

Original selected path:
Main <- New.grh <- eventually_primeError_le_rpow <- star_inequality
<- exists_family_covolumeSq_le <- Data.short_forms <- Data.seesaw
<- [exists_isAdmissibleComb_unfolding, exists_isAdmissibleComb_reducedVacuum,
exists_isGoodDatum_of_invariant, exists_last_stage_map, unfoldStage_even].
Within the reduced-vacuum branch retain isAdmissibleEval_pairEvalY,
isAdmissibleEval_finEval, exists_isAdmissibleEval_std and their native
geometric/Weil prerequisites. Within good-datum retain projection,
native size and level-action transport. Reconstructed connected
intermediate mechanisms 1--4 above. No claim the deepest matrix
support or Bessel pairing theorem is closed, no global edge deletion,
no new axioms, no import of Main or claimed RH. Original and
reduced source roles distinguished; old graph remains archival.
Context key: (compact pin, Data P, theta, stage, finite embedding,
fixed y, common C,a,u,w,Psi; arbitrary phi,Xi).
Latest actual compact status fetched: status blob
ea44d71556e0d21703e72fcd61bbaf2bee0ec563, run 45781154005,
status=error returncode=1 RESOURCE_BLOCKED before compilation.
Peer RUN27 confirms 4 CPUs and 16.76 GB below 12 cores/24 GB.
No fresh native compilation, no rh_prune/rh_scan/rh_auto or axiom
PASS at this pin. Old 4.33.1 engine evidence is not compact evidence.
Certificates below expose the actual projection and good-datum
caller interfaces; they are replay adapters, not independent
formal proofs of the native deep suppliers.

RESUME HERE: reconstruct explicit hA/hM in middlePair/lastPair
and the gamma residue equivalence (the two directions in
exists_isAdmissibleEval_std), then the actual HasNearLines.step
support and finite-cut caller. Replay these adapters on shared
compact build when available; no duplicate resource-blocked job.
HANDOFF TO integration, editor, audit, kernel: incorporate the
exact denominator, same-witness projection and good-datum
mechanism in A. Keep deep prerequisites and all A/B/C guards.
-/

open Finset Ideal Matrix Modulus Space TensorProduct TensorChain Weil

namespace RHTheta51

/-- The actual exponent identity, before any estimates. -/
lemma pair_denominator_exponent (r m : ℕ) (h : m = 2 * r) :
    4 * r = 2 * m := by omega

/-- Exact abstract coefficient normalization; no nonzero scalar premise. -/
lemma normalized_coeff {a C u d z : ℂ} (hd : d ≠ 0)
    (h : u * (a * C / d) = 0 ∨ u * (a * C / d) = 1) :
    u * a * (C * z) = 0 ∨ u * a * (C * z) = d * z := by
  rcases h with h | h
  · left
    have h' : u * (a * C) = 0 := by
      field_simp [hd] at h
      simpa [mul_assoc] using h
    calc
      u * a * (C * z) = (u * (a * C)) * z := by ring
      _ = 0 := by rw [h', zero_mul]
  · right
    have h' : u * (a * C) = d := by
      field_simp [hd] at h
      simpa [mul_assoc] using h
    calc
      u * a * (C * z) = (u * (a * C)) * z := by ring
      _ = d * z := by rw [h']

end RHTheta51

namespace Data

variable {P} (D : Data P)

/-- Actual paired projection interface retained in the reduced graph. -/
lemma projOnFinPart_pairTranslates_RHTheta51 (ϑ : D.TameChar) {t}
    (ht : t ∈ D.admissibleTranslations ϑ.levelNorm) i :
    TensorProduct.map (projOnFinPart _ D.piPlaces) (projOnFinPart _ D.piPlaces)
      (D.pairTranslates (D.translateDatum t) i) =
        D.translateDatum t _ ⊗ₜ D.translateDatum t _ :=
  D.projOnFinPart_pairTranslates ϑ ht i

/-- Actual same-witness good-datum consumer. No RH theorem imported. -/
lemma goodDatum_RHTheta51 (ϑ : D.Twist) {w}
    (hw : IsAdmissibleComb D.reducedVacuum
      (D.admissibleTranslations ϑ.levelNorm) ϑ.levelNorm 1 (ϑ.Q = ∅)
      (↑(D.cutBound ^ (2 * D.m)) * D.cutBound ^ (2 * D.ϱ + 2)) w)
    (hi : ∀ b : ∀ k, D.columnLevel k, b (2 * D.ϱ + 2) = 1 →
      TensorChain.map (twoKernelAction (D.liftKernel ϑ) (b ·)) _ w = w) :
    ∃ Ψ, IsGoodDatum ϑ Ψ ∧ ∀ φ,
      TensorChain.lift (TensorChain.liftInPairs (D.liftKernel ϑ · |>.lift)) φ _ w =
        chainComb ϑ Ψ D.translateDatum _ φ :=
  D.exists_isGoodDatum_of_invariant ϑ hw hi

end Data

#print axioms RHTheta51.pair_denominator_exponent
#print axioms RHTheta51.normalized_coeff
#print axioms Data.projOnFinPart_pairTranslates_RHTheta51
#print axioms Data.goodDatum_RHTheta51
