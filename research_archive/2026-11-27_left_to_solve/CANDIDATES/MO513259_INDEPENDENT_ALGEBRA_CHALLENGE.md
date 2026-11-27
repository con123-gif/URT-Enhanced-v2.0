# MO513259: independent algebraic challenge of the corrected inverse-permanent identity

Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6, 27 November 2026. Exact serving variant not exposed. This note records a complete informal mathematical challenge, not Lean verification, an official lease, submission or acceptance. The combinatorics lane originated the corrected identity and shear strategy; this lane independently derived the cancellation formulas and the odd-minor lemma below.

## Target and source fidelity

The actual full question https://mathoverflow.net/questions/513259 was read from the primary snapshot and live search/open source, including both graph conjectures. For a simple graph adjacency matrix A it asks per(A inverse)=1 modulo8 when invertible modulo8, and 2per(A)+per(A inverse)-3=0 modulo24 when invertible modulo24. The final suggestion extending these assertions to all symmetric even-diagonal matrices is false, and should be explicitly distinguished from the two graph assertions.

The stronger corrected identity under investigation is

    det(A) per(A inverse) = det(A - diag(A)) modulo8

for every invertible symmetric even-diagonal matrix over Z/8Z. This identity implies the first graph assertion. The combinatorics lane's already written mod4 matching and characteristic3 reductions then imply the second graph assertion. This note independently challenges the corrected identity; it does not claim to have reverified a future Lean certificate.

All calculations below can be made in the localization of Z at odd integers and reduced modulo8. Every Z/8Z matrix has an integer lift; its odd determinant is a unit in this localization. This also justifies exact use of the zero determinant of an odd-dimensional skew-symmetric integer matrix.

Write B=A inverse, C=A-diag(A), D=det(A), and define q_C(x)=sum over r<s of C_rs x_r x_s over F2. Both A and C reduce to the same nonsingular alternating form modulo2. Their inverses are alternating modulo2: for an inverse N, x-transpose N x=(Nx)-transpose A(Nx)=0. Consequently every diagonal entry of B and C inverse is even.

## A known determinant helper

If H is symmetric, even-diagonal and has odd determinant, changing an off-diagonal pair H_ij,H_ji by the same even amount2u leaves its determinant unchanged modulo8. With N=H inverse, the rank2 determinant formula gives the ratio

    1 + 4u N_ij + 4u^2 (N_ij^2 - N_ii N_jj).

Here N_ii N_jj is divisible by4, and u N_ij+(u N_ij)^2 is even. The ratio is1 modulo8.

This helper is prior mathematics. Darij Grinberg gave the corresponding rank2/Dodgson argument in all six comments of the primary 2018 question https://math.stackexchange.com/questions/2688219/about-the-determinant-of-a-symmetric-matrix-with-even-diagonal . The complete question and all comments, including the author's confirmation, were read; snapshot fresh_algebra_work/MSE2688219_comments.json has has_more=false. That discussion does not state an inverse-permanent identity.

## Independent odd principal-minor lemma

For every j,

    det(C with row and column j deleted)/2 = q_C(B e_j) modulo2.

To prove it, let H be that odd-dimensional hollow symmetric principal submatrix. Replace its lower triangle by the negatives of its upper triangle, obtaining a skew-symmetric integer matrix K with zero diagonal. Then H=K+2L, where L is the strictly lower triangular part of H. Since K has odd size, det(K)=0 exactly. First-order expansion modulo4 gives

    det(H) = 2 sum over r>s of H_rs cofactor_rs(K) modulo4.

Modulo2, the cofactors of K and H agree. Jacobi's complementary2-minor identity in the full invertible C, together with (C inverse)_jj=0 modulo2, gives

    cofactor_rs(H) = (C inverse)_jr (C inverse)_js modulo2.

Signs and the odd determinant are1 modulo2. Substitution proves the claim, since B and C inverse agree modulo2 and the j coordinate of their jth column is zero. In particular this derivation independently proves the needed evenness of det(H).

## Independent permanent shear calculation

Fix i different from j and let T=I+tE_ij, B'=T B T-transpose. Multilinearity in row i and column i gives

    per(B')-per(B) = 2t R + t^2 S,

where R is the permanent with row i replaced by row j, and S is the permanent with both row i and column i copied from row and column j.

The duplicate-row action pairs all terms of R. Dividing by2 and reducing modulo2, then applying Jacobi's complementary2-minor identity, yields

    R/2 = sum_k B_jk A_ki A_kj modulo2.

One way to see the final simplification is to expand the product of the two inverse identities sum_k B_jk A_ki=0 and sum_k B_jk A_kj=1; the off-diagonal double sum equals the diagonal sum in characteristic2.

For S use the commuting swaps of the two equal rows and of the two equal columns. A term orbit has size2 only when those rows map to those columns; its weight contains B_jj squared and its contribution vanishes modulo8. Size4 orbits hitting that pair once contain one even B_jj and also vanish modulo8. The remaining orbits are indexed by unordered2-subsets K,L outside {i,j}. Transposition pairs K,L, so after dividing by4 only K=L remains modulo2. Jacobi's complementary4-minor identity gives

    S/4 = sum over k<l outside {i,j} of
      B_jk B_jl (A_ij A_kl + A_ik A_jl + A_il A_jk) modulo2.

The displayed alternating4-by-4 determinant equals its Pfaffian squared modulo2, hence the three terms shown. This is a direct4-by-4 identity and can equally be expanded explicitly. For dimension2 the remaining sum is empty and the discarded terms above already prove S=0 modulo8.

Using BA=I, the last two terms in this sum equal R/2. The first equals A_ij q_C(B e_j): terms involving j vanish because B_jj=0 modulo2, and adding terms involving i changes nothing because sum_k B_jk A_ki=0. Since t squared=t modulo2, the R terms cancel. Thus

    per(B')-per(B) = 4t A_ij q_C(B e_j) modulo8.

This verifies the central permanent cancellation independently of the original proposal.

## Independent matching determinant variation

Let A'=B' inverse=T inverse-transpose A T inverse and C'=A'-diag(A'). Exact multiplication gives

    C' = T inverse-transpose C T inverse
         - t A_ii (E_ij+E_ji) + 2t A_ij E_jj.

The off-diagonal correction is even, so the determinant helper removes it modulo8. A diagonal rank1 update is exact. Its principal j cofactor is unchanged by this particular congruence, because that inverse congruence changes only row j and column j, both of which are deleted in the cofactor. Also det(A')=D. Therefore

    det(C')/D-det(C)/D
      = 2t A_ij det(C with j deleted)/D
      = 4t A_ij q_C(B e_j) modulo8,

where the last step is the odd-minor lemma and D is odd. This equals the permanent variation. Hence

    per(A inverse)-det(A-diag(A))/det(A)

is invariant under all simultaneous elementary shears of B and under simultaneous permutations.

## Reduction and base case

An invertible alternating form modulo2 has an odd off-diagonal entry unless the space is empty. Permute it into a2-by-2 principal block. That block has even diagonal, odd off-diagonal and odd determinant, so it is invertible modulo8. For every remaining index, two shears remove its two off-block entries. These operations preserve even diagonal, invertibility and the pivot block. Repeat to obtain a block diagonal matrix with2-by-2 blocks, using only the shear and permutation operations already justified. This also shows the dimension is even.

On a2-by-2 block A=[[2a,b],[b,2c]] with b odd, D=4ac-b squared is odd and

    D per(A inverse) = (4ac+b squared)/D = -b squared modulo8
                    = det(A-diag(A)) modulo8.

Indeed multiplying the proposed equality by D leaves4ac+b squared versus -4ac b squared+b to the fourth; b squared=1 and b to the fourth=1 modulo8. Both sides of the identity multiply under block diagonal sums; the empty block has determinant and permanent1. The invariant therefore vanishes in every dimension. No mathematical gap was found in this complete informal argument.

## Optional source extensions: explicit failures

For A=[[2,1],[1,2]], det(A)=3 is invertible modulo8 and A inverse=[[6,5],[5,6]] modulo8. Its permanent is5, refuting the suggested even-diagonal extension of Conjecture1.

For A=[[2,1],[1,6]], det(A)=11 is invertible modulo24 and A inverse=[[18,13],[13,22]] modulo24. Both permanents are13 modulo24, so2per(A)+per(A inverse)-3=12 modulo24. This refutes the suggested extension of Conjecture2. These are parts of the same source audit and must not be counted as separate open problems.

## Limits of this receipt

No Lean proof of the general invariant, no official acceptance, and no exhaustive historical-priority conclusion is asserted. Strong structural searches located the known determinant helper above and the source's older mod3/4/6 material, but no exact earlier full inverse-permanent modulo8 result in the bounded review. Before publication the owner must complete source/prior/dedup/live checks, faithful formalization of both graph assertions, actual pinned verification and the official lease process.
