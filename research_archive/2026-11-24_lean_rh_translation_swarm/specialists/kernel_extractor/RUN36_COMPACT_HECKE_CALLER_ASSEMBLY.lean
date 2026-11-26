import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
RUN36 kernel extractor, 26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION,
independent audit of new caller assembly and native replay outstanding.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
manuscript 68331b985665914f2ec5edf78b11ca704906aecd, peer head
9db13f38a968c3f34c93aa8b6a6b325e1cf1ce49 (crystalline Hodge frame,
not Hecke). Prior own RUN34 3e2e639b38f30e6b707aa22a8deaa8e6099ddaca
and RUN35 ec29276eacba71366821f70dba9df7c38d337457. This joins them
at the ACTUAL caller rather than creating a new determinant criterion.

Pinned source ledger (grh-compact/src):
New/TwistedHecke/ClassMeans.lean b0cc77bf52f463d3c62d755b43030f964d32f8cf
  conjSubst, exists_mean.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  of_pairing, exists_depth_factorization, exists_projector,
  hasType_twisted_hecke.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  w_sq, letterRep, translatesIn, excessCond, letterRep_map.
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  HeckeSizes, index_mul_finrank_excessCond_le, sum_finrank_deepForms_le.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
  IndexDvd.of_det_dvd, comp, map, HasType.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  the marked-column consumer. No new external premise or URT assumption.

1. Internal re-audit of RUN35 trace (not independent of its author).
For generic variable X_(i,j) let Y_(j,i)=mask X_(i,j).
The coefficient matrix of conjSubst(a) is
 A_(i,j),(u,v)=(a^-1)_(u,i) a_(j,v), after applying iota.
Thus transpose substitution sends Y to a Y a^-1, not a^-1 Y a.
Explicitly its (v,u) entry is
 sum_(i,j) a_(v,j) Y_(j,i) (a^-1)_(i,u).
Masking commutes because a,a^-1 preserve both blocks. This is
the orientation of adj in exists_mean. The diagonal transpose
form moves this transposed substitution onto the tensor matrix g.
For a monomial alpha its coefficient matrix has input columns
of fixed weight r and output rows of fixed weight s. If r!=s
the matrix squares to zero, also after restriction to stable N.
If P(r), its image lies in N by construction. Rectangular
trace cyclicity then computes the trace in the whole tensor
space without dividing by rank. For the span assertion, write
each basis vector of N as a finite sum of A(a)e_t with P(w_t).
The functional F -> b_j^* A(a) T_F e_t is defined on N and
kills monomials outside P, by fixed input weight. Conjugating
F by a^-1 gives the corresponding term in the restricted trace.
This checks both the sign of conjugation and the support field
used by the lower pairing congruence. No new density claim.
The equal-degree transpose coefficient identity in RUN35 is
correct with this orientation. Retain the original residue
density and finite-free prerequisites.

2. Exact caller thresholds and common witnesses.
Write s=(k+k^2)(o0*N)N (an integer), c=2s+2, a0=w^(2s)=p^s,
z0=p^m, theta=y in HeckeSizes. Do not confuse a0 with the
adjacent row index a=r-1, or z0 with the real budget z.
Let B=diag(b), Z be the SAME projector of exists_projector.
For E the coordinate space on X x H x degree-n letter words,
and D the ambient space on (c_out, coset) x H x letter words,
let Qd=J, Q'd'=J' be the two native depth factorizations:
 J uses input src(e), g_e^transpose, weight w^depth;
 J' uses input c_out, b_coset.out^-1, weight w^depth.
The first surjectivity follows from hs being injective between
finite sets of equal size; the second from quotient representatives.
Keep the same left inverses RQ=I and R'Q'=I.
Write U=blockDiagonal(u(e)) acting on the H coordinates; lift it
by tensoring with I on letter words. The actual caller chooses
 M=(U^-1 tensor Z) R'^T,
 beta=Q'^T (U tensor B).
The threshold y>=6c+2 implies y>=2c and y-(4c+2)>=2c.
Consequently every column of Q' is in the lower excess condition
at y-(4c+2), in every ambient block. By the projector pairing,
blockwise and summed, beta M = a0 I modulo w^c, using R'Q'=I.
The U factors cancel EXACTLY before the pairing because they act
on H, while B,Z act on the letter coordinates. As a0*w=w^(c-1),
this proves the congruence modulo a0*w needed by of_pairing.

Likewise Qv is in excessCond(w^c,y) by its native factorization
at h=y, and Mv' is in that same condition: R'^T produces
arbitrary block vectors, Z maps every letter vector into that
submodule and U^-1 only forms O-linear H combinations within
each e. If Qv-Mv'=a0*w F0, applying every Levi translate and
reading every excessive coefficient gives
 w^c | w^(c-1) (rho(g) F0)_beta.
Cancel w^(c-1) (nonzero since w^2=p in a characteristic-zero
domain) to conclude w divides that coefficient. Since p is a
nonunit so is w, hence the coefficient lies in the maximal
ideal. This is precisely hn of of_pairing, with G=twoBlock,
bad set excess>y, not a stronger zero condition over O.
After reduction, letterRep_map gives the native residue excess
space. This supplies BOTH pairing inputs on the same Q,Q',Z,B.

3. Exact matrix identity at the index composition.
Use D_w=diag(w^depth), D_p=diag(p^depth), on letter words.
From projector field three, B rho(g^T)=rho(g)^T B for ALL
g in GL_k(W), not only Levi. (The invariance of the mean itself
is only Levi.) D_w and B commute; D_w^2=D_p. In each e,
 (D_w rho(b_coset.out^-1))^T B D_w rho(g_e^T)
 = rho(b_coset.out^-1)^T D_p rho(g_e)^T B
 = (rho(g_e) D_p rho(b_coset.out^-1))^T B.
Sum over e with the actual u(e) H-matrix entries. Under the
coordinate permutation/currying epsilon in the source,
 d'^T beta Q d = J'^T (U tensor B) J
               = A B_all,
where A is the native summation operator in hY, B_all is
diagonal b on each input word, and the equality is after
reindexing domain and codomain by epsilon. In particular the
image is contained in image A; no inverse of B_all is needed.
This is why the final source uses epsilon((b ·.2)*F), not
epsilon(F). Do not replace the transpose by conjugate transpose.
Together with hY it ensures the final IndexDvd.map lands in
Y(im f)+p^m im f and Y preserves im f.

4. Exact aggregate exponent at the same caller.
Let D0=(#Monomials(Fin k,n))^N, E0=|X||H|D0=|X||I|.
Let U1= index(parahoric)*dim residue excess at y and
U2=sum_(tau<x) dim residue deepForms(tau), with x chosen
above all depths. Counting gives U1<=(1+kappa)D0 and
U2<=(1+z)D0. The ambient excess space of the pairing has
dimension |X||H|U1, so its returned l satisfies
 E0+l <= |X||H|U1, hence l <= kappa E0.
Each native depth determinant divides w^(|X||H|U2);
transposition does not change the determinant. The native
pairing supplies IndexDvd with scalar (a0^E0)*(p^m)^l.
Using IndexDvd.of_det_dvd for d and d'^T, compose in order
to land in image(d'^T beta Q d)+p^m E. The two depth
exponents add before converting w^2=p. Therefore total
p-exponent exactly bounded by the integer
 t=|X||H|U2 + s E0 + m l.
It follows that
 t <= (1+z+s+kappa*m) E0 <= (z+kappa*m+y) E0,
since y>=6c+2>=s+1. This works also for E0=0, m=0;
no division by card I or kappa. This is the actual
HasType conclusion (the native proof uses c/2=s+1 in its
last linear combination). Retain the original index scalar,
rather than applying the stronger local RUN34 factor.
The resulting lattice inclusion descends by f∘epsilon;
the native hY is needed, not proved by these algebraic steps.

Original graph: counts U1,U2; two depth factorizations;
projector; of_pairing; IndexDvd.comp/map; hY -> hasType_twisted_hecke
-> marked operator. Candidate human graph same suppliers plus
RUN34 split complement and RUN35 class-mean derivation. This
run provides the common-witness bridges, exact cancellation
and exponent assembly; does NOT discharge finrank_excessCond_le_volume,
interlacing cone geometry, remaining depth/root details, actual
marked-column hY, or other A/B/C primitives. Preserve original
graph, constructor/type/value roles and axiom evidence. No
elaborated edge pruned; no assertion of global minimality.
Context cache key includes pin, T,n,k,N,r,ell,s,c,y,z,kappa,
X,H,I,src,g,u,Q,Q',d,d',R,R',B,Z and m.

Execution: retrieved five pinned native blobs plus actual marked
consumer; audited current caller, current mission, protocols,
manuscript and peer head. Local command -v lean/lake/elan
returned no executables. No new native rh_scan/prune/reduce/
auto/frontier; old-pin binaries not assumed compatible.
Re-read actual state receipt compute/rh-compact-primitives-replay-20261126/
status.json at blob a56e2d3afb99ed8275e81fd63c8494306e57c43f,
run 45803534769: status error, partial B/C results retained,
A not completed. No new PASS or redundant finite diagnostics.
The scalar and native probes below are PREPARED, not executed.
No changes to protected workflows or original graph.

RESUME HERE: independently audit sections 2-4 against exact
hasType_twisted_hecke proof (especially epsilon permutation and
IndexDvd.comp order), then replay RUN34-36 in shared pinned
A-module job when feasible. Next mathematical leaf is the
remaining finrank_excessCond_le_volume amplification/flag
injection, unless already closed by a peer; otherwise trace
the marked hY at Data.hasType_markOperator. Do not redo the
completed endgame or claim kernel replay from the probes.
HANDOFF TO theta, audit, integration/editor, shared runner.
-/

namespace CompactKernelRun36

theorem caller_thresholds (s : ℕ) (y : ℝ)
    (h : 6 * (2 * (s : ℝ) + 2) + 2 ≤ y) :
    2 * (2 * (s : ℝ) + 2) ≤ y ∧
    2 * (2 * (s : ℝ) + 2) ≤ y - (4 * (2 * (s : ℝ) + 2) + 2) ∧
    (s : ℝ) + 1 ≤ y := by
  constructor
  · linarith
  constructor <;> linarith

theorem w_normalization {O : Type*} [CommRing O]
    (w p : O) (s : ℕ) (hw : w ^ 2 = p) :
    w ^ (2*s) = p ^ s := by rw [pow_mul, hw]

theorem residual_cancel {O : Type*} [CommRing O] [IsDomain O]
    (w v : O) (s : ℕ) (hw : w ≠ 0)
    (h : w ^ (2*s+2) ∣ w ^ (2*s+1) * v) : w ∣ v := by
  rw [show 2*s+2 = (2*s+1)+1 by omega, pow_succ] at h
  exact (mul_dvd_mul_iff_left (pow_ne_zero _ hw)).mp h

theorem exponent_budget (e q l m s k z y : ℝ)
    (he : 0 ≤ e) (hm : 0 ≤ m)
    (hq : q ≤ (1+z)*e) (hl : l ≤ k*e) (hy : s+1 ≤ y) :
    q+s*e+m*l ≤ (z+k*m+y)*e := by
  have h1 := mul_le_mul_of_nonneg_left hl hm
  have h2 := mul_le_mul_of_nonneg_right hy he
  nlinarith

end CompactKernelRun36

#check ClassMean.exists_mean
#check TwistingData.exists_projector
#check TwistingData.of_pairing
#check TwistingData.exists_depth_factorization
#check TwistingData.index_mul_finrank_excessCond_le
#check TwistingData.sum_finrank_deepForms_le
#check TwistingData.hasType_twisted_hecke
#check IndexDvd.comp
#check IndexDvd.map
#print axioms TwistingData.hasType_twisted_hecke
#print axioms CompactKernelRun36.caller_thresholds
#print axioms CompactKernelRun36.w_normalization
#print axioms CompactKernelRun36.residual_cancel
#print axioms CompactKernelRun36.exponent_budget
