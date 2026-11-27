import Mathlib

/-!
# RUN68 — period-to-exchange and exact small-side orbit elimination
27 Nov 2026. Human source-matched proof blocks, conditional on stated native
Fourier, unfolding and model lemmas; independent replay pending. Credit
Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
manuscript 52c0ccfd0dc525f446dd8bc935a7df71912c8709; RUN67 blob
f1b6b35d982b9005ce699d98617e8bfb5e7b46af. AGENTS, continuity, swarm,
handoff, expansion and latest peer RUN68 tame polynomial checkpoint
447982c785752da6f581649bc95135e71bbf350e inspected. Completion-first
compact target overrides old character-window detour.

## 1. Exact zero-orbit reduction at the actual descent caller
Source New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d,
exists_stdExchange_removing_planes, single-plane branch.
Lib/SiegelWeil/Tower/ConstantTerm.lean 14e85ad4886fc8d5c111a64e0c1fea3ca5232ef8:
constTermAt, constTermAt_smul_k, constTermAt_zero,
integral_thetaIntegral_lineRadical. Lib/Weil/MixedModel/EquivariantCoefficients.lean
9b779698c36ab64b5a1964a948cb7089587a3fce: ReadsAt.sourceTerm_localDatum.
Lib/Weil/DualPair/KernelDecay.lean 591247fdbe42900da1ac55c3c9d2ff733f235804:
name_eq_zero_of_invariant. Same-pin explanatory companion
grh/src/New/Determinant/Exchange/RemovingPlanes.lean
85102cccbc75cf76b0cac16f5abd6d1902f74e0a, lines 310–465
(homSlice_localDatum_stdColDatum, theta_zeroTerm_stdColDatum_eq_zero,
integral_thetaSmall_lineRadical_eq_mul_thetaSmall).

Let A split W' over W along one plane, U the unchanged smaller target,
z integral at the ramified places S, y rapid. Let f' be the local datum
with real y and the transpose of stdColDatum chi (z I'), read at conjugate
places, with I' the adapted projection to W. Put F_h=omega(A.levi(1,g),h)f'
using the actual rank twists in thetaSmall. Target boundedness justifies
the line-radical/Fubini formula:
  CT_A thetaSmall(W',U)(g) = integral_[U] sum_x constTermAt(A,x,F_h) dh.
Here x ranges over rational columns in U, not just primitive columns.
By central additive-character orthogonality, the summand is zero
unless x* J_U x=0. This is the definition of constTermAt, not a bound.

For nonzero isotropic x, Witt splitting X of U with X.k=x exists.
The term equals theta of the target zero-term of the A-source slice
at X.kAdelic (constTermAt_smul_k with scalar 1). The Levi slice law
moves h^{-1} X.kAdelic to the original datum. The adapted frame
relation I'=(I_star)^T and ReadsAt.sourceTerm_localDatum say that
every such original slice is a scalar times a real slice tensored with
the SAME smaller finite datum Psi(w)=stdColDatum chi z(w^T), at Sbar.
The scalar may be zero: if the finite slice coordinate is nonintegral
the term is already zero. No choice of a new finite datum.

For the remaining case put a=h^{-1}X.kAdelic. The functional
  ell = theta o zeroTerm_(X.homTarget W) o omega(g,h)
on the smaller source datum is invariant under all Heisenberg
translations associated to a and arbitrary row parameters, with
the source sign form included. Indeed conjugation by omega transports
them to translations along X.kAdelic, and the zero-term quotient mean
is invariant under translation. This is exactly varrho_pairWeil and
zeroTerm_rho_kAdelic in the compact proof.

On the support of Psi, z w^T is invertible over the local integers,
so w^T has a left inverse (z w^T)^{-1}z, hence w has a right inverse.
Consequently a_f^* w != 0: otherwise multiply by that right inverse
at a ramified component to get a_f^*=0 there. Since x is a nonzero
rational column, its image is nonzero at every completion and h
and the coordinate changes are invertible. S is nonempty and disjoint
from Sbar by the actual SplitTameChar/ReadsAt hypotheses. Do not use
this argument for arbitrary unramified data. This proves the support
condition of name_eq_zero_of_invariant without an estimate.

Human explanation of that native invariant-functional lemma:
the finite translation law acts by the additive character pairing
with the finite matrix (at the read places, with conjugation as in
ReadsAt). At each point of nonzero support, a nonzero pairing
coordinate allows a finite adelic parameter producing a phase
lambda != 1, by the nondegeneracy of psi_0. The phase is locally
constant. Partition the compact open Schwartz–Bruhat support into
finitely many disjoint compact open pieces on each of which one
chosen parameter gives a constant phase !=1 (refine a finite cover
of compact support). On that piece linearity and invariance give
  ell(f_piece)=lambda ell(f_piece), hence ell(f_piece)=0.
Sum over the finite partition. The actual compact proof performs
this cosetwise via hPsi.mem_of_cosets and the conductor separation
identity forall_psi0_mul_eq_one_iff. This proof needs the finite model
translation law and compact local constancy; no averaging an
uncontrolled infinite orbit and no false simultaneous choice of
a single phase for all support points. It gives the native scalar
vanishing for each real datum and vacuum tail, with disjoint read
places as above.

Thus all nonzero isotropic terms vanish; anisotropic terms already
vanish. The only surviving term is x=0. The zero slice formula has
the integral guard true at 0 and gives precisely the common nonzero
vacuumFactor v0, smaller finite datum z, realSlice A U 0 y and the
smaller rank twist. Integrating gives
  CT_A thetaSmall(W',U)(g) = v0 thetaSmall(W,U)(g).
This is the small-side input used in EqualRankValue, not the
large-side constant-term Tate integral. In particular the latter
does NOT obey the same zero-orbit rule. Together with the previously
reconstructed large-side identity gamma thetaLarge and norm transport
(RUN67), this establishes the one-plane exchange implication on
standard data. Induction composes slices and the cone maps; the
separate determinant-vector surjectivity remains required for the
nonzero reference argument, not for merely descending a given pair.

## 2. Period-to-exchange: the exact common multiplier
New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c,
stdExchange_of_periods; New/Exchange/ExchangeDifference.lean
05f961bbec79dda9700a60484436878c0205ad96, exists_isEquivariantLift;
New/Exchange/StandardCoefficients.lean 85616f797460e30c5134a146bd5220fadc28855c,
IsEquivariantLift.apply_stdColDatum_eq_zero; New/Exchange/NonnegativeVanishing.lean
fba2c16f367ff5db98339ec14bd32cfb2766a998.
Same-pin readable companion LargeTriple.lean
7f68573eed0b59e2b6d98325935e6567038b4741, lines 1013–1185.
Notation: D splits X over W1 with b planes, W1 rank n even, V'
rank b, V=V' plus W1. D1 is the further adapted line splitting of W1.
Keep both rapid vectors v,v', nonnegative real rho nonzero near 1,
and the full period hypothesis hc in the compact theorem (all tame
characters, each h, one p before universal B,z,beta,f,x,g,y).
Do not replace hc by an identity only at the identity element.

Cut rho off at the finite level: rho'(g)=rho(g_inf) if some integral
block element moves g_f into Kf, otherwise zero. Nonnegative and
nonzero near 1 (take block element 1). The actual unfolding in
stages theorem supplies R!=0, independent of tame character.
Set a=det(scaleIdele E * V'.x) and
  kappa=(vacuumFactor_large/vacuumFactor_small)*sqrt(|a|_A)^n.
Both vacuum factors and idele norm are nonzero. Standard row datum
of the adapted frame has scalar eps_chi with norm 1
(IntegralFrame.exists_stdRowDatum_eq_stdDatum, StableSpaces).
Define c_chi=R*kappa*eps_chi*nu.baseChange(a)*l_chi.
The two character factors have norm one, so
  |c_chi|=K|l_chi|, K=|R*kappa|>0.
This scalar is chosen once per character, BEFORE integral z.

## 3. Why the standard Fourier test is sufficient and where it is used
At the special integral frame L', let Dcal be the linear difference
thetaLarge - c_chi thetaSmall on the matched finite data space M.
exists_isEquivariantLift constructs this through the matching
linear factor, not by choosing unrelated partners. StandardCoefficients
requires vanishing of its centre coefficients at ALL parabolic points
in two classes:
 (i) T=J_V', q=scaleIdele E * V'.x * Y with Y_f*k in U(1)
     for some integral invertible k;
 (ii) T invertible and not represented by the signs of V'.
Retain all this quantification, especially q and g.

In (i) use the rational embeddings (1;0) and 1 in the large and
small targets, respectively. Their stabilizers are W1.Gamma and
the trivial group. This is verified by fixing the first b columns
and taking the orthogonal complement, and uses nondegeneracy of J_V'.
The coefficient equals the integral over the corresponding stabilizer
quotient. Unfold the large integral through U(V') x U(W1) with rho';
the smaller integral already has trivial stabilizer. The native
period identity hc applies at the real block of this unfolding.
At the finite block put x_f=y_f^{-1}Y_f. If x_f is not integral
both standard terms vanish. On the support, x_f*k is integral
unitary and k is integral invertible, hence x_f and its inverse
are integral. Thus det(x_f) is an idele unit off the empty set.
The two named finite vectors factor by eps_chi invOnUnits chi(det x_f)
and invOnUnits chi(star det x_f), respectively. The exact character
law (EquivariantCoefficients.invOnUnits_mul_div_star) cancels their
ratio with nu.baseChange.finPart(det x_f). Split det B into real
and finite factors; the real period denominator cancels the real
factor, leaving nu.baseChange(a) and sqrt(|a|_A)^n. Remaining
vacuum ratio is kappa, and unfolding contributes R. Hence the large
coefficient equals c_chi times the small one. If no integral block
can move the finite point into the cut-off support, an integral
nonzero term would produce such a block by integral Witt completion
(witt_Ohat_of_orthonormal); contradiction. Keep that integral
completion and the staged integral identity as explicit mathematical
inputs (not yet independent derivations here).

In (ii) the small coefficient is zero by the sum over rational
representations: any nonzero summand would represent T at every
real place. For the large coefficient, use either the stated slice
support exclusion, or the actual negative-sign weight theorem
centreCoeff_eq_zero_of_not_negative. If n=2N and q=negCount(s)<=N,
then negCount(-s)=2N-q>=N, and mu(tau)>0 gives
  N-mu(tau) < 2N-q.
This is exactly the strict weight guard of the sign theorem at
every tau, together with t'=-1, a positive line of s and the
rank-twist law. No extra inequality in mu and no assumption
that an indefinite Gram matrix is positive. The sign theorem
itself remains a retained stabilizer/Fock circle-averaging input.

Linearity of the Fourier coefficient now gives zero for Dcal at
every test pair. Apply the actual equivariant unimodular-vanishing
criterion to the single framed datum in M, obtaining
Dcal(stdColDatum chi z)=0 for every integral z. This yields the
desired exchange on standard pairs without dividing by l_chi
(which may vanish). The criterion uses weak approximation, Fourier
uniqueness, shears, partner support and Freitag reduction; its
underlying proof is not replaced by a scalar argument here.
Finally rk X=n+2b, rk V=n+b, so the SIGNED rank difference is n/2.
Put L=lValueProdInt chi(n/2)>0. With C=K^{-2},
  C |c_chi|^2 = |l_chi|^2 = L (|l_chi|^2/L).
This is the exact StdExchange norm law, with common C independent
of chi and z, even if l_chi=0. The proof applies to RUN67's
vanishing reference construction without dividing by that period.

## 4. Integration and retained frontier
Original local graph (source visible, not elaborated):
Carrier -> exchange_theorem -> exists_equalRankThetaRatio_value ->
stdExchange_of_periods + exists_stdExchange_removing_planes.
Period branch -> staged unfolding + framed coefficient formula +
character cancellation + sign/support exclusion + equivariant
unimodular criterion. Descent branch -> large Tate constant term +
small radical constant term + cone integrability + determinant
surjectivity. Reduced human graph expands small radical term into
central orthogonality, source slice, translation invariance,
full-rank support, finite phase separation and zero slice; expands
period branch as above. All shared dependencies preserved.
Context key: compact pin, adapted D,D1,A,X, signed rank, actual
tame character S nonempty/disjoint, common z, v,v', rho and period,
same quotient measures and frame L'. No new global pruning or
axiom evidence. Original and reduced native artifacts unchanged.
No URT premise. No local lean/lake/elan present (command -v checked).
No new rh_scan/prune/reduce/auto/frontier execution. Prior CI receipt
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
blob 23de197bd48f404ca2074c69676de289c4f7934e retrieved:
all_requested_checks_ok=true, full_RH_replay=false, earlier scalar
and named module checks only. No new PASS claimed. Prepared scalar
certificates below are not compiled and do not prove the analytic
or model inputs. No protected workflow modification.

RESUME HERE: derive the actual determinant-surjectivity primitive
surjOn_cone_integral_detVectors (native SquareLawFourier and its
imports), and/or the Fourier coefficient criterion's Freitag bridge
at StandardCoefficients.apply_stdColDatum_eq_zero. Coordinate with
geometry on circle averaging and integral Witt; keep staged unfolding
and large-side Tate/Gauss inputs on the ledger. Integrate the
small-side zero-orbit proof and common multiplier with RUN67.
Move to RowBalanced/Ribet only after checking peer supplier status.
HANDOFF TO integration/editor, geometry, literature, kernel, audit.
Full human-readable compact RH reconstruction remains incomplete.
-/

namespace CompactCharacterBoxes68

theorem phase_kill (lambda v : ℂ) (hl : lambda ≠ 1)
    (h : lambda * v = v) : v = 0 := by
  have hz : (lambda - 1) * v = 0 := by
    rw [sub_mul, one_mul, h, sub_self]
  exact (mul_eq_zero.mp hz).resolve_left (sub_ne_zero.mpr hl)

theorem right_inverse_support {R : Type*} [Ring R]
    (a w v : R) (ha : a ≠ 0) (h : w * v = 1) : a * w ≠ 0 := by
  intro hz
  apply ha
  calc
    a = a * (w * v) := by rw [h, mul_one]
    _ = (a * w) * v := by rw [mul_assoc]
    _ = 0 := by rw [hz, zero_mul]

theorem exact_period_norm (K L p c : ℝ) (hK : K ≠ 0) (hL : L ≠ 0)
    (h : c = K*p) : K⁻¹ ^ 2 * c^2 = L * (p^2/L) := by
  rw [h]
  field_simp <;> ring

#print axioms phase_kill
#print axioms right_inverse_support
#print axioms exact_period_norm
end CompactCharacterBoxes68
