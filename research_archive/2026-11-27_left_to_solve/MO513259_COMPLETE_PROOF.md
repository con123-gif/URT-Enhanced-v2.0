# MO513259: both original graph conjectures

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6; exact serving variant not exposed). Independent collaborating AI lanes challenged the mathematics and audited the entire Lean certificate. No independent human review or first-priority claim is asserted.

The complete certificate is `mo-513259.proof.lean`, SHA-256 `50565c78756547a97d545bdc8474329ffed77ba0de4d221c92b61db9814fbf47` (160749 bytes). It proves the exact conjunction of the two original statements. Whole-source pinned run [46070716771](https://github.com/con123-gif/open-math-agents/actions/runs/46070716771), job 140746737115, has observed compiler exit 0, no plain or tagged compiler errors, and `OMA.solution` depends only on `propext`, `Classical.choice` and `Quot.sound`. The independent whole audit reconstructed the exact statement and entire canonical proof from the immutable public probe. This kernel result is separate from official acceptance.

## Original statements

For a simple graph adjacency matrix A:

1. If A is invertible modulo 8, then per(A^-1)=1 modulo 8.
2. If A is invertible modulo 24, then 2 per(A)+per(A^-1)-3=0 modulo 24.

The source is [MathOverflow 513259](https://mathoverflow.net/questions/513259), by joro, July 15, 2026. The formal statement retains all finite sizes, symmetry, zero diagonal, 0/1 entries and modular invertibility. The author's tentative extension to arbitrary even diagonal is addressed separately below.

## Stronger corrected identity

Work in R=Z/8Z. Let A be symmetric, with even diagonal and unit determinant, put B=A^-1, and let Z(A) erase A's diagonal. We prove

    det(A) per(B) = det(Z(A)).                         (C)

Reduction modulo 2 makes A nonsingular alternating. Its inverse is alternating, so B also has even diagonal. For an F2 vector v define

    q_A(v) = sum over r<s of A_rs v_r v_s  in F2.

Write lift4(z)=4z in R for z in F2. This is an additive map. Every unit u of R satisfies u lift4(z)=lift4(z).

## Permanent increment

Fix i≠j and T=I+t E_ij. Put B'=T B T^transpose and A'=T^-transpose A T^-1. Let R_i be the permanent obtained by replacing row i of B with row j; let S_i be the permanent after also replacing column i with column j. Row and column multilinearity give the exact identity

    per(B')-per(B) = 2t R_i + t^2 S_i.

The two equal rows give R_i=2r. With v_k=B_jk modulo 2, forced-row determinant expansion gives

    r mod 2 = sum_k v_k A_ki A_kj =: r0.

Explicitly its unordered-pair expression is sum_(k<l) v_k v_l (A_ki A_lj+A_kj A_li); polarization and BA=I reduce it to the displayed single sum.

The duplicated row/column expansion gives S_i=4s modulo 8. Terms using both internal columns have the factor 2 B_jj^2, and terms using exactly one have a factor 4 B_jj; both vanish since B_jj is even. For external unordered image and preimage pairs K,L, transpose interchanges K,L. Their unequal-pair contributions cancel modulo 2. The equal-pair contribution, for K=L={k,l}, is

    v_k v_l (A_ij A_kl+A_ik A_jl+A_il A_jk).

These identities follow from a rank-four coordinate-row determinant replacement. Only the four replaced rows must be distinct; no inverse of a small minor is assumed. The four-by-four determinant of an alternating matrix over F2 is the displayed three-term expression. That expression vanishes pointwise if k or l repeats i or j, so the external-pair restriction can be removed. Polarization now gives

    s mod 2 = A_ij q_A(v)+r0.

Since t^2=t in F2, the r0 terms cancel after multiplication by 4. Therefore

    per(B')-per(B) = t A_ij lift4(q_A(v)).             (P)

All orbit factors, forced-row identities and finite-sum cancellations are proved for arbitrary finite index types in the certificate.

## Determinant increment

For an even-diagonal symmetric unit matrix C, changing a symmetric offdiagonal pair by 2u leaves its determinant unchanged modulo 8. With D=C^-1 the rank-two determinant formula gives the relative correction

    4u D_ij + 4u^2(D_ij^2-D_ii D_jj).

The inverse diagonal is even, and x^2=x modulo 2, so this correction vanishes. This background determinant lemma was already proved in Darij Grinberg's comments to MSE2688219 (2018).

Exact entry expansion gives

    Z(A') = T^-transpose Z(A) T^-1
             -t A_ii(E_ij+E_ji)+2t A_ij E_jj.

The symmetric offdiagonal correction is even and does not affect the determinant. Deleting row and column j removes that correction and all effects of T. Linearity in the final diagonal entry consequently gives

    det(Z(A'))-det(Z(A)) = 2t A_ij adj(Z(A))_jj.

The required quotient-free odd-minor identity is

    2 adj(Z(A))_jj = lift4(q_A(B e_j)).

Here is its derivation. The full alternating unit matrix has even size, so H=Z(A) with j deleted has odd size. Lift H symmetrically to integers and let K be its skew-symmetric lift with the same upper triangle. Then H=K+2L for a strictly lower-triangular L and det(K)=0 exactly over the integers. First-order determinant expansion modulo 4, followed by multiplication by 2 modulo 8, gives

    2 det(H) = 4 sum_(r>s) H_rs adj(H)_sr.

The mod-2 complementary cofactor identity identifies adj(H)_sr with B_jr B_js: the reduced full determinant is 1 and the inverse diagonal entry B_jj is 0. Thus the right side is lift4(q_A(B e_j)). The principal cofactor adj(Z(A))_jj is det(H), with positive sign. This proves the quotient-free identity and hence

    det(Z(A'))-det(Z(A)) = t A_ij lift4(q_A(B e_j)).   (D)

Symmetry identifies the row and column vectors in (P) and (D). Also det(A')=det(A), and the odd unit det(A) acts trivially on lift4. It follows that det(A) per(A^-1)-det(Z(A)) is invariant under each elementary congruence and under simultaneous index permutations.

## Finite block induction

A nonsingular alternating reduction has an odd offdiagonal entry. Move its two coordinates first; their two-by-two principal block is a unit. A lower unipotent congruence clears the cross blocks. It is an explicit finite product of the elementary shears already handled. Its Schur complement remains symmetric, even-diagonal and a unit, with two fewer coordinates.

The two sides of (C) are separately multiplicative on block diagonal matrices. For a two-by-two block [[2a,b],[b,2c]], where b is odd, D=4ac-b^2 has D^2=1 modulo 8, and direct calculation gives

    D per(A^-1) = -b^2 = det([[0,b],[b,0]]).

The empty case has both sides equal to 1. Strong induction on the finite cardinality proves (C). The Lean proof constructs the pair/complement equivalence explicitly, proves descent of cardinality, and proves forward and reverse closure under the finite product of shears.

## Both graph conclusions

For a zero-diagonal A, Z(A)=A. Cancel its unit determinant in (C) to obtain Conjecture 1.

For the modulo-4 component of Conjecture 2, apply (C) to B=A^-1. Then det(B) per(A)=det(Z(B)) modulo 8. Modulo 4, removing B's even diagonal changes its determinant only in first-order terms. Each is a diagonal entry times its principal cofactor, and

    adj(B)_ii = det(B) A_ii = 0.

Therefore det(Z(B))=det(B) modulo 4; cancel the odd determinant to get per(A)=1 modulo 4.

The characteristic-three identity per(A^-1)=per(A) is known background from Anna Knezevic, Greg Cohen and Marina Domanskaya, *Some Facts on Permanents in Finite Characteristics*, arXiv:1710.01783 (2017), Lemma II.2.5.1 and its full inverse specialization. The certificate independently formalizes its finite signed-vector-sum proof.

For A invertible modulo 24, Conjecture 1 and per(A)=1 modulo 4 make 2 per(A)+per(A^-1)-3 zero modulo 8. The characteristic-three identity makes it zero modulo 3. The Chinese remainder theorem gives Conjecture 2 modulo 24.

## Tentative extension and official status

The even-diagonal extensions are false: modulo 8, [[2,1],[1,2]] has inverse permanent 5; modulo 24, [[2,1],[1,6]] has both permanents 13 and the proposed expression is 12. Exact Lean witnesses accompany the certificate. These are not counted as separate source problems.

Official statement registration is [PR #12514](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/12514), exactly one added statement file. A genuine claim, PLAN, fresh heartbeat, DONE and submitted release all returned HTTP 200; no lease remains held. Registration and the completed kernel proof are not official full-proof acceptance. After actual statement merge, compare the registered target exactly and submit the existing proof through the imported checker.
