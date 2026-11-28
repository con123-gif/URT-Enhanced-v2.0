# Number theory lane — 2026-11-28: general negative-tail classification and merge/race audit

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2 in this session). Source continued fractions: Mohammed Bouras. Related prior arithmetic: Benoit Cloitre (2025), Antonio Gracia Llorente, *Factorial Cancellation in Polynomial Continued Fractions* (2026-10-20, DOI 10.5281/zenodo.23506866), and the TrureTuring formalization team. Standard continuants, factorial valuations, quadratic residues and Hensel lifting are not claimed as inventions.

STATUS: complete human proof of the following effective eventual classification, independent exact-arithmetic challenges executed. NOT Lean verified; NOT an eligible or original discovery claim; NOT an official submission. General-tail classification is a research extension of the earlier two GCD disproofs. Preserve existing probes and do not count this note as another source problem.

## Fresh official audit

Read AGENTS.md (blob 8db0201da965541e0487d6dd1271e010bdaa0972), CAMPAIGN_LEDGER.md (1537e7cf3ad62ce61cc962d2c25681e8b3606a50) and VERIFIED_PROOFS.json (379caca5d953a3f0a1eff550262059bdf98e0285). Observed branch head bb260a3d345e2e9c7245cf51250ff91db72d8dae, concurrent RH changes untouched. Read current tools/oma.sh blob 0e9d771e692b971de2ac36ee450e814655ed5f3b. Official join.txt failed via web and local DNS; local Lean and gh absent. Exact standalone campaign workflow recovered (blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c). No new claim, submission, or lease; no attempt to bypass desk. RESUME_HERE.md at archive root returned 404.

**A329813 full disproof PR13332 actually merged 2026-11-28T02:12:52Z.** Main proof read back (proofs/oeis-a329813.lean, blob 9a4d420b3f89e23e0ca149066e95680712aefabe), header explicitly credits Cornelius Lytollis and scheduled NumberTheoryBot. Actual upstream job140766605596 log reread, acceptance gate ran, no compiler-error lines detected. This is the fourth own merged full proof; five own full checker acceptances remain, MO198816 PR10139 remains open. Latest indexed archive count 37; conservative genuinely-new accepted count still zero. Do not confuse the source's already-stated seed scaling with original discovery. Current OEIS mirror A329813 blob 677abc9e11fac7f1a6e31d0121d04b5d4435420f and A329654 blob 991f222ac21f450b87024abb0b5f94778a00fc51 both retain the exact universal distinctness conjecture and its seed scaling law; these are one problem.

Current official all-state exact-ID is:pr searches (search_prs, state=all) and actual file metadata establish new preceding foreign full-proof PRs:
- A068991: 16269 (romechenko, 00:42:09 UTC).
- A396949: 16199 (romechenko, 00:38:16 UTC).
- MO513259: 16854 (cjchaffin, 01:21:47 UTC).
- A181674: 16995 (cjchaffin, 01:30:35 UTC).
- A372556: 17012 (dk8827, 01:31:44 UTC).
- MO430643: 17716 (cjchaffin, 02:13:37 UTC).
Each open, one proofs/<id>.lean file; do not submit a duplicate. No foreign kernel acceptance claimed. A372561 registration12868 merged 01:12:45 UTC, only registration returned by current exact search; fresh gate required before proof stage. A38547814393, A36909613431 and MO30948514443 still open as registrations. MO430643 registration13174 merged 01:53:27, but foreign full PR now precedes ours. Current A06899112465, MO51325912514, A39694912591, A18167412808, A37255612938 actual merged registration metadata checked. A363347 and A356247 exact-ID searches returned no PRs; absence not established novelty.

## Source and literature

Read official OEIS mirror seq/A363/A363347.seq blob a56205b6378a324e4674517ae26ad44c7efc034b (revision 43) and seq/A356/A356247.seq blob 5bd6255dcfea82cf3ed46f82ce93d8f830d24d57 (revision 135). A363347 FORMULA retains distinct n,m, equal non-one values, alleged gcd equality. A356247 FORMULA and Bouras arXiv:2509.09745v1 §2 retain the supplementary gcd assertion. Main OEIS website returned 403; full revision history and related primary reference review remain incomplete. A028877 related mirror read; record-value conjecture not resolved here. TrureTuring current research page and mdbook read: general negative-tail classification and additional A363347 gcd-pairing are listed as open in that dossier, but the mdbook credits earlier Gracia Llorente proofs of the fixed k=2 and k=4 multiplicity cases. Full Gracia Llorente deposit could not be retrieved; do not assert novelty of the general result. Relevant links:
https://arxiv.org/html/2509.09745v1
https://www.trureturing.org/research/bouras/
https://the-omega-institute.github.io/trureturing-mdbook/Problems/bouras.html
https://doi.org/10.5281/zenodo.23506866

## Theorem (full informal proof)

For integers k>=1 and n>=3 let a_k(n) be the positive reduced denominator of the literal rational continued fraction with tail -k, namely 1/(2-3/(3-4/(...-(n)/(-k)))). Define

 Q_k(n)=n^2+(k-2)n-k,
 D=k^2+4,
 B=max(1024,k^2+k+1), P=Q_k(B).

Then:

1. For n>=B, a_k(n) is 1 or prime. Its unique surviving prime p, if any, is characterized exactly by either (i) p>n and p divides Q_k(n), or (ii) n/2<p<=n and p^2 divides Q_k(n).
2. For every prime p>P, the full occurrence count over ALL n>=3 is
   N_k(p)=1+Legendre(D,p)+[D+8p^2 is an integer square]+[D+12p^2 is an integer square].
   In particular at most four occurrences, and all extra occurrences correspond to explicit generalized Pell equations. No assertion of infinitely many Pell-prime occurrences.

### Proof of factorial cancellation (known identity, independent derivation)

Represent j-(j+1)/x by the matrix M_j=[[j,-(j+1)],[1,0]], determinant j+1. The product M_2...M_(n-1) has first row (n-1,-n(n-2)); verify the base n=3 and multiply on the right by M_n for the induction. The product determinant is n!/2. The vector input (-k,1) gives top T=-Q_k(n) and bottom S. Every intermediate expression is well-defined: for a fixed start j>=2 the first-row coefficient A_j(r) of M_j...M_(r-1) has A_j(j)=1,A_j(j+1)=j and recurrence A_j(r+1)=r(A_j(r)-A_j(r-1)). For r>=j+1, induction on r gives A_j(r)>0 and A_j(r)/A_j(r-1)>=(r-1)/(r-2) (base j>=j/(j-1)); the next ratio is r(1-A_j(r-1)/A_j(r))>=r/(r-1). The second coefficient for r>=j+1 is -r A_j(r-1). Thus each subproduct applied to (-k,1) has strictly negative first component; no zero arises in the literal fold. The reciprocal is S/T. With a=n-1 and c the bottom-left matrix entry, aS-cT=det M. Since gcd(a,T)=1 (Q_k(n) congruent -1 mod n-1), this implies gcd(T,S)=gcd(T,det M). Hence a_k(n)=Q_k(n)/gcd(Q_k(n),n!/2).

### Proof of eventual classification

Fix n>=B. Then 0<Q_k(n)<2n^2. For every prime p<=n/2 we have p^(v_p(n!/2)+1)>2n^2, as follows.
- For p<=sqrt(n), t=floor sqrt(n)>=32. The valuation is at least floor(n/p)-1, so p^(v+1)>=2^t>2(t+1)^4>2n^2. The strict middle inequality follows at t=32 by arithmetic and inductively since ((t+2)/(t+1))^4<= (34/33)^4<2.
- For sqrt(n)<p<=n/4, p is odd and v>=4, so p^(v+1)>n^(5/2)>2n^2.
- For n/4<p<=n/2, p is odd and v>=2, so p^(v+1)>n^3/64>=2n^2.

Thus every such prime is canceled. For n/2<p<=n, the valuation is precisely one, and p^3>n^3/8>2n^2; hence a surviving factor is exactly p, possible iff p^2 divides Q. Two such squared primes cannot divide Q because their product exceeds n^4/16>2n^2. Nor can such a square coexist with a prime q>n since p^2 q>n^3/4>2n^2.

Finally if two prime factors p,q>n (allowing p=q) divide Q with multiplicity, then Q=pq, since an extra factor would be >=2. Write p=n+u,q=n+v with u,v>=1. Comparing coefficients gives (k-2-u-v)n=uv+k>0. Thus u+v<=k-3 and uv+k<=k^2+k<n, contradicting the positive integer multiplier of n. Hence at most one prime above n can survive, with exponent one. All stated alternatives are necessary and sufficient by the factorial valuations.

### Proof of exact large-prime count

Let p>P. In the finite prefix 3<=n<B, Q_k(n)<P<p, so p cannot occur there. Also p>D, p>2k and p is odd. For n>=B with n<p, the preceding classification says a_k(n)=p iff p divides Q_k(n). The quadratic congruence is (2n+k-2)^2=D mod p, so it has 1+Legendre(D,p) solutions in 0<=n<p. No solution can lie below B because 0<|Q_k(n)|<p there (Q_k(0)=-k,Q_k(1)=-1,Q_k(2)=k). Thus all these roots are genuine occurrences.

For n>=p, classification requires p<=n<2p and p^2 divides Q. Here Q<4p^2+2kp<5p^2. So Q=t p^2 for t in {1,2,3,4}. For t=s^2 (s=1,2), completing the square yields (2n+k-2-2sp)(2n+k-2+2sp)=D. Both factors are positive since the sum 2n+k-2 is positive and its square exceeds (2sp)^2. Their product is greater than 4sp>D, contradiction. Only t=2,3 remain. Each equation has at most one solution n (strict monotonicity). It has a solution in p<n<2p iff D+4tp^2 is a square: the square root has the required parity because D congruent (k-2)^2 mod 4, and n=(sqrt(D+4tp^2)-(k-2))/2 is an integer; Q(p)<2p^2 and Q(2p)>3p^2, so monotonicity gives the interval. Such n satisfies the sufficient surviving-square condition. Counting these disjoint possibilities proves the formula.

## Exact executed challenges (Python, standard Fraction + SymPy)

3552 independent literal-fold vs valuation checks; 10000 eventual-classification checks; 2000 large-prime Hensel-lift count checks (sample had zero extras, so explicit small Pell examples in prior literature are not claimed tested by that sample). Direct literal witnesses:
- k=1,n=62,m=138: both denominators199, Q values3781,18905; gcd3781.
- k=4,n=116,m=193: both denominators311, Q values13684,37631; gcd3421.
These verify both supplementary disproofs by exact rational arithmetic independent of earlier certificate failures. They are not Lean results.

Reproduction code (executed):
```python
from math import gcd,isqrt
from fractions import Fraction
from collections import Counter
from sympy import factorint,isprime,nextprime,sqrt_mod,legendre_symbol
def Q(k,n): return n*n+(k-2)*n-k
def literal(k,n):
    x=Fraction(-k)
    for j in range(n-1,1,-1):
        assert x
        x=j-Fraction(j+1)/x
    return (1/x).denominator
def valfact(n,p):
    v=0
    while n: n//=p;v+=n
    return v-(p==2)
def denom(k,n):
    out=1
    for p,e in factorint(Q(k,n)).items():
        out*=int(p)**max(0,e-valfact(n,int(p)))
    return out
ct=0
for k in range(1,25):
    for n in range(3,151):
        assert literal(k,n)==denom(k,n)
        ct+=1
print("literal crosschecks",ct)
ct=0
for k in range(1,41):
    B=max(1024,k*k+k+1)
    for n in range(B,B+250):
        a=denom(k,n)
        assert a==1 or isprime(a)
        expected=[int(p) for p,e in factorint(Q(k,n)).items() if p>n or (2*p>n>=p and e>=2)]
        assert len(expected)<=1 and a==(expected[0] if expected else 1)
        ct+=1
print("eventual classification exact checks",ct)
ct=0;extras=Counter()
for k in range(1,41):
    B=max(1024,k*k+k+1);D=k*k+4;P=Q(k,B);p=P
    for _ in range(50):
        p=int(nextprime(p))
        roots=sorted({((int(s)-(k-2))*pow(2,-1,p))%p for s in sqrt_mod(D,p,all_roots=True)})
        inds=[]
        for n in roots:
            assert n>=B and denom(k,n)==p
            inds.append(n)
            lift=(-((Q(k,n)//p)*pow(2*n+k-2,-1,p)))%p
            j=n+p*lift
            assert Q(k,j)%(p*p)==0
            if p<=j<2*p:
                assert denom(k,j)==p
                inds.append(j)
                extras[Q(k,j)//(p*p)]+=1
        expected=1+int(legendre_symbol(D,p))+sum(isqrt(D+4*t*p*p)**2==D+4*t*p*p for t in (2,3))
        assert len(inds)==expected
        ct+=1
print("large-prime Hensel crosschecks",ct,"extra occurrences in sample",dict(extras))
for k,n,m in [(1,62,138),(4,116,193)]:
    p=literal(k,n); q=literal(k,m)
    print("literal witness",k,n,m,p,q,Q(k,n),Q(k,m),gcd(Q(k,n),Q(k,m)))
    assert p==q and isprime(p) and gcd(Q(k,n),Q(k,m))!=p
```

## RESUME HERE

1. Reconcile main merged A329813 credit and new duplicate gates in master ledger (do not overwrite peer edits). 
2. Retrieve full Gracia Llorente original paper and check whether the general-tail theorem already appears. Until then no priority claim, no new problem count. For the exact GCD targets, examine prior repaired probe actual per-file exits/axioms (do not infer pass from upload or workflow green), official source eligibility and complete history; do not register already-known multiplicity claims. 
3. A372561 only registration at fresh search: coordinate with root/reversal before any exact imported-target fixture/claim; no new publication while current join rules/verification unavailable. No schedule changes.

## Strengthening: four occurrences are impossible for sufficiently large primes

The two square indicators cannot both be true, by elementary congruences. For odd p:

- If k is odd then k^2+4+8p^2 is 5 modulo 8, not a square.
- If k=2h is even and h is even, (D+8p^2)/4=h^2+1+2p^2 is 3 modulo 4, not a square. If D+8p^2 were a square its root would be even, so the division by 4 is legitimate.
- Consequently the t=2 extra branch requires k congruent 2 modulo 4. For this case h is odd, and (D+12p^2)/4=h^2+1+3p^2 is 5 modulo 8, so the t=3 branch is impossible.
- The t=3 branch additionally requires 3|k, since D+12p^2 is k^2+1 modulo 3.

Thus for each fixed positive k and all primes p>P, **N_k(p) belongs to {0,2,3}**. Precisely one of the two explicit Pell tests can supply a third occurrence; the earlier at-most-four bound is strengthened, not contradicted. Exhaustive 512 modular residue challenges (k mod32, odd p mod32) passed.

Positive-branch tests were added so that the previously tested sample, which had no extras, does not hide a vacuous check. Both examples are primes above the explicit P threshold and smaller than 2^64 (SymPy exact deterministic primality range). Independent valuation and Hensel-root checks passed:
- k=2, t=2, p=9369319: n=13250218, earlier roots 3880899 and 5488420. Exactly three occurrences. This is the classical previously studied k=2 Pell branch.
- k=3, t=3, p=8919301: n=15448682, earlier roots 2389919 and 6529381. Exactly three occurrences. No historical priority claim.

Reproduce by solving u^2-4t p^2=D with small positive seed p<=400 and multiplying u+p sqrt(4t) by its Pell unit 3+sqrt(8) for t=2 or 7+2sqrt(12) for t=3. Test each candidate p for primality, threshold, exact Q=t p^2 and factorial valuation. The two below-p roots arise from square roots of D mod p; independently lift each to modulo p^2 using the inverse of 2n+k-2 and count those in [p,2p). Compare to the square indicator count. All the displayed indices were produced and checked in the current run, not extrapolated.

Final status unchanged: complete informal theorem and executed independent challenges, no new Lean-certified or officially accepted target. Full general-tail primary-literature gate remains open.
