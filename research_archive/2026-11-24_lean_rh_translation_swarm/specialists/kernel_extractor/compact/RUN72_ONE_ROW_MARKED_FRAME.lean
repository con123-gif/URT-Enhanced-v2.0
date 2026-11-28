import Lib.GLn.SchurModule.Hook
import New.Columns.TwistedHeckeType
import Mathlib.Tactic

/-!
RUN72 — one-row marked-frame supplier: direct coefficient proof.
28 November 2026. HUMAN SOURCE-MATCHED / PREPARED; no native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION checked. RUN71 fd2f1842 remains
the accepted queue configuration (not a verified proof). At this run,
the state branch status.json, outputs/a1/a1_transport.log and
outputs/run71.json for rh-compact-a1-cached-single-pass-20261128
all returned 404. Actions API showed shared compute run 46114460776
pending; no native receipt yet. Do not enqueue a duplicate.
Peer RUN77 marked pullback and RUN63 class intertwining already
derive the local coset/letter identities; RUN78 derives log-free
index. Neither is repeated. Latest integration minimal signed star
1cda73bdccdb67a5f47ad023e918e00ce81c1792 also read; its C and shell
transports are separate and not rederived.

Actual missing A1 frame supplier retained by theta RUN77 section 4:
Columns.hasType_markOperator's choose psi hpsi, which uses
schur_one_row_eq_symPowMatrix and subsequently the SAME psi at
the hY coefficient comparison. Source anchors relative to compact src:
- Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f
  schur_one_row_eq_symPowMatrix: original surjection proof passes
  through sum_coords_nablaBasis, mem_nabla and Borel equivariance.
- Lib/General/Algebra/ZerosCostDegree.lean f572d0f6d5038d5e13b6de766797f44128a5990b:
  Tableau, minor, tableauPoly, IsStdTableauSet, StdTableau,
  nablaBasis, schurDetExp, rowSubst, schur, linSubst, symPowMatrix.
- Lib/GLn/SchurModule/SchurMatrix.lean 8c91b4b7888c99e604df5fa2dd38a130b4fea7bb:
  isStdTableauSet_epsilon at 29, sum_coords_nablaBasis at 88,
  PolyRep.schur_eq_of_expansion at 112.
- New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48:
  choose psi hpsi and subsequent marked hY comparison.
Integration 2026-11-26_COMPACT_MARKED_ORBIT_AND_SIZES already checks
the actual strict height cutoff and lastEntry=0. Preserve those.

Direct human proof, using the native selected basis, not an independently
chosen monomial basis. Let q:sigma~m, 1<|m|, and k(h)=a for h=1,
k(h)=0 for 1<h<|m|. At one place the basis index is a selected
filling i. Heights 0 contribute determinants of empty matrices,
equal to 1, regardless of k(0). Heights >= |m| do not occur.
Every remaining height-one column contributes exactly one variable
x_b=y_(q(b),0), and there are a columns. Define phi(i)_b as their
multiplicity. Then the native basis polynomial is precisely x^phi(i)
with coefficient 1 and |phi(i)|=a.

The native isStdTableauSet_epsilon.1 at R=C provides both linear
independence on its selected fillings and that EVERY filling's minor
product is in their span. Use these two clauses directly, transported
by the injective row rename q and singleton-place inclusion. Distinct
selected indices cannot give the same exponent, by independence.
For each degree-a exponent d, choose a list of length a containing
d_b copies of b, assign it to the a height-one columns, use the unique
empty entries at height zero and vacuous entries at other heights.
This is an actual Tableau (no ordering condition in its definition).
Its polynomial is x^d, so the span clause gives a finite expansion
x^d=sum_i lambda_i x^phi(i). Apply coeff_d: if d is not among phi(i),
the left coefficient is 1 and the right coefficient is 0.
Thus phi is surjective. This derives the SAME required bijection
without proving x^d in the Borel semi-invariant module or invoking
sum_coords_nablaBasis on that membership. It works for a=0 too.
No claim that the deeper standard-basis existence theorem has gone
away: isStdTableauSet_epsilon is still a supplier.

The exact Schur coefficient now has one formula. For Z_bu =
z_(q(b),q(u)), for alpha=phi(i) and beta=phi(j), it is
  c^a S(z)_(i,j) = [x^beta] product_b (sum_u c Z_bu x_u)^alpha_b.
The native schurDetExp for the SAME rank is zero, so no determinant
factor occurs. Expand the product in the proven monomial basis and
apply the native PolyRep.schur_eq_of_expansion for c*z.
Homogeneity (total degree a) gives S(c*z)=c^a S(z), even c=0
with a=0 interpreted as the empty product. Because linSubst(A)
sends X_b to sum_u A_ub X_u, the displayed coefficient is
symPowMatrix a (c * Z^T)_(beta,alpha), not _(alpha,beta).
Equivalently sum over nonnegative integer tables M_(b,u) with row
sums alpha and column sums beta, each term
  product_b multinomial(alpha_b; M_(b,*))
  * product_(b,u) (c Z_bu)^M_(b,u).
This is an integral polynomial in the entries; no division by
factorials, c, determinants, or a matrix norm is needed. The same
formula specializes to weight zero, and respects the original
letter transpose and index orientation in the marked hY caller.
Retain the marked scalar p^markExponent, local frame choice and
unmarked integral invertible factors of theta RUN77; no new bound.

Original occurrence graph:
  chosen basis -> Borel membership + sum_coords_nablaBasis
  -> phi surjectivity -> Schur coefficient -> hY -> A1.
Candidate:
  chosen basis independence + all-filling span -> coefficient at d
  -> SAME phi bijection -> SAME Schur coefficient -> SAME hY.
The original proof can continue to be used until the exact statement
replacement and graph are verified. Even after a successful replay,
the omitted Borel path may remain reachable through the selected
basis theorem or another caller; no global removal inferred.
The generic hY and remaining class/Hecke/count/gauge primitives
are still required. No weighted-prime inequality established.

Actual connector verification: 4 pinned source blobs and 14 exact
anchors matched. Integer BigInt coefficient regression: 1456
comparisons, 552 distinguish the wrong missing-transpose formula.
Reproduce: degrees a=0..5; matrices [[1,2],[3,4]], [[0,1],[-2,3]],
[[2,0],[1,-1]], [[0,0],[0,0]]; c=-2,0,1,3; alpha=(i,a-i),
i=0..a. Expand two linear forms by repeated coefficient convolution.
Compare c^a times the original row-substitution coefficients with
column-substitution coefficients of c Z^T at every output exponent.
Also compare to c Z, counting unequal coefficients. These are
orientation regression controls only, not actual global RH data or
a proof by sampling. The symbolic argument above covers all degrees
and ranks under the stated native basis premises.
No local native rh_scan/prune/reduce/auto/frontier run, kernel pass or
new axioms verified. Below is a PREPARED coefficient certificate plus
the exact native supplier probes. No Main import, no claimed RH theorem
import. No changes to previous graph or axiom evidence.

RESUME HERE: inspect RUN71's actual cached A1 receipt and repair its
first failed stage if present; if the queue is still pending, use the
existing authenticated workspace to stage the exact one-row replacement
at Hook.schur_one_row_eq_symPowMatrix using the all-filling span proof,
then check original statement/axioms and original/reduced graph.
Do not enqueue a cold build or discard the original standard-basis
dependency. HANDOFF integration/theta/audit. A1/star/RH OPEN.
-/

namespace KernelRun72
open MvPolynomial

/-- A finite expansion of a monomial in monomials must contain its
    exponent, independently of the choice of coefficients. -/
theorem exponent_occurs {ι σ : Type*} [Fintype ι]
    (e : ι → σ →₀ ℕ) (d : σ →₀ ℕ) (w : ι → ℂ)
    (h : (∑ i, w i • monomial (e i) (1 : ℂ)) = monomial d 1) :
    ∃ i, e i = d := by
  classical
  by_contra! hn
  have hz : ∀ i, (monomial (e i) (1 : ℂ)).coeff d = 0 := by
    intro i
    simp [coeff_monomial, hn i, (hn i).symm]
  have hc := congrArg (coeff d) h
  simp [coeff_sum, hz] at hc

#print axioms exponent_occurs
end KernelRun72

#check isStdTableauSet_epsilon
#check PolyRep.schur_eq_of_expansion
#check schur_one_row_eq_symPowMatrix
#check Columns.hasType_markOperator
#print axioms schur_one_row_eq_symPowMatrix
