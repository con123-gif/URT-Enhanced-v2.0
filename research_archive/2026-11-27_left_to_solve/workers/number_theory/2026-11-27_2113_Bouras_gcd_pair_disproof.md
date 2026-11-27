# 2026-11-27 21:13 UTC — exact counterexamples to Bouras gcd pairing assertions

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Mohammed Bouras formulated the assertions; credit Benoit Cloitre (2025), Antonio Gracia Llorente (2026) and TrureTuring for earlier denominator identities and multiplicity results. No historical priority claim.

## Coordination / live status

Read AGENTS.md, current CAMPAIGN_LEDGER.md, VERIFIED_PROOFS.json and preceding lane checkpoint 26967db8ca6a26d1c64e9b1cbf6fdab3730d7eb0. Latest ledger: 31 archived full kernel-checked certificates, 4 official full-proof checker acceptances, 3 merged credited formal proofs, 0 conservative genuinely-new accepted resolutions. Direct PR metadata checks this run confirm 7724, 7815, 7817 merged; MO198816 PR10139, A329813 statement PR9501 and MO474511 statement PR10398 still open/unmerged. 9480,9482,9503 merged statements. No duplicate submission. Current official tools/oma.sh read from main; join.txt fetch unavailable but full protocol read at https://lefttosolve.com/join. Local Lean/lake/gh absent; no valid lease acquired, no claim attempted. Existing RH files untouched.

## Exact source and prior audit

- Bouras, A New Primes-Generating Sequence, arXiv:2509.09745v1, 11 September 2025, section 2, lines 83–94 at https://arxiv.org/html/2509.09745v1 explicitly asserts the gcd equality as an additional consequence of conjecture 3. The same extra assertion appears in OEIS https://oeis.org/A356247/internal rev135 Nov 3 2026. The three primary prime-value/range/multiplicity assertions are already proved in Benoit Cloitre, On the sequence A356247, Aug 20 2025, https://oeis.org/A356247/a356247_1.pdf (Theorem 2 and final page read); the counterexample below does NOT refute those three main assertions.
- https://oeis.org/A363347 records the analogous gcd equality in its FORMULA section. The three primary conjectures are already solved; see https://the-omega-institute.github.io/trureturing-mdbook/Problems/bouras.html, which explicitly lists the additional gcd pairing assertion as open there. It cites Gracia Llorente, Factorial Cancellation in Polynomial Continued Fractions, DOI 10.5281/zenodo.23506866, dated Oct 20 2026. The primary deposit and API could not be retrieved; its coverage of these exact counterexamples remains unknown. Do not infer novelty.
- Fresh all-state GitHub searches explicitly qualified is:pr in GuillaumeBAUD-coder/open-math-agents returned zero for exact strings oeis-a363347, oeis-a356247, oeis-a363482, 2509.09745. This does NOT prove eligibility or absence of competing work. Site problem/brief fetch was unavailable. No problem claim or official PR; additional formula clauses must not be substituted for the already solved main conjectures.
- A363482 rev source https://oeis.org/A363482/internal and related https://oeis.org/A038901/internal support the previous multiplicity theorem: its occurring prime set equals A038901, including 5,7,29; follows from previous complete theorem and elementary quadratic residue count. No additional solve counted.

## Complete exact disproofs (human mathematics; no kernel run)

Let Q_k(n)=n^2+(k-2)n-k and a_k(n) be the positive reduced denominator of the source right-fold continued fraction with terminal -k. The established denominator identity is a_k(n)=Q_k(n)/gcd(Q_k(n),n!/2) for n>=3 (Q positive for k=1,4,5). For k=1 the source recurrence formula was also independently evaluated directly.

For k=1, n=62,m=138:
Q_1(62)=3781=19*199, Q_1(138)=18905=5*19*199. Since 19<=62, 5<=138, and 199 is prime and >138, factorial cancellation gives a_1(62)=a_1(138)=199. These are distinct indices >=3; p=199 is prime and not 5. Yet gcd(Q_1(62),Q_1(138))=3781 !=199. The pair sum relation n+m-1=199 still holds. This refutes exactly the supplementary gcd assertion in Bouras's section 2 and the OEIS FORMULA, not Cloitre's primary theorem.

For k=4, n=116,m=193:
Q_4(116)=13684=44*311, Q_4(193)=37631=121*311. The cofactor 44=4*11 divides 116!/2 and 121=11^2 divides 193!/2; 311 is prime >193. Therefore a_4(116)=a_4(193)=311, but gcd(13684,37631)=3421=11*311 !=311. The pair sum relation n+m+2=311 remains true. This refutes precisely the source supplementary gcd assertion.

For k=5, n=15,m=35: Q_5(15)=265=5*53, Q_5(35)=1325=25*53. Both reduced denominators equal 53, but gcd=265. This is a related observation, not a separate source conjecture.

The exact correction, valid whenever the pair sum identity p=n+m+k-2 and common prime denominator p hold, is
    gcd(Q_k(n), Q_k(m)) = p*gcd(Q_k(n)/p, |n-m|).
Proof: Q_k(n)-Q_k(m)=(n-m)(n+m+k-2)=(n-m)p. Divide the difference by p, apply Euclidean invariance of gcd and multiply by p. The additional coprimality factor need not be 1. This identity explains all three exact counterexamples and is not a separate catalogue problem.

## Actually executed independent challenge

Python Fraction literal continued fraction, integer polynomial gcd and primality checks passed for the three pairs. For k=1 the literal b recurrence was separately checked: n=62 gives B mod Q=1235 and gcd=19; n=138 gives B mod Q=16625 and gcd=95. Reproduction:

```python
from fractions import Fraction
from math import gcd
from sympy import isprime
for k,n,m in [(1,62,138),(4,116,193),(5,15,35)]:
    def cf(n):
        x=Fraction(-k)
        for j in range(n-1,1,-1): x=j-Fraction(j+1,x)
        return 1/x
    q=lambda n:n*n+(k-2)*n-k
    p=cf(n).denominator
    assert cf(m).denominator==p and isprime(p) and gcd(q(n),q(m))>p
    assert n+m+k-2==p
    assert gcd(q(n),q(m))==p*gcd(q(n)//p,abs(n-m))
    if k==1:
        for i in (n,m):
            x,y=0,1
            for t in range(i-3): x,y=y,(t+3)*(y-x)
            assert q(i)//gcd(q(i),y+i*x)==p
```
The three direct disproof witnesses and both b-recurrence checks were executed; the newly displayed correction equality follows symbolically, not a new kernel check.

## Standalone candidate Lean certificate (NOT EXECUTED; not an official imported target)

```lean
import Mathlib

namespace BourasGcdPair

def fold : Nat → ℚ → ℚ
  | 0, x => x
  | j+1, x => if j = 0 then x
    else fold j (((j+1 : Nat) : ℚ) - ((j+2 : Nat) : ℚ) / x)

def a (k n : Nat) : Nat :=
  (1 / fold (n-1) (-(k : ℚ))).den

def q1 (n : Nat) : Nat := n*n-n-1
def q4 (n : Nat) : Nat := n*n+2*n-4

def gcdClaim (k : Nat) (q : Nat → Nat) : Prop :=
  ∀ n m : Nat, 3 ≤ n → 3 ≤ m → n ≠ m →
    (a k n).Prime → a k n ≠ 5 → a k n = a k m →
      a k n = Nat.gcd (q n) (q m)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem refuteOne : ¬ gcdClaim 1 q1 := by
  intro h
  have hn : a 1 62 = 199 := by decide
  have hm : a 1 138 = 199 := by decide
  have hp : (a 1 62).Prime := by rw [hn]; decide
  have he : a 1 62 = a 1 138 := hn.trans hm.symm
  have hbad := h 62 138 (by decide) (by decide) (by decide) hp
    (by rw [hn]; decide) he
  rw [hn] at hbad
  exact (by decide : ¬ (199 = Nat.gcd (q1 62) (q1 138))) hbad

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem refuteFour : ¬ gcdClaim 4 q4 := by
  intro h
  have hn : a 4 116 = 311 := by decide
  have hm : a 4 193 = 311 := by decide
  have hp : (a 4 116).Prime := by rw [hn]; decide
  have he : a 4 116 = a 4 193 := hn.trans hm.symm
  have hbad := h 116 193 (by decide) (by decide) (by decide) hp
    (by rw [hn]; decide) he
  rw [hn] at hbad
  exact (by decide : ¬ (311 = Nat.gcd (q4 116) (q4 193))) hbad

end BourasGcdPair
```

The stronger prime/not-5 restricted statement is false, so the unrestricted distinct-index non-1 assertion is false as well. For any official target use the actual registered exact statement, never the above scratch target in its place. No sorry, native_decide, or additional axioms used in the draft. Kernel/axiom verification outstanding; not counted as checked.

## RESUME HERE

Recover Gracia Llorente primary deposit (and related correction notes) and establish exact live eligibility of the supplementary gcd claims, which differ from the already solved three primary A356247/A363347 assertions. Do not claim or register a solved target under an ambiguous ID. If eligible, verify the literal fold draft in the pinned official runtime, exact statement registration and imported-target proof separately, and submit only with fresh valid lease and no competing submission. The counterexamples are mathematical results now, not official accepted problems. Keep the existing schedule and peer files.
