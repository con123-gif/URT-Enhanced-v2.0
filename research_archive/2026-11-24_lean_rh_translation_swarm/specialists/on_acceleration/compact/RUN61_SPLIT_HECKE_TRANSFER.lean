import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN61 — Split Hecke pairing and marked-chain transfer
2026-11-26. Human source-matched derivation with explicit upstream inputs.
Native replacement not compiled; independent mathematical audit pending.
Credit: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude,
the authors of the source argument being reconstructed.

Source pin: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Peer frontier a122a57d1fedb85af246e7931d0f10d90e629692.
Predecessor 3392d9c7: flag cone. Peer 12c745a4: root/depth;
8e256416: pairing integration; a599aa5c: marked hY and injection;
403556a7: orbit and HeckeSizes guards. Do not duplicate those results.

Actual sources read (relative to grh-compact/src; blob hashes):
Lib/Weil/Unramified/HeckeTransfer.lean 9145e115beff2378fb879e699ce56a40149f62cd
Lib/Weil/Unramified/HeckeGL.lean 923db13430eeb318ab80421c84b9a18a3d021ad3
Lib/Weil/Unramified/SphericalHecke.lean 37493fc793c98f8e31d1d2e101e77a4ac2a4023b
Lib/Weil/DualPair/PairSumNegation.lean d2f45383d2e972574a7e749da0f2b4bb9283c6da
Lib/Weil/MixedModel/NameWeilAction.lean a8bee0d694dc7891bb451bc6503f45aed919d2d3
Lib/Weil/Unramified/UniformiserScalar.lean 51969de5cd90a47fac42404faf1a7b4fcce39645
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
Lib/ClassField/HeckeCharacter/CharacterConjugates.lean aeadd310d540e48ae4c0ce8d129330d6c413cc66
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7

## 1. Local cosets and exact signed cancellation
At a split place write O for the local DVR, varpi for a uniformizer,
q for residue cardinality, K=GL_d(O). A basic double coset of index i
consists of integral g with varpi*g^{-1} integral and determinant valuation
i. Smith reduction over O gives i diagonal factors varpi and d-i factors
1 (units absorbed), so ker(bar g) has dimension i and
im(overline(varpi*g^{-1}))=ker(bar g). Hence Z*g^{-1} is integral iff Z
is integral and ker(bar g) is contained in ker(bar Z). Necessity follows
by multiplying by g; sufficiency follows from reducing Z*varpi*g^{-1}
modulo varpi. Transposition gives the corresponding test for g^{-T}*Z.
Two g,g' with the same kernel satisfy g'*g^{-1} in K (apply both tests);
conversely left multiplication by K preserves the kernel. Every subspace
occurs by lifting a residue basis to an integral invertible matrix.
Thus kernel representatives g_U enumerate left cosets, and their inverses
and transposes enumerate the right cosets of the inverse and positive
double cosets respectively. This is the orientation in HeckeGL.

For a residue vector space of dimension d let G(d,i) count i-subspaces,
zero outside 0<=i<=d. Relative to a fixed hyperplane, subspaces contained
in it contribute G(d-1,i), others intersect it in dimension i-1; for each
intersection there are q^(d-i) possible normalized lifts in the quotient.
Consequently G(d,i)=G(d-1,i)+q^(d-i)G(d-1,i-1). Multiplication by the
signed weight (-Y)^i q^(i(i-1)/2), summation, and induction from d=0 give
  P_d(Y) = sum_i G(d,i)(-Y)^i q^(i(i-1)/2)
         = product_{a=0}^{d-1}(1-q^a Y).
No termwise norm estimate is used. In particular
  P_{k+d}(Y)=P_k(Y) P_d(q^k Y).
This supplies the cancellation at the actual split Hecke caller.

## 2. Split Weil transfer with the native normalization
Retain the existing normalized name model and its equivariance:
pairWeil_name_on and pairWeil_eq_smul_of_projOn_eq, with f fixed by the
vacuum projector at the split pair, splitting characters unramified,
and f=name(boxIndicator) f. Write n and m=n+k for the source and target
ranks and chi_S, chi_T for their space characters. The native local
formula for (g,h) on a name with matrix variable Z is
  chi_S(det h)/chi_T(det g)
    * |det g|^(m/2)/|det h|^(n/2) * name(Psi(h^{-1}Zg)) f.
The off-place datum remains unchanged. Put alpha=chi_S(varpi)q^(n/2),
beta=chi_T(varpi)q^(m/2), both nonzero (frobValue).
The target index-i representatives h=g_U^T have valuation i and hence
scalar alpha^i, while the source conjugate-place reps g=g_U^{-1}
have valuation -i and scalar beta^i. The unramified characters remove
unit determinants. On integral Z, the allowed U are subspaces in
ker(bar Z^T) and ker(bar Z), respectively, by section 1. For nonintegral
Z both sums vanish. Thus for rank t=rank(bar Z), the two weighted
Hecke-polynomial sums act on the name by multiplication by
  P_{m-t}(alpha X),  P_{n-t}(beta Y),
respectively, with the integral-box indicator kept. This is the
sum_heckePolyCoeff_smul_pairWeil calculation. Set
  Y=q^k alpha X/beta.
By section 1, the target sum equals P_k(alpha X) times the source
conjugate-place sum at Y as an equality of vectors, not just of norms.
Unramifiedness and vacuum projection also make f fixed on both axes
of the local maximal compact groups.

## 3. Direct pairing; no ambient extension necessary
At hecke_transfer_of_pairing keep B on its original data submodule M,
the actual f in M, the two representations pi and rho, and the
covariance/orbit-membership premise on the two axes:
  rho(h) B(f,v)=B(omega(g,h)f,pi(g)v).
Only (g,1) and (1,h) and the relevant compact stabilizers are used.
All terms of the finite local polynomial sums are in M by orbit
membership. Their ambient equality therefore descends to M by
injectivity of the inclusion. Apply the linear functional in the
first argument B(-,v), with v source-spherical. The target action
moves outside B by target covariance. Source covariance says
  B(omega(g,1)f,v)=B(f,pi(g^{-1})v).
To identify the source average correctly, normalize Haar(K)=1.
For a compact bi-K-invariant double coset D, summing its action on
a spherical vector over right cosets agrees with the integral on D.
Inversion exchanges D and D^{-1} and preserves Haar on GL_n
(unimodularity, e.g. matrix Haar density |det|^{-n}). Applying source
covariance inside this finite-valued integral therefore gives the
positive-place source Hecke operator from the conjugate-place datum
operator. This can equally be done by a common finite coset refinement.
Do not identify g_U itself with a right-coset representative: only
its inverse and transpose have that property in section 1. No ambiguity
from using left cosets survives this averaging. Target sphericality
follows from the target compact covariance and the fixed datum.
Hence the native conclusion in the pairing convention is
  H_target(X) B(f,v)
    = P_k(alpha X) B(f,H_source(q^k alpha X/beta)v).
Here H_source is the POSITIVE-place Hecke polynomial, not the
conjugate-place one; the adjunction has already accounted for inversion.
This direct proof removes the ambient linear-map extension from this
human route, and needs only the specified axis covariance. It retains
the upstream actual name/Weil normalization, not a replacement for
the full Weil construction. No eigenvector hypothesis is introduced.

## 4. Actual marked caller and a single inverse
Fix D, a good datum Psi with p prime to the twist level norm,
marked Lambda, l in Lambda, j<m, and x in support Psi. The marked
prime conditions exclude p|gProd and p=N; neither l nor its conjugate
is chosen. The support condition of H, mem_integralAfter with delta=1,
and projOn_translateDatum give the same vacuum projection on every
stage datum at {l}. The native hasWeight_liftChar and hasWeight_rankTwist
character lemma gives unramifiedness (tame support lies in the chosen
places and twist level; both avoided). In particular the two axes at
the compact group act trivially on the datum.

Write lambda_e=(chainChar(twist,e)).baseChange.atUnif(l).
Its p-adic norm equals 1: apply norm_padic_eq_prod to the norm-one
local idele ratio at l. At embeddings inducing l its norm is p^{-1},
at those inducing the conjugate it is p, and elsewhere 1, by
valuation_p and the induced-place dictionary. The resulting exponent
is the difference of the two weight sums, zero by
sum_inducedPlace_sub_star_eq_zero. This is a p-adic calculation,
not an inference from complex unit norm.

Let Q=p^h, where h is the native inert residue exponent,
q=l.q=Q^2, h<=D.f by the order bound in exists_hecke_transfer.
Write n_e=D.n e and k=t+1 for the constant rank increment, and
C_e for the actual first e lifts with the chosen x, C_0=id.
The two characters for step e to e+1 are rank twists of the same
chainChar at e+1; all ranks are even so spaceChar_rankTwist cancels
the splitting twist. Thus at that step
  alpha_e=lambda_{e+1} Q^{n_e},
  beta_e=lambda_{e+1} Q^{n_{e+1}}.
For fixed j and e<=j+1 put y_e(i)=Q^{(n_{j+1}-n_e)i} q^{i(i-1)/2}.
The target argument X=-U Q^{n_{j+1}-n_{e+1}} makes
  q^k alpha_e X/beta_e = -U Q^{n_{j+1}-n_e},
  alpha_e X = -U lambda_{e+1} Q^{n_j}.
Induct through the chain using section 3 and sphericality at every step.
The exact resulting identity (all complex U) is
  sum_i U^i q^{i(i-1)/2} T_{l,i} C_{j+1} phi
    = F(U) C_{j+1}(sum_i U^i y_0(i) T_{l,i} phi),
  F(U)=product_{e=0}^j product_{a=0}^{k-1}
                  (1+U q^a Q^{n_j} lambda_{e+1}).
The finite sums have the native ranks as upper limits. The sign is
positive in F because X is negative. All factors of F have p-integral
coefficients and constant coefficient 1. This polynomial depends on
D,twist,p,l,j only, not x,phi. Its inverse in the valuation-ring formal
power series has integral coefficients d_s by d_0=1 and
d_s=-sum_{i=1}^s F_i d_{s-i} (Run56); only degree r is needed.
Equality for all U implies coefficient equality, by linear evaluation
or finite Vandermonde interpolation on the finite span of coefficients.
Multiply by F^{-1} and extract degree r=D.ceilLogM p, which is at
most n_0 by the actual size guard. Put delta=D.deltaP p=r*f*(n_m+r).
For i<=r choose
  c_i=p^delta q^{i(i-1)/2} d_{r-i}/y_0(r),
and c_i=0 for i>r. The denominator is the pure power
  y_0(r)=p^{h*r*(n_{j+1}-n_0+r-1)}.
For r=0 it is 1; otherwise the displayed integer exponent is
at most delta since h<=f and n_{j+1}<=n_m. Hence all c_i are
p-integral, uniformly over every support term and column. We have
  sum_{i<=r} c_i T_{l,i} C_{j+1} phi
     = p^delta C_{j+1}(T_{l,r} phi).
This reconstructs the scalar identity and common coefficient witness
of Data.IsGoodDatum.exists_hecke_transfer using the retained
vacuum and lift covariance inputs. Neither the original theorem of
RH nor a supposed spectral eigenvalue is used as a premise.

## 5. Move the marked operators through the actual stages
Let A_l=markExponent l, Y_l=p^{A_l} T_{l,r} as in the caller.
For a list L of distinct marked primes, induct by prepending l.
Define t_l on stage-j data as sum_{i<=r} p^{A_l-delta} c_i
times the target-place datum Hecke operator. Since distinct marked
primes are not conjugate, local actions at l commute with all earlier
ones at the other split pairs. In particular the datum after the
earlier operators is still fixed at the l compact group. The same
operators commute with source action and target compact action
at the column levels, using the actual local max-compact inclusion
and bi-K-invariance of the coset operators. Lift equivariance moves
the target Hecke action through the lift. Apply section 4 and the
previous induction on the rest of L: the resulting stage output is
C_{j+1}(Y_l Y_rest y), with the input y in the column space.
Y_l preserves that column space by its native definition.
No change of the list order or assumption of commuting stages.

For the gauge clause retain exactly the native mem_raises hypothesis:
unselected pairs may be translated by representatives of basic
double cosets of index <=r; selected pairs have test translate 1.
Before prepending l the pair l was unselected. Expand the new
operator in its finite Hecke cosets, each of which is an allowed
test translate for the earlier induction. Its coefficients c_i
are integral, and the norm of p^{A_l-delta} is p^{delta-A_l}.
The nonarchimedean gauge of a finite sum is bounded by the maximum,
not by the number of cosets. Thus the new exponent is the old one
plus delta-A_l. From the empty-list mem_raises bound
sum_{l in Lambda} A_l + liftLoss, the full list gives
  #Lambda*delta + liftLoss.
The induction gives exists_move_markOperator's commutation,
lift equality and gauge clause with the same t (linear, independent
of the input column). This uses mem_raises, not a proof of it.

Apply the construction separately for each stage j, with the same
ordered full-list product Y. The actual modified chain C'_e satisfies
C'_0=id and C'_e(y)=C_e(Y^e y): in the step use the lift identity
on Y^e y, which is again a column. Its gauge is bounded using
IsGoodDatum.gaugeLe_chain with joint invariance preserved by the t_j
commutation and with the support coefficients integral at p.
Finally GaugeLe.restrictToY uses p!=N. This is precisely the
marked-chain transfer in gaugeLe_markOperator_pow, with the
sum of the stage exponents above. The subsequent
gaugeLe_Bmu_of_isMarked still depends on mem_raises, the jet exponent
bound, low-column estimates, and full-mark collision cancellation.
Do not mark those obligations discharged by this note.

## Status and handoff
Original dependency path (preserved): HeckeGL and normalized name
action -> split sum -> equivariant/pairing transfer -> marked
exists_hecke_transfer -> exists_move_markOperator ->
gaugeLe_markOperator_pow -> gaugeLe_Bmu_of_isMarked.
Reduced local path: same finite coset/normalization inputs -> signed
rank product -> direct pairing on original submodule -> uniform
coefficient extraction -> same marked caller. The extension step
is avoidable in this human replacement; no global graph edge or
axiom has been deleted. Backtracking on the coset orientation retains
Haar inversion rather than falsely replacing left reps by right reps.
No new runtime speed claim. No additional URT premise.

Native Lean unavailable in this run; legacy reduction engines are
for the old pin. Actual partial CI receipt reread:
https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45803534769
(status error, not all requested checks reached; six earlier B/C
native probes are not evidence for this A replacement).
The following executable scalar bridge lemmas and native symbol/axiom
probes are prepared for compact Lean, not run. Existing original and
reduced graph exports and previous axiom evidence remain untouched.
The central RH inequality and full human proof remain open.

RESUME HERE: independently audit the exact coset Haar orientation
and common marked coefficient witness, then address mem_raises /
single-stage Schur-jet bounds and the lifted-chain archimedean height.
Integrate with RUN60 flag/depth and peer marked class injection and
HeckeSizes results; keep normalized name action and the actual gauge
chain and jet suppliers on the unresolved graph.
HANDOFF TO theta, integration, audit, kernel extractor.
-/

namespace AccelerationRun61

open Finset

theorem split_rank_product {R : Type*} [CommRing R] (q X : R) (k d : ℕ) :
    (∏ i ∈ range (k + d), (1 - q ^ i * X)) =
      (∏ i ∈ range k, (1 - q ^ i * X)) *
      (∏ i ∈ range d, (1 - q ^ i * (q ^ k * X))) := by
  rw [Finset.prod_range_add]
  apply congrArg ((∏ i ∈ range k, (1 - q ^ i * X)) * ·)
  apply Finset.prod_congr rfl
  intro i hi
  rw [pow_add]
  ring

theorem normalization_budget (h f r n0 nj nm : ℕ)
    (hh : h ≤ f) (hn : nj ≤ nm) :
    h * r * (nj - n0 + (r - 1)) ≤ r * f * (nm + r) := by
  have h1 : nj - n0 + (r - 1) ≤ nm + r :=
    Nat.add_le_add (le_trans (Nat.sub_le _ _) hn) (Nat.sub_le _ _)
  calc
    _ ≤ f * r * (nm + r) := Nat.mul_le_mul (Nat.mul_le_mul_right r hh) h1
    _ = _ := by ring

#print axioms split_rank_product
#print axioms normalization_budget

end AccelerationRun61

#check hecke_transfer_of_pairing
#check Data.IsGoodDatum.exists_hecke_transfer
#check Data.IsGoodDatum.exists_move_markOperator
#check Data.IsGoodDatum.gaugeLe_markOperator_pow
#print axioms hecke_transfer_of_pairing
#print axioms Data.IsGoodDatum.exists_hecke_transfer
#print axioms Data.IsGoodDatum.exists_move_markOperator
#print axioms Data.IsGoodDatum.gaugeLe_markOperator_pow
