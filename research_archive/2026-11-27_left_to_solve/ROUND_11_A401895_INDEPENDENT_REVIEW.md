# A401895 independent review and an additional infinite obstruction

2026-11-27. Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
Status: partial result; no complete conjecture proof, no Lean verification,
no submission, no priority established.

The full Python code in ROUND_10_DIGIT_REVERSAL_CARRY_CERTIFICATE.md was
extracted unchanged and executed independently as round10_certificate.py.
It reproduced the extinction of the fives branch at depth15, the six
candidate lengths through198 and their147472 failed full candidates,
16665 surviving prefixes at depth99, and [1,2,3] for n<10^6.
The hand proof's carry recursion and coefficient bounds were independently
checked without locating a flaw.

## Additional necessary condition and exact moment cancellation

Write C_L=(2/3)(10^(2L)-1), the repdigit of2L sixes. If the remaining
counterexample has length L and n*rev(n)=C_L, then its digit sum S obeys

    S^2 ≡66L modulo81.

Consequently

    L modulo27 belongs to {0,3,12,21}.

Combining with the previous L=33k gives

    k modulo9 belongs to {0,2,5,8}.

This excludes five ninths of the previous length classes. It does not
close the other infinite classes and is not counted as a solution.

## Elementary modular proof, independently checked

Let n=sum_(i=0)^(L-1) a_i*10^i, r=rev(n), S=sum a_i, T=sum i*a_i.
The expansion10^i=(1+9)^i gives

    n ≡ S+9T modulo81,
    r ≡ S+9*((L-1)S-T) modulo81.

Multiplication cancels T exactly modulo81:

    n*r ≡ (1+9(L-1))*S^2 modulo81.

Grouping the sixes in pairs and expanding100=1+99≡1+18 gives

    C_L=66*sum_(i=0)^(L-1)100^i
       ≡66L+27L(L-1) modulo81.

The inverse of1+9(L-1) modulo81 is1-9(L-1). Multiplying the last
expression by that inverse yields

    S^2 ≡66L+(27-594)L(L-1)
        ≡66L modulo81,

because27-594=-567=-7*81. This checks the coefficient and sign of the
cancellation explicitly.

Modulo9, the condition S^2≡3L forces3|L and3|S. The square residues of
multiples of3 modulo81 are exactly{0,9,36,63}. Write L=3s. Then66L≡36s
modulo81, and36s is in{0,9,36,63} exactly when s modulo9 is in{0,1,4,7}.
Thus L modulo27 is in{0,3,12,21}. Finally33k≡6k modulo27 gives k modulo9
in{0,2,5,8}.

The earlier same-residue-product argument gives the same length classes.
The centered cancellation additionally relates the digit sum itself to L;
it does not remove any more length classes. A provisional narrower list
was rejected by the independent certificate because12^2≡63 modulo81.

## Executed exact certificate

centered_certificate.py checks the centered residue criterion and classes,
checks the target cancellation with exact repdigits for L1..81, and
independently checks both Taylor expansions and their multiplied identity
for all99999 positive integers below100000. Every assertion passed.
This is a supporting arithmetic check, not a replacement for the general
algebraic derivation above.


valuation_certificate.py enumerates all729 pairs of residues modulo81
with equal residues modulo9, checks the period27 recurrence for C_L,
checks the closed polynomial residue formula, and checks both exact lists
of allowed classes. All assertions passed in the Python sandbox.
This is an exact finite modular check supporting the hand proof; it is not
a Lean certificate and does not prove the full A401895 conjecture.

The live brief was retrieved to brief.txt at13:56 UTC; it showed no new
mathematical notes beyond our earlier #33408. No lease was taken.
An OEIS lookup confirmed the intended conjecture and no supplied solution.

RESUME HERE: the unresolved general question remains excluding lengths
L=33k, k≥7, k modulo9 in {0,2,5,8}. Prime-factor allocation or a new
carry invariant is needed; extending the bounded search is not closure.

## Literature correction and limits of proposed general routes

Primary source retrieved and read: Ezerman, Meyer and Solé, *On Polynomial
Pairs of Integers*, Journal of Integer Sequences18(2015), Article15.3.5,
https://cs.uwaterloo.ca/journals/JIS/VOL18/Ezerman/eze3.pdf .

Proposition14 (pp11–12) proves that when an L-digit integer times its
reversal has a palindromic product of length2L−1, multiplication is
carry-free. The Round10 odd-product exclusion is an application of this
published theorem, independently re-derived; no novelty is claimed for it.

Conjecture11 in the paper asks whether every decimal reversal-palindrome
product is carry-free. It would imply A401895, but is a conjecture rather
than an available premise. Both search engines and the current OEIS
A062936 entry were checked without locating a later proof. This negative
search is not proof of current open status. The exact pair777*858=666666
appears in the paper's Table1. It accounts for the unique first six outer
digits in our remaining prefix branch.

A base-independent positivity or reciprocal-polynomial impossibility
claim is false:55_7*55_7=4444_7 and47_8*74_8=4444_8. The latter is the
integer identity39*60=2340. These examples were found independently by a
bounded exact base search and also occur in the published paper.

The congruence at11 cannot simply be iterated to force11^2|L. Put
P(x)=sum a_i x^i, d=L−1, epsilon=(−1)^d, A=P(−1), B=P'(−1).
The reversed polynomial is P*(x)=x^d P(1/x). Taylor expansion at−1 yields

    n ≡ A+11B                  modulo121,
    rev(n) ≡ epsilon*(A−11B−11dA) modulo121.

Once11|n, one has A=11A0 and hence

    n/11 ≡ A0+B,
    rev(n)/11 ≡ epsilon*(A0−B)     modulo11.

For L=11s, the sixes target divided by121 is congruent to6s modulo11.
Thus the next necessary relation is

    epsilon*(A0^2−B^2) ≡6s modulo11.

Every residue modulo11 is a difference of two squares, so this relation
alone creates no additional length obstruction. Treating the normalized
factors as congruent or opposite modulo11 would be an invalid inference.
Additional constraints on actual digit moments A0,B would be needed.
