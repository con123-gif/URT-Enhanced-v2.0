# A corrected inverse-permanent congruence modulo eight

Status: complete hand argument, independently challenged by the algebra lane;
Lean formalization remains unfinished. No official claim, submission, acceptance or verified Lean
proof is asserted. In particular this document is not a counted campaign solve.

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact model variant is not exposed). The runtime lane supplied the original
exact small-graph screen. The algebra lane independently reduced the MacMahon
route to a principal-minor identity; the congruence-invariance argument below
is a different continuation. Classical determinant identities and symmetric
Gaussian elimination are acknowledged as prior mathematics. In particular,
the determinant-stability helper was discussed and proved by Darij Grinberg
in comments to MSE 2688219 (2018); the complete question and six comments were
read during the independent audit. That prior result does not state the
inverse-permanent congruence proved here.

## Proposed theorem

Work over the integers localized at two, so odd denominators are permitted.
Let A be an invertible symmetric matrix of even order, with even diagonal and
odd determinant. Write B=A inverse, and A0=A-diag(A). Then

per(B) det(A) = det(A0) modulo eight.

Equivalently per(B)=det(A0)/det(A). For a simple graph A the diagonal is zero,
so this proves the first conjecture in MO513259. The reduction recorded in
STRUCTURAL_REDUCTION.md then proves the second conjecture modulo24.

Throughout, reducing a matrix modulo two gives a nonsingular alternating
matrix. Its inverse is alternating as well; consequently both A and B have
even diagonal. All calculations explicitly involving division by two are
of expressions already shown even; their result is used only modulo two.

## 1. An elementary determinant fact

If C is symmetric, even-diagonal and invertible modulo two, adding an even
number to a symmetric offdiagonal pair preserves det(C) modulo eight.

Indeed put D=C inverse and change C by 2s(Eij+Eji). The rank-two determinant
lemma gives the determinant ratio

1 + 4s Dij + 4s^2(Dij^2-Dii Djj).

The Dii are even. Modulo two, s^2=s and Dij^2=Dij, so the displayed correction
is zero modulo eight. Several offdiagonal pairs can be changed successively;
each intermediate matrix is still invertible modulo two.

## 2. Variation of the permanent under an elementary congruence

Fix i different from j, let T=I+tEij, and set B'=T B T transpose. Let R be the
permanent of B after row i is replaced by row j. Let S be its permanent after
both row i is replaced by row j and column i is replaced by column j. Repeated
row/column multilinearity gives the exact identity

per(B')-per(B)=2t R+t^2 S.

Swapping the two equal rows proves R=2R0, with

R0 = sum over k<l of Bjk Bjl per(B[rows except i,j; columns except k,l]).

Modulo two, permanent equals determinant. Jacobi's complementary-minor
identity, using det(B)=1 modulo two, gives

R0 = sum_(k<l) Bjk Bjl (Aki Alj + Akj Ali)
   = sum_k Bjk Aki Akj                    (modulo two).

For the last equality expand the product of the two sums given by BA=I;
the cross term is (BA)ji(BA)jj=0.

To compute S modulo eight, distinguish how many of the two duplicated rows
map into the two duplicated columns in the permutation expansion.

* If both do, there are two assignments, with factor Bjj^2. This is divisible
  by eight since Bjj is even.
* If exactly one does, there are four equal assignments, each including the
  even factor Bjj. Again the total vanishes modulo eight.
* If neither does, let K and L be the two external image and preimage sets.
  The duplicated rows and columns give a factor four. Modulo two, terms with
  K different from L cancel in transpose pairs, since B is symmetric. For
  K=L={k,l}, the remaining permanent is principal and the edge-weight product
  reduces to Bjk Bjl modulo two.

Thus S=4S0 modulo eight, where

S0 = sum_(k<l, k,l outside {i,j}) Bjk Bjl det(A[{i,j,k,l}])  (modulo two).

Here Jacobi was applied to the complementary principal minor of B. Since A
modulo two is alternating, its four-by-four determinant is

Aij Akl + Aik Ajl + Ail Ajk modulo two.

The last two terms reproduce R0 restricted to k,l outside {i,j}. This
restriction equals the full R0: terms involving j vanish because Bjj is zero
modulo two; terms involving i sum to Bji Aij(BA)ji=0. Consequently

R0+S0 = Aij q_A0(B e_j) modulo two,

where q_A0(x)=sum_(k<l) Akl xk xl, over F2. Extending this quadratic sum to
indices i,j causes no change: the additional i-terms sum to Bji(AB)ij=0 and
the j-terms vanish. Since t^2=t modulo two,

per(B')-per(B) = 4t Aij q_A0(B e_j) modulo eight.       (1)

## 3. The determinant ratio has the same variation

The inverse transforms as A'=T inverse transpose A T inverse, with det(A')=
det(A). Direct entry expansion gives

A'0 = T inverse transpose A0 T inverse
      - t Aii(Eij+Eji) + 2t Aij Ejj.

The middle term changes an offdiagonal pair by an even amount. By Section1
it causes no change modulo eight. The cofactor of the final diagonal change
is det(A0 with coordinate j deleted): deleting j removes all effects of T
and of the middle term. Hence

det(A'0)-det(A0) = 2t Aij det((A0)_(delete j)) modulo eight.

Removing the even diagonal from the odd-order principal matrix, and expanding
only to first order modulo four, gives

det((A0)_(delete j)) = det(A_(delete j))
  - sum_(k different from j) Akk det(A_(delete j,k)) modulo four.

Jacobi gives det(A_(delete j))=det(A) Bjj and
det(A_(delete j,k))=det(A)(Bjj Bkk-Bjk^2). It follows that

det((A0)_(delete j))/(2 det(A))
  = Bjj/2 + sum_k (Akk/2) Bjk^2 modulo two.

On the other hand (B e_j) transpose A (B e_j)=Bjj, so the right side is
exactly q_A0(B e_j) modulo two. Thus

det(A'0)/det(A')-det(A0)/det(A)
  = 4t Aij q_A0(B e_j) modulo eight.                  (2)

Equations (1) and (2) prove that the difference

per(B)-det(A0)/det(A)

is invariant under every elementary congruence shear on B. Simultaneous index
permutations also preserve it.

## 4. Reduction to two-dimensional blocks

Every invertible alternating matrix modulo two has an odd offdiagonal entry.
Permute such a pair into the first two coordinates. Its even-diagonal two-by-two
block is invertible. Elementary congruence shears clear its cross blocks, leaving
an even-diagonal invertible Schur complement of order two less. Iterating reduces
B to a direct sum of two-by-two even-diagonal invertible blocks. Each clearing
block-triangular transformation is a product of the single-coordinate shears
already treated, so the invariant difference is preserved throughout.

The required equality holds for each two-by-two block. To see this in A
coordinates, write A=[[2a,c],[c,2d]] with c odd and D=4ad-c^2 odd. Then

per(A inverse)=(4ad+c^2)/D^2 = 4ad+c^2 modulo eight,

whereas det(A0)/D=-c^2/D=-c^2 D=4ad+c^2 modulo eight, using odd squares equal
to one modulo eight. Both permanent and the determinant ratio are multiplicative
on direct sums. The empty matrix also satisfies the identity. This finishes the
proposed general proof.

## Remaining verification work

The algebra lane independently checked the duplicated-row/column orbit
counts, the four-index complementary-minor calculation, the exact inverse
shear, the half odd-minor identity and the block reduction, and found no
mathematical gap. This is separate from Lean verification.
The argument has not yet been executed in Lean. A formal certificate will need
generic permanent multilinearity/minor-expansion helpers in addition to the
standard determinant identities. Finite screens support the identity but are
not used in the proof.
