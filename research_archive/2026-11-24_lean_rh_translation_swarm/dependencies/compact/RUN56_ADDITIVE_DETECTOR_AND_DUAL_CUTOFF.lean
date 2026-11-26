import Lib.SiegelWeil.RallisInner.SharpData
import Mathlib.Tactic

/-!
# RUN56 — primitive additive detector, nondefinite boundary, dual cutoff
26 November 2026. Dependency lane (historical 12, compact 13).
HUMAN SOURCE-MATCHED reconstruction; scalar replay candidates NOT compiled.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb;
manuscript 57e7f36aa8032da2dd16f54a539e23d992a7cf96;
observed branch head 2e27597eb8e580d6cce37fc5e4a7ec65582d5273.
Predecessor a3276066be8bed3a86fe05bf19144d3e7e56d06e.
Peers read 2e27597e (root lemma), c561038c (marked inverse),
c423f7ff (tame tensor/local payment), dd58f120 (tested form),
4cc2b4d7 (integral operator correction). No overlap.
Protocol, handoff and continuity checked. No physics or URT.

## Exact source ledger (relative to grh-compact/src)
Lib/Adelic/Adeles/AdditiveCharBasic.lean b06d14a9dc6bfe9d3cefa43f038fb54d72de698e:
  forall_ψf_mul_eq_one, eq_zero_of_forall_mul_integral.
Lib/Weil/Construction/FiniteHeisenberg.lean be448ff4db1da9bfa0fe7bd637272be079be2285:
  forall_psi₀_mul_eq_one_iff (43), psi₀_eq_one_of_mem.
Lib/Weil/Construction/Projections.lean 7a187f8be18a00b889082b56818393f20a7f88e4:
  dataInner_finHeisOp (35), finHeisOp_comm (111), finHeisOp_projOn (122).
Lib/Weil/DualPair/KernelDecay.lean 591247fdbe42900da1ac55c3c9d2ff733f235804:
  name_eq_zero_of_invariant (60).
Lib/Weil/MixedModel/ZeroTerm.lean e26a6037c53efb630f1dd8cf959aef3e0855fc5d:
  zeroTerm_apply, zeroTerm_rho_kAdelic (563).
Lib/SiegelWeil/RallisInner/SharpData.lean ea9f665a9a89411f1353d098ff2e0a4e59a719f5:
  IsClean, exists_graph_eq_of_zeroTerm_ne_zero (115),
  inner_product_formula (150), exists_dual_datum (245).
Prior downstream native callers: RallisFormula.realConv_eq_zero_of_lift_eq_zero,
ReproducingFormula.reproducing_formula_modKernel, RUN55 carrier and C.

## 1. Exact conductor and nondegeneracy
Write O-hat for integral finite adeles of E and D for its different.
For x in finite adeles, choose a in E with x-a in O-hat by the
native additive strong approximation. For u in O_E the finite
standard character psi_f(ux) equals psi_f(ua), since u(x-a)
is integral. On the diagonal a, the archimedean product formula
identifies psi_f(ua) with exp(-2pi i Tr(ua)). Hence triviality
for every u in O_E is exactly a in D^{-1}, by the definition
of the trace dual. Density of O_E in O-hat and continuity
extend this equivalence to all integral adeles u. Equivalently
d*x is integral for all d in D, because x-a integral.
For psi_0(x)=psi_f(j alpha bar(alpha) x), the WeilData.self_dual
valuation condition says that the multiplier times a local
generator of D has absolute value 1 at every finite place.
Thus the annihilator of O-hat for psi_0 is exactly O-hat:
   (forall u in O-hat, psi_0(zu)=1) iff z in O-hat.
No arbitrary conductor assumption or additional factor 2.

If a finite adele a is nonzero at w, choose a finite adele t
supported at w such that |t_w a_w|_w>1, using a sufficiently
negative uniformizer power. Then ta is not integral. The above
annihilator gives an integral u with psi_0(uta)!=1. This is the
nondegenerate scalar detector for ALL adelic t. Restricting t
to integral scalars is insufficient: a nonzero integral a
would pass every such test. This also proves the native
eq_zero_of_forall_mul_integral, by contraposition.

## 2. Named support and nondefinite graph cancellation
At name_eq_zero_of_invariant the exact assumptions are:
P disjoint from its conjugate, Psi Schwartz--Bruhat above P,
L a continuous linear functional invariant under rho(X z Y* J)
for every ADELIC parameter matrix z and input vector, and
X_f* mat(y) Y_f != 0 whenever Psi(y)!=0.
At a support point choose a nonzero (i,j) entry
a=(X_f* mat(y) Y_f)_ij. This is the dot product
star(K) . y for K_{uv}=X_{ui} bar(Y_{vj}) in finite coordinates.
The scalar detector of section 1 supplies an adelic t with
psi_0(ta)!=1. Use the (i,j) single-entry z with the source
alpha, conjugation, and support idempotent. The actual
rho_name / IsSchwartzBruhat.schrodingerAct_star identity
identifies its action on a named local test function with
multiplication by this phase (or its inverse; the source
takes the conjugate scalar). The phase is locally constant.
On a sufficiently small support coset it is constant and
different from 1. The same functional on that coset satisfies
   L(name)=phase*L(name).
Exact cancellation yields zero; no norm or approximation.
The native hPsi.mem_of_cosets supplies the finite coset
decomposition of the compactly supported locally constant
test function, so L(name(Psi))=0. The named model covariance
and finite coset decomposition are retained established
suppliers; no claim they follow merely from unitarity.

For the actual nondefinite boundary, write the Lagrangian frame
as (K,K'), with K* J K=K'^* J K'. Suppose K'c=0 but Kc!=0.
The zero term is the quotient mean over the k-coordinates,
so translation by a k-coordinate fixes it by Haar translation
invariance (zeroTerm_rho_kAdelic), since the k-plane is
isotropic and the Heisenberg phase in that direction is 1.
Pull this invariance through the doubled datum and pairWeil.
The source's lCoord identity has c* lCoord =
  [ (coordMatrix(1,Kc))* J, 0 ].
Consequently the induced direction uses Y=coordMatrix(g,Kc)
and X=T.dualFrame^{-1}, exactly as the caller at SharpData 127.
At the named clean place w, Y is a nonzero column, since Kc
is rational nonzero and both the place embedding and g-coordinate
changes are injective. Every support matrix mat(y)_w has a left
inverse by IsClean. Thus mat(y)_w Y_w!=0; multiplying by X_w*
cannot kill it. Section 2's detector now forces the zero term
to be zero, contradicting the native nonzero assumption.
Therefore ker K' subset ker K. The full frame is injective,
hence K' injective, hence invertible (square matrices over E).
The exact graph is represented by -K(K')^{-1}; the isotropy
identity makes this an isometry. In the definite case the same
kernel implication follows directly from definiteness.
This supplies the missing nondefinite boundary branch from
RUN55, without any assumption of positive definiteness there.

## 3. Dual datum: one maximal coordinate and one Weyl phase
Retain the source isotropic integral frame x, x* x=0, with
selected rows u(k) equal to the k-th coordinate row. Fix finite
A and the source z supported on A union conjugate(A), with
|z_w|>1 at every such place (multiplicative valuation convention).
This is chosen by exists_forall_mul_mem_Ô applied to the
specified single-place inverse-uniformizer adeles, not by a
uniform bound on g. The shear K=1+z xx* is unitary for z*=-z.
Use the actual dual datum
  f'=H(idem * sum_k e_(u(k),k)) omega(kappa)
       (finMultiplier(kappa_f^{-1}) f)
in SharpData, with the SAME f=projOn(A) f and kappa=onHom
of K. H denotes finHeisOp. The scalar multiplier is essential.

For g integral at A, projection covariance and the vacuum
identity H(idem*y)f=f for y integral, plus the unitary inner
product transport, give the original coefficient. The source
simp branch uses finMultiplier and star/atPlace identities;
this normalization branch is retained as native, not replaced
by an unnormalized Weyl-operator argument.

For nonzero coefficient C at a candidate g^{-1} (the native
proof first uses inverse-surjectivity), fix w in the conjugate
closure, a row i, and choose l with maximal |g_{il,w}| in that
row. Suppose M=|g_{il,w}|>1. Put Z=|z_w|>1 and choose
mu in the local field with |mu|=max(Z,M); the native surjective
valuation supplies it (max is one of two actual values).
Let sigma be supported at w with sigma_w=mu^{-1}.
Then each g_{ik,w} sigma_w and z_w sigma_w is integral,
and so are their products with every local integral d when
used separately. BUT
  |z_w g_{il,w} sigma_w| = Z M / max(Z,M) = min(Z,M)>1.
The native identity V p q y transports vacuum invariance
through omega(p) whenever (p^{-1}q)_f y is integral. Apply it
with the single coordinate (u(l),i) and scalar d sigma as in
the source. The row-max bound and z bound above establish the
two vacuum guards. Commuting the two finite Heisenberg shifts
introduces the phase psi_0(idem^2 z g_{il} sigma d), by
finHeisOp_comm and the identity rows of x. The scalar inner
product is unchanged by simultaneous shifts
(dataInner_finHeisOp). Thus C=conj(phase)*C, in the native
inner-product convention. Since C!=0, the phase equals 1
for every integral d. The annihilator of section 1 implies
idem^2 z g_{il} sigma integral, contradicting the strict
valuation. Therefore EVERY entry of g is integral at EVERY
w of the conjugation closure. Unitarity supplies g^{-1} by
the star transpose formula, so inverse entries are integral
at A as well. This is the native mem_intGL/localLevel
conclusion. No finite truncation of integral d, no norm loss.
The actual coordinate expansion in the two V uses and the
integral-side normalization still require independent caller
replay; do not count a kernel closure here.

## Graph delta, scope, CI
Original source dependencies preserved, with context key
(pin, declaration, same E/S/T/a/b/P or A/f/g, local w);
no blind cross-version reuse:
  C comparison -> reproducing_formula_modKernel
    -> realConv_eq_zero_of_lift_eq_zero
    -> inner_product_formula -> exists_graph_eq_of_zeroTerm_ne_zero
       -> name_eq_zero_of_invariant -> scalar annihilator
    -> exists_dual_datum -> scalar annihilator
                         -> finHeisOp_comm / projection invariance
Reduced human graph shares exactly one selfdual conductor
lemma for support cancellation and valuation cutoff. Both
caller-specific invariance and normalizations retained.
The other C arithmetic, Selmer, row and local defect leaves,
and all A/B obligations remain unchanged. This is SOURCE
matching, not an elaborated full kernel graph. Native
rh_scan/prune/reduce/auto unavailable here (no lean/lake).
Prepared #checks and three scalar/finite certificates below
are not executed; no claim of new axioms or compiled bridge.
Independently retrieved actual run 45799225653 jobs all
successful, state targeted_results.json blob
23de197bd48f404ca2074c69676de289c4f7934e:
10 named declarations and 4 scalar declarations, each only
propext, Classical.choice, Quot.sound, full_RH_replay=false.
These are previous independent checks, not this file.
No competing full-build job. Use shared RUN29+ targeted queue.

RESUME HERE: derive exact native rho_name covariance and
hPsi.mem_of_cosets proof at the above functional, then audit
the two V substitutions and integral normalization in
exists_dual_datum (245-284). Replay this and RUN55 together
with the existing bounded native queue; preserve all guards.
HANDOFF TO: integration, literature, formal audit, kernel.
Current source SHA and observed work branch head above;
commit generated by contents API, independently fetch it.
-/

namespace CompactDependencyRun56

theorem phase_cancel (c z : ℂ) (hc : c ≠ 0)
    (h : z * c = c) : z = 1 := by
  apply mul_right_cancel₀ hc
  simpa using h

theorem strict_max_product (z m : ℝ) (hz : 1 < z)
    (hm : 1 < m) : max z m < z * m := by
  apply max_lt
  · nlinarith [mul_pos (sub_pos.mpr hz) (sub_pos.mpr hm)]
  · nlinarith [mul_pos (sub_pos.mpr hz) (sub_pos.mpr hm)]

theorem finite_phase_vanish {ι : Type*} (s : Finset ι)
    (c z : ι → ℂ) (hn : ∀ i ∈ s, z i ≠ 1)
    (h : ∀ i ∈ s, z i * c i = c i) :
    ∑ i ∈ s, c i = 0 := by
  classical
  apply Finset.sum_eq_zero
  intro i hi
  by_contra hc
  exact hn i hi (phase_cancel (c i) (z i) hc (h i hi))

end CompactDependencyRun56

#print axioms CompactDependencyRun56.phase_cancel
#print axioms CompactDependencyRun56.strict_max_product
#print axioms CompactDependencyRun56.finite_phase_vanish
