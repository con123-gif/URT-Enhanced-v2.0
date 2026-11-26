import New.Selmer.RibetElement

/-!
RUN61 — integral block lattice and first-order row determinant at actual C caller.
26 November 2026. Human source-matched derivation; executable scalar/matrix
certificate PREPARED, not compiled. Credit Alpöge, Sernau, Anthropic and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, manuscript blob
1516dd75e274c4ec8e060f618c3aba9384c055e4; peer head observed
825590bbc046023da6d59ea5d5f9727abecc3615. RUN60 retained, not repeated.
The editor already has the sharp polynomial and final coefficient bookkeeping;
this contribution supplies the intervening lattice and actual row B0 witness.

Source ledger (all retrieved at the compact pin):
* New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18
  ribet_columns 143–184 (in particular hB, hL, F, I, f, d, tr).
* New/Selmer/BlocksAndCocycles.lean 2bc5a11b2127e4b46eb4f57bfc1bd12f64c1ef55
  RowBlockIndex, blockRep, obeyingCocycles.
* Lib/GaloisRep/Pseudocharacter/SemisimpleReps.lean
  79de7db547531bcf5935691c6911bfec0ccec3c6, HasSemiprimeSpan,
  IsTraceNondeg.exists_conj_of_trace_eq 139–153.
* Lib/General/NumberTheory/StableLattice.lean
  8165cdfad2f03d05b46757617472288d3c7276dc, IsLatticeIn.
* New/Selmer/AptTuples.lean 49699d4679d83a7bc7714afc53b7e2757ae4adf3,
  IsLatticeIn.exists_algHom, continuous, eq_one, trace_eq 38–57.
* New/Selmer/RibetFirstOrder.lean a05cb18d1ee62520f104d41361099db4b23cbe1f,
  ribet_first_order 107–161, 162–245 (consumer).
* New/Selmer/RibetCramer.lean 6f5a4b0d00c600aaa0acdbf118da2f7dffee1e69,
  ribetNormaliser 77–80, exists_ribet_element_cramer.
* Lib/General/Algebra/BlockFittingBound.lean
  9107737c82be74338b8843ab315bf11d1b186d51, exists_rows_addVal_det_le.
* New/Selmer/DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534,
  denominatorLe_rowBudget.

1. Construct the very same integral block lattice (RibetElement 150–167).
Fix the simultaneous eventual coefficient ring O chosen at 143–147, write
K=Qbar_l and let i:O→K be its injective embedding. For each x in the lift
subset X, use the already chosen row lattice R0_x, integral avatar psi'_x,
and define T_x=psi'_x R0_x. Each psi'_x(g) is a unit. Thus O-span(T_x(G))
=O-span(R0_x(G))=M_r(O), since multiplying each spanning element by its
unit changes neither inclusion. The same holds after scalar extension
to K; no assertion that the joint block representation spans the entire
product algebra is needed. Let B=M_r(K)×K^t with t=rankDiff, and
s_x(g)=(i(T_x(g)), (i(cycInv(g)^e))_e).
For any A=(Y,(a_e)) in the K-span of s_x(G) such that A s_x(g) A=0
for all g, taking g=1 in each scalar component gives a_e²=0. In the
row component Y i(T_x(g)) Y=0 extends by linearity to Y M Y=0 for
every M∈M_r(K). Take M=E_{ba}; the (a,b) entry is Y_ab². The field
has no nonzero square-zero element, so Y=0. This supplies precisely
HasSemiprimeSpan in the actual Brauer–Nesbitt call, even with repeated
or coincident character blocks. It would be incorrect to assume the
joint span is the whole product, or to use a nondegenerate ambient
trace form as proof of nondegeneracy on a possibly nonsimple subspace.

Let Phi be the fixed blockDiagonalAlgHom followed by reindexing using
the source bijection epsilon : Sigma RowBlockIndex ≃ n. The attached
u_x is trace-nondegenerate by IsLabelledColumn. Its character equals
tr Phi(s_x(g)) by hl', trace transport of R0_x, hpsi' and the definition
of cycInv; this is a term-by-term trace sum, not a comparison of only
Frobenius characteristic polynomials. Apply the actual
IsTraceNondeg.exists_conj_of_trace_eq with B,s_x,Phi, the semiprime
argument just proved and that equality for EVERY g. It yields P_x∈GL_n(K)
with u_x(g)P_x=P_x Phi(s_x(g)).
Thus u'_x(g)=Phi_O(blockRep(T_x)(g)) satisfies
i(u'_x(g))=P_x^{-1}u_x(g)P_x, the exact IsLatticeIn statement.
For x outside X use the existing simultaneous arbitrary stable lattice,
NOT a row/string decomposition; the implication hB is vacuous there.
All columns, including those outside X, remain in the trace-ideal family.

2. Transport the trace ideal and local annihilators (168–183).
F_x(A)=P_x i(A)P_x^{-1} is an injective O-algebra homomorphism.
For every A, det F_x(A)=i(det A), tr F_x(A)=i(tr A); for each g,
F_x(u'_x(g))=u_x(g). The identities follow from conjugation invariance
and coefficientwise embedding, with no extra denominator. They also
give F_x(P(u'_x(g)))=P^i(u_x(g)) for every integral polynomial P.
Consequently the original trace relations, characteristic polynomial
coefficients and tame annihilators transfer to the integral family
using the SAME embedding, including the lifted polynomials eta_j
chosen at 148–149. The source also applies isTraceIdeal_withConjInv;
retain its conjugate-inverse prime relations and exact eta_j(1)=1.
Continuity transfers since O has the induced topology and P_x is fixed;
u_x(g)=1 implies u'_x(g)=1 by injectivity. This supplies the actual
continuity and unramifiedness prerequisites of obeyingCocycles at 188
and the tame polynomial equality at 194–201. On X, the row/string
decomposition has now been established on integral matrices, not just
on their traces. No prime-dependent change of lattice or loss cost.

3. Construct B0 from the actual first-order annihilator (RibetFirstOrder
107–161). Work over the DVR O with p0≠0, b0<v(p0), as supplied by RUN60.
Use Lambda=O[X_j], A=Lambda[G], the source finite tuple x_i of generators
(delta, finite spanning set s0, detector s), and V:A^I→A with
V(t)=sum_i t_i(U(x_i)-1), U(g) the group basis element. The exact N
from lines 133–134 is the inverse image of the trace-ideal span plus
ker(eta_0) times V(v omega). Keep this full N; it need not be generated
just by the displayed elementary relations. The integral section
v:O^I→A^I is constant group-ring coefficients, and z(g)∈O^I represents
the common family u'(g)-1, as in 126–127. Let psi0:A→M_r(O) be
evaluation X=0 followed by the chosen row representation rho_pi.
It is surjective because span_O rho_pi(G)=M_r(O). For a tuple w_i∈
(O/p0)^r annihilated by every t∈N through psi0, put
c(g)=sum_i z(g)_i w_i. The following are exact native relations:
  hg: v(z(gh)-z(g)) - U(g)v(z(h)) in N;
  hx: v(z(x_i))-e_i in N;
  hK: v(sum_g theta_g z(g)) in N when sum_g theta_g(u'(g)-1)=0;
  h_tau: v(z(tau_k))-X_k epsilon_k(U(phi_k))v(z(phi_k)) in N;
  h_omega: (U(g)-1)v(omega) in N.
Apply the annihilator condition, in this order. hg gives the cocycle
equation; hK gives the defining linear relations of obeyingCocycles;
h_tau gives c(tau_k)=0 since psi0(X_k)=0. Finally at g=gamma_pi,
h_omega gives (y_pi-1)*sum_i omega_i w_i=0. The factor is a unit,
so sum_i omega_i w_i=0. Expand omega by ribetNormaliser, then hg:
  sum_i omega_i w_i = c(gamma_pi*a)-y_pi c(a)+p0 C sum_g theta_g c(g)
                    = c(gamma_pi).
The last term vanishes in O/p0, and the first two cancel exactly by
rho_pi(gamma_pi)=y_pi I. This shows the gamma-zero condition without
replacing cocycles by cohomology classes. hx says c(x_i)=w_i, so
w→c is injective and O-linear. Its image lies in the SAME module
obeyingCocycles ∩ pi(range tau)0 ∩ ker(proj gamma_pi) bounded by hb0.
Hence the annihilator has length ≤b0. No use of the target RH or of
the yet-unproved first-order conclusion.

For clarity, the underlying native BlockFittingBound lemma can be
proved directly via DVR Smith form. Flatten tuples in (O^r)^I to O^D
(D=|I|r). Let L be the O-submodule generated by individual rows of
the block row (psi0(t_i))_i for all t∈N. Because psi0 is onto and
N is an A-submodule, each such row can be put into ANY of the r row
slots, with all other slots zero, by left multiplication by a lift of
the corresponding matrix unit. All finite O-linear combinations are
also liftable. Set L'=L+p0 O^D. Its invariant factors are pi^a_j with
0≤a_j≤v(p0); the dot-product annihilator of L modulo p0 is isomorphic,
by invertible base change and the nondegenerate pairing over O/p0, to
the sum of kernels of multiplication by pi^a_j. Its O-length is
sum a_j, exactly v(det of a row basis of L'). Thus sum a_j≤b0<v(p0).
Choose a row basis of L'; replace each row by a representative in L
congruent modulo p0, and use the matrix-unit lifting just described,
grouping r consecutive rows into one block row of B0 in N. The
determinant of the resulting flattened psi0(B0) is congruent modulo
p0 to the original basis determinant. Since the latter has valuation
strictly less than v(p0), the valuations are equal (ultrametric
inequality in both directions). This supplies the actual B0:
  v(det flatten(psi0(B0))) = sum a_j ≤ b0.
In particular the strict hlt cannot be omitted: if the determinant
valuation reaches v(p0), a congruent representative can be zero.
The proof uses the ordinary DVR structure theorem, not a stronger
surjectivity of N or a reduction-surjectivity assumption for
crystalline cocycles. This is the exact consumer of hb0 at 151–161.

4. First-order block selector (115–121) and determinant consumer.
In A, for each lift x put
  k_x=(y_x-1)^(-1)(y_x*1-U(gamma_x)).
Every eta_e(k_x)=1; psi_x(k_x)=0. The product k of all k_x (any fixed
order) therefore satisfies eta_e(k)=1 for every string and psi_x(k)=0
for every lift. Noncommutativity causes no problem: each row evaluation
has one zero factor. For each e set
  d_e=prod_{j≠e}(xi_e(a)-xi_j(a)),
  q_e=(C/d_e)*prod_{j≠e}(U(a)-xi_j(a)).
The notation C/d_e denotes the actual integral divisor witness from
hC, not a field division; C is nonzero at the RibetElement caller.
All factors are polynomials in U(a) with central scalar coefficients.
Then eta_j(q_e)=C if j=e and 0 otherwise. These selectors are at
the exact common a, C of the triangle. In B0+k(M-B0), the row
evaluations equal B0 on every lift, and the scalar evaluations equal
M, so the reindexed flattened determinant factors into the row
determinant times the scalar determinants. This is the actual D and
subsequent selector use at 162–169 and 227–237. At the chosen lift,
constant coefficient of the row determinant is the determinant of
psi0(B0), hence the established valuation budget b0 applies without
a variable-dependent extra cost. The existing editor's characterwise
Fitting, triangular ideal and double Cramer argument still supplies
the scalar factors and f beta ∈ J; this run does NOT claim to have
independently reconstructed those remaining proof bodies.

Original source edges:
RibetElement.ribet_columns → IsTraceNondeg.exists_conj_of_trace_eq,
IsLatticeIn.exists_algHom, ribet_first_order → exists_rows_addVal_det_le,
exists_mem_fittingIdeal_block, exists_ribet_element_cramer →
DenominatorBound.denominatorLe_rowBudget (consumer of ribet_columns)
→ LongForms C → star. Reduced human path: elementary matrix units
give the semiprime and row-lifting witnesses, exact conjugation and
DVR Smith form give the two transport steps; all other edges retained.
No native graph or axioms changed. Remaining actual triangle, odd-Sha
uniformity, chart/safety/Ext and trace-ideal/Fitting/Cramer premises
remain open or independently audited elsewhere; this is not closure
of C or RH.

Execution: checked local lean/lake/elan absent. No native engine invoked
and no fresh kernel/axiom evidence for this file. Retrieved RUN29
primitive replay receipt (state blob a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted_results blob 088cd2ec0e935ee1a282f10096949bcf671cc804,
run 45803534769): three TiltingLemma and three Filling.Moments theorem
checks each report propext, Classical.choice, Quot.sound; module_1
build timed out 2700.11s, all_requested_checks_ok=false. RUN28
45799225653 jobs succeeded but are prior targeted evidence only.
No PASS for this certificate; request shared native replay, not another
protected workflow or separate full build. Original and reduced graphs
remain intact.

RESUME HERE: editor integrate steps 1–4 at actual RibetElement 150–184
and RibetFirstOrder 151–161 before the existing coefficient appendix.
Audit exact matrix-unit lifting and mod-p0 determinant argument. Galois
next inspect actual characterwise triangle/Fitting row assembly
RibetFirstOrder 30–55 and 170–223 against the editor sharp polynomial
(to avoid duplication), or move directly to unclosed safety/Ext and
uniform odd-Sha suppliers if already discharged.
HANDOFF TO integration, independent audit, shared compact native replay.
-/

namespace RHGaloisRun61

open Matrix

theorem semiprime_matrix_units {K n : Type*} [Field K] [Fintype n]
    (Y : Matrix n n K) (h : ∀ M : Matrix n n K, Y * M * Y = 0) :
    Y = 0 := by
  classical
  ext a b
  have h' := congrFun (congrFun (h (Matrix.single b a (1 : K))) a) b
  have hsq : Y a b * Y a b = 0 := by
    simpa [Matrix.mul_apply, Matrix.single_apply, mul_ite, ite_mul] using h'
  exact mul_self_eq_zero.mp hsq

theorem scalar_unit_cancel {R M : Type*} [CommRing R] [AddCommGroup M]
    [Module R M] (y : R) (x : M) (hy : IsUnit (y - 1))
    (h : (y - 1) • x = 0) : x = 0 :=
  hy.smul_eq_zero.mp h

theorem row_cocycle_cancel {R M G : Type*} [CommRing R] [AddCommGroup M]
    [Module R M] [Mul G] (c : G → M) (gamma a : G) (y : R)
    (h : c (gamma * a) = c gamma + y • c a) :
    c (gamma * a) - y • c a = c gamma := by rw [h, add_sub_cancel_right]

#print axioms semiprime_matrix_units
#print axioms scalar_unit_cancel
#print axioms row_cocycle_cancel
#check IsTraceNondeg.exists_conj_of_trace_eq
#check IsLatticeIn.exists_algHom
#check exists_rows_addVal_det_le
#check ribet_first_order
#check ribet_columns

end RHGaloisRun61
