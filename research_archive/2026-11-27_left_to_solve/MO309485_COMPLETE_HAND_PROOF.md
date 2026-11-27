# MO309485: complete kernel classification, informal proof

Status: complete informal proof; not Lean verified, not claimed/submitted.
The n=0 convention and final bounded prior gate require review before a
faithful formal statement is frozen. No historical-priority claim.

Credit: Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6 (exact
serving variant not exposed). The ODD left-kernel vector was proposed by
Philipp Lampe in source comment771010; the EVEN right-kernel vector was
proposed by MTyson in source comment771562. We credit both vectors fully.
The work below supplies uniform exact verification using classical finite
binomial identities, rather than claiming to discover their vectors or a
new general binomial method.

## Exact source and boundary convention

Source: T. Amdeberhan, August31,2018,
https://mathoverflow.net/questions/309485/an-eigenvalue-of-certain-family-of-matrices
CC BY-SA4.0. Complete current question, zero answers and ALL6 comments read:
MO309485_{question,answers,comments}.json. The source's matrix is

    M_n(i,j)=C(i,j)+C(2n+1-i,j-i)+C(2n+1-i,j), 0<=i,j<=n.

Here C(N,k)=0 when k<0 or k>N. A formal translation MUST guard j-i when
j<i, rather than replacing it by truncated natural subtraction.

The source asks whether zero is an eigenvalue but does not explicitly
exclude n=0. We do not exploit that boundary as a tiny disproof and do not
silently add a hypothesis. The complete mathematical answer is:

    zero is an eigenvalue of M_n IF AND ONLY IF n>=1.

For n=0 the matrix is[3]. For every positive n we give a nonzero left or
right nullvector. A future formal statement must honestly preserve this
full classification or explain the source's usual positive-n convention.

## Three elementary signed binomial identities

For 0<=h<=N and any integer k, with the zero convention above,

    (A) sum_{j=0}^h (-1)^j C(h,j) C(N-j,k)=C(N-h,k-h),
    (B) sum_{j=0}^h (-1)^j C(h,j) C(N-j,k-j)=C(N-h,k).

Both follow by taking the coefficient of X^k in the finite polynomial
identities

    sum_j (-1)^j C(h,j)(1+X)^(N-j)
        =X^h(1+X)^(N-h),
    sum_j (-1)^j C(h,j)X^j(1+X)^(N-j)
        =(1+X)^(N-h).

These are direct binomial expansions after factoring(1+X)^(N-h), so
they require no formal division or convergence assumptions. We also use

    (C) sum_{i=0}^h (-1)^i C(h,i) C(i,j)=(-1)^h [j=h],

from the coefficient of X^j in(1-(1+X))^h=(-X)^h.

## Odd positive n: verify Lampe's proposed LEFT kernel

Put N=2n+1 and

    v_i=(-1)^i(C(n,i)+C(n+1,i)), 0<=i<=n.

The first coordinate is2, hence v is nonzero. Fix0<=j<=n, and split
(v^T M_n)_j into the three summands from the matrix definition. The
identities above, retaining the omitted i=n+1 endpoint where required,
give respectively

    S1=sum_i v_i C(i,j)=-C(n+1,j)-[j=n],
    S2=sum_i v_i C(N-i,j-i)=C(n+1,j)+C(n,j),
    S3=sum_i v_i C(N-i,j)=[j=n]-C(n,j).

For S1, identity(C) with h=n gives(-1)^n[j=n], while its h=n+1 version
has total0 at j<=n; removing the last endpoint subtracts
(-1)^(n+1)C(n+1,j). Since n is odd, this is the displayed expression.
For S2, apply(B) with h=n and h=n+1; the omitted endpoint contributes0
because j<n+1. For S3, apply(A); the h=n part is[j=n], and the h=n+1
full sum is0, with omitted endpoint(+1)C(n,j).

Thus S1+S2+S3=0 for every j. Therefore v^T M_n=0, and zero is an
eigenvalue of the square matrix M_n.

## Even positive n: verify MTyson's proposed RIGHT kernel

Put m=n+1, so m is odd and m>=3. Define

    w_j=(-1)^j C(2m-j,m)-2[j=m-1], 0<=j<=m-1.

Here w_0=C(2m,m)>0 because n=m-1 is positive, hence w is nonzero.
Fix0<=i<=m-1 and write K=2m-1-i and delta=[i=m-1]. Splitting
(M_n w)_i into its three matrix terms gives

    T1=C(2m-i,m)-2delta,
    T2=delta+C(K,m-1)-2C(K,m),
    T3=delta+C(K,m)-2C(K,m-1).

For T1, apply(A) to the full range j=0..i and then use binomial
symmetry C(2m-i,m-i)=C(2m-i,m). The final correction is2C(i,m-1),
which equals2delta.

For T3, first sum its raw alternating expression over j=0..K. By(A)
the result is C(i+1,m-K)=delta. The only omitted potentially nonzero
term beyond j=m-1 is j=m: terms j>m have C(2m-j,m)=0. Since m is
odd, this endpoint equals-C(K,m), so the truncated raw sum is
delta+C(K,m). The explicit correction from w_{m-1} is2C(K,m-1).

For T2, substitute k=j-i into the raw alternating expression and apply
(A) with h=K,N=2m-i. Its full result is(-1)^i C(1,m-K)=delta,
since delta can be1 only at i=m-1=n, which is even. Again the only
missing endpoint is j=m, of value-C(K,m-i), so the truncated raw
sum is delta+C(K,m-i). Binomial symmetry gives
C(K,m-i)=C(K,m-1). The explicit correction from w_{m-1} equals
2C(K,m-1-i)=2C(K,m).

Adding T1,T2,T3 leaves

    C(K+1,m)-C(K,m)-C(K,m-1)=0

by Pascal's identity. Thus M_n w=0 for every positive even n.
Together with the odd case and M_0=[3], this proves the full classification.

## Independent exact arithmetic checks and bounded prior status

All1890 component formulas for n=1..60 were checked using Python integers
and standard exact binomial coefficients, including vector orientation,
signs, truncation tails and n0. Receipt: MO309485_KERNEL_COMPONENT_SCREEN.json.
This finite check is not used in place of the universal proof above.

Before any Lean investment, the proper default-all-state upstream exact-ID
PR query returned0 with a complete flag. Both web engines were used for
the exact source/title and structural binomial/kernel formulations; only
the original source and unrelated papers appeared at the initial search.
Global exact aliases MO309485 and mo-309485 returned0. The actual Trure
numeric-ID search returned12 files: every one of the28 literal occurrences
was fetched by exact blob SHA and inspected, and every occurrence lies
strictly inside a longer decimal integer. These are false numeric matches,
not proof modules or source mentions. Broader global numeric queries have
hundreds of unrelated matches and are NOT described as cleared or zero.
These checks are bounded evidence, not an exhaustive absence theorem.
