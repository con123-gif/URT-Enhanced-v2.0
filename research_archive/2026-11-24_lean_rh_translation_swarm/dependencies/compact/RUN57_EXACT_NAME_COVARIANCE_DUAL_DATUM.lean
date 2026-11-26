import Lib.SiegelWeil.RallisInner.SharpData
import Mathlib.Tactic

/-!
# RUN57 — exact named-model covariance and dual-datum cutoff at C caller
26 November 2026. Dependency lane (old 12; compact 13).
Source-matched HUMAN reconstruction; executable scalar certificates prepared,
NOT compiled. No import of Main or claimed RH theorem.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (binding
primitive-closure and compact migration read); manuscript
d185408f9b17703c84b1584444bfde1f65d57e74; last observed peer head
747e921938e8cd14a5aa4e4362bedf1fbc15b888.
Predecessor c03ab6dcc5da35229608d6d65ed9848d1e7903a4.
Peers 5c9704e4 (depth layers), 03380f28 (marked orbit),
cd6be32e (Ribet valuations), e7cdaea4 (label-specific cut),
c394200f (packet mass), 727c85e5 (tested-form cut), 8f0558ca
(audit erratum). Distinct from this local theta dependency.
Protocol, handoff, AGENTS and continuity inspected.

## Exact compact source ledger (relative to grh-compact/src)
Lib/Weil/MixedModel/AdelicSum.lean 49baa2583b79e2ffc4fff7dc791415866c03071d:
  IsSchwartzBruhat, schrodingerAct (90), eq_sum_cosetIndicator (130),
  mem_of_cosets (151), idem_mul_star (174), schrodingerAct_schrodingerAct
  (182), schrodingerAct_star (207), exists_schrodingerComb_eq (218).
Lib/Weil/MixedModel/Names.lean 7dc9e83b6974266a3ed74a0ab24b47ec63a3e953:
  heisenbergComb, name, dataInner_heisenbergComb, name_schrodingerComb,
  name_schrodingerAct_boxIndicator, ϱ_name (98).
Lib/Weil/DualPair/KernelDecay.lean 591247fdbe42900da1ac55c3c9d2ff733f235804:
  name_eq_zero_of_invariant (60), exists_norm_name_le (80).
Lib/Weil/Construction/Projections.lean 7a187f8be18a00b889082b56818393f20a7f88e4:
  omega_finHeisOp (61), dataInner_finHeisOp (35), finHeisOp_comm
  (111), finHeisOp_projOn (122), dataInner_projOn (126), ω_projOn
  (169), projOn_ω (194).
Lib/Weil/DualPair/PairSumNegation.lean d2f45383d2e972574a7e749da0f2b4bb9283c6da:
  projOn_pairWeil (81).
Lib/SiegelWeil/RallisInner/SharpData.lean ea9f665a9a89411f1353d098ff2e0a4e59a719f5:
  exists_graph_eq_of_zeroTerm_ne_zero (115), exists_integral_isotropic_frame
  (235), exists_dual_datum (245--284).
Lib/Weil/CompactLift/RallisFormula.lean 8d41f50fc88d20a40531973b916aaac7491b8e72:
  integral_eq_zero_of_lift_eq_zero (221--228), actual cutoff consumer,
  realConv_eq_zero_of_lift_eq_zero (236).
Readable companion not substituted for compact proof.

## 1. Exact covariance, including the conjugate-place phase
Let e=idem P, e*=idem conjugate(P), so ee*=0 and e+e*=idem
P.conjClosure. This is the split-support hypothesis, not a general
identity on arbitrary P. For y a finite vector, define
  A(y)Psi(x)=psi0(half * star(y) dot e(x+(x+y))) Psi(x+y).
If y=e* u then ey=0, so Psi(x+y)=Psi(x) by idem_smul.
The phase becomes psi0(star(u) dot ex), since star(e*u)=e star(u),
e^2=e and 2*half=1. Thus A(e*u) is multiplication by that exact
character, with no extra half and no translation of Psi.

For general y, A(y)A(z)=beta((e+e*)y,(e+e*)z) A(y+z),
the native schrodingerAct_schrodingerAct law. The corresponding
Heisenberg translates H(y)=rho(finVec((e+e*)y)) have the SAME
cocycle, not the differently normalized finHeisOp law.
Write P0=projOn P and B=boxIndicator P.
The native range lemma expresses every Schwartz--Bruhat Psi as
a finite linear combination of A(z)B. The definition of name uses
a chosen generalized inverse, but its value on these finite
combinations is independent of that choice: the identity
  <heisenbergComb(c)f,heisenbergComb(c')f'>
    = localInner(schrodingerComb(c),schrodingerComb(c')) <P0 f,P0 f'>
implies that a coefficient difference in ker schrodingerComb
has zero squared norm and therefore zero operator value.
It follows that name(A(z)B)f=H(z)P0f. Applying the matching
cocycle on each summand and using linearity gives
  H(y)name(Psi)f = name(A(y)Psi)f.
This derives the exact native ϱ_name consumer with the
normalization intact. Retain the native inner-product identity
(dataInner_heisenbergComb), whose Fourier-box proof is a separate
supplier, rather than inferring it from covariance alone.

## 2. One uniform finite-coset decomposition and the detector
Correction/precision to RUN56: support is compact only AFTER
projection x -> e x, not necessarily in the entire finite
adelic vector space. Let C be the native compact set containing
those projected support points. For each nonzero projected point,
choose a neighborhood on which Psi and the selected detecting
phase are constant; for zero points choose a neighborhood
on which Psi is zero. The Lebesgue-number argument on C produces
one neighborhood W of 0 such that each sufficiently small
translate in C lies in one selected neighborhood. Compactness of
the standard lattice and the finite-adele topology supply one
positive integer N with N*Ohat^n inside W. This integer is a
finite idele t. The relevant open subgroup is t*integralBox(P);
its quotient is discrete. The compact projected support has
finite image there. Thus Psi is the sum of Psi(q) times the
coset indicators over those finitely many nonzero quotient
classes, with each coset's P-parts lying in its selected
neighborhood. This is the actual eq_sum_cosetIndicator and
mem_of_cosets mechanism; no finite truncation of all adeles.

In KernelDecay.name_eq_zero_of_invariant, if all allowed
neighborhood coset indicators could not be killed at a
projected support point y, then each entry (i,j) of
X_f* vecToMat(y) Y_f would have to vanish. Indeed let
K_(r,s)=X_(r,i) conj(Y_(s,j)), finite components. Its contraction
star(K) dot y is exactly that entry. For arbitrary finite u and
integral v, choose the native parameter with only (i,j) nonzero,
(0, alpha * e * star(u*v)), in the Kronecker direction
X tensor (Y* stdForm)^T. Expanding finVec and stdForm gives
the conjugate-place shift e* star(u*v)K in the normalization
of H above. Its character on the projected support point
is psi0((u*v) * (star K dot y)); retain the exact alpha factor
in the ADELIC parameter (not an extra phase). On a small
coset this character is constant. Invariance of the functional
makes (phase-1)*ell(name(coset)f)=0. The conductor duality
from RUN56 implies some u,v give phase !=1 whenever that
entry is nonzero. Hence all the corresponding cosets are killed.
Section 2's finite decomposition supplies ell(name(Psi)f)=0.
This is precisely the kernel-submodule at native line 62.
The same proof serves the quotient-mean functional in
exists_norm_name_le (114), and the nondefinite graph branch
in SharpData (127). The point-specific phase may vary between
cosets; it is NOT assumed constant on the whole support.

## 3. Dual datum: both actual V substitutions and normalization
Write e=idem A.conjClosure, P0=projOn A, H=finHeisOp in this
section (distinct from the unnormalized rho in sections 1--2).
Take the native frame x, x*x=0, x_(u(k),j)=delta_(k,j).
Let K=1+z xx*, z*=-z supported on A.conjClosure. Then
K* K=(1-z xx*)(1+z xx*)=1 because (xx*)^2=0.
Let kappa=onHom(1,K), lambda=finMultiplier(kappa_f^-1),
a=e sum_k e_(u(k),k). The actual datum is
  f'=H(a) omega(kappa)(lambda f), P0 f=f.
The source projection formula gives P0 omega(kappa)f=lambda^-1 f.
If g is integral at A, F=pairWeil(g,1)f satisfies P0 F=F
by projOn_pairWeil, and H(a)F=F by finHeisOp_projOn.
Use inner-product invariance under simultaneous H(a) and
self-adjointness of P0:
  <f',F>=<omega(kappa)(lambda f),F>
         =<P0 omega(kappa)(lambda f),F>=<f,F>.
This cancels lambda BEFORE any norm bound. It is the exact
integral branch of exists_dual_datum, including the multiplier.

For the other branch work at g^-1, as in the source, and
strip the nonzero scalar of pairWeil and lambda. Put Q=onHom
(g^-1,1), so Q acts on matrix coordinates by right g_f.
kappa acts by left K; hence they commute. With w,i,l,M,Z,mu,
sigma,d as in RUN56, let y=e_(u(l),i)*(d sigma), d integral.
The row i of g has maximum absolute value M at l; the chosen
sigma divides both M and Z. Since y is supported at w,
Q_f y is globally integral (entries are d sigma g_(i,k)).
Also kappa_f y=K y is globally integral: x*e_(u(l),i)
=e_(l,i), so its entries are those of y plus
z x_(r,l) d sigma in column i, all integral by the bound
on Z and integrality of x. This supplies both V guards,
not just integrality of the single offending entry.

The native V assertion is H(e q_f y) omega(p)f=omega(p)f
when (p^-1 q)_f y is integral, by omega_finHeisOp and vacuum
invariance. Set q=kappa Q. For p=kappa the guard is Q_f y;
for p=Q it is kappa_f y, since Q and kappa commute.
Thus H(r), r=e(kappa Q)_f y, fixes BOTH omega(kappa)f
and omega(Q)f. On the first shifted vector H(a)omega(kappa)f
it contributes the commutator phase psi0(star(a) dot r).
The actual source uses precisely this simultaneous H(r)
in dataInner_finHeisOp (line 271).

The marked-row contraction now computes without a sum bound:
  star(a) dot r = e^2 (1+z) g_(i,l) d sigma.
Reason: K_(u(k),u(l))=delta_(k,l)+z delta_(k,l)
by x_(u(k),j)=delta_(k,j). The sum over k has ONE nonzero
term. The component e^2 g_(i,l) d sigma is integral, so
its character equals one. The remaining phase is
psi0(e^2 z g_(i,l) d sigma), conjugated in the coefficient
because dataInner is conjugate-linear in the first argument.
If the coefficient is nonzero, invariance forces that phase
to be one for every integral d. Self-duality of Ohat implies
e^2 z g_(i,l) sigma is integral, contradicting
Z M / max(Z,M)>1. Therefore no row has an entry of
valuation >1 at any w in the conjugation closure. The source
unitary star-transpose inverse formula gives inverse-entry
integrality at A, and hence g belongs to localLevel n A.
This proves the exact zero branch, not a bound on a norm.

## 4. Actual consumer and dependency status
At RallisFormula.integral_eq_zero_of_lift_eq_zero, for each
finite R, set A=R minus S0. The source hF.vacuum_off gives
P_A(integrated v F)=integrated v F, since A disjoint S0.
Section 3 applies with precisely that SAME f and A, not an
independently chosen datum. Its truncated coefficient turns
the Rallis integral into partialIntegral(R minus S0); the
inner product formula vanishes for f' because the original
lift is zero. Dominated convergence along finite R uses
the integrability from inner_product_formula (retained).
The native sharp-data partialIntegral_eq identifies the
limiting real matrix-coefficient integral with a nonzero
scalar multiple; therefore it is zero. The result feeds
realConv_eq_zero_of_lift_eq_zero and comparison-form detection.

Original graph unchanged:
 C comparison -> Rallis real convolution -> integral_eq_zero
 -> inner_product_formula, exists_dual_datum, tendsto_partialIntegral,
    sharp partialIntegral_eq.
 inner_product_formula -> graph boundary -> name_eq_zero_of_invariant
 -> mem_of_cosets, ϱ_name, schrodingerAct_star, self-duality.
 exists_dual_datum -> projOn_pairWeil, projOn_ω, finHeisOp_projOn,
    omega_finHeisOp, finHeisOp_comm, self-duality, integral frame.
Reduced human graph: same dependencies except shared detector
and explicit two-transport/one-phase computation; no native
edge deletion asserted. Context keys retain pin, E,S,T,A,f,g,w,
and P,Psi,X,Y,ell, so different functional callers are not
silently equated. The remaining Fourier-box inner product,
coefficient range construction (finite Fourier expansion),
Rallis convergence and unfolding, and C reciprocity, balanced
row, local defects, comparison construction remain visible.
All A/B obligations and original pinned graph retained.

CI: independently read actual RUN29 status.json blob
a56e2d3afb99ed8275e81fd63c8494306e57c43f and targeted_results.json
088cd2ec0e935ee1a282f10096949bcf671cc804 on cathedral-research-state.
Run 45803534769 overall error, module_1_build returncode 124
after 2700.11s. Six named B/C declarations checked with standard
three axioms only; not any of the new declarations below.
RUN28 receipt retained separately. Native Lean not available
in this execution; rh_scan/prune/reduce/auto not run. No claim
of new native axiom evidence. Prepared scalar checks below are
not executed. No competing job or protected workflow edits.

RESUME HERE: derive Fourier-box inner-product and finite
Fourier range suppliers (Names 61--79, AdelicSum 218--230)
at the exact compact normalization; then audit Rallis
unfolding and move to the remaining C primitive row/comparison
supplier as instructed, avoiding further sufficient-endgame
redesign. Submit this batch to shared native queue for replay.
HANDOFF TO integration, audit, kernel, literature.
-/

namespace CompactDependencyRun57

-- The two scalar contributions to the exact marked contraction.
theorem marked_phase_split {R : Type*} [CommRing R]
    (e z g d s : R) :
    e^2 * (1+z) * g * d * s =
    e^2 * g * d * s + e^2 * z * g * d * s := by ring

-- No loss from the inverse multiplier in the projection branch.
theorem multiplier_cancel (l c : ℂ) (h : l ≠ 0) :
    l * (l⁻¹ * c) = c := by
  rw [← mul_assoc, mul_inv_cancel₀ h, one_mul]

-- The phase is recovered from the unchanged nonzero coefficient.
theorem phase_cancel (p c : ℂ) (h : c ≠ 0) (hc : p * c = c) :
    p = 1 := by
  apply mul_right_cancel₀ h
  simpa using hc

end CompactDependencyRun57

#check Space.ϱ_name
#check IsSchwartzBruhat.mem_of_cosets
#check IsSchwartzBruhat.schrodingerAct_star
#check Space.finHeisOp_comm
#check Space.finHeisOp_projOn
#check Space.omega_finHeisOp
#print axioms CompactDependencyRun57.marked_phase_split
#print axioms CompactDependencyRun57.multiplier_cancel
#print axioms CompactDependencyRun57.phase_cancel
