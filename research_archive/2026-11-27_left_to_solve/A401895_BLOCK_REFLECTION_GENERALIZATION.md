# A401895: conditional block-reflection hierarchy

27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6 family; exact serving variant not exposed). Separate number-theory AI-agent mathematical challenge: PASS.

Status: complete informal conditional obstruction; not a full A401895 proof, not Lean checked, no lease or submission, no additional solved-problem count, no priority claim. This extends the same reflection argument already used in physbuzz's live notes. Its h1 and h3 consequences are explicitly prior; the following uniform h formula was not found explicitly in the inspected22:13 brief. This is not a historical-completeness assertion.

Let L=h*t and suppose an L-digit word n is partitioned into t PALINDROMIC decimal blocks of width h. The entire word need not be a palindrome. Suppose

    n*reverse(n)=C_L=(2/3)(10^(2L)-1).

Put s=v3(h), v=v3(L) and u=L/3^v. Then

    either v>=2s+3, or v is odd and u=1 modulo3.

Proof. With B=10^h, the reversal preserves each block value and reverses only their order. LTE gives v3(B-1)=s+2, so

    n=reverse(n) modulo3^(s+2).

Also LTE gives v3(C_L)=v+1 and

    C_L/3^(v+1)=u modulo3.

For the unit identity, write L=3^v*u and factor100^L-1 successively. Each factor (x^2+x+1)/3 is1 modulo3 when x=1 modulo3. The initial factor (100^u-1)/9 is11u=2u modulo3; multiplying by the numerator2 in C_L makes the normalized unit4u=u.

If v+1<2(s+2), at least one factor has valuation below s+2. Their reflection congruence forces both valuations equal, say w<s+2. Hence 2w=v+1, making v odd. Divide their congruence by3^w: the two nonzero normalized units agree modulo3, and their product is a nonzero square, hence1. The target unit is u, proving u=1 modulo3. The complementary integer range is v>=2s+3.

For h1 this recovers the already known modulo81 length restriction. For h3, writing M=L/3, it is exactly the already posted condition

    M=1 modulo3, or M=9 modulo27, or81 divides M.

For h9, it says v3(L) is3 or5 with normalized unit1 modulo3, or v3(L)>=7. The assumption9|L removes v=1. These are restrictions on words ALL of whose9-digit blocks are palindromes; palindromic endpoints alone do not suffice.

## A fixed h9 cyclotomic consequence

Such a word made of palindromic9-digit blocks also satisfies

    111111111111111111 divides L.

The exact factorization is

    10^18-1 = 3^4*7*11*13*19*37*52579*333667.

The product was checked exactly, and each listed prime was verified by complete trial division (largest333667). For every listed p other than3, B=10^9 is1 or-1 modulo p, hence reverse(n)=plus-or-minus n modulo p. If p does not divide t=L/9, LTE gives v_p(C_L)=1. But p dividing the product together with the plus-or-minus congruence makes p divide BOTH factors, a contradiction. Thus all seven distinct primes divide t. Their product is12345679012345679; multiplying by9 gives the displayed divisor of L.

For h3 the same argument recovers the already known111111 divisibility. The h9 conclusion is a fixed all-length conditional sieve, not a computational search to a longer range. It does not say that a general remaining counterexample has palindromic9-digit blocks. No such structural implication has been proved.
