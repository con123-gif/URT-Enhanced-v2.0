# RUN88 — division-free adapted integral lift split

27 November 2026. HUMAN SOURCE-MATCHED INDEPENDENT AUDIT; root B2 PARTIAL.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: mission blob 3adc7622, amendment commit 99cfbd1f, spine 24b10d71,
ledger c40f1deb, manuscript 619ae01b (B2 sections), protocol 4b77b161,
root AGENTS 8db0201d, handoff/expansion, state/log/protocol and continuity.
CI summary 6e0e48cd run 46046068912 (not a fresh RH replay).
Recent peer commits inspected by listing, including Landau RUN84 76c2221e
and determinant class-sum 905f2991; no collision with this target identified.
Resume RUN87 795c3f27. Reuse integration/2026-11-26_COMPACT_LINK_DISCRIMINANT_PRIMITIVES.md
blob 496f885c, section 4 (L10), and integration/2026-11-27_INTERACTIVE_LINK_PAIR_CALLER_AUDIT.md
blob bc88529e. New audit expands the actual primitive basis supplier, rather
than repeating the earlier Gram factorization or redoing the finite-fixer bound.

## 1. Actual source anchors and hypotheses

- New/Filling/LinkPairing.lean a802533ca5a385d6f44c3254f1a4d600b28fc416,
  151–162 HasIntegralLifts.exists_orthogonal_split; consumers 254–269 and 276–278.
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
  59–65 linkMetric/linkDiscSq, 84–88 HasIntegralLifts.
- Lib/General/Algebra/LatticeComplement.lean 2af8405ff10f2d3fd924d048627b67397f0c5960,
  13–16 IsAdelic instance, 60–64 exists_isPrimitiveMatrix_mul_fromBlocks.
- Lib/Adelic/Witt/FrameAction.lean cd3f13d59a5f2351c2fa22267765c723bd3b6001,
  22–29 left inverse/primitivity, 47–48 integral transvection, 55–80 Hermite and
  IsValuationPair.exists_isPrimitiveMatrix_mul.
- Lib/General/Groups/ValuationPair.lean 46f7d3a3fc67d432aa9c6a52997563aff69f4f95,
  380–385 actual valuation-pair predicate.
- Lib/Adelic/Witt/SpaceOperations.lean 42d0ff55145da26c116891f9822c3a3dfddec57a,
  28–30 square primitivity iff integral GL.
- Lib/General/Measure/HaarModulus.lean aaa73a7510926b293d1722b08a3c47420650b917,
  92–93 genIndex_det_eq_one.

Retain E CM and StablyUnram, SAME S,c,gamma, finite index types tau and Fin s,
A=finite adeles of E and R=integral finite adeles. Let m,y be the actual
rational matrices, Q=S.linkMetric and f invertible over A. Write hat for finite
adelization and I(d)=genIndex(d). Native hypotheses are m* Q y=0 and
HasIntegralLifts(c,gamma,hat([m,y]) f). No full-rank hypothesis on [m,y] is
needed by this particular lemma; the caller later supplies it. The required
output is a,v invertible adelic, z arbitrary adelic, with actual integral
lifts hat(m)a and hat(m)z+hat(y)v, and
linkDiscSq(m,a) linkDiscSq(y,v)=linkDiscSq([m,y],f).

## 2. A division-free two-row pivot proves the native Hermite supplier

Work first over the general commutative ring A and subring R in
FrameAction.58–80, with the exact IsValuationPair R axiom. Given entries
alpha,beta of a column, choose e in R, e^2=e, such that
c=(1-e)alpha+e beta spans both entries over R (ValuationPair.382).
Thus alpha=c u, beta=c v for u,v in R; these are existential integral
coefficients, not divisions by c. Put

    P = [[1-e,e],[-e,1-e]],
    d = -e u+(1-e)v,
    L = [[1,0],[-d,1]].

Both P and L have determinant 1 in R: (1-e)^2+e^2=1.
Their inverses have integral entries, explicitly P^(-1)=P^T and
L^(-1)=[[1,0],[d,1]]. Therefore

    L P [alpha,beta]^T = [c,0]^T.                 (88.1)

Indeed P sends the second coordinate to c d, and L subtracts it. This
holds even if c is zero or a zero divisor. It is an explicit alternative
to the native pair of integral transvections at lines 64–67; no extra
domain or local uniformizer assumption. For finite adeles the valuation-pair
instance is retained as in LatticeComplement.13–16.

Process columns in a nondecreasing order of their finite integer weights
wt. Fix the native injection iota from column labels to row labels.
Inductively earlier columns have support among already selected pivot rows
of weight at most their own. For the next column j, use iota(j) as pivot,
and use (88.1) against each row outside the enlarged set of selected
pivot rows. Both involved rows vanish in every earlier column, so earlier
columns are unchanged; all previously cleared rows are untouched.
At the end an integral invertible row operation B satisfies
B X = incl(iota) D, with D block upper triangular (a row of weight
greater than the column weight is zero), and D=rows_iota(B) X.
With U=B^(-1), this is exactly Hermite's factorization
X=U_iota D. Empty index types give the empty identity.

For a rectangular left-invertible X, use the native padding [X;0]
and injection inr into the added row block. Write the resulting
factorization as [X;0]=U_iota D, and let C be the top original
rows of U_iota. Then X=C D. The given left inverse H of X gives
(H C)D=1. Since D is square over a commutative ring, det D is a unit,
so D is invertible (adjugate). Its inverse has the same block upper
triangular shape: each diagonal block has unit determinant since
their product is a unit; block back substitution gives the inverse.
Multiplying the padded factorization by D^(-1) shows the bottom rows
of U_iota vanish. Thus C=X D^(-1) is integral and the top original
columns of rows_iota(U^(-1)) are an integral left inverse of C.
This proves the actual exists_isPrimitiveMatrix_mul using the same
weight ordering, without a rank argument over the non-field A.

Take wt=0 on tau, 1 on Fin s as in LatticeComplement.62.
The matrix D^(-1) has the shape T=[[a,z],[0,v]], with both diagonal
blocks invertible. For every left-invertible X this produces primitive XT.
That is the precise general supplier used here.

## 3. Apply to the SAME f, not to the lift image

Apply the supplier to X=f^(-1), whose left inverse is f.
This gives T=[[a,z],[0,v]] and W=f^(-1)T primitive over R.
By square primitivity W belongs to GL(R), so T=f W and
W R^(tau+s)=R^(tau+s). In particular

    I(det W)=1,
    I(det a) I(det v)=I(det T)=I(det f).          (88.2)

The value one is the GENERALIZED INDEX, not the determinant itself.
This follows because det W is a unit of R and multiplication preserves
R, or from HaarModulus.92–93. The equality of lattices needs W and
its inverse integral; the equality of determinant indices alone is
not sufficient for that.

Unpack the native HasIntegralLifts premise as the SAME rational t
and adelic coefficient matrix u:
    (isotropicFramePair gamma)* ratGram t=0,
    C_c hat(t) u integral,
    hat(linkMatrix(gamma) t) u=hat([m,y]) f.
Multiplying u on the right by the integral W keeps the middle
expression integral and leaves the rational orthogonality premise
unchanged. Restrict columns to each summand. The images are now
the two blocks of hat([m,y]) f W=hat([m,y]) T, namely
hat(m)a and hat(m)z+hat(y)v. This proves the two HasIntegralLifts
witnesses with the SAME t, and u W restricted to the corresponding
columns, exactly the construction at LinkPairing.157–159.
No need for a newly chosen rational t or an independent lift family.

## 4. Orthogonality supplies the exact discriminant product

Since Q is Hermitian, m* Q y=0 implies y* Q m=0. The rational Gram
matrix of [m,y] is diag(m*Qm,y*Qy). Hence, by multiplicativity of
the field norm and its absolute value and by (88.2),

    linkDiscSq([m,y],f)
      = |Norm(det(m*Qm))| |Norm(det(y*Qy))| I(det f)^2
      = linkDiscSq(m,a) linkDiscSq(y,v).         (88.3)

No division by either Gram determinant is used; the identity even
holds when one is zero, or a block is empty (empty determinant 1).
The correction z is absent from (88.3) because this is the product
of the native discriminants of the rational blocks and their diagonal
adelic coefficients. It is NOT a claim that the actual two lifted
blocks are orthogonal after the correction.

At the actual caller LinkPairing.254–269, write K=m, U=u0, Y=y for
the rational common-kernel basis, extension inside L0, and complement
of L0. First split [K,U] versus Y, producing integral [K,U] A
and corrected [K,U] z + Y v (caller p2) with d_[K,U] d_Y=d_total.
Split the SAME first integral block by applying (88.1)–(88.3)
again to its coefficient matrix A, not to the original f. This
produces actual integral K a (caller p3) and K z0+U g (p4) and
d_K d_U=d_[K,U]. Thus d_K d_U d_Y=d_total exactly. Since
K lies in ker zFormPair, its correction in p4 vanishes when
projected to the two z rows, which is precisely the additional
hypothesis for minorNorm_sq_le_linkDiscSq_mul at lines 268–269.
The p2 lift remains unchanged by the second split and is the
one used by pairInvariant_mul_le. This checks the existing L10/L14
connection with no assumption that the corrections vanish integrally.

## 5. Failed simplification routes and exact controls

- Dropping z: over a local DVR O with uniformizer p, take the
  coefficient lattice f O^2 with f=[[1,1/p],[0,1]]. Its intersection
  with the first axis is O e1; its projection to the second axis is O.
  But (0,1) is not in the lattice (first coefficient must be -1/p).
  There is no diagonal adapted basis of the same lattice; a correction
  is essential. This is a control of the algebraic supplier, not a
  claimed native Filling counterexample.
- Replacing primitivity by index one: W=diag(p,p^(-1)) has determinant
  1, but does not preserve O^2. Even true determinant one cannot
  justify multiplying integral lift witnesses by W.
- Replacing index one by determinant literally one: W=diag(-1,1)
  is integral GL and has index one, but determinant -1 in
  characteristic zero. The native proof needs only the index.
- Dividing by c in the two-row pivot: take A=R=Z/6Z, alpha=2,beta=4,
  e=0, c=2. Both entries are R multiples of c, but c is not a unit.
  The shear proof (88.1) is valid without such division or cancellation.
- Dropping orthogonality: m=e1, y=e1+e2, Q=I over Q, f=I gives
  det Gram([m,y])=1 but product of the two one-column Grams=2.

## Verification / integration boundary

Actual work: fetched the pinned compact declarations and source bodies,
matched the existing proof and both real caller invocations, derived
(88.1) by exact ring multiplication and the full Hermite induction,
(88.2) by integral GL, (88.3) by norm multiplicativity. Controls are
explicit mathematical counterexamples, not executed Lean tests. No fresh
kernel run in this session. The shared B2 eleven-declaration replay and
eight-root graph audit are separately recorded in
integration/2026-11-27_B2_C2_GRAPH_AUDIT.md and do not certify this new
human derivation or full B2. URT-style decomposition chose a two-row
pivot and an integral change of coordinates; conventional algebra
is the proof, no timing/complexity advantage established.

RESUME HERE: independently audit the actual sublatticeDisc_mul_index_sq_le
supplier used at LinkPairing.270–275, preserving the SAME K-part integral
lift and marked frame-index map; locate its compact declaration and
check the index direction before combining it with (88.3).
HANDOFF TO integration/audit: use (88.1)–(88.3) as the primitive expansion
of the existing L10, not as a second live proof or a new root closure.
Only this note is added; no protected workflows, schedule, or live ledger
changed.
