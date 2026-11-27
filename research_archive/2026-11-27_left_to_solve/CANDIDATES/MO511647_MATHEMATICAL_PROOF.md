# MO511647: symmetric-square proof candidate

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed), November 27, 2026.

Status: complete human proof candidate, independently exact-tested for
n=3,5,7,9,11. No Lean verification, official lease, submission or acceptance
has been obtained. Finite tests are not used as the proof.

Source: taobaozhe, May 25, 2026,
https://mathoverflow.net/questions/511647,
licensed CC BY-SA 4.0. The whole current question, empty answer list and
its sole author comment were retrieved and read. Actual Stack Exchange
HTTP200 snapshots are mo511647_mo515594_primary.json. The formulas for the
question's blocks apply to odd n>=3; the n=1 indexing requires a separate
definition rather than exploiting its missing blocks.

## Identification with a symmetric square

Let V have ordered basis x_0,...,x_(n-1), over Z. Define T by

* T(x_0)=x_0;
* T(x_1)=x_0-x_(n-1);
* T(x_j)=x_(j-1)-x_(n-1), for 2<=j<n.

Its matrix has first row (1,1,0,...), the next n-2 rows shifting columns
2,...,n-1 into rows 1,...,n-2, and last row (0,-1,...,-1).

Consider the homogeneous quadratic polynomials Sym^2(V), with monomial
basis ordered first by the larger index and then by the smaller index:

    x_0^2, x_0*x_1, x_1^2;
    x_0*x_2, x_1*x_2, x_2^2;
    ...;
    x_0*x_(n-1), ..., x_(n-1)^2.

The semicolon-separated blocks have lengths 3,3,4,...,n, exactly as in the
question. Extend T multiplicatively to quadratic polynomials.

For the first three columns, the images are

    x_0^2,
    x_0^2-x_0*x_(n-1),
    x_0^2-2*x_0*x_(n-1)+x_(n-1)^2.

This gives C_1=(1,1,1), D_1=(0,-1,-2), and the final-row first block
(0,0,1). For a later column block j>=2, the images are

    T(x_0*x_j)=x_0*x_(j-1)-x_0*x_(n-1),
    T(x_1*x_j)=x_0*x_(j-1)-x_0*x_(n-1)
                 -x_(j-1)*x_(n-1)+x_(n-1)^2,
    T(x_i*x_j)=x_(i-1)*x_(j-1)-x_(i-1)*x_(n-1)
                 -x_(j-1)*x_(n-1)+x_(n-1)^2 (2<=i<j),
    T(x_j^2)=x_(j-1)^2-2*x_(j-1)*x_(n-1)+x_(n-1)^2.

Thus the top block has first row (1,1,0,...) followed by shifted identity
rows. The lower rows have zeros below the block diagonal, diagonal rows
(0,-1,...,-1,-2), off-diagonal first row (-1,-1,0,...) and subsequent
rows -e_(i+1), and final row (0,1,...,1). These are precisely every entry
of U_n and L_n in the original question. Therefore A_n=Sym^2(T), in the
displayed ordered monomial basis; this is an identification to be
formalized, not an additional hypothesis.

## An explicit cyclic basis for T

For n>=3 define

    v_0=x_(n-1),
    v_j=x_(n-j-1)-x_(n-j), 1<=j<n.

Direct substitution in the defining action gives

    T(v_i)=v_(i+1) for i<n-1, and T(v_(n-1))=v_0.

The inverse change of coordinates is the telescoping identity

    x_k=sum_(j=0)^(n-1-k) v_j.

Consequently the change-of-basis matrix and its inverse have integer
entries: this is a unimodular basis. T is conjugate over Z to an n-cycle
permutation matrix. In particular T^n=I, and functoriality gives A_n^n=I
directly for the original integer matrices. This especially short cyclic
basis was independently supplied and checked by another ChatGPT/Codex
research lane; it replaces this lane's longer cyclic basis over Q.

## The complete characteristic polynomial for odd n

The quadratic monomials v_i*v_j with 0<=i<=j<n form another basis of
Sym^2(V). On it T acts by adding 1 to both indices modulo n, and then
forgetting the order of the pair. This action has only orbits of length n
when n is odd. Indeed, if adding k fixes an unordered pair, it either fixes
both indices, so k=0 mod n, or exchanges them, so 2k=0 mod n. Oddness again
forces k=0 mod n, including the diagonal pairs.

There are n(n+1)/2 unordered pairs with repetition, therefore exactly
(n+1)/2 orbits, each of length n. In the corresponding reordered basis,
A_n is a block diagonal sum of (n+1)/2 n-cycle permutation matrices.
Each block has characteristic polynomial t^n-1, so

    charpoly(A_n)=(t^n-1)^((n+1)/2).

All changes of basis here are integral: substitution of the inverse
unimodular linear change gives an inverse on the quadratic monomials.
The identity therefore holds over Z itself. It proves both boxed
assertions of the question, including the claimed algebraic
multiplicities.

## Prior mathematics and bounded literature audit

The base matrix T is exactly the matrix in Ada Stelzer and Alexander
Yong, RSK as a linear operator, Selecta Mathematica 32,88 (2026),
Proposition4.3. Their Lemma5.2 proves charpoly(T)=t^n-1 by a companion-
matrix argument. Those portions of the primary paper were opened and
read at https://doi.org/10.1007/s00029-026-01191-5. The present cyclic
basis proof does not require taking their result as an unproved premise.
The new step being investigated is the precise identification of the
question's larger matrix with Sym^2(T).

At the source retrieval there were zero answers and one comment, which
does not supply this proof. Both web search engines, title/ID searches,
and a proper all-state upstream PR search for511647 found no explicit
earlier resolution. This is a bounded audit, not a worldwide priority
claim. Fresh eligibility and all prior gates must be repeated before a
lease or any official publication.
