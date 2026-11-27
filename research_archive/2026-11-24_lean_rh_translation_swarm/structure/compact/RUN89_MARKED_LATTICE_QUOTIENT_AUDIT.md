# RUN89 — exact marked quotient and both discriminant callers

27 November 2026. HUMAN SOURCE-MATCHED REVIEW; B2 remains PARTIAL.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: mission 3adc7622 and binding amendment 99cfbd1f, live spine
87c621d0, current obligations ledger (read on branch), manuscript 619ae01b, SWARM_PROTOCOL 4b77b161,
root AGENTS 8db0201d, handoff and expansion, state/log/protocol/continuity.
Latest CI summary 54cb0776, run 46053335720, not a native RH replay.
Read RUN88 291538ca and the existing primitive and caller notes
integration/2026-11-26_COMPACT_LATTICE_SATURATION_AND_CONVERGENCE.md
(694fc9ad) section 1 and
integration/2026-11-27_INTERACTIVE_LINK_PAIR_CALLER_AUDIT.md (bc88529e)
section 2. Their inequality already exists; this is an independent
audit of its primitive, with an exact residual quotient and a check
of the second native caller. Recent commit listing included Landau
RUN85 023d60ec. No collision identified.

## 1. Actual supplier and exact premises

New/Filling/GramLiouville.lean e0e55155b72a00bb6c11d618bf1961e52a4e696c,
lines 40–85, sublatticeBasis, sublatticeDisc,
sublatticeDisc_mul_index_sq_le. Keep the native CM and StablyUnram
hypotheses, A=finite adeles of E, R=integral finite adeles.
H is rectangular with LEFT inverse L (LH=1); Y is arbitrary.
V is a rational subspace, s=dim_E V, x has s rational columns in V,
w in GL_s(A). Set n=H hat(x) w. Premises: n integral, all columns of
Yn in the SAME target R-submodule K, and

    D = I(det hat(x* x)) I(det w)^2 != 0,

where * is conjugate transpose, hat is finite adelization, and I is
genIndex. The chosen b=sublatticeBasis(LH=1,V) has Hb primitive, and
b=hat(y)a with y a rational basis of V and a in GL_s(A).
The conclusion is (d i)^2 <= D, d>0, i>=1, for
d=sqrt(I(det(b*b))), i=submoduleIndex(K,colLattice(YHb)).
No injectivity of Y, inclusion of K in the image, or integrality of
b itself is a premise. Native submoduleIndex(K,M) means [M:K intersect M]
with 0 for infinite index (AdelicRingDefs, blob 86816820).

## 2. The exact residual factor

From x=yB over E and b=hat(y)a, write
hat(x)w=bC with C=a^(-1)hat(B)w. An integral left inverse J of Hb
exists by primitivity, so C=J n is integral. Gram congruence gives

    D=I(det(b*b)) I(det C)^2.                         (89.1)

Here both factors are nonzero by D!=0; the generalized index is zero
on nonunits and strictly positive on units. Thus C is invertible
over A by the adjugate, and d>0. No inference of invertibility merely
from nonzero determinant over the ring of adeles is used.

Put F=YHb as an R-linear map on R^s, and M=F(R^s).
Let W={v in R^s : Fv in K}. The column condition gives
C R^s subset W subset R^s. The exact sequence of finite additive groups is

    0 -> W/C R^s -> R^s/C R^s -> M/(M intersect K) -> 0,  (89.2)

where the last map sends v to Fv modulo M intersect K. Surjectivity
is by definition of M; its kernel is precisely W/C R^s. All groups
are finite: C in GL_s(A) is integral, C R^s compact open in R^s,
so R^s/C R^s compact discrete. No topology of K is needed.
In particular, with q=I(det C), e=#(W/C R^s),

    q = i e,  i,e positive integers,
    D = (d i e)^2.                                   (89.3)

The index formula q=[R^s:C R^s] is the actual
GeneralisedIndex.submoduleIndex_colLattice_intVectors
(Lib/General/Algebra/GeneralisedIndex.lean c4255a25, last lemma),
using the determinant Haar modulus, not a rational determinant
approximation. The conjugation square uses LatticeComplement.49–51
(blob 2af8405f) and GeneralisedIndex.genIndex_star. The divisibility
in the original proof is LatticeComplement.31–39; (89.2) explicitly
identifies its kernel. In particular (d i)^2<=D, and equality holds
IFF C R^s=W. The native statement needs only the inequality.

The primitive b really spans the entire class lattice:
if t=hat(y)v and Ht is integral, then t=b a^(-1)v, and applying
J to Ht proves a^(-1)v is integral. Conversely H b is integral.
The primitive basis existence itself is the retained
LatticeComplement.exists_preimageLattice_eq_colLattice (68–71),
now with the earlier RUN88 integral completion proof. No global
O_E-free module assumption.

## 3. First actual caller: the common link

LinkPairing.lean a802533c, 239–278, particularly 270–275.
Keep the SAME K-part lift p3 from the two successive splits of
RUN88. Here the K-part rational basis is called m; p is its first
X0 block. Avoid confusing the target K above with the common-link
kernel. Native m* linkMetric m = p* p and positive Gram determinant
give D=linkDiscSq(m,a)>0 using the SAME split coefficient a.
Set H=classCoordX0(c), F's output map Y=frameMiddle(k0)* latMiddle
with k0=termPosition(c,c',gamma). The target K is the column lattice
of xRows(frameGram(k0))*.
The actual n-witness from p3.exists_isIntMatrix gives H hat(p)a as
its middle block; BoxPartition.422–429 gives the signed relation

    Y H hat(p)a = xRows(frameGram(k0))* (-n_X).

Thus the columns are in K by the actual integral n_X, not by
unmarked rational orthogonality. The full H-integral lattice in
colSpan p is the one in latticeDisc(c,commonLink); i is exactly
frameValueIndex(c,k0,1,commonLink). Equation (89.3) gives the
required lower bound for dK in the existing L14 and RUN80 pair
assembly. The additional residual e need not be 1 at this caller;
the lift is selected by the preceding two triangular splits, not
by taking the full inverse-image lattice of Y. Do NOT replace
this inequality by equality here.

## 4. Second actual caller: exact full marked-lattice identity

BlockBound.lean 6c68e80e, 21–73, specifically 29–44 and 53–64.
The prior primitive note section 3 supplies the class-average
inequality. Here the same quotient reveals why the per-class
discriminant comparison is in fact an equality for the FULL
chosen class lattice, a useful normalization check.

Fix the SAME u and coset phi in the finite Kf quotient. Use the
native double-coset equation at line 29, writing the chosen
class representative as c.out=g u phi.out k, with rational
unitary g and k in columnLevel. Put eta=g^(-1), y_phi=phi.out k,
as in lines 30 and 53; y_phi and its inverse are integral unitary.
Let T be the original rational subspace, V=eta T, P its rational
linear isometry. Let Lambda0 be the full lattice in V with H=u^-1
(the native u.1.3) taking values in R^k. Let Lambda_c be the full
lattice in T made integral by classCoordX0(c). Its chosen basis
q=hat(x)a is exactly the sublatticeBasis used at line 56.
CrudeBoundDefs.80 (0ba0d253) defines classCoordX0(c)=B0 c.out^-1
with B0=middleBaseChange 𝔰 S.piBar. Hence for v in the adelic
span of T,

    classCoordX0(c) v = B0 y_phi^-1 u^-1 eta v.

LatticeChart.isIntMatrix_middleBaseChange_mul (5c87f908, lines
34–38) states the exact equivalence of B0 l integral to l integral
AND its marked row in piBar R. Since y_phi is integral GL, we
obtain the equality of lattices, not just an inclusion,

    eta Lambda_c = { z in Lambda0 :
           row_k0(y_phi^-1 u^-1 z) in piBar R }.       (89.4)

This applies vectorwise (one-column case of the chart lemma).
In (89.2) take b a full primitive basis of Lambda0,
Y=replicateRow Unit (row_k0(y_phi^-1)), K=piBar R in the single
output row, and the transported q'=eta q=bC. Equation (89.4)
gives exactly C R^s=W. Thus e=1 here, and Gram invariance of
the SAME rational unitary eta gives

    latticeDisc(c,T) = sublatticeDisc(u^-1,eta T) * i_phi(eta T).
                                                        (89.5)

Both square roots are positive: the rational basis Gram is
nonsingular by CM positivity under a complex embedding, and
the coefficient matrix is invertible adelically. For s=0 all
empty determinants and all indices are 1. The native proof
only uses <= after taking inverse powers; (89.5) proves that
direction and also the exact equality for this full-lattice
choice. It does not change the remaining weighted counting,
finite coset injectivity, or Haar averaging suppliers. In
particular the map T -> eta T is a bijective rational subspace
transport, not a new choice of class or independently optimized
representative. Do not change the native final constants.

## 5. Negative controls and verification boundary

- A noninjective mark: R=Z_p, C=p I_2, F=(1,0), K=p R.
  q=p^2, i=p, e=p. Thus equality is false for arbitrary selected
  integral lift; (89.3) is exact and the original inequality holds.
- K need not be contained in M: R=Z_p, M=pR, K=R. The native
  index is 1, not a reversed quotient [K:M]=p.
- Dropping the marked row: R=Z_p, H=1, y_phi=1, piBar=p,
  the unmarked lattice is R, the full marked lattice pR.
  Integral GL alone does not make their discriminants equal.
- Nonzero determinant over A does not suffice: a finite-adele
  idempotent supported at one finite place is nonzero and nonunit.
  The D!=0 generalized-index premise is what excludes it.
- If an arbitrary smaller class lattice is substituted in (89.4),
  e may exceed 1. The exact equality is tied to the native
  sublatticeBasis and its integral left inverse, not any spanning
  matrix.

Actual verification: fetched exact pinned source declarations and
both named callers; independently checked the short exact sequence
and the full marked-lattice preimage by algebra. Negative controls
are explicit mathematical examples, not simulated native data.
No fresh Lean execution. The previously accepted joint B2 replay
and graph audit remain distinct and do not certify (89.5) as a Lean
replacement. URT-style decomposition isolates the residual quotient;
the conventional group exact sequence supplies the proof. No
empirical acceleration claim. No new physics, workflow, schedule
or live ledger edits.

RESUME HERE: audit the actual NearTerms.tsum_sublatticeDisc_inv_le
supplier used at BlockBound.35, focusing on the precise dyadic
Minkowski bound and the summation normalization, reusing section 2
of the existing 26-November lattice/convergence note (not repeating
the already audited marked quotient).
HANDOFF TO integration/audit: use (89.2)–(89.3) as the primitive
proof expansion and (89.4)–(89.5) as a caller-specific normalization
check; the live B2 root is not closed.
