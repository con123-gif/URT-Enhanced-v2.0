# A372561: all three minimum-Jacobsthal-summand conjectures

Complete informal mathematical argument, 27 November 2026. Credit Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex. Independent AI-agent challenges of the full argument, all source clauses, and prior scope have passed. The complete exact-statement Lean probe passed on 27 November 2026 in run46061923315/job140717982673, immutable commit4898031a49f380285d311de875fc5d15c3e79589. OMA.solution depends only on propext, Classical.choice and Quot.sound; actual exit0, no compiler errors. This is pinned kernel verification, not official acceptance. No official submission, acceptance or global priority is asserted. Source is Antti Karttunen's exact OEIS A372561 comments, with A372560, A371094, A372443 and A372555.

Let J_i be the Jacobsthal numbers, using indices i>=2 to remove the duplicate denomination1. Let c(N) be the globally fewest number of these coins representing N. Define

- R(y)=(3y+1)/2^v, where v=v_2(3y+1);
- L_E(y)=4^E*y+(4^E-1)/3;
- F(y)=(3y+1)*2^v+(4^v-1)/3=L_v(R(y)).

The source array is A(n,k)=F^(n-1)(R^(k-1)(27)) for n,k>=1. The source conjectures are: along the thirteenth antidiagonal the coin count is7 after the first entry233; along the thirtieth antidiagonal it is9 after the first entry911; and c(A(n,k))=c(A(k,n)) for n,k>1. The first respective nonboundary entries are933 and58325. All three clauses are retained.

## A lower-bound invariant

Write D(t) for the sum of the base4 digits of t. Carries give D(a+b)<=D(a)+D(b), and D(4a)=D(a). For a multiset of r powers2^i with e even exponents and o odd exponents:

D(sum2^i)<=e+2o, and D(2sum2^i)<=2e+o.

If the corresponding Jacobsthal coins sum to N, then 3N+e=sum2^i+o. Put S=e-o. Hence

2D(3N+S)<=3r-S, and 2D(2(3N+S))<=3r+S.

For N=L_E(y), y odd, E>=1, put q=3y+1. Then 3N+1=q4^E. Because all i>=2, S is congruent1 modulo4; moreover |S|<=r and r is odd.

## An explicit upper bound

Let a and b count the even- and odd-position1-bits of q. Set s=a-b and p=a+b. Since q is congruent1 modulo3, s is congruent1 modulo3. Starting with its ordinary binary expansion, change s to1 by splitting |s-1|/3 bits of the appropriate parity into two bits one position lower. If s<1 split odd bits; if s>1 split positive even bits. There are enough such bits: (1-a+b)/3<=b and (a-b-1)/3<=a, respectively. Because q is even, no even bit at position0 is involved. The resulting exponent multiset has

T=p+|s-1|/3=max((2D(q)+1)/3,(2D(2q)-1)/3)

members, sums in powers2 to q, and has alternating parity sum exactly1. Shift every exponent by2E. All resulting indices are at least2 for E>=1, and the corresponding Jacobsthal coins sum exactly to L_E(y). Thus c(L_E(y))<=T. Explicit finite witnesses for every orbit base are in a372561_lift_certificate.json; the general argument does not infer existence from finite search.

## Uniform stabilization for T<=9 and E>=2

Claim: for odd y, T<=9, and E>=2, c(L_E(y))=T.

Suppose a representation has odd r<T. Since T is odd and at most9, r<=7. The only possibilities for S congruent1 modulo4 with |S|<=r are S=-7,-3,1,5.

For S=1, the two lower bounds give 3r>=2D(q)+1 and 3r>=2D(2q)-1; hence r>=T, a contradiction.

For S=5, put U=q4^E+4. Since q is even and E>=1, the added bit does not overlap: D(U)=D(q)+1 and D(2U)=D(2q)+2. The two inequalities again give 3r>=2D(q)+7 and 3r>=2D(2q)-1, and hence r>=T.

For S=-3, put U=q4^E-4. Borrowing gives

D(U)=D(q-1)+3(E-1),
D(2U)=D(2(q-1))+3(E-1).

Subadditivity gives D(q-1)>=D(q)-1. Since q is even, write q=2t; then D(2(q-1))=D(t-1)+2>=D(t)+1=D(2q)+1. Thus for E>=2 the two inequalities give 3r>=2D(q)+1 and 3r>=2D(2q)+11, which exclude r<T.

For S=-7, necessarily r=7, e=0, o=7, and T=9. Therefore D(2U)<=7, where U=q4^E-8. Borrowing for E>=2 gives

D(2U)=D(2(q-1))+3E-5>=D(2q)+2.

T=9 implies D(q)=13 or D(2q)=14. Moreover D(q)=D(4q)<=2D(2q), so in either case D(2q)>=7. It follows that D(2U)>=9, contradicting D(2U)<=7. This proves the claim, with every possible S retained.

## The small exponent E=1

For S=1 and5 the same arguments hold. For S=-3 it suffices to check

max(2D(q-1)-3, 2D(2(q-1))+3)>=3T.

For S=-7, only T=9 can matter, and it suffices that D(2(q-2))>7. The finite certificate checks these exact inequalities for all24 required orbit bases whose final Collatz valuation is1. The only T=9 case among them is y=1619, for which the last weight is10. These are finite integer identities, suitable for ordinary Lean decide; this finite table supplements the proved uniform E>=2 theorem.

## Reducing the entire infinite array

The exact identity

F(L_E(y))=L_(2E+v_2(3y+1))(R(y))

follows from 3L_E(y)+1=(3y+1)4^E and valuation of a product. Consequently A(n,k)=L_E(y), where y=R^(n+k-2)(27). If n>1, its exponent E is at least the final valuation v_2(3R^(n+k-3)(27)+1).

The exact reduced Collatz orbit of27 has42 entries and reaches1 after41 steps. Every base y in it has T<=9. For all exponents at least the final valuation, the general E>=2 theorem and the finite E1 certificates show that c(L_E(y))=T(y). If n,k>1, both A(n,k) and A(k,n) therefore have the same cost, because their antidiagonal base y is the same. For n+k-2>=41 the base is1, and L_E(1)=J_(2E+2) is itself a single coin; this is the entire infinite tail, not a numerical truncation.

On the thirteenth antidiagonal n+k=14, the base is R^12(27)=233. All nonfirst entries have E>=1 and T(233)=7, giving the first exceptional clause. On the thirtieth antidiagonal n+k=31, the base is R^29(27)=911. All nonfirst entries have E>=3 and T(911)=9, giving the second clause. The initial nonfirst numbers are L_1(233)=933 and L_3(911)=58325, exactly as in the source.

## Verification boundary

The Python certificate checks only the finite42-element orbit, its valuations, the explicit upper power witnesses and the24 E1 inequalities. It is not an infinite proof or a Lean certificate. The unbounded argument above has passed independent AI-agent mathematical challenges. The complete Lean certificate has now passed actual pinned verification, including the unbounded exponents and array indices. The finite arithmetic is discharged by ordinary kernel-checked decide. No lease has been taken.
