import Lib.DiscreteSeries.CuspKernel.SchurOrthogonality
import Lib.DiscreteSeries.Rigidity.KernelFixes
import Mathlib.Tactic

/-!
# RUN74 — compact highest-vector projector and direct L² realization
27 Nov 2026. SOURCE-MATCHED human derivation / candidate replacement at actual
consumers, not new kernel verification or RH closure. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207 (grh-compact/src, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679).
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005; Main.lean blob
dbd5db70bc11b35f18fa5751216ab335321e7bfc re-read.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 (mandatory engine),
SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, continuity and main human manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 consulted. Observed branch head
4a59780336b5d459ab9dfff47a9af1b4a2e32a8f. RUN73 e91491fba9935d1ce83b448b6d1e9c02c328b41f
continued. Latest integration 847ff2e5 handles noncoherent theta exchange;
lead 88e0a9bc and editor 52a17e4e handle finite cutoff / Rallis; do not
duplicate. No global kernel-graph deletion.

Actual source anchors (relative to compact src):
* Lib/DiscreteSeries/CuspKernel/SchurOrthogonality.lean
  7be5411c2c4c3662db6f10be4c7fda7f63c27287:
  integral_mul_dsCoeff_translate, exists_smear_dsCoeffSmooth_eq,
  HCParam.HasLargeGap.exists_decay_bound, memLp,
  dsCoeff_schur_orthogonality, toL2_spec, isUnitaryCasimirGe_dsAction.
* Lib/DiscreteSeries/Rigidity/KernelFixes.lean
  b7c9218680d4848f11347c91dd6a952ee9b1a0ca:
  HCParam.IsKHighest.integral_conj_weightMinors_smul,
  integratedRep_eq_zero_of_notMem_rootCone,
  re_integratedRep_dsKernel_pos, coeff_eq_dsCoeff_of_isKHighest.
* Lib/DiscreteSeries/Holomorphic/HolomorphicExtension.lean
  2cfbf29e001ad5906736dcadbecc9a3cde9b538d:
  isHolOfWeight_coeffMap, IsHolOfWeight.integral_mul_conj_weightMinors.
* Lib/DiscreteSeries/FlenstedJensen/RepresentationDefs.lean
  94fea15fbc65ed74c2a44e83dda2cd423d39fbea: weightMinors, IsKDominant.
* Lib/DiscreteSeries/FlenstedJensen/KTypeProjection.lean
  f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a:
  integral_conj_weightMinors_mul_dsCoeff (RUN72/73).

## 1. Replace holomorphic extension at the COMPACT scalar projector caller

Keep the exact KernelFixes premises: continuous representation pi on a
complex normed space X with its supplied unitary/derived action, vector
x=iota(v), v K-highest of integral K-dominant weight nu for order -l,
and arbitrary continuous linear functional phi. K is the compact block
unitary group U(p) x U(q), with its actual probability Haar. No assumption
of irreducibility of the entire ambient representation or injectivity of
iota. If x=0 the identity is immediate. Restrict to K.

In each sign block order the indices increasingly by o=-l, so nu_1 >=
... >= nu_r (actual IsKDominant). Define a unit vector in the tensor
representation
  (det)^(nu_r) tensor product_(j<r) (wedge^j C^r)^(tensor (nu_j-nu_(j+1))).
The vector is the tensor of e_1 wedge ... wedge e_j and the unit
determinant vector. Its diagonal weight is nu, and E_ab, a<b,
annihilates it. Negative determinant powers are legitimate unitary
characters; the exponent differences are nonnegative. Tensor the two
sign blocks; the empty block contributes 1. The compact highest-weight
theorem says this vector generates a copy of the irreducible V_nu, with
one-dimensional highest-weight line. Its normalized diagonal matrix
coefficient (inner product linear in the second argument) is exactly
  m_nu(k)=product_blocks det(k_block)^(nu_r)
              product_(j<r) det(k_block[1:j,1:j])^(nu_j-nu_(j+1)).
Indeed wedge inner products are precisely the nested principal minors.
The finite expression agrees with the source finprod over integer
thresholds: the factors below the smallest weight cancel the determinant
in numerator/denominator; the remaining multiplicities telescope.
On block diagonal k, each threshold minor and determinant factor over
the two sign blocks. No division by a possibly zero proper minor.
For highest unit e in V_nu, m_nu(k)=<e,sigma_nu(k)e>; hence compact
Schur orthogonality with probability Haar gives c_nu=integral |m_nu|²
=1/dim V_nu >0, the actual kTypeNormSq.

Why x belongs to the same highest-weight type, even for the native
possibly infinite-dimensional X: for any compact irrep sigma let
P_sigma=d_sigma integral_K conj(chi_sigma(k)) pi(k) dk. If X is not
complete, perform this argument in its Banach completion; the continuous
embedding, compact action, and scalar phi extend there. The orbit of
each P_sigma x spans a finite-dimensional space: translate the character
inside the integral and expand chi_sigma(h^-1 k) as a sum of d_sigma²
fixed matrix coefficients with scalar h-dependent multipliers. The
standard compact orthogonality identities show this finite orbit space
is sigma-isotypic (not a claim about multiplicity of all of X).
P_sigma commutes with pi(K), hence with the Lie derivatives of x;
differentiation commutes with a fixed bounded operator. The derived
action and its complex linearity give the same diagonal weights and
annihilation by the same E_ab on P_sigma x. In the finite orbit space
use an invariant Hermitian form (Haar average of any positive form).
By finite-dimensional highest-weight theory a nonzero highest vector
of weight nu in a sigma-isotypic module requires sigma=V_nu.
Consequently P_sigma x=0 for all other types. Peter–Weyl separates
continuous compact orbit maps (apply scalar functionals and density
of matrix coefficients; equivalently the central finite-type
approximate identities), so x=P_nu x. No differentiability of a
whole Banach representation or convergence of an arbitrary Fourier
series is needed. The orbit of x is now finite-dimensional. In a
unitary decomposition as V_nu tensor multiplicity space, x=e tensor u
for a fixed multiplicity vector u. Schur orthogonality gives the exact
vector identity
  integral_K conj(m_nu(k)) pi(k)x dk = x / dim V_nu = c_nu x.  (P)
Applying phi proves the original scalar statement, with the original
normalization and same phi, not merely an identity for phi(x)=1.

This is a shorter human proof at THIS compact caller. It replaces
isHolOfWeight_coeffMap, its local inverse-function chart, complex
extension and circle mean by standard compact Peter–Weyl and
finite-dimensional highest-weight/Schur theory. These classical
theorems are explicit accepted-background candidates requiring audit;
not imported from the claimed RH root. The full holomorphic-extension
theorem is NOT deleted from other consumers, e.g. HolomorphicChamber
and nonconstant circle weights. Nor is RUN72 off-cone projection
replaced by (P): its two external arguments x,b are arbitrary G and
its off-cone information is stronger. The actual positivity and
off-cone integratedRep consumers both use (P) exactly as stated.

## 2. Global Schur identity from one compact average, then direct L²

Let G=U(diag eps) with native Haar (unimodular); psi=l.dsCoeff,
psi(1)=1, psi(g^-1)=conj psi(g), |psi|<=1. Keep the large-gap
hypotheses and the source integrability/decay conclusions. Write
c=kTypeNormSq and D=(integral_G |psi|²)^-1=formalDegree. The integral
is finite by memLp and strictly positive by continuity at 1 and full
support. RUN72 KTypeProjection gives
  integral_K conj(m(k)) psi(x k b) dk = c psi(x)psi(b).
For any integrable w with
  integral_K conj(m(k)) w(k^-1 y) dk = c w(y),
insert this identity into I_w(x,a)=integral w(y)psi(x y a)dy.
Left Haar substitution y=kz and Fubini (w in L1, bounded psi,m,
compact K) give I_w(x,a)=psi(x) I_w(1,a). This uses no factor from
the volume of K because its Haar is probability and the SAME c
cancels. For w=conj psi, the required weight identity follows from
psi(y^-1 k)=conj psi(k^-1 y) and the same K projection at (y^-1,1).
The substitution z=ya, then y=z^-1, gives I_w(1,a)=I_w(a,1).
Thus
  D integral_G psi(x y a) conj(psi(y))dy = psi(x)psi(a).       (S)
No pre-existing discrete series existence or irreducibility required.

Smear existence can also be stated directly. Take smooth nonnegative
compactly supported bi-K-invariant b positive near 1 (average a
nonnegative smooth bump over both K factors). Let beta(y^-1)=
b(y) conj(psi(y)). Its w satisfies the preceding K-average
identity, so its smear is psi times integral b |psi|², a strictly
positive scalar. Divide the bump by that scalar. Differentiating
a smear transfers right derivatives to its smooth compact bump by
Haar change of variables (native rightDeriv_smear). Thus the whole
generated module D_l is in the smear range. Retain the actual
norm-decay estimate for every member: for each allowed exponent c0,
|f(g)| <= K_f (2/||g||)^c0; the source proves this by applying
generator decay inside the compact smear and submultiplicativity.
Its integrability of norm powers and memLp follow by the native
volume-growth bound. Do not weaken those guards or replace by
finite-dimensional representation of the entire noncompact G.

Define Jf=sqrt(D)[f] in L²(G). Right translation R(a) is unitary.
The full inner product is immediately
  <Jf,R(a)Jh>=D integral_G h(y a) conj(f(y))dy.
For h=smear_beta psi, use (S) inside the compact bump integral:
  <Jpsi,R(a)Jh>
    = integral_G beta(z^-1) psi(a z) dz = h(a).              (E)
Fubini holds because the inner absolute integrals of
|psi(y a z) psi(y)| are <= ||psi||_2² by Cauchy–Schwarz and
right Haar, uniformly in a,z; beta in L1. This proves evaluation,
injectivity, ||Jpsi||=1 and |h(a)|<=||Jh||.

The derived action part of toL2_spec does NOT need the source's
simple-function density detour or vector-valued smear differentiability.
For a real Lie algebra element Y, put h'=dsAction(Y)h, again in
D_l and hence L². Pointwise fundamental theorem of calculus gives
  R(exp(tY))h-h = integral_0^t R(exp(sY))h' ds.
This equality holds in L²: translations are strongly continuous
(standard Haar L² translation theorem, or dominated convergence
using the retained polynomial decay on compact translates), the
Bochner integral exists, and Fubini on finite-measure compact sets
identifies the representative with the pointwise integral.
Divide by t and subtract h'. The norm of the remainder is bounded
by sup_(|s|<=|t|) ||R(exp(sY))h'-h'||_2, tending to zero.
Apply the fixed scalar sqrt(D) and translate by R(g) to get the
exact IsDerivedAction identities; complex directions are obtained
by complex linearity of the Lie algebra action. This proves all
three clauses of the actual toL2_spec under its retained premises.
It also provides the induced positive inner product without circular
appeal to isUnitaryCasimirGe_dsAction; the sign adjoint and Casimir
value are supplied by the original Lie and CasimirOnPsi laws.
KernelFixes.coeff_eq_dsCoeff_of_isKHighest consumes (E) directly.

## 3. Original versus candidate reduced frontier

Original source-visible paths from C comparison / member orthogonality
through local theta generation to KernelFixes:
  compact scalar projector -> isHolOfWeight_coeffMap ->
      exists_borel_chart / holomorphic circle mean;
  rigidity -> toL2_spec -> simpleFunc.denseRange / smear identity /
      hasDerivAt_smear, dsCoeff_schur_orthogonality and memLp.
Candidate replacements at these two consumers:
  compact scalar projector <- (P) <- compact PW / highest weight /
      explicit nested exterior-power coefficient / compact Schur;
  toL2_spec <- (S),(E), direct strong derivative <- same KTypeProjection,
      L1/L2 decay, compact smear range and Haar L² translation.
All old source paths and axioms retained. This is source-matched
mathematical reachability from the earlier lane path, not a new native
proof-value scan or deletion count. The actual HolomorphicChamber,
nonconstant circle mean and off-cone branches survive. No inference
from missing source matches. The original and compact root graphs
remain separate, all original CorG / arithmetic / prime discrepancy
obligations open as previously recorded. No use of original URT.

Local command -v lean/lake/elan returned no executables. Therefore
no native rh_scan/prune/reduce/auto/frontier or compile run here.
Actual existing compact CI receipt re-read: cathedral-research-state
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json,
blob 23de197bd48f404ca2074c69676de289c4f7934e,
all_requested_checks_ok=true, full_RH_replay=false, four scalar and
ten named native checks list propext, Classical.choice, Quot.sound.
Those are RootsOfUnityPoints, ModuleIndex, Heights and peer scalar
checks, NOT this file. Prepared checks below are not proof of (P) or
(E) or a claim to native PASS. No numerical test substituted for proof.

RESUME HERE: independently audit compact Peter–Weyl replacement (P)
at KernelFixes, then trace exists_integration_by_parts and the
actual re_integratedRep_dsKernel_pos consumer; check all other
HolomorphicExtension callers before any graph pruning. For native
replay, batch RUN69–74 exact source declarations and scalar adapters
in existing compact queue when resources allow; preserve all
unresolved original/reduced graph and axiom evidence.
HANDOFF TO integration/editor, independent audit and kernel extractor.
RH remains OPEN; weighted prime-window bound and mR<=fa(log b)^5
not established by this local result.
-/

namespace RHDependencyRun74

theorem normalize_schur (D s a b : ℂ) (hn : D * s = 1) :
    D * (a * (b * s)) = a * b := by
  calc
    D * (a * (b * s)) = (D * s) * (a * b) := by ring
    _ = a * b := by rw [hn, one_mul]

theorem cancel_compact_mass (c u v : ℂ) (hc : c ≠ 0)
    (h : c * u = c * v) : u = v := by
  exact mul_left_cancel₀ hc h

end RHDependencyRun74

#check @HCParam.IsKHighest.integral_conj_weightMinors_smul
#check @HCParam.IsKHighest.isHolOfWeight_coeffMap
#check @dsCoeff_schur_orthogonality
#check @HCParam.HasLargeGap.toL2_spec
#print axioms RHDependencyRun74.normalize_schur
#print axioms RHDependencyRun74.cancel_compact_mass
#print axioms HCParam.IsKHighest.integral_conj_weightMinors_smul
#print axioms HCParam.HasLargeGap.toL2_spec
