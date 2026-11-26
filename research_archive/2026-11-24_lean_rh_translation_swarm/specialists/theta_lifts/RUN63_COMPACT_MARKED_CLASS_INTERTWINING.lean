import New.Columns.TwistedHeckeType
import Mathlib.Tactic

/-!
RUN63 — marked-class operator intertwining at the actual A caller.
26 November 2026. Human source-matched derivation; independent audit
and native replay outstanding. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude. Compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
066807598bd411c83b183fe28158a15000d93d49. RUN62 predecessor
6c88e267; peers kernel 46483cc0 (actual pairing), prime 12c745a4
(root/depth), acceleration 3392d9c7 (flag count), editor c2c5b63c.
Do not repeat projector, depth or dimension proofs.

Pinned source ledger (grh-compact/src):
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  Columns.hasType_markOperator, actual body (146ff).
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  TwistingData.hasType_twisted_hecke, hypotheses hs and hY.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  letterMatrix, letterRep, diagonal_pow_depth.
Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33
  exists_mul_mem_integralAbove, exists_reps_integralAbove,
  weylGauge_embFin, weylGauge_mul, weylGauge_le_one_iff.
Lib/Adelic/Hecke/HeckeBasic.lean d166991c495c40b0b5c2280a8822bcbb6806f41b
  heckeFun_eq_sum_pullback.
Lib/GLn/SchurModule/WeightRepBasic.lean 7417d8c31f21090bfa515568339b768290093d02
  stdSpace_weightRep_apply, weylGauge, integral representation.
Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f
  schur_one_row_eq_symPowMatrix (transpose on BOTH sides).
New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65
  classAut_columnLevel_eq_bot.
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
  Data.IsMarked.hasType_markOperator, remaining size and orbit bridge.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  gaugeLe_markOperator_pow and uniform index consumer.

1. Integral class coordinates, actual image f.range.
Let K=columnLevel(0), X=StdClasses(K), O=embValRing,
r=ceilLogM(p), W=O_l (rational valuation subring at l),
q the native reindexing X_0 -> Fin k, and d=diag(p I_r,I).
Use the SAME representatives rho_x integral above p. They exist
by weak approximation to the inverse of any representative at
the finitely many p-places; the integral subgroup is open.
Trivial class automorphism groups (the native chosen level
lemma) imply that arbitrary complex weight coordinates at rho_x
extend uniquely to a K-invariant algebraic form by
  phi(gamma rho_x k)=weightRep(gamma) F(x).
Independence of the decomposition follows from the trivial
stabilizer; smoothness follows from the open right stabilizer K.
This is the native freeLevelEquiv and f is its inverse on O
coordinates after embedding O into C, not a new form space.
At rho_x the gauge <=1 is equivalent to entrywise O-integrality:
rho_x and rho_x^-1 are integral at every p-place and the weight
representation preserves the integral coordinate module.
For an arbitrary g=gamma rho_x k, rational equivariance cancels
gamma in the gauge and k in K is integral above p, including
its inverse. Thus gauge at g equals gauge at rho_x for this
value; no norm or representative-count cost. Conversely evaluate
an integral form at every rho_x. Hence
   f.range = D.integralColumns,
and dim_C Column = |X| times the number of weight coordinates.
No assumption that all rational frames are integral is made.

2. Parahoric and the actual finite Hecke pullback.
Write J=GL_k(W), embed/reindex via jw; at the split place l
write j_l for completion. Let P0={b in J: d^-1 b d integral
invertible at l}. A matrix in J and its inverse both have
integral entries. The only new condition on d^-1 b d is
that the upper-right r by (k-r) block of b is divisible by p.
This forces block lower triangular reduction; since the
reduced diagonal blocks are invertible, the same property
holds for b^-1. Conversely it suffices for both. This is the
native parahoric(W,twoBlock(k,r)); p is a uniformizer at l by
the marked valuation premise. No conjugation of the wrong block.
The native basic double coset is Kw d Kw. For each x let
  delta_x(b)=rho_x(l)^-1 j_l(jw(b)) j_l(d).
Both rho_x(l) and b are units at l, so every delta_x(b) belongs
to Kw d Kw. For b,b' in J, delta_x(b)^-1 delta_x(b') is
integral iff b^-1 b' in P0. This gives an injection of the
right coset space J/P0 into local Kw-cosets.

Surjectivity onto the support needs actual rational matrices,
not a claim that every local matrix is rational. Given local
k1 d k2, discard k2 on the right. Apply
exists_mul_mem_integralAbove to g=rho_x atSplit(k1) and
conjugating element atSplit(d)^-1. It supplies rational gamma
such that gamma*g is integral above p and its conjugate by
atSplit(d)^-1 is also integral above p. At l the former,
since rho_x(l) and k1 are units, implies gamma_l is integral
invertible. By the native rational-to-completion membership
equivalence, gamma=jw(b0) for a b0 in J (as matrices on X_0).
The latter condition gives
   delta_x(b0^-1)^-1 k1 d
     = d^-1 j_l(jw(b0)) rho_x(l) k1 d in Kw.
Thus the chosen finite rational quotient covers every
supported local right coset. At other places use the split
embedding and retain the original level. Since Kw at this
marked place acts trivially on the columns (native
maxCompactAt_le_columnLevel), heckeFun_eq_sum_pullback
gives an exact sum over b in J/P0; no stabilizer multiplicity,
measure factor or norm estimate.

3. Injectivity of the depth-frame labels (hs).
For e=(x,bP0) choose the native decomposition
  rho_x atSplit(delta_x(b)) = gamma_e rho_{o(e)} u_e,
where gamma_e is rational unitary and u_e in K; throughout,
b denotes the chosen representative .out. At l, therefore
gamma_e(l)=b d (u_e(l)^-1 rho_o(l)^-1).
The parenthesized factor is integral invertible, so by the
rational membership equivalence there is g_e in J with
gamma_e=jw(b) d jw(g_e) as rational matrices.
The actual call to hasType_twisted_hecke uses g_e^-1, not g_e.
Its required label is consequently (o(e),g_e^T P0), since
transposeGL(g_e^-1)^-1=g_e^T.

Suppose two labels agree. Then o(e)=o(e') and
(g_e^T)^-1 g_e'^T is in P0, equivalently
(g_e g_e'^-1)^-T is in P0. By the defining conjugation criterion
and diagonal d, this implies d(g_e g_e'^-1)d^-1 is integral
invertible: inverse-transpose maps the first criterion to
this one. Hence gamma_e gamma_e'^-1 is integral at l from
its factorization b d g_e g_e'^-1 d^-1 b'^-1.
At star(l) the integral property follows by rational unitary
inverse-transpose, and outside this split support the class
decompositions give the original K-components. More explicitly,
rho_x^-1 gamma_e gamma_e'^-1 rho_x' equals
 atSplit(delta_x(b)) u_e^-1 u_e' atSplit(delta_x'(b'))^-1.
Outside l,star(l) this equals u_e^-1 u_e'; at the split pair
it is integral invertible, as are u_e,u_e',rho_x,rho_x'.
Multiplying on the right by (u_e^-1 u_e')^-1 leaves a split
supported integral element, which belongs to K by the actual
marked maxCompact premise. Thus the displayed adelic element
belongs to K. The representatives give x=x', and the trivial
class automorphism group at rho_x forces gamma_e gamma_e'^-1=1.
Cancel the rational factors to get
 g_e g_e'^-1 = d^-1 b^-1 b' d in J,
so b^-1 b' is in P0. Their quotient labels agree, and e=e'.
This proves the exact hs used by the two depth factorizations.
The finite source and target label spaces have the same
cardinality, so hs is also onto, as required in the kernel
lane's factorization. No inference of injectivity from a
numerically invertible matrix.

4. The operator hY, including the transpose and scalar.
Use J_coord for the native bijection of Weyl coordinates with
(degree-a monomial family on the Q-tops) times H (all other
coordinates). A top has one-row weight a, every non-top
weight zero, determinant exponent zero at stage 0. The actual
weightRep uses z_tau=Phi_tau(conj gamma_e), NOT Phi_tau(gamma_e).
The native one-row identity from Hook is
  c^a Schur(z)_{i,j}
     = Sym^a(c z^T)_{psi(j),psi(i)}
in the integral monomial coordinate conventions. It follows
by expanding a degree-a monomial under linear substitution;
no factorial rescaling or assumption that a general symmetric
power commutes with transpose. Use it separately at every
top, with its actual fixed bijection psi, including c=1.

For s even, iota_s=Phi_tau on W and the unitary identity
conj(gamma_e)^T=gamma_e^-1 gives
  p z_tau^T = iota_s(g_e^-1 (p d^-1) b^-1).
Here p d^-1=diag(I_r,p I_(k-r)), exactly p^deep at an even
letter. For s odd, iota_s=Phi_tau composed with conjugation,
so
  z_tau^T = iota_s(g_e^T d b^T).
These are precisely the odd letter matrices of g_e^-1 and
b^-1 (inverse-transposes), with d=diag(p I_r,I) the odd deep
diagonal. Applying the symmetric power functor in these
orders, tensoring across letters, and using the native
diagonal_pow_depth yields the SAME matrix entry
  [letterRep(g_e^-1) diag(p^depth) letterRep(b^-1)]
    _{J_coord(j).first,J_coord(i).first}.
At every even top the scalar used was p^a, at odd tops it
was 1; their product is p^(a #even)=p^markExponent by hA.
Thus the entire scale of the native markOperator is already
accounted for and no extra scalar remains.

For a top outside Q the induced place is neither l nor star(l).
The class decomposition is integral at that weight embedding
because rho_x,rho_o,u_e are integral above p and the only
nonintegral Hecke component is the split pair. Both gamma_e
and its inverse therefore map into GL(O) at that embedding.
For a non-top the Schur module has degree zero, is trivial,
and we may use the identity frame even when that embedding
lies at the split pair. This is exactly the chosen m_e in
the native proof. It gives an invertible matrix U_e over O
on H by the integral Weyl representation, independent of F.
The entire coordinate action is therefore
  (Y fF)(rho_x)_i =
    sum_b sum_j (U_e)_{i_H,j_H}
       [letterRep(g_e^-1) diag(p^depth) letterRep(b^-1)]
              _{j_Q,i_Q} F(o(e))_j.
No denominator, p-adic norm or absolute value was taken.
The equation uses the same class representatives, output
labels and g_e as hs. Since class values determine forms,
it proves hY at the actual native caller, not a new analogue.

5. Integration with peers at the actual consumer.
Apply the native elementary-divisor theorem with f as in
section 1, source o, g=g_e^-1, U=U_e, coordinate equivalence
J_coord, and hs/hY as above. Its exact hypotheses hp,T,
HeckeSizes remain. Kernel RUN36 (46483cc0) supplies pairing
assembly; prime RUN62 (12c745a4) supplies root/depth human
derivation; acceleration RUN60 (3392d9c7) supplies flag
count, and prior theta supplies projector. Combining these
at the same caller, not separate hypothetical operators,
gives the human marked local type conclusion
  HasType(p, integralColumns, s, markOperator_l,
          (z+x*s+y)*dim_C(Column))
relative to those retained, independently audited inputs.
The separate native MarkedPrimeType theorem then specializes
T and size constants to the uniform local index (RUN61);
that quantitative orbit/size bridge still requires full
human reconstruction/audit. Do not treat it as supplied by
the above intertwining. The level-prime branch RUN62 and
the marked gauge transfer remain separate consumers before
short_forms and star_inequality.

Original local graph: class reps/free level + parahoric and
pullback + trivial stabilizer -> hs; weight rep/one-row/
diagonal depth + class factorization -> hY; hs/hY plus
T,hp,HeckeSizes and primitive estimates -> hasType_twisted_hecke
 -> Columns.hasType_markOperator -> Data.IsMarked.hasType_markOperator
 -> uniform local index -> short_forms -> star.
Reduced human proof groups these exact arguments, no new
premise or globally retired declaration. Context key includes
pin,D,p,l,K,r,ordered Q,representatives,coordinate bijections,
g_e,twisting parity,markExponent. Original/reduced native
graphs and axiom evidence unchanged. B/C and other A
suppliers remain visible.

Verification: checked local PATH, lean/lake/elan unavailable.
Read actual compact CI status a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted results 088cd2ec0e935ee1a282f10096949bcf671cc804,
run 45803534769: six B/C native theorem checks with standard
three axioms, A JetExponentBound build timed out at 2700.11s,
all_requested_checks_ok=false. Not a verdict on this file.
Old-pin native rh_scan/prune/reduce/auto/frontier not executed
on compact. Below are executable scalar/axiom probes prepared,
NOT compiled. No redundant synthetic numerical diagnostic;
independent audit of actual class label and matrix orientations
and compact replay are required. No claim of RH proof closure.

RESUME HERE: editor integrate sections 1-5 with peer marked
primitive proofs. Next exact native caller MarkedPrimeType.lean
IsMarked.hasType_markOperator: reconstruct the single orbit,
Frobenius congruence on W, residue cardinality, parity count and
HeckeSizes guards giving the published uniform bound. Coordinate
with prime and acceleration lanes; then audit remaining
archimedean A supplier and actual single-stage Hecke transfer.
HANDOFF TO editor, integration, prime window, acceleration,
formal audit and shared kernel.
-/

namespace ThetaRun63

-- The scalar at each even deep diagonal; p need only be nonzero.
theorem even_diag_scalar {F : Type*} [Field F] (p : F)
    (hp : p ≠ 0) (shallow : Bool) :
    p * (if shallow then p else 1)⁻¹ =
      (if shallow then 1 else p) := by
  cases shallow <;> simp [hp]

-- Reassociation used to recover the parahoric label after cancellation.
theorem label_cancel {G : Type*} [Group G] (b d g b' g' : G)
    (h : b * d * g = b' * d * g') :
    g * g'⁻¹ = d⁻¹ * (b⁻¹ * b') * d := by
  calc
    g * g'⁻¹ = (b * d)⁻¹ * (b * d * g) * g'⁻¹ := by group
    _ = (b * d)⁻¹ * (b' * d * g') * g'⁻¹ := by rw [h]
    _ = d⁻¹ * (b⁻¹ * b') * d := by group

end ThetaRun63

#check schur_one_row_eq_symPowMatrix
#check heckeFun_eq_sum_pullback
#check TwistingData.hasType_twisted_hecke
#check Columns.hasType_markOperator
#print axioms ThetaRun63.even_diag_scalar
#print axioms ThetaRun63.label_cancel
#print axioms Columns.hasType_markOperator
