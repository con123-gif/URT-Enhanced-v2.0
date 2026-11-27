import Lib.SiegelWeil.RallisInner.SharpData
import Mathlib.Tactic

/-!
# RUN73 — clean nondefinite graph support and independent rational-phase audit
27 Nov 2026. Human source-matched derivation, conditional on the named native
model laws; no new kernel verification. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original pin 40e56bab026552e089d7afcfeff08d2defb9c005 unchanged in ledger.
Mission blob c960cfc62fc12f5c44f9327d0cd5507ab386c7ea (mandatory pipeline),
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, RUN72 read.
Peer a99f1fa85c8ca3ff309d839944c56c23b271e79d supplies native Siegel–Weil
bridge and both identity majorants; 6c46fb6e supplies shared absolute
unfolding. Do not repeat their convergence derivations. This is an
independent audit of the phase signs and the clean-graph leaf they retain.

## 1. Exact standard-character adjustment, including finite places
Source Lib/Adelic/Adeles/AdditiveCharDefs.lean blob
728f522d61a606eb68ec5ed337cf1dbc2c515463, defs ψf, stdAddChar, ψf_eq.
The native character ψ_E is exp(-2πi sum 2 Re z_w) at infinity and
exp(2πi Tr_E/Q a) at finite z with z-a integral. Let F be the maximal
real subfield and ψ_F^0 the canonical trace character of A_F with the
same sign convention. Then ψ_E(z)=ψ_F^0(Tr_E/F z).
At finite places choose a∈E with z-a integral (native strong
approximation). The trace of an integral finite adele is integral
over F, also at ramified and dyadic places. Hence Tr a is a rational
representative for the finite trace and transitivity of field trace
gives the equality. At infinity it is exactly the sum of 2 Re.
In particular ψ_E(bar z)=ψ_E(z) and ψ_E|A_F=ψ_F^0(2·).
The peer's choice ψ_F=ψ_E|A_F is nontrivial and valid for the Weil
pairing. If one insists on Liu's canonical standard character instead
of its 2-multiple, apply his theorem to the rational Hermitian space
with Gram 2J_T: its unitary group, rational matrix points, action by
pullback and quotient Haar are UNCHANGED. Its Fourier pairing is
 ψ_F^0(Tr_E/F(2 tr(X* J_T Z))/2)=ψ_E(tr(X* J_T Z)).
Its radical phase is ψ_F^0(tr(b X* (2J_T) X)/2)
 = ψ_E(tr(b X* J_T X)/2), since that trace is self-adjoint.
If the conventional archimedean sign is opposite, use -2J_T instead
with the opposite trace character (or conjugate the whole equality).
No alteration of the native datum or rational lattice, no additional
Haar volume factor; choose the self-dual Fourier measure for the
matched pairing. This avoids needing a general theorem about changing
the additive character in the cited Siegel–Weil statement.
Publisher Liu 2011 pp.858–859, PDF pages 11–12 zero-based visually
inspected this run, https://msp.org/ant/2011/5-7/ant-v5-n7-p.pdf .
Theorem 2.1(1) is stated for Schwartz φ, m>2r, s0=(m-r)/2, target
quotient probability Haar; coefficient 1, not 2. Do not use Prop 2.3
for general rapid y. This audit addresses the standard-character
convention; other model axioms remain explicitly retained.

## 2. Independent check of symplectic orientation
PairSplitting.lean blob 7060d2715dc64318e5f657357bce32c32bf11772,
sourceTerm_varrho (284–288), sourceTerm_levi and sourceTerm_radicalElt;
BesselIntegral.lean b7eb71106debb76e1b97526f7c540b7d4d28bed8,
homBicharacter_eq; AdelicHeisenberg.lean 6d56fe0aa1762a56778d40f9086f69e721f91b14.
Use the peer's complete k,l frame and rational coordinates,
A=Yk, C=-jYl; pairing B(C,X)=ψ_E(tr(C*J_T X)).
For exponents work with real trace b(C,X)=Tr_E/F tr(C*J_T X),
a symmetric F-bilinear form. Native T(A,C) has phase
b(C,X+A/2) and shift X↦X+A (composed with ψ_F^0).
Composition gives residual (b(C',A)-b(C,A'))/2 exactly.
Conjugation by M_z (quadratic multiplier with phase
Tr tr(z X*J_TX)/2) changes C to C-Az, because expansion of the
quadratic at X+A cancels the X-only terms. Levi pullback X↦Xa
changes (A,C) to (Aa^-1,Ca*). For positive Fourier F,
substitute W=Z+A in the transform of T(A,C)f:
 b(X,W-A)+b(C,W-A/2)
 = b(X+C,W)-b(A,X+C/2).
Thus F T(A,C)=T(C,-A) F, not T(-C,A) F. In the k,l basis
B0=diag(I,-jI), B0* (-j^-1 H0) B0=[[0,I],[-I,0]],
H0=[[0,I],[I,0]]. The upper radical transforms to [[I,z],[0,I]].
These are exactly the three covariance laws of a99f1fa8 §3 and
the generator formulas on Liu p.858. The scalar phase argument
then needs one vector with nonzero theta, not positivity of vacuum:
if theta(v)=lambda_gamma theta(v), theta(v)≠0 ⇒ lambda_gamma=1.
Retain the peer's density, continuity, nonzero functional, classical
rational invariance and full Heisenberg irreducibility hypotheses.
No claim the entire native bridge has been independently audited.

## 3. Actual nondefinite clean graph annihilator
SharpData.lean blob ea9f665a9a89411f1353d098ff2e0a4e59a719f5,
IsClean, graphSplitting, exists_graph_eq_of_zeroTerm_ne_zero (115–140),
inner_product_formula (150–196). KernelDecay.lean blob
591247fdbe42900da1ac55c3c9d2ff733f235804, coordMatrix,
mul_coordMatrix_ne_zero, name_eq_zero_of_invariant (60–72).
Let L have complete frame (K,K') in S⊕(-S), Gram identity
K*J_S K=K'*J_S K', stacked frame injective. Suppose K'c=0 for a
nonzero rational column c. Then v=Kc≠0, since the stacked frame
is injective. In the definite case v*J_Sv=0 forces v=0, contradiction.
In the general case use exactly the native IsClean disjunct
 f=name_A(Ψ,f0), A∩bar A=∅, Ψ Schwartz–Bruhat, each nonzero value
 has a matrix with left inverse at the SAME place w.
Define bounded functional
 ℓ(u)=E_L(doubleDatum(f', pairWeil(S,T,a,b,(g,1))u)).
The native zeroTerm_rho_kAdelic is invariant along the first
isotropic frame of Hom(S⊕(-S),T). The row (Kc, K'c) is (v,0);
the k-coordinate identity in the actual caller is
 c* D.lCoord = [ (S.coordMatrix(1,v))* stdForm_S , 0 ],
with rational entries embedded adelically. Transport through
pairWeil Heisenberg covariance and the box product rho action.
The zero second component makes the operator on the f' factor the
identity; no phase from a second nonzero component. This yields
 ℓ(ρ(matToVec(X z Y* stdForm_S))u)=ℓ(u) for every adelic z,u,
 X=T.dualFrame^-1, Y=S.coordMatrix(g,v).
These are exactly the arguments used at SharpData lines 129–137,
not a new invariant subspace assumption.

The source nonzero support check now has a direct proof. At w the
adelic invertible matrices g^-1,S.x^-1 and X* remain invertible,
and v≠0 remains nonzero under field embedding. Hence Y_w≠0.
If X_f* M Y_f=0, evaluate at w, cancel X_w*, and apply the given
left inverse of M_w; this would give Y_w=0. Therefore
 X_f* M Y_f≠0 for EVERY M=vecToMat(y) with Ψ(y)≠0.
No uniform lower bound on its norm, and no right inverse of M needed.

Here is the character argument underlying name_eq_zero_of_invariant,
so that this step need not be an unexplained geometric vanishing.
For fixed y in nonzero support, choose one matrix entry of
 X_f* vecToMat(y) Y_f nonzero. Its finite-adelic scalar is the
 dot product star K · y in KernelDecay lines 63–66 with
 K_(i,j)=X_(i,i0) conjugate(Y_(j,j0)).
Some integral test multiplier v0 and finite adele u0 make
 ψ0(u0 v0 (star K · y)) ≠1:
 choose u0 to make the nonzero component nonintegral, then apply
 native self-duality forall_psi₀_mul_eq_one_iff. The supported
 Heisenberg shift in source line 71 is the single (i0,j0) coordinate
 (0, α idem_A star(u0 v0)). By ϱ_name and
 IsSchwartzBruhat.schrodingerAct_star, it acts on the named coset
 indicator by multiplication by the character
 λ(x)=ψ0(u0 v0 (star K · x)), in the source convention.
The conjugation-disjoint support guard is essential for this pure
 modulation action. λ is locally constant, so on a neighborhood
 U of y it is the same λ(y)≠1. For each native coset indicator
 supported in that neighborhood, bounded ℓ invariance gives
   (λ(y)-1) ℓ(name_A(indicator,f0))=0.
Thus its value is zero. IsSchwartzBruhat.mem_of_cosets (actual
KernelDecay proof calls this) implies ℓ(name_A(Ψ,f0))=0:
one may decompose the compact locally constant support into
finitely many small cosets subordinate to the neighborhoods.
This retains the native naming, supported modulation, self-dual
lattice and coset decomposition facts, but requires no quantitative
height estimate or general rapid-decay argument for this caller.
It contradicts the hypothesized nonzero zero term.

Consequently K' injective and square, hence invertible. Put
δ=-K(K')^-1; direct Gram cancellation yields δ*J_Sδ=J_S.
Then L={(δu,-u)} by substituting c=-(K')^-1u. This is the native
graphSplitting with argument δ; the caller's existential is indexed
by δ^-1. Graph labels unique from the second projection. No
assumption all isotropic subspaces are graphs in indefinite signature.

## 4. Connected consequence and evidence boundary
At the actual inner_product_formula caller, the graph support now
follows from the explicit invariant-character argument above;
use the identity-only bounds and equality of a99f1fa8 after audit,
then absolute unfolding of 6c46fb6e, on the SAME d(g,g').
This only retires the nondefinite graph leaf in human exposition
conditional on the exact model laws; graph evaluation,
doubleDatum normalization, dual finite datum, noncoherent pair
bound and full original native graph remain preserved.
Local original edges: inner_product_formula ->
{exists_graph_eq_of_zeroTerm_ne_zero, zeroTerm_graphSplitting,
siegel_weil, theta_normalisedTorus_le, quotient unfolding};
graph support -> {coordMatrix, mul_coordMatrix_ne_zero,
name_eq_zero_of_invariant, zeroTerm_rho_kAdelic, omega-rho covariance,
rho_boxProd, full frame, Gram}. Reduced human support path:
stacked kernel contradiction -> transported invariant functional ->
one nontrivial finite character on each local coset -> exact graph.
Context key: compact pin, S,T,L,K,K',g,f,f', same A,Ψ,w, native
character, actual frame and naming law. No global edge/axiom deletion.
The broader noncoherent pair and A/C primitive obligations remain OPEN.

Actual local command -v lean/lake/elan returned no path. SymPy
executed 5 exact identities: scalar cocycle, radical covariance,
Fourier shift sign, 2×2 skew-form conjugation, 2×2 radical
conjugation. All assertions succeeded; these are scalar/block
checks only, not a replay of the adelic source. Reproduce with
P(a,c,x)=c*(x+a/2): expand P(a,c,x)+P(b,d,x+a)-P(a+b,c+d,x)
-(d*a-c*b)/2; expand z*x^2/2+P(a,c,x)-z*(x+a)^2/2-
P(a,c-a*z,x); expand x*(w-a)+P(a,c,w-a)-((x+c)*w+P(c,-a,x)).
For blocks use B=diag(1,-j), Bstar=diag(1,j), H=[[0,1],[1,0]],
check Bstar*(-H/j)*B and B^-1*[[1,-z/j],[0,1]]*B.
Old-pin native CI actual status.json receipts b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved; pass,
runs 45577239749,45576756833. Conditional root axioms propext,
Classical.choice, Quot.sound; bounded scan 324 pending. No new
native rh_scan/prune/reduce/auto/frontier execution or PASS.
Prepared algebra certificates and source probes below.
RESUME HERE: use actual exists_dual_datum (SharpData 245–285),
check z valuation and exact Fourier annihilator at each enlarged
finite set, then connect sharp partialIntegral nonvanishing.
Audit native graph evaluation and retained noncoherent pair.
HANDOFF TO integration/editor, positivity, literature, audit, kernel runner.
RH and the prime-window bound remain open.
-/

namespace CompactLandauRun73

theorem phase_annihilator (l v : ℂ) (hl : l ≠ 1) (h : l * v = v) :
    v = 0 := by
  have h0 : (l - 1) * v = 0 := by rw [sub_mul, h, one_mul, sub_self]
  exact (mul_eq_zero.mp h0).resolve_left (sub_ne_zero.mpr hl)

theorem fourier_phase_sign (x a c w : ℝ) :
    x * (w-a) + c * (w-a/2) = (x+c)*w - a*(x+c/2) := by ring

theorem radical_phase_cancel (x a c z : ℝ) :
    z*x^2/2 + c*(x+a/2) - z*(x+a)^2/2 = (c-a*z)*(x+a/2) := by ring

#print axioms phase_annihilator
#print axioms fourier_phase_sign
#print axioms radical_phase_cancel
end CompactLandauRun73

#check Space.coordMatrix
#check Space.mul_coordMatrix_ne_zero
#check name_eq_zero_of_invariant
#check exists_graph_eq_of_zeroTerm_ne_zero
#check zeroTerm_graphSplitting
#check inner_product_formula
#print axioms name_eq_zero_of_invariant
#print axioms exists_graph_eq_of_zeroTerm_ne_zero
#print axioms inner_product_formula
