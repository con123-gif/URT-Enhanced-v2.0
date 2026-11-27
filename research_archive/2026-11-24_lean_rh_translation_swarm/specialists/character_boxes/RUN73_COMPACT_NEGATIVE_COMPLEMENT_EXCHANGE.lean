import New.Exchange.LowRankIdentity
import New.Rows.Carrier

/-!
# RUN73 — negative-complement rank-one rotation and the actual exchange callback

27 Nov 2026. SOURCE-MATCHED human derivation; native certificate prepared,
not executed. Mission blob 7b03ba9740905da93d1cd7cd9d8036c400faeb03,
completion-first compact route. Source lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207 (also latest observed source
commit); grh-compact, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original mirror latest observed 7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc;
original 40e56bab archive unchanged and not mixed with compact evidence.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Prior RUN72 1f40f70748680f36a26500d0ed02e9f3eab683b7, RUN71
09c0f4ff. Latest compact manuscript blob bff8e0abac557928fb1efd193293f07ebe00a30d.
Recent peer titles checked: d4c26f66 (Galois signed depth), a1866e42
(doubling phase), a4953d93 (polarization), 5b49b9ab (A transfer degree),
1ae8974a (clean graph); no duplicate of the following local rank-one
coefficient argument in those titles. This is not full peer audit.

## 1. The missing nonrepresented branch, not a new assumption

New/Exchange/NonnegativeVanishing.lean blob
fba2c16f367ff5db98339ec14bd32cfb2766a998:
centreCoeff_eq_zero_of_not_negative. Let q_s=negCount s,
q_t=negCount t, p_t=negCount(-t), b the splitting dimension.
The exact hypotheses include q_s=b+q_t, a positive target sign i,
mu(tau)<p_t at all real places, delta=nu*upsilon^b, invertible
rational hermitian T not RepresentedBy(-1), and HasIntegrableTerms.
We must show the coefficient at jT is zero.

The actual source coefficient expansion is indexed by rational x with
x* J_Y x=T; if none, its sum is empty. Otherwise at a place tau
where T is not negative definite, invertibility implies a positive
eigenvalue. Write w=atRealPlace(Y.x^-1 x). Pick v with
v* w* J_s w v=1. Witt extension, with the existing nonsingular
standard involution, supplies u in U(J_s) with u w v=e_i.
Keep this rational-to-real coordinate bridge and the same x.

Put W=u w. Let P_- be the orthogonal coordinate projector onto
the q_s negative target axes. Because Wv=e_i is positive,
P_- W v=0 and v is nonzero. Consequently

    rank(P_- W) <= b-1.

For EACH coherent-state coordinate y at tau, let Y_- consist of
its q_t negative-source columns (all target rows, then project).
The rank of [P_- W | P_- Y_-] is at most b-1+q_t=q_s-1.
Thus its orthogonal complement within the negative target space
has dimension at least one. Choose a unit column r there and put
P=r r*. It obeys P^2=P=P*, P W=0, P Y_-=0 and P_+ P=0.
This supplies exactly the row-vector r in the native local K proof
(up to taking conjugate transpose). Unlike a dimension-only
assertion this explicitly gives both frame and coherent-vector
constraints. It uses b>=1, which follows from existence of the
positive direction in the represented T. No uniform choice of r
over all coherent states is needed. No false claim that one r
annihilates the whole Fock space.

## 2. A one-circle holomorphic mean kills the functional

The compact rank-one rotation c_eta=I+(conj(eta)-1)P, |eta|=1,
acts by conj(eta) on r and 1 on its complement. It is unitary
for the standard indefinite form, belongs to maxCompactU s
and fixes W. Its negative block determinant is conj(eta) and
its positive block determinant is 1. Set m=p_t-mu(tau)>0, an
integer. The native formula realPairWeil_polyVector on the vacuum
and weilRep_heisOp give, in precisely this circle orientation,

    Omega(c_eta) rho(y)vac
       = eta^m rho(y+(conj(eta)-1)z)vac,
    z = P y at tau, zero at other places.

Retain the exact native real Weil covariance/vacuum formula
rather than deriving a phase merely from projective covariance.
Because P kills the negative-source columns, z lies on the
holCoord fixed part used by the source. Because c_eta is unitary
for the ordinary positive norm, the realVac factor is constant.
The explicit heisOp_apply, beta_mul_realVac and holCoord formula
used in the native proof therefore give for each model evaluation
at a fixed evaluation point a scalar of the form
eta^m A exp(B eta) on the unit circle; A,B depend on y, the
evaluation point and P, not eta. Equivalently the remaining
evaluation factor extends holomorphically over the closed disk.
In particular the circle average is zero by the mean-value
identity (the value at the origin is zero because m>=1).
This is the exact native integral_toCircle step; do not interchange
an unproved vector Fourier expansion with a quotient integral.

Let ell be any bounded linear functional invariant under the
compact stabilizer of W. Its value on rho(y)vac equals its value
on each of these rotated vectors. The Bochner average over this
circle is zero, since each bounded model evaluation commutes
with the integral and separates Fock vectors. Apply ell to it:
ell(rho(y)vac)=0. The coherent-state determining family
(hom_ext in native K) proves ell=0. The strict m>0 is essential:
m=0 and B=0 leaves the constant term. This is a human proof of
the actual K step using the named Fock and evaluation laws,
not a new proof of those background laws.

## 3. From local vanishing to the global coefficient

Take H=stabilizer of x' in the target adelic group; it is closed.
Native centreCoeff_eq_integral_stabilizer (under integrable terms
and invertibility) writes the coefficient as a stabilizer quotient
integral. Let U carry u^-1 at tau and identity elsewhere.
Conjugate the maximal compact group by U and intersect with H;
call the resulting compact subgroup C. It contains all the
rotations from section 2 after conjugation. The normalized compact
Haar probability kappa and the original stabilizer Haar measure
are distinct. Right translation by C preserves the latter:
the modular character restricted to a compact subgroup has
compact image in the positive reals, hence image {1}.
The quotient averaging identity from the native
integral_quotMeasure_eq_zero_of_mean may now be used with its
integrability and rational transport hypotheses retained.

For fixed k in H, average the theta functional
T(c)=theta o pairWeil(Z,Y,nu,delta)(1,k c U) over C.
Right Haar invariance shows that its restriction to each real
datum with fixed finite partner is invariant under the compact
stabilizer of W. By section 2 it is zero. Native ext_integrated
extends this to the full integrated datum (keep this determining
family and boundedness). Thus the compact mean of the integrand
vanishes for every k; the quotient averaging identity gives
zero coefficient. This uses the native sourceTerm_levi
covariance and not an unjustified interchange over a noncompact
stabilizer. Together with the empty-rational-orbit case, this
supplies the sign-based alternative in the actual caller.

## 4. Attach at stdExchange_of_periods, including both branches

New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c,
thetaTerm_stdDatum_spec and stdExchange_of_periods.
For the SAME rapid v,v', fixed rho>=0 and rho nonzero near 1,
the given real period identity hc supplies an l(c) and carries
the exact archimedean determinant factor. Native
exists_integral_stages_eq_mul supplies R independent of tame
character; kappa is the ratio of the two adapted vacuum factors
times sqrt(ideleAbs(scaleIdele V'.x).det)^card n.
The candidate difference is the IsEquivariantLift difference
with factor R*(kappa*epsilon*nu.baseChange(a)*l(c)).
Here epsilon is the native standard-row normalization, NOT
the RH error parameter. Keep it and the native Hecke/idele
norm identities, and the finite standard partner factorization.

For the represented/unimodular coefficient callback h0 of
StandardCoefficients.lean (85616f797460e30c5134a146bd5220fadc28855c),
RUN72 supplies the same finite orthonormal frame via Landherr.
The small side orbit x0=I and large side x0=(I;0) have
stabilizers {1} and U(W1) respectively, as checked by the
native centreCoeff_eq_integral_stabilizer. The hc period equality
then identifies the two orbit integrals using exactly the same
real B, finite x=y_f^-1 Y_f and Levi point; no independent
character choices. If x is not integral both terms vanish;
if integral, x*k unitary and integral frame imply det x is
a finite integral unit. This permits the native finite identity
invOnUnits_mul_div_star and the determinant block factorization
of namedVector. The nonzero compact-window case uses the
same R supplied above; the outside-window case is zero by
witt_Ohat_of_orthonormal, as in the source. Keep these precise
finite and real period suppliers; this is a callback assembly
and does not purport to prove hc for arbitrary v.

For a coefficient off the real class, the small side vanishes
by thetaTerm_stdDatum_spec: the real slices have represented
Gram (square frame), so each term is zero. On the large side
the same lemma suffices under the first hz support alternative.
In the second hz alternative t'=-1, s has a positive sign
and 2 negCount s<=card n. The native rank-twist identity
rankTwist_eq_mul_of_splitting and weight_pos give exactly
hgamma in section 1; target negCount of V'.sum W1 is
card b+negCount s, so the rank hypothesis is exact.
Apply sections 1–3; both coefficients are zero.
This is the missing off-real-class callback; both branches
now enter apply_stdColDatum_eq_zero with all h0 quantifiers.

RUN70–72 give the remaining Freitag comparison and partner
generation chain subject to the retained geometric premises.
Thus the standard-datum identity follows at stdExchange_of_periods.
The supplied scalar relation is the native
C*|c|^2 = L_int(rank V - rank X/2) * (|l|^2/L_int(rank W1/2)),
not an equality of phases or an independently chosen normalization
per standard z. Retain the scalar simplification and R,kappa,
epsilon, norm of the tame character and the common l(c).

## 5. Actual C consumer and remaining primitives

New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d:
exchange_of_partners consumes StdExchange, the zero-term descent,
the real top-of-tower supplier exists_stdExchange_top, the flip
identity, and standard-partner span. RUN67–69 cover the descent
and double-exchange algebra, subject to their premises.
New/Exchange/ExchangeTheorem.lean 608b4f61af27d780e24f799937a836ecd3c1d50a
gives exchange_theorem with fixed C0/C and rapid x before all tame
characters, using exists_equalRankThetaRatio_value. Carrier.lean
f0b7f97f299904aa73a928432147a932cac9be40 explicit_matching uses
that theorem with weight |l|-|iota|, one real Q0 and kappa from
real_matching (599047edd68ecb3b1295710bdcf4ef6641f31af5). Its
scalar c'=kappa(x)/c has |c'|^2=|kappa(x)|^2/(C L) before the
fixed rank-zero volume factor. The rank-zero specialization
stdClassSum_det_modKernel_eq is the actual C critical-period
consumer from RUN65–66. Do not divide by a possibly zero
kappa; the native nonzero exchange c and positive L permit
the displayed division, and rank-zero nonzero constant is
then forced by the class-sum identity equal to 1.

Original source-visible graph:
Carrier -> exchange_theorem -> exchange_of_partners ->
stdExchange_of_periods -> {hc, hz, standard coefficient
callback, nonnegative vanishing, stage integration}.
Reduced human local graph replaces the K dimension contradiction
by rank-nullity and the local Fock vanishing by a circle mean;
other edges remain, in particular the exact real period/top
supplier, finite partner and stage-Haar constants, and all
arithmetic C/row/Selmer obligations. Not a native graph retirement.
Context key includes pin, E, s,t,b, tau, T,x,u, each coherent y,
same real and finite partner, weight m and quotient Haar. The
proof must not import Main or New.grh. No URT.

Local command -v lean/lake/elan returned no executables.
Latest actual shared receipt re-read from cathedral-research-state:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named checks,
standard three axioms, one module timeout124, all_requested_checks_ok=false,
full_RH_replay=false. This run is source retrieval and human algebra,
not native rh_scan/prune/reduce/auto or a new CI PASS. Below is a
prepared exact scalar budget and source probes; shared runner to replay.
No original/reduced graph or axiom evidence overwritten. No workflow
or registry modifications.

RESUME HERE: check the actual hc supplier exists_stdExchange_top
(real slice period identity, common rho and rapid datum) and the
finite standard-row normalization identities at the precise
stdExchange_of_periods callback; use this rank-one vanishing
rather than repeat its proof. Integrate the whole exchange branch
into the C rank-two critical determinant period with RUN65–72.
Audit the source Fock phase, compact averaging hypotheses and
real period normalization independently; retain other C gaps.
HANDOFF TO integration/editor, literature, formal audit, native runner.
Human RH reconstruction remains incomplete.
-/

namespace CompactCharacterBoxes73

theorem negative_complement_budget (b q : Nat) (hb : 0 < b) :
    b - 1 + q < b + q := by omega

theorem residual_dimension_positive (b q r s : Nat)
    (hb : 0 < b) (hr : r ≤ b - 1) (hs : s ≤ q) :
    0 < b + q - (r + s) := by omega

theorem explicit_matching_scalar {a C L : ℝ} (hC : C ≠ 0)
    (hL : L ≠ 0) : a / (C * L) = (a / C) / L := by
  field_simp

#check centreCoeff_eq_zero_of_not_negative
#check thetaTerm_stdDatum_spec
#check stdExchange_of_periods
#check IsEquivariantLift.apply_stdColDatum_eq_zero
#check exchange_of_partners
#check exchange_theorem
#print axioms centreCoeff_eq_zero_of_not_negative
#print axioms stdExchange_of_periods
#print axioms exchange_theorem
#print axioms negative_complement_budget
#print axioms residual_dimension_positive
#print axioms explicit_matching_scalar

end CompactCharacterBoxes73
